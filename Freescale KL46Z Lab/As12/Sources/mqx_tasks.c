/* ###################################################################
**     Filename    : mqx_tasks.c
**     Project     : gpio_frdmkl46
**     Processor   : MKL46Z256VLH4
**     Component   : Events
**     Version     : Driver 01.00
**     Compiler    : Keil ARM C/C++ Compiler
**     Date/Time   : 2014-11-03, 17:21, # CodeGen: 0
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

#ifdef __cplusplus
extern "C" {
#endif 


/* User includes (#include below this line is not maintained by Processor Expert) */
typedef enum {
    BUTTON_NOT_INITIALIZED = -1,
    BUTTON_RELEASED,
    BUTTON_PRESSED
} button_state_t;
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
		LDD_TDeviceData* *led_ptr1;
		led_ptr1 = LED_Init(NULL);
		printf("\n================Program use RTOS blink 2 Led=======================\n");
		/*================TASK 1========================*/
		/*--------Led green blink 1.5Hz----------------*/
		while (TRUE)
		{
			/* Period: 5 ms*/	
			_time_delay_ticks(66); 
			//Toggle led after 0.33s(66*5 = 330ms)
			LED_Toggle_Green(led_ptr1);
			printf("\nTask 1 is running!\n");	
		}	
}

void Task2_task(uint32_t task_init_data){
		LDD_TDeviceData* *led_ptr2;
		led_ptr2 = LED_Init(NULL);
		/*================TASK 2========================*/
		/*--------Led red blink 1Hz--------------------*/
		while (TRUE)
		{
			/* Period: 5 ms*/	
			//Toggle led after 0.5s(100*5 = 500ms)
			_time_delay_ticks(100);	
			LED_Toggle_Red(led_ptr2);
			printf("\nTask 2 is running!\n");					
		}	
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
