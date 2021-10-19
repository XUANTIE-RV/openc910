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
module ct_idu_is_lsiq(
  cp0_idu_icg_en,
  cp0_idu_iq_bypass_disable,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_lsiq_create0_dp_en,
  ctrl_lsiq_create0_en,
  ctrl_lsiq_create0_gateclk_en,
  ctrl_lsiq_create1_dp_en,
  ctrl_lsiq_create1_en,
  ctrl_lsiq_create1_gateclk_en,
  ctrl_lsiq_ir_bar_inst_vld,
  ctrl_lsiq_is_bar_inst_vld,
  ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld,
  ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld,
  ctrl_lsiq_rf_pipe3_lch_fail_vld,
  ctrl_lsiq_rf_pipe4_lch_fail_vld,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_lsiq_bypass_data,
  dp_lsiq_create0_bar,
  dp_lsiq_create0_data,
  dp_lsiq_create0_load,
  dp_lsiq_create0_no_spec,
  dp_lsiq_create0_src0_rdy_for_bypass,
  dp_lsiq_create0_src1_rdy_for_bypass,
  dp_lsiq_create0_srcvm_rdy_for_bypass,
  dp_lsiq_create0_store,
  dp_lsiq_create1_bar,
  dp_lsiq_create1_data,
  dp_lsiq_create1_load,
  dp_lsiq_create1_no_spec,
  dp_lsiq_create1_store,
  dp_lsiq_rf_pipe3_lch_entry,
  dp_lsiq_rf_pipe3_rdy_clr,
  dp_lsiq_rf_pipe4_lch_entry,
  dp_lsiq_rf_pipe4_rdy_clr,
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
  lsiq_aiq_create0_entry,
  lsiq_aiq_create1_entry,
  lsiq_ctrl_1_left_updt,
  lsiq_ctrl_empty,
  lsiq_ctrl_full,
  lsiq_ctrl_full_updt,
  lsiq_ctrl_full_updt_clk_en,
  lsiq_dp_create_bypass_oldest,
  lsiq_dp_no_spec_store_vld,
  lsiq_dp_pipe3_issue_entry,
  lsiq_dp_pipe3_issue_read_data,
  lsiq_dp_pipe4_issue_entry,
  lsiq_dp_pipe4_issue_read_data,
  lsiq_top_frz_entry_vld,
  lsiq_top_lsiq_entry_cnt,
  lsiq_xx_gateclk_issue_en,
  lsiq_xx_pipe3_issue_en,
  lsiq_xx_pipe4_issue_en,
  lsu_idu_ag_pipe3_load_inst_vld,
  lsu_idu_ag_pipe3_preg_dupx,
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_already_da,
  lsu_idu_bkpta_data,
  lsu_idu_bkptb_data,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_lq_full,
  lsu_idu_lq_full_gateclk_en,
  lsu_idu_lq_not_full,
  lsu_idu_lsiq_pop0_vld,
  lsu_idu_lsiq_pop1_vld,
  lsu_idu_lsiq_pop_entry,
  lsu_idu_lsiq_pop_vld,
  lsu_idu_no_fence,
  lsu_idu_rb_full,
  lsu_idu_rb_full_gateclk_en,
  lsu_idu_rb_not_full,
  lsu_idu_secd,
  lsu_idu_spec_fail,
  lsu_idu_sq_full,
  lsu_idu_sq_full_gateclk_en,
  lsu_idu_sq_not_full,
  lsu_idu_tlb_busy,
  lsu_idu_tlb_busy_gateclk_en,
  lsu_idu_tlb_wakeup,
  lsu_idu_unalign_gateclk_en,
  lsu_idu_wait_fence,
  lsu_idu_wait_fence_gateclk_en,
  lsu_idu_wait_old,
  lsu_idu_wait_old_gateclk_en,
  lsu_idu_wakeup,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_yy_xx_flush,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx
);

// &Ports; @28
input            cp0_idu_icg_en;                         
input            cp0_idu_iq_bypass_disable;              
input            cp0_yy_clk_en;                          
input            cpurst_b;                               
input            ctrl_lsiq_create0_dp_en;                
input            ctrl_lsiq_create0_en;                   
input            ctrl_lsiq_create0_gateclk_en;           
input            ctrl_lsiq_create1_dp_en;                
input            ctrl_lsiq_create1_en;                   
input            ctrl_lsiq_create1_gateclk_en;           
input            ctrl_lsiq_ir_bar_inst_vld;              
input            ctrl_lsiq_is_bar_inst_vld;              
input   [23 :0]  ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld;     
input   [23 :0]  ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld;     
input            ctrl_lsiq_rf_pipe3_lch_fail_vld;        
input            ctrl_lsiq_rf_pipe4_lch_fail_vld;        
input            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [162:0]  dp_lsiq_bypass_data;                    
input            dp_lsiq_create0_bar;                    
input   [162:0]  dp_lsiq_create0_data;                   
input            dp_lsiq_create0_load;                   
input            dp_lsiq_create0_no_spec;                
input            dp_lsiq_create0_src0_rdy_for_bypass;    
input            dp_lsiq_create0_src1_rdy_for_bypass;    
input            dp_lsiq_create0_srcvm_rdy_for_bypass;   
input            dp_lsiq_create0_store;                  
input            dp_lsiq_create1_bar;                    
input   [162:0]  dp_lsiq_create1_data;                   
input            dp_lsiq_create1_load;                   
input            dp_lsiq_create1_no_spec;                
input            dp_lsiq_create1_store;                  
input   [11 :0]  dp_lsiq_rf_pipe3_lch_entry;             
input   [2  :0]  dp_lsiq_rf_pipe3_rdy_clr;               
input   [11 :0]  dp_lsiq_rf_pipe4_lch_entry;             
input   [2  :0]  dp_lsiq_rf_pipe4_rdy_clr;               
input   [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
input   [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
input            forever_cpuclk;                         
input            iu_idu_div_inst_vld;                    
input   [6  :0]  iu_idu_div_preg_dupx;                   
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
input            iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
input            iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
input   [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
input            iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
input            lsu_idu_ag_pipe3_load_inst_vld;         
input   [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
input            lsu_idu_ag_pipe3_vload_inst_vld;        
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;             
input   [11 :0]  lsu_idu_already_da;                     
input   [11 :0]  lsu_idu_bkpta_data;                     
input   [11 :0]  lsu_idu_bkptb_data;                     
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
input            lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
input            lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;             
input   [11 :0]  lsu_idu_lq_full;                        
input            lsu_idu_lq_full_gateclk_en;             
input            lsu_idu_lq_not_full;                    
input            lsu_idu_lsiq_pop0_vld;                  
input            lsu_idu_lsiq_pop1_vld;                  
input   [11 :0]  lsu_idu_lsiq_pop_entry;                 
input            lsu_idu_lsiq_pop_vld;                   
input            lsu_idu_no_fence;                       
input   [11 :0]  lsu_idu_rb_full;                        
input            lsu_idu_rb_full_gateclk_en;             
input            lsu_idu_rb_not_full;                    
input   [11 :0]  lsu_idu_secd;                           
input   [11 :0]  lsu_idu_spec_fail;                      
input   [11 :0]  lsu_idu_sq_full;                        
input            lsu_idu_sq_full_gateclk_en;             
input            lsu_idu_sq_not_full;                    
input   [11 :0]  lsu_idu_tlb_busy;                       
input            lsu_idu_tlb_busy_gateclk_en;            
input   [11 :0]  lsu_idu_tlb_wakeup;                     
input   [11 :0]  lsu_idu_unalign_gateclk_en;             
input   [11 :0]  lsu_idu_wait_fence;                     
input            lsu_idu_wait_fence_gateclk_en;          
input   [11 :0]  lsu_idu_wait_old;                       
input            lsu_idu_wait_old_gateclk_en;            
input   [11 :0]  lsu_idu_wakeup;                         
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
input            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
input            pad_yy_icg_scan_en;                     
input            rtu_idu_flush_fe;                       
input            rtu_idu_flush_is;                       
input            rtu_yy_xx_flush;                        
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
output  [11 :0]  lsiq_aiq_create0_entry;                 
output  [11 :0]  lsiq_aiq_create1_entry;                 
output           lsiq_ctrl_1_left_updt;                  
output           lsiq_ctrl_empty;                        
output           lsiq_ctrl_full;                         
output           lsiq_ctrl_full_updt;                    
output           lsiq_ctrl_full_updt_clk_en;             
output           lsiq_dp_create_bypass_oldest;           
output           lsiq_dp_no_spec_store_vld;              
output  [11 :0]  lsiq_dp_pipe3_issue_entry;              
output  [162:0]  lsiq_dp_pipe3_issue_read_data;          
output  [11 :0]  lsiq_dp_pipe4_issue_entry;              
output  [162:0]  lsiq_dp_pipe4_issue_read_data;          
output           lsiq_top_frz_entry_vld;                 
output  [3  :0]  lsiq_top_lsiq_entry_cnt;                
output           lsiq_xx_gateclk_issue_en;               
output           lsiq_xx_pipe3_issue_en;                 
output           lsiq_xx_pipe4_issue_en;                 

// &Regs; @29
reg              lsiq_bar_mode;                          
reg     [10 :0]  lsiq_entry0_create_agevec;              
reg     [10 :0]  lsiq_entry0_create_agevec_all;          
reg     [162:0]  lsiq_entry0_create_data;                
reg              lsiq_entry0_create_frz;                 
reg     [10 :0]  lsiq_entry10_create_agevec;             
reg     [10 :0]  lsiq_entry10_create_agevec_all;         
reg     [162:0]  lsiq_entry10_create_data;               
reg              lsiq_entry10_create_frz;                
reg     [10 :0]  lsiq_entry11_create_agevec;             
reg     [10 :0]  lsiq_entry11_create_agevec_all;         
reg     [162:0]  lsiq_entry11_create_data;               
reg              lsiq_entry11_create_frz;                
reg     [10 :0]  lsiq_entry1_create_agevec;              
reg     [10 :0]  lsiq_entry1_create_agevec_all;          
reg     [162:0]  lsiq_entry1_create_data;                
reg              lsiq_entry1_create_frz;                 
reg     [10 :0]  lsiq_entry2_create_agevec;              
reg     [10 :0]  lsiq_entry2_create_agevec_all;          
reg     [162:0]  lsiq_entry2_create_data;                
reg              lsiq_entry2_create_frz;                 
reg     [10 :0]  lsiq_entry3_create_agevec;              
reg     [10 :0]  lsiq_entry3_create_agevec_all;          
reg     [162:0]  lsiq_entry3_create_data;                
reg              lsiq_entry3_create_frz;                 
reg     [10 :0]  lsiq_entry4_create_agevec;              
reg     [10 :0]  lsiq_entry4_create_agevec_all;          
reg     [162:0]  lsiq_entry4_create_data;                
reg              lsiq_entry4_create_frz;                 
reg     [10 :0]  lsiq_entry5_create_agevec;              
reg     [10 :0]  lsiq_entry5_create_agevec_all;          
reg     [162:0]  lsiq_entry5_create_data;                
reg              lsiq_entry5_create_frz;                 
reg     [10 :0]  lsiq_entry6_create_agevec;              
reg     [10 :0]  lsiq_entry6_create_agevec_all;          
reg     [162:0]  lsiq_entry6_create_data;                
reg              lsiq_entry6_create_frz;                 
reg     [10 :0]  lsiq_entry7_create_agevec;              
reg     [10 :0]  lsiq_entry7_create_agevec_all;          
reg     [162:0]  lsiq_entry7_create_data;                
reg              lsiq_entry7_create_frz;                 
reg     [10 :0]  lsiq_entry8_create_agevec;              
reg     [10 :0]  lsiq_entry8_create_agevec_all;          
reg     [162:0]  lsiq_entry8_create_data;                
reg              lsiq_entry8_create_frz;                 
reg     [10 :0]  lsiq_entry9_create_agevec;              
reg     [10 :0]  lsiq_entry9_create_agevec_all;          
reg     [162:0]  lsiq_entry9_create_data;                
reg              lsiq_entry9_create_frz;                 
reg     [3  :0]  lsiq_entry_cnt;                         
reg     [11 :0]  lsiq_entry_create0_in;                  
reg     [11 :0]  lsiq_entry_create1_in;                  
reg     [162:0]  lsiq_pipe3_entry_read_data;             
reg     [162:0]  lsiq_pipe4_entry_read_data;             

// &Wires; @30
wire             bar_clk;                                
wire             bar_clk_en;                             
wire             cnt_clk;                                
wire             cnt_clk_en;                             
wire             cp0_idu_icg_en;                         
wire             cp0_idu_iq_bypass_disable;              
wire             cp0_yy_clk_en;                          
wire             cpurst_b;                               
wire             ctrl_lsiq_create0_dp_en;                
wire             ctrl_lsiq_create0_en;                   
wire             ctrl_lsiq_create0_gateclk_en;           
wire             ctrl_lsiq_create1_dp_en;                
wire             ctrl_lsiq_create1_en;                   
wire             ctrl_lsiq_create1_gateclk_en;           
wire             ctrl_lsiq_ir_bar_inst_vld;              
wire             ctrl_lsiq_is_bar_inst_vld;              
wire    [23 :0]  ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld;     
wire    [23 :0]  ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld;     
wire             ctrl_lsiq_rf_pipe3_lch_fail_vld;        
wire             ctrl_lsiq_rf_pipe4_lch_fail_vld;        
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [162:0]  dp_lsiq_bypass_data;                    
wire             dp_lsiq_create0_bar;                    
wire    [162:0]  dp_lsiq_create0_data;                   
wire             dp_lsiq_create0_load;                   
wire             dp_lsiq_create0_no_spec;                
wire             dp_lsiq_create0_src0_rdy_for_bypass;    
wire             dp_lsiq_create0_src1_rdy_for_bypass;    
wire             dp_lsiq_create0_srcvm_rdy_for_bypass;   
wire             dp_lsiq_create0_store;                  
wire             dp_lsiq_create1_bar;                    
wire    [162:0]  dp_lsiq_create1_data;                   
wire             dp_lsiq_create1_load;                   
wire             dp_lsiq_create1_no_spec;                
wire             dp_lsiq_create1_store;                  
wire    [11 :0]  dp_lsiq_rf_pipe3_lch_entry;             
wire    [2  :0]  dp_lsiq_rf_pipe3_rdy_clr;               
wire    [11 :0]  dp_lsiq_rf_pipe4_lch_entry;             
wire    [2  :0]  dp_lsiq_rf_pipe4_rdy_clr;               
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire             forever_cpuclk;                         
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dupx;                   
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dupx;          
wire             iu_idu_ex2_pipe0_wb_preg_vld_dupx;      
wire             iu_idu_ex2_pipe1_mult_inst_vld_dupx;    
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dupx;             
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dupx;          
wire             iu_idu_ex2_pipe1_wb_preg_vld_dupx;      
wire             lq_full_clk;                            
wire             lq_full_clk_en;                         
wire    [11 :0]  lsiq_aiq_create0_entry;                 
wire    [11 :0]  lsiq_aiq_create1_entry;                 
wire             lsiq_bypass_dp_en;                      
wire             lsiq_bypass_en;                         
wire             lsiq_bypass_gateclk_en;                 
wire             lsiq_create0_rdy_bypass;                
wire             lsiq_create0_rdy_bypass_dp;             
wire             lsiq_create0_rdy_bypass_gateclk;        
wire             lsiq_create_bypass_empty;               
wire             lsiq_ctrl_1_left_updt;                  
wire             lsiq_ctrl_empty;                        
wire             lsiq_ctrl_full;                         
wire             lsiq_ctrl_full_updt;                    
wire             lsiq_ctrl_full_updt_clk_en;             
wire             lsiq_dp_create_bypass_oldest;           
wire             lsiq_dp_no_spec_store_vld;              
wire    [11 :0]  lsiq_dp_pipe3_issue_entry;              
wire    [162:0]  lsiq_dp_pipe3_issue_read_data;          
wire    [11 :0]  lsiq_dp_pipe4_issue_entry;              
wire    [162:0]  lsiq_dp_pipe4_issue_read_data;          
wire             lsiq_entry0_already_da_set;             
wire    [1  :0]  lsiq_entry0_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry0_alu1_reg_fwd_vld;           
wire             lsiq_entry0_bar;                        
wire    [3  :0]  lsiq_entry0_bar_type;                   
wire             lsiq_entry0_bkpta_data_set;             
wire             lsiq_entry0_bkptb_data_set;             
wire             lsiq_entry0_create_dp_en;               
wire             lsiq_entry0_create_en;                  
wire             lsiq_entry0_create_gateclk_en;          
wire             lsiq_entry0_frz;                        
wire             lsiq_entry0_frz_clr;                    
wire             lsiq_entry0_frz_vld;                    
wire             lsiq_entry0_issue_en;                   
wire             lsiq_entry0_load;                       
wire             lsiq_entry0_lq_full;                    
wire             lsiq_entry0_lq_full_set;                
wire             lsiq_entry0_no_spec;                    
wire    [10 :0]  lsiq_entry0_other_aft_load;             
wire    [10 :0]  lsiq_entry0_other_aft_store;            
wire    [10 :0]  lsiq_entry0_other_bar;                  
wire    [10 :0]  lsiq_entry0_other_frz;                  
wire    [10 :0]  lsiq_entry0_other_load;                 
wire    [10 :0]  lsiq_entry0_other_no_spec;              
wire    [10 :0]  lsiq_entry0_other_raw_rdy;              
wire    [10 :0]  lsiq_entry0_other_store;                
wire             lsiq_entry0_pop_cur_entry;              
wire    [10 :0]  lsiq_entry0_pop_other_entry;            
wire             lsiq_entry0_raw_rdy;                    
wire             lsiq_entry0_rb_full;                    
wire             lsiq_entry0_rb_full_set;                
wire             lsiq_entry0_rdy;                        
wire    [2  :0]  lsiq_entry0_rdy_clr;                    
wire    [162:0]  lsiq_entry0_read_data;                  
wire             lsiq_entry0_spec_fail_set;              
wire             lsiq_entry0_sq_full;                    
wire             lsiq_entry0_sq_full_set;                
wire             lsiq_entry0_store;                      
wire             lsiq_entry0_tlb_busy;                   
wire             lsiq_entry0_tlb_busy_set;               
wire             lsiq_entry0_tlb_wakeup;                 
wire             lsiq_entry0_unalign_2nd_set;            
wire             lsiq_entry0_unalign_gateclk_en;         
wire             lsiq_entry0_vld;                        
wire             lsiq_entry0_vld_with_frz;               
wire             lsiq_entry0_wait_fence;                 
wire             lsiq_entry0_wait_fence_set;             
wire             lsiq_entry0_wait_old;                   
wire             lsiq_entry0_wait_old_set;               
wire             lsiq_entry10_already_da_set;            
wire    [1  :0]  lsiq_entry10_alu0_reg_fwd_vld;          
wire    [1  :0]  lsiq_entry10_alu1_reg_fwd_vld;          
wire             lsiq_entry10_bar;                       
wire    [3  :0]  lsiq_entry10_bar_type;                  
wire             lsiq_entry10_bkpta_data_set;            
wire             lsiq_entry10_bkptb_data_set;            
wire             lsiq_entry10_create_dp_en;              
wire             lsiq_entry10_create_en;                 
wire             lsiq_entry10_create_gateclk_en;         
wire             lsiq_entry10_frz;                       
wire             lsiq_entry10_frz_clr;                   
wire             lsiq_entry10_frz_vld;                   
wire             lsiq_entry10_issue_en;                  
wire             lsiq_entry10_load;                      
wire             lsiq_entry10_lq_full;                   
wire             lsiq_entry10_lq_full_set;               
wire             lsiq_entry10_no_spec;                   
wire    [10 :0]  lsiq_entry10_other_aft_load;            
wire    [10 :0]  lsiq_entry10_other_aft_store;           
wire    [10 :0]  lsiq_entry10_other_bar;                 
wire    [10 :0]  lsiq_entry10_other_frz;                 
wire    [10 :0]  lsiq_entry10_other_load;                
wire    [10 :0]  lsiq_entry10_other_no_spec;             
wire    [10 :0]  lsiq_entry10_other_raw_rdy;             
wire    [10 :0]  lsiq_entry10_other_store;               
wire             lsiq_entry10_pop_cur_entry;             
wire    [10 :0]  lsiq_entry10_pop_other_entry;           
wire             lsiq_entry10_raw_rdy;                   
wire             lsiq_entry10_rb_full;                   
wire             lsiq_entry10_rb_full_set;               
wire             lsiq_entry10_rdy;                       
wire    [2  :0]  lsiq_entry10_rdy_clr;                   
wire    [162:0]  lsiq_entry10_read_data;                 
wire             lsiq_entry10_spec_fail_set;             
wire             lsiq_entry10_sq_full;                   
wire             lsiq_entry10_sq_full_set;               
wire             lsiq_entry10_store;                     
wire             lsiq_entry10_tlb_busy;                  
wire             lsiq_entry10_tlb_busy_set;              
wire             lsiq_entry10_tlb_wakeup;                
wire             lsiq_entry10_unalign_2nd_set;           
wire             lsiq_entry10_unalign_gateclk_en;        
wire             lsiq_entry10_vld;                       
wire             lsiq_entry10_vld_with_frz;              
wire             lsiq_entry10_wait_fence;                
wire             lsiq_entry10_wait_fence_set;            
wire             lsiq_entry10_wait_old;                  
wire             lsiq_entry10_wait_old_set;              
wire             lsiq_entry11_already_da_set;            
wire    [1  :0]  lsiq_entry11_alu0_reg_fwd_vld;          
wire    [1  :0]  lsiq_entry11_alu1_reg_fwd_vld;          
wire             lsiq_entry11_bar;                       
wire    [3  :0]  lsiq_entry11_bar_type;                  
wire             lsiq_entry11_bkpta_data_set;            
wire             lsiq_entry11_bkptb_data_set;            
wire             lsiq_entry11_create_dp_en;              
wire             lsiq_entry11_create_en;                 
wire             lsiq_entry11_create_gateclk_en;         
wire             lsiq_entry11_frz;                       
wire             lsiq_entry11_frz_clr;                   
wire             lsiq_entry11_frz_vld;                   
wire             lsiq_entry11_issue_en;                  
wire             lsiq_entry11_load;                      
wire             lsiq_entry11_lq_full;                   
wire             lsiq_entry11_lq_full_set;               
wire             lsiq_entry11_no_spec;                   
wire    [10 :0]  lsiq_entry11_other_aft_load;            
wire    [10 :0]  lsiq_entry11_other_aft_store;           
wire    [10 :0]  lsiq_entry11_other_bar;                 
wire    [10 :0]  lsiq_entry11_other_frz;                 
wire    [10 :0]  lsiq_entry11_other_load;                
wire    [10 :0]  lsiq_entry11_other_no_spec;             
wire    [10 :0]  lsiq_entry11_other_raw_rdy;             
wire    [10 :0]  lsiq_entry11_other_store;               
wire             lsiq_entry11_pop_cur_entry;             
wire    [10 :0]  lsiq_entry11_pop_other_entry;           
wire             lsiq_entry11_raw_rdy;                   
wire             lsiq_entry11_rb_full;                   
wire             lsiq_entry11_rb_full_set;               
wire             lsiq_entry11_rdy;                       
wire    [2  :0]  lsiq_entry11_rdy_clr;                   
wire    [162:0]  lsiq_entry11_read_data;                 
wire             lsiq_entry11_spec_fail_set;             
wire             lsiq_entry11_sq_full;                   
wire             lsiq_entry11_sq_full_set;               
wire             lsiq_entry11_store;                     
wire             lsiq_entry11_tlb_busy;                  
wire             lsiq_entry11_tlb_busy_set;              
wire             lsiq_entry11_tlb_wakeup;                
wire             lsiq_entry11_unalign_2nd_set;           
wire             lsiq_entry11_unalign_gateclk_en;        
wire             lsiq_entry11_vld;                       
wire             lsiq_entry11_vld_with_frz;              
wire             lsiq_entry11_wait_fence;                
wire             lsiq_entry11_wait_fence_set;            
wire             lsiq_entry11_wait_old;                  
wire             lsiq_entry11_wait_old_set;              
wire             lsiq_entry1_already_da_set;             
wire    [1  :0]  lsiq_entry1_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry1_alu1_reg_fwd_vld;           
wire             lsiq_entry1_bar;                        
wire    [3  :0]  lsiq_entry1_bar_type;                   
wire             lsiq_entry1_bkpta_data_set;             
wire             lsiq_entry1_bkptb_data_set;             
wire             lsiq_entry1_create_dp_en;               
wire             lsiq_entry1_create_en;                  
wire             lsiq_entry1_create_gateclk_en;          
wire             lsiq_entry1_frz;                        
wire             lsiq_entry1_frz_clr;                    
wire             lsiq_entry1_frz_vld;                    
wire             lsiq_entry1_issue_en;                   
wire             lsiq_entry1_load;                       
wire             lsiq_entry1_lq_full;                    
wire             lsiq_entry1_lq_full_set;                
wire             lsiq_entry1_no_spec;                    
wire    [10 :0]  lsiq_entry1_other_aft_load;             
wire    [10 :0]  lsiq_entry1_other_aft_store;            
wire    [10 :0]  lsiq_entry1_other_bar;                  
wire    [10 :0]  lsiq_entry1_other_frz;                  
wire    [10 :0]  lsiq_entry1_other_load;                 
wire    [10 :0]  lsiq_entry1_other_no_spec;              
wire    [10 :0]  lsiq_entry1_other_raw_rdy;              
wire    [10 :0]  lsiq_entry1_other_store;                
wire             lsiq_entry1_pop_cur_entry;              
wire    [10 :0]  lsiq_entry1_pop_other_entry;            
wire             lsiq_entry1_raw_rdy;                    
wire             lsiq_entry1_rb_full;                    
wire             lsiq_entry1_rb_full_set;                
wire             lsiq_entry1_rdy;                        
wire    [2  :0]  lsiq_entry1_rdy_clr;                    
wire    [162:0]  lsiq_entry1_read_data;                  
wire             lsiq_entry1_spec_fail_set;              
wire             lsiq_entry1_sq_full;                    
wire             lsiq_entry1_sq_full_set;                
wire             lsiq_entry1_store;                      
wire             lsiq_entry1_tlb_busy;                   
wire             lsiq_entry1_tlb_busy_set;               
wire             lsiq_entry1_tlb_wakeup;                 
wire             lsiq_entry1_unalign_2nd_set;            
wire             lsiq_entry1_unalign_gateclk_en;         
wire             lsiq_entry1_vld;                        
wire             lsiq_entry1_vld_with_frz;               
wire             lsiq_entry1_wait_fence;                 
wire             lsiq_entry1_wait_fence_set;             
wire             lsiq_entry1_wait_old;                   
wire             lsiq_entry1_wait_old_set;               
wire             lsiq_entry2_already_da_set;             
wire    [1  :0]  lsiq_entry2_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry2_alu1_reg_fwd_vld;           
wire             lsiq_entry2_bar;                        
wire    [3  :0]  lsiq_entry2_bar_type;                   
wire             lsiq_entry2_bkpta_data_set;             
wire             lsiq_entry2_bkptb_data_set;             
wire             lsiq_entry2_create_dp_en;               
wire             lsiq_entry2_create_en;                  
wire             lsiq_entry2_create_gateclk_en;          
wire             lsiq_entry2_frz;                        
wire             lsiq_entry2_frz_clr;                    
wire             lsiq_entry2_frz_vld;                    
wire             lsiq_entry2_issue_en;                   
wire             lsiq_entry2_load;                       
wire             lsiq_entry2_lq_full;                    
wire             lsiq_entry2_lq_full_set;                
wire             lsiq_entry2_no_spec;                    
wire    [10 :0]  lsiq_entry2_other_aft_load;             
wire    [10 :0]  lsiq_entry2_other_aft_store;            
wire    [10 :0]  lsiq_entry2_other_bar;                  
wire    [10 :0]  lsiq_entry2_other_frz;                  
wire    [10 :0]  lsiq_entry2_other_load;                 
wire    [10 :0]  lsiq_entry2_other_no_spec;              
wire    [10 :0]  lsiq_entry2_other_raw_rdy;              
wire    [10 :0]  lsiq_entry2_other_store;                
wire             lsiq_entry2_pop_cur_entry;              
wire    [10 :0]  lsiq_entry2_pop_other_entry;            
wire             lsiq_entry2_raw_rdy;                    
wire             lsiq_entry2_rb_full;                    
wire             lsiq_entry2_rb_full_set;                
wire             lsiq_entry2_rdy;                        
wire    [2  :0]  lsiq_entry2_rdy_clr;                    
wire    [162:0]  lsiq_entry2_read_data;                  
wire             lsiq_entry2_spec_fail_set;              
wire             lsiq_entry2_sq_full;                    
wire             lsiq_entry2_sq_full_set;                
wire             lsiq_entry2_store;                      
wire             lsiq_entry2_tlb_busy;                   
wire             lsiq_entry2_tlb_busy_set;               
wire             lsiq_entry2_tlb_wakeup;                 
wire             lsiq_entry2_unalign_2nd_set;            
wire             lsiq_entry2_unalign_gateclk_en;         
wire             lsiq_entry2_vld;                        
wire             lsiq_entry2_vld_with_frz;               
wire             lsiq_entry2_wait_fence;                 
wire             lsiq_entry2_wait_fence_set;             
wire             lsiq_entry2_wait_old;                   
wire             lsiq_entry2_wait_old_set;               
wire             lsiq_entry3_already_da_set;             
wire    [1  :0]  lsiq_entry3_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry3_alu1_reg_fwd_vld;           
wire             lsiq_entry3_bar;                        
wire    [3  :0]  lsiq_entry3_bar_type;                   
wire             lsiq_entry3_bkpta_data_set;             
wire             lsiq_entry3_bkptb_data_set;             
wire             lsiq_entry3_create_dp_en;               
wire             lsiq_entry3_create_en;                  
wire             lsiq_entry3_create_gateclk_en;          
wire             lsiq_entry3_frz;                        
wire             lsiq_entry3_frz_clr;                    
wire             lsiq_entry3_frz_vld;                    
wire             lsiq_entry3_issue_en;                   
wire             lsiq_entry3_load;                       
wire             lsiq_entry3_lq_full;                    
wire             lsiq_entry3_lq_full_set;                
wire             lsiq_entry3_no_spec;                    
wire    [10 :0]  lsiq_entry3_other_aft_load;             
wire    [10 :0]  lsiq_entry3_other_aft_store;            
wire    [10 :0]  lsiq_entry3_other_bar;                  
wire    [10 :0]  lsiq_entry3_other_frz;                  
wire    [10 :0]  lsiq_entry3_other_load;                 
wire    [10 :0]  lsiq_entry3_other_no_spec;              
wire    [10 :0]  lsiq_entry3_other_raw_rdy;              
wire    [10 :0]  lsiq_entry3_other_store;                
wire             lsiq_entry3_pop_cur_entry;              
wire    [10 :0]  lsiq_entry3_pop_other_entry;            
wire             lsiq_entry3_raw_rdy;                    
wire             lsiq_entry3_rb_full;                    
wire             lsiq_entry3_rb_full_set;                
wire             lsiq_entry3_rdy;                        
wire    [2  :0]  lsiq_entry3_rdy_clr;                    
wire    [162:0]  lsiq_entry3_read_data;                  
wire             lsiq_entry3_spec_fail_set;              
wire             lsiq_entry3_sq_full;                    
wire             lsiq_entry3_sq_full_set;                
wire             lsiq_entry3_store;                      
wire             lsiq_entry3_tlb_busy;                   
wire             lsiq_entry3_tlb_busy_set;               
wire             lsiq_entry3_tlb_wakeup;                 
wire             lsiq_entry3_unalign_2nd_set;            
wire             lsiq_entry3_unalign_gateclk_en;         
wire             lsiq_entry3_vld;                        
wire             lsiq_entry3_vld_with_frz;               
wire             lsiq_entry3_wait_fence;                 
wire             lsiq_entry3_wait_fence_set;             
wire             lsiq_entry3_wait_old;                   
wire             lsiq_entry3_wait_old_set;               
wire             lsiq_entry4_already_da_set;             
wire    [1  :0]  lsiq_entry4_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry4_alu1_reg_fwd_vld;           
wire             lsiq_entry4_bar;                        
wire    [3  :0]  lsiq_entry4_bar_type;                   
wire             lsiq_entry4_bkpta_data_set;             
wire             lsiq_entry4_bkptb_data_set;             
wire             lsiq_entry4_create_dp_en;               
wire             lsiq_entry4_create_en;                  
wire             lsiq_entry4_create_gateclk_en;          
wire             lsiq_entry4_frz;                        
wire             lsiq_entry4_frz_clr;                    
wire             lsiq_entry4_frz_vld;                    
wire             lsiq_entry4_issue_en;                   
wire             lsiq_entry4_load;                       
wire             lsiq_entry4_lq_full;                    
wire             lsiq_entry4_lq_full_set;                
wire             lsiq_entry4_no_spec;                    
wire    [10 :0]  lsiq_entry4_other_aft_load;             
wire    [10 :0]  lsiq_entry4_other_aft_store;            
wire    [10 :0]  lsiq_entry4_other_bar;                  
wire    [10 :0]  lsiq_entry4_other_frz;                  
wire    [10 :0]  lsiq_entry4_other_load;                 
wire    [10 :0]  lsiq_entry4_other_no_spec;              
wire    [10 :0]  lsiq_entry4_other_raw_rdy;              
wire    [10 :0]  lsiq_entry4_other_store;                
wire             lsiq_entry4_pop_cur_entry;              
wire    [10 :0]  lsiq_entry4_pop_other_entry;            
wire             lsiq_entry4_raw_rdy;                    
wire             lsiq_entry4_rb_full;                    
wire             lsiq_entry4_rb_full_set;                
wire             lsiq_entry4_rdy;                        
wire    [2  :0]  lsiq_entry4_rdy_clr;                    
wire    [162:0]  lsiq_entry4_read_data;                  
wire             lsiq_entry4_spec_fail_set;              
wire             lsiq_entry4_sq_full;                    
wire             lsiq_entry4_sq_full_set;                
wire             lsiq_entry4_store;                      
wire             lsiq_entry4_tlb_busy;                   
wire             lsiq_entry4_tlb_busy_set;               
wire             lsiq_entry4_tlb_wakeup;                 
wire             lsiq_entry4_unalign_2nd_set;            
wire             lsiq_entry4_unalign_gateclk_en;         
wire             lsiq_entry4_vld;                        
wire             lsiq_entry4_vld_with_frz;               
wire             lsiq_entry4_wait_fence;                 
wire             lsiq_entry4_wait_fence_set;             
wire             lsiq_entry4_wait_old;                   
wire             lsiq_entry4_wait_old_set;               
wire             lsiq_entry5_already_da_set;             
wire    [1  :0]  lsiq_entry5_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry5_alu1_reg_fwd_vld;           
wire             lsiq_entry5_bar;                        
wire    [3  :0]  lsiq_entry5_bar_type;                   
wire             lsiq_entry5_bkpta_data_set;             
wire             lsiq_entry5_bkptb_data_set;             
wire             lsiq_entry5_create_dp_en;               
wire             lsiq_entry5_create_en;                  
wire             lsiq_entry5_create_gateclk_en;          
wire             lsiq_entry5_frz;                        
wire             lsiq_entry5_frz_clr;                    
wire             lsiq_entry5_frz_vld;                    
wire             lsiq_entry5_issue_en;                   
wire             lsiq_entry5_load;                       
wire             lsiq_entry5_lq_full;                    
wire             lsiq_entry5_lq_full_set;                
wire             lsiq_entry5_no_spec;                    
wire    [10 :0]  lsiq_entry5_other_aft_load;             
wire    [10 :0]  lsiq_entry5_other_aft_store;            
wire    [10 :0]  lsiq_entry5_other_bar;                  
wire    [10 :0]  lsiq_entry5_other_frz;                  
wire    [10 :0]  lsiq_entry5_other_load;                 
wire    [10 :0]  lsiq_entry5_other_no_spec;              
wire    [10 :0]  lsiq_entry5_other_raw_rdy;              
wire    [10 :0]  lsiq_entry5_other_store;                
wire             lsiq_entry5_pop_cur_entry;              
wire    [10 :0]  lsiq_entry5_pop_other_entry;            
wire             lsiq_entry5_raw_rdy;                    
wire             lsiq_entry5_rb_full;                    
wire             lsiq_entry5_rb_full_set;                
wire             lsiq_entry5_rdy;                        
wire    [2  :0]  lsiq_entry5_rdy_clr;                    
wire    [162:0]  lsiq_entry5_read_data;                  
wire             lsiq_entry5_spec_fail_set;              
wire             lsiq_entry5_sq_full;                    
wire             lsiq_entry5_sq_full_set;                
wire             lsiq_entry5_store;                      
wire             lsiq_entry5_tlb_busy;                   
wire             lsiq_entry5_tlb_busy_set;               
wire             lsiq_entry5_tlb_wakeup;                 
wire             lsiq_entry5_unalign_2nd_set;            
wire             lsiq_entry5_unalign_gateclk_en;         
wire             lsiq_entry5_vld;                        
wire             lsiq_entry5_vld_with_frz;               
wire             lsiq_entry5_wait_fence;                 
wire             lsiq_entry5_wait_fence_set;             
wire             lsiq_entry5_wait_old;                   
wire             lsiq_entry5_wait_old_set;               
wire             lsiq_entry6_already_da_set;             
wire    [1  :0]  lsiq_entry6_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry6_alu1_reg_fwd_vld;           
wire             lsiq_entry6_bar;                        
wire    [3  :0]  lsiq_entry6_bar_type;                   
wire             lsiq_entry6_bkpta_data_set;             
wire             lsiq_entry6_bkptb_data_set;             
wire             lsiq_entry6_create_dp_en;               
wire             lsiq_entry6_create_en;                  
wire             lsiq_entry6_create_gateclk_en;          
wire             lsiq_entry6_frz;                        
wire             lsiq_entry6_frz_clr;                    
wire             lsiq_entry6_frz_vld;                    
wire             lsiq_entry6_issue_en;                   
wire             lsiq_entry6_load;                       
wire             lsiq_entry6_lq_full;                    
wire             lsiq_entry6_lq_full_set;                
wire             lsiq_entry6_no_spec;                    
wire    [10 :0]  lsiq_entry6_other_aft_load;             
wire    [10 :0]  lsiq_entry6_other_aft_store;            
wire    [10 :0]  lsiq_entry6_other_bar;                  
wire    [10 :0]  lsiq_entry6_other_frz;                  
wire    [10 :0]  lsiq_entry6_other_load;                 
wire    [10 :0]  lsiq_entry6_other_no_spec;              
wire    [10 :0]  lsiq_entry6_other_raw_rdy;              
wire    [10 :0]  lsiq_entry6_other_store;                
wire             lsiq_entry6_pop_cur_entry;              
wire    [10 :0]  lsiq_entry6_pop_other_entry;            
wire             lsiq_entry6_raw_rdy;                    
wire             lsiq_entry6_rb_full;                    
wire             lsiq_entry6_rb_full_set;                
wire             lsiq_entry6_rdy;                        
wire    [2  :0]  lsiq_entry6_rdy_clr;                    
wire    [162:0]  lsiq_entry6_read_data;                  
wire             lsiq_entry6_spec_fail_set;              
wire             lsiq_entry6_sq_full;                    
wire             lsiq_entry6_sq_full_set;                
wire             lsiq_entry6_store;                      
wire             lsiq_entry6_tlb_busy;                   
wire             lsiq_entry6_tlb_busy_set;               
wire             lsiq_entry6_tlb_wakeup;                 
wire             lsiq_entry6_unalign_2nd_set;            
wire             lsiq_entry6_unalign_gateclk_en;         
wire             lsiq_entry6_vld;                        
wire             lsiq_entry6_vld_with_frz;               
wire             lsiq_entry6_wait_fence;                 
wire             lsiq_entry6_wait_fence_set;             
wire             lsiq_entry6_wait_old;                   
wire             lsiq_entry6_wait_old_set;               
wire             lsiq_entry7_already_da_set;             
wire    [1  :0]  lsiq_entry7_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry7_alu1_reg_fwd_vld;           
wire             lsiq_entry7_bar;                        
wire    [3  :0]  lsiq_entry7_bar_type;                   
wire             lsiq_entry7_bkpta_data_set;             
wire             lsiq_entry7_bkptb_data_set;             
wire             lsiq_entry7_create_dp_en;               
wire             lsiq_entry7_create_en;                  
wire             lsiq_entry7_create_gateclk_en;          
wire             lsiq_entry7_frz;                        
wire             lsiq_entry7_frz_clr;                    
wire             lsiq_entry7_frz_vld;                    
wire             lsiq_entry7_issue_en;                   
wire             lsiq_entry7_load;                       
wire             lsiq_entry7_lq_full;                    
wire             lsiq_entry7_lq_full_set;                
wire             lsiq_entry7_no_spec;                    
wire    [10 :0]  lsiq_entry7_other_aft_load;             
wire    [10 :0]  lsiq_entry7_other_aft_store;            
wire    [10 :0]  lsiq_entry7_other_bar;                  
wire    [10 :0]  lsiq_entry7_other_frz;                  
wire    [10 :0]  lsiq_entry7_other_load;                 
wire    [10 :0]  lsiq_entry7_other_no_spec;              
wire    [10 :0]  lsiq_entry7_other_raw_rdy;              
wire    [10 :0]  lsiq_entry7_other_store;                
wire             lsiq_entry7_pop_cur_entry;              
wire    [10 :0]  lsiq_entry7_pop_other_entry;            
wire             lsiq_entry7_raw_rdy;                    
wire             lsiq_entry7_rb_full;                    
wire             lsiq_entry7_rb_full_set;                
wire             lsiq_entry7_rdy;                        
wire    [2  :0]  lsiq_entry7_rdy_clr;                    
wire    [162:0]  lsiq_entry7_read_data;                  
wire             lsiq_entry7_spec_fail_set;              
wire             lsiq_entry7_sq_full;                    
wire             lsiq_entry7_sq_full_set;                
wire             lsiq_entry7_store;                      
wire             lsiq_entry7_tlb_busy;                   
wire             lsiq_entry7_tlb_busy_set;               
wire             lsiq_entry7_tlb_wakeup;                 
wire             lsiq_entry7_unalign_2nd_set;            
wire             lsiq_entry7_unalign_gateclk_en;         
wire             lsiq_entry7_vld;                        
wire             lsiq_entry7_vld_with_frz;               
wire             lsiq_entry7_wait_fence;                 
wire             lsiq_entry7_wait_fence_set;             
wire             lsiq_entry7_wait_old;                   
wire             lsiq_entry7_wait_old_set;               
wire             lsiq_entry8_already_da_set;             
wire    [1  :0]  lsiq_entry8_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry8_alu1_reg_fwd_vld;           
wire             lsiq_entry8_bar;                        
wire    [3  :0]  lsiq_entry8_bar_type;                   
wire             lsiq_entry8_bkpta_data_set;             
wire             lsiq_entry8_bkptb_data_set;             
wire             lsiq_entry8_create_dp_en;               
wire             lsiq_entry8_create_en;                  
wire             lsiq_entry8_create_gateclk_en;          
wire             lsiq_entry8_frz;                        
wire             lsiq_entry8_frz_clr;                    
wire             lsiq_entry8_frz_vld;                    
wire             lsiq_entry8_issue_en;                   
wire             lsiq_entry8_load;                       
wire             lsiq_entry8_lq_full;                    
wire             lsiq_entry8_lq_full_set;                
wire             lsiq_entry8_no_spec;                    
wire    [10 :0]  lsiq_entry8_other_aft_load;             
wire    [10 :0]  lsiq_entry8_other_aft_store;            
wire    [10 :0]  lsiq_entry8_other_bar;                  
wire    [10 :0]  lsiq_entry8_other_frz;                  
wire    [10 :0]  lsiq_entry8_other_load;                 
wire    [10 :0]  lsiq_entry8_other_no_spec;              
wire    [10 :0]  lsiq_entry8_other_raw_rdy;              
wire    [10 :0]  lsiq_entry8_other_store;                
wire             lsiq_entry8_pop_cur_entry;              
wire    [10 :0]  lsiq_entry8_pop_other_entry;            
wire             lsiq_entry8_raw_rdy;                    
wire             lsiq_entry8_rb_full;                    
wire             lsiq_entry8_rb_full_set;                
wire             lsiq_entry8_rdy;                        
wire    [2  :0]  lsiq_entry8_rdy_clr;                    
wire    [162:0]  lsiq_entry8_read_data;                  
wire             lsiq_entry8_spec_fail_set;              
wire             lsiq_entry8_sq_full;                    
wire             lsiq_entry8_sq_full_set;                
wire             lsiq_entry8_store;                      
wire             lsiq_entry8_tlb_busy;                   
wire             lsiq_entry8_tlb_busy_set;               
wire             lsiq_entry8_tlb_wakeup;                 
wire             lsiq_entry8_unalign_2nd_set;            
wire             lsiq_entry8_unalign_gateclk_en;         
wire             lsiq_entry8_vld;                        
wire             lsiq_entry8_vld_with_frz;               
wire             lsiq_entry8_wait_fence;                 
wire             lsiq_entry8_wait_fence_set;             
wire             lsiq_entry8_wait_old;                   
wire             lsiq_entry8_wait_old_set;               
wire             lsiq_entry9_already_da_set;             
wire    [1  :0]  lsiq_entry9_alu0_reg_fwd_vld;           
wire    [1  :0]  lsiq_entry9_alu1_reg_fwd_vld;           
wire             lsiq_entry9_bar;                        
wire    [3  :0]  lsiq_entry9_bar_type;                   
wire             lsiq_entry9_bkpta_data_set;             
wire             lsiq_entry9_bkptb_data_set;             
wire             lsiq_entry9_create_dp_en;               
wire             lsiq_entry9_create_en;                  
wire             lsiq_entry9_create_gateclk_en;          
wire             lsiq_entry9_frz;                        
wire             lsiq_entry9_frz_clr;                    
wire             lsiq_entry9_frz_vld;                    
wire             lsiq_entry9_issue_en;                   
wire             lsiq_entry9_load;                       
wire             lsiq_entry9_lq_full;                    
wire             lsiq_entry9_lq_full_set;                
wire             lsiq_entry9_no_spec;                    
wire    [10 :0]  lsiq_entry9_other_aft_load;             
wire    [10 :0]  lsiq_entry9_other_aft_store;            
wire    [10 :0]  lsiq_entry9_other_bar;                  
wire    [10 :0]  lsiq_entry9_other_frz;                  
wire    [10 :0]  lsiq_entry9_other_load;                 
wire    [10 :0]  lsiq_entry9_other_no_spec;              
wire    [10 :0]  lsiq_entry9_other_raw_rdy;              
wire    [10 :0]  lsiq_entry9_other_store;                
wire             lsiq_entry9_pop_cur_entry;              
wire    [10 :0]  lsiq_entry9_pop_other_entry;            
wire             lsiq_entry9_raw_rdy;                    
wire             lsiq_entry9_rb_full;                    
wire             lsiq_entry9_rb_full_set;                
wire             lsiq_entry9_rdy;                        
wire    [2  :0]  lsiq_entry9_rdy_clr;                    
wire    [162:0]  lsiq_entry9_read_data;                  
wire             lsiq_entry9_spec_fail_set;              
wire             lsiq_entry9_sq_full;                    
wire             lsiq_entry9_sq_full_set;                
wire             lsiq_entry9_store;                      
wire             lsiq_entry9_tlb_busy;                   
wire             lsiq_entry9_tlb_busy_set;               
wire             lsiq_entry9_tlb_wakeup;                 
wire             lsiq_entry9_unalign_2nd_set;            
wire             lsiq_entry9_unalign_gateclk_en;         
wire             lsiq_entry9_vld;                        
wire             lsiq_entry9_vld_with_frz;               
wire             lsiq_entry9_wait_fence;                 
wire             lsiq_entry9_wait_fence_set;             
wire             lsiq_entry9_wait_old;                   
wire             lsiq_entry9_wait_old_set;               
wire    [11 :0]  lsiq_entry_aft_load;                    
wire    [11 :0]  lsiq_entry_aft_store;                   
wire    [11 :0]  lsiq_entry_bar;                         
wire    [11 :0]  lsiq_entry_bef_load;                    
wire    [11 :0]  lsiq_entry_bef_store;                   
wire    [3  :0]  lsiq_entry_cnt_create;                  
wire             lsiq_entry_cnt_create_0;                
wire             lsiq_entry_cnt_create_1;                
wire             lsiq_entry_cnt_create_2;                
wire    [3  :0]  lsiq_entry_cnt_pop;                     
wire             lsiq_entry_cnt_pop_0;                   
wire             lsiq_entry_cnt_pop_1;                   
wire    [3  :0]  lsiq_entry_cnt_updt_val;                
wire             lsiq_entry_cnt_updt_vld;                
wire    [11 :0]  lsiq_entry_create0_agevec;              
wire    [11 :0]  lsiq_entry_create0_agevec_all;          
wire             lsiq_entry_create0_frz;                 
wire    [11 :0]  lsiq_entry_create1_agevec;              
wire    [11 :0]  lsiq_entry_create1_agevec_all;          
wire             lsiq_entry_create1_frz;                 
wire    [11 :0]  lsiq_entry_create_dp_en;                
wire    [11 :0]  lsiq_entry_create_en;                   
wire    [11 :0]  lsiq_entry_create_gateclk_en;           
wire    [11 :0]  lsiq_entry_create_sel;                  
wire    [11 :0]  lsiq_entry_frz;                         
wire    [11 :0]  lsiq_entry_frz_clr;                     
wire    [11 :0]  lsiq_entry_issue_en;                    
wire    [11 :0]  lsiq_entry_load;                        
wire    [11 :0]  lsiq_entry_no_spec;                     
wire    [11 :0]  lsiq_entry_pipe3_frz_clr;               
wire    [11 :0]  lsiq_entry_pipe4_frz_clr;               
wire    [11 :0]  lsiq_entry_raw_rdy;                     
wire    [11 :0]  lsiq_entry_ready;                       
wire    [11 :0]  lsiq_entry_store;                       
wire    [11 :0]  lsiq_entry_vld;                         
wire             lsiq_no_bar_inst;                       
wire             lsiq_pipe3_bypass_en;                   
wire    [11 :0]  lsiq_pipe3_entry_issue_en;              
wire    [11 :0]  lsiq_pipe3_entry_ready;                 
wire             lsiq_pipe4_bypass_en;                   
wire    [11 :0]  lsiq_pipe4_entry_issue_en;              
wire    [11 :0]  lsiq_pipe4_entry_ready;                 
wire             lsiq_top_frz_entry_vld;                 
wire    [3  :0]  lsiq_top_lsiq_entry_cnt;                
wire             lsiq_xx_gateclk_issue_en;               
wire             lsiq_xx_pipe3_issue_en;                 
wire             lsiq_xx_pipe4_issue_en;                 
wire             lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dupx;             
wire             lsu_idu_ag_pipe3_vload_inst_vld;        
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;             
wire    [11 :0]  lsu_idu_already_da;                     
wire    [11 :0]  lsu_idu_bkpta_data;                     
wire    [11 :0]  lsu_idu_bkptb_data;                     
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire             lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire             lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
wire             lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;             
wire    [11 :0]  lsu_idu_lq_full;                        
wire             lsu_idu_lq_full_gateclk_en;             
wire             lsu_idu_lq_not_full;                    
wire             lsu_idu_lsiq_pop0_vld;                  
wire             lsu_idu_lsiq_pop1_vld;                  
wire    [11 :0]  lsu_idu_lsiq_pop_entry;                 
wire             lsu_idu_lsiq_pop_vld;                   
wire             lsu_idu_no_fence;                       
wire    [11 :0]  lsu_idu_rb_full;                        
wire             lsu_idu_rb_full_gateclk_en;             
wire             lsu_idu_rb_not_full;                    
wire    [11 :0]  lsu_idu_secd;                           
wire    [11 :0]  lsu_idu_spec_fail;                      
wire    [11 :0]  lsu_idu_sq_full;                        
wire             lsu_idu_sq_full_gateclk_en;             
wire             lsu_idu_sq_not_full;                    
wire    [11 :0]  lsu_idu_tlb_busy;                       
wire             lsu_idu_tlb_busy_gateclk_en;            
wire    [11 :0]  lsu_idu_tlb_wakeup;                     
wire    [11 :0]  lsu_idu_unalign_gateclk_en;             
wire    [11 :0]  lsu_idu_wait_fence;                     
wire             lsu_idu_wait_fence_gateclk_en;          
wire    [11 :0]  lsu_idu_wait_old;                       
wire             lsu_idu_wait_old_gateclk_en;            
wire    [11 :0]  lsu_idu_wakeup;                         
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire             lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
wire             pad_yy_icg_scan_en;                     
wire             rb_full_clk;                            
wire             rb_full_clk_en;                         
wire             rtu_idu_flush_fe;                       
wire             rtu_idu_flush_is;                       
wire             rtu_yy_xx_flush;                        
wire             sq_full_clk;                            
wire             sq_full_clk_en;                         
wire             tlb_busy_clk;                           
wire             tlb_busy_clk_en;                        
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
wire             wait_fence_clk;                         
wire             wait_fence_clk_en;                      
wire             wait_old_clk;                           
wire             wait_old_clk_en;                        



parameter LSIQ_WIDTH             = 163;

//==========================================================
//                LSU Restart gateclk
//==========================================================
assign lq_full_clk_en = lsu_idu_lq_full_gateclk_en
                        ||  lsiq_entry0_lq_full
                        ||  lsiq_entry1_lq_full
                        ||  lsiq_entry2_lq_full
                        ||  lsiq_entry3_lq_full
                        ||  lsiq_entry4_lq_full
                        ||  lsiq_entry5_lq_full
                        ||  lsiq_entry6_lq_full
                        ||  lsiq_entry7_lq_full
                        ||  lsiq_entry8_lq_full
                        ||  lsiq_entry9_lq_full
                        ||  lsiq_entry10_lq_full
                        ||  lsiq_entry11_lq_full;
// &Instance("gated_clk_cell", "x_lq_full_gated_clk"); @51
gated_clk_cell  x_lq_full_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lq_full_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lq_full_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @52
//          .external_en   (1'b0               ), @53
//          .global_en     (1'b1               ), @54
//          .module_en   (cp0_idu_icg_en               ), @55
//          .local_en      (lq_full_clk_en     ), @56
//          .clk_out       (lq_full_clk        )); @57

assign sq_full_clk_en = lsu_idu_sq_full_gateclk_en
                        ||  lsiq_entry0_sq_full
                        ||  lsiq_entry1_sq_full
                        ||  lsiq_entry2_sq_full
                        ||  lsiq_entry3_sq_full
                        ||  lsiq_entry4_sq_full
                        ||  lsiq_entry5_sq_full
                        ||  lsiq_entry6_sq_full
                        ||  lsiq_entry7_sq_full
                        ||  lsiq_entry8_sq_full
                        ||  lsiq_entry9_sq_full
                        ||  lsiq_entry10_sq_full
                        ||  lsiq_entry11_sq_full;
// &Instance("gated_clk_cell", "x_sq_full_gated_clk"); @72
gated_clk_cell  x_sq_full_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sq_full_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (sq_full_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @73
//          .external_en   (1'b0               ), @74
//          .global_en     (1'b1               ), @75
//          .module_en   (cp0_idu_icg_en               ), @76
//          .local_en      (sq_full_clk_en     ), @77
//          .clk_out       (sq_full_clk        )); @78

assign rb_full_clk_en = lsu_idu_rb_full_gateclk_en
                        ||  lsiq_entry0_rb_full
                        ||  lsiq_entry1_rb_full
                        ||  lsiq_entry2_rb_full
                        ||  lsiq_entry3_rb_full
                        ||  lsiq_entry4_rb_full
                        ||  lsiq_entry5_rb_full
                        ||  lsiq_entry6_rb_full
                        ||  lsiq_entry7_rb_full
                        ||  lsiq_entry8_rb_full
                        ||  lsiq_entry9_rb_full
                        ||  lsiq_entry10_rb_full
                        ||  lsiq_entry11_rb_full;
// &Instance("gated_clk_cell", "x_rb_full_gated_clk"); @93
gated_clk_cell  x_rb_full_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rb_full_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (rb_full_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @94
//          .external_en   (1'b0               ), @95
//          .global_en     (1'b1               ), @96
//          .module_en   (cp0_idu_icg_en               ), @97
//          .local_en      (rb_full_clk_en     ), @98
//          .clk_out       (rb_full_clk        )); @99

assign tlb_busy_clk_en = lsu_idu_tlb_busy_gateclk_en
                        ||  lsiq_entry0_tlb_busy
                        ||  lsiq_entry1_tlb_busy
                        ||  lsiq_entry2_tlb_busy
                        ||  lsiq_entry3_tlb_busy
                        ||  lsiq_entry4_tlb_busy
                        ||  lsiq_entry5_tlb_busy
                        ||  lsiq_entry6_tlb_busy
                        ||  lsiq_entry7_tlb_busy
                        ||  lsiq_entry8_tlb_busy
                        ||  lsiq_entry9_tlb_busy
                        ||  lsiq_entry10_tlb_busy
                        ||  lsiq_entry11_tlb_busy;
// &Instance("gated_clk_cell", "x_tlb_busy_gated_clk"); @114
gated_clk_cell  x_tlb_busy_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tlb_busy_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tlb_busy_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @115
//          .external_en   (1'b0               ), @116
//          .global_en     (1'b1               ), @117
//          .module_en   (cp0_idu_icg_en               ), @118
//          .local_en      (tlb_busy_clk_en     ), @119
//          .clk_out       (tlb_busy_clk        )); @120

assign wait_old_clk_en = lsu_idu_wait_old_gateclk_en
                        ||  lsiq_entry0_wait_old
                        ||  lsiq_entry1_wait_old
                        ||  lsiq_entry2_wait_old
                        ||  lsiq_entry3_wait_old
                        ||  lsiq_entry4_wait_old
                        ||  lsiq_entry5_wait_old
                        ||  lsiq_entry6_wait_old
                        ||  lsiq_entry7_wait_old
                        ||  lsiq_entry8_wait_old
                        ||  lsiq_entry9_wait_old
                        ||  lsiq_entry10_wait_old
                        ||  lsiq_entry11_wait_old;
// &Instance("gated_clk_cell", "x_wait_old_gated_clk"); @135
gated_clk_cell  x_wait_old_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wait_old_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wait_old_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @136
//          .external_en   (1'b0               ), @137
//          .global_en     (1'b1               ), @138
//          .module_en   (cp0_idu_icg_en               ), @139
//          .local_en      (wait_old_clk_en     ), @140
//          .clk_out       (wait_old_clk        )); @141

assign wait_fence_clk_en = lsu_idu_wait_fence_gateclk_en
                        ||  lsiq_entry0_wait_fence
                        ||  lsiq_entry1_wait_fence
                        ||  lsiq_entry2_wait_fence
                        ||  lsiq_entry3_wait_fence
                        ||  lsiq_entry4_wait_fence
                        ||  lsiq_entry5_wait_fence
                        ||  lsiq_entry6_wait_fence
                        ||  lsiq_entry7_wait_fence
                        ||  lsiq_entry8_wait_fence
                        ||  lsiq_entry9_wait_fence
                        ||  lsiq_entry10_wait_fence
                        ||  lsiq_entry11_wait_fence;
// &Instance("gated_clk_cell", "x_wait_fence_gated_clk"); @156
gated_clk_cell  x_wait_fence_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wait_fence_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wait_fence_clk_en ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @157
//          .external_en   (1'b0               ), @158
//          .global_en     (1'b1               ), @159
//          .module_en   (cp0_idu_icg_en               ), @160
//          .local_en      (wait_fence_clk_en     ), @161
//          .clk_out       (wait_fence_clk        )); @162

//==========================================================
//            LSU Issue Queue Barrier Mode
//==========================================================
assign bar_clk_en = lsiq_bar_mode
                    || ctrl_lsiq_ir_bar_inst_vld
                    || ctrl_lsiq_is_bar_inst_vld;
// &Instance("gated_clk_cell", "x_bar_gated_clk"); @170
gated_clk_cell  x_bar_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bar_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bar_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @171
//          .external_en (1'b0), @172
//          .global_en   (cp0_yy_clk_en), @173
//          .module_en   (cp0_idu_icg_en), @174
//          .local_en    (bar_clk_en), @175
//          .clk_out     (bar_clk)); @176

//when ir or is has bar inst, enable barrier mode
//when lsiq has no bar inst, disable barrier mode
assign lsiq_no_bar_inst = !(|(lsiq_entry_vld[11:0] & lsiq_entry_bar[11:0]));
//in barrier mode:
//1.disable lsiq bypass
//2.all lsiq inst create into lsiq with frz set
//3.check older inst barrier state, if it is not barriered by
//  older inst, clear frz
always @(posedge bar_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lsiq_bar_mode <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    lsiq_bar_mode <= 1'b0;
  else if(ctrl_lsiq_ir_bar_inst_vld || ctrl_lsiq_is_bar_inst_vld)
    lsiq_bar_mode <= 1'b1;
  else if(lsiq_no_bar_inst)
    lsiq_bar_mode <= 1'b0;
  else
    lsiq_bar_mode <= lsiq_bar_mode;
end

//==========================================================
//            LSU Issue Queue Create Control
//==========================================================
//-------------------gated cell instance--------------------
assign cnt_clk_en = (lsiq_entry_cnt[3:0] != 4'b0)
                    || ctrl_lsiq_create0_gateclk_en
                    || ctrl_lsiq_create1_gateclk_en;
// &Instance("gated_clk_cell", "x_cnt_gated_clk"); @207
gated_clk_cell  x_cnt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cnt_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (cnt_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @208
//          .external_en (1'b0), @209
//          .global_en   (cp0_yy_clk_en), @210
//          .module_en   (cp0_idu_icg_en), @211
//          .local_en    (cnt_clk_en), @212
//          .clk_out     (cnt_clk)); @213

assign lsiq_ctrl_full_updt_clk_en = cnt_clk_en;

//--------------------lsiq entry counter--------------------
//if create, add entry counter
assign lsiq_entry_cnt_create[3:0]   = {3'b0,ctrl_lsiq_create0_en}
                                      + {3'b0,ctrl_lsiq_create1_en};
//if pop, sub entry counter
assign lsiq_entry_cnt_pop[3:0]      =
         {2'b0, lsu_idu_lsiq_pop0_vld &  lsu_idu_lsiq_pop1_vld,
                lsu_idu_lsiq_pop0_vld ^  lsu_idu_lsiq_pop1_vld};
                                      
//update valid and value
assign lsiq_entry_cnt_updt_vld      = ctrl_lsiq_create0_en
                                      || lsu_idu_lsiq_pop_vld;
assign lsiq_entry_cnt_updt_val[3:0] = lsiq_entry_cnt[3:0]
                                      + lsiq_entry_cnt_create[3:0]
                                      - lsiq_entry_cnt_pop[3:0];
//implement entry counter
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lsiq_entry_cnt[3:0] <= 4'b0;
  //after flush fe/is, the lsu may wrongly pop before rtu_yy_xx_flush
  //need flush also when rtu_yy_xx_flush
  else if(rtu_idu_flush_fe || rtu_idu_flush_is || rtu_yy_xx_flush)
    lsiq_entry_cnt[3:0] <= 4'b0;
  else if(lsiq_entry_cnt_updt_vld)
    lsiq_entry_cnt[3:0] <= lsiq_entry_cnt_updt_val[3:0];
  else
    lsiq_entry_cnt[3:0] <= lsiq_entry_cnt[3:0];
end

assign lsiq_ctrl_full                    = (lsiq_entry_cnt[3:0] == 4'd12);

assign lsiq_top_lsiq_entry_cnt[3:0]      = lsiq_entry_cnt[3:0];

//--------------------lsiq entry full-----------------------
//assign lsiq_full_entry_cnt_updt_val[3:0] = (lsiq_entry_cnt_updt_vld)
//                                           ? lsiq_entry_cnt_updt_val[3:0]
//                                           : lsiq_entry_cnt[3:0];
//
//assign lsiq_ctrl_full_updt   = (lsiq_full_entry_cnt_updt_val[3:0] == 4'd12);
//assign lsiq_ctrl_1_left_updt = (lsiq_full_entry_cnt_updt_val[3:0] == 4'd11);

assign lsiq_entry_cnt_create_2 =  ctrl_lsiq_create1_en;
assign lsiq_entry_cnt_create_1 =  ctrl_lsiq_create0_en && !ctrl_lsiq_create1_en;
assign lsiq_entry_cnt_create_0 = !ctrl_lsiq_create0_en;

assign lsiq_entry_cnt_pop_1    =  lsu_idu_lsiq_pop0_vld && !lsu_idu_lsiq_pop1_vld
                              || !lsu_idu_lsiq_pop0_vld &&  lsu_idu_lsiq_pop1_vld;
assign lsiq_entry_cnt_pop_0    = !lsu_idu_lsiq_pop0_vld && !lsu_idu_lsiq_pop1_vld;

assign lsiq_ctrl_full_updt     = (lsiq_entry_cnt[3:0] == 4'd10)
                                 && lsiq_entry_cnt_create_2
                                 && lsiq_entry_cnt_pop_0
                              || (lsiq_entry_cnt[3:0] == 4'd11)
                                 && lsiq_entry_cnt_create_1 
                                 && lsiq_entry_cnt_pop_0
                              || (lsiq_entry_cnt[3:0] == 4'd12)
                                 && lsiq_entry_cnt_create_0 
                                 && lsiq_entry_cnt_pop_0;

assign lsiq_ctrl_1_left_updt   = (lsiq_entry_cnt[3:0] == 4'd9)
                                 && lsiq_entry_cnt_create_2
                                 && lsiq_entry_cnt_pop_0
                              || (lsiq_entry_cnt[3:0] == 4'd10)
                                 && lsiq_entry_cnt_create_1
                                 && lsiq_entry_cnt_pop_0
                              || (lsiq_entry_cnt[3:0] == 4'd10)
                                 && lsiq_entry_cnt_create_2
                                 && lsiq_entry_cnt_pop_1
                              || (lsiq_entry_cnt[3:0] == 4'd11)
                                 && lsiq_entry_cnt_create_0
                                 && lsiq_entry_cnt_pop_0
                              || (lsiq_entry_cnt[3:0] == 4'd11)
                                 && lsiq_entry_cnt_create_1
                                 && lsiq_entry_cnt_pop_1
                              || (lsiq_entry_cnt[3:0] == 4'd12)
                                 && lsiq_entry_cnt_create_0
                                 && lsiq_entry_cnt_pop_1;

//---------------------create bypass------------------------
//if create instruction is ready, it may bypass from issue queue
//only create 0 can bypass
assign lsiq_create0_rdy_bypass    = ctrl_lsiq_create0_en
                                    && !cp0_idu_iq_bypass_disable
                                    && !dp_lsiq_create0_bar
                                    && !(dp_lsiq_create0_no_spec
                                         && dp_lsiq_create0_load)
                                    && dp_lsiq_create0_src0_rdy_for_bypass
                                    && dp_lsiq_create0_src1_rdy_for_bypass
                                    && dp_lsiq_create0_srcvm_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign lsiq_create0_rdy_bypass_dp = ctrl_lsiq_create0_dp_en
                                    && !cp0_idu_iq_bypass_disable
                                    && !dp_lsiq_create0_bar
                                    && !(dp_lsiq_create0_no_spec
                                         && dp_lsiq_create0_load)
                                    && dp_lsiq_create0_src0_rdy_for_bypass
                                    && dp_lsiq_create0_src1_rdy_for_bypass
                                    && dp_lsiq_create0_srcvm_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign lsiq_create0_rdy_bypass_gateclk = ctrl_lsiq_create0_gateclk_en
                                         && dp_lsiq_create0_src0_rdy_for_bypass
                                         && dp_lsiq_create0_src1_rdy_for_bypass
                                         && dp_lsiq_create0_srcvm_rdy_for_bypass;

assign lsiq_entry_vld[11:0] = 
         {lsiq_entry11_vld, lsiq_entry10_vld, lsiq_entry9_vld, lsiq_entry8_vld,
          lsiq_entry7_vld,  lsiq_entry6_vld,  lsiq_entry5_vld, lsiq_entry4_vld,
          lsiq_entry3_vld,  lsiq_entry2_vld,  lsiq_entry1_vld, lsiq_entry0_vld};

//inst cannot bypass freeze bar
assign lsiq_create_bypass_empty =
        !(lsiq_entry0_vld_with_frz  || lsiq_entry1_vld_with_frz
       || lsiq_entry2_vld_with_frz  || lsiq_entry3_vld_with_frz
       || lsiq_entry4_vld_with_frz  || lsiq_entry5_vld_with_frz
       || lsiq_entry6_vld_with_frz  || lsiq_entry7_vld_with_frz
       || lsiq_entry8_vld_with_frz  || lsiq_entry9_vld_with_frz
       || lsiq_entry10_vld_with_frz || lsiq_entry11_vld_with_frz);

assign lsiq_top_frz_entry_vld =
        !(lsiq_entry0_frz_vld  || lsiq_entry1_frz_vld
       || lsiq_entry2_frz_vld  || lsiq_entry3_frz_vld
       || lsiq_entry4_frz_vld  || lsiq_entry5_frz_vld
       || lsiq_entry6_frz_vld  || lsiq_entry7_frz_vld
       || lsiq_entry8_frz_vld  || lsiq_entry9_frz_vld
       || lsiq_entry10_frz_vld || lsiq_entry11_frz_vld);

assign lsiq_ctrl_empty            = !(|lsiq_entry_vld[11:0]);

//create0 priority is from entry 0 to 11
// &CombBeg; @347
always @( lsiq_entry1_vld
       or lsiq_entry11_vld
       or lsiq_entry8_vld
       or lsiq_entry5_vld
       or lsiq_entry0_vld
       or lsiq_entry9_vld
       or lsiq_entry4_vld
       or lsiq_entry3_vld
       or lsiq_entry7_vld
       or lsiq_entry10_vld
       or lsiq_entry6_vld
       or lsiq_entry2_vld)
begin
  if(!lsiq_entry0_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_0000_0001;
  else if(!lsiq_entry1_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_0000_0010;
  else if(!lsiq_entry2_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_0000_0100;
  else if(!lsiq_entry3_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_0000_1000;
  else if(!lsiq_entry4_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_0001_0000;
  else if(!lsiq_entry5_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_0010_0000;
  else if(!lsiq_entry6_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_0100_0000;
  else if(!lsiq_entry7_vld)
    lsiq_entry_create0_in[11:0] = 12'b0000_1000_0000;
  else if(!lsiq_entry8_vld)
    lsiq_entry_create0_in[11:0] = 12'b0001_0000_0000;
  else if(!lsiq_entry9_vld)
    lsiq_entry_create0_in[11:0] = 12'b0010_0000_0000;
  else if(!lsiq_entry10_vld)
    lsiq_entry_create0_in[11:0] = 12'b0100_0000_0000;
  else if(!lsiq_entry11_vld)
    lsiq_entry_create0_in[11:0] = 12'b1000_0000_0000;
  else
    lsiq_entry_create0_in[11:0] = 12'b0000_0000_0000;
// &CombEnd; @374
end
//create1 priority is from entry 11 to 0
// &CombBeg; @376
always @( lsiq_entry11_vld
       or lsiq_entry1_vld
       or lsiq_entry8_vld
       or lsiq_entry5_vld
       or lsiq_entry0_vld
       or lsiq_entry4_vld
       or lsiq_entry9_vld
       or lsiq_entry3_vld
       or lsiq_entry7_vld
       or lsiq_entry10_vld
       or lsiq_entry6_vld
       or lsiq_entry2_vld)
begin
  if(!lsiq_entry11_vld)
    lsiq_entry_create1_in[11:0] = 12'b1000_0000_0000;
  else if(!lsiq_entry10_vld)
    lsiq_entry_create1_in[11:0] = 12'b0100_0000_0000;
  else if(!lsiq_entry9_vld)
    lsiq_entry_create1_in[11:0] = 12'b0010_0000_0000;
  else if(!lsiq_entry8_vld)
    lsiq_entry_create1_in[11:0] = 12'b0001_0000_0000;
  else if(!lsiq_entry7_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_1000_0000;
  else if(!lsiq_entry6_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_0100_0000;
  else if(!lsiq_entry5_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_0010_0000;
  else if(!lsiq_entry4_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_0001_0000;
  else if(!lsiq_entry3_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_0000_1000;
  else if(!lsiq_entry2_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_0000_0100;
  else if(!lsiq_entry1_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_0000_0010;
  else if(!lsiq_entry0_vld)
    lsiq_entry_create1_in[11:0] = 12'b0000_0000_0001;
  else
    lsiq_entry_create1_in[11:0] = 12'b0000_0000_0000;
// &CombEnd; @403
end

assign lsiq_aiq_create0_entry[11:0] = lsiq_entry_create0_in[11:0];
assign lsiq_aiq_create1_entry[11:0] = lsiq_entry_create1_in[11:0];

assign lsiq_bypass_en = lsiq_create_bypass_empty
                        && !lsiq_bar_mode
                        && lsiq_create0_rdy_bypass;

assign lsiq_entry_create_en[11:0] =
       {12{ctrl_lsiq_create0_en}} & lsiq_entry_create0_in[11:0]
     | {12{ctrl_lsiq_create1_en}} & lsiq_entry_create1_in[11:0];

assign lsiq_entry0_create_en  = lsiq_entry_create_en[0];
assign lsiq_entry1_create_en  = lsiq_entry_create_en[1];
assign lsiq_entry2_create_en  = lsiq_entry_create_en[2];
assign lsiq_entry3_create_en  = lsiq_entry_create_en[3];
assign lsiq_entry4_create_en  = lsiq_entry_create_en[4];
assign lsiq_entry5_create_en  = lsiq_entry_create_en[5];
assign lsiq_entry6_create_en  = lsiq_entry_create_en[6];
assign lsiq_entry7_create_en  = lsiq_entry_create_en[7];
assign lsiq_entry8_create_en  = lsiq_entry_create_en[8];
assign lsiq_entry9_create_en  = lsiq_entry_create_en[9];
assign lsiq_entry10_create_en = lsiq_entry_create_en[10];
assign lsiq_entry11_create_en = lsiq_entry_create_en[11];

assign lsiq_bypass_dp_en      = lsiq_create_bypass_empty
                                && !lsiq_bar_mode
                                && lsiq_create0_rdy_bypass_dp;
assign lsiq_bypass_gateclk_en = lsiq_create_bypass_empty
                                && !lsiq_bar_mode
                                && lsiq_create0_rdy_bypass_gateclk;

//issue queue entry create data path control
assign lsiq_entry_create_dp_en[11:0] =
       {12{ctrl_lsiq_create0_dp_en}} & lsiq_entry_create0_in[11:0]
     | {12{ctrl_lsiq_create1_dp_en}} & lsiq_entry_create1_in[11:0];

assign lsiq_entry0_create_dp_en  = lsiq_entry_create_dp_en[0];
assign lsiq_entry1_create_dp_en  = lsiq_entry_create_dp_en[1];
assign lsiq_entry2_create_dp_en  = lsiq_entry_create_dp_en[2];
assign lsiq_entry3_create_dp_en  = lsiq_entry_create_dp_en[3];
assign lsiq_entry4_create_dp_en  = lsiq_entry_create_dp_en[4];
assign lsiq_entry5_create_dp_en  = lsiq_entry_create_dp_en[5];
assign lsiq_entry6_create_dp_en  = lsiq_entry_create_dp_en[6];
assign lsiq_entry7_create_dp_en  = lsiq_entry_create_dp_en[7];
assign lsiq_entry8_create_dp_en  = lsiq_entry_create_dp_en[8];
assign lsiq_entry9_create_dp_en  = lsiq_entry_create_dp_en[9];
assign lsiq_entry10_create_dp_en = lsiq_entry_create_dp_en[10];
assign lsiq_entry11_create_dp_en = lsiq_entry_create_dp_en[11];

//issue queue entry create gateclk control
//ignore bypass signal for timing optimization
assign lsiq_entry_create_gateclk_en[11:0] =
       {12{ctrl_lsiq_create0_gateclk_en}} & lsiq_entry_create0_in[11:0]
     | {12{ctrl_lsiq_create1_gateclk_en}} & lsiq_entry_create1_in[11:0];

assign lsiq_entry0_create_gateclk_en  = lsiq_entry_create_gateclk_en[0];
assign lsiq_entry1_create_gateclk_en  = lsiq_entry_create_gateclk_en[1];
assign lsiq_entry2_create_gateclk_en  = lsiq_entry_create_gateclk_en[2];
assign lsiq_entry3_create_gateclk_en  = lsiq_entry_create_gateclk_en[3];
assign lsiq_entry4_create_gateclk_en  = lsiq_entry_create_gateclk_en[4];
assign lsiq_entry5_create_gateclk_en  = lsiq_entry_create_gateclk_en[5];
assign lsiq_entry6_create_gateclk_en  = lsiq_entry_create_gateclk_en[6];
assign lsiq_entry7_create_gateclk_en  = lsiq_entry_create_gateclk_en[7];
assign lsiq_entry8_create_gateclk_en  = lsiq_entry_create_gateclk_en[8];
assign lsiq_entry9_create_gateclk_en  = lsiq_entry_create_gateclk_en[9];
assign lsiq_entry10_create_gateclk_en = lsiq_entry_create_gateclk_en[10];
assign lsiq_entry11_create_gateclk_en = lsiq_entry_create_gateclk_en[11];

//-------------------agevec of same type--------------------
//create 0 age vectors:
//1.existed entries of same type (bar and store shares same type)
assign lsiq_entry_create0_agevec[11:0] =
          lsiq_entry_vld[11:0]
          & ( {12{dp_lsiq_create0_load}} & lsiq_entry_load[11:0]
            | {12{dp_lsiq_create0_store || dp_lsiq_create0_bar}}
               & (lsiq_entry_store[11:0] | lsiq_entry_bar[11:0]))
          & ~(lsu_idu_lsiq_pop_entry[11:0]);
//create 1 age vectors:
//1.existed entries of same type
//2.create 0 entry of same type
assign lsiq_entry_create1_agevec[11:0] =
          lsiq_entry_vld[11:0]
          & ( {12{dp_lsiq_create1_load}} & lsiq_entry_load[11:0]
            | {12{dp_lsiq_create1_store || dp_lsiq_create1_bar}}
               & (lsiq_entry_store[11:0] | lsiq_entry_bar[11:0]))
          & ~(lsu_idu_lsiq_pop_entry[11:0])
        | lsiq_entry_create0_in[11:0]
          & {12{dp_lsiq_create0_load && dp_lsiq_create1_load
            || (dp_lsiq_create0_store || dp_lsiq_create0_bar)
            && (dp_lsiq_create1_store || dp_lsiq_create1_bar)}};

//-------------------agevec of all types--------------------
//create 0 age vectors:
//1.existed entries of all types
assign lsiq_entry_create0_agevec_all[11:0] =
          lsiq_entry_vld[11:0]
          & ~(lsu_idu_lsiq_pop_entry[11:0]);
//oldest for bypass inst
//bypass oldest ignore pop vld for timing optimization, if bypass
//inst is wrongly recognized as not oldest, it will replay later
assign lsiq_dp_create_bypass_oldest = !(|lsiq_entry_vld[11:0]);
//create 1 age vectors:
//1.existed entries of all types
//2.create 0 entry 
assign lsiq_entry_create1_agevec_all[11:0] =
          lsiq_entry_vld[11:0]
          & ~(lsu_idu_lsiq_pop_entry[11:0])
        | lsiq_entry_create0_in[11:0];

//-------------------no spec store valid--------------------
assign lsiq_dp_no_spec_store_vld = |(lsiq_entry_vld[11:0] & ~lsiq_entry_frz[11:0]
                                     & lsiq_entry_store[11:0] & lsiq_entry_no_spec[11:0]);

//-------------------create frz signal----------------------
assign lsiq_entry_create0_frz = lsiq_bar_mode || lsiq_bypass_dp_en
                                              || dp_lsiq_create0_no_spec
                                                 && dp_lsiq_create0_load;
assign lsiq_entry_create1_frz = lsiq_bar_mode || dp_lsiq_create1_no_spec
                                                 && dp_lsiq_create1_load;

//-----------------create select signals--------------------
//create 0/1 select:
//entry 0~5 use ~lsiq_entry_create0_in for better timing
//entry 6~11 use lsiq_entry_create1_in for better timing
//lsiq_entry_create0/1_in cannot be both 1,
//if both 0, do not create
assign lsiq_entry_create_sel[11:6] = {6{ctrl_lsiq_create1_dp_en}}
                                     & lsiq_entry_create1_in[11:6];
assign lsiq_entry_create_sel[5:0]  = ~({6{ctrl_lsiq_create0_dp_en}}
                                      & lsiq_entry_create0_in[5:0]);

//----------------entry0 flop create signals----------------
// &CombBeg; @537
always @( lsiq_entry_create1_agevec_all[11:1]
       or lsiq_entry_create1_agevec[11:1]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create0_agevec[11:1]
       or lsiq_entry_create0_frz
       or lsiq_entry_create0_agevec_all[11:1]
       or lsiq_entry_create_sel[0]
       or dp_lsiq_create1_data[162:0])
begin
  if(!lsiq_entry_create_sel[0]) begin
    lsiq_entry0_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry0_create_agevec[10:0]     = lsiq_entry_create0_agevec[11:1];
    lsiq_entry0_create_agevec_all[10:0] = lsiq_entry_create0_agevec_all[11:1];
    lsiq_entry0_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry0_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry0_create_agevec[10:0]     = lsiq_entry_create1_agevec[11:1];
    lsiq_entry0_create_agevec_all[10:0] = lsiq_entry_create1_agevec_all[11:1];
    lsiq_entry0_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @552
end

//----------------entry1 flop create signals----------------
// &CombBeg; @555
always @( lsiq_entry_create0_agevec[0]
       or lsiq_entry_create1_agevec_all[0]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create0_agevec_all[0]
       or lsiq_entry_create0_frz
       or lsiq_entry_create0_agevec[11:2]
       or lsiq_entry_create1_agevec[11:2]
       or lsiq_entry_create0_agevec_all[11:2]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create1_agevec_all[11:2]
       or lsiq_entry_create1_agevec[0]
       or lsiq_entry_create_sel[1])
begin
  if(!lsiq_entry_create_sel[1]) begin
    lsiq_entry1_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry1_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:2],
                                           lsiq_entry_create0_agevec[0]};
    lsiq_entry1_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:2],
                                           lsiq_entry_create0_agevec_all[0]};
    lsiq_entry1_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry1_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry1_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:2],
                                           lsiq_entry_create1_agevec[0]};
    lsiq_entry1_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:2],
                                           lsiq_entry_create1_agevec_all[0]};
    lsiq_entry1_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @574
end

//----------------entry2 flop create signals----------------
// &CombBeg; @577
always @( lsiq_entry_create0_agevec_all[11:3]
       or lsiq_entry_create0_agevec[1:0]
       or lsiq_entry_create_sel[2]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create1_agevec[1:0]
       or lsiq_entry_create0_frz
       or lsiq_entry_create1_agevec_all[11:3]
       or lsiq_entry_create1_agevec_all[1:0]
       or lsiq_entry_create1_agevec[11:3]
       or lsiq_entry_create0_agevec_all[1:0]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create0_agevec[11:3])
begin
  if(!lsiq_entry_create_sel[2]) begin
    lsiq_entry2_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry2_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:3],
                                           lsiq_entry_create0_agevec[1:0]};
    lsiq_entry2_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:3],
                                           lsiq_entry_create0_agevec_all[1:0]};
    lsiq_entry2_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry2_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry2_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:3],
                                           lsiq_entry_create1_agevec[1:0]};
    lsiq_entry2_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:3],
                                           lsiq_entry_create1_agevec_all[1:0]};
    lsiq_entry2_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @596
end

//----------------entry3 flop create signals----------------
// &CombBeg; @599
always @( dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_agevec_all[2:0]
       or lsiq_entry_create1_agevec[11:4]
       or lsiq_entry_create0_agevec[2:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create1_agevec[2:0]
       or lsiq_entry_create0_agevec[11:4]
       or lsiq_entry_create0_frz
       or lsiq_entry_create0_agevec_all[2:0]
       or lsiq_entry_create1_agevec_all[11:4]
       or lsiq_entry_create_sel[3]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create0_agevec_all[11:4])
begin
  if(!lsiq_entry_create_sel[3]) begin
    lsiq_entry3_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry3_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:4],
                                           lsiq_entry_create0_agevec[2:0]};
    lsiq_entry3_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:4],
                                           lsiq_entry_create0_agevec_all[2:0]};
    lsiq_entry3_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry3_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry3_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:4],
                                           lsiq_entry_create1_agevec[2:0]};
    lsiq_entry3_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:4],
                                           lsiq_entry_create1_agevec_all[2:0]};
    lsiq_entry3_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @618
end

//----------------entry4 flop create signals----------------
// &CombBeg; @621
always @( lsiq_entry_create1_agevec[3:0]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create0_agevec[3:0]
       or lsiq_entry_create1_agevec[11:5]
       or lsiq_entry_create1_frz
       or lsiq_entry_create0_agevec_all[3:0]
       or lsiq_entry_create1_agevec_all[11:5]
       or lsiq_entry_create0_frz
       or lsiq_entry_create0_agevec[11:5]
       or lsiq_entry_create_sel[4]
       or lsiq_entry_create1_agevec_all[3:0]
       or lsiq_entry_create0_agevec_all[11:5]
       or dp_lsiq_create1_data[162:0])
begin
  if(!lsiq_entry_create_sel[4]) begin
    lsiq_entry4_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry4_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:5],
                                           lsiq_entry_create0_agevec[3:0]};
    lsiq_entry4_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:5],
                                           lsiq_entry_create0_agevec_all[3:0]};
    lsiq_entry4_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry4_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry4_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:5],
                                           lsiq_entry_create1_agevec[3:0]};
    lsiq_entry4_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:5],
                                           lsiq_entry_create1_agevec_all[3:0]};
    lsiq_entry4_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @640
end

//----------------entry5 flop create signals----------------
// &CombBeg; @643
always @( dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_agevec_all[4:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create_sel[5]
       or lsiq_entry_create1_agevec[11:6]
       or lsiq_entry_create0_agevec_all[4:0]
       or lsiq_entry_create0_frz
       or lsiq_entry_create1_agevec[4:0]
       or lsiq_entry_create0_agevec[4:0]
       or lsiq_entry_create0_agevec_all[11:6]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create1_agevec_all[11:6]
       or lsiq_entry_create0_agevec[11:6])
begin
  if(!lsiq_entry_create_sel[5]) begin
    lsiq_entry5_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry5_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:6],
                                           lsiq_entry_create0_agevec[4:0]};
    lsiq_entry5_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:6],
                                           lsiq_entry_create0_agevec_all[4:0]};
    lsiq_entry5_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry5_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry5_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:6],
                                           lsiq_entry_create1_agevec[4:0]};
    lsiq_entry5_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:6],
                                           lsiq_entry_create1_agevec_all[4:0]};
    lsiq_entry5_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @662
end

//----------------entry6 flop create signals----------------
// &CombBeg; @665
always @( lsiq_entry_create0_agevec[11:7]
       or lsiq_entry_create_sel[6]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create1_agevec[5:0]
       or lsiq_entry_create0_agevec_all[5:0]
       or lsiq_entry_create0_frz
       or lsiq_entry_create1_agevec[11:7]
       or lsiq_entry_create0_agevec_all[11:7]
       or lsiq_entry_create1_agevec_all[5:0]
       or lsiq_entry_create0_agevec[5:0]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create1_agevec_all[11:7])
begin
  if(!lsiq_entry_create_sel[6]) begin
    lsiq_entry6_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry6_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:7],
                                           lsiq_entry_create0_agevec[5:0]};
    lsiq_entry6_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:7],
                                           lsiq_entry_create0_agevec_all[5:0]};
    lsiq_entry6_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry6_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry6_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:7],
                                           lsiq_entry_create1_agevec[5:0]};
    lsiq_entry6_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:7],
                                           lsiq_entry_create1_agevec_all[5:0]};
    lsiq_entry6_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @684
end

//----------------entry7 flop create signals----------------
// &CombBeg; @687
always @( lsiq_entry_create1_agevec[6:0]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create1_agevec[11:8]
       or lsiq_entry_create0_agevec[6:0]
       or lsiq_entry_create_sel[7]
       or lsiq_entry_create1_agevec_all[11:8]
       or lsiq_entry_create0_frz
       or lsiq_entry_create1_agevec_all[6:0]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create0_agevec[11:8]
       or lsiq_entry_create0_agevec_all[6:0]
       or lsiq_entry_create0_agevec_all[11:8])
begin
  if(!lsiq_entry_create_sel[7]) begin
    lsiq_entry7_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry7_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:8],
                                           lsiq_entry_create0_agevec[6:0]};
    lsiq_entry7_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:8],
                                           lsiq_entry_create0_agevec_all[6:0]};
    lsiq_entry7_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry7_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry7_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:8],
                                           lsiq_entry_create1_agevec[6:0]};
    lsiq_entry7_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:8],
                                           lsiq_entry_create1_agevec_all[6:0]};
    lsiq_entry7_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @706
end

//----------------entry8 flop create signals----------------
// &CombBeg; @709
always @( lsiq_entry_create1_agevec_all[11:9]
       or lsiq_entry_create1_agevec[7:0]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create0_agevec_all[7:0]
       or lsiq_entry_create_sel[8]
       or lsiq_entry_create0_frz
       or lsiq_entry_create1_agevec[11:9]
       or lsiq_entry_create0_agevec[7:0]
       or lsiq_entry_create0_agevec_all[11:9]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create1_agevec_all[7:0]
       or lsiq_entry_create0_agevec[11:9])
begin
  if(!lsiq_entry_create_sel[8]) begin
    lsiq_entry8_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry8_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:9],
                                           lsiq_entry_create0_agevec[7:0]};
    lsiq_entry8_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:9],
                                           lsiq_entry_create0_agevec_all[7:0]};
    lsiq_entry8_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry8_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry8_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:9],
                                           lsiq_entry_create1_agevec[7:0]};
    lsiq_entry8_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:9],
                                           lsiq_entry_create1_agevec_all[7:0]};
    lsiq_entry8_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @728
end

//----------------entry9 flop create signals----------------
// &CombBeg; @731
always @( lsiq_entry_create1_agevec_all[11:10]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create0_agevec_all[8:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create1_agevec_all[8:0]
       or lsiq_entry_create0_agevec_all[11:10]
       or lsiq_entry_create0_frz
       or lsiq_entry_create0_agevec[11:10]
       or lsiq_entry_create1_agevec[8:0]
       or lsiq_entry_create_sel[9]
       or lsiq_entry_create1_agevec[11:10]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create0_agevec[8:0])
begin
  if(!lsiq_entry_create_sel[9]) begin
    lsiq_entry9_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry9_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11:10],
                                           lsiq_entry_create0_agevec[8:0]};
    lsiq_entry9_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11:10],
                                           lsiq_entry_create0_agevec_all[8:0]};
    lsiq_entry9_create_data[LSIQ_WIDTH-1:0] =
       dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry9_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry9_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11:10],
                                           lsiq_entry_create1_agevec[8:0]};
    lsiq_entry9_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11:10],
                                           lsiq_entry_create1_agevec_all[8:0]};
    lsiq_entry9_create_data[LSIQ_WIDTH-1:0] = 
       dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @750
end

//---------------entry10 flop create signals----------------
// &CombBeg; @753
always @( lsiq_entry_create1_agevec[9:0]
       or dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create1_agevec_all[11]
       or lsiq_entry_create1_agevec_all[9:0]
       or lsiq_entry_create0_agevec_all[9:0]
       or lsiq_entry_create1_agevec[11]
       or lsiq_entry_create0_frz
       or lsiq_entry_create0_agevec[9:0]
       or lsiq_entry_create0_agevec[11]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create0_agevec_all[11]
       or lsiq_entry_create_sel[10])
begin
  if(!lsiq_entry_create_sel[10]) begin
    lsiq_entry10_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry10_create_agevec[10:0]     = {lsiq_entry_create0_agevec[11],
                                            lsiq_entry_create0_agevec[9:0]};
    lsiq_entry10_create_agevec_all[10:0] = {lsiq_entry_create0_agevec_all[11],
                                            lsiq_entry_create0_agevec_all[9:0]};
    lsiq_entry10_create_data[LSIQ_WIDTH-1:0] =
        dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry10_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry10_create_agevec[10:0]     = {lsiq_entry_create1_agevec[11],
                                            lsiq_entry_create1_agevec[9:0]};
    lsiq_entry10_create_agevec_all[10:0] = {lsiq_entry_create1_agevec_all[11],
                                            lsiq_entry_create1_agevec_all[9:0]};
    lsiq_entry10_create_data[LSIQ_WIDTH-1:0] = 
        dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @772
end

//---------------entry11 flop create signals----------------
// &CombBeg; @775
always @( dp_lsiq_create0_data[162:0]
       or lsiq_entry_create1_frz
       or lsiq_entry_create0_frz
       or lsiq_entry_create1_agevec_all[10:0]
       or dp_lsiq_create1_data[162:0]
       or lsiq_entry_create0_agevec[10:0]
       or lsiq_entry_create0_agevec_all[10:0]
       or lsiq_entry_create_sel[11]
       or lsiq_entry_create1_agevec[10:0])
begin
  if(!lsiq_entry_create_sel[11]) begin
    lsiq_entry11_create_frz              = lsiq_entry_create0_frz;
    lsiq_entry11_create_agevec[10:0]     = lsiq_entry_create0_agevec[10:0];
    lsiq_entry11_create_agevec_all[10:0] = lsiq_entry_create0_agevec_all[10:0];
    lsiq_entry11_create_data[LSIQ_WIDTH-1:0] =
        dp_lsiq_create0_data[LSIQ_WIDTH-1:0];
  end
  else begin
    lsiq_entry11_create_frz              = lsiq_entry_create1_frz;
    lsiq_entry11_create_agevec[10:0]     = lsiq_entry_create1_agevec[10:0];
    lsiq_entry11_create_agevec_all[10:0] = lsiq_entry_create1_agevec_all[10:0];
    lsiq_entry11_create_data[LSIQ_WIDTH-1:0] = 
        dp_lsiq_create1_data[LSIQ_WIDTH-1:0];
  end
// &CombEnd; @790
end

//==========================================================
//             LSU Issue Queue Issue Control
//==========================================================
//----------------Pipe0 Launch Ready Signals----------------
assign lsiq_entry0_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[1:0];
assign lsiq_entry1_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[3:2];
assign lsiq_entry2_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[5:4];
assign lsiq_entry3_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[7:6];
assign lsiq_entry4_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[9:8];
assign lsiq_entry5_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[11:10];
assign lsiq_entry6_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[13:12];
assign lsiq_entry7_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[15:14];
assign lsiq_entry8_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[17:16];
assign lsiq_entry9_alu0_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[19:18];
assign lsiq_entry10_alu0_reg_fwd_vld[1:0] = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[21:20];
assign lsiq_entry11_alu0_reg_fwd_vld[1:0] = ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[23:22];

assign lsiq_entry0_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[1:0];
assign lsiq_entry1_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[3:2];
assign lsiq_entry2_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[5:4];
assign lsiq_entry3_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[7:6];
assign lsiq_entry4_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[9:8];
assign lsiq_entry5_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[11:10];
assign lsiq_entry6_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[13:12];
assign lsiq_entry7_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[15:14];
assign lsiq_entry8_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[17:16];
assign lsiq_entry9_alu1_reg_fwd_vld[1:0]  = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[19:18];
assign lsiq_entry10_alu1_reg_fwd_vld[1:0] = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[21:20];
assign lsiq_entry11_alu1_reg_fwd_vld[1:0] = ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[23:22];

// &Force ("nonport", "lsiq_entry_bef_load"); @822
// &Force ("nonport", "lsiq_entry_bef_store"); @823
//------------------issue prepare signals-------------------
assign lsiq_entry_ready[11:0] =
      {lsiq_entry11_rdy, lsiq_entry10_rdy, lsiq_entry9_rdy,
       lsiq_entry8_rdy,  lsiq_entry7_rdy,  lsiq_entry6_rdy,
       lsiq_entry5_rdy,  lsiq_entry4_rdy,  lsiq_entry3_rdy,
       lsiq_entry2_rdy,  lsiq_entry1_rdy,  lsiq_entry0_rdy};
assign lsiq_entry_raw_rdy[11:0] =
      {lsiq_entry11_raw_rdy, lsiq_entry10_raw_rdy, lsiq_entry9_raw_rdy,
       lsiq_entry8_raw_rdy,  lsiq_entry7_raw_rdy,  lsiq_entry6_raw_rdy,
       lsiq_entry5_raw_rdy,  lsiq_entry4_raw_rdy,  lsiq_entry3_raw_rdy,
       lsiq_entry2_raw_rdy,  lsiq_entry1_raw_rdy,  lsiq_entry0_raw_rdy};
assign lsiq_entry_load[11:0] = 
      {lsiq_entry11_load,  lsiq_entry10_load,  lsiq_entry9_load,
       lsiq_entry8_load,   lsiq_entry7_load,   lsiq_entry6_load,
       lsiq_entry5_load,   lsiq_entry4_load,   lsiq_entry3_load,
       lsiq_entry2_load,   lsiq_entry1_load,   lsiq_entry0_load};
assign lsiq_entry_store[11:0] = 
      {lsiq_entry11_store, lsiq_entry10_store, lsiq_entry9_store,
       lsiq_entry8_store,  lsiq_entry7_store,  lsiq_entry6_store,
       lsiq_entry5_store,  lsiq_entry4_store,  lsiq_entry3_store,
       lsiq_entry2_store,  lsiq_entry1_store,  lsiq_entry0_store};
assign lsiq_entry_bar[11:0] =
      {lsiq_entry11_bar, lsiq_entry10_bar, lsiq_entry9_bar,
       lsiq_entry8_bar,  lsiq_entry7_bar,  lsiq_entry6_bar,
       lsiq_entry5_bar,  lsiq_entry4_bar,  lsiq_entry3_bar,
       lsiq_entry2_bar,  lsiq_entry1_bar,  lsiq_entry0_bar};
assign lsiq_entry_bef_load[11:0] =
      {lsiq_entry11_bar_type[0],lsiq_entry10_bar_type[0],lsiq_entry9_bar_type[0],
       lsiq_entry8_bar_type[0], lsiq_entry7_bar_type[0], lsiq_entry6_bar_type[0],
       lsiq_entry5_bar_type[0], lsiq_entry4_bar_type[0], lsiq_entry3_bar_type[0],
       lsiq_entry2_bar_type[0], lsiq_entry1_bar_type[0], lsiq_entry0_bar_type[0]};
assign lsiq_entry_bef_store[11:0] =
      {lsiq_entry11_bar_type[1],lsiq_entry10_bar_type[1],lsiq_entry9_bar_type[1],
       lsiq_entry8_bar_type[1], lsiq_entry7_bar_type[1], lsiq_entry6_bar_type[1],
       lsiq_entry5_bar_type[1], lsiq_entry4_bar_type[1], lsiq_entry3_bar_type[1],
       lsiq_entry2_bar_type[1], lsiq_entry1_bar_type[1], lsiq_entry0_bar_type[1]};
assign lsiq_entry_aft_load[11:0] =
      {lsiq_entry11_bar_type[2],lsiq_entry10_bar_type[2],lsiq_entry9_bar_type[2],
       lsiq_entry8_bar_type[2], lsiq_entry7_bar_type[2], lsiq_entry6_bar_type[2],
       lsiq_entry5_bar_type[2], lsiq_entry4_bar_type[2], lsiq_entry3_bar_type[2],
       lsiq_entry2_bar_type[2], lsiq_entry1_bar_type[2], lsiq_entry0_bar_type[2]};
assign lsiq_entry_aft_store[11:0] =
      {lsiq_entry11_bar_type[3],lsiq_entry10_bar_type[3],lsiq_entry9_bar_type[3],
       lsiq_entry8_bar_type[3], lsiq_entry7_bar_type[3], lsiq_entry6_bar_type[3],
       lsiq_entry5_bar_type[3], lsiq_entry4_bar_type[3], lsiq_entry3_bar_type[3],
       lsiq_entry2_bar_type[3], lsiq_entry1_bar_type[3], lsiq_entry0_bar_type[3]};
assign lsiq_entry_no_spec[11:0] =
      {lsiq_entry11_no_spec, lsiq_entry10_no_spec, lsiq_entry9_no_spec,
       lsiq_entry8_no_spec,  lsiq_entry7_no_spec,  lsiq_entry6_no_spec,
       lsiq_entry5_no_spec,  lsiq_entry4_no_spec,  lsiq_entry3_no_spec,
       lsiq_entry2_no_spec,  lsiq_entry1_no_spec,  lsiq_entry0_no_spec};
assign lsiq_entry_frz[11:0] =
      {lsiq_entry11_frz, lsiq_entry10_frz, lsiq_entry9_frz,
       lsiq_entry8_frz,  lsiq_entry7_frz,  lsiq_entry6_frz,
       lsiq_entry5_frz,  lsiq_entry4_frz,  lsiq_entry3_frz,
       lsiq_entry2_frz,  lsiq_entry1_frz,  lsiq_entry0_frz};

//------------prepare type signals for each entry-----------
assign lsiq_entry0_other_load[10:0]   =  lsiq_entry_load[11:1];
assign lsiq_entry1_other_load[10:0]   = {lsiq_entry_load[11:2], lsiq_entry_load[0]};
assign lsiq_entry2_other_load[10:0]   = {lsiq_entry_load[11:3], lsiq_entry_load[1:0]};
assign lsiq_entry3_other_load[10:0]   = {lsiq_entry_load[11:4], lsiq_entry_load[2:0]};
assign lsiq_entry4_other_load[10:0]   = {lsiq_entry_load[11:5], lsiq_entry_load[3:0]};
assign lsiq_entry5_other_load[10:0]   = {lsiq_entry_load[11:6], lsiq_entry_load[4:0]};
assign lsiq_entry6_other_load[10:0]   = {lsiq_entry_load[11:7], lsiq_entry_load[5:0]};
assign lsiq_entry7_other_load[10:0]   = {lsiq_entry_load[11:8], lsiq_entry_load[6:0]};
assign lsiq_entry8_other_load[10:0]   = {lsiq_entry_load[11:9], lsiq_entry_load[7:0]};
assign lsiq_entry9_other_load[10:0]   = {lsiq_entry_load[11:10],lsiq_entry_load[8:0]};
assign lsiq_entry10_other_load[10:0]  = {lsiq_entry_load[11],   lsiq_entry_load[9:0]};
assign lsiq_entry11_other_load[10:0]  =  lsiq_entry_load[10:0];

assign lsiq_entry0_other_store[10:0]  =  lsiq_entry_store[11:1];
assign lsiq_entry1_other_store[10:0]  = {lsiq_entry_store[11:2], lsiq_entry_store[0]};
assign lsiq_entry2_other_store[10:0]  = {lsiq_entry_store[11:3], lsiq_entry_store[1:0]};
assign lsiq_entry3_other_store[10:0]  = {lsiq_entry_store[11:4], lsiq_entry_store[2:0]};
assign lsiq_entry4_other_store[10:0]  = {lsiq_entry_store[11:5], lsiq_entry_store[3:0]};
assign lsiq_entry5_other_store[10:0]  = {lsiq_entry_store[11:6], lsiq_entry_store[4:0]};
assign lsiq_entry6_other_store[10:0]  = {lsiq_entry_store[11:7], lsiq_entry_store[5:0]};
assign lsiq_entry7_other_store[10:0]  = {lsiq_entry_store[11:8], lsiq_entry_store[6:0]};
assign lsiq_entry8_other_store[10:0]  = {lsiq_entry_store[11:9], lsiq_entry_store[7:0]};
assign lsiq_entry9_other_store[10:0]  = {lsiq_entry_store[11:10],lsiq_entry_store[8:0]};
assign lsiq_entry10_other_store[10:0] = {lsiq_entry_store[11],   lsiq_entry_store[9:0]};
assign lsiq_entry11_other_store[10:0] =  lsiq_entry_store[10:0];

assign lsiq_entry0_other_bar[10:0]    =  lsiq_entry_bar[11:1];
assign lsiq_entry1_other_bar[10:0]    = {lsiq_entry_bar[11:2], lsiq_entry_bar[0]};
assign lsiq_entry2_other_bar[10:0]    = {lsiq_entry_bar[11:3], lsiq_entry_bar[1:0]};
assign lsiq_entry3_other_bar[10:0]    = {lsiq_entry_bar[11:4], lsiq_entry_bar[2:0]};
assign lsiq_entry4_other_bar[10:0]    = {lsiq_entry_bar[11:5], lsiq_entry_bar[3:0]};
assign lsiq_entry5_other_bar[10:0]    = {lsiq_entry_bar[11:6], lsiq_entry_bar[4:0]};
assign lsiq_entry6_other_bar[10:0]    = {lsiq_entry_bar[11:7], lsiq_entry_bar[5:0]};
assign lsiq_entry7_other_bar[10:0]    = {lsiq_entry_bar[11:8], lsiq_entry_bar[6:0]};
assign lsiq_entry8_other_bar[10:0]    = {lsiq_entry_bar[11:9], lsiq_entry_bar[7:0]};
assign lsiq_entry9_other_bar[10:0]    = {lsiq_entry_bar[11:10],lsiq_entry_bar[8:0]};
assign lsiq_entry10_other_bar[10:0]   = {lsiq_entry_bar[11],   lsiq_entry_bar[9:0]};
assign lsiq_entry11_other_bar[10:0]   =  lsiq_entry_bar[10:0];

assign lsiq_entry0_other_raw_rdy[10:0]  =  lsiq_entry_raw_rdy[11:1];
assign lsiq_entry1_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:2], lsiq_entry_raw_rdy[0]};
assign lsiq_entry2_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:3], lsiq_entry_raw_rdy[1:0]};
assign lsiq_entry3_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:4], lsiq_entry_raw_rdy[2:0]};
assign lsiq_entry4_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:5], lsiq_entry_raw_rdy[3:0]};
assign lsiq_entry5_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:6], lsiq_entry_raw_rdy[4:0]};
assign lsiq_entry6_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:7], lsiq_entry_raw_rdy[5:0]};
assign lsiq_entry7_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:8], lsiq_entry_raw_rdy[6:0]};
assign lsiq_entry8_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:9], lsiq_entry_raw_rdy[7:0]};
assign lsiq_entry9_other_raw_rdy[10:0]  = {lsiq_entry_raw_rdy[11:10],lsiq_entry_raw_rdy[8:0]};
assign lsiq_entry10_other_raw_rdy[10:0] = {lsiq_entry_raw_rdy[11],   lsiq_entry_raw_rdy[9:0]};
assign lsiq_entry11_other_raw_rdy[10:0] =  lsiq_entry_raw_rdy[10:0];

assign lsiq_entry0_other_aft_load[10:0]  =  lsiq_entry_aft_load[11:1];
assign lsiq_entry1_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:2], lsiq_entry_aft_load[0]};
assign lsiq_entry2_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:3], lsiq_entry_aft_load[1:0]};
assign lsiq_entry3_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:4], lsiq_entry_aft_load[2:0]};
assign lsiq_entry4_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:5], lsiq_entry_aft_load[3:0]};
assign lsiq_entry5_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:6], lsiq_entry_aft_load[4:0]};
assign lsiq_entry6_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:7], lsiq_entry_aft_load[5:0]};
assign lsiq_entry7_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:8], lsiq_entry_aft_load[6:0]};
assign lsiq_entry8_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:9], lsiq_entry_aft_load[7:0]};
assign lsiq_entry9_other_aft_load[10:0]  = {lsiq_entry_aft_load[11:10],lsiq_entry_aft_load[8:0]};
assign lsiq_entry10_other_aft_load[10:0] = {lsiq_entry_aft_load[11],   lsiq_entry_aft_load[9:0]};
assign lsiq_entry11_other_aft_load[10:0] =  lsiq_entry_aft_load[10:0];

assign lsiq_entry0_other_aft_store[10:0]  =  lsiq_entry_aft_store[11:1];
assign lsiq_entry1_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:2], lsiq_entry_aft_store[0]};
assign lsiq_entry2_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:3], lsiq_entry_aft_store[1:0]};
assign lsiq_entry3_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:4], lsiq_entry_aft_store[2:0]};
assign lsiq_entry4_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:5], lsiq_entry_aft_store[3:0]};
assign lsiq_entry5_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:6], lsiq_entry_aft_store[4:0]};
assign lsiq_entry6_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:7], lsiq_entry_aft_store[5:0]};
assign lsiq_entry7_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:8], lsiq_entry_aft_store[6:0]};
assign lsiq_entry8_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:9], lsiq_entry_aft_store[7:0]};
assign lsiq_entry9_other_aft_store[10:0]  = {lsiq_entry_aft_store[11:10],lsiq_entry_aft_store[8:0]};
assign lsiq_entry10_other_aft_store[10:0] = {lsiq_entry_aft_store[11],   lsiq_entry_aft_store[9:0]};
assign lsiq_entry11_other_aft_store[10:0] =  lsiq_entry_aft_store[10:0];

assign lsiq_entry0_other_no_spec[10:0]    =  lsiq_entry_no_spec[11:1];
assign lsiq_entry1_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:2], lsiq_entry_no_spec[0]};
assign lsiq_entry2_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:3], lsiq_entry_no_spec[1:0]};
assign lsiq_entry3_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:4], lsiq_entry_no_spec[2:0]};
assign lsiq_entry4_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:5], lsiq_entry_no_spec[3:0]};
assign lsiq_entry5_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:6], lsiq_entry_no_spec[4:0]};
assign lsiq_entry6_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:7], lsiq_entry_no_spec[5:0]};
assign lsiq_entry7_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:8], lsiq_entry_no_spec[6:0]};
assign lsiq_entry8_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:9], lsiq_entry_no_spec[7:0]};
assign lsiq_entry9_other_no_spec[10:0]    = {lsiq_entry_no_spec[11:10],lsiq_entry_no_spec[8:0]};
assign lsiq_entry10_other_no_spec[10:0]   = {lsiq_entry_no_spec[11],   lsiq_entry_no_spec[9:0]};
assign lsiq_entry11_other_no_spec[10:0]   =  lsiq_entry_no_spec[10:0];

assign lsiq_entry0_other_frz[10:0]    =  lsiq_entry_frz[11:1];
assign lsiq_entry1_other_frz[10:0]    = {lsiq_entry_frz[11:2], lsiq_entry_frz[0]};
assign lsiq_entry2_other_frz[10:0]    = {lsiq_entry_frz[11:3], lsiq_entry_frz[1:0]};
assign lsiq_entry3_other_frz[10:0]    = {lsiq_entry_frz[11:4], lsiq_entry_frz[2:0]};
assign lsiq_entry4_other_frz[10:0]    = {lsiq_entry_frz[11:5], lsiq_entry_frz[3:0]};
assign lsiq_entry5_other_frz[10:0]    = {lsiq_entry_frz[11:6], lsiq_entry_frz[4:0]};
assign lsiq_entry6_other_frz[10:0]    = {lsiq_entry_frz[11:7], lsiq_entry_frz[5:0]};
assign lsiq_entry7_other_frz[10:0]    = {lsiq_entry_frz[11:8], lsiq_entry_frz[6:0]};
assign lsiq_entry8_other_frz[10:0]    = {lsiq_entry_frz[11:9], lsiq_entry_frz[7:0]};
assign lsiq_entry9_other_frz[10:0]    = {lsiq_entry_frz[11:10],lsiq_entry_frz[8:0]};
assign lsiq_entry10_other_frz[10:0]   = {lsiq_entry_frz[11],   lsiq_entry_frz[9:0]};
assign lsiq_entry11_other_frz[10:0]   =  lsiq_entry_frz[10:0];

//-----------entry issue enable signals for entries---------
//issue signals for entries ignore inst type
assign lsiq_entry_issue_en[11:0]  = lsiq_entry_ready[11:0];
//rename for entry
assign lsiq_entry0_issue_en      = lsiq_entry_issue_en[0];
assign lsiq_entry1_issue_en      = lsiq_entry_issue_en[1];
assign lsiq_entry2_issue_en      = lsiq_entry_issue_en[2];
assign lsiq_entry3_issue_en      = lsiq_entry_issue_en[3];
assign lsiq_entry4_issue_en      = lsiq_entry_issue_en[4];
assign lsiq_entry5_issue_en      = lsiq_entry_issue_en[5];
assign lsiq_entry6_issue_en      = lsiq_entry_issue_en[6];
assign lsiq_entry7_issue_en      = lsiq_entry_issue_en[7];
assign lsiq_entry8_issue_en      = lsiq_entry_issue_en[8];
assign lsiq_entry9_issue_en      = lsiq_entry_issue_en[9];
assign lsiq_entry10_issue_en     = lsiq_entry_issue_en[10];
assign lsiq_entry11_issue_en     = lsiq_entry_issue_en[11];

//---------------entry issue signals for rf pipes-----------
//load entry ready
assign lsiq_pipe3_entry_ready[11:0]    = lsiq_entry_ready[11:0]
                                         & lsiq_entry_load[11:0];
//store and bar entry ready
assign lsiq_pipe4_entry_ready[11:0]    = lsiq_entry_ready[11:0]
                                         & (lsiq_entry_store[11:0]
                                            | lsiq_entry_bar[11:0]);
//bypass enable
assign lsiq_pipe3_bypass_en            = lsiq_bypass_en
                                         && dp_lsiq_create0_load;
assign lsiq_pipe4_bypass_en            = lsiq_bypass_en
                                         && dp_lsiq_create0_store;
//issue enable signals:
//if bypass or ready entry exists
assign lsiq_xx_pipe3_issue_en          = |{lsiq_pipe3_bypass_en,
                                           lsiq_pipe3_entry_ready[11:0]};
assign lsiq_xx_pipe4_issue_en          = |{lsiq_pipe4_bypass_en,
                                           lsiq_pipe4_entry_ready[11:0]};
//gate clock issue enable with timing optimization
assign lsiq_xx_gateclk_issue_en        = lsiq_bypass_gateclk_en
                                         || lsiq_entry0_vld_with_frz
                                         || lsiq_entry1_vld_with_frz
                                         || lsiq_entry2_vld_with_frz
                                         || lsiq_entry3_vld_with_frz
                                         || lsiq_entry4_vld_with_frz
                                         || lsiq_entry5_vld_with_frz
                                         || lsiq_entry6_vld_with_frz
                                         || lsiq_entry7_vld_with_frz
                                         || lsiq_entry8_vld_with_frz
                                         || lsiq_entry9_vld_with_frz
                                         || lsiq_entry10_vld_with_frz
                                         || lsiq_entry11_vld_with_frz;
//issue enable for rf pipes:
//consider inst type
assign lsiq_pipe3_entry_issue_en[11:0] = lsiq_pipe3_entry_ready[11:0];
assign lsiq_pipe4_entry_issue_en[11:0] = lsiq_pipe4_entry_ready[11:0];

//-----------------issue entry indiction--------------------
assign lsiq_dp_pipe3_issue_entry[11:0] = (lsiq_create_bypass_empty)
                                         ? lsiq_entry_create0_in[11:0]
                                         : lsiq_pipe3_entry_issue_en[11:0];
assign lsiq_dp_pipe4_issue_entry[11:0] = (lsiq_create_bypass_empty)
                                         ? lsiq_entry_create0_in[11:0]
                                         : lsiq_pipe4_entry_issue_en[11:0];

//-----------------issue data path selection----------------
//issue data path will select oldest ready entry in issue queue
//if no instruction valid, the data path will always select bypass 
//data path
// &CombBeg; @1053
always @( lsiq_entry7_read_data[162:0]
       or lsiq_entry2_read_data[162:0]
       or lsiq_entry0_read_data[162:0]
       or lsiq_pipe3_entry_issue_en[11:0]
       or lsiq_entry9_read_data[162:0]
       or lsiq_entry11_read_data[162:0]
       or lsiq_entry5_read_data[162:0]
       or lsiq_entry6_read_data[162:0]
       or lsiq_entry1_read_data[162:0]
       or lsiq_entry3_read_data[162:0]
       or lsiq_entry4_read_data[162:0]
       or lsiq_entry8_read_data[162:0]
       or lsiq_entry10_read_data[162:0])
begin
  case (lsiq_pipe3_entry_issue_en[11:0])
    12'h001: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry0_read_data[LSIQ_WIDTH-1:0];
    12'h002: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry1_read_data[LSIQ_WIDTH-1:0];
    12'h004: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry2_read_data[LSIQ_WIDTH-1:0];
    12'h008: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry3_read_data[LSIQ_WIDTH-1:0];
    12'h010: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry4_read_data[LSIQ_WIDTH-1:0];
    12'h020: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry5_read_data[LSIQ_WIDTH-1:0];
    12'h040: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry6_read_data[LSIQ_WIDTH-1:0];
    12'h080: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry7_read_data[LSIQ_WIDTH-1:0];
    12'h100: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry8_read_data[LSIQ_WIDTH-1:0];
    12'h200: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry9_read_data[LSIQ_WIDTH-1:0];
    12'h400: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry10_read_data[LSIQ_WIDTH-1:0];
    12'h800: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry11_read_data[LSIQ_WIDTH-1:0];
    default: lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0] =
                                     {LSIQ_WIDTH{1'bx}};
  endcase
// &CombEnd; @1082
end

// &CombBeg; @1084
always @( lsiq_entry7_read_data[162:0]
       or lsiq_entry2_read_data[162:0]
       or lsiq_entry0_read_data[162:0]
       or lsiq_entry9_read_data[162:0]
       or lsiq_entry11_read_data[162:0]
       or lsiq_entry5_read_data[162:0]
       or lsiq_entry6_read_data[162:0]
       or lsiq_entry1_read_data[162:0]
       or lsiq_entry3_read_data[162:0]
       or lsiq_entry4_read_data[162:0]
       or lsiq_entry8_read_data[162:0]
       or lsiq_entry10_read_data[162:0]
       or lsiq_pipe4_entry_issue_en[11:0])
begin
  case (lsiq_pipe4_entry_issue_en[11:0])
    12'h001: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry0_read_data[LSIQ_WIDTH-1:0];
    12'h002: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry1_read_data[LSIQ_WIDTH-1:0];
    12'h004: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry2_read_data[LSIQ_WIDTH-1:0];
    12'h008: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry3_read_data[LSIQ_WIDTH-1:0];
    12'h010: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry4_read_data[LSIQ_WIDTH-1:0];
    12'h020: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry5_read_data[LSIQ_WIDTH-1:0];
    12'h040: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry6_read_data[LSIQ_WIDTH-1:0];
    12'h080: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry7_read_data[LSIQ_WIDTH-1:0];
    12'h100: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry8_read_data[LSIQ_WIDTH-1:0];
    12'h200: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry9_read_data[LSIQ_WIDTH-1:0];
    12'h400: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry10_read_data[LSIQ_WIDTH-1:0];
    12'h800: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
               lsiq_entry11_read_data[LSIQ_WIDTH-1:0];
    default: lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0] =
                                     {LSIQ_WIDTH{1'bx}};
  endcase
// &CombEnd; @1113
end

//if no entry valid, select bypass path
assign lsiq_dp_pipe3_issue_read_data[LSIQ_WIDTH-1:0] = 
         (lsiq_create_bypass_empty)
         ? dp_lsiq_bypass_data[LSIQ_WIDTH-1:0]
         : lsiq_pipe3_entry_read_data[LSIQ_WIDTH-1:0];
assign lsiq_dp_pipe4_issue_read_data[LSIQ_WIDTH-1:0] = 
         (lsiq_create_bypass_empty)
         ? dp_lsiq_bypass_data[LSIQ_WIDTH-1:0]
         : lsiq_pipe4_entry_read_data[LSIQ_WIDTH-1:0];

//==========================================================
//            LSU Issue Queue Launch Control
//==========================================================
//-------------------entry pop enable signals---------------
//pop when rf launch pass
assign {lsiq_entry0_pop_other_entry[10:0],
        lsiq_entry0_pop_cur_entry}          = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry1_pop_other_entry[10:1],  
        lsiq_entry1_pop_cur_entry,
        lsiq_entry1_pop_other_entry[0]}     = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry2_pop_other_entry[10:2],  
        lsiq_entry2_pop_cur_entry,
        lsiq_entry2_pop_other_entry[1:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry3_pop_other_entry[10:3],  
        lsiq_entry3_pop_cur_entry,
        lsiq_entry3_pop_other_entry[2:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry4_pop_other_entry[10:4],  
        lsiq_entry4_pop_cur_entry,
        lsiq_entry4_pop_other_entry[3:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry5_pop_other_entry[10:5],  
        lsiq_entry5_pop_cur_entry,
        lsiq_entry5_pop_other_entry[4:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry6_pop_other_entry[10:6],  
        lsiq_entry6_pop_cur_entry,
        lsiq_entry6_pop_other_entry[5:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry7_pop_other_entry[10:7],  
        lsiq_entry7_pop_cur_entry,
        lsiq_entry7_pop_other_entry[6:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry8_pop_other_entry[10:8],  
        lsiq_entry8_pop_cur_entry,
        lsiq_entry8_pop_other_entry[7:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry9_pop_other_entry[10:9],  
        lsiq_entry9_pop_cur_entry,
        lsiq_entry9_pop_other_entry[8:0]}   = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry10_pop_other_entry[10],
        lsiq_entry10_pop_cur_entry,
        lsiq_entry10_pop_other_entry[9:0]}  = lsu_idu_lsiq_pop_entry[11:0];
assign {lsiq_entry11_pop_cur_entry,
        lsiq_entry11_pop_other_entry[10:0]} = lsu_idu_lsiq_pop_entry[11:0];

//-------------------entry spec fail signals---------------
//clear freeze and source rdy when launch fail
assign lsiq_entry_pipe3_frz_clr[11:0] = {12{ctrl_lsiq_rf_pipe3_lch_fail_vld}}
                                        & dp_lsiq_rf_pipe3_lch_entry[11:0];
assign lsiq_entry_pipe4_frz_clr[11:0] = {12{ctrl_lsiq_rf_pipe4_lch_fail_vld}}
                                        & dp_lsiq_rf_pipe4_lch_entry[11:0];
assign lsiq_entry_frz_clr[11:0]       = lsiq_entry_pipe3_frz_clr[11:0]
                                        | lsiq_entry_pipe4_frz_clr[11:0]
                                        | lsu_idu_wakeup[11:0];

assign lsiq_entry0_frz_clr  = lsiq_entry_frz_clr[0];
assign lsiq_entry1_frz_clr  = lsiq_entry_frz_clr[1];
assign lsiq_entry2_frz_clr  = lsiq_entry_frz_clr[2];
assign lsiq_entry3_frz_clr  = lsiq_entry_frz_clr[3];
assign lsiq_entry4_frz_clr  = lsiq_entry_frz_clr[4];
assign lsiq_entry5_frz_clr  = lsiq_entry_frz_clr[5];
assign lsiq_entry6_frz_clr  = lsiq_entry_frz_clr[6];
assign lsiq_entry7_frz_clr  = lsiq_entry_frz_clr[7];
assign lsiq_entry8_frz_clr  = lsiq_entry_frz_clr[8];
assign lsiq_entry9_frz_clr  = lsiq_entry_frz_clr[9];
assign lsiq_entry10_frz_clr = lsiq_entry_frz_clr[10];
assign lsiq_entry11_frz_clr = lsiq_entry_frz_clr[11];

assign lsiq_entry0_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[0]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[0]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry1_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[1]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[1]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry2_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[2]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[2]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry3_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[3]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[3]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry4_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[4]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[4]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry5_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[5]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[5]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry6_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[6]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[6]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry7_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[7]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[7]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry8_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[8]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[8]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry9_rdy_clr[2:0]  =
        {3{lsiq_entry_pipe3_frz_clr[9]}}  & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[9]}}  & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry10_rdy_clr[2:0] =
        {3{lsiq_entry_pipe3_frz_clr[10]}} & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[10]}} & dp_lsiq_rf_pipe4_rdy_clr[2:0];
assign lsiq_entry11_rdy_clr[2:0] =
        {3{lsiq_entry_pipe3_frz_clr[11]}} & dp_lsiq_rf_pipe3_rdy_clr[2:0]
      | {3{lsiq_entry_pipe4_frz_clr[11]}} & dp_lsiq_rf_pipe4_rdy_clr[2:0];

//------------------lsu bits set signals--------------------
assign lsiq_entry0_lq_full_set           = lsu_idu_lq_full[0];
assign lsiq_entry1_lq_full_set           = lsu_idu_lq_full[1];
assign lsiq_entry2_lq_full_set           = lsu_idu_lq_full[2];
assign lsiq_entry3_lq_full_set           = lsu_idu_lq_full[3];
assign lsiq_entry4_lq_full_set           = lsu_idu_lq_full[4];
assign lsiq_entry5_lq_full_set           = lsu_idu_lq_full[5];
assign lsiq_entry6_lq_full_set           = lsu_idu_lq_full[6];
assign lsiq_entry7_lq_full_set           = lsu_idu_lq_full[7];
assign lsiq_entry8_lq_full_set           = lsu_idu_lq_full[8];
assign lsiq_entry9_lq_full_set           = lsu_idu_lq_full[9];
assign lsiq_entry10_lq_full_set          = lsu_idu_lq_full[10];
assign lsiq_entry11_lq_full_set          = lsu_idu_lq_full[11];

assign lsiq_entry0_sq_full_set           = lsu_idu_sq_full[0];
assign lsiq_entry1_sq_full_set           = lsu_idu_sq_full[1];
assign lsiq_entry2_sq_full_set           = lsu_idu_sq_full[2];
assign lsiq_entry3_sq_full_set           = lsu_idu_sq_full[3];
assign lsiq_entry4_sq_full_set           = lsu_idu_sq_full[4];
assign lsiq_entry5_sq_full_set           = lsu_idu_sq_full[5];
assign lsiq_entry6_sq_full_set           = lsu_idu_sq_full[6];
assign lsiq_entry7_sq_full_set           = lsu_idu_sq_full[7];
assign lsiq_entry8_sq_full_set           = lsu_idu_sq_full[8];
assign lsiq_entry9_sq_full_set           = lsu_idu_sq_full[9];
assign lsiq_entry10_sq_full_set          = lsu_idu_sq_full[10];
assign lsiq_entry11_sq_full_set          = lsu_idu_sq_full[11];

assign lsiq_entry0_rb_full_set           = lsu_idu_rb_full[0];
assign lsiq_entry1_rb_full_set           = lsu_idu_rb_full[1];
assign lsiq_entry2_rb_full_set           = lsu_idu_rb_full[2];
assign lsiq_entry3_rb_full_set           = lsu_idu_rb_full[3];
assign lsiq_entry4_rb_full_set           = lsu_idu_rb_full[4];
assign lsiq_entry5_rb_full_set           = lsu_idu_rb_full[5];
assign lsiq_entry6_rb_full_set           = lsu_idu_rb_full[6];
assign lsiq_entry7_rb_full_set           = lsu_idu_rb_full[7];
assign lsiq_entry8_rb_full_set           = lsu_idu_rb_full[8];
assign lsiq_entry9_rb_full_set           = lsu_idu_rb_full[9];
assign lsiq_entry10_rb_full_set          = lsu_idu_rb_full[10];
assign lsiq_entry11_rb_full_set          = lsu_idu_rb_full[11];

assign lsiq_entry0_wait_old_set          = lsu_idu_wait_old[0];
assign lsiq_entry1_wait_old_set          = lsu_idu_wait_old[1];
assign lsiq_entry2_wait_old_set          = lsu_idu_wait_old[2];
assign lsiq_entry3_wait_old_set          = lsu_idu_wait_old[3];
assign lsiq_entry4_wait_old_set          = lsu_idu_wait_old[4];
assign lsiq_entry5_wait_old_set          = lsu_idu_wait_old[5];
assign lsiq_entry6_wait_old_set          = lsu_idu_wait_old[6];
assign lsiq_entry7_wait_old_set          = lsu_idu_wait_old[7];
assign lsiq_entry8_wait_old_set          = lsu_idu_wait_old[8];
assign lsiq_entry9_wait_old_set          = lsu_idu_wait_old[9];
assign lsiq_entry10_wait_old_set         = lsu_idu_wait_old[10];
assign lsiq_entry11_wait_old_set         = lsu_idu_wait_old[11];

assign lsiq_entry0_wait_fence_set          = lsu_idu_wait_fence[0];
assign lsiq_entry1_wait_fence_set          = lsu_idu_wait_fence[1];
assign lsiq_entry2_wait_fence_set          = lsu_idu_wait_fence[2];
assign lsiq_entry3_wait_fence_set          = lsu_idu_wait_fence[3];
assign lsiq_entry4_wait_fence_set          = lsu_idu_wait_fence[4];
assign lsiq_entry5_wait_fence_set          = lsu_idu_wait_fence[5];
assign lsiq_entry6_wait_fence_set          = lsu_idu_wait_fence[6];
assign lsiq_entry7_wait_fence_set          = lsu_idu_wait_fence[7];
assign lsiq_entry8_wait_fence_set          = lsu_idu_wait_fence[8];
assign lsiq_entry9_wait_fence_set          = lsu_idu_wait_fence[9];
assign lsiq_entry10_wait_fence_set         = lsu_idu_wait_fence[10];
assign lsiq_entry11_wait_fence_set         = lsu_idu_wait_fence[11];

assign lsiq_entry0_tlb_busy_set          = lsu_idu_tlb_busy[0];
assign lsiq_entry1_tlb_busy_set          = lsu_idu_tlb_busy[1];
assign lsiq_entry2_tlb_busy_set          = lsu_idu_tlb_busy[2];
assign lsiq_entry3_tlb_busy_set          = lsu_idu_tlb_busy[3];
assign lsiq_entry4_tlb_busy_set          = lsu_idu_tlb_busy[4];
assign lsiq_entry5_tlb_busy_set          = lsu_idu_tlb_busy[5];
assign lsiq_entry6_tlb_busy_set          = lsu_idu_tlb_busy[6];
assign lsiq_entry7_tlb_busy_set          = lsu_idu_tlb_busy[7];
assign lsiq_entry8_tlb_busy_set          = lsu_idu_tlb_busy[8];
assign lsiq_entry9_tlb_busy_set          = lsu_idu_tlb_busy[9];
assign lsiq_entry10_tlb_busy_set         = lsu_idu_tlb_busy[10];
assign lsiq_entry11_tlb_busy_set         = lsu_idu_tlb_busy[11];

assign lsiq_entry0_tlb_wakeup            = lsu_idu_tlb_wakeup[0];
assign lsiq_entry1_tlb_wakeup            = lsu_idu_tlb_wakeup[1];
assign lsiq_entry2_tlb_wakeup            = lsu_idu_tlb_wakeup[2];
assign lsiq_entry3_tlb_wakeup            = lsu_idu_tlb_wakeup[3];
assign lsiq_entry4_tlb_wakeup            = lsu_idu_tlb_wakeup[4];
assign lsiq_entry5_tlb_wakeup            = lsu_idu_tlb_wakeup[5];
assign lsiq_entry6_tlb_wakeup            = lsu_idu_tlb_wakeup[6];
assign lsiq_entry7_tlb_wakeup            = lsu_idu_tlb_wakeup[7];
assign lsiq_entry8_tlb_wakeup            = lsu_idu_tlb_wakeup[8];
assign lsiq_entry9_tlb_wakeup            = lsu_idu_tlb_wakeup[9];
assign lsiq_entry10_tlb_wakeup           = lsu_idu_tlb_wakeup[10];
assign lsiq_entry11_tlb_wakeup           = lsu_idu_tlb_wakeup[11];

assign lsiq_entry0_unalign_2nd_set       = lsu_idu_secd[0];
assign lsiq_entry1_unalign_2nd_set       = lsu_idu_secd[1];
assign lsiq_entry2_unalign_2nd_set       = lsu_idu_secd[2];
assign lsiq_entry3_unalign_2nd_set       = lsu_idu_secd[3];
assign lsiq_entry4_unalign_2nd_set       = lsu_idu_secd[4];
assign lsiq_entry5_unalign_2nd_set       = lsu_idu_secd[5];
assign lsiq_entry6_unalign_2nd_set       = lsu_idu_secd[6];
assign lsiq_entry7_unalign_2nd_set       = lsu_idu_secd[7];
assign lsiq_entry8_unalign_2nd_set       = lsu_idu_secd[8];
assign lsiq_entry9_unalign_2nd_set       = lsu_idu_secd[9];
assign lsiq_entry10_unalign_2nd_set      = lsu_idu_secd[10];
assign lsiq_entry11_unalign_2nd_set      = lsu_idu_secd[11];

assign lsiq_entry0_already_da_set        = lsu_idu_already_da[0];
assign lsiq_entry1_already_da_set        = lsu_idu_already_da[1];
assign lsiq_entry2_already_da_set        = lsu_idu_already_da[2];
assign lsiq_entry3_already_da_set        = lsu_idu_already_da[3];
assign lsiq_entry4_already_da_set        = lsu_idu_already_da[4];
assign lsiq_entry5_already_da_set        = lsu_idu_already_da[5];
assign lsiq_entry6_already_da_set        = lsu_idu_already_da[6];
assign lsiq_entry7_already_da_set        = lsu_idu_already_da[7];
assign lsiq_entry8_already_da_set        = lsu_idu_already_da[8];
assign lsiq_entry9_already_da_set        = lsu_idu_already_da[9];
assign lsiq_entry10_already_da_set       = lsu_idu_already_da[10];
assign lsiq_entry11_already_da_set       = lsu_idu_already_da[11];

assign lsiq_entry0_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[0];
assign lsiq_entry1_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[1];
assign lsiq_entry2_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[2];
assign lsiq_entry3_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[3];
assign lsiq_entry4_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[4];
assign lsiq_entry5_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[5];
assign lsiq_entry6_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[6];
assign lsiq_entry7_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[7];
assign lsiq_entry8_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[8];
assign lsiq_entry9_unalign_gateclk_en    = lsu_idu_unalign_gateclk_en[9];
assign lsiq_entry10_unalign_gateclk_en   = lsu_idu_unalign_gateclk_en[10];
assign lsiq_entry11_unalign_gateclk_en   = lsu_idu_unalign_gateclk_en[11];

assign lsiq_entry0_spec_fail_set         = lsu_idu_spec_fail[0];
assign lsiq_entry1_spec_fail_set         = lsu_idu_spec_fail[1];
assign lsiq_entry2_spec_fail_set         = lsu_idu_spec_fail[2];
assign lsiq_entry3_spec_fail_set         = lsu_idu_spec_fail[3];
assign lsiq_entry4_spec_fail_set         = lsu_idu_spec_fail[4];
assign lsiq_entry5_spec_fail_set         = lsu_idu_spec_fail[5];
assign lsiq_entry6_spec_fail_set         = lsu_idu_spec_fail[6];
assign lsiq_entry7_spec_fail_set         = lsu_idu_spec_fail[7];
assign lsiq_entry8_spec_fail_set         = lsu_idu_spec_fail[8];
assign lsiq_entry9_spec_fail_set         = lsu_idu_spec_fail[9];
assign lsiq_entry10_spec_fail_set        = lsu_idu_spec_fail[10];
assign lsiq_entry11_spec_fail_set        = lsu_idu_spec_fail[11];

assign lsiq_entry0_bkpta_data_set        = lsu_idu_bkpta_data[0];
assign lsiq_entry1_bkpta_data_set        = lsu_idu_bkpta_data[1];
assign lsiq_entry2_bkpta_data_set        = lsu_idu_bkpta_data[2];
assign lsiq_entry3_bkpta_data_set        = lsu_idu_bkpta_data[3];
assign lsiq_entry4_bkpta_data_set        = lsu_idu_bkpta_data[4];
assign lsiq_entry5_bkpta_data_set        = lsu_idu_bkpta_data[5];
assign lsiq_entry6_bkpta_data_set        = lsu_idu_bkpta_data[6];
assign lsiq_entry7_bkpta_data_set        = lsu_idu_bkpta_data[7];
assign lsiq_entry8_bkpta_data_set        = lsu_idu_bkpta_data[8];
assign lsiq_entry9_bkpta_data_set        = lsu_idu_bkpta_data[9];
assign lsiq_entry10_bkpta_data_set       = lsu_idu_bkpta_data[10];
assign lsiq_entry11_bkpta_data_set       = lsu_idu_bkpta_data[11];

assign lsiq_entry0_bkptb_data_set        = lsu_idu_bkptb_data[0];
assign lsiq_entry1_bkptb_data_set        = lsu_idu_bkptb_data[1];
assign lsiq_entry2_bkptb_data_set        = lsu_idu_bkptb_data[2];
assign lsiq_entry3_bkptb_data_set        = lsu_idu_bkptb_data[3];
assign lsiq_entry4_bkptb_data_set        = lsu_idu_bkptb_data[4];
assign lsiq_entry5_bkptb_data_set        = lsu_idu_bkptb_data[5];
assign lsiq_entry6_bkptb_data_set        = lsu_idu_bkptb_data[6];
assign lsiq_entry7_bkptb_data_set        = lsu_idu_bkptb_data[7];
assign lsiq_entry8_bkptb_data_set        = lsu_idu_bkptb_data[8];
assign lsiq_entry9_bkptb_data_set        = lsu_idu_bkptb_data[9];
assign lsiq_entry10_bkptb_data_set       = lsu_idu_bkptb_data[10];
assign lsiq_entry11_bkptb_data_set       = lsu_idu_bkptb_data[11];

//==========================================================
//             LSU Issue Queue Entry Instance
//==========================================================
// &ConnRule(s/^x_/lsiq_entry0_/); @1398
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry0"); @1399
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry0 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry0_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry0_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry0_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry0_bar                        ),
  .x_bar_type                              (lsiq_entry0_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry0_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry0_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry0_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry0_create_agevec_all          ),
  .x_create_data                           (lsiq_entry0_create_data                ),
  .x_create_dp_en                          (lsiq_entry0_create_dp_en               ),
  .x_create_en                             (lsiq_entry0_create_en                  ),
  .x_create_frz                            (lsiq_entry0_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry0_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry0_frz                        ),
  .x_frz_clr                               (lsiq_entry0_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry0_frz_vld                    ),
  .x_issue_en                              (lsiq_entry0_issue_en                   ),
  .x_load                                  (lsiq_entry0_load                       ),
  .x_lq_full                               (lsiq_entry0_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry0_lq_full_set                ),
  .x_no_spec                               (lsiq_entry0_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry0_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry0_other_aft_store            ),
  .x_other_bar                             (lsiq_entry0_other_bar                  ),
  .x_other_frz                             (lsiq_entry0_other_frz                  ),
  .x_other_load                            (lsiq_entry0_other_load                 ),
  .x_other_no_spec                         (lsiq_entry0_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry0_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry0_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry0_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry0_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry0_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry0_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry0_rb_full_set                ),
  .x_rdy                                   (lsiq_entry0_rdy                        ),
  .x_rdy_clr                               (lsiq_entry0_rdy_clr                    ),
  .x_read_data                             (lsiq_entry0_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry0_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry0_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry0_sq_full_set                ),
  .x_store                                 (lsiq_entry0_store                      ),
  .x_tlb_busy                              (lsiq_entry0_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry0_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry0_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry0_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry0_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry0_vld                        ),
  .x_vld_with_frz                          (lsiq_entry0_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry0_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry0_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry0_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry0_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry1_/); @1401
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry1"); @1402
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry1 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry1_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry1_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry1_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry1_bar                        ),
  .x_bar_type                              (lsiq_entry1_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry1_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry1_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry1_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry1_create_agevec_all          ),
  .x_create_data                           (lsiq_entry1_create_data                ),
  .x_create_dp_en                          (lsiq_entry1_create_dp_en               ),
  .x_create_en                             (lsiq_entry1_create_en                  ),
  .x_create_frz                            (lsiq_entry1_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry1_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry1_frz                        ),
  .x_frz_clr                               (lsiq_entry1_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry1_frz_vld                    ),
  .x_issue_en                              (lsiq_entry1_issue_en                   ),
  .x_load                                  (lsiq_entry1_load                       ),
  .x_lq_full                               (lsiq_entry1_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry1_lq_full_set                ),
  .x_no_spec                               (lsiq_entry1_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry1_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry1_other_aft_store            ),
  .x_other_bar                             (lsiq_entry1_other_bar                  ),
  .x_other_frz                             (lsiq_entry1_other_frz                  ),
  .x_other_load                            (lsiq_entry1_other_load                 ),
  .x_other_no_spec                         (lsiq_entry1_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry1_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry1_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry1_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry1_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry1_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry1_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry1_rb_full_set                ),
  .x_rdy                                   (lsiq_entry1_rdy                        ),
  .x_rdy_clr                               (lsiq_entry1_rdy_clr                    ),
  .x_read_data                             (lsiq_entry1_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry1_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry1_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry1_sq_full_set                ),
  .x_store                                 (lsiq_entry1_store                      ),
  .x_tlb_busy                              (lsiq_entry1_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry1_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry1_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry1_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry1_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry1_vld                        ),
  .x_vld_with_frz                          (lsiq_entry1_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry1_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry1_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry1_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry1_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry2_/); @1404
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry2"); @1405
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry2 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry2_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry2_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry2_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry2_bar                        ),
  .x_bar_type                              (lsiq_entry2_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry2_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry2_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry2_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry2_create_agevec_all          ),
  .x_create_data                           (lsiq_entry2_create_data                ),
  .x_create_dp_en                          (lsiq_entry2_create_dp_en               ),
  .x_create_en                             (lsiq_entry2_create_en                  ),
  .x_create_frz                            (lsiq_entry2_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry2_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry2_frz                        ),
  .x_frz_clr                               (lsiq_entry2_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry2_frz_vld                    ),
  .x_issue_en                              (lsiq_entry2_issue_en                   ),
  .x_load                                  (lsiq_entry2_load                       ),
  .x_lq_full                               (lsiq_entry2_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry2_lq_full_set                ),
  .x_no_spec                               (lsiq_entry2_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry2_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry2_other_aft_store            ),
  .x_other_bar                             (lsiq_entry2_other_bar                  ),
  .x_other_frz                             (lsiq_entry2_other_frz                  ),
  .x_other_load                            (lsiq_entry2_other_load                 ),
  .x_other_no_spec                         (lsiq_entry2_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry2_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry2_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry2_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry2_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry2_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry2_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry2_rb_full_set                ),
  .x_rdy                                   (lsiq_entry2_rdy                        ),
  .x_rdy_clr                               (lsiq_entry2_rdy_clr                    ),
  .x_read_data                             (lsiq_entry2_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry2_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry2_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry2_sq_full_set                ),
  .x_store                                 (lsiq_entry2_store                      ),
  .x_tlb_busy                              (lsiq_entry2_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry2_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry2_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry2_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry2_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry2_vld                        ),
  .x_vld_with_frz                          (lsiq_entry2_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry2_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry2_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry2_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry2_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry3_/); @1407
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry3"); @1408
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry3 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry3_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry3_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry3_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry3_bar                        ),
  .x_bar_type                              (lsiq_entry3_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry3_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry3_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry3_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry3_create_agevec_all          ),
  .x_create_data                           (lsiq_entry3_create_data                ),
  .x_create_dp_en                          (lsiq_entry3_create_dp_en               ),
  .x_create_en                             (lsiq_entry3_create_en                  ),
  .x_create_frz                            (lsiq_entry3_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry3_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry3_frz                        ),
  .x_frz_clr                               (lsiq_entry3_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry3_frz_vld                    ),
  .x_issue_en                              (lsiq_entry3_issue_en                   ),
  .x_load                                  (lsiq_entry3_load                       ),
  .x_lq_full                               (lsiq_entry3_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry3_lq_full_set                ),
  .x_no_spec                               (lsiq_entry3_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry3_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry3_other_aft_store            ),
  .x_other_bar                             (lsiq_entry3_other_bar                  ),
  .x_other_frz                             (lsiq_entry3_other_frz                  ),
  .x_other_load                            (lsiq_entry3_other_load                 ),
  .x_other_no_spec                         (lsiq_entry3_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry3_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry3_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry3_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry3_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry3_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry3_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry3_rb_full_set                ),
  .x_rdy                                   (lsiq_entry3_rdy                        ),
  .x_rdy_clr                               (lsiq_entry3_rdy_clr                    ),
  .x_read_data                             (lsiq_entry3_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry3_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry3_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry3_sq_full_set                ),
  .x_store                                 (lsiq_entry3_store                      ),
  .x_tlb_busy                              (lsiq_entry3_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry3_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry3_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry3_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry3_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry3_vld                        ),
  .x_vld_with_frz                          (lsiq_entry3_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry3_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry3_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry3_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry3_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry4_/); @1410
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry4"); @1411
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry4 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry4_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry4_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry4_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry4_bar                        ),
  .x_bar_type                              (lsiq_entry4_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry4_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry4_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry4_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry4_create_agevec_all          ),
  .x_create_data                           (lsiq_entry4_create_data                ),
  .x_create_dp_en                          (lsiq_entry4_create_dp_en               ),
  .x_create_en                             (lsiq_entry4_create_en                  ),
  .x_create_frz                            (lsiq_entry4_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry4_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry4_frz                        ),
  .x_frz_clr                               (lsiq_entry4_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry4_frz_vld                    ),
  .x_issue_en                              (lsiq_entry4_issue_en                   ),
  .x_load                                  (lsiq_entry4_load                       ),
  .x_lq_full                               (lsiq_entry4_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry4_lq_full_set                ),
  .x_no_spec                               (lsiq_entry4_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry4_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry4_other_aft_store            ),
  .x_other_bar                             (lsiq_entry4_other_bar                  ),
  .x_other_frz                             (lsiq_entry4_other_frz                  ),
  .x_other_load                            (lsiq_entry4_other_load                 ),
  .x_other_no_spec                         (lsiq_entry4_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry4_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry4_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry4_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry4_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry4_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry4_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry4_rb_full_set                ),
  .x_rdy                                   (lsiq_entry4_rdy                        ),
  .x_rdy_clr                               (lsiq_entry4_rdy_clr                    ),
  .x_read_data                             (lsiq_entry4_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry4_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry4_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry4_sq_full_set                ),
  .x_store                                 (lsiq_entry4_store                      ),
  .x_tlb_busy                              (lsiq_entry4_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry4_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry4_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry4_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry4_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry4_vld                        ),
  .x_vld_with_frz                          (lsiq_entry4_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry4_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry4_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry4_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry4_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry5_/); @1413
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry5"); @1414
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry5 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry5_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry5_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry5_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry5_bar                        ),
  .x_bar_type                              (lsiq_entry5_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry5_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry5_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry5_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry5_create_agevec_all          ),
  .x_create_data                           (lsiq_entry5_create_data                ),
  .x_create_dp_en                          (lsiq_entry5_create_dp_en               ),
  .x_create_en                             (lsiq_entry5_create_en                  ),
  .x_create_frz                            (lsiq_entry5_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry5_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry5_frz                        ),
  .x_frz_clr                               (lsiq_entry5_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry5_frz_vld                    ),
  .x_issue_en                              (lsiq_entry5_issue_en                   ),
  .x_load                                  (lsiq_entry5_load                       ),
  .x_lq_full                               (lsiq_entry5_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry5_lq_full_set                ),
  .x_no_spec                               (lsiq_entry5_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry5_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry5_other_aft_store            ),
  .x_other_bar                             (lsiq_entry5_other_bar                  ),
  .x_other_frz                             (lsiq_entry5_other_frz                  ),
  .x_other_load                            (lsiq_entry5_other_load                 ),
  .x_other_no_spec                         (lsiq_entry5_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry5_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry5_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry5_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry5_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry5_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry5_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry5_rb_full_set                ),
  .x_rdy                                   (lsiq_entry5_rdy                        ),
  .x_rdy_clr                               (lsiq_entry5_rdy_clr                    ),
  .x_read_data                             (lsiq_entry5_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry5_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry5_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry5_sq_full_set                ),
  .x_store                                 (lsiq_entry5_store                      ),
  .x_tlb_busy                              (lsiq_entry5_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry5_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry5_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry5_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry5_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry5_vld                        ),
  .x_vld_with_frz                          (lsiq_entry5_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry5_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry5_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry5_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry5_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry6_/); @1416
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry6"); @1417
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry6 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry6_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry6_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry6_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry6_bar                        ),
  .x_bar_type                              (lsiq_entry6_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry6_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry6_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry6_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry6_create_agevec_all          ),
  .x_create_data                           (lsiq_entry6_create_data                ),
  .x_create_dp_en                          (lsiq_entry6_create_dp_en               ),
  .x_create_en                             (lsiq_entry6_create_en                  ),
  .x_create_frz                            (lsiq_entry6_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry6_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry6_frz                        ),
  .x_frz_clr                               (lsiq_entry6_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry6_frz_vld                    ),
  .x_issue_en                              (lsiq_entry6_issue_en                   ),
  .x_load                                  (lsiq_entry6_load                       ),
  .x_lq_full                               (lsiq_entry6_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry6_lq_full_set                ),
  .x_no_spec                               (lsiq_entry6_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry6_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry6_other_aft_store            ),
  .x_other_bar                             (lsiq_entry6_other_bar                  ),
  .x_other_frz                             (lsiq_entry6_other_frz                  ),
  .x_other_load                            (lsiq_entry6_other_load                 ),
  .x_other_no_spec                         (lsiq_entry6_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry6_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry6_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry6_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry6_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry6_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry6_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry6_rb_full_set                ),
  .x_rdy                                   (lsiq_entry6_rdy                        ),
  .x_rdy_clr                               (lsiq_entry6_rdy_clr                    ),
  .x_read_data                             (lsiq_entry6_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry6_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry6_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry6_sq_full_set                ),
  .x_store                                 (lsiq_entry6_store                      ),
  .x_tlb_busy                              (lsiq_entry6_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry6_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry6_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry6_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry6_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry6_vld                        ),
  .x_vld_with_frz                          (lsiq_entry6_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry6_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry6_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry6_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry6_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry7_/); @1419
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry7"); @1420
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry7 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry7_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry7_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry7_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry7_bar                        ),
  .x_bar_type                              (lsiq_entry7_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry7_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry7_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry7_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry7_create_agevec_all          ),
  .x_create_data                           (lsiq_entry7_create_data                ),
  .x_create_dp_en                          (lsiq_entry7_create_dp_en               ),
  .x_create_en                             (lsiq_entry7_create_en                  ),
  .x_create_frz                            (lsiq_entry7_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry7_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry7_frz                        ),
  .x_frz_clr                               (lsiq_entry7_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry7_frz_vld                    ),
  .x_issue_en                              (lsiq_entry7_issue_en                   ),
  .x_load                                  (lsiq_entry7_load                       ),
  .x_lq_full                               (lsiq_entry7_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry7_lq_full_set                ),
  .x_no_spec                               (lsiq_entry7_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry7_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry7_other_aft_store            ),
  .x_other_bar                             (lsiq_entry7_other_bar                  ),
  .x_other_frz                             (lsiq_entry7_other_frz                  ),
  .x_other_load                            (lsiq_entry7_other_load                 ),
  .x_other_no_spec                         (lsiq_entry7_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry7_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry7_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry7_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry7_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry7_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry7_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry7_rb_full_set                ),
  .x_rdy                                   (lsiq_entry7_rdy                        ),
  .x_rdy_clr                               (lsiq_entry7_rdy_clr                    ),
  .x_read_data                             (lsiq_entry7_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry7_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry7_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry7_sq_full_set                ),
  .x_store                                 (lsiq_entry7_store                      ),
  .x_tlb_busy                              (lsiq_entry7_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry7_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry7_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry7_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry7_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry7_vld                        ),
  .x_vld_with_frz                          (lsiq_entry7_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry7_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry7_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry7_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry7_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry8_/); @1422
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry8"); @1423
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry8 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry8_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry8_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry8_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry8_bar                        ),
  .x_bar_type                              (lsiq_entry8_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry8_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry8_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry8_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry8_create_agevec_all          ),
  .x_create_data                           (lsiq_entry8_create_data                ),
  .x_create_dp_en                          (lsiq_entry8_create_dp_en               ),
  .x_create_en                             (lsiq_entry8_create_en                  ),
  .x_create_frz                            (lsiq_entry8_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry8_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry8_frz                        ),
  .x_frz_clr                               (lsiq_entry8_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry8_frz_vld                    ),
  .x_issue_en                              (lsiq_entry8_issue_en                   ),
  .x_load                                  (lsiq_entry8_load                       ),
  .x_lq_full                               (lsiq_entry8_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry8_lq_full_set                ),
  .x_no_spec                               (lsiq_entry8_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry8_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry8_other_aft_store            ),
  .x_other_bar                             (lsiq_entry8_other_bar                  ),
  .x_other_frz                             (lsiq_entry8_other_frz                  ),
  .x_other_load                            (lsiq_entry8_other_load                 ),
  .x_other_no_spec                         (lsiq_entry8_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry8_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry8_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry8_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry8_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry8_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry8_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry8_rb_full_set                ),
  .x_rdy                                   (lsiq_entry8_rdy                        ),
  .x_rdy_clr                               (lsiq_entry8_rdy_clr                    ),
  .x_read_data                             (lsiq_entry8_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry8_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry8_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry8_sq_full_set                ),
  .x_store                                 (lsiq_entry8_store                      ),
  .x_tlb_busy                              (lsiq_entry8_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry8_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry8_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry8_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry8_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry8_vld                        ),
  .x_vld_with_frz                          (lsiq_entry8_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry8_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry8_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry8_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry8_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry9_/); @1425
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry9"); @1426
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry9 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry9_already_da_set             ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry9_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry9_alu1_reg_fwd_vld           ),
  .x_bar                                   (lsiq_entry9_bar                        ),
  .x_bar_type                              (lsiq_entry9_bar_type                   ),
  .x_bkpta_data_set                        (lsiq_entry9_bkpta_data_set             ),
  .x_bkptb_data_set                        (lsiq_entry9_bkptb_data_set             ),
  .x_create_agevec                         (lsiq_entry9_create_agevec              ),
  .x_create_agevec_all                     (lsiq_entry9_create_agevec_all          ),
  .x_create_data                           (lsiq_entry9_create_data                ),
  .x_create_dp_en                          (lsiq_entry9_create_dp_en               ),
  .x_create_en                             (lsiq_entry9_create_en                  ),
  .x_create_frz                            (lsiq_entry9_create_frz                 ),
  .x_create_gateclk_en                     (lsiq_entry9_create_gateclk_en          ),
  .x_frz                                   (lsiq_entry9_frz                        ),
  .x_frz_clr                               (lsiq_entry9_frz_clr                    ),
  .x_frz_vld                               (lsiq_entry9_frz_vld                    ),
  .x_issue_en                              (lsiq_entry9_issue_en                   ),
  .x_load                                  (lsiq_entry9_load                       ),
  .x_lq_full                               (lsiq_entry9_lq_full                    ),
  .x_lq_full_set                           (lsiq_entry9_lq_full_set                ),
  .x_no_spec                               (lsiq_entry9_no_spec                    ),
  .x_other_aft_load                        (lsiq_entry9_other_aft_load             ),
  .x_other_aft_store                       (lsiq_entry9_other_aft_store            ),
  .x_other_bar                             (lsiq_entry9_other_bar                  ),
  .x_other_frz                             (lsiq_entry9_other_frz                  ),
  .x_other_load                            (lsiq_entry9_other_load                 ),
  .x_other_no_spec                         (lsiq_entry9_other_no_spec              ),
  .x_other_raw_rdy                         (lsiq_entry9_other_raw_rdy              ),
  .x_other_store                           (lsiq_entry9_other_store                ),
  .x_pop_cur_entry                         (lsiq_entry9_pop_cur_entry              ),
  .x_pop_other_entry                       (lsiq_entry9_pop_other_entry            ),
  .x_raw_rdy                               (lsiq_entry9_raw_rdy                    ),
  .x_rb_full                               (lsiq_entry9_rb_full                    ),
  .x_rb_full_set                           (lsiq_entry9_rb_full_set                ),
  .x_rdy                                   (lsiq_entry9_rdy                        ),
  .x_rdy_clr                               (lsiq_entry9_rdy_clr                    ),
  .x_read_data                             (lsiq_entry9_read_data                  ),
  .x_spec_fail_set                         (lsiq_entry9_spec_fail_set              ),
  .x_sq_full                               (lsiq_entry9_sq_full                    ),
  .x_sq_full_set                           (lsiq_entry9_sq_full_set                ),
  .x_store                                 (lsiq_entry9_store                      ),
  .x_tlb_busy                              (lsiq_entry9_tlb_busy                   ),
  .x_tlb_busy_set                          (lsiq_entry9_tlb_busy_set               ),
  .x_tlb_wakeup                            (lsiq_entry9_tlb_wakeup                 ),
  .x_unalign_2nd_set                       (lsiq_entry9_unalign_2nd_set            ),
  .x_unalign_gateclk_en                    (lsiq_entry9_unalign_gateclk_en         ),
  .x_vld                                   (lsiq_entry9_vld                        ),
  .x_vld_with_frz                          (lsiq_entry9_vld_with_frz               ),
  .x_wait_fence                            (lsiq_entry9_wait_fence                 ),
  .x_wait_fence_set                        (lsiq_entry9_wait_fence_set             ),
  .x_wait_old                              (lsiq_entry9_wait_old                   ),
  .x_wait_old_set                          (lsiq_entry9_wait_old_set               )
);


// &ConnRule(s/^x_/lsiq_entry10_/); @1428
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry10"); @1429
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry10 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry10_already_da_set            ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry10_alu0_reg_fwd_vld          ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry10_alu1_reg_fwd_vld          ),
  .x_bar                                   (lsiq_entry10_bar                       ),
  .x_bar_type                              (lsiq_entry10_bar_type                  ),
  .x_bkpta_data_set                        (lsiq_entry10_bkpta_data_set            ),
  .x_bkptb_data_set                        (lsiq_entry10_bkptb_data_set            ),
  .x_create_agevec                         (lsiq_entry10_create_agevec             ),
  .x_create_agevec_all                     (lsiq_entry10_create_agevec_all         ),
  .x_create_data                           (lsiq_entry10_create_data               ),
  .x_create_dp_en                          (lsiq_entry10_create_dp_en              ),
  .x_create_en                             (lsiq_entry10_create_en                 ),
  .x_create_frz                            (lsiq_entry10_create_frz                ),
  .x_create_gateclk_en                     (lsiq_entry10_create_gateclk_en         ),
  .x_frz                                   (lsiq_entry10_frz                       ),
  .x_frz_clr                               (lsiq_entry10_frz_clr                   ),
  .x_frz_vld                               (lsiq_entry10_frz_vld                   ),
  .x_issue_en                              (lsiq_entry10_issue_en                  ),
  .x_load                                  (lsiq_entry10_load                      ),
  .x_lq_full                               (lsiq_entry10_lq_full                   ),
  .x_lq_full_set                           (lsiq_entry10_lq_full_set               ),
  .x_no_spec                               (lsiq_entry10_no_spec                   ),
  .x_other_aft_load                        (lsiq_entry10_other_aft_load            ),
  .x_other_aft_store                       (lsiq_entry10_other_aft_store           ),
  .x_other_bar                             (lsiq_entry10_other_bar                 ),
  .x_other_frz                             (lsiq_entry10_other_frz                 ),
  .x_other_load                            (lsiq_entry10_other_load                ),
  .x_other_no_spec                         (lsiq_entry10_other_no_spec             ),
  .x_other_raw_rdy                         (lsiq_entry10_other_raw_rdy             ),
  .x_other_store                           (lsiq_entry10_other_store               ),
  .x_pop_cur_entry                         (lsiq_entry10_pop_cur_entry             ),
  .x_pop_other_entry                       (lsiq_entry10_pop_other_entry           ),
  .x_raw_rdy                               (lsiq_entry10_raw_rdy                   ),
  .x_rb_full                               (lsiq_entry10_rb_full                   ),
  .x_rb_full_set                           (lsiq_entry10_rb_full_set               ),
  .x_rdy                                   (lsiq_entry10_rdy                       ),
  .x_rdy_clr                               (lsiq_entry10_rdy_clr                   ),
  .x_read_data                             (lsiq_entry10_read_data                 ),
  .x_spec_fail_set                         (lsiq_entry10_spec_fail_set             ),
  .x_sq_full                               (lsiq_entry10_sq_full                   ),
  .x_sq_full_set                           (lsiq_entry10_sq_full_set               ),
  .x_store                                 (lsiq_entry10_store                     ),
  .x_tlb_busy                              (lsiq_entry10_tlb_busy                  ),
  .x_tlb_busy_set                          (lsiq_entry10_tlb_busy_set              ),
  .x_tlb_wakeup                            (lsiq_entry10_tlb_wakeup                ),
  .x_unalign_2nd_set                       (lsiq_entry10_unalign_2nd_set           ),
  .x_unalign_gateclk_en                    (lsiq_entry10_unalign_gateclk_en        ),
  .x_vld                                   (lsiq_entry10_vld                       ),
  .x_vld_with_frz                          (lsiq_entry10_vld_with_frz              ),
  .x_wait_fence                            (lsiq_entry10_wait_fence                ),
  .x_wait_fence_set                        (lsiq_entry10_wait_fence_set            ),
  .x_wait_old                              (lsiq_entry10_wait_old                  ),
  .x_wait_old_set                          (lsiq_entry10_wait_old_set              )
);


// &ConnRule(s/^x_/lsiq_entry11_/); @1431
// &Instance("ct_idu_is_lsiq_entry", "x_ct_idu_is_lsiq_entry11"); @1432
ct_idu_is_lsiq_entry  x_ct_idu_is_lsiq_entry11 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
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
  .lq_full_clk                             (lq_full_clk                            ),
  .lsiq_bar_mode                           (lsiq_bar_mode                          ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dupx             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rb_full_clk                             (rb_full_clk                            ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .sq_full_clk                             (sq_full_clk                            ),
  .tlb_busy_clk                            (tlb_busy_clk                           ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .wait_fence_clk                          (wait_fence_clk                         ),
  .wait_old_clk                            (wait_old_clk                           ),
  .x_already_da_set                        (lsiq_entry11_already_da_set            ),
  .x_alu0_reg_fwd_vld                      (lsiq_entry11_alu0_reg_fwd_vld          ),
  .x_alu1_reg_fwd_vld                      (lsiq_entry11_alu1_reg_fwd_vld          ),
  .x_bar                                   (lsiq_entry11_bar                       ),
  .x_bar_type                              (lsiq_entry11_bar_type                  ),
  .x_bkpta_data_set                        (lsiq_entry11_bkpta_data_set            ),
  .x_bkptb_data_set                        (lsiq_entry11_bkptb_data_set            ),
  .x_create_agevec                         (lsiq_entry11_create_agevec             ),
  .x_create_agevec_all                     (lsiq_entry11_create_agevec_all         ),
  .x_create_data                           (lsiq_entry11_create_data               ),
  .x_create_dp_en                          (lsiq_entry11_create_dp_en              ),
  .x_create_en                             (lsiq_entry11_create_en                 ),
  .x_create_frz                            (lsiq_entry11_create_frz                ),
  .x_create_gateclk_en                     (lsiq_entry11_create_gateclk_en         ),
  .x_frz                                   (lsiq_entry11_frz                       ),
  .x_frz_clr                               (lsiq_entry11_frz_clr                   ),
  .x_frz_vld                               (lsiq_entry11_frz_vld                   ),
  .x_issue_en                              (lsiq_entry11_issue_en                  ),
  .x_load                                  (lsiq_entry11_load                      ),
  .x_lq_full                               (lsiq_entry11_lq_full                   ),
  .x_lq_full_set                           (lsiq_entry11_lq_full_set               ),
  .x_no_spec                               (lsiq_entry11_no_spec                   ),
  .x_other_aft_load                        (lsiq_entry11_other_aft_load            ),
  .x_other_aft_store                       (lsiq_entry11_other_aft_store           ),
  .x_other_bar                             (lsiq_entry11_other_bar                 ),
  .x_other_frz                             (lsiq_entry11_other_frz                 ),
  .x_other_load                            (lsiq_entry11_other_load                ),
  .x_other_no_spec                         (lsiq_entry11_other_no_spec             ),
  .x_other_raw_rdy                         (lsiq_entry11_other_raw_rdy             ),
  .x_other_store                           (lsiq_entry11_other_store               ),
  .x_pop_cur_entry                         (lsiq_entry11_pop_cur_entry             ),
  .x_pop_other_entry                       (lsiq_entry11_pop_other_entry           ),
  .x_raw_rdy                               (lsiq_entry11_raw_rdy                   ),
  .x_rb_full                               (lsiq_entry11_rb_full                   ),
  .x_rb_full_set                           (lsiq_entry11_rb_full_set               ),
  .x_rdy                                   (lsiq_entry11_rdy                       ),
  .x_rdy_clr                               (lsiq_entry11_rdy_clr                   ),
  .x_read_data                             (lsiq_entry11_read_data                 ),
  .x_spec_fail_set                         (lsiq_entry11_spec_fail_set             ),
  .x_sq_full                               (lsiq_entry11_sq_full                   ),
  .x_sq_full_set                           (lsiq_entry11_sq_full_set               ),
  .x_store                                 (lsiq_entry11_store                     ),
  .x_tlb_busy                              (lsiq_entry11_tlb_busy                  ),
  .x_tlb_busy_set                          (lsiq_entry11_tlb_busy_set              ),
  .x_tlb_wakeup                            (lsiq_entry11_tlb_wakeup                ),
  .x_unalign_2nd_set                       (lsiq_entry11_unalign_2nd_set           ),
  .x_unalign_gateclk_en                    (lsiq_entry11_unalign_gateclk_en        ),
  .x_vld                                   (lsiq_entry11_vld                       ),
  .x_vld_with_frz                          (lsiq_entry11_vld_with_frz              ),
  .x_wait_fence                            (lsiq_entry11_wait_fence                ),
  .x_wait_fence_set                        (lsiq_entry11_wait_fence_set            ),
  .x_wait_old                              (lsiq_entry11_wait_old                  ),
  .x_wait_old_set                          (lsiq_entry11_wait_old_set              )
);


// &ModuleEnd; @1434
endmodule


