--Entity trampoline_properties for specifiction ../../trampoline/machines/riscv/pulpino/monitors/trampoline_properties.psl
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
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
	call_handler_enter : in std_logic;
	call_handler_exit : in std_logic;
	reentrancy_counter : in unsigned(1 downto 0);
	call_service : in std_logic;
	call_service_enter : in std_logic;
	call_service_exit : in std_logic;
	call_service_counter : in unsigned(1 downto 0);
	call_context : in std_logic;
	call_context_enter : in std_logic;
	call_context_exit : in std_logic;
	call_context_counter : in unsigned(1 downto 0);
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
	pending : out std_logic;
	valid : out std_logic;
	valid_49_Prop01 : out std_logic;
	valid_50_Prop02 : out std_logic;
	valid_51_Prop03 : out std_logic;
	valid_52_Prop04 : out std_logic;
	valid_53_Prop05 : out std_logic;
	valid_54_Prop06 : out std_logic;
	valid_55_Prop07 : out std_logic;
	valid_56_Prop08 : out std_logic;
	valid_57_Prop09 : out std_logic;
	valid_58_Prop10 : out std_logic;
	valid_59_Prop11 : out std_logic;
	valid_60_Prop12 : out std_logic;
	valid_61_Prop13 : out std_logic;
	valid_62_Prop14 : out std_logic;
	valid_63_Prop15 : out std_logic;
	valid_64_Prop16 : out std_logic;
	valid_65_Prop17 : out std_logic;
	valid_66_Prop18 : out std_logic;
	valid_67_Prop19 : out std_logic;
	valid_68_Prop20 : out std_logic;
	valid_69_Prop21 : out std_logic;
	valid_70_Prop22 : out std_logic;
	valid_71_Prop23 : out std_logic;
	valid_72_Prop24 : out std_logic;
	valid_73_Prop25 : out std_logic;
	valid_74_Prop26 : out std_logic;
	valid_75_Prop27 : out std_logic;
	valid_76_Prop28 : out std_logic;
	valid_77_Prop29 : out std_logic;
	valid_78_Prop30 : out std_logic;
	valid_79_Prop31 : out std_logic;
	valid_80_Prop32 : out std_logic;
	valid_81_Prop33 : out std_logic;
	valid_82_Prop34 : out std_logic;
	valid_83_Prop35 : out std_logic;
	valid_84_Prop36 : out std_logic;
	valid_85_Prop37 : out std_logic;
	valid_86_Prop38 : out std_logic;
	valid_87_Prop39 : out std_logic;
	valid_88_Prop40 : out std_logic;
	valid_89_Prop41 : out std_logic;
	valid_90_Prop42 : out std_logic;
	valid_91_Prop43 : out std_logic;
	valid_92_Prop44 : out std_logic;
	valid_93_Prop45 : out std_logic;
	valid_94_Prop46 : out std_logic;
	valid_95_Prop47 : out std_logic;
	valid_96_Prop48 : out std_logic;
	valid_97_Prop49 : out std_logic
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
	 pending_17 : out std_logic;
	 trigger_imply_17_2 : out std_logic
	);
end component Prop18;

component Prop19 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_18_2 : in std_logic;
	 cond_18_3 : in std_logic;
	 expr_18_3 : in std_logic;
	 pending_18 : out std_logic;
	 trigger_before_18_3 : out std_logic
	);
end component Prop19;

component Prop20 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 pending_19 : out std_logic;
	 trigger_always_19_1 : out std_logic
	);
end component Prop20;

component Prop21 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 pending_20 : out std_logic;
	 trigger_always_20_1 : out std_logic
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

component Prop48 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_47_2 : in std_logic;
	 pending_47 : out std_logic;
	 trigger_imply_47_2 : out std_logic
	);
end component Prop48;

component Prop49 is
	 port(
	 clk : in std_logic;
	 reset_n : in std_logic;
	 cond_48_2 : in std_logic;
	 pending_48 : out std_logic;
	 trigger_imply_48_2 : out std_logic
	);
end component Prop49;

--end of component declaration

--internal signals
signal pending_0_tmp : std_logic;
signal trigger_always_0_1 : std_logic;
signal valid_49_tmp : std_logic;
signal sig_1 : std_logic;
signal sig_0 : std_logic;
signal expr_0 : std_logic;
signal ante_sig_4 : std_logic;
signal cond_1_2 : std_logic;
signal pending_1_tmp : std_logic;
signal trigger_imply_1_2 : std_logic;
signal valid_50_tmp : std_logic;
signal sig_5 : std_logic;
signal expr_5 : std_logic;
signal ante_sig_9 : std_logic;
signal cond_2_2 : std_logic;
signal pending_2_tmp : std_logic;
signal trigger_imply_2_2 : std_logic;
signal valid_51_tmp : std_logic;
signal ante_sig_10 : std_logic;
signal cond_3_2 : std_logic;
signal pending_3_tmp : std_logic;
signal trigger_imply_3_2 : std_logic;
signal valid_52_tmp : std_logic;
signal ante_sig_11 : std_logic;
signal cond_4_2 : std_logic;
signal pending_4_tmp : std_logic;
signal trigger_imply_4_2 : std_logic;
signal valid_53_tmp : std_logic;
signal sig_12 : std_logic;
signal expr_12 : std_logic;
signal ante_sig_16 : std_logic;
signal cond_5_2 : std_logic;
signal pending_5_tmp : std_logic;
signal trigger_imply_5_2 : std_logic;
signal valid_54_tmp : std_logic;
signal ante_sig_17 : std_logic;
signal cond_6_2 : std_logic;
signal pending_6_tmp : std_logic;
signal trigger_imply_6_2 : std_logic;
signal valid_55_tmp : std_logic;
signal ante_sig_18 : std_logic;
signal cond_7_2 : std_logic;
signal pending_7_tmp : std_logic;
signal trigger_imply_7_2 : std_logic;
signal valid_56_tmp : std_logic;
signal sig_20 : std_logic;
signal ante_sig_23 : std_logic;
signal sig_19 : std_logic;
signal cond_8_2 : std_logic;
signal pending_8_tmp : std_logic;
signal trigger_imply_8_2 : std_logic;
signal valid_57_tmp : std_logic;
signal sig_25 : std_logic;
signal ante_sig_28 : std_logic;
signal sig_24 : std_logic;
signal cond_9_2 : std_logic;
signal pending_9_tmp : std_logic;
signal trigger_imply_9_2 : std_logic;
signal valid_58_tmp : std_logic;
signal ante_sig_29 : std_logic;
signal cond_10_2 : std_logic;
signal pending_10_tmp : std_logic;
signal trigger_imply_10_2 : std_logic;
signal valid_59_tmp : std_logic;
signal sig_31 : std_logic;
signal cond_11_2 : std_logic;
signal pending_11_tmp : std_logic;
signal trigger_imply_11_2 : std_logic;
signal valid_60_tmp : std_logic;
signal ante_sig_34 : std_logic;
signal cond_12_2 : std_logic;
signal pending_12_tmp : std_logic;
signal trigger_imply_12_2 : std_logic;
signal valid_61_tmp : std_logic;
signal sig_36 : std_logic;
signal sig_35 : std_logic;
signal expr_35 : std_logic;
signal ante_sig_39 : std_logic;
signal cond_13_2 : std_logic;
signal pending_13_tmp : std_logic;
signal trigger_imply_13_2 : std_logic;
signal valid_62_tmp : std_logic;
signal expr_40 : std_logic;
signal ante_sig_42 : std_logic;
signal cond_14_2 : std_logic;
signal pending_14_tmp : std_logic;
signal trigger_imply_14_2 : std_logic;
signal valid_63_tmp : std_logic;
signal expr_43 : std_logic;
signal pending_15_tmp : std_logic;
signal trigger_imply_15_2 : std_logic;
signal valid_64_tmp : std_logic;
signal pending_16_tmp : std_logic;
signal trigger_imply_16_2 : std_logic;
signal valid_65_tmp : std_logic;
signal pending_17_tmp : std_logic;
signal trigger_imply_17_2 : std_logic;
signal valid_66_tmp : std_logic;
signal pending_18_tmp : std_logic;
signal trigger_before_18_3 : std_logic;
signal valid_67_tmp : std_logic;
signal pending_19_tmp : std_logic;
signal trigger_always_19_1 : std_logic;
signal valid_68_tmp : std_logic;
signal sig_47 : std_logic;
signal sig_46 : std_logic;
signal sig_45 : std_logic;
signal expr_45 : std_logic;
signal pending_20_tmp : std_logic;
signal trigger_always_20_1 : std_logic;
signal valid_69_tmp : std_logic;
signal sig_51 : std_logic;
signal expr_51 : std_logic;
signal ante_sig_59 : std_logic;
signal cond_21_2 : std_logic;
signal pending_21_tmp : std_logic;
signal trigger_imply_21_2 : std_logic;
signal valid_70_tmp : std_logic;
signal sig_61 : std_logic;
signal sig_60 : std_logic;
signal expr_60 : std_logic;
signal pending_22_tmp : std_logic;
signal trigger_imply_22_2 : std_logic;
signal valid_71_tmp : std_logic;
signal sig_67 : std_logic;
signal sig_66 : std_logic;
signal expr_66 : std_logic;
signal ante_sig_70 : std_logic;
signal cond_23_2 : std_logic;
signal pending_23_tmp : std_logic;
signal trigger_imply_23_2 : std_logic;
signal valid_72_tmp : std_logic;
signal sig_71 : std_logic;
signal expr_71 : std_logic;
signal pending_24_tmp : std_logic;
signal trigger_imply_24_2 : std_logic;
signal valid_73_tmp : std_logic;
signal expr_75 : std_logic;
signal pending_25_tmp : std_logic;
signal trigger_imply_25_2 : std_logic;
signal valid_74_tmp : std_logic;
signal sig_77 : std_logic;
signal expr_77 : std_logic;
signal ante_sig_80 : std_logic;
signal cond_26_2 : std_logic;
signal pending_26_tmp : std_logic;
signal trigger_imply_26_2 : std_logic;
signal valid_75_tmp : std_logic;
signal expr_81 : std_logic;
signal pending_27_tmp : std_logic;
signal trigger_imply_27_2 : std_logic;
signal valid_76_tmp : std_logic;
signal expr_83 : std_logic;
signal pending_28_tmp : std_logic;
signal trigger_imply_28_2 : std_logic;
signal valid_77_tmp : std_logic;
signal sig_85 : std_logic;
signal expr_85 : std_logic;
signal ante_sig_88 : std_logic;
signal cond_29_2 : std_logic;
signal pending_29_tmp : std_logic;
signal trigger_imply_29_2 : std_logic;
signal valid_78_tmp : std_logic;
signal sig_89 : std_logic;
signal expr_89 : std_logic;
signal pending_30_tmp : std_logic;
signal trigger_imply_30_2 : std_logic;
signal valid_79_tmp : std_logic;
signal expr_93 : std_logic;
signal pending_31_tmp : std_logic;
signal trigger_imply_31_2 : std_logic;
signal valid_80_tmp : std_logic;
signal expr_95 : std_logic;
signal pending_32_tmp : std_logic;
signal trigger_imply_32_2 : std_logic;
signal valid_81_tmp : std_logic;
signal expr_97 : std_logic;
signal pending_33_tmp : std_logic;
signal trigger_imply_33_2 : std_logic;
signal valid_82_tmp : std_logic;
signal expr_99 : std_logic;
signal pending_34_tmp : std_logic;
signal trigger_imply_34_2 : std_logic;
signal valid_83_tmp : std_logic;
signal expr_101 : std_logic;
signal pending_35_tmp : std_logic;
signal trigger_imply_35_2 : std_logic;
signal valid_84_tmp : std_logic;
signal pending_36_tmp : std_logic;
signal trigger_imply_36_2 : std_logic;
signal valid_85_tmp : std_logic;
signal sig_103 : std_logic;
signal expr_103 : std_logic;
signal pending_37_tmp : std_logic;
signal trigger_imply_37_2 : std_logic;
signal valid_86_tmp : std_logic;
signal pending_38_tmp : std_logic;
signal trigger_imply_38_2 : std_logic;
signal valid_87_tmp : std_logic;
signal pending_39_tmp : std_logic;
signal trigger_imply_39_2 : std_logic;
signal valid_88_tmp : std_logic;
signal pending_40_tmp : std_logic;
signal trigger_imply_40_2 : std_logic;
signal valid_89_tmp : std_logic;
signal sig_119 : std_logic;
signal sig_117 : std_logic;
signal sig_115 : std_logic;
signal sig_113 : std_logic;
signal sig_111 : std_logic;
signal sig_109 : std_logic;
signal sig_107 : std_logic;
signal expr_107 : std_logic;
signal pending_41_tmp : std_logic;
signal trigger_imply_41_2 : std_logic;
signal valid_90_tmp : std_logic;
signal sig_125 : std_logic;
signal sig_123 : std_logic;
signal expr_123 : std_logic;
signal pending_42_tmp : std_logic;
signal trigger_imply_42_2 : std_logic;
signal valid_91_tmp : std_logic;
signal pending_43_tmp : std_logic;
signal trigger_imply_43_2 : std_logic;
signal valid_92_tmp : std_logic;
signal sig_133 : std_logic;
signal sig_131 : std_logic;
signal sig_129 : std_logic;
signal expr_129 : std_logic;
signal pending_44_tmp : std_logic;
signal trigger_imply_44_2 : std_logic;
signal valid_93_tmp : std_logic;
signal sig_141 : std_logic;
signal sig_139 : std_logic;
signal sig_137 : std_logic;
signal expr_137 : std_logic;
signal pending_45_tmp : std_logic;
signal trigger_imply_45_2 : std_logic;
signal valid_94_tmp : std_logic;
signal expr_145 : std_logic;
signal pending_46_tmp : std_logic;
signal trigger_imply_46_2 : std_logic;
signal valid_95_tmp : std_logic;
signal sig_157 : std_logic;
signal sig_155 : std_logic;
signal sig_153 : std_logic;
signal sig_151 : std_logic;
signal sig_149 : std_logic;
signal sig_147 : std_logic;
signal expr_147 : std_logic;
signal pending_47_tmp : std_logic;
signal trigger_imply_47_2 : std_logic;
signal valid_96_tmp : std_logic;
signal pending_48_tmp : std_logic;
signal trigger_imply_48_2 : std_logic;
signal valid_97_tmp : std_logic;
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
	 cond_14_2 => cond_14_2,
	 pending_14 => pending_14_tmp,
	 trigger_imply_14_2 => trigger_imply_14_2
	);

Prop16_15 : Prop16
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_15_2 => run_elected,
	 pending_15 => pending_15_tmp,
	 trigger_imply_15_2 => trigger_imply_15_2
	);

Prop17_16 : Prop17
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_16_2 => call_service,
	 pending_16 => pending_16_tmp,
	 trigger_imply_16_2 => trigger_imply_16_2
	);

Prop18_17 : Prop18
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_17_2 => call_context,
	 pending_17 => pending_17_tmp,
	 trigger_imply_17_2 => trigger_imply_17_2
	);

Prop19_18 : Prop19
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_18_2 => call_handler_enter,
	 cond_18_3 => call_handler_exit,
	 expr_18_3 => call_service,
	 pending_18 => pending_18_tmp,
	 trigger_before_18_3 => trigger_before_18_3
	);

Prop20_19 : Prop20
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 pending_19 => pending_19_tmp,
	 trigger_always_19_1 => trigger_always_19_1
	);

Prop21_20 : Prop21
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 pending_20 => pending_20_tmp,
	 trigger_always_20_1 => trigger_always_20_1
	);

Prop22_21 : Prop22
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_21_2 => cond_21_2,
	 pending_21 => pending_21_tmp,
	 trigger_imply_21_2 => trigger_imply_21_2
	);

Prop23_22 : Prop23
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_22_2 => activate_task_service,
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
	 cond_24_2 => terminate_task_service,
	 pending_24 => pending_24_tmp,
	 trigger_imply_24_2 => trigger_imply_24_2
	);

Prop26_25 : Prop26
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_25_2 => chain_task_service,
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
	 cond_27_2 => schedule_service,
	 pending_27 => pending_27_tmp,
	 trigger_imply_27_2 => trigger_imply_27_2
	);

Prop29_28 : Prop29
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_28_2 => set_event_service,
	 pending_28 => pending_28_tmp,
	 trigger_imply_28_2 => trigger_imply_28_2
	);

Prop30_29 : Prop30
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_29_2 => cond_29_2,
	 pending_29 => pending_29_tmp,
	 trigger_imply_29_2 => trigger_imply_29_2
	);

Prop31_30 : Prop31
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_30_2 => wait_event_service,
	 pending_30 => pending_30_tmp,
	 trigger_imply_30_2 => trigger_imply_30_2
	);

Prop32_31 : Prop32
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_31_2 => release_resource_service,
	 pending_31 => pending_31_tmp,
	 trigger_imply_31_2 => trigger_imply_31_2
	);

Prop33_32 : Prop33
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_32_2 => compare_entries,
	 pending_32 => pending_32_tmp,
	 trigger_imply_32_2 => trigger_imply_32_2
	);

Prop34_33 : Prop34
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_33_2 => bubble_up,
	 pending_33 => pending_33_tmp,
	 trigger_imply_33_2 => trigger_imply_33_2
	);

Prop35_34 : Prop35
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_34_2 => bubble_down,
	 pending_34 => pending_34_tmp,
	 trigger_imply_34_2 => trigger_imply_34_2
	);

Prop36_35 : Prop36
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_35_2 => put_preempted_proc,
	 pending_35 => pending_35_tmp,
	 trigger_imply_35_2 => trigger_imply_35_2
	);

Prop37_36 : Prop37
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_36_2 => put_new_proc,
	 pending_36 => pending_36_tmp,
	 trigger_imply_36_2 => trigger_imply_36_2
	);

Prop38_37 : Prop38
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_37_2 => remove_front_proc,
	 pending_37 => pending_37_tmp,
	 trigger_imply_37_2 => trigger_imply_37_2
	);

Prop39_38 : Prop39
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_38_2 => init_proc,
	 pending_38 => pending_38_tmp,
	 trigger_imply_38_2 => trigger_imply_38_2
	);

Prop40_39 : Prop40
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_39_2 => release,
	 pending_39 => pending_39_tmp,
	 trigger_imply_39_2 => trigger_imply_39_2
	);

Prop41_40 : Prop41
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_40_2 => start,
	 pending_40 => pending_40_tmp,
	 trigger_imply_40_2 => trigger_imply_40_2
	);

Prop42_41 : Prop42
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_41_2 => release_internal_resource,
	 pending_41 => pending_41_tmp,
	 trigger_imply_41_2 => trigger_imply_41_2
	);

Prop43_42 : Prop43
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_42_2 => block_s,
	 pending_42 => pending_42_tmp,
	 trigger_imply_42_2 => trigger_imply_42_2
	);

Prop44_43 : Prop44
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_43_2 => terminate,
	 pending_43 => pending_43_tmp,
	 trigger_imply_43_2 => trigger_imply_43_2
	);

Prop45_44 : Prop45
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_44_2 => activate_task,
	 pending_44 => pending_44_tmp,
	 trigger_imply_44_2 => trigger_imply_44_2
	);

Prop46_45 : Prop46
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_45_2 => set_event,
	 pending_45 => pending_45_tmp,
	 trigger_imply_45_2 => trigger_imply_45_2
	);

Prop47_46 : Prop47
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_46_2 => schedule_from_running,
	 pending_46 => pending_46_tmp,
	 trigger_imply_46_2 => trigger_imply_46_2
	);

Prop48_47 : Prop48
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_47_2 => start_scheduling,
	 pending_47 => pending_47_tmp,
	 trigger_imply_47_2 => trigger_imply_47_2
	);

Prop49_48 : Prop49
	 port map(
	 clk => clk ,
	 reset_n => reset_n,
	 cond_48_2 => init_os,
	 pending_48 => pending_48_tmp,
	 trigger_imply_48_2 => trigger_imply_48_2
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
	start => trigger_always_0_1,
	expr => expr_0,
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
	start => trigger_imply_1_2,
	expr => expr_5,
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
	start => trigger_imply_2_2,
	expr => E0,
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
	start => trigger_imply_3_2,
	expr => E0,
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
	start => trigger_imply_4_2,
	expr => expr_12,
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
	start => trigger_imply_5_2,
	expr => E1,
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
	start => trigger_imply_6_2,
	expr => E3,
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
	start => trigger_imply_7_2,
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
	start => trigger_imply_8_2,
	expr => running_equal_elected,
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
	start => trigger_imply_9_2,
	expr => running_equal_elected,
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
	start => trigger_imply_10_2,
	expr => E0,
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
	start => trigger_imply_11_2,
	expr => E0,
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
	start => trigger_imply_12_2,
	expr => expr_35,
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
	start => trigger_imply_13_2,
	expr => expr_40,
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
	start => trigger_imply_14_2,
	expr => expr_43,
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
	start => trigger_imply_15_2,
	expr => call_context,
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
	start => trigger_imply_16_2,
	expr => call_handler,
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
	start => trigger_imply_17_2,
	expr => call_handler,
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
	start => trigger_before_18_3,
	expr => '0',
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
	start => trigger_always_19_1,
	expr => expr_45,
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
	start => trigger_always_20_1,
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
	start => trigger_imply_21_2,
	expr => expr_60,
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
	start => trigger_imply_22_2,
	expr => expr_66,
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
	start => trigger_imply_23_2,
	expr => expr_71,
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
	start => trigger_imply_24_2,
	expr => expr_75,
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
	start => trigger_imply_25_2,
	expr => expr_77,
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
	start => trigger_imply_26_2,
	expr => expr_81,
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
	start => trigger_imply_27_2,
	expr => expr_83,
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
	start => trigger_imply_28_2,
	expr => expr_85,
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
	start => trigger_imply_29_2,
	expr => expr_89,
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
	start => trigger_imply_30_2,
	expr => expr_93,
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
	start => trigger_imply_31_2,
	expr => expr_95,
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
	start => trigger_imply_32_2,
	expr => expr_97,
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
	start => trigger_imply_33_2,
	expr => expr_99,
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
	start => trigger_imply_34_2,
	expr => expr_101,
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
	start => trigger_imply_35_2,
	expr => run_elected,
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
	start => trigger_imply_36_2,
	expr => expr_103,
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
	start => trigger_imply_37_2,
	expr => start,
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
	start => trigger_imply_38_2,
	expr => start,
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
	start => trigger_imply_39_2,
	expr => set_event,
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
	start => trigger_imply_40_2,
	expr => expr_107,
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
	start => trigger_imply_41_2,
	expr => expr_123,
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
	start => trigger_imply_42_2,
	expr => wait_event_service,
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
	start => trigger_imply_43_2,
	expr => expr_129,
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
	start => trigger_imply_44_2,
	expr => expr_137,
	valid => valid_93_tmp
	);

mnt_94 : mnt_monitor
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
	expr => expr_145,
	valid => valid_94_tmp
	);

mnt_95 : mnt_monitor
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
	expr => expr_147,
	valid => valid_95_tmp
	);

mnt_96 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_47_2,
	expr => start_os_service,
	valid => valid_96_tmp
	);

mnt_97 : mnt_monitor
	generic map (
	EDGE => '1',
	LEVEL => '0',
	GATED_CLOCK => 0
	)
	port map (
	clk => clk,
	reset_n => reset_n,
	clk_en => '1',
	start => trigger_imply_48_2,
	expr => start_os_service,
	valid => valid_97_tmp
	);

--end of component instantiation

--signal affectation
pending <= '0';

valid <= valid_49_tmp and valid_50_tmp and valid_51_tmp and valid_52_tmp and valid_53_tmp and valid_54_tmp and valid_55_tmp and valid_56_tmp and valid_57_tmp and valid_58_tmp and valid_59_tmp and valid_60_tmp and valid_61_tmp and valid_62_tmp and valid_63_tmp and valid_64_tmp and valid_65_tmp and valid_66_tmp and valid_67_tmp and valid_68_tmp and valid_69_tmp and valid_70_tmp and valid_71_tmp and valid_72_tmp and valid_73_tmp and valid_74_tmp and valid_75_tmp and valid_76_tmp and valid_77_tmp and valid_78_tmp and valid_79_tmp and valid_80_tmp and valid_81_tmp and valid_82_tmp and valid_83_tmp and valid_84_tmp and valid_85_tmp and valid_86_tmp and valid_87_tmp and valid_88_tmp and valid_89_tmp and valid_90_tmp and valid_91_tmp and valid_92_tmp and valid_93_tmp and valid_94_tmp and valid_95_tmp and valid_96_tmp and valid_97_tmp;
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

sig_20 <= '1' when reentrancy_counter = 1 else '0';

--process for sig_19=rose(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_23 <= '0';--take care about the initial value
	else
		ante_sig_23 <= call_handler;
	end if;
end if;
end process;
sig_19 <= '1' when ante_sig_23='0' and call_handler='1' else '0';
--end sig_19=rose(call_handler)

cond_8_2 <= sig_19 and sig_20;
sig_25 <= '1' when reentrancy_counter = 1 else '0';

--process for sig_24=fell(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_28 <= '0';--take care about the initial value
	else
		ante_sig_28 <= call_handler;
	end if;
end if;
end process;
sig_24 <= '1' when ante_sig_28='1' and call_handler='0' else '0';
--end sig_24=fell(call_handler)

cond_9_2 <= sig_24 and sig_25;

--process for cond_10_2=fell(call_handler)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_29 <= '0';--take care about the initial value
	else
		ante_sig_29 <= call_handler;
	end if;
end if;
end process;
cond_10_2 <= '1' when ante_sig_29='1' and call_handler='0' else '0';
--end cond_10_2=fell(call_handler)

sig_31 <= '1' when reentrancy_counter = 1 else '0';
cond_11_2 <= call_service_enter and sig_31;

--process for cond_12_2=fell(call_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_34 <= '0';--take care about the initial value
	else
		ante_sig_34 <= call_service;
	end if;
end if;
end process;
cond_12_2 <= '1' when ante_sig_34='1' and call_service='0' else '0';
--end cond_12_2=fell(call_service)

sig_36 <= not(E7);
sig_35 <= not(E5);
expr_35 <= sig_35 and sig_36;

--process for cond_13_2=rose(call_context)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_39 <= '0';--take care about the initial value
	else
		ante_sig_39 <= call_context;
	end if;
end if;
end process;
cond_13_2 <= '1' when ante_sig_39='0' and call_context='1' else '0';
--end cond_13_2=rose(call_context)

expr_40 <= E1 or E3;

--process for cond_14_2=rose(call_context)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_42 <= '0';--take care about the initial value
	else
		ante_sig_42 <= call_context;
	end if;
end if;
end process;
cond_14_2 <= '1' when ante_sig_42='0' and call_context='1' else '0';
expr_43 <= '1' when reentrancy_counter = 1 else '0';
--end cond_14_2=rose(call_context)

sig_47 <= '1' when reentrancy_counter = 3 else '0';
sig_46 <= not(sig_47);
sig_45 <= not(call_handler_enter);
expr_45 <= sig_45 or sig_46;
sig_51 <= '1' when call_service_counter <= reentrancy_counter else '0';
expr_51 <= sig_51;

--process for cond_21_2=rose(call_save)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_59 <= '0';--take care about the initial value
	else
		ante_sig_59 <= call_save;
	end if;
end if;
end process;
cond_21_2 <= '1' when ante_sig_59='0' and call_save='1' else '0';
--end cond_21_2=rose(call_save)

sig_61 <= '1' when reentrancy_counter = 1 else '0';
sig_60 <= E3 and call_context;
expr_60 <= sig_60 and sig_61;
sig_67 <= not(E5);
sig_66 <= not(E1);
expr_66 <= sig_66 and sig_67;

--process for cond_23_2=fell(activate_task_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_70 <= '0';--take care about the initial value
	else
		ante_sig_70 <= activate_task_service;
	end if;
end if;
end process;
cond_23_2 <= '1' when ante_sig_70='1' and activate_task_service='0' else '0';
--end cond_23_2=fell(activate_task_service)

sig_71 <= E0 or E3;
expr_71 <= sig_71 or E4;
expr_75 <= E0 or E1;
sig_77 <= E3 or E7;
expr_77 <= not(sig_77);

--process for cond_26_2=fell(chain_task_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_80 <= '0';--take care about the initial value
	else
		ante_sig_80 <= chain_task_service;
	end if;
end if;
end process;
cond_26_2 <= '1' when ante_sig_80='1' and chain_task_service='0' else '0';
--end cond_26_2=fell(chain_task_service)

expr_81 <= E0 or E1;
expr_83 <= E0 or E3;
sig_85 <= E1 or E5;
expr_85 <= not(sig_85);

--process for cond_29_2=fell(set_event_service)
process(clk,reset_n)
begin
if(clk'event and clk='1') then
	if(reset_n='0') then
		ante_sig_88 <= '0';--take care about the initial value
	else
		ante_sig_88 <= set_event_service;
	end if;
end if;
end process;
cond_29_2 <= '1' when ante_sig_88='1' and set_event_service='0' else '0';
--end cond_29_2=fell(set_event_service)

sig_89 <= E0 or E3;
expr_89 <= sig_89 or E4;
expr_93 <= E0 or E3;
expr_95 <= E0 or E3;
expr_97 <= bubble_up or bubble_down;
expr_99 <= put_new_proc or put_preempted_proc;
expr_101 <= remove_front_proc or remove_proc;
sig_103 <= release or activate_task;
expr_103 <= sig_103 or activate_isr2;
sig_119 <= schedule_from_running or terminate_task_service;
sig_117 <= sig_119 or terminate_isr2_service;
sig_115 <= sig_117 or chain_task_service;
sig_113 <= sig_115 or block_s;
sig_111 <= sig_113 or start_scheduling;
sig_109 <= sig_111 or release;
sig_107 <= sig_109 or terminate_application_service;
expr_107 <= sig_107 or call_terminate_task_service;
sig_125 <= block_s or terminate;
sig_123 <= sig_125 or schedule_service;
expr_123 <= sig_123 or terminate_application_service;
sig_133 <= terminate_task_service or chain_task_service;
sig_131 <= sig_133 or terminate_isr2_service;
sig_129 <= sig_131 or terminate_application_service;
expr_129 <= sig_129 or call_terminate_task_service;
sig_141 <= activate_task_service or chain_task_service;
sig_139 <= sig_141 or init_os;
sig_137 <= sig_139 or action_activate_task;
expr_137 <= sig_137 or terminate_application_service;
expr_145 <= set_event_service or action_set_event;
sig_157 <= activate_task_service or schedule_service;
sig_155 <= sig_157 or set_event_service;
sig_153 <= sig_155 or central_interrupt_handler;
sig_151 <= sig_153 or release_resource_service;
sig_149 <= sig_151 or counter_tick;
sig_147 <= sig_149 or increment_counter_service;
expr_147 <= sig_147 or notify_receiving_mos;
--trampoline_properties port out affectation
end architecture behav;
