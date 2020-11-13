# Install the USB Driver \(Linux\)

The following instructions explain how to install a USB driver for Linux operating systems.

1.  Disconnect your board from your computer.

2.  In a terminal, use these commands:

    ```
    > sudo <installation directory>/bin/install_usb_driver.sh
    > sudo udevadm control --reload-rules
    ```


**Note:** If your board was connected to your computer before you executed these commands, you need to disconnect and re-connect it.

