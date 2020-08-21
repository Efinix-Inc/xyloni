#include <stdint.h>
#include <stdio.h>

#include "bsp.h"
#include "spi.h"
#include "spiDemo.h"

#define StartAddress 0x380000	//userBinary location

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

void WaitBusy(void)
{
	u8 out;
	u16 timeout=0;

	while(1)
	{
		bsp_uDelay(1*1000);

		spi_select(SPI, 0);
		spi_write(SPI, 0x05);	//Write Enable
		out = spi_read(SPI);
		spi_diselect(SPI, 0);

		if((out & 0x01) ==0x00)
			return;

		timeout++;
		if(timeout >=400)		//sector erase max=400ms
		{
			bsp_putString("Time out\n\r");
			return;
		}
	}
}

void WriteEnableLatch(void)
{
	spi_select(SPI, 0);
	spi_write(SPI, 0x06);	//Write Enable latch
	spi_diselect(SPI, 0);
}

void GlobalLock(void)
{
	WriteEnableLatch();
	spi_select(SPI, 0);
	spi_write(SPI, 0x7E);	//Global lock
	spi_diselect(SPI, 0);
}

void GlobalUnlock(void)
{
	WriteEnableLatch();
	spi_select(SPI, 0);
	spi_write(SPI, 0x98);	//Global unlock
	spi_diselect(SPI, 0);
}

void SectorErase(u32 Addr)
{
	WriteEnableLatch();

	spi_select(SPI, 0);		//Erase Sector
	spi_write(SPI, 0x20);
	spi_write(SPI, (Addr>>16)&0xFF);
	spi_write(SPI, (Addr>>8)&0xFF);
	spi_write(SPI, Addr&0xFF);
	spi_diselect(SPI, 0);

	WaitBusy();
}

void main() {
    init();
    int i,len;
    u8 out;

    len =256;	//page write

    bsp_putString("Write Flash Start\n\r");

    GlobalUnlock();

	SectorErase(StartAddress);

	WriteEnableLatch();

    spi_select(SPI, 0);
	spi_write(SPI, 0x02);
	spi_write(SPI, (StartAddress>>16)&0xFF);
	spi_write(SPI, (StartAddress>>8)&0xFF);
	spi_write(SPI, StartAddress&0xFF);

    for(i=0;i<len;i++)			//Write sequential number for testing
    {
    	spi_write(SPI, i&0xFF);
    	bsp_putString("WR Addr ");
		print_hex(StartAddress+i,8);
		bsp_putString(" : =");
		print_hex(i&0xFF,2);
		bsp_putString("\n\r");
    }

    spi_diselect(SPI, 0);
    WaitBusy();	//wait for page progarm done

    GlobalLock();

    bsp_putString("Write Flash End\n\r");

    while(1){}
}
