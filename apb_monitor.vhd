library ieee;
use ieee.std_logic_1164.all;

entity apb_monitor is
  port(
    -- APB input control signals
    PENABLE : in std_logic;             -- APB enable signal
    PSEL    : in std_logic;             -- APB slave select from master
    PWRITE  : in std_logic;             -- APB direction setting

    -- APB input and addr
    PADDR  : in std_logic_vector(31 downto 0);  -- APB address
    PWDATA : in std_logic_vector(31 downto 0);  -- APB write data

    -- APB output signals
    PRDATA  : out std_logic_vector(31 downto 0);  -- APB read data
    PREADY  : out std_logic;  -- APB hold signal, for RW longer than 2 cycles
    PSLVERR : out std_logic;

    -- Reset, Clock
    HRESETn : in std_logic;
    HCLK    : in std_logic
    );
end apb_monitor;

architecture architecture_apb_monitor of apb_monitor is

  constant ADDR_reg_tpl_kern_srunning          : std_logic_vector(31 downto 0) := X"1A108000";
  constant ADDR_reg_tpl_kern_selected          : std_logic_vector(31 downto 0) := X"1A108004";
  constant ADDR_reg_tpl_kern_running           : std_logic_vector(31 downto 0) := X"1A108008";
  constant ADDR_reg_tpl_kern_elected           : std_logic_vector(31 downto 0) := X"1A10800C";
  constant ADDR_reg_tpl_kern_runningID         : std_logic_vector(31 downto 0) := X"1A108010";
  constant ADDR_reg_tpl_kern_electedID         : std_logic_vector(31 downto 0) := X"1A108014";
  constant ADDR_tpl_kern_need_switch           : std_logic_vector(31 downto 0) := X"1A108018";
  constant ADDR_tpl_kern_need_schedule         : std_logic_vector(31 downto 0) := X"1A10801C";
  constant ADDR_reg_OS_instru_kernel_functions : std_logic_vector(31 downto 0) := X"1A108020";
  constant ADDR_reg_OS_instru_service          : std_logic_vector(31 downto 0) := X"1A108024";
  constant ADDR_reg_return                     : std_logic_vector(31 downto 0) := X"1A108028";
  constant ADDR_reg_config                     : std_logic_vector(31 downto 0) := X"1A10802C";
  constant ADDR_reg_return_2                   : std_logic_vector(31 downto 0) := X"1A108030";

  signal reg_tpl_kern_srunning          : std_logic_vector(31 downto 0);
  signal reg_tpl_kern_selected          : std_logic_vector(31 downto 0);
  signal reg_tpl_kern_running           : std_logic_vector(31 downto 0);
  signal reg_tpl_kern_elected           : std_logic_vector(31 downto 0);
  signal reg_tpl_kern_runningID         : std_logic_vector(31 downto 0);
  signal reg_tpl_kern_electedID         : std_logic_vector(31 downto 0);
  signal tpl_kern_need_switch           : std_logic_vector(1 downto 0);
  signal tpl_kern_need_schedule         : std_logic;
  signal reg_OS_instru_service          : std_logic_vector(31 downto 0);
  signal reg_OS_instru_kernel_functions : std_logic_vector(31 downto 0);
  signal reg_config                     : std_logic_vector(31 downto 0);
  signal reg_return                     : std_logic_vector(31 downto 0);
  signal reg_return_2                   : std_logic_vector(31 downto 0);

  -- tpl_kern state machine
  signal kernel_state_bits : std_logic_vector(2 downto 0);
  signal kernel_state      : std_logic_vector(7 downto 0);

  component trampoline_properties is
    port (
      clk                       : in  std_logic;
      reset_n                   : in  std_logic;
      E0                        : in  std_logic;
      E1                        : in  std_logic;
      E2                        : in  std_logic;
      E3                        : in  std_logic;
      E4                        : in  std_logic;
      E5                        : in  std_logic;
      E6                        : in  std_logic;
      E7                        : in  std_logic;
      call_handler              : in  std_logic;
      call_service              : in  std_logic;
      call_context              : in  std_logic;
      compare_entries           : in  std_logic;
      bubble_up                 : in  std_logic;
      bubble_down               : in  std_logic;
      put_new_proc              : in  std_logic;
      put_preempted_proc        : in  std_logic;
      remove_front_proc         : in  std_logic;
      get_internal_resource     : in  std_logic;
      release_internal_resource : in  std_logic;
      preempt                   : in  std_logic;
      run_elected               : in  std_logic;
      start                     : in  std_logic;
      schedule_from_running     : in  std_logic;
      terminate                 : in  std_logic;
      block_s                   : in  std_logic;
      activate_task             : in  std_logic;
      release                   : in  std_logic;
      set_event                 : in  std_logic;
      init_proc                 : in  std_logic;
      init_os                   : in  std_logic;
      remove_proc               : in  std_logic;
      start_scheduling          : in  std_logic;
      action_activate_task      : in  std_logic;
      action_set_event          : in  std_logic;
      call_save                 : in  std_logic;
      reset                     : in  std_logic;
      enable_IT                 : in  std_logic;
      pending                   : out std_logic;
      valid                     : out std_logic;
      valid_8_Prop1             : out std_logic;
      valid_9_Prop2             : out std_logic;
      valid_10_Prop3            : out std_logic;
      valid_11_Prop4            : out std_logic;
      valid_12_Prop5            : out std_logic;
      valid_13_Prop6            : out std_logic;
      valid_14_Prop7            : out std_logic;
      valid_15_Prop8            : out std_logic);
  end component trampoline_properties;

  -- Atomics
  signal E0                        : std_logic;
  signal E1                        : std_logic;
  signal E2                        : std_logic;
  signal E3                        : std_logic;
  signal E4                        : std_logic;
  signal E5                        : std_logic;
  signal E6                        : std_logic;
  signal E7                        : std_logic;
  signal call_handler              : std_logic;
  signal call_service              : std_logic;
  signal call_context              : std_logic;
  signal compare_entries           : std_logic;
  signal bubble_up                 : std_logic;
  signal bubble_down               : std_logic;
  signal put_new_proc              : std_logic;
  signal put_preempted_proc        : std_logic;
  signal remove_front_proc         : std_logic;
  signal get_internal_resource     : std_logic;
  signal release_internal_resource : std_logic;
  signal preempt                   : std_logic;
  signal run_elected               : std_logic;
  signal start                     : std_logic;
  signal schedule_from_running     : std_logic;
  signal terminate                 : std_logic;
  signal block_s                   : std_logic;
  signal activate_task             : std_logic;
  signal release                   : std_logic;
  signal set_event                 : std_logic;
  signal init_proc                 : std_logic;
  signal init_os                   : std_logic;
  signal remove_proc               : std_logic;
  signal start_scheduling          : std_logic;
  signal action_activate_task      : std_logic;
  signal action_set_event          : std_logic;
  signal call_save                 : std_logic;
  signal reset                     : std_logic;
  signal enable_IT                 : std_logic;

  -- Monitor evaluation
  signal valid : std_logic;
begin

  -- Default affectations
  PSLVERR <= '0';
  PREADY  <= '1';

  -- Kernel state
  kernel_state_bits <= tpl_kern_need_schedule & tpl_kern_need_switch;

  -- Atomics
  E0                        <= kernel_state(0);
  E1                        <= kernel_state(1);
  E2                        <= kernel_state(2);
  E3                        <= kernel_state(3);
  E4                        <= kernel_state(4);
  E5                        <= kernel_state(5);
  E6                        <= kernel_state(6);
  E7                        <= kernel_state(7);
  call_handler              <= reg_OS_instru_kernel_functions(0);
  call_service              <= reg_OS_instru_kernel_functions(1);
  call_context              <= reg_OS_instru_kernel_functions(2);
  compare_entries           <= reg_OS_instru_kernel_functions(3);
  bubble_up                 <= reg_OS_instru_kernel_functions(4);
  bubble_down               <= reg_OS_instru_kernel_functions(5);
  put_new_proc              <= reg_OS_instru_kernel_functions(6);
  put_preempted_proc        <= reg_OS_instru_kernel_functions(7);
  remove_front_proc         <= reg_OS_instru_kernel_functions(8);
  get_internal_resource     <= reg_OS_instru_kernel_functions(9);
  release_internal_resource <= reg_OS_instru_kernel_functions(10);
  preempt                   <= reg_OS_instru_kernel_functions(11);
  run_elected               <= reg_OS_instru_kernel_functions(12);
  start                     <= reg_OS_instru_kernel_functions(13);
  schedule_from_running     <= reg_OS_instru_kernel_functions(14);
  terminate                 <= reg_OS_instru_kernel_functions(15);
  block_s                   <= reg_OS_instru_kernel_functions(16);
  activate_task             <= reg_OS_instru_kernel_functions(17);
  release                   <= reg_OS_instru_kernel_functions(18);
  set_event                 <= reg_OS_instru_kernel_functions(19);
  init_proc                 <= reg_OS_instru_kernel_functions(20);
  init_os                   <= reg_OS_instru_kernel_functions(21);
  remove_proc               <= reg_OS_instru_kernel_functions(22);
  start_scheduling          <= reg_OS_instru_kernel_functions(23);
  action_activate_task      <= reg_OS_instru_kernel_functions(24);
  action_set_event          <= reg_OS_instru_kernel_functions(25);
  call_save                 <= reg_OS_instru_kernel_functions(26);
  reset                     <= reg_config(0);
  enable_IT                 <= reg_config(1);

  sequential_process : process (HCLK, HRESETn) is
  begin  -- process sequential_process
    if HRESETn = '0' then                 -- asynchronous reset (active low)
      reg_tpl_kern_srunning          <= (others => '0');
      reg_tpl_kern_selected          <= (others => '0');
      reg_tpl_kern_running           <= (others => '0');
      reg_tpl_kern_elected           <= (others => '0');
      reg_tpl_kern_runningID         <= (others => '1');
      reg_tpl_kern_electedID         <= (others => '1');
      tpl_kern_need_switch           <= (others => '0');
      tpl_kern_need_schedule         <= '0';
      reg_OS_instru_service          <= (others => '0');
      reg_OS_instru_kernel_functions <= (others => '0');
      reg_config                     <= (others => '0');
      reg_return                     <= (others => '0');
      reg_return_2                   <= (others => '0');
    elsif HCLK'event and HCLK = '1' then  -- rising clock edge
      if (PSEL = '1' and PENABLE = '1') then

        -- Reading APB bus (CPU to Fabric)
        if(PWRITE = '1') then
          case PADDR is
            when ADDR_reg_tpl_kern_srunning          => reg_tpl_kern_srunning          <= PWDATA;
            when ADDR_reg_tpl_kern_selected          => reg_tpl_kern_selected          <= PWDATA;
            when ADDR_reg_tpl_kern_running           => reg_tpl_kern_running           <= PWDATA;
            when ADDR_reg_tpl_kern_elected           => reg_tpl_kern_elected           <= PWDATA;
            when ADDR_reg_tpl_kern_runningID         => reg_tpl_kern_runningID         <= PWDATA;
            when ADDR_reg_tpl_kern_electedID         => reg_tpl_kern_electedID         <= PWDATA;
            when ADDR_tpl_kern_need_switch           => tpl_kern_need_switch           <= PWDATA(1 downto 0);
            when ADDR_tpl_kern_need_schedule         => tpl_kern_need_schedule         <= PWDATA(0);
            when ADDR_reg_OS_instru_service          => reg_OS_instru_service          <= PWDATA;
            when ADDR_reg_OS_instru_kernel_functions => reg_OS_instru_kernel_functions <= PWDATA xor reg_OS_instru_kernel_functions;
            when ADDR_reg_config                     => reg_config                     <= PWDATA;
            when others                              => null;
          end case;
        end if;

      end if;
    end if;
  end process sequential_process;

  combinational_process : process (PADDR, PENABLE, PSEL, PWRITE,
                                   kernel_state_bits,
                                   reg_OS_instru_kernel_functions,
                                   reg_OS_instru_service, reg_config,
                                   reg_return, reg_return_2,
                                   reg_tpl_kern_elected,
                                   reg_tpl_kern_electedID,
                                   reg_tpl_kern_running,
                                   reg_tpl_kern_runningID,
                                   reg_tpl_kern_selected,
                                   reg_tpl_kern_srunning,
                                   tpl_kern_need_schedule,
                                   tpl_kern_need_switch) is
  begin  -- process combinational_process
    -- Writing APB bus (Fabric to CPU)
    if (PWRITE = '0' and PSEL = '1' and PENABLE = '1') then
      case PADDR is
        when ADDR_reg_tpl_kern_srunning          => PRDATA <= reg_tpl_kern_srunning;
        when ADDR_reg_tpl_kern_selected          => PRDATA <= reg_tpl_kern_selected;
        when ADDR_reg_tpl_kern_running           => PRDATA <= reg_tpl_kern_running;
        when ADDR_reg_tpl_kern_elected           => PRDATA <= reg_tpl_kern_elected;
        when ADDR_reg_tpl_kern_runningID         => PRDATA <= reg_tpl_kern_runningID;
        when ADDR_reg_tpl_kern_electedID         => PRDATA <= reg_tpl_kern_electedID;
        when ADDR_tpl_kern_need_switch           => PRDATA <= (X"0000000" & "00" & tpl_kern_need_switch);
        when ADDR_tpl_kern_need_schedule         => PRDATA <= (X"0000000" & "000" & tpl_kern_need_schedule);
        when ADDR_reg_OS_instru_service          => PRDATA <= reg_OS_instru_service;
        when ADDR_reg_OS_instru_kernel_functions => PRDATA <= reg_OS_instru_kernel_functions;
        when ADDR_reg_config                     => PRDATA <= reg_config;
        when ADDR_reg_return                     => PRDATA <= reg_return;
        when ADDR_reg_return_2                   => PRDATA <= reg_return_2;
        when others                              => PRDATA <= (others => '0');
      end case;
    end if;

    -- State machine, binary to one hot
    case kernel_state_bits is
      when "000"  => kernel_state <= "00000001";
      when "001"  => kernel_state <= "00000010";
      when "010"  => kernel_state <= "00000100";
      when "011"  => kernel_state <= "00001000";
      when "100"  => kernel_state <= "00010000";
      when "101"  => kernel_state <= "00100000";
      when "110"  => kernel_state <= "01000000";
      when others => kernel_state <= "10000000";
    end case;
  end process combinational_process;

  trampoline_properties_monitor : trampoline_properties
    port map (
      clk                       => HCLK,
      reset_n                   => HRESETn,
      E0                        => E0,
      E1                        => E1,
      E2                        => E2,
      E3                        => E3,
      E4                        => E4,
      E5                        => E5,
      E6                        => E6,
      E7                        => E7,
      call_handler              => call_handler,
      call_service              => call_service,
      call_context              => call_context,
      compare_entries           => compare_entries,
      bubble_up                 => bubble_up,
      bubble_down               => bubble_down,
      put_new_proc              => put_new_proc,
      put_preempted_proc        => put_preempted_proc,
      remove_front_proc         => remove_front_proc,
      get_internal_resource     => get_internal_resource,
      release_internal_resource => release_internal_resource,
      preempt                   => preempt,
      run_elected               => run_elected,
      start                     => start,
      schedule_from_running     => schedule_from_running,
      terminate                 => terminate,
      block_s                   => block_s,
      activate_task             => activate_task,
      release                   => release,
      set_event                 => set_event,
      init_proc                 => init_proc,
      init_os                   => init_os,
      remove_proc               => remove_proc,
      start_scheduling          => start_scheduling,
      action_activate_task      => action_activate_task,
      action_set_event          => action_set_event,
      call_save                 => call_save,
      reset                     => reset,
      enable_IT                 => enable_IT,
      valid                     => valid);

  -- psl default clock is (HCLK'event and HCLK = '1');

  -- psl property Prop1 is always(not(E2) and not(E6));
  -- psl assert Prop1;

  -- psl property Prop2 is always(fell(E0) -> (E1 or E3 or E4));
  -- psl assert Prop2;

  -- psl property Prop3 is always(fell(E1) -> (E0));
  -- psl assert Prop3;

  -- psl property Prop4 is always(fell(E3) -> (E0));
  -- psl assert Prop4;

  -- psl property Prop5 is always(fell(E4) -> (E0 or E5 or E7));
  -- psl assert Prop5;

  -- psl property Prop6 is always(fell(E5) -> (E1));
  -- psl assert Prop6;

  -- psl property Prop7 is always(fell(E7) -> (E3));
  -- psl assert Prop7;

  -- psl property Prop8 is always(rose(E4) -> next(run_elected));
  -- psl assert Prop8;

  -- psl property Prop9 is always(rose(call_handler) -> run_elected);
  -- psl assert Prop9;

  -- psl property Prop10 is always(fell(call_handler) -> run_elected);
  -- psl assert Prop10;

  -- psl property Prop11 is always(rose(call_service) -> E0);
  -- psl assert Prop11;

  -- psl property Prop12 is always(fell(call_service) -> (not(E5) and not(E7)));
  -- psl assert Prop12;

  -- psl property Prop13 is always(rose(call_context) -> (E1 or E3));
  -- psl assert Prop13;

  -- psl property Prop14 is always(fell(call_context) -> run_elected);
  -- psl assert Prop14;

  -- psl property Prop15 is always(call_service -> call_handler);
  -- psl assert Prop15;

  -- psl property Prop16 is always(call_context -> call_handler);
  -- psl assert Prop16;

  -- psl property Prop17 is always(rose(call_save) -> (E3 and call_context));
  -- psl assert Prop17;


end architecture_apb_monitor;
