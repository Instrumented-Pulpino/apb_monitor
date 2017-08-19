--Entity Prop46 for property Prop46
--Formula is :
--assert  always(set_event -> (set_event_service or action_set_event)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop46 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_45_2 : in std_logic;
	 pending_45 : out std_logic;
	 trigger_imply_45_2 : out std_logic
	);
end entity Prop46;
--end of entity 


--architecture 
architecture mon of Prop46 is

--internal signal
signal	trigger_always_45_1, trigger_init_45_0	: std_logic;

begin

--pending expression
	pending_45 <= '0';

	imply_45_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_45_1,
		cond => cond_45_2,
		trigger => trigger_imply_45_2
	);



	always_45_1 : mnt_always
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
		start => trigger_init_45_0,
		trigger => trigger_always_45_1
	);



	init_45_0 : gen_init
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
		trigger => trigger_init_45_0
	);



end mon;