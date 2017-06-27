--Entity Prop08 for property Prop08
--Formula is :
--assert  always(rose(E4) -> next[1](run_elected)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop08 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_7_2 : in std_logic;
	 pending_7 : out std_logic;
	 trigger_next_7_3 : out std_logic
	);
end entity Prop08;
--end of entity 


--architecture 
architecture mon of Prop08 is

--internal signal
signal	trigger_imply_7_2, trigger_always_7_1, trigger_init_7_0	: std_logic;

begin

--pending expression
	pending_7 <= '0';

	next_7_3 : mnt_next
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
		start => trigger_imply_7_2,
		pending => OPEN,
		trigger => trigger_next_7_3
	);



	imply_7_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_7_1,
		cond => cond_7_2,
		trigger => trigger_imply_7_2
	);



	always_7_1 : mnt_always
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
		start => trigger_init_7_0,
		trigger => trigger_always_7_1
	);



	init_7_0 : gen_init
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
		trigger => trigger_init_7_0
	);



end mon;