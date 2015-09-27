#include "MKL46Z4.h"


void FEI_PEE_Mode(void){
	/* SIM->SCGC5: PORTA=1 */
  SIM->SCGC5 |= (uint32_t)0x0200UL;     /* Enable clock gate for ports to enable pin routing */
  
  /* SIM->CLKDIV1: OUTDIV1=1(Divide-by-2),OUTDIV4=1(Divide-by-2) 
	   Core clock = MCGOUTCLK/2 
	   Bus clock = Core clock/2 */
  SIM->CLKDIV1 = (uint32_t)0x10010000UL; /* Update system prescalers */
    
  /* PORTA->PCR18: ISF=0,MUX=0 */
  PORTA->PCR[18] &= (uint32_t)~0x01000700UL;
  /* PORTA->PCR19: ISF=0,MUX=0 */
  PORTA->PCR[19] &= (uint32_t)~0x01000700UL;
  
  /* Switch to FBE Mode */
  /* MCG_C2: LOCRE0=0,RANGE0=2,HGO0=0,EREFS0=1,LP=0,IRCS=0 
     RANGE0=2 Very high frequency range selected for the crystal oscillator 
	   EREFS0=1 Oscillator requested */
  MCG->C2 = (uint8_t)((MCG->C2 & (uint8_t)~(uint8_t)0x9BU) | (uint8_t)0x24U);
  
  /* OSC0->CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=1,SC4P=0,SC8P=0,SC16P=0 */
  OSC0->CR = (uint8_t)0x80U;
  
  /* MCG_C1: CLKS=2,FRDIV=3,IREFS=0,IRCLKEN=1,IREFSTEN=0 
     CLKS=2, IREFS=0 External reference clock is selected
	   FRDIV=3 Output of FLL is selected for MCGOUTCLK, Divide Factor is 256 (31.25kHz)*/
  MCG->C1 = (uint8_t)0x9AU;
  
  /* MCG->C4: DMX32=0,DRST_DRS=0 
     MCGFLLCLK: 31.25kHz * 640 = 20MHz */
  MCG->C4 &= (uint8_t)~(uint8_t)0xE0U;
  
  /* MCG->C5: PLLCLKEN0=0,PLLSTEN0=0,PRDIV0=1 
     PLLCLKEN0=0 MCGPLLCLK is inactive
	   PLLSTEN0=0  MCGPLLCLK is disabled in any of the Stop modes
	   PRDIV0=1    External clock div 2 */
  MCG->C5 = (uint8_t)0x01U;
  
  /* MCG->C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 
     PLLS=0  FLL is selected
	   CME0=0  External clock monitor is disabled for OSC0 */
  MCG->C6 = (uint8_t)0x00U;
  
  while((MCG->S & MCG_S_IREFST_MASK) != 0x00U) { /* Check that the source of the FLL reference clock is the external reference clock. */
  }
  while((MCG->S & 0x0CU) != 0x08U) {    				 /* Wait until external reference clock is selected as MCG output */
  }
	
  /* Switch to PBE Mode */
  /* MCG->C6: LOLIE0=0,PLLS=1,CME0=0,VDIV0=0 
     PLLS=1   PLL is selected(LOCK0 bit cleared, MCGPLLCLK gated off until LOCK0 bit asserted again) */
  MCG->C6 = (uint8_t)0x40U;
	
  while((MCG->S & 0x0CU) != 0x08U) {    /* Wait until external reference clock is selected as MCG output */
  }
  while((MCG->S & MCG_S_LOCK0_MASK) == 0x00U) { /* Wait until locked */
  }
	
  /* Switch to PEE Mode */
  /* MCG->C1: CLKS=0,FRDIV=3,IREFS=0,IRCLKEN=1,IREFSTEN=0 
     CLKS=0,IREFS=0 Output of FLL or PLL is selected	*/
  MCG->C1 = (uint8_t)0x1AU;
	
  /* PRDIV0=1  External clock div 2
     VDIV0=0  Multiply Factor is 24, External clock = 8MHz, MCGOUTCLK = (8/2)*24 = 96MHz 
	   Core clock = MCGOUTCLK/2 = 96/2 = 48MHz 
	   Bus clock = Core clock/2  = 48/2 = 24MHz */
  while((MCG->S & 0x0CU) != 0x0CU) {}    /* Wait until output of the PLL is selected */
}

void FBE_Mode(void)
{		
	/* MCG->C1: CLKS=2,FRDIV=3,IREFS=0,IRCLKEN=1,IREFSTEN=0 */
	MCG->C1 &= ~MCG_C1_IREFS_MASK;	// External reference clock is selected.
	MCG->C1 |= MCG_C1_CLKS(2)|      
						 MCG_C1_FRDIV(3); 		// Output of FLL is selected for MCGOUTCLK, Divide Factor is 256
	
	/* MCG_C2: LOCRE0=0,RANGE0=3,HGO0=0,EREFS0=1,LP=0,IRCS=0 */
	MCG->C2 |= MCG_C2_RANGE0(3) | 	// Very high frequency range selected for the crystal oscillator 
             MCG_C2_EREFS0_MASK;  // Oscillator requested
	
	/* OSC0->CR: ERCLKEN=1,??=0,EREFSTEN=0,??=0,SC2P=1,SC4P=0,SC8P=0,SC16P=0 */
  OSC0->CR = (uint8_t)0x80U;
	
	/* MCG->C4: DMX32=0,DRST_DRS=1 */
	MCG->C4 &= ~MCG_C4_DMX32_MASK;
	MCG->C4 |= MCG_C4_DRST_DRS_MASK; // MCGFLLCLK: 31.25kHz * 1280 = 40MHz

	/* MCG->C6: LOLIE0=0,PLLS=0,CME0=0,VDIV0=0 */
	MCG->C6 &= ~MCG_C6_CME0_MASK;		 // External clock monitor is disabled for OSC0
	MCG->C6 &= ~MCG_C6_PLLS_MASK;		 // FLL is selected
	
  while((MCG->S & MCG_S_IREFST_MASK) != 0); 						// wait for External clock is selected
  while((MCG->S & MCG_S_CLKST_MASK) != MCG_S_CLKST(2)); // wait for EXTAL is selected

	/* SIM->CLKDIV1: OUTDIV1=0,OUTDIV4=0,*/
	/* OUTDIV1 = 0 (Divide-by-1), OUTDIV4 = 0 (Divide-by-1) */
	SIM->CLKDIV1 &= ~SIM_CLKDIV1_OUTDIV1_MASK;  // MCGOUTCLK = 8MHz; Core clock = 8/1 = 8 MHz
	SIM->CLKDIV1 &= ~SIM_CLKDIV1_OUTDIV4_MASK;   // Bus clock = 8/1 = 8MHz
}
