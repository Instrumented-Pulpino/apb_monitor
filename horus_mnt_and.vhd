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
--	expr_l and (expr_r | FL_P)
-- Syntax:
--	inst_name mnt_and 
--		port 	map (start, trigger_l, trigger_r);
-- Definitions:
-- 	Inputs:
--		start	: start to begin evaluation of the property
--	Outputs
--		trigger_l: Indicate that the generation/observation of left operand is needed
--		trigger_r: Indicate that the generation/observation of right operand is needed
--	

		

library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_and is
	port (	start 			: IN STD_LOGIC;
	      	trigger_l, trigger_r	: OUT STD_LOGIC
	);
end mnt_and;

architecture monitor of mnt_and is

begin

trigger_l <= '1' when start='1' else '0';
trigger_r <= '1' when start='1' else '0';	
	
end monitor; -- mnt_and

			

		 
