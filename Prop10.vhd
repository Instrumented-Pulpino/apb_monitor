--Entity Prop10 for property Prop10
--Formula is :
--assert  always(fell(run_elected) -> call_handler); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop10 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_9_2 : in std_logic;
	 pending_9 : out std_logic;
	 trigger_imply_9_2 : out std_logic
	);
end entity Prop10;
--end of entity 


--architecture 
architecture mon of Prop10 is

--internal signal
signal	trigger_always_9_1, trigger_init_9_0	: std_logic;

begin

--pending expression
	pending_9 <= '0';

	imply_9_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_9_1,
		cond => cond_9_2,
		trigger => trigger_imply_9_2
	);



	always_9_1 : mnt_always
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
		start => trigger_init_9_0,
		trigger => trigger_always_9_1
	);



	init_9_0 : gen_init
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
		trigger => trigger_init_9_0
	);



end mon;