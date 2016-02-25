
// Smpl_Timer_LED : on/off LED every second
//
#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"

volatile uint32_t led=0;

void TMR0_IRQHandler()
{
		led++;
		if(led == 1){
		DrvGPIO_ClrBit(E_GPC,12);
		DrvGPIO_ClrBit(E_GPC,14);
		DrvGPIO_SetBit(E_GPC,13);
		DrvGPIO_SetBit(E_GPC,15);
		}
	else{
		DrvGPIO_ClrBit(E_GPC,13);
		DrvGPIO_ClrBit(E_GPC,15);
		DrvGPIO_SetBit(E_GPC,12);
		DrvGPIO_SetBit(E_GPC,14);
		led =0;
	}	
	TIMER0->TISR.TIF = 1;		// clear Interrupt flag
}

/*
void TMR0_IRQHandler()
{
		led++;
		if(led == 1){ 
		DrvGPIO_ClrBit(E_GPC,12);
		DrvGPIO_ClrBit(E_GPC,14);
		DrvGPIO_SetBit(E_GPC,13);
		DrvGPIO_SetBit(E_GPC,15);
	}
	else if(led == 2){
		DrvGPIO_ClrBit(E_GPC,13);
		DrvGPIO_ClrBit(E_GPC,15);
		DrvGPIO_SetBit(E_GPC,12);
		DrvGPIO_SetBit(E_GPC,14);
		led = 0;
	}	// clear Interrupt flag
}
	/*
if(led%2){ 
		DrvGPIO_ClrBit(E_GPC,12);
		DrvGPIO_ClrBit(E_GPC,14);
		DrvGPIO_SetBit(E_GPC,13);
		DrvGPIO_SetBit(E_GPC,15);
	}
	else{
		DrvGPIO_ClrBit(E_GPC,13);
		DrvGPIO_ClrBit(E_GPC,15);
		DrvGPIO_SetBit(E_GPC,12);
		DrvGPIO_SetBit(E_GPC,14);
	}
	led++;
	

		
	
}*/

void InitTIMER0(void)
{
	/* Step 1. Enable and Select Timer clock source */          
	SYSCLK->CLKSEL1.TMR0_S = 0;	//Select 12Mhz for Timer0 clock source 
	SYSCLK->APBCLK.TMR0_EN = 1;	//Enable Timer0 clock source

	/* Step 2. Select Operation mode */	
	TIMER0->TCSR.MODE = 1; //Select operation mode

	/* Step 3. Select Time out period = (Period of timer clock input) * (8-bit Prescale + 1) * (24-bit TCMP)*/
	TIMER0->TCSR.PRESCALE = 255;	// Set Prescale [0~255]
	TIMER0->TCMPR = 46875;		    // Set TCMPR [0~16777215]
	//Timeout period = (1 / 12MHz) * ( 255 + 1 ) * 46875 = 10^6 us = 1 sec

	/* Step 4. Enable interrupt */
	TIMER0->TCSR.IE = 1;
	TIMER0->TISR.TIF = 1;		//Write 1 to clear for safty		
	NVIC_EnableIRQ(TMR0_IRQn);	//Enable Timer0 Interrupt

	/* Step 5. Enable Timer module */
	TIMER0->TCSR.CRST = 1;	//Reset up counter
	TIMER0->TCSR.CEN = 1;		//Enable Timer0

	TIMER0->TCSR.TDR_EN=1;		// Enable TDR function
	while(1);
}

int32_t main(void)
{
	uint32_t i;
	UNLOCKREG();
	SYSCLK->PWRCON.XTL12M_EN = 1;//Enable 12MHz Crystal
  DrvSYS_Delay(5000); // waiting for 12MHz crystal stable
	SYSCLK->CLKSEL0.HCLK_S = 0;		
	
	LOCKREG();
	for(i=12;i<16;i++){
		DrvGPIO_Open(E_GPC, i, E_IO_OUTPUT); // set GPC12 output for LED
	}
	InitTIMER0();// Set Timer Ticking

	
	
	while(1) 
	{ // Do Nothing		 
	}
}


