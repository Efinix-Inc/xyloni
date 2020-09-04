vlib work

vlog ../rtl/runlength_shifter.v

vlog runlength_shifter_tb.v
vsim -t ns -novopt work.runlength_shifter_tb

add wave -hex -position insertpoint  \
sim:/runlength_shifter_tb/r_ptr \
sim:/runlength_shifter_tb/r_we \
sim:/runlength_shifter_tb/i_eob \
sim:/runlength_shifter_tb/i_runlength \
sim:/runlength_shifter_tb/i_B \
sim:/runlength_shifter_tb/w_ready \
sim:/runlength_shifter_tb/r_ready \
sim:/runlength_shifter_tb/w_de \
sim:/runlength_shifter_tb/o_B 

add wave -hex -position insertpoint  \
sim:/runlength_shifter_tb/inst_runlength_shifter/r_shift_state_1P 

add wave -unsigned -position insertpoint  \
sim:/runlength_shifter_tb/inst_runlength_shifter/i_ready \
sim:/runlength_shifter_tb/inst_runlength_shifter/r_de_1P \
sim:/runlength_shifter_tb/inst_runlength_shifter/r_B_1P \
sim:/runlength_shifter_tb/inst_runlength_shifter/r_len_cnt_1P \
sim:/runlength_shifter_tb/inst_runlength_shifter/r_run_cnt_1P
