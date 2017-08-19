--Entity Prop12 for property Prop12
--Formula is :
--assert  always((call_service_enter and (reentrancy_counter = 1)) -> E0); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop12 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_11_2 : in std_logic;
	 pending_11 : out std_logic;
	 trigger_imply_11_2 : out std_logic
	);
end entity Prop12;
--end of entity 


--architecture 
architecture mon of Prop12 is

--internal signal
signal	trigger_always_11_1, trigger_init_11_0	: std_logic;

begin

--pending expression
	pending_11 <= '0';

	imply_11_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_11_1,
		cond => cond_11_2,
		trigger => trigger_imply_11_2
	);



	always_11_1 : mnt_always
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
		start => trigger_init_11_0,
		trigger => trigger_always_11_1
	);



	init_11_0 : gen_init
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
		trigger => trigger_init_11_0
	);



end mon;