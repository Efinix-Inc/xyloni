vlib work
vlog ../../../ip/dual_clock_fifo/dual_clock_fifo.v
vlog ../../../ip/asmi_flash_controller-v1.1/source/efx_spi_shifter.v
vlog ../../../ip/simple_dual_port_ram/simple_dual_port_ram.v
vlog ../rtl/spi_controller.v

vlog spi_controller_tb.v
vlog +define+MEM_FILENAME="jpg_in/yuv444/q80/efinity.jpg" W25Q32JV.v
vsim -t ns -novopt work.spi_controller_tb

add wave -hex -position insertpoint  \
sim:/spi_controller_tb/r_arst \
sim:/spi_controller_tb/r_sysclk \
sim:/spi_controller_tb/r_next \
sim:/spi_controller_tb/r_back \
sim:/spi_controller_tb/r_interrupt \
sim:/spi_controller_tb/r_flush \
sim:/spi_controller_tb/w_WPn \
sim:/spi_controller_tb/w_HOLDn \
sim:/spi_controller_tb/w_miso \
sim:/spi_controller_tb/w_DIO \
sim:/spi_controller_tb/w_nss \
sim:/spi_controller_tb/w_sclk \
sim:/spi_controller_tb/w_mosi \
sim:/spi_controller_tb/w_mosi_oe \
sim:/spi_controller_tb/w_ready \
sim:/spi_controller_tb/w_byte_en \
sim:/spi_controller_tb/w_byte 
add wave -hex -position insertpoint  \
sim:/spi_controller_tb/inst_spi_controller/r_spi_status_1P \
sim:/spi_controller_tb/inst_spi_controller/r_cmd_en_1P \
sim:/spi_controller_tb/inst_spi_controller/r_cmd_1P \
sim:/spi_controller_tb/inst_spi_controller/r_re_1P \
sim:/spi_controller_tb/inst_spi_controller/r_spi_addr_1P \
sim:/spi_controller_tb/inst_spi_controller/r_cnt_1P
add wave -hex -position insertpoint  \
sim:/spi_controller_tb/inst_spi_controller/w_busy \
sim:/spi_controller_tb/inst_spi_controller/w_rd_byte \
sim:/spi_controller_tb/inst_spi_controller/w_rd_valid \
sim:/spi_controller_tb/inst_spi_controller/w_rd_fifo_empty 
add wave -hex -position insertpoint  \
sim:/spi_controller_tb/inst_spi_controller/inst_efx_spi_shifter/nrst \
sim:/spi_controller_tb/inst_spi_controller/inst_efx_spi_shifter/fsm_status \
sim:/spi_controller_tb/inst_spi_controller/inst_efx_spi_shifter/spi_cmd_en_pos \
sim:/spi_controller_tb/inst_spi_controller/inst_efx_spi_shifter/spi_cmd 
