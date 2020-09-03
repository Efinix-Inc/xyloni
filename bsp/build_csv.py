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
    parser = argparse.ArgumentParser(description='BSP build script with csv')
    parser.add_argument('device', help='Trion device, e.g. T8F81, T20F169, T120F324')
    parser.add_argument('input_file', help='Pin assignment in csv')
    parser.add_argument('-p', '--project', default='helloworld', help='Project name')
    parser.add_argument('-v', '--verbose', default='', help='Set to True to see detial messages from API engine')
    
    # run parser
    args = parser.parse_args()
    return args

# script entry point
if __name__=='__main__':
    args = parse_cmdline()
    input_file = args.input_file
    if (os.path.exists(input_file)):
        csvf = open(input_file, 'r')
    else:
        raise ValueError('Pin assignment csv does not exist')
    
    pin_count = 0
    inst = []
    block = []
    inout = []
    resc = []
    inclk = []
    inreg = []
    outclk = []
    outreg = []
    slew = []
    dristr = []

    line = csvf.readline()
    line = csvf.readline()
    while (line != ''):
        tmp = line.split(',')
        tmp[-1] = tmp[-1].strip()
        
        inst.append(tmp[0]+tmp[1]+tmp[2]+tmp[3])
        block.append(tmp[4])
        inout.append(tmp[5])
        resc.append(tmp[6])
        inclk.append(tmp[7])
        inreg.append(tmp[8])
        outclk.append(tmp[9])
        outreg.append(tmp[10])
        slew.append(tmp[11])
        dristr.append(tmp[12])
        pin_count = pin_count+1
        line = csvf.readline()
    
    print(inst)
    print(block)
    print(inout)
    print(resc)
    print(inclk)
    print(outclk)

    is_verbose = bool(args.verbose)  # Set to True to see detail messages from API engine
    design = DesignAPI(is_verbose)
    device = DeviceAPI(is_verbose)
    
    # Create empty design
    device_name = args.device  # Matches Device name from Efinity's Project Editor
    project_name = args.project
    output_dir = "output"  # New pt_demo periphery design will be generated in this directory
    
    try:
        design.create(project_name, device_name, output_dir)
    except APIExcp.PTAPIException as excp:
        print("Fail to create design : {} Msg={}".format(excp.get_msg_level(), excp.get_msg()))
        sys.exit(1)
    
    for i in range(pin_count):
        # Create busses and GPIOs
        # JTAG only
#       design.create_block(inst[i], block[i])
#       design.set_property(inst[i], inout[i])
        
        if (inout[i] == 'INPUT'):
            if (block[i] == 'PLL_CLKIN'):
                design.create_pll_input_clock_gpio(inst[i])
            elif (block[i] == 'GCTRL'):
                design.create_global_control_gpio(inst[i])
            elif (block[i] == 'GPIO'):
                design.create_input_gpio(inst[i])
            else:
                raise ValueError('Incorrect connection type')
        elif (inout[i] == 'OUTPUT'):
            design.create_output_gpio(inst[i])
        elif (inout[i] == 'INOUT'):
            design.create_inout_gpio(inst[i])
        else:
            raise ValueError("Incorrect I/O")

        # Configure property
        if ((inout[i] == 'INPUT' or inout[i] == 'INOUT') and inclk[i] != ''):
            design.set_property(inst[i], 'IN_REG', 'REG')
            design.set_property(inst[i], 'IN_CLK_PIN', inclk[i])
        if ((inout[i] == 'OUTPUT' or inout[i] == 'INOUT') and outclk[i] != ''):
            design.set_property(inst[i], 'OUT_REG', 'REG')
            design.set_property(inst[i], 'OUT_CLK_PIN', outclk[i])
            if (inout[i] == 'INOUT'):
                design.set_property(inst[i], 'OE_REG', 'REG')
                design.set_property(inst[i], 'OE_CLK_PIN', outclk[i])
        # Pin assignment base on resource name
        # design.set_property(inst=inst[i], block_type='GPIO', prop_name='RESOURCE', prop_value=resc[i])
        # Not supported, use assign_resource()
        design.assign_resource(inst[i], resc[i])
    
    # Check design, generate constraints and reports
    try:
        design.generate(enable_bitstream=False)
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
    csvf.close()
