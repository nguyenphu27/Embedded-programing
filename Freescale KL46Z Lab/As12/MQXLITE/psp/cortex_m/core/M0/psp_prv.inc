/*HEADER***********************************************************************
*
* Copyright (c) 2010-2012 Freescale Semiconductor;
* All Rights Reserved
*
*******************************************************************************
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
*******************************************************************************
*
* $FileName: psp_prv.inc$
* $Version : 3.8.12.0$
* $Date    : Sep-19-2011$
*
* Comments:
*   This assembler header file contains private declarations for
*   use with the mqx assembler files
*
*END***************************************************************************/

#include "asm_mac.h"
#include "mqx_cnfg.h"

/*****************************************************************************
 *                         EXTERNAL REFERENCES
 *****************************************************************************/

#if MQX_KERNEL_LOGGING
        ASM_EXTERN(_klog_block_internal)
        ASM_EXTERN(_klog_execute_scheduler_internal)
        ASM_EXTERN(_klog_yield_internal)
        ASM_EXTERN(_klog_context_switch_internal)
        ASM_EXTERN(_klog_isr_start_internal)
        ASM_EXTERN(_klog_isr_end_internal)
#endif
        ASM_EXTERN(_mqx_kernel_data)
        ASM_EXTERN(_mqx_system_stack)

        ASM_EXTERN(_psp_irq_sp)
        ASM_EXTERN(_psp_fiq_sp)
        ASM_EXTERN(_psp_undef_sp)
        ASM_EXTERN(_psp_abort_sp)

/*****************************************************************************
 *                       CONSTANT DECLARATIONS
 *
 * The following are the bits in the CONFIG field of the kernel data structure
 * to set for the psp options.
 * NOTE: These must agree with values in mqx_prv.h or mqxlite_prv.h
 *
 *****************************************************************************/

ASM_EQUATE(PSP_CNFG_MQX_KERNEL_LOGGING, 0x8000)
ASM_EQUATE(PSP_CNFG_FP_REGISTERS_EXIST, 0x4000)

#ifndef MQX_FP_REGISTERS_EXIST
#define MQX_FP_REGISTERS_EXIST 0
#endif

#if MQX_KERNEL_LOGGING == 1
#if MQX_FP_REGISTERS_EXIST == 1
ASM_EQUATE(PSP_CNFG, (PSP_CNFG_MQX_KERNEL_LOGGING | PSP_CNFG_FP_REGISTERS_EXIST))
#else
ASM_EQUATE(PSP_CNFG, PSP_CNFG_MQX_KERNEL_LOGGING)
#endif
#else
#if MQX_FP_REGISTERS_EXIST == 1
ASM_EQUATE(PSP_CNFG, PSP_CNFG_FP_REGISTERS_EXIST)
#else
ASM_EQUATE(PSP_CNFG, 0)
#endif
#endif


/*
 * Task FLAGS bits
 * These must match definitions in mqx_prv.h
 */

ASM_EQUATE(FP_TASK_MASK, 0x0002)
ASM_EQUATE(FP_CONTEXT_SAVED_MASK, 0x0200)
ASM_EQUATE(FP_CONTEXT_CLEAR_MASK, 0xfdff)
ASM_EQUATE(PREEMPTION_DISABLED, 0x1000)

/*****************************************************************************
 *                      MACRO DECLARATIONS
 *****************************************************************************/
#ifdef __IASMARM__ /* IAR */

/* This macro returns the address of the kernel data in the specified register */
GET_KERNEL_DATA MACRO reg
        ldr reg, =ASM_PREFIX(_mqx_kernel_data)
        ldr reg, [reg, #0]
        ENDM

SET_FUNCTION_ALIGNMENT MACRO
                ALIGNROM 2
        ENDM

/* This macro calls the kernel logging function, if logging enabled */
KLOG    MACRO KDATA, KLOG_FUNCTION
#if MQX_KERNEL_LOGGING
        LOCAL klog_end
        push {r0, r2, r3}
        ldr r2, [KDATA, #KD_LOG_CONTROL]
        cmp r2, #1
        beq klog_end
                
        push {lr}
        bl KLOG_FUNCTION
        pop {r2}
        mov lr, r2
klog_end:
        pop {r0, r2, r3}
#endif
        ENDM

/* This macro stores active task registers in the following order (from higher addresses to lower addresses):
   xPSR, PC, LR, R12, R3, R2, R1, R0, R11, R10, R9, R8, R7, R6, R5, R4, PRIMASK */
STORE_ALL_REGISTERS MACRO
        push {r0-r7} //r0-r4 will be later overwritten
        mov r0, r8
        mov r1, r9
        mov r2, r10
        mov r3, r11
        push {r0-r3}
        push {r4-r7}
        mrs  r4, PRIMASK
        push {r4}
        mrs r1, PSP //PSP must be kept in r1
        //get APSR and orr it with 0x01000000 (thumb bit set)
        mrs r5, APSR 
        ldr r6, =0x01000000
        orrs r5, r5, r6
        mov r2, r12
        mov r3, lr
        mov r4, lr //pc
        mov r0, r1
        adds r0, r0, #52
        stm r0!, {r2-r5}
        ENDM
 
#elif defined __CC_ARM /* Keil */

/* This macro returns the address of the kernel data in the specified register */
        MACRO
        GET_KERNEL_DATA $reg
        ldr $reg, =ASM_PREFIX(_mqx_kernel_data)
        ldr $reg, [$reg, #0]
        MEND

        MACRO
        SET_FUNCTION_ALIGNMENT
        ALIGN 2
        MEND

        MACRO
        KLOG $KDATA, $KLOG_FUNCTION
#if MQX_KERNEL_LOGGING
        push {r0, r2, r3}
        ldr r2, [$KDATA, #KD_LOG_CONTROL]
        cmp r2, #1
        beq %FT1

        push {lr}
        bl $KLOG_FUNCTION
        pop {r2}
        mov lr, r2
1
        pop {r0, r2, r3}
#endif
        MEND

/* This macro stores active task registers in the following order (from higher addresses to lower addresses):
   xPSR, PC, LR, R12, R3, R2, R1, R0, R11, R10, R9, R8, R7, R6, R5, R4, PRIMASK */
        MACRO
        STORE_ALL_REGISTERS
        push {r0-r7} //r0-r4 will be later overwritten
        mov r0, r8
        mov r1, r9
        mov r2, r10
        mov r3, r11
        push {r0-r3}
        push {r4-r7}
        mrs  r4, PRIMASK
        push {r4}
        mrs r1, PSP //PSP must be kept in r1
        //get APSR and orr it with 0x01000000 (thumb bit set)
        mrs r5, APSR 
        ldr r6, =0x01000000
        orrs r5, r5, r6
        mov r2, r12
        mov r3, lr
        mov r4, lr //pc
        mov r0, r1
        adds r0, r0, #52
        stm r0!, {r2-r5}
        MEND

#else  /* CW */

/* This macro returns the address of the kernel data in the specified register */
.macro GET_KERNEL_DATA reg
        ldr \reg, =ASM_PREFIX(_mqx_kernel_data)
        ldr \reg, [\reg, #0]
        .endm

.macro SET_FUNCTION_ALIGNMENT
        .align 2
        .endm

/* This macro calls the kernel logging function, if logging enabled */
.macro KLOG KDATA,KLOG_FUNCTION
        .if MQX_KERNEL_LOGGING
        push {r0, r2, r3}
        ldr r2, [\KDATA, #KD_LOG_CONTROL]
        cmp r2, #1
        beq klog_end\@

        push {lr}
        bl \KLOG_FUNCTION
        pop {r2}
        mov lr, r2
klog_end\@:
        pop {r0, r2, r3}
        .endif
        .endm

/* This macro stores active task registers in the following order (from higher addresses to lower addresses):
   xPSR, PC, LR, R12, R3, R2, R1, R0, R11, R10, R9, R8, R7, R6, R5, R4, PRIMASK */
STORE_ALL_REGISTERS: .macro
        push {r0-r7} //r0-r4 will be later overwritten
        mov r0, r8
        mov r1, r9
        mov r2, r10
        mov r3, r11
        push {r0-r3}
        push {r4-r7}
        mrs  r4, PRIMASK
        push {r4}
        mrs r1, PSP //PSP must be kept in r1
        //get APSR and orr it with 0x01000000 (thumb bit set)
        mrs r5, APSR 
        ldr r6, =0x01000000
        orrs r5, r5, r6
        mov r2, r12
        mov r3, lr
        mov r4, lr //pc
        mov r0, r1
        adds r0, r0, #52
        stm r0!, {r2-r5}
        .endm

#endif
