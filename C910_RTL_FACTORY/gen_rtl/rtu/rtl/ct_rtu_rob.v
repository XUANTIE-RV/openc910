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
module ct_rtu_rob(
  cp0_rtu_icg_en,
  cp0_rtu_xx_int_b,
  cp0_rtu_xx_vec,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_rtu_data_bkpt_dbgreq,
  had_rtu_dbg_req_en,
  had_rtu_debug_retire_info_en,
  had_rtu_inst_bkpt_dbgreq,
  had_rtu_xx_tme,
  hpcp_rtu_cnt_en,
  idu_rtu_fence_idle,
  idu_rtu_rob_create0_data,
  idu_rtu_rob_create0_dp_en,
  idu_rtu_rob_create0_en,
  idu_rtu_rob_create0_gateclk_en,
  idu_rtu_rob_create1_data,
  idu_rtu_rob_create1_dp_en,
  idu_rtu_rob_create1_en,
  idu_rtu_rob_create1_gateclk_en,
  idu_rtu_rob_create2_data,
  idu_rtu_rob_create2_dp_en,
  idu_rtu_rob_create2_en,
  idu_rtu_rob_create2_gateclk_en,
  idu_rtu_rob_create3_data,
  idu_rtu_rob_create3_dp_en,
  idu_rtu_rob_create3_en,
  idu_rtu_rob_create3_gateclk_en,
  ifu_rtu_cur_pc,
  ifu_rtu_cur_pc_load,
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
  lsu_rtu_all_commit_data_vld,
  lsu_rtu_da_pipe3_split_spec_fail_iid,
  lsu_rtu_da_pipe3_split_spec_fail_vld,
  lsu_rtu_da_pipe4_split_spec_fail_iid,
  lsu_rtu_da_pipe4_split_spec_fail_vld,
  lsu_rtu_wb_pipe3_abnormal,
  lsu_rtu_wb_pipe3_bkpta_data,
  lsu_rtu_wb_pipe3_bkptb_data,
  lsu_rtu_wb_pipe3_cmplt,
  lsu_rtu_wb_pipe3_expt_vec,
  lsu_rtu_wb_pipe3_expt_vld,
  lsu_rtu_wb_pipe3_flush,
  lsu_rtu_wb_pipe3_iid,
  lsu_rtu_wb_pipe3_mtval,
  lsu_rtu_wb_pipe3_no_spec_hit,
  lsu_rtu_wb_pipe3_no_spec_mispred,
  lsu_rtu_wb_pipe3_no_spec_miss,
  lsu_rtu_wb_pipe3_spec_fail,
  lsu_rtu_wb_pipe3_vsetvl,
  lsu_rtu_wb_pipe3_vstart,
  lsu_rtu_wb_pipe3_vstart_vld,
  lsu_rtu_wb_pipe4_abnormal,
  lsu_rtu_wb_pipe4_bkpta_data,
  lsu_rtu_wb_pipe4_bkptb_data,
  lsu_rtu_wb_pipe4_cmplt,
  lsu_rtu_wb_pipe4_expt_vec,
  lsu_rtu_wb_pipe4_expt_vld,
  lsu_rtu_wb_pipe4_flush,
  lsu_rtu_wb_pipe4_iid,
  lsu_rtu_wb_pipe4_mtval,
  lsu_rtu_wb_pipe4_no_spec_hit,
  lsu_rtu_wb_pipe4_no_spec_mispred,
  lsu_rtu_wb_pipe4_no_spec_miss,
  lsu_rtu_wb_pipe4_spec_fail,
  lsu_rtu_wb_pipe4_vstart,
  lsu_rtu_wb_pipe4_vstart_vld,
  pad_yy_icg_scan_en,
  retire_rob_async_expt_commit_mask,
  retire_rob_ctc_flush_req,
  retire_rob_dbg_inst0_ack_int,
  retire_rob_dbg_inst0_dbg_mode_on,
  retire_rob_dbg_inst0_expt_vld,
  retire_rob_dbg_inst0_flush,
  retire_rob_dbg_inst0_mispred,
  retire_rob_flush,
  retire_rob_flush_cur_state,
  retire_rob_flush_gateclk,
  retire_rob_inst0_jmp,
  retire_rob_inst1_jmp,
  retire_rob_inst2_jmp,
  retire_rob_inst_flush,
  retire_rob_retire_empty,
  retire_rob_rt_mask,
  retire_rob_split_fof_flush,
  retire_rob_srt_en,
  rob_pst_retire_inst0_gateclk_vld,
  rob_pst_retire_inst0_iid,
  rob_pst_retire_inst0_iid_updt_val,
  rob_pst_retire_inst1_gateclk_vld,
  rob_pst_retire_inst1_iid,
  rob_pst_retire_inst1_iid_updt_val,
  rob_pst_retire_inst2_gateclk_vld,
  rob_pst_retire_inst2_iid,
  rob_pst_retire_inst2_iid_updt_val,
  rob_retire_commit0,
  rob_retire_commit1,
  rob_retire_commit2,
  rob_retire_ctc_flush_srt_en,
  rob_retire_inst0_bht_mispred,
  rob_retire_inst0_bju,
  rob_retire_inst0_bju_inc_pc,
  rob_retire_inst0_bkpt,
  rob_retire_inst0_chk_idx,
  rob_retire_inst0_condbr,
  rob_retire_inst0_condbr_taken,
  rob_retire_inst0_ctc_flush,
  rob_retire_inst0_cur_pc,
  rob_retire_inst0_data_bkpt,
  rob_retire_inst0_dbg_disable,
  rob_retire_inst0_efpc_vld,
  rob_retire_inst0_expt_vec,
  rob_retire_inst0_expt_vld,
  rob_retire_inst0_fp_dirty,
  rob_retire_inst0_high_hw_expt,
  rob_retire_inst0_iid,
  rob_retire_inst0_immu_expt,
  rob_retire_inst0_inst_bkpt,
  rob_retire_inst0_inst_flush,
  rob_retire_inst0_int_vec,
  rob_retire_inst0_int_vld,
  rob_retire_inst0_intmask,
  rob_retire_inst0_jmp,
  rob_retire_inst0_jmp_mispred,
  rob_retire_inst0_load,
  rob_retire_inst0_mtval,
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
  rob_retire_inst0_spec_fail,
  rob_retire_inst0_spec_fail_no_ssf,
  rob_retire_inst0_spec_fail_ssf,
  rob_retire_inst0_split,
  rob_retire_inst0_store,
  rob_retire_inst0_vec_dirty,
  rob_retire_inst0_vl,
  rob_retire_inst0_vl_pred,
  rob_retire_inst0_vld,
  rob_retire_inst0_vlmul,
  rob_retire_inst0_vsetvl,
  rob_retire_inst0_vsetvli,
  rob_retire_inst0_vsew,
  rob_retire_inst0_vstart,
  rob_retire_inst0_vstart_vld,
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
  rob_retire_split_spec_fail_srt,
  rob_retire_ssf_iid,
  rob_top_commit0,
  rob_top_commit_st_no_vld,
  rob_top_create0_iid,
  rob_top_entry_num,
  rob_top_flush_cur_state,
  rob_top_read0_iid,
  rob_top_rob_cur_pc,
  rob_top_rob_full,
  rob_top_ssf_cur_state,
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
  rtu_had_rob_empty,
  rtu_had_xx_mbkpt_chgflow,
  rtu_hpcp_inst0_cur_pc,
  rtu_hpcp_inst0_jmp_pc_offset_8m,
  rtu_hpcp_inst1_cur_pc,
  rtu_hpcp_inst1_jmp_pc_offset_8m,
  rtu_hpcp_inst2_cur_pc,
  rtu_hpcp_inst2_jmp_pc_offset_8m,
  rtu_idu_retire_int_vld,
  rtu_idu_rob_empty,
  rtu_idu_rob_full,
  rtu_idu_rob_inst0_iid,
  rtu_idu_rob_inst1_iid,
  rtu_idu_rob_inst2_iid,
  rtu_idu_rob_inst3_iid,
  rtu_iu_rob_read0_pcfifo_vld,
  rtu_iu_rob_read1_pcfifo_vld,
  rtu_iu_rob_read2_pcfifo_vld,
  rtu_iu_rob_read_pcfifo_gateclk_vld,
  rtu_lsu_commit0_iid_updt_val,
  rtu_lsu_commit1_iid_updt_val,
  rtu_lsu_commit2_iid_updt_val,
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
  rtu_yy_xx_flush,
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
input           forever_cpuclk;                      
input           had_rtu_data_bkpt_dbgreq;            
input           had_rtu_dbg_req_en;                  
input           had_rtu_debug_retire_info_en;        
input           had_rtu_inst_bkpt_dbgreq;            
input           had_rtu_xx_tme;                      
input           hpcp_rtu_cnt_en;                     
input           idu_rtu_fence_idle;                  
input   [39:0]  idu_rtu_rob_create0_data;            
input           idu_rtu_rob_create0_dp_en;           
input           idu_rtu_rob_create0_en;              
input           idu_rtu_rob_create0_gateclk_en;      
input   [39:0]  idu_rtu_rob_create1_data;            
input           idu_rtu_rob_create1_dp_en;           
input           idu_rtu_rob_create1_en;              
input           idu_rtu_rob_create1_gateclk_en;      
input   [39:0]  idu_rtu_rob_create2_data;            
input           idu_rtu_rob_create2_dp_en;           
input           idu_rtu_rob_create2_en;              
input           idu_rtu_rob_create2_gateclk_en;      
input   [39:0]  idu_rtu_rob_create3_data;            
input           idu_rtu_rob_create3_dp_en;           
input           idu_rtu_rob_create3_en;              
input           idu_rtu_rob_create3_gateclk_en;      
input   [38:0]  ifu_rtu_cur_pc;                      
input           ifu_rtu_cur_pc_load;                 
input   [47:0]  iu_rtu_pcfifo_pop0_data;             
input   [47:0]  iu_rtu_pcfifo_pop1_data;             
input   [47:0]  iu_rtu_pcfifo_pop2_data;             
input           iu_rtu_pipe0_abnormal;               
input           iu_rtu_pipe0_bkpt;                   
input           iu_rtu_pipe0_cmplt;                  
input   [38:0]  iu_rtu_pipe0_efpc;                   
input           iu_rtu_pipe0_efpc_vld;               
input   [4 :0]  iu_rtu_pipe0_expt_vec;               
input           iu_rtu_pipe0_expt_vld;               
input           iu_rtu_pipe0_flush;                  
input           iu_rtu_pipe0_high_hw_expt;           
input   [6 :0]  iu_rtu_pipe0_iid;                    
input           iu_rtu_pipe0_immu_expt;              
input   [31:0]  iu_rtu_pipe0_mtval;                  
input           iu_rtu_pipe0_vsetvl;                 
input   [6 :0]  iu_rtu_pipe0_vstart;                 
input           iu_rtu_pipe0_vstart_vld;             
input           iu_rtu_pipe1_cmplt;                  
input   [6 :0]  iu_rtu_pipe1_iid;                    
input           iu_rtu_pipe2_abnormal;               
input           iu_rtu_pipe2_bht_mispred;            
input           iu_rtu_pipe2_cmplt;                  
input   [6 :0]  iu_rtu_pipe2_iid;                    
input           iu_rtu_pipe2_jmp_mispred;            
input           lsu_rtu_all_commit_data_vld;         
input   [6 :0]  lsu_rtu_da_pipe3_split_spec_fail_iid; 
input           lsu_rtu_da_pipe3_split_spec_fail_vld; 
input   [6 :0]  lsu_rtu_da_pipe4_split_spec_fail_iid; 
input           lsu_rtu_da_pipe4_split_spec_fail_vld; 
input           lsu_rtu_wb_pipe3_abnormal;           
input           lsu_rtu_wb_pipe3_bkpta_data;         
input           lsu_rtu_wb_pipe3_bkptb_data;         
input           lsu_rtu_wb_pipe3_cmplt;              
input   [4 :0]  lsu_rtu_wb_pipe3_expt_vec;           
input           lsu_rtu_wb_pipe3_expt_vld;           
input           lsu_rtu_wb_pipe3_flush;              
input   [6 :0]  lsu_rtu_wb_pipe3_iid;                
input   [39:0]  lsu_rtu_wb_pipe3_mtval;              
input           lsu_rtu_wb_pipe3_no_spec_hit;        
input           lsu_rtu_wb_pipe3_no_spec_mispred;    
input           lsu_rtu_wb_pipe3_no_spec_miss;       
input           lsu_rtu_wb_pipe3_spec_fail;          
input           lsu_rtu_wb_pipe3_vsetvl;             
input   [6 :0]  lsu_rtu_wb_pipe3_vstart;             
input           lsu_rtu_wb_pipe3_vstart_vld;         
input           lsu_rtu_wb_pipe4_abnormal;           
input           lsu_rtu_wb_pipe4_bkpta_data;         
input           lsu_rtu_wb_pipe4_bkptb_data;         
input           lsu_rtu_wb_pipe4_cmplt;              
input   [4 :0]  lsu_rtu_wb_pipe4_expt_vec;           
input           lsu_rtu_wb_pipe4_expt_vld;           
input           lsu_rtu_wb_pipe4_flush;              
input   [6 :0]  lsu_rtu_wb_pipe4_iid;                
input   [39:0]  lsu_rtu_wb_pipe4_mtval;              
input           lsu_rtu_wb_pipe4_no_spec_hit;        
input           lsu_rtu_wb_pipe4_no_spec_mispred;    
input           lsu_rtu_wb_pipe4_no_spec_miss;       
input           lsu_rtu_wb_pipe4_spec_fail;          
input   [6 :0]  lsu_rtu_wb_pipe4_vstart;             
input           lsu_rtu_wb_pipe4_vstart_vld;         
input           pad_yy_icg_scan_en;                  
input           retire_rob_async_expt_commit_mask;   
input           retire_rob_ctc_flush_req;            
input           retire_rob_dbg_inst0_ack_int;        
input           retire_rob_dbg_inst0_dbg_mode_on;    
input           retire_rob_dbg_inst0_expt_vld;       
input           retire_rob_dbg_inst0_flush;          
input           retire_rob_dbg_inst0_mispred;        
input           retire_rob_flush;                    
input   [4 :0]  retire_rob_flush_cur_state;          
input           retire_rob_flush_gateclk;            
input           retire_rob_inst0_jmp;                
input           retire_rob_inst1_jmp;                
input           retire_rob_inst2_jmp;                
input           retire_rob_inst_flush;               
input           retire_rob_retire_empty;             
input           retire_rob_rt_mask;                  
input           retire_rob_split_fof_flush;          
input           retire_rob_srt_en;                   
input           rtu_yy_xx_flush;                     
input           vfpu_rtu_pipe6_cmplt;                
input   [6 :0]  vfpu_rtu_pipe6_iid;                  
input           vfpu_rtu_pipe7_cmplt;                
input   [6 :0]  vfpu_rtu_pipe7_iid;                  
output          rob_pst_retire_inst0_gateclk_vld;    
output  [6 :0]  rob_pst_retire_inst0_iid;            
output  [6 :0]  rob_pst_retire_inst0_iid_updt_val;   
output          rob_pst_retire_inst1_gateclk_vld;    
output  [6 :0]  rob_pst_retire_inst1_iid;            
output  [6 :0]  rob_pst_retire_inst1_iid_updt_val;   
output          rob_pst_retire_inst2_gateclk_vld;    
output  [6 :0]  rob_pst_retire_inst2_iid;            
output  [6 :0]  rob_pst_retire_inst2_iid_updt_val;   
output          rob_retire_commit0;                  
output          rob_retire_commit1;                  
output          rob_retire_commit2;                  
output          rob_retire_ctc_flush_srt_en;         
output          rob_retire_inst0_bht_mispred;        
output          rob_retire_inst0_bju;                
output  [38:0]  rob_retire_inst0_bju_inc_pc;         
output          rob_retire_inst0_bkpt;               
output  [7 :0]  rob_retire_inst0_chk_idx;            
output          rob_retire_inst0_condbr;             
output          rob_retire_inst0_condbr_taken;       
output          rob_retire_inst0_ctc_flush;          
output  [38:0]  rob_retire_inst0_cur_pc;             
output          rob_retire_inst0_data_bkpt;          
output          rob_retire_inst0_dbg_disable;        
output          rob_retire_inst0_efpc_vld;           
output  [3 :0]  rob_retire_inst0_expt_vec;           
output          rob_retire_inst0_expt_vld;           
output          rob_retire_inst0_fp_dirty;           
output          rob_retire_inst0_high_hw_expt;       
output  [6 :0]  rob_retire_inst0_iid;                
output          rob_retire_inst0_immu_expt;          
output          rob_retire_inst0_inst_bkpt;          
output          rob_retire_inst0_inst_flush;         
output  [4 :0]  rob_retire_inst0_int_vec;            
output          rob_retire_inst0_int_vld;            
output          rob_retire_inst0_intmask;            
output          rob_retire_inst0_jmp;                
output          rob_retire_inst0_jmp_mispred;        
output          rob_retire_inst0_load;               
output  [39:0]  rob_retire_inst0_mtval;              
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
output          rob_retire_inst0_spec_fail;          
output          rob_retire_inst0_spec_fail_no_ssf;   
output          rob_retire_inst0_spec_fail_ssf;      
output          rob_retire_inst0_split;              
output          rob_retire_inst0_store;              
output          rob_retire_inst0_vec_dirty;          
output  [7 :0]  rob_retire_inst0_vl;                 
output          rob_retire_inst0_vl_pred;            
output          rob_retire_inst0_vld;                
output  [1 :0]  rob_retire_inst0_vlmul;              
output          rob_retire_inst0_vsetvl;             
output          rob_retire_inst0_vsetvli;            
output  [2 :0]  rob_retire_inst0_vsew;               
output  [6 :0]  rob_retire_inst0_vstart;             
output          rob_retire_inst0_vstart_vld;         
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
output          rob_retire_split_spec_fail_srt;      
output  [6 :0]  rob_retire_ssf_iid;                  
output          rob_top_commit0;                     
output          rob_top_commit_st_no_vld;            
output  [6 :0]  rob_top_create0_iid;                 
output  [6 :0]  rob_top_entry_num;                   
output  [4 :0]  rob_top_flush_cur_state;             
output  [6 :0]  rob_top_read0_iid;                   
output  [6 :0]  rob_top_rob_cur_pc;                  
output          rob_top_rob_full;                    
output  [1 :0]  rob_top_ssf_cur_state;               
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
output          rtu_had_rob_empty;                   
output          rtu_had_xx_mbkpt_chgflow;            
output  [39:0]  rtu_hpcp_inst0_cur_pc;               
output          rtu_hpcp_inst0_jmp_pc_offset_8m;     
output  [39:0]  rtu_hpcp_inst1_cur_pc;               
output          rtu_hpcp_inst1_jmp_pc_offset_8m;     
output  [39:0]  rtu_hpcp_inst2_cur_pc;               
output          rtu_hpcp_inst2_jmp_pc_offset_8m;     
output          rtu_idu_retire_int_vld;              
output          rtu_idu_rob_empty;                   
output          rtu_idu_rob_full;                    
output  [6 :0]  rtu_idu_rob_inst0_iid;               
output  [6 :0]  rtu_idu_rob_inst1_iid;               
output  [6 :0]  rtu_idu_rob_inst2_iid;               
output  [6 :0]  rtu_idu_rob_inst3_iid;               
output          rtu_iu_rob_read0_pcfifo_vld;         
output          rtu_iu_rob_read1_pcfifo_vld;         
output          rtu_iu_rob_read2_pcfifo_vld;         
output          rtu_iu_rob_read_pcfifo_gateclk_vld;  
output  [6 :0]  rtu_lsu_commit0_iid_updt_val;        
output  [6 :0]  rtu_lsu_commit1_iid_updt_val;        
output  [6 :0]  rtu_lsu_commit2_iid_updt_val;        
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
reg     [4 :0]  debug_info_flush_cur_state;          
reg             debug_info_rob_commit0;              
reg             debug_info_rob_commit_st_no_vld;     
reg     [6 :0]  debug_info_rob_create0_iid;          
reg     [6 :0]  debug_info_rob_entry_num;            
reg             debug_info_rob_full;                 
reg     [6 :0]  debug_info_rob_read0_iid;            
reg     [39:0]  read_entry0_updt_data;               
reg     [39:0]  read_entry1_updt_data;               
reg     [39:0]  read_entry2_updt_data;               
reg     [6 :0]  rob_create0_iid;                     
reg     [63:0]  rob_create0_ptr;                     
reg     [6 :0]  rob_create1_iid;                     
reg     [6 :0]  rob_create2_iid;                     
reg     [6 :0]  rob_create3_iid;                     
reg     [6 :0]  rob_entry_num;                       
reg     [2 :0]  rob_entry_num_add;                   
reg     [1 :0]  rob_entry_num_sub;                   
reg             rob_full;                            
reg     [6 :0]  rob_pop0_iid;                        
reg     [6 :0]  rob_pop1_iid;                        
reg     [6 :0]  rob_pop2_iid;                        
reg     [39:0]  rob_read0_entry_data;                
reg     [6 :0]  rob_read0_iid;                       
reg     [63:0]  rob_read0_ptr;                       
reg     [39:0]  rob_read1_entry_data;                
reg     [6 :0]  rob_read1_iid;                       
reg     [39:0]  rob_read2_entry_data;                
reg     [6 :0]  rob_read2_iid;                       
reg     [39:0]  rob_read3_entry_data;                
reg     [6 :0]  rob_read3_iid;                       
reg     [39:0]  rob_read4_entry_data;                
reg     [6 :0]  rob_read4_iid;                       
reg     [39:0]  rob_read5_entry_data;                
reg     [6 :0]  rob_read5_iid;                       
reg     [5 :0]  rob_read_entry0_updt_iid;            
reg     [5 :0]  rob_read_entry1_updt_iid;            
reg     [5 :0]  rob_read_entry2_updt_iid;            

// &Wires; @31
wire    [63:0]  clt0;                                
wire    [63:0]  clt1;                                
wire    [63:0]  clt2;                                
wire    [63:0]  clt3;                                
wire    [63:0]  clt4;                                
wire    [63:0]  clt5;                                
wire    [63:0]  clt6;                                
wire            cp0_rtu_icg_en;                      
wire            cp0_rtu_xx_int_b;                    
wire    [4 :0]  cp0_rtu_xx_vec;                      
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire            create_ptr_clk;                      
wire            create_ptr_clk_en;                   
wire            debug_info_clk;                      
wire            debug_info_clk_en;                   
wire            entry0_cmplt_gateclk_vld;            
wire    [6 :0]  entry0_cmplt_vld;                    
wire            entry0_create_dp_en;                 
wire            entry0_create_en;                    
wire            entry0_create_gateclk_en;            
wire    [3 :0]  entry0_create_sel;                   
wire            entry0_pop_en;                       
wire    [39:0]  entry0_read_data;                    
wire            entry10_cmplt_gateclk_vld;           
wire    [6 :0]  entry10_cmplt_vld;                   
wire            entry10_create_dp_en;                
wire            entry10_create_en;                   
wire            entry10_create_gateclk_en;           
wire    [3 :0]  entry10_create_sel;                  
wire            entry10_pop_en;                      
wire    [39:0]  entry10_read_data;                   
wire            entry11_cmplt_gateclk_vld;           
wire    [6 :0]  entry11_cmplt_vld;                   
wire            entry11_create_dp_en;                
wire            entry11_create_en;                   
wire            entry11_create_gateclk_en;           
wire    [3 :0]  entry11_create_sel;                  
wire            entry11_pop_en;                      
wire    [39:0]  entry11_read_data;                   
wire            entry12_cmplt_gateclk_vld;           
wire    [6 :0]  entry12_cmplt_vld;                   
wire            entry12_create_dp_en;                
wire            entry12_create_en;                   
wire            entry12_create_gateclk_en;           
wire    [3 :0]  entry12_create_sel;                  
wire            entry12_pop_en;                      
wire    [39:0]  entry12_read_data;                   
wire            entry13_cmplt_gateclk_vld;           
wire    [6 :0]  entry13_cmplt_vld;                   
wire            entry13_create_dp_en;                
wire            entry13_create_en;                   
wire            entry13_create_gateclk_en;           
wire    [3 :0]  entry13_create_sel;                  
wire            entry13_pop_en;                      
wire    [39:0]  entry13_read_data;                   
wire            entry14_cmplt_gateclk_vld;           
wire    [6 :0]  entry14_cmplt_vld;                   
wire            entry14_create_dp_en;                
wire            entry14_create_en;                   
wire            entry14_create_gateclk_en;           
wire    [3 :0]  entry14_create_sel;                  
wire            entry14_pop_en;                      
wire    [39:0]  entry14_read_data;                   
wire            entry15_cmplt_gateclk_vld;           
wire    [6 :0]  entry15_cmplt_vld;                   
wire            entry15_create_dp_en;                
wire            entry15_create_en;                   
wire            entry15_create_gateclk_en;           
wire    [3 :0]  entry15_create_sel;                  
wire            entry15_pop_en;                      
wire    [39:0]  entry15_read_data;                   
wire            entry16_cmplt_gateclk_vld;           
wire    [6 :0]  entry16_cmplt_vld;                   
wire            entry16_create_dp_en;                
wire            entry16_create_en;                   
wire            entry16_create_gateclk_en;           
wire    [3 :0]  entry16_create_sel;                  
wire            entry16_pop_en;                      
wire    [39:0]  entry16_read_data;                   
wire            entry17_cmplt_gateclk_vld;           
wire    [6 :0]  entry17_cmplt_vld;                   
wire            entry17_create_dp_en;                
wire            entry17_create_en;                   
wire            entry17_create_gateclk_en;           
wire    [3 :0]  entry17_create_sel;                  
wire            entry17_pop_en;                      
wire    [39:0]  entry17_read_data;                   
wire            entry18_cmplt_gateclk_vld;           
wire    [6 :0]  entry18_cmplt_vld;                   
wire            entry18_create_dp_en;                
wire            entry18_create_en;                   
wire            entry18_create_gateclk_en;           
wire    [3 :0]  entry18_create_sel;                  
wire            entry18_pop_en;                      
wire    [39:0]  entry18_read_data;                   
wire            entry19_cmplt_gateclk_vld;           
wire    [6 :0]  entry19_cmplt_vld;                   
wire            entry19_create_dp_en;                
wire            entry19_create_en;                   
wire            entry19_create_gateclk_en;           
wire    [3 :0]  entry19_create_sel;                  
wire            entry19_pop_en;                      
wire    [39:0]  entry19_read_data;                   
wire            entry1_cmplt_gateclk_vld;            
wire    [6 :0]  entry1_cmplt_vld;                    
wire            entry1_create_dp_en;                 
wire            entry1_create_en;                    
wire            entry1_create_gateclk_en;            
wire    [3 :0]  entry1_create_sel;                   
wire            entry1_pop_en;                       
wire    [39:0]  entry1_read_data;                    
wire            entry20_cmplt_gateclk_vld;           
wire    [6 :0]  entry20_cmplt_vld;                   
wire            entry20_create_dp_en;                
wire            entry20_create_en;                   
wire            entry20_create_gateclk_en;           
wire    [3 :0]  entry20_create_sel;                  
wire            entry20_pop_en;                      
wire    [39:0]  entry20_read_data;                   
wire            entry21_cmplt_gateclk_vld;           
wire    [6 :0]  entry21_cmplt_vld;                   
wire            entry21_create_dp_en;                
wire            entry21_create_en;                   
wire            entry21_create_gateclk_en;           
wire    [3 :0]  entry21_create_sel;                  
wire            entry21_pop_en;                      
wire    [39:0]  entry21_read_data;                   
wire            entry22_cmplt_gateclk_vld;           
wire    [6 :0]  entry22_cmplt_vld;                   
wire            entry22_create_dp_en;                
wire            entry22_create_en;                   
wire            entry22_create_gateclk_en;           
wire    [3 :0]  entry22_create_sel;                  
wire            entry22_pop_en;                      
wire    [39:0]  entry22_read_data;                   
wire            entry23_cmplt_gateclk_vld;           
wire    [6 :0]  entry23_cmplt_vld;                   
wire            entry23_create_dp_en;                
wire            entry23_create_en;                   
wire            entry23_create_gateclk_en;           
wire    [3 :0]  entry23_create_sel;                  
wire            entry23_pop_en;                      
wire    [39:0]  entry23_read_data;                   
wire            entry24_cmplt_gateclk_vld;           
wire    [6 :0]  entry24_cmplt_vld;                   
wire            entry24_create_dp_en;                
wire            entry24_create_en;                   
wire            entry24_create_gateclk_en;           
wire    [3 :0]  entry24_create_sel;                  
wire            entry24_pop_en;                      
wire    [39:0]  entry24_read_data;                   
wire            entry25_cmplt_gateclk_vld;           
wire    [6 :0]  entry25_cmplt_vld;                   
wire            entry25_create_dp_en;                
wire            entry25_create_en;                   
wire            entry25_create_gateclk_en;           
wire    [3 :0]  entry25_create_sel;                  
wire            entry25_pop_en;                      
wire    [39:0]  entry25_read_data;                   
wire            entry26_cmplt_gateclk_vld;           
wire    [6 :0]  entry26_cmplt_vld;                   
wire            entry26_create_dp_en;                
wire            entry26_create_en;                   
wire            entry26_create_gateclk_en;           
wire    [3 :0]  entry26_create_sel;                  
wire            entry26_pop_en;                      
wire    [39:0]  entry26_read_data;                   
wire            entry27_cmplt_gateclk_vld;           
wire    [6 :0]  entry27_cmplt_vld;                   
wire            entry27_create_dp_en;                
wire            entry27_create_en;                   
wire            entry27_create_gateclk_en;           
wire    [3 :0]  entry27_create_sel;                  
wire            entry27_pop_en;                      
wire    [39:0]  entry27_read_data;                   
wire            entry28_cmplt_gateclk_vld;           
wire    [6 :0]  entry28_cmplt_vld;                   
wire            entry28_create_dp_en;                
wire            entry28_create_en;                   
wire            entry28_create_gateclk_en;           
wire    [3 :0]  entry28_create_sel;                  
wire            entry28_pop_en;                      
wire    [39:0]  entry28_read_data;                   
wire            entry29_cmplt_gateclk_vld;           
wire    [6 :0]  entry29_cmplt_vld;                   
wire            entry29_create_dp_en;                
wire            entry29_create_en;                   
wire            entry29_create_gateclk_en;           
wire    [3 :0]  entry29_create_sel;                  
wire            entry29_pop_en;                      
wire    [39:0]  entry29_read_data;                   
wire            entry2_cmplt_gateclk_vld;            
wire    [6 :0]  entry2_cmplt_vld;                    
wire            entry2_create_dp_en;                 
wire            entry2_create_en;                    
wire            entry2_create_gateclk_en;            
wire    [3 :0]  entry2_create_sel;                   
wire            entry2_pop_en;                       
wire    [39:0]  entry2_read_data;                    
wire            entry30_cmplt_gateclk_vld;           
wire    [6 :0]  entry30_cmplt_vld;                   
wire            entry30_create_dp_en;                
wire            entry30_create_en;                   
wire            entry30_create_gateclk_en;           
wire    [3 :0]  entry30_create_sel;                  
wire            entry30_pop_en;                      
wire    [39:0]  entry30_read_data;                   
wire            entry31_cmplt_gateclk_vld;           
wire    [6 :0]  entry31_cmplt_vld;                   
wire            entry31_create_dp_en;                
wire            entry31_create_en;                   
wire            entry31_create_gateclk_en;           
wire    [3 :0]  entry31_create_sel;                  
wire            entry31_pop_en;                      
wire    [39:0]  entry31_read_data;                   
wire            entry32_cmplt_gateclk_vld;           
wire    [6 :0]  entry32_cmplt_vld;                   
wire            entry32_create_dp_en;                
wire            entry32_create_en;                   
wire            entry32_create_gateclk_en;           
wire    [3 :0]  entry32_create_sel;                  
wire            entry32_pop_en;                      
wire    [39:0]  entry32_read_data;                   
wire            entry33_cmplt_gateclk_vld;           
wire    [6 :0]  entry33_cmplt_vld;                   
wire            entry33_create_dp_en;                
wire            entry33_create_en;                   
wire            entry33_create_gateclk_en;           
wire    [3 :0]  entry33_create_sel;                  
wire            entry33_pop_en;                      
wire    [39:0]  entry33_read_data;                   
wire            entry34_cmplt_gateclk_vld;           
wire    [6 :0]  entry34_cmplt_vld;                   
wire            entry34_create_dp_en;                
wire            entry34_create_en;                   
wire            entry34_create_gateclk_en;           
wire    [3 :0]  entry34_create_sel;                  
wire            entry34_pop_en;                      
wire    [39:0]  entry34_read_data;                   
wire            entry35_cmplt_gateclk_vld;           
wire    [6 :0]  entry35_cmplt_vld;                   
wire            entry35_create_dp_en;                
wire            entry35_create_en;                   
wire            entry35_create_gateclk_en;           
wire    [3 :0]  entry35_create_sel;                  
wire            entry35_pop_en;                      
wire    [39:0]  entry35_read_data;                   
wire            entry36_cmplt_gateclk_vld;           
wire    [6 :0]  entry36_cmplt_vld;                   
wire            entry36_create_dp_en;                
wire            entry36_create_en;                   
wire            entry36_create_gateclk_en;           
wire    [3 :0]  entry36_create_sel;                  
wire            entry36_pop_en;                      
wire    [39:0]  entry36_read_data;                   
wire            entry37_cmplt_gateclk_vld;           
wire    [6 :0]  entry37_cmplt_vld;                   
wire            entry37_create_dp_en;                
wire            entry37_create_en;                   
wire            entry37_create_gateclk_en;           
wire    [3 :0]  entry37_create_sel;                  
wire            entry37_pop_en;                      
wire    [39:0]  entry37_read_data;                   
wire            entry38_cmplt_gateclk_vld;           
wire    [6 :0]  entry38_cmplt_vld;                   
wire            entry38_create_dp_en;                
wire            entry38_create_en;                   
wire            entry38_create_gateclk_en;           
wire    [3 :0]  entry38_create_sel;                  
wire            entry38_pop_en;                      
wire    [39:0]  entry38_read_data;                   
wire            entry39_cmplt_gateclk_vld;           
wire    [6 :0]  entry39_cmplt_vld;                   
wire            entry39_create_dp_en;                
wire            entry39_create_en;                   
wire            entry39_create_gateclk_en;           
wire    [3 :0]  entry39_create_sel;                  
wire            entry39_pop_en;                      
wire    [39:0]  entry39_read_data;                   
wire            entry3_cmplt_gateclk_vld;            
wire    [6 :0]  entry3_cmplt_vld;                    
wire            entry3_create_dp_en;                 
wire            entry3_create_en;                    
wire            entry3_create_gateclk_en;            
wire    [3 :0]  entry3_create_sel;                   
wire            entry3_pop_en;                       
wire    [39:0]  entry3_read_data;                    
wire            entry40_cmplt_gateclk_vld;           
wire    [6 :0]  entry40_cmplt_vld;                   
wire            entry40_create_dp_en;                
wire            entry40_create_en;                   
wire            entry40_create_gateclk_en;           
wire    [3 :0]  entry40_create_sel;                  
wire            entry40_pop_en;                      
wire    [39:0]  entry40_read_data;                   
wire            entry41_cmplt_gateclk_vld;           
wire    [6 :0]  entry41_cmplt_vld;                   
wire            entry41_create_dp_en;                
wire            entry41_create_en;                   
wire            entry41_create_gateclk_en;           
wire    [3 :0]  entry41_create_sel;                  
wire            entry41_pop_en;                      
wire    [39:0]  entry41_read_data;                   
wire            entry42_cmplt_gateclk_vld;           
wire    [6 :0]  entry42_cmplt_vld;                   
wire            entry42_create_dp_en;                
wire            entry42_create_en;                   
wire            entry42_create_gateclk_en;           
wire    [3 :0]  entry42_create_sel;                  
wire            entry42_pop_en;                      
wire    [39:0]  entry42_read_data;                   
wire            entry43_cmplt_gateclk_vld;           
wire    [6 :0]  entry43_cmplt_vld;                   
wire            entry43_create_dp_en;                
wire            entry43_create_en;                   
wire            entry43_create_gateclk_en;           
wire    [3 :0]  entry43_create_sel;                  
wire            entry43_pop_en;                      
wire    [39:0]  entry43_read_data;                   
wire            entry44_cmplt_gateclk_vld;           
wire    [6 :0]  entry44_cmplt_vld;                   
wire            entry44_create_dp_en;                
wire            entry44_create_en;                   
wire            entry44_create_gateclk_en;           
wire    [3 :0]  entry44_create_sel;                  
wire            entry44_pop_en;                      
wire    [39:0]  entry44_read_data;                   
wire            entry45_cmplt_gateclk_vld;           
wire    [6 :0]  entry45_cmplt_vld;                   
wire            entry45_create_dp_en;                
wire            entry45_create_en;                   
wire            entry45_create_gateclk_en;           
wire    [3 :0]  entry45_create_sel;                  
wire            entry45_pop_en;                      
wire    [39:0]  entry45_read_data;                   
wire            entry46_cmplt_gateclk_vld;           
wire    [6 :0]  entry46_cmplt_vld;                   
wire            entry46_create_dp_en;                
wire            entry46_create_en;                   
wire            entry46_create_gateclk_en;           
wire    [3 :0]  entry46_create_sel;                  
wire            entry46_pop_en;                      
wire    [39:0]  entry46_read_data;                   
wire            entry47_cmplt_gateclk_vld;           
wire    [6 :0]  entry47_cmplt_vld;                   
wire            entry47_create_dp_en;                
wire            entry47_create_en;                   
wire            entry47_create_gateclk_en;           
wire    [3 :0]  entry47_create_sel;                  
wire            entry47_pop_en;                      
wire    [39:0]  entry47_read_data;                   
wire            entry48_cmplt_gateclk_vld;           
wire    [6 :0]  entry48_cmplt_vld;                   
wire            entry48_create_dp_en;                
wire            entry48_create_en;                   
wire            entry48_create_gateclk_en;           
wire    [3 :0]  entry48_create_sel;                  
wire            entry48_pop_en;                      
wire    [39:0]  entry48_read_data;                   
wire            entry49_cmplt_gateclk_vld;           
wire    [6 :0]  entry49_cmplt_vld;                   
wire            entry49_create_dp_en;                
wire            entry49_create_en;                   
wire            entry49_create_gateclk_en;           
wire    [3 :0]  entry49_create_sel;                  
wire            entry49_pop_en;                      
wire    [39:0]  entry49_read_data;                   
wire            entry4_cmplt_gateclk_vld;            
wire    [6 :0]  entry4_cmplt_vld;                    
wire            entry4_create_dp_en;                 
wire            entry4_create_en;                    
wire            entry4_create_gateclk_en;            
wire    [3 :0]  entry4_create_sel;                   
wire            entry4_pop_en;                       
wire    [39:0]  entry4_read_data;                    
wire            entry50_cmplt_gateclk_vld;           
wire    [6 :0]  entry50_cmplt_vld;                   
wire            entry50_create_dp_en;                
wire            entry50_create_en;                   
wire            entry50_create_gateclk_en;           
wire    [3 :0]  entry50_create_sel;                  
wire            entry50_pop_en;                      
wire    [39:0]  entry50_read_data;                   
wire            entry51_cmplt_gateclk_vld;           
wire    [6 :0]  entry51_cmplt_vld;                   
wire            entry51_create_dp_en;                
wire            entry51_create_en;                   
wire            entry51_create_gateclk_en;           
wire    [3 :0]  entry51_create_sel;                  
wire            entry51_pop_en;                      
wire    [39:0]  entry51_read_data;                   
wire            entry52_cmplt_gateclk_vld;           
wire    [6 :0]  entry52_cmplt_vld;                   
wire            entry52_create_dp_en;                
wire            entry52_create_en;                   
wire            entry52_create_gateclk_en;           
wire    [3 :0]  entry52_create_sel;                  
wire            entry52_pop_en;                      
wire    [39:0]  entry52_read_data;                   
wire            entry53_cmplt_gateclk_vld;           
wire    [6 :0]  entry53_cmplt_vld;                   
wire            entry53_create_dp_en;                
wire            entry53_create_en;                   
wire            entry53_create_gateclk_en;           
wire    [3 :0]  entry53_create_sel;                  
wire            entry53_pop_en;                      
wire    [39:0]  entry53_read_data;                   
wire            entry54_cmplt_gateclk_vld;           
wire    [6 :0]  entry54_cmplt_vld;                   
wire            entry54_create_dp_en;                
wire            entry54_create_en;                   
wire            entry54_create_gateclk_en;           
wire    [3 :0]  entry54_create_sel;                  
wire            entry54_pop_en;                      
wire    [39:0]  entry54_read_data;                   
wire            entry55_cmplt_gateclk_vld;           
wire    [6 :0]  entry55_cmplt_vld;                   
wire            entry55_create_dp_en;                
wire            entry55_create_en;                   
wire            entry55_create_gateclk_en;           
wire    [3 :0]  entry55_create_sel;                  
wire            entry55_pop_en;                      
wire    [39:0]  entry55_read_data;                   
wire            entry56_cmplt_gateclk_vld;           
wire    [6 :0]  entry56_cmplt_vld;                   
wire            entry56_create_dp_en;                
wire            entry56_create_en;                   
wire            entry56_create_gateclk_en;           
wire    [3 :0]  entry56_create_sel;                  
wire            entry56_pop_en;                      
wire    [39:0]  entry56_read_data;                   
wire            entry57_cmplt_gateclk_vld;           
wire    [6 :0]  entry57_cmplt_vld;                   
wire            entry57_create_dp_en;                
wire            entry57_create_en;                   
wire            entry57_create_gateclk_en;           
wire    [3 :0]  entry57_create_sel;                  
wire            entry57_pop_en;                      
wire    [39:0]  entry57_read_data;                   
wire            entry58_cmplt_gateclk_vld;           
wire    [6 :0]  entry58_cmplt_vld;                   
wire            entry58_create_dp_en;                
wire            entry58_create_en;                   
wire            entry58_create_gateclk_en;           
wire    [3 :0]  entry58_create_sel;                  
wire            entry58_pop_en;                      
wire    [39:0]  entry58_read_data;                   
wire            entry59_cmplt_gateclk_vld;           
wire    [6 :0]  entry59_cmplt_vld;                   
wire            entry59_create_dp_en;                
wire            entry59_create_en;                   
wire            entry59_create_gateclk_en;           
wire    [3 :0]  entry59_create_sel;                  
wire            entry59_pop_en;                      
wire    [39:0]  entry59_read_data;                   
wire            entry5_cmplt_gateclk_vld;            
wire    [6 :0]  entry5_cmplt_vld;                    
wire            entry5_create_dp_en;                 
wire            entry5_create_en;                    
wire            entry5_create_gateclk_en;            
wire    [3 :0]  entry5_create_sel;                   
wire            entry5_pop_en;                       
wire    [39:0]  entry5_read_data;                    
wire            entry60_cmplt_gateclk_vld;           
wire    [6 :0]  entry60_cmplt_vld;                   
wire            entry60_create_dp_en;                
wire            entry60_create_en;                   
wire            entry60_create_gateclk_en;           
wire    [3 :0]  entry60_create_sel;                  
wire            entry60_pop_en;                      
wire    [39:0]  entry60_read_data;                   
wire            entry61_cmplt_gateclk_vld;           
wire    [6 :0]  entry61_cmplt_vld;                   
wire            entry61_create_dp_en;                
wire            entry61_create_en;                   
wire            entry61_create_gateclk_en;           
wire    [3 :0]  entry61_create_sel;                  
wire            entry61_pop_en;                      
wire    [39:0]  entry61_read_data;                   
wire            entry62_cmplt_gateclk_vld;           
wire    [6 :0]  entry62_cmplt_vld;                   
wire            entry62_create_dp_en;                
wire            entry62_create_en;                   
wire            entry62_create_gateclk_en;           
wire    [3 :0]  entry62_create_sel;                  
wire            entry62_pop_en;                      
wire    [39:0]  entry62_read_data;                   
wire            entry63_cmplt_gateclk_vld;           
wire    [6 :0]  entry63_cmplt_vld;                   
wire            entry63_create_dp_en;                
wire            entry63_create_en;                   
wire            entry63_create_gateclk_en;           
wire    [3 :0]  entry63_create_sel;                  
wire            entry63_pop_en;                      
wire    [39:0]  entry63_read_data;                   
wire            entry6_cmplt_gateclk_vld;            
wire    [6 :0]  entry6_cmplt_vld;                    
wire            entry6_create_dp_en;                 
wire            entry6_create_en;                    
wire            entry6_create_gateclk_en;            
wire    [3 :0]  entry6_create_sel;                   
wire            entry6_pop_en;                       
wire    [39:0]  entry6_read_data;                    
wire            entry7_cmplt_gateclk_vld;            
wire    [6 :0]  entry7_cmplt_vld;                    
wire            entry7_create_dp_en;                 
wire            entry7_create_en;                    
wire            entry7_create_gateclk_en;            
wire    [3 :0]  entry7_create_sel;                   
wire            entry7_pop_en;                       
wire    [39:0]  entry7_read_data;                    
wire            entry8_cmplt_gateclk_vld;            
wire    [6 :0]  entry8_cmplt_vld;                    
wire            entry8_create_dp_en;                 
wire            entry8_create_en;                    
wire            entry8_create_gateclk_en;            
wire    [3 :0]  entry8_create_sel;                   
wire            entry8_pop_en;                       
wire    [39:0]  entry8_read_data;                    
wire            entry9_cmplt_gateclk_vld;            
wire    [6 :0]  entry9_cmplt_vld;                    
wire            entry9_create_dp_en;                 
wire            entry9_create_en;                    
wire            entry9_create_gateclk_en;            
wire    [3 :0]  entry9_create_sel;                   
wire            entry9_pop_en;                       
wire    [39:0]  entry9_read_data;                    
wire    [63:0]  entry_vld;                           
wire            expt_entry_expt_vld_updt_val;        
wire    [6 :0]  expt_entry_iid;                      
wire            expt_entry_vld;                      
wire            forever_cpuclk;                      
wire            full_cnt_clk;                        
wire            full_cnt_clk_en;                     
wire            had_rtu_data_bkpt_dbgreq;            
wire            had_rtu_dbg_req_en;                  
wire            had_rtu_debug_retire_info_en;        
wire            had_rtu_inst_bkpt_dbgreq;            
wire            had_rtu_xx_tme;                      
wire            hpcp_rtu_cnt_en;                     
wire            idu_rtu_fence_idle;                  
wire    [39:0]  idu_rtu_rob_create0_data;            
wire            idu_rtu_rob_create0_dp_en;           
wire            idu_rtu_rob_create0_en;              
wire            idu_rtu_rob_create0_gateclk_en;      
wire    [39:0]  idu_rtu_rob_create1_data;            
wire            idu_rtu_rob_create1_dp_en;           
wire            idu_rtu_rob_create1_en;              
wire            idu_rtu_rob_create1_gateclk_en;      
wire    [39:0]  idu_rtu_rob_create2_data;            
wire            idu_rtu_rob_create2_dp_en;           
wire            idu_rtu_rob_create2_en;              
wire            idu_rtu_rob_create2_gateclk_en;      
wire    [39:0]  idu_rtu_rob_create3_data;            
wire            idu_rtu_rob_create3_dp_en;           
wire            idu_rtu_rob_create3_en;              
wire            idu_rtu_rob_create3_gateclk_en;      
wire    [38:0]  ifu_rtu_cur_pc;                      
wire            ifu_rtu_cur_pc_load;                 
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
wire    [5 :0]  iu_rtu_pipe0_iid_lsb_6;              
wire    [63:0]  iu_rtu_pipe0_iid_lsb_6_expand;       
wire            iu_rtu_pipe0_immu_expt;              
wire    [31:0]  iu_rtu_pipe0_mtval;                  
wire            iu_rtu_pipe0_vsetvl;                 
wire    [6 :0]  iu_rtu_pipe0_vstart;                 
wire            iu_rtu_pipe0_vstart_vld;             
wire            iu_rtu_pipe1_cmplt;                  
wire    [6 :0]  iu_rtu_pipe1_iid;                    
wire    [5 :0]  iu_rtu_pipe1_iid_lsb_6;              
wire    [63:0]  iu_rtu_pipe1_iid_lsb_6_expand;       
wire            iu_rtu_pipe2_abnormal;               
wire            iu_rtu_pipe2_bht_mispred;            
wire            iu_rtu_pipe2_cmplt;                  
wire    [6 :0]  iu_rtu_pipe2_iid;                    
wire    [5 :0]  iu_rtu_pipe2_iid_lsb_6;              
wire    [63:0]  iu_rtu_pipe2_iid_lsb_6_expand;       
wire            iu_rtu_pipe2_jmp_mispred;            
wire            lsu_misc_cmplt_gateclk_en;           
wire            lsu_rtu_all_commit_data_vld;         
wire    [6 :0]  lsu_rtu_da_pipe3_split_spec_fail_iid; 
wire            lsu_rtu_da_pipe3_split_spec_fail_vld; 
wire    [6 :0]  lsu_rtu_da_pipe4_split_spec_fail_iid; 
wire            lsu_rtu_da_pipe4_split_spec_fail_vld; 
wire            lsu_rtu_wb_pipe3_abnormal;           
wire            lsu_rtu_wb_pipe3_bkpta_data;         
wire            lsu_rtu_wb_pipe3_bkptb_data;         
wire            lsu_rtu_wb_pipe3_cmplt;              
wire    [4 :0]  lsu_rtu_wb_pipe3_expt_vec;           
wire            lsu_rtu_wb_pipe3_expt_vld;           
wire            lsu_rtu_wb_pipe3_flush;              
wire    [6 :0]  lsu_rtu_wb_pipe3_iid;                
wire    [5 :0]  lsu_rtu_wb_pipe3_iid_lsb_6;          
wire    [63:0]  lsu_rtu_wb_pipe3_iid_lsb_6_expand;   
wire    [39:0]  lsu_rtu_wb_pipe3_mtval;              
wire            lsu_rtu_wb_pipe3_no_spec_hit;        
wire            lsu_rtu_wb_pipe3_no_spec_mispred;    
wire            lsu_rtu_wb_pipe3_no_spec_miss;       
wire            lsu_rtu_wb_pipe3_spec_fail;          
wire            lsu_rtu_wb_pipe3_vsetvl;             
wire    [6 :0]  lsu_rtu_wb_pipe3_vstart;             
wire            lsu_rtu_wb_pipe3_vstart_vld;         
wire            lsu_rtu_wb_pipe4_abnormal;           
wire            lsu_rtu_wb_pipe4_bkpta_data;         
wire            lsu_rtu_wb_pipe4_bkptb_data;         
wire            lsu_rtu_wb_pipe4_cmplt;              
wire    [4 :0]  lsu_rtu_wb_pipe4_expt_vec;           
wire            lsu_rtu_wb_pipe4_expt_vld;           
wire            lsu_rtu_wb_pipe4_flush;              
wire    [6 :0]  lsu_rtu_wb_pipe4_iid;                
wire    [5 :0]  lsu_rtu_wb_pipe4_iid_lsb_6;          
wire    [63:0]  lsu_rtu_wb_pipe4_iid_lsb_6_expand;   
wire    [39:0]  lsu_rtu_wb_pipe4_mtval;              
wire            lsu_rtu_wb_pipe4_no_spec_hit;        
wire            lsu_rtu_wb_pipe4_no_spec_mispred;    
wire            lsu_rtu_wb_pipe4_no_spec_miss;       
wire            lsu_rtu_wb_pipe4_spec_fail;          
wire    [6 :0]  lsu_rtu_wb_pipe4_vstart;             
wire            lsu_rtu_wb_pipe4_vstart_vld;         
wire            pad_yy_icg_scan_en;                  
wire            pop_ptr_clk;                         
wire            pop_ptr_clk_en;                      
wire            read_entry0_cmplt_gateclk_vld;       
wire    [6 :0]  read_entry0_cmplt_vld;               
wire    [39:0]  read_entry0_create_data;             
wire            read_entry0_create_dp_en;            
wire            read_entry0_create_en;               
wire            read_entry0_create_gateclk_en;       
wire    [3 :0]  read_entry0_create_sel;              
wire            read_entry0_pop_en;                  
wire    [39:0]  read_entry0_read_data;               
wire            read_entry1_cmplt_gateclk_vld;       
wire    [6 :0]  read_entry1_cmplt_vld;               
wire    [39:0]  read_entry1_create_data;             
wire            read_entry1_create_dp_en;            
wire            read_entry1_create_en;               
wire            read_entry1_create_gateclk_en;       
wire    [3 :0]  read_entry1_create_sel;              
wire            read_entry1_pop_en;                  
wire    [39:0]  read_entry1_read_data;               
wire            read_entry2_cmplt_gateclk_vld;       
wire    [6 :0]  read_entry2_cmplt_vld;               
wire    [39:0]  read_entry2_create_data;             
wire            read_entry2_create_dp_en;            
wire            read_entry2_create_en;               
wire            read_entry2_create_gateclk_en;       
wire    [3 :0]  read_entry2_create_sel;              
wire            read_entry2_pop_en;                  
wire    [39:0]  read_entry2_read_data;               
wire            read_entry_cmplt_gateclk_vld;        
wire            read_ptr_clk;                        
wire            read_ptr_clk_en;                     
wire            retire_entry0_updt_gateclk_vld;      
wire            retire_entry0_updt_vld;              
wire            retire_entry1_updt_vld;              
wire            retire_entry2_updt_vld;              
wire            retire_expt_inst0_abnormal;          
wire            retire_expt_inst0_vld;               
wire            retire_rob_async_expt_commit_mask;   
wire            retire_rob_ctc_flush_req;            
wire            retire_rob_dbg_inst0_ack_int;        
wire            retire_rob_dbg_inst0_dbg_mode_on;    
wire            retire_rob_dbg_inst0_expt_vld;       
wire            retire_rob_dbg_inst0_flush;          
wire            retire_rob_dbg_inst0_mispred;        
wire            retire_rob_flush;                    
wire    [4 :0]  retire_rob_flush_cur_state;          
wire            retire_rob_flush_gateclk;            
wire            retire_rob_inst0_jmp;                
wire            retire_rob_inst1_jmp;                
wire            retire_rob_inst2_jmp;                
wire            retire_rob_inst_flush;               
wire            retire_rob_retire_empty;             
wire            retire_rob_rt_mask;                  
wire            retire_rob_split_fof_flush;          
wire            retire_rob_srt_en;                   
wire            rob_1_entry;                         
wire            rob_2_entry;                         
wire    [63:0]  rob_create1_ptr;                     
wire    [63:0]  rob_create2_ptr;                     
wire    [63:0]  rob_create3_ptr;                     
wire    [63:0]  rob_create_dp_en;                    
wire    [63:0]  rob_create_en;                       
wire    [63:0]  rob_create_gateclk_en;               
wire            rob_create_ptr_add_1;                
wire            rob_create_ptr_add_2;                
wire            rob_create_ptr_add_3;                
wire            rob_create_ptr_add_4;                
wire            rob_create_to_read_entry0_dp_en;     
wire            rob_create_to_read_entry0_en;        
wire            rob_create_to_read_entry0_gateclk_en; 
wire            rob_create_to_read_entry1_dp_en;     
wire            rob_create_to_read_entry1_en;        
wire            rob_create_to_read_entry1_gateclk_en; 
wire            rob_create_to_read_entry2_dp_en;     
wire            rob_create_to_read_entry2_en;        
wire            rob_create_to_read_entry2_gateclk_en; 
wire            rob_debug_commit0;                   
wire            rob_empty;                           
wire    [6 :0]  rob_entry_num_updt;                  
wire            rob_entry_num_updt_vld;              
wire    [63:0]  rob_entry_pop_en;                    
wire    [6 :0]  rob_expt_inst0_iid;                  
wire            rob_full_updt_val;                   
wire    [5 :0]  rob_pop0_ptr;                        
wire    [63:0]  rob_pop0_ptr_expand;                 
wire    [5 :0]  rob_pop1_ptr;                        
wire    [63:0]  rob_pop1_ptr_expand;                 
wire    [5 :0]  rob_pop2_ptr;                        
wire    [63:0]  rob_pop2_ptr_expand;                 
wire            rob_pop_ptr_add_1;                   
wire            rob_pop_ptr_add_2;                   
wire            rob_pop_ptr_add_3;                   
wire            rob_pst_retire_inst0_gateclk_vld;    
wire    [6 :0]  rob_pst_retire_inst0_iid;            
wire    [6 :0]  rob_pst_retire_inst0_iid_updt_val;   
wire            rob_pst_retire_inst1_gateclk_vld;    
wire    [6 :0]  rob_pst_retire_inst1_iid;            
wire    [6 :0]  rob_pst_retire_inst1_iid_updt_val;   
wire            rob_pst_retire_inst2_gateclk_vld;    
wire    [6 :0]  rob_pst_retire_inst2_iid;            
wire    [6 :0]  rob_pst_retire_inst2_iid_updt_val;   
wire    [39:0]  rob_read0_data;                      
wire    [39:0]  rob_read1_data;                      
wire    [63:0]  rob_read1_ptr;                       
wire    [39:0]  rob_read2_data;                      
wire    [63:0]  rob_read2_ptr;                       
wire    [63:0]  rob_read3_ptr;                       
wire    [63:0]  rob_read4_ptr;                       
wire    [63:0]  rob_read5_ptr;                       
wire            rob_read_ptr_add_1;                  
wire            rob_read_ptr_add_2;                  
wire            rob_read_ptr_add_3;                  
wire            rob_retire_commit0;                  
wire            rob_retire_commit1;                  
wire            rob_retire_commit2;                  
wire            rob_retire_ctc_flush_srt_en;         
wire            rob_retire_inst0_bht_mispred;        
wire            rob_retire_inst0_bju;                
wire    [38:0]  rob_retire_inst0_bju_inc_pc;         
wire            rob_retire_inst0_bkpt;               
wire    [7 :0]  rob_retire_inst0_chk_idx;            
wire            rob_retire_inst0_condbr;             
wire            rob_retire_inst0_condbr_taken;       
wire            rob_retire_inst0_ctc_flush;          
wire    [38:0]  rob_retire_inst0_cur_pc;             
wire            rob_retire_inst0_data_bkpt;          
wire            rob_retire_inst0_dbg_disable;        
wire            rob_retire_inst0_efpc_vld;           
wire    [3 :0]  rob_retire_inst0_expt_vec;           
wire            rob_retire_inst0_expt_vld;           
wire            rob_retire_inst0_fp_dirty;           
wire            rob_retire_inst0_high_hw_expt;       
wire    [6 :0]  rob_retire_inst0_iid;                
wire            rob_retire_inst0_immu_expt;          
wire            rob_retire_inst0_inst_bkpt;          
wire            rob_retire_inst0_inst_flush;         
wire    [4 :0]  rob_retire_inst0_int_vec;            
wire            rob_retire_inst0_int_vld;            
wire            rob_retire_inst0_intmask;            
wire            rob_retire_inst0_jmp;                
wire            rob_retire_inst0_jmp_mispred;        
wire            rob_retire_inst0_load;               
wire    [39:0]  rob_retire_inst0_mtval;              
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
wire            rob_retire_inst0_spec_fail;          
wire            rob_retire_inst0_spec_fail_no_ssf;   
wire            rob_retire_inst0_spec_fail_ssf;      
wire            rob_retire_inst0_split;              
wire            rob_retire_inst0_store;              
wire            rob_retire_inst0_vec_dirty;          
wire    [7 :0]  rob_retire_inst0_vl;                 
wire            rob_retire_inst0_vl_pred;            
wire            rob_retire_inst0_vld;                
wire    [1 :0]  rob_retire_inst0_vlmul;              
wire            rob_retire_inst0_vsetvl;             
wire            rob_retire_inst0_vsetvli;            
wire    [2 :0]  rob_retire_inst0_vsew;               
wire    [6 :0]  rob_retire_inst0_vstart;             
wire            rob_retire_inst0_vstart_vld;         
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
wire            rob_retire_split_spec_fail_srt;      
wire    [6 :0]  rob_retire_ssf_iid;                  
wire            rob_top_commit0;                     
wire            rob_top_commit_st_no_vld;            
wire    [6 :0]  rob_top_create0_iid;                 
wire    [6 :0]  rob_top_entry_num;                   
wire    [4 :0]  rob_top_flush_cur_state;             
wire    [6 :0]  rob_top_read0_iid;                   
wire    [6 :0]  rob_top_rob_cur_pc;                  
wire            rob_top_rob_full;                    
wire    [1 :0]  rob_top_ssf_cur_state;               
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
wire            rtu_had_rob_empty;                   
wire            rtu_had_xx_mbkpt_chgflow;            
wire    [39:0]  rtu_hpcp_inst0_cur_pc;               
wire            rtu_hpcp_inst0_jmp_pc_offset_8m;     
wire    [39:0]  rtu_hpcp_inst1_cur_pc;               
wire            rtu_hpcp_inst1_jmp_pc_offset_8m;     
wire    [39:0]  rtu_hpcp_inst2_cur_pc;               
wire            rtu_hpcp_inst2_jmp_pc_offset_8m;     
wire            rtu_idu_retire_int_vld;              
wire            rtu_idu_rob_empty;                   
wire            rtu_idu_rob_full;                    
wire    [6 :0]  rtu_idu_rob_inst0_iid;               
wire    [6 :0]  rtu_idu_rob_inst1_iid;               
wire    [6 :0]  rtu_idu_rob_inst2_iid;               
wire    [6 :0]  rtu_idu_rob_inst3_iid;               
wire            rtu_iu_rob_read0_pcfifo_vld;         
wire            rtu_iu_rob_read1_pcfifo_vld;         
wire            rtu_iu_rob_read2_pcfifo_vld;         
wire            rtu_iu_rob_read_pcfifo_gateclk_vld;  
wire    [6 :0]  rtu_lsu_commit0_iid_updt_val;        
wire    [6 :0]  rtu_lsu_commit1_iid_updt_val;        
wire    [6 :0]  rtu_lsu_commit2_iid_updt_val;        
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
wire            rtu_yy_xx_flush;                     
wire            rtu_yy_xx_retire0;                   
wire            rtu_yy_xx_retire1;                   
wire            rtu_yy_xx_retire2;                   
wire            vfpu_rtu_pipe6_cmplt;                
wire    [6 :0]  vfpu_rtu_pipe6_iid;                  
wire    [5 :0]  vfpu_rtu_pipe6_iid_lsb_6;            
wire    [63:0]  vfpu_rtu_pipe6_iid_lsb_6_expand;     
wire            vfpu_rtu_pipe7_cmplt;                
wire    [6 :0]  vfpu_rtu_pipe7_iid;                  
wire    [5 :0]  vfpu_rtu_pipe7_iid_lsb_6;            
wire    [63:0]  vfpu_rtu_pipe7_iid_lsb_6_expand;     


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

//==========================================================
//                   ROB Entry Instance
//==========================================================
// &ConnRule(s/^x_/entry0_/); @71
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry0"); @72
ct_rtu_rob_entry  x_ct_rtu_rob_entry0 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry0_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry0_cmplt_vld                ),
  .x_create_dp_en                   (entry0_create_dp_en             ),
  .x_create_en                      (entry0_create_en                ),
  .x_create_gateclk_en              (entry0_create_gateclk_en        ),
  .x_create_sel                     (entry0_create_sel               ),
  .x_pop_en                         (entry0_pop_en                   ),
  .x_read_data                      (entry0_read_data                )
);

// &ConnRule(s/^x_/entry1_/); @73
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry1"); @74
ct_rtu_rob_entry  x_ct_rtu_rob_entry1 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry1_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry1_cmplt_vld                ),
  .x_create_dp_en                   (entry1_create_dp_en             ),
  .x_create_en                      (entry1_create_en                ),
  .x_create_gateclk_en              (entry1_create_gateclk_en        ),
  .x_create_sel                     (entry1_create_sel               ),
  .x_pop_en                         (entry1_pop_en                   ),
  .x_read_data                      (entry1_read_data                )
);

// &ConnRule(s/^x_/entry2_/); @75
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry2"); @76
ct_rtu_rob_entry  x_ct_rtu_rob_entry2 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry2_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry2_cmplt_vld                ),
  .x_create_dp_en                   (entry2_create_dp_en             ),
  .x_create_en                      (entry2_create_en                ),
  .x_create_gateclk_en              (entry2_create_gateclk_en        ),
  .x_create_sel                     (entry2_create_sel               ),
  .x_pop_en                         (entry2_pop_en                   ),
  .x_read_data                      (entry2_read_data                )
);

// &ConnRule(s/^x_/entry3_/); @77
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry3"); @78
ct_rtu_rob_entry  x_ct_rtu_rob_entry3 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry3_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry3_cmplt_vld                ),
  .x_create_dp_en                   (entry3_create_dp_en             ),
  .x_create_en                      (entry3_create_en                ),
  .x_create_gateclk_en              (entry3_create_gateclk_en        ),
  .x_create_sel                     (entry3_create_sel               ),
  .x_pop_en                         (entry3_pop_en                   ),
  .x_read_data                      (entry3_read_data                )
);

// &ConnRule(s/^x_/entry4_/); @79
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry4"); @80
ct_rtu_rob_entry  x_ct_rtu_rob_entry4 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry4_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry4_cmplt_vld                ),
  .x_create_dp_en                   (entry4_create_dp_en             ),
  .x_create_en                      (entry4_create_en                ),
  .x_create_gateclk_en              (entry4_create_gateclk_en        ),
  .x_create_sel                     (entry4_create_sel               ),
  .x_pop_en                         (entry4_pop_en                   ),
  .x_read_data                      (entry4_read_data                )
);

// &ConnRule(s/^x_/entry5_/); @81
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry5"); @82
ct_rtu_rob_entry  x_ct_rtu_rob_entry5 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry5_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry5_cmplt_vld                ),
  .x_create_dp_en                   (entry5_create_dp_en             ),
  .x_create_en                      (entry5_create_en                ),
  .x_create_gateclk_en              (entry5_create_gateclk_en        ),
  .x_create_sel                     (entry5_create_sel               ),
  .x_pop_en                         (entry5_pop_en                   ),
  .x_read_data                      (entry5_read_data                )
);

// &ConnRule(s/^x_/entry6_/); @83
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry6"); @84
ct_rtu_rob_entry  x_ct_rtu_rob_entry6 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry6_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry6_cmplt_vld                ),
  .x_create_dp_en                   (entry6_create_dp_en             ),
  .x_create_en                      (entry6_create_en                ),
  .x_create_gateclk_en              (entry6_create_gateclk_en        ),
  .x_create_sel                     (entry6_create_sel               ),
  .x_pop_en                         (entry6_pop_en                   ),
  .x_read_data                      (entry6_read_data                )
);

// &ConnRule(s/^x_/entry7_/); @85
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry7"); @86
ct_rtu_rob_entry  x_ct_rtu_rob_entry7 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry7_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry7_cmplt_vld                ),
  .x_create_dp_en                   (entry7_create_dp_en             ),
  .x_create_en                      (entry7_create_en                ),
  .x_create_gateclk_en              (entry7_create_gateclk_en        ),
  .x_create_sel                     (entry7_create_sel               ),
  .x_pop_en                         (entry7_pop_en                   ),
  .x_read_data                      (entry7_read_data                )
);

// &ConnRule(s/^x_/entry8_/); @87
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry8"); @88
ct_rtu_rob_entry  x_ct_rtu_rob_entry8 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry8_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry8_cmplt_vld                ),
  .x_create_dp_en                   (entry8_create_dp_en             ),
  .x_create_en                      (entry8_create_en                ),
  .x_create_gateclk_en              (entry8_create_gateclk_en        ),
  .x_create_sel                     (entry8_create_sel               ),
  .x_pop_en                         (entry8_pop_en                   ),
  .x_read_data                      (entry8_read_data                )
);

// &ConnRule(s/^x_/entry9_/); @89
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry9"); @90
ct_rtu_rob_entry  x_ct_rtu_rob_entry9 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry9_cmplt_gateclk_vld        ),
  .x_cmplt_vld                      (entry9_cmplt_vld                ),
  .x_create_dp_en                   (entry9_create_dp_en             ),
  .x_create_en                      (entry9_create_en                ),
  .x_create_gateclk_en              (entry9_create_gateclk_en        ),
  .x_create_sel                     (entry9_create_sel               ),
  .x_pop_en                         (entry9_pop_en                   ),
  .x_read_data                      (entry9_read_data                )
);

// &ConnRule(s/^x_/entry10_/); @91
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry10"); @92
ct_rtu_rob_entry  x_ct_rtu_rob_entry10 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry10_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry10_cmplt_vld               ),
  .x_create_dp_en                   (entry10_create_dp_en            ),
  .x_create_en                      (entry10_create_en               ),
  .x_create_gateclk_en              (entry10_create_gateclk_en       ),
  .x_create_sel                     (entry10_create_sel              ),
  .x_pop_en                         (entry10_pop_en                  ),
  .x_read_data                      (entry10_read_data               )
);

// &ConnRule(s/^x_/entry11_/); @93
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry11"); @94
ct_rtu_rob_entry  x_ct_rtu_rob_entry11 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry11_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry11_cmplt_vld               ),
  .x_create_dp_en                   (entry11_create_dp_en            ),
  .x_create_en                      (entry11_create_en               ),
  .x_create_gateclk_en              (entry11_create_gateclk_en       ),
  .x_create_sel                     (entry11_create_sel              ),
  .x_pop_en                         (entry11_pop_en                  ),
  .x_read_data                      (entry11_read_data               )
);

// &ConnRule(s/^x_/entry12_/); @95
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry12"); @96
ct_rtu_rob_entry  x_ct_rtu_rob_entry12 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry12_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry12_cmplt_vld               ),
  .x_create_dp_en                   (entry12_create_dp_en            ),
  .x_create_en                      (entry12_create_en               ),
  .x_create_gateclk_en              (entry12_create_gateclk_en       ),
  .x_create_sel                     (entry12_create_sel              ),
  .x_pop_en                         (entry12_pop_en                  ),
  .x_read_data                      (entry12_read_data               )
);

// &ConnRule(s/^x_/entry13_/); @97
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry13"); @98
ct_rtu_rob_entry  x_ct_rtu_rob_entry13 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry13_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry13_cmplt_vld               ),
  .x_create_dp_en                   (entry13_create_dp_en            ),
  .x_create_en                      (entry13_create_en               ),
  .x_create_gateclk_en              (entry13_create_gateclk_en       ),
  .x_create_sel                     (entry13_create_sel              ),
  .x_pop_en                         (entry13_pop_en                  ),
  .x_read_data                      (entry13_read_data               )
);

// &ConnRule(s/^x_/entry14_/); @99
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry14"); @100
ct_rtu_rob_entry  x_ct_rtu_rob_entry14 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry14_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry14_cmplt_vld               ),
  .x_create_dp_en                   (entry14_create_dp_en            ),
  .x_create_en                      (entry14_create_en               ),
  .x_create_gateclk_en              (entry14_create_gateclk_en       ),
  .x_create_sel                     (entry14_create_sel              ),
  .x_pop_en                         (entry14_pop_en                  ),
  .x_read_data                      (entry14_read_data               )
);

// &ConnRule(s/^x_/entry15_/); @101
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry15"); @102
ct_rtu_rob_entry  x_ct_rtu_rob_entry15 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry15_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry15_cmplt_vld               ),
  .x_create_dp_en                   (entry15_create_dp_en            ),
  .x_create_en                      (entry15_create_en               ),
  .x_create_gateclk_en              (entry15_create_gateclk_en       ),
  .x_create_sel                     (entry15_create_sel              ),
  .x_pop_en                         (entry15_pop_en                  ),
  .x_read_data                      (entry15_read_data               )
);

// &ConnRule(s/^x_/entry16_/); @103
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry16"); @104
ct_rtu_rob_entry  x_ct_rtu_rob_entry16 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry16_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry16_cmplt_vld               ),
  .x_create_dp_en                   (entry16_create_dp_en            ),
  .x_create_en                      (entry16_create_en               ),
  .x_create_gateclk_en              (entry16_create_gateclk_en       ),
  .x_create_sel                     (entry16_create_sel              ),
  .x_pop_en                         (entry16_pop_en                  ),
  .x_read_data                      (entry16_read_data               )
);

// &ConnRule(s/^x_/entry17_/); @105
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry17"); @106
ct_rtu_rob_entry  x_ct_rtu_rob_entry17 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry17_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry17_cmplt_vld               ),
  .x_create_dp_en                   (entry17_create_dp_en            ),
  .x_create_en                      (entry17_create_en               ),
  .x_create_gateclk_en              (entry17_create_gateclk_en       ),
  .x_create_sel                     (entry17_create_sel              ),
  .x_pop_en                         (entry17_pop_en                  ),
  .x_read_data                      (entry17_read_data               )
);

// &ConnRule(s/^x_/entry18_/); @107
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry18"); @108
ct_rtu_rob_entry  x_ct_rtu_rob_entry18 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry18_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry18_cmplt_vld               ),
  .x_create_dp_en                   (entry18_create_dp_en            ),
  .x_create_en                      (entry18_create_en               ),
  .x_create_gateclk_en              (entry18_create_gateclk_en       ),
  .x_create_sel                     (entry18_create_sel              ),
  .x_pop_en                         (entry18_pop_en                  ),
  .x_read_data                      (entry18_read_data               )
);

// &ConnRule(s/^x_/entry19_/); @109
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry19"); @110
ct_rtu_rob_entry  x_ct_rtu_rob_entry19 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry19_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry19_cmplt_vld               ),
  .x_create_dp_en                   (entry19_create_dp_en            ),
  .x_create_en                      (entry19_create_en               ),
  .x_create_gateclk_en              (entry19_create_gateclk_en       ),
  .x_create_sel                     (entry19_create_sel              ),
  .x_pop_en                         (entry19_pop_en                  ),
  .x_read_data                      (entry19_read_data               )
);

// &ConnRule(s/^x_/entry20_/); @111
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry20"); @112
ct_rtu_rob_entry  x_ct_rtu_rob_entry20 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry20_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry20_cmplt_vld               ),
  .x_create_dp_en                   (entry20_create_dp_en            ),
  .x_create_en                      (entry20_create_en               ),
  .x_create_gateclk_en              (entry20_create_gateclk_en       ),
  .x_create_sel                     (entry20_create_sel              ),
  .x_pop_en                         (entry20_pop_en                  ),
  .x_read_data                      (entry20_read_data               )
);

// &ConnRule(s/^x_/entry21_/); @113
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry21"); @114
ct_rtu_rob_entry  x_ct_rtu_rob_entry21 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry21_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry21_cmplt_vld               ),
  .x_create_dp_en                   (entry21_create_dp_en            ),
  .x_create_en                      (entry21_create_en               ),
  .x_create_gateclk_en              (entry21_create_gateclk_en       ),
  .x_create_sel                     (entry21_create_sel              ),
  .x_pop_en                         (entry21_pop_en                  ),
  .x_read_data                      (entry21_read_data               )
);

// &ConnRule(s/^x_/entry22_/); @115
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry22"); @116
ct_rtu_rob_entry  x_ct_rtu_rob_entry22 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry22_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry22_cmplt_vld               ),
  .x_create_dp_en                   (entry22_create_dp_en            ),
  .x_create_en                      (entry22_create_en               ),
  .x_create_gateclk_en              (entry22_create_gateclk_en       ),
  .x_create_sel                     (entry22_create_sel              ),
  .x_pop_en                         (entry22_pop_en                  ),
  .x_read_data                      (entry22_read_data               )
);

// &ConnRule(s/^x_/entry23_/); @117
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry23"); @118
ct_rtu_rob_entry  x_ct_rtu_rob_entry23 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry23_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry23_cmplt_vld               ),
  .x_create_dp_en                   (entry23_create_dp_en            ),
  .x_create_en                      (entry23_create_en               ),
  .x_create_gateclk_en              (entry23_create_gateclk_en       ),
  .x_create_sel                     (entry23_create_sel              ),
  .x_pop_en                         (entry23_pop_en                  ),
  .x_read_data                      (entry23_read_data               )
);

// &ConnRule(s/^x_/entry24_/); @119
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry24"); @120
ct_rtu_rob_entry  x_ct_rtu_rob_entry24 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry24_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry24_cmplt_vld               ),
  .x_create_dp_en                   (entry24_create_dp_en            ),
  .x_create_en                      (entry24_create_en               ),
  .x_create_gateclk_en              (entry24_create_gateclk_en       ),
  .x_create_sel                     (entry24_create_sel              ),
  .x_pop_en                         (entry24_pop_en                  ),
  .x_read_data                      (entry24_read_data               )
);

// &ConnRule(s/^x_/entry25_/); @121
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry25"); @122
ct_rtu_rob_entry  x_ct_rtu_rob_entry25 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry25_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry25_cmplt_vld               ),
  .x_create_dp_en                   (entry25_create_dp_en            ),
  .x_create_en                      (entry25_create_en               ),
  .x_create_gateclk_en              (entry25_create_gateclk_en       ),
  .x_create_sel                     (entry25_create_sel              ),
  .x_pop_en                         (entry25_pop_en                  ),
  .x_read_data                      (entry25_read_data               )
);

// &ConnRule(s/^x_/entry26_/); @123
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry26"); @124
ct_rtu_rob_entry  x_ct_rtu_rob_entry26 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry26_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry26_cmplt_vld               ),
  .x_create_dp_en                   (entry26_create_dp_en            ),
  .x_create_en                      (entry26_create_en               ),
  .x_create_gateclk_en              (entry26_create_gateclk_en       ),
  .x_create_sel                     (entry26_create_sel              ),
  .x_pop_en                         (entry26_pop_en                  ),
  .x_read_data                      (entry26_read_data               )
);

// &ConnRule(s/^x_/entry27_/); @125
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry27"); @126
ct_rtu_rob_entry  x_ct_rtu_rob_entry27 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry27_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry27_cmplt_vld               ),
  .x_create_dp_en                   (entry27_create_dp_en            ),
  .x_create_en                      (entry27_create_en               ),
  .x_create_gateclk_en              (entry27_create_gateclk_en       ),
  .x_create_sel                     (entry27_create_sel              ),
  .x_pop_en                         (entry27_pop_en                  ),
  .x_read_data                      (entry27_read_data               )
);

// &ConnRule(s/^x_/entry28_/); @127
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry28"); @128
ct_rtu_rob_entry  x_ct_rtu_rob_entry28 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry28_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry28_cmplt_vld               ),
  .x_create_dp_en                   (entry28_create_dp_en            ),
  .x_create_en                      (entry28_create_en               ),
  .x_create_gateclk_en              (entry28_create_gateclk_en       ),
  .x_create_sel                     (entry28_create_sel              ),
  .x_pop_en                         (entry28_pop_en                  ),
  .x_read_data                      (entry28_read_data               )
);

// &ConnRule(s/^x_/entry29_/); @129
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry29"); @130
ct_rtu_rob_entry  x_ct_rtu_rob_entry29 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry29_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry29_cmplt_vld               ),
  .x_create_dp_en                   (entry29_create_dp_en            ),
  .x_create_en                      (entry29_create_en               ),
  .x_create_gateclk_en              (entry29_create_gateclk_en       ),
  .x_create_sel                     (entry29_create_sel              ),
  .x_pop_en                         (entry29_pop_en                  ),
  .x_read_data                      (entry29_read_data               )
);

// &ConnRule(s/^x_/entry30_/); @131
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry30"); @132
ct_rtu_rob_entry  x_ct_rtu_rob_entry30 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry30_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry30_cmplt_vld               ),
  .x_create_dp_en                   (entry30_create_dp_en            ),
  .x_create_en                      (entry30_create_en               ),
  .x_create_gateclk_en              (entry30_create_gateclk_en       ),
  .x_create_sel                     (entry30_create_sel              ),
  .x_pop_en                         (entry30_pop_en                  ),
  .x_read_data                      (entry30_read_data               )
);

// &ConnRule(s/^x_/entry31_/); @133
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry31"); @134
ct_rtu_rob_entry  x_ct_rtu_rob_entry31 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry31_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry31_cmplt_vld               ),
  .x_create_dp_en                   (entry31_create_dp_en            ),
  .x_create_en                      (entry31_create_en               ),
  .x_create_gateclk_en              (entry31_create_gateclk_en       ),
  .x_create_sel                     (entry31_create_sel              ),
  .x_pop_en                         (entry31_pop_en                  ),
  .x_read_data                      (entry31_read_data               )
);

// &ConnRule(s/^x_/entry32_/); @135
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry32"); @136
ct_rtu_rob_entry  x_ct_rtu_rob_entry32 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry32_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry32_cmplt_vld               ),
  .x_create_dp_en                   (entry32_create_dp_en            ),
  .x_create_en                      (entry32_create_en               ),
  .x_create_gateclk_en              (entry32_create_gateclk_en       ),
  .x_create_sel                     (entry32_create_sel              ),
  .x_pop_en                         (entry32_pop_en                  ),
  .x_read_data                      (entry32_read_data               )
);

// &ConnRule(s/^x_/entry33_/); @137
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry33"); @138
ct_rtu_rob_entry  x_ct_rtu_rob_entry33 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry33_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry33_cmplt_vld               ),
  .x_create_dp_en                   (entry33_create_dp_en            ),
  .x_create_en                      (entry33_create_en               ),
  .x_create_gateclk_en              (entry33_create_gateclk_en       ),
  .x_create_sel                     (entry33_create_sel              ),
  .x_pop_en                         (entry33_pop_en                  ),
  .x_read_data                      (entry33_read_data               )
);

// &ConnRule(s/^x_/entry34_/); @139
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry34"); @140
ct_rtu_rob_entry  x_ct_rtu_rob_entry34 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry34_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry34_cmplt_vld               ),
  .x_create_dp_en                   (entry34_create_dp_en            ),
  .x_create_en                      (entry34_create_en               ),
  .x_create_gateclk_en              (entry34_create_gateclk_en       ),
  .x_create_sel                     (entry34_create_sel              ),
  .x_pop_en                         (entry34_pop_en                  ),
  .x_read_data                      (entry34_read_data               )
);

// &ConnRule(s/^x_/entry35_/); @141
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry35"); @142
ct_rtu_rob_entry  x_ct_rtu_rob_entry35 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry35_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry35_cmplt_vld               ),
  .x_create_dp_en                   (entry35_create_dp_en            ),
  .x_create_en                      (entry35_create_en               ),
  .x_create_gateclk_en              (entry35_create_gateclk_en       ),
  .x_create_sel                     (entry35_create_sel              ),
  .x_pop_en                         (entry35_pop_en                  ),
  .x_read_data                      (entry35_read_data               )
);

// &ConnRule(s/^x_/entry36_/); @143
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry36"); @144
ct_rtu_rob_entry  x_ct_rtu_rob_entry36 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry36_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry36_cmplt_vld               ),
  .x_create_dp_en                   (entry36_create_dp_en            ),
  .x_create_en                      (entry36_create_en               ),
  .x_create_gateclk_en              (entry36_create_gateclk_en       ),
  .x_create_sel                     (entry36_create_sel              ),
  .x_pop_en                         (entry36_pop_en                  ),
  .x_read_data                      (entry36_read_data               )
);

// &ConnRule(s/^x_/entry37_/); @145
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry37"); @146
ct_rtu_rob_entry  x_ct_rtu_rob_entry37 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry37_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry37_cmplt_vld               ),
  .x_create_dp_en                   (entry37_create_dp_en            ),
  .x_create_en                      (entry37_create_en               ),
  .x_create_gateclk_en              (entry37_create_gateclk_en       ),
  .x_create_sel                     (entry37_create_sel              ),
  .x_pop_en                         (entry37_pop_en                  ),
  .x_read_data                      (entry37_read_data               )
);

// &ConnRule(s/^x_/entry38_/); @147
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry38"); @148
ct_rtu_rob_entry  x_ct_rtu_rob_entry38 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry38_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry38_cmplt_vld               ),
  .x_create_dp_en                   (entry38_create_dp_en            ),
  .x_create_en                      (entry38_create_en               ),
  .x_create_gateclk_en              (entry38_create_gateclk_en       ),
  .x_create_sel                     (entry38_create_sel              ),
  .x_pop_en                         (entry38_pop_en                  ),
  .x_read_data                      (entry38_read_data               )
);

// &ConnRule(s/^x_/entry39_/); @149
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry39"); @150
ct_rtu_rob_entry  x_ct_rtu_rob_entry39 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry39_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry39_cmplt_vld               ),
  .x_create_dp_en                   (entry39_create_dp_en            ),
  .x_create_en                      (entry39_create_en               ),
  .x_create_gateclk_en              (entry39_create_gateclk_en       ),
  .x_create_sel                     (entry39_create_sel              ),
  .x_pop_en                         (entry39_pop_en                  ),
  .x_read_data                      (entry39_read_data               )
);

// &ConnRule(s/^x_/entry40_/); @151
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry40"); @152
ct_rtu_rob_entry  x_ct_rtu_rob_entry40 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry40_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry40_cmplt_vld               ),
  .x_create_dp_en                   (entry40_create_dp_en            ),
  .x_create_en                      (entry40_create_en               ),
  .x_create_gateclk_en              (entry40_create_gateclk_en       ),
  .x_create_sel                     (entry40_create_sel              ),
  .x_pop_en                         (entry40_pop_en                  ),
  .x_read_data                      (entry40_read_data               )
);

// &ConnRule(s/^x_/entry41_/); @153
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry41"); @154
ct_rtu_rob_entry  x_ct_rtu_rob_entry41 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry41_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry41_cmplt_vld               ),
  .x_create_dp_en                   (entry41_create_dp_en            ),
  .x_create_en                      (entry41_create_en               ),
  .x_create_gateclk_en              (entry41_create_gateclk_en       ),
  .x_create_sel                     (entry41_create_sel              ),
  .x_pop_en                         (entry41_pop_en                  ),
  .x_read_data                      (entry41_read_data               )
);

// &ConnRule(s/^x_/entry42_/); @155
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry42"); @156
ct_rtu_rob_entry  x_ct_rtu_rob_entry42 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry42_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry42_cmplt_vld               ),
  .x_create_dp_en                   (entry42_create_dp_en            ),
  .x_create_en                      (entry42_create_en               ),
  .x_create_gateclk_en              (entry42_create_gateclk_en       ),
  .x_create_sel                     (entry42_create_sel              ),
  .x_pop_en                         (entry42_pop_en                  ),
  .x_read_data                      (entry42_read_data               )
);

// &ConnRule(s/^x_/entry43_/); @157
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry43"); @158
ct_rtu_rob_entry  x_ct_rtu_rob_entry43 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry43_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry43_cmplt_vld               ),
  .x_create_dp_en                   (entry43_create_dp_en            ),
  .x_create_en                      (entry43_create_en               ),
  .x_create_gateclk_en              (entry43_create_gateclk_en       ),
  .x_create_sel                     (entry43_create_sel              ),
  .x_pop_en                         (entry43_pop_en                  ),
  .x_read_data                      (entry43_read_data               )
);

// &ConnRule(s/^x_/entry44_/); @159
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry44"); @160
ct_rtu_rob_entry  x_ct_rtu_rob_entry44 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry44_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry44_cmplt_vld               ),
  .x_create_dp_en                   (entry44_create_dp_en            ),
  .x_create_en                      (entry44_create_en               ),
  .x_create_gateclk_en              (entry44_create_gateclk_en       ),
  .x_create_sel                     (entry44_create_sel              ),
  .x_pop_en                         (entry44_pop_en                  ),
  .x_read_data                      (entry44_read_data               )
);

// &ConnRule(s/^x_/entry45_/); @161
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry45"); @162
ct_rtu_rob_entry  x_ct_rtu_rob_entry45 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry45_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry45_cmplt_vld               ),
  .x_create_dp_en                   (entry45_create_dp_en            ),
  .x_create_en                      (entry45_create_en               ),
  .x_create_gateclk_en              (entry45_create_gateclk_en       ),
  .x_create_sel                     (entry45_create_sel              ),
  .x_pop_en                         (entry45_pop_en                  ),
  .x_read_data                      (entry45_read_data               )
);

// &ConnRule(s/^x_/entry46_/); @163
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry46"); @164
ct_rtu_rob_entry  x_ct_rtu_rob_entry46 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry46_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry46_cmplt_vld               ),
  .x_create_dp_en                   (entry46_create_dp_en            ),
  .x_create_en                      (entry46_create_en               ),
  .x_create_gateclk_en              (entry46_create_gateclk_en       ),
  .x_create_sel                     (entry46_create_sel              ),
  .x_pop_en                         (entry46_pop_en                  ),
  .x_read_data                      (entry46_read_data               )
);

// &ConnRule(s/^x_/entry47_/); @165
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry47"); @166
ct_rtu_rob_entry  x_ct_rtu_rob_entry47 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry47_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry47_cmplt_vld               ),
  .x_create_dp_en                   (entry47_create_dp_en            ),
  .x_create_en                      (entry47_create_en               ),
  .x_create_gateclk_en              (entry47_create_gateclk_en       ),
  .x_create_sel                     (entry47_create_sel              ),
  .x_pop_en                         (entry47_pop_en                  ),
  .x_read_data                      (entry47_read_data               )
);

// &ConnRule(s/^x_/entry48_/); @167
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry48"); @168
ct_rtu_rob_entry  x_ct_rtu_rob_entry48 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry48_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry48_cmplt_vld               ),
  .x_create_dp_en                   (entry48_create_dp_en            ),
  .x_create_en                      (entry48_create_en               ),
  .x_create_gateclk_en              (entry48_create_gateclk_en       ),
  .x_create_sel                     (entry48_create_sel              ),
  .x_pop_en                         (entry48_pop_en                  ),
  .x_read_data                      (entry48_read_data               )
);

// &ConnRule(s/^x_/entry49_/); @169
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry49"); @170
ct_rtu_rob_entry  x_ct_rtu_rob_entry49 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry49_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry49_cmplt_vld               ),
  .x_create_dp_en                   (entry49_create_dp_en            ),
  .x_create_en                      (entry49_create_en               ),
  .x_create_gateclk_en              (entry49_create_gateclk_en       ),
  .x_create_sel                     (entry49_create_sel              ),
  .x_pop_en                         (entry49_pop_en                  ),
  .x_read_data                      (entry49_read_data               )
);

// &ConnRule(s/^x_/entry50_/); @171
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry50"); @172
ct_rtu_rob_entry  x_ct_rtu_rob_entry50 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry50_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry50_cmplt_vld               ),
  .x_create_dp_en                   (entry50_create_dp_en            ),
  .x_create_en                      (entry50_create_en               ),
  .x_create_gateclk_en              (entry50_create_gateclk_en       ),
  .x_create_sel                     (entry50_create_sel              ),
  .x_pop_en                         (entry50_pop_en                  ),
  .x_read_data                      (entry50_read_data               )
);

// &ConnRule(s/^x_/entry51_/); @173
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry51"); @174
ct_rtu_rob_entry  x_ct_rtu_rob_entry51 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry51_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry51_cmplt_vld               ),
  .x_create_dp_en                   (entry51_create_dp_en            ),
  .x_create_en                      (entry51_create_en               ),
  .x_create_gateclk_en              (entry51_create_gateclk_en       ),
  .x_create_sel                     (entry51_create_sel              ),
  .x_pop_en                         (entry51_pop_en                  ),
  .x_read_data                      (entry51_read_data               )
);

// &ConnRule(s/^x_/entry52_/); @175
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry52"); @176
ct_rtu_rob_entry  x_ct_rtu_rob_entry52 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry52_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry52_cmplt_vld               ),
  .x_create_dp_en                   (entry52_create_dp_en            ),
  .x_create_en                      (entry52_create_en               ),
  .x_create_gateclk_en              (entry52_create_gateclk_en       ),
  .x_create_sel                     (entry52_create_sel              ),
  .x_pop_en                         (entry52_pop_en                  ),
  .x_read_data                      (entry52_read_data               )
);

// &ConnRule(s/^x_/entry53_/); @177
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry53"); @178
ct_rtu_rob_entry  x_ct_rtu_rob_entry53 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry53_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry53_cmplt_vld               ),
  .x_create_dp_en                   (entry53_create_dp_en            ),
  .x_create_en                      (entry53_create_en               ),
  .x_create_gateclk_en              (entry53_create_gateclk_en       ),
  .x_create_sel                     (entry53_create_sel              ),
  .x_pop_en                         (entry53_pop_en                  ),
  .x_read_data                      (entry53_read_data               )
);

// &ConnRule(s/^x_/entry54_/); @179
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry54"); @180
ct_rtu_rob_entry  x_ct_rtu_rob_entry54 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry54_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry54_cmplt_vld               ),
  .x_create_dp_en                   (entry54_create_dp_en            ),
  .x_create_en                      (entry54_create_en               ),
  .x_create_gateclk_en              (entry54_create_gateclk_en       ),
  .x_create_sel                     (entry54_create_sel              ),
  .x_pop_en                         (entry54_pop_en                  ),
  .x_read_data                      (entry54_read_data               )
);

// &ConnRule(s/^x_/entry55_/); @181
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry55"); @182
ct_rtu_rob_entry  x_ct_rtu_rob_entry55 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry55_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry55_cmplt_vld               ),
  .x_create_dp_en                   (entry55_create_dp_en            ),
  .x_create_en                      (entry55_create_en               ),
  .x_create_gateclk_en              (entry55_create_gateclk_en       ),
  .x_create_sel                     (entry55_create_sel              ),
  .x_pop_en                         (entry55_pop_en                  ),
  .x_read_data                      (entry55_read_data               )
);

// &ConnRule(s/^x_/entry56_/); @183
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry56"); @184
ct_rtu_rob_entry  x_ct_rtu_rob_entry56 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry56_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry56_cmplt_vld               ),
  .x_create_dp_en                   (entry56_create_dp_en            ),
  .x_create_en                      (entry56_create_en               ),
  .x_create_gateclk_en              (entry56_create_gateclk_en       ),
  .x_create_sel                     (entry56_create_sel              ),
  .x_pop_en                         (entry56_pop_en                  ),
  .x_read_data                      (entry56_read_data               )
);

// &ConnRule(s/^x_/entry57_/); @185
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry57"); @186
ct_rtu_rob_entry  x_ct_rtu_rob_entry57 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry57_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry57_cmplt_vld               ),
  .x_create_dp_en                   (entry57_create_dp_en            ),
  .x_create_en                      (entry57_create_en               ),
  .x_create_gateclk_en              (entry57_create_gateclk_en       ),
  .x_create_sel                     (entry57_create_sel              ),
  .x_pop_en                         (entry57_pop_en                  ),
  .x_read_data                      (entry57_read_data               )
);

// &ConnRule(s/^x_/entry58_/); @187
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry58"); @188
ct_rtu_rob_entry  x_ct_rtu_rob_entry58 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry58_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry58_cmplt_vld               ),
  .x_create_dp_en                   (entry58_create_dp_en            ),
  .x_create_en                      (entry58_create_en               ),
  .x_create_gateclk_en              (entry58_create_gateclk_en       ),
  .x_create_sel                     (entry58_create_sel              ),
  .x_pop_en                         (entry58_pop_en                  ),
  .x_read_data                      (entry58_read_data               )
);

// &ConnRule(s/^x_/entry59_/); @189
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry59"); @190
ct_rtu_rob_entry  x_ct_rtu_rob_entry59 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry59_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry59_cmplt_vld               ),
  .x_create_dp_en                   (entry59_create_dp_en            ),
  .x_create_en                      (entry59_create_en               ),
  .x_create_gateclk_en              (entry59_create_gateclk_en       ),
  .x_create_sel                     (entry59_create_sel              ),
  .x_pop_en                         (entry59_pop_en                  ),
  .x_read_data                      (entry59_read_data               )
);

// &ConnRule(s/^x_/entry60_/); @191
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry60"); @192
ct_rtu_rob_entry  x_ct_rtu_rob_entry60 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry60_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry60_cmplt_vld               ),
  .x_create_dp_en                   (entry60_create_dp_en            ),
  .x_create_en                      (entry60_create_en               ),
  .x_create_gateclk_en              (entry60_create_gateclk_en       ),
  .x_create_sel                     (entry60_create_sel              ),
  .x_pop_en                         (entry60_pop_en                  ),
  .x_read_data                      (entry60_read_data               )
);

// &ConnRule(s/^x_/entry61_/); @193
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry61"); @194
ct_rtu_rob_entry  x_ct_rtu_rob_entry61 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry61_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry61_cmplt_vld               ),
  .x_create_dp_en                   (entry61_create_dp_en            ),
  .x_create_en                      (entry61_create_en               ),
  .x_create_gateclk_en              (entry61_create_gateclk_en       ),
  .x_create_sel                     (entry61_create_sel              ),
  .x_pop_en                         (entry61_pop_en                  ),
  .x_read_data                      (entry61_read_data               )
);

// &ConnRule(s/^x_/entry62_/); @195
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry62"); @196
ct_rtu_rob_entry  x_ct_rtu_rob_entry62 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry62_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry62_cmplt_vld               ),
  .x_create_dp_en                   (entry62_create_dp_en            ),
  .x_create_en                      (entry62_create_en               ),
  .x_create_gateclk_en              (entry62_create_gateclk_en       ),
  .x_create_sel                     (entry62_create_sel              ),
  .x_pop_en                         (entry62_pop_en                  ),
  .x_read_data                      (entry62_read_data               )
);

// &ConnRule(s/^x_/entry63_/); @197
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_entry63"); @198
ct_rtu_rob_entry  x_ct_rtu_rob_entry63 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (idu_rtu_rob_create0_data        ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (entry63_cmplt_gateclk_vld       ),
  .x_cmplt_vld                      (entry63_cmplt_vld               ),
  .x_create_dp_en                   (entry63_create_dp_en            ),
  .x_create_en                      (entry63_create_en               ),
  .x_create_gateclk_en              (entry63_create_gateclk_en       ),
  .x_create_sel                     (entry63_create_sel              ),
  .x_pop_en                         (entry63_pop_en                  ),
  .x_read_data                      (entry63_read_data               )
);


// &ConnRule(s/^x_/read_entry0_/); @200
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_read_entry0"); @201
ct_rtu_rob_entry  x_ct_rtu_rob_read_entry0 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (read_entry0_create_data[39:0]   ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (read_entry0_cmplt_gateclk_vld   ),
  .x_cmplt_vld                      (read_entry0_cmplt_vld           ),
  .x_create_dp_en                   (read_entry0_create_dp_en        ),
  .x_create_en                      (read_entry0_create_en           ),
  .x_create_gateclk_en              (read_entry0_create_gateclk_en   ),
  .x_create_sel                     (read_entry0_create_sel          ),
  .x_pop_en                         (read_entry0_pop_en              ),
  .x_read_data                      (read_entry0_read_data           )
);

// &Connect(.idu_rtu_rob_create0_data (read_entry0_create_data[ROB_WIDTH-1:0]), @202
//          .idu_rtu_rob_create1_data ({ROB_WIDTH{1'b0}}), @203
//          .idu_rtu_rob_create2_data ({ROB_WIDTH{1'b0}}), @204
//          .idu_rtu_rob_create3_data ({ROB_WIDTH{1'b0}})); @205
// &ConnRule(s/^x_/read_entry1_/); @206
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_read_entry1"); @207
ct_rtu_rob_entry  x_ct_rtu_rob_read_entry1 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (read_entry1_create_data[39:0]   ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (read_entry1_cmplt_gateclk_vld   ),
  .x_cmplt_vld                      (read_entry1_cmplt_vld           ),
  .x_create_dp_en                   (read_entry1_create_dp_en        ),
  .x_create_en                      (read_entry1_create_en           ),
  .x_create_gateclk_en              (read_entry1_create_gateclk_en   ),
  .x_create_sel                     (read_entry1_create_sel          ),
  .x_pop_en                         (read_entry1_pop_en              ),
  .x_read_data                      (read_entry1_read_data           )
);

// &Connect(.idu_rtu_rob_create0_data (read_entry1_create_data[ROB_WIDTH-1:0]), @208
//          .idu_rtu_rob_create1_data ({ROB_WIDTH{1'b0}}), @209
//          .idu_rtu_rob_create2_data ({ROB_WIDTH{1'b0}}), @210
//          .idu_rtu_rob_create3_data ({ROB_WIDTH{1'b0}})); @211
// &ConnRule(s/^x_/read_entry2_/); @212
// &Instance("ct_rtu_rob_entry", "x_ct_rtu_rob_read_entry2"); @213
ct_rtu_rob_entry  x_ct_rtu_rob_read_entry2 (
  .cp0_rtu_icg_en                   (cp0_rtu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .idu_rtu_rob_create0_data         (read_entry2_create_data[39:0]   ),
  .idu_rtu_rob_create1_data         (idu_rtu_rob_create1_data        ),
  .idu_rtu_rob_create2_data         (idu_rtu_rob_create2_data        ),
  .idu_rtu_rob_create3_data         (idu_rtu_rob_create3_data        ),
  .lsu_misc_cmplt_gateclk_en        (lsu_misc_cmplt_gateclk_en       ),
  .lsu_rtu_wb_pipe3_bkpta_data      (lsu_rtu_wb_pipe3_bkpta_data     ),
  .lsu_rtu_wb_pipe3_bkptb_data      (lsu_rtu_wb_pipe3_bkptb_data     ),
  .lsu_rtu_wb_pipe3_no_spec_hit     (lsu_rtu_wb_pipe3_no_spec_hit    ),
  .lsu_rtu_wb_pipe3_no_spec_mispred (lsu_rtu_wb_pipe3_no_spec_mispred),
  .lsu_rtu_wb_pipe3_no_spec_miss    (lsu_rtu_wb_pipe3_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .retire_rob_flush                 (retire_rob_flush                ),
  .retire_rob_flush_gateclk         (retire_rob_flush_gateclk        ),
  .x_cmplt_gateclk_vld              (read_entry2_cmplt_gateclk_vld   ),
  .x_cmplt_vld                      (read_entry2_cmplt_vld           ),
  .x_create_dp_en                   (read_entry2_create_dp_en        ),
  .x_create_en                      (read_entry2_create_en           ),
  .x_create_gateclk_en              (read_entry2_create_gateclk_en   ),
  .x_create_sel                     (read_entry2_create_sel          ),
  .x_pop_en                         (read_entry2_pop_en              ),
  .x_read_data                      (read_entry2_read_data           )
);

// &Connect(.idu_rtu_rob_create0_data (read_entry2_create_data[ROB_WIDTH-1:0]), @214
//          .idu_rtu_rob_create1_data ({ROB_WIDTH{1'b0}}), @215
//          .idu_rtu_rob_create2_data ({ROB_WIDTH{1'b0}}), @216
//          .idu_rtu_rob_create3_data ({ROB_WIDTH{1'b0}})); @217

//==========================================================
//                    ROB Create Control
//==========================================================
//----------------------------------------------------------
//                  create enable signals
//----------------------------------------------------------
assign rob_create_en[63:0] =
         {64{idu_rtu_rob_create0_en}} & rob_create0_ptr[63:0]
       | {64{idu_rtu_rob_create1_en}} & rob_create1_ptr[63:0]
       | {64{idu_rtu_rob_create2_en}} & rob_create2_ptr[63:0]
       | {64{idu_rtu_rob_create3_en}} & rob_create3_ptr[63:0];

assign rob_create_dp_en[63:0] =
         {64{idu_rtu_rob_create0_dp_en}} & rob_create0_ptr[63:0]
       | {64{idu_rtu_rob_create1_dp_en}} & rob_create1_ptr[63:0]
       | {64{idu_rtu_rob_create2_dp_en}} & rob_create2_ptr[63:0]
       | {64{idu_rtu_rob_create3_dp_en}} & rob_create3_ptr[63:0];

assign rob_create_gateclk_en[63:0] =
         {64{idu_rtu_rob_create0_gateclk_en}} & rob_create0_ptr[63:0]
       | {64{idu_rtu_rob_create1_gateclk_en}} & rob_create1_ptr[63:0]
       | {64{idu_rtu_rob_create2_gateclk_en}} & rob_create2_ptr[63:0]
       | {64{idu_rtu_rob_create3_gateclk_en}} & rob_create3_ptr[63:0];

//rename for entries
assign entry0_create_en  = rob_create_en[0];
assign entry1_create_en  = rob_create_en[1];
assign entry2_create_en  = rob_create_en[2];
assign entry3_create_en  = rob_create_en[3];
assign entry4_create_en  = rob_create_en[4];
assign entry5_create_en  = rob_create_en[5];
assign entry6_create_en  = rob_create_en[6];
assign entry7_create_en  = rob_create_en[7];
assign entry8_create_en  = rob_create_en[8];
assign entry9_create_en  = rob_create_en[9];
assign entry10_create_en = rob_create_en[10];
assign entry11_create_en = rob_create_en[11];
assign entry12_create_en = rob_create_en[12];
assign entry13_create_en = rob_create_en[13];
assign entry14_create_en = rob_create_en[14];
assign entry15_create_en = rob_create_en[15];
assign entry16_create_en = rob_create_en[16];
assign entry17_create_en = rob_create_en[17];
assign entry18_create_en = rob_create_en[18];
assign entry19_create_en = rob_create_en[19];
assign entry20_create_en = rob_create_en[20];
assign entry21_create_en = rob_create_en[21];
assign entry22_create_en = rob_create_en[22];
assign entry23_create_en = rob_create_en[23];
assign entry24_create_en = rob_create_en[24];
assign entry25_create_en = rob_create_en[25];
assign entry26_create_en = rob_create_en[26];
assign entry27_create_en = rob_create_en[27];
assign entry28_create_en = rob_create_en[28];
assign entry29_create_en = rob_create_en[29];
assign entry30_create_en = rob_create_en[30];
assign entry31_create_en = rob_create_en[31];
assign entry32_create_en = rob_create_en[32];
assign entry33_create_en = rob_create_en[33];
assign entry34_create_en = rob_create_en[34];
assign entry35_create_en = rob_create_en[35];
assign entry36_create_en = rob_create_en[36];
assign entry37_create_en = rob_create_en[37];
assign entry38_create_en = rob_create_en[38];
assign entry39_create_en = rob_create_en[39];
assign entry40_create_en = rob_create_en[40];
assign entry41_create_en = rob_create_en[41];
assign entry42_create_en = rob_create_en[42];
assign entry43_create_en = rob_create_en[43];
assign entry44_create_en = rob_create_en[44];
assign entry45_create_en = rob_create_en[45];
assign entry46_create_en = rob_create_en[46];
assign entry47_create_en = rob_create_en[47];
assign entry48_create_en = rob_create_en[48];
assign entry49_create_en = rob_create_en[49];
assign entry50_create_en = rob_create_en[50];
assign entry51_create_en = rob_create_en[51];
assign entry52_create_en = rob_create_en[52];
assign entry53_create_en = rob_create_en[53];
assign entry54_create_en = rob_create_en[54];
assign entry55_create_en = rob_create_en[55];
assign entry56_create_en = rob_create_en[56];
assign entry57_create_en = rob_create_en[57];
assign entry58_create_en = rob_create_en[58];
assign entry59_create_en = rob_create_en[59];
assign entry60_create_en = rob_create_en[60];
assign entry61_create_en = rob_create_en[61];
assign entry62_create_en = rob_create_en[62];
assign entry63_create_en = rob_create_en[63];

assign entry0_create_dp_en  = rob_create_dp_en[0];
assign entry1_create_dp_en  = rob_create_dp_en[1];
assign entry2_create_dp_en  = rob_create_dp_en[2];
assign entry3_create_dp_en  = rob_create_dp_en[3];
assign entry4_create_dp_en  = rob_create_dp_en[4];
assign entry5_create_dp_en  = rob_create_dp_en[5];
assign entry6_create_dp_en  = rob_create_dp_en[6];
assign entry7_create_dp_en  = rob_create_dp_en[7];
assign entry8_create_dp_en  = rob_create_dp_en[8];
assign entry9_create_dp_en  = rob_create_dp_en[9];
assign entry10_create_dp_en = rob_create_dp_en[10];
assign entry11_create_dp_en = rob_create_dp_en[11];
assign entry12_create_dp_en = rob_create_dp_en[12];
assign entry13_create_dp_en = rob_create_dp_en[13];
assign entry14_create_dp_en = rob_create_dp_en[14];
assign entry15_create_dp_en = rob_create_dp_en[15];
assign entry16_create_dp_en = rob_create_dp_en[16];
assign entry17_create_dp_en = rob_create_dp_en[17];
assign entry18_create_dp_en = rob_create_dp_en[18];
assign entry19_create_dp_en = rob_create_dp_en[19];
assign entry20_create_dp_en = rob_create_dp_en[20];
assign entry21_create_dp_en = rob_create_dp_en[21];
assign entry22_create_dp_en = rob_create_dp_en[22];
assign entry23_create_dp_en = rob_create_dp_en[23];
assign entry24_create_dp_en = rob_create_dp_en[24];
assign entry25_create_dp_en = rob_create_dp_en[25];
assign entry26_create_dp_en = rob_create_dp_en[26];
assign entry27_create_dp_en = rob_create_dp_en[27];
assign entry28_create_dp_en = rob_create_dp_en[28];
assign entry29_create_dp_en = rob_create_dp_en[29];
assign entry30_create_dp_en = rob_create_dp_en[30];
assign entry31_create_dp_en = rob_create_dp_en[31];
assign entry32_create_dp_en = rob_create_dp_en[32];
assign entry33_create_dp_en = rob_create_dp_en[33];
assign entry34_create_dp_en = rob_create_dp_en[34];
assign entry35_create_dp_en = rob_create_dp_en[35];
assign entry36_create_dp_en = rob_create_dp_en[36];
assign entry37_create_dp_en = rob_create_dp_en[37];
assign entry38_create_dp_en = rob_create_dp_en[38];
assign entry39_create_dp_en = rob_create_dp_en[39];
assign entry40_create_dp_en = rob_create_dp_en[40];
assign entry41_create_dp_en = rob_create_dp_en[41];
assign entry42_create_dp_en = rob_create_dp_en[42];
assign entry43_create_dp_en = rob_create_dp_en[43];
assign entry44_create_dp_en = rob_create_dp_en[44];
assign entry45_create_dp_en = rob_create_dp_en[45];
assign entry46_create_dp_en = rob_create_dp_en[46];
assign entry47_create_dp_en = rob_create_dp_en[47];
assign entry48_create_dp_en = rob_create_dp_en[48];
assign entry49_create_dp_en = rob_create_dp_en[49];
assign entry50_create_dp_en = rob_create_dp_en[50];
assign entry51_create_dp_en = rob_create_dp_en[51];
assign entry52_create_dp_en = rob_create_dp_en[52];
assign entry53_create_dp_en = rob_create_dp_en[53];
assign entry54_create_dp_en = rob_create_dp_en[54];
assign entry55_create_dp_en = rob_create_dp_en[55];
assign entry56_create_dp_en = rob_create_dp_en[56];
assign entry57_create_dp_en = rob_create_dp_en[57];
assign entry58_create_dp_en = rob_create_dp_en[58];
assign entry59_create_dp_en = rob_create_dp_en[59];
assign entry60_create_dp_en = rob_create_dp_en[60];
assign entry61_create_dp_en = rob_create_dp_en[61];
assign entry62_create_dp_en = rob_create_dp_en[62];
assign entry63_create_dp_en = rob_create_dp_en[63];

assign entry0_create_gateclk_en  = rob_create_gateclk_en[0];
assign entry1_create_gateclk_en  = rob_create_gateclk_en[1];
assign entry2_create_gateclk_en  = rob_create_gateclk_en[2];
assign entry3_create_gateclk_en  = rob_create_gateclk_en[3];
assign entry4_create_gateclk_en  = rob_create_gateclk_en[4];
assign entry5_create_gateclk_en  = rob_create_gateclk_en[5];
assign entry6_create_gateclk_en  = rob_create_gateclk_en[6];
assign entry7_create_gateclk_en  = rob_create_gateclk_en[7];
assign entry8_create_gateclk_en  = rob_create_gateclk_en[8];
assign entry9_create_gateclk_en  = rob_create_gateclk_en[9];
assign entry10_create_gateclk_en = rob_create_gateclk_en[10];
assign entry11_create_gateclk_en = rob_create_gateclk_en[11];
assign entry12_create_gateclk_en = rob_create_gateclk_en[12];
assign entry13_create_gateclk_en = rob_create_gateclk_en[13];
assign entry14_create_gateclk_en = rob_create_gateclk_en[14];
assign entry15_create_gateclk_en = rob_create_gateclk_en[15];
assign entry16_create_gateclk_en = rob_create_gateclk_en[16];
assign entry17_create_gateclk_en = rob_create_gateclk_en[17];
assign entry18_create_gateclk_en = rob_create_gateclk_en[18];
assign entry19_create_gateclk_en = rob_create_gateclk_en[19];
assign entry20_create_gateclk_en = rob_create_gateclk_en[20];
assign entry21_create_gateclk_en = rob_create_gateclk_en[21];
assign entry22_create_gateclk_en = rob_create_gateclk_en[22];
assign entry23_create_gateclk_en = rob_create_gateclk_en[23];
assign entry24_create_gateclk_en = rob_create_gateclk_en[24];
assign entry25_create_gateclk_en = rob_create_gateclk_en[25];
assign entry26_create_gateclk_en = rob_create_gateclk_en[26];
assign entry27_create_gateclk_en = rob_create_gateclk_en[27];
assign entry28_create_gateclk_en = rob_create_gateclk_en[28];
assign entry29_create_gateclk_en = rob_create_gateclk_en[29];
assign entry30_create_gateclk_en = rob_create_gateclk_en[30];
assign entry31_create_gateclk_en = rob_create_gateclk_en[31];
assign entry32_create_gateclk_en = rob_create_gateclk_en[32];
assign entry33_create_gateclk_en = rob_create_gateclk_en[33];
assign entry34_create_gateclk_en = rob_create_gateclk_en[34];
assign entry35_create_gateclk_en = rob_create_gateclk_en[35];
assign entry36_create_gateclk_en = rob_create_gateclk_en[36];
assign entry37_create_gateclk_en = rob_create_gateclk_en[37];
assign entry38_create_gateclk_en = rob_create_gateclk_en[38];
assign entry39_create_gateclk_en = rob_create_gateclk_en[39];
assign entry40_create_gateclk_en = rob_create_gateclk_en[40];
assign entry41_create_gateclk_en = rob_create_gateclk_en[41];
assign entry42_create_gateclk_en = rob_create_gateclk_en[42];
assign entry43_create_gateclk_en = rob_create_gateclk_en[43];
assign entry44_create_gateclk_en = rob_create_gateclk_en[44];
assign entry45_create_gateclk_en = rob_create_gateclk_en[45];
assign entry46_create_gateclk_en = rob_create_gateclk_en[46];
assign entry47_create_gateclk_en = rob_create_gateclk_en[47];
assign entry48_create_gateclk_en = rob_create_gateclk_en[48];
assign entry49_create_gateclk_en = rob_create_gateclk_en[49];
assign entry50_create_gateclk_en = rob_create_gateclk_en[50];
assign entry51_create_gateclk_en = rob_create_gateclk_en[51];
assign entry52_create_gateclk_en = rob_create_gateclk_en[52];
assign entry53_create_gateclk_en = rob_create_gateclk_en[53];
assign entry54_create_gateclk_en = rob_create_gateclk_en[54];
assign entry55_create_gateclk_en = rob_create_gateclk_en[55];
assign entry56_create_gateclk_en = rob_create_gateclk_en[56];
assign entry57_create_gateclk_en = rob_create_gateclk_en[57];
assign entry58_create_gateclk_en = rob_create_gateclk_en[58];
assign entry59_create_gateclk_en = rob_create_gateclk_en[59];
assign entry60_create_gateclk_en = rob_create_gateclk_en[60];
assign entry61_create_gateclk_en = rob_create_gateclk_en[61];
assign entry62_create_gateclk_en = rob_create_gateclk_en[62];
assign entry63_create_gateclk_en = rob_create_gateclk_en[63];

assign entry0_create_sel[3:0]  = {rob_create3_ptr[0],rob_create2_ptr[0],rob_create1_ptr[0],rob_create0_ptr[0]};
assign entry1_create_sel[3:0]  = {rob_create3_ptr[1],rob_create2_ptr[1],rob_create1_ptr[1],rob_create0_ptr[1]};
assign entry2_create_sel[3:0]  = {rob_create3_ptr[2],rob_create2_ptr[2],rob_create1_ptr[2],rob_create0_ptr[2]};
assign entry3_create_sel[3:0]  = {rob_create3_ptr[3],rob_create2_ptr[3],rob_create1_ptr[3],rob_create0_ptr[3]};
assign entry4_create_sel[3:0]  = {rob_create3_ptr[4],rob_create2_ptr[4],rob_create1_ptr[4],rob_create0_ptr[4]};
assign entry5_create_sel[3:0]  = {rob_create3_ptr[5],rob_create2_ptr[5],rob_create1_ptr[5],rob_create0_ptr[5]};
assign entry6_create_sel[3:0]  = {rob_create3_ptr[6],rob_create2_ptr[6],rob_create1_ptr[6],rob_create0_ptr[6]};
assign entry7_create_sel[3:0]  = {rob_create3_ptr[7],rob_create2_ptr[7],rob_create1_ptr[7],rob_create0_ptr[7]};
assign entry8_create_sel[3:0]  = {rob_create3_ptr[8],rob_create2_ptr[8],rob_create1_ptr[8],rob_create0_ptr[8]};
assign entry9_create_sel[3:0]  = {rob_create3_ptr[9],rob_create2_ptr[9],rob_create1_ptr[9],rob_create0_ptr[9]};
assign entry10_create_sel[3:0] = {rob_create3_ptr[10],rob_create2_ptr[10],rob_create1_ptr[10],rob_create0_ptr[10]};
assign entry11_create_sel[3:0] = {rob_create3_ptr[11],rob_create2_ptr[11],rob_create1_ptr[11],rob_create0_ptr[11]};
assign entry12_create_sel[3:0] = {rob_create3_ptr[12],rob_create2_ptr[12],rob_create1_ptr[12],rob_create0_ptr[12]};
assign entry13_create_sel[3:0] = {rob_create3_ptr[13],rob_create2_ptr[13],rob_create1_ptr[13],rob_create0_ptr[13]};
assign entry14_create_sel[3:0] = {rob_create3_ptr[14],rob_create2_ptr[14],rob_create1_ptr[14],rob_create0_ptr[14]};
assign entry15_create_sel[3:0] = {rob_create3_ptr[15],rob_create2_ptr[15],rob_create1_ptr[15],rob_create0_ptr[15]};
assign entry16_create_sel[3:0] = {rob_create3_ptr[16],rob_create2_ptr[16],rob_create1_ptr[16],rob_create0_ptr[16]};
assign entry17_create_sel[3:0] = {rob_create3_ptr[17],rob_create2_ptr[17],rob_create1_ptr[17],rob_create0_ptr[17]};
assign entry18_create_sel[3:0] = {rob_create3_ptr[18],rob_create2_ptr[18],rob_create1_ptr[18],rob_create0_ptr[18]};
assign entry19_create_sel[3:0] = {rob_create3_ptr[19],rob_create2_ptr[19],rob_create1_ptr[19],rob_create0_ptr[19]};
assign entry20_create_sel[3:0] = {rob_create3_ptr[20],rob_create2_ptr[20],rob_create1_ptr[20],rob_create0_ptr[20]};
assign entry21_create_sel[3:0] = {rob_create3_ptr[21],rob_create2_ptr[21],rob_create1_ptr[21],rob_create0_ptr[21]};
assign entry22_create_sel[3:0] = {rob_create3_ptr[22],rob_create2_ptr[22],rob_create1_ptr[22],rob_create0_ptr[22]};
assign entry23_create_sel[3:0] = {rob_create3_ptr[23],rob_create2_ptr[23],rob_create1_ptr[23],rob_create0_ptr[23]};
assign entry24_create_sel[3:0] = {rob_create3_ptr[24],rob_create2_ptr[24],rob_create1_ptr[24],rob_create0_ptr[24]};
assign entry25_create_sel[3:0] = {rob_create3_ptr[25],rob_create2_ptr[25],rob_create1_ptr[25],rob_create0_ptr[25]};
assign entry26_create_sel[3:0] = {rob_create3_ptr[26],rob_create2_ptr[26],rob_create1_ptr[26],rob_create0_ptr[26]};
assign entry27_create_sel[3:0] = {rob_create3_ptr[27],rob_create2_ptr[27],rob_create1_ptr[27],rob_create0_ptr[27]};
assign entry28_create_sel[3:0] = {rob_create3_ptr[28],rob_create2_ptr[28],rob_create1_ptr[28],rob_create0_ptr[28]};
assign entry29_create_sel[3:0] = {rob_create3_ptr[29],rob_create2_ptr[29],rob_create1_ptr[29],rob_create0_ptr[29]};
assign entry30_create_sel[3:0] = {rob_create3_ptr[30],rob_create2_ptr[30],rob_create1_ptr[30],rob_create0_ptr[30]};
assign entry31_create_sel[3:0] = {rob_create3_ptr[31],rob_create2_ptr[31],rob_create1_ptr[31],rob_create0_ptr[31]};
assign entry32_create_sel[3:0] = {rob_create3_ptr[32],rob_create2_ptr[32],rob_create1_ptr[32],rob_create0_ptr[32]};
assign entry33_create_sel[3:0] = {rob_create3_ptr[33],rob_create2_ptr[33],rob_create1_ptr[33],rob_create0_ptr[33]};
assign entry34_create_sel[3:0] = {rob_create3_ptr[34],rob_create2_ptr[34],rob_create1_ptr[34],rob_create0_ptr[34]};
assign entry35_create_sel[3:0] = {rob_create3_ptr[35],rob_create2_ptr[35],rob_create1_ptr[35],rob_create0_ptr[35]};
assign entry36_create_sel[3:0] = {rob_create3_ptr[36],rob_create2_ptr[36],rob_create1_ptr[36],rob_create0_ptr[36]};
assign entry37_create_sel[3:0] = {rob_create3_ptr[37],rob_create2_ptr[37],rob_create1_ptr[37],rob_create0_ptr[37]};
assign entry38_create_sel[3:0] = {rob_create3_ptr[38],rob_create2_ptr[38],rob_create1_ptr[38],rob_create0_ptr[38]};
assign entry39_create_sel[3:0] = {rob_create3_ptr[39],rob_create2_ptr[39],rob_create1_ptr[39],rob_create0_ptr[39]};
assign entry40_create_sel[3:0] = {rob_create3_ptr[40],rob_create2_ptr[40],rob_create1_ptr[40],rob_create0_ptr[40]};
assign entry41_create_sel[3:0] = {rob_create3_ptr[41],rob_create2_ptr[41],rob_create1_ptr[41],rob_create0_ptr[41]};
assign entry42_create_sel[3:0] = {rob_create3_ptr[42],rob_create2_ptr[42],rob_create1_ptr[42],rob_create0_ptr[42]};
assign entry43_create_sel[3:0] = {rob_create3_ptr[43],rob_create2_ptr[43],rob_create1_ptr[43],rob_create0_ptr[43]};
assign entry44_create_sel[3:0] = {rob_create3_ptr[44],rob_create2_ptr[44],rob_create1_ptr[44],rob_create0_ptr[44]};
assign entry45_create_sel[3:0] = {rob_create3_ptr[45],rob_create2_ptr[45],rob_create1_ptr[45],rob_create0_ptr[45]};
assign entry46_create_sel[3:0] = {rob_create3_ptr[46],rob_create2_ptr[46],rob_create1_ptr[46],rob_create0_ptr[46]};
assign entry47_create_sel[3:0] = {rob_create3_ptr[47],rob_create2_ptr[47],rob_create1_ptr[47],rob_create0_ptr[47]};
assign entry48_create_sel[3:0] = {rob_create3_ptr[48],rob_create2_ptr[48],rob_create1_ptr[48],rob_create0_ptr[48]};
assign entry49_create_sel[3:0] = {rob_create3_ptr[49],rob_create2_ptr[49],rob_create1_ptr[49],rob_create0_ptr[49]};
assign entry50_create_sel[3:0] = {rob_create3_ptr[50],rob_create2_ptr[50],rob_create1_ptr[50],rob_create0_ptr[50]};
assign entry51_create_sel[3:0] = {rob_create3_ptr[51],rob_create2_ptr[51],rob_create1_ptr[51],rob_create0_ptr[51]};
assign entry52_create_sel[3:0] = {rob_create3_ptr[52],rob_create2_ptr[52],rob_create1_ptr[52],rob_create0_ptr[52]};
assign entry53_create_sel[3:0] = {rob_create3_ptr[53],rob_create2_ptr[53],rob_create1_ptr[53],rob_create0_ptr[53]};
assign entry54_create_sel[3:0] = {rob_create3_ptr[54],rob_create2_ptr[54],rob_create1_ptr[54],rob_create0_ptr[54]};
assign entry55_create_sel[3:0] = {rob_create3_ptr[55],rob_create2_ptr[55],rob_create1_ptr[55],rob_create0_ptr[55]};
assign entry56_create_sel[3:0] = {rob_create3_ptr[56],rob_create2_ptr[56],rob_create1_ptr[56],rob_create0_ptr[56]};
assign entry57_create_sel[3:0] = {rob_create3_ptr[57],rob_create2_ptr[57],rob_create1_ptr[57],rob_create0_ptr[57]};
assign entry58_create_sel[3:0] = {rob_create3_ptr[58],rob_create2_ptr[58],rob_create1_ptr[58],rob_create0_ptr[58]};
assign entry59_create_sel[3:0] = {rob_create3_ptr[59],rob_create2_ptr[59],rob_create1_ptr[59],rob_create0_ptr[59]};
assign entry60_create_sel[3:0] = {rob_create3_ptr[60],rob_create2_ptr[60],rob_create1_ptr[60],rob_create0_ptr[60]};
assign entry61_create_sel[3:0] = {rob_create3_ptr[61],rob_create2_ptr[61],rob_create1_ptr[61],rob_create0_ptr[61]};
assign entry62_create_sel[3:0] = {rob_create3_ptr[62],rob_create2_ptr[62],rob_create1_ptr[62],rob_create0_ptr[62]};
assign entry63_create_sel[3:0] = {rob_create3_ptr[63],rob_create2_ptr[63],rob_create1_ptr[63],rob_create0_ptr[63]};

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign create_ptr_clk_en = retire_rob_flush_gateclk
                           || idu_rtu_rob_create0_gateclk_en;
// &Instance("gated_clk_cell", "x_create_ptr_gated_clk"); @509
gated_clk_cell  x_create_ptr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (create_ptr_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (create_ptr_clk_en ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @510
//          .external_en (1'b0), @511
//          .global_en   (cp0_yy_clk_en), @512
//          .module_en   (cp0_rtu_icg_en), @513
//          .local_en    (create_ptr_clk_en), @514
//          .clk_out     (create_ptr_clk)); @515

//----------------------------------------------------------
//                    create pointers 
//----------------------------------------------------------
//create to last entry is disable
assign rob_create_ptr_add_1 = idu_rtu_rob_create0_en;
assign rob_create_ptr_add_2 = idu_rtu_rob_create1_en;
assign rob_create_ptr_add_3 = idu_rtu_rob_create2_en;
assign rob_create_ptr_add_4 = idu_rtu_rob_create3_en;

always @(posedge create_ptr_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rob_create0_ptr[63:0]     <= 64'h1;
    rob_create0_iid[6:0]      <= 7'd0;
    rob_create1_iid[6:0]      <= 7'd1;
    rob_create2_iid[6:0]      <= 7'd2;
    rob_create3_iid[6:0]      <= 7'd3;
  end
  else if(retire_rob_flush) begin
    rob_create0_ptr[63:0]     <= 64'h1;
    rob_create0_iid[6:0]      <= 7'd0;
    rob_create1_iid[6:0]      <= 7'd1;
    rob_create2_iid[6:0]      <= 7'd2;
    rob_create3_iid[6:0]      <= 7'd3;
  end
  else if(rob_create_ptr_add_4) begin
    rob_create0_ptr[63:0]     <= {rob_create0_ptr[59:0],rob_create0_ptr[63:60]};
    rob_create0_iid[6:0]      <= rob_create0_iid[6:0] + 7'd4;
    rob_create1_iid[6:0]      <= rob_create1_iid[6:0] + 7'd4;
    rob_create2_iid[6:0]      <= rob_create2_iid[6:0] + 7'd4;
    rob_create3_iid[6:0]      <= rob_create3_iid[6:0] + 7'd4;
  end
  else if(rob_create_ptr_add_3) begin
    rob_create0_ptr[63:0]     <= {rob_create0_ptr[60:0],rob_create0_ptr[63:61]};
    rob_create0_iid[6:0]      <= rob_create0_iid[6:0] + 7'd3;
    rob_create1_iid[6:0]      <= rob_create1_iid[6:0] + 7'd3;
    rob_create2_iid[6:0]      <= rob_create2_iid[6:0] + 7'd3;
    rob_create3_iid[6:0]      <= rob_create3_iid[6:0] + 7'd3;
  end
  else if(rob_create_ptr_add_2) begin
    rob_create0_ptr[63:0]     <= {rob_create0_ptr[61:0],rob_create0_ptr[63:62]};
    rob_create0_iid[6:0]      <= rob_create0_iid[6:0] + 7'd2;
    rob_create1_iid[6:0]      <= rob_create1_iid[6:0] + 7'd2;
    rob_create2_iid[6:0]      <= rob_create2_iid[6:0] + 7'd2;
    rob_create3_iid[6:0]      <= rob_create3_iid[6:0] + 7'd2;
  end
  else if(rob_create_ptr_add_1) begin
    rob_create0_ptr[63:0]     <= {rob_create0_ptr[62:0],rob_create0_ptr[63]};
    rob_create0_iid[6:0]      <= rob_create0_iid[6:0] + 7'd1;
    rob_create1_iid[6:0]      <= rob_create1_iid[6:0] + 7'd1;
    rob_create2_iid[6:0]      <= rob_create2_iid[6:0] + 7'd1;
    rob_create3_iid[6:0]      <= rob_create3_iid[6:0] + 7'd1;
  end
  else begin
    rob_create0_ptr[63:0]     <= rob_create0_ptr[63:0];
    rob_create0_iid[6:0]      <= rob_create0_iid[6:0];
    rob_create1_iid[6:0]      <= rob_create1_iid[6:0];
    rob_create2_iid[6:0]      <= rob_create2_iid[6:0];
    rob_create3_iid[6:0]      <= rob_create3_iid[6:0];
  end
end

assign rob_create1_ptr[63:0] = {rob_create0_ptr[62:0],rob_create0_ptr[63]};
assign rob_create2_ptr[63:0] = {rob_create0_ptr[61:0],rob_create0_ptr[63:62]};
assign rob_create3_ptr[63:0] = {rob_create0_ptr[60:0],rob_create0_ptr[63:61]};

//create to last entry is disabled
assign rtu_idu_rob_inst0_iid[6:0] = rob_create0_iid[6:0];
assign rtu_idu_rob_inst1_iid[6:0] = rob_create1_iid[6:0];
assign rtu_idu_rob_inst2_iid[6:0] = rob_create2_iid[6:0];
assign rtu_idu_rob_inst3_iid[6:0] = rob_create3_iid[6:0];

//==========================================================
//                        ROB full
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign full_cnt_clk_en = retire_rob_flush_gateclk
                         || rtu_yy_xx_retire0
                         || idu_rtu_rob_create0_gateclk_en;
// &Instance("gated_clk_cell", "x_full_cnt_gated_clk"); @598
gated_clk_cell  x_full_cnt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (full_cnt_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (full_cnt_clk_en   ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @599
//          .external_en (1'b0), @600
//          .global_en   (cp0_yy_clk_en), @601
//          .module_en   (cp0_rtu_icg_en), @602
//          .local_en    (full_cnt_clk_en), @603
//          .clk_out     (full_cnt_clk)); @604

//----------------------------------------------------------
//                  ROB valid entry counter
//----------------------------------------------------------
// &CombBeg; @609
always @( rob_create_ptr_add_4
       or rob_create_ptr_add_1
       or rob_create_ptr_add_3
       or rob_create_ptr_add_2)
begin
  if(rob_create_ptr_add_4)
    rob_entry_num_add[2:0] = 3'd4;
  else if(rob_create_ptr_add_3)
    rob_entry_num_add[2:0] = 3'd3;
  else if(rob_create_ptr_add_2)
    rob_entry_num_add[2:0] = 3'd2;
  else if(rob_create_ptr_add_1)
    rob_entry_num_add[2:0] = 3'd1;
  else
    rob_entry_num_add[2:0] = 3'd0;
// &CombEnd; @620
end

// &CombBeg; @622
always @( rob_pop_ptr_add_2
       or rob_pop_ptr_add_1
       or rob_pop_ptr_add_3)
begin
  if(rob_pop_ptr_add_3)
    rob_entry_num_sub[1:0] = 2'd3;
  else if(rob_pop_ptr_add_2)
    rob_entry_num_sub[1:0] = 2'd2;
  else if(rob_pop_ptr_add_1)
    rob_entry_num_sub[1:0] = 2'd1;
  else
    rob_entry_num_sub[1:0] = 2'd0;
// &CombEnd; @631
end

assign rob_entry_num_updt_vld  = rob_create_ptr_add_1 || rob_pop_ptr_add_1;
assign rob_entry_num_updt[6:0] = rob_entry_num[6:0]
                                 + {4'b0,rob_entry_num_add[2:0]}
                                 - {5'b0,rob_entry_num_sub[1:0]};

always @(posedge full_cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rob_entry_num[6:0] <= 7'd0;
  else if(retire_rob_flush)
    rob_entry_num[6:0] <= 7'd0;
  else if(rob_entry_num_updt_vld)
    rob_entry_num[6:0] <= rob_entry_num_updt[6:0];
  else
    rob_entry_num[6:0] <= rob_entry_num[6:0];
end

assign rob_empty         = (rob_entry_num[6:0] == 7'd0);
assign rob_1_entry       = (rob_entry_num[6:0] == 7'd1);
assign rob_2_entry       = (rob_entry_num[6:0] == 7'd2);
assign rtu_idu_rob_empty = rob_empty && retire_rob_retire_empty;

//----------------------------------------------------------
//                     ROB Full signal
//----------------------------------------------------------
assign rob_full_updt_val = (rob_entry_num_updt[6:0] == 7'd64)
                           || (rob_entry_num_updt[6:0] == 7'd63)
                           || (rob_entry_num_updt[6:0] == 7'd62)
                           || (rob_entry_num_updt[6:0] == 7'd61);

always @(posedge full_cnt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rob_full <= 1'b0;
  else if(retire_rob_flush)
    rob_full <= 1'b0;
  else if(rob_entry_num_updt_vld) 
    rob_full <= rob_full_updt_val;
  else 
    rob_full <= rob_full;
end

assign rtu_idu_rob_full = rob_full;

//----------------------------------------------------------
//                   read vld bit
//----------------------------------------------------------
//vld bit 
assign entry_vld[0]  = entry0_read_data[ROB_VLD];
assign entry_vld[1]  = entry1_read_data[ROB_VLD];
assign entry_vld[2]  = entry2_read_data[ROB_VLD];
assign entry_vld[3]  = entry3_read_data[ROB_VLD];
assign entry_vld[4]  = entry4_read_data[ROB_VLD];
assign entry_vld[5]  = entry5_read_data[ROB_VLD];
assign entry_vld[6]  = entry6_read_data[ROB_VLD];
assign entry_vld[7]  = entry7_read_data[ROB_VLD];
assign entry_vld[8]  = entry8_read_data[ROB_VLD];
assign entry_vld[9]  = entry9_read_data[ROB_VLD];
assign entry_vld[10] = entry10_read_data[ROB_VLD];
assign entry_vld[11] = entry11_read_data[ROB_VLD];
assign entry_vld[12] = entry12_read_data[ROB_VLD];
assign entry_vld[13] = entry13_read_data[ROB_VLD];
assign entry_vld[14] = entry14_read_data[ROB_VLD];
assign entry_vld[15] = entry15_read_data[ROB_VLD];
assign entry_vld[16] = entry16_read_data[ROB_VLD];
assign entry_vld[17] = entry17_read_data[ROB_VLD];
assign entry_vld[18] = entry18_read_data[ROB_VLD];
assign entry_vld[19] = entry19_read_data[ROB_VLD];
assign entry_vld[20] = entry20_read_data[ROB_VLD];
assign entry_vld[21] = entry21_read_data[ROB_VLD];
assign entry_vld[22] = entry22_read_data[ROB_VLD];
assign entry_vld[23] = entry23_read_data[ROB_VLD];
assign entry_vld[24] = entry24_read_data[ROB_VLD];
assign entry_vld[25] = entry25_read_data[ROB_VLD];
assign entry_vld[26] = entry26_read_data[ROB_VLD];
assign entry_vld[27] = entry27_read_data[ROB_VLD];
assign entry_vld[28] = entry28_read_data[ROB_VLD];
assign entry_vld[29] = entry29_read_data[ROB_VLD];
assign entry_vld[30] = entry30_read_data[ROB_VLD];
assign entry_vld[31] = entry31_read_data[ROB_VLD];
assign entry_vld[32] = entry32_read_data[ROB_VLD];
assign entry_vld[33] = entry33_read_data[ROB_VLD];
assign entry_vld[34] = entry34_read_data[ROB_VLD];
assign entry_vld[35] = entry35_read_data[ROB_VLD];
assign entry_vld[36] = entry36_read_data[ROB_VLD];
assign entry_vld[37] = entry37_read_data[ROB_VLD];
assign entry_vld[38] = entry38_read_data[ROB_VLD];
assign entry_vld[39] = entry39_read_data[ROB_VLD];
assign entry_vld[40] = entry40_read_data[ROB_VLD];
assign entry_vld[41] = entry41_read_data[ROB_VLD];
assign entry_vld[42] = entry42_read_data[ROB_VLD];
assign entry_vld[43] = entry43_read_data[ROB_VLD];
assign entry_vld[44] = entry44_read_data[ROB_VLD];
assign entry_vld[45] = entry45_read_data[ROB_VLD];
assign entry_vld[46] = entry46_read_data[ROB_VLD];
assign entry_vld[47] = entry47_read_data[ROB_VLD];
assign entry_vld[48] = entry48_read_data[ROB_VLD];
assign entry_vld[49] = entry49_read_data[ROB_VLD];
assign entry_vld[50] = entry50_read_data[ROB_VLD];
assign entry_vld[51] = entry51_read_data[ROB_VLD];
assign entry_vld[52] = entry52_read_data[ROB_VLD];
assign entry_vld[53] = entry53_read_data[ROB_VLD];
assign entry_vld[54] = entry54_read_data[ROB_VLD];
assign entry_vld[55] = entry55_read_data[ROB_VLD];
assign entry_vld[56] = entry56_read_data[ROB_VLD];
assign entry_vld[57] = entry57_read_data[ROB_VLD];
assign entry_vld[58] = entry58_read_data[ROB_VLD];
assign entry_vld[59] = entry59_read_data[ROB_VLD];
assign entry_vld[60] = entry60_read_data[ROB_VLD];
assign entry_vld[61] = entry61_read_data[ROB_VLD];
assign entry_vld[62] = entry62_read_data[ROB_VLD];
assign entry_vld[63] = entry63_read_data[ROB_VLD];

assign rtu_had_rob_empty = !(|entry_vld[63:0]);

//==========================================================
//                    ROB Complete Port
//==========================================================
//assign bkpt_data_clk_en = idu_rtu_rob_create0_dp_en
//                       || idu_rtu_rob_create1_dp_en
//                       || idu_rtu_rob_create2_dp_en
//                       || idu_rtu_rob_create3_dp_en
//                       || lsu_rtu_wb_pipe3_cmplt
//                          && (lsu_rtu_wb_pipe3_bkpta_data
//                           || lsu_rtu_wb_pipe3_bkptb_data)
//                       || lsu_rtu_wb_pipe4_cmplt
//                          && (lsu_rtu_wb_pipe4_bkpta_data
//                           || lsu_rtu_wb_pipe4_bkptb_data);
//&Instance("gated_clk_cell", "x_bkpt_data_gated_clk");
// //&Connect(.clk_in      (forever_cpuclk), @762
// //         .external_en (1'b0), @763
// //         .global_en   (cp0_yy_clk_en), @764
// //         .module_en   (cp0_rtu_icg_en), @765
// //         .local_en    (bkpt_data_clk_en), @766
// //         .clk_out     (bkpt_data_clk)); @767

// &Force("bus", "iu_rtu_pipe0_iid", 6, 0); @769
// &Force("bus", "iu_rtu_pipe1_iid", 6, 0); @770
// &Force("bus", "iu_rtu_pipe2_iid", 6, 0); @771
// &Force("bus", "lsu_rtu_wb_pipe3_iid", 6, 0); @772
// &Force("bus", "lsu_rtu_wb_pipe4_iid", 6, 0); @773
// &Force("bus", "vfpu_rtu_pipe6_iid", 6, 0); @774
// &Force("bus", "vfpu_rtu_pipe7_iid", 6, 0); @775
assign iu_rtu_pipe0_iid_lsb_6[5:0]     = iu_rtu_pipe0_iid[5:0];
assign iu_rtu_pipe1_iid_lsb_6[5:0]     = iu_rtu_pipe1_iid[5:0];
assign iu_rtu_pipe2_iid_lsb_6[5:0]     = iu_rtu_pipe2_iid[5:0];
assign lsu_rtu_wb_pipe3_iid_lsb_6[5:0] = lsu_rtu_wb_pipe3_iid[5:0];
assign lsu_rtu_wb_pipe4_iid_lsb_6[5:0] = lsu_rtu_wb_pipe4_iid[5:0];
assign vfpu_rtu_pipe6_iid_lsb_6[5:0]   = vfpu_rtu_pipe6_iid[5:0];
assign vfpu_rtu_pipe7_iid_lsb_6[5:0]   = vfpu_rtu_pipe7_iid[5:0];
// &ConnRule(s/^x_num/iu_rtu_pipe0_iid_lsb_6/); @783
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_iu_rtu_pipe0_iid_lsb_6"); @784
ct_rtu_expand_64  x_ct_rtu_expand_64_iu_rtu_pipe0_iid_lsb_6 (
  .x_num                         (iu_rtu_pipe0_iid_lsb_6       ),
  .x_num_expand                  (iu_rtu_pipe0_iid_lsb_6_expand)
);

// &ConnRule(s/^x_num/iu_rtu_pipe1_iid_lsb_6/); @785
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_iu_rtu_pipe1_iid_lsb_6"); @786
ct_rtu_expand_64  x_ct_rtu_expand_64_iu_rtu_pipe1_iid_lsb_6 (
  .x_num                         (iu_rtu_pipe1_iid_lsb_6       ),
  .x_num_expand                  (iu_rtu_pipe1_iid_lsb_6_expand)
);

// &ConnRule(s/^x_num/iu_rtu_pipe2_iid_lsb_6/); @787
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_iu_rtu_pipe2_iid_lsb_6"); @788
ct_rtu_expand_64  x_ct_rtu_expand_64_iu_rtu_pipe2_iid_lsb_6 (
  .x_num                         (iu_rtu_pipe2_iid_lsb_6       ),
  .x_num_expand                  (iu_rtu_pipe2_iid_lsb_6_expand)
);

// &ConnRule(s/^x_num/lsu_rtu_wb_pipe3_iid_lsb_6/); @789
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_lsu_rtu_wb_pipe3_iid_lsb_6"); @790
ct_rtu_expand_64  x_ct_rtu_expand_64_lsu_rtu_wb_pipe3_iid_lsb_6 (
  .x_num                             (lsu_rtu_wb_pipe3_iid_lsb_6       ),
  .x_num_expand                      (lsu_rtu_wb_pipe3_iid_lsb_6_expand)
);

// &ConnRule(s/^x_num/lsu_rtu_wb_pipe4_iid_lsb_6/); @791
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_lsu_rtu_wb_pipe4_iid_lsb_6"); @792
ct_rtu_expand_64  x_ct_rtu_expand_64_lsu_rtu_wb_pipe4_iid_lsb_6 (
  .x_num                             (lsu_rtu_wb_pipe4_iid_lsb_6       ),
  .x_num_expand                      (lsu_rtu_wb_pipe4_iid_lsb_6_expand)
);

// &ConnRule(s/^x_num/vfpu_rtu_pipe6_iid_lsb_6/); @793
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_vfpu_rtu_pipe6_iid_lsb_6"); @794
ct_rtu_expand_64  x_ct_rtu_expand_64_vfpu_rtu_pipe6_iid_lsb_6 (
  .x_num                           (vfpu_rtu_pipe6_iid_lsb_6       ),
  .x_num_expand                    (vfpu_rtu_pipe6_iid_lsb_6_expand)
);

// &ConnRule(s/^x_num/vfpu_rtu_pipe7_iid_lsb_6/); @795
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_vfpu_rtu_pipe7_iid_lsb_6"); @796
ct_rtu_expand_64  x_ct_rtu_expand_64_vfpu_rtu_pipe7_iid_lsb_6 (
  .x_num                           (vfpu_rtu_pipe7_iid_lsb_6       ),
  .x_num_expand                    (vfpu_rtu_pipe7_iid_lsb_6_expand)
);


//cbus_cmplt0_vld[63:0]
assign clt0[63:0] = {64{iu_rtu_pipe0_cmplt}}
                    & iu_rtu_pipe0_iid_lsb_6_expand[63:0];
//cbus_cmplt1_vld[63:0]
assign clt1[63:0] = {64{iu_rtu_pipe1_cmplt}}
                    & iu_rtu_pipe1_iid_lsb_6_expand[63:0];
//cbus_cmplt2_vld[63:0]
assign clt2[63:0] = {64{iu_rtu_pipe2_cmplt}}
                    & iu_rtu_pipe2_iid_lsb_6_expand[63:0];
//cbus_cmplt3_vld[63:0]
assign clt3[63:0] = {64{lsu_rtu_wb_pipe3_cmplt}}
                    & lsu_rtu_wb_pipe3_iid_lsb_6_expand[63:0];
//cbus_cmplt4_vld[63:0]
assign clt4[63:0] = {64{lsu_rtu_wb_pipe4_cmplt}}
                    & lsu_rtu_wb_pipe4_iid_lsb_6_expand[63:0];
//cbus_cmplt5_vld[63:0]
assign clt5[63:0] = {64{vfpu_rtu_pipe6_cmplt}}
                    & vfpu_rtu_pipe6_iid_lsb_6_expand[63:0];
//cbus_cmplt6_vld[63:0]
assign clt6[63:0] = {64{vfpu_rtu_pipe7_cmplt}}
                    & vfpu_rtu_pipe7_iid_lsb_6_expand[63:0];

assign entry0_cmplt_vld[6:0]  = {clt6[0], clt5[0], clt4[0], clt3[0], clt2[0], clt1[0], clt0[0]};
assign entry1_cmplt_vld[6:0]  = {clt6[1], clt5[1], clt4[1], clt3[1], clt2[1], clt1[1], clt0[1]};
assign entry2_cmplt_vld[6:0]  = {clt6[2], clt5[2], clt4[2], clt3[2], clt2[2], clt1[2], clt0[2]};
assign entry3_cmplt_vld[6:0]  = {clt6[3], clt5[3], clt4[3], clt3[3], clt2[3], clt1[3], clt0[3]};
assign entry4_cmplt_vld[6:0]  = {clt6[4], clt5[4], clt4[4], clt3[4], clt2[4], clt1[4], clt0[4]};
assign entry5_cmplt_vld[6:0]  = {clt6[5], clt5[5], clt4[5], clt3[5], clt2[5], clt1[5], clt0[5]};
assign entry6_cmplt_vld[6:0]  = {clt6[6], clt5[6], clt4[6], clt3[6], clt2[6], clt1[6], clt0[6]};
assign entry7_cmplt_vld[6:0]  = {clt6[7], clt5[7], clt4[7], clt3[7], clt2[7], clt1[7], clt0[7]};
assign entry8_cmplt_vld[6:0]  = {clt6[8], clt5[8], clt4[8], clt3[8], clt2[8], clt1[8], clt0[8]};
assign entry9_cmplt_vld[6:0]  = {clt6[9], clt5[9], clt4[9], clt3[9], clt2[9], clt1[9], clt0[9]};
assign entry10_cmplt_vld[6:0] = {clt6[10],clt5[10],clt4[10],clt3[10],clt2[10],clt1[10],clt0[10]};
assign entry11_cmplt_vld[6:0] = {clt6[11],clt5[11],clt4[11],clt3[11],clt2[11],clt1[11],clt0[11]};
assign entry12_cmplt_vld[6:0] = {clt6[12],clt5[12],clt4[12],clt3[12],clt2[12],clt1[12],clt0[12]};
assign entry13_cmplt_vld[6:0] = {clt6[13],clt5[13],clt4[13],clt3[13],clt2[13],clt1[13],clt0[13]};
assign entry14_cmplt_vld[6:0] = {clt6[14],clt5[14],clt4[14],clt3[14],clt2[14],clt1[14],clt0[14]};
assign entry15_cmplt_vld[6:0] = {clt6[15],clt5[15],clt4[15],clt3[15],clt2[15],clt1[15],clt0[15]};
assign entry16_cmplt_vld[6:0] = {clt6[16],clt5[16],clt4[16],clt3[16],clt2[16],clt1[16],clt0[16]};
assign entry17_cmplt_vld[6:0] = {clt6[17],clt5[17],clt4[17],clt3[17],clt2[17],clt1[17],clt0[17]};
assign entry18_cmplt_vld[6:0] = {clt6[18],clt5[18],clt4[18],clt3[18],clt2[18],clt1[18],clt0[18]};
assign entry19_cmplt_vld[6:0] = {clt6[19],clt5[19],clt4[19],clt3[19],clt2[19],clt1[19],clt0[19]};
assign entry20_cmplt_vld[6:0] = {clt6[20],clt5[20],clt4[20],clt3[20],clt2[20],clt1[20],clt0[20]};
assign entry21_cmplt_vld[6:0] = {clt6[21],clt5[21],clt4[21],clt3[21],clt2[21],clt1[21],clt0[21]};
assign entry22_cmplt_vld[6:0] = {clt6[22],clt5[22],clt4[22],clt3[22],clt2[22],clt1[22],clt0[22]};
assign entry23_cmplt_vld[6:0] = {clt6[23],clt5[23],clt4[23],clt3[23],clt2[23],clt1[23],clt0[23]};
assign entry24_cmplt_vld[6:0] = {clt6[24],clt5[24],clt4[24],clt3[24],clt2[24],clt1[24],clt0[24]};
assign entry25_cmplt_vld[6:0] = {clt6[25],clt5[25],clt4[25],clt3[25],clt2[25],clt1[25],clt0[25]};
assign entry26_cmplt_vld[6:0] = {clt6[26],clt5[26],clt4[26],clt3[26],clt2[26],clt1[26],clt0[26]};
assign entry27_cmplt_vld[6:0] = {clt6[27],clt5[27],clt4[27],clt3[27],clt2[27],clt1[27],clt0[27]};
assign entry28_cmplt_vld[6:0] = {clt6[28],clt5[28],clt4[28],clt3[28],clt2[28],clt1[28],clt0[28]};
assign entry29_cmplt_vld[6:0] = {clt6[29],clt5[29],clt4[29],clt3[29],clt2[29],clt1[29],clt0[29]};
assign entry30_cmplt_vld[6:0] = {clt6[30],clt5[30],clt4[30],clt3[30],clt2[30],clt1[30],clt0[30]};
assign entry31_cmplt_vld[6:0] = {clt6[31],clt5[31],clt4[31],clt3[31],clt2[31],clt1[31],clt0[31]};
assign entry32_cmplt_vld[6:0] = {clt6[32],clt5[32],clt4[32],clt3[32],clt2[32],clt1[32],clt0[32]};
assign entry33_cmplt_vld[6:0] = {clt6[33],clt5[33],clt4[33],clt3[33],clt2[33],clt1[33],clt0[33]};
assign entry34_cmplt_vld[6:0] = {clt6[34],clt5[34],clt4[34],clt3[34],clt2[34],clt1[34],clt0[34]};
assign entry35_cmplt_vld[6:0] = {clt6[35],clt5[35],clt4[35],clt3[35],clt2[35],clt1[35],clt0[35]};
assign entry36_cmplt_vld[6:0] = {clt6[36],clt5[36],clt4[36],clt3[36],clt2[36],clt1[36],clt0[36]};
assign entry37_cmplt_vld[6:0] = {clt6[37],clt5[37],clt4[37],clt3[37],clt2[37],clt1[37],clt0[37]};
assign entry38_cmplt_vld[6:0] = {clt6[38],clt5[38],clt4[38],clt3[38],clt2[38],clt1[38],clt0[38]};
assign entry39_cmplt_vld[6:0] = {clt6[39],clt5[39],clt4[39],clt3[39],clt2[39],clt1[39],clt0[39]};
assign entry40_cmplt_vld[6:0] = {clt6[40],clt5[40],clt4[40],clt3[40],clt2[40],clt1[40],clt0[40]};
assign entry41_cmplt_vld[6:0] = {clt6[41],clt5[41],clt4[41],clt3[41],clt2[41],clt1[41],clt0[41]};
assign entry42_cmplt_vld[6:0] = {clt6[42],clt5[42],clt4[42],clt3[42],clt2[42],clt1[42],clt0[42]};
assign entry43_cmplt_vld[6:0] = {clt6[43],clt5[43],clt4[43],clt3[43],clt2[43],clt1[43],clt0[43]};
assign entry44_cmplt_vld[6:0] = {clt6[44],clt5[44],clt4[44],clt3[44],clt2[44],clt1[44],clt0[44]};
assign entry45_cmplt_vld[6:0] = {clt6[45],clt5[45],clt4[45],clt3[45],clt2[45],clt1[45],clt0[45]};
assign entry46_cmplt_vld[6:0] = {clt6[46],clt5[46],clt4[46],clt3[46],clt2[46],clt1[46],clt0[46]};
assign entry47_cmplt_vld[6:0] = {clt6[47],clt5[47],clt4[47],clt3[47],clt2[47],clt1[47],clt0[47]};
assign entry48_cmplt_vld[6:0] = {clt6[48],clt5[48],clt4[48],clt3[48],clt2[48],clt1[48],clt0[48]};
assign entry49_cmplt_vld[6:0] = {clt6[49],clt5[49],clt4[49],clt3[49],clt2[49],clt1[49],clt0[49]};
assign entry50_cmplt_vld[6:0] = {clt6[50],clt5[50],clt4[50],clt3[50],clt2[50],clt1[50],clt0[50]};
assign entry51_cmplt_vld[6:0] = {clt6[51],clt5[51],clt4[51],clt3[51],clt2[51],clt1[51],clt0[51]};
assign entry52_cmplt_vld[6:0] = {clt6[52],clt5[52],clt4[52],clt3[52],clt2[52],clt1[52],clt0[52]};
assign entry53_cmplt_vld[6:0] = {clt6[53],clt5[53],clt4[53],clt3[53],clt2[53],clt1[53],clt0[53]};
assign entry54_cmplt_vld[6:0] = {clt6[54],clt5[54],clt4[54],clt3[54],clt2[54],clt1[54],clt0[54]};
assign entry55_cmplt_vld[6:0] = {clt6[55],clt5[55],clt4[55],clt3[55],clt2[55],clt1[55],clt0[55]};
assign entry56_cmplt_vld[6:0] = {clt6[56],clt5[56],clt4[56],clt3[56],clt2[56],clt1[56],clt0[56]};
assign entry57_cmplt_vld[6:0] = {clt6[57],clt5[57],clt4[57],clt3[57],clt2[57],clt1[57],clt0[57]};
assign entry58_cmplt_vld[6:0] = {clt6[58],clt5[58],clt4[58],clt3[58],clt2[58],clt1[58],clt0[58]};
assign entry59_cmplt_vld[6:0] = {clt6[59],clt5[59],clt4[59],clt3[59],clt2[59],clt1[59],clt0[59]};
assign entry60_cmplt_vld[6:0] = {clt6[60],clt5[60],clt4[60],clt3[60],clt2[60],clt1[60],clt0[60]};
assign entry61_cmplt_vld[6:0] = {clt6[61],clt5[61],clt4[61],clt3[61],clt2[61],clt1[61],clt0[61]};
assign entry62_cmplt_vld[6:0] = {clt6[62],clt5[62],clt4[62],clt3[62],clt2[62],clt1[62],clt0[62]};
assign entry63_cmplt_vld[6:0] = {clt6[63],clt5[63],clt4[63],clt3[63],clt2[63],clt1[63],clt0[63]};

assign entry0_cmplt_gateclk_vld  = |entry0_cmplt_vld[6:0];
assign entry1_cmplt_gateclk_vld  = |entry1_cmplt_vld[6:0];
assign entry2_cmplt_gateclk_vld  = |entry2_cmplt_vld[6:0];
assign entry3_cmplt_gateclk_vld  = |entry3_cmplt_vld[6:0];
assign entry4_cmplt_gateclk_vld  = |entry4_cmplt_vld[6:0];
assign entry5_cmplt_gateclk_vld  = |entry5_cmplt_vld[6:0];
assign entry6_cmplt_gateclk_vld  = |entry6_cmplt_vld[6:0];
assign entry7_cmplt_gateclk_vld  = |entry7_cmplt_vld[6:0];
assign entry8_cmplt_gateclk_vld  = |entry8_cmplt_vld[6:0];
assign entry9_cmplt_gateclk_vld  = |entry9_cmplt_vld[6:0];
assign entry10_cmplt_gateclk_vld = |entry10_cmplt_vld[6:0];
assign entry11_cmplt_gateclk_vld = |entry11_cmplt_vld[6:0];
assign entry12_cmplt_gateclk_vld = |entry12_cmplt_vld[6:0];
assign entry13_cmplt_gateclk_vld = |entry13_cmplt_vld[6:0];
assign entry14_cmplt_gateclk_vld = |entry14_cmplt_vld[6:0];
assign entry15_cmplt_gateclk_vld = |entry15_cmplt_vld[6:0];
assign entry16_cmplt_gateclk_vld = |entry16_cmplt_vld[6:0];
assign entry17_cmplt_gateclk_vld = |entry17_cmplt_vld[6:0];
assign entry18_cmplt_gateclk_vld = |entry18_cmplt_vld[6:0];
assign entry19_cmplt_gateclk_vld = |entry19_cmplt_vld[6:0];
assign entry20_cmplt_gateclk_vld = |entry20_cmplt_vld[6:0];
assign entry21_cmplt_gateclk_vld = |entry21_cmplt_vld[6:0];
assign entry22_cmplt_gateclk_vld = |entry22_cmplt_vld[6:0];
assign entry23_cmplt_gateclk_vld = |entry23_cmplt_vld[6:0];
assign entry24_cmplt_gateclk_vld = |entry24_cmplt_vld[6:0];
assign entry25_cmplt_gateclk_vld = |entry25_cmplt_vld[6:0];
assign entry26_cmplt_gateclk_vld = |entry26_cmplt_vld[6:0];
assign entry27_cmplt_gateclk_vld = |entry27_cmplt_vld[6:0];
assign entry28_cmplt_gateclk_vld = |entry28_cmplt_vld[6:0];
assign entry29_cmplt_gateclk_vld = |entry29_cmplt_vld[6:0];
assign entry30_cmplt_gateclk_vld = |entry30_cmplt_vld[6:0];
assign entry31_cmplt_gateclk_vld = |entry31_cmplt_vld[6:0];
assign entry32_cmplt_gateclk_vld = |entry32_cmplt_vld[6:0];
assign entry33_cmplt_gateclk_vld = |entry33_cmplt_vld[6:0];
assign entry34_cmplt_gateclk_vld = |entry34_cmplt_vld[6:0];
assign entry35_cmplt_gateclk_vld = |entry35_cmplt_vld[6:0];
assign entry36_cmplt_gateclk_vld = |entry36_cmplt_vld[6:0];
assign entry37_cmplt_gateclk_vld = |entry37_cmplt_vld[6:0];
assign entry38_cmplt_gateclk_vld = |entry38_cmplt_vld[6:0];
assign entry39_cmplt_gateclk_vld = |entry39_cmplt_vld[6:0];
assign entry40_cmplt_gateclk_vld = |entry40_cmplt_vld[6:0];
assign entry41_cmplt_gateclk_vld = |entry41_cmplt_vld[6:0];
assign entry42_cmplt_gateclk_vld = |entry42_cmplt_vld[6:0];
assign entry43_cmplt_gateclk_vld = |entry43_cmplt_vld[6:0];
assign entry44_cmplt_gateclk_vld = |entry44_cmplt_vld[6:0];
assign entry45_cmplt_gateclk_vld = |entry45_cmplt_vld[6:0];
assign entry46_cmplt_gateclk_vld = |entry46_cmplt_vld[6:0];
assign entry47_cmplt_gateclk_vld = |entry47_cmplt_vld[6:0];
assign entry48_cmplt_gateclk_vld = |entry48_cmplt_vld[6:0];
assign entry49_cmplt_gateclk_vld = |entry49_cmplt_vld[6:0];
assign entry50_cmplt_gateclk_vld = |entry50_cmplt_vld[6:0];
assign entry51_cmplt_gateclk_vld = |entry51_cmplt_vld[6:0];
assign entry52_cmplt_gateclk_vld = |entry52_cmplt_vld[6:0];
assign entry53_cmplt_gateclk_vld = |entry53_cmplt_vld[6:0];
assign entry54_cmplt_gateclk_vld = |entry54_cmplt_vld[6:0];
assign entry55_cmplt_gateclk_vld = |entry55_cmplt_vld[6:0];
assign entry56_cmplt_gateclk_vld = |entry56_cmplt_vld[6:0];
assign entry57_cmplt_gateclk_vld = |entry57_cmplt_vld[6:0];
assign entry58_cmplt_gateclk_vld = |entry58_cmplt_vld[6:0];
assign entry59_cmplt_gateclk_vld = |entry59_cmplt_vld[6:0];
assign entry60_cmplt_gateclk_vld = |entry60_cmplt_vld[6:0];
assign entry61_cmplt_gateclk_vld = |entry61_cmplt_vld[6:0];
assign entry62_cmplt_gateclk_vld = |entry62_cmplt_vld[6:0];
assign entry63_cmplt_gateclk_vld = |entry63_cmplt_vld[6:0];

//----------------------------------------------------------
//                 lsu cmplt info gateclk en
//----------------------------------------------------------
assign lsu_misc_cmplt_gateclk_en = lsu_rtu_wb_pipe3_cmplt
                                   && (lsu_rtu_wb_pipe3_bkpta_data
                                    || lsu_rtu_wb_pipe3_bkptb_data
                                    || lsu_rtu_wb_pipe3_no_spec_hit
                                    || lsu_rtu_wb_pipe3_no_spec_miss
                                    || lsu_rtu_wb_pipe3_no_spec_mispred)
                                || lsu_rtu_wb_pipe4_cmplt
                                   && (lsu_rtu_wb_pipe4_bkpta_data
                                    || lsu_rtu_wb_pipe4_bkptb_data
                                    || lsu_rtu_wb_pipe4_no_spec_hit
                                    || lsu_rtu_wb_pipe4_no_spec_miss
                                    || lsu_rtu_wb_pipe4_no_spec_mispred);

//==========================================================
//              Read Port for Retire Entry
//==========================================================

//----------------------------------------------------------
//                    5 Read Ports
//----------------------------------------------------------
// &CombBeg; @973
always @( entry46_read_data[39:0]
       or entry34_read_data[39:0]
       or entry5_read_data[39:0]
       or entry11_read_data[39:0]
       or entry28_read_data[39:0]
       or entry27_read_data[39:0]
       or entry37_read_data[39:0]
       or entry3_read_data[39:0]
       or entry51_read_data[39:0]
       or entry40_read_data[39:0]
       or entry39_read_data[39:0]
       or entry23_read_data[39:0]
       or entry13_read_data[39:0]
       or rob_read0_ptr[63:0]
       or entry9_read_data[39:0]
       or entry62_read_data[39:0]
       or entry58_read_data[39:0]
       or entry41_read_data[39:0]
       or entry38_read_data[39:0]
       or entry22_read_data[39:0]
       or entry61_read_data[39:0]
       or entry18_read_data[39:0]
       or entry14_read_data[39:0]
       or entry10_read_data[39:0]
       or entry25_read_data[39:0]
       or entry26_read_data[39:0]
       or entry52_read_data[39:0]
       or entry12_read_data[39:0]
       or entry17_read_data[39:0]
       or entry42_read_data[39:0]
       or entry32_read_data[39:0]
       or entry45_read_data[39:0]
       or entry44_read_data[39:0]
       or entry49_read_data[39:0]
       or entry20_read_data[39:0]
       or entry63_read_data[39:0]
       or entry54_read_data[39:0]
       or entry8_read_data[39:0]
       or entry0_read_data[39:0]
       or entry50_read_data[39:0]
       or entry53_read_data[39:0]
       or entry47_read_data[39:0]
       or entry2_read_data[39:0]
       or entry36_read_data[39:0]
       or entry31_read_data[39:0]
       or entry24_read_data[39:0]
       or entry21_read_data[39:0]
       or entry57_read_data[39:0]
       or entry35_read_data[39:0]
       or entry56_read_data[39:0]
       or entry43_read_data[39:0]
       or entry33_read_data[39:0]
       or entry7_read_data[39:0]
       or entry30_read_data[39:0]
       or entry29_read_data[39:0]
       or entry60_read_data[39:0]
       or entry1_read_data[39:0]
       or entry55_read_data[39:0]
       or entry19_read_data[39:0]
       or entry4_read_data[39:0]
       or entry15_read_data[39:0]
       or entry59_read_data[39:0]
       or entry48_read_data[39:0]
       or entry6_read_data[39:0]
       or entry16_read_data[39:0])
begin
  case (rob_read0_ptr[63:0])
    64'h0000_0000_0000_0001: rob_read0_entry_data[ROB_WIDTH-1:0] = entry0_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0002: rob_read0_entry_data[ROB_WIDTH-1:0] = entry1_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0004: rob_read0_entry_data[ROB_WIDTH-1:0] = entry2_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0008: rob_read0_entry_data[ROB_WIDTH-1:0] = entry3_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0010: rob_read0_entry_data[ROB_WIDTH-1:0] = entry4_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0020: rob_read0_entry_data[ROB_WIDTH-1:0] = entry5_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0040: rob_read0_entry_data[ROB_WIDTH-1:0] = entry6_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0080: rob_read0_entry_data[ROB_WIDTH-1:0] = entry7_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0100: rob_read0_entry_data[ROB_WIDTH-1:0] = entry8_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0200: rob_read0_entry_data[ROB_WIDTH-1:0] = entry9_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0400: rob_read0_entry_data[ROB_WIDTH-1:0] = entry10_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0800: rob_read0_entry_data[ROB_WIDTH-1:0] = entry11_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_1000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry12_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_2000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry13_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_4000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry14_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_8000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry15_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0001_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry16_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0002_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry17_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0004_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry18_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0008_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry19_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0010_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry20_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0020_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry21_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0040_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry22_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0080_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry23_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0100_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry24_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0200_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry25_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0400_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry26_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0800_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry27_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_1000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry28_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_2000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry29_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_4000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry30_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_8000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry31_read_data[ROB_WIDTH-1:0];
    64'h0000_0001_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry32_read_data[ROB_WIDTH-1:0];
    64'h0000_0002_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry33_read_data[ROB_WIDTH-1:0];
    64'h0000_0004_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry34_read_data[ROB_WIDTH-1:0];
    64'h0000_0008_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry35_read_data[ROB_WIDTH-1:0];
    64'h0000_0010_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry36_read_data[ROB_WIDTH-1:0];
    64'h0000_0020_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry37_read_data[ROB_WIDTH-1:0];
    64'h0000_0040_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry38_read_data[ROB_WIDTH-1:0];
    64'h0000_0080_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry39_read_data[ROB_WIDTH-1:0];
    64'h0000_0100_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry40_read_data[ROB_WIDTH-1:0];
    64'h0000_0200_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry41_read_data[ROB_WIDTH-1:0];
    64'h0000_0400_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry42_read_data[ROB_WIDTH-1:0];
    64'h0000_0800_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry43_read_data[ROB_WIDTH-1:0];
    64'h0000_1000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry44_read_data[ROB_WIDTH-1:0];
    64'h0000_2000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry45_read_data[ROB_WIDTH-1:0];
    64'h0000_4000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry46_read_data[ROB_WIDTH-1:0];
    64'h0000_8000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry47_read_data[ROB_WIDTH-1:0];
    64'h0001_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry48_read_data[ROB_WIDTH-1:0];
    64'h0002_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry49_read_data[ROB_WIDTH-1:0];
    64'h0004_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry50_read_data[ROB_WIDTH-1:0];
    64'h0008_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry51_read_data[ROB_WIDTH-1:0];
    64'h0010_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry52_read_data[ROB_WIDTH-1:0];
    64'h0020_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry53_read_data[ROB_WIDTH-1:0];
    64'h0040_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry54_read_data[ROB_WIDTH-1:0];
    64'h0080_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry55_read_data[ROB_WIDTH-1:0];
    64'h0100_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry56_read_data[ROB_WIDTH-1:0];
    64'h0200_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry57_read_data[ROB_WIDTH-1:0];
    64'h0400_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry58_read_data[ROB_WIDTH-1:0];
    64'h0800_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry59_read_data[ROB_WIDTH-1:0];
    64'h1000_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry60_read_data[ROB_WIDTH-1:0];
    64'h2000_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry61_read_data[ROB_WIDTH-1:0];
    64'h4000_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry62_read_data[ROB_WIDTH-1:0];
    64'h8000_0000_0000_0000: rob_read0_entry_data[ROB_WIDTH-1:0] = entry63_read_data[ROB_WIDTH-1:0];
    default:                 rob_read0_entry_data[ROB_WIDTH-1:0] = {ROB_WIDTH{1'bx}};
  endcase
// &CombEnd; @1041
end

// &CombBeg; @1043
always @( entry46_read_data[39:0]
       or entry34_read_data[39:0]
       or entry11_read_data[39:0]
       or entry5_read_data[39:0]
       or entry28_read_data[39:0]
       or entry37_read_data[39:0]
       or entry27_read_data[39:0]
       or entry3_read_data[39:0]
       or entry51_read_data[39:0]
       or entry40_read_data[39:0]
       or entry39_read_data[39:0]
       or entry23_read_data[39:0]
       or entry13_read_data[39:0]
       or entry9_read_data[39:0]
       or entry62_read_data[39:0]
       or entry58_read_data[39:0]
       or entry41_read_data[39:0]
       or entry38_read_data[39:0]
       or entry22_read_data[39:0]
       or rob_read1_ptr[63:0]
       or entry61_read_data[39:0]
       or entry18_read_data[39:0]
       or entry14_read_data[39:0]
       or entry10_read_data[39:0]
       or entry25_read_data[39:0]
       or entry26_read_data[39:0]
       or entry52_read_data[39:0]
       or entry12_read_data[39:0]
       or entry17_read_data[39:0]
       or entry42_read_data[39:0]
       or entry32_read_data[39:0]
       or entry45_read_data[39:0]
       or entry44_read_data[39:0]
       or entry49_read_data[39:0]
       or entry20_read_data[39:0]
       or entry63_read_data[39:0]
       or entry54_read_data[39:0]
       or entry0_read_data[39:0]
       or entry8_read_data[39:0]
       or entry50_read_data[39:0]
       or entry53_read_data[39:0]
       or entry47_read_data[39:0]
       or entry2_read_data[39:0]
       or entry36_read_data[39:0]
       or entry31_read_data[39:0]
       or entry24_read_data[39:0]
       or entry21_read_data[39:0]
       or entry35_read_data[39:0]
       or entry57_read_data[39:0]
       or entry56_read_data[39:0]
       or entry43_read_data[39:0]
       or entry33_read_data[39:0]
       or entry30_read_data[39:0]
       or entry7_read_data[39:0]
       or entry29_read_data[39:0]
       or entry60_read_data[39:0]
       or entry1_read_data[39:0]
       or entry19_read_data[39:0]
       or entry55_read_data[39:0]
       or entry4_read_data[39:0]
       or entry15_read_data[39:0]
       or entry59_read_data[39:0]
       or entry48_read_data[39:0]
       or entry6_read_data[39:0]
       or entry16_read_data[39:0])
begin
  case (rob_read1_ptr[63:0])
    64'h0000_0000_0000_0001: rob_read1_entry_data[ROB_WIDTH-1:0] = entry0_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0002: rob_read1_entry_data[ROB_WIDTH-1:0] = entry1_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0004: rob_read1_entry_data[ROB_WIDTH-1:0] = entry2_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0008: rob_read1_entry_data[ROB_WIDTH-1:0] = entry3_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0010: rob_read1_entry_data[ROB_WIDTH-1:0] = entry4_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0020: rob_read1_entry_data[ROB_WIDTH-1:0] = entry5_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0040: rob_read1_entry_data[ROB_WIDTH-1:0] = entry6_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0080: rob_read1_entry_data[ROB_WIDTH-1:0] = entry7_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0100: rob_read1_entry_data[ROB_WIDTH-1:0] = entry8_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0200: rob_read1_entry_data[ROB_WIDTH-1:0] = entry9_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0400: rob_read1_entry_data[ROB_WIDTH-1:0] = entry10_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0800: rob_read1_entry_data[ROB_WIDTH-1:0] = entry11_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_1000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry12_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_2000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry13_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_4000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry14_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_8000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry15_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0001_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry16_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0002_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry17_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0004_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry18_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0008_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry19_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0010_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry20_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0020_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry21_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0040_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry22_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0080_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry23_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0100_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry24_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0200_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry25_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0400_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry26_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0800_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry27_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_1000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry28_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_2000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry29_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_4000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry30_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_8000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry31_read_data[ROB_WIDTH-1:0];
    64'h0000_0001_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry32_read_data[ROB_WIDTH-1:0];
    64'h0000_0002_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry33_read_data[ROB_WIDTH-1:0];
    64'h0000_0004_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry34_read_data[ROB_WIDTH-1:0];
    64'h0000_0008_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry35_read_data[ROB_WIDTH-1:0];
    64'h0000_0010_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry36_read_data[ROB_WIDTH-1:0];
    64'h0000_0020_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry37_read_data[ROB_WIDTH-1:0];
    64'h0000_0040_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry38_read_data[ROB_WIDTH-1:0];
    64'h0000_0080_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry39_read_data[ROB_WIDTH-1:0];
    64'h0000_0100_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry40_read_data[ROB_WIDTH-1:0];
    64'h0000_0200_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry41_read_data[ROB_WIDTH-1:0];
    64'h0000_0400_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry42_read_data[ROB_WIDTH-1:0];
    64'h0000_0800_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry43_read_data[ROB_WIDTH-1:0];
    64'h0000_1000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry44_read_data[ROB_WIDTH-1:0];
    64'h0000_2000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry45_read_data[ROB_WIDTH-1:0];
    64'h0000_4000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry46_read_data[ROB_WIDTH-1:0];
    64'h0000_8000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry47_read_data[ROB_WIDTH-1:0];
    64'h0001_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry48_read_data[ROB_WIDTH-1:0];
    64'h0002_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry49_read_data[ROB_WIDTH-1:0];
    64'h0004_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry50_read_data[ROB_WIDTH-1:0];
    64'h0008_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry51_read_data[ROB_WIDTH-1:0];
    64'h0010_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry52_read_data[ROB_WIDTH-1:0];
    64'h0020_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry53_read_data[ROB_WIDTH-1:0];
    64'h0040_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry54_read_data[ROB_WIDTH-1:0];
    64'h0080_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry55_read_data[ROB_WIDTH-1:0];
    64'h0100_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry56_read_data[ROB_WIDTH-1:0];
    64'h0200_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry57_read_data[ROB_WIDTH-1:0];
    64'h0400_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry58_read_data[ROB_WIDTH-1:0];
    64'h0800_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry59_read_data[ROB_WIDTH-1:0];
    64'h1000_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry60_read_data[ROB_WIDTH-1:0];
    64'h2000_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry61_read_data[ROB_WIDTH-1:0];
    64'h4000_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry62_read_data[ROB_WIDTH-1:0];
    64'h8000_0000_0000_0000: rob_read1_entry_data[ROB_WIDTH-1:0] = entry63_read_data[ROB_WIDTH-1:0];
    default:                 rob_read1_entry_data[ROB_WIDTH-1:0] = {ROB_WIDTH{1'bx}};
  endcase
// &CombEnd; @1111
end

// &CombBeg; @1113
always @( entry46_read_data[39:0]
       or entry34_read_data[39:0]
       or entry11_read_data[39:0]
       or entry5_read_data[39:0]
       or entry28_read_data[39:0]
       or entry37_read_data[39:0]
       or entry27_read_data[39:0]
       or entry3_read_data[39:0]
       or entry51_read_data[39:0]
       or entry40_read_data[39:0]
       or entry39_read_data[39:0]
       or entry23_read_data[39:0]
       or entry13_read_data[39:0]
       or entry9_read_data[39:0]
       or entry62_read_data[39:0]
       or entry58_read_data[39:0]
       or entry41_read_data[39:0]
       or entry38_read_data[39:0]
       or entry22_read_data[39:0]
       or entry61_read_data[39:0]
       or entry18_read_data[39:0]
       or entry14_read_data[39:0]
       or entry10_read_data[39:0]
       or entry25_read_data[39:0]
       or entry26_read_data[39:0]
       or entry52_read_data[39:0]
       or rob_read2_ptr[63:0]
       or entry12_read_data[39:0]
       or entry17_read_data[39:0]
       or entry42_read_data[39:0]
       or entry32_read_data[39:0]
       or entry45_read_data[39:0]
       or entry44_read_data[39:0]
       or entry49_read_data[39:0]
       or entry20_read_data[39:0]
       or entry63_read_data[39:0]
       or entry54_read_data[39:0]
       or entry0_read_data[39:0]
       or entry8_read_data[39:0]
       or entry50_read_data[39:0]
       or entry53_read_data[39:0]
       or entry47_read_data[39:0]
       or entry2_read_data[39:0]
       or entry36_read_data[39:0]
       or entry31_read_data[39:0]
       or entry24_read_data[39:0]
       or entry21_read_data[39:0]
       or entry35_read_data[39:0]
       or entry57_read_data[39:0]
       or entry56_read_data[39:0]
       or entry43_read_data[39:0]
       or entry33_read_data[39:0]
       or entry30_read_data[39:0]
       or entry7_read_data[39:0]
       or entry29_read_data[39:0]
       or entry60_read_data[39:0]
       or entry1_read_data[39:0]
       or entry19_read_data[39:0]
       or entry55_read_data[39:0]
       or entry4_read_data[39:0]
       or entry15_read_data[39:0]
       or entry59_read_data[39:0]
       or entry48_read_data[39:0]
       or entry6_read_data[39:0]
       or entry16_read_data[39:0])
begin
  case (rob_read2_ptr[63:0])
    64'h0000_0000_0000_0001: rob_read2_entry_data[ROB_WIDTH-1:0] = entry0_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0002: rob_read2_entry_data[ROB_WIDTH-1:0] = entry1_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0004: rob_read2_entry_data[ROB_WIDTH-1:0] = entry2_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0008: rob_read2_entry_data[ROB_WIDTH-1:0] = entry3_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0010: rob_read2_entry_data[ROB_WIDTH-1:0] = entry4_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0020: rob_read2_entry_data[ROB_WIDTH-1:0] = entry5_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0040: rob_read2_entry_data[ROB_WIDTH-1:0] = entry6_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0080: rob_read2_entry_data[ROB_WIDTH-1:0] = entry7_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0100: rob_read2_entry_data[ROB_WIDTH-1:0] = entry8_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0200: rob_read2_entry_data[ROB_WIDTH-1:0] = entry9_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0400: rob_read2_entry_data[ROB_WIDTH-1:0] = entry10_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0800: rob_read2_entry_data[ROB_WIDTH-1:0] = entry11_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_1000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry12_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_2000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry13_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_4000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry14_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_8000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry15_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0001_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry16_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0002_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry17_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0004_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry18_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0008_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry19_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0010_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry20_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0020_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry21_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0040_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry22_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0080_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry23_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0100_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry24_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0200_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry25_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0400_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry26_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0800_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry27_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_1000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry28_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_2000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry29_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_4000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry30_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_8000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry31_read_data[ROB_WIDTH-1:0];
    64'h0000_0001_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry32_read_data[ROB_WIDTH-1:0];
    64'h0000_0002_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry33_read_data[ROB_WIDTH-1:0];
    64'h0000_0004_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry34_read_data[ROB_WIDTH-1:0];
    64'h0000_0008_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry35_read_data[ROB_WIDTH-1:0];
    64'h0000_0010_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry36_read_data[ROB_WIDTH-1:0];
    64'h0000_0020_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry37_read_data[ROB_WIDTH-1:0];
    64'h0000_0040_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry38_read_data[ROB_WIDTH-1:0];
    64'h0000_0080_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry39_read_data[ROB_WIDTH-1:0];
    64'h0000_0100_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry40_read_data[ROB_WIDTH-1:0];
    64'h0000_0200_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry41_read_data[ROB_WIDTH-1:0];
    64'h0000_0400_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry42_read_data[ROB_WIDTH-1:0];
    64'h0000_0800_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry43_read_data[ROB_WIDTH-1:0];
    64'h0000_1000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry44_read_data[ROB_WIDTH-1:0];
    64'h0000_2000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry45_read_data[ROB_WIDTH-1:0];
    64'h0000_4000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry46_read_data[ROB_WIDTH-1:0];
    64'h0000_8000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry47_read_data[ROB_WIDTH-1:0];
    64'h0001_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry48_read_data[ROB_WIDTH-1:0];
    64'h0002_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry49_read_data[ROB_WIDTH-1:0];
    64'h0004_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry50_read_data[ROB_WIDTH-1:0];
    64'h0008_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry51_read_data[ROB_WIDTH-1:0];
    64'h0010_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry52_read_data[ROB_WIDTH-1:0];
    64'h0020_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry53_read_data[ROB_WIDTH-1:0];
    64'h0040_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry54_read_data[ROB_WIDTH-1:0];
    64'h0080_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry55_read_data[ROB_WIDTH-1:0];
    64'h0100_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry56_read_data[ROB_WIDTH-1:0];
    64'h0200_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry57_read_data[ROB_WIDTH-1:0];
    64'h0400_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry58_read_data[ROB_WIDTH-1:0];
    64'h0800_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry59_read_data[ROB_WIDTH-1:0];
    64'h1000_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry60_read_data[ROB_WIDTH-1:0];
    64'h2000_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry61_read_data[ROB_WIDTH-1:0];
    64'h4000_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry62_read_data[ROB_WIDTH-1:0];
    64'h8000_0000_0000_0000: rob_read2_entry_data[ROB_WIDTH-1:0] = entry63_read_data[ROB_WIDTH-1:0];
    default:                 rob_read2_entry_data[ROB_WIDTH-1:0] = {ROB_WIDTH{1'bx}};
  endcase
// &CombEnd; @1181
end

// &CombBeg; @1183
always @( entry46_read_data[39:0]
       or entry34_read_data[39:0]
       or entry11_read_data[39:0]
       or entry5_read_data[39:0]
       or entry28_read_data[39:0]
       or entry37_read_data[39:0]
       or entry27_read_data[39:0]
       or entry3_read_data[39:0]
       or entry51_read_data[39:0]
       or entry40_read_data[39:0]
       or entry39_read_data[39:0]
       or entry23_read_data[39:0]
       or entry13_read_data[39:0]
       or entry9_read_data[39:0]
       or entry62_read_data[39:0]
       or entry58_read_data[39:0]
       or entry41_read_data[39:0]
       or entry38_read_data[39:0]
       or entry22_read_data[39:0]
       or entry61_read_data[39:0]
       or entry18_read_data[39:0]
       or entry14_read_data[39:0]
       or entry10_read_data[39:0]
       or entry25_read_data[39:0]
       or entry26_read_data[39:0]
       or entry52_read_data[39:0]
       or entry12_read_data[39:0]
       or entry17_read_data[39:0]
       or entry42_read_data[39:0]
       or entry32_read_data[39:0]
       or entry45_read_data[39:0]
       or entry44_read_data[39:0]
       or entry49_read_data[39:0]
       or entry20_read_data[39:0]
       or entry63_read_data[39:0]
       or entry54_read_data[39:0]
       or entry0_read_data[39:0]
       or entry8_read_data[39:0]
       or entry50_read_data[39:0]
       or entry53_read_data[39:0]
       or entry47_read_data[39:0]
       or entry2_read_data[39:0]
       or entry36_read_data[39:0]
       or entry31_read_data[39:0]
       or rob_read3_ptr[63:0]
       or entry24_read_data[39:0]
       or entry21_read_data[39:0]
       or entry35_read_data[39:0]
       or entry57_read_data[39:0]
       or entry56_read_data[39:0]
       or entry43_read_data[39:0]
       or entry33_read_data[39:0]
       or entry30_read_data[39:0]
       or entry7_read_data[39:0]
       or entry29_read_data[39:0]
       or entry60_read_data[39:0]
       or entry1_read_data[39:0]
       or entry19_read_data[39:0]
       or entry55_read_data[39:0]
       or entry4_read_data[39:0]
       or entry15_read_data[39:0]
       or entry59_read_data[39:0]
       or entry48_read_data[39:0]
       or entry6_read_data[39:0]
       or entry16_read_data[39:0])
begin
  case (rob_read3_ptr[63:0])
    64'h0000_0000_0000_0001: rob_read3_entry_data[ROB_WIDTH-1:0] = entry0_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0002: rob_read3_entry_data[ROB_WIDTH-1:0] = entry1_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0004: rob_read3_entry_data[ROB_WIDTH-1:0] = entry2_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0008: rob_read3_entry_data[ROB_WIDTH-1:0] = entry3_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0010: rob_read3_entry_data[ROB_WIDTH-1:0] = entry4_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0020: rob_read3_entry_data[ROB_WIDTH-1:0] = entry5_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0040: rob_read3_entry_data[ROB_WIDTH-1:0] = entry6_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0080: rob_read3_entry_data[ROB_WIDTH-1:0] = entry7_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0100: rob_read3_entry_data[ROB_WIDTH-1:0] = entry8_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0200: rob_read3_entry_data[ROB_WIDTH-1:0] = entry9_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0400: rob_read3_entry_data[ROB_WIDTH-1:0] = entry10_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0800: rob_read3_entry_data[ROB_WIDTH-1:0] = entry11_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_1000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry12_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_2000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry13_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_4000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry14_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_8000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry15_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0001_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry16_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0002_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry17_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0004_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry18_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0008_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry19_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0010_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry20_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0020_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry21_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0040_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry22_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0080_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry23_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0100_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry24_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0200_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry25_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0400_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry26_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0800_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry27_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_1000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry28_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_2000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry29_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_4000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry30_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_8000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry31_read_data[ROB_WIDTH-1:0];
    64'h0000_0001_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry32_read_data[ROB_WIDTH-1:0];
    64'h0000_0002_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry33_read_data[ROB_WIDTH-1:0];
    64'h0000_0004_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry34_read_data[ROB_WIDTH-1:0];
    64'h0000_0008_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry35_read_data[ROB_WIDTH-1:0];
    64'h0000_0010_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry36_read_data[ROB_WIDTH-1:0];
    64'h0000_0020_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry37_read_data[ROB_WIDTH-1:0];
    64'h0000_0040_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry38_read_data[ROB_WIDTH-1:0];
    64'h0000_0080_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry39_read_data[ROB_WIDTH-1:0];
    64'h0000_0100_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry40_read_data[ROB_WIDTH-1:0];
    64'h0000_0200_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry41_read_data[ROB_WIDTH-1:0];
    64'h0000_0400_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry42_read_data[ROB_WIDTH-1:0];
    64'h0000_0800_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry43_read_data[ROB_WIDTH-1:0];
    64'h0000_1000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry44_read_data[ROB_WIDTH-1:0];
    64'h0000_2000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry45_read_data[ROB_WIDTH-1:0];
    64'h0000_4000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry46_read_data[ROB_WIDTH-1:0];
    64'h0000_8000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry47_read_data[ROB_WIDTH-1:0];
    64'h0001_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry48_read_data[ROB_WIDTH-1:0];
    64'h0002_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry49_read_data[ROB_WIDTH-1:0];
    64'h0004_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry50_read_data[ROB_WIDTH-1:0];
    64'h0008_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry51_read_data[ROB_WIDTH-1:0];
    64'h0010_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry52_read_data[ROB_WIDTH-1:0];
    64'h0020_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry53_read_data[ROB_WIDTH-1:0];
    64'h0040_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry54_read_data[ROB_WIDTH-1:0];
    64'h0080_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry55_read_data[ROB_WIDTH-1:0];
    64'h0100_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry56_read_data[ROB_WIDTH-1:0];
    64'h0200_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry57_read_data[ROB_WIDTH-1:0];
    64'h0400_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry58_read_data[ROB_WIDTH-1:0];
    64'h0800_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry59_read_data[ROB_WIDTH-1:0];
    64'h1000_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry60_read_data[ROB_WIDTH-1:0];
    64'h2000_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry61_read_data[ROB_WIDTH-1:0];
    64'h4000_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry62_read_data[ROB_WIDTH-1:0];
    64'h8000_0000_0000_0000: rob_read3_entry_data[ROB_WIDTH-1:0] = entry63_read_data[ROB_WIDTH-1:0];
    default:                 rob_read3_entry_data[ROB_WIDTH-1:0] = {ROB_WIDTH{1'bx}};
  endcase
// &CombEnd; @1251
end

// &CombBeg; @1253
always @( entry46_read_data[39:0]
       or entry34_read_data[39:0]
       or entry11_read_data[39:0]
       or entry5_read_data[39:0]
       or entry28_read_data[39:0]
       or entry37_read_data[39:0]
       or entry27_read_data[39:0]
       or entry3_read_data[39:0]
       or entry51_read_data[39:0]
       or entry40_read_data[39:0]
       or entry39_read_data[39:0]
       or entry23_read_data[39:0]
       or entry13_read_data[39:0]
       or entry9_read_data[39:0]
       or entry62_read_data[39:0]
       or entry58_read_data[39:0]
       or entry41_read_data[39:0]
       or entry38_read_data[39:0]
       or entry22_read_data[39:0]
       or entry61_read_data[39:0]
       or entry18_read_data[39:0]
       or entry14_read_data[39:0]
       or entry10_read_data[39:0]
       or entry25_read_data[39:0]
       or entry26_read_data[39:0]
       or entry52_read_data[39:0]
       or entry12_read_data[39:0]
       or entry17_read_data[39:0]
       or entry42_read_data[39:0]
       or entry32_read_data[39:0]
       or entry45_read_data[39:0]
       or entry44_read_data[39:0]
       or entry49_read_data[39:0]
       or entry20_read_data[39:0]
       or entry63_read_data[39:0]
       or entry54_read_data[39:0]
       or entry0_read_data[39:0]
       or entry8_read_data[39:0]
       or entry50_read_data[39:0]
       or entry53_read_data[39:0]
       or entry47_read_data[39:0]
       or entry2_read_data[39:0]
       or entry36_read_data[39:0]
       or entry31_read_data[39:0]
       or entry24_read_data[39:0]
       or entry21_read_data[39:0]
       or entry35_read_data[39:0]
       or entry57_read_data[39:0]
       or entry56_read_data[39:0]
       or entry43_read_data[39:0]
       or entry33_read_data[39:0]
       or entry30_read_data[39:0]
       or entry7_read_data[39:0]
       or entry29_read_data[39:0]
       or entry60_read_data[39:0]
       or entry1_read_data[39:0]
       or entry19_read_data[39:0]
       or entry55_read_data[39:0]
       or entry4_read_data[39:0]
       or entry15_read_data[39:0]
       or entry59_read_data[39:0]
       or rob_read4_ptr[63:0]
       or entry48_read_data[39:0]
       or entry6_read_data[39:0]
       or entry16_read_data[39:0])
begin
  case (rob_read4_ptr[63:0])
    64'h0000_0000_0000_0001: rob_read4_entry_data[ROB_WIDTH-1:0] = entry0_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0002: rob_read4_entry_data[ROB_WIDTH-1:0] = entry1_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0004: rob_read4_entry_data[ROB_WIDTH-1:0] = entry2_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0008: rob_read4_entry_data[ROB_WIDTH-1:0] = entry3_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0010: rob_read4_entry_data[ROB_WIDTH-1:0] = entry4_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0020: rob_read4_entry_data[ROB_WIDTH-1:0] = entry5_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0040: rob_read4_entry_data[ROB_WIDTH-1:0] = entry6_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0080: rob_read4_entry_data[ROB_WIDTH-1:0] = entry7_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0100: rob_read4_entry_data[ROB_WIDTH-1:0] = entry8_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0200: rob_read4_entry_data[ROB_WIDTH-1:0] = entry9_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0400: rob_read4_entry_data[ROB_WIDTH-1:0] = entry10_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0800: rob_read4_entry_data[ROB_WIDTH-1:0] = entry11_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_1000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry12_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_2000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry13_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_4000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry14_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_8000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry15_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0001_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry16_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0002_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry17_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0004_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry18_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0008_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry19_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0010_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry20_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0020_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry21_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0040_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry22_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0080_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry23_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0100_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry24_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0200_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry25_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0400_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry26_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0800_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry27_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_1000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry28_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_2000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry29_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_4000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry30_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_8000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry31_read_data[ROB_WIDTH-1:0];
    64'h0000_0001_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry32_read_data[ROB_WIDTH-1:0];
    64'h0000_0002_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry33_read_data[ROB_WIDTH-1:0];
    64'h0000_0004_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry34_read_data[ROB_WIDTH-1:0];
    64'h0000_0008_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry35_read_data[ROB_WIDTH-1:0];
    64'h0000_0010_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry36_read_data[ROB_WIDTH-1:0];
    64'h0000_0020_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry37_read_data[ROB_WIDTH-1:0];
    64'h0000_0040_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry38_read_data[ROB_WIDTH-1:0];
    64'h0000_0080_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry39_read_data[ROB_WIDTH-1:0];
    64'h0000_0100_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry40_read_data[ROB_WIDTH-1:0];
    64'h0000_0200_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry41_read_data[ROB_WIDTH-1:0];
    64'h0000_0400_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry42_read_data[ROB_WIDTH-1:0];
    64'h0000_0800_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry43_read_data[ROB_WIDTH-1:0];
    64'h0000_1000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry44_read_data[ROB_WIDTH-1:0];
    64'h0000_2000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry45_read_data[ROB_WIDTH-1:0];
    64'h0000_4000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry46_read_data[ROB_WIDTH-1:0];
    64'h0000_8000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry47_read_data[ROB_WIDTH-1:0];
    64'h0001_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry48_read_data[ROB_WIDTH-1:0];
    64'h0002_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry49_read_data[ROB_WIDTH-1:0];
    64'h0004_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry50_read_data[ROB_WIDTH-1:0];
    64'h0008_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry51_read_data[ROB_WIDTH-1:0];
    64'h0010_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry52_read_data[ROB_WIDTH-1:0];
    64'h0020_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry53_read_data[ROB_WIDTH-1:0];
    64'h0040_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry54_read_data[ROB_WIDTH-1:0];
    64'h0080_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry55_read_data[ROB_WIDTH-1:0];
    64'h0100_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry56_read_data[ROB_WIDTH-1:0];
    64'h0200_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry57_read_data[ROB_WIDTH-1:0];
    64'h0400_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry58_read_data[ROB_WIDTH-1:0];
    64'h0800_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry59_read_data[ROB_WIDTH-1:0];
    64'h1000_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry60_read_data[ROB_WIDTH-1:0];
    64'h2000_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry61_read_data[ROB_WIDTH-1:0];
    64'h4000_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry62_read_data[ROB_WIDTH-1:0];
    64'h8000_0000_0000_0000: rob_read4_entry_data[ROB_WIDTH-1:0] = entry63_read_data[ROB_WIDTH-1:0];
    default:                 rob_read4_entry_data[ROB_WIDTH-1:0] = {ROB_WIDTH{1'bx}};
  endcase
// &CombEnd; @1321
end

// &CombBeg; @1323
always @( entry46_read_data[39:0]
       or entry34_read_data[39:0]
       or rob_read5_ptr[63:0]
       or entry11_read_data[39:0]
       or entry5_read_data[39:0]
       or entry28_read_data[39:0]
       or entry37_read_data[39:0]
       or entry27_read_data[39:0]
       or entry3_read_data[39:0]
       or entry51_read_data[39:0]
       or entry40_read_data[39:0]
       or entry39_read_data[39:0]
       or entry23_read_data[39:0]
       or entry13_read_data[39:0]
       or entry9_read_data[39:0]
       or entry62_read_data[39:0]
       or entry58_read_data[39:0]
       or entry41_read_data[39:0]
       or entry38_read_data[39:0]
       or entry22_read_data[39:0]
       or entry61_read_data[39:0]
       or entry18_read_data[39:0]
       or entry14_read_data[39:0]
       or entry10_read_data[39:0]
       or entry25_read_data[39:0]
       or entry26_read_data[39:0]
       or entry52_read_data[39:0]
       or entry12_read_data[39:0]
       or entry17_read_data[39:0]
       or entry42_read_data[39:0]
       or entry32_read_data[39:0]
       or entry45_read_data[39:0]
       or entry44_read_data[39:0]
       or entry49_read_data[39:0]
       or entry20_read_data[39:0]
       or entry63_read_data[39:0]
       or entry54_read_data[39:0]
       or entry0_read_data[39:0]
       or entry8_read_data[39:0]
       or entry50_read_data[39:0]
       or entry53_read_data[39:0]
       or entry47_read_data[39:0]
       or entry2_read_data[39:0]
       or entry36_read_data[39:0]
       or entry31_read_data[39:0]
       or entry24_read_data[39:0]
       or entry21_read_data[39:0]
       or entry35_read_data[39:0]
       or entry57_read_data[39:0]
       or entry56_read_data[39:0]
       or entry43_read_data[39:0]
       or entry33_read_data[39:0]
       or entry30_read_data[39:0]
       or entry7_read_data[39:0]
       or entry29_read_data[39:0]
       or entry60_read_data[39:0]
       or entry1_read_data[39:0]
       or entry19_read_data[39:0]
       or entry55_read_data[39:0]
       or entry4_read_data[39:0]
       or entry15_read_data[39:0]
       or entry59_read_data[39:0]
       or entry48_read_data[39:0]
       or entry6_read_data[39:0]
       or entry16_read_data[39:0])
begin
  case (rob_read5_ptr[63:0])
    64'h0000_0000_0000_0001: rob_read5_entry_data[ROB_WIDTH-1:0] = entry0_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0002: rob_read5_entry_data[ROB_WIDTH-1:0] = entry1_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0004: rob_read5_entry_data[ROB_WIDTH-1:0] = entry2_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0008: rob_read5_entry_data[ROB_WIDTH-1:0] = entry3_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0010: rob_read5_entry_data[ROB_WIDTH-1:0] = entry4_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0020: rob_read5_entry_data[ROB_WIDTH-1:0] = entry5_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0040: rob_read5_entry_data[ROB_WIDTH-1:0] = entry6_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0080: rob_read5_entry_data[ROB_WIDTH-1:0] = entry7_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0100: rob_read5_entry_data[ROB_WIDTH-1:0] = entry8_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0200: rob_read5_entry_data[ROB_WIDTH-1:0] = entry9_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0400: rob_read5_entry_data[ROB_WIDTH-1:0] = entry10_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_0800: rob_read5_entry_data[ROB_WIDTH-1:0] = entry11_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_1000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry12_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_2000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry13_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_4000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry14_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0000_8000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry15_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0001_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry16_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0002_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry17_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0004_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry18_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0008_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry19_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0010_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry20_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0020_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry21_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0040_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry22_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0080_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry23_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0100_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry24_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0200_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry25_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0400_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry26_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_0800_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry27_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_1000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry28_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_2000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry29_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_4000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry30_read_data[ROB_WIDTH-1:0];
    64'h0000_0000_8000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry31_read_data[ROB_WIDTH-1:0];
    64'h0000_0001_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry32_read_data[ROB_WIDTH-1:0];
    64'h0000_0002_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry33_read_data[ROB_WIDTH-1:0];
    64'h0000_0004_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry34_read_data[ROB_WIDTH-1:0];
    64'h0000_0008_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry35_read_data[ROB_WIDTH-1:0];
    64'h0000_0010_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry36_read_data[ROB_WIDTH-1:0];
    64'h0000_0020_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry37_read_data[ROB_WIDTH-1:0];
    64'h0000_0040_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry38_read_data[ROB_WIDTH-1:0];
    64'h0000_0080_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry39_read_data[ROB_WIDTH-1:0];
    64'h0000_0100_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry40_read_data[ROB_WIDTH-1:0];
    64'h0000_0200_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry41_read_data[ROB_WIDTH-1:0];
    64'h0000_0400_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry42_read_data[ROB_WIDTH-1:0];
    64'h0000_0800_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry43_read_data[ROB_WIDTH-1:0];
    64'h0000_1000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry44_read_data[ROB_WIDTH-1:0];
    64'h0000_2000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry45_read_data[ROB_WIDTH-1:0];
    64'h0000_4000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry46_read_data[ROB_WIDTH-1:0];
    64'h0000_8000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry47_read_data[ROB_WIDTH-1:0];
    64'h0001_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry48_read_data[ROB_WIDTH-1:0];
    64'h0002_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry49_read_data[ROB_WIDTH-1:0];
    64'h0004_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry50_read_data[ROB_WIDTH-1:0];
    64'h0008_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry51_read_data[ROB_WIDTH-1:0];
    64'h0010_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry52_read_data[ROB_WIDTH-1:0];
    64'h0020_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry53_read_data[ROB_WIDTH-1:0];
    64'h0040_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry54_read_data[ROB_WIDTH-1:0];
    64'h0080_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry55_read_data[ROB_WIDTH-1:0];
    64'h0100_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry56_read_data[ROB_WIDTH-1:0];
    64'h0200_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry57_read_data[ROB_WIDTH-1:0];
    64'h0400_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry58_read_data[ROB_WIDTH-1:0];
    64'h0800_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry59_read_data[ROB_WIDTH-1:0];
    64'h1000_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry60_read_data[ROB_WIDTH-1:0];
    64'h2000_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry61_read_data[ROB_WIDTH-1:0];
    64'h4000_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry62_read_data[ROB_WIDTH-1:0];
    64'h8000_0000_0000_0000: rob_read5_entry_data[ROB_WIDTH-1:0] = entry63_read_data[ROB_WIDTH-1:0];
    default:                 rob_read5_entry_data[ROB_WIDTH-1:0] = {ROB_WIDTH{1'bx}};
  endcase
// &CombEnd; @1391
end

//==========================================================
//              ead Port for read entry update
//==========================================================
//----------------------------------------------------------
//              Read entry update data select
//----------------------------------------------------------
// &CombBeg; @1399
always @( retire_entry0_updt_vld
       or rob_read2_entry_data[39:0]
       or rob_read5_entry_data[39:0]
       or rob_read5_iid[5:0]
       or rob_read4_entry_data[39:0]
       or rob_read1_entry_data[39:0]
       or rob_read1_iid[5:0]
       or rob_read4_iid[5:0]
       or rob_read3_iid[5:0]
       or retire_entry2_updt_vld
       or retire_entry1_updt_vld
       or rob_read2_iid[5:0]
       or rob_read3_entry_data[39:0]
       or rob_read0_iid[5:0]
       or rob_read0_entry_data[39:0])
begin
  if(retire_entry2_updt_vld) begin
    read_entry0_updt_data[ROB_WIDTH-1:0] = rob_read3_entry_data[ROB_WIDTH-1:0];
    read_entry1_updt_data[ROB_WIDTH-1:0] = rob_read4_entry_data[ROB_WIDTH-1:0];
    read_entry2_updt_data[ROB_WIDTH-1:0] = rob_read5_entry_data[ROB_WIDTH-1:0];

    rob_read_entry0_updt_iid[5:0]        = rob_read3_iid[5:0];
    rob_read_entry1_updt_iid[5:0]        = rob_read4_iid[5:0];
    rob_read_entry2_updt_iid[5:0]        = rob_read5_iid[5:0];
  end
  else if(retire_entry1_updt_vld) begin
    read_entry0_updt_data[ROB_WIDTH-1:0] = rob_read2_entry_data[ROB_WIDTH-1:0];
    read_entry1_updt_data[ROB_WIDTH-1:0] = rob_read3_entry_data[ROB_WIDTH-1:0];
    read_entry2_updt_data[ROB_WIDTH-1:0] = rob_read4_entry_data[ROB_WIDTH-1:0];

    rob_read_entry0_updt_iid[5:0]        = rob_read2_iid[5:0];
    rob_read_entry1_updt_iid[5:0]        = rob_read3_iid[5:0];
    rob_read_entry2_updt_iid[5:0]        = rob_read4_iid[5:0];
  end
  else if(retire_entry0_updt_vld) begin
    read_entry0_updt_data[ROB_WIDTH-1:0] = rob_read1_entry_data[ROB_WIDTH-1:0];
    read_entry1_updt_data[ROB_WIDTH-1:0] = rob_read2_entry_data[ROB_WIDTH-1:0];
    read_entry2_updt_data[ROB_WIDTH-1:0] = rob_read3_entry_data[ROB_WIDTH-1:0];

    rob_read_entry0_updt_iid[5:0]        = rob_read1_iid[5:0];
    rob_read_entry1_updt_iid[5:0]        = rob_read2_iid[5:0];
    rob_read_entry2_updt_iid[5:0]        = rob_read3_iid[5:0];
  end
  else begin
    read_entry0_updt_data[ROB_WIDTH-1:0] = rob_read0_entry_data[ROB_WIDTH-1:0];
    read_entry1_updt_data[ROB_WIDTH-1:0] = rob_read1_entry_data[ROB_WIDTH-1:0];
    read_entry2_updt_data[ROB_WIDTH-1:0] = rob_read2_entry_data[ROB_WIDTH-1:0];

    rob_read_entry0_updt_iid[5:0]        = rob_read0_iid[5:0];
    rob_read_entry1_updt_iid[5:0]        = rob_read1_iid[5:0];
    rob_read_entry2_updt_iid[5:0]        = rob_read2_iid[5:0];
  end
// &CombEnd; @1436
end

//----------------------------------------------------------
//             Read entry create data select
//----------------------------------------------------------
assign rob_create_to_read_entry0_en         = rob_read0_entry_data[ROB_VLD]
                                              && !read_entry0_read_data[ROB_VLD];
assign rob_create_to_read_entry1_en         = rob_read1_entry_data[ROB_VLD]
                                              && !read_entry1_read_data[ROB_VLD];
assign rob_create_to_read_entry2_en         = rob_read2_entry_data[ROB_VLD]
                                              && !read_entry2_read_data[ROB_VLD];

assign rob_create_to_read_entry0_dp_en      = rob_create_to_read_entry0_en;
assign rob_create_to_read_entry1_dp_en      = rob_create_to_read_entry1_en;
assign rob_create_to_read_entry2_dp_en      = rob_create_to_read_entry2_en;

assign rob_create_to_read_entry0_gateclk_en = !rob_empty
                                              && !read_entry0_read_data[ROB_VLD];
assign rob_create_to_read_entry1_gateclk_en = !rob_empty && !rob_1_entry
                                              && !read_entry1_read_data[ROB_VLD];
assign rob_create_to_read_entry2_gateclk_en = !rob_empty && !rob_1_entry && !rob_2_entry
                                              && !read_entry2_read_data[ROB_VLD];

//mux between create and update
assign read_entry0_create_data[ROB_WIDTH-1:0] = read_entry0_updt_data[ROB_WIDTH-1:0];
assign read_entry1_create_data[ROB_WIDTH-1:0] = read_entry1_updt_data[ROB_WIDTH-1:0];
assign read_entry2_create_data[ROB_WIDTH-1:0] = read_entry2_updt_data[ROB_WIDTH-1:0];

//----------------------------------------------------------
//                Read entry create enable
//----------------------------------------------------------
assign read_entry0_create_en         = retire_entry0_updt_vld
                                       || rob_create_to_read_entry0_en;
assign read_entry1_create_en         = retire_entry0_updt_vld
                                       || rob_create_to_read_entry1_en;
assign read_entry2_create_en         = retire_entry0_updt_vld
                                       || rob_create_to_read_entry2_en;

assign read_entry0_create_dp_en      = retire_entry0_updt_vld
                                       || rob_create_to_read_entry0_dp_en;
assign read_entry1_create_dp_en      = retire_entry0_updt_vld
                                       || rob_create_to_read_entry1_dp_en;
assign read_entry2_create_dp_en      = retire_entry0_updt_vld
                                       || rob_create_to_read_entry2_dp_en;

assign read_entry0_create_gateclk_en = retire_entry0_updt_gateclk_vld
                                       || rob_create_to_read_entry0_gateclk_en;
assign read_entry1_create_gateclk_en = retire_entry0_updt_gateclk_vld
                                       || rob_create_to_read_entry1_gateclk_en;
assign read_entry2_create_gateclk_en = retire_entry0_updt_gateclk_vld
                                       || rob_create_to_read_entry2_gateclk_en;

assign read_entry0_create_sel[3:0]   = 4'b1;
assign read_entry1_create_sel[3:0]   = 4'b1;
assign read_entry2_create_sel[3:0]   = 4'b1;

//----------------------------------------------------------
//                Read entry complete port
//----------------------------------------------------------
assign read_entry0_cmplt_vld[6:0] =
  {vfpu_rtu_pipe7_cmplt   && (vfpu_rtu_pipe7_iid[5:0]   == rob_read_entry0_updt_iid[5:0]),
   vfpu_rtu_pipe6_cmplt   && (vfpu_rtu_pipe6_iid[5:0]   == rob_read_entry0_updt_iid[5:0]),
   lsu_rtu_wb_pipe4_cmplt && (lsu_rtu_wb_pipe4_iid[5:0] == rob_read_entry0_updt_iid[5:0]),
   lsu_rtu_wb_pipe3_cmplt && (lsu_rtu_wb_pipe3_iid[5:0] == rob_read_entry0_updt_iid[5:0]),
   iu_rtu_pipe2_cmplt     && (iu_rtu_pipe2_iid[5:0]     == rob_read_entry0_updt_iid[5:0]),
   iu_rtu_pipe1_cmplt     && (iu_rtu_pipe1_iid[5:0]     == rob_read_entry0_updt_iid[5:0]),
   iu_rtu_pipe0_cmplt     && (iu_rtu_pipe0_iid[5:0]     == rob_read_entry0_updt_iid[5:0])};

assign read_entry1_cmplt_vld[6:0] =
  {vfpu_rtu_pipe7_cmplt   && (vfpu_rtu_pipe7_iid[5:0]   == rob_read_entry1_updt_iid[5:0]),
   vfpu_rtu_pipe6_cmplt   && (vfpu_rtu_pipe6_iid[5:0]   == rob_read_entry1_updt_iid[5:0]),
   lsu_rtu_wb_pipe4_cmplt && (lsu_rtu_wb_pipe4_iid[5:0] == rob_read_entry1_updt_iid[5:0]),
   lsu_rtu_wb_pipe3_cmplt && (lsu_rtu_wb_pipe3_iid[5:0] == rob_read_entry1_updt_iid[5:0]),
   iu_rtu_pipe2_cmplt     && (iu_rtu_pipe2_iid[5:0]     == rob_read_entry1_updt_iid[5:0]),
   iu_rtu_pipe1_cmplt     && (iu_rtu_pipe1_iid[5:0]     == rob_read_entry1_updt_iid[5:0]),
   iu_rtu_pipe0_cmplt     && (iu_rtu_pipe0_iid[5:0]     == rob_read_entry1_updt_iid[5:0])};

assign read_entry2_cmplt_vld[6:0] =
  {vfpu_rtu_pipe7_cmplt   && (vfpu_rtu_pipe7_iid[5:0]   == rob_read_entry2_updt_iid[5:0]),
   vfpu_rtu_pipe6_cmplt   && (vfpu_rtu_pipe6_iid[5:0]   == rob_read_entry2_updt_iid[5:0]),
   lsu_rtu_wb_pipe4_cmplt && (lsu_rtu_wb_pipe4_iid[5:0] == rob_read_entry2_updt_iid[5:0]),
   lsu_rtu_wb_pipe3_cmplt && (lsu_rtu_wb_pipe3_iid[5:0] == rob_read_entry2_updt_iid[5:0]),
   iu_rtu_pipe2_cmplt     && (iu_rtu_pipe2_iid[5:0]     == rob_read_entry2_updt_iid[5:0]),
   iu_rtu_pipe1_cmplt     && (iu_rtu_pipe1_iid[5:0]     == rob_read_entry2_updt_iid[5:0]),
   iu_rtu_pipe0_cmplt     && (iu_rtu_pipe0_iid[5:0]     == rob_read_entry2_updt_iid[5:0])};

assign read_entry_cmplt_gateclk_vld = vfpu_rtu_pipe7_cmplt
                                      || vfpu_rtu_pipe6_cmplt
                                      || lsu_rtu_wb_pipe4_cmplt
                                      || lsu_rtu_wb_pipe3_cmplt
                                      || iu_rtu_pipe2_cmplt
                                      || iu_rtu_pipe1_cmplt
                                      || iu_rtu_pipe0_cmplt;

assign read_entry0_cmplt_gateclk_vld = read_entry_cmplt_gateclk_vld;
assign read_entry1_cmplt_gateclk_vld = read_entry_cmplt_gateclk_vld;
assign read_entry2_cmplt_gateclk_vld = read_entry_cmplt_gateclk_vld;

//----------------------------------------------------------
//                   Read Entry Read
//----------------------------------------------------------
assign rob_read0_data[ROB_WIDTH-1:0] = read_entry0_read_data[ROB_WIDTH-1:0];
assign rob_read1_data[ROB_WIDTH-1:0] = read_entry1_read_data[ROB_WIDTH-1:0];
assign rob_read2_data[ROB_WIDTH-1:0] = read_entry2_read_data[ROB_WIDTH-1:0];

//----------------------------------------------------------
//                   Read Entry Pop
//----------------------------------------------------------
//Read entry never pop
assign read_entry0_pop_en = 1'b0;
assign read_entry1_pop_en = 1'b0;
assign read_entry2_pop_en = 1'b0;

//==========================================================
//                  Pop for Retire Entry
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign read_ptr_clk_en = retire_entry0_updt_gateclk_vld
                         || retire_rob_flush_gateclk;
// &Instance("gated_clk_cell", "x_read_ptr_gated_clk"); @1557
gated_clk_cell  x_read_ptr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (read_ptr_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (read_ptr_clk_en   ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1558
//          .external_en (1'b0), @1559
//          .global_en   (cp0_yy_clk_en), @1560
//          .module_en   (cp0_rtu_icg_en), @1561
//          .local_en    (read_ptr_clk_en), @1562
//          .clk_out     (read_ptr_clk)); @1563

//----------------------------------------------------------
//                    read pointers 
//----------------------------------------------------------
assign rob_read_ptr_add_3 = retire_entry2_updt_vld;
assign rob_read_ptr_add_2 = retire_entry1_updt_vld;
assign rob_read_ptr_add_1 = retire_entry0_updt_vld;

always @(posedge read_ptr_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rob_read0_ptr[63:0]     <= 64'h1;
    rob_read0_iid[6:0]      <= 7'd0;
    rob_read1_iid[6:0]      <= 7'd1;
    rob_read2_iid[6:0]      <= 7'd2;
    rob_read3_iid[6:0]      <= 7'd3;
    rob_read4_iid[6:0]      <= 7'd4;
    rob_read5_iid[6:0]      <= 7'd5;
  end
  else if(retire_rob_flush) begin
    rob_read0_ptr[63:0]     <= 64'h1;
    rob_read0_iid[6:0]      <= 7'd0;
    rob_read1_iid[6:0]      <= 7'd1;
    rob_read2_iid[6:0]      <= 7'd2;
    rob_read3_iid[6:0]      <= 7'd3;
    rob_read4_iid[6:0]      <= 7'd4;
    rob_read5_iid[6:0]      <= 7'd5;
  end
  else if(rob_read_ptr_add_3) begin
    rob_read0_ptr[63:0]     <= {rob_read0_ptr[60:0],rob_read0_ptr[63:61]};
    rob_read0_iid[6:0]      <= rob_read0_iid[6:0] + 7'd3;
    rob_read1_iid[6:0]      <= rob_read1_iid[6:0] + 7'd3;
    rob_read2_iid[6:0]      <= rob_read2_iid[6:0] + 7'd3;
    rob_read3_iid[6:0]      <= rob_read3_iid[6:0] + 7'd3;
    rob_read4_iid[6:0]      <= rob_read4_iid[6:0] + 7'd3;
    rob_read5_iid[6:0]      <= rob_read5_iid[6:0] + 7'd3;
  end
  else if(rob_read_ptr_add_2) begin
    rob_read0_ptr[63:0]     <= {rob_read0_ptr[61:0],rob_read0_ptr[63:62]};
    rob_read0_iid[6:0]      <= rob_read0_iid[6:0] + 7'd2;
    rob_read1_iid[6:0]      <= rob_read1_iid[6:0] + 7'd2;
    rob_read2_iid[6:0]      <= rob_read2_iid[6:0] + 7'd2;
    rob_read3_iid[6:0]      <= rob_read3_iid[6:0] + 7'd2;
    rob_read4_iid[6:0]      <= rob_read4_iid[6:0] + 7'd2;
    rob_read5_iid[6:0]      <= rob_read5_iid[6:0] + 7'd2;
  end
  else if(rob_read_ptr_add_1) begin
    rob_read0_ptr[63:0]     <= {rob_read0_ptr[62:0],rob_read0_ptr[63]};
    rob_read0_iid[6:0]      <= rob_read0_iid[6:0] + 7'd1;
    rob_read1_iid[6:0]      <= rob_read1_iid[6:0] + 7'd1;
    rob_read2_iid[6:0]      <= rob_read2_iid[6:0] + 7'd1;
    rob_read3_iid[6:0]      <= rob_read3_iid[6:0] + 7'd1;
    rob_read4_iid[6:0]      <= rob_read4_iid[6:0] + 7'd1;
    rob_read5_iid[6:0]      <= rob_read5_iid[6:0] + 7'd1;
  end
  else begin
    rob_read0_ptr[63:0]     <= rob_read0_ptr[63:0];
    rob_read0_iid[6:0]      <= rob_read0_iid[6:0];
    rob_read1_iid[6:0]      <= rob_read1_iid[6:0];
    rob_read2_iid[6:0]      <= rob_read2_iid[6:0];
    rob_read3_iid[6:0]      <= rob_read3_iid[6:0];
    rob_read4_iid[6:0]      <= rob_read4_iid[6:0];
    rob_read5_iid[6:0]      <= rob_read5_iid[6:0];
  end
end

assign rob_read1_ptr[63:0] = {rob_read0_ptr[62:0],rob_read0_ptr[63]};
assign rob_read2_ptr[63:0] = {rob_read0_ptr[61:0],rob_read0_ptr[63:62]};
assign rob_read3_ptr[63:0] = {rob_read0_ptr[60:0],rob_read0_ptr[63:61]};
assign rob_read4_ptr[63:0] = {rob_read0_ptr[59:0],rob_read0_ptr[63:60]};
assign rob_read5_ptr[63:0] = {rob_read0_ptr[58:0],rob_read0_ptr[63:59]};

assign rob_pst_retire_inst0_iid_updt_val[6:0] = rob_read0_iid[6:0];
assign rob_pst_retire_inst1_iid_updt_val[6:0] = rob_read1_iid[6:0];
assign rob_pst_retire_inst2_iid_updt_val[6:0] = rob_read2_iid[6:0];

assign rtu_lsu_commit0_iid_updt_val[6:0] = rob_read0_iid[6:0];
assign rtu_lsu_commit1_iid_updt_val[6:0] = rob_read1_iid[6:0];
assign rtu_lsu_commit2_iid_updt_val[6:0] = rob_read2_iid[6:0];

//==========================================================
//                    ROB pop control
//==========================================================

//----------------------------------------------------------
//                      3 Pop Ports
//----------------------------------------------------------
// &ConnRule(s/^x_num/rob_pop0_ptr/); @1651
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_rob_pop0_ptr"); @1652
ct_rtu_expand_64  x_ct_rtu_expand_64_rob_pop0_ptr (
  .x_num               (rob_pop0_ptr       ),
  .x_num_expand        (rob_pop0_ptr_expand)
);

// &ConnRule(s/^x_num/rob_pop1_ptr/); @1653
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_rob_pop1_ptr"); @1654
ct_rtu_expand_64  x_ct_rtu_expand_64_rob_pop1_ptr (
  .x_num               (rob_pop1_ptr       ),
  .x_num_expand        (rob_pop1_ptr_expand)
);

// &ConnRule(s/^x_num/rob_pop2_ptr/); @1655
// &Instance("ct_rtu_expand_64","x_ct_rtu_expand_64_rob_pop2_ptr"); @1656
ct_rtu_expand_64  x_ct_rtu_expand_64_rob_pop2_ptr (
  .x_num               (rob_pop2_ptr       ),
  .x_num_expand        (rob_pop2_ptr_expand)
);


assign rob_entry_pop_en[63:0] =
           {64{rtu_yy_xx_retire0}} & rob_pop0_ptr_expand[63:0]
         | {64{rtu_yy_xx_retire1}} & rob_pop1_ptr_expand[63:0]
         | {64{rtu_yy_xx_retire2}} & rob_pop2_ptr_expand[63:0];

assign entry0_pop_en  = rob_entry_pop_en[0];
assign entry1_pop_en  = rob_entry_pop_en[1];
assign entry2_pop_en  = rob_entry_pop_en[2];
assign entry3_pop_en  = rob_entry_pop_en[3];
assign entry4_pop_en  = rob_entry_pop_en[4];
assign entry5_pop_en  = rob_entry_pop_en[5];
assign entry6_pop_en  = rob_entry_pop_en[6];
assign entry7_pop_en  = rob_entry_pop_en[7];
assign entry8_pop_en  = rob_entry_pop_en[8];
assign entry9_pop_en  = rob_entry_pop_en[9];
assign entry10_pop_en = rob_entry_pop_en[10];
assign entry11_pop_en = rob_entry_pop_en[11];
assign entry12_pop_en = rob_entry_pop_en[12];
assign entry13_pop_en = rob_entry_pop_en[13];
assign entry14_pop_en = rob_entry_pop_en[14];
assign entry15_pop_en = rob_entry_pop_en[15];
assign entry16_pop_en = rob_entry_pop_en[16];
assign entry17_pop_en = rob_entry_pop_en[17];
assign entry18_pop_en = rob_entry_pop_en[18];
assign entry19_pop_en = rob_entry_pop_en[19];
assign entry20_pop_en = rob_entry_pop_en[20];
assign entry21_pop_en = rob_entry_pop_en[21];
assign entry22_pop_en = rob_entry_pop_en[22];
assign entry23_pop_en = rob_entry_pop_en[23];
assign entry24_pop_en = rob_entry_pop_en[24];
assign entry25_pop_en = rob_entry_pop_en[25];
assign entry26_pop_en = rob_entry_pop_en[26];
assign entry27_pop_en = rob_entry_pop_en[27];
assign entry28_pop_en = rob_entry_pop_en[28];
assign entry29_pop_en = rob_entry_pop_en[29];
assign entry30_pop_en = rob_entry_pop_en[30];
assign entry31_pop_en = rob_entry_pop_en[31];
assign entry32_pop_en = rob_entry_pop_en[32];
assign entry33_pop_en = rob_entry_pop_en[33];
assign entry34_pop_en = rob_entry_pop_en[34];
assign entry35_pop_en = rob_entry_pop_en[35];
assign entry36_pop_en = rob_entry_pop_en[36];
assign entry37_pop_en = rob_entry_pop_en[37];
assign entry38_pop_en = rob_entry_pop_en[38];
assign entry39_pop_en = rob_entry_pop_en[39];
assign entry40_pop_en = rob_entry_pop_en[40];
assign entry41_pop_en = rob_entry_pop_en[41];
assign entry42_pop_en = rob_entry_pop_en[42];
assign entry43_pop_en = rob_entry_pop_en[43];
assign entry44_pop_en = rob_entry_pop_en[44];
assign entry45_pop_en = rob_entry_pop_en[45];
assign entry46_pop_en = rob_entry_pop_en[46];
assign entry47_pop_en = rob_entry_pop_en[47];
assign entry48_pop_en = rob_entry_pop_en[48];
assign entry49_pop_en = rob_entry_pop_en[49];
assign entry50_pop_en = rob_entry_pop_en[50];
assign entry51_pop_en = rob_entry_pop_en[51];
assign entry52_pop_en = rob_entry_pop_en[52];
assign entry53_pop_en = rob_entry_pop_en[53];
assign entry54_pop_en = rob_entry_pop_en[54];
assign entry55_pop_en = rob_entry_pop_en[55];
assign entry56_pop_en = rob_entry_pop_en[56];
assign entry57_pop_en = rob_entry_pop_en[57];
assign entry58_pop_en = rob_entry_pop_en[58];
assign entry59_pop_en = rob_entry_pop_en[59];
assign entry60_pop_en = rob_entry_pop_en[60];
assign entry61_pop_en = rob_entry_pop_en[61];
assign entry62_pop_en = rob_entry_pop_en[62];
assign entry63_pop_en = rob_entry_pop_en[63];

//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign pop_ptr_clk_en = rtu_yy_xx_retire0
                        || retire_rob_flush_gateclk;
// &Instance("gated_clk_cell", "x_pop_ptr_gated_clk"); @1733
gated_clk_cell  x_pop_ptr_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pop_ptr_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pop_ptr_clk_en    ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1734
//          .external_en (1'b0), @1735
//          .global_en   (cp0_yy_clk_en), @1736
//          .module_en   (cp0_rtu_icg_en), @1737
//          .local_en    (pop_ptr_clk_en), @1738
//          .clk_out     (pop_ptr_clk)); @1739

//----------------------------------------------------------
//                    pop pointers 
//----------------------------------------------------------
assign rob_pop_ptr_add_3 = rtu_yy_xx_retire2;
assign rob_pop_ptr_add_2 = rtu_yy_xx_retire1;
assign rob_pop_ptr_add_1 = rtu_yy_xx_retire0;

always @(posedge pop_ptr_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rob_pop0_iid[6:0]      <= 7'd0;
    rob_pop1_iid[6:0]      <= 7'd1;
    rob_pop2_iid[6:0]      <= 7'd2;
  end
  else if(retire_rob_flush) begin
    rob_pop0_iid[6:0]      <= 7'd0;
    rob_pop1_iid[6:0]      <= 7'd1;
    rob_pop2_iid[6:0]      <= 7'd2;
  end
  else if(rob_pop_ptr_add_3) begin
    rob_pop0_iid[6:0]      <= rob_pop0_iid[6:0] + 7'd3;
    rob_pop1_iid[6:0]      <= rob_pop1_iid[6:0] + 7'd3;
    rob_pop2_iid[6:0]      <= rob_pop2_iid[6:0] + 7'd3;
  end
  else if(rob_pop_ptr_add_2) begin
    rob_pop0_iid[6:0]      <= rob_pop0_iid[6:0] + 7'd2;
    rob_pop1_iid[6:0]      <= rob_pop1_iid[6:0] + 7'd2;
    rob_pop2_iid[6:0]      <= rob_pop2_iid[6:0] + 7'd2;
  end
  else if(rob_pop_ptr_add_1) begin
    rob_pop0_iid[6:0]      <= rob_pop0_iid[6:0] + 7'd1;
    rob_pop1_iid[6:0]      <= rob_pop1_iid[6:0] + 7'd1;
    rob_pop2_iid[6:0]      <= rob_pop2_iid[6:0] + 7'd1;
  end
  else begin
    rob_pop0_iid[6:0]      <= rob_pop0_iid[6:0];
    rob_pop1_iid[6:0]      <= rob_pop1_iid[6:0];
    rob_pop2_iid[6:0]      <= rob_pop2_iid[6:0];
  end
end

assign rob_pop0_ptr[5:0] = rob_pop0_iid[5:0];
assign rob_pop1_ptr[5:0] = rob_pop1_iid[5:0];
assign rob_pop2_ptr[5:0] = rob_pop2_iid[5:0];

//==========================================================
//                  ROB debug info signals
//==========================================================
//capture rob information when rob flush (jdb req)
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign debug_info_clk_en = retire_rob_flush_gateclk;
// &Instance("gated_clk_cell", "x_debug_info_gated_clk"); @1794
gated_clk_cell  x_debug_info_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (debug_info_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (debug_info_clk_en ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1795
//          .external_en (1'b0), @1796
//          .global_en   (cp0_yy_clk_en), @1797
//          .module_en   (cp0_rtu_icg_en), @1798
//          .local_en    (debug_info_clk_en), @1799
//          .clk_out     (debug_info_clk)); @1800

//----------------------------------------------------------
//                   ROB debug info
//----------------------------------------------------------
always @(posedge debug_info_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    debug_info_rob_full             <= 1'd0;
    debug_info_rob_read0_iid[6:0]   <= 7'd0;
    debug_info_rob_create0_iid[6:0] <= 7'd0;
    debug_info_rob_entry_num[6:0]   <= 7'd0;
    debug_info_rob_commit0          <= 1'd0;
    debug_info_rob_commit_st_no_vld <= 1'd0;
    debug_info_flush_cur_state[4:0] <= 5'd0;
  end
  else if(retire_rob_flush_gateclk) begin
    debug_info_rob_full             <= rob_full;
    debug_info_rob_read0_iid[6:0]   <= rob_read0_iid[6:0];
    debug_info_rob_create0_iid[6:0] <= rob_create0_iid[6:0];
    debug_info_rob_entry_num[6:0]   <= rob_entry_num[6:0];
    debug_info_rob_commit0          <= rob_debug_commit0;
    debug_info_rob_commit_st_no_vld <= !lsu_rtu_all_commit_data_vld;
    debug_info_flush_cur_state[4:0] <= retire_rob_flush_cur_state[4:0];
  end
  else begin
    debug_info_rob_full             <= debug_info_rob_full;
    debug_info_rob_read0_iid[6:0]   <= debug_info_rob_read0_iid[6:0];
    debug_info_rob_create0_iid[6:0] <= debug_info_rob_create0_iid[6:0];
    debug_info_rob_entry_num[6:0]   <= debug_info_rob_entry_num[6:0];
    debug_info_rob_commit0          <= debug_info_rob_commit0;
    debug_info_rob_commit_st_no_vld <= debug_info_rob_commit_st_no_vld;
    debug_info_flush_cur_state[4:0] <= debug_info_flush_cur_state[4:0];
  end
end

assign rob_top_rob_full             = debug_info_rob_full;
assign rob_top_read0_iid[6:0]       = debug_info_rob_read0_iid[6:0];
assign rob_top_create0_iid[6:0]     = debug_info_rob_create0_iid[6:0];
assign rob_top_entry_num[6:0]       = debug_info_rob_entry_num[6:0];
assign rob_top_commit_st_no_vld     = debug_info_rob_commit_st_no_vld;
assign rob_top_commit0              = debug_info_rob_commit0;
assign rob_top_flush_cur_state[4:0] = debug_info_flush_cur_state[4:0];

//==========================================================
//                   Expt Entry Instance
//==========================================================
// &Instance("ct_rtu_rob_expt", "x_ct_rtu_rob_expt"); @1847
ct_rtu_rob_expt  x_ct_rtu_rob_expt (
  .cp0_rtu_icg_en                       (cp0_rtu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .expt_entry_expt_vld_updt_val         (expt_entry_expt_vld_updt_val        ),
  .expt_entry_iid                       (expt_entry_iid                      ),
  .expt_entry_vld                       (expt_entry_vld                      ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .iu_rtu_pipe0_abnormal                (iu_rtu_pipe0_abnormal               ),
  .iu_rtu_pipe0_bkpt                    (iu_rtu_pipe0_bkpt                   ),
  .iu_rtu_pipe0_cmplt                   (iu_rtu_pipe0_cmplt                  ),
  .iu_rtu_pipe0_efpc_vld                (iu_rtu_pipe0_efpc_vld               ),
  .iu_rtu_pipe0_expt_vec                (iu_rtu_pipe0_expt_vec               ),
  .iu_rtu_pipe0_expt_vld                (iu_rtu_pipe0_expt_vld               ),
  .iu_rtu_pipe0_flush                   (iu_rtu_pipe0_flush                  ),
  .iu_rtu_pipe0_high_hw_expt            (iu_rtu_pipe0_high_hw_expt           ),
  .iu_rtu_pipe0_iid                     (iu_rtu_pipe0_iid                    ),
  .iu_rtu_pipe0_immu_expt               (iu_rtu_pipe0_immu_expt              ),
  .iu_rtu_pipe0_mtval                   (iu_rtu_pipe0_mtval                  ),
  .iu_rtu_pipe0_vsetvl                  (iu_rtu_pipe0_vsetvl                 ),
  .iu_rtu_pipe0_vstart                  (iu_rtu_pipe0_vstart                 ),
  .iu_rtu_pipe0_vstart_vld              (iu_rtu_pipe0_vstart_vld             ),
  .iu_rtu_pipe2_abnormal                (iu_rtu_pipe2_abnormal               ),
  .iu_rtu_pipe2_bht_mispred             (iu_rtu_pipe2_bht_mispred            ),
  .iu_rtu_pipe2_cmplt                   (iu_rtu_pipe2_cmplt                  ),
  .iu_rtu_pipe2_iid                     (iu_rtu_pipe2_iid                    ),
  .iu_rtu_pipe2_jmp_mispred             (iu_rtu_pipe2_jmp_mispred            ),
  .lsu_rtu_da_pipe3_split_spec_fail_iid (lsu_rtu_da_pipe3_split_spec_fail_iid),
  .lsu_rtu_da_pipe3_split_spec_fail_vld (lsu_rtu_da_pipe3_split_spec_fail_vld),
  .lsu_rtu_da_pipe4_split_spec_fail_iid (lsu_rtu_da_pipe4_split_spec_fail_iid),
  .lsu_rtu_da_pipe4_split_spec_fail_vld (lsu_rtu_da_pipe4_split_spec_fail_vld),
  .lsu_rtu_wb_pipe3_abnormal            (lsu_rtu_wb_pipe3_abnormal           ),
  .lsu_rtu_wb_pipe3_cmplt               (lsu_rtu_wb_pipe3_cmplt              ),
  .lsu_rtu_wb_pipe3_expt_vec            (lsu_rtu_wb_pipe3_expt_vec           ),
  .lsu_rtu_wb_pipe3_expt_vld            (lsu_rtu_wb_pipe3_expt_vld           ),
  .lsu_rtu_wb_pipe3_flush               (lsu_rtu_wb_pipe3_flush              ),
  .lsu_rtu_wb_pipe3_iid                 (lsu_rtu_wb_pipe3_iid                ),
  .lsu_rtu_wb_pipe3_mtval               (lsu_rtu_wb_pipe3_mtval              ),
  .lsu_rtu_wb_pipe3_spec_fail           (lsu_rtu_wb_pipe3_spec_fail          ),
  .lsu_rtu_wb_pipe3_vsetvl              (lsu_rtu_wb_pipe3_vsetvl             ),
  .lsu_rtu_wb_pipe3_vstart              (lsu_rtu_wb_pipe3_vstart             ),
  .lsu_rtu_wb_pipe3_vstart_vld          (lsu_rtu_wb_pipe3_vstart_vld         ),
  .lsu_rtu_wb_pipe4_abnormal            (lsu_rtu_wb_pipe4_abnormal           ),
  .lsu_rtu_wb_pipe4_cmplt               (lsu_rtu_wb_pipe4_cmplt              ),
  .lsu_rtu_wb_pipe4_expt_vec            (lsu_rtu_wb_pipe4_expt_vec           ),
  .lsu_rtu_wb_pipe4_expt_vld            (lsu_rtu_wb_pipe4_expt_vld           ),
  .lsu_rtu_wb_pipe4_flush               (lsu_rtu_wb_pipe4_flush              ),
  .lsu_rtu_wb_pipe4_iid                 (lsu_rtu_wb_pipe4_iid                ),
  .lsu_rtu_wb_pipe4_mtval               (lsu_rtu_wb_pipe4_mtval              ),
  .lsu_rtu_wb_pipe4_spec_fail           (lsu_rtu_wb_pipe4_spec_fail          ),
  .lsu_rtu_wb_pipe4_vstart              (lsu_rtu_wb_pipe4_vstart             ),
  .lsu_rtu_wb_pipe4_vstart_vld          (lsu_rtu_wb_pipe4_vstart_vld         ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .retire_expt_inst0_abnormal           (retire_expt_inst0_abnormal          ),
  .retire_expt_inst0_vld                (retire_expt_inst0_vld               ),
  .retire_rob_flush                     (retire_rob_flush                    ),
  .rob_expt_inst0_iid                   (rob_expt_inst0_iid                  ),
  .rob_retire_inst0_bht_mispred         (rob_retire_inst0_bht_mispred        ),
  .rob_retire_inst0_bkpt                (rob_retire_inst0_bkpt               ),
  .rob_retire_inst0_efpc_vld            (rob_retire_inst0_efpc_vld           ),
  .rob_retire_inst0_expt_vec            (rob_retire_inst0_expt_vec           ),
  .rob_retire_inst0_expt_vld            (rob_retire_inst0_expt_vld           ),
  .rob_retire_inst0_high_hw_expt        (rob_retire_inst0_high_hw_expt       ),
  .rob_retire_inst0_immu_expt           (rob_retire_inst0_immu_expt          ),
  .rob_retire_inst0_inst_flush          (rob_retire_inst0_inst_flush         ),
  .rob_retire_inst0_jmp_mispred         (rob_retire_inst0_jmp_mispred        ),
  .rob_retire_inst0_mtval               (rob_retire_inst0_mtval              ),
  .rob_retire_inst0_spec_fail           (rob_retire_inst0_spec_fail          ),
  .rob_retire_inst0_spec_fail_no_ssf    (rob_retire_inst0_spec_fail_no_ssf   ),
  .rob_retire_inst0_spec_fail_ssf       (rob_retire_inst0_spec_fail_ssf      ),
  .rob_retire_inst0_split               (rob_retire_inst0_split              ),
  .rob_retire_inst0_vsetvl              (rob_retire_inst0_vsetvl             ),
  .rob_retire_inst0_vstart              (rob_retire_inst0_vstart             ),
  .rob_retire_inst0_vstart_vld          (rob_retire_inst0_vstart_vld         ),
  .rob_retire_split_spec_fail_srt       (rob_retire_split_spec_fail_srt      ),
  .rob_retire_ssf_iid                   (rob_retire_ssf_iid                  ),
  .rob_top_ssf_cur_state                (rob_top_ssf_cur_state               ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     )
);


//==========================================================
//                  Retire Entry Instance
//==========================================================
// &Force("output","rob_retire_inst0_split"); @1852
// &Force("output","rtu_yy_xx_retire0"); @1853
// &Force("output","rtu_yy_xx_retire1"); @1854
// &Force("output","rtu_yy_xx_retire2"); @1855
// &Instance("ct_rtu_rob_rt", "x_ct_rtu_rob_rt"); @1856
ct_rtu_rob_rt  x_ct_rtu_rob_rt (
  .cp0_rtu_icg_en                     (cp0_rtu_icg_en                    ),
  .cp0_rtu_xx_int_b                   (cp0_rtu_xx_int_b                  ),
  .cp0_rtu_xx_vec                     (cp0_rtu_xx_vec                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .expt_entry_expt_vld_updt_val       (expt_entry_expt_vld_updt_val      ),
  .expt_entry_iid                     (expt_entry_iid                    ),
  .expt_entry_vld                     (expt_entry_vld                    ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .had_rtu_data_bkpt_dbgreq           (had_rtu_data_bkpt_dbgreq          ),
  .had_rtu_dbg_req_en                 (had_rtu_dbg_req_en                ),
  .had_rtu_debug_retire_info_en       (had_rtu_debug_retire_info_en      ),
  .had_rtu_inst_bkpt_dbgreq           (had_rtu_inst_bkpt_dbgreq          ),
  .had_rtu_xx_tme                     (had_rtu_xx_tme                    ),
  .hpcp_rtu_cnt_en                    (hpcp_rtu_cnt_en                   ),
  .idu_rtu_fence_idle                 (idu_rtu_fence_idle                ),
  .ifu_rtu_cur_pc                     (ifu_rtu_cur_pc                    ),
  .ifu_rtu_cur_pc_load                (ifu_rtu_cur_pc_load               ),
  .iu_rtu_pcfifo_pop0_data            (iu_rtu_pcfifo_pop0_data           ),
  .iu_rtu_pcfifo_pop1_data            (iu_rtu_pcfifo_pop1_data           ),
  .iu_rtu_pcfifo_pop2_data            (iu_rtu_pcfifo_pop2_data           ),
  .iu_rtu_pipe0_abnormal              (iu_rtu_pipe0_abnormal             ),
  .iu_rtu_pipe0_cmplt                 (iu_rtu_pipe0_cmplt                ),
  .iu_rtu_pipe0_efpc                  (iu_rtu_pipe0_efpc                 ),
  .iu_rtu_pipe0_efpc_vld              (iu_rtu_pipe0_efpc_vld             ),
  .iu_rtu_pipe0_iid                   (iu_rtu_pipe0_iid                  ),
  .iu_rtu_pipe1_cmplt                 (iu_rtu_pipe1_cmplt                ),
  .iu_rtu_pipe1_iid                   (iu_rtu_pipe1_iid                  ),
  .iu_rtu_pipe2_abnormal              (iu_rtu_pipe2_abnormal             ),
  .iu_rtu_pipe2_cmplt                 (iu_rtu_pipe2_cmplt                ),
  .iu_rtu_pipe2_iid                   (iu_rtu_pipe2_iid                  ),
  .lsu_rtu_wb_pipe3_abnormal          (lsu_rtu_wb_pipe3_abnormal         ),
  .lsu_rtu_wb_pipe3_bkpta_data        (lsu_rtu_wb_pipe3_bkpta_data       ),
  .lsu_rtu_wb_pipe3_bkptb_data        (lsu_rtu_wb_pipe3_bkptb_data       ),
  .lsu_rtu_wb_pipe3_cmplt             (lsu_rtu_wb_pipe3_cmplt            ),
  .lsu_rtu_wb_pipe3_iid               (lsu_rtu_wb_pipe3_iid              ),
  .lsu_rtu_wb_pipe3_no_spec_hit       (lsu_rtu_wb_pipe3_no_spec_hit      ),
  .lsu_rtu_wb_pipe3_no_spec_mispred   (lsu_rtu_wb_pipe3_no_spec_mispred  ),
  .lsu_rtu_wb_pipe3_no_spec_miss      (lsu_rtu_wb_pipe3_no_spec_miss     ),
  .lsu_rtu_wb_pipe4_abnormal          (lsu_rtu_wb_pipe4_abnormal         ),
  .lsu_rtu_wb_pipe4_bkpta_data        (lsu_rtu_wb_pipe4_bkpta_data       ),
  .lsu_rtu_wb_pipe4_bkptb_data        (lsu_rtu_wb_pipe4_bkptb_data       ),
  .lsu_rtu_wb_pipe4_cmplt             (lsu_rtu_wb_pipe4_cmplt            ),
  .lsu_rtu_wb_pipe4_iid               (lsu_rtu_wb_pipe4_iid              ),
  .lsu_rtu_wb_pipe4_no_spec_hit       (lsu_rtu_wb_pipe4_no_spec_hit      ),
  .lsu_rtu_wb_pipe4_no_spec_mispred   (lsu_rtu_wb_pipe4_no_spec_mispred  ),
  .lsu_rtu_wb_pipe4_no_spec_miss      (lsu_rtu_wb_pipe4_no_spec_miss     ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .retire_entry0_updt_gateclk_vld     (retire_entry0_updt_gateclk_vld    ),
  .retire_entry0_updt_vld             (retire_entry0_updt_vld            ),
  .retire_entry1_updt_vld             (retire_entry1_updt_vld            ),
  .retire_entry2_updt_vld             (retire_entry2_updt_vld            ),
  .retire_expt_inst0_abnormal         (retire_expt_inst0_abnormal        ),
  .retire_expt_inst0_vld              (retire_expt_inst0_vld             ),
  .retire_rob_async_expt_commit_mask  (retire_rob_async_expt_commit_mask ),
  .retire_rob_ctc_flush_req           (retire_rob_ctc_flush_req          ),
  .retire_rob_dbg_inst0_ack_int       (retire_rob_dbg_inst0_ack_int      ),
  .retire_rob_dbg_inst0_dbg_mode_on   (retire_rob_dbg_inst0_dbg_mode_on  ),
  .retire_rob_dbg_inst0_expt_vld      (retire_rob_dbg_inst0_expt_vld     ),
  .retire_rob_dbg_inst0_flush         (retire_rob_dbg_inst0_flush        ),
  .retire_rob_dbg_inst0_mispred       (retire_rob_dbg_inst0_mispred      ),
  .retire_rob_flush                   (retire_rob_flush                  ),
  .retire_rob_flush_gateclk           (retire_rob_flush_gateclk          ),
  .retire_rob_inst0_jmp               (retire_rob_inst0_jmp              ),
  .retire_rob_inst1_jmp               (retire_rob_inst1_jmp              ),
  .retire_rob_inst2_jmp               (retire_rob_inst2_jmp              ),
  .retire_rob_inst_flush              (retire_rob_inst_flush             ),
  .retire_rob_rt_mask                 (retire_rob_rt_mask                ),
  .retire_rob_split_fof_flush         (retire_rob_split_fof_flush        ),
  .retire_rob_srt_en                  (retire_rob_srt_en                 ),
  .rob_debug_commit0                  (rob_debug_commit0                 ),
  .rob_expt_inst0_iid                 (rob_expt_inst0_iid                ),
  .rob_pst_retire_inst0_gateclk_vld   (rob_pst_retire_inst0_gateclk_vld  ),
  .rob_pst_retire_inst0_iid           (rob_pst_retire_inst0_iid          ),
  .rob_pst_retire_inst1_gateclk_vld   (rob_pst_retire_inst1_gateclk_vld  ),
  .rob_pst_retire_inst1_iid           (rob_pst_retire_inst1_iid          ),
  .rob_pst_retire_inst2_gateclk_vld   (rob_pst_retire_inst2_gateclk_vld  ),
  .rob_pst_retire_inst2_iid           (rob_pst_retire_inst2_iid          ),
  .rob_read0_data                     (rob_read0_data                    ),
  .rob_read0_iid                      (rob_read0_iid                     ),
  .rob_read1_data                     (rob_read1_data                    ),
  .rob_read1_iid                      (rob_read1_iid                     ),
  .rob_read2_data                     (rob_read2_data                    ),
  .rob_read2_iid                      (rob_read2_iid                     ),
  .rob_retire_commit0                 (rob_retire_commit0                ),
  .rob_retire_commit1                 (rob_retire_commit1                ),
  .rob_retire_commit2                 (rob_retire_commit2                ),
  .rob_retire_ctc_flush_srt_en        (rob_retire_ctc_flush_srt_en       ),
  .rob_retire_inst0_bju               (rob_retire_inst0_bju              ),
  .rob_retire_inst0_bju_inc_pc        (rob_retire_inst0_bju_inc_pc       ),
  .rob_retire_inst0_chk_idx           (rob_retire_inst0_chk_idx          ),
  .rob_retire_inst0_condbr            (rob_retire_inst0_condbr           ),
  .rob_retire_inst0_condbr_taken      (rob_retire_inst0_condbr_taken     ),
  .rob_retire_inst0_ctc_flush         (rob_retire_inst0_ctc_flush        ),
  .rob_retire_inst0_cur_pc            (rob_retire_inst0_cur_pc           ),
  .rob_retire_inst0_data_bkpt         (rob_retire_inst0_data_bkpt        ),
  .rob_retire_inst0_dbg_disable       (rob_retire_inst0_dbg_disable      ),
  .rob_retire_inst0_fp_dirty          (rob_retire_inst0_fp_dirty         ),
  .rob_retire_inst0_iid               (rob_retire_inst0_iid              ),
  .rob_retire_inst0_inst_bkpt         (rob_retire_inst0_inst_bkpt        ),
  .rob_retire_inst0_int_vec           (rob_retire_inst0_int_vec          ),
  .rob_retire_inst0_int_vld           (rob_retire_inst0_int_vld          ),
  .rob_retire_inst0_intmask           (rob_retire_inst0_intmask          ),
  .rob_retire_inst0_jmp               (rob_retire_inst0_jmp              ),
  .rob_retire_inst0_load              (rob_retire_inst0_load             ),
  .rob_retire_inst0_next_pc           (rob_retire_inst0_next_pc          ),
  .rob_retire_inst0_no_spec_hit       (rob_retire_inst0_no_spec_hit      ),
  .rob_retire_inst0_no_spec_mispred   (rob_retire_inst0_no_spec_mispred  ),
  .rob_retire_inst0_no_spec_miss      (rob_retire_inst0_no_spec_miss     ),
  .rob_retire_inst0_num               (rob_retire_inst0_num              ),
  .rob_retire_inst0_pc_offset         (rob_retire_inst0_pc_offset        ),
  .rob_retire_inst0_pcal              (rob_retire_inst0_pcal             ),
  .rob_retire_inst0_pret              (rob_retire_inst0_pret             ),
  .rob_retire_inst0_pst_ereg_vld      (rob_retire_inst0_pst_ereg_vld     ),
  .rob_retire_inst0_pst_preg_vld      (rob_retire_inst0_pst_preg_vld     ),
  .rob_retire_inst0_pst_vreg_vld      (rob_retire_inst0_pst_vreg_vld     ),
  .rob_retire_inst0_ras               (rob_retire_inst0_ras              ),
  .rob_retire_inst0_split             (rob_retire_inst0_split            ),
  .rob_retire_inst0_store             (rob_retire_inst0_store            ),
  .rob_retire_inst0_vec_dirty         (rob_retire_inst0_vec_dirty        ),
  .rob_retire_inst0_vl                (rob_retire_inst0_vl               ),
  .rob_retire_inst0_vl_pred           (rob_retire_inst0_vl_pred          ),
  .rob_retire_inst0_vld               (rob_retire_inst0_vld              ),
  .rob_retire_inst0_vlmul             (rob_retire_inst0_vlmul            ),
  .rob_retire_inst0_vsetvli           (rob_retire_inst0_vsetvli          ),
  .rob_retire_inst0_vsew              (rob_retire_inst0_vsew             ),
  .rob_retire_inst1_bju               (rob_retire_inst1_bju              ),
  .rob_retire_inst1_chk_idx           (rob_retire_inst1_chk_idx          ),
  .rob_retire_inst1_condbr            (rob_retire_inst1_condbr           ),
  .rob_retire_inst1_condbr_taken      (rob_retire_inst1_condbr_taken     ),
  .rob_retire_inst1_cur_pc            (rob_retire_inst1_cur_pc           ),
  .rob_retire_inst1_fp_dirty          (rob_retire_inst1_fp_dirty         ),
  .rob_retire_inst1_jmp               (rob_retire_inst1_jmp              ),
  .rob_retire_inst1_load              (rob_retire_inst1_load             ),
  .rob_retire_inst1_next_pc           (rob_retire_inst1_next_pc          ),
  .rob_retire_inst1_no_spec_hit       (rob_retire_inst1_no_spec_hit      ),
  .rob_retire_inst1_no_spec_mispred   (rob_retire_inst1_no_spec_mispred  ),
  .rob_retire_inst1_no_spec_miss      (rob_retire_inst1_no_spec_miss     ),
  .rob_retire_inst1_num               (rob_retire_inst1_num              ),
  .rob_retire_inst1_pc_offset         (rob_retire_inst1_pc_offset        ),
  .rob_retire_inst1_pst_ereg_vld      (rob_retire_inst1_pst_ereg_vld     ),
  .rob_retire_inst1_pst_preg_vld      (rob_retire_inst1_pst_preg_vld     ),
  .rob_retire_inst1_pst_vreg_vld      (rob_retire_inst1_pst_vreg_vld     ),
  .rob_retire_inst1_split             (rob_retire_inst1_split            ),
  .rob_retire_inst1_store             (rob_retire_inst1_store            ),
  .rob_retire_inst1_vec_dirty         (rob_retire_inst1_vec_dirty        ),
  .rob_retire_inst1_vl                (rob_retire_inst1_vl               ),
  .rob_retire_inst1_vl_pred           (rob_retire_inst1_vl_pred          ),
  .rob_retire_inst1_vld               (rob_retire_inst1_vld              ),
  .rob_retire_inst1_vlmul             (rob_retire_inst1_vlmul            ),
  .rob_retire_inst1_vsetvli           (rob_retire_inst1_vsetvli          ),
  .rob_retire_inst1_vsew              (rob_retire_inst1_vsew             ),
  .rob_retire_inst2_bju               (rob_retire_inst2_bju              ),
  .rob_retire_inst2_chk_idx           (rob_retire_inst2_chk_idx          ),
  .rob_retire_inst2_condbr            (rob_retire_inst2_condbr           ),
  .rob_retire_inst2_condbr_taken      (rob_retire_inst2_condbr_taken     ),
  .rob_retire_inst2_cur_pc            (rob_retire_inst2_cur_pc           ),
  .rob_retire_inst2_fp_dirty          (rob_retire_inst2_fp_dirty         ),
  .rob_retire_inst2_jmp               (rob_retire_inst2_jmp              ),
  .rob_retire_inst2_load              (rob_retire_inst2_load             ),
  .rob_retire_inst2_next_pc           (rob_retire_inst2_next_pc          ),
  .rob_retire_inst2_no_spec_hit       (rob_retire_inst2_no_spec_hit      ),
  .rob_retire_inst2_no_spec_mispred   (rob_retire_inst2_no_spec_mispred  ),
  .rob_retire_inst2_no_spec_miss      (rob_retire_inst2_no_spec_miss     ),
  .rob_retire_inst2_num               (rob_retire_inst2_num              ),
  .rob_retire_inst2_pc_offset         (rob_retire_inst2_pc_offset        ),
  .rob_retire_inst2_pst_ereg_vld      (rob_retire_inst2_pst_ereg_vld     ),
  .rob_retire_inst2_pst_preg_vld      (rob_retire_inst2_pst_preg_vld     ),
  .rob_retire_inst2_pst_vreg_vld      (rob_retire_inst2_pst_vreg_vld     ),
  .rob_retire_inst2_split             (rob_retire_inst2_split            ),
  .rob_retire_inst2_store             (rob_retire_inst2_store            ),
  .rob_retire_inst2_vec_dirty         (rob_retire_inst2_vec_dirty        ),
  .rob_retire_inst2_vl                (rob_retire_inst2_vl               ),
  .rob_retire_inst2_vl_pred           (rob_retire_inst2_vl_pred          ),
  .rob_retire_inst2_vld               (rob_retire_inst2_vld              ),
  .rob_retire_inst2_vlmul             (rob_retire_inst2_vlmul            ),
  .rob_retire_inst2_vsetvli           (rob_retire_inst2_vsetvli          ),
  .rob_retire_inst2_vsew              (rob_retire_inst2_vsew             ),
  .rob_retire_int_srt_en              (rob_retire_int_srt_en             ),
  .rob_retire_rob_cur_pc              (rob_retire_rob_cur_pc             ),
  .rob_top_rob_cur_pc                 (rob_top_rob_cur_pc                ),
  .rtu_cpu_no_retire                  (rtu_cpu_no_retire                 ),
  .rtu_had_bkpt_data_st               (rtu_had_bkpt_data_st              ),
  .rtu_had_data_bkpta_vld             (rtu_had_data_bkpta_vld            ),
  .rtu_had_data_bkptb_vld             (rtu_had_data_bkptb_vld            ),
  .rtu_had_inst0_non_irv_bkpt         (rtu_had_inst0_non_irv_bkpt        ),
  .rtu_had_inst1_non_irv_bkpt         (rtu_had_inst1_non_irv_bkpt        ),
  .rtu_had_inst2_non_irv_bkpt         (rtu_had_inst2_non_irv_bkpt        ),
  .rtu_had_inst_bkpt_inst_vld         (rtu_had_inst_bkpt_inst_vld        ),
  .rtu_had_inst_bkpta_vld             (rtu_had_inst_bkpta_vld            ),
  .rtu_had_inst_bkptb_vld             (rtu_had_inst_bkptb_vld            ),
  .rtu_had_inst_exe_dead              (rtu_had_inst_exe_dead             ),
  .rtu_had_inst_split                 (rtu_had_inst_split                ),
  .rtu_had_retire_inst0_info          (rtu_had_retire_inst0_info         ),
  .rtu_had_retire_inst0_vld           (rtu_had_retire_inst0_vld          ),
  .rtu_had_retire_inst1_info          (rtu_had_retire_inst1_info         ),
  .rtu_had_retire_inst1_vld           (rtu_had_retire_inst1_vld          ),
  .rtu_had_retire_inst2_info          (rtu_had_retire_inst2_info         ),
  .rtu_had_retire_inst2_vld           (rtu_had_retire_inst2_vld          ),
  .rtu_had_xx_mbkpt_chgflow           (rtu_had_xx_mbkpt_chgflow          ),
  .rtu_hpcp_inst0_cur_pc              (rtu_hpcp_inst0_cur_pc             ),
  .rtu_hpcp_inst0_jmp_pc_offset_8m    (rtu_hpcp_inst0_jmp_pc_offset_8m   ),
  .rtu_hpcp_inst1_cur_pc              (rtu_hpcp_inst1_cur_pc             ),
  .rtu_hpcp_inst1_jmp_pc_offset_8m    (rtu_hpcp_inst1_jmp_pc_offset_8m   ),
  .rtu_hpcp_inst2_cur_pc              (rtu_hpcp_inst2_cur_pc             ),
  .rtu_hpcp_inst2_jmp_pc_offset_8m    (rtu_hpcp_inst2_jmp_pc_offset_8m   ),
  .rtu_idu_retire_int_vld             (rtu_idu_retire_int_vld            ),
  .rtu_iu_rob_read0_pcfifo_vld        (rtu_iu_rob_read0_pcfifo_vld       ),
  .rtu_iu_rob_read1_pcfifo_vld        (rtu_iu_rob_read1_pcfifo_vld       ),
  .rtu_iu_rob_read2_pcfifo_vld        (rtu_iu_rob_read2_pcfifo_vld       ),
  .rtu_iu_rob_read_pcfifo_gateclk_vld (rtu_iu_rob_read_pcfifo_gateclk_vld),
  .rtu_pad_retire0                    (rtu_pad_retire0                   ),
  .rtu_pad_retire0_pc                 (rtu_pad_retire0_pc                ),
  .rtu_pad_retire1                    (rtu_pad_retire1                   ),
  .rtu_pad_retire1_pc                 (rtu_pad_retire1_pc                ),
  .rtu_pad_retire2                    (rtu_pad_retire2                   ),
  .rtu_pad_retire2_pc                 (rtu_pad_retire2_pc                ),
  .rtu_yy_xx_commit0                  (rtu_yy_xx_commit0                 ),
  .rtu_yy_xx_commit0_iid              (rtu_yy_xx_commit0_iid             ),
  .rtu_yy_xx_commit1                  (rtu_yy_xx_commit1                 ),
  .rtu_yy_xx_commit1_iid              (rtu_yy_xx_commit1_iid             ),
  .rtu_yy_xx_commit2                  (rtu_yy_xx_commit2                 ),
  .rtu_yy_xx_commit2_iid              (rtu_yy_xx_commit2_iid             ),
  .rtu_yy_xx_retire0                  (rtu_yy_xx_retire0                 ),
  .rtu_yy_xx_retire1                  (rtu_yy_xx_retire1                 ),
  .rtu_yy_xx_retire2                  (rtu_yy_xx_retire2                 ),
  .vfpu_rtu_pipe6_cmplt               (vfpu_rtu_pipe6_cmplt              ),
  .vfpu_rtu_pipe6_iid                 (vfpu_rtu_pipe6_iid                ),
  .vfpu_rtu_pipe7_cmplt               (vfpu_rtu_pipe7_cmplt              ),
  .vfpu_rtu_pipe7_iid                 (vfpu_rtu_pipe7_iid                )
);



// &ModuleEnd; @1859
endmodule


