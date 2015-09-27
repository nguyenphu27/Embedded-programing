#ifndef Parse_srec_H
#define Parse_srec_H

#include <stdio.h>
#include "UART.h"
#include "MKL46Z4.h"

uint32_t ConvertAndParse(char *buff, uint32_t line);
uint32_t Get_CountByte();
uint32_t Get_Address();
char* Get_Data();
uint32_t Get_CheckSum();
uint32_t CheckSum();

#endif