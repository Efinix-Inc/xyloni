Sapphire SoC for Xyloni
===================

Efinix has created several RISC-V SoCs based on the VexRiscv core created by Charles
Papon. The VexRiscv core, which won first place in the RISC-V SoftCPU contest in
2018, is a 32-bit CPU using the ISA RISCV32I with M and C extensions, has five
pipeline stages (fetch, decode, execute, memory, and writeback), and a configurable
feature set. Each SoC has a RISC-V processor, memory, a range of I/O, and interfaces for embedding user functions. You can easily create entire systems that include
embedded compute and user-defined accelerators all in the same Trion® FPGA.

Precompiled bitstream file with "custom on chip ram appication" -> "Xyloni_SelfTest". User can locate their appication with SoC generate from IP manager.

 Refer to the [Sapphire (Xyloni) RISC-V SoC Hardware and Software User Guide](https://www.efinixinc.com/support/docsdl.php?s=ef&pn=SAPPHIREUG) in the Support Center on the Efinix web site for detailed usage instructions.

## Resource Utilization
| Resource        | Number   |
|-----------------|----------|
| EFX_ADD         | 	689  |
| EFX_LUT4        | 	3822 |
| EFX_MULT        | 	4 	 |
| EFX_FF          | 	3143 |
| EFX_RAM_5K      | 	18   |
| EFX_GBUFCE      | 	2    |

## Core Resource
| Resource        | Number    |
|-----------------|-----------|
| INPUT           | 	31/96    |
| OUTPUT          | 	51/113   |
| CLOCK           | 	2/16     |
| LOGIC ELEMENT   | 	6045/7384|
| MEMORY BLOCK    | 	18/24    |
| MUTIPLITERS     | 	4/8      |


## Soc Spec
| Resource        | Unit |
|-----------------|--------|
| Clock(Mhz)      | 	20    |
| DMIPS/MHz       | 	0.98  |
| On Chip Ram(KB) | 	4096  |
| GPIO            | 	16    |
| SPI             | 	2     |
| I2C             | 	1     |
| UART            | 	1     |



```
├── soc_sap_t8                      -- Root
   ├── ip  			                   	
   |   └──sapphire0   				-- RISC-V Soc hardware design
   ├── embedded_sw                 	-- RISC-V baremetal firmware design    
   |   └── sapphire0               
   |       ├── bsp                             
   |       |   └── efinix
   |       |         └── EfxSapphireSoc
   |       |                  └── app         --app header file
   |       |                  └── include     --soc header file
   |       |                  └── linker      -- compiler linker file
   |       |                  └── openocd     -- openocd config file
   |       ├── config                         -- IDE Setting file for windows
   |       ├── config_linux                   -- IDE Setting file for Linux
   |       ├── software                        
   |       |   └── standalone                 -- Firmware Demo 
   |       |   	   └── Xyloni_SelfTest        -- Xyloni_SelfTest Demo 
   |       ├── tool                           -- Tools for bootloader generate
   |       └── cpu0.yaml                       
   |   
   └── README.md                          -- Read me
```
