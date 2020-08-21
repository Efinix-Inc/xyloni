/*
 * sd_ctrl.h
 *
 *  Created on: Aug 1, 2020
 *      Author: shchung
 */

#ifndef SRC_SD_CTRL_H_
#define SRC_SD_CTRL_H_

#define RESPONSE_DONE	1
#define	RESPONSE_FAIL	0


// SD type
#define SD_TYPE_ERR     0X00
#define SD_TYPE_MMC     0X01
#define SD_TYPE_V1      0X02
#define SD_TYPE_V2      0X04
#define SD_TYPE_V2HC    0X06
// SD CMD
#define CMD0    0
#define CMD1    1
#define CMD8    8
#define CMD9    9
#define CMD10   10
#define CMD12   12
#define CMD16   16
#define CMD17   17
#define CMD18   18
#define CMD23   23
#define CMD24   24
#define CMD25   25
#define CMD41   41
#define CMD55   55
#define CMD58   58
#define CMD59   59

void spi_init(void);
void print_hex(uint32_t val, uint32_t digits);
uint8_t Spi_WriteSD_Inital_Delay(void);
uint8_t Spi_WriteSD_Cmd(u8 cmd, u32 arg, u8 crc, u8 disel ,u8 resp_data);
uint8_t Spi_Read_CSD(void);
uint8_t Spi_Read_IDLE_STAT(void);
uint8_t Spi_Read_CMD8(void);
uint8_t Spi_poll_SD_APP_OP_COND(void);
void Spi_Read_SDCard_Info(void);
void print_dec(int val);

#endif /* SRC_SD_CTRL_H_ */
