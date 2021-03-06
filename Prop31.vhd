--Entity Prop31 for property Prop31
--Formula is :
--assert  always(wait_event_service -> (E0 or E3)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop31 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_30_2 : in std_logic;
	 pending_30 : out std_logic;
	 trigger_imply_30_2 : out std_logic
	);
end entity Prop31;
--end of entity 


--architecture 
architecture mon of Prop31 is

--internal signal
signal	trigger_always_30_1, trigger_init_30_0	: std_logic;

begin

--pending expression
	pending_30 <= '0';

	imply_30_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_30_1,
		cond => cond_30_2,
		trigger => trigger_imply_30_2
	);



	always_30_1 : mnt_always
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
		start => trigger_init_30_0,
		trigger => trigger_always_30_1
	);



	init_30_0 : gen_init
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
		trigger => trigger_init_30_0
	);



end mon;