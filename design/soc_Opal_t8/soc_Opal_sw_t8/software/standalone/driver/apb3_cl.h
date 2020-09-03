#ifndef APB3_CL_H
#define APB3_CL_H

#include "bsp.h"

#define EXAMPLE_APB3_SLV		IO_APB_SLAVE_0_APB
#define EXAMPLE_APB3_SLV_REG0_OFFSET 	0
#define EXAMPLE_APB3_SLV_REG1_OFFSET 	4

#define EXAMPLE_APB3_REGW(addr, offset, data) \
	write_u32(data, addr+offset)

#define EXAMPLE_APB3_REGR(addr, offset) \
	read_u32(addr+offset)

struct example_apb3_ctrl_reg {
	unsigned int exampleLED1        :1;
	unsigned int exampleLED2 	:1;
	unsigned int exampleInterrupt 	:1;
	unsigned int exampleReserved	:29;

}example_apb3_ctrl_reg;

u32 example_register_read()
{
	u32 rdata;
	rdata = EXAMPLE_APB3_REGR(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG0_OFFSET);
	return rdata;
}

void example_register_write(struct example_apb3_ctrl_reg *cfg)
{
	EXAMPLE_APB3_REGW(EXAMPLE_APB3_SLV, EXAMPLE_APB3_SLV_REG0_OFFSET, *(int *)cfg );
}


void example_register_write(struct example_apb3_ctrl_reg *cfg);
u32 example_register_read();

#endif
