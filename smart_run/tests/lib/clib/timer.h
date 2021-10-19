/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
/*
 * timer.h -- The interface functions and Mcros for SMART
 *
 */
#include "config.h"

#ifndef __CSKY_DEMO_TIMER_H
#define __CSKY_DEMO_TIMER_H

#define TIMER_PERIOD 0xffffffff

extern int Loop_Num;

typedef struct CKS_TIMER
{
    volatile unsigned int    LoadCount;		/* The value to be loaded into Timer */
    volatile unsigned int    CurrentValue;	/* Timer Current Value */
    volatile unsigned int    Control;		/* Timer Control Register */
    volatile unsigned int    EOI;		/* Timer Clears the interrupt status */
    volatile unsigned int    IntStatus;		/* Timer Contains the interrupt status */
}CKStruct_TIMER,* CKPStruct_TIMER;

#define SMART_TIMER_BASE          0x10011000

///* Contains the interrupt status of all timers in the component. */
//#define SMART_TIMER_INTSTATUS     0x10011028
//
///* Returns all zeroes (0) and clears all active interrupts */
//#define SMART_TIMER_EOI           0x1001102c
//
///* Contains the unmasked interrupt status of all timers in the component */
//#define SMART_TIMER_RAW_INTSTATUS (volatile unsigned int *)0x10011030

/*
 * Start timer.
 */
static int start_timer()
{
#if CONFIG_SYS_SPARK
    return 0;
#endif
  CKPStruct_TIMER pTimer = (CKPStruct_TIMER)(SMART_TIMER_BASE);
  pTimer->LoadCount = TIMER_PERIOD;
  asm("":::"memory");
  pTimer->Control = 0x00000003;
  return  pTimer->CurrentValue;
}


static int start_set_timer(int a)
{
#if CONFIG_SYS_SPARK
    return 0;
#endif
  CKPStruct_TIMER pTimer = (CKPStruct_TIMER)(SMART_TIMER_BASE);
  pTimer->LoadCount = a;
  asm("":::"memory");
  pTimer->Control = 0x00000003;
  return  pTimer->CurrentValue;
}

/*
 * Get timer value
 */
static int get_timer()
{
#if CONFIG_SYS_SPARK
    return 0;
#endif
  CKPStruct_TIMER pTimer = (CKPStruct_TIMER)(SMART_TIMER_BASE);
  return pTimer->CurrentValue;
}


/*
 * Stop timer
 */
static int stop_timer()
{
#if CONFIG_SYS_SPARK
    return 0;
#endif
  int temp;
  CKPStruct_TIMER pTimer = (CKPStruct_TIMER)(SMART_TIMER_BASE);
  temp = pTimer->CurrentValue;
  pTimer->Control = 0x00000002;
  return temp;
}

#endif /* __CSKY_DEMO_TIMER_H */

//Timer Interrupt Service
void CK_Timer_Interruptservice()
{
	volatile int eoi;
	CKPStruct_TIMER pTimer = (CKPStruct_TIMER)(SMART_TIMER_BASE);
	eoi = pTimer->EOI;
	Loop_Num++;
	//return Loop_Num;
}

void Timer_Interrupt_Init()
{
//	asm("lrw  r1, INTER_BEGIN\n"
//		".ifdef ck610\n"
//		"mfcr r2, cr1\n"
//		".else\n"
//		"mfcr r2, cr<1, 0>\n"
//		".endif\n"
//		"movi r3, 10\n"
//		"lsli r3, r3, 2\n"
//		"addu r2, r2, r3\n"
//		"st.w r1, (r2,0)\n"
//		"br INTER_END\n"
//		"INTER_BEGIN:\n"
//		"subi sp, 16\n"
//		"st.w r0, (sp)\n"
//		"st.w r13, (sp, 4)\n"
//		"st.w r14, (sp, 8)\n"
//		"st.w r15, (sp, 12)\n"
//		"subi sp, 16\n"
////		"st.w r8, (sp)\n"
////		"st.w r9, (sp, 4)\n"
////		"st.w r10, (sp, 8)\n"
////		"st.w r11, (sp, 12)\n"
////		"subi sp, 16\n"
//		"st.w r4, (sp)\n"
//		"st.w r5, (sp, 4)\n"
//		"st.w r6, (sp, 8)\n"
//		"st.w r7, (sp, 12)\n"
//		"subi sp, 16\n"
//		"st.w r0, (sp)\n"
//		"st.w r1, (sp, 4)\n"
//		"st.w r2, (sp, 8)\n"
//		"st.w r3, (sp, 12)\n"
//		"bsr CK_Timer_Interruptservice\n"
//		"ld.w r0, (sp)\n"
//		"ld.w r1, (sp, 4)\n"
//		"ld.w r2, (sp, 8)\n"
//		"ld.w r3, (sp, 12)\n"
//		"addi sp, 16\n"
//		"ld.w r4, (sp)\n"
//		"ld.w r5, (sp, 4)\n"
//		"ld.w r6, (sp, 8)\n"
//		"ld.w r7, (sp, 12)\n"
////		"addi sp, 16\n"
////		"ld.w r8, (sp)\n"
////		"ld.w r9, (sp, 4)\n"
////		"ld.w r10, (sp, 8)\n"
////		"ld.w r11, (sp, 12)\n"
//		"addi sp, 16\n"
//		"ld.w r0, (sp)\n"
//		"ld.w r13, (sp, 4)\n"
//		"ld.w r14, (sp, 8)\n"
//		"ld.w r15, (sp, 12)\n"
//		"addi sp, 16\n"
//		"rte\n"
//		"INTER_END:");
}

