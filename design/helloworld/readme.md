helloworld Example
==================

The helloworld example is an Efinity project.
The top-level template is a pre-defined J3 header as GPIO 
Different pre-defined PMOD pin assignments for the I2C, UART and SPI can be generated with the PyAPI under bsp.
https://github.com/Efinix-Inc/xyloni/tree/master/bsp
So you can get started using these interfaces more easily.

## Concept
In Efinity, an FPGA is defined as
core - the design you done in RTL
peripheral - I/Os, PLLs and any hard block connect to core
Peripheral is taken care by Interface Designer, a tool in Efinity.
The PyAPI scripts under
https://github.com/Efinix-Inc/xyloni/tree/master/bsp
allow user to interact with Interface Designer to bring up a new designer quickly.
