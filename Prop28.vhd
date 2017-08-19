--Entity Prop28 for property Prop28
--Formula is :
--assert  always(schedule_service -> (E0 or E3)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop28 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_27_2 : in std_logic;
	 pending_27 : out std_logic;
	 trigger_imply_27_2 : out std_logic
	);
end entity Prop28;
--end of entity 


--architecture 
architecture mon of Prop28 is

--internal signal
signal	trigger_always_27_1, trigger_init_27_0	: std_logic;

begin

--pending expression
	pending_27 <= '0';

	imply_27_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_27_1,
		cond => cond_27_2,
		trigger => trigger_imply_27_2
	);



	always_27_1 : mnt_always
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
		start => trigger_init_27_0,
		trigger => trigger_always_27_1
	);



	init_27_0 : gen_init
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
		trigger => trigger_init_27_0
	);



end mon;