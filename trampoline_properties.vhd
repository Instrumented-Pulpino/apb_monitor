--Entity trampoline_properties for specifiction ../../trampoline/machines/riscv/pulpino/monitors/trampoline_properties.psl
library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;
use work.psl_monitor_s_reset.all;


--entity 
entity trampoline_properties is
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
	call_handler : in std_logic;
	call_service : in std_logic;
	call_context : in std_logic;
	compare_entries : in std_logic;
	bubble_up : in std_logic;
	bubble_down : in std_logic;
	put_new_proc : in std_logic;
	put_preempted_proc : in std_logic;
	remove_front_proc : in std_logic;
	get_internal_resource : in std_logic;
	release_internal_resource : in std_logic;
	preempt : in std_logic;
	run_elected : in std_logic;
	start : in std_logic;
	schedule_from_running : in std_logic;
	terminate : in std_logic;
	block_s : in std_logic;
	activate_task : in std_logic;
	release : in std_logic;
	set_event : in std_logic;
	init_proc : in std_logic;
	init_os : in std_logic;
	remove_proc : in std_logic;
	start_scheduling : in std_logic;
	action_activate_task : in std_logic;
	action_set_event : in std_logic;
	call_save : in std_logic;
	central_interrupt_handler : in std_logic;
	activate_isr2 : in std_logic;
	counter_tick : in std_logic;
	notify_receiving_mos : in std_logic;
	activate_task_service : in std_logic;
	terminate_task_service : in std_logic;
	chain_task_service : in std_logic;
	schedule_service : in std_logic;
	set_event_service : in std_logic;
	wait_event_service : in std_logic;
	release_resource_service : in std_logic;
	start_os_service : in std_logic;
	terminate_isr2_service : in std_logic;
	terminate_application_service : in std_logic;
	increment_counter_service : in std_logic;
	call_terminate_task_service : in std_logic;
	reset : in std_logic;
	enable_IT : in std_logic;
	pending : out std_logic;
	valid : out std_logic;
	valid_39_Prop01 : out std_logic;
	valid_40_Prop02 : out std_logic;
	valid_41_Prop03 : out std_logic;
	valid_42_Prop04 : out std_logic;
	valid_43_Prop05 : out std_logic;
	valid_44_Prop06 : out std_logic;
	valid_45_Prop07 : out std_logic;
	valid_46_Prop08 : out std_logic;
	valid_47_Prop09 : out std_logic;
	valid_48_Prop10 : out std_logic;
	valid_49_Prop11 : out std_logic;
	valid_50_Prop12 : out std_logic;
	valid_51_Prop13 : out std_logic;
	valid_52_Prop14 : out std_logic;
	valid_53_Prop15 : out std_logic;
	valid_54_Prop16 : out std_logic;
	valid_55_Prop17 : out std_logic;
	valid_56_Prop18 : out std_logic;
	valid_57_Prop19 : out std_logic;
	valid_58_Prop20 : out std_logic;
	valid_59_Prop21 : out std_logic;
	valid_60_Prop22 : out std_logic;
	valid_61_Prop23 : out std_logic;
	valid_62_Prop24 : out std_logic;
	valid_63_Prop25 : out std_logic;
	valid_64_Prop26 : out std_logic;
	valid_65_Prop27 : out std_logic;
	valid_66_Prop28 : out std_logic;
	valid_67_Prop29 : out std_logic;
	valid_68_Prop30 : out std_logic;
	valid_69_Prop31 : out std_logic;
	valid_70_Prop32 : out std_logic;
	valid_71_Prop33 : out std_logic;
	valid_72_Prop34 : out std_logic;
	valid_73_Prop35 : out std_logic;
	valid_74_Prop36 : out std_logic;
	valid_75_Prop37 : out std_logic;
	valid_76_Prop38 : out std_logic;
	valid_77_Prop39 : out std_logic
	);
end entity trampoline_properties;
--end of entity 

--architecture declaration 
architecture behav of trampoline_properties is

--internal components 
component Prop01 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 pending_0 : out std_logic;
	 trigger_always_0_1 : out std_logic
	);
end component Prop01;

component Prop02 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_1_2 : in std_logic;
	 pending_1 : out std_logic;
	 trigger_imply_1_2 : out std_logic
	);
end component Prop02;

component Prop03 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_2_2 : in std_logic;
	 pending_2 : out std_logic;
	 trigger_imply_2_2 : out std_logic
	);
end component Prop03;

component Prop04 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_3_2 : in std_logic;
	 pending_3 : out std_logic;
	 trigger_imply_3_2 : out std_logic
	);
end component Prop04;

component Prop05 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_4_2 : in std_logic;
	 pending_4 : out std_logic;
	 trigger_imply_4_2 : out std_logic
	);
end component Prop05;

component Prop06 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_5_2 : in std_logic;
	 pending_5 : out std_logic;
	 trigger_imply_5_2 : out std_logic
	);
end component Prop06;

component Prop07 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_6_2 : in std_logic;
	 pending_6 : out std_logic;
	 trigger_imply_6_2 : out std_logic
	);
end component Prop07;

component Prop08 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_7_2 : in std_logic;
	 pending_7 : out std_logic;
	 trigger_imply_7_2 : out std_logic
	);
end component Prop08;

component Prop09 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_8_2 : in std_logic;
	 pending_8 : out std_logic;
	 trigger_imply_8_2 : out std_logic
	);
end component Prop09;

component Prop10 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_9_2 : in std_logic;
	 pending_9 : out std_logic;
	 trigger_imply_9_2 : out std_logic
	);
end component Prop10;

component Prop11 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_10_2 : in std_logic;
	 pending_10 : out std_logic;
	 trigger_imply_10_2 : out std_logic
	);
end component Prop11;

component Prop12 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_11_2 : in std_logic;
	 pending_11 : out std_logic;
	 trigger_imply_11_2 : out std_logic
	);
end component Prop12;

component Prop13 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_12_2 : in std_logic;
	 pending_12 : out std_logic;
	 trigger_imply_12_2 : out std_logic
	);
end component Prop13;

component Prop14 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_13_2 : in std_logic;
	 pending_13 : out std_logic;
	 trigger_imply_13_2 : out std_logic
	);
end component Prop14;

component Prop15 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_14_2 : in std_logic;
	 pending_14 : out std_logic;
	 trigger_imply_14_2 : out std_logic
	);
end component Prop15;

component Prop16 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_15_2 : in std_logic;
	 pending_15 : out std_logic;
	 trigger_imply_15_2 : out std_logic
	);
end component Prop16;

component Prop17 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_16_2 : in std_logic;
	 cond_16_3 : in std_logic;
	 expr_16_3 : in std_logic;
	 pending_16 : out std_logic;
	 trigger_before_16_3 : out std_logic
	);
end component Prop17;

component Prop18 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_17_2 : in std_logic;
	 pending_17 : out std_logic;
	 trigger_imply_17_2 : out std_logic
	);
end component Prop18;

component Prop19 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_18_2 : in std_logic;
	 pending_18 : out std_logic;
	 trigger_imply_18_2 : out std_logic
	);
end component Prop19;

component Prop20 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_19_2 : in std_logic;
	 pending_19 : out std_logic;
	 trigger_imply_19_2 : out std_logic
	);
end component Prop20;

component Prop21 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_20_2 : in std_logic;
	 pending_20 : out std_logic;
	 trigger_imply_20_2 : out std_logic
	);
end component Prop21;

component Prop22 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_21_2 : in std_logic;
	 pending_21 : out std_logic;
	 trigger_imply_21_2 : out std_logic
	);
end component Prop22;

component Prop23 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_22_2 : in std_logic;
	 pending_22 : out std_logic;
	 trigger_imply_22_2 : out std_logic
	);
end component Prop23;

component Prop24 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_23_2 : in std_logic;
	 pending_23 : out std_logic;
	 trigger_imply_23_2 : out std_logic
	);
end component Prop24;

component Prop25 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_24_2 : in std_logic;
	 pending_24 : out std_logic;
	 trigger_imply_24_2 : out std_logic
	);
end component Prop25;

component Prop26 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_25_2 : in std_logic;
	 pending_25 : out std_logic;
	 trigger_imply_25_2 : out std_logic
	);
end component Prop26;

component Prop27 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_26_2 : in std_logic;
	 pending_26 : out std_logic;
	 trigger_imply_26_2 : out std_logic
	);
end component Prop27;

component Prop28 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_27_2 : in std_logic;
	 pending_27 : out std_logic;
	 trigger_imply_27_2 : out std_logic
	);
end component Prop28;

component Prop29 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_28_2 : in std_logic;
	 pending_28 : out std_logic;
	 trigger_imply_28_2 : out std_logic
	);
end component Prop29;

component Prop30 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_29_2 : in std_logic;
	 pending_29 : out std_logic;
	 trigger_imply_29_2 : out std_logic
	);
end component Prop30;

component Prop31 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_30_2 : in std_logic;
	 pending_30 : out std_logic;
	 trigger_imply_30_2 : out std_logic
	);
end component Prop31;

component Prop32 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_31_2 : in std_logic;
	 pending_31 : out std_logic;
	 trigger_imply_31_2 : out std_logic
	);
end component Prop32;

component Prop33 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_32_2 : in std_logic;
	 pending_32 : out std_logic;
	 trigger_imply_32_2 : out std_logic
	);
end component Prop33;

component Prop34 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_33_2 : in std_logic;
	 pending_33 : out std_logic;
	 trigger_imply_33_2 : out std_logic
	);
end component Prop34;

component Prop35 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_34_2 : in std_logic;
	 pending_34 : out std_logic;
	 trigger_imply_34_2 : out std_logic
	);
end component Prop35;

component Prop36 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_35_2 : in std_logic;
	 pending_35 : out std_logic;
	 trigger_imply_35_2 : out std_logic
	);
end component Prop36;

component Prop37 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_36_2 : in std_logic;
	 pending_36 : out std_logic;
	 trigger_imply_36_2 : out std_logic
	);
end component Prop37;

component Prop38 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_37_2 : in std_logic;
	 pending_37 : out std_logic;
	 trigger_imply_37_2 : out std_logic
	);
end component Prop38;

component Prop39 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_38_2 : in std_logic;
	 pending_38 : out std_logic;
	 trigger_imply_38_2 : out std_logic
	);
end component Prop39;

--end of component declaration

--internal signals 
signal pending_0_tmp : std_logic;
signal trigger_always_0_1 : std_logic;
signal valid_39_tmp : std_logic;
signal sig_1 : std_logic;
signal sig_0 : std_logic;
signal expr_0 : std_logic;
signal ante_sig_4 : std_logic;
signal cond_1_2 : std_logic;
signal pending_1_tmp : std_logic;
signal trigger_imply_1_2 : std_logic;
signal valid_40_tmp : std_logic;
signal sig_5 : std_logic;
signal expr_5 : std_logic;
signal ante_sig_9 : std_logic;
signal cond_2_2 : std_logic;
signal pending_2_tmp : std_logic;
signal trigger_imply_2_2 : std_logic;
signal valid_41_tmp : std_logic;
signal ante_sig_10 : std_logic;
signal cond_3_2 : std_logic;
signal pending_3_tmp : std_logic;
signal trigger_imply_3_2 : std_logic;
signal valid_42_tmp : std_logic;
signal ante_sig_11 : std_logic;
signal cond_4_2 : std_logic;
signal pending_4_tmp : std_logic;
signal trigger_imply_4_2 : std_logic;
signal valid_43_tmp : std_logic;
signal sig_12 : std_logic;
signal expr_12 : std_logic;
signal ante_sig_16 : std_logic;
signal cond_5_2 : std_logic;
signal pending_5_tmp : std_logic;
signal trigger_imply_5_2 : std_logic;
signal valid_44_tmp : std_logic;
signal ante_sig_17 : std_logic;
signal cond_6_2 : std_logic;
signal pending_6_tmp : std_logic;
signal trigger_imply_6_2 : std_logic;
signal valid_45_tmp : std_logic;
signal ante_sig_18 : std_logic;
signal cond_7_2 : std_logic;
signal pending_7_tmp : std_logic;
signal trigger_imply_7_2 : std_logic;
signal valid_46_tmp : std_logic;
signal sig_21 : std_logic;
signal sig_19 : std_logic;
signal expr_19 : std_logic;
signal ante_sig_25 : std_logic;
signal cond_8_2 : std_logic;
signal pending_8_tmp : std_logic;
signal trigger_imply_8_2 : std_logic;
signal valid_47_tmp : std_logic;
signal ante_sig_26 : std_logic;
signal cond_9_2 : std_logic;
signal pending_9_tmp : std_logic;
signal trigger_imply_9_2 : std_logic;
signal valid_48_tmp : std_logic;
signal ante_sig_27 : std_logic;
signal cond_10_2 : std_logic;
signal pending_10_tmp : std_logic;
signal trigger_imply_10_2 : std_logic;
signal valid_49_tmp : std_logic;
signal expr_28 : std_logic;
signal ante_sig_30 : std_logic;
signal cond_11_2 : std_logic;
signal pending_11_tmp : std_logic;
signal trigger_imply_11_2 : std_logic;
signal valid_50_tmp : std_logic;
signal sig_32 : std_logic;
signal sig_31 : std_logic;
signal expr_31 : std_logic;
signal ante_sig_35 : std_logic;
signal cond_12_2 : std_logic;
signal pending_12_tmp : std_logic;
signal trigger_imply_12_2 : std_logic;
signal valid_51_tmp : std_logic;
signal expr_36 : std_logic;
signal ante_sig_38 : std_logic;
signal cond_13_2 : std_logic;
signal pending_13_tmp : std_logic;
signal trigger_imply_13_2 : std_logic;
signal valid_52_tmp : std_logic;
signal pending_14_tmp : std_logic;
signal trigger_imply_14_2 : std_logic;
signal valid_53_tmp : std_logic;
signal pending_15_tmp : std_logic;
signal trigger_imply_15_2 : std_logic;
signal valid_54_tmp : std_logic;
signal ante_sig_39 : std_logic;
signal cond_16_2 : std_logic;
signal ante_sig_40 : std_logic;
signal cond_16_3 : std_logic;
signal pending_16_tmp : std_logic;
signal trigger_before_16_3 : std_logic;
signal valid_55_tmp : std_logic;
signal ante_sig_41 : std_logic;
signal cond_17_2 : std_logic;
signal pending_17_tmp : std_logic;
signal trigger_imply_17_2 : std_logic;
signal valid_56_tmp : std_logic;
signal expr_42 : std_logic;
signal pending_18_tmp : std_logic;
signal trigger_imply_18_2 : std_logic;
signal valid_57_tmp : std_logic;
signal sig_45 : std_logic;
signal sig_44 : std_logic;
signal expr_44 : std_logic;
signal ante_sig_48 : std_logic;
signal cond_19_2 : std_logic;
signal pending_19_tmp : std_logic;
signal trigger_imply_19_2 : std_logic;
signal valid_58_tmp : std_logic;
signal sig_49 : std_logic;
signal expr_49 : std_logic;
signal pending_20_tmp : std_logic;
signal trigger_imply_20_2 : std_logic;
signal valid_59_tmp : std_logic;
signal sig_55 : std_logic;
signal sig_53 : std_logic;
signal expr_53 : std_logic;
signal pending_21_tmp : std_logic;
signal trigger_imply_21_2 : std_logic;
signal valid_60_tmp : std_logic;
signal expr_59 : std_logic;
signal pending_22_tmp : std_logic;
signal trigger_imply_22_2 : std_logic;
signal valid_61_tmp : std_logic;
signal expr_61 : std_logic;
signal pending_23_tmp : std_logic;
signal trigger_imply_23_2 : std_logic;
signal valid_62_tmp : std_logic;
signal expr_63 : std_logic;
signal pending_24_tmp : std_logic;
signal trigger_imply_24_2 : std_logic;
signal valid_63_tmp : std_logic;
signal pending_25_tmp : std_logic;
signal trigger_imply_25_2 : std_logic;
signal valid_64_tmp : std_logic;
signal sig_65 : std_logic;
signal expr_65 : std_logic;
signal pending_26_tmp : std_logic;
signal trigger_imply_26_2 : std_logic;
signal valid_65_tmp : std_logic;
signal pending_27_tmp : std_logic;
signal trigger_imply_27_2 : std_logic;
signal valid_66_tmp : std_logic;
signal pending_28_tmp : std_logic;
signal trigger_imply_28_2 : std_logic;
signal valid_67_tmp : std_logic;
signal pending_29_tmp : std_logic;
signal trigger_imply_29_2 : std_logic;
signal valid_68_tmp : std_logic;
signal pending_30_tmp : std_logic;
signal trigger_imply_30_2 : std_logic;
signal valid_69_tmp : std_logic;
signal sig_81 : std_logic;
signal sig_79 : std_logic;
signal sig_77 : std_logic;
signal sig_75 : std_logic;
signal sig_73 : std_logic;
signal sig_71 : std_logic;
signal sig_69 : std_logic;
signal expr_69 : std_logic;
signal pending_31_tmp : std_logic;
signal trigger_imply_31_2 : std_logic;
signal valid_70_tmp : std_logic;
signal sig_87 : std_logic;
signal sig_85 : std_logic;
signal expr_85 : std_logic;
signal pending_32_tmp : std_logic;
signal trigger_imply_32_2 : std_logic;
signal valid_71_tmp : std_logic;
signal pending_33_tmp : std_logic;
signal trigger_imply_33_2 : std_logic;
signal valid_72_tmp : std_logic;
signal sig_95 : std_logic;
signal sig_93 : std_logic;
signal sig_91 : std_logic;
signal expr_91 : std_logic;
signal pending_34_tmp : std_logic;
signal trigger_imply_34_2 : std_logic;
signal valid_73_tmp : std_logic;
signal sig_103 : std_logic;
signal sig_101 : std_logic;
signal sig_99 : std_logic;
signal expr_99 : std_logic;
signal pending_35_tmp : std_logic;
signal trigger_imply_35_2 : std_logic;
signal valid_74_tmp : std_logic;
signal expr_107 : std_logic;
signal pending_36_tmp : std_logic;
signal trigger_imply_36_2 : std_logic;
signal valid_75_tmp : std_logic;
signal sig_119 : std_logic;
signal sig_117 : std_logic;
signal sig_115 : std_logic;
signal sig_113 : std_logic;
signal sig_111 : std_logic;
signal sig_109 : std_logic;
signal expr_109 : std_logic;
signal pending_37_tmp : std_logic;
signal trigger_imply_37_2 : std_logic;
signal valid_76_tmp : std_logic;
signal pending_38_tmp : std_logic;
signal trigger_imply_38_2 : std_logic;
signal valid_77_tmp : std_logic;
--end of component and signals declaration 

begin

--component instantiation
Prop01_0 : Prop01
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 pending_0 => pending_0_tmp,
	 trigger_always_0_1 => trigger_always_0_1
	);

Prop02_1 : Prop02
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_1_2 => cond_1_2,
	 pending_1 => pending_1_tmp,
	 trigger_imply_1_2 => trigger_imply_1_2
	);

Prop03_2 : Prop03
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_2_2 => cond_2_2,
	 pending_2 => pending_2_tmp,
	 trigger_imply_2_2 => trigger_imply_2_2
	);

Prop04_3 : Prop04
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_3_2 => cond_3_2,
	 pending_3 => pending_3_tmp,
	 trigger_imply_3_2 => trigger_imply_3_2
	);

Prop05_4 : Prop05
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_4_2 => cond_4_2,
	 pending_4 => pending_4_tmp,
	 trigger_imply_4_2 => trigger_imply_4_2
	);

Prop06_5 : Prop06
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_5_2 => cond_5_2,
	 pending_5 => pending_5_tmp,
	 trigger_imply_5_2 => trigger_imply_5_2
	);

Prop07_6 : Prop07
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_6_2 => cond_6_2,
	 pending_6 => pending_6_tmp,
	 trigger_imply_6_2 => trigger_imply_6_2
	);

Prop08_7 : Prop08
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_7_2 => cond_7_2,
	 pending_7 => pending_7_tmp,
	 trigger_imply_7_2 => trigger_imply_7_2
	);

Prop09_8 : Prop09
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_8_2 => cond_8_2,
	 pending_8 => pending_8_tmp,
	 trigger_imply_8_2 => trigger_imply_8_2
	);

Prop10_9 : Prop10
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_9_2 => cond_9_2,
	 pending_9 => pending_9_tmp,
	 trigger_imply_9_2 => trigger_imply_9_2
	);

Prop11_10 : Prop11
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_10_2 => cond_10_2,
	 pending_10 => pending_10_tmp,
	 trigger_imply_10_2 => trigger_imply_10_2
	);

Prop12_11 : Prop12
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_11_2 => cond_11_2,
	 pending_11 => pending_11_tmp,
	 trigger_imply_11_2 => trigger_imply_11_2
	);

Prop13_12 : Prop13
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_12_2 => cond_12_2,
	 pending_12 => pending_12_tmp,
	 trigger_imply_12_2 => trigger_imply_12_2
	);

Prop14_13 : Prop14
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_13_2 => cond_13_2,
	 pending_13 => pending_13_tmp,
	 trigger_imply_13_2 => trigger_imply_13_2
	);

Prop15_14 : Prop15
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_14_2 => call_service,
	 pending_14 => pending_14_tmp,
	 trigger_imply_14_2 => trigger_imply_14_2
	);

Prop16_15 : Prop16
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_15_2 => call_context,
	 pending_15 => pending_15_tmp,
	 trigger_imply_15_2 => trigger_imply_15_2
	);

Prop17_16 : Prop17
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_16_2 => cond_16_2,
	 cond_16_3 => cond_16_3,
	 expr_16_3 => call_service,
	 pending_16 => pending_16_tmp,
	 trigger_before_16_3 => trigger_before_16_3
	);

Prop18_17 : Prop18
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_17_2 => cond_17_2,
	 pending_17 => pending_17_tmp,
	 trigger_imply_17_2 => trigger_imply_17_2
	);

Prop19_18 : Prop19
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_18_2 => activate_task_service,
	 pending_18 => pending_18_tmp,
	 trigger_imply_18_2 => trigger_imply_18_2
	);

Prop20_19 : Prop20
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_19_2 => cond_19_2,
	 pending_19 => pending_19_tmp,
	 trigger_imply_19_2 => trigger_imply_19_2
	);

Prop21_20 : Prop21
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_20_2 => terminate_task_service,
	 pending_20 => pending_20_tmp,
	 trigger_imply_20_2 => trigger_imply_20_2
	);

Prop22_21 : Prop22
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_21_2 => compare_entries,
	 pending_21 => pending_21_tmp,
	 trigger_imply_21_2 => trigger_imply_21_2
	);

Prop23_22 : Prop23
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_22_2 => bubble_up,
	 pending_22 => pending_22_tmp,
	 trigger_imply_22_2 => trigger_imply_22_2
	);

Prop24_23 : Prop24
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_23_2 => bubble_down,
	 pending_23 => pending_23_tmp,
	 trigger_imply_23_2 => trigger_imply_23_2
	);

Prop25_24 : Prop25
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_24_2 => put_preempted_proc,
	 pending_24 => pending_24_tmp,
	 trigger_imply_24_2 => trigger_imply_24_2
	);

Prop26_25 : Prop26
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_25_2 => put_new_proc,
	 pending_25 => pending_25_tmp,
	 trigger_imply_25_2 => trigger_imply_25_2
	);

Prop27_26 : Prop27
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_26_2 => remove_front_proc,
	 pending_26 => pending_26_tmp,
	 trigger_imply_26_2 => trigger_imply_26_2
	);

Prop28_27 : Prop28
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_27_2 => init_proc,
	 pending_27 => pending_27_tmp,
	 trigger_imply_27_2 => trigger_imply_27_2
	);

Prop29_28 : Prop29
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_28_2 => release,
	 pending_28 => pending_28_tmp,
	 trigger_imply_28_2 => trigger_imply_28_2
	);

Prop30_29 : Prop30
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_29_2 => run_elected,
	 pending_29 => pending_29_tmp,
	 trigger_imply_29_2 => trigger_imply_29_2
	);

Prop31_30 : Prop31
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_30_2 => start,
	 pending_30 => pending_30_tmp,
	 trigger_imply_30_2 => trigger_imply_30_2
	);

Prop32_31 : Prop32
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_31_2 => release_internal_resource,
	 pending_31 => pending_31_tmp,
	 trigger_imply_31_2 => trigger_imply_31_2
	);

Prop33_32 : Prop33
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_32_2 => block_s,
	 pending_32 => pending_32_tmp,
	 trigger_imply_32_2 => trigger_imply_32_2
	);

Prop34_33 : Prop34
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_33_2 => terminate,
	 pending_33 => pending_33_tmp,
	 trigger_imply_33_2 => trigger_imply_33_2
	);

Prop35_34 : Prop35
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_34_2 => activate_task,
	 pending_34 => pending_34_tmp,
	 trigger_imply_34_2 => trigger_imply_34_2
	);

Prop36_35 : Prop36
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_35_2 => set_event,
	 pending_35 => pending_35_tmp,
	 trigger_imply_35_2 => trigger_imply_35_2
	);

Prop37_36 : Prop37
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_36_2 => schedule_from_running,
	 pending_36 => pending_36_tmp,
	 trigger_imply_36_2 => trigger_imply_36_2
	);

Prop38_37 : Prop38
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_37_2 => start_scheduling,
	 pending_37 => pending_37_tmp,
	 trigger_imply_37_2 => trigger_imply_37_2
	);

Prop39_38 : Prop39
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_38_2 => init_os,
	 pending_38 => pending_38_tmp,
	 trigger_imply_38_2 => trigger_imply_38_2
	);
mnt_39 : mnt_monitor
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
	valid => valid_39_tmp
	);

mnt_40 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_1_2,
	expr => expr_5,
	valid => valid_40_tmp
	);

mnt_41 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_2_2,
	expr => E0,
	valid => valid_41_tmp
	);

mnt_42 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_3_2,
	expr => E0,
	valid => valid_42_tmp
	);

mnt_43 : mnt_monitor
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
	expr => expr_12,
	valid => valid_43_tmp
	);

mnt_44 : mnt_monitor
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
	expr => E1,
	valid => valid_44_tmp
	);

mnt_45 : mnt_monitor
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
	expr => E3,
	valid => valid_45_tmp
	);

mnt_46 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_7_2,
	expr => expr_19,
	valid => valid_46_tmp
	);

mnt_47 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_8_2,
	expr => call_handler,
	valid => valid_47_tmp
	);

mnt_48 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_9_2,
	expr => call_handler,
	valid => valid_48_tmp
	);

mnt_49 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_10_2,
	expr => expr_28,
	valid => valid_49_tmp
	);

mnt_50 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_11_2,
	expr => expr_31,
	valid => valid_50_tmp
	);

mnt_51 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_12_2,
	expr => expr_36,
	valid => valid_51_tmp
	);

mnt_52 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_13_2,
	expr => call_context,
	valid => valid_52_tmp
	);

mnt_53 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_14_2,
	expr => call_handler,
	valid => valid_53_tmp
	);

mnt_54 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_15_2,
	expr => call_handler,
	valid => valid_54_tmp
	);

mnt_55 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_before_16_3,
	expr => '0',
	valid => valid_55_tmp
	);

mnt_56 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_17_2,
	expr => expr_42,
	valid => valid_56_tmp
	);

mnt_57 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_18_2,
	expr => expr_44,
	valid => valid_57_tmp
	);

mnt_58 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_19_2,
	expr => expr_49,
	valid => valid_58_tmp
	);

mnt_59 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_20_2,
	expr => expr_53,
	valid => valid_59_tmp
	);

mnt_60 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_21_2,
	expr => expr_59,
	valid => valid_60_tmp
	);

mnt_61 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_22_2,
	expr => expr_61,
	valid => valid_61_tmp
	);

mnt_62 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_23_2,
	expr => expr_63,
	valid => valid_62_tmp
	);

mnt_63 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_24_2,
	expr => run_elected,
	valid => valid_63_tmp
	);

mnt_64 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_25_2,
	expr => expr_65,
	valid => valid_64_tmp
	);

mnt_65 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_26_2,
	expr => start,
	valid => valid_65_tmp
	);

mnt_66 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_27_2,
	expr => start,
	valid => valid_66_tmp
	);

mnt_67 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_28_2,
	expr => set_event,
	valid => valid_67_tmp
	);

mnt_68 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_29_2,
	expr => call_context,
	valid => valid_68_tmp
	);

mnt_69 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_30_2,
	expr => expr_69,
	valid => valid_69_tmp
	);

mnt_70 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_31_2,
	expr => expr_85,
	valid => valid_70_tmp
	);

mnt_71 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_32_2,
	expr => wait_event_service,
	valid => valid_71_tmp
	);

mnt_72 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_33_2,
	expr => expr_91,
	valid => valid_72_tmp
	);

mnt_73 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_34_2,
	expr => expr_99,
	valid => valid_73_tmp
	);

mnt_74 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_35_2,
	expr => expr_107,
	valid => valid_74_tmp
	);

mnt_75 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_36_2,
	expr => expr_109,
	valid => valid_75_tmp
	);

mnt_76 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_37_2,
	expr => start_os_service,
	valid => valid_76_tmp
	);

mnt_77 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_38_2,
	expr => start_os_service,
	valid => valid_77_tmp
	);

--end of component instantiation

--signal affectation
pending <= '0'; 

valid <= valid_39_tmp and valid_40_tmp and valid_41_tmp and valid_42_tmp and valid_43_tmp and valid_44_tmp and valid_45_tmp and valid_46_tmp and valid_47_tmp and valid_48_tmp and valid_49_tmp and valid_50_tmp and valid_51_tmp and valid_52_tmp and valid_53_tmp and valid_54_tmp and valid_55_tmp and valid_56_tmp and valid_57_tmp and valid_58_tmp and valid_59_tmp and valid_60_tmp and valid_61_tmp and valid_62_tmp and valid_63_tmp and valid_64_tmp and valid_65_tmp and valid_66_tmp and valid_67_tmp and valid_68_tmp and valid_69_tmp and valid_70_tmp and valid_71_tmp and valid_72_tmp and valid_73_tmp and valid_74_tmp and valid_75_tmp and valid_76_tmp and valid_77_tmp; 
sig_1 <= not(E6);
sig_0 <= not(E2);
expr_0 <= sig_0 and sig_1;

--process for cond_1_2=fell(E0)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_4 <= '0';--take care about the initial value
	else
		ante_sig_4 <= E0;
	end if;
end if;
end process;
cond_1_2 <= '1' when ante_sig_4='1' and E0='0' else '0';
--end cond_1_2=fell(E0)

sig_5 <= E1 or E3;
expr_5 <= sig_5 or E4;

--process for cond_2_2=fell(E1)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_9 <= '0';--take care about the initial value
	else
		ante_sig_9 <= E1;
	end if;
end if;
end process;
cond_2_2 <= '1' when ante_sig_9='1' and E1='0' else '0';
--end cond_2_2=fell(E1)


--process for cond_3_2=fell(E3)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_10 <= '0';--take care about the initial value
	else
		ante_sig_10 <= E3;
	end if;
end if;
end process;
cond_3_2 <= '1' when ante_sig_10='1' and E3='0' else '0';
--end cond_3_2=fell(E3)


--process for cond_4_2=fell(E4)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_11 <= '0';--take care about the initial value
	else
		ante_sig_11 <= E4;
	end if;
end if;
end process;
cond_4_2 <= '1' when ante_sig_11='1' and E4='0' else '0';
--end cond_4_2=fell(E4)

sig_12 <= E0 or E5;
expr_12 <= sig_12 or E7;

--process for cond_5_2=fell(E5)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_16 <= '0';--take care about the initial value
	else
		ante_sig_16 <= E5;
	end if;
end if;
end process;
cond_5_2 <= '1' when ante_sig_16='1' and E5='0' else '0';
--end cond_5_2=fell(E5)


--process for cond_6_2=fell(E7)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_17 <= '0';--take care about the initial value
	else
		ante_sig_17 <= E7;
	end if;
end if;
end process;
cond_6_2 <= '1' when ante_sig_17='1' and E7='0' else '0';
--end cond_6_2=fell(E7)


--process for cond_7_2=rose(run_elected)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_18 <= '0';--take care about the initial value
	else
		ante_sig_18 <= run_elected;
	end if;
end if;
end process;
cond_7_2 <= '1' when ante_sig_18='0' and run_elected='1' else '0';
--end cond_7_2=rose(run_elected)

sig_21 <= E1 or E3;
sig_19 <= sig_21 or E5;
expr_19 <= sig_19 or E7;

--process for cond_8_2=rose(run_elected)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_25 <= '0';--take care about the initial value
	else
		ante_sig_25 <= run_elected;
	end if;
end if;
end process;
cond_8_2 <= '1' when ante_sig_25='0' and run_elected='1' else '0';
--end cond_8_2=rose(run_elected)


--process for cond_9_2=fell(run_elected)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_26 <= '0';--take care about the initial value
	else
		ante_sig_26 <= run_elected;
	end if;
end if;
end process;
cond_9_2 <= '1' when ante_sig_26='1' and run_elected='0' else '0';
--end cond_9_2=fell(run_elected)


--process for cond_10_2=fell(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_27 <= '0';--take care about the initial value
	else
		ante_sig_27 <= call_handler;
	end if;
end if;
end process;
cond_10_2 <= '1' when ante_sig_27='1' and call_handler='0' else '0';
--end cond_10_2=fell(call_handler)

expr_28 <= E0 or E4;

--process for cond_11_2=fell(call_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_30 <= '0';--take care about the initial value
	else
		ante_sig_30 <= call_service;
	end if;
end if;
end process;
cond_11_2 <= '1' when ante_sig_30='1' and call_service='0' else '0';
--end cond_11_2=fell(call_service)

sig_32 <= not(E7);
sig_31 <= not(E5);
expr_31 <= sig_31 and sig_32;

--process for cond_12_2=rose(call_context)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_35 <= '0';--take care about the initial value
	else
		ante_sig_35 <= call_context;
	end if;
end if;
end process;
cond_12_2 <= '1' when ante_sig_35='0' and call_context='1' else '0';
--end cond_12_2=rose(call_context)

expr_36 <= E1 or E3;

--process for cond_13_2=fell(run_elected)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_38 <= '0';--take care about the initial value
	else
		ante_sig_38 <= run_elected;
	end if;
end if;
end process;
cond_13_2 <= '1' when ante_sig_38='1' and run_elected='0' else '0';
--end cond_13_2=fell(run_elected)


--process for cond_16_2=rose(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_39 <= '0';--take care about the initial value
	else
		ante_sig_39 <= call_handler;
	end if;
end if;
end process;
cond_16_2 <= '1' when ante_sig_39='0' and call_handler='1' else '0';
--end cond_16_2=rose(call_handler)


--process for cond_16_3=fell(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_40 <= '0';--take care about the initial value
	else
		ante_sig_40 <= call_handler;
	end if;
end if;
end process;
cond_16_3 <= '1' when ante_sig_40='1' and call_handler='0' else '0';
--end cond_16_3=fell(call_handler)


--process for cond_17_2=rose(call_save)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_41 <= '0';--take care about the initial value
	else
		ante_sig_41 <= call_save;
	end if;
end if;
end process;
cond_17_2 <= '1' when ante_sig_41='0' and call_save='1' else '0';
--end cond_17_2=rose(call_save)

expr_42 <= E3 and call_context;
sig_45 <= not(E5);
sig_44 <= not(E1);
expr_44 <= sig_44 and sig_45;

--process for cond_19_2=fell(activate_task_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_48 <= '0';--take care about the initial value
	else
		ante_sig_48 <= activate_task_service;
	end if;
end if;
end process;
cond_19_2 <= '1' when ante_sig_48='1' and activate_task_service='0' else '0';
--end cond_19_2=fell(activate_task_service)

sig_49 <= E0 or E3;
expr_49 <= sig_49 or E4;
sig_55 <= E0 or E1;
sig_53 <= sig_55 or E4;
expr_53 <= sig_53 or E5;
expr_59 <= bubble_up or bubble_down;
expr_61 <= put_new_proc or put_preempted_proc;
expr_63 <= remove_front_proc or remove_proc;
sig_65 <= release or activate_task;
expr_65 <= sig_65 or activate_isr2;
sig_81 <= schedule_from_running or terminate_task_service;
sig_79 <= sig_81 or terminate_isr2_service;
sig_77 <= sig_79 or chain_task_service;
sig_75 <= sig_77 or block_s;
sig_73 <= sig_75 or start_scheduling;
sig_71 <= sig_73 or release;
sig_69 <= sig_71 or terminate_application_service;
expr_69 <= sig_69 or call_terminate_task_service;
sig_87 <= block_s or terminate;
sig_85 <= sig_87 or schedule_service;
expr_85 <= sig_85 or terminate_application_service;
sig_95 <= terminate_task_service or chain_task_service;
sig_93 <= sig_95 or terminate_isr2_service;
sig_91 <= sig_93 or terminate_application_service;
expr_91 <= sig_91 or call_terminate_task_service;
sig_103 <= activate_task_service or chain_task_service;
sig_101 <= sig_103 or init_os;
sig_99 <= sig_101 or action_activate_task;
expr_99 <= sig_99 or terminate_application_service;
expr_107 <= set_event_service or action_set_event;
sig_119 <= activate_task_service or schedule_service;
sig_117 <= sig_119 or set_event_service;
sig_115 <= sig_117 or central_interrupt_handler;
sig_113 <= sig_115 or release_resource_service;
sig_111 <= sig_113 or counter_tick;
sig_109 <= sig_111 or increment_counter_service;
expr_109 <= sig_109 or notify_receiving_mos;
--trampoline_properties port out affectation
end architecture behav;
