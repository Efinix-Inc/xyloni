#!/usr/bin/env python3

'''
xyloni_set_vccio.py

This script can be used to adjust VCCIO per bank on the Xyloni development
kit.

Windows usage:

1.  First set EFINITY_HOME environment variable
    \path\to\efinity\<version>\bin\setup.bat
    
2.  xyloni_set_vccio.py <VCC_IO1> <VCC_IO2>

example:

    xyloni_set_vccio.py 3.3V 1.8V

'''

import argparse
from pyftdi.usbtools import UsbTools
from pyftdi.gpio import GpioController
from sys import platform
import sys
import usb.core

# Get the actual interface index of a virtual com port
def get_interface_index(dev: usb.core.Device):
    ifc = max([cfg.bNumInterfaces for cfg in dev])
    if ifc > 1:
        # This is composite device
        return 0
    
    for cfg in dev:
        for i in cfg:
            return i.bInterfaceNumber
    return 0

def format_ftdi_url(dev, interface=1):
    serialdesc = UsbTools.get_string(dev, dev.iSerialNumber)
    url = 'ftdi://'
    if platform == 'win32':
        # Because changes in pyftdi to support virtual port, we relie on bus / address instead of the sernum
        url += '0x%04x:0x%04x' % (dev.idVendor, dev.idProduct)
        url += ':%x:%x' % (dev.bus, dev.address)
    else:
        if serialdesc:
            url += '0x%04x:0x%04x:%s' % (dev.idVendor, dev.idProduct, serialdesc)
        else:
            url += '0x%04x:0x%04x' % (dev.idVendor, dev.idProduct)
    
    url += '/%d' % (interface)
    return url

if __name__ == '__main__':

	parser = argparse.ArgumentParser(description='Xyloni VCCIO adjust')
	parser.add_argument('VCC_IO1', choices=['3.3V', '2.5V', '1.8V'], help='VCC_IO1 voltage')
	parser.add_argument('VCC_IO2', choices=['3.3V', '2.5V', '1.8V'], help='VCC_IO2 voltage')

	# URL is based on which exact FTDI chipset used in cable
	# see 'https://eblot.github.io/pyftdi/urlscheme.html' for more details
	if platform == "win32":
		default_url = "ftdi:///4"
		devices = UsbTools._find_devices(0x0403, 0x6011, True)
		for dev in devices:
			if get_interface_index(dev) == 3:
				default_url = format_ftdi_url(dev)
	else:
		default_url = "ftdi:///4"

	parser.add_argument('-u', '--url', default=default_url, help='FTDI URL')

	# run parser
	args = parser.parse_args()

	gpio = GpioController()
	gpio.configure(args.url, direction=0x0F)
	
	setting = 0x0F   # start with 3.3V both VCC_IO1 and VCC_IO2
	if args.VCC_IO1 == '3.3V':
		# do nothing, already the default
		pass
	elif args.VCC_IO1 == '2.5V':
		setting = setting & 0xFD
	elif args.VCC_IO1 == '1.8V':
		setting = setting & 0xFE

	if args.VCC_IO2 == '3.3V':
		# do nothing, already the default
		pass
	elif args.VCC_IO2 == '2.5V':
		setting = setting & 0xF7
	elif args.VCC_IO2 == '1.8V':
		setting = setting & 0xFB

	gpio.write_port(setting)
	
'''
 Copyright (C) 2013-2020 Efinix Inc. All rights reserved.

 This   document  contains  proprietary information  which   is
 protected by  copyright. All rights  are reserved.  This notice
 refers to original work by Efinix, Inc. which may be derivitive
 of other work distributed under license of the authors.  In the
 case of derivative work, nothing in this notice overrides the
 original author's license agreement.  Where applicable, the 
 original license agreement is included in it's original 
 unmodified form immediately below this header.

 WARRANTY DISCLAIMER.  
     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND 
     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH 
     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES, 
     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR 
     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED 
     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.

 LIMITATION OF LIABILITY.  
     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY 
     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT 
     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY 
     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT, 
     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY 
     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR 
     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN 
     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER 
     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR 
     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT 
     APPLY TO LICENSEE.
'''
