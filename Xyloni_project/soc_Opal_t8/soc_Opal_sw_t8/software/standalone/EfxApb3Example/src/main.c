#include <stdint.h>

#include "bsp.h"
#include "gpio.h"
#include "uart.h"
#include "apb3_cl.h"

#ifdef SPINAL_SIM
#define LOOP_UDELAY 100
#else
#define LOOP_UDELAY 100000
#endif

void main() {
    struct example_apb3_ctrl_reg cfg={0};
    bsp_init();

    gpio_setOutputEnable(BSP_LED_GPIO, BSP_LED_MASK);
    gpio_setOutput(BSP_LED_GPIO, 0x00000000);

    uart_writeStr(BSP_UART_TERMINAL, "Opal Soc T8: Example Design\n\r");
    cfg.exampleLED1 = 1;
    cfg.exampleLED2 = 0; 
    example_register_write(&cfg);

    while(1){
        gpio_setOutput(BSP_LED_GPIO, gpio_getOutput(BSP_LED_GPIO) ^ BSP_LED_MASK);
    	cfg.exampleLED1 = ~cfg.exampleLED1;
    	cfg.exampleLED2 = ~cfg.exampleLED2; 
    	example_register_write(&cfg);
        bsp_uDelay(LOOP_UDELAY);
    }
}

