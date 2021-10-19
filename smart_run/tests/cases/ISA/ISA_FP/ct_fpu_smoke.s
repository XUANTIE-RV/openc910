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
.text
.align 6
.global main
main:

##############################################################
#             NUMBER and    MACRO DEFINITION
##############################################################
.set HpsNaN,    0x7c01
.set HnsNaN,    0xfc01
.set HpqNaN,    0x7e00
.set HnqNaN,    0xfe00
.set HpInf,     0x7c00
.set HnInf,     0xfc00
.set HpNorm,    0x3800    #//0.5
.set HnNorm,    0xb800    #//-0.5
.set HpDeNorm,  0x0001
.set HnDeNorm,  0x8001
.set HpZero,    0x0000
.set HnZero,    0x8000
.set HpLFN,     0x7bff
.set HnLFN,     0xfbff
.set HpMIN,     0x0400
.set HnMIN,     0x8400
.set HpSPECIAL_1,  0x0002    # // denorm+denrom
.set HnSPECIAL_1,  0x8002    # // -denorm + -denorm
.set HpOne,  0x3c00
.set HnOne,  0xbc00
.set HpONE,  0x3c00
.set HnONE,  0xbc00
.set Hp1p1,  0x3e00
.set Hn1p1,  0xbe00
.set HpDeNormMost, 0x03ff    
.set HnDeNormMost, 0x83ff


#//==========================================================
#// single format
#//==========================================================
.set SpsNaN,   0x7f800001 #//0_111'1111'1_000'0000'0000'0000'0000'0001
.set SnsNaN,   0xff800001 #//1_111'1111'1_000'0000'0000'0000'0000'0001
.set SpqNaN,   0x7fc00000 #//0_111'1111'1_100'0000'0000'0000'0000'0000
.set SnqNaN,   0xffc00000 #//1_111'1111'1_100'0000'0000'0000'0000'0000
.set SpInf,    0x7f800000 #//0_111'1111'1_000'0000'0000'0000'0000'0000
.set SnInf,    0xff800000 #//1_111'1111'1_000'0000'0000'0000'0000'0000
.set SpNorm,   0x3f000000 #//0_011'1111'0_000'0000'0000'0000'0000'0000 (+0.5)
.set SnNorm,   0xbf000000 #//1_011'1111'0_000'0000'0000'0000'0000'0000 (-0.5)
.set SpDeNorm, 0x00000001 #//0_000'0000'0_000'0000'0000'0000'0000'0001
.set SnDeNorm, 0x80000001 #//1_000'0000'0_000'0000'0000'0000'0000'0001
.set SpZero,   0x00000000 #//0_000'0000'0_000'0000'0000'0000'0000'0000
.set SnZero,   0x80000000 #//1_000'0000'0_000'0000'0000'0000'0000'0000
.set SpLFN,    0x7f7fffff #//0_111'1111'0_111'1111'1111'1111'1111'1111
.set SnLFN,    0xff7fffff #//1_111'1111'0_111'1111'1111'1111'1111'1111
.set SpMIN,    0x00800000 #//0_000'0000'1_000'0000'0000'0000'0000'0000 
.set SnMIN,    0x80800000 #//1_000'0000'1_000'0000'0000'0000'0000'0000 

.set SpSPECIAL_1,  0x00000002
.set SnSPECIAL_1,  0x80000002
.set SpOne,  0x3f800000
.set SnOne,  0xbf800000
.set SpONE,  0x3f800000
.set SnONE,  0xbf800000
.set Sp1p1,  0x3fc00000
.set Sn1p1,  0xbfc00000

.set SpDeNormMost,   0x007fffff    #//0_000'0000'0111'_ffff...ffff
.set SnDeNormMost,   0x807fffff    #//1_000'0000'0111'_ffff...ffff


#//==========================================================
#// double format
#//==========================================================
.set DpsNaN,    0x7ff0000000000001 #//0_111'1111'1111'_0000'0...0'0001
.set DpsNaNH,   0x7ff00000
.set DpsNaNL,   0x00000001
.set DnsNaN,    0xfff0000000000001 #//1_111'1111'1111'_0000'0...0'0001
.set DnsNaNH,   0xfff00000
.set DnsNaNL,   0x00000001
.set DpqNaN,    0x7ff8000000000000 #//0_111'1111'1111'_1000'0...0'0000
.set DpqNaNH,   0x7ff80000
.set DpqNaNL,   0x00000000
.set DnqNaN,    0xfff8000000000000 #//1_111'1111'1111'_1000'0...0'0000
.set DnqNaNH,   0xfff80000
.set DnqNaNL,   0x00000000
.set DpInf,     0x7ff0000000000000 #//0_111'1111'1111'_0000'0...0'0000
.set DpInfH,    0x7ff00000
.set DpInfL,    0x00000000
.set DnInf,     0xfff0000000000000 #//1_111'1111'1111'_0000'0...0'0000
.set DnInfH,    0xfff00000
.set DnInfL,    0x00000000
.set DpNorm,    0x3fe0000000000000 #//0_011'1111'1110'_0000'0...0'0000 (+0.5)
.set DpNormH,   0x3fe00000
.set DpNormL,   0x00000000
.set DnNorm,    0xbfe0000000000000 #//1_011'1111'1110'_0000'0...0'0000 (-0.5)
.set DnNormH,   0xbfe00000
.set DnNormL,   0x00000000
.set DpDeNorm,  0x0000000000000001 #//0_000'0000'0000'_0000'0...0'0001
.set DpDeNormH, 0x00000000
.set DpDeNormL, 0x00000001
.set DnDeNorm,  0x8000000000000001 #//1_000'0000'0000'_0000'0...0'0001
.set DnDeNormH, 0x80000000
.set DnDeNormL, 0x00000001
.set DpZero,    0x0000000000000000 #//0_000'0000'0000'_0000'0...0'0000
.set DpZeroH,   0x00000000
.set DpZeroL,   0x00000000
.set DnZero,    0x8000000000000000 #//1_000'0000'0000'_0000'0...0'0000
.set DnZeroH,   0x80000000
.set DnZeroL,   0x00000000
.set DpLFN,     0x7fefffffffffffff #//0_111'1111'1110'_1111'1...1'1111
.set DpLFNH,    0x7fefffff
.set DpLFNL,    0xffffffff 
.set DnLFN,     0xffefffffffffffff #//1_111'1111'1110'_1111'1...1'1111
.set DnLFNH,    0xffefffff 
.set DnLFNL,    0xffffffff
.set DpMIN,     0x0010000000000000 #//0_000'0000'0001'_0000'0...0'0000
.set DpMINH,    0x00100000
.set DpMINL,    0x00000000
.set DnMIN,     0x8010000000000000
.set DnMINH,    0x80100000
.set DnMINL,    0x00000000

.set DpSPECIAL_1,  0x0000000000000002
.set DnSPECIAL_1,  0x8000000000000002
.set DpOne,  0x3ff0000000000000
.set DnOne,  0xbff0000000000000
.set DpONE,  0x3ff0000000000000
.set DnONE,  0xbff0000000000000
.set Dp1p1,  0x3ff8000000000000
.set Dn1p1,  0xbff8000000000000


#//xuwj modified ,add SNaN,QNaN
.set DpqNaN2,   0x7ff800000000000f    #//0_111'1111'1111'_1000'0000...0'1111
.set DpqNaN3,   0x7ff80000000000f0    #//0_111'1111'1111'_1000'0000...'1111'0000
.set DnqNaN2,   0xfff8000000000f00    #//1_111'1111'1111'_1000'0000...0'1111'0000'0000
.set DnqNaN3,   0xfff800000000f000    #//1_111'1111'1111'_1000'0000...'1111'0000'0000'0000
.set DpsNaN2,   0x7ff00000000f0000    #//0_111'1111'1111'_0000'0...0'0001'0000'0000'0000'0000
.set DpsNaN3,   0x7ff0000000f00000    #//0_111'1111'1111'_0000'0...0'0001'0000'0000'0000'0000'0000
.set DnsNaN2,   0x7ff000000f000000    #//0_111'1111'1111'_0000'0...0'0001'0000'0000'0000'0000'0000'0000
.set DnsNaN3,   0x7ff00000f000000    #//0_111'1111'1111'_0000'0...0'0001'0000'0000'0000'0000'0000'0000'0000
.set DpDeNormMost,   0x000fffffffffffff    #//0_000'0000'0000'_ffff...ffff
.set DnDeNormMost,   0x800fffffffffffff    #//1_000'0000'0000'_ffff...ffff


#//==========================================================
#//    deformal
#//==========================================================
#// Single
.set SpNmMAX,  0x7f7fffff #//0_111'1111'0_111'1111'1111'1111'1111'1111
.set SpNmMIN,  0x00800000 #//0_000'0000'1_000'0000'0000'0000'0000'0000
.set SnNmMAX,  0xff7fffff #//1_111'1111'0_111'1111'1111'1111'1111'1111
.set SnNmMIN,  0x80800000 #//1_000'0000'1_000'0000'0000'0000'0000'0000
.set SpDmMAX,  0x007fffff #//0_000'0000'0_111'1111'1111'1111'1111'1111
.set SpDmMIN,  0x00000001 #//0_000'0000'0_000'0000'0000'0000'0000'0001
.set SnDmMAX,  0x807fffff #//1_000'0000'0_111'1111'1111'1111'1111'1111
.set SnDmMIN,  0x80000001 #//0_000'0000'0_000'0000'0000'0000'0000'0001
.set SpOne,    0x3f800000
.set SnOne,    0xbf800000
.set SpqNaN1,  0x7fc00001 #//0_111'1111'1_100'0000'0000'0000'0000'0000
.set SnqNaN1,  0xffc00001 #//1_111'1111'1_100'0000'0000'0000'0000'0000
.set SpOne,    0x3f800000
.set SnOne,    0xbf800000
#// Double
.set DpNmMAX,   0x7fefffffffffffff #//0_111'1111'1110'_1111'1...1'1111
.set DpNmMIN,   0x0010000000000000 #//0_000'0000'0001'_0000'0...0'0000
.set DnNmMAX,   0xffefffffffffffff #//1_111'1111'1110'_1111'1...1'1111
.set DnNmMIN,   0x8010000000000000
.set DpDmMAX,   0x000fffffffffffff #//0_000'0000'0000'_1111'1...1'1111
.set DpDmMIN,   0x0000000000000001 #//0_000'0000'0000'_0000'0...0'0001
.set DnDmMAX,   0x800fffffffffffff #//1_000'0000'0000'_1111'1...1'1111
.set DnDmMIN,   0x8000000000000001 #//1_000'0000'0000'_0000'0...0'0001
.set DpOne,     0x3ff0000000000000
.set DnOne,     0xbff0000000000000
.set DpqNaN1,   0x7ff8000000000001 #//0_111'1111'1111'_1000'0...0'0000
.set DnqNaN1,    0xfff8000000000001 #//1_111'1111'1111'_1000'0...0'0000
.set DpOne,     0x3ff0000000000000
.set DnOne,     0xbff0000000000000











.macro FPUMOVH FDESREG, IMME16, IMM_REG
    li \IMM_REG, \IMME16
    li x3, 0xffff0000
    or \IMM_REG,\IMM_REG,x3
    fmv.w.x \FDESREG, \IMM_REG
.endm

.macro FPUMOVS FDESREG, IMME32, IMM_REG
     li \IMM_REG, \IMME32
     fmv.w.x \FDESREG, \IMM_REG
.endm

.macro FPUMOVD FDESREG,IMME64,IMM_REG
      li \IMM_REG, \IMME64
      fmv.d.x \FDESREG, \IMM_REG
.endm

.macro FPUSCHECKS FDESREG, EXPNUM, IMM_REG0, IMM_REG1
      li \IMM_REG0,0xffffffff00000000
      li \IMM_REG1, \EXPNUM
      or \IMM_REG0,\IMM_REG1,\IMM_REG0
      fmv.x.d \IMM_REG1,\FDESREG
.endm

.macro FPUHCHECKH FDESREG, EXPNUM, IMM_REG0, IMM_REG1
    li \IMM_REG0,0xffffffffffff0000
    li \IMM_REG1, \EXPNUM
    or \IMM_REG0,\IMM_REG1,\IMM_REG0
    fmv.x.d \IMM_REG1,\FDESREG
    bne \IMM_REG0, \IMM_REG1, RESULT_FAIL
.endm

.macro FPUSCHECKD FDESREG,EXPNUML, IMM_REG0, IMM_REG1
  fmv.x.d \IMM_REG0, \FDESREG
  li   \IMM_REG1, \EXPNUML
.endm

.macro FPUEXCHK EXPNUM32, IMM_REG0, IMM_REG1
    li   \IMM_REG0, 0x7f
    csrrs \IMM_REG1,fxcr,x0
    csrrc x0,fxcr, \IMM_REG0  #//clear flag bits
    and  \IMM_REG0, \IMM_REG0,\IMM_REG1
    li   \IMM_REG1, \EXPNUM32
.endm

.macro FPUSCHECKH FDESREG, EXPNUM, EXP_FLAG
  li x3, 0xffffffffffff0000
  li x4, \EXPNUM
  or x3, x4,x3
  fmv.x.d x4,\FDESREG
  bne x3, x4, RESULTFAIL
  FPUEXCHECK \EXP_FLAG
.endm

.macro FPUEXCHECK EXPNUM32   #//xuwj modified, add bne instruction in macro,use x3x4 default
  #//to see if fccee is enabled
     li   x3, 0x3f
     csrrs x4,fxcr,x0
     csrrc x0,fxcr, x3  #//clear flag bits
     and  x3, x3,x4
     li   x4, \EXPNUM32
     bne x3, x4,EXCEPTION_FAIL
.endm

.macro FPUSCHECKH_RESULT FDESREG, EXPNUM
  li x3, 0xffffffffffff0000
  li x4, \EXPNUM
  or x3, x4,x3
  fmv.x.d x4,\FDESREG
  bne x3, x4, RESULTFAIL
.endm




.macro  FPURMCH IMME2 , IMM_REG0
   li x18, 0xf8ffffff
   csrrs \IMM_REG0, fxcr, x0
   and \IMM_REG0, \IMM_REG0,x18
   li x18,\IMME2
   slli x18, x18,24
   or x18, x18,\IMM_REG0
   csrrw x0, fxcr,x18
.endm

.macro  FPUQNANCH IMME2, IMM_REG0   ##//imm_reg0 is a tmp reg 
    csrrs  x18, fxcr,x0
    li   \IMM_REG0, 0xff7fffff
    and x18,\IMM_REG0,x18
    li  \IMM_REG0, \IMME2
    slli  \IMM_REG0,\IMM_REG0, 23             #//left shift 23  bits
    or    \IMM_REG0, \IMM_REG0,x18            #//set the current QNAN
    csrrw  x0, fxcr,\IMM_REG0        #//put in relative vcr
.endm

.macro ADDS_H FDESREG0, FDESREG1, RESULT, EXPNUM32
    FPUMOVH f12, HpZero  , x3#//PUT CASE TOP
    fadd.h f12, \FDESREG0 , \FDESREG1
    FPUSCHECKH f12, \RESULT, \EXPNUM32
.endm





.macro ADDS_VR FDESREG0, FDESREG1, RESULT, EXPNUM32
   FPUMOVS f12, SpZero  , x3#//PUT CASE TOP
   fadd.s f12, \FDESREG0 , \FDESREG1
   #//CHECK
   FPUSCHECKS f12, \RESULT, x3,x4
   bne x3, x4, RESULTFAIL
   FPUEXCHK \EXPNUM32 , x3, x4  #//close self check
   bne x3,x4, FLAGCFAIL
.endm

.macro SUBS_SC IMM1, IMM2, IMM3, EXPNUM32
       FPUMOVS f1 , \IMM1, x3
       FPUMOVS f2 , \IMM2, x3
       fsub.s f12, f1 , f2
        #//CHECK
       FPUSCHECKS f12,\IMM3,x3,x4
       bne x3,x4, RESULTFAIL
       FPUEXCHK \EXPNUM32 , x4, x3
       bne x3,x4,  FLAGCFAIL
.endm

.macro SUBD_SC SOURCE1, SOURCE2, RESULT,EXPNUM32
      FPUMOVD f1 , \SOURCE1 ,x3
      FPUMOVD f2 , \SOURCE2, x3
      fsub.d f12, f1 , f2
      FPUSCHECKD f12, \RESULT, x3, x4
      bne x3,x4, RESULTFAIL
      FPUEXCHK \EXPNUM32 , x3, x4
      bne x3,x4, FLAGCFAIL
.endm



#.include "./fp_macro_num_def.h"

####################################################################
#                 MAIN PROGRAM                                     #
####################################################################
.global FADD
FADD:
      FPURMCH 0 , x4
      FPUMOVH f4 , 0x43ff, x4
      FPUMOVH f7 , 0x5000, x4
      ADDS_H f4, f7, 0x5080, 0x0021
      FPURMCH 1 , x4
      ADDS_H f4, f7, 0x507f, 0x0021
      FPURMCH 2 , x4
      ADDS_H f4, f7, 0x507f, 0x0021
      FPURMCH 3 , x4
      ADDS_H f4, f7, 0x5080, 0x0021
      FPURMCH 4 , x4
      ADDS_H f4, f7, 0x5080, 0x0021
      FPUMOVH f1, 0x43ff,x4
      FPUMOVH f2, 0x5000,x4
.global FADDH_STATIC_1
FADDH_STATIC_1:
      fadd.h f3,f1,f2,rne
      FPUSCHECKH f3, 0x5080, 0x0021
.global FADDH_STATIC_2
FADDH_STATIC_2:
      fadd.h f3,f1,f2,rtz
      FPUSCHECKH f3, 0x507f, 0x0021
.global FADDH_STATIC_3
FADDH_STATIC_3:
      fadd.h f3,f1,f2,rdn
      FPUSCHECKH f3, 0x507f, 0x0021
.global FADDH_STATIC_4
FADDH_STATIC_4:
      fadd.h f3,f1,f2,rup
      FPUSCHECKH f3, 0x5080, 0x0021
.global FADDH_STATIC_5
FADDH_STATIC_5:
      fadd.h f3,f1,f2,rmm
      FPUSCHECKH f3, 0x5080, 0x0021
.global FADDH_OF_1
FADDH_OF_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpLFN, x4
      FPUMOVH f7 , HpLFN, x4
      ADDS_H f4, f7, HpInf, 0x0025
.global FADDH_IX_1
FADDH_IX_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpLFN, x4
      ADDS_H f4, f7, HpqNaN, 0x0030
.global FSUB
FSUB:
      FPUMOVH f4 , 0xc3ff, x4
      FPUMOVH f7 , 0x5000, x4
      FPURMCH 0 , x4
      fsub.h f3,f7,f4
      FPUSCHECKH f3, 0x5080, 0x0021
      FPURMCH 1 , x4
      fsub.h f3,f7,f4
      FPUSCHECKH f3, 0x507f, 0x0021
      FPURMCH 2 , x4
      fsub.h f3,f7,f4
      FPUSCHECKH f3, 0x507f, 0x0021
      FPURMCH 3 , x4
      fsub.h f3,f7,f4
      FPUSCHECKH f3, 0x5080, 0x0021
      FPURMCH 4 , x4
      fsub.h f3,f7,f4
      FPUSCHECKH f3, 0x5080, 0x0021
      FPUMOVH f1, 0xc3ff,x4
      FPUMOVH f2, 0x5000,x4
.global FSUBH_STATIC_1
FSUBH_STATIC_1:
      fsub.h f3,f2,f1,rne
      FPUSCHECKH f3, 0x5080, 0x0021
.global FSUBH_STATIC_2
FSUBH_STATIC_2:
      fsub.h f3,f2,f1,rtz
      FPUSCHECKH f3, 0x507f, 0x0021
.global FSUBH_STATIC_3
FSUBH_STATIC_3:
      fsub.h f3,f2,f1,rdn
      FPUSCHECKH f3, 0x507f, 0x0021
.global FSUBH_STATIC_4
FSUBH_STATIC_4:
      fsub.h f3,f2,f1,rup
      FPUSCHECKH f3, 0x5080, 0x0021
.global FSUBH_STATIC_5
FSUBH_STATIC_5:
      fsub.h f3,f2,f1,rmm
      FPUSCHECKH f3, 0x5080, 0x0021
.global FSUBH_OF_1
FSUBH_OF_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HnLFN, x4
      FPUMOVH f7 , HpLFN, x4
      fsub.h f3,f7,f4
      FPUSCHECKH f3, HpInf, 0x0025
.global FSUBH_IX_1
FSUBH_IX_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpLFN, x4
      fsub.h f3,f7,f4
      FPUSCHECKH f3, HpqNaN, 0x0030
.global FMUL
FMUL:
      FPUMOVH f4 , 0x3400, x4
      FPUMOVH f7 , 0x000f, x4
      FPURMCH 0 , x4
      fmul.h f3,f7,f4
      FPUSCHECKH f3, 0x0004, 0x0023
      FPURMCH 1 , x4
      fmul.h f3,f7,f4
      FPUSCHECKH f3, 0x0003, 0x0023
      FPURMCH 2 , x4
      fmul.h f3,f7,f4
      FPUSCHECKH f3, 0x0003, 0x0023
      FPURMCH 3 , x4
      fmul.h f3,f7,f4
      FPUSCHECKH f3, 0x0004, 0x0023
      FPURMCH 4 , x4
      fmul.h f3,f7,f4
      FPUSCHECKH f3, 0x0004, 0x0023
      FPUMOVH f1, 0x3400,x4
      FPUMOVH f2, 0x000f,x4
.global FMULH_STATIC_1
FMULH_STATIC_1:
      fmul.h f3,f2,f1,rne
      FPUSCHECKH f3, 0x0004, 0x0023
.global FMULH_STATIC_2
FMULH_STATIC_2:
      fmul.h f3,f2,f1,rtz
      FPUSCHECKH f3, 0x0003, 0x0023
.global FMULH_STATIC_3
FMULH_STATIC_3:
      fmul.h f3,f2,f1,rdn
      FPUSCHECKH f3, 0x0003, 0x0023
.global FMULH_STATIC_4
FMULH_STATIC_4:
      fmul.h f3,f2,f1,rup
      FPUSCHECKH f3, 0x0004, 0x0023
.global FMULH_STATIC_5
FMULH_STATIC_5:
      fmul.h f3,f2,f1,rmm
      FPUSCHECKH f3, 0x0004, 0x0023
.global FMULH_OF_1
FMULH_OF_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpLFN, x4
      FPUMOVH f7 , HpLFN, x4
      fmul.h f3,f7,f4
      FPUSCHECKH f3, HpInf, 0x0025
.global FMULH_IX_1
FMULH_IX_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpLFN, x4
      fmul.h f3,f7,f4
      FPUSCHECKH f3, HpqNaN, 0x0030
.global fmadd
fmadd:
      FPUMOVH f4 , 0x3c00, x4
      FPUMOVH f7 , 0x43ff, x4
      FPUMOVH f3 , 0x5000, x4
      FPURMCH 0 , x4
      fmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 1 , x4
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 2 , x4
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 3 , x4
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 4 , x4
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPUMOVH f1, 0x3c00,x4
      FPUMOVH f2, 0x43ff,x4
.global FMADD_STATIC_1
FMADD_STATIC_1:
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f1,f2,f3,rne
      FPUSCHECKH f5, 0x5080, 0x0021
.global FMADD_STATIC_2
FMADD_STATIC_2:
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f1,f2,f3,rtz
      FPUSCHECKH f5, 0x507f, 0x0021
.global FMADD_STATIC_3
FMADD_STATIC_3:
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f1,f2,f3,rdn
      FPUSCHECKH f5, 0x507f, 0x0021
.global FMADD_STATIC_4
FMADD_STATIC_4:
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f1,f2,f3,rup
      FPUSCHECKH f5, 0x5080, 0x0021
.global FMADD_STATIC_5
FMADD_STATIC_5:
      FPUMOVH f3 , 0x5000, x4
      fmadd.h f5,f1,f2,f3,rmm
      FPUSCHECKH f5, 0x5080, 0x0021
.global FMADD_OF_1
FMADD_OF_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpLFN, x4
      FPUMOVH f7 , HpLFN, x4
      FPUMOVH f3 , HpLFN, x4
      fmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, HpInf, 0x0025
.global FMADD_IX_1
FMADD_IX_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpLFN, x4
      FPUMOVH f3 , HpLFN, x4
      fmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, HpqNaN, 0x0030
.global FNMADD
FNMADD:
      FPUMOVH f4 , 0xbc00, x4
      FPUMOVH f7 , 0x43ff, x4
      FPUMOVH f3 , 0xd000, x4
      FPURMCH 0 , x4
      fnmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 1 , x4
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 2 , x4
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 3 , x4
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 4 , x4
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPUMOVH f1, 0xbc00,x4
      FPUMOVH f2, 0x43ff,x4
.global FNMADD_STATIC_1
FNMADD_STATIC_1:
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f1,f2,f3,rne
      FPUSCHECKH f5, 0x5080, 0x0021
.global FNMADD_STATIC_2
FNMADD_STATIC_2:
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f1,f2,f3,rtz
      FPUSCHECKH f5, 0x507f, 0x0021
.global FNMADD_STATIC_3
FNMADD_STATIC_3:
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f1,f2,f3,rdn
      FPUSCHECKH f5, 0x507f, 0x0021
.global FNMADD_STATIC_4
FNMADD_STATIC_4:
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f1,f2,f3,rup
      FPUSCHECKH f5, 0x5080, 0x0021
.global FNMADD_STATIC_5
FNMADD_STATIC_5:
      FPUMOVH f3 , 0xd000, x4
      fnmadd.h f5,f1,f2,f3,rmm
      FPUSCHECKH f5, 0x5080, 0x0021
.global FNMADD_OF_1
FNMADD_OF_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpLFN, x4
      FPUMOVH f7 , HnLFN, x4
      FPUMOVH f3 , HnLFN, x4
      fnmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, HpInf, 0x0025
.global FNMADD_IX_1
FNMADD_IX_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpLFN, x4
      FPUMOVH f3 , HpLFN, x4
      fnmadd.h f5,f4,f7,f3
      FPUSCHECKH f5, HpqNaN, 0x0030
.global FMSUB
FMSUB:
      FPUMOVH f4 , 0x3c00, x4
      FPUMOVH f7 , 0x43ff, x4
      FPUMOVH f3 , 0xd000, x4
      FPURMCH 0 , x4
      fmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 1 , x4
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 2 , x4
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 3 , x4
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 4 , x4
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPUMOVH f1, 0x3c00,x4
      FPUMOVH f2, 0x43ff,x4
.global FMSUB_STATIC_1
FMSUB_STATIC_1:
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f1,f2,f3,rne
      FPUSCHECKH f5, 0x5080, 0x0021
.global FMSUB_STATIC_2
FMSUB_STATIC_2:
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f1,f2,f3,rtz
      FPUSCHECKH f5, 0x507f, 0x0021
.global FMSUB_STATIC_3
FMSUB_STATIC_3:
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f1,f2,f3,rdn
      FPUSCHECKH f5, 0x507f, 0x0021
.global FMSUB_STATIC_4
FMSUB_STATIC_4:
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f1,f2,f3,rup
      FPUSCHECKH f5, 0x5080, 0x0021
.global FMSUB_STATIC_5
FMSUB_STATIC_5:
      FPUMOVH f3 , 0xd000, x4
      fmsub.h f5,f1,f2,f3,rmm
      FPUSCHECKH f5, 0x5080, 0x0021
.global FMSUB_OF_1
FMSUB_OF_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpLFN, x4
      FPUMOVH f7 , HpLFN, x4
      FPUMOVH f3 , HnLFN, x4
      fmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, HpInf, 0x0025
.global FMSUB_IX_1
FMSUB_IX_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpLFN, x4
      FPUMOVH f3 , HpLFN, x4
      fmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, HpqNaN, 0x0030
.global FNMSUB
FNMSUB:
      FPUMOVH f4 , 0xbc00, x4
      FPUMOVH f7 , 0x43ff, x4
      FPUMOVH f3 , 0x5000, x4
      FPURMCH 0 , x4
      fnmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 1 , x4
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 2 , x4
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x507f, 0x0021
      FPURMCH 3 , x4
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPURMCH 4 , x4
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, 0x5080, 0x0021
      FPUMOVH f1, 0xbc00,x4
      FPUMOVH f2, 0x43ff,x4
.global FNMSUB_STATIC_1
FNMSUB_STATIC_1:
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f1,f2,f3,rne
      FPUSCHECKH f5, 0x5080, 0x0021
.global FNMSUB_STATIC_2
FNMSUB_STATIC_2:
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f1,f2,f3,rtz
      FPUSCHECKH f5, 0x507f, 0x0021
.global FNMSUB_STATIC_3
FNMSUB_STATIC_3:
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f1,f2,f3,rdn
      FPUSCHECKH f5, 0x507f, 0x0021
.global FNMSUB_STATIC_4
FNMSUB_STATIC_4:
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f1,f2,f3,rup
      FPUSCHECKH f5, 0x5080, 0x0021
.global FNMSUB_STATIC_5
FNMSUB_STATIC_5:
      FPUMOVH f3 , 0x5000, x4
      fnmsub.h f5,f1,f2,f3,rmm
      FPUSCHECKH f5, 0x5080, 0x0021
.global FNMSUB_OF_1
FNMSUB_OF_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HnLFN, x4
      FPUMOVH f7 , HpLFN, x4
      FPUMOVH f3 , HpLFN, x4
      fnmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, HpInf, 0x0025
.global FNMSUB_IX_1
FNMSUB_IX_1:
      FPURMCH 0 , x4
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpLFN, x4
      FPUMOVH f3 , HpLFN, x4
      fnmsub.h f5,f4,f7,f3
      FPUSCHECKH f5, HpqNaN, 0x0030
.global FDIV
FDIV:
      FPUMOVH f4 , 0x07ff, x4
      FPUMOVH f7 , 0x4800, x4
      FPURMCH 0 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, 0x0100, 0x0023
      FPURMCH 1 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, 0x00ff, 0x0023
      FPURMCH 2 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, 0x00ff, 0x0023
      FPURMCH 3 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, 0x0100, 0x0023
      FPURMCH 3 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, 0x0100, 0x0023
      FPUMOVH f1, 0x4800,x4
      FPUMOVH f2, 0x07ff,x4
.global FDIV_STATIC_1
FDIV_STATIC_1:
      fdiv.h f3,f2,f1,rne
      FPUSCHECKH f3, 0x0100, 0x0023
.global FDIV_STATIC_2
FDIV_STATIC_2:
      fdiv.h f3,f2,f1,rtz
      FPUSCHECKH f3, 0x00ff, 0x0023
.global FDIV_STATIC_3
FDIV_STATIC_3:
      fdiv.h f3,f2,f1,rdn
      FPUSCHECKH f3, 0x00ff, 0x0023
.global FDIV_STATIC_4
FDIV_STATIC_4:
      fdiv.h f3,f2,f1,rup
      FPUSCHECKH f3, 0x0100, 0x0023
.global FDIV_STATIC_5
FDIV_STATIC_5:
      fdiv.h f3,f2,f1,rmm
      FPUSCHECKH f3, 0x0100, 0x0023
.global FDIV_IO
FDIV_IO:
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpNorm, x4
      FPURMCH 0 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, HpqNaN, 0x0030
.global FDIV_OF
FDIV_OF:
      FPUMOVH f4 , HpLFN, x4
      FPUMOVH f7 , HpNorm, x4
      FPURMCH 0 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, HpInf, 0x0025
.global FDIV_DZ
FDIV_DZ:
      FPUMOVH f4 , HpNorm, x4
      FPUMOVH f7 , HpZero, x4
      FPURMCH 0 , x4
      fdiv.h f3,f4,f7
      FPUSCHECKH f3, HpInf, 0x0028
.global FSQRT
FSQRT:
      FPUMOVH f4, HpsNaN, x4
      FPURMCH 0 , x4
      fsqrt.h f3,f4
      FPUSCHECKH f3, HpqNaN, 0x0030
      FPUMOVH f4, HpqNaN, x4
      FPURMCH 0 , x4
      fsqrt.h f3,f4
      FPUSCHECKH f3, HpqNaN, 0x0000
      FPUMOVH f4, HpONE, x4
      FPURMCH 0 , x4
      fsqrt.h f3,f4
      FPUSCHECKH f3, HpONE, 0x0000
      FPUMOVH f4, HnDeNorm, x4
      FPURMCH 0 , x4
      fsqrt.h f3,f4
      FPUSCHECKH f3, HpqNaN, 0x0030
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpsNaN, x4
      fmin.h f3,f4,f7
      FPUSCHECKH f3, HpqNaN, 0x0030
      FPUMOVH f4 , HpqNaN, x4
      FPUMOVH f7 , HpInf, x4
      fmin.h f3,f4,f7
      FPUSCHECKH f3, HpInf, 0x0000
      FPUMOVH f4 , HpNorm, x4
      FPUMOVH f7 , HnDeNorm, x4
      fmin.h f3,f4,f7
      FPUSCHECKH f3, HnDeNorm, 0x0000
      FPUMOVH f4 , HpsNaN, x4
      FPUMOVH f7 , HpsNaN, x4
      fmax.h f3,f4,f7
      FPUSCHECKH f3, HpqNaN, 0x0030
      FPUMOVH f4 , HpqNaN, x4
      FPUMOVH f7 , HpInf, x4
      fmin.h f3,f4,f7
      FPUSCHECKH f3, HpInf, 0x0000
      FPUMOVH f4 , HpNorm, x4
      FPUMOVH f7 , HnDeNorm, x4
      fmin.h f3,f4,f7
      FPUSCHECKH f3, HnDeNorm, 0x0000
.global FMVHX
FMVHX:
      li x1,0x0fff
      li x4,0x0fff
      li x3, 0x2000
      fmv.h.x f1,x1
      fsh f1,0(x3)
      lh x5,0(x3)
      bne x5,x4,RESULTFAIL
.global FMVXH
FMVXH:
      li x1,0xfbc0
      li x3,0x2000
      sd x1,0(x3)
      flh f1,0(x3)
      fmv.x.h x4,f1
      li x1,0xfffffffffffffbc0
      bne x1,x4,RESULTFAIL
.global FCLASSS_1
FCLASSS_1:
      FPUMOVH f1,HnInf,x4
.global INST44H
INST44H:
      fclass.h x1,f1
      li x3,0x1
      bne x1,x3,RESULTFAIL
      FPUMOVH f1,HnqNaN,x4
.global FCLASS_2
FCLASS_2:
      fclass.h x1,f1
      li x3,0x200
      bne x1,x3,RESULTFAIL
.global FEQSTESTH
FEQSTESTH:
      FPUMOVH f0 , HpsNaN, x4
      FPUMOVH f6 , HpNorm, x4
      feq.h x1, f0, f6
      bne x1,x0, FEQSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVH f2 , HpqNaN, x4
      FPUMOVH f4 , HpInf, x4
.global INST61H
INST61H:
      feq.h x1, f2, f4
      bne x1,x0, FEQSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVH f7 , HnNorm, x4
.global INST62H
INST62H:
      feq.h x1, f7,f7
      li x3,0x1
      bne x1,x3, FEQSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global FLESTESTH
FLESTESTH:
.global INST63H
INST63H:
      FPUMOVH f0 , HpsNaN, x4
      FPUMOVH f6 , HpNorm, x4
      fle.h x1, f0, f6
      bne x1,x0, FLESFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVH f2 , HpqNaN, x4
      FPUMOVH f4 , HpInf, x4
.global INST64H
INST64H:
      fle.h x1, f2, f4
      bne x1,x0, FLESFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVH f7 , HnNorm, x4
      FPUMOVH f6 , HpNorm, x4
.global INST65H
INST65H:
      fle.h x1, f7,f6
      li x3,0x1
      bne x1,x3, FLESFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVH f0 , HpsNaN, x4
      FPUMOVH f6 , HpNorm, x4
.global FLTSTESTH
FLTSTESTH:
      flt.h x1, f0, f6
      bne x1,x0, FLTSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVH f2 , HpqNaN, x4
      FPUMOVH f4 , HpInf, x4
.global INST67H
INST67H:
      flt.h x1, f2, f4
      bne x1,x0, FLTSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVH f7 , HnNorm, x4
      FPUMOVH f6 , HpNorm, x4
.global INST68H
INST68H:
      flt.h x1, f7,f6
      li x3,0x1
      bne x1,x3, FLTSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global FSGNJSH
FSGNJSH:
      FPUMOVH f1,HpZero,x4
      FPUMOVH f2,HnInf,x4
      FPUMOVH f15,HpsNaN,x4
.global INST38H
INST38H:
      fsgnj.h f15,f1,f2
      FPUSCHECKH f15,HnZero,0x0000
.global FSGNJNSH
FSGNJNSH:
      FPUMOVH f1,HpZero,x4
      FPUMOVH f2,HpInf,x4
      FPUMOVH f15,HpsNaN,x4
.global INST40H
INST40H:
      fsgnjn.h f15,f1,f2
      FPUSCHECKH f15,HnZero, 0x0000
.global FSGNJXSH
FSGNJXSH:
      FPUMOVH f1,HnZero,x4
      FPUMOVH f2,HpInf,x4
      FPUMOVH f15,HpsNaN,x4
.global INST42H
INST42H:
      fsgnjx.h f15,f1,f2
      FPUSCHECKH f15,HnZero, 0x0000
      FPURMCH 0 , x4
      FPUMOVH f0 , 0xbbff, x4
.global INST15_H
INST15_H:
      fcvt.w.h x15, f0
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVH f0 , 0xbc00, x4
.global INST15_1_H
INST15_1_H:
      fcvt.w.h x15, f0, rne
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_2_H
INST15_2_H:
      fcvt.w.h x15, f0, rtz
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_3_H
INST15_3_H:
      fcvt.w.h x15, f0, rdn
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_4_H
INST15_4_H:
      fcvt.w.h x15, f0, rup
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_5_H
INST15_5_H:
      fcvt.w.h x15, f0, rmm
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUMOVH f0 , 0x3e00, x4
.global INST16_H
INST16_H:
      fcvt.wu.h x15, f0
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
.global INST16_1_H
INST16_1_H:
      fcvt.wu.h x15, f0, rne
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global INST16_2_H
INST16_2_H:
      fcvt.wu.h x15, f0, rtz
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global INST16_3_H
INST16_3_H:
      fcvt.wu.h x15, f0, rdn
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global INST16_4_H
INST16_4_H:
      fcvt.wu.h x15, f0, rup
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global INST16_5_H
INST16_5_H:
      fcvt.wu.h x15, f0, rmm
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      FPUMOVH f0 , 0xbbff, x4
.global INST17
INST17_H:
      fcvt.l.h x15, f0
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVH f0 , 0xbc00, x4
.global INST17_1_H
INST17_1_H:
      fcvt.l.h x15, f0, rne
      bne x1,x15, RESULTFAIL
      FPUMOVH f0 , 0xbc00, x4
.global INST17_2_H
INST17_2_H:
      fcvt.l.h x15, f0, rtz
      bne x1,x15, RESULTFAIL
      FPUMOVH f0 , 0xbc00, x4
.global INST17_3_H
INST17_3_H:
      fcvt.l.h x15, f0, rdn
      li x1,0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUMOVH f0 , 0xbc00, x4
.global INST17_4_H
INST17_4_H:
      fcvt.l.h x15, f0, rup
      bne x1,x15, RESULTFAIL
      FPUMOVH f0 , 0xbc00, x4
.global INST17_5_H
INST17_5_H:
      fcvt.l.h x15, f0, rmm
      li x1,0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUMOVH f0 , 0x3e00, x4
.global FCVT_LUH_1
FCVT_LUH_1:
      fcvt.lu.h x15, f0
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
.global FCVT_LUH_2
FCVT_LUH_2:
      fcvt.lu.h x15, f0, rne
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global FCVT_LUH_3
FCVT_LUH_3:
      fcvt.lu.h x15, f0, rtz
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global FCVT_LUH_4
FCVT_LUH_4:
      fcvt.lu.h x15, f0, rdn
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global FCVT_LUH_5
FCVT_LUH_5:
      fcvt.lu.h x15, f0, rup
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global FCVT_LUH_6
FCVT_LUH_6:
      fcvt.lu.h x15, f0, rmm
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      li x1,0xffffffffffffffff
.global FCVTHL
FCVTHL:
      fcvt.h.l f15, x1
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVH f15, SpqNaN, x4
.global FCVTHL_1
FCVTHL_1:
      fcvt.h.l f15, x1, rne
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVH f15, SpqNaN, x4
.global FCVTHL_2
FCVTHL_2:
      fcvt.h.l f15, x1, rtz
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVH f15, SpqNaN, x4
.global FCVTHL_3
FCVTHL_3:
      fcvt.h.l f15, x1, rdn
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVH f15, SpqNaN, x4
.global FCVTHL_4
FCVTHL_4:
      fcvt.h.l f15, x1, rup
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVH f15, SpqNaN, x4
.global FCVTHL_5
FCVTHL_5:
      fcvt.h.l f15, x1, rmm
      FPUSCHECKH_RESULT f15, 0xbc00
      li x1 , 0x0000000000000001
.global FCVTHLU
FCVTHLU:
      fcvt.h.lu f15, x1
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global FCVTHLU_1
FCVTHLU_1:
      fcvt.h.lu f15, x1, rne
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global FCVTHLU_2
FCVTHLU_2:
      fcvt.h.lu f15, x1, rtz
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global FCVTHLU_3
FCVTHLU_3:
      fcvt.h.lu f15, x1, rdn
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global FCVTHLU_4
FCVTHLU_4:
      fcvt.h.lu f15, x1, rup
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global FCVTHLU_5
FCVTHLU_5:
      fcvt.h.lu f15, x1, rmm
      FPUSCHECKH_RESULT f15, 0x3c00
      li x1 , 0xffffffff
.global INST_FCVTHW
INST_FCVTHW:
      fcvt.h.w f15, x1
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHW_1
INST_FCVTHW_1:
      fcvt.h.w f15, x1, rne
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHW_2
INST_FCVTHW_2:
      fcvt.h.w f15, x1, rtz
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHW_3
INST_FCVTHW_3:
      fcvt.h.w f15, x1, rdn
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHW_4
INST_FCVTHW_4:
      fcvt.h.w f15, x1, rup
      FPUSCHECKH_RESULT f15, 0xbc00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHW_5
INST_FCVTHW_5:
      fcvt.h.w f15, x1, rmm
      FPUSCHECKH_RESULT f15, 0xbc00
      li x1 , 0x00000001
.global INST_FCVTHWU
INST_FCVTHWU:
      fcvt.h.wu f15, x1
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHWU_1
INST_FCVTHWU_1:
      fcvt.h.wu f15, x1, rne
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHWU_2
INST_FCVTHWU_2:
      fcvt.h.wu f15, x1, rtz
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHWU_3
INST_FCVTHWU_3:
      fcvt.h.wu f15, x1, rdn
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHWU_4
INST_FCVTHWU_4:
      fcvt.h.wu f15, x1, rup
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f15, SpqNaN, x3
.global INST_FCVTHWU_5
INST_FCVTHWU_5:
      fcvt.h.wu f15, x1, rmm
      FPUSCHECKH_RESULT f15, 0x3c00
      csrw fxcr,x0
      FPUMOVH f12, HpLFN , x4
.global FCVTSH
FCVTSH:
      fcvt.s.h f15, f12
      FPUSCHECKS f15, 0x477fe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000000 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVH f12, HpLFN , x4
.global FCVTDH
FCVTDH:
      fcvt.d.h f15, f12
      FPUSCHECKD f15, 0x40effc0000000000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000000 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVD f0 , DpLFN, x4
      FPUMOVH f15, HpZero, x4
.global FCVTHD
FCVTHD:
      fcvt.h.d f15, f0
      FPUSCHECKH f15, HpInf, 0x0025
      FPUMOVD f1, 0x3ff0000000000000, x3
.global FCVTHD_1
FCVTHD_1:
      fcvt.h.d f15, f1, rne
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHD_2
FCVTHD_2:
      fcvt.h.d f15, f1, rtz
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHD_3
FCVTHD_3:
      fcvt.h.d f15, f1, rdn
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHD_4
FCVTHD_4:
      fcvt.h.d f15, f1, rup
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHD_5
FCVTHD_5:
      fcvt.h.d f15, f1, rmm
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVS f0 , SpLFN, x4
      FPUMOVH f15, HpZero, x4
.global FCVTHS
FCVTHS:
      fcvt.h.s f15, f0
      FPUSCHECKH f15, HpInf, 0x0025
      FPUMOVS f1, 0x3f800000, x3
.global FCVTHS_1
FCVTHS_1:
      fcvt.h.s f15, f1, rne
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHS_2
FCVTHS_2:
      fcvt.h.s f15, f1, rtz
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHS_3
FCVTHS_3:
      fcvt.h.s f15, f1, rdn
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHS_4
FCVTHS_4:
      fcvt.h.s f15, f1, rup
      FPUSCHECKH_RESULT f15, 0x3c00
      FPUMOVH f15, HpZero, x4
.global FCVTHS_5
FCVTHS_5:
      fcvt.h.s f15, f1, rmm
      FPUSCHECKH_RESULT f15, 0x3c00








      FPURMCH 0 , x4
      FPUMOVS f4 , 0x00800001, x4
      FPUMOVS f7 , 0x80800000, x4
      ADDS_VR f4, f7, 0x00000001, 0x0000
      FPURMCH 1 , x4
      FPUMOVS f0 , SpLFN, x4
      FPUMOVS f2 , 0x73000000, x4
      ADDS_VR f0, f2, SpLFN, 0x00000021
      FPURMCH 3 , x4
      FPUMOVS f0 , SpLFN, x4
      FPUMOVS f2 , 0x73000000, x4
      ADDS_VR f0, f2, SpInf, 0x00000025
      FPURMCH 2 , x4
      FPUMOVS f5 , 0x80800001, x4
      FPUMOVS f6 , 0x00800000, x4
      ADDS_VR f5, f6, 0x80000001, 0x0000
      FPURMCH 4 , x4
      FPUMOVS f4 , 0x00800001, x4
      FPUMOVS f7 , 0x80800000, x4
      ADDS_VR f4, f7, 0x00000001, 0x0
      FPUMOVS f1, 0x3f800000,x3
      FPUMOVS f2, 0x3f000000,x3
.global FADDS_STATIC_1
FADDS_STATIC_1:
      fadd.s f3,f1,f2,rne
      FPUSCHECKS f3, 0x3fc00000, x3,x4
      bne x3,x4, RESULTFAIL
.global FADDS_STATIC_2
FADDS_STATIC_2:
      fadd.s f3,f1,f2,rtz
      FPUSCHECKS f3, 0x3fc00000, x3,x4
      bne x3,x4, RESULTFAIL
.global FADDS_STATIC_3
FADDS_STATIC_3:
      fadd.s f3,f1,f2,rdn
      FPUSCHECKS f3, 0x3fc00000, x3,x4
      bne x3,x4, RESULTFAIL
.global FADDS_STATIC_4
FADDS_STATIC_4:
      fadd.s f3,f1,f2,rup
      FPUSCHECKS f3, 0x3fc00000, x3,x4
      bne x3,x4, RESULTFAIL
.global FADDS_STATIC_5
FADDS_STATIC_5:
      fadd.s f3,f1,f2,rmm
      FPUSCHECKS f3, 0x3fc00000, x3,x4
      bne x3,x4, RESULTFAIL
      FPURMCH 0 , x4
      FPUMOVD f0 , DpLFN , x4
      FPUMOVD f2 , 0x7c90000000000000 , x4
.global INST0
INST0:
      fadd.d f12, f0 , f2
      FPUSCHECKD f12, DpInf, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000025 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPURMCH 1 , x4
      FPUMOVD f0 , DpLFN , x4
      FPUMOVD f2 , 0x7c90000000000000 , x4
.global INST1
INST1:
      fadd.d f12, f0 , f2
      FPUSCHECKD f12, DpLFN, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPURMCH 3 , x4
      FPUMOVD f0 , DpLFN , x4
      FPUMOVD f2 , 0x7c90000000000000 , x4
.global INST2
INST2:
      fadd.d f12, f0 , f2
      FPUSCHECKD f12, DpInf, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000025 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPURMCH 2 , x4
      FPUMOVD f0 , DpLFN , x4
      FPUMOVD f2 , 0x7c90000000000000 , x4
.global INST3
INST3:
      fadd.d f12, f0 , f2
      FPUSCHECKD f12, DpLFN, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPURMCH 4 , x4
      FPUMOVD f0 , DpLFN , x4
      FPUMOVD f2 , 0x7c90000000000000 , x4
.global INST4
INST4:
      fadd.d f12, f0 , f2
      FPUSCHECKD f12, DpInf, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000025 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVD f1, 0x3ff0000000000000,x3
      FPUMOVD f2, 0x3fe0000000000000,x3
.global FADDD_STATIC_1
FADDD_STATIC_1:
      fadd.d f3,f1,f2, rne
      FPUSCHECKD f3, 0x3ff8000000000000,x4,x3
      bne x3,x4,RESULTFAIL
.global FADDD_STATIC_2
FADDD_STATIC_2:
      fadd.d f3,f1,f2, rtz
      FPUSCHECKD f3, 0x3ff8000000000000,x4,x3
      bne x3,x4,RESULTFAIL
.global FADDD_STATIC_3
FADDD_STATIC_3:
      fadd.d f3,f1,f2, rdn
      FPUSCHECKD f3, 0x3ff8000000000000,x4,x3
      bne x3,x4,RESULTFAIL
.global FADDD_STATIC_4
FADDD_STATIC_4:
      fadd.d f3,f1,f2, rup
      FPUSCHECKD f3, 0x3ff8000000000000,x4,x3
      bne x3,x4,RESULTFAIL
.global FADDD_STATIC_5
FADDD_STATIC_5:
      fadd.d f3,f1,f2, rmm
      FPUSCHECKD f3, 0x3ff8000000000000,x4,x3
      bne x3,x4,RESULTFAIL
      FPURMCH 0 , x4
      SUBS_SC 0x4dffffff, 0x40800000, 0x4dffffff, 0x00000021
      FPURMCH 1 , x4
      SUBS_SC SpLFN, 0xf3000000, SpLFN, 0x00000021
      FPURMCH 3 , x4
      SUBS_SC SpLFN, 0xf3000000, SpInf, 0x00000025
      FPURMCH 2 , x4
      SUBS_SC 0x80800001, 0x80800000, 0x80000001, 0x000000
      FPURMCH 4 , x4
      SUBS_SC 0x4dffffff, 0x40800000, 0x4dffffff, 0x00000021
      FPUMOVS f1, 0x3f800000,x3
      FPUMOVS f2, 0x3f000000,x3
.global SUBS_STATIC_1
SUBS_STATIC_1:
      fsub.s f3,f1,f2,rne
      FPUSCHECKS f3, 0x3f000000,x3,x4
      bne x3,x4,RESULTFAIL
.global SUBS_STATIC_2
SUBS_STATIC_2:
      fsub.s f3,f1,f2,rtz
      FPUSCHECKS f3, 0x3f000000,x3,x4
      bne x3,x4,RESULTFAIL
.global SUBS_STATIC_3
SUBS_STATIC_3:
      fsub.s f3,f1,f2,rdn
      FPUSCHECKS f3, 0x3f000000,x3,x4
      bne x3,x4,RESULTFAIL
.global SUBS_STATIC_4
SUBS_STATIC_4:
      fsub.s f3,f1,f2,rup
      FPUSCHECKS f3, 0x3f000000,x3,x4
      bne x3,x4,RESULTFAIL
.global SUBS_STATIC_5
SUBS_STATIC_5:
      fsub.s f3,f1,f2,rmm
      FPUSCHECKS f3, 0x3f000000,x3,x4
      bne x3,x4,RESULTFAIL
.global B1
B1:
      FPURMCH 0 , x4
      SUBD_SC 0x7fefffffffffffff, 0xfc90000000000000, 0x7ff0000000000000, 0x00000025
.global B2
B2:
      FPURMCH 1 , x4
      SUBD_SC 0x7fefffffffffffff, 0xfc90000000000000, 0x7fefffffffffffff, 0x00000021
.global B3
B3:
      FPURMCH 3 , x4
      SUBD_SC 0x7fefffffffffffff, 0xfc90000000000000, 0x7ff0000000000000, 0x00000025
.global B4
B4:
      FPURMCH 2 , x4
      SUBD_SC 0x7fefffffffffffff, 0xfc90000000000000, 0x7fefffffffffffff, 0x00000021
.global B5
B5:
      FPURMCH 4 , x4
      SUBD_SC 0x7fefffffffffffff, 0xfc90000000000000, 0x7ff0000000000000, 0x00000025
      FPUMOVD f1, 0x3ff0000000000000, x3
      FPUMOVD f2, 0x3fe0000000000000, x3
.global SUBD_STATIC_1
SUBD_STATIC_1:
      fsub.d f3,f1,f2,rne
      FPUSCHECKD f3, 0x3fe0000000000000, x3,x4
      bne x3,x4,RESULTFAIL
.global SUBD_STATIC_2
SUBD_STATIC_2:
      fsub.d f3,f1,f2,rtz
      FPUSCHECKD f3, 0x3fe0000000000000, x3,x4
      bne x3,x4,RESULTFAIL
.global SUBD_STATIC_3
SUBD_STATIC_3:
      fsub.d f3,f1,f2,rdn
      FPUSCHECKD f3, 0x3fe0000000000000, x3,x4
      bne x3,x4,RESULTFAIL
.global SUBD_STATIC_4
SUBD_STATIC_4:
      fsub.d f3,f1,f2,rup
      FPUSCHECKD f3, 0x3fe0000000000000, x3,x4
      bne x3,x4,RESULTFAIL
.global SUBD_STATIC_5
SUBD_STATIC_5:
      fsub.d f3,f1,f2,rmm
      FPUSCHECKD f3, 0x3fe0000000000000, x3,x4
      bne x3,x4,RESULTFAIL
      FPURMCH 0 , x4
      FPUMOVS f9 , SnDeNorm, x4
.global INST5
INST5:
      fabs.s f12, f9
      FPUSCHECKS f12, SpDeNorm, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f9 , DnDeNorm, x4
.global INST6
INST6:
      fabs.d f12, f9
      FPUSCHECKD f12, DpDeNorm, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f0 , SpsNaN , x4
.global INST7
INST7:
      fneg.s f12, f0
      FPUSCHECKS f12, SnsNaN, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f0 , DpsNaN , x4
.global INST8
INST8:
      fneg.d f12, f0
      FPUSCHECKD f12, DnsNaN, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f12, SpLFN , x4
.global INST9
INST9:
      fcvt.d.s f15, f12
      FPUSCHECKD f15, 0x47efffffe0000000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000000 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVD f0 , DpLFN, x4
      FPUMOVS f15, SpZero, x4
.global INST10
INST10:
      fcvt.s.d f15, f0
      FPUSCHECKS f15, SpInf, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x00000025 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVD f1, 0x3ff0000000000000, x3
.global INST10_1
INST10_1:
      fcvt.s.d f15, f1, rne
      FPUSCHECKS f15, 0x3f800000, x4, x3
      bne x3,x4, RESULTFAIL
.global INST10_2
INST10_2:
      fcvt.s.d f15, f1, rtz
      FPUSCHECKS f15, 0x3f800000, x4, x3
      bne x3,x4, RESULTFAIL
.global INST10_3
INST10_3:
      fcvt.s.d f15, f1, rdn
      FPUSCHECKS f15, 0x3f800000, x4, x3
      bne x3,x4, RESULTFAIL
.global INST10_4
INST10_4:
      fcvt.s.d f15, f1, rup
      FPUSCHECKS f15, 0x3f800000, x4, x3
      bne x3,x4, RESULTFAIL
.global INST10_5
INST10_5:
      fcvt.s.d f15, f1, rmm
      FPUSCHECKS f15, 0x3f800000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f8 , 0x416fe00000000000, x4
.global INST11
INST11:
      fcvt.wu.d x15, f8
      li x1,0xff0000
      bne x15,x1, RESULTFAIL
      FPUEXCHK 0x00000000 , x4, x3
      bne x3,x4, FLAGCFAIL
.global INST11_1
INST11_1:
      fcvt.wu.d x15, f8, rne
      li x1,0xff0000
      bne x15,x1, RESULTFAIL
.global INST11_2
INST11_2:
      fcvt.wu.d x15, f8, rtz
      li x1,0xff0000
      bne x15,x1, RESULTFAIL
.global INST11_3
INST11_3:
      fcvt.wu.d x15, f8, rdn
      li x1,0xff0000
      bne x15,x1, RESULTFAIL
.global INST11_4
INST11_4:
      fcvt.wu.d x15, f8, rup
      li x1,0xff0000
      bne x15,x1, RESULTFAIL
.global INST11_5
INST11_5:
      fcvt.wu.d x15, f8, rmm
      li x1,0xff0000
      bne x15,x1, RESULTFAIL
      FPUMOVD f0 , 0xbfefffffffffffff, x4
.global INST12
INST12:
      fcvt.w.d x15, f0
      li x1,0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVD f0, 0x403f000000000000,x3
.global INST12_1
INST12_1:
      fcvt.w.d x15, f0, rne
      li x1,0x1f
      bne x1,x15, RESULTFAIL
.global INST12_2
INST12_2:
      fcvt.w.d x15, f0, rtz
      li x1,0x1f
      bne x1,x15, RESULTFAIL
.global INST12_3
INST12_3:
      fcvt.w.d x15, f0, rdn
      li x1,0x1f
      bne x1,x15, RESULTFAIL
.global INST12_4
INST12_4:
      fcvt.w.d x15, f0, rup
      li x1,0x1f
      bne x1,x15, RESULTFAIL
.global INST12_5
INST12_5:
      fcvt.w.d x15, f0, rmm
      li x1,0x1f
      bne x1,x15, RESULTFAIL
      FPUMOVD f8 , 0x432ffe0000000000, x4
.global INST13
INST13:
      fcvt.lu.d x15, f8
      li x1,0xfff0000000000
      bne x15,x1, RESULTFAIL
      FPUEXCHK 0x00000000 , x4, x3
      bne x3,x4, FLAGCFAIL
.global INST13_1
INST13_1:
      fcvt.lu.d x15, f8, rne
      li x1,0xfff0000000000
      bne x15,x1, RESULTFAIL
.global INST13_2
INST13_2:
      fcvt.lu.d x15, f8, rtz
      li x1,0xfff0000000000
      bne x15,x1, RESULTFAIL
.global INST13_3
INST13_3:
      fcvt.lu.d x15, f8, rdn
      li x1,0xfff0000000000
      bne x15,x1, RESULTFAIL
.global INST13_4
INST13_4:
      fcvt.lu.d x15, f8, rup
      li x1,0xfff0000000000
      bne x15,x1, RESULTFAIL
.global INST13_5
INST13_5:
      fcvt.lu.d x15, f8, rmm
      li x1,0xfff0000000000
      bne x15,x1, RESULTFAIL
      FPUMOVD f0 , 0xbfefffffffffffff, x4
.global INST14
INST14:
      fcvt.l.d x15, f0
      li x1,0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVD f0, 0x3ff2000000000000, x3
.global INST14_1
INST14_1:
      fcvt.l.d x15, f0, rne
      li x1,0x1
      bne x1,x15, RESULTFAIL
.global INST14_2
INST14_2:
      fcvt.l.d x15, f0, rtz
      li x1,0x1
      bne x1,x15, RESULTFAIL
.global INST14_3
INST14_3:
      fcvt.l.d x15, f0, rdn
      li x1,0x1
      bne x1,x15, RESULTFAIL
.global INST14_4
INST14_4:
      fcvt.l.d x15, f0, rup
      li x1,0x2
      bne x1,x15, RESULTFAIL
.global INST14_5
INST14_5:
      fcvt.l.d x15, f0, rmm
      li x1,0x1
      bne x1,x15, RESULTFAIL
      FPUMOVS f0 , 0xbf7fffff, x4
.global INST15
INST15:
      fcvt.w.s x15, f0
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVS f0 , 0xbf800000, x4
.global INST15_1
INST15_1:
      fcvt.w.s x15, f0, rne
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_2
INST15_2:
      fcvt.w.s x15, f0, rtz
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_3
INST15_3:
      fcvt.w.s x15, f0, rdn
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_4
INST15_4:
      fcvt.w.s x15, f0, rup
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
.global INST15_5
INST15_5:
      fcvt.w.s x15, f0, rmm
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUMOVS f0 , 0x3fc00000, x4
.global INST16
INST16:
      fcvt.wu.s x15, f0
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
.global INST16_1
INST16_1:
      fcvt.wu.s x15, f0, rne
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global INST16_2
INST16_2:
      fcvt.wu.s x15, f0, rtz
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global INST16_3
INST16_3:
      fcvt.wu.s x15, f0, rdn
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global INST16_4
INST16_4:
      fcvt.wu.s x15, f0, rup
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global INST16_5
INST16_5:
      fcvt.wu.s x15, f0, rmm
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      FPUMOVS f0 , 0xbf7fffff, x4
.global INST17
INST17:
      fcvt.l.s x15, f0
      li x1, 0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
      FPUMOVS f0 , 0xbf000000, x4
.global INST17_1
INST17_1:
      fcvt.l.s x15, f0, rne
      bne x0,x15, RESULTFAIL
      FPUMOVS f0 , 0xbf000000, x4
.global INST17_2
INST17_2:
      fcvt.l.s x15, f0, rtz
      bne x0,x15, RESULTFAIL
      FPUMOVS f0 , 0xbf000000, x4
.global INST17_3
INST17_3:
      fcvt.l.s x15, f0, rdn
      li x1,0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUMOVS f0 , 0xbf000000, x4
.global INST17_4
INST17_4:
      fcvt.l.s x15, f0, rup
      bne x0,x15, RESULTFAIL
      FPUMOVS f0 , 0xbf000000, x4
.global INST17_5
INST17_5:
      fcvt.l.s x15, f0, rmm
      li x1,0xffffffffffffffff
      bne x1,x15, RESULTFAIL
      FPUMOVS f0 , 0x3fc00000, x4
.global INST18
INST18:
      fcvt.lu.s x15, f0
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      FPUEXCHK 0x00000021 , x4, x3
      bne x3,x4, FLAGCFAIL
.global INST18_1
INST18_1:
      fcvt.lu.s x15, f0, rne
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global INST18_2
INST18_2:
      fcvt.lu.s x15, f0, rtz
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global INST18_3
INST18_3:
      fcvt.lu.s x15, f0, rdn
      li x1, 0x00000001
      bne x1,x15, RESULTFAIL
.global INST18_4
INST18_4:
      fcvt.lu.s x15, f0, rup
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
.global INST18_5
INST18_5:
      fcvt.lu.s x15, f0, rmm
      li x1, 0x00000002
      bne x1,x15, RESULTFAIL
      li x1,0x7fffffff
.global INST19
INST19:
      fcvt.d.w f15, x1
      FPUSCHECKD f15, 0x41dfffffffc00000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1 , 0xffffffff
.global INST20
INST20:
      fcvt.d.wu f15, x1
      FPUSCHECKD f15, 0x41efffffffe00000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1,0xffffffff
.global INST21
INST21:
      fcvt.d.l f15, x1
      FPUSCHECKD f15, 0x41efffffffe00000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1,0xffffff0000000001
      FPUMOVS f15, SpqNaN,x3
.global INST21_1
INST21_1:
      fcvt.d.l f15, x1, rne
      FPUSCHECKD f15, 0xc26fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST21_2
INST21_2:
      fcvt.d.l f15, x1, rtz
      FPUSCHECKD f15, 0xc26fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST21_3
INST21_3:
      fcvt.d.l f15, x1, rdn
      FPUSCHECKD f15, 0xc26fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST21_4
INST21_4:
      fcvt.d.l f15, x1, rup
      FPUSCHECKD f15, 0xc26fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST21_5
INST21_5:
      fcvt.d.l f15, x1, rmm
      FPUSCHECKD f15, 0xc26fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1 , 0xffffffffff
.global INST22
INST22:
      fcvt.d.lu f15, x1
      FPUSCHECKD f15, 0x426fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f15, DpqNaN,x3
.global INST22_1
INST22_1:
      fcvt.d.lu f15, x1, rne
      FPUSCHECKD f15, 0x426fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f15, DpqNaN,x3
.global INST22_2
INST22_2:
      fcvt.d.lu f15, x1, rtz
      FPUSCHECKD f15, 0x426fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f15, DpqNaN,x3
.global INST22_3
INST22_3:
      fcvt.d.lu f15, x1, rdn
      FPUSCHECKD f15, 0x426fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f15, DpqNaN,x3
.global INST22_4
INST22_4:
      fcvt.d.lu f15, x1, rup
      FPUSCHECKD f15, 0x426fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVD f15, DpqNaN,x3
.global INST22_5
INST22_5:
      fcvt.d.lu f15, x1, rmm
      FPUSCHECKD f15, 0x426fffffffffe000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1,0x7fffffff
.global INST23
INST23:
      fcvt.s.w f15, x1
      FPUSCHECKS f15, 0x4f000000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x21,x3,x4
      bne x3,x4,FLAGCFAIL
      li x1,0xfffff001
      FPUMOVS f15, SpqNaN,x3
.global INST23_1
INST23_1:
      fcvt.s.w f15, x1, rne
      FPUSCHECKS f15, 0xc57ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST23_2
INST23_2:
      fcvt.s.w f15, x1, rtz
      FPUSCHECKS f15, 0xc57ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST23_3
INST23_3:
      fcvt.s.w f15, x1, rdn
      FPUSCHECKS f15, 0xc57ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST23_4
INST23_4:
      fcvt.s.w f15, x1, rup
      FPUSCHECKS f15, 0xc57ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST23_5
INST23_5:
      fcvt.s.w f15, x1, rmm
      FPUSCHECKS f15, 0xc57ff000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1 , 0xffffffff
.global INST24
INST24:
      fcvt.s.wu f15, x1
      FPUSCHECKS f15, 0x4f800000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUEXCHK 0x21,x3,x4
      bne x3,x4,FLAGCFAIL
      li x1, 0xfff
      FPUMOVS f15, SpqNaN,x3
.global INST24_1
INST24_1:
      fcvt.s.wu f15, x1,rne
      FPUSCHECKS f15, 0x457ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST24_2
INST24_2:
      fcvt.s.wu f15, x1, rtz
      FPUSCHECKS f15, 0x457ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST24_3
INST24_3:
      fcvt.s.wu f15, x1, rdn
      FPUSCHECKS f15, 0x457ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST24_4
INST24_4:
      fcvt.s.wu f15, x1, rup
      FPUSCHECKS f15, 0x457ff000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN,x3
.global INST24_5
INST24_5:
      fcvt.s.wu f15, x1, rmm
      FPUSCHECKS f15, 0x457ff000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1,0xffffffffffffffff
.global INST25
INST25:
      fcvt.s.l f15, x1
      FPUSCHECKS f15, 0xbf800000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST25_1
INST25_1:
      fcvt.s.l f15, x1, rne
      FPUSCHECKS f15, 0xbf800000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST25_2
INST25_2:
      fcvt.s.l f15, x1, rtz
      FPUSCHECKS f15, 0xbf800000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST25_3
INST25_3:
      fcvt.s.l f15, x1, rdn
      FPUSCHECKS f15, 0xbf800000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST25_4
INST25_4:
      fcvt.s.l f15, x1, rup
      FPUSCHECKS f15, 0xbf800000, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST25_5
INST25_5:
      fcvt.s.l f15, x1, rmm
      FPUSCHECKS f15, 0xbf800000, x4, x3
      bne x3,x4, RESULTFAIL
      li x1 , 0xffffff0000
.global INST26
INST26:
      fcvt.s.lu f15, x1
      FPUSCHECKS f15, 0x537fffff, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST26_1
INST26_1:
      fcvt.s.lu f15, x1, rne
      FPUSCHECKS f15, 0x537fffff, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST26_2
INST26_2:
      fcvt.s.lu f15, x1, rtz
      FPUSCHECKS f15, 0x537fffff, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST26_3
INST26_3:
      fcvt.s.lu f15, x1, rdn
      FPUSCHECKS f15, 0x537fffff, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST26_4
INST26_4:
      fcvt.s.lu f15, x1, rup
      FPUSCHECKS f15, 0x537fffff, x4, x3
      bne x3,x4, RESULTFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST26_5
INST26_5:
      fcvt.s.lu f15, x1, rmm
      FPUSCHECKS f15, 0x537fffff, x4, x3
      bne x3,x4, RESULTFAIL
.global A1
A1:
      li x1,0x1234567887654321
#      li x3, 0x2000000
      li x3, 0x50000
      sd x1,0(x3)
      fmv.d.x f1,x1
      fld f2,0(x3)
      feq.d x1,f1,f2
      beq x1,x0,RESULTFAIL
.global AA2
AA2:
      li x1,0x1111122222222
      sd x1,0(x3)
      fld f1,0(x3)
      fmv.x.d x4,f1
      bne x1,x4,RESULTFAIL
.global MAJW1
MAJW1:
      li x1,0xfffffff
      li x4,0xffffffff0fffffff
#      li x3, 0x2000000
      li x3, 0x50000
      fmv.w.x f1,x1
      fsd f1,0(x3)
      ld x5,0(x3)
      bne x5,x4,RESULTFAIL
.global A2
A2:
      li x1,0xfbc00000
#      li x3,0x2000000
      li x3, 0x50000
      sd x1,0(x3)
      fld f1,0(x3)
      fmv.x.w x4,f1
      li x1,0xfffffffffbc00000
      bne x1,x4,RESULTFAIL
.global A7
A7:
      FPUMOVS f15 0x01020304 , x4
      FPUMOVS f14 0x00000000 , x4
      fmv.s f14, f15
      FPUSCHECKS f14, 0x01020304, x4, x3
      bne x3,x4, RESULTFAIL
.global A8
A8:
      FPUMOVD f15 , 0x0102030405060708 , x4
      FPUMOVD f14 , 0x0 , x4
      fmv.d f14, f15
      FPUSCHECKD f14,0x0102030405060708, x4, x3
      bne x3,x4, RESULTFAIL
.global FSGNJS
FSGNJS:
      FPUMOVS f1,SpZero,x3
      FPUMOVS f2,SnInf,x3
      FPUMOVS f15,SpsNaN,x3
.global INST38
INST38:
      fsgnj.s f15,f1,f2
      FPUSCHECKS f15,SnZero,x3,x4
      bne x3,x4,RESULTFAIL
.global FSGNJD
FSGNJD:
      FPUMOVD f1,DpZero,x3
      FPUMOVD f2,DnInf,x3
      FPUMOVD f15,DpsNaN,x3
.global INST39
INST39:
      fsgnj.d f15,f1,f2
      FPUSCHECKD f15,DnZero,x3,x4
      bne x3,x4,RESULTFAIL
.global FSGNJNS
FSGNJNS:
      FPUMOVS f1,SpZero,x3
      FPUMOVS f2,SpInf,x3
      FPUMOVS f15,SpsNaN,x3
.global INST40
INST40:
      fsgnjn.s f15,f1,f2
      FPUSCHECKS f15,SnZero,x3,x4
      bne x3,x4,RESULTFAIL
.global FSGNJND
FSGNJND:
      FPUMOVD f1,DpZero,x3
      FPUMOVD f2,DpInf,x3
      FPUMOVD f15,DpsNaN,x3
.global INST41
INST41:
      fsgnjn.d f15,f1,f2
      FPUSCHECKD f15,DnZero,x3,x4
      bne x3,x4,RESULTFAIL
.global FSGNJXS
FSGNJXS:
      FPUMOVS f1,SnZero,x3
      FPUMOVS f2,SpInf,x3
      FPUMOVS f15,SpsNaN,x3
.global INST42
INST42:
      fsgnjx.s f15,f1,f2
      FPUSCHECKS f15,SnZero,x3,x4
      bne x3,x4,RESULTFAIL
.global FSGNJXD
FSGNJXD:
      FPUMOVD f1,DnZero,x3
      FPUMOVD f2,DpInf,x3
      FPUMOVD f15,DpsNaN,x3
.global INST43
INST43:
      fsgnjx.d f15,f1,f2
      FPUSCHECKD f15,DnZero,x3,x4
      bne x3,x4,RESULTFAIL
.global FCLASSS
FCLASSS:
      FPUMOVS f1,SnInf,x3
.global INST44
INST44:
      fclass.s x1,f1
      li x3,0x1
      bne x1,x3,RESULTFAIL
      FPUMOVS f1,SnqNaN,x3
.global INST45
INST45:
      fclass.s x1,f1
      li x3,0x200
      bne x1,x3,RESULTFAIL
.global FCLASSD
FCLASSD:
      FPUMOVD f1,DnInf,x3
.global INST46
INST46:
      fclass.d x1,f1
      li x3,0x1
      bne x1,x3,RESULTFAIL
      FPUMOVD f1,DnqNaN,x3
.global INST47
INST47:
      fclass.d x1,f1
      li x3,0x200
      bne x1,x3,RESULTFAIL
      FPUMOVS f0 , 0x7f801111 , x4
      FPUMOVS f1 , 0x7f800111 , x4
      FPUMOVS f2 , 0x7fc00011 , x4
      FPUMOVS f3 , 0x7fc00010 , x4
      FPUMOVS f4 , SpInf , x4
      FPUMOVS f5 , SnInf , x4
      FPUMOVS f6 , SpNorm , x4
      FPUMOVS f7 , SnNorm , x4
      FPUMOVS f8 , SpDeNorm, x4
      FPUMOVS f9 , SnDeNorm, x4
      FPUMOVS f10, SpZero , x4
      FPUMOVS f11, SnZero , x4
.global FMAXSTEST
FMAXSTEST:
.global INST48
INST48:
      fmax.s f15 , f0, f4
      FPUSCHECKS f15, SpqNaN , x4, x3
      bne x3,x4, FMAXSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST49
INST49:
      fmax.s f15 , f2, f6
      FPUSCHECKS f15, SpNorm , x4, x3
      bne x3,x4, FMAXSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST50
INST50:
      fmax.s f15 , f6, f7
      FPUSCHECKS f15, SpNorm , x4, x3
      bne x3,x4, FMAXSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST51
INST51:
      fmax.s f15 , f0, f0
      FPUSCHECKS f15, 0x7fc01111 , x4, x3
      bne x3,x4, FMAXSFAIL
.global INST52
INST52:
      fmax.s f15 , f2, f1
      FPUSCHECKS f15, 0x7fc00111 , x4, x3
      bne x3,x4, FMAXSFAIL
.global INST53
INST53:
      fmax.s f15 , f2, f3
      FPUSCHECKS f15, 0x7fc00011 , x4, x3
      bne x3,x4, FMAXSFAIL
      FPUQNANCH 0, x4
.global FMINSTEST
FMINSTEST:
      fmin.s f15 , f0, f4
      FPUSCHECKS f15, SpqNaN , x4, x3
      bne x3,x4, FMINSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST55
INST55:
      fmin.s f15 , f2, f6
      FPUSCHECKS f15, SpNorm , x4, x3
      bne x3,x4, FMINSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST56
INST56:
      fmin.s f15 , f6, f7
      FPUSCHECKS f15, SnNorm , x4, x3
      bne x3,x4, FMINSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST57
INST57:
      fmin.s f15 , f0, f0
      FPUSCHECKS f15, 0x7fc01111 , x4, x3
      bne x3,x4, FMINSFAIL
.global INST58
INST58:
      fmin.s f15 , f2, f1
      FPUSCHECKS f15, 0x7fc00111 , x4, x3
      bne x3,x4, FMINSFAIL
.global INST59
INST59:
      fmin.s f15 , f2, f2
      FPUSCHECKS f15, 0x7fc00011 , x4, x3
      bne x3,x4, FMINSFAIL
      FPUQNANCH 0, x4
.global FEQSTEST
FEQSTEST:
      feq.s x1, f0, f6
      bne x1,x0, FEQSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST61
INST61:
      feq.s x1, f2, f4
      bne x1,x0, FEQSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST62
INST62:
      feq.s x1, f7,f7
      li x3,0x1
      bne x1,x3, FEQSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global FLESTEST
FLESTEST:
.global INST63
INST63:
      fle.s x1, f0, f6
      bne x1,x0, FLESFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST64
INST64:
      fle.s x1, f2, f4
      bne x1,x0, FLESFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST65
INST65:
      fle.s x1, f7,f6
      li x3,0x1
      bne x1,x3, FLESFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global FLTSTEST
FLTSTEST:
      flt.s x1, f0, f6
      bne x1,x0, FLTSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST67
INST67:
      flt.s x1, f2, f4
      bne x1,x0, FLTSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST68
INST68:
      flt.s x1, f7,f6
      li x3,0x1
      bne x1,x3, FLTSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f0 0x7ff0000000001111, x4
      FPUMOVD f1 0x7ff0000000000111 , x4
      FPUMOVD f2 0x7ff8000000000011 , x4
      FPUMOVD f3 0x7ff8000000000010 , x4
      FPUMOVD f4 DpInf, x4
      FPUMOVD f5 DnInf, x4
      FPUMOVD f6 DpNorm, x4
      FPUMOVD f7 DnNorm, x4
      FPUMOVD f8 DpDeNorm, x4
      FPUMOVD f9 DnDeNorm, x4
      FPUMOVD f10 DpZero, x4
      FPUMOVD f11 DnZero, x4
.global FMAXDTEST
FMAXDTEST:
      fmax.d f15 , f0, f4
      FPUSCHECKD f15, DpqNaN , x4, x3
      bne x3,x4, FMAXDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST70
INST70:
      fmax.d f15 , f2, f6
      FPUSCHECKD f15, DpNorm , x4, x3
      bne x3,x4, FMAXDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST71
INST71:
      fmax.d f15 , f6, f7
      FPUSCHECKD f15, DpNorm , x4, x3
      bne x3,x4, FMAXDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST72
INST72:
      fmax.d f15 , f0, f0
      FPUSCHECKD f15, 0x7ff8000000001111 , x4, x3
      bne x3,x4, FMAXDFAIL
.global INST73
INST73:
      fmax.d f15 , f2, f1
      FPUSCHECKD f15, 0x7ff8000000000111 , x4, x3
      bne x3,x4, FMAXDFAIL
.global INST74
INST74:
      fmax.d f15 , f2, f3
      FPUSCHECKD f15, 0x7ff8000000000011 , x4, x3
      bne x3,x4, FMAXDFAIL
      FPUQNANCH 0, x4
.global FMINDTEST
FMINDTEST:
      fmin.d f15 , f0, f4
      FPUSCHECKD f15, DpqNaN , x4, x3
      bne x3,x4, FMINDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST76
INST76:
      fmin.d f15 , f2, f6
      FPUSCHECKD f15, DpNorm , x4, x3
      bne x3,x4, FMINDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST77
INST77:
      fmin.d f15 , f6, f7
      FPUSCHECKD f15, DnNorm , x4, x3
      bne x3,x4, FMINDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST78
INST78:
      fmin.d f15 , f0, f0
      FPUSCHECKD f15, 0x7ff8000000001111 , x4, x3
      bne x3,x4, FMINDFAIL
.global INST79
INST79:
      fmin.d f15 , f2, f1
      FPUSCHECKD f15, 0x7ff8000000000111 , x4, x3
      bne x3,x4, FMINDFAIL
.global INST80
INST80:
      fmin.d f15 , f2, f2
      FPUSCHECKD f15, 0x7ff8000000000011 , x4, x3
      bne x3,x4, FMINDFAIL
      FPUQNANCH 0, x4
.global FEQDTEST
FEQDTEST:
      feq.d x1, f0, f6
      bne x1,x0, FEQSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST82
INST82:
      feq.d x1, f2, f4
      bne x1,x0, FEQSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST83
INST83:
      feq.d x1, f7,f7
      li x3,0x1
      bne x1,x3, FEQSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global FLEDTEST
FLEDTEST:
.global INST84
INST84:
      fle.d x1, f0, f6
      bne x1,x0, FLESFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST85
INST85:
      fle.d x1, f2, f4
      bne x1,x0, FLEDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST86
INST86:
      fle.d x1, f7,f6
      li x3,0x1
      bne x1,x3, FLEDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global FLTDTEST
FLTDTEST:
      flt.d x1, f0, f6
      bne x1,x0, FLTDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST88
INST88:
      flt.d x1, f2, f4
      bne x1,x0, FLTDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST89
INST89:
      flt.d x1, f7,f6
      li x3,0x1
      bne x1,x3, FLTDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f0 , 0x7f801111 , x4
      FPUMOVS f1 , 0x7f800111 , x4
      FPUMOVS f2 , 0x7fc00011 , x4
      FPUMOVS f3 , 0x7fc00010 , x4
      FPUMOVS f4 , SpInf , x4
      FPUMOVS f5 , SnInf , x4
      FPUMOVS f6 , 0x40827900 , x4
      FPUMOVS f7 , 0xc0838000 , x4
      FPUMOVS f8 , SpDeNorm, x4
      FPUMOVS f9 , SnDeNorm, x4
      FPUMOVS f10, SpZero , x4
      FPUMOVS f11, SnZero , x4
.global FDIVS
FDIVS:
.global INST90
INST90:
      fdiv.s f15, f0, f1
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST91
INST91:
      fdiv.s f15, f2, f6
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST92
INST92:
      fdiv.s f15, f6, f7
      FPUSCHECKS f15, 0xbf7e0000, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST93
INST93:
      fdiv.s f15, f4, f5
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST94
INST94:
      fdiv.s f15, f10, f11
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f20, 0x71f00000, x3
      FPUMOVS f21, 0x58c00000, x3
.global INST94_1
INST94_1:
      fdiv.s f15, f20, f21, rne
      FPUSCHECKS f15, 0x58a00000, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST94_2
INST94_2:
      fdiv.s f15, f20, f21, rtz
      FPUSCHECKS f15, 0x58a00000, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST94_3
INST94_3:
      fdiv.s f15, f20, f21, rdn
      FPUSCHECKS f15, 0x58a00000, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST94_4
INST94_4:
      fdiv.s f15, f20, f21, rup
      FPUSCHECKS f15, 0x58a00000, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST94_5
INST94_5:
      fdiv.s f15, f20, f21, rmm
      FPUSCHECKS f15, 0x58a00000, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST95
INST95:
      fdiv.s f15, f0, f1
      FPUSCHECKS f15, 0x7fc01111, x4, x3
      bne x3,x4, FDIVSFAIL
.global INST96
INST96:
      fdiv.s f15, f2, f1
      FPUSCHECKS f15, 0x7fc00111, x4, x3
      bne x3,x4, FDIVSFAIL
.global INST97
INST97:
      fdiv.s f15, f4, f4
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FDIVSFAIL
.global INST98
INST98:
      fdiv.s f15, f10, f11
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FDIVSFAIL
      FPUQNANCH 0, x4
.global FSQRTS
FSQRTS:
      fsqrt.s f15, f0
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x30, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST100
INST100:
      fsqrt.s f15, f3
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST101
INST101:
      fsqrt.s f15, f6
      FPUSCHECKS f15, 0x40013afc, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x21, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f20, 0x71a20000,x3
.global INST101_1
INST101_1:
      fsqrt.s f15, f20, rne
      FPUSCHECKS f15, 0x58900000, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST101_2
INST101_2:
      fsqrt.s f15, f20, rtz
      FPUSCHECKS f15, 0x58900000, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST101_3
INST101_3:
      fsqrt.s f15, f20, rdn
      FPUSCHECKS f15, 0x58900000, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST101_4
INST101_4:
      fsqrt.s f15, f20, rup
      FPUSCHECKS f15, 0x58900000, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f15, SpqNaN, x3
.global INST101_5
INST101_5:
      fsqrt.s f15, f20, rmm
      FPUSCHECKS f15, 0x58900000, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST102
INST102:
      fsqrt.s f15, f0
      FPUSCHECKS f15, 0x7fc01111, x4, x3
      bne x3,x4, FSQRTSFAIL
.global INST103
INST103:
      fsqrt.s f15, f2
      FPUSCHECKS f15, 0x7fc00011, x4, x3
      bne x3,x4, FSQRTSFAIL
.global INST104
INST104:
      fsqrt.s f15, f5
      FPUSCHECKS f15, SpqNaN, x4, x3
      bne x3,x4, FSQRTSFAIL
      FPUQNANCH 0, x4
.global FDIVD
FDIVD:
      FPUMOVD f0 , 0x7ff0000000001111 , x4
      FPUMOVD f1 , 0x7ff0000000000111 , x4
      FPUMOVD f2 , 0x7ff8000000000011 , x4
      FPUMOVD f3 , 0x7ff8000000000010 , x4
      FPUMOVD f4 , DpInf , x4
      FPUMOVD f5 , DnInf , x4
      FPUMOVD f6 , 0x1021c71b38e39000 , x4
      FPUMOVD f7 , 0x8ff5555400000000 , x4
      FPUMOVD f8 , DpDeNorm, x4
      FPUMOVD f9 , DnDeNorm, x4
      FPUMOVD f10, DpZero , x4
      FPUMOVD f11, DnZero , x4
.global INST105
INST105:
      fdiv.d f15, f0, f1
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST106
INST106:
      fdiv.d f15, f2, f6
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST107
INST107:
      fdiv.d f15, f6, f7
      FPUSCHECKD f15, 0xc01aaaaa80000000, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST108
INST108:
      fdiv.d f15, f4, f5
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST109
INST109:
      fdiv.d f15, f10, f11
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f20, 0xc035000000000000,x3
      FPUMOVD f21, 0x4018000000000000,x3
.global INST109_1
INST109_1:
      fdiv.d f15, f20, f21, rne
      FPUSCHECKD f15, 0xc00c000000000000, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15,DpqNaN,x3
.global INST109_2
INST109_2:
      fdiv.d f15, f20, f21, rtz
      FPUSCHECKD f15, 0xc00c000000000000, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15,DpqNaN,x3
.global INST109_3
INST109_3:
      fdiv.d f15, f20, f21, rdn
      FPUSCHECKD f15, 0xc00c000000000000, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15,DpqNaN,x3
.global INST109_4
INST109_4:
      fdiv.d f15, f20, f21, rup
      FPUSCHECKD f15, 0xc00c000000000000, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15,DpqNaN,x3
.global INST109_5
INST109_5:
      fdiv.d f15, f20, f21, rmm
      FPUSCHECKD f15, 0xc00c000000000000, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUEXCHK 0x0,x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST110
INST110:
      fdiv.d f15, f0, f1
      FPUSCHECKD f15, 0x7ff8000000001111, x4, x3
      bne x3,x4, FDIVDFAIL
.global INST111
INST111:
      fdiv.d f15, f2, f1
      FPUSCHECKD f15, 0x7ff8000000000111, x4, x3
      bne x3,x4, FDIVDFAIL
.global INST112
INST112:
      fdiv.d f15, f4, f4
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FDIVDFAIL
.global INST113
INST113:
      fdiv.d f15, f10, f11
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FDIVDFAIL
      FPUQNANCH 0, x4
.global FSQRTD
FSQRTD:
      fsqrt.d f15, f0
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x30, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST115
INST115:
      fsqrt.d f15, f3
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST116
INST116:
      fsqrt.d f15, f6
      FPUSCHECKD f15, 0x2807d9f3fd90d976, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x21, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f20, 0x40efc02000000000 x3
.global INST116_1
INST116_1:
      fsqrt.d f15, f20, rne
      FPUSCHECKD f15, 0x406fe00000000000, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15, DpqNaN, x3
.global INST116_2
INST116_2:
      fsqrt.d f15, f20, rtz
      FPUSCHECKD f15, 0x406fe00000000000, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15, DpqNaN, x3
.global INST116_3
INST116_3:
      fsqrt.d f15, f20, rdn
      FPUSCHECKD f15, 0x406fe00000000000, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15, DpqNaN, x3
.global INST116_4
INST116_4:
      fsqrt.d f15, f20, rup
      FPUSCHECKD f15, 0x406fe00000000000, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f15, DpqNaN, x3
.global INST116_5
INST116_5:
      fsqrt.d f15, f20, rmm
      FPUSCHECKD f15, 0x406fe00000000000, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUQNANCH 1, x4
.global INST117
INST117:
      fsqrt.d f15, f0
      FPUSCHECKD f15, 0x7ff8000000001111, x4, x3
      bne x3,x4, FSQRTDFAIL
.global INST118
INST118:
      fsqrt.d f15, f2
      FPUSCHECKD f15, 0x7ff8000000000011, x4, x3
      bne x3,x4, FSQRTDFAIL
.global INST119
INST119:
      fsqrt.d f15, f5
      FPUSCHECKD f15, DpqNaN, x4, x3
      bne x3,x4, FSQRTDFAIL
      FPUEXCHK 0x30,x3,x4
      bne x3,x4, FLAGCFAIL
      FPUQNANCH 0, x4
.global FMULS
FMULS:
      FPUMOVS f0, 0x42d10000, x4
      FPUMOVS f1, 0x436d8000, x4
.global INST120
INST120:
      fmul.s f2, f0, f1
      FPUSCHECKS f2, 0x46c1e580, x4, x3
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f0, SpLFN,x4
      FPUMOVS f1, 0x3fc00000,x4
.global INST121
INST121:
      fmul.s f2,f0,f1
      FPUSCHECKS f2, SpInf,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 1,x3
.global INST122
INST122:
      fmul.s f2,f0,f1
      FPUSCHECKS f2, SpLFN,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 2,x3
.global INST123
INST123:
      fmul.s f2,f0,f1
      FPUSCHECKS f2, SpLFN,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 3,x3
.global INST124
INST124:
      fmul.s f2,f0,f1
      FPUSCHECKS f2, SpInf,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 4,x3
.global INST125
INST125:
      fmul.s f2,f0,f1
      FPUSCHECKS f2, SpInf,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 5,x3
.global INST126
INST126:
      fmul.s f2,f0,f1,rne
      FPUSCHECKS f2, SpInf,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST127
INST127:
      fmul.s f2,f0,f1,rtz
      FPUSCHECKS f2, SpLFN,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST128
INST128:
      fmul.s f2,f0,f1, rdn
      FPUSCHECKS f2, SpLFN,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST129
INST129:
      fmul.s f2,f0,f1, rup
      FPUSCHECKS f2, SpInf,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
.global INST130
INST130:
      fmul.s f2,f0,f1, rmm
      FPUSCHECKS f2, SpInf,x3,x4
      bne x3,x4, FMULSFAIL
      FPUEXCHK 0x25,x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 0, x3
      FPUMOVD f0, 0x4037400000000000 ,x3
      FPUMOVD f1, 0x4011000000000000 ,x3
.global FMULD
FMULD:
.global INST131
INST131:
      fmul.d f2, f0, f1
      FPUSCHECKD f2, 0x4058b40000000000, x3,x4
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x0, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVD f0, DnLFN, x4
      FPUMOVD f1, 0x3ff8000000000000, x4
.global INST132
INST132:
      fmul.d f2, f0, f1
      FPUSCHECKD f2, DnInf, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 1,x3
.global INST133
INST133:
      fmul.d f2, f0, f1
      FPUSCHECKD f2, DnLFN, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 2,x3
.global INST134
INST134:
      fmul.d f2, f0, f1
      FPUSCHECKD f2, DnInf, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 3,x3
.global INST135
INST135:
      fmul.d f2, f0, f1
      FPUSCHECKD f2, DnLFN, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 4,x3
.global INST136
INST136:
      fmul.d f2, f0, f1
      FPUSCHECKD f2, DnInf, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
      FPURMCH 6,x3
.global INST137
INST137:
      fmul.d f2, f0, f1,rne
      FPUSCHECKD f2, DnInf, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST138
INST138:
      fmul.d f2, f0, f1,rtz
      FPUSCHECKD f2, DnLFN, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST139
INST139:
      fmul.d f2, f0, f1,rdn
      FPUSCHECKD f2, DnInf, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST140
INST140:
      fmul.d f2, f0, f1,rup
      FPUSCHECKD f2, DnLFN, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
.global INST141
INST141:
      fmul.d f2, f0, f1,rmm
      FPUSCHECKD f2, DnInf, x4, x3
      bne x3,x4, FMULDFAIL
      FPUEXCHK 0x25, x3,x4
      bne x3,x4,FLAGCFAIL
      FPUMOVS f0, 0x7f7ffffe, x1
      FPUMOVS f1, 0x3f800000, x1
      FPUMOVS f2, 0x73000000, x1
      FPURMCH 0,x3
.global FMADDS
FMADDS:
.global INST142
INST142:
      fmadd.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMADDSFAIL
      FPURMCH 1,x3
.global INST143
INST143:
      fmadd.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMADDSFAIL
      FPURMCH 2 ,x3
.global INST144
INST144:
      fmadd.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMADDSFAIL
      FPURMCH 3,x3
.global INST145
INST145:
      fmadd.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMADDSFAIL
      FPURMCH 4,x3
.global INST146
INST146:
      fmadd.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMADDSFAIL
      FPURMCH 7, x3
.global INST147
INST147:
      fmadd.s f3, f1, f0, f2,rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMADDSFAIL
.global INST148
INST148:
      fmadd.s f3, f1, f0, f2,rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMADDSFAIL
.global INST149
INST149:
      fmadd.s f3, f1, f0, f2,rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMADDSFAIL
.global INST150
INST150:
      fmadd.s f3, f1, f0, f2,rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMADDSFAIL
.global INST151
INST151:
      fmadd.s f3, f1, f0, f2,rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMADDSFAIL
      FPUMOVD f0, 0x7feffffffffffffe ,x3
      FPUMOVD f1, 0x3ff0000000000000 ,x3
      FPUMOVD f2, 0x7c90000000000000 ,x3
      FPURMCH 0,x3
.global FMADDD
FMADDD:
.global INST152
INST152:
      fmadd.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMADDDFAIL
      FPURMCH 1,x3
.global INST153
INST153:
      fmadd.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMADDDFAIL
      FPURMCH 2 ,x3
.global INST154
INST154:
      fmadd.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMADDDFAIL
      FPURMCH 3,x3
.global INST155
INST155:
      fmadd.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMADDDFAIL
      FPURMCH 4,x3
.global INST156
INST156:
      fmadd.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMADDDFAIL
      FPURMCH 6, x3
.global INST157
INST157:
      fmadd.d f3, f1, f0, f2,rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMADDDFAIL
.global INST158
INST158:
      fmadd.d f3, f1, f0, f2,rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMADDDFAIL
.global INST159
INST159:
      fmadd.d f3, f1, f0, f2,rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMADDDFAIL
.global INST160
INST160:
      fmadd.d f3, f1, f0, f2,rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMADDDFAIL
.global INST161
INST161:
      fmadd.d f3, f1, f0, f2,rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMADDDFAIL
.global FMSUBS
FMSUBS:
      FPUMOVS f0, 0x7f7ffffe, x1
      FPUMOVS f1, 0x3f800000, x1
      FPUMOVS f2, 0xf3000000, x1
      FPURMCH 0,x3
.global INST162
INST162:
      fmsub.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMSUBSFAIL
      FPURMCH 1,x3
.global INST163
INST163:
      fmsub.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMSUBSFAIL
      FPURMCH 2 ,x3
.global INST164
INST164:
      fmsub.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMSUBSFAIL
      FPURMCH 3,x3
.global INST165
INST165:
      fmsub.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMSUBSFAIL
      FPURMCH 4,x3
.global INST166
INST166:
      fmsub.s f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMSUBSFAIL
      FPURMCH 0,x3
.global INST167
INST167:
      fmsub.s f3, f1, f0, f2, rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMSUBSFAIL
.global INST168
INST168:
      fmsub.s f3, f1, f0, f2, rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMSUBSFAIL
.global INST169
INST169:
      fmsub.s f3, f1, f0, f2, rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7ffffe, x3, x4
      bne x3,x4, FMSUBSFAIL
.global INST170
INST170:
      fmsub.s f3, f1, f0, f2, rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMSUBSFAIL
      fmsub.s f3, f1, f0, f2, rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f3,0x7f7fffff, x3, x4
      bne x3,x4, FMSUBSFAIL
      FPURMCH 0, x3
.global FMSUBD
FMSUBD:
      FPUMOVD f0, 0x7feffffffffffffe ,x3
      FPUMOVD f1, 0x3ff0000000000000 ,x3
      FPUMOVD f2, 0xfc90000000000000 ,x3
.global INST171
INST171:
      fmsub.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMSUBDFAIL
      FPURMCH 1, x3
.global INST172
INST172:
      fmsub.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMSUBDFAIL
      FPURMCH 2, x3
.global INST173
INST173:
      fmsub.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMSUBDFAIL
      FPURMCH 3, x3
.global INST174
INST174:
      fmsub.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMSUBDFAIL
      FPURMCH 4, x3
.global INST175
INST175:
      fmsub.d f3, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMSUBDFAIL
      FPURMCH 5,x3
.global INST176
INST176:
      fmsub.d f3, f1, f0, f2,rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMSUBDFAIL
.global INST177
INST177:
      fmsub.d f3, f1, f0, f2,rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMSUBDFAIL
.global INST178
INST178:
      fmsub.d f3, f1, f0, f2,rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7feffffffffffffe, x3, x4
      bne x3,x4, FMSUBDFAIL
.global INST179
INST179:
      fmsub.d f3, f1, f0, f2,rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMSUBDFAIL
.global INST180
INST180:
      fmsub.d f3, f1, f0, f2,rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f3,0x7fefffffffffffff, x3, x4
      bne x3,x4, FMSUBDFAIL
.global FNMADDS
FNMADDS:
      FPUMOVS f0, 0x7f7ffffe, x1
      FPUMOVS f1, 0x3f800000, x1
      FPUMOVS f2, 0x73000000, x1
      FPURMCH 0,x3
.global INST181
INST181:
      fnmadd.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 1, x3
.global INST182
INST182:
      fnmadd.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 2, x3
.global INST183
INST183:
      fnmadd.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 3,x3
.global INST184
INST184:
      fnmadd.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 4,x3
.global INST185
INST185:
      fnmadd.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 6,x3
.global INST186
INST186:
      fnmadd.s f4, f1, f0, f2,rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST187
INST187:
      fnmadd.s f4, f1, f0, f2,rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST188
INST188:
      fnmadd.s f4, f1, f0, f2,rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST189
INST189:
      fnmadd.s f4, f1, f0, f2,rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST190
INST190:
      fnmadd.s f4, f1, f0, f2,rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 0, x3
      FPUMOVD f0, 0x7feffffffffffffe ,x3
      FPUMOVD f1, 0x3ff0000000000000 ,x3
      FPUMOVD f2, 0x7c90000000000000 ,x3
.global FNMADDD
FNMADDD:
.global INST191
INST191:
      fnmadd.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffeffffffffffffe, x3,x4
      bne x3,x4, FNMADDDFAIL
      FPURMCH 1,x3
.global INST192
INST192:
      fnmadd.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffeffffffffffffe, x3,x4
      bne x3,x4, FNMADDDFAIL
      FPURMCH 2,x3
.global INST193
INST193:
      fnmadd.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffefffffffffffff, x3,x4
      bne x3,x4, FNMADDDFAIL
      FPURMCH 3,x3
.global INST194
INST194:
      fnmadd.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffeffffffffffffe, x3,x4
      bne x3,x4, FNMADDDFAIL
      FPURMCH 4,x3
.global INST195
INST195:
      fnmadd.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffefffffffffffff, x3,x4
      bne x3,x4, FNMADDDFAIL
      FPURMCH 7,x3
.global INST196
INST196:
      fnmadd.d f4, f1, f0, f2, rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffeffffffffffffe, x3,x4
      bne x3,x4, FNMADDDFAIL
.global INST197
INST197:
      fnmadd.d f4, f1, f0, f2, rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffeffffffffffffe, x3,x4
      bne x3,x4, FNMADDDFAIL
.global INST198
INST198:
      fnmadd.d f4, f1, f0, f2, rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffefffffffffffff, x3,x4
      bne x3,x4, FNMADDDFAIL
.global INST199
INST199:
      fnmadd.d f4, f1, f0, f2, rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffeffffffffffffe, x3,x4
      bne x3,x4, FNMADDDFAIL
.global INST200
INST200:
      fnmadd.d f4, f1, f0, f2, rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0xffefffffffffffff, x3,x4
      bne x3,x4, FNMADDDFAIL
      FPURMCH 0,x1
      FPUMOVS f0, 0x7f7ffffe, x1
      FPUMOVS f1, 0x3f800000, x1
      FPUMOVS f2, 0xf3000000, x1
.global FNMSUBS
FNMSUBS:
.global INST201
INST201:
      fnmsub.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 1,x3
.global INST202
INST202:
      fnmsub.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 2,x3
.global INST203
INST203:
      fnmsub.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4, 0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 3,x3
.global INST204
INST204:
      fnmsub.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 4, x3
.global INST205
INST205:
      fnmsub.s f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 5, x3
.global INST206
INST206:
      fnmsub.s f4, f1, f0, f2,rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST207
INST207:
      fnmsub.s f4, f1, f0, f2, rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST208
INST208:
      fnmsub.s f4, f1, f0, f2, rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST209
INST209:
      fnmsub.s f4, f1, f0, f2, rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7ffffe, x3, x4
      bne x3,x4, FNMSUBSFAIL
.global INST210
INST210:
      fnmsub.s f4, f1, f0, f2,rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKS f4,0xff7fffff, x3, x4
      bne x3,x4, FNMSUBSFAIL
      FPURMCH 0 ,x3
      FPUMOVD f0, 0x7feffffffffffffe ,x3
      FPUMOVD f1, 0xbff0000000000000 ,x3
      FPUMOVD f2, 0x7c90000000000000 ,x3
.global INST211
INST211:
      fnmsub.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7feffffffffffffe, x3,x4
      bne x3,x4, FNMSUBDFAIL
      FPURMCH 1,x3
.global INST212
INST212:
      fnmsub.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7feffffffffffffe, x3,x4
      bne x3,x4, FNMSUBDFAIL
      FPURMCH 2,x3
.global INST213
INST213:
      fnmsub.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7feffffffffffffe, x3,x4
      bne x3,x4, FNMSUBDFAIL
      FPURMCH 3,x3
.global INST214
INST214:
      fnmsub.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7fefffffffffffff, x3,x4
      bne x3,x4, FNMSUBDFAIL
      FPURMCH 4,x3
.global INST215
INST215:
      fnmsub.d f4, f1, f0, f2
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7fefffffffffffff, x3,x4
      bne x3,x4, FNMSUBDFAIL
      FPURMCH 7,x3
.global INST216
INST216:
      fnmsub.d f4, f1, f0, f2,rne
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7feffffffffffffe, x3,x4
      bne x3,x4, FNMSUBDFAIL
.global INST217
INST217:
      fnmsub.d f4, f1, f0, f2, rtz
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7feffffffffffffe, x3,x4
      bne x3,x4, FNMSUBDFAIL
.global INST218
INST218:
      fnmsub.d f4, f1, f0, f2, rdn
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7feffffffffffffe, x3,x4
      bne x3,x4, FNMSUBDFAIL
.global INST219
INST219:
      fnmsub.d f4, f1, f0, f2, rup
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7fefffffffffffff, x3,x4
      bne x3,x4, FNMSUBDFAIL
.global INST220
INST220:
      fnmsub.d f4, f1, f0, f2, rmm
      FPUEXCHK 0x00000021, x3,x4
      bne x3,x4, FLAGCFAIL
      FPUSCHECKD f4, 0x7fefffffffffffff, x3,x4
      bne x3,x4, FNMSUBDFAIL
      j  EXIT

.global EXCEPTION_FAIL
EXCEPTION_FAIL:
      j FAIL
.global FMULSFAIL
FMULSFAIL:
      j FAIL 
.global FMADDSFAIL
FMADDSFAIL:
      j FAIL 
.global FMSUBSFAIL
FMSUBSFAIL:
      j FAIL 
.global FNMADDSFAIL
FNMADDSFAIL:
      j FAIL 
.global FNMSUBSFAIL
FNMSUBSFAIL:
      j FAIL 
.global FMULDFAIL
FMULDFAIL:
      j FAIL 
.global FMADDDFAIL
FMADDDFAIL:
      j FAIL 
.global FMSUBDFAIL
FMSUBDFAIL:
      j FAIL 
.global FNMADDDFAIL
FNMADDDFAIL:
      j FAIL 
.global FNMSUBDFAIL
FNMSUBDFAIL:
      j FAIL 
.global RESULTFAIL
RESULTFAIL:
      j FAIL 
.global FLAGCFAIL
FLAGCFAIL:
      j FAIL 
.global FDIVSFAIL
FDIVSFAIL:
      j FAIL 
.global FRECIPSFAIL
FRECIPSFAIL:
      j FAIL 
.global FSQRTSFAIL
FSQRTSFAIL:
      j FAIL 
.global FDIVDFAIL
FDIVDFAIL:
      j FAIL 
.global FRECIPDFAIL
FRECIPDFAIL:
      j FAIL 
.global FSQRTDFAIL
FSQRTDFAIL:
      j FAIL 
.global FMAXSFAIL
FMAXSFAIL:
      j FAIL 
.global FMINSFAIL
FMINSFAIL:
      j FAIL 
.global FEQSFAIL
FEQSFAIL:
      j FAIL 
.global FLESFAIL
FLESFAIL:
      j FAIL 
.global FLTSFAIL
FLTSFAIL:
      j FAIL 
.global FMAXDFAIL
FMAXDFAIL:
      j FAIL 
.global FMINDFAIL
FMINDFAIL:
      j FAIL 
.global FEQDFAIL
FEQDFAIL:
      j FAIL 
.global FLEDFAIL
FLEDFAIL:
      j FAIL 
.global FLTDFAIL
FLTDFAIL:
      j FAIL 


.global EXIT
EXIT:
  la   x1, __exit
  jr   x1
.global FAIL
    FAIL:
     la   x1, __fail
     jr   x1



#******this region is added by generator******

