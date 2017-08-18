--Entity Prop09 for property Prop09
--Formula is :
--assert  always((rose(call_handler) and reentrancy_level_1) -> running_equal_elected); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop09 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_8_2 : in std_logic;
	 pending_8 : out std_logic;
	 trigger_imply_8_2 : out std_logic
	);
end entity Prop09;
--end of entity 


--architecture 
architecture mon of Prop09 is

--internal signal
signal	trigger_always_8_1, trigger_init_8_0	: std_logic;

begin

--pending expression
	pending_8 <= '0';

	imply_8_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_8_1,
		cond => cond_8_2,
		trigger => trigger_imply_8_2
	);



	always_8_1 : mnt_always
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
		start => trigger_init_8_0,
		trigger => trigger_always_8_1
	);



	init_8_0 : gen_init
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
		trigger => trigger_init_8_0
	);



end mon;