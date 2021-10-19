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
module ct_iu_top(
  cp0_iu_div_entry_disable,
  cp0_iu_div_entry_disable_clr,
  cp0_iu_ex3_abnormal,
  cp0_iu_ex3_efpc,
  cp0_iu_ex3_efpc_vld,
  cp0_iu_ex3_expt_vec,
  cp0_iu_ex3_expt_vld,
  cp0_iu_ex3_flush,
  cp0_iu_ex3_iid,
  cp0_iu_ex3_inst_vld,
  cp0_iu_ex3_mtval,
  cp0_iu_ex3_rslt_data,
  cp0_iu_ex3_rslt_preg,
  cp0_iu_ex3_rslt_vld,
  cp0_iu_icg_en,
  cp0_iu_vill,
  cp0_iu_vl,
  cp0_iu_vsetvli_pre_decd_disable,
  cp0_iu_vstart,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  idu_iu_is_div_gateclk_issue,
  idu_iu_is_div_issue,
  idu_iu_is_pcfifo_inst_num,
  idu_iu_is_pcfifo_inst_vld,
  idu_iu_rf_bju_gateclk_sel,
  idu_iu_rf_bju_sel,
  idu_iu_rf_div_gateclk_sel,
  idu_iu_rf_div_sel,
  idu_iu_rf_mult_gateclk_sel,
  idu_iu_rf_mult_sel,
  idu_iu_rf_pipe0_alu_short,
  idu_iu_rf_pipe0_cbus_gateclk_sel,
  idu_iu_rf_pipe0_dst_preg,
  idu_iu_rf_pipe0_dst_vld,
  idu_iu_rf_pipe0_dst_vreg,
  idu_iu_rf_pipe0_dstv_vld,
  idu_iu_rf_pipe0_expt_vec,
  idu_iu_rf_pipe0_expt_vld,
  idu_iu_rf_pipe0_func,
  idu_iu_rf_pipe0_gateclk_sel,
  idu_iu_rf_pipe0_high_hw_expt,
  idu_iu_rf_pipe0_iid,
  idu_iu_rf_pipe0_imm,
  idu_iu_rf_pipe0_opcode,
  idu_iu_rf_pipe0_pid,
  idu_iu_rf_pipe0_rslt_sel,
  idu_iu_rf_pipe0_sel,
  idu_iu_rf_pipe0_special_imm,
  idu_iu_rf_pipe0_src0,
  idu_iu_rf_pipe0_src1,
  idu_iu_rf_pipe0_src1_no_imm,
  idu_iu_rf_pipe0_src2,
  idu_iu_rf_pipe0_vl,
  idu_iu_rf_pipe0_vlmul,
  idu_iu_rf_pipe0_vsew,
  idu_iu_rf_pipe1_alu_short,
  idu_iu_rf_pipe1_cbus_gateclk_sel,
  idu_iu_rf_pipe1_dst_preg,
  idu_iu_rf_pipe1_dst_vld,
  idu_iu_rf_pipe1_dst_vreg,
  idu_iu_rf_pipe1_dstv_vld,
  idu_iu_rf_pipe1_func,
  idu_iu_rf_pipe1_gateclk_sel,
  idu_iu_rf_pipe1_iid,
  idu_iu_rf_pipe1_imm,
  idu_iu_rf_pipe1_mla_src2_preg,
  idu_iu_rf_pipe1_mla_src2_vld,
  idu_iu_rf_pipe1_mult_func,
  idu_iu_rf_pipe1_rslt_sel,
  idu_iu_rf_pipe1_sel,
  idu_iu_rf_pipe1_src0,
  idu_iu_rf_pipe1_src1,
  idu_iu_rf_pipe1_src1_no_imm,
  idu_iu_rf_pipe1_src2,
  idu_iu_rf_pipe1_vl,
  idu_iu_rf_pipe1_vlmul,
  idu_iu_rf_pipe1_vsew,
  idu_iu_rf_pipe2_func,
  idu_iu_rf_pipe2_iid,
  idu_iu_rf_pipe2_length,
  idu_iu_rf_pipe2_offset,
  idu_iu_rf_pipe2_pcall,
  idu_iu_rf_pipe2_pid,
  idu_iu_rf_pipe2_rts,
  idu_iu_rf_pipe2_src0,
  idu_iu_rf_pipe2_src1,
  idu_iu_rf_pipe2_vl,
  idu_iu_rf_pipe2_vlmul,
  idu_iu_rf_pipe2_vsew,
  idu_iu_rf_special_gateclk_sel,
  idu_iu_rf_special_sel,
  ifu_iu_pcfifo_create0_bht_pred,
  ifu_iu_pcfifo_create0_chk_idx,
  ifu_iu_pcfifo_create0_cur_pc,
  ifu_iu_pcfifo_create0_dst_vld,
  ifu_iu_pcfifo_create0_en,
  ifu_iu_pcfifo_create0_gateclk_en,
  ifu_iu_pcfifo_create0_jal,
  ifu_iu_pcfifo_create0_jalr,
  ifu_iu_pcfifo_create0_jmp_mispred,
  ifu_iu_pcfifo_create0_tar_pc,
  ifu_iu_pcfifo_create1_bht_pred,
  ifu_iu_pcfifo_create1_chk_idx,
  ifu_iu_pcfifo_create1_cur_pc,
  ifu_iu_pcfifo_create1_dst_vld,
  ifu_iu_pcfifo_create1_en,
  ifu_iu_pcfifo_create1_gateclk_en,
  ifu_iu_pcfifo_create1_jal,
  ifu_iu_pcfifo_create1_jalr,
  ifu_iu_pcfifo_create1_jmp_mispred,
  ifu_iu_pcfifo_create1_tar_pc,
  iu_had_debug_info,
  iu_idu_div_busy,
  iu_idu_div_inst_vld,
  iu_idu_div_preg_dup0,
  iu_idu_div_preg_dup1,
  iu_idu_div_preg_dup2,
  iu_idu_div_preg_dup3,
  iu_idu_div_preg_dup4,
  iu_idu_div_wb_stall,
  iu_idu_ex1_pipe0_fwd_preg,
  iu_idu_ex1_pipe0_fwd_preg_data,
  iu_idu_ex1_pipe0_fwd_preg_vld,
  iu_idu_ex1_pipe1_fwd_preg,
  iu_idu_ex1_pipe1_fwd_preg_data,
  iu_idu_ex1_pipe1_fwd_preg_vld,
  iu_idu_ex1_pipe1_mult_stall,
  iu_idu_ex2_pipe0_wb_preg,
  iu_idu_ex2_pipe0_wb_preg_data,
  iu_idu_ex2_pipe0_wb_preg_dup0,
  iu_idu_ex2_pipe0_wb_preg_dup1,
  iu_idu_ex2_pipe0_wb_preg_dup2,
  iu_idu_ex2_pipe0_wb_preg_dup3,
  iu_idu_ex2_pipe0_wb_preg_dup4,
  iu_idu_ex2_pipe0_wb_preg_expand,
  iu_idu_ex2_pipe0_wb_preg_vld,
  iu_idu_ex2_pipe0_wb_preg_vld_dup0,
  iu_idu_ex2_pipe0_wb_preg_vld_dup1,
  iu_idu_ex2_pipe0_wb_preg_vld_dup2,
  iu_idu_ex2_pipe0_wb_preg_vld_dup3,
  iu_idu_ex2_pipe0_wb_preg_vld_dup4,
  iu_idu_ex2_pipe1_mult_inst_vld_dup0,
  iu_idu_ex2_pipe1_mult_inst_vld_dup1,
  iu_idu_ex2_pipe1_mult_inst_vld_dup2,
  iu_idu_ex2_pipe1_mult_inst_vld_dup3,
  iu_idu_ex2_pipe1_mult_inst_vld_dup4,
  iu_idu_ex2_pipe1_preg_dup0,
  iu_idu_ex2_pipe1_preg_dup1,
  iu_idu_ex2_pipe1_preg_dup2,
  iu_idu_ex2_pipe1_preg_dup3,
  iu_idu_ex2_pipe1_preg_dup4,
  iu_idu_ex2_pipe1_wb_preg,
  iu_idu_ex2_pipe1_wb_preg_data,
  iu_idu_ex2_pipe1_wb_preg_dup0,
  iu_idu_ex2_pipe1_wb_preg_dup1,
  iu_idu_ex2_pipe1_wb_preg_dup2,
  iu_idu_ex2_pipe1_wb_preg_dup3,
  iu_idu_ex2_pipe1_wb_preg_dup4,
  iu_idu_ex2_pipe1_wb_preg_expand,
  iu_idu_ex2_pipe1_wb_preg_vld,
  iu_idu_ex2_pipe1_wb_preg_vld_dup0,
  iu_idu_ex2_pipe1_wb_preg_vld_dup1,
  iu_idu_ex2_pipe1_wb_preg_vld_dup2,
  iu_idu_ex2_pipe1_wb_preg_vld_dup3,
  iu_idu_ex2_pipe1_wb_preg_vld_dup4,
  iu_idu_mispred_stall,
  iu_idu_pcfifo_dis_inst0_pid,
  iu_idu_pcfifo_dis_inst1_pid,
  iu_idu_pcfifo_dis_inst2_pid,
  iu_idu_pcfifo_dis_inst3_pid,
  iu_idu_pipe1_mla_src2_no_fwd,
  iu_ifu_bht_check_vld,
  iu_ifu_bht_condbr_taken,
  iu_ifu_bht_pred,
  iu_ifu_chgflw_pc,
  iu_ifu_chgflw_vl,
  iu_ifu_chgflw_vld,
  iu_ifu_chgflw_vlmul,
  iu_ifu_chgflw_vsew,
  iu_ifu_chk_idx,
  iu_ifu_cur_pc,
  iu_ifu_mispred_stall,
  iu_ifu_pcfifo_full,
  iu_rtu_ex2_pipe0_wb_preg_expand,
  iu_rtu_ex2_pipe0_wb_preg_vld,
  iu_rtu_ex2_pipe1_wb_preg_expand,
  iu_rtu_ex2_pipe1_wb_preg_vld,
  iu_rtu_pcfifo_pop0_data,
  iu_rtu_pcfifo_pop1_data,
  iu_rtu_pcfifo_pop2_data,
  iu_rtu_pipe0_abnormal,
  iu_rtu_pipe0_bkpt,
  iu_rtu_pipe0_cmplt,
  iu_rtu_pipe0_efpc,
  iu_rtu_pipe0_efpc_vld,
  iu_rtu_pipe0_expt_vec,
  iu_rtu_pipe0_expt_vld,
  iu_rtu_pipe0_flush,
  iu_rtu_pipe0_high_hw_expt,
  iu_rtu_pipe0_iid,
  iu_rtu_pipe0_immu_expt,
  iu_rtu_pipe0_mtval,
  iu_rtu_pipe0_vsetvl,
  iu_rtu_pipe0_vstart,
  iu_rtu_pipe0_vstart_vld,
  iu_rtu_pipe1_cmplt,
  iu_rtu_pipe1_iid,
  iu_rtu_pipe2_abnormal,
  iu_rtu_pipe2_bht_mispred,
  iu_rtu_pipe2_cmplt,
  iu_rtu_pipe2_iid,
  iu_rtu_pipe2_jmp_mispred,
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
  iu_yy_xx_cancel,
  mmu_xx_mmu_en,
  pad_yy_icg_scan_en,
  rtu_iu_flush_chgflw_mask,
  rtu_iu_flush_fe,
  rtu_iu_rob_read0_pcfifo_vld,
  rtu_iu_rob_read1_pcfifo_vld,
  rtu_iu_rob_read2_pcfifo_vld,
  rtu_iu_rob_read_pcfifo_gateclk_vld,
  rtu_yy_xx_flush,
  vfpu_iu_ex2_pipe6_mfvr_data,
  vfpu_iu_ex2_pipe6_mfvr_data_vld,
  vfpu_iu_ex2_pipe6_mfvr_preg,
  vfpu_iu_ex2_pipe7_mfvr_data,
  vfpu_iu_ex2_pipe7_mfvr_data_vld,
  vfpu_iu_ex2_pipe7_mfvr_preg
);

// &Ports; @25
input           cp0_iu_div_entry_disable;           
input           cp0_iu_div_entry_disable_clr;       
input           cp0_iu_ex3_abnormal;                
input   [38:0]  cp0_iu_ex3_efpc;                    
input           cp0_iu_ex3_efpc_vld;                
input   [4 :0]  cp0_iu_ex3_expt_vec;                
input           cp0_iu_ex3_expt_vld;                
input           cp0_iu_ex3_flush;                   
input   [6 :0]  cp0_iu_ex3_iid;                     
input           cp0_iu_ex3_inst_vld;                
input   [31:0]  cp0_iu_ex3_mtval;                   
input   [63:0]  cp0_iu_ex3_rslt_data;               
input   [6 :0]  cp0_iu_ex3_rslt_preg;               
input           cp0_iu_ex3_rslt_vld;                
input           cp0_iu_icg_en;                      
input           cp0_iu_vill;                        
input   [7 :0]  cp0_iu_vl;                          
input           cp0_iu_vsetvli_pre_decd_disable;    
input   [6 :0]  cp0_iu_vstart;                      
input           cp0_yy_clk_en;                      
input   [1 :0]  cp0_yy_priv_mode;                   
input           cpurst_b;                           
input           forever_cpuclk;                     
input   [63:0]  had_idu_wbbr_data;                  
input           had_idu_wbbr_vld;                   
input           idu_iu_is_div_gateclk_issue;        
input           idu_iu_is_div_issue;                
input   [2 :0]  idu_iu_is_pcfifo_inst_num;          
input           idu_iu_is_pcfifo_inst_vld;          
input           idu_iu_rf_bju_gateclk_sel;          
input           idu_iu_rf_bju_sel;                  
input           idu_iu_rf_div_gateclk_sel;          
input           idu_iu_rf_div_sel;                  
input           idu_iu_rf_mult_gateclk_sel;         
input           idu_iu_rf_mult_sel;                 
input           idu_iu_rf_pipe0_alu_short;          
input           idu_iu_rf_pipe0_cbus_gateclk_sel;   
input   [6 :0]  idu_iu_rf_pipe0_dst_preg;           
input           idu_iu_rf_pipe0_dst_vld;            
input   [6 :0]  idu_iu_rf_pipe0_dst_vreg;           
input           idu_iu_rf_pipe0_dstv_vld;           
input   [4 :0]  idu_iu_rf_pipe0_expt_vec;           
input           idu_iu_rf_pipe0_expt_vld;           
input   [4 :0]  idu_iu_rf_pipe0_func;               
input           idu_iu_rf_pipe0_gateclk_sel;        
input           idu_iu_rf_pipe0_high_hw_expt;       
input   [6 :0]  idu_iu_rf_pipe0_iid;                
input   [5 :0]  idu_iu_rf_pipe0_imm;                
input   [31:0]  idu_iu_rf_pipe0_opcode;             
input   [4 :0]  idu_iu_rf_pipe0_pid;                
input   [20:0]  idu_iu_rf_pipe0_rslt_sel;           
input           idu_iu_rf_pipe0_sel;                
input   [19:0]  idu_iu_rf_pipe0_special_imm;        
input   [63:0]  idu_iu_rf_pipe0_src0;               
input   [63:0]  idu_iu_rf_pipe0_src1;               
input   [63:0]  idu_iu_rf_pipe0_src1_no_imm;        
input   [63:0]  idu_iu_rf_pipe0_src2;               
input   [7 :0]  idu_iu_rf_pipe0_vl;                 
input   [1 :0]  idu_iu_rf_pipe0_vlmul;              
input   [2 :0]  idu_iu_rf_pipe0_vsew;               
input           idu_iu_rf_pipe1_alu_short;          
input           idu_iu_rf_pipe1_cbus_gateclk_sel;   
input   [6 :0]  idu_iu_rf_pipe1_dst_preg;           
input           idu_iu_rf_pipe1_dst_vld;            
input   [6 :0]  idu_iu_rf_pipe1_dst_vreg;           
input           idu_iu_rf_pipe1_dstv_vld;           
input   [4 :0]  idu_iu_rf_pipe1_func;               
input           idu_iu_rf_pipe1_gateclk_sel;        
input   [6 :0]  idu_iu_rf_pipe1_iid;                
input   [5 :0]  idu_iu_rf_pipe1_imm;                
input   [6 :0]  idu_iu_rf_pipe1_mla_src2_preg;      
input           idu_iu_rf_pipe1_mla_src2_vld;       
input   [7 :0]  idu_iu_rf_pipe1_mult_func;          
input   [20:0]  idu_iu_rf_pipe1_rslt_sel;           
input           idu_iu_rf_pipe1_sel;                
input   [63:0]  idu_iu_rf_pipe1_src0;               
input   [63:0]  idu_iu_rf_pipe1_src1;               
input   [63:0]  idu_iu_rf_pipe1_src1_no_imm;        
input   [63:0]  idu_iu_rf_pipe1_src2;               
input   [7 :0]  idu_iu_rf_pipe1_vl;                 
input   [1 :0]  idu_iu_rf_pipe1_vlmul;              
input   [2 :0]  idu_iu_rf_pipe1_vsew;               
input   [7 :0]  idu_iu_rf_pipe2_func;               
input   [6 :0]  idu_iu_rf_pipe2_iid;                
input           idu_iu_rf_pipe2_length;             
input   [20:0]  idu_iu_rf_pipe2_offset;             
input           idu_iu_rf_pipe2_pcall;              
input   [4 :0]  idu_iu_rf_pipe2_pid;                
input           idu_iu_rf_pipe2_rts;                
input   [63:0]  idu_iu_rf_pipe2_src0;               
input   [63:0]  idu_iu_rf_pipe2_src1;               
input   [7 :0]  idu_iu_rf_pipe2_vl;                 
input   [1 :0]  idu_iu_rf_pipe2_vlmul;              
input   [2 :0]  idu_iu_rf_pipe2_vsew;               
input           idu_iu_rf_special_gateclk_sel;      
input           idu_iu_rf_special_sel;              
input           ifu_iu_pcfifo_create0_bht_pred;     
input   [24:0]  ifu_iu_pcfifo_create0_chk_idx;      
input   [39:0]  ifu_iu_pcfifo_create0_cur_pc;       
input           ifu_iu_pcfifo_create0_dst_vld;      
input           ifu_iu_pcfifo_create0_en;           
input           ifu_iu_pcfifo_create0_gateclk_en;   
input           ifu_iu_pcfifo_create0_jal;          
input           ifu_iu_pcfifo_create0_jalr;         
input           ifu_iu_pcfifo_create0_jmp_mispred;  
input   [39:0]  ifu_iu_pcfifo_create0_tar_pc;       
input           ifu_iu_pcfifo_create1_bht_pred;     
input   [24:0]  ifu_iu_pcfifo_create1_chk_idx;      
input   [39:0]  ifu_iu_pcfifo_create1_cur_pc;       
input           ifu_iu_pcfifo_create1_dst_vld;      
input           ifu_iu_pcfifo_create1_en;           
input           ifu_iu_pcfifo_create1_gateclk_en;   
input           ifu_iu_pcfifo_create1_jal;          
input           ifu_iu_pcfifo_create1_jalr;         
input           ifu_iu_pcfifo_create1_jmp_mispred;  
input   [39:0]  ifu_iu_pcfifo_create1_tar_pc;       
input           mmu_xx_mmu_en;                      
input           pad_yy_icg_scan_en;                 
input           rtu_iu_flush_chgflw_mask;           
input           rtu_iu_flush_fe;                    
input           rtu_iu_rob_read0_pcfifo_vld;        
input           rtu_iu_rob_read1_pcfifo_vld;        
input           rtu_iu_rob_read2_pcfifo_vld;        
input           rtu_iu_rob_read_pcfifo_gateclk_vld; 
input           rtu_yy_xx_flush;                    
input   [63:0]  vfpu_iu_ex2_pipe6_mfvr_data;        
input           vfpu_iu_ex2_pipe6_mfvr_data_vld;    
input   [6 :0]  vfpu_iu_ex2_pipe6_mfvr_preg;        
input   [63:0]  vfpu_iu_ex2_pipe7_mfvr_data;        
input           vfpu_iu_ex2_pipe7_mfvr_data_vld;    
input   [6 :0]  vfpu_iu_ex2_pipe7_mfvr_preg;        
output  [9 :0]  iu_had_debug_info;                  
output          iu_idu_div_busy;                    
output          iu_idu_div_inst_vld;                
output  [6 :0]  iu_idu_div_preg_dup0;               
output  [6 :0]  iu_idu_div_preg_dup1;               
output  [6 :0]  iu_idu_div_preg_dup2;               
output  [6 :0]  iu_idu_div_preg_dup3;               
output  [6 :0]  iu_idu_div_preg_dup4;               
output          iu_idu_div_wb_stall;                
output  [6 :0]  iu_idu_ex1_pipe0_fwd_preg;          
output  [63:0]  iu_idu_ex1_pipe0_fwd_preg_data;     
output          iu_idu_ex1_pipe0_fwd_preg_vld;      
output  [6 :0]  iu_idu_ex1_pipe1_fwd_preg;          
output  [63:0]  iu_idu_ex1_pipe1_fwd_preg_data;     
output          iu_idu_ex1_pipe1_fwd_preg_vld;      
output          iu_idu_ex1_pipe1_mult_stall;        
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg;           
output  [63:0]  iu_idu_ex2_pipe0_wb_preg_data;      
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup0;      
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup1;      
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup2;      
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup3;      
output  [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup4;      
output  [95:0]  iu_idu_ex2_pipe0_wb_preg_expand;    
output          iu_idu_ex2_pipe0_wb_preg_vld;       
output          iu_idu_ex2_pipe0_wb_preg_vld_dup0;  
output          iu_idu_ex2_pipe0_wb_preg_vld_dup1;  
output          iu_idu_ex2_pipe0_wb_preg_vld_dup2;  
output          iu_idu_ex2_pipe0_wb_preg_vld_dup3;  
output          iu_idu_ex2_pipe0_wb_preg_vld_dup4;  
output          iu_idu_ex2_pipe1_mult_inst_vld_dup0; 
output          iu_idu_ex2_pipe1_mult_inst_vld_dup1; 
output          iu_idu_ex2_pipe1_mult_inst_vld_dup2; 
output          iu_idu_ex2_pipe1_mult_inst_vld_dup3; 
output          iu_idu_ex2_pipe1_mult_inst_vld_dup4; 
output  [6 :0]  iu_idu_ex2_pipe1_preg_dup0;         
output  [6 :0]  iu_idu_ex2_pipe1_preg_dup1;         
output  [6 :0]  iu_idu_ex2_pipe1_preg_dup2;         
output  [6 :0]  iu_idu_ex2_pipe1_preg_dup3;         
output  [6 :0]  iu_idu_ex2_pipe1_preg_dup4;         
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg;           
output  [63:0]  iu_idu_ex2_pipe1_wb_preg_data;      
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup0;      
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup1;      
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup2;      
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup3;      
output  [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup4;      
output  [95:0]  iu_idu_ex2_pipe1_wb_preg_expand;    
output          iu_idu_ex2_pipe1_wb_preg_vld;       
output          iu_idu_ex2_pipe1_wb_preg_vld_dup0;  
output          iu_idu_ex2_pipe1_wb_preg_vld_dup1;  
output          iu_idu_ex2_pipe1_wb_preg_vld_dup2;  
output          iu_idu_ex2_pipe1_wb_preg_vld_dup3;  
output          iu_idu_ex2_pipe1_wb_preg_vld_dup4;  
output          iu_idu_mispred_stall;               
output  [4 :0]  iu_idu_pcfifo_dis_inst0_pid;        
output  [4 :0]  iu_idu_pcfifo_dis_inst1_pid;        
output  [4 :0]  iu_idu_pcfifo_dis_inst2_pid;        
output  [4 :0]  iu_idu_pcfifo_dis_inst3_pid;        
output          iu_idu_pipe1_mla_src2_no_fwd;       
output          iu_ifu_bht_check_vld;               
output          iu_ifu_bht_condbr_taken;            
output          iu_ifu_bht_pred;                    
output  [62:0]  iu_ifu_chgflw_pc;                   
output  [7 :0]  iu_ifu_chgflw_vl;                   
output          iu_ifu_chgflw_vld;                  
output  [1 :0]  iu_ifu_chgflw_vlmul;                
output  [2 :0]  iu_ifu_chgflw_vsew;                 
output  [24:0]  iu_ifu_chk_idx;                     
output  [38:0]  iu_ifu_cur_pc;                      
output          iu_ifu_mispred_stall;               
output          iu_ifu_pcfifo_full;                 
output  [95:0]  iu_rtu_ex2_pipe0_wb_preg_expand;    
output          iu_rtu_ex2_pipe0_wb_preg_vld;       
output  [95:0]  iu_rtu_ex2_pipe1_wb_preg_expand;    
output          iu_rtu_ex2_pipe1_wb_preg_vld;       
output  [47:0]  iu_rtu_pcfifo_pop0_data;            
output  [47:0]  iu_rtu_pcfifo_pop1_data;            
output  [47:0]  iu_rtu_pcfifo_pop2_data;            
output          iu_rtu_pipe0_abnormal;              
output          iu_rtu_pipe0_bkpt;                  
output          iu_rtu_pipe0_cmplt;                 
output  [38:0]  iu_rtu_pipe0_efpc;                  
output          iu_rtu_pipe0_efpc_vld;              
output  [4 :0]  iu_rtu_pipe0_expt_vec;              
output          iu_rtu_pipe0_expt_vld;              
output          iu_rtu_pipe0_flush;                 
output          iu_rtu_pipe0_high_hw_expt;          
output  [6 :0]  iu_rtu_pipe0_iid;                   
output          iu_rtu_pipe0_immu_expt;             
output  [31:0]  iu_rtu_pipe0_mtval;                 
output          iu_rtu_pipe0_vsetvl;                
output  [6 :0]  iu_rtu_pipe0_vstart;                
output          iu_rtu_pipe0_vstart_vld;            
output          iu_rtu_pipe1_cmplt;                 
output  [6 :0]  iu_rtu_pipe1_iid;                   
output          iu_rtu_pipe2_abnormal;              
output          iu_rtu_pipe2_bht_mispred;           
output          iu_rtu_pipe2_cmplt;                 
output  [6 :0]  iu_rtu_pipe2_iid;                   
output          iu_rtu_pipe2_jmp_mispred;           
output  [4 :0]  iu_vfpu_ex1_pipe0_mtvr_inst;        
output  [7 :0]  iu_vfpu_ex1_pipe0_mtvr_vl;          
output          iu_vfpu_ex1_pipe0_mtvr_vld;         
output  [1 :0]  iu_vfpu_ex1_pipe0_mtvr_vlmul;       
output  [6 :0]  iu_vfpu_ex1_pipe0_mtvr_vreg;        
output  [2 :0]  iu_vfpu_ex1_pipe0_mtvr_vsew;        
output  [4 :0]  iu_vfpu_ex1_pipe1_mtvr_inst;        
output  [7 :0]  iu_vfpu_ex1_pipe1_mtvr_vl;          
output          iu_vfpu_ex1_pipe1_mtvr_vld;         
output  [1 :0]  iu_vfpu_ex1_pipe1_mtvr_vlmul;       
output  [6 :0]  iu_vfpu_ex1_pipe1_mtvr_vreg;        
output  [2 :0]  iu_vfpu_ex1_pipe1_mtvr_vsew;        
output  [63:0]  iu_vfpu_ex2_pipe0_mtvr_src0;        
output          iu_vfpu_ex2_pipe0_mtvr_vld;         
output  [63:0]  iu_vfpu_ex2_pipe1_mtvr_src0;        
output          iu_vfpu_ex2_pipe1_mtvr_vld;         
output          iu_yy_xx_cancel;                    

// &Regs; @26

// &Wires; @27
wire    [63:0]  alu_rbus_ex1_pipe0_data;            
wire            alu_rbus_ex1_pipe0_data_vld;        
wire    [63:0]  alu_rbus_ex1_pipe0_fwd_data;        
wire            alu_rbus_ex1_pipe0_fwd_vld;         
wire    [6 :0]  alu_rbus_ex1_pipe0_preg;            
wire    [63:0]  alu_rbus_ex1_pipe1_data;            
wire            alu_rbus_ex1_pipe1_data_vld;        
wire    [63:0]  alu_rbus_ex1_pipe1_fwd_data;        
wire            alu_rbus_ex1_pipe1_fwd_vld;         
wire    [6 :0]  alu_rbus_ex1_pipe1_preg;            
wire            bju_cbus_ex2_pipe2_abnormal;        
wire            bju_cbus_ex2_pipe2_bht_mispred;     
wire    [6 :0]  bju_cbus_ex2_pipe2_iid;             
wire            bju_cbus_ex2_pipe2_jmp_mispred;     
wire            bju_cbus_ex2_pipe2_sel;             
wire    [39:0]  bju_special_pc;                     
wire    [6 :0]  bju_top_mispred_iid;                
wire            bju_top_pcfifo_full;                
wire            cp0_iu_div_entry_disable;           
wire            cp0_iu_div_entry_disable_clr;       
wire            cp0_iu_ex3_abnormal;                
wire    [38:0]  cp0_iu_ex3_efpc;                    
wire            cp0_iu_ex3_efpc_vld;                
wire    [4 :0]  cp0_iu_ex3_expt_vec;                
wire            cp0_iu_ex3_expt_vld;                
wire            cp0_iu_ex3_flush;                   
wire    [6 :0]  cp0_iu_ex3_iid;                     
wire            cp0_iu_ex3_inst_vld;                
wire    [31:0]  cp0_iu_ex3_mtval;                   
wire    [63:0]  cp0_iu_ex3_rslt_data;               
wire    [6 :0]  cp0_iu_ex3_rslt_preg;               
wire            cp0_iu_ex3_rslt_vld;                
wire            cp0_iu_icg_en;                      
wire            cp0_iu_vill;                        
wire    [7 :0]  cp0_iu_vl;                          
wire            cp0_iu_vsetvli_pre_decd_disable;    
wire    [6 :0]  cp0_iu_vstart;                      
wire            cp0_yy_clk_en;                      
wire    [1 :0]  cp0_yy_priv_mode;                   
wire            cpurst_b;                           
wire    [63:0]  div_rbus_data;                      
wire            div_rbus_pipe0_data_vld;            
wire    [6 :0]  div_rbus_preg;                      
wire            div_top_div_no_idle;                
wire            div_top_div_wf_wb;                  
wire            forever_cpuclk;                     
wire    [63:0]  had_idu_wbbr_data;                  
wire            had_idu_wbbr_vld;                   
wire            idu_iu_is_div_gateclk_issue;        
wire            idu_iu_is_div_issue;                
wire    [2 :0]  idu_iu_is_pcfifo_inst_num;          
wire            idu_iu_is_pcfifo_inst_vld;          
wire            idu_iu_rf_bju_gateclk_sel;          
wire            idu_iu_rf_bju_sel;                  
wire            idu_iu_rf_div_gateclk_sel;          
wire            idu_iu_rf_div_sel;                  
wire            idu_iu_rf_mult_gateclk_sel;         
wire            idu_iu_rf_mult_sel;                 
wire            idu_iu_rf_pipe0_alu_short;          
wire            idu_iu_rf_pipe0_cbus_gateclk_sel;   
wire    [6 :0]  idu_iu_rf_pipe0_dst_preg;           
wire            idu_iu_rf_pipe0_dst_vld;            
wire    [6 :0]  idu_iu_rf_pipe0_dst_vreg;           
wire            idu_iu_rf_pipe0_dstv_vld;           
wire    [4 :0]  idu_iu_rf_pipe0_expt_vec;           
wire            idu_iu_rf_pipe0_expt_vld;           
wire    [4 :0]  idu_iu_rf_pipe0_func;               
wire            idu_iu_rf_pipe0_gateclk_sel;        
wire            idu_iu_rf_pipe0_high_hw_expt;       
wire    [6 :0]  idu_iu_rf_pipe0_iid;                
wire    [5 :0]  idu_iu_rf_pipe0_imm;                
wire    [31:0]  idu_iu_rf_pipe0_opcode;             
wire    [4 :0]  idu_iu_rf_pipe0_pid;                
wire    [20:0]  idu_iu_rf_pipe0_rslt_sel;           
wire            idu_iu_rf_pipe0_sel;                
wire    [19:0]  idu_iu_rf_pipe0_special_imm;        
wire    [63:0]  idu_iu_rf_pipe0_src0;               
wire    [63:0]  idu_iu_rf_pipe0_src1;               
wire    [63:0]  idu_iu_rf_pipe0_src1_no_imm;        
wire    [63:0]  idu_iu_rf_pipe0_src2;               
wire    [7 :0]  idu_iu_rf_pipe0_vl;                 
wire    [1 :0]  idu_iu_rf_pipe0_vlmul;              
wire    [2 :0]  idu_iu_rf_pipe0_vsew;               
wire            idu_iu_rf_pipe1_alu_short;          
wire            idu_iu_rf_pipe1_cbus_gateclk_sel;   
wire    [6 :0]  idu_iu_rf_pipe1_dst_preg;           
wire            idu_iu_rf_pipe1_dst_vld;            
wire    [6 :0]  idu_iu_rf_pipe1_dst_vreg;           
wire            idu_iu_rf_pipe1_dstv_vld;           
wire    [4 :0]  idu_iu_rf_pipe1_func;               
wire            idu_iu_rf_pipe1_gateclk_sel;        
wire    [6 :0]  idu_iu_rf_pipe1_iid;                
wire    [5 :0]  idu_iu_rf_pipe1_imm;                
wire    [6 :0]  idu_iu_rf_pipe1_mla_src2_preg;      
wire            idu_iu_rf_pipe1_mla_src2_vld;       
wire    [7 :0]  idu_iu_rf_pipe1_mult_func;          
wire    [20:0]  idu_iu_rf_pipe1_rslt_sel;           
wire            idu_iu_rf_pipe1_sel;                
wire    [63:0]  idu_iu_rf_pipe1_src0;               
wire    [63:0]  idu_iu_rf_pipe1_src1;               
wire    [63:0]  idu_iu_rf_pipe1_src1_no_imm;        
wire    [63:0]  idu_iu_rf_pipe1_src2;               
wire    [7 :0]  idu_iu_rf_pipe1_vl;                 
wire    [1 :0]  idu_iu_rf_pipe1_vlmul;              
wire    [2 :0]  idu_iu_rf_pipe1_vsew;               
wire    [7 :0]  idu_iu_rf_pipe2_func;               
wire    [6 :0]  idu_iu_rf_pipe2_iid;                
wire            idu_iu_rf_pipe2_length;             
wire    [20:0]  idu_iu_rf_pipe2_offset;             
wire            idu_iu_rf_pipe2_pcall;              
wire    [4 :0]  idu_iu_rf_pipe2_pid;                
wire            idu_iu_rf_pipe2_rts;                
wire    [63:0]  idu_iu_rf_pipe2_src0;               
wire    [63:0]  idu_iu_rf_pipe2_src1;               
wire    [7 :0]  idu_iu_rf_pipe2_vl;                 
wire    [1 :0]  idu_iu_rf_pipe2_vlmul;              
wire    [2 :0]  idu_iu_rf_pipe2_vsew;               
wire            idu_iu_rf_special_gateclk_sel;      
wire            idu_iu_rf_special_sel;              
wire            ifu_iu_pcfifo_create0_bht_pred;     
wire    [24:0]  ifu_iu_pcfifo_create0_chk_idx;      
wire    [39:0]  ifu_iu_pcfifo_create0_cur_pc;       
wire            ifu_iu_pcfifo_create0_dst_vld;      
wire            ifu_iu_pcfifo_create0_en;           
wire            ifu_iu_pcfifo_create0_gateclk_en;   
wire            ifu_iu_pcfifo_create0_jal;          
wire            ifu_iu_pcfifo_create0_jalr;         
wire            ifu_iu_pcfifo_create0_jmp_mispred;  
wire    [39:0]  ifu_iu_pcfifo_create0_tar_pc;       
wire            ifu_iu_pcfifo_create1_bht_pred;     
wire    [24:0]  ifu_iu_pcfifo_create1_chk_idx;      
wire    [39:0]  ifu_iu_pcfifo_create1_cur_pc;       
wire            ifu_iu_pcfifo_create1_dst_vld;      
wire            ifu_iu_pcfifo_create1_en;           
wire            ifu_iu_pcfifo_create1_gateclk_en;   
wire            ifu_iu_pcfifo_create1_jal;          
wire            ifu_iu_pcfifo_create1_jalr;         
wire            ifu_iu_pcfifo_create1_jmp_mispred;  
wire    [39:0]  ifu_iu_pcfifo_create1_tar_pc;       
wire    [9 :0]  iu_had_debug_info;                  
wire            iu_idu_div_busy;                    
wire            iu_idu_div_inst_vld;                
wire    [6 :0]  iu_idu_div_preg_dup0;               
wire    [6 :0]  iu_idu_div_preg_dup1;               
wire    [6 :0]  iu_idu_div_preg_dup2;               
wire    [6 :0]  iu_idu_div_preg_dup3;               
wire    [6 :0]  iu_idu_div_preg_dup4;               
wire            iu_idu_div_wb_stall;                
wire    [6 :0]  iu_idu_ex1_pipe0_fwd_preg;          
wire    [63:0]  iu_idu_ex1_pipe0_fwd_preg_data;     
wire            iu_idu_ex1_pipe0_fwd_preg_vld;      
wire    [6 :0]  iu_idu_ex1_pipe1_fwd_preg;          
wire    [63:0]  iu_idu_ex1_pipe1_fwd_preg_data;     
wire            iu_idu_ex1_pipe1_fwd_preg_vld;      
wire            iu_idu_ex1_pipe1_mult_stall;        
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg;           
wire    [63:0]  iu_idu_ex2_pipe0_wb_preg_data;      
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup0;      
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup1;      
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup2;      
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup3;      
wire    [6 :0]  iu_idu_ex2_pipe0_wb_preg_dup4;      
wire    [95:0]  iu_idu_ex2_pipe0_wb_preg_expand;    
wire            iu_idu_ex2_pipe0_wb_preg_vld;       
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup0;  
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup1;  
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup2;  
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup3;  
wire            iu_idu_ex2_pipe0_wb_preg_vld_dup4;  
wire            iu_idu_ex2_pipe1_mult_inst_vld_dup0; 
wire            iu_idu_ex2_pipe1_mult_inst_vld_dup1; 
wire            iu_idu_ex2_pipe1_mult_inst_vld_dup2; 
wire            iu_idu_ex2_pipe1_mult_inst_vld_dup3; 
wire            iu_idu_ex2_pipe1_mult_inst_vld_dup4; 
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dup0;         
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dup1;         
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dup2;         
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dup3;         
wire    [6 :0]  iu_idu_ex2_pipe1_preg_dup4;         
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg;           
wire    [63:0]  iu_idu_ex2_pipe1_wb_preg_data;      
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup0;      
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup1;      
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup2;      
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup3;      
wire    [6 :0]  iu_idu_ex2_pipe1_wb_preg_dup4;      
wire    [95:0]  iu_idu_ex2_pipe1_wb_preg_expand;    
wire            iu_idu_ex2_pipe1_wb_preg_vld;       
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup0;  
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup1;  
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup2;  
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup3;  
wire            iu_idu_ex2_pipe1_wb_preg_vld_dup4;  
wire            iu_idu_mispred_stall;               
wire    [4 :0]  iu_idu_pcfifo_dis_inst0_pid;        
wire    [4 :0]  iu_idu_pcfifo_dis_inst1_pid;        
wire    [4 :0]  iu_idu_pcfifo_dis_inst2_pid;        
wire    [4 :0]  iu_idu_pcfifo_dis_inst3_pid;        
wire            iu_idu_pipe1_mla_src2_no_fwd;       
wire            iu_ifu_bht_check_vld;               
wire            iu_ifu_bht_condbr_taken;            
wire            iu_ifu_bht_pred;                    
wire    [62:0]  iu_ifu_chgflw_pc;                   
wire    [7 :0]  iu_ifu_chgflw_vl;                   
wire            iu_ifu_chgflw_vld;                  
wire    [1 :0]  iu_ifu_chgflw_vlmul;                
wire    [2 :0]  iu_ifu_chgflw_vsew;                 
wire    [24:0]  iu_ifu_chk_idx;                     
wire    [38:0]  iu_ifu_cur_pc;                      
wire            iu_ifu_mispred_stall;               
wire            iu_ifu_pcfifo_full;                 
wire    [95:0]  iu_rtu_ex2_pipe0_wb_preg_expand;    
wire            iu_rtu_ex2_pipe0_wb_preg_vld;       
wire    [95:0]  iu_rtu_ex2_pipe1_wb_preg_expand;    
wire            iu_rtu_ex2_pipe1_wb_preg_vld;       
wire    [47:0]  iu_rtu_pcfifo_pop0_data;            
wire    [47:0]  iu_rtu_pcfifo_pop1_data;            
wire    [47:0]  iu_rtu_pcfifo_pop2_data;            
wire            iu_rtu_pipe0_abnormal;              
wire            iu_rtu_pipe0_bkpt;                  
wire            iu_rtu_pipe0_cmplt;                 
wire    [38:0]  iu_rtu_pipe0_efpc;                  
wire            iu_rtu_pipe0_efpc_vld;              
wire    [4 :0]  iu_rtu_pipe0_expt_vec;              
wire            iu_rtu_pipe0_expt_vld;              
wire            iu_rtu_pipe0_flush;                 
wire            iu_rtu_pipe0_high_hw_expt;          
wire    [6 :0]  iu_rtu_pipe0_iid;                   
wire            iu_rtu_pipe0_immu_expt;             
wire    [31:0]  iu_rtu_pipe0_mtval;                 
wire            iu_rtu_pipe0_vsetvl;                
wire    [6 :0]  iu_rtu_pipe0_vstart;                
wire            iu_rtu_pipe0_vstart_vld;            
wire            iu_rtu_pipe1_cmplt;                 
wire    [6 :0]  iu_rtu_pipe1_iid;                   
wire            iu_rtu_pipe2_abnormal;              
wire            iu_rtu_pipe2_bht_mispred;           
wire            iu_rtu_pipe2_cmplt;                 
wire    [6 :0]  iu_rtu_pipe2_iid;                   
wire            iu_rtu_pipe2_jmp_mispred;           
wire    [4 :0]  iu_vfpu_ex1_pipe0_mtvr_inst;        
wire    [7 :0]  iu_vfpu_ex1_pipe0_mtvr_vl;          
wire            iu_vfpu_ex1_pipe0_mtvr_vld;         
wire    [1 :0]  iu_vfpu_ex1_pipe0_mtvr_vlmul;       
wire    [6 :0]  iu_vfpu_ex1_pipe0_mtvr_vreg;        
wire    [2 :0]  iu_vfpu_ex1_pipe0_mtvr_vsew;        
wire    [4 :0]  iu_vfpu_ex1_pipe1_mtvr_inst;        
wire    [7 :0]  iu_vfpu_ex1_pipe1_mtvr_vl;          
wire            iu_vfpu_ex1_pipe1_mtvr_vld;         
wire    [1 :0]  iu_vfpu_ex1_pipe1_mtvr_vlmul;       
wire    [6 :0]  iu_vfpu_ex1_pipe1_mtvr_vreg;        
wire    [2 :0]  iu_vfpu_ex1_pipe1_mtvr_vsew;        
wire    [63:0]  iu_vfpu_ex2_pipe0_mtvr_src0;        
wire            iu_vfpu_ex2_pipe0_mtvr_vld;         
wire    [63:0]  iu_vfpu_ex2_pipe1_mtvr_src0;        
wire            iu_vfpu_ex2_pipe1_mtvr_vld;         
wire            iu_yy_xx_cancel;                    
wire            mmu_xx_mmu_en;                      
wire            mult_rbus_ex3_data_vld;             
wire    [6 :0]  mult_rbus_ex3_preg;                 
wire    [63:0]  mult_rbus_ex4_data;                 
wire            mult_rbus_ex4_data_vld;             
wire            pad_yy_icg_scan_en;                 
wire            rtu_iu_flush_chgflw_mask;           
wire            rtu_iu_flush_fe;                    
wire            rtu_iu_rob_read0_pcfifo_vld;        
wire            rtu_iu_rob_read1_pcfifo_vld;        
wire            rtu_iu_rob_read2_pcfifo_vld;        
wire            rtu_iu_rob_read_pcfifo_gateclk_vld; 
wire            rtu_yy_xx_flush;                    
wire            special_cbus_ex1_abnormal;          
wire            special_cbus_ex1_bkpt;              
wire    [4 :0]  special_cbus_ex1_expt_vec;          
wire            special_cbus_ex1_expt_vld;          
wire            special_cbus_ex1_flush;             
wire            special_cbus_ex1_high_hw_expt;      
wire    [6 :0]  special_cbus_ex1_iid;               
wire            special_cbus_ex1_immu_expt;         
wire            special_cbus_ex1_inst_gateclk_vld;  
wire            special_cbus_ex1_inst_vld;          
wire    [31:0]  special_cbus_ex1_mtval;             
wire            special_cbus_ex1_vsetvl;            
wire    [6 :0]  special_cbus_ex1_vstart;            
wire            special_cbus_ex1_vstart_vld;        
wire    [63:0]  special_rbus_ex1_data;              
wire            special_rbus_ex1_data_vld;          
wire    [6 :0]  special_rbus_ex1_preg;              
wire    [63:0]  vfpu_iu_ex2_pipe6_mfvr_data;        
wire            vfpu_iu_ex2_pipe6_mfvr_data_vld;    
wire    [6 :0]  vfpu_iu_ex2_pipe6_mfvr_preg;        
wire    [63:0]  vfpu_iu_ex2_pipe7_mfvr_data;        
wire            vfpu_iu_ex2_pipe7_mfvr_data_vld;    
wire    [6 :0]  vfpu_iu_ex2_pipe7_mfvr_preg;        



parameter ALU_SEL = 21;

//==========================================================
//                       ALU Instance
//==========================================================
// &ConnRule(s/pipex/pipe0/); @35
// &Instance("ct_iu_alu", "x_ct_iu_alu0"); @36
ct_iu_alu  x_ct_iu_alu0 (
  .alu_rbus_ex1_pipex_data      (alu_rbus_ex1_pipe0_data     ),
  .alu_rbus_ex1_pipex_data_vld  (alu_rbus_ex1_pipe0_data_vld ),
  .alu_rbus_ex1_pipex_fwd_data  (alu_rbus_ex1_pipe0_fwd_data ),
  .alu_rbus_ex1_pipex_fwd_vld   (alu_rbus_ex1_pipe0_fwd_vld  ),
  .alu_rbus_ex1_pipex_preg      (alu_rbus_ex1_pipe0_preg     ),
  .cp0_iu_icg_en                (cp0_iu_icg_en               ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .had_idu_wbbr_data            (had_idu_wbbr_data           ),
  .had_idu_wbbr_vld             (had_idu_wbbr_vld            ),
  .idu_iu_rf_pipex_alu_short    (idu_iu_rf_pipe0_alu_short   ),
  .idu_iu_rf_pipex_dst_preg     (idu_iu_rf_pipe0_dst_preg    ),
  .idu_iu_rf_pipex_dst_vld      (idu_iu_rf_pipe0_dst_vld     ),
  .idu_iu_rf_pipex_dst_vreg     (idu_iu_rf_pipe0_dst_vreg    ),
  .idu_iu_rf_pipex_dstv_vld     (idu_iu_rf_pipe0_dstv_vld    ),
  .idu_iu_rf_pipex_func         (idu_iu_rf_pipe0_func        ),
  .idu_iu_rf_pipex_gateclk_sel  (idu_iu_rf_pipe0_gateclk_sel ),
  .idu_iu_rf_pipex_imm          (idu_iu_rf_pipe0_imm         ),
  .idu_iu_rf_pipex_rslt_sel     (idu_iu_rf_pipe0_rslt_sel    ),
  .idu_iu_rf_pipex_sel          (idu_iu_rf_pipe0_sel         ),
  .idu_iu_rf_pipex_src0         (idu_iu_rf_pipe0_src0        ),
  .idu_iu_rf_pipex_src1         (idu_iu_rf_pipe0_src1        ),
  .idu_iu_rf_pipex_src2         (idu_iu_rf_pipe0_src2        ),
  .idu_iu_rf_pipex_vl           (idu_iu_rf_pipe0_vl          ),
  .idu_iu_rf_pipex_vlmul        (idu_iu_rf_pipe0_vlmul       ),
  .idu_iu_rf_pipex_vsew         (idu_iu_rf_pipe0_vsew        ),
  .iu_vfpu_ex1_pipex_mtvr_inst  (iu_vfpu_ex1_pipe0_mtvr_inst ),
  .iu_vfpu_ex1_pipex_mtvr_vl    (iu_vfpu_ex1_pipe0_mtvr_vl   ),
  .iu_vfpu_ex1_pipex_mtvr_vld   (iu_vfpu_ex1_pipe0_mtvr_vld  ),
  .iu_vfpu_ex1_pipex_mtvr_vlmul (iu_vfpu_ex1_pipe0_mtvr_vlmul),
  .iu_vfpu_ex1_pipex_mtvr_vreg  (iu_vfpu_ex1_pipe0_mtvr_vreg ),
  .iu_vfpu_ex1_pipex_mtvr_vsew  (iu_vfpu_ex1_pipe0_mtvr_vsew ),
  .iu_vfpu_ex2_pipex_mtvr_src0  (iu_vfpu_ex2_pipe0_mtvr_src0 ),
  .iu_vfpu_ex2_pipex_mtvr_vld   (iu_vfpu_ex2_pipe0_mtvr_vld  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .rtu_yy_xx_flush              (rtu_yy_xx_flush             )
);

// &ConnRule(s/pipex/pipe1/); @37
// &Instance("ct_iu_alu", "x_ct_iu_alu1"); @38
ct_iu_alu  x_ct_iu_alu1 (
  .alu_rbus_ex1_pipex_data      (alu_rbus_ex1_pipe1_data     ),
  .alu_rbus_ex1_pipex_data_vld  (alu_rbus_ex1_pipe1_data_vld ),
  .alu_rbus_ex1_pipex_fwd_data  (alu_rbus_ex1_pipe1_fwd_data ),
  .alu_rbus_ex1_pipex_fwd_vld   (alu_rbus_ex1_pipe1_fwd_vld  ),
  .alu_rbus_ex1_pipex_preg      (alu_rbus_ex1_pipe1_preg     ),
  .cp0_iu_icg_en                (cp0_iu_icg_en               ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .had_idu_wbbr_data            (had_idu_wbbr_data           ),
  .had_idu_wbbr_vld             (had_idu_wbbr_vld            ),
  .idu_iu_rf_pipex_alu_short    (idu_iu_rf_pipe1_alu_short   ),
  .idu_iu_rf_pipex_dst_preg     (idu_iu_rf_pipe1_dst_preg    ),
  .idu_iu_rf_pipex_dst_vld      (idu_iu_rf_pipe1_dst_vld     ),
  .idu_iu_rf_pipex_dst_vreg     (idu_iu_rf_pipe1_dst_vreg    ),
  .idu_iu_rf_pipex_dstv_vld     (idu_iu_rf_pipe1_dstv_vld    ),
  .idu_iu_rf_pipex_func         (idu_iu_rf_pipe1_func        ),
  .idu_iu_rf_pipex_gateclk_sel  (idu_iu_rf_pipe1_gateclk_sel ),
  .idu_iu_rf_pipex_imm          (idu_iu_rf_pipe1_imm         ),
  .idu_iu_rf_pipex_rslt_sel     (idu_iu_rf_pipe1_rslt_sel    ),
  .idu_iu_rf_pipex_sel          (idu_iu_rf_pipe1_sel         ),
  .idu_iu_rf_pipex_src0         (idu_iu_rf_pipe1_src0        ),
  .idu_iu_rf_pipex_src1         (idu_iu_rf_pipe1_src1        ),
  .idu_iu_rf_pipex_src2         (idu_iu_rf_pipe1_src2        ),
  .idu_iu_rf_pipex_vl           (idu_iu_rf_pipe1_vl          ),
  .idu_iu_rf_pipex_vlmul        (idu_iu_rf_pipe1_vlmul       ),
  .idu_iu_rf_pipex_vsew         (idu_iu_rf_pipe1_vsew        ),
  .iu_vfpu_ex1_pipex_mtvr_inst  (iu_vfpu_ex1_pipe1_mtvr_inst ),
  .iu_vfpu_ex1_pipex_mtvr_vl    (iu_vfpu_ex1_pipe1_mtvr_vl   ),
  .iu_vfpu_ex1_pipex_mtvr_vld   (iu_vfpu_ex1_pipe1_mtvr_vld  ),
  .iu_vfpu_ex1_pipex_mtvr_vlmul (iu_vfpu_ex1_pipe1_mtvr_vlmul),
  .iu_vfpu_ex1_pipex_mtvr_vreg  (iu_vfpu_ex1_pipe1_mtvr_vreg ),
  .iu_vfpu_ex1_pipex_mtvr_vsew  (iu_vfpu_ex1_pipe1_mtvr_vsew ),
  .iu_vfpu_ex2_pipex_mtvr_src0  (iu_vfpu_ex2_pipe1_mtvr_src0 ),
  .iu_vfpu_ex2_pipex_mtvr_vld   (iu_vfpu_ex2_pipe1_mtvr_vld  ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .rtu_yy_xx_flush              (rtu_yy_xx_flush             )
);


//==========================================================
//                    Other Module
//==========================================================
// &Instance("ct_iu_bju", "x_ct_iu_bju"); @43
ct_iu_bju  x_ct_iu_bju (
  .bju_cbus_ex2_pipe2_abnormal        (bju_cbus_ex2_pipe2_abnormal       ),
  .bju_cbus_ex2_pipe2_bht_mispred     (bju_cbus_ex2_pipe2_bht_mispred    ),
  .bju_cbus_ex2_pipe2_iid             (bju_cbus_ex2_pipe2_iid            ),
  .bju_cbus_ex2_pipe2_jmp_mispred     (bju_cbus_ex2_pipe2_jmp_mispred    ),
  .bju_cbus_ex2_pipe2_sel             (bju_cbus_ex2_pipe2_sel            ),
  .bju_special_pc                     (bju_special_pc                    ),
  .bju_top_mispred_iid                (bju_top_mispred_iid               ),
  .bju_top_pcfifo_full                (bju_top_pcfifo_full               ),
  .cp0_iu_icg_en                      (cp0_iu_icg_en                     ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .idu_iu_is_pcfifo_inst_num          (idu_iu_is_pcfifo_inst_num         ),
  .idu_iu_is_pcfifo_inst_vld          (idu_iu_is_pcfifo_inst_vld         ),
  .idu_iu_rf_bju_gateclk_sel          (idu_iu_rf_bju_gateclk_sel         ),
  .idu_iu_rf_bju_sel                  (idu_iu_rf_bju_sel                 ),
  .idu_iu_rf_pipe0_pid                (idu_iu_rf_pipe0_pid               ),
  .idu_iu_rf_pipe2_func               (idu_iu_rf_pipe2_func              ),
  .idu_iu_rf_pipe2_iid                (idu_iu_rf_pipe2_iid               ),
  .idu_iu_rf_pipe2_length             (idu_iu_rf_pipe2_length            ),
  .idu_iu_rf_pipe2_offset             (idu_iu_rf_pipe2_offset            ),
  .idu_iu_rf_pipe2_pcall              (idu_iu_rf_pipe2_pcall             ),
  .idu_iu_rf_pipe2_pid                (idu_iu_rf_pipe2_pid               ),
  .idu_iu_rf_pipe2_rts                (idu_iu_rf_pipe2_rts               ),
  .idu_iu_rf_pipe2_src0               (idu_iu_rf_pipe2_src0              ),
  .idu_iu_rf_pipe2_src1               (idu_iu_rf_pipe2_src1              ),
  .idu_iu_rf_pipe2_vl                 (idu_iu_rf_pipe2_vl                ),
  .idu_iu_rf_pipe2_vlmul              (idu_iu_rf_pipe2_vlmul             ),
  .idu_iu_rf_pipe2_vsew               (idu_iu_rf_pipe2_vsew              ),
  .ifu_iu_pcfifo_create0_bht_pred     (ifu_iu_pcfifo_create0_bht_pred    ),
  .ifu_iu_pcfifo_create0_chk_idx      (ifu_iu_pcfifo_create0_chk_idx     ),
  .ifu_iu_pcfifo_create0_cur_pc       (ifu_iu_pcfifo_create0_cur_pc      ),
  .ifu_iu_pcfifo_create0_dst_vld      (ifu_iu_pcfifo_create0_dst_vld     ),
  .ifu_iu_pcfifo_create0_en           (ifu_iu_pcfifo_create0_en          ),
  .ifu_iu_pcfifo_create0_gateclk_en   (ifu_iu_pcfifo_create0_gateclk_en  ),
  .ifu_iu_pcfifo_create0_jal          (ifu_iu_pcfifo_create0_jal         ),
  .ifu_iu_pcfifo_create0_jalr         (ifu_iu_pcfifo_create0_jalr        ),
  .ifu_iu_pcfifo_create0_jmp_mispred  (ifu_iu_pcfifo_create0_jmp_mispred ),
  .ifu_iu_pcfifo_create0_tar_pc       (ifu_iu_pcfifo_create0_tar_pc      ),
  .ifu_iu_pcfifo_create1_bht_pred     (ifu_iu_pcfifo_create1_bht_pred    ),
  .ifu_iu_pcfifo_create1_chk_idx      (ifu_iu_pcfifo_create1_chk_idx     ),
  .ifu_iu_pcfifo_create1_cur_pc       (ifu_iu_pcfifo_create1_cur_pc      ),
  .ifu_iu_pcfifo_create1_dst_vld      (ifu_iu_pcfifo_create1_dst_vld     ),
  .ifu_iu_pcfifo_create1_en           (ifu_iu_pcfifo_create1_en          ),
  .ifu_iu_pcfifo_create1_gateclk_en   (ifu_iu_pcfifo_create1_gateclk_en  ),
  .ifu_iu_pcfifo_create1_jal          (ifu_iu_pcfifo_create1_jal         ),
  .ifu_iu_pcfifo_create1_jalr         (ifu_iu_pcfifo_create1_jalr        ),
  .ifu_iu_pcfifo_create1_jmp_mispred  (ifu_iu_pcfifo_create1_jmp_mispred ),
  .ifu_iu_pcfifo_create1_tar_pc       (ifu_iu_pcfifo_create1_tar_pc      ),
  .iu_idu_mispred_stall               (iu_idu_mispred_stall              ),
  .iu_idu_pcfifo_dis_inst0_pid        (iu_idu_pcfifo_dis_inst0_pid       ),
  .iu_idu_pcfifo_dis_inst1_pid        (iu_idu_pcfifo_dis_inst1_pid       ),
  .iu_idu_pcfifo_dis_inst2_pid        (iu_idu_pcfifo_dis_inst2_pid       ),
  .iu_idu_pcfifo_dis_inst3_pid        (iu_idu_pcfifo_dis_inst3_pid       ),
  .iu_ifu_bht_check_vld               (iu_ifu_bht_check_vld              ),
  .iu_ifu_bht_condbr_taken            (iu_ifu_bht_condbr_taken           ),
  .iu_ifu_bht_pred                    (iu_ifu_bht_pred                   ),
  .iu_ifu_chgflw_pc                   (iu_ifu_chgflw_pc                  ),
  .iu_ifu_chgflw_vl                   (iu_ifu_chgflw_vl                  ),
  .iu_ifu_chgflw_vld                  (iu_ifu_chgflw_vld                 ),
  .iu_ifu_chgflw_vlmul                (iu_ifu_chgflw_vlmul               ),
  .iu_ifu_chgflw_vsew                 (iu_ifu_chgflw_vsew                ),
  .iu_ifu_chk_idx                     (iu_ifu_chk_idx                    ),
  .iu_ifu_cur_pc                      (iu_ifu_cur_pc                     ),
  .iu_ifu_mispred_stall               (iu_ifu_mispred_stall              ),
  .iu_ifu_pcfifo_full                 (iu_ifu_pcfifo_full                ),
  .iu_rtu_pcfifo_pop0_data            (iu_rtu_pcfifo_pop0_data           ),
  .iu_rtu_pcfifo_pop1_data            (iu_rtu_pcfifo_pop1_data           ),
  .iu_rtu_pcfifo_pop2_data            (iu_rtu_pcfifo_pop2_data           ),
  .iu_yy_xx_cancel                    (iu_yy_xx_cancel                   ),
  .mmu_xx_mmu_en                      (mmu_xx_mmu_en                     ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .rtu_iu_flush_chgflw_mask           (rtu_iu_flush_chgflw_mask          ),
  .rtu_iu_flush_fe                    (rtu_iu_flush_fe                   ),
  .rtu_iu_rob_read0_pcfifo_vld        (rtu_iu_rob_read0_pcfifo_vld       ),
  .rtu_iu_rob_read1_pcfifo_vld        (rtu_iu_rob_read1_pcfifo_vld       ),
  .rtu_iu_rob_read2_pcfifo_vld        (rtu_iu_rob_read2_pcfifo_vld       ),
  .rtu_iu_rob_read_pcfifo_gateclk_vld (rtu_iu_rob_read_pcfifo_gateclk_vld),
  .rtu_yy_xx_flush                    (rtu_yy_xx_flush                   )
);

// &Instance("ct_iu_mult", "x_ct_iu_mult"); @44
ct_iu_mult  x_ct_iu_mult (
  .cp0_iu_icg_en                       (cp0_iu_icg_en                      ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_iu_rf_mult_gateclk_sel          (idu_iu_rf_mult_gateclk_sel         ),
  .idu_iu_rf_mult_sel                  (idu_iu_rf_mult_sel                 ),
  .idu_iu_rf_pipe1_dst_preg            (idu_iu_rf_pipe1_dst_preg           ),
  .idu_iu_rf_pipe1_mla_src2_preg       (idu_iu_rf_pipe1_mla_src2_preg      ),
  .idu_iu_rf_pipe1_mla_src2_vld        (idu_iu_rf_pipe1_mla_src2_vld       ),
  .idu_iu_rf_pipe1_mult_func           (idu_iu_rf_pipe1_mult_func          ),
  .idu_iu_rf_pipe1_src0                (idu_iu_rf_pipe1_src0               ),
  .idu_iu_rf_pipe1_src1_no_imm         (idu_iu_rf_pipe1_src1_no_imm        ),
  .idu_iu_rf_pipe1_src2                (idu_iu_rf_pipe1_src2               ),
  .iu_idu_ex1_pipe1_mult_stall         (iu_idu_ex1_pipe1_mult_stall        ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup0 (iu_idu_ex2_pipe1_mult_inst_vld_dup0),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup1 (iu_idu_ex2_pipe1_mult_inst_vld_dup1),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup2 (iu_idu_ex2_pipe1_mult_inst_vld_dup2),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup3 (iu_idu_ex2_pipe1_mult_inst_vld_dup3),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup4 (iu_idu_ex2_pipe1_mult_inst_vld_dup4),
  .iu_idu_ex2_pipe1_preg_dup0          (iu_idu_ex2_pipe1_preg_dup0         ),
  .iu_idu_ex2_pipe1_preg_dup1          (iu_idu_ex2_pipe1_preg_dup1         ),
  .iu_idu_ex2_pipe1_preg_dup2          (iu_idu_ex2_pipe1_preg_dup2         ),
  .iu_idu_ex2_pipe1_preg_dup3          (iu_idu_ex2_pipe1_preg_dup3         ),
  .iu_idu_ex2_pipe1_preg_dup4          (iu_idu_ex2_pipe1_preg_dup4         ),
  .iu_idu_pipe1_mla_src2_no_fwd        (iu_idu_pipe1_mla_src2_no_fwd       ),
  .mult_rbus_ex3_data_vld              (mult_rbus_ex3_data_vld             ),
  .mult_rbus_ex3_preg                  (mult_rbus_ex3_preg                 ),
  .mult_rbus_ex4_data                  (mult_rbus_ex4_data                 ),
  .mult_rbus_ex4_data_vld              (mult_rbus_ex4_data_vld             ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    )
);

// &Instance("ct_iu_div", "x_ct_iu_div"); @45
ct_iu_div  x_ct_iu_div (
  .cp0_iu_div_entry_disable     (cp0_iu_div_entry_disable    ),
  .cp0_iu_div_entry_disable_clr (cp0_iu_div_entry_disable_clr),
  .cp0_iu_icg_en                (cp0_iu_icg_en               ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .div_rbus_data                (div_rbus_data               ),
  .div_rbus_pipe0_data_vld      (div_rbus_pipe0_data_vld     ),
  .div_rbus_preg                (div_rbus_preg               ),
  .div_top_div_no_idle          (div_top_div_no_idle         ),
  .div_top_div_wf_wb            (div_top_div_wf_wb           ),
  .forever_cpuclk               (forever_cpuclk              ),
  .idu_iu_is_div_gateclk_issue  (idu_iu_is_div_gateclk_issue ),
  .idu_iu_is_div_issue          (idu_iu_is_div_issue         ),
  .idu_iu_rf_div_gateclk_sel    (idu_iu_rf_div_gateclk_sel   ),
  .idu_iu_rf_div_sel            (idu_iu_rf_div_sel           ),
  .idu_iu_rf_pipe0_dst_preg     (idu_iu_rf_pipe0_dst_preg    ),
  .idu_iu_rf_pipe0_func         (idu_iu_rf_pipe0_func        ),
  .idu_iu_rf_pipe0_iid          (idu_iu_rf_pipe0_iid         ),
  .idu_iu_rf_pipe0_src0         (idu_iu_rf_pipe0_src0        ),
  .idu_iu_rf_pipe0_src1_no_imm  (idu_iu_rf_pipe0_src1_no_imm ),
  .iu_idu_div_busy              (iu_idu_div_busy             ),
  .iu_idu_div_inst_vld          (iu_idu_div_inst_vld         ),
  .iu_idu_div_preg_dup0         (iu_idu_div_preg_dup0        ),
  .iu_idu_div_preg_dup1         (iu_idu_div_preg_dup1        ),
  .iu_idu_div_preg_dup2         (iu_idu_div_preg_dup2        ),
  .iu_idu_div_preg_dup3         (iu_idu_div_preg_dup3        ),
  .iu_idu_div_preg_dup4         (iu_idu_div_preg_dup4        ),
  .iu_idu_div_wb_stall          (iu_idu_div_wb_stall         ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .rtu_yy_xx_flush              (rtu_yy_xx_flush             )
);

// &Instance("ct_iu_special", "x_ct_iu_special"); @46
ct_iu_special  x_ct_iu_special (
  .bju_special_pc                    (bju_special_pc                   ),
  .cp0_iu_icg_en                     (cp0_iu_icg_en                    ),
  .cp0_iu_vill                       (cp0_iu_vill                      ),
  .cp0_iu_vl                         (cp0_iu_vl                        ),
  .cp0_iu_vsetvli_pre_decd_disable   (cp0_iu_vsetvli_pre_decd_disable  ),
  .cp0_iu_vstart                     (cp0_iu_vstart                    ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .idu_iu_rf_pipe0_dst_preg          (idu_iu_rf_pipe0_dst_preg         ),
  .idu_iu_rf_pipe0_expt_vec          (idu_iu_rf_pipe0_expt_vec         ),
  .idu_iu_rf_pipe0_expt_vld          (idu_iu_rf_pipe0_expt_vld         ),
  .idu_iu_rf_pipe0_func              (idu_iu_rf_pipe0_func             ),
  .idu_iu_rf_pipe0_high_hw_expt      (idu_iu_rf_pipe0_high_hw_expt     ),
  .idu_iu_rf_pipe0_iid               (idu_iu_rf_pipe0_iid              ),
  .idu_iu_rf_pipe0_opcode            (idu_iu_rf_pipe0_opcode           ),
  .idu_iu_rf_pipe0_special_imm       (idu_iu_rf_pipe0_special_imm      ),
  .idu_iu_rf_pipe0_src0              (idu_iu_rf_pipe0_src0             ),
  .idu_iu_rf_pipe0_src1_no_imm       (idu_iu_rf_pipe0_src1_no_imm      ),
  .idu_iu_rf_pipe0_vl                (idu_iu_rf_pipe0_vl               ),
  .idu_iu_rf_special_gateclk_sel     (idu_iu_rf_special_gateclk_sel    ),
  .idu_iu_rf_special_sel             (idu_iu_rf_special_sel            ),
  .mmu_xx_mmu_en                     (mmu_xx_mmu_en                    ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .special_cbus_ex1_abnormal         (special_cbus_ex1_abnormal        ),
  .special_cbus_ex1_bkpt             (special_cbus_ex1_bkpt            ),
  .special_cbus_ex1_expt_vec         (special_cbus_ex1_expt_vec        ),
  .special_cbus_ex1_expt_vld         (special_cbus_ex1_expt_vld        ),
  .special_cbus_ex1_flush            (special_cbus_ex1_flush           ),
  .special_cbus_ex1_high_hw_expt     (special_cbus_ex1_high_hw_expt    ),
  .special_cbus_ex1_iid              (special_cbus_ex1_iid             ),
  .special_cbus_ex1_immu_expt        (special_cbus_ex1_immu_expt       ),
  .special_cbus_ex1_inst_gateclk_vld (special_cbus_ex1_inst_gateclk_vld),
  .special_cbus_ex1_inst_vld         (special_cbus_ex1_inst_vld        ),
  .special_cbus_ex1_mtval            (special_cbus_ex1_mtval           ),
  .special_cbus_ex1_vsetvl           (special_cbus_ex1_vsetvl          ),
  .special_cbus_ex1_vstart           (special_cbus_ex1_vstart          ),
  .special_cbus_ex1_vstart_vld       (special_cbus_ex1_vstart_vld      ),
  .special_rbus_ex1_data             (special_rbus_ex1_data            ),
  .special_rbus_ex1_data_vld         (special_rbus_ex1_data_vld        ),
  .special_rbus_ex1_preg             (special_rbus_ex1_preg            )
);

// &Instance("ct_iu_cbus", "x_ct_iu_cbus"); @47
ct_iu_cbus  x_ct_iu_cbus (
  .bju_cbus_ex2_pipe2_abnormal       (bju_cbus_ex2_pipe2_abnormal      ),
  .bju_cbus_ex2_pipe2_bht_mispred    (bju_cbus_ex2_pipe2_bht_mispred   ),
  .bju_cbus_ex2_pipe2_iid            (bju_cbus_ex2_pipe2_iid           ),
  .bju_cbus_ex2_pipe2_jmp_mispred    (bju_cbus_ex2_pipe2_jmp_mispred   ),
  .bju_cbus_ex2_pipe2_sel            (bju_cbus_ex2_pipe2_sel           ),
  .cp0_iu_ex3_abnormal               (cp0_iu_ex3_abnormal              ),
  .cp0_iu_ex3_efpc                   (cp0_iu_ex3_efpc                  ),
  .cp0_iu_ex3_efpc_vld               (cp0_iu_ex3_efpc_vld              ),
  .cp0_iu_ex3_expt_vec               (cp0_iu_ex3_expt_vec              ),
  .cp0_iu_ex3_expt_vld               (cp0_iu_ex3_expt_vld              ),
  .cp0_iu_ex3_flush                  (cp0_iu_ex3_flush                 ),
  .cp0_iu_ex3_iid                    (cp0_iu_ex3_iid                   ),
  .cp0_iu_ex3_inst_vld               (cp0_iu_ex3_inst_vld              ),
  .cp0_iu_ex3_mtval                  (cp0_iu_ex3_mtval                 ),
  .cp0_iu_icg_en                     (cp0_iu_icg_en                    ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .idu_iu_rf_div_sel                 (idu_iu_rf_div_sel                ),
  .idu_iu_rf_mult_sel                (idu_iu_rf_mult_sel               ),
  .idu_iu_rf_pipe0_cbus_gateclk_sel  (idu_iu_rf_pipe0_cbus_gateclk_sel ),
  .idu_iu_rf_pipe0_iid               (idu_iu_rf_pipe0_iid              ),
  .idu_iu_rf_pipe0_sel               (idu_iu_rf_pipe0_sel              ),
  .idu_iu_rf_pipe1_cbus_gateclk_sel  (idu_iu_rf_pipe1_cbus_gateclk_sel ),
  .idu_iu_rf_pipe1_iid               (idu_iu_rf_pipe1_iid              ),
  .idu_iu_rf_pipe1_sel               (idu_iu_rf_pipe1_sel              ),
  .iu_rtu_pipe0_abnormal             (iu_rtu_pipe0_abnormal            ),
  .iu_rtu_pipe0_bkpt                 (iu_rtu_pipe0_bkpt                ),
  .iu_rtu_pipe0_cmplt                (iu_rtu_pipe0_cmplt               ),
  .iu_rtu_pipe0_efpc                 (iu_rtu_pipe0_efpc                ),
  .iu_rtu_pipe0_efpc_vld             (iu_rtu_pipe0_efpc_vld            ),
  .iu_rtu_pipe0_expt_vec             (iu_rtu_pipe0_expt_vec            ),
  .iu_rtu_pipe0_expt_vld             (iu_rtu_pipe0_expt_vld            ),
  .iu_rtu_pipe0_flush                (iu_rtu_pipe0_flush               ),
  .iu_rtu_pipe0_high_hw_expt         (iu_rtu_pipe0_high_hw_expt        ),
  .iu_rtu_pipe0_iid                  (iu_rtu_pipe0_iid                 ),
  .iu_rtu_pipe0_immu_expt            (iu_rtu_pipe0_immu_expt           ),
  .iu_rtu_pipe0_mtval                (iu_rtu_pipe0_mtval               ),
  .iu_rtu_pipe0_vsetvl               (iu_rtu_pipe0_vsetvl              ),
  .iu_rtu_pipe0_vstart               (iu_rtu_pipe0_vstart              ),
  .iu_rtu_pipe0_vstart_vld           (iu_rtu_pipe0_vstart_vld          ),
  .iu_rtu_pipe1_cmplt                (iu_rtu_pipe1_cmplt               ),
  .iu_rtu_pipe1_iid                  (iu_rtu_pipe1_iid                 ),
  .iu_rtu_pipe2_abnormal             (iu_rtu_pipe2_abnormal            ),
  .iu_rtu_pipe2_bht_mispred          (iu_rtu_pipe2_bht_mispred         ),
  .iu_rtu_pipe2_cmplt                (iu_rtu_pipe2_cmplt               ),
  .iu_rtu_pipe2_iid                  (iu_rtu_pipe2_iid                 ),
  .iu_rtu_pipe2_jmp_mispred          (iu_rtu_pipe2_jmp_mispred         ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .special_cbus_ex1_abnormal         (special_cbus_ex1_abnormal        ),
  .special_cbus_ex1_bkpt             (special_cbus_ex1_bkpt            ),
  .special_cbus_ex1_expt_vec         (special_cbus_ex1_expt_vec        ),
  .special_cbus_ex1_expt_vld         (special_cbus_ex1_expt_vld        ),
  .special_cbus_ex1_flush            (special_cbus_ex1_flush           ),
  .special_cbus_ex1_high_hw_expt     (special_cbus_ex1_high_hw_expt    ),
  .special_cbus_ex1_iid              (special_cbus_ex1_iid             ),
  .special_cbus_ex1_immu_expt        (special_cbus_ex1_immu_expt       ),
  .special_cbus_ex1_inst_gateclk_vld (special_cbus_ex1_inst_gateclk_vld),
  .special_cbus_ex1_inst_vld         (special_cbus_ex1_inst_vld        ),
  .special_cbus_ex1_mtval            (special_cbus_ex1_mtval           ),
  .special_cbus_ex1_vsetvl           (special_cbus_ex1_vsetvl          ),
  .special_cbus_ex1_vstart           (special_cbus_ex1_vstart          ),
  .special_cbus_ex1_vstart_vld       (special_cbus_ex1_vstart_vld      )
);

// &Instance("ct_iu_rbus", "x_ct_iu_rbus"); @48
ct_iu_rbus  x_ct_iu_rbus (
  .alu_rbus_ex1_pipe0_data           (alu_rbus_ex1_pipe0_data          ),
  .alu_rbus_ex1_pipe0_data_vld       (alu_rbus_ex1_pipe0_data_vld      ),
  .alu_rbus_ex1_pipe0_fwd_data       (alu_rbus_ex1_pipe0_fwd_data      ),
  .alu_rbus_ex1_pipe0_fwd_vld        (alu_rbus_ex1_pipe0_fwd_vld       ),
  .alu_rbus_ex1_pipe0_preg           (alu_rbus_ex1_pipe0_preg          ),
  .alu_rbus_ex1_pipe1_data           (alu_rbus_ex1_pipe1_data          ),
  .alu_rbus_ex1_pipe1_data_vld       (alu_rbus_ex1_pipe1_data_vld      ),
  .alu_rbus_ex1_pipe1_fwd_data       (alu_rbus_ex1_pipe1_fwd_data      ),
  .alu_rbus_ex1_pipe1_fwd_vld        (alu_rbus_ex1_pipe1_fwd_vld       ),
  .alu_rbus_ex1_pipe1_preg           (alu_rbus_ex1_pipe1_preg          ),
  .cp0_iu_ex3_rslt_data              (cp0_iu_ex3_rslt_data             ),
  .cp0_iu_ex3_rslt_preg              (cp0_iu_ex3_rslt_preg             ),
  .cp0_iu_ex3_rslt_vld               (cp0_iu_ex3_rslt_vld              ),
  .cp0_iu_icg_en                     (cp0_iu_icg_en                    ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .div_rbus_data                     (div_rbus_data                    ),
  .div_rbus_pipe0_data_vld           (div_rbus_pipe0_data_vld          ),
  .div_rbus_preg                     (div_rbus_preg                    ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .had_idu_wbbr_data                 (had_idu_wbbr_data                ),
  .had_idu_wbbr_vld                  (had_idu_wbbr_vld                 ),
  .iu_idu_ex1_pipe0_fwd_preg         (iu_idu_ex1_pipe0_fwd_preg        ),
  .iu_idu_ex1_pipe0_fwd_preg_data    (iu_idu_ex1_pipe0_fwd_preg_data   ),
  .iu_idu_ex1_pipe0_fwd_preg_vld     (iu_idu_ex1_pipe0_fwd_preg_vld    ),
  .iu_idu_ex1_pipe1_fwd_preg         (iu_idu_ex1_pipe1_fwd_preg        ),
  .iu_idu_ex1_pipe1_fwd_preg_data    (iu_idu_ex1_pipe1_fwd_preg_data   ),
  .iu_idu_ex1_pipe1_fwd_preg_vld     (iu_idu_ex1_pipe1_fwd_preg_vld    ),
  .iu_idu_ex2_pipe0_wb_preg          (iu_idu_ex2_pipe0_wb_preg         ),
  .iu_idu_ex2_pipe0_wb_preg_data     (iu_idu_ex2_pipe0_wb_preg_data    ),
  .iu_idu_ex2_pipe0_wb_preg_dup0     (iu_idu_ex2_pipe0_wb_preg_dup0    ),
  .iu_idu_ex2_pipe0_wb_preg_dup1     (iu_idu_ex2_pipe0_wb_preg_dup1    ),
  .iu_idu_ex2_pipe0_wb_preg_dup2     (iu_idu_ex2_pipe0_wb_preg_dup2    ),
  .iu_idu_ex2_pipe0_wb_preg_dup3     (iu_idu_ex2_pipe0_wb_preg_dup3    ),
  .iu_idu_ex2_pipe0_wb_preg_dup4     (iu_idu_ex2_pipe0_wb_preg_dup4    ),
  .iu_idu_ex2_pipe0_wb_preg_expand   (iu_idu_ex2_pipe0_wb_preg_expand  ),
  .iu_idu_ex2_pipe0_wb_preg_vld      (iu_idu_ex2_pipe0_wb_preg_vld     ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup0 (iu_idu_ex2_pipe0_wb_preg_vld_dup0),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup1 (iu_idu_ex2_pipe0_wb_preg_vld_dup1),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup2 (iu_idu_ex2_pipe0_wb_preg_vld_dup2),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup3 (iu_idu_ex2_pipe0_wb_preg_vld_dup3),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup4 (iu_idu_ex2_pipe0_wb_preg_vld_dup4),
  .iu_idu_ex2_pipe1_wb_preg          (iu_idu_ex2_pipe1_wb_preg         ),
  .iu_idu_ex2_pipe1_wb_preg_data     (iu_idu_ex2_pipe1_wb_preg_data    ),
  .iu_idu_ex2_pipe1_wb_preg_dup0     (iu_idu_ex2_pipe1_wb_preg_dup0    ),
  .iu_idu_ex2_pipe1_wb_preg_dup1     (iu_idu_ex2_pipe1_wb_preg_dup1    ),
  .iu_idu_ex2_pipe1_wb_preg_dup2     (iu_idu_ex2_pipe1_wb_preg_dup2    ),
  .iu_idu_ex2_pipe1_wb_preg_dup3     (iu_idu_ex2_pipe1_wb_preg_dup3    ),
  .iu_idu_ex2_pipe1_wb_preg_dup4     (iu_idu_ex2_pipe1_wb_preg_dup4    ),
  .iu_idu_ex2_pipe1_wb_preg_expand   (iu_idu_ex2_pipe1_wb_preg_expand  ),
  .iu_idu_ex2_pipe1_wb_preg_vld      (iu_idu_ex2_pipe1_wb_preg_vld     ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup0 (iu_idu_ex2_pipe1_wb_preg_vld_dup0),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup1 (iu_idu_ex2_pipe1_wb_preg_vld_dup1),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup2 (iu_idu_ex2_pipe1_wb_preg_vld_dup2),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup3 (iu_idu_ex2_pipe1_wb_preg_vld_dup3),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup4 (iu_idu_ex2_pipe1_wb_preg_vld_dup4),
  .iu_rtu_ex2_pipe0_wb_preg_expand   (iu_rtu_ex2_pipe0_wb_preg_expand  ),
  .iu_rtu_ex2_pipe0_wb_preg_vld      (iu_rtu_ex2_pipe0_wb_preg_vld     ),
  .iu_rtu_ex2_pipe1_wb_preg_expand   (iu_rtu_ex2_pipe1_wb_preg_expand  ),
  .iu_rtu_ex2_pipe1_wb_preg_vld      (iu_rtu_ex2_pipe1_wb_preg_vld     ),
  .mult_rbus_ex3_data_vld            (mult_rbus_ex3_data_vld           ),
  .mult_rbus_ex3_preg                (mult_rbus_ex3_preg               ),
  .mult_rbus_ex4_data                (mult_rbus_ex4_data               ),
  .mult_rbus_ex4_data_vld            (mult_rbus_ex4_data_vld           ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .special_rbus_ex1_data             (special_rbus_ex1_data            ),
  .special_rbus_ex1_data_vld         (special_rbus_ex1_data_vld        ),
  .special_rbus_ex1_preg             (special_rbus_ex1_preg            ),
  .vfpu_iu_ex2_pipe6_mfvr_data       (vfpu_iu_ex2_pipe6_mfvr_data      ),
  .vfpu_iu_ex2_pipe6_mfvr_data_vld   (vfpu_iu_ex2_pipe6_mfvr_data_vld  ),
  .vfpu_iu_ex2_pipe6_mfvr_preg       (vfpu_iu_ex2_pipe6_mfvr_preg      ),
  .vfpu_iu_ex2_pipe7_mfvr_data       (vfpu_iu_ex2_pipe7_mfvr_data      ),
  .vfpu_iu_ex2_pipe7_mfvr_data_vld   (vfpu_iu_ex2_pipe7_mfvr_data_vld  ),
  .vfpu_iu_ex2_pipe7_mfvr_preg       (vfpu_iu_ex2_pipe7_mfvr_preg      )
);


//==========================================================
//                      Debug info
//==========================================================
assign iu_had_debug_info[0]   = bju_top_pcfifo_full;
assign iu_had_debug_info[1]   = div_top_div_no_idle;
assign iu_had_debug_info[2]   = div_top_div_wf_wb;
assign iu_had_debug_info[9:3] = bju_top_mispred_iid[6:0];


// &ModuleEnd; @144
endmodule


