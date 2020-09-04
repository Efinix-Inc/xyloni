vlib work

vlog ../rtl/yuv_to_rgb.v
vlog ../../../ip/mult.v

vlog yuv_to_rgb_tb.v
vsim -t ns -novopt work.yuv_to_rgb_tb

add wave -dec -position insertpoint  \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_c_1P \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_d_1P \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_e_1P \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m00 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m01 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m02 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_R
add wave -dec -position insertpoint  \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m10 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m11 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m12 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_G
add wave -dec -position insertpoint  \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m20 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m21 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_m22 \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/w_B \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_R_4P \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_G_4P \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_B_4P 
add wave -unsigned -position insertpoint  \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_R_5P \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_G_5P \
sim:/yuv_to_rgb_tb/inst_yuv_to_rgb/r_B_5P 
add wave -unsigned -position insertpoint  \
sim:/yuv_to_rgb_tb/r_Y \
sim:/yuv_to_rgb_tb/r_U \
sim:/yuv_to_rgb_tb/r_V
add wave -unsigned -position insertpoint  \
sim:/yuv_to_rgb_tb/w_R \
sim:/yuv_to_rgb_tb/w_G \
sim:/yuv_to_rgb_tb/w_B
add wave -position insertpoint  \
sim:/yuv_to_rgb_tb/r_sysclk
