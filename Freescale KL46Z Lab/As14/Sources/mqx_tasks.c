/* ###################################################################
**     Filename    : mqx_tasks.c
**     Project     : lwtimer_frdmkl46
**     Processor   : MKL46Z256VMC4
**     Component   : Events
**     Version     : Driver 01.00
**     Compiler    : Keil ARM C/C++ Compiler
**     Date/Time   : 2014-11-03, 16:49, # CodeGen: 0
**     Abstract    :
**         This is user's event module.
**         Put your event handler code here.
**     Settings    :
**     Contents    :
**         Task1_task - void Task1_task(uint32_t task_init_data);
**
** ###################################################################*/
/*!
** @file mqx_tasks.c
** @version 01.00
** @brief
**         This is user's event module.
**         Put your event handler code here.
*/         
/*!
**  @addtogroup mqx_tasks_module mqx_tasks module documentation
**  @{
*/         
/* MODULE mqx_tasks */

#include "Cpu.h"
#include "Events.h"
#include "mqx_tasks.h"
#include "lwtimer.h"
#include "Seg_LCD.h"
#ifdef __cplusplus
extern "C" {
#endif 


/* User includes (#include below this line is not maintained by Processor Expert) */
/*FUNCTION*------------------------------------------------------
*
* Function Name  : LED_on
* Returned Value : none
* Comments       :
*     This timer function prints out "ON"
*END*-----------------------------------------------------------*/
	
uint32_t count = -1; //declare counter
static void Counter
   (
      void   *data_ptr
   )
{
		/*Counter increase*/
		count++; 
		/*Init Seg LCD*/
		SegLCD_Init(); 
		/*Display counter value on LCD
			if counter value > 9999 will reset counter =0*/
		if(count <= 9999){
				SegLCD_DisplayDecimal(count);
		}else{
				count=0;
				SegLCD_DisplayDecimal(count);
	}
}

/*FUNCTION*------------------------------------------------------
*
* Function Name  : LED_off
* Returned Value : none
* Comments       :
*     This timer function prints out "OFF"
*END*-----------------------------------------------------------*/

/*
** ===================================================================
**     Event       :  Task1_task (module mqx_tasks)
**
**     Component   :  Task1 [MQXLite_task]
**     Description :
**         MQX task routine. The routine is generated into mqx_tasks.c
**         file.
**     Parameters  :
**         NAME            - DESCRIPTION
**         task_init_data  - 
**     Returns     : Nothing
** ===================================================================
*/
void Task1_task(uint32_t task_init_data)
{
	 LWTIMER_PERIOD_STRUCT  period;
	 LWTIMER_STRUCT         on_timer;
	 LWTIMER_STRUCT         off_timer; 
   /* 
	** Create the timer: cycle length of this timer in ticks = 200(200*5ms = 1s)
   */
	 _lwtimer_create_periodic_queue(&period, 200, 0);
		
	 _lwtimer_add_timer_to_queue(&period, &on_timer, 0, Counter, NULL); //jump Counter function after 1s

		for(;;){}
}

/* END mqx_tasks */

#ifdef __cplusplus
}  /* extern "C" */
#endif 

/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.4 [05.09]
**     for the Freescale Kinetis series of microcontrollers.
**
** ###################################################################
*/
