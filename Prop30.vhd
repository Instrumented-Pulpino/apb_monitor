--Entity Prop30 for property Prop30
--Formula is :
--assert  always(fell(set_event_service) -> (E0 or E3 or E4)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop30 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_29_2 : in std_logic;
	 pending_29 : out std_logic;
	 trigger_imply_29_2 : out std_logic
	);
end entity Prop30;
--end of entity 


--architecture 
architecture mon of Prop30 is

--internal signal
signal	trigger_always_29_1, trigger_init_29_0	: std_logic;

begin

--pending expression
	pending_29 <= '0';

	imply_29_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_29_1,
		cond => cond_29_2,
		trigger => trigger_imply_29_2
	);



	always_29_1 : mnt_always
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
		start => trigger_init_29_0,
		trigger => trigger_always_29_1
	);



	init_29_0 : gen_init
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
		trigger => trigger_init_29_0
	);



end mon;