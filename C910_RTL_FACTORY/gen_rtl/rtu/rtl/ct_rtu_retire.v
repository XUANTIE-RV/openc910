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

// &ModuleBeg; @29
module ct_rtu_retire(
  cp0_rtu_icg_en,
  cp0_rtu_srt_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_rtu_dbg_disable,
  had_rtu_dbg_req_en,
  had_rtu_event_dbgreq,
  had_rtu_fdb,
  had_rtu_hw_dbgreq,
  had_rtu_hw_dbgreq_gateclk,
  had_rtu_non_irv_bkpt_dbgreq,
  had_rtu_pop1_disa,
  had_rtu_trace_dbgreq,
  had_rtu_trace_en,
  had_rtu_xx_jdbreq,
  had_yy_xx_exit_dbg,
  hpcp_rtu_cnt_en,
  lsu_rtu_all_commit_data_vld,
  lsu_rtu_async_expt_addr,
  lsu_rtu_async_expt_vld,
  lsu_rtu_ctc_flush_vld,
  mmu_xx_mmu_en,
  pad_yy_icg_scan_en,
  pst_retire_retired_reg_wb,
  retire_pst_async_flush,
  retire_pst_wb_retire_inst0_ereg_vld,
  retire_pst_wb_retire_inst0_preg_vld,
  retire_pst_wb_retire_inst0_vreg_vld,
  retire_pst_wb_retire_inst1_ereg_vld,
  retire_pst_wb_retire_inst1_preg_vld,
  retire_pst_wb_retire_inst1_vreg_vld,
  retire_pst_wb_retire_inst2_ereg_vld,
  retire_pst_wb_retire_inst2_preg_vld,
  retire_pst_wb_retire_inst2_vreg_vld,
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
  retire_top_ae_cur_state,
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
  rtu_cp0_epc,
  rtu_cp0_expt_gateclk_vld,
  rtu_cp0_expt_mtval,
  rtu_cp0_expt_vld,
  rtu_cp0_fp_dirty_vld,
  rtu_cp0_int_ack,
  rtu_cp0_vec_dirty_vld,
  rtu_cp0_vsetvl_vill,
  rtu_cp0_vsetvl_vl,
  rtu_cp0_vsetvl_vl_vld,
  rtu_cp0_vsetvl_vlmul,
  rtu_cp0_vsetvl_vsew,
  rtu_cp0_vsetvl_vtype_vld,
  rtu_cp0_vstart,
  rtu_cp0_vstart_vld,
  rtu_had_dbg_ack_info,
  rtu_had_dbgreq_ack,
  rtu_had_inst0_bkpt_inst,
  rtu_had_xx_dbg_ack_pc,
  rtu_had_xx_mbkpt_data_ack,
  rtu_had_xx_mbkpt_inst_ack,
  rtu_had_xx_pc,
  rtu_had_xx_pcfifo_inst0_chgflow,
  rtu_had_xx_pcfifo_inst0_condbr,
  rtu_had_xx_pcfifo_inst0_condbr_taken,
  rtu_had_xx_pcfifo_inst0_iid,
  rtu_had_xx_pcfifo_inst0_jmp,
  rtu_had_xx_pcfifo_inst0_next_pc,
  rtu_had_xx_pcfifo_inst0_pcall,
  rtu_had_xx_pcfifo_inst0_preturn,
  rtu_had_xx_pcfifo_inst1_chgflow,
  rtu_had_xx_pcfifo_inst1_condbr,
  rtu_had_xx_pcfifo_inst1_condbr_taken,
  rtu_had_xx_pcfifo_inst1_jmp,
  rtu_had_xx_pcfifo_inst1_next_pc,
  rtu_had_xx_pcfifo_inst1_pcall,
  rtu_had_xx_pcfifo_inst1_preturn,
  rtu_had_xx_pcfifo_inst2_chgflow,
  rtu_had_xx_pcfifo_inst2_condbr,
  rtu_had_xx_pcfifo_inst2_condbr_taken,
  rtu_had_xx_pcfifo_inst2_jmp,
  rtu_had_xx_pcfifo_inst2_next_pc,
  rtu_had_xx_pcfifo_inst2_pcall,
  rtu_had_xx_pcfifo_inst2_preturn,
  rtu_had_xx_split_inst,
  rtu_hpcp_inst0_ack_int,
  rtu_hpcp_inst0_bht_mispred,
  rtu_hpcp_inst0_condbr,
  rtu_hpcp_inst0_jmp,
  rtu_hpcp_inst0_jmp_mispred,
  rtu_hpcp_inst0_num,
  rtu_hpcp_inst0_pc_offset,
  rtu_hpcp_inst0_spec_fail,
  rtu_hpcp_inst0_split,
  rtu_hpcp_inst0_store,
  rtu_hpcp_inst0_vld,
  rtu_hpcp_inst1_condbr,
  rtu_hpcp_inst1_jmp,
  rtu_hpcp_inst1_num,
  rtu_hpcp_inst1_pc_offset,
  rtu_hpcp_inst1_split,
  rtu_hpcp_inst1_store,
  rtu_hpcp_inst1_vld,
  rtu_hpcp_inst2_condbr,
  rtu_hpcp_inst2_jmp,
  rtu_hpcp_inst2_num,
  rtu_hpcp_inst2_pc_offset,
  rtu_hpcp_inst2_split,
  rtu_hpcp_inst2_store,
  rtu_hpcp_inst2_vld,
  rtu_hpcp_trace_inst0_chgflow,
  rtu_hpcp_trace_inst0_next_pc,
  rtu_hpcp_trace_inst1_chgflow,
  rtu_hpcp_trace_inst1_next_pc,
  rtu_hpcp_trace_inst2_chgflow,
  rtu_hpcp_trace_inst2_next_pc,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_idu_flush_stall,
  rtu_idu_retire0_inst_vld,
  rtu_idu_srt_en,
  rtu_ifu_chgflw_pc,
  rtu_ifu_chgflw_vld,
  rtu_ifu_flush,
  rtu_ifu_retire0_chk_idx,
  rtu_ifu_retire0_condbr,
  rtu_ifu_retire0_condbr_taken,
  rtu_ifu_retire0_inc_pc,
  rtu_ifu_retire0_jmp,
  rtu_ifu_retire0_jmp_mispred,
  rtu_ifu_retire0_mispred,
  rtu_ifu_retire0_next_pc,
  rtu_ifu_retire0_pcall,
  rtu_ifu_retire0_preturn,
  rtu_ifu_retire1_chk_idx,
  rtu_ifu_retire1_condbr,
  rtu_ifu_retire1_condbr_taken,
  rtu_ifu_retire1_jmp,
  rtu_ifu_retire2_chk_idx,
  rtu_ifu_retire2_condbr,
  rtu_ifu_retire2_condbr_taken,
  rtu_ifu_retire2_jmp,
  rtu_ifu_retire_inst0_cur_pc,
  rtu_ifu_retire_inst0_load,
  rtu_ifu_retire_inst0_no_spec_hit,
  rtu_ifu_retire_inst0_no_spec_mispred,
  rtu_ifu_retire_inst0_no_spec_miss,
  rtu_ifu_retire_inst0_store,
  rtu_ifu_retire_inst0_vl_hit,
  rtu_ifu_retire_inst0_vl_mispred,
  rtu_ifu_retire_inst0_vl_miss,
  rtu_ifu_retire_inst0_vl_pred,
  rtu_ifu_retire_inst1_cur_pc,
  rtu_ifu_retire_inst1_load,
  rtu_ifu_retire_inst1_no_spec_hit,
  rtu_ifu_retire_inst1_no_spec_mispred,
  rtu_ifu_retire_inst1_no_spec_miss,
  rtu_ifu_retire_inst1_store,
  rtu_ifu_retire_inst1_vl_pred,
  rtu_ifu_retire_inst2_cur_pc,
  rtu_ifu_retire_inst2_load,
  rtu_ifu_retire_inst2_no_spec_hit,
  rtu_ifu_retire_inst2_no_spec_mispred,
  rtu_ifu_retire_inst2_no_spec_miss,
  rtu_ifu_retire_inst2_store,
  rtu_ifu_retire_inst2_vl_pred,
  rtu_ifu_xx_dbgon,
  rtu_ifu_xx_expt_vec,
  rtu_ifu_xx_expt_vld,
  rtu_iu_flush_chgflw_mask,
  rtu_iu_flush_fe,
  rtu_lsu_async_flush,
  rtu_lsu_eret_flush,
  rtu_lsu_expt_flush,
  rtu_lsu_spec_fail_flush,
  rtu_lsu_spec_fail_iid,
  rtu_mmu_bad_vpn,
  rtu_mmu_expt_vld,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_flush,
  rtu_yy_xx_retire0_normal
);

// &Ports; @30
input           cp0_rtu_icg_en;                      
input           cp0_rtu_srt_en;                      
input           cp0_yy_clk_en;                       
input           cpurst_b;                            
input           forever_cpuclk;                      
input           had_rtu_dbg_disable;                 
input           had_rtu_dbg_req_en;                  
input           had_rtu_event_dbgreq;                
input           had_rtu_fdb;                         
input           had_rtu_hw_dbgreq;                   
input           had_rtu_hw_dbgreq_gateclk;           
input           had_rtu_non_irv_bkpt_dbgreq;         
input           had_rtu_pop1_disa;                   
input           had_rtu_trace_dbgreq;                
input           had_rtu_trace_en;                    
input           had_rtu_xx_jdbreq;                   
input           had_yy_xx_exit_dbg;                  
input           hpcp_rtu_cnt_en;                     
input           lsu_rtu_all_commit_data_vld;         
input   [39:0]  lsu_rtu_async_expt_addr;             
input           lsu_rtu_async_expt_vld;              
input           lsu_rtu_ctc_flush_vld;               
input           mmu_xx_mmu_en;                       
input           pad_yy_icg_scan_en;                  
input           pst_retire_retired_reg_wb;           
input           rob_retire_commit0;                  
input           rob_retire_commit1;                  
input           rob_retire_commit2;                  
input           rob_retire_ctc_flush_srt_en;         
input           rob_retire_inst0_bht_mispred;        
input           rob_retire_inst0_bju;                
input   [38:0]  rob_retire_inst0_bju_inc_pc;         
input           rob_retire_inst0_bkpt;               
input   [7 :0]  rob_retire_inst0_chk_idx;            
input           rob_retire_inst0_condbr;             
input           rob_retire_inst0_condbr_taken;       
input           rob_retire_inst0_ctc_flush;          
input   [38:0]  rob_retire_inst0_cur_pc;             
input           rob_retire_inst0_data_bkpt;          
input           rob_retire_inst0_dbg_disable;        
input           rob_retire_inst0_efpc_vld;           
input   [3 :0]  rob_retire_inst0_expt_vec;           
input           rob_retire_inst0_expt_vld;           
input           rob_retire_inst0_fp_dirty;           
input           rob_retire_inst0_high_hw_expt;       
input   [6 :0]  rob_retire_inst0_iid;                
input           rob_retire_inst0_immu_expt;          
input           rob_retire_inst0_inst_bkpt;          
input           rob_retire_inst0_inst_flush;         
input   [4 :0]  rob_retire_inst0_int_vec;            
input           rob_retire_inst0_int_vld;            
input           rob_retire_inst0_intmask;            
input           rob_retire_inst0_jmp;                
input           rob_retire_inst0_jmp_mispred;        
input           rob_retire_inst0_load;               
input   [39:0]  rob_retire_inst0_mtval;              
input   [38:0]  rob_retire_inst0_next_pc;            
input           rob_retire_inst0_no_spec_hit;        
input           rob_retire_inst0_no_spec_mispred;    
input           rob_retire_inst0_no_spec_miss;       
input   [1 :0]  rob_retire_inst0_num;                
input   [2 :0]  rob_retire_inst0_pc_offset;          
input           rob_retire_inst0_pcal;               
input           rob_retire_inst0_pret;               
input           rob_retire_inst0_pst_ereg_vld;       
input           rob_retire_inst0_pst_preg_vld;       
input           rob_retire_inst0_pst_vreg_vld;       
input           rob_retire_inst0_ras;                
input           rob_retire_inst0_spec_fail;          
input           rob_retire_inst0_spec_fail_no_ssf;   
input           rob_retire_inst0_spec_fail_ssf;      
input           rob_retire_inst0_split;              
input           rob_retire_inst0_store;              
input           rob_retire_inst0_vec_dirty;          
input   [7 :0]  rob_retire_inst0_vl;                 
input           rob_retire_inst0_vl_pred;            
input           rob_retire_inst0_vld;                
input   [1 :0]  rob_retire_inst0_vlmul;              
input           rob_retire_inst0_vsetvl;             
input           rob_retire_inst0_vsetvli;            
input   [2 :0]  rob_retire_inst0_vsew;               
input   [6 :0]  rob_retire_inst0_vstart;             
input           rob_retire_inst0_vstart_vld;         
input           rob_retire_inst1_bju;                
input   [7 :0]  rob_retire_inst1_chk_idx;            
input           rob_retire_inst1_condbr;             
input           rob_retire_inst1_condbr_taken;       
input   [38:0]  rob_retire_inst1_cur_pc;             
input           rob_retire_inst1_fp_dirty;           
input           rob_retire_inst1_jmp;                
input           rob_retire_inst1_load;               
input   [38:0]  rob_retire_inst1_next_pc;            
input           rob_retire_inst1_no_spec_hit;        
input           rob_retire_inst1_no_spec_mispred;    
input           rob_retire_inst1_no_spec_miss;       
input   [1 :0]  rob_retire_inst1_num;                
input   [2 :0]  rob_retire_inst1_pc_offset;          
input           rob_retire_inst1_pst_ereg_vld;       
input           rob_retire_inst1_pst_preg_vld;       
input           rob_retire_inst1_pst_vreg_vld;       
input           rob_retire_inst1_split;              
input           rob_retire_inst1_store;              
input           rob_retire_inst1_vec_dirty;          
input   [7 :0]  rob_retire_inst1_vl;                 
input           rob_retire_inst1_vl_pred;            
input           rob_retire_inst1_vld;                
input   [1 :0]  rob_retire_inst1_vlmul;              
input           rob_retire_inst1_vsetvli;            
input   [2 :0]  rob_retire_inst1_vsew;               
input           rob_retire_inst2_bju;                
input   [7 :0]  rob_retire_inst2_chk_idx;            
input           rob_retire_inst2_condbr;             
input           rob_retire_inst2_condbr_taken;       
input   [38:0]  rob_retire_inst2_cur_pc;             
input           rob_retire_inst2_fp_dirty;           
input           rob_retire_inst2_jmp;                
input           rob_retire_inst2_load;               
input   [38:0]  rob_retire_inst2_next_pc;            
input           rob_retire_inst2_no_spec_hit;        
input           rob_retire_inst2_no_spec_mispred;    
input           rob_retire_inst2_no_spec_miss;       
input   [1 :0]  rob_retire_inst2_num;                
input   [2 :0]  rob_retire_inst2_pc_offset;          
input           rob_retire_inst2_pst_ereg_vld;       
input           rob_retire_inst2_pst_preg_vld;       
input           rob_retire_inst2_pst_vreg_vld;       
input           rob_retire_inst2_split;              
input           rob_retire_inst2_store;              
input           rob_retire_inst2_vec_dirty;          
input   [7 :0]  rob_retire_inst2_vl;                 
input           rob_retire_inst2_vl_pred;            
input           rob_retire_inst2_vld;                
input   [1 :0]  rob_retire_inst2_vlmul;              
input           rob_retire_inst2_vsetvli;            
input   [2 :0]  rob_retire_inst2_vsew;               
input           rob_retire_int_srt_en;               
input   [38:0]  rob_retire_rob_cur_pc;               
input           rob_retire_split_spec_fail_srt;      
input   [6 :0]  rob_retire_ssf_iid;                  
output          retire_pst_async_flush;              
output          retire_pst_wb_retire_inst0_ereg_vld; 
output          retire_pst_wb_retire_inst0_preg_vld; 
output          retire_pst_wb_retire_inst0_vreg_vld; 
output          retire_pst_wb_retire_inst1_ereg_vld; 
output          retire_pst_wb_retire_inst1_preg_vld; 
output          retire_pst_wb_retire_inst1_vreg_vld; 
output          retire_pst_wb_retire_inst2_ereg_vld; 
output          retire_pst_wb_retire_inst2_preg_vld; 
output          retire_pst_wb_retire_inst2_vreg_vld; 
output          retire_rob_async_expt_commit_mask;   
output          retire_rob_ctc_flush_req;            
output          retire_rob_dbg_inst0_ack_int;        
output          retire_rob_dbg_inst0_dbg_mode_on;    
output          retire_rob_dbg_inst0_expt_vld;       
output          retire_rob_dbg_inst0_flush;          
output          retire_rob_dbg_inst0_mispred;        
output          retire_rob_flush;                    
output  [4 :0]  retire_rob_flush_cur_state;          
output          retire_rob_flush_gateclk;            
output          retire_rob_inst0_jmp;                
output          retire_rob_inst1_jmp;                
output          retire_rob_inst2_jmp;                
output          retire_rob_inst_flush;               
output          retire_rob_retire_empty;             
output          retire_rob_rt_mask;                  
output          retire_rob_split_fof_flush;          
output          retire_rob_srt_en;                   
output  [1 :0]  retire_top_ae_cur_state;             
output  [63:0]  rtu_cp0_epc;                         
output          rtu_cp0_expt_gateclk_vld;            
output  [63:0]  rtu_cp0_expt_mtval;                  
output          rtu_cp0_expt_vld;                    
output          rtu_cp0_fp_dirty_vld;                
output          rtu_cp0_int_ack;                     
output          rtu_cp0_vec_dirty_vld;               
output          rtu_cp0_vsetvl_vill;                 
output  [7 :0]  rtu_cp0_vsetvl_vl;                   
output          rtu_cp0_vsetvl_vl_vld;               
output  [1 :0]  rtu_cp0_vsetvl_vlmul;                
output  [2 :0]  rtu_cp0_vsetvl_vsew;                 
output          rtu_cp0_vsetvl_vtype_vld;            
output  [6 :0]  rtu_cp0_vstart;                      
output          rtu_cp0_vstart_vld;                  
output          rtu_had_dbg_ack_info;                
output          rtu_had_dbgreq_ack;                  
output          rtu_had_inst0_bkpt_inst;             
output          rtu_had_xx_dbg_ack_pc;               
output          rtu_had_xx_mbkpt_data_ack;           
output          rtu_had_xx_mbkpt_inst_ack;           
output  [38:0]  rtu_had_xx_pc;                       
output          rtu_had_xx_pcfifo_inst0_chgflow;     
output          rtu_had_xx_pcfifo_inst0_condbr;      
output          rtu_had_xx_pcfifo_inst0_condbr_taken; 
output  [6 :0]  rtu_had_xx_pcfifo_inst0_iid;         
output          rtu_had_xx_pcfifo_inst0_jmp;         
output  [38:0]  rtu_had_xx_pcfifo_inst0_next_pc;     
output          rtu_had_xx_pcfifo_inst0_pcall;       
output          rtu_had_xx_pcfifo_inst0_preturn;     
output          rtu_had_xx_pcfifo_inst1_chgflow;     
output          rtu_had_xx_pcfifo_inst1_condbr;      
output          rtu_had_xx_pcfifo_inst1_condbr_taken; 
output          rtu_had_xx_pcfifo_inst1_jmp;         
output  [38:0]  rtu_had_xx_pcfifo_inst1_next_pc;     
output          rtu_had_xx_pcfifo_inst1_pcall;       
output          rtu_had_xx_pcfifo_inst1_preturn;     
output          rtu_had_xx_pcfifo_inst2_chgflow;     
output          rtu_had_xx_pcfifo_inst2_condbr;      
output          rtu_had_xx_pcfifo_inst2_condbr_taken; 
output          rtu_had_xx_pcfifo_inst2_jmp;         
output  [38:0]  rtu_had_xx_pcfifo_inst2_next_pc;     
output          rtu_had_xx_pcfifo_inst2_pcall;       
output          rtu_had_xx_pcfifo_inst2_preturn;     
output          rtu_had_xx_split_inst;               
output          rtu_hpcp_inst0_ack_int;              
output          rtu_hpcp_inst0_bht_mispred;          
output          rtu_hpcp_inst0_condbr;               
output          rtu_hpcp_inst0_jmp;                  
output          rtu_hpcp_inst0_jmp_mispred;          
output  [1 :0]  rtu_hpcp_inst0_num;                  
output  [2 :0]  rtu_hpcp_inst0_pc_offset;            
output          rtu_hpcp_inst0_spec_fail;            
output          rtu_hpcp_inst0_split;                
output          rtu_hpcp_inst0_store;                
output          rtu_hpcp_inst0_vld;                  
output          rtu_hpcp_inst1_condbr;               
output          rtu_hpcp_inst1_jmp;                  
output  [1 :0]  rtu_hpcp_inst1_num;                  
output  [2 :0]  rtu_hpcp_inst1_pc_offset;            
output          rtu_hpcp_inst1_split;                
output          rtu_hpcp_inst1_store;                
output          rtu_hpcp_inst1_vld;                  
output          rtu_hpcp_inst2_condbr;               
output          rtu_hpcp_inst2_jmp;                  
output  [1 :0]  rtu_hpcp_inst2_num;                  
output  [2 :0]  rtu_hpcp_inst2_pc_offset;            
output          rtu_hpcp_inst2_split;                
output          rtu_hpcp_inst2_store;                
output          rtu_hpcp_inst2_vld;                  
output          rtu_hpcp_trace_inst0_chgflow;        
output  [38:0]  rtu_hpcp_trace_inst0_next_pc;        
output          rtu_hpcp_trace_inst1_chgflow;        
output  [38:0]  rtu_hpcp_trace_inst1_next_pc;        
output          rtu_hpcp_trace_inst2_chgflow;        
output  [38:0]  rtu_hpcp_trace_inst2_next_pc;        
output          rtu_idu_flush_fe;                    
output          rtu_idu_flush_is;                    
output          rtu_idu_flush_stall;                 
output          rtu_idu_retire0_inst_vld;            
output          rtu_idu_srt_en;                      
output  [38:0]  rtu_ifu_chgflw_pc;                   
output          rtu_ifu_chgflw_vld;                  
output          rtu_ifu_flush;                       
output  [7 :0]  rtu_ifu_retire0_chk_idx;             
output          rtu_ifu_retire0_condbr;              
output          rtu_ifu_retire0_condbr_taken;        
output  [38:0]  rtu_ifu_retire0_inc_pc;              
output          rtu_ifu_retire0_jmp;                 
output          rtu_ifu_retire0_jmp_mispred;         
output          rtu_ifu_retire0_mispred;             
output  [38:0]  rtu_ifu_retire0_next_pc;             
output          rtu_ifu_retire0_pcall;               
output          rtu_ifu_retire0_preturn;             
output  [7 :0]  rtu_ifu_retire1_chk_idx;             
output          rtu_ifu_retire1_condbr;              
output          rtu_ifu_retire1_condbr_taken;        
output          rtu_ifu_retire1_jmp;                 
output  [7 :0]  rtu_ifu_retire2_chk_idx;             
output          rtu_ifu_retire2_condbr;              
output          rtu_ifu_retire2_condbr_taken;        
output          rtu_ifu_retire2_jmp;                 
output  [38:0]  rtu_ifu_retire_inst0_cur_pc;         
output          rtu_ifu_retire_inst0_load;           
output          rtu_ifu_retire_inst0_no_spec_hit;    
output          rtu_ifu_retire_inst0_no_spec_mispred; 
output          rtu_ifu_retire_inst0_no_spec_miss;   
output          rtu_ifu_retire_inst0_store;          
output          rtu_ifu_retire_inst0_vl_hit;         
output          rtu_ifu_retire_inst0_vl_mispred;     
output          rtu_ifu_retire_inst0_vl_miss;        
output          rtu_ifu_retire_inst0_vl_pred;        
output  [38:0]  rtu_ifu_retire_inst1_cur_pc;         
output          rtu_ifu_retire_inst1_load;           
output          rtu_ifu_retire_inst1_no_spec_hit;    
output          rtu_ifu_retire_inst1_no_spec_mispred; 
output          rtu_ifu_retire_inst1_no_spec_miss;   
output          rtu_ifu_retire_inst1_store;          
output          rtu_ifu_retire_inst1_vl_pred;        
output  [38:0]  rtu_ifu_retire_inst2_cur_pc;         
output          rtu_ifu_retire_inst2_load;           
output          rtu_ifu_retire_inst2_no_spec_hit;    
output          rtu_ifu_retire_inst2_no_spec_mispred; 
output          rtu_ifu_retire_inst2_no_spec_miss;   
output          rtu_ifu_retire_inst2_store;          
output          rtu_ifu_retire_inst2_vl_pred;        
output          rtu_ifu_xx_dbgon;                    
output  [5 :0]  rtu_ifu_xx_expt_vec;                 
output          rtu_ifu_xx_expt_vld;                 
output          rtu_iu_flush_chgflw_mask;            
output          rtu_iu_flush_fe;                     
output          rtu_lsu_async_flush;                 
output          rtu_lsu_eret_flush;                  
output          rtu_lsu_expt_flush;                  
output          rtu_lsu_spec_fail_flush;             
output  [6 :0]  rtu_lsu_spec_fail_iid;               
output  [26:0]  rtu_mmu_bad_vpn;                     
output          rtu_mmu_expt_vld;                    
output          rtu_yy_xx_dbgon;                     
output  [5 :0]  rtu_yy_xx_expt_vec;                  
output          rtu_yy_xx_flush;                     
output          rtu_yy_xx_retire0_normal;            

// &Regs; @31
reg     [1 :0]  ae_cur_state;                        
reg     [1 :0]  ae_next_state;                       
reg     [39:0]  ae_phy_addr;                         
reg             async_flush_ff;                      
reg             dbg_mode_on;                         
reg     [4 :0]  flush_cur_state;                     
reg             flush_eret;                          
reg             flush_expt;                          
reg     [4 :0]  flush_next_state;                    
reg             flush_spec_fail;                     
reg             ifu_dbg_mode_on;                     
reg             retire_ctc_flush_req;                
reg     [39:0]  retire_expt_mtval_src;               
reg             retire_hpcp_inst0_ack_int;           
reg             retire_hpcp_inst0_bht_mispred;       
reg             retire_hpcp_inst0_condbr;            
reg             retire_hpcp_inst0_jmp;               
reg             retire_hpcp_inst0_jmp_mispred;       
reg     [1 :0]  retire_hpcp_inst0_num;               
reg     [2 :0]  retire_hpcp_inst0_pc_offset;         
reg             retire_hpcp_inst0_spec_fail;         
reg             retire_hpcp_inst0_split;             
reg             retire_hpcp_inst0_store;             
reg             retire_hpcp_inst1_condbr;            
reg             retire_hpcp_inst1_jmp;               
reg     [1 :0]  retire_hpcp_inst1_num;               
reg     [2 :0]  retire_hpcp_inst1_pc_offset;         
reg             retire_hpcp_inst1_split;             
reg             retire_hpcp_inst1_store;             
reg             retire_hpcp_inst2_condbr;            
reg             retire_hpcp_inst2_jmp;               
reg     [1 :0]  retire_hpcp_inst2_num;               
reg     [2 :0]  retire_hpcp_inst2_pc_offset;         
reg             retire_hpcp_inst2_split;             
reg             retire_hpcp_inst2_store;             
reg             retire_ifu_chgflw_vld;               
reg             retire_retire_hpcp_inst0_vld;        
reg             retire_retire_hpcp_inst1_vld;        
reg             retire_retire_hpcp_inst2_vld;        
reg     [7 :0]  rtu_cp0_vsetvl_vl;                   
reg     [1 :0]  rtu_cp0_vsetvl_vlmul;                
reg     [2 :0]  rtu_cp0_vsetvl_vsew;                 
reg     [5 :0]  rtu_ifu_xx_expt_vec;                 
reg             rtu_ifu_xx_expt_vld;                 
reg     [6 :0]  spec_fail_iid;                       

// &Wires; @32
wire            async_flush;                         
wire            cp0_rtu_icg_en;                      
wire            cp0_rtu_srt_en;                      
wire            cp0_yy_clk_en;                       
wire            cpurst_b;                            
wire            dbgreq_ack;                          
wire            dbgreq_ack_bkpt;                     
wire            dbgreq_ack_event;                    
wire            dbgreq_ack_gateclk;                  
wire            dbgreq_ack_hw;                       
wire            dbgreq_ack_jdbreq;                   
wire            dbgreq_ack_mbkpt;                    
wire            dbgreq_ack_nonirv;                   
wire            dbgreq_ack_trace;                    
wire            dbgreq_ack_without_event;            
wire            forever_cpuclk;                      
wire            had_rtu_dbg_disable;                 
wire            had_rtu_dbg_req_en;                  
wire            had_rtu_event_dbgreq;                
wire            had_rtu_fdb;                         
wire            had_rtu_hw_dbgreq;                   
wire            had_rtu_hw_dbgreq_gateclk;           
wire            had_rtu_non_irv_bkpt_dbgreq;         
wire            had_rtu_pop1_disa;                   
wire            had_rtu_trace_dbgreq;                
wire            had_rtu_trace_en;                    
wire            had_rtu_xx_jdbreq;                   
wire            had_yy_xx_exit_dbg;                  
wire            hpcp_clk;                            
wire            hpcp_clk_en;                         
wire            hpcp_rtu_cnt_en;                     
wire            lsu_rtu_all_commit_data_vld;         
wire    [39:0]  lsu_rtu_async_expt_addr;             
wire            lsu_rtu_async_expt_vld;              
wire            lsu_rtu_ctc_flush_vld;               
wire            mmu_xx_mmu_en;                       
wire            pad_yy_icg_scan_en;                  
wire            pst_retire_retired_reg_wb;           
wire            retire_ack_int;                      
wire            retire_ack_mmu;                      
wire            retire_async_expt;                   
wire            retire_async_expt_no_commit;         
wire            retire_async_expt_no_retire;         
wire            retire_async_expt_sm_no_idle;        
wire    [5 :0]  retire_async_expt_vec;               
wire            retire_async_expt_vld;               
wire            retire_clk;                          
wire            retire_clk_en;                       
wire    [38:0]  retire_cp0_epc;                      
wire            retire_ctc_flush_lsu_req;            
wire            retire_expt_gateclk_vld;             
wire            retire_expt_inst;                    
wire            retire_expt_int;                     
wire            retire_expt_mmu_bad_vpn;             
wire    [63:0]  retire_expt_mtval;                   
wire    [5 :0]  retire_expt_vec;                     
wire            retire_expt_vld;                     
wire            retire_flush_be;                     
wire            retire_flush_fe;                     
wire            retire_flush_is;                     
wire            retire_flush_pipeline_empty;         
wire            retire_flush_sm_no_idle;             
wire    [5 :0]  retire_ifu_expt_vec;                 
wire            retire_ifu_expt_vld;                 
wire            retire_inst0_condbr;                 
wire    [38:0]  retire_inst0_epc;                    
wire            retire_inst0_flush;                  
wire            retire_inst0_flush_gateclk;          
wire            retire_inst0_inst_flush;             
wire            retire_inst0_jmp;                    
wire            retire_inst0_jmp_mispred;            
wire            retire_inst0_mispred;                
wire            retire_inst0_normal_retire;          
wire            retire_inst0_vsetvl_illegal;         
wire            retire_inst0_vsetvl_vl_fof;          
wire            retire_inst0_vsetvl_vl_mispred;      
wire            retire_inst0_vsetvli;                
wire            retire_inst0_vsetvlx;                
wire            retire_inst1_condbr;                 
wire            retire_inst1_jmp;                    
wire            retire_inst1_normal_retire;          
wire            retire_inst1_vsetvli;                
wire            retire_inst2_condbr;                 
wire            retire_inst2_jmp;                    
wire            retire_inst2_normal_retire;          
wire            retire_inst2_vsetvli;                
wire            retire_pst_async_flush;              
wire            retire_pst_wb_retire_inst0_ereg_vld; 
wire            retire_pst_wb_retire_inst0_preg_vld; 
wire            retire_pst_wb_retire_inst0_vreg_vld; 
wire            retire_pst_wb_retire_inst1_ereg_vld; 
wire            retire_pst_wb_retire_inst1_preg_vld; 
wire            retire_pst_wb_retire_inst1_vreg_vld; 
wire            retire_pst_wb_retire_inst2_ereg_vld; 
wire            retire_pst_wb_retire_inst2_preg_vld; 
wire            retire_pst_wb_retire_inst2_vreg_vld; 
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
wire            retire_srt_en;                       
wire    [1 :0]  retire_top_ae_cur_state;             
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
wire    [63:0]  rtu_cp0_epc;                         
wire            rtu_cp0_expt_gateclk_vld;            
wire    [63:0]  rtu_cp0_expt_mtval;                  
wire            rtu_cp0_expt_vld;                    
wire            rtu_cp0_fp_dirty_vld;                
wire            rtu_cp0_int_ack;                     
wire            rtu_cp0_vec_dirty_vld;               
wire            rtu_cp0_vsetvl_vill;                 
wire            rtu_cp0_vsetvl_vl_vld;               
wire            rtu_cp0_vsetvl_vtype_vld;            
wire    [6 :0]  rtu_cp0_vstart;                      
wire            rtu_cp0_vstart_vld;                  
wire            rtu_had_dbg_ack_info;                
wire            rtu_had_dbgreq_ack;                  
wire            rtu_had_inst0_bkpt_inst;             
wire            rtu_had_xx_dbg_ack_pc;               
wire            rtu_had_xx_mbkpt_data_ack;           
wire            rtu_had_xx_mbkpt_inst_ack;           
wire    [38:0]  rtu_had_xx_pc;                       
wire            rtu_had_xx_pcfifo_inst0_chgflow;     
wire            rtu_had_xx_pcfifo_inst0_condbr;      
wire            rtu_had_xx_pcfifo_inst0_condbr_taken; 
wire    [6 :0]  rtu_had_xx_pcfifo_inst0_iid;         
wire            rtu_had_xx_pcfifo_inst0_jmp;         
wire    [38:0]  rtu_had_xx_pcfifo_inst0_next_pc;     
wire            rtu_had_xx_pcfifo_inst0_pcall;       
wire            rtu_had_xx_pcfifo_inst0_preturn;     
wire            rtu_had_xx_pcfifo_inst1_chgflow;     
wire            rtu_had_xx_pcfifo_inst1_condbr;      
wire            rtu_had_xx_pcfifo_inst1_condbr_taken; 
wire            rtu_had_xx_pcfifo_inst1_jmp;         
wire    [38:0]  rtu_had_xx_pcfifo_inst1_next_pc;     
wire            rtu_had_xx_pcfifo_inst1_pcall;       
wire            rtu_had_xx_pcfifo_inst1_preturn;     
wire            rtu_had_xx_pcfifo_inst2_chgflow;     
wire            rtu_had_xx_pcfifo_inst2_condbr;      
wire            rtu_had_xx_pcfifo_inst2_condbr_taken; 
wire            rtu_had_xx_pcfifo_inst2_jmp;         
wire    [38:0]  rtu_had_xx_pcfifo_inst2_next_pc;     
wire            rtu_had_xx_pcfifo_inst2_pcall;       
wire            rtu_had_xx_pcfifo_inst2_preturn;     
wire            rtu_had_xx_split_inst;               
wire            rtu_hpcp_inst0_ack_int;              
wire            rtu_hpcp_inst0_bht_mispred;          
wire            rtu_hpcp_inst0_condbr;               
wire            rtu_hpcp_inst0_jmp;                  
wire            rtu_hpcp_inst0_jmp_mispred;          
wire    [1 :0]  rtu_hpcp_inst0_num;                  
wire    [2 :0]  rtu_hpcp_inst0_pc_offset;            
wire            rtu_hpcp_inst0_spec_fail;            
wire            rtu_hpcp_inst0_split;                
wire            rtu_hpcp_inst0_store;                
wire            rtu_hpcp_inst0_vld;                  
wire            rtu_hpcp_inst1_condbr;               
wire            rtu_hpcp_inst1_jmp;                  
wire    [1 :0]  rtu_hpcp_inst1_num;                  
wire    [2 :0]  rtu_hpcp_inst1_pc_offset;            
wire            rtu_hpcp_inst1_split;                
wire            rtu_hpcp_inst1_store;                
wire            rtu_hpcp_inst1_vld;                  
wire            rtu_hpcp_inst2_condbr;               
wire            rtu_hpcp_inst2_jmp;                  
wire    [1 :0]  rtu_hpcp_inst2_num;                  
wire    [2 :0]  rtu_hpcp_inst2_pc_offset;            
wire            rtu_hpcp_inst2_split;                
wire            rtu_hpcp_inst2_store;                
wire            rtu_hpcp_inst2_vld;                  
wire            rtu_hpcp_trace_inst0_chgflow;        
wire    [38:0]  rtu_hpcp_trace_inst0_next_pc;        
wire            rtu_hpcp_trace_inst1_chgflow;        
wire    [38:0]  rtu_hpcp_trace_inst1_next_pc;        
wire            rtu_hpcp_trace_inst2_chgflow;        
wire    [38:0]  rtu_hpcp_trace_inst2_next_pc;        
wire            rtu_idu_flush_fe;                    
wire            rtu_idu_flush_is;                    
wire            rtu_idu_flush_stall;                 
wire            rtu_idu_retire0_inst_vld;            
wire            rtu_idu_srt_en;                      
wire    [38:0]  rtu_ifu_chgflw_pc;                   
wire            rtu_ifu_chgflw_vld;                  
wire            rtu_ifu_flush;                       
wire    [7 :0]  rtu_ifu_retire0_chk_idx;             
wire            rtu_ifu_retire0_condbr;              
wire            rtu_ifu_retire0_condbr_taken;        
wire    [38:0]  rtu_ifu_retire0_inc_pc;              
wire            rtu_ifu_retire0_jmp;                 
wire            rtu_ifu_retire0_jmp_mispred;         
wire            rtu_ifu_retire0_mispred;             
wire    [38:0]  rtu_ifu_retire0_next_pc;             
wire            rtu_ifu_retire0_pcall;               
wire            rtu_ifu_retire0_preturn;             
wire    [7 :0]  rtu_ifu_retire1_chk_idx;             
wire            rtu_ifu_retire1_condbr;              
wire            rtu_ifu_retire1_condbr_taken;        
wire            rtu_ifu_retire1_jmp;                 
wire    [7 :0]  rtu_ifu_retire2_chk_idx;             
wire            rtu_ifu_retire2_condbr;              
wire            rtu_ifu_retire2_condbr_taken;        
wire            rtu_ifu_retire2_jmp;                 
wire    [38:0]  rtu_ifu_retire_inst0_cur_pc;         
wire            rtu_ifu_retire_inst0_load;           
wire            rtu_ifu_retire_inst0_no_spec_hit;    
wire            rtu_ifu_retire_inst0_no_spec_mispred; 
wire            rtu_ifu_retire_inst0_no_spec_miss;   
wire            rtu_ifu_retire_inst0_store;          
wire    [7 :0]  rtu_ifu_retire_inst0_vl;             
wire            rtu_ifu_retire_inst0_vl_hit;         
wire            rtu_ifu_retire_inst0_vl_mispred;     
wire            rtu_ifu_retire_inst0_vl_miss;        
wire            rtu_ifu_retire_inst0_vl_pred;        
wire    [38:0]  rtu_ifu_retire_inst1_cur_pc;         
wire            rtu_ifu_retire_inst1_load;           
wire            rtu_ifu_retire_inst1_no_spec_hit;    
wire            rtu_ifu_retire_inst1_no_spec_mispred; 
wire            rtu_ifu_retire_inst1_no_spec_miss;   
wire            rtu_ifu_retire_inst1_store;          
wire    [7 :0]  rtu_ifu_retire_inst1_vl;             
wire            rtu_ifu_retire_inst1_vl_pred;        
wire    [38:0]  rtu_ifu_retire_inst2_cur_pc;         
wire            rtu_ifu_retire_inst2_load;           
wire            rtu_ifu_retire_inst2_no_spec_hit;    
wire            rtu_ifu_retire_inst2_no_spec_mispred; 
wire            rtu_ifu_retire_inst2_no_spec_miss;   
wire            rtu_ifu_retire_inst2_store;          
wire    [7 :0]  rtu_ifu_retire_inst2_vl;             
wire            rtu_ifu_retire_inst2_vl_pred;        
wire            rtu_ifu_xx_dbgon;                    
wire            rtu_iu_flush_chgflw_mask;            
wire            rtu_iu_flush_fe;                     
wire            rtu_lsu_async_flush;                 
wire            rtu_lsu_eret_flush;                  
wire            rtu_lsu_expt_flush;                  
wire            rtu_lsu_spec_fail_flush;             
wire    [6 :0]  rtu_lsu_spec_fail_iid;               
wire    [26:0]  rtu_mmu_bad_vpn;                     
wire            rtu_mmu_expt_vld;                    
wire            rtu_yy_xx_dbgon;                     
wire    [5 :0]  rtu_yy_xx_expt_vec;                  
wire            rtu_yy_xx_flush;                     
wire            rtu_yy_xx_retire0_normal;            
wire            sm_clk;                              
wire            sm_clk_en;                           



//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign retire_clk_en = retire_expt_gateclk_vld
                       || ifu_dbg_mode_on
                       || dbgreq_ack_gateclk
                       || dbgreq_ack_jdbreq
                       || retire_inst0_inst_flush
                       || retire_async_expt_vld
                       || async_flush_ff
                       || retire_ifu_chgflw_vld
                       || rtu_ifu_xx_expt_vld;
// &Instance("gated_clk_cell", "x_retire_gated_clk"); @47
gated_clk_cell  x_retire_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (retire_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (retire_clk_en     ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @48
//          .external_en (1'b0), @49
//          .global_en   (cp0_yy_clk_en), @50
//          .module_en   (cp0_rtu_icg_en), @51
//          .local_en    (retire_clk_en), @52
//          .clk_out     (retire_clk)); @53

assign sm_clk_en = retire_inst0_flush_gateclk
                   || retire_flush_sm_no_idle
                   || lsu_rtu_async_expt_vld
                   || lsu_rtu_ctc_flush_vld
                   || retire_async_expt_sm_no_idle
                   || retire_ctc_flush_req;
// &Instance("gated_clk_cell", "x_sm_gated_clk"); @61
gated_clk_cell  x_sm_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sm_clk            ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sm_clk_en         ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @62
//          .external_en (1'b0), @63
//          .global_en   (cp0_yy_clk_en), @64
//          .module_en   (cp0_rtu_icg_en), @65
//          .local_en    (sm_clk_en), @66
//          .clk_out     (sm_clk)); @67

assign hpcp_clk_en = hpcp_rtu_cnt_en
                     && rob_retire_inst0_vld
                     || retire_retire_hpcp_inst0_vld
                     || retire_retire_hpcp_inst1_vld
                     || retire_retire_hpcp_inst2_vld;
// &Instance("gated_clk_cell", "x_hpcp_gated_clk"); @75
gated_clk_cell  x_hpcp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (hpcp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (hpcp_clk_en       ),
  .module_en          (cp0_rtu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @76
//          .external_en (1'b0), @77
//          .global_en   (cp0_yy_clk_en), @78
//          .module_en   (cp0_rtu_icg_en), @79
//          .local_en    (hpcp_clk_en), @80
//          .clk_out     (hpcp_clk)); @81

//==========================================================
//                  Single Retire Mode
//==========================================================
//when meet following condition, RTU will enable single retire
//mode: IDU stop folding, ROB read 1/2 will not valid
assign retire_srt_en     = had_rtu_pop1_disa
                           || had_rtu_dbg_req_en
                           || cp0_rtu_srt_en;

assign retire_rob_srt_en = retire_srt_en
                           || rob_retire_split_spec_fail_srt
                           || rob_retire_int_srt_en
                           || rob_retire_ctc_flush_srt_en;
assign rtu_idu_srt_en    = retire_srt_en;

//==========================================================
//                   Retire valid signals
//==========================================================
//retire inst 0 may expt vld, but retire inst 1/2 are always normal
assign retire_inst0_normal_retire     = rob_retire_inst0_vld
                                        && !rob_retire_inst0_expt_vld;
assign retire_inst1_normal_retire     = rob_retire_inst1_vld;
assign retire_inst2_normal_retire     = rob_retire_inst2_vld;

//rename for output
assign rtu_idu_retire0_inst_vld       = rob_retire_inst0_vld;
assign rtu_yy_xx_retire0_normal       = retire_inst0_normal_retire;
  
//if inst bkpt or expt vld, retire inst0 cannot write back
assign retire_pst_wb_retire_inst0_preg_vld = rob_retire_inst0_pst_preg_vld; 
assign retire_pst_wb_retire_inst1_preg_vld = rob_retire_inst1_pst_preg_vld; 
assign retire_pst_wb_retire_inst2_preg_vld = rob_retire_inst2_pst_preg_vld; 
//if inst bkpt or expt vld, retire inst0 cannot write back
assign retire_pst_wb_retire_inst0_vreg_vld = rob_retire_inst0_pst_vreg_vld; 
assign retire_pst_wb_retire_inst1_vreg_vld = rob_retire_inst1_pst_vreg_vld; 
assign retire_pst_wb_retire_inst2_vreg_vld = rob_retire_inst2_pst_vreg_vld; 
//expt instruction should write back ereg value, and ereg value should be RETIRE
assign retire_pst_wb_retire_inst0_ereg_vld = rob_retire_inst0_pst_ereg_vld; 
assign retire_pst_wb_retire_inst1_ereg_vld = rob_retire_inst1_pst_ereg_vld; 
assign retire_pst_wb_retire_inst2_ereg_vld = rob_retire_inst2_pst_ereg_vld; 

//==========================================================
//             Retire (Inst 0) Exception Process
//==========================================================
//Exception, Interrupt and debug can ONLY hit retire inst 0

//----------------------------------------------------------
//                 Prepare Exception Source
//----------------------------------------------------------
assign retire_expt_inst          = rob_retire_inst0_expt_vld;
assign retire_expt_mmu_bad_vpn   = rob_retire_inst0_expt_vld
                                   && (rob_retire_inst0_expt_vec[3:2] == 2'b11);

//----------------------------------------------------------
//                 Prepare Interrupt Source
//----------------------------------------------------------
assign retire_expt_int           = rob_retire_inst0_int_vld
                                   && !rob_retire_inst0_split
                                   && !rob_retire_inst0_intmask;

//----------------------------------------------------------
//                    Exception Vector
//----------------------------------------------------------
assign retire_expt_vec[5:0] = (retire_expt_int)
                              ? {1'b1, rob_retire_inst0_int_vec[4:0]}
                              : {2'b0, rob_retire_inst0_expt_vec[3:0]};

//----------------------------------------------------------
//                         MTVAL
//----------------------------------------------------------
// &CombBeg; @157
always @( rob_retire_inst0_mtval[39:0]
       or retire_async_expt_vld
       or rob_retire_inst0_immu_expt
       or rob_retire_inst0_next_pc[38:11]
       or ae_phy_addr[39:0]
       or retire_ack_int
       or rob_retire_inst0_high_hw_expt
       or rob_retire_inst0_cur_pc[38:0])
begin
  if(retire_async_expt_vld)
    retire_expt_mtval_src[39:0] = ae_phy_addr[39:0];
  else if(retire_ack_int)
    retire_expt_mtval_src[39:0] = 40'b0;
  else if(rob_retire_inst0_immu_expt && !rob_retire_inst0_high_hw_expt)
    retire_expt_mtval_src[39:0] = {rob_retire_inst0_cur_pc[38:0],1'b0};
  //32 bit inst cross 4k page fault, high half-word is 4k align of next pc
  else if(rob_retire_inst0_immu_expt)
    retire_expt_mtval_src[39:0] = {rob_retire_inst0_next_pc[38:11],12'b0};
  else
    retire_expt_mtval_src[39:0] = rob_retire_inst0_mtval[39:0];
// &CombEnd; @169
end

assign retire_expt_mtval[63:0] =
  mmu_xx_mmu_en && !retire_async_expt_vld
  ? {{24{retire_expt_mtval_src[39]}}, retire_expt_mtval_src[39:0]}
  : {24'b0, retire_expt_mtval_src[39:0]};

//----------------------------------------------------------
//             Exception and Interrupt Priority
//----------------------------------------------------------
assign retire_ack_int     = retire_expt_int;

assign retire_ack_mmu     = retire_expt_inst
                            && retire_expt_mmu_bad_vpn
                            && !retire_expt_int;

assign retire_expt_vld    = rob_retire_inst0_vld
                            && !dbgreq_ack
                            && (retire_expt_inst
                                || retire_expt_int);

assign retire_expt_gateclk_vld = rob_retire_inst0_vld
                                 && (retire_expt_inst
                                     || retire_expt_int);

assign retire_rob_dbg_inst0_expt_vld = retire_expt_gateclk_vld;

//----------------------------------------------------------
//            IFU Exception and Interrupt Output
//----------------------------------------------------------
// &Force("output","rtu_ifu_xx_expt_vld"); @199
// &Force("output","rtu_ifu_xx_expt_vec"); @200
assign retire_ifu_expt_vld  = (retire_expt_vld || retire_async_expt_vld)
                              && !dbg_mode_on;

always @(posedge retire_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_ifu_xx_expt_vld <= 1'b0;
  else
    rtu_ifu_xx_expt_vld <= retire_ifu_expt_vld;
end

//assign rtu_idu_vec_addr_not_fetched = rtu_ifu_xx_expt_vld;

assign retire_ifu_expt_vec[5:0] = (retire_async_expt_vld) 
                                  ? retire_async_expt_vec[5:0]
                                  : retire_expt_vec[5:0];

assign rtu_yy_xx_expt_vec[5:0]  = retire_ifu_expt_vec[5:0];

always @(posedge retire_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rtu_ifu_xx_expt_vec[5:0] <= 6'b0;
  else if(retire_ifu_expt_vld)
    rtu_ifu_xx_expt_vec[5:0] <= retire_ifu_expt_vec[5:0];
  else
    rtu_ifu_xx_expt_vec[5:0] <= rtu_ifu_xx_expt_vec[5:0];
end

//----------------------------------------------------------
//            MMU Exception and Interrupt Output
//----------------------------------------------------------
assign rtu_mmu_expt_vld        = rob_retire_inst0_vld
                                 && retire_ack_mmu
                                 && !dbg_mode_on;

assign rtu_mmu_bad_vpn[26:0]   = retire_expt_mtval[38:12];

//----------------------------------------------------------
//            CP0 Exception and Interrupt Output
//----------------------------------------------------------
// &Force("output","rtu_cp0_expt_vld"); @242
assign rtu_cp0_expt_vld        = (retire_expt_vld || retire_async_expt_vld)
                                 && !dbg_mode_on;
assign rtu_cp0_expt_gateclk_vld = retire_expt_gateclk_vld
                                  || retire_async_expt_vld;

assign rtu_cp0_expt_mtval[63:0] = retire_expt_mtval[63:0];

assign retire_inst0_epc[38:0]  = (rob_retire_inst0_expt_vld
                                  || rob_retire_inst0_inst_bkpt)
                                 ? rob_retire_inst0_cur_pc[38:0]
                                 : rob_retire_inst0_next_pc[38:0];
assign retire_cp0_epc[38:0]    = (retire_async_expt_vld)
                                 ? rob_retire_rob_cur_pc[38:0]
                                 : retire_inst0_epc[38:0];
assign rtu_cp0_epc[63:0]       = mmu_xx_mmu_en
                                 ? {{24{retire_cp0_epc[38]}},
                                        retire_cp0_epc[38:0],1'b0}
                                 : {24'b0, retire_cp0_epc[38:0],1'b0};

assign rtu_cp0_int_ack         = rob_retire_inst0_vld
                                 && !dbgreq_ack
                                 && !dbg_mode_on
                                 && retire_ack_int;

assign retire_rob_dbg_inst0_ack_int = rob_retire_inst0_vld
                                      && retire_ack_int;

assign rtu_cp0_fp_dirty_vld    = rob_retire_inst0_pst_vreg_vld
                                 && rob_retire_inst0_fp_dirty
                              || rob_retire_inst1_pst_vreg_vld
                                 && rob_retire_inst1_fp_dirty
                              || rob_retire_inst2_pst_vreg_vld
                                 && rob_retire_inst2_fp_dirty;

assign rtu_cp0_vec_dirty_vld   = rob_retire_inst0_pst_vreg_vld
                                 && rob_retire_inst0_vec_dirty
                              || rob_retire_inst1_pst_vreg_vld
                                 && rob_retire_inst1_vec_dirty
                              || rob_retire_inst2_pst_vreg_vld
                                 && rob_retire_inst2_vec_dirty;

//----------------------------------------------------------
//                  CP0 Vector Values
//----------------------------------------------------------
assign retire_inst0_vsetvli           = retire_inst0_normal_retire
                                        && rob_retire_inst0_vsetvli;
assign retire_inst1_vsetvli           = retire_inst1_normal_retire
                                        && rob_retire_inst1_vsetvli;
assign retire_inst2_vsetvli           = retire_inst2_normal_retire
                                        && rob_retire_inst2_vsetvli;
assign retire_inst0_vsetvlx           = retire_inst0_normal_retire
                                        && rob_retire_inst0_vsetvl;

assign retire_inst0_vsetvl_illegal    = retire_inst0_vsetvlx
                                        && rob_retire_inst0_mtval[13];
assign retire_inst0_vsetvl_vl_mispred = retire_inst0_vsetvlx
                                        && rob_retire_inst0_mtval[14];
assign retire_inst0_vsetvl_vl_fof     = retire_inst0_vsetvlx
                                        && rob_retire_inst0_mtval[15];

assign retire_rob_split_fof_flush     = retire_inst0_vsetvl_vl_fof
                                        && rob_retire_inst0_split;

assign rtu_cp0_vsetvl_vill            = retire_inst0_vsetvl_illegal;

assign rtu_cp0_vsetvl_vl_vld          = retire_inst0_vsetvli
                                     || retire_inst1_vsetvli
                                     || retire_inst2_vsetvli
                                     || retire_inst0_vsetvl_vl_mispred
                                     || retire_inst0_vsetvl_vl_fof
                                     || retire_inst0_vsetvl_illegal;

assign rtu_cp0_vsetvl_vtype_vld       = retire_inst0_vsetvli
                                     || retire_inst1_vsetvli
                                     || retire_inst2_vsetvli
                                     || retire_inst0_vsetvlx
                                        && !retire_inst0_vsetvl_vl_fof;

// &CombBeg; @321
always @( rob_retire_inst0_vsew[2:0]
       or rob_retire_inst0_vl[7:0]
       or rob_retire_inst0_vlmul[1:0]
       or rob_retire_inst2_vsew[2:0]
       or retire_inst2_vsetvli
       or rob_retire_inst1_vl[7:0]
       or rob_retire_inst1_vlmul[1:0]
       or retire_inst0_vsetvlx
       or rob_retire_inst2_vlmul[1:0]
       or retire_inst1_vsetvli
       or rob_retire_inst1_vsew[2:0]
       or rob_retire_inst0_mtval[12:0]
       or rob_retire_inst2_vl[7:0])
begin
  if(retire_inst0_vsetvlx) begin
    rtu_cp0_vsetvl_vlmul[1:0] = rob_retire_inst0_mtval[1:0];
    rtu_cp0_vsetvl_vsew[2:0]  = rob_retire_inst0_mtval[4:2];
    rtu_cp0_vsetvl_vl[7:0]    = rob_retire_inst0_mtval[12:5];
  end
  else if(retire_inst2_vsetvli) begin
    rtu_cp0_vsetvl_vlmul[1:0] = rob_retire_inst2_vlmul[1:0];
    rtu_cp0_vsetvl_vsew[2:0]  = rob_retire_inst2_vsew[2:0];
    rtu_cp0_vsetvl_vl[7:0]    = rob_retire_inst2_vl[7:0];
  end
  else if(retire_inst1_vsetvli) begin
    rtu_cp0_vsetvl_vlmul[1:0] = rob_retire_inst1_vlmul[1:0];
    rtu_cp0_vsetvl_vsew[2:0]  = rob_retire_inst1_vsew[2:0];
    rtu_cp0_vsetvl_vl[7:0]    = rob_retire_inst1_vl[7:0];
  end
  else begin
    rtu_cp0_vsetvl_vlmul[1:0] = rob_retire_inst0_vlmul[1:0];
    rtu_cp0_vsetvl_vsew[2:0]  = rob_retire_inst0_vsew[2:0];
    rtu_cp0_vsetvl_vl[7:0]    = rob_retire_inst0_vl[7:0];
  end
// &CombEnd; @342
end

assign rtu_cp0_vstart_vld                = rob_retire_inst0_vld
                                           && rob_retire_inst0_vstart_vld;
assign rtu_cp0_vstart[6:0]               = rob_retire_inst0_vstart[6:0];

//==========================================================
//                    RTU IFU Interface
//==========================================================
assign rtu_ifu_retire0_mispred           = retire_inst0_normal_retire
                                           && (rob_retire_inst0_bht_mispred
                                            || rob_retire_inst0_jmp_mispred);

assign retire_rob_dbg_inst0_mispred      = retire_inst0_normal_retire
                                           && (rob_retire_inst0_bht_mispred
                                            || rob_retire_inst0_jmp_mispred);

//----------------------------------------------------------
//                    Conditional Branch
//----------------------------------------------------------
assign retire_inst0_condbr               = retire_inst0_normal_retire
                                           && rob_retire_inst0_condbr;
assign retire_inst1_condbr               = retire_inst1_normal_retire
                                           && rob_retire_inst1_condbr;
assign retire_inst2_condbr               = retire_inst2_normal_retire
                                           && rob_retire_inst2_condbr;

assign rtu_ifu_retire0_condbr            = retire_inst0_condbr;
assign rtu_ifu_retire1_condbr            = retire_inst1_condbr;
assign rtu_ifu_retire2_condbr            = retire_inst2_condbr;

assign rtu_ifu_retire0_condbr_taken      = retire_inst0_normal_retire
                                           && rob_retire_inst0_condbr_taken;
assign rtu_ifu_retire1_condbr_taken      = retire_inst1_normal_retire
                                           && rob_retire_inst1_condbr_taken;
assign rtu_ifu_retire2_condbr_taken      = retire_inst2_normal_retire
                                           && rob_retire_inst2_condbr_taken;

//----------------------------------------------------------
//                      Return Stack
//----------------------------------------------------------
assign rtu_ifu_retire0_pcall             = retire_inst0_normal_retire
                                           && rob_retire_inst0_pcal;
assign rtu_ifu_retire0_preturn           = retire_inst0_normal_retire
                                           && rob_retire_inst0_pret;
assign rtu_ifu_retire0_inc_pc[38:0]      = rob_retire_inst0_bju_inc_pc[38:0];

//----------------------------------------------------------
//                      Indirect Jump
//----------------------------------------------------------
assign retire_inst0_jmp_mispred          = retire_inst0_normal_retire
                                           && rob_retire_inst0_jmp_mispred
                                           && !rob_retire_inst0_pret;

assign rtu_ifu_retire0_jmp_mispred       = retire_inst0_jmp_mispred;

assign retire_inst0_jmp                  = retire_inst0_normal_retire
                                           && rob_retire_inst0_jmp
                                           && !rob_retire_inst0_pret;
assign retire_inst1_jmp                  = retire_inst1_normal_retire
                                           && rob_retire_inst1_jmp;
assign retire_inst2_jmp                  = retire_inst2_normal_retire
                                           && rob_retire_inst2_jmp;

assign rtu_ifu_retire0_jmp               = retire_inst0_jmp;
assign rtu_ifu_retire1_jmp               = retire_inst1_jmp;
assign rtu_ifu_retire2_jmp               = retire_inst2_jmp;

assign rtu_ifu_retire0_chk_idx[7:0]      = rob_retire_inst0_chk_idx[7:0];
assign rtu_ifu_retire1_chk_idx[7:0]      = rob_retire_inst1_chk_idx[7:0];
assign rtu_ifu_retire2_chk_idx[7:0]      = rob_retire_inst2_chk_idx[7:0];
assign rtu_ifu_retire0_next_pc[38:0]     = rob_retire_inst0_next_pc[38:0];

//----------------------------------------------------------
//                         No Spec
//----------------------------------------------------------
assign rtu_ifu_retire_inst0_load         = retire_inst0_normal_retire
                                           && rob_retire_inst0_load;
assign rtu_ifu_retire_inst1_load         = retire_inst1_normal_retire
                                           && rob_retire_inst1_load;
assign rtu_ifu_retire_inst2_load         = retire_inst2_normal_retire
                                           && rob_retire_inst2_load;

assign rtu_ifu_retire_inst0_store        = retire_inst0_normal_retire
                                           && rob_retire_inst0_store;
assign rtu_ifu_retire_inst1_store        = retire_inst1_normal_retire
                                           && rob_retire_inst1_store;
assign rtu_ifu_retire_inst2_store        = retire_inst2_normal_retire
                                           && rob_retire_inst2_store;

assign rtu_ifu_retire_inst0_no_spec_hit     = rob_retire_inst0_no_spec_hit;
assign rtu_ifu_retire_inst1_no_spec_hit     = rob_retire_inst1_no_spec_hit;
assign rtu_ifu_retire_inst2_no_spec_hit     = rob_retire_inst2_no_spec_hit;

assign rtu_ifu_retire_inst0_no_spec_miss    = rob_retire_inst0_no_spec_miss;
assign rtu_ifu_retire_inst1_no_spec_miss    = rob_retire_inst1_no_spec_miss;
assign rtu_ifu_retire_inst2_no_spec_miss    = rob_retire_inst2_no_spec_miss;

assign rtu_ifu_retire_inst0_no_spec_mispred = rob_retire_inst0_no_spec_mispred;
assign rtu_ifu_retire_inst1_no_spec_mispred = rob_retire_inst1_no_spec_mispred;
assign rtu_ifu_retire_inst2_no_spec_mispred = rob_retire_inst2_no_spec_mispred;

assign rtu_ifu_retire_inst0_cur_pc[38:0]    = rob_retire_inst0_cur_pc[38:0];
assign rtu_ifu_retire_inst1_cur_pc[38:0]    = rob_retire_inst1_cur_pc[38:0];
assign rtu_ifu_retire_inst2_cur_pc[38:0]    = rob_retire_inst2_cur_pc[38:0];

//----------------------------------------------------------
//                          Vl
//----------------------------------------------------------
assign rtu_ifu_retire_inst0_vl_pred      = retire_inst0_vsetvli
                                           && rob_retire_inst0_vl_pred;
assign rtu_ifu_retire_inst1_vl_pred      = retire_inst1_vsetvli
                                           && rob_retire_inst1_vl_pred;
assign rtu_ifu_retire_inst2_vl_pred      = retire_inst2_vsetvli
                                           && rob_retire_inst2_vl_pred;

assign rtu_ifu_retire_inst0_vl[7:0]      = retire_inst0_vsetvlx
                                           ? rob_retire_inst0_mtval[12:5]
                                           : rob_retire_inst0_vl[7:0];
assign rtu_ifu_retire_inst1_vl[7:0]      = rob_retire_inst1_vl[7:0];
assign rtu_ifu_retire_inst2_vl[7:0]      = rob_retire_inst2_vl[7:0];

assign rtu_ifu_retire_inst0_vl_mispred   = retire_inst0_vsetvl_vl_mispred
                                           && retire_inst0_vsetvli
                                           && rob_retire_inst0_vl_pred;
assign rtu_ifu_retire_inst0_vl_hit       = !retire_inst0_vsetvl_vl_mispred
                                           && retire_inst0_vsetvli
                                           && rob_retire_inst0_vl_pred;
assign rtu_ifu_retire_inst0_vl_miss      = retire_inst0_vsetvl_vl_mispred
                                           && retire_inst0_vsetvli
                                           && !rob_retire_inst0_vl_pred;

// &Force("nonport", "rtu_ifu_retire_inst0_vl"); @474
// &Force("nonport", "rtu_ifu_retire_inst1_vl"); @475
// &Force("nonport", "rtu_ifu_retire_inst2_vl"); @476

//----------------------------------------------------------
//                   RTU IFU Change Flow
//----------------------------------------------------------
//if flush inst retires without exception, signal rob to flop rob cur pc
//into retire inst0 pc and then output to IFU PC MUX
assign retire_inst0_inst_flush      = retire_inst0_normal_retire
                                      && (rob_retire_inst0_inst_flush
                                       || rob_retire_inst0_ctc_flush
                                          && !rob_retire_inst0_split);

assign retire_rob_inst_flush        = retire_inst0_inst_flush;
assign retire_rob_dbg_inst0_flush   = retire_inst0_inst_flush;

always @(posedge retire_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_ifu_chgflw_vld <= 1'b0;
  else
    retire_ifu_chgflw_vld <= retire_inst0_inst_flush;
end

//flop and then signal IFU to changeflow
assign rtu_ifu_chgflw_vld           = retire_ifu_chgflw_vld;
//at this time, flush change flow pc is in retire inst0 cur pc
assign rtu_ifu_chgflw_pc[38:0]      = rob_retire_inst0_cur_pc[38:0];

//==========================================================
//                    Debug Interface
//==========================================================
//debug can ONLY hit retire inst 0

//----------------------------------------------------------
//                  Prepare Debug Source
//----------------------------------------------------------
assign dbgreq_ack_hw      = rob_retire_inst0_vld
                            && !rob_retire_inst0_split
                            && had_rtu_hw_dbgreq;
assign dbgreq_ack_bkpt    = had_rtu_fdb
                            && rob_retire_inst0_vld
                            && rob_retire_inst0_bkpt;
assign dbgreq_ack_trace   = had_rtu_trace_dbgreq;
assign dbgreq_ack_event   = rob_retire_inst0_vld
                            && !rob_retire_inst0_split
                            && had_rtu_event_dbgreq;
assign dbgreq_ack_jdbreq  = had_rtu_xx_jdbreq && !had_rtu_dbg_disable;
assign dbgreq_ack_mbkpt   = rob_retire_inst0_inst_bkpt
                            || retire_inst0_normal_retire
                               && rob_retire_inst0_data_bkpt;
assign dbgreq_ack_nonirv  = rob_retire_inst0_vld
                            && !rob_retire_inst0_split
                            && had_rtu_non_irv_bkpt_dbgreq;

//cannot enter into debug mode if commit1/2 valid, debug request will
//trigger single retire mode and can only ack at retire inst0
//except async jdbreq, which ignores any disable
assign dbgreq_ack_without_event = !rob_retire_inst0_dbg_disable
                                  && (dbgreq_ack_hw
                                   || dbgreq_ack_bkpt
                                   || dbgreq_ack_trace
                                   || dbgreq_ack_mbkpt
                                   || dbgreq_ack_nonirv)
                                  || dbgreq_ack_jdbreq;

assign dbgreq_ack               = (dbgreq_ack_without_event
                                  || !rob_retire_inst0_dbg_disable && dbgreq_ack_event)
                                  && !had_rtu_dbg_disable;

assign rtu_had_dbgreq_ack       = dbgreq_ack_without_event;

assign dbgreq_ack_gateclk       = had_rtu_hw_dbgreq_gateclk
                                  || dbgreq_ack_bkpt
                                  || had_rtu_trace_en
                                  || dbgreq_ack_mbkpt
                                  || dbgreq_ack_jdbreq
                                  || dbgreq_ack_event
                                  || dbgreq_ack_nonirv;

//----------------------------------------------------------
//              Debug Ack and Mode on signal
//----------------------------------------------------------
always @(posedge retire_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    dbg_mode_on <= 1'b0;
  else if(retire_flush_be && ifu_dbg_mode_on)
    dbg_mode_on <= 1'b1;
  else if(had_yy_xx_exit_dbg)
    dbg_mode_on <= 1'b0;
  else
    dbg_mode_on <= dbg_mode_on;
end

assign rtu_yy_xx_dbgon = dbg_mode_on;

//stop ifu fetch new inst immediate after dbgack
always @(posedge retire_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ifu_dbg_mode_on <= 1'b0;
  else if(dbgreq_ack)
    ifu_dbg_mode_on <= 1'b1;
  else if(had_yy_xx_exit_dbg)
    ifu_dbg_mode_on <= 1'b0;
  else
    ifu_dbg_mode_on <= ifu_dbg_mode_on;
end

assign rtu_ifu_xx_dbgon                 = ifu_dbg_mode_on;
assign retire_rob_dbg_inst0_dbg_mode_on = ifu_dbg_mode_on;

//----------------------------------------------------------
//                      Debug Inteface
//----------------------------------------------------------
//for HAD CPUSCR
assign rtu_had_xx_dbg_ack_pc                 = dbgreq_ack;
//for had info
assign rtu_had_dbg_ack_info                  = dbgreq_ack_jdbreq
                                               && !ifu_dbg_mode_on;
//assign rtu_had_xx_pc[38:0]                   = retire_inst0_epc[38:0];
assign rtu_had_xx_pc[38:0]                   = (rob_retire_inst0_expt_vld
                                                || rob_retire_inst0_inst_bkpt)
                                               ? rob_retire_inst0_cur_pc[38:0]
                                               : rob_retire_rob_cur_pc[38:0];

assign rtu_had_xx_split_inst                 = rob_retire_inst0_split;

//for HAD PCFIFO
assign rtu_had_xx_pcfifo_inst0_chgflow       = retire_inst0_normal_retire
                                               && rob_retire_inst0_bju;
assign rtu_had_xx_pcfifo_inst1_chgflow       = retire_inst1_normal_retire
                                               && rob_retire_inst1_bju;
assign rtu_had_xx_pcfifo_inst2_chgflow       = retire_inst2_normal_retire
                                               && rob_retire_inst2_bju;
assign rtu_had_xx_pcfifo_inst0_condbr        = rob_retire_inst0_condbr;
assign rtu_had_xx_pcfifo_inst1_condbr        = rob_retire_inst1_condbr;
assign rtu_had_xx_pcfifo_inst2_condbr        = rob_retire_inst2_condbr;
assign rtu_had_xx_pcfifo_inst0_condbr_taken  = rob_retire_inst0_condbr_taken;
assign rtu_had_xx_pcfifo_inst1_condbr_taken  = rob_retire_inst1_condbr_taken;
assign rtu_had_xx_pcfifo_inst2_condbr_taken  = rob_retire_inst2_condbr_taken;
assign rtu_had_xx_pcfifo_inst0_pcall         = rob_retire_inst0_pcal;
assign rtu_had_xx_pcfifo_inst1_pcall         = 1'b0;
assign rtu_had_xx_pcfifo_inst2_pcall         = 1'b0;
assign rtu_had_xx_pcfifo_inst0_preturn       = rob_retire_inst0_ras;
assign rtu_had_xx_pcfifo_inst1_preturn       = 1'b0;
assign rtu_had_xx_pcfifo_inst2_preturn       = 1'b0;
assign rtu_had_xx_pcfifo_inst0_jmp           = rob_retire_inst0_jmp
                                               && !rob_retire_inst0_pcal
                                               && !rob_retire_inst0_ras;
assign rtu_had_xx_pcfifo_inst1_jmp           = rob_retire_inst1_jmp;
assign rtu_had_xx_pcfifo_inst2_jmp           = rob_retire_inst2_jmp;

assign rtu_had_xx_pcfifo_inst0_next_pc[38:0] = rob_retire_inst0_next_pc[38:0];
assign rtu_had_xx_pcfifo_inst1_next_pc[38:0] = rob_retire_inst1_next_pc[38:0];
assign rtu_had_xx_pcfifo_inst2_next_pc[38:0] = rob_retire_inst2_next_pc[38:0];

assign rtu_had_xx_pcfifo_inst0_iid[6:0]      = rob_retire_inst0_iid[6:0];

//for breakpoint
assign rtu_had_inst0_bkpt_inst               = rob_retire_inst0_bkpt;

//for memory bkpt
assign rtu_had_xx_mbkpt_inst_ack             = rob_retire_inst0_inst_bkpt
                                               && !rob_retire_inst0_dbg_disable;
assign rtu_had_xx_mbkpt_data_ack             = retire_inst0_normal_retire
                                               && rob_retire_inst0_data_bkpt
                                               && !rob_retire_inst0_dbg_disable;

assign rtu_hpcp_trace_inst0_chgflow          = retire_inst0_normal_retire
                                               && rob_retire_inst0_bju;
assign rtu_hpcp_trace_inst1_chgflow          = retire_inst1_normal_retire
                                               && rob_retire_inst1_bju;
assign rtu_hpcp_trace_inst2_chgflow          = retire_inst2_normal_retire
                                               && rob_retire_inst2_bju;
assign rtu_hpcp_trace_inst0_next_pc[38:0]    = rob_retire_inst0_next_pc[38:0];
assign rtu_hpcp_trace_inst1_next_pc[38:0]    = rob_retire_inst1_next_pc[38:0];
assign rtu_hpcp_trace_inst2_next_pc[38:0]    = rob_retire_inst2_next_pc[38:0];

//----------------------------------------------------------
//                 Performance Monitor
//----------------------------------------------------------
always @(posedge hpcp_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    retire_retire_hpcp_inst0_vld     <= 1'b0;
    retire_retire_hpcp_inst1_vld     <= 1'b0;
    retire_retire_hpcp_inst2_vld     <= 1'b0;

    retire_hpcp_inst0_split          <= 1'b0;
    retire_hpcp_inst1_split          <= 1'b0;
    retire_hpcp_inst2_split          <= 1'b0;
    retire_hpcp_inst0_num[1:0]       <= 2'b0;
    retire_hpcp_inst1_num[1:0]       <= 2'b0;
    retire_hpcp_inst2_num[1:0]       <= 2'b0;
    retire_hpcp_inst0_pc_offset[2:0] <= 3'b0;
    retire_hpcp_inst1_pc_offset[2:0] <= 3'b0;
    retire_hpcp_inst2_pc_offset[2:0] <= 3'b0;
    retire_hpcp_inst0_condbr         <= 1'b0;
    retire_hpcp_inst1_condbr         <= 1'b0;
    retire_hpcp_inst2_condbr         <= 1'b0;
    retire_hpcp_inst0_jmp            <= 1'b0;
    retire_hpcp_inst1_jmp            <= 1'b0;
    retire_hpcp_inst2_jmp            <= 1'b0;
    retire_hpcp_inst0_store          <= 1'b0;
    retire_hpcp_inst1_store          <= 1'b0;
    retire_hpcp_inst2_store          <= 1'b0;
    retire_hpcp_inst0_bht_mispred    <= 1'b0;
    retire_hpcp_inst0_jmp_mispred    <= 1'b0;
    retire_hpcp_inst0_spec_fail      <= 1'b0;
    retire_hpcp_inst0_ack_int        <= 1'b0;
  end
  else if(hpcp_rtu_cnt_en && rob_retire_inst0_vld) begin
    retire_retire_hpcp_inst0_vld     <= rob_retire_inst0_vld;
    retire_retire_hpcp_inst1_vld     <= rob_retire_inst1_vld;
    retire_retire_hpcp_inst2_vld     <= rob_retire_inst2_vld;

    retire_hpcp_inst0_split          <= rob_retire_inst0_split;
    retire_hpcp_inst1_split          <= rob_retire_inst1_split;
    retire_hpcp_inst2_split          <= rob_retire_inst2_split;
    retire_hpcp_inst0_num[1:0]       <= rob_retire_inst0_num[1:0];
    retire_hpcp_inst1_num[1:0]       <= rob_retire_inst1_num[1:0];
    retire_hpcp_inst2_num[1:0]       <= rob_retire_inst2_num[1:0];
    retire_hpcp_inst0_pc_offset[2:0] <= rob_retire_inst0_pc_offset[2:0];
    retire_hpcp_inst1_pc_offset[2:0] <= rob_retire_inst1_pc_offset[2:0];
    retire_hpcp_inst2_pc_offset[2:0] <= rob_retire_inst2_pc_offset[2:0];    
    retire_hpcp_inst0_condbr         <= retire_inst0_condbr;
    retire_hpcp_inst1_condbr         <= retire_inst1_condbr;
    retire_hpcp_inst2_condbr         <= retire_inst2_condbr;
    retire_hpcp_inst0_jmp            <= retire_inst0_jmp;
    retire_hpcp_inst1_jmp            <= retire_inst1_jmp;
    retire_hpcp_inst2_jmp            <= retire_inst2_jmp;
    retire_hpcp_inst0_bht_mispred    <= retire_inst0_normal_retire
                                        && rob_retire_inst0_bht_mispred;
    retire_hpcp_inst0_jmp_mispred    <= retire_inst0_jmp_mispred;
    retire_hpcp_inst0_store          <= rob_retire_inst0_store;
    retire_hpcp_inst1_store          <= rob_retire_inst1_store;
    retire_hpcp_inst2_store          <= rob_retire_inst2_store;
    retire_hpcp_inst0_spec_fail      <= rob_retire_inst0_spec_fail;
    //ignore int when debug ack for timing
    retire_hpcp_inst0_ack_int        <= !dbg_mode_on && retire_ack_int;
  end
  else begin
    retire_retire_hpcp_inst0_vld     <= 1'b0;
    retire_retire_hpcp_inst1_vld     <= 1'b0;
    retire_retire_hpcp_inst2_vld     <= 1'b0;

    retire_hpcp_inst0_split          <= retire_hpcp_inst0_split;
    retire_hpcp_inst1_split          <= retire_hpcp_inst1_split;
    retire_hpcp_inst2_split          <= retire_hpcp_inst2_split;
    retire_hpcp_inst0_num[1:0]       <= retire_hpcp_inst0_num[1:0];
    retire_hpcp_inst1_num[1:0]       <= retire_hpcp_inst1_num[1:0];
    retire_hpcp_inst2_num[1:0]       <= retire_hpcp_inst2_num[1:0];
    retire_hpcp_inst0_pc_offset[2:0] <= retire_hpcp_inst0_pc_offset[2:0];
    retire_hpcp_inst1_pc_offset[2:0] <= retire_hpcp_inst1_pc_offset[2:0];
    retire_hpcp_inst2_pc_offset[2:0] <= retire_hpcp_inst2_pc_offset[2:0];
    retire_hpcp_inst0_condbr         <= retire_hpcp_inst0_condbr;
    retire_hpcp_inst1_condbr         <= retire_hpcp_inst1_condbr;
    retire_hpcp_inst2_condbr         <= retire_hpcp_inst2_condbr;
    retire_hpcp_inst0_jmp            <= retire_hpcp_inst0_jmp;
    retire_hpcp_inst1_jmp            <= retire_hpcp_inst1_jmp;
    retire_hpcp_inst2_jmp            <= retire_hpcp_inst2_jmp;
    retire_hpcp_inst0_bht_mispred    <= retire_hpcp_inst0_bht_mispred;
    retire_hpcp_inst0_jmp_mispred    <= retire_hpcp_inst0_jmp_mispred;
    retire_hpcp_inst0_store          <= retire_hpcp_inst0_store;
    retire_hpcp_inst1_store          <= retire_hpcp_inst1_store;
    retire_hpcp_inst2_store          <= retire_hpcp_inst2_store;
    retire_hpcp_inst0_spec_fail      <= retire_hpcp_inst0_spec_fail;
    retire_hpcp_inst0_ack_int        <= retire_hpcp_inst0_ack_int;
  end
end

assign rtu_hpcp_inst0_vld                   = retire_retire_hpcp_inst0_vld;
assign rtu_hpcp_inst1_vld                   = retire_retire_hpcp_inst1_vld;
assign rtu_hpcp_inst2_vld                   = retire_retire_hpcp_inst2_vld;

assign rtu_hpcp_inst0_split                 = retire_hpcp_inst0_split;
assign rtu_hpcp_inst1_split                 = retire_hpcp_inst1_split;
assign rtu_hpcp_inst2_split                 = retire_hpcp_inst2_split;
assign rtu_hpcp_inst0_num[1:0]              = retire_hpcp_inst0_num[1:0];
assign rtu_hpcp_inst1_num[1:0]              = retire_hpcp_inst1_num[1:0];
assign rtu_hpcp_inst2_num[1:0]              = retire_hpcp_inst2_num[1:0];
assign rtu_hpcp_inst0_pc_offset[2:0]        = retire_hpcp_inst0_pc_offset[2:0];
assign rtu_hpcp_inst1_pc_offset[2:0]        = retire_hpcp_inst1_pc_offset[2:0];
assign rtu_hpcp_inst2_pc_offset[2:0]        = retire_hpcp_inst2_pc_offset[2:0];
assign rtu_hpcp_inst0_condbr                = retire_hpcp_inst0_condbr;
assign rtu_hpcp_inst1_condbr                = retire_hpcp_inst1_condbr;
assign rtu_hpcp_inst2_condbr                = retire_hpcp_inst2_condbr;
assign rtu_hpcp_inst0_jmp                   = retire_hpcp_inst0_jmp;
assign rtu_hpcp_inst1_jmp                   = retire_hpcp_inst1_jmp;
assign rtu_hpcp_inst2_jmp                   = retire_hpcp_inst2_jmp;
assign rtu_hpcp_inst0_bht_mispred           = retire_hpcp_inst0_bht_mispred;
assign rtu_hpcp_inst0_jmp_mispred           = retire_hpcp_inst0_jmp_mispred;
assign rtu_hpcp_inst0_store                 = retire_hpcp_inst0_store;
assign rtu_hpcp_inst1_store                 = retire_hpcp_inst1_store;
assign rtu_hpcp_inst2_store                 = retire_hpcp_inst2_store;
assign rtu_hpcp_inst0_spec_fail             = retire_hpcp_inst0_spec_fail;
assign rtu_hpcp_inst0_ack_int               = retire_hpcp_inst0_ack_int;

assign retire_rob_inst0_jmp                 = retire_hpcp_inst0_jmp;
assign retire_rob_inst1_jmp                 = retire_hpcp_inst1_jmp;
assign retire_rob_inst2_jmp                 = retire_hpcp_inst2_jmp;

//==========================================================
//                    Flush Control
//==========================================================

parameter FLUSH_IDLE  = 5'b00001;
parameter FLUSH_IS    = 5'b00010;
parameter FLUSH_FE    = 5'b00100;
parameter WF_EMPTY    = 5'b01000;
parameter FLUSH_IS_BE = 5'b10010;
parameter FLUSH_FE_BE = 5'b10100;
parameter FLUSH_BE    = 5'b10000;

//----------------------------------------------------------
//              Prepare state machine signals
//----------------------------------------------------------
assign retire_inst0_flush          = retire_expt_vld
                                     || retire_inst0_inst_flush
                                     || dbgreq_ack
                                     || retire_async_expt_vld;
assign retire_inst0_mispred        = retire_inst0_normal_retire
                                     && (rob_retire_inst0_jmp_mispred
                                      || rob_retire_inst0_bht_mispred);

assign retire_inst0_flush_gateclk  = retire_expt_gateclk_vld
                                     || retire_inst0_inst_flush
                                     || dbgreq_ack_gateclk
                                     || retire_async_expt_vld
                                     || retire_inst0_mispred;

assign retire_flush_pipeline_empty = pst_retire_retired_reg_wb
                                     && lsu_rtu_all_commit_data_vld;

//----------------------------------------------------------
//                      FSM of Flush
//----------------------------------------------------------
// State Description:
// FLUSH_IDLE  : no flush or retiring inst 0 will trigger flush.
//               if triggering, stop commit, flush ROB, retire/expt entry
// FLUSH_IS    : flush IDU IS/RF, flush IDU ptag pool, start to stall
//               IDU ID, stall IDU ID
// FLUSH_FE    : flush IFU and IDU ID/IR/IS/RF, flush IDU ptag pool,
//               stall IDU ID
// WF_EMPTY    : wait PST retired and released entry WB, stall IDU ID
// FLUSH_BE    : flush PST, recover rename table,
//               stop IDU ID mispred stall, stall IDU ID
// FLUSH_IS_BE : flush IS and flush backend
// FLUSH_FE_BE : flush frontend and flush backend

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    flush_cur_state[4:0] <= FLUSH_IDLE;
  else if(async_flush)
    flush_cur_state[4:0] <= FLUSH_FE_BE;
  else
    flush_cur_state[4:0] <= flush_next_state[4:0];
end

// &CombBeg; @839
always @( retire_flush_pipeline_empty
       or flush_cur_state[4:0]
       or retire_inst0_flush
       or retire_inst0_mispred)
begin
  case(flush_cur_state[4:0])
    FLUSH_IDLE  : if(retire_inst0_flush
                     && retire_flush_pipeline_empty)
                    flush_next_state[4:0] = FLUSH_FE_BE;
                  else if(retire_inst0_flush)
                    flush_next_state[4:0] = FLUSH_FE;
                  else if(retire_inst0_mispred
                     && retire_flush_pipeline_empty)
                    flush_next_state[4:0] = FLUSH_IS_BE;
                  else if(retire_inst0_mispred)
                    flush_next_state[4:0] = FLUSH_IS;
                  else
                    flush_next_state[4:0] = FLUSH_IDLE;
    FLUSH_IS    : if(retire_flush_pipeline_empty)
                    flush_next_state[4:0] = FLUSH_BE;
                  else
                    flush_next_state[4:0] = WF_EMPTY;
    FLUSH_FE    : if(retire_flush_pipeline_empty)
                    flush_next_state[4:0] = FLUSH_BE;
                  else
                    flush_next_state[4:0] = WF_EMPTY;
    WF_EMPTY    : if(retire_flush_pipeline_empty)
                    flush_next_state[4:0] = FLUSH_BE;
                  else
                    flush_next_state[4:0] = WF_EMPTY;
    FLUSH_IS_BE :   flush_next_state[4:0] = FLUSH_IDLE;
    FLUSH_FE_BE :   flush_next_state[4:0] = FLUSH_IDLE;
    FLUSH_BE    :   flush_next_state[4:0] = FLUSH_IDLE;
    default     :   flush_next_state[4:0] = FLUSH_IDLE;
  endcase
// &CombEnd; @870
end

//----------------------------------------------------------
//                   Control Siganls
//----------------------------------------------------------
assign retire_flush_is  = flush_cur_state[1];

assign retire_flush_fe  = flush_cur_state[2];

assign retire_flush_be  = flush_cur_state[4];

assign rtu_ifu_flush    = retire_flush_fe;

assign rtu_idu_flush_fe = retire_flush_fe;

assign rtu_iu_flush_fe  = retire_flush_fe;

assign rtu_idu_flush_is = retire_flush_is;

assign rtu_yy_xx_flush  = retire_flush_be;
assign retire_rob_flush = retire_inst0_flush
                          || retire_inst0_mispred
                          || retire_flush_is
                          || retire_flush_fe;

assign retire_rob_flush_gateclk  = retire_inst0_flush_gateclk
                                   || retire_flush_is
                                   || retire_flush_fe;

assign retire_flush_sm_no_idle   = !flush_cur_state[0];

assign rtu_idu_flush_stall       = retire_flush_sm_no_idle;
//mask iu change flow on wrong path during flush state machine
//when mispred iu will mask wrong path change flow by itself
assign rtu_iu_flush_chgflw_mask  = retire_flush_sm_no_idle;

assign retire_rob_flush_cur_state[4:0] = flush_cur_state[4:0];

//----------------------------------------------------------
//                   Asynchronous Flush
//----------------------------------------------------------
//when sync flush, lsu entry do not flush commit inst, but
//lsu pipeline flush inst without considering its commit state
//when async flush, the committed lsu inst may die when flushed
//at lsu pipeline while not flushed in lsu entry
//so add async flush to flush lsu entry committed inst
//force flush state machine to flush fe and be state
//force pst preg all wb
//force async expt to idle
//the async expt will not interrupt commit inst execute in lsu
//so do not need async lsu flush
assign async_flush           = dbgreq_ack_jdbreq;

always @(posedge retire_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    async_flush_ff <= 1'b0;
  else
    async_flush_ff <= async_flush;
end

assign retire_pst_async_flush = async_flush_ff;
assign rtu_lsu_async_flush    = async_flush_ff;

//----------------------------------------------------------
//                    Flush Expt
//----------------------------------------------------------
//rtu should signal lsu whether flush is triggered by
//1. expt, include expt, int and async expt
//2. exception return, include rte/rfi
//available only when flush
always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    flush_expt        <= 1'b0;
    flush_eret        <= 1'b0;
    flush_spec_fail   <= 1'b0;
  end
  else if(retire_inst0_flush) begin
    flush_expt        <= retire_ifu_expt_vld;
    flush_eret        <= rob_retire_inst0_efpc_vld;
    flush_spec_fail   <= rob_retire_inst0_spec_fail;
  end
  else if(retire_flush_be) begin
    flush_expt        <= 1'b0;
    flush_eret        <= 1'b0;
    flush_spec_fail   <= 1'b0;
  end
  else begin
    flush_expt        <= flush_expt;
    flush_eret        <= flush_eret;
    flush_spec_fail   <= flush_spec_fail;
  end 
end

assign rtu_lsu_expt_flush      = flush_expt;
assign rtu_lsu_eret_flush      = flush_eret;
assign rtu_lsu_spec_fail_flush = flush_spec_fail;

//----------------------------------------------------------
//                      Spec fail IID
//----------------------------------------------------------
always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    spec_fail_iid[6:0] <= 7'b0;
  else if(async_flush)
    spec_fail_iid[6:0] <= 7'b0;
  else if(retire_inst0_normal_retire && rob_retire_inst0_spec_fail_no_ssf)
    spec_fail_iid[6:0] <= rob_retire_inst0_iid[6:0];
  else if(retire_inst0_normal_retire && rob_retire_inst0_spec_fail_ssf)
    spec_fail_iid[6:0] <= rob_retire_ssf_iid[6:0];
  else
    spec_fail_iid[6:0] <= spec_fail_iid[6:0];
end

assign rtu_lsu_spec_fail_iid[6:0] = spec_fail_iid[6:0];

//==========================================================
//                  Asynchronous Exception
//==========================================================
parameter AE_IDLE = 2'b00;
parameter AE_WFC  = 2'b01;
parameter AE_WFI  = 2'b10;
parameter AE_EXPT = 2'b11;

//----------------------------------------------------------
//              Prepare state machine signals
//----------------------------------------------------------
assign retire_async_expt           = lsu_rtu_async_expt_vld
                                     && !dbgreq_ack
                                     && !dbg_mode_on;
assign retire_async_expt_no_commit = !(rob_retire_commit0
                                     || rob_retire_commit1
                                     || rob_retire_commit2);
assign retire_async_expt_no_retire = !(rob_retire_inst0_vld
                                     || rob_retire_inst1_vld
                                     || rob_retire_inst2_vld
                                     || retire_flush_sm_no_idle
                                     || !pst_retire_retired_reg_wb);
//                                     || ifu_rtu_vec_addr_not_fetched);

//----------------------------------------------------------
//                 Save physical address
//----------------------------------------------------------
always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ae_phy_addr[39:0] <= 40'b0;
  else if(lsu_rtu_async_expt_vld)
    ae_phy_addr[39:0] <= lsu_rtu_async_expt_addr[39:0];
  else
    ae_phy_addr[39:0] <= ae_phy_addr[39:0];
end

//----------------------------------------------------------
//                    FSM of Async Expt
//----------------------------------------------------------
// State Description:
// AE_IDLE    : no asynchronous exception or LSU trigger async expt
// AE_WFC     : wait for commiting inst retire, stop new inst commit
// AE_WFI     : stop rob retire entry valid, wait for retire inst 0/1/2
//              not valid and FLUSH state machine IDLE and ifu fetch vec addr
// AE_EXPT    : signal IFU expt valid, trigger FLUSH state machine

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ae_cur_state[1:0] <= AE_IDLE;
  else if(async_flush)
    ae_cur_state[1:0] <= AE_IDLE;
  else
    ae_cur_state[1:0] <= ae_next_state[1:0];
end

// &CombBeg; @1048
always @( ae_cur_state[1:0]
       or retire_async_expt_no_retire
       or retire_async_expt
       or retire_async_expt_no_commit)
begin
  case(ae_cur_state[1:0])
    AE_IDLE    : if(retire_async_expt)
                   ae_next_state[1:0] = AE_WFC;
                 else
                   ae_next_state[1:0] = AE_IDLE;
    AE_WFC     : if(retire_async_expt_no_commit)
                   ae_next_state[1:0] = AE_WFI;
                 else
                   ae_next_state[1:0] = AE_WFC;
    AE_WFI     : if(retire_async_expt_no_retire)
                   ae_next_state[1:0] = AE_EXPT;
                 else
                   ae_next_state[1:0] = AE_WFI;
    AE_EXPT    :   ae_next_state[1:0] = AE_IDLE;
    default    :   ae_next_state[1:0] = AE_IDLE;
  endcase
// &CombEnd; @1065
end

//----------------------------------------------------------
//                   Control Siganls
//----------------------------------------------------------
assign retire_async_expt_sm_no_idle      = (ae_cur_state[1:0] != AE_IDLE);
//stop new inst commit, do not stop existent commit
assign retire_rob_async_expt_commit_mask = (ae_cur_state[1:0] == AE_WFC);
//stop rob retire new inst
assign retire_rob_rt_mask                = (ae_cur_state[1:0] == AE_WFI);
//async expt valid will flush rob, including commit
assign retire_async_expt_vld             = (ae_cur_state[1:0] == AE_EXPT);
//access error
assign retire_async_expt_vec[5:0]        = 6'd5;

assign retire_top_ae_cur_state[1:0]      = ae_cur_state[1:0];

//==========================================================
//                       CTC Flush
//==========================================================
//when lsu request ctc flush, rtu should req sync flush to
//rob read0 inst like int, ctc flush req should be clear when
//flush fe generated by ctc flush req or other rtu flush request.
//cannot use flush be because mispred may flush fe before ctc flush
//request, ctc flush req may be clear after mispred
assign retire_ctc_flush_lsu_req     = lsu_rtu_ctc_flush_vld;

always @(posedge sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    retire_ctc_flush_req <= 1'b0;
  else if(retire_ctc_flush_lsu_req)
    retire_ctc_flush_req <= 1'b1;
  else if(retire_flush_fe)
    retire_ctc_flush_req <= 1'b0;
  else
    retire_ctc_flush_req <= retire_ctc_flush_req;
end

assign retire_rob_ctc_flush_req = retire_ctc_flush_req;

//==========================================================
//                  Retire Empty Signals
//==========================================================
assign retire_rob_retire_empty = lsu_rtu_all_commit_data_vld;

// &ModuleEnd; @1111
endmodule


