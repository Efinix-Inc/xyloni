Video Streaming demo with Sobel Filter on Xyloni
- OV5640
- VGA666

doc/
	pin assignment and module doc

efinity/
	Efinity project

mif/
	Memory content for colour encoding system convertion

py/
	Python for generating memory content for colour encoding system convertion

rtl/
	Verilog

tb/
	Testbench

Resource Utilization
EFX_ADD         : 	442
EFX_LUT4        : 	1529
   1-2  Inputs  : 	374
   3    Inputs  : 	391
   4    Inputs  : 	764
EFX_FF          : 	1518
EFX_RAM_5K      : 	3
EFX_DPRAM_5K    : 	15
EFX_GBUFCE      : 	5

Timing Report
Clock Name           Period (ns)   Frequency (MHz)   Edge
i_ov5640_pclk              6.611         151.258     (R-R)
w_vga_pclk_div2~O         24.876          40.200     (R-R)
o_vga_pclk                15.290          65.403     (R-R)
i_osc                     13.219          75.650     (R-R)
i_sysclk                  35.525          28.149     (R-R)
