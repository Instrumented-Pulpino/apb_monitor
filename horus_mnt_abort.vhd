-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and abort input to handle abort expression in Synthorus
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--		last revision 29/03/2015				     --
-- Negin JAVAHERI                          			             --
-- Last operation made : check if the monitor interface is the same that in  --
--  horus and make the modification in the monitor implementation if needed  --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- trigger PSL property:
--	FL abort expr
-- Syntax:
--	inst_name mnt_abort 
--		port 	map (clk, reset_n, start, expr, trigger);
-- Definitions:
-- 	Inputs:
--		clk    	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		clk_en  : Enable Clock
--		abort	: abort's condition signal
--		expr   	: input expression to be checked at the posedge of clk
--	Outputs
--		trigger: Indicate the evaluation of expr or sub-property is mandatory
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_abort is
	generic (
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
		GATED_CLOCK : INTEGER
	);
	port (	clk, clk_en, abort, reset_n, start	: IN STD_LOGIC;
	      	trigger			: OUT STD_LOGIC
	);
end mnt_abort;

architecture monitor of mnt_abort is
	signal start_t1 	: STD_LOGIC;
begin

GEN1 : IF GATED_CLOCK = 0 GENERATE
evaluate_start: process (clk)
begin
	if clk'event and clk=EDGE then
		if (reset_n=LEVEL or abort = '1') then
			start_t1  <= '0';
		elsif start = '1' then
			start_t1 <= '1';
		end if;
	end if;
end process;
END GENERATE;

GEN2 : IF GATED_CLOCK = 1 GENERATE
evaluate_start: process (clk)
begin
	if clk'event and clk=EDGE then
		if clk_en = '1' then
			if (reset_n=LEVEL or abort = '1') then
				start_t1  <= '0';
			elsif start = '1' then
				start_t1 <= '1';
			end if;
		end if;
	end if;
end process;
END GENERATE;
trigger  <=  	start_t1;
	
end monitor; -- mnt_always

			

		 

