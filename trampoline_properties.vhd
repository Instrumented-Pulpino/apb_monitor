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
	reentrancy_level_1 : in std_logic;
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
	running_equal_elected : in std_logic;
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
	valid_47_Prop01 : out std_logic;
	valid_48_Prop02 : out std_logic;
	valid_49_Prop03 : out std_logic;
	valid_50_Prop04 : out std_logic;
	valid_51_Prop05 : out std_logic;
	valid_52_Prop06 : out std_logic;
	valid_53_Prop07 : out std_logic;
	valid_54_Prop08 : out std_logic;
	valid_55_Prop09 : out std_logic;
	valid_56_Prop10 : out std_logic;
	valid_57_Prop11 : out std_logic;
	valid_58_Prop12 : out std_logic;
	valid_59_Prop13 : out std_logic;
	valid_60_Prop14 : out std_logic;
	valid_61_Prop15 : out std_logic;
	valid_62_Prop16 : out std_logic;
	valid_63_Prop17 : out std_logic;
	valid_64_Prop18 : out std_logic;
	valid_65_Prop19 : out std_logic;
	valid_66_Prop20 : out std_logic;
	valid_67_Prop21 : out std_logic;
	valid_68_Prop22 : out std_logic;
	valid_69_Prop23 : out std_logic;
	valid_70_Prop24 : out std_logic;
	valid_71_Prop25 : out std_logic;
	valid_72_Prop26 : out std_logic;
	valid_73_Prop27 : out std_logic;
	valid_74_Prop28 : out std_logic;
	valid_75_Prop29 : out std_logic;
	valid_76_Prop30 : out std_logic;
	valid_77_Prop31 : out std_logic;
	valid_78_Prop32 : out std_logic;
	valid_79_Prop33 : out std_logic;
	valid_80_Prop34 : out std_logic;
	valid_81_Prop35 : out std_logic;
	valid_82_Prop36 : out std_logic;
	valid_83_Prop37 : out std_logic;
	valid_84_Prop38 : out std_logic;
	valid_85_Prop39 : out std_logic;
	valid_86_Prop40 : out std_logic;
	valid_87_Prop41 : out std_logic;
	valid_88_Prop42 : out std_logic;
	valid_89_Prop43 : out std_logic;
	valid_90_Prop44 : out std_logic;
	valid_91_Prop45 : out std_logic;
	valid_92_Prop46 : out std_logic;
	valid_93_Prop47 : out std_logic
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
	 pending_16 : out std_logic;
	 trigger_imply_16_2 : out std_logic
	);
end component Prop17;

component Prop18 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_17_2 : in std_logic;
	 cond_17_3 : in std_logic;
	 expr_17_3 : in std_logic;
	 pending_17 : out std_logic;
	 trigger_before_17_3 : out std_logic
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

component Prop40 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_39_2 : in std_logic;
	 pending_39 : out std_logic;
	 trigger_imply_39_2 : out std_logic
	);
end component Prop40;

component Prop41 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_40_2 : in std_logic;
	 pending_40 : out std_logic;
	 trigger_imply_40_2 : out std_logic
	);
end component Prop41;

component Prop42 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_41_2 : in std_logic;
	 pending_41 : out std_logic;
	 trigger_imply_41_2 : out std_logic
	);
end component Prop42;

component Prop43 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_42_2 : in std_logic;
	 pending_42 : out std_logic;
	 trigger_imply_42_2 : out std_logic
	);
end component Prop43;

component Prop44 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_43_2 : in std_logic;
	 pending_43 : out std_logic;
	 trigger_imply_43_2 : out std_logic
	);
end component Prop44;

component Prop45 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_44_2 : in std_logic;
	 pending_44 : out std_logic;
	 trigger_imply_44_2 : out std_logic
	);
end component Prop45;

component Prop46 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_45_2 : in std_logic;
	 pending_45 : out std_logic;
	 trigger_imply_45_2 : out std_logic
	);
end component Prop46;

component Prop47 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_46_2 : in std_logic;
	 pending_46 : out std_logic;
	 trigger_imply_46_2 : out std_logic
	);
end component Prop47;

--end of component declaration

--internal signals 
signal pending_0_tmp : std_logic;
signal trigger_always_0_1 : std_logic;
signal valid_47_tmp : std_logic;
signal sig_1 : std_logic;
signal sig_0 : std_logic;
signal expr_0 : std_logic;
signal ante_sig_4 : std_logic;
signal cond_1_2 : std_logic;
signal pending_1_tmp : std_logic;
signal trigger_imply_1_2 : std_logic;
signal valid_48_tmp : std_logic;
signal sig_5 : std_logic;
signal expr_5 : std_logic;
signal ante_sig_9 : std_logic;
signal cond_2_2 : std_logic;
signal pending_2_tmp : std_logic;
signal trigger_imply_2_2 : std_logic;
signal valid_49_tmp : std_logic;
signal ante_sig_10 : std_logic;
signal cond_3_2 : std_logic;
signal pending_3_tmp : std_logic;
signal trigger_imply_3_2 : std_logic;
signal valid_50_tmp : std_logic;
signal ante_sig_11 : std_logic;
signal cond_4_2 : std_logic;
signal pending_4_tmp : std_logic;
signal trigger_imply_4_2 : std_logic;
signal valid_51_tmp : std_logic;
signal sig_12 : std_logic;
signal expr_12 : std_logic;
signal ante_sig_16 : std_logic;
signal cond_5_2 : std_logic;
signal pending_5_tmp : std_logic;
signal trigger_imply_5_2 : std_logic;
signal valid_52_tmp : std_logic;
signal ante_sig_17 : std_logic;
signal cond_6_2 : std_logic;
signal pending_6_tmp : std_logic;
signal trigger_imply_6_2 : std_logic;
signal valid_53_tmp : std_logic;
signal ante_sig_18 : std_logic;
signal cond_7_2 : std_logic;
signal pending_7_tmp : std_logic;
signal trigger_imply_7_2 : std_logic;
signal valid_54_tmp : std_logic;
signal ante_sig_21 : std_logic;
signal sig_19 : std_logic;
signal cond_8_2 : std_logic;
signal pending_8_tmp : std_logic;
signal trigger_imply_8_2 : std_logic;
signal valid_55_tmp : std_logic;
signal ante_sig_24 : std_logic;
signal sig_22 : std_logic;
signal cond_9_2 : std_logic;
signal pending_9_tmp : std_logic;
signal trigger_imply_9_2 : std_logic;
signal valid_56_tmp : std_logic;
signal ante_sig_25 : std_logic;
signal cond_10_2 : std_logic;
signal pending_10_tmp : std_logic;
signal trigger_imply_10_2 : std_logic;
signal valid_57_tmp : std_logic;
signal ante_sig_26 : std_logic;
signal cond_11_2 : std_logic;
signal pending_11_tmp : std_logic;
signal trigger_imply_11_2 : std_logic;
signal valid_58_tmp : std_logic;
signal sig_28 : std_logic;
signal sig_27 : std_logic;
signal expr_27 : std_logic;
signal ante_sig_31 : std_logic;
signal cond_12_2 : std_logic;
signal pending_12_tmp : std_logic;
signal trigger_imply_12_2 : std_logic;
signal valid_59_tmp : std_logic;
signal expr_32 : std_logic;
signal ante_sig_34 : std_logic;
signal cond_13_2 : std_logic;
signal pending_13_tmp : std_logic;
signal trigger_imply_13_2 : std_logic;
signal valid_60_tmp : std_logic;
signal pending_14_tmp : std_logic;
signal trigger_imply_14_2 : std_logic;
signal valid_61_tmp : std_logic;
signal pending_15_tmp : std_logic;
signal trigger_imply_15_2 : std_logic;
signal valid_62_tmp : std_logic;
signal pending_16_tmp : std_logic;
signal trigger_imply_16_2 : std_logic;
signal valid_63_tmp : std_logic;
signal ante_sig_35 : std_logic;
signal cond_17_2 : std_logic;
signal ante_sig_36 : std_logic;
signal cond_17_3 : std_logic;
signal pending_17_tmp : std_logic;
signal trigger_before_17_3 : std_logic;
signal valid_64_tmp : std_logic;
signal ante_sig_37 : std_logic;
signal cond_18_2 : std_logic;
signal pending_18_tmp : std_logic;
signal trigger_imply_18_2 : std_logic;
signal valid_65_tmp : std_logic;
signal expr_38 : std_logic;
signal pending_19_tmp : std_logic;
signal trigger_imply_19_2 : std_logic;
signal valid_66_tmp : std_logic;
signal sig_41 : std_logic;
signal sig_40 : std_logic;
signal expr_40 : std_logic;
signal ante_sig_44 : std_logic;
signal cond_20_2 : std_logic;
signal pending_20_tmp : std_logic;
signal trigger_imply_20_2 : std_logic;
signal valid_67_tmp : std_logic;
signal sig_45 : std_logic;
signal expr_45 : std_logic;
signal pending_21_tmp : std_logic;
signal trigger_imply_21_2 : std_logic;
signal valid_68_tmp : std_logic;
signal expr_49 : std_logic;
signal pending_22_tmp : std_logic;
signal trigger_imply_22_2 : std_logic;
signal valid_69_tmp : std_logic;
signal sig_51 : std_logic;
signal expr_51 : std_logic;
signal ante_sig_54 : std_logic;
signal cond_23_2 : std_logic;
signal pending_23_tmp : std_logic;
signal trigger_imply_23_2 : std_logic;
signal valid_70_tmp : std_logic;
signal expr_55 : std_logic;
signal pending_24_tmp : std_logic;
signal trigger_imply_24_2 : std_logic;
signal valid_71_tmp : std_logic;
signal expr_57 : std_logic;
signal pending_25_tmp : std_logic;
signal trigger_imply_25_2 : std_logic;
signal valid_72_tmp : std_logic;
signal sig_59 : std_logic;
signal expr_59 : std_logic;
signal ante_sig_62 : std_logic;
signal cond_26_2 : std_logic;
signal pending_26_tmp : std_logic;
signal trigger_imply_26_2 : std_logic;
signal valid_73_tmp : std_logic;
signal sig_63 : std_logic;
signal expr_63 : std_logic;
signal pending_27_tmp : std_logic;
signal trigger_imply_27_2 : std_logic;
signal valid_74_tmp : std_logic;
signal expr_67 : std_logic;
signal pending_28_tmp : std_logic;
signal trigger_imply_28_2 : std_logic;
signal valid_75_tmp : std_logic;
signal expr_69 : std_logic;
signal pending_29_tmp : std_logic;
signal trigger_imply_29_2 : std_logic;
signal valid_76_tmp : std_logic;
signal expr_71 : std_logic;
signal pending_30_tmp : std_logic;
signal trigger_imply_30_2 : std_logic;
signal valid_77_tmp : std_logic;
signal expr_73 : std_logic;
signal pending_31_tmp : std_logic;
signal trigger_imply_31_2 : std_logic;
signal valid_78_tmp : std_logic;
signal expr_75 : std_logic;
signal pending_32_tmp : std_logic;
signal trigger_imply_32_2 : std_logic;
signal valid_79_tmp : std_logic;
signal pending_33_tmp : std_logic;
signal trigger_imply_33_2 : std_logic;
signal valid_80_tmp : std_logic;
signal sig_77 : std_logic;
signal expr_77 : std_logic;
signal pending_34_tmp : std_logic;
signal trigger_imply_34_2 : std_logic;
signal valid_81_tmp : std_logic;
signal pending_35_tmp : std_logic;
signal trigger_imply_35_2 : std_logic;
signal valid_82_tmp : std_logic;
signal pending_36_tmp : std_logic;
signal trigger_imply_36_2 : std_logic;
signal valid_83_tmp : std_logic;
signal pending_37_tmp : std_logic;
signal trigger_imply_37_2 : std_logic;
signal valid_84_tmp : std_logic;
signal pending_38_tmp : std_logic;
signal trigger_imply_38_2 : std_logic;
signal valid_85_tmp : std_logic;
signal sig_93 : std_logic;
signal sig_91 : std_logic;
signal sig_89 : std_logic;
signal sig_87 : std_logic;
signal sig_85 : std_logic;
signal sig_83 : std_logic;
signal sig_81 : std_logic;
signal expr_81 : std_logic;
signal pending_39_tmp : std_logic;
signal trigger_imply_39_2 : std_logic;
signal valid_86_tmp : std_logic;
signal sig_99 : std_logic;
signal sig_97 : std_logic;
signal expr_97 : std_logic;
signal pending_40_tmp : std_logic;
signal trigger_imply_40_2 : std_logic;
signal valid_87_tmp : std_logic;
signal pending_41_tmp : std_logic;
signal trigger_imply_41_2 : std_logic;
signal valid_88_tmp : std_logic;
signal sig_107 : std_logic;
signal sig_105 : std_logic;
signal sig_103 : std_logic;
signal expr_103 : std_logic;
signal pending_42_tmp : std_logic;
signal trigger_imply_42_2 : std_logic;
signal valid_89_tmp : std_logic;
signal sig_115 : std_logic;
signal sig_113 : std_logic;
signal sig_111 : std_logic;
signal expr_111 : std_logic;
signal pending_43_tmp : std_logic;
signal trigger_imply_43_2 : std_logic;
signal valid_90_tmp : std_logic;
signal expr_119 : std_logic;
signal pending_44_tmp : std_logic;
signal trigger_imply_44_2 : std_logic;
signal valid_91_tmp : std_logic;
signal sig_131 : std_logic;
signal sig_129 : std_logic;
signal sig_127 : std_logic;
signal sig_125 : std_logic;
signal sig_123 : std_logic;
signal sig_121 : std_logic;
signal expr_121 : std_logic;
signal pending_45_tmp : std_logic;
signal trigger_imply_45_2 : std_logic;
signal valid_92_tmp : std_logic;
signal pending_46_tmp : std_logic;
signal trigger_imply_46_2 : std_logic;
signal valid_93_tmp : std_logic;
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
	 cond_14_2 => run_elected,
	 pending_14 => pending_14_tmp,
	 trigger_imply_14_2 => trigger_imply_14_2
	);

Prop16_15 : Prop16
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_15_2 => call_service,
	 pending_15 => pending_15_tmp,
	 trigger_imply_15_2 => trigger_imply_15_2
	);

Prop17_16 : Prop17
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_16_2 => call_context,
	 pending_16 => pending_16_tmp,
	 trigger_imply_16_2 => trigger_imply_16_2
	);

Prop18_17 : Prop18
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_17_2 => cond_17_2,
	 cond_17_3 => cond_17_3,
	 expr_17_3 => call_service,
	 pending_17 => pending_17_tmp,
	 trigger_before_17_3 => trigger_before_17_3
	);

Prop19_18 : Prop19
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_18_2 => cond_18_2,
	 pending_18 => pending_18_tmp,
	 trigger_imply_18_2 => trigger_imply_18_2
	);

Prop20_19 : Prop20
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_19_2 => activate_task_service,
	 pending_19 => pending_19_tmp,
	 trigger_imply_19_2 => trigger_imply_19_2
	);

Prop21_20 : Prop21
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_20_2 => cond_20_2,
	 pending_20 => pending_20_tmp,
	 trigger_imply_20_2 => trigger_imply_20_2
	);

Prop22_21 : Prop22
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_21_2 => terminate_task_service,
	 pending_21 => pending_21_tmp,
	 trigger_imply_21_2 => trigger_imply_21_2
	);

Prop23_22 : Prop23
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_22_2 => chain_task_service,
	 pending_22 => pending_22_tmp,
	 trigger_imply_22_2 => trigger_imply_22_2
	);

Prop24_23 : Prop24
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_23_2 => cond_23_2,
	 pending_23 => pending_23_tmp,
	 trigger_imply_23_2 => trigger_imply_23_2
	);

Prop25_24 : Prop25
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_24_2 => schedule_service,
	 pending_24 => pending_24_tmp,
	 trigger_imply_24_2 => trigger_imply_24_2
	);

Prop26_25 : Prop26
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_25_2 => set_event_service,
	 pending_25 => pending_25_tmp,
	 trigger_imply_25_2 => trigger_imply_25_2
	);

Prop27_26 : Prop27
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_26_2 => cond_26_2,
	 pending_26 => pending_26_tmp,
	 trigger_imply_26_2 => trigger_imply_26_2
	);

Prop28_27 : Prop28
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_27_2 => wait_event_service,
	 pending_27 => pending_27_tmp,
	 trigger_imply_27_2 => trigger_imply_27_2
	);

Prop29_28 : Prop29
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_28_2 => release_resource_service,
	 pending_28 => pending_28_tmp,
	 trigger_imply_28_2 => trigger_imply_28_2
	);

Prop30_29 : Prop30
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_29_2 => compare_entries,
	 pending_29 => pending_29_tmp,
	 trigger_imply_29_2 => trigger_imply_29_2
	);

Prop31_30 : Prop31
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_30_2 => bubble_up,
	 pending_30 => pending_30_tmp,
	 trigger_imply_30_2 => trigger_imply_30_2
	);

Prop32_31 : Prop32
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_31_2 => bubble_down,
	 pending_31 => pending_31_tmp,
	 trigger_imply_31_2 => trigger_imply_31_2
	);

Prop33_32 : Prop33
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_32_2 => put_preempted_proc,
	 pending_32 => pending_32_tmp,
	 trigger_imply_32_2 => trigger_imply_32_2
	);

Prop34_33 : Prop34
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_33_2 => put_new_proc,
	 pending_33 => pending_33_tmp,
	 trigger_imply_33_2 => trigger_imply_33_2
	);

Prop35_34 : Prop35
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_34_2 => remove_front_proc,
	 pending_34 => pending_34_tmp,
	 trigger_imply_34_2 => trigger_imply_34_2
	);

Prop36_35 : Prop36
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_35_2 => init_proc,
	 pending_35 => pending_35_tmp,
	 trigger_imply_35_2 => trigger_imply_35_2
	);

Prop37_36 : Prop37
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_36_2 => release,
	 pending_36 => pending_36_tmp,
	 trigger_imply_36_2 => trigger_imply_36_2
	);

Prop38_37 : Prop38
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_37_2 => run_elected,
	 pending_37 => pending_37_tmp,
	 trigger_imply_37_2 => trigger_imply_37_2
	);

Prop39_38 : Prop39
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_38_2 => start,
	 pending_38 => pending_38_tmp,
	 trigger_imply_38_2 => trigger_imply_38_2
	);

Prop40_39 : Prop40
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_39_2 => release_internal_resource,
	 pending_39 => pending_39_tmp,
	 trigger_imply_39_2 => trigger_imply_39_2
	);

Prop41_40 : Prop41
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_40_2 => block_s,
	 pending_40 => pending_40_tmp,
	 trigger_imply_40_2 => trigger_imply_40_2
	);

Prop42_41 : Prop42
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_41_2 => terminate,
	 pending_41 => pending_41_tmp,
	 trigger_imply_41_2 => trigger_imply_41_2
	);

Prop43_42 : Prop43
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_42_2 => activate_task,
	 pending_42 => pending_42_tmp,
	 trigger_imply_42_2 => trigger_imply_42_2
	);

Prop44_43 : Prop44
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_43_2 => set_event,
	 pending_43 => pending_43_tmp,
	 trigger_imply_43_2 => trigger_imply_43_2
	);

Prop45_44 : Prop45
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_44_2 => schedule_from_running,
	 pending_44 => pending_44_tmp,
	 trigger_imply_44_2 => trigger_imply_44_2
	);

Prop46_45 : Prop46
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_45_2 => start_scheduling,
	 pending_45 => pending_45_tmp,
	 trigger_imply_45_2 => trigger_imply_45_2
	);

Prop47_46 : Prop47
	 port map(
	 clk => clk , 
	 reset_n => reset_n,
	 cond_46_2 => init_os,
	 pending_46 => pending_46_tmp,
	 trigger_imply_46_2 => trigger_imply_46_2
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
	start => trigger_always_0_1,
	expr => expr_0,
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
	start => trigger_imply_1_2,
	expr => expr_5,
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
	start => trigger_imply_2_2,
	expr => E0,
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
	start => trigger_imply_3_2,
	expr => E0,
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
	start => trigger_imply_4_2,
	expr => expr_12,
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
	start => trigger_imply_5_2,
	expr => E1,
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
	start => trigger_imply_6_2,
	expr => E3,
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
	start => trigger_imply_7_2,
	expr => running_equal_elected,
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
	start => trigger_imply_8_2,
	expr => running_equal_elected,
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
	start => trigger_imply_9_2,
	expr => running_equal_elected,
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
	start => trigger_imply_10_2,
	expr => E0,
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
	start => trigger_imply_11_2,
	expr => expr_27,
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
	start => trigger_imply_12_2,
	expr => expr_32,
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
	start => trigger_imply_13_2,
	expr => reentrancy_level_1,
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
	start => trigger_imply_14_2,
	expr => call_context,
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
	start => trigger_imply_15_2,
	expr => call_handler,
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
	start => trigger_imply_16_2,
	expr => call_handler,
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
	start => trigger_before_17_3,
	expr => '0',
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
	start => trigger_imply_18_2,
	expr => expr_38,
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
	start => trigger_imply_19_2,
	expr => expr_40,
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
	start => trigger_imply_20_2,
	expr => expr_45,
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
	start => trigger_imply_21_2,
	expr => expr_49,
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
	start => trigger_imply_22_2,
	expr => expr_51,
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
	start => trigger_imply_23_2,
	expr => expr_55,
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
	start => trigger_imply_24_2,
	expr => expr_57,
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
	start => trigger_imply_25_2,
	expr => expr_59,
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
	start => trigger_imply_26_2,
	expr => expr_63,
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
	start => trigger_imply_27_2,
	expr => expr_67,
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
	start => trigger_imply_28_2,
	expr => expr_69,
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
	start => trigger_imply_29_2,
	expr => expr_71,
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
	start => trigger_imply_30_2,
	expr => expr_73,
	valid => valid_77_tmp
	);

mnt_78 : mnt_monitor
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
	expr => expr_75,
	valid => valid_78_tmp
	);

mnt_79 : mnt_monitor
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
	expr => run_elected,
	valid => valid_79_tmp
	);

mnt_80 : mnt_monitor
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
	expr => expr_77,
	valid => valid_80_tmp
	);

mnt_81 : mnt_monitor
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
	expr => start,
	valid => valid_81_tmp
	);

mnt_82 : mnt_monitor
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
	expr => start,
	valid => valid_82_tmp
	);

mnt_83 : mnt_monitor
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
	expr => set_event,
	valid => valid_83_tmp
	);

mnt_84 : mnt_monitor
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
	expr => call_context,
	valid => valid_84_tmp
	);

mnt_85 : mnt_monitor
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
	expr => expr_81,
	valid => valid_85_tmp
	);

mnt_86 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_39_2,
	expr => expr_97,
	valid => valid_86_tmp
	);

mnt_87 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_40_2,
	expr => wait_event_service,
	valid => valid_87_tmp
	);

mnt_88 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_41_2,
	expr => expr_103,
	valid => valid_88_tmp
	);

mnt_89 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_42_2,
	expr => expr_111,
	valid => valid_89_tmp
	);

mnt_90 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_43_2,
	expr => expr_119,
	valid => valid_90_tmp
	);

mnt_91 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_44_2,
	expr => expr_121,
	valid => valid_91_tmp
	);

mnt_92 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_45_2,
	expr => start_os_service,
	valid => valid_92_tmp
	);

mnt_93 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_46_2,
	expr => start_os_service,
	valid => valid_93_tmp
	);

--end of component instantiation

--signal affectation
pending <= '0'; 

valid <= valid_47_tmp and valid_48_tmp and valid_49_tmp and valid_50_tmp and valid_51_tmp and valid_52_tmp and valid_53_tmp and valid_54_tmp and valid_55_tmp and valid_56_tmp and valid_57_tmp and valid_58_tmp and valid_59_tmp and valid_60_tmp and valid_61_tmp and valid_62_tmp and valid_63_tmp and valid_64_tmp and valid_65_tmp and valid_66_tmp and valid_67_tmp and valid_68_tmp and valid_69_tmp and valid_70_tmp and valid_71_tmp and valid_72_tmp and valid_73_tmp and valid_74_tmp and valid_75_tmp and valid_76_tmp and valid_77_tmp and valid_78_tmp and valid_79_tmp and valid_80_tmp and valid_81_tmp and valid_82_tmp and valid_83_tmp and valid_84_tmp and valid_85_tmp and valid_86_tmp and valid_87_tmp and valid_88_tmp and valid_89_tmp and valid_90_tmp and valid_91_tmp and valid_92_tmp and valid_93_tmp; 
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


--process for cond_7_2=rose(E4)
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
cond_7_2 <= '1' when ante_sig_18='0' and E4='1' else '0';
--end cond_7_2=rose(E4)


--process for sig_19=rose(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_21 <= '0';--take care about the initial value
	else
		ante_sig_21 <= call_handler;
	end if;
end if;
end process;
sig_19 <= '1' when ante_sig_21='0' and call_handler='1' else '0';
--end sig_19=rose(call_handler)

cond_8_2 <= sig_19 and reentrancy_level_1;

--process for sig_22=fell(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_24 <= '0';--take care about the initial value
	else
		ante_sig_24 <= call_handler;
	end if;
end if;
end process;
sig_22 <= '1' when ante_sig_24='1' and call_handler='0' else '0';
--end sig_22=fell(call_handler)

cond_9_2 <= sig_22 and reentrancy_level_1;

--process for cond_10_2=fell(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_25 <= '0';--take care about the initial value
	else
		ante_sig_25 <= call_handler;
	end if;
end if;
end process;
cond_10_2 <= '1' when ante_sig_25='1' and call_handler='0' else '0';
--end cond_10_2=fell(call_handler)


--process for cond_11_2=fell(call_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_26 <= '0';--take care about the initial value
	else
		ante_sig_26 <= call_service;
	end if;
end if;
end process;
cond_11_2 <= '1' when ante_sig_26='1' and call_service='0' else '0';
--end cond_11_2=fell(call_service)

sig_28 <= not(E7);
sig_27 <= not(E5);
expr_27 <= sig_27 and sig_28;

--process for cond_12_2=rose(call_context)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_31 <= '0';--take care about the initial value
	else
		ante_sig_31 <= call_context;
	end if;
end if;
end process;
cond_12_2 <= '1' when ante_sig_31='0' and call_context='1' else '0';
--end cond_12_2=rose(call_context)

expr_32 <= E1 or E3;

--process for cond_13_2=rose(call_context)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_34 <= '0';--take care about the initial value
	else
		ante_sig_34 <= call_context;
	end if;
end if;
end process;
cond_13_2 <= '1' when ante_sig_34='0' and call_context='1' else '0';
--end cond_13_2=rose(call_context)


--process for cond_17_2=rose(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_35 <= '0';--take care about the initial value
	else
		ante_sig_35 <= call_handler;
	end if;
end if;
end process;
cond_17_2 <= '1' when ante_sig_35='0' and call_handler='1' else '0';
--end cond_17_2=rose(call_handler)


--process for cond_17_3=fell(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_36 <= '0';--take care about the initial value
	else
		ante_sig_36 <= call_handler;
	end if;
end if;
end process;
cond_17_3 <= '1' when ante_sig_36='1' and call_handler='0' else '0';
--end cond_17_3=fell(call_handler)


--process for cond_18_2=rose(call_save)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_37 <= '0';--take care about the initial value
	else
		ante_sig_37 <= call_save;
	end if;
end if;
end process;
cond_18_2 <= '1' when ante_sig_37='0' and call_save='1' else '0';
--end cond_18_2=rose(call_save)

expr_38 <= E3 and call_context;
sig_41 <= not(E5);
sig_40 <= not(E1);
expr_40 <= sig_40 and sig_41;

--process for cond_20_2=fell(activate_task_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_44 <= '0';--take care about the initial value
	else
		ante_sig_44 <= activate_task_service;
	end if;
end if;
end process;
cond_20_2 <= '1' when ante_sig_44='1' and activate_task_service='0' else '0';
--end cond_20_2=fell(activate_task_service)

sig_45 <= E0 or E3;
expr_45 <= sig_45 or E4;
expr_49 <= E0 or E1;
sig_51 <= E3 or E7;
expr_51 <= not(sig_51);

--process for cond_23_2=fell(chain_task_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_54 <= '0';--take care about the initial value
	else
		ante_sig_54 <= chain_task_service;
	end if;
end if;
end process;
cond_23_2 <= '1' when ante_sig_54='1' and chain_task_service='0' else '0';
--end cond_23_2=fell(chain_task_service)

expr_55 <= E0 or E1;
expr_57 <= E0 or E3;
sig_59 <= E1 or E5;
expr_59 <= not(sig_59);

--process for cond_26_2=fell(set_event_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then 
	if(reset_n='0') then
		ante_sig_62 <= '0';--take care about the initial value
	else
		ante_sig_62 <= set_event_service;
	end if;
end if;
end process;
cond_26_2 <= '1' when ante_sig_62='1' and set_event_service='0' else '0';
--end cond_26_2=fell(set_event_service)

sig_63 <= E0 or E3;
expr_63 <= sig_63 or E4;
expr_67 <= E0 or E3;
expr_69 <= E0 or E3;
expr_71 <= bubble_up or bubble_down;
expr_73 <= put_new_proc or put_preempted_proc;
expr_75 <= remove_front_proc or remove_proc;
sig_77 <= release or activate_task;
expr_77 <= sig_77 or activate_isr2;
sig_93 <= schedule_from_running or terminate_task_service;
sig_91 <= sig_93 or terminate_isr2_service;
sig_89 <= sig_91 or chain_task_service;
sig_87 <= sig_89 or block_s;
sig_85 <= sig_87 or start_scheduling;
sig_83 <= sig_85 or release;
sig_81 <= sig_83 or terminate_application_service;
expr_81 <= sig_81 or call_terminate_task_service;
sig_99 <= block_s or terminate;
sig_97 <= sig_99 or schedule_service;
expr_97 <= sig_97 or terminate_application_service;
sig_107 <= terminate_task_service or chain_task_service;
sig_105 <= sig_107 or terminate_isr2_service;
sig_103 <= sig_105 or terminate_application_service;
expr_103 <= sig_103 or call_terminate_task_service;
sig_115 <= activate_task_service or chain_task_service;
sig_113 <= sig_115 or init_os;
sig_111 <= sig_113 or action_activate_task;
expr_111 <= sig_111 or terminate_application_service;
expr_119 <= set_event_service or action_set_event;
sig_131 <= activate_task_service or schedule_service;
sig_129 <= sig_131 or set_event_service;
sig_127 <= sig_129 or central_interrupt_handler;
sig_125 <= sig_127 or release_resource_service;
sig_123 <= sig_125 or counter_tick;
sig_121 <= sig_123 or increment_counter_service;
expr_121 <= sig_121 or notify_receiving_mos;
--trampoline_properties port out affectation
end architecture behav;
