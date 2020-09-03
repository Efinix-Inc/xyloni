#include <stdint.h>

#include "bsp.h"
#include "machineTimer.h"
#include "riscv.h"
#include "plic.h"
#include "timerAndGpioInterruptDemo.h"
#include "apb3_cl.h"

#define UART_A SYSTEM_UART_0_IO_APB

void init();
void main();
void trap();
void crash();
void trap_entry();
void userInterrupt();


void main() {
	struct example_apb3_ctrl_reg cfg={0};
	init();

	uart_writeStr(UART_A, "User Interrupt Demo, waiting for user interrupt...\n\r");
	bsp_uDelay(500000);
	cfg.exampleInterrupt = 1;
	example_register_write(&cfg);
	
	while(1); //Idle
}


void init(){
	//configure PLIC
	plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0); //cpu 0 accept all interrupts with priority above 0
	
	//enable SYSTEM_PLIC_USER_INTERRUPT_A_INTERRUPT rising edge interrupt
	plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_USER_INTERRUPT_A_INTERRUPT, 1);
	plic_set_priority(BSP_PLIC, SYSTEM_PLIC_USER_INTERRUPT_A_INTERRUPT, 1);
	
	//enable interrupts
	csr_write(mtvec, trap_entry); //Set the machine trap vector (../common/trap.S)
//	csr_set(mie, MIE_MTIE | MIE_MEIE); //Enable machine timer and external interrupts
	csr_set(mie, MIE_MEIE); //Enable machine timer and external interrupts
	csr_write(mstatus, MSTATUS_MPP | MSTATUS_MIE);
}

//Called by trap_entry on both exceptions and interrupts events
void trap(){
	int32_t mcause = csr_read(mcause);
	int32_t interrupt = mcause < 0;    //Interrupt if true, exception if false
	int32_t cause     = mcause & 0xF;
	if(interrupt){
		switch(cause){
		case CAUSE_MACHINE_EXTERNAL: userInterrupt(); break;
		default: crash(); break;
		}
	} else {
		crash();
	}
}

void userInterrupt(){
	struct example_apb3_ctrl_reg cfg={0};
	uint32_t claim;
	//While there is pending interrupts
	while(claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0)){
		switch(claim){
		case SYSTEM_PLIC_USER_INTERRUPT_A_INTERRUPT:

			uart_writeStr(UART_A, "Entered User Interrupt Routine\n\r");
			uart_writeStr(UART_A, "Turn off Interrupt Signal\n\r");
			cfg.exampleInterrupt = 0;
			example_register_write(&cfg);
			uart_writeStr(UART_A, "Leaving User Interrupt Routine\n\r");
			break;
		default: crash(); break;
		}
		plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); //unmask the claimed interrupt
	}
}


//Used on unexpected trap/interrupt codes
void crash(){
	uart_writeStr(UART_A, "\n*** CRASH ***\n");
	while(1);
}

