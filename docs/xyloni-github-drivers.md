# Install USB Drivers \(Windows\)

The Xyloni® Development Board development board has a FTDI FT4232H chip to communicate with the USB port. This chip has separate channels that the board uses for the SPI, JTAG, and UART interfaces. You need to install a driver for each interface, and then each interface appears as a unique FTDI device.

On Windows, you use software from Zadig to install drivers. In the Zadig software, the interface names end with *\(Interface N\)*, where *N* is the channel number.

**Note:** If you install a composite driver, all of the interfaces appear as a composite device and you cannot use them separately \(which means you cannot use all of the features of the board\).

**Important:** You must use the Efinity software v2020.1.140 with patch v2020.1.140.7.2 or higher with the Xyloni development board. Previous versions do not support separate interfaces.

## Separate Interfaces

You install drivers for separate interfaces when you want to use each interface independently.

1.  Download the Zadig software from [zadig.akeo.ie](https://zadig.akeo.ie). \(You do not need to install it; simply run the downloaded executable.\)
2.  Run the Zadig software.

    **Note:** To ensure that the USB driver is persistent across user sessions, run the Zadig software as administrator.

3.  Choose **Options** \> **List All Devices**.
4.  Repeat the following steps for Xyloni \(Interface 0\), Xyloni \(Interface 1\), and Xyloni \(Interface 3\).

    -   Select the **libusbK** \(*version*\) option in the **Driver** drop-down list. \(Do **not** choose WinUSB.\)
    -   Click **Replace Driver**.
    
    IMPORTANT: **Do not install a driver for interface 2.** When you connect the Xyloni board to you computer, Windows automatically installs a driver for it.
5.  Close the Zadig software.

