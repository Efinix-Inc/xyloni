# Xyloni T8 Development Kit User Guide

Welcome to the Xyloni® Development Kit Github repo. This site provides projects and software you can use with your Xyloni® Development Board.

![](../../../dita-art/xyoni-kit.png "Xyloni Development Kit")

-   Efinix® T8F81C2 device in an 81-ball FineLine BGA package
-   128 Mbit SPI NOR flash memory
-   FTDI FT4232H chipset with USB controller
-   Dedicated UART interface through USB
-   Micro-USB type B receptacle
-   41-pin high-speed connectors \(including PMOD\) for user I/O with unattached pin headers
-   12-pin PMOD-compatible GPIO socket
-   Micro-SD card slot
-   User LEDs and switches:
    -   4 LEDs on T8F81C2 bank 1B and 2B
    -   2 pushbutton switches \(connected to bank 2A I/O pins\)
-   33.33 MHz oscillator for T8F81C2 PLL input
-   Power:
    -   Power source: USB
    -   User selectable voltages from 1.8 V, 2.5 V, and 3.3 V for bank 2A and 2B through USB
-   Power good and T8F81C2 configuration done LEDs

The board features the Efinix® T8 programmable device in a 81-ball FBGA package, which is fabricated using Efinix® Quantum™ technology. The Quantum™-accelerated programmable logic and routing fabric is wrapped with an I/O interface in a small footprint package. T8 devices also include embedded memory blocks and multiplier blocks \(or DSP blocks\). You create designs for the T8 device in the Efinity® software, and then download the resulting configuration bitstream to the board using the USB connection.

**Note:** For more information on T8 FPGAs, refer to the [T8 Data Sheet](https://www.efinixinc.com/support/docsdl.php?s=ef&pn=DST8).

![](../art/xyloni-dvb-callouts.svg "Xyloni Development Board Components (Top)")

![](../art/xyloni-dvb-callouts-bottom.svg "Xyloni Development Board Components (Bottom)")

The FTDI FT4232H module has four channels to support the following interfaces:

-   FTDI interface 0 = SPI
-   FTDI interface 0 = JTAG
-   FTDI interface 0 = UART
-   FTDI interface 0 = VCCIO setting

It receives the T8 configuration bitstream from a USB host and writes to the on-board SPI NOR flash memory. After a reset in SPI passive mode, the FTDI controller can also write the configuration bitstream directly to the FPGA. Additionally, it supports direct JTAG programming mode in which it writes the configuration bitstream directly to the FPGA through the JTAG interface.

**Note:** Refer to [AN 006: Configuring Trion FPGAs](https://www.efinixinc.com/support/docsdl.php?s=ef&pn=AN006) for more information.

The SPI NOR flash memory stores the configuration bitstream it receives from the FTDI FT4232H module. The T8 device accesses this configuration bitstream when it is in active configuration mode \(default\).

The board regulates down the 5 V DC input using on-board switching regulators to provide the necessary voltages for the T8 device, PMOD module, SPI flash memory, and on-board oscillator.

## What's in the Box? { .section}

The Xyloni® Development Kit includes:

-   Xyloni® Development Board preloaded with a demonstration design
-   Mini-USB cable \(type B\)
-   3 unsoldered pin headers

## Register Your Xyloni® Development Kit { .section}

When you purchase an Efinix development kit, you also receive a copy of the Efinity® software plus one year of software upgrades and patches. The Efinity® software is available for download from the Support Center on the Efinix web site.

To get access to our Support Center to download your software, register your development kit at [https://www.efinixinc.com/register](https://www.efinixinc.com/register).

## Install the Efinity® Software { .section}

To develop your own designs for the T8 device on the board, you must install the Efinity® software. You can obtain the software from the Efinix® Support Center under Efinity Software \([www.efinixinc.com/support/](https://www.efinixinc.com/support/)\).

The Efinity® software includes tools to program the device on the board. Refer to the Efinity® Software User Guide for information about how to program the device.

**Note:** Efinity® documentation is installed with the software \(see **Help** \> **Documentation**\) and is also available in the Support Center under Documentation \([www.efinixinc.com/support/](https://www.efinixinc.com/support/)\).

## Run the Out of Box Design { .section}

Efinix® preloads the Xyloni® Development Board with an example design. The design includes two functions, the invert LED operation and the read SD card information operation. The read SD card information operation requires a terminal program in a computer and an SD card inserted into the SD card slot to display the SD card information.

The example design implements an open-source variation of the Efinix®'s Opal RISC-V SoC. The Opal RISC-V is a cacheless, small footprint SoC that is ideal for applications that require embedded compute capability such as system monitoring or remote configuration and control.

![](../art/xyloni-ed-bd.svg "Xyloni Development Board Example Design Block Diagram")

## Invert LED { .section}

Follow these steps to run the invert LED operation:

1.  Connect the USB cable to the board and to your computer. LED PWR turns on, indicating that the board is receiving power correctly. When configuration completes, the configuration done \(LED CDN\) turns on. The LEDs turn on sequentially from LED1 to LED4.

    **Note:** If LED PWR does not turn on, the board is not receiving power correctly.

2.  Press pushbutton BTN2 to invert the LEDs. The LEDs turn off sequentially from LED1 to LED4.

## Read SD Card Information { .section}

Follow these steps to run the read SD card information operation:

1.  Connect the USB cable to the board and to your computer. LED PWR turns on, indicating that the board is receiving power correctly. When configuration completes, the LED CDN turns on. The LEDs turn on sequentially from LED1 to LED4.

    **Note:** If LED PWR does not turn on, the board is not receiving power correctly.

2.  Insert the SD card into the SC card slot.
3.  Open a terminal software on the computer. You can use any Windows or Linux terminal applications such as, PuTTY, Tera Term, Minicom, and others.
4.  Select the com\[2\] port of UART connection in the terminal. Example:
    -   In Windows, if the terminal shows com30 com31 com32 com33, select com32.
    -   In Linux, if the terminal shows ttyUSB0 ttyUSB1 ttyUSB2 ttyUSB3, select USB2.
5.  Set the serial port baud-rate to 115200 bits per second.
6.  Press pushbutton BTN1. The terminal displays the following test menu:

    ```
    ==========Xyloni Test Menu==========
    ---Press BTN2 On Board - INVERT LED BLINK
    ---Press Keyboard 'Enter' Key  - READ SD CARD INFO
    ```

7.  Press the Enter key, and the terminal displays the SD card information. For example:

    ```
    =========SD Card Info=========
    
    Manufacturer ID    : 3
    Type               : Hard disk file system
    TRAN_SPEED         : 10Mbit/s
    SD CARD Size       : 15218 MByte
    ```

8.  If there is no SD card in the SD card slot, the terminal displays:

    ```
    Response Fail!! NO SD Card Detect
    ```


## Power and Reset { .section}

To turn on the development board, connect the micro-USB connector to a computer. Upon power-up, the power is input to the on-board regulators to generate the required 3.3 V, 2.5 V, 1.8 V, and 1.2 V for components on the board. When these voltages are up and stable, the red LED PWR illuminates, giving you a visual confirmation that the power supplies on the board are up and stable.

The T8F81C2 device is typically brought out of reset with the `CRESET` signal. Upon power up, the T8F81C2 device is held in reset until `CRESET` toggles high-low-high.

`CRESET` has a pull-up resistor. When you press CRST pushbutton, the board drives `CRESET` low; when you release CRST pushbutton, the board drives `CRESET` high. Thus, a single press of CRST provides the required high-low-high transition.

After toggling `CRESET`, the T8F81C2 device goes into configuration mode and reads the device configuration bitstream from the flash memory. When configuration completes successfully, the device drives the `CDONE` signal high. `CDONE` is connected to a yellow LED \(LED CDN\), which turns on when the T8F81C2 device enters user mode.

## Clock Source { .section}

You can clock the T8F81C2 device using the 33.33 MHz oscillator, which drives the T8F81C2 PLL IN pin.

## Configuration { .section}

The Xyloni® Development Kit supports three different configuration modes: SPI passive mode, SPI active mode, and JTAG mode.

In SPI active and passive mode, you can choose which image to load from the SPI flash by pulling the `CBSEL0` and `CBSEL1` pins high or low.

|CBSEL0|CBSEL1|Notes|
|:----:|:----:|-----|
|High|Low|Load configuration image 0.|
|Low|High|Load configuration image 1.|

**Note:** For more details on configuration, refer to [AN 006: Configuring Trion FPGAs](https://www.efinixinc.com/support/docsdl.php?s=ef&pn=AN006).

## Headers { .section}

The board contains a variety of headers to provide power, inputs, and outputs, and to communicate with external devices or boards.

|Reference Designator|Description|
|:------------------:|-----------|
|J1|20-pin connector for GPIO|
|J2|20-pin connector for GPIO|
|J3|12-pin PMOD socket and 2-pin connector for GPIO|
|USB1|Micro-USB type-B receptacle|
|SD1|SD card slot|
|Test Points|Test points|

## Headers J1 and J2 { .section}

J1 an J2 are pins that you can use to control the GPIO. J1 connects to GPIO pins in bank 2B, and J2 connects to GPIO pins in bank 2A. J1 is connected to VCCIO1 and VCC, and J2 is connected to VCCIO2.

**Note:** The pin headers for J1 and J2 are not soldered to the Xyloni® Development Board. You can choose to attach the header to the top or the bottom of the board. Attaching from the top makes the use of jumper cables easier while attaching from the bottom is commonly when connecting the headers to a breadboard.

|Pin Number|Signal Name|Pin Number|Signal Name|
|:--------:|:---------:|:--------:|:---------:|
|1|VBUS|2|VCC|
|3|GND|4|GPIOR\_020|
|5|GPIOR\_021|6|GPIOR\_022|
|7|GPIOR\_023|8|GPIOR\_024|
|9|GPIOR\_025|10|GPIOR\_026|
|11|GPIOR\_027|12|GPIOR\_028|
|13|GPIOR\_030|14|GPIOR\_031|
|15|GPIOR\_032|16|GPIOR\_034|
|17|GPIOR\_035|18|GPIOR\_036|
|19|VCCIO2|20|GND|

|Pin Number|Signal Name|Pin Number|Signal Name|
|:--------:|:---------:|:--------:|:---------:|
|1|GND|2|VCCIO1|
|3|GPIOR\_19|4|GPIOR\_18|
|5|GPIOR\_17|6|GPIOR\_16|
|7|GPIOR\_15|8|GPIOR\_14|
|9|GPIOR\_13|10|GPIOR\_12|
|11|GPIOR\_11|12|GPIOR\_10|
|13|GPIOR\_08|14|GPIOR\_07|
|15|GPIOR\_06|16|GPIOR\_05|
|17|GPIOR\_03|18|GPIOR\_01|
|19|GPIOR\_00|20|VBUS|

## Headers J3 \(PMOD\) { .section}

J3 is a 14-pin connector which consists of a 12-pin peripheral module \(PMODs\) and a 2-pin GPIO. You can use the PMOD to connect to a standard off-the-shelf modules such as ADC, DAC, audio, WiFi, Bluetooth, etc.

|Pin Number|Signal Name|T8F81C2 Pin Name|Pin Number|Signal Name|T8F81C2 Pin Name|
|:--------:|:---------:|:--------------:|:--------:|:---------:|:--------------:|
|1|–|VBUS|2|–|GPIOL\_7|
|3|PMOD\_A\_IO0|GPIOL\_12|4|PMOD\_A\_IO1|GPIOL\_13|
|5|PMOD\_A\_IO2|GPIOL\_14|6|PMOD\_A\_IO3|GPIOL\_15|
|7|PMOD\_A\_IO4|GPIOL\_16|8|PMOD\_A\_IO5|GPIOL\_17|
|9|PMOD\_A\_IO6|GPIOL\_19|10|PMOD\_A\_IO7|GPIOL\_18|
|11|GND|–|12|GND|–|
|13|VCC|–|14|VCC|–|

## USB1 { .section}

USB1, a micro-USB type B socket, is the interface between the board and your computer for power and communication. Connect the micro-USB cable for configuring T8F81C2 FPGA and NOR flash.

## SD1 { .section}

The Xyloni® Development Board includes an SD card slot, SD1. SD1 connects to GPIO pins in bank 1A. The SD card interface runs on serial peripheral interface \(SPI\) speed.

|Pin Name|Signal Name|T8F81C2 Pin Name|
|:------:|:---------:|:--------------:|
|CD1|SD DET|–|
|CD2|VCC|–|
|G1|GND|–|
|G2|GND|–|
|G3|GND|–|
|G4|GND|–|
|T1|No Connect|–|
|T2|SD\_CS|GPIOL\_00|
|T3|SD\_DI|GPIOL\_09\_CDI2|
|T4|VCC|–|
|T5|SD\_CLK|GPIOL\_05\_CDI5|
|T6|GND|–|
|T7|SD\_DO|GPIOL\_05\_CDI5|
|T8|No Connect|–|

## Test Points { .section}

The Xyloni® Development Board includes 13 test point pins. You can use the test points to monitor the state of the circuitry or to inject test signals.

|Test Point Name|Test Point Reference|
|:-------------:|:------------------:|
|TP1|VBUS|
|TP2|VCC|
|TP3|VCORE|
|TP4|VCC\_IO1|
|TP5|VCC\_IO2|
|TP6|GND|
|TP7|VRO|
|TP8|VPHY|
|TP9|VPLL|
|TP10|TDI|
|TP11|TDO|
|TP12|TMS|
|TP13|TCK|

## User Inputs and Outputs { .section}

The board has 2 pushbutton switches that you can use as inputs to the T8F81C2 device. The T8F81C2 bank 2A I/O signals connected to these switches have a pull-up resistor. When you press the switch, the signal drives low, indicating user input.

|Reference Designator|T8F81C2 Pin Name|Active|
|:------------------:|:--------------:|:----:|
|BTN1|GPIOR\_02\_RESERVED\_OUT|Low|
|BTN2|GPIOR\_15\_CBUS0|Low|

The board has 4 yellow user LEDs that are connected to I/O pins in T8F81C2 banks 2A, 1B, and 2B. By default, the T8F81C2 I/O connected to these LEDs are set as active high. To turn a given LED on, pull the corresponding I/O signal high.

**Note:** When adding these GPIO in the Efinity® Interface Designer, configure them as output pins.

|Reference Designator|T8F81C2 Pin Name|Active|
|:------------------:|:--------------:|:----:|
|LED1|GPIOL\_21\_NSTATUS|High|
|LED2|GPIOR\_37\_TESTN|High|
|LED3|GPIOR\_16\_CBUS1|High|
|LED4|GPIOR\_17\_CBUS2|High|

