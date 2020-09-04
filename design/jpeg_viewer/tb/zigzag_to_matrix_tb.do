vlib work

vlog +define+RTL_SIM ../rtl/zigzag_to_matrix.v
vlog ../../../ip/simple_dual_port_ram/simple_dual_port_ram.v

vlog zigzag_to_matrix_tb.v
vsim -t ns -novopt work.zigzag_to_matrix_tb

add wave -hex -position insertpoint  \
sim:/zigzag_to_matrix_tb/r_srst \
sim:/zigzag_to_matrix_tb/r_sysclk \
sim:/zigzag_to_matrix_tb/r_state_1P \
sim:/zigzag_to_matrix_tb/r_we \
sim:/zigzag_to_matrix_tb/r_ptr \
sim:/zigzag_to_matrix_tb/r_re \
sim:/zigzag_to_matrix_tb/w_md

add wave -hex -position insertpoint  \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/wdata \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/waddr \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/we

#add wave -hex -position insertpoint  \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/i_data \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_matrix_1P
#
#add wave -hex -position insertpoint  \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_0 \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_1 \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_2 \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_3 \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_4 \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_5 \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_6 \
#sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/w_row_7

add wave -hex -position insertpoint  \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_zigzag_state_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_wr_x_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_wr_y_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_wr_ptr_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_full_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_rd_addr_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_rd_iteration_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_rd_ptr_1P \
sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/r_nempty_1P

add wave -hex -position insertpoint  \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[63]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[62]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[61]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[60]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[59]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[58]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[57]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[56]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[55]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[54]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[53]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[52]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[51]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[50]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[49]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[48]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[47]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[46]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[45]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[44]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[43]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[42]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[41]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[40]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[39]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[38]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[37]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[36]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[35]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[34]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[33]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[32]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[31]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[30]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[29]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[28]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[27]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[26]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[25]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[24]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[23]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[22]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[21]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[20]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[19]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[18]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[17]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[16]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[15]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[14]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[13]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[12]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[11]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[10]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[9]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[8]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[7]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[6]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[5]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[4]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[3]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[2]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[1]} \
{sim:/zigzag_to_matrix_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/ram[0]}
