vlib work

vlog ../rtl/line_buffer.v
vlog ../../../ip/simple_dual_port_ram/simple_dual_port_ram.v

vlog line_buffer_tb.v
vsim -t ns -novopt work.line_buffer_tb

add wave -hex -position insertpoint  \
sim:/line_buffer_tb/r_arst \
sim:/line_buffer_tb/r_sysclk \
sim:/line_buffer_tb/r_hres \
sim:/line_buffer_tb/r_state_1P \
sim:/line_buffer_tb/r_we \
sim:/line_buffer_tb/r_ptr \
sim:/line_buffer_tb/i_Y_wd \
sim:/line_buffer_tb/i_U_wd \
sim:/line_buffer_tb/i_V_wd \
sim:/line_buffer_tb/w_full \
sim:/line_buffer_tb/r_re \
sim:/line_buffer_tb/w_Y_rd \
sim:/line_buffer_tb/w_U_rd \
sim:/line_buffer_tb/w_V_rd \
sim:/line_buffer_tb/w_nempty 

add wave -hex -position insertpoint  \
sim:/line_buffer_tb/inst_line_buffer/inst_line_buffer_Y/ram \
sim:/line_buffer_tb/inst_line_buffer/inst_line_buffer_U/ram \
sim:/line_buffer_tb/inst_line_buffer/inst_line_buffer_V/ram

add wave -hex -position insertpoint  \
sim:/line_buffer_tb/inst_line_buffer/r_wr_hres_x_1P \
sim:/line_buffer_tb/inst_line_buffer/r_wr_mcu_x_1P \
sim:/line_buffer_tb/inst_line_buffer/r_wr_sample_x_cnt_1P \
sim:/line_buffer_tb/inst_line_buffer/r_wr_hres_y_1P \
sim:/line_buffer_tb/inst_line_buffer/r_wr_mcu_y_1P \
sim:/line_buffer_tb/inst_line_buffer/r_wr_sample_y_cnt_1P \
sim:/line_buffer_tb/inst_line_buffer/w_Y_wr_addr_1P \
sim:/line_buffer_tb/inst_line_buffer/w_C_wr_addr_1P
add wave -hex -position insertpoint  \
sim:/line_buffer_tb/inst_line_buffer/r_rd_hres_x_1P \
sim:/line_buffer_tb/inst_line_buffer/r_rd_mcu_x_1P \
sim:/line_buffer_tb/inst_line_buffer/r_rd_hres_y_1P \
sim:/line_buffer_tb/inst_line_buffer/r_rd_mcu_y_1P \
sim:/line_buffer_tb/inst_line_buffer/w_Y_rd_addr_1P \
sim:/line_buffer_tb/inst_line_buffer/w_C_rd_addr_1P \
sim:/line_buffer_tb/inst_line_buffer/w_hres 
