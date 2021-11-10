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

include ./setup/smart_cfg.mk
include ./setup/env_check.mk

################################################################################
# Simulation related
################################################################################
SIM = iverilog
DUMP = off
THREADS = 4

# Generate C++ in executable form
VERILATOR_FLAGS += -cc --exe
# Generate makefile dependencies (not shown as complicates the Makefile)
#VERILATOR_FLAGS += -MMD
# Optimize
VERILATOR_FLAGS += -Os -x-assign 0
# lint-only
VERILATOR_FLAGS += -lint-only
# Warn abount lint issues; may not want this on less solid designs
VERILATOR_FLAGS += -Wno-fatal
# Make waveforms
#VERILATOR_FLAGS += --trace
## Check SystemVerilog assertions
#VERILATOR_FLAGS += --assert
## Generate coverage analysis
#VERILATOR_FLAGS += --coverage
# Run Verilator in debug mode
#VERILATOR_FLAGS += --debug
# Add this trace to get a backtrace in gdb
#VERILATOR_FLAGS += --gdbbt

# Generate C++ in executable form
VERILATOR_FLAGS += -cc --exe
# Generate makefile dependencies (not shown as complicates the Makefile)
#VERILATOR_FLAGS += -MMD
# Optimize
VERILATOR_FLAGS += -Os -x-assign 0
# lint-only
VERILATOR_FLAGS += -lint-only
# Warn abount lint issues; may not want this on less solid designs
VERILATOR_FLAGS += -Wno-fatal
# Make waveforms
#VERILATOR_FLAGS += --trace
## Check SystemVerilog assertions
#VERILATOR_FLAGS += --assert
## Generate coverage analysis
#VERILATOR_FLAGS += --coverage
# Run Verilator in debug mode
#VERILATOR_FLAGS += --debug
# Add this trace to get a backtrace in gdb
#VERILATOR_FLAGS += --gdbbt

ifeq ($(DUMP), on)
ifeq (${SIM}, verilator)
SIM_DUMP := --trace
else
SIM_DUMP :=
endif
else
ifeq (${SIM}, iverilog)
SIM_DUMP = -DNO_DUMP
else
SIM_DUMP := +define+NO_DUMP
endif
endif

ifeq ($(SIM), vcs)
TIMESCALE := -timescale=1ns/100fs
SIMULATOR_OPT := -sverilog -full64 -kdb -lca -debug_access +nospecify +notimingchecks +lint=TFIPC-L
SIMULATOR_DEF := +define+no_warning +define+TSMC_NO_WARNING
SIMULATOR_LOG := -l comp.vcs.log
ifeq ($(UPF), on)
SIMULATOR_POWER_OPT := -upf ../impl/upf/example_cpu_power_spec.upf +define+UPF_INCLUDED
SIMV_POWER_OPT      := +fsdb+power +fsdb+all 
else
SIMULATOR_POWER_OPT := 
SIMV_POWER_OPT      := 
endif
else 
    ifeq ($(SIM), nc) 
    TIMESCALE := -timescale 1ns/100fs
    SIMULATOR_OPT := +v2k -sysv +sv +access+wrc +notimingcheck -default_ext verilog -elaborate +tcl+../setup/nc.tcl
    SIMULATOR_DEF := +define+no_warning +define+TSMC_NO_WARNING +define+VMC +define+NC_SIM 
    SIMULATOR_LOG := -l comp.nc.log
    else
        ifeq ($(SIM), iverilog)
          TIMESCALE := 
          SIMULATOR_OPT := -o xuantie_core.vvp -Diverilog=1 -g2012 
          SIMULATOR_DEF := -DIVERILOG_SIM
          SIMULATOR_LOG := 
        else
            ifeq ($(SIM), verilator)
              SIMULATOR_OPT := -Os -x-assign 0 -Wno-fatal --threads ${THREADS}
              SIMULATOR_DEF := -cc --exe --top-module top 
              SIMULATOR_LOG := 
            else
            endif
        endif
    endif
endif

ifeq ($(SIM), iverilog)
    SIM_FILELIST := $(SIM_FILELIST) -f ${CODE_BASE_PATH}/gen_rtl/filelists/C910_asic_rtl.fl -c ../logical/filelists/smart.fl -c ../logical/filelists/tb.fl
else
    ifeq ($(SIM), verilator)
    SIM_FILELIST := $(SIM_FILELIST) -f ../logical/filelists/sim_verilator.fl
    else
    SIM_FILELIST := $(SIM_FILELIST) -f ../logical/filelists/sim.fl
    endif
endif

compile:
	@echo "  [THead-smart] Compiling smart now ... "
	@echo "  [THead-smart] SIM = $(SIM)"
ifeq ($(SIM), vcs)
	@make -s cleansim
	@cd ./work && vcs $(SIMULATOR_OPT) $(TIMESCALE) $(SIMULATOR_DEF) $(SIM_FILELIST) $(SIM_DUMP) $(SIMULATOR_LOG) $(SIMULATOR_POWER_OPT) 
else 
    ifeq ($(SIM), nc) 
	@cd ./work && irun $(SIMULATOR_OPT) $(TIMESCALE) $(SIMULATOR_DEF) $(SIM_FILELIST) $(SIM_DUMP) $(SIMULATOR_LOG) 
    else
        ifeq ($(SIM), iverilog)
	  @cd ./work && iverilog $(TIMESCALE) $(SIMULATOR_OPT) $(SIMULATOR_DEF) $(SIM_FILELIST) $(SIM_DUMP) $(SIMULATOR_LOG)
        else
            ifeq ($(SIM), verilator)
	      @cd ./work && verilator $(SIMULATOR_OPT) $(SIMULATOR_DEF) $(SIMULATOR_LOG) $(SIM_FILELIST) $(SIM_DUMP)
            else
	      @echo "  [THead-smart] Please specify SIM = vcs to use VCS, or SIM = nc ,or SIM = verilator to use irun ..."
            endif
        endif
    endif 
endif 

buildVerilator:
	@cp ./logical/tb/Makefile_obj ./work/Makefile_obj
	@cd ./work && make -j -C obj_dir -f ../Makefile_obj
cleansim:
	@cd ./work && rm -rf simv* csrc ucli.key *.vcs.log novas_dump.log *.fsdb
cleanVerilator:
	@cd ./work && rm -rf obj_dir/

################################################################################
# Cases related
################################################################################
showcase:
	@echo "  Case lists:" \ 
	@for case in $(CASE_LIST) ; do \
          echo "    $$case"; \
        done

buildcase: tool-chain-chk
ifeq ($(CASE),)
	$(error Please specify CASE=xxx on the command line, like: \
        $(newline)   > make buildcase CASE=xxx... \
        $(newline)   The list of valid cases can be obtained by executing: \
        $(newline)   > make showcase ...)
endif
ifeq ($(findstring $(CASE), $(CASE_LIST)), $(CASE))
	@make -s cleancase
	@make -s $(CASE)_build
else
	$(error Argument CASE=xxx is not valid: \
        $(newline)   The list of valid cases can be obtained by executing: \
        $(newline)   > make showcase ...)
endif


cleancase:
	@cd ./work && rm -rf *.s *.S *.c *.o *.pat *.h *.lcf *.hex *.obj *.vh *.v *.report *.elf Makefile *.case.log

################################################################################
# Combined flows
################################################################################
# Execute one case
runVerilator:
	@cd ./work && obj_dir/Vtop

runcase:
	@make cleanVerilator
ifeq ($(CASE),)
	$(error Please specify CASE=xxx on the command line, like: \
        $(newline)   > make buildcase CASE=xxx... \
        $(newline)   The list of valid cases can be obtained by executing: \
        $(newline)   > make showcase ...)
endif
ifeq ($(findstring $(CASE), $(CASE_LIST)), $(CASE))
	@make -s compile
	@make -s buildcase CASE=$(CASE)
ifeq ($(SIM), vcs)
	cd ./work && ./simv -l run.vcs.log $(SIMV_POWER_OPT)
else
        ifeq ($(SIM), nc)	
		cd ./work && irun -R -l run.irun.log
        else
            ifeq ($(SIM), verilator)
		make buildVerilator
		cd ./work && obj_dir/Vtop	
            else
	        cd ./work && vvp xuantie_core.vvp 
            endif
        endif
endif
else
	$(error Argument CASE=xxx is not valid: \
        $(newline)   The list of valid cases can be obtained by executing: \
        $(newline)   > make showcase ...)
endif

# Execute all cases
regress:
	rm -rf ./tests/regress/regress_result/*
	@(for case in $(CASE_LIST) ; do \
	 rm -rf ./work/* ; \
	 make -s runcase CASE=$$case; \
	 cp ./work/run_case.report ./tests/regress/regress_result/$$case.report; \
	 done)
	cd ./tests/regress && perl report_gen.pl
	cat ./tests/regress/regress_report

################################################################################
# Misc
################################################################################
.DEFAULT_GOAL := help

memlist:
	@make -s compile
	${VERDI_HOME}/share/VIA/Apps/Bin/findInstDefWild.pl -dbdir ./work/simv.daidir -pattern "ct_spsram*" -scope "tb.x_soc.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top" -dump_def_name -outlog ./work/memlist.verdi.log
	perl impl/memlist/memlist.pl 

clean:
	@cd ./work && rm -rf * 

help:
	@echo "  ########## Smart Help Info ##########"
	@echo "  This Makefile is the entrance of T-Head Smart simulation environment"
	@echo "  Usage: make [target] [arguments]";
	@echo "  Available targets:";
	@echo "    compile                         : compile the RTL and Smart tbench (using vcs or ius)";
	@echo "    showcase                        : list all valid cases under current configuration";
	@echo "    buildcase CASE=[casename]       : clean and compile the .c/.s case [casename]";
	@echo "    [casename]_build                : compile the .c/.s case [casename]";
	@echo "    runcase CASE=[casename]         : run the case [casename]";
	@echo "    regress                         : run all cases and summarize the regress result";
	@echo "    memlist                         : generate sram list with the help of VCS/Verdi";
	@echo "    cleansim                        : clean files generated by simulator in ./work ";
	@echo "    cleancase                       : clean files generated by GNU in ./work ";
	@echo "    clean                           : clean ./work ";
	@echo "  Optional arguments:";
	@echo "    SIM=                            : options: vcs / nc / verilator(use version 4.215 or newer)"; 
	@echo "    CASE=                           : options: the list print by 'make showcase'"; 
	@echo "    DUMP=                           : options: on / off";
	@echo "  Examples:";
	@echo "    make runcase CASE=dhry          : run case 'dhry' (by iverilog withtout dump) "; 
	@echo "    make runcase CASE=dhry SIM=nc   : run case 'dhry' (by nc withtout dump) "; 
	@echo "    make runcase CASE=dhry DUMP=on  : run case 'dhry' with dump "; 
	@echo "    make runcase CASE=coremark SIM=verilator THREADS=8 	: run case 'coremark' without dump(by verilator) with 8 threads;
	@echo "    make cleanVerilator		   			: clean the verilator generated file before Verilator operations;
	@echo "    make compile SIM=verilator DUMP=on THREADS=8  	: run compile with dump (by Verilator with dump) with 8 threads;
	@echo "    make buildVerilator             			: run build executable file with Verilator;
	@echo "    make runVerilator	           			: run simulation file with Verilator;
	


