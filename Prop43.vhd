--Entity Prop43 for property Prop43
--Formula is :
--assert  always(activate_task -> (activate_task_service or chain_task_service or init_os or action_activate_task or terminate_application_service)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop43 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_42_2 : in std_logic;
	 pending_42 : out std_logic;
	 trigger_imply_42_2 : out std_logic
	);
end entity Prop43;
--end of entity 


--architecture 
architecture mon of Prop43 is

--internal signal
signal	trigger_always_42_1, trigger_init_42_0	: std_logic;

begin

--pending expression
	pending_42 <= '0';

	imply_42_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_42_1,
		cond => cond_42_2,
		trigger => trigger_imply_42_2
	);



	always_42_1 : mnt_always
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
		start => trigger_init_42_0,
		trigger => trigger_always_42_1
	);



	init_42_0 : gen_init
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
		trigger => trigger_init_42_0
	);



end mon;