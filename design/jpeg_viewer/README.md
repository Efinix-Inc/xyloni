jpeg viewer
	JPGs in SPI Flash --> JPEG decoder --> TFT display

demo/
	packed FPGA and xxd JPGs

doc/
	pin assignment

efinity/
	Efinity project

mif/
	memory content of DQT & DCT of Adobe, Adobe Web Quality 80% and MS Paint

rtl/
	Verilog

tb/
	test bench

tft_tester/
	RTL for testing TFT display

Resource Utilization
EFX_ADD         : 	746
EFX_LUT4        : 	3354
   1-2  Inputs  : 	558
   3    Inputs  : 	854
   4    Inputs  : 	1942
EFX_MULT        : 	8
EFX_FF          : 	1198
EFX_RAM_5K      : 	20
EFX_DPRAM_5K    : 	3
EFX_GBUFCE      : 	1

Timing Report
Clock Name      Period (ns)   Frequency (MHz)   Edge
i_sysclk           34.917          28.640     (R-R)
