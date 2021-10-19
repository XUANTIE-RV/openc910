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
module ct_vfpu_ctrl(
  cp0_vfpu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_ex2_pipe7_inst_vld,
  ctrl_ex1_pipe6_data_vld,
  ctrl_ex1_pipe6_data_vld_dup0,
  ctrl_ex1_pipe6_data_vld_dup1,
  ctrl_ex1_pipe6_data_vld_dup2,
  ctrl_ex1_pipe6_eu_sel,
  ctrl_ex1_pipe6_inst_vld,
  ctrl_ex1_pipe6_mfvr_inst_vld,
  ctrl_ex1_pipe6_mfvr_inst_vld_dup0,
  ctrl_ex1_pipe6_mfvr_inst_vld_dup1,
  ctrl_ex1_pipe6_mfvr_inst_vld_dup2,
  ctrl_ex1_pipe6_mfvr_inst_vld_dup3,
  ctrl_ex1_pipe7_data_vld,
  ctrl_ex1_pipe7_data_vld_dup0,
  ctrl_ex1_pipe7_data_vld_dup1,
  ctrl_ex1_pipe7_data_vld_dup2,
  ctrl_ex1_pipe7_eu_sel,
  ctrl_ex1_pipe7_mfvr_inst_vld,
  ctrl_ex1_pipe7_mfvr_inst_vld_dup0,
  ctrl_ex1_pipe7_mfvr_inst_vld_dup1,
  ctrl_ex1_pipe7_mfvr_inst_vld_dup2,
  ctrl_ex1_pipe7_mfvr_inst_vld_dup3,
  ctrl_ex2_pipe6_data_vld,
  ctrl_ex2_pipe6_data_vld_dup0,
  ctrl_ex2_pipe6_data_vld_dup1,
  ctrl_ex2_pipe6_data_vld_dup2,
  ctrl_ex2_pipe6_inst_vld,
  ctrl_ex2_pipe6_mfvr_inst_vld,
  ctrl_ex2_pipe7_data_vld,
  ctrl_ex2_pipe7_data_vld_dup0,
  ctrl_ex2_pipe7_data_vld_dup1,
  ctrl_ex2_pipe7_data_vld_dup2,
  ctrl_ex2_pipe7_inst_vld,
  ctrl_ex2_pipe7_mfvr_inst_vld,
  ctrl_ex3_pipe6_data_vld,
  ctrl_ex3_pipe6_data_vld_dup0,
  ctrl_ex3_pipe6_data_vld_dup1,
  ctrl_ex3_pipe6_data_vld_dup2,
  ctrl_ex3_pipe6_fwd_vld,
  ctrl_ex3_pipe6_inst_vld,
  ctrl_ex3_pipe7_data_vld,
  ctrl_ex3_pipe7_data_vld_dup0,
  ctrl_ex3_pipe7_data_vld_dup1,
  ctrl_ex3_pipe7_data_vld_dup2,
  ctrl_ex3_pipe7_fwd_vld,
  ctrl_ex3_pipe7_inst_vld,
  ctrl_ex4_pipe6_fwd_vld,
  ctrl_ex4_pipe6_inst_vld,
  ctrl_ex4_pipe7_fwd_vld,
  ctrl_ex4_pipe7_inst_vld,
  ctrl_ex5_pipe6_clk,
  ctrl_ex5_pipe7_clk,
  dp_ctrl_ex1_pipe6_data_vld_pre,
  dp_ctrl_ex1_pipe7_data_vld_pre,
  dp_ctrl_ex2_pipe6_data_vld_pre,
  dp_ctrl_ex2_pipe7_data_vld_pre,
  dp_ctrl_ex3_pipe6_data_vld_pre,
  dp_ctrl_ex3_pipe6_fwd_vld_pre,
  dp_ctrl_ex3_pipe7_data_vld_pre,
  dp_ctrl_ex3_pipe7_fwd_vld_pre,
  dp_ctrl_ex4_pipe6_fwd_vld_pre,
  dp_ctrl_ex4_pipe7_fwd_vld_pre,
  dp_ctrl_pipe6_vfdsu_inst_vld,
  dp_ex1_pipe6_dst_vld_pre,
  dp_ex1_pipe7_dst_vld_pre,
  dp_vfmau_rf_pipe6_sel,
  dp_vfmau_rf_pipe7_sel,
  forever_cpuclk,
  idu_vfpu_rf_pipe6_eu_sel,
  idu_vfpu_rf_pipe6_gateclk_sel,
  idu_vfpu_rf_pipe6_sel,
  idu_vfpu_rf_pipe7_eu_sel,
  idu_vfpu_rf_pipe7_gateclk_sel,
  idu_vfpu_rf_pipe7_sel,
  iu_vfpu_ex1_pipe0_mtvr_inst,
  iu_vfpu_ex1_pipe0_mtvr_vld,
  iu_vfpu_ex1_pipe1_mtvr_inst,
  iu_vfpu_ex1_pipe1_mtvr_vld,
  pad_yy_icg_scan_en,
  pipe6_dp_vfdsu_inst_vld,
  rtu_yy_xx_flush,
  vdivu_vfpu_ex1_pipe6_result_vld
);

// &Ports; @23
input           cp0_vfpu_icg_en;                  
input           cp0_yy_clk_en;                    
input           cpurst_b;                         
input           dp_ctrl_ex1_pipe6_data_vld_pre;   
input           dp_ctrl_ex1_pipe7_data_vld_pre;   
input           dp_ctrl_ex2_pipe6_data_vld_pre;   
input           dp_ctrl_ex2_pipe7_data_vld_pre;   
input           dp_ctrl_ex3_pipe6_data_vld_pre;   
input           dp_ctrl_ex3_pipe6_fwd_vld_pre;    
input           dp_ctrl_ex3_pipe7_data_vld_pre;   
input           dp_ctrl_ex3_pipe7_fwd_vld_pre;    
input           dp_ctrl_ex4_pipe6_fwd_vld_pre;    
input           dp_ctrl_ex4_pipe7_fwd_vld_pre;    
input           dp_ctrl_pipe6_vfdsu_inst_vld;     
input           dp_ex1_pipe6_dst_vld_pre;         
input           dp_ex1_pipe7_dst_vld_pre;         
input           forever_cpuclk;                   
input   [11:0]  idu_vfpu_rf_pipe6_eu_sel;         
input           idu_vfpu_rf_pipe6_gateclk_sel;    
input           idu_vfpu_rf_pipe6_sel;            
input   [11:0]  idu_vfpu_rf_pipe7_eu_sel;         
input           idu_vfpu_rf_pipe7_gateclk_sel;    
input           idu_vfpu_rf_pipe7_sel;            
input   [4 :0]  iu_vfpu_ex1_pipe0_mtvr_inst;      
input           iu_vfpu_ex1_pipe0_mtvr_vld;       
input   [4 :0]  iu_vfpu_ex1_pipe1_mtvr_inst;      
input           iu_vfpu_ex1_pipe1_mtvr_vld;       
input           pad_yy_icg_scan_en;               
input           pipe6_dp_vfdsu_inst_vld;          
input           rtu_yy_xx_flush;                  
input           vdivu_vfpu_ex1_pipe6_result_vld;  
output          ctrl_dp_ex2_pipe7_inst_vld;       
output          ctrl_ex1_pipe6_data_vld;          
output          ctrl_ex1_pipe6_data_vld_dup0;     
output          ctrl_ex1_pipe6_data_vld_dup1;     
output          ctrl_ex1_pipe6_data_vld_dup2;     
output  [11:0]  ctrl_ex1_pipe6_eu_sel;            
output          ctrl_ex1_pipe6_inst_vld;          
output          ctrl_ex1_pipe6_mfvr_inst_vld;     
output          ctrl_ex1_pipe6_mfvr_inst_vld_dup0; 
output          ctrl_ex1_pipe6_mfvr_inst_vld_dup1; 
output          ctrl_ex1_pipe6_mfvr_inst_vld_dup2; 
output          ctrl_ex1_pipe6_mfvr_inst_vld_dup3; 
output          ctrl_ex1_pipe7_data_vld;          
output          ctrl_ex1_pipe7_data_vld_dup0;     
output          ctrl_ex1_pipe7_data_vld_dup1;     
output          ctrl_ex1_pipe7_data_vld_dup2;     
output  [11:0]  ctrl_ex1_pipe7_eu_sel;            
output          ctrl_ex1_pipe7_mfvr_inst_vld;     
output          ctrl_ex1_pipe7_mfvr_inst_vld_dup0; 
output          ctrl_ex1_pipe7_mfvr_inst_vld_dup1; 
output          ctrl_ex1_pipe7_mfvr_inst_vld_dup2; 
output          ctrl_ex1_pipe7_mfvr_inst_vld_dup3; 
output          ctrl_ex2_pipe6_data_vld;          
output          ctrl_ex2_pipe6_data_vld_dup0;     
output          ctrl_ex2_pipe6_data_vld_dup1;     
output          ctrl_ex2_pipe6_data_vld_dup2;     
output          ctrl_ex2_pipe6_inst_vld;          
output          ctrl_ex2_pipe6_mfvr_inst_vld;     
output          ctrl_ex2_pipe7_data_vld;          
output          ctrl_ex2_pipe7_data_vld_dup0;     
output          ctrl_ex2_pipe7_data_vld_dup1;     
output          ctrl_ex2_pipe7_data_vld_dup2;     
output          ctrl_ex2_pipe7_inst_vld;          
output          ctrl_ex2_pipe7_mfvr_inst_vld;     
output          ctrl_ex3_pipe6_data_vld;          
output          ctrl_ex3_pipe6_data_vld_dup0;     
output          ctrl_ex3_pipe6_data_vld_dup1;     
output          ctrl_ex3_pipe6_data_vld_dup2;     
output          ctrl_ex3_pipe6_fwd_vld;           
output          ctrl_ex3_pipe6_inst_vld;          
output          ctrl_ex3_pipe7_data_vld;          
output          ctrl_ex3_pipe7_data_vld_dup0;     
output          ctrl_ex3_pipe7_data_vld_dup1;     
output          ctrl_ex3_pipe7_data_vld_dup2;     
output          ctrl_ex3_pipe7_fwd_vld;           
output          ctrl_ex3_pipe7_inst_vld;          
output          ctrl_ex4_pipe6_fwd_vld;           
output          ctrl_ex4_pipe6_inst_vld;          
output          ctrl_ex4_pipe7_fwd_vld;           
output          ctrl_ex4_pipe7_inst_vld;          
output          ctrl_ex5_pipe6_clk;               
output          ctrl_ex5_pipe7_clk;               
output          dp_vfmau_rf_pipe6_sel;            
output          dp_vfmau_rf_pipe7_sel;            

// &Regs; @24
reg             ctrl_ex1_pipe6_data_vld;          
reg             ctrl_ex1_pipe6_data_vld_dup0;     
reg             ctrl_ex1_pipe6_data_vld_dup1;     
reg             ctrl_ex1_pipe6_data_vld_dup2;     
reg     [11:0]  ctrl_ex1_pipe6_eu_sel_tmp;        
reg             ctrl_ex1_pipe6_inst_vld;          
reg             ctrl_ex1_pipe6_mfvr_inst_vld;     
reg             ctrl_ex1_pipe6_mfvr_inst_vld_dup0; 
reg             ctrl_ex1_pipe6_mfvr_inst_vld_dup1; 
reg             ctrl_ex1_pipe6_mfvr_inst_vld_dup2; 
reg             ctrl_ex1_pipe6_mfvr_inst_vld_dup3; 
reg             ctrl_ex1_pipe7_data_vld;          
reg             ctrl_ex1_pipe7_data_vld_dup0;     
reg             ctrl_ex1_pipe7_data_vld_dup1;     
reg             ctrl_ex1_pipe7_data_vld_dup2;     
reg     [11:0]  ctrl_ex1_pipe7_eu_sel_tmp;        
reg             ctrl_ex1_pipe7_inst_vld;          
reg             ctrl_ex1_pipe7_mfvr_inst_vld;     
reg             ctrl_ex1_pipe7_mfvr_inst_vld_dup0; 
reg             ctrl_ex1_pipe7_mfvr_inst_vld_dup1; 
reg             ctrl_ex1_pipe7_mfvr_inst_vld_dup2; 
reg             ctrl_ex1_pipe7_mfvr_inst_vld_dup3; 
reg             ctrl_ex2_pipe6_data_vld;          
reg             ctrl_ex2_pipe6_data_vld_dup0;     
reg             ctrl_ex2_pipe6_data_vld_dup1;     
reg             ctrl_ex2_pipe6_data_vld_dup2;     
reg             ctrl_ex2_pipe6_inst_vld;          
reg             ctrl_ex2_pipe6_mfvr_inst_vld;     
reg             ctrl_ex2_pipe7_data_vld;          
reg             ctrl_ex2_pipe7_data_vld_dup0;     
reg             ctrl_ex2_pipe7_data_vld_dup1;     
reg             ctrl_ex2_pipe7_data_vld_dup2;     
reg             ctrl_ex2_pipe7_inst_vld;          
reg             ctrl_ex2_pipe7_mfvr_inst_vld;     
reg             ctrl_ex3_pipe6_data_vld;          
reg             ctrl_ex3_pipe6_data_vld_dup0;     
reg             ctrl_ex3_pipe6_data_vld_dup1;     
reg             ctrl_ex3_pipe6_data_vld_dup2;     
reg             ctrl_ex3_pipe6_fwd_vld;           
reg             ctrl_ex3_pipe6_inst_vld;          
reg             ctrl_ex3_pipe7_data_vld;          
reg             ctrl_ex3_pipe7_data_vld_dup0;     
reg             ctrl_ex3_pipe7_data_vld_dup1;     
reg             ctrl_ex3_pipe7_data_vld_dup2;     
reg             ctrl_ex3_pipe7_fwd_vld;           
reg             ctrl_ex3_pipe7_inst_vld;          
reg             ctrl_ex4_pipe6_fwd_vld;           
reg             ctrl_ex4_pipe6_inst_vld;          
reg             ctrl_ex4_pipe7_fwd_vld;           
reg             ctrl_ex4_pipe7_inst_vld;          
reg             ctrl_ex5_pipe6_inst_vld;          
reg             ctrl_ex5_pipe7_inst_vld;          

// &Wires; @25
wire            cp0_vfpu_icg_en;                  
wire            cp0_yy_clk_en;                    
wire            cpurst_b;                         
wire            ctrl_dp_ex2_pipe7_inst_vld;       
wire            ctrl_ex1_pipe6_clk;               
wire            ctrl_ex1_pipe6_en;                
wire    [11:0]  ctrl_ex1_pipe6_eu_sel;            
wire            ctrl_ex1_pipe6_inst_vld_pre;      
wire            ctrl_ex1_pipe6_mfvr_inst_vld_pre; 
wire            ctrl_ex1_pipe7_clk;               
wire            ctrl_ex1_pipe7_en;                
wire    [11:0]  ctrl_ex1_pipe7_eu_sel;            
wire            ctrl_ex1_pipe7_inst_vld_pre;      
wire            ctrl_ex1_pipe7_mfvr_inst_vld_pre; 
wire            ctrl_ex2_pipe6_clk;               
wire            ctrl_ex2_pipe6_data_vld_pre;      
wire            ctrl_ex2_pipe6_en;                
wire            ctrl_ex2_pipe6_inst_vld_pre;      
wire            ctrl_ex2_pipe7_clk;               
wire            ctrl_ex2_pipe7_en;                
wire            ctrl_ex2_pipe7_inst_vld_pre;      
wire            ctrl_ex3_pipe6_clk;               
wire            ctrl_ex3_pipe6_en;                
wire            ctrl_ex3_pipe7_clk;               
wire            ctrl_ex3_pipe7_en;                
wire            ctrl_ex4_pipe6_clk;               
wire            ctrl_ex4_pipe6_en;                
wire            ctrl_ex4_pipe7_clk;               
wire            ctrl_ex4_pipe7_en;                
wire            ctrl_ex5_pipe6_clk;               
wire            ctrl_ex5_pipe6_en;                
wire            ctrl_ex5_pipe6_inst_vld_pre;      
wire            ctrl_ex5_pipe7_clk;               
wire            ctrl_ex5_pipe7_en;                
wire            dp_ctrl_ex1_pipe6_data_vld_pre;   
wire            dp_ctrl_ex1_pipe7_data_vld_pre;   
wire            dp_ctrl_ex2_pipe6_data_vld_pre;   
wire            dp_ctrl_ex2_pipe7_data_vld_pre;   
wire            dp_ctrl_ex3_pipe6_data_vld_pre;   
wire            dp_ctrl_ex3_pipe6_fwd_vld_pre;    
wire            dp_ctrl_ex3_pipe7_data_vld_pre;   
wire            dp_ctrl_ex3_pipe7_fwd_vld_pre;    
wire            dp_ctrl_ex4_pipe6_fwd_vld_pre;    
wire            dp_ctrl_ex4_pipe7_fwd_vld_pre;    
wire            dp_ctrl_pipe6_vfdsu_inst_vld;     
wire            dp_ex1_pipe6_dst_vld_pre;         
wire            dp_ex1_pipe7_dst_vld_pre;         
wire            dp_vfmau_rf_pipe6_sel;            
wire            dp_vfmau_rf_pipe7_sel;            
wire            forever_cpuclk;                   
wire    [11:0]  idu_vfpu_rf_pipe6_eu_sel;         
wire            idu_vfpu_rf_pipe6_gateclk_sel;    
wire            idu_vfpu_rf_pipe6_sel;            
wire    [11:0]  idu_vfpu_rf_pipe7_eu_sel;         
wire            idu_vfpu_rf_pipe7_gateclk_sel;    
wire            idu_vfpu_rf_pipe7_sel;            
wire    [4 :0]  iu_vfpu_ex1_pipe0_mtvr_inst;      
wire            iu_vfpu_ex1_pipe0_mtvr_vld;       
wire    [4 :0]  iu_vfpu_ex1_pipe1_mtvr_inst;      
wire            iu_vfpu_ex1_pipe1_mtvr_vld;       
wire            pad_yy_icg_scan_en;               
wire            pipe6_dp_vfdsu_inst_vld;          
wire    [11:0]  pipe6_eu_sel;                     
wire    [11:0]  pipe6_mtvr_eu_sel;                
wire    [11:0]  pipe7_eu_sel;                     
wire    [11:0]  pipe7_mtvr_eu_sel;                
wire            rtu_yy_xx_flush;                  
wire            vdivu_vfpu_ex1_pipe6_result_vld;  

// &Depend("cpu_cfig.h"); @26

parameter EU_WIDTH = 12;

// &Force("bus","iu_vfpu_ex1_pipe0_mtvr_inst",4,0); @30
// &Force("bus","iu_vfpu_ex1_pipe1_mtvr_inst",4,0); @31
//==========================================================
//                 Pipe6 Control Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
 assign ctrl_ex1_pipe6_en = idu_vfpu_rf_pipe6_gateclk_sel
                         || iu_vfpu_ex1_pipe0_mtvr_vld
                         || ctrl_ex1_pipe6_inst_vld;

//  &Instance("gated_clk_cell", "x_ctrl_ex1_pipe6_gated_clk"); @42
gated_clk_cell  x_ctrl_ex1_pipe6_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex1_pipe6_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex1_pipe6_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @43
//           .external_en (1'b0), @44
//           .global_en   (cp0_yy_clk_en), @45
//           .module_en   (cp0_vfpu_icg_en), @46
//           .local_en    (ctrl_ex1_pipe6_en), @47
//           .clk_out     (ctrl_ex1_pipe6_clk)); @48

//----------------------------------------------------------
//                 Pipe6 EX1 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex1_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex1_pipe6_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex1_pipe6_inst_vld <= 1'b0;
  else
    ctrl_ex1_pipe6_inst_vld <= ctrl_ex1_pipe6_inst_vld_pre;
end

always @(posedge ctrl_ex1_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ex1_pipe6_mfvr_inst_vld <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup2 <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup3 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    ctrl_ex1_pipe6_mfvr_inst_vld <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup2 <= 1'b0;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup3 <= 1'b0;
  end
  else begin
    ctrl_ex1_pipe6_mfvr_inst_vld <= ctrl_ex1_pipe6_mfvr_inst_vld_pre;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup0 <= ctrl_ex1_pipe6_mfvr_inst_vld_pre;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup1 <= ctrl_ex1_pipe6_mfvr_inst_vld_pre;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup2 <= ctrl_ex1_pipe6_mfvr_inst_vld_pre;
    ctrl_ex1_pipe6_mfvr_inst_vld_dup3 <= ctrl_ex1_pipe6_mfvr_inst_vld_pre;
  end
end
assign ctrl_ex1_pipe6_mfvr_inst_vld_pre = ctrl_ex1_pipe6_inst_vld_pre && 
                                          dp_ex1_pipe6_dst_vld_pre;



always @(posedge ctrl_ex1_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ex1_pipe6_data_vld <= 1'b0;
    ctrl_ex1_pipe6_data_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe6_data_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe6_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    ctrl_ex1_pipe6_data_vld <= 1'b0;
    ctrl_ex1_pipe6_data_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe6_data_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe6_data_vld_dup2 <= 1'b0;
  end
  else begin
    ctrl_ex1_pipe6_data_vld <= dp_ctrl_ex1_pipe6_data_vld_pre && idu_vfpu_rf_pipe6_sel || iu_vfpu_ex1_pipe0_mtvr_vld;
    ctrl_ex1_pipe6_data_vld_dup0 <= dp_ctrl_ex1_pipe6_data_vld_pre && idu_vfpu_rf_pipe6_sel || iu_vfpu_ex1_pipe0_mtvr_vld;
    ctrl_ex1_pipe6_data_vld_dup1 <= dp_ctrl_ex1_pipe6_data_vld_pre && idu_vfpu_rf_pipe6_sel || iu_vfpu_ex1_pipe0_mtvr_vld;
    ctrl_ex1_pipe6_data_vld_dup2 <= dp_ctrl_ex1_pipe6_data_vld_pre && idu_vfpu_rf_pipe6_sel || iu_vfpu_ex1_pipe0_mtvr_vld;
  end
end
// EX1 inst can from:
// 1. RF normal pipedown
// 2. mtvr inst from pipe0 EX1 stage
// 3. vmul replay at EX1
assign ctrl_ex1_pipe6_inst_vld_pre = idu_vfpu_rf_pipe6_sel
                                  || iu_vfpu_ex1_pipe0_mtvr_vld;

// &Force("output","ctrl_ex1_pipe6_inst_vld"); @120
// &Force("output","ctrl_ex1_pipe6_data_vld"); @121

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex2_pipe6_en =  ctrl_ex1_pipe6_inst_vld
                         || ctrl_ex2_pipe6_inst_vld 
                         || pipe6_dp_vfdsu_inst_vld 
                         || vdivu_vfpu_ex1_pipe6_result_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex2_pipe6_gated_clk"); @130
gated_clk_cell  x_ctrl_ex2_pipe6_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex2_pipe6_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex2_pipe6_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @131
//           .external_en (1'b0), @132
//           .global_en   (cp0_yy_clk_en), @133
//           .module_en   (cp0_vfpu_icg_en), @134
//           .local_en    (ctrl_ex2_pipe6_en), @135
//           .clk_out     (ctrl_ex2_pipe6_clk)); @136

//----------------------------------------------------------
//                 Pipe6 EX2 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex2_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex2_pipe6_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex2_pipe6_inst_vld <= 1'b0;
  else
    ctrl_ex2_pipe6_inst_vld <= ctrl_ex2_pipe6_inst_vld_pre;
end

assign ctrl_ex2_pipe6_inst_vld_pre = ctrl_ex1_pipe6_inst_vld 
                                  || pipe6_dp_vfdsu_inst_vld 
                                  || vdivu_vfpu_ex1_pipe6_result_vld;

always @(posedge ctrl_ex2_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ex2_pipe6_data_vld <= 1'b0;
    ctrl_ex2_pipe6_data_vld_dup0 <= 1'b0;
    ctrl_ex2_pipe6_data_vld_dup1 <= 1'b0;
    ctrl_ex2_pipe6_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    ctrl_ex2_pipe6_data_vld <= 1'b0;
    ctrl_ex2_pipe6_data_vld_dup0 <= 1'b0;
    ctrl_ex2_pipe6_data_vld_dup1 <= 1'b0;
    ctrl_ex2_pipe6_data_vld_dup2 <= 1'b0;
  end
  else begin
    ctrl_ex2_pipe6_data_vld <= ctrl_ex2_pipe6_data_vld_pre;
    ctrl_ex2_pipe6_data_vld_dup0 <= ctrl_ex2_pipe6_data_vld_pre;
    ctrl_ex2_pipe6_data_vld_dup1 <= ctrl_ex2_pipe6_data_vld_pre;
    ctrl_ex2_pipe6_data_vld_dup2 <= ctrl_ex2_pipe6_data_vld_pre;
  end
end

assign ctrl_ex2_pipe6_data_vld_pre = dp_ctrl_ex2_pipe6_data_vld_pre && ctrl_ex1_pipe6_inst_vld 
                                  || pipe6_dp_vfdsu_inst_vld 
                                  || vdivu_vfpu_ex1_pipe6_result_vld;

// &Force("output","ctrl_ex2_pipe6_inst_vld"); @181
// &Force("output","ctrl_ex2_pipe6_data_vld"); @182

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
 assign ctrl_ex3_pipe6_en = ctrl_ex2_pipe6_inst_vld
                         || ctrl_ex3_pipe6_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex3_pipe6_gated_clk"); @189
gated_clk_cell  x_ctrl_ex3_pipe6_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex3_pipe6_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex3_pipe6_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @190
//           .external_en (1'b0), @191
//           .global_en   (cp0_yy_clk_en), @192
//           .module_en   (cp0_vfpu_icg_en), @193
//           .local_en    (ctrl_ex3_pipe6_en), @194
//           .clk_out     (ctrl_ex3_pipe6_clk)); @195

//----------------------------------------------------------
//                 Pipe6 EX3 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex3_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex3_pipe6_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex3_pipe6_inst_vld <= 1'b0;
  else
    ctrl_ex3_pipe6_inst_vld <= ctrl_ex2_pipe6_inst_vld;
end

always @(posedge ctrl_ex3_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ex3_pipe6_data_vld <= 1'b0;
    ctrl_ex3_pipe6_data_vld_dup0 <= 1'b0;
    ctrl_ex3_pipe6_data_vld_dup1 <= 1'b0;
    ctrl_ex3_pipe6_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush)  begin
    ctrl_ex3_pipe6_data_vld <= 1'b0;
    ctrl_ex3_pipe6_data_vld_dup0 <= 1'b0;
    ctrl_ex3_pipe6_data_vld_dup1 <= 1'b0;
    ctrl_ex3_pipe6_data_vld_dup2 <= 1'b0;
  end
  else  begin
    ctrl_ex3_pipe6_data_vld <= dp_ctrl_ex3_pipe6_data_vld_pre && ctrl_ex2_pipe6_inst_vld;
    ctrl_ex3_pipe6_data_vld_dup0 <= dp_ctrl_ex3_pipe6_data_vld_pre && ctrl_ex2_pipe6_inst_vld;
    ctrl_ex3_pipe6_data_vld_dup1 <= dp_ctrl_ex3_pipe6_data_vld_pre && ctrl_ex2_pipe6_inst_vld;
    ctrl_ex3_pipe6_data_vld_dup2 <= dp_ctrl_ex3_pipe6_data_vld_pre && ctrl_ex2_pipe6_inst_vld;
  end
end

// &Force("output","ctrl_ex3_pipe6_inst_vld"); @232
// &Force("output","ctrl_ex3_pipe6_data_vld"); @233

//----------------------------------------------------------
//                 Pipe6 EX3 Fwd Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex3_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex3_pipe6_fwd_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex3_pipe6_fwd_vld <= 1'b0;
  else
    ctrl_ex3_pipe6_fwd_vld <= dp_ctrl_ex3_pipe6_fwd_vld_pre && ctrl_ex2_pipe6_inst_vld;
end

// &Force("output","ctrl_ex3_pipe6_fwd_vld"); @248

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex4_pipe6_en =  ctrl_ex3_pipe6_inst_vld
                         || ctrl_ex4_pipe6_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex4_pipe6_gated_clk"); @255
gated_clk_cell  x_ctrl_ex4_pipe6_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex4_pipe6_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex4_pipe6_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @256
//           .external_en (1'b0), @257
//           .global_en   (cp0_yy_clk_en), @258
//           .module_en   (cp0_vfpu_icg_en), @259
//           .local_en    (ctrl_ex4_pipe6_en), @260
//           .clk_out     (ctrl_ex4_pipe6_clk)); @261

//----------------------------------------------------------
//                 Pipe6 EX4 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex4_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex4_pipe6_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex4_pipe6_inst_vld <= 1'b0;
  else
    ctrl_ex4_pipe6_inst_vld <= ctrl_ex3_pipe6_inst_vld;
end

always @(posedge ctrl_ex4_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex4_pipe6_fwd_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex4_pipe6_fwd_vld <= 1'b0;
  else
    ctrl_ex4_pipe6_fwd_vld <= dp_ctrl_ex4_pipe6_fwd_vld_pre && ctrl_ex3_pipe6_inst_vld;
end

// &Force("output","ctrl_ex4_pipe6_fwd_vld"); @286
// &Force("output","ctrl_ex4_pipe6_inst_vld"); @287


//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex5_pipe6_en =  ctrl_ex4_pipe6_inst_vld
                         || dp_ctrl_pipe6_vfdsu_inst_vld
                         || ctrl_ex5_pipe6_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex5_pipe6_gated_clk"); @296
gated_clk_cell  x_ctrl_ex5_pipe6_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex5_pipe6_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex5_pipe6_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @297
//           .external_en (1'b0), @298
//           .global_en   (cp0_yy_clk_en), @299
//           .module_en   (cp0_vfpu_icg_en), @300
//           .local_en    (ctrl_ex5_pipe6_en), @301
//           .clk_out     (ctrl_ex5_pipe6_clk)); @302

// &Force("output","ctrl_ex5_pipe6_clk"); @304

assign ctrl_ex5_pipe6_inst_vld_pre = ctrl_ex4_pipe6_inst_vld
                                  || dp_ctrl_pipe6_vfdsu_inst_vld;
//----------------------------------------------------------
//                 Pipe6 EX5 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex5_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex5_pipe6_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex5_pipe6_inst_vld <= 1'b0;
  else
    ctrl_ex5_pipe6_inst_vld <= ctrl_ex5_pipe6_inst_vld_pre;
end

// //&Force("output","ctrl_ex5_pipe6_inst_vld"); @321

//==========================================================
//                 Pipe7 Control Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
 assign ctrl_ex1_pipe7_en = idu_vfpu_rf_pipe7_gateclk_sel
                         || iu_vfpu_ex1_pipe1_mtvr_vld
                         || ctrl_ex1_pipe7_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex1_pipe7_gated_clk"); @332
gated_clk_cell  x_ctrl_ex1_pipe7_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex1_pipe7_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex1_pipe7_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @333
//           .external_en (1'b0), @334
//           .global_en   (cp0_yy_clk_en), @335
//           .module_en   (cp0_vfpu_icg_en), @336
//           .local_en    (ctrl_ex1_pipe7_en), @337
//           .clk_out     (ctrl_ex1_pipe7_clk)); @338

//----------------------------------------------------------
//                 Pipe7 EX1 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex1_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex1_pipe7_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex1_pipe7_inst_vld <= 1'b0;
  else
    ctrl_ex1_pipe7_inst_vld <= ctrl_ex1_pipe7_inst_vld_pre;
end
assign dp_vfmau_rf_pipe7_sel   = ctrl_ex1_pipe7_inst_vld_pre && pipe7_eu_sel[4];
assign dp_vfmau_rf_pipe6_sel   = ctrl_ex1_pipe6_inst_vld_pre && pipe6_eu_sel[4];
always @(posedge ctrl_ex1_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ex1_pipe7_data_vld <= 1'b0;
    ctrl_ex1_pipe7_data_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe7_data_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe7_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    ctrl_ex1_pipe7_data_vld <= 1'b0;
    ctrl_ex1_pipe7_data_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe7_data_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe7_data_vld_dup2 <= 1'b0;
  end
  else begin
    ctrl_ex1_pipe7_data_vld <= dp_ctrl_ex1_pipe7_data_vld_pre && idu_vfpu_rf_pipe7_sel || iu_vfpu_ex1_pipe1_mtvr_vld;
    ctrl_ex1_pipe7_data_vld_dup0 <= dp_ctrl_ex1_pipe7_data_vld_pre && idu_vfpu_rf_pipe7_sel || iu_vfpu_ex1_pipe1_mtvr_vld;
    ctrl_ex1_pipe7_data_vld_dup1 <= dp_ctrl_ex1_pipe7_data_vld_pre && idu_vfpu_rf_pipe7_sel || iu_vfpu_ex1_pipe1_mtvr_vld;
    ctrl_ex1_pipe7_data_vld_dup2 <= dp_ctrl_ex1_pipe7_data_vld_pre && idu_vfpu_rf_pipe7_sel || iu_vfpu_ex1_pipe1_mtvr_vld;



  end
end


// EX1 inst can from:
// 1. RF normal pipedown
// 2. mtvr inst from pipe0 EX1 stage
// 3. vmul replay at EX1
assign ctrl_ex1_pipe7_inst_vld_pre = idu_vfpu_rf_pipe7_sel
                                  || iu_vfpu_ex1_pipe1_mtvr_vld;
// &Force("output","ctrl_ex1_pipe7_inst_vld"); @387
// &Force("output","ctrl_ex1_pipe7_data_vld"); @389

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex2_pipe7_en =  ctrl_ex1_pipe7_inst_vld
                         || ctrl_ex2_pipe7_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex2_pipe7_gated_clk"); @396
gated_clk_cell  x_ctrl_ex2_pipe7_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex2_pipe7_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex2_pipe7_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @397
//           .external_en (1'b0), @398
//           .global_en   (cp0_yy_clk_en), @399
//           .module_en   (cp0_vfpu_icg_en), @400
//           .local_en    (ctrl_ex2_pipe7_en), @401
//           .clk_out     (ctrl_ex2_pipe7_clk)); @402

//----------------------------------------------------------
//                 Pipe7 EX2 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex2_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex2_pipe7_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex2_pipe7_inst_vld <= 1'b0;
  else
    ctrl_ex2_pipe7_inst_vld <= ctrl_ex2_pipe7_inst_vld_pre;
end

always @(posedge ctrl_ex1_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ex1_pipe7_mfvr_inst_vld <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup2 <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup3 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    ctrl_ex1_pipe7_mfvr_inst_vld <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup0 <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup1 <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup2 <= 1'b0;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup3 <= 1'b0;
  end
  else begin
    ctrl_ex1_pipe7_mfvr_inst_vld <= ctrl_ex1_pipe7_mfvr_inst_vld_pre;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup0 <= ctrl_ex1_pipe7_mfvr_inst_vld_pre;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup1 <= ctrl_ex1_pipe7_mfvr_inst_vld_pre;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup2 <= ctrl_ex1_pipe7_mfvr_inst_vld_pre;
    ctrl_ex1_pipe7_mfvr_inst_vld_dup3 <= ctrl_ex1_pipe7_mfvr_inst_vld_pre;
  end
end
assign ctrl_ex1_pipe7_mfvr_inst_vld_pre = ctrl_ex1_pipe7_inst_vld_pre && 
                                          dp_ex1_pipe7_dst_vld_pre;


always @(posedge ctrl_ex2_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_ex2_pipe7_data_vld <= 1'b0;
    ctrl_ex2_pipe7_data_vld_dup0 <= 1'b0;
    ctrl_ex2_pipe7_data_vld_dup1 <= 1'b0;
    ctrl_ex2_pipe7_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush)begin
    ctrl_ex2_pipe7_data_vld <= 1'b0;
    ctrl_ex2_pipe7_data_vld_dup0 <= 1'b0;
    ctrl_ex2_pipe7_data_vld_dup1 <= 1'b0;
    ctrl_ex2_pipe7_data_vld_dup2 <= 1'b0;
  end
  else begin
    ctrl_ex2_pipe7_data_vld <= dp_ctrl_ex2_pipe7_data_vld_pre && ctrl_ex1_pipe7_inst_vld;
    ctrl_ex2_pipe7_data_vld_dup0 <= dp_ctrl_ex2_pipe7_data_vld_pre && ctrl_ex1_pipe7_inst_vld;
    ctrl_ex2_pipe7_data_vld_dup1 <= dp_ctrl_ex2_pipe7_data_vld_pre && ctrl_ex1_pipe7_inst_vld;
    ctrl_ex2_pipe7_data_vld_dup2 <= dp_ctrl_ex2_pipe7_data_vld_pre && ctrl_ex1_pipe7_inst_vld;
  end
end

assign ctrl_ex2_pipe7_inst_vld_pre = ctrl_ex1_pipe7_inst_vld;

assign ctrl_dp_ex2_pipe7_inst_vld = ctrl_ex2_pipe7_inst_vld_pre;

// &Force("output","ctrl_ex2_pipe7_inst_vld"); @471
// &Force("output","ctrl_ex2_pipe7_data_vld"); @472
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
 assign ctrl_ex3_pipe7_en = ctrl_ex2_pipe7_inst_vld
                         || ctrl_ex3_pipe7_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex3_pipe7_gated_clk"); @478
gated_clk_cell  x_ctrl_ex3_pipe7_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex3_pipe7_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex3_pipe7_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @479
//           .external_en (1'b0), @480
//           .global_en   (cp0_yy_clk_en), @481
//           .module_en   (cp0_vfpu_icg_en), @482
//           .local_en    (ctrl_ex3_pipe7_en), @483
//           .clk_out     (ctrl_ex3_pipe7_clk)); @484


//----------------------------------------------------------
//                 Pipe7 EX3 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex3_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex3_pipe7_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex3_pipe7_inst_vld <= 1'b0;
  else
    ctrl_ex3_pipe7_inst_vld <= ctrl_ex2_pipe7_inst_vld;
end

always @(posedge ctrl_ex3_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)begin
    ctrl_ex3_pipe7_data_vld <= 1'b0;
    ctrl_ex3_pipe7_data_vld_dup0 <= 1'b0;
    ctrl_ex3_pipe7_data_vld_dup1 <= 1'b0;
    ctrl_ex3_pipe7_data_vld_dup2 <= 1'b0;
  end
  else if(rtu_yy_xx_flush) begin
    ctrl_ex3_pipe7_data_vld <= 1'b0;
    ctrl_ex3_pipe7_data_vld_dup0 <= 1'b0;
    ctrl_ex3_pipe7_data_vld_dup1 <= 1'b0;
    ctrl_ex3_pipe7_data_vld_dup2 <= 1'b0;
  end
  else begin
    ctrl_ex3_pipe7_data_vld <= dp_ctrl_ex3_pipe7_data_vld_pre && ctrl_ex2_pipe7_inst_vld;
    ctrl_ex3_pipe7_data_vld_dup0 <= dp_ctrl_ex3_pipe7_data_vld_pre && ctrl_ex2_pipe7_inst_vld;
    ctrl_ex3_pipe7_data_vld_dup1 <= dp_ctrl_ex3_pipe7_data_vld_pre && ctrl_ex2_pipe7_inst_vld;
    ctrl_ex3_pipe7_data_vld_dup2 <= dp_ctrl_ex3_pipe7_data_vld_pre && ctrl_ex2_pipe7_inst_vld;
  end
end

// &Force("output","ctrl_ex3_pipe7_inst_vld"); @522
// &Force("output","ctrl_ex3_pipe7_data_vld"); @523

always @(posedge ctrl_ex3_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex3_pipe7_fwd_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex3_pipe7_fwd_vld <= 1'b0;
  else
    ctrl_ex3_pipe7_fwd_vld <= dp_ctrl_ex3_pipe7_fwd_vld_pre && ctrl_ex2_pipe7_inst_vld;
end

// &Force("output","ctrl_ex3_pipe7_fwd_vld"); @535
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex4_pipe7_en =  ctrl_ex3_pipe7_inst_vld
                         || ctrl_ex4_pipe7_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex4_pipe7_gated_clk"); @541
gated_clk_cell  x_ctrl_ex4_pipe7_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex4_pipe7_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex4_pipe7_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @542
//           .external_en (1'b0), @543
//           .global_en   (cp0_yy_clk_en), @544
//           .module_en   (cp0_vfpu_icg_en), @545
//           .local_en    (ctrl_ex4_pipe7_en), @546
//           .clk_out     (ctrl_ex4_pipe7_clk)); @547

//----------------------------------------------------------
//                 Pipe7 EX4 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex4_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex4_pipe7_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex4_pipe7_inst_vld <= 1'b0;
  else
    ctrl_ex4_pipe7_inst_vld <= ctrl_ex3_pipe7_inst_vld;
end

always @(posedge ctrl_ex4_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex4_pipe7_fwd_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex4_pipe7_fwd_vld <= 1'b0;
  else
    ctrl_ex4_pipe7_fwd_vld <= dp_ctrl_ex4_pipe7_fwd_vld_pre && ctrl_ex3_pipe7_inst_vld;
end

// &Force("output","ctrl_ex4_pipe7_fwd_vld"); @572
// &Force("output","ctrl_ex4_pipe7_inst_vld"); @573

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign ctrl_ex5_pipe7_en =  ctrl_ex4_pipe7_inst_vld
                         || ctrl_ex5_pipe7_inst_vld;
//  &Instance("gated_clk_cell", "x_ctrl_ex5_pipe7_gated_clk"); @580
gated_clk_cell  x_ctrl_ex5_pipe7_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ex5_pipe7_clk),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ctrl_ex5_pipe7_en ),
  .module_en          (cp0_vfpu_icg_en   ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

//  &Connect(.clk_in      (forever_cpuclk), @581
//           .external_en (1'b0), @582
//           .global_en   (cp0_yy_clk_en), @583
//           .module_en   (cp0_vfpu_icg_en), @584
//           .local_en    (ctrl_ex5_pipe7_en), @585
//           .clk_out     (ctrl_ex5_pipe7_clk)); @586

// &Force("output","ctrl_ex5_pipe7_clk"); @588

//----------------------------------------------------------
//                 Pipe7 EX5 Instrcution Valid
//----------------------------------------------------------
always @(posedge ctrl_ex5_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex5_pipe7_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex5_pipe7_inst_vld <= 1'b0;
  else
    ctrl_ex5_pipe7_inst_vld <= ctrl_ex4_pipe7_inst_vld;
end

// //&Force("output","ctrl_ex5_pipe7_inst_vld"); @603
//==========================================================
//                 MFVR inst valid
//==========================================================
//----------------------------------------------------------
//                 Pipe6 MFVR Instrcution Valid
//----------------------------------------------------------
//assign ctrl_ex1_pipe6_mfvr_inst_vld = ctrl_ex1_pipe6_inst_vld
//                                   && dp_ctrl_ex1_pipe6_dst_vld;

always @(posedge ctrl_ex2_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex2_pipe6_mfvr_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex2_pipe6_mfvr_inst_vld <= 1'b0;
  else
    ctrl_ex2_pipe6_mfvr_inst_vld <= ctrl_ex1_pipe6_mfvr_inst_vld;
end
// &Force("output","ctrl_ex1_pipe6_mfvr_inst_vld"); @622
// &Force("output","ctrl_ex2_pipe6_mfvr_inst_vld"); @623

//----------------------------------------------------------
//                 Pipe7 MFVR Instrcution Valid
//----------------------------------------------------------
//assign ctrl_ex1_pipe7_mfvr_inst_vld = ctrl_ex1_pipe7_inst_vld
//                                   && dp_ctrl_ex1_pipe7_dst_vld;
                                   
always @(posedge ctrl_ex2_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex2_pipe7_mfvr_inst_vld <= 1'b0;
  else if(rtu_yy_xx_flush)
    ctrl_ex2_pipe7_mfvr_inst_vld <= 1'b0;
  else
    ctrl_ex2_pipe7_mfvr_inst_vld <= ctrl_ex1_pipe7_mfvr_inst_vld;
end
// &Force("output","ctrl_ex1_pipe7_mfvr_inst_vld"); @640
// &Force("output","ctrl_ex2_pipe7_mfvr_inst_vld"); @641


//==========================================================
//                 EU_SEL Contrl Signal
//==========================================================
//----------------------------------------------------------
//               Pipe6 EU_SEL Contrl Signal
//----------------------------------------------------------
//mtvr inst data preparation
assign pipe6_mtvr_eu_sel[EU_WIDTH-1:0] = |iu_vfpu_ex1_pipe0_mtvr_inst[1:0]
                                         || iu_vfpu_ex1_pipe0_mtvr_inst[4]
                                         ? {{EU_WIDTH-1{1'b0}},1'b1}
                                         : {{EU_WIDTH-8{1'b0}},1'b1,7'b0};

assign pipe6_eu_sel[EU_WIDTH-1:0] = iu_vfpu_ex1_pipe0_mtvr_vld ? pipe6_mtvr_eu_sel[EU_WIDTH-1:0]
                                                               : idu_vfpu_rf_pipe6_eu_sel[EU_WIDTH-1:0];
  
//    {EU_WIDTH{idu_vfpu_rf_pipe6_sel}}      & idu_vfpu_rf_pipe6_eu_sel[EU_WIDTH-1:0]
//  | {EU_WIDTH{iu_vfpu_ex1_pipe0_mtvr_vld}} & pipe6_mtvr_eu_sel[EU_WIDTH-1:0];

always @(posedge ctrl_ex1_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex1_pipe6_eu_sel_tmp[EU_WIDTH-1:0] <= {EU_WIDTH{1'b0}};
  else if(rtu_yy_xx_flush)
    ctrl_ex1_pipe6_eu_sel_tmp[EU_WIDTH-1:0] <= {EU_WIDTH{1'b0}};
  else
    ctrl_ex1_pipe6_eu_sel_tmp[EU_WIDTH-1:0] <= pipe6_eu_sel[EU_WIDTH-1:0];
end

assign ctrl_ex1_pipe6_eu_sel[EU_WIDTH-1:0] ={EU_WIDTH{ctrl_ex1_pipe6_inst_vld}} & ctrl_ex1_pipe6_eu_sel_tmp[EU_WIDTH-1:0];
//----------------------------------------------------------
//               Pipe7 EU_SEL Contrl Signal
//----------------------------------------------------------
//mtvr inst data preparation
assign pipe7_mtvr_eu_sel[EU_WIDTH-1:0] = |iu_vfpu_ex1_pipe1_mtvr_inst[1:0] 
                                         || iu_vfpu_ex1_pipe1_mtvr_inst[4]
                                         ? {{EU_WIDTH-1{1'b0}},1'b1}
                                         : {{EU_WIDTH-8{1'b0}},1'b1,7'b0};

assign pipe7_eu_sel[EU_WIDTH-1:0] = iu_vfpu_ex1_pipe1_mtvr_vld ? pipe7_mtvr_eu_sel[EU_WIDTH-1:0]
                                                               : idu_vfpu_rf_pipe7_eu_sel[EU_WIDTH-1:0];
 
//    {EU_WIDTH{idu_vfpu_rf_pipe7_sel}}      & idu_vfpu_rf_pipe7_eu_sel[EU_WIDTH-1:0]
//  | {EU_WIDTH{iu_vfpu_ex1_pipe1_mtvr_vld}} & pipe7_mtvr_eu_sel[EU_WIDTH-1:0];

always @(posedge ctrl_ex1_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ctrl_ex1_pipe7_eu_sel_tmp[EU_WIDTH-1:0] <= {EU_WIDTH{1'b0}};
  else if(rtu_yy_xx_flush)
    ctrl_ex1_pipe7_eu_sel_tmp[EU_WIDTH-1:0] <= {EU_WIDTH{1'b0}};
  else
    ctrl_ex1_pipe7_eu_sel_tmp[EU_WIDTH-1:0] <= pipe7_eu_sel[EU_WIDTH-1:0];
end

assign ctrl_ex1_pipe7_eu_sel[EU_WIDTH-1:0] ={EU_WIDTH{ctrl_ex1_pipe7_inst_vld}} & ctrl_ex1_pipe7_eu_sel_tmp[EU_WIDTH-1:0];

// &Force("output","ctrl_ex1_pipe6_eu_sel"); @700
// &Force("output","ctrl_ex1_pipe7_eu_sel"); @701

// &ModuleEnd; @703
endmodule


