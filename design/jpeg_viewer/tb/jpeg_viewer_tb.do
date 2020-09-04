vlib work

vlog +define+RTL_SIM ../rtl/jpeg_vievwer.v
vlog ../rtl/spi_controller.v
#vlog ../rtl/jpeg_decoder.v
vlog +define+RTL_SIM ../rtl/jpeg_decoder.v
vlog ../rtl/jfif_parser.v
vlog ../rtl/entropy_decoder.v
vlog +define+RTL_SIM ../rtl/entropy_decoder.v
vlog ../rtl/runlength_shifter.v
vlog ../rtl/sos_parser.v
#vlog ../rtl/zigzag_to_matrix.v
vlog +define+RTL_SIM ../rtl/zigzag_to_matrix.v
vlog +define+RTL_SIM ../rtl/dq_idct.v
vlog ../rtl/dct.v
vlog ../rtl/accumulator.v
vlog ../rtl/subsampling.v
vlog ../rtl/line_buffer.v
vlog ../rtl/yuv_to_rgb.v

vlog ../../../ip/true_dual_port_ram/true_dual_port_ram.v
vlog ../../../ip/simple_dual_port_ram/simple_dual_port_ram.v
vlog ../../../ip/dual_clock_fifo/dual_clock_fifo.v
vlog ../../../ip/asmi_flash_controller-v1.1/source/efx_spi_shifter.v
vlog ../../../ip/reset.v
vlog ../../../ip/mult.v
vlog ../../../ip/shift_reg.v

vlog +define+MEM_FILENAME="jpg_in/yuv444/q80/efinity.jpg" W25Q32JV.v
vlog +define+efinity_web_q80 +define+RTL_SIM jpeg_vievwer_tb.v
vsim -t ns -novopt work.jpeg_vievwer_tb

add wave -position insertpoint \
sim:/jpeg_vievwer_tb/r_sysclk 

add wave -hex -position insertpoint  \
sim:/jpeg_vievwer_tb/r_sos \
sim:/jpeg_vievwer_tb/r_jpg_byte \
sim:/jpeg_vievwer_tb/r_cnt 
add wave -unsigned -position insertpoint \
sim:/jpeg_vievwer_tb/w_bmp_width \
sim:/jpeg_vievwer_tb/w_bmp_height

add wave -position insertpoint  \
sim:/jpeg_vievwer_tb/w_miso \
sim:/jpeg_vievwer_tb/w_nss \
sim:/jpeg_vievwer_tb/w_sclk \
sim:/jpeg_vievwer_tb/w_mosi

add wave -hex -position insertpoint  \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_spi_controller/r_spi_status_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_spi_controller/w_rd_fifo_empty \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_spi_controller/w_rd_valid \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_spi_controller/w_rd_byte 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/w_jpg_byte_en \
sim:/jpeg_vievwer_tb/w_jpg_byte

add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/i_byte_en \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/i_byte \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/inst_sos_parser/r_marker_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/inst_sos_parser/r_sr_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/inst_sos_parser/r_cnt_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/inst_sos_parser/r_scan_status_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/o_jfif_ready \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/o_sos_start

add wave -unsigned -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/o_sos_width \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_jfif_parser/o_sos_height 

add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/i_scan_en \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/i_ecs_bit \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_ed_ready_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_scan_state_1P 
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_code_len_total_cnt_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/w_code_len_total_2P 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/w_code_len_2P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_code_len_cnt_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_DHT_BST_lu_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_run_cnt_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_CbCr_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_Y_sub_sample_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_codeword_lu_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/w_codeword_2P 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_ecs_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_neg_1P 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/w_runlength_2P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/w_size_2P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_runlength_3P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_size_3P 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/w_code_match_1P 

add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_Y_DC_1P 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_Y_dq_ready_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_Y_de_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_Y_eob_1P 
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_Y_runlength_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_Y_B_1P 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/o_ready} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/r_shift_state_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/r_len_cnt_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[0]/inst_runlength_shifter/r_run_cnt_1P}
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_Y_de \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_Y_B \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_Y_dq_ready 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/i_we} 
add wave -dec -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/i_data} 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_wr_x_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_wr_y_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_wr_ptr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_full_1P} 
add wave -dec -position insertpoint  \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_wr_cnt_1P} \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_wr_mcu_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_0 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_1 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_2 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_3 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_4 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_5 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_6 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_ref_row_7 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_0 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_1 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_2 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_3 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_4 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_5 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_6 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_dbg_row_7 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/w_err 
add wave -hex -position insertpoint  \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_err

add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_U_DC_1P 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_U_dq_ready_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_U_de_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_U_eob_1P 
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_U_runlength_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_U_B_1P 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/o_ready} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/r_shift_state_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/r_len_cnt_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[1]/inst_runlength_shifter/r_run_cnt_1P}
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_U_de \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_U_B \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_U_dq_ready 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/i_we} 
add wave -dec -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/i_data} 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_wr_x_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_wr_y_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_wr_ptr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_full_1P} 
add wave -dec -position insertpoint  \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_wr_cnt_1P} \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_wr_mcu_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_0 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_1 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_2 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_3 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_4 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_5 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_6 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_ref_row_7 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_0 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_1 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_2 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_3 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_4 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_5 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_6 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_dbg_row_7 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/w_err 
add wave -hex -position insertpoint  \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_err

add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_V_DC_1P 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_V_dq_ready_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_V_de_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_V_eob_1P 
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_V_runlength_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/r_V_B_1P
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/o_ready} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/r_shift_state_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/r_len_cnt_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_entropy_decoder/runlength_decode[2]/inst_runlength_shifter/r_run_cnt_1P}
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_V_de \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_V_B \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/w_V_dq_ready 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/i_we} 
add wave -dec -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/i_data} 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_wr_x_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_wr_y_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_wr_ptr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_full_1P} 
add wave -dec -position insertpoint  \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_wr_cnt_1P} \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_wr_mcu_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_0 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_1 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_2 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_3 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_4 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_5 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_6 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_ref_row_7 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_0 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_1 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_2 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_3 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_4 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_5 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_6 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_dbg_row_7 \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/w_err
add wave -hex -position insertpoint  \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_err 

add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/i_re} 
add wave -dec -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/o_md} 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_rd_addr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_rd_iteration_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_rd_ptr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_Y/genblk1/r_nempty_1P} 

add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/i_re} 
add wave -dec -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/o_md} 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_rd_addr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_rd_iteration_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_rd_ptr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_U/genblk1/r_nempty_1P} 

add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/i_re} 
add wave -dec -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/o_md} 
add wave -hex -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_rd_addr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_rd_iteration_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_rd_ptr_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_zigzag_to_matrix_V/genblk1/r_nempty_1P} 

add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/i_Y_de \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/i_Y_B \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/o_Y_re \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/i_U_de \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/i_U_B \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/o_U_re \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/i_V_de \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/i_V_B \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/o_V_re

add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_DCT_state_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_YUV_cyc_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_load_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_re_1P 
add wave -unsigned -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_u_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_v_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_x_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_y_1P 
add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dct_u_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dct_v_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dct_uv_2P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_Q_Y_2P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_Q_C_2P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dq_dct_Y_2P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dq_dct_C_2P \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dq_dct_div_2P[0]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_B_0P[0]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dq_dct_div_2P[1]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_B_0P[1]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_dq_dct_div_2P[2]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_B_0P[2]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_en_3P[0]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[0]/inst_accumulator/i_a} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[0]/inst_accumulator/i_b} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[0]/inst_accumulator/w_mult_out} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_en_3P[1]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[1]/inst_accumulator/i_a} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[1]/inst_accumulator/i_b} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[1]/inst_accumulator/w_mult_out} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_en_3P[2]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[2]/inst_accumulator/i_a} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[2]/inst_accumulator/i_b} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[2]/inst_accumulator/w_mult_out} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[0]/inst_accumulator/r_adder_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[1]/inst_accumulator/r_adder_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/genblk1[2]/inst_accumulator/r_adder_1P} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_f_3P[0]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_f_3P[1]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_f_3P[2]} 
add wave -unsigned -position insertpoint \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_f_sum_3P[0]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_f_sum_3P[1]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/w_f_sum_3P[2]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_f_4P[0]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_f_4P[1]} \
{sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_jpeg_decoder/inst_dq_idct/r_f_4P[2]} 

add wave -unsigned -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_Y_djpg_we \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_U_djpg_we \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_V_djpg_we \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_Y_djpg_q \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_U_djpg_q \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_V_djpg_q \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_Y_lb_we \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_U_lb_we \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_V_lb_we \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_Y_lb_in \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_U_lb_in \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_V_lb_in 
add wave -hex -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/r_wr_hres_x_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/r_wr_hres_y_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/w_Y_wr_addr_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/w_C_wr_addr_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/r_rd_hres_x_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/r_rd_hres_y_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/w_Y_rd_addr_1P \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/inst_line_buffer/w_C_rd_addr_1P 
add wave -unsigned -position insertpoint \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_lb_full \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_Y_lb_out \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_U_lb_out \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_V_lb_out \
sim:/jpeg_vievwer_tb/inst_jpeg_vievwer/w_lb_nempty \
sim:/jpeg_vievwer_tb/w_de \
sim:/jpeg_vievwer_tb/w_R \
sim:/jpeg_vievwer_tb/w_G \
sim:/jpeg_vievwer_tb/w_B

add wave -dec -position insertpoint \
sim:/jpeg_vievwer_tb/r_bmp_ptr \
sim:/jpeg_vievwer_tb/r_bmp_x \
sim:/jpeg_vievwer_tb/r_bmp_y

add wave -position insertpoint \
sim:/jpeg_vievwer_tb/r_sysclk
