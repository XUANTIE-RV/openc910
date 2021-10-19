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

// &ModuleBeg; @28
module ct_rtu_rob_rt(
  cp0_rtu_icg_en,
  cp0_rtu_xx_int_b,
  cp0_rtu_xx_vec,
  cp0_yy_clk_en,
  cpurst_b,
  expt_entry_expt_vld_updt_val,
  expt_entry_iid,
  expt_entry_vld,
  forever_cpuclk,
  had_rtu_data_bkpt_dbgreq,
  had_rtu_dbg_req_en,
  had_rtu_debug_retire_info_en,
  had_rtu_inst_bkpt_dbgreq,
  had_rtu_xx_tme,
  hpcp_rtu_cnt_en,
  idu_rtu_fence_idle,
  ifu_rtu_cur_pc,
  ifu_rtu_cur_pc_load,
  iu_rtu_pcfifo_pop0_data,
  iu_rtu_pcfifo_pop1_data,
  iu_rtu_pcfifo_pop2_data,
  iu_rtu_pipe0_abnormal,
  iu_rtu_pipe0_cmplt,
  iu_rtu_pipe0_efpc,
  iu_rtu_pipe0_efpc_vld,
  iu_rtu_pipe0_iid,
  iu_rtu_pipe1_cmplt,
  iu_rtu_pipe1_iid,
  iu_rtu_pipe2_abnormal,
  iu_rtu_pipe2_cmplt,
  iu_rtu_pipe2_iid,
  lsu_rtu_wb_pipe3_abnormal,
  lsu_rtu_wb_pipe3_bkpta_data,
  lsu_rtu_wb_pipe3_bkptb_data,
  lsu_rtu_wb_pipe3_cmplt,
  lsu_rtu_wb_pipe3_iid,
  lsu_rtu_wb_pipe3_no_spec_hit,
  lsu_rtu_wb_pipe3_no_spec_mispred,
  lsu_rtu_wb_pipe3_no_spec_miss,
  lsu_rtu_wb_pipe4_abnormal,
  lsu_rtu_wb_pipe4_bkpta_data,
  lsu_rtu_wb_pipe4_bkptb_data,
  lsu_rtu_wb_pipe4_cmplt,
  lsu_rtu_wb_pipe4_iid,
  lsu_rtu_wb_pipe4_no_spec_hit,
  lsu_rtu_wb_pipe4_no_spec_mispred,
  lsu_rtu_wb_pipe4_no_spec_miss,
  pad_yy_icg_scan_en,
  retire_entry0_updt_gateclk_vld,
  retire_entry0_updt_vld,
  retire_entry1_updt_vld,
  retire_entry2_updt_vld,
  retire_expt_inst0_abnormal,
  retire_expt_inst0_vld,
  retire_rob_async_expt_commit_mask,
  retire_rob_ctc_flush_req,
  retire_rob_dbg_inst0_ack_int,
  retire_rob_dbg_inst0_dbg_mode_on,
  retire_rob_dbg_inst0_expt_vld,
  retire_rob_dbg_inst0_flush,
  retire_rob_dbg_inst0_mispred,
  retire_rob_flush,
  retire_rob_flush_gateclk,
  retire_rob_inst0_jmp,
  retire_rob_inst1_jmp,
  retire_rob_inst2_jmp,
  retire_rob_inst_flush,
  retire_rob_rt_mask,
  retire_rob_split_fof_flush,
  retire_rob_srt_en,
  rob_debug_commit0,
  rob_expt_inst0_iid,
  rob_pst_retire_inst0_gateclk_vld,
  rob_pst_retire_inst0_iid,
  rob_pst_retire_inst1_gateclk_vld,
  rob_pst_retire_inst1_iid,
  rob_pst_retire_inst2_gateclk_vld,
  rob_pst_retire_inst2_iid,
  rob_read0_data,
  rob_read0_iid,
  rob_read1_data,
  rob_read1_iid,
  rob_read2_data,
  rob_read2_iid,
  rob_retire_commit0,
  rob_retire_commit1,
  rob_retire_commit2,
  rob_retire_ctc_flush_srt_en,
  rob_retire_inst0_bju,
  rob_retire_inst0_bju_inc_pc,
  rob_retire_inst0_chk_idx,
  rob_retire_inst0_condbr,
  rob_retire_inst0_condbr_taken,
  rob_retire_inst0_ctc_flush,
  rob_retire_inst0_cur_pc,
  rob_retire_inst0_data_bkpt,
  rob_retire_inst0_dbg_disable,
  rob_retire_inst0_fp_dirty,
  rob_retire_inst0_iid,
  rob_retire_inst0_inst_bkpt,
  rob_retire_inst0_int_vec,
  rob_retire_inst0_int_vld,
  rob_retire_inst0_intmask,
  rob_retire_inst0_jmp,
  rob_retire_inst0_load,
  rob_retire_inst0_next_pc,
  rob_retire_inst0_no_spec_hit,
  rob_retire_inst0_no_spec_mispred,
  rob_retire_inst0_no_spec_miss,
  rob_retire_inst0_num,
  rob_retire_inst0_pc_offset,
  rob_retire_inst0_pcal,
  rob_retire_inst0_pret,
  rob_retire_inst0_pst_ereg_vld,
  rob_retire_inst0_pst_preg_vld,
  rob_retire_inst0_pst_vreg_vld,
  rob_retire_inst0_ras,
  rob_retire_inst0_split,
  rob_retire_inst0_store,
  rob_retire_inst0_vec_dirty,
  rob_retire_inst0_vl,
  rob_retire_inst0_vl_pred,
  rob_retire_inst0_vld,
  rob_retire_inst0_vlmul,
  rob_retire_inst0_vsetvli,
  rob_retire_inst0_vsew,
  rob_retire_inst1_bju,
  rob_retire_inst1_chk_idx,
  rob_retire_inst1_condbr,
  rob_retire_inst1_condbr_taken,
  rob_retire_inst1_cur_pc,
  rob_retire_inst1_fp_dirty,
  rob_retire_inst1_jmp,
  rob_retire_inst1_load,
  rob_retire_inst1_next_pc,
  rob_retire_inst1_no_spec_hit,
  rob_retire_inst1_no_spec_mispred,
  rob_retire_inst1_no_spec_miss,
  rob_retire_inst1_num,
  rob_retire_inst1_pc_offset,
  rob_retire_inst1_pst_ereg_vld,
  rob_retire_inst1_pst_preg_vld,
  rob_retire_inst1_pst_vreg_vld,
  rob_retire_inst1_split,
  rob_retire_inst1_store,
  rob_retire_inst1_vec_dirty,
  rob_retire_inst1_vl,
  rob_retire_inst1_vl_pred,
  rob_retire_inst1_vld,
  rob_retire_inst1_vlmul,
  rob_retire_inst1_vsetvli,
  rob_retire_inst1_vsew,
  rob_retire_inst2_bju,
  rob_retire_inst2_chk_idx,
  rob_retire_inst2_condbr,
  rob_retire_inst2_condbr_taken,
  rob_retire_inst2_cur_pc,
  rob_retire_inst2_fp_dirty,
  rob_retire_inst2_jmp,
  rob_retire_inst2_load,
  rob_retire_inst2_next_pc,
  rob_retire_inst2_no_spec_hit,
  rob_retire_inst2_no_spec_mispred,
  rob_retire_inst2_no_spec_miss,
  rob_retire_inst2_num,
  rob_retire_inst2_pc_offset,
  rob_retire_inst2_pst_ereg_vld,
  rob_retire_inst2_pst_preg_vld,
  rob_retire_inst2_pst_vreg_vld,
  rob_retire_inst2_split,
  rob_retire_inst2_store,
  rob_retire_inst2_vec_dirty,
  rob_retire_inst2_vl,
  rob_retire_inst2_vl_pred,
  rob_retire_inst2_vld,
  rob_retire_inst2_vlmul,
  rob_retire_inst2_vsetvli,
  rob_retire_inst2_vsew,
  rob_retire_int_srt_en,
  rob_retire_rob_cur_pc,
  rob_top_rob_cur_pc,
  rtu_cpu_no_retire,
  rtu_had_bkpt_data_st,
  rtu_had_data_bkpta_vld,
  rtu_had_data_bkptb_vld,
  rtu_had_inst0_non_irv_bkpt,
  rtu_had_inst1_non_irv_bkpt,
  rtu_had_inst2_non_irv_bkpt,
  rtu_had_inst_bkpt_inst_vld,
  rtu_had_inst_bkpta_vld,
  rtu_had_inst_bkptb_vld,
  rtu_had_inst_exe_dead,
  rtu_had_inst_split,
  rtu_had_retire_inst0_info,
  rtu_had_retire_inst0_vld,
  rtu_had_retire_inst1_info,
  rtu_had_retire_inst1_vld,
  rtu_had_retire_inst2_info,
  rtu_had_retire_inst2_vld,
  rtu_had_xx_mbkpt_chgflow,
  rtu_hpcp_inst0_cur_pc,
  rtu_hpcp_inst0_jmp_pc_offset_8m,
  rtu_hpcp_inst1_cur_pc,
  rtu_hpcp_inst1_jmp_pc_offset_8m,
  rtu_hpcp_inst2_cur_pc,
  rtu_hpcp_inst2_jmp_pc_offset_8m,
  rtu_idu_retire_int_vld,
  rtu_iu_rob_read0_pcfifo_vld,
  rtu_iu_rob_read1_pcfifo_vld,
  rtu_iu_rob_read2_pcfifo_vld,
  rtu_iu_rob_read_pcfifo_gateclk_vld,
  rtu_pad_retire0,
  rtu_pad_retire0_pc,
  rtu_pad_retire1,
  rtu_pad_retire1_pc,
  rtu_pad_retire2,
  rtu_pad_retire2_pc,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_retire0,
  rtu_yy_xx_retire1,
  rtu_yy_xx_retire2,
  vfpu_rtu_pipe6_cmplt,
  vfpu_rtu_pipe6_iid,
  vfpu_rtu_pipe7_cmplt,
  vfpu_rtu_pipe7_iid
);

// &Ports; @29
input           cp0_rtu_icg_en;                    
input           cp0_rtu_xx_int_b;                  
input   [4 :0]  cp0_rtu_xx_vec;                    
input           cp0_yy_clk_en;                     
input           cpurst_b;                          
input           expt_entry_expt_vld_updt_val;      
input   [6 :0]  expt_entry_iid;                    
input           expt_entry_vld;                    
input           forever_cpuclk;                    
input           had_rtu_data_bkpt_dbgreq;          
input           had_rtu_dbg_req_en;                
input           had_rtu_debug_retire_info_en;      
input           had_rtu_inst_bkpt_dbgreq;          
input           had_rtu_xx_tme;                    
input           hpcp_rtu_cnt_en;                   
input           idu_rtu_fence_idle;                
input   [38:0]  ifu_rtu_cur_pc;                    
input           ifu_rtu_cur_pc_load;               
input   [47:0]  iu_rtu_pcfifo_pop0_data;           
input   [47:0]  iu_rtu_pcfifo_pop1_data;           
input   [47:0]  iu_rtu_pcfifo_pop2_data;           
input           iu_rtu_pipe0_abnormal;             
input           iu_rtu_pipe0_cmplt;                
input   [38:0]  iu_rtu_pipe0_efpc;                 
input           iu_rtu_pipe0_efpc_vld;             
input   [6 :0]  iu_rtu_pipe0_iid;                  
input           iu_rtu_pipe1_cmplt;                
input   [6 :0]  iu_rtu_pipe1_iid;                  
input           iu_rtu_pipe2_abnormal;             
input           iu_rtu_pipe2_cmplt;                
input   [6 :0]  iu_rtu_pipe2_iid;                  
input           lsu_rtu_wb_pipe3_abnormal;         
input           lsu_rtu_wb_pipe3_bkpta_data;       
input           lsu_rtu_wb_pipe3_bkptb_data;       
input           lsu_rtu_wb_pipe3_cmplt;            
input   [6 :0]  lsu_rtu_wb_pipe3_iid;              
input           lsu_rtu_wb_pipe3_no_spec_hit;      
input           lsu_rtu_wb_pipe3_no_spec_mispred;  
input           lsu_rtu_wb_pipe3_no_spec_miss;     
input           lsu_rtu_wb_pipe4_abnormal;         
input           lsu_rtu_wb_pipe4_bkpta_data;       
input           lsu_rtu_wb_pipe4_bkptb_data;       
input           lsu_rtu_wb_pipe4_cmplt;            
input   [6 :0]  lsu_rtu_wb_pipe4_iid;              
input           lsu_rtu_wb_pipe4_no_spec_hit;      
input           lsu_rtu_wb_pipe4_no_spec_mispred;  
input           lsu_rtu_wb_pipe4_no_spec_miss;     
input           pad_yy_icg_scan_en;                
input           retire_rob_async_expt_commit_mask; 
input           retire_rob_ctc_flush_req;          
input           retire_rob_dbg_inst0_ack_int;      
input           retire_rob_dbg_inst0_dbg_mode_on;  
input           retire_rob_dbg_inst0_expt_vld;     
input           retire_rob_dbg_inst0_flush;        
input           retire_rob_dbg_inst0_mispred;      
input           retire_rob_flush;                  
input           retire_rob_flush_gateclk;          
input           retire_rob_inst0_jmp;              
input           retire_rob_inst1_jmp;              
input           retire_rob_inst2_jmp;              
input           retire_rob_inst_flush;             
input           retire_rob_rt_mask;                
input           retire_rob_split_fof_flush;        
input           retire_rob_srt_en;                 
input   [39:0]  rob_read0_data;                    
input   [6 :0]  rob_read0_iid;                     
input   [39:0]  rob_read1_data;                    
input   [6 :0]  rob_read1_iid;                     
input   [39:0]  rob_read2_data;                    
input   [6 :0]  rob_read2_iid;                     
input           vfpu_rtu_pipe6_cmplt;              
input   [6 :0]  vfpu_rtu_pipe6_iid;                
input           vfpu_rtu_pipe7_cmplt;              
input   [6 :0]  vfpu_rtu_pipe7_iid;                
output          retire_entry0_updt_gateclk_vld;    
output          retire_entry0_updt_vld;            
output          retire_entry1_updt_vld;            
output          retire_entry2_updt_vld;            
output          retire_expt_inst0_abnormal;        
output          retire_expt_inst0_vld;             
output          rob_debug_commit0;                 
output  [6 :0]  rob_expt_inst0_iid;                
output          rob_pst_retire_inst0_gateclk_vld;  
output  [6 :0]  rob_pst_retire_inst0_iid;          
output          rob_pst_retire_inst1_gateclk_vld;  
output  [6 :0]  rob_pst_retire_inst1_iid;          
output          rob_pst_retire_inst2_gateclk_vld;  
output  [6 :0]  rob_pst_retire_inst2_iid;          
output          rob_retire_commit0;                
output          rob_retire_commit1;                
output          rob_retire_commit2;                
output          rob_retire_ctc_flush_srt_en;       
output          rob_retire_inst0_bju;              
output  [38:0]  rob_retire_inst0_bju_inc_pc;       
output  [7 :0]  rob_retire_inst0_chk_idx;          
output          rob_retire_inst0_condbr;           
output          rob_retire_inst0_condbr_taken;     
output          rob_retire_inst0_ctc_flush;        
output  [38:0]  rob_retire_inst0_cur_pc;           
output          rob_retire_inst0_data_bkpt;        
output          rob_retire_inst0_dbg_disable;      
output          rob_retire_inst0_fp_dirty;         
output  [6 :0]  rob_retire_inst0_iid;              
output          rob_retire_inst0_inst_bkpt;        
output  [4 :0]  rob_retire_inst0_int_vec;          
output          rob_retire_inst0_int_vld;          
output          rob_retire_inst0_intmask;          
output          rob_retire_inst0_jmp;              
output          rob_retire_inst0_load;             
output  [38:0]  rob_retire_inst0_next_pc;          
output          rob_retire_inst0_no_spec_hit;      
output          rob_retire_inst0_no_spec_mispred;  
output          rob_retire_inst0_no_spec_miss;     
output  [1 :0]  rob_retire_inst0_num;              
output  [2 :0]  rob_retire_inst0_pc_offset;        
output          rob_retire_inst0_pcal;             
output          rob_retire_inst0_pret;             
output          rob_retire_inst0_pst_ereg_vld;     
output          rob_retire_inst0_pst_preg_vld;     
output          rob_retire_inst0_pst_vreg_vld;     
output          rob_retire_inst0_ras;              
output          rob_retire_inst0_split;            
output          rob_retire_inst0_store;            
output          rob_retire_inst0_vec_dirty;        
output  [7 :0]  rob_retire_inst0_vl;               
output          rob_retire_inst0_vl_pred;          
output          rob_retire_inst0_vld;              
output  [1 :0]  rob_retire_inst0_vlmul;            
output          rob_retire_inst0_vsetvli;          
output  [2 :0]  rob_retire_inst0_vsew;             
output          rob_retire_inst1_bju;              
output  [7 :0]  rob_retire_inst1_chk_idx;          
output          rob_retire_inst1_condbr;           
output          rob_retire_inst1_condbr_taken;     
output  [38:0]  rob_retire_inst1_cur_pc;           
output          rob_retire_inst1_fp_dirty;         
output          rob_retire_inst1_jmp;              
output          rob_retire_inst1_load;             
output  [38:0]  rob_retire_inst1_next_pc;          
output          rob_retire_inst1_no_spec_hit;      
output          rob_retire_inst1_no_spec_mispred;  
output          rob_retire_inst1_no_spec_miss;     
output  [1 :0]  rob_retire_inst1_num;              
output  [2 :0]  rob_retire_inst1_pc_offset;        
output          rob_retire_inst1_pst_ereg_vld;     
output          rob_retire_inst1_pst_preg_vld;     
output          rob_retire_inst1_pst_vreg_vld;     
output          rob_retire_inst1_split;            
output          rob_retire_inst1_store;            
output          rob_retire_inst1_vec_dirty;        
output  [7 :0]  rob_retire_inst1_vl;               
output          rob_retire_inst1_vl_pred;          
output          rob_retire_inst1_vld;              
output  [1 :0]  rob_retire_inst1_vlmul;            
output          rob_retire_inst1_vsetvli;          
output  [2 :0]  rob_retire_inst1_vsew;             
output          rob_retire_inst2_bju;              
output  [7 :0]  rob_retire_inst2_chk_idx;          
output          rob_retire_inst2_condbr;           
output          rob_retire_inst2_condbr_taken;     
output  [38:0]  rob_retire_inst2_cur_pc;           
output          rob_retire_inst2_fp_dirty;         
output          rob_retire_inst2_jmp;              
output          rob_retire_inst2_load;             
output  [38:0]  rob_retire_inst2_next_pc;          
output          rob_retire_inst2_no_spec_hit;      
output          rob_retire_inst2_no_spec_mispred;  
output          rob_retire_inst2_no_spec_miss;     
output  [1 :0]  rob_retire_inst2_num;              
output  [2 :0]  rob_retire_inst2_pc_offset;        
output          rob_retire_inst2_pst_ereg_vld;     
output          rob_retire_inst2_pst_preg_vld;     
output          rob_retire_inst2_pst_vreg_vld;     
output          rob_retire_inst2_split;            
output          rob_retire_inst2_store;            
output          rob_retire_inst2_vec_dirty;        
output  [7 :0]  rob_retire_inst2_vl;               
output          rob_retire_inst2_vl_pred;          
output          rob_retire_inst2_vld;              
output  [1 :0]  rob_retire_inst2_vlmul;            
output          rob_retire_inst2_vsetvli;          
output  [2 :0]  rob_retire_inst2_vsew;             
output          rob_retire_int_srt_en;             
output  [38:0]  rob_retire_rob_cur_pc;             
output  [6 :0]  rob_top_rob_cur_pc;                
output          rtu_cpu_no_retire;                 
output          rtu_had_bkpt_data_st;              
output          rtu_had_data_bkpta_vld;            
output          rtu_had_data_bkptb_vld;            
output  [3 :0]  rtu_had_inst0_non_irv_bkpt;        
output  [3 :0]  rtu_had_inst1_non_irv_bkpt;        
output  [3 :0]  rtu_had_inst2_non_irv_bkpt;        
output          rtu_had_inst_bkpt_inst_vld;        
output          rtu_had_inst_bkpta_vld;            
output          rtu_had_inst_bkptb_vld;            
output          rtu_had_inst_exe_dead;             
output          rtu_had_inst_split;                
output  [63:0]  rtu_had_retire_inst0_info;         
output          rtu_had_retire_inst0_vld;          
output  [63:0]  rtu_had_retire_inst1_info;         
output          rtu_had_retire_inst1_vld;          
output  [63:0]  rtu_had_retire_inst2_info;         
output          rtu_had_retire_inst2_vld;          
output          rtu_had_xx_mbkpt_chgflow;          
output  [39:0]  rtu_hpcp_inst0_cur_pc;             
output          rtu_hpcp_inst0_jmp_pc_offset_8m;   
output  [39:0]  rtu_hpcp_inst1_cur_pc;             
output          rtu_hpcp_inst1_jmp_pc_offset_8m;   
output  [39:0]  rtu_hpcp_inst2_cur_pc;             
output          rtu_hpcp_inst2_jmp_pc_offset_8m;   
output          rtu_idu_retire_int_vld;            
output          rtu_iu_rob_read0_pcfifo_vld;       
output          rtu_iu_rob_read1_pcfifo_vld;       
output          rtu_iu_rob_read2_pcfifo_vld;       
output          rtu_iu_rob_read_pcfifo_gateclk_vld; 
output          rtu_pad_retire0;                   
output  [39:0]  rtu_pad_retire0_pc;                
output          rtu_pad_retire1;                   
output  [39:0]  rtu_pad_retire1_pc;                
output          rtu_pad_retire2;                   
output  [39:0]  rtu_pad_retire2_pc;                
output          rtu_yy_xx_commit0;                 
output  [6 :0]  rtu_yy_xx_commit0_iid;             
output          rtu_yy_xx_commit1;                 
output  [6 :0]  rtu_yy_xx_commit1_iid;             
output          rtu_yy_xx_commit2;                 
output  [6 :0]  rtu_yy_xx_commit2_iid;             
output          rtu_yy_xx_retire0;                 
output          rtu_yy_xx_retire1;                 
output          rtu_yy_xx_retire2;                 

// &Regs; @30
reg     [21:0]  debug_retire_inst0_info;           
reg     [16:0]  debug_retire_inst0_jmp_pc_offset;  
reg     [38:0]  debug_retire_inst0_pc;             
reg             debug_retire_inst0_vld;            
reg     [21:0]  debug_retire_inst1_info;           
reg     [16:0]  debug_retire_inst1_jmp_pc_offset;  
reg     [38:0]  debug_retire_inst1_pc;             
reg             debug_retire_inst1_vld;            
reg     [21:0]  debug_retire_inst2_info;           
reg     [16:0]  debug_retire_inst2_jmp_pc_offset;  
reg     [38:0]  debug_retire_inst2_pc;             
reg             debug_retire_inst2_vld;            
reg             no_retire;                         
reg     [31:0]  retire_cnt;                        
reg             retire_inst0_abnormal;             
reg             retire_inst0_bju_length;           
reg             retire_inst0_ctc_flush;            
reg     [38:0]  retire_inst0_cur_pc;               
reg     [51:0]  retire_inst0_data;                 
reg             retire_inst0_data_bkpt;            
reg             retire_inst0_dbg_disable;          
reg             retire_inst0_inst_bkpt;            
reg     [4 :0]  retire_inst0_int_vec;              
reg             retire_inst0_int_vld;              
reg             retire_inst0_intmask;              
reg             retire_inst0_pcal;                 
reg             retire_inst0_ras;                  
reg             retire_inst0_vld;                  
reg     [38:0]  retire_inst1_cur_pc_addend0;       
reg     [4 :0]  retire_inst1_cur_pc_addend1;       
reg     [51:0]  retire_inst1_data;                 
reg             retire_inst1_vld;                  
reg     [38:0]  retire_inst2_cur_pc_addend0;       
reg     [4 :0]  retire_inst2_cur_pc_addend1;       
reg     [51:0]  retire_inst2_data;                 
reg             retire_inst2_vld;                  
reg             retire_pst_ereg_inst0_vld;         
reg             retire_pst_ereg_inst1_vld;         
reg             retire_pst_ereg_inst2_vld;         
reg             retire_pst_preg_inst0_vld;         
reg             retire_pst_preg_inst1_vld;         
reg             retire_pst_preg_inst2_vld;         
reg             retire_pst_vreg_inst0_vld;         
reg             retire_pst_vreg_inst1_vld;         
reg             retire_pst_vreg_inst2_vld;         
reg             retire_retire_inst0_vld;           
reg             retire_retire_inst1_vld;           
reg             retire_retire_inst2_vld;           
reg             rob_commit0;                       
reg     [6 :0]  rob_commit0_iid;                   
reg             rob_commit1;                       
reg     [6 :0]  rob_commit1_iid;                   
reg             rob_commit2;                       
reg     [6 :0]  rob_commit2_iid;                   
reg     [38:0]  rob_cur_pc_addend0;                
reg     [4 :0]  rob_cur_pc_addend1;                
reg     [38:0]  rob_read2_cur_pc_addend0;          
reg     [38:0]  rob_read2_next_pc_addend0;         
reg     [4 :0]  rob_read2_next_pc_addend1;         
reg     [47:0]  rob_read2_pcfifo_data;             

// &Wires; @31
wire            commit_clk;                        
wire            commit_clk_en;                     
wire            cp0_rtu_icg_en;                    
wire            cp0_rtu_xx_int_b;                  
wire    [4 :0]  cp0_rtu_xx_vec;                    
wire            cp0_yy_clk_en;                     
wire            cpurst_b;                          
wire            debug_clk;                         
wire            debug_clk_en;                      
wire            debug_info_en;                     
wire            entry0_clk;                        
wire            entry0_clk_en;                     
wire            entry1_clk;                        
wire            entry1_clk_en;                     
wire            entry2_clk;                        
wire            entry2_clk_en;                     
wire            expt_entry_expt_vld_updt_val;      
wire    [6 :0]  expt_entry_iid;                    
wire            expt_entry_vld;                    
wire            forever_cpuclk;                    
wire            had_rtu_data_bkpt_dbgreq;          
wire            had_rtu_dbg_req_en;                
wire            had_rtu_debug_retire_info_en;      
wire            had_rtu_inst_bkpt_dbgreq;          
wire            had_rtu_xx_tme;                    
wire            hpcp_rtu_cnt_en;                   
wire            idu_rtu_fence_idle;                
wire    [38:0]  ifu_rtu_cur_pc;                    
wire            ifu_rtu_cur_pc_load;               
wire    [47:0]  iu_rtu_pcfifo_pop0_data;           
wire    [47:0]  iu_rtu_pcfifo_pop1_data;           
wire    [47:0]  iu_rtu_pcfifo_pop2_data;           
wire            iu_rtu_pipe0_abnormal;             
wire            iu_rtu_pipe0_cmplt;                
wire    [38:0]  iu_rtu_pipe0_efpc;                 
wire            iu_rtu_pipe0_efpc_vld;             
wire    [6 :0]  iu_rtu_pipe0_iid;                  
wire            iu_rtu_pipe1_cmplt;                
wire    [6 :0]  iu_rtu_pipe1_iid;                  
wire            iu_rtu_pipe2_abnormal;             
wire            iu_rtu_pipe2_cmplt;                
wire    [6 :0]  iu_rtu_pipe2_iid;                  
wire            lsu_rtu_wb_pipe3_abnormal;         
wire            lsu_rtu_wb_pipe3_bkpta_data;       
wire            lsu_rtu_wb_pipe3_bkptb_data;       
wire            lsu_rtu_wb_pipe3_cmplt;            
wire    [6 :0]  lsu_rtu_wb_pipe3_iid;              
wire            lsu_rtu_wb_pipe3_no_spec_hit;      
wire            lsu_rtu_wb_pipe3_no_spec_mispred;  
wire            lsu_rtu_wb_pipe3_no_spec_miss;     
wire            lsu_rtu_wb_pipe4_abnormal;         
wire            lsu_rtu_wb_pipe4_bkpta_data;       
wire            lsu_rtu_wb_pipe4_bkptb_data;       
wire            lsu_rtu_wb_pipe4_cmplt;            
wire    [6 :0]  lsu_rtu_wb_pipe4_iid;              
wire            lsu_rtu_wb_pipe4_no_spec_hit;      
wire            lsu_rtu_wb_pipe4_no_spec_mispred;  
wire            lsu_rtu_wb_pipe4_no_spec_miss;     
wire            pad_yy_icg_scan_en;                
wire            pc_clk;                            
wire            pc_clk_en;                         
wire    [2 :0]  retire_entry0_pc_offset;           
wire            retire_entry0_updt_gateclk_vld;    
wire            retire_entry0_updt_vld;            
wire    [2 :0]  retire_entry1_pc_offset;           
wire            retire_entry1_updt_vld;            
wire    [2 :0]  retire_entry2_pc_offset;           
wire            retire_entry2_updt_vld;            
wire            retire_expt_inst0_abnormal;        
wire            retire_expt_inst0_vld;             
wire            retire_inst0_bju;                  
wire            retire_inst0_condbr;               
wire    [51:0]  retire_inst0_create_data;          
wire            retire_inst0_cur_pc_updt_vld;      
wire    [21:0]  retire_inst0_debug_info;           
wire    [6 :0]  retire_inst0_iid;                  
wire            retire_inst0_inst_bkpt_updt_val;   
wire            retire_inst0_jmp;                  
wire    [38:0]  retire_inst0_jmp_pc_offset;        
wire    [1 :0]  retire_inst0_num;                  
wire            retire_inst0_split;                
wire            retire_inst0_store;                
wire            retire_inst1_bju;                  
wire            retire_inst1_condbr;               
wire    [51:0]  retire_inst1_create_data;          
wire    [21:0]  retire_inst1_debug_info;           
wire    [6 :0]  retire_inst1_iid;                  
wire            retire_inst1_jmp;                  
wire    [38:0]  retire_inst1_jmp_pc_offset;        
wire    [1 :0]  retire_inst1_num;                  
wire            retire_inst1_split;                
wire            retire_inst1_store;                
wire            retire_inst2_bju;                  
wire            retire_inst2_condbr;               
wire    [51:0]  retire_inst2_create_data;          
wire    [21:0]  retire_inst2_debug_info;           
wire    [6 :0]  retire_inst2_iid;                  
wire            retire_inst2_jmp;                  
wire    [38:0]  retire_inst2_jmp_pc_offset;        
wire    [1 :0]  retire_inst2_num;                  
wire            retire_inst2_split;                
wire            retire_inst2_store;                
wire            retire_read0_inst_bkpt_inst_vld;   
wire            retire_rob_async_expt_commit_mask; 
wire            retire_rob_ctc_flush_req;          
wire            retire_rob_dbg_inst0_ack_int;      
wire            retire_rob_dbg_inst0_dbg_mode_on;  
wire            retire_rob_dbg_inst0_expt_vld;     
wire            retire_rob_dbg_inst0_flush;        
wire            retire_rob_dbg_inst0_mispred;      
wire            retire_rob_flush;                  
wire            retire_rob_flush_gateclk;          
wire            retire_rob_inst0_jmp;              
wire            retire_rob_inst1_jmp;              
wire            retire_rob_inst2_jmp;              
wire            retire_rob_inst_flush;             
wire            retire_rob_rt_mask;                
wire            retire_rob_split_fof_flush;        
wire            retire_rob_srt_en;                 
wire            rob_commit0_async_expt_mask;       
wire            rob_commit0_mask;                  
wire            rob_commit0_sync_mask;             
wire            rob_commit1_async_expt_mask;       
wire            rob_commit1_mask;                  
wire            rob_commit1_sync_mask;             
wire            rob_commit2_async_expt_mask;       
wire            rob_commit2_mask;                  
wire            rob_commit2_sync_mask;             
wire            rob_ctc_flush_commit_mask;         
wire    [38:0]  rob_cur_pc;                        
wire    [38:0]  rob_cur_pc_plus_2;                 
wire            rob_dbg_commit_mask;               
wire            rob_debug_commit0;                 
wire    [6 :0]  rob_expt_inst0_iid;                
wire            rob_int_commit_mask;               
wire            rob_pst_retire_inst0_gateclk_vld;  
wire    [6 :0]  rob_pst_retire_inst0_iid;          
wire            rob_pst_retire_inst1_gateclk_vld;  
wire    [6 :0]  rob_pst_retire_inst1_iid;          
wire            rob_pst_retire_inst2_gateclk_vld;  
wire    [6 :0]  rob_pst_retire_inst2_iid;          
wire            rob_read0_1_fold_inst;             
wire            rob_read0_2_fold_inst;             
wire            rob_read0_3_fold_inst;             
wire            rob_read0_abnormal;                
wire            rob_read0_cmplted;                 
wire            rob_read0_cmplted_bkpta_data;      
wire            rob_read0_cmplted_bkptb_data;      
wire            rob_read0_cmplted_gateclk;         
wire            rob_read0_cmplted_no_spec_hit;     
wire            rob_read0_cmplted_no_spec_mispred; 
wire            rob_read0_cmplted_no_spec_miss;    
wire            rob_read0_commit;                  
wire            rob_read0_ctc_flush;               
wire    [38:0]  rob_read0_cur_pc;                  
wire    [39:0]  rob_read0_data;                    
wire            rob_read0_dbg_disable;             
wire            rob_read0_expt_entry_vld;          
wire    [6 :0]  rob_read0_iid;                     
wire            rob_read0_inst_vld;                
wire    [4 :0]  rob_read0_int_vec;                 
wire            rob_read0_int_vld;                 
wire    [38:0]  rob_read0_next_pc;                 
wire    [4 :0]  rob_read0_pc_offset;               
wire    [47:0]  rob_read0_pcfifo_data;             
wire            rob_read0_pipe0_abnormal;          
wire            rob_read0_pipe0_cmplt;             
wire            rob_read0_pipe1_cmplt;             
wire            rob_read0_pipe2_abnormal;          
wire            rob_read0_pipe2_cmplt;             
wire            rob_read0_pipe3_abnormal;          
wire            rob_read0_pipe3_bkpta_data;        
wire            rob_read0_pipe3_bkptb_data;        
wire            rob_read0_pipe3_cmplt;             
wire            rob_read0_pipe3_no_spec_hit;       
wire            rob_read0_pipe3_no_spec_mispred;   
wire            rob_read0_pipe3_no_spec_miss;      
wire            rob_read0_pipe4_abnormal;          
wire            rob_read0_pipe4_bkpta_data;        
wire            rob_read0_pipe4_bkptb_data;        
wire            rob_read0_pipe4_cmplt;             
wire            rob_read0_pipe4_no_spec_hit;       
wire            rob_read0_pipe4_no_spec_mispred;   
wire            rob_read0_pipe4_no_spec_miss;      
wire            rob_read0_pipe6_cmplt;             
wire            rob_read0_pipe7_cmplt;             
wire            rob_read0_pst_ereg_retire_vld;     
wire            rob_read0_pst_retire_vld;          
wire            rob_read0_rte;                     
wire            rob_read1_1_fold_inst;             
wire            rob_read1_2_fold_inst;             
wire            rob_read1_3_fold_inst;             
wire            rob_read1_abnormal;                
wire            rob_read1_cmplted;                 
wire            rob_read1_cmplted_bkpta_data;      
wire            rob_read1_cmplted_bkptb_data;      
wire            rob_read1_cmplted_no_spec_hit;     
wire            rob_read1_cmplted_no_spec_mispred; 
wire            rob_read1_cmplted_no_spec_miss;    
wire            rob_read1_commit;                  
wire    [38:0]  rob_read1_cur_pc_addend0;          
wire    [4 :0]  rob_read1_cur_pc_addend1;          
wire    [39:0]  rob_read1_data;                    
wire            rob_read1_expt_entry_vld;          
wire    [6 :0]  rob_read1_iid;                     
wire            rob_read1_inst_vld;                
wire    [38:0]  rob_read1_next_pc;                 
wire    [4 :0]  rob_read1_pc_offset;               
wire    [47:0]  rob_read1_pcfifo_data;             
wire            rob_read1_pipe0_abnormal;          
wire            rob_read1_pipe0_cmplt;             
wire            rob_read1_pipe1_cmplt;             
wire            rob_read1_pipe2_abnormal;          
wire            rob_read1_pipe2_cmplt;             
wire            rob_read1_pipe3_abnormal;          
wire            rob_read1_pipe3_bkpta_data;        
wire            rob_read1_pipe3_bkptb_data;        
wire            rob_read1_pipe3_cmplt;             
wire            rob_read1_pipe3_no_spec_hit;       
wire            rob_read1_pipe3_no_spec_mispred;   
wire            rob_read1_pipe3_no_spec_miss;      
wire            rob_read1_pipe4_abnormal;          
wire            rob_read1_pipe4_bkpta_data;        
wire            rob_read1_pipe4_bkptb_data;        
wire            rob_read1_pipe4_cmplt;             
wire            rob_read1_pipe4_no_spec_hit;       
wire            rob_read1_pipe4_no_spec_mispred;   
wire            rob_read1_pipe4_no_spec_miss;      
wire            rob_read1_pipe6_cmplt;             
wire            rob_read1_pipe7_cmplt;             
wire            rob_read2_1_fold_inst;             
wire            rob_read2_2_fold_inst;             
wire            rob_read2_3_fold_inst;             
wire            rob_read2_abnormal;                
wire            rob_read2_cmplted;                 
wire            rob_read2_cmplted_bkpta_data;      
wire            rob_read2_cmplted_bkptb_data;      
wire            rob_read2_cmplted_no_spec_hit;     
wire            rob_read2_cmplted_no_spec_mispred; 
wire            rob_read2_cmplted_no_spec_miss;    
wire            rob_read2_commit;                  
wire    [4 :0]  rob_read2_cur_pc_addend1;          
wire    [39:0]  rob_read2_data;                    
wire            rob_read2_expt_entry_vld;          
wire    [6 :0]  rob_read2_iid;                     
wire            rob_read2_inst_vld;                
wire    [38:0]  rob_read2_next_pc;                 
wire    [4 :0]  rob_read2_pc_offset;               
wire            rob_read2_pipe0_abnormal;          
wire            rob_read2_pipe0_cmplt;             
wire            rob_read2_pipe1_cmplt;             
wire            rob_read2_pipe2_abnormal;          
wire            rob_read2_pipe2_cmplt;             
wire            rob_read2_pipe3_abnormal;          
wire            rob_read2_pipe3_bkpta_data;        
wire            rob_read2_pipe3_bkptb_data;        
wire            rob_read2_pipe3_cmplt;             
wire            rob_read2_pipe3_no_spec_hit;       
wire            rob_read2_pipe3_no_spec_mispred;   
wire            rob_read2_pipe3_no_spec_miss;      
wire            rob_read2_pipe4_abnormal;          
wire            rob_read2_pipe4_bkpta_data;        
wire            rob_read2_pipe4_bkptb_data;        
wire            rob_read2_pipe4_cmplt;             
wire            rob_read2_pipe4_no_spec_hit;       
wire            rob_read2_pipe4_no_spec_mispred;   
wire            rob_read2_pipe4_no_spec_miss;      
wire            rob_read2_pipe6_cmplt;             
wire            rob_read2_pipe7_cmplt;             
wire            rob_retire_commit0;                
wire            rob_retire_commit1;                
wire            rob_retire_commit2;                
wire            rob_retire_ctc_flush_srt_en;       
wire            rob_retire_inst0_bju;              
wire    [38:0]  rob_retire_inst0_bju_inc_pc;       
wire    [7 :0]  rob_retire_inst0_chk_idx;          
wire            rob_retire_inst0_condbr;           
wire            rob_retire_inst0_condbr_taken;     
wire            rob_retire_inst0_ctc_flush;        
wire    [38:0]  rob_retire_inst0_cur_pc;           
wire            rob_retire_inst0_data_bkpt;        
wire            rob_retire_inst0_dbg_disable;      
wire            rob_retire_inst0_fp_dirty;         
wire    [6 :0]  rob_retire_inst0_iid;              
wire            rob_retire_inst0_inst_bkpt;        
wire    [4 :0]  rob_retire_inst0_int_vec;          
wire            rob_retire_inst0_int_vld;          
wire            rob_retire_inst0_intmask;          
wire            rob_retire_inst0_jmp;              
wire            rob_retire_inst0_load;             
wire    [38:0]  rob_retire_inst0_next_pc;          
wire            rob_retire_inst0_no_spec_hit;      
wire            rob_retire_inst0_no_spec_mispred;  
wire            rob_retire_inst0_no_spec_miss;     
wire    [1 :0]  rob_retire_inst0_num;              
wire    [2 :0]  rob_retire_inst0_pc_offset;        
wire            rob_retire_inst0_pcal;             
wire            rob_retire_inst0_pret;             
wire            rob_retire_inst0_pst_ereg_vld;     
wire            rob_retire_inst0_pst_preg_vld;     
wire            rob_retire_inst0_pst_vreg_vld;     
wire            rob_retire_inst0_ras;              
wire            rob_retire_inst0_split;            
wire            rob_retire_inst0_store;            
wire            rob_retire_inst0_vec_dirty;        
wire    [7 :0]  rob_retire_inst0_vl;               
wire            rob_retire_inst0_vl_pred;          
wire            rob_retire_inst0_vld;              
wire    [1 :0]  rob_retire_inst0_vlmul;            
wire            rob_retire_inst0_vsetvli;          
wire    [2 :0]  rob_retire_inst0_vsew;             
wire            rob_retire_inst1_bju;              
wire    [7 :0]  rob_retire_inst1_chk_idx;          
wire            rob_retire_inst1_condbr;           
wire            rob_retire_inst1_condbr_taken;     
wire    [38:0]  rob_retire_inst1_cur_pc;           
wire            rob_retire_inst1_fp_dirty;         
wire            rob_retire_inst1_jmp;              
wire            rob_retire_inst1_load;             
wire    [38:0]  rob_retire_inst1_next_pc;          
wire            rob_retire_inst1_no_spec_hit;      
wire            rob_retire_inst1_no_spec_mispred;  
wire            rob_retire_inst1_no_spec_miss;     
wire    [1 :0]  rob_retire_inst1_num;              
wire    [2 :0]  rob_retire_inst1_pc_offset;        
wire            rob_retire_inst1_pst_ereg_vld;     
wire            rob_retire_inst1_pst_preg_vld;     
wire            rob_retire_inst1_pst_vreg_vld;     
wire            rob_retire_inst1_split;            
wire            rob_retire_inst1_store;            
wire            rob_retire_inst1_vec_dirty;        
wire    [7 :0]  rob_retire_inst1_vl;               
wire            rob_retire_inst1_vl_pred;          
wire            rob_retire_inst1_vld;              
wire    [1 :0]  rob_retire_inst1_vlmul;            
wire            rob_retire_inst1_vsetvli;          
wire    [2 :0]  rob_retire_inst1_vsew;             
wire            rob_retire_inst2_bju;              
wire    [7 :0]  rob_retire_inst2_chk_idx;          
wire            rob_retire_inst2_condbr;           
wire            rob_retire_inst2_condbr_taken;     
wire    [38:0]  rob_retire_inst2_cur_pc;           
wire            rob_retire_inst2_fp_dirty;         
wire            rob_retire_inst2_jmp;              
wire            rob_retire_inst2_load;             
wire    [38:0]  rob_retire_inst2_next_pc;          
wire            rob_retire_inst2_no_spec_hit;      
wire            rob_retire_inst2_no_spec_mispred;  
wire            rob_retire_inst2_no_spec_miss;     
wire    [1 :0]  rob_retire_inst2_num;              
wire    [2 :0]  rob_retire_inst2_pc_offset;        
wire            rob_retire_inst2_pst_ereg_vld;     
wire            rob_retire_inst2_pst_preg_vld;     
wire            rob_retire_inst2_pst_vreg_vld;     
wire            rob_retire_inst2_split;            
wire            rob_retire_inst2_store;            
wire            rob_retire_inst2_vec_dirty;        
wire    [7 :0]  rob_retire_inst2_vl;               
wire            rob_retire_inst2_vl_pred;          
wire            rob_retire_inst2_vld;              
wire    [1 :0]  rob_retire_inst2_vlmul;            
wire            rob_retire_inst2_vsetvli;          
wire    [2 :0]  rob_retire_inst2_vsew;             
wire            rob_retire_int_srt_en;             
wire    [38:0]  rob_retire_rob_cur_pc;             
wire            rob_sync_commit_mask;              
wire    [6 :0]  rob_top_rob_cur_pc;                
wire            rtu_cpu_no_retire;                 
wire            rtu_had_bkpt_data_st;              
wire            rtu_had_data_bkpta_vld;            
wire            rtu_had_data_bkptb_vld;            
wire    [3 :0]  rtu_had_inst0_non_irv_bkpt;        
wire    [3 :0]  rtu_had_inst1_non_irv_bkpt;        
wire    [3 :0]  rtu_had_inst2_non_irv_bkpt;        
wire            rtu_had_inst_bkpt_inst_vld;        
wire            rtu_had_inst_bkpta_vld;            
wire            rtu_had_inst_bkptb_vld;            
wire            rtu_had_inst_exe_dead;             
wire            rtu_had_inst_split;                
wire    [63:0]  rtu_had_retire_inst0_info;         
wire            rtu_had_retire_inst0_vld;          
wire    [63:0]  rtu_had_retire_inst1_info;         
wire            rtu_had_retire_inst1_vld;          
wire    [63:0]  rtu_had_retire_inst2_info;         
wire            rtu_had_retire_inst2_vld;          
wire            rtu_had_xx_mbkpt_chgflow;          
wire    [39:0]  rtu_hpcp_inst0_cur_pc;             
wire            rtu_hpcp_inst0_jmp_pc_offset_8m;   
wire    [39:0]  rtu_hpcp_inst1_cur_pc;             
wire            rtu_hpcp_inst1_jmp_pc_offset_8m;   
wire    [39:0]  rtu_hpcp_inst2_cur_pc;             
wire            rtu_hpcp_inst2_jmp_pc_offset_8m;   
wire            rtu_idu_retire_int_vld;            
wire            rtu_iu_rob_read0_pcfifo_vld;       
wire            rtu_iu_rob_read1_pcfifo_vld;       
wire            rtu_iu_rob_read2_pcfifo_vld;       
wire            rtu_iu_rob_read_pcfifo_gateclk_vld; 
wire            rtu_pad_retire0;                   
wire    [39:0]  rtu_pad_retire0_pc;                
wire            rtu_pad_retire1;                   
wire    [39:0]  rtu_pad_retire1_pc;                
wire            rtu_pad_retire2;                   
wire    [39:0]  rtu_pad_retire2_pc;                
wire            rtu_yy_xx_commit0;                 
wire    [6 :0]  rtu_yy_xx_commit0_iid;             
wire            rtu_yy_xx_commit1;                 
wire    [6 :0]  rtu_yy_xx_commit1_iid;             
wire            rtu_yy_xx_commit2;                 
wire    [6 :0]  rtu_yy_xx_commit2_iid;             
wire            rtu_yy_xx_retire0;                 
wire            rtu_yy_xx_retire1;                 
wire            rtu_yy_xx_retire2;                 
wire            vfpu_rtu_pipe6_cmplt;              
wire    [6 :0]  vfpu_rtu_pipe6_iid;                
wire            vfpu_rtu_pipe7_cmplt;              
wire    [6 :0]  vfpu_rtu_pipe7_iid;                



//==========================================================
//                      Parameters
//==========================================================
//----------------------------------------------------------
//                     ROB Parameters
//----------------------------------------------------------
parameter ROB_WIDTH           = 40;

parameter ROB_VL_PRED         = 39;
parameter ROB_VL              = 38;
parameter ROB_VEC_DIRTY       = 30;
parameter ROB_VSETVLI         = 29;
parameter ROB_VSEW            = 28;
parameter ROB_VLMUL           = 25;
parameter ROB_NO_SPEC_MISPRED = 23;
parameter ROB_NO_SPEC_MISS    = 22;
parameter ROB_NO_SPEC_HIT     = 21;
parameter ROB_LOAD            = 20;
parameter ROB_FP_DIRTY        = 19;
parameter ROB_INST_NUM        = 18;
parameter ROB_BKPTB_INST      = 16;
parameter ROB_BKPTA_INST      = 15;
parameter ROB_BKPTB_DATA      = 14;
parameter ROB_BKPTA_DATA      = 13;
parameter ROB_STORE           = 12;
parameter ROB_RAS             = 11;
parameter ROB_PCFIFO          = 10;
parameter ROB_BJU             = 9;
parameter ROB_INTMASK         = 8;
parameter ROB_SPLIT           = 7;
parameter ROB_PC_OFFSET       = 6;
parameter ROB_CMPLT_CNT       = 3;
parameter ROB_CMPLT           = 1;
parameter ROB_VLD             = 0;

//----------------------------------------------------------
//                    Retire Parameters
//----------------------------------------------------------
parameter RT_WIDTH            = 52;
parameter PCFIFO_POP_WIDTH    = 48;

//==========================================================
//            Retire Entry Valid update signals
//==========================================================
//----------------------------------------------------------
//                   rename for input
//----------------------------------------------------------
// &Force("bus","rob_read1_data",ROB_WIDTH-1,0); @81
// &Force("bus","rob_read2_data",ROB_WIDTH-1,0); @82
assign rob_read0_inst_vld        = rob_read0_data[ROB_VLD];
assign rob_read1_inst_vld        = rob_read1_data[ROB_VLD];
assign rob_read2_inst_vld        = rob_read2_data[ROB_VLD];

//output for pst iid update
assign rob_pst_retire_inst0_gateclk_vld = rob_read0_inst_vld;
assign rob_pst_retire_inst1_gateclk_vld = rob_read1_inst_vld;
assign rob_pst_retire_inst2_gateclk_vld = rob_read2_inst_vld;

//----------------------------------------------------------
//               ROB read 0/1/2 cmplting
//----------------------------------------------------------
assign rob_read0_pipe0_cmplt = iu_rtu_pipe0_cmplt
                               && (rob_read0_iid[6:0]
                                   == iu_rtu_pipe0_iid[6:0]);
assign rob_read0_pipe1_cmplt = iu_rtu_pipe1_cmplt
                               && (rob_read0_iid[6:0]
                                   == iu_rtu_pipe1_iid[6:0]);
assign rob_read0_pipe2_cmplt = iu_rtu_pipe2_cmplt
                               && (rob_read0_iid[6:0]
                                   == iu_rtu_pipe2_iid[6:0]);
assign rob_read0_pipe3_cmplt = lsu_rtu_wb_pipe3_cmplt
                               && (rob_read0_iid[6:0]
                                   == lsu_rtu_wb_pipe3_iid[6:0]);
assign rob_read0_pipe4_cmplt = lsu_rtu_wb_pipe4_cmplt
                               && (rob_read0_iid[6:0]
                                   == lsu_rtu_wb_pipe4_iid[6:0]);
assign rob_read0_pipe6_cmplt = vfpu_rtu_pipe6_cmplt
                               && (rob_read0_iid[6:0]
                                   == vfpu_rtu_pipe6_iid[6:0]);
assign rob_read0_pipe7_cmplt = vfpu_rtu_pipe7_cmplt
                               && (rob_read0_iid[6:0]
                                   == vfpu_rtu_pipe7_iid[6:0]);

assign rob_read1_pipe0_cmplt = iu_rtu_pipe0_cmplt
                               && (rob_read1_iid[6:0]
                                   == iu_rtu_pipe0_iid[6:0]);
assign rob_read1_pipe1_cmplt = iu_rtu_pipe1_cmplt
                               && (rob_read1_iid[6:0]
                                   == iu_rtu_pipe1_iid[6:0]);
assign rob_read1_pipe2_cmplt = iu_rtu_pipe2_cmplt
                               && (rob_read1_iid[6:0]
                                   == iu_rtu_pipe2_iid[6:0]);
assign rob_read1_pipe3_cmplt = lsu_rtu_wb_pipe3_cmplt
                               && (rob_read1_iid[6:0]
                                   == lsu_rtu_wb_pipe3_iid[6:0]);
assign rob_read1_pipe4_cmplt = lsu_rtu_wb_pipe4_cmplt
                               && (rob_read1_iid[6:0]
                                   == lsu_rtu_wb_pipe4_iid[6:0]);
assign rob_read1_pipe6_cmplt = vfpu_rtu_pipe6_cmplt
                               && (rob_read1_iid[6:0]
                                   == vfpu_rtu_pipe6_iid[6:0]);
assign rob_read1_pipe7_cmplt = vfpu_rtu_pipe7_cmplt
                               && (rob_read1_iid[6:0]
                                   == vfpu_rtu_pipe7_iid[6:0]);

assign rob_read2_pipe0_cmplt = iu_rtu_pipe0_cmplt
                               && (rob_read2_iid[6:0]
                                   == iu_rtu_pipe0_iid[6:0]);
assign rob_read2_pipe1_cmplt = iu_rtu_pipe1_cmplt
                               && (rob_read2_iid[6:0]
                                   == iu_rtu_pipe1_iid[6:0]);
assign rob_read2_pipe2_cmplt = iu_rtu_pipe2_cmplt
                               && (rob_read2_iid[6:0]
                                   == iu_rtu_pipe2_iid[6:0]);
assign rob_read2_pipe3_cmplt = lsu_rtu_wb_pipe3_cmplt
                               && (rob_read2_iid[6:0]
                                   == lsu_rtu_wb_pipe3_iid[6:0]);
assign rob_read2_pipe4_cmplt = lsu_rtu_wb_pipe4_cmplt
                               && (rob_read2_iid[6:0]
                                   == lsu_rtu_wb_pipe4_iid[6:0]);
assign rob_read2_pipe6_cmplt = vfpu_rtu_pipe6_cmplt
                               && (rob_read2_iid[6:0]
                                   == vfpu_rtu_pipe6_iid[6:0]);
assign rob_read2_pipe7_cmplt = vfpu_rtu_pipe7_cmplt
                               && (rob_read2_iid[6:0]
                                   == vfpu_rtu_pipe7_iid[6:0]);

assign rob_read0_pipe0_abnormal = rob_read0_pipe0_cmplt
                                  && iu_rtu_pipe0_abnormal;
assign rob_read0_pipe2_abnormal = rob_read0_pipe2_cmplt
                                  && iu_rtu_pipe2_abnormal;
assign rob_read0_pipe3_abnormal = rob_read0_pipe3_cmplt
                                  && lsu_rtu_wb_pipe3_abnormal;
assign rob_read0_pipe4_abnormal = rob_read0_pipe4_cmplt
                                  && lsu_rtu_wb_pipe4_abnormal;
assign rob_read0_expt_entry_vld = expt_entry_vld
                                  && (rob_read0_iid[6:0]
                                      == expt_entry_iid[6:0]);

assign rob_read1_pipe0_abnormal = rob_read1_pipe0_cmplt
                                  && iu_rtu_pipe0_abnormal;
assign rob_read1_pipe2_abnormal = rob_read1_pipe2_cmplt
                                  && iu_rtu_pipe2_abnormal;
assign rob_read1_pipe3_abnormal = rob_read1_pipe3_cmplt
                                  && lsu_rtu_wb_pipe3_abnormal;
assign rob_read1_pipe4_abnormal = rob_read1_pipe4_cmplt
                                  && lsu_rtu_wb_pipe4_abnormal;
assign rob_read1_expt_entry_vld = expt_entry_vld
                                  && (rob_read1_iid[6:0]
                                      == expt_entry_iid[6:0]);

assign rob_read2_pipe0_abnormal = rob_read2_pipe0_cmplt
                                  && iu_rtu_pipe0_abnormal;
assign rob_read2_pipe2_abnormal = rob_read2_pipe2_cmplt
                                  && iu_rtu_pipe2_abnormal;
assign rob_read2_pipe3_abnormal = rob_read2_pipe3_cmplt
                                  && lsu_rtu_wb_pipe3_abnormal;
assign rob_read2_pipe4_abnormal = rob_read2_pipe4_cmplt
                                  && lsu_rtu_wb_pipe4_abnormal;
assign rob_read2_expt_entry_vld = expt_entry_vld
                                  && (rob_read2_iid[6:0]
                                      == expt_entry_iid[6:0]);

assign rob_read0_pipe3_bkpta_data      = rob_read0_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_bkpta_data;
assign rob_read0_pipe3_bkptb_data      = rob_read0_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_bkptb_data;
assign rob_read0_pipe3_no_spec_hit     = rob_read0_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_hit;
assign rob_read0_pipe3_no_spec_miss    = rob_read0_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_miss;
assign rob_read0_pipe3_no_spec_mispred = rob_read0_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_mispred;
assign rob_read0_pipe4_bkpta_data      = rob_read0_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_bkpta_data;
assign rob_read0_pipe4_bkptb_data      = rob_read0_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_bkptb_data;
assign rob_read0_pipe4_no_spec_hit     = rob_read0_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_hit;
assign rob_read0_pipe4_no_spec_miss    = rob_read0_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_miss;
assign rob_read0_pipe4_no_spec_mispred = rob_read0_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_mispred;

assign rob_read1_pipe3_bkpta_data      = rob_read1_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_bkpta_data;
assign rob_read1_pipe3_bkptb_data      = rob_read1_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_bkptb_data;
assign rob_read1_pipe3_no_spec_hit     = rob_read1_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_hit;
assign rob_read1_pipe3_no_spec_miss    = rob_read1_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_miss;
assign rob_read1_pipe3_no_spec_mispred = rob_read1_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_mispred;
assign rob_read1_pipe4_bkpta_data      = rob_read1_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_bkpta_data;
assign rob_read1_pipe4_bkptb_data      = rob_read1_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_bkptb_data;
assign rob_read1_pipe4_no_spec_hit     = rob_read1_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_hit;
assign rob_read1_pipe4_no_spec_miss    = rob_read1_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_miss;
assign rob_read1_pipe4_no_spec_mispred = rob_read1_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_mispred;

assign rob_read2_pipe3_bkpta_data      = rob_read2_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_bkpta_data;
assign rob_read2_pipe3_bkptb_data      = rob_read2_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_bkptb_data;
assign rob_read2_pipe3_no_spec_hit     = rob_read2_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_hit;
assign rob_read2_pipe3_no_spec_miss    = rob_read2_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_miss;
assign rob_read2_pipe3_no_spec_mispred = rob_read2_pipe3_cmplt
                                         && lsu_rtu_wb_pipe3_no_spec_mispred;
assign rob_read2_pipe4_bkpta_data      = rob_read2_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_bkpta_data;
assign rob_read2_pipe4_bkptb_data      = rob_read2_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_bkptb_data;
assign rob_read2_pipe4_no_spec_hit     = rob_read2_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_hit;
assign rob_read2_pipe4_no_spec_miss    = rob_read2_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_miss;
assign rob_read2_pipe4_no_spec_mispred = rob_read2_pipe4_cmplt
                                         && lsu_rtu_wb_pipe4_no_spec_mispred;

//----------------------------------------------------------
//            Prepare fold inst cmplt number
//----------------------------------------------------------
assign rob_read0_1_fold_inst =
             rob_read0_pipe0_cmplt && !rob_read0_pipe1_cmplt
         && !rob_read0_pipe6_cmplt && !rob_read0_pipe7_cmplt
         || !rob_read0_pipe0_cmplt &&  rob_read0_pipe1_cmplt
         && !rob_read0_pipe6_cmplt && !rob_read0_pipe7_cmplt
         || !rob_read0_pipe0_cmplt && !rob_read0_pipe1_cmplt
         &&  rob_read0_pipe6_cmplt && !rob_read0_pipe7_cmplt
         || !rob_read0_pipe0_cmplt && !rob_read0_pipe1_cmplt
         && !rob_read0_pipe6_cmplt &&  rob_read0_pipe7_cmplt;
assign rob_read0_2_fold_inst =
             rob_read0_pipe0_cmplt &&  rob_read0_pipe1_cmplt
         && !rob_read0_pipe6_cmplt && !rob_read0_pipe7_cmplt
         ||  rob_read0_pipe0_cmplt && !rob_read0_pipe1_cmplt
         &&  rob_read0_pipe6_cmplt && !rob_read0_pipe7_cmplt
         ||  rob_read0_pipe0_cmplt && !rob_read0_pipe1_cmplt
         && !rob_read0_pipe6_cmplt &&  rob_read0_pipe7_cmplt
         || !rob_read0_pipe0_cmplt &&  rob_read0_pipe1_cmplt
         &&  rob_read0_pipe6_cmplt && !rob_read0_pipe7_cmplt
         || !rob_read0_pipe0_cmplt &&  rob_read0_pipe1_cmplt
         && !rob_read0_pipe6_cmplt &&  rob_read0_pipe7_cmplt
         || !rob_read0_pipe0_cmplt && !rob_read0_pipe1_cmplt
         &&  rob_read0_pipe6_cmplt &&  rob_read0_pipe7_cmplt;
assign rob_read0_3_fold_inst =
             rob_read0_pipe0_cmplt &&  rob_read0_pipe1_cmplt
         &&  rob_read0_pipe6_cmplt && !rob_read0_pipe7_cmplt
         ||  rob_read0_pipe0_cmplt &&  rob_read0_pipe1_cmplt
         && !rob_read0_pipe6_cmplt &&  rob_read0_pipe7_cmplt
         ||  rob_read0_pipe0_cmplt && !rob_read0_pipe1_cmplt
         &&  rob_read0_pipe6_cmplt &&  rob_read0_pipe7_cmplt
         || !rob_read0_pipe0_cmplt &&  rob_read0_pipe1_cmplt
         &&  rob_read0_pipe6_cmplt &&  rob_read0_pipe7_cmplt;

assign rob_read1_1_fold_inst =
             rob_read1_pipe0_cmplt && !rob_read1_pipe1_cmplt
         && !rob_read1_pipe6_cmplt && !rob_read1_pipe7_cmplt
         || !rob_read1_pipe0_cmplt &&  rob_read1_pipe1_cmplt
         && !rob_read1_pipe6_cmplt && !rob_read1_pipe7_cmplt
         || !rob_read1_pipe0_cmplt && !rob_read1_pipe1_cmplt
         &&  rob_read1_pipe6_cmplt && !rob_read1_pipe7_cmplt
         || !rob_read1_pipe0_cmplt && !rob_read1_pipe1_cmplt
         && !rob_read1_pipe6_cmplt &&  rob_read1_pipe7_cmplt;
assign rob_read1_2_fold_inst =
             rob_read1_pipe0_cmplt &&  rob_read1_pipe1_cmplt
         && !rob_read1_pipe6_cmplt && !rob_read1_pipe7_cmplt
         ||  rob_read1_pipe0_cmplt && !rob_read1_pipe1_cmplt
         &&  rob_read1_pipe6_cmplt && !rob_read1_pipe7_cmplt
         ||  rob_read1_pipe0_cmplt && !rob_read1_pipe1_cmplt
         && !rob_read1_pipe6_cmplt &&  rob_read1_pipe7_cmplt
         || !rob_read1_pipe0_cmplt &&  rob_read1_pipe1_cmplt
         &&  rob_read1_pipe6_cmplt && !rob_read1_pipe7_cmplt
         || !rob_read1_pipe0_cmplt &&  rob_read1_pipe1_cmplt
         && !rob_read1_pipe6_cmplt &&  rob_read1_pipe7_cmplt
         || !rob_read1_pipe0_cmplt && !rob_read1_pipe1_cmplt
         &&  rob_read1_pipe6_cmplt &&  rob_read1_pipe7_cmplt;
assign rob_read1_3_fold_inst =
             rob_read1_pipe0_cmplt &&  rob_read1_pipe1_cmplt
         &&  rob_read1_pipe6_cmplt && !rob_read1_pipe7_cmplt
         ||  rob_read1_pipe0_cmplt &&  rob_read1_pipe1_cmplt
         && !rob_read1_pipe6_cmplt &&  rob_read1_pipe7_cmplt
         ||  rob_read1_pipe0_cmplt && !rob_read1_pipe1_cmplt
         &&  rob_read1_pipe6_cmplt &&  rob_read1_pipe7_cmplt
         || !rob_read1_pipe0_cmplt &&  rob_read1_pipe1_cmplt
         &&  rob_read1_pipe6_cmplt &&  rob_read1_pipe7_cmplt;

assign rob_read2_1_fold_inst =
             rob_read2_pipe0_cmplt && !rob_read2_pipe1_cmplt
         && !rob_read2_pipe6_cmplt && !rob_read2_pipe7_cmplt
         || !rob_read2_pipe0_cmplt &&  rob_read2_pipe1_cmplt
         && !rob_read2_pipe6_cmplt && !rob_read2_pipe7_cmplt
         || !rob_read2_pipe0_cmplt && !rob_read2_pipe1_cmplt
         &&  rob_read2_pipe6_cmplt && !rob_read2_pipe7_cmplt
         || !rob_read2_pipe0_cmplt && !rob_read2_pipe1_cmplt
         && !rob_read2_pipe6_cmplt &&  rob_read2_pipe7_cmplt;
assign rob_read2_2_fold_inst =
             rob_read2_pipe0_cmplt &&  rob_read2_pipe1_cmplt
         && !rob_read2_pipe6_cmplt && !rob_read2_pipe7_cmplt
         ||  rob_read2_pipe0_cmplt && !rob_read2_pipe1_cmplt
         &&  rob_read2_pipe6_cmplt && !rob_read2_pipe7_cmplt
         ||  rob_read2_pipe0_cmplt && !rob_read2_pipe1_cmplt
         && !rob_read2_pipe6_cmplt &&  rob_read2_pipe7_cmplt
         || !rob_read2_pipe0_cmplt &&  rob_read2_pipe1_cmplt
         &&  rob_read2_pipe6_cmplt && !rob_read2_pipe7_cmplt
         || !rob_read2_pipe0_cmplt &&  rob_read2_pipe1_cmplt
         && !rob_read2_pipe6_cmplt &&  rob_read2_pipe7_cmplt
         || !rob_read2_pipe0_cmplt && !rob_read2_pipe1_cmplt
         &&  rob_read2_pipe6_cmplt &&  rob_read2_pipe7_cmplt;
assign rob_read2_3_fold_inst =
             rob_read2_pipe0_cmplt &&  rob_read2_pipe1_cmplt
         &&  rob_read2_pipe6_cmplt && !rob_read2_pipe7_cmplt
         ||  rob_read2_pipe0_cmplt &&  rob_read2_pipe1_cmplt
         && !rob_read2_pipe6_cmplt &&  rob_read2_pipe7_cmplt
         ||  rob_read2_pipe0_cmplt && !rob_read2_pipe1_cmplt
         &&  rob_read2_pipe6_cmplt &&  rob_read2_pipe7_cmplt
         || !rob_read2_pipe0_cmplt &&  rob_read2_pipe1_cmplt
         &&  rob_read2_pipe6_cmplt &&  rob_read2_pipe7_cmplt;

//----------------------------------------------------------
//         Prepare retire entry update valid signal
//----------------------------------------------------------
assign rob_read0_cmplted =
         rob_read0_inst_vld
            //1.if rob read0 already cmplt
         && (rob_read0_data[ROB_CMPLT]
             //2.1 1 fold inst cmplting and cmplt cnt is 1
             || rob_read0_1_fold_inst
                && (rob_read0_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1] == 2'd1)
             //2.2 2 fold inst cmplting and cmplt cnt is 2
             || rob_read0_2_fold_inst
                && (rob_read0_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1] == 2'd2)
             //2.3 3 fold inst cmplting and cmplt cnt must be 3
             || rob_read0_3_fold_inst
             //2.4 other inst cmplt no matter cmplt cnt
             || rob_read0_pipe2_cmplt
             || rob_read0_pipe3_cmplt
             || rob_read0_pipe4_cmplt);

assign rob_read1_cmplted =
         rob_read1_inst_vld
            //1.if rob read1 already cmplt
         && (rob_read1_data[ROB_CMPLT]
             //2.1 1 fold inst cmplting and cmplt cnt is 1
             || rob_read1_1_fold_inst
                && (rob_read1_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1] == 2'd1)
             //2.2 2 fold inst cmplting and cmplt cnt is 2
             || rob_read1_2_fold_inst
                && (rob_read1_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1] == 2'd2)
             //2.3 3 fold inst cmplting and cmplt cnt must be 3
             || rob_read1_3_fold_inst
             //2.4 other inst cmplt no matter cmplt cnt
             || rob_read1_pipe2_cmplt
             || rob_read1_pipe3_cmplt
             || rob_read1_pipe4_cmplt);

assign rob_read2_cmplted =
         rob_read2_inst_vld
            //1.if rob read2 already cmplt
         && (rob_read2_data[ROB_CMPLT]
             //2.1 1 fold inst cmplting and cmplt cnt is 1
             || rob_read2_1_fold_inst
                && (rob_read2_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1] == 2'd1)
             //2.2 2 fold inst cmplting and cmplt cnt is 2
             || rob_read2_2_fold_inst
                && (rob_read2_data[ROB_CMPLT_CNT:ROB_CMPLT_CNT-1] == 2'd2)
             //2.3 3 fold inst cmplting and cmplt cnt must be 3
             || rob_read2_3_fold_inst
             //2.4 other inst cmplt no matter cmplt cnt
             || rob_read2_pipe2_cmplt
             || rob_read2_pipe3_cmplt
             || rob_read2_pipe4_cmplt);

assign rob_read0_cmplted_gateclk =
         rob_read0_inst_vld
            //1.if rob read0 already cmplt
         && (rob_read0_data[ROB_CMPLT]
             //2. or rob read0 cmplting
             || rob_read0_pipe0_cmplt
             || rob_read0_pipe1_cmplt
             || rob_read0_pipe2_cmplt
             || rob_read0_pipe3_cmplt
             || rob_read0_pipe4_cmplt
             || rob_read0_pipe6_cmplt
             || rob_read0_pipe7_cmplt);

assign rob_read0_abnormal = rob_read0_pipe0_abnormal
                         || rob_read0_pipe2_abnormal
                         || rob_read0_pipe3_abnormal
                         || rob_read0_pipe4_abnormal
                         || rob_read0_expt_entry_vld;

assign rob_read1_abnormal = rob_read1_pipe0_abnormal
                         || rob_read1_pipe2_abnormal
                         || rob_read1_pipe3_abnormal
                         || rob_read1_pipe4_abnormal
                         || rob_read1_expt_entry_vld;

assign rob_read2_abnormal = rob_read2_pipe0_abnormal
                         || rob_read2_pipe2_abnormal
                         || rob_read2_pipe3_abnormal
                         || rob_read2_pipe4_abnormal
                         || rob_read2_expt_entry_vld;

// &Force("output","retire_entry0_updt_vld"); @444
// &Force("output","retire_entry1_updt_vld"); @445
// &Force("output","retire_entry2_updt_vld"); @446
// &Force("output","retire_entry0_updt_gateclk_vld"); @447
//rob read0 will unconditionally update retire entry0
assign retire_entry0_updt_vld = rob_read0_cmplted
                                && !retire_rob_rt_mask
                                && !rob_commit0_mask;
//rob read1 update retire entry1 when:
assign retire_entry1_updt_vld = rob_read1_cmplted
                                && !retire_rob_srt_en
                                && !retire_rob_rt_mask
                                && !rob_commit1_mask
                                && retire_entry0_updt_vld
                                && !rob_read0_abnormal
                                && !rob_read1_abnormal
                                && !rob_read1_data[ROB_RAS];
//rob read2 update retire entry2 when:
assign retire_entry2_updt_vld = rob_read2_cmplted
                                && !retire_rob_srt_en
                                && !retire_rob_rt_mask
                                && !rob_commit2_mask
                                && retire_entry0_updt_vld
                                && retire_entry1_updt_vld
                                && !rob_read0_abnormal
                                && !rob_read1_abnormal
                                && !rob_read2_abnormal
                                && !rob_read1_data[ROB_RAS]
                                && !rob_read2_data[ROB_RAS];
//retire entry0 update gateclk valid
assign retire_entry0_updt_gateclk_vld = rob_read0_cmplted_gateclk;
//inst valid for mem bkpt, ignore cmplt
assign retire_read0_inst_bkpt_inst_vld = rob_read0_inst_vld
                                         && !retire_rob_rt_mask
                                         && !rob_commit0_mask;

//----------------------------------------------------------
//           HAD Instruction Execution Dead Lock
//----------------------------------------------------------
//if rob read 0 inst valid but not cmplt when dbgreq_ack, signal exe dead
assign rtu_had_inst_exe_dead = rob_read0_inst_vld && !rob_read0_cmplted;

//----------------------------------------------------------
//                 HAD Memory BKPT signal
//----------------------------------------------------------
assign rob_read0_cmplted_bkpta_data = rob_read0_data[ROB_BKPTA_DATA]
                                      || rob_read0_pipe3_bkpta_data
                                      || rob_read0_pipe4_bkpta_data;
assign rob_read0_cmplted_bkptb_data = rob_read0_data[ROB_BKPTB_DATA]
                                      || rob_read0_pipe3_bkptb_data
                                      || rob_read0_pipe4_bkptb_data;
assign rob_read1_cmplted_bkpta_data = rob_read1_data[ROB_BKPTA_DATA]
                                      || rob_read1_pipe3_bkpta_data
                                      || rob_read1_pipe4_bkpta_data;
assign rob_read1_cmplted_bkptb_data = rob_read1_data[ROB_BKPTB_DATA]
                                      || rob_read1_pipe3_bkptb_data
                                      || rob_read1_pipe4_bkptb_data;
assign rob_read2_cmplted_bkpta_data = rob_read2_data[ROB_BKPTA_DATA]
                                      || rob_read2_pipe3_bkpta_data
                                      || rob_read2_pipe4_bkpta_data;
assign rob_read2_cmplted_bkptb_data = rob_read2_data[ROB_BKPTB_DATA]
                                      || rob_read2_pipe3_bkptb_data
                                      || rob_read2_pipe4_bkptb_data;

assign rtu_had_inst_bkpt_inst_vld   = retire_read0_inst_bkpt_inst_vld;
assign rtu_had_inst_bkpta_vld       = rob_read0_data[ROB_BKPTA_INST];
assign rtu_had_inst_bkptb_vld       = rob_read0_data[ROB_BKPTB_INST];
assign rtu_had_data_bkpta_vld       = rob_read0_cmplted_bkpta_data;
assign rtu_had_data_bkptb_vld       = rob_read0_cmplted_bkptb_data;
assign rtu_had_bkpt_data_st         = rob_read0_data[ROB_STORE];
assign rtu_had_xx_mbkpt_chgflow     = rob_read0_data[ROB_BJU];
assign rtu_had_inst_split           = rob_read0_data[ROB_SPLIT];

//----------------------------------------------------------
//                 no spec cmplt signal
//----------------------------------------------------------
assign rob_read0_cmplted_no_spec_hit     = rob_read0_data[ROB_NO_SPEC_HIT]
                                           || rob_read0_pipe3_no_spec_hit
                                           || rob_read0_pipe4_no_spec_hit;
assign rob_read0_cmplted_no_spec_miss    = rob_read0_data[ROB_NO_SPEC_MISS]
                                           || rob_read0_pipe3_no_spec_miss
                                           || rob_read0_pipe4_no_spec_miss;
assign rob_read0_cmplted_no_spec_mispred = rob_read0_data[ROB_NO_SPEC_MISPRED]
                                           || rob_read0_pipe3_no_spec_mispred
                                           || rob_read0_pipe4_no_spec_mispred;

assign rob_read1_cmplted_no_spec_hit     = rob_read1_data[ROB_NO_SPEC_HIT]
                                           || rob_read1_pipe3_no_spec_hit
                                           || rob_read1_pipe4_no_spec_hit;
assign rob_read1_cmplted_no_spec_miss    = rob_read1_data[ROB_NO_SPEC_MISS]
                                           || rob_read1_pipe3_no_spec_miss
                                           || rob_read1_pipe4_no_spec_miss;
assign rob_read1_cmplted_no_spec_mispred = rob_read1_data[ROB_NO_SPEC_MISPRED]
                                           || rob_read1_pipe3_no_spec_mispred
                                           || rob_read1_pipe4_no_spec_mispred;

assign rob_read2_cmplted_no_spec_hit     = rob_read2_data[ROB_NO_SPEC_HIT]
                                           || rob_read2_pipe3_no_spec_hit
                                           || rob_read2_pipe4_no_spec_hit;
assign rob_read2_cmplted_no_spec_miss    = rob_read2_data[ROB_NO_SPEC_MISS]
                                           || rob_read2_pipe3_no_spec_miss
                                           || rob_read2_pipe4_no_spec_miss;
assign rob_read2_cmplted_no_spec_mispred = rob_read2_data[ROB_NO_SPEC_MISPRED]
                                           || rob_read2_pipe3_no_spec_mispred
                                           || rob_read2_pipe4_no_spec_mispred;

//----------------------------------------------------------
//                 PCFIFO Pop Signal
//----------------------------------------------------------
assign rtu_iu_rob_read0_pcfifo_vld = retire_entry0_updt_vld && rob_read0_data[ROB_PCFIFO];
assign rtu_iu_rob_read1_pcfifo_vld = retire_entry1_updt_vld && rob_read1_data[ROB_PCFIFO];
assign rtu_iu_rob_read2_pcfifo_vld = retire_entry2_updt_vld && rob_read2_data[ROB_PCFIFO];

assign rtu_iu_rob_read_pcfifo_gateclk_vld =
             rob_read0_inst_vld && rob_read0_data[ROB_PCFIFO]
         ||  rob_read1_inst_vld && rob_read1_data[ROB_PCFIFO]
         ||  rob_read2_inst_vld && rob_read2_data[ROB_PCFIFO];

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign entry0_clk_en = rob_read0_inst_vld
                      || retire_inst0_vld
                      || retire_rob_flush_gateclk;
// &Instance("gated_clk_cell", "x_entry0_gated_clk"); @568
gated_clk_cell  x_entry0_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry0_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry0_clk_en     ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @569
//          .external_en (1'b0), @570
//          .global_en   (cp0_yy_clk_en), @571
//          .module_en   (cp0_rtu_icg_en), @572
//          .local_en    (entry0_clk_en), @573
//          .clk_out     (entry0_clk)); @574

assign entry1_clk_en = rob_read0_inst_vld
                      || retire_inst0_vld;
// &Instance("gated_clk_cell", "x_entry1_gated_clk"); @578
gated_clk_cell  x_entry1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry1_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry1_clk_en     ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @579
//          .external_en (1'b0), @580
//          .global_en   (cp0_yy_clk_en), @581
//          .module_en   (cp0_rtu_icg_en), @582
//          .local_en    (entry1_clk_en), @583
//          .clk_out     (entry1_clk)); @584

assign entry2_clk_en = rob_read0_inst_vld
                      || retire_inst0_vld;
// &Instance("gated_clk_cell", "x_entry2_gated_clk"); @588
gated_clk_cell  x_entry2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (entry2_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (entry2_clk_en     ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @589
//          .external_en (1'b0), @590
//          .global_en   (cp0_yy_clk_en), @591
//          .module_en   (cp0_rtu_icg_en), @592
//          .local_en    (entry2_clk_en), @593
//          .clk_out     (entry2_clk)); @594

//==========================================================
//                   Retire Entry Valid 
//==========================================================
assign rob_read0_pst_retire_vld = 
            !retire_inst0_inst_bkpt_updt_val
         && !(rob_read0_abnormal && expt_entry_expt_vld_updt_val);
assign rob_read0_pst_ereg_retire_vld = 
            !retire_inst0_inst_bkpt_updt_val;

always @(posedge entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_inst0_vld          <= 1'b0;
    retire_retire_inst0_vld   <= 1'b0;
    retire_pst_preg_inst0_vld <= 1'b0;
    retire_pst_vreg_inst0_vld <= 1'b0;
    retire_pst_ereg_inst0_vld <= 1'b0;
  end
  else if(retire_rob_flush) begin
    retire_inst0_vld          <= 1'b0;
    retire_retire_inst0_vld   <= 1'b0;
    retire_pst_preg_inst0_vld <= 1'b0;
    retire_pst_vreg_inst0_vld <= 1'b0;
    retire_pst_ereg_inst0_vld <= 1'b0;
  end
  else if(retire_entry0_updt_vld) begin
    retire_inst0_vld          <= 1'b1;
    retire_retire_inst0_vld   <= 1'b1;
    retire_pst_preg_inst0_vld <= rob_read0_pst_retire_vld;
    retire_pst_vreg_inst0_vld <= rob_read0_pst_retire_vld;
    retire_pst_ereg_inst0_vld <= rob_read0_pst_ereg_retire_vld;
  end
  else if(retire_inst0_vld) begin
    retire_inst0_vld          <= 1'b0;
    retire_retire_inst0_vld   <= 1'b0;
    retire_pst_preg_inst0_vld <= 1'b0;
    retire_pst_vreg_inst0_vld <= 1'b0;
    retire_pst_ereg_inst0_vld <= 1'b0;
  end
  else begin
    retire_inst0_vld          <= retire_inst0_vld;
    retire_retire_inst0_vld   <= retire_retire_inst0_vld;
    retire_pst_preg_inst0_vld <= retire_pst_preg_inst0_vld;
    retire_pst_vreg_inst0_vld <= retire_pst_vreg_inst0_vld;
    retire_pst_ereg_inst0_vld <= retire_pst_ereg_inst0_vld;
  end
end

always @(posedge entry1_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_inst1_vld          <= 1'b0;
    retire_retire_inst1_vld   <= 1'b0;
    retire_pst_preg_inst1_vld <= 1'b0;
    retire_pst_vreg_inst1_vld <= 1'b0;
    retire_pst_ereg_inst1_vld <= 1'b0;
  end
  else if(retire_rob_flush) begin
    retire_inst1_vld          <= 1'b0;
    retire_retire_inst1_vld   <= 1'b0;
    retire_pst_preg_inst1_vld <= 1'b0;
    retire_pst_vreg_inst1_vld <= 1'b0;
    retire_pst_ereg_inst1_vld <= 1'b0;
  end
  else if(retire_entry1_updt_vld) begin
    retire_inst1_vld          <= 1'b1;
    retire_retire_inst1_vld   <= 1'b1;
    retire_pst_preg_inst1_vld <= 1'b1;
    retire_pst_vreg_inst1_vld <= 1'b1;
    retire_pst_ereg_inst1_vld <= 1'b1;
  end
  else if(retire_inst1_vld) begin
    retire_inst1_vld          <= 1'b0;
    retire_retire_inst1_vld   <= 1'b0;
    retire_pst_preg_inst1_vld <= 1'b0;
    retire_pst_vreg_inst1_vld <= 1'b0;
    retire_pst_ereg_inst1_vld <= 1'b0;
  end
  else begin
    retire_inst1_vld          <= retire_inst1_vld;
    retire_retire_inst1_vld   <= retire_retire_inst1_vld;
    retire_pst_preg_inst1_vld <= retire_pst_preg_inst1_vld;
    retire_pst_vreg_inst1_vld <= retire_pst_vreg_inst1_vld;
    retire_pst_ereg_inst1_vld <= retire_pst_ereg_inst1_vld;
  end
end

always @(posedge entry2_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_inst2_vld          <= 1'b0;
    retire_retire_inst2_vld   <= 1'b0;
    retire_pst_preg_inst2_vld <= 1'b0;
    retire_pst_vreg_inst2_vld <= 1'b0;
    retire_pst_ereg_inst2_vld <= 1'b0;
  end
  else if(retire_rob_flush) begin
    retire_inst2_vld          <= 1'b0;
    retire_retire_inst2_vld   <= 1'b0;
    retire_pst_preg_inst2_vld <= 1'b0;
    retire_pst_vreg_inst2_vld <= 1'b0;
    retire_pst_ereg_inst2_vld <= 1'b0;
  end
  else if(retire_entry2_updt_vld) begin
    retire_inst2_vld          <= 1'b1;
    retire_retire_inst2_vld   <= 1'b1;
    retire_pst_preg_inst2_vld <= 1'b1;
    retire_pst_vreg_inst2_vld <= 1'b1;
    retire_pst_ereg_inst2_vld <= 1'b1;
  end
  else if(retire_inst2_vld) begin
    retire_inst2_vld          <= 1'b0;
    retire_retire_inst2_vld   <= 1'b0;
    retire_pst_preg_inst2_vld <= 1'b0;
    retire_pst_vreg_inst2_vld <= 1'b0;
    retire_pst_ereg_inst2_vld <= 1'b0; 
  end
  else begin
    retire_inst2_vld          <= retire_inst2_vld;
    retire_retire_inst2_vld   <= retire_retire_inst2_vld;
    retire_pst_preg_inst2_vld <= retire_pst_preg_inst2_vld;
    retire_pst_vreg_inst2_vld <= retire_pst_vreg_inst2_vld;
    retire_pst_ereg_inst2_vld <= retire_pst_ereg_inst2_vld;
  end
end

//rename for output
assign rtu_yy_xx_retire0 = retire_inst0_vld;
assign rtu_yy_xx_retire1 = retire_inst1_vld;
assign rtu_yy_xx_retire2 = retire_inst2_vld;

assign rtu_pad_retire0   = retire_inst0_vld;
assign rtu_pad_retire1   = retire_inst1_vld;
assign rtu_pad_retire2   = retire_inst2_vld;

assign rob_retire_inst0_vld = retire_retire_inst0_vld;
assign rob_retire_inst1_vld = retire_retire_inst1_vld;
assign rob_retire_inst2_vld = retire_retire_inst2_vld;

assign rob_retire_inst0_pst_preg_vld = retire_pst_preg_inst0_vld;
assign rob_retire_inst1_pst_preg_vld = retire_pst_preg_inst1_vld;
assign rob_retire_inst2_pst_preg_vld = retire_pst_preg_inst2_vld;

assign rob_retire_inst0_pst_vreg_vld = retire_pst_vreg_inst0_vld;
assign rob_retire_inst1_pst_vreg_vld = retire_pst_vreg_inst1_vld;
assign rob_retire_inst2_pst_vreg_vld = retire_pst_vreg_inst2_vld;

assign rob_retire_inst0_pst_ereg_vld = retire_pst_ereg_inst0_vld;
assign rob_retire_inst1_pst_ereg_vld = retire_pst_ereg_inst1_vld;
assign rob_retire_inst2_pst_ereg_vld = retire_pst_ereg_inst2_vld;

assign retire_expt_inst0_vld = retire_inst0_vld;

//==========================================================
//                 PCFIFO Pop Data select
//==========================================================
assign rob_read0_pcfifo_data[PCFIFO_POP_WIDTH-1:0] =
         iu_rtu_pcfifo_pop0_data[PCFIFO_POP_WIDTH-1:0];

assign rob_read1_pcfifo_data[PCFIFO_POP_WIDTH-1:0] =
         (rob_read0_data[ROB_PCFIFO]) ? iu_rtu_pcfifo_pop1_data[PCFIFO_POP_WIDTH-1:0]
                            : iu_rtu_pcfifo_pop0_data[PCFIFO_POP_WIDTH-1:0];
// &CombBeg; @758
always @( rob_read1_data[10]
       or iu_rtu_pcfifo_pop0_data[47:0]
       or iu_rtu_pcfifo_pop1_data[47:0]
       or rob_read0_data[10]
       or iu_rtu_pcfifo_pop2_data[47:0])
begin
  if(rob_read0_data[ROB_PCFIFO] && rob_read1_data[ROB_PCFIFO])
    rob_read2_pcfifo_data[PCFIFO_POP_WIDTH-1:0] =
         iu_rtu_pcfifo_pop2_data[PCFIFO_POP_WIDTH-1:0];
  else if(rob_read0_data[ROB_PCFIFO] || rob_read1_data[ROB_PCFIFO])
    rob_read2_pcfifo_data[PCFIFO_POP_WIDTH-1:0] =
         iu_rtu_pcfifo_pop1_data[PCFIFO_POP_WIDTH-1:0];
  else
    rob_read2_pcfifo_data[PCFIFO_POP_WIDTH-1:0] =
         iu_rtu_pcfifo_pop0_data[PCFIFO_POP_WIDTH-1:0];
// &CombEnd; @768
end

assign rob_read0_next_pc[38:0] = rob_read0_pcfifo_data[39:1];
assign rob_read1_next_pc[38:0] = rob_read1_pcfifo_data[39:1];
assign rob_read2_next_pc[38:0] = rob_read2_pcfifo_data[39:1];

//==========================================================
//                  Retire Entry Content
//==========================================================
assign retire_inst0_create_data[51]    = rob_read0_data[ROB_VL_PRED];
assign retire_inst0_create_data[50:43] = rob_read0_data[ROB_VL:ROB_VL-7];
assign retire_inst0_create_data[42]    = rob_read0_data[ROB_VEC_DIRTY];
assign retire_inst0_create_data[41]    = rob_read0_data[ROB_VSETVLI];
assign retire_inst0_create_data[40:38] = rob_read0_data[ROB_VSEW:ROB_VSEW-2];
assign retire_inst0_create_data[37:36] = rob_read0_data[ROB_VLMUL:ROB_VLMUL-1];
assign retire_inst0_create_data[35]    = rob_read0_cmplted_no_spec_mispred;
assign retire_inst0_create_data[34]    = rob_read0_cmplted_no_spec_miss;
assign retire_inst0_create_data[33]    = rob_read0_cmplted_no_spec_hit;
assign retire_inst0_create_data[32]    = rob_read0_data[ROB_LOAD];
assign retire_inst0_create_data[31]    = rob_read0_data[ROB_FP_DIRTY];
assign retire_inst0_create_data[30]    = rob_read0_data[ROB_BKPTB_INST];
assign retire_inst0_create_data[29]    = rob_read0_data[ROB_BKPTA_INST];
assign retire_inst0_create_data[28]    = rob_read0_cmplted_bkpta_data;
assign retire_inst0_create_data[27]    = rob_read0_cmplted_bkptb_data;
assign retire_inst0_create_data[26]    = rob_read0_data[ROB_STORE];
assign retire_inst0_create_data[25:24] = rob_read0_data[ROB_INST_NUM:ROB_INST_NUM-1];
assign retire_inst0_create_data[23]    = rob_read0_pcfifo_data[42]; //pret
assign retire_inst0_create_data[22:20] = rob_read0_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2];
assign retire_inst0_create_data[19]    = rob_read0_pcfifo_data[43]; //jmp
assign retire_inst0_create_data[18]    = rob_read0_pcfifo_data[46] //bht_pred
                                         ^ rob_read0_pcfifo_data[44]; //bht_mispred
assign retire_inst0_create_data[17]    = rob_read0_pcfifo_data[40]; //condbr
assign retire_inst0_create_data[16:9]  = rob_read0_pcfifo_data[11:4]; //chk_idx[7:0]
assign retire_inst0_create_data[8]     = rob_read0_data[ROB_BJU];
assign retire_inst0_create_data[7]     = rob_read0_data[ROB_SPLIT];
assign retire_inst0_create_data[6:0]   = rob_read0_iid[6:0];

assign retire_inst1_create_data[51]    = rob_read1_data[ROB_VL_PRED];
assign retire_inst1_create_data[50:43] = rob_read1_data[ROB_VL:ROB_VL-7];
assign retire_inst1_create_data[42]    = rob_read1_data[ROB_VEC_DIRTY]; 
assign retire_inst1_create_data[41]    = rob_read1_data[ROB_VSETVLI];
assign retire_inst1_create_data[40:38] = rob_read1_data[ROB_VSEW:ROB_VSEW-2];
assign retire_inst1_create_data[37:36] = rob_read1_data[ROB_VLMUL:ROB_VLMUL-1];
assign retire_inst1_create_data[35]    = rob_read1_cmplted_no_spec_mispred;
assign retire_inst1_create_data[34]    = rob_read1_cmplted_no_spec_miss;
assign retire_inst1_create_data[33]    = rob_read1_cmplted_no_spec_hit;
assign retire_inst1_create_data[32]    = rob_read1_data[ROB_LOAD]; 
assign retire_inst1_create_data[31]    = rob_read1_data[ROB_FP_DIRTY]; 
assign retire_inst1_create_data[30]    = rob_read1_data[ROB_BKPTB_INST]; 
assign retire_inst1_create_data[29]    = rob_read1_data[ROB_BKPTA_INST];
assign retire_inst1_create_data[28]    = rob_read1_cmplted_bkpta_data;
assign retire_inst1_create_data[27]    = rob_read1_cmplted_bkptb_data;
assign retire_inst1_create_data[26]    = rob_read1_data[ROB_STORE]; 
assign retire_inst1_create_data[25:24] = rob_read1_data[ROB_INST_NUM:ROB_INST_NUM-1]; 
assign retire_inst1_create_data[23]    = rob_read1_pcfifo_data[42]; //pret
assign retire_inst1_create_data[22:20] = rob_read1_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2]; 
assign retire_inst1_create_data[19]    = rob_read1_pcfifo_data[43]; //jmp
assign retire_inst1_create_data[18]    = rob_read1_pcfifo_data[46] //bht_pred
                                         ^ rob_read1_pcfifo_data[44]; //bht_mispred
assign retire_inst1_create_data[17]    = rob_read1_pcfifo_data[40]; //condbr
assign retire_inst1_create_data[16:9]  = rob_read1_pcfifo_data[11:4]; //chk_idx[7:0]
assign retire_inst1_create_data[8]     = rob_read1_data[ROB_BJU]; 
assign retire_inst1_create_data[7]     = rob_read1_data[ROB_SPLIT]; 
assign retire_inst1_create_data[6:0]   = rob_read1_iid[6:0];

assign retire_inst2_create_data[51]    = rob_read2_data[ROB_VL_PRED];
assign retire_inst2_create_data[50:43] = rob_read2_data[ROB_VL:ROB_VL-7];
assign retire_inst2_create_data[42]    = rob_read2_data[ROB_VEC_DIRTY];
assign retire_inst2_create_data[41]    = rob_read2_data[ROB_VSETVLI];
assign retire_inst2_create_data[40:38] = rob_read2_data[ROB_VSEW:ROB_VSEW-2];
assign retire_inst2_create_data[37:36] = rob_read2_data[ROB_VLMUL:ROB_VLMUL-1];
assign retire_inst2_create_data[35]    = rob_read2_cmplted_no_spec_mispred;
assign retire_inst2_create_data[34]    = rob_read2_cmplted_no_spec_miss;
assign retire_inst2_create_data[33]    = rob_read2_cmplted_no_spec_hit;
assign retire_inst2_create_data[32]    = rob_read2_data[ROB_LOAD];
assign retire_inst2_create_data[31]    = rob_read2_data[ROB_FP_DIRTY];
assign retire_inst2_create_data[30]    = rob_read2_data[ROB_BKPTB_INST];
assign retire_inst2_create_data[29]    = rob_read2_data[ROB_BKPTA_INST];
assign retire_inst2_create_data[28]    = rob_read2_cmplted_bkpta_data;
assign retire_inst2_create_data[27]    = rob_read2_cmplted_bkptb_data;
assign retire_inst2_create_data[26]    = rob_read2_data[ROB_STORE];
assign retire_inst2_create_data[25:24] = rob_read2_data[ROB_INST_NUM:ROB_INST_NUM-1];
assign retire_inst2_create_data[23]    = rob_read2_pcfifo_data[42]; //pret
assign retire_inst2_create_data[22:20] = rob_read2_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2];
assign retire_inst2_create_data[19]    = rob_read2_pcfifo_data[43]; //jmp
assign retire_inst2_create_data[18]    = rob_read2_pcfifo_data[46] //bht_pred
                                         ^ rob_read2_pcfifo_data[44]; //bht_mispred
assign retire_inst2_create_data[17]    = rob_read2_pcfifo_data[40]; //condbr
assign retire_inst2_create_data[16:9]  = rob_read2_pcfifo_data[11:4]; //chk_idx[7:0]
assign retire_inst2_create_data[8]     = rob_read2_data[ROB_BJU];
assign retire_inst2_create_data[7]     = rob_read2_data[ROB_SPLIT];
assign retire_inst2_create_data[6:0]   = rob_read2_iid[6:0];

always @(posedge entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst0_data[RT_WIDTH-1:0] <= {RT_WIDTH{1'b0}};
  else if(retire_entry0_updt_vld)
    retire_inst0_data[RT_WIDTH-1:0] <= retire_inst0_create_data[RT_WIDTH-1:0];
  else
    retire_inst0_data[RT_WIDTH-1:0] <= retire_inst0_data[RT_WIDTH-1:0];
end

always @(posedge entry1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst1_data[RT_WIDTH-1:0] <= {RT_WIDTH{1'b0}};
  //timing optimization, use entry0 updt valid
  else if(retire_entry0_updt_vld)
    retire_inst1_data[RT_WIDTH-1:0] <= retire_inst1_create_data[RT_WIDTH-1:0];
  else
    retire_inst1_data[RT_WIDTH-1:0] <= retire_inst1_data[RT_WIDTH-1:0];
end

always @(posedge entry2_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst2_data[RT_WIDTH-1:0] <= {RT_WIDTH{1'b0}};
  //timing optimization, use entry0 updt valid
  else if(retire_entry0_updt_vld)
    retire_inst2_data[RT_WIDTH-1:0] <= retire_inst2_create_data[RT_WIDTH-1:0];
  else
    retire_inst2_data[RT_WIDTH-1:0] <= retire_inst2_data[RT_WIDTH-1:0];
end

//----------------------------------------------------------
//                   Rename for output
//----------------------------------------------------------
assign retire_inst0_iid[6:0]           = retire_inst0_data[6:0];
assign retire_inst1_iid[6:0]           = retire_inst1_data[6:0];
assign retire_inst2_iid[6:0]           = retire_inst2_data[6:0];
assign rob_pst_retire_inst0_iid[6:0]   = retire_inst0_iid[6:0];
assign rob_pst_retire_inst1_iid[6:0]   = retire_inst1_iid[6:0];
assign rob_pst_retire_inst2_iid[6:0]   = retire_inst2_iid[6:0];

assign rob_expt_inst0_iid[6:0]         = retire_inst0_iid[6:0];

assign rob_retire_inst0_iid[6:0]       = retire_inst0_iid[6:0];
//assign rob_retire_inst1_iid[6:0]       = retire_inst1_iid[6:0];
//assign rob_retire_inst2_iid[6:0]       = retire_inst2_iid[6:0];

assign retire_inst0_split              = retire_inst0_data[7];
assign retire_inst1_split              = retire_inst1_data[7];
assign retire_inst2_split              = retire_inst2_data[7];

assign rob_retire_inst0_split          = retire_inst0_split;
assign rob_retire_inst1_split          = retire_inst1_split;
assign rob_retire_inst2_split          = retire_inst2_split;
assign retire_inst0_bju                = retire_inst0_data[8];
assign retire_inst1_bju                = retire_inst1_data[8];
assign retire_inst2_bju                = retire_inst2_data[8];

assign rob_retire_inst0_bju            = retire_inst0_bju;
assign rob_retire_inst1_bju            = retire_inst1_bju;
assign rob_retire_inst2_bju            = retire_inst2_bju;

assign rob_retire_inst0_chk_idx[7:0]   = retire_inst0_data[16:9];
assign rob_retire_inst1_chk_idx[7:0]   = retire_inst1_data[16:9];
assign rob_retire_inst2_chk_idx[7:0]   = retire_inst2_data[16:9];

assign retire_inst0_condbr             = retire_inst0_bju && retire_inst0_data[17];
assign retire_inst1_condbr             = retire_inst1_bju && retire_inst1_data[17];
assign retire_inst2_condbr             = retire_inst2_bju && retire_inst2_data[17];

assign rob_retire_inst0_condbr         = retire_inst0_condbr;
assign rob_retire_inst1_condbr         = retire_inst1_condbr;
assign rob_retire_inst2_condbr         = retire_inst2_condbr;

assign rob_retire_inst0_condbr_taken   = retire_inst0_data[18];
assign rob_retire_inst1_condbr_taken   = retire_inst1_data[18];
assign rob_retire_inst2_condbr_taken   = retire_inst2_data[18];

assign retire_inst0_jmp                = retire_inst0_bju && retire_inst0_data[19];
assign retire_inst1_jmp                = retire_inst1_bju && retire_inst1_data[19];
assign retire_inst2_jmp                = retire_inst2_bju && retire_inst2_data[19];

assign rob_retire_inst0_jmp            = retire_inst0_jmp;
assign rob_retire_inst1_jmp            = retire_inst1_jmp;
assign rob_retire_inst2_jmp            = retire_inst2_jmp;

assign retire_entry0_pc_offset[2:0]    = retire_inst0_data[22:20];
assign retire_entry1_pc_offset[2:0]    = retire_inst1_data[22:20];
assign retire_entry2_pc_offset[2:0]    = retire_inst2_data[22:20];

assign rob_retire_inst0_pret           = retire_inst0_bju && retire_inst0_data[23];
                   
assign retire_inst0_num[1:0]           = retire_inst0_data[25:24];
assign retire_inst1_num[1:0]           = retire_inst1_data[25:24];
assign retire_inst2_num[1:0]           = retire_inst2_data[25:24];

assign retire_inst0_store              = retire_inst0_data[26];
assign retire_inst1_store              = retire_inst1_data[26];
assign retire_inst2_store              = retire_inst2_data[26];

assign rob_retire_inst0_load           = retire_inst0_data[32];
assign rob_retire_inst1_load           = retire_inst1_data[32];
assign rob_retire_inst2_load           = retire_inst2_data[32];

assign rob_retire_inst0_num[1:0]       = retire_inst0_num[1:0];
assign rob_retire_inst1_num[1:0]       = retire_inst1_num[1:0];
assign rob_retire_inst2_num[1:0]       = retire_inst2_num[1:0];

assign rob_retire_inst0_pc_offset[2:0] = retire_entry0_pc_offset[2:0];
assign rob_retire_inst1_pc_offset[2:0] = retire_entry1_pc_offset[2:0];
assign rob_retire_inst2_pc_offset[2:0] = retire_entry2_pc_offset[2:0];

assign rob_retire_inst0_store          = retire_inst0_store;
assign rob_retire_inst1_store          = retire_inst1_store;
assign rob_retire_inst2_store          = retire_inst2_store;

//{inst_bkptb, inst_bkpta, data_bkptb, data_bkpta}
assign rtu_had_inst0_non_irv_bkpt[3:0]  = retire_inst0_data[30:27];
assign rtu_had_inst1_non_irv_bkpt[3:0]  = retire_inst1_data[30:27];
assign rtu_had_inst2_non_irv_bkpt[3:0]  = retire_inst2_data[30:27];

assign rob_retire_inst0_fp_dirty        = retire_inst0_data[31];
assign rob_retire_inst1_fp_dirty        = retire_inst1_data[31];
assign rob_retire_inst2_fp_dirty        = retire_inst2_data[31];

assign rob_retire_inst0_vec_dirty       = retire_inst0_data[42];
assign rob_retire_inst1_vec_dirty       = retire_inst1_data[42];
assign rob_retire_inst2_vec_dirty       = retire_inst2_data[42];

assign rob_retire_inst0_no_spec_hit     = retire_inst0_data[33];
assign rob_retire_inst1_no_spec_hit     = retire_inst1_data[33];
assign rob_retire_inst2_no_spec_hit     = retire_inst2_data[33];

assign rob_retire_inst0_no_spec_miss    = retire_inst0_data[34];
assign rob_retire_inst1_no_spec_miss    = retire_inst1_data[34];
assign rob_retire_inst2_no_spec_miss    = retire_inst2_data[34];

assign rob_retire_inst0_no_spec_mispred = retire_inst0_data[35];
assign rob_retire_inst1_no_spec_mispred = retire_inst1_data[35];
assign rob_retire_inst2_no_spec_mispred = retire_inst2_data[35];

assign rob_retire_inst0_vlmul[1:0]      = retire_inst0_data[37:36];
assign rob_retire_inst1_vlmul[1:0]      = retire_inst1_data[37:36];
assign rob_retire_inst2_vlmul[1:0]      = retire_inst2_data[37:36];

assign rob_retire_inst0_vsew[2:0]       = retire_inst0_data[40:38];
assign rob_retire_inst1_vsew[2:0]       = retire_inst1_data[40:38];
assign rob_retire_inst2_vsew[2:0]       = retire_inst2_data[40:38];

assign rob_retire_inst0_vsetvli         = retire_inst0_data[41];
assign rob_retire_inst1_vsetvli         = retire_inst1_data[41];
assign rob_retire_inst2_vsetvli         = retire_inst2_data[41];

assign rob_retire_inst0_vl[7:0]         = retire_inst0_data[50:43];
assign rob_retire_inst1_vl[7:0]         = retire_inst1_data[50:43];
assign rob_retire_inst2_vl[7:0]         = retire_inst2_data[50:43];

assign rob_retire_inst0_vl_pred         = retire_inst0_data[51];
assign rob_retire_inst1_vl_pred         = retire_inst1_data[51];
assign rob_retire_inst2_vl_pred         = retire_inst2_data[51];

//==========================================================
//            Retire Inst 0 Special Entry Content
//==========================================================
////----------------------------------------------------------
////                Inst Memory breakpoint
////----------------------------------------------------------
//assign bkpta_base[31:0] = had_yy_xx_bkpta_base[31:0];
//assign bkptb_base[31:0] = had_yy_xx_bkptb_base[31:0];
//
//assign bkpta_mask[31:0] = {24'hffffff,had_yy_xx_bkpta_mask[7:0]};
//assign bkptb_mask[31:0] = {24'hffffff,had_yy_xx_bkptb_mask[7:0]};
//
//assign rob_read0_base_pc[31:0] = {rob_read0_cur_pc[37:0], 1'b0};
//
//assign rob_read0_data[ROB_BKPTA_INST] = ((rob_read0_base_pc[31:0] & bkpta_mask[31:0])
//                                ==  (bkpta_base[31:0]   & bkpta_mask[31:0]))
//                                ^ had_yy_xx_bkpta_rc;
//
//assign rob_read0_data[ROB_BKPTB_INST] = ((rob_read0_base_pc[31:0] & bkptb_mask[31:0])
//                                ==  (bkptb_base[31:0]   & bkptb_mask[31:0]))
//                                ^ had_yy_xx_bkptb_rc;

//----------------------------------------------------------
//                     Interrupt
//----------------------------------------------------------
//interrupt will trigger single retire, int can only hit retire/read
//inst 0. when in trace mode, disable interrupt 

//if there are 3 inst commiting (rob_commit2), inst0 must be retiring
//(because of rob_commit1). rob_read0/1 may both retire at next cycle
//if set srt mode and signal int_vld, rob_read1 cannot retire at next cycle
//and will be wrongly flushed after committed. so do not signal int when
//3 inst commiting.
//if there are 2 inst commiting, there will be at most 1 inst retiring at
//next cycle, so can signal int when 1/2 inst committing
assign rob_read0_int_vld      = !cp0_rtu_xx_int_b && !had_rtu_xx_tme
                                && !rob_commit2;
assign rob_read0_int_vec[4:0] = cp0_rtu_xx_vec[4:0];

assign rob_retire_int_srt_en  = rob_read0_int_vld;
assign rob_int_commit_mask    = !cp0_rtu_xx_int_b && !had_rtu_xx_tme;

//----------------------------------------------------------
//                     Debug Disable
//----------------------------------------------------------
//similar to interrupt, the debug request can only hit retire/read
//inst0 and cannot interrupt inst already committed
assign rob_read0_dbg_disable  = had_rtu_dbg_req_en && rob_commit2;
assign rob_dbg_commit_mask    = had_rtu_dbg_req_en;

//----------------------------------------------------------
//                     CTC Flush Request
//----------------------------------------------------------
assign rob_read0_ctc_flush          = retire_rob_ctc_flush_req
                                      && !rob_commit2;

assign rob_retire_ctc_flush_srt_en  = rob_read0_ctc_flush;
assign rob_ctc_flush_commit_mask    = retire_rob_ctc_flush_req;

//----------------------------------------------------------
//            retire inst0 special entry content
//----------------------------------------------------------
always @(posedge entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_inst0_abnormal       <= 1'b0;
    retire_inst0_int_vld        <= 1'b0;
    retire_inst0_int_vec[4:0]   <= 5'b0;
    retire_inst0_ras            <= 1'b0;
    retire_inst0_pcal           <= 1'b0;
    retire_inst0_bju_length     <= 1'b0;
    retire_inst0_intmask        <= 1'b0;
    retire_inst0_data_bkpt      <= 1'b0;
    retire_inst0_dbg_disable    <= 1'b0;
    retire_inst0_ctc_flush      <= 1'b0;
  end
  else if(retire_entry0_updt_vld) begin
    retire_inst0_abnormal       <= rob_read0_abnormal;
    retire_inst0_int_vld        <= rob_read0_int_vld;
    retire_inst0_int_vec[4:0]   <= rob_read0_int_vec[4:0];
    retire_inst0_ras            <= rob_read0_data[ROB_RAS];
    retire_inst0_pcal           <= rob_read0_pcfifo_data[41]; //pcall
    retire_inst0_bju_length     <= rob_read0_pcfifo_data[47]; //length
    retire_inst0_intmask        <= rob_read0_data[ROB_INTMASK];
    retire_inst0_data_bkpt      <= had_rtu_data_bkpt_dbgreq;
    retire_inst0_dbg_disable    <= rob_read0_dbg_disable;
    retire_inst0_ctc_flush      <= rob_read0_ctc_flush;
  end
  else begin
    retire_inst0_abnormal       <= retire_inst0_abnormal;
    retire_inst0_int_vld        <= retire_inst0_int_vld;
    retire_inst0_int_vec[4:0]   <= retire_inst0_int_vec[4:0];
    retire_inst0_ras            <= retire_inst0_ras;
    retire_inst0_pcal           <= retire_inst0_pcal;
    retire_inst0_bju_length     <= retire_inst0_bju_length;
    retire_inst0_intmask        <= retire_inst0_intmask;
    retire_inst0_data_bkpt      <= retire_inst0_data_bkpt;
    retire_inst0_dbg_disable    <= retire_inst0_dbg_disable;
    retire_inst0_ctc_flush      <= retire_inst0_ctc_flush;
  end
end

//rename for output
assign retire_expt_inst0_abnormal    = retire_inst0_abnormal;

assign rob_retire_inst0_int_vld      = retire_inst0_int_vld;
assign rob_retire_inst0_int_vec[4:0] = retire_inst0_int_vec[4:0];
assign rob_retire_inst0_intmask      = retire_inst0_intmask;
assign rob_retire_inst0_pcal         = retire_inst0_bju && retire_inst0_pcal;
assign rob_retire_inst0_ras          = retire_inst0_bju && retire_inst0_ras;
assign rob_retire_inst0_data_bkpt    = retire_inst0_data_bkpt;
assign rob_retire_inst0_dbg_disable  = retire_inst0_dbg_disable;
assign rob_retire_inst0_ctc_flush    = retire_inst0_ctc_flush;

assign rtu_idu_retire_int_vld        = retire_inst0_int_vld;

//----------------------------------------------------------
//                   inst bkpt valid
//----------------------------------------------------------
assign retire_inst0_inst_bkpt_updt_val = (retire_read0_inst_bkpt_inst_vld)
                                         ? had_rtu_inst_bkpt_dbgreq
                                         : retire_inst0_inst_bkpt;
//inst bkpt do not wait for cmplt
always @(posedge entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst0_inst_bkpt      <= 1'b0;
  else if(retire_rob_flush)
    retire_inst0_inst_bkpt      <= 1'b0;
  else if(retire_read0_inst_bkpt_inst_vld)
    retire_inst0_inst_bkpt      <= had_rtu_inst_bkpt_dbgreq;
  else
    retire_inst0_inst_bkpt      <= retire_inst0_inst_bkpt;
end

assign rob_retire_inst0_inst_bkpt    = retire_inst0_inst_bkpt;

//==========================================================
//                Retire inst 0/1/2 Current PC
//==========================================================
//----------------------------------------------------------
//                 prepare pc maintain signals
//----------------------------------------------------------
//add offset
assign rob_read0_pc_offset[4:0] = {2'b0,rob_read0_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2]};
assign rob_read1_pc_offset[4:0] = {2'b0,rob_read1_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2]};
assign rob_read2_pc_offset[4:0] = {2'b0,rob_read2_data[ROB_PC_OFFSET:ROB_PC_OFFSET-2]};

//----------------------------------------------------------
//                 ROB Read 0/1/2 Current PC
//             (Retire inst 0/1/2 cur pc updt val)
//----------------------------------------------------------
//when split fof flush, ifu change flow pc should be next pc of split
//fof inst whose addend1 must be 0 (it is split inst), so change flow
//pc will be addend0 + 0 (addend1) + 2
assign rob_read0_cur_pc[38:0]         = retire_rob_split_fof_flush
                                        ? rob_cur_pc_plus_2[38:0]
                                        : rob_cur_pc[38:0];

assign rob_read1_cur_pc_addend0[38:0] = (rob_read0_data[ROB_BJU]) ? rob_read0_next_pc[38:0]
                                                        : rob_cur_pc[38:0];
//pc offset will be 0 if bju
assign rob_read1_cur_pc_addend1[4:0]  = rob_read0_pc_offset[4:0];

// &CombBeg; @1196
always @( rob_cur_pc[38:0]
       or rob_read1_data[9]
       or rob_read0_next_pc[38:0]
       or rob_read1_next_pc[38:0]
       or rob_read0_data[9])
begin
  if(rob_read1_data[ROB_BJU])
    rob_read2_cur_pc_addend0[38:0]    = rob_read1_next_pc[38:0];
  else if(rob_read0_data[ROB_BJU])
    rob_read2_cur_pc_addend0[38:0]    = rob_read0_next_pc[38:0];
  else
    rob_read2_cur_pc_addend0[38:0]    = rob_cur_pc[38:0];
// &CombEnd; @1203
end

//pc offset will be 0 if bju
assign rob_read2_cur_pc_addend1[4:0]  = (rob_read1_data[ROB_BJU])
                                        ? 5'b0 : rob_read0_pc_offset[4:0]
                                               + rob_read1_pc_offset[4:0];

//----------------------------------------------------------
//                  ROB Read 2 Next PC
//                 (ROB cur pc updt val)
//----------------------------------------------------------
// &CombBeg; @1214
always @( rob_cur_pc[38:0]
       or rob_read1_data[9]
       or rob_read0_next_pc[38:0]
       or rob_read1_next_pc[38:0]
       or rob_read2_next_pc[38:0]
       or rob_read2_data[9]
       or rob_read0_data[9])
begin
  if(rob_read2_data[ROB_BJU])
    rob_read2_next_pc_addend0[38:0] = rob_read2_next_pc[38:0];
  else if(rob_read1_data[ROB_BJU])
    rob_read2_next_pc_addend0[38:0] = rob_read1_next_pc[38:0];
  else if(rob_read0_data[ROB_BJU])
    rob_read2_next_pc_addend0[38:0] = rob_read0_next_pc[38:0];
  else
    rob_read2_next_pc_addend0[38:0] = rob_cur_pc[38:0];
// &CombEnd; @1223
end

//pc offset will be 0 if bju
// &CombBeg; @1226
always @( rob_read1_data[9]
       or rob_read1_pc_offset[4:0]
       or rob_read0_pc_offset[4:0]
       or rob_read2_pc_offset[4:0]
       or rob_read2_data[9])
begin
  if(rob_read2_data[ROB_BJU])
    rob_read2_next_pc_addend1[4:0]  = 5'b0;
  else if(rob_read1_data[ROB_BJU])
    rob_read2_next_pc_addend1[4:0]  = rob_read2_pc_offset[4:0];
  else
    rob_read2_next_pc_addend1[4:0]  = rob_read0_pc_offset[4:0]
                                      + rob_read1_pc_offset[4:0]
                                      + rob_read2_pc_offset[4:0];
// &CombEnd; @1235
end

//----------------------------------------------------------
//               Retire inst 0 Current PC
//----------------------------------------------------------
//if retire inst flush, flop rob cur pc and then output to IFU for timing
//if inst bkpt, flop rob_read0_cur_pc and then output for HAD
assign retire_inst0_cur_pc_updt_vld = retire_entry0_updt_vld
                                      || retire_rob_inst_flush
                                      || had_rtu_inst_bkpt_dbgreq;
always @(posedge entry0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_inst0_cur_pc[38:0] <= 39'b0;
  else if(retire_inst0_cur_pc_updt_vld)
    retire_inst0_cur_pc[38:0] <= rob_read0_cur_pc[38:0];
  else
    retire_inst0_cur_pc[38:0] <= retire_inst0_cur_pc[38:0];
end
//output
assign rob_retire_inst0_cur_pc[38:0]  = retire_inst0_cur_pc[38:0];
//for pad
assign rtu_pad_retire0_pc[39:0]       = {retire_inst0_cur_pc[38:0],1'b0};
//retire inst0 branch increase pc
assign rob_retire_inst0_bju_inc_pc[38:0] = retire_inst0_cur_pc[38:0]
                                           + {37'b0, retire_inst0_bju_length,
                                                    !retire_inst0_bju_length};
//retire inst0 next pc
assign rob_retire_inst0_next_pc[38:0] = (retire_inst1_vld)
                                        ? rob_retire_inst1_cur_pc[38:0]
                                        : rob_cur_pc[38:0];

//----------------------------------------------------------
//               Retire inst 1 Current PC
//----------------------------------------------------------
always @(posedge entry1_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_inst1_cur_pc_addend0[38:0] <= 39'b0;
    retire_inst1_cur_pc_addend1[4:0]  <= 5'b0;
  end
  else if(retire_entry1_updt_vld) begin
    retire_inst1_cur_pc_addend0[38:0] <= rob_read1_cur_pc_addend0[38:0];
    retire_inst1_cur_pc_addend1[4:0]  <= rob_read1_cur_pc_addend1[4:0];
  end
  else begin
    retire_inst1_cur_pc_addend0[38:0] <= retire_inst1_cur_pc_addend0[38:0];
    retire_inst1_cur_pc_addend1[4:0]  <= retire_inst1_cur_pc_addend1[4:0];
  end
end
//output
// &Force("output","rob_retire_inst1_cur_pc"); @1299
assign rob_retire_inst1_cur_pc[38:0]  = retire_inst1_cur_pc_addend0[38:0]
                                        + {34'b0, retire_inst1_cur_pc_addend1[4:0]};
//for pad
assign rtu_pad_retire1_pc[39:0]       = {rob_retire_inst1_cur_pc[38:0],1'b0};
//retire inst1 next pc
assign rob_retire_inst1_next_pc[38:0] = (retire_inst2_vld)
                                        ? rob_retire_inst2_cur_pc[38:0]
                                        : rob_cur_pc[38:0];

//----------------------------------------------------------
//               Retire inst 2 Current PC
//----------------------------------------------------------
always @(posedge entry2_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_inst2_cur_pc_addend0[38:0] <= 39'b0;
    retire_inst2_cur_pc_addend1[4:0]  <= 5'b0;
  end
  else if(retire_entry2_updt_vld) begin
    retire_inst2_cur_pc_addend0[38:0] <= rob_read2_cur_pc_addend0[38:0];
    retire_inst2_cur_pc_addend1[4:0]  <= rob_read2_cur_pc_addend1[4:0];
  end
  else begin
    retire_inst2_cur_pc_addend0[38:0] <= retire_inst2_cur_pc_addend0[38:0];
    retire_inst2_cur_pc_addend1[4:0]  <= retire_inst2_cur_pc_addend1[4:0];
  end
end
//output
// &Force("output","rob_retire_inst2_cur_pc"); @1328
assign rob_retire_inst2_cur_pc[38:0]  = retire_inst2_cur_pc_addend0[38:0]
                                        + {34'b0, retire_inst2_cur_pc_addend1[4:0]};
//for pad
assign rtu_pad_retire2_pc[39:0]       = {rob_retire_inst2_cur_pc[38:0],1'b0};
//retire inst2 next pc
assign rob_retire_inst2_next_pc[38:0] = rob_cur_pc[38:0];

//==========================================================
//                   ROB Current PC
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign pc_clk_en = retire_rob_flush_gateclk
                   || rob_read0_inst_vld
                   || ifu_rtu_cur_pc_load;
// &Instance("gated_clk_cell", "x_pc_gated_clk"); @1345
gated_clk_cell  x_pc_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pc_clk            ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pc_clk_en         ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1346
//          .external_en (1'b0), @1347
//          .global_en   (cp0_yy_clk_en), @1348
//          .module_en   (cp0_rtu_icg_en), @1349
//          .local_en    (pc_clk_en), @1350
//          .clk_out     (pc_clk)); @1351

//----------------------------------------------------------
//              Prepare ROB cur PC condition
//----------------------------------------------------------
//if rob read0 is rte/rfi, rob read0 next pc will be EPC/FPC from CP0
//rte/rfi is fence inst, ROB can only bypass rte/rfi info from Cbus,
//no rob read 1/2 inst, rob cur pc will be EFPC
assign rob_read0_rte = iu_rtu_pipe0_cmplt && iu_rtu_pipe0_efpc_vld;

//----------------------------------------------------------
//                 ROB Current PC Register
//----------------------------------------------------------
always @(posedge pc_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rob_cur_pc_addend0[38:0] <= 39'b0;
    rob_cur_pc_addend1[4:0]  <= 5'b0;
  end
  //if flush by split vector first only fault inst
  //rtu should skip left inst by add pc 4,
  //retire must flush rob at this time
  else if(retire_rob_split_fof_flush) begin
    rob_cur_pc_addend0[38:0] <= rob_cur_pc_addend0[38:0];
    rob_cur_pc_addend1[4:0]  <= rob_cur_pc_addend1[4:0] + 5'd2;
  end
  else if(retire_rob_flush) begin
    rob_cur_pc_addend0[38:0] <= rob_cur_pc_addend0[38:0];
    rob_cur_pc_addend1[4:0]  <= rob_cur_pc_addend1[4:0];
  end
  else if(ifu_rtu_cur_pc_load) begin
    rob_cur_pc_addend0[38:0] <= ifu_rtu_cur_pc[38:0];
    rob_cur_pc_addend1[4:0]  <= 5'b0;
  end
  else if(retire_entry2_updt_vld) begin
    rob_cur_pc_addend0[38:0] <= rob_read2_next_pc_addend0[38:0];
    rob_cur_pc_addend1[4:0]  <= rob_read2_next_pc_addend1[4:0];
  end
  else if(retire_entry1_updt_vld) begin
    rob_cur_pc_addend0[38:0] <= rob_read2_cur_pc_addend0[38:0];
    rob_cur_pc_addend1[4:0]  <= rob_read2_cur_pc_addend1[4:0];
  end
  else if(retire_entry0_updt_vld && rob_read0_rte) begin
    rob_cur_pc_addend0[38:0] <= iu_rtu_pipe0_efpc[38:0];
    rob_cur_pc_addend1[4:0]  <= 5'b0;
  end
  else if(retire_entry0_updt_vld) begin
    rob_cur_pc_addend0[38:0] <= rob_read1_cur_pc_addend0[38:0];
    rob_cur_pc_addend1[4:0]  <= rob_read1_cur_pc_addend1[4:0];
  end
  else begin
    rob_cur_pc_addend0[38:0] <= rob_cur_pc_addend0[38:0];
    rob_cur_pc_addend1[4:0]  <= rob_cur_pc_addend1[4:0];
  end
end
//output
assign rob_cur_pc[38:0]            = rob_cur_pc_addend0[38:0]
                                     + {34'b0, rob_cur_pc_addend1[4:0]};
//when split fof flush, ifu change flow pc should be next pc of split
//fof inst whose addend1 must be 0 (it is split inst), so change flow
//pc will be addend0 + 0 (addend1) + 2
assign rob_cur_pc_plus_2[38:0]     = rob_cur_pc_addend0[38:0]
                                     + 38'd2;
assign rob_retire_rob_cur_pc[38:0] = rob_cur_pc[38:0];
assign rob_top_rob_cur_pc[6:0]     = rob_cur_pc[6:0];
//for had inst bkpt
//assign rtu_had_commit_vld          = rob_read0_inst_vld;
//assign rtu_had_commit_pc[38:0]     = rob_cur_pc[38:0];

//==========================================================
//                  Jump Offset for HPCP
//==========================================================
//if retire inst is jump, cur pc addend1 is all 0
assign retire_inst2_jmp_pc_offset[38:0] =
  rob_cur_pc_addend0[38:0] - retire_inst2_cur_pc_addend0[38:0];

assign retire_inst1_jmp_pc_offset[38:0] =
  (!retire_inst2_vld)
  ? rob_cur_pc_addend0[38:0]            - retire_inst1_cur_pc_addend0[38:0]
  : retire_inst2_cur_pc_addend0[38:0]   - retire_inst1_cur_pc_addend0[38:0];

assign retire_inst0_jmp_pc_offset[38:0] =
  (!retire_inst2_vld)
  ? rob_cur_pc_addend0[38:0]            - retire_inst0_cur_pc[38:0]
  : (!retire_inst1_vld)
    ? retire_inst2_cur_pc_addend0[38:0] - retire_inst0_cur_pc[38:0]
    : retire_inst1_cur_pc_addend0[38:0] - retire_inst0_cur_pc[38:0];

//==========================================================
//                   Retire PC for HAD
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign debug_clk_en = debug_info_en && retire_inst0_vld
                      || debug_retire_inst0_vld;
// &Instance("gated_clk_cell", "x_debug_gated_clk"); @1447
gated_clk_cell  x_debug_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (debug_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (debug_clk_en      ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1448
//          .external_en (1'b0), @1449
//          .global_en   (cp0_yy_clk_en), @1450
//          .module_en   (cp0_rtu_icg_en), @1451
//          .local_en    (debug_clk_en), @1452
//          .clk_out     (debug_clk)); @1453

//----------------------------------------------------------
//                 Debug retire inst valid
//----------------------------------------------------------
assign debug_info_en = had_rtu_debug_retire_info_en || hpcp_rtu_cnt_en;

always @(posedge debug_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    debug_retire_inst0_vld <= 1'b0;
    debug_retire_inst1_vld <= 1'b0;
    debug_retire_inst2_vld <= 1'b0;
  end
  else if(debug_info_en && retire_inst0_vld) begin
    debug_retire_inst0_vld <= retire_inst0_vld;
    debug_retire_inst1_vld <= retire_inst1_vld;
    debug_retire_inst2_vld <= retire_inst2_vld;
  end
  else if(debug_retire_inst0_vld) begin
    debug_retire_inst0_vld <= 1'b0;
    debug_retire_inst1_vld <= 1'b0;
    debug_retire_inst2_vld <= 1'b0;
  end
  else begin
    debug_retire_inst0_vld <= debug_retire_inst0_vld;
    debug_retire_inst1_vld <= debug_retire_inst1_vld;
    debug_retire_inst2_vld <= debug_retire_inst2_vld;
  end
end

assign rtu_had_retire_inst0_vld = debug_retire_inst0_vld;
assign rtu_had_retire_inst1_vld = debug_retire_inst1_vld;
assign rtu_had_retire_inst2_vld = debug_retire_inst2_vld;

//----------------------------------------------------------
//                 Debug retire inst pc
//----------------------------------------------------------
always @(posedge debug_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    debug_retire_inst0_pc[38:0]            <= 39'b0;
    debug_retire_inst1_pc[38:0]            <= 39'b0;
    debug_retire_inst2_pc[38:0]            <= 39'b0;
    debug_retire_inst0_jmp_pc_offset[16:0] <= 17'b0;
    debug_retire_inst1_jmp_pc_offset[16:0] <= 17'b0;
    debug_retire_inst2_jmp_pc_offset[16:0] <= 17'b0;
  end
  else if(debug_info_en && retire_inst0_vld) begin
    debug_retire_inst0_pc[38:0]            <= retire_inst0_cur_pc[38:0];
    debug_retire_inst1_pc[38:0]            <= rob_retire_inst1_cur_pc[38:0];
    debug_retire_inst2_pc[38:0]            <= rob_retire_inst2_cur_pc[38:0];
    debug_retire_inst0_jmp_pc_offset[16:0] <= retire_inst0_jmp_pc_offset[38:22];
    debug_retire_inst1_jmp_pc_offset[16:0] <= retire_inst1_jmp_pc_offset[38:22];
    debug_retire_inst2_jmp_pc_offset[16:0] <= retire_inst2_jmp_pc_offset[38:22];
  end
  else begin
    debug_retire_inst0_pc[38:0]            <= debug_retire_inst0_pc[38:0];
    debug_retire_inst1_pc[38:0]            <= debug_retire_inst1_pc[38:0];
    debug_retire_inst2_pc[38:0]            <= debug_retire_inst2_pc[38:0];
    debug_retire_inst0_jmp_pc_offset[16:0] <= debug_retire_inst0_jmp_pc_offset[16:0];
    debug_retire_inst1_jmp_pc_offset[16:0] <= debug_retire_inst1_jmp_pc_offset[16:0];
    debug_retire_inst2_jmp_pc_offset[16:0] <= debug_retire_inst2_jmp_pc_offset[16:0];
  end
end

assign rtu_had_retire_inst0_info[38:0] = debug_retire_inst0_pc[38:0];
assign rtu_had_retire_inst1_info[38:0] = debug_retire_inst1_pc[38:0];
assign rtu_had_retire_inst2_info[38:0] = debug_retire_inst2_pc[38:0];

//----------------------------------------------------------
//                   HPCP inst PC info
//----------------------------------------------------------
assign rtu_hpcp_inst0_cur_pc[39:0] = {debug_retire_inst0_pc[38:0],1'b0};
assign rtu_hpcp_inst1_cur_pc[39:0] = {debug_retire_inst1_pc[38:0],1'b0};
assign rtu_hpcp_inst2_cur_pc[39:0] = {debug_retire_inst2_pc[38:0],1'b0};
//offset is larger than 8m
assign rtu_hpcp_inst0_jmp_pc_offset_8m = retire_rob_inst0_jmp
                                         && (debug_retire_inst0_jmp_pc_offset[16]
                                            ? !(&debug_retire_inst0_jmp_pc_offset[15:0])
                                            : (|debug_retire_inst0_jmp_pc_offset[15:0]));
assign rtu_hpcp_inst1_jmp_pc_offset_8m = retire_rob_inst1_jmp
                                         && (debug_retire_inst1_jmp_pc_offset[16]
                                            ? !(&debug_retire_inst1_jmp_pc_offset[15:0])
                                            : (|debug_retire_inst1_jmp_pc_offset[15:0]));
assign rtu_hpcp_inst2_jmp_pc_offset_8m = retire_rob_inst2_jmp
                                         && (debug_retire_inst2_jmp_pc_offset[16]
                                            ? !(&debug_retire_inst2_jmp_pc_offset[15:0])
                                            : (|debug_retire_inst2_jmp_pc_offset[15:0]));

//----------------------------------------------------------
//                 Debug retire inst info
//----------------------------------------------------------
assign retire_inst0_debug_info[6:0]   = retire_inst0_iid[6:0];
assign retire_inst0_debug_info[7]     = retire_inst0_split;
assign retire_inst0_debug_info[8]     = retire_inst0_bju;
assign retire_inst0_debug_info[9]     = retire_inst0_condbr;
assign retire_inst0_debug_info[10]    = retire_inst0_jmp;
assign retire_inst0_debug_info[11]    = retire_inst0_store;
assign retire_inst0_debug_info[13:12] = retire_inst0_num[1:0];
assign retire_inst0_debug_info[16:14] = retire_entry0_pc_offset[2:0];
assign retire_inst0_debug_info[17]    = retire_rob_dbg_inst0_mispred;
assign retire_inst0_debug_info[18]    = retire_rob_dbg_inst0_flush;
assign retire_inst0_debug_info[19]    = retire_rob_dbg_inst0_ack_int;
assign retire_inst0_debug_info[20]    = retire_rob_dbg_inst0_expt_vld;
assign retire_inst0_debug_info[21]    = retire_rob_dbg_inst0_dbg_mode_on;

assign retire_inst1_debug_info[6:0]   = retire_inst1_iid[6:0];
assign retire_inst1_debug_info[7]     = retire_inst1_split;
assign retire_inst1_debug_info[8]     = retire_inst1_bju;
assign retire_inst1_debug_info[9]     = retire_inst1_condbr;
assign retire_inst1_debug_info[10]    = retire_inst1_jmp;
assign retire_inst1_debug_info[11]    = retire_inst1_store;
assign retire_inst1_debug_info[13:12] = retire_inst1_num[1:0];
assign retire_inst1_debug_info[16:14] = retire_entry1_pc_offset[2:0];
assign retire_inst1_debug_info[21:17] = 5'b0;

assign retire_inst2_debug_info[6:0]   = retire_inst2_iid[6:0];
assign retire_inst2_debug_info[7]     = retire_inst2_split;
assign retire_inst2_debug_info[8]     = retire_inst2_bju;
assign retire_inst2_debug_info[9]     = retire_inst2_condbr;
assign retire_inst2_debug_info[10]    = retire_inst2_jmp;
assign retire_inst2_debug_info[11]    = retire_inst2_store;
assign retire_inst2_debug_info[13:12] = retire_inst2_num[1:0];
assign retire_inst2_debug_info[16:14] = retire_entry2_pc_offset[2:0];
assign retire_inst2_debug_info[21:17] = 5'b0;

always @(posedge debug_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    debug_retire_inst0_info[21:0] <= 22'b0;
    debug_retire_inst1_info[21:0] <= 22'b0;
    debug_retire_inst2_info[21:0] <= 22'b0;
  end
  else if(debug_info_en && retire_inst0_vld) begin
    debug_retire_inst0_info[21:0] <= retire_inst0_debug_info[21:0];
    debug_retire_inst1_info[21:0] <= retire_inst1_debug_info[21:0];
    debug_retire_inst2_info[21:0] <= retire_inst2_debug_info[21:0];
  end
  else begin
    debug_retire_inst0_info[21:0] <= debug_retire_inst0_info[21:0];
    debug_retire_inst1_info[21:0] <= debug_retire_inst1_info[21:0];
    debug_retire_inst2_info[21:0] <= debug_retire_inst2_info[21:0];
  end
end

assign rtu_had_retire_inst0_info[63:39] = {3'b0,debug_retire_inst0_info[21:0]};
assign rtu_had_retire_inst1_info[63:39] = {3'b0,debug_retire_inst1_info[21:0]};
assign rtu_had_retire_inst2_info[63:39] = {3'b0,debug_retire_inst2_info[21:0]};

//==========================================================
//                    Commit Signals
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign commit_clk_en = rob_read0_inst_vld
                       || rob_read1_inst_vld
                       || rob_read2_inst_vld
                       || rob_commit0;
// &Instance("gated_clk_cell", "x_commit_gated_clk"); @1613
gated_clk_cell  x_commit_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (commit_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (commit_clk_en     ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1614
//          .external_en (1'b0), @1615
//          .global_en   (cp0_yy_clk_en), @1616
//          .module_en   (cp0_rtu_icg_en), @1617
//          .local_en    (commit_clk_en), @1618
//          .clk_out     (commit_clk)); @1619

//----------------------------------------------------------
//                 Prepare commit signal
//----------------------------------------------------------
//if current retire inst is flush, rob read0 cannot commit
assign rob_read0_commit = rob_read0_inst_vld
                          && !had_rtu_inst_bkpt_dbgreq
                          && !retire_rob_rt_mask;
assign rob_read1_commit = rob_read1_inst_vld
                          && !had_rtu_inst_bkpt_dbgreq
                          && !retire_rob_rt_mask
                          && !retire_rob_srt_en
                          && rob_read0_cmplted
                          && !rob_read0_abnormal;
assign rob_read2_commit = rob_read2_inst_vld
                          && !had_rtu_inst_bkpt_dbgreq
                          && !retire_rob_rt_mask
                          && !retire_rob_srt_en
                          && rob_read0_cmplted
                          && rob_read1_cmplted
                          && !rob_read0_abnormal
                          && !rob_read1_abnormal;

//----------------------------------------------------------
//          Asynchronous Exception Mask Signals
//----------------------------------------------------------
//asynchronous exception need to stop any new inst retire and commit
//asynchronous exception cannot mask inst already committed
//the async expt commit mask should wait for commit new inst
assign rob_commit0_async_expt_mask =
         retire_rob_async_expt_commit_mask
         && !(rob_commit0 && (rob_read0_iid[6:0] == rob_commit0_iid[6:0])
           || rob_commit1 && (rob_read0_iid[6:0] == rob_commit1_iid[6:0])
           || rob_commit2 && (rob_read0_iid[6:0] == rob_commit2_iid[6:0]));
assign rob_commit1_async_expt_mask = 
         retire_rob_async_expt_commit_mask
         && !(rob_commit1 && (rob_read1_iid[6:0] == rob_commit1_iid[6:0])
           || rob_commit2 && (rob_read1_iid[6:0] == rob_commit2_iid[6:0]));
assign rob_commit2_async_expt_mask = 
         retire_rob_async_expt_commit_mask
         && !(rob_commit2 && (rob_read2_iid[6:0] == rob_commit2_iid[6:0]));

//----------------------------------------------------------
//                 Sync Commit Mask Signals
//----------------------------------------------------------
//sync commit mask need single retire, so no more than 1 inst
//can commit at same time
//sync commit mask cannot mask inst already committed
//the sync commit mask need not to mask commit0 for new inst
assign rob_sync_commit_mask = rob_int_commit_mask || rob_dbg_commit_mask || rob_ctc_flush_commit_mask;

assign rob_commit0_sync_mask = 1'b0;
assign rob_commit1_sync_mask =
         rob_sync_commit_mask
         && !(rob_commit1 && (rob_read1_iid[6:0] == rob_commit1_iid[6:0])
           || rob_commit2 && (rob_read1_iid[6:0] == rob_commit2_iid[6:0]));
assign rob_commit2_sync_mask =
         rob_sync_commit_mask
         && !(rob_commit2 && (rob_read2_iid[6:0] == rob_commit2_iid[6:0]));

//----------------------------------------------------------
//                  Flop commit signals
//----------------------------------------------------------
assign rob_commit0_mask = rob_commit0_async_expt_mask || rob_commit0_sync_mask;
assign rob_commit1_mask = rob_commit1_async_expt_mask || rob_commit1_sync_mask;
assign rob_commit2_mask = rob_commit2_async_expt_mask || rob_commit2_sync_mask;
//for timing consideration, unconditionally flop commit signal and iid
always @(posedge commit_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rob_commit0          <= 1'b0;
    rob_commit1          <= 1'b0;
    rob_commit2          <= 1'b0;
  end
  else if(retire_rob_flush) begin
    rob_commit0          <= 1'b0;
    rob_commit1          <= 1'b0;
    rob_commit2          <= 1'b0;
  end
  else begin
    rob_commit0          <= rob_read0_commit && !rob_commit0_mask;
    rob_commit1          <= rob_read1_commit && !rob_commit1_mask;
    rob_commit2          <= rob_read2_commit && !rob_commit2_mask;
  end
end

always @(posedge commit_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rob_commit0_iid[6:0] <= 7'b0;
    rob_commit1_iid[6:0] <= 7'b0;
    rob_commit2_iid[6:0] <= 7'b0;
  end
  else begin
    rob_commit0_iid[6:0] <= rob_read0_iid[6:0];
    rob_commit1_iid[6:0] <= rob_read1_iid[6:0];
    rob_commit2_iid[6:0] <= rob_read2_iid[6:0];
  end
end

//rename for output
assign rob_retire_commit0         = rob_commit0;
assign rob_retire_commit1         = rob_commit1;
assign rob_retire_commit2         = rob_commit2;

assign rtu_yy_xx_commit0          = rob_commit0;
assign rtu_yy_xx_commit1          = rob_commit1;
assign rtu_yy_xx_commit2          = rob_commit2;

assign rob_debug_commit0          = rob_commit0;

assign rtu_yy_xx_commit0_iid[6:0] = rob_commit0_iid[6:0];
assign rtu_yy_xx_commit1_iid[6:0] = rob_commit1_iid[6:0];
assign rtu_yy_xx_commit2_iid[6:0] = rob_commit2_iid[6:0];

//----------------------------------------------------------
//                 Debug Counter for FPGA
//----------------------------------------------------------
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_cnt[31:0] <= 32'b0;
  end
  else if(retire_inst0_vld) begin
    retire_cnt[31:0] <= 32'b0;
  end
  else begin
    retire_cnt[31:0] <= retire_cnt[31:0] + 1;
  end
end

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    no_retire <= 1'b0;
  end
  else if(retire_inst0_vld) begin
    no_retire <= 1'b0;
  end
  else if(retire_cnt[31:0] == 32'd2048) begin
    no_retire <= 1'b1;
  end
end

assign rtu_cpu_no_retire = !no_retire && retire_cnt[31:0] == 32'd2048 && idu_rtu_fence_idle;


// &ModuleEnd; @1769
endmodule


