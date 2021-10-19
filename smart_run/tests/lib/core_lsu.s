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
#D-cache operation

.macro SUM_EN
  #backup regs
  addi x2,x2,-16
  sd x9,0x0(x2)
  sd x10,0x8(x2)
  csrr x9,mstatus
  li x10,0x1
  slli x10,x10,18
  or x9,x9,x10
  csrw mstatus,x9
  ld x9,0x0(x2)
  ld x10,0x8(x2)
  addi x2,x2,16
.endm
.macro DATA_CAHE_WB
  csrsi mhcr,0x8
.endm

.macro DATA_CACHE_EN
#backup regs
  csrsi mhcr, 0x2
 # addi   x2, x2, -16
 # sd   x7, 0x0(x2)
 # sd   x8, 0x8(x2)

 # csrr   x7, mhcr
 # li    x8,0x1
 # slli  x8,x8,0x1 
 # or    x8,x8,x7
 # csrw   mhcr,x7

 # #restore regs
 # ld     x7, 0x0(x2)
 # ld     x8, 0x8(x2)
 # addi   x2, x2, 16
.endm

.macro DATA_CACHE_DIS
  #backup regs
  csrci mhcr,0x2
 # addi   x2, x2, -16
 # sd   x7, 0x0(x2)
 # sd   x8, 0x8(x2)

 # csrr   x7, mhcr
 # li    x8,-3
 # and    x8,x8,x7
 # csrw   mhcr,x7

 # #restore regs
 # ld     x7, 0x0(x2)
 # ld     x8, 0x8(x2)
 # addi   x2, x2, 16
  .endm

.macro DATA_CACHE_EN_NBK
  csrsi mhcr,0x2
.endm

.macro DATA_CACHE_EN_NONWA_NBK
  csrsi mhcr,0x2
  csrci mhcr,0x4
.endm

.macro DATA_CACHE_DIS_NBK
  csrci mhcr,0x2
.endm

.macro DATA_CACHE_INV
  #backup regs
  csrsi mcor,0x12
 # dcache.cva x2
 # addi    x2, x2, -4
 # st.w   x7, (x2)
 # dcache.cva x2
 # 
 # mfcr   x7, cr17
 # bclri  x7, 0 
 # bseti  x7, 1
 # bclri  x7, 2 
 # bclri  x7, 3
 # bseti  x7, 4
 # mtcr   x7, cr17

 # #restore regs
 # ld.w   x7, (x2)
 # addi   x2, x2, 4
.endm

#.macro DATA_CACHE_INV_ADDR ADDR_REG,IMM_REG
#  mtcr   \ADDR_REG,cr22
#  mfcr   \IMM_REG,cr17
#  
#  bclri  \IMM_REG,0
#  bseti  \IMM_REG,1
#  bseti  \IMM_REG,4
#  bclri  \IMM_REG,5
#  bseti  \IMM_REG,6
#  bclri  \IMM_REG,7
#
#  mtcr   \IMM_REG,cr17  
#.endm
#
#.macro DATA_CACHE_INV_SETWAY SETWAY_REG,IMM_REG
#  mtcr   \SETWAY_REG,cr22
#  mfcr   \IMM_REG,cr17
#  
#  bclri  \IMM_REG,0
#  bseti  \IMM_REG,1
#  bseti  \IMM_REG,4
#  bclri  \IMM_REG,5
#  bseti  \IMM_REG,6
#  bseti  \IMM_REG,7
#
#  mtcr   \IMM_REG,cr17  
#.endm

.macro DATA_CACHE_CLR
  #backup regs
  addi   x2, x2, -8
  sd   x7, 0x0(x2)

  li x7,0x22
  csrw mcor,x7
  
#  #restore regs
  ld     x7, 0x0(x2)
  addi   x2, x2, 8
.endm

.macro DATA_CACHE_CLR_NBK
  li    x30, 0x22
  csrw   mcor,x30
.endm

#.macro DATA_CACHE_CLR_ADDR ADDR_REG,IMM_REG
#  mtcr   \ADDR_REG,cr22
#  mfcr   \IMM_REG,cr17
#  
#  bclri  \IMM_REG,0
#  bseti  \IMM_REG,1
#  bclri  \IMM_REG,4
#  bseti  \IMM_REG,5
#  bseti  \IMM_REG,6
#  bclri  \IMM_REG,7
#
#  mtcr   \IMM_REG,cr17 
#.endm
#
#.macro DATA_CACHE_CLR_SETWAY SETWAY_REG,IMM_REG
#  mtcr   \SETWAY_REG,cr22
#  mfcr   \IMM_REG,cr17
#  
#  bclri  \IMM_REG,0
#  bseti  \IMM_REG,1
#  bclri  \IMM_REG,4
#  bseti  \IMM_REG,5
#  bseti  \IMM_REG,6
#  bseti  \IMM_REG,7
#
#  mtcr   \IMM_REG,cr17  
#.endm

.macro DATA_CACHE_CLIV 
  #backup regs
  addi    x2, x2, -8
  sd      x7, 0x0(x2)

  li     x7, 0x32
  csrw   mcor,x7

  #restore regs
  ld   x7, 0x0(x2)
  addi   x2, x2, 8

.endm

.macro DATA_CACHE_CLIV_NBK 
  li    x30, 0x32
  csrw   mcor,x30
.endm

#.macro DATA_CACHE_CLIV_ADDR ADDR_REG,IMM_REG
#  mtcr   \ADDR_REG,cr22
#  mfcr   \IMM_REG,cr17
#  
#  bclri  \IMM_REG,0
#  bseti  \IMM_REG,1
#  bseti  \IMM_REG,4
#  bseti  \IMM_REG,5
#  bseti  \IMM_REG,6
#  bclri  \IMM_REG,7
#
#  mtcr   \IMM_REG,cr17  
#.endm

#.macro DATA_CACHE_CLIV_SETWAY SETWAY_REG,IMM_REG
#  mtcr   \SETWAY_REG,cr22
#  mfcr   \IMM_REG,cr17
#  
#  bclri  \IMM_REG,0
#  bseti  \IMM_REG,1
#  bseti  \IMM_REG,4
#  bseti  \IMM_REG,5
#  bseti  \IMM_REG,6
#  bseti  \IMM_REG,7
#  mtcr   \IMM_REG,cr17  
#.endm

#Prefetch operation
.macro DATA_CACHE_L1_PREFETCH_EN DIS
  #backup regs
  addi  x2 , x2, -16
  sd   x7 , 0x0(x2)
  sd   x8 , 0x8(x2)
 
  csrr  x7 , mhint
  li x8,0x1
  slli x8,x8,2 #l1 prefetch
  or x7,x8,x7
  li x8,\DIS
  slli x8,x8,13 #l1 dis
  or x7,x8,x7

  csrw  mhint,x7
 
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi  x2 , x2,16
.endm

.macro DATA_CACHE_L2_PREFETCH_EN DIS
  #backup regs
  addi  x2 , x2, -16
  sd   x7 , 0x0(x2)
  sd   x8 , 0x8(x2)
 
  csrr  x7 , mhint
  li x8,0x1
  slli x8,x8,15 #l1 prefetch
  or x7,x8,x7
  li x8,\DIS
  slli x8,x8,16 #l1 dis
  or x7,x8,x7

  csrw  mhint,x7
 
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi  x2 , x2,16
.endm


.macro DATA_CACHE_L1_PREFETCH_DIS
  #backup regs
  csrci mhint,0x4
.endm

.macro DATA_CACHE_L2_PREFETCH_DIS
  #backup regs
  addi  x2 , x2, -16
  sd   x7 , 0x0(x2)
  sd   x8 , 0x8(x2)
  
  li  x7, 0xffffffffffff7fff
  csrr x8,mhint
  and x8,x8,x7
  csrw mhint,x8

  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi  x2 , x2,16
.endm

#.macro DATA_CACHE_PREFETCH_DISTANCE_4
#  #backup regs
#  subi  x2 , 4
#  st.w  x7 , (x2,0)
# 
#  mfcr  x7 , cr31
#  bseti x7 , 13
#  bseti x7 , 14
#  mtcr  x7 , cr31
# 
#  #restore regs
#  ld.w  x7 , (x2,0)
#  addi  x2 , 4
#.endm

#other
.macro MM_EN
  #backup regs
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)
  li    x9,0x8000
  csrc  mxstatus,x9
  csrr  x9,mxstatus
  li    x10, 1
  slli  x10,x10,15
  or    x9,x9,x10
  csrw  mxstatus,x9

  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi  x2 , x2,16
.endm

.macro AMR_EN
  #backup regs
  csrsi mhint, 0x8
.endm

.macro MM_DIS
  #backup regs
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mxstatus
  li  x8,0xffffffffffff7fff #l1 prefetch
  and    x7,x8,x7
  csrw  mxstatus,x7

  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
  .endm

.macro AMR_DIS
  csrci mhint,0x8
  .endm

.macro L1_ECC_EN
  #backup regs
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr x7, mhint
  li   x8,0x1
  slli x8,x8,19
  or   x7,x7,x8
  csrw mhint,x8

    #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro L1_ECC_DIS
  #backup regs
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr x7, mhint
  li   x8,0xfffffffffffbffff
  and  x7,x7,x8
  csrw mhint,x8

    #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro DCACHE_TAG_1BIT_ERR_INJ XN 
  li   \XN,0x2
  slli \XN,\XN,29
  ori  \XN,\XN,0x1
.endm

.macro DCACHE_DATA_1BIT_ERR_INJ XN 
  li   \XN,0x3
  slli \XN,\XN,29
  ori  \XN,\XN,0x1
.endm
.macro DCACHE_TAG_2BIT_ERR_INJ XN 
  li   \XN,0x2
  slli \XN,\XN,29
  ori  \XN,\XN,0x3
.endm
.macro DCACHE_DATA_2BIT_ERR_INJ XN 
  li   \XN,0x3
  slli \XN,\XN,29
  ori  \XN,\XN,0x3
.endm

.macro MCER_CHECK_ECC_VLD VLD FAIL
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mcer
  srli  x7,x7,31
  andi  x7,x7,1

  li   x8, \VLD
  bne x7,x8, \FAIL
  
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro MCER_ECC_VLD_CLEAR
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mcer
  li   x8, 0x7fffffff
  and x7,x8,x7
  csrw mcer,x7
  
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro MCER_CHECK_ERR_FATAL FATAL FAIL
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mcer
  srli  x7,x7,30
  andi  x7,x7,1


  li   x8, \FATAL
  bne x7,x8, \FAIL
  
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro MCER_CHECK_FIX_CNT FIXCNT FAIL
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mcer
  srli  x7,x7,24
  andi  x7,x7,0x3f


  li   x8,\FIXCNT
  bne x7,x8,\FAIL
  
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro MCER_CHECK_RAMID RAMID FAIL
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mcer
  srli  x7,x7,21
  andi  x7,x7,0x3


  li   x8,\RAMID
  bne x7,x8,\FAIL
  
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm
.macro MCER_CHECK_ERR_WAY ERR_WAY FAIL
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mcer
  srli  x7,x7,17
  andi  x7,x7,0x1


  li   x8,\ERR_WAY
  bne x7,x8,\FAIL
  
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro MCER_CHECK_ERR_INDEX ERR_INDEX FAIL
  addi  x2 , x2,-16
  sd  x7 , 0x0(x2)
  sd  x8 , 0x8(x2)

  csrr  x7,mcer
  li   x8,0x1ffff
  and  x7,x7,x8


  li   x8,\ERR_INDEX
  bne x7,x8,\FAIL
  
  #restore regs
  ld  x7 , 0x0(x2)
  ld  x8 , 0x8(x2)
  addi x2,x2,16
.endm

.macro DATA_CACHE_WA
  #backup regs
  csrsi mhcr,0x4
.endm

.macro DATA_CACHE_NWA
  #backup regs
  csrci mhcr,0x4
  .endm

#check the word from addr whether is that data
.macro CHK_ADDR_DATA ADDR, DATA,IMM_REG0,IMM_REG1
li       \IMM_REG0,\ADDR
lw      \IMM_REG0,(\IMM_REG0)
li       \IMM_REG1,\DATA
bne     \IMM_REG0,\IMM_REG1,__fail
.endm

.macro CHK_REG_VALUE REG,VALUE,IMM_REG0
li       \IMM_REG0,\VALUE
bne     \REG,\IMM_REG0,__fail
.endm
