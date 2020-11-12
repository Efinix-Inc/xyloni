helloworld Example
==================

The helloworld example is an Efinity project. <br/>
The top-level template is a pre-defined J3 header as GPIO. <br/>
Different pre-defined PMOD pin assignments for the I2C, UART and SPI can be generated with the PyAPI under bsp. <br/>
https://github.com/Efinix-Inc/xyloni/tree/master/bsp <br/>
So you can get started using these interfaces more easily. <br/>

## Concept
In Efinity, an FPGA is defined as <br/>
core - the design you done in RTL <br/>
peripheral - I/Os, PLLs and any hard block connect to core <br/>

Peripheral is taken care by Interface Designer, a tool in Efinity. <br/>
The PyAPI scripts under <br/>
https://github.com/Efinix-Inc/xyloni/tree/master/bsp <br/>
allow user to interact with Interface Designer to bring up a new designer quickly.
