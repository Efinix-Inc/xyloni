Opal SoC for Xyloni
===================

Efinix has created several RISC-V SoCs based on the VexRiscv core created by Charles
Papon. The VexRiscv core, which won first place in the RISC-V SoftCPU contest in
2018, is a 32-bit CPU using the ISA RISCV32I with M and C extensions, has five
pipeline stages (fetch, decode, execute, memory, and writeback), and a configurable
feature set. Each SoC has a RISC-V processor, memory, a range of I/O, and interfaces for embedding user functions. You can easily create entire systems that include
embedded compute and user-defined accelerators all in the same Trion® FPGA.

Opal is a cacheless, compact SoC with a small resource footprint. It is ideal for 
applications that require embedded compute capability such as system monitoring or 
remote configuration and control. Refer to the [Opal (Xyloni) RISC-V SoC Hardware and Software User Guide](https://www.efinixinc.com/support/docsdl.php?s=ef&amp;pn=OPALUGX) in the Support Center on the Efinix web site for detailed usage instructions.

## Resource Utilization
| Resource        | Number   |
|-----------------|----------|
| EFX_ADD         | 	823  |
| EFX_LUT4        | 	3561 |
| EFX_FF          | 	2362 |
| EFX_RAM_5K      | 	18   |
| EFX_GBUFCE      | 	2    |

## Core Resource
| Resource        | Number    |
|-----------------|-----------|
| INPUT           | 	31/96    |
| OUTPUT          | 	51/113   |
| CLOCK           | 	2/16     |
| LOGIC ELEMENT   | 	5438/7384|
| MEMORY BLOCK    | 	18/24    |
| MUTIPLITERS     | 	4/8      |


## Soc Spec
| Resource        | Unit |
|-----------------|--------|
| Clock(Mhz)      | 	20    |
| DMIPS/MHz       | 	0.98  |
| On Chip Ram(KB) | 	4096  |
| GPIO            | 	16    |
| Timer           | 	1     |
| SPI             | 	2     |
| I2C             | 	1     |
| UART            | 	1     |
| ABP3 Bus        | 	1     |


```
├── soc_Opal_hw                           -- Root
   ├── soc_Opal_hw_t8                     -- RISC-V Soc hardware design
   ├── soc_Opal_sw_t8                     -- RISC-V baremetal firmware design
   |   ├── bsp                             
   |   |   └── efinix
   |   |         └── EfxOpalSoc_t8
   |   |                  └── app         --app header file
   |   |                  └── include     --soc header file
   |   |                  └── linker      -- compiler linker file
   |   |                  └── openocd     -- openocd config file
   |   ├── config                         -- Eclipse Setting file for windows
   |   ├── config_linux                   -- Eclipse Setting file for Linux
   |   ├── software                        
   |   |   └── standalone                 -- Firmware Demo                
   |   └── cpu0.yaml                       
   |   
   └── README.md                          -- Read me
```
