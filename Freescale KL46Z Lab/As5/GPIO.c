#include <stdint.h>
#include <stdio.h>
#include "GPIO.h"
#include  "MKL46Z4.h"

const uint32_t led_mask[] = {1UL << 5, 1UL << 29};
//button
#define BTN_SW1  1                      /* Represent PTC3 */
#define BTN_SW3  1                      /* Represent PTC12 */

void LED_Open(void){

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

//---------Init Button & Vector interrupt-------------------
int32_t GPIO_EnableEINT(void) {
	NVIC_EnableIRQ(PORTC_PORTD_IRQn);	//NIVC enable interrupt
	
  SIM->SCGC5    |=  (1UL << 11);      /* Enable Clock Port C*/
  PORTC->PCR[12]  = ((1UL <<  0) |                   /* Pull Select is pullup */
                    (1UL <<  1) |                   /* Pull Enable */
                    (1UL <<  8)  |                 /* Pin is GPIO */
										PORT_PCR_IRQC(9));                 /*Interrupt enable*/
	
  PORTC->PCR[3]  = ((1UL <<  0) |                   /* Pull Select is pullup */
                    (1UL <<  1) |                   /* Pull Enable */
                    (1UL <<  8) |                 /* Pin is GPIO */
										PORT_PCR_IRQC(9));                 /*Interrupt enable*/

  PTC->PDDR &= ~(1U <<  12);                       /* configure PTC12 as input */
  PTC->PDDR &= ~(1U <<  3);                       /* configure PTC3 as input */

  return (0);
}

//Switch normal
uint32_t Buttons_SW1(void){

  uint32_t val = 0;
	
  if (!(PTC->PDIR & (1U <<  3))) { val |= BTN_SW1; }

  return (val);
}
uint32_t Buttons_SW3(void){

  uint32_t val = 0;

  if (!(PTC->PDIR & (1U <<  12))) { val |= BTN_SW3; }

  return (val);
}

//interrupt switch
uint32_t INT_SW1(void){
	
	uint32_t val = 0;
	
	if(PORTC->ISFR == (1u<<3)){
		val |= BTN_SW1;
	}
	return val;
}
uint32_t INT_SW3(void){
	uint32_t val = 0;
	
	if(PORTC->ISFR == (1u<<12)){
		val |= BTN_SW3;
	}
	return val;
}




