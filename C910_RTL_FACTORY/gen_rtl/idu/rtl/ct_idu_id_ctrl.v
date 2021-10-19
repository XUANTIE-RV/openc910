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

// &ModuleBeg; @27
module ct_idu_id_ctrl(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_id_debug_id_pipedown3,
  ctrl_dp_id_inst0_vld,
  ctrl_dp_id_inst1_vld,
  ctrl_dp_id_inst2_vld,
  ctrl_dp_id_pipedown_1_inst,
  ctrl_dp_id_pipedown_2_inst,
  ctrl_dp_id_pipedown_3_inst,
  ctrl_dp_id_stall,
  ctrl_fence_id_inst_vld,
  ctrl_fence_id_stall,
  ctrl_id_pipedown_gateclk,
  ctrl_id_pipedown_inst0_vld,
  ctrl_id_pipedown_inst1_vld,
  ctrl_id_pipedown_inst2_vld,
  ctrl_id_pipedown_inst3_vld,
  ctrl_ir_stage_stall,
  ctrl_ir_stall,
  ctrl_split_long_id_inst_vld,
  ctrl_split_long_id_stall,
  ctrl_top_id_inst0_vld,
  ctrl_top_id_inst1_vld,
  ctrl_top_id_inst2_vld,
  dp_ctrl_id_inst0_fence,
  dp_ctrl_id_inst0_normal,
  dp_ctrl_id_inst0_split_long,
  dp_ctrl_id_inst0_split_short,
  dp_ctrl_id_inst1_fence,
  dp_ctrl_id_inst1_normal,
  dp_ctrl_id_inst1_split_long,
  dp_ctrl_id_inst1_split_short,
  dp_ctrl_id_inst2_fence,
  dp_ctrl_id_inst2_normal,
  dp_ctrl_id_inst2_split_long,
  dp_ctrl_id_inst2_split_short,
  fence_ctrl_id_stall,
  fence_ctrl_inst0_vld,
  fence_ctrl_inst1_vld,
  fence_ctrl_inst2_vld,
  forever_cpuclk,
  had_idu_debug_id_inst_en,
  hpcp_idu_cnt_en,
  idu_had_id_inst0_vld,
  idu_had_id_inst1_vld,
  idu_had_id_inst2_vld,
  idu_had_pipe_stall,
  idu_hpcp_backend_stall,
  idu_ifu_id_bypass_stall,
  idu_ifu_id_stall,
  ifu_idu_ib_inst0_vld,
  ifu_idu_ib_inst1_vld,
  ifu_idu_ib_inst2_vld,
  ifu_idu_ib_pipedown_gateclk,
  iu_yy_xx_cancel,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  split_long_ctrl_id_stall,
  split_long_ctrl_inst_vld
);

// &Ports; @28
input          cp0_idu_icg_en;                    
input          cp0_yy_clk_en;                     
input          cpurst_b;                          
input          ctrl_ir_stage_stall;               
input          ctrl_ir_stall;                     
input          dp_ctrl_id_inst0_fence;            
input          dp_ctrl_id_inst0_normal;           
input          dp_ctrl_id_inst0_split_long;       
input          dp_ctrl_id_inst0_split_short;      
input          dp_ctrl_id_inst1_fence;            
input          dp_ctrl_id_inst1_normal;           
input          dp_ctrl_id_inst1_split_long;       
input          dp_ctrl_id_inst1_split_short;      
input          dp_ctrl_id_inst2_fence;            
input          dp_ctrl_id_inst2_normal;           
input          dp_ctrl_id_inst2_split_long;       
input          dp_ctrl_id_inst2_split_short;      
input          fence_ctrl_id_stall;               
input          fence_ctrl_inst0_vld;              
input          fence_ctrl_inst1_vld;              
input          fence_ctrl_inst2_vld;              
input          forever_cpuclk;                    
input          had_idu_debug_id_inst_en;          
input          hpcp_idu_cnt_en;                   
input          ifu_idu_ib_inst0_vld;              
input          ifu_idu_ib_inst1_vld;              
input          ifu_idu_ib_inst2_vld;              
input          ifu_idu_ib_pipedown_gateclk;       
input          iu_yy_xx_cancel;                   
input          pad_yy_icg_scan_en;                
input          rtu_idu_flush_fe;                  
input          split_long_ctrl_id_stall;          
input   [3:0]  split_long_ctrl_inst_vld;          
output         ctrl_dp_id_debug_id_pipedown3;     
output         ctrl_dp_id_inst0_vld;              
output         ctrl_dp_id_inst1_vld;              
output         ctrl_dp_id_inst2_vld;              
output         ctrl_dp_id_pipedown_1_inst;        
output         ctrl_dp_id_pipedown_2_inst;        
output         ctrl_dp_id_pipedown_3_inst;        
output         ctrl_dp_id_stall;                  
output         ctrl_fence_id_inst_vld;            
output         ctrl_fence_id_stall;               
output         ctrl_id_pipedown_gateclk;          
output         ctrl_id_pipedown_inst0_vld;        
output         ctrl_id_pipedown_inst1_vld;        
output         ctrl_id_pipedown_inst2_vld;        
output         ctrl_id_pipedown_inst3_vld;        
output         ctrl_split_long_id_inst_vld;       
output         ctrl_split_long_id_stall;          
output         ctrl_top_id_inst0_vld;             
output         ctrl_top_id_inst1_vld;             
output         ctrl_top_id_inst2_vld;             
output         idu_had_id_inst0_vld;              
output         idu_had_id_inst1_vld;              
output         idu_had_id_inst2_vld;              
output         idu_had_pipe_stall;                
output         idu_hpcp_backend_stall;            
output         idu_ifu_id_bypass_stall;           
output         idu_ifu_id_stall;                  

// &Regs; @29
reg            ctrl_id_pipedown_inst1_vld;        
reg            ctrl_id_pipedown_inst2_vld;        
reg            ctrl_id_pipedown_inst3_vld;        
reg            debug_id_inst0_vld;                
reg            debug_id_inst1_vld;                
reg            debug_id_inst2_vld;                
reg            debug_id_pipedown3;                
reg            id_inst0_vld;                      
reg            id_inst1_vld;                      
reg            id_inst2_vld;                      

// &Wires; @30
wire           cp0_idu_icg_en;                    
wire           cp0_yy_clk_en;                     
wire           cpurst_b;                          
wire           ctrl_dp_id_debug_id_pipedown3;     
wire           ctrl_dp_id_inst0_vld;              
wire           ctrl_dp_id_inst1_vld;              
wire           ctrl_dp_id_inst2_vld;              
wire           ctrl_dp_id_pipedown_1_inst;        
wire           ctrl_dp_id_pipedown_2_inst;        
wire           ctrl_dp_id_pipedown_3_inst;        
wire           ctrl_dp_id_stall;                  
wire           ctrl_fence_id_inst_vld;            
wire           ctrl_fence_id_stall;               
wire           ctrl_ib_pipedown_inst0_vld;        
wire           ctrl_ib_pipedown_inst1_vld;        
wire           ctrl_ib_pipedown_inst2_vld;        
wire           ctrl_id_1_fence_inst;              
wire           ctrl_id_1_split_long_inst;         
wire           ctrl_id_bypass_stall;              
wire           ctrl_id_inst0_fence;               
wire           ctrl_id_inst0_normal;              
wire           ctrl_id_inst0_split_long;          
wire           ctrl_id_inst0_split_short;         
wire           ctrl_id_inst1_fence;               
wire           ctrl_id_inst1_normal;              
wire           ctrl_id_inst1_split_long;          
wire           ctrl_id_inst1_split_short;         
wire           ctrl_id_inst2_fence;               
wire           ctrl_id_inst2_normal;              
wire           ctrl_id_inst2_split_long;          
wire           ctrl_id_inst2_split_short;         
wire           ctrl_id_pipedown_1_inst;           
wire           ctrl_id_pipedown_2_inst;           
wire           ctrl_id_pipedown_3_inst;           
wire           ctrl_id_pipedown_3_inst_for_bypass; 
wire           ctrl_id_pipedown_gateclk;          
wire           ctrl_id_pipedown_inst0_vld;        
wire           ctrl_id_pipedown_stall;            
wire           ctrl_id_split_long_stall;          
wire           ctrl_id_stall;                     
wire           ctrl_ir_stage_stall;               
wire           ctrl_ir_stall;                     
wire           ctrl_split_long_id_inst_vld;       
wire           ctrl_split_long_id_stall;          
wire           ctrl_top_id_inst0_vld;             
wire           ctrl_top_id_inst1_vld;             
wire           ctrl_top_id_inst2_vld;             
wire           debug_id_inst_clk;                 
wire           debug_id_inst_clk_en;              
wire           debug_id_inst_vld;                 
wire           dp_ctrl_id_inst0_fence;            
wire           dp_ctrl_id_inst0_normal;           
wire           dp_ctrl_id_inst0_split_long;       
wire           dp_ctrl_id_inst0_split_short;      
wire           dp_ctrl_id_inst1_fence;            
wire           dp_ctrl_id_inst1_normal;           
wire           dp_ctrl_id_inst1_split_long;       
wire           dp_ctrl_id_inst1_split_short;      
wire           dp_ctrl_id_inst2_fence;            
wire           dp_ctrl_id_inst2_normal;           
wire           dp_ctrl_id_inst2_split_long;       
wire           dp_ctrl_id_inst2_split_short;      
wire           fence_ctrl_id_stall;               
wire           fence_ctrl_inst0_vld;              
wire           fence_ctrl_inst1_vld;              
wire           fence_ctrl_inst2_vld;              
wire           forever_cpuclk;                    
wire           had_idu_debug_id_inst_en;          
wire           hpcp_idu_cnt_en;                   
wire           id_inst_clk;                       
wire           id_inst_clk_en;                    
wire           idu_had_id_inst0_vld;              
wire           idu_had_id_inst1_vld;              
wire           idu_had_id_inst2_vld;              
wire           idu_had_pipe_stall;                
wire           idu_hpcp_backend_stall;            
wire           idu_ifu_id_bypass_stall;           
wire           idu_ifu_id_stall;                  
wire           ifu_idu_ib_inst0_vld;              
wire           ifu_idu_ib_inst1_vld;              
wire           ifu_idu_ib_inst2_vld;              
wire           ifu_idu_ib_pipedown_gateclk;       
wire           iu_yy_xx_cancel;                   
wire           pad_yy_icg_scan_en;                
wire           rtu_idu_flush_fe;                  
wire           split_long_ctrl_id_stall;          
wire    [3:0]  split_long_ctrl_inst_vld;          



//==========================================================
//                 ID pipeline registers
//==========================================================
//----------------------------------------------------------
//            IB Pipedown Instruction selection
//----------------------------------------------------------
assign ctrl_ib_pipedown_inst0_vld =
            ctrl_id_pipedown_1_inst && id_inst1_vld
         || ctrl_id_pipedown_2_inst && id_inst2_vld
         || ctrl_id_pipedown_3_inst && ifu_idu_ib_inst0_vld;
assign ctrl_ib_pipedown_inst1_vld =
            ctrl_id_pipedown_1_inst && id_inst2_vld
         || ctrl_id_pipedown_2_inst && 1'b0
         || ctrl_id_pipedown_3_inst && ifu_idu_ib_inst1_vld;
assign ctrl_ib_pipedown_inst2_vld =
            ctrl_id_pipedown_1_inst && 1'b0
         || ctrl_id_pipedown_2_inst && 1'b0
         || ctrl_id_pipedown_3_inst && ifu_idu_ib_inst2_vld;


//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------
assign id_inst_clk_en = ifu_idu_ib_pipedown_gateclk
                        || id_inst0_vld
                        || id_inst1_vld
                        || id_inst2_vld;
// &Instance("gated_clk_cell", "x_id_inst_gated_clk"); @60
gated_clk_cell  x_id_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (id_inst_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (id_inst_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @61
//          .external_en (1'b0), @62
//          .global_en   (cp0_yy_clk_en), @63
//          .module_en   (cp0_idu_icg_en), @64
//          .local_en    (id_inst_clk_en), @65
//          .clk_out     (id_inst_clk)); @66

//----------------------------------------------------------
//               Pipeline register implement
//----------------------------------------------------------
always @(posedge id_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    id_inst0_vld <= 1'b0;
    id_inst1_vld <= 1'b0;
    id_inst2_vld <= 1'b0;
  end
  else if(rtu_idu_flush_fe || iu_yy_xx_cancel) begin
    id_inst0_vld <= 1'b0;
    id_inst1_vld <= 1'b0;
    id_inst2_vld <= 1'b0;
  end
  else if(!ctrl_id_pipedown_stall) begin
    id_inst0_vld <= ctrl_ib_pipedown_inst0_vld;
    id_inst1_vld <= ctrl_ib_pipedown_inst1_vld;
    id_inst2_vld <= ctrl_ib_pipedown_inst2_vld;
  end
  else begin
    id_inst0_vld <= id_inst0_vld;
    id_inst1_vld <= id_inst1_vld;
    id_inst2_vld <= id_inst2_vld;
  end
end

assign ctrl_dp_id_inst0_vld     = id_inst0_vld;
assign ctrl_dp_id_inst1_vld     = id_inst1_vld;
assign ctrl_dp_id_inst2_vld     = id_inst2_vld;
assign ctrl_id_pipedown_gateclk = id_inst0_vld;
assign ctrl_top_id_inst0_vld    = id_inst0_vld;
assign ctrl_top_id_inst1_vld    = id_inst1_vld;
assign ctrl_top_id_inst2_vld    = id_inst2_vld;

//----------------------------------------------------------
//                 Instance of Gated Cell
//----------------------------------------------------------
assign debug_id_inst_clk_en = debug_id_inst_vld
                              || debug_id_pipedown3
                              || debug_id_inst0_vld;
// &Instance("gated_clk_cell", "x_debug_id_inst_gated_clk"); @109
gated_clk_cell  x_debug_id_inst_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (debug_id_inst_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (debug_id_inst_clk_en),
  .module_en            (cp0_idu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk), @110
//          .external_en (1'b0), @111
//          .global_en   (cp0_yy_clk_en), @112
//          .module_en   (cp0_idu_icg_en), @113
//          .local_en    (debug_id_inst_clk_en), @114
//          .clk_out     (debug_id_inst_clk)); @115

//----------------------------------------------------------
//               Pipeline register implement
//----------------------------------------------------------
assign debug_id_inst_vld = id_inst0_vld
                           && (had_idu_debug_id_inst_en
                            || hpcp_idu_cnt_en);
always @(posedge debug_id_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    debug_id_pipedown3 <= 1'b0;
  else if(debug_id_inst_vld)
    debug_id_pipedown3 <= !ctrl_id_stall;
  else
    debug_id_pipedown3 <= 1'b0;
end

assign ctrl_dp_id_debug_id_pipedown3 = debug_id_pipedown3;
assign idu_hpcp_backend_stall        = !debug_id_pipedown3;

//----------------------------------------------------------
//               Pipeline register implement
//----------------------------------------------------------
always @(posedge debug_id_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    debug_id_inst0_vld <= 1'b0;
    debug_id_inst1_vld <= 1'b0;
    debug_id_inst2_vld <= 1'b0;
  end
  else if(debug_id_pipedown3) begin
    debug_id_inst0_vld <= id_inst0_vld;
    debug_id_inst1_vld <= id_inst1_vld;
    debug_id_inst2_vld <= id_inst2_vld;
  end
  else begin
    debug_id_inst0_vld <= 1'b0;
    debug_id_inst1_vld <= 1'b0;
    debug_id_inst2_vld <= 1'b0;
  end
end

assign idu_had_id_inst0_vld = debug_id_inst0_vld;
assign idu_had_id_inst1_vld = debug_id_inst1_vld;
assign idu_had_id_inst2_vld = debug_id_inst2_vld;

//==========================================================
//                 ID stage control signals
//==========================================================
//----------------------------------------------------------
//                  Prepare Type Signals
//----------------------------------------------------------
assign ctrl_id_inst0_fence       = id_inst0_vld && dp_ctrl_id_inst0_fence;
assign ctrl_id_inst1_fence       = id_inst1_vld && dp_ctrl_id_inst1_fence;
assign ctrl_id_inst2_fence       = id_inst2_vld && dp_ctrl_id_inst2_fence;

assign ctrl_id_inst0_split_short = id_inst0_vld && dp_ctrl_id_inst0_split_short;
assign ctrl_id_inst1_split_short = id_inst1_vld && dp_ctrl_id_inst1_split_short;
assign ctrl_id_inst2_split_short = id_inst2_vld && dp_ctrl_id_inst2_split_short;

assign ctrl_id_inst0_split_long  = id_inst0_vld && dp_ctrl_id_inst0_split_long;
assign ctrl_id_inst1_split_long  = id_inst1_vld && dp_ctrl_id_inst1_split_long;
assign ctrl_id_inst2_split_long  = id_inst2_vld && dp_ctrl_id_inst2_split_long;

assign ctrl_id_inst0_normal      = id_inst0_vld && dp_ctrl_id_inst0_normal;
assign ctrl_id_inst1_normal      = id_inst1_vld && dp_ctrl_id_inst1_normal;
assign ctrl_id_inst2_normal      = id_inst2_vld && dp_ctrl_id_inst2_normal;

//----------------------------------------------------------
//                 Fence Instruction Valid
//----------------------------------------------------------
//fence valid only when ID inst0 is valid fence inst
assign ctrl_fence_id_inst_vld = ctrl_id_inst0_fence;

//----------------------------------------------------------
//              Long Split Instruction Valid
//----------------------------------------------------------
//long split valid only when ID inst0 is valid long split inst
assign ctrl_split_long_id_inst_vld = ctrl_id_inst0_split_long;

//==========================================================
//                 Pipedown control signals
//==========================================================
//----------------------------------------------------------
//            IR Pipedown Instruction 0 valid
//----------------------------------------------------------
assign ctrl_id_pipedown_inst0_vld =
            ctrl_id_inst0_normal      && id_inst0_vld
         || ctrl_id_inst0_split_short && 1'b1
         || ctrl_id_inst0_split_long  && split_long_ctrl_inst_vld[0]
         || ctrl_id_inst0_fence       && fence_ctrl_inst0_vld;

//----------------------------------------------------------
//            IR Pipedown Instruction 1 valid
//----------------------------------------------------------
// &CombBeg; @211
always @( ctrl_id_inst1_fence
       or ctrl_id_inst0_split_long
       or ctrl_id_inst1_split_long
       or ctrl_id_inst0_fence
       or ctrl_id_inst0_split_short
       or split_long_ctrl_inst_vld[1]
       or id_inst1_vld
       or fence_ctrl_inst1_vld
       or ctrl_id_inst1_split_short
       or ctrl_id_pipedown_1_inst)
begin
  //consider id inst0 type
  if(ctrl_id_inst0_fence)
    ctrl_id_pipedown_inst1_vld = fence_ctrl_inst1_vld;
  else if(ctrl_id_inst0_split_short)
    ctrl_id_pipedown_inst1_vld = 1'b1;
  else if(ctrl_id_inst0_split_long)
    ctrl_id_pipedown_inst1_vld = split_long_ctrl_inst_vld[1];
  //consider id inst1 type
  else if(ctrl_id_inst1_fence)
    ctrl_id_pipedown_inst1_vld = 1'b0;
  else if(ctrl_id_inst1_split_long)
    ctrl_id_pipedown_inst1_vld = 1'b0;
  else if(ctrl_id_inst1_split_short)
    ctrl_id_pipedown_inst1_vld = 1'b1;
  else
    ctrl_id_pipedown_inst1_vld = id_inst1_vld
                                 && !ctrl_id_pipedown_1_inst;
// &CombEnd; @229
end

//----------------------------------------------------------
//            IR Pipedown Instruction 2 valid
//----------------------------------------------------------
// &CombBeg; @234
always @( ctrl_id_inst1_fence
       or ctrl_id_inst0_split_long
       or ctrl_id_inst1_split_long
       or ctrl_id_pipedown_2_inst
       or ctrl_id_inst0_fence
       or fence_ctrl_inst2_vld
       or ctrl_id_inst0_split_short
       or id_inst1_vld
       or id_inst2_vld
       or split_long_ctrl_inst_vld[2]
       or ctrl_id_inst1_split_short
       or ctrl_id_inst2_split_short
       or ctrl_id_inst2_fence
       or ctrl_id_pipedown_1_inst
       or ctrl_id_inst2_split_long)
begin
  //consider id inst0 type
  if(ctrl_id_inst0_fence)
    ctrl_id_pipedown_inst2_vld = fence_ctrl_inst2_vld;
  else if(ctrl_id_inst0_split_long)
    ctrl_id_pipedown_inst2_vld = split_long_ctrl_inst_vld[2];
  else if(ctrl_id_inst0_split_short && ctrl_id_inst1_split_short)
    ctrl_id_pipedown_inst2_vld = 1'b1;
  else if(ctrl_id_inst0_split_short)
    ctrl_id_pipedown_inst2_vld = id_inst1_vld
                                 && !ctrl_id_pipedown_1_inst;
  //consider id inst1 type
  else if(ctrl_id_inst1_fence)
    ctrl_id_pipedown_inst2_vld = 1'b0;
  else if(ctrl_id_inst1_split_long)
    ctrl_id_pipedown_inst2_vld = 1'b0;
  else if(ctrl_id_inst1_split_short)
    ctrl_id_pipedown_inst2_vld = 1'b1;
  //consider id inst2 type
  else if(ctrl_id_inst2_fence)
    ctrl_id_pipedown_inst2_vld = 1'b0;
  else if(ctrl_id_inst2_split_long)
    ctrl_id_pipedown_inst2_vld = 1'b0;
  else if(ctrl_id_inst2_split_short)
    ctrl_id_pipedown_inst2_vld = 1'b1;
  else
    ctrl_id_pipedown_inst2_vld = id_inst2_vld
                                 && !ctrl_id_pipedown_1_inst
                                 && !ctrl_id_pipedown_2_inst;
// &CombEnd; @263
end

//----------------------------------------------------------
//            IR Pipedown Instruction 3 valid
//----------------------------------------------------------
// &CombBeg; @268
always @( ctrl_id_inst1_fence
       or ctrl_id_inst0_split_long
       or ctrl_id_pipedown_2_inst
       or ctrl_id_inst1_split_long
       or ctrl_id_inst0_fence
       or ctrl_id_inst0_split_short
       or id_inst2_vld
       or split_long_ctrl_inst_vld[3]
       or ctrl_id_inst1_split_short
       or ctrl_id_inst2_split_short
       or ctrl_id_pipedown_1_inst)
begin
  //consider id inst0 type
  if(ctrl_id_inst0_fence)
    ctrl_id_pipedown_inst3_vld = 1'b0;
  else if(ctrl_id_inst0_split_long)
    ctrl_id_pipedown_inst3_vld = split_long_ctrl_inst_vld[3];
  else if(ctrl_id_inst0_split_short && ctrl_id_inst1_split_short)
    ctrl_id_pipedown_inst3_vld = 1'b1;
  else if(ctrl_id_inst0_split_short)
    ctrl_id_pipedown_inst3_vld = id_inst2_vld
                                 && !ctrl_id_pipedown_1_inst
                                 && !ctrl_id_pipedown_2_inst;
  //consider id inst1 type
  else if(ctrl_id_inst1_fence)
    ctrl_id_pipedown_inst3_vld = 1'b0;
  else if(ctrl_id_inst1_split_long)
    ctrl_id_pipedown_inst3_vld = 1'b0;
  else if(ctrl_id_inst1_split_short)
    ctrl_id_pipedown_inst3_vld = id_inst2_vld
                                 && !ctrl_id_pipedown_1_inst
                                 && !ctrl_id_pipedown_2_inst;
  //consider id inst2 type
  else
    ctrl_id_pipedown_inst3_vld = ctrl_id_inst2_split_short
                                 && !ctrl_id_pipedown_1_inst
                                 && !ctrl_id_pipedown_2_inst;
// &CombEnd; @294
end


//==========================================================
//               Pipedown Instruction Type
//==========================================================
//short split: split to 2 inst
//long  split: (may) split to more than 2 inst
assign ctrl_id_1_fence_inst      = ctrl_id_inst0_fence 
                                || ctrl_id_inst1_fence
                                || ctrl_id_inst2_fence;
assign ctrl_id_1_split_long_inst = ctrl_id_inst0_split_long
                                || ctrl_id_inst1_split_long
                                || ctrl_id_inst2_split_long;

//----------------------------------------------------------
//                    Pipedown 1 Inst
//----------------------------------------------------------
//pipedown 1 inst when:
//   inst0 can pipedown (not a stall long split, fence stall deal in id stall)
//   while inst1 cannot pipedown with inst0
assign ctrl_id_pipedown_1_inst =
            (ctrl_id_inst0_normal || ctrl_id_inst0_split_short)
             && (ctrl_id_inst1_fence || ctrl_id_inst1_split_long)
         || (ctrl_id_inst0_split_long && !split_long_ctrl_id_stall
             || ctrl_id_inst0_fence && !fence_ctrl_id_stall);

//----------------------------------------------------------
//                    Pipedown 2 Inst
//----------------------------------------------------------
//pipedown 2 inst when:
//   inst0 and inst1 are normal or split short
//   while inst2 cannot pipedown with inst0 and inst1
assign ctrl_id_pipedown_2_inst =
            (ctrl_id_inst0_normal || ctrl_id_inst0_split_short)
         && (ctrl_id_inst1_normal || ctrl_id_inst1_split_short)
         && (ctrl_id_inst2_normal 
             && ctrl_id_inst0_split_short && ctrl_id_inst1_split_short
          || ctrl_id_inst2_split_short
             && (ctrl_id_inst0_split_short || ctrl_id_inst1_split_short)
          || ctrl_id_inst2_split_long
          || ctrl_id_inst2_fence);

//----------------------------------------------------------
//                    Pipedown 3 Inst
//----------------------------------------------------------
//pipedown 3 inst when:
//1. no fence inst and no long split inst and no 2 or more short split inst
//   (except inst0/1 are short split insts and inst 2 is normal inst)
assign ctrl_id_pipedown_3_inst =
            !ctrl_id_1_fence_inst
         && !ctrl_id_1_split_long_inst
         && !(ctrl_id_inst2_split_short
              && (ctrl_id_inst0_split_short || ctrl_id_inst1_split_short))
         && !(id_inst2_vld
              && (ctrl_id_inst0_split_short && ctrl_id_inst1_split_short));

//pipedown 3 inst signal for IFU ibuf bypass with timing optimization:
//no timing optimization
assign ctrl_id_pipedown_3_inst_for_bypass = ctrl_id_pipedown_3_inst;

//----------------------------------------------------------
//                     ID inst Select
//----------------------------------------------------------
//rename for data path
assign ctrl_dp_id_pipedown_1_inst = ctrl_id_pipedown_1_inst;
assign ctrl_dp_id_pipedown_2_inst = ctrl_id_pipedown_2_inst;
assign ctrl_dp_id_pipedown_3_inst = ctrl_id_pipedown_3_inst;

//==========================================================
//                     ID stage stall
//==========================================================
//----------------------------------------------------------
//                  ID stage Stall Source
//----------------------------------------------------------
//if ir stage stall
assign ctrl_split_long_id_stall = ctrl_ir_stall;
assign ctrl_fence_id_stall      = ctrl_ir_stall;
//split long stall
assign ctrl_id_split_long_stall = ctrl_id_inst0_split_long
                                  && split_long_ctrl_id_stall;

//----------------------------------------------------------
//                     ID stage Stall
//----------------------------------------------------------
// id stall for IFU
assign ctrl_id_stall            = id_inst0_vld
                                  && (ctrl_ir_stall
                                   || !ctrl_id_pipedown_3_inst);
//bypass id stall for IFU bypass
assign ctrl_id_bypass_stall     = id_inst0_vld
                                  && (ctrl_ir_stall
                                   || !ctrl_id_pipedown_3_inst_for_bypass);
//pipedown stall for ID inst valid and data path
assign ctrl_id_pipedown_stall   = id_inst0_vld
                                  && (ctrl_ir_stall
                                   || fence_ctrl_id_stall
                                   || ctrl_id_split_long_stall);

//----------------------------------------------------------
//                  Output stall signals
//----------------------------------------------------------
assign ctrl_dp_id_stall         = ctrl_id_pipedown_stall;
assign idu_ifu_id_stall         = ctrl_id_stall;
assign idu_ifu_id_bypass_stall  = ctrl_id_bypass_stall;

assign idu_had_pipe_stall       = id_inst0_vld && fence_ctrl_id_stall
                                  || ctrl_ir_stage_stall;

// &ModuleEnd; @403
endmodule


