--Entity Prop26 for property Prop26
--Formula is :
--assert  always(set_event_service -> not(E1 or E5)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop26 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_25_2 : in std_logic;
	 pending_25 : out std_logic;
	 trigger_imply_25_2 : out std_logic
	);
end entity Prop26;
--end of entity 


--architecture 
architecture mon of Prop26 is

--internal signal
signal	trigger_always_25_1, trigger_init_25_0	: std_logic;

begin

--pending expression
	pending_25 <= '0';

	imply_25_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_25_1,
		cond => cond_25_2,
		trigger => trigger_imply_25_2
	);



	always_25_1 : mnt_always
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
		start => trigger_init_25_0,
		trigger => trigger_always_25_1
	);



	init_25_0 : gen_init
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
		trigger => trigger_init_25_0
	);



end mon;