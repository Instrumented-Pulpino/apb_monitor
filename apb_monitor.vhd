library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
    HCLK    : in std_logic;

    monitor_valid : out std_logic
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
  constant ADDR_reg_OS_instru_service          : std_logic_vector(31 downto 0) := X"1A108020";
  constant ADDR_reg_OS_instru_kernel_functions : std_logic_vector(31 downto 0) := X"1A108024";
  constant ADDR_reg_OS_reentrancy_counter      : std_logic_vector(31 downto 0) := X"1A108028";
  constant ADDR_reg_config                     : std_logic_vector(31 downto 0) := X"1A10802C";

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
  signal reg_OS_reentrancy_counter      : unsigned(31 downto 0);

  -- tpl_kern state machine
  signal kernel_state_bits : std_logic_vector(2 downto 0);
  signal kernel_state      : std_logic_vector(7 downto 0);

  component trampoline_properties is
    port (
      clk                           : in  std_logic;
      reset_n                       : in  std_logic;
      E0                            : in  std_logic;
      E1                            : in  std_logic;
      E2                            : in  std_logic;
      E3                            : in  std_logic;
      E4                            : in  std_logic;
      E5                            : in  std_logic;
      E6                            : in  std_logic;
      E7                            : in  std_logic;
      reentrancy_level_1            : in  std_logic;
      call_handler                  : in  std_logic;
      call_service                  : in  std_logic;
      call_context                  : in  std_logic;
      compare_entries               : in  std_logic;
      bubble_up                     : in  std_logic;
      bubble_down                   : in  std_logic;
      put_new_proc                  : in  std_logic;
      put_preempted_proc            : in  std_logic;
      remove_front_proc             : in  std_logic;
      get_internal_resource         : in  std_logic;
      release_internal_resource     : in  std_logic;
      preempt                       : in  std_logic;
      run_elected                   : in  std_logic;
      running_equal_elected         : in  std_logic;
      start                         : in  std_logic;
      schedule_from_running         : in  std_logic;
      terminate                     : in  std_logic;
      block_s                       : in  std_logic;
      activate_task                 : in  std_logic;
      release                       : in  std_logic;
      set_event                     : in  std_logic;
      init_proc                     : in  std_logic;
      init_os                       : in  std_logic;
      remove_proc                   : in  std_logic;
      start_scheduling              : in  std_logic;
      action_activate_task          : in  std_logic;
      action_set_event              : in  std_logic;
      call_save                     : in  std_logic;
      central_interrupt_handler     : in  std_logic;
      activate_isr2                 : in  std_logic;
      counter_tick                  : in  std_logic;
      notify_receiving_mos          : in  std_logic;
      activate_task_service         : in  std_logic;
      terminate_task_service        : in  std_logic;
      chain_task_service            : in  std_logic;
      schedule_service              : in  std_logic;
      set_event_service             : in  std_logic;
      wait_event_service            : in  std_logic;
      release_resource_service      : in  std_logic;
      start_os_service              : in  std_logic;
      terminate_isr2_service        : in  std_logic;
      terminate_application_service : in  std_logic;
      increment_counter_service     : in  std_logic;
      call_terminate_task_service   : in  std_logic;
      reset                         : in  std_logic;
      enable_IT                     : in  std_logic;
      pending                       : out std_logic;
      valid                         : out std_logic;
      valid_47_Prop01               : out std_logic;
      valid_48_Prop02               : out std_logic;
      valid_49_Prop03               : out std_logic;
      valid_50_Prop04               : out std_logic;
      valid_51_Prop05               : out std_logic;
      valid_52_Prop06               : out std_logic;
      valid_53_Prop07               : out std_logic;
      valid_54_Prop08               : out std_logic;
      valid_55_Prop09               : out std_logic;
      valid_56_Prop10               : out std_logic;
      valid_57_Prop11               : out std_logic;
      valid_58_Prop12               : out std_logic;
      valid_59_Prop13               : out std_logic;
      valid_60_Prop14               : out std_logic;
      valid_61_Prop15               : out std_logic;
      valid_62_Prop16               : out std_logic;
      valid_63_Prop17               : out std_logic;
      valid_64_Prop18               : out std_logic;
      valid_65_Prop19               : out std_logic;
      valid_66_Prop20               : out std_logic;
      valid_67_Prop21               : out std_logic;
      valid_68_Prop22               : out std_logic;
      valid_69_Prop23               : out std_logic;
      valid_70_Prop24               : out std_logic;
      valid_71_Prop25               : out std_logic;
      valid_72_Prop26               : out std_logic;
      valid_73_Prop27               : out std_logic;
      valid_74_Prop28               : out std_logic;
      valid_75_Prop29               : out std_logic;
      valid_76_Prop30               : out std_logic;
      valid_77_Prop31               : out std_logic;
      valid_78_Prop32               : out std_logic;
      valid_79_Prop33               : out std_logic;
      valid_80_Prop34               : out std_logic;
      valid_81_Prop35               : out std_logic;
      valid_82_Prop36               : out std_logic;
      valid_83_Prop37               : out std_logic;
      valid_84_Prop38               : out std_logic;
      valid_85_Prop39               : out std_logic;
      valid_86_Prop40               : out std_logic;
      valid_87_Prop41               : out std_logic;
      valid_88_Prop42               : out std_logic;
      valid_89_Prop43               : out std_logic;
      valid_90_Prop44               : out std_logic;
      valid_91_Prop45               : out std_logic;
      valid_92_Prop46               : out std_logic;
      valid_93_Prop47               : out std_logic);
  end component trampoline_properties;

  -- Atomics
  signal E0                            : std_logic;
  signal E1                            : std_logic;
  signal E2                            : std_logic;
  signal E3                            : std_logic;
  signal E4                            : std_logic;
  signal E5                            : std_logic;
  signal E6                            : std_logic;
  signal E7                            : std_logic;
  signal running_equal_elected         : std_logic;
  signal reentrancy_level_1            : std_logic;
  signal call_handler                  : std_logic;
  signal call_service                  : std_logic;
  signal call_context                  : std_logic;
  signal compare_entries               : std_logic;
  signal bubble_up                     : std_logic;
  signal bubble_down                   : std_logic;
  signal put_new_proc                  : std_logic;
  signal put_preempted_proc            : std_logic;
  signal remove_front_proc             : std_logic;
  signal get_internal_resource         : std_logic;
  signal release_internal_resource     : std_logic;
  signal preempt                       : std_logic;
  signal run_elected                   : std_logic;
  signal start                         : std_logic;
  signal schedule_from_running         : std_logic;
  signal terminate                     : std_logic;
  signal block_s                       : std_logic;
  signal activate_task                 : std_logic;
  signal release                       : std_logic;
  signal set_event                     : std_logic;
  signal init_proc                     : std_logic;
  signal init_os                       : std_logic;
  signal remove_proc                   : std_logic;
  signal start_scheduling              : std_logic;
  signal action_activate_task          : std_logic;
  signal action_set_event              : std_logic;
  signal central_interrupt_handler     : std_logic;
  signal activate_isr2                 : std_logic;
  signal counter_tick                  : std_logic;
  signal call_save                     : std_logic;
  signal notify_receiving_mos          : std_logic;
  signal activate_task_service         : std_logic;
  signal terminate_task_service        : std_logic;
  signal chain_task_service            : std_logic;
  signal schedule_service              : std_logic;
  signal set_event_service             : std_logic;
  signal wait_event_service            : std_logic;
  signal release_resource_service      : std_logic;
  signal start_os_service              : std_logic;
  signal terminate_isr2_service        : std_logic;
  signal terminate_application_service : std_logic;
  signal increment_counter_service     : std_logic;
  signal call_terminate_task_service   : std_logic;
  signal reset                         : std_logic;
  signal enable_IT                     : std_logic;

  component services is
    port (
      clk                           : in  std_logic;
      reset_n                       : in  std_logic;
      trigger                       : in  std_logic;
      reg_OS_instru_service         : in  std_logic_vector(31 downto 0);
      activate_task_service         : out std_logic;
      terminate_task_service        : out std_logic;
      chain_task_service            : out std_logic;
      schedule_service              : out std_logic;
      set_event_service             : out std_logic;
      wait_event_service            : out std_logic;
      release_resource_service      : out std_logic;
      start_os_service              : out std_logic;
      terminate_isr2_service        : out std_logic;
      terminate_application_service : out std_logic;
      increment_counter_service     : out std_logic;
      call_terminate_task_service   : out std_logic
      );
  end component services;
  signal trigger : std_logic;

  -- Monitor evaluation
  signal valid              : std_logic;
  signal monitor_valid_i    : std_logic;
  signal next_monitor_valid : std_logic;
begin

  -- Default affectations
  PSLVERR       <= '0';
  PREADY        <= '1';
  monitor_valid <= monitor_valid_i;

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
  running_equal_elected     <= '1' when (reg_tpl_kern_running = reg_tpl_kern_elected) else '0';
  reentrancy_level_1        <= '1' when (unsigned(reg_OS_reentrancy_counter) = 1)     else '0';
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
  central_interrupt_handler <= reg_OS_instru_kernel_functions(26);
  activate_isr2             <= reg_OS_instru_kernel_functions(27);
  counter_tick              <= reg_OS_instru_kernel_functions(28);
  call_save                 <= reg_OS_instru_kernel_functions(29);
  notify_receiving_mos      <= reg_OS_instru_kernel_functions(30);
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
      reg_OS_reentrancy_counter      <= (others => '0');
      reg_config                     <= (others => '0');
      trigger                        <= '0';
      monitor_valid_i                <= '0';
    elsif HCLK'event and HCLK = '1' then  -- rising clock edge
      -- Default assignment
      trigger         <= '0';
      monitor_valid_i <= next_monitor_valid;

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
            when ADDR_reg_OS_instru_service          => reg_OS_instru_service          <= PWDATA; trigger <= '1';
            when ADDR_reg_OS_instru_kernel_functions => reg_OS_instru_kernel_functions <= PWDATA xor reg_OS_instru_kernel_functions;
            when ADDR_reg_config                     => reg_config                     <= PWDATA;
            when ADDR_reg_OS_reentrancy_counter      => reg_OS_reentrancy_counter      <= unsigned(PWDATA);
            when others                              => null;
          end case;
        end if;

      end if;
    end if;
  end process sequential_process;

  combinational_process : process (PADDR, PENABLE, PSEL, PWRITE,
                                   kernel_state_bits, monitor_valid_i,
                                   reg_OS_instru_kernel_functions,
                                   reg_OS_instru_service,
                                   reg_OS_reentrancy_counter, reg_config,
                                   reg_tpl_kern_elected,
                                   reg_tpl_kern_electedID,
                                   reg_tpl_kern_running,
                                   reg_tpl_kern_runningID,
                                   reg_tpl_kern_selected,
                                   reg_tpl_kern_srunning,
                                   tpl_kern_need_schedule,
                                   tpl_kern_need_switch, valid) is
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
        when ADDR_reg_OS_reentrancy_counter      => PRDATA <= std_logic_vector(reg_OS_reentrancy_counter);
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

    case monitor_valid_i is
      when '0'    => next_monitor_valid <= not valid;
      when others => next_monitor_valid <= '1';
    end case;
  end process combinational_process;

  trampoline_properties_1 : trampoline_properties
    port map (
      clk                           => HCLK,
      reset_n                       => HRESETn,
      E0                            => E0,
      E1                            => E1,
      E2                            => E2,
      E3                            => E3,
      E4                            => E4,
      E5                            => E5,
      E6                            => E6,
      E7                            => E7,
      call_handler                  => call_handler,
      call_service                  => call_service,
      call_context                  => call_context,
      compare_entries               => compare_entries,
      bubble_up                     => bubble_up,
      bubble_down                   => bubble_down,
      put_new_proc                  => put_new_proc,
      put_preempted_proc            => put_preempted_proc,
      remove_front_proc             => remove_front_proc,
      get_internal_resource         => get_internal_resource,
      release_internal_resource     => release_internal_resource,
      preempt                       => preempt,
      run_elected                   => run_elected,
      running_equal_elected         => running_equal_elected,
      start                         => start,
      schedule_from_running         => schedule_from_running,
      terminate                     => terminate,
      block_s                       => block_s,
      activate_task                 => activate_task,
      release                       => release,
      set_event                     => set_event,
      init_proc                     => init_proc,
      init_os                       => init_os,
      remove_proc                   => remove_proc,
      start_scheduling              => start_scheduling,
      action_activate_task          => action_activate_task,
      action_set_event              => action_set_event,
      call_save                     => call_save,
      central_interrupt_handler     => central_interrupt_handler,
      activate_isr2                 => activate_isr2,
      counter_tick                  => counter_tick,
      notify_receiving_mos          => notify_receiving_mos,
      activate_task_service         => activate_task_service,
      terminate_task_service        => terminate_task_service,
      chain_task_service            => chain_task_service,
      schedule_service              => schedule_service,
      set_event_service             => set_event_service,
      wait_event_service            => wait_event_service,
      release_resource_service      => release_resource_service,
      start_os_service              => start_os_service,
      terminate_isr2_service        => terminate_isr2_service,
      terminate_application_service => terminate_application_service,
      increment_counter_service     => increment_counter_service,
      call_terminate_task_service   => call_terminate_task_service,
      reentrancy_level_1            => reentrancy_level_1,
      reset                         => reset,
      enable_IT                     => enable_IT,
      valid                         => valid);

  assert (HRESETn /= '1' or valid = '1') report "Valid false !" severity failure;

  services_identifier : services
    port map (
      clk                           => HCLK,
      reset_n                       => HRESETn,
      trigger                       => trigger,
      reg_OS_instru_service         => reg_OS_instru_service,
      activate_task_service         => activate_task_service,
      terminate_task_service        => terminate_task_service,
      chain_task_service            => chain_task_service,
      schedule_service              => schedule_service,
      set_event_service             => set_event_service,
      wait_event_service            => wait_event_service,
      release_resource_service      => release_resource_service,
      terminate_isr2_service        => terminate_isr2_service,
      terminate_application_service => terminate_application_service,
      increment_counter_service     => increment_counter_service,
      start_os_service              => start_os_service,
      call_terminate_task_service   => call_terminate_task_service);

  -- psl default clock is rising_edge(HCLK);

  -- psl property Prop01 is always(not(E2) and not(E6));

  -- psl property Prop02 is always(fell(E0) -> (E1 or E3 or E4));

  -- psl property Prop03 is always(fell(E1) -> (E0));

  -- psl property Prop04 is always(fell(E3) -> (E0));

  -- psl property Prop05 is always(fell(E4) -> (E0 or E5 or E7));

  -- psl property Prop06 is always(fell(E5) -> (E1));

  -- psl property Prop07 is always(fell(E7) -> (E3));

  -- psl property Prop08 is always(rose(E4) -> (running_equal_elected));

  -- psl property Prop09 is always((rose(call_handler) and (reentrancy_level_1 = '1')) -> running_equal_elected);

  -- psl property Prop10 is always((fell(call_handler) and (reentrancy_level_1 = '1')) -> running_equal_elected);

  -- psl property Prop11 is always(fell(call_handler) -> E0);

  -- psl property Prop12 is always(fell(call_service) -> (not(E5) and not(E7)));

  -- psl property Prop13 is always(rose(call_context) -> (E1 or E3));

  -- psl property Prop14 is always(rose(call_context) -> (reentrancy_level_1));

  -- psl property Prop15 is always(run_elected -> call_context);

  -- psl property Prop16 is always(call_service -> call_handler);

  -- psl property Prop17 is always(call_context -> call_handler);

  -- psl property Prop18 is always(rose(call_handler) -> (call_service before fell(call_handler)));

  -- psl property Prop19 is always(rose(call_save) -> (E3 and call_context));

  -- psl property Prop20 is always(activate_task_service -> (not(E1) and not(E5)));

  -- psl property Prop21 is always(fell(activate_task_service) -> (E0 or E3 or E4));

  -- psl property Prop22 is always(terminate_task_service -> (E0 or E1));

  -- psl property Prop23 is always(chain_task_service -> not(E3 or E7));

  -- psl property Prop24 is always(fell(chain_task_service) -> (E0 or E1));

  -- psl property Prop25 is always(schedule_service -> (E0 or E3));

  -- psl property Prop26 is always(set_event_service -> not(E1 or E5));

  -- psl property Prop27 is always(fell(set_event_service) -> (E0 or E3 or E4));

  -- psl property Prop28 is always(wait_event_service -> (E0 or E3));

  -- psl property Prop29 is always(release_resource_service -> (E0 or E3));

  -- psl property Prop30 is always(compare_entries -> (bubble_up or bubble_down));

  -- psl property Prop31 is always(bubble_up -> (put_new_proc or put_preempted_proc));

  -- psl property Prop32 is always(bubble_down -> (remove_front_proc or remove_proc));

  -- psl property Prop33 is always(put_preempted_proc -> run_elected);

  -- psl property Prop34 is always(put_new_proc -> (release or activate_task or activate_isr2));

  -- psl property Prop35 is always(remove_front_proc -> start);

  -- psl property Prop36 is always(init_proc -> start);

  -- psl property Prop37 is always(release -> set_event);

  -- psl property Prop38 is always(run_elected -> call_context);

  -- psl property Prop39 is always(start -> (schedule_from_running or terminate_task_service or terminate_isr2_service or chain_task_service or block_s or start_scheduling or release or terminate_application_service or call_terminate_task_service));

  -- psl property Prop40 is always(release_internal_resource -> (block_s or terminate or schedule_service or terminate_application_service));

  -- psl property Prop41 is always(block_s -> wait_event_service);

  -- psl property Prop42 is always(terminate -> (terminate_task_service or chain_task_service or terminate_isr2_service or terminate_application_service or call_terminate_task_service));

  -- psl property Prop43 is always(activate_task -> (activate_task_service or chain_task_service or init_os or action_activate_task or terminate_application_service));

  -- psl property Prop44 is always(set_event -> (set_event_service or action_set_event));

  -- psl property Prop45 is always(schedule_from_running -> (activate_task_service or schedule_service or set_event_service or central_interrupt_handler or release_resource_service or counter_tick or increment_counter_service or notify_receiving_mos));

  -- psl property Prop46 is always(start_scheduling -> start_os_service);

  -- psl property Prop47 is always(init_os -> start_os_service);

  -- psl assert Prop01;
  -- psl assert Prop02;
  -- psl assert Prop03;
  -- psl assert Prop04;
  -- psl assert Prop05;
  -- psl assert Prop06;
  -- psl assert Prop07;
  -- psl assert Prop08;
  -- psl assert Prop09;
  -- psl assert Prop10;
  -- psl assert Prop11;
  -- psl assert Prop12;
  -- psl assert Prop13;
  -- psl assert Prop14;
  -- psl assert Prop15;
  -- psl assert Prop16;
  -- psl assert Prop17;
  -- psl assert Prop18;
  -- psl assert Prop19;
  -- psl assert Prop20;
  -- psl assert Prop21;
  -- psl assert Prop22;
  -- psl assert Prop23;
  -- psl assert Prop24;
  -- psl assert Prop25;
  -- psl assert Prop26;
  -- psl assert Prop27;
  -- psl assert Prop28;
  -- psl assert Prop29;
  -- psl assert Prop30;
  -- psl assert Prop31;
  -- psl assert Prop32;
  -- psl assert Prop33;
  -- psl assert Prop34;
  -- psl assert Prop35;
  -- psl assert Prop36;
  -- psl assert Prop37;
  -- psl assert Prop38;
  -- psl assert Prop39;
  -- psl assert Prop40;
  -- psl assert Prop41;
  -- psl assert Prop42;
  -- psl assert Prop43;
  -- psl assert Prop44;
  -- psl assert Prop45;
  -- psl assert Prop46;
  -- psl assert Prop47;

end architecture_apb_monitor;
