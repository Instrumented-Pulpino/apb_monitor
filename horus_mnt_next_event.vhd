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
--	next_event! (cond) (expr | FL_P)
--	next_event  (cond) (expr | FL_P)
--	next_event! (cond) [NUM_COND] (expr | FL_P)
--	next_event  (cond) [NUM_COND] (expr | FL_P)
-- Syntax:
--	inst_name mnt_next_event 
--		generic map (NUM_COND, OP_TYPE, EDGE, LEVEL)  
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
--		NUM_COND: after NUM_COND times of cond is true, the expression
--			  should be true. NUM_COND > 0
--		OP_TYPE	: type of operator, strong type or weak type
--			  	strong type: STRONG_OP (1)
--				weak type  : WEAK_OP   (0) 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity mnt_next_event is
	generic (
    		NUM_COND 	: INTEGER;
		OP_TYPE		: INTEGER;
		EDGE 		: STD_LOGIC;
		LEVEL 		: STD_LOGIC;
		GATED_CLOCK 	: INTEGER
		
	);
	port (	clk, clk_en, reset_n, start, cond	: IN STD_LOGIC;
	      	trigger, pending	: OUT STD_LOGIC
	);
end mnt_next_event;

architecture monitor of mnt_next_event is
	constant ZERO_VECTOR	: STD_LOGIC_VECTOR (NUM_COND-1 downto 0) := (OTHERS => '0'); 
	signal checkbit_reg	: STD_LOGIC_VECTOR (NUM_COND-1 downto 0);
	signal trigger_t, pending_t	: STD_LOGIC;
begin

-- evaluation process


  GT1: if NUM_COND>1 generate
    NGATED1 : IF GATED_CLOCK = 0 GENERATE
	    evalulate_expr: process (clk)
	      variable checkbit	: STD_LOGIC_VECTOR (NUM_COND-1 downto 0);
	    begin
	      if clk'event and clk=EDGE then
		checkbit := checkbit_reg;
		checkbit(0) := checkbit_reg(0) or start;
		if reset_n =LEVEL then
		  checkbit := (OTHERS => '0');
		  checkbit_reg <= (OTHERS => '0');
		elsif cond = '1' then
		  checkbit_reg <= checkbit(NUM_COND-2 downto 0) & '0';	
		else
		  checkbit_reg <= checkbit;
		end if;
	      end if; 
	    end process;		


	    gen_pending: process (clk)
	    begin
	      if clk'event and clk=EDGE then
		if reset_n = LEVEL then
		  pending_t <= '0';
		elsif NUM_COND = 1 then
		  if start = '1' and trigger_t = '0' then
		    pending_t <= '1';
		  elsif trigger_t = '1' then 
		    pending_t <= '0';
		  end if;
		else
		  if start='1' then
		    pending_t<='1';
		  elsif trigger_t='1' and checkbit_reg(NUM_COND-1)='1' and checkbit_reg(NUM_COND-2 downto 0)=ZERO_VECTOR(NUM_COND-2 downto 0) then
		    pending_t<='0';
		  end if;		
		end if;
	      end if;
	    end process;
    END GENERATE NGATED1;

    GATED1 : IF GATED_CLOCK = 1 GENERATE
	    evalulate_expr: process (clk)
	      variable checkbit	: STD_LOGIC_VECTOR (NUM_COND-1 downto 0);
	    begin
	      if clk'event and clk=EDGE then
		if clk_en ='1' then
			checkbit := checkbit_reg;
			checkbit(0) := checkbit_reg(0) or start;
			if reset_n =LEVEL then
			  checkbit := (OTHERS => '0');
			  checkbit_reg <= (OTHERS => '0');
			elsif cond = '1' then
			  checkbit_reg <= checkbit(NUM_COND-2 downto 0) & '0';	
			else
			  checkbit_reg <= checkbit;
			end if;
		end if;
	      end if; 
	    end process;		


	    gen_pending: process (clk)
	    begin
	      if clk'event and clk=EDGE then
		if clk_en ='1' then 
			if reset_n = LEVEL then
			  pending_t <= '0';
			elsif NUM_COND = 1 then
			  if start = '1' and trigger_t = '0' then
			    pending_t <= '1';
			  elsif trigger_t = '1' then 
			    pending_t <= '0';
			  end if;
			else
			  if start='1' then
			    pending_t<='1';
			  elsif trigger_t='1' and checkbit_reg(NUM_COND-1)='1' and checkbit_reg(NUM_COND-2 downto 0)=ZERO_VECTOR(NUM_COND-2 downto 0) then
			    pending_t<='0';
			  end if;		
			end if;
		end if;
	      end if;
	    end process;
    END GENERATE GATED1;
  end generate GT1;


  EQ1: if NUM_COND=1 generate
    NGATED2 : IF GATED_CLOCK = 0 GENERATE
	    evalulate_expr: process (clk)
	      variable checkbit	: STD_LOGIC_VECTOR (NUM_COND-1 downto 0);
	    begin
	      if clk'event and clk=EDGE then
		checkbit := checkbit_reg;
		checkbit(0) := checkbit_reg(0) or start;
		if reset_n =LEVEL then
		  checkbit := (OTHERS => '0');
		  checkbit_reg <= (OTHERS => '0');
		elsif cond = '1' then
		  checkbit_reg(0) <= '0';	
		else
		  checkbit_reg <= checkbit;
		end if;
	      end if; 
	    end process;


	    gen_pending: process (clk)
	    begin
	      if clk'event and clk=EDGE then
		if reset_n = LEVEL then
		  pending_t <= '0';
		elsif NUM_COND = 1 then
		  if start = '1' and trigger_t = '0' then
		    pending_t <= '1';
		  elsif trigger_t = '1' then 
		    pending_t <= '0';
		  end if;
		else
		  if start='1' then
		    pending_t<='1';
		  elsif trigger_t='1' and checkbit_reg(0)='1' then
		    pending_t<='0';
		  end if;		
		end if;
	      end if;
	    end process;
   END GENERATE NGATED2;

   GATED2 : IF GATED_CLOCK = 1 GENERATE
	    evalulate_expr: process (clk)
	      variable checkbit	: STD_LOGIC_VECTOR (NUM_COND-1 downto 0);
	    begin
	      if clk'event and clk=EDGE then
		if clk_en = '1' then 
			checkbit := checkbit_reg;
			checkbit(0) := checkbit_reg(0) or start;
			if reset_n =LEVEL then
			  checkbit := (OTHERS => '0');
			  checkbit_reg <= (OTHERS => '0');
			elsif cond = '1' then
			  checkbit_reg(0) <= '0';	
			else
			  checkbit_reg <= checkbit;
			end if;
		end if;
	      end if; 
	    end process;


	    gen_pending: process (clk)
	    begin
	      if clk'event and clk=EDGE then
		if clk_en = '1' then
			if reset_n = LEVEL then
			  pending_t <= '0';
			elsif NUM_COND = 1 then
			  if start = '1' and trigger_t = '0' then
			    pending_t <= '1';
			  elsif trigger_t = '1' then 
			    pending_t <= '0';
			  end if;
			else
			  if start='1' then
			    pending_t<='1';
			  elsif trigger_t='1' and checkbit_reg(0)='1' then
			    pending_t<='0';
			  end if;		
			end if;
		end if;
	      end if;
	    end process;
   END GENERATE GATED2;

 end generate EQ1;

            
trigger_t <= (checkbit_reg(NUM_COND-1) and cond) when NUM_COND>1 else ((checkbit_reg(0) or start) and cond);
trigger <= trigger_t;
pending <= (start or pending_t) when (OP_TYPE = STRONG_OP) else '0';
	
end monitor; -- mnt_next_event

