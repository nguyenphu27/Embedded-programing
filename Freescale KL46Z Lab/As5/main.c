#include  "GPIO.h"

extern void SystemCoreClockUpdate (void);

volatile uint32_t msTicks;
int dem = 0; 	//test press switch
int d = 500;	//default delay 


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

	if(INT_SW1() == 1){ //test interrupt switch
		
		dem++;
		d = d/2; 					//decrease delay twice (increase frequency twice)
		
	}else if(INT_SW3() == 1){
		dem--;
		d = d *2;
		
	}
		
	ISFR_SW1;					//Interrupt Status Flag Register
	ISFR_SW3;
}

int main (void) {
	int b,c,i;
  SystemCoreClockUpdate();                      /* Get Core Clock Frequency */  
	SysTick_Config(SystemCoreClock/1000);
	LED_Open();    
	GPIO_EnableEINT();	//enable interrupt
	
	for(;;){			
		if(dem == 0){ 		//default RED LED blinks at 1Hz, Green LED blink at 1 Hz
			
				delay(d);
				LED_GREEN_TOGGLE();
				LED_RED_TOGGLE();				
			
		}else if(dem != 0){ 			//when press
			b = 500/d; 							//test decrease delay twice or increase delay twice
					if(b>1){ 						//decrease delay twice
					for(i=0;i<b;i++){
						delay(d);
						LED_GREEN_TOGGLE();	
					}
					LED_RED_TOGGLE();
					}else{ 							//increase delay twice
					c = d/500;
					for(i=0;i<c;i++){
						delay(500);
						LED_RED_TOGGLE();
					}
					LED_GREEN_TOGGLE();
			}
		}	
	}
}
