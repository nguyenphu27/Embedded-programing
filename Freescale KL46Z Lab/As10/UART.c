#include "MKL46Z4.h"
#include <stdio.h>

void Init_UART(void){
	
	//enable clock port A
	SIM->SCGC5 |= (1UL << 9);
	
	//select pin PTA1, PTA2 for output UART0_RX, UART0_TX
  PORTA->PCR[1] |= PORT_PCR_MUX(0x2);
	PORTA->PCR[2] |= PORT_PCR_MUX(0x2); 
	
	//enable UART0 Clock Gate Control
	SIM->SCGC4 |= (1UL << 10);

	//select MCGFLLCLK for uart0 clock source
	SIM->SOPT2 |= SIM_SOPT2_UART0SRC(1);
	
	//format data
	//data bit: 8, parity: none, Stop bits: 1, Flow Control: None
	UART0->C1 = (uint8_t)0x00U;
	
	//baud rate = MCGFLLCLK/((OSR+1)*(SBR[12:0]))
	//MCGFLLCLK = 48000000, OSR default = 15
	//MCGFLLCLK/((OSR+1) (26)) = 115200
	UART0->BDL = (uint8_t) 26; 
	//clear relevant bits in BDH
	UART0->BDH &= 0xF0;
	UART0->BDH |= (uint8_t)((~0xF0)&(26 >> 8));
		
	//enable receiver and transmitter
	UART0->C2 |= UART0_C2_TE_MASK|UART0_C2_RE_MASK;
}

int fputc(int ch, FILE *f)
{
    while(!(UART0->S1 & UART0_S1_TDRE_MASK));//Transmit Data Register Empty Flag
		//Send character
    UART0->D = ch;
	return ch;
}
