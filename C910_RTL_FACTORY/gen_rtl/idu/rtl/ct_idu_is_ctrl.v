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
module ct_idu_is_ctrl(
  aiq0_ctrl_1_left_updt,
  aiq0_ctrl_empty,
  aiq0_ctrl_full,
  aiq0_ctrl_full_updt,
  aiq0_ctrl_full_updt_clk_en,
  aiq1_ctrl_1_left_updt,
  aiq1_ctrl_empty,
  aiq1_ctrl_full,
  aiq1_ctrl_full_updt,
  aiq1_ctrl_full_updt_clk_en,
  biq_ctrl_1_left_updt,
  biq_ctrl_empty,
  biq_ctrl_full,
  biq_ctrl_full_updt,
  biq_ctrl_full_updt_clk_en,
  cp0_idu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_aiq0_create0_dp_en,
  ctrl_aiq0_create0_en,
  ctrl_aiq0_create0_gateclk_en,
  ctrl_aiq0_create1_dp_en,
  ctrl_aiq0_create1_en,
  ctrl_aiq0_create1_gateclk_en,
  ctrl_aiq1_create0_dp_en,
  ctrl_aiq1_create0_en,
  ctrl_aiq1_create0_gateclk_en,
  ctrl_aiq1_create1_dp_en,
  ctrl_aiq1_create1_en,
  ctrl_aiq1_create1_gateclk_en,
  ctrl_biq_create0_dp_en,
  ctrl_biq_create0_en,
  ctrl_biq_create0_gateclk_en,
  ctrl_biq_create1_dp_en,
  ctrl_biq_create1_en,
  ctrl_biq_create1_gateclk_en,
  ctrl_dp_dis_inst0_ereg_vld,
  ctrl_dp_dis_inst0_freg_vld,
  ctrl_dp_dis_inst0_preg_vld,
  ctrl_dp_dis_inst0_vreg_vld,
  ctrl_dp_dis_inst1_ereg_vld,
  ctrl_dp_dis_inst1_freg_vld,
  ctrl_dp_dis_inst1_preg_vld,
  ctrl_dp_dis_inst1_vreg_vld,
  ctrl_dp_dis_inst2_ereg_vld,
  ctrl_dp_dis_inst2_freg_vld,
  ctrl_dp_dis_inst2_preg_vld,
  ctrl_dp_dis_inst2_vreg_vld,
  ctrl_dp_dis_inst3_ereg_vld,
  ctrl_dp_dis_inst3_freg_vld,
  ctrl_dp_dis_inst3_preg_vld,
  ctrl_dp_dis_inst3_vreg_vld,
  ctrl_dp_is_dis_aiq0_create0_sel,
  ctrl_dp_is_dis_aiq0_create1_sel,
  ctrl_dp_is_dis_aiq1_create0_sel,
  ctrl_dp_is_dis_aiq1_create1_sel,
  ctrl_dp_is_dis_biq_create0_sel,
  ctrl_dp_is_dis_biq_create1_sel,
  ctrl_dp_is_dis_lsiq_create0_sel,
  ctrl_dp_is_dis_lsiq_create1_sel,
  ctrl_dp_is_dis_pst_create1_iid_sel,
  ctrl_dp_is_dis_pst_create2_iid_sel,
  ctrl_dp_is_dis_pst_create3_iid_sel,
  ctrl_dp_is_dis_rob_create0_sel,
  ctrl_dp_is_dis_rob_create1_sel,
  ctrl_dp_is_dis_rob_create2_sel,
  ctrl_dp_is_dis_sdiq_create0_sel,
  ctrl_dp_is_dis_sdiq_create1_sel,
  ctrl_dp_is_dis_stall,
  ctrl_dp_is_dis_viq0_create0_sel,
  ctrl_dp_is_dis_viq0_create1_sel,
  ctrl_dp_is_dis_viq1_create0_sel,
  ctrl_dp_is_dis_viq1_create1_sel,
  ctrl_dp_is_dis_vmb_create0_sel,
  ctrl_dp_is_dis_vmb_create1_sel,
  ctrl_dp_is_inst0_vld,
  ctrl_dp_is_inst1_vld,
  ctrl_dp_is_inst2_vld,
  ctrl_dp_is_inst3_vld,
  ctrl_fence_is_pipe_empty,
  ctrl_ir_pipedown_gateclk,
  ctrl_ir_pipedown_inst0_vld,
  ctrl_ir_pipedown_inst1_vld,
  ctrl_ir_pipedown_inst2_vld,
  ctrl_ir_pipedown_inst3_vld,
  ctrl_ir_pre_dis_aiq0_create0_en,
  ctrl_ir_pre_dis_aiq0_create0_sel,
  ctrl_ir_pre_dis_aiq0_create1_en,
  ctrl_ir_pre_dis_aiq0_create1_sel,
  ctrl_ir_pre_dis_aiq1_create0_en,
  ctrl_ir_pre_dis_aiq1_create0_sel,
  ctrl_ir_pre_dis_aiq1_create1_en,
  ctrl_ir_pre_dis_aiq1_create1_sel,
  ctrl_ir_pre_dis_biq_create0_en,
  ctrl_ir_pre_dis_biq_create0_sel,
  ctrl_ir_pre_dis_biq_create1_en,
  ctrl_ir_pre_dis_biq_create1_sel,
  ctrl_ir_pre_dis_inst0_vld,
  ctrl_ir_pre_dis_inst1_vld,
  ctrl_ir_pre_dis_inst2_vld,
  ctrl_ir_pre_dis_inst3_vld,
  ctrl_ir_pre_dis_lsiq_create0_en,
  ctrl_ir_pre_dis_lsiq_create0_sel,
  ctrl_ir_pre_dis_lsiq_create1_en,
  ctrl_ir_pre_dis_lsiq_create1_sel,
  ctrl_ir_pre_dis_pipedown2,
  ctrl_ir_pre_dis_pst_create1_iid_sel,
  ctrl_ir_pre_dis_pst_create2_iid_sel,
  ctrl_ir_pre_dis_pst_create3_iid_sel,
  ctrl_ir_pre_dis_rob_create0_sel,
  ctrl_ir_pre_dis_rob_create1_en,
  ctrl_ir_pre_dis_rob_create1_sel,
  ctrl_ir_pre_dis_rob_create2_en,
  ctrl_ir_pre_dis_rob_create2_sel,
  ctrl_ir_pre_dis_rob_create3_en,
  ctrl_ir_pre_dis_sdiq_create0_en,
  ctrl_ir_pre_dis_sdiq_create0_sel,
  ctrl_ir_pre_dis_sdiq_create1_en,
  ctrl_ir_pre_dis_sdiq_create1_sel,
  ctrl_ir_pre_dis_viq0_create0_en,
  ctrl_ir_pre_dis_viq0_create0_sel,
  ctrl_ir_pre_dis_viq0_create1_en,
  ctrl_ir_pre_dis_viq0_create1_sel,
  ctrl_ir_pre_dis_viq1_create0_en,
  ctrl_ir_pre_dis_viq1_create0_sel,
  ctrl_ir_pre_dis_viq1_create1_en,
  ctrl_ir_pre_dis_viq1_create1_sel,
  ctrl_ir_pre_dis_vmb_create0_en,
  ctrl_ir_pre_dis_vmb_create0_sel,
  ctrl_ir_pre_dis_vmb_create1_en,
  ctrl_ir_pre_dis_vmb_create1_sel,
  ctrl_ir_type_stall_inst2_vld,
  ctrl_ir_type_stall_inst3_vld,
  ctrl_is_dis_type_stall,
  ctrl_is_inst2_vld,
  ctrl_is_inst3_vld,
  ctrl_is_stall,
  ctrl_lsiq_create0_dp_en,
  ctrl_lsiq_create0_en,
  ctrl_lsiq_create0_gateclk_en,
  ctrl_lsiq_create1_dp_en,
  ctrl_lsiq_create1_en,
  ctrl_lsiq_create1_gateclk_en,
  ctrl_lsiq_is_bar_inst_vld,
  ctrl_sdiq_create0_dp_en,
  ctrl_sdiq_create0_en,
  ctrl_sdiq_create0_gateclk_en,
  ctrl_sdiq_create1_dp_en,
  ctrl_sdiq_create1_en,
  ctrl_sdiq_create1_gateclk_en,
  ctrl_top_is_dis_pipedown2,
  ctrl_top_is_inst0_vld,
  ctrl_top_is_inst1_vld,
  ctrl_top_is_inst2_vld,
  ctrl_top_is_inst3_vld,
  ctrl_top_is_iq_full,
  ctrl_top_is_vmb_full,
  ctrl_viq0_create0_dp_en,
  ctrl_viq0_create0_en,
  ctrl_viq0_create0_gateclk_en,
  ctrl_viq0_create1_dp_en,
  ctrl_viq0_create1_en,
  ctrl_viq0_create1_gateclk_en,
  ctrl_viq1_create0_dp_en,
  ctrl_viq1_create0_en,
  ctrl_viq1_create0_gateclk_en,
  ctrl_viq1_create1_dp_en,
  ctrl_viq1_create1_en,
  ctrl_viq1_create1_gateclk_en,
  ctrl_xx_is_inst0_sel,
  ctrl_xx_is_inst_sel,
  dp_ctrl_is_inst0_bar,
  dp_ctrl_is_inst0_dst_vld,
  dp_ctrl_is_inst0_dste_vld,
  dp_ctrl_is_inst0_dstv_vec,
  dp_ctrl_is_inst0_dstv_vld,
  dp_ctrl_is_inst0_pcfifo,
  dp_ctrl_is_inst1_bar,
  dp_ctrl_is_inst1_dst_vld,
  dp_ctrl_is_inst1_dste_vld,
  dp_ctrl_is_inst1_dstv_vec,
  dp_ctrl_is_inst1_dstv_vld,
  dp_ctrl_is_inst1_pcfifo,
  dp_ctrl_is_inst2_bar,
  dp_ctrl_is_inst2_dst_vld,
  dp_ctrl_is_inst2_dste_vld,
  dp_ctrl_is_inst2_dstv_vec,
  dp_ctrl_is_inst2_dstv_vld,
  dp_ctrl_is_inst2_pcfifo,
  dp_ctrl_is_inst3_bar,
  dp_ctrl_is_inst3_dst_vld,
  dp_ctrl_is_inst3_dste_vld,
  dp_ctrl_is_inst3_dstv_vec,
  dp_ctrl_is_inst3_dstv_vld,
  dp_ctrl_is_inst3_pcfifo,
  forever_cpuclk,
  idu_had_iq_empty,
  idu_iu_is_pcfifo_inst_num,
  idu_iu_is_pcfifo_inst_vld,
  idu_lsu_vmb_create0_dp_en,
  idu_lsu_vmb_create0_en,
  idu_lsu_vmb_create0_gateclk_en,
  idu_lsu_vmb_create1_dp_en,
  idu_lsu_vmb_create1_en,
  idu_lsu_vmb_create1_gateclk_en,
  idu_rtu_pst_dis_inst0_ereg_vld,
  idu_rtu_pst_dis_inst0_freg_vld,
  idu_rtu_pst_dis_inst0_preg_vld,
  idu_rtu_pst_dis_inst0_vreg_vld,
  idu_rtu_pst_dis_inst1_ereg_vld,
  idu_rtu_pst_dis_inst1_freg_vld,
  idu_rtu_pst_dis_inst1_preg_vld,
  idu_rtu_pst_dis_inst1_vreg_vld,
  idu_rtu_pst_dis_inst2_ereg_vld,
  idu_rtu_pst_dis_inst2_freg_vld,
  idu_rtu_pst_dis_inst2_preg_vld,
  idu_rtu_pst_dis_inst2_vreg_vld,
  idu_rtu_pst_dis_inst3_ereg_vld,
  idu_rtu_pst_dis_inst3_freg_vld,
  idu_rtu_pst_dis_inst3_preg_vld,
  idu_rtu_pst_dis_inst3_vreg_vld,
  idu_rtu_rob_create0_dp_en,
  idu_rtu_rob_create0_en,
  idu_rtu_rob_create0_gateclk_en,
  idu_rtu_rob_create1_dp_en,
  idu_rtu_rob_create1_en,
  idu_rtu_rob_create1_gateclk_en,
  idu_rtu_rob_create2_dp_en,
  idu_rtu_rob_create2_en,
  idu_rtu_rob_create2_gateclk_en,
  idu_rtu_rob_create3_dp_en,
  idu_rtu_rob_create3_en,
  idu_rtu_rob_create3_gateclk_en,
  iu_yy_xx_cancel,
  lsiq_ctrl_1_left_updt,
  lsiq_ctrl_empty,
  lsiq_ctrl_full,
  lsiq_ctrl_full_updt,
  lsiq_ctrl_full_updt_clk_en,
  lsu_idu_vmb_1_left_updt,
  lsu_idu_vmb_empty,
  lsu_idu_vmb_full,
  lsu_idu_vmb_full_updt,
  lsu_idu_vmb_full_updt_clk_en,
  pad_yy_icg_scan_en,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_idu_rob_full,
  rtu_yy_xx_flush,
  sdiq_ctrl_1_left_updt,
  sdiq_ctrl_empty,
  sdiq_ctrl_full,
  sdiq_ctrl_full_updt,
  sdiq_ctrl_full_updt_clk_en,
  viq0_ctrl_1_left_updt,
  viq0_ctrl_empty,
  viq0_ctrl_full,
  viq0_ctrl_full_updt,
  viq0_ctrl_full_updt_clk_en,
  viq1_ctrl_1_left_updt,
  viq1_ctrl_empty,
  viq1_ctrl_full,
  viq1_ctrl_full_updt,
  viq1_ctrl_full_updt_clk_en
);

// &Ports; @28
input          aiq0_ctrl_1_left_updt;              
input          aiq0_ctrl_empty;                    
input          aiq0_ctrl_full;                     
input          aiq0_ctrl_full_updt;                
input          aiq0_ctrl_full_updt_clk_en;         
input          aiq1_ctrl_1_left_updt;              
input          aiq1_ctrl_empty;                    
input          aiq1_ctrl_full;                     
input          aiq1_ctrl_full_updt;                
input          aiq1_ctrl_full_updt_clk_en;         
input          biq_ctrl_1_left_updt;               
input          biq_ctrl_empty;                     
input          biq_ctrl_full;                      
input          biq_ctrl_full_updt;                 
input          biq_ctrl_full_updt_clk_en;          
input          cp0_idu_icg_en;                     
input          cp0_yy_clk_en;                      
input          cpurst_b;                           
input          ctrl_ir_pipedown_gateclk;           
input          ctrl_ir_pipedown_inst0_vld;         
input          ctrl_ir_pipedown_inst1_vld;         
input          ctrl_ir_pipedown_inst2_vld;         
input          ctrl_ir_pipedown_inst3_vld;         
input          ctrl_ir_pre_dis_aiq0_create0_en;    
input   [1:0]  ctrl_ir_pre_dis_aiq0_create0_sel;   
input          ctrl_ir_pre_dis_aiq0_create1_en;    
input   [1:0]  ctrl_ir_pre_dis_aiq0_create1_sel;   
input          ctrl_ir_pre_dis_aiq1_create0_en;    
input   [1:0]  ctrl_ir_pre_dis_aiq1_create0_sel;   
input          ctrl_ir_pre_dis_aiq1_create1_en;    
input   [1:0]  ctrl_ir_pre_dis_aiq1_create1_sel;   
input          ctrl_ir_pre_dis_biq_create0_en;     
input   [1:0]  ctrl_ir_pre_dis_biq_create0_sel;    
input          ctrl_ir_pre_dis_biq_create1_en;     
input   [1:0]  ctrl_ir_pre_dis_biq_create1_sel;    
input          ctrl_ir_pre_dis_inst0_vld;          
input          ctrl_ir_pre_dis_inst1_vld;          
input          ctrl_ir_pre_dis_inst2_vld;          
input          ctrl_ir_pre_dis_inst3_vld;          
input          ctrl_ir_pre_dis_lsiq_create0_en;    
input   [1:0]  ctrl_ir_pre_dis_lsiq_create0_sel;   
input          ctrl_ir_pre_dis_lsiq_create1_en;    
input   [1:0]  ctrl_ir_pre_dis_lsiq_create1_sel;   
input          ctrl_ir_pre_dis_pipedown2;          
input          ctrl_ir_pre_dis_pst_create1_iid_sel; 
input   [2:0]  ctrl_ir_pre_dis_pst_create2_iid_sel; 
input   [2:0]  ctrl_ir_pre_dis_pst_create3_iid_sel; 
input   [1:0]  ctrl_ir_pre_dis_rob_create0_sel;    
input          ctrl_ir_pre_dis_rob_create1_en;     
input   [2:0]  ctrl_ir_pre_dis_rob_create1_sel;    
input          ctrl_ir_pre_dis_rob_create2_en;     
input   [1:0]  ctrl_ir_pre_dis_rob_create2_sel;    
input          ctrl_ir_pre_dis_rob_create3_en;     
input          ctrl_ir_pre_dis_sdiq_create0_en;    
input   [1:0]  ctrl_ir_pre_dis_sdiq_create0_sel;   
input          ctrl_ir_pre_dis_sdiq_create1_en;    
input   [1:0]  ctrl_ir_pre_dis_sdiq_create1_sel;   
input          ctrl_ir_pre_dis_viq0_create0_en;    
input   [1:0]  ctrl_ir_pre_dis_viq0_create0_sel;   
input          ctrl_ir_pre_dis_viq0_create1_en;    
input   [1:0]  ctrl_ir_pre_dis_viq0_create1_sel;   
input          ctrl_ir_pre_dis_viq1_create0_en;    
input   [1:0]  ctrl_ir_pre_dis_viq1_create0_sel;   
input          ctrl_ir_pre_dis_viq1_create1_en;    
input   [1:0]  ctrl_ir_pre_dis_viq1_create1_sel;   
input          ctrl_ir_pre_dis_vmb_create0_en;     
input   [1:0]  ctrl_ir_pre_dis_vmb_create0_sel;    
input          ctrl_ir_pre_dis_vmb_create1_en;     
input   [1:0]  ctrl_ir_pre_dis_vmb_create1_sel;    
input          ctrl_ir_type_stall_inst2_vld;       
input          ctrl_ir_type_stall_inst3_vld;       
input          dp_ctrl_is_inst0_bar;               
input          dp_ctrl_is_inst0_dst_vld;           
input          dp_ctrl_is_inst0_dste_vld;          
input          dp_ctrl_is_inst0_dstv_vec;          
input          dp_ctrl_is_inst0_dstv_vld;          
input          dp_ctrl_is_inst0_pcfifo;            
input          dp_ctrl_is_inst1_bar;               
input          dp_ctrl_is_inst1_dst_vld;           
input          dp_ctrl_is_inst1_dste_vld;          
input          dp_ctrl_is_inst1_dstv_vec;          
input          dp_ctrl_is_inst1_dstv_vld;          
input          dp_ctrl_is_inst1_pcfifo;            
input          dp_ctrl_is_inst2_bar;               
input          dp_ctrl_is_inst2_dst_vld;           
input          dp_ctrl_is_inst2_dste_vld;          
input          dp_ctrl_is_inst2_dstv_vec;          
input          dp_ctrl_is_inst2_dstv_vld;          
input          dp_ctrl_is_inst2_pcfifo;            
input          dp_ctrl_is_inst3_bar;               
input          dp_ctrl_is_inst3_dst_vld;           
input          dp_ctrl_is_inst3_dste_vld;          
input          dp_ctrl_is_inst3_dstv_vec;          
input          dp_ctrl_is_inst3_dstv_vld;          
input          dp_ctrl_is_inst3_pcfifo;            
input          forever_cpuclk;                     
input          iu_yy_xx_cancel;                    
input          lsiq_ctrl_1_left_updt;              
input          lsiq_ctrl_empty;                    
input          lsiq_ctrl_full;                     
input          lsiq_ctrl_full_updt;                
input          lsiq_ctrl_full_updt_clk_en;         
input          lsu_idu_vmb_1_left_updt;            
input          lsu_idu_vmb_empty;                  
input          lsu_idu_vmb_full;                   
input          lsu_idu_vmb_full_updt;              
input          lsu_idu_vmb_full_updt_clk_en;       
input          pad_yy_icg_scan_en;                 
input          rtu_idu_flush_fe;                   
input          rtu_idu_flush_is;                   
input          rtu_idu_rob_full;                   
input          rtu_yy_xx_flush;                    
input          sdiq_ctrl_1_left_updt;              
input          sdiq_ctrl_empty;                    
input          sdiq_ctrl_full;                     
input          sdiq_ctrl_full_updt;                
input          sdiq_ctrl_full_updt_clk_en;         
input          viq0_ctrl_1_left_updt;              
input          viq0_ctrl_empty;                    
input          viq0_ctrl_full;                     
input          viq0_ctrl_full_updt;                
input          viq0_ctrl_full_updt_clk_en;         
input          viq1_ctrl_1_left_updt;              
input          viq1_ctrl_empty;                    
input          viq1_ctrl_full;                     
input          viq1_ctrl_full_updt;                
input          viq1_ctrl_full_updt_clk_en;         
output         ctrl_aiq0_create0_dp_en;            
output         ctrl_aiq0_create0_en;               
output         ctrl_aiq0_create0_gateclk_en;       
output         ctrl_aiq0_create1_dp_en;            
output         ctrl_aiq0_create1_en;               
output         ctrl_aiq0_create1_gateclk_en;       
output         ctrl_aiq1_create0_dp_en;            
output         ctrl_aiq1_create0_en;               
output         ctrl_aiq1_create0_gateclk_en;       
output         ctrl_aiq1_create1_dp_en;            
output         ctrl_aiq1_create1_en;               
output         ctrl_aiq1_create1_gateclk_en;       
output         ctrl_biq_create0_dp_en;             
output         ctrl_biq_create0_en;                
output         ctrl_biq_create0_gateclk_en;        
output         ctrl_biq_create1_dp_en;             
output         ctrl_biq_create1_en;                
output         ctrl_biq_create1_gateclk_en;        
output         ctrl_dp_dis_inst0_ereg_vld;         
output         ctrl_dp_dis_inst0_freg_vld;         
output         ctrl_dp_dis_inst0_preg_vld;         
output         ctrl_dp_dis_inst0_vreg_vld;         
output         ctrl_dp_dis_inst1_ereg_vld;         
output         ctrl_dp_dis_inst1_freg_vld;         
output         ctrl_dp_dis_inst1_preg_vld;         
output         ctrl_dp_dis_inst1_vreg_vld;         
output         ctrl_dp_dis_inst2_ereg_vld;         
output         ctrl_dp_dis_inst2_freg_vld;         
output         ctrl_dp_dis_inst2_preg_vld;         
output         ctrl_dp_dis_inst2_vreg_vld;         
output         ctrl_dp_dis_inst3_ereg_vld;         
output         ctrl_dp_dis_inst3_freg_vld;         
output         ctrl_dp_dis_inst3_preg_vld;         
output         ctrl_dp_dis_inst3_vreg_vld;         
output  [1:0]  ctrl_dp_is_dis_aiq0_create0_sel;    
output  [1:0]  ctrl_dp_is_dis_aiq0_create1_sel;    
output  [1:0]  ctrl_dp_is_dis_aiq1_create0_sel;    
output  [1:0]  ctrl_dp_is_dis_aiq1_create1_sel;    
output  [1:0]  ctrl_dp_is_dis_biq_create0_sel;     
output  [1:0]  ctrl_dp_is_dis_biq_create1_sel;     
output  [1:0]  ctrl_dp_is_dis_lsiq_create0_sel;    
output  [1:0]  ctrl_dp_is_dis_lsiq_create1_sel;    
output         ctrl_dp_is_dis_pst_create1_iid_sel; 
output  [2:0]  ctrl_dp_is_dis_pst_create2_iid_sel; 
output  [2:0]  ctrl_dp_is_dis_pst_create3_iid_sel; 
output  [1:0]  ctrl_dp_is_dis_rob_create0_sel;     
output  [2:0]  ctrl_dp_is_dis_rob_create1_sel;     
output  [1:0]  ctrl_dp_is_dis_rob_create2_sel;     
output  [1:0]  ctrl_dp_is_dis_sdiq_create0_sel;    
output  [1:0]  ctrl_dp_is_dis_sdiq_create1_sel;    
output         ctrl_dp_is_dis_stall;               
output  [1:0]  ctrl_dp_is_dis_viq0_create0_sel;    
output  [1:0]  ctrl_dp_is_dis_viq0_create1_sel;    
output  [1:0]  ctrl_dp_is_dis_viq1_create0_sel;    
output  [1:0]  ctrl_dp_is_dis_viq1_create1_sel;    
output  [1:0]  ctrl_dp_is_dis_vmb_create0_sel;     
output  [1:0]  ctrl_dp_is_dis_vmb_create1_sel;     
output         ctrl_dp_is_inst0_vld;               
output         ctrl_dp_is_inst1_vld;               
output         ctrl_dp_is_inst2_vld;               
output         ctrl_dp_is_inst3_vld;               
output         ctrl_fence_is_pipe_empty;           
output         ctrl_is_dis_type_stall;             
output         ctrl_is_inst2_vld;                  
output         ctrl_is_inst3_vld;                  
output         ctrl_is_stall;                      
output         ctrl_lsiq_create0_dp_en;            
output         ctrl_lsiq_create0_en;               
output         ctrl_lsiq_create0_gateclk_en;       
output         ctrl_lsiq_create1_dp_en;            
output         ctrl_lsiq_create1_en;               
output         ctrl_lsiq_create1_gateclk_en;       
output         ctrl_lsiq_is_bar_inst_vld;          
output         ctrl_sdiq_create0_dp_en;            
output         ctrl_sdiq_create0_en;               
output         ctrl_sdiq_create0_gateclk_en;       
output         ctrl_sdiq_create1_dp_en;            
output         ctrl_sdiq_create1_en;               
output         ctrl_sdiq_create1_gateclk_en;       
output         ctrl_top_is_dis_pipedown2;          
output         ctrl_top_is_inst0_vld;              
output         ctrl_top_is_inst1_vld;              
output         ctrl_top_is_inst2_vld;              
output         ctrl_top_is_inst3_vld;              
output         ctrl_top_is_iq_full;                
output         ctrl_top_is_vmb_full;               
output         ctrl_viq0_create0_dp_en;            
output         ctrl_viq0_create0_en;               
output         ctrl_viq0_create0_gateclk_en;       
output         ctrl_viq0_create1_dp_en;            
output         ctrl_viq0_create1_en;               
output         ctrl_viq0_create1_gateclk_en;       
output         ctrl_viq1_create0_dp_en;            
output         ctrl_viq1_create0_en;               
output         ctrl_viq1_create0_gateclk_en;       
output         ctrl_viq1_create1_dp_en;            
output         ctrl_viq1_create1_en;               
output         ctrl_viq1_create1_gateclk_en;       
output  [1:0]  ctrl_xx_is_inst0_sel;               
output  [2:0]  ctrl_xx_is_inst_sel;                
output         idu_had_iq_empty;                   
output  [2:0]  idu_iu_is_pcfifo_inst_num;          
output         idu_iu_is_pcfifo_inst_vld;          
output         idu_lsu_vmb_create0_dp_en;          
output         idu_lsu_vmb_create0_en;             
output         idu_lsu_vmb_create0_gateclk_en;     
output         idu_lsu_vmb_create1_dp_en;          
output         idu_lsu_vmb_create1_en;             
output         idu_lsu_vmb_create1_gateclk_en;     
output         idu_rtu_pst_dis_inst0_ereg_vld;     
output         idu_rtu_pst_dis_inst0_freg_vld;     
output         idu_rtu_pst_dis_inst0_preg_vld;     
output         idu_rtu_pst_dis_inst0_vreg_vld;     
output         idu_rtu_pst_dis_inst1_ereg_vld;     
output         idu_rtu_pst_dis_inst1_freg_vld;     
output         idu_rtu_pst_dis_inst1_preg_vld;     
output         idu_rtu_pst_dis_inst1_vreg_vld;     
output         idu_rtu_pst_dis_inst2_ereg_vld;     
output         idu_rtu_pst_dis_inst2_freg_vld;     
output         idu_rtu_pst_dis_inst2_preg_vld;     
output         idu_rtu_pst_dis_inst2_vreg_vld;     
output         idu_rtu_pst_dis_inst3_ereg_vld;     
output         idu_rtu_pst_dis_inst3_freg_vld;     
output         idu_rtu_pst_dis_inst3_preg_vld;     
output         idu_rtu_pst_dis_inst3_vreg_vld;     
output         idu_rtu_rob_create0_dp_en;          
output         idu_rtu_rob_create0_en;             
output         idu_rtu_rob_create0_gateclk_en;     
output         idu_rtu_rob_create1_dp_en;          
output         idu_rtu_rob_create1_en;             
output         idu_rtu_rob_create1_gateclk_en;     
output         idu_rtu_rob_create2_dp_en;          
output         idu_rtu_rob_create2_en;             
output         idu_rtu_rob_create2_gateclk_en;     
output         idu_rtu_rob_create3_dp_en;          
output         idu_rtu_rob_create3_en;             
output         idu_rtu_rob_create3_gateclk_en;     

// &Regs; @29
reg            ctrl_is_iq_full;                    
reg            ctrl_is_vmb_full;                   
reg            is_dis_aiq0_create0_en;             
reg            is_dis_aiq0_create0_en_updt;        
reg     [1:0]  is_dis_aiq0_create0_sel;            
reg            is_dis_aiq0_create1_en;             
reg            is_dis_aiq0_create1_en_updt;        
reg     [1:0]  is_dis_aiq0_create1_sel;            
reg            is_dis_aiq1_create0_en;             
reg            is_dis_aiq1_create0_en_updt;        
reg     [1:0]  is_dis_aiq1_create0_sel;            
reg            is_dis_aiq1_create1_en;             
reg            is_dis_aiq1_create1_en_updt;        
reg     [1:0]  is_dis_aiq1_create1_sel;            
reg            is_dis_biq_create0_en;              
reg            is_dis_biq_create0_en_updt;         
reg     [1:0]  is_dis_biq_create0_sel;             
reg            is_dis_biq_create1_en;              
reg            is_dis_biq_create1_en_updt;         
reg     [1:0]  is_dis_biq_create1_sel;             
reg            is_dis_inst0_vld;                   
reg            is_dis_inst1_vld;                   
reg            is_dis_inst2_vld;                   
reg            is_dis_inst3_vld;                   
reg            is_dis_lsiq_create0_en;             
reg            is_dis_lsiq_create0_en_updt;        
reg     [1:0]  is_dis_lsiq_create0_sel;            
reg            is_dis_lsiq_create1_en;             
reg            is_dis_lsiq_create1_en_updt;        
reg     [1:0]  is_dis_lsiq_create1_sel;            
reg            is_dis_pipedown2;                   
reg            is_dis_pst_create1_iid_sel;         
reg     [2:0]  is_dis_pst_create2_iid_sel;         
reg     [2:0]  is_dis_pst_create3_iid_sel;         
reg     [1:0]  is_dis_rob_create0_sel;             
reg            is_dis_rob_create1_en;              
reg     [2:0]  is_dis_rob_create1_sel;             
reg            is_dis_rob_create2_en;              
reg     [1:0]  is_dis_rob_create2_sel;             
reg            is_dis_rob_create3_en;              
reg            is_dis_sdiq_create0_en;             
reg            is_dis_sdiq_create0_en_updt;        
reg     [1:0]  is_dis_sdiq_create0_sel;            
reg            is_dis_sdiq_create1_en;             
reg            is_dis_sdiq_create1_en_updt;        
reg     [1:0]  is_dis_sdiq_create1_sel;            
reg            is_dis_viq0_create0_en;             
reg            is_dis_viq0_create0_en_updt;        
reg     [1:0]  is_dis_viq0_create0_sel;            
reg            is_dis_viq0_create1_en;             
reg            is_dis_viq0_create1_en_updt;        
reg     [1:0]  is_dis_viq0_create1_sel;            
reg            is_dis_viq1_create0_en;             
reg            is_dis_viq1_create0_en_updt;        
reg     [1:0]  is_dis_viq1_create0_sel;            
reg            is_dis_viq1_create1_en;             
reg            is_dis_viq1_create1_en_updt;        
reg     [1:0]  is_dis_viq1_create1_sel;            
reg            is_dis_vmb_create0_en;              
reg            is_dis_vmb_create0_en_updt;         
reg     [1:0]  is_dis_vmb_create0_sel;             
reg            is_dis_vmb_create1_en;              
reg            is_dis_vmb_create1_en_updt;         
reg     [1:0]  is_dis_vmb_create1_sel;             
reg            is_inst0_vld;                       
reg            is_inst1_vld;                       
reg            is_inst2_vld;                       
reg            is_inst3_vld;                       

// &Wires; @30
wire           aiq0_ctrl_1_left_updt;              
wire           aiq0_ctrl_empty;                    
wire           aiq0_ctrl_full;                     
wire           aiq0_ctrl_full_updt;                
wire           aiq0_ctrl_full_updt_clk_en;         
wire           aiq1_ctrl_1_left_updt;              
wire           aiq1_ctrl_empty;                    
wire           aiq1_ctrl_full;                     
wire           aiq1_ctrl_full_updt;                
wire           aiq1_ctrl_full_updt_clk_en;         
wire           biq_ctrl_1_left_updt;               
wire           biq_ctrl_empty;                     
wire           biq_ctrl_full;                      
wire           biq_ctrl_full_updt;                 
wire           biq_ctrl_full_updt_clk_en;          
wire           cp0_idu_icg_en;                     
wire           cp0_yy_clk_en;                      
wire           cpurst_b;                           
wire           ctrl_aiq0_create0_dp_en;            
wire           ctrl_aiq0_create0_en;               
wire           ctrl_aiq0_create0_gateclk_en;       
wire           ctrl_aiq0_create1_dp_en;            
wire           ctrl_aiq0_create1_en;               
wire           ctrl_aiq0_create1_gateclk_en;       
wire           ctrl_aiq1_create0_dp_en;            
wire           ctrl_aiq1_create0_en;               
wire           ctrl_aiq1_create0_gateclk_en;       
wire           ctrl_aiq1_create1_dp_en;            
wire           ctrl_aiq1_create1_en;               
wire           ctrl_aiq1_create1_gateclk_en;       
wire           ctrl_biq_create0_dp_en;             
wire           ctrl_biq_create0_en;                
wire           ctrl_biq_create0_gateclk_en;        
wire           ctrl_biq_create1_dp_en;             
wire           ctrl_biq_create1_en;                
wire           ctrl_biq_create1_gateclk_en;        
wire           ctrl_dis_inst0_ereg_vld;            
wire           ctrl_dis_inst0_freg_vld;            
wire           ctrl_dis_inst0_preg_vld;            
wire           ctrl_dis_inst0_vreg_vld;            
wire           ctrl_dis_inst1_ereg_vld;            
wire           ctrl_dis_inst1_freg_vld;            
wire           ctrl_dis_inst1_preg_vld;            
wire           ctrl_dis_inst1_vreg_vld;            
wire           ctrl_dis_inst2_ereg_vld;            
wire           ctrl_dis_inst2_freg_vld;            
wire           ctrl_dis_inst2_preg_vld;            
wire           ctrl_dis_inst2_vreg_vld;            
wire           ctrl_dis_inst3_ereg_vld;            
wire           ctrl_dis_inst3_freg_vld;            
wire           ctrl_dis_inst3_preg_vld;            
wire           ctrl_dis_inst3_vreg_vld;            
wire           ctrl_dp_dis_inst0_ereg_vld;         
wire           ctrl_dp_dis_inst0_freg_vld;         
wire           ctrl_dp_dis_inst0_preg_vld;         
wire           ctrl_dp_dis_inst0_vreg_vld;         
wire           ctrl_dp_dis_inst1_ereg_vld;         
wire           ctrl_dp_dis_inst1_freg_vld;         
wire           ctrl_dp_dis_inst1_preg_vld;         
wire           ctrl_dp_dis_inst1_vreg_vld;         
wire           ctrl_dp_dis_inst2_ereg_vld;         
wire           ctrl_dp_dis_inst2_freg_vld;         
wire           ctrl_dp_dis_inst2_preg_vld;         
wire           ctrl_dp_dis_inst2_vreg_vld;         
wire           ctrl_dp_dis_inst3_ereg_vld;         
wire           ctrl_dp_dis_inst3_freg_vld;         
wire           ctrl_dp_dis_inst3_preg_vld;         
wire           ctrl_dp_dis_inst3_vreg_vld;         
wire    [1:0]  ctrl_dp_is_dis_aiq0_create0_sel;    
wire    [1:0]  ctrl_dp_is_dis_aiq0_create1_sel;    
wire    [1:0]  ctrl_dp_is_dis_aiq1_create0_sel;    
wire    [1:0]  ctrl_dp_is_dis_aiq1_create1_sel;    
wire    [1:0]  ctrl_dp_is_dis_biq_create0_sel;     
wire    [1:0]  ctrl_dp_is_dis_biq_create1_sel;     
wire    [1:0]  ctrl_dp_is_dis_lsiq_create0_sel;    
wire    [1:0]  ctrl_dp_is_dis_lsiq_create1_sel;    
wire           ctrl_dp_is_dis_pst_create1_iid_sel; 
wire    [2:0]  ctrl_dp_is_dis_pst_create2_iid_sel; 
wire    [2:0]  ctrl_dp_is_dis_pst_create3_iid_sel; 
wire    [1:0]  ctrl_dp_is_dis_rob_create0_sel;     
wire    [2:0]  ctrl_dp_is_dis_rob_create1_sel;     
wire    [1:0]  ctrl_dp_is_dis_rob_create2_sel;     
wire    [1:0]  ctrl_dp_is_dis_sdiq_create0_sel;    
wire    [1:0]  ctrl_dp_is_dis_sdiq_create1_sel;    
wire           ctrl_dp_is_dis_stall;               
wire    [1:0]  ctrl_dp_is_dis_viq0_create0_sel;    
wire    [1:0]  ctrl_dp_is_dis_viq0_create1_sel;    
wire    [1:0]  ctrl_dp_is_dis_viq1_create0_sel;    
wire    [1:0]  ctrl_dp_is_dis_viq1_create1_sel;    
wire    [1:0]  ctrl_dp_is_dis_vmb_create0_sel;     
wire    [1:0]  ctrl_dp_is_dis_vmb_create1_sel;     
wire           ctrl_dp_is_inst0_vld;               
wire           ctrl_dp_is_inst1_vld;               
wire           ctrl_dp_is_inst2_vld;               
wire           ctrl_dp_is_inst3_vld;               
wire           ctrl_fence_is_pipe_empty;           
wire           ctrl_ir_pipedown_gateclk;           
wire           ctrl_ir_pipedown_inst0_vld;         
wire           ctrl_ir_pipedown_inst1_vld;         
wire           ctrl_ir_pipedown_inst2_vld;         
wire           ctrl_ir_pipedown_inst3_vld;         
wire           ctrl_ir_pre_dis_aiq0_create0_en;    
wire    [1:0]  ctrl_ir_pre_dis_aiq0_create0_sel;   
wire           ctrl_ir_pre_dis_aiq0_create1_en;    
wire    [1:0]  ctrl_ir_pre_dis_aiq0_create1_sel;   
wire           ctrl_ir_pre_dis_aiq1_create0_en;    
wire    [1:0]  ctrl_ir_pre_dis_aiq1_create0_sel;   
wire           ctrl_ir_pre_dis_aiq1_create1_en;    
wire    [1:0]  ctrl_ir_pre_dis_aiq1_create1_sel;   
wire           ctrl_ir_pre_dis_biq_create0_en;     
wire    [1:0]  ctrl_ir_pre_dis_biq_create0_sel;    
wire           ctrl_ir_pre_dis_biq_create1_en;     
wire    [1:0]  ctrl_ir_pre_dis_biq_create1_sel;    
wire           ctrl_ir_pre_dis_inst0_vld;          
wire           ctrl_ir_pre_dis_inst1_vld;          
wire           ctrl_ir_pre_dis_inst2_vld;          
wire           ctrl_ir_pre_dis_inst3_vld;          
wire           ctrl_ir_pre_dis_lsiq_create0_en;    
wire    [1:0]  ctrl_ir_pre_dis_lsiq_create0_sel;   
wire           ctrl_ir_pre_dis_lsiq_create1_en;    
wire    [1:0]  ctrl_ir_pre_dis_lsiq_create1_sel;   
wire           ctrl_ir_pre_dis_pipedown2;          
wire           ctrl_ir_pre_dis_pst_create1_iid_sel; 
wire    [2:0]  ctrl_ir_pre_dis_pst_create2_iid_sel; 
wire    [2:0]  ctrl_ir_pre_dis_pst_create3_iid_sel; 
wire    [1:0]  ctrl_ir_pre_dis_rob_create0_sel;    
wire           ctrl_ir_pre_dis_rob_create1_en;     
wire    [2:0]  ctrl_ir_pre_dis_rob_create1_sel;    
wire           ctrl_ir_pre_dis_rob_create2_en;     
wire    [1:0]  ctrl_ir_pre_dis_rob_create2_sel;    
wire           ctrl_ir_pre_dis_rob_create3_en;     
wire           ctrl_ir_pre_dis_sdiq_create0_en;    
wire    [1:0]  ctrl_ir_pre_dis_sdiq_create0_sel;   
wire           ctrl_ir_pre_dis_sdiq_create1_en;    
wire    [1:0]  ctrl_ir_pre_dis_sdiq_create1_sel;   
wire           ctrl_ir_pre_dis_viq0_create0_en;    
wire    [1:0]  ctrl_ir_pre_dis_viq0_create0_sel;   
wire           ctrl_ir_pre_dis_viq0_create1_en;    
wire    [1:0]  ctrl_ir_pre_dis_viq0_create1_sel;   
wire           ctrl_ir_pre_dis_viq1_create0_en;    
wire    [1:0]  ctrl_ir_pre_dis_viq1_create0_sel;   
wire           ctrl_ir_pre_dis_viq1_create1_en;    
wire    [1:0]  ctrl_ir_pre_dis_viq1_create1_sel;   
wire           ctrl_ir_pre_dis_vmb_create0_en;     
wire    [1:0]  ctrl_ir_pre_dis_vmb_create0_sel;    
wire           ctrl_ir_pre_dis_vmb_create1_en;     
wire    [1:0]  ctrl_ir_pre_dis_vmb_create1_sel;    
wire           ctrl_ir_type_stall_inst2_vld;       
wire           ctrl_ir_type_stall_inst3_vld;       
wire           ctrl_is_aiq0_full_updt;             
wire           ctrl_is_aiq1_full_updt;             
wire           ctrl_is_biq_full_updt;              
wire           ctrl_is_dis_stall;                  
wire           ctrl_is_dis_type_stall;             
wire           ctrl_is_inst2_vld;                  
wire           ctrl_is_inst3_vld;                  
wire           ctrl_is_iq_full_updt;               
wire           ctrl_is_lsiq_full_updt;             
wire           ctrl_is_pcfifo_inst0_vld;           
wire           ctrl_is_pcfifo_inst1_vld;           
wire           ctrl_is_pcfifo_inst2_vld;           
wire           ctrl_is_pcfifo_inst3_vld;           
wire           ctrl_is_rob_full;                   
wire           ctrl_is_sdiq_full_updt;             
wire           ctrl_is_stall;                      
wire           ctrl_is_viq0_full_updt;             
wire           ctrl_is_viq1_full_updt;             
wire           ctrl_is_vmb_full_updt;              
wire           ctrl_lsiq_create0_dp_en;            
wire           ctrl_lsiq_create0_en;               
wire           ctrl_lsiq_create0_gateclk_en;       
wire           ctrl_lsiq_create1_dp_en;            
wire           ctrl_lsiq_create1_en;               
wire           ctrl_lsiq_create1_gateclk_en;       
wire           ctrl_lsiq_is_bar_inst_vld;          
wire           ctrl_sdiq_create0_dp_en;            
wire           ctrl_sdiq_create0_en;               
wire           ctrl_sdiq_create0_gateclk_en;       
wire           ctrl_sdiq_create1_dp_en;            
wire           ctrl_sdiq_create1_en;               
wire           ctrl_sdiq_create1_gateclk_en;       
wire           ctrl_top_is_dis_pipedown2;          
wire           ctrl_top_is_inst0_vld;              
wire           ctrl_top_is_inst1_vld;              
wire           ctrl_top_is_inst2_vld;              
wire           ctrl_top_is_inst3_vld;              
wire           ctrl_top_is_iq_full;                
wire           ctrl_top_is_vmb_full;               
wire           ctrl_viq0_create0_dp_en;            
wire           ctrl_viq0_create0_en;               
wire           ctrl_viq0_create0_gateclk_en;       
wire           ctrl_viq0_create1_dp_en;            
wire           ctrl_viq0_create1_en;               
wire           ctrl_viq0_create1_gateclk_en;       
wire           ctrl_viq1_create0_dp_en;            
wire           ctrl_viq1_create0_en;               
wire           ctrl_viq1_create0_gateclk_en;       
wire           ctrl_viq1_create1_dp_en;            
wire           ctrl_viq1_create1_en;               
wire           ctrl_viq1_create1_gateclk_en;       
wire    [1:0]  ctrl_xx_is_inst0_sel;               
wire    [2:0]  ctrl_xx_is_inst_sel;                
wire           dp_ctrl_is_inst0_bar;               
wire           dp_ctrl_is_inst0_dst_vld;           
wire           dp_ctrl_is_inst0_dste_vld;          
wire           dp_ctrl_is_inst0_dstv_vec;          
wire           dp_ctrl_is_inst0_dstv_vld;          
wire           dp_ctrl_is_inst0_pcfifo;            
wire           dp_ctrl_is_inst1_bar;               
wire           dp_ctrl_is_inst1_dst_vld;           
wire           dp_ctrl_is_inst1_dste_vld;          
wire           dp_ctrl_is_inst1_dstv_vec;          
wire           dp_ctrl_is_inst1_dstv_vld;          
wire           dp_ctrl_is_inst1_pcfifo;            
wire           dp_ctrl_is_inst2_bar;               
wire           dp_ctrl_is_inst2_dst_vld;           
wire           dp_ctrl_is_inst2_dste_vld;          
wire           dp_ctrl_is_inst2_dstv_vec;          
wire           dp_ctrl_is_inst2_dstv_vld;          
wire           dp_ctrl_is_inst2_pcfifo;            
wire           dp_ctrl_is_inst3_bar;               
wire           dp_ctrl_is_inst3_dst_vld;           
wire           dp_ctrl_is_inst3_dste_vld;          
wire           dp_ctrl_is_inst3_dstv_vec;          
wire           dp_ctrl_is_inst3_dstv_vld;          
wire           dp_ctrl_is_inst3_pcfifo;            
wire           forever_cpuclk;                     
wire           idu_had_iq_empty;                   
wire    [2:0]  idu_iu_is_pcfifo_inst_num;          
wire           idu_iu_is_pcfifo_inst_vld;          
wire           idu_lsu_vmb_create0_dp_en;          
wire           idu_lsu_vmb_create0_en;             
wire           idu_lsu_vmb_create0_gateclk_en;     
wire           idu_lsu_vmb_create1_dp_en;          
wire           idu_lsu_vmb_create1_en;             
wire           idu_lsu_vmb_create1_gateclk_en;     
wire           idu_rtu_pst_dis_inst0_ereg_vld;     
wire           idu_rtu_pst_dis_inst0_freg_vld;     
wire           idu_rtu_pst_dis_inst0_preg_vld;     
wire           idu_rtu_pst_dis_inst0_vreg_vld;     
wire           idu_rtu_pst_dis_inst1_ereg_vld;     
wire           idu_rtu_pst_dis_inst1_freg_vld;     
wire           idu_rtu_pst_dis_inst1_preg_vld;     
wire           idu_rtu_pst_dis_inst1_vreg_vld;     
wire           idu_rtu_pst_dis_inst2_ereg_vld;     
wire           idu_rtu_pst_dis_inst2_freg_vld;     
wire           idu_rtu_pst_dis_inst2_preg_vld;     
wire           idu_rtu_pst_dis_inst2_vreg_vld;     
wire           idu_rtu_pst_dis_inst3_ereg_vld;     
wire           idu_rtu_pst_dis_inst3_freg_vld;     
wire           idu_rtu_pst_dis_inst3_preg_vld;     
wire           idu_rtu_pst_dis_inst3_vreg_vld;     
wire           idu_rtu_rob_create0_dp_en;          
wire           idu_rtu_rob_create0_en;             
wire           idu_rtu_rob_create0_gateclk_en;     
wire           idu_rtu_rob_create1_dp_en;          
wire           idu_rtu_rob_create1_en;             
wire           idu_rtu_rob_create1_gateclk_en;     
wire           idu_rtu_rob_create2_dp_en;          
wire           idu_rtu_rob_create2_en;             
wire           idu_rtu_rob_create2_gateclk_en;     
wire           idu_rtu_rob_create3_dp_en;          
wire           idu_rtu_rob_create3_en;             
wire           idu_rtu_rob_create3_gateclk_en;     
wire           is_dis_type_stall;                  
wire           is_inst_clk;                        
wire           is_inst_clk_en;                     
wire           iu_yy_xx_cancel;                    
wire           lsiq_ctrl_1_left_updt;              
wire           lsiq_ctrl_empty;                    
wire           lsiq_ctrl_full;                     
wire           lsiq_ctrl_full_updt;                
wire           lsiq_ctrl_full_updt_clk_en;         
wire           lsu_idu_vmb_1_left_updt;            
wire           lsu_idu_vmb_empty;                  
wire           lsu_idu_vmb_full;                   
wire           lsu_idu_vmb_full_updt;              
wire           lsu_idu_vmb_full_updt_clk_en;       
wire           pad_yy_icg_scan_en;                 
wire           queue_full_clk;                     
wire           queue_full_clk_en;                  
wire           rtu_idu_flush_fe;                   
wire           rtu_idu_flush_is;                   
wire           rtu_idu_rob_full;                   
wire           rtu_yy_xx_flush;                    
wire           sdiq_ctrl_1_left_updt;              
wire           sdiq_ctrl_empty;                    
wire           sdiq_ctrl_full;                     
wire           sdiq_ctrl_full_updt;                
wire           sdiq_ctrl_full_updt_clk_en;         
wire           viq0_ctrl_1_left_updt;              
wire           viq0_ctrl_empty;                    
wire           viq0_ctrl_full;                     
wire           viq0_ctrl_full_updt;                
wire           viq0_ctrl_full_updt_clk_en;         
wire           viq1_ctrl_1_left_updt;              
wire           viq1_ctrl_empty;                    
wire           viq1_ctrl_full;                     
wire           viq1_ctrl_full_updt;                
wire           viq1_ctrl_full_updt_clk_en;         



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign is_inst_clk_en = ctrl_ir_pipedown_gateclk
                        || is_inst0_vld
                        || is_inst1_vld
                        || is_inst2_vld
                        || is_inst3_vld;
// &Instance("gated_clk_cell", "x_is_inst_gated_clk"); @41
gated_clk_cell  x_is_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (is_inst_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (is_inst_clk_en    ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @42
//          .external_en (1'b0), @43
//          .global_en   (cp0_yy_clk_en), @44
//          .module_en   (cp0_idu_icg_en), @45
//          .local_en    (is_inst_clk_en), @46
//          .clk_out     (is_inst_clk)); @47

//==========================================================
//                IS pipeline registers
//==========================================================

//----------------------------------------------------------
//            Implement of is inst valid register
//----------------------------------------------------------
always @(posedge is_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    is_inst0_vld <= 1'b0;
    is_inst1_vld <= 1'b0;
    is_inst2_vld <= 1'b0;
    is_inst3_vld <= 1'b0;
  end
  else if(rtu_idu_flush_fe || iu_yy_xx_cancel) begin
    is_inst0_vld <= 1'b0;
    is_inst1_vld <= 1'b0;
    is_inst2_vld <= 1'b0;
    is_inst3_vld <= 1'b0;
  end
  else if(!ctrl_is_dis_stall) begin
    is_inst0_vld <= ctrl_ir_pipedown_inst0_vld;
    is_inst1_vld <= ctrl_ir_pipedown_inst1_vld;
    is_inst2_vld <= ctrl_ir_pipedown_inst2_vld;
    is_inst3_vld <= ctrl_ir_pipedown_inst3_vld;
  end
  else begin
    is_inst0_vld <= is_inst0_vld;
    is_inst1_vld <= is_inst1_vld;
    is_inst2_vld <= is_inst2_vld;
    is_inst3_vld <= is_inst3_vld;
  end
end

//rename for output
assign ctrl_dp_is_inst0_vld     = is_inst0_vld;
assign ctrl_dp_is_inst1_vld     = is_inst1_vld;
assign ctrl_dp_is_inst2_vld     = is_inst2_vld;
assign ctrl_dp_is_inst3_vld     = is_inst3_vld;

assign ctrl_top_is_inst0_vld    = is_inst0_vld;
assign ctrl_top_is_inst1_vld    = is_inst1_vld;
assign ctrl_top_is_inst2_vld    = is_inst2_vld;
assign ctrl_top_is_inst3_vld    = is_inst3_vld;

assign ctrl_is_inst2_vld        = is_inst2_vld;
assign ctrl_is_inst3_vld        = is_inst3_vld;

assign ctrl_fence_is_pipe_empty = !is_inst0_vld;

//----------------------------------------------------------
//            Implement of dispatch control register
//----------------------------------------------------------
always @(posedge is_inst_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    is_dis_inst0_vld                <= 1'b0;
    is_dis_inst1_vld                <= 1'b0;
    is_dis_inst2_vld                <= 1'b0;
    is_dis_inst3_vld                <= 1'b0;
    is_dis_pipedown2                <= 1'b0;
    is_dis_aiq0_create0_en          <= 1'b0;
    is_dis_aiq0_create0_sel[1:0]    <= 2'b0;
    is_dis_aiq0_create1_en          <= 1'b0;
    is_dis_aiq0_create1_sel[1:0]    <= 2'b0;
    is_dis_aiq1_create0_en          <= 1'b0;
    is_dis_aiq1_create0_sel[1:0]    <= 2'b0;
    is_dis_aiq1_create1_en          <= 1'b0;
    is_dis_aiq1_create1_sel[1:0]    <= 2'b0;
    is_dis_biq_create0_en           <= 1'b0;
    is_dis_biq_create0_sel[1:0]     <= 2'b0;
    is_dis_biq_create1_en           <= 1'b0;
    is_dis_biq_create1_sel[1:0]     <= 2'b0;
    is_dis_lsiq_create0_en          <= 1'b0;
    is_dis_lsiq_create0_sel[1:0]    <= 2'b0;
    is_dis_lsiq_create1_en          <= 1'b0;
    is_dis_lsiq_create1_sel[1:0]    <= 2'b0;
    is_dis_sdiq_create0_en          <= 1'b0;
    is_dis_sdiq_create0_sel[1:0]    <= 2'b0;
    is_dis_sdiq_create1_en          <= 1'b0;
    is_dis_sdiq_create1_sel[1:0]    <= 2'b0;
    is_dis_viq0_create0_en          <= 1'b0;
    is_dis_viq0_create0_sel[1:0]    <= 2'b0;
    is_dis_viq0_create1_en          <= 1'b0;
    is_dis_viq0_create1_sel[1:0]    <= 2'b0;
    is_dis_viq1_create0_en          <= 1'b0;
    is_dis_viq1_create0_sel[1:0]    <= 2'b0;
    is_dis_viq1_create1_en          <= 1'b0;
    is_dis_viq1_create1_sel[1:0]    <= 2'b0;
    is_dis_rob_create1_en           <= 1'b0;
    is_dis_rob_create2_en           <= 1'b0;
    is_dis_rob_create3_en           <= 1'b0;
    is_dis_rob_create0_sel[1:0]     <= 2'b0;
    is_dis_rob_create1_sel[2:0]     <= 3'b0;
    is_dis_rob_create2_sel[1:0]     <= 2'b0;
    is_dis_pst_create1_iid_sel      <= 1'b0;
    is_dis_pst_create2_iid_sel[2:0] <= 3'b0;
    is_dis_pst_create3_iid_sel[2:0] <= 3'b0;
    is_dis_vmb_create0_en           <= 1'b0;
    is_dis_vmb_create0_sel[1:0]     <= 2'b0;
    is_dis_vmb_create1_en           <= 1'b0;
    is_dis_vmb_create1_sel[1:0]     <= 2'b0;
  end
  else if(rtu_idu_flush_fe || iu_yy_xx_cancel) begin
    is_dis_inst0_vld                <= 1'b0;
    is_dis_inst1_vld                <= 1'b0;
    is_dis_inst2_vld                <= 1'b0;
    is_dis_inst3_vld                <= 1'b0;
    is_dis_pipedown2                <= 1'b0;
    is_dis_aiq0_create0_en          <= 1'b0;
    is_dis_aiq0_create0_sel[1:0]    <= 2'b0;
    is_dis_aiq0_create1_en          <= 1'b0;
    is_dis_aiq0_create1_sel[1:0]    <= 2'b0;
    is_dis_aiq1_create0_en          <= 1'b0;
    is_dis_aiq1_create0_sel[1:0]    <= 2'b0;
    is_dis_aiq1_create1_en          <= 1'b0;
    is_dis_aiq1_create1_sel[1:0]    <= 2'b0;
    is_dis_biq_create0_en           <= 1'b0;
    is_dis_biq_create0_sel[1:0]     <= 2'b0;
    is_dis_biq_create1_en           <= 1'b0;
    is_dis_biq_create1_sel[1:0]     <= 2'b0;
    is_dis_lsiq_create0_en          <= 1'b0;
    is_dis_lsiq_create0_sel[1:0]    <= 2'b0;
    is_dis_lsiq_create1_en          <= 1'b0;
    is_dis_lsiq_create1_sel[1:0]    <= 2'b0;
    is_dis_sdiq_create0_en          <= 1'b0;
    is_dis_sdiq_create0_sel[1:0]    <= 2'b0;
    is_dis_sdiq_create1_en          <= 1'b0;
    is_dis_sdiq_create1_sel[1:0]    <= 2'b0;
    is_dis_viq0_create0_en          <= 1'b0;
    is_dis_viq0_create0_sel[1:0]    <= 2'b0;
    is_dis_viq0_create1_en          <= 1'b0;
    is_dis_viq0_create1_sel[1:0]    <= 2'b0;
    is_dis_viq1_create0_en          <= 1'b0;
    is_dis_viq1_create0_sel[1:0]    <= 2'b0;
    is_dis_viq1_create1_en          <= 1'b0;
    is_dis_viq1_create1_sel[1:0]    <= 2'b0;
    is_dis_rob_create1_en           <= 1'b0;
    is_dis_rob_create2_en           <= 1'b0;
    is_dis_rob_create3_en           <= 1'b0;
    is_dis_rob_create0_sel[1:0]     <= 2'b0;
    is_dis_rob_create1_sel[2:0]     <= 3'b0;
    is_dis_rob_create2_sel[1:0]     <= 2'b0;
    is_dis_pst_create1_iid_sel      <= 1'b0;
    is_dis_pst_create2_iid_sel[2:0] <= 3'b0;
    is_dis_pst_create3_iid_sel[2:0] <= 3'b0;
    is_dis_vmb_create0_en           <= 1'b0;
    is_dis_vmb_create0_sel[1:0]     <= 2'b0;
    is_dis_vmb_create1_en           <= 1'b0;
    is_dis_vmb_create1_sel[1:0]     <= 2'b0;
  end
  else if(!ctrl_is_dis_stall) begin
    is_dis_inst0_vld                <= ctrl_ir_pre_dis_inst0_vld;
    is_dis_inst1_vld                <= ctrl_ir_pre_dis_inst1_vld;
    is_dis_inst2_vld                <= ctrl_ir_pre_dis_inst2_vld;
    is_dis_inst3_vld                <= ctrl_ir_pre_dis_inst3_vld;
    is_dis_pipedown2                <= ctrl_ir_pre_dis_pipedown2;
    is_dis_aiq0_create0_en          <= ctrl_ir_pre_dis_aiq0_create0_en;
    is_dis_aiq0_create0_sel[1:0]    <= ctrl_ir_pre_dis_aiq0_create0_sel[1:0];
    is_dis_aiq0_create1_en          <= ctrl_ir_pre_dis_aiq0_create1_en;
    is_dis_aiq0_create1_sel[1:0]    <= ctrl_ir_pre_dis_aiq0_create1_sel[1:0];
    is_dis_aiq1_create0_en          <= ctrl_ir_pre_dis_aiq1_create0_en;
    is_dis_aiq1_create0_sel[1:0]    <= ctrl_ir_pre_dis_aiq1_create0_sel[1:0];
    is_dis_aiq1_create1_en          <= ctrl_ir_pre_dis_aiq1_create1_en;
    is_dis_aiq1_create1_sel[1:0]    <= ctrl_ir_pre_dis_aiq1_create1_sel[1:0];
    is_dis_biq_create0_en           <= ctrl_ir_pre_dis_biq_create0_en;
    is_dis_biq_create0_sel[1:0]     <= ctrl_ir_pre_dis_biq_create0_sel[1:0];
    is_dis_biq_create1_en           <= ctrl_ir_pre_dis_biq_create1_en;
    is_dis_biq_create1_sel[1:0]     <= ctrl_ir_pre_dis_biq_create1_sel[1:0];
    is_dis_lsiq_create0_en          <= ctrl_ir_pre_dis_lsiq_create0_en;
    is_dis_lsiq_create0_sel[1:0]    <= ctrl_ir_pre_dis_lsiq_create0_sel[1:0];
    is_dis_lsiq_create1_en          <= ctrl_ir_pre_dis_lsiq_create1_en;
    is_dis_lsiq_create1_sel[1:0]    <= ctrl_ir_pre_dis_lsiq_create1_sel[1:0];
    is_dis_sdiq_create0_en          <= ctrl_ir_pre_dis_sdiq_create0_en;
    is_dis_sdiq_create0_sel[1:0]    <= ctrl_ir_pre_dis_sdiq_create0_sel[1:0];
    is_dis_sdiq_create1_en          <= ctrl_ir_pre_dis_sdiq_create1_en;
    is_dis_sdiq_create1_sel[1:0]    <= ctrl_ir_pre_dis_sdiq_create1_sel[1:0];
    is_dis_viq0_create0_en          <= ctrl_ir_pre_dis_viq0_create0_en;
    is_dis_viq0_create0_sel[1:0]    <= ctrl_ir_pre_dis_viq0_create0_sel[1:0];
    is_dis_viq0_create1_en          <= ctrl_ir_pre_dis_viq0_create1_en;
    is_dis_viq0_create1_sel[1:0]    <= ctrl_ir_pre_dis_viq0_create1_sel[1:0];
    is_dis_viq1_create0_en          <= ctrl_ir_pre_dis_viq1_create0_en;
    is_dis_viq1_create0_sel[1:0]    <= ctrl_ir_pre_dis_viq1_create0_sel[1:0];
    is_dis_viq1_create1_en          <= ctrl_ir_pre_dis_viq1_create1_en;
    is_dis_viq1_create1_sel[1:0]    <= ctrl_ir_pre_dis_viq1_create1_sel[1:0];
    is_dis_rob_create1_en           <= ctrl_ir_pre_dis_rob_create1_en;
    is_dis_rob_create2_en           <= ctrl_ir_pre_dis_rob_create2_en;
    is_dis_rob_create3_en           <= ctrl_ir_pre_dis_rob_create3_en;
    is_dis_rob_create0_sel[1:0]     <= ctrl_ir_pre_dis_rob_create0_sel[1:0];
    is_dis_rob_create1_sel[2:0]     <= ctrl_ir_pre_dis_rob_create1_sel[2:0];
    is_dis_rob_create2_sel[1:0]     <= ctrl_ir_pre_dis_rob_create2_sel[1:0];
    is_dis_pst_create1_iid_sel      <= ctrl_ir_pre_dis_pst_create1_iid_sel;
    is_dis_pst_create2_iid_sel[2:0] <= ctrl_ir_pre_dis_pst_create2_iid_sel[2:0];
    is_dis_pst_create3_iid_sel[2:0] <= ctrl_ir_pre_dis_pst_create3_iid_sel[2:0];
    is_dis_vmb_create0_en           <= ctrl_ir_pre_dis_vmb_create0_en;
    is_dis_vmb_create0_sel[1:0]     <= ctrl_ir_pre_dis_vmb_create0_sel[1:0];
    is_dis_vmb_create1_en           <= ctrl_ir_pre_dis_vmb_create1_en;
    is_dis_vmb_create1_sel[1:0]     <= ctrl_ir_pre_dis_vmb_create1_sel[1:0];
  end
  else begin
    is_dis_inst0_vld                <= is_dis_inst0_vld;
    is_dis_inst1_vld                <= is_dis_inst1_vld;
    is_dis_inst2_vld                <= is_dis_inst2_vld;
    is_dis_inst3_vld                <= is_dis_inst3_vld;
    is_dis_pipedown2                <= is_dis_pipedown2;
    is_dis_aiq0_create0_en          <= is_dis_aiq0_create0_en;
    is_dis_aiq0_create0_sel[1:0]    <= is_dis_aiq0_create0_sel[1:0];
    is_dis_aiq0_create1_en          <= is_dis_aiq0_create1_en;
    is_dis_aiq0_create1_sel[1:0]    <= is_dis_aiq0_create1_sel[1:0];
    is_dis_aiq1_create0_en          <= is_dis_aiq1_create0_en;
    is_dis_aiq1_create0_sel[1:0]    <= is_dis_aiq1_create0_sel[1:0];
    is_dis_aiq1_create1_en          <= is_dis_aiq1_create1_en;
    is_dis_aiq1_create1_sel[1:0]    <= is_dis_aiq1_create1_sel[1:0];
    is_dis_biq_create0_en           <= is_dis_biq_create0_en;
    is_dis_biq_create0_sel[1:0]     <= is_dis_biq_create0_sel[1:0];
    is_dis_biq_create1_en           <= is_dis_biq_create1_en;
    is_dis_biq_create1_sel[1:0]     <= is_dis_biq_create1_sel[1:0];
    is_dis_lsiq_create0_en          <= is_dis_lsiq_create0_en;
    is_dis_lsiq_create0_sel[1:0]    <= is_dis_lsiq_create0_sel[1:0];
    is_dis_lsiq_create1_en          <= is_dis_lsiq_create1_en;
    is_dis_lsiq_create1_sel[1:0]    <= is_dis_lsiq_create1_sel[1:0];
    is_dis_sdiq_create0_en          <= is_dis_sdiq_create0_en;
    is_dis_sdiq_create0_sel[1:0]    <= is_dis_sdiq_create0_sel[1:0];
    is_dis_sdiq_create1_en          <= is_dis_sdiq_create1_en;
    is_dis_sdiq_create1_sel[1:0]    <= is_dis_sdiq_create1_sel[1:0];
    is_dis_viq0_create0_en          <= is_dis_viq0_create0_en;
    is_dis_viq0_create0_sel[1:0]    <= is_dis_viq0_create0_sel[1:0];
    is_dis_viq0_create1_en          <= is_dis_viq0_create1_en;
    is_dis_viq0_create1_sel[1:0]    <= is_dis_viq0_create1_sel[1:0];
    is_dis_viq1_create0_en          <= is_dis_viq1_create0_en;
    is_dis_viq1_create0_sel[1:0]    <= is_dis_viq1_create0_sel[1:0];
    is_dis_viq1_create1_en          <= is_dis_viq1_create1_en;
    is_dis_viq1_create1_sel[1:0]    <= is_dis_viq1_create1_sel[1:0];
    is_dis_rob_create1_en           <= is_dis_rob_create1_en;
    is_dis_rob_create2_en           <= is_dis_rob_create2_en;
    is_dis_rob_create3_en           <= is_dis_rob_create3_en;
    is_dis_rob_create0_sel[1:0]     <= is_dis_rob_create0_sel[1:0];
    is_dis_rob_create1_sel[2:0]     <= is_dis_rob_create1_sel[2:0];
    is_dis_rob_create2_sel[1:0]     <= is_dis_rob_create2_sel[1:0];
    is_dis_pst_create1_iid_sel      <= is_dis_pst_create1_iid_sel;
    is_dis_pst_create2_iid_sel[2:0] <= is_dis_pst_create2_iid_sel[2:0];
    is_dis_pst_create3_iid_sel[2:0] <= is_dis_pst_create3_iid_sel[2:0];
    is_dis_vmb_create0_en           <= is_dis_vmb_create0_en;
    is_dis_vmb_create0_sel[1:0]     <= is_dis_vmb_create0_sel[1:0];
    is_dis_vmb_create1_en           <= is_dis_vmb_create1_en;
    is_dis_vmb_create1_sel[1:0]     <= is_dis_vmb_create1_sel[1:0];
  end
end

//rename for output
assign ctrl_top_is_dis_pipedown2            = is_dis_pipedown2;

//==========================================================
//        Control signal for IS data path update
//==========================================================
assign is_dis_type_stall =
//if pipedown2, is inst1/2 must be valid
   is_dis_pipedown2
//  if is inst3 valid, type stall if ir inst2 valid
   && (is_inst3_vld && ctrl_ir_type_stall_inst2_vld
//  if next cycle is inst3 not valid, type stall if ir inst3 valid
   || !is_inst3_vld && ctrl_ir_type_stall_inst3_vld);

assign ctrl_is_dis_type_stall = is_dis_type_stall;

//==========================================================
//        Control signal for IS data path update
//==========================================================
//1.if pipedown2, is inst1/2 must be valid, is inst0 will sel is inst2
assign ctrl_xx_is_inst0_sel[0] = is_dis_pipedown2;
//2.if pipedown4, is inst0 will sel ir inst0
assign ctrl_xx_is_inst0_sel[1] = !is_dis_pipedown2;

//1.if pipedown2, is inst1/2 must be valid
//  1.1 if is inst3 valid, is inst1 sel is inst3,
//      is inst2/3 sel ir inst0/1
assign ctrl_xx_is_inst_sel[0] = is_dis_pipedown2 && is_inst3_vld;
//  1.2 if is inst3 not valid, is inst1/2/3 sel ir inst0/1/2
assign ctrl_xx_is_inst_sel[1] = is_dis_pipedown2 && !is_inst3_vld;
//2.if pipedown4, is inst1/2/3 will sel ir inst1/2/3
assign ctrl_xx_is_inst_sel[2] = !is_dis_pipedown2;

//==========================================================
//          Control signal for reorder buffer create
//==========================================================
//-------------create enable for reorder buffer-------------
//output create enable for control path and data path
//create 0 always from dis_inst0_vld
assign idu_rtu_rob_create0_en               = is_dis_inst0_vld
                                              && !ctrl_is_dis_stall;
assign idu_rtu_rob_create1_en               = is_dis_rob_create1_en
                                              && !ctrl_is_dis_stall;
assign idu_rtu_rob_create2_en               = is_dis_rob_create2_en
                                              && !ctrl_is_dis_stall;
assign idu_rtu_rob_create3_en               = is_dis_rob_create3_en
                                              && !ctrl_is_dis_stall;
assign idu_rtu_rob_create0_dp_en            = is_dis_inst0_vld
                                              && !rtu_idu_rob_full; 
assign idu_rtu_rob_create1_dp_en            = is_dis_rob_create1_en
                                              && !rtu_idu_rob_full;
assign idu_rtu_rob_create2_dp_en            = is_dis_rob_create2_en
                                              && !rtu_idu_rob_full;
assign idu_rtu_rob_create3_dp_en            = is_dis_rob_create3_en
                                              && !rtu_idu_rob_full;
assign idu_rtu_rob_create0_gateclk_en       = is_dis_inst0_vld;
assign idu_rtu_rob_create1_gateclk_en       = is_dis_rob_create1_en;
assign idu_rtu_rob_create2_gateclk_en       = is_dis_rob_create2_en;
assign idu_rtu_rob_create3_gateclk_en       = is_dis_rob_create3_en;
//output for rob create data path select
assign ctrl_dp_is_dis_rob_create0_sel[1:0]     = is_dis_rob_create0_sel[1:0];
assign ctrl_dp_is_dis_rob_create1_sel[2:0]     = is_dis_rob_create1_sel[2:0];
assign ctrl_dp_is_dis_rob_create2_sel[1:0]     = is_dis_rob_create2_sel[1:0];

assign ctrl_dp_is_dis_pst_create1_iid_sel      = is_dis_pst_create1_iid_sel;
assign ctrl_dp_is_dis_pst_create2_iid_sel[2:0] = is_dis_pst_create2_iid_sel[2:0];
assign ctrl_dp_is_dis_pst_create3_iid_sel[2:0] = is_dis_pst_create3_iid_sel[2:0];

//==========================================================
//                Control signal for PST
//==========================================================
assign ctrl_dis_inst0_preg_vld              = is_dis_inst0_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst0_dst_vld;
assign ctrl_dis_inst1_preg_vld              = is_dis_inst1_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst1_dst_vld;
assign ctrl_dis_inst2_preg_vld              = is_dis_inst2_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst2_dst_vld;
assign ctrl_dis_inst3_preg_vld              = is_dis_inst3_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst3_dst_vld;

assign ctrl_dis_inst0_vreg_vld              = is_dis_inst0_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst0_dstv_vld
                                              && dp_ctrl_is_inst0_dstv_vec;
assign ctrl_dis_inst1_vreg_vld              = is_dis_inst1_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst1_dstv_vld
                                              && dp_ctrl_is_inst1_dstv_vec;
assign ctrl_dis_inst2_vreg_vld              = is_dis_inst2_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst2_dstv_vld
                                              && dp_ctrl_is_inst2_dstv_vec;
assign ctrl_dis_inst3_vreg_vld              = is_dis_inst3_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst3_dstv_vld
                                              && dp_ctrl_is_inst3_dstv_vec;

assign ctrl_dis_inst0_freg_vld              = is_dis_inst0_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst0_dstv_vld
                                              && !dp_ctrl_is_inst0_dstv_vec;
assign ctrl_dis_inst1_freg_vld              = is_dis_inst1_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst1_dstv_vld
                                              && !dp_ctrl_is_inst1_dstv_vec;
assign ctrl_dis_inst2_freg_vld              = is_dis_inst2_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst2_dstv_vld
                                              && !dp_ctrl_is_inst2_dstv_vec;
assign ctrl_dis_inst3_freg_vld              = is_dis_inst3_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst3_dstv_vld
                                              && !dp_ctrl_is_inst3_dstv_vec;

assign ctrl_dis_inst0_ereg_vld              = is_dis_inst0_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst0_dste_vld;
assign ctrl_dis_inst1_ereg_vld              = is_dis_inst1_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst1_dste_vld;
assign ctrl_dis_inst2_ereg_vld              = is_dis_inst2_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst2_dste_vld;
assign ctrl_dis_inst3_ereg_vld              = is_dis_inst3_vld
                                              && !ctrl_is_dis_stall
                                              && dp_ctrl_is_inst3_dste_vld;

//for dp output
assign ctrl_dp_dis_inst0_preg_vld           = ctrl_dis_inst0_preg_vld;
assign ctrl_dp_dis_inst1_preg_vld           = ctrl_dis_inst1_preg_vld;
assign ctrl_dp_dis_inst2_preg_vld           = ctrl_dis_inst2_preg_vld;
assign ctrl_dp_dis_inst3_preg_vld           = ctrl_dis_inst3_preg_vld;

assign ctrl_dp_dis_inst0_vreg_vld           = ctrl_dis_inst0_vreg_vld;
assign ctrl_dp_dis_inst1_vreg_vld           = ctrl_dis_inst1_vreg_vld;
assign ctrl_dp_dis_inst2_vreg_vld           = ctrl_dis_inst2_vreg_vld;
assign ctrl_dp_dis_inst3_vreg_vld           = ctrl_dis_inst3_vreg_vld;

assign ctrl_dp_dis_inst0_freg_vld           = ctrl_dis_inst0_freg_vld;
assign ctrl_dp_dis_inst1_freg_vld           = ctrl_dis_inst1_freg_vld;
assign ctrl_dp_dis_inst2_freg_vld           = ctrl_dis_inst2_freg_vld;
assign ctrl_dp_dis_inst3_freg_vld           = ctrl_dis_inst3_freg_vld;

assign ctrl_dp_dis_inst0_ereg_vld           = ctrl_dis_inst0_ereg_vld;
assign ctrl_dp_dis_inst1_ereg_vld           = ctrl_dis_inst1_ereg_vld;
assign ctrl_dp_dis_inst2_ereg_vld           = ctrl_dis_inst2_ereg_vld;
assign ctrl_dp_dis_inst3_ereg_vld           = ctrl_dis_inst3_ereg_vld;

//for PST output
assign idu_rtu_pst_dis_inst0_preg_vld       = ctrl_dis_inst0_preg_vld;
assign idu_rtu_pst_dis_inst1_preg_vld       = ctrl_dis_inst1_preg_vld;
assign idu_rtu_pst_dis_inst2_preg_vld       = ctrl_dis_inst2_preg_vld;
assign idu_rtu_pst_dis_inst3_preg_vld       = ctrl_dis_inst3_preg_vld;

assign idu_rtu_pst_dis_inst0_vreg_vld       = ctrl_dis_inst0_vreg_vld;
assign idu_rtu_pst_dis_inst1_vreg_vld       = ctrl_dis_inst1_vreg_vld;
assign idu_rtu_pst_dis_inst2_vreg_vld       = ctrl_dis_inst2_vreg_vld;
assign idu_rtu_pst_dis_inst3_vreg_vld       = ctrl_dis_inst3_vreg_vld;

assign idu_rtu_pst_dis_inst0_freg_vld       = ctrl_dis_inst0_freg_vld;
assign idu_rtu_pst_dis_inst1_freg_vld       = ctrl_dis_inst1_freg_vld;
assign idu_rtu_pst_dis_inst2_freg_vld       = ctrl_dis_inst2_freg_vld;
assign idu_rtu_pst_dis_inst3_freg_vld       = ctrl_dis_inst3_freg_vld;

assign idu_rtu_pst_dis_inst0_ereg_vld       = ctrl_dis_inst0_ereg_vld;
assign idu_rtu_pst_dis_inst1_ereg_vld       = ctrl_dis_inst1_ereg_vld;
assign idu_rtu_pst_dis_inst2_ereg_vld       = ctrl_dis_inst2_ereg_vld;
assign idu_rtu_pst_dis_inst3_ereg_vld       = ctrl_dis_inst3_ereg_vld;

//==========================================================
//          Control Signal for LSU VMB Create
//==========================================================
assign idu_lsu_vmb_create0_en               = is_dis_vmb_create0_en
                                              && !ctrl_is_dis_stall;
assign idu_lsu_vmb_create1_en               = is_dis_vmb_create1_en
                                              && !ctrl_is_dis_stall;
assign idu_lsu_vmb_create0_dp_en            = is_dis_vmb_create0_en
                                              && !lsu_idu_vmb_full;
assign idu_lsu_vmb_create1_dp_en            = is_dis_vmb_create1_en
                                              && !lsu_idu_vmb_full;
assign idu_lsu_vmb_create0_gateclk_en       = is_dis_vmb_create0_en;
assign idu_lsu_vmb_create1_gateclk_en       = is_dis_vmb_create1_en;

//output for create data path select
assign ctrl_dp_is_dis_vmb_create0_sel[1:0] = is_dis_vmb_create0_sel[1:0];
assign ctrl_dp_is_dis_vmb_create1_sel[1:0] = is_dis_vmb_create1_sel[1:0];

//==========================================================
//              Issue Queue Dispatch Control
//==========================================================
//--------create port 0 of ALU Issue Queue 0 (AIQ0)---------
assign ctrl_aiq0_create0_en                 = is_dis_aiq0_create0_en
                                              && !ctrl_is_dis_stall;
assign ctrl_aiq0_create0_dp_en              = is_dis_aiq0_create0_en
                                              && !aiq0_ctrl_full;
assign ctrl_aiq0_create0_gateclk_en         = is_dis_aiq0_create0_en;
//output for rob create data path select
assign ctrl_dp_is_dis_aiq0_create0_sel[1:0] = is_dis_aiq0_create0_sel[1:0];

//--------create port 1 of ALU Issue Queue 0 (AIQ0)---------
assign ctrl_aiq0_create1_en                 = is_dis_aiq0_create1_en
                                              && !ctrl_is_dis_stall;
assign ctrl_aiq0_create1_dp_en              = is_dis_aiq0_create1_en
                                              && !aiq0_ctrl_full;
assign ctrl_aiq0_create1_gateclk_en         = is_dis_aiq0_create1_en;
//output for rob create data path select
assign ctrl_dp_is_dis_aiq0_create1_sel[1:0] = is_dis_aiq0_create1_sel[1:0];

//--------create port 0 of ALU Issue Queue 1 (AIQ1)---------
assign ctrl_aiq1_create0_en                 = is_dis_aiq1_create0_en
                                              && !ctrl_is_dis_stall;
assign ctrl_aiq1_create0_dp_en              = is_dis_aiq1_create0_en
                                              && !aiq1_ctrl_full;
assign ctrl_aiq1_create0_gateclk_en         = is_dis_aiq1_create0_en;
//output for rob create data path select
assign ctrl_dp_is_dis_aiq1_create0_sel[1:0] = is_dis_aiq1_create0_sel[1:0];

//--------create port 1 of ALU Issue Queue 1 (AIQ1)---------
assign ctrl_aiq1_create1_en                 = is_dis_aiq1_create1_en
                                              && !ctrl_is_dis_stall;
assign ctrl_aiq1_create1_dp_en              = is_dis_aiq1_create1_en
                                              && !aiq1_ctrl_full;
assign ctrl_aiq1_create1_gateclk_en         = is_dis_aiq1_create1_en;
//output for rob create data path select
assign ctrl_dp_is_dis_aiq1_create1_sel[1:0] = is_dis_aiq1_create1_sel[1:0];

//---------create port 0 of BJU Issue Queue (BIQ)-----------
assign ctrl_biq_create0_en                 = is_dis_biq_create0_en
                                              && !ctrl_is_dis_stall;
assign ctrl_biq_create0_dp_en              = is_dis_biq_create0_en
                                              && !biq_ctrl_full;
assign ctrl_biq_create0_gateclk_en         = is_dis_biq_create0_en;
//output for rob create data path select
assign ctrl_dp_is_dis_biq_create0_sel[1:0] = is_dis_biq_create0_sel[1:0];

//---------create port 1 of BJU Issue Queue (BIQ)-----------
assign ctrl_biq_create1_en                 = is_dis_biq_create1_en
                                              && !ctrl_is_dis_stall;
assign ctrl_biq_create1_dp_en              = is_dis_biq_create1_en
                                              && !biq_ctrl_full;
assign ctrl_biq_create1_gateclk_en         = is_dis_biq_create1_en;
//output for rob create data path select
assign ctrl_dp_is_dis_biq_create1_sel[1:0] = is_dis_biq_create1_sel[1:0];

//---------create port 0 of LSU Issue Queue (LSIQ)----------
assign ctrl_lsiq_create0_en                 = is_dis_lsiq_create0_en
                                              && !ctrl_is_dis_stall;
assign ctrl_lsiq_create0_dp_en              = is_dis_lsiq_create0_en
                                              && !lsiq_ctrl_full;
assign ctrl_lsiq_create0_gateclk_en         = is_dis_lsiq_create0_en;
//output for rob create data path select
assign ctrl_dp_is_dis_lsiq_create0_sel[1:0] = is_dis_lsiq_create0_sel[1:0];

//---------create port 1 of LSU Issue Queue (LSIQ)----------
assign ctrl_lsiq_create1_en                 = is_dis_lsiq_create1_en
                                              && !ctrl_is_dis_stall;
assign ctrl_lsiq_create1_dp_en              = is_dis_lsiq_create1_en
                                              && !lsiq_ctrl_full;
assign ctrl_lsiq_create1_gateclk_en         = is_dis_lsiq_create1_en;
//output for rob create data path select
assign ctrl_dp_is_dis_lsiq_create1_sel[1:0] = is_dis_lsiq_create1_sel[1:0];

//--------create port 0 of Stdata Issue Queue (SDIQ)--------
assign ctrl_sdiq_create0_en                 = is_dis_sdiq_create0_en
                                              && !ctrl_is_dis_stall;
assign ctrl_sdiq_create0_dp_en              = is_dis_sdiq_create0_en
                                              && !sdiq_ctrl_full;
assign ctrl_sdiq_create0_gateclk_en         = is_dis_sdiq_create0_en;
//output for rob create data path select
assign ctrl_dp_is_dis_sdiq_create0_sel[1:0] = is_dis_sdiq_create0_sel[1:0];

//--------create port 1 of Stdata Issue Queue (SDIQ)--------
assign ctrl_sdiq_create1_en                 = is_dis_sdiq_create1_en
                                              && !ctrl_is_dis_stall;
assign ctrl_sdiq_create1_dp_en              = is_dis_sdiq_create1_en
                                              && !sdiq_ctrl_full;
assign ctrl_sdiq_create1_gateclk_en         = is_dis_sdiq_create1_en;
//output for rob create data path select
assign ctrl_dp_is_dis_sdiq_create1_sel[1:0] = is_dis_sdiq_create1_sel[1:0];

//--------create port 0 of VFPU Issue Queue 0 (VIQ0)--------
assign ctrl_viq0_create0_en                 = is_dis_viq0_create0_en
                                              && !ctrl_is_dis_stall;
assign ctrl_viq0_create0_dp_en              = is_dis_viq0_create0_en
                                              && !viq0_ctrl_full;
assign ctrl_viq0_create0_gateclk_en         = is_dis_viq0_create0_en;
//output for rob create data path select
assign ctrl_dp_is_dis_viq0_create0_sel[1:0] = is_dis_viq0_create0_sel[1:0];

//--------create port 1 of VFPU Issue Queue 0 (VIQ0)--------
assign ctrl_viq0_create1_en                 = is_dis_viq0_create1_en
                                              && !ctrl_is_dis_stall;
assign ctrl_viq0_create1_dp_en              = is_dis_viq0_create1_en
                                              && !viq0_ctrl_full;
assign ctrl_viq0_create1_gateclk_en         = is_dis_viq0_create1_en;
//output for rob create data path select
assign ctrl_dp_is_dis_viq0_create1_sel[1:0] = is_dis_viq0_create1_sel[1:0];

//--------create port 0 of VFPU Issue Queue 1 (VIQ1)--------
assign ctrl_viq1_create0_en                 = is_dis_viq1_create0_en
                                              && !ctrl_is_dis_stall;
assign ctrl_viq1_create0_dp_en              = is_dis_viq1_create0_en
                                              && !viq1_ctrl_full;
assign ctrl_viq1_create0_gateclk_en         = is_dis_viq1_create0_en;
//output for rob create data path select
assign ctrl_dp_is_dis_viq1_create0_sel[1:0] = is_dis_viq1_create0_sel[1:0];

//--------create port 1 of VFPU Issue Queue 1 (VIQ1)--------
assign ctrl_viq1_create1_en                 = is_dis_viq1_create1_en
                                              && !ctrl_is_dis_stall;
assign ctrl_viq1_create1_dp_en              = is_dis_viq1_create1_en
                                              && !viq1_ctrl_full;
assign ctrl_viq1_create1_gateclk_en         = is_dis_viq1_create1_en;
//output for rob create data path select
assign ctrl_dp_is_dis_viq1_create1_sel[1:0] = is_dis_viq1_create1_sel[1:0];

//==========================================================
//               PID assign signal for PCFIFO
//==========================================================
assign ctrl_is_pcfifo_inst0_vld = is_dis_inst0_vld
                                  && !ctrl_is_dis_stall
                                  && dp_ctrl_is_inst0_pcfifo;
assign ctrl_is_pcfifo_inst1_vld = is_dis_inst1_vld 
                                  && !ctrl_is_dis_stall
                                  && dp_ctrl_is_inst1_pcfifo;
assign ctrl_is_pcfifo_inst2_vld = is_dis_inst2_vld
                                  && !ctrl_is_dis_stall
                                  && dp_ctrl_is_inst2_pcfifo;
assign ctrl_is_pcfifo_inst3_vld = is_dis_inst3_vld
                                  && !ctrl_is_dis_stall
                                  && dp_ctrl_is_inst3_pcfifo;

assign idu_iu_is_pcfifo_inst_vld = (ctrl_is_pcfifo_inst0_vld
                                   || ctrl_is_pcfifo_inst1_vld
                                   || ctrl_is_pcfifo_inst2_vld
                                   || ctrl_is_pcfifo_inst3_vld)
                                   && !ctrl_is_dis_stall;
//for timing optimization, the inst num does not include dis stall signal
assign idu_iu_is_pcfifo_inst_num[2:0] = {2'b0,ctrl_is_pcfifo_inst0_vld}
                                        + {2'b0,ctrl_is_pcfifo_inst1_vld}
                                        + {2'b0,ctrl_is_pcfifo_inst2_vld}
                                        + {2'b0,ctrl_is_pcfifo_inst3_vld};

//==========================================================
//               Barrier inst valid signal
//==========================================================
//ignore stall signals and type stall
assign ctrl_lsiq_is_bar_inst_vld = is_inst0_vld && dp_ctrl_is_inst0_bar
                                || is_inst1_vld && dp_ctrl_is_inst1_bar
                                || is_inst2_vld && dp_ctrl_is_inst2_bar
                                || is_inst3_vld && dp_ctrl_is_inst3_bar;

//==========================================================
//               Issue Queue empty signal
//==========================================================
assign idu_had_iq_empty = aiq0_ctrl_empty
                          && aiq1_ctrl_empty
                          && biq_ctrl_empty
                          && lsiq_ctrl_empty
                          && sdiq_ctrl_empty
                          && viq0_ctrl_empty
                          && viq1_ctrl_empty
                          && lsu_idu_vmb_empty;

//==========================================================
//                   Issue Stall signal
//==========================================================
assign queue_full_clk_en = ctrl_ir_pipedown_gateclk
                        || is_inst0_vld
                        || aiq0_ctrl_full_updt_clk_en
                        || aiq1_ctrl_full_updt_clk_en
                        || biq_ctrl_full_updt_clk_en
                        || lsiq_ctrl_full_updt_clk_en
                        || sdiq_ctrl_full_updt_clk_en
                        || viq0_ctrl_full_updt_clk_en
                        || viq1_ctrl_full_updt_clk_en
                        || lsu_idu_vmb_full_updt_clk_en;

// &Instance("gated_clk_cell", "x_queue_full_gated_clk"); @692
gated_clk_cell  x_queue_full_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (queue_full_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (queue_full_clk_en ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @693
//          .external_en (1'b0), @694
//          .global_en   (cp0_yy_clk_en), @695
//          .module_en   (cp0_idu_icg_en), @696
//          .local_en    (queue_full_clk_en), @697
//          .clk_out     (queue_full_clk)); @698

//----------------------------------------------------------
//                Issue Queue Full Prepare
//----------------------------------------------------------
// &CombBeg; @703
always @( ctrl_ir_pre_dis_aiq0_create0_en
       or is_dis_biq_create0_en
       or is_dis_viq0_create1_en
       or ctrl_ir_pre_dis_aiq0_create1_en
       or ctrl_ir_pre_dis_viq0_create1_en
       or is_dis_lsiq_create0_en
       or is_dis_viq1_create0_en
       or ctrl_ir_pre_dis_biq_create0_en
       or is_dis_aiq0_create1_en
       or is_dis_aiq1_create0_en
       or ctrl_ir_pre_dis_sdiq_create0_en
       or ctrl_ir_pre_dis_viq1_create1_en
       or is_dis_viq0_create0_en
       or is_dis_aiq0_create0_en
       or ctrl_ir_pre_dis_lsiq_create0_en
       or ctrl_ir_pre_dis_sdiq_create1_en
       or ctrl_ir_pre_dis_viq0_create0_en
       or is_dis_biq_create1_en
       or is_dis_aiq1_create1_en
       or ctrl_ir_pre_dis_aiq1_create1_en
       or ctrl_ir_pre_dis_biq_create1_en
       or is_dis_lsiq_create1_en
       or ctrl_ir_pre_dis_viq1_create0_en
       or is_dis_sdiq_create0_en
       or is_dis_viq1_create1_en
       or ctrl_ir_pre_dis_lsiq_create1_en
       or ctrl_is_dis_stall
       or ctrl_ir_pre_dis_aiq1_create0_en
       or is_dis_sdiq_create1_en)
begin
  if(!ctrl_is_dis_stall) begin
    is_dis_aiq0_create0_en_updt = ctrl_ir_pre_dis_aiq0_create0_en;
    is_dis_aiq0_create1_en_updt = ctrl_ir_pre_dis_aiq0_create1_en;
    is_dis_aiq1_create0_en_updt = ctrl_ir_pre_dis_aiq1_create0_en;
    is_dis_aiq1_create1_en_updt = ctrl_ir_pre_dis_aiq1_create1_en;
    is_dis_biq_create0_en_updt  = ctrl_ir_pre_dis_biq_create0_en;
    is_dis_biq_create1_en_updt  = ctrl_ir_pre_dis_biq_create1_en;
    is_dis_lsiq_create0_en_updt = ctrl_ir_pre_dis_lsiq_create0_en;
    is_dis_lsiq_create1_en_updt = ctrl_ir_pre_dis_lsiq_create1_en;
    is_dis_sdiq_create0_en_updt = ctrl_ir_pre_dis_sdiq_create0_en;
    is_dis_sdiq_create1_en_updt = ctrl_ir_pre_dis_sdiq_create1_en;
    is_dis_viq0_create0_en_updt = ctrl_ir_pre_dis_viq0_create0_en;
    is_dis_viq0_create1_en_updt = ctrl_ir_pre_dis_viq0_create1_en;
    is_dis_viq1_create0_en_updt = ctrl_ir_pre_dis_viq1_create0_en;
    is_dis_viq1_create1_en_updt = ctrl_ir_pre_dis_viq1_create1_en;
  end
  else begin
    is_dis_aiq0_create0_en_updt = is_dis_aiq0_create0_en;
    is_dis_aiq0_create1_en_updt = is_dis_aiq0_create1_en;
    is_dis_aiq1_create0_en_updt = is_dis_aiq1_create0_en;
    is_dis_aiq1_create1_en_updt = is_dis_aiq1_create1_en;
    is_dis_biq_create0_en_updt  = is_dis_biq_create0_en;
    is_dis_biq_create1_en_updt  = is_dis_biq_create1_en;
    is_dis_lsiq_create0_en_updt = is_dis_lsiq_create0_en;
    is_dis_lsiq_create1_en_updt = is_dis_lsiq_create1_en;
    is_dis_sdiq_create0_en_updt = is_dis_sdiq_create0_en;
    is_dis_sdiq_create1_en_updt = is_dis_sdiq_create1_en;
    is_dis_viq0_create0_en_updt = is_dis_viq0_create0_en;
    is_dis_viq0_create1_en_updt = is_dis_viq0_create1_en;
    is_dis_viq1_create0_en_updt = is_dis_viq1_create0_en;
    is_dis_viq1_create1_en_updt = is_dis_viq1_create1_en;
  end
// &CombEnd; @736
end

assign ctrl_is_aiq0_full_updt =
            is_dis_aiq0_create0_en_updt && aiq0_ctrl_full_updt
         || is_dis_aiq0_create1_en_updt && aiq0_ctrl_1_left_updt;
assign ctrl_is_aiq1_full_updt =
            is_dis_aiq1_create0_en_updt && aiq1_ctrl_full_updt
         || is_dis_aiq1_create1_en_updt && aiq1_ctrl_1_left_updt;
assign ctrl_is_biq_full_updt  =
            is_dis_biq_create0_en_updt  && biq_ctrl_full_updt
         || is_dis_biq_create1_en_updt  && biq_ctrl_1_left_updt;
assign ctrl_is_lsiq_full_updt = 
            is_dis_lsiq_create0_en_updt && lsiq_ctrl_full_updt
         || is_dis_lsiq_create1_en_updt && lsiq_ctrl_1_left_updt;
assign ctrl_is_sdiq_full_updt = 
            is_dis_sdiq_create0_en_updt && sdiq_ctrl_full_updt
         || is_dis_sdiq_create1_en_updt && sdiq_ctrl_1_left_updt;
assign ctrl_is_viq0_full_updt =
            is_dis_viq0_create0_en_updt && viq0_ctrl_full_updt
         || is_dis_viq0_create1_en_updt && viq0_ctrl_1_left_updt;
assign ctrl_is_viq1_full_updt =
            is_dis_viq1_create0_en_updt && viq1_ctrl_full_updt
         || is_dis_viq1_create1_en_updt && viq1_ctrl_1_left_updt;

assign ctrl_is_iq_full_updt   = ctrl_is_aiq0_full_updt
                             || ctrl_is_aiq1_full_updt
                             || ctrl_is_biq_full_updt
                             || ctrl_is_lsiq_full_updt
                             || ctrl_is_sdiq_full_updt
                             || ctrl_is_viq0_full_updt
                             || ctrl_is_viq1_full_updt;

//----------------------------------------------------------
//                  LSU VMB Full Prepare
//----------------------------------------------------------
// &CombBeg; @771
always @( ctrl_ir_pre_dis_vmb_create1_en
       or ctrl_ir_pre_dis_vmb_create0_en
       or is_dis_vmb_create1_en
       or ctrl_is_dis_stall
       or is_dis_vmb_create0_en)
begin
  if(!ctrl_is_dis_stall) begin
    is_dis_vmb_create0_en_updt = ctrl_ir_pre_dis_vmb_create0_en;
    is_dis_vmb_create1_en_updt = ctrl_ir_pre_dis_vmb_create1_en;
  end
  else begin
    is_dis_vmb_create0_en_updt = is_dis_vmb_create0_en;
    is_dis_vmb_create1_en_updt = is_dis_vmb_create1_en;
  end
// &CombEnd; @780
end

assign ctrl_is_vmb_full_updt = 
            lsu_idu_vmb_full_updt
            && (is_dis_vmb_create0_en_updt || is_dis_vmb_create1_en_updt)
         || lsu_idu_vmb_1_left_updt
            && (is_dis_vmb_create0_en_updt && is_dis_vmb_create1_en_updt);

//----------------------------------------------------------
//                      Queue Full
//----------------------------------------------------------

always @(posedge queue_full_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    ctrl_is_iq_full   <= 1'b0;
    ctrl_is_vmb_full  <= 1'b0;
  end
  else if(rtu_idu_flush_fe || rtu_idu_flush_is || rtu_yy_xx_flush) begin
    ctrl_is_iq_full   <= 1'b0;
    ctrl_is_vmb_full  <= 1'b0;
  end
  else begin
    ctrl_is_iq_full   <= ctrl_is_iq_full_updt;
    ctrl_is_vmb_full  <= ctrl_is_vmb_full_updt;
  end
end

assign ctrl_top_is_iq_full  = ctrl_is_iq_full;
assign ctrl_top_is_vmb_full = ctrl_is_vmb_full;

//==========================================================
//                  Dispatch Stall signal
//==========================================================
//dispatch stall is when there is valid dispatch instruction and:
//1.RTU rob full (less than max create inst num entry valid)
assign ctrl_is_rob_full  = is_dis_inst0_vld && rtu_idu_rob_full;
//2.Issue Queue full
assign ctrl_is_dis_stall    = ctrl_is_rob_full || ctrl_is_iq_full || ctrl_is_vmb_full;
assign ctrl_dp_is_dis_stall = ctrl_is_dis_stall;

//==========================================================
//                    IS stall signals
//==========================================================
//if cannot dispatch all is pipeline inst, stall ir stage
assign ctrl_is_stall     = ctrl_is_dis_stall || is_dis_type_stall;

// &ModuleEnd; @827
endmodule


