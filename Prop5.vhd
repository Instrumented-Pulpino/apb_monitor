--Entity Prop5 for property Prop5
--Formula is :
--assert  always(fell(E4) -> (E0 or E5 or E7)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop5 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_4_2 : in std_logic;
	 pending_4 : out std_logic;
	 trigger_imply_4_2 : out std_logic
	);
end entity Prop5;
--end of entity 


--architecture 
architecture mon of Prop5 is

--internal signal
signal	trigger_always_4_1, trigger_init_4_0	: std_logic;

begin

--pending expression
	pending_4 <= '0';

	imply_4_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_4_1,
		cond => cond_4_2,
		trigger => trigger_imply_4_2
	);



	always_4_1 : mnt_always
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
		start => trigger_init_4_0,
		trigger => trigger_always_4_1
	);



	init_4_0 : gen_init
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
		trigger => trigger_init_4_0
	);



end mon;