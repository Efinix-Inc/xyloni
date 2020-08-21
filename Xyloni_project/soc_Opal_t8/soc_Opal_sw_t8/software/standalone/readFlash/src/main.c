#include <stdint.h>

#include "bsp.h"
#include "spi.h"
#include "spiDemo.h"

#define StartAddress 	0xe0000		//User Binary Location
#define ReadSize	4*1024		//Read size

void init(){
    //SPI init
    Spi_Config spiA;
    spiA.cpol = 1;
    spiA.cpha = 1;
    spiA.mode = 0; //Assume full duplex (standard SPI)
    spiA.clkDivider = 10;
    spiA.ssSetup = 5;
    spiA.ssHold = 5;
    spiA.ssDisable = 5;
    spi_applyConfig(SPI, &spiA);
}

void print_hex(uint32_t val, uint32_t digits)
{
    for (int i = (4*digits)-4; i >= 0; i -= 4)
        uart_write(BSP_UART_TERMINAL, "0123456789ABCDEF"[(val >> i) % 16]);
}

void main() {
    init();
    int i,len;

    len = ReadSize;

    bsp_putString("Read Flash Start\n\r");

    for(i=StartAddress;i<StartAddress+len;i++)
    {
		spi_select(SPI, 0);
		spi_write(SPI, 0x03);
		spi_write(SPI, (i>>16)&0xFF);
		spi_write(SPI, (i>>8)&0xFF);
		spi_write(SPI, i&0xFF);
		uint8_t out = spi_read(SPI);
		spi_diselect(SPI, 0);


		bsp_putString("Addr ");
		print_hex(i,8);
		bsp_putString(" : =");
		print_hex(out,2);
		bsp_putString("\n\r");
    }

    bsp_putString("Read Flash End\n\r");

    while(1){}
}
