
# Efinity Interface Designer SDC
# Version: 2020.1.140
# Date: 2020-07-08 17:47

# Copyright (C) 2017 - 2020 Efinix Inc. All rights reserved.

# Device: T20F256
# Project: tft_tester
# Timing Model: C4 (final)

# PLL Constraints
#################
create_clock -period 40.00 i_sysclk

# GPIO Constraints
####################
# set_input_delay -clock <CLOCK> -max <MAX CALCULATION> [get_ports {i_arstn}]
# set_input_delay -clock <CLOCK> -min <MIN CALCULATION> [get_ports {i_arstn}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_csx}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_csx}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_dcx}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_dcx}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_rdx}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_rdx}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_srst}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_srst}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_ss}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_ss}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[0]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[0]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[0]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[0]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[0]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[0]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[1]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[1]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[1]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[1]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[1]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[1]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[2]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[2]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[2]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[2]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[2]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[2]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[3]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[3]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[3]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[3]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[3]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[3]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[4]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[4]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[4]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[4]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[4]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[4]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[5]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[5]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[5]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[5]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[5]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[5]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[6]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[6]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[6]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[6]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[6]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[6]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[7]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[7]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[7]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[7]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[7]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[7]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[8]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[8]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[8]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[8]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[8]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[8]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[9]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[9]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[9]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[9]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[9]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[9]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[10]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[10]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[10]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[10]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[10]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[10]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[11]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[11]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[11]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[11]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[11]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[11]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[12]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[12]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[12]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[12]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[12]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[12]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[13]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[13]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[13]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[13]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[13]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[13]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[14]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[14]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[14]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[14]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[14]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[14]}]
set_input_delay -clock i_sysclk -max 4.968 [get_ports {i_d[15]}]
set_input_delay -clock i_sysclk -min 2.484 [get_ports {i_d[15]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[15]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[15]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[15]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[15]}]
set_input_delay -clock i_sysclk -max 5.568 [get_ports {i_d[16]}]
set_input_delay -clock i_sysclk -min 2.784 [get_ports {i_d[16]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[16]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[16]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[16]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[16]}]
set_input_delay -clock i_sysclk -max 5.768 [get_ports {i_d[17]}]
set_input_delay -clock i_sysclk -min 2.884 [get_ports {i_d[17]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[17]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[17]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[17]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[17]}]
set_input_delay -clock i_sysclk -max 5.768 [get_ports {i_d[18]}]
set_input_delay -clock i_sysclk -min 2.884 [get_ports {i_d[18]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[18]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[18]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[18]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[18]}]
set_input_delay -clock i_sysclk -max 5.768 [get_ports {i_d[19]}]
set_input_delay -clock i_sysclk -min 2.884 [get_ports {i_d[19]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[19]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[19]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[19]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[19]}]
set_input_delay -clock i_sysclk -max 5.768 [get_ports {i_d[20]}]
set_input_delay -clock i_sysclk -min 2.884 [get_ports {i_d[20]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[20]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[20]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[20]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[20]}]
set_input_delay -clock i_sysclk -max 5.768 [get_ports {i_d[21]}]
set_input_delay -clock i_sysclk -min 2.884 [get_ports {i_d[21]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[21]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[21]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[21]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[21]}]
set_input_delay -clock i_sysclk -max 5.768 [get_ports {i_d[22]}]
set_input_delay -clock i_sysclk -min 2.884 [get_ports {i_d[22]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[22]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[22]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[22]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[22]}]
set_input_delay -clock i_sysclk -max 5.768 [get_ports {i_d[23]}]
set_input_delay -clock i_sysclk -min 2.884 [get_ports {i_d[23]}]
set_output_delay -clock i_sysclk -max -3.500 [get_ports {o_d[23]}]
set_output_delay -clock i_sysclk -min -1.971 [get_ports {o_d[23]}]
set_output_delay -clock i_sysclk -max -3.507 [get_ports {o_oe[23]}]
set_output_delay -clock i_sysclk -min -1.968 [get_ports {o_oe[23]}]

# JTAG Constraints
####################
# create_clock -period <USER_PERIOD> [get_ports {jtag_inst1_TCK}]
# create_clock -period <USER_PERIOD> [get_ports {jtag_inst1_DRCK}]
set_output_delay -clock jtag_inst1_TCK -max 0.111 [get_ports {jtag_inst1_TDO}]
set_output_delay -clock jtag_inst1_TCK -min 0.053 [get_ports {jtag_inst1_TDO}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.267 [get_ports {jtag_inst1_CAPTURE}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.134 [get_ports {jtag_inst1_CAPTURE}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.267 [get_ports {jtag_inst1_RESET}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.134 [get_ports {jtag_inst1_RESET}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.267 [get_ports {jtag_inst1_RUNTEST}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.134 [get_ports {jtag_inst1_RUNTEST}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.231 [get_ports {jtag_inst1_SEL}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.116 [get_ports {jtag_inst1_SEL}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.267 [get_ports {jtag_inst1_UPDATE}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.134 [get_ports {jtag_inst1_UPDATE}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -max 0.321 [get_ports {jtag_inst1_SHIFT}]
set_input_delay -clock_fall -clock jtag_inst1_TCK -min 0.161 [get_ports {jtag_inst1_SHIFT}]