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

- ~5K LEs/18 RAM blocks
- 20 MHz
- 0.98 DMIPS/MHz
- 4 KB on-chip RAM
- 16 GPIOs
- Timer
- PLIC
- 2 SPI masters
- 1 I²C master/slave
- 1 UART
- 1 APB3 user peripheral
- Fmax ~23 Mhz


```
├── soc_Opal_hw                 -- Root
   ├── soc_Opal_hw_t8           -- RISC-V Soc hardware design
   ├── soc_Opal_sw_t8           -- RISC-V baremetal firmware design
   |   ├── bsp                             
   |   |   └── efinix
   |   |         └── EfxOpalSoc_t8
   |   |                  └── app         --app header file
   |   |                  └── include     --soc header file
   |   |                  └── linker      -- compiler linker file
   |   |                  └── openocd     -- openocd config file
   |   ├── config               -- Eclipse Setting file for windows
   |   ├── config_linux         -- Eclipse Setting file for Linux
   |   ├── software                        
   |   |   └── standalone       -- Firmware Demo                
   |   └── cpu0.yaml                       
   |   
   └── README.md                -- Read me
```
