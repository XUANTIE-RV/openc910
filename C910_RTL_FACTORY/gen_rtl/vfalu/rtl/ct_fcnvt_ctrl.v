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
module ct_fcnvt_ctrl(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dp_vfalu_ex1_pipex_sel,
  ex1_pipedown,
  ex2_pipedown,
  ex3_pipedown,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @22
input          cp0_vfpu_icg_en;       
input          cp0_yy_clk_en;         
input          cpurst_b;              
input   [2:0]  dp_vfalu_ex1_pipex_sel; 
input          forever_cpuclk;        
input          pad_yy_icg_scan_en;    
output         ex1_pipedown;          
output         ex2_pipedown;          
output         ex3_pipedown;          

// &Regs; @23
reg            ex2_pipedown;          
reg            ex3_pipedown;          

// &Wires; @24
wire           cp0_vfpu_icg_en;       
wire           cp0_yy_clk_en;         
wire           cpurst_b;              
wire    [2:0]  dp_vfalu_ex1_pipex_sel; 
wire           ex1_pipedown;          
wire           ex1_vld_clk;           
wire           ex1_vld_clk_en;        
wire           ex2_vld_clk;           
wire           ex2_vld_clk_en;        
wire           forever_cpuclk;        
wire           pad_yy_icg_scan_en;    


//EX1 Control
// &Force("bus","dp_vfalu_ex1_pipex_sel",2,0); @27
assign ex1_pipedown = dp_vfalu_ex1_pipex_sel[2];
// &Force("output","ex1_pipedown"); @29

//EX2 Control
//gate clk
// &Instance("gated_clk_cell","x_ex1_vld_clk"); @33
gated_clk_cell  x_ex1_vld_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex1_vld_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex1_vld_clk_en    ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @34
//           .clk_out        (ex1_vld_clk),//Out Clock @35
//           .external_en    (1'b0), @36
//           .global_en      (cp0_yy_clk_en), @37
//           .local_en       (ex1_vld_clk_en),//Local Condition @38
//           .module_en      (cp0_vfpu_icg_en) @39
//         ); @40
assign ex1_vld_clk_en = ex1_pipedown || ex2_pipedown;
always @(posedge ex1_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ex2_pipedown <= 1'b0;
  else if(ex1_pipedown)
    ex2_pipedown <= 1'b1;
  else
    ex2_pipedown <= 1'b0;
end
// &Force("output","ex2_pipedown"); @51

//EX3 Control
//gate clk
// &Instance("gated_clk_cell","x_ex2_vld_clk"); @55
gated_clk_cell  x_ex2_vld_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ex2_vld_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ex2_vld_clk_en    ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @56
//           .clk_out        (ex2_vld_clk),//Out Clock @57
//           .external_en    (1'b0), @58
//           .global_en      (cp0_yy_clk_en), @59
//           .local_en       (ex2_vld_clk_en),//Local Condition @60
//           .module_en      (cp0_vfpu_icg_en) @61
//         ); @62
assign ex2_vld_clk_en = ex2_pipedown || ex3_pipedown;
always @(posedge ex2_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ex3_pipedown <= 1'b0;
  else if(ex2_pipedown)
    ex3_pipedown <= 1'b1;
  else
    ex3_pipedown <= 1'b0;
end
// &Force("output","ex3_pipedown"); @73

// //&Force("bus","dp_vfalu_ex1_pipex_func",19,0); @77
// //&Force("output","ex1_simd_pipedown"); @82
// //&Connect( .clk_in         (forever_cpuclk), @87
// //          .clk_out        (ex1_simd_vld_clk),//Out Clock @88
// //          .external_en    (1'b0), @89
// //          .global_en      (cp0_yy_clk_en), @90
// //          .local_en       (ex1_simd_vld_clk_en),//Local Condition @91
// //          .module_en      (cp0_vfpu_icg_en) @92
// //        ); @93
// //&Force("output","ex2_simd_pipedown"); @110
// //&Connect( .clk_in         (forever_cpuclk), @115
// //          .clk_out        (ex2_simd_vld_clk),//Out Clock @116
// //          .external_en    (1'b0), @117
// //          .global_en      (cp0_yy_clk_en), @118
// //          .local_en       (ex2_simd_vld_clk_en),//Local Condition @119
// //          .module_en      (cp0_vfpu_icg_en) @120
// //        ); @121
// ////&Force("output","ex3_simd_pipedown"); @138

// &ModuleEnd; @149
endmodule


