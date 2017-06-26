-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--		last revision 10/12/2012				     --
-- Alexandre PORCHER, KMA, Negin JAVAHERI                                    --
-- Last operation made : check if the monitor interface is the same that in  --
--  horus and make the modification in the monitor implementation if needed  --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Sester Jérôme, 27 mai 2010                                                --
--                                                                           --
-- Adding generic map (EDGE, LEVEL)                                          --
--                                                                           --
-- Definitions:                                                              --
--                                                                           --
-- EDGE: Defined the clock edge. 1 to rising or 0 to falling                 --
-- LEVEL:Defined the actif level of reset. 1 to high level or 0 to low level --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- KMA 2008                                                                  --
--                                                                           --
-- change the meaning of trigger signal and remove some useless valid        --
--                                                                           --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- The first version was implemented by Miao LIU in 2004                     --
--                                                                           --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- trigger PSL property:
--	always (expr | FL_P)
-- Syntax:
--	inst_name mnt_always 
--		port 	map (clk, reset_n, start, expr, trigger);
-- Definitions:
-- 	Inputs:
--		clk    	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		expr   	: input expression to be checked at the posedge of clk
--	Outputs
--		trigger: Indicate the evaluation of expr or sub-property is mandatory
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_always is
	generic (
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
		GATED_CLOCK : INTEGER
	);
	port (	clk, clk_en, reset_n, start	: IN STD_LOGIC;
	      	trigger			: OUT STD_LOGIC
	);
end mnt_always;

architecture monitor of mnt_always is
	signal start_t1 	: STD_LOGIC;
begin

GEN1 : IF GATED_CLOCK = 0 GENERATE	
evaluate_start: process (clk)
begin
	if clk'event and clk=EDGE then
		if reset_n=LEVEL then
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
			if reset_n=LEVEL then
				start_t1  <= '0';
			elsif start = '1' then
				start_t1 <= '1';
			end if;
		end if;
	end if;
end process;
END GENERATE;
trigger  <=  	start or start_t1;
	
end monitor; -- mnt_always

			

		 
