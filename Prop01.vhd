--Entity Prop01 for property Prop01
--Formula is :
--assert  always(not(E2) and not(E6)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop01 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 pending_0 : out std_logic;
	 trigger_always_0_1 : out std_logic
	);
end entity Prop01;
--end of entity 


--architecture 
architecture mon of Prop01 is

--internal signal
signal	trigger_init_0_0	: std_logic;

begin

--pending expression
	pending_0 <= '0';

	always_0_1 : mnt_always
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
		start => trigger_init_0_0,
		trigger => trigger_always_0_1
	);



	init_0_0 : gen_init
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
		trigger => trigger_init_0_0
	);



end mon;