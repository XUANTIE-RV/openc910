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
#start from __start,
#(1)initialize all registers
#(2)initialize supervisor mode stack pointer
#(3)set VBR register
#(4)construct PMP 
#(5)construct MMU 
#(6)enable control reg such as EE and MMU
#(9)jump to the main procedure using jmp to main
 .include "core_init.h"
	.text
	.global	__start
__start:


# enable extension
  li   x3, 0x400000
  csrs mxstatus,x3

# enable fpu
  li   x3, 0x6000
  csrs mstatus,x3

# enable vector
  li   x3, 0x800000
  csrs mstatus,x3

# enable unalign
  li   x3, 0x8000
  csrs mxstatus,x3

# mxstatus
  li   x3, 0x638000
  csrs mxstatus,x3
  
# msmpr
  csrsi msmpr, 0x1

# PART 1: initialize all registers
  li  x1, 0
  li  x2, 0
  li  x3, 0
  li  x4, 0
  li  x5, 0
  li  x6, 0
  li  x7, 0
  li  x8, 0
  li  x9, 0
  li  x10,0
  li  x11,0
  li  x12,0
  li  x13,0
  li  x14,0
  li  x15,0
  li  x16,0
  li  x17,0
  li  x18,0
  li  x19,0
  li  x20,0
  li  x21,0
  li  x22,0
  li  x23,0
  li  x24,0
  li  x25,0
  li  x26,0
  li  x27,0
  li  x28,0
  li  x29,0
  li  x30,0
  li  x31,0

## PART 2: initialize stack pointer & ppn
  csrr x3,mhartid
  li x4,1


  .global cpu_0_sp	
cpu_0_sp:
  la x2, __kernel_stack

# PART 3:initialize mtvec value  
  la    x3,__trap_handler
  csrw  mtvec,x3

  # enable mie
  li   x3, 0x8
  csrs mstatus,x3

  # invalid all memory for IBP,BTB,BHT,DCACHE,ICACHE
  li x3, 0x70013
  csrs 0x7c2,x3  #mcor
 
  # enable ICACHE,DCACHE,BHT,BTB,IBP,RAS,WA
  # li x3, 0x10f7
  # csrs 0x7c1,x3  #mhcr
  li x3, 0x11ff
  csrs mhcr,x3  #mhcr
  
  .global after_l2en 
after_l2en:
  # enable write allocate
  # li x3, 0x4
  # csrs 0x7c1,x3  #mhcr
  li x3, 0x11ff
  csrs mhcr,x3  #mhcr

  # enable lbuf,way_pred,data_cache_prefetch, amr
  # li x3, 0x7e30c
  # csrs 0x7c5,x3   #mhint
  li x3, 0x6e30c
  csrs mhint,x3   #mhint

  # mccr2
  li x3, 0xe0000009
  csrs mccr2,x3 

  jal	main

  .global __exit
__exit:
  addi x10,x0,0x0
  addi x1,x0,0x5a
  addi x2,x0,0x6b
  addi x3,x0,0x7c
  sync
  li   x3, 0x444333222
  add x4,x0,x3
#
  .global __fail
__fail:
  addi x10,x0,0x0
  addi x1,x0,0x2c
  addi x2,x0,0x3b
  sync
  li x3,0x2382348720

.section .text
__trap_handler:
  j __synchronous_exception
  .align 2
  j __asychronous_int
  .align 2
  nop #reserved
  .align 2
  j __asychronous_int
  .align 2
  j __asychronous_int
  .align 2
  j __asychronous_int
  .align 2
  nop #reserved
  .align 2
  j __asychronous_int
  .align 2
  j __asychronous_int
  .align 2
  j __asychronous_int
  .align 2
  nop #reserved
  .align 2
  j __asychronous_int
  j __fail

__synchronous_exception:
  #push
  sw   x13,-4(sp)
  sw   x14,-8(sp)
  sw   x15,-12(sp)
  csrr x14,mcause
  andi x15,x14,0x7ff    #cause
  srli x14,x14,0x3b   #int
  andi x14,x14,0x10   #mask bit
  add  x14,x14,x15    #{int,cause}

  slli x14,x14,0x3 #offset
  la   x15,vector_table
  add  x15,x14,x15  #target pc
  lw   x14, 0(x15)  #get exception addr
  lw   x13, -4(sp)  #recover x13
  lw   x15, -12(sp) #recover x15
  addi x14,x14,-4
  jr   x14

__asychronous_int:
  sw   x13,-4(sp)
  sw   x14,-8(sp)
  sw   x15,-12(sp)
  csrr x14,mcause
  andi x15,x14,0x7ff    #cause
  srli x14,x14,0x3b   #int
  andi x14,x14,0x10   #mask bit
  add  x14,x14,x15    #{int,cause}

  slli x14,x14,0x3   #offset
  la   x15,vector_table
  add  x15,x14,x15   #target pc
  lw   x14, 0(x15)   #get exception addr
  lw   x13, -4(sp)   #recover x13
  lw   x15, -12(sp)  #recover x15
  addi x14,x14,-4
  jr   x14

.global vector_table
 .align  10
  vector_table:   #totally 256 entries
  .rept   128
  .long   __fail
  .endr

  .global __dummy
__dummy:  
  
  .data
  nop
  nop
  nop


