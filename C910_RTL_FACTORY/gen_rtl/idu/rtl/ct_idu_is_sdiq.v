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
module ct_idu_is_sdiq(
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_sdiq_create0_dp_en,
  ctrl_sdiq_create0_en,
  ctrl_sdiq_create0_gateclk_en,
  ctrl_sdiq_create1_dp_en,
  ctrl_sdiq_create1_en,
  ctrl_sdiq_create1_gateclk_en,
  ctrl_sdiq_rf_lch_fail_vld,
  ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld,
  ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld,
  ctrl_sdiq_rf_staddr_rdy_set,
  ctrl_xx_rf_pipe0_preg_lch_vld_dupx,
  ctrl_xx_rf_pipe1_preg_lch_vld_dupx,
  dp_sdiq_create0_data,
  dp_sdiq_create1_data,
  dp_sdiq_rf_lch_entry,
  dp_sdiq_rf_rdy_clr,
  dp_sdiq_rf_sdiq_entry,
  dp_sdiq_rf_staddr1_vld,
  dp_sdiq_rf_staddr_rdy_clr,
  dp_sdiq_rf_stdata1_vld,
  dp_xx_rf_pipe0_dst_preg_dupx,
  dp_xx_rf_pipe1_dst_preg_dupx,
  forever_cpuclk,
  idu_rtu_pst_freg_dealloc_mask,
  idu_rtu_pst_preg_dealloc_mask,
  idu_rtu_pst_vreg_dealloc_mask,
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
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dupx,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx,
  lsu_idu_dc_pipe3_load_inst_vld_dupx,
  lsu_idu_dc_pipe3_preg_dupx,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dupx,
  lsu_idu_dc_pipe3_vreg_dupx,
  lsu_idu_dc_sdiq_entry,
  lsu_idu_dc_staddr1_vld,
  lsu_idu_dc_staddr_unalign,
  lsu_idu_dc_staddr_vld,
  lsu_idu_ex1_sdiq_entry,
  lsu_idu_ex1_sdiq_frz_clr,
  lsu_idu_ex1_sdiq_pop_vld,
  lsu_idu_wb_pipe3_wb_preg_dupx,
  lsu_idu_wb_pipe3_wb_preg_vld_dupx,
  lsu_idu_wb_pipe3_wb_vreg_dupx,
  lsu_idu_wb_pipe3_wb_vreg_vld_dupx,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  sdiq_aiq_create0_entry,
  sdiq_aiq_create1_entry,
  sdiq_ctrl_1_left_updt,
  sdiq_ctrl_empty,
  sdiq_ctrl_full,
  sdiq_ctrl_full_updt,
  sdiq_ctrl_full_updt_clk_en,
  sdiq_dp_create0_entry,
  sdiq_dp_create1_entry,
  sdiq_dp_issue_entry,
  sdiq_dp_issue_read_data,
  sdiq_top_sdiq_entry_cnt,
  sdiq_xx_gateclk_issue_en,
  sdiq_xx_issue_en,
  vfpu_idu_ex1_pipe6_data_vld_dupx,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe6_preg_dupx,
  vfpu_idu_ex1_pipe6_vreg_dupx,
  vfpu_idu_ex1_pipe7_data_vld_dupx,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx,
  vfpu_idu_ex1_pipe7_preg_dupx,
  vfpu_idu_ex1_pipe7_vreg_dupx,
  vfpu_idu_ex2_pipe6_data_vld_dupx,
  vfpu_idu_ex2_pipe6_vreg_dupx,
  vfpu_idu_ex2_pipe7_data_vld_dupx,
  vfpu_idu_ex2_pipe7_vreg_dupx,
  vfpu_idu_ex3_pipe6_data_vld_dupx,
  vfpu_idu_ex3_pipe6_vreg_dupx,
  vfpu_idu_ex3_pipe7_data_vld_dupx,
  vfpu_idu_ex3_pipe7_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_dupx,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_dupx,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx
);

// &Ports; @27
input           cp0_idu_icg_en;                         
input           cp0_yy_clk_en;                          
input           cpurst_b;                               
input           ctrl_sdiq_create0_dp_en;                
input           ctrl_sdiq_create0_en;                   
input           ctrl_sdiq_create0_gateclk_en;           
input           ctrl_sdiq_create1_dp_en;                
input           ctrl_sdiq_create1_en;                   
input           ctrl_sdiq_create1_gateclk_en;           
input           ctrl_sdiq_rf_lch_fail_vld;              
input   [11:0]  ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld;     
input   [11:0]  ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld;     
input           ctrl_sdiq_rf_staddr_rdy_set;            
input           ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
input           ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
input   [26:0]  dp_sdiq_create0_data;                   
input   [26:0]  dp_sdiq_create1_data;                   
input   [11:0]  dp_sdiq_rf_lch_entry;                   
input   [1 :0]  dp_sdiq_rf_rdy_clr;                     
input   [11:0]  dp_sdiq_rf_sdiq_entry;                  
input           dp_sdiq_rf_staddr1_vld;                 
input           dp_sdiq_rf_staddr_rdy_clr;              
input           dp_sdiq_rf_stdata1_vld;                 
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
input           lsu_idu_ag_pipe3_vload_inst_vld;        
input   [6 :0]  lsu_idu_ag_pipe3_vreg_dupx;             
input           lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
input           lsu_idu_dc_pipe3_load_inst_vld_dupx;    
input   [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
input           lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
input           lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
input   [6 :0]  lsu_idu_dc_pipe3_vreg_dupx;             
input   [11:0]  lsu_idu_dc_sdiq_entry;                  
input           lsu_idu_dc_staddr1_vld;                 
input           lsu_idu_dc_staddr_unalign;              
input           lsu_idu_dc_staddr_vld;                  
input   [11:0]  lsu_idu_ex1_sdiq_entry;                 
input           lsu_idu_ex1_sdiq_frz_clr;               
input           lsu_idu_ex1_sdiq_pop_vld;               
input   [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
input           lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
input   [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
input           lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
input           pad_yy_icg_scan_en;                     
input           rtu_yy_xx_flush;                        
input           vfpu_idu_ex1_pipe6_data_vld_dupx;       
input           vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
input   [6 :0]  vfpu_idu_ex1_pipe6_vreg_dupx;           
input           vfpu_idu_ex1_pipe7_data_vld_dupx;       
input           vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
input   [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
input   [6 :0]  vfpu_idu_ex1_pipe7_vreg_dupx;           
input           vfpu_idu_ex2_pipe6_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex2_pipe6_vreg_dupx;           
input           vfpu_idu_ex2_pipe7_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex2_pipe7_vreg_dupx;           
input           vfpu_idu_ex3_pipe6_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex3_pipe6_vreg_dupx;           
input           vfpu_idu_ex3_pipe7_data_vld_dupx;       
input   [6 :0]  vfpu_idu_ex3_pipe7_vreg_dupx;           
input   [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
input           vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
input   [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
input           vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    
output  [63:0]  idu_rtu_pst_freg_dealloc_mask;          
output  [95:0]  idu_rtu_pst_preg_dealloc_mask;          
output  [63:0]  idu_rtu_pst_vreg_dealloc_mask;          
output  [11:0]  sdiq_aiq_create0_entry;                 
output  [11:0]  sdiq_aiq_create1_entry;                 
output          sdiq_ctrl_1_left_updt;                  
output          sdiq_ctrl_empty;                        
output          sdiq_ctrl_full;                         
output          sdiq_ctrl_full_updt;                    
output          sdiq_ctrl_full_updt_clk_en;             
output  [11:0]  sdiq_dp_create0_entry;                  
output  [11:0]  sdiq_dp_create1_entry;                  
output  [11:0]  sdiq_dp_issue_entry;                    
output  [26:0]  sdiq_dp_issue_read_data;                
output  [3 :0]  sdiq_top_sdiq_entry_cnt;                
output          sdiq_xx_gateclk_issue_en;               
output          sdiq_xx_issue_en;                       

// &Regs; @28
reg     [10:0]  sdiq_entry0_create_agevec;              
reg     [26:0]  sdiq_entry0_create_data;                
reg     [10:0]  sdiq_entry10_create_agevec;             
reg     [26:0]  sdiq_entry10_create_data;               
reg     [10:0]  sdiq_entry11_create_agevec;             
reg     [26:0]  sdiq_entry11_create_data;               
reg     [10:0]  sdiq_entry1_create_agevec;              
reg     [26:0]  sdiq_entry1_create_data;                
reg     [10:0]  sdiq_entry2_create_agevec;              
reg     [26:0]  sdiq_entry2_create_data;                
reg     [10:0]  sdiq_entry3_create_agevec;              
reg     [26:0]  sdiq_entry3_create_data;                
reg     [10:0]  sdiq_entry4_create_agevec;              
reg     [26:0]  sdiq_entry4_create_data;                
reg     [10:0]  sdiq_entry5_create_agevec;              
reg     [26:0]  sdiq_entry5_create_data;                
reg     [10:0]  sdiq_entry6_create_agevec;              
reg     [26:0]  sdiq_entry6_create_data;                
reg     [10:0]  sdiq_entry7_create_agevec;              
reg     [26:0]  sdiq_entry7_create_data;                
reg     [10:0]  sdiq_entry8_create_agevec;              
reg     [26:0]  sdiq_entry8_create_data;                
reg     [10:0]  sdiq_entry9_create_agevec;              
reg     [26:0]  sdiq_entry9_create_data;                
reg     [3 :0]  sdiq_entry_cnt;                         
reg     [11:0]  sdiq_entry_create0_in;                  
reg     [11:0]  sdiq_entry_create1_in;                  
reg     [26:0]  sdiq_entry_read_data;                   
reg     [95:0]  sdiq_src0_preg_dealloc_mask;            
reg             sdiq_src_reg_mask_update_vld_ff;        
reg     [63:0]  sdiq_srcf_freg_dealloc_mask;            
reg     [63:0]  sdiq_srcv_vreg_dealloc_mask;            

// &Wires; @29
wire            cnt_clk;                                
wire            cnt_clk_en;                             
wire            cp0_idu_icg_en;                         
wire            cp0_yy_clk_en;                          
wire            cpurst_b;                               
wire            ctrl_sdiq_create0_dp_en;                
wire            ctrl_sdiq_create0_en;                   
wire            ctrl_sdiq_create0_gateclk_en;           
wire            ctrl_sdiq_create1_dp_en;                
wire            ctrl_sdiq_create1_en;                   
wire            ctrl_sdiq_create1_gateclk_en;           
wire            ctrl_sdiq_rf_lch_fail_vld;              
wire    [11:0]  ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld;     
wire    [11:0]  ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld;     
wire            ctrl_sdiq_rf_staddr_rdy_set;            
wire            ctrl_xx_rf_pipe0_preg_lch_vld_dupx;     
wire            ctrl_xx_rf_pipe1_preg_lch_vld_dupx;     
wire    [26:0]  dp_sdiq_create0_data;                   
wire    [26:0]  dp_sdiq_create1_data;                   
wire    [11:0]  dp_sdiq_rf_lch_entry;                   
wire    [1 :0]  dp_sdiq_rf_rdy_clr;                     
wire    [11:0]  dp_sdiq_rf_sdiq_entry;                  
wire            dp_sdiq_rf_staddr1_vld;                 
wire            dp_sdiq_rf_staddr_rdy_clr;              
wire            dp_sdiq_rf_stdata1_vld;                 
wire    [6 :0]  dp_xx_rf_pipe0_dst_preg_dupx;           
wire    [6 :0]  dp_xx_rf_pipe1_dst_preg_dupx;           
wire            forever_cpuclk;                         
wire    [63:0]  idu_rtu_pst_freg_dealloc_mask;          
wire    [95:0]  idu_rtu_pst_preg_dealloc_mask;          
wire    [63:0]  idu_rtu_pst_vreg_dealloc_mask;          
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
wire            lsu_idu_ag_pipe3_vload_inst_vld;        
wire    [6 :0]  lsu_idu_ag_pipe3_vreg_dupx;             
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx; 
wire            lsu_idu_dc_pipe3_load_inst_vld_dupx;    
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dupx;             
wire            lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
wire            lsu_idu_dc_pipe3_vload_inst_vld_dupx;   
wire    [6 :0]  lsu_idu_dc_pipe3_vreg_dupx;             
wire    [11:0]  lsu_idu_dc_sdiq_entry;                  
wire            lsu_idu_dc_staddr1_vld;                 
wire            lsu_idu_dc_staddr_unalign;              
wire            lsu_idu_dc_staddr_vld;                  
wire    [11:0]  lsu_idu_ex1_sdiq_entry;                 
wire            lsu_idu_ex1_sdiq_frz_clr;               
wire            lsu_idu_ex1_sdiq_pop_vld;               
wire    [6 :0]  lsu_idu_wb_pipe3_wb_preg_dupx;          
wire            lsu_idu_wb_pipe3_wb_preg_vld_dupx;      
wire    [6 :0]  lsu_idu_wb_pipe3_wb_vreg_dupx;          
wire            lsu_idu_wb_pipe3_wb_vreg_vld_dupx;      
wire            pad_yy_icg_scan_en;                     
wire            rtu_yy_xx_flush;                        
wire    [11:0]  sdiq_aiq_create0_entry;                 
wire    [11:0]  sdiq_aiq_create1_entry;                 
wire            sdiq_ctrl_1_left_updt;                  
wire            sdiq_ctrl_empty;                        
wire            sdiq_ctrl_full;                         
wire            sdiq_ctrl_full_updt;                    
wire            sdiq_ctrl_full_updt_clk_en;             
wire    [11:0]  sdiq_dp_create0_entry;                  
wire    [11:0]  sdiq_dp_create1_entry;                  
wire    [11:0]  sdiq_dp_issue_entry;                    
wire    [26:0]  sdiq_dp_issue_read_data;                
wire    [10:0]  sdiq_entry0_agevec;                     
wire            sdiq_entry0_alu0_reg_fwd_vld;           
wire            sdiq_entry0_alu1_reg_fwd_vld;           
wire            sdiq_entry0_create_dp_en;               
wire            sdiq_entry0_create_en;                  
wire            sdiq_entry0_create_gateclk_en;          
wire            sdiq_entry0_ex1_frz_clr;                
wire            sdiq_entry0_issue_en;                   
wire            sdiq_entry0_pop_cur_entry;              
wire    [10:0]  sdiq_entry0_pop_other_entry;            
wire            sdiq_entry0_rdy;                        
wire    [26:0]  sdiq_entry0_read_data;                  
wire            sdiq_entry0_rf_frz_clr;                 
wire    [95:0]  sdiq_entry0_src0_preg_expand;           
wire    [63:0]  sdiq_entry0_srcf_freg_expand;           
wire    [63:0]  sdiq_entry0_srcv_vreg_expand;           
wire            sdiq_entry0_staddr_rdy_set;             
wire            sdiq_entry0_staddr_stq_create;          
wire            sdiq_entry0_vld;                        
wire            sdiq_entry0_vld_with_frz;               
wire    [10:0]  sdiq_entry10_agevec;                    
wire            sdiq_entry10_alu0_reg_fwd_vld;          
wire            sdiq_entry10_alu1_reg_fwd_vld;          
wire            sdiq_entry10_create_dp_en;              
wire            sdiq_entry10_create_en;                 
wire            sdiq_entry10_create_gateclk_en;         
wire            sdiq_entry10_ex1_frz_clr;               
wire            sdiq_entry10_issue_en;                  
wire            sdiq_entry10_pop_cur_entry;             
wire    [10:0]  sdiq_entry10_pop_other_entry;           
wire            sdiq_entry10_rdy;                       
wire    [26:0]  sdiq_entry10_read_data;                 
wire            sdiq_entry10_rf_frz_clr;                
wire    [95:0]  sdiq_entry10_src0_preg_expand;          
wire    [63:0]  sdiq_entry10_srcf_freg_expand;          
wire    [63:0]  sdiq_entry10_srcv_vreg_expand;          
wire            sdiq_entry10_staddr_rdy_set;            
wire            sdiq_entry10_staddr_stq_create;         
wire            sdiq_entry10_vld;                       
wire            sdiq_entry10_vld_with_frz;              
wire    [10:0]  sdiq_entry11_agevec;                    
wire            sdiq_entry11_alu0_reg_fwd_vld;          
wire            sdiq_entry11_alu1_reg_fwd_vld;          
wire            sdiq_entry11_create_dp_en;              
wire            sdiq_entry11_create_en;                 
wire            sdiq_entry11_create_gateclk_en;         
wire            sdiq_entry11_ex1_frz_clr;               
wire            sdiq_entry11_issue_en;                  
wire            sdiq_entry11_pop_cur_entry;             
wire    [10:0]  sdiq_entry11_pop_other_entry;           
wire            sdiq_entry11_rdy;                       
wire    [26:0]  sdiq_entry11_read_data;                 
wire            sdiq_entry11_rf_frz_clr;                
wire    [95:0]  sdiq_entry11_src0_preg_expand;          
wire    [63:0]  sdiq_entry11_srcf_freg_expand;          
wire    [63:0]  sdiq_entry11_srcv_vreg_expand;          
wire            sdiq_entry11_staddr_rdy_set;            
wire            sdiq_entry11_staddr_stq_create;         
wire            sdiq_entry11_vld;                       
wire            sdiq_entry11_vld_with_frz;              
wire    [10:0]  sdiq_entry1_agevec;                     
wire            sdiq_entry1_alu0_reg_fwd_vld;           
wire            sdiq_entry1_alu1_reg_fwd_vld;           
wire            sdiq_entry1_create_dp_en;               
wire            sdiq_entry1_create_en;                  
wire            sdiq_entry1_create_gateclk_en;          
wire            sdiq_entry1_ex1_frz_clr;                
wire            sdiq_entry1_issue_en;                   
wire            sdiq_entry1_pop_cur_entry;              
wire    [10:0]  sdiq_entry1_pop_other_entry;            
wire            sdiq_entry1_rdy;                        
wire    [26:0]  sdiq_entry1_read_data;                  
wire            sdiq_entry1_rf_frz_clr;                 
wire    [95:0]  sdiq_entry1_src0_preg_expand;           
wire    [63:0]  sdiq_entry1_srcf_freg_expand;           
wire    [63:0]  sdiq_entry1_srcv_vreg_expand;           
wire            sdiq_entry1_staddr_rdy_set;             
wire            sdiq_entry1_staddr_stq_create;          
wire            sdiq_entry1_vld;                        
wire            sdiq_entry1_vld_with_frz;               
wire    [10:0]  sdiq_entry2_agevec;                     
wire            sdiq_entry2_alu0_reg_fwd_vld;           
wire            sdiq_entry2_alu1_reg_fwd_vld;           
wire            sdiq_entry2_create_dp_en;               
wire            sdiq_entry2_create_en;                  
wire            sdiq_entry2_create_gateclk_en;          
wire            sdiq_entry2_ex1_frz_clr;                
wire            sdiq_entry2_issue_en;                   
wire            sdiq_entry2_pop_cur_entry;              
wire    [10:0]  sdiq_entry2_pop_other_entry;            
wire            sdiq_entry2_rdy;                        
wire    [26:0]  sdiq_entry2_read_data;                  
wire            sdiq_entry2_rf_frz_clr;                 
wire    [95:0]  sdiq_entry2_src0_preg_expand;           
wire    [63:0]  sdiq_entry2_srcf_freg_expand;           
wire    [63:0]  sdiq_entry2_srcv_vreg_expand;           
wire            sdiq_entry2_staddr_rdy_set;             
wire            sdiq_entry2_staddr_stq_create;          
wire            sdiq_entry2_vld;                        
wire            sdiq_entry2_vld_with_frz;               
wire    [10:0]  sdiq_entry3_agevec;                     
wire            sdiq_entry3_alu0_reg_fwd_vld;           
wire            sdiq_entry3_alu1_reg_fwd_vld;           
wire            sdiq_entry3_create_dp_en;               
wire            sdiq_entry3_create_en;                  
wire            sdiq_entry3_create_gateclk_en;          
wire            sdiq_entry3_ex1_frz_clr;                
wire            sdiq_entry3_issue_en;                   
wire            sdiq_entry3_pop_cur_entry;              
wire    [10:0]  sdiq_entry3_pop_other_entry;            
wire            sdiq_entry3_rdy;                        
wire    [26:0]  sdiq_entry3_read_data;                  
wire            sdiq_entry3_rf_frz_clr;                 
wire    [95:0]  sdiq_entry3_src0_preg_expand;           
wire    [63:0]  sdiq_entry3_srcf_freg_expand;           
wire    [63:0]  sdiq_entry3_srcv_vreg_expand;           
wire            sdiq_entry3_staddr_rdy_set;             
wire            sdiq_entry3_staddr_stq_create;          
wire            sdiq_entry3_vld;                        
wire            sdiq_entry3_vld_with_frz;               
wire    [10:0]  sdiq_entry4_agevec;                     
wire            sdiq_entry4_alu0_reg_fwd_vld;           
wire            sdiq_entry4_alu1_reg_fwd_vld;           
wire            sdiq_entry4_create_dp_en;               
wire            sdiq_entry4_create_en;                  
wire            sdiq_entry4_create_gateclk_en;          
wire            sdiq_entry4_ex1_frz_clr;                
wire            sdiq_entry4_issue_en;                   
wire            sdiq_entry4_pop_cur_entry;              
wire    [10:0]  sdiq_entry4_pop_other_entry;            
wire            sdiq_entry4_rdy;                        
wire    [26:0]  sdiq_entry4_read_data;                  
wire            sdiq_entry4_rf_frz_clr;                 
wire    [95:0]  sdiq_entry4_src0_preg_expand;           
wire    [63:0]  sdiq_entry4_srcf_freg_expand;           
wire    [63:0]  sdiq_entry4_srcv_vreg_expand;           
wire            sdiq_entry4_staddr_rdy_set;             
wire            sdiq_entry4_staddr_stq_create;          
wire            sdiq_entry4_vld;                        
wire            sdiq_entry4_vld_with_frz;               
wire    [10:0]  sdiq_entry5_agevec;                     
wire            sdiq_entry5_alu0_reg_fwd_vld;           
wire            sdiq_entry5_alu1_reg_fwd_vld;           
wire            sdiq_entry5_create_dp_en;               
wire            sdiq_entry5_create_en;                  
wire            sdiq_entry5_create_gateclk_en;          
wire            sdiq_entry5_ex1_frz_clr;                
wire            sdiq_entry5_issue_en;                   
wire            sdiq_entry5_pop_cur_entry;              
wire    [10:0]  sdiq_entry5_pop_other_entry;            
wire            sdiq_entry5_rdy;                        
wire    [26:0]  sdiq_entry5_read_data;                  
wire            sdiq_entry5_rf_frz_clr;                 
wire    [95:0]  sdiq_entry5_src0_preg_expand;           
wire    [63:0]  sdiq_entry5_srcf_freg_expand;           
wire    [63:0]  sdiq_entry5_srcv_vreg_expand;           
wire            sdiq_entry5_staddr_rdy_set;             
wire            sdiq_entry5_staddr_stq_create;          
wire            sdiq_entry5_vld;                        
wire            sdiq_entry5_vld_with_frz;               
wire    [10:0]  sdiq_entry6_agevec;                     
wire            sdiq_entry6_alu0_reg_fwd_vld;           
wire            sdiq_entry6_alu1_reg_fwd_vld;           
wire            sdiq_entry6_create_dp_en;               
wire            sdiq_entry6_create_en;                  
wire            sdiq_entry6_create_gateclk_en;          
wire            sdiq_entry6_ex1_frz_clr;                
wire            sdiq_entry6_issue_en;                   
wire            sdiq_entry6_pop_cur_entry;              
wire    [10:0]  sdiq_entry6_pop_other_entry;            
wire            sdiq_entry6_rdy;                        
wire    [26:0]  sdiq_entry6_read_data;                  
wire            sdiq_entry6_rf_frz_clr;                 
wire    [95:0]  sdiq_entry6_src0_preg_expand;           
wire    [63:0]  sdiq_entry6_srcf_freg_expand;           
wire    [63:0]  sdiq_entry6_srcv_vreg_expand;           
wire            sdiq_entry6_staddr_rdy_set;             
wire            sdiq_entry6_staddr_stq_create;          
wire            sdiq_entry6_vld;                        
wire            sdiq_entry6_vld_with_frz;               
wire    [10:0]  sdiq_entry7_agevec;                     
wire            sdiq_entry7_alu0_reg_fwd_vld;           
wire            sdiq_entry7_alu1_reg_fwd_vld;           
wire            sdiq_entry7_create_dp_en;               
wire            sdiq_entry7_create_en;                  
wire            sdiq_entry7_create_gateclk_en;          
wire            sdiq_entry7_ex1_frz_clr;                
wire            sdiq_entry7_issue_en;                   
wire            sdiq_entry7_pop_cur_entry;              
wire    [10:0]  sdiq_entry7_pop_other_entry;            
wire            sdiq_entry7_rdy;                        
wire    [26:0]  sdiq_entry7_read_data;                  
wire            sdiq_entry7_rf_frz_clr;                 
wire    [95:0]  sdiq_entry7_src0_preg_expand;           
wire    [63:0]  sdiq_entry7_srcf_freg_expand;           
wire    [63:0]  sdiq_entry7_srcv_vreg_expand;           
wire            sdiq_entry7_staddr_rdy_set;             
wire            sdiq_entry7_staddr_stq_create;          
wire            sdiq_entry7_vld;                        
wire            sdiq_entry7_vld_with_frz;               
wire    [10:0]  sdiq_entry8_agevec;                     
wire            sdiq_entry8_alu0_reg_fwd_vld;           
wire            sdiq_entry8_alu1_reg_fwd_vld;           
wire            sdiq_entry8_create_dp_en;               
wire            sdiq_entry8_create_en;                  
wire            sdiq_entry8_create_gateclk_en;          
wire            sdiq_entry8_ex1_frz_clr;                
wire            sdiq_entry8_issue_en;                   
wire            sdiq_entry8_pop_cur_entry;              
wire    [10:0]  sdiq_entry8_pop_other_entry;            
wire            sdiq_entry8_rdy;                        
wire    [26:0]  sdiq_entry8_read_data;                  
wire            sdiq_entry8_rf_frz_clr;                 
wire    [95:0]  sdiq_entry8_src0_preg_expand;           
wire    [63:0]  sdiq_entry8_srcf_freg_expand;           
wire    [63:0]  sdiq_entry8_srcv_vreg_expand;           
wire            sdiq_entry8_staddr_rdy_set;             
wire            sdiq_entry8_staddr_stq_create;          
wire            sdiq_entry8_vld;                        
wire            sdiq_entry8_vld_with_frz;               
wire    [10:0]  sdiq_entry9_agevec;                     
wire            sdiq_entry9_alu0_reg_fwd_vld;           
wire            sdiq_entry9_alu1_reg_fwd_vld;           
wire            sdiq_entry9_create_dp_en;               
wire            sdiq_entry9_create_en;                  
wire            sdiq_entry9_create_gateclk_en;          
wire            sdiq_entry9_ex1_frz_clr;                
wire            sdiq_entry9_issue_en;                   
wire            sdiq_entry9_pop_cur_entry;              
wire    [10:0]  sdiq_entry9_pop_other_entry;            
wire            sdiq_entry9_rdy;                        
wire    [26:0]  sdiq_entry9_read_data;                  
wire            sdiq_entry9_rf_frz_clr;                 
wire    [95:0]  sdiq_entry9_src0_preg_expand;           
wire    [63:0]  sdiq_entry9_srcf_freg_expand;           
wire    [63:0]  sdiq_entry9_srcv_vreg_expand;           
wire            sdiq_entry9_staddr_rdy_set;             
wire            sdiq_entry9_staddr_stq_create;          
wire            sdiq_entry9_vld;                        
wire            sdiq_entry9_vld_with_frz;               
wire    [3 :0]  sdiq_entry_cnt_create;                  
wire            sdiq_entry_cnt_create_0;                
wire            sdiq_entry_cnt_create_1;                
wire            sdiq_entry_cnt_create_2;                
wire    [3 :0]  sdiq_entry_cnt_pop;                     
wire            sdiq_entry_cnt_pop_0;                   
wire            sdiq_entry_cnt_pop_1;                   
wire    [3 :0]  sdiq_entry_cnt_updt_val;                
wire            sdiq_entry_cnt_updt_vld;                
wire    [11:0]  sdiq_entry_create0_agevec;              
wire    [11:0]  sdiq_entry_create1_agevec;              
wire    [11:0]  sdiq_entry_create_dp_en;                
wire    [11:0]  sdiq_entry_create_en;                   
wire    [11:0]  sdiq_entry_create_gateclk_en;           
wire    [11:0]  sdiq_entry_create_sel;                  
wire    [11:0]  sdiq_entry_ex1_frz_clr;                 
wire    [11:0]  sdiq_entry_issue_en;                    
wire    [11:0]  sdiq_entry_ready;                       
wire    [11:0]  sdiq_entry_rf_frz_clr;                  
wire    [11:0]  sdiq_entry_staddr_rdy_set;              
wire    [11:0]  sdiq_entry_staddr_stq_create;           
wire    [11:0]  sdiq_entry_vld;                         
wire    [11:0]  sdiq_older_entry_ready;                 
wire    [95:0]  sdiq_src0_preg_dealloc_mask_updt;       
wire            sdiq_src_reg_mask_update_vld;           
wire    [63:0]  sdiq_srcf_freg_dealloc_mask_updt;       
wire    [63:0]  sdiq_srcv_vreg_dealloc_mask_updt;       
wire    [3 :0]  sdiq_top_sdiq_entry_cnt;                
wire            sdiq_xx_gateclk_issue_en;               
wire            sdiq_xx_issue_en;                       
wire            src_mask_clk;                           
wire            src_mask_clk_en;                        
wire            vfpu_idu_ex1_pipe6_data_vld_dupx;       
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dupx;           
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dupx;           
wire            vfpu_idu_ex1_pipe7_data_vld_dupx;       
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx;  
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dupx;           
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dupx;           
wire            vfpu_idu_ex2_pipe6_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dupx;           
wire            vfpu_idu_ex2_pipe7_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dupx;           
wire            vfpu_idu_ex3_pipe6_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dupx;           
wire            vfpu_idu_ex3_pipe7_data_vld_dupx;       
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dupx;           
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dupx;        
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx;    
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dupx;        
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx;    


parameter SDIQ_WIDTH = 27;

//==========================================================
//            LSU Issue Queue Create Control
//==========================================================
//-------------------gated cell instance--------------------
assign cnt_clk_en = (sdiq_entry_cnt[3:0] != 4'b0)
                    || ctrl_sdiq_create0_gateclk_en
                    || ctrl_sdiq_create1_gateclk_en;
// &Instance("gated_clk_cell", "x_cnt_gated_clk"); @40
gated_clk_cell  x_cnt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cnt_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (cnt_clk_en        ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @41
//          .external_en (1'b0), @42
//          .global_en   (cp0_yy_clk_en), @43
//          .module_en   (cp0_idu_icg_en), @44
//          .local_en    (cnt_clk_en), @45
//          .clk_out     (cnt_clk)); @46

assign sdiq_ctrl_full_updt_clk_en = cnt_clk_en;

//--------------------sdiq entry counter--------------------
//if create, add entry counter
assign sdiq_entry_cnt_create[3:0]   = {3'b0,ctrl_sdiq_create0_en}
                                      + {3'b0,ctrl_sdiq_create1_en};
//if pop, sub entry counter
assign sdiq_entry_cnt_pop[3:0]      = {3'b0,lsu_idu_ex1_sdiq_pop_vld};
//update valid and value
assign sdiq_entry_cnt_updt_vld      = ctrl_sdiq_create0_en
                                      || lsu_idu_ex1_sdiq_pop_vld;
assign sdiq_entry_cnt_updt_val[3:0] = sdiq_entry_cnt[3:0]
                                      + sdiq_entry_cnt_create[3:0]
                                      - sdiq_entry_cnt_pop[3:0];
//implement entry counter
always @(posedge cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sdiq_entry_cnt[3:0] <= 4'b0;
  else if(rtu_yy_xx_flush)
    sdiq_entry_cnt[3:0] <= 4'b0;
  else if(sdiq_entry_cnt_updt_vld)
    sdiq_entry_cnt[3:0] <= sdiq_entry_cnt_updt_val[3:0];
  else
    sdiq_entry_cnt[3:0] <= sdiq_entry_cnt[3:0];
end

assign sdiq_ctrl_full               = (sdiq_entry_cnt[3:0] == 4'd12);

assign sdiq_top_sdiq_entry_cnt[3:0] = sdiq_entry_cnt[3:0];

//--------------------sdiq entry full-----------------------
assign sdiq_entry_cnt_create_2 =  ctrl_sdiq_create1_en;
assign sdiq_entry_cnt_create_1 =  ctrl_sdiq_create0_en && !ctrl_sdiq_create1_en;
assign sdiq_entry_cnt_create_0 = !ctrl_sdiq_create0_en;

assign sdiq_entry_cnt_pop_1    =  lsu_idu_ex1_sdiq_pop_vld;
assign sdiq_entry_cnt_pop_0    = !lsu_idu_ex1_sdiq_pop_vld;

assign sdiq_ctrl_full_updt     = (sdiq_entry_cnt[3:0] == 4'd10)
                                 && sdiq_entry_cnt_create_2
                                 && sdiq_entry_cnt_pop_0
                              || (sdiq_entry_cnt[3:0] == 4'd11)
                                 && sdiq_entry_cnt_create_1
                                 && sdiq_entry_cnt_pop_0
                              || (sdiq_entry_cnt[3:0] == 4'd12)
                                 && sdiq_entry_cnt_create_0
                                 && sdiq_entry_cnt_pop_0;

assign sdiq_ctrl_1_left_updt   = (sdiq_entry_cnt[3:0] == 4'd9)
                                 && sdiq_entry_cnt_create_2
                                 && sdiq_entry_cnt_pop_0
                              || (sdiq_entry_cnt[3:0] == 4'd10)
                                 && sdiq_entry_cnt_create_1
                                 && sdiq_entry_cnt_pop_0
                              || (sdiq_entry_cnt[3:0] == 4'd10)
                                 && sdiq_entry_cnt_create_2
                                 && sdiq_entry_cnt_pop_1
                              || (sdiq_entry_cnt[3:0] == 4'd11)
                                 && sdiq_entry_cnt_create_0
                                 && sdiq_entry_cnt_pop_0
                              || (sdiq_entry_cnt[3:0] == 4'd11)
                                 && sdiq_entry_cnt_create_1
                                 && sdiq_entry_cnt_pop_1
                              || (sdiq_entry_cnt[3:0] == 4'd12)
                                 && sdiq_entry_cnt_create_0
                                 && sdiq_entry_cnt_pop_1;

//assign sdiq_full_entry_cnt_updt_val[3:0] = (sdiq_entry_cnt_updt_vld)
//                                           ? sdiq_entry_cnt_updt_val[3:0]
//                                           : sdiq_entry_cnt[3:0];
//
//assign sdiq_ctrl_full_updt   = (sdiq_full_entry_cnt_updt_val[3:0] == 4'd12);
//assign sdiq_ctrl_1_left_updt = (sdiq_full_entry_cnt_updt_val[3:0] == 4'd11);

//-------------------sdiq create pointer--------------------
assign sdiq_dp_create0_entry[11:0] = sdiq_entry_create0_in[11:0];
assign sdiq_dp_create1_entry[11:0] = sdiq_entry_create1_in[11:0];

//stdata inst should wait for staddr launch, cannot bypass

assign sdiq_entry_vld[11:0] = 
         {sdiq_entry11_vld, sdiq_entry10_vld, sdiq_entry9_vld, sdiq_entry8_vld,
          sdiq_entry7_vld,  sdiq_entry6_vld,  sdiq_entry5_vld, sdiq_entry4_vld,
          sdiq_entry3_vld,  sdiq_entry2_vld,  sdiq_entry1_vld, sdiq_entry0_vld};

assign sdiq_ctrl_empty            = !(|sdiq_entry_vld[11:0]);

//create0 priority is from entry 0 to 11
// &CombBeg; @137
always @( sdiq_entry6_vld
       or sdiq_entry1_vld
       or sdiq_entry4_vld
       or sdiq_entry7_vld
       or sdiq_entry0_vld
       or sdiq_entry11_vld
       or sdiq_entry3_vld
       or sdiq_entry5_vld
       or sdiq_entry9_vld
       or sdiq_entry8_vld
       or sdiq_entry2_vld
       or sdiq_entry10_vld)
begin
  if(!sdiq_entry0_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_0000_0001;
  else if(!sdiq_entry1_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_0000_0010;
  else if(!sdiq_entry2_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_0000_0100;
  else if(!sdiq_entry3_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_0000_1000;
  else if(!sdiq_entry4_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_0001_0000;
  else if(!sdiq_entry5_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_0010_0000;
  else if(!sdiq_entry6_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_0100_0000;
  else if(!sdiq_entry7_vld)
    sdiq_entry_create0_in[11:0] = 12'b0000_1000_0000;
  else if(!sdiq_entry8_vld)
    sdiq_entry_create0_in[11:0] = 12'b0001_0000_0000;
  else if(!sdiq_entry9_vld)
    sdiq_entry_create0_in[11:0] = 12'b0010_0000_0000;
  else if(!sdiq_entry10_vld)
    sdiq_entry_create0_in[11:0] = 12'b0100_0000_0000;
  else if(!sdiq_entry11_vld)
    sdiq_entry_create0_in[11:0] = 12'b1000_0000_0000;
  else
    sdiq_entry_create0_in[11:0] = 12'b0000_0000_0000;
// &CombEnd; @164
end
//create1 priority is from entry 11 to 0
// &CombBeg; @166
always @( sdiq_entry6_vld
       or sdiq_entry4_vld
       or sdiq_entry1_vld
       or sdiq_entry7_vld
       or sdiq_entry0_vld
       or sdiq_entry11_vld
       or sdiq_entry3_vld
       or sdiq_entry5_vld
       or sdiq_entry9_vld
       or sdiq_entry8_vld
       or sdiq_entry2_vld
       or sdiq_entry10_vld)
begin
  if(!sdiq_entry11_vld)
    sdiq_entry_create1_in[11:0] = 12'b1000_0000_0000;
  else if(!sdiq_entry10_vld)
    sdiq_entry_create1_in[11:0] = 12'b0100_0000_0000;
  else if(!sdiq_entry9_vld)
    sdiq_entry_create1_in[11:0] = 12'b0010_0000_0000;
  else if(!sdiq_entry8_vld)
    sdiq_entry_create1_in[11:0] = 12'b0001_0000_0000;
  else if(!sdiq_entry7_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_1000_0000;
  else if(!sdiq_entry6_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_0100_0000;
  else if(!sdiq_entry5_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_0010_0000;
  else if(!sdiq_entry4_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_0001_0000;
  else if(!sdiq_entry3_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_0000_1000;
  else if(!sdiq_entry2_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_0000_0100;
  else if(!sdiq_entry1_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_0000_0010;
  else if(!sdiq_entry0_vld)
    sdiq_entry_create1_in[11:0] = 12'b0000_0000_0001;
  else
    sdiq_entry_create1_in[11:0] = 12'b0000_0000_0000;
// &CombEnd; @193
end

assign sdiq_aiq_create0_entry[11:0] = sdiq_entry_create0_in[11:0];
assign sdiq_aiq_create1_entry[11:0] = sdiq_entry_create1_in[11:0];

assign sdiq_entry_create_en[11:0] =
       {12{ctrl_sdiq_create0_en}} & sdiq_entry_create0_in[11:0]
     | {12{ctrl_sdiq_create1_en}} & sdiq_entry_create1_in[11:0];

assign sdiq_entry0_create_en  = sdiq_entry_create_en[0];
assign sdiq_entry1_create_en  = sdiq_entry_create_en[1];
assign sdiq_entry2_create_en  = sdiq_entry_create_en[2];
assign sdiq_entry3_create_en  = sdiq_entry_create_en[3];
assign sdiq_entry4_create_en  = sdiq_entry_create_en[4];
assign sdiq_entry5_create_en  = sdiq_entry_create_en[5];
assign sdiq_entry6_create_en  = sdiq_entry_create_en[6];
assign sdiq_entry7_create_en  = sdiq_entry_create_en[7];
assign sdiq_entry8_create_en  = sdiq_entry_create_en[8];
assign sdiq_entry9_create_en  = sdiq_entry_create_en[9];
assign sdiq_entry10_create_en = sdiq_entry_create_en[10];
assign sdiq_entry11_create_en = sdiq_entry_create_en[11];

//issue queue entry create data path control
assign sdiq_entry_create_dp_en[11:0] =
       {12{ctrl_sdiq_create0_dp_en}} & sdiq_entry_create0_in[11:0]
     | {12{ctrl_sdiq_create1_dp_en}} & sdiq_entry_create1_in[11:0];

assign sdiq_entry0_create_dp_en  = sdiq_entry_create_dp_en[0];
assign sdiq_entry1_create_dp_en  = sdiq_entry_create_dp_en[1];
assign sdiq_entry2_create_dp_en  = sdiq_entry_create_dp_en[2];
assign sdiq_entry3_create_dp_en  = sdiq_entry_create_dp_en[3];
assign sdiq_entry4_create_dp_en  = sdiq_entry_create_dp_en[4];
assign sdiq_entry5_create_dp_en  = sdiq_entry_create_dp_en[5];
assign sdiq_entry6_create_dp_en  = sdiq_entry_create_dp_en[6];
assign sdiq_entry7_create_dp_en  = sdiq_entry_create_dp_en[7];
assign sdiq_entry8_create_dp_en  = sdiq_entry_create_dp_en[8];
assign sdiq_entry9_create_dp_en  = sdiq_entry_create_dp_en[9];
assign sdiq_entry10_create_dp_en = sdiq_entry_create_dp_en[10];
assign sdiq_entry11_create_dp_en = sdiq_entry_create_dp_en[11];

//issue queue entry create gateclk control
//ignore bypass signal for timing optimization
assign sdiq_entry_create_gateclk_en[11:0] =
       {12{ctrl_sdiq_create0_gateclk_en}} & sdiq_entry_create0_in[11:0]
     | {12{ctrl_sdiq_create1_gateclk_en}} & sdiq_entry_create1_in[11:0];

assign sdiq_entry0_create_gateclk_en  = sdiq_entry_create_gateclk_en[0];
assign sdiq_entry1_create_gateclk_en  = sdiq_entry_create_gateclk_en[1];
assign sdiq_entry2_create_gateclk_en  = sdiq_entry_create_gateclk_en[2];
assign sdiq_entry3_create_gateclk_en  = sdiq_entry_create_gateclk_en[3];
assign sdiq_entry4_create_gateclk_en  = sdiq_entry_create_gateclk_en[4];
assign sdiq_entry5_create_gateclk_en  = sdiq_entry_create_gateclk_en[5];
assign sdiq_entry6_create_gateclk_en  = sdiq_entry_create_gateclk_en[6];
assign sdiq_entry7_create_gateclk_en  = sdiq_entry_create_gateclk_en[7];
assign sdiq_entry8_create_gateclk_en  = sdiq_entry_create_gateclk_en[8];
assign sdiq_entry9_create_gateclk_en  = sdiq_entry_create_gateclk_en[9];
assign sdiq_entry10_create_gateclk_en = sdiq_entry_create_gateclk_en[10];
assign sdiq_entry11_create_gateclk_en = sdiq_entry_create_gateclk_en[11];

//-------------------prepare create signals-----------------
//create 0 age vectors:
//1.existed entries
assign sdiq_entry_create0_agevec[11:0] = sdiq_entry_vld[11:0]
                                         & ~({12{lsu_idu_ex1_sdiq_pop_vld}}
                                            & lsu_idu_ex1_sdiq_entry[11:0]);
//create 1 age vectors:
//1.existed entries
//2.create 0 entry
assign sdiq_entry_create1_agevec[11:0] = sdiq_entry_vld[11:0]
                                         & ~({12{lsu_idu_ex1_sdiq_pop_vld}}
                                            & lsu_idu_ex1_sdiq_entry[11:0])
                                         | sdiq_entry_create0_in[11:0];
//create 0/1 select:
//entry 0~5 use ~sdiq_entry_create0_in for better timing
//entry 6~11 use sdiq_entry_create1_in for better timing
//sdiq_entry_create0/1_in cannot be both 1,
//if both 0, do not create
assign sdiq_entry_create_sel[11:6] = {6{ctrl_sdiq_create1_dp_en}}
                                     & sdiq_entry_create1_in[11:6];
assign sdiq_entry_create_sel[5:0]  = ~({6{ctrl_sdiq_create0_dp_en}}
                                      & sdiq_entry_create0_in[5:0]);

//----------------entry0 flop create signals----------------
// &CombBeg; @276
always @( sdiq_entry_create0_agevec[11:1]
       or dp_sdiq_create1_data[26:0]
       or sdiq_entry_create1_agevec[11:1]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create_sel[0])
begin
  if(!sdiq_entry_create_sel[0]) begin
    sdiq_entry0_create_agevec[10:0] = sdiq_entry_create0_agevec[11:1];
    sdiq_entry0_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry0_create_agevec[10:0] = sdiq_entry_create1_agevec[11:1];
    sdiq_entry0_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @287
end

//----------------entry1 flop create signals----------------
// &CombBeg; @290
always @( sdiq_entry_create_sel[1]
       or sdiq_entry_create0_agevec[0]
       or sdiq_entry_create1_agevec[11:2]
       or sdiq_entry_create1_agevec[0]
       or dp_sdiq_create1_data[26:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create0_agevec[11:2])
begin
  if(!sdiq_entry_create_sel[1]) begin
    sdiq_entry1_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:2],
                                       sdiq_entry_create0_agevec[0]};
    sdiq_entry1_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry1_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:2],
                                       sdiq_entry_create1_agevec[0]};
    sdiq_entry1_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @303
end

//----------------entry2 flop create signals----------------
// &CombBeg; @306
always @( dp_sdiq_create1_data[26:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create0_agevec[11:3]
       or sdiq_entry_create_sel[2]
       or sdiq_entry_create1_agevec[11:3]
       or sdiq_entry_create0_agevec[1:0]
       or sdiq_entry_create1_agevec[1:0])
begin
  if(!sdiq_entry_create_sel[2]) begin
    sdiq_entry2_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:3],
                                       sdiq_entry_create0_agevec[1:0]};
    sdiq_entry2_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry2_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:3],
                                       sdiq_entry_create1_agevec[1:0]};
    sdiq_entry2_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @319
end

//----------------entry3 flop create signals----------------
// &CombBeg; @322
always @( sdiq_entry_create1_agevec[2:0]
       or sdiq_entry_create0_agevec[2:0]
       or dp_sdiq_create1_data[26:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create0_agevec[11:4]
       or sdiq_entry_create_sel[3]
       or sdiq_entry_create1_agevec[11:4])
begin
  if(!sdiq_entry_create_sel[3]) begin
    sdiq_entry3_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:4],
                                       sdiq_entry_create0_agevec[2:0]};
    sdiq_entry3_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry3_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:4],
                                       sdiq_entry_create1_agevec[2:0]};
    sdiq_entry3_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @335
end

//----------------entry4 flop create signals----------------
// &CombBeg; @338
always @( sdiq_entry_create_sel[4]
       or dp_sdiq_create1_data[26:0]
       or sdiq_entry_create0_agevec[11:5]
       or sdiq_entry_create1_agevec[3:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create1_agevec[11:5]
       or sdiq_entry_create0_agevec[3:0])
begin
  if(!sdiq_entry_create_sel[4]) begin
    sdiq_entry4_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:5],
                                       sdiq_entry_create0_agevec[3:0]};
    sdiq_entry4_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry4_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:5],
                                       sdiq_entry_create1_agevec[3:0]};
    sdiq_entry4_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @351
end

//----------------entry5 flop create signals----------------
// &CombBeg; @354
always @( sdiq_entry_create1_agevec[11:6]
       or sdiq_entry_create0_agevec[4:0]
       or dp_sdiq_create1_data[26:0]
       or sdiq_entry_create0_agevec[11:6]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create_sel[5]
       or sdiq_entry_create1_agevec[4:0])
begin
  if(!sdiq_entry_create_sel[5]) begin
    sdiq_entry5_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:6],
                                       sdiq_entry_create0_agevec[4:0]};
    sdiq_entry5_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry5_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:6],
                                       sdiq_entry_create1_agevec[4:0]};
    sdiq_entry5_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @367
end

//----------------entry6 flop create signals----------------
// &CombBeg; @370
always @( sdiq_entry_create1_agevec[5:0]
       or dp_sdiq_create1_data[26:0]
       or sdiq_entry_create1_agevec[11:7]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create0_agevec[5:0]
       or sdiq_entry_create0_agevec[11:7]
       or sdiq_entry_create_sel[6])
begin
  if(!sdiq_entry_create_sel[6]) begin
    sdiq_entry6_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:7],
                                       sdiq_entry_create0_agevec[5:0]};
    sdiq_entry6_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry6_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:7],
                                       sdiq_entry_create1_agevec[5:0]};
    sdiq_entry6_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @383
end

//----------------entry7 flop create signals----------------
// &CombBeg; @386
always @( sdiq_entry_create1_agevec[6:0]
       or sdiq_entry_create_sel[7]
       or sdiq_entry_create0_agevec[11:8]
       or dp_sdiq_create1_data[26:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create0_agevec[6:0]
       or sdiq_entry_create1_agevec[11:8])
begin
  if(!sdiq_entry_create_sel[7]) begin
    sdiq_entry7_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:8],
                                       sdiq_entry_create0_agevec[6:0]};
    sdiq_entry7_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry7_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:8],
                                       sdiq_entry_create1_agevec[6:0]};
    sdiq_entry7_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @399
end

//----------------entry8 flop create signals----------------
// &CombBeg; @402
always @( sdiq_entry_create1_agevec[11:9]
       or sdiq_entry_create1_agevec[7:0]
       or dp_sdiq_create1_data[26:0]
       or sdiq_entry_create0_agevec[11:9]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create_sel[8]
       or sdiq_entry_create0_agevec[7:0])
begin
  if(!sdiq_entry_create_sel[8]) begin
    sdiq_entry8_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:9],
                                       sdiq_entry_create0_agevec[7:0]};
    sdiq_entry8_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry8_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:9],
                                       sdiq_entry_create1_agevec[7:0]};
    sdiq_entry8_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @415
end

//----------------entry9 flop create signals----------------
// &CombBeg; @418
always @( sdiq_entry_create1_agevec[8:0]
       or sdiq_entry_create0_agevec[8:0]
       or dp_sdiq_create1_data[26:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create_sel[9]
       or sdiq_entry_create0_agevec[11:10]
       or sdiq_entry_create1_agevec[11:10])
begin
  if(!sdiq_entry_create_sel[9]) begin
    sdiq_entry9_create_agevec[10:0] = {sdiq_entry_create0_agevec[11:10],
                                       sdiq_entry_create0_agevec[8:0]};
    sdiq_entry9_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry9_create_agevec[10:0] = {sdiq_entry_create1_agevec[11:10],
                                       sdiq_entry_create1_agevec[8:0]};
    sdiq_entry9_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @431
end

//---------------entry10 flop create signals----------------
// &CombBeg; @434
always @( sdiq_entry_create_sel[10]
       or sdiq_entry_create0_agevec[11]
       or dp_sdiq_create1_data[26:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create0_agevec[9:0]
       or sdiq_entry_create1_agevec[9:0]
       or sdiq_entry_create1_agevec[11])
begin
  if(!sdiq_entry_create_sel[10]) begin
    sdiq_entry10_create_agevec[10:0] = {sdiq_entry_create0_agevec[11],
                                        sdiq_entry_create0_agevec[9:0]};
    sdiq_entry10_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry10_create_agevec[10:0] = {sdiq_entry_create1_agevec[11],
                                        sdiq_entry_create1_agevec[9:0]};
    sdiq_entry10_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @447
end

//---------------entry11 flop create signals----------------
// &CombBeg; @450
always @( sdiq_entry_create_sel[11]
       or dp_sdiq_create1_data[26:0]
       or sdiq_entry_create1_agevec[10:0]
       or dp_sdiq_create0_data[26:0]
       or sdiq_entry_create0_agevec[10:0])
begin
  if(!sdiq_entry_create_sel[11]) begin
    sdiq_entry11_create_agevec[10:0] = sdiq_entry_create0_agevec[10:0];
    sdiq_entry11_create_data[SDIQ_WIDTH-1:0] =
       dp_sdiq_create0_data[SDIQ_WIDTH-1:0];
  end
  else begin
    sdiq_entry11_create_agevec[10:0] = sdiq_entry_create1_agevec[10:0];
    sdiq_entry11_create_data[SDIQ_WIDTH-1:0] = 
       dp_sdiq_create1_data[SDIQ_WIDTH-1:0];
  end
// &CombEnd; @461
end

//==========================================================
//             LSU Issue Queue Issue Control
//==========================================================
//----------------Pipe0 Launch Ready Signals----------------
assign sdiq_entry0_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[0];
assign sdiq_entry1_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[1];
assign sdiq_entry2_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[2];
assign sdiq_entry3_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[3];
assign sdiq_entry4_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[4];
assign sdiq_entry5_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[5];
assign sdiq_entry6_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[6];
assign sdiq_entry7_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[7];
assign sdiq_entry8_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[8];
assign sdiq_entry9_alu0_reg_fwd_vld  = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[9];
assign sdiq_entry10_alu0_reg_fwd_vld = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[10];
assign sdiq_entry11_alu0_reg_fwd_vld = ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[11];

assign sdiq_entry0_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[0];
assign sdiq_entry1_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[1];
assign sdiq_entry2_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[2];
assign sdiq_entry3_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[3];
assign sdiq_entry4_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[4];
assign sdiq_entry5_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[5];
assign sdiq_entry6_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[6];
assign sdiq_entry7_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[7];
assign sdiq_entry8_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[8];
assign sdiq_entry9_alu1_reg_fwd_vld  = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[9];
assign sdiq_entry10_alu1_reg_fwd_vld = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[10];
assign sdiq_entry11_alu1_reg_fwd_vld = ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[11];

//------------------issue prepare signals-------------------
assign sdiq_entry_ready[11:0] =
      {sdiq_entry11_rdy, sdiq_entry10_rdy, sdiq_entry9_rdy,
       sdiq_entry8_rdy,  sdiq_entry7_rdy,  sdiq_entry6_rdy,
       sdiq_entry5_rdy,  sdiq_entry4_rdy,  sdiq_entry3_rdy,
       sdiq_entry2_rdy,  sdiq_entry1_rdy,  sdiq_entry0_rdy};

//----------------older entry ready signals-----------------
assign sdiq_older_entry_ready[0]  = |(sdiq_entry0_agevec[10:0]
                                      & sdiq_entry_ready[11:1]);
assign sdiq_older_entry_ready[1]  = |(sdiq_entry1_agevec[10:0]
                                      & {sdiq_entry_ready[11:2],
                                          sdiq_entry_ready[0]});
assign sdiq_older_entry_ready[2]  = |(sdiq_entry2_agevec[10:0]
                                      & {sdiq_entry_ready[11:3],
                                          sdiq_entry_ready[1:0]});
assign sdiq_older_entry_ready[3]  = |(sdiq_entry3_agevec[10:0]
                                      & {sdiq_entry_ready[11:4],
                                          sdiq_entry_ready[2:0]});
assign sdiq_older_entry_ready[4]  = |(sdiq_entry4_agevec[10:0]
                                      & {sdiq_entry_ready[11:5],
                                          sdiq_entry_ready[3:0]});
assign sdiq_older_entry_ready[5]  = |(sdiq_entry5_agevec[10:0]
                                      & {sdiq_entry_ready[11:6],
                                          sdiq_entry_ready[4:0]});
assign sdiq_older_entry_ready[6]  = |(sdiq_entry6_agevec[10:0]
                                      & {sdiq_entry_ready[11:7],
                                          sdiq_entry_ready[5:0]});
assign sdiq_older_entry_ready[7]  = |(sdiq_entry7_agevec[10:0]
                                      & {sdiq_entry_ready[11:8],
                                          sdiq_entry_ready[6:0]});
assign sdiq_older_entry_ready[8]  = |(sdiq_entry8_agevec[10:0]
                                      & {sdiq_entry_ready[11:9],
                                          sdiq_entry_ready[7:0]});
assign sdiq_older_entry_ready[9]  = |(sdiq_entry9_agevec[10:0]
                                      & {sdiq_entry_ready[11:10],
                                          sdiq_entry_ready[8:0]});
assign sdiq_older_entry_ready[10] = |(sdiq_entry10_agevec[10:0]
                                      & {sdiq_entry_ready[11],
                                          sdiq_entry_ready[9:0]});
assign sdiq_older_entry_ready[11] = |(sdiq_entry11_agevec[10:0]
                                      & sdiq_entry_ready[10:0]);

//-----------entry issue enable signals for entries---------
//not ready if older ready exists
assign sdiq_entry_issue_en[11:0]  = sdiq_entry_ready[11:0]
                                    & ~sdiq_older_entry_ready[11:0];
//rename for entry
assign sdiq_entry0_issue_en       = sdiq_entry_issue_en[0];
assign sdiq_entry1_issue_en       = sdiq_entry_issue_en[1];
assign sdiq_entry2_issue_en       = sdiq_entry_issue_en[2];
assign sdiq_entry3_issue_en       = sdiq_entry_issue_en[3];
assign sdiq_entry4_issue_en       = sdiq_entry_issue_en[4];
assign sdiq_entry5_issue_en       = sdiq_entry_issue_en[5];
assign sdiq_entry6_issue_en       = sdiq_entry_issue_en[6];
assign sdiq_entry7_issue_en       = sdiq_entry_issue_en[7];
assign sdiq_entry8_issue_en       = sdiq_entry_issue_en[8];
assign sdiq_entry9_issue_en       = sdiq_entry_issue_en[9];
assign sdiq_entry10_issue_en      = sdiq_entry_issue_en[10];
assign sdiq_entry11_issue_en      = sdiq_entry_issue_en[11];

//---------------entry issue signals for rf pipes-----------
//issue enable signals:
//if bypass or ready entry exists
assign sdiq_xx_issue_en                = |sdiq_entry_ready[11:0];
//gate clock issue enable with timing optimization
assign sdiq_xx_gateclk_issue_en        = sdiq_entry0_vld_with_frz
                                         || sdiq_entry1_vld_with_frz
                                         || sdiq_entry2_vld_with_frz
                                         || sdiq_entry3_vld_with_frz
                                         || sdiq_entry4_vld_with_frz
                                         || sdiq_entry5_vld_with_frz
                                         || sdiq_entry6_vld_with_frz
                                         || sdiq_entry7_vld_with_frz
                                         || sdiq_entry8_vld_with_frz
                                         || sdiq_entry9_vld_with_frz
                                         || sdiq_entry10_vld_with_frz
                                         || sdiq_entry11_vld_with_frz;

//-----------------issue entry indiction--------------------
assign sdiq_dp_issue_entry[11:0]       = sdiq_entry_issue_en[11:0];

//-----------------issue data path selection----------------
//issue data path will select oldest ready entry in issue queue
//if no instruction valid, the data path will always select bypass 
//data path
// &CombBeg; @579
always @( sdiq_entry8_read_data[26:0]
       or sdiq_entry_issue_en[11:0]
       or sdiq_entry3_read_data[26:0]
       or sdiq_entry1_read_data[26:0]
       or sdiq_entry11_read_data[26:0]
       or sdiq_entry6_read_data[26:0]
       or sdiq_entry7_read_data[26:0]
       or sdiq_entry10_read_data[26:0]
       or sdiq_entry9_read_data[26:0]
       or sdiq_entry0_read_data[26:0]
       or sdiq_entry2_read_data[26:0]
       or sdiq_entry4_read_data[26:0]
       or sdiq_entry5_read_data[26:0])
begin
  case (sdiq_entry_issue_en[11:0])
    12'h001: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry0_read_data[SDIQ_WIDTH-1:0];
    12'h002: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry1_read_data[SDIQ_WIDTH-1:0];
    12'h004: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry2_read_data[SDIQ_WIDTH-1:0];
    12'h008: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry3_read_data[SDIQ_WIDTH-1:0];
    12'h010: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry4_read_data[SDIQ_WIDTH-1:0];
    12'h020: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry5_read_data[SDIQ_WIDTH-1:0];
    12'h040: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry6_read_data[SDIQ_WIDTH-1:0];
    12'h080: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry7_read_data[SDIQ_WIDTH-1:0];
    12'h100: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry8_read_data[SDIQ_WIDTH-1:0];
    12'h200: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry9_read_data[SDIQ_WIDTH-1:0];
    12'h400: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry10_read_data[SDIQ_WIDTH-1:0];
    12'h800: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
               sdiq_entry11_read_data[SDIQ_WIDTH-1:0];
    default: sdiq_entry_read_data[SDIQ_WIDTH-1:0] =
                                     {SDIQ_WIDTH{1'bx}};
  endcase
// &CombEnd; @608
end

//sdiq cannot bypass
assign sdiq_dp_issue_read_data[SDIQ_WIDTH-1:0] = 
         sdiq_entry_read_data[SDIQ_WIDTH-1:0];

//==========================================================
//            LSU Issue Queue Launch Control
//==========================================================
//-------------------entry pop enable signals---------------
//pop when rf launch pass
assign {sdiq_entry0_pop_other_entry[10:0],
        sdiq_entry0_pop_cur_entry}          = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry1_pop_other_entry[10:1],  
        sdiq_entry1_pop_cur_entry,
        sdiq_entry1_pop_other_entry[0]}     = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry2_pop_other_entry[10:2],  
        sdiq_entry2_pop_cur_entry,
        sdiq_entry2_pop_other_entry[1:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry3_pop_other_entry[10:3],  
        sdiq_entry3_pop_cur_entry,
        sdiq_entry3_pop_other_entry[2:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry4_pop_other_entry[10:4],  
        sdiq_entry4_pop_cur_entry,
        sdiq_entry4_pop_other_entry[3:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry5_pop_other_entry[10:5],  
        sdiq_entry5_pop_cur_entry,
        sdiq_entry5_pop_other_entry[4:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry6_pop_other_entry[10:6],  
        sdiq_entry6_pop_cur_entry,
        sdiq_entry6_pop_other_entry[5:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry7_pop_other_entry[10:7],  
        sdiq_entry7_pop_cur_entry,
        sdiq_entry7_pop_other_entry[6:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry8_pop_other_entry[10:8],  
        sdiq_entry8_pop_cur_entry,
        sdiq_entry8_pop_other_entry[7:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry9_pop_other_entry[10:9],  
        sdiq_entry9_pop_cur_entry,
        sdiq_entry9_pop_other_entry[8:0]}   = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry10_pop_other_entry[10],
        sdiq_entry10_pop_cur_entry,
        sdiq_entry10_pop_other_entry[9:0]}  = lsu_idu_ex1_sdiq_entry[11:0];
assign {sdiq_entry11_pop_cur_entry,
        sdiq_entry11_pop_other_entry[10:0]} = lsu_idu_ex1_sdiq_entry[11:0];

//-------------------entry spec fail signals---------------
//clear freeze and source rdy when launch fail
assign sdiq_entry_rf_frz_clr[11:0] = {12{ctrl_sdiq_rf_lch_fail_vld}}
                                     & dp_sdiq_rf_lch_entry[11:0];

assign sdiq_entry0_rf_frz_clr   = sdiq_entry_rf_frz_clr[0];
assign sdiq_entry1_rf_frz_clr   = sdiq_entry_rf_frz_clr[1];
assign sdiq_entry2_rf_frz_clr   = sdiq_entry_rf_frz_clr[2];
assign sdiq_entry3_rf_frz_clr   = sdiq_entry_rf_frz_clr[3];
assign sdiq_entry4_rf_frz_clr   = sdiq_entry_rf_frz_clr[4];
assign sdiq_entry5_rf_frz_clr   = sdiq_entry_rf_frz_clr[5];
assign sdiq_entry6_rf_frz_clr   = sdiq_entry_rf_frz_clr[6];
assign sdiq_entry7_rf_frz_clr   = sdiq_entry_rf_frz_clr[7];
assign sdiq_entry8_rf_frz_clr   = sdiq_entry_rf_frz_clr[8];
assign sdiq_entry9_rf_frz_clr   = sdiq_entry_rf_frz_clr[9];
assign sdiq_entry10_rf_frz_clr  = sdiq_entry_rf_frz_clr[10];
assign sdiq_entry11_rf_frz_clr  = sdiq_entry_rf_frz_clr[11];

//clear freeze and set stdata1 valid when stdata0 executing
assign sdiq_entry_ex1_frz_clr[11:0] = {12{lsu_idu_ex1_sdiq_frz_clr}}
                                      & lsu_idu_ex1_sdiq_entry[11:0];

assign sdiq_entry0_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[0];
assign sdiq_entry1_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[1];
assign sdiq_entry2_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[2];
assign sdiq_entry3_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[3];
assign sdiq_entry4_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[4];
assign sdiq_entry5_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[5];
assign sdiq_entry6_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[6];
assign sdiq_entry7_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[7];
assign sdiq_entry8_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[8];
assign sdiq_entry9_ex1_frz_clr  = sdiq_entry_ex1_frz_clr[9];
assign sdiq_entry10_ex1_frz_clr = sdiq_entry_ex1_frz_clr[10];
assign sdiq_entry11_ex1_frz_clr = sdiq_entry_ex1_frz_clr[11];

//----------------rf stage ready set signals---------------
//store address inst 0/1 set its staddr0/1_rdy at pipe4 RF stage
assign sdiq_entry_staddr_rdy_set[11:0] = {12{ctrl_sdiq_rf_staddr_rdy_set}}
                                         & dp_sdiq_rf_sdiq_entry[11:0];

assign sdiq_entry0_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[0];
assign sdiq_entry1_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[1];
assign sdiq_entry2_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[2];
assign sdiq_entry3_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[3];
assign sdiq_entry4_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[4];
assign sdiq_entry5_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[5];
assign sdiq_entry6_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[6];
assign sdiq_entry7_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[7];
assign sdiq_entry8_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[8];
assign sdiq_entry9_staddr_rdy_set  = sdiq_entry_staddr_rdy_set[9];
assign sdiq_entry10_staddr_rdy_set = sdiq_entry_staddr_rdy_set[10];
assign sdiq_entry11_staddr_rdy_set = sdiq_entry_staddr_rdy_set[11];

//------------dc stage store queue create signals----------
//store address inst 0/1 set its staddr0/1_stq_create at pipe4 DC stage
assign sdiq_entry_staddr_stq_create[11:0] = {12{lsu_idu_dc_staddr_vld}}
                                            & lsu_idu_dc_sdiq_entry[11:0];

assign sdiq_entry0_staddr_stq_create  = sdiq_entry_staddr_stq_create[0];
assign sdiq_entry1_staddr_stq_create  = sdiq_entry_staddr_stq_create[1];
assign sdiq_entry2_staddr_stq_create  = sdiq_entry_staddr_stq_create[2];
assign sdiq_entry3_staddr_stq_create  = sdiq_entry_staddr_stq_create[3];
assign sdiq_entry4_staddr_stq_create  = sdiq_entry_staddr_stq_create[4];
assign sdiq_entry5_staddr_stq_create  = sdiq_entry_staddr_stq_create[5];
assign sdiq_entry6_staddr_stq_create  = sdiq_entry_staddr_stq_create[6];
assign sdiq_entry7_staddr_stq_create  = sdiq_entry_staddr_stq_create[7];
assign sdiq_entry8_staddr_stq_create  = sdiq_entry_staddr_stq_create[8];
assign sdiq_entry9_staddr_stq_create  = sdiq_entry_staddr_stq_create[9];
assign sdiq_entry10_staddr_stq_create = sdiq_entry_staddr_stq_create[10];
assign sdiq_entry11_staddr_stq_create = sdiq_entry_staddr_stq_create[11];

//==========================================================
//            LSU Issue Queue Create Control
//==========================================================
//-------------------gated cell instance--------------------
assign src_mask_clk_en = sdiq_src_reg_mask_update_vld
                         || sdiq_src_reg_mask_update_vld_ff;
// &Instance("gated_clk_cell", "x_src_mask_gated_clk"); @731
gated_clk_cell  x_src_mask_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (src_mask_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (src_mask_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @732
//          .external_en (1'b0), @733
//          .global_en   (cp0_yy_clk_en), @734
//          .module_en   (cp0_idu_icg_en), @735
//          .local_en    (src_mask_clk_en), @736
//          .clk_out     (src_mask_clk)); @737

//--------------------sdiq src preg mask--------------------
assign sdiq_src_reg_mask_update_vld = rtu_yy_xx_flush
                                      || ctrl_sdiq_create0_gateclk_en
                                      || ctrl_sdiq_create1_gateclk_en
                                      || lsu_idu_ex1_sdiq_pop_vld;

always @(posedge src_mask_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sdiq_src_reg_mask_update_vld_ff <= 1'b0;
  else if(rtu_yy_xx_flush)
    sdiq_src_reg_mask_update_vld_ff <= 1'b0;
  else if(sdiq_src_reg_mask_update_vld)
    sdiq_src_reg_mask_update_vld_ff <= 1'b1;
  else
    sdiq_src_reg_mask_update_vld_ff <= 1'b0;
end

assign sdiq_src0_preg_dealloc_mask_updt[95:0] =
           sdiq_entry0_src0_preg_expand[95:0]
         | sdiq_entry1_src0_preg_expand[95:0]
         | sdiq_entry2_src0_preg_expand[95:0]
         | sdiq_entry3_src0_preg_expand[95:0]
         | sdiq_entry4_src0_preg_expand[95:0]
         | sdiq_entry5_src0_preg_expand[95:0]
         | sdiq_entry6_src0_preg_expand[95:0]
         | sdiq_entry7_src0_preg_expand[95:0]
         | sdiq_entry8_src0_preg_expand[95:0]
         | sdiq_entry9_src0_preg_expand[95:0]
         | sdiq_entry10_src0_preg_expand[95:0]
         | sdiq_entry11_src0_preg_expand[95:0];
assign sdiq_srcf_freg_dealloc_mask_updt[63:0] =
           sdiq_entry0_srcf_freg_expand[63:0]
         | sdiq_entry1_srcf_freg_expand[63:0]
         | sdiq_entry2_srcf_freg_expand[63:0]
         | sdiq_entry3_srcf_freg_expand[63:0]
         | sdiq_entry4_srcf_freg_expand[63:0]
         | sdiq_entry5_srcf_freg_expand[63:0]
         | sdiq_entry6_srcf_freg_expand[63:0]
         | sdiq_entry7_srcf_freg_expand[63:0]
         | sdiq_entry8_srcf_freg_expand[63:0]
         | sdiq_entry9_srcf_freg_expand[63:0]
         | sdiq_entry10_srcf_freg_expand[63:0]
         | sdiq_entry11_srcf_freg_expand[63:0];
assign sdiq_srcv_vreg_dealloc_mask_updt[63:0] =
           sdiq_entry0_srcv_vreg_expand[63:0]
         | sdiq_entry1_srcv_vreg_expand[63:0]
         | sdiq_entry2_srcv_vreg_expand[63:0]
         | sdiq_entry3_srcv_vreg_expand[63:0]
         | sdiq_entry4_srcv_vreg_expand[63:0]
         | sdiq_entry5_srcv_vreg_expand[63:0]
         | sdiq_entry6_srcv_vreg_expand[63:0]
         | sdiq_entry7_srcv_vreg_expand[63:0]
         | sdiq_entry8_srcv_vreg_expand[63:0]
         | sdiq_entry9_srcv_vreg_expand[63:0]
         | sdiq_entry10_srcv_vreg_expand[63:0]
         | sdiq_entry11_srcv_vreg_expand[63:0];

always @(posedge src_mask_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sdiq_src0_preg_dealloc_mask[95:0] <= 96'b0;
  else if(rtu_yy_xx_flush)
    sdiq_src0_preg_dealloc_mask[95:0] <= 96'b0;
  else if(sdiq_src_reg_mask_update_vld_ff)
    sdiq_src0_preg_dealloc_mask[95:0] <= sdiq_src0_preg_dealloc_mask_updt[95:0];
  else
    sdiq_src0_preg_dealloc_mask[95:0] <= sdiq_src0_preg_dealloc_mask[95:0];
end

assign idu_rtu_pst_preg_dealloc_mask[95:0] = sdiq_src0_preg_dealloc_mask[95:0];

always @(posedge src_mask_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sdiq_srcf_freg_dealloc_mask[63:0] <= 64'b0;
  else if(rtu_yy_xx_flush)
    sdiq_srcf_freg_dealloc_mask[63:0] <= 64'b0;
  else if(sdiq_src_reg_mask_update_vld_ff)
    sdiq_srcf_freg_dealloc_mask[63:0] <= sdiq_srcf_freg_dealloc_mask_updt[63:0];
  else
    sdiq_srcf_freg_dealloc_mask[63:0] <= sdiq_srcf_freg_dealloc_mask[63:0];
end

assign idu_rtu_pst_freg_dealloc_mask[63:0] = sdiq_srcf_freg_dealloc_mask[63:0];

always @(posedge src_mask_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    sdiq_srcv_vreg_dealloc_mask[63:0] <= 64'b0;
  else if(rtu_yy_xx_flush)
    sdiq_srcv_vreg_dealloc_mask[63:0] <= 64'b0;
  else if(sdiq_src_reg_mask_update_vld_ff)
    sdiq_srcv_vreg_dealloc_mask[63:0] <= sdiq_srcv_vreg_dealloc_mask_updt[63:0];
  else
    sdiq_srcv_vreg_dealloc_mask[63:0] <= sdiq_srcv_vreg_dealloc_mask[63:0];
end

assign idu_rtu_pst_vreg_dealloc_mask[63:0] = sdiq_srcv_vreg_dealloc_mask[63:0];

//==========================================================
//             LSU Issue Queue Entry Instance
//==========================================================
// &ConnRule(s/^x_/sdiq_entry0_/); @842
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry0"); @843
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry0 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry0_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry0_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry0_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry0_create_agevec              ),
  .x_create_data                           (sdiq_entry0_create_data                ),
  .x_create_dp_en                          (sdiq_entry0_create_dp_en               ),
  .x_create_en                             (sdiq_entry0_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry0_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry0_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry0_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry0_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry0_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry0_rdy                        ),
  .x_read_data                             (sdiq_entry0_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry0_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry0_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry0_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry0_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry0_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry0_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry0_vld                        ),
  .x_vld_with_frz                          (sdiq_entry0_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry1_/); @845
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry1"); @846
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry1 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry1_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry1_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry1_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry1_create_agevec              ),
  .x_create_data                           (sdiq_entry1_create_data                ),
  .x_create_dp_en                          (sdiq_entry1_create_dp_en               ),
  .x_create_en                             (sdiq_entry1_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry1_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry1_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry1_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry1_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry1_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry1_rdy                        ),
  .x_read_data                             (sdiq_entry1_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry1_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry1_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry1_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry1_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry1_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry1_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry1_vld                        ),
  .x_vld_with_frz                          (sdiq_entry1_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry2_/); @848
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry2"); @849
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry2 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry2_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry2_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry2_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry2_create_agevec              ),
  .x_create_data                           (sdiq_entry2_create_data                ),
  .x_create_dp_en                          (sdiq_entry2_create_dp_en               ),
  .x_create_en                             (sdiq_entry2_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry2_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry2_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry2_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry2_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry2_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry2_rdy                        ),
  .x_read_data                             (sdiq_entry2_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry2_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry2_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry2_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry2_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry2_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry2_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry2_vld                        ),
  .x_vld_with_frz                          (sdiq_entry2_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry3_/); @851
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry3"); @852
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry3 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry3_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry3_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry3_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry3_create_agevec              ),
  .x_create_data                           (sdiq_entry3_create_data                ),
  .x_create_dp_en                          (sdiq_entry3_create_dp_en               ),
  .x_create_en                             (sdiq_entry3_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry3_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry3_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry3_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry3_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry3_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry3_rdy                        ),
  .x_read_data                             (sdiq_entry3_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry3_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry3_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry3_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry3_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry3_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry3_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry3_vld                        ),
  .x_vld_with_frz                          (sdiq_entry3_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry4_/); @854
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry4"); @855
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry4 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry4_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry4_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry4_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry4_create_agevec              ),
  .x_create_data                           (sdiq_entry4_create_data                ),
  .x_create_dp_en                          (sdiq_entry4_create_dp_en               ),
  .x_create_en                             (sdiq_entry4_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry4_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry4_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry4_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry4_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry4_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry4_rdy                        ),
  .x_read_data                             (sdiq_entry4_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry4_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry4_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry4_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry4_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry4_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry4_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry4_vld                        ),
  .x_vld_with_frz                          (sdiq_entry4_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry5_/); @857
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry5"); @858
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry5 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry5_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry5_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry5_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry5_create_agevec              ),
  .x_create_data                           (sdiq_entry5_create_data                ),
  .x_create_dp_en                          (sdiq_entry5_create_dp_en               ),
  .x_create_en                             (sdiq_entry5_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry5_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry5_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry5_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry5_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry5_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry5_rdy                        ),
  .x_read_data                             (sdiq_entry5_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry5_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry5_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry5_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry5_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry5_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry5_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry5_vld                        ),
  .x_vld_with_frz                          (sdiq_entry5_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry6_/); @860
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry6"); @861
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry6 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry6_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry6_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry6_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry6_create_agevec              ),
  .x_create_data                           (sdiq_entry6_create_data                ),
  .x_create_dp_en                          (sdiq_entry6_create_dp_en               ),
  .x_create_en                             (sdiq_entry6_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry6_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry6_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry6_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry6_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry6_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry6_rdy                        ),
  .x_read_data                             (sdiq_entry6_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry6_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry6_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry6_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry6_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry6_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry6_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry6_vld                        ),
  .x_vld_with_frz                          (sdiq_entry6_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry7_/); @863
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry7"); @864
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry7 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry7_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry7_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry7_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry7_create_agevec              ),
  .x_create_data                           (sdiq_entry7_create_data                ),
  .x_create_dp_en                          (sdiq_entry7_create_dp_en               ),
  .x_create_en                             (sdiq_entry7_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry7_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry7_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry7_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry7_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry7_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry7_rdy                        ),
  .x_read_data                             (sdiq_entry7_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry7_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry7_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry7_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry7_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry7_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry7_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry7_vld                        ),
  .x_vld_with_frz                          (sdiq_entry7_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry8_/); @866
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry8"); @867
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry8 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry8_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry8_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry8_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry8_create_agevec              ),
  .x_create_data                           (sdiq_entry8_create_data                ),
  .x_create_dp_en                          (sdiq_entry8_create_dp_en               ),
  .x_create_en                             (sdiq_entry8_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry8_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry8_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry8_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry8_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry8_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry8_rdy                        ),
  .x_read_data                             (sdiq_entry8_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry8_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry8_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry8_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry8_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry8_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry8_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry8_vld                        ),
  .x_vld_with_frz                          (sdiq_entry8_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry9_/); @869
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry9"); @870
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry9 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry9_agevec                     ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry9_alu0_reg_fwd_vld           ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry9_alu1_reg_fwd_vld           ),
  .x_create_agevec                         (sdiq_entry9_create_agevec              ),
  .x_create_data                           (sdiq_entry9_create_data                ),
  .x_create_dp_en                          (sdiq_entry9_create_dp_en               ),
  .x_create_en                             (sdiq_entry9_create_en                  ),
  .x_create_gateclk_en                     (sdiq_entry9_create_gateclk_en          ),
  .x_ex1_frz_clr                           (sdiq_entry9_ex1_frz_clr                ),
  .x_issue_en                              (sdiq_entry9_issue_en                   ),
  .x_pop_cur_entry                         (sdiq_entry9_pop_cur_entry              ),
  .x_pop_other_entry                       (sdiq_entry9_pop_other_entry            ),
  .x_rdy                                   (sdiq_entry9_rdy                        ),
  .x_read_data                             (sdiq_entry9_read_data                  ),
  .x_rf_frz_clr                            (sdiq_entry9_rf_frz_clr                 ),
  .x_src0_preg_expand                      (sdiq_entry9_src0_preg_expand           ),
  .x_srcf_freg_expand                      (sdiq_entry9_srcf_freg_expand           ),
  .x_srcv_vreg_expand                      (sdiq_entry9_srcv_vreg_expand           ),
  .x_staddr_rdy_set                        (sdiq_entry9_staddr_rdy_set             ),
  .x_staddr_stq_create                     (sdiq_entry9_staddr_stq_create          ),
  .x_vld                                   (sdiq_entry9_vld                        ),
  .x_vld_with_frz                          (sdiq_entry9_vld_with_frz               )
);


// &ConnRule(s/^x_/sdiq_entry10_/); @872
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry10"); @873
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry10 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry10_agevec                    ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry10_alu0_reg_fwd_vld          ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry10_alu1_reg_fwd_vld          ),
  .x_create_agevec                         (sdiq_entry10_create_agevec             ),
  .x_create_data                           (sdiq_entry10_create_data               ),
  .x_create_dp_en                          (sdiq_entry10_create_dp_en              ),
  .x_create_en                             (sdiq_entry10_create_en                 ),
  .x_create_gateclk_en                     (sdiq_entry10_create_gateclk_en         ),
  .x_ex1_frz_clr                           (sdiq_entry10_ex1_frz_clr               ),
  .x_issue_en                              (sdiq_entry10_issue_en                  ),
  .x_pop_cur_entry                         (sdiq_entry10_pop_cur_entry             ),
  .x_pop_other_entry                       (sdiq_entry10_pop_other_entry           ),
  .x_rdy                                   (sdiq_entry10_rdy                       ),
  .x_read_data                             (sdiq_entry10_read_data                 ),
  .x_rf_frz_clr                            (sdiq_entry10_rf_frz_clr                ),
  .x_src0_preg_expand                      (sdiq_entry10_src0_preg_expand          ),
  .x_srcf_freg_expand                      (sdiq_entry10_srcf_freg_expand          ),
  .x_srcv_vreg_expand                      (sdiq_entry10_srcv_vreg_expand          ),
  .x_staddr_rdy_set                        (sdiq_entry10_staddr_rdy_set            ),
  .x_staddr_stq_create                     (sdiq_entry10_staddr_stq_create         ),
  .x_vld                                   (sdiq_entry10_vld                       ),
  .x_vld_with_frz                          (sdiq_entry10_vld_with_frz              )
);


// &ConnRule(s/^x_/sdiq_entry11_/); @875
// &Instance("ct_idu_is_sdiq_entry", "x_ct_idu_is_sdiq_entry11"); @876
ct_idu_is_sdiq_entry  x_ct_idu_is_sdiq_entry11 (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dupx     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dupx     ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
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
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dupx             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dupx    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dupx             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dupx   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dupx             ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dupx          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dupx      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dupx          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dupx      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dupx           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dupx           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dupx           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dupx           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dupx           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dupx           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dupx           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dupx       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dupx           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dupx        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx    ),
  .x_agevec                                (sdiq_entry11_agevec                    ),
  .x_alu0_reg_fwd_vld                      (sdiq_entry11_alu0_reg_fwd_vld          ),
  .x_alu1_reg_fwd_vld                      (sdiq_entry11_alu1_reg_fwd_vld          ),
  .x_create_agevec                         (sdiq_entry11_create_agevec             ),
  .x_create_data                           (sdiq_entry11_create_data               ),
  .x_create_dp_en                          (sdiq_entry11_create_dp_en              ),
  .x_create_en                             (sdiq_entry11_create_en                 ),
  .x_create_gateclk_en                     (sdiq_entry11_create_gateclk_en         ),
  .x_ex1_frz_clr                           (sdiq_entry11_ex1_frz_clr               ),
  .x_issue_en                              (sdiq_entry11_issue_en                  ),
  .x_pop_cur_entry                         (sdiq_entry11_pop_cur_entry             ),
  .x_pop_other_entry                       (sdiq_entry11_pop_other_entry           ),
  .x_rdy                                   (sdiq_entry11_rdy                       ),
  .x_read_data                             (sdiq_entry11_read_data                 ),
  .x_rf_frz_clr                            (sdiq_entry11_rf_frz_clr                ),
  .x_src0_preg_expand                      (sdiq_entry11_src0_preg_expand          ),
  .x_srcf_freg_expand                      (sdiq_entry11_srcf_freg_expand          ),
  .x_srcv_vreg_expand                      (sdiq_entry11_srcv_vreg_expand          ),
  .x_staddr_rdy_set                        (sdiq_entry11_staddr_rdy_set            ),
  .x_staddr_stq_create                     (sdiq_entry11_staddr_stq_create         ),
  .x_vld                                   (sdiq_entry11_vld                       ),
  .x_vld_with_frz                          (sdiq_entry11_vld_with_frz              )
);


// &ModuleEnd; @878
endmodule


