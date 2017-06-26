-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
-------------------------------------------------------------------------------
-- 18 fevr 2013	: Alexandre Porcher					     --
-- Make the proof of equivalence of this monitor with the old monitor of miao--
-- which where proven. The new proof was made using 0in (see directory 	     --
-- verif_monitor).							     --	
-------------------------------------------------------------------------------
-- 10/12/2012								     --
-- Alexandre PORCHER, KMA, Negin JAVAHERI                                    --
-- check if the monitor interface is the same that in horus                  --
-- and make the modification in the monitor implementation if needed         --
-- Adding a generic GEN_OBS                                                  --
-- Change the implementation of the mnt_until to get a trigger signal        --
-- correct whith the generated code from horus tool                          --
-- Definitions                                                               --
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
-- checking PSL property:
--	(expr | FL_P) 	until!  cond
--	(expr | FL_P) 	until!_ cond
--	(expr | FL_P)	until   cond
--	(expr | FL_P) 	until_  cond
-- Syntax:
--	inst_name mnt_until 
--		generic map (OP_TYPE, GEN_OBS, EDGE, LEVEL)  
--		port 	map (clk, reset_n, start, expr, cond, trigger);
-- Definitions:
-- 	Inputs:
--		clk   	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		expr	: property to be checked every cycle until cond
--		cond   	: terminating condition, boolean type only
--	Outputs
--		trigger : indicates the need of checking/generating expr (or generating cond if GEN_OBS=COND_GEN)
--	Parameter:
--		OP_TYPE	: type of operator, strong type or weak type
--				WEAK_EXCL_OP	: INTEGER	:= 0;
--				STRONG_EXCL_OP	: INTEGER	:= 1;
--				WEAK_INCL_OP	: INTEGER	:= 2;
--				STRONG_INCL_OP	: INTEGER	:= 3;
--              GEN_OBS : if cond if observed or generated
--                              COND_OBS        : INTEGER       :=0;
--                              COND_GEN        : INTEGER       :=1;
--      WARNING  COND_GEN can be used only with *_EXCL_OP
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------





library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_until is
	generic (
		OP_TYPE	: INTEGER;
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
                GEN_OBS: INTEGER ;
		GATED_CLOCK : INTEGER

	);
	port (	clk, clk_en, reset_n, start, cond, expr	: IN STD_LOGIC;
	      	trigger, pending	: OUT STD_LOGIC
	);
end mnt_until;

architecture monitor of mnt_until is
	signal 	mem_start	: STD_LOGIC;

begin


-- purpose: memorize the start_signal until expr or cond
-- type   : sequential
-- inputs : clk, reset_n, start
-- outputs: mem_start
NGATED : IF GATED_CLOCK = 0 GENERATE
 memorize_start: process (clk)
 begin                                  -- process memorize_start
   if clk'event and clk = EDGE then      -- clock edge
     if reset_n = LEVEL then
       mem_start<='0';
     elsif cond = '1' or expr='0' then  		                                        			
       mem_start<='0';
     elsif start = '1' then
       mem_start<='1';
     end if;
    end if;
 end process memorize_start;
END GENERATE;

GATED : IF GATED_CLOCK = 1 GENERATE
 memorize_start: process (clk)
 begin                                  -- process memorize_start
   if clk'event and clk = EDGE then      -- clock edge
     if clk_en = '1' then
       if reset_n = LEVEL then
         mem_start<='0';
       elsif cond = '1' or expr='0' then  		                                        			
         mem_start<='0';
       elsif start = '1' then
         mem_start<='1';
       end if;
      end if;
    end if;
 end process memorize_start;
END GENERATE;

OBS_OBS_GENERATE: if GEN_OBS=COND_OBS generate
trigger <=   '1' when (start='1' or mem_start='1') and cond='0' and OP_TYPE<2 else
             '1' when  (start='1' or mem_start='1') and  OP_TYPE>=2 else
             '0';
end generate OBS_OBS_GENERATE;
    

GEN_OBS_GENERATE: if GEN_OBS = COND_GEN generate
trigger <=      '1' when  (start='1' or mem_start='1') and expr='0' and OP_TYPE<2 else
                'U' when  OP_TYPE>=2  else
                '0';
end generate GEN_OBS_GENERATE;

pending <= (start or mem_start) when (OP_TYPE = STRONG_EXCL_OP or OP_TYPE = STRONG_INCL_OP) else '0';  

	
end monitor; -- mnt_until

		
