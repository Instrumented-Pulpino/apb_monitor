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
-- Last operation made : check if the monitor interface is the same that in  --
--  horus and make the modification in the monitor implementation if needed  --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Sester Jérôme, 27 mai 2010                                                --
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
--	next_event_e! (cond) [LOW_COND to HIGH_COND] (expr)
--	next_event_e  (cond) [LOW_COND to HIGH_COND] (expr)
-- Syntax:
--	inst_name mnt_next_event_e 
--		generic map (LOW_COND, HIGH_COND, OP_TYPE)  
--		port 	map (clk, reset_n, start, cond, expr, trigger);
-- Definitions:
-- 	Inputs:
--		clk   	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		cond	: the condition that expr should hold at the NUM_COND
--			  times of cond is true
--		expr   	: input expression to be checked at the posedge of clk
--	Outputs
--		trigger: the evaluation/generation of expr=1 must be done 
--	Parameter:
--		LOW_CLK	: see below
--		HIGH_CLK: see below
--		        Withing [LOW_COND to HIGH_COND] times of cond is true, expr should be true at least once.
--		        WARNING : 0 < LOW_CLK <= HIGH_CLK
--		OP_TYPE	: type of operator, strong type or weak type
--			  	strong type: STRONG_OP (1)
--				weak type  : WEAK_OP   (0) 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
library work;
use work.psl_monitor_s_reset.all;

entity mnt_next_event_e is
	generic (
    	LOW_COND 	: INTEGER;
    	HIGH_COND 	: INTEGER;
    	OP_TYPE		: INTEGER;
	EDGE            : STD_LOGIC;
	LEVEL           : STD_LOGIC;
	GATED_CLOCK	: INTEGER
	);
	port (clk, clk_en, reset_n, start, cond, expr	: IN STD_LOGIC;
	      trigger, pending	: OUT STD_LOGIC
	);
end mnt_next_event_e;
architecture monitor of mnt_next_event_e is

	constant ZERO_VECTOR	: STD_LOGIC_VECTOR (HIGH_COND-1 downto 0) := (OTHERS => '0'); 
	
	signal checkbit		: STD_LOGIC_VECTOR (HIGH_COND-1 downto 0) ;
	
	signal checkbit_reg	: STD_LOGIC_VECTOR (HIGH_COND-1 downto 0) ;
	

begin

  High_cond_eq_Low_cond: if HIGH_COND = LOW_COND generate
    sub_mnt : mnt_next_event 
      generic map(
        NUM_COND 	=> HIGH_COND,
        OP_TYPE	=>OP_TYPE,
        EDGE 		=> EDGE,
        LEVEL 	=>LEVEL,
	GATED_CLOCK => GATED_CLOCK	
	)
      port map(
        clk           =>clk,	
	clk_en	      =>clk_en,
        reset_n       =>reset_n,
        start         =>start,
        cond	        =>cond,
        trigger       =>trigger,
        pending	=>pending
        );
  end generate High_cond_eq_Low_cond;

  High_cond_gt_Low_cond: if HIGH_COND > LOW_COND generate

    HIGHCONDgt3: if HIGH_COND>=3 generate
      checkbit (HIGH_COND-1 downto  1)<= checkbit_reg(HIGH_COND-2 downto 1) & (start or checkbit_reg(0))   when cond='1' 					else
                                         checkbit_reg(HIGH_COND-1 downto 1);
    end generate HIGHCONDgt3;


    HIGHCONDeq2: if HIGH_COND=2 generate
      checkbit (HIGH_COND-1)<= (start or checkbit_reg(0))   when cond='1' else
                               checkbit_reg(HIGH_COND-1);
    end generate HIGHCONDeq2;

    checkbit(0)<= '0' when cond='1' else checkbit_reg(0) or start;

NGATED : IF GATED_CLOCK = 0 GENERATE
    evalulate_expr: process (clk)
    begin
      
      if clk'event and clk=EDGE then          -- Clk edge
	if reset_n=LEVEL then                                    
          checkbit_reg <= ZERO_VECTOR;
	elsif expr='1' and cond='1' and checkbit(HIGH_COND-1 downto LOW_COND-1)/= ZERO_VECTOR(HIGH_COND-1 downto LOW_COND-1) then
          checkbit_reg <= checkbit;
          checkbit_reg(HIGH_COND-1 downto LOW_COND) <= ZERO_VECTOR(HIGH_COND-1 downto LOW_COND);
	else
          checkbit_reg <= checkbit;
        end if;
      end if;
    end process;	
END GENERATE NGATED;

GATED : IF GATED_CLOCK = 1 GENERATE
    evalulate_expr: process (clk)
    begin
      
      if clk'event and clk=EDGE then          -- Clk edge
	if clk_en = '1' then
  	  if reset_n=LEVEL then                                    
            checkbit_reg <= ZERO_VECTOR;
	  elsif expr='1' and cond='1' and checkbit(HIGH_COND-1 downto LOW_COND-1)/= ZERO_VECTOR(HIGH_COND-1 downto LOW_COND-1) then
            checkbit_reg <= checkbit;
            checkbit_reg(HIGH_COND-1 downto LOW_COND) <= ZERO_VECTOR(HIGH_COND-1 downto LOW_COND);
	  else
            checkbit_reg <= checkbit;
	  end if;          
	end if;
      end if;
    end process ;	
END GENERATE GATED;

    trigger <= checkbit_reg(HIGH_COND-1) and cond;

    pending <= '1' when (checkbit_reg or checkbit)/= ZERO_VECTOR and OP_TYPE = STRONG_OP else
               '0';
    
  end generate High_cond_gt_Low_cond;

end monitor; -- mnt_next_event_e

