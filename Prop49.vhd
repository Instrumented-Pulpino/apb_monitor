--Entity Prop49 for property Prop49
--Formula is :
--assert  always(init_os -> start_os_service); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop49 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_48_2 : in std_logic;
	 pending_48 : out std_logic;
	 trigger_imply_48_2 : out std_logic
	);
end entity Prop49;
--end of entity 


--architecture 
architecture mon of Prop49 is

--internal signal
signal	trigger_always_48_1, trigger_init_48_0	: std_logic;

begin

--pending expression
	pending_48 <= '0';

	imply_48_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_48_1,
		cond => cond_48_2,
		trigger => trigger_imply_48_2
	);



	always_48_1 : mnt_always
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
		start => trigger_init_48_0,
		trigger => trigger_always_48_1
	);



	init_48_0 : gen_init
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
		trigger => trigger_init_48_0
	);



end mon;