--Entity Prop40 for property Prop40
--Formula is :
--assert  always(release -> set_event); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop40 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_39_2 : in std_logic;
	 pending_39 : out std_logic;
	 trigger_imply_39_2 : out std_logic
	);
end entity Prop40;
--end of entity 


--architecture 
architecture mon of Prop40 is

--internal signal
signal	trigger_always_39_1, trigger_init_39_0	: std_logic;

begin

--pending expression
	pending_39 <= '0';

	imply_39_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_39_1,
		cond => cond_39_2,
		trigger => trigger_imply_39_2
	);



	always_39_1 : mnt_always
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
		start => trigger_init_39_0,
		trigger => trigger_always_39_1
	);



	init_39_0 : gen_init
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
		trigger => trigger_init_39_0
	);



end mon;