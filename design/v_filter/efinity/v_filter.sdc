#create_clock -period 6.780	i_ov5640_pclk
#create_clock -period 26.936	inst_ov5640_interface/w_pclk_div2
#create_clock -period 26.936	w_vga_pclk_div2~O
#create_clock -period 13.468	o_vga_pclk

create_clock -period 6.600	i_ov5640_pclk
create_clock -period 26.700	w_vga_pclk_div2~O
create_clock -period 13.350	o_vga_pclk

#create_clock -period 12.000	o_vga_pclk
create_clock -period 100000	i_osc
#create_clock -period 20.833 i_sysclk
create_clock -period 41.666 i_sysclk

#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_vsync]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_href]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d0]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d1]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d2]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d3]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d4]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d5]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d6]
#set_input_delay -clock i_ov5640_pclk 6.780 [get_ports i_ov5640_d7]

set_clock_groups -exclusive -group {i_ov5640_pclk} -group {w_vga_pclk_div2~O o_vga_pclk}
set_clock_groups -exclusive -group {i_ov5640_pclk} -group {i_osc i_sysclk}
set_clock_groups -exclusive -group {w_vga_pclk_div2~O o_vga_pclk} -group {i_osc i_sysclk}
set_clock_groups -exclusive -group {i_osc} -group {i_sysclk}

set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d0}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d0}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d1}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d1}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d2}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d2}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d3}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d3}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d4}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d4}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d5}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d5}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d6}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d6}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_d7}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_d7}]
set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_href}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_href}]

set_input_delay -clock i_ov5640_pclk -max 5.958 [get_ports {i_ov5640_vsync}]
set_input_delay -clock i_ov5640_pclk -min 2.128 [get_ports {i_ov5640_vsync}]

set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_b[0]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_b[0]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_b[1]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_b[1]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_b[2]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_b[2]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_b[3]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_b[3]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_b[4]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_b[4]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_g[0]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_g[0]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_g[1]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_g[1]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_g[2]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_g[2]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_g[3]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_g[3]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_g[4]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_g[4]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_g[5]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_g[5]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_hsync}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_hsync}]

set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_r[0]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_r[0]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_r[1]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_r[1]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_r[2]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_r[2]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_r[3]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_r[3]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_r[4]}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_r[4]}]
set_output_delay -clock o_vga_pclk -max -3.903 [get_ports {o_vga_vsync}]
set_output_delay -clock o_vga_pclk -min -1.615 [get_ports {o_vga_vsync}]
set_input_delay -clock i_sysclk -max 5.958 [get_ports {i_ov5640_scl}]
set_input_delay -clock i_sysclk -min 2.128 [get_ports {i_ov5640_scl}]
set_output_delay -clock i_sysclk -max -3.913 [get_ports {o_ov5640_scl_oe}]
set_output_delay -clock i_sysclk -min -1.612 [get_ports {o_ov5640_scl_oe}]
set_input_delay -clock i_sysclk -max 5.958 [get_ports {i_ov5640_sda}]
set_input_delay -clock i_sysclk -min 2.128 [get_ports {i_ov5640_sda}]
set_output_delay -clock i_sysclk -max -3.913 [get_ports {o_ov5640_sda_oe}]
set_output_delay -clock i_sysclk -min -1.612 [get_ports {o_ov5640_sda_oe}]
