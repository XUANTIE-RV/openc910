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
.include "core_lsu.s"



.macro EXIT
  la   x1, __exit
  jr   x1
.endm

.macro FAIL
  la   x1, __fail 
  jr   x1
.endm  

.macro MMU_PTW_1G VPN, PPN, FLAG, THEADFLAG
  #backup regs 
  addi	x2, x2, -56
  sd	x9, 0(x2)
  sd	x10, 8(x2)
  sd	x11, 16(x2)
  sd	x12, 24(x2)
  sd	x13, 32(x2)
  sd	x14, 40(x2)
  sd	x15, 48(x2)
   
  # get PPN from satp in x9
  csrr  x9, satp
  li    x10, 0xfffffffffff
  and   x9, x9, x10
  
  # get VPN2 in x10
  li    x10, \VPN
  li    x11, 0x7fc0000
  and   x10,x10,x11
  srli  x10, x10, 18    
   
  # cfig first-level page
  # level-1 page, entry addr:{ppn,VPN2,3'b0} in x15
  slli  x14, x9, 12
  slli  x11, x10, 3
  add   x15, x14, x11
  # write pte into level-1 page
  li    x11, \PPN
  li    x12, \THEADFLAG
  li    x13, \FLAG
  slli  x11, x11, 10
  slli  x12, x12, 59
  or    x11, x11, x12
  or    x11, x11, x13
  sd    x11, 0(x15)
  
  #restore regs
  ld	x9, 0(x2)
  ld	x10, 8(x2)
  ld	x11, 16(x2)
  ld	x12, 24(x2)
  ld	x13, 32(x2)
  ld	x14, 40(x2)
  ld	x15, 48(x2)
  addi	x2, x2, 56
  # fence 
  fence
.endm


.macro MMU_PTW_2M VPN, PPN, FLAG, THEADFLAG
  #backup regs 
  addi	x2, x2, -88
  sd	x9, 0(x2)
  sd	x10, 8(x2)
  sd	x11, 16(x2)
  sd	x12, 24(x2)
  sd	x13, 32(x2)
  sd	x14, 40(x2)
  sd	x15, 48(x2)
  sd	x16, 56(x2)
  sd	x17, 64(x2)
  sd	x18, 72(x2)
  sd	x19, 80(x2)
   
  # get PPN from satp in x9
  csrr  x9, satp
  li    x10, 0xfffffffffff
  and   x9, x9, x10
  
  # get VPN2 in x10
  li    x10, \VPN
  li    x11, 0x7fc0000
  and   x10,x10,x11
  srli  x10, x10, 18    
   
  # cfig first-level page
  # level-1 page, entry addr:{ppn,VPN2,3'b0} in x15
  slli  x14, x9, 12
  slli  x11, x10, 3
  add   x15, x14, x11
  # write pte into level-1 page
  # level-2 base addr in x12
  addi  x12, x10, 1
  add   x12, x12, x9
  slli  x14, x12, 10
  li    x13, 0xc1
  or    x13, x13, x14
  sd    x13, 0(x15)
  
  # cfig level-2 page
  # get VPN1 in x16
  li    x11, \VPN
  li    x13, 0x3fe00
  and   x16, x11, x13
  srli  x16, x16, 9  
  # level-2 page, entry addr:{pte.ppn,VPN1,3'b0} in x17
  slli  x13, x12, 12
  slli  x17, x16, 3
  add   x17, x17, x13
  # write pte into level-2 page
  li    x11, \PPN
  li    x12, \THEADFLAG
  li    x13, \FLAG
  slli  x11, x11, 10
  slli  x12, x12, 59
  or    x11, x11, x12
  or    x11, x11, x13
  sd    x11, 0(x17)
  
  #restore regs
  ld	x9, 0(x2)
  ld	x10, 8(x2)
  ld	x11, 16(x2)
  ld	x12, 24(x2)
  ld	x13, 32(x2)
  ld	x14, 40(x2)
  ld	x15, 48(x2)
  ld	x16, 56(x2)
  ld	x17, 64(x2)
  ld	x18, 72(x2)
  ld	x19, 80(x2)
  addi	x2, x2, 88
  # fence 
  fence
.endm

.macro MXSTATUS_THEADISAEE IMM
  #write cskyisaee
  li    x9,0x400000
  csrc  mxstatus,x9
  csrr  x9,mxstatus
  li    x10, \IMM
  slli  x10,x10,22
  or    x9,x9,x10
  csrw  mxstatus,x9
.endm

.macro MMU_EN
  #backup regs
  addi	x2, x2, -16
  sd	x9, 0(x2)
  sd	x10, 8(x2)

  #write MODE=8 to SATP
  csrr  x9,satp
  li    x10,0xfffffffffffffff
  and   x9,x9,x10
  li    x10,8
  slli  x10,x10,60
  or    x9,x9,x10
  csrw	satp, x9

  #restore regs
  ld	x10, 8(x2)
  ld	x9, 0(x2)
  addi	x2, x2, 16
.endm

.macro MMU_SATP_PPN PPN
  #backup regs
  addi	x2, x2, -16
  sd	x9,  0(x2)
  sd	x10, 8(x2)

  #write PPN
  csrr  x9, satp
  li	x10, 0xfffffffff0000000
  and   x9,x9,x10
  li    x10, \PPN
  or    x9,x9,x10
  csrw	satp,x9

  #restore regs
  ld	x10, 8(x2)
  ld	x9,  0(x2)
  addi	x2, x2, 8
.endm

.macro MMU_SATP_ASID ASID
  #backup regs
  addi	x2, x2, -16
  sd	x9,  0(x2)
  sd	x10, 8(x2)

  #write ASID
  csrr  x9, satp
  li	x10, 0xf0000fffffffffff
  and   x9,x9,x10
  li    x10, \ASID
  slli  x10,x10,44

  or    x9,x9,x10
  csrw	satp,x9

  #restore regs
  ld	x10, 8(x2)
  ld	x9,  0(x2)
  addi	x2, x2, 8
.endm

.macro MMODE_SMODE  SROUTINE
  #disable sie/mie
  li   x29, 0x2
  csrc mstatus,x29
  li   x29, 0x8
  csrc mstatus,x29
  #write mepc
  la x1,\SROUTINE
  csrw mepc,x1
  li x1,0x800
  csrrs x3,mstatus,x1
  li x1,0x1000
  csrrc x3,mstatus,x1
  mret
.endm

.macro MXSTATUS_MAEE IMM
  #write maee
  li    x9,0x200000
  csrc  mxstatus,x9
  csrr  x9,mxstatus
  li    x10, \IMM
  slli  x10,x10,21
  or    x9,x9,x10
  csrw  mxstatus,x9
.endm


.macro BHT_INV
 #backup regs
addi x2, x2, -16
sd x3, 0x0(x2)
sd x4, 0x8(x2)

#1
csrr	x3,mcor
li	x4,0x10000
or	x3,x3,x4
csrw	mcor,x3


 #restore regs
ld x3, 0x0(x2)
ld x4, 0x8(x2)
addi x2, x2, 16
.endm



.macro BR_PREDICTION_DIS
 #backup regs
addi x2, x2, -16
sd x3, 0x0(x2)

#1
csrr	x3,mhcr
andi	x3,x3,0xffffffffffffffdf
csrw	mhcr,x3

 #restore regs
ld x3, 0x0(x2)
addi x2, x2, 16
.endm
