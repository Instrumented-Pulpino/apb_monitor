--Entity Prop19 for property Prop19
--Formula is :
--assert  always(rose(call_save) -> (E3 and call_context)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop19 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_18_2 : in std_logic;
	 pending_18 : out std_logic;
	 trigger_imply_18_2 : out std_logic
	);
end entity Prop19;
--end of entity 


--architecture 
architecture mon of Prop19 is

--internal signal
signal	trigger_always_18_1, trigger_init_18_0	: std_logic;

begin

--pending expression
	pending_18 <= '0';

	imply_18_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_18_1,
		cond => cond_18_2,
		trigger => trigger_imply_18_2
	);



	always_18_1 : mnt_always
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
		start => trigger_init_18_0,
		trigger => trigger_always_18_1
	);



	init_18_0 : gen_init
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
		trigger => trigger_init_18_0
	);



end mon;