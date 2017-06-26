-------------------------------------------------------------------------------
-- 10/12/2012								     --
-- Alexandre PORCHER, KMA, Negin JAVAHERI                                    --
-- Last operation made : check if the monitor interface is the same that in  --
--  horus and make the modification in the monitor implementation if needed  --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Sester Jérôme, 27 mai 2010                                              --
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
-- checking PSL property:
--	cond -> expr | FL_P
-- Syntax:
--	inst_name mnt_impl 
--		port 	map (clk, reset_n, start, cond, trigger);
-- Definitions:
-- 	Inputs:
--		clk   	: synchornous posedge active clock
--		reset_n	: synchronous reset signal, active low
--		start	: start to begin evaluation of the property
--		cond   	: left operand of implication
--	Outputs
--		trigger: Indicate the trigger cycle for expr or sub-property: FL_P
--	Note:   By default, if there is a generated operande, it must be expr. 
--              To stay in the simple subset of PSL, cond must be boolean
--              In the case where cond is a generated signal. 
-- 		If expr is a monitored booleean, we can use the rewrite rule:
--                      cond_g -> expr_m is the same that !expr_m -> !cond_g. 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
	

library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_impl is
	port (	start, cond : IN STD_LOGIC;
	      	trigger	    : OUT STD_LOGIC
	);
end mnt_impl;

architecture monitor of mnt_impl is
	
begin

trigger <= '1' when start='1' and cond='1' else '0';


end monitor; -- mnt_impl

			

		 
