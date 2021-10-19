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
module ct_idu_is_aiq0_entry(
  aiq0_aiq_create0_entry,
  aiq0_aiq_create1_entry,
  aiq1_aiq_create0_entry,
  aiq1_aiq_create1_entry,
  biq_aiq_create0_entry,
  biq_aiq_create1_entry,
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_aiq0_create0_dp_en,
  ctrl_aiq0_create0_gateclk_en,
  ctrl_aiq0_create1_dp_en,
  ctrl_aiq0_create1_gateclk_en,
  ctrl_aiq0_rf_pop_vld,
  ctrl_aiq0_stall,
  ctrl_aiq1_create0_dp_en,
  ctrl_aiq1_create0_gateclk_en,
  ctrl_aiq1_create1_dp_en,
  ctrl_aiq1_create1_gateclk_en,
  ctrl_biq_create0_dp_en,
  ctrl_biq_create0_gateclk_en,
  ctrl_biq_create1_dp_en,
  ctrl_biq_create1_gateclk_en,
  ctrl_dp_is_dis_aiq0_create0_sel,
  ctrl_dp_is_dis_aiq0_create1_sel,
  ctrl_dp_is_dis_aiq1_create0_sel,
  ctrl_dp_is_dis_aiq1_create1_sel,
  ctrl_dp_is_dis_biq_create0_sel,
  ctrl_dp_is_dis_biq_create1_sel,
  ctrl_dp_is_dis_lsiq_create0_sel,
  ctrl_dp_is_dis_lsiq_create1_sel,
  ctrl_dp_is_dis_sdiq_create0_sel,
  ctrl_dp_is_dis_sdiq_create1_sel,
  ctrl_lsiq_create0_dp_en,
  ctrl_lsiq_create0_gateclk_en,
  ctrl_lsiq_create1_dp_en,
  ctrl_lsiq_create1_gateclk_en,
  ctrl_sdiq_create0_dp_en,
  ctrl_sdiq_create0_gateclk_en,
  ctrl_sdiq_create1_dp_en,
  ctrl_sdiq_create1_gateclk_en,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_aiq0_rf_rdy_clr,
  dp_aiq_dis_inst0_src0_preg,
  dp_aiq_dis_inst0_src1_preg,
  dp_aiq_dis_inst0_src2_preg,
  dp_aiq_dis_inst1_src0_preg,
  dp_aiq_dis_inst1_src1_preg,
  dp_aiq_dis_inst1_src2_preg,
  dp_aiq_dis_inst2_src0_preg,
  dp_aiq_dis_inst2_src1_preg,
  dp_aiq_dis_inst2_src2_preg,
  dp_aiq_dis_inst3_src0_preg,
  dp_aiq_dis_inst3_src1_preg,
  dp_aiq_dis_inst3_src2_preg,
  dp_aiq_sdiq_create0_src_sel,
  dp_aiq_sdiq_create1_src_sel,
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  forever_cpuclk,
  iu_idu_div_busy,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_dupx,
  iu_idu_ex2_pipe0_wb_preg_vld_dupx,
  iu_idu_ex2_pipe1_mult_inst_vld_dupx,
  iu_idu_ex2_pipe1_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_dupx,
  iu_idu_ex2_pipe1_wb_preg_vld_dupx,
  lsiq_aiq_create0_entry,
  lsiq_aiq_create1_entry,
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
  sdiq_aiq_create0_entry,
  sdiq_aiq_create1_entry,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  x_agevec,
  x_alu0_reg_fwd_vld,
  x_alu1_reg_fwd_vld,
  x_create_agevec,
  x_create_data,
  x_create_dp_en,
  x_create_en,
  x_create_frz,
  x_create_gateclk_en,
  x_frz_clr,
  x_issue_en,
  x_pop_cur_entry,
  x_pop_other_entry,
  x_rdy,
  x_read_data,
  x_vld,
  x_vld_with_frz
);

// &Ports; @28
input   [7  :0]  aiq0_aiq_create0_entry;                 
input   [7  :0]  aiq0_aiq_create1_entry;                 
input   [7  :0]  aiq1_aiq_create0_entry;                 
input   [7  :0]  aiq1_aiq_create1_entry;                 
input   [11 :0]  biq_aiq_create0_entry;                  
input   [11 :0]  biq_aiq_create1_entry;                  
input            cp0_idu_icg_en;                         
input            cp0_yy_clk_en;                          
input            cpurst_b;                               
input            ctrl_aiq0_create0_dp_en;                
input            ctrl_aiq0_create0_gateclk_en;           
input            ctrl_aiq0_create1_dp_en;                
input            ctrl_aiq0_create1_gateclk_en;           
input            ctrl_aiq0_rf_pop_vld;                   
input            ctrl_aiq0_stall;                        
input            ctrl_aiq1_create0_dp_en;                
input            ctrl_aiq1_create0_gateclk_en;           
input            ctrl_aiq1_create1_dp_en;                
input            ctrl_aiq1_create1_gateclk_en;           
input            ctrl_biq_create0_dp_en;                 
input            ctrl_biq_create0_gateclk_en;            
input            ctrl_biq_create1_dp_en;                 
input            ctrl_biq_create1_gateclk_en;            
input   [1  :0]  ctrl_dp_is_dis_aiq0_create0_sel;        
input   [1  :0]  ctrl_dp_is_dis_aiq0_create1_sel;        
input   [1  :0]  ctrl_dp_is_dis_aiq1_create0_sel;        
input   [1  :0]  ctrl_dp_is_dis_aiq1_create1_sel;        
input   [1  :0]  ctrl_dp_is_dis_biq_create0_sel;         
input   [1  :0]  ctrl_dp_is_dis_biq_create1_sel;         
input   [1  :0]  ctrl_dp_is_dis_lsiq_create0_sel;        
input   [1  :0]  ctrl_dp_is_dis_lsiq_create1_sel;        
input   [1  :0]  ctrl_dp_is_dis_sdiq_create0_sel;        
input   [1  :0]  ctrl_dp_is_dis_sdiq_create1_sel;        
input            ctrl_lsiq_create0_dp_en;                
input            ctrl_lsiq_create0_gateclk_en;           
input            ctrl_lsiq_create1_dp_en;                
input            ctrl_lsiq_create1_gateclk_en;           
input            ctrl_sdiq_create0_dp_en;                
input            ctrl_sdiq_create0_gateclk_en;           
input            ctrl_sdiq_create1_dp_en;                
input            ctrl_sdiq_create1_gateclk_en;           
input            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [2  :0]  dp_aiq0_rf_rdy_clr;                     
input   [6  :0]  dp_aiq_dis_inst0_src0_preg;             
input   [6  :0]  dp_aiq_dis_inst0_src1_preg;             
input   [6  :0]  dp_aiq_dis_inst0_src2_preg;             
input   [6  :0]  dp_aiq_dis_inst1_src0_preg;             
input   [6  :0]  dp_aiq_dis_inst1_src1_preg;             
input   [6  :0]  dp_aiq_dis_inst1_src2_preg;             
input   [6  :0]  dp_aiq_dis_inst2_src0_preg;             
input   [6  :0]  dp_aiq_dis_inst2_src1_preg;             
input   [6  :0]  dp_aiq_dis_inst2_src2_preg;             
input   [6  :0]  dp_aiq_dis_inst3_src0_preg;             
input   [6  :0]  dp_aiq_dis_inst3_src1_preg;             
input   [6  :0]  dp_aiq_dis_inst3_src2_preg;             
input            dp_aiq_sdiq_create0_src_sel;            
input            dp_aiq_sdiq_create1_src_sel;            
input   [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input            forever_cpuclk;                         
input            iu_idu_div_busy;                        
input            iu_idu_div_inst_vld;                    
input   [6  :0]  iu_idu_div_preg_dupx;                   
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
input            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
input            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
input   [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
input            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
input   [11 :0]  lsiq_aiq_create0_entry;                 
input   [11 :0]  lsiq_aiq_create1_entry;                 
input            lsu_idu_ag_pipe3_load_inst_vld;         
input   [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input            pad_yy_icg_scan_en;                     
input            rtu_idu_flush_fe;                       
input            rtu_idu_flush_is;                       
input   [11 :0]  sdiq_aiq_create0_entry;                 
input   [11 :0]  sdiq_aiq_create1_entry;                 
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [2  :0]  x_alu0_reg_fwd_vld;                     
input   [2  :0]  x_alu1_reg_fwd_vld;                     
input   [6  :0]  x_create_agevec;                        
input   [226:0]  x_create_data;                          
input            x_create_dp_en;                         
input            x_create_en;                            
input            x_create_frz;                           
input            x_create_gateclk_en;                    
input            x_frz_clr;                              
input            x_issue_en;                             
input            x_pop_cur_entry;                        
input   [6  :0]  x_pop_other_entry;                      
output  [6  :0]  x_agevec;                               
output           x_rdy;                                  
output  [226:0]  x_read_data;                            
output           x_vld;                                  
output           x_vld_with_frz;                         

// &Regs; @29
reg     [6  :0]  agevec;                                 
reg              alu_short;                              
reg              div;                                    
reg     [6  :0]  dst_preg;                               
reg              dst_vld;                                
reg     [6  :0]  dst_vreg;                               
reg              dstv_vld;                               
reg     [4  :0]  expt_vec;                               
reg              expt_vld;                               
reg              frz;                                    
reg              high_hw_expt;                           
reg     [6  :0]  iid;                                    
reg              lch_preg;                               
reg     [2  :0]  lch_rdy_aiq0_create0_src_match;         
reg     [2  :0]  lch_rdy_aiq0_create1_src_match;         
reg     [2  :0]  lch_rdy_aiq1_create0_src_match;         
reg     [2  :0]  lch_rdy_aiq1_create1_src_match;         
reg     [1  :0]  lch_rdy_biq_create0_src_match;          
reg     [1  :0]  lch_rdy_biq_create1_src_match;          
reg     [1  :0]  lch_rdy_lsiq_create0_src_match;         
reg     [1  :0]  lch_rdy_lsiq_create1_src_match;         
reg              lch_rdy_sdiq_create0_src_match;         
reg              lch_rdy_sdiq_create1_src_match;         
reg              mtvr;                                   
reg     [31 :0]  opcode;                                 
reg              pcfifo;                                 
reg     [4  :0]  pid;                                    
reg              special;                                
reg              src0_vld;                               
reg              src1_vld;                               
reg              src2_vld;                               
reg     [7  :0]  vl;                                     
reg              vld;                                    
reg     [1  :0]  vlmul;                                  
reg     [2  :0]  vsew;                                   

// &Wires; @30
wire    [7  :0]  aiq0_aiq_create0_entry;                 
wire    [7  :0]  aiq0_aiq_create1_entry;                 
wire    [1  :0]  aiq0_entry0_create_entry;               
wire    [2  :0]  aiq0_entry0_create_lch_rdy;             
wire    [2  :0]  aiq0_entry0_read_lch_rdy;               
wire    [1  :0]  aiq0_entry1_create_entry;               
wire    [2  :0]  aiq0_entry1_create_lch_rdy;             
wire    [2  :0]  aiq0_entry1_read_lch_rdy;               
wire    [1  :0]  aiq0_entry2_create_entry;               
wire    [2  :0]  aiq0_entry2_create_lch_rdy;             
wire    [2  :0]  aiq0_entry2_read_lch_rdy;               
wire    [1  :0]  aiq0_entry3_create_entry;               
wire    [2  :0]  aiq0_entry3_create_lch_rdy;             
wire    [2  :0]  aiq0_entry3_read_lch_rdy;               
wire    [1  :0]  aiq0_entry4_create_entry;               
wire    [2  :0]  aiq0_entry4_create_lch_rdy;             
wire    [2  :0]  aiq0_entry4_read_lch_rdy;               
wire    [1  :0]  aiq0_entry5_create_entry;               
wire    [2  :0]  aiq0_entry5_create_lch_rdy;             
wire    [2  :0]  aiq0_entry5_read_lch_rdy;               
wire    [1  :0]  aiq0_entry6_create_entry;               
wire    [2  :0]  aiq0_entry6_create_lch_rdy;             
wire    [2  :0]  aiq0_entry6_read_lch_rdy;               
wire    [1  :0]  aiq0_entry7_create_entry;               
wire    [2  :0]  aiq0_entry7_create_lch_rdy;             
wire    [2  :0]  aiq0_entry7_read_lch_rdy;               
wire    [7  :0]  aiq1_aiq_create0_entry;                 
wire    [7  :0]  aiq1_aiq_create1_entry;                 
wire    [1  :0]  aiq1_entry0_create_entry;               
wire    [2  :0]  aiq1_entry0_create_lch_rdy;             
wire    [2  :0]  aiq1_entry0_read_lch_rdy;               
wire    [1  :0]  aiq1_entry1_create_entry;               
wire    [2  :0]  aiq1_entry1_create_lch_rdy;             
wire    [2  :0]  aiq1_entry1_read_lch_rdy;               
wire    [1  :0]  aiq1_entry2_create_entry;               
wire    [2  :0]  aiq1_entry2_create_lch_rdy;             
wire    [2  :0]  aiq1_entry2_read_lch_rdy;               
wire    [1  :0]  aiq1_entry3_create_entry;               
wire    [2  :0]  aiq1_entry3_create_lch_rdy;             
wire    [2  :0]  aiq1_entry3_read_lch_rdy;               
wire    [1  :0]  aiq1_entry4_create_entry;               
wire    [2  :0]  aiq1_entry4_create_lch_rdy;             
wire    [2  :0]  aiq1_entry4_read_lch_rdy;               
wire    [1  :0]  aiq1_entry5_create_entry;               
wire    [2  :0]  aiq1_entry5_create_lch_rdy;             
wire    [2  :0]  aiq1_entry5_read_lch_rdy;               
wire    [1  :0]  aiq1_entry6_create_entry;               
wire    [2  :0]  aiq1_entry6_create_lch_rdy;             
wire    [2  :0]  aiq1_entry6_read_lch_rdy;               
wire    [1  :0]  aiq1_entry7_create_entry;               
wire    [2  :0]  aiq1_entry7_create_lch_rdy;             
wire    [2  :0]  aiq1_entry7_read_lch_rdy;               
wire    [11 :0]  biq_aiq_create0_entry;                  
wire    [11 :0]  biq_aiq_create1_entry;                  
wire    [1  :0]  biq_entry0_create_entry;                
wire    [1  :0]  biq_entry0_create_lch_rdy;              
wire    [1  :0]  biq_entry0_read_lch_rdy;                
wire    [1  :0]  biq_entry10_create_entry;               
wire    [1  :0]  biq_entry10_create_lch_rdy;             
wire    [1  :0]  biq_entry10_read_lch_rdy;               
wire    [1  :0]  biq_entry11_create_entry;               
wire    [1  :0]  biq_entry11_create_lch_rdy;             
wire    [1  :0]  biq_entry11_read_lch_rdy;               
wire    [1  :0]  biq_entry1_create_entry;                
wire    [1  :0]  biq_entry1_create_lch_rdy;              
wire    [1  :0]  biq_entry1_read_lch_rdy;                
wire    [1  :0]  biq_entry2_create_entry;                
wire    [1  :0]  biq_entry2_create_lch_rdy;              
wire    [1  :0]  biq_entry2_read_lch_rdy;                
wire    [1  :0]  biq_entry3_create_entry;                
wire    [1  :0]  biq_entry3_create_lch_rdy;              
wire    [1  :0]  biq_entry3_read_lch_rdy;                
wire    [1  :0]  biq_entry4_create_entry;                
wire    [1  :0]  biq_entry4_create_lch_rdy;              
wire    [1  :0]  biq_entry4_read_lch_rdy;                
wire    [1  :0]  biq_entry5_create_entry;                
wire    [1  :0]  biq_entry5_create_lch_rdy;              
wire    [1  :0]  biq_entry5_read_lch_rdy;                
wire    [1  :0]  biq_entry6_create_entry;                
wire    [1  :0]  biq_entry6_create_lch_rdy;              
wire    [1  :0]  biq_entry6_read_lch_rdy;                
wire    [1  :0]  biq_entry7_create_entry;                
wire    [1  :0]  biq_entry7_create_lch_rdy;              
wire    [1  :0]  biq_entry7_read_lch_rdy;                
wire    [1  :0]  biq_entry8_create_entry;                
wire    [1  :0]  biq_entry8_create_lch_rdy;              
wire    [1  :0]  biq_entry8_read_lch_rdy;                
wire    [1  :0]  biq_entry9_create_entry;                
wire    [1  :0]  biq_entry9_create_lch_rdy;              
wire    [1  :0]  biq_entry9_read_lch_rdy;                
wire             cp0_idu_icg_en;                         
wire             cp0_yy_clk_en;                          
wire             cpurst_b;                               
wire             create_clk;                             
wire             create_clk_en;                          
wire             create_other_clk;                       
wire             create_other_clk_en;                    
wire             create_pcfifo_clk;                      
wire             create_pcfifo_clk_en;                   
wire             create_preg_clk;                        
wire             create_preg_clk_en;                     
wire    [9  :0]  create_src0_data;                       
wire             create_src0_gateclk_en;                 
wire    [9  :0]  create_src1_data;                       
wire             create_src1_gateclk_en;                 
wire    [9  :0]  create_src2_data;                       
wire             create_src2_gateclk_en;                 
wire             create_vreg_clk;                        
wire             create_vreg_clk_en;                     
wire             ctrl_aiq0_create0_dp_en;                
wire             ctrl_aiq0_create0_gateclk_en;           
wire             ctrl_aiq0_create1_dp_en;                
wire             ctrl_aiq0_create1_gateclk_en;           
wire             ctrl_aiq0_rf_pop_vld;                   
wire             ctrl_aiq0_stall;                        
wire             ctrl_aiq1_create0_dp_en;                
wire             ctrl_aiq1_create0_gateclk_en;           
wire             ctrl_aiq1_create1_dp_en;                
wire             ctrl_aiq1_create1_gateclk_en;           
wire             ctrl_biq_create0_dp_en;                 
wire             ctrl_biq_create0_gateclk_en;            
wire             ctrl_biq_create1_dp_en;                 
wire             ctrl_biq_create1_gateclk_en;            
wire    [1  :0]  ctrl_dp_is_dis_aiq0_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_aiq0_create1_sel;        
wire    [1  :0]  ctrl_dp_is_dis_aiq1_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_aiq1_create1_sel;        
wire    [1  :0]  ctrl_dp_is_dis_biq_create0_sel;         
wire    [1  :0]  ctrl_dp_is_dis_biq_create1_sel;         
wire    [1  :0]  ctrl_dp_is_dis_lsiq_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_lsiq_create1_sel;        
wire    [1  :0]  ctrl_dp_is_dis_sdiq_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_sdiq_create1_sel;        
wire             ctrl_lsiq_create0_dp_en;                
wire             ctrl_lsiq_create0_gateclk_en;           
wire             ctrl_lsiq_create1_dp_en;                
wire             ctrl_lsiq_create1_gateclk_en;           
wire             ctrl_sdiq_create0_dp_en;                
wire             ctrl_sdiq_create0_gateclk_en;           
wire             ctrl_sdiq_create1_dp_en;                
wire             ctrl_sdiq_create1_gateclk_en;           
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [2  :0]  dis_inst0_src_match;                    
wire    [2  :0]  dis_inst1_src_match;                    
wire    [2  :0]  dis_inst2_src_match;                    
wire    [2  :0]  dis_inst3_src_match;                    
wire    [2  :0]  dp_aiq0_rf_rdy_clr;                     
wire    [6  :0]  dp_aiq_dis_inst0_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst0_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst0_src2_preg;             
wire    [6  :0]  dp_aiq_dis_inst1_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst1_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst1_src2_preg;             
wire    [6  :0]  dp_aiq_dis_inst2_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst2_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst2_src2_preg;             
wire    [6  :0]  dp_aiq_dis_inst3_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst3_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst3_src2_preg;             
wire             dp_aiq_sdiq_create0_src_sel;            
wire             dp_aiq_sdiq_create1_src_sel;            
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire             entry_clk;                              
wire             entry_clk_en;                           
wire             forever_cpuclk;                         
wire             gateclk_entry_vld;                      
wire             iu_idu_div_busy;                        
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dupx;                   
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire             iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire             iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire             iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire             lch_rdy_aiq0_clk;                       
wire             lch_rdy_aiq0_clk_en;                    
wire             lch_rdy_aiq0_create0_dp_en;             
wire             lch_rdy_aiq0_create1_dp_en;             
wire             lch_rdy_aiq1_clk;                       
wire             lch_rdy_aiq1_clk_en;                    
wire             lch_rdy_aiq1_create0_dp_en;             
wire             lch_rdy_aiq1_create1_dp_en;             
wire             lch_rdy_biq_clk;                        
wire             lch_rdy_biq_clk_en;                     
wire             lch_rdy_biq_create0_dp_en;              
wire             lch_rdy_biq_create1_dp_en;              
wire             lch_rdy_lsiq_clk;                       
wire             lch_rdy_lsiq_clk_en;                    
wire             lch_rdy_lsiq_create0_dp_en;             
wire             lch_rdy_lsiq_create1_dp_en;             
wire             lch_rdy_sdiq_clk;                       
wire             lch_rdy_sdiq_clk_en;                    
wire             lch_rdy_sdiq_create0_dp_en;             
wire             lch_rdy_sdiq_create1_dp_en;             
wire    [11 :0]  lsiq_aiq_create0_entry;                 
wire    [11 :0]  lsiq_aiq_create1_entry;                 
wire    [1  :0]  lsiq_entry0_create_entry;               
wire    [1  :0]  lsiq_entry0_create_lch_rdy;             
wire    [1  :0]  lsiq_entry0_read_lch_rdy;               
wire    [1  :0]  lsiq_entry10_create_entry;              
wire    [1  :0]  lsiq_entry10_create_lch_rdy;            
wire    [1  :0]  lsiq_entry10_read_lch_rdy;              
wire    [1  :0]  lsiq_entry11_create_entry;              
wire    [1  :0]  lsiq_entry11_create_lch_rdy;            
wire    [1  :0]  lsiq_entry11_read_lch_rdy;              
wire    [1  :0]  lsiq_entry1_create_entry;               
wire    [1  :0]  lsiq_entry1_create_lch_rdy;             
wire    [1  :0]  lsiq_entry1_read_lch_rdy;               
wire    [1  :0]  lsiq_entry2_create_entry;               
wire    [1  :0]  lsiq_entry2_create_lch_rdy;             
wire    [1  :0]  lsiq_entry2_read_lch_rdy;               
wire    [1  :0]  lsiq_entry3_create_entry;               
wire    [1  :0]  lsiq_entry3_create_lch_rdy;             
wire    [1  :0]  lsiq_entry3_read_lch_rdy;               
wire    [1  :0]  lsiq_entry4_create_entry;               
wire    [1  :0]  lsiq_entry4_create_lch_rdy;             
wire    [1  :0]  lsiq_entry4_read_lch_rdy;               
wire    [1  :0]  lsiq_entry5_create_entry;               
wire    [1  :0]  lsiq_entry5_create_lch_rdy;             
wire    [1  :0]  lsiq_entry5_read_lch_rdy;               
wire    [1  :0]  lsiq_entry6_create_entry;               
wire    [1  :0]  lsiq_entry6_create_lch_rdy;             
wire    [1  :0]  lsiq_entry6_read_lch_rdy;               
wire    [1  :0]  lsiq_entry7_create_entry;               
wire    [1  :0]  lsiq_entry7_create_lch_rdy;             
wire    [1  :0]  lsiq_entry7_read_lch_rdy;               
wire    [1  :0]  lsiq_entry8_create_entry;               
wire    [1  :0]  lsiq_entry8_create_lch_rdy;             
wire    [1  :0]  lsiq_entry8_read_lch_rdy;               
wire    [1  :0]  lsiq_entry9_create_entry;               
wire    [1  :0]  lsiq_entry9_create_lch_rdy;             
wire    [1  :0]  lsiq_entry9_read_lch_rdy;               
wire             lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire             lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire             lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire             pad_yy_icg_scan_en;                     
wire    [11 :0]  read_src0_data;                         
wire    [11 :0]  read_src1_data;                         
wire    [11 :0]  read_src2_data;                         
wire             rtu_idu_flush_fe;                       
wire             rtu_idu_flush_is;                       
wire    [11 :0]  sdiq_aiq_create0_entry;                 
wire    [11 :0]  sdiq_aiq_create1_entry;                 
wire    [1  :0]  sdiq_entry0_create_entry;               
wire             sdiq_entry0_create_lch_rdy;             
wire             sdiq_entry0_read_lch_rdy;               
wire    [1  :0]  sdiq_entry10_create_entry;              
wire             sdiq_entry10_create_lch_rdy;            
wire             sdiq_entry10_read_lch_rdy;              
wire    [1  :0]  sdiq_entry11_create_entry;              
wire             sdiq_entry11_create_lch_rdy;            
wire             sdiq_entry11_read_lch_rdy;              
wire    [1  :0]  sdiq_entry1_create_entry;               
wire             sdiq_entry1_create_lch_rdy;             
wire             sdiq_entry1_read_lch_rdy;               
wire    [1  :0]  sdiq_entry2_create_entry;               
wire             sdiq_entry2_create_lch_rdy;             
wire             sdiq_entry2_read_lch_rdy;               
wire    [1  :0]  sdiq_entry3_create_entry;               
wire             sdiq_entry3_create_lch_rdy;             
wire             sdiq_entry3_read_lch_rdy;               
wire    [1  :0]  sdiq_entry4_create_entry;               
wire             sdiq_entry4_create_lch_rdy;             
wire             sdiq_entry4_read_lch_rdy;               
wire    [1  :0]  sdiq_entry5_create_entry;               
wire             sdiq_entry5_create_lch_rdy;             
wire             sdiq_entry5_read_lch_rdy;               
wire    [1  :0]  sdiq_entry6_create_entry;               
wire             sdiq_entry6_create_lch_rdy;             
wire             sdiq_entry6_read_lch_rdy;               
wire    [1  :0]  sdiq_entry7_create_entry;               
wire             sdiq_entry7_create_lch_rdy;             
wire             sdiq_entry7_read_lch_rdy;               
wire    [1  :0]  sdiq_entry8_create_entry;               
wire             sdiq_entry8_create_lch_rdy;             
wire             sdiq_entry8_read_lch_rdy;               
wire    [1  :0]  sdiq_entry9_create_entry;               
wire             sdiq_entry9_create_lch_rdy;             
wire             sdiq_entry9_read_lch_rdy;               
wire             src0_rdy_clr;                           
wire             src0_rdy_for_issue;                     
wire             src1_rdy_clr;                           
wire             src1_rdy_for_issue;                     
wire             src2_rdy_clr;                           
wire             src2_rdy_for_issue;                     
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire    [6  :0]  x_agevec;                               
wire    [2  :0]  x_alu0_reg_fwd_vld;                     
wire    [2  :0]  x_alu1_reg_fwd_vld;                     
wire    [6  :0]  x_create_agevec;                        
wire    [226:0]  x_create_data;                          
wire             x_create_dp_en;                         
wire             x_create_en;                            
wire             x_create_frz;                           
wire             x_create_gateclk_en;                    
wire             x_frz_clr;                              
wire             x_issue_en;                             
wire             x_pop_cur_entry;                        
wire    [6  :0]  x_pop_other_entry;                      
wire             x_rdy;                                  
wire    [226:0]  x_read_data;                            
wire             x_vld;                                  
wire             x_vld_with_frz;                         



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                    AIQ0 Parameters
//----------------------------------------------------------
parameter AIQ0_WIDTH             = 227;

parameter AIQ0_VL                = 226;
parameter AIQ0_LCH_PREG          = 218; 
parameter AIQ0_SPECIAL           = 217; 
parameter AIQ0_VSEW              = 216; 
parameter AIQ0_VLMUL             = 213; 
parameter AIQ0_LCH_RDY_SDIQ      = 211; 
parameter AIQ0_LCH_RDY_LSIQ      = 199; 
parameter AIQ0_LCH_RDY_BIQ       = 175; 
parameter AIQ0_LCH_RDY_AIQ1      = 151; 
parameter AIQ0_LCH_RDY_AIQ0      = 127; 
parameter AIQ0_ALU_SHORT         = 103; 
parameter AIQ0_PID               = 102; 
parameter AIQ0_PCFIFO            = 97;
parameter AIQ0_MTVR              = 96;
parameter AIQ0_DIV               = 95;
parameter AIQ0_HIGH_HW_EXPT      = 94;
parameter AIQ0_EXPT_VEC          = 93;
parameter AIQ0_EXPT_VLD          = 88;
parameter AIQ0_SRC2_LSU_MATCH    = 87;
parameter AIQ0_SRC2_DATA         = 86;
parameter AIQ0_SRC2_PREG         = 86;
parameter AIQ0_SRC2_WB           = 79;
parameter AIQ0_SRC2_RDY          = 78;
parameter AIQ0_SRC1_LSU_MATCH    = 77;
parameter AIQ0_SRC1_DATA         = 76;
parameter AIQ0_SRC1_PREG         = 76;
parameter AIQ0_SRC1_WB           = 69;
parameter AIQ0_SRC1_RDY          = 68;
parameter AIQ0_SRC0_LSU_MATCH    = 67;
parameter AIQ0_SRC0_DATA         = 66;
parameter AIQ0_SRC0_PREG         = 66;
parameter AIQ0_SRC0_WB           = 59;
parameter AIQ0_SRC0_RDY          = 58;
parameter AIQ0_DST_VREG          = 57;
parameter AIQ0_DST_PREG          = 50;
parameter AIQ0_DSTV_VLD          = 43;
parameter AIQ0_DST_VLD           = 42;
parameter AIQ0_SRC2_VLD          = 41;
parameter AIQ0_SRC1_VLD          = 40;
parameter AIQ0_SRC0_VLD          = 39;
parameter AIQ0_IID               = 38;
parameter AIQ0_OPCODE            = 31;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = x_create_gateclk_en || vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @88
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @89
//          .external_en (1'b0), @90
//          .global_en   (cp0_yy_clk_en), @91
//          .module_en   (cp0_idu_icg_en), @92
//          .local_en    (entry_clk_en), @93
//          .clk_out     (entry_clk)); @94

assign create_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_gated_clk"); @97
gated_clk_cell  x_create_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @98
//          .external_en (1'b0), @99
//          .global_en   (cp0_yy_clk_en), @100
//          .module_en   (cp0_idu_icg_en), @101
//          .local_en    (create_clk_en), @102
//          .clk_out     (create_clk)); @103

assign create_pcfifo_clk_en = x_create_gateclk_en && x_create_data[AIQ0_PCFIFO];
// &Instance("gated_clk_cell", "x_create_pcfifo_gated_clk"); @106
gated_clk_cell  x_create_pcfifo_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (create_pcfifo_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (create_pcfifo_clk_en),
  .module_en            (cp0_idu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in      (forever_cpuclk), @107
//          .external_en (1'b0), @108
//          .global_en   (cp0_yy_clk_en), @109
//          .module_en   (cp0_idu_icg_en), @110
//          .local_en    (create_pcfifo_clk_en), @111
//          .clk_out     (create_pcfifo_clk)); @112

assign create_preg_clk_en = x_create_gateclk_en && x_create_data[AIQ0_DST_VLD];
// &Instance("gated_clk_cell", "x_create_preg_gated_clk"); @115
gated_clk_cell  x_create_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_preg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_preg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @116
//          .external_en (1'b0), @117
//          .global_en   (cp0_yy_clk_en), @118
//          .module_en   (cp0_idu_icg_en), @119
//          .local_en    (create_preg_clk_en), @120
//          .clk_out     (create_preg_clk)); @121

assign create_vreg_clk_en = x_create_gateclk_en && x_create_data[AIQ0_DSTV_VLD];
// &Instance("gated_clk_cell", "x_create_vreg_gated_clk"); @124
gated_clk_cell  x_create_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_vreg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_vreg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @125
//          .external_en (1'b0), @126
//          .global_en   (cp0_yy_clk_en), @127
//          .module_en   (cp0_idu_icg_en), @128
//          .local_en    (create_vreg_clk_en), @129
//          .clk_out     (create_vreg_clk)); @130

assign create_other_clk_en = x_create_gateclk_en
                             && x_create_data[AIQ0_EXPT_VLD];
// &Instance("gated_clk_cell", "x_create_other_gated_clk"); @134
gated_clk_cell  x_create_other_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (create_other_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (create_other_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @135
//          .external_en (1'b0), @136
//          .global_en   (cp0_yy_clk_en), @137
//          .module_en   (cp0_idu_icg_en), @138
//          .local_en    (create_other_clk_en), @139
//          .clk_out     (create_other_clk)); @140

assign lch_rdy_aiq0_clk_en = x_create_gateclk_en
                             || vld && (ctrl_aiq0_create0_gateclk_en
                                     || ctrl_aiq0_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_aiq0_gated_clk"); @145
gated_clk_cell  x_lch_rdy_aiq0_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_aiq0_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_aiq0_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @146
//          .external_en (1'b0), @147
//          .global_en   (cp0_yy_clk_en), @148
//          .module_en   (cp0_idu_icg_en), @149
//          .local_en    (lch_rdy_aiq0_clk_en), @150
//          .clk_out     (lch_rdy_aiq0_clk)); @151

assign lch_rdy_aiq1_clk_en = x_create_gateclk_en
                             || vld && (ctrl_aiq1_create0_gateclk_en
                                     || ctrl_aiq1_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_aiq1_gated_clk"); @156
gated_clk_cell  x_lch_rdy_aiq1_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_aiq1_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_aiq1_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @157
//          .external_en (1'b0), @158
//          .global_en   (cp0_yy_clk_en), @159
//          .module_en   (cp0_idu_icg_en), @160
//          .local_en    (lch_rdy_aiq1_clk_en), @161
//          .clk_out     (lch_rdy_aiq1_clk)); @162

assign lch_rdy_biq_clk_en = x_create_gateclk_en
                            || vld && (ctrl_biq_create0_gateclk_en
                                    || ctrl_biq_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_biq_gated_clk"); @167
gated_clk_cell  x_lch_rdy_biq_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lch_rdy_biq_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lch_rdy_biq_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @168
//          .external_en (1'b0), @169
//          .global_en   (cp0_yy_clk_en), @170
//          .module_en   (cp0_idu_icg_en), @171
//          .local_en    (lch_rdy_biq_clk_en), @172
//          .clk_out     (lch_rdy_biq_clk)); @173

assign lch_rdy_lsiq_clk_en = x_create_gateclk_en
                             || vld && (ctrl_lsiq_create0_gateclk_en
                                     || ctrl_lsiq_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_lsiq_gated_clk"); @178
gated_clk_cell  x_lch_rdy_lsiq_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_lsiq_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_lsiq_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @179
//          .external_en (1'b0), @180
//          .global_en   (cp0_yy_clk_en), @181
//          .module_en   (cp0_idu_icg_en), @182
//          .local_en    (lch_rdy_lsiq_clk_en), @183
//          .clk_out     (lch_rdy_lsiq_clk)); @184

assign lch_rdy_sdiq_clk_en = x_create_gateclk_en
                             || vld && (ctrl_sdiq_create0_gateclk_en
                                     || ctrl_sdiq_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_sdiq_gated_clk"); @189
gated_clk_cell  x_lch_rdy_sdiq_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_sdiq_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_sdiq_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @190
//          .external_en (1'b0), @191
//          .global_en   (cp0_yy_clk_en), @192
//          .module_en   (cp0_idu_icg_en), @193
//          .local_en    (lch_rdy_sdiq_clk_en), @194
//          .clk_out     (lch_rdy_sdiq_clk)); @195

//if entry is not valid, shut down dep info clock
assign gateclk_entry_vld = vld;

//==========================================================
//                  Create and Read Bus
//==========================================================
//force create and read bus width
// &Force("bus","x_create_data",AIQ0_WIDTH-1,0); @204
// &Force("bus","x_read_data",AIQ0_WIDTH-1,0); @205
// &Force("output","x_read_data"); @206

//==========================================================
//                      Entry Valid
//==========================================================
assign x_vld = vld;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    vld <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    vld <= 1'b0;
  else if(x_create_en)
    vld <= 1'b1;
  else if(ctrl_aiq0_rf_pop_vld && x_pop_cur_entry)
    vld <= 1'b0;
  else
    vld <= vld;
end

//==========================================================
//                        Freeze
//==========================================================
assign x_vld_with_frz = vld && !frz;
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    frz <= 1'b0;
  else if(x_create_en)
    frz <= x_create_frz;
  else if(x_issue_en)
    frz <= 1'b1;
  else if(x_frz_clr)
    frz <= 1'b0;
  else
    frz <= frz;
end

//==========================================================
//                       Age Vector
//==========================================================
assign x_agevec[6:0] = agevec[6:0];
always @(posedge entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    agevec[6:0] <= 7'b0;
  else if(x_create_en)
    agevec[6:0] <= x_create_agevec[6:0];
  else if(ctrl_aiq0_rf_pop_vld)
    agevec[6:0] <= agevec[6:0] & ~x_pop_other_entry[6:0];
  else
    agevec[6:0] <= agevec[6:0];
end

//==========================================================
//                 Instruction Information
//==========================================================
always @(posedge create_preg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_preg[6:0]      <= 7'b0;
  else if(x_create_dp_en)
    dst_preg[6:0]      <= x_create_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
  else
    dst_preg[6:0]      <= dst_preg[6:0];
end

always @(posedge create_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_vreg[6:0]      <= 7'b0;
  else if(x_create_dp_en)
    dst_vreg[6:0]      <= x_create_data[AIQ0_DST_VREG:AIQ0_DST_VREG-6];
  else
    dst_vreg[6:0]      <= dst_vreg[6:0];
end

always @(posedge create_pcfifo_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pid[4:0]           <= 5'b0;
  else if(x_create_dp_en)
    pid[4:0]           <= x_create_data[AIQ0_PID:AIQ0_PID-4];
  else
    pid[4:0]           <= pid[4:0];
end

always @(posedge create_other_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    expt_vec[4:0]      <= 5'b0;
    high_hw_expt       <= 1'b0;
  end
  else if(x_create_dp_en) begin
    expt_vec[4:0]      <= x_create_data[AIQ0_EXPT_VEC:AIQ0_EXPT_VEC-4];
    high_hw_expt       <= x_create_data[AIQ0_HIGH_HW_EXPT];
  end
  else begin
    expt_vec[4:0]      <= expt_vec[4:0];
    high_hw_expt       <= high_hw_expt;
  end
end

always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    opcode[31:0]       <= 32'b0;
    iid[6:0]           <= 7'b0;
    expt_vld           <= 1'b0;
    src0_vld           <= 1'b0;
    src1_vld           <= 1'b0;
    src2_vld           <= 1'b0;
    dst_vld            <= 1'b0;
    dstv_vld           <= 1'b0;
    div                <= 1'b0;
    mtvr               <= 1'b0;
    pcfifo             <= 1'b0;
    alu_short          <= 1'b0;
    vlmul[1:0]         <= 2'b0;
    vsew[2:0]          <= 3'b0;
    vl[7:0]            <= 8'b0;
    special            <= 1'b0;
    lch_preg           <= 1'b0;
  end
  else if(x_create_dp_en) begin
    opcode[31:0]       <= x_create_data[AIQ0_OPCODE:AIQ0_OPCODE-31];
    iid[6:0]           <= x_create_data[AIQ0_IID:AIQ0_IID-6];
    expt_vld           <= x_create_data[AIQ0_EXPT_VLD];
    src0_vld           <= x_create_data[AIQ0_SRC0_VLD];
    src1_vld           <= x_create_data[AIQ0_SRC1_VLD];
    src2_vld           <= x_create_data[AIQ0_SRC2_VLD];
    dst_vld            <= x_create_data[AIQ0_DST_VLD];
    dstv_vld           <= x_create_data[AIQ0_DSTV_VLD];
    div                <= x_create_data[AIQ0_DIV];
    mtvr               <= x_create_data[AIQ0_MTVR];
    pcfifo             <= x_create_data[AIQ0_PCFIFO];
    alu_short          <= x_create_data[AIQ0_ALU_SHORT];
    vlmul[1:0]         <= x_create_data[AIQ0_VLMUL:AIQ0_VLMUL-1];
    vsew[2:0]          <= x_create_data[AIQ0_VSEW:AIQ0_VSEW-2];
    vl[7:0]            <= x_create_data[AIQ0_VL:AIQ0_VL-7];
    special            <= x_create_data[AIQ0_SPECIAL];
    lch_preg           <= x_create_data[AIQ0_LCH_PREG];
  end
  else begin
    opcode[31:0]       <= opcode[31:0];
    iid[6:0]           <= iid[6:0];
    expt_vld           <= expt_vld;
    src0_vld           <= src0_vld;
    src1_vld           <= src1_vld;
    src2_vld           <= src2_vld;
    dst_vld            <= dst_vld;
    dstv_vld           <= dstv_vld;
    div                <= div;
    mtvr               <= mtvr;
    pcfifo             <= pcfifo;
    alu_short          <= alu_short;
    vlmul[1:0]         <= vlmul[1:0];
    vsew[2:0]          <= vsew[2:0];
    vl[7:0]            <= vl[7:0];
    special            <= special;
    lch_preg           <= lch_preg;
  end
end

//rename for read output
assign x_read_data[AIQ0_OPCODE:AIQ0_OPCODE-31]    = opcode[31:0];
assign x_read_data[AIQ0_IID:AIQ0_IID-6]           = iid[6:0];
assign x_read_data[AIQ0_EXPT_VLD]                 = expt_vld;
assign x_read_data[AIQ0_EXPT_VEC:AIQ0_EXPT_VEC-4] = expt_vec[4:0];
assign x_read_data[AIQ0_HIGH_HW_EXPT]             = high_hw_expt;
assign x_read_data[AIQ0_SRC0_VLD]                 = src0_vld;
assign x_read_data[AIQ0_SRC1_VLD]                 = src1_vld;
assign x_read_data[AIQ0_SRC2_VLD]                 = src2_vld;
assign x_read_data[AIQ0_DST_VLD]                  = dst_vld;
assign x_read_data[AIQ0_DSTV_VLD]                 = dstv_vld;
assign x_read_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6] = dst_preg[6:0];
assign x_read_data[AIQ0_DST_VREG:AIQ0_DST_VREG-6] = dst_vreg[6:0];
assign x_read_data[AIQ0_DIV]                      = div;
assign x_read_data[AIQ0_MTVR]                     = mtvr;
assign x_read_data[AIQ0_PCFIFO]                   = pcfifo;
assign x_read_data[AIQ0_PID:AIQ0_PID-4]           = pid[4:0];
assign x_read_data[AIQ0_ALU_SHORT]                = alu_short;
assign x_read_data[AIQ0_VLMUL:AIQ0_VLMUL-1]       = vlmul[1:0];
assign x_read_data[AIQ0_VSEW:AIQ0_VSEW-2]         = vsew[2:0];
assign x_read_data[AIQ0_VL:AIQ0_VL-7]             = vl[7:0];
assign x_read_data[AIQ0_SPECIAL]                  = special;
assign x_read_data[AIQ0_LCH_PREG]                 = lch_preg;

//==========================================================
//              Source Dependency Information
//==========================================================
assign src0_rdy_clr = x_frz_clr && dp_aiq0_rf_rdy_clr[0];
assign src1_rdy_clr = x_frz_clr && dp_aiq0_rf_rdy_clr[1];
assign src2_rdy_clr = x_frz_clr && dp_aiq0_rf_rdy_clr[2];

//------------------------source 0--------------------------
assign create_src0_gateclk_en = x_create_gateclk_en && x_create_data[AIQ0_SRC0_VLD];
assign create_src0_data[9]    = x_create_data[AIQ0_SRC0_LSU_MATCH];
assign create_src0_data[8:0]  = x_create_data[AIQ0_SRC0_DATA:AIQ0_SRC0_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_aiq0_src0_entry"); @405
ct_idu_dep_reg_entry  x_ct_idu_is_aiq0_src0_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld[0]                  ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld[0]                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src0_data[9:0]                  ),
  .x_gateclk_idx_write_en                  (create_src0_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src0_rdy_clr                           ),
  .x_read_data                             (read_src0_data[11:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @406
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[0]), @407
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[0]), @408
//          .x_write_en               (x_create_dp_en), @409
//          .x_gateclk_write_en       (x_create_gateclk_en), @410
//          .x_gateclk_idx_write_en   (create_src0_gateclk_en), @411
//          .x_create_data            (create_src0_data[9:0]), @412
//          .x_read_data              (read_src0_data[11:0]), @413
//          .x_rdy_clr                (src0_rdy_clr) @414
//         ); @415
assign x_read_data[AIQ0_SRC0_WB]                    = read_src0_data[1];
assign x_read_data[AIQ0_SRC0_PREG:AIQ0_SRC0_PREG-6] = read_src0_data[8:2];
assign src0_rdy_for_issue                           = read_src0_data[9];
assign x_read_data[AIQ0_SRC0_RDY]                   = 1'b0;
assign x_read_data[AIQ0_SRC0_LSU_MATCH]             = 1'b0;

//------------------------source 1--------------------------
assign create_src1_gateclk_en = x_create_gateclk_en && x_create_data[AIQ0_SRC1_VLD];
assign create_src1_data[9]    = x_create_data[AIQ0_SRC1_LSU_MATCH];
assign create_src1_data[8:0]  = x_create_data[AIQ0_SRC1_DATA:AIQ0_SRC1_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_aiq0_src1_entry"); @426
ct_idu_dep_reg_entry  x_ct_idu_is_aiq0_src1_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld[1]                  ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld[1]                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src1_data[9:0]                  ),
  .x_gateclk_idx_write_en                  (create_src1_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src1_rdy_clr                           ),
  .x_read_data                             (read_src1_data[11:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @427
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[1]), @428
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[1]), @429
//          .x_write_en               (x_create_dp_en), @430
//          .x_gateclk_write_en       (x_create_gateclk_en), @431
//          .x_gateclk_idx_write_en   (create_src1_gateclk_en), @432
//          .x_create_data            (create_src1_data[9:0]), @433
//          .x_read_data              (read_src1_data[11:0]), @434
//          .x_rdy_clr                (src1_rdy_clr) @435
//         ); @436
assign x_read_data[AIQ0_SRC1_WB]                    = read_src1_data[1];
assign x_read_data[AIQ0_SRC1_PREG:AIQ0_SRC1_PREG-6] = read_src1_data[8:2];
assign src1_rdy_for_issue                           = read_src1_data[9];
assign x_read_data[AIQ0_SRC1_RDY]                   = 1'b0;
assign x_read_data[AIQ0_SRC1_LSU_MATCH]             = 1'b0;

//------------------------source 2--------------------------
assign create_src2_gateclk_en = x_create_gateclk_en && x_create_data[AIQ0_SRC2_VLD];
assign create_src2_data[9]    = x_create_data[AIQ0_SRC2_LSU_MATCH];
assign create_src2_data[8:0]  = x_create_data[AIQ0_SRC2_DATA:AIQ0_SRC2_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_aiq0_src2_entry"); @447
ct_idu_dep_reg_entry  x_ct_idu_is_aiq0_src2_entry (
  .alu0_reg_fwd_vld                        (x_alu0_reg_fwd_vld[2]                  ),
  .alu1_reg_fwd_vld                        (x_alu1_reg_fwd_vld[2]                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .gateclk_entry_vld                       (gateclk_entry_vld                      ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src2_data[9:0]                  ),
  .x_gateclk_idx_write_en                  (create_src2_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src2_rdy_clr                           ),
  .x_read_data                             (read_src2_data[11:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @448
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[2]), @449
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[2]), @450
//          .x_write_en               (x_create_dp_en), @451
//          .x_gateclk_write_en       (x_create_gateclk_en), @452
//          .x_gateclk_idx_write_en   (create_src2_gateclk_en), @453
//          .x_create_data            (create_src2_data[9:0]), @454
//          .x_read_data              (read_src2_data[11:0]), @455
//          .x_rdy_clr                (src2_rdy_clr) @456
//         ); @457
assign x_read_data[AIQ0_SRC2_WB]                    = read_src2_data[1];
assign x_read_data[AIQ0_SRC2_PREG:AIQ0_SRC2_PREG-6] = read_src2_data[8:2];
assign src2_rdy_for_issue                           = read_src2_data[9];
assign x_read_data[AIQ0_SRC2_RDY]                   = 1'b0;
assign x_read_data[AIQ0_SRC2_LSU_MATCH]             = 1'b0;

//==========================================================
//           Bypass Ready indicators for RF launch
//==========================================================
//----------------------------------------------------------
//            Dispatch instruction source match
//----------------------------------------------------------
assign dis_inst0_src_match[0] = (dst_preg[6:0] == dp_aiq_dis_inst0_src0_preg[6:0]);
assign dis_inst0_src_match[1] = (dst_preg[6:0] == dp_aiq_dis_inst0_src1_preg[6:0]);
assign dis_inst0_src_match[2] = (dst_preg[6:0] == dp_aiq_dis_inst0_src2_preg[6:0]);
assign dis_inst1_src_match[0] = (dst_preg[6:0] == dp_aiq_dis_inst1_src0_preg[6:0]);
assign dis_inst1_src_match[1] = (dst_preg[6:0] == dp_aiq_dis_inst1_src1_preg[6:0]);
assign dis_inst1_src_match[2] = (dst_preg[6:0] == dp_aiq_dis_inst1_src2_preg[6:0]);
assign dis_inst2_src_match[0] = (dst_preg[6:0] == dp_aiq_dis_inst2_src0_preg[6:0]);
assign dis_inst2_src_match[1] = (dst_preg[6:0] == dp_aiq_dis_inst2_src1_preg[6:0]);
assign dis_inst2_src_match[2] = (dst_preg[6:0] == dp_aiq_dis_inst2_src2_preg[6:0]);
assign dis_inst3_src_match[0] = (dst_preg[6:0] == dp_aiq_dis_inst3_src0_preg[6:0]);
assign dis_inst3_src_match[1] = (dst_preg[6:0] == dp_aiq_dis_inst3_src1_preg[6:0]);
assign dis_inst3_src_match[2] = (dst_preg[6:0] == dp_aiq_dis_inst3_src2_preg[6:0]);

//----------------------------------------------------------
//                   AIQ0 create update
//----------------------------------------------------------
// &CombBeg; @486
always @( ctrl_dp_is_dis_aiq0_create0_sel[1:0]
       or dis_inst1_src_match[2:0]
       or dis_inst2_src_match[2:0]
       or dis_inst3_src_match[2:0]
       or dis_inst0_src_match[2:0])
begin
  case(ctrl_dp_is_dis_aiq0_create0_sel[1:0])
    2'd0:   lch_rdy_aiq0_create0_src_match[2:0] = dis_inst0_src_match[2:0];
    2'd1:   lch_rdy_aiq0_create0_src_match[2:0] = dis_inst1_src_match[2:0];
    2'd2:   lch_rdy_aiq0_create0_src_match[2:0] = dis_inst2_src_match[2:0];
    2'd3:   lch_rdy_aiq0_create0_src_match[2:0] = dis_inst3_src_match[2:0];
    default:lch_rdy_aiq0_create0_src_match[2:0] = {3{1'bx}};
  endcase
// &CombEnd; @494
end

// &CombBeg; @496
always @( dis_inst1_src_match[2:0]
       or ctrl_dp_is_dis_aiq0_create1_sel[1:0]
       or dis_inst2_src_match[2:0]
       or dis_inst3_src_match[2:0]
       or dis_inst0_src_match[2:0])
begin
  case(ctrl_dp_is_dis_aiq0_create1_sel[1:0])
    2'd0:   lch_rdy_aiq0_create1_src_match[2:0] = dis_inst0_src_match[2:0];
    2'd1:   lch_rdy_aiq0_create1_src_match[2:0] = dis_inst1_src_match[2:0];
    2'd2:   lch_rdy_aiq0_create1_src_match[2:0] = dis_inst2_src_match[2:0];
    2'd3:   lch_rdy_aiq0_create1_src_match[2:0] = dis_inst3_src_match[2:0];
    default:lch_rdy_aiq0_create1_src_match[2:0] = {3{1'bx}};
  endcase
// &CombEnd; @504
end

assign lch_rdy_aiq0_create0_dp_en = ctrl_aiq0_create0_dp_en;
assign lch_rdy_aiq0_create1_dp_en = ctrl_aiq0_create1_dp_en;

assign aiq0_entry0_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-21:AIQ0_LCH_RDY_AIQ0-23];
assign aiq0_entry1_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-18:AIQ0_LCH_RDY_AIQ0-20];
assign aiq0_entry2_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-15:AIQ0_LCH_RDY_AIQ0-17];
assign aiq0_entry3_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-12:AIQ0_LCH_RDY_AIQ0-14];
assign aiq0_entry4_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-9:AIQ0_LCH_RDY_AIQ0-11];
assign aiq0_entry5_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-6:AIQ0_LCH_RDY_AIQ0-8];
assign aiq0_entry6_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-3:AIQ0_LCH_RDY_AIQ0-5];
assign aiq0_entry7_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ0-0:AIQ0_LCH_RDY_AIQ0-2];

assign aiq0_entry0_create_entry[1:0] = {aiq0_aiq_create1_entry[0],aiq0_aiq_create0_entry[0]};
assign aiq0_entry1_create_entry[1:0] = {aiq0_aiq_create1_entry[1],aiq0_aiq_create0_entry[1]};
assign aiq0_entry2_create_entry[1:0] = {aiq0_aiq_create1_entry[2],aiq0_aiq_create0_entry[2]};
assign aiq0_entry3_create_entry[1:0] = {aiq0_aiq_create1_entry[3],aiq0_aiq_create0_entry[3]};
assign aiq0_entry4_create_entry[1:0] = {aiq0_aiq_create1_entry[4],aiq0_aiq_create0_entry[4]};
assign aiq0_entry5_create_entry[1:0] = {aiq0_aiq_create1_entry[5],aiq0_aiq_create0_entry[5]};
assign aiq0_entry6_create_entry[1:0] = {aiq0_aiq_create1_entry[6],aiq0_aiq_create0_entry[6]};
assign aiq0_entry7_create_entry[1:0] = {aiq0_aiq_create1_entry[7],aiq0_aiq_create0_entry[7]};

// &ConnRule(s/^y_/lch_rdy_aiq0_/); @527
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry0"); @528
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry0 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry0_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry0_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry0_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry0_create_entry[1:0]), @529
//          .x_create_lch_rdy (aiq0_entry0_create_lch_rdy[2:0]), @530
//          .x_read_lch_rdy   (aiq0_entry0_read_lch_rdy[2:0])   ); @531
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @532
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry1"); @533
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry1 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry1_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry1_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry1_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry1_create_entry[1:0]), @534
//          .x_create_lch_rdy (aiq0_entry1_create_lch_rdy[2:0]), @535
//          .x_read_lch_rdy   (aiq0_entry1_read_lch_rdy[2:0])   ); @536
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @537
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry2"); @538
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry2 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry2_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry2_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry2_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry2_create_entry[1:0]), @539
//          .x_create_lch_rdy (aiq0_entry2_create_lch_rdy[2:0]), @540
//          .x_read_lch_rdy   (aiq0_entry2_read_lch_rdy[2:0])   ); @541
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @542
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry3"); @543
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry3 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry3_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry3_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry3_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry3_create_entry[1:0]), @544
//          .x_create_lch_rdy (aiq0_entry3_create_lch_rdy[2:0]), @545
//          .x_read_lch_rdy   (aiq0_entry3_read_lch_rdy[2:0])   ); @546
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @547
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry4"); @548
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry4 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry4_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry4_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry4_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry4_create_entry[1:0]), @549
//          .x_create_lch_rdy (aiq0_entry4_create_lch_rdy[2:0]), @550
//          .x_read_lch_rdy   (aiq0_entry4_read_lch_rdy[2:0])   ); @551
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @552
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry5"); @553
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry5 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry5_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry5_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry5_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry5_create_entry[1:0]), @554
//          .x_create_lch_rdy (aiq0_entry5_create_lch_rdy[2:0]), @555
//          .x_read_lch_rdy   (aiq0_entry5_read_lch_rdy[2:0])   ); @556
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @557
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry6"); @558
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry6 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry6_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry6_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry6_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry6_create_entry[1:0]), @559
//          .x_create_lch_rdy (aiq0_entry6_create_lch_rdy[2:0]), @560
//          .x_read_lch_rdy   (aiq0_entry6_read_lch_rdy[2:0])   ); @561
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @562
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry7"); @563
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry7 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq0_entry7_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq0_entry7_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq0_entry7_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq0_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq0_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq0_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq0_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq0_create1_src_match )
);

// &Connect(.x_create_entry   (aiq0_entry7_create_entry[1:0]), @564
//          .x_create_lch_rdy (aiq0_entry7_create_lch_rdy[2:0]), @565
//          .x_read_lch_rdy   (aiq0_entry7_read_lch_rdy[2:0])   ); @566

assign x_read_data[AIQ0_LCH_RDY_AIQ0-21:AIQ0_LCH_RDY_AIQ0-23] = aiq0_entry0_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ0-18:AIQ0_LCH_RDY_AIQ0-20] = aiq0_entry1_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ0-15:AIQ0_LCH_RDY_AIQ0-17] = aiq0_entry2_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ0-12:AIQ0_LCH_RDY_AIQ0-14] = aiq0_entry3_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ0-9:AIQ0_LCH_RDY_AIQ0-11]  = aiq0_entry4_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ0-6:AIQ0_LCH_RDY_AIQ0-8]   = aiq0_entry5_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ0-3:AIQ0_LCH_RDY_AIQ0-5]   = aiq0_entry6_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ0-0:AIQ0_LCH_RDY_AIQ0-2]   = aiq0_entry7_read_lch_rdy[2:0];

//----------------------------------------------------------
//                   AIQ1 create update
//----------------------------------------------------------
// &CombBeg; @580
always @( dis_inst1_src_match[2:0]
       or dis_inst2_src_match[2:0]
       or dis_inst3_src_match[2:0]
       or ctrl_dp_is_dis_aiq1_create0_sel[1:0]
       or dis_inst0_src_match[2:0])
begin
  case(ctrl_dp_is_dis_aiq1_create0_sel[1:0])
    2'd0:   lch_rdy_aiq1_create0_src_match[2:0] = dis_inst0_src_match[2:0];
    2'd1:   lch_rdy_aiq1_create0_src_match[2:0] = dis_inst1_src_match[2:0];
    2'd2:   lch_rdy_aiq1_create0_src_match[2:0] = dis_inst2_src_match[2:0];
    2'd3:   lch_rdy_aiq1_create0_src_match[2:0] = dis_inst3_src_match[2:0];
    default:lch_rdy_aiq1_create0_src_match[2:0] = {3{1'bx}};
  endcase
// &CombEnd; @588
end

// &CombBeg; @590
always @( dis_inst1_src_match[2:0]
       or dis_inst2_src_match[2:0]
       or dis_inst3_src_match[2:0]
       or ctrl_dp_is_dis_aiq1_create1_sel[1:0]
       or dis_inst0_src_match[2:0])
begin
  case(ctrl_dp_is_dis_aiq1_create1_sel[1:0])
    2'd0:   lch_rdy_aiq1_create1_src_match[2:0] = dis_inst0_src_match[2:0];
    2'd1:   lch_rdy_aiq1_create1_src_match[2:0] = dis_inst1_src_match[2:0];
    2'd2:   lch_rdy_aiq1_create1_src_match[2:0] = dis_inst2_src_match[2:0];
    2'd3:   lch_rdy_aiq1_create1_src_match[2:0] = dis_inst3_src_match[2:0];
    default:lch_rdy_aiq1_create1_src_match[2:0] = {3{1'bx}};
  endcase
// &CombEnd; @598
end

assign lch_rdy_aiq1_create0_dp_en = ctrl_aiq1_create0_dp_en;
assign lch_rdy_aiq1_create1_dp_en = ctrl_aiq1_create1_dp_en;

assign aiq1_entry0_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-21:AIQ0_LCH_RDY_AIQ1-23];
assign aiq1_entry1_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-18:AIQ0_LCH_RDY_AIQ1-20];
assign aiq1_entry2_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-15:AIQ0_LCH_RDY_AIQ1-17];
assign aiq1_entry3_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-12:AIQ0_LCH_RDY_AIQ1-14];
assign aiq1_entry4_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-9:AIQ0_LCH_RDY_AIQ1-11];
assign aiq1_entry5_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-6:AIQ0_LCH_RDY_AIQ1-8];
assign aiq1_entry6_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-3:AIQ0_LCH_RDY_AIQ1-5];
assign aiq1_entry7_create_lch_rdy[2:0] = x_create_data[AIQ0_LCH_RDY_AIQ1-0:AIQ0_LCH_RDY_AIQ1-2];

assign aiq1_entry0_create_entry[1:0] = {aiq1_aiq_create1_entry[0],aiq1_aiq_create0_entry[0]};
assign aiq1_entry1_create_entry[1:0] = {aiq1_aiq_create1_entry[1],aiq1_aiq_create0_entry[1]};
assign aiq1_entry2_create_entry[1:0] = {aiq1_aiq_create1_entry[2],aiq1_aiq_create0_entry[2]};
assign aiq1_entry3_create_entry[1:0] = {aiq1_aiq_create1_entry[3],aiq1_aiq_create0_entry[3]};
assign aiq1_entry4_create_entry[1:0] = {aiq1_aiq_create1_entry[4],aiq1_aiq_create0_entry[4]};
assign aiq1_entry5_create_entry[1:0] = {aiq1_aiq_create1_entry[5],aiq1_aiq_create0_entry[5]};
assign aiq1_entry6_create_entry[1:0] = {aiq1_aiq_create1_entry[6],aiq1_aiq_create0_entry[6]};
assign aiq1_entry7_create_entry[1:0] = {aiq1_aiq_create1_entry[7],aiq1_aiq_create0_entry[7]};

// &ConnRule(s/^y_/lch_rdy_aiq1_/); @621
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry0"); @622
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry0 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry0_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry0_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry0_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry0_create_entry[1:0]), @623
//          .x_create_lch_rdy (aiq1_entry0_create_lch_rdy[2:0]), @624
//          .x_read_lch_rdy   (aiq1_entry0_read_lch_rdy[2:0])   ); @625
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @626
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry1"); @627
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry1 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry1_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry1_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry1_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry1_create_entry[1:0]), @628
//          .x_create_lch_rdy (aiq1_entry1_create_lch_rdy[2:0]), @629
//          .x_read_lch_rdy   (aiq1_entry1_read_lch_rdy[2:0])   ); @630
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @631
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry2"); @632
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry2 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry2_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry2_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry2_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry2_create_entry[1:0]), @633
//          .x_create_lch_rdy (aiq1_entry2_create_lch_rdy[2:0]), @634
//          .x_read_lch_rdy   (aiq1_entry2_read_lch_rdy[2:0])   ); @635
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @636
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry3"); @637
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry3 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry3_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry3_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry3_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry3_create_entry[1:0]), @638
//          .x_create_lch_rdy (aiq1_entry3_create_lch_rdy[2:0]), @639
//          .x_read_lch_rdy   (aiq1_entry3_read_lch_rdy[2:0])   ); @640
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @641
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry4"); @642
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry4 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry4_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry4_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry4_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry4_create_entry[1:0]), @643
//          .x_create_lch_rdy (aiq1_entry4_create_lch_rdy[2:0]), @644
//          .x_read_lch_rdy   (aiq1_entry4_read_lch_rdy[2:0])   ); @645
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @646
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry5"); @647
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry5 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry5_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry5_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry5_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry5_create_entry[1:0]), @648
//          .x_create_lch_rdy (aiq1_entry5_create_lch_rdy[2:0]), @649
//          .x_read_lch_rdy   (aiq1_entry5_read_lch_rdy[2:0])   ); @650
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @651
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry6"); @652
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry6 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry6_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry6_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry6_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry6_create_entry[1:0]), @653
//          .x_create_lch_rdy (aiq1_entry6_create_lch_rdy[2:0]), @654
//          .x_read_lch_rdy   (aiq1_entry6_read_lch_rdy[2:0])   ); @655
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @656
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry7"); @657
ct_idu_is_aiq_lch_rdy_3  x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry7 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (aiq1_entry7_create_entry[1:0]  ),
  .x_create_lch_rdy                (aiq1_entry7_create_lch_rdy[2:0]),
  .x_read_lch_rdy                  (aiq1_entry7_read_lch_rdy[2:0]  ),
  .y_clk                           (lch_rdy_aiq1_clk               ),
  .y_create0_dp_en                 (lch_rdy_aiq1_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_aiq1_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_aiq1_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_aiq1_create1_src_match )
);

// &Connect(.x_create_entry   (aiq1_entry7_create_entry[1:0]), @658
//          .x_create_lch_rdy (aiq1_entry7_create_lch_rdy[2:0]), @659
//          .x_read_lch_rdy   (aiq1_entry7_read_lch_rdy[2:0])   ); @660

assign x_read_data[AIQ0_LCH_RDY_AIQ1-21:AIQ0_LCH_RDY_AIQ1-23] = aiq1_entry0_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ1-18:AIQ0_LCH_RDY_AIQ1-20] = aiq1_entry1_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ1-15:AIQ0_LCH_RDY_AIQ1-17] = aiq1_entry2_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ1-12:AIQ0_LCH_RDY_AIQ1-14] = aiq1_entry3_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ1-9:AIQ0_LCH_RDY_AIQ1-11]  = aiq1_entry4_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ1-6:AIQ0_LCH_RDY_AIQ1-8]   = aiq1_entry5_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ1-3:AIQ0_LCH_RDY_AIQ1-5]   = aiq1_entry6_read_lch_rdy[2:0];
assign x_read_data[AIQ0_LCH_RDY_AIQ1-0:AIQ0_LCH_RDY_AIQ1-2]   = aiq1_entry7_read_lch_rdy[2:0];

//----------------------------------------------------------
//                   BIQ create update
//----------------------------------------------------------
// &CombBeg; @674
always @( dis_inst2_src_match[1:0]
       or dis_inst1_src_match[1:0]
       or dis_inst0_src_match[1:0]
       or ctrl_dp_is_dis_biq_create0_sel[1:0]
       or dis_inst3_src_match[1:0])
begin
  case(ctrl_dp_is_dis_biq_create0_sel[1:0])
    2'd0:   lch_rdy_biq_create0_src_match[1:0] = dis_inst0_src_match[1:0];
    2'd1:   lch_rdy_biq_create0_src_match[1:0] = dis_inst1_src_match[1:0];
    2'd2:   lch_rdy_biq_create0_src_match[1:0] = dis_inst2_src_match[1:0];
    2'd3:   lch_rdy_biq_create0_src_match[1:0] = dis_inst3_src_match[1:0];
    default:lch_rdy_biq_create0_src_match[1:0] = {2{1'bx}};
  endcase
// &CombEnd; @682
end

// &CombBeg; @684
always @( dis_inst2_src_match[1:0]
       or dis_inst1_src_match[1:0]
       or dis_inst0_src_match[1:0]
       or ctrl_dp_is_dis_biq_create1_sel[1:0]
       or dis_inst3_src_match[1:0])
begin
  case(ctrl_dp_is_dis_biq_create1_sel[1:0])
    2'd0:   lch_rdy_biq_create1_src_match[1:0] = dis_inst0_src_match[1:0];
    2'd1:   lch_rdy_biq_create1_src_match[1:0] = dis_inst1_src_match[1:0];
    2'd2:   lch_rdy_biq_create1_src_match[1:0] = dis_inst2_src_match[1:0];
    2'd3:   lch_rdy_biq_create1_src_match[1:0] = dis_inst3_src_match[1:0];
    default:lch_rdy_biq_create1_src_match[1:0] = {2{1'bx}};
  endcase
// &CombEnd; @692
end

assign lch_rdy_biq_create0_dp_en = ctrl_biq_create0_dp_en;
assign lch_rdy_biq_create1_dp_en = ctrl_biq_create1_dp_en;

assign biq_entry0_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-22:AIQ0_LCH_RDY_BIQ-23];
assign biq_entry1_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-20:AIQ0_LCH_RDY_BIQ-21];
assign biq_entry2_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-18:AIQ0_LCH_RDY_BIQ-19];
assign biq_entry3_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-16:AIQ0_LCH_RDY_BIQ-17];
assign biq_entry4_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-14:AIQ0_LCH_RDY_BIQ-15];
assign biq_entry5_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-12:AIQ0_LCH_RDY_BIQ-13];
assign biq_entry6_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-10:AIQ0_LCH_RDY_BIQ-11];
assign biq_entry7_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-8:AIQ0_LCH_RDY_BIQ-9];
assign biq_entry8_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-6:AIQ0_LCH_RDY_BIQ-7];
assign biq_entry9_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_BIQ-4:AIQ0_LCH_RDY_BIQ-5];
assign biq_entry10_create_lch_rdy[1:0] = x_create_data[AIQ0_LCH_RDY_BIQ-2:AIQ0_LCH_RDY_BIQ-3];
assign biq_entry11_create_lch_rdy[1:0] = x_create_data[AIQ0_LCH_RDY_BIQ-0:AIQ0_LCH_RDY_BIQ-1];

assign biq_entry0_create_entry[1:0]  = {biq_aiq_create1_entry[0],biq_aiq_create0_entry[0]};
assign biq_entry1_create_entry[1:0]  = {biq_aiq_create1_entry[1],biq_aiq_create0_entry[1]};
assign biq_entry2_create_entry[1:0]  = {biq_aiq_create1_entry[2],biq_aiq_create0_entry[2]};
assign biq_entry3_create_entry[1:0]  = {biq_aiq_create1_entry[3],biq_aiq_create0_entry[3]};
assign biq_entry4_create_entry[1:0]  = {biq_aiq_create1_entry[4],biq_aiq_create0_entry[4]};
assign biq_entry5_create_entry[1:0]  = {biq_aiq_create1_entry[5],biq_aiq_create0_entry[5]};
assign biq_entry6_create_entry[1:0]  = {biq_aiq_create1_entry[6],biq_aiq_create0_entry[6]};
assign biq_entry7_create_entry[1:0]  = {biq_aiq_create1_entry[7],biq_aiq_create0_entry[7]};
assign biq_entry8_create_entry[1:0]  = {biq_aiq_create1_entry[8],biq_aiq_create0_entry[8]};
assign biq_entry9_create_entry[1:0]  = {biq_aiq_create1_entry[9],biq_aiq_create0_entry[9]};
assign biq_entry10_create_entry[1:0] = {biq_aiq_create1_entry[10],biq_aiq_create0_entry[10]};
assign biq_entry11_create_entry[1:0] = {biq_aiq_create1_entry[11],biq_aiq_create0_entry[11]};

// &ConnRule(s/^y_/lch_rdy_biq_/); @723
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry0"); @724
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry0 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry0_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry0_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry0_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry0_create_entry[1:0]), @725
//          .x_create_lch_rdy (biq_entry0_create_lch_rdy[1:0]), @726
//          .x_read_lch_rdy   (biq_entry0_read_lch_rdy[1:0])   ); @727
// &ConnRule(s/^y_/lch_rdy_biq_/); @728
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry1"); @729
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry1 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry1_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry1_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry1_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry1_create_entry[1:0]), @730
//          .x_create_lch_rdy (biq_entry1_create_lch_rdy[1:0]), @731
//          .x_read_lch_rdy   (biq_entry1_read_lch_rdy[1:0])   ); @732
// &ConnRule(s/^y_/lch_rdy_biq_/); @733
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry2"); @734
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry2 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry2_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry2_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry2_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry2_create_entry[1:0]), @735
//          .x_create_lch_rdy (biq_entry2_create_lch_rdy[1:0]), @736
//          .x_read_lch_rdy   (biq_entry2_read_lch_rdy[1:0])   ); @737
// &ConnRule(s/^y_/lch_rdy_biq_/); @738
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry3"); @739
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry3 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry3_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry3_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry3_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry3_create_entry[1:0]), @740
//          .x_create_lch_rdy (biq_entry3_create_lch_rdy[1:0]), @741
//          .x_read_lch_rdy   (biq_entry3_read_lch_rdy[1:0])   ); @742
// &ConnRule(s/^y_/lch_rdy_biq_/); @743
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry4"); @744
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry4 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry4_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry4_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry4_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry4_create_entry[1:0]), @745
//          .x_create_lch_rdy (biq_entry4_create_lch_rdy[1:0]), @746
//          .x_read_lch_rdy   (biq_entry4_read_lch_rdy[1:0])   ); @747
// &ConnRule(s/^y_/lch_rdy_biq_/); @748
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry5"); @749
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry5 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry5_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry5_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry5_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry5_create_entry[1:0]), @750
//          .x_create_lch_rdy (biq_entry5_create_lch_rdy[1:0]), @751
//          .x_read_lch_rdy   (biq_entry5_read_lch_rdy[1:0])   ); @752
// &ConnRule(s/^y_/lch_rdy_biq_/); @753
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry6"); @754
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry6 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry6_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry6_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry6_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry6_create_entry[1:0]), @755
//          .x_create_lch_rdy (biq_entry6_create_lch_rdy[1:0]), @756
//          .x_read_lch_rdy   (biq_entry6_read_lch_rdy[1:0])   ); @757
// &ConnRule(s/^y_/lch_rdy_biq_/); @758
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry7"); @759
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry7 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry7_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry7_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry7_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry7_create_entry[1:0]), @760
//          .x_create_lch_rdy (biq_entry7_create_lch_rdy[1:0]), @761
//          .x_read_lch_rdy   (biq_entry7_read_lch_rdy[1:0])   ); @762
// &ConnRule(s/^y_/lch_rdy_biq_/); @763
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry8"); @764
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry8 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry8_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry8_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry8_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry8_create_entry[1:0]), @765
//          .x_create_lch_rdy (biq_entry8_create_lch_rdy[1:0]), @766
//          .x_read_lch_rdy   (biq_entry8_read_lch_rdy[1:0])   ); @767
// &ConnRule(s/^y_/lch_rdy_biq_/); @768
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry9"); @769
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry9 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (biq_entry9_create_entry[1:0]  ),
  .x_create_lch_rdy               (biq_entry9_create_lch_rdy[1:0]),
  .x_read_lch_rdy                 (biq_entry9_read_lch_rdy[1:0]  ),
  .y_clk                          (lch_rdy_biq_clk               ),
  .y_create0_dp_en                (lch_rdy_biq_create0_dp_en     ),
  .y_create0_src_match            (lch_rdy_biq_create0_src_match ),
  .y_create1_dp_en                (lch_rdy_biq_create1_dp_en     ),
  .y_create1_src_match            (lch_rdy_biq_create1_src_match )
);

// &Connect(.x_create_entry   (biq_entry9_create_entry[1:0]), @770
//          .x_create_lch_rdy (biq_entry9_create_lch_rdy[1:0]), @771
//          .x_read_lch_rdy   (biq_entry9_read_lch_rdy[1:0])   ); @772
// &ConnRule(s/^y_/lch_rdy_biq_/); @773
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry10"); @774
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry10 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (biq_entry10_create_entry[1:0]  ),
  .x_create_lch_rdy                (biq_entry10_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (biq_entry10_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_biq_clk                ),
  .y_create0_dp_en                 (lch_rdy_biq_create0_dp_en      ),
  .y_create0_src_match             (lch_rdy_biq_create0_src_match  ),
  .y_create1_dp_en                 (lch_rdy_biq_create1_dp_en      ),
  .y_create1_src_match             (lch_rdy_biq_create1_src_match  )
);

// &Connect(.x_create_entry   (biq_entry10_create_entry[1:0]), @775
//          .x_create_lch_rdy (biq_entry10_create_lch_rdy[1:0]), @776
//          .x_read_lch_rdy   (biq_entry10_read_lch_rdy[1:0])   ); @777
// &ConnRule(s/^y_/lch_rdy_biq_/); @778
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry11"); @779
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_biq_entry11 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (biq_entry11_create_entry[1:0]  ),
  .x_create_lch_rdy                (biq_entry11_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (biq_entry11_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_biq_clk                ),
  .y_create0_dp_en                 (lch_rdy_biq_create0_dp_en      ),
  .y_create0_src_match             (lch_rdy_biq_create0_src_match  ),
  .y_create1_dp_en                 (lch_rdy_biq_create1_dp_en      ),
  .y_create1_src_match             (lch_rdy_biq_create1_src_match  )
);

// &Connect(.x_create_entry   (biq_entry11_create_entry[1:0]), @780
//          .x_create_lch_rdy (biq_entry11_create_lch_rdy[1:0]), @781
//          .x_read_lch_rdy   (biq_entry11_read_lch_rdy[1:0])   ); @782

assign x_read_data[AIQ0_LCH_RDY_BIQ-22:AIQ0_LCH_RDY_BIQ-23] = biq_entry0_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-20:AIQ0_LCH_RDY_BIQ-21] = biq_entry1_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-18:AIQ0_LCH_RDY_BIQ-19] = biq_entry2_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-16:AIQ0_LCH_RDY_BIQ-17] = biq_entry3_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-14:AIQ0_LCH_RDY_BIQ-15] = biq_entry4_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-12:AIQ0_LCH_RDY_BIQ-13] = biq_entry5_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-10:AIQ0_LCH_RDY_BIQ-11] = biq_entry6_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-8:AIQ0_LCH_RDY_BIQ-9]   = biq_entry7_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-6:AIQ0_LCH_RDY_BIQ-7]   = biq_entry8_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-4:AIQ0_LCH_RDY_BIQ-5]   = biq_entry9_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-2:AIQ0_LCH_RDY_BIQ-3]   = biq_entry10_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_BIQ-0:AIQ0_LCH_RDY_BIQ-1]   = biq_entry11_read_lch_rdy[1:0];

//----------------------------------------------------------
//                   LSIQ create update
//----------------------------------------------------------
// &CombBeg; @800
always @( dis_inst2_src_match[1:0]
       or dis_inst1_src_match[1:0]
       or dis_inst0_src_match[1:0]
       or ctrl_dp_is_dis_lsiq_create0_sel[1:0]
       or dis_inst3_src_match[1:0])
begin
  case(ctrl_dp_is_dis_lsiq_create0_sel[1:0])
    2'd0:   lch_rdy_lsiq_create0_src_match[1:0] = dis_inst0_src_match[1:0];
    2'd1:   lch_rdy_lsiq_create0_src_match[1:0] = dis_inst1_src_match[1:0];
    2'd2:   lch_rdy_lsiq_create0_src_match[1:0] = dis_inst2_src_match[1:0];
    2'd3:   lch_rdy_lsiq_create0_src_match[1:0] = dis_inst3_src_match[1:0];
    default:lch_rdy_lsiq_create0_src_match[1:0] = {2{1'bx}};
  endcase
// &CombEnd; @808
end

// &CombBeg; @810
always @( dis_inst2_src_match[1:0]
       or dis_inst1_src_match[1:0]
       or dis_inst0_src_match[1:0]
       or ctrl_dp_is_dis_lsiq_create1_sel[1:0]
       or dis_inst3_src_match[1:0])
begin
  case(ctrl_dp_is_dis_lsiq_create1_sel[1:0])
    2'd0:   lch_rdy_lsiq_create1_src_match[1:0] = dis_inst0_src_match[1:0];
    2'd1:   lch_rdy_lsiq_create1_src_match[1:0] = dis_inst1_src_match[1:0];
    2'd2:   lch_rdy_lsiq_create1_src_match[1:0] = dis_inst2_src_match[1:0];
    2'd3:   lch_rdy_lsiq_create1_src_match[1:0] = dis_inst3_src_match[1:0];
    default:lch_rdy_lsiq_create1_src_match[1:0] = {2{1'bx}};
  endcase
// &CombEnd; @818
end

assign lch_rdy_lsiq_create0_dp_en = ctrl_lsiq_create0_dp_en;
assign lch_rdy_lsiq_create1_dp_en = ctrl_lsiq_create1_dp_en;

assign lsiq_entry0_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-22:AIQ0_LCH_RDY_LSIQ-23];
assign lsiq_entry1_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-20:AIQ0_LCH_RDY_LSIQ-21];
assign lsiq_entry2_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-18:AIQ0_LCH_RDY_LSIQ-19];
assign lsiq_entry3_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-16:AIQ0_LCH_RDY_LSIQ-17];
assign lsiq_entry4_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-14:AIQ0_LCH_RDY_LSIQ-15];
assign lsiq_entry5_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-12:AIQ0_LCH_RDY_LSIQ-13];
assign lsiq_entry6_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-10:AIQ0_LCH_RDY_LSIQ-11];
assign lsiq_entry7_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-8:AIQ0_LCH_RDY_LSIQ-9];
assign lsiq_entry8_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-6:AIQ0_LCH_RDY_LSIQ-7];
assign lsiq_entry9_create_lch_rdy[1:0]  = x_create_data[AIQ0_LCH_RDY_LSIQ-4:AIQ0_LCH_RDY_LSIQ-5];
assign lsiq_entry10_create_lch_rdy[1:0] = x_create_data[AIQ0_LCH_RDY_LSIQ-2:AIQ0_LCH_RDY_LSIQ-3];
assign lsiq_entry11_create_lch_rdy[1:0] = x_create_data[AIQ0_LCH_RDY_LSIQ-0:AIQ0_LCH_RDY_LSIQ-1];

assign lsiq_entry0_create_entry[1:0]  = {lsiq_aiq_create1_entry[0],lsiq_aiq_create0_entry[0]};
assign lsiq_entry1_create_entry[1:0]  = {lsiq_aiq_create1_entry[1],lsiq_aiq_create0_entry[1]};
assign lsiq_entry2_create_entry[1:0]  = {lsiq_aiq_create1_entry[2],lsiq_aiq_create0_entry[2]};
assign lsiq_entry3_create_entry[1:0]  = {lsiq_aiq_create1_entry[3],lsiq_aiq_create0_entry[3]};
assign lsiq_entry4_create_entry[1:0]  = {lsiq_aiq_create1_entry[4],lsiq_aiq_create0_entry[4]};
assign lsiq_entry5_create_entry[1:0]  = {lsiq_aiq_create1_entry[5],lsiq_aiq_create0_entry[5]};
assign lsiq_entry6_create_entry[1:0]  = {lsiq_aiq_create1_entry[6],lsiq_aiq_create0_entry[6]};
assign lsiq_entry7_create_entry[1:0]  = {lsiq_aiq_create1_entry[7],lsiq_aiq_create0_entry[7]};
assign lsiq_entry8_create_entry[1:0]  = {lsiq_aiq_create1_entry[8],lsiq_aiq_create0_entry[8]};
assign lsiq_entry9_create_entry[1:0]  = {lsiq_aiq_create1_entry[9],lsiq_aiq_create0_entry[9]};
assign lsiq_entry10_create_entry[1:0] = {lsiq_aiq_create1_entry[10],lsiq_aiq_create0_entry[10]};
assign lsiq_entry11_create_entry[1:0] = {lsiq_aiq_create1_entry[11],lsiq_aiq_create0_entry[11]};

// &ConnRule(s/^y_/lch_rdy_lsiq_/); @849
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry0"); @850
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry0 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry0_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry0_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry0_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry0_create_entry[1:0]), @851
//          .x_create_lch_rdy (lsiq_entry0_create_lch_rdy[1:0]), @852
//          .x_read_lch_rdy   (lsiq_entry0_read_lch_rdy[1:0])   ); @853
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @854
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry1"); @855
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry1 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry1_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry1_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry1_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry1_create_entry[1:0]), @856
//          .x_create_lch_rdy (lsiq_entry1_create_lch_rdy[1:0]), @857
//          .x_read_lch_rdy   (lsiq_entry1_read_lch_rdy[1:0])   ); @858
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @859
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry2"); @860
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry2 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry2_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry2_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry2_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry2_create_entry[1:0]), @861
//          .x_create_lch_rdy (lsiq_entry2_create_lch_rdy[1:0]), @862
//          .x_read_lch_rdy   (lsiq_entry2_read_lch_rdy[1:0])   ); @863
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @864
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry3"); @865
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry3 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry3_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry3_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry3_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry3_create_entry[1:0]), @866
//          .x_create_lch_rdy (lsiq_entry3_create_lch_rdy[1:0]), @867
//          .x_read_lch_rdy   (lsiq_entry3_read_lch_rdy[1:0])   ); @868
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @869
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry4"); @870
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry4 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry4_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry4_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry4_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry4_create_entry[1:0]), @871
//          .x_create_lch_rdy (lsiq_entry4_create_lch_rdy[1:0]), @872
//          .x_read_lch_rdy   (lsiq_entry4_read_lch_rdy[1:0])   ); @873
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @874
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry5"); @875
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry5 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry5_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry5_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry5_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry5_create_entry[1:0]), @876
//          .x_create_lch_rdy (lsiq_entry5_create_lch_rdy[1:0]), @877
//          .x_read_lch_rdy   (lsiq_entry5_read_lch_rdy[1:0])   ); @878
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @879
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry6"); @880
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry6 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry6_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry6_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry6_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry6_create_entry[1:0]), @881
//          .x_create_lch_rdy (lsiq_entry6_create_lch_rdy[1:0]), @882
//          .x_read_lch_rdy   (lsiq_entry6_read_lch_rdy[1:0])   ); @883
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @884
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry7"); @885
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry7 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry7_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry7_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry7_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry7_create_entry[1:0]), @886
//          .x_create_lch_rdy (lsiq_entry7_create_lch_rdy[1:0]), @887
//          .x_read_lch_rdy   (lsiq_entry7_read_lch_rdy[1:0])   ); @888
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @889
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry8"); @890
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry8 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry8_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry8_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry8_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry8_create_entry[1:0]), @891
//          .x_create_lch_rdy (lsiq_entry8_create_lch_rdy[1:0]), @892
//          .x_read_lch_rdy   (lsiq_entry8_read_lch_rdy[1:0])   ); @893
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @894
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry9"); @895
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry9 (
  .cpurst_b                        (cpurst_b                       ),
  .vld                             (vld                            ),
  .x_create_dp_en                  (x_create_dp_en                 ),
  .x_create_entry                  (lsiq_entry9_create_entry[1:0]  ),
  .x_create_lch_rdy                (lsiq_entry9_create_lch_rdy[1:0]),
  .x_read_lch_rdy                  (lsiq_entry9_read_lch_rdy[1:0]  ),
  .y_clk                           (lch_rdy_lsiq_clk               ),
  .y_create0_dp_en                 (lch_rdy_lsiq_create0_dp_en     ),
  .y_create0_src_match             (lch_rdy_lsiq_create0_src_match ),
  .y_create1_dp_en                 (lch_rdy_lsiq_create1_dp_en     ),
  .y_create1_src_match             (lch_rdy_lsiq_create1_src_match )
);

// &Connect(.x_create_entry   (lsiq_entry9_create_entry[1:0]), @896
//          .x_create_lch_rdy (lsiq_entry9_create_lch_rdy[1:0]), @897
//          .x_read_lch_rdy   (lsiq_entry9_read_lch_rdy[1:0])   ); @898
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @899
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry10"); @900
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry10 (
  .cpurst_b                         (cpurst_b                        ),
  .vld                              (vld                             ),
  .x_create_dp_en                   (x_create_dp_en                  ),
  .x_create_entry                   (lsiq_entry10_create_entry[1:0]  ),
  .x_create_lch_rdy                 (lsiq_entry10_create_lch_rdy[1:0]),
  .x_read_lch_rdy                   (lsiq_entry10_read_lch_rdy[1:0]  ),
  .y_clk                            (lch_rdy_lsiq_clk                ),
  .y_create0_dp_en                  (lch_rdy_lsiq_create0_dp_en      ),
  .y_create0_src_match              (lch_rdy_lsiq_create0_src_match  ),
  .y_create1_dp_en                  (lch_rdy_lsiq_create1_dp_en      ),
  .y_create1_src_match              (lch_rdy_lsiq_create1_src_match  )
);

// &Connect(.x_create_entry   (lsiq_entry10_create_entry[1:0]), @901
//          .x_create_lch_rdy (lsiq_entry10_create_lch_rdy[1:0]), @902
//          .x_read_lch_rdy   (lsiq_entry10_read_lch_rdy[1:0])   ); @903
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @904
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry11"); @905
ct_idu_is_aiq_lch_rdy_2  x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry11 (
  .cpurst_b                         (cpurst_b                        ),
  .vld                              (vld                             ),
  .x_create_dp_en                   (x_create_dp_en                  ),
  .x_create_entry                   (lsiq_entry11_create_entry[1:0]  ),
  .x_create_lch_rdy                 (lsiq_entry11_create_lch_rdy[1:0]),
  .x_read_lch_rdy                   (lsiq_entry11_read_lch_rdy[1:0]  ),
  .y_clk                            (lch_rdy_lsiq_clk                ),
  .y_create0_dp_en                  (lch_rdy_lsiq_create0_dp_en      ),
  .y_create0_src_match              (lch_rdy_lsiq_create0_src_match  ),
  .y_create1_dp_en                  (lch_rdy_lsiq_create1_dp_en      ),
  .y_create1_src_match              (lch_rdy_lsiq_create1_src_match  )
);

// &Connect(.x_create_entry   (lsiq_entry11_create_entry[1:0]), @906
//          .x_create_lch_rdy (lsiq_entry11_create_lch_rdy[1:0]), @907
//          .x_read_lch_rdy   (lsiq_entry11_read_lch_rdy[1:0])   ); @908

assign x_read_data[AIQ0_LCH_RDY_LSIQ-22:AIQ0_LCH_RDY_LSIQ-23] = lsiq_entry0_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-20:AIQ0_LCH_RDY_LSIQ-21] = lsiq_entry1_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-18:AIQ0_LCH_RDY_LSIQ-19] = lsiq_entry2_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-16:AIQ0_LCH_RDY_LSIQ-17] = lsiq_entry3_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-14:AIQ0_LCH_RDY_LSIQ-15] = lsiq_entry4_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-12:AIQ0_LCH_RDY_LSIQ-13] = lsiq_entry5_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-10:AIQ0_LCH_RDY_LSIQ-11] = lsiq_entry6_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-8:AIQ0_LCH_RDY_LSIQ-9]   = lsiq_entry7_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-6:AIQ0_LCH_RDY_LSIQ-7]   = lsiq_entry8_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-4:AIQ0_LCH_RDY_LSIQ-5]   = lsiq_entry9_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-2:AIQ0_LCH_RDY_LSIQ-3]   = lsiq_entry10_read_lch_rdy[1:0];
assign x_read_data[AIQ0_LCH_RDY_LSIQ-0:AIQ0_LCH_RDY_LSIQ-1]   = lsiq_entry11_read_lch_rdy[1:0];

//----------------------------------------------------------
//                   SDIQ create update
//----------------------------------------------------------
// &CombBeg; @926
always @( ctrl_dp_is_dis_sdiq_create0_sel[1:0]
       or dis_inst3_src_match[2:1]
       or dis_inst2_src_match[2:1]
       or dis_inst0_src_match[2:1]
       or dis_inst1_src_match[2:1]
       or dp_aiq_sdiq_create0_src_sel)
begin
  case(ctrl_dp_is_dis_sdiq_create0_sel[1:0])
    2'd0:   lch_rdy_sdiq_create0_src_match = dp_aiq_sdiq_create0_src_sel
                                             ? dis_inst0_src_match[1]
                                             : dis_inst0_src_match[2];
    2'd1:   lch_rdy_sdiq_create0_src_match = dp_aiq_sdiq_create0_src_sel
                                             ? dis_inst1_src_match[1]
                                             : dis_inst1_src_match[2];
    2'd2:   lch_rdy_sdiq_create0_src_match = dp_aiq_sdiq_create0_src_sel
                                             ? dis_inst2_src_match[1]
                                             : dis_inst2_src_match[2];
    2'd3:   lch_rdy_sdiq_create0_src_match = dp_aiq_sdiq_create0_src_sel
                                             ? dis_inst3_src_match[1]
                                             : dis_inst3_src_match[2];
    default:lch_rdy_sdiq_create0_src_match = 1'bx;
  endcase
// &CombEnd; @942
end

// &CombBeg; @944
always @( dis_inst3_src_match[2:1]
       or dis_inst2_src_match[2:1]
       or ctrl_dp_is_dis_sdiq_create1_sel[1:0]
       or dis_inst0_src_match[2:1]
       or dis_inst1_src_match[2:1]
       or dp_aiq_sdiq_create1_src_sel)
begin
  case(ctrl_dp_is_dis_sdiq_create1_sel[1:0])
    2'd0:   lch_rdy_sdiq_create1_src_match = dp_aiq_sdiq_create1_src_sel 
                                             ? dis_inst0_src_match[1] 
                                             : dis_inst0_src_match[2];
    2'd1:   lch_rdy_sdiq_create1_src_match = dp_aiq_sdiq_create1_src_sel 
                                             ? dis_inst1_src_match[1]
                                             : dis_inst1_src_match[2];
    2'd2:   lch_rdy_sdiq_create1_src_match = dp_aiq_sdiq_create1_src_sel 
                                             ? dis_inst2_src_match[1]
                                             : dis_inst2_src_match[2];
    2'd3:   lch_rdy_sdiq_create1_src_match = dp_aiq_sdiq_create1_src_sel 
                                             ? dis_inst3_src_match[1]
                                             : dis_inst3_src_match[2];
    default:lch_rdy_sdiq_create1_src_match = 1'bx;
  endcase
// &CombEnd; @960
end

assign lch_rdy_sdiq_create0_dp_en  = ctrl_sdiq_create0_dp_en;
assign lch_rdy_sdiq_create1_dp_en  = ctrl_sdiq_create1_dp_en;

assign sdiq_entry0_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-11];
assign sdiq_entry1_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-10];
assign sdiq_entry2_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-9];
assign sdiq_entry3_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-8];
assign sdiq_entry4_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-7];
assign sdiq_entry5_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-6];
assign sdiq_entry6_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-5];
assign sdiq_entry7_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-4];
assign sdiq_entry8_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-3];
assign sdiq_entry9_create_lch_rdy  = x_create_data[AIQ0_LCH_RDY_SDIQ-2];
assign sdiq_entry10_create_lch_rdy = x_create_data[AIQ0_LCH_RDY_SDIQ-1];
assign sdiq_entry11_create_lch_rdy = x_create_data[AIQ0_LCH_RDY_SDIQ-0];

assign sdiq_entry0_create_entry[1:0]  = {sdiq_aiq_create1_entry[0],sdiq_aiq_create0_entry[0]};
assign sdiq_entry1_create_entry[1:0]  = {sdiq_aiq_create1_entry[1],sdiq_aiq_create0_entry[1]};
assign sdiq_entry2_create_entry[1:0]  = {sdiq_aiq_create1_entry[2],sdiq_aiq_create0_entry[2]};
assign sdiq_entry3_create_entry[1:0]  = {sdiq_aiq_create1_entry[3],sdiq_aiq_create0_entry[3]};
assign sdiq_entry4_create_entry[1:0]  = {sdiq_aiq_create1_entry[4],sdiq_aiq_create0_entry[4]};
assign sdiq_entry5_create_entry[1:0]  = {sdiq_aiq_create1_entry[5],sdiq_aiq_create0_entry[5]};
assign sdiq_entry6_create_entry[1:0]  = {sdiq_aiq_create1_entry[6],sdiq_aiq_create0_entry[6]};
assign sdiq_entry7_create_entry[1:0]  = {sdiq_aiq_create1_entry[7],sdiq_aiq_create0_entry[7]};
assign sdiq_entry8_create_entry[1:0]  = {sdiq_aiq_create1_entry[8],sdiq_aiq_create0_entry[8]};
assign sdiq_entry9_create_entry[1:0]  = {sdiq_aiq_create1_entry[9],sdiq_aiq_create0_entry[9]};
assign sdiq_entry10_create_entry[1:0] = {sdiq_aiq_create1_entry[10],sdiq_aiq_create0_entry[10]};
assign sdiq_entry11_create_entry[1:0] = {sdiq_aiq_create1_entry[11],sdiq_aiq_create0_entry[11]};

// &ConnRule(s/^y_/lch_rdy_sdiq_/); @991
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry0"); @992
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry0 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry0_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry0_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry0_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry0_create_entry), @993
//          .x_create_lch_rdy (sdiq_entry0_create_lch_rdy), @994
//          .x_read_lch_rdy   (sdiq_entry0_read_lch_rdy)   ); @995
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @996
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry1"); @997
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry1 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry1_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry1_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry1_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry1_create_entry), @998
//          .x_create_lch_rdy (sdiq_entry1_create_lch_rdy), @999
//          .x_read_lch_rdy   (sdiq_entry1_read_lch_rdy)   ); @1000
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1001
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry2"); @1002
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry2 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry2_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry2_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry2_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry2_create_entry), @1003
//          .x_create_lch_rdy (sdiq_entry2_create_lch_rdy), @1004
//          .x_read_lch_rdy   (sdiq_entry2_read_lch_rdy)   ); @1005
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1006
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry3"); @1007
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry3 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry3_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry3_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry3_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry3_create_entry), @1008
//          .x_create_lch_rdy (sdiq_entry3_create_lch_rdy), @1009
//          .x_read_lch_rdy   (sdiq_entry3_read_lch_rdy)   ); @1010
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1011
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry4"); @1012
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry4 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry4_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry4_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry4_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry4_create_entry), @1013
//          .x_create_lch_rdy (sdiq_entry4_create_lch_rdy), @1014
//          .x_read_lch_rdy   (sdiq_entry4_read_lch_rdy)   ); @1015
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1016
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry5"); @1017
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry5 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry5_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry5_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry5_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry5_create_entry), @1018
//          .x_create_lch_rdy (sdiq_entry5_create_lch_rdy), @1019
//          .x_read_lch_rdy   (sdiq_entry5_read_lch_rdy)   ); @1020
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1021
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry6"); @1022
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry6 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry6_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry6_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry6_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry6_create_entry), @1023
//          .x_create_lch_rdy (sdiq_entry6_create_lch_rdy), @1024
//          .x_read_lch_rdy   (sdiq_entry6_read_lch_rdy)   ); @1025
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1026
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry7"); @1027
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry7 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry7_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry7_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry7_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry7_create_entry), @1028
//          .x_create_lch_rdy (sdiq_entry7_create_lch_rdy), @1029
//          .x_read_lch_rdy   (sdiq_entry7_read_lch_rdy)   ); @1030
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1031
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry8"); @1032
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry8 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry8_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry8_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry8_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry8_create_entry), @1033
//          .x_create_lch_rdy (sdiq_entry8_create_lch_rdy), @1034
//          .x_read_lch_rdy   (sdiq_entry8_read_lch_rdy)   ); @1035
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1036
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry9"); @1037
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry9 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry9_create_entry      ),
  .x_create_lch_rdy               (sdiq_entry9_create_lch_rdy    ),
  .x_read_lch_rdy                 (sdiq_entry9_read_lch_rdy      ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry9_create_entry), @1038
//          .x_create_lch_rdy (sdiq_entry9_create_lch_rdy), @1039
//          .x_read_lch_rdy   (sdiq_entry9_read_lch_rdy)   ); @1040
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1041
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry10"); @1042
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry10 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry10_create_entry     ),
  .x_create_lch_rdy               (sdiq_entry10_create_lch_rdy   ),
  .x_read_lch_rdy                 (sdiq_entry10_read_lch_rdy     ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry10_create_entry), @1043
//          .x_create_lch_rdy (sdiq_entry10_create_lch_rdy), @1044
//          .x_read_lch_rdy   (sdiq_entry10_read_lch_rdy)   ); @1045
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @1046
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry11"); @1047
ct_idu_is_aiq_lch_rdy_1  x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry11 (
  .cpurst_b                       (cpurst_b                      ),
  .vld                            (vld                           ),
  .x_create_dp_en                 (x_create_dp_en                ),
  .x_create_entry                 (sdiq_entry11_create_entry     ),
  .x_create_lch_rdy               (sdiq_entry11_create_lch_rdy   ),
  .x_read_lch_rdy                 (sdiq_entry11_read_lch_rdy     ),
  .y_clk                          (lch_rdy_sdiq_clk              ),
  .y_create0_dp_en                (lch_rdy_sdiq_create0_dp_en    ),
  .y_create0_src_match            (lch_rdy_sdiq_create0_src_match),
  .y_create1_dp_en                (lch_rdy_sdiq_create1_dp_en    ),
  .y_create1_src_match            (lch_rdy_sdiq_create1_src_match)
);

// &Connect(.x_create_entry   (sdiq_entry11_create_entry), @1048
//          .x_create_lch_rdy (sdiq_entry11_create_lch_rdy), @1049
//          .x_read_lch_rdy   (sdiq_entry11_read_lch_rdy)   ); @1050

assign x_read_data[AIQ0_LCH_RDY_SDIQ-11] = sdiq_entry0_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-10] = sdiq_entry1_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-9]  = sdiq_entry2_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-8]  = sdiq_entry3_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-7]  = sdiq_entry4_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-6]  = sdiq_entry5_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-5]  = sdiq_entry6_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-4]  = sdiq_entry7_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-3]  = sdiq_entry8_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-2]  = sdiq_entry9_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-1]  = sdiq_entry10_read_lch_rdy;
assign x_read_data[AIQ0_LCH_RDY_SDIQ-0]  = sdiq_entry11_read_lch_rdy;

//==========================================================
//                  Entry Ready Signal
//==========================================================
assign x_rdy = vld
               && !frz
               && !ctrl_aiq0_stall
               && !(x_read_data[AIQ0_DIV] && iu_idu_div_busy)
               && src0_rdy_for_issue
               && src1_rdy_for_issue
               && src2_rdy_for_issue;

// &ModuleEnd; @1076
endmodule


