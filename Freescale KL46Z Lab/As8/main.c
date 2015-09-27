#include "MKL46Z4.h"
#include "GPIO.h"

/*------------------------Init PIT-----------------------------*/
/*Time period = = (count + 1) × clock cycle time = (count + 1) / clock frequency  24MHz(PEE mode)*/ 
void InitPIT(void){
	SIM->SCGC6 |= 1UL<<23;	                     // Enable clock for PIT
	PIT->MCR = 0x00UL;			            		     // Turn on PIT
	
	//Init chanel 0 - Timer 0
	PIT->CHANNEL[0].LDVAL= 0x2DC6BFF;	           // Load value Timer 0 = 2s		       		     
	PIT->CHANNEL[0].TCTRL |= PIT_TCTRL_TIE_MASK| // Enable Interrupt Timer0
													 PIT_TCTRL_TEN_MASK;	// Enable Timer 0
	
	//Ini chanel 1 - Timer 1
	PIT->CHANNEL[1].LDVAL = 0x5B8D7FF;	           // Load value Timer 1 = 4s
	PIT->CHANNEL[1].TCTRL |= PIT_TCTRL_TIE_MASK|  // Enable Interrupt Timer1
													 PIT_TCTRL_TEN_MASK;	// Enable Timer 1
}
/*------------------------PIT Handler---------------------------*/
void PIT_IRQHandler(void)
{
	if(PIT->CHANNEL[0].TFLG!=0)	            // Check Interrupt Timer0 Flag 
	{	
		LED_GREEN_TOGGLE();   								//Toggle led green after 2s
	}
	
	if(PIT->CHANNEL[1].TFLG!=0)	            // Check Interrupt Timer1 Flag 
	{	
		LED_RED_TOGGLE();   								  //Toggle led red after 4s
	}
	
	PIT->CHANNEL[0].TFLG = 1UL;	          	// Clear Interrupt Timer0 Flag
	PIT->CHANNEL[1].TFLG = 1UL;	          	// Clear Interrupt Timer1 Flag
}

int main(void)
{
	Init_LED();
	InitPIT();
	
	/* Enable interrupt */
	NVIC_EnableIRQ(PIT_IRQn);
	while(1){
	}
	return 0;
}