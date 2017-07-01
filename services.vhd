library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity services is

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
    terminate_application_service : out std_logic
    );

end services;

architecture behav of services is

  constant ACTIVATE_TASK         : unsigned := to_unsigned(66, 8);
  constant TERMINATE_TASK        : unsigned := to_unsigned(67, 8);
  constant CHAIN_TASK            : unsigned := to_unsigned(68, 8);
  constant SCHEDULE              : unsigned := to_unsigned(69, 8);
  constant SET_EVENT             : unsigned := to_unsigned(14, 8);
  constant WAIT_EVENT            : unsigned := to_unsigned(17, 8);
  constant RELEASE_RESOURCE      : unsigned := to_unsigned(48, 8);
  constant START_OS              : unsigned := to_unsigned(45, 8);
  constant TERMINATE_ISR2        : unsigned := to_unsigned(27, 8);
  constant TERMINATE_APPLICATION : unsigned := to_unsigned(6, 8);
  constant NO_SERVICE            : unsigned := x"FF";

  signal pile_service      : std_logic_vector(31 downto 0);
  signal next_pile_service : std_logic_vector(31 downto 0);
  signal pile_service_1_u  : unsigned(7 downto 0);
  signal pile_service_2_u  : unsigned(7 downto 0);
  signal pile_service_3_u  : unsigned(7 downto 0);
  signal pile_service_4_u  : unsigned(7 downto 0);

begin  -- architecture behav

  -- Sugar
  pile_service_1_u <= unsigned(pile_service(7 downto 0));
  pile_service_2_u <= unsigned(pile_service(15 downto 8));
  pile_service_3_u <= unsigned(pile_service(23 downto 16));
  pile_service_4_u <= unsigned(pile_service(31 downto 24));

  -- Identifying services
  activate_task_service <= '1' when
                           pile_service_1_u = ACTIVATE_TASK or
                           pile_service_2_u = ACTIVATE_TASK or
                           pile_service_3_u = ACTIVATE_TASK or
                           pile_service_4_u = ACTIVATE_TASK
                           else '0';

  terminate_task_service <= '1' when
                            pile_service_1_u = TERMINATE_TASK or
                            pile_service_2_u = TERMINATE_TASK or
                            pile_service_3_u = TERMINATE_TASK or
                            pile_service_4_u = TERMINATE_TASK
                            else '0';

  chain_task_service <= '1' when
                        pile_service_1_u = CHAIN_TASK or
                        pile_service_2_u = CHAIN_TASK or
                        pile_service_3_u = CHAIN_TASK or
                        pile_service_4_u = CHAIN_TASK
                        else '0';

  schedule_service <= '1' when
                      pile_service_1_u = SCHEDULE or
                      pile_service_2_u = SCHEDULE or
                      pile_service_3_u = SCHEDULE or
                      pile_service_4_u = SCHEDULE
                      else '0';

  set_event_service <= '1' when
                       pile_service_1_u = SET_EVENT or
                       pile_service_2_u = SET_EVENT or
                       pile_service_3_u = SET_EVENT or
                       pile_service_4_u = SET_EVENT
                       else '0';

  wait_event_service <= '1' when
                        pile_service_1_u = WAIT_EVENT or
                        pile_service_2_u = WAIT_EVENT or
                        pile_service_3_u = WAIT_EVENT or
                        pile_service_4_u = WAIT_EVENT
                        else '0';

  release_resource_service <= '1' when
                              pile_service_1_u = RELEASE_RESOURCE or
                              pile_service_2_u = RELEASE_RESOURCE or
                              pile_service_3_u = RELEASE_RESOURCE or
                              pile_service_4_u = RELEASE_RESOURCE
                              else '0';

  start_os_service <= '1' when
                      pile_service_1_u = START_OS or
                      pile_service_2_u = START_OS or
                      pile_service_3_u = START_OS or
                      pile_service_4_u = START_OS
                      else '0';

  terminate_isr2_service <= '1' when
                            pile_service_1_u = TERMINATE_ISR2 or
                            pile_service_2_u = TERMINATE_ISR2 or
                            pile_service_3_u = TERMINATE_ISR2 or
                            pile_service_4_u = TERMINATE_ISR2
                            else '0';

  terminate_application_service <= '1' when
                                   pile_service_1_u = TERMINATE_APPLICATION or
                                   pile_service_2_u = TERMINATE_APPLICATION or
                                   pile_service_3_u = TERMINATE_APPLICATION or
                                   pile_service_4_u = TERMINATE_APPLICATION
                                   else '0';

  sequential_process : process (trigger, reset_n) is
  begin  -- process sequential_process
    if reset_n = '0' then               -- asynchronous reset (active low)
      pile_service <= (others => '0');
    elsif falling_edge(trigger) then    -- falling clock edge
      pile_service <= next_pile_service;
    end if;
  end process sequential_process;

  combinational_process : process (pile_service, reg_OS_instru_service) is
  begin  -- process combinational_process
    if (unsigned(reg_OS_instru_service(7 downto 0)) = NO_SERVICE) then
      next_pile_service <= x"00" & pile_service(31 downto 8);
    else
      next_pile_service <= pile_service(23 downto 0) & reg_OS_instru_service(7 downto 0);
    end if;
  end process combinational_process;


end architecture behav;
