-------------------------------------------------------------------------------
-- 10/12/2012								     --
-- Alexandre PORCHER, KMA, Negin JAVAHERI                                    --
-- Last operatio made: check if the monitor interface is the same that in    --
-- horus and make the modification in the monitor implementation if needed   --
-- change the interface of the entity (remove clk, resetn)                   --
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
--	expr_l OR FL_P
-- Syntax:
--	inst_name mnt_or port map (start, expr_l, trigger);
-- Definitions:
-- 	Inputs:
--		start	: start to begin evaluation of the property
--		expr_l	: left operand of logical OR, boolean type only
--	Outputs
--		trigger: Indicate the trigger cycle for expr or sub-property: FL_P
--		
--	Parameter:
--		no	
--	Note:
--		expr OR FL_P <=> not expr -> FL_P
--		left operand boolean only.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_or is
	port (start, expr_l: IN STD_LOGIC;
	      trigger	: OUT STD_LOGIC
	);
end mnt_or;

architecture monitor of mnt_or is
	signal cond_impl	:STD_LOGIC;
begin

cond_impl <= '1' when expr_l='0' else '0' ;

-- institiate implication monitor
u_sub_mnt: 	mnt_impl 
	port map (
		start => start,
		cond => cond_impl,
		trigger => trigger
	);
	
end monitor; -- mnt_or

			

		 
