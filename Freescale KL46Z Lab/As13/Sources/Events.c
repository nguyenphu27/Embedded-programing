/* ###################################################################
**     Filename    : Events.c
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
**         Cpu_OnNMIINT - void Cpu_OnNMIINT(void);
**
** ###################################################################*/
/*!
** @file Events.c
** @version 01.00
** @brief
**         This is user's event module.
**         Put your event handler code here.
*/         
/*!
**  @addtogroup Events_module Events module documentation
**  @{
*/         
/* MODULE Events */

#include "Cpu.h"
#include "Events.h"
#include "mqx_tasks.h"

#ifdef __cplusplus
extern "C" {
#endif 


/* User includes (#include below this line is not maintained by Processor Expert) */

/*
** ===================================================================
**     Event       :  Cpu_OnNMIINT (module Events)
**
**     Component   :  Cpu [MKL46Z256MC4]
*/
/*!
**     @brief
**         This event is called when the Non maskable interrupt had
**         occurred. This event is automatically enabled when the [NMI
**         interrupt] property is set to 'Enabled'.
*/
/* ===================================================================*/
void Cpu_OnNMIINT(void)
{
  /* Write your code here ... */
}

/*
** ===================================================================
**     Event       :  GPIO1_OnPortEvent (module Events)
**
**     Component   :  GPIO1 [GPIO_LDD]
*/
/*!
**     @brief
**         Called if defined event on any pin of the port occured.
**         OnPortEvent event and GPIO interrupt must be enabled. See
**         SetEventMask() and GetEventMask() methods. This event is
**         enabled if [Interrupt service/event] is Enabled and disabled
**         if [Interrupt service/event] is Disabled.
**     @param
**         UserDataPtr     - Pointer to RTOS device
**                           data structure pointer.
*/
/* ===================================================================*/
void GPIO1_OnPortEvent(LDD_TUserData *UserDataPtr)
{
  /* Write your code here ... */
	 LWSEM_STRUCT *lwsem_ptr = (LWSEM_STRUCT*)UserDataPtr;
	 _lwsem_post(lwsem_ptr);
}

/* END Events */

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
