#include <stdint.h>
#include <stdio.h>
#include "GPIO.h"
#include  "MKL46Z4.h"

const uint32_t led_mask[] = {1UL << 5, 1UL << 29};

void Init_LED(void){

  SIM->SCGC5    |= (1UL << 12) | (1UL << 13);        /* Enable Clock to Port D and Port E*/ 
  PORTD->PCR[5]  = (1UL <<  8);                      /* Pin is GPIO */
  PORTE->PCR[29] = (1UL <<  8);                      /* Pin is GPIO */

  PTD->PDOR = led_mask[0];                           /* switch LEDs off  */
  PTE->PDOR = led_mask[1];                       

  PTD->PDDR = led_mask[0];                           /* enable Output  */
  PTE->PDDR = led_mask[1];                       
}

void LED_GREEN_ON(void){
		PTD->PCOR       = led_mask[0];
}
void LED_GREEN_OFF(void){
		PTD->PSOR       = led_mask[0];
}
void LED_GREEN_TOGGLE(void){
		PTD->PTOR       = led_mask[0];
}
void LED_RED_ON(void){
		PTE->PCOR   = led_mask[1];
}
void LED_RED_OFF(void){
		PTE->PSOR       = led_mask[1];
}
void LED_RED_TOGGLE(void){
		PTE->PTOR   = led_mask[1];
}
