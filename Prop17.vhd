--Entity Prop17 for property Prop17
--Formula is :
--assert  always(fell(call_service) before fell(call_handler)); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop17 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_16_2 : in std_logic;
	 expr_16_2 : in std_logic;
	 pending_16 : out std_logic;
	 trigger_before_16_2 : out std_logic
	);
end entity Prop17;
--end of entity 


--architecture 
architecture mon of Prop17 is

--internal signal
signal	trigger_always_16_1, trigger_init_16_0	: std_logic;

begin

--pending expression
	pending_16 <= '0';

	before_16_2 : mnt_before
	generic map (
		EDGE => '1',
		LEVEL =>'0',
		GATED_CLOCK => 0,
		OP_TYPE => 0,
		GEN_OBS => 0
	)
	port map (
		clk => clk,
		reset_n => reset_n,
		--clk_en not connected
		clk_en => '1',
		start => trigger_always_16_1,
		cond => cond_16_2,
		expr => expr_16_2,
		pending => OPEN,
		trigger => trigger_before_16_2
	);



	always_16_1 : mnt_always
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
		start => trigger_init_16_0,
		trigger => trigger_always_16_1
	);



	init_16_0 : gen_init
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
		trigger => trigger_init_16_0
	);



end mon;