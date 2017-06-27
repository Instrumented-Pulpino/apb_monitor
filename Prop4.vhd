--Entity Prop4 for property Prop4
--Formula is :
--assert  always(fell(E3) -> (E0)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop4 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_3_2 : in std_logic;
	 pending_3 : out std_logic;
	 trigger_imply_3_2 : out std_logic
	);
end entity Prop4;
--end of entity 


--architecture 
architecture mon of Prop4 is

--internal signal
signal	trigger_always_3_1, trigger_init_3_0	: std_logic;

begin

--pending expression
	pending_3 <= '0';

	imply_3_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_3_1,
		cond => cond_3_2,
		trigger => trigger_imply_3_2
	);



	always_3_1 : mnt_always
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
		start => trigger_init_3_0,
		trigger => trigger_always_3_1
	);



	init_3_0 : gen_init
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
		trigger => trigger_init_3_0
	);



end mon;