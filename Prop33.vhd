--Entity Prop33 for property Prop33
--Formula is :
--assert  always(release_internal_resource -> (block_s or terminate or schedule_service or terminate_application_service)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop33 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_32_2 : in std_logic;
	 pending_32 : out std_logic;
	 trigger_imply_32_2 : out std_logic
	);
end entity Prop33;
--end of entity 


--architecture 
architecture mon of Prop33 is

--internal signal
signal	trigger_always_32_1, trigger_init_32_0	: std_logic;

begin

--pending expression
	pending_32 <= '0';

	imply_32_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_32_1,
		cond => cond_32_2,
		trigger => trigger_imply_32_2
	);



	always_32_1 : mnt_always
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
		start => trigger_init_32_0,
		trigger => trigger_always_32_1
	);



	init_32_0 : gen_init
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
		trigger => trigger_init_32_0
	);



end mon;