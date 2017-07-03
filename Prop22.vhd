--Entity Prop22 for property Prop22
--Formula is :
--assert  always(compare_entries -> (bubble_up or bubble_down)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop22 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_21_2 : in std_logic;
	 pending_21 : out std_logic;
	 trigger_imply_21_2 : out std_logic
	);
end entity Prop22;
--end of entity 


--architecture 
architecture mon of Prop22 is

--internal signal
signal	trigger_always_21_1, trigger_init_21_0	: std_logic;

begin

--pending expression
	pending_21 <= '0';

	imply_21_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_21_1,
		cond => cond_21_2,
		trigger => trigger_imply_21_2
	);



	always_21_1 : mnt_always
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
		start => trigger_init_21_0,
		trigger => trigger_always_21_1
	);



	init_21_0 : gen_init
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
		trigger => trigger_init_21_0
	);



end mon;