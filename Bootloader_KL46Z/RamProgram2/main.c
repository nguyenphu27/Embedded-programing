#include  "GPIO.h"
uint32_t i;
void delay2(uint32_t n){
	for(i=0;i<n;i++){
			for(i=0;i<n;i++){
		}
	}
}
int main (void) {
  Init_LED();
  while(1) { 
		//led green blink with frequency 4Hz
		//led red blink with frequency 2Hz
		LED_GREEN_TOGGLE();
		LED_RED_TOGGLE();
		delay2(500000);
  } 
}

