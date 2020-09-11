Description
===========

This is a reference of decoding JPG YUV444 with Xyloni board.
The Trion® T8 FPGA reads the JPGs stored in the on board SPI Flash and shows through a TFT LCD display.

JPGs in SPI Flash --> JPEG decoder in T8 --> TFT LCD display TK043F1569

## Resource Utilization
| Resource        | Number   |
|-----------------|----------|
| EFX_ADD         | 	746  |
| EFX_LUT4        | 	3354 |
| EFX_MULT        | 	8    |
| EFX_FF          | 	1198 |
| EFX_RAM_5K      | 	20   |
| EFX_DPRAM_5K    | 	3    |
| EFX_GBUFCE      | 	1    |

## Timing Report

| Clock Name      | Period (ns)   | Frequency (MHz)   | Edge  |
|-----------------|---------------|-------------------|-------|
| i_sysclk        |   34.917      |     28.640        | (R-R) |

## Project hierarchy
```
├──jpeg_viewer
|  ├── demo		-- packed FPGA and xxd JPGs bit stream
|  ├── doc		-- pin assignment
|  ├── efinity		-- Efinity project
|  ├── mif		-- memory content of DQT & DCT of Adobe, Adobe Web Quality 80% and MS Paint
|  ├── rtl		-- Verilog design
|  ├── tb		-- Verilog test bench
|  └── tft_tester	-- RTL for TFT LCD display testing
└── README.md		-- Read me
```
