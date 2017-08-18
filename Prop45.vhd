--Entity Prop45 for property Prop45
--Formula is :
--assert  always(schedule_from_running -> (activate_task_service or schedule_service or set_event_service or central_interrupt_handler or release_resource_service or counter_tick or increment_counter_service or notify_receiving_mos)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop45 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_44_2 : in std_logic;
	 pending_44 : out std_logic;
	 trigger_imply_44_2 : out std_logic
	);
end entity Prop45;
--end of entity 


--architecture 
architecture mon of Prop45 is

--internal signal
signal	trigger_always_44_1, trigger_init_44_0	: std_logic;

begin

--pending expression
	pending_44 <= '0';

	imply_44_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_44_1,
		cond => cond_44_2,
		trigger => trigger_imply_44_2
	);



	always_44_1 : mnt_always
	generic map (
		EDGE => '1',
		LEVEL =>'0',
		GATED_CLOCK => 0
	)
	port map (
		--clk_en not connected
		clk_en => '1',
		clk => clk,
		reset_n => reset_n,
		start => trigger_init_44_0,
		trigger => trigger_always_44_1
	);



	init_44_0 : gen_init
	generic map (
		GATED_CLOCK => 0,
		EDGE =>'1',
		LEVEL =>'0'
	)
	port map (
		--clk_en not connected
		clk_en => '1',
		clk => clk,
		reset_n => reset_n,
		trigger => trigger_init_44_0
	);



end mon;