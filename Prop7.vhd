--Entity Prop7 for property Prop7
--Formula is :
--assert  always(fell(E7) -> (E3)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop7 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_6_2 : in std_logic;
	 pending_6 : out std_logic;
	 trigger_imply_6_2 : out std_logic
	);
end entity Prop7;
--end of entity 


--architecture 
architecture mon of Prop7 is

--internal signal
signal	trigger_always_6_1, trigger_init_6_0	: std_logic;

begin

--pending expression
	pending_6 <= '0';

	imply_6_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_6_1,
		cond => cond_6_2,
		trigger => trigger_imply_6_2
	);



	always_6_1 : mnt_always
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
		start => trigger_init_6_0,
		trigger => trigger_always_6_1
	);



	init_6_0 : gen_init
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
		trigger => trigger_init_6_0
	);



end mon;