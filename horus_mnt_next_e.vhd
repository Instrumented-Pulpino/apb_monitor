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
-- Last operation made check if the monitor interface is the same that in    --
-- horus and make the modification in the monitor implementation if needed   --
-- change the internal implementation of the mnt_next_e to get a trigger     --
-- signal correct with the code given by horus tool and remove the valid     --
-- signal                                                                    --
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
--	next_e! [LOW_CLK to HIGH_CLK] (expr)
--	next_e  [LOW_CLK to HIGH_CLK] (expr)
-- Syntax:
--	inst_name mnt_next_e 
--		generic map (LOW_CLK, HIGH_CLK, OP_TYPE, EDGE, LEVEL)  
--		port 	map (clk, reset_n, start, expr, trigger, pending);
-- Definitions:
-- 	Inputs:
--		clk   	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		expr   	: input expression to be checked at the posedge of clk
--	Outputs
--		trigger : associated to the observation/generation of expr
--	Parameter:
--		LOW_CLK	: see below
--		HIGH_CLK: see below
--		        Withing all [LOW_CLK to HIGH_CLK] cycles, the expression should  be true at least once.
--		        WARNING : 0 <= LOW_CLK <= HIGH_CLK
--		OP_TYPE	: type of operator, strong type or weak type
--			  	strong type: STRONG_OP (1)
--				weak type  : WEAK_OP   (0)
--	Note:
--		next_e can only be boolean type, can not support temperal property
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------



library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_next_e is
  generic (
    LOW_CLK 	: INTEGER;
    HIGH_CLK 	: INTEGER;
    OP_TYPE		: INTEGER;
    EDGE : STD_LOGIC;
    LEVEL : STD_LOGIC;
    GATED_CLOCK : INTEGER
    );
  port (	
    clk, clk_en, reset_n, start, expr	: IN STD_LOGIC;
    trigger, pending	: OUT STD_LOGIC
    );
end mnt_next_e;

architecture monitor of mnt_next_e is
  constant ZERO_VECTOR	: std_logic_vector (HIGH_CLK downto 0) := (OTHERS => '0');
  
  signal checkbit	: std_logic_vector (HIGH_CLK downto 0);
  
  signal checkbit_reg	: std_logic_vector (HIGH_CLK downto 0);

begin
 --j=0 equivalent à un fil
HIGH_CLKeq0: if HIGH_CLK=0 generate 

   trigger<=start;
   pending <= start;	

end generate HIGH_CLKeq0;
 

--j>0 normal
HIGH_CLKgt0: if HIGH_CLK>0 generate 

  checkbit <= checkbit_reg(HIGH_CLK-1 downto 0) & start;
  -- evaluation process
NGATED : IF GATED_CLOCK = 0 GENERATE
  evalulate_expr: process (clk)
  begin
    if clk'event and clk=EDGE then
      if reset_n=LEVEL then
        checkbit_reg <= (OTHERS => '0');
      elsif expr='1' and checkbit(HIGH_CLK downto LOW_CLK) /= ZERO_VECTOR(HIGH_CLK downto LOW_CLK)then
	checkbit_reg <= checkbit;
        checkbit_reg (HIGH_CLK downto LOW_CLK) <= ZERO_VECTOR(HIGH_CLK downto LOW_CLK);
      else
        checkbit_reg <= checkbit;
      end if;
    end if; 
  end process;		
END GENERATE;

GATED : IF GATED_CLOCK = 1 GENERATE
  evalulate_expr: process (clk)
  begin
    if clk'event and clk=EDGE then
      if clk_en = '1' then
        if reset_n=LEVEL then
          checkbit_reg <= (OTHERS => '0');
        elsif expr='1' and checkbit(HIGH_CLK downto LOW_CLK) /= ZERO_VECTOR(HIGH_CLK downto LOW_CLK)then
	  checkbit_reg <= checkbit;
          checkbit_reg (HIGH_CLK downto LOW_CLK) <= ZERO_VECTOR(HIGH_CLK downto LOW_CLK);
        else
          checkbit_reg <= checkbit;
        end if;
      end if;
    end if; 
  end process;		
END GENERATE;

 trigger <= checkbit(HIGH_CLK);
 pending <= '1'  when 	checkbit /= ZERO_VECTOR	and OP_TYPE = 1 else
            '0';

end generate HIGH_CLKgt0;

end monitor; -- mnt_next_e

