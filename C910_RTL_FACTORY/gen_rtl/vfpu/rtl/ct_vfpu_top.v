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

// &ModuleBeg; @24
module ct_vfpu_top(
  cp0_vfpu_fcsr,
  cp0_vfpu_fxcr,
  cp0_vfpu_icg_en,
  cp0_vfpu_vl,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  idu_vfpu_is_vdiv_gateclk_issue,
  idu_vfpu_is_vdiv_issue,
  idu_vfpu_rf_pipe6_dst_ereg,
  idu_vfpu_rf_pipe6_dst_preg,
  idu_vfpu_rf_pipe6_dst_vld,
  idu_vfpu_rf_pipe6_dst_vreg,
  idu_vfpu_rf_pipe6_dste_vld,
  idu_vfpu_rf_pipe6_dstv_vld,
  idu_vfpu_rf_pipe6_eu_sel,
  idu_vfpu_rf_pipe6_func,
  idu_vfpu_rf_pipe6_gateclk_sel,
  idu_vfpu_rf_pipe6_iid,
  idu_vfpu_rf_pipe6_imm0,
  idu_vfpu_rf_pipe6_inst_type,
  idu_vfpu_rf_pipe6_mla_srcv2_vld,
  idu_vfpu_rf_pipe6_mla_srcv2_vreg,
  idu_vfpu_rf_pipe6_ready_stage,
  idu_vfpu_rf_pipe6_sel,
  idu_vfpu_rf_pipe6_srcv0_fr,
  idu_vfpu_rf_pipe6_srcv1_fr,
  idu_vfpu_rf_pipe6_srcv2_fr,
  idu_vfpu_rf_pipe6_vmla_type,
  idu_vfpu_rf_pipe7_dst_ereg,
  idu_vfpu_rf_pipe7_dst_preg,
  idu_vfpu_rf_pipe7_dst_vld,
  idu_vfpu_rf_pipe7_dst_vreg,
  idu_vfpu_rf_pipe7_dste_vld,
  idu_vfpu_rf_pipe7_dstv_vld,
  idu_vfpu_rf_pipe7_eu_sel,
  idu_vfpu_rf_pipe7_func,
  idu_vfpu_rf_pipe7_gateclk_sel,
  idu_vfpu_rf_pipe7_iid,
  idu_vfpu_rf_pipe7_imm0,
  idu_vfpu_rf_pipe7_inst_type,
  idu_vfpu_rf_pipe7_mla_srcv2_vld,
  idu_vfpu_rf_pipe7_mla_srcv2_vreg,
  idu_vfpu_rf_pipe7_ready_stage,
  idu_vfpu_rf_pipe7_sel,
  idu_vfpu_rf_pipe7_srcv0_fr,
  idu_vfpu_rf_pipe7_srcv1_fr,
  idu_vfpu_rf_pipe7_srcv2_fr,
  idu_vfpu_rf_pipe7_vmla_type,
  iu_vfpu_ex1_pipe0_mtvr_inst,
  iu_vfpu_ex1_pipe0_mtvr_vl,
  iu_vfpu_ex1_pipe0_mtvr_vld,
  iu_vfpu_ex1_pipe0_mtvr_vlmul,
  iu_vfpu_ex1_pipe0_mtvr_vreg,
  iu_vfpu_ex1_pipe0_mtvr_vsew,
  iu_vfpu_ex1_pipe1_mtvr_inst,
  iu_vfpu_ex1_pipe1_mtvr_vl,
  iu_vfpu_ex1_pipe1_mtvr_vld,
  iu_vfpu_ex1_pipe1_mtvr_vlmul,
  iu_vfpu_ex1_pipe1_mtvr_vreg,
  iu_vfpu_ex1_pipe1_mtvr_vsew,
  iu_vfpu_ex2_pipe0_mtvr_src0,
  iu_vfpu_ex2_pipe0_mtvr_vld,
  iu_vfpu_ex2_pipe1_mtvr_src0,
  iu_vfpu_ex2_pipe1_mtvr_vld,
  pad_yy_icg_scan_en,
  rtu_yy_xx_flush,
  vfdsu_ifu_debug_ex2_wait,
  vfdsu_ifu_debug_idle,
  vfdsu_ifu_debug_pipe_busy,
  vfpu_idu_ex1_pipe6_data_vld_dup0,
  vfpu_idu_ex1_pipe6_data_vld_dup1,
  vfpu_idu_ex1_pipe6_data_vld_dup2,
  vfpu_idu_ex1_pipe6_data_vld_dup3,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup0,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup1,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup2,
  vfpu_idu_ex1_pipe6_fmla_data_vld_dup3,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3,
  vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4,
  vfpu_idu_ex1_pipe6_preg_dup0,
  vfpu_idu_ex1_pipe6_preg_dup1,
  vfpu_idu_ex1_pipe6_preg_dup2,
  vfpu_idu_ex1_pipe6_preg_dup3,
  vfpu_idu_ex1_pipe6_preg_dup4,
  vfpu_idu_ex1_pipe6_vreg_dup0,
  vfpu_idu_ex1_pipe6_vreg_dup1,
  vfpu_idu_ex1_pipe6_vreg_dup2,
  vfpu_idu_ex1_pipe6_vreg_dup3,
  vfpu_idu_ex1_pipe7_data_vld_dup0,
  vfpu_idu_ex1_pipe7_data_vld_dup1,
  vfpu_idu_ex1_pipe7_data_vld_dup2,
  vfpu_idu_ex1_pipe7_data_vld_dup3,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup0,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup1,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup2,
  vfpu_idu_ex1_pipe7_fmla_data_vld_dup3,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3,
  vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4,
  vfpu_idu_ex1_pipe7_preg_dup0,
  vfpu_idu_ex1_pipe7_preg_dup1,
  vfpu_idu_ex1_pipe7_preg_dup2,
  vfpu_idu_ex1_pipe7_preg_dup3,
  vfpu_idu_ex1_pipe7_preg_dup4,
  vfpu_idu_ex1_pipe7_vreg_dup0,
  vfpu_idu_ex1_pipe7_vreg_dup1,
  vfpu_idu_ex1_pipe7_vreg_dup2,
  vfpu_idu_ex1_pipe7_vreg_dup3,
  vfpu_idu_ex2_pipe6_data_vld_dup0,
  vfpu_idu_ex2_pipe6_data_vld_dup1,
  vfpu_idu_ex2_pipe6_data_vld_dup2,
  vfpu_idu_ex2_pipe6_data_vld_dup3,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup0,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup1,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup2,
  vfpu_idu_ex2_pipe6_fmla_data_vld_dup3,
  vfpu_idu_ex2_pipe6_vreg_dup0,
  vfpu_idu_ex2_pipe6_vreg_dup1,
  vfpu_idu_ex2_pipe6_vreg_dup2,
  vfpu_idu_ex2_pipe6_vreg_dup3,
  vfpu_idu_ex2_pipe7_data_vld_dup0,
  vfpu_idu_ex2_pipe7_data_vld_dup1,
  vfpu_idu_ex2_pipe7_data_vld_dup2,
  vfpu_idu_ex2_pipe7_data_vld_dup3,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup0,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup1,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup2,
  vfpu_idu_ex2_pipe7_fmla_data_vld_dup3,
  vfpu_idu_ex2_pipe7_vreg_dup0,
  vfpu_idu_ex2_pipe7_vreg_dup1,
  vfpu_idu_ex2_pipe7_vreg_dup2,
  vfpu_idu_ex2_pipe7_vreg_dup3,
  vfpu_idu_ex3_pipe6_data_vld_dup0,
  vfpu_idu_ex3_pipe6_data_vld_dup1,
  vfpu_idu_ex3_pipe6_data_vld_dup2,
  vfpu_idu_ex3_pipe6_data_vld_dup3,
  vfpu_idu_ex3_pipe6_fwd_vreg,
  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data,
  vfpu_idu_ex3_pipe6_fwd_vreg_vld,
  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data,
  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data,
  vfpu_idu_ex3_pipe6_vreg_dup0,
  vfpu_idu_ex3_pipe6_vreg_dup1,
  vfpu_idu_ex3_pipe6_vreg_dup2,
  vfpu_idu_ex3_pipe6_vreg_dup3,
  vfpu_idu_ex3_pipe7_data_vld_dup0,
  vfpu_idu_ex3_pipe7_data_vld_dup1,
  vfpu_idu_ex3_pipe7_data_vld_dup2,
  vfpu_idu_ex3_pipe7_data_vld_dup3,
  vfpu_idu_ex3_pipe7_fwd_vreg,
  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data,
  vfpu_idu_ex3_pipe7_fwd_vreg_vld,
  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data,
  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data,
  vfpu_idu_ex3_pipe7_vreg_dup0,
  vfpu_idu_ex3_pipe7_vreg_dup1,
  vfpu_idu_ex3_pipe7_vreg_dup2,
  vfpu_idu_ex3_pipe7_vreg_dup3,
  vfpu_idu_ex4_pipe6_fwd_vreg,
  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data,
  vfpu_idu_ex4_pipe6_fwd_vreg_vld,
  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data,
  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data,
  vfpu_idu_ex4_pipe7_fwd_vreg,
  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data,
  vfpu_idu_ex4_pipe7_fwd_vreg_vld,
  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data,
  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data,
  vfpu_idu_ex5_pipe6_fwd_vreg,
  vfpu_idu_ex5_pipe6_fwd_vreg_vld,
  vfpu_idu_ex5_pipe6_wb_ereg,
  vfpu_idu_ex5_pipe6_wb_ereg_data,
  vfpu_idu_ex5_pipe6_wb_ereg_vld,
  vfpu_idu_ex5_pipe6_wb_vreg_dup0,
  vfpu_idu_ex5_pipe6_wb_vreg_dup1,
  vfpu_idu_ex5_pipe6_wb_vreg_dup2,
  vfpu_idu_ex5_pipe6_wb_vreg_dup3,
  vfpu_idu_ex5_pipe6_wb_vreg_fr_data,
  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_fr_vld,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2,
  vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3,
  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data,
  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld,
  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data,
  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand,
  vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld,
  vfpu_idu_ex5_pipe7_fwd_vreg,
  vfpu_idu_ex5_pipe7_fwd_vreg_vld,
  vfpu_idu_ex5_pipe7_wb_ereg,
  vfpu_idu_ex5_pipe7_wb_ereg_data,
  vfpu_idu_ex5_pipe7_wb_ereg_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_dup0,
  vfpu_idu_ex5_pipe7_wb_vreg_dup1,
  vfpu_idu_ex5_pipe7_wb_vreg_dup2,
  vfpu_idu_ex5_pipe7_wb_vreg_dup3,
  vfpu_idu_ex5_pipe7_wb_vreg_fr_data,
  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_fr_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2,
  vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3,
  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data,
  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld,
  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data,
  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand,
  vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld,
  vfpu_idu_pipe6_vmla_srcv2_no_fwd,
  vfpu_idu_pipe7_vmla_srcv2_no_fwd,
  vfpu_idu_vdiv_busy,
  vfpu_idu_vdiv_wb_stall,
  vfpu_iu_ex2_pipe6_mfvr_data,
  vfpu_iu_ex2_pipe6_mfvr_data_vld,
  vfpu_iu_ex2_pipe6_mfvr_preg,
  vfpu_iu_ex2_pipe7_mfvr_data,
  vfpu_iu_ex2_pipe7_mfvr_data_vld,
  vfpu_iu_ex2_pipe7_mfvr_preg,
  vfpu_rtu_ex5_pipe6_ereg_wb_vld,
  vfpu_rtu_ex5_pipe6_wb_ereg,
  vfpu_rtu_ex5_pipe6_wb_vreg_expand,
  vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld,
  vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld,
  vfpu_rtu_ex5_pipe7_ereg_wb_vld,
  vfpu_rtu_ex5_pipe7_wb_ereg,
  vfpu_rtu_ex5_pipe7_wb_vreg_expand,
  vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld,
  vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld,
  vfpu_rtu_pipe6_cmplt,
  vfpu_rtu_pipe6_iid,
  vfpu_rtu_pipe7_cmplt,
  vfpu_rtu_pipe7_iid
);

// &Ports; @25
input   [63:0]  cp0_vfpu_fcsr;                         
input   [31:0]  cp0_vfpu_fxcr;                         
input           cp0_vfpu_icg_en;                       
input   [7 :0]  cp0_vfpu_vl;                           
input           cp0_yy_clk_en;                         
input           cpurst_b;                              
input           forever_cpuclk;                        
input           idu_vfpu_is_vdiv_gateclk_issue;        
input           idu_vfpu_is_vdiv_issue;                
input   [4 :0]  idu_vfpu_rf_pipe6_dst_ereg;            
input   [6 :0]  idu_vfpu_rf_pipe6_dst_preg;            
input           idu_vfpu_rf_pipe6_dst_vld;             
input   [6 :0]  idu_vfpu_rf_pipe6_dst_vreg;            
input           idu_vfpu_rf_pipe6_dste_vld;            
input           idu_vfpu_rf_pipe6_dstv_vld;            
input   [11:0]  idu_vfpu_rf_pipe6_eu_sel;              
input   [19:0]  idu_vfpu_rf_pipe6_func;                
input           idu_vfpu_rf_pipe6_gateclk_sel;         
input   [6 :0]  idu_vfpu_rf_pipe6_iid;                 
input   [2 :0]  idu_vfpu_rf_pipe6_imm0;                
input   [5 :0]  idu_vfpu_rf_pipe6_inst_type;           
input           idu_vfpu_rf_pipe6_mla_srcv2_vld;       
input   [6 :0]  idu_vfpu_rf_pipe6_mla_srcv2_vreg;      
input   [2 :0]  idu_vfpu_rf_pipe6_ready_stage;         
input           idu_vfpu_rf_pipe6_sel;                 
input   [63:0]  idu_vfpu_rf_pipe6_srcv0_fr;            
input   [63:0]  idu_vfpu_rf_pipe6_srcv1_fr;            
input   [63:0]  idu_vfpu_rf_pipe6_srcv2_fr;            
input   [2 :0]  idu_vfpu_rf_pipe6_vmla_type;           
input   [4 :0]  idu_vfpu_rf_pipe7_dst_ereg;            
input   [6 :0]  idu_vfpu_rf_pipe7_dst_preg;            
input           idu_vfpu_rf_pipe7_dst_vld;             
input   [6 :0]  idu_vfpu_rf_pipe7_dst_vreg;            
input           idu_vfpu_rf_pipe7_dste_vld;            
input           idu_vfpu_rf_pipe7_dstv_vld;            
input   [11:0]  idu_vfpu_rf_pipe7_eu_sel;              
input   [19:0]  idu_vfpu_rf_pipe7_func;                
input           idu_vfpu_rf_pipe7_gateclk_sel;         
input   [6 :0]  idu_vfpu_rf_pipe7_iid;                 
input   [2 :0]  idu_vfpu_rf_pipe7_imm0;                
input   [5 :0]  idu_vfpu_rf_pipe7_inst_type;           
input           idu_vfpu_rf_pipe7_mla_srcv2_vld;       
input   [6 :0]  idu_vfpu_rf_pipe7_mla_srcv2_vreg;      
input   [2 :0]  idu_vfpu_rf_pipe7_ready_stage;         
input           idu_vfpu_rf_pipe7_sel;                 
input   [63:0]  idu_vfpu_rf_pipe7_srcv0_fr;            
input   [63:0]  idu_vfpu_rf_pipe7_srcv1_fr;            
input   [63:0]  idu_vfpu_rf_pipe7_srcv2_fr;            
input   [2 :0]  idu_vfpu_rf_pipe7_vmla_type;           
input   [4 :0]  iu_vfpu_ex1_pipe0_mtvr_inst;           
input   [7 :0]  iu_vfpu_ex1_pipe0_mtvr_vl;             
input           iu_vfpu_ex1_pipe0_mtvr_vld;            
input   [1 :0]  iu_vfpu_ex1_pipe0_mtvr_vlmul;          
input   [6 :0]  iu_vfpu_ex1_pipe0_mtvr_vreg;           
input   [2 :0]  iu_vfpu_ex1_pipe0_mtvr_vsew;           
input   [4 :0]  iu_vfpu_ex1_pipe1_mtvr_inst;           
input   [7 :0]  iu_vfpu_ex1_pipe1_mtvr_vl;             
input           iu_vfpu_ex1_pipe1_mtvr_vld;            
input   [1 :0]  iu_vfpu_ex1_pipe1_mtvr_vlmul;          
input   [6 :0]  iu_vfpu_ex1_pipe1_mtvr_vreg;           
input   [2 :0]  iu_vfpu_ex1_pipe1_mtvr_vsew;           
input   [63:0]  iu_vfpu_ex2_pipe0_mtvr_src0;           
input           iu_vfpu_ex2_pipe0_mtvr_vld;            
input   [63:0]  iu_vfpu_ex2_pipe1_mtvr_src0;           
input           iu_vfpu_ex2_pipe1_mtvr_vld;            
input           pad_yy_icg_scan_en;                    
input           rtu_yy_xx_flush;                       
output          vfdsu_ifu_debug_ex2_wait;              
output          vfdsu_ifu_debug_idle;                  
output          vfdsu_ifu_debug_pipe_busy;             
output          vfpu_idu_ex1_pipe6_data_vld_dup0;      
output          vfpu_idu_ex1_pipe6_data_vld_dup1;      
output          vfpu_idu_ex1_pipe6_data_vld_dup2;      
output          vfpu_idu_ex1_pipe6_data_vld_dup3;      
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup0; 
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup1; 
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup2; 
output          vfpu_idu_ex1_pipe6_fmla_data_vld_dup3; 
output          vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0; 
output          vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1; 
output          vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2; 
output          vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3; 
output          vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4; 
output  [6 :0]  vfpu_idu_ex1_pipe6_preg_dup0;          
output  [6 :0]  vfpu_idu_ex1_pipe6_preg_dup1;          
output  [6 :0]  vfpu_idu_ex1_pipe6_preg_dup2;          
output  [6 :0]  vfpu_idu_ex1_pipe6_preg_dup3;          
output  [6 :0]  vfpu_idu_ex1_pipe6_preg_dup4;          
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup0;          
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup1;          
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup2;          
output  [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup3;          
output          vfpu_idu_ex1_pipe7_data_vld_dup0;      
output          vfpu_idu_ex1_pipe7_data_vld_dup1;      
output          vfpu_idu_ex1_pipe7_data_vld_dup2;      
output          vfpu_idu_ex1_pipe7_data_vld_dup3;      
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup0; 
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup1; 
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup2; 
output          vfpu_idu_ex1_pipe7_fmla_data_vld_dup3; 
output          vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0; 
output          vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1; 
output          vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2; 
output          vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3; 
output          vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4; 
output  [6 :0]  vfpu_idu_ex1_pipe7_preg_dup0;          
output  [6 :0]  vfpu_idu_ex1_pipe7_preg_dup1;          
output  [6 :0]  vfpu_idu_ex1_pipe7_preg_dup2;          
output  [6 :0]  vfpu_idu_ex1_pipe7_preg_dup3;          
output  [6 :0]  vfpu_idu_ex1_pipe7_preg_dup4;          
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup0;          
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup1;          
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup2;          
output  [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup3;          
output          vfpu_idu_ex2_pipe6_data_vld_dup0;      
output          vfpu_idu_ex2_pipe6_data_vld_dup1;      
output          vfpu_idu_ex2_pipe6_data_vld_dup2;      
output          vfpu_idu_ex2_pipe6_data_vld_dup3;      
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup0; 
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup1; 
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup2; 
output          vfpu_idu_ex2_pipe6_fmla_data_vld_dup3; 
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup0;          
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup1;          
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup2;          
output  [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup3;          
output          vfpu_idu_ex2_pipe7_data_vld_dup0;      
output          vfpu_idu_ex2_pipe7_data_vld_dup1;      
output          vfpu_idu_ex2_pipe7_data_vld_dup2;      
output          vfpu_idu_ex2_pipe7_data_vld_dup3;      
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup0; 
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup1; 
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup2; 
output          vfpu_idu_ex2_pipe7_fmla_data_vld_dup3; 
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup0;          
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup1;          
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup2;          
output  [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup3;          
output          vfpu_idu_ex3_pipe6_data_vld_dup0;      
output          vfpu_idu_ex3_pipe6_data_vld_dup1;      
output          vfpu_idu_ex3_pipe6_data_vld_dup2;      
output          vfpu_idu_ex3_pipe6_data_vld_dup3;      
output  [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;           
output  [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;   
output          vfpu_idu_ex3_pipe6_fwd_vreg_vld;       
output  [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data;  
output  [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data;  
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup0;          
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup1;          
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup2;          
output  [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup3;          
output          vfpu_idu_ex3_pipe7_data_vld_dup0;      
output          vfpu_idu_ex3_pipe7_data_vld_dup1;      
output          vfpu_idu_ex3_pipe7_data_vld_dup2;      
output          vfpu_idu_ex3_pipe7_data_vld_dup3;      
output  [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;           
output  [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;   
output          vfpu_idu_ex3_pipe7_fwd_vreg_vld;       
output  [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data;  
output  [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data;  
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup0;          
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup1;          
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup2;          
output  [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup3;          
output  [6 :0]  vfpu_idu_ex4_pipe6_fwd_vreg;           
output  [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data;   
output          vfpu_idu_ex4_pipe6_fwd_vreg_vld;       
output  [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data;  
output  [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data;  
output  [6 :0]  vfpu_idu_ex4_pipe7_fwd_vreg;           
output  [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data;   
output          vfpu_idu_ex4_pipe7_fwd_vreg_vld;       
output  [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data;  
output  [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data;  
output  [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;           
output          vfpu_idu_ex5_pipe6_fwd_vreg_vld;       
output  [4 :0]  vfpu_idu_ex5_pipe6_wb_ereg;            
output  [5 :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;       
output          vfpu_idu_ex5_pipe6_wb_ereg_vld;        
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup0;       
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup1;       
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup2;       
output  [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup3;       
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;    
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand;  
output          vfpu_idu_ex5_pipe6_wb_vreg_fr_vld;     
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0;   
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1;   
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2;   
output          vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3;   
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;   
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand; 
output          vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld;    
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;   
output  [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand; 
output          vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld;    
output  [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;           
output          vfpu_idu_ex5_pipe7_fwd_vreg_vld;       
output  [4 :0]  vfpu_idu_ex5_pipe7_wb_ereg;            
output  [5 :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;       
output          vfpu_idu_ex5_pipe7_wb_ereg_vld;        
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup0;       
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup1;       
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup2;       
output  [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup3;       
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;    
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand;  
output          vfpu_idu_ex5_pipe7_wb_vreg_fr_vld;     
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0;   
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1;   
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2;   
output          vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3;   
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;   
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand; 
output          vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld;    
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;   
output  [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand; 
output          vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld;    
output          vfpu_idu_pipe6_vmla_srcv2_no_fwd;      
output          vfpu_idu_pipe7_vmla_srcv2_no_fwd;      
output          vfpu_idu_vdiv_busy;                    
output          vfpu_idu_vdiv_wb_stall;                
output  [63:0]  vfpu_iu_ex2_pipe6_mfvr_data;           
output          vfpu_iu_ex2_pipe6_mfvr_data_vld;       
output  [6 :0]  vfpu_iu_ex2_pipe6_mfvr_preg;           
output  [63:0]  vfpu_iu_ex2_pipe7_mfvr_data;           
output          vfpu_iu_ex2_pipe7_mfvr_data_vld;       
output  [6 :0]  vfpu_iu_ex2_pipe7_mfvr_preg;           
output          vfpu_rtu_ex5_pipe6_ereg_wb_vld;        
output  [4 :0]  vfpu_rtu_ex5_pipe6_wb_ereg;            
output  [63:0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;     
output          vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld;     
output          vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld;     
output          vfpu_rtu_ex5_pipe7_ereg_wb_vld;        
output  [4 :0]  vfpu_rtu_ex5_pipe7_wb_ereg;            
output  [63:0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;     
output          vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld;     
output          vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld;     
output          vfpu_rtu_pipe6_cmplt;                  
output  [6 :0]  vfpu_rtu_pipe6_iid;                    
output          vfpu_rtu_pipe7_cmplt;                  
output  [6 :0]  vfpu_rtu_pipe7_iid;                    

// &Regs; @26

// &Wires; @27
wire    [31:0]  cp0_vfpu_fxcr;                         
wire            cp0_vfpu_icg_en;                       
wire            cp0_yy_clk_en;                         
wire            cpurst_b;                              
wire            ctrl_dp_ex2_pipe7_inst_vld;            
wire            ctrl_ex1_pipe6_data_vld;               
wire            ctrl_ex1_pipe6_data_vld_dup0;          
wire            ctrl_ex1_pipe6_data_vld_dup1;          
wire            ctrl_ex1_pipe6_data_vld_dup2;          
wire    [11:0]  ctrl_ex1_pipe6_eu_sel;                 
wire            ctrl_ex1_pipe6_inst_vld;               
wire            ctrl_ex1_pipe6_mfvr_inst_vld;          
wire            ctrl_ex1_pipe6_mfvr_inst_vld_dup0;     
wire            ctrl_ex1_pipe6_mfvr_inst_vld_dup1;     
wire            ctrl_ex1_pipe6_mfvr_inst_vld_dup2;     
wire            ctrl_ex1_pipe6_mfvr_inst_vld_dup3;     
wire            ctrl_ex1_pipe7_data_vld;               
wire            ctrl_ex1_pipe7_data_vld_dup0;          
wire            ctrl_ex1_pipe7_data_vld_dup1;          
wire            ctrl_ex1_pipe7_data_vld_dup2;          
wire    [11:0]  ctrl_ex1_pipe7_eu_sel;                 
wire            ctrl_ex1_pipe7_mfvr_inst_vld;          
wire            ctrl_ex1_pipe7_mfvr_inst_vld_dup0;     
wire            ctrl_ex1_pipe7_mfvr_inst_vld_dup1;     
wire            ctrl_ex1_pipe7_mfvr_inst_vld_dup2;     
wire            ctrl_ex1_pipe7_mfvr_inst_vld_dup3;     
wire            ctrl_ex2_pipe6_data_vld;               
wire            ctrl_ex2_pipe6_data_vld_dup0;          
wire            ctrl_ex2_pipe6_data_vld_dup1;          
wire            ctrl_ex2_pipe6_data_vld_dup2;          
wire            ctrl_ex2_pipe6_inst_vld;               
wire            ctrl_ex2_pipe6_mfvr_inst_vld;          
wire            ctrl_ex2_pipe7_data_vld;               
wire            ctrl_ex2_pipe7_data_vld_dup0;          
wire            ctrl_ex2_pipe7_data_vld_dup1;          
wire            ctrl_ex2_pipe7_data_vld_dup2;          
wire            ctrl_ex2_pipe7_inst_vld;               
wire            ctrl_ex2_pipe7_mfvr_inst_vld;          
wire            ctrl_ex3_pipe6_data_vld;               
wire            ctrl_ex3_pipe6_data_vld_dup0;          
wire            ctrl_ex3_pipe6_data_vld_dup1;          
wire            ctrl_ex3_pipe6_data_vld_dup2;          
wire            ctrl_ex3_pipe6_fwd_vld;                
wire            ctrl_ex3_pipe6_inst_vld;               
wire            ctrl_ex3_pipe7_data_vld;               
wire            ctrl_ex3_pipe7_data_vld_dup0;          
wire            ctrl_ex3_pipe7_data_vld_dup1;          
wire            ctrl_ex3_pipe7_data_vld_dup2;          
wire            ctrl_ex3_pipe7_fwd_vld;                
wire            ctrl_ex3_pipe7_inst_vld;               
wire            ctrl_ex4_pipe6_fwd_vld;                
wire            ctrl_ex4_pipe6_inst_vld;               
wire            ctrl_ex4_pipe7_fwd_vld;                
wire            ctrl_ex4_pipe7_inst_vld;               
wire            ctrl_ex5_pipe6_clk;                    
wire            ctrl_ex5_pipe7_clk;                    
wire            dp_ctrl_ex1_pipe6_data_vld_pre;        
wire            dp_ctrl_ex1_pipe7_data_vld_pre;        
wire            dp_ctrl_ex2_pipe6_data_vld_pre;        
wire            dp_ctrl_ex2_pipe7_data_vld_pre;        
wire            dp_ctrl_ex3_pipe6_data_vld_pre;        
wire            dp_ctrl_ex3_pipe6_fwd_vld_pre;         
wire            dp_ctrl_ex3_pipe7_data_vld_pre;        
wire            dp_ctrl_ex3_pipe7_fwd_vld_pre;         
wire            dp_ctrl_ex4_pipe6_fwd_vld_pre;         
wire            dp_ctrl_ex4_pipe7_fwd_vld_pre;         
wire            dp_ctrl_pipe6_vfdsu_inst_vld;          
wire            dp_ex1_pipe6_dst_vld_pre;              
wire            dp_ex1_pipe7_dst_vld_pre;              
wire    [6 :0]  dp_ex3_pipe6_dst_vreg;                 
wire    [63:0]  dp_ex3_pipe6_freg_data;                
wire    [6 :0]  dp_ex3_pipe7_dst_vreg;                 
wire    [63:0]  dp_ex3_pipe7_freg_data;                
wire    [4 :0]  dp_ex4_pipe6_dst_ereg;                 
wire    [6 :0]  dp_ex4_pipe6_dst_vreg;                 
wire            dp_ex4_pipe6_normal_dste_wb_vld;       
wire            dp_ex4_pipe6_normal_dstv_wb_vld;       
wire    [4 :0]  dp_ex4_pipe7_dst_ereg;                 
wire    [6 :0]  dp_ex4_pipe7_dst_vreg;                 
wire            dp_ex4_pipe7_dste_vld;                 
wire            dp_ex4_pipe7_dstv_vld;                 
wire    [4 :0]  dp_ex5_pipe6_ereg_data_pre;            
wire    [63:0]  dp_ex5_pipe6_freg_data_pre;            
wire    [4 :0]  dp_ex5_pipe7_ereg_data_pre;            
wire    [63:0]  dp_ex5_pipe7_freg_data_pre;            
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg;                
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg_dup0;           
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg_dup1;           
wire    [6 :0]  dp_rbus_pipe6_ex1_vreg_dup2;           
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg;                
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg_dup0;           
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg_dup1;           
wire    [6 :0]  dp_rbus_pipe6_ex2_vreg_dup2;           
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup0;           
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup1;           
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup2;           
wire    [6 :0]  dp_rbus_pipe6_ex3_vreg_dup3;           
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg;                
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg_dup0;           
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg_dup1;           
wire    [6 :0]  dp_rbus_pipe7_ex1_vreg_dup2;           
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg;                
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg_dup0;           
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg_dup1;           
wire    [6 :0]  dp_rbus_pipe7_ex2_vreg_dup2;           
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup0;           
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup1;           
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup2;           
wire    [6 :0]  dp_rbus_pipe7_ex3_vreg_dup3;           
wire    [19:0]  dp_vfalu_ex1_pipe6_func;               
wire    [2 :0]  dp_vfalu_ex1_pipe6_imm0;               
wire    [63:0]  dp_vfalu_ex1_pipe6_mtvr_src0;          
wire    [2 :0]  dp_vfalu_ex1_pipe6_sel;                
wire    [63:0]  dp_vfalu_ex1_pipe6_srcf0;              
wire    [63:0]  dp_vfalu_ex1_pipe6_srcf1;              
wire    [19:0]  dp_vfalu_ex1_pipe7_func;               
wire    [2 :0]  dp_vfalu_ex1_pipe7_imm0;               
wire    [63:0]  dp_vfalu_ex1_pipe7_mtvr_src0;          
wire    [2 :0]  dp_vfalu_ex1_pipe7_sel;                
wire    [63:0]  dp_vfalu_ex1_pipe7_srcf0;              
wire    [63:0]  dp_vfalu_ex1_pipe7_srcf1;              
wire    [4 :0]  dp_vfdsu_ex1_pipe6_dst_ereg;           
wire    [6 :0]  dp_vfdsu_ex1_pipe6_dst_vreg;           
wire    [6 :0]  dp_vfdsu_ex1_pipe6_iid;                
wire    [2 :0]  dp_vfdsu_ex1_pipe6_imm0;               
wire            dp_vfdsu_ex1_pipe6_sel;                
wire    [63:0]  dp_vfdsu_ex1_pipe6_srcf0;              
wire    [63:0]  dp_vfdsu_ex1_pipe6_srcf1;              
wire            dp_vfdsu_fdiv_gateclk_issue;           
wire            dp_vfdsu_idu_fdiv_issue;               
wire    [6 :0]  dp_vfmau_ex1_pipe6_dst_vreg;           
wire    [2 :0]  dp_vfmau_ex1_pipe6_imm0;               
wire            dp_vfmau_ex1_pipe6_sel;                
wire    [6 :0]  dp_vfmau_ex1_pipe7_dst_vreg;           
wire    [2 :0]  dp_vfmau_ex1_pipe7_imm0;               
wire            dp_vfmau_ex1_pipe7_sel;                
wire    [5 :0]  dp_vfmau_pipe6_inst_type;              
wire            dp_vfmau_pipe6_mla_srcv2_vld;          
wire    [6 :0]  dp_vfmau_pipe6_mla_srcv2_vreg;         
wire    [2 :0]  dp_vfmau_pipe6_mla_type;               
wire            dp_vfmau_pipe6_sel;                    
wire            dp_vfmau_pipe6_vfmau_sel;              
wire    [5 :0]  dp_vfmau_pipe7_inst_type;              
wire            dp_vfmau_pipe7_mla_srcv2_vld;          
wire    [6 :0]  dp_vfmau_pipe7_mla_srcv2_vreg;         
wire    [2 :0]  dp_vfmau_pipe7_mla_type;               
wire            dp_vfmau_pipe7_sel;                    
wire            dp_vfmau_pipe7_vfmau_sel;              
wire            dp_vfmau_rf_pipe6_sel;                 
wire            dp_vfmau_rf_pipe7_sel;                 
wire            forever_cpuclk;                        
wire            idu_vfpu_is_vdiv_gateclk_issue;        
wire            idu_vfpu_is_vdiv_issue;                
wire    [4 :0]  idu_vfpu_rf_pipe6_dst_ereg;            
wire    [6 :0]  idu_vfpu_rf_pipe6_dst_preg;            
wire            idu_vfpu_rf_pipe6_dst_vld;             
wire    [6 :0]  idu_vfpu_rf_pipe6_dst_vreg;            
wire            idu_vfpu_rf_pipe6_dste_vld;            
wire            idu_vfpu_rf_pipe6_dstv_vld;            
wire    [11:0]  idu_vfpu_rf_pipe6_eu_sel;              
wire    [19:0]  idu_vfpu_rf_pipe6_func;                
wire            idu_vfpu_rf_pipe6_gateclk_sel;         
wire    [6 :0]  idu_vfpu_rf_pipe6_iid;                 
wire    [2 :0]  idu_vfpu_rf_pipe6_imm0;                
wire    [5 :0]  idu_vfpu_rf_pipe6_inst_type;           
wire            idu_vfpu_rf_pipe6_mla_srcv2_vld;       
wire    [6 :0]  idu_vfpu_rf_pipe6_mla_srcv2_vreg;      
wire    [2 :0]  idu_vfpu_rf_pipe6_ready_stage;         
wire            idu_vfpu_rf_pipe6_sel;                 
wire    [63:0]  idu_vfpu_rf_pipe6_srcv0_fr;            
wire    [63:0]  idu_vfpu_rf_pipe6_srcv1_fr;            
wire    [63:0]  idu_vfpu_rf_pipe6_srcv2_fr;            
wire    [2 :0]  idu_vfpu_rf_pipe6_vmla_type;           
wire    [4 :0]  idu_vfpu_rf_pipe7_dst_ereg;            
wire    [6 :0]  idu_vfpu_rf_pipe7_dst_preg;            
wire            idu_vfpu_rf_pipe7_dst_vld;             
wire    [6 :0]  idu_vfpu_rf_pipe7_dst_vreg;            
wire            idu_vfpu_rf_pipe7_dste_vld;            
wire            idu_vfpu_rf_pipe7_dstv_vld;            
wire    [11:0]  idu_vfpu_rf_pipe7_eu_sel;              
wire    [19:0]  idu_vfpu_rf_pipe7_func;                
wire            idu_vfpu_rf_pipe7_gateclk_sel;         
wire    [6 :0]  idu_vfpu_rf_pipe7_iid;                 
wire    [2 :0]  idu_vfpu_rf_pipe7_imm0;                
wire    [5 :0]  idu_vfpu_rf_pipe7_inst_type;           
wire            idu_vfpu_rf_pipe7_mla_srcv2_vld;       
wire    [6 :0]  idu_vfpu_rf_pipe7_mla_srcv2_vreg;      
wire    [2 :0]  idu_vfpu_rf_pipe7_ready_stage;         
wire            idu_vfpu_rf_pipe7_sel;                 
wire    [63:0]  idu_vfpu_rf_pipe7_srcv0_fr;            
wire    [63:0]  idu_vfpu_rf_pipe7_srcv1_fr;            
wire    [63:0]  idu_vfpu_rf_pipe7_srcv2_fr;            
wire    [2 :0]  idu_vfpu_rf_pipe7_vmla_type;           
wire    [4 :0]  iu_vfpu_ex1_pipe0_mtvr_inst;           
wire            iu_vfpu_ex1_pipe0_mtvr_vld;            
wire    [6 :0]  iu_vfpu_ex1_pipe0_mtvr_vreg;           
wire    [4 :0]  iu_vfpu_ex1_pipe1_mtvr_inst;           
wire            iu_vfpu_ex1_pipe1_mtvr_vld;            
wire    [6 :0]  iu_vfpu_ex1_pipe1_mtvr_vreg;           
wire    [63:0]  iu_vfpu_ex2_pipe0_mtvr_src0;           
wire    [63:0]  iu_vfpu_ex2_pipe1_mtvr_src0;           
wire            pad_yy_icg_scan_en;                    
wire            pipe6_dp_ex1_mult_id;                  
wire    [63:0]  pipe6_dp_ex1_vfalu_mfvr_data;          
wire    [4 :0]  pipe6_dp_ex3_vfalu_ereg_data;          
wire    [63:0]  pipe6_dp_ex3_vfalu_freg_data;          
wire    [4 :0]  pipe6_dp_ex3_vfmau_ereg_data;          
wire    [63:0]  pipe6_dp_ex3_vfmau_freg_data;          
wire    [4 :0]  pipe6_dp_ex4_vfmau_ereg_data;          
wire    [63:0]  pipe6_dp_ex4_vfmau_freg_data;          
wire    [4 :0]  pipe6_dp_vfdsu_ereg;                   
wire    [4 :0]  pipe6_dp_vfdsu_ereg_data;              
wire    [63:0]  pipe6_dp_vfdsu_freg_data;              
wire            pipe6_dp_vfdsu_inst_vld;               
wire    [6 :0]  pipe6_dp_vfdsu_vreg;                   
wire            pipe6_pipe6_ex4_fmla_fwd_vld;          
wire            pipe6_pipe6_ex5_ex1_fmla_fwd_vld;      
wire            pipe6_pipe6_ex5_ex2_fmla_fwd_vld;      
wire            pipe6_pipe7_ex4_fmla_fwd_vld;          
wire            pipe6_pipe7_ex5_ex1_fmla_fwd_vld;      
wire            pipe6_pipe7_ex5_ex2_fmla_fwd_vld;      
wire            pipe6_rbus_ex1_fmla_data_vld;          
wire            pipe6_rbus_ex1_fmla_data_vld_dup0;     
wire            pipe6_rbus_ex1_fmla_data_vld_dup1;     
wire            pipe6_rbus_ex1_fmla_data_vld_dup2;     
wire            pipe6_rbus_ex2_fmla_data_vld;          
wire            pipe6_rbus_ex2_fmla_data_vld_dup0;     
wire            pipe6_rbus_ex2_fmla_data_vld_dup1;     
wire            pipe6_rbus_ex2_fmla_data_vld_dup2;     
wire            pipe6_rbus_pipe6_fmla_no_fwd;          
wire            pipe6_rbus_pipe7_fmla_no_fwd;          
wire    [4 :0]  pipe6_rbus_vfmau_ereg_wb_data;         
wire            pipe6_rbus_vfmau_ereg_wb_vld;          
wire    [63:0]  pipe6_rbus_vfmau_freg_wb_data;         
wire            pipe6_rbus_vfmau_vreg_wb_vld;          
wire    [15:0]  pipe6_vfmau_ex4_fmla_slice0_half0_data; 
wire    [67:0]  pipe6_vfmau_ex5_fmla_slice0_data;      
wire            pipe7_dp_ex1_mult_id;                  
wire    [63:0]  pipe7_dp_ex1_vfalu_mfvr_data;          
wire    [4 :0]  pipe7_dp_ex3_vfalu_ereg_data;          
wire    [63:0]  pipe7_dp_ex3_vfalu_freg_data;          
wire    [4 :0]  pipe7_dp_ex3_vfmau_ereg_data;          
wire    [63:0]  pipe7_dp_ex3_vfmau_freg_data;          
wire    [4 :0]  pipe7_dp_ex4_vfmau_ereg_data;          
wire    [63:0]  pipe7_dp_ex4_vfmau_freg_data;          
wire            pipe7_pipe6_ex4_fmla_fwd_vld;          
wire            pipe7_pipe6_ex5_ex1_fmla_fwd_vld;      
wire            pipe7_pipe6_ex5_ex2_fmla_fwd_vld;      
wire            pipe7_pipe7_ex4_fmla_fwd_vld;          
wire            pipe7_pipe7_ex5_ex1_fmla_fwd_vld;      
wire            pipe7_pipe7_ex5_ex2_fmla_fwd_vld;      
wire            pipe7_rbus_ex1_fmla_data_vld;          
wire            pipe7_rbus_ex1_fmla_data_vld_dup0;     
wire            pipe7_rbus_ex1_fmla_data_vld_dup1;     
wire            pipe7_rbus_ex1_fmla_data_vld_dup2;     
wire            pipe7_rbus_ex2_fmla_data_vld;          
wire            pipe7_rbus_ex2_fmla_data_vld_dup0;     
wire            pipe7_rbus_ex2_fmla_data_vld_dup1;     
wire            pipe7_rbus_ex2_fmla_data_vld_dup2;     
wire            pipe7_rbus_pipe6_fmla_no_fwd;          
wire            pipe7_rbus_pipe7_fmla_no_fwd;          
wire    [4 :0]  pipe7_rbus_vfmau_ereg_wb_data;         
wire            pipe7_rbus_vfmau_ereg_wb_vld;          
wire    [63:0]  pipe7_rbus_vfmau_freg_wb_data;         
wire            pipe7_rbus_vfmau_vreg_wb_vld;          
wire    [15:0]  pipe7_vfmau_ex4_fmla_slice0_half0_data; 
wire    [67:0]  pipe7_vfmau_ex5_fmla_slice0_data;      
wire            rtu_yy_xx_flush;                       
wire    [6 :0]  vdivu_vfpu_ex1_pipe6_dst_vreg;         
wire            vdivu_vfpu_ex1_pipe6_result_vld;       
wire            vdivu_vfpu_pipe6_req_for_bubble;       
wire            vdivu_vfpu_pipe6_vdiv_busy;            
wire    [63:0]  vdsp_vfpu_ex1_pipe6_mfvr_data;         
wire    [63:0]  vdsp_vfpu_ex1_pipe7_mfvr_data;         
wire            vdsp_vfpu_pipe6_inside_fwd_aval;       
wire            vdsp_vfpu_pipe7_inside_fwd_aval;       
wire            vfdsu_dp_fdiv_busy;                    
wire            vfdsu_dp_inst_wb_req;                  
wire            vfdsu_ifu_debug_ex2_wait;              
wire            vfdsu_ifu_debug_idle;                  
wire            vfdsu_ifu_debug_pipe_busy;             
wire            vfpu_idu_ex1_pipe6_data_vld_dup0;      
wire            vfpu_idu_ex1_pipe6_data_vld_dup1;      
wire            vfpu_idu_ex1_pipe6_data_vld_dup2;      
wire            vfpu_idu_ex1_pipe6_data_vld_dup3;      
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup0; 
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup1; 
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup2; 
wire            vfpu_idu_ex1_pipe6_fmla_data_vld_dup3; 
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0; 
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1; 
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2; 
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3; 
wire            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4; 
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dup0;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dup1;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dup2;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dup3;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_preg_dup4;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup0;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup1;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup2;          
wire    [6 :0]  vfpu_idu_ex1_pipe6_vreg_dup3;          
wire            vfpu_idu_ex1_pipe7_data_vld_dup0;      
wire            vfpu_idu_ex1_pipe7_data_vld_dup1;      
wire            vfpu_idu_ex1_pipe7_data_vld_dup2;      
wire            vfpu_idu_ex1_pipe7_data_vld_dup3;      
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup0; 
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup1; 
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup2; 
wire            vfpu_idu_ex1_pipe7_fmla_data_vld_dup3; 
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0; 
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1; 
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2; 
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3; 
wire            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4; 
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dup0;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dup1;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dup2;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dup3;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_preg_dup4;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup0;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup1;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup2;          
wire    [6 :0]  vfpu_idu_ex1_pipe7_vreg_dup3;          
wire            vfpu_idu_ex2_pipe6_data_vld_dup0;      
wire            vfpu_idu_ex2_pipe6_data_vld_dup1;      
wire            vfpu_idu_ex2_pipe6_data_vld_dup2;      
wire            vfpu_idu_ex2_pipe6_data_vld_dup3;      
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup0; 
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup1; 
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup2; 
wire            vfpu_idu_ex2_pipe6_fmla_data_vld_dup3; 
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup0;          
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup1;          
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup2;          
wire    [6 :0]  vfpu_idu_ex2_pipe6_vreg_dup3;          
wire            vfpu_idu_ex2_pipe7_data_vld_dup0;      
wire            vfpu_idu_ex2_pipe7_data_vld_dup1;      
wire            vfpu_idu_ex2_pipe7_data_vld_dup2;      
wire            vfpu_idu_ex2_pipe7_data_vld_dup3;      
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup0; 
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup1; 
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup2; 
wire            vfpu_idu_ex2_pipe7_fmla_data_vld_dup3; 
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup0;          
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup1;          
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup2;          
wire    [6 :0]  vfpu_idu_ex2_pipe7_vreg_dup3;          
wire            vfpu_idu_ex3_pipe6_data_vld_dup0;      
wire            vfpu_idu_ex3_pipe6_data_vld_dup1;      
wire            vfpu_idu_ex3_pipe6_data_vld_dup2;      
wire            vfpu_idu_ex3_pipe6_data_vld_dup3;      
wire    [6 :0]  vfpu_idu_ex3_pipe6_fwd_vreg;           
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;   
wire            vfpu_idu_ex3_pipe6_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data;  
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup0;          
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup1;          
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup2;          
wire    [6 :0]  vfpu_idu_ex3_pipe6_vreg_dup3;          
wire            vfpu_idu_ex3_pipe7_data_vld_dup0;      
wire            vfpu_idu_ex3_pipe7_data_vld_dup1;      
wire            vfpu_idu_ex3_pipe7_data_vld_dup2;      
wire            vfpu_idu_ex3_pipe7_data_vld_dup3;      
wire    [6 :0]  vfpu_idu_ex3_pipe7_fwd_vreg;           
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;   
wire            vfpu_idu_ex3_pipe7_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data;  
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup0;          
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup1;          
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup2;          
wire    [6 :0]  vfpu_idu_ex3_pipe7_vreg_dup3;          
wire    [6 :0]  vfpu_idu_ex4_pipe6_fwd_vreg;           
wire    [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data;   
wire            vfpu_idu_ex4_pipe6_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data;  
wire    [6 :0]  vfpu_idu_ex4_pipe7_fwd_vreg;           
wire    [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data;   
wire            vfpu_idu_ex4_pipe7_fwd_vreg_vld;       
wire    [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data;  
wire    [63:0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data;  
wire    [6 :0]  vfpu_idu_ex5_pipe6_fwd_vreg;           
wire            vfpu_idu_ex5_pipe6_fwd_vreg_vld;       
wire    [4 :0]  vfpu_idu_ex5_pipe6_wb_ereg;            
wire    [5 :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;       
wire            vfpu_idu_ex5_pipe6_wb_ereg_vld;        
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup0;       
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup1;       
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup2;       
wire    [6 :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup3;       
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;    
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand;  
wire            vfpu_idu_ex5_pipe6_wb_vreg_fr_vld;     
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0;   
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1;   
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2;   
wire            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3;   
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;   
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand; 
wire            vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld;    
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;   
wire    [63:0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand; 
wire            vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld;    
wire    [6 :0]  vfpu_idu_ex5_pipe7_fwd_vreg;           
wire            vfpu_idu_ex5_pipe7_fwd_vreg_vld;       
wire    [4 :0]  vfpu_idu_ex5_pipe7_wb_ereg;            
wire    [5 :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;       
wire            vfpu_idu_ex5_pipe7_wb_ereg_vld;        
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup0;       
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup1;       
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup2;       
wire    [6 :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup3;       
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;    
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand;  
wire            vfpu_idu_ex5_pipe7_wb_vreg_fr_vld;     
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0;   
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1;   
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2;   
wire            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3;   
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;   
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand; 
wire            vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld;    
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;   
wire    [63:0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand; 
wire            vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld;    
wire            vfpu_idu_pipe6_vmla_srcv2_no_fwd;      
wire            vfpu_idu_pipe7_vmla_srcv2_no_fwd;      
wire            vfpu_idu_vdiv_busy;                    
wire            vfpu_idu_vdiv_wb_stall;                
wire    [63:0]  vfpu_iu_ex2_pipe6_mfvr_data;           
wire            vfpu_iu_ex2_pipe6_mfvr_data_vld;       
wire    [6 :0]  vfpu_iu_ex2_pipe6_mfvr_preg;           
wire    [63:0]  vfpu_iu_ex2_pipe7_mfvr_data;           
wire            vfpu_iu_ex2_pipe7_mfvr_data_vld;       
wire    [6 :0]  vfpu_iu_ex2_pipe7_mfvr_preg;           
wire            vfpu_rtu_ex5_pipe6_ereg_wb_vld;        
wire    [4 :0]  vfpu_rtu_ex5_pipe6_wb_ereg;            
wire    [63:0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;     
wire            vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld;     
wire            vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld;     
wire            vfpu_rtu_ex5_pipe7_ereg_wb_vld;        
wire    [4 :0]  vfpu_rtu_ex5_pipe7_wb_ereg;            
wire    [63:0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;     
wire            vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld;     
wire            vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld;     
wire            vfpu_rtu_pipe6_cmplt;                  
wire    [6 :0]  vfpu_rtu_pipe6_iid;                    
wire            vfpu_rtu_pipe7_cmplt;                  
wire    [6 :0]  vfpu_rtu_pipe7_iid;                    
wire            vfpu_yy_xx_dqnan;                      
wire    [2 :0]  vfpu_yy_xx_rm;                         


// &Depend("cpu_cfig.h"); @29
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
// &Force("input","iu_vfpu_ex1_pipe0_mtvr_vlmul"); @33
// &Force("input","iu_vfpu_ex1_pipe1_mtvr_vlmul"); @34

// &Force("input","iu_vfpu_ex1_pipe0_mtvr_vsew"); @36
// &Force("input","iu_vfpu_ex1_pipe1_mtvr_vsew"); @37

// &Force("input", "iu_vfpu_ex1_pipe0_mtvr_vl"); @39
// &Force("input", "iu_vfpu_ex1_pipe1_mtvr_vl"); @40

// &Force("input","cp0_vfpu_fcsr"); @42
// &Force("input","cp0_vfpu_vl"); @43

// &Force("input","iu_vfpu_ex2_pipe0_mtvr_vld"); @45
// &Force("input","iu_vfpu_ex2_pipe1_mtvr_vld"); @46

// &Force("bus","iu_vfpu_ex1_pipe0_mtvr_vlmul",1,0); @48
// &Force("bus","iu_vfpu_ex1_pipe1_mtvr_vlmul",1,0); @49

// &Force("bus","iu_vfpu_ex1_pipe0_mtvr_vsew",2,0); @51
// &Force("bus","iu_vfpu_ex1_pipe1_mtvr_vsew",2,0); @52

// &Force("bus", "iu_vfpu_ex1_pipe0_mtvr_vl", 7, 0); @54
// &Force("bus", "iu_vfpu_ex1_pipe1_mtvr_vl", 7, 0); @55

// &Force("bus","cp0_vfpu_fcsr",63,0); @57
// &Force("bus","cp0_vfpu_vl",7,0); @58

//assign vdivu_vfpu_pipe6_gateclk_en       = 1'b0;
assign vdivu_vfpu_ex1_pipe6_dst_vreg[6:0]={7{1'b0}};
assign vdivu_vfpu_ex1_pipe6_result_vld   = 1'b0;
assign vdivu_vfpu_pipe6_req_for_bubble   = 1'b0;
assign vdivu_vfpu_pipe6_vdiv_busy        = 1'b0;

assign vdsp_vfpu_pipe6_inside_fwd_aval   = 1'b0;
assign vdsp_vfpu_pipe7_inside_fwd_aval   = 1'b0;

assign vdsp_vfpu_ex1_pipe6_mfvr_data[63:0] = {64{1'b0}};
assign vdsp_vfpu_ex1_pipe7_mfvr_data[63:0] = {64{1'b0}};
//delete by zhaocj, for timing reason
//assign vfpu_top_clk_en = cp0_yy_clk_en
//                         && (  idu_vfpu_rf_pipe6_gateclk_sel
//                            || iu_vfpu_ex1_pipe0_mtvr_vld
//                            || ctrl_ex1_pipe6_inst_vld
//                            || ctrl_ex2_pipe6_inst_vld
//                            || ctrl_ex3_pipe6_inst_vld
//                            || ctrl_ex4_pipe6_inst_vld
//                            || ctrl_ex5_pipe6_inst_vld
//                            || idu_vfpu_rf_pipe7_gateclk_sel
//                            || iu_vfpu_ex1_pipe1_mtvr_vld
//                            || ctrl_ex1_pipe7_inst_vld
//                            || ctrl_ex2_pipe7_inst_vld
//                            || ctrl_ex3_pipe7_inst_vld
//                            || ctrl_ex4_pipe7_inst_vld
//                            || ctrl_ex5_pipe7_inst_vld
//                            || vfdsu_vfpu_gateclk_en
//                            || vdivu_vfpu_pipe6_gateclk_en
//                            || idu_vfpu_is_vdiv_gateclk_issue
//                            || cp0_vfpu_icg_en);
//&Instance("gated_clk_cell", "x_vfpu_top_gated_clk");
// //&Connect(.clk_in      (top_forever_cpuclk), @95
// //         .external_en (1'b0), @96
// //         .global_en   (1'b1), @97
// //         .module_en   (cp0_vfpu_icg_en), @98
// //         .local_en    (vfpu_top_clk_en), @99
// //         .clk_out     (forever_cpuclk)); @100
//assign forever_cpuclk = top_forever_cpuclk;

//==========================================================
//                       ID Stage
//==========================================================
// &Instance("ct_vfpu_ctrl","x_ct_vfpu_crtl"); @106
ct_vfpu_ctrl  x_ct_vfpu_crtl (
  .cp0_vfpu_icg_en                   (cp0_vfpu_icg_en                  ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .ctrl_dp_ex2_pipe7_inst_vld        (ctrl_dp_ex2_pipe7_inst_vld       ),
  .ctrl_ex1_pipe6_data_vld           (ctrl_ex1_pipe6_data_vld          ),
  .ctrl_ex1_pipe6_data_vld_dup0      (ctrl_ex1_pipe6_data_vld_dup0     ),
  .ctrl_ex1_pipe6_data_vld_dup1      (ctrl_ex1_pipe6_data_vld_dup1     ),
  .ctrl_ex1_pipe6_data_vld_dup2      (ctrl_ex1_pipe6_data_vld_dup2     ),
  .ctrl_ex1_pipe6_eu_sel             (ctrl_ex1_pipe6_eu_sel            ),
  .ctrl_ex1_pipe6_inst_vld           (ctrl_ex1_pipe6_inst_vld          ),
  .ctrl_ex1_pipe6_mfvr_inst_vld      (ctrl_ex1_pipe6_mfvr_inst_vld     ),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup0 (ctrl_ex1_pipe6_mfvr_inst_vld_dup0),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup1 (ctrl_ex1_pipe6_mfvr_inst_vld_dup1),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup2 (ctrl_ex1_pipe6_mfvr_inst_vld_dup2),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup3 (ctrl_ex1_pipe6_mfvr_inst_vld_dup3),
  .ctrl_ex1_pipe7_data_vld           (ctrl_ex1_pipe7_data_vld          ),
  .ctrl_ex1_pipe7_data_vld_dup0      (ctrl_ex1_pipe7_data_vld_dup0     ),
  .ctrl_ex1_pipe7_data_vld_dup1      (ctrl_ex1_pipe7_data_vld_dup1     ),
  .ctrl_ex1_pipe7_data_vld_dup2      (ctrl_ex1_pipe7_data_vld_dup2     ),
  .ctrl_ex1_pipe7_eu_sel             (ctrl_ex1_pipe7_eu_sel            ),
  .ctrl_ex1_pipe7_mfvr_inst_vld      (ctrl_ex1_pipe7_mfvr_inst_vld     ),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup0 (ctrl_ex1_pipe7_mfvr_inst_vld_dup0),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup1 (ctrl_ex1_pipe7_mfvr_inst_vld_dup1),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup2 (ctrl_ex1_pipe7_mfvr_inst_vld_dup2),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup3 (ctrl_ex1_pipe7_mfvr_inst_vld_dup3),
  .ctrl_ex2_pipe6_data_vld           (ctrl_ex2_pipe6_data_vld          ),
  .ctrl_ex2_pipe6_data_vld_dup0      (ctrl_ex2_pipe6_data_vld_dup0     ),
  .ctrl_ex2_pipe6_data_vld_dup1      (ctrl_ex2_pipe6_data_vld_dup1     ),
  .ctrl_ex2_pipe6_data_vld_dup2      (ctrl_ex2_pipe6_data_vld_dup2     ),
  .ctrl_ex2_pipe6_inst_vld           (ctrl_ex2_pipe6_inst_vld          ),
  .ctrl_ex2_pipe6_mfvr_inst_vld      (ctrl_ex2_pipe6_mfvr_inst_vld     ),
  .ctrl_ex2_pipe7_data_vld           (ctrl_ex2_pipe7_data_vld          ),
  .ctrl_ex2_pipe7_data_vld_dup0      (ctrl_ex2_pipe7_data_vld_dup0     ),
  .ctrl_ex2_pipe7_data_vld_dup1      (ctrl_ex2_pipe7_data_vld_dup1     ),
  .ctrl_ex2_pipe7_data_vld_dup2      (ctrl_ex2_pipe7_data_vld_dup2     ),
  .ctrl_ex2_pipe7_inst_vld           (ctrl_ex2_pipe7_inst_vld          ),
  .ctrl_ex2_pipe7_mfvr_inst_vld      (ctrl_ex2_pipe7_mfvr_inst_vld     ),
  .ctrl_ex3_pipe6_data_vld           (ctrl_ex3_pipe6_data_vld          ),
  .ctrl_ex3_pipe6_data_vld_dup0      (ctrl_ex3_pipe6_data_vld_dup0     ),
  .ctrl_ex3_pipe6_data_vld_dup1      (ctrl_ex3_pipe6_data_vld_dup1     ),
  .ctrl_ex3_pipe6_data_vld_dup2      (ctrl_ex3_pipe6_data_vld_dup2     ),
  .ctrl_ex3_pipe6_fwd_vld            (ctrl_ex3_pipe6_fwd_vld           ),
  .ctrl_ex3_pipe6_inst_vld           (ctrl_ex3_pipe6_inst_vld          ),
  .ctrl_ex3_pipe7_data_vld           (ctrl_ex3_pipe7_data_vld          ),
  .ctrl_ex3_pipe7_data_vld_dup0      (ctrl_ex3_pipe7_data_vld_dup0     ),
  .ctrl_ex3_pipe7_data_vld_dup1      (ctrl_ex3_pipe7_data_vld_dup1     ),
  .ctrl_ex3_pipe7_data_vld_dup2      (ctrl_ex3_pipe7_data_vld_dup2     ),
  .ctrl_ex3_pipe7_fwd_vld            (ctrl_ex3_pipe7_fwd_vld           ),
  .ctrl_ex3_pipe7_inst_vld           (ctrl_ex3_pipe7_inst_vld          ),
  .ctrl_ex4_pipe6_fwd_vld            (ctrl_ex4_pipe6_fwd_vld           ),
  .ctrl_ex4_pipe6_inst_vld           (ctrl_ex4_pipe6_inst_vld          ),
  .ctrl_ex4_pipe7_fwd_vld            (ctrl_ex4_pipe7_fwd_vld           ),
  .ctrl_ex4_pipe7_inst_vld           (ctrl_ex4_pipe7_inst_vld          ),
  .ctrl_ex5_pipe6_clk                (ctrl_ex5_pipe6_clk               ),
  .ctrl_ex5_pipe7_clk                (ctrl_ex5_pipe7_clk               ),
  .dp_ctrl_ex1_pipe6_data_vld_pre    (dp_ctrl_ex1_pipe6_data_vld_pre   ),
  .dp_ctrl_ex1_pipe7_data_vld_pre    (dp_ctrl_ex1_pipe7_data_vld_pre   ),
  .dp_ctrl_ex2_pipe6_data_vld_pre    (dp_ctrl_ex2_pipe6_data_vld_pre   ),
  .dp_ctrl_ex2_pipe7_data_vld_pre    (dp_ctrl_ex2_pipe7_data_vld_pre   ),
  .dp_ctrl_ex3_pipe6_data_vld_pre    (dp_ctrl_ex3_pipe6_data_vld_pre   ),
  .dp_ctrl_ex3_pipe6_fwd_vld_pre     (dp_ctrl_ex3_pipe6_fwd_vld_pre    ),
  .dp_ctrl_ex3_pipe7_data_vld_pre    (dp_ctrl_ex3_pipe7_data_vld_pre   ),
  .dp_ctrl_ex3_pipe7_fwd_vld_pre     (dp_ctrl_ex3_pipe7_fwd_vld_pre    ),
  .dp_ctrl_ex4_pipe6_fwd_vld_pre     (dp_ctrl_ex4_pipe6_fwd_vld_pre    ),
  .dp_ctrl_ex4_pipe7_fwd_vld_pre     (dp_ctrl_ex4_pipe7_fwd_vld_pre    ),
  .dp_ctrl_pipe6_vfdsu_inst_vld      (dp_ctrl_pipe6_vfdsu_inst_vld     ),
  .dp_ex1_pipe6_dst_vld_pre          (dp_ex1_pipe6_dst_vld_pre         ),
  .dp_ex1_pipe7_dst_vld_pre          (dp_ex1_pipe7_dst_vld_pre         ),
  .dp_vfmau_rf_pipe6_sel             (dp_vfmau_rf_pipe6_sel            ),
  .dp_vfmau_rf_pipe7_sel             (dp_vfmau_rf_pipe7_sel            ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .idu_vfpu_rf_pipe6_eu_sel          (idu_vfpu_rf_pipe6_eu_sel         ),
  .idu_vfpu_rf_pipe6_gateclk_sel     (idu_vfpu_rf_pipe6_gateclk_sel    ),
  .idu_vfpu_rf_pipe6_sel             (idu_vfpu_rf_pipe6_sel            ),
  .idu_vfpu_rf_pipe7_eu_sel          (idu_vfpu_rf_pipe7_eu_sel         ),
  .idu_vfpu_rf_pipe7_gateclk_sel     (idu_vfpu_rf_pipe7_gateclk_sel    ),
  .idu_vfpu_rf_pipe7_sel             (idu_vfpu_rf_pipe7_sel            ),
  .iu_vfpu_ex1_pipe0_mtvr_inst       (iu_vfpu_ex1_pipe0_mtvr_inst      ),
  .iu_vfpu_ex1_pipe0_mtvr_vld        (iu_vfpu_ex1_pipe0_mtvr_vld       ),
  .iu_vfpu_ex1_pipe1_mtvr_inst       (iu_vfpu_ex1_pipe1_mtvr_inst      ),
  .iu_vfpu_ex1_pipe1_mtvr_vld        (iu_vfpu_ex1_pipe1_mtvr_vld       ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pipe6_dp_vfdsu_inst_vld           (pipe6_dp_vfdsu_inst_vld          ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .vdivu_vfpu_ex1_pipe6_result_vld   (vdivu_vfpu_ex1_pipe6_result_vld  )
);

// &Instance("ct_vfpu_dp","x_ct_vfpu_dp"); @107
ct_vfpu_dp  x_ct_vfpu_dp (
  .cp0_vfpu_fxcr                         (cp0_vfpu_fxcr                        ),
  .cp0_vfpu_icg_en                       (cp0_vfpu_icg_en                      ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_ex2_pipe7_inst_vld            (ctrl_dp_ex2_pipe7_inst_vld           ),
  .ctrl_ex1_pipe6_eu_sel                 (ctrl_ex1_pipe6_eu_sel                ),
  .ctrl_ex1_pipe6_inst_vld               (ctrl_ex1_pipe6_inst_vld              ),
  .ctrl_ex1_pipe6_mfvr_inst_vld          (ctrl_ex1_pipe6_mfvr_inst_vld         ),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup0     (ctrl_ex1_pipe6_mfvr_inst_vld_dup0    ),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup1     (ctrl_ex1_pipe6_mfvr_inst_vld_dup1    ),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup2     (ctrl_ex1_pipe6_mfvr_inst_vld_dup2    ),
  .ctrl_ex1_pipe6_mfvr_inst_vld_dup3     (ctrl_ex1_pipe6_mfvr_inst_vld_dup3    ),
  .ctrl_ex1_pipe7_eu_sel                 (ctrl_ex1_pipe7_eu_sel                ),
  .ctrl_ex1_pipe7_mfvr_inst_vld          (ctrl_ex1_pipe7_mfvr_inst_vld         ),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup0     (ctrl_ex1_pipe7_mfvr_inst_vld_dup0    ),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup1     (ctrl_ex1_pipe7_mfvr_inst_vld_dup1    ),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup2     (ctrl_ex1_pipe7_mfvr_inst_vld_dup2    ),
  .ctrl_ex1_pipe7_mfvr_inst_vld_dup3     (ctrl_ex1_pipe7_mfvr_inst_vld_dup3    ),
  .ctrl_ex2_pipe6_inst_vld               (ctrl_ex2_pipe6_inst_vld              ),
  .ctrl_ex2_pipe6_mfvr_inst_vld          (ctrl_ex2_pipe6_mfvr_inst_vld         ),
  .ctrl_ex2_pipe7_inst_vld               (ctrl_ex2_pipe7_inst_vld              ),
  .ctrl_ex2_pipe7_mfvr_inst_vld          (ctrl_ex2_pipe7_mfvr_inst_vld         ),
  .ctrl_ex3_pipe6_inst_vld               (ctrl_ex3_pipe6_inst_vld              ),
  .ctrl_ex3_pipe7_inst_vld               (ctrl_ex3_pipe7_inst_vld              ),
  .ctrl_ex4_pipe6_inst_vld               (ctrl_ex4_pipe6_inst_vld              ),
  .dp_ctrl_ex1_pipe6_data_vld_pre        (dp_ctrl_ex1_pipe6_data_vld_pre       ),
  .dp_ctrl_ex1_pipe7_data_vld_pre        (dp_ctrl_ex1_pipe7_data_vld_pre       ),
  .dp_ctrl_ex2_pipe6_data_vld_pre        (dp_ctrl_ex2_pipe6_data_vld_pre       ),
  .dp_ctrl_ex2_pipe7_data_vld_pre        (dp_ctrl_ex2_pipe7_data_vld_pre       ),
  .dp_ctrl_ex3_pipe6_data_vld_pre        (dp_ctrl_ex3_pipe6_data_vld_pre       ),
  .dp_ctrl_ex3_pipe6_fwd_vld_pre         (dp_ctrl_ex3_pipe6_fwd_vld_pre        ),
  .dp_ctrl_ex3_pipe7_data_vld_pre        (dp_ctrl_ex3_pipe7_data_vld_pre       ),
  .dp_ctrl_ex3_pipe7_fwd_vld_pre         (dp_ctrl_ex3_pipe7_fwd_vld_pre        ),
  .dp_ctrl_ex4_pipe6_fwd_vld_pre         (dp_ctrl_ex4_pipe6_fwd_vld_pre        ),
  .dp_ctrl_ex4_pipe7_fwd_vld_pre         (dp_ctrl_ex4_pipe7_fwd_vld_pre        ),
  .dp_ctrl_pipe6_vfdsu_inst_vld          (dp_ctrl_pipe6_vfdsu_inst_vld         ),
  .dp_ex1_pipe6_dst_vld_pre              (dp_ex1_pipe6_dst_vld_pre             ),
  .dp_ex1_pipe7_dst_vld_pre              (dp_ex1_pipe7_dst_vld_pre             ),
  .dp_ex3_pipe6_dst_vreg                 (dp_ex3_pipe6_dst_vreg                ),
  .dp_ex3_pipe6_freg_data                (dp_ex3_pipe6_freg_data               ),
  .dp_ex3_pipe7_dst_vreg                 (dp_ex3_pipe7_dst_vreg                ),
  .dp_ex3_pipe7_freg_data                (dp_ex3_pipe7_freg_data               ),
  .dp_ex4_pipe6_dst_ereg                 (dp_ex4_pipe6_dst_ereg                ),
  .dp_ex4_pipe6_dst_vreg                 (dp_ex4_pipe6_dst_vreg                ),
  .dp_ex4_pipe6_normal_dste_wb_vld       (dp_ex4_pipe6_normal_dste_wb_vld      ),
  .dp_ex4_pipe6_normal_dstv_wb_vld       (dp_ex4_pipe6_normal_dstv_wb_vld      ),
  .dp_ex4_pipe7_dst_ereg                 (dp_ex4_pipe7_dst_ereg                ),
  .dp_ex4_pipe7_dst_vreg                 (dp_ex4_pipe7_dst_vreg                ),
  .dp_ex4_pipe7_dste_vld                 (dp_ex4_pipe7_dste_vld                ),
  .dp_ex4_pipe7_dstv_vld                 (dp_ex4_pipe7_dstv_vld                ),
  .dp_ex5_pipe6_ereg_data_pre            (dp_ex5_pipe6_ereg_data_pre           ),
  .dp_ex5_pipe6_freg_data_pre            (dp_ex5_pipe6_freg_data_pre           ),
  .dp_ex5_pipe7_ereg_data_pre            (dp_ex5_pipe7_ereg_data_pre           ),
  .dp_ex5_pipe7_freg_data_pre            (dp_ex5_pipe7_freg_data_pre           ),
  .dp_rbus_pipe6_ex1_vreg                (dp_rbus_pipe6_ex1_vreg               ),
  .dp_rbus_pipe6_ex1_vreg_dup0           (dp_rbus_pipe6_ex1_vreg_dup0          ),
  .dp_rbus_pipe6_ex1_vreg_dup1           (dp_rbus_pipe6_ex1_vreg_dup1          ),
  .dp_rbus_pipe6_ex1_vreg_dup2           (dp_rbus_pipe6_ex1_vreg_dup2          ),
  .dp_rbus_pipe6_ex2_vreg                (dp_rbus_pipe6_ex2_vreg               ),
  .dp_rbus_pipe6_ex2_vreg_dup0           (dp_rbus_pipe6_ex2_vreg_dup0          ),
  .dp_rbus_pipe6_ex2_vreg_dup1           (dp_rbus_pipe6_ex2_vreg_dup1          ),
  .dp_rbus_pipe6_ex2_vreg_dup2           (dp_rbus_pipe6_ex2_vreg_dup2          ),
  .dp_rbus_pipe6_ex3_vreg_dup0           (dp_rbus_pipe6_ex3_vreg_dup0          ),
  .dp_rbus_pipe6_ex3_vreg_dup1           (dp_rbus_pipe6_ex3_vreg_dup1          ),
  .dp_rbus_pipe6_ex3_vreg_dup2           (dp_rbus_pipe6_ex3_vreg_dup2          ),
  .dp_rbus_pipe6_ex3_vreg_dup3           (dp_rbus_pipe6_ex3_vreg_dup3          ),
  .dp_rbus_pipe7_ex1_vreg                (dp_rbus_pipe7_ex1_vreg               ),
  .dp_rbus_pipe7_ex1_vreg_dup0           (dp_rbus_pipe7_ex1_vreg_dup0          ),
  .dp_rbus_pipe7_ex1_vreg_dup1           (dp_rbus_pipe7_ex1_vreg_dup1          ),
  .dp_rbus_pipe7_ex1_vreg_dup2           (dp_rbus_pipe7_ex1_vreg_dup2          ),
  .dp_rbus_pipe7_ex2_vreg                (dp_rbus_pipe7_ex2_vreg               ),
  .dp_rbus_pipe7_ex2_vreg_dup0           (dp_rbus_pipe7_ex2_vreg_dup0          ),
  .dp_rbus_pipe7_ex2_vreg_dup1           (dp_rbus_pipe7_ex2_vreg_dup1          ),
  .dp_rbus_pipe7_ex2_vreg_dup2           (dp_rbus_pipe7_ex2_vreg_dup2          ),
  .dp_rbus_pipe7_ex3_vreg_dup0           (dp_rbus_pipe7_ex3_vreg_dup0          ),
  .dp_rbus_pipe7_ex3_vreg_dup1           (dp_rbus_pipe7_ex3_vreg_dup1          ),
  .dp_rbus_pipe7_ex3_vreg_dup2           (dp_rbus_pipe7_ex3_vreg_dup2          ),
  .dp_rbus_pipe7_ex3_vreg_dup3           (dp_rbus_pipe7_ex3_vreg_dup3          ),
  .dp_vfalu_ex1_pipe6_func               (dp_vfalu_ex1_pipe6_func              ),
  .dp_vfalu_ex1_pipe6_imm0               (dp_vfalu_ex1_pipe6_imm0              ),
  .dp_vfalu_ex1_pipe6_mtvr_src0          (dp_vfalu_ex1_pipe6_mtvr_src0         ),
  .dp_vfalu_ex1_pipe6_sel                (dp_vfalu_ex1_pipe6_sel               ),
  .dp_vfalu_ex1_pipe6_srcf0              (dp_vfalu_ex1_pipe6_srcf0             ),
  .dp_vfalu_ex1_pipe6_srcf1              (dp_vfalu_ex1_pipe6_srcf1             ),
  .dp_vfalu_ex1_pipe7_func               (dp_vfalu_ex1_pipe7_func              ),
  .dp_vfalu_ex1_pipe7_imm0               (dp_vfalu_ex1_pipe7_imm0              ),
  .dp_vfalu_ex1_pipe7_mtvr_src0          (dp_vfalu_ex1_pipe7_mtvr_src0         ),
  .dp_vfalu_ex1_pipe7_sel                (dp_vfalu_ex1_pipe7_sel               ),
  .dp_vfalu_ex1_pipe7_srcf0              (dp_vfalu_ex1_pipe7_srcf0             ),
  .dp_vfalu_ex1_pipe7_srcf1              (dp_vfalu_ex1_pipe7_srcf1             ),
  .dp_vfdsu_ex1_pipe6_dst_ereg           (dp_vfdsu_ex1_pipe6_dst_ereg          ),
  .dp_vfdsu_ex1_pipe6_dst_vreg           (dp_vfdsu_ex1_pipe6_dst_vreg          ),
  .dp_vfdsu_ex1_pipe6_iid                (dp_vfdsu_ex1_pipe6_iid               ),
  .dp_vfdsu_ex1_pipe6_imm0               (dp_vfdsu_ex1_pipe6_imm0              ),
  .dp_vfdsu_ex1_pipe6_sel                (dp_vfdsu_ex1_pipe6_sel               ),
  .dp_vfdsu_ex1_pipe6_srcf0              (dp_vfdsu_ex1_pipe6_srcf0             ),
  .dp_vfdsu_ex1_pipe6_srcf1              (dp_vfdsu_ex1_pipe6_srcf1             ),
  .dp_vfdsu_fdiv_gateclk_issue           (dp_vfdsu_fdiv_gateclk_issue          ),
  .dp_vfdsu_idu_fdiv_issue               (dp_vfdsu_idu_fdiv_issue              ),
  .dp_vfmau_ex1_pipe6_dst_vreg           (dp_vfmau_ex1_pipe6_dst_vreg          ),
  .dp_vfmau_ex1_pipe6_imm0               (dp_vfmau_ex1_pipe6_imm0              ),
  .dp_vfmau_ex1_pipe6_sel                (dp_vfmau_ex1_pipe6_sel               ),
  .dp_vfmau_ex1_pipe7_dst_vreg           (dp_vfmau_ex1_pipe7_dst_vreg          ),
  .dp_vfmau_ex1_pipe7_imm0               (dp_vfmau_ex1_pipe7_imm0              ),
  .dp_vfmau_ex1_pipe7_sel                (dp_vfmau_ex1_pipe7_sel               ),
  .dp_vfmau_pipe6_inst_type              (dp_vfmau_pipe6_inst_type             ),
  .dp_vfmau_pipe6_mla_srcv2_vld          (dp_vfmau_pipe6_mla_srcv2_vld         ),
  .dp_vfmau_pipe6_mla_srcv2_vreg         (dp_vfmau_pipe6_mla_srcv2_vreg        ),
  .dp_vfmau_pipe6_mla_type               (dp_vfmau_pipe6_mla_type              ),
  .dp_vfmau_pipe6_sel                    (dp_vfmau_pipe6_sel                   ),
  .dp_vfmau_pipe6_vfmau_sel              (dp_vfmau_pipe6_vfmau_sel             ),
  .dp_vfmau_pipe7_inst_type              (dp_vfmau_pipe7_inst_type             ),
  .dp_vfmau_pipe7_mla_srcv2_vld          (dp_vfmau_pipe7_mla_srcv2_vld         ),
  .dp_vfmau_pipe7_mla_srcv2_vreg         (dp_vfmau_pipe7_mla_srcv2_vreg        ),
  .dp_vfmau_pipe7_mla_type               (dp_vfmau_pipe7_mla_type              ),
  .dp_vfmau_pipe7_sel                    (dp_vfmau_pipe7_sel                   ),
  .dp_vfmau_pipe7_vfmau_sel              (dp_vfmau_pipe7_vfmau_sel             ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .idu_vfpu_is_vdiv_gateclk_issue        (idu_vfpu_is_vdiv_gateclk_issue       ),
  .idu_vfpu_is_vdiv_issue                (idu_vfpu_is_vdiv_issue               ),
  .idu_vfpu_rf_pipe6_dst_ereg            (idu_vfpu_rf_pipe6_dst_ereg           ),
  .idu_vfpu_rf_pipe6_dst_preg            (idu_vfpu_rf_pipe6_dst_preg           ),
  .idu_vfpu_rf_pipe6_dst_vld             (idu_vfpu_rf_pipe6_dst_vld            ),
  .idu_vfpu_rf_pipe6_dst_vreg            (idu_vfpu_rf_pipe6_dst_vreg           ),
  .idu_vfpu_rf_pipe6_dste_vld            (idu_vfpu_rf_pipe6_dste_vld           ),
  .idu_vfpu_rf_pipe6_dstv_vld            (idu_vfpu_rf_pipe6_dstv_vld           ),
  .idu_vfpu_rf_pipe6_eu_sel              (idu_vfpu_rf_pipe6_eu_sel             ),
  .idu_vfpu_rf_pipe6_func                (idu_vfpu_rf_pipe6_func               ),
  .idu_vfpu_rf_pipe6_gateclk_sel         (idu_vfpu_rf_pipe6_gateclk_sel        ),
  .idu_vfpu_rf_pipe6_iid                 (idu_vfpu_rf_pipe6_iid                ),
  .idu_vfpu_rf_pipe6_imm0                (idu_vfpu_rf_pipe6_imm0               ),
  .idu_vfpu_rf_pipe6_inst_type           (idu_vfpu_rf_pipe6_inst_type          ),
  .idu_vfpu_rf_pipe6_mla_srcv2_vld       (idu_vfpu_rf_pipe6_mla_srcv2_vld      ),
  .idu_vfpu_rf_pipe6_mla_srcv2_vreg      (idu_vfpu_rf_pipe6_mla_srcv2_vreg     ),
  .idu_vfpu_rf_pipe6_ready_stage         (idu_vfpu_rf_pipe6_ready_stage        ),
  .idu_vfpu_rf_pipe6_srcv0_fr            (idu_vfpu_rf_pipe6_srcv0_fr           ),
  .idu_vfpu_rf_pipe6_srcv1_fr            (idu_vfpu_rf_pipe6_srcv1_fr           ),
  .idu_vfpu_rf_pipe6_vmla_type           (idu_vfpu_rf_pipe6_vmla_type          ),
  .idu_vfpu_rf_pipe7_dst_ereg            (idu_vfpu_rf_pipe7_dst_ereg           ),
  .idu_vfpu_rf_pipe7_dst_preg            (idu_vfpu_rf_pipe7_dst_preg           ),
  .idu_vfpu_rf_pipe7_dst_vld             (idu_vfpu_rf_pipe7_dst_vld            ),
  .idu_vfpu_rf_pipe7_dst_vreg            (idu_vfpu_rf_pipe7_dst_vreg           ),
  .idu_vfpu_rf_pipe7_dste_vld            (idu_vfpu_rf_pipe7_dste_vld           ),
  .idu_vfpu_rf_pipe7_dstv_vld            (idu_vfpu_rf_pipe7_dstv_vld           ),
  .idu_vfpu_rf_pipe7_eu_sel              (idu_vfpu_rf_pipe7_eu_sel             ),
  .idu_vfpu_rf_pipe7_func                (idu_vfpu_rf_pipe7_func               ),
  .idu_vfpu_rf_pipe7_gateclk_sel         (idu_vfpu_rf_pipe7_gateclk_sel        ),
  .idu_vfpu_rf_pipe7_imm0                (idu_vfpu_rf_pipe7_imm0               ),
  .idu_vfpu_rf_pipe7_inst_type           (idu_vfpu_rf_pipe7_inst_type          ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vld       (idu_vfpu_rf_pipe7_mla_srcv2_vld      ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vreg      (idu_vfpu_rf_pipe7_mla_srcv2_vreg     ),
  .idu_vfpu_rf_pipe7_ready_stage         (idu_vfpu_rf_pipe7_ready_stage        ),
  .idu_vfpu_rf_pipe7_srcv0_fr            (idu_vfpu_rf_pipe7_srcv0_fr           ),
  .idu_vfpu_rf_pipe7_srcv1_fr            (idu_vfpu_rf_pipe7_srcv1_fr           ),
  .idu_vfpu_rf_pipe7_vmla_type           (idu_vfpu_rf_pipe7_vmla_type          ),
  .iu_vfpu_ex1_pipe0_mtvr_inst           (iu_vfpu_ex1_pipe0_mtvr_inst          ),
  .iu_vfpu_ex1_pipe0_mtvr_vld            (iu_vfpu_ex1_pipe0_mtvr_vld           ),
  .iu_vfpu_ex1_pipe0_mtvr_vreg           (iu_vfpu_ex1_pipe0_mtvr_vreg          ),
  .iu_vfpu_ex1_pipe1_mtvr_inst           (iu_vfpu_ex1_pipe1_mtvr_inst          ),
  .iu_vfpu_ex1_pipe1_mtvr_vld            (iu_vfpu_ex1_pipe1_mtvr_vld           ),
  .iu_vfpu_ex1_pipe1_mtvr_vreg           (iu_vfpu_ex1_pipe1_mtvr_vreg          ),
  .iu_vfpu_ex2_pipe0_mtvr_src0           (iu_vfpu_ex2_pipe0_mtvr_src0          ),
  .iu_vfpu_ex2_pipe1_mtvr_src0           (iu_vfpu_ex2_pipe1_mtvr_src0          ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pipe6_dp_ex1_mult_id                  (pipe6_dp_ex1_mult_id                 ),
  .pipe6_dp_ex1_vfalu_mfvr_data          (pipe6_dp_ex1_vfalu_mfvr_data         ),
  .pipe6_dp_ex3_vfalu_ereg_data          (pipe6_dp_ex3_vfalu_ereg_data         ),
  .pipe6_dp_ex3_vfalu_freg_data          (pipe6_dp_ex3_vfalu_freg_data         ),
  .pipe6_dp_ex3_vfmau_ereg_data          (pipe6_dp_ex3_vfmau_ereg_data         ),
  .pipe6_dp_ex3_vfmau_freg_data          (pipe6_dp_ex3_vfmau_freg_data         ),
  .pipe6_dp_ex4_vfmau_ereg_data          (pipe6_dp_ex4_vfmau_ereg_data         ),
  .pipe6_dp_ex4_vfmau_freg_data          (pipe6_dp_ex4_vfmau_freg_data         ),
  .pipe6_dp_vfdsu_ereg                   (pipe6_dp_vfdsu_ereg                  ),
  .pipe6_dp_vfdsu_ereg_data              (pipe6_dp_vfdsu_ereg_data             ),
  .pipe6_dp_vfdsu_freg_data              (pipe6_dp_vfdsu_freg_data             ),
  .pipe6_dp_vfdsu_inst_vld               (pipe6_dp_vfdsu_inst_vld              ),
  .pipe6_dp_vfdsu_vreg                   (pipe6_dp_vfdsu_vreg                  ),
  .pipe7_dp_ex1_mult_id                  (pipe7_dp_ex1_mult_id                 ),
  .pipe7_dp_ex1_vfalu_mfvr_data          (pipe7_dp_ex1_vfalu_mfvr_data         ),
  .pipe7_dp_ex3_vfalu_ereg_data          (pipe7_dp_ex3_vfalu_ereg_data         ),
  .pipe7_dp_ex3_vfalu_freg_data          (pipe7_dp_ex3_vfalu_freg_data         ),
  .pipe7_dp_ex3_vfmau_ereg_data          (pipe7_dp_ex3_vfmau_ereg_data         ),
  .pipe7_dp_ex3_vfmau_freg_data          (pipe7_dp_ex3_vfmau_freg_data         ),
  .pipe7_dp_ex4_vfmau_ereg_data          (pipe7_dp_ex4_vfmau_ereg_data         ),
  .pipe7_dp_ex4_vfmau_freg_data          (pipe7_dp_ex4_vfmau_freg_data         ),
  .vdivu_vfpu_ex1_pipe6_dst_vreg         (vdivu_vfpu_ex1_pipe6_dst_vreg        ),
  .vdivu_vfpu_ex1_pipe6_result_vld       (vdivu_vfpu_ex1_pipe6_result_vld      ),
  .vdivu_vfpu_pipe6_req_for_bubble       (vdivu_vfpu_pipe6_req_for_bubble      ),
  .vdivu_vfpu_pipe6_vdiv_busy            (vdivu_vfpu_pipe6_vdiv_busy           ),
  .vdsp_vfpu_ex1_pipe6_mfvr_data         (vdsp_vfpu_ex1_pipe6_mfvr_data        ),
  .vdsp_vfpu_ex1_pipe7_mfvr_data         (vdsp_vfpu_ex1_pipe7_mfvr_data        ),
  .vfdsu_dp_fdiv_busy                    (vfdsu_dp_fdiv_busy                   ),
  .vfdsu_dp_inst_wb_req                  (vfdsu_dp_inst_wb_req                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0 (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1 (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2 (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3 (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4 (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4),
  .vfpu_idu_ex1_pipe6_preg_dup0          (vfpu_idu_ex1_pipe6_preg_dup0         ),
  .vfpu_idu_ex1_pipe6_preg_dup1          (vfpu_idu_ex1_pipe6_preg_dup1         ),
  .vfpu_idu_ex1_pipe6_preg_dup2          (vfpu_idu_ex1_pipe6_preg_dup2         ),
  .vfpu_idu_ex1_pipe6_preg_dup3          (vfpu_idu_ex1_pipe6_preg_dup3         ),
  .vfpu_idu_ex1_pipe6_preg_dup4          (vfpu_idu_ex1_pipe6_preg_dup4         ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0 (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1 (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2 (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3 (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4 (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4),
  .vfpu_idu_ex1_pipe7_preg_dup0          (vfpu_idu_ex1_pipe7_preg_dup0         ),
  .vfpu_idu_ex1_pipe7_preg_dup1          (vfpu_idu_ex1_pipe7_preg_dup1         ),
  .vfpu_idu_ex1_pipe7_preg_dup2          (vfpu_idu_ex1_pipe7_preg_dup2         ),
  .vfpu_idu_ex1_pipe7_preg_dup3          (vfpu_idu_ex1_pipe7_preg_dup3         ),
  .vfpu_idu_ex1_pipe7_preg_dup4          (vfpu_idu_ex1_pipe7_preg_dup4         ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .vfpu_idu_vdiv_wb_stall                (vfpu_idu_vdiv_wb_stall               ),
  .vfpu_iu_ex2_pipe6_mfvr_data           (vfpu_iu_ex2_pipe6_mfvr_data          ),
  .vfpu_iu_ex2_pipe6_mfvr_data_vld       (vfpu_iu_ex2_pipe6_mfvr_data_vld      ),
  .vfpu_iu_ex2_pipe6_mfvr_preg           (vfpu_iu_ex2_pipe6_mfvr_preg          ),
  .vfpu_iu_ex2_pipe7_mfvr_data           (vfpu_iu_ex2_pipe7_mfvr_data          ),
  .vfpu_iu_ex2_pipe7_mfvr_data_vld       (vfpu_iu_ex2_pipe7_mfvr_data_vld      ),
  .vfpu_iu_ex2_pipe7_mfvr_preg           (vfpu_iu_ex2_pipe7_mfvr_preg          ),
  .vfpu_yy_xx_dqnan                      (vfpu_yy_xx_dqnan                     ),
  .vfpu_yy_xx_rm                         (vfpu_yy_xx_rm                        )
);

// &Instance("ct_vfpu_cbus","x_ct_vfpu_cbus"); @108
ct_vfpu_cbus  x_ct_vfpu_cbus (
  .cp0_vfpu_icg_en               (cp0_vfpu_icg_en              ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .idu_vfpu_rf_pipe6_gateclk_sel (idu_vfpu_rf_pipe6_gateclk_sel),
  .idu_vfpu_rf_pipe6_iid         (idu_vfpu_rf_pipe6_iid        ),
  .idu_vfpu_rf_pipe6_sel         (idu_vfpu_rf_pipe6_sel        ),
  .idu_vfpu_rf_pipe7_gateclk_sel (idu_vfpu_rf_pipe7_gateclk_sel),
  .idu_vfpu_rf_pipe7_iid         (idu_vfpu_rf_pipe7_iid        ),
  .idu_vfpu_rf_pipe7_sel         (idu_vfpu_rf_pipe7_sel        ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_yy_xx_flush               (rtu_yy_xx_flush              ),
  .vfpu_rtu_pipe6_cmplt          (vfpu_rtu_pipe6_cmplt         ),
  .vfpu_rtu_pipe6_iid            (vfpu_rtu_pipe6_iid           ),
  .vfpu_rtu_pipe7_cmplt          (vfpu_rtu_pipe7_cmplt         ),
  .vfpu_rtu_pipe7_iid            (vfpu_rtu_pipe7_iid           )
);

// &Instance("ct_vfpu_rbus","x_ct_vfpu_rbus"); @109
ct_vfpu_rbus  x_ct_vfpu_rbus (
  .cp0_vfpu_icg_en                       (cp0_vfpu_icg_en                      ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_ex1_pipe6_data_vld               (ctrl_ex1_pipe6_data_vld              ),
  .ctrl_ex1_pipe6_data_vld_dup0          (ctrl_ex1_pipe6_data_vld_dup0         ),
  .ctrl_ex1_pipe6_data_vld_dup1          (ctrl_ex1_pipe6_data_vld_dup1         ),
  .ctrl_ex1_pipe6_data_vld_dup2          (ctrl_ex1_pipe6_data_vld_dup2         ),
  .ctrl_ex1_pipe7_data_vld               (ctrl_ex1_pipe7_data_vld              ),
  .ctrl_ex1_pipe7_data_vld_dup0          (ctrl_ex1_pipe7_data_vld_dup0         ),
  .ctrl_ex1_pipe7_data_vld_dup1          (ctrl_ex1_pipe7_data_vld_dup1         ),
  .ctrl_ex1_pipe7_data_vld_dup2          (ctrl_ex1_pipe7_data_vld_dup2         ),
  .ctrl_ex2_pipe6_data_vld               (ctrl_ex2_pipe6_data_vld              ),
  .ctrl_ex2_pipe6_data_vld_dup0          (ctrl_ex2_pipe6_data_vld_dup0         ),
  .ctrl_ex2_pipe6_data_vld_dup1          (ctrl_ex2_pipe6_data_vld_dup1         ),
  .ctrl_ex2_pipe6_data_vld_dup2          (ctrl_ex2_pipe6_data_vld_dup2         ),
  .ctrl_ex2_pipe7_data_vld               (ctrl_ex2_pipe7_data_vld              ),
  .ctrl_ex2_pipe7_data_vld_dup0          (ctrl_ex2_pipe7_data_vld_dup0         ),
  .ctrl_ex2_pipe7_data_vld_dup1          (ctrl_ex2_pipe7_data_vld_dup1         ),
  .ctrl_ex2_pipe7_data_vld_dup2          (ctrl_ex2_pipe7_data_vld_dup2         ),
  .ctrl_ex3_pipe6_data_vld               (ctrl_ex3_pipe6_data_vld              ),
  .ctrl_ex3_pipe6_data_vld_dup0          (ctrl_ex3_pipe6_data_vld_dup0         ),
  .ctrl_ex3_pipe6_data_vld_dup1          (ctrl_ex3_pipe6_data_vld_dup1         ),
  .ctrl_ex3_pipe6_data_vld_dup2          (ctrl_ex3_pipe6_data_vld_dup2         ),
  .ctrl_ex3_pipe6_fwd_vld                (ctrl_ex3_pipe6_fwd_vld               ),
  .ctrl_ex3_pipe7_data_vld               (ctrl_ex3_pipe7_data_vld              ),
  .ctrl_ex3_pipe7_data_vld_dup0          (ctrl_ex3_pipe7_data_vld_dup0         ),
  .ctrl_ex3_pipe7_data_vld_dup1          (ctrl_ex3_pipe7_data_vld_dup1         ),
  .ctrl_ex3_pipe7_data_vld_dup2          (ctrl_ex3_pipe7_data_vld_dup2         ),
  .ctrl_ex3_pipe7_fwd_vld                (ctrl_ex3_pipe7_fwd_vld               ),
  .ctrl_ex4_pipe6_fwd_vld                (ctrl_ex4_pipe6_fwd_vld               ),
  .ctrl_ex4_pipe7_fwd_vld                (ctrl_ex4_pipe7_fwd_vld               ),
  .ctrl_ex4_pipe7_inst_vld               (ctrl_ex4_pipe7_inst_vld              ),
  .ctrl_ex5_pipe6_clk                    (ctrl_ex5_pipe6_clk                   ),
  .ctrl_ex5_pipe7_clk                    (ctrl_ex5_pipe7_clk                   ),
  .dp_ex3_pipe6_dst_vreg                 (dp_ex3_pipe6_dst_vreg                ),
  .dp_ex3_pipe6_freg_data                (dp_ex3_pipe6_freg_data               ),
  .dp_ex3_pipe7_dst_vreg                 (dp_ex3_pipe7_dst_vreg                ),
  .dp_ex3_pipe7_freg_data                (dp_ex3_pipe7_freg_data               ),
  .dp_ex4_pipe6_dst_ereg                 (dp_ex4_pipe6_dst_ereg                ),
  .dp_ex4_pipe6_dst_vreg                 (dp_ex4_pipe6_dst_vreg                ),
  .dp_ex4_pipe6_normal_dste_wb_vld       (dp_ex4_pipe6_normal_dste_wb_vld      ),
  .dp_ex4_pipe6_normal_dstv_wb_vld       (dp_ex4_pipe6_normal_dstv_wb_vld      ),
  .dp_ex4_pipe7_dst_ereg                 (dp_ex4_pipe7_dst_ereg                ),
  .dp_ex4_pipe7_dst_vreg                 (dp_ex4_pipe7_dst_vreg                ),
  .dp_ex4_pipe7_dste_vld                 (dp_ex4_pipe7_dste_vld                ),
  .dp_ex4_pipe7_dstv_vld                 (dp_ex4_pipe7_dstv_vld                ),
  .dp_ex5_pipe6_ereg_data_pre            (dp_ex5_pipe6_ereg_data_pre           ),
  .dp_ex5_pipe6_freg_data_pre            (dp_ex5_pipe6_freg_data_pre           ),
  .dp_ex5_pipe7_ereg_data_pre            (dp_ex5_pipe7_ereg_data_pre           ),
  .dp_ex5_pipe7_freg_data_pre            (dp_ex5_pipe7_freg_data_pre           ),
  .dp_rbus_pipe6_ex1_vreg                (dp_rbus_pipe6_ex1_vreg               ),
  .dp_rbus_pipe6_ex1_vreg_dup0           (dp_rbus_pipe6_ex1_vreg_dup0          ),
  .dp_rbus_pipe6_ex1_vreg_dup1           (dp_rbus_pipe6_ex1_vreg_dup1          ),
  .dp_rbus_pipe6_ex1_vreg_dup2           (dp_rbus_pipe6_ex1_vreg_dup2          ),
  .dp_rbus_pipe6_ex2_vreg                (dp_rbus_pipe6_ex2_vreg               ),
  .dp_rbus_pipe6_ex2_vreg_dup0           (dp_rbus_pipe6_ex2_vreg_dup0          ),
  .dp_rbus_pipe6_ex2_vreg_dup1           (dp_rbus_pipe6_ex2_vreg_dup1          ),
  .dp_rbus_pipe6_ex2_vreg_dup2           (dp_rbus_pipe6_ex2_vreg_dup2          ),
  .dp_rbus_pipe6_ex3_vreg_dup0           (dp_rbus_pipe6_ex3_vreg_dup0          ),
  .dp_rbus_pipe6_ex3_vreg_dup1           (dp_rbus_pipe6_ex3_vreg_dup1          ),
  .dp_rbus_pipe6_ex3_vreg_dup2           (dp_rbus_pipe6_ex3_vreg_dup2          ),
  .dp_rbus_pipe6_ex3_vreg_dup3           (dp_rbus_pipe6_ex3_vreg_dup3          ),
  .dp_rbus_pipe7_ex1_vreg                (dp_rbus_pipe7_ex1_vreg               ),
  .dp_rbus_pipe7_ex1_vreg_dup0           (dp_rbus_pipe7_ex1_vreg_dup0          ),
  .dp_rbus_pipe7_ex1_vreg_dup1           (dp_rbus_pipe7_ex1_vreg_dup1          ),
  .dp_rbus_pipe7_ex1_vreg_dup2           (dp_rbus_pipe7_ex1_vreg_dup2          ),
  .dp_rbus_pipe7_ex2_vreg                (dp_rbus_pipe7_ex2_vreg               ),
  .dp_rbus_pipe7_ex2_vreg_dup0           (dp_rbus_pipe7_ex2_vreg_dup0          ),
  .dp_rbus_pipe7_ex2_vreg_dup1           (dp_rbus_pipe7_ex2_vreg_dup1          ),
  .dp_rbus_pipe7_ex2_vreg_dup2           (dp_rbus_pipe7_ex2_vreg_dup2          ),
  .dp_rbus_pipe7_ex3_vreg_dup0           (dp_rbus_pipe7_ex3_vreg_dup0          ),
  .dp_rbus_pipe7_ex3_vreg_dup1           (dp_rbus_pipe7_ex3_vreg_dup1          ),
  .dp_rbus_pipe7_ex3_vreg_dup2           (dp_rbus_pipe7_ex3_vreg_dup2          ),
  .dp_rbus_pipe7_ex3_vreg_dup3           (dp_rbus_pipe7_ex3_vreg_dup3          ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pipe6_rbus_ex1_fmla_data_vld          (pipe6_rbus_ex1_fmla_data_vld         ),
  .pipe6_rbus_ex1_fmla_data_vld_dup0     (pipe6_rbus_ex1_fmla_data_vld_dup0    ),
  .pipe6_rbus_ex1_fmla_data_vld_dup1     (pipe6_rbus_ex1_fmla_data_vld_dup1    ),
  .pipe6_rbus_ex1_fmla_data_vld_dup2     (pipe6_rbus_ex1_fmla_data_vld_dup2    ),
  .pipe6_rbus_ex2_fmla_data_vld          (pipe6_rbus_ex2_fmla_data_vld         ),
  .pipe6_rbus_ex2_fmla_data_vld_dup0     (pipe6_rbus_ex2_fmla_data_vld_dup0    ),
  .pipe6_rbus_ex2_fmla_data_vld_dup1     (pipe6_rbus_ex2_fmla_data_vld_dup1    ),
  .pipe6_rbus_ex2_fmla_data_vld_dup2     (pipe6_rbus_ex2_fmla_data_vld_dup2    ),
  .pipe6_rbus_pipe6_fmla_no_fwd          (pipe6_rbus_pipe6_fmla_no_fwd         ),
  .pipe6_rbus_pipe7_fmla_no_fwd          (pipe6_rbus_pipe7_fmla_no_fwd         ),
  .pipe6_rbus_vfmau_ereg_wb_data         (pipe6_rbus_vfmau_ereg_wb_data        ),
  .pipe6_rbus_vfmau_ereg_wb_vld          (pipe6_rbus_vfmau_ereg_wb_vld         ),
  .pipe6_rbus_vfmau_freg_wb_data         (pipe6_rbus_vfmau_freg_wb_data        ),
  .pipe6_rbus_vfmau_vreg_wb_vld          (pipe6_rbus_vfmau_vreg_wb_vld         ),
  .pipe7_rbus_ex1_fmla_data_vld          (pipe7_rbus_ex1_fmla_data_vld         ),
  .pipe7_rbus_ex1_fmla_data_vld_dup0     (pipe7_rbus_ex1_fmla_data_vld_dup0    ),
  .pipe7_rbus_ex1_fmla_data_vld_dup1     (pipe7_rbus_ex1_fmla_data_vld_dup1    ),
  .pipe7_rbus_ex1_fmla_data_vld_dup2     (pipe7_rbus_ex1_fmla_data_vld_dup2    ),
  .pipe7_rbus_ex2_fmla_data_vld          (pipe7_rbus_ex2_fmla_data_vld         ),
  .pipe7_rbus_ex2_fmla_data_vld_dup0     (pipe7_rbus_ex2_fmla_data_vld_dup0    ),
  .pipe7_rbus_ex2_fmla_data_vld_dup1     (pipe7_rbus_ex2_fmla_data_vld_dup1    ),
  .pipe7_rbus_ex2_fmla_data_vld_dup2     (pipe7_rbus_ex2_fmla_data_vld_dup2    ),
  .pipe7_rbus_pipe6_fmla_no_fwd          (pipe7_rbus_pipe6_fmla_no_fwd         ),
  .pipe7_rbus_pipe7_fmla_no_fwd          (pipe7_rbus_pipe7_fmla_no_fwd         ),
  .pipe7_rbus_vfmau_ereg_wb_data         (pipe7_rbus_vfmau_ereg_wb_data        ),
  .pipe7_rbus_vfmau_ereg_wb_vld          (pipe7_rbus_vfmau_ereg_wb_vld         ),
  .pipe7_rbus_vfmau_freg_wb_data         (pipe7_rbus_vfmau_freg_wb_data        ),
  .pipe7_rbus_vfmau_vreg_wb_vld          (pipe7_rbus_vfmau_vreg_wb_vld         ),
  .rtu_yy_xx_flush                       (rtu_yy_xx_flush                      ),
  .vdsp_vfpu_pipe6_inside_fwd_aval       (vdsp_vfpu_pipe6_inside_fwd_aval      ),
  .vdsp_vfpu_pipe7_inside_fwd_aval       (vdsp_vfpu_pipe7_inside_fwd_aval      ),
  .vfpu_idu_ex1_pipe6_data_vld_dup0      (vfpu_idu_ex1_pipe6_data_vld_dup0     ),
  .vfpu_idu_ex1_pipe6_data_vld_dup1      (vfpu_idu_ex1_pipe6_data_vld_dup1     ),
  .vfpu_idu_ex1_pipe6_data_vld_dup2      (vfpu_idu_ex1_pipe6_data_vld_dup2     ),
  .vfpu_idu_ex1_pipe6_data_vld_dup3      (vfpu_idu_ex1_pipe6_data_vld_dup3     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup0 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup0),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup1 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup1),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup2 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup2),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup3 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup3),
  .vfpu_idu_ex1_pipe6_vreg_dup0          (vfpu_idu_ex1_pipe6_vreg_dup0         ),
  .vfpu_idu_ex1_pipe6_vreg_dup1          (vfpu_idu_ex1_pipe6_vreg_dup1         ),
  .vfpu_idu_ex1_pipe6_vreg_dup2          (vfpu_idu_ex1_pipe6_vreg_dup2         ),
  .vfpu_idu_ex1_pipe6_vreg_dup3          (vfpu_idu_ex1_pipe6_vreg_dup3         ),
  .vfpu_idu_ex1_pipe7_data_vld_dup0      (vfpu_idu_ex1_pipe7_data_vld_dup0     ),
  .vfpu_idu_ex1_pipe7_data_vld_dup1      (vfpu_idu_ex1_pipe7_data_vld_dup1     ),
  .vfpu_idu_ex1_pipe7_data_vld_dup2      (vfpu_idu_ex1_pipe7_data_vld_dup2     ),
  .vfpu_idu_ex1_pipe7_data_vld_dup3      (vfpu_idu_ex1_pipe7_data_vld_dup3     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup0 (vfpu_idu_ex1_pipe7_fmla_data_vld_dup0),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup1 (vfpu_idu_ex1_pipe7_fmla_data_vld_dup1),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup2 (vfpu_idu_ex1_pipe7_fmla_data_vld_dup2),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup3 (vfpu_idu_ex1_pipe7_fmla_data_vld_dup3),
  .vfpu_idu_ex1_pipe7_vreg_dup0          (vfpu_idu_ex1_pipe7_vreg_dup0         ),
  .vfpu_idu_ex1_pipe7_vreg_dup1          (vfpu_idu_ex1_pipe7_vreg_dup1         ),
  .vfpu_idu_ex1_pipe7_vreg_dup2          (vfpu_idu_ex1_pipe7_vreg_dup2         ),
  .vfpu_idu_ex1_pipe7_vreg_dup3          (vfpu_idu_ex1_pipe7_vreg_dup3         ),
  .vfpu_idu_ex2_pipe6_data_vld_dup0      (vfpu_idu_ex2_pipe6_data_vld_dup0     ),
  .vfpu_idu_ex2_pipe6_data_vld_dup1      (vfpu_idu_ex2_pipe6_data_vld_dup1     ),
  .vfpu_idu_ex2_pipe6_data_vld_dup2      (vfpu_idu_ex2_pipe6_data_vld_dup2     ),
  .vfpu_idu_ex2_pipe6_data_vld_dup3      (vfpu_idu_ex2_pipe6_data_vld_dup3     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup0 (vfpu_idu_ex2_pipe6_fmla_data_vld_dup0),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup1 (vfpu_idu_ex2_pipe6_fmla_data_vld_dup1),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup2 (vfpu_idu_ex2_pipe6_fmla_data_vld_dup2),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup3 (vfpu_idu_ex2_pipe6_fmla_data_vld_dup3),
  .vfpu_idu_ex2_pipe6_vreg_dup0          (vfpu_idu_ex2_pipe6_vreg_dup0         ),
  .vfpu_idu_ex2_pipe6_vreg_dup1          (vfpu_idu_ex2_pipe6_vreg_dup1         ),
  .vfpu_idu_ex2_pipe6_vreg_dup2          (vfpu_idu_ex2_pipe6_vreg_dup2         ),
  .vfpu_idu_ex2_pipe6_vreg_dup3          (vfpu_idu_ex2_pipe6_vreg_dup3         ),
  .vfpu_idu_ex2_pipe7_data_vld_dup0      (vfpu_idu_ex2_pipe7_data_vld_dup0     ),
  .vfpu_idu_ex2_pipe7_data_vld_dup1      (vfpu_idu_ex2_pipe7_data_vld_dup1     ),
  .vfpu_idu_ex2_pipe7_data_vld_dup2      (vfpu_idu_ex2_pipe7_data_vld_dup2     ),
  .vfpu_idu_ex2_pipe7_data_vld_dup3      (vfpu_idu_ex2_pipe7_data_vld_dup3     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup0 (vfpu_idu_ex2_pipe7_fmla_data_vld_dup0),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup1 (vfpu_idu_ex2_pipe7_fmla_data_vld_dup1),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup2 (vfpu_idu_ex2_pipe7_fmla_data_vld_dup2),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup3 (vfpu_idu_ex2_pipe7_fmla_data_vld_dup3),
  .vfpu_idu_ex2_pipe7_vreg_dup0          (vfpu_idu_ex2_pipe7_vreg_dup0         ),
  .vfpu_idu_ex2_pipe7_vreg_dup1          (vfpu_idu_ex2_pipe7_vreg_dup1         ),
  .vfpu_idu_ex2_pipe7_vreg_dup2          (vfpu_idu_ex2_pipe7_vreg_dup2         ),
  .vfpu_idu_ex2_pipe7_vreg_dup3          (vfpu_idu_ex2_pipe7_vreg_dup3         ),
  .vfpu_idu_ex3_pipe6_data_vld_dup0      (vfpu_idu_ex3_pipe6_data_vld_dup0     ),
  .vfpu_idu_ex3_pipe6_data_vld_dup1      (vfpu_idu_ex3_pipe6_data_vld_dup1     ),
  .vfpu_idu_ex3_pipe6_data_vld_dup2      (vfpu_idu_ex3_pipe6_data_vld_dup2     ),
  .vfpu_idu_ex3_pipe6_data_vld_dup3      (vfpu_idu_ex3_pipe6_data_vld_dup3     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg           (vfpu_idu_ex3_pipe6_fwd_vreg          ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_fr_data   (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data  ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld       (vfpu_idu_ex3_pipe6_fwd_vreg_vld      ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data  (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data  (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data ),
  .vfpu_idu_ex3_pipe6_vreg_dup0          (vfpu_idu_ex3_pipe6_vreg_dup0         ),
  .vfpu_idu_ex3_pipe6_vreg_dup1          (vfpu_idu_ex3_pipe6_vreg_dup1         ),
  .vfpu_idu_ex3_pipe6_vreg_dup2          (vfpu_idu_ex3_pipe6_vreg_dup2         ),
  .vfpu_idu_ex3_pipe6_vreg_dup3          (vfpu_idu_ex3_pipe6_vreg_dup3         ),
  .vfpu_idu_ex3_pipe7_data_vld_dup0      (vfpu_idu_ex3_pipe7_data_vld_dup0     ),
  .vfpu_idu_ex3_pipe7_data_vld_dup1      (vfpu_idu_ex3_pipe7_data_vld_dup1     ),
  .vfpu_idu_ex3_pipe7_data_vld_dup2      (vfpu_idu_ex3_pipe7_data_vld_dup2     ),
  .vfpu_idu_ex3_pipe7_data_vld_dup3      (vfpu_idu_ex3_pipe7_data_vld_dup3     ),
  .vfpu_idu_ex3_pipe7_fwd_vreg           (vfpu_idu_ex3_pipe7_fwd_vreg          ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_fr_data   (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data  ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld       (vfpu_idu_ex3_pipe7_fwd_vreg_vld      ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data  (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data  (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data ),
  .vfpu_idu_ex3_pipe7_vreg_dup0          (vfpu_idu_ex3_pipe7_vreg_dup0         ),
  .vfpu_idu_ex3_pipe7_vreg_dup1          (vfpu_idu_ex3_pipe7_vreg_dup1         ),
  .vfpu_idu_ex3_pipe7_vreg_dup2          (vfpu_idu_ex3_pipe7_vreg_dup2         ),
  .vfpu_idu_ex3_pipe7_vreg_dup3          (vfpu_idu_ex3_pipe7_vreg_dup3         ),
  .vfpu_idu_ex4_pipe6_fwd_vreg           (vfpu_idu_ex4_pipe6_fwd_vreg          ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_fr_data   (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data  ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld       (vfpu_idu_ex4_pipe6_fwd_vreg_vld      ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data  (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data  (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data ),
  .vfpu_idu_ex4_pipe7_fwd_vreg           (vfpu_idu_ex4_pipe7_fwd_vreg          ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_fr_data   (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data  ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld       (vfpu_idu_ex4_pipe7_fwd_vreg_vld      ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data  (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data  (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data ),
  .vfpu_idu_ex5_pipe6_fwd_vreg           (vfpu_idu_ex5_pipe6_fwd_vreg          ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld       (vfpu_idu_ex5_pipe6_fwd_vreg_vld      ),
  .vfpu_idu_ex5_pipe6_wb_ereg            (vfpu_idu_ex5_pipe6_wb_ereg           ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data       (vfpu_idu_ex5_pipe6_wb_ereg_data      ),
  .vfpu_idu_ex5_pipe6_wb_ereg_vld        (vfpu_idu_ex5_pipe6_wb_ereg_vld       ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup0       (vfpu_idu_ex5_pipe6_wb_vreg_dup0      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup1       (vfpu_idu_ex5_pipe6_wb_vreg_dup1      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup2       (vfpu_idu_ex5_pipe6_wb_vreg_dup2      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup3       (vfpu_idu_ex5_pipe6_wb_vreg_dup3      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_fr_data    (vfpu_idu_ex5_pipe6_wb_vreg_fr_data   ),
  .vfpu_idu_ex5_pipe6_wb_vreg_fr_expand  (vfpu_idu_ex5_pipe6_wb_vreg_fr_expand ),
  .vfpu_idu_ex5_pipe6_wb_vreg_fr_vld     (vfpu_idu_ex5_pipe6_wb_vreg_fr_vld    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr0_data   (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand (vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld    (vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld   ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr1_data   (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand (vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld    (vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld   ),
  .vfpu_idu_ex5_pipe7_fwd_vreg           (vfpu_idu_ex5_pipe7_fwd_vreg          ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld       (vfpu_idu_ex5_pipe7_fwd_vreg_vld      ),
  .vfpu_idu_ex5_pipe7_wb_ereg            (vfpu_idu_ex5_pipe7_wb_ereg           ),
  .vfpu_idu_ex5_pipe7_wb_ereg_data       (vfpu_idu_ex5_pipe7_wb_ereg_data      ),
  .vfpu_idu_ex5_pipe7_wb_ereg_vld        (vfpu_idu_ex5_pipe7_wb_ereg_vld       ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup0       (vfpu_idu_ex5_pipe7_wb_vreg_dup0      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup1       (vfpu_idu_ex5_pipe7_wb_vreg_dup1      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup2       (vfpu_idu_ex5_pipe7_wb_vreg_dup2      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup3       (vfpu_idu_ex5_pipe7_wb_vreg_dup3      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_fr_data    (vfpu_idu_ex5_pipe7_wb_vreg_fr_data   ),
  .vfpu_idu_ex5_pipe7_wb_vreg_fr_expand  (vfpu_idu_ex5_pipe7_wb_vreg_fr_expand ),
  .vfpu_idu_ex5_pipe7_wb_vreg_fr_vld     (vfpu_idu_ex5_pipe7_wb_vreg_fr_vld    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr0_data   (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand (vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld    (vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld   ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr1_data   (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand (vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld    (vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld   ),
  .vfpu_idu_pipe6_vmla_srcv2_no_fwd      (vfpu_idu_pipe6_vmla_srcv2_no_fwd     ),
  .vfpu_idu_pipe7_vmla_srcv2_no_fwd      (vfpu_idu_pipe7_vmla_srcv2_no_fwd     ),
  .vfpu_rtu_ex5_pipe6_ereg_wb_vld        (vfpu_rtu_ex5_pipe6_ereg_wb_vld       ),
  .vfpu_rtu_ex5_pipe6_wb_ereg            (vfpu_rtu_ex5_pipe6_wb_ereg           ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_expand     (vfpu_rtu_ex5_pipe6_wb_vreg_expand    ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld     (vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld    ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld     (vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld    ),
  .vfpu_rtu_ex5_pipe7_ereg_wb_vld        (vfpu_rtu_ex5_pipe7_ereg_wb_vld       ),
  .vfpu_rtu_ex5_pipe7_wb_ereg            (vfpu_rtu_ex5_pipe7_wb_ereg           ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_expand     (vfpu_rtu_ex5_pipe7_wb_vreg_expand    ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld     (vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld    ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld     (vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld    )
);



// &ConnRule(s/pipex/pipe6/); @112
// &Instance("ct_vfalu_top_pipe6","x_ct_vfalu_top_pipe6"); @113
ct_vfalu_top_pipe6  x_ct_vfalu_top_pipe6 (
  .cp0_vfpu_icg_en              (cp0_vfpu_icg_en             ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .dp_vfalu_ex1_pipex_func      (dp_vfalu_ex1_pipe6_func     ),
  .dp_vfalu_ex1_pipex_imm0      (dp_vfalu_ex1_pipe6_imm0     ),
  .dp_vfalu_ex1_pipex_mtvr_src0 (dp_vfalu_ex1_pipe6_mtvr_src0),
  .dp_vfalu_ex1_pipex_sel       (dp_vfalu_ex1_pipe6_sel      ),
  .dp_vfalu_ex1_pipex_srcf0     (dp_vfalu_ex1_pipe6_srcf0    ),
  .dp_vfalu_ex1_pipex_srcf1     (dp_vfalu_ex1_pipe6_srcf1    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .pipex_dp_ex1_vfalu_mfvr_data (pipe6_dp_ex1_vfalu_mfvr_data),
  .pipex_dp_ex3_vfalu_ereg_data (pipe6_dp_ex3_vfalu_ereg_data),
  .pipex_dp_ex3_vfalu_freg_data (pipe6_dp_ex3_vfalu_freg_data),
  .vfpu_yy_xx_dqnan             (vfpu_yy_xx_dqnan            ),
  .vfpu_yy_xx_rm                (vfpu_yy_xx_rm               )
);


// &ConnRule(s/pipex/pipe7/); @115
// &Instance("ct_vfalu_top_pipe7","x_ct_vfalu_top_pipe7"); @116
ct_vfalu_top_pipe7  x_ct_vfalu_top_pipe7 (
  .cp0_vfpu_icg_en              (cp0_vfpu_icg_en             ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .dp_vfalu_ex1_pipex_func      (dp_vfalu_ex1_pipe7_func     ),
  .dp_vfalu_ex1_pipex_imm0      (dp_vfalu_ex1_pipe7_imm0     ),
  .dp_vfalu_ex1_pipex_mtvr_src0 (dp_vfalu_ex1_pipe7_mtvr_src0),
  .dp_vfalu_ex1_pipex_sel       (dp_vfalu_ex1_pipe7_sel      ),
  .dp_vfalu_ex1_pipex_srcf0     (dp_vfalu_ex1_pipe7_srcf0    ),
  .dp_vfalu_ex1_pipex_srcf1     (dp_vfalu_ex1_pipe7_srcf1    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .pipex_dp_ex1_vfalu_mfvr_data (pipe7_dp_ex1_vfalu_mfvr_data),
  .pipex_dp_ex3_vfalu_ereg_data (pipe7_dp_ex3_vfalu_ereg_data),
  .pipex_dp_ex3_vfalu_freg_data (pipe7_dp_ex3_vfalu_freg_data),
  .vfpu_yy_xx_dqnan             (vfpu_yy_xx_dqnan            ),
  .vfpu_yy_xx_rm                (vfpu_yy_xx_rm               )
);


// &ConnRule(s/pipex/pipe6/); @118
// &Instance("ct_vfdsu_top","x_ct_vfdsu_top"); @119
ct_vfdsu_top  x_ct_vfdsu_top (
  .cp0_vfpu_icg_en               (cp0_vfpu_icg_en              ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .dp_vfdsu_ex1_pipex_dst_ereg   (dp_vfdsu_ex1_pipe6_dst_ereg  ),
  .dp_vfdsu_ex1_pipex_dst_vreg   (dp_vfdsu_ex1_pipe6_dst_vreg  ),
  .dp_vfdsu_ex1_pipex_iid        (dp_vfdsu_ex1_pipe6_iid       ),
  .dp_vfdsu_ex1_pipex_imm0       (dp_vfdsu_ex1_pipe6_imm0      ),
  .dp_vfdsu_ex1_pipex_sel        (dp_vfdsu_ex1_pipe6_sel       ),
  .dp_vfdsu_ex1_pipex_srcf0      (dp_vfdsu_ex1_pipe6_srcf0     ),
  .dp_vfdsu_ex1_pipex_srcf1      (dp_vfdsu_ex1_pipe6_srcf1     ),
  .dp_vfdsu_fdiv_gateclk_issue   (dp_vfdsu_fdiv_gateclk_issue  ),
  .dp_vfdsu_idu_fdiv_issue       (dp_vfdsu_idu_fdiv_issue      ),
  .forever_cpuclk                (forever_cpuclk               ),
  .idu_vfpu_rf_pipex_func        (idu_vfpu_rf_pipe6_func       ),
  .idu_vfpu_rf_pipex_gateclk_sel (idu_vfpu_rf_pipe6_gateclk_sel),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pipex_dp_vfdsu_ereg           (pipe6_dp_vfdsu_ereg          ),
  .pipex_dp_vfdsu_ereg_data      (pipe6_dp_vfdsu_ereg_data     ),
  .pipex_dp_vfdsu_freg_data      (pipe6_dp_vfdsu_freg_data     ),
  .pipex_dp_vfdsu_inst_vld       (pipe6_dp_vfdsu_inst_vld      ),
  .pipex_dp_vfdsu_vreg           (pipe6_dp_vfdsu_vreg          ),
  .rtu_yy_xx_flush               (rtu_yy_xx_flush              ),
  .vfdsu_dp_fdiv_busy            (vfdsu_dp_fdiv_busy           ),
  .vfdsu_dp_inst_wb_req          (vfdsu_dp_inst_wb_req         ),
  .vfdsu_ifu_debug_ex2_wait      (vfdsu_ifu_debug_ex2_wait     ),
  .vfdsu_ifu_debug_idle          (vfdsu_ifu_debug_idle         ),
  .vfdsu_ifu_debug_pipe_busy     (vfdsu_ifu_debug_pipe_busy    ),
  .vfpu_yy_xx_dqnan              (vfpu_yy_xx_dqnan             ),
  .vfpu_yy_xx_rm                 (vfpu_yy_xx_rm                )
);


// &ConnRule(s/pipex/pipe6/); @121
// &Instance("ct_vfmau_top","x_ct_vfmau_top_pipe6"); @122
ct_vfmau_top  x_ct_vfmau_top_pipe6 (
  .cp0_vfpu_icg_en                        (cp0_vfpu_icg_en                       ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .dp_vfmau_ex1_pipex_dst_vreg            (dp_vfmau_ex1_pipe6_dst_vreg           ),
  .dp_vfmau_ex1_pipex_imm0                (dp_vfmau_ex1_pipe6_imm0               ),
  .dp_vfmau_ex1_pipex_sel                 (dp_vfmau_ex1_pipe6_sel                ),
  .dp_vfmau_pipe6_mla_srcv2_vld           (dp_vfmau_pipe6_mla_srcv2_vld          ),
  .dp_vfmau_pipe6_mla_srcv2_vreg          (dp_vfmau_pipe6_mla_srcv2_vreg         ),
  .dp_vfmau_pipe6_mla_type                (dp_vfmau_pipe6_mla_type               ),
  .dp_vfmau_pipe7_mla_srcv2_vld           (dp_vfmau_pipe7_mla_srcv2_vld          ),
  .dp_vfmau_pipe7_mla_srcv2_vreg          (dp_vfmau_pipe7_mla_srcv2_vreg         ),
  .dp_vfmau_pipe7_mla_type                (dp_vfmau_pipe7_mla_type               ),
  .dp_vfmau_pipex_inst_type               (dp_vfmau_pipe6_inst_type              ),
  .dp_vfmau_pipex_sel                     (dp_vfmau_pipe6_sel                    ),
  .dp_vfmau_pipex_vfmau_sel               (dp_vfmau_pipe6_vfmau_sel              ),
  .dp_vfmau_rf_pipex_sel                  (dp_vfmau_rf_pipe6_sel                 ),
  .forever_cpuclk                         (forever_cpuclk                        ),
  .idu_vfpu_rf_pipex_func                 (idu_vfpu_rf_pipe6_func                ),
  .idu_vfpu_rf_pipex_gateclk_sel          (idu_vfpu_rf_pipe6_gateclk_sel         ),
  .idu_vfpu_rf_pipex_srcv0_fr             (idu_vfpu_rf_pipe6_srcv0_fr            ),
  .idu_vfpu_rf_pipex_srcv1_fr             (idu_vfpu_rf_pipe6_srcv1_fr            ),
  .idu_vfpu_rf_pipex_srcv2_fr             (idu_vfpu_rf_pipe6_srcv2_fr            ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pipe6_pipex_ex4_fmla_fwd_vld           (pipe6_pipe6_ex4_fmla_fwd_vld          ),
  .pipe6_pipex_ex5_ex1_fmla_fwd_vld       (pipe6_pipe6_ex5_ex1_fmla_fwd_vld      ),
  .pipe6_pipex_ex5_ex2_fmla_fwd_vld       (pipe6_pipe6_ex5_ex2_fmla_fwd_vld      ),
  .pipe6_vfmau_ex4_fmla_slice0_half0_data (pipe6_vfmau_ex4_fmla_slice0_half0_data),
  .pipe6_vfmau_ex5_fmla_slice0_data       (pipe6_vfmau_ex5_fmla_slice0_data      ),
  .pipe7_pipex_ex4_fmla_fwd_vld           (pipe7_pipe6_ex4_fmla_fwd_vld          ),
  .pipe7_pipex_ex5_ex1_fmla_fwd_vld       (pipe7_pipe6_ex5_ex1_fmla_fwd_vld      ),
  .pipe7_pipex_ex5_ex2_fmla_fwd_vld       (pipe7_pipe6_ex5_ex2_fmla_fwd_vld      ),
  .pipe7_vfmau_ex4_fmla_slice0_half0_data (pipe7_vfmau_ex4_fmla_slice0_half0_data),
  .pipe7_vfmau_ex5_fmla_slice0_data       (pipe7_vfmau_ex5_fmla_slice0_data      ),
  .pipex_dp_ex1_mult_id                   (pipe6_dp_ex1_mult_id                  ),
  .pipex_dp_ex3_vfmau_ereg_data           (pipe6_dp_ex3_vfmau_ereg_data          ),
  .pipex_dp_ex3_vfmau_freg_data           (pipe6_dp_ex3_vfmau_freg_data          ),
  .pipex_dp_ex4_vfmau_ereg_data           (pipe6_dp_ex4_vfmau_ereg_data          ),
  .pipex_dp_ex4_vfmau_freg_data           (pipe6_dp_ex4_vfmau_freg_data          ),
  .pipex_pipe6_ex4_fmla_fwd_vld           (pipe6_pipe6_ex4_fmla_fwd_vld          ),
  .pipex_pipe6_ex5_ex1_fmla_fwd_vld       (pipe6_pipe6_ex5_ex1_fmla_fwd_vld      ),
  .pipex_pipe6_ex5_ex2_fmla_fwd_vld       (pipe6_pipe6_ex5_ex2_fmla_fwd_vld      ),
  .pipex_pipe7_ex4_fmla_fwd_vld           (pipe6_pipe7_ex4_fmla_fwd_vld          ),
  .pipex_pipe7_ex5_ex1_fmla_fwd_vld       (pipe6_pipe7_ex5_ex1_fmla_fwd_vld      ),
  .pipex_pipe7_ex5_ex2_fmla_fwd_vld       (pipe6_pipe7_ex5_ex2_fmla_fwd_vld      ),
  .pipex_rbus_ex1_fmla_data_vld           (pipe6_rbus_ex1_fmla_data_vld          ),
  .pipex_rbus_ex1_fmla_data_vld_dup0      (pipe6_rbus_ex1_fmla_data_vld_dup0     ),
  .pipex_rbus_ex1_fmla_data_vld_dup1      (pipe6_rbus_ex1_fmla_data_vld_dup1     ),
  .pipex_rbus_ex1_fmla_data_vld_dup2      (pipe6_rbus_ex1_fmla_data_vld_dup2     ),
  .pipex_rbus_ex2_fmla_data_vld           (pipe6_rbus_ex2_fmla_data_vld          ),
  .pipex_rbus_ex2_fmla_data_vld_dup0      (pipe6_rbus_ex2_fmla_data_vld_dup0     ),
  .pipex_rbus_ex2_fmla_data_vld_dup1      (pipe6_rbus_ex2_fmla_data_vld_dup1     ),
  .pipex_rbus_ex2_fmla_data_vld_dup2      (pipe6_rbus_ex2_fmla_data_vld_dup2     ),
  .pipex_rbus_pipe6_fmla_no_fwd           (pipe6_rbus_pipe6_fmla_no_fwd          ),
  .pipex_rbus_pipe7_fmla_no_fwd           (pipe6_rbus_pipe7_fmla_no_fwd          ),
  .pipex_rbus_vfmau_ereg_wb_data          (pipe6_rbus_vfmau_ereg_wb_data         ),
  .pipex_rbus_vfmau_ereg_wb_vld           (pipe6_rbus_vfmau_ereg_wb_vld          ),
  .pipex_rbus_vfmau_freg_wb_data          (pipe6_rbus_vfmau_freg_wb_data         ),
  .pipex_rbus_vfmau_vreg_wb_vld           (pipe6_rbus_vfmau_vreg_wb_vld          ),
  .pipex_vfmau_ex4_fmla_slice0_half0_data (pipe6_vfmau_ex4_fmla_slice0_half0_data),
  .pipex_vfmau_ex5_fmla_slice0_data       (pipe6_vfmau_ex5_fmla_slice0_data      ),
  .rtu_yy_xx_flush                        (rtu_yy_xx_flush                       ),
  .vfpu_yy_xx_dqnan                       (vfpu_yy_xx_dqnan                      ),
  .vfpu_yy_xx_rm                          (vfpu_yy_xx_rm                         )
);


// &ConnRule(s/pipex/pipe7/); @124
// &Instance("ct_vfmau_top","x_ct_vfmau_top_pipe7"); @125
ct_vfmau_top  x_ct_vfmau_top_pipe7 (
  .cp0_vfpu_icg_en                        (cp0_vfpu_icg_en                       ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .dp_vfmau_ex1_pipex_dst_vreg            (dp_vfmau_ex1_pipe7_dst_vreg           ),
  .dp_vfmau_ex1_pipex_imm0                (dp_vfmau_ex1_pipe7_imm0               ),
  .dp_vfmau_ex1_pipex_sel                 (dp_vfmau_ex1_pipe7_sel                ),
  .dp_vfmau_pipe6_mla_srcv2_vld           (dp_vfmau_pipe6_mla_srcv2_vld          ),
  .dp_vfmau_pipe6_mla_srcv2_vreg          (dp_vfmau_pipe6_mla_srcv2_vreg         ),
  .dp_vfmau_pipe6_mla_type                (dp_vfmau_pipe6_mla_type               ),
  .dp_vfmau_pipe7_mla_srcv2_vld           (dp_vfmau_pipe7_mla_srcv2_vld          ),
  .dp_vfmau_pipe7_mla_srcv2_vreg          (dp_vfmau_pipe7_mla_srcv2_vreg         ),
  .dp_vfmau_pipe7_mla_type                (dp_vfmau_pipe7_mla_type               ),
  .dp_vfmau_pipex_inst_type               (dp_vfmau_pipe7_inst_type              ),
  .dp_vfmau_pipex_sel                     (dp_vfmau_pipe7_sel                    ),
  .dp_vfmau_pipex_vfmau_sel               (dp_vfmau_pipe7_vfmau_sel              ),
  .dp_vfmau_rf_pipex_sel                  (dp_vfmau_rf_pipe7_sel                 ),
  .forever_cpuclk                         (forever_cpuclk                        ),
  .idu_vfpu_rf_pipex_func                 (idu_vfpu_rf_pipe7_func                ),
  .idu_vfpu_rf_pipex_gateclk_sel          (idu_vfpu_rf_pipe7_gateclk_sel         ),
  .idu_vfpu_rf_pipex_srcv0_fr             (idu_vfpu_rf_pipe7_srcv0_fr            ),
  .idu_vfpu_rf_pipex_srcv1_fr             (idu_vfpu_rf_pipe7_srcv1_fr            ),
  .idu_vfpu_rf_pipex_srcv2_fr             (idu_vfpu_rf_pipe7_srcv2_fr            ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pipe6_pipex_ex4_fmla_fwd_vld           (pipe6_pipe7_ex4_fmla_fwd_vld          ),
  .pipe6_pipex_ex5_ex1_fmla_fwd_vld       (pipe6_pipe7_ex5_ex1_fmla_fwd_vld      ),
  .pipe6_pipex_ex5_ex2_fmla_fwd_vld       (pipe6_pipe7_ex5_ex2_fmla_fwd_vld      ),
  .pipe6_vfmau_ex4_fmla_slice0_half0_data (pipe6_vfmau_ex4_fmla_slice0_half0_data),
  .pipe6_vfmau_ex5_fmla_slice0_data       (pipe6_vfmau_ex5_fmla_slice0_data      ),
  .pipe7_pipex_ex4_fmla_fwd_vld           (pipe7_pipe7_ex4_fmla_fwd_vld          ),
  .pipe7_pipex_ex5_ex1_fmla_fwd_vld       (pipe7_pipe7_ex5_ex1_fmla_fwd_vld      ),
  .pipe7_pipex_ex5_ex2_fmla_fwd_vld       (pipe7_pipe7_ex5_ex2_fmla_fwd_vld      ),
  .pipe7_vfmau_ex4_fmla_slice0_half0_data (pipe7_vfmau_ex4_fmla_slice0_half0_data),
  .pipe7_vfmau_ex5_fmla_slice0_data       (pipe7_vfmau_ex5_fmla_slice0_data      ),
  .pipex_dp_ex1_mult_id                   (pipe7_dp_ex1_mult_id                  ),
  .pipex_dp_ex3_vfmau_ereg_data           (pipe7_dp_ex3_vfmau_ereg_data          ),
  .pipex_dp_ex3_vfmau_freg_data           (pipe7_dp_ex3_vfmau_freg_data          ),
  .pipex_dp_ex4_vfmau_ereg_data           (pipe7_dp_ex4_vfmau_ereg_data          ),
  .pipex_dp_ex4_vfmau_freg_data           (pipe7_dp_ex4_vfmau_freg_data          ),
  .pipex_pipe6_ex4_fmla_fwd_vld           (pipe7_pipe6_ex4_fmla_fwd_vld          ),
  .pipex_pipe6_ex5_ex1_fmla_fwd_vld       (pipe7_pipe6_ex5_ex1_fmla_fwd_vld      ),
  .pipex_pipe6_ex5_ex2_fmla_fwd_vld       (pipe7_pipe6_ex5_ex2_fmla_fwd_vld      ),
  .pipex_pipe7_ex4_fmla_fwd_vld           (pipe7_pipe7_ex4_fmla_fwd_vld          ),
  .pipex_pipe7_ex5_ex1_fmla_fwd_vld       (pipe7_pipe7_ex5_ex1_fmla_fwd_vld      ),
  .pipex_pipe7_ex5_ex2_fmla_fwd_vld       (pipe7_pipe7_ex5_ex2_fmla_fwd_vld      ),
  .pipex_rbus_ex1_fmla_data_vld           (pipe7_rbus_ex1_fmla_data_vld          ),
  .pipex_rbus_ex1_fmla_data_vld_dup0      (pipe7_rbus_ex1_fmla_data_vld_dup0     ),
  .pipex_rbus_ex1_fmla_data_vld_dup1      (pipe7_rbus_ex1_fmla_data_vld_dup1     ),
  .pipex_rbus_ex1_fmla_data_vld_dup2      (pipe7_rbus_ex1_fmla_data_vld_dup2     ),
  .pipex_rbus_ex2_fmla_data_vld           (pipe7_rbus_ex2_fmla_data_vld          ),
  .pipex_rbus_ex2_fmla_data_vld_dup0      (pipe7_rbus_ex2_fmla_data_vld_dup0     ),
  .pipex_rbus_ex2_fmla_data_vld_dup1      (pipe7_rbus_ex2_fmla_data_vld_dup1     ),
  .pipex_rbus_ex2_fmla_data_vld_dup2      (pipe7_rbus_ex2_fmla_data_vld_dup2     ),
  .pipex_rbus_pipe6_fmla_no_fwd           (pipe7_rbus_pipe6_fmla_no_fwd          ),
  .pipex_rbus_pipe7_fmla_no_fwd           (pipe7_rbus_pipe7_fmla_no_fwd          ),
  .pipex_rbus_vfmau_ereg_wb_data          (pipe7_rbus_vfmau_ereg_wb_data         ),
  .pipex_rbus_vfmau_ereg_wb_vld           (pipe7_rbus_vfmau_ereg_wb_vld          ),
  .pipex_rbus_vfmau_freg_wb_data          (pipe7_rbus_vfmau_freg_wb_data         ),
  .pipex_rbus_vfmau_vreg_wb_vld           (pipe7_rbus_vfmau_vreg_wb_vld          ),
  .pipex_vfmau_ex4_fmla_slice0_half0_data (pipe7_vfmau_ex4_fmla_slice0_half0_data),
  .pipex_vfmau_ex5_fmla_slice0_data       (pipe7_vfmau_ex5_fmla_slice0_data      ),
  .rtu_yy_xx_flush                        (rtu_yy_xx_flush                       ),
  .vfpu_yy_xx_dqnan                       (vfpu_yy_xx_dqnan                      ),
  .vfpu_yy_xx_rm                          (vfpu_yy_xx_rm                         )
);


// &Instance("ct_vdsp_top","x_ct_vdsp_top"); @128
//assign vdsp_vfpu_pipe6_ex1_delay_pipe_down = 1'b0;
//assign vdsp_vfpu_pipe7_ex1_delay_pipe_down = 1'b0;

//for coverage
// &ModuleEnd; @412
endmodule


