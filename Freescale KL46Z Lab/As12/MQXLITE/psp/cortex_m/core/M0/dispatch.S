/*HEADER**********************************************************************
*
* Copyright (c) 2010-2011 Freescale Semiconductor
* All Rights Reserved
*
******************************************************************************
*
* THIS SOFTWARE IS PROVIDED BY FREESCALE "AS IS" AND ANY EXPRESSED OR
* IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
* OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL FREESCALE OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
* STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
* IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
* THE POSSIBILITY OF SUCH DAMAGE.
*
******************************************************************************
*
* $FileName: dispatch.S$
* $Version : 3.8.25.3$
* $Date    : Dec-2-2011$
*
* Comments:
*
*   This assembler file contains functions for task scheduling
*
*END*************************************************************************/

#include "asm_mac.h"

#include "mqx_cnfg.h"
#include "types.inc"
#include "psp_prv.inc"

#define __ASM__

#ifdef __CWARM__
#include "kinetis.h"
#else
#include "psp_cpu.h"
#endif /* __CWARM__ */

#include "mqxlite_prv.h"
#undef __ASM__

ASM_EQUATE(SVC_MQX_FN, 0xaa)

 ASM_EXTERN(_mqx_kernel_data)
 ASM_EXTERN(_klog_isr_start_internal)
 ASM_EXTERN(_klog_isr_end_internal)
 ASM_EXTERN(_mqx_api_call_handler)

 ASM_CODE_SECTION(KERNEL)
 SET_FUNCTION_ALIGNMENT
 ASM_COMP_SPECIFIC_DIRECTIVES

 ASM_PUBLIC(_sched_start_internal)
 ASM_PUBLIC(_sched_run_internal)
 ASM_PUBLIC(_sched_check_scheduler_internal)
 ASM_PUBLIC(_sched_execute_scheduler_internal)

 ASM_PUBLIC(_task_block)
 ASM_PUBLIC(_int_kernel_isr)

 ASM_PUBLIC(_mqx_api_call)

 ASM_PUBLIC(_mem_test_and_set)
 ASM_PUBLIC(__get_PSP)
 ASM_PUBLIC(__get_MSP)
 ASM_PUBLIC(__get_PSR)
 ASM_PUBLIC(__set_MSP)

 ASM_PUBLIC(_psp_exception_return)


/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : _sched_start_internal
 * Returned Value   : none
 * Comments         : start MQX scheduler
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(_sched_start_internal)
 ASM_PUBLIC_FUNC(_sched_start_internal)
ASM_LABEL(_sched_start_internal)
                GET_KERNEL_DATA r0
                b sched_internal
 ASM_PUBLIC_END(_sched_start_internal)

//-------------------------------------------------------------------------------

 ASM_PUBLIC_BEGIN(_sched_run_internal)
 ASM_PUBLIC_FUNC(_sched_run_internal)
ASM_LABEL(_sched_run_internal)
                GET_KERNEL_DATA r0
                b sched_internal
 ASM_PUBLIC_END(_sched_run_internal)

//-------------------------------------------------------------------------------

 ASM_PUBLIC_BEGIN(_sched_check_scheduler_internal)
 ASM_PUBLIC_FUNC(_sched_check_scheduler_internal)
ASM_LABEL(_sched_check_scheduler_internal)
                GET_KERNEL_DATA r0

                ldrh r1, [r0, #KD_IN_ISR]
                cmp r1, #0
                bne _sched_check_scheduler_internal_end

                ldr r1, [r0, #KD_CURRENT_READY_Q]
                ldr r2, [r0, #KD_ACTIVE_PTR]
                ldr r3, [r2, #TD_MY_QUEUE]
                cmp r1, r3

                // current task is still the active task
                beq _sched_check_scheduler_internal_end

#if MQX_ENABLE_USER_MODE
                cpsid i
                push {r0}
                mrs r0, IPSR
                cmp r0, #0xb
                pop {r0}
                bne _sched_check_scheduler_internal2
                push {lr}
                //bl _set_pend_sv
                cpsie i
                pop {pc}
ASM_LABEL(_sched_check_scheduler_internal2)
#endif
                b _sched_execute_scheduler_internal

ASM_LABEL(_sched_check_scheduler_internal_end)
                bx lr
 ASM_PUBLIC_END(_sched_check_scheduler_internal)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : _sched_execute_scheduler_internal
 * Returned Value   : none
 * Comments         :
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(_sched_execute_scheduler_internal)
 ASM_PUBLIC_FUNC(_sched_execute_scheduler_internal)
ASM_LABEL(_sched_execute_scheduler_internal)
#if MQX_ENABLE_USER_MODE
                cpsid i
                push {r0}
                mrs r0, IPSR
                cmp r0, #0xb
                pop {r0}
                bne _sched_execute_scheduler_internal2
                push {lr}
                //bl _set_pend_sv
                cpsie i
                pop {pc}
ASM_LABEL(_sched_execute_scheduler_internal2)
                cpsie i
#endif

                // store active task registers
                STORE_ALL_REGISTERS
                // disable interrupts
                cpsid i

                GET_KERNEL_DATA r0
                ldr r3, [r0, #KD_ACTIVE_PTR]        // get active task descriptor
                str r1, [r3, #TD_STACK_PTR]         // store task SP to task descriptor td

#if MQX_KERNEL_LOGGING
                KLOG r0, ASM_PREFIX(_klog_execute_scheduler_internal)  // kernel log this function
#endif

ASM_LABEL(sched_internal)
                ldr r1, [r0, #KD_CURRENT_READY_Q]   // get current ready q
ASM_LABEL(find_noempty_que)
                ldr r2, [r1, #0]                    // address of first td
                cmp r2, r1                          // ready_q structure itself?
                bne switch_task
                ldr r1, [r1, #RQ_NEXT_Q]            // try next queue
                movs r1, r1
                bne find_noempty_que

                // r1 is 0 -> empty
ASM_LABEL(no_one_to_run)
                // wait for interrupt
                cpsie i
                wfi
                cpsid i

                // TODO check r0, must be kernel data
                ldr r1, [r0, #KD_READY_Q_LIST]      // get first queue from ready list
                b find_noempty_que

ASM_LABEL(switch_task)
                // update kernel structures
                str r1, [r0, #KD_CURRENT_READY_Q]   // store addr for active que
                str r2, [r0, #KD_ACTIVE_PTR]        // active task descriptor

                ldrh r3, [r2, #TD_TASK_SR]
                strh r3, [r0, #KD_ACTIVE_SR]        // restore priority mask for enabled interrupt for active task

#if MQX_ENABLE_USER_MODE
                ldr r1, [r2, #TD_FLAGS]
#endif

#if MQX_KERNEL_LOGGING
                KLOG r0, ASM_PREFIX(_klog_context_switch_internal)  // do kernel logging
#endif

                // activate task, restore registers stacked in the following order (from higher addresses to lower addresses):
                // xPSR, PC, LR, R12, R3, R2, R1, R0, R11, R10, R9, R8, R7, R6, R5, R4, PRIMASK
                ldr r0, [r2, #TD_STACK_PTR]         // get task SP
                mov r1, r0
                adds r1, r1, #36
                mov r12, r1
                //load r4-r10
                adds r0, r0, #4
                ldm r0!, {r1-r7}
                mov r10, r7
                mov r9, r6
                mov r8, r5
                mov r7, r4
                mov r6, r3
                mov r5, r2
                mov r4, r1
                //load r11
                ldm r0!, {r1}
                mov r11, r1
                //check if we are returning from the ISR or not
                mrs r1, CONTROL
                cmp r1, #0
                bne rest_of_stack_frame_restore
ASM_LABEL(return_from_interrupt)
                // returning from ISR - rest of stack frame will be loaded automatickly by HW when returning from the ISR
                mov r1, r12
                msr PSP, r1
                //load PRIMASK
                subs r1, r1, #36
                ldm r1!, {r2}
                msr PRIMASK, r2
                //load lr from the main stack
                pop {pc}

ASM_LABEL(rest_of_stack_frame_restore)
                // returning from task, restore xPSR, PC, LR, R12, R3-R0 and also the PRIMASK
                mov r1, r12
                adds r1, r1, #32
                msr PSP, r1
                adds r0, r0, #16
                //restore R12, LR, PC
                ldm r0!, {r1-r3}
                mov r12, r1
                mov lr, r2
                //read stacked xPSR value
                ldm r0!, {r1}
                subs r0, r0, #32

                //bit 9 of the xPSR indicates the stack alignment on exception entry, if set SP has to be moved by 4 bytes
                ldr r2, =0x200
                ands r2, r1, r2
                beq move_pc_at_the_start_of_stackframe
                mrs r2, PSP
                adds r2, r2, #4
                msr PSP, r2
ASM_LABEL(move_pc_at_the_start_of_stackframe)
                mov r2, r0
                subs r2, r2, #36
                //restore xPSR register, do not execute any instruction that updates flags after that point
                msr APSR, r1
                //store stacked pc value (currently in r3) at the beginning of the stack frame to be later poped directly into the PC register
                push {r3}
                push {r4}
                ldm r2!, {r4}
                //restore R3-R0
                ldm r0, {r0-r3}

#if MQX_ENABLE_USER_MODE
                ldr r4, =TASK_USER_MODE
                tst r1, r4                          // r1 still contain TD_FLAGS, check for user mode task
                bne _user_mode
                movs r0, #0                         // privilege mode
                b _load_control
ASM_LABEL(_user_mode)
                movs r0, #1                         // user mode
ASM_LABEL(_load_control)
                msr CONTROL, r0
#endif

                msr PRIMASK, r4
                pop {r4}
                pop {pc}

 ASM_PUBLIC_END(_sched_execute_scheduler_internal)


/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : _mqx_api_call
 * Returned Value   : none
 * Comments         :
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(_mqx_api_call)
 ASM_PUBLIC_FUNC(_mqx_api_call)
ASM_LABEL(_mqx_api_call)

#if MQX_ENABLE_USER_MODE
                push {lr}
                svc SVC_MQX_FN
#endif
ASM_LABEL(_mqx_api_call_end)
                b _mqx_api_call_end
 ASM_PUBLIC_END(_mqx_api_call)

#if MQX_ENABLE_USER_MODE
ASM_LABEL(_mqx_api_call_handler_epilogue)
                push {r0, r1, r2}

                // get active task descriptor
                GET_KERNEL_DATA r0
                ldr r0, [r0, #KD_ACTIVE_PTR]

                // set task flag to privilege mode
                ldr r1, [r0, #TD_FLAGS]

                ldr r2, =0x10   // #MQX_USER_TASK
                tst r1, r2
                beq _mqx_api_call_handler_epilogue_end

                ldr r2, =TASK_USER_MODE
                orrs r1, r1, r2
                str r1, [r0, #TD_FLAGS]

                // user mode, proc stack
                movs r0, #3
                msr CONTROL, r0

ASM_LABEL(_mqx_api_call_handler_epilogue_end)
                pop {r0, r1, r2, pc}

ASM_LABEL(_mqx_api_call_handler_prologue)
                mrs r1, PSP

                // modify stack - return adress from svc
                ldr r0, =_mqx_api_call_handler
                //bic r0, r0, #1
                str r0, [r1, #24]                                        // set stacked PC to requested mqx fn

                // modify stack - return address from mqx api
                ldr r0, =_mqx_api_call_handler_epilogue
                //bic r0, r0, #1
                str r0, [r1, #20]                                        // set stacked LR to _mqx_fn_handler_epilogue

                // get active task descriptor
                GET_KERNEL_DATA r0
                ldr r0, [r0, #KD_ACTIVE_PTR]

                // set task flag to privilege mode
                ldr r1, [r0, #TD_FLAGS]
                ldr r2, =TASK_USER_MODE
                bics r1, r1, r2
                str r1, [r0, #TD_FLAGS]

                // privilege mode
                movs r0, #0
                msr CONTROL, r0

                cpsie i

                bx lr

#endif

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : _task_block
 * Returned Value   : none
 * Comments         : task block function - block actual task - switch to another
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(_task_block)
 ASM_PUBLIC_FUNC(_task_block)
ASM_LABEL(_task_block)

                // store active task registers
                STORE_ALL_REGISTERS
                //disable interrupts
                cpsid i

                GET_KERNEL_DATA r0
                ldr r3, [r0, #KD_ACTIVE_PTR]        // get active task descriptor
                str r1, [r3, #TD_STACK_PTR]         // store task SP to task descriptor td


                // set task block bit
                ldr r2, [r3, #TD_STATE]
                movs r1, #1                        // TODO change from number to define
                orrs r2, r2, r1
                str r2, [r3, #TD_STATE]

#if MQX_KERNEL_LOGGING
                KLOG r0, ASM_PREFIX(_klog_block_internal)        // kernel log this function
#endif // MQX_KERNEL_LOGGING
                // remove active task from ready queue
                ldr r2, [r3, #TD_TD_PREV]           // get ptr to ready_q structure
                ldr r1, [r3, #TD_TD_NEXT]
                str r1, [r2, #RQ_HEAD_READY_Q]
                str r2, [r1, #TD_TD_PREV]

                b sched_internal   // Search for the next task in the ready queue.


 ASM_PUBLIC_END(_task_block)


/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : _int_kernel_isr
 * Returned Value   : none
 * Comments         : MQX kernel interrupt handler
 *
 *END*----------------------------------------------------------------------*/

// kernel interrupt handler
 ASM_PUBLIC_BEGIN(_int_kernel_isr)
 ASM_PUBLIC_FUNC(_int_kernel_isr)
ASM_LABEL(_int_kernel_isr)
                mrs  r0, PRIMASK
                cpsid i
                push {lr}
                push {r0}

                GET_KERNEL_DATA r3              // get the kernel data address

                // increment in interrupt counter
                ldrh r1, [r3, #KD_IN_ISR]
                adds r1, r1, #1
                strh r1, [r3, #KD_IN_ISR]

                // create interrupt content
                ldr r0, =0                      // error code (set 0)
                push {r0}                       // store in stack
                mrs r1, IPSR                    // exception number
                ldr r0, [r3, #KD_INTERRUPT_CONTEXT_PTR] // previous interrupt content
                push {r0-r1}                    // store in stack

                mrs r0, MSP                     // get address of interrupt content
                str r0, [r3, #KD_INTERRUPT_CONTEXT_PTR] // store address of actual interrupt content in kernel data

                mov r0, r1

#if MQX_KERNEL_LOGGING
                ldr r1, [r3, #KD_LOG_CONTROL]
                cmp r1, #0x00000001
                beq _isr_no_logging

                // prepare parameters for klog function
                push {r0-r3}
                bl ASM_PREFIX(_klog_isr_start_internal)
                pop {r0-r3}
ASM_LABEL(_isr_no_logging)
#endif // MQX_KERNEL_LOGGING
                // get C function address from MQX interrupt table
                // r0 - interrupt number

                // check if isr is in table range
                ldr r2, [r3, #KD_LAST_USER_ISR_VECTOR]

                // cbz r2, _isr_run_default       // isr not used (cbz not working in CW)
                cmp r2, #0
                bne _isr_skip_run_default1       // isr not used (this is CW workaround)
                b _isr_run_default
ASM_LABEL(_isr_skip_run_default1)

                cmp r0, r2
                bhi _isr_run_default

                ldr r2, [r3, #KD_FIRST_USER_ISR_VECTOR]
                subs r1, r0, r2                         // r1 = actual exception number in table
                blt _isr_run_default

#if MQX_SPARSE_ISR_TABLE

ASM_LABEL(_int_kernel_isr_vect_ok)
                ldr r2, [r3, #KD_INTERRUPT_TABLE_PTR]   // get the interrupt table pointer
                lsrs r1, r1, #MQX_SPARSE_ISR_SHIFT
                lsls r1, r1, #2

                ldr r1, [r2, r1]                        // get address of first isr in linked list

                // cbz r1, _isr_run_default              // isr not used (cbz not working in CW)
                cmp r1, #0
                bne _isr_skip_run_default2              // isr not used (this is CW workaround)
                b _isr_run_default
ASM_LABEL(_isr_skip_run_default2)

                // r1 - address of first isr in linked list
ASM_LABEL(_isr_search)
                ldr r2, [r1, #HASH_ISR_NUM]             // get isr num
                cmp r2, #0
                beq _isr_search_fail

                cmp r2, r0                              // compare isr number in record with actual isr number
                beq _isr_search_suc

                ldr r1, [r1, #HASH_ISR_NEXT]            // next vector in list
                tst r1, r1
                bne _isr_search

ASM_LABEL(_isr_search_fail)
                b _isr_run_default

ASM_LABEL(_isr_search_suc)
                ldr r0, [r1, #HASH_ISR_DATA]            // move notifier data into r0 = first parameter in C func
                ldr r2, [r1, #HASH_ISR_ADDR]            // move interrupt function address to r2

#else /* MQX_SPARSE_ISR_TABLE */

ASM_LABEL(_int_kernel_isr_vect_ok)
                // calculate offset in table
                // each table entry is 12 bytes in size
                movs r2, #12
                muls r1, r2, r1

                ldr r2, [r3, #KD_INTERRUPT_TABLE_PTR]       // pointer to interrupt table begin
                add r1, r1, r2                              // get address of entry in table
                ldr r2, [r1, #0]
                ldr r0, [r1, #IT_APP_ISR_DATA]              // move notifier data into r0 = first parameter in C func
#endif /* MQX_SPARSE_ISR_TABLE */

ASM_LABEL(_isr_execute)
                // r0 = first parameter in C func
                // r2 contain interrupt function address

                cpsie i
                //MSR PRIMASK, R11
                push {r3}

                blx r2

ASM_LABEL(_int_kernel_isr_epilog)

                pop {r3}
                //MRS  R11, PRIMASK
                cpsid i

ASM_LABEL(_int_kernel_isr_return_internal)

#if MQX_KERNEL_LOGGING
                ldr r1, [r3, #KD_LOG_CONTROL]
                cmp r1, #0x00000001
                beq _isr_return_no_logging

                mrs r0, IPSR                    // exception number

                // prepare parameters for klog function
                push {r0-r3}
                bl ASM_PREFIX(_klog_isr_end_internal)
                pop {r0-r3}
ASM_LABEL(_isr_return_no_logging)
#endif /* MQX_KERNEL_LOGGING */

                // remove interrupt content
                pop {r0-r1}
                str r0, [r3, #KD_INTERRUPT_CONTEXT_PTR] // update pointer to interrupt content

                pop {r0}                                // error code

                // decrement interrupt counter
                ldrh r1, [r3, #KD_IN_ISR]
                subs r1, r1, #1
                strh r1, [r3, #KD_IN_ISR]

                cmp r1, #0
                bne _isr_return_end        // waiting another isr, do not reschedule

                // check for reschedule
                // check preemtion
                ldr r2, [r3, #KD_ACTIVE_PTR]    // TD pointer
                ldr r0, [r2, #TD_FLAGS]
                ldr r1, =TASK_PREEMPTION_DISABLED
                tst r0, r1
                bne _isr_return_end

                // if a different TD at head of current readyq, then we need to run the scheduler
                // check for reschedule
                ldr r1, [r3, #KD_CURRENT_READY_Q]
                ldr r1, [r1]
                cmp r1, r2

                beq _isr_return_end

                // store rest of stack frame that is not stacked automatically by the HW when entering an exception
                // i.e. R11, R10, R9, R8, R7, R6, R5, R4, PRIMASK
                mrs r1, PSP
                // get PC and increment it by 1
                adds r1, r1, #24
                ldm r1!, {r0}
                adds r0, r0, #1
                subs r1, r1, #4
                stm r1!, {r0}
                subs r1, r1, #64
                //get PRIMASK from the main stack and store it in the process stack
                pop {r0}
                stm r1!, {r0}
                stm r1!, {r4-r7}
                mov r2, r8
                mov r3, r9
                mov r4, r10
                mov r5, r11
                stm r1!, {r2-r5}
                subs r1, r1, #36

                //store new PSP value into TD
                GET_KERNEL_DATA r0
                ldr r3, [r0, #KD_ACTIVE_PTR]        // get active task descriptor
                str r1, [r3, #TD_STACK_PTR]         // store task SP to task descriptor td

                b sched_internal

ASM_LABEL(_isr_return_end)
                pop {r0}
                msr PRIMASK, r0
                pop {pc}

ASM_LABEL(_isr_run_default)
                // r0 - interrupt number

                ldr r2, [r3, #KD_DEFAULT_ISR]

                b _isr_execute
 ASM_PUBLIC_END(_int_kernel_isr)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : _psp_exception_return
 * Returned Value   : none
 * Comments         : This functions returns us from an isr exception
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(_psp_exception_return)
 ASM_PUBLIC_FUNC(_psp_exception_return)
ASM_LABEL(_psp_exception_return)
                cpsid i
                push {r0, r1, r2, r4-r7}    // store parameter and registers which are used for copy and cpu do not store if

                GET_KERNEL_DATA r3

                // copy actual int context + 4WORDS -> prev int context - (1 + 8)WORDS
                ldr r2, [r3, #KD_INTERRUPT_CONTEXT_PTR]    // get actual int context
                adds r2, r2, #16               // calculate source address

                ldr r1, [r2]
                mov lr, r1                     // lr - return from exception... (0xfffffff1)
                adds r2, r2, #4                // increment r2 by 4

                // modify return address (PC) in exception stack frame (kernel isr epilog)
                ldr r0, =_int_kernel_isr_epilog
                movs r1, #1
                bics r0, r0, r1
                str r0, [r2, #24]

                ldmia r2, {r0-r7}              // read exception stack frame
                mov r8, r7

                pop {r7}                       // get prev int context address (function parameter - r0)

                // destination stack address (4B + 32B - exception stack frame)
                subs r7, r7, #4    //#36
                stm r7!, {r0-r6} //stmdb??
                subs r7, r7, #28
                mov r0, r7
                mov r7, r8
                stm r0!, {r7} //stmdb??
                subs r0, r0, #4

                // restore modified registers which are not restored by cpu
                pop {r1, r2, r4-r7}

                msr MSP, r0                    // update MSP (main stack pointer)

                cpsie i

                bx lr
 ASM_PUBLIC_END(_psp_exception_return)

/*******************************************************************************
 * test support
 ******************************************************************************/

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : _mem_test_and_set
 * Returned Value   :  previous value of location
 * Comments         :
 *   This function tests a byte location, and if AND 0x80 is 0 (7bit is set !!!), sets it to 0x80.
 *   It returns the previous value of the byte (0 or 0x80).
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(_mem_test_and_set)
 ASM_PUBLIC_FUNC(_mem_test_and_set)
ASM_LABEL(_mem_test_and_set)
                push {r1, r2, lr}

                ldrb r1, [r0]
                ldr r2, =0x80
                tst r1, r2
                bne _mem_test_and_set_0x80
                orrs r1, r1, r2
                strb r1, [r0]
                eors r0, r0
                b _mem_test_and_set_pop
ASM_LABEL(_mem_test_and_set_0x80)
                movs r0, #0x80

ASM_LABEL(_mem_test_and_set_pop)
                pop {r1, r2, pc}
 ASM_PUBLIC_END(_mem_test_and_set)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __get_PSP
 * Returned Value   : none
 * Comments         : This functions returns PSP register value
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__get_PSP)
 ASM_PUBLIC_FUNC(__get_PSP)
ASM_LABEL(__get_PSP)
                mrs r0, PSP
                bx lr
 ASM_PUBLIC_END(__get_PSP)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __get_MSP
 * Returned Value   : none
 * Comments         : This functions returns MSP register value
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__get_MSP)
 ASM_PUBLIC_FUNC(__get_MSP)
ASM_LABEL(__get_MSP)
                mrs r0, MSP
                bx lr
 ASM_PUBLIC_END(__get_MSP)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __set_MSP
 * Returned Value   : none
 * Comments         : This functions set MSP register value
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__set_MSP)
 ASM_PUBLIC_FUNC(__set_MSP)
ASM_LABEL(__set_MSP)
                msr MSP, r0
                bx lr
 ASM_PUBLIC_END(__set_MSP)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __get_PSR
 * Returned Value   : none
 * Comments         : This functions returns PSR (procesor status register) value
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__get_PSR)
 ASM_PUBLIC_FUNC(__get_PSR)
ASM_LABEL(__get_PSR)
        #ifdef __CWARM__
                 mrs r0, XPSR
        #else
                 mrs r0, PSR
        #endif
                 bx lr
 ASM_PUBLIC_END(__get_PSR)

/* IAR defines following functions internally */
#ifndef __IAR_SYSTEMS_ASM__

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __enable_interrupt
 * Returned Value   : none
 * Comments         :
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__enable_interrupt)
 ASM_PUBLIC_FUNC(__enable_interrupt)
ASM_LABEL(__enable_interrupt)
                 cpsie i
                 bx lr
 ASM_PUBLIC_END(__enable_interrupt)


/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __disable_interrupt
 * Returned Value   : none
 * Comments         :
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__disable_interrupt)
 ASM_PUBLIC_FUNC(__disable_interrupt)
ASM_LABEL(__disable_interrupt)
                 cpsid i
                 bx lr
 ASM_PUBLIC_END(__disable_interrupt)


 ASM_PUBLIC(__get_LR)
 ASM_PUBLIC(__get_PC)
 ASM_PUBLIC(__enable_interrupt)
 ASM_PUBLIC(__disable_interrupt)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __get_LR
 * Returned Value   : none
 * Comments         : This functions returns LR register value
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__get_LR)
 ASM_PUBLIC_FUNC(__get_LR)
ASM_LABEL(__get_LR)
                mov r0, lr
                bx lr
 ASM_PUBLIC_END(__get_LR)


/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __get_PC
 * Returned Value   : none
 * Comments         :  This functions returns PC register value
 *
 *END*----------------------------------------------------------------------*/

 ASM_PUBLIC_BEGIN(__get_PC)
 ASM_PUBLIC_FUNC(__get_PC)
ASM_LABEL(__get_PC)
                mov r0, PC
                bx lr
 ASM_PUBLIC_END(__get_PC)

/*FUNCTION*-------------------------------------------------------------------
 *
 * Function Name    : __get_CONTROL
 * Returned Value   : none
 * Comments         :
 *
 *END*----------------------------------------------------------------------*/
 ASM_PUBLIC(__get_CONTROL)
 ASM_PUBLIC_BEGIN(__get_CONTROL)
 ASM_PUBLIC_FUNC(__get_CONTROL)
ASM_LABEL(__get_CONTROL)
                mrs r0, CONTROL
                bx lr
 ASM_PUBLIC_END(__get_CONTROL)

#endif  /*__IAR_SYSTEMS_ASM__*/

 ASM_ALIGN(4)
 ASM_END


