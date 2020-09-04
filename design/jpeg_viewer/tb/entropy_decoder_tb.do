vlib work

vlog ../rtl/jfif_parser.v
vlog ../rtl/sos_parser.v
vlog +define+RTL_SIM ../rtl/entropy_decoder.v
vlog ../rtl/runlength_shifter.v
vlog +define+RTL_SIM +define+test_pattern_01 ../rtl/zigzag_to_matrix.v
vlog ../../../ip/simple_dual_port_ram/simple_dual_port_ram.v
vlog ../../../ip/true_dual_port_ram/true_dual_port_ram.v

#vlog +define+huff_simple0 entropy_decoder_tb.v
vlog +define+test_pattern_01 entropy_decoder_tb.v
vsim -t ns -novopt work.entropy_decoder_tb

add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/r_arst \
sim:/entropy_decoder_tb/r_sysclk \
sim:/entropy_decoder_tb/r_byte_en \
sim:/entropy_decoder_tb/r_byte \
sim:/entropy_decoder_tb/r_ptr \
sim:/entropy_decoder_tb/w_byte \
sim:/entropy_decoder_tb/w_ready 

add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/inst_jfif_parser/i_sos_re \
sim:/entropy_decoder_tb/inst_jfif_parser/o_sos_start \
sim:/entropy_decoder_tb/inst_jfif_parser/o_sos_scan_en \
sim:/entropy_decoder_tb/inst_jfif_parser/o_sos_ecs_bit \
sim:/entropy_decoder_tb/inst_jfif_parser/inst_sos_parser/r_byte_1P \
sim:/entropy_decoder_tb/inst_jfif_parser/inst_sos_parser/r_sr_1P \
sim:/entropy_decoder_tb/inst_jfif_parser/inst_sos_parser/r_cnt_1P \
sim:/entropy_decoder_tb/inst_jfif_parser/inst_sos_parser/r_scan_status_1P

add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_scan_state_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_ed_ready_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_ecs_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_code_match_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_runlength_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_size_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_runlength_3P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_size_3P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_DHT_BST_lu_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_code_len_cnt_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_code_len_total_cnt_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_codeword_lu_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_CbCr_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_neg_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_Y_dq_ready_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_Y_de_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_Y_eob_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_Y_runlength_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_run_cnt_2P
add wave -dec -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_Y_B_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_Y_DC_1P
add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_U_dq_ready_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_U_de_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_U_eob_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_U_runlength_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_U_run_cnt_2P
add wave -dec -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_U_B_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_U_DC_1P
add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_V_dq_ready_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_V_de_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_V_eob_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_V_runlength_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_V_run_cnt_2P
add wave -dec -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_V_B_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/r_V_DC_1P
add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_code_len_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_code_len_total_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_DC_codeword_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_AC_codeword_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_DC_codeword_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_AC_codeword_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_codeword_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_DC_symbol1_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_AC_symbol1_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_DC_symbol1_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_AC_symbol1_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_DC_runlength_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_AC_runlength_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_DC_runlength_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_AC_runlength_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_runlength_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_DC_size_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_Y_AC_size_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_DC_size_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_C_AC_size_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_size_2P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_code_match_1P

#add wave -hex -position insertpoint  \
#sim:/entropy_decoder_tb/inst_entropy_decoder/inst_DHT_BST/ram \
#sim:/entropy_decoder_tb/inst_entropy_decoder/inst_DC_codeword/ram \
#sim:/entropy_decoder_tb/inst_entropy_decoder/inst_Y_AC_codeword/ram \
#sim:/entropy_decoder_tb/inst_entropy_decoder/inst_C_AC_codeword/ram \
#sim:/entropy_decoder_tb/inst_entropy_decoder/inst_Y_symbol1/ram \
#sim:/entropy_decoder_tb/inst_entropy_decoder/inst_C_symbol1/ram

add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_sim_ecs_1P \
sim:/entropy_decoder_tb/inst_entropy_decoder/w_sim_codeword_2P

add wave -unsigned -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/i_we} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/i_runlength} 
add wave -dec -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/i_B} 
add wave -unsigned -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/o_ready} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/r_shift_state_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/r_len_cnt_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/r_run_cnt_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/w_mcu_size} 

add wave -unsigned -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/i_we} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/i_runlength} 
add wave -dec -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/i_B} 
add wave -unsigned -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/o_ready} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/r_shift_state_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/r_len_cnt_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/r_run_cnt_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/w_mcu_size} 

add wave -unsigned -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/i_we} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/i_runlength} 
add wave -dec -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/i_B} 
add wave -unsigned -position insertpoint  \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/o_ready} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/r_shift_state_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/r_len_cnt_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/r_run_cnt_1P} \
{sim:/entropy_decoder_tb/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/w_mcu_size} 

add wave -hex -position insertpoint  \
sim:/entropy_decoder_tb/w_Y_de \
sim:/entropy_decoder_tb/w_Y_B \
sim:/entropy_decoder_tb/w_U_de \
sim:/entropy_decoder_tb/w_U_B \
sim:/entropy_decoder_tb/w_V_de \
sim:/entropy_decoder_tb/w_V_B 

add wave -dec -position insertpoint  \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_0 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_1 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_2 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_3 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_4 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_5 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_6 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_Y/genblk1/w_row_7

add wave -dec -position insertpoint  \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_0 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_1 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_2 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_3 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_4 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_5 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_6 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_U/genblk1/w_row_7

add wave -dec -position insertpoint  \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_0 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_1 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_2 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_3 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_4 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_5 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_6 \
sim:/entropy_decoder_tb/inst_zigzag_to_matrix_V/genblk1/w_row_7

#run 6000ns
