-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--		last revision 10/12/2012				     --
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


library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

-- generate the first cycle for evaluation

entity gen_init is
	generic (
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
		GATED_CLOCK : INTEGER
	);
    port (
      	    clk, clk_en, reset_n: IN STD_LOGIC;
	    trigger: OUT STD_LOGIC
    );
end gen_init;

architecture monitor of gen_init is
	signal reset_n_d1: STD_LOGIC;
begin


GEN1 : IF GATED_CLOCK = 0 GENERATE

p0: process (clk)
begin
        if clk'event and clk=EDGE then
                reset_n_d1 <= reset_n;
        end if;
end process;
END GENERATE;

GEN : IF GATED_CLOCK = 1 GENERATE
p0: process (clk)
begin
        if clk'event and clk=EDGE then
		if clk_en='1' then
	                reset_n_d1 <= reset_n;
		end if;
        end if;
end process;
END GENERATE;

trigger <= '1' when not(reset_n=LEVEL) and (reset_n_d1=LEVEL) else '0';
--trigger <= '1' when not(reset_n_d1=LEVEL) else '0';

end monitor;
