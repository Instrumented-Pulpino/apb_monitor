--Entity Prop3 for property Prop3
--Formula is :
--assert  always(not(E5 or E7) -> next[1](not(E1))); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop3 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_2_2 : in std_logic;
	 pending_2 : out std_logic;
	 trigger_next_2_3 : out std_logic
	);
end entity Prop3;
--end of entity 


--architecture 
architecture mon of Prop3 is

--internal signal
signal	trigger_imply_2_2, trigger_always_2_1, trigger_init_2_0	: std_logic;

begin

--pending expression
	pending_2 <= '0';

	next_2_3 : mnt_next
	generic map (
		GATED_CLOCK => 0,
		OP_TYPE => 0,
		EDGE =>'1',
		LEVEL =>'0',
		NUM_CLK => 1
	)
	port map (
		--clk_en not connected
		clk_en => '1',
		clk => clk,
		reset_n => reset_n,
		start => trigger_imply_2_2,
		pending => OPEN,
		trigger => trigger_next_2_3
	);



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