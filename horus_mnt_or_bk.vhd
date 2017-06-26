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

entity mnt_or_bk is
	generic(
		GEN_OBS : integer;
		EDGE : std_logic;
		LEVEL : std_logic
	);
	port (start, cond1, cond2, clk, reset_n: IN STD_LOGIC;
	      trigger_l, trigger_r, trigger	: OUT STD_LOGIC
	);
end mnt_or_bk;

architecture monitor of mnt_OR_bk is
	signal cond_impl	:STD_LOGIC;
	signal trigg1, trigg2 : STD_LOGIC;
begin

--cond_impl <= '1' when expr_l='0' else '0' ;

--trigger <= '1' when start='1' and cond='1' else '0';


trigg1 <= '1' when start = '1' and cond2 = '0'and GEN_OBS = 2 else 
	      cond1 when start = '1' and (GEN_OBS = 1 or GEN_OBS = 0) else
		'0';
trigger_l <= trigg1;

trigg2 <= '1' when start = '1' and cond1 = '0'and GEN_OBS = 1 else 
	      cond2 when start = '1' and (GEN_OBS = 2 or GEN_OBS = 0) else
		'0';
trigger_r <= trigg2;
trigger <= trigg1 or trigg2;
-- institiate implication monitor
--u_sub_mnt: 	mnt_impl 
--	port map (
--		start => start,
--		cond => cond_impl,
--		trigger => trigger
--	);
	
end monitor; -- mnt_or






		 
