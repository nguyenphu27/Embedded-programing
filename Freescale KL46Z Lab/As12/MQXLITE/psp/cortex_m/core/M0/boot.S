/**HEADER******************************************************************
*
* Copyright (c) 2010-2011 Freescale Semiconductor;
* All Rights Reserved
*
***************************************************************************
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
**************************************************************************
*
* $FileName: boot.S$
* $Version : 3.8.10.3$
* $Date    : Dec-2-2011$
*
* Comments:
*
*
*END************************************************************************/

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

#undef __ASM__


    ASM_COMP_SPECIFIC_DIRECTIVES

    ASM_CODE_SECTION(.text)

    SET_FUNCTION_ALIGNMENT

    ASM_PUBLIC(__boot)


/*FUNCTION*-------------------------------------------------------------------

 Function Name    : __boot
 Returned Value   :
 Comments         : startup sequence

 END*-----------------------------------------------------------------------*/

ASM_EQUATE(NVIC_ICER, 0xE000E180)
ASM_EQUATE(NVIC_ICPR, 0xE000E280)


 ASM_PUBLIC_BEGIN(__boot)
 ASM_PUBLIC_FUNC(__boot)
ASM_LABEL(__boot)
/* Disable interrupts and clear pending flags */
        ldr r0, =0xFFFFFFFF
        /* NVIC_ICER - Interrupt Clear-Enable Register     */
        ldr r1, =NVIC_ICER
        str r0, [r1]
        /* NVIC_ICPR - Interrupt Clear-Pending Register */
        ldr r1, =NVIC_ICPR
        str r0, [r1]

/* Prepare process stack pointer */
        mrs r0, MSP
        msr PSP, r0

/* Switch to proccess stack (PSP) */
        mrs r0, CONTROL
        movs r1, #0x2
        orrs r0, r0, r1
        msr CONTROL, r0
        isb


#if defined(__CODEWARRIOR__) || defined(__GNUC__)
        /* call startup from EWL library */
        ASM_EXTERN(__thumb_startup)
        bl ASM_PREFIX(__thumb_startup)
#elif defined(__IAR_SYSTEMS_ICC__)  || defined (__IASMARM__)
        ASM_EXTERN(__iar_program_start)
        bl ASM_PREFIX(__iar_program_start)
#elif defined(__CC_ARM)
        ASM_EXTERN(__thumb_startup)
        bl ASM_PREFIX(__thumb_startup)
#endif
 ASM_PUBLIC_END(__boot)


        ASM_ALIGN(4)
        ASM_END
