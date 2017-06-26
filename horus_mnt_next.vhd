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

-- checking PSL property:
--	next! (expr | FL_P)
--	next  (expr | FL_P)
--	next! [NUM_CLK] (expr | FL_P)
--	next  [NUM_CLK] (expr | FL_P)
-- Syntax:
--	inst_name mnt_next 
--		generic map (NUM_CLK, OP_TYPE, EDGE, LEVEL)  
--		port 	map (clk, reset_n, start, trigger);
-- Definitions:
-- 	Inputs:
--		clk   	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		expr   	: input expression to be checked at the posedge of clk
--	Outputs
--		trigger: the evaluation/generation the next operand must be done
--	Parameter:
--		NUM_CLK	: after NUM_CLK of clock cycles, the expression should
--			  be true. NUM_CLK >= 0
--		OP_TYPE	: type of operator, strong type or weak type
--			  	strong type: STRONG_OP (1)
--				weak type  : WEAK_OP   (0) 


library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_next is
	generic (
          NUM_CLK       : INTEGER;
          OP_TYPE       : INTEGER;
          EDGE          : STD_LOGIC;
          LEVEL         : STD_LOGIC;
	  GATED_CLOCK	: INTEGER
	);
	port (	clk, clk_en, reset_n, start	: IN STD_LOGIC;
	      	trigger, pending	: OUT STD_LOGIC
	);
end mnt_next;

architecture monitor of mnt_next is
	constant ZERO_VECTOR	: STD_LOGIC_VECTOR (NUM_CLK downto 0) := (OTHERS => '0');
	
	signal checkbit		: STD_LOGIC_VECTOR (NUM_CLK downto 0);
	
	signal checkbit_reg	: STD_LOGIC_VECTOR (NUM_CLK downto 0);

begin

NUMCLKeq0: if NUM_CLK=0 generate
checkbit(0) <=  start;
end generate NUMCLKeq0;

NUMCLKgt0: if NUM_CLK>0 generate
checkbit <= checkbit_reg (NUM_CLK-1 downto 0) & start;
end generate NUMCLKgt0;

-- evaluation process
NGATED : IF GATED_CLOCK = 0 GENERATE
	evalulate_expr: process (clk)
	begin
		if clk'event and clk=EDGE then
			if reset_n=LEVEL then
				checkbit_reg <= (OTHERS => '0');
			else
				checkbit_reg <= checkbit;
			end if;
		end if; 
	end process;	
END GENERATE;

-- evaluation process
GATED : IF GATED_CLOCK = 1 GENERATE
	evalulate_expr: process (clk)
	begin
		if clk'event and clk=EDGE then
			if clk_en = '1' then
				if reset_n=LEVEL then
					checkbit_reg <= (OTHERS => '0');
				else
					checkbit_reg <= checkbit;
				end if;
			end if;
		end if; 
	end process;	
END GENERATE;

trigger <= checkbit(NUM_CLK);
pending <= '1' when (OP_TYPE = STRONG_OP and checkbit(NUM_CLK downto 0) /= ZERO_VECTOR ) else '0';
	
end monitor; -- mnt_next

			

		 
