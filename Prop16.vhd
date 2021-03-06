--Entity Prop16 for property Prop16
--Formula is :
--assert  always(run_elected -> call_context); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop16 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_15_2 : in std_logic;
	 pending_15 : out std_logic;
	 trigger_imply_15_2 : out std_logic
	);
end entity Prop16;
--end of entity 


--architecture 
architecture mon of Prop16 is

--internal signal
signal	trigger_always_15_1, trigger_init_15_0	: std_logic;

begin

--pending expression
	pending_15 <= '0';

	imply_15_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_15_1,
		cond => cond_15_2,
		trigger => trigger_imply_15_2
	);



	always_15_1 : mnt_always
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
		start => trigger_init_15_0,
		trigger => trigger_always_15_1
	);



	init_15_0 : gen_init
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
		trigger => trigger_init_15_0
	);



end mon;