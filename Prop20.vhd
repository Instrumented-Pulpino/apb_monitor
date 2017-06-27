--Entity Prop20 for property Prop20
--Formula is :
--assert  always(fell(activate_task_service) -> (E0 or E3 or E4)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop20 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_19_2 : in std_logic;
	 pending_19 : out std_logic;
	 trigger_imply_19_2 : out std_logic
	);
end entity Prop20;
--end of entity 


--architecture 
architecture mon of Prop20 is

--internal signal
signal	trigger_always_19_1, trigger_init_19_0	: std_logic;

begin

--pending expression
	pending_19 <= '0';

	imply_19_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_19_1,
		cond => cond_19_2,
		trigger => trigger_imply_19_2
	);



	always_19_1 : mnt_always
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
		start => trigger_init_19_0,
		trigger => trigger_always_19_1
	);



	init_19_0 : gen_init
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
		trigger => trigger_init_19_0
	);



end mon;