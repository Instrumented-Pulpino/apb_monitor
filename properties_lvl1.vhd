--Entity properties_lvl1 for specifiction /home/cavalcante/Documents/TIMA/Stage/trampoline/machines/riscv/pulpino/monitors/tpl_properties_lvl1.psl
library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity properties_lvl1 is
	 port(
	clk : in std_logic;
	reset_n: in std_logic;
	E0 : in std_logic;
	E1 : in std_logic;
	E2 : in std_logic;
	E3 : in std_logic;
	E4 : in std_logic;
	E5 : in std_logic;
	E6 : in std_logic;
	E7 : in std_logic;
	run_elected : in std_logic;
	pending : out std_logic;
	valid : out std_logic;
	valid_7_Prop1 : out std_logic;
	valid_8_Prop2 : out std_logic;
	valid_9_Prop3 : out std_logic;
	valid_10_Prop4 : out std_logic;
	valid_11_Prop5 : out std_logic;
	valid_12_Prop6_7 : out std_logic;
	valid_13_Prop8 : out std_logic
	);
end entity properties_lvl1;
--end of entity 

--architecture declaration 
architecture behav of properties_lvl1 is

--internal components 
component Prop1 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 pending_0 : out std_logic;
	 trigger_always_0_1 : out std_logic
	);
end component Prop1;

component Prop2 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_1_2 : in std_logic;
	 pending_1 : out std_logic;
	 trigger_next_1_4 : out std_logic
	);
end component Prop2;

component Prop3 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_2_2 : in std_logic;
	 pending_2 : out std_logic;
	 trigger_next_2_3 : out std_logic
	);
end component Prop3;

component Prop4 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_3_2 : in std_logic;
	 pending_3 : out std_logic;
	 trigger_next_3_3 : out std_logic
	);
end component Prop4;

component Prop5 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_4_2 : in std_logic;
	 pending_4 : out std_logic;
	 trigger_imply_4_2 : out std_logic
	);
end component Prop5;

component Prop6_7 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_5_2 : in std_logic;
	 pending_5 : out std_logic;
	 trigger_imply_5_2 : out std_logic
	);
end component Prop6_7;

component Prop8 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_6_2 : in std_logic;
	 pending_6 : out std_logic;
	 trigger_imply_6_2 : out std_logic
	);
end component Prop8;

--end of component declaration

--internal signals 
signal pending_0_tmp : std_logic;
signal trigger_always_0_1 : std_logic;
signal valid_7_tmp : std_logic;
signal sig_0 : std_logic;
signal expr_0 : std_logic;
signal cond_1_2 : std_logic;
signal pending_1_tmp : std_logic;
signal trigger_next_1_4 : std_logic;
signal valid_8_tmp : std_logic;
signal expr_5 : std_logic;
signal sig_6 : std_logic;
signal cond_2_2 : std_logic;
signal pending_2_tmp : std_logic;
signal trigger_next_2_3 : std_logic;
signal valid_9_tmp : std_logic;
signal expr_9 : std_logic;
signal sig_10 : std_logic;
signal cond_3_2 : std_logic;
signal pending_3_tmp : std_logic;
signal trigger_next_3_3 : std_logic;
signal valid_10_tmp : std_logic;
signal expr_13 : std_logic;
signal ante_sig_14 : std_logic;
signal cond_4_2 : std_logic;
signal pending_4_tmp : std_logic;
signal trigger_imply_4_2 : std_logic;
signal valid_11_tmp : std_logic;
signal ante_sig_15 : std_logic;
signal cond_5_2 : std_logic;
signal pending_5_tmp : std_logic;
signal trigger_imply_5_2 : std_logic;
signal valid_12_tmp : std_logic;
signal expr_16 : std_logic;
signal ante_sig_18 : std_logic;
signal cond_6_2 : std_logic;
signal pending_6_tmp : std_logic;
signal trigger_imply_6_2 : std_logic;
signal valid_13_tmp : std_logic;
--end of component and signals declaration 

begin

--component instantiation
Prop1_0 : Prop1
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 pending_0 => pending_0_tmp,
	 trigger_always_0_1 => trigger_always_0_1
	);

Prop2_1 : Prop2
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_1_2 => cond_1_2,
	 pending_1 => pending_1_tmp,
	 trigger_next_1_4 => trigger_next_1_4
	);

Prop3_2 : Prop3
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_2_2 => cond_2_2,
	 pending_2 => pending_2_tmp,
	 trigger_next_2_3 => trigger_next_2_3
	);

Prop4_3 : Prop4
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_3_2 => cond_3_2,
	 pending_3 => pending_3_tmp,
	 trigger_next_3_3 => trigger_next_3_3
	);

Prop5_4 : Prop5
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_4_2 => cond_4_2,
	 pending_4 => pending_4_tmp,
	 trigger_imply_4_2 => trigger_imply_4_2
	);

Prop6_7_5 : Prop6_7
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_5_2 => cond_5_2,
	 pending_5 => pending_5_tmp,
	 trigger_imply_5_2 => trigger_imply_5_2
	);

Prop8_6 : Prop8
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_6_2 => cond_6_2,
	 pending_6 => pending_6_tmp,
	 trigger_imply_6_2 => trigger_imply_6_2
	);
mnt_7 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_always_0_1,
	expr => expr_0,
	valid => valid_7_tmp
	);

mnt_8 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_next_1_4,
	expr => expr_5,
	valid => valid_8_tmp
	);

mnt_9 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_next_2_3,
	expr => expr_9,
	valid => valid_9_tmp
	);

mnt_10 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_next_3_3,
	expr => expr_13,
	valid => valid_10_tmp
	);

mnt_11 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_4_2,
	expr => E4,
	valid => valid_11_tmp
	);

mnt_12 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_5_2,
	expr => expr_16,
	valid => valid_12_tmp
	);

mnt_13 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_6_2,
	expr => run_elected,
	valid => valid_13_tmp
	);

--end of component instantiation

--signal affectation
pending <= '0'; 

valid <= valid_7_tmp and valid_8_tmp and valid_9_tmp and valid_10_tmp and valid_11_tmp and valid_12_tmp and valid_13_tmp; 
sig_0 <= E2 or E6;
expr_0 <= not(sig_0);
cond_1_2 <= E5 or E7;
expr_5 <= not(E0);
sig_6 <= E5 or E7;
cond_2_2 <= not(sig_6);
expr_9 <= not(E1);
sig_10 <= E0 or E5;
cond_3_2 <= not(sig_10);
expr_13 <= not(E3);

--process for cond_4_2=fell(E0)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_14 <= '0';--take care about the initial value
	else
		ante_sig_14 <= E0;
	end if;
end if;
end process;
cond_4_2 <= '1' when ante_sig_14='1' and E0='0' else '0';
--end cond_4_2=fell(E0)


--process for cond_5_2=fell(E4)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_15 <= '0';--take care about the initial value
	else
		ante_sig_15 <= E4;
	end if;
end if;
end process;
cond_5_2 <= '1' when ante_sig_15='1' and E4='0' else '0';
--end cond_5_2=fell(E4)

expr_16 <= E5 or E7;

--process for cond_6_2=rose(E4)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_18 <= '0';--take care about the initial value
	else
		ante_sig_18 <= E4;
	end if;
end if;
end process;
cond_6_2 <= '1' when ante_sig_18='0' and E4='1' else '0';
--end cond_6_2=rose(E4)

--properties_lvl1 port out affectation
end architecture behav;
