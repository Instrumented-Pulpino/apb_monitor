--Entity Prop25 for property Prop25
--Formula is :
--assert  always(terminate_task_service -> (E0 or E1)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop25 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_24_2 : in std_logic;
	 pending_24 : out std_logic;
	 trigger_imply_24_2 : out std_logic
	);
end entity Prop25;
--end of entity 


--architecture 
architecture mon of Prop25 is

--internal signal
signal	trigger_always_24_1, trigger_init_24_0	: std_logic;

begin

--pending expression
	pending_24 <= '0';

	imply_24_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_24_1,
		cond => cond_24_2,
		trigger => trigger_imply_24_2
	);



	always_24_1 : mnt_always
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
		start => trigger_init_24_0,
		trigger => trigger_always_24_1
	);



	init_24_0 : gen_init
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
		trigger => trigger_init_24_0
	);



end mon;