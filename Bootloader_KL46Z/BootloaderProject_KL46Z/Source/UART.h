#ifndef UART_H
#define UART_H
#include "MKL46Z4.h"
#include <stdio.h>
#include <stdint.h>

void UART0_PutChar(char c);
char UART0_GetChar(void);
void Init_UART(void);
void UART0_AsyncReceive();

#endif
