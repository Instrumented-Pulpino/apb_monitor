--Entity Prop14 for property Prop14
--Formula is :
--assert  always(rose(call_context) -> (reentrancy_level_1)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop14 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_13_2 : in std_logic;
	 pending_13 : out std_logic;
	 trigger_imply_13_2 : out std_logic
	);
end entity Prop14;
--end of entity 


--architecture 
architecture mon of Prop14 is

--internal signal
signal	trigger_always_13_1, trigger_init_13_0	: std_logic;

begin

--pending expression
	pending_13 <= '0';

	imply_13_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_13_1,
		cond => cond_13_2,
		trigger => trigger_imply_13_2
	);



	always_13_1 : mnt_always
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
		start => trigger_init_13_0,
		trigger => trigger_always_13_1
	);



	init_13_0 : gen_init
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
		trigger => trigger_init_13_0
	);



end mon;