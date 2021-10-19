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
#############################################################################################
# For Upper Level Flatten STA: set parent_path, e.g. "soc_top/aaa_top/bbb_top/"
# Keep Default Settings for Block-Level Implementation
#############################################################################################

if {![info exist parent_path]}  { set parent_path  "" } ;# Default ""

################################################################################
# Initial variables for synthesis; modify this part based on design
################################################################################

if {$parent_path==""} {

set IF_READ_BUIDIN_VARIABLES	1 ;# For standalone usage, set to "1" ; For synthesis, set to "0"

set CPU_PERIOD			[expr (1000.00/1500)] ;# CPU is constrained at 1000MHz

if {$IF_READ_BUIDIN_VARIABLES} {
   set SETUP_UNCERTAINTY	0.10
   set HOLD_UNCERTAINTY		0.04
   set MAX_FANOUT		32
   set MAX_TRANSITION		0.1

   set DRIVING_CELL             "BUFFD2BWP6T16P96CPDLVT"
   set LOAD_PIN			"AN2D2BWP6T16P96CPDLVT/A1"
}

}

# User-Edit Ends Here

#################################################################################
# Procs Used in this File
#################################################################################

proc list_add_prefix {input_list prefix} {
   set output_list ""
   foreach element $input_list {
      lappend output_list ${prefix}${element}
   }
   return "$output_list"
}

proc get_args_port_pin {input_list} {
   if {[string match */* $input_list]} {
      return "-through \[get_pins \{$input_list\}\]"
   } elseif {[string match *in* [get_attribute [get_ports [lindex $input_list 0]] direction]]} {
      return "-from \[get_ports \{$input_list\}\]"
   } elseif {[string match *out* [get_attribute [get_ports [lindex $input_list 0]] direction]]} {
      return "-to \[get_ports \{$input_list\}\]"
   } else {
      echo "! port_pin_list check failed for $input_list, mixing inputs, outputs, or pins is not allowed"
   }
}

if {$synopsys_program_name=="pt_shell"} {
   proc get_flat_pins {arg} {
      get_pins -hier -filter "is_hierarchical==false && full_name=~$arg"
   }
   proc get_flat_cells {arg} {
      get_cells -hier -filter "is_hierarchical==false && full_name=~$arg"
   }
}

#################################################################################
# Basic Constraints
#################################################################################

if {$parent_path==""} {
   set CLK_PORTS	[get_ports {*clk *clock *tck}]
   set DATA_INPUTS	[remove_from_collection [all_inputs] $CLK_PORTS]
   
   set_max_fanout $MAX_FANOUT [current_design]
   set_max_transition $MAX_TRANSITION [current_design]
   set_input_transition 0.1 $CLK_PORTS
   set_load [expr [load_of [get_lib_pins */$LOAD_PIN]]*5.0] [all_outputs]
   set_driving_cell -lib_cell $DRIVING_CELL $DATA_INPUTS
   
   create_clock [get_ports pll_core_clk] -name CPU_CLK -period $CPU_PERIOD
   
   create_clock -name V_CPUCLK -period $CPU_PERIOD 
    
   set_clock_uncertainty -setup $SETUP_UNCERTAINTY [all_clocks]
   set_clock_uncertainty -hold $HOLD_UNCERTAINTY [all_clocks]
}

################################################################################
# Ports Constrains
################################################################################

################################################################################
# Timing Exceptions 
################################################################################


##### normal asyn: true async
set ASYNC_NORM_IN {
pad_biu_me_int
pad_biu_ms_int
pad_biu_mt_int
pad_biu_se_int
pad_biu_ss_int
pad_biu_st_int
}

if {$parent_path==""} {
   set_input_delay  -max [expr $CPU_PERIOD*-2] -clock V_CPUCLK [get_ports $ASYNC_NORM_IN]
   set_input_delay  -min 0 -clock V_CPUCLK [get_ports $ASYNC_NORM_IN]
   
} else {
  eval  set_max_delay [expr $CPU_PERIOD*3] -ignore_clock_latency [get_args_port_pin [list_add_prefix $ASYNC_NORM_IN $parent_path]]
}



##### dbg data and ctrl: false path between CPU and JTG domian
set ASYNC_DBG_DATA_IN  {ir_corex_wdata*}
set ASYNC_DBG_DATA_OUT {x_regs_serial_data*}
set ASYNC_DBG_CTRL_IN  {sm_update_dr sm_update_ir}

if {$parent_path==""} {
   set_input_delay -max [expr $CPU_PERIOD*-2] -clock V_CPUCLK [list_add_prefix "$ASYNC_DBG_DATA_IN $ASYNC_DBG_CTRL_IN" $parent_path]
   set_input_delay -min  0 -clock V_CPUCLK [list_add_prefix "$ASYNC_DBG_DATA_IN $ASYNC_DBG_CTRL_IN" $parent_path]
   set_output_delay -max [expr $CPU_PERIOD*-2] -clock V_CPUCLK [list_add_prefix "$ASYNC_DBG_DATA_OUT" $parent_path]
   set_output_delay -min 0  -clock V_CPUCLK [list_add_prefix "$ASYNC_DBG_DATA_OUT" $parent_path]
} else {
   set_max_delay 10 -thr [get_pins [list_add_prefix "$ASYNC_DBG_DATA_IN" $parent_path]]
   set_false_path -hold -thr [get_pins [list_add_prefix "$ASYNC_DBG_DATA_IN" $parent_path]]

   set_max_delay 10 -thr [get_pins [list_add_prefix "$ASYNC_DBG_CTRL_IN" $parent_path]]
   set_false_path -hold -thr [get_pins [list_add_prefix "$ASYNC_DBG_CTRL_IN" $parent_path]]

   set_max_delay 10 -thr [get_pins [list_add_prefix "$ASYNC_DBG_DATA_OUT" $parent_path]]
   set_false_path -hold -thr [get_pins [list_add_prefix "$ASYNC_DBG_DATA_OUT" $parent_path]]
}

###CPU_Ports#############
set exclude_inputs  [list_add_prefix [concat $ASYNC_NORM_IN $ASYNC_DBG_DATA_IN $ASYNC_DBG_CTRL_IN]   $parent_path]
set exclude_outputs [list_add_prefix [concat $ASYNC_DBG_DATA_OUT ]    $parent_path]
if {$parent_path==""} {

   set CPU_CLK_INS  [remove_from_collection $DATA_INPUTS  [get_ports "$exclude_inputs"]]
   set CPU_CLK_OUTS [remove_from_collection [all_outputs] [get_ports "$exclude_outputs"]]


   set_input_delay  -max [expr $CPU_PERIOD*0.5] -clock V_CPUCLK $CPU_CLK_INS
   set_input_delay  -min 0 -clock V_CPUCLK $CPU_CLK_INS

   set_output_delay -max [expr $CPU_PERIOD*0.5] -clock V_CPUCLK $CPU_CLK_OUTS
   set_output_delay -min  0 -clock V_CPUCLK $CPU_CLK_OUTS

}



##### Constant signal
set CONSTANT {
pad_core_hartid*
pad_xx_apb_base*
pad_core_rvba*
}

eval set_max_delay 10  [get_args_port_pin [list_add_prefix $CONSTANT $parent_path]]


###### reset: true async, "multicycle 3" can be relaxed
set RESET {
pad_core_rst_b
pad_cpu_rst_b
pad_yy_scan_rst_b
}
if {$parent_path==""} {
   set_input_delay  -max [expr $CPU_PERIOD*-2] -clock V_CPUCLK [get_ports $RESET]
   set_input_delay  -min 0 -clock V_CPUCLK [get_ports $RESET]
} else {
  eval set_max_delay 10 [get_args_port_pin [list_add_prefix $RESET $parent_path]]
}

# Debug IO, can set false path
set DEBUG {
*pad_retire* 
*pad_mstatus*
}

if {$parent_path==""} {
   set_output_delay -max [expr $CPU_PERIOD*-2] -clock V_CPUCLK [get_ports $DEBUG]
   set_output_delay -min 0     -clock V_CPUCLK [get_ports $DEBUG]
}



################################################################################
# DFT signals 
################################################################################

if {$parent_path==""} {

if {[sizeof_collection [get_ports -quiet pad_yy_mbist_mode]]} {
   set_false_path -from [get_ports pad_yy_mbist_mode]
}

set_case_analysis 0 [get_ports pad_yy_scan_mode]
set_case_analysis 0 [get_ports pad_yy_icg_scan_en]
if {[sizeof_collection [get_ports -quiet pad_yy_scan_enable]]} {
   set_case_analysis 0 [get_ports pad_yy_scan_enable]
}

}
