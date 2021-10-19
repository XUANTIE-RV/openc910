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
module ct_had_etm(
  core0_enter_dbg_req_i,
  core0_enter_dbg_req_o,
  core0_exit_dbg_req_i,
  core0_exit_dbg_req_o,
  core1_enter_dbg_req_i,
  core1_enter_dbg_req_o,
  core1_exit_dbg_req_i,
  core1_exit_dbg_req_o,
  cpurst_b,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @2
input        core0_enter_dbg_req_o;   
input        core0_exit_dbg_req_o;    
input        core1_enter_dbg_req_o;   
input        core1_exit_dbg_req_o;    
input        cpurst_b;                
input        forever_cpuclk;          
input        pad_yy_icg_scan_en;      
output       core0_enter_dbg_req_i;   
output       core0_exit_dbg_req_i;    
output       core1_enter_dbg_req_i;   
output       core1_exit_dbg_req_i;    

// &Regs;  @3

// &Wires; @4
wire         core0_enter_dbg_req;     
wire         core0_enter_dbg_req_i;   
wire         core0_enter_dbg_req_o;   
wire         core0_enter_dbg_req_o_ff; 
wire         core0_event_clk_en;      
wire         core0_exit_dbg_req;      
wire         core0_exit_dbg_req_i;    
wire         core0_exit_dbg_req_o;    
wire         core0_exit_dbg_req_o_ff; 
wire         core0_tee;               
wire         core1_enter_dbg_req;     
wire         core1_enter_dbg_req_i;   
wire         core1_enter_dbg_req_o;   
wire         core1_enter_dbg_req_o_ff; 
wire         core1_event_clk_en;      
wire         core1_exit_dbg_req;      
wire         core1_exit_dbg_req_i;    
wire         core1_exit_dbg_req_o;    
wire         core1_exit_dbg_req_o_ff; 
wire         core1_tee;               
wire         core2_enter_dbg_req;     
wire         core2_enter_dbg_req_o_ff; 
wire         core2_event_clk_en;      
wire         core2_exit_dbg_req;      
wire         core2_exit_dbg_req_o_ff; 
wire         core2_tee;               
wire         core3_enter_dbg_req;     
wire         core3_enter_dbg_req_o_ff; 
wire         core3_event_clk_en;      
wire         core3_exit_dbg_req;      
wire         core3_exit_dbg_req_o_ff; 
wire         core3_tee;               
wire         cpurst_b;                
wire         event_clk;               
wire         event_clk_en;            
wire         forever_cpuclk;          
wire         pad_yy_icg_scan_en;      


// &ConnRule(s/^x_/core0_/); @6
// &Instance("ct_had_etm_if", "x_ct_had_etm_if_core0"); @7
ct_had_etm_if  x_ct_had_etm_if_core0 (
  .cpurst_b                 (cpurst_b                ),
  .event_clk                (event_clk               ),
  .x_enter_dbg_req          (core0_enter_dbg_req     ),
  .x_enter_dbg_req_i        (core0_enter_dbg_req_i   ),
  .x_enter_dbg_req_o        (core0_enter_dbg_req_o   ),
  .x_enter_dbg_req_o_ff     (core0_enter_dbg_req_o_ff),
  .x_event_clk_en           (core0_event_clk_en      ),
  .x_exit_dbg_req           (core0_exit_dbg_req      ),
  .x_exit_dbg_req_i         (core0_exit_dbg_req_i    ),
  .x_exit_dbg_req_o         (core0_exit_dbg_req_o    ),
  .x_exit_dbg_req_o_ff      (core0_exit_dbg_req_o_ff )
);


// &Force("output", "core0_enter_dbg_req_i"); @9
// &Force("output", "core0_exit_dbg_req_i"); @10

// &ConnRule(s/^x_/core1_/); @13
// &Instance("ct_had_etm_if", "x_ct_had_etm_if_core1"); @14
ct_had_etm_if  x_ct_had_etm_if_core1 (
  .cpurst_b                 (cpurst_b                ),
  .event_clk                (event_clk               ),
  .x_enter_dbg_req          (core1_enter_dbg_req     ),
  .x_enter_dbg_req_i        (core1_enter_dbg_req_i   ),
  .x_enter_dbg_req_o        (core1_enter_dbg_req_o   ),
  .x_enter_dbg_req_o_ff     (core1_enter_dbg_req_o_ff),
  .x_event_clk_en           (core1_event_clk_en      ),
  .x_exit_dbg_req           (core1_exit_dbg_req      ),
  .x_exit_dbg_req_i         (core1_exit_dbg_req_i    ),
  .x_exit_dbg_req_o         (core1_exit_dbg_req_o    ),
  .x_exit_dbg_req_o_ff      (core1_exit_dbg_req_o_ff )
);


// &Force("output", "core1_enter_dbg_req_i"); @16
// &Force("output", "core1_exit_dbg_req_i"); @17
// &Force("nonport", "core1_enter_dbg_req"); @22
// &Force("nonport", "core1_exit_dbg_req"); @23

// &ConnRule(s/^x_/core2_/); @27
// &Instance("ct_had_etm_if", "x_ct_had_etm_if_core2"); @28
// &Force("output", "core2_enter_dbg_req_i"); @30
// &Force("output", "core2_exit_dbg_req_i"); @31
assign core2_enter_dbg_req_o_ff = 1'b0;
assign core2_exit_dbg_req_o_ff  = 1'b0;
assign core2_event_clk_en       = 1'b0;
// &Force("nonport", "core2_enter_dbg_req"); @36
// &Force("nonport", "core2_exit_dbg_req"); @37

// &ConnRule(s/^x_/core3_/); @41
// &Instance("ct_had_etm_if", "x_ct_had_etm_if_core3"); @42
// &Force("output", "core3_enter_dbg_req_i"); @44
// &Force("output", "core3_exit_dbg_req_i"); @45
assign core3_enter_dbg_req_o_ff = 1'b0;
assign core3_exit_dbg_req_o_ff  = 1'b0;
assign core3_event_clk_en       = 1'b0;
// &Force("nonport", "core3_enter_dbg_req"); @50
// &Force("nonport", "core3_exit_dbg_req"); @51

assign core0_tee = 1'b0;
assign core1_tee = 1'b0;
assign core2_tee = 1'b0;
assign core3_tee = 1'b0;

assign core0_enter_dbg_req = 
                            (core1_enter_dbg_req_o_ff && (core0_tee == core1_tee) ||
                             core2_enter_dbg_req_o_ff && (core0_tee == core2_tee) ||
                             core3_enter_dbg_req_o_ff && (core0_tee == core3_tee));

assign core1_enter_dbg_req = 
                            (core0_enter_dbg_req_o_ff && (core1_tee == core0_tee) ||
                             core2_enter_dbg_req_o_ff && (core1_tee == core2_tee) ||
                             core3_enter_dbg_req_o_ff && (core1_tee == core3_tee));

assign core2_enter_dbg_req =
                            (core0_enter_dbg_req_o_ff && (core2_tee == core0_tee) ||
                             core1_enter_dbg_req_o_ff && (core2_tee == core1_tee) ||
                             core3_enter_dbg_req_o_ff && (core2_tee == core3_tee));

assign core3_enter_dbg_req = 
                            (core0_enter_dbg_req_o_ff && (core3_tee == core0_tee) ||
                             core1_enter_dbg_req_o_ff && (core3_tee == core1_tee) ||
                             core2_enter_dbg_req_o_ff && (core3_tee == core2_tee));


assign core0_exit_dbg_req = 
                           (core1_exit_dbg_req_o_ff && (core0_tee == core1_tee) ||
                            core2_exit_dbg_req_o_ff && (core0_tee == core2_tee) || 
                            core3_exit_dbg_req_o_ff && (core0_tee == core3_tee));

assign core1_exit_dbg_req = 
                           (core0_exit_dbg_req_o_ff && (core1_tee == core0_tee) || 
                            core2_exit_dbg_req_o_ff && (core1_tee == core2_tee) || 
                            core3_exit_dbg_req_o_ff && (core1_tee == core3_tee));

assign core2_exit_dbg_req = 
                           (core0_exit_dbg_req_o_ff && (core2_tee == core0_tee) || 
                            core1_exit_dbg_req_o_ff && (core2_tee == core1_tee) || 
                            core3_exit_dbg_req_o_ff && (core2_tee == core3_tee));

assign core3_exit_dbg_req =
                           (core0_exit_dbg_req_o_ff && (core3_tee == core0_tee) ||
                            core1_exit_dbg_req_o_ff && (core3_tee == core1_tee) || 
                            core2_exit_dbg_req_o_ff && (core3_tee == core2_tee));

assign event_clk_en = core0_event_clk_en
                    | core1_event_clk_en
                    | core2_event_clk_en
                    | core3_event_clk_en;


// &Instance("gated_clk_cell", "x_ct_event_io_gated_clk"); @113
gated_clk_cell  x_ct_event_io_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (event_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (event_clk_en      ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @114
//          .external_en (1'b0), @115
//          .global_en   (1'b1), @116
//          .module_en   (1'b0), @117
//          .local_en    (event_clk_en), @118
//          .clk_out     (event_clk)); @119

// &ModuleEnd; @121
endmodule



