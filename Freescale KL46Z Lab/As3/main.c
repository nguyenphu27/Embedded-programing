#include  "GPIO.h"

extern void SystemCoreClockUpdate (void);

int main (void) {
  SystemCoreClockUpdate();                      /* Get Core Clock Frequency */  
	LED_Open();    
	Buttons_Initialize();	
	for(;;){
		LED_RED_OFF();
		while(Buttons_SW1()) { 
					LED_RED_ON();
				}
		} 
}

