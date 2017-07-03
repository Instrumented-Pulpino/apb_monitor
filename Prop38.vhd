--Entity Prop38 for property Prop38
--Formula is :
--assert  always(start_scheduling -> start_os_service); 



library ieee; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity Prop38 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_37_2 : in std_logic;
	 pending_37 : out std_logic;
	 trigger_imply_37_2 : out std_logic
	);
end entity Prop38;
--end of entity 


--architecture 
architecture mon of Prop38 is

--internal signal
signal	trigger_always_37_1, trigger_init_37_0	: std_logic;

begin

--pending expression
	pending_37 <= '0';

	imply_37_2 : mnt_impl	--no generic port
	port map (
		start => trigger_always_37_1,
		cond => cond_37_2,
		trigger => trigger_imply_37_2
	);



	always_37_1 : mnt_always
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
		start => trigger_init_37_0,
		trigger => trigger_always_37_1
	);



	init_37_0 : gen_init
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
		trigger => trigger_init_37_0
	);



end mon;