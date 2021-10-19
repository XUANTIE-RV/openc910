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

// &ModuleBeg; @14
module ct_vfmau_ctrl(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_ex5_fma_wb_vld,
  ctrl_ex1_ex2_en,
  ctrl_ex1_inst_vld,
  ctrl_ex2_inst_vld,
  ctrl_ex3_inst_vld,
  ctrl_ex4_inst_vld,
  ctrl_ex5_inst_vld,
  dp_vfmau_ex1_pipex_sel,
  dp_xx_ex1_half,
  dp_xx_ex2_half,
  dp_xx_ex3_fma,
  dp_xx_ex3_half,
  dp_xx_ex4_fma,
  dp_xx_ex4_half,
  dp_xx_ex4_mult_id,
  forever_cpuclk,
  mult1_ex1_ex2_pipedown,
  mult1_ex2_ex3_pipedown,
  mult1_ex3_ex4_pipedown,
  mult1_ex4_ex5_pipedown,
  mult_ex1_ex2_half_pipedown,
  mult_ex2_ex3_half_pipedown,
  mult_ex3_ex4_half_pipedown,
  mult_ex4_ex5_half_pipedown,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush
);

// &Ports; @15
input          cp0_vfpu_icg_en;           
input          cp0_yy_clk_en;             
input          cpurst_b;                  
input          dp_vfmau_ex1_pipex_sel;    
input          dp_xx_ex1_half;            
input          dp_xx_ex2_half;            
input          dp_xx_ex3_fma;             
input          dp_xx_ex3_half;            
input          dp_xx_ex4_fma;             
input          dp_xx_ex4_half;            
input          dp_xx_ex4_mult_id;         
input          forever_cpuclk;            
input          pad_yy_icg_scan_en;        
input          rtu_yy_xx_flush;           
output         ctrl_dp_ex5_fma_wb_vld;    
output         ctrl_ex1_ex2_en;           
output         ctrl_ex1_inst_vld;         
output         ctrl_ex2_inst_vld;         
output         ctrl_ex3_inst_vld;         
output         ctrl_ex4_inst_vld;         
output         ctrl_ex5_inst_vld;         
output         mult1_ex1_ex2_pipedown;    
output         mult1_ex2_ex3_pipedown;    
output         mult1_ex3_ex4_pipedown;    
output         mult1_ex4_ex5_pipedown;    
output         mult_ex1_ex2_half_pipedown; 
output         mult_ex2_ex3_half_pipedown; 
output         mult_ex3_ex4_half_pipedown; 
output         mult_ex4_ex5_half_pipedown; 

// &Regs; @16
reg            ctrl_ex2_inst_vld;         
reg            ctrl_ex3_inst_vld;         
reg            ctrl_ex4_inst_vld;         
reg            ctrl_ex5_fma_wb_vld;       
reg            ctrl_ex5_inst_vld;         

// &Wires; @17
wire           cp0_vfpu_icg_en;           
wire           cp0_yy_clk_en;             
wire           cpurst_b;                  
wire           ctrl_dp_ex5_fma_wb_vld;    
wire           ctrl_ex1_ex2_clk;          
wire           ctrl_ex1_ex2_en;           
wire           ctrl_ex1_inst_vld;         
wire           ctrl_ex2_ex3_clk;          
wire           ctrl_ex2_ex3_en;           
wire           ctrl_ex3_en;               
wire           ctrl_ex3_ex4_clk;          
wire           ctrl_ex4_en;               
wire           ctrl_ex4_ex5_clk;          
wire           ctrl_ex4_fma_wb_vld;       
wire           dp_vfmau_ex1_pipex_sel;    
wire           dp_xx_ex1_half;            
wire           dp_xx_ex2_half;            
wire           dp_xx_ex3_fma;             
wire           dp_xx_ex3_half;            
wire           dp_xx_ex4_fma;             
wire           dp_xx_ex4_half;            
wire           dp_xx_ex4_mult_id;         
wire           forever_cpuclk;            
wire           mult1_ex1_ex2_pipedown;    
wire           mult1_ex2_ex3_pipedown;    
wire           mult1_ex3_ex4_pipedown;    
wire           mult1_ex4_ex5_pipedown;    
wire           mult_ex1_ex2_half_pipedown; 
wire           mult_ex2_ex3_half_pipedown; 
wire           mult_ex3_ex4_half_pipedown; 
wire           mult_ex4_ex5_half_pipedown; 
wire           pad_yy_icg_scan_en;        
wire           rtu_yy_xx_flush;           


// &Depend("cpu_cfig.h"); @19

// &Force("bus","dp_xx_ex1_oper_size",2,0); @21
// &Force("bus","dp_xx_ex2_oper_size",2,0); @22
// &Force("bus","dp_xx_ex3_oper_size",2,0); @23
// &Force("bus","dp_xx_ex4_oper_size",2,0); @24
//==========================================================
//                 EX1 EX2 Gated CLK
//==========================================================
assign mult1_ex1_ex2_pipedown     = dp_vfmau_ex1_pipex_sel && !dp_xx_ex1_half;
assign mult_ex1_ex2_half_pipedown = dp_vfmau_ex1_pipex_sel && dp_xx_ex1_half; 
assign ctrl_ex1_inst_vld          = dp_vfmau_ex1_pipex_sel;
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex1_ex2_en = dp_vfmau_ex1_pipex_sel
                       ||ctrl_ex2_inst_vld;

//  &Instance("gated_clk_cell", "x_ctrl_ex1_ex2_gated_clk"); @43
gated_clk_cell  x_ctrl_ex1_ex2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex1_ex2_clk  ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex1_ex2_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk  ), @44
//           .external_en (1'b0            ), @45
//           .global_en   (cp0_yy_clk_en   ), @46
//           .module_en   (cp0_vfpu_icg_en  ), @47
//           .local_en    (ctrl_ex1_ex2_en ), @48
//           .clk_out     (ctrl_ex1_ex2_clk)); @49

//----------------------------------------------------------
//                 EX2 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex1_ex2_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex2_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex2_inst_vld <= 1'b0;
  else
    ctrl_ex2_inst_vld <= dp_vfmau_ex1_pipex_sel;
end

// &Force("output","ctrl_ex2_inst_vld"); @64
// &Force("output","ctrl_ex1_ex2_en"); @65

//==========================================================
//                 EX2 EX3 Gated CLK
//==========================================================
assign mult1_ex2_ex3_pipedown     = ctrl_ex2_inst_vld && !dp_xx_ex2_half;
assign mult_ex2_ex3_half_pipedown = ctrl_ex2_inst_vld && dp_xx_ex2_half;
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex2_ex3_en = ctrl_ex2_inst_vld
                       ||ctrl_ex3_inst_vld;

//  &Instance("gated_clk_cell", "x_ctrl_ex2_ex3_gated_clk"); @84
gated_clk_cell  x_ctrl_ex2_ex3_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex2_ex3_clk  ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex2_ex3_en   ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk  ), @85
//           .external_en (1'b0            ), @86
//           .global_en   (cp0_yy_clk_en   ), @87
//           .module_en   (cp0_vfpu_icg_en  ), @88
//           .local_en    (ctrl_ex2_ex3_en ), @89
//           .clk_out     (ctrl_ex2_ex3_clk)); @90

//----------------------------------------------------------
//                 EX3 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex2_ex3_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex3_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex3_inst_vld <= 1'b0;
  else
    ctrl_ex3_inst_vld <= ctrl_ex2_inst_vld;
end
// &Force("output","ctrl_ex3_inst_vld"); @104

//==========================================================
//                 EX3 EX4 Gated CLK
//==========================================================
assign mult1_ex3_ex4_pipedown     = ctrl_ex3_inst_vld && !dp_xx_ex3_half;
assign mult_ex3_ex4_half_pipedown = ctrl_ex3_inst_vld && dp_xx_ex3_half && dp_xx_ex3_fma;

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex3_en = ctrl_ex3_inst_vld
                   ||ctrl_ex4_inst_vld;

//  &Instance("gated_clk_cell", "x_ctrl_ex3_ex4_gated_clk"); @124
gated_clk_cell  x_ctrl_ex3_ex4_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex3_ex4_clk  ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex3_en       ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk  ), @125
//           .external_en (1'b0            ), @126
//           .global_en   (cp0_yy_clk_en   ), @127
//           .module_en   (cp0_vfpu_icg_en  ), @128
//           .local_en    (ctrl_ex3_en     ), @129
//           .clk_out     (ctrl_ex3_ex4_clk)); @130

//----------------------------------------------------------
//                 EX4 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex3_ex4_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex4_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex4_inst_vld <= 1'b0;
  else
    ctrl_ex4_inst_vld <= ctrl_ex3_inst_vld;
end
// &Force("output","ctrl_ex4_inst_vld"); @144


//==========================================================
//                 EX4 EX5 Gated CLK
//==========================================================
assign mult1_ex4_ex5_pipedown     = ctrl_ex4_inst_vld 
                                 && !dp_xx_ex4_half
                                 && (dp_xx_ex4_fma 
                                     || dp_xx_ex4_mult_id);
assign mult_ex4_ex5_half_pipedown = ctrl_ex4_inst_vld 
                                 && dp_xx_ex4_fma 
                                 && dp_xx_ex4_half;


//assign mult1_ex4_ex5_pipedown     = ctrl_ex4_inst_vld && dp_xx_ex4_fma && !dp_xx_ex4_half;
//assign mult_ex4_ex5_half_pipedown = ctrl_ex4_inst_vld && dp_xx_ex4_fma && dp_xx_ex4_half;
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex4_en = ctrl_ex4_inst_vld
                   ||ctrl_ex5_inst_vld;

//  &Instance("gated_clk_cell", "x_ctrl_ex4_ex5_gated_clk"); @188
gated_clk_cell  x_ctrl_ex4_ex5_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex4_ex5_clk  ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex4_en       ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk  ), @189
//           .external_en (1'b0            ), @190
//           .global_en   (cp0_yy_clk_en   ), @191
//           .module_en   (cp0_vfpu_icg_en  ), @192
//           .local_en    (ctrl_ex4_en     ), @193
//           .clk_out     (ctrl_ex4_ex5_clk)); @194

//----------------------------------------------------------
//                 EX5 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex4_ex5_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex5_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex5_inst_vld <= 1'b0;
  else
    ctrl_ex5_inst_vld <= ctrl_ex4_inst_vld;
end

// &Force("output","ctrl_ex5_inst_vld"); @209

//----------------------------------------------------------
//                 EX5 FMA Write Back Valid
//----------------------------------------------------------
assign ctrl_ex4_fma_wb_vld = dp_xx_ex4_fma 
                             && ctrl_ex4_inst_vld
                             && !dp_xx_ex4_half
                          || dp_xx_ex4_mult_id
                             && ctrl_ex4_inst_vld
                             && !dp_xx_ex4_half;

//assign ctrl_ex4_fma_wb_vld = dp_xx_ex4_fma 
//                          && ctrl_ex4_inst_vld
//                          && !dp_xx_ex4_half;

always @(posedge ctrl_ex4_ex5_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex5_fma_wb_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex5_fma_wb_vld <= 1'b0;
  else
    ctrl_ex5_fma_wb_vld <= ctrl_ex4_fma_wb_vld;
end
assign ctrl_dp_ex5_fma_wb_vld = ctrl_ex5_fma_wb_vld;

// &ModuleEnd; @251
endmodule


