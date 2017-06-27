--Entity Prop03 for property Prop03
--Formula is :
--assert  always(fell(E1) -> (E0)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop03 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_2_2 : in std_logic;
	 pending_2 : out std_logic;
	 trigger_imply_2_2 : out std_logic
	);
end entity Prop03;
--end of entity 


--architecture 
architecture mon of Prop03 is

--internal signal
signal	trigger_always_2_1, trigger_init_2_0	: std_logic;

begin

--pending expression
	pending_2 <= '0';

	imply_2_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_2_1,
		cond => cond_2_2,
		trigger => trigger_imply_2_2
	);



	always_2_1 : mnt_always
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
		start => trigger_init_2_0,
		trigger => trigger_always_2_1
	);



	init_2_0 : gen_init
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
		trigger => trigger_init_2_0
	);



end mon;