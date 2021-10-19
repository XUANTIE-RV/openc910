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
module ct_idu_is_biq(
  biq_aiq_create0_entry,
  biq_aiq_create1_entry,
  biq_ctrl_1_left_updt,
  biq_ctrl_empty,
  biq_ctrl_full,
  biq_ctrl_full_updt,
  biq_ctrl_full_updt_clk_en,
  biq_dp_issue_entry,
  biq_dp_issue_read_data,
  biq_top_biq_entry_cnt,
  biq_xx_gateclk_issue_en,
  biq_xx_issue_en,
  cp0_idu_icg_en,
  cp0_idu_iq_bypass_disable,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_biq_create0_dp_en,
  ctrl_biq_create0_en,
  ctrl_biq_create0_gateclk_en,
  ctrl_biq_create1_dp_en,
  ctrl_biq_create1_en,
  ctrl_biq_create1_gateclk_en,
  ctrl_biq_rf_lch_fail_vld,
  ctrl_biq_rf_pipe0_alu_reg_fwd_vld,
  ctrl_biq_rf_pipe1_alu_reg_fwd_vld,
  ctrl_biq_rf_pop_vld,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_biq_bypass_data,
  dp_biq_create0_data,
  dp_biq_create1_data,
  dp_biq_create_src0_rdy_for_bypass,
  dp_biq_create_src1_rdy_for_bypass,
  dp_biq_rf_lch_entry,
  dp_biq_rf_rdy_clr,
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  forever_cpuclk,
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
  rtu_yy_xx_flush,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx
);

// &Ports; @28
input           cp0_idu_icg_en;                         
input           cp0_idu_iq_bypass_disable;              
input           cp0_yy_clk_en;                          
input           cpurst_b;                               
input           ctrl_biq_create0_dp_en;                 
input           ctrl_biq_create0_en;                    
input           ctrl_biq_create0_gateclk_en;            
input           ctrl_biq_create1_dp_en;                 
input           ctrl_biq_create1_en;                    
input           ctrl_biq_create1_gateclk_en;            
input           ctrl_biq_rf_lch_fail_vld;               
input   [23:0]  ctrl_biq_rf_pipe0_alu_reg_fwd_vld;      
input   [23:0]  ctrl_biq_rf_pipe1_alu_reg_fwd_vld;      
input           ctrl_biq_rf_pop_vld;                    
input           ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input           ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [81:0]  dp_biq_bypass_data;                     
input   [81:0]  dp_biq_create0_data;                    
input   [81:0]  dp_biq_create1_data;                    
input           dp_biq_create_src0_rdy_for_bypass;      
input           dp_biq_create_src1_rdy_for_bypass;      
input   [11:0]  dp_biq_rf_lch_entry;                    
input   [1 :0]  dp_biq_rf_rdy_clr;                      
input   [6 :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6 :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input           forever_cpuclk;                         
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
input           rtu_yy_xx_flush;                        
input           vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input           vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
output  [11:0]  biq_aiq_create0_entry;                  
output  [11:0]  biq_aiq_create1_entry;                  
output          biq_ctrl_1_left_updt;                   
output          biq_ctrl_empty;                         
output          biq_ctrl_full;                          
output          biq_ctrl_full_updt;                     
output          biq_ctrl_full_updt_clk_en;              
output  [11:0]  biq_dp_issue_entry;                     
output  [81:0]  biq_dp_issue_read_data;                 
output  [3 :0]  biq_top_biq_entry_cnt;                  
output          biq_xx_gateclk_issue_en;                
output          biq_xx_issue_en;                        

// &Regs; @29
reg     [10:0]  biq_entry0_create_agevec;               
reg     [81:0]  biq_entry0_create_data;                 
reg             biq_entry0_create_frz;                  
reg     [10:0]  biq_entry10_create_agevec;              
reg     [81:0]  biq_entry10_create_data;                
reg             biq_entry10_create_frz;                 
reg     [10:0]  biq_entry11_create_agevec;              
reg     [81:0]  biq_entry11_create_data;                
reg             biq_entry11_create_frz;                 
reg     [10:0]  biq_entry1_create_agevec;               
reg     [81:0]  biq_entry1_create_data;                 
reg             biq_entry1_create_frz;                  
reg     [10:0]  biq_entry2_create_agevec;               
reg     [81:0]  biq_entry2_create_data;                 
reg             biq_entry2_create_frz;                  
reg     [10:0]  biq_entry3_create_agevec;               
reg     [81:0]  biq_entry3_create_data;                 
reg             biq_entry3_create_frz;                  
reg     [10:0]  biq_entry4_create_agevec;               
reg     [81:0]  biq_entry4_create_data;                 
reg             biq_entry4_create_frz;                  
reg     [10:0]  biq_entry5_create_agevec;               
reg     [81:0]  biq_entry5_create_data;                 
reg             biq_entry5_create_frz;                  
reg     [10:0]  biq_entry6_create_agevec;               
reg     [81:0]  biq_entry6_create_data;                 
reg             biq_entry6_create_frz;                  
reg     [10:0]  biq_entry7_create_agevec;               
reg     [81:0]  biq_entry7_create_data;                 
reg             biq_entry7_create_frz;                  
reg     [10:0]  biq_entry8_create_agevec;               
reg     [81:0]  biq_entry8_create_data;                 
reg             biq_entry8_create_frz;                  
reg     [10:0]  biq_entry9_create_agevec;               
reg     [81:0]  biq_entry9_create_data;                 
reg             biq_entry9_create_frz;                  
reg     [3 :0]  biq_entry_cnt;                          
reg     [11:0]  biq_entry_create0_in;                   
reg     [11:0]  biq_entry_create1_in;                   
reg     [81:0]  biq_entry_read_data;                    

// &Wires; @30
wire    [11:0]  biq_aiq_create0_entry;                  
wire    [11:0]  biq_aiq_create1_entry;                  
wire            biq_bypass_dp_en;                       
wire            biq_bypass_en;                          
wire            biq_bypass_gateclk_en;                  
wire            biq_create0_rdy_bypass;                 
wire            biq_create0_rdy_bypass_dp;              
wire            biq_create0_rdy_bypass_gateclk;         
wire            biq_create_bypass_empty;                
wire            biq_ctrl_1_left_updt;                   
wire            biq_ctrl_empty;                         
wire            biq_ctrl_full;                          
wire            biq_ctrl_full_updt;                     
wire            biq_ctrl_full_updt_clk_en;              
wire    [11:0]  biq_dp_issue_entry;                     
wire    [81:0]  biq_dp_issue_read_data;                 
wire    [10:0]  biq_entry0_agevec;                      
wire    [1 :0]  biq_entry0_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry0_alu1_reg_fwd_vld;            
wire            biq_entry0_create_dp_en;                
wire            biq_entry0_create_en;                   
wire            biq_entry0_create_gateclk_en;           
wire            biq_entry0_frz_clr;                     
wire            biq_entry0_issue_en;                    
wire            biq_entry0_pop_cur_entry;               
wire    [10:0]  biq_entry0_pop_other_entry;             
wire            biq_entry0_rdy;                         
wire    [81:0]  biq_entry0_read_data;                   
wire            biq_entry0_vld;                         
wire            biq_entry0_vld_with_frz;                
wire    [10:0]  biq_entry10_agevec;                     
wire    [1 :0]  biq_entry10_alu0_reg_fwd_vld;           
wire    [1 :0]  biq_entry10_alu1_reg_fwd_vld;           
wire            biq_entry10_create_dp_en;               
wire            biq_entry10_create_en;                  
wire            biq_entry10_create_gateclk_en;          
wire            biq_entry10_frz_clr;                    
wire            biq_entry10_issue_en;                   
wire            biq_entry10_pop_cur_entry;              
wire    [10:0]  biq_entry10_pop_other_entry;            
wire            biq_entry10_rdy;                        
wire    [81:0]  biq_entry10_read_data;                  
wire            biq_entry10_vld;                        
wire            biq_entry10_vld_with_frz;               
wire    [10:0]  biq_entry11_agevec;                     
wire    [1 :0]  biq_entry11_alu0_reg_fwd_vld;           
wire    [1 :0]  biq_entry11_alu1_reg_fwd_vld;           
wire            biq_entry11_create_dp_en;               
wire            biq_entry11_create_en;                  
wire            biq_entry11_create_gateclk_en;          
wire            biq_entry11_frz_clr;                    
wire            biq_entry11_issue_en;                   
wire            biq_entry11_pop_cur_entry;              
wire    [10:0]  biq_entry11_pop_other_entry;            
wire            biq_entry11_rdy;                        
wire    [81:0]  biq_entry11_read_data;                  
wire            biq_entry11_vld;                        
wire            biq_entry11_vld_with_frz;               
wire    [10:0]  biq_entry1_agevec;                      
wire    [1 :0]  biq_entry1_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry1_alu1_reg_fwd_vld;            
wire            biq_entry1_create_dp_en;                
wire            biq_entry1_create_en;                   
wire            biq_entry1_create_gateclk_en;           
wire            biq_entry1_frz_clr;                     
wire            biq_entry1_issue_en;                    
wire            biq_entry1_pop_cur_entry;               
wire    [10:0]  biq_entry1_pop_other_entry;             
wire            biq_entry1_rdy;                         
wire    [81:0]  biq_entry1_read_data;                   
wire            biq_entry1_vld;                         
wire            biq_entry1_vld_with_frz;                
wire    [10:0]  biq_entry2_agevec;                      
wire    [1 :0]  biq_entry2_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry2_alu1_reg_fwd_vld;            
wire            biq_entry2_create_dp_en;                
wire            biq_entry2_create_en;                   
wire            biq_entry2_create_gateclk_en;           
wire            biq_entry2_frz_clr;                     
wire            biq_entry2_issue_en;                    
wire            biq_entry2_pop_cur_entry;               
wire    [10:0]  biq_entry2_pop_other_entry;             
wire            biq_entry2_rdy;                         
wire    [81:0]  biq_entry2_read_data;                   
wire            biq_entry2_vld;                         
wire            biq_entry2_vld_with_frz;                
wire    [10:0]  biq_entry3_agevec;                      
wire    [1 :0]  biq_entry3_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry3_alu1_reg_fwd_vld;            
wire            biq_entry3_create_dp_en;                
wire            biq_entry3_create_en;                   
wire            biq_entry3_create_gateclk_en;           
wire            biq_entry3_frz_clr;                     
wire            biq_entry3_issue_en;                    
wire            biq_entry3_pop_cur_entry;               
wire    [10:0]  biq_entry3_pop_other_entry;             
wire            biq_entry3_rdy;                         
wire    [81:0]  biq_entry3_read_data;                   
wire            biq_entry3_vld;                         
wire            biq_entry3_vld_with_frz;                
wire    [10:0]  biq_entry4_agevec;                      
wire    [1 :0]  biq_entry4_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry4_alu1_reg_fwd_vld;            
wire            biq_entry4_create_dp_en;                
wire            biq_entry4_create_en;                   
wire            biq_entry4_create_gateclk_en;           
wire            biq_entry4_frz_clr;                     
wire            biq_entry4_issue_en;                    
wire            biq_entry4_pop_cur_entry;               
wire    [10:0]  biq_entry4_pop_other_entry;             
wire            biq_entry4_rdy;                         
wire    [81:0]  biq_entry4_read_data;                   
wire            biq_entry4_vld;                         
wire            biq_entry4_vld_with_frz;                
wire    [10:0]  biq_entry5_agevec;                      
wire    [1 :0]  biq_entry5_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry5_alu1_reg_fwd_vld;            
wire            biq_entry5_create_dp_en;                
wire            biq_entry5_create_en;                   
wire            biq_entry5_create_gateclk_en;           
wire            biq_entry5_frz_clr;                     
wire            biq_entry5_issue_en;                    
wire            biq_entry5_pop_cur_entry;               
wire    [10:0]  biq_entry5_pop_other_entry;             
wire            biq_entry5_rdy;                         
wire    [81:0]  biq_entry5_read_data;                   
wire            biq_entry5_vld;                         
wire            biq_entry5_vld_with_frz;                
wire    [10:0]  biq_entry6_agevec;                      
wire    [1 :0]  biq_entry6_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry6_alu1_reg_fwd_vld;            
wire            biq_entry6_create_dp_en;                
wire            biq_entry6_create_en;                   
wire            biq_entry6_create_gateclk_en;           
wire            biq_entry6_frz_clr;                     
wire            biq_entry6_issue_en;                    
wire            biq_entry6_pop_cur_entry;               
wire    [10:0]  biq_entry6_pop_other_entry;             
wire            biq_entry6_rdy;                         
wire    [81:0]  biq_entry6_read_data;                   
wire            biq_entry6_vld;                         
wire            biq_entry6_vld_with_frz;                
wire    [10:0]  biq_entry7_agevec;                      
wire    [1 :0]  biq_entry7_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry7_alu1_reg_fwd_vld;            
wire            biq_entry7_create_dp_en;                
wire            biq_entry7_create_en;                   
wire            biq_entry7_create_gateclk_en;           
wire            biq_entry7_frz_clr;                     
wire            biq_entry7_issue_en;                    
wire            biq_entry7_pop_cur_entry;               
wire    [10:0]  biq_entry7_pop_other_entry;             
wire            biq_entry7_rdy;                         
wire    [81:0]  biq_entry7_read_data;                   
wire            biq_entry7_vld;                         
wire            biq_entry7_vld_with_frz;                
wire    [10:0]  biq_entry8_agevec;                      
wire    [1 :0]  biq_entry8_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry8_alu1_reg_fwd_vld;            
wire            biq_entry8_create_dp_en;                
wire            biq_entry8_create_en;                   
wire            biq_entry8_create_gateclk_en;           
wire            biq_entry8_frz_clr;                     
wire            biq_entry8_issue_en;                    
wire            biq_entry8_pop_cur_entry;               
wire    [10:0]  biq_entry8_pop_other_entry;             
wire            biq_entry8_rdy;                         
wire    [81:0]  biq_entry8_read_data;                   
wire            biq_entry8_vld;                         
wire            biq_entry8_vld_with_frz;                
wire    [10:0]  biq_entry9_agevec;                      
wire    [1 :0]  biq_entry9_alu0_reg_fwd_vld;            
wire    [1 :0]  biq_entry9_alu1_reg_fwd_vld;            
wire            biq_entry9_create_dp_en;                
wire            biq_entry9_create_en;                   
wire            biq_entry9_create_gateclk_en;           
wire            biq_entry9_frz_clr;                     
wire            biq_entry9_issue_en;                    
wire            biq_entry9_pop_cur_entry;               
wire    [10:0]  biq_entry9_pop_other_entry;             
wire            biq_entry9_rdy;                         
wire    [81:0]  biq_entry9_read_data;                   
wire            biq_entry9_vld;                         
wire            biq_entry9_vld_with_frz;                
wire    [3 :0]  biq_entry_cnt_create;                   
wire            biq_entry_cnt_create_0;                 
wire            biq_entry_cnt_create_1;                 
wire            biq_entry_cnt_create_2;                 
wire            biq_entry_cnt_pop_0;                    
wire            biq_entry_cnt_pop_1;                    
wire    [3 :0]  biq_entry_cnt_updt_val;                 
wire            biq_entry_cnt_updt_vld;                 
wire    [11:0]  biq_entry_create0_agevec;               
wire    [11:0]  biq_entry_create1_agevec;               
wire    [11:0]  biq_entry_create_dp_en;                 
wire    [11:0]  biq_entry_create_en;                    
wire    [11:0]  biq_entry_create_gateclk_en;            
wire    [11:0]  biq_entry_create_sel;                   
wire    [11:0]  biq_entry_issue_en;                     
wire    [11:0]  biq_entry_ready;                        
wire    [11:0]  biq_entry_vld;                          
wire    [11:0]  biq_older_entry_ready;                  
wire    [3 :0]  biq_top_biq_entry_cnt;                  
wire            biq_xx_gateclk_issue_en;                
wire            biq_xx_issue_en;                        
wire            cnt_clk;                                
wire            cnt_clk_en;                             
wire            cp0_idu_icg_en;                         
wire            cp0_idu_iq_bypass_disable;              
wire            cp0_yy_clk_en;                          
wire            cpurst_b;                               
wire            ctrl_biq_create0_dp_en;                 
wire            ctrl_biq_create0_en;                    
wire            ctrl_biq_create0_gateclk_en;            
wire            ctrl_biq_create1_dp_en;                 
wire            ctrl_biq_create1_en;                    
wire            ctrl_biq_create1_gateclk_en;            
wire            ctrl_biq_rf_lch_fail_vld;               
wire    [23:0]  ctrl_biq_rf_pipe0_alu_reg_fwd_vld;      
wire    [23:0]  ctrl_biq_rf_pipe1_alu_reg_fwd_vld;      
wire            ctrl_biq_rf_pop_vld;                    
wire            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [81:0]  dp_biq_bypass_data;                     
wire    [81:0]  dp_biq_create0_data;                    
wire    [81:0]  dp_biq_create1_data;                    
wire            dp_biq_create_src0_rdy_for_bypass;      
wire            dp_biq_create_src1_rdy_for_bypass;      
wire    [11:0]  dp_biq_rf_lch_entry;                    
wire    [1 :0]  dp_biq_rf_rdy_clr;                      
wire    [6 :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6 :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire            forever_cpuclk;                         
wire            iu_idu_div_inst_vld;                    
wire    [6 :0]  iu_idu_div_preg_dupx;                   
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire            lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6 :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire            pad_yy_icg_scan_en;                     
wire            rtu_idu_flush_fe;                       
wire            rtu_idu_flush_is;                       
wire            rtu_yy_xx_flush;                        
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           


parameter BIQ_WIDTH             = 82;

//==========================================================
//            Branch Issue Queue Create Control
//==========================================================
//-------------------gated cell instance--------------------
assign cnt_clk_en = (biq_entry_cnt[3:0] != 4'b0)
                    || ctrl_biq_create0_gateclk_en
                    || ctrl_biq_create1_gateclk_en;
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

assign biq_ctrl_full_updt_clk_en = cnt_clk_en;

//--------------------biq entry counter--------------------
//if create, add entry counter
assign biq_entry_cnt_create[3:0]   = {3'b0,ctrl_biq_create0_en}
                                     + {3'b0,ctrl_biq_create1_en};
//update valid and value
assign biq_entry_cnt_updt_vld      = ctrl_biq_create0_en
                                     || ctrl_biq_rf_pop_vld;
assign biq_entry_cnt_updt_val[3:0] = biq_entry_cnt[3:0]
                                     + biq_entry_cnt_create[3:0]
                                     - {3'b0,ctrl_biq_rf_pop_vld};
//implement entry counter
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    biq_entry_cnt[3:0] <= 4'b0;
  //after flush fe/is, the rf may wrongly pop before rtu_yy_xx_flush
  //need flush also when rtu_yy_xx_flush
  else if(rtu_idu_flush_fe || rtu_idu_flush_is || rtu_yy_xx_flush)
    biq_entry_cnt[3:0] <= 4'b0;
  else if(biq_entry_cnt_updt_vld)
    biq_entry_cnt[3:0] <= biq_entry_cnt_updt_val[3:0];
  else
    biq_entry_cnt[3:0] <= biq_entry_cnt[3:0];
end

assign biq_ctrl_full                    = (biq_entry_cnt[3:0] == 4'd12);

assign biq_top_biq_entry_cnt[3:0]       = biq_entry_cnt[3:0];

//---------------------biq entry full-----------------------
assign biq_entry_cnt_create_2 =  ctrl_biq_create1_en;
assign biq_entry_cnt_create_1 =  ctrl_biq_create0_en && !ctrl_biq_create1_en;
assign biq_entry_cnt_create_0 = !ctrl_biq_create0_en;

assign biq_entry_cnt_pop_1    =  ctrl_biq_rf_pop_vld;
assign biq_entry_cnt_pop_0    = !ctrl_biq_rf_pop_vld;

assign biq_ctrl_full_updt     = (biq_entry_cnt[3:0] == 4'd10)
                                && biq_entry_cnt_create_2
                                && biq_entry_cnt_pop_0
                             || (biq_entry_cnt[3:0] == 4'd11)
                                && biq_entry_cnt_create_1
                                && biq_entry_cnt_pop_0
                             || (biq_entry_cnt[3:0] == 4'd12)
                                && biq_entry_cnt_create_0
                                && biq_entry_cnt_pop_0;

assign biq_ctrl_1_left_updt   = (biq_entry_cnt[3:0] == 4'd9)
                                && biq_entry_cnt_create_2
                                && biq_entry_cnt_pop_0
                             || (biq_entry_cnt[3:0] == 4'd10)
                                && biq_entry_cnt_create_1
                                && biq_entry_cnt_pop_0
                             || (biq_entry_cnt[3:0] == 4'd10)
                                && biq_entry_cnt_create_2
                                && biq_entry_cnt_pop_1
                             || (biq_entry_cnt[3:0] == 4'd11)
                                && biq_entry_cnt_create_0
                                && biq_entry_cnt_pop_0
                             || (biq_entry_cnt[3:0] == 4'd11)
                                && biq_entry_cnt_create_1
                                && biq_entry_cnt_pop_1
                             || (biq_entry_cnt[3:0] == 4'd12)
                                && biq_entry_cnt_create_0
                                && biq_entry_cnt_pop_1;

//assign biq_full_entry_cnt_updt_val[3:0] = (biq_entry_cnt_updt_vld)
//                                           ? biq_entry_cnt_updt_val[3:0]
//                                           : biq_entry_cnt[3:0];
//
//assign biq_ctrl_full_updt   = (biq_full_entry_cnt_updt_val[3:0] == 4'd12);
//assign biq_ctrl_1_left_updt = (biq_full_entry_cnt_updt_val[3:0] == 4'd11);

//---------------------create bypass------------------------
//if create instruction is ready, it may bypass from issue queue
assign biq_create0_rdy_bypass    = ctrl_biq_create0_en
                                   && !cp0_idu_iq_bypass_disable
                                   && dp_biq_create_src0_rdy_for_bypass
                                   && dp_biq_create_src1_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign biq_create0_rdy_bypass_dp = ctrl_biq_create0_dp_en
                                   && !cp0_idu_iq_bypass_disable
                                   && dp_biq_create_src0_rdy_for_bypass
                                   && dp_biq_create_src1_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign biq_create0_rdy_bypass_gateclk = ctrl_biq_create0_gateclk_en
                                        && dp_biq_create_src0_rdy_for_bypass
                                        && dp_biq_create_src1_rdy_for_bypass;
//issue queue entry create control
assign biq_entry_vld[0]          = biq_entry0_vld;
assign biq_entry_vld[1]          = biq_entry1_vld;
assign biq_entry_vld[2]          = biq_entry2_vld;
assign biq_entry_vld[3]          = biq_entry3_vld;
assign biq_entry_vld[4]          = biq_entry4_vld;
assign biq_entry_vld[5]          = biq_entry5_vld;
assign biq_entry_vld[6]          = biq_entry6_vld;
assign biq_entry_vld[7]          = biq_entry7_vld;
assign biq_entry_vld[8]          = biq_entry8_vld;
assign biq_entry_vld[9]          = biq_entry9_vld;
assign biq_entry_vld[10]         = biq_entry10_vld;
assign biq_entry_vld[11]         = biq_entry11_vld;

assign biq_create_bypass_empty   = !(biq_entry0_vld_with_frz
                                     || biq_entry1_vld_with_frz
                                     || biq_entry2_vld_with_frz
                                     || biq_entry3_vld_with_frz
                                     || biq_entry4_vld_with_frz
                                     || biq_entry5_vld_with_frz
                                     || biq_entry6_vld_with_frz
                                     || biq_entry7_vld_with_frz
                                     || biq_entry8_vld_with_frz
                                     || biq_entry9_vld_with_frz
                                     || biq_entry10_vld_with_frz
                                     || biq_entry11_vld_with_frz);

assign biq_ctrl_empty            = !(|biq_entry_vld[11:0]);

//create0 priority is from entry 0 to 11
// &CombBeg; @169
always @( biq_entry3_vld
       or biq_entry10_vld
       or biq_entry8_vld
       or biq_entry9_vld
       or biq_entry1_vld
       or biq_entry4_vld
       or biq_entry7_vld
       or biq_entry11_vld
       or biq_entry0_vld
       or biq_entry2_vld
       or biq_entry6_vld
       or biq_entry5_vld)
begin
  if(!biq_entry0_vld)
    biq_entry_create0_in[11:0] = 12'b0000_0000_0001;
  else if(!biq_entry1_vld)
    biq_entry_create0_in[11:0] = 12'b0000_0000_0010;
  else if(!biq_entry2_vld)
    biq_entry_create0_in[11:0] = 12'b0000_0000_0100;
  else if(!biq_entry3_vld)
    biq_entry_create0_in[11:0] = 12'b0000_0000_1000;
  else if(!biq_entry4_vld)
    biq_entry_create0_in[11:0] = 12'b0000_0001_0000;
  else if(!biq_entry5_vld)
    biq_entry_create0_in[11:0] = 12'b0000_0010_0000;
  else if(!biq_entry6_vld)
    biq_entry_create0_in[11:0] = 12'b0000_0100_0000;
  else if(!biq_entry7_vld)
    biq_entry_create0_in[11:0] = 12'b0000_1000_0000;
  else if(!biq_entry8_vld)
    biq_entry_create0_in[11:0] = 12'b0001_0000_0000;
  else if(!biq_entry9_vld)
    biq_entry_create0_in[11:0] = 12'b0010_0000_0000;
  else if(!biq_entry10_vld)
    biq_entry_create0_in[11:0] = 12'b0100_0000_0000;
  else if(!biq_entry11_vld)
    biq_entry_create0_in[11:0] = 12'b1000_0000_0000;
  else
    biq_entry_create0_in[11:0] = 12'b0000_0000_0000;
// &CombEnd; @196
end
//create1 priority is from entry 11 to 0
// &CombBeg; @198
always @( biq_entry3_vld
       or biq_entry10_vld
       or biq_entry9_vld
       or biq_entry8_vld
       or biq_entry1_vld
       or biq_entry11_vld
       or biq_entry7_vld
       or biq_entry4_vld
       or biq_entry0_vld
       or biq_entry2_vld
       or biq_entry5_vld
       or biq_entry6_vld)
begin
  if(!biq_entry11_vld)
    biq_entry_create1_in[11:0] = 12'b1000_0000_0000;
  else if(!biq_entry10_vld)
    biq_entry_create1_in[11:0] = 12'b0100_0000_0000;
  else if(!biq_entry9_vld)
    biq_entry_create1_in[11:0] = 12'b0010_0000_0000;
  else if(!biq_entry8_vld)
    biq_entry_create1_in[11:0] = 12'b0001_0000_0000;
  else if(!biq_entry7_vld)
    biq_entry_create1_in[11:0] = 12'b0000_1000_0000;
  else if(!biq_entry6_vld)
    biq_entry_create1_in[11:0] = 12'b0000_0100_0000;
  else if(!biq_entry5_vld)
    biq_entry_create1_in[11:0] = 12'b0000_0010_0000;
  else if(!biq_entry4_vld)
    biq_entry_create1_in[11:0] = 12'b0000_0001_0000;
  else if(!biq_entry3_vld)
    biq_entry_create1_in[11:0] = 12'b0000_0000_1000;
  else if(!biq_entry2_vld)
    biq_entry_create1_in[11:0] = 12'b0000_0000_0100;
  else if(!biq_entry1_vld)
    biq_entry_create1_in[11:0] = 12'b0000_0000_0010;
  else if(!biq_entry0_vld)
    biq_entry_create1_in[11:0] = 12'b0000_0000_0001;
  else
    biq_entry_create1_in[11:0] = 12'b0000_0000_0000;
// &CombEnd; @225
end

assign biq_aiq_create0_entry[11:0] = biq_entry_create0_in[11:0];
assign biq_aiq_create1_entry[11:0] = biq_entry_create1_in[11:0];

assign biq_bypass_en            = biq_create_bypass_empty
                                  && biq_create0_rdy_bypass;

assign biq_entry_create_en[11:0] =
       {12{ctrl_biq_create0_en}} & biq_entry_create0_in[11:0]
     | {12{ctrl_biq_create1_en}} & biq_entry_create1_in[11:0];

assign biq_entry0_create_en  = biq_entry_create_en[0];
assign biq_entry1_create_en  = biq_entry_create_en[1];
assign biq_entry2_create_en  = biq_entry_create_en[2];
assign biq_entry3_create_en  = biq_entry_create_en[3];
assign biq_entry4_create_en  = biq_entry_create_en[4];
assign biq_entry5_create_en  = biq_entry_create_en[5];
assign biq_entry6_create_en  = biq_entry_create_en[6];
assign biq_entry7_create_en  = biq_entry_create_en[7];
assign biq_entry8_create_en  = biq_entry_create_en[8];
assign biq_entry9_create_en  = biq_entry_create_en[9];
assign biq_entry10_create_en = biq_entry_create_en[10];
assign biq_entry11_create_en = biq_entry_create_en[11];

assign biq_bypass_dp_en      = biq_create_bypass_empty
                                && biq_create0_rdy_bypass_dp;
assign biq_bypass_gateclk_en = biq_create_bypass_empty
                                && biq_create0_rdy_bypass_gateclk;

//issue queue entry create data path control
assign biq_entry_create_dp_en[11:0] =
       {12{ctrl_biq_create0_dp_en}} & biq_entry_create0_in[11:0]
     | {12{ctrl_biq_create1_dp_en}} & biq_entry_create1_in[11:0];

assign biq_entry0_create_dp_en  = biq_entry_create_dp_en[0];
assign biq_entry1_create_dp_en  = biq_entry_create_dp_en[1];
assign biq_entry2_create_dp_en  = biq_entry_create_dp_en[2];
assign biq_entry3_create_dp_en  = biq_entry_create_dp_en[3];
assign biq_entry4_create_dp_en  = biq_entry_create_dp_en[4];
assign biq_entry5_create_dp_en  = biq_entry_create_dp_en[5];
assign biq_entry6_create_dp_en  = biq_entry_create_dp_en[6];
assign biq_entry7_create_dp_en  = biq_entry_create_dp_en[7];
assign biq_entry8_create_dp_en  = biq_entry_create_dp_en[8];
assign biq_entry9_create_dp_en  = biq_entry_create_dp_en[9];
assign biq_entry10_create_dp_en = biq_entry_create_dp_en[10];
assign biq_entry11_create_dp_en = biq_entry_create_dp_en[11];

//issue queue entry create gateclk control
//ignore bypass signal for timing optimization
assign biq_entry_create_gateclk_en[11:0] =
       {12{ctrl_biq_create0_gateclk_en}} & biq_entry_create0_in[11:0]
     | {12{ctrl_biq_create1_gateclk_en}} & biq_entry_create1_in[11:0];

assign biq_entry0_create_gateclk_en  = biq_entry_create_gateclk_en[0];
assign biq_entry1_create_gateclk_en  = biq_entry_create_gateclk_en[1];
assign biq_entry2_create_gateclk_en  = biq_entry_create_gateclk_en[2];
assign biq_entry3_create_gateclk_en  = biq_entry_create_gateclk_en[3];
assign biq_entry4_create_gateclk_en  = biq_entry_create_gateclk_en[4];
assign biq_entry5_create_gateclk_en  = biq_entry_create_gateclk_en[5];
assign biq_entry6_create_gateclk_en  = biq_entry_create_gateclk_en[6];
assign biq_entry7_create_gateclk_en  = biq_entry_create_gateclk_en[7];
assign biq_entry8_create_gateclk_en  = biq_entry_create_gateclk_en[8];
assign biq_entry9_create_gateclk_en  = biq_entry_create_gateclk_en[9];
assign biq_entry10_create_gateclk_en = biq_entry_create_gateclk_en[10];
assign biq_entry11_create_gateclk_en = biq_entry_create_gateclk_en[11];

//biq create entry should consider pop signal and create0
assign biq_entry_create0_agevec[11:0] = biq_entry_vld[11:0]
                                        & ~({12{ctrl_biq_rf_pop_vld}}
                                           & dp_biq_rf_lch_entry[11:0]);

assign biq_entry_create1_agevec[11:0] = biq_entry_vld[11:0]
                                        & ~({12{ctrl_biq_rf_pop_vld}}
                                           & dp_biq_rf_lch_entry[11:0])
                                        | biq_entry_create0_in[11:0];

//create 0/1 select:
//entry 0~5 use ~biq_entry_create0_in for better timing
//entry 6~12 use biq_entry_create1_in for better timing
//biq_entry_create0/1_in cannot be both 1,
//if both 0, do not create
assign biq_entry_create_sel[11:6] = {6{ctrl_biq_create1_dp_en}}
                                     & biq_entry_create1_in[11:6];
assign biq_entry_create_sel[5:0]  = ~({6{ctrl_biq_create0_dp_en}}
                                      & biq_entry_create0_in[5:0]);

//----------------entry0 flop create signals----------------
// &CombBeg; @313
always @( biq_entry_create_sel[0]
       or biq_bypass_dp_en
       or biq_entry_create1_agevec[11:1]
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[11:1])
begin
  if(!biq_entry_create_sel[0]) begin
    biq_entry0_create_frz          = biq_bypass_dp_en;
    biq_entry0_create_agevec[10:0] = biq_entry_create0_agevec[11:1];
    biq_entry0_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry0_create_frz          = 1'b0;
    biq_entry0_create_agevec[10:0] = biq_entry_create1_agevec[11:1];
    biq_entry0_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @326
end

//----------------entry1 flop create signals----------------
// &CombBeg; @329
always @( biq_bypass_dp_en
       or dp_biq_create1_data[81:0]
       or biq_entry_create1_agevec[0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[11:2]
       or biq_entry_create1_agevec[11:2]
       or biq_entry_create0_agevec[0]
       or biq_entry_create_sel[1])
begin
  if(!biq_entry_create_sel[1]) begin
    biq_entry1_create_frz          = biq_bypass_dp_en;
    biq_entry1_create_agevec[10:0] = {biq_entry_create0_agevec[11:2],
                                       biq_entry_create0_agevec[0]};
    biq_entry1_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry1_create_frz          = 1'b0;
    biq_entry1_create_agevec[10:0] = {biq_entry_create1_agevec[11:2],
                                       biq_entry_create1_agevec[0]};
    biq_entry1_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @344
end

//----------------entry2 flop create signals----------------
// &CombBeg; @347
always @( biq_entry_create1_agevec[1:0]
       or biq_bypass_dp_en
       or biq_entry_create1_agevec[11:3]
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[11:3]
       or biq_entry_create0_agevec[1:0]
       or biq_entry_create_sel[2])
begin
  if(!biq_entry_create_sel[2]) begin
    biq_entry2_create_frz          = biq_bypass_dp_en;
    biq_entry2_create_agevec[10:0] = {biq_entry_create0_agevec[11:3],
                                       biq_entry_create0_agevec[1:0]};
    biq_entry2_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry2_create_frz          = 1'b0;
    biq_entry2_create_agevec[10:0] = {biq_entry_create1_agevec[11:3],
                                       biq_entry_create1_agevec[1:0]};
    biq_entry2_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @362
end

//----------------entry3 flop create signals----------------
// &CombBeg; @365
always @( biq_bypass_dp_en
       or biq_entry_create0_agevec[11:4]
       or biq_entry_create1_agevec[11:4]
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[2:0]
       or biq_entry_create1_agevec[2:0]
       or biq_entry_create_sel[3])
begin
  if(!biq_entry_create_sel[3]) begin
    biq_entry3_create_frz          = biq_bypass_dp_en;
    biq_entry3_create_agevec[10:0] = {biq_entry_create0_agevec[11:4],
                                       biq_entry_create0_agevec[2:0]};
    biq_entry3_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry3_create_frz          = 1'b0;
    biq_entry3_create_agevec[10:0] = {biq_entry_create1_agevec[11:4],
                                       biq_entry_create1_agevec[2:0]};
    biq_entry3_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @380
end

//----------------entry4 flop create signals----------------
// &CombBeg; @383
always @( biq_bypass_dp_en
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[11:5]
       or biq_entry_create_sel[4]
       or biq_entry_create1_agevec[11:5]
       or biq_entry_create0_agevec[3:0]
       or biq_entry_create1_agevec[3:0])
begin
  if(!biq_entry_create_sel[4]) begin
    biq_entry4_create_frz          = biq_bypass_dp_en;
    biq_entry4_create_agevec[10:0] = {biq_entry_create0_agevec[11:5],
                                       biq_entry_create0_agevec[3:0]};
    biq_entry4_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry4_create_frz          = 1'b0;
    biq_entry4_create_agevec[10:0] = {biq_entry_create1_agevec[11:5],
                                       biq_entry_create1_agevec[3:0]};
    biq_entry4_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @398
end

//----------------entry5 flop create signals----------------
// &CombBeg; @401
always @( biq_bypass_dp_en
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create1_agevec[4:0]
       or biq_entry_create0_agevec[4:0]
       or biq_entry_create_sel[5]
       or biq_entry_create0_agevec[11:6]
       or biq_entry_create1_agevec[11:6])
begin
  if(!biq_entry_create_sel[5]) begin
    biq_entry5_create_frz          = biq_bypass_dp_en;
    biq_entry5_create_agevec[10:0] = {biq_entry_create0_agevec[11:6],
                                       biq_entry_create0_agevec[4:0]};
    biq_entry5_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry5_create_frz          = 1'b0;
    biq_entry5_create_agevec[10:0] = {biq_entry_create1_agevec[11:6],
                                       biq_entry_create1_agevec[4:0]};
    biq_entry5_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @416
end

//----------------entry6 flop create signals----------------
// &CombBeg; @419
always @( biq_bypass_dp_en
       or biq_entry_create0_agevec[5:0]
       or biq_entry_create0_agevec[11:7]
       or biq_entry_create_sel[6]
       or biq_entry_create1_agevec[5:0]
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create1_agevec[11:7])
begin
  if(!biq_entry_create_sel[6]) begin
    biq_entry6_create_frz          = biq_bypass_dp_en;
    biq_entry6_create_agevec[10:0] = {biq_entry_create0_agevec[11:7],
                                       biq_entry_create0_agevec[5:0]};
    biq_entry6_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry6_create_frz          = 1'b0;
    biq_entry6_create_agevec[10:0] = {biq_entry_create1_agevec[11:7],
                                       biq_entry_create1_agevec[5:0]};
    biq_entry6_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @434
end

//----------------entry7 flop create signals----------------
// &CombBeg; @437
always @( biq_bypass_dp_en
       or biq_entry_create_sel[7]
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[6:0]
       or biq_entry_create0_agevec[11:8]
       or biq_entry_create1_agevec[11:8]
       or biq_entry_create1_agevec[6:0])
begin
  if(!biq_entry_create_sel[7]) begin
    biq_entry7_create_frz          = biq_bypass_dp_en;
    biq_entry7_create_agevec[10:0] = {biq_entry_create0_agevec[11:8],
                                       biq_entry_create0_agevec[6:0]};
    biq_entry7_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry7_create_frz          = 1'b0;
    biq_entry7_create_agevec[10:0] = {biq_entry_create1_agevec[11:8],
                                       biq_entry_create1_agevec[6:0]};
    biq_entry7_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @452
end

//----------------entry8 flop create signals----------------
// &CombBeg; @455
always @( biq_entry_create1_agevec[7:0]
       or biq_bypass_dp_en
       or biq_entry_create1_agevec[11:9]
       or biq_entry_create0_agevec[11:9]
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create_sel[8]
       or biq_entry_create0_agevec[7:0])
begin
  if(!biq_entry_create_sel[8]) begin
    biq_entry8_create_frz          = biq_bypass_dp_en;
    biq_entry8_create_agevec[10:0] = {biq_entry_create0_agevec[11:9],
                                       biq_entry_create0_agevec[7:0]};
    biq_entry8_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry8_create_frz          = 1'b0;
    biq_entry8_create_agevec[10:0] = {biq_entry_create1_agevec[11:9],
                                       biq_entry_create1_agevec[7:0]};
    biq_entry8_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @470
end

//----------------entry9 flop create signals----------------
// &CombBeg; @473
always @( biq_bypass_dp_en
       or dp_biq_create1_data[81:0]
       or biq_entry_create1_agevec[8:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[8:0]
       or biq_entry_create1_agevec[11:10]
       or biq_entry_create_sel[9]
       or biq_entry_create0_agevec[11:10])
begin
  if(!biq_entry_create_sel[9]) begin
    biq_entry9_create_frz          = biq_bypass_dp_en;
    biq_entry9_create_agevec[10:0] = {biq_entry_create0_agevec[11:10],
                                       biq_entry_create0_agevec[8:0]};
    biq_entry9_create_data[BIQ_WIDTH-1:0] =
       dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry9_create_frz          = 1'b0;
    biq_entry9_create_agevec[10:0] = {biq_entry_create1_agevec[11:10],
                                       biq_entry_create1_agevec[8:0]};
    biq_entry9_create_data[BIQ_WIDTH-1:0] = 
       dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @488
end

//---------------entry10 flop create signals----------------
// &CombBeg; @491
always @( biq_bypass_dp_en
       or biq_entry_create1_agevec[11]
       or dp_biq_create1_data[81:0]
       or biq_entry_create1_agevec[9:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create0_agevec[9:0]
       or biq_entry_create0_agevec[11]
       or biq_entry_create_sel[10])
begin
  if(!biq_entry_create_sel[10]) begin
    biq_entry10_create_frz          = biq_bypass_dp_en;
    biq_entry10_create_agevec[10:0] = {biq_entry_create0_agevec[11],
                                        biq_entry_create0_agevec[9:0]};
    biq_entry10_create_data[BIQ_WIDTH-1:0] =
        dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry10_create_frz          = 1'b0;
    biq_entry10_create_agevec[10:0] = {biq_entry_create1_agevec[11],
                                        biq_entry_create1_agevec[9:0]};
    biq_entry10_create_data[BIQ_WIDTH-1:0] = 
        dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @506
end

//---------------entry11 flop create signals----------------
// &CombBeg; @509
always @( biq_bypass_dp_en
       or dp_biq_create1_data[81:0]
       or dp_biq_create0_data[81:0]
       or biq_entry_create_sel[11]
       or biq_entry_create0_agevec[10:0]
       or biq_entry_create1_agevec[10:0])
begin
  if(!biq_entry_create_sel[11]) begin
    biq_entry11_create_frz          = biq_bypass_dp_en;
    biq_entry11_create_agevec[10:0] = biq_entry_create0_agevec[10:0];
    biq_entry11_create_data[BIQ_WIDTH-1:0] =
        dp_biq_create0_data[BIQ_WIDTH-1:0];
  end
  else begin
    biq_entry11_create_frz          = 1'b0;
    biq_entry11_create_agevec[10:0] = biq_entry_create1_agevec[10:0];
    biq_entry11_create_data[BIQ_WIDTH-1:0] = 
        dp_biq_create1_data[BIQ_WIDTH-1:0];
  end
// &CombEnd; @522
end

//==========================================================
//             Branch Issue Queue Issue Control
//==========================================================
//----------------Pipe0 Launch Ready Signals----------------
assign biq_entry0_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[1:0];
assign biq_entry1_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[3:2];
assign biq_entry2_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[5:4];
assign biq_entry3_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[7:6];
assign biq_entry4_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[9:8];
assign biq_entry5_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[11:10];
assign biq_entry6_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[13:12];
assign biq_entry7_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[15:14];
assign biq_entry8_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[17:16];
assign biq_entry9_alu0_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[19:18];
assign biq_entry10_alu0_reg_fwd_vld[1:0] = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[21:20];
assign biq_entry11_alu0_reg_fwd_vld[1:0] = ctrl_biq_rf_pipe0_alu_reg_fwd_vld[23:22];

assign biq_entry0_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[1:0];
assign biq_entry1_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[3:2];
assign biq_entry2_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[5:4];
assign biq_entry3_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[7:6];
assign biq_entry4_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[9:8];
assign biq_entry5_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[11:10];
assign biq_entry6_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[13:12];
assign biq_entry7_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[15:14];
assign biq_entry8_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[17:16];
assign biq_entry9_alu1_reg_fwd_vld[1:0]  = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[19:18];
assign biq_entry10_alu1_reg_fwd_vld[1:0] = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[21:20];
assign biq_entry11_alu1_reg_fwd_vld[1:0] = ctrl_biq_rf_pipe1_alu_reg_fwd_vld[23:22];

//-------------------issue enable signals-------------------
assign biq_entry_ready[0]      = biq_entry0_rdy;
assign biq_entry_ready[1]      = biq_entry1_rdy;
assign biq_entry_ready[2]      = biq_entry2_rdy;
assign biq_entry_ready[3]      = biq_entry3_rdy;
assign biq_entry_ready[4]      = biq_entry4_rdy;
assign biq_entry_ready[5]      = biq_entry5_rdy;
assign biq_entry_ready[6]      = biq_entry6_rdy;
assign biq_entry_ready[7]      = biq_entry7_rdy;
assign biq_entry_ready[8]      = biq_entry8_rdy;
assign biq_entry_ready[9]      = biq_entry9_rdy;
assign biq_entry_ready[10]     = biq_entry10_rdy;
assign biq_entry_ready[11]     = biq_entry11_rdy;
//if there is any entry ready or bypass enable, issue enable
assign biq_xx_issue_en         = |{biq_bypass_en,
                                   biq_entry_ready[11:0]};
//gate clock issue enable with timing optimization
assign biq_xx_gateclk_issue_en = biq_bypass_gateclk_en
                                 || biq_entry0_vld_with_frz
                                 || biq_entry1_vld_with_frz
                                 || biq_entry2_vld_with_frz
                                 || biq_entry3_vld_with_frz
                                 || biq_entry4_vld_with_frz
                                 || biq_entry5_vld_with_frz
                                 || biq_entry6_vld_with_frz
                                 || biq_entry7_vld_with_frz
                                 || biq_entry8_vld_with_frz
                                 || biq_entry9_vld_with_frz
                                 || biq_entry10_vld_with_frz
                                 || biq_entry11_vld_with_frz;
//first find older ready entry
assign biq_older_entry_ready[0]  = |(biq_entry0_agevec[10:0]
                                     & biq_entry_ready[11:1]);
assign biq_older_entry_ready[1]  = |(biq_entry1_agevec[10:0]
                                     & {biq_entry_ready[11:2],
                                        biq_entry_ready[0]});
assign biq_older_entry_ready[2]  = |(biq_entry2_agevec[10:0]
                                     & {biq_entry_ready[11:3],
                                        biq_entry_ready[1:0]});
assign biq_older_entry_ready[3]  = |(biq_entry3_agevec[10:0]
                                     & {biq_entry_ready[11:4],
                                        biq_entry_ready[2:0]});
assign biq_older_entry_ready[4]  = |(biq_entry4_agevec[10:0]
                                     & {biq_entry_ready[11:5],
                                        biq_entry_ready[3:0]});
assign biq_older_entry_ready[5]  = |(biq_entry5_agevec[10:0]
                                     & {biq_entry_ready[11:6],
                                        biq_entry_ready[4:0]});
assign biq_older_entry_ready[6]  = |(biq_entry6_agevec[10:0]
                                     & {biq_entry_ready[11:7],
                                        biq_entry_ready[5:0]});
assign biq_older_entry_ready[7]  = |(biq_entry7_agevec[10:0]
                                     & {biq_entry_ready[11:8],
                                        biq_entry_ready[6:0]});
assign biq_older_entry_ready[8]  = |(biq_entry8_agevec[10:0]
                                     & {biq_entry_ready[11:9],
                                        biq_entry_ready[7:0]});
assign biq_older_entry_ready[9]  = |(biq_entry9_agevec[10:0]
                                     & {biq_entry_ready[11:10],
                                        biq_entry_ready[8:0]});
assign biq_older_entry_ready[10] = |(biq_entry10_agevec[10:0]
                                     & {biq_entry_ready[11],
                                        biq_entry_ready[9:0]});
assign biq_older_entry_ready[11] = |(biq_entry11_agevec[10:0]
                                     & biq_entry_ready[10:0]);

//------------------entry issue enable signals--------------
//not ready if older ready exists
assign biq_entry_issue_en[11:0]  = biq_entry_ready[11:0]
                                   & ~biq_older_entry_ready[11:0];
//rename for entries
assign biq_entry0_issue_en      = biq_entry_issue_en[0];
assign biq_entry1_issue_en      = biq_entry_issue_en[1];
assign biq_entry2_issue_en      = biq_entry_issue_en[2];
assign biq_entry3_issue_en      = biq_entry_issue_en[3];
assign biq_entry4_issue_en      = biq_entry_issue_en[4];
assign biq_entry5_issue_en      = biq_entry_issue_en[5];
assign biq_entry6_issue_en      = biq_entry_issue_en[6];
assign biq_entry7_issue_en      = biq_entry_issue_en[7];
assign biq_entry8_issue_en      = biq_entry_issue_en[8];
assign biq_entry9_issue_en      = biq_entry_issue_en[9];
assign biq_entry10_issue_en     = biq_entry_issue_en[10];
assign biq_entry11_issue_en     = biq_entry_issue_en[11];

//-----------------issue entry indiction--------------------
assign biq_dp_issue_entry[11:0] = (biq_create_bypass_empty)
                                  ? biq_entry_create0_in[11:0]
                                  : biq_entry_issue_en[11:0];

//-----------------issue data path selection----------------
//issue data path will select oldest ready entry in issue queue
//if no instruction valid, the data path will always select bypass 
//data path
// &CombBeg; @647
always @( biq_entry3_read_data[81:0]
       or biq_entry2_read_data[81:0]
       or biq_entry7_read_data[81:0]
       or biq_entry11_read_data[81:0]
       or biq_entry10_read_data[81:0]
       or biq_entry5_read_data[81:0]
       or biq_entry_issue_en[11:0]
       or biq_entry4_read_data[81:0]
       or biq_entry0_read_data[81:0]
       or biq_entry1_read_data[81:0]
       or biq_entry6_read_data[81:0]
       or biq_entry8_read_data[81:0]
       or biq_entry9_read_data[81:0])
begin
  case (biq_entry_issue_en[11:0])
    12'h001: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry0_read_data[BIQ_WIDTH-1:0];
    12'h002: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry1_read_data[BIQ_WIDTH-1:0];
    12'h004: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry2_read_data[BIQ_WIDTH-1:0];
    12'h008: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry3_read_data[BIQ_WIDTH-1:0];
    12'h010: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry4_read_data[BIQ_WIDTH-1:0];
    12'h020: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry5_read_data[BIQ_WIDTH-1:0];
    12'h040: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry6_read_data[BIQ_WIDTH-1:0];
    12'h080: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry7_read_data[BIQ_WIDTH-1:0];
    12'h100: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry8_read_data[BIQ_WIDTH-1:0];
    12'h200: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry9_read_data[BIQ_WIDTH-1:0];
    12'h400: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry10_read_data[BIQ_WIDTH-1:0];
    12'h800: biq_entry_read_data[BIQ_WIDTH-1:0] =
               biq_entry11_read_data[BIQ_WIDTH-1:0];
    default: biq_entry_read_data[BIQ_WIDTH-1:0] =
                                    {BIQ_WIDTH{1'bx}};
  endcase
// &CombEnd; @676
end

//if no entry valid, select bypass path
assign biq_dp_issue_read_data[BIQ_WIDTH-1:0] = 
         (biq_create_bypass_empty)
         ? dp_biq_bypass_data[BIQ_WIDTH-1:0]
         : biq_entry_read_data[BIQ_WIDTH-1:0];

//==========================================================
//            Branch Issue Queue Launch Control
//==========================================================
//-------------------entry pop enable signals---------------
//pop when rf launch pass
assign {biq_entry0_pop_other_entry[10:0],
        biq_entry0_pop_cur_entry}          = dp_biq_rf_lch_entry[11:0];
assign {biq_entry1_pop_other_entry[10:1],  
        biq_entry1_pop_cur_entry,
        biq_entry1_pop_other_entry[0]}     = dp_biq_rf_lch_entry[11:0];
assign {biq_entry2_pop_other_entry[10:2],  
        biq_entry2_pop_cur_entry,
        biq_entry2_pop_other_entry[1:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry3_pop_other_entry[10:3],  
        biq_entry3_pop_cur_entry,
        biq_entry3_pop_other_entry[2:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry4_pop_other_entry[10:4],  
        biq_entry4_pop_cur_entry,
        biq_entry4_pop_other_entry[3:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry5_pop_other_entry[10:5],  
        biq_entry5_pop_cur_entry,
        biq_entry5_pop_other_entry[4:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry6_pop_other_entry[10:6],  
        biq_entry6_pop_cur_entry,
        biq_entry6_pop_other_entry[5:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry7_pop_other_entry[10:7],  
        biq_entry7_pop_cur_entry,
        biq_entry7_pop_other_entry[6:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry8_pop_other_entry[10:8],  
        biq_entry8_pop_cur_entry,
        biq_entry8_pop_other_entry[7:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry9_pop_other_entry[10:9],  
        biq_entry9_pop_cur_entry,
        biq_entry9_pop_other_entry[8:0]}   = dp_biq_rf_lch_entry[11:0];
assign {biq_entry10_pop_other_entry[10],
        biq_entry10_pop_cur_entry,
        biq_entry10_pop_other_entry[9:0]}  = dp_biq_rf_lch_entry[11:0];
assign {biq_entry11_pop_cur_entry,
        biq_entry11_pop_other_entry[10:0]} = dp_biq_rf_lch_entry[11:0];

//-------------------entry spec fail signals---------------
//clear freeze and source rdy when launch fail
assign biq_entry0_frz_clr      = ctrl_biq_rf_lch_fail_vld
                                 && dp_biq_rf_lch_entry[0];
assign biq_entry1_frz_clr      = ctrl_biq_rf_lch_fail_vld
                                 && dp_biq_rf_lch_entry[1];
assign biq_entry2_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[2];
assign biq_entry3_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[3];
assign biq_entry4_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[4];
assign biq_entry5_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[5];
assign biq_entry6_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[6];
assign biq_entry7_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[7];
assign biq_entry8_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[8];
assign biq_entry9_frz_clr      = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[9];
assign biq_entry10_frz_clr     = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[10];
assign biq_entry11_frz_clr     = ctrl_biq_rf_lch_fail_vld 
                                 && dp_biq_rf_lch_entry[11];

//==========================================================
//             Branch Issue Queue Entry Instance
//==========================================================
// &ConnRule(s/^x_/biq_entry0_/); @754
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry0"); @755
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry0 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry0_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry0_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry0_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry0_create_agevec               ),
  .x_create_data                           (biq_entry0_create_data                 ),
  .x_create_dp_en                          (biq_entry0_create_dp_en                ),
  .x_create_en                             (biq_entry0_create_en                   ),
  .x_create_frz                            (biq_entry0_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry0_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry0_frz_clr                     ),
  .x_issue_en                              (biq_entry0_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry0_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry0_pop_other_entry             ),
  .x_rdy                                   (biq_entry0_rdy                         ),
  .x_read_data                             (biq_entry0_read_data                   ),
  .x_vld                                   (biq_entry0_vld                         ),
  .x_vld_with_frz                          (biq_entry0_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry1_/); @757
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry1"); @758
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry1 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry1_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry1_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry1_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry1_create_agevec               ),
  .x_create_data                           (biq_entry1_create_data                 ),
  .x_create_dp_en                          (biq_entry1_create_dp_en                ),
  .x_create_en                             (biq_entry1_create_en                   ),
  .x_create_frz                            (biq_entry1_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry1_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry1_frz_clr                     ),
  .x_issue_en                              (biq_entry1_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry1_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry1_pop_other_entry             ),
  .x_rdy                                   (biq_entry1_rdy                         ),
  .x_read_data                             (biq_entry1_read_data                   ),
  .x_vld                                   (biq_entry1_vld                         ),
  .x_vld_with_frz                          (biq_entry1_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry2_/); @760
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry2"); @761
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry2 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry2_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry2_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry2_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry2_create_agevec               ),
  .x_create_data                           (biq_entry2_create_data                 ),
  .x_create_dp_en                          (biq_entry2_create_dp_en                ),
  .x_create_en                             (biq_entry2_create_en                   ),
  .x_create_frz                            (biq_entry2_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry2_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry2_frz_clr                     ),
  .x_issue_en                              (biq_entry2_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry2_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry2_pop_other_entry             ),
  .x_rdy                                   (biq_entry2_rdy                         ),
  .x_read_data                             (biq_entry2_read_data                   ),
  .x_vld                                   (biq_entry2_vld                         ),
  .x_vld_with_frz                          (biq_entry2_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry3_/); @763
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry3"); @764
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry3 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry3_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry3_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry3_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry3_create_agevec               ),
  .x_create_data                           (biq_entry3_create_data                 ),
  .x_create_dp_en                          (biq_entry3_create_dp_en                ),
  .x_create_en                             (biq_entry3_create_en                   ),
  .x_create_frz                            (biq_entry3_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry3_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry3_frz_clr                     ),
  .x_issue_en                              (biq_entry3_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry3_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry3_pop_other_entry             ),
  .x_rdy                                   (biq_entry3_rdy                         ),
  .x_read_data                             (biq_entry3_read_data                   ),
  .x_vld                                   (biq_entry3_vld                         ),
  .x_vld_with_frz                          (biq_entry3_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry4_/); @766
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry4"); @767
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry4 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry4_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry4_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry4_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry4_create_agevec               ),
  .x_create_data                           (biq_entry4_create_data                 ),
  .x_create_dp_en                          (biq_entry4_create_dp_en                ),
  .x_create_en                             (biq_entry4_create_en                   ),
  .x_create_frz                            (biq_entry4_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry4_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry4_frz_clr                     ),
  .x_issue_en                              (biq_entry4_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry4_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry4_pop_other_entry             ),
  .x_rdy                                   (biq_entry4_rdy                         ),
  .x_read_data                             (biq_entry4_read_data                   ),
  .x_vld                                   (biq_entry4_vld                         ),
  .x_vld_with_frz                          (biq_entry4_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry5_/); @769
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry5"); @770
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry5 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry5_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry5_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry5_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry5_create_agevec               ),
  .x_create_data                           (biq_entry5_create_data                 ),
  .x_create_dp_en                          (biq_entry5_create_dp_en                ),
  .x_create_en                             (biq_entry5_create_en                   ),
  .x_create_frz                            (biq_entry5_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry5_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry5_frz_clr                     ),
  .x_issue_en                              (biq_entry5_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry5_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry5_pop_other_entry             ),
  .x_rdy                                   (biq_entry5_rdy                         ),
  .x_read_data                             (biq_entry5_read_data                   ),
  .x_vld                                   (biq_entry5_vld                         ),
  .x_vld_with_frz                          (biq_entry5_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry6_/); @772
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry6"); @773
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry6 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry6_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry6_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry6_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry6_create_agevec               ),
  .x_create_data                           (biq_entry6_create_data                 ),
  .x_create_dp_en                          (biq_entry6_create_dp_en                ),
  .x_create_en                             (biq_entry6_create_en                   ),
  .x_create_frz                            (biq_entry6_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry6_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry6_frz_clr                     ),
  .x_issue_en                              (biq_entry6_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry6_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry6_pop_other_entry             ),
  .x_rdy                                   (biq_entry6_rdy                         ),
  .x_read_data                             (biq_entry6_read_data                   ),
  .x_vld                                   (biq_entry6_vld                         ),
  .x_vld_with_frz                          (biq_entry6_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry7_/); @775
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry7"); @776
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry7 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry7_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry7_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry7_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry7_create_agevec               ),
  .x_create_data                           (biq_entry7_create_data                 ),
  .x_create_dp_en                          (biq_entry7_create_dp_en                ),
  .x_create_en                             (biq_entry7_create_en                   ),
  .x_create_frz                            (biq_entry7_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry7_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry7_frz_clr                     ),
  .x_issue_en                              (biq_entry7_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry7_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry7_pop_other_entry             ),
  .x_rdy                                   (biq_entry7_rdy                         ),
  .x_read_data                             (biq_entry7_read_data                   ),
  .x_vld                                   (biq_entry7_vld                         ),
  .x_vld_with_frz                          (biq_entry7_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry8_/); @778
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry8"); @779
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry8 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry8_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry8_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry8_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry8_create_agevec               ),
  .x_create_data                           (biq_entry8_create_data                 ),
  .x_create_dp_en                          (biq_entry8_create_dp_en                ),
  .x_create_en                             (biq_entry8_create_en                   ),
  .x_create_frz                            (biq_entry8_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry8_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry8_frz_clr                     ),
  .x_issue_en                              (biq_entry8_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry8_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry8_pop_other_entry             ),
  .x_rdy                                   (biq_entry8_rdy                         ),
  .x_read_data                             (biq_entry8_read_data                   ),
  .x_vld                                   (biq_entry8_vld                         ),
  .x_vld_with_frz                          (biq_entry8_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry9_/); @781
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry9"); @782
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry9 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry9_agevec                      ),
  .x_alu0_reg_fwd_vld                      (biq_entry9_alu0_reg_fwd_vld            ),
  .x_alu1_reg_fwd_vld                      (biq_entry9_alu1_reg_fwd_vld            ),
  .x_create_agevec                         (biq_entry9_create_agevec               ),
  .x_create_data                           (biq_entry9_create_data                 ),
  .x_create_dp_en                          (biq_entry9_create_dp_en                ),
  .x_create_en                             (biq_entry9_create_en                   ),
  .x_create_frz                            (biq_entry9_create_frz                  ),
  .x_create_gateclk_en                     (biq_entry9_create_gateclk_en           ),
  .x_frz_clr                               (biq_entry9_frz_clr                     ),
  .x_issue_en                              (biq_entry9_issue_en                    ),
  .x_pop_cur_entry                         (biq_entry9_pop_cur_entry               ),
  .x_pop_other_entry                       (biq_entry9_pop_other_entry             ),
  .x_rdy                                   (biq_entry9_rdy                         ),
  .x_read_data                             (biq_entry9_read_data                   ),
  .x_vld                                   (biq_entry9_vld                         ),
  .x_vld_with_frz                          (biq_entry9_vld_with_frz                )
);


// &ConnRule(s/^x_/biq_entry10_/); @784
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry10"); @785
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry10 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry10_agevec                     ),
  .x_alu0_reg_fwd_vld                      (biq_entry10_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (biq_entry10_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (biq_entry10_create_agevec              ),
  .x_create_data                           (biq_entry10_create_data                ),
  .x_create_dp_en                          (biq_entry10_create_dp_en               ),
  .x_create_en                             (biq_entry10_create_en                  ),
  .x_create_frz                            (biq_entry10_create_frz                 ),
  .x_create_gateclk_en                     (biq_entry10_create_gateclk_en          ),
  .x_frz_clr                               (biq_entry10_frz_clr                    ),
  .x_issue_en                              (biq_entry10_issue_en                   ),
  .x_pop_cur_entry                         (biq_entry10_pop_cur_entry              ),
  .x_pop_other_entry                       (biq_entry10_pop_other_entry            ),
  .x_rdy                                   (biq_entry10_rdy                        ),
  .x_read_data                             (biq_entry10_read_data                  ),
  .x_vld                                   (biq_entry10_vld                        ),
  .x_vld_with_frz                          (biq_entry10_vld_with_frz               )
);


// &ConnRule(s/^x_/biq_entry11_/); @787
// &Instance("ct_idu_is_biq_entry", "x_ct_idu_is_biq_entry11"); @788
ct_idu_is_biq_entry  x_ct_idu_is_biq_entry11 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dupx           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dupx           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
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
  .x_agevec                                (biq_entry11_agevec                     ),
  .x_alu0_reg_fwd_vld                      (biq_entry11_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (biq_entry11_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (biq_entry11_create_agevec              ),
  .x_create_data                           (biq_entry11_create_data                ),
  .x_create_dp_en                          (biq_entry11_create_dp_en               ),
  .x_create_en                             (biq_entry11_create_en                  ),
  .x_create_frz                            (biq_entry11_create_frz                 ),
  .x_create_gateclk_en                     (biq_entry11_create_gateclk_en          ),
  .x_frz_clr                               (biq_entry11_frz_clr                    ),
  .x_issue_en                              (biq_entry11_issue_en                   ),
  .x_pop_cur_entry                         (biq_entry11_pop_cur_entry              ),
  .x_pop_other_entry                       (biq_entry11_pop_other_entry            ),
  .x_rdy                                   (biq_entry11_rdy                        ),
  .x_read_data                             (biq_entry11_read_data                  ),
  .x_vld                                   (biq_entry11_vld                        ),
  .x_vld_with_frz                          (biq_entry11_vld_with_frz               )
);


// &ModuleEnd; @790
endmodule


