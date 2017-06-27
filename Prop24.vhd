--Entity Prop24 for property Prop24
--Formula is :
--assert  always(bubble_up -> (put_new_proc or put_preempted_proc)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop24 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_23_2 : in std_logic;
	 pending_23 : out std_logic;
	 trigger_imply_23_2 : out std_logic
	);
end entity Prop24;
--end of entity 


--architecture 
architecture mon of Prop24 is

--internal signal
signal	trigger_always_23_1, trigger_init_23_0	: std_logic;

begin

--pending expression
	pending_23 <= '0';

	imply_23_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_23_1,
		cond => cond_23_2,
		trigger => trigger_imply_23_2
	);



	always_23_1 : mnt_always
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
		start => trigger_init_23_0,
		trigger => trigger_always_23_1
	);



	init_23_0 : gen_init
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
		trigger => trigger_init_23_0
	);



end mon;