--Entity Prop32 for property Prop32
--Formula is :
--assert  always(start -> (schedule_from_running or terminate_task_service or chain_task_service or start_scheduling or release)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop32 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_31_2 : in std_logic;
	 pending_31 : out std_logic;
	 trigger_imply_31_2 : out std_logic
	);
end entity Prop32;
--end of entity 


--architecture 
architecture mon of Prop32 is

--internal signal
signal	trigger_always_31_1, trigger_init_31_0	: std_logic;

begin

--pending expression
	pending_31 <= '0';

	imply_31_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_31_1,
		cond => cond_31_2,
		trigger => trigger_imply_31_2
	);



	always_31_1 : mnt_always
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
		start => trigger_init_31_0,
		trigger => trigger_always_31_1
	);



	init_31_0 : gen_init
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
		trigger => trigger_init_31_0
	);



end mon;