#pragma once

#include "bsp.h"
#include "io.h"
#include "spiFlash.h"

#define SPI SYSTEM_SPI_0_IO_APB
#define SPI_CS 0

#define USER_SOFTWARE_MEMORY 0xF9000400
#define USER_SOFTWARE_FLASH  0x000E0000
//#define USER_SOFTWARE_FLASH  0x00380000
#define USER_SOFTWARE_SIZE   0x00000C00


void bspMain() {
#ifndef SPINAL_SIM
	spiFlash_init(SPI, SPI_CS);
	spiFlash_wake(SPI, SPI_CS);
	spiFlash_f2m(SPI, SPI_CS, USER_SOFTWARE_FLASH, USER_SOFTWARE_MEMORY, USER_SOFTWARE_SIZE);
#endif

	void (*userMain)() = (void (*)())USER_SOFTWARE_MEMORY;
	userMain();
}
