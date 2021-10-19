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
module ct_idu_is_aiq1(
  aiq0_aiq_create0_entry,
  aiq0_aiq_create1_entry,
  aiq1_aiq_create0_entry,
  aiq1_aiq_create1_entry,
  aiq1_ctrl_1_left_updt,
  aiq1_ctrl_empty,
  aiq1_ctrl_entry_cnt_updt_val,
  aiq1_ctrl_entry_cnt_updt_vld,
  aiq1_ctrl_full,
  aiq1_ctrl_full_updt,
  aiq1_ctrl_full_updt_clk_en,
  aiq1_dp_issue_entry,
  aiq1_dp_issue_read_data,
  aiq1_top_aiq1_entry_cnt,
  aiq1_xx_gateclk_issue_en,
  aiq1_xx_issue_en,
  biq_aiq_create0_entry,
  biq_aiq_create1_entry,
  cp0_idu_icg_en,
  cp0_idu_iq_bypass_disable,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_aiq0_create0_dp_en,
  ctrl_aiq0_create0_gateclk_en,
  ctrl_aiq0_create1_dp_en,
  ctrl_aiq0_create1_gateclk_en,
  ctrl_aiq1_create0_dp_en,
  ctrl_aiq1_create0_en,
  ctrl_aiq1_create0_gateclk_en,
  ctrl_aiq1_create1_dp_en,
  ctrl_aiq1_create1_en,
  ctrl_aiq1_create1_gateclk_en,
  ctrl_aiq1_rf_lch_fail_vld,
  ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld,
  ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld,
  ctrl_aiq1_rf_pipe1_mla_reg_lch_vld,
  ctrl_aiq1_rf_pop_dlb_vld,
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
  dp_aiq1_bypass_data,
  dp_aiq1_create0_data,
  dp_aiq1_create1_data,
  dp_aiq1_create_alu,
  dp_aiq1_create_src0_rdy_for_bypass,
  dp_aiq1_create_src1_rdy_for_bypass,
  dp_aiq1_create_src2_rdy_for_bypass,
  dp_aiq1_rf_lch_entry,
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
  rtu_yy_xx_flush,
  sdiq_aiq_create0_entry,
  sdiq_aiq_create1_entry,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx
);

// &Ports; @28
input   [7  :0]  aiq0_aiq_create0_entry;                 
input   [7  :0]  aiq0_aiq_create1_entry;                 
input   [11 :0]  biq_aiq_create0_entry;                  
input   [11 :0]  biq_aiq_create1_entry;                  
input            cp0_idu_icg_en;                         
input            cp0_idu_iq_bypass_disable;              
input            cp0_yy_clk_en;                          
input            cpurst_b;                               
input            ctrl_aiq0_create0_dp_en;                
input            ctrl_aiq0_create0_gateclk_en;           
input            ctrl_aiq0_create1_dp_en;                
input            ctrl_aiq0_create1_gateclk_en;           
input            ctrl_aiq1_create0_dp_en;                
input            ctrl_aiq1_create0_en;                   
input            ctrl_aiq1_create0_gateclk_en;           
input            ctrl_aiq1_create1_dp_en;                
input            ctrl_aiq1_create1_en;                   
input            ctrl_aiq1_create1_gateclk_en;           
input            ctrl_aiq1_rf_lch_fail_vld;              
input   [23 :0]  ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld;     
input   [23 :0]  ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld;     
input   [7  :0]  ctrl_aiq1_rf_pipe1_mla_reg_lch_vld;     
input            ctrl_aiq1_rf_pop_dlb_vld;               
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
input   [213:0]  dp_aiq1_bypass_data;                    
input   [213:0]  dp_aiq1_create0_data;                   
input   [213:0]  dp_aiq1_create1_data;                   
input            dp_aiq1_create_alu;                     
input            dp_aiq1_create_src0_rdy_for_bypass;     
input            dp_aiq1_create_src1_rdy_for_bypass;     
input            dp_aiq1_create_src2_rdy_for_bypass;     
input   [7  :0]  dp_aiq1_rf_lch_entry;                   
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
input            rtu_yy_xx_flush;                        
input   [11 :0]  sdiq_aiq_create0_entry;                 
input   [11 :0]  sdiq_aiq_create1_entry;                 
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
output  [7  :0]  aiq1_aiq_create0_entry;                 
output  [7  :0]  aiq1_aiq_create1_entry;                 
output           aiq1_ctrl_1_left_updt;                  
output           aiq1_ctrl_empty;                        
output  [3  :0]  aiq1_ctrl_entry_cnt_updt_val;           
output           aiq1_ctrl_entry_cnt_updt_vld;           
output           aiq1_ctrl_full;                         
output           aiq1_ctrl_full_updt;                    
output           aiq1_ctrl_full_updt_clk_en;             
output  [7  :0]  aiq1_dp_issue_entry;                    
output  [213:0]  aiq1_dp_issue_read_data;                
output  [3  :0]  aiq1_top_aiq1_entry_cnt;                
output           aiq1_xx_gateclk_issue_en;               
output           aiq1_xx_issue_en;                       

// &Regs; @29
reg     [6  :0]  aiq1_entry0_create_agevec;              
reg     [213:0]  aiq1_entry0_create_data;                
reg              aiq1_entry0_create_frz;                 
reg     [6  :0]  aiq1_entry1_create_agevec;              
reg     [213:0]  aiq1_entry1_create_data;                
reg              aiq1_entry1_create_frz;                 
reg     [6  :0]  aiq1_entry2_create_agevec;              
reg     [213:0]  aiq1_entry2_create_data;                
reg              aiq1_entry2_create_frz;                 
reg     [6  :0]  aiq1_entry3_create_agevec;              
reg     [213:0]  aiq1_entry3_create_data;                
reg              aiq1_entry3_create_frz;                 
reg     [6  :0]  aiq1_entry4_create_agevec;              
reg     [213:0]  aiq1_entry4_create_data;                
reg              aiq1_entry4_create_frz;                 
reg     [6  :0]  aiq1_entry5_create_agevec;              
reg     [213:0]  aiq1_entry5_create_data;                
reg              aiq1_entry5_create_frz;                 
reg     [6  :0]  aiq1_entry6_create_agevec;              
reg     [213:0]  aiq1_entry6_create_data;                
reg              aiq1_entry6_create_frz;                 
reg     [6  :0]  aiq1_entry7_create_agevec;              
reg     [213:0]  aiq1_entry7_create_data;                
reg              aiq1_entry7_create_frz;                 
reg     [3  :0]  aiq1_entry_cnt;                         
reg     [7  :0]  aiq1_entry_create0_in;                  
reg     [7  :0]  aiq1_entry_create1_in;                  
reg     [213:0]  aiq1_entry_read_data;                   

// &Wires; @30
wire    [7  :0]  aiq0_aiq_create0_entry;                 
wire    [7  :0]  aiq0_aiq_create1_entry;                 
wire    [7  :0]  aiq1_aiq_create0_entry;                 
wire    [7  :0]  aiq1_aiq_create1_entry;                 
wire             aiq1_bypass_dp_en;                      
wire             aiq1_bypass_en;                         
wire             aiq1_bypass_gateclk_en;                 
wire             aiq1_create0_rdy_bypass;                
wire             aiq1_create0_rdy_bypass_dp;             
wire             aiq1_create0_rdy_bypass_gateclk;        
wire             aiq1_create_bypass_empty;               
wire             aiq1_ctrl_1_left_updt;                  
wire             aiq1_ctrl_empty;                        
wire    [3  :0]  aiq1_ctrl_entry_cnt_updt_val;           
wire             aiq1_ctrl_entry_cnt_updt_vld;           
wire             aiq1_ctrl_full;                         
wire             aiq1_ctrl_full_updt;                    
wire             aiq1_ctrl_full_updt_clk_en;             
wire    [7  :0]  aiq1_dp_issue_entry;                    
wire    [213:0]  aiq1_dp_issue_read_data;                
wire    [6  :0]  aiq1_entry0_agevec;                     
wire    [2  :0]  aiq1_entry0_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry0_alu1_reg_fwd_vld;           
wire             aiq1_entry0_create_dp_en;               
wire             aiq1_entry0_create_en;                  
wire             aiq1_entry0_create_gateclk_en;          
wire             aiq1_entry0_frz_clr;                    
wire             aiq1_entry0_issue_en;                   
wire             aiq1_entry0_mla_fwd_vld;                
wire             aiq1_entry0_pop_cur_entry;              
wire    [6  :0]  aiq1_entry0_pop_other_entry;            
wire             aiq1_entry0_rdy;                        
wire    [213:0]  aiq1_entry0_read_data;                  
wire             aiq1_entry0_vld;                        
wire             aiq1_entry0_vld_with_frz;               
wire    [6  :0]  aiq1_entry1_agevec;                     
wire    [2  :0]  aiq1_entry1_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry1_alu1_reg_fwd_vld;           
wire             aiq1_entry1_create_dp_en;               
wire             aiq1_entry1_create_en;                  
wire             aiq1_entry1_create_gateclk_en;          
wire             aiq1_entry1_frz_clr;                    
wire             aiq1_entry1_issue_en;                   
wire             aiq1_entry1_mla_fwd_vld;                
wire             aiq1_entry1_pop_cur_entry;              
wire    [6  :0]  aiq1_entry1_pop_other_entry;            
wire             aiq1_entry1_rdy;                        
wire    [213:0]  aiq1_entry1_read_data;                  
wire             aiq1_entry1_vld;                        
wire             aiq1_entry1_vld_with_frz;               
wire    [6  :0]  aiq1_entry2_agevec;                     
wire    [2  :0]  aiq1_entry2_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry2_alu1_reg_fwd_vld;           
wire             aiq1_entry2_create_dp_en;               
wire             aiq1_entry2_create_en;                  
wire             aiq1_entry2_create_gateclk_en;          
wire             aiq1_entry2_frz_clr;                    
wire             aiq1_entry2_issue_en;                   
wire             aiq1_entry2_mla_fwd_vld;                
wire             aiq1_entry2_pop_cur_entry;              
wire    [6  :0]  aiq1_entry2_pop_other_entry;            
wire             aiq1_entry2_rdy;                        
wire    [213:0]  aiq1_entry2_read_data;                  
wire             aiq1_entry2_vld;                        
wire             aiq1_entry2_vld_with_frz;               
wire    [6  :0]  aiq1_entry3_agevec;                     
wire    [2  :0]  aiq1_entry3_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry3_alu1_reg_fwd_vld;           
wire             aiq1_entry3_create_dp_en;               
wire             aiq1_entry3_create_en;                  
wire             aiq1_entry3_create_gateclk_en;          
wire             aiq1_entry3_frz_clr;                    
wire             aiq1_entry3_issue_en;                   
wire             aiq1_entry3_mla_fwd_vld;                
wire             aiq1_entry3_pop_cur_entry;              
wire    [6  :0]  aiq1_entry3_pop_other_entry;            
wire             aiq1_entry3_rdy;                        
wire    [213:0]  aiq1_entry3_read_data;                  
wire             aiq1_entry3_vld;                        
wire             aiq1_entry3_vld_with_frz;               
wire    [6  :0]  aiq1_entry4_agevec;                     
wire    [2  :0]  aiq1_entry4_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry4_alu1_reg_fwd_vld;           
wire             aiq1_entry4_create_dp_en;               
wire             aiq1_entry4_create_en;                  
wire             aiq1_entry4_create_gateclk_en;          
wire             aiq1_entry4_frz_clr;                    
wire             aiq1_entry4_issue_en;                   
wire             aiq1_entry4_mla_fwd_vld;                
wire             aiq1_entry4_pop_cur_entry;              
wire    [6  :0]  aiq1_entry4_pop_other_entry;            
wire             aiq1_entry4_rdy;                        
wire    [213:0]  aiq1_entry4_read_data;                  
wire             aiq1_entry4_vld;                        
wire             aiq1_entry4_vld_with_frz;               
wire    [6  :0]  aiq1_entry5_agevec;                     
wire    [2  :0]  aiq1_entry5_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry5_alu1_reg_fwd_vld;           
wire             aiq1_entry5_create_dp_en;               
wire             aiq1_entry5_create_en;                  
wire             aiq1_entry5_create_gateclk_en;          
wire             aiq1_entry5_frz_clr;                    
wire             aiq1_entry5_issue_en;                   
wire             aiq1_entry5_mla_fwd_vld;                
wire             aiq1_entry5_pop_cur_entry;              
wire    [6  :0]  aiq1_entry5_pop_other_entry;            
wire             aiq1_entry5_rdy;                        
wire    [213:0]  aiq1_entry5_read_data;                  
wire             aiq1_entry5_vld;                        
wire             aiq1_entry5_vld_with_frz;               
wire    [6  :0]  aiq1_entry6_agevec;                     
wire    [2  :0]  aiq1_entry6_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry6_alu1_reg_fwd_vld;           
wire             aiq1_entry6_create_dp_en;               
wire             aiq1_entry6_create_en;                  
wire             aiq1_entry6_create_gateclk_en;          
wire             aiq1_entry6_frz_clr;                    
wire             aiq1_entry6_issue_en;                   
wire             aiq1_entry6_mla_fwd_vld;                
wire             aiq1_entry6_pop_cur_entry;              
wire    [6  :0]  aiq1_entry6_pop_other_entry;            
wire             aiq1_entry6_rdy;                        
wire    [213:0]  aiq1_entry6_read_data;                  
wire             aiq1_entry6_vld;                        
wire             aiq1_entry6_vld_with_frz;               
wire    [6  :0]  aiq1_entry7_agevec;                     
wire    [2  :0]  aiq1_entry7_alu0_reg_fwd_vld;           
wire    [2  :0]  aiq1_entry7_alu1_reg_fwd_vld;           
wire             aiq1_entry7_create_dp_en;               
wire             aiq1_entry7_create_en;                  
wire             aiq1_entry7_create_gateclk_en;          
wire             aiq1_entry7_frz_clr;                    
wire             aiq1_entry7_issue_en;                   
wire             aiq1_entry7_mla_fwd_vld;                
wire             aiq1_entry7_pop_cur_entry;              
wire    [6  :0]  aiq1_entry7_pop_other_entry;            
wire             aiq1_entry7_rdy;                        
wire    [213:0]  aiq1_entry7_read_data;                  
wire             aiq1_entry7_vld;                        
wire             aiq1_entry7_vld_with_frz;               
wire    [3  :0]  aiq1_entry_cnt_create;                  
wire             aiq1_entry_cnt_create_0;                
wire             aiq1_entry_cnt_create_1;                
wire             aiq1_entry_cnt_create_2;                
wire             aiq1_entry_cnt_pop_0;                   
wire             aiq1_entry_cnt_pop_1;                   
wire    [3  :0]  aiq1_entry_cnt_updt_val;                
wire             aiq1_entry_cnt_updt_vld;                
wire    [7  :0]  aiq1_entry_create0_agevec;              
wire    [7  :0]  aiq1_entry_create1_agevec;              
wire    [7  :0]  aiq1_entry_create_dp_en;                
wire    [7  :0]  aiq1_entry_create_en;                   
wire    [7  :0]  aiq1_entry_create_gateclk_en;           
wire    [7  :0]  aiq1_entry_create_sel;                  
wire    [7  :0]  aiq1_entry_issue_en;                    
wire    [7  :0]  aiq1_entry_ready;                       
wire    [7  :0]  aiq1_entry_vld;                         
wire    [7  :0]  aiq1_older_entry_ready;                 
wire    [3  :0]  aiq1_top_aiq1_entry_cnt;                
wire             aiq1_xx_gateclk_issue_en;               
wire             aiq1_xx_issue_en;                       
wire    [11 :0]  biq_aiq_create0_entry;                  
wire    [11 :0]  biq_aiq_create1_entry;                  
wire             cnt_clk;                                
wire             cnt_clk_en;                             
wire             cp0_idu_icg_en;                         
wire             cp0_idu_iq_bypass_disable;              
wire             cp0_yy_clk_en;                          
wire             cpurst_b;                               
wire             ctrl_aiq0_create0_dp_en;                
wire             ctrl_aiq0_create0_gateclk_en;           
wire             ctrl_aiq0_create1_dp_en;                
wire             ctrl_aiq0_create1_gateclk_en;           
wire             ctrl_aiq1_create0_dp_en;                
wire             ctrl_aiq1_create0_en;                   
wire             ctrl_aiq1_create0_gateclk_en;           
wire             ctrl_aiq1_create1_dp_en;                
wire             ctrl_aiq1_create1_en;                   
wire             ctrl_aiq1_create1_gateclk_en;           
wire             ctrl_aiq1_rf_lch_fail_vld;              
wire    [23 :0]  ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld;     
wire    [23 :0]  ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld;     
wire    [7  :0]  ctrl_aiq1_rf_pipe1_mla_reg_lch_vld;     
wire             ctrl_aiq1_rf_pop_dlb_vld;               
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
wire    [213:0]  dp_aiq1_bypass_data;                    
wire    [213:0]  dp_aiq1_create0_data;                   
wire    [213:0]  dp_aiq1_create1_data;                   
wire             dp_aiq1_create_alu;                     
wire             dp_aiq1_create_src0_rdy_for_bypass;     
wire             dp_aiq1_create_src1_rdy_for_bypass;     
wire             dp_aiq1_create_src2_rdy_for_bypass;     
wire    [7  :0]  dp_aiq1_rf_lch_entry;                   
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
wire             forever_cpuclk;                         
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dupx;                   
wire             iu_idu_ex1_pipe1_mult_stall;            
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire             iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire             iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire             iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire    [11 :0]  lsiq_aiq_create0_entry;                 
wire    [11 :0]  lsiq_aiq_create1_entry;                 
wire             lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire             lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire             lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire             pad_yy_icg_scan_en;                     
wire             rtu_idu_flush_fe;                       
wire             rtu_idu_flush_is;                       
wire             rtu_yy_xx_flush;                        
wire    [11 :0]  sdiq_aiq_create0_entry;                 
wire    [11 :0]  sdiq_aiq_create1_entry;                 
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           


parameter AIQ1_WIDTH             = 214;

//==========================================================
//            ALU Issue Queue 1 Create Control
//==========================================================
//-------------------gated cell instance--------------------
assign cnt_clk_en = (aiq1_entry_cnt[3:0] != 4'b0)
                    || ctrl_aiq1_create0_gateclk_en
                    || ctrl_aiq1_create1_gateclk_en;
// &Instance("gated_clk_cell", "x_cnt_gated_clk"); @41
gated_clk_cell  x_cnt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cnt_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (cnt_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @42
//          .external_en (1'b0), @43
//          .global_en   (cp0_yy_clk_en), @44
//          .module_en   (cp0_idu_icg_en), @45
//          .local_en    (cnt_clk_en), @46
//          .clk_out     (cnt_clk)); @47

assign aiq1_ctrl_full_updt_clk_en = cnt_clk_en;

//--------------------aiq1 entry counter--------------------
//if create, add entry counter
assign aiq1_entry_cnt_create[3:0]   = {3'b0,ctrl_aiq1_create0_en}
                                      + {3'b0,ctrl_aiq1_create1_en};
//update valid and value
assign aiq1_entry_cnt_updt_vld      = ctrl_aiq1_create0_en
                                      || ctrl_aiq1_rf_pop_vld;
assign aiq1_entry_cnt_updt_val[3:0] = aiq1_entry_cnt[3:0]
                                      + aiq1_entry_cnt_create[3:0]
                                      - {3'b0,ctrl_aiq1_rf_pop_vld};
//implement entry counter
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    aiq1_entry_cnt[3:0] <= 4'b0;
  //after flush fe/is, the rf may wrongly pop before rtu_yy_xx_flush
  //need flush also when rtu_yy_xx_flush
  else if(rtu_idu_flush_fe || rtu_idu_flush_is || rtu_yy_xx_flush)
    aiq1_entry_cnt[3:0] <= 4'b0;
  else if(aiq1_entry_cnt_updt_vld)
    aiq1_entry_cnt[3:0] <= aiq1_entry_cnt_updt_val[3:0];
  else
    aiq1_entry_cnt[3:0] <= aiq1_entry_cnt[3:0];
end

assign aiq1_ctrl_full                    = (aiq1_entry_cnt[3:0] == 4'd8);

assign aiq1_top_aiq1_entry_cnt[3:0]      = aiq1_entry_cnt[3:0];

//---------aiq1 entry counter update value for dlb---------
//output for ctrl dlb
assign aiq1_ctrl_entry_cnt_updt_vld      = ctrl_aiq1_create0_en
                                        || ctrl_aiq1_rf_pop_dlb_vld;
assign aiq1_ctrl_entry_cnt_updt_val[3:0] = aiq1_entry_cnt[3:0]
                                         + aiq1_entry_cnt_create[3:0]
                                         - {3'b0,ctrl_aiq1_rf_pop_dlb_vld};

//--------------------aiq1 entry full-----------------------
assign aiq1_entry_cnt_create_2 =  ctrl_aiq1_create1_en;
assign aiq1_entry_cnt_create_1 =  ctrl_aiq1_create0_en && !ctrl_aiq1_create1_en;
assign aiq1_entry_cnt_create_0 = !ctrl_aiq1_create0_en;

assign aiq1_entry_cnt_pop_1    =  ctrl_aiq1_rf_pop_vld;
assign aiq1_entry_cnt_pop_0    = !ctrl_aiq1_rf_pop_vld;

assign aiq1_ctrl_full_updt     = (aiq1_entry_cnt[3:0] == 4'd6)
                                 && aiq1_entry_cnt_create_2
                                 && aiq1_entry_cnt_pop_0
                              || (aiq1_entry_cnt[3:0] == 4'd7)
                                 && aiq1_entry_cnt_create_1
                                 && aiq1_entry_cnt_pop_0
                              || (aiq1_entry_cnt[3:0] == 4'd8)
                                 && aiq1_entry_cnt_create_0
                                 && aiq1_entry_cnt_pop_0;

assign aiq1_ctrl_1_left_updt   = (aiq1_entry_cnt[3:0] == 4'd5)
                                 && aiq1_entry_cnt_create_2
                                 && aiq1_entry_cnt_pop_0
                              || (aiq1_entry_cnt[3:0] == 4'd6)
                                 && aiq1_entry_cnt_create_1
                                 && aiq1_entry_cnt_pop_0
                              || (aiq1_entry_cnt[3:0] == 4'd6)
                                 && aiq1_entry_cnt_create_2
                                 && aiq1_entry_cnt_pop_1
                              || (aiq1_entry_cnt[3:0] == 4'd7)
                                 && aiq1_entry_cnt_create_0
                                 && aiq1_entry_cnt_pop_0
                              || (aiq1_entry_cnt[3:0] == 4'd7)
                                 && aiq1_entry_cnt_create_1
                                 && aiq1_entry_cnt_pop_1
                              || (aiq1_entry_cnt[3:0] == 4'd8)
                                 && aiq1_entry_cnt_create_0
                                 && aiq1_entry_cnt_pop_1;

//assign aiq1_full_entry_cnt_updt_val[3:0] = (aiq1_entry_cnt_updt_vld)
//                                           ? aiq1_entry_cnt_updt_val[3:0]
//                                           : aiq1_entry_cnt[3:0];
//
//assign aiq1_ctrl_full_updt   = (aiq1_full_entry_cnt_updt_val[3:0] == 4'd8);
//assign aiq1_ctrl_1_left_updt = (aiq1_full_entry_cnt_updt_val[3:0] == 4'd7);

//---------------------create bypass------------------------
//if create instruction is ready, it may bypass from issue queue
//only create 0 can bypass
assign aiq1_create0_rdy_bypass    = ctrl_aiq1_create0_en
                                    && !cp0_idu_iq_bypass_disable
                                    && !ctrl_aiq1_stall
                                    && !(dp_aiq1_create_alu
                                         && iu_idu_ex1_pipe1_mult_stall)
                                    && dp_aiq1_create_src0_rdy_for_bypass
                                    && dp_aiq1_create_src1_rdy_for_bypass
                                    && dp_aiq1_create_src2_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign aiq1_create0_rdy_bypass_dp = ctrl_aiq1_create0_dp_en
                                    && !cp0_idu_iq_bypass_disable
                                    && !ctrl_aiq1_stall
                                    && !(dp_aiq1_create_alu
                                         && iu_idu_ex1_pipe1_mult_stall)
                                    && dp_aiq1_create_src0_rdy_for_bypass
                                    && dp_aiq1_create_src1_rdy_for_bypass
                                    && dp_aiq1_create_src2_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign aiq1_create0_rdy_bypass_gateclk = ctrl_aiq1_create0_dp_en
                                         && dp_aiq1_create_src0_rdy_for_bypass
                                         && dp_aiq1_create_src1_rdy_for_bypass
                                         && dp_aiq1_create_src2_rdy_for_bypass;

//issue queue entry create control
assign aiq1_entry_vld[0]         = aiq1_entry0_vld;
assign aiq1_entry_vld[1]         = aiq1_entry1_vld;
assign aiq1_entry_vld[2]         = aiq1_entry2_vld;
assign aiq1_entry_vld[3]         = aiq1_entry3_vld;
assign aiq1_entry_vld[4]         = aiq1_entry4_vld;
assign aiq1_entry_vld[5]         = aiq1_entry5_vld;
assign aiq1_entry_vld[6]         = aiq1_entry6_vld;
assign aiq1_entry_vld[7]         = aiq1_entry7_vld;

assign aiq1_create_bypass_empty  = !(aiq1_entry0_vld_with_frz
                                     || aiq1_entry1_vld_with_frz
                                     || aiq1_entry2_vld_with_frz
                                     || aiq1_entry3_vld_with_frz
                                     || aiq1_entry4_vld_with_frz
                                     || aiq1_entry5_vld_with_frz
                                     || aiq1_entry6_vld_with_frz
                                     || aiq1_entry7_vld_with_frz);

assign aiq1_ctrl_empty           = !(|aiq1_entry_vld[7:0]);

//create0 priority is from entry 0 to 7
// &CombBeg; @180
always @( aiq1_entry0_vld
       or aiq1_entry3_vld
       or aiq1_entry7_vld
       or aiq1_entry5_vld
       or aiq1_entry1_vld
       or aiq1_entry4_vld
       or aiq1_entry6_vld
       or aiq1_entry2_vld)
begin
  if(!aiq1_entry0_vld)
    aiq1_entry_create0_in[7:0] = 8'b0000_0001;
  else if(!aiq1_entry1_vld)
    aiq1_entry_create0_in[7:0] = 8'b0000_0010;
  else if(!aiq1_entry2_vld)
    aiq1_entry_create0_in[7:0] = 8'b0000_0100;
  else if(!aiq1_entry3_vld)
    aiq1_entry_create0_in[7:0] = 8'b0000_1000;
  else if(!aiq1_entry4_vld)
    aiq1_entry_create0_in[7:0] = 8'b0001_0000;
  else if(!aiq1_entry5_vld)
    aiq1_entry_create0_in[7:0] = 8'b0010_0000;
  else if(!aiq1_entry6_vld)
    aiq1_entry_create0_in[7:0] = 8'b0100_0000;
  else if(!aiq1_entry7_vld)
    aiq1_entry_create0_in[7:0] = 8'b1000_0000;
  else
    aiq1_entry_create0_in[7:0] = 8'b0000_0000;
// &CombEnd; @199
end

//create1 priority is from entry 7 to 0
// &CombBeg; @202
always @( aiq1_entry0_vld
       or aiq1_entry7_vld
       or aiq1_entry3_vld
       or aiq1_entry5_vld
       or aiq1_entry1_vld
       or aiq1_entry4_vld
       or aiq1_entry6_vld
       or aiq1_entry2_vld)
begin
  if(!aiq1_entry7_vld)
    aiq1_entry_create1_in[7:0] = 8'b1000_0000;
  else if(!aiq1_entry6_vld)
    aiq1_entry_create1_in[7:0] = 8'b0100_0000;
  else if(!aiq1_entry5_vld)
    aiq1_entry_create1_in[7:0] = 8'b0010_0000;
  else if(!aiq1_entry4_vld)
    aiq1_entry_create1_in[7:0] = 8'b0001_0000;
  else if(!aiq1_entry3_vld)
    aiq1_entry_create1_in[7:0] = 8'b0000_1000;
  else if(!aiq1_entry2_vld)
    aiq1_entry_create1_in[7:0] = 8'b0000_0100;
  else if(!aiq1_entry1_vld)
    aiq1_entry_create1_in[7:0] = 8'b0000_0010;
  else if(!aiq1_entry0_vld)
    aiq1_entry_create1_in[7:0] = 8'b0000_0001;
  else
    aiq1_entry_create1_in[7:0] = 8'b0000_0000;
// &CombEnd; @221
end

// &Force("output","aiq1_aiq_create0_entry"); @223
// &Force("output","aiq1_aiq_create1_entry"); @224
assign aiq1_aiq_create0_entry[7:0] = aiq1_entry_create0_in[7:0];
assign aiq1_aiq_create1_entry[7:0] = aiq1_entry_create1_in[7:0];

assign aiq1_bypass_en          = aiq1_create_bypass_empty
                                 && aiq1_create0_rdy_bypass;

assign aiq1_entry_create_en[7:0] =
       {8{ctrl_aiq1_create0_en}} & aiq1_entry_create0_in[7:0]
     | {8{ctrl_aiq1_create1_en}} & aiq1_entry_create1_in[7:0];

assign aiq1_entry0_create_en     = aiq1_entry_create_en[0];
assign aiq1_entry1_create_en     = aiq1_entry_create_en[1];
assign aiq1_entry2_create_en     = aiq1_entry_create_en[2];
assign aiq1_entry3_create_en     = aiq1_entry_create_en[3];
assign aiq1_entry4_create_en     = aiq1_entry_create_en[4];
assign aiq1_entry5_create_en     = aiq1_entry_create_en[5];
assign aiq1_entry6_create_en     = aiq1_entry_create_en[6];
assign aiq1_entry7_create_en     = aiq1_entry_create_en[7];

assign aiq1_bypass_dp_en         = aiq1_create_bypass_empty
                                   && aiq1_create0_rdy_bypass_dp;
assign aiq1_bypass_gateclk_en    = aiq1_create_bypass_empty
                                   && aiq1_create0_rdy_bypass_gateclk;

//issue queue entry create data path control
assign aiq1_entry_create_dp_en[7:0] =
       {8{ctrl_aiq1_create0_dp_en}} & aiq1_entry_create0_in[7:0]
     | {8{ctrl_aiq1_create1_dp_en}} & aiq1_entry_create1_in[7:0];

assign aiq1_entry0_create_dp_en  = aiq1_entry_create_dp_en[0];
assign aiq1_entry1_create_dp_en  = aiq1_entry_create_dp_en[1];
assign aiq1_entry2_create_dp_en  = aiq1_entry_create_dp_en[2];
assign aiq1_entry3_create_dp_en  = aiq1_entry_create_dp_en[3];
assign aiq1_entry4_create_dp_en  = aiq1_entry_create_dp_en[4];
assign aiq1_entry5_create_dp_en  = aiq1_entry_create_dp_en[5];
assign aiq1_entry6_create_dp_en  = aiq1_entry_create_dp_en[6];
assign aiq1_entry7_create_dp_en  = aiq1_entry_create_dp_en[7];

//issue queue entry create gateclk control
//ignore bypass signal for timing optimization
assign aiq1_entry_create_gateclk_en[7:0] =
       {8{ctrl_aiq1_create0_gateclk_en}} & aiq1_entry_create0_in[7:0]
     | {8{ctrl_aiq1_create1_gateclk_en}} & aiq1_entry_create1_in[7:0];

assign aiq1_entry0_create_gateclk_en  = aiq1_entry_create_gateclk_en[0];
assign aiq1_entry1_create_gateclk_en  = aiq1_entry_create_gateclk_en[1];
assign aiq1_entry2_create_gateclk_en  = aiq1_entry_create_gateclk_en[2];
assign aiq1_entry3_create_gateclk_en  = aiq1_entry_create_gateclk_en[3];
assign aiq1_entry4_create_gateclk_en  = aiq1_entry_create_gateclk_en[4];
assign aiq1_entry5_create_gateclk_en  = aiq1_entry_create_gateclk_en[5];
assign aiq1_entry6_create_gateclk_en  = aiq1_entry_create_gateclk_en[6];
assign aiq1_entry7_create_gateclk_en  = aiq1_entry_create_gateclk_en[7];

//aiq create entry should consider pop signal and create0
assign aiq1_entry_create0_agevec[7:0] = aiq1_entry_vld[7:0]
                                        & ~({8{ctrl_aiq1_rf_pop_vld}}
                                           & dp_aiq1_rf_lch_entry[7:0]);

assign aiq1_entry_create1_agevec[7:0] = aiq1_entry_vld[7:0]
                                        & ~({8{ctrl_aiq1_rf_pop_vld}}
                                           & dp_aiq1_rf_lch_entry[7:0])
                                        | aiq1_entry_create0_in[7:0];

//create 0/1 select:
//entry 0~3 use ~aiq1_entry_create0_in for better timing
//entry 4~7 use aiq1_entry_create1_in for better timing
//aiq1_entry_create0/1_in cannot be both 1,
//if both 0, do not create
assign aiq1_entry_create_sel[7:4] = {4{ctrl_aiq1_create1_dp_en}}
                                     & aiq1_entry_create1_in[7:4];
assign aiq1_entry_create_sel[3:0] = ~({4{ctrl_aiq1_create0_dp_en}}
                                      & aiq1_entry_create0_in[3:0]);

//----------------entry0 flop create signals----------------
// &CombBeg; @299
always @( aiq1_entry_create_sel[0]
       or aiq1_bypass_dp_en
       or dp_aiq1_create1_data[213:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create1_agevec[7:1]
       or aiq1_entry_create0_agevec[7:1])
begin
  if(!aiq1_entry_create_sel[0]) begin
    aiq1_entry0_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry0_create_agevec[6:0] = aiq1_entry_create0_agevec[7:1];
    aiq1_entry0_create_data[AIQ1_WIDTH-1:0] = 
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry0_create_frz         = 1'b0;
    aiq1_entry0_create_agevec[6:0] = aiq1_entry_create1_agevec[7:1];
    aiq1_entry0_create_data[AIQ1_WIDTH-1:0] = 
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @312
end

//----------------entry1 flop create signals----------------
// &CombBeg; @315
always @( aiq1_bypass_dp_en
       or aiq1_entry_create1_agevec[7:2]
       or aiq1_entry_create0_agevec[7:2]
       or aiq1_entry_create1_agevec[0]
       or dp_aiq1_create1_data[213:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create_sel[1]
       or aiq1_entry_create0_agevec[0])
begin
  if(!aiq1_entry_create_sel[1]) begin
    aiq1_entry1_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry1_create_agevec[6:0] = {aiq1_entry_create0_agevec[7:2],
                                      aiq1_entry_create0_agevec[0]};
    aiq1_entry1_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry1_create_frz         = 1'b0;
    aiq1_entry1_create_agevec[6:0] = {aiq1_entry_create1_agevec[7:2],
                                      aiq1_entry_create1_agevec[0]};
    aiq1_entry1_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @330
end

//----------------entry2 flop create signals----------------
// &CombBeg; @333
always @( aiq1_entry_create1_agevec[7:3]
       or aiq1_bypass_dp_en
       or aiq1_entry_create0_agevec[7:3]
       or aiq1_entry_create_sel[2]
       or aiq1_entry_create0_agevec[1:0]
       or dp_aiq1_create1_data[213:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create1_agevec[1:0])
begin
  if(!aiq1_entry_create_sel[2]) begin
    aiq1_entry2_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry2_create_agevec[6:0] = {aiq1_entry_create0_agevec[7:3],
                                      aiq1_entry_create0_agevec[1:0]};
    aiq1_entry2_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry2_create_frz         = 1'b0;
    aiq1_entry2_create_agevec[6:0] = {aiq1_entry_create1_agevec[7:3],
                                      aiq1_entry_create1_agevec[1:0]};
    aiq1_entry2_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @348
end

//----------------entry3 flop create signals----------------
// &CombBeg; @351
always @( aiq1_bypass_dp_en
       or dp_aiq1_create1_data[213:0]
       or aiq1_entry_create1_agevec[7:4]
       or aiq1_entry_create1_agevec[2:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create0_agevec[2:0]
       or aiq1_entry_create_sel[3]
       or aiq1_entry_create0_agevec[7:4])
begin
  if(!aiq1_entry_create_sel[3]) begin
    aiq1_entry3_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry3_create_agevec[6:0] = {aiq1_entry_create0_agevec[7:4],
                                      aiq1_entry_create0_agevec[2:0]};
    aiq1_entry3_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry3_create_frz         = 1'b0;
    aiq1_entry3_create_agevec[6:0] = {aiq1_entry_create1_agevec[7:4],
                                      aiq1_entry_create1_agevec[2:0]};
    aiq1_entry3_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @366
end

//----------------entry4 flop create signals----------------
// &CombBeg; @369
always @( aiq1_bypass_dp_en
       or aiq1_entry_create1_agevec[7:5]
       or aiq1_entry_create0_agevec[7:5]
       or dp_aiq1_create1_data[213:0]
       or aiq1_entry_create0_agevec[3:0]
       or aiq1_entry_create1_agevec[3:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create_sel[4])
begin
  if(!aiq1_entry_create_sel[4]) begin
    aiq1_entry4_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry4_create_agevec[6:0] = {aiq1_entry_create0_agevec[7:5],
                                      aiq1_entry_create0_agevec[3:0]};
    aiq1_entry4_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry4_create_frz         = 1'b0;
    aiq1_entry4_create_agevec[6:0] = {aiq1_entry_create1_agevec[7:5],
                                      aiq1_entry_create1_agevec[3:0]};
    aiq1_entry4_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @384
end

//----------------entry5 flop create signals----------------
// &CombBeg; @387
always @( aiq1_bypass_dp_en
       or dp_aiq1_create1_data[213:0]
       or aiq1_entry_create0_agevec[4:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create0_agevec[7:6]
       or aiq1_entry_create_sel[5]
       or aiq1_entry_create1_agevec[7:6]
       or aiq1_entry_create1_agevec[4:0])
begin
  if(!aiq1_entry_create_sel[5]) begin
    aiq1_entry5_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry5_create_agevec[6:0] = {aiq1_entry_create0_agevec[7:6],
                                      aiq1_entry_create0_agevec[4:0]};
    aiq1_entry5_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry5_create_frz         = 1'b0;
    aiq1_entry5_create_agevec[6:0] = {aiq1_entry_create1_agevec[7:6],
                                      aiq1_entry_create1_agevec[4:0]};
    aiq1_entry5_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @402
end

//----------------entry6 flop create signals----------------
// &CombBeg; @405
always @( aiq1_entry_create0_agevec[7]
       or aiq1_entry_create1_agevec[7]
       or aiq1_bypass_dp_en
       or aiq1_entry_create0_agevec[5:0]
       or dp_aiq1_create1_data[213:0]
       or aiq1_entry_create1_agevec[5:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create_sel[6])
begin
  if(!aiq1_entry_create_sel[6]) begin
    aiq1_entry6_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry6_create_agevec[6:0] = {aiq1_entry_create0_agevec[7],
                                      aiq1_entry_create0_agevec[5:0]};
    aiq1_entry6_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry6_create_frz         = 1'b0;
    aiq1_entry6_create_agevec[6:0] = {aiq1_entry_create1_agevec[7],
                                      aiq1_entry_create1_agevec[5:0]};
    aiq1_entry6_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @420
end

//----------------entry7 flop create signals----------------
// &CombBeg; @423
always @( aiq1_bypass_dp_en
       or aiq1_entry_create_sel[7]
       or dp_aiq1_create1_data[213:0]
       or dp_aiq1_create0_data[213:0]
       or aiq1_entry_create0_agevec[6:0]
       or aiq1_entry_create1_agevec[6:0])
begin
  if(!aiq1_entry_create_sel[7]) begin
    aiq1_entry7_create_frz         = aiq1_bypass_dp_en;
    aiq1_entry7_create_agevec[6:0] = aiq1_entry_create0_agevec[6:0];
    aiq1_entry7_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create0_data[AIQ1_WIDTH-1:0];
  end
  else begin
    aiq1_entry7_create_frz         = 1'b0;
    aiq1_entry7_create_agevec[6:0] = aiq1_entry_create1_agevec[6:0];
    aiq1_entry7_create_data[AIQ1_WIDTH-1:0] =
       dp_aiq1_create1_data[AIQ1_WIDTH-1:0];
  end
// &CombEnd; @436
end

//==========================================================
//             ALU Issue Queue 1 Issue Control
//==========================================================
//----------------Pipe0 Launch Ready Signals----------------
assign aiq1_entry0_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[2:0];
assign aiq1_entry1_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[5:3];
assign aiq1_entry2_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[8:6];
assign aiq1_entry3_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[11:9];
assign aiq1_entry4_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[14:12];
assign aiq1_entry5_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[17:15];
assign aiq1_entry6_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[20:18];
assign aiq1_entry7_alu0_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[23:21];

assign aiq1_entry0_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[2:0];
assign aiq1_entry1_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[5:3];
assign aiq1_entry2_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[8:6];
assign aiq1_entry3_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[11:9];
assign aiq1_entry4_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[14:12];
assign aiq1_entry5_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[17:15];
assign aiq1_entry6_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[20:18];
assign aiq1_entry7_alu1_reg_fwd_vld[2:0] = ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[23:21];

assign aiq1_entry0_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[0];
assign aiq1_entry1_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[1];
assign aiq1_entry2_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[2];
assign aiq1_entry3_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[3];
assign aiq1_entry4_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[4];
assign aiq1_entry5_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[5];
assign aiq1_entry6_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[6];
assign aiq1_entry7_mla_fwd_vld           = ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[7];

//-------------------issue enable signals-------------------
assign aiq1_entry_ready[0]      = aiq1_entry0_rdy;
assign aiq1_entry_ready[1]      = aiq1_entry1_rdy;
assign aiq1_entry_ready[2]      = aiq1_entry2_rdy;
assign aiq1_entry_ready[3]      = aiq1_entry3_rdy;
assign aiq1_entry_ready[4]      = aiq1_entry4_rdy;
assign aiq1_entry_ready[5]      = aiq1_entry5_rdy;
assign aiq1_entry_ready[6]      = aiq1_entry6_rdy;
assign aiq1_entry_ready[7]      = aiq1_entry7_rdy;
//if there is any entry ready or bypass enable, issue enable
assign aiq1_xx_issue_en         = |{aiq1_bypass_en,
                                    aiq1_entry_ready[7:0]};
//gate clock issue enable with timing optimization
assign aiq1_xx_gateclk_issue_en = aiq1_bypass_gateclk_en
                                  || aiq1_entry0_vld_with_frz
                                  || aiq1_entry1_vld_with_frz
                                  || aiq1_entry2_vld_with_frz
                                  || aiq1_entry3_vld_with_frz
                                  || aiq1_entry4_vld_with_frz
                                  || aiq1_entry5_vld_with_frz
                                  || aiq1_entry6_vld_with_frz
                                  || aiq1_entry7_vld_with_frz;
//first find older ready entry
assign aiq1_older_entry_ready[0] = |(aiq1_entry0_agevec[6:0]
                                     & aiq1_entry_ready[7:1]);
assign aiq1_older_entry_ready[1] = |(aiq1_entry1_agevec[6:0]
                                     & {aiq1_entry_ready[7:2],
                                        aiq1_entry_ready[0]});
assign aiq1_older_entry_ready[2] = |(aiq1_entry2_agevec[6:0]
                                     & {aiq1_entry_ready[7:3],
                                        aiq1_entry_ready[1:0]});
assign aiq1_older_entry_ready[3] = |(aiq1_entry3_agevec[6:0]
                                     & {aiq1_entry_ready[7:4],
                                        aiq1_entry_ready[2:0]});
assign aiq1_older_entry_ready[4] = |(aiq1_entry4_agevec[6:0]
                                     & {aiq1_entry_ready[7:5],
                                        aiq1_entry_ready[3:0]});
assign aiq1_older_entry_ready[5] = |(aiq1_entry5_agevec[6:0]
                                     & {aiq1_entry_ready[7:6],
                                        aiq1_entry_ready[4:0]});
assign aiq1_older_entry_ready[6] = |(aiq1_entry6_agevec[6:0]
                                     & {aiq1_entry_ready[7],
                                        aiq1_entry_ready[5:0]});
assign aiq1_older_entry_ready[7] = |(aiq1_entry7_agevec[6:0]
                                     & aiq1_entry_ready[6:0]);

//------------------entry issue enable signals--------------
//not ready if older ready exists
assign aiq1_entry_issue_en[7:0]  = aiq1_entry_ready[7:0]
                                   & ~aiq1_older_entry_ready[7:0];
//rename for entries
assign aiq1_entry0_issue_en      = aiq1_entry_issue_en[0];
assign aiq1_entry1_issue_en      = aiq1_entry_issue_en[1];
assign aiq1_entry2_issue_en      = aiq1_entry_issue_en[2];
assign aiq1_entry3_issue_en      = aiq1_entry_issue_en[3];
assign aiq1_entry4_issue_en      = aiq1_entry_issue_en[4];
assign aiq1_entry5_issue_en      = aiq1_entry_issue_en[5];
assign aiq1_entry6_issue_en      = aiq1_entry_issue_en[6];
assign aiq1_entry7_issue_en      = aiq1_entry_issue_en[7];

//-----------------issue entry indiction--------------------
assign aiq1_dp_issue_entry[7:0]  = (aiq1_create_bypass_empty)
                                   ? aiq1_entry_create0_in[7:0]
                                   : aiq1_entry_issue_en[7:0];

//-----------------issue data path selection----------------
//issue data path will select oldest ready entry in issue queue
//if no instruction valid, the data path will always select bypass 
//data path
// &CombBeg; @538
always @( aiq1_entry7_read_data[213:0]
       or aiq1_entry3_read_data[213:0]
       or aiq1_entry1_read_data[213:0]
       or aiq1_entry0_read_data[213:0]
       or aiq1_entry6_read_data[213:0]
       or aiq1_entry2_read_data[213:0]
       or aiq1_entry4_read_data[213:0]
       or aiq1_entry5_read_data[213:0]
       or aiq1_entry_issue_en[7:0])
begin
  case (aiq1_entry_issue_en[7:0])
    8'h01  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry0_read_data[AIQ1_WIDTH-1:0];
    8'h02  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry1_read_data[AIQ1_WIDTH-1:0];
    8'h04  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry2_read_data[AIQ1_WIDTH-1:0];
    8'h08  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry3_read_data[AIQ1_WIDTH-1:0];
    8'h10  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry4_read_data[AIQ1_WIDTH-1:0];
    8'h20  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry5_read_data[AIQ1_WIDTH-1:0];
    8'h40  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry6_read_data[AIQ1_WIDTH-1:0];
    8'h80  : aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
               aiq1_entry7_read_data[AIQ1_WIDTH-1:0];
    default: aiq1_entry_read_data[AIQ1_WIDTH-1:0] =
                                    {AIQ1_WIDTH{1'bx}};
  endcase
// &CombEnd; @559
end

//if no entry valid, select bypass path
assign aiq1_dp_issue_read_data[AIQ1_WIDTH-1:0] = 
         (aiq1_create_bypass_empty) 
         ? dp_aiq1_bypass_data[AIQ1_WIDTH-1:0]
         : aiq1_entry_read_data[AIQ1_WIDTH-1:0];

//==========================================================
//            ALU Issue Queue 1 Launch Control
//==========================================================
//-------------------entry pop enable signals---------------
//pop when rf launch pass
assign {aiq1_entry0_pop_other_entry[6:0],
        aiq1_entry0_pop_cur_entry}        = dp_aiq1_rf_lch_entry[7:0];
assign {aiq1_entry1_pop_other_entry[6:1],
        aiq1_entry1_pop_cur_entry,
        aiq1_entry1_pop_other_entry[0]}   = dp_aiq1_rf_lch_entry[7:0];
assign {aiq1_entry2_pop_other_entry[6:2],
        aiq1_entry2_pop_cur_entry,
        aiq1_entry2_pop_other_entry[1:0]} = dp_aiq1_rf_lch_entry[7:0];
assign {aiq1_entry3_pop_other_entry[6:3],
        aiq1_entry3_pop_cur_entry,
        aiq1_entry3_pop_other_entry[2:0]} = dp_aiq1_rf_lch_entry[7:0];
assign {aiq1_entry4_pop_other_entry[6:4],
        aiq1_entry4_pop_cur_entry,
        aiq1_entry4_pop_other_entry[3:0]} = dp_aiq1_rf_lch_entry[7:0];
assign {aiq1_entry5_pop_other_entry[6:5],
        aiq1_entry5_pop_cur_entry,
        aiq1_entry5_pop_other_entry[4:0]} = dp_aiq1_rf_lch_entry[7:0];
assign {aiq1_entry6_pop_other_entry[6],
        aiq1_entry6_pop_cur_entry,
        aiq1_entry6_pop_other_entry[5:0]} = dp_aiq1_rf_lch_entry[7:0];
assign {aiq1_entry7_pop_cur_entry,
        aiq1_entry7_pop_other_entry[6:0]} = dp_aiq1_rf_lch_entry[7:0];

//-------------------entry spec fail signals---------------
//clear freeze and source rdy when launch fail
assign aiq1_entry0_frz_clr      = ctrl_aiq1_rf_lch_fail_vld
                                  && dp_aiq1_rf_lch_entry[0];
assign aiq1_entry1_frz_clr      = ctrl_aiq1_rf_lch_fail_vld
                                  && dp_aiq1_rf_lch_entry[1];
assign aiq1_entry2_frz_clr      = ctrl_aiq1_rf_lch_fail_vld 
                                  && dp_aiq1_rf_lch_entry[2];
assign aiq1_entry3_frz_clr      = ctrl_aiq1_rf_lch_fail_vld 
                                  && dp_aiq1_rf_lch_entry[3];
assign aiq1_entry4_frz_clr      = ctrl_aiq1_rf_lch_fail_vld 
                                  && dp_aiq1_rf_lch_entry[4];
assign aiq1_entry5_frz_clr      = ctrl_aiq1_rf_lch_fail_vld 
                                  && dp_aiq1_rf_lch_entry[5];
assign aiq1_entry6_frz_clr      = ctrl_aiq1_rf_lch_fail_vld 
                                  && dp_aiq1_rf_lch_entry[6];
assign aiq1_entry7_frz_clr      = ctrl_aiq1_rf_lch_fail_vld 
                                  && dp_aiq1_rf_lch_entry[7];

//==========================================================
//             ALU Issue Queue 1 Entry Instance
//==========================================================
// &ConnRule(s/^x_/aiq1_entry0_/); @617
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry0"); @618
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry0 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry0_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry0_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry0_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry0_create_agevec              ),
  .x_create_data                           (aiq1_entry0_create_data                ),
  .x_create_dp_en                          (aiq1_entry0_create_dp_en               ),
  .x_create_en                             (aiq1_entry0_create_en                  ),
  .x_create_frz                            (aiq1_entry0_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry0_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry0_frz_clr                    ),
  .x_issue_en                              (aiq1_entry0_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry0_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry0_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry0_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry0_rdy                        ),
  .x_read_data                             (aiq1_entry0_read_data                  ),
  .x_vld                                   (aiq1_entry0_vld                        ),
  .x_vld_with_frz                          (aiq1_entry0_vld_with_frz               )
);


// &ConnRule(s/^x_/aiq1_entry1_/); @620
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry1"); @621
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry1 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry1_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry1_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry1_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry1_create_agevec              ),
  .x_create_data                           (aiq1_entry1_create_data                ),
  .x_create_dp_en                          (aiq1_entry1_create_dp_en               ),
  .x_create_en                             (aiq1_entry1_create_en                  ),
  .x_create_frz                            (aiq1_entry1_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry1_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry1_frz_clr                    ),
  .x_issue_en                              (aiq1_entry1_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry1_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry1_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry1_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry1_rdy                        ),
  .x_read_data                             (aiq1_entry1_read_data                  ),
  .x_vld                                   (aiq1_entry1_vld                        ),
  .x_vld_with_frz                          (aiq1_entry1_vld_with_frz               )
);


// &ConnRule(s/^x_/aiq1_entry2_/); @623
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry2"); @624
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry2 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry2_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry2_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry2_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry2_create_agevec              ),
  .x_create_data                           (aiq1_entry2_create_data                ),
  .x_create_dp_en                          (aiq1_entry2_create_dp_en               ),
  .x_create_en                             (aiq1_entry2_create_en                  ),
  .x_create_frz                            (aiq1_entry2_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry2_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry2_frz_clr                    ),
  .x_issue_en                              (aiq1_entry2_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry2_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry2_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry2_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry2_rdy                        ),
  .x_read_data                             (aiq1_entry2_read_data                  ),
  .x_vld                                   (aiq1_entry2_vld                        ),
  .x_vld_with_frz                          (aiq1_entry2_vld_with_frz               )
);


// &ConnRule(s/^x_/aiq1_entry3_/); @626
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry3"); @627
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry3 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry3_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry3_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry3_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry3_create_agevec              ),
  .x_create_data                           (aiq1_entry3_create_data                ),
  .x_create_dp_en                          (aiq1_entry3_create_dp_en               ),
  .x_create_en                             (aiq1_entry3_create_en                  ),
  .x_create_frz                            (aiq1_entry3_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry3_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry3_frz_clr                    ),
  .x_issue_en                              (aiq1_entry3_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry3_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry3_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry3_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry3_rdy                        ),
  .x_read_data                             (aiq1_entry3_read_data                  ),
  .x_vld                                   (aiq1_entry3_vld                        ),
  .x_vld_with_frz                          (aiq1_entry3_vld_with_frz               )
);


// &ConnRule(s/^x_/aiq1_entry4_/); @629
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry4"); @630
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry4 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry4_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry4_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry4_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry4_create_agevec              ),
  .x_create_data                           (aiq1_entry4_create_data                ),
  .x_create_dp_en                          (aiq1_entry4_create_dp_en               ),
  .x_create_en                             (aiq1_entry4_create_en                  ),
  .x_create_frz                            (aiq1_entry4_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry4_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry4_frz_clr                    ),
  .x_issue_en                              (aiq1_entry4_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry4_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry4_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry4_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry4_rdy                        ),
  .x_read_data                             (aiq1_entry4_read_data                  ),
  .x_vld                                   (aiq1_entry4_vld                        ),
  .x_vld_with_frz                          (aiq1_entry4_vld_with_frz               )
);


// &ConnRule(s/^x_/aiq1_entry5_/); @632
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry5"); @633
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry5 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry5_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry5_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry5_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry5_create_agevec              ),
  .x_create_data                           (aiq1_entry5_create_data                ),
  .x_create_dp_en                          (aiq1_entry5_create_dp_en               ),
  .x_create_en                             (aiq1_entry5_create_en                  ),
  .x_create_frz                            (aiq1_entry5_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry5_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry5_frz_clr                    ),
  .x_issue_en                              (aiq1_entry5_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry5_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry5_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry5_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry5_rdy                        ),
  .x_read_data                             (aiq1_entry5_read_data                  ),
  .x_vld                                   (aiq1_entry5_vld                        ),
  .x_vld_with_frz                          (aiq1_entry5_vld_with_frz               )
);


// &ConnRule(s/^x_/aiq1_entry6_/); @635
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry6"); @636
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry6 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry6_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry6_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry6_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry6_create_agevec              ),
  .x_create_data                           (aiq1_entry6_create_data                ),
  .x_create_dp_en                          (aiq1_entry6_create_dp_en               ),
  .x_create_en                             (aiq1_entry6_create_en                  ),
  .x_create_frz                            (aiq1_entry6_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry6_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry6_frz_clr                    ),
  .x_issue_en                              (aiq1_entry6_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry6_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry6_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry6_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry6_rdy                        ),
  .x_read_data                             (aiq1_entry6_read_data                  ),
  .x_vld                                   (aiq1_entry6_vld                        ),
  .x_vld_with_frz                          (aiq1_entry6_vld_with_frz               )
);


// &ConnRule(s/^x_/aiq1_entry7_/); @638
// &Instance("ct_idu_is_aiq1_entry", "x_ct_idu_is_aiq1_entry7"); @639
ct_idu_is_aiq1_entry  x_ct_idu_is_aiq1_entry7 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dupx                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dupx          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dupx      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dupx    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dupx             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dupx          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dupx      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
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
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .x_agevec                                (aiq1_entry7_agevec                     ),
  .x_alu0_reg_fwd_vld                      (aiq1_entry7_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (aiq1_entry7_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (aiq1_entry7_create_agevec              ),
  .x_create_data                           (aiq1_entry7_create_data                ),
  .x_create_dp_en                          (aiq1_entry7_create_dp_en               ),
  .x_create_en                             (aiq1_entry7_create_en                  ),
  .x_create_frz                            (aiq1_entry7_create_frz                 ),
  .x_create_gateclk_en                     (aiq1_entry7_create_gateclk_en          ),
  .x_frz_clr                               (aiq1_entry7_frz_clr                    ),
  .x_issue_en                              (aiq1_entry7_issue_en                   ),
  .x_mla_fwd_vld                           (aiq1_entry7_mla_fwd_vld                ),
  .x_pop_cur_entry                         (aiq1_entry7_pop_cur_entry              ),
  .x_pop_other_entry                       (aiq1_entry7_pop_other_entry            ),
  .x_rdy                                   (aiq1_entry7_rdy                        ),
  .x_read_data                             (aiq1_entry7_read_data                  ),
  .x_vld                                   (aiq1_entry7_vld                        ),
  .x_vld_with_frz                          (aiq1_entry7_vld_with_frz               )
);


// &ModuleEnd; @641
endmodule


