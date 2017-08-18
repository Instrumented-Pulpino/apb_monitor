--Entity Prop41 for property Prop41
--Formula is :
--assert  always(block_s -> wait_event_service); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop41 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_40_2 : in std_logic;
	 pending_40 : out std_logic;
	 trigger_imply_40_2 : out std_logic
	);
end entity Prop41;
--end of entity 


--architecture 
architecture mon of Prop41 is

--internal signal
signal	trigger_always_40_1, trigger_init_40_0	: std_logic;

begin

--pending expression
	pending_40 <= '0';

	imply_40_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_40_1,
		cond => cond_40_2,
		trigger => trigger_imply_40_2
	);



	always_40_1 : mnt_always
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
		start => trigger_init_40_0,
		trigger => trigger_always_40_1
	);



	init_40_0 : gen_init
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
		trigger => trigger_init_40_0
	);



end mon;