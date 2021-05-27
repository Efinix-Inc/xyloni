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

    int gpio_read;
    int led_check;
    
    struct example_apb3_ctrl_reg cfg={0};
    bsp_init();

    gpio_setOutputEnable(BSP_LED_GPIO, BSP_LED_MASK);
    gpio_setOutput(BSP_LED_GPIO, 0x00000000);

    uart_writeStr(BSP_UART_TERMINAL, "Opal Soc T8: Example Design\n\r");
    cfg.exampleLED1 = 1;                //please connect to LED2
    cfg.exampleLED2 = 0;                //please connect to LED3
    example_register_write(&cfg);
    
    gpio_read = gpio_getOutput(BSP_LED_GPIO);
    
    while(1){
        
        led_check = cfg.exampleLED1 & 0x01;
        led_check |= (cfg.exampleLED2 & 0x01) <<1;
        
        if((example_register_read() & 0x03) ==  led_check)
        {
            gpio_setOutput(BSP_LED_GPIO, gpio_read ^ BSP_LED_MASK);
            gpio_read = ~gpio_read;
        }
    	cfg.exampleLED1 = ~cfg.exampleLED1;
    	cfg.exampleLED2 = ~cfg.exampleLED2; 
    	example_register_write(&cfg);
        bsp_uDelay(LOOP_UDELAY);
    }
}

