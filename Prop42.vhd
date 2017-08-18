--Entity Prop42 for property Prop42
--Formula is :
--assert  always(terminate -> (terminate_task_service or chain_task_service or terminate_isr2_service or terminate_application_service or call_terminate_task_service)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop42 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_41_2 : in std_logic;
	 pending_41 : out std_logic;
	 trigger_imply_41_2 : out std_logic
	);
end entity Prop42;
--end of entity 


--architecture 
architecture mon of Prop42 is

--internal signal
signal	trigger_always_41_1, trigger_init_41_0	: std_logic;

begin

--pending expression
	pending_41 <= '0';

	imply_41_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_41_1,
		cond => cond_41_2,
		trigger => trigger_imply_41_2
	);



	always_41_1 : mnt_always
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
		start => trigger_init_41_0,
		trigger => trigger_always_41_1
	);



	init_41_0 : gen_init
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
		trigger => trigger_init_41_0
	);



end mon;