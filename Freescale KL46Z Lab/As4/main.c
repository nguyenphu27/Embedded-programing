#include  "GPIO.h"

extern void SystemCoreClockUpdate (void);

volatile uint32_t msTicks;

//systick
void SysTick_Handler(){
		msTicks++;
}
void delay(uint32_t dlyTicks){
		uint32_t curTicks;
		curTicks = msTicks;
		while((msTicks - curTicks) < dlyTicks);
}
int main (void) {
  SystemCoreClockUpdate();                      /* Get Core Clock Frequency */  
  SysTick_Config(SystemCoreClock/1000);
	LED_Open();    //init led  
  for(;;){
		//led green blink with frequency 2Hz
		//led red blink with frequency 1Hz
		delay(250);
		LED_GREEN_ON();
		delay(250);
		LED_GREEN_OFF();
		LED_RED_TOGGLE(); 
  } 
}