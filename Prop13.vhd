--Entity Prop13 for property Prop13
--Formula is :
--assert  always(rose(call_context) -> (E1 or E3)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop13 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_12_2 : in std_logic;
	 pending_12 : out std_logic;
	 trigger_imply_12_2 : out std_logic
	);
end entity Prop13;
--end of entity 


--architecture 
architecture mon of Prop13 is

--internal signal
signal	trigger_always_12_1, trigger_init_12_0	: std_logic;

begin

--pending expression
	pending_12 <= '0';

	imply_12_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_12_1,
		cond => cond_12_2,
		trigger => trigger_imply_12_2
	);



	always_12_1 : mnt_always
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
		start => trigger_init_12_0,
		trigger => trigger_always_12_1
	);



	init_12_0 : gen_init
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
		trigger => trigger_init_12_0
	);



end mon;