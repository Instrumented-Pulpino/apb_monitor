-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
-------------------------------------------------------------------------------
-- Dec 2014	: Negin JAVAHERI					     --
-------------------------------------------------------------------------------


library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;
		
-----------------------------------
-- Monochrome D FlipFlop
-----------------------------------
entity dff_mono is
	generic (
		EDGE : STD_LOGIC;
		LEVEL : STD_LOGIC;
		GATED_CLOCK : integer
	);
	port(
		clk, clk_en, reset_n : IN STD_LOGIC;
		d : IN STD_LOGIC;
		q : OUT STD_LOGIC
  );
end dff_mono;

architecture design of dff_mono is
begin

NGATED : IF GATED_CLOCK = 0 GENERATE
	process(clk)
	begin
		if clk'event and clk = EDGE then
			if reset_n = LEVEL then
				q <= '0';
			else
				q <= d;
			end if;
		end if;
	end process;
END GENERATE;

GATED : IF GATED_CLOCK = 1 GENERATE
	process(clk)
	begin
		if clk'event and clk = EDGE then
			if clk_en = '1' then
				if reset_n = LEVEL then
					q <= '0';
				else
					q <= d;
				end if;
			end if;
		end if;
	end process;
END GENERATE;


end design;
