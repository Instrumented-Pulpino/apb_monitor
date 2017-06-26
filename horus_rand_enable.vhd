-------------------------------------------------------------------------------
--		last revision 30/07/2015
-- Hugo Roynette
-- Add clk_en and GATED_CLOCK to low power synthesis
-------------------------------------------------------------------------------
-- Alexandre PORCHER			                                     --
-- 25 Avril 2013 : Create the rand_enable component for the random generation--
--  when Synthorus is used for generating generators.                        --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                                                                           --
-- Definitions:                                                              --
--                                                                           --
-- EDGE: Defined the clock edge. 1 to rising or 0 to falling                 --
-- LEVEL:Defined the actif level of reset. 1 to high level or 0 to low level --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Syntax:
--	inst_name rand_enable
--		port 	map (clk, reset_n, enable, lfsr_in, val_out)
-- Definitions:
-- 	Inputs:
--		clk    	: active clock
--		reset_n	: synchronous reset signal
--		enable 	: if 1 allows the propagation of input random value 
--			  lfsr_in to the output val_out
--		lfsr_in	: input random value comming from the lfsr            
--	Outputs
--		val_out : The value the signal must have in generation mode when
--			   it is not constraint by the trigger signals
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all;
use work.psl_monitor_s_reset.all;

entity rand_enable is
	generic (
		EDGE : std_logic;
		LEVEL : std_logic;
		GATED_CLOCK : INTEGER
	);
	 port(
		enable : in std_logic;
		lfsr_in : in std_logic;
		clk : in std_logic;
		clk_en : in std_logic;
		reset_n : in std_logic;
		val_out : out std_logic
	);
end rand_enable;

architecture monitor of rand_enable is

	signal val_out_reg_d, val_out_reg_q: STD_LOGIC;

begin

NGATED : IF GATED_CLOCK = 0 GENERATE
	sequential: process (clk)
	begin
		if clk'event and clk=EDGE then
			if reset_n=LEVEL then
				val_out_reg_q  <= '0';
			else 
				val_out_reg_q <= val_out_reg_d;
			end if;
		end if;
	end process;
END GENERATE;


GATED : IF GATED_CLOCK = 1 GENERATE
	sequential: process (clk)
	begin
		if clk'event and clk=EDGE then
			if clk_en = '1' then
				if reset_n=LEVEL then
					val_out_reg_q  <= '0';
				else 
					val_out_reg_q <= val_out_reg_d;
				end if;
			end if;
		end if;
	end process;
END GENERATE;

combinatory : process(enable, val_out_reg_q, lfsr_in)
begin
	if enable='1' then
		val_out_reg_d <= lfsr_in;
	else
		val_out_reg_d <= val_out_reg_q;
	end if;
end process;

val_out  <=  val_out_reg_q;
	
end monitor; -- rand_enable

			

