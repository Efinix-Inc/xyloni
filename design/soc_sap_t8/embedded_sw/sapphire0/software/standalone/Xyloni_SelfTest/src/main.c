#include <stdint.h>

#include "bsp.h"
#include "gpio.h"
#include "uart.h"
#include "spi.h"
#include "spiDemo.h"
#include "sd_ctrl.h"


#define LED_MASK	0x0F

//#define BTN1		0x4000
#define BTN2		0x8000

void main() {

	int n;
	u8 buf[16];
	u8 invert=0;
	u16 mask;

    bsp_init();
    spi_init();


    gpio_setOutputEnable(SYSTEM_GPIO_0_IO_CTRL, 0xFFFF);
    gpio_setOutput(SYSTEM_GPIO_0_IO_CTRL,0);
    gpio_setOutputEnable(SYSTEM_GPIO_0_IO_CTRL, 0xF);

    bsp_putString("==========Xyloni Test Menu===========\n\n\r");

    bsp_putString("---Press BTN2 On Board - INVERT LED BLINK\n\r");
    bsp_putString("---Press KeyBoard 'Enter' Key - READ SD CARD INFO\n\r");

    while(1){

    	mask=gpio_getInput(SYSTEM_GPIO_0_IO_CTRL);

    	if((mask & BTN2)==0){
    		invert = (~invert) & 0x01;
    	}

    	 while(uart_readOccupancy(BSP_UART_TERMINAL)){
    	            uart_write(BSP_UART_TERMINAL, uart_read(BSP_UART_TERMINAL));
    	            Spi_Read_SDCard_Info();
    	 }


    	for(n=0;n<4;n++)
    	{
    		if(invert){
    			gpio_setOutput(SYSTEM_GPIO_0_IO_CTRL,0x1<<n);}
    		else{
    			gpio_setOutput(SYSTEM_GPIO_0_IO_CTRL,(~(0x1<<n)) & LED_MASK);}

        	bsp_uDelay(100*1000);
    	}
    }
}

