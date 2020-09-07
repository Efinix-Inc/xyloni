Description
===========

Efinix has created RISC-V SoCs based on the VexRiscv core created by Charles
Papon. The VexRiscv core, which won first place in the RISC-V SoftCPU contest in
2018, is a 32-bit CPU using the ISA RISCV32I with M and C extensions, has five
pipeline stages (fetch, decode, execute, memory, and writeback), and a configurable
feature set. Each SoC has a RISC-V processor, memory, a range of I/O, and interfaces for embedding user functions. You can easily create entire systems that include
embedded compute and user-defined accelerators all in the same Trion® FPGA.

## OPAL SOC (For Xyloni)
Cacheless, compact SoC with asmall resource footprint.
Ideal for applications that require embedded compute capability such as system monitoring orremote configuration and control.

- ~5K LEs/18 RAM blocks
- 20 MHz
- 0.98 DMIPS/MHz
- 4 KB on-chip RAM
- 16 GPIO
- Timer
- PLIC
- 2 SPI master
- 1 I²C master/slave
- 1 UART
- 1 APB3 user peripheral
- Fmax ~23Mhz


```
├── soc_Opal_hw                  -- Root
   ├── soc_Opal_hw_t8           -- RiscV Soc Hardware design
   ├── soc_Opal_sw_t8           -- RiscV Barematel firmware design
   |   ├── bsp                             
   |   |   └── efinix                                
   |   ├── software                        
   |   |   └── standalone                  
   |   ├── cpu0.yaml                       
   |   ├── project_settings_opal.xml       
   |   └── project_settings_opal_linux.xml 
   |   
   └── README.md                -- Read me
```
