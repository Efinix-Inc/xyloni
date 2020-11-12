#!/usr/bin/env python3

# Get access to useful python package
import os
import sys
import pprint
import argparse

# Tell python where to get Interface Designer's API package
pt_home = os.environ['EFXPT_HOME']
sys.path.append(pt_home + "/bin")

from api_service.design import DesignAPI  # Get access to design database API
from api_service.device import DeviceAPI  # Get access to device database API
import api_service.excp.design_excp as APIExcp  # Get access to API exception

# cmd-line parser
def parse_cmdline():
    parser = argparse.ArgumentParser(description='Xyloni BSP build script')
    parser.add_argument('-m', '--mode', choices=['gpio', 'spi', 'uart', 'hbridge', 'i2c', 'i2s'], default='gpio', help='J3 PMOD usage')
    parser.add_argument('-p', '--project', default='xyloni', help='Project name, default xyloni')
    parser.add_argument('-v', '--verbose', default='', help='Set to True to see detial messages from API engine')
    parser.add_argument('-1', '--gpio_j1', default='15', help='Number of GPIOs on J1, default & max 15')
    parser.add_argument('-2', '--gpio_j2', default='14', help='Number of GPIOs on J2, default & max 14')
    parser.add_argument('-3', '--gpio_j3', default='9', help='Number of GPIOs on J3, default & max 9')
    
    # run parser
    args = parser.parse_args()
    return args

# script entry point
if __name__=='__main__':
    args = parse_cmdline()
    mode = args.mode
    j1 = int(args.gpio_j1)-1
    if (j1 < -1 or j1 > 14):
        raise ValueError('Number of GPIOs on J1 shoule be 0 =< and =< 15')
    j2 = int(args.gpio_j2)-1
    if (j2 < -1 or j2 > 13):
        raise ValueError('Number of GPIOs on J2 shoule be 0 =< and =< 14')
    j3 = int(args.gpio_j3)-1
    if (mode == 'gpio' and (j3 < -1 or j3 > 8)):
        raise ValueError('Number of GPIOs on J3 PMOD Type1A shoule be 0 =< and =< 9')
    if (mode == 'spi' and (j3 < -1 or j3 > 4)):
        raise ValueError('Number of GPIOs on J3 PMOD Type2A shoule be 0 =< and =< 5')
    if (mode == 'uart' and (j3 < -1 or j3 > 4)):
        raise ValueError('Number of GPIOs on J3 PMOD Type3A shoule be 0 =< and =< 5')
#   if (mode == 'hbridge' and (j3 < -1 or j3 > 4)):
#       raise ValueError('Number of GPIOs on J3 PMOD Type5A shoule be 0 =< and =< 5')
    if (mode == 'i2c' and (j3 < -1 or j3 > 4)):
        raise ValueError('Number of GPIOs on J3 PMOD Type6 shoule be 0 =< and =< 5')
    if (mode == 'i2s' and (j3 < -1 or j3 > 4)):
        raise ValueError('Number of GPIOs on J3 PMOD Type7 shoule be 0 =< and =< 5')
    
    is_verbose = bool(args.verbose)
    design = DesignAPI(is_verbose)
    device = DeviceAPI(is_verbose)
    
    # Create empty design
    device_name = "T8F81"  # Matches Device name from Efinity's Project Editor
    project_name = args.project
    output_dir = "output"  # New pt_demo periphery design will be generated in this directory
    
    try:
        design.create(project_name, device_name, output_dir)
    except APIExcp.PTAPIException as excp:
        print("Fail to create design : {} Msg={}".format(excp.get_msg_level(), excp.get_msg()))
        sys.exit(1)
    
    # Create busses and GPIOs
    design.create_output_gpio("SD_CS")
    design.create_output_gpio("SPI_SS")
    design.create_output_gpio("SPI_SCLK")
    design.create_input_gpio("SD_DI")
    design.create_output_gpio("SPI_MOSI")
    design.create_output_gpio("SD_DO")
    design.create_input_gpio("SPI_MISO")
    design.create_output_gpio("SD_SCLK")
    design.create_input_gpio("RXD")
    design.create_output_gpio("TXD")
    design.create_pll_input_clock_gpio("PLL_IN")
    design.create_output_gpio("LED1")
    design.create_output_gpio("LED2")
    design.create_input_gpio("BTN1")
    design.create_input_gpio("BTN2_J2_7")
    design.create_output_gpio("LED3_J2_6")
    design.create_output_gpio("LED4_J2_5")
    
    if (j1 >= 0):
        design.create_inout_gpio("GPIO_J1", j1, 0)
    if (j2 >= 0):
        design.create_inout_gpio("GPIO_J2", j2, 0)
    if (mode != 'hbridge'):
        if (j3 >= 0):
            design.create_inout_gpio("GPIO_J3", j3, 0)
        if (mode == 'spi'):
            design.create_output_gpio("PMOD_CS")
            design.create_output_gpio("PMOD_MOSI")
            design.create_input_gpio("PMOD_MISO")
            design.create_output_gpio("PMOD_SCK")
        elif (mode == 'uart'):
            design.create_input_gpio("PMOD_CTS")
            design.create_output_gpio("PMOD_TXD")
            design.create_input_gpio("PMOD_RXD")
            design.create_output_gpio("PMOD_RTS")
        elif (mode == 'i2c'):
            design.create_inout_gpio("PMOD_SCL")
            design.create_inout_gpio("PMOD_SDA")
        elif (mode == 'i2s'):
            design.create_output_gpio("PMOD_LRCLK")
            design.create_output_gpio("PMOD_DACD")
            design.create_input_gpio("PMOD_ADCD")
            design.create_output_gpio("PMOD_BCLK")
    else:
        design.create_output_gpio("PMOD_DIR", 1, 0)
        design.create_output_gpio("PMOD_EN", 1, 0)
        design.create_input_gpio("PMOD_SA", 1, 0)
        design.create_input_gpio("PMOD_SB", 1, 0)
    
    # Configure property
    design.set_property("SD_CS",    "OUT_REG",  "REG", "GPIO")
    design.set_property("SPI_SS",   "OUT_REG",  "REG", "GPIO")
    design.set_property("SPI_SCLK", "OUT_REG",  "REG", "GPIO")
    design.set_property("SPI_MOSI", "OUT_REG",  "REG", "GPIO")
    design.set_property("SD_DO",    "OUT_REG",  "REG", "GPIO")
    design.set_property("SD_SCLK",  "OUT_REG",  "REG", "GPIO")
    design.set_property("TXD",      "OUT_REG",  "REG", "GPIO")
    design.set_property("GPIO_J1",  "OUT_REG",  "REG", "GPIO_BUS")
    design.set_property("GPIO_J2",  "OUT_REG",  "REG", "GPIO_BUS")
    
    design.set_property("SD_DI",    "IN_REG",   "REG", "GPIO")
    design.set_property("SPI_MISO", "IN_REG",   "REG", "GPIO")
    design.set_property("RXD",      "IN_REG",   "REG", "GPIO")
    design.set_property("GPIO_J1",  "IN_REG",   "REG", "GPIO_BUS")
    design.set_property("GPIO_J2",  "IN_REG",   "REG", "GPIO_BUS")
    
    design.set_property("GPIO_J1",  "OE_REG",   "REG", "GPIO_BUS")
    design.set_property("GPIO_J2",  "OE_REG",   "REG", "GPIO_BUS")
    
    design.set_property("SD_CS",    "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("SPI_SS",   "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("SPI_SCLK", "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("SPI_MOSI", "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("SD_DO",    "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("SD_SCLK",  "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("TXD",      "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("GPIO_J1",  "OUT_CLK_PIN",  "i_sysclk")
    design.set_property("GPIO_J2",  "OUT_CLK_PIN",  "i_sysclk")

    design.set_property("SD_DI",    "IN_CLK_PIN",   "i_sysclk")
    design.set_property("SPI_MISO", "IN_CLK_PIN",   "i_sysclk")
    design.set_property("RXD",      "IN_CLK_PIN",   "i_sysclk")
    design.set_property("GPIO_J1",  "IN_CLK_PIN",   "i_sysclk")
    design.set_property("GPIO_J2",  "IN_CLK_PIN",   "i_sysclk")
    
    if (mode != 'hbridge'):
        design.set_property("GPIO_J3",  "OUT_REG",  "REG", "GPIO_BUS")
        design.set_property("GPIO_J3",  "IN_REG",   "REG", "GPIO_BUS")
        design.set_property("GPIO_J3",  "OE_REG",   "REG", "GPIO_BUS")
        design.set_property("GPIO_J3",  "OUT_CLK_PIN",  "i_sysclk")
        design.set_property("GPIO_J3",  "IN_CLK_PIN",   "i_sysclk")
        if (mode == 'spi'):
            design.set_property("PMOD_CS",  "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_CS",  "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_CS",  "OUT_CLK_PIN",  "i_sysclk")
            design.set_property("PMOD_MOSI","OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_MOSI","OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_MOSI","OUT_CLK_PIN",  "i_sysclk")
            design.set_property("PMOD_MISO","IN_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_MISO","IN_CLK_PIN",   "i_sysclk")
            design.set_property("PMOD_SCK", "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_SCK", "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_SCK", "OUT_CLK_PIN",  "i_sysclk")
        elif (mode == 'uart'):
            design.set_property("PMOD_CTS", "IN_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_CTS", "IN_CLK_PIN",   "i_sysclk")
            design.set_property("PMOD_TXD", "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_TXD", "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_TXD", "OUT_CLK_PIN",  "i_sysclk")
            design.set_property("PMOD_RXD", "IN_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_RXD", "IN_CLK_PIN",   "i_sysclk")
            design.set_property("PMOD_RTS", "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_RTS", "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_RTS", "OUT_CLK_PIN",  "i_sysclk")
        elif (mode == 'i2c'):
            design.set_property("GPIO_SCL", "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("GPIO_SCL", "IN_REG",   "REG", "GPIO_BUS")
            design.set_property("GPIO_SCL", "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("GPIO_SCL", "OUT_CLK_PIN",  "i_sysclk")
            design.set_property("GPIO_SCL", "IN_CLK_PIN",   "i_sysclk")
            design.set_property("GPIO_SDA", "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("GPIO_SDA", "IN_REG",   "REG", "GPIO_BUS")
            design.set_property("GPIO_SDA", "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("GPIO_SDA", "OUT_CLK_PIN",  "i_sysclk")
            design.set_property("GPIO_SDA", "IN_CLK_PIN",   "i_sysclk")
        elif (mode == 'i2s'):
            design.set_property("PMOD_LRCLK",   "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_LRCLK",   "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_LRCLK",   "OUT_CLK_PIN",  "i_sysclk")
            design.set_property("PMOD_DACD",    "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_DACD",    "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_DACD",    "OUT_CLK_PIN",  "i_sysclk")
            design.set_property("PMOD_ADCD",    "IN_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_ADCD",    "IN_CLK_PIN",   "i_sysclk")
            design.set_property("PMOD_BCLK",    "OUT_REG",  "REG", "GPIO_BUS")
            design.set_property("PMOD_BCLK",    "OE_REG",   "REG", "GPIO_BUS")
            design.set_property("PMOD_BCLK",    "OUT_CLK_PIN",  "i_sysclk")
    else:
        design.set_property("PMOD_DIR", "OUT_REG",  "REG", "GPIO_BUS")
        design.set_property("PMOD_DIR", "OE_REG",   "REG", "GPIO_BUS")
        design.set_property("PMOD_DIR", "OUT_CLK_PIN",  "i_sysclk")
        design.set_property("PMOD_EN",  "OUT_REG",  "REG", "GPIO_BUS")
        design.set_property("PMOD_EN",  "OE_REG",   "REG", "GPIO_BUS")
        design.set_property("PMOD_EN",  "OUT_CLK_PIN",  "i_sysclk")
        design.set_property("PMOD_SA",  "IN_REG",   "REG", "GPIO_BUS")
        design.set_property("PMOD_SA",  "IN_CLK_PIN",   "i_sysclk")
        design.set_property("PMOD_SB",  "IN_REG",   "REG", "GPIO_BUS")
        design.set_property("PMOD_SB",  "IN_CLK_PIN",   "i_sysclk")
    
    # Pin assignment
    design.assign_pkg_pin("SD_CS",          "G5")
    design.assign_pkg_pin("SPI_SS",         "J4")
    design.assign_pkg_pin("SPI_SCLK",       "H4")
    design.assign_pkg_pin("SD_DI",          "G4")
    design.assign_pkg_pin("SPI_MOSI",       "F4")
    design.assign_pkg_pin("SD_DO",          "J3")
    design.assign_pkg_pin("SPI_MISO",       "H3")
    design.assign_pkg_pin("SD_SCLK",        "J2")
    design.assign_pkg_pin("RXD",            "H2")
    design.assign_pkg_pin("TXD",            "F3")
    design.assign_pkg_pin("PLL_IN",         "C3")
    design.assign_pkg_pin("LED1",           "B3")
    design.assign_pkg_pin("LED2",           "J6")
    design.assign_pkg_pin("BTN1",           "C5")
    design.assign_pkg_pin("BTN2_J2_7",      "C9")
    design.assign_pkg_pin("LED3_J2_6",      "D7")
    design.assign_pkg_pin("LED4_J2_5",      "D8")
    
    if (j1 >= 0):
        design.assign_pkg_pin("GPIO_J1[0]",     "F8")
    if (j1 >= 1):
        design.assign_pkg_pin("GPIO_J1[1]",     "E7")
    if (j1 >= 2):
        design.assign_pkg_pin("GPIO_J1[2]",     "F7")
    if (j1 >= 3):
        design.assign_pkg_pin("GPIO_J1[3]",     "E6")
    if (j1 >= 4):
        design.assign_pkg_pin("GPIO_J1[4]",     "F6")
    if (j1 >= 5):
        design.assign_pkg_pin("GPIO_J1[5]",     "F5")
    if (j1 >= 6):
        design.assign_pkg_pin("GPIO_J1[6]",     "G9")
    if (j1 >= 7):
        design.assign_pkg_pin("GPIO_J1[7]",     "H9")
    if (j1 >= 8):
        design.assign_pkg_pin("GPIO_J1[8]",     "J9")
    if (j1 >= 9):
        design.assign_pkg_pin("GPIO_J1[9]",     "J8")
    if (j1 >= 10):
        design.assign_pkg_pin("GPIO_J1[10]",    "G8")
    if (j1 >= 11):
        design.assign_pkg_pin("GPIO_J1[11]",    "H8")
    if (j1 >= 12):
        design.assign_pkg_pin("GPIO_J1[12]",    "J7")
    if (j1 >= 13):
        design.assign_pkg_pin("GPIO_J1[13]",    "G6")
    if (j1 >= 14):
        design.assign_pkg_pin("GPIO_J1[14]",    "H6")
    
    if (j2 >= 0):
        design.assign_pkg_pin("GPIO_J2[0]",     "E8")
    if (j2 >= 1):
        design.assign_pkg_pin("GPIO_J2[1]",     "D9")
    if (j2 >= 2):
        design.assign_pkg_pin("GPIO_J2[2]",     "B9")
    if (j2 >= 3):
        design.assign_pkg_pin("GPIO_J2[3]",     "D6")
    if (j2 >= 4):
        design.assign_pkg_pin("GPIO_J2[4]",     "C8")
    if (j2 >= 5):
        design.assign_pkg_pin("GPIO_J2[5]",     "B8")
    if (j2 >= 6):
        design.assign_pkg_pin("GPIO_J2[6]",     "A9")
    if (j2 >= 7):
        design.assign_pkg_pin("GPIO_J2[7]",     "A8")
    if (j2 >= 8):
        design.assign_pkg_pin("GPIO_J2[8]",     "C7")
    if (j2 >= 9):
        design.assign_pkg_pin("GPIO_J2[9]",     "C6")
    if (j2 >= 10):
        design.assign_pkg_pin("GPIO_J2[10]",    "B6")
    if (j2 >= 11):
        design.assign_pkg_pin("GPIO_J2[11]",    "A6")
    if (j2 >= 12):
        design.assign_pkg_pin("GPIO_J2[12]",    "B5")
    if (j2 >= 13):
        design.assign_pkg_pin("GPIO_J2[13]",    "A5")
    
    if (mode == 'gpio'):
        if (j3 >= 0):
            design.assign_pkg_pin("GPIO_J3[0]",     "G1")   #1
        if (j3 >= 1):                                  
            design.assign_pkg_pin("GPIO_J3[1]",     "F1")
        if (j3 >= 2):                                  
            design.assign_pkg_pin("GPIO_J3[2]",     "E2")   #2
        if (j3 >= 3):                                  
            design.assign_pkg_pin("GPIO_J3[3]",     "E1")
        if (j3 >= 4):                                  
            design.assign_pkg_pin("GPIO_J3[4]",     "C2")   #3
        if (j3 >= 5):                                  
            design.assign_pkg_pin("GPIO_J3[5]",     "D2")
        if (j3 >= 6):                                  
            design.assign_pkg_pin("GPIO_J3[6]",     "E3")   #4
        if (j3 >= 7):                                  
            design.assign_pkg_pin("GPIO_J3[7]",     "D3")
        if (j3 >= 8):
            design.assign_pkg_pin("GPIO_J3[8]",     "G3")
    elif (mode == 'hbridge'):
        design.assign_pkg_pin("PMOD_DIR[0]",    "G1")
        design.assign_pkg_pin("PMOD_EN[0]",     "F1")
        design.assign_pkg_pin("PMOD_SA[0]",     "E2")
        design.assign_pkg_pin("PMOD_SB[0]",     "E1")
        design.assign_pkg_pin("PMOD_DIR[1]",    "C2")
        design.assign_pkg_pin("PMOD_EN[1]",     "D2")
        design.assign_pkg_pin("PMOD_SA[1]",     "E3")
        design.assign_pkg_pin("PMOD_SB[1]",     "D3")
    else:
        if (j3 >= 0):
            design.assign_pkg_pin("GPIO_J3[0]",     "F1")
        if (j3 >= 1):
            design.assign_pkg_pin("GPIO_J3[1]",     "E1")
        if (j3 >= 2):
            design.assign_pkg_pin("GPIO_J3[2]",     "D2")
        if (j3 >= 3):
            design.assign_pkg_pin("GPIO_J3[3]",     "D3")
        if (j3 >= 4):
            design.assign_pkg_pin("GPIO_J3[4]",     "G3")
        if (mode == 'spi'):
            design.assign_pkg_pin("PMOD_CS",        "G1")
            design.assign_pkg_pin("PMOD_MOSI",      "E2")
            design.assign_pkg_pin("PMOD_MISO",      "C2")
            design.assign_pkg_pin("PMOD_SCK",       "E3")
        elif (mode == 'uart'):
            design.assign_pkg_pin("PMOD_CTS",       "G1")
            design.assign_pkg_pin("PMOD_TXD",       "E2")
            design.assign_pkg_pin("PMOD_RXO",       "C2")
            design.assign_pkg_pin("PMOD_RTS",       "E3")
        elif (mode == 'i2c'):
            design.assign_pkg_pin("PMOD_SCL",       "C2")
            design.assign_pkg_pin("PMOD_DA",        "E3")
        elif (mode == 'i2s'):
            design.assign_pkg_pin("PMOD_LRCLK",     "G1")
            design.assign_pkg_pin("PMOD_DACD",      "E2")
            design.assign_pkg_pin("PMOD_ADCD",      "C2")
            design.assign_pkg_pin("PMOD_BCLK",      "E3")
    
    # Check design, generate constraints and reports
    try:
        design.generate(enable_bitstream=True)
    except APIExcp.PTDsgCheckException as excp:
        print("Design check fails : {} Msg={}".format(excp.get_msg_level(), excp.get_msg()))
        sys.exit(1)
    except APIExcp.PTDsgGenConstException as excp:
        print("Fail to generate constraint : {} Msg={}".format(excp.get_msg_level(), excp.get_msg()))
        sys.exit(1)
    except APIExcp.PTDsgGenReportException as excp:
        print("Fail to generate report : {} Msg={}".format(excp.get_msg_level(), excp.get_msg()))
        sys.exit(1)
    
    # Save the configured periphery design
    design.save()
