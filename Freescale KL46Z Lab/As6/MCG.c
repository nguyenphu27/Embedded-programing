#include "MKL46Z4.h"


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