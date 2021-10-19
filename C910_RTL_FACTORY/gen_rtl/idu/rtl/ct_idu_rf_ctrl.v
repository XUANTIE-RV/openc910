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
module ct_idu_rf_ctrl(
  aiq0_xx_gateclk_issue_en,
  aiq0_xx_issue_en,
  aiq1_xx_gateclk_issue_en,
  aiq1_xx_issue_en,
  biq_xx_gateclk_issue_en,
  biq_xx_issue_en,
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_aiq0_rf_lch_fail_vld,
  ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld,
  ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld,
  ctrl_aiq0_rf_pop_dlb_vld,
  ctrl_aiq0_rf_pop_vld,
  ctrl_aiq0_stall,
  ctrl_aiq1_rf_lch_fail_vld,
  ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld,
  ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld,
  ctrl_aiq1_rf_pipe1_mla_reg_lch_vld,
  ctrl_aiq1_rf_pop_dlb_vld,
  ctrl_aiq1_rf_pop_vld,
  ctrl_aiq1_stall,
  ctrl_biq_rf_lch_fail_vld,
  ctrl_biq_rf_pipe0_alu_reg_fwd_vld,
  ctrl_biq_rf_pipe1_alu_reg_fwd_vld,
  ctrl_biq_rf_pop_vld,
  ctrl_dp_rf_pipe0_other_lch_fail,
  ctrl_dp_rf_pipe3_other_lch_fail,
  ctrl_dp_rf_pipe4_other_lch_fail,
  ctrl_dp_rf_pipe5_other_lch_fail,
  ctrl_dp_rf_pipe6_other_lch_fail,
  ctrl_dp_rf_pipe7_other_lch_fail,
  ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld,
  ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld,
  ctrl_lsiq_rf_pipe3_lch_fail_vld,
  ctrl_lsiq_rf_pipe4_lch_fail_vld,
  ctrl_sdiq_rf_lch_fail_vld,
  ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld,
  ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld,
  ctrl_sdiq_rf_staddr_rdy_set,
  ctrl_viq0_rf_lch_fail_vld,
  ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld,
  ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld,
  ctrl_viq0_rf_pop_dlb_vld,
  ctrl_viq0_rf_pop_vld,
  ctrl_viq0_stall,
  ctrl_viq1_rf_lch_fail_vld,
  ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld,
  ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld,
  ctrl_viq1_rf_pop_dlb_vld,
  ctrl_viq1_rf_pop_vld,
  ctrl_viq1_stall,
  ctrl_xx_rf_pipe0_preg_lch_vld_dup0,
  ctrl_xx_rf_pipe0_preg_lch_vld_dup1,
  ctrl_xx_rf_pipe0_preg_lch_vld_dup2,
  ctrl_xx_rf_pipe0_preg_lch_vld_dup3,
  ctrl_xx_rf_pipe0_preg_lch_vld_dup4,
  ctrl_xx_rf_pipe1_preg_lch_vld_dup0,
  ctrl_xx_rf_pipe1_preg_lch_vld_dup1,
  ctrl_xx_rf_pipe1_preg_lch_vld_dup2,
  ctrl_xx_rf_pipe1_preg_lch_vld_dup3,
  ctrl_xx_rf_pipe1_preg_lch_vld_dup4,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dup0,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dup1,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dup2,
  ctrl_xx_rf_pipe6_vmla_lch_vld_dup3,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dup0,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dup1,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dup2,
  ctrl_xx_rf_pipe7_vmla_lch_vld_dup3,
  dp_ctrl_is_aiq0_issue_alu_short,
  dp_ctrl_is_aiq0_issue_div,
  dp_ctrl_is_aiq0_issue_dst_vld,
  dp_ctrl_is_aiq0_issue_lch_preg,
  dp_ctrl_is_aiq0_issue_lch_rdy,
  dp_ctrl_is_aiq0_issue_special,
  dp_ctrl_is_aiq1_issue_alu_short,
  dp_ctrl_is_aiq1_issue_dst_vld,
  dp_ctrl_is_aiq1_issue_lch_preg,
  dp_ctrl_is_aiq1_issue_lch_rdy,
  dp_ctrl_is_aiq1_issue_mla_lch_rdy,
  dp_ctrl_is_aiq1_issue_mla_vld,
  dp_ctrl_is_viq0_issue_dstv_vld,
  dp_ctrl_is_viq0_issue_lch_rdy,
  dp_ctrl_is_viq0_issue_vdiv,
  dp_ctrl_is_viq0_issue_vmla_rf,
  dp_ctrl_is_viq0_issue_vmla_short,
  dp_ctrl_is_viq1_issue_dstv_vld,
  dp_ctrl_is_viq1_issue_lch_rdy,
  dp_ctrl_is_viq1_issue_vmla_rf,
  dp_ctrl_is_viq1_issue_vmla_short,
  dp_ctrl_rf_pipe0_eu_sel,
  dp_ctrl_rf_pipe0_mtvr,
  dp_ctrl_rf_pipe0_src2_vld,
  dp_ctrl_rf_pipe0_src_no_rdy,
  dp_ctrl_rf_pipe1_eu_sel,
  dp_ctrl_rf_pipe1_mtvr,
  dp_ctrl_rf_pipe1_src2_vld,
  dp_ctrl_rf_pipe1_src_no_rdy,
  dp_ctrl_rf_pipe2_src_no_rdy,
  dp_ctrl_rf_pipe3_src1_vld,
  dp_ctrl_rf_pipe3_src_no_rdy,
  dp_ctrl_rf_pipe3_srcvm_vld,
  dp_ctrl_rf_pipe4_src_no_rdy,
  dp_ctrl_rf_pipe4_srcvm_vld,
  dp_ctrl_rf_pipe4_staddr,
  dp_ctrl_rf_pipe5_src0_vld,
  dp_ctrl_rf_pipe5_src_no_rdy,
  dp_ctrl_rf_pipe6_mfvr,
  dp_ctrl_rf_pipe6_src_no_rdy,
  dp_ctrl_rf_pipe6_srcv2_vld,
  dp_ctrl_rf_pipe6_vmul,
  dp_ctrl_rf_pipe7_mfvr,
  dp_ctrl_rf_pipe7_src_no_rdy,
  dp_ctrl_rf_pipe7_srcv2_vld,
  dp_ctrl_rf_pipe7_vmul_unsplit,
  forever_cpuclk,
  hpcp_idu_cnt_en,
  idu_cp0_rf_gateclk_sel,
  idu_cp0_rf_sel,
  idu_hpcp_rf_inst_vld,
  idu_hpcp_rf_pipe0_inst_vld,
  idu_hpcp_rf_pipe0_lch_fail_vld,
  idu_hpcp_rf_pipe1_inst_vld,
  idu_hpcp_rf_pipe1_lch_fail_vld,
  idu_hpcp_rf_pipe2_inst_vld,
  idu_hpcp_rf_pipe2_lch_fail_vld,
  idu_hpcp_rf_pipe3_inst_vld,
  idu_hpcp_rf_pipe3_lch_fail_vld,
  idu_hpcp_rf_pipe3_reg_lch_fail_vld,
  idu_hpcp_rf_pipe4_inst_vld,
  idu_hpcp_rf_pipe4_lch_fail_vld,
  idu_hpcp_rf_pipe4_reg_lch_fail_vld,
  idu_hpcp_rf_pipe5_inst_vld,
  idu_hpcp_rf_pipe5_lch_fail_vld,
  idu_hpcp_rf_pipe5_reg_lch_fail_vld,
  idu_hpcp_rf_pipe6_inst_vld,
  idu_hpcp_rf_pipe6_lch_fail_vld,
  idu_hpcp_rf_pipe7_inst_vld,
  idu_hpcp_rf_pipe7_lch_fail_vld,
  idu_iu_is_div_gateclk_issue,
  idu_iu_is_div_issue,
  idu_iu_rf_bju_gateclk_sel,
  idu_iu_rf_bju_sel,
  idu_iu_rf_div_gateclk_sel,
  idu_iu_rf_div_sel,
  idu_iu_rf_mult_gateclk_sel,
  idu_iu_rf_mult_sel,
  idu_iu_rf_pipe0_cbus_gateclk_sel,
  idu_iu_rf_pipe0_gateclk_sel,
  idu_iu_rf_pipe0_sel,
  idu_iu_rf_pipe1_cbus_gateclk_sel,
  idu_iu_rf_pipe1_gateclk_sel,
  idu_iu_rf_pipe1_sel,
  idu_iu_rf_special_gateclk_sel,
  idu_iu_rf_special_sel,
  idu_lsu_rf_pipe3_gateclk_sel,
  idu_lsu_rf_pipe3_sel,
  idu_lsu_rf_pipe4_gateclk_sel,
  idu_lsu_rf_pipe4_sel,
  idu_lsu_rf_pipe5_gateclk_sel,
  idu_lsu_rf_pipe5_sel,
  idu_vfpu_is_vdiv_gateclk_issue,
  idu_vfpu_is_vdiv_issue,
  idu_vfpu_rf_pipe6_gateclk_sel,
  idu_vfpu_rf_pipe6_sel,
  idu_vfpu_rf_pipe7_gateclk_sel,
  idu_vfpu_rf_pipe7_sel,
  iu_idu_div_wb_stall,
  iu_idu_ex1_pipe1_mult_stall,
  lsiq_xx_gateclk_issue_en,
  lsiq_xx_pipe3_issue_en,
  lsiq_xx_pipe4_issue_en,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_yy_xx_flush,
  sdiq_xx_gateclk_issue_en,
  sdiq_xx_issue_en,
  vfpu_idu_vdiv_wb_stall,
  viq0_xx_gateclk_issue_en,
  viq0_xx_issue_en,
  viq1_xx_gateclk_issue_en,
  viq1_xx_issue_en
);

// &Ports; @28
input            aiq0_xx_gateclk_issue_en;                 
input            aiq0_xx_issue_en;                         
input            aiq1_xx_gateclk_issue_en;                 
input            aiq1_xx_issue_en;                         
input            biq_xx_gateclk_issue_en;                  
input            biq_xx_issue_en;                          
input            cp0_idu_icg_en;                           
input            cp0_yy_clk_en;                            
input            cpurst_b;                                 
input            dp_ctrl_is_aiq0_issue_alu_short;          
input            dp_ctrl_is_aiq0_issue_div;                
input            dp_ctrl_is_aiq0_issue_dst_vld;            
input            dp_ctrl_is_aiq0_issue_lch_preg;           
input   [107:0]  dp_ctrl_is_aiq0_issue_lch_rdy;            
input            dp_ctrl_is_aiq0_issue_special;            
input            dp_ctrl_is_aiq1_issue_alu_short;          
input            dp_ctrl_is_aiq1_issue_dst_vld;            
input            dp_ctrl_is_aiq1_issue_lch_preg;           
input   [107:0]  dp_ctrl_is_aiq1_issue_lch_rdy;            
input   [7  :0]  dp_ctrl_is_aiq1_issue_mla_lch_rdy;        
input            dp_ctrl_is_aiq1_issue_mla_vld;            
input            dp_ctrl_is_viq0_issue_dstv_vld;           
input   [15 :0]  dp_ctrl_is_viq0_issue_lch_rdy;            
input            dp_ctrl_is_viq0_issue_vdiv;               
input            dp_ctrl_is_viq0_issue_vmla_rf;            
input            dp_ctrl_is_viq0_issue_vmla_short;         
input            dp_ctrl_is_viq1_issue_dstv_vld;           
input   [15 :0]  dp_ctrl_is_viq1_issue_lch_rdy;            
input            dp_ctrl_is_viq1_issue_vmla_rf;            
input            dp_ctrl_is_viq1_issue_vmla_short;         
input   [3  :0]  dp_ctrl_rf_pipe0_eu_sel;                  
input            dp_ctrl_rf_pipe0_mtvr;                    
input            dp_ctrl_rf_pipe0_src2_vld;                
input            dp_ctrl_rf_pipe0_src_no_rdy;              
input   [1  :0]  dp_ctrl_rf_pipe1_eu_sel;                  
input            dp_ctrl_rf_pipe1_mtvr;                    
input            dp_ctrl_rf_pipe1_src2_vld;                
input            dp_ctrl_rf_pipe1_src_no_rdy;              
input            dp_ctrl_rf_pipe2_src_no_rdy;              
input            dp_ctrl_rf_pipe3_src1_vld;                
input            dp_ctrl_rf_pipe3_src_no_rdy;              
input            dp_ctrl_rf_pipe3_srcvm_vld;               
input            dp_ctrl_rf_pipe4_src_no_rdy;              
input            dp_ctrl_rf_pipe4_srcvm_vld;               
input            dp_ctrl_rf_pipe4_staddr;                  
input            dp_ctrl_rf_pipe5_src0_vld;                
input            dp_ctrl_rf_pipe5_src_no_rdy;              
input            dp_ctrl_rf_pipe6_mfvr;                    
input            dp_ctrl_rf_pipe6_src_no_rdy;              
input            dp_ctrl_rf_pipe6_srcv2_vld;               
input            dp_ctrl_rf_pipe6_vmul;                    
input            dp_ctrl_rf_pipe7_mfvr;                    
input            dp_ctrl_rf_pipe7_src_no_rdy;              
input            dp_ctrl_rf_pipe7_srcv2_vld;               
input            dp_ctrl_rf_pipe7_vmul_unsplit;            
input            forever_cpuclk;                           
input            hpcp_idu_cnt_en;                          
input            iu_idu_div_wb_stall;                      
input            iu_idu_ex1_pipe1_mult_stall;              
input            lsiq_xx_gateclk_issue_en;                 
input            lsiq_xx_pipe3_issue_en;                   
input            lsiq_xx_pipe4_issue_en;                   
input            pad_yy_icg_scan_en;                       
input            rtu_idu_flush_fe;                         
input            rtu_idu_flush_is;                         
input            rtu_yy_xx_flush;                          
input            sdiq_xx_gateclk_issue_en;                 
input            sdiq_xx_issue_en;                         
input            vfpu_idu_vdiv_wb_stall;                   
input            viq0_xx_gateclk_issue_en;                 
input            viq0_xx_issue_en;                         
input            viq1_xx_gateclk_issue_en;                 
input            viq1_xx_issue_en;                         
output           ctrl_aiq0_rf_lch_fail_vld;                
output  [23 :0]  ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld;       
output  [23 :0]  ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld;       
output           ctrl_aiq0_rf_pop_dlb_vld;                 
output           ctrl_aiq0_rf_pop_vld;                     
output           ctrl_aiq0_stall;                          
output           ctrl_aiq1_rf_lch_fail_vld;                
output  [23 :0]  ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld;       
output  [23 :0]  ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld;       
output  [7  :0]  ctrl_aiq1_rf_pipe1_mla_reg_lch_vld;       
output           ctrl_aiq1_rf_pop_dlb_vld;                 
output           ctrl_aiq1_rf_pop_vld;                     
output           ctrl_aiq1_stall;                          
output           ctrl_biq_rf_lch_fail_vld;                 
output  [23 :0]  ctrl_biq_rf_pipe0_alu_reg_fwd_vld;        
output  [23 :0]  ctrl_biq_rf_pipe1_alu_reg_fwd_vld;        
output           ctrl_biq_rf_pop_vld;                      
output           ctrl_dp_rf_pipe0_other_lch_fail;          
output           ctrl_dp_rf_pipe3_other_lch_fail;          
output           ctrl_dp_rf_pipe4_other_lch_fail;          
output           ctrl_dp_rf_pipe5_other_lch_fail;          
output           ctrl_dp_rf_pipe6_other_lch_fail;          
output           ctrl_dp_rf_pipe7_other_lch_fail;          
output  [23 :0]  ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld;       
output  [23 :0]  ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld;       
output           ctrl_lsiq_rf_pipe3_lch_fail_vld;          
output           ctrl_lsiq_rf_pipe4_lch_fail_vld;          
output           ctrl_sdiq_rf_lch_fail_vld;                
output  [11 :0]  ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld;       
output  [11 :0]  ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld;       
output           ctrl_sdiq_rf_staddr_rdy_set;              
output           ctrl_viq0_rf_lch_fail_vld;                
output  [7  :0]  ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld;     
output  [7  :0]  ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld;     
output           ctrl_viq0_rf_pop_dlb_vld;                 
output           ctrl_viq0_rf_pop_vld;                     
output           ctrl_viq0_stall;                          
output           ctrl_viq1_rf_lch_fail_vld;                
output  [7  :0]  ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld;     
output  [7  :0]  ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld;     
output           ctrl_viq1_rf_pop_dlb_vld;                 
output           ctrl_viq1_rf_pop_vld;                     
output           ctrl_viq1_stall;                          
output           ctrl_xx_rf_pipe0_preg_lch_vld_dup0;       
output           ctrl_xx_rf_pipe0_preg_lch_vld_dup1;       
output           ctrl_xx_rf_pipe0_preg_lch_vld_dup2;       
output           ctrl_xx_rf_pipe0_preg_lch_vld_dup3;       
output           ctrl_xx_rf_pipe0_preg_lch_vld_dup4;       
output           ctrl_xx_rf_pipe1_preg_lch_vld_dup0;       
output           ctrl_xx_rf_pipe1_preg_lch_vld_dup1;       
output           ctrl_xx_rf_pipe1_preg_lch_vld_dup2;       
output           ctrl_xx_rf_pipe1_preg_lch_vld_dup3;       
output           ctrl_xx_rf_pipe1_preg_lch_vld_dup4;       
output           ctrl_xx_rf_pipe6_vmla_lch_vld_dup0;       
output           ctrl_xx_rf_pipe6_vmla_lch_vld_dup1;       
output           ctrl_xx_rf_pipe6_vmla_lch_vld_dup2;       
output           ctrl_xx_rf_pipe6_vmla_lch_vld_dup3;       
output           ctrl_xx_rf_pipe7_vmla_lch_vld_dup0;       
output           ctrl_xx_rf_pipe7_vmla_lch_vld_dup1;       
output           ctrl_xx_rf_pipe7_vmla_lch_vld_dup2;       
output           ctrl_xx_rf_pipe7_vmla_lch_vld_dup3;       
output           idu_cp0_rf_gateclk_sel;                   
output           idu_cp0_rf_sel;                           
output           idu_hpcp_rf_inst_vld;                     
output           idu_hpcp_rf_pipe0_inst_vld;               
output           idu_hpcp_rf_pipe0_lch_fail_vld;           
output           idu_hpcp_rf_pipe1_inst_vld;               
output           idu_hpcp_rf_pipe1_lch_fail_vld;           
output           idu_hpcp_rf_pipe2_inst_vld;               
output           idu_hpcp_rf_pipe2_lch_fail_vld;           
output           idu_hpcp_rf_pipe3_inst_vld;               
output           idu_hpcp_rf_pipe3_lch_fail_vld;           
output           idu_hpcp_rf_pipe3_reg_lch_fail_vld;       
output           idu_hpcp_rf_pipe4_inst_vld;               
output           idu_hpcp_rf_pipe4_lch_fail_vld;           
output           idu_hpcp_rf_pipe4_reg_lch_fail_vld;       
output           idu_hpcp_rf_pipe5_inst_vld;               
output           idu_hpcp_rf_pipe5_lch_fail_vld;           
output           idu_hpcp_rf_pipe5_reg_lch_fail_vld;       
output           idu_hpcp_rf_pipe6_inst_vld;               
output           idu_hpcp_rf_pipe6_lch_fail_vld;           
output           idu_hpcp_rf_pipe7_inst_vld;               
output           idu_hpcp_rf_pipe7_lch_fail_vld;           
output           idu_iu_is_div_gateclk_issue;              
output           idu_iu_is_div_issue;                      
output           idu_iu_rf_bju_gateclk_sel;                
output           idu_iu_rf_bju_sel;                        
output           idu_iu_rf_div_gateclk_sel;                
output           idu_iu_rf_div_sel;                        
output           idu_iu_rf_mult_gateclk_sel;               
output           idu_iu_rf_mult_sel;                       
output           idu_iu_rf_pipe0_cbus_gateclk_sel;         
output           idu_iu_rf_pipe0_gateclk_sel;              
output           idu_iu_rf_pipe0_sel;                      
output           idu_iu_rf_pipe1_cbus_gateclk_sel;         
output           idu_iu_rf_pipe1_gateclk_sel;              
output           idu_iu_rf_pipe1_sel;                      
output           idu_iu_rf_special_gateclk_sel;            
output           idu_iu_rf_special_sel;                    
output           idu_lsu_rf_pipe3_gateclk_sel;             
output           idu_lsu_rf_pipe3_sel;                     
output           idu_lsu_rf_pipe4_gateclk_sel;             
output           idu_lsu_rf_pipe4_sel;                     
output           idu_lsu_rf_pipe5_gateclk_sel;             
output           idu_lsu_rf_pipe5_sel;                     
output           idu_vfpu_is_vdiv_gateclk_issue;           
output           idu_vfpu_is_vdiv_issue;                   
output           idu_vfpu_rf_pipe6_gateclk_sel;            
output           idu_vfpu_rf_pipe6_sel;                    
output           idu_vfpu_rf_pipe7_gateclk_sel;            
output           idu_vfpu_rf_pipe7_sel;                    

// &Regs; @29
reg              ctrl_rf_hpcp_pipe0_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe0_rf_lch_fail_vld_ff;    
reg              ctrl_rf_hpcp_pipe1_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe1_rf_lch_fail_vld_ff;    
reg              ctrl_rf_hpcp_pipe2_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe2_rf_lch_fail_vld_ff;    
reg              ctrl_rf_hpcp_pipe3_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe3_rf_lch_fail_vld_ff;    
reg              ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld_ff; 
reg              ctrl_rf_hpcp_pipe4_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe4_rf_lch_fail_vld_ff;    
reg              ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld_ff; 
reg              ctrl_rf_hpcp_pipe5_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe5_rf_lch_fail_vld_ff;    
reg              ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld_ff; 
reg              ctrl_rf_hpcp_pipe6_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe6_rf_lch_fail_vld_ff;    
reg              ctrl_rf_hpcp_pipe7_inst_vld_ff;           
reg              ctrl_rf_hpcp_pipe7_rf_lch_fail_vld_ff;    
reg     [107:0]  rf_pipe0_alu_reg_fwd_vld;                 
reg              rf_pipe0_inst_vld;                        
reg     [4  :0]  rf_pipe0_preg_lch_vld;                    
reg              rf_pipe0_special_vld;                     
reg     [107:0]  rf_pipe1_alu_reg_fwd_vld;                 
reg              rf_pipe1_inst_vld;                        
reg     [7  :0]  rf_pipe1_mla_fwd_vld;                     
reg     [4  :0]  rf_pipe1_preg_lch_vld;                    
reg              rf_pipe2_inst_vld;                        
reg              rf_pipe3_inst_vld;                        
reg              rf_pipe4_inst_vld;                        
reg              rf_pipe5_inst_vld;                        
reg              rf_pipe6_inst_vld;                        
reg     [3  :0]  rf_pipe6_vmla_rf_lch_vld;                 
reg     [15 :0]  rf_pipe6_vmla_vreg_fwd_vld;               
reg              rf_pipe7_inst_vld;                        
reg     [3  :0]  rf_pipe7_vmla_rf_lch_vld;                 
reg     [15 :0]  rf_pipe7_vmla_vreg_fwd_vld;               

// &Wires; @30
wire             aiq0_issue_alu_fwd_inst;                  
wire    [107:0]  aiq0_issue_alu_fwd_vld;                   
wire             aiq0_issue_alu_reg_vld;                   
wire             aiq0_issue_special_vld;                   
wire             aiq0_xx_gateclk_issue_en;                 
wire             aiq0_xx_issue_en;                         
wire             aiq1_issue_alu_fwd_inst;                  
wire    [107:0]  aiq1_issue_alu_fwd_vld;                   
wire             aiq1_issue_alu_reg_vld;                   
wire             aiq1_issue_mla_fwd_inst;                  
wire    [7  :0]  aiq1_issue_mla_fwd_vld;                   
wire             aiq1_xx_gateclk_issue_en;                 
wire             aiq1_xx_issue_en;                         
wire             biq_xx_gateclk_issue_en;                  
wire             biq_xx_issue_en;                          
wire             cp0_idu_icg_en;                           
wire             cp0_yy_clk_en;                            
wire             cpurst_b;                                 
wire             ctrl_aiq0_rf_lch_fail_vld;                
wire    [23 :0]  ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld;       
wire    [23 :0]  ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld;       
wire             ctrl_aiq0_rf_pop_dlb_vld;                 
wire             ctrl_aiq0_rf_pop_vld;                     
wire             ctrl_aiq0_stall;                          
wire             ctrl_aiq1_rf_lch_fail_vld;                
wire    [23 :0]  ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld;       
wire    [23 :0]  ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld;       
wire    [7  :0]  ctrl_aiq1_rf_pipe1_mla_reg_lch_vld;       
wire             ctrl_aiq1_rf_pop_dlb_vld;                 
wire             ctrl_aiq1_rf_pop_vld;                     
wire             ctrl_aiq1_stall;                          
wire             ctrl_biq_rf_lch_fail_vld;                 
wire    [23 :0]  ctrl_biq_rf_pipe0_alu_reg_fwd_vld;        
wire    [23 :0]  ctrl_biq_rf_pipe1_alu_reg_fwd_vld;        
wire             ctrl_biq_rf_pop_vld;                      
wire             ctrl_dp_rf_pipe0_other_lch_fail;          
wire             ctrl_dp_rf_pipe3_other_lch_fail;          
wire             ctrl_dp_rf_pipe4_other_lch_fail;          
wire             ctrl_dp_rf_pipe5_other_lch_fail;          
wire             ctrl_dp_rf_pipe6_other_lch_fail;          
wire             ctrl_dp_rf_pipe7_other_lch_fail;          
wire    [23 :0]  ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld;       
wire    [23 :0]  ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld;       
wire             ctrl_lsiq_rf_pipe3_lch_fail_vld;          
wire             ctrl_lsiq_rf_pipe4_lch_fail_vld;          
wire             ctrl_rf_hpcp_inst_vld;                    
wire             ctrl_rf_hpcp_inst_vld_ff;                 
wire             ctrl_rf_hpcp_pipe0_rf_lch_fail_vld;       
wire             ctrl_rf_hpcp_pipe1_rf_lch_fail_vld;       
wire             ctrl_rf_hpcp_pipe2_rf_lch_fail_vld;       
wire             ctrl_rf_hpcp_pipe3_rf_lch_fail_vld;       
wire             ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld;   
wire             ctrl_rf_hpcp_pipe4_rf_lch_fail_vld;       
wire             ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld;   
wire             ctrl_rf_hpcp_pipe5_rf_lch_fail_vld;       
wire             ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld;   
wire             ctrl_rf_hpcp_pipe6_rf_lch_fail_vld;       
wire             ctrl_rf_hpcp_pipe7_rf_lch_fail_vld;       
wire             ctrl_rf_pipe0_div_stall;                  
wire    [3  :0]  ctrl_rf_pipe0_eu_gateclk_sel;             
wire    [3  :0]  ctrl_rf_pipe0_eu_sel;                     
wire             ctrl_rf_pipe0_inst_vld;                   
wire             ctrl_rf_pipe0_lch_fail;                   
wire             ctrl_rf_pipe0_mtvr_vld;                   
wire             ctrl_rf_pipe0_other_lch_fail;             
wire             ctrl_rf_pipe0_pipedown_vld;               
wire             ctrl_rf_pipe0_special_stall;              
wire             ctrl_rf_pipe0_src2_vld;                   
wire             ctrl_rf_pipe0_vdiv_mtvr_lch_fail;         
wire    [1  :0]  ctrl_rf_pipe1_eu_gateclk_sel;             
wire    [1  :0]  ctrl_rf_pipe1_eu_sel;                     
wire             ctrl_rf_pipe1_inst_vld;                   
wire             ctrl_rf_pipe1_lch_fail;                   
wire             ctrl_rf_pipe1_mtvr_vld;                   
wire             ctrl_rf_pipe1_pipedown_vld;               
wire             ctrl_rf_pipe1_src2_vld;                   
wire             ctrl_rf_pipe2_inst_vld;                   
wire             ctrl_rf_pipe2_lch_fail;                   
wire             ctrl_rf_pipe2_pipedown_vld;               
wire             ctrl_rf_pipe3_inst_vld;                   
wire             ctrl_rf_pipe3_lch_fail;                   
wire             ctrl_rf_pipe3_other_lch_fail;             
wire             ctrl_rf_pipe3_pipedown_vld;               
wire             ctrl_rf_pipe3_preg_lch_fail;              
wire             ctrl_rf_pipe3_src1_vld;                   
wire             ctrl_rf_pipe3_srcvm_vld;                  
wire             ctrl_rf_pipe3_vreg_lch_fail;              
wire             ctrl_rf_pipe4_inst_vld;                   
wire             ctrl_rf_pipe4_lch_fail;                   
wire             ctrl_rf_pipe4_other_lch_fail;             
wire             ctrl_rf_pipe4_pipedown_vld;               
wire             ctrl_rf_pipe4_srcvm_vld;                  
wire             ctrl_rf_pipe4_vreg_lch_fail;              
wire             ctrl_rf_pipe5_inst_vld;                   
wire             ctrl_rf_pipe5_lch_fail;                   
wire             ctrl_rf_pipe5_other_lch_fail;             
wire             ctrl_rf_pipe5_pipedown_vld;               
wire             ctrl_rf_pipe5_preg_lch_fail;              
wire             ctrl_rf_pipe5_src0_vld;                   
wire             ctrl_rf_pipe6_div_mfvr_lch_fail;          
wire             ctrl_rf_pipe6_inst_vld;                   
wire             ctrl_rf_pipe6_lch_fail;                   
wire             ctrl_rf_pipe6_mfvr_vld;                   
wire             ctrl_rf_pipe6_other_lch_fail;             
wire             ctrl_rf_pipe6_pipedown_vld;               
wire             ctrl_rf_pipe6_srcv2_vld;                  
wire             ctrl_rf_pipe6_vdiv_stall;                 
wire             ctrl_rf_pipe6_vmul_unsplit_lch_fail;      
wire             ctrl_rf_pipe6_vmul_vld;                   
wire             ctrl_rf_pipe7_inst_vld;                   
wire             ctrl_rf_pipe7_lch_fail;                   
wire             ctrl_rf_pipe7_mfvr_vld;                   
wire             ctrl_rf_pipe7_mult_mfvr_lch_fail;         
wire             ctrl_rf_pipe7_other_lch_fail;             
wire             ctrl_rf_pipe7_pipedown_vld;               
wire             ctrl_rf_pipe7_srcv2_vld;                  
wire             ctrl_rf_pipe7_vmul_unsplit_vld;           
wire             ctrl_sdiq_rf_lch_fail_vld;                
wire    [11 :0]  ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld;       
wire    [11 :0]  ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld;       
wire             ctrl_sdiq_rf_staddr_rdy_set;              
wire             ctrl_viq0_rf_lch_fail_vld;                
wire    [7  :0]  ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld;     
wire    [7  :0]  ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld;     
wire             ctrl_viq0_rf_pop_dlb_vld;                 
wire             ctrl_viq0_rf_pop_vld;                     
wire             ctrl_viq0_stall;                          
wire             ctrl_viq1_rf_lch_fail_vld;                
wire    [7  :0]  ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld;     
wire    [7  :0]  ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld;     
wire             ctrl_viq1_rf_pop_dlb_vld;                 
wire             ctrl_viq1_rf_pop_vld;                     
wire             ctrl_viq1_stall;                          
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup0;       
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup1;       
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup2;       
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup3;       
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup4;       
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup0;       
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup1;       
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup2;       
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup3;       
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup4;       
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup0;       
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup1;       
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup2;       
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup3;       
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup0;       
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup1;       
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup2;       
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup3;       
wire             dp_ctrl_is_aiq0_issue_alu_short;          
wire             dp_ctrl_is_aiq0_issue_div;                
wire             dp_ctrl_is_aiq0_issue_dst_vld;            
wire             dp_ctrl_is_aiq0_issue_lch_preg;           
wire    [107:0]  dp_ctrl_is_aiq0_issue_lch_rdy;            
wire             dp_ctrl_is_aiq0_issue_special;            
wire             dp_ctrl_is_aiq1_issue_alu_short;          
wire             dp_ctrl_is_aiq1_issue_dst_vld;            
wire             dp_ctrl_is_aiq1_issue_lch_preg;           
wire    [107:0]  dp_ctrl_is_aiq1_issue_lch_rdy;            
wire    [7  :0]  dp_ctrl_is_aiq1_issue_mla_lch_rdy;        
wire             dp_ctrl_is_aiq1_issue_mla_vld;            
wire             dp_ctrl_is_viq0_issue_dstv_vld;           
wire    [15 :0]  dp_ctrl_is_viq0_issue_lch_rdy;            
wire             dp_ctrl_is_viq0_issue_vdiv;               
wire             dp_ctrl_is_viq0_issue_vmla_rf;            
wire             dp_ctrl_is_viq0_issue_vmla_short;         
wire             dp_ctrl_is_viq1_issue_dstv_vld;           
wire    [15 :0]  dp_ctrl_is_viq1_issue_lch_rdy;            
wire             dp_ctrl_is_viq1_issue_vmla_rf;            
wire             dp_ctrl_is_viq1_issue_vmla_short;         
wire    [3  :0]  dp_ctrl_rf_pipe0_eu_sel;                  
wire             dp_ctrl_rf_pipe0_mtvr;                    
wire             dp_ctrl_rf_pipe0_src2_vld;                
wire             dp_ctrl_rf_pipe0_src_no_rdy;              
wire    [1  :0]  dp_ctrl_rf_pipe1_eu_sel;                  
wire             dp_ctrl_rf_pipe1_mtvr;                    
wire             dp_ctrl_rf_pipe1_src2_vld;                
wire             dp_ctrl_rf_pipe1_src_no_rdy;              
wire             dp_ctrl_rf_pipe2_src_no_rdy;              
wire             dp_ctrl_rf_pipe3_src1_vld;                
wire             dp_ctrl_rf_pipe3_src_no_rdy;              
wire             dp_ctrl_rf_pipe3_srcvm_vld;               
wire             dp_ctrl_rf_pipe4_src_no_rdy;              
wire             dp_ctrl_rf_pipe4_srcvm_vld;               
wire             dp_ctrl_rf_pipe4_staddr;                  
wire             dp_ctrl_rf_pipe5_src0_vld;                
wire             dp_ctrl_rf_pipe5_src_no_rdy;              
wire             dp_ctrl_rf_pipe6_mfvr;                    
wire             dp_ctrl_rf_pipe6_src_no_rdy;              
wire             dp_ctrl_rf_pipe6_srcv2_vld;               
wire             dp_ctrl_rf_pipe6_vmul;                    
wire             dp_ctrl_rf_pipe7_mfvr;                    
wire             dp_ctrl_rf_pipe7_src_no_rdy;              
wire             dp_ctrl_rf_pipe7_srcv2_vld;               
wire             dp_ctrl_rf_pipe7_vmul_unsplit;            
wire             forever_cpuclk;                           
wire             hpcp_clk;                                 
wire             hpcp_clk_en;                              
wire             hpcp_idu_cnt_en;                          
wire             idu_cp0_rf_gateclk_sel;                   
wire             idu_cp0_rf_sel;                           
wire             idu_hpcp_rf_inst_vld;                     
wire             idu_hpcp_rf_pipe0_inst_vld;               
wire             idu_hpcp_rf_pipe0_lch_fail_vld;           
wire             idu_hpcp_rf_pipe1_inst_vld;               
wire             idu_hpcp_rf_pipe1_lch_fail_vld;           
wire             idu_hpcp_rf_pipe2_inst_vld;               
wire             idu_hpcp_rf_pipe2_lch_fail_vld;           
wire             idu_hpcp_rf_pipe3_inst_vld;               
wire             idu_hpcp_rf_pipe3_lch_fail_vld;           
wire             idu_hpcp_rf_pipe3_reg_lch_fail_vld;       
wire             idu_hpcp_rf_pipe4_inst_vld;               
wire             idu_hpcp_rf_pipe4_lch_fail_vld;           
wire             idu_hpcp_rf_pipe4_reg_lch_fail_vld;       
wire             idu_hpcp_rf_pipe5_inst_vld;               
wire             idu_hpcp_rf_pipe5_lch_fail_vld;           
wire             idu_hpcp_rf_pipe5_reg_lch_fail_vld;       
wire             idu_hpcp_rf_pipe6_inst_vld;               
wire             idu_hpcp_rf_pipe6_lch_fail_vld;           
wire             idu_hpcp_rf_pipe7_inst_vld;               
wire             idu_hpcp_rf_pipe7_lch_fail_vld;           
wire             idu_iu_is_div_gateclk_issue;              
wire             idu_iu_is_div_issue;                      
wire             idu_iu_rf_bju_gateclk_sel;                
wire             idu_iu_rf_bju_sel;                        
wire             idu_iu_rf_div_gateclk_sel;                
wire             idu_iu_rf_div_sel;                        
wire             idu_iu_rf_mult_gateclk_sel;               
wire             idu_iu_rf_mult_sel;                       
wire             idu_iu_rf_pipe0_cbus_gateclk_sel;         
wire             idu_iu_rf_pipe0_gateclk_sel;              
wire             idu_iu_rf_pipe0_sel;                      
wire             idu_iu_rf_pipe1_cbus_gateclk_sel;         
wire             idu_iu_rf_pipe1_gateclk_sel;              
wire             idu_iu_rf_pipe1_sel;                      
wire             idu_iu_rf_special_gateclk_sel;            
wire             idu_iu_rf_special_sel;                    
wire             idu_lsu_rf_pipe3_gateclk_sel;             
wire             idu_lsu_rf_pipe3_sel;                     
wire             idu_lsu_rf_pipe4_gateclk_sel;             
wire             idu_lsu_rf_pipe4_sel;                     
wire             idu_lsu_rf_pipe5_gateclk_sel;             
wire             idu_lsu_rf_pipe5_sel;                     
wire             idu_vfpu_is_vdiv_gateclk_issue;           
wire             idu_vfpu_is_vdiv_issue;                   
wire             idu_vfpu_rf_pipe6_gateclk_sel;            
wire             idu_vfpu_rf_pipe6_sel;                    
wire             idu_vfpu_rf_pipe7_gateclk_sel;            
wire             idu_vfpu_rf_pipe7_sel;                    
wire             iu_idu_div_wb_stall;                      
wire             iu_idu_ex1_pipe1_mult_stall;              
wire             lsiq_xx_gateclk_issue_en;                 
wire             lsiq_xx_pipe3_issue_en;                   
wire             lsiq_xx_pipe4_issue_en;                   
wire             pad_yy_icg_scan_en;                       
wire             rf_inst0_clk;                             
wire             rf_inst0_clk_en;                          
wire             rf_inst1_clk;                             
wire             rf_inst1_clk_en;                          
wire             rf_inst6_clk;                             
wire             rf_inst6_clk_en;                          
wire             rf_inst7_clk;                             
wire             rf_inst7_clk_en;                          
wire             rf_inst_clk;                              
wire             rf_inst_clk_en;                           
wire             rtu_idu_flush_fe;                         
wire             rtu_idu_flush_is;                         
wire             rtu_yy_xx_flush;                          
wire             sdiq_xx_gateclk_issue_en;                 
wire             sdiq_xx_issue_en;                         
wire             vfpu_idu_vdiv_wb_stall;                   
wire             viq0_issue_vmla_fwd_inst;                 
wire    [15 :0]  viq0_issue_vmla_fwd_vld;                  
wire             viq0_issue_vmla_rf_vld;                   
wire             viq0_xx_gateclk_issue_en;                 
wire             viq0_xx_issue_en;                         
wire             viq1_issue_vmla_fwd_inst;                 
wire    [15 :0]  viq1_issue_vmla_fwd_vld;                  
wire             viq1_issue_vmla_rf_vld;                   
wire             viq1_xx_gateclk_issue_en;                 
wire             viq1_xx_issue_en;                         



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign rf_inst_clk_en = biq_xx_gateclk_issue_en
                        || lsiq_xx_gateclk_issue_en
                        || sdiq_xx_gateclk_issue_en
                        || viq0_xx_gateclk_issue_en
                        || viq1_xx_gateclk_issue_en
                        || rf_pipe2_inst_vld
                        || rf_pipe3_inst_vld
                        || rf_pipe4_inst_vld
                        || rf_pipe5_inst_vld
                        || rf_pipe6_inst_vld
                        || rf_pipe7_inst_vld;
// &Instance("gated_clk_cell", "x_rf_inst_gated_clk"); @47
gated_clk_cell  x_rf_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_inst_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_inst_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @48
//          .external_en (1'b0), @49
//          .global_en   (cp0_yy_clk_en), @50
//          .module_en   (cp0_idu_icg_en), @51
//          .local_en    (rf_inst_clk_en), @52
//          .clk_out     (rf_inst_clk)); @53

assign rf_inst0_clk_en = aiq0_xx_gateclk_issue_en
                         || rf_pipe0_inst_vld;
// &Instance("gated_clk_cell", "x_rf_inst0_gated_clk"); @57
gated_clk_cell  x_rf_inst0_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_inst0_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_inst0_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @58
//          .external_en (1'b0), @59
//          .global_en   (cp0_yy_clk_en), @60
//          .module_en   (cp0_idu_icg_en), @61
//          .local_en    (rf_inst0_clk_en), @62
//          .clk_out     (rf_inst0_clk)); @63

assign rf_inst1_clk_en = aiq1_xx_gateclk_issue_en
                         || rf_pipe1_inst_vld;
// &Instance("gated_clk_cell", "x_rf_inst1_gated_clk"); @67
gated_clk_cell  x_rf_inst1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_inst1_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_inst1_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @68
//          .external_en (1'b0), @69
//          .global_en   (cp0_yy_clk_en), @70
//          .module_en   (cp0_idu_icg_en), @71
//          .local_en    (rf_inst1_clk_en), @72
//          .clk_out     (rf_inst1_clk)); @73

assign rf_inst6_clk_en = viq0_xx_gateclk_issue_en
                         || rf_pipe6_inst_vld;
// &Instance("gated_clk_cell", "x_rf_inst6_gated_clk"); @77
gated_clk_cell  x_rf_inst6_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_inst6_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_inst6_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @78
//          .external_en (1'b0), @79
//          .global_en   (cp0_yy_clk_en), @80
//          .module_en   (cp0_idu_icg_en), @81
//          .local_en    (rf_inst6_clk_en), @82
//          .clk_out     (rf_inst6_clk)); @83

assign rf_inst7_clk_en = viq1_xx_gateclk_issue_en
                         || rf_pipe7_inst_vld;
// &Instance("gated_clk_cell", "x_rf_inst7_gated_clk"); @87
gated_clk_cell  x_rf_inst7_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_inst7_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_inst7_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @88
//          .external_en (1'b0), @89
//          .global_en   (cp0_yy_clk_en), @90
//          .module_en   (cp0_idu_icg_en), @91
//          .local_en    (rf_inst7_clk_en), @92
//          .clk_out     (rf_inst7_clk)); @93

//==========================================================
//                 RF Inst Valid registers
//==========================================================
//----------------------------------------------------------
//                Pipe0 Instruction Valid
//----------------------------------------------------------
//alu and special should set ready for pipe0 ex2 fwd
//pipe0 ex1 fwd is set by alu reg fwd vld
assign aiq0_issue_alu_reg_vld        = aiq0_xx_issue_en
                                       && dp_ctrl_is_aiq0_issue_lch_preg;
assign aiq0_issue_special_vld        = aiq0_xx_issue_en
                                       && dp_ctrl_is_aiq0_issue_special;
assign idu_iu_is_div_issue           = aiq0_xx_issue_en
                                       && dp_ctrl_is_aiq0_issue_div;
assign idu_iu_is_div_gateclk_issue   = aiq0_xx_gateclk_issue_en;

always @(posedge rf_inst0_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe0_inst_vld          <= 1'b0;
    rf_pipe0_preg_lch_vld[4:0] <= 5'b0;
    rf_pipe0_special_vld       <= 1'b0;
  end
  else if(rtu_idu_flush_fe || rtu_idu_flush_is) begin
    rf_pipe0_inst_vld          <= 1'b0;
    rf_pipe0_preg_lch_vld[4:0] <= 5'b0;
    rf_pipe0_special_vld       <= 1'b0;
  end
  else begin
    rf_pipe0_inst_vld          <= aiq0_xx_issue_en;
    rf_pipe0_preg_lch_vld[4:0] <= {5{aiq0_issue_alu_reg_vld}};
    rf_pipe0_special_vld       <= aiq0_issue_special_vld;
  end
end

assign ctrl_rf_pipe0_inst_vld             = rf_pipe0_inst_vld;
assign ctrl_xx_rf_pipe0_preg_lch_vld_dup0 = rf_pipe0_preg_lch_vld[0];
assign ctrl_xx_rf_pipe0_preg_lch_vld_dup1 = rf_pipe0_preg_lch_vld[1];
assign ctrl_xx_rf_pipe0_preg_lch_vld_dup2 = rf_pipe0_preg_lch_vld[2];
assign ctrl_xx_rf_pipe0_preg_lch_vld_dup3 = rf_pipe0_preg_lch_vld[3];
assign ctrl_xx_rf_pipe0_preg_lch_vld_dup4 = rf_pipe0_preg_lch_vld[4];

//----------------------------------------------------------
//                Pipe1 Instruction Valid
//----------------------------------------------------------
assign aiq1_issue_alu_reg_vld        = aiq1_xx_issue_en
                                       && dp_ctrl_is_aiq1_issue_lch_preg;

always @(posedge rf_inst1_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe1_inst_vld          <= 1'b0;
    rf_pipe1_preg_lch_vld[4:0] <= 5'b0;
  end
  else if(rtu_idu_flush_fe ||   rtu_idu_flush_is) begin
    rf_pipe1_inst_vld          <= 1'b0;
    rf_pipe1_preg_lch_vld[4:0] <= 5'b0;
  end
  else begin
    rf_pipe1_inst_vld          <= aiq1_xx_issue_en;
    rf_pipe1_preg_lch_vld[4:0] <= {5{aiq1_issue_alu_reg_vld}};
  end
end

assign ctrl_rf_pipe1_inst_vld             = rf_pipe1_inst_vld;
assign ctrl_xx_rf_pipe1_preg_lch_vld_dup0 = rf_pipe1_preg_lch_vld[0];
assign ctrl_xx_rf_pipe1_preg_lch_vld_dup1 = rf_pipe1_preg_lch_vld[1];
assign ctrl_xx_rf_pipe1_preg_lch_vld_dup2 = rf_pipe1_preg_lch_vld[2];
assign ctrl_xx_rf_pipe1_preg_lch_vld_dup3 = rf_pipe1_preg_lch_vld[3];
assign ctrl_xx_rf_pipe1_preg_lch_vld_dup4 = rf_pipe1_preg_lch_vld[4];

//----------------------------------------------------------
//                Pipe2 Instruction Valid
//----------------------------------------------------------
always @(posedge rf_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe2_inst_vld <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rf_pipe2_inst_vld <= 1'b0;
  else
    rf_pipe2_inst_vld <= biq_xx_issue_en;
end

assign ctrl_rf_pipe2_inst_vld    = rf_pipe2_inst_vld;

//----------------------------------------------------------
//                Pipe3 Instruction Valid
//----------------------------------------------------------
always @(posedge rf_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe3_inst_vld <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rf_pipe3_inst_vld <= 1'b0;
  else
    rf_pipe3_inst_vld <= lsiq_xx_pipe3_issue_en;
end

assign ctrl_rf_pipe3_inst_vld    = rf_pipe3_inst_vld;

//----------------------------------------------------------
//                Pipe4 Instruction Valid
//----------------------------------------------------------
always @(posedge rf_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe4_inst_vld  <= 1'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rf_pipe4_inst_vld  <= 1'b0;
  else
    rf_pipe4_inst_vld  <= lsiq_xx_pipe4_issue_en;
end

assign ctrl_rf_pipe4_inst_vld     = rf_pipe4_inst_vld;

//----------------------------------------------------------
//                Pipe5 Instruction Valid
//----------------------------------------------------------
always @(posedge rf_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe5_inst_vld <= 1'b0;
  //pipe 5 rf stage is flush by flush_be
  else if(rtu_yy_xx_flush)
    rf_pipe5_inst_vld <= 1'b0;
  else
    rf_pipe5_inst_vld <= sdiq_xx_issue_en;
end

assign ctrl_rf_pipe5_inst_vld    = rf_pipe5_inst_vld;

//----------------------------------------------------------
//                Pipe6 Instruction Valid
//----------------------------------------------------------
assign idu_vfpu_is_vdiv_issue         = viq0_xx_issue_en
                                        && dp_ctrl_is_viq0_issue_vdiv;
assign idu_vfpu_is_vdiv_gateclk_issue = viq0_xx_gateclk_issue_en;

assign viq0_issue_vmla_rf_vld         = viq0_xx_issue_en
                                        && dp_ctrl_is_viq0_issue_dstv_vld
                                        && dp_ctrl_is_viq0_issue_vmla_rf;

always @(posedge rf_inst6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe6_inst_vld             <= 1'b0;
    rf_pipe6_vmla_rf_lch_vld[3:0] <= 4'b0;
  end
  else if(rtu_idu_flush_fe || rtu_idu_flush_is) begin
    rf_pipe6_inst_vld             <= 1'b0;
    rf_pipe6_vmla_rf_lch_vld[3:0] <= 4'b0;
  end
  else begin
    rf_pipe6_inst_vld             <= viq0_xx_issue_en;
    rf_pipe6_vmla_rf_lch_vld[3:0] <= {4{viq0_issue_vmla_rf_vld}};
  end
end

assign ctrl_rf_pipe6_inst_vld             = rf_pipe6_inst_vld;
assign ctrl_xx_rf_pipe6_vmla_lch_vld_dup0 = rf_pipe6_vmla_rf_lch_vld[0];
assign ctrl_xx_rf_pipe6_vmla_lch_vld_dup1 = rf_pipe6_vmla_rf_lch_vld[1];
assign ctrl_xx_rf_pipe6_vmla_lch_vld_dup2 = rf_pipe6_vmla_rf_lch_vld[2];
assign ctrl_xx_rf_pipe6_vmla_lch_vld_dup3 = rf_pipe6_vmla_rf_lch_vld[3];

//----------------------------------------------------------
//                Pipe7 Instruction Valid
//----------------------------------------------------------
assign viq1_issue_vmla_rf_vld         = viq1_xx_issue_en
                                        && dp_ctrl_is_viq1_issue_dstv_vld
                                        && dp_ctrl_is_viq1_issue_vmla_rf;

always @(posedge rf_inst7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe7_inst_vld             <= 1'b0;
    rf_pipe7_vmla_rf_lch_vld[3:0] <= 4'b0;
  end
  else if(rtu_idu_flush_fe || rtu_idu_flush_is) begin
    rf_pipe7_inst_vld             <= 1'b0;
    rf_pipe7_vmla_rf_lch_vld[3:0] <= 4'b0;
  end
  else begin
    rf_pipe7_inst_vld             <= viq1_xx_issue_en;
    rf_pipe7_vmla_rf_lch_vld[3:0] <= {4{viq1_issue_vmla_rf_vld}};
  end
end

assign ctrl_rf_pipe7_inst_vld             = rf_pipe7_inst_vld;
assign ctrl_xx_rf_pipe7_vmla_lch_vld_dup0 = rf_pipe7_vmla_rf_lch_vld[0];
assign ctrl_xx_rf_pipe7_vmla_lch_vld_dup1 = rf_pipe7_vmla_rf_lch_vld[1];
assign ctrl_xx_rf_pipe7_vmla_lch_vld_dup2 = rf_pipe7_vmla_rf_lch_vld[2];
assign ctrl_xx_rf_pipe7_vmla_lch_vld_dup3 = rf_pipe7_vmla_rf_lch_vld[3];

//==========================================================
//                RF Launch Ready registers
//==========================================================
//----------------------------------------------------------
//                Pipe0 Launch Ready valid
//----------------------------------------------------------
assign aiq0_issue_alu_fwd_inst       = aiq0_xx_issue_en
                                       && dp_ctrl_is_aiq0_issue_dst_vld
                                       && dp_ctrl_is_aiq0_issue_alu_short;
assign aiq0_issue_alu_fwd_vld[107:0] = {108{aiq0_issue_alu_fwd_inst}}
                                       & dp_ctrl_is_aiq0_issue_lch_rdy[107:0];

always @(posedge rf_inst0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe0_alu_reg_fwd_vld[107:0] <= 108'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rf_pipe0_alu_reg_fwd_vld[107:0] <= 108'b0;
  else
    rf_pipe0_alu_reg_fwd_vld[107:0] <= aiq0_issue_alu_fwd_vld[107:0];
end

assign ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld[23:0] = rf_pipe0_alu_reg_fwd_vld[23:0];
assign ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld[23:0] = rf_pipe0_alu_reg_fwd_vld[47:24];
assign ctrl_biq_rf_pipe0_alu_reg_fwd_vld[23:0]  = rf_pipe0_alu_reg_fwd_vld[71:48];
assign ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld[23:0] = rf_pipe0_alu_reg_fwd_vld[95:72];
assign ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld[11:0] = rf_pipe0_alu_reg_fwd_vld[107:96];

//----------------------------------------------------------
//                Pipe1 Launch Ready valid
//----------------------------------------------------------
assign aiq1_issue_alu_fwd_inst       = aiq1_xx_issue_en
                                       && dp_ctrl_is_aiq1_issue_dst_vld
                                       && dp_ctrl_is_aiq1_issue_alu_short;
assign aiq1_issue_alu_fwd_vld[107:0] = {108{aiq1_issue_alu_fwd_inst}}
                                       & dp_ctrl_is_aiq1_issue_lch_rdy[107:0];

assign aiq1_issue_mla_fwd_inst       = aiq1_xx_issue_en
                                       && dp_ctrl_is_aiq1_issue_mla_vld;
assign aiq1_issue_mla_fwd_vld[7:0]   = {8{aiq1_issue_mla_fwd_inst}}
                                       & dp_ctrl_is_aiq1_issue_mla_lch_rdy[7:0];

always @(posedge rf_inst1_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe1_alu_reg_fwd_vld[107:0] <= 108'b0;
    rf_pipe1_mla_fwd_vld[7:0]       <= 8'b0;
  end
  else if(rtu_idu_flush_fe || rtu_idu_flush_is) begin
    rf_pipe1_alu_reg_fwd_vld[107:0] <= 108'b0;
    rf_pipe1_mla_fwd_vld[7:0]       <= 8'b0;
  end
  else begin
    rf_pipe1_alu_reg_fwd_vld[107:0] <= aiq1_issue_alu_fwd_vld[107:0];
    rf_pipe1_mla_fwd_vld[7:0]       <= aiq1_issue_mla_fwd_vld[7:0];
  end
end

assign ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld[23:0] = rf_pipe1_alu_reg_fwd_vld[23:0];
assign ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld[23:0] = rf_pipe1_alu_reg_fwd_vld[47:24];
assign ctrl_biq_rf_pipe1_alu_reg_fwd_vld[23:0]  = rf_pipe1_alu_reg_fwd_vld[71:48];
assign ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld[23:0] = rf_pipe1_alu_reg_fwd_vld[95:72];
assign ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld[11:0] = rf_pipe1_alu_reg_fwd_vld[107:96];

assign ctrl_aiq1_rf_pipe1_mla_reg_lch_vld[7:0]  = rf_pipe1_mla_fwd_vld[7:0];

//----------------------------------------------------------
//                Pipe6 Launch Ready valid
//----------------------------------------------------------
assign viq0_issue_vmla_fwd_inst      = viq0_xx_issue_en
                                       && dp_ctrl_is_viq0_issue_vmla_short;
assign viq0_issue_vmla_fwd_vld[15:0] = {16{viq0_issue_vmla_fwd_inst}}
                                       & dp_ctrl_is_viq0_issue_lch_rdy[15:0];

always @(posedge rf_inst6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe6_vmla_vreg_fwd_vld[15:0] <= 16'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rf_pipe6_vmla_vreg_fwd_vld[15:0] <= 16'b0;
  else
    rf_pipe6_vmla_vreg_fwd_vld[15:0] <= viq0_issue_vmla_fwd_vld[15:0];
end

assign ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld[7:0] = rf_pipe6_vmla_vreg_fwd_vld[7:0];
assign ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld[7:0] = rf_pipe6_vmla_vreg_fwd_vld[15:8];

//----------------------------------------------------------
//                Pipe7 Launch Ready valid
//----------------------------------------------------------
assign viq1_issue_vmla_fwd_inst      = viq1_xx_issue_en
                                       && dp_ctrl_is_viq1_issue_vmla_short;
assign viq1_issue_vmla_fwd_vld[15:0] = {16{viq1_issue_vmla_fwd_inst}}
                                       & dp_ctrl_is_viq1_issue_lch_rdy[15:0];

always @(posedge rf_inst7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe7_vmla_vreg_fwd_vld[15:0] <= 16'b0;
  else if(rtu_idu_flush_fe || rtu_idu_flush_is)
    rf_pipe7_vmla_vreg_fwd_vld[15:0] <= 16'b0;
  else
    rf_pipe7_vmla_vreg_fwd_vld[15:0] <= viq1_issue_vmla_fwd_vld[15:0];
end

assign ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld[7:0] = rf_pipe7_vmla_vreg_fwd_vld[7:0];
assign ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld[7:0] = rf_pipe7_vmla_vreg_fwd_vld[15:8];

//==========================================================
//                     RF Stall Signals
//==========================================================
//----------------------------------------------------------
//                     VR/GPR move stall
//----------------------------------------------------------
//ex2 pipe0/1 mtvr will share ex1 pipe6/7
//stall viq all inst issue at pipe0/1 rf
assign ctrl_rf_pipe0_mtvr_vld           = ctrl_rf_pipe0_inst_vld
                                          && dp_ctrl_rf_pipe0_mtvr;
assign ctrl_rf_pipe1_mtvr_vld           = ctrl_rf_pipe1_inst_vld
                                          && dp_ctrl_rf_pipe1_mtvr;
//ex2 pipe6/7 mfvr will share ex1 pipe0/1 
//stall aiq all inst issue at pipe6/7 rf
assign ctrl_rf_pipe6_mfvr_vld           = ctrl_rf_pipe6_inst_vld
                                          && dp_ctrl_rf_pipe6_mfvr;
assign ctrl_rf_pipe7_mfvr_vld           = ctrl_rf_pipe7_inst_vld
                                          && dp_ctrl_rf_pipe7_mfvr;

//----------------------------------------------------------
//                     div/vdiv stall
//----------------------------------------------------------
//when div need to write back, it will stall issue at wb pipe
assign ctrl_rf_pipe0_div_stall          = iu_idu_div_wb_stall;
assign ctrl_rf_pipe6_vdiv_stall         = vfpu_idu_vdiv_wb_stall;

//----------------------------------------------------------
//                 IU special cmplt stall
//----------------------------------------------------------
//when IU special need cmplt at EX1, it will share pipe0
//RF cmplt port. it will not be conflict with wb port share,
//so do not need lch fail
assign ctrl_rf_pipe0_special_stall      = rf_pipe0_special_vld;

//----------------------------------------------------------
//              Output Stall Signals to IQ
//----------------------------------------------------------
assign ctrl_aiq0_stall                  = ctrl_rf_pipe6_mfvr_vld
                                          || ctrl_rf_pipe0_div_stall
                                          || ctrl_rf_pipe0_special_stall;

assign ctrl_aiq1_stall                  = ctrl_rf_pipe7_mfvr_vld;

assign ctrl_viq0_stall                  = ctrl_rf_pipe0_mtvr_vld
                                          || ctrl_rf_pipe6_vdiv_stall;

assign ctrl_viq1_stall                  = ctrl_rf_pipe1_mtvr_vld;

//==========================================================
//                   Launch fail Signals
//==========================================================
//CAUTION: avoid dead lock: when inst1 lch fail inst2, inst2
//         may lch fail inst1 through src no ready
//----------------------------------------------------------
//                  div/vdiv wb lch fail
//----------------------------------------------------------
//pipe0 div stall may be conflict with pipe6 mfvr stall
//pipe6 vdiv stall may be conflict with pipe0 mtvr stall
//so launch fail mfvr/mtvr at this situation
assign ctrl_rf_pipe0_vdiv_mtvr_lch_fail = ctrl_rf_pipe0_mtvr_vld
                                          && ctrl_rf_pipe6_vdiv_stall;
assign ctrl_rf_pipe6_div_mfvr_lch_fail  = ctrl_rf_pipe6_mfvr_vld
                                          && ctrl_rf_pipe0_div_stall;

//----------------------------------------------------------
//                mult mfvr share lch fail
//----------------------------------------------------------
//pipe1 ex2 mult will share pipe1 rf
//pipe7 ex2 mfvr will share pipe1 ex1,
//  (which is pipe7 ex1 share pipe1 rf)
//pipe1 ex2 mult will be conflict with pipe7 ex1 mfvr
//so launch fail pipe7 rf mfvr when pipe1 ex1 is mult
assign ctrl_rf_pipe7_mult_mfvr_lch_fail = ctrl_rf_pipe7_mfvr_vld
                                          && iu_idu_ex1_pipe1_mult_stall;

//----------------------------------------------------------
//               preg read port share lch fail
//----------------------------------------------------------
//prepare src vld signals
assign ctrl_rf_pipe0_src2_vld           = ctrl_rf_pipe0_inst_vld
                                          && dp_ctrl_rf_pipe0_src2_vld;
assign ctrl_rf_pipe1_src2_vld           = ctrl_rf_pipe1_inst_vld
                                          && dp_ctrl_rf_pipe1_src2_vld;
assign ctrl_rf_pipe3_src1_vld           = ctrl_rf_pipe3_inst_vld
                                          && dp_ctrl_rf_pipe3_src1_vld;
assign ctrl_rf_pipe5_src0_vld           = ctrl_rf_pipe5_inst_vld
                                          && dp_ctrl_rf_pipe5_src0_vld;
//preg read port share priority:
//pipe0 src2 > pipe3 src1, pipe1 src1 > pipe5 src0
//so launch fail pipe3/5 when pipe0/1 shares preg read port
assign ctrl_rf_pipe3_preg_lch_fail      = ctrl_rf_pipe3_src1_vld
                                          && ctrl_rf_pipe0_src2_vld;
assign ctrl_rf_pipe5_preg_lch_fail      = ctrl_rf_pipe5_src0_vld
                                          && ctrl_rf_pipe1_src2_vld;

//----------------------------------------------------------
//               vreg read port share lch fail
//----------------------------------------------------------
//prepare srcv vld signals
assign ctrl_rf_pipe3_srcvm_vld           = ctrl_rf_pipe3_inst_vld
                                          && dp_ctrl_rf_pipe3_srcvm_vld;
assign ctrl_rf_pipe4_srcvm_vld           = ctrl_rf_pipe4_inst_vld
                                          && dp_ctrl_rf_pipe4_srcvm_vld;
assign ctrl_rf_pipe6_srcv2_vld           = ctrl_rf_pipe6_inst_vld
                                          && dp_ctrl_rf_pipe6_srcv2_vld;
assign ctrl_rf_pipe7_srcv2_vld           = ctrl_rf_pipe7_inst_vld
                                          && dp_ctrl_rf_pipe7_srcv2_vld;
//vreg read port share priority:
//pipe6 srcv2 > pipe3 srcvm, pipe7 srcv2 > pipe4 srcvm
//so launch fail pipe3/4 when pipe6/7 vreg read port need to shared
assign ctrl_rf_pipe3_vreg_lch_fail      = ctrl_rf_pipe3_srcvm_vld
                                          && ctrl_rf_pipe6_srcv2_vld;
assign ctrl_rf_pipe4_vreg_lch_fail      = ctrl_rf_pipe4_srcvm_vld
                                          && ctrl_rf_pipe7_srcv2_vld;

//----------------------------------------------------------
//               unsplit vmlu share lch fail
//----------------------------------------------------------
//need to consider pipe7 lch fail, avoiding dead lock:
//if pipe7 vmul unsplit lch fail pipe6 older inst x, older inst x
//may lch fail pipe7 vmul unsplit through src no ready
assign ctrl_rf_pipe7_vmul_unsplit_vld   = ctrl_rf_pipe7_inst_vld
                                          && !ctrl_rf_pipe7_lch_fail
                                          && dp_ctrl_rf_pipe7_vmul_unsplit;
assign ctrl_rf_pipe6_vmul_vld           = ctrl_rf_pipe7_inst_vld
                                          && dp_ctrl_rf_pipe6_vmul;
//pipe7 vmul unsplit inst will share pipe6 vmul
//so lch fail pipe6 vmul at this situation
assign ctrl_rf_pipe6_vmul_unsplit_lch_fail = ctrl_rf_pipe7_vmul_unsplit_vld
                                             && ctrl_rf_pipe6_vmul_vld;

//----------------------------------------------------------
//                 Launch Fail Signals
//----------------------------------------------------------
//lch fail without src no rdy
assign ctrl_rf_pipe0_other_lch_fail     = ctrl_rf_pipe0_vdiv_mtvr_lch_fail;
assign ctrl_rf_pipe3_other_lch_fail     = ctrl_rf_pipe3_preg_lch_fail
                                          || ctrl_rf_pipe3_vreg_lch_fail;
assign ctrl_rf_pipe4_other_lch_fail     = ctrl_rf_pipe4_vreg_lch_fail;
assign ctrl_rf_pipe5_other_lch_fail     = ctrl_rf_pipe5_preg_lch_fail;
assign ctrl_rf_pipe6_other_lch_fail     = ctrl_rf_pipe6_div_mfvr_lch_fail
                                          || ctrl_rf_pipe6_vmul_unsplit_lch_fail;
assign ctrl_rf_pipe7_other_lch_fail     = ctrl_rf_pipe7_mult_mfvr_lch_fail;

//output to dp
assign ctrl_dp_rf_pipe0_other_lch_fail  = ctrl_rf_pipe0_other_lch_fail;
assign ctrl_dp_rf_pipe3_other_lch_fail  = ctrl_rf_pipe3_other_lch_fail;
assign ctrl_dp_rf_pipe4_other_lch_fail  = ctrl_rf_pipe4_other_lch_fail;
assign ctrl_dp_rf_pipe5_other_lch_fail  = ctrl_rf_pipe5_other_lch_fail;
assign ctrl_dp_rf_pipe6_other_lch_fail  = ctrl_rf_pipe6_other_lch_fail;
assign ctrl_dp_rf_pipe7_other_lch_fail  = ctrl_rf_pipe7_other_lch_fail;

//should consider src no ready lch fail
assign ctrl_rf_pipe0_lch_fail           = dp_ctrl_rf_pipe0_src_no_rdy
                                          || ctrl_rf_pipe0_other_lch_fail;
assign ctrl_rf_pipe1_lch_fail           = dp_ctrl_rf_pipe1_src_no_rdy;

assign ctrl_rf_pipe2_lch_fail           = dp_ctrl_rf_pipe2_src_no_rdy;

assign ctrl_rf_pipe3_lch_fail           = dp_ctrl_rf_pipe3_src_no_rdy
                                          || ctrl_rf_pipe3_other_lch_fail;
assign ctrl_rf_pipe4_lch_fail           = dp_ctrl_rf_pipe4_src_no_rdy
                                          || ctrl_rf_pipe4_other_lch_fail;
assign ctrl_rf_pipe5_lch_fail           = dp_ctrl_rf_pipe5_src_no_rdy
                                          || ctrl_rf_pipe5_other_lch_fail;
assign ctrl_rf_pipe6_lch_fail           = dp_ctrl_rf_pipe6_src_no_rdy
                                          || ctrl_rf_pipe6_other_lch_fail;
assign ctrl_rf_pipe7_lch_fail           = dp_ctrl_rf_pipe7_src_no_rdy
                                          || ctrl_rf_pipe7_other_lch_fail;

//==========================================================
//                    RF Control Signals
//==========================================================
//----------------------------------------------------------
//                    RF pipedown valid
//----------------------------------------------------------
assign ctrl_rf_pipe0_pipedown_vld       = ctrl_rf_pipe0_inst_vld
                                          && !ctrl_rf_pipe0_lch_fail;
assign ctrl_rf_pipe1_pipedown_vld       = ctrl_rf_pipe1_inst_vld
                                          && !ctrl_rf_pipe1_lch_fail;
assign ctrl_rf_pipe2_pipedown_vld       = ctrl_rf_pipe2_inst_vld
                                          && !ctrl_rf_pipe2_lch_fail;
assign ctrl_rf_pipe3_pipedown_vld       = ctrl_rf_pipe3_inst_vld
                                          && !ctrl_rf_pipe3_lch_fail;
assign ctrl_rf_pipe4_pipedown_vld       = ctrl_rf_pipe4_inst_vld
                                          && !ctrl_rf_pipe4_lch_fail;
assign ctrl_rf_pipe5_pipedown_vld       = ctrl_rf_pipe5_inst_vld
                                          && !ctrl_rf_pipe5_lch_fail;
assign ctrl_rf_pipe6_pipedown_vld       = ctrl_rf_pipe6_inst_vld
                                          && !ctrl_rf_pipe6_lch_fail;
assign ctrl_rf_pipe7_pipedown_vld       = ctrl_rf_pipe7_inst_vld
                                          && !ctrl_rf_pipe7_lch_fail;

//----------------------------------------------------------
//                 lch fail to clear iq frz
//----------------------------------------------------------
assign ctrl_aiq0_rf_lch_fail_vld        = ctrl_rf_pipe0_inst_vld
                                          && ctrl_rf_pipe0_lch_fail;
assign ctrl_aiq1_rf_lch_fail_vld        = ctrl_rf_pipe1_inst_vld
                                          && ctrl_rf_pipe1_lch_fail;
assign ctrl_biq_rf_lch_fail_vld         = ctrl_rf_pipe2_inst_vld
                                          && ctrl_rf_pipe2_lch_fail;
assign ctrl_lsiq_rf_pipe3_lch_fail_vld  = ctrl_rf_pipe3_inst_vld
                                          && ctrl_rf_pipe3_lch_fail;
assign ctrl_lsiq_rf_pipe4_lch_fail_vld  = ctrl_rf_pipe4_inst_vld
                                          && ctrl_rf_pipe4_lch_fail;
assign ctrl_sdiq_rf_lch_fail_vld        = ctrl_rf_pipe5_inst_vld
                                          && ctrl_rf_pipe5_lch_fail;
assign ctrl_viq0_rf_lch_fail_vld        = ctrl_rf_pipe6_inst_vld
                                          && ctrl_rf_pipe6_lch_fail;
assign ctrl_viq1_rf_lch_fail_vld        = ctrl_rf_pipe7_inst_vld
                                          && ctrl_rf_pipe7_lch_fail;

//----------------------------------------------------------
//               no lch fail to pop iq entry
//----------------------------------------------------------
//pipe3/4/5 pop by LSU
assign ctrl_aiq0_rf_pop_vld             = ctrl_rf_pipe0_pipedown_vld;
assign ctrl_aiq1_rf_pop_vld             = ctrl_rf_pipe1_pipedown_vld;
assign ctrl_biq_rf_pop_vld              = ctrl_rf_pipe2_pipedown_vld;
assign ctrl_viq0_rf_pop_vld             = ctrl_rf_pipe6_pipedown_vld;
assign ctrl_viq1_rf_pop_vld             = ctrl_rf_pipe7_pipedown_vld;
//pop singals for IR dlb, optimized for timing
assign ctrl_aiq0_rf_pop_dlb_vld         = ctrl_rf_pipe0_inst_vld;
assign ctrl_aiq1_rf_pop_dlb_vld         = ctrl_rf_pipe1_inst_vld;
assign ctrl_viq0_rf_pop_dlb_vld         = ctrl_rf_pipe6_inst_vld;
assign ctrl_viq1_rf_pop_dlb_vld         = ctrl_rf_pipe7_inst_vld;

//----------------------------------------------------------
//                    lch fail for hpcp
//----------------------------------------------------------
//lch fail by src no rdy
assign ctrl_rf_hpcp_pipe0_rf_lch_fail_vld = ctrl_rf_pipe0_inst_vld
                                            && dp_ctrl_rf_pipe0_src_no_rdy;
assign ctrl_rf_hpcp_pipe1_rf_lch_fail_vld = ctrl_rf_pipe1_inst_vld
                                            && dp_ctrl_rf_pipe1_src_no_rdy;
assign ctrl_rf_hpcp_pipe2_rf_lch_fail_vld = ctrl_rf_pipe2_inst_vld
                                            && dp_ctrl_rf_pipe2_src_no_rdy;
assign ctrl_rf_hpcp_pipe3_rf_lch_fail_vld = ctrl_rf_pipe3_inst_vld
                                            && dp_ctrl_rf_pipe3_src_no_rdy;
assign ctrl_rf_hpcp_pipe4_rf_lch_fail_vld = ctrl_rf_pipe4_inst_vld
                                            && dp_ctrl_rf_pipe4_src_no_rdy;
assign ctrl_rf_hpcp_pipe5_rf_lch_fail_vld = ctrl_rf_pipe5_inst_vld
                                            && dp_ctrl_rf_pipe5_src_no_rdy;
assign ctrl_rf_hpcp_pipe6_rf_lch_fail_vld = ctrl_rf_pipe6_inst_vld
                                            && dp_ctrl_rf_pipe6_src_no_rdy;
assign ctrl_rf_hpcp_pipe7_rf_lch_fail_vld = ctrl_rf_pipe7_inst_vld
                                            && dp_ctrl_rf_pipe7_src_no_rdy;
//lch fail by preg share
assign ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld = ctrl_rf_pipe3_inst_vld
                                                && (ctrl_rf_pipe3_preg_lch_fail
                                                 || ctrl_rf_pipe3_vreg_lch_fail);
assign ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld = ctrl_rf_pipe4_inst_vld
                                                && ctrl_rf_pipe4_vreg_lch_fail;
assign ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld = ctrl_rf_pipe5_inst_vld
                                                && ctrl_rf_pipe5_preg_lch_fail;

//----------------------------------------------------------
//                staddr rdy set for SDIQ
//----------------------------------------------------------
//staddr replayed after DC stage should not set stdata ready, because
//its stdata already poped after staddr signal valid at DC stage
assign ctrl_sdiq_rf_staddr_rdy_set        = ctrl_rf_pipe4_inst_vld
                                            && !ctrl_rf_pipe4_lch_fail
                                            && dp_ctrl_rf_pipe4_staddr;

//==========================================================
//                RF Execution Unit Selection
//==========================================================
//----------------------------------------------------------
//               Pipe0 Exectuion Unit Selection
//----------------------------------------------------------
assign ctrl_rf_pipe0_eu_sel[3:0] =
         {4{ctrl_rf_pipe0_pipedown_vld}} & dp_ctrl_rf_pipe0_eu_sel[3:0];
assign ctrl_rf_pipe0_eu_gateclk_sel[3:0] =
         {4{ctrl_rf_pipe0_inst_vld}}     & dp_ctrl_rf_pipe0_eu_sel[3:0];

assign idu_cp0_rf_sel                   = ctrl_rf_pipe0_eu_sel[3];
assign idu_iu_rf_special_sel            = ctrl_rf_pipe0_eu_sel[2];
assign idu_iu_rf_div_sel                = ctrl_rf_pipe0_eu_sel[1];
assign idu_iu_rf_pipe0_sel              = ctrl_rf_pipe0_eu_sel[0];

assign idu_cp0_rf_gateclk_sel           = ctrl_rf_pipe0_eu_gateclk_sel[3];
assign idu_iu_rf_special_gateclk_sel    = ctrl_rf_pipe0_eu_gateclk_sel[2];
assign idu_iu_rf_div_gateclk_sel        = ctrl_rf_pipe0_eu_gateclk_sel[1];
assign idu_iu_rf_pipe0_gateclk_sel      = ctrl_rf_pipe0_eu_gateclk_sel[0];
assign idu_iu_rf_pipe0_cbus_gateclk_sel = ctrl_rf_pipe0_inst_vld;

//----------------------------------------------------------
//               Pipe1 Exectuion Unit Selection
//----------------------------------------------------------
assign ctrl_rf_pipe1_eu_sel[1:0] =
         {2{ctrl_rf_pipe1_pipedown_vld}} & dp_ctrl_rf_pipe1_eu_sel[1:0];
assign ctrl_rf_pipe1_eu_gateclk_sel[1:0] =
         {2{ctrl_rf_pipe1_inst_vld}}     & dp_ctrl_rf_pipe1_eu_sel[1:0];

assign idu_iu_rf_mult_sel               = ctrl_rf_pipe1_eu_sel[1];
assign idu_iu_rf_pipe1_sel              = ctrl_rf_pipe1_eu_sel[0];

assign idu_iu_rf_mult_gateclk_sel       = ctrl_rf_pipe1_eu_gateclk_sel[1];
assign idu_iu_rf_pipe1_gateclk_sel      = ctrl_rf_pipe1_eu_gateclk_sel[0];
assign idu_iu_rf_pipe1_cbus_gateclk_sel = ctrl_rf_pipe1_inst_vld;

//----------------------------------------------------------
//               Pipe2 Exectuion Unit Selection
//----------------------------------------------------------
assign idu_iu_rf_bju_sel            = ctrl_rf_pipe2_pipedown_vld;
assign idu_iu_rf_bju_gateclk_sel    = ctrl_rf_pipe2_inst_vld;

//----------------------------------------------------------
//               Pipe3 Exectuion Unit Selection
//----------------------------------------------------------
assign idu_lsu_rf_pipe3_sel         = ctrl_rf_pipe3_pipedown_vld;
assign idu_lsu_rf_pipe3_gateclk_sel = ctrl_rf_pipe3_inst_vld;

//----------------------------------------------------------
//               Pipe4 Exectuion Unit Selection
//----------------------------------------------------------
assign idu_lsu_rf_pipe4_sel         = ctrl_rf_pipe4_pipedown_vld;
assign idu_lsu_rf_pipe4_gateclk_sel = ctrl_rf_pipe4_inst_vld;

//----------------------------------------------------------
//               Pipe5 Exectuion Unit Selection
//----------------------------------------------------------
assign idu_lsu_rf_pipe5_sel         = ctrl_rf_pipe5_pipedown_vld;
assign idu_lsu_rf_pipe5_gateclk_sel = ctrl_rf_pipe5_inst_vld;
//----------------------------------------------------------
//               Pipe6 Exectuion Unit Selection
//----------------------------------------------------------
assign idu_vfpu_rf_pipe6_sel         = ctrl_rf_pipe6_pipedown_vld;
assign idu_vfpu_rf_pipe6_gateclk_sel = ctrl_rf_pipe6_inst_vld;

//----------------------------------------------------------
//               Pipe7 Exectuion Unit Selection
//----------------------------------------------------------
assign idu_vfpu_rf_pipe7_sel         = ctrl_rf_pipe7_pipedown_vld;
assign idu_vfpu_rf_pipe7_gateclk_sel = ctrl_rf_pipe7_inst_vld;

//==========================================================
//                   Performance Monitor
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign hpcp_clk_en = hpcp_idu_cnt_en
                     && ctrl_rf_hpcp_inst_vld
                     || ctrl_rf_hpcp_inst_vld_ff;
// &Instance("gated_clk_cell", "x_hpcp_gated_clk"); @744
gated_clk_cell  x_hpcp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (hpcp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (hpcp_clk_en       ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @745
//          .external_en (1'b0), @746
//          .global_en   (cp0_yy_clk_en), @747
//          .module_en   (cp0_idu_icg_en), @748
//          .local_en    (hpcp_clk_en), @749
//          .clk_out     (hpcp_clk)); @750

//----------------------------------------------------------
//                    RF inst valid
//----------------------------------------------------------
assign ctrl_rf_hpcp_inst_vld    = rf_pipe0_inst_vld
                               || rf_pipe1_inst_vld
                               || rf_pipe2_inst_vld
                               || rf_pipe3_inst_vld
                               || rf_pipe4_inst_vld
                               || rf_pipe5_inst_vld
                               || rf_pipe6_inst_vld
                               || rf_pipe7_inst_vld;
assign ctrl_rf_hpcp_inst_vld_ff = ctrl_rf_hpcp_pipe0_inst_vld_ff
                               || ctrl_rf_hpcp_pipe1_inst_vld_ff
                               || ctrl_rf_hpcp_pipe2_inst_vld_ff
                               || ctrl_rf_hpcp_pipe3_inst_vld_ff
                               || ctrl_rf_hpcp_pipe4_inst_vld_ff
                               || ctrl_rf_hpcp_pipe5_inst_vld_ff
                               || ctrl_rf_hpcp_pipe6_inst_vld_ff
                               || ctrl_rf_hpcp_pipe7_inst_vld_ff;

//----------------------------------------------------------
//              RF stage performance monitor
//----------------------------------------------------------
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_rf_hpcp_pipe0_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe1_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe2_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe3_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe4_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe5_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe6_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe7_inst_vld_ff            <= 1'b0;

    ctrl_rf_hpcp_pipe0_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe1_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe2_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe3_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe4_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe5_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe6_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe7_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld_ff <= 1'b0;
    ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld_ff <= 1'b0;
    ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld_ff <= 1'b0;
  end
  else if(hpcp_idu_cnt_en && ctrl_rf_hpcp_inst_vld) begin
    ctrl_rf_hpcp_pipe0_inst_vld_ff            <= ctrl_rf_pipe0_inst_vld;
    ctrl_rf_hpcp_pipe1_inst_vld_ff            <= ctrl_rf_pipe1_inst_vld;
    ctrl_rf_hpcp_pipe2_inst_vld_ff            <= ctrl_rf_pipe2_inst_vld;
    ctrl_rf_hpcp_pipe3_inst_vld_ff            <= ctrl_rf_pipe3_inst_vld;
    ctrl_rf_hpcp_pipe4_inst_vld_ff            <= ctrl_rf_pipe4_inst_vld;
    ctrl_rf_hpcp_pipe5_inst_vld_ff            <= ctrl_rf_pipe5_inst_vld;
    ctrl_rf_hpcp_pipe6_inst_vld_ff            <= ctrl_rf_pipe6_inst_vld;
    ctrl_rf_hpcp_pipe7_inst_vld_ff            <= ctrl_rf_pipe7_inst_vld;
                                                                                          
    ctrl_rf_hpcp_pipe0_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe0_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe1_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe1_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe2_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe2_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe3_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe3_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe4_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe4_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe5_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe5_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe6_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe6_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe7_rf_lch_fail_vld_ff     <= ctrl_rf_hpcp_pipe7_rf_lch_fail_vld;
    ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld_ff <= ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld;
    ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld_ff <= ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld;
    ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld_ff <= ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld;
  end
  else begin
    ctrl_rf_hpcp_pipe0_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe1_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe2_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe3_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe4_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe5_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe6_inst_vld_ff            <= 1'b0;
    ctrl_rf_hpcp_pipe7_inst_vld_ff            <= 1'b0;

    ctrl_rf_hpcp_pipe0_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe1_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe2_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe3_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe4_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe5_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe6_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe7_rf_lch_fail_vld_ff     <= 1'b0;
    ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld_ff <= 1'b0;
    ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld_ff <= 1'b0;
    ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld_ff <= 1'b0;
  end
end

assign idu_hpcp_rf_inst_vld               = ctrl_rf_hpcp_inst_vld_ff;

assign idu_hpcp_rf_pipe0_inst_vld         = ctrl_rf_hpcp_pipe0_inst_vld_ff;
assign idu_hpcp_rf_pipe1_inst_vld         = ctrl_rf_hpcp_pipe1_inst_vld_ff;
assign idu_hpcp_rf_pipe2_inst_vld         = ctrl_rf_hpcp_pipe2_inst_vld_ff;
assign idu_hpcp_rf_pipe3_inst_vld         = ctrl_rf_hpcp_pipe3_inst_vld_ff;
assign idu_hpcp_rf_pipe4_inst_vld         = ctrl_rf_hpcp_pipe4_inst_vld_ff;
assign idu_hpcp_rf_pipe5_inst_vld         = ctrl_rf_hpcp_pipe5_inst_vld_ff;
assign idu_hpcp_rf_pipe6_inst_vld         = ctrl_rf_hpcp_pipe6_inst_vld_ff;
assign idu_hpcp_rf_pipe7_inst_vld         = ctrl_rf_hpcp_pipe7_inst_vld_ff;

assign idu_hpcp_rf_pipe0_lch_fail_vld     = ctrl_rf_hpcp_pipe0_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe1_lch_fail_vld     = ctrl_rf_hpcp_pipe1_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe2_lch_fail_vld     = ctrl_rf_hpcp_pipe2_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe3_lch_fail_vld     = ctrl_rf_hpcp_pipe3_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe4_lch_fail_vld     = ctrl_rf_hpcp_pipe4_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe5_lch_fail_vld     = ctrl_rf_hpcp_pipe5_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe6_lch_fail_vld     = ctrl_rf_hpcp_pipe6_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe7_lch_fail_vld     = ctrl_rf_hpcp_pipe7_rf_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe3_reg_lch_fail_vld = ctrl_rf_hpcp_pipe3_rf_reg_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe4_reg_lch_fail_vld = ctrl_rf_hpcp_pipe4_rf_reg_lch_fail_vld_ff;
assign idu_hpcp_rf_pipe5_reg_lch_fail_vld = ctrl_rf_hpcp_pipe5_rf_reg_lch_fail_vld_ff;


// &ModuleEnd; @869
endmodule


