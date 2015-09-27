#include "MKL46Z4.h"
#include  <stdio.h>
#include  "uart.h"

/**
 * @brief file handle structure
 */
struct __FILE 
{ 
	int handle;
};

FILE __stdout;
FILE __stdin;

void Init_UART(void){
	char dummy;
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
		
	//enable transmitter
	UART0->C2 |= UART0_C2_TE_MASK|
							 UART0_C2_RE_MASK;
	/* Dummy read to ensure UART0 
	   receive buffer is empty already */
	dummy = UART0->D;
	dummy = dummy; /* Make compiler happy */
}
//-----


/**
 * @brief         UART0_PutChar
 * @param[in]     void
 * @param[in,out] void
 * @return        void
 */
void UART0_PutChar(char c)
{
	UART0->D   = c;
  /* Wait for transmition complete */
	while(!(UART0->S1 & (0x01 << 6))) {}
}

/**
 * @brief         UART0_GetChar
 * @param[in]     void
 * @param[in,out] void
 * @return        char
 */
char UART0_GetChar(void)
{
	/* Wait for incomming character */
	while(!(UART0->S1 & (0x01 << 5))) {}
  return UART0->D; 
}

/**
 * @brief         fputc
 * @param[in]     void
 * @param[in,out] void
 * @return        char
 */

int fputc(int ch, FILE *f) 
{ 
  UART0_PutChar((char)ch);
  return((int)ch);
}

/**
 * @brief         fgetc
 * @param[in]     void
 * @param[in,out] void
 * @return        char
 */
int fgetc(FILE *f) {
	
	char c;
	/* get key */
	c =  UART0_GetChar();
	/* print echo */
	UART0_PutChar(c);
  return (int)c;
}

/**
 * @brief         UART0_AsyncReceive
 * @param[in]     CallBack_Type CallBack
 * @param[in,out] uint8_t * buffer
 * @return        void
 */
void UART0_AsyncReceive()
{
	/* Disable IRQ */
	//NVIC_DisableIRQ(UART0_IRQn); 		
	/* Receive Complete Interrupt Enable */
	UART0->C2 |= UART0_C2_RIE_MASK;
	UART0->C2 |= UART0_C2_TIE_MASK;
	NVIC_SetPriority(UART0_IRQn,1);
	NVIC_EnableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);
}
