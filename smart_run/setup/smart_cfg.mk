#/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#*/
CPU_ARCH_FLAG_0 := c910
CASE_LIST := \
      ISA_AMO \
      smoke_bus \
      debug_gpr \
      ISA_THEAD \
      cache_op \
      debug_memory \
      ISA_FP \
      ISA_IMAC \
      coremark \
      hello_world \
      MMU \
      csr \
      ISA_BARRIER \
      plic_int \
      sleep \


ISA_AMO_build:
	@cp ./tests/cases/ISA/ISA_AMO/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=ISA_AMO FILE=ct_lsu_amo_basic_smart >& ISA_AMO_build.case.log 


smoke_bus_build:
	@cp ./tests/cases/smoke/bus_smoke/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=smoke_bus FILE=ct_bus_smoke >& smoke_bus_build.case.log 


 


debug_gpr_build:
	@cp ./tests/cases/debug/debug_gpr/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=debug_gpr FILE=debug_read_write_gpr >& debug_gpr_build.case.log 


ISA_THEAD_build:
	@cp ./tests/cases/ISA/ISA_THEAD/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=ISA_THEAD FILE=isa_thead_smoke >& ISA_THEAD_build.case.log 


cache_op_build:
	@cp ./tests/cases/cache/idcache_oper/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=cache_op FILE=ct_idcache_oper >& cache_op_build.case.log 


debug_memory_build:
	@cp ./tests/cases/debug/debug_memory/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=debug_memory FILE=debug_read_write_memory >& debug_memory_build.case.log 


ISA_FP_build:
	@cp ./tests/cases/ISA/ISA_FP/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=ISA_FP FILE=ct_fpu_smoke >& ISA_FP_build.case.log 


ISA_IMAC_build:
	@cp ./tests/cases/ISA/ISA_IMAC/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=ISA_IMAC FILE=ct_imac_smoke >& ISA_IMAC_build.case.log 


coremark_build:
	@cp ./tests/cases/coremark/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=coremark FILE=core_main >& coremark_build.case.log 


hello_world_build:
	@cp ./tests/cases/hello_world/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=hello_world FILE=hello_world >& hello_world_build.case.log 


MMU_build:
	@cp ./tests/cases/MMU/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=MMU FILE=ct_mmu_basic >& MMU_build.case.log 


ISA_VECTOR_build:
	@cp ./tests/cases/ISA/ISA_VECTOR/VECTOR_SMOKE/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=ISA_VECTOR FILE=ct_vdsp_smoke >& ISA_VECTOR_build.case.log 


csr_build:
	@cp ./tests/cases/csr/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=csr FILE=ct_csr_operate >& csr_build.case.log 


ISA_BARRIER_build:
	@cp ./tests/cases/ISA/ISA_BARRIER/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=ISA_BARRIER FILE=ct_lsu_barrier_smart >& ISA_BARRIER_build.case.log 


plic_int_build:
	@cp ./tests/cases/interrupt/int_smoke/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=plic_int FILE=ct_plic_int_smoke >& plic_int_build.case.log 


sleep_build:
	@cp ./tests/cases/sleep/* ./work
	@find ./tests/lib/ -maxdepth 1 -type f -exec cp {} ./work/ \; 
	@cp ./tests/lib/clib/* ./work
	@cp ./tests/lib/newlib_wrap/* ./work
	@cd ./work && make -s clean && make -s all CPU_ARCH_FLAG_0=c910  ENDIAN_MODE=little-endian CASENAME=sleep FILE=sleep_test >& sleep_build.case.log 


# Adjust verilog filelist for *.v case...
ifeq ($(CASE), debug_gpr)
SIM_FILELIST := ../tests/cases/debug/debug_gpr/had_drv.vh ../tests/cases/debug/debug_gpr/debug_read_write_gpr.v
endif
ifeq ($(CASE), debug_memory)
SIM_FILELIST := ../tests/cases/debug/debug_memory/had_drv.vh ../tests/cases/debug/debug_memory/debug_read_write_memory.v
endif
ifeq ($(CASE), plic_int)
SIM_FILELIST := ../tests/cases/interrupt/int_smoke/ct_plic_int_smoke_hw.v
endif
ifeq ($(CASE), sleep)
SIM_FILELIST := ../tests/cases/sleep/sleep_test.vh
endif


define newline


endef


