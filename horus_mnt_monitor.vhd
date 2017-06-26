-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--		last revision 10/12/2012				     --
-- Alexandre PORCHER, KMA, Negin JAVAHERI                                    --
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
--  expr
-- Syntax:
--	inst_name mnt_monitor 
--		generic map (EDGE, LEVEL);  	
--		port 	map (clk, reset_n, start, expr, valid);
-- Definitions:
-- 	Inputs:
--		clk    	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		expr   	: input expression to be checked at the posedge of clk
--	Outputs
--		valid  	: indicate the property is valid or not
--			   	1: No error; 0: error
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;



entity mnt_monitor is
	generic (
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
		GATED_CLOCK : integer
	);
	port (	clk, clk_en, reset_n, start, expr       : in  STD_LOGIC; 
		valid : out STD_LOGIC
	);       
end mnt_monitor;

architecture cell of mnt_monitor is
	
begin  -- cell

NGATED : IF GATED_CLOCK = 0 GENERATE
  eval: process (clk)
  begin  -- process eval
  if clk'event and clk=EDGE then
      if reset_n=LEVEL then
       valid<='1';
      elsif start='1' and expr/='1'then
	valid<= '0';
      else
	valid<='1';
      end if;
    end if;  
  end process eval;
END GENERATE;

GATED : IF GATED_CLOCK = 1 GENERATE
  eval: process (clk)
  begin  -- process eval
  if clk'event and clk=EDGE then
    if clk_en = '1' then 
      if reset_n=LEVEL then
       valid<='1';
      elsif start='1' and expr/='1'then
	valid<= '0';
      else
	valid<='1';
      end if;
    end if;
  end if;  
  end process eval;
END GENERATE;

end cell;
  




