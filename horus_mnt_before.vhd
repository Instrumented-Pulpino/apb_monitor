-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- 18 fevr 2013	: Alexandre Porcher					     --
-- Make the proof of equivalence of this monitor with the old monitor of miao--
-- which where proven. The new proof was made using 0in (see directory 	     --
-- verif_monitor).							     --	
-------------------------------------------------------------------------------
-- 10/12/2012				   				     --
-- Alexandre PORCHER, KMA, Negin JAVAHERI                                    --
-- check if the monitor interface is the same that in horus                  --
-- and make the modification in the monitor implementation if needed         --
-- Adding a generic  GEN_OBS                                                 --
-- change the internal implementation of the mnt_before to get a trigger     --
-- signal correct with the code given by horus tool                          --
-- Definitions:                                                              --
-- GEN_OBS: Defined wich operand is generated and wich one is observed       --
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
--	expr 	before! 	cond
--	expr 	before!_ 	cond
--	expr	before	        cond
--	expr 	before_ 	cond
-- Syntax:
--	inst_name mnt_before 
--		generic map (OP_TYPE, EDGE, LEVEL, GEN_OBS)  
--		port 	map (clk, reset_n, start, expr, cond, trigger, pending);
-- Definitions:
-- 	Inputs:
--		clk   	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		expr	: property to be checked every cycle before cond
--		cond   	: terminating condition, boolean type only
--	Outputs
--		trigger: the evaluation/generation of one operand  must be done. 
--              pending: the property is pending
--
--	Parameter:
--	   OP_TYPE : type of operator, strong type or weak type
--		       WEAK_EXCL_OP	: INTEGER	:= 0;
--	               STRONG_EXCL_OP	: INTEGER	:= 1;
--		       WEAK_INCL_OP	: INTEGER	:= 2;
--		       STRONG_INCL_OP	: INTEGER	:= 3;
--      NOTE :  for exclusive before, when expr is true cond must not be true in
--              the same cycle
--
--         GEN_OBS :  indicate which operand must be observed/generated
--                     EXPR_OBS_COND_OBS: INTEGER    :=0;
--                     EXPR_OBS_COND_GEN: INTEGER    :=1;
--                     EXPR_GEN_COND_OBS: INTEGER    :=2;
--
--      WARNING  EXPR_GEN_COND_OBS can be used only with *_INCL_OP
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--
--case 1] expr observed cond observed
--***********************************
--      =>trigger associated to FASLE
--      =>trigger=1 mnt_monitor gives output valid=0
--      NOTE : as expr and cond are observed, their is no combinationnal loop.
--exclusive before,
--cond=1 => expr before cond is fasle => trigger=1 => valid=0
--inclusive before,
--cond = 1 and expr=0 => expr before cond false => trigger=1 => valid=0 
--other case property is valid
--      => trigger=0=>valid=1 by default

--case 2] expr observed cond generated
--************************************
--      => trigger associated to not(cond)
--      => trigger = 1 gives cond=0
--as long as expr=0
--      => must generate cond to 0 => trigger=1 
--if expr='1' and exclusif before, cond must be 0 at this cycle
--      =>trigger=1
--if expr='1' evaluation finished

--case 3] expr generated cond observed
--************************************
--      =>trigger associated to the generation of cond=1 
--WARNING : restriction to inclusive operator
--when cond occurs, expr must be true in the same cycle
--      => trigger ='1' => cond=1 => expr before_ cond is true
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------



library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_before is
	generic (
		OP_TYPE : INTEGER;
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
                GEN_OBS: INTEGER;
		GATED_CLOCK : INTEGER
	);
	port (	clk, clk_en, reset_n, start, expr, cond	: IN STD_LOGIC;
	      	trigger,pending	: OUT STD_LOGIC
	);
end mnt_before;

architecture monitor of mnt_before is
	signal 	mem_start	: STD_LOGIC;

begin

-- purpose: memorize the start_signal until expr or cond
-- type   : sequential
-- inputs : clk, reset_n, start
-- outputs: mem_start

NGATED : IF GATED_CLOCK = 0 GENERATE
 memorize_start: process (clk)        -- process memorize_start
 begin  
   if clk'event and clk = EDGE then    -- clock edge
     if reset_n=LEVEL then
       mem_start<='0';
     elsif cond ='1' or expr='1' then -- if cond or expr true => evaluation is finished
       mem_start<='0';
     elsif start='1' then
       mem_start<='1';
     end if;
    end if;
   end process memorize_start;
END GENERATE;

GATED : IF GATED_CLOCK = 1 GENERATE
 memorize_start: process (clk)        -- process memorize_start
 begin  
   if clk'event and clk = EDGE then    -- clock edge
     if clk_en = '1' then
       if reset_n=LEVEL then
         mem_start<='0';
       elsif cond ='1' or expr='1' then -- if cond or expr true => evaluation is finished
         mem_start<='0';
       elsif start='1' then
         mem_start<='1';
       end if;
     end if;
    end if;
   end process memorize_start;
END GENERATE;

OBS_OBS_GENERATE: if GEN_OBS= EXPR_OBS_COND_OBS generate
         trigger<= '1' when (start='1' or mem_start='1') and  OP_TYPE<2 and cond='1' else
                   '1' when  (start='1' or mem_start='1') and  OP_TYPE>=2 and cond='1' and expr='0' else
                   '0';
end generate OBS_OBS_GENERATE;

     

OBS_GEN_GENERATE: if GEN_OBS = EXPR_OBS_COND_GEN generate
         trigger<= '1' when (start='1' or mem_start='1') and expr='0' else
                   '1' when (start='1' or mem_start='1') and OP_TYPE<2 else
                   '0';
end generate OBS_GEN_GENERATE;





GEN_OBS_GENERATE: if GEN_OBS = EXPR_GEN_COND_OBS generate
trigger<= '1' when  (start='1' or mem_start='1') and cond='1' and OP_TYPE>=2 else
          'U' when  OP_TYPE<2  else --restriction
          '0';
     end generate GEN_OBS_GENERATE;


pending<= (start or mem_start) when (OP_TYPE=STRONG_EXCL_OP or OP_TYPE=STRONG_INCL_OP) else '0';

  
end monitor; -- mnt_before

			

		 
