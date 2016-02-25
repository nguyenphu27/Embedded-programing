/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/

#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"
#include "Seven_Segment.h"
#include "Scankey.h"

int32_t main (void)
{
	int32_t number, number2,number3,number4,number5;
	int key=0;
	UNLOCKREG();
	DrvSYS_Open(50000000);
	LOCKREG();
	DrvGPIO_Open(E_GPC, 12, E_IO_OUTPUT);
	OpenKeyPad();					 	
	 
	while(1)
	{
	  number = Scankey();
		// scan keypad to get a number (1~9)
		
		if(number == 1){
			key++;	
			
				if(key>999){
					key = 0;
					DrvGPIO_ClrBit(E_GPC,12);
				}
				
				//luc giu phim so no ko chay ma no chay vong vong o day giu nguyen gia tri.
						while(Scankey()>0){
				
						close_seven_segment();
						
						show_seven_segment(0,number3);			
						DrvSYS_Delay(500);  
							
						close_seven_segment(); 
						show_seven_segment(1,number4);			
						DrvSYS_Delay(500); 
							
						close_seven_segment(); 
						show_seven_segment(2,number5);			
						DrvSYS_Delay(500); 
			}
		}else if(number==2){
			key=0;
		}

	number2 = key;
	number3 = number2%10;//don vi

	number2 = number2/10;
	number4 = number2%10;//chuc
		
	number2 = number2/10;
	number5 = number2%10;//tram
		
	//luc nha phim ra no se cap nhat gia tri moi hien thi
	close_seven_segment();
	DrvSYS_Delay(500);  
	show_seven_segment(0,number3);			
	
	DrvSYS_Delay(500); 
	close_seven_segment(); 
	show_seven_segment(1,number4);			
	
	DrvSYS_Delay(500); 
	close_seven_segment(); 
	show_seven_segment(2,number5);			
	
	}
}