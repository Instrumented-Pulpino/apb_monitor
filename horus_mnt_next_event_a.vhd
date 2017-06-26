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
--	next_event_a! (cond) [LOW_COND to HIGH_COND] (expr | FL_P)
--	next_event_a  (cond) [LOW_COND to HIGH_COND] (expr | FL_P)
-- Syntax:
--	inst_name mnt_next_event_a 
--		generic map (LOW_COND, HIGH_COND, OP_TYPE, EDGE, LEVEL)  
--		port 	map (clk, reset_n, start, cond, trigger);
-- Definitions:
-- 	Inputs:
--		clk   	: active clock
--		reset_n	: synchronous reset signal
--		start  	: start evaluation of the input expression
--		cond	: the condition that expr should hold at the NUM_COND
--			  times of cond is true
--	Outputs
--		trigger: the evaluation/generation of expr is needed
--	Parameter:
--		LOW_COND: after [LOW_COND to HIGH_COND] times of cond is true, 
--		HIGH_COND: the expression should be true. 
--				0< LOW_COND <= HIGH_COND
--		OP_TYPE	: type of operator, strong type or weak type
--			  	strong type: STRONG_OP (1)
--				weak type  : WEAK_OP   (0) 
--	Note:
--		When LOW_COND=HIGH_COND, next_event_a <=> next_event
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_next_event_a is
	generic (
    	LOW_COND 	: INTEGER;
    	HIGH_COND 	: INTEGER;
    	OP_TYPE		: INTEGER;
	EDGE 		: STD_LOGIC;
	LEVEL 		: STD_LOGIC;
	GATED_CLOCK	: INTEGER
	);
	port (	clk, clk_en, reset_n, start, cond	: IN STD_LOGIC;
	      	trigger, pending		: OUT STD_LOGIC
	);
end mnt_next_event_a;

architecture monitor of mnt_next_event_a is
	constant ZERO_VECTOR	: STD_LOGIC_VECTOR (HIGH_COND-1 downto 0) := (OTHERS => '0');
	
	signal checkbit		: STD_LOGIC_VECTOR (HIGH_COND-1 downto 0);
	signal checkbit_reg	: STD_LOGIC_VECTOR (HIGH_COND-1 downto 0);
	signal check_en		: STD_LOGIC;
	signal pending_t	: STD_LOGIC;
begin

  Low_Cond_eq_High_Cond: if LOW_COND = HIGH_COND generate

    u_sub_mnt: 	mnt_next_event
      generic map(
        NUM_COND => HIGH_COND,
        OP_TYPE	=> OP_TYPE,
        EDGE => EDGE,
        LEVEL => LEVEL,
	GATED_CLOCK => GATED_CLOCK 	
	)
      port map (
        start => start,
	clk => clk,
	clk_en => clk_en,
        reset_n => reset_n,
        cond => cond,
        trigger => trigger,
        pending => pending
	);
  end generate Low_Cond_eq_High_Cond;

  Low_cond_st_High_cond: if LOW_COND < HIGH_COND generate

    checkbit <= checkbit_reg(HIGH_COND-1 downto 1) & (checkbit_reg(0) or start);

    check_en <= '1' when checkbit(HIGH_COND-1 downto LOW_COND-1) /= ZERO_VECTOR(HIGH_COND-1 downto LOW_COND-1)
		else '0';

    -- evaluation process
NGATED1 : IF GATED_CLOCK = 0 GENERATE
    evalulate_expr: process (clk)
    begin
      if clk'event and clk=EDGE then
        if reset_n=LEVEL then
          checkbit_reg <= (OTHERS => '0');
        elsif cond = '1' then
          checkbit_reg <= checkbit(HIGH_COND-2 downto 0) & '0'; 
          --rem HIGH_COND>LOW_COND>0 => HIGH_COND_min=2
        else
          checkbit_reg <= checkbit;
        end if;
      end if; 
    end process;		
END GENERATE;

GATED1 : IF GATED_CLOCK = 1 GENERATE
    evalulate_expr: process (clk)
    begin
      if clk'event and clk=EDGE then
	if clk_en = '1' then 
	        if reset_n=LEVEL then
        	  checkbit_reg <= (OTHERS => '0');
        	elsif cond = '1' then
        	  checkbit_reg <= checkbit(HIGH_COND-2 downto 0) & '0'; 
        	  --rem HIGH_COND>LOW_COND>0 => HIGH_COND_min=2
        	else
          	checkbit_reg <= checkbit;
        	end if;
	end if;
      end if; 
    end process;		
END GENERATE;
    trigger <= check_en and cond;

NGATED2 : IF GATED_CLOCK = 0 GENERATE
    gen_pending: process (clk)
    begin
      if clk'event and clk=EDGE then
        if reset_n=LEVEL then
          pending_t <= '0';
        else	
          if start='1' then
            pending_t <= '1';
          elsif cond='1' and checkbit(HIGH_COND-1)='1' and 
            checkbit(HIGH_COND-2 downto 0)=ZERO_VECTOR(HIGH_COND-2 downto 0) then
            pending_t<='0';
          end if;
        end if;
      end if;
    end process;
END GENERATE;

GATED2 : IF GATED_CLOCK = 1 GENERATE
    gen_pending: process (clk)
    begin
      if clk'event and clk=EDGE then
        if clk_en = '1' then 
          if reset_n=LEVEL then
            pending_t <= '0';
          else	
            if start='1' then
              pending_t <= '1';
            elsif cond='1' and checkbit(HIGH_COND-1)='1' and 
              checkbit(HIGH_COND-2 downto 0)=ZERO_VECTOR(HIGH_COND-2 downto 0) then
              pending_t<='0';
            end if;
          end if;
        end if;
      end if;
    end process;
END GENERATE;

    pending <= (start or pending_t) when (OP_TYPE = STRONG_OP) else '0';
  end generate Low_cond_st_High_cond;
  
end monitor; -- mnt_next_event_a




