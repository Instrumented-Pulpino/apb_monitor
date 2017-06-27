library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity services is

  port (
    reg_OS_instru_service    : in  std_logic_vector(31 downto 0);
    activate_task_service    : out std_logic;
    terminate_task_service   : out std_logic;
    chain_task_service       : out std_logic;
    schedule_service         : out std_logic;
    set_event_service        : out std_logic;
    wait_event_service       : out std_logic;
    release_resource_service : out std_logic;
    start_os_service         : out std_logic
    );

end services;

architecture behav of services is

  constant ACTIVATE_TASK    : unsigned := to_unsigned(66, 32);
  constant TERMINATE_TASK   : unsigned := to_unsigned(67, 32);
  constant CHAIN_TASK       : unsigned := to_unsigned(68, 32);
  constant SCHEDULE         : unsigned := to_unsigned(69, 32);
  constant SET_EVENT        : unsigned := to_unsigned(14, 32);
  constant WAIT_EVENT       : unsigned := to_unsigned(17, 32);
  constant RELEASE_RESOURCE : unsigned := to_unsigned(48, 32);
  constant START_OS         : unsigned := to_unsigned(45, 32);

  signal reg_OS_instru_service_u : unsigned(31 downto 0);

begin  -- architecture behav

  -- Sugar
  reg_OS_instru_service_u <= unsigned(reg_OS_instru_service);

  -- Identifying services
  activate_task_service    <= '1' when reg_OS_instru_service_u = ACTIVATE_TASK    else '0';
  terminate_task_service   <= '1' when reg_OS_instru_service_u = TERMINATE_TASK   else '0';
  chain_task_service       <= '1' when reg_OS_instru_service_u = CHAIN_TASK       else '0';
  schedule_service         <= '1' when reg_OS_instru_service_u = SCHEDULE         else '0';
  set_event_service        <= '1' when reg_OS_instru_service_u = SET_EVENT        else '0';
  wait_event_service       <= '1' when reg_OS_instru_service_u = WAIT_EVENT       else '0';
  release_resource_service <= '1' when reg_OS_instru_service_u = RELEASE_RESOURCE else '0';
  start_os_service         <= '1' when reg_OS_instru_service_u = START_OS         else '0';

end architecture behav;
