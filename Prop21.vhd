--Entity Prop21 for property Prop21
--Formula is :
--assert  always((call_service_counter = reentrancy_counter) or (call_service_counter = (reentrancy_counter - 1))); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop21 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 pending_20 : out std_logic;
	 trigger_always_20_1 : out std_logic
	);
end entity Prop21;
--end of entity 


--architecture 
architecture mon of Prop21 is

--internal signal
signal	trigger_init_20_0	: std_logic;

begin

--pending expression
	pending_20 <= '0';

	always_20_1 : mnt_always
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
		start => trigger_init_20_0,
		trigger => trigger_always_20_1
	);



	init_20_0 : gen_init
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
		trigger => trigger_init_20_0
	);



end mon;