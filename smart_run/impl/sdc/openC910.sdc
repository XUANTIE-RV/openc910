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
#                              set cpu clock name of current chip, e.g. PLL_CLK_DIV4
# Keep Default Settings for Block-Level Implementation
#############################################################################################

if {![info exist parent_path]}  { set parent_path  "" } ;# Default ""
if {![info exist CPU_CLOCK_NAME]} { set CPU_CLOCK_NAME CPU_CLK } ;# Default CPU_CLK



################################################################################
# Initial variables for synthesis; modify this part based on design
################################################################################
set IF_READ_BUIDIN_VARIABLES  1 ;# For standalone usage, set to "1" ; For synthesis, set to "0"

set IF_MULTICYCLE_L2C_DATA      1 ;# If L2Cache Data Array paths are multi-cycle, set to "1"
set MULTICYCLE_L2C_DATA         2 ;# path_multiplier for L2Cache Data Array, possible: 2, 3 and 4

set IF_MULTICYCLE_L2C_TAG_DIRTY 1 ;# If L2Cache Dirty/Tag Array paths are multi-cycle, set to "1"
set MULTICYCLE_L2C_TAG_DIRTY    2 ;# path_multiplier for L2Cache Tag/Dirty Array, possible: 2, 3 and 4

set SYS2CPU_CLK_RATIO           2 ;# Set ratio(multicycle) for sys axi clk compared to cpuclk, default "2"


set CPU_PERIOD      [expr (1000.00/1500)] ;# CPU is constrained at 1.0GHz
set JTG_PERIOD      [expr (1000.00/50)] ;# JTG is constrained at 50MHz

if {$IF_READ_BUIDIN_VARIABLES} {
   set SETUP_UNCERTAINTY  0.1
   set HOLD_UNCERTAINTY   0.04
   set MAX_FANOUT   32
   set MAX_TRANSITION   0.1

   set DRIVING_CELL             "BUFFD2BWP6T16P96CPDLVT"
   set LOAD_PIN     "AN2D2BWP6T16P96CPDLVT/A1"
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
   set SYS_PERIOD               [expr $CPU_PERIOD * $SYS2CPU_CLK_RATIO * 1.0]
   set PLIC_PERIOD              [expr $CPU_PERIOD * 2.0]

   set CLK_INPUTS               [get_ports {*clk *clock *tck}]
   set DATA_INPUTS              [remove_from_collection [all_inputs] $CLK_INPUTS]
   
   set_max_fanout $MAX_FANOUT [current_design]
   set_max_transition $MAX_TRANSITION [current_design]
   set_input_transition 0.1 $CLK_INPUTS
   set_load [expr [load_of [get_lib_pins */$LOAD_PIN]]*5.0] [all_outputs]
   set_driving_cell -lib_cell $DRIVING_CELL $DATA_INPUTS
   
   create_clock [get_ports pad_had_jtg_tclk] -name JTG_CLK -period $JTG_PERIOD 
   create_clock [get_ports pll_cpu_clk] -name $CPU_CLOCK_NAME -period $CPU_PERIOD
   
   create_clock -name V_CPU_CLK -period $CPU_PERIOD
   create_clock -name V_SYS_CLK -period $SYS_PERIOD
   create_clock -name V_JTG_CLK -period $JTG_PERIOD
}
 
################################################################################
# Generated Clock: PLIC
################################################################################
create_generated_clock -name PLIC_CLK -source [get_attribute [get_clock $CPU_CLOCK_NAME] sources] -edges {1 2 5} \
   [filter [get_flat_pins ${parent_path}x_ct_mp_clk_top?x_apb_gated_clk?x_gated_clk_cell*/*] direction==out]
set_multicycle_path -from $CPU_CLOCK_NAME -to PLIC_CLK -setup 2 -start
set_multicycle_path -from $CPU_CLOCK_NAME -to PLIC_CLK -hold  1 -start
set_multicycle_path -to $CPU_CLOCK_NAME -from PLIC_CLK -setup 2 -end
set_multicycle_path -to $CPU_CLOCK_NAME -from PLIC_CLK -hold  1 -end
################################################################################
# SYSTEM AXI CLK 
################################################################################
if {$parent_path == ""} { 
  if {$SYS2CPU_CLK_RATIO>1} {
     set_multicycle_path -from $CPU_CLOCK_NAME -to V_SYS_CLK -setup $SYS2CPU_CLK_RATIO -start
     set_multicycle_path -from $CPU_CLOCK_NAME -to V_SYS_CLK -hold  [expr $SYS2CPU_CLK_RATIO - 1] -start
     set_multicycle_path -to $CPU_CLOCK_NAME -from V_SYS_CLK -setup $SYS2CPU_CLK_RATIO -end
     set_multicycle_path -to $CPU_CLOCK_NAME -from V_SYS_CLK -hold  [expr $SYS2CPU_CLK_RATIO - 1] -end
  
  }
}
################################################################################
# Generated Clock: L2Cache Data Mem
################################################################################

if {$IF_MULTICYCLE_L2C_DATA} {

switch $MULTICYCLE_L2C_DATA {
2       { set clock_edge {1 2 5} }
3       { set clock_edge {1 2 7} }
4       { set clock_edge {1 2 9} }
}

set i 0
foreach_in_collection clock_pin \
   [filter [get_flat_pins ${parent_path}*l2cache_data_ram_gated_clk*x_gated_clk_cell*/*] direction==out] {
   create_generated_clock -name L2C_DATA_MEM_CLOCK_${i} \
      -source [get_attribute [get_clock $CPU_CLOCK_NAME] sources] \
      -edges $clock_edge $clock_pin
   incr i
}

set_multicycle_path -from [get_clocks L2C_DATA_MEM_CLOCK_*] -to $CPU_CLOCK_NAME \
   -setup $MULTICYCLE_L2C_DATA -end
set_multicycle_path -from [get_clocks L2C_DATA_MEM_CLOCK_*] -to $CPU_CLOCK_NAME \
   -hold [expr $MULTICYCLE_L2C_DATA - 1] -end

}

################################################################################
# Generated Clock: L2Cache Tag & Dirty
################################################################################

if {$IF_MULTICYCLE_L2C_TAG_DIRTY} {

switch $MULTICYCLE_L2C_TAG_DIRTY {
2       { set clock_edge {1 2 5} }
3       { set clock_edge {1 2 7} }
4       { set clock_edge {1 2 9} }
}

set i 0
foreach_in_collection clock_pin \
   [filter [get_flat_pins ${parent_path}*l2cache_tag_ram_gated_clk*x_gated_clk_cell*/*] direction==out] {
   create_generated_clock -name L2C_TAG_MEM_CLOCK_${i} \
      -source [get_attribute [get_clock $CPU_CLOCK_NAME] sources] \
      -edges $clock_edge $clock_pin
   incr i
}

set_multicycle_path -from [get_clocks L2C_TAG_MEM_CLOCK_*] -to $CPU_CLOCK_NAME \
   -setup $MULTICYCLE_L2C_TAG_DIRTY -end
set_multicycle_path -from [get_clocks L2C_TAG_MEM_CLOCK_*] -to $CPU_CLOCK_NAME \
   -hold [expr $MULTICYCLE_L2C_TAG_DIRTY - 1] -end

}

################################################################################
# Ports Constrains
################################################################################

##### PLIC Ports
set PLIC_INPUTS {pad_plic_int*}

eval set_max_delay 10     [get_args_port_pin [list_add_prefix $PLIC_INPUTS $parent_path]]
eval set_false_path -hold [get_args_port_pin [list_add_prefix $PLIC_INPUTS $parent_path]]

##### JTG Ports
set JTG_INPUTS  {pad_had_jtg_*}
set JTG_OUTPUTS {had_pad_jtg_*}

if {$parent_path==""} {
   set_input_delay  -max [expr $JTG_PERIOD*0.4] -clock V_JTG_CLK [get_ports $JTG_INPUTS]
   set_input_delay  -min 0                      -clock V_JTG_CLK [get_ports $JTG_INPUTS]

   set_output_delay -max [expr $JTG_PERIOD*0.4] -clock V_JTG_CLK [get_ports $JTG_OUTPUTS]
   set_output_delay -min 0 -clock V_JTG_CLK [get_ports $JTG_OUTPUTS]
}

##### CPU Ports
set CPU_INPUTS {axim_clk_en}

if {$parent_path==""} {
   set_input_delay  -max [expr $CPU_PERIOD*0.4] -clock V_CPU_CLK [get_ports $CPU_INPUTS]
   set_input_delay  -min 0 -clock V_CPU_CLK [get_ports $CPU_INPUTS]
}

##### SYS Ports
set exclude_inputs  [list_add_prefix [concat $PLIC_INPUTS $JTG_INPUTS $CPU_INPUTS] $parent_path]
set exclude_outputs [list_add_prefix $JTG_OUTPUTS $parent_path]

if {$parent_path==""} {

   set SYS_CLK_INS  [remove_from_collection $DATA_INPUTS [get_ports $exclude_inputs]]
   set SYS_CLK_OUTS [remove_from_collection [all_outputs] [get_ports $exclude_outputs]]

   set_input_delay  -max [expr $SYS_PERIOD*0.4] -clock V_SYS_CLK $SYS_CLK_INS
   set_input_delay  -min 0 -clock V_SYS_CLK $SYS_CLK_INS
   
   set_output_delay -max [expr $SYS_PERIOD*0.6] -clock V_SYS_CLK $SYS_CLK_OUTS
   set_output_delay -min 0 -clock V_SYS_CLK $SYS_CLK_OUTS

} 

##### Async Reset & Constants
set RESET {*_rst_b}
eval set_max_delay 10 [get_args_port_pin [list_add_prefix $RESET $parent_path]]

set CONSTANTS {
pad_core*_rvba*
pad_core*_hartid*
pad_plic_int_cfg*
pad_cpu_apb_base*
pad_l2c_data_mbist_clk_ratio*
pad_l2c_tag_mbist_clk_ratio*
}
eval set_max_delay 10 [get_args_port_pin [list_add_prefix $CONSTANTS $parent_path]]
   
##### Debug IO NOTE: debug signals are supposed to be Floating in top
set DEBUG {
core*pad_retire*
core*pad_mstatus*
}


if {$parent_path==""} {
   set_output_delay -max [expr $CPU_PERIOD*-2] -clock V_CPU_CLK [get_ports $DEBUG]
   set_output_delay -min 0  -clock V_CPU_CLK [get_ports $DEBUG]
}
################################################################################
# Include Timing Exceptions in ct_top
################################################################################

set current_path $parent_path
set sdc_path [file dir [file normalize [info script]]]

set num_cores [sizeof_collection [get_cells ${parent_path}x_ct_top_*]]
for {set i 0} {$i<$num_cores} {incr i} {
   set parent_path "${current_path}x_ct_top_${i}/"
   echo "Starting to read sdc for $parent_path"
   source -e -v ${sdc_path}/ct_top.sdc
}

set parent_path $current_path

################################################################################

if {$parent_path!=""} { return }
unset parent_path

################################################################################

group_path -name INPUT  -from [all_inputs]
group_path -name OUTPUT -to [all_outputs]
group_path -name COMBO  -from [all_inputs] -to [all_outputs]

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [all_clocks]
set_clock_uncertainty -hold $HOLD_UNCERTAINTY [all_clocks]

################################################################################
# False Paths Between Clock Domains
# ( Note: Paths between other clocks and JTG clock does not exist )
################################################################################
set_clock_groups -async -group [get_clocks *JTG_CLK] -group [get_clocks [list $CPU_CLOCK_NAME V_SYS_CLK V_CPU_CLK]] -allow_path


set_max_delay 10 -from [get_clocks [list $CPU_CLOCK_NAME V_SYS_CLK V_CPU_CLK]] -to [get_clocks *JTG_CLK]
set_max_delay 10 -from [get_clocks *JTG_CLK] -to [get_clocks [list $CPU_CLOCK_NAME V_SYS_CLK V_CPU_CLK]]

set_false_path -hold -from  [get_clocks [list $CPU_CLOCK_NAME V_SYS_CLK V_CPU_CLK]] -to [get_clocks *JTG_CLK]
set_false_path -hold -from [get_clocks *JTG_CLK] -to [get_clocks [list $CPU_CLOCK_NAME V_SYS_CLK V_CPU_CLK]]


################################################################################
# DFT Signals
################################################################################

if {[sizeof_collection [get_ports -quiet pad_yy_mbist_mode]]} {
   set_false_path -from [get_ports pad_yy_mbist_mode]
}

set_case_analysis 0 [get_ports pad_yy_scan_mode]
set_case_analysis 0 [get_ports pad_yy_icg_scan_en]
if {[sizeof_collection [get_ports -quiet pad_yy_scan_enable]]} {
   set_case_analysis 0 [get_ports pad_yy_scan_enable]
}

