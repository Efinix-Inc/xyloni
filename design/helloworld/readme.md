helloworld Example
==================

The helloworld example is an Efinity project. The top-level template is a pre-defined J3 header as GPIO. <br/>
Different pre-defined PMOD pin assignments for the I2C, UART and SPI can be generated with the PyAPI under bsp. <br/>
https://github.com/Efinix-Inc/xyloni/tree/master/bsp <br/>
So you can get started using these interfaces more easily. <br/>

## Concept
In Efinity, the FPGA has <br/>
* Core - the RTL design <br/>
* Interface - I/Os, PLLs, and any peripheral hard blocks that connect to the core <br/>

You define the peripheral blocks using the Efinity Interface Designer. The PyAPI scripts under <br/>
https://github.com/Efinix-Inc/xyloni/tree/master/bsp <br/>
allow you to interact with the Interface Designer to bring up a new design quickly.

Refer to the Efinity Interface Designer Python API [https://www.efinixinc.com/support/docsdl.php?s=ef&pn=UG-EFN-PYAPI] for details.
