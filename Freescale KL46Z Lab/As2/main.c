#include  "GPIO.h"

extern void SystemCoreClockUpdate (void);

volatile uint32_t msTicks;

void SysTick_Handler(){
		msTicks++;
}
void delay(uint32_t dlyTicks){
		uint32_t curTicks;
		curTicks = msTicks;
		while((msTicks - curTicks) < dlyTicks);
}
int main (void) {
	int a = 0;
  SystemCoreClockUpdate();                      /* Get Core Clock Frequency */  
	SysTick_Config(SystemCoreClock/1000);
  LED_Open();
  while(1) { 
		//led green blink with frequency 4Hz
		//led red blink with frequency 2Hz
		LED_GREEN_ON();
		LED_RED_OFF();
		delay(125);
		LED_GREEN_OFF();
		delay(125);
		LED_GREEN_ON();
		delay(125);
		LED_GREEN_OFF();
		delay(125);
		LED_GREEN_ON();
		LED_RED_ON();
		delay(125);
		LED_GREEN_OFF();
		delay(125);
		LED_GREEN_ON();
		delay(125);
		LED_GREEN_OFF();
		delay(125);	
  } 
}

