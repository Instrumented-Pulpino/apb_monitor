-------------------------------------------------------------------------------
--		last revision 8/02/2013				             --
-------------------------------------------------------------------------------
-- Alexandre Porcher : adding COND_OBS, COND_GEN, EXPR_OBS_COND_GEN,         --
-- EXPR_OBS_COND_OBS, EXPR_GEN_COND_OBS                                      --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Sester Jérôme, 29 Mars 2010                                               --
--                                                                           --
-- Adding reset synchrone                                         --
--                                                                           --
-- Definitions:                                                              --
--                                                                           --
-- EDGE: Defined the clock edge. 1 to rising or 0 to falling                 --
-- LEVEL:Defined the actif level of reset. 1 to high level or 0 to low level --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package psl_monitor_s_reset is
-- constant definition
	constant STRONG_OP	        : INTEGER	:= 1 ;
	constant WEAK_OP	        : INTEGER	:= 0 ;
	constant WEAK_EXCL_OP	        : INTEGER	:= 0;
	constant STRONG_EXCL_OP	        : INTEGER	:= 1;
	constant WEAK_INCL_OP	        : INTEGER	:= 2;
	constant STRONG_INCL_OP	        : INTEGER	:= 3;
	constant BIT_ONE	        : BIT		:= '1';
	constant BIT_ZERO	        : BIT		:= '0';
        constant EXPR_OBS_COND_OBS      : INTEGER       :=0;
        constant EXPR_OBS_COND_GEN      : INTEGER       :=1;
        constant EXPR_GEN_COND_OBS      : INTEGER       :=2;
	constant COND_OBS               : INTEGER       :=0;
        constant COND_GEN               : INTEGER       :=1;


-- component definition
	component mnt_abort is
		generic (
			EDGE 	: STD_LOGIC;
			GATED_CLOCK : INTEGER;
			LEVEL 	: STD_LOGIC
			
		);
		port (	clk, clk_en, abort, reset_n, start	: IN STD_LOGIC;
		      	trigger			: OUT STD_LOGIC
		);
	end component mnt_abort;

	component gen_init is	
		generic (
			EDGE 	: STD_LOGIC;
			LEVEL 	: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
                port (  clk, clk_en, reset_n	: IN STD_LOGIC;
                        trigger		: OUT STD_LOGIC
	   );
	end component gen_init;



	component mnt_always is
		generic (
			EDGE 	: STD_LOGIC;
			LEVEL 	: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start	: IN STD_LOGIC;
		      	trigger			: OUT STD_LOGIC
		);
	end component mnt_always;

	
	component mnt_and is
		port (	start			: IN STD_LOGIC;
		      	trigger_l, trigger_r	: OUT STD_LOGIC
		);
	end component mnt_and;


	component mnt_before is
		generic (
			OP_TYPE		: INTEGER	:= WEAK_EXCL_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
                        GEN_OBS         : INTEGER        := EXPR_OBS_COND_OBS;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start, expr, cond	: IN STD_LOGIC;
		      	trigger, pending		: OUT STD_LOGIC
		);
	end component mnt_before;



	component mnt_eventually is
		generic (
			EDGE : STD_LOGIC;
			LEVEL : STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (  clk, clk_en, reset_n, start, expr	: IN STD_LOGIC;
                        trigger, pending		: OUT STD_LOGIC
		);
	end component mnt_eventually;



	component mnt_impl is
		port (	start, cond 	: IN STD_LOGIC;
		      	trigger		: OUT STD_LOGIC
		);
	end component mnt_impl;




	component mnt_monitor is
		generic (
			EDGE 	: STD_LOGIC;
			LEVEL 	: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start, expr       : in  STD_LOGIC; 
			valid 				: out STD_LOGIC
		);         
	end component mnt_monitor;


	component mnt_next is
		generic (
	    		NUM_CLK 	: INTEGER	:= 1;
			OP_TYPE		: INTEGER	:= WEAK_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start	: IN STD_LOGIC;
		      	trigger, pending	: OUT STD_LOGIC
		);
	end component mnt_next;



	component mnt_next_a is
		generic (
	    		LOW_CLK 	: INTEGER	:= 1;
	    		HIGH_CLK 	: INTEGER	:= 1;
			OP_TYPE		: INTEGER	:= WEAK_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start	: IN std_logic;
		      	trigger, pending	: OUT std_logic
		);
	end component mnt_next_a;




	component mnt_next_e is
		generic (
	    		LOW_CLK 	: INTEGER	:= 1;
	    		HIGH_CLK 	: INTEGER	:= 1;
			OP_TYPE		: INTEGER	:= WEAK_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start, expr	: IN STD_LOGIC;
		      	trigger, pending		: OUT STD_LOGIC
		);
	end component mnt_next_e;



	component mnt_next_event is
		generic (
	    		NUM_COND 	: INTEGER	:= 1;
			OP_TYPE		: INTEGER	:= WEAK_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start, cond	: IN STD_LOGIC;
		      	trigger, pending		: OUT STD_LOGIC
		);
	end component mnt_next_event;




	component mnt_next_event_a is
		generic (
	    		LOW_COND 	: INTEGER	:= 1;
	    		HIGH_COND 	: INTEGER	:= 1;
	    		OP_TYPE		: INTEGER	:= WEAK_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
                port (  clk, clk_en, reset_n, start, cond       :  IN STD_LOGIC;
		      	trigger, pending	        : OUT STD_LOGIC
		);
	end component mnt_next_event_a;




	component mnt_next_event_e is
		generic (
	    		LOW_COND 	: INTEGER	:= 1;
	    		HIGH_COND 	: INTEGER	:= 1;
	    		OP_TYPE		: INTEGER	:= WEAK_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start, cond, expr	: IN STD_LOGIC;
		      	trigger, pending	        : OUT STD_LOGIC
		);
	end component mnt_next_event_e;



	component mnt_or is
			port (start, expr_l: IN STD_LOGIC;
	      trigger	: OUT STD_LOGIC
	);
	end component mnt_or;



	component mnt_until is
		generic (
			OP_TYPE		: INTEGER	:= WEAK_EXCL_OP;
			EDGE 		: STD_LOGIC;
			LEVEL 		: STD_LOGIC;
                	GEN_OBS		: INTEGER := COND_OBS;
			GATED_CLOCK : INTEGER
		);
		port (	clk, clk_en, reset_n, start, cond, expr	: IN STD_LOGIC;
		      	trigger, pending		: OUT STD_LOGIC
		);
	end component mnt_until;


	component mnt_sere_concat is
		generic (
			EDGE	: STD_LOGIC;
			LEVEL	: STD_LOGIC;
			GEN_OBS	: INTEGER;
			GATED_CLOCK : INTEGER
		);
		port (
			clk, clk_en, reset_n, start, cond1, cond2	: IN STD_LOGIC;
			trigger_l, trigger_r, trigger_l_d, trigger	: OUT STD_LOGIC
		);
	end component mnt_sere_concat;	


	component mnt_sere_impl_next is
		generic (
			EDGE : STD_LOGIC;
			LEVEL : STD_LOGIC;
			GATED_CLOCK : INTEGER
		);
		port(
			clk : IN STD_LOGIC;
			clk_en : IN STD_LOGIC;
			reset_n : IN STD_LOGIC;
			start, cond : IN STD_LOGIC;
			trigger : OUT STD_LOGIC
		);
	end component mnt_sere_impl_next;

	component mnt_sere_impl is
		generic (
			EDGE : STD_LOGIC;
			LEVEL : STD_LOGIC
		);
		port(
			clk : IN STD_LOGIC;
			reset_n : IN STD_LOGIC;
			start, cond : IN STD_LOGIC;
			trigger : OUT STD_LOGIC
		);
	end component mnt_sere_impl;

	component mnt_sere_star is
		generic (
			OP_TYPE : INTEGER;
			EDGE	: STD_LOGIC;
			LEVEL	: STD_LOGIC;
			GEN_OBS	: INTEGER;
			NUM_CLK :INTEGER;
			GATED_CLOCK : INTEGER
		);
		port (
			clk, clk_en, reset_n, start, cond1, cond2	: IN STD_LOGIC;
			trigger_b, trigger_d, trigger, pending	: OUT STD_LOGIC
		);
	end component mnt_sere_star;

	component mnt_sere_BAR is
		generic (
			EDGE	: STD_LOGIC;
			LEVEL	: STD_LOGIC;
			GEN_OBS	: INTEGER
		);
		port (
			clk, reset_n, start, cond1, cond2	: IN STD_LOGIC;
			trigger_l, trigger_r, trigger	: OUT STD_LOGIC
		);
	end component mnt_sere_BAR;

	component mnt_sere_fusion is
		generic (
			EDGE	: STD_LOGIC;
			LEVEL	: STD_LOGIC;
			GEN_OBS	: INTEGER;
			GATED_CLOCK : INTEGER
		);
		port (
			clk, clk_en, reset_n, start, cond1, cond2	: IN STD_LOGIC;
			trigger_l, trigger_r, trigger_l_d, trigger	: OUT STD_LOGIC
		);
	end component mnt_sere_fusion;


	component mnt_apersand_sere is
		generic (
			OP_TYPE : INTEGER;
			EDGE	: STD_LOGIC;
			LEVEL	: STD_LOGIC;
			GEN_OBS	: INTEGER;
			GATED_CLOCK : INTEGER
		);
		port (
			clk, clk_en, reset_n, start, cond1, cond2	: IN STD_LOGIC;
			trigger, trigger_l, trigger_r		: OUT STD_LOGIC
		);

	end component;


	component mnt_sere_plus is
		generic (
			OP_TYPE : INTEGER;
			EDGE	: STD_LOGIC;
			LEVEL	: STD_LOGIC;
			GEN_OBS	: INTEGER;
			GATED_CLOCK : INTEGER
		);
		port (
			clk, clk_en, reset_n, start, cond1, cond2	: IN STD_LOGIC;
			trigger_d, trigger, pending	: OUT STD_LOGIC
		);
	end component;

--fonction de conversion bit vers std_logic
    function b2l (src: BIT)
        return STD_LOGIC;

end psl_monitor_s_reset;

-- definition de la fonction de conversion bit vers std_logic
package body psl_monitor_s_reset is

    function b2l (src: BIT) return STD_LOGIC is
        variable R: std_logic;
    begin
        if src = '1' then
            R := '1';
        else
            R := '0';
        end if;
        return R;
    end b2l;

end psl_monitor_s_reset;
