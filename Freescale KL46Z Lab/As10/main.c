#include "UART.h"

int main(void)
{
	//MCGFLLCLK = 48MHz (FEI mode), set in system_MKL46Z4.c
	//format baurate: 115200, data bit: 8, parity: none, Stop bits: 1, Flow Control: None
	Init_UART();
	
	printf("\n\rHello World!\n"); //print to terminal use uart

	while(1){
	}
}