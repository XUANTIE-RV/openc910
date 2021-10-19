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
#include "stdio.h"

#define PLIC_BASEADDR          ((unsigned int *) 0xb0000000)
#define PLIC_CORE0_INT_PRIO    ((unsigned int *) 0xb0000000)	// No INT 0, starting at INT 1 (0xb0000004)
#define PLIC_CORE0_INT_PEND    ((unsigned int *) 0xb0001000)
#define PLIC_CORE0_INT_MIE     ((unsigned int *) 0xb0002000)
#define PLIC_CORE0_INT_MTH     ((unsigned int *) 0xb0200000)
// #define INTCLAIM               0x200004
#define PLIC_CORE0_MCLAIM      ((unsigned int *) 0xb0200004)
// #define INTIE_HART             0x80
// #define INTHC_HART             0x1000

/*
 * `define PS2_BASE_START 32'h10011000
 * `define PS2_BASE_END   32'h10011fff
 * offset	 access       reg name
 * 0x0        rw       timer 1 load cnt
 * 0x4        ro       timer 1 current value
 * 0x8        rw       timer 1 ctrl reg
 *                     [2] int_mask
 *                         : 0: Int can be set       1: Int masked
 *                     [1] mode
 *                         : 0: reload 32'hffffffff  1: reload load cnt
 * 	               [0] enable
 *                         : 0: disable counting     1: enable count
 *                         : 0->1: reload counter
 * 0xc        ro       timer 1 clear (by read)
 * 0x10       ro       timer 1 int status
 * ---
 * 0x14                timer 2 load cnt
 * ---
 * 0x28                timer 3 load cnt
 * ---
 * 0x3c                timer 4 load cnt
 * ---
 * 0xa4       ro       clear all timers (by read)
*/
#define SMART_TIMER_BASE_ADDR      ((unsigned int *) 0x10011000)
#define SMART_TIMER_1_RELOAD_VAL   ((unsigned int *) 0x10011000)
#define SMART_TIMER_1_CTRL         ((unsigned int *) 0x10011008)
#define SMART_TIMER_1_CLEAR        ((unsigned int *) 0x1001100c)
#define SMART_TIMER_CLEAR_ALL      ((unsigned int *) 0x100110a4)
#define SMART_TIMER_2_CTRL         ((unsigned int *) 0x1001101c)
#define SMART_TIMER_3_CTRL         ((unsigned int *) 0x10011030)
#define SMART_TIMER_4_CTRL         ((unsigned int *) 0x10011044)

/*
 * PMU
 * `define PS3_BASE_START 32'h40016000
 * `define PS3_BASE_END   32'h40016fff
 * offset	 access       reg name
 *  0x0                       ctrl_reg
 *                              [3]: counter_en
 *                              [2]: debug_ctl_en
 *                              [1]: event_ctl_en
 *                              [0]: wic_ctl_en
 *  0x4                       counter_load
 *  0x8                       lp_mode_sel
 *                              [4]: pwr_off 
 *                              [3]: ret_pwr_off
 *                              [2]: clk_off
 *                              [1]: clk_slow
 *                              [0]: normal
 *                             
*/
#define SMART_PMU_BASE_ADDR        ((unsigned int *) 0x10016000)
#define SMART_PMU_CTRL_REG_ADDR    ((unsigned int *) 0x10016000)
#define SMART_PMU_LP_MODE_SEL_ADDR ((unsigned int *) 0x10016008)

__attribute__ ((interrupt ("machine"))) void plic_mint_handler(void)
{
  unsigned int plic_int_id;
  plic_int_id = *(PLIC_CORE0_MCLAIM);
  *(SMART_TIMER_1_CTRL) &= ~(1UL << 0);
  printf("\n     Inside plic_mint_handler() \n");
  printf("       Claim plic INT ID: %d \n", plic_int_id);
  printf("       Timer 1 Disabled. \n");

  *(PLIC_CORE0_MCLAIM) = plic_int_id;
}

int main (void)
{
  unsigned int vt_addr;
  volatile unsigned int* vt_addr_ptr;
  volatile unsigned int int_tmp;
  volatile unsigned int csr_mexstatus_val; 
  volatile unsigned int mie_meie_val; 
  
  // Disable Interrupt and Cache globally
  asm(
    "csrci mstatus, 0x8\n\t"
    "dcache.call\n\t"
    "sync\n\t"
    "csrci mhcr, 0x1\n\t"
    "csrci mhcr, 0x2\n\t"
    "sync\n\t"
  );

  printf("\n Disable APB timers ... \n");

  // Disable and clear the four timers connected to 
  // the PLIC external interrupt pins
  *(SMART_TIMER_1_CTRL) = 0x2;
  *(SMART_TIMER_2_CTRL) = 0x2;
  *(SMART_TIMER_3_CTRL) = 0x2;
  *(SMART_TIMER_4_CTRL) = 0x2;
  asm(
    "sync\n\t"
  );
  int_tmp = *(SMART_TIMER_CLEAR_ALL);   // Clear all the pending INT

  printf("\n Reprogram some vector table entries ... \n");
  // Program the vector table 
  asm(
    "la %[addr], vector_table+128\n\t"
    : [addr]"=r"(vt_addr)
  );

  vt_addr_ptr = (unsigned int *) vt_addr;
  *(vt_addr_ptr + 22)     = ((unsigned int) &plic_mint_handler + 4);	// '+4' to complement the '-4' in our legacy  __synchronous_exception
  asm(
    "sync\n\t"
  );

  printf("   Vector Table Address = %0x \n", vt_addr_ptr);
  printf("   11  Entry Addr: %0x, mem val: %0x \n", vt_addr_ptr + 22, *(vt_addr_ptr + 22));

  printf("\n Config PLIC ... \n");
  *(PLIC_CORE0_INT_PRIO + 18)  = 0x1f; 
  *(PLIC_CORE0_INT_MIE)       |= 1UL << 18; 
  *(PLIC_CORE0_INT_MTH + 18)   = 0x0;

  printf("\n Enable interrupt globally  ... \n");
  mie_meie_val = 1UL << 11;
  asm(
    // enable cpu int
    "csrsi mstatus, 0x8\n\t"	
    // enable mie.meie   
    "csrs mie, %[mie_set_mask_val]\n\t"
    :
    : [mie_set_mask_val]"r"(mie_meie_val)
  );

  asm("sync\n\t");
  // //**********************************************************************
  // // 1st sleep test: Fast sleep
  // //**********************************************************************
  printf("\n 1st sleep test: Fast sleep ... \n");
  // Config PMU lp_mode_sel = normal
  *(SMART_PMU_LP_MODE_SEL_ADDR) = 0x1;

  // Config and enable Timer 1
  printf("   Enable APB timer 1 to interrupt the CPU in 8000 cycles \n");
  *(SMART_TIMER_1_RELOAD_VAL) = 8000;
  *(SMART_TIMER_1_CTRL)      |= 1UL << 0;
  // Go sleep by executing WFI
  printf("   CPU goes to sleep now \n");
  asm("wfi\n\t");
  printf("   CPU has been woken up \n");


  //**********************************************************************
  // 2nd sleep test: Slow down clock
  //**********************************************************************
  // Config and enable Timer 1
  printf("\n 2nd sleep test: Slow down clock ... \n");
  // Config PMU lp_mode_sel = clk_slow
  *(SMART_PMU_LP_MODE_SEL_ADDR) = 0x2;
  // Enable WIC event to trigger wakeup
  *(SMART_PMU_CTRL_REG_ADDR)    = 0x1; 

  // Config and enable Timer 1
  printf("   Enable APB timer 1 to interrupt the CPU in 8000 cycles \n");
  *(SMART_TIMER_1_RELOAD_VAL) = 8000;
  *(SMART_TIMER_1_CTRL)      |= 1UL << 0;

  // Go sleep by executing WFI
  printf("   CPU goes to sleep now \n");
  asm("wfi\n\t");
  printf("   CPU has been woken up \n");

  //**********************************************************************
  // 3rd sleep test: Turn off clock
  //**********************************************************************
  // Config and enable Timer 1
  printf("\n 3rd sleep test: Shut down clock ... \n");
  // Config PMU lp_mode_sel = clk_off
  *(SMART_PMU_LP_MODE_SEL_ADDR) = 0x4;
  // Enable WIC event to trigger wakeup
  *(SMART_PMU_CTRL_REG_ADDR)    = 0x1; 

  // Config and enable Timer 1
  printf("   Enable APB timer 1 to interrupt the CPU in 8000 cycles \n");
  *(SMART_TIMER_1_RELOAD_VAL)   = 8000;
  *(SMART_TIMER_1_CTRL)        |= 1UL << 0;

  // Go sleep by executing WFI
  printf("   CPU goes to sleep now \n");
  asm("wfi\n\t");
  printf("   CPU has been woken up \n");

  //**********************************************************************
  // 4th sleep test: Retention -> power down -> power up -> resume
  //**********************************************************************
  // Config and enable Timer 1
  printf("\n 4th sleep test: Retention -> power down -> power up -> resume ... \n");
  // Config PMU lp_mode_sel = ret_pwr_off
  *(SMART_PMU_LP_MODE_SEL_ADDR)  = 0x8;
  // Enable WIC event to trigger wakeup
  *(SMART_PMU_CTRL_REG_ADDR)     = 0x1; 

  // Config and enable Timer 1
  printf("   Enable APB timer 1 to interrupt the CPU in 8000 cycles \n");
  *(SMART_TIMER_1_RELOAD_VAL) = 8000;
  *(SMART_TIMER_1_CTRL) |= 1UL << 0;

  // Go sleep by executing WFI
  printf("   CPU goes to sleep now \n");
  asm("wfi\n\t");
  printf("   CPU has been woken up \n");


  //**********************************************************************
  // End of Teset
  //**********************************************************************
  for(int i = 0; i <3000; i++) {
    asm volatile("nop\n\t");
  }
  printf("\n End of Sleep Test \n");
  return 0;
}

