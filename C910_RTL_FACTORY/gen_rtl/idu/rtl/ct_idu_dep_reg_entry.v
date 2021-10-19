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

// &ModuleBeg; @26
module ct_idu_dep_reg_entry(
  alu0_reg_fwd_vld,
  alu1_reg_fwd_vld,
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  forever_cpuclk,
  gateclk_entry_vld,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_vld_dupx,
  iu_idu_ex2_pipe1_mult_inst_vld_dupx,
  iu_idu_ex2_pipe1_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_vld_dupx,
  lsu_idu_ag_pipe3_load_inst_vld,
  lsu_idu_ag_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  x_create_data,
  x_gateclk_idx_write_en,
  x_gateclk_write_en,
  x_rdy_clr,
  x_read_data,
  x_write_en
);

// &Ports; @27
input           alu0_reg_fwd_vld;                       
input           alu1_reg_fwd_vld;                       
input           cp0_idu_icg_en;                         
input           cp0_yy_clk_en;                          
input           cpurst_b;                               
input           ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input           ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [6 :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6 :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input           forever_cpuclk;                         
input           gateclk_entry_vld;                      
input           iu_idu_div_inst_vld;                    
input   [6 :0]  iu_idu_div_preg_dupx;                   
input   [6 :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
input           iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
input           iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
input   [6 :0]  iu_idu_ex2_pipe1_preg_dupx;             
input   [6 :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
input           iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
input           lsu_idu_ag_pipe3_load_inst_vld;         
input   [6 :0]  lsu_idu_ag_pipe3_preg_dupx;             
input           lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input           lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
input   [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input           lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input           pad_yy_icg_scan_en;                     
input           rtu_idu_flush_fe;                       
input           rtu_idu_flush_is;                       
input           vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input           vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [9 :0]  x_create_data;                          
input           x_gateclk_idx_write_en;                 
input           x_gateclk_write_en;                     
input           x_rdy_clr;                              
input           x_write_en;                             
output  [11:0]  x_read_data;                            

// &Regs; @28
reg             lsu_match;                              
reg     [6 :0]  preg;                                   
reg             rdy;                                    
reg             wb;                                     

// &Wires; @29
wire            alu0_data_ready;                        
wire            alu0_issue_data_ready;                  
wire            alu0_reg_fwd_vld;                       
wire            alu1_data_ready;                        
wire            alu1_issue_data_ready;                  
wire            alu1_reg_fwd_vld;                       
wire            cp0_idu_icg_en;                         
wire            cp0_yy_clk_en;                          
wire            cpurst_b;                               
wire            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire            data_ready;                             
wire            dep_clk;                                
wire            dep_clk_en;                             
wire            div_data_ready;                         
wire    [6 :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6 :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire            forever_cpuclk;                         
wire            gateclk_entry_vld;                      
wire            iu_idu_div_inst_vld;                    
wire    [6 :0]  iu_idu_div_preg_dupx;                   
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire            load_data_ready;                        
wire            load_issue_data_ready;                  
wire            lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6 :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire            lsu_match_update;                       
wire            mult_data_ready;                        
wire            pad_yy_icg_scan_en;                     
wire            pipe0_wb;                               
wire            pipe1_wb;                               
wire            pipe3_wb;                               
wire            rdy_clear;                              
wire            rdy_update;                             
wire            rtu_idu_flush_fe;                       
wire            rtu_idu_flush_is;                       
wire            vfpu0_data_ready;                       
wire            vfpu1_data_ready;                       
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire            wake_up;                                
wire            wb_update;                              
wire            write_back;                             
wire            write_clk;                              
wire            write_clk_en;                           
wire    [9 :0]  x_create_data;                          
wire            x_create_lsu_match;                     
wire    [6 :0]  x_create_preg;                          
wire            x_create_rdy;                           
wire            x_create_wb;                            
wire            x_gateclk_idx_write_en;                 
wire            x_gateclk_write_en;                     
wire            x_rdy_clr;                              
wire    [11:0]  x_read_data;                            
wire            x_read_lsu_match;                       
wire    [6 :0]  x_read_preg;                            
wire            x_read_rdy;                             
wire            x_read_rdy_for_bypass;                  
wire            x_read_rdy_for_issue;                   
wire            x_read_wb;                              
wire            x_write_en;                             



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign dep_clk_en = x_gateclk_write_en || gateclk_entry_vld && (!rdy || !wb);
// &Instance("gated_clk_cell", "x_dep_gated_clk"); @36
gated_clk_cell  x_dep_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dep_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (dep_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @37
//          .external_en (1'b0), @38
//          .global_en   (cp0_yy_clk_en), @39
//          .module_en   (cp0_idu_icg_en), @40
//          .local_en    (dep_clk_en), @41
//          .clk_out     (dep_clk)); @42

assign write_clk_en = x_gateclk_idx_write_en;
// &Instance("gated_clk_cell", "x_write_gated_clk"); @45
gated_clk_cell  x_write_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (write_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (write_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @46
//          .external_en (1'b0), @47
//          .global_en   (cp0_yy_clk_en), @48
//          .module_en   (cp0_idu_icg_en), @49
//          .local_en    (write_clk_en), @50
//          .clk_out     (write_clk)); @51

//==========================================================
//                  Create and Read Bus
//==========================================================
assign x_create_lsu_match           = x_create_data[9];
assign x_create_preg[6:0]           = x_create_data[8:2];
assign x_create_wb                  = x_create_data[1];
assign x_create_rdy                 = x_create_data[0];

assign x_read_data[11]              = x_read_lsu_match;
assign x_read_data[10]              = x_read_rdy_for_bypass;
assign x_read_data[9]               = x_read_rdy_for_issue;
assign x_read_data[8:2]             = x_read_preg[6:0];
assign x_read_data[1]               = x_read_wb;
assign x_read_data[0]               = x_read_rdy;

//==========================================================
//                       Ready Bit
//==========================================================
//ready bit shows the result of source is predicted to be ready:
//1 stands for the result may be forwarded

//-------------Update value of Ready Bit--------------------
//prepare data_ready signal
assign alu0_data_ready   = ctrl_xx_rf_pipe0_preg_lch_vld_dupx
                           && (dp_xx_rf_pipe0_dst_preg_dupx[6:0] == preg[6:0]);
//div data ready use wb to wake up / set ready
assign alu1_data_ready   = ctrl_xx_rf_pipe1_preg_lch_vld_dupx
                           && (dp_xx_rf_pipe1_dst_preg_dupx[6:0] == preg[6:0]);
assign mult_data_ready   = iu_idu_ex2_pipe1_mult_inst_vld_dupx
                           && (iu_idu_ex2_pipe1_preg_dupx[6:0] == preg[6:0]);
assign div_data_ready    = iu_idu_div_inst_vld
                           && (iu_idu_div_preg_dupx[6:0] == preg[6:0]);
assign load_data_ready   = lsu_idu_dc_pipe3_load_inst_vld_dupx
                           && (lsu_idu_dc_pipe3_preg_dupx[6:0] == preg[6:0]);
assign vfpu0_data_ready  = vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx
                           && (vfpu_idu_ex1_pipe6_preg_dupx[6:0] == preg[6:0]);
assign vfpu1_data_ready  = vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx
                           && (vfpu_idu_ex1_pipe7_preg_dupx[6:0] == preg[6:0]);
//bypass data ready for issue
assign alu0_issue_data_ready = alu0_reg_fwd_vld;
assign alu1_issue_data_ready = alu1_reg_fwd_vld;
assign load_issue_data_ready = lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx && lsu_match;

assign data_ready        = alu0_data_ready
                           || alu1_data_ready
                           || mult_data_ready
                           || div_data_ready
                           || load_data_ready
                           || vfpu0_data_ready
                           || vfpu1_data_ready;
//prepare wake up signal
assign wake_up           = wb;
//prepare clear signal
assign rdy_clear         = x_rdy_clr;

//1.if ready is already be 1, just hold 1
//2.if producer are presumed to produce the result two cycles later,
//  set ready to 1 
//3.if producer wake up, set ready to 1
//4.clear ready to 0
assign rdy_update = (rdy || data_ready || wake_up) && !rdy_clear;
//ready read signal
assign x_read_rdy = rdy_update;
//the following signals are for Issue Queue bypass/issue logic
assign x_read_rdy_for_issue  = rdy || alu0_issue_data_ready
                                   || alu1_issue_data_ready
                                   || load_issue_data_ready;
assign x_read_rdy_for_bypass = rdy;

always @(posedge dep_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rdy <= 1'b1;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rdy <= 1'b1;
  else if(x_write_en)
    rdy <= x_create_rdy;
  else
    rdy <= rdy_update;
end

//==========================================================
//              LSU reg Match for Bypass Ready
//==========================================================
assign lsu_match_update = lsu_idu_ag_pipe3_load_inst_vld
                          && (lsu_idu_ag_pipe3_preg_dupx[6:0] == preg[6:0]);

assign x_read_lsu_match  = lsu_match_update;

always @(posedge dep_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lsu_match <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    lsu_match <= 1'b0;
  else if(x_write_en)
    lsu_match <= x_create_lsu_match;
  else
    lsu_match <= lsu_match_update;
end

//==========================================================
//                     Write Back Valid  
//==========================================================
//write back valid shows whether the result is written back
//into PRF : 1 stands for the result is in PRF

//-------------Update value of Write Back Bit---------------
//prepare write back signal
assign pipe0_wb = iu_idu_ex2_pipe0_wb_preg_vld_dupx
                  && (iu_idu_ex2_pipe0_wb_preg_dupx[6:0] == preg[6:0]);
assign pipe1_wb = iu_idu_ex2_pipe1_wb_preg_vld_dupx
                  && (iu_idu_ex2_pipe1_wb_preg_dupx[6:0] == preg[6:0]);
assign pipe3_wb = lsu_idu_wb_pipe3_wb_preg_vld_dupx
                  && (lsu_idu_wb_pipe3_wb_preg_dupx[6:0] == preg[6:0]);
assign write_back = wb
                    || pipe0_wb
                    || pipe1_wb
                    || pipe3_wb;
//1.if wb_vld is already be 1, just hold 1
//2.if this result is writing back to PRF, set wb to 1
assign x_read_wb = wb_update;
assign wb_update = wb || write_back;

always @(posedge dep_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    wb <= 1'b1;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    wb <= 1'b1;
  else if(x_write_en)
    wb <= x_create_wb;
  else
    wb <= wb_update;
end

//==========================================================
//                         Preg 
//==========================================================
assign x_read_preg[6:0] = preg[6:0];
always @(posedge write_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    preg[6:0] <= 7'b0;
  else if(x_write_en)
    preg[6:0] <= x_create_preg[6:0];
  else
    preg[6:0] <= preg[6:0];
end

// &ModuleEnd; @203
endmodule


