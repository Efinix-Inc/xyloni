Streaming Video Filter
======================

This design implements a video streaming Sobel filter on the Xyloni board.

OV5640 Camera module --> Trion® T8 FPGA --> VGA666

![alt text](https://github.com/Efinix-Inc/xyloni/blob/master/docs/v_filter.JPG "demo")

## Resource Utilization
| Resource        | Number   |
|-----------------|----------|
| EFX_ADD         | 	442  |
| EFX_LUT4        | 	1529 |
| EFX_FF          | 	1518 |
| EFX_RAM_5K      | 	3    |
| EFX_DPRAM_5K    | 	15   |
| EFX_GBUFCE      | 	5    |

## Timing Report
| Clock Name           | Period (ns)   | Frequency (MHz)   | Edge  |
|----------------------|---------------|-------------------|-------|
| i_ov5640_pclk        |      6.611    |     151.258       | (R-R) |
| w_vga_pclk_div2~O    |     24.876    |      40.200       | (R-R) |
| o_vga_pclk           |     15.290    |      65.403       | (R-R) |
| i_osc                |     13.219    |      75.650       | (R-R) |
| i_sysclk             |     35.525    |      28.149       | (R-R) |

## Project Hierarchy
```
├── v_filter
|   ├── doc		-- pin assignment and module doc
|   ├── efinity		-- Efinity project
|   ├── mif		-- Memory content for colour encoding system convertion
|   ├── py		-- Python for generating memory content for colour encoding system convertion
|   ├── rtl		-- Verilog design
|   └── tb		-- Verilog testbench
└── README.md		-- Read me
```
