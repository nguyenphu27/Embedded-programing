#include  "MCG.h"
#include  "GPIO.h"
extern void SystemCoreClockUpdate (void);
volatile uint32_t msTicks;

//SysTick timer
void SysTick_Handler(){
		msTicks++;
}
void delay(uint32_t dlyTicks){
		uint32_t curTicks;
		curTicks = msTicks;
		while((msTicks - curTicks) < dlyTicks);
}

void PORTC_PORTD_IRQHandler(void)
{
	if(Get_SW3() == 1){ // press SW3 to switch mode PEE	
		FEI_PEE_Mode();	
		LED_RED_ON();     // test set switch PEE mode 
		//configure again PTC3
			PORTC->PCR[3]  = ((1UL <<  0) |                  /* Pull Select is pullup */
                       (1UL <<  1) |                  /* Pull Enable */
                       (1UL <<  8) );                 /* Pin is GPIO */
			PORTC->PCR[3] &= ~(1UL <<  19);								// Interrupt disable*/
			PORTC->PCR[3] &= ~(1UL <<  24);								// Configured interrupt is not detected
			PTC->PDDR |= (1U <<  3);                      // Configure PTC3 as output */
			PORTC->PCR[3] |= (PORT_PCR_MUX(0x1)); 				// Select the BusClock clock to output on the CLKOUT pin
			SIM->SOPT2 |= SIM_SOPT2_CLKOUTSEL(0x2); 			// Set PTC3 as CLKOUT pin for BusClock		
																										// CLKOUT=PTC3=Bus Clock = 24MHz	
	}
	ISFR_SW3; ////Interrupt Status Flag Register
}

int main (void)
{
	//Default run FEI mode
  /* Update system clock */
  SystemCoreClockUpdate(); 
	SysTick_Config(SystemCoreClock/1000);
	Init_LED();    
	Init_Button();	//enable interrupt
	
	for(;;){
		delay(500);
		LED_GREEN_TOGGLE();
	}
  return 0;
}
