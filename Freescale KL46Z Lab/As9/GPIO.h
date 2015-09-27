#ifndef GPIO_H
#define GPIO_H

#include <stdint.h>
#include <stdio.h>
#include  "MKL46Z4.h"

//Interrupt Status Flag Register
#define ISFR_SW1 (PORTC->ISFR |= (0u<<3));
#define ISFR_SW3 (PORTC->ISFR |= (0u<<12));
extern uint32_t Get_SW1(void);
extern uint32_t Get_SW3(void);

//LED
void Init_LED(void);
void LED_GREEN_ON(void);
void LED_GREEN_OFF(void);
void LED_GREEN_TOGGLE(void);
void LED_RED_ON(void);
void LED_RED_OFF(void);
void LED_RED_TOGGLE(void);

//button
extern int32_t  Init_Button (void);
extern uint32_t Buttons_SW1(void);
extern uint32_t Buttons_SW3(void);
#endif

