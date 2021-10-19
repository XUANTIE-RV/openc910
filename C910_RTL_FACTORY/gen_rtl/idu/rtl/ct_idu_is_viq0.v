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
module ct_idu_is_viq0(
  cp0_idu_icg_en,
  cp0_idu_iq_bypass_disable,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_is_dis_viq0_create0_sel,
  ctrl_dp_is_dis_viq0_create1_sel,
  ctrl_dp_is_dis_viq1_create0_sel,
  ctrl_dp_is_dis_viq1_create1_sel,
  ctrl_viq0_create0_dp_en,
  ctrl_viq0_create0_en,
  ctrl_viq0_create0_gateclk_en,
  ctrl_viq0_create1_dp_en,
  ctrl_viq0_create1_en,
  ctrl_viq0_create1_gateclk_en,
  ctrl_viq0_rf_lch_fail_vld,
  ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld,
  ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld,
  ctrl_viq0_rf_pop_dlb_vld,
  ctrl_viq0_rf_pop_vld,
  ctrl_viq0_stall,
  ctrl_viq1_create0_dp_en,
  ctrl_viq1_create0_gateclk_en,
  ctrl_viq1_create1_dp_en,
  ctrl_viq1_create1_gateclk_en,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dupx,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dupx,
  dp_viq0_bypass_data,
  dp_viq0_create0_data,
  dp_viq0_create1_data,
  dp_viq0_create_srcv0_rdy_for_bypass,
  dp_viq0_create_srcv1_rdy_for_bypass,
  dp_viq0_create_srcv2_rdy_for_bypass,
  dp_viq0_create_srcvm_rdy_for_bypass,
  dp_viq0_create_vdiv,
  dp_viq0_rf_lch_entry,
  dp_viq0_rf_rdy_clr,
  dp_viq_dis_inst0_srcv2_vreg,
  dp_viq_dis_inst1_srcv2_vreg,
  dp_viq_dis_inst2_srcv2_vreg,
  dp_viq_dis_inst3_srcv2_vreg,
  dp_xx_rf_pipe6_dst_vreg_dupx,
  dp_xx_rf_pipe7_dst_vreg_dupx,
  forever_cpuclk,
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_yy_xx_flush,
  vfpu_idu_ex1_pipe6_data_vld_dupx,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe6_vreg_dupx,
  vfpu_idu_ex1_pipe7_data_vld_dupx,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex1_pipe7_vreg_dupx,
  vfpu_idu_ex2_pipe6_data_vld_dupx,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe6_vreg_dupx,
  vfpu_idu_ex2_pipe7_data_vld_dupx,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dupx,
  vfpu_idu_ex2_pipe7_vreg_dupx,
  vfpu_idu_ex3_pipe6_data_vld_dupx,
  vfpu_idu_ex3_pipe6_vreg_dupx,
  vfpu_idu_ex3_pipe7_data_vld_dupx,
  vfpu_idu_ex3_pipe7_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx,
  vfpu_idu_vdiv_busy,
  viq0_ctrl_1_left_updt,
  viq0_ctrl_empty,
  viq0_ctrl_entry_cnt_updt_val,
  viq0_ctrl_entry_cnt_updt_vld,
  viq0_ctrl_full,
  viq0_ctrl_full_updt,
  viq0_ctrl_full_updt_clk_en,
  viq0_dp_issue_entry,
  viq0_dp_issue_read_data,
  viq0_top_viq0_entry_cnt,
  viq0_viq_create0_entry,
  viq0_viq_create1_entry,
  viq0_xx_gateclk_issue_en,
  viq0_xx_issue_en,
  viq1_viq_create0_entry,
  viq1_viq_create1_entry
);

// &Ports; @28
input            cp0_idu_icg_en;                       
input            cp0_idu_iq_bypass_disable;            
input            cp0_yy_clk_en;                        
input            cpurst_b;                             
input   [1  :0]  ctrl_dp_is_dis_viq0_create0_sel;      
input   [1  :0]  ctrl_dp_is_dis_viq0_create1_sel;      
input   [1  :0]  ctrl_dp_is_dis_viq1_create0_sel;      
input   [1  :0]  ctrl_dp_is_dis_viq1_create1_sel;      
input            ctrl_viq0_create0_dp_en;              
input            ctrl_viq0_create0_en;                 
input            ctrl_viq0_create0_gateclk_en;         
input            ctrl_viq0_create1_dp_en;              
input            ctrl_viq0_create1_en;                 
input            ctrl_viq0_create1_gateclk_en;         
input            ctrl_viq0_rf_lch_fail_vld;            
input   [7  :0]  ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld; 
input   [7  :0]  ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld; 
input            ctrl_viq0_rf_pop_dlb_vld;             
input            ctrl_viq0_rf_pop_vld;                 
input            ctrl_viq0_stall;                      
input            ctrl_viq1_create0_dp_en;              
input            ctrl_viq1_create0_gateclk_en;         
input            ctrl_viq1_create1_dp_en;              
input            ctrl_viq1_create1_gateclk_en;         
input            ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;   
input            ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;   
input   [150:0]  dp_viq0_bypass_data;                  
input   [150:0]  dp_viq0_create0_data;                 
input   [150:0]  dp_viq0_create1_data;                 
input            dp_viq0_create_srcv0_rdy_for_bypass;  
input            dp_viq0_create_srcv1_rdy_for_bypass;  
input            dp_viq0_create_srcv2_rdy_for_bypass;  
input            dp_viq0_create_srcvm_rdy_for_bypass;  
input            dp_viq0_create_vdiv;                  
input   [7  :0]  dp_viq0_rf_lch_entry;                 
input   [3  :0]  dp_viq0_rf_rdy_clr;                   
input   [6  :0]  dp_viq_dis_inst0_srcv2_vreg;          
input   [6  :0]  dp_viq_dis_inst1_srcv2_vreg;          
input   [6  :0]  dp_viq_dis_inst2_srcv2_vreg;          
input   [6  :0]  dp_viq_dis_inst3_srcv2_vreg;          
input   [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;         
input   [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;         
input            forever_cpuclk;                       
input            lsu_idu_ag_pipe3_vload_inst_vld;      
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;           
input            lsu_idu_dc_pipe3_vload_fwd_inst_vld;  
input            lsu_idu_dc_pipe3_vload_inst_vld_dupx; 
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;           
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;        
input            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;    
input            pad_yy_icg_scan_en;                   
input            rtu_idu_flush_fe;                     
input            rtu_idu_flush_is;                     
input            rtu_yy_xx_flush;                      
input            vfpu_idu_ex1_pipe6_data_vld_dupx;     
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;         
input            vfpu_idu_ex1_pipe7_data_vld_dupx;     
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;         
input            vfpu_idu_ex2_pipe6_data_vld_dupx;     
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;         
input            vfpu_idu_ex2_pipe7_data_vld_dupx;     
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dupx; 
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;         
input            vfpu_idu_ex3_pipe6_data_vld_dupx;     
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;         
input            vfpu_idu_ex3_pipe7_data_vld_dupx;     
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;         
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;      
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;  
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;      
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;  
input            vfpu_idu_vdiv_busy;                   
input   [7  :0]  viq1_viq_create0_entry;               
input   [7  :0]  viq1_viq_create1_entry;               
output           viq0_ctrl_1_left_updt;                
output           viq0_ctrl_empty;                      
output  [3  :0]  viq0_ctrl_entry_cnt_updt_val;         
output           viq0_ctrl_entry_cnt_updt_vld;         
output           viq0_ctrl_full;                       
output           viq0_ctrl_full_updt;                  
output           viq0_ctrl_full_updt_clk_en;           
output  [7  :0]  viq0_dp_issue_entry;                  
output  [150:0]  viq0_dp_issue_read_data;              
output  [3  :0]  viq0_top_viq0_entry_cnt;              
output  [7  :0]  viq0_viq_create0_entry;               
output  [7  :0]  viq0_viq_create1_entry;               
output           viq0_xx_gateclk_issue_en;             
output           viq0_xx_issue_en;                     

// &Regs; @29
reg     [6  :0]  viq0_entry0_create_agevec;            
reg     [150:0]  viq0_entry0_create_data;              
reg              viq0_entry0_create_frz;               
reg     [6  :0]  viq0_entry1_create_agevec;            
reg     [150:0]  viq0_entry1_create_data;              
reg              viq0_entry1_create_frz;               
reg     [6  :0]  viq0_entry2_create_agevec;            
reg     [150:0]  viq0_entry2_create_data;              
reg              viq0_entry2_create_frz;               
reg     [6  :0]  viq0_entry3_create_agevec;            
reg     [150:0]  viq0_entry3_create_data;              
reg              viq0_entry3_create_frz;               
reg     [6  :0]  viq0_entry4_create_agevec;            
reg     [150:0]  viq0_entry4_create_data;              
reg              viq0_entry4_create_frz;               
reg     [6  :0]  viq0_entry5_create_agevec;            
reg     [150:0]  viq0_entry5_create_data;              
reg              viq0_entry5_create_frz;               
reg     [6  :0]  viq0_entry6_create_agevec;            
reg     [150:0]  viq0_entry6_create_data;              
reg              viq0_entry6_create_frz;               
reg     [6  :0]  viq0_entry7_create_agevec;            
reg     [150:0]  viq0_entry7_create_data;              
reg              viq0_entry7_create_frz;               
reg     [3  :0]  viq0_entry_cnt;                       
reg     [7  :0]  viq0_entry_create0_in;                
reg     [7  :0]  viq0_entry_create1_in;                
reg     [150:0]  viq0_entry_read_data;                 

// &Wires; @30
wire             cnt_clk;                              
wire             cnt_clk_en;                           
wire             cp0_idu_icg_en;                       
wire             cp0_idu_iq_bypass_disable;            
wire             cp0_yy_clk_en;                        
wire             cpurst_b;                             
wire    [1  :0]  ctrl_dp_is_dis_viq0_create0_sel;      
wire    [1  :0]  ctrl_dp_is_dis_viq0_create1_sel;      
wire    [1  :0]  ctrl_dp_is_dis_viq1_create0_sel;      
wire    [1  :0]  ctrl_dp_is_dis_viq1_create1_sel;      
wire             ctrl_viq0_create0_dp_en;              
wire             ctrl_viq0_create0_en;                 
wire             ctrl_viq0_create0_gateclk_en;         
wire             ctrl_viq0_create1_dp_en;              
wire             ctrl_viq0_create1_en;                 
wire             ctrl_viq0_create1_gateclk_en;         
wire             ctrl_viq0_rf_lch_fail_vld;            
wire    [7  :0]  ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld; 
wire    [7  :0]  ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld; 
wire             ctrl_viq0_rf_pop_dlb_vld;             
wire             ctrl_viq0_rf_pop_vld;                 
wire             ctrl_viq0_stall;                      
wire             ctrl_viq1_create0_dp_en;              
wire             ctrl_viq1_create0_gateclk_en;         
wire             ctrl_viq1_create1_dp_en;              
wire             ctrl_viq1_create1_gateclk_en;         
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dupx;   
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dupx;   
wire    [150:0]  dp_viq0_bypass_data;                  
wire    [150:0]  dp_viq0_create0_data;                 
wire    [150:0]  dp_viq0_create1_data;                 
wire             dp_viq0_create_srcv0_rdy_for_bypass;  
wire             dp_viq0_create_srcv1_rdy_for_bypass;  
wire             dp_viq0_create_srcv2_rdy_for_bypass;  
wire             dp_viq0_create_srcvm_rdy_for_bypass;  
wire             dp_viq0_create_vdiv;                  
wire    [7  :0]  dp_viq0_rf_lch_entry;                 
wire    [3  :0]  dp_viq0_rf_rdy_clr;                   
wire    [6  :0]  dp_viq_dis_inst0_srcv2_vreg;          
wire    [6  :0]  dp_viq_dis_inst1_srcv2_vreg;          
wire    [6  :0]  dp_viq_dis_inst2_srcv2_vreg;          
wire    [6  :0]  dp_viq_dis_inst3_srcv2_vreg;          
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dupx;         
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dupx;         
wire             forever_cpuclk;                       
wire             lsu_idu_ag_pipe3_vload_inst_vld;      
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dupx;           
wire             lsu_idu_dc_pipe3_vload_fwd_inst_vld;  
wire             lsu_idu_dc_pipe3_vload_inst_vld_dupx; 
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dupx;           
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;        
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dupx;    
wire             pad_yy_icg_scan_en;                   
wire             rtu_idu_flush_fe;                     
wire             rtu_idu_flush_is;                     
wire             rtu_yy_xx_flush;                      
wire             vfpu_idu_ex1_pipe6_data_vld_dupx;     
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dupx;         
wire             vfpu_idu_ex1_pipe7_data_vld_dupx;     
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dupx;         
wire             vfpu_idu_ex2_pipe6_data_vld_dupx;     
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dupx;         
wire             vfpu_idu_ex2_pipe7_data_vld_dupx;     
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dupx; 
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dupx;         
wire             vfpu_idu_ex3_pipe6_data_vld_dupx;     
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dupx;         
wire             vfpu_idu_ex3_pipe7_data_vld_dupx;     
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dupx;         
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;      
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;  
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;      
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;  
wire             vfpu_idu_vdiv_busy;                   
wire             viq0_bypass_dp_en;                    
wire             viq0_bypass_en;                       
wire             viq0_bypass_gateclk_en;               
wire             viq0_create0_rdy_bypass;              
wire             viq0_create0_rdy_bypass_dp;           
wire             viq0_create0_rdy_bypass_gateclk;      
wire             viq0_create_bypass_empty;             
wire             viq0_ctrl_1_left_updt;                
wire             viq0_ctrl_empty;                      
wire    [3  :0]  viq0_ctrl_entry_cnt_updt_val;         
wire             viq0_ctrl_entry_cnt_updt_vld;         
wire             viq0_ctrl_full;                       
wire             viq0_ctrl_full_updt;                  
wire             viq0_ctrl_full_updt_clk_en;           
wire    [7  :0]  viq0_dp_issue_entry;                  
wire    [150:0]  viq0_dp_issue_read_data;              
wire    [6  :0]  viq0_entry0_agevec;                   
wire             viq0_entry0_create_dp_en;             
wire             viq0_entry0_create_en;                
wire             viq0_entry0_create_gateclk_en;        
wire             viq0_entry0_frz_clr;                  
wire             viq0_entry0_issue_en;                 
wire             viq0_entry0_pop_cur_entry;            
wire    [6  :0]  viq0_entry0_pop_other_entry;          
wire             viq0_entry0_rdy;                      
wire    [150:0]  viq0_entry0_read_data;                
wire             viq0_entry0_vfpu0_vreg_fwd_vld;       
wire             viq0_entry0_vfpu1_vreg_fwd_vld;       
wire             viq0_entry0_vld;                      
wire             viq0_entry0_vld_with_frz;             
wire    [6  :0]  viq0_entry1_agevec;                   
wire             viq0_entry1_create_dp_en;             
wire             viq0_entry1_create_en;                
wire             viq0_entry1_create_gateclk_en;        
wire             viq0_entry1_frz_clr;                  
wire             viq0_entry1_issue_en;                 
wire             viq0_entry1_pop_cur_entry;            
wire    [6  :0]  viq0_entry1_pop_other_entry;          
wire             viq0_entry1_rdy;                      
wire    [150:0]  viq0_entry1_read_data;                
wire             viq0_entry1_vfpu0_vreg_fwd_vld;       
wire             viq0_entry1_vfpu1_vreg_fwd_vld;       
wire             viq0_entry1_vld;                      
wire             viq0_entry1_vld_with_frz;             
wire    [6  :0]  viq0_entry2_agevec;                   
wire             viq0_entry2_create_dp_en;             
wire             viq0_entry2_create_en;                
wire             viq0_entry2_create_gateclk_en;        
wire             viq0_entry2_frz_clr;                  
wire             viq0_entry2_issue_en;                 
wire             viq0_entry2_pop_cur_entry;            
wire    [6  :0]  viq0_entry2_pop_other_entry;          
wire             viq0_entry2_rdy;                      
wire    [150:0]  viq0_entry2_read_data;                
wire             viq0_entry2_vfpu0_vreg_fwd_vld;       
wire             viq0_entry2_vfpu1_vreg_fwd_vld;       
wire             viq0_entry2_vld;                      
wire             viq0_entry2_vld_with_frz;             
wire    [6  :0]  viq0_entry3_agevec;                   
wire             viq0_entry3_create_dp_en;             
wire             viq0_entry3_create_en;                
wire             viq0_entry3_create_gateclk_en;        
wire             viq0_entry3_frz_clr;                  
wire             viq0_entry3_issue_en;                 
wire             viq0_entry3_pop_cur_entry;            
wire    [6  :0]  viq0_entry3_pop_other_entry;          
wire             viq0_entry3_rdy;                      
wire    [150:0]  viq0_entry3_read_data;                
wire             viq0_entry3_vfpu0_vreg_fwd_vld;       
wire             viq0_entry3_vfpu1_vreg_fwd_vld;       
wire             viq0_entry3_vld;                      
wire             viq0_entry3_vld_with_frz;             
wire    [6  :0]  viq0_entry4_agevec;                   
wire             viq0_entry4_create_dp_en;             
wire             viq0_entry4_create_en;                
wire             viq0_entry4_create_gateclk_en;        
wire             viq0_entry4_frz_clr;                  
wire             viq0_entry4_issue_en;                 
wire             viq0_entry4_pop_cur_entry;            
wire    [6  :0]  viq0_entry4_pop_other_entry;          
wire             viq0_entry4_rdy;                      
wire    [150:0]  viq0_entry4_read_data;                
wire             viq0_entry4_vfpu0_vreg_fwd_vld;       
wire             viq0_entry4_vfpu1_vreg_fwd_vld;       
wire             viq0_entry4_vld;                      
wire             viq0_entry4_vld_with_frz;             
wire    [6  :0]  viq0_entry5_agevec;                   
wire             viq0_entry5_create_dp_en;             
wire             viq0_entry5_create_en;                
wire             viq0_entry5_create_gateclk_en;        
wire             viq0_entry5_frz_clr;                  
wire             viq0_entry5_issue_en;                 
wire             viq0_entry5_pop_cur_entry;            
wire    [6  :0]  viq0_entry5_pop_other_entry;          
wire             viq0_entry5_rdy;                      
wire    [150:0]  viq0_entry5_read_data;                
wire             viq0_entry5_vfpu0_vreg_fwd_vld;       
wire             viq0_entry5_vfpu1_vreg_fwd_vld;       
wire             viq0_entry5_vld;                      
wire             viq0_entry5_vld_with_frz;             
wire    [6  :0]  viq0_entry6_agevec;                   
wire             viq0_entry6_create_dp_en;             
wire             viq0_entry6_create_en;                
wire             viq0_entry6_create_gateclk_en;        
wire             viq0_entry6_frz_clr;                  
wire             viq0_entry6_issue_en;                 
wire             viq0_entry6_pop_cur_entry;            
wire    [6  :0]  viq0_entry6_pop_other_entry;          
wire             viq0_entry6_rdy;                      
wire    [150:0]  viq0_entry6_read_data;                
wire             viq0_entry6_vfpu0_vreg_fwd_vld;       
wire             viq0_entry6_vfpu1_vreg_fwd_vld;       
wire             viq0_entry6_vld;                      
wire             viq0_entry6_vld_with_frz;             
wire    [6  :0]  viq0_entry7_agevec;                   
wire             viq0_entry7_create_dp_en;             
wire             viq0_entry7_create_en;                
wire             viq0_entry7_create_gateclk_en;        
wire             viq0_entry7_frz_clr;                  
wire             viq0_entry7_issue_en;                 
wire             viq0_entry7_pop_cur_entry;            
wire    [6  :0]  viq0_entry7_pop_other_entry;          
wire             viq0_entry7_rdy;                      
wire    [150:0]  viq0_entry7_read_data;                
wire             viq0_entry7_vfpu0_vreg_fwd_vld;       
wire             viq0_entry7_vfpu1_vreg_fwd_vld;       
wire             viq0_entry7_vld;                      
wire             viq0_entry7_vld_with_frz;             
wire    [3  :0]  viq0_entry_cnt_create;                
wire             viq0_entry_cnt_create_0;              
wire             viq0_entry_cnt_create_1;              
wire             viq0_entry_cnt_create_2;              
wire             viq0_entry_cnt_pop_0;                 
wire             viq0_entry_cnt_pop_1;                 
wire    [3  :0]  viq0_entry_cnt_updt_val;              
wire             viq0_entry_cnt_updt_vld;              
wire    [7  :0]  viq0_entry_create0_agevec;            
wire    [7  :0]  viq0_entry_create1_agevec;            
wire    [7  :0]  viq0_entry_create_dp_en;              
wire    [7  :0]  viq0_entry_create_en;                 
wire    [7  :0]  viq0_entry_create_gateclk_en;         
wire    [7  :0]  viq0_entry_create_sel;                
wire    [7  :0]  viq0_entry_issue_en;                  
wire    [7  :0]  viq0_entry_ready;                     
wire             viq0_entry_top_clk;                   
wire    [7  :0]  viq0_entry_vld;                       
wire    [7  :0]  viq0_older_entry_ready;               
wire    [3  :0]  viq0_top_viq0_entry_cnt;              
wire    [7  :0]  viq0_viq_create0_entry;               
wire    [7  :0]  viq0_viq_create1_entry;               
wire             viq0_xx_gateclk_issue_en;             
wire             viq0_xx_issue_en;                     
wire    [7  :0]  viq1_viq_create0_entry;               
wire    [7  :0]  viq1_viq_create1_entry;               


parameter VIQ0_WIDTH             = 151;

//==========================================================
//            ALU Issue Queue 0 Create Control
//==========================================================
//-------------------gated cell instance--------------------
assign cnt_clk_en = (viq0_entry_cnt[3:0] != 4'b0)
                    || ctrl_viq0_create0_gateclk_en
                    || ctrl_viq0_create1_gateclk_en;
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

//used for viq0 entry forever_cpuclk
assign viq0_entry_top_clk = cnt_clk;

assign viq0_ctrl_full_updt_clk_en = cnt_clk_en;

//--------------------viq0 entry counter--------------------
//if create, add entry counter
assign viq0_entry_cnt_create[3:0]   = {3'b0,ctrl_viq0_create0_en}
                                      + {3'b0,ctrl_viq0_create1_en};
//update valid and value
assign viq0_entry_cnt_updt_vld      = ctrl_viq0_create0_en
                                      || ctrl_viq0_rf_pop_vld;
assign viq0_entry_cnt_updt_val[3:0] = viq0_entry_cnt[3:0]
                                      + viq0_entry_cnt_create[3:0]
                                      - {3'b0,ctrl_viq0_rf_pop_vld};
//implement entry counter
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    viq0_entry_cnt[3:0] <= 4'b0;
  //after flush fe/is, the rf may wrongly pop before rtu_yy_xx_flush
  //need flush also when rtu_yy_xx_flush
  else if(rtu_idu_flush_fe || rtu_idu_flush_is || rtu_yy_xx_flush)
    viq0_entry_cnt[3:0] <= 4'b0;
  else if(viq0_entry_cnt_updt_vld)
    viq0_entry_cnt[3:0] <= viq0_entry_cnt_updt_val[3:0];
  else
    viq0_entry_cnt[3:0] <= viq0_entry_cnt[3:0];
end

assign viq0_ctrl_full                    = (viq0_entry_cnt[3:0] == 4'd8);

assign viq0_top_viq0_entry_cnt[3:0]      = viq0_entry_cnt[3:0];

//---------viq0 entry counter update value for dlb---------
//output for ctrl dlb
assign viq0_ctrl_entry_cnt_updt_vld      = ctrl_viq0_create0_en
                                        || ctrl_viq0_rf_pop_dlb_vld;
assign viq0_ctrl_entry_cnt_updt_val[3:0] = viq0_entry_cnt[3:0]
                                         + viq0_entry_cnt_create[3:0]
                                         - {3'b0,ctrl_viq0_rf_pop_dlb_vld};

//--------------------viq0 entry full-----------------------
assign viq0_entry_cnt_create_2 =  ctrl_viq0_create1_en;
assign viq0_entry_cnt_create_1 =  ctrl_viq0_create0_en && !ctrl_viq0_create1_en;
assign viq0_entry_cnt_create_0 = !ctrl_viq0_create0_en;

assign viq0_entry_cnt_pop_1    =  ctrl_viq0_rf_pop_vld;
assign viq0_entry_cnt_pop_0    = !ctrl_viq0_rf_pop_vld;

assign viq0_ctrl_full_updt     = (viq0_entry_cnt[3:0] == 4'd6)
                                 && viq0_entry_cnt_create_2
                                 && viq0_entry_cnt_pop_0
                              || (viq0_entry_cnt[3:0] == 4'd7)
                                 && viq0_entry_cnt_create_1
                                 && viq0_entry_cnt_pop_0
                              || (viq0_entry_cnt[3:0] == 4'd8)
                                 && viq0_entry_cnt_create_0
                                 && viq0_entry_cnt_pop_0;

assign viq0_ctrl_1_left_updt   = (viq0_entry_cnt[3:0] == 4'd5)
                                 && viq0_entry_cnt_create_2
                                 && viq0_entry_cnt_pop_0
                              || (viq0_entry_cnt[3:0] == 4'd6)
                                 && viq0_entry_cnt_create_1
                                 && viq0_entry_cnt_pop_0
                              || (viq0_entry_cnt[3:0] == 4'd6)
                                 && viq0_entry_cnt_create_2
                                 && viq0_entry_cnt_pop_1
                              || (viq0_entry_cnt[3:0] == 4'd7)
                                 && viq0_entry_cnt_create_0
                                 && viq0_entry_cnt_pop_0
                              || (viq0_entry_cnt[3:0] == 4'd7)
                                 && viq0_entry_cnt_create_1
                                 && viq0_entry_cnt_pop_1
                              || (viq0_entry_cnt[3:0] == 4'd8)
                                 && viq0_entry_cnt_create_0
                                 && viq0_entry_cnt_pop_1;

//assign viq0_full_entry_cnt_updt_val[3:0] = (viq0_entry_cnt_updt_vld)
//                                           ? viq0_entry_cnt_updt_val[3:0]
//                                           : viq0_entry_cnt[3:0];
//
//assign viq0_ctrl_full_updt   = (viq0_full_entry_cnt_updt_val[3:0] == 4'd8);
//assign viq0_ctrl_1_left_updt = (viq0_full_entry_cnt_updt_val[3:0] == 4'd7);

//---------------------create bypass------------------------
//if create instruction is ready, it may bypass from issue queue
//only create 0 can bypass
assign viq0_create0_rdy_bypass    = ctrl_viq0_create0_en
                                    && !cp0_idu_iq_bypass_disable
                                    && !ctrl_viq0_stall
                                    && !(dp_viq0_create_vdiv && vfpu_idu_vdiv_busy)
                                    && dp_viq0_create_srcv0_rdy_for_bypass
                                    && dp_viq0_create_srcv1_rdy_for_bypass
                                    && dp_viq0_create_srcv2_rdy_for_bypass
                                    && dp_viq0_create_srcvm_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign viq0_create0_rdy_bypass_dp = ctrl_viq0_create0_dp_en
                                    && !cp0_idu_iq_bypass_disable
                                    && !ctrl_viq0_stall
                                    && !(dp_viq0_create_vdiv && vfpu_idu_vdiv_busy)
                                    && dp_viq0_create_srcv0_rdy_for_bypass
                                    && dp_viq0_create_srcv1_rdy_for_bypass
                                    && dp_viq0_create_srcv2_rdy_for_bypass
                                    && dp_viq0_create_srcvm_rdy_for_bypass;
//data path bypass signal, with timing optmized
assign viq0_create0_rdy_bypass_gateclk = ctrl_viq0_create0_gateclk_en
                                         && dp_viq0_create_srcv0_rdy_for_bypass
                                         && dp_viq0_create_srcv1_rdy_for_bypass
                                         && dp_viq0_create_srcv2_rdy_for_bypass
                                         && dp_viq0_create_srcvm_rdy_for_bypass;


//issue queue entry create control
assign viq0_entry_vld[0]         = viq0_entry0_vld;
assign viq0_entry_vld[1]         = viq0_entry1_vld;
assign viq0_entry_vld[2]         = viq0_entry2_vld;
assign viq0_entry_vld[3]         = viq0_entry3_vld;
assign viq0_entry_vld[4]         = viq0_entry4_vld;
assign viq0_entry_vld[5]         = viq0_entry5_vld;
assign viq0_entry_vld[6]         = viq0_entry6_vld;
assign viq0_entry_vld[7]         = viq0_entry7_vld;

assign viq0_create_bypass_empty  = !(viq0_entry0_vld_with_frz
                                     || viq0_entry1_vld_with_frz
                                     || viq0_entry2_vld_with_frz
                                     || viq0_entry3_vld_with_frz
                                     || viq0_entry4_vld_with_frz
                                     || viq0_entry5_vld_with_frz
                                     || viq0_entry6_vld_with_frz
                                     || viq0_entry7_vld_with_frz);

assign viq0_ctrl_empty           = !(|viq0_entry_vld[7:0]);

//create0 priority is from entry 0 to 7
// &CombBeg; @185
always @( viq0_entry7_vld
       or viq0_entry2_vld
       or viq0_entry6_vld
       or viq0_entry5_vld
       or viq0_entry3_vld
       or viq0_entry4_vld
       or viq0_entry1_vld
       or viq0_entry0_vld)
begin
  if(!viq0_entry0_vld)
    viq0_entry_create0_in[7:0] = 8'b0000_0001;
  else if(!viq0_entry1_vld)
    viq0_entry_create0_in[7:0] = 8'b0000_0010;
  else if(!viq0_entry2_vld)
    viq0_entry_create0_in[7:0] = 8'b0000_0100;
  else if(!viq0_entry3_vld)
    viq0_entry_create0_in[7:0] = 8'b0000_1000;
  else if(!viq0_entry4_vld)
    viq0_entry_create0_in[7:0] = 8'b0001_0000;
  else if(!viq0_entry5_vld)
    viq0_entry_create0_in[7:0] = 8'b0010_0000;
  else if(!viq0_entry6_vld)
    viq0_entry_create0_in[7:0] = 8'b0100_0000;
  else if(!viq0_entry7_vld)
    viq0_entry_create0_in[7:0] = 8'b1000_0000;
  else 
    viq0_entry_create0_in[7:0] = 8'b0000_0000;
// &CombEnd; @204
end

//create1 priority is from entry 7 to 0
// &CombBeg; @207
always @( viq0_entry7_vld
       or viq0_entry2_vld
       or viq0_entry6_vld
       or viq0_entry5_vld
       or viq0_entry3_vld
       or viq0_entry4_vld
       or viq0_entry1_vld
       or viq0_entry0_vld)
begin
  if(!viq0_entry7_vld)
    viq0_entry_create1_in[7:0] = 8'b1000_0000;
  else if(!viq0_entry6_vld)
    viq0_entry_create1_in[7:0] = 8'b0100_0000;
  else if(!viq0_entry5_vld)
    viq0_entry_create1_in[7:0] = 8'b0010_0000;
  else if(!viq0_entry4_vld)
    viq0_entry_create1_in[7:0] = 8'b0001_0000;
  else if(!viq0_entry3_vld)
    viq0_entry_create1_in[7:0] = 8'b0000_1000;
  else if(!viq0_entry2_vld)
    viq0_entry_create1_in[7:0] = 8'b0000_0100;
  else if(!viq0_entry1_vld)
    viq0_entry_create1_in[7:0] = 8'b0000_0010;
  else if(!viq0_entry0_vld)
    viq0_entry_create1_in[7:0] = 8'b0000_0001;
  else
    viq0_entry_create1_in[7:0] = 8'b0000_0000;
// &CombEnd; @226
end

// &Force("output","viq0_viq_create0_entry"); @228
// &Force("output","viq0_viq_create1_entry"); @229
assign viq0_viq_create0_entry[7:0] = viq0_entry_create0_in[7:0];
assign viq0_viq_create1_entry[7:0] = viq0_entry_create1_in[7:0];

assign viq0_bypass_en          = viq0_create_bypass_empty
                                 && viq0_create0_rdy_bypass;

assign viq0_entry_create_en[7:0] =
       {8{ctrl_viq0_create0_en}} & viq0_entry_create0_in[7:0]
     | {8{ctrl_viq0_create1_en}} & viq0_entry_create1_in[7:0];

assign viq0_entry0_create_en     = viq0_entry_create_en[0];
assign viq0_entry1_create_en     = viq0_entry_create_en[1];
assign viq0_entry2_create_en     = viq0_entry_create_en[2];
assign viq0_entry3_create_en     = viq0_entry_create_en[3];
assign viq0_entry4_create_en     = viq0_entry_create_en[4];
assign viq0_entry5_create_en     = viq0_entry_create_en[5];
assign viq0_entry6_create_en     = viq0_entry_create_en[6];
assign viq0_entry7_create_en     = viq0_entry_create_en[7];

assign viq0_bypass_dp_en         = viq0_create_bypass_empty
                                   && viq0_create0_rdy_bypass_dp;
assign viq0_bypass_gateclk_en    = viq0_create_bypass_empty
                                   && viq0_create0_rdy_bypass_gateclk;

//issue queue entry create data path control
assign viq0_entry_create_dp_en[7:0] =
       {8{ctrl_viq0_create0_dp_en}} & viq0_entry_create0_in[7:0]
     | {8{ctrl_viq0_create1_dp_en}} & viq0_entry_create1_in[7:0];

assign viq0_entry0_create_dp_en  = viq0_entry_create_dp_en[0];
assign viq0_entry1_create_dp_en  = viq0_entry_create_dp_en[1];
assign viq0_entry2_create_dp_en  = viq0_entry_create_dp_en[2];
assign viq0_entry3_create_dp_en  = viq0_entry_create_dp_en[3];
assign viq0_entry4_create_dp_en  = viq0_entry_create_dp_en[4];
assign viq0_entry5_create_dp_en  = viq0_entry_create_dp_en[5];
assign viq0_entry6_create_dp_en  = viq0_entry_create_dp_en[6];
assign viq0_entry7_create_dp_en  = viq0_entry_create_dp_en[7];

//issue queue entry create gateclk control
//ignore bypass signal for timing optimization
assign viq0_entry_create_gateclk_en[7:0] =
       {8{ctrl_viq0_create0_gateclk_en}} & viq0_entry_create0_in[7:0]
     | {8{ctrl_viq0_create1_gateclk_en}} & viq0_entry_create1_in[7:0];

assign viq0_entry0_create_gateclk_en  = viq0_entry_create_gateclk_en[0];
assign viq0_entry1_create_gateclk_en  = viq0_entry_create_gateclk_en[1];
assign viq0_entry2_create_gateclk_en  = viq0_entry_create_gateclk_en[2];
assign viq0_entry3_create_gateclk_en  = viq0_entry_create_gateclk_en[3];
assign viq0_entry4_create_gateclk_en  = viq0_entry_create_gateclk_en[4];
assign viq0_entry5_create_gateclk_en  = viq0_entry_create_gateclk_en[5];
assign viq0_entry6_create_gateclk_en  = viq0_entry_create_gateclk_en[6];
assign viq0_entry7_create_gateclk_en  = viq0_entry_create_gateclk_en[7];

//viq create entry should consider pop signal and create0
assign viq0_entry_create0_agevec[7:0] = viq0_entry_vld[7:0]
                                        & ~({8{ctrl_viq0_rf_pop_vld}}
                                           & dp_viq0_rf_lch_entry[7:0]);

assign viq0_entry_create1_agevec[7:0] = viq0_entry_vld[7:0]
                                        & ~({8{ctrl_viq0_rf_pop_vld}}
                                           & dp_viq0_rf_lch_entry[7:0])
                                        | viq0_entry_create0_in[7:0];

//create 0/1 select:
//entry 0~3 use ~viq0_entry_create0_in for better timing
//entry 4~7 use viq0_entry_create1_in for better timing
//viq0_entry_create0/1_in cannot be both 1,
//if both 0, do not create
assign viq0_entry_create_sel[7:4] = {4{ctrl_viq0_create1_dp_en}}
                                     & viq0_entry_create1_in[7:4];
assign viq0_entry_create_sel[3:0] = ~({4{ctrl_viq0_create0_dp_en}}
                                      & viq0_entry_create0_in[3:0]);

//----------------entry0 flop create signals----------------
// &CombBeg; @304
always @( viq0_entry_create0_agevec[7:1]
       or viq0_bypass_dp_en
       or viq0_entry_create1_agevec[7:1]
       or viq0_entry_create_sel[0]
       or dp_viq0_create1_data[150:0]
       or dp_viq0_create0_data[150:0])
begin
  if(!viq0_entry_create_sel[0]) begin
    viq0_entry0_create_frz         = viq0_bypass_dp_en;
    viq0_entry0_create_agevec[6:0] = viq0_entry_create0_agevec[7:1];
    viq0_entry0_create_data[VIQ0_WIDTH-1:0] = 
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry0_create_frz         = 1'b0;
    viq0_entry0_create_agevec[6:0] = viq0_entry_create1_agevec[7:1];
    viq0_entry0_create_data[VIQ0_WIDTH-1:0] = 
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @317
end

//----------------entry1 flop create signals----------------
// &CombBeg; @320
always @( viq0_entry_create1_agevec[0]
       or viq0_bypass_dp_en
       or viq0_entry_create_sel[1]
       or viq0_entry_create0_agevec[0]
       or viq0_entry_create1_agevec[7:2]
       or dp_viq0_create1_data[150:0]
       or viq0_entry_create0_agevec[7:2]
       or dp_viq0_create0_data[150:0])
begin
  if(!viq0_entry_create_sel[1]) begin
    viq0_entry1_create_frz         = viq0_bypass_dp_en;
    viq0_entry1_create_agevec[6:0] = {viq0_entry_create0_agevec[7:2],
                                      viq0_entry_create0_agevec[0]};
    viq0_entry1_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry1_create_frz         = 1'b0;
    viq0_entry1_create_agevec[6:0] = {viq0_entry_create1_agevec[7:2],
                                      viq0_entry_create1_agevec[0]};
    viq0_entry1_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @335
end

//----------------entry2 flop create signals----------------
// &CombBeg; @338
always @( viq0_bypass_dp_en
       or viq0_entry_create0_agevec[1:0]
       or viq0_entry_create1_agevec[1:0]
       or viq0_entry_create_sel[2]
       or viq0_entry_create0_agevec[7:3]
       or viq0_entry_create1_agevec[7:3]
       or dp_viq0_create1_data[150:0]
       or dp_viq0_create0_data[150:0])
begin
  if(!viq0_entry_create_sel[2]) begin
    viq0_entry2_create_frz         = viq0_bypass_dp_en;
    viq0_entry2_create_agevec[6:0] = {viq0_entry_create0_agevec[7:3],
                                      viq0_entry_create0_agevec[1:0]};
    viq0_entry2_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry2_create_frz         = 1'b0;
    viq0_entry2_create_agevec[6:0] = {viq0_entry_create1_agevec[7:3],
                                      viq0_entry_create1_agevec[1:0]};
    viq0_entry2_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @353
end

//----------------entry3 flop create signals----------------
// &CombBeg; @356
always @( viq0_bypass_dp_en
       or viq0_entry_create1_agevec[2:0]
       or viq0_entry_create0_agevec[2:0]
       or viq0_entry_create_sel[3]
       or dp_viq0_create1_data[150:0]
       or dp_viq0_create0_data[150:0]
       or viq0_entry_create0_agevec[7:4]
       or viq0_entry_create1_agevec[7:4])
begin
  if(!viq0_entry_create_sel[3]) begin
    viq0_entry3_create_frz         = viq0_bypass_dp_en;
    viq0_entry3_create_agevec[6:0] = {viq0_entry_create0_agevec[7:4],
                                      viq0_entry_create0_agevec[2:0]};
    viq0_entry3_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry3_create_frz         = 1'b0;
    viq0_entry3_create_agevec[6:0] = {viq0_entry_create1_agevec[7:4],
                                      viq0_entry_create1_agevec[2:0]};
    viq0_entry3_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @371
end

//----------------entry4 flop create signals----------------
// &CombBeg; @374
always @( viq0_bypass_dp_en
       or viq0_entry_create1_agevec[7:5]
       or viq0_entry_create_sel[4]
       or viq0_entry_create0_agevec[3:0]
       or dp_viq0_create1_data[150:0]
       or viq0_entry_create0_agevec[7:5]
       or viq0_entry_create1_agevec[3:0]
       or dp_viq0_create0_data[150:0])
begin
  if(!viq0_entry_create_sel[4]) begin
    viq0_entry4_create_frz         = viq0_bypass_dp_en;
    viq0_entry4_create_agevec[6:0] = {viq0_entry_create0_agevec[7:5],
                                      viq0_entry_create0_agevec[3:0]};
    viq0_entry4_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry4_create_frz         = 1'b0;
    viq0_entry4_create_agevec[6:0] = {viq0_entry_create1_agevec[7:5],
                                      viq0_entry_create1_agevec[3:0]};
    viq0_entry4_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @389
end

//----------------entry5 flop create signals----------------
// &CombBeg; @392
always @( viq0_bypass_dp_en
       or viq0_entry_create0_agevec[7:6]
       or viq0_entry_create0_agevec[4:0]
       or viq0_entry_create_sel[5]
       or viq0_entry_create1_agevec[7:6]
       or dp_viq0_create1_data[150:0]
       or dp_viq0_create0_data[150:0]
       or viq0_entry_create1_agevec[4:0])
begin
  if(!viq0_entry_create_sel[5]) begin
    viq0_entry5_create_frz         = viq0_bypass_dp_en;
    viq0_entry5_create_agevec[6:0] = {viq0_entry_create0_agevec[7:6],
                                      viq0_entry_create0_agevec[4:0]};
    viq0_entry5_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry5_create_frz         = 1'b0;
    viq0_entry5_create_agevec[6:0] = {viq0_entry_create1_agevec[7:6],
                                      viq0_entry_create1_agevec[4:0]};
    viq0_entry5_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @407
end

//----------------entry6 flop create signals----------------
// &CombBeg; @410
always @( viq0_bypass_dp_en
       or viq0_entry_create1_agevec[7]
       or viq0_entry_create1_agevec[5:0]
       or viq0_entry_create_sel[6]
       or dp_viq0_create1_data[150:0]
       or viq0_entry_create0_agevec[5:0]
       or dp_viq0_create0_data[150:0]
       or viq0_entry_create0_agevec[7])
begin
  if(!viq0_entry_create_sel[6]) begin
    viq0_entry6_create_frz         = viq0_bypass_dp_en;
    viq0_entry6_create_agevec[6:0] = {viq0_entry_create0_agevec[7],
                                      viq0_entry_create0_agevec[5:0]};
    viq0_entry6_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry6_create_frz         = 1'b0;
    viq0_entry6_create_agevec[6:0] = {viq0_entry_create1_agevec[7],
                                      viq0_entry_create1_agevec[5:0]};
    viq0_entry6_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @425
end

//----------------entry7 flop create signals----------------
// &CombBeg; @428
always @( viq0_bypass_dp_en
       or viq0_entry_create1_agevec[6:0]
       or viq0_entry_create_sel[7]
       or dp_viq0_create1_data[150:0]
       or viq0_entry_create0_agevec[6:0]
       or dp_viq0_create0_data[150:0])
begin
  if(!viq0_entry_create_sel[7]) begin
    viq0_entry7_create_frz         = viq0_bypass_dp_en;
    viq0_entry7_create_agevec[6:0] = viq0_entry_create0_agevec[6:0];
    viq0_entry7_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create0_data[VIQ0_WIDTH-1:0];
  end
  else begin
    viq0_entry7_create_frz         = 1'b0;
    viq0_entry7_create_agevec[6:0] = viq0_entry_create1_agevec[6:0];
    viq0_entry7_create_data[VIQ0_WIDTH-1:0] =
       dp_viq0_create1_data[VIQ0_WIDTH-1:0];
  end
// &CombEnd; @441
end

//==========================================================
//             VEC Issue Queue 0 Issue Control
//==========================================================
//----------------Pipe6 Launch Ready Signals----------------
assign viq0_entry0_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[0];
assign viq0_entry1_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[1];
assign viq0_entry2_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[2];
assign viq0_entry3_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[3];
assign viq0_entry4_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[4];
assign viq0_entry5_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[5];
assign viq0_entry6_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[6];
assign viq0_entry7_vfpu0_vreg_fwd_vld = ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[7];

assign viq0_entry0_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[0];
assign viq0_entry1_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[1];
assign viq0_entry2_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[2];
assign viq0_entry3_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[3];
assign viq0_entry4_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[4];
assign viq0_entry5_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[5];
assign viq0_entry6_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[6];
assign viq0_entry7_vfpu1_vreg_fwd_vld = ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[7];

//-------------------issue enable signals-------------------
assign viq0_entry_ready[0]      = viq0_entry0_rdy;
assign viq0_entry_ready[1]      = viq0_entry1_rdy;
assign viq0_entry_ready[2]      = viq0_entry2_rdy;
assign viq0_entry_ready[3]      = viq0_entry3_rdy;
assign viq0_entry_ready[4]      = viq0_entry4_rdy;
assign viq0_entry_ready[5]      = viq0_entry5_rdy;
assign viq0_entry_ready[6]      = viq0_entry6_rdy;
assign viq0_entry_ready[7]      = viq0_entry7_rdy;
//if there is any entry ready or bypass enable, issue enable
assign viq0_xx_issue_en         = |{viq0_bypass_en,
                                    viq0_entry_ready[7:0]};
//gate clock issue enable with timing optimization
assign viq0_xx_gateclk_issue_en = viq0_bypass_gateclk_en
                                  || viq0_entry0_vld_with_frz
                                  || viq0_entry1_vld_with_frz
                                  || viq0_entry2_vld_with_frz
                                  || viq0_entry3_vld_with_frz
                                  || viq0_entry4_vld_with_frz
                                  || viq0_entry5_vld_with_frz
                                  || viq0_entry6_vld_with_frz
                                  || viq0_entry7_vld_with_frz;
//first find older ready entry
assign viq0_older_entry_ready[0] = |(viq0_entry0_agevec[6:0]
                                     & viq0_entry_ready[7:1]);
assign viq0_older_entry_ready[1] = |(viq0_entry1_agevec[6:0]
                                     & {viq0_entry_ready[7:2],
                                        viq0_entry_ready[0]});
assign viq0_older_entry_ready[2] = |(viq0_entry2_agevec[6:0]
                                     & {viq0_entry_ready[7:3],
                                        viq0_entry_ready[1:0]});
assign viq0_older_entry_ready[3] = |(viq0_entry3_agevec[6:0]
                                     & {viq0_entry_ready[7:4],
                                        viq0_entry_ready[2:0]});
assign viq0_older_entry_ready[4] = |(viq0_entry4_agevec[6:0]
                                     & {viq0_entry_ready[7:5],
                                        viq0_entry_ready[3:0]});
assign viq0_older_entry_ready[5] = |(viq0_entry5_agevec[6:0]
                                     & {viq0_entry_ready[7:6],
                                        viq0_entry_ready[4:0]});
assign viq0_older_entry_ready[6] = |(viq0_entry6_agevec[6:0]
                                     & {viq0_entry_ready[7],
                                        viq0_entry_ready[5:0]});
assign viq0_older_entry_ready[7] = |(viq0_entry7_agevec[6:0]
                                     & viq0_entry_ready[6:0]);

//------------------entry issue enable signals--------------
//not ready if older ready exists
assign viq0_entry_issue_en[7:0]  = viq0_entry_ready[7:0]
                                   & ~viq0_older_entry_ready[7:0];
//rename for entries
assign viq0_entry0_issue_en      = viq0_entry_issue_en[0];
assign viq0_entry1_issue_en      = viq0_entry_issue_en[1];
assign viq0_entry2_issue_en      = viq0_entry_issue_en[2];
assign viq0_entry3_issue_en      = viq0_entry_issue_en[3];
assign viq0_entry4_issue_en      = viq0_entry_issue_en[4];
assign viq0_entry5_issue_en      = viq0_entry_issue_en[5];
assign viq0_entry6_issue_en      = viq0_entry_issue_en[6];
assign viq0_entry7_issue_en      = viq0_entry_issue_en[7];

//-----------------issue entry indiction--------------------
assign viq0_dp_issue_entry[7:0]  = (viq0_create_bypass_empty)
                                   ? viq0_entry_create0_in[7:0]
                                   : viq0_entry_issue_en[7:0];

//-----------------issue data path selection----------------
//issue data path will select oldest ready entry in issue queue
//if no instruction valid, the data path will always select bypass 
//data path
// &CombBeg; @534
always @( viq0_entry7_read_data[150:0]
       or viq0_entry3_read_data[150:0]
       or viq0_entry_issue_en[7:0]
       or viq0_entry6_read_data[150:0]
       or viq0_entry4_read_data[150:0]
       or viq0_entry1_read_data[150:0]
       or viq0_entry5_read_data[150:0]
       or viq0_entry0_read_data[150:0]
       or viq0_entry2_read_data[150:0])
begin
  case (viq0_entry_issue_en[7:0])
    8'h01  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry0_read_data[VIQ0_WIDTH-1:0];
    8'h02  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry1_read_data[VIQ0_WIDTH-1:0];
    8'h04  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry2_read_data[VIQ0_WIDTH-1:0];
    8'h08  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry3_read_data[VIQ0_WIDTH-1:0];
    8'h10  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry4_read_data[VIQ0_WIDTH-1:0];
    8'h20  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry5_read_data[VIQ0_WIDTH-1:0];
    8'h40  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry6_read_data[VIQ0_WIDTH-1:0];
    8'h80  : viq0_entry_read_data[VIQ0_WIDTH-1:0] =
               viq0_entry7_read_data[VIQ0_WIDTH-1:0];
    default: viq0_entry_read_data[VIQ0_WIDTH-1:0] =
                                    {VIQ0_WIDTH{1'bx}};
  endcase
// &CombEnd; @555
end

//if no entry valid, select bypass path
assign viq0_dp_issue_read_data[VIQ0_WIDTH-1:0] = 
         (viq0_create_bypass_empty)
         ? dp_viq0_bypass_data[VIQ0_WIDTH-1:0]
         : viq0_entry_read_data[VIQ0_WIDTH-1:0];

//==========================================================
//            ALU Issue Queue 0 Launch Control
//==========================================================
//-------------------entry pop enable signals---------------
//pop when rf launch pass
assign {viq0_entry0_pop_other_entry[6:0],
        viq0_entry0_pop_cur_entry}        = dp_viq0_rf_lch_entry[7:0];
assign {viq0_entry1_pop_other_entry[6:1],
        viq0_entry1_pop_cur_entry,
        viq0_entry1_pop_other_entry[0]}   = dp_viq0_rf_lch_entry[7:0];
assign {viq0_entry2_pop_other_entry[6:2],
        viq0_entry2_pop_cur_entry,
        viq0_entry2_pop_other_entry[1:0]} = dp_viq0_rf_lch_entry[7:0];
assign {viq0_entry3_pop_other_entry[6:3],
        viq0_entry3_pop_cur_entry,
        viq0_entry3_pop_other_entry[2:0]} = dp_viq0_rf_lch_entry[7:0];
assign {viq0_entry4_pop_other_entry[6:4],
        viq0_entry4_pop_cur_entry,
        viq0_entry4_pop_other_entry[3:0]} = dp_viq0_rf_lch_entry[7:0];
assign {viq0_entry5_pop_other_entry[6:5],
        viq0_entry5_pop_cur_entry,
        viq0_entry5_pop_other_entry[4:0]} = dp_viq0_rf_lch_entry[7:0];
assign {viq0_entry6_pop_other_entry[6],
        viq0_entry6_pop_cur_entry,
        viq0_entry6_pop_other_entry[5:0]} = dp_viq0_rf_lch_entry[7:0];
assign {viq0_entry7_pop_cur_entry,
        viq0_entry7_pop_other_entry[6:0]} = dp_viq0_rf_lch_entry[7:0];

//-------------------entry spec fail signals---------------
//clear freeze and source rdy when launch fail
assign viq0_entry0_frz_clr      = ctrl_viq0_rf_lch_fail_vld
                                  && dp_viq0_rf_lch_entry[0];
assign viq0_entry1_frz_clr      = ctrl_viq0_rf_lch_fail_vld
                                  && dp_viq0_rf_lch_entry[1];
assign viq0_entry2_frz_clr      = ctrl_viq0_rf_lch_fail_vld 
                                  && dp_viq0_rf_lch_entry[2];
assign viq0_entry3_frz_clr      = ctrl_viq0_rf_lch_fail_vld 
                                  && dp_viq0_rf_lch_entry[3];
assign viq0_entry4_frz_clr      = ctrl_viq0_rf_lch_fail_vld 
                                  && dp_viq0_rf_lch_entry[4];
assign viq0_entry5_frz_clr      = ctrl_viq0_rf_lch_fail_vld 
                                  && dp_viq0_rf_lch_entry[5];
assign viq0_entry6_frz_clr      = ctrl_viq0_rf_lch_fail_vld 
                                  && dp_viq0_rf_lch_entry[6];
assign viq0_entry7_frz_clr      = ctrl_viq0_rf_lch_fail_vld 
                                  && dp_viq0_rf_lch_entry[7];

//==========================================================
//             ALU Issue Queue 0 Entry Instance
//==========================================================
// &ConnRule(s/^x_/viq0_entry0_/); @613
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry0"); @614
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry0 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry0_agevec                   ),
  .x_create_agevec                       (viq0_entry0_create_agevec            ),
  .x_create_data                         (viq0_entry0_create_data              ),
  .x_create_dp_en                        (viq0_entry0_create_dp_en             ),
  .x_create_en                           (viq0_entry0_create_en                ),
  .x_create_frz                          (viq0_entry0_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry0_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry0_frz_clr                  ),
  .x_issue_en                            (viq0_entry0_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry0_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry0_pop_other_entry          ),
  .x_rdy                                 (viq0_entry0_rdy                      ),
  .x_read_data                           (viq0_entry0_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry0_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry0_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry0_vld                      ),
  .x_vld_with_frz                        (viq0_entry0_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @615

// &ConnRule(s/^x_/viq0_entry1_/); @617
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry1"); @618
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry1 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry1_agevec                   ),
  .x_create_agevec                       (viq0_entry1_create_agevec            ),
  .x_create_data                         (viq0_entry1_create_data              ),
  .x_create_dp_en                        (viq0_entry1_create_dp_en             ),
  .x_create_en                           (viq0_entry1_create_en                ),
  .x_create_frz                          (viq0_entry1_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry1_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry1_frz_clr                  ),
  .x_issue_en                            (viq0_entry1_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry1_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry1_pop_other_entry          ),
  .x_rdy                                 (viq0_entry1_rdy                      ),
  .x_read_data                           (viq0_entry1_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry1_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry1_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry1_vld                      ),
  .x_vld_with_frz                        (viq0_entry1_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @619

// &ConnRule(s/^x_/viq0_entry2_/); @621
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry2"); @622
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry2 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry2_agevec                   ),
  .x_create_agevec                       (viq0_entry2_create_agevec            ),
  .x_create_data                         (viq0_entry2_create_data              ),
  .x_create_dp_en                        (viq0_entry2_create_dp_en             ),
  .x_create_en                           (viq0_entry2_create_en                ),
  .x_create_frz                          (viq0_entry2_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry2_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry2_frz_clr                  ),
  .x_issue_en                            (viq0_entry2_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry2_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry2_pop_other_entry          ),
  .x_rdy                                 (viq0_entry2_rdy                      ),
  .x_read_data                           (viq0_entry2_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry2_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry2_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry2_vld                      ),
  .x_vld_with_frz                        (viq0_entry2_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @623

// &ConnRule(s/^x_/viq0_entry3_/); @625
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry3"); @626
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry3 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry3_agevec                   ),
  .x_create_agevec                       (viq0_entry3_create_agevec            ),
  .x_create_data                         (viq0_entry3_create_data              ),
  .x_create_dp_en                        (viq0_entry3_create_dp_en             ),
  .x_create_en                           (viq0_entry3_create_en                ),
  .x_create_frz                          (viq0_entry3_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry3_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry3_frz_clr                  ),
  .x_issue_en                            (viq0_entry3_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry3_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry3_pop_other_entry          ),
  .x_rdy                                 (viq0_entry3_rdy                      ),
  .x_read_data                           (viq0_entry3_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry3_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry3_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry3_vld                      ),
  .x_vld_with_frz                        (viq0_entry3_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @627

// &ConnRule(s/^x_/viq0_entry4_/); @629
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry4"); @630
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry4 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry4_agevec                   ),
  .x_create_agevec                       (viq0_entry4_create_agevec            ),
  .x_create_data                         (viq0_entry4_create_data              ),
  .x_create_dp_en                        (viq0_entry4_create_dp_en             ),
  .x_create_en                           (viq0_entry4_create_en                ),
  .x_create_frz                          (viq0_entry4_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry4_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry4_frz_clr                  ),
  .x_issue_en                            (viq0_entry4_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry4_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry4_pop_other_entry          ),
  .x_rdy                                 (viq0_entry4_rdy                      ),
  .x_read_data                           (viq0_entry4_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry4_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry4_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry4_vld                      ),
  .x_vld_with_frz                        (viq0_entry4_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @631

// &ConnRule(s/^x_/viq0_entry5_/); @633
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry5"); @634
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry5 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry5_agevec                   ),
  .x_create_agevec                       (viq0_entry5_create_agevec            ),
  .x_create_data                         (viq0_entry5_create_data              ),
  .x_create_dp_en                        (viq0_entry5_create_dp_en             ),
  .x_create_en                           (viq0_entry5_create_en                ),
  .x_create_frz                          (viq0_entry5_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry5_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry5_frz_clr                  ),
  .x_issue_en                            (viq0_entry5_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry5_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry5_pop_other_entry          ),
  .x_rdy                                 (viq0_entry5_rdy                      ),
  .x_read_data                           (viq0_entry5_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry5_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry5_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry5_vld                      ),
  .x_vld_with_frz                        (viq0_entry5_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @635

// &ConnRule(s/^x_/viq0_entry6_/); @637
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry6"); @638
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry6 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry6_agevec                   ),
  .x_create_agevec                       (viq0_entry6_create_agevec            ),
  .x_create_data                         (viq0_entry6_create_data              ),
  .x_create_dp_en                        (viq0_entry6_create_dp_en             ),
  .x_create_en                           (viq0_entry6_create_en                ),
  .x_create_frz                          (viq0_entry6_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry6_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry6_frz_clr                  ),
  .x_issue_en                            (viq0_entry6_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry6_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry6_pop_other_entry          ),
  .x_rdy                                 (viq0_entry6_rdy                      ),
  .x_read_data                           (viq0_entry6_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry6_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry6_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry6_vld                      ),
  .x_vld_with_frz                        (viq0_entry6_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @639

// &ConnRule(s/^x_/viq0_entry7_/); @641
// &Instance("ct_idu_is_viq0_entry", "x_ct_idu_is_viq0_entry7"); @642
ct_idu_is_viq0_entry  x_ct_idu_is_viq0_entry7 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dupx   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dupx   ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dupx         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dupx         ),
  .forever_cpuclk                        (viq0_entry_top_clk                   ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dupx           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dupx ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dupx           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dupx        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dupx    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dupx         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dupx         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dupx         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dupx),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dupx         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dupx         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dupx     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dupx         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dupx      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .x_agevec                              (viq0_entry7_agevec                   ),
  .x_create_agevec                       (viq0_entry7_create_agevec            ),
  .x_create_data                         (viq0_entry7_create_data              ),
  .x_create_dp_en                        (viq0_entry7_create_dp_en             ),
  .x_create_en                           (viq0_entry7_create_en                ),
  .x_create_frz                          (viq0_entry7_create_frz               ),
  .x_create_gateclk_en                   (viq0_entry7_create_gateclk_en        ),
  .x_frz_clr                             (viq0_entry7_frz_clr                  ),
  .x_issue_en                            (viq0_entry7_issue_en                 ),
  .x_pop_cur_entry                       (viq0_entry7_pop_cur_entry            ),
  .x_pop_other_entry                     (viq0_entry7_pop_other_entry          ),
  .x_rdy                                 (viq0_entry7_rdy                      ),
  .x_read_data                           (viq0_entry7_read_data                ),
  .x_vfpu0_vreg_fwd_vld                  (viq0_entry7_vfpu0_vreg_fwd_vld       ),
  .x_vfpu1_vreg_fwd_vld                  (viq0_entry7_vfpu1_vreg_fwd_vld       ),
  .x_vld                                 (viq0_entry7_vld                      ),
  .x_vld_with_frz                        (viq0_entry7_vld_with_frz             )
);

// &Connect(.forever_cpuclk (viq0_entry_top_clk)); @643

// &ModuleEnd; @645
endmodule


