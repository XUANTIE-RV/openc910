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
module ct_idu_is_aiq1_entry(
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
  ctrl_aiq1_create0_dp_en,
  ctrl_aiq1_create0_gateclk_en,
  ctrl_aiq1_create1_dp_en,
  ctrl_aiq1_create1_gateclk_en,
  ctrl_aiq1_rf_pop_vld,
  ctrl_aiq1_stall,
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
  dp_aiq1_rf_rdy_clr,
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
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dupx,
  iu_idu_ex1_pipe1_mult_stall,
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
  x_mla_fwd_vld,
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
input            ctrl_aiq1_create0_dp_en;                
input            ctrl_aiq1_create0_gateclk_en;           
input            ctrl_aiq1_create1_dp_en;                
input            ctrl_aiq1_create1_gateclk_en;           
input            ctrl_aiq1_rf_pop_vld;                   
input            ctrl_aiq1_stall;                        
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
input   [2  :0]  dp_aiq1_rf_rdy_clr;                     
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
input            iu_idu_div_inst_vld;                    
input   [6  :0]  iu_idu_div_preg_dupx;                   
input            iu_idu_ex1_pipe1_mult_stall;            
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
input   [213:0]  x_create_data;                          
input            x_create_dp_en;                         
input            x_create_en;                            
input            x_create_frz;                           
input            x_create_gateclk_en;                    
input            x_frz_clr;                              
input            x_issue_en;                             
input            x_mla_fwd_vld;                          
input            x_pop_cur_entry;                        
input   [6  :0]  x_pop_other_entry;                      
output  [6  :0]  x_agevec;                               
output           x_rdy;                                  
output  [213:0]  x_read_data;                            
output           x_vld;                                  
output           x_vld_with_frz;                         

// &Regs; @29
reg     [6  :0]  agevec;                                 
reg              alu_short;                              
reg     [6  :0]  dst_preg;                               
reg              dst_vld;                                
reg     [6  :0]  dst_vreg;                               
reg              dstv_vld;                               
reg              frz;                                    
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
reg              mla;                                    
reg              mtvr;                                   
reg     [31 :0]  opcode;                                 
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
wire             create_preg_clk;                        
wire             create_preg_clk_en;                     
wire    [9  :0]  create_src0_data;                       
wire             create_src0_gateclk_en;                 
wire    [9  :0]  create_src1_data;                       
wire             create_src1_gateclk_en;                 
wire    [10 :0]  create_src2_data;                       
wire             create_src2_gateclk_en;                 
wire             create_vreg_clk;                        
wire             create_vreg_clk_en;                     
wire             ctrl_aiq0_create0_dp_en;                
wire             ctrl_aiq0_create0_gateclk_en;           
wire             ctrl_aiq0_create1_dp_en;                
wire             ctrl_aiq0_create1_gateclk_en;           
wire             ctrl_aiq1_create0_dp_en;                
wire             ctrl_aiq1_create0_gateclk_en;           
wire             ctrl_aiq1_create1_dp_en;                
wire             ctrl_aiq1_create1_gateclk_en;           
wire             ctrl_aiq1_rf_pop_vld;                   
wire             ctrl_aiq1_stall;                        
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
wire    [2  :0]  dp_aiq1_rf_rdy_clr;                     
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
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dupx;                   
wire             iu_idu_ex1_pipe1_mult_stall;            
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
wire    [12 :0]  read_src2_data;                         
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
wire    [213:0]  x_create_data;                          
wire             x_create_dp_en;                         
wire             x_create_en;                            
wire             x_create_frz;                           
wire             x_create_gateclk_en;                    
wire             x_frz_clr;                              
wire             x_issue_en;                             
wire             x_mla_fwd_vld;                          
wire             x_pop_cur_entry;                        
wire    [6  :0]  x_pop_other_entry;                      
wire             x_rdy;                                  
wire    [213:0]  x_read_data;                            
wire             x_vld;                                  
wire             x_vld_with_frz;                         



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                    AIQ1 Parameters
//----------------------------------------------------------
parameter AIQ1_WIDTH             = 214;

parameter AIQ1_VL                = 213;
parameter AIQ1_LCH_PREG          = 205;
parameter AIQ1_VSEW              = 204;
parameter AIQ1_VLMUL             = 201;
parameter AIQ1_LCH_RDY_SDIQ      = 199;
parameter AIQ1_LCH_RDY_LSIQ      = 187;
parameter AIQ1_LCH_RDY_BIQ       = 163;
parameter AIQ1_LCH_RDY_AIQ1      = 139;
parameter AIQ1_LCH_RDY_AIQ0      = 115;
parameter AIQ1_ALU_SHORT         = 91;
parameter AIQ1_MLA               = 90;
parameter AIQ1_MTVR              = 89;
parameter AIQ1_SRC2_LSU_MATCH    = 88;
parameter AIQ1_SRC2_DATA         = 87;
parameter AIQ1_SRC2_PREG         = 86;
parameter AIQ1_SRC2_WB           = 79;
parameter AIQ1_SRC2_RDY          = 78;
parameter AIQ1_SRC1_LSU_MATCH    = 77;
parameter AIQ1_SRC1_DATA         = 76;
parameter AIQ1_SRC1_PREG         = 76;
parameter AIQ1_SRC1_WB           = 69;
parameter AIQ1_SRC1_RDY          = 68;
parameter AIQ1_SRC0_LSU_MATCH    = 67;
parameter AIQ1_SRC0_DATA         = 66;
parameter AIQ1_SRC0_PREG         = 66;
parameter AIQ1_SRC0_WB           = 59;
parameter AIQ1_SRC0_RDY          = 58;
parameter AIQ1_DST_VREG          = 57;
parameter AIQ1_DST_PREG          = 50;
parameter AIQ1_DSTV_VLD          = 43;
parameter AIQ1_DST_VLD           = 42;
parameter AIQ1_SRC2_VLD          = 41;
parameter AIQ1_SRC1_VLD          = 40;
parameter AIQ1_SRC0_VLD          = 39;
parameter AIQ1_IID               = 38;
parameter AIQ1_OPCODE            = 31;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry_clk_en = x_create_gateclk_en || vld;
// &Instance("gated_clk_cell", "x_entry_gated_clk"); @82
gated_clk_cell  x_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry_clk_en      ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @83
//          .external_en (1'b0), @84
//          .global_en   (cp0_yy_clk_en), @85
//          .module_en   (cp0_idu_icg_en), @86
//          .local_en    (entry_clk_en), @87
//          .clk_out     (entry_clk)); @88

assign create_clk_en = x_create_gateclk_en;
// &Instance("gated_clk_cell", "x_create_gated_clk"); @91
gated_clk_cell  x_create_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_clk_en     ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @92
//          .external_en (1'b0), @93
//          .global_en   (cp0_yy_clk_en), @94
//          .module_en   (cp0_idu_icg_en), @95
//          .local_en    (create_clk_en), @96
//          .clk_out     (create_clk)); @97

assign create_preg_clk_en = x_create_gateclk_en && x_create_data[AIQ1_DST_VLD];
// &Instance("gated_clk_cell", "x_create_preg_gated_clk"); @100
gated_clk_cell  x_create_preg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_preg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_preg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @101
//          .external_en (1'b0), @102
//          .global_en   (cp0_yy_clk_en), @103
//          .module_en   (cp0_idu_icg_en), @104
//          .local_en    (create_preg_clk_en), @105
//          .clk_out     (create_preg_clk)); @106

assign create_vreg_clk_en = x_create_gateclk_en && x_create_data[AIQ1_DSTV_VLD];
// &Instance("gated_clk_cell", "x_create_vreg_gated_clk"); @109
gated_clk_cell  x_create_vreg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_vreg_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_vreg_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @110
//          .external_en (1'b0), @111
//          .global_en   (cp0_yy_clk_en), @112
//          .module_en   (cp0_idu_icg_en), @113
//          .local_en    (create_vreg_clk_en), @114
//          .clk_out     (create_vreg_clk)); @115

assign lch_rdy_aiq0_clk_en = x_create_gateclk_en
                             || vld && (ctrl_aiq0_create0_gateclk_en
                                     || ctrl_aiq0_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_aiq0_gated_clk"); @120
gated_clk_cell  x_lch_rdy_aiq0_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_aiq0_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_aiq0_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @121
//          .external_en (1'b0), @122
//          .global_en   (cp0_yy_clk_en), @123
//          .module_en   (cp0_idu_icg_en), @124
//          .local_en    (lch_rdy_aiq0_clk_en), @125
//          .clk_out     (lch_rdy_aiq0_clk)); @126

assign lch_rdy_aiq1_clk_en = x_create_gateclk_en
                             || vld && (ctrl_aiq1_create0_gateclk_en
                                     || ctrl_aiq1_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_aiq1_gated_clk"); @131
gated_clk_cell  x_lch_rdy_aiq1_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_aiq1_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_aiq1_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @132
//          .external_en (1'b0), @133
//          .global_en   (cp0_yy_clk_en), @134
//          .module_en   (cp0_idu_icg_en), @135
//          .local_en    (lch_rdy_aiq1_clk_en), @136
//          .clk_out     (lch_rdy_aiq1_clk)); @137

assign lch_rdy_biq_clk_en = x_create_gateclk_en
                            || vld && (ctrl_biq_create0_gateclk_en
                                    || ctrl_biq_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_biq_gated_clk"); @142
gated_clk_cell  x_lch_rdy_biq_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lch_rdy_biq_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lch_rdy_biq_clk_en),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @143
//          .external_en (1'b0), @144
//          .global_en   (cp0_yy_clk_en), @145
//          .module_en   (cp0_idu_icg_en), @146
//          .local_en    (lch_rdy_biq_clk_en), @147
//          .clk_out     (lch_rdy_biq_clk)); @148

assign lch_rdy_lsiq_clk_en = x_create_gateclk_en
                             || vld && (ctrl_lsiq_create0_gateclk_en
                                     || ctrl_lsiq_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_lsiq_gated_clk"); @153
gated_clk_cell  x_lch_rdy_lsiq_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_lsiq_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_lsiq_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @154
//          .external_en (1'b0), @155
//          .global_en   (cp0_yy_clk_en), @156
//          .module_en   (cp0_idu_icg_en), @157
//          .local_en    (lch_rdy_lsiq_clk_en), @158
//          .clk_out     (lch_rdy_lsiq_clk)); @159

assign lch_rdy_sdiq_clk_en = x_create_gateclk_en
                             || vld && (ctrl_sdiq_create0_gateclk_en
                                     || ctrl_sdiq_create1_gateclk_en);
// &Instance("gated_clk_cell", "x_lch_rdy_sdiq_gated_clk"); @164
gated_clk_cell  x_lch_rdy_sdiq_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (lch_rdy_sdiq_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (lch_rdy_sdiq_clk_en),
  .module_en           (cp0_idu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @165
//          .external_en (1'b0), @166
//          .global_en   (cp0_yy_clk_en), @167
//          .module_en   (cp0_idu_icg_en), @168
//          .local_en    (lch_rdy_sdiq_clk_en), @169
//          .clk_out     (lch_rdy_sdiq_clk)); @170

//if entry is not valid, shut down dep info clock
assign gateclk_entry_vld = vld;

//==========================================================
//                  Create and Read Bus
//==========================================================
//force create and read bus width
// &Force("bus","x_create_data",AIQ1_WIDTH-1,0); @179
// &Force("bus","x_read_data",AIQ1_WIDTH-1,0); @180
// &Force("output","x_read_data"); @181

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
  else if(ctrl_aiq1_rf_pop_vld && x_pop_cur_entry)
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
  else if(x_frz_clr)
    frz <= 1'b0;
  else if(x_issue_en)
    frz <= 1'b1;
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
  else if(ctrl_aiq1_rf_pop_vld)
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
    dst_preg[6:0]      <= x_create_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6];
  else
    dst_preg[6:0]      <= dst_preg[6:0];
end

always @(posedge create_vreg_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dst_vreg[6:0]      <= 7'b0;
  else if(x_create_dp_en)
    dst_vreg[6:0]      <= x_create_data[AIQ1_DST_VREG:AIQ1_DST_VREG-6];
  else
    dst_vreg[6:0]      <= dst_vreg[6:0];
end

always @(posedge create_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    opcode[31:0]       <= 32'b0;
    iid[6:0]           <= 7'b0;
    src0_vld           <= 1'b0;
    src1_vld           <= 1'b0;
    src2_vld           <= 1'b0;
    dst_vld            <= 1'b0;
    dstv_vld           <= 1'b0;
    mtvr               <= 1'b0;
    mla                <= 1'b0;
    alu_short          <= 1'b0;
    vlmul[1:0]         <= 2'b0;
    vsew[2:0]          <= 3'b0;
    vl[7:0]            <= 8'b0;
    lch_preg           <= 1'b0;
  end
  else if(x_create_dp_en) begin
    opcode[31:0]       <= x_create_data[AIQ1_OPCODE:AIQ1_OPCODE-31];
    iid[6:0]           <= x_create_data[AIQ1_IID:AIQ1_IID-6];
    src0_vld           <= x_create_data[AIQ1_SRC0_VLD];
    src1_vld           <= x_create_data[AIQ1_SRC1_VLD];
    src2_vld           <= x_create_data[AIQ1_SRC2_VLD];
    dst_vld            <= x_create_data[AIQ1_DST_VLD];
    dstv_vld           <= x_create_data[AIQ1_DSTV_VLD];
    mtvr               <= x_create_data[AIQ1_MTVR];
    mla                <= x_create_data[AIQ1_MLA];
    alu_short          <= x_create_data[AIQ1_ALU_SHORT];
    vlmul[1:0]         <= x_create_data[AIQ1_VLMUL:AIQ1_VLMUL-1];
    vsew[2:0]          <= x_create_data[AIQ1_VSEW:AIQ1_VSEW-2];
    vl[7:0]            <= x_create_data[AIQ1_VL:AIQ1_VL-7];
    lch_preg           <= x_create_data[AIQ1_LCH_PREG];
  end
  else begin
    opcode[31:0]       <= opcode[31:0];
    iid[6:0]           <= iid[6:0];
    src0_vld           <= src0_vld;
    src1_vld           <= src1_vld;
    src2_vld           <= src2_vld;
    dst_vld            <= dst_vld;
    dstv_vld           <= dstv_vld;
    mtvr               <= mtvr;
    mla                <= mla;
    alu_short          <= alu_short;
    vlmul[1:0]         <= vlmul[1:0];
    vsew[2:0]          <= vsew[2:0];
    vl[7:0]            <= vl[7:0];
    lch_preg           <= lch_preg;
  end
end

//rename for read output
assign x_read_data[AIQ1_OPCODE:AIQ1_OPCODE-31]    = opcode[31:0];
assign x_read_data[AIQ1_IID:AIQ1_IID-6]           = iid[6:0];
assign x_read_data[AIQ1_SRC0_VLD]                 = src0_vld;
assign x_read_data[AIQ1_SRC1_VLD]                 = src1_vld;
assign x_read_data[AIQ1_SRC2_VLD]                 = src2_vld;
assign x_read_data[AIQ1_DST_VLD]                  = dst_vld;
assign x_read_data[AIQ1_DSTV_VLD]                 = dstv_vld;
assign x_read_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6] = dst_preg[6:0];
assign x_read_data[AIQ1_DST_VREG:AIQ1_DST_VREG-6] = dst_vreg[6:0];
assign x_read_data[AIQ1_MTVR]                     = mtvr;
assign x_read_data[AIQ1_MLA]                      = mla;
assign x_read_data[AIQ1_ALU_SHORT]                = alu_short;
assign x_read_data[AIQ1_VLMUL:AIQ1_VLMUL-1]       = vlmul[1:0];
assign x_read_data[AIQ1_VSEW:AIQ1_VSEW-2]         = vsew[2:0];
assign x_read_data[AIQ1_VL:AIQ1_VL-7]             = vl[7:0];
assign x_read_data[AIQ1_LCH_PREG]                 = lch_preg;

//==========================================================
//              Source Dependency Information
//==========================================================
assign src0_rdy_clr = x_frz_clr && dp_aiq1_rf_rdy_clr[0];
assign src1_rdy_clr = x_frz_clr && dp_aiq1_rf_rdy_clr[1];
assign src2_rdy_clr = x_frz_clr && dp_aiq1_rf_rdy_clr[2];

//------------------------source 0--------------------------
assign create_src0_gateclk_en = x_create_gateclk_en && x_create_data[AIQ1_SRC0_VLD];
assign create_src0_data[9]    = x_create_data[AIQ1_SRC0_LSU_MATCH];
assign create_src0_data[8:0]  = x_create_data[AIQ1_SRC0_DATA:AIQ1_SRC0_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_aiq1_src0_entry"); @339
ct_idu_dep_reg_entry  x_ct_idu_is_aiq1_src0_entry (
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

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @340
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[0]), @341
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[0]), @342
//          .x_write_en               (x_create_dp_en), @343
//          .x_gateclk_write_en       (x_create_gateclk_en), @344
//          .x_gateclk_idx_write_en   (create_src0_gateclk_en), @345
//          .x_create_data            (create_src0_data[9:0]), @346
//          .x_read_data              (read_src0_data[11:0]), @347
//          .x_rdy_clr                (src0_rdy_clr) @348
//         ); @349
assign x_read_data[AIQ1_SRC0_WB]                    = read_src0_data[1];
assign x_read_data[AIQ1_SRC0_PREG:AIQ1_SRC0_PREG-6] = read_src0_data[8:2];
assign src0_rdy_for_issue                           = read_src0_data[9];
assign x_read_data[AIQ1_SRC0_RDY]                   = 1'b0;
assign x_read_data[AIQ1_SRC0_LSU_MATCH]             = 1'b0;

//------------------------source 1--------------------------
assign create_src1_gateclk_en = x_create_gateclk_en && x_create_data[AIQ1_SRC1_VLD];
assign create_src1_data[9]    = x_create_data[AIQ1_SRC1_LSU_MATCH];
assign create_src1_data[8:0]  = x_create_data[AIQ1_SRC1_DATA:AIQ1_SRC1_DATA-8];
// &Instance("ct_idu_dep_reg_entry", "x_ct_idu_is_aiq1_src1_entry"); @360
ct_idu_dep_reg_entry  x_ct_idu_is_aiq1_src1_entry (
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

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @361
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[1]), @362
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[1]), @363
//          .x_write_en               (x_create_dp_en), @364
//          .x_gateclk_write_en       (x_create_gateclk_en), @365
//          .x_gateclk_idx_write_en   (create_src1_gateclk_en), @366
//          .x_create_data            (create_src1_data[9:0]), @367
//          .x_read_data              (read_src1_data[11:0]), @368
//          .x_rdy_clr                (src1_rdy_clr) @369
//         ); @370
assign x_read_data[AIQ1_SRC1_WB]                    = read_src1_data[1];
assign x_read_data[AIQ1_SRC1_PREG:AIQ1_SRC1_PREG-6] = read_src1_data[8:2];
assign src1_rdy_for_issue                           = read_src1_data[9];
assign x_read_data[AIQ1_SRC1_RDY]                   = 1'b0;
assign x_read_data[AIQ1_SRC1_LSU_MATCH]             = 1'b0;

//------------------------source 2--------------------------
assign create_src2_gateclk_en = x_create_gateclk_en && x_create_data[AIQ1_SRC2_VLD];
assign create_src2_data[10]   = x_create_data[AIQ1_SRC2_LSU_MATCH];
assign create_src2_data[9:0]  = x_create_data[AIQ1_SRC2_DATA:AIQ1_SRC2_DATA-9];
// &Instance("ct_idu_dep_reg_src2_entry", "x_ct_idu_is_aiq1_src2_entry"); @381
ct_idu_dep_reg_src2_entry  x_ct_idu_is_aiq1_src2_entry (
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
  .mla_reg_fwd_vld                         (x_mla_fwd_vld                          ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_create_data                           (create_src2_data[10:0]                 ),
  .x_entry_mla                             (x_read_data[90]                        ),
  .x_gateclk_idx_write_en                  (create_src2_gateclk_en                 ),
  .x_gateclk_write_en                      (x_create_gateclk_en                    ),
  .x_rdy_clr                               (src2_rdy_clr                           ),
  .x_read_data                             (read_src2_data[12:0]                   ),
  .x_write_en                              (x_create_dp_en                         )
);

// &Connect(.gateclk_entry_vld        (gateclk_entry_vld), @382
//          .alu0_reg_fwd_vld         (x_alu0_reg_fwd_vld[2]), @383
//          .alu1_reg_fwd_vld         (x_alu1_reg_fwd_vld[2]), @384
//          .mla_reg_fwd_vld          (x_mla_fwd_vld), @385
//          .x_write_en               (x_create_dp_en), @386
//          .x_gateclk_write_en       (x_create_gateclk_en), @387
//          .x_gateclk_idx_write_en   (create_src2_gateclk_en), @388
//          .x_create_data            (create_src2_data[10:0]), @389
//          .x_read_data              (read_src2_data[12:0]), @390
//          .x_entry_mla              (x_read_data[AIQ1_MLA]), @391
//          .x_rdy_clr                (src2_rdy_clr) @392
//         ); @393
assign x_read_data[AIQ1_SRC2_WB]                    = read_src2_data[1];
assign x_read_data[AIQ1_SRC2_PREG:AIQ1_SRC2_PREG-6] = read_src2_data[8:2];
assign src2_rdy_for_issue                           = read_src2_data[10];
assign x_read_data[AIQ1_SRC2_RDY]                   = 1'b0;
assign x_read_data[AIQ1_SRC2_DATA]                  = 1'b0;
assign x_read_data[AIQ1_SRC2_LSU_MATCH]             = 1'b0;

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
// &CombBeg; @423
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
// &CombEnd; @431
end

// &CombBeg; @433
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
// &CombEnd; @441
end

assign lch_rdy_aiq0_create0_dp_en = ctrl_aiq0_create0_dp_en;
assign lch_rdy_aiq0_create1_dp_en = ctrl_aiq0_create1_dp_en;

assign aiq0_entry0_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-21:AIQ1_LCH_RDY_AIQ0-23];
assign aiq0_entry1_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-18:AIQ1_LCH_RDY_AIQ0-20];
assign aiq0_entry2_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-15:AIQ1_LCH_RDY_AIQ0-17];
assign aiq0_entry3_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-12:AIQ1_LCH_RDY_AIQ0-14];
assign aiq0_entry4_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-9:AIQ1_LCH_RDY_AIQ0-11];
assign aiq0_entry5_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-6:AIQ1_LCH_RDY_AIQ0-8];
assign aiq0_entry6_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-3:AIQ1_LCH_RDY_AIQ0-5];
assign aiq0_entry7_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ0-0:AIQ1_LCH_RDY_AIQ0-2];

assign aiq0_entry0_create_entry[1:0] = {aiq0_aiq_create1_entry[0],aiq0_aiq_create0_entry[0]};
assign aiq0_entry1_create_entry[1:0] = {aiq0_aiq_create1_entry[1],aiq0_aiq_create0_entry[1]};
assign aiq0_entry2_create_entry[1:0] = {aiq0_aiq_create1_entry[2],aiq0_aiq_create0_entry[2]};
assign aiq0_entry3_create_entry[1:0] = {aiq0_aiq_create1_entry[3],aiq0_aiq_create0_entry[3]};
assign aiq0_entry4_create_entry[1:0] = {aiq0_aiq_create1_entry[4],aiq0_aiq_create0_entry[4]};
assign aiq0_entry5_create_entry[1:0] = {aiq0_aiq_create1_entry[5],aiq0_aiq_create0_entry[5]};
assign aiq0_entry6_create_entry[1:0] = {aiq0_aiq_create1_entry[6],aiq0_aiq_create0_entry[6]};
assign aiq0_entry7_create_entry[1:0] = {aiq0_aiq_create1_entry[7],aiq0_aiq_create0_entry[7]};

// &ConnRule(s/^y_/lch_rdy_aiq0_/); @464
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry0"); @465
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

// &Connect(.x_create_entry   (aiq0_entry0_create_entry[1:0]), @466
//          .x_create_lch_rdy (aiq0_entry0_create_lch_rdy[2:0]), @467
//          .x_read_lch_rdy   (aiq0_entry0_read_lch_rdy[2:0])   ); @468
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @469
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry1"); @470
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

// &Connect(.x_create_entry   (aiq0_entry1_create_entry[1:0]), @471
//          .x_create_lch_rdy (aiq0_entry1_create_lch_rdy[2:0]), @472
//          .x_read_lch_rdy   (aiq0_entry1_read_lch_rdy[2:0])   ); @473
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @474
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry2"); @475
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

// &Connect(.x_create_entry   (aiq0_entry2_create_entry[1:0]), @476
//          .x_create_lch_rdy (aiq0_entry2_create_lch_rdy[2:0]), @477
//          .x_read_lch_rdy   (aiq0_entry2_read_lch_rdy[2:0])   ); @478
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @479
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry3"); @480
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

// &Connect(.x_create_entry   (aiq0_entry3_create_entry[1:0]), @481
//          .x_create_lch_rdy (aiq0_entry3_create_lch_rdy[2:0]), @482
//          .x_read_lch_rdy   (aiq0_entry3_read_lch_rdy[2:0])   ); @483
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @484
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry4"); @485
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

// &Connect(.x_create_entry   (aiq0_entry4_create_entry[1:0]), @486
//          .x_create_lch_rdy (aiq0_entry4_create_lch_rdy[2:0]), @487
//          .x_read_lch_rdy   (aiq0_entry4_read_lch_rdy[2:0])   ); @488
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @489
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry5"); @490
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

// &Connect(.x_create_entry   (aiq0_entry5_create_entry[1:0]), @491
//          .x_create_lch_rdy (aiq0_entry5_create_lch_rdy[2:0]), @492
//          .x_read_lch_rdy   (aiq0_entry5_read_lch_rdy[2:0])   ); @493
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @494
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry6"); @495
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

// &Connect(.x_create_entry   (aiq0_entry6_create_entry[1:0]), @496
//          .x_create_lch_rdy (aiq0_entry6_create_lch_rdy[2:0]), @497
//          .x_read_lch_rdy   (aiq0_entry6_read_lch_rdy[2:0])   ); @498
// &ConnRule(s/^y_/lch_rdy_aiq0_/); @499
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq0_entry7"); @500
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

// &Connect(.x_create_entry   (aiq0_entry7_create_entry[1:0]), @501
//          .x_create_lch_rdy (aiq0_entry7_create_lch_rdy[2:0]), @502
//          .x_read_lch_rdy   (aiq0_entry7_read_lch_rdy[2:0])   ); @503

assign x_read_data[AIQ1_LCH_RDY_AIQ0-21:AIQ1_LCH_RDY_AIQ0-23] = aiq0_entry0_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ0-18:AIQ1_LCH_RDY_AIQ0-20] = aiq0_entry1_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ0-15:AIQ1_LCH_RDY_AIQ0-17] = aiq0_entry2_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ0-12:AIQ1_LCH_RDY_AIQ0-14] = aiq0_entry3_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ0-9:AIQ1_LCH_RDY_AIQ0-11]  = aiq0_entry4_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ0-6:AIQ1_LCH_RDY_AIQ0-8]   = aiq0_entry5_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ0-3:AIQ1_LCH_RDY_AIQ0-5]   = aiq0_entry6_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ0-0:AIQ1_LCH_RDY_AIQ0-2]   = aiq0_entry7_read_lch_rdy[2:0];

//----------------------------------------------------------
//                   AIQ1 create update
//----------------------------------------------------------
// &CombBeg; @517
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
// &CombEnd; @525
end

// &CombBeg; @527
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
// &CombEnd; @535
end

assign lch_rdy_aiq1_create0_dp_en = ctrl_aiq1_create0_dp_en;
assign lch_rdy_aiq1_create1_dp_en = ctrl_aiq1_create1_dp_en;

assign aiq1_entry0_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-21:AIQ1_LCH_RDY_AIQ1-23];
assign aiq1_entry1_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-18:AIQ1_LCH_RDY_AIQ1-20];
assign aiq1_entry2_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-15:AIQ1_LCH_RDY_AIQ1-17];
assign aiq1_entry3_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-12:AIQ1_LCH_RDY_AIQ1-14];
assign aiq1_entry4_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-9:AIQ1_LCH_RDY_AIQ1-11];
assign aiq1_entry5_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-6:AIQ1_LCH_RDY_AIQ1-8];
assign aiq1_entry6_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-3:AIQ1_LCH_RDY_AIQ1-5];
assign aiq1_entry7_create_lch_rdy[2:0] = x_create_data[AIQ1_LCH_RDY_AIQ1-0:AIQ1_LCH_RDY_AIQ1-2];

assign aiq1_entry0_create_entry[1:0] = {aiq1_aiq_create1_entry[0],aiq1_aiq_create0_entry[0]};
assign aiq1_entry1_create_entry[1:0] = {aiq1_aiq_create1_entry[1],aiq1_aiq_create0_entry[1]};
assign aiq1_entry2_create_entry[1:0] = {aiq1_aiq_create1_entry[2],aiq1_aiq_create0_entry[2]};
assign aiq1_entry3_create_entry[1:0] = {aiq1_aiq_create1_entry[3],aiq1_aiq_create0_entry[3]};
assign aiq1_entry4_create_entry[1:0] = {aiq1_aiq_create1_entry[4],aiq1_aiq_create0_entry[4]};
assign aiq1_entry5_create_entry[1:0] = {aiq1_aiq_create1_entry[5],aiq1_aiq_create0_entry[5]};
assign aiq1_entry6_create_entry[1:0] = {aiq1_aiq_create1_entry[6],aiq1_aiq_create0_entry[6]};
assign aiq1_entry7_create_entry[1:0] = {aiq1_aiq_create1_entry[7],aiq1_aiq_create0_entry[7]};

// &ConnRule(s/^y_/lch_rdy_aiq1_/); @558
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry0"); @559
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

// &Connect(.x_create_entry   (aiq1_entry0_create_entry[1:0]), @560
//          .x_create_lch_rdy (aiq1_entry0_create_lch_rdy[2:0]), @561
//          .x_read_lch_rdy   (aiq1_entry0_read_lch_rdy[2:0])   ); @562
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @563
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry1"); @564
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

// &Connect(.x_create_entry   (aiq1_entry1_create_entry[1:0]), @565
//          .x_create_lch_rdy (aiq1_entry1_create_lch_rdy[2:0]), @566
//          .x_read_lch_rdy   (aiq1_entry1_read_lch_rdy[2:0])   ); @567
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @568
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry2"); @569
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

// &Connect(.x_create_entry   (aiq1_entry2_create_entry[1:0]), @570
//          .x_create_lch_rdy (aiq1_entry2_create_lch_rdy[2:0]), @571
//          .x_read_lch_rdy   (aiq1_entry2_read_lch_rdy[2:0])   ); @572
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @573
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry3"); @574
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

// &Connect(.x_create_entry   (aiq1_entry3_create_entry[1:0]), @575
//          .x_create_lch_rdy (aiq1_entry3_create_lch_rdy[2:0]), @576
//          .x_read_lch_rdy   (aiq1_entry3_read_lch_rdy[2:0])   ); @577
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @578
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry4"); @579
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

// &Connect(.x_create_entry   (aiq1_entry4_create_entry[1:0]), @580
//          .x_create_lch_rdy (aiq1_entry4_create_lch_rdy[2:0]), @581
//          .x_read_lch_rdy   (aiq1_entry4_read_lch_rdy[2:0])   ); @582
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @583
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry5"); @584
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

// &Connect(.x_create_entry   (aiq1_entry5_create_entry[1:0]), @585
//          .x_create_lch_rdy (aiq1_entry5_create_lch_rdy[2:0]), @586
//          .x_read_lch_rdy   (aiq1_entry5_read_lch_rdy[2:0])   ); @587
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @588
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry6"); @589
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

// &Connect(.x_create_entry   (aiq1_entry6_create_entry[1:0]), @590
//          .x_create_lch_rdy (aiq1_entry6_create_lch_rdy[2:0]), @591
//          .x_read_lch_rdy   (aiq1_entry6_read_lch_rdy[2:0])   ); @592
// &ConnRule(s/^y_/lch_rdy_aiq1_/); @593
// &Instance("ct_idu_is_aiq_lch_rdy_3", "x_ct_idu_is_aiq_lch_rdy_3_aiq1_entry7"); @594
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

// &Connect(.x_create_entry   (aiq1_entry7_create_entry[1:0]), @595
//          .x_create_lch_rdy (aiq1_entry7_create_lch_rdy[2:0]), @596
//          .x_read_lch_rdy   (aiq1_entry7_read_lch_rdy[2:0])   ); @597

assign x_read_data[AIQ1_LCH_RDY_AIQ1-21:AIQ1_LCH_RDY_AIQ1-23] = aiq1_entry0_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ1-18:AIQ1_LCH_RDY_AIQ1-20] = aiq1_entry1_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ1-15:AIQ1_LCH_RDY_AIQ1-17] = aiq1_entry2_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ1-12:AIQ1_LCH_RDY_AIQ1-14] = aiq1_entry3_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ1-9:AIQ1_LCH_RDY_AIQ1-11]  = aiq1_entry4_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ1-6:AIQ1_LCH_RDY_AIQ1-8]   = aiq1_entry5_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ1-3:AIQ1_LCH_RDY_AIQ1-5]   = aiq1_entry6_read_lch_rdy[2:0];
assign x_read_data[AIQ1_LCH_RDY_AIQ1-0:AIQ1_LCH_RDY_AIQ1-2]   = aiq1_entry7_read_lch_rdy[2:0];

//----------------------------------------------------------
//                   BIQ create update
//----------------------------------------------------------
// &CombBeg; @611
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
// &CombEnd; @619
end

// &CombBeg; @621
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
// &CombEnd; @629
end

assign lch_rdy_biq_create0_dp_en = ctrl_biq_create0_dp_en;
assign lch_rdy_biq_create1_dp_en = ctrl_biq_create1_dp_en;

assign biq_entry0_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-22:AIQ1_LCH_RDY_BIQ-23];
assign biq_entry1_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-20:AIQ1_LCH_RDY_BIQ-21];
assign biq_entry2_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-18:AIQ1_LCH_RDY_BIQ-19];
assign biq_entry3_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-16:AIQ1_LCH_RDY_BIQ-17];
assign biq_entry4_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-14:AIQ1_LCH_RDY_BIQ-15];
assign biq_entry5_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-12:AIQ1_LCH_RDY_BIQ-13];
assign biq_entry6_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-10:AIQ1_LCH_RDY_BIQ-11];
assign biq_entry7_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-8:AIQ1_LCH_RDY_BIQ-9];
assign biq_entry8_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-6:AIQ1_LCH_RDY_BIQ-7];
assign biq_entry9_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_BIQ-4:AIQ1_LCH_RDY_BIQ-5];
assign biq_entry10_create_lch_rdy[1:0] = x_create_data[AIQ1_LCH_RDY_BIQ-2:AIQ1_LCH_RDY_BIQ-3];
assign biq_entry11_create_lch_rdy[1:0] = x_create_data[AIQ1_LCH_RDY_BIQ-0:AIQ1_LCH_RDY_BIQ-1];

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

// &ConnRule(s/^y_/lch_rdy_biq_/); @660
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry0"); @661
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

// &Connect(.x_create_entry   (biq_entry0_create_entry[1:0]), @662
//          .x_create_lch_rdy (biq_entry0_create_lch_rdy[1:0]), @663
//          .x_read_lch_rdy   (biq_entry0_read_lch_rdy[1:0])   ); @664
// &ConnRule(s/^y_/lch_rdy_biq_/); @665
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry1"); @666
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

// &Connect(.x_create_entry   (biq_entry1_create_entry[1:0]), @667
//          .x_create_lch_rdy (biq_entry1_create_lch_rdy[1:0]), @668
//          .x_read_lch_rdy   (biq_entry1_read_lch_rdy[1:0])   ); @669
// &ConnRule(s/^y_/lch_rdy_biq_/); @670
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry2"); @671
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

// &Connect(.x_create_entry   (biq_entry2_create_entry[1:0]), @672
//          .x_create_lch_rdy (biq_entry2_create_lch_rdy[1:0]), @673
//          .x_read_lch_rdy   (biq_entry2_read_lch_rdy[1:0])   ); @674
// &ConnRule(s/^y_/lch_rdy_biq_/); @675
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry3"); @676
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

// &Connect(.x_create_entry   (biq_entry3_create_entry[1:0]), @677
//          .x_create_lch_rdy (biq_entry3_create_lch_rdy[1:0]), @678
//          .x_read_lch_rdy   (biq_entry3_read_lch_rdy[1:0])   ); @679
// &ConnRule(s/^y_/lch_rdy_biq_/); @680
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry4"); @681
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

// &Connect(.x_create_entry   (biq_entry4_create_entry[1:0]), @682
//          .x_create_lch_rdy (biq_entry4_create_lch_rdy[1:0]), @683
//          .x_read_lch_rdy   (biq_entry4_read_lch_rdy[1:0])   ); @684
// &ConnRule(s/^y_/lch_rdy_biq_/); @685
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry5"); @686
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

// &Connect(.x_create_entry   (biq_entry5_create_entry[1:0]), @687
//          .x_create_lch_rdy (biq_entry5_create_lch_rdy[1:0]), @688
//          .x_read_lch_rdy   (biq_entry5_read_lch_rdy[1:0])   ); @689
// &ConnRule(s/^y_/lch_rdy_biq_/); @690
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry6"); @691
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

// &Connect(.x_create_entry   (biq_entry6_create_entry[1:0]), @692
//          .x_create_lch_rdy (biq_entry6_create_lch_rdy[1:0]), @693
//          .x_read_lch_rdy   (biq_entry6_read_lch_rdy[1:0])   ); @694
// &ConnRule(s/^y_/lch_rdy_biq_/); @695
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry7"); @696
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

// &Connect(.x_create_entry   (biq_entry7_create_entry[1:0]), @697
//          .x_create_lch_rdy (biq_entry7_create_lch_rdy[1:0]), @698
//          .x_read_lch_rdy   (biq_entry7_read_lch_rdy[1:0])   ); @699
// &ConnRule(s/^y_/lch_rdy_biq_/); @700
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry8"); @701
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

// &Connect(.x_create_entry   (biq_entry8_create_entry[1:0]), @702
//          .x_create_lch_rdy (biq_entry8_create_lch_rdy[1:0]), @703
//          .x_read_lch_rdy   (biq_entry8_read_lch_rdy[1:0])   ); @704
// &ConnRule(s/^y_/lch_rdy_biq_/); @705
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry9"); @706
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

// &Connect(.x_create_entry   (biq_entry9_create_entry[1:0]), @707
//          .x_create_lch_rdy (biq_entry9_create_lch_rdy[1:0]), @708
//          .x_read_lch_rdy   (biq_entry9_read_lch_rdy[1:0])   ); @709
// &ConnRule(s/^y_/lch_rdy_biq_/); @710
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry10"); @711
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

// &Connect(.x_create_entry   (biq_entry10_create_entry[1:0]), @712
//          .x_create_lch_rdy (biq_entry10_create_lch_rdy[1:0]), @713
//          .x_read_lch_rdy   (biq_entry10_read_lch_rdy[1:0])   ); @714
// &ConnRule(s/^y_/lch_rdy_biq_/); @715
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_biq_entry11"); @716
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

// &Connect(.x_create_entry   (biq_entry11_create_entry[1:0]), @717
//          .x_create_lch_rdy (biq_entry11_create_lch_rdy[1:0]), @718
//          .x_read_lch_rdy   (biq_entry11_read_lch_rdy[1:0])   ); @719

assign x_read_data[AIQ1_LCH_RDY_BIQ-22:AIQ1_LCH_RDY_BIQ-23] = biq_entry0_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-20:AIQ1_LCH_RDY_BIQ-21] = biq_entry1_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-18:AIQ1_LCH_RDY_BIQ-19] = biq_entry2_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-16:AIQ1_LCH_RDY_BIQ-17] = biq_entry3_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-14:AIQ1_LCH_RDY_BIQ-15] = biq_entry4_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-12:AIQ1_LCH_RDY_BIQ-13] = biq_entry5_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-10:AIQ1_LCH_RDY_BIQ-11] = biq_entry6_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-8:AIQ1_LCH_RDY_BIQ-9]   = biq_entry7_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-6:AIQ1_LCH_RDY_BIQ-7]   = biq_entry8_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-4:AIQ1_LCH_RDY_BIQ-5]   = biq_entry9_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-2:AIQ1_LCH_RDY_BIQ-3]   = biq_entry10_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_BIQ-0:AIQ1_LCH_RDY_BIQ-1]   = biq_entry11_read_lch_rdy[1:0];

//----------------------------------------------------------
//                   AIQ1 create update
//----------------------------------------------------------
// &CombBeg; @737
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
// &CombEnd; @745
end

// &CombBeg; @747
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
// &CombEnd; @755
end

assign lch_rdy_lsiq_create0_dp_en = ctrl_lsiq_create0_dp_en;
assign lch_rdy_lsiq_create1_dp_en = ctrl_lsiq_create1_dp_en;

assign lsiq_entry0_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-22:AIQ1_LCH_RDY_LSIQ-23];
assign lsiq_entry1_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-20:AIQ1_LCH_RDY_LSIQ-21];
assign lsiq_entry2_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-18:AIQ1_LCH_RDY_LSIQ-19];
assign lsiq_entry3_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-16:AIQ1_LCH_RDY_LSIQ-17];
assign lsiq_entry4_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-14:AIQ1_LCH_RDY_LSIQ-15];
assign lsiq_entry5_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-12:AIQ1_LCH_RDY_LSIQ-13];
assign lsiq_entry6_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-10:AIQ1_LCH_RDY_LSIQ-11];
assign lsiq_entry7_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-8:AIQ1_LCH_RDY_LSIQ-9];
assign lsiq_entry8_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-6:AIQ1_LCH_RDY_LSIQ-7];
assign lsiq_entry9_create_lch_rdy[1:0]  = x_create_data[AIQ1_LCH_RDY_LSIQ-4:AIQ1_LCH_RDY_LSIQ-5];
assign lsiq_entry10_create_lch_rdy[1:0] = x_create_data[AIQ1_LCH_RDY_LSIQ-2:AIQ1_LCH_RDY_LSIQ-3];
assign lsiq_entry11_create_lch_rdy[1:0] = x_create_data[AIQ1_LCH_RDY_LSIQ-0:AIQ1_LCH_RDY_LSIQ-1];

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

// &ConnRule(s/^y_/lch_rdy_lsiq_/); @786
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry0"); @787
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

// &Connect(.x_create_entry   (lsiq_entry0_create_entry[1:0]), @788
//          .x_create_lch_rdy (lsiq_entry0_create_lch_rdy[1:0]), @789
//          .x_read_lch_rdy   (lsiq_entry0_read_lch_rdy[1:0])   ); @790
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @791
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry1"); @792
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

// &Connect(.x_create_entry   (lsiq_entry1_create_entry[1:0]), @793
//          .x_create_lch_rdy (lsiq_entry1_create_lch_rdy[1:0]), @794
//          .x_read_lch_rdy   (lsiq_entry1_read_lch_rdy[1:0])   ); @795
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @796
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry2"); @797
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

// &Connect(.x_create_entry   (lsiq_entry2_create_entry[1:0]), @798
//          .x_create_lch_rdy (lsiq_entry2_create_lch_rdy[1:0]), @799
//          .x_read_lch_rdy   (lsiq_entry2_read_lch_rdy[1:0])   ); @800
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @801
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry3"); @802
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

// &Connect(.x_create_entry   (lsiq_entry3_create_entry[1:0]), @803
//          .x_create_lch_rdy (lsiq_entry3_create_lch_rdy[1:0]), @804
//          .x_read_lch_rdy   (lsiq_entry3_read_lch_rdy[1:0])   ); @805
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @806
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry4"); @807
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

// &Connect(.x_create_entry   (lsiq_entry4_create_entry[1:0]), @808
//          .x_create_lch_rdy (lsiq_entry4_create_lch_rdy[1:0]), @809
//          .x_read_lch_rdy   (lsiq_entry4_read_lch_rdy[1:0])   ); @810
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @811
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry5"); @812
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

// &Connect(.x_create_entry   (lsiq_entry5_create_entry[1:0]), @813
//          .x_create_lch_rdy (lsiq_entry5_create_lch_rdy[1:0]), @814
//          .x_read_lch_rdy   (lsiq_entry5_read_lch_rdy[1:0])   ); @815
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @816
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry6"); @817
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

// &Connect(.x_create_entry   (lsiq_entry6_create_entry[1:0]), @818
//          .x_create_lch_rdy (lsiq_entry6_create_lch_rdy[1:0]), @819
//          .x_read_lch_rdy   (lsiq_entry6_read_lch_rdy[1:0])   ); @820
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @821
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry7"); @822
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

// &Connect(.x_create_entry   (lsiq_entry7_create_entry[1:0]), @823
//          .x_create_lch_rdy (lsiq_entry7_create_lch_rdy[1:0]), @824
//          .x_read_lch_rdy   (lsiq_entry7_read_lch_rdy[1:0])   ); @825
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @826
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry8"); @827
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

// &Connect(.x_create_entry   (lsiq_entry8_create_entry[1:0]), @828
//          .x_create_lch_rdy (lsiq_entry8_create_lch_rdy[1:0]), @829
//          .x_read_lch_rdy   (lsiq_entry8_read_lch_rdy[1:0])   ); @830
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @831
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry9"); @832
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

// &Connect(.x_create_entry   (lsiq_entry9_create_entry[1:0]), @833
//          .x_create_lch_rdy (lsiq_entry9_create_lch_rdy[1:0]), @834
//          .x_read_lch_rdy   (lsiq_entry9_read_lch_rdy[1:0])   ); @835
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @836
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry10"); @837
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

// &Connect(.x_create_entry   (lsiq_entry10_create_entry[1:0]), @838
//          .x_create_lch_rdy (lsiq_entry10_create_lch_rdy[1:0]), @839
//          .x_read_lch_rdy   (lsiq_entry10_read_lch_rdy[1:0])   ); @840
// &ConnRule(s/^y_/lch_rdy_lsiq_/); @841
// &Instance("ct_idu_is_aiq_lch_rdy_2", "x_ct_idu_is_aiq_lch_rdy_2_lsiq_entry11"); @842
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

// &Connect(.x_create_entry   (lsiq_entry11_create_entry[1:0]), @843
//          .x_create_lch_rdy (lsiq_entry11_create_lch_rdy[1:0]), @844
//          .x_read_lch_rdy   (lsiq_entry11_read_lch_rdy[1:0])   ); @845

assign x_read_data[AIQ1_LCH_RDY_LSIQ-22:AIQ1_LCH_RDY_LSIQ-23] = lsiq_entry0_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-20:AIQ1_LCH_RDY_LSIQ-21] = lsiq_entry1_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-18:AIQ1_LCH_RDY_LSIQ-19] = lsiq_entry2_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-16:AIQ1_LCH_RDY_LSIQ-17] = lsiq_entry3_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-14:AIQ1_LCH_RDY_LSIQ-15] = lsiq_entry4_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-12:AIQ1_LCH_RDY_LSIQ-13] = lsiq_entry5_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-10:AIQ1_LCH_RDY_LSIQ-11] = lsiq_entry6_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-8:AIQ1_LCH_RDY_LSIQ-9]   = lsiq_entry7_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-6:AIQ1_LCH_RDY_LSIQ-7]   = lsiq_entry8_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-4:AIQ1_LCH_RDY_LSIQ-5]   = lsiq_entry9_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-2:AIQ1_LCH_RDY_LSIQ-3]   = lsiq_entry10_read_lch_rdy[1:0];
assign x_read_data[AIQ1_LCH_RDY_LSIQ-0:AIQ1_LCH_RDY_LSIQ-1]   = lsiq_entry11_read_lch_rdy[1:0];

//----------------------------------------------------------
//                   SDIQ create update
//----------------------------------------------------------
// &CombBeg; @863
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
// &CombEnd; @879
end

// &CombBeg; @881
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
// &CombEnd; @897
end

assign lch_rdy_sdiq_create0_dp_en = ctrl_sdiq_create0_dp_en;
assign lch_rdy_sdiq_create1_dp_en = ctrl_sdiq_create1_dp_en;

assign sdiq_entry0_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-11];
assign sdiq_entry1_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-10];
assign sdiq_entry2_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-9];
assign sdiq_entry3_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-8];
assign sdiq_entry4_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-7];
assign sdiq_entry5_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-6];
assign sdiq_entry6_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-5];
assign sdiq_entry7_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-4];
assign sdiq_entry8_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-3];
assign sdiq_entry9_create_lch_rdy  = x_create_data[AIQ1_LCH_RDY_SDIQ-2];
assign sdiq_entry10_create_lch_rdy = x_create_data[AIQ1_LCH_RDY_SDIQ-1];
assign sdiq_entry11_create_lch_rdy = x_create_data[AIQ1_LCH_RDY_SDIQ-0];

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

// &ConnRule(s/^y_/lch_rdy_sdiq_/); @928
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry0"); @929
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

// &Connect(.x_create_entry   (sdiq_entry0_create_entry), @930
//          .x_create_lch_rdy (sdiq_entry0_create_lch_rdy), @931
//          .x_read_lch_rdy   (sdiq_entry0_read_lch_rdy)   ); @932
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @933
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry1"); @934
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

// &Connect(.x_create_entry   (sdiq_entry1_create_entry), @935
//          .x_create_lch_rdy (sdiq_entry1_create_lch_rdy), @936
//          .x_read_lch_rdy   (sdiq_entry1_read_lch_rdy)   ); @937
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @938
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry2"); @939
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

// &Connect(.x_create_entry   (sdiq_entry2_create_entry), @940
//          .x_create_lch_rdy (sdiq_entry2_create_lch_rdy), @941
//          .x_read_lch_rdy   (sdiq_entry2_read_lch_rdy)   ); @942
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @943
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry3"); @944
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

// &Connect(.x_create_entry   (sdiq_entry3_create_entry), @945
//          .x_create_lch_rdy (sdiq_entry3_create_lch_rdy), @946
//          .x_read_lch_rdy   (sdiq_entry3_read_lch_rdy)   ); @947
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @948
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry4"); @949
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

// &Connect(.x_create_entry   (sdiq_entry4_create_entry), @950
//          .x_create_lch_rdy (sdiq_entry4_create_lch_rdy), @951
//          .x_read_lch_rdy   (sdiq_entry4_read_lch_rdy)   ); @952
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @953
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry5"); @954
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

// &Connect(.x_create_entry   (sdiq_entry5_create_entry), @955
//          .x_create_lch_rdy (sdiq_entry5_create_lch_rdy), @956
//          .x_read_lch_rdy   (sdiq_entry5_read_lch_rdy)   ); @957
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @958
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry6"); @959
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

// &Connect(.x_create_entry   (sdiq_entry6_create_entry), @960
//          .x_create_lch_rdy (sdiq_entry6_create_lch_rdy), @961
//          .x_read_lch_rdy   (sdiq_entry6_read_lch_rdy)   ); @962
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @963
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry7"); @964
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

// &Connect(.x_create_entry   (sdiq_entry7_create_entry), @965
//          .x_create_lch_rdy (sdiq_entry7_create_lch_rdy), @966
//          .x_read_lch_rdy   (sdiq_entry7_read_lch_rdy)   ); @967
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @968
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry8"); @969
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

// &Connect(.x_create_entry   (sdiq_entry8_create_entry), @970
//          .x_create_lch_rdy (sdiq_entry8_create_lch_rdy), @971
//          .x_read_lch_rdy   (sdiq_entry8_read_lch_rdy)   ); @972
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @973
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry9"); @974
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

// &Connect(.x_create_entry   (sdiq_entry9_create_entry), @975
//          .x_create_lch_rdy (sdiq_entry9_create_lch_rdy), @976
//          .x_read_lch_rdy   (sdiq_entry9_read_lch_rdy)   ); @977
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @978
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry10"); @979
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

// &Connect(.x_create_entry   (sdiq_entry10_create_entry), @980
//          .x_create_lch_rdy (sdiq_entry10_create_lch_rdy), @981
//          .x_read_lch_rdy   (sdiq_entry10_read_lch_rdy)   ); @982
// &ConnRule(s/^y_/lch_rdy_sdiq_/); @983
// &Instance("ct_idu_is_aiq_lch_rdy_1", "x_ct_idu_is_aiq_lch_rdy_1_sdiq_entry11"); @984
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

// &Connect(.x_create_entry   (sdiq_entry11_create_entry), @985
//          .x_create_lch_rdy (sdiq_entry11_create_lch_rdy), @986
//          .x_read_lch_rdy   (sdiq_entry11_read_lch_rdy)   ); @987

assign x_read_data[AIQ1_LCH_RDY_SDIQ-11] = sdiq_entry0_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-10] = sdiq_entry1_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-9]  = sdiq_entry2_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-8]  = sdiq_entry3_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-7]  = sdiq_entry4_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-6]  = sdiq_entry5_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-5]  = sdiq_entry6_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-4]  = sdiq_entry7_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-3]  = sdiq_entry8_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-2]  = sdiq_entry9_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-1]  = sdiq_entry10_read_lch_rdy;
assign x_read_data[AIQ1_LCH_RDY_SDIQ-0]  = sdiq_entry11_read_lch_rdy;

//==========================================================
//                  Entry Ready Signal
//==========================================================
assign x_rdy = vld
               && !frz
               && !ctrl_aiq1_stall
               && !(lch_preg && iu_idu_ex1_pipe1_mult_stall)
               && src0_rdy_for_issue
               && src1_rdy_for_issue
               && src2_rdy_for_issue;

// &ModuleEnd; @1013
endmodule


