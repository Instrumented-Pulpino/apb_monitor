--Entity Prop02 for property Prop02
--Formula is :
--assert  always(fell(E0) -> (E1 or E3 or E4)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop02 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_1_2 : in std_logic;
	 pending_1 : out std_logic;
	 trigger_imply_1_2 : out std_logic
	);
end entity Prop02;
--end of entity 


--architecture 
architecture mon of Prop02 is

--internal signal
signal	trigger_always_1_1, trigger_init_1_0	: std_logic;

begin

--pending expression
	pending_1 <= '0';

	imply_1_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_1_1,
		cond => cond_1_2,
		trigger => trigger_imply_1_2
	);



	always_1_1 : mnt_always
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
		start => trigger_init_1_0,
		trigger => trigger_always_1_1
	);



	init_1_0 : gen_init
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
		trigger => trigger_init_1_0
	);



end mon;