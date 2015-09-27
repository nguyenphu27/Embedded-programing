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
		_task_id task2_id;
		uint8_t count = 20; //10 times
		LDD_TDeviceData* *led_ptr1;
		led_ptr1 = LED_Init(NULL);
		/*================TASK 1========================*/
		/*--------Led red blink 1Hz----------------*/
		printf("\nTask 1 is running\n");
		while(count>0){
			count--;
			LED_Toggle_Red(led_ptr1);
			/*Period: 5 ms*/
			/*Toggle led red after: 100*5 = 500ms*/
			_time_delay_ticks(100);						
		}	
		/*Create task 2*/
		task2_id = _task_create_at(0,TASK2_TASK,0,Task2_task_stack,TASK2_TASK_STACK_SIZE);
		
		/*Test task create*/
		if(task2_id == MQX_NULL_TASK_ID){
			printf("\nCouldn't create task 2!\n");
		}else{
			printf("\nTask 2 created!\n");
		}
}

void Task2_task(uint32_t task_init_data){
		LDD_TDeviceData* *led_ptr2;
		led_ptr2 = LED_Init(NULL);
		/*================TASK 2========================*/
		/*--------Led green & red blink 1Hz----------------*/
		printf("\nTask 2 is running!\n");
		for(;;){
			LED_Toggle_Green(led_ptr2);
			LED_Toggle_Red(led_ptr2);
			/*Period: 5 ms*/
			/*Toggle led after: 100*5 = 500ms*/
			_time_delay_ticks(100);
		}
		_task_block(); //block task
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
