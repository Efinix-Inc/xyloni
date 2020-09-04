vlib work

vlog +define+RTL_SIM ../rtl/zigzag_to_matrix.v
vlog ../rtl/dq_idct.v
vlog ../rtl/dct.v
vlog ../rtl/accumulator.v
vlog ../../../ip/true_dual_port_ram/true_dual_port_ram.v
vlog ../../../ip/simple_dual_port_ram/simple_dual_port_ram.v
vlog ../../../ip/mult.v
vlog ../../../ip/shift_reg.v

vlog dq_idct_tb.v
vsim -t ns -novopt work.dq_idct_tb

add wave -dec -position insertpoint  \
sim:/dq_idct_tb/B0 \
sim:/dq_idct_tb/B1 \
sim:/dq_idct_tb/B2 \
sim:/dq_idct_tb/B3 \
sim:/dq_idct_tb/B4 \
sim:/dq_idct_tb/B5 \
sim:/dq_idct_tb/B6 \
sim:/dq_idct_tb/B7 

add wave -hex -position insertpoint  \
sim:/dq_idct_tb/r_srst \
sim:/dq_idct_tb/r_sysclk \
sim:/dq_idct_tb/r_state_1P \
sim:/dq_idct_tb/r_we \
sim:/dq_idct_tb/r_ptr \
sim:/dq_idct_tb/inst_zigzag_to_matrix/genblk1/inst_simple_dual_port_ram/raddr

add wave -hex -position insertpoint  \
sim:/dq_idct_tb/inst_dq_idct/i_Y_de \
sim:/dq_idct_tb/inst_dq_idct/i_U_de \
sim:/dq_idct_tb/inst_dq_idct/i_V_de 

add wave -dec -position insertpoint  \
sim:/dq_idct_tb/inst_dq_idct/i_Y_B \
sim:/dq_idct_tb/inst_dq_idct/i_U_B \
sim:/dq_idct_tb/inst_dq_idct/i_V_B 

add wave -hex -position insertpoint  \
sim:/dq_idct_tb/inst_dq_idct/o_Y_re \
sim:/dq_idct_tb/inst_dq_idct/o_U_re \
sim:/dq_idct_tb/inst_dq_idct/o_V_re \
sim:/dq_idct_tb/inst_dq_idct/r_DCT_state_1P \
sim:/dq_idct_tb/inst_dq_idct/r_re_1P \
sim:/dq_idct_tb/inst_dq_idct/r_y_1P \
sim:/dq_idct_tb/inst_dq_idct/r_x_1P \
sim:/dq_idct_tb/inst_dq_idct/r_v_1P \
sim:/dq_idct_tb/inst_dq_idct/r_u_1P 

add wave -dec -position insertpoint  \
sim:/dq_idct_tb/inst_dq_idct/w_dct_u_1P \
sim:/dq_idct_tb/inst_dq_idct/w_dct_v_1P 

add wave -dec -position insertpoint  \
sim:/dq_idct_tb/inst_dq_idct/w_dct_uv_2P \
sim:/dq_idct_tb/inst_dq_idct/w_Q_2P \
sim:/dq_idct_tb/inst_dq_idct/w_dq_dct_2P \
sim:/dq_idct_tb/inst_dq_idct/w_dq_dct_div_2P 

add wave -hex -position insertpoint  \
sim:/dq_idct_tb/inst_dq_idct/r_load_1P \
sim:/dq_idct_tb/inst_dq_idct/w_en_3P 

add wave -dec -position insertpoint  \
sim:/dq_idct_tb/inst_dq_idct/w_f_3P

add wave -hex -position insertpoint  \
{sim:/dq_idct_tb/inst_dq_idct/genblk1[0]/inst_accumulator/i_en} \
{sim:/dq_idct_tb/inst_dq_idct/genblk1[0]/inst_accumulator/i_load} 

add wave -dec -position insertpoint  \
{sim:/dq_idct_tb/inst_dq_idct/genblk1[0]/inst_accumulator/i_a} \
{sim:/dq_idct_tb/inst_dq_idct/genblk1[0]/inst_accumulator/i_b} 

add wave -dec -position insertpoint  \
{sim:/dq_idct_tb/inst_dq_idct/genblk1[0]/inst_accumulator/w_mult_out} \
{sim:/dq_idct_tb/inst_dq_idct/genblk1[0]/inst_accumulator/r_adder_1P}

add wave -hex -position insertpoint  \
sim:/dq_idct_tb/w_Y_lb_we \
sim:/dq_idct_tb/w_U_lb_we \
sim:/dq_idct_tb/w_V_lb_we 

add wave -unsigned -position insertpoint  \
sim:/dq_idct_tb/w_Y_lb \
sim:/dq_idct_tb/w_U_lb \
sim:/dq_idct_tb/w_V_lb \
sim:/dq_idct_tb/MCU0 \
sim:/dq_idct_tb/MCU1 \
sim:/dq_idct_tb/MCU2 \
sim:/dq_idct_tb/MCU3 \
sim:/dq_idct_tb/MCU4 \
sim:/dq_idct_tb/MCU5 \
sim:/dq_idct_tb/MCU6 \
sim:/dq_idct_tb/MCU7 

