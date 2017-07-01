--Entity Prop35 for property Prop35
--Formula is :
--assert  always(terminate -> (terminate_task_service or chain_task_service or terminate_isr2_service or terminate_application_service)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop35 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_34_2 : in std_logic;
	 pending_34 : out std_logic;
	 trigger_imply_34_2 : out std_logic
	);
end entity Prop35;
--end of entity 


--architecture 
architecture mon of Prop35 is

--internal signal
signal	trigger_always_34_1, trigger_init_34_0	: std_logic;

begin

--pending expression
	pending_34 <= '0';

	imply_34_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_34_1,
		cond => cond_34_2,
		trigger => trigger_imply_34_2
	);



	always_34_1 : mnt_always
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
		start => trigger_init_34_0,
		trigger => trigger_always_34_1
	);



	init_34_0 : gen_init
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
		trigger => trigger_init_34_0
	);



end mon;