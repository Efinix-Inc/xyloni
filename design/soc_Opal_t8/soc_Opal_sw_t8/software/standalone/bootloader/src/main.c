#include "type.h"

#include "bsp.h"
#include "bootloaderConfig.h"

void main() {
	unsigned char n,m;

    bsp_init();
/*
    gpio_setOutputEnable(BSP_LED_GPIO, 0xF);
    gpio_setOutput(BSP_LED_GPIO, 0x00000000);

   while(1)
    {
	   bsp_putString("Hi Xyloni\n\r");

		for(n=0;n<4;n++)
		{
			gpio_setOutput(BSP_LED_GPIO,1<<n);
			bsp_uDelay(100*1000);
		}
    }
*/
    bspMain();
}

