library ieee;
use ieee.std_logic_1164.all;

entity apb_monitor is
  port(
    -- APB input control signals
    penable : in std_logic;             -- APB enable signal
    psel    : in std_logic;             -- APB slave select from master
    pwrite  : in std_logic;             -- APB direction setting

    -- APB input and addr
    paddr  : in std_logic_vector(31 downto 0);  -- APB address
    pwdata : in std_logic_vector(31 downto 0);  -- APB write data

    -- APB output signals
    prdata  : out std_logic_vector(31 downto 0);  -- APB read data
    pready  : out std_logic;  -- APB hold signal, for RW longer than 2 cycles
    pslverr : out std_logic;

    -- Reset, Clock
    prst : in std_logic;
    pclk : in std_logic;

    -- User Register
    reg_tpl_kern_srunning          : out std_logic_vector(31 downto 0);
    reg_tpl_kern_selected          : out std_logic_vector(31 downto 0);
    reg_tpl_kern_running           : out std_logic_vector(31 downto 0);
    reg_tpl_kern_elected           : out std_logic_vector(31 downto 0);
    reg_tpl_kern_runningID         : out std_logic_vector(31 downto 0);
    reg_tpl_kern_electedID         : out std_logic_vector(31 downto 0);
    tpl_kern_need_switch           : out std_logic_vector(1 downto 0);
    tpl_kern_need_schedule         : out std_logic;
    reset                          : out std_logic;
    enable_IT                      : out std_logic;
    reg_OS_instru_service          : out std_logic_vector(31 downto 0);
    reg_OS_instru_kernel_functions : out std_logic_vector(31 downto 0);
    reg_return                     : in  std_logic_vector(31 downto 0);
    reg_return_2                   : in  std_logic_vector(31 downto 0)
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
  constant ADDR_reg_return                     : std_logic_vector(31 downto 0) := X"1A108028";
  constant ADDR_reg_config                     : std_logic_vector(31 downto 0) := X"1A10802C";
  constant ADDR_reg_return_2                   : std_logic_vector(31 downto 0) := X"1A108030";

  signal s_reg_tpl_kern_srunning          : std_logic_vector(31 downto 0) := (others => '0');
  signal s_reg_tpl_kern_selected          : std_logic_vector(31 downto 0) := (others => '0');
  signal s_reg_tpl_kern_running           : std_logic_vector(31 downto 0) := (others => '0');
  signal s_reg_tpl_kern_elected           : std_logic_vector(31 downto 0) := (others => '0');
  signal s_reg_tpl_kern_runningID         : std_logic_vector(31 downto 0) := (others => '0');
  signal s_reg_tpl_kern_electedID         : std_logic_vector(31 downto 0) := (others => '0');
  signal s_reg_OS_instru_service          : std_logic_vector(31 downto 0) := (others => '0');
  signal s_reg_OS_instru_kernel_functions : std_logic_vector(31 downto 0) := (others => '0');
  signal s_tpl_kern_need_switch           : std_logic_vector(1 downto 0)  := (others => '0');
  signal s_tpl_kern_need_schedule         : std_logic                     := '0';
  signal s_reg_config                     : std_logic_vector(31 downto 0) := (others => '0');

begin

  -- Default affectations
  pslverr                        <= '0';
  pready                         <= '1';
  reg_tpl_kern_srunning          <= s_reg_tpl_kern_srunning;
  reg_tpl_kern_selected          <= s_reg_tpl_kern_selected;
  reg_tpl_kern_running           <= s_reg_tpl_kern_running;
  reg_tpl_kern_elected           <= s_reg_tpl_kern_elected;
  reg_tpl_kern_runningID         <= s_reg_tpl_kern_runningID;
  reg_tpl_kern_electedID         <= s_reg_tpl_kern_electedID;
  tpl_kern_need_switch           <= s_tpl_kern_need_switch;
  tpl_kern_need_schedule         <= s_tpl_kern_need_schedule;
  reg_OS_instru_service          <= s_reg_OS_instru_service;
  reg_OS_instru_kernel_functions <= s_reg_OS_instru_kernel_functions;
  reset                          <= s_reg_config(0);
  enable_IT                      <= s_reg_config(1);

  sequential_process : process (pclk, prst) is
  begin  -- process sequential_process
    if prst = '0' then                  -- asynchronous reset (active low)
      s_reg_OS_instru_service          <= (others => '0');
      s_reg_OS_instru_kernel_functions <= (others => '0');
    elsif pclk'event and pclk = '1' then      -- rising clock edge
      if (psel = '1' and penable = '1') then  --Acces to transaction
        -- Reading APB bus (CPU to Fabric)
        if(pwrite = '1') then
          case paddr is
            when ADDR_reg_tpl_kern_srunning          => s_reg_tpl_kern_srunning          <= pwdata;
            when ADDR_reg_tpl_kern_selected          => s_reg_tpl_kern_selected          <= pwdata;
            when ADDR_reg_tpl_kern_running           => s_reg_tpl_kern_running           <= pwdata;
            when ADDR_reg_tpl_kern_elected           => s_reg_tpl_kern_elected           <= pwdata;
            when ADDR_reg_tpl_kern_runningID         => s_reg_tpl_kern_runningID         <= pwdata;
            when ADDR_reg_tpl_kern_electedID         => s_reg_tpl_kern_electedID         <= pwdata;
            when ADDR_tpl_kern_need_switch           => s_tpl_kern_need_switch           <= pwdata(1 downto 0);
            when ADDR_tpl_kern_need_schedule         => s_tpl_kern_need_schedule         <= pwdata(0);
            when ADDR_reg_OS_instru_service          => s_reg_OS_instru_service          <= pwdata;
            when ADDR_reg_OS_instru_kernel_functions => s_reg_OS_instru_kernel_functions <= pwdata xor s_reg_OS_instru_kernel_functions;
            when ADDR_reg_config                     => s_reg_config                     <= pwdata;
            when others                              => null;
          end case;
        end if;
      end if;
    end if;
  end process sequential_process;

  combinational_process : process (paddr, penable, psel, pwrite, reg_return,
                                   reg_return_2,
                                   s_reg_OS_instru_kernel_functions,
                                   s_reg_OS_instru_service, s_reg_config,
                                   s_reg_tpl_kern_elected,
                                   s_reg_tpl_kern_electedID,
                                   s_reg_tpl_kern_running,
                                   s_reg_tpl_kern_runningID,
                                   s_reg_tpl_kern_selected,
                                   s_reg_tpl_kern_srunning,
                                   s_tpl_kern_need_schedule,
                                   s_tpl_kern_need_switch) is
  begin  -- process combinational_process
    -- Writing APB bus (Fabric to CPU)
    if (pwrite = '0' and psel = '1' and penable = '1') then
      case paddr is
        when ADDR_reg_tpl_kern_srunning          => prdata <= s_reg_tpl_kern_srunning;
        when ADDR_reg_tpl_kern_selected          => prdata <= s_reg_tpl_kern_selected;
        when ADDR_reg_tpl_kern_running           => prdata <= s_reg_tpl_kern_running;
        when ADDR_reg_tpl_kern_elected           => prdata <= s_reg_tpl_kern_elected;
        when ADDR_reg_tpl_kern_runningID         => prdata <= s_reg_tpl_kern_runningID;
        when ADDR_reg_tpl_kern_electedID         => prdata <= s_reg_tpl_kern_electedID;
        when ADDR_tpl_kern_need_switch           => prdata <= (X"0000000" & "00" & s_tpl_kern_need_switch);
        when ADDR_tpl_kern_need_schedule         => prdata <= (X"0000000" & "000" & s_tpl_kern_need_schedule);
        when ADDR_reg_OS_instru_service          => prdata <= s_reg_OS_instru_service;
        when ADDR_reg_OS_instru_kernel_functions => prdata <= s_reg_OS_instru_kernel_functions;
        when ADDR_reg_config                     => prdata <= s_reg_config;
        when ADDR_reg_return                     => prdata <= reg_return;
        when ADDR_reg_return_2                   => prdata <= reg_return_2;
        when others                              => prdata <= (others => '0');
      end case;
    end if;
  end process combinational_process;

end architecture_apb_monitor;
