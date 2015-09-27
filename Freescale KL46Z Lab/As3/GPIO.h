#ifndef GPIO_H
#define GPIO_H

#include <stdint.h>
#include <stdio.h>
#include  "MKL46Z4.h"

//LED
void LED_Open(void);
void LED_GREEN_ON(void);
void LED_GREEN_OFF(void);
void LED_RED_ON(void);
void LED_RED_OFF(void);

extern int32_t  Buttons_Initialize (void);
extern uint32_t Buttons_SW1(void);
extern uint32_t Buttons_SW3(void);
#endif

