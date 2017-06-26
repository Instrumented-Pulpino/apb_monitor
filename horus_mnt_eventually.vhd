-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- 18 fevr 2013	: Alexandre Porcher					     --
-- Make the proof of equivalence of this monitor with the old monitor of miao--
-- which where proven. The new proof was made using 0in (see directory 	     --
-- verif_monitor).							     --	
-------------------------------------------------------------------------------
-- 10/12/2012								     --
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
-- trigger property:
--	eventually! (expr)
-- Syntax:
--	inst_name mnt_eventually 
--              generic map (EDGE, LEVEL);  	
--	        port map (clk, reset_n, start, expr, trigger);
-- Definitions:
-- 	Inputs:
--		clk    	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		expr   	: input expression to be checked at the posedge of clk
--	Outputs
--		trigger  : indicate that the operand expr must be observed	
--the trigger is associated to a node true
--      => trigger is one => mnt_monitor evaluate true so the output valid is 1
--      if trigger=0 valid=1 by default
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------



library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;


entity mnt_eventually is
	generic (
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
		GATED_CLOCK : integer
	);
	port (clk, clk_en, reset_n, start, expr	: IN STD_LOGIC;
	     trigger, pending	: OUT STD_LOGIC
	);
end mnt_eventually;

architecture monitor of mnt_eventually is
	signal mem_start	: STD_LOGIC;
begin

-- purpose: memorize the start_signal until expr occurs
-- type   : sequential
-- inputs : clk, reset_n, start
-- outputs: mem_start
NGATED : IF GATED_CLOCK = 0 GENERATE
 memorize_start: process (clk)
 begin                                -- process memorize_start
   if clk'event and clk = EDGE then   -- clock edge
     if reset_n=LEVEL then
       mem_start<='0';
     elsif expr='1' then              -- expr true => evaluation is finished
       mem_start<='0';
     elsif start='1' then
       mem_start<='1';
     end if;
    end if;
   end process memorize_start;
END GENERATE;

GATED : IF GATED_CLOCK = 1 GENERATE
 memorize_start: process (clk)
 begin                                -- process memorize_start
   if clk'event and clk = EDGE then   -- clock edge
     if clk_en = '1' then 
       if reset_n=LEVEL then
         mem_start<='0';
       elsif expr='1' then              -- expr true => evaluation is finished
         mem_start<='0';
       elsif start='1' then
         mem_start<='1';
       end if;
     end if;
    end if;
   end process memorize_start;
END GENERATE;

trigger<= '0';                          -- property eventually!(bool) is always
                                        -- valid

pending<= (mem_start or start);  --property enventually!(bool) is no
                                         --more pending when bool occurs or if
                                         --the eventually! monitor was never started
                                                      

end monitor; -- mnt_eventually

			

		 
