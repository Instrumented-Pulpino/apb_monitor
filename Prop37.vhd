--Entity Prop37 for property Prop37
--Formula is :
--assert  always(put_new_proc -> (release or activate_task or activate_isr2)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop37 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_36_2 : in std_logic;
	 pending_36 : out std_logic;
	 trigger_imply_36_2 : out std_logic
	);
end entity Prop37;
--end of entity 


--architecture 
architecture mon of Prop37 is

--internal signal
signal	trigger_always_36_1, trigger_init_36_0	: std_logic;

begin

--pending expression
	pending_36 <= '0';

	imply_36_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_36_1,
		cond => cond_36_2,
		trigger => trigger_imply_36_2
	);



	always_36_1 : mnt_always
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
		start => trigger_init_36_0,
		trigger => trigger_always_36_1
	);



	init_36_0 : gen_init
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
		trigger => trigger_init_36_0
	);



end mon;