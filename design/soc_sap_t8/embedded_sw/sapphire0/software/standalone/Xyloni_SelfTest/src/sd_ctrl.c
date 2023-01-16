#include "spiDemo.h"
#include "spi.h"
#include "bsp.h"
#include "sd_ctrl.h"

void print_dec(int val)
{
    char buffer[32];
    char *p = buffer;
    if (val < 0) {
    	bsp_putChar('-');
        val = -val;
    }
    while (val || p == buffer) {
        *(p++) = '0' + val % 10;
        val = val / 10;
    }
    while (p != buffer)
    	bsp_putChar(*(--p));
}

void spi_init(void){
    //SPI init
    Spi_Config spiA;
    spiA.cpol = 0;
    spiA.cpha = 0;
    spiA.mode = 0; //Assume full duplex (standard SPI)
    spiA.clkDivider = 40;
    spiA.ssSetup = 5;
    spiA.ssHold = 5;
    spiA.ssDisable = 5;
    spi_applyConfig(SPI1, &spiA);
}

int Spi_WaitResponse(uint8_t wait_cnt, uint8_t resp_data)
{
	uint8_t resp = 0;
	uint8_t n,r;

	for(n=0;n<wait_cnt;n++)
	{
		resp=spi_read(SPI1);

		if((resp&0xFF) ==resp_data)
		{
			return resp;
		}
	}

	return -1;
}

uint8_t Spi_WriteSD_Inital_Delay(void)
{
	int n;

	spi_select(SPI1, 0);

	bsp_uDelay(100);

	for(n=0;n<10;n++)
		spi_write(SPI1, 0xFF);

	spi_diselect(SPI1, 0);
	return 1;
}


uint8_t Spi_WriteSD_Cmd(u8 cmd, u32 arg, u8 crc, u8 disel ,u8 resp_data)
{

	u8 match=0;

	spi_write(SPI1, 0xFF);

	spi_select(SPI1, 0);
	spi_write(SPI1, cmd | 0x40);
	spi_write(SPI1, arg >> 24);
	spi_write(SPI1, arg >> 16);
	spi_write(SPI1, arg >> 8);
	spi_write(SPI1, arg);
	spi_write(SPI1, crc);

	if(Spi_WaitResponse(16,resp_data)==resp_data)
			match =1;

	if(disel)
	{
		spi_diselect(SPI1, 0);
		spi_write(SPI1, 0xFF);
	}

	return match;
}
uint8_t Spi_Read_CID(void)
{
	u8 buf_cid[16],n;

	//bsp_putString("CMD10\n\r");
	Spi_WriteSD_Cmd(CMD10,0x00,0xFF,0,0xFE);

	for(n=0;n<16;n++)
		buf_cid[n]=spi_read(SPI1);

	bsp_putString("Manufacturer ID \t: ");

	print_dec(buf_cid[0]);

	spi_diselect(SPI1, 0);

	bsp_putString("\n\r");
}
uint8_t Spi_Read_CSD(void)
{
	uint8_t buf[16],n;
	uint8_t GRP,format,speed;
	u32 cap;

    //bsp_putString("CMD9\n\r");
	Spi_WriteSD_Cmd(CMD9,0x00,0x01,0,0xFE);

	for(n=0;n<16;n++)
		buf[n]=spi_read(SPI1);

	spi_diselect(SPI1, 0);

	GRP=(buf[14]>>7);
	format=(buf[14]>>2)&0x03;
	cap =(((buf[7]&0x3F)<<16)|(buf[8]<<8)|buf[9])>>2;
	speed=buf[3]&0x03;

	bsp_putString("Type \t\t\t: ");

		if(GRP==0){
			if(format ==0){
				bsp_putString("Hard disk file system\n\r");}
			else if(format ==1){
				bsp_putString("DOS FAT  with boot sector only\n\r");}
			else if(format ==2){
					bsp_putString("Universal File Format\n\r");}
			else{
				bsp_putString("Unknown\n\r");}
		}

	bsp_putString("TRAN_SPEED \t\t: ");
	if(speed==0)	{bsp_putString("100kbit/s \n\r");}
	else if(speed==1)	{bsp_putString("1Mbit/s \n\r");}
	else if(speed==2)	{bsp_putString("10Mbit/s \n\r");}
	else if(speed==3)	{bsp_putString("100Mbit/s \n\r");}
	else				{bsp_putString("unknown \n\r");}

	bsp_putString("SD CARD Size \t\t: ");	print_dec(cap);	bsp_putString(" MByte\n\r");


//	bsp_putString("\n\rCSD_STRUCTURE : \t0x");	print_hex(buf[0]>>6,2);					bsp_putString("\n\r");
//	bsp_putString("Reserved : \t0x");			print_hex(buf[0]&0x3F,2);				bsp_putString("\n\r");
//	bsp_putString("TAAC : \t0x");				print_hex(buf[1]&0xFF,2);				bsp_putString("\n\r");
//	bsp_putString("NSAC : \t0x");				print_hex(buf[2]&0xFF,2);				bsp_putString("\n\r");
	//bsp_putString("TRAN_SPEED : \t0x");			print_hex(buf[3]&0xFF,2);				bsp_putString("\n\r");
//	bsp_putString("CCC : \t0x");				print_hex((buf[4]<<4)|(buf[5]>>4),4);	bsp_putString("\n\r");
//	bsp_putString("READ_BL_EN : \t0x");			print_hex(buf[5]&0x0F,2);				bsp_putString("\n\r");
//	bsp_putString("READ_BL_PARTIAL : \t0x");	print_hex(buf[6]>>7,2);					bsp_putString("\n\r");
//	bsp_putString("WRITE_BLK_MISALIGN : \t0x");	print_hex((buf[6]>>6)&0x1 ,2);			bsp_putString("\n\r");
//	bsp_putString("READ_BLK_MISALIGN : \t0x");	print_hex((buf[6]>>5)&0x1 ,2);			bsp_putString("\n\r");
//	bsp_putString("DSR_IMP : \t0x");			print_hex((buf[6]>>4)&0x1 ,2);			bsp_putString("\n\r");
//	bsp_putString("Reserved : \t0x");			print_hex((buf[6]<<2)|buf[7]>>6,2);		bsp_putString("\n\r");
//	bsp_putString("C_SIZE : \t0x");				print_hex((((buf[7]&0x3F)<<16)|(buf[8]<<8)|buf[9]) ,8);		bsp_putString("\n\r");
//	bsp_putString("Reserved : \t0x");			print_hex(buf[10]>>7,2);									bsp_putString("\n\r");
//	bsp_putString("ERASE_BLK_EN : \t0x");		print_hex(((buf[10]>>6)&0x01) ,2);							bsp_putString("\n\r");
//	bsp_putString("SECTOR_SIZE : \t0x");		print_hex((((buf[10]&0x3F)<<1) |buf[11] >>7) ,2);			bsp_putString("\n\r");

//	bsp_putString("WP_GRP_SIZE : \t0x");		print_hex((buf[11]&0x7F) ,2);						bsp_putString("\n\r");
//	bsp_putString("WP_GRP_ENABLE : \t0x");		print_hex((buf[12]>>7) ,2);							bsp_putString("\n\r");
	//bsp_putString("Reserved : \t0x");			print_hex(((buf[12]>>5) &0x3) ,2);					bsp_putString("\n\r");
//	bsp_putString("R2W_FACTOR : \t0x");			print_hex((buf[12]>>2)&0x7 ,2);						bsp_putString("\n\r");
//	bsp_putString("WRITE_BL_LEN : \t0x");		print_hex(((buf[12]&0x3)<<2)|(buf[13]>>6) ,2);		bsp_putString("\n\r");
//	bsp_putString("WRITE_BL_PARTIAL : \t0x");	print_hex((buf[13]>>5)&0x01 ,2);					bsp_putString("\n\r");
//	bsp_putString("Reserved : \t0x");			print_hex((buf[13]&0x1F) ,2);						bsp_putString("\n\r");
	//bsp_putString("FILE_FORMAT_GRP : \t0x");	print_hex((buf[14]>>7) ,2);							bsp_putString("\n\r");
//	bsp_putString("COPY : \t0x");				print_hex((buf[14]>>6)&0x01 ,2);					bsp_putString("\n\r");
//	bsp_putString("PERM_WRITE_PROTECT : \t0x");	print_hex((buf[14]>>5)&0x01 ,2);					bsp_putString("\n\r");
//	bsp_putString("TMP_WRITE_PROTECT : \t0x");	print_hex((buf[14]>>4)&0x01 ,2);					bsp_putString("\n\r");
	//bsp_putString("FILE_FORMAT : \t0x");		print_hex((buf[14]>>2)&0x03 ,2);					bsp_putString("\n\r");
	//bsp_putString("Reserved : \t0x");			print_hex((buf[14])&0x03 ,2);						bsp_putString("\n\r");
//	bsp_putString("CRC : \t0x");				print_hex((buf[15])>>1 ,2);							bsp_putString("\n\r");

	return 1;
}

uint8_t Spi_Read_IDLE_STAT(void)
{
	//bsp_putString("CMD0 -- ");

	if(Spi_WriteSD_Cmd(CMD0,0,0x95,1,0x01)){
		 //bsp_putString("Response Match!!\n\r");
		return 1;}
	else{
		 bsp_putString("Response Fail!! NO SD Card Detect\n\r");
		return 0;}
}

uint8_t Spi_Read_CMD8(void)
{
	uint8_t buf[4];

	//bsp_putString("CMD8 -- ");

	if(Spi_WriteSD_Cmd(CMD8,0x1AA,0x87,0,0x01)){
	//	bsp_putString("Response Match!!\n\r");
		}
	else{
		bsp_putString("Fail! Support SD 2.0 only\n\r");
		return 0;
		}

	buf[0]=spi_read(SPI1);
	buf[1]=spi_read(SPI1);
	buf[2]=spi_read(SPI1);
	buf[3]=spi_read(SPI1);

	spi_diselect(SPI1, 0);

	//bsp_putString("Check Card Support 2.7v to 3.6v --");

	if(buf[2] == 0x01){
		if(buf[3] == 0xAA){
	//		bsp_putString(" Done\n\r");
			return 1;
		}
	}

	//bsp_putString(" Fail\n\r");
	return 0;
}

uint8_t Spi_poll_SD_APP_OP_COND(void)
{
	uint8_t n;

//	bsp_putString("START POLLING SD_APP_OP_COND ACMD41 ");

	for(n=0;n<10;n++)
	{
		Spi_WriteSD_Cmd(CMD55,0,0X01,1,1);

		if(Spi_WriteSD_Cmd(CMD41,0x40000000,0X01,0,0)){
		//	bsp_putString("Done!!\n\r");
			return 1;			}
		else{
			//bsp_putString(".");
			}

		bsp_uDelay(50000);
	}
	return 0;
}

void Spi_Read_SDCard_Info(void)
{
	Spi_WriteSD_Inital_Delay();

	if(Spi_Read_IDLE_STAT()){
		if(Spi_Read_CMD8()){
			if(Spi_poll_SD_APP_OP_COND()){
				//bsp_putString("SD Initial Done!\n\n\r");
				bsp_putString("\n\r========SD Card Info=======\n\n\r");
				Spi_Read_CID();

			}
			if(Spi_poll_SD_APP_OP_COND()){
				Spi_Read_CSD();
			}
		}
	}
}
