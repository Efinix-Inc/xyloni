////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2022 Efinix Inc. All rights reserved.
//
// This   document  contains  proprietary information  which   is
// protected by  copyright. All rights  are reserved.  This notice
// refers to original work by Efinix, Inc. which may be derivitive
// of other work distributed under license of the authors.  In the
// case of derivative work, nothing in this notice overrides the
// original author's license agreement.  Where applicable, the
// original license agreement is included in it's original
// unmodified form immediately below this header.
//
// WARRANTY DISCLAIMER.
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
//
// LIMITATION OF LIABILITY.
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT
//     APPLY TO LICENSEE.
//
////////////////////////////////////////////////////////////////////////////////

#pragma once

//#include <stdarg.h>
//#include <stdint.h>
#include "soc.h"
#include "uart.h"
#include "clint.h"
#include "io.h"
#include "type.h"

#define BSP_PLIC SYSTEM_PLIC_CTRL
#define BSP_PLIC_CPU_0 SYSTEM_PLIC_SYSTEM_CORES_0_EXTERNAL_INTERRUPT
#define BSP_CLINT SYSTEM_CLINT_CTRL
#define BSP_CLINT_HZ SYSTEM_CLINT_HZ
#define BSP_UART_TERMINAL SYSTEM_UART_0_IO_CTRL

//backward compability 
#define BSP_MACHINE_TIMER SYSTEM_CLINT_CTRL
#define BSP_MACHINE_TIMER_HZ SYSTEM_CLINT_HZ 
#define machineTimer_setCmp(p, cmp) clint_setCmp(p, cmp, 0);
#define machineTimer_getTime(p) clint_getTime(p);
#define machineTimer_uDelay(usec, hz, reg) clint_uDelay(usec, hz, reg);

#define bsp_init() {}
#define bsp_putChar(c) uart_write(BSP_UART_TERMINAL, c);
#define bsp_uDelay(usec) clint_uDelay(usec, SYSTEM_CLINT_HZ, SYSTEM_CLINT_CTRL);
#define bsp_putString(s) uart_writeStr(BSP_UART_TERMINAL, s);

// Freertos specifics
#define configMTIME_BASE_ADDRESS        (BSP_CLINT + 0xBFF8)
#define configMTIMECMP_BASE_ADDRESS     (BSP_CLINT + 0x4000)
#define configCPU_CLOCK_HZ              ( ( uint32_t ) ( BSP_CLINT_HZ ) )
#define BSP_LED_GPIO                    SYSTEM_GPIO_0_IO_CTRL
#define BSP_LED_MASK                    0xf

// Printf related
// There are 3 supported printf type
// 1. bsp_print, bsp_printHex, bsp_printHexDigit, bsp_printHexByte, bsp_printReg, bsp_putString and bsp_putChar. Not recommended for new designs.
// 2. bsp_printf - supports only char, string, decimal and hexadecimal specifier. Also provides print_float and print_dec functions. Uses the medium RAM resources.
// 3. bsp_printf_full - full supports for printf including flags and precisions. Uses the most RAM resources.
#define ENABLE_BSP_PRINT                    1 // backward compatible printf //Default: Enable
#define ENABLE_BSP_PRINTF                   1 // small unified printf       //Default: Enable
#define ENABLE_BSP_PRINTF_FULL              0 // full unified printf        //Default: Disable

//Printf Supports Enable
#define ENABLE_FLOATING_POINT_SUPPORT       SYSTEM_CORES_0_FPU // Enable the supports for floating point printing. Only applicable for BSP_PRINTF and BSP_PRINTF_FULL    // Default: Disable
#define ENABLE_FP_EXPONENTIAL_SUPPORT       0 // Supports Floating point print with exponential. Only applicable for BSP_PRINTF_FULL                    // Default: Disable
#define ENABLE_PTRDIFF_SUPPORT              0 // Supports pointer difference                                                                            // Default: Disable
#define ENABLE_LONG_LONG_SUPPORT            0 // Supports long long data type                                                                           // Default: Disable

// use bsp_printf_full as bsp_printf
#define ENABLE_BRIDGE_FULL_TO_LITE          1 // If this is enabled, bsp_printf_full can be called with bsp_printf. Enabling both ENABLE_BSP_PRINTF and ENABLE_BSP_PRINTF_FULL, bsp_printf_full will be remained as bsp_printf_full. Default: Enable
#define ENABLE_PRINTF_WARNING               1 // Print warning when the specifier not supported. Default: Enable

    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
            uart_write(BSP_UART_TERMINAL, "0123456789ABCDEF"[(val >> i) % 16]);
        }
    }

    static void bsp_printHex_lower(uint32_t val)
        {
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
                uart_write(BSP_UART_TERMINAL, "0123456789abcdef"[(val >> i) % 16]);
            }
        }


#if (ENABLE_BSP_PRINT)
    static void bsp_print(uint8_t * data) {
        uart_writeStr(BSP_UART_TERMINAL, (const char*)data);
        uart_write(BSP_UART_TERMINAL, '\n');
        uart_write(BSP_UART_TERMINAL, '\r');
    }

    static void bsp_printHexDigit(uint8_t digit){
        uart_write(BSP_UART_TERMINAL, digit < 10 ? '0' + digit : 'A' + digit - 10);
    }

    static void bsp_printHexByte(uint8_t byte){
        bsp_printHexDigit(byte >> 4);
        bsp_printHexDigit(byte & 0x0F);
    }

    static void bsp_printReg(char* s, u32 data)
    {
        bsp_putString(s);
        bsp_printHex(data);
    }

#endif

#if (ENABLE_BSP_PRINTF)
    #include "print.h"
#endif //#if (ENABLE_BSP_PRINTF)

#if (ENABLE_BSP_PRINTF_FULL)
#if (!ENABLE_FLOATING_POINT_SUPPORT)
    #define PRINTF_DISABLE_SUPPORT_FLOAT 1
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
#if (!ENABLE_FP_EXPONENTIAL_SUPPORT)
    #define PRINTF_DISABLE_SUPPORT_EXPONENTIAL 1
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
#if (!ENABLE_PTRDIFF_SUPPORT)
    #define PRINTF_DISABLE_SUPPORT_PTRDIFF_T 1
#endif //#if (ENABLE_PTRDIFF_SUPPORT)
#if (!ENABLE_LONG_LONG_SUPPORT)
    #define PRINTF_DISABLE_SUPPORT_LONG_LONG 1
#endif //#if (ENABLE_LONG_LONG_SUPPORT)
#if(ENABLE_BRIDGE_FULL_TO_LITE)
#if (!ENABLE_BSP_PRINTF)
    #define bsp_printf bsp_printf_full
#endif // #if (!ENABLE_BSP_PRINTF)
#endif //#if(ENABLE_BRIDGE_EFX_TO_BSP)
#include "print_full.h"
#endif //#if (ENABLE_BSP_PRINTF_FULL)


