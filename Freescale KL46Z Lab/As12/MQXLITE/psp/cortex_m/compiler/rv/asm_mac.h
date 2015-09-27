/**HEADER*********************************************************************
*
* Copyright (c) 2008 Freescale Semiconductor;
* All Rights Reserved
*
* Copyright (c) 2008 Embedded Access Inc.;
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
* $FileName: asm_mac.h$
* $Version : 3.8.1.0$
* $Date    : Aug-30-2011$
*
* Comments:
*   This file contains macros used by the Keil's UV4 assembler
*
*END*************************************************************************/

#ifndef __asm_mac_h__
#define __asm_mac_h__   1

#define ASM_PREFIX(x)   x

#define ASM_EXTERN(label)       EXTERN ASM_PREFIX(label)
#define ASM_PUBLIC(label)       EXPORT ASM_PREFIX(label)

#define ASM_LABEL(label)         label
#define ASM_EQUATE(label, value) label   EQU  value

#define ASM_ALIGN(value)        ALIGN value

#define ASM_SET(label,value)    label SETA value

#define ASM_CONST16(value)      DCWU value
#define ASM_CONST32(value)      DCDU value
#define ASM_LABEL_CONST32(label,value)  ASM_LABEL(label) ASM_CONST32(value)
#define ASM_SECTION(name)       AREA  name
#define ASM_DATA_SECTION(name)  AREA |name|, DATA
#define ASM_CODE_SECTION(name)  AREA |name|, CODE
#define ASM_END                 END

#define ASM_COMP_SPECIFIC_DIRECTIVES
#define ASM_PUBLIC_BEGIN(name)
#define ASM_PUBLIC_FUNC(name)
#define ASM_PUBLIC_END(name)
 PRESERVE8 {TRUE}

#endif /* __asm_mac_h__ */
