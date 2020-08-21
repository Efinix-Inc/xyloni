#include <stdint.h>

#include "bsp.h"
#include "i2c.h"
#include "i2cDemo.h" //BSP


/*
 * This demo use the I2C peripheral to communicate with a MCP4725 (DAC)
 * It assume it is the single master on the bus, and send frame in a blocking manner.
 */

void init();
void main();


void init(){
    //I2C init
    I2c_Config i2c;
    i2c.samplingClockDivider = 3;
    i2c.timeout = I2C_CTRL_HZ/1000;    //1 ms;
    i2c.tsuDat  = I2C_CTRL_HZ/2000000; //500 ns

    i2c.tLow  = I2C_CTRL_HZ/800000;  //1.25 us
    i2c.tHigh = I2C_CTRL_HZ/800000; //1.25 us
    i2c.tBuf  = I2C_CTRL_HZ/400000;  //2.5 us

    i2c_applyConfig(I2C_CTRL, &i2c);
}

void print_hex_digit(uint8_t digit){
    uart_write(BSP_UART_TERMINAL, digit < 10 ? '0' + digit : 'A' + digit - 10);
}


void print_hex_byte(uint8_t byte){
    print_hex_digit(byte >> 4);
    print_hex_digit(byte & 0x0F);
}

void assert(int cond){
    if(!cond) {
        uart_writeStr(BSP_UART_TERMINAL, "Assert failure\n\r");
        while(1);
    }
}

uint32_t phase = 0;
void main() {
    init();

    uart_writeStr(BSP_UART_TERMINAL, "Start\n\r");


    while(1){
        uint32_t ready;
        uint32_t dacValue = 0;

        //Read the status of the DAC
        i2c_masterStartBlocking(I2C_CTRL);
        i2c_txByte(I2C_CTRL, 0xC1); i2c_txNackBlocking(I2C_CTRL);
        i2c_txByte(I2C_CTRL, 0xFF); i2c_txAckBlocking(I2C_CTRL);
        ready = (i2c_rxData(I2C_CTRL) & 0x80) != 0;
        i2c_txByte(I2C_CTRL, 0xFF); i2c_txAckBlocking(I2C_CTRL);
        dacValue |= i2c_rxData(I2C_CTRL) << 4;
        i2c_txByte(I2C_CTRL, 0xFF); i2c_txNackBlocking(I2C_CTRL);
        dacValue |= i2c_rxData(I2C_CTRL) >> 4;
        i2c_masterStopBlocking(I2C_CTRL);

        //If not busy, write a new DAC value
        if(ready){
            dacValue += 1;
            dacValue &= 0xFFF;
            i2c_masterStartBlocking(I2C_CTRL);
            i2c_txByte(I2C_CTRL, 0xC0); i2c_txNackBlocking(I2C_CTRL);
            i2c_txByte(I2C_CTRL, 0x00 | ((dacValue >> 8) & 0x0F)); i2c_txNackBlocking(I2C_CTRL);
            i2c_txByte(I2C_CTRL, 0x00 | ((dacValue >> 0) & 0xFF)); i2c_txNackBlocking(I2C_CTRL);
            i2c_masterStopBlocking(I2C_CTRL);
            for(uint32_t i = 0;i < 1000;i++)  asm("nop");
        }
    }
}





