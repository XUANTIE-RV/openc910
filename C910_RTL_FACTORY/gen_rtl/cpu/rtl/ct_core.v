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

// &Depend("cpu_cfig.h"); @23
// //&Depend("core_golden_port.vp"); @24

// &ModuleBeg; @26
module ct_core(
  biu_cp0_apb_base,
  biu_cp0_cmplt,
  biu_cp0_coreid,
  biu_cp0_me_int,
  biu_cp0_ms_int,
  biu_cp0_mt_int,
  biu_cp0_rdata,
  biu_cp0_rvba,
  biu_cp0_se_int,
  biu_cp0_ss_int,
  biu_cp0_st_int,
  biu_ifu_rd_data,
  biu_ifu_rd_data_vld,
  biu_ifu_rd_grnt,
  biu_ifu_rd_id,
  biu_ifu_rd_last,
  biu_ifu_rd_resp,
  biu_lsu_ac_addr,
  biu_lsu_ac_prot,
  biu_lsu_ac_req,
  biu_lsu_ac_snoop,
  biu_lsu_ar_ready,
  biu_lsu_aw_vb_grnt,
  biu_lsu_aw_wmb_grnt,
  biu_lsu_b_id,
  biu_lsu_b_resp,
  biu_lsu_b_vld,
  biu_lsu_cd_ready,
  biu_lsu_cr_ready,
  biu_lsu_r_data,
  biu_lsu_r_id,
  biu_lsu_r_last,
  biu_lsu_r_resp,
  biu_lsu_r_vld,
  biu_lsu_w_vb_grnt,
  biu_lsu_w_wmb_grnt,
  biu_yy_xx_no_op,
  cp0_biu_icg_en,
  cp0_biu_lpmd_b,
  cp0_biu_op,
  cp0_biu_sel,
  cp0_biu_wdata,
  cp0_had_cpuid_0,
  cp0_had_debug_info,
  cp0_had_lpmd_b,
  cp0_had_trace_pm_wdata,
  cp0_had_trace_pm_wen,
  cp0_hpcp_icg_en,
  cp0_hpcp_index,
  cp0_hpcp_int_disable,
  cp0_hpcp_mcntwen,
  cp0_hpcp_op,
  cp0_hpcp_pmdm,
  cp0_hpcp_pmds,
  cp0_hpcp_pmdu,
  cp0_hpcp_sel,
  cp0_hpcp_src0,
  cp0_hpcp_wdata,
  cp0_mmu_cskyee,
  cp0_mmu_icg_en,
  cp0_mmu_maee,
  cp0_mmu_mpp,
  cp0_mmu_mprv,
  cp0_mmu_mxr,
  cp0_mmu_no_op_req,
  cp0_mmu_ptw_en,
  cp0_mmu_reg_num,
  cp0_mmu_satp_sel,
  cp0_mmu_sum,
  cp0_mmu_tlb_all_inv,
  cp0_mmu_wdata,
  cp0_mmu_wreg,
  cp0_pad_mstatus,
  cp0_pmp_icg_en,
  cp0_pmp_mpp,
  cp0_pmp_mprv,
  cp0_pmp_reg_num,
  cp0_pmp_wdata,
  cp0_pmp_wreg,
  cp0_xx_core_icg_en,
  cp0_yy_priv_mode,
  forever_cpuclk,
  fpu_rst_b,
  had_cp0_xx_dbg,
  had_idu_debug_id_inst_en,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  had_ifu_ir,
  had_ifu_ir_vld,
  had_ifu_pc,
  had_ifu_pcload,
  had_lsu_bus_trace_en,
  had_lsu_dbg_en,
  had_rtu_data_bkpt_dbgreq,
  had_rtu_dbg_disable,
  had_rtu_dbg_req_en,
  had_rtu_debug_retire_info_en,
  had_rtu_event_dbgreq,
  had_rtu_fdb,
  had_rtu_hw_dbgreq,
  had_rtu_hw_dbgreq_gateclk,
  had_rtu_inst_bkpt_dbgreq,
  had_rtu_non_irv_bkpt_dbgreq,
  had_rtu_pop1_disa,
  had_rtu_trace_dbgreq,
  had_rtu_trace_en,
  had_rtu_xx_jdbreq,
  had_rtu_xx_tme,
  had_yy_xx_bkpta_base,
  had_yy_xx_bkpta_mask,
  had_yy_xx_bkpta_rc,
  had_yy_xx_bkptb_base,
  had_yy_xx_bkptb_mask,
  had_yy_xx_bkptb_rc,
  had_yy_xx_exit_dbg,
  hpcp_cp0_cmplt,
  hpcp_cp0_data,
  hpcp_cp0_int_vld,
  hpcp_cp0_sce,
  hpcp_idu_cnt_en,
  hpcp_ifu_cnt_en,
  hpcp_lsu_cnt_en,
  hpcp_rtu_cnt_en,
  idu_had_debug_info,
  idu_had_id_inst0_info,
  idu_had_id_inst0_vld,
  idu_had_id_inst1_info,
  idu_had_id_inst1_vld,
  idu_had_id_inst2_info,
  idu_had_id_inst2_vld,
  idu_had_iq_empty,
  idu_had_pipe_stall,
  idu_had_pipeline_empty,
  idu_had_wb_data,
  idu_had_wb_vld,
  idu_hpcp_backend_stall,
  idu_hpcp_fence_sync_vld,
  idu_hpcp_ir_inst0_type,
  idu_hpcp_ir_inst0_vld,
  idu_hpcp_ir_inst1_type,
  idu_hpcp_ir_inst1_vld,
  idu_hpcp_ir_inst2_type,
  idu_hpcp_ir_inst2_vld,
  idu_hpcp_ir_inst3_type,
  idu_hpcp_ir_inst3_vld,
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
  idu_rst_b,
  ifu_biu_r_ready,
  ifu_biu_rd_addr,
  ifu_biu_rd_burst,
  ifu_biu_rd_cache,
  ifu_biu_rd_domain,
  ifu_biu_rd_id,
  ifu_biu_rd_len,
  ifu_biu_rd_prot,
  ifu_biu_rd_req,
  ifu_biu_rd_req_gate,
  ifu_biu_rd_size,
  ifu_biu_rd_snoop,
  ifu_biu_rd_user,
  ifu_had_debug_info,
  ifu_had_no_inst,
  ifu_had_no_op,
  ifu_had_reset_on,
  ifu_hpcp_btb_inst,
  ifu_hpcp_btb_mispred,
  ifu_hpcp_frontend_stall,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  ifu_mmu_abort,
  ifu_mmu_va,
  ifu_mmu_va_vld,
  ifu_rst_b,
  iu_had_debug_info,
  lsu_biu_ac_empty,
  lsu_biu_ac_ready,
  lsu_biu_ar_addr,
  lsu_biu_ar_bar,
  lsu_biu_ar_burst,
  lsu_biu_ar_cache,
  lsu_biu_ar_domain,
  lsu_biu_ar_dp_req,
  lsu_biu_ar_id,
  lsu_biu_ar_len,
  lsu_biu_ar_lock,
  lsu_biu_ar_prot,
  lsu_biu_ar_req,
  lsu_biu_ar_req_gate,
  lsu_biu_ar_size,
  lsu_biu_ar_snoop,
  lsu_biu_ar_user,
  lsu_biu_aw_req_gate,
  lsu_biu_aw_st_addr,
  lsu_biu_aw_st_bar,
  lsu_biu_aw_st_burst,
  lsu_biu_aw_st_cache,
  lsu_biu_aw_st_domain,
  lsu_biu_aw_st_dp_req,
  lsu_biu_aw_st_id,
  lsu_biu_aw_st_len,
  lsu_biu_aw_st_lock,
  lsu_biu_aw_st_prot,
  lsu_biu_aw_st_req,
  lsu_biu_aw_st_size,
  lsu_biu_aw_st_snoop,
  lsu_biu_aw_st_unique,
  lsu_biu_aw_st_user,
  lsu_biu_aw_vict_addr,
  lsu_biu_aw_vict_bar,
  lsu_biu_aw_vict_burst,
  lsu_biu_aw_vict_cache,
  lsu_biu_aw_vict_domain,
  lsu_biu_aw_vict_dp_req,
  lsu_biu_aw_vict_id,
  lsu_biu_aw_vict_len,
  lsu_biu_aw_vict_lock,
  lsu_biu_aw_vict_prot,
  lsu_biu_aw_vict_req,
  lsu_biu_aw_vict_size,
  lsu_biu_aw_vict_snoop,
  lsu_biu_aw_vict_unique,
  lsu_biu_aw_vict_user,
  lsu_biu_cd_data,
  lsu_biu_cd_last,
  lsu_biu_cd_valid,
  lsu_biu_cr_resp,
  lsu_biu_cr_valid,
  lsu_biu_r_linefill_ready,
  lsu_biu_w_st_data,
  lsu_biu_w_st_last,
  lsu_biu_w_st_strb,
  lsu_biu_w_st_vld,
  lsu_biu_w_st_wns,
  lsu_biu_w_vict_data,
  lsu_biu_w_vict_last,
  lsu_biu_w_vict_strb,
  lsu_biu_w_vict_vld,
  lsu_biu_w_vict_wns,
  lsu_had_debug_info,
  lsu_had_ld_addr,
  lsu_had_ld_data,
  lsu_had_ld_iid,
  lsu_had_ld_req,
  lsu_had_ld_type,
  lsu_had_no_op,
  lsu_had_st_addr,
  lsu_had_st_data,
  lsu_had_st_iid,
  lsu_had_st_req,
  lsu_had_st_type,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_fence_stall,
  lsu_hpcp_ld_stall_cross_4k,
  lsu_hpcp_ld_stall_other,
  lsu_hpcp_replay_data_discard,
  lsu_hpcp_replay_discard_sq,
  lsu_hpcp_st_stall_cross_4k,
  lsu_hpcp_st_stall_other,
  lsu_hpcp_unalign_inst,
  lsu_mmu_abort0,
  lsu_mmu_abort1,
  lsu_mmu_bus_error,
  lsu_mmu_data,
  lsu_mmu_data_vld,
  lsu_mmu_id0,
  lsu_mmu_id1,
  lsu_mmu_st_inst0,
  lsu_mmu_st_inst1,
  lsu_mmu_stamo_pa,
  lsu_mmu_stamo_vld,
  lsu_mmu_tlb_all_inv,
  lsu_mmu_tlb_asid,
  lsu_mmu_tlb_asid_all_inv,
  lsu_mmu_tlb_va,
  lsu_mmu_tlb_va_all_inv,
  lsu_mmu_tlb_va_asid_inv,
  lsu_mmu_va0,
  lsu_mmu_va0_vld,
  lsu_mmu_va1,
  lsu_mmu_va1_vld,
  lsu_mmu_va2,
  lsu_mmu_va2_vld,
  lsu_mmu_vabuf0,
  lsu_mmu_vabuf1,
  lsu_rst_b,
  mmu_cp0_cmplt,
  mmu_cp0_data,
  mmu_cp0_satp_data,
  mmu_cp0_tlb_done,
  mmu_ifu_buf,
  mmu_ifu_ca,
  mmu_ifu_deny,
  mmu_ifu_pa,
  mmu_ifu_pavld,
  mmu_ifu_pgflt,
  mmu_ifu_sec,
  mmu_lsu_access_fault0,
  mmu_lsu_access_fault1,
  mmu_lsu_buf0,
  mmu_lsu_buf1,
  mmu_lsu_ca0,
  mmu_lsu_ca1,
  mmu_lsu_data_req,
  mmu_lsu_data_req_addr,
  mmu_lsu_data_req_size,
  mmu_lsu_mmu_en,
  mmu_lsu_pa0,
  mmu_lsu_pa0_vld,
  mmu_lsu_pa1,
  mmu_lsu_pa1_vld,
  mmu_lsu_pa2,
  mmu_lsu_pa2_err,
  mmu_lsu_pa2_vld,
  mmu_lsu_page_fault0,
  mmu_lsu_page_fault1,
  mmu_lsu_sec0,
  mmu_lsu_sec1,
  mmu_lsu_sec2,
  mmu_lsu_sh0,
  mmu_lsu_sh1,
  mmu_lsu_share2,
  mmu_lsu_so0,
  mmu_lsu_so1,
  mmu_lsu_stall0,
  mmu_lsu_stall1,
  mmu_lsu_tlb_busy,
  mmu_lsu_tlb_inv_done,
  mmu_lsu_tlb_wakeup,
  mmu_xx_mmu_en,
  mmu_yy_xx_no_op,
  pad_yy_icg_scan_en,
  pad_yy_scan_mode,
  pmp_cp0_data,
  rtu_cpu_no_retire,
  rtu_had_bkpt_data_st,
  rtu_had_data_bkpta_vld,
  rtu_had_data_bkptb_vld,
  rtu_had_dbg_ack_info,
  rtu_had_dbgreq_ack,
  rtu_had_debug_info,
  rtu_had_inst0_bkpt_inst,
  rtu_had_inst0_non_irv_bkpt,
  rtu_had_inst1_non_irv_bkpt,
  rtu_had_inst2_non_irv_bkpt,
  rtu_had_inst_bkpt_inst_vld,
  rtu_had_inst_bkpta_vld,
  rtu_had_inst_bkptb_vld,
  rtu_had_inst_exe_dead,
  rtu_had_inst_not_wb,
  rtu_had_inst_split,
  rtu_had_retire_inst0_info,
  rtu_had_retire_inst0_vld,
  rtu_had_retire_inst1_info,
  rtu_had_retire_inst1_vld,
  rtu_had_retire_inst2_info,
  rtu_had_retire_inst2_vld,
  rtu_had_rob_empty,
  rtu_had_xx_dbg_ack_pc,
  rtu_had_xx_mbkpt_chgflow,
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
  rtu_hpcp_inst0_cur_pc,
  rtu_hpcp_inst0_jmp,
  rtu_hpcp_inst0_jmp_mispred,
  rtu_hpcp_inst0_jmp_pc_offset_8m,
  rtu_hpcp_inst0_num,
  rtu_hpcp_inst0_pc_offset,
  rtu_hpcp_inst0_spec_fail,
  rtu_hpcp_inst0_split,
  rtu_hpcp_inst0_store,
  rtu_hpcp_inst0_vld,
  rtu_hpcp_inst1_condbr,
  rtu_hpcp_inst1_cur_pc,
  rtu_hpcp_inst1_jmp,
  rtu_hpcp_inst1_jmp_pc_offset_8m,
  rtu_hpcp_inst1_num,
  rtu_hpcp_inst1_pc_offset,
  rtu_hpcp_inst1_split,
  rtu_hpcp_inst1_store,
  rtu_hpcp_inst1_vld,
  rtu_hpcp_inst2_condbr,
  rtu_hpcp_inst2_cur_pc,
  rtu_hpcp_inst2_jmp,
  rtu_hpcp_inst2_jmp_pc_offset_8m,
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
  rtu_mmu_bad_vpn,
  rtu_mmu_expt_vld,
  rtu_pad_retire0,
  rtu_pad_retire0_pc,
  rtu_pad_retire1,
  rtu_pad_retire1_pc,
  rtu_pad_retire2,
  rtu_pad_retire2_pc,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
  rtu_yy_xx_retire0,
  rtu_yy_xx_retire0_normal,
  rtu_yy_xx_retire1,
  rtu_yy_xx_retire2
);

//&Ports("compare", "../../../gen_rtl/cpu/rtl/core_golden_port.v");
// &Ports; @28
input   [39 :0]  biu_cp0_apb_base;                       
input            biu_cp0_cmplt;                          
input   [2  :0]  biu_cp0_coreid;                         
input            biu_cp0_me_int;                         
input            biu_cp0_ms_int;                         
input            biu_cp0_mt_int;                         
input   [127:0]  biu_cp0_rdata;                          
input   [39 :0]  biu_cp0_rvba;                           
input            biu_cp0_se_int;                         
input            biu_cp0_ss_int;                         
input            biu_cp0_st_int;                         
input   [127:0]  biu_ifu_rd_data;                        
input            biu_ifu_rd_data_vld;                    
input            biu_ifu_rd_grnt;                        
input            biu_ifu_rd_id;                          
input            biu_ifu_rd_last;                        
input   [1  :0]  biu_ifu_rd_resp;                        
input   [39 :0]  biu_lsu_ac_addr;                        
input   [2  :0]  biu_lsu_ac_prot;                        
input            biu_lsu_ac_req;                         
input   [3  :0]  biu_lsu_ac_snoop;                       
input            biu_lsu_ar_ready;                       
input            biu_lsu_aw_vb_grnt;                     
input            biu_lsu_aw_wmb_grnt;                    
input   [4  :0]  biu_lsu_b_id;                           
input   [1  :0]  biu_lsu_b_resp;                         
input            biu_lsu_b_vld;                          
input            biu_lsu_cd_ready;                       
input            biu_lsu_cr_ready;                       
input   [127:0]  biu_lsu_r_data;                         
input   [4  :0]  biu_lsu_r_id;                           
input            biu_lsu_r_last;                         
input   [3  :0]  biu_lsu_r_resp;                         
input            biu_lsu_r_vld;                          
input            biu_lsu_w_vb_grnt;                      
input            biu_lsu_w_wmb_grnt;                     
input            biu_yy_xx_no_op;                        
input            forever_cpuclk;                         
input            fpu_rst_b;                              
input            had_cp0_xx_dbg;                         
input            had_idu_debug_id_inst_en;               
input   [63 :0]  had_idu_wbbr_data;                      
input            had_idu_wbbr_vld;                       
input   [31 :0]  had_ifu_ir;                             
input            had_ifu_ir_vld;                         
input   [38 :0]  had_ifu_pc;                             
input            had_ifu_pcload;                         
input            had_lsu_bus_trace_en;                   
input            had_lsu_dbg_en;                         
input            had_rtu_data_bkpt_dbgreq;               
input            had_rtu_dbg_disable;                    
input            had_rtu_dbg_req_en;                     
input            had_rtu_debug_retire_info_en;           
input            had_rtu_event_dbgreq;                   
input            had_rtu_fdb;                            
input            had_rtu_hw_dbgreq;                      
input            had_rtu_hw_dbgreq_gateclk;              
input            had_rtu_inst_bkpt_dbgreq;               
input            had_rtu_non_irv_bkpt_dbgreq;            
input            had_rtu_pop1_disa;                      
input            had_rtu_trace_dbgreq;                   
input            had_rtu_trace_en;                       
input            had_rtu_xx_jdbreq;                      
input            had_rtu_xx_tme;                         
input   [39 :0]  had_yy_xx_bkpta_base;                   
input   [7  :0]  had_yy_xx_bkpta_mask;                   
input            had_yy_xx_bkpta_rc;                     
input   [39 :0]  had_yy_xx_bkptb_base;                   
input   [7  :0]  had_yy_xx_bkptb_mask;                   
input            had_yy_xx_bkptb_rc;                     
input            had_yy_xx_exit_dbg;                     
input            hpcp_cp0_cmplt;                         
input   [63 :0]  hpcp_cp0_data;                          
input            hpcp_cp0_int_vld;                       
input            hpcp_cp0_sce;                           
input            hpcp_idu_cnt_en;                        
input            hpcp_ifu_cnt_en;                        
input            hpcp_lsu_cnt_en;                        
input            hpcp_rtu_cnt_en;                        
input            idu_rst_b;                              
input            ifu_rst_b;                              
input            lsu_rst_b;                              
input            mmu_cp0_cmplt;                          
input   [63 :0]  mmu_cp0_data;                           
input   [63 :0]  mmu_cp0_satp_data;                      
input            mmu_cp0_tlb_done;                       
input            mmu_ifu_buf;                            
input            mmu_ifu_ca;                             
input            mmu_ifu_deny;                           
input   [27 :0]  mmu_ifu_pa;                             
input            mmu_ifu_pavld;                          
input            mmu_ifu_pgflt;                          
input            mmu_ifu_sec;                            
input            mmu_lsu_access_fault0;                  
input            mmu_lsu_access_fault1;                  
input            mmu_lsu_buf0;                           
input            mmu_lsu_buf1;                           
input            mmu_lsu_ca0;                            
input            mmu_lsu_ca1;                            
input            mmu_lsu_data_req;                       
input   [39 :0]  mmu_lsu_data_req_addr;                  
input            mmu_lsu_data_req_size;                  
input            mmu_lsu_mmu_en;                         
input   [27 :0]  mmu_lsu_pa0;                            
input            mmu_lsu_pa0_vld;                        
input   [27 :0]  mmu_lsu_pa1;                            
input            mmu_lsu_pa1_vld;                        
input   [27 :0]  mmu_lsu_pa2;                            
input            mmu_lsu_pa2_err;                        
input            mmu_lsu_pa2_vld;                        
input            mmu_lsu_page_fault0;                    
input            mmu_lsu_page_fault1;                    
input            mmu_lsu_sec0;                           
input            mmu_lsu_sec1;                           
input            mmu_lsu_sec2;                           
input            mmu_lsu_sh0;                            
input            mmu_lsu_sh1;                            
input            mmu_lsu_share2;                         
input            mmu_lsu_so0;                            
input            mmu_lsu_so1;                            
input            mmu_lsu_stall0;                         
input            mmu_lsu_stall1;                         
input            mmu_lsu_tlb_busy;                       
input            mmu_lsu_tlb_inv_done;                   
input   [11 :0]  mmu_lsu_tlb_wakeup;                     
input            mmu_xx_mmu_en;                          
input            mmu_yy_xx_no_op;                        
input            pad_yy_icg_scan_en;                     
input            pad_yy_scan_mode;                       
input   [63 :0]  pmp_cp0_data;                           
output           cp0_biu_icg_en;                         
output  [1  :0]  cp0_biu_lpmd_b;                         
output  [15 :0]  cp0_biu_op;                             
output           cp0_biu_sel;                            
output  [63 :0]  cp0_biu_wdata;                          
output  [31 :0]  cp0_had_cpuid_0;                        
output  [3  :0]  cp0_had_debug_info;                     
output  [1  :0]  cp0_had_lpmd_b;                         
output  [1  :0]  cp0_had_trace_pm_wdata;                 
output           cp0_had_trace_pm_wen;                   
output           cp0_hpcp_icg_en;                        
output  [11 :0]  cp0_hpcp_index;                         
output           cp0_hpcp_int_disable;                   
output  [31 :0]  cp0_hpcp_mcntwen;                       
output  [3  :0]  cp0_hpcp_op;                            
output           cp0_hpcp_pmdm;                          
output           cp0_hpcp_pmds;                          
output           cp0_hpcp_pmdu;                          
output           cp0_hpcp_sel;                           
output  [63 :0]  cp0_hpcp_src0;                          
output  [63 :0]  cp0_hpcp_wdata;                         
output           cp0_mmu_cskyee;                         
output           cp0_mmu_icg_en;                         
output           cp0_mmu_maee;                           
output  [1  :0]  cp0_mmu_mpp;                            
output           cp0_mmu_mprv;                           
output           cp0_mmu_mxr;                            
output           cp0_mmu_no_op_req;                      
output           cp0_mmu_ptw_en;                         
output  [1  :0]  cp0_mmu_reg_num;                        
output           cp0_mmu_satp_sel;                       
output           cp0_mmu_sum;                            
output           cp0_mmu_tlb_all_inv;                    
output  [63 :0]  cp0_mmu_wdata;                          
output           cp0_mmu_wreg;                           
output  [63 :0]  cp0_pad_mstatus;                        
output           cp0_pmp_icg_en;                         
output  [1  :0]  cp0_pmp_mpp;                            
output           cp0_pmp_mprv;                           
output  [4  :0]  cp0_pmp_reg_num;                        
output  [63 :0]  cp0_pmp_wdata;                          
output           cp0_pmp_wreg;                           
output           cp0_xx_core_icg_en;                     
output  [1  :0]  cp0_yy_priv_mode;                       
output  [49 :0]  idu_had_debug_info;                     
output  [39 :0]  idu_had_id_inst0_info;                  
output           idu_had_id_inst0_vld;                   
output  [39 :0]  idu_had_id_inst1_info;                  
output           idu_had_id_inst1_vld;                   
output  [39 :0]  idu_had_id_inst2_info;                  
output           idu_had_id_inst2_vld;                   
output           idu_had_iq_empty;                       
output           idu_had_pipe_stall;                     
output           idu_had_pipeline_empty;                 
output  [63 :0]  idu_had_wb_data;                        
output           idu_had_wb_vld;                         
output           idu_hpcp_backend_stall;                 
output           idu_hpcp_fence_sync_vld;                
output  [6  :0]  idu_hpcp_ir_inst0_type;                 
output           idu_hpcp_ir_inst0_vld;                  
output  [6  :0]  idu_hpcp_ir_inst1_type;                 
output           idu_hpcp_ir_inst1_vld;                  
output  [6  :0]  idu_hpcp_ir_inst2_type;                 
output           idu_hpcp_ir_inst2_vld;                  
output  [6  :0]  idu_hpcp_ir_inst3_type;                 
output           idu_hpcp_ir_inst3_vld;                  
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
output           ifu_biu_r_ready;                        
output  [39 :0]  ifu_biu_rd_addr;                        
output  [1  :0]  ifu_biu_rd_burst;                       
output  [3  :0]  ifu_biu_rd_cache;                       
output  [1  :0]  ifu_biu_rd_domain;                      
output           ifu_biu_rd_id;                          
output  [1  :0]  ifu_biu_rd_len;                         
output  [2  :0]  ifu_biu_rd_prot;                        
output           ifu_biu_rd_req;                         
output           ifu_biu_rd_req_gate;                    
output  [2  :0]  ifu_biu_rd_size;                        
output  [3  :0]  ifu_biu_rd_snoop;                       
output  [1  :0]  ifu_biu_rd_user;                        
output  [82 :0]  ifu_had_debug_info;                     
output           ifu_had_no_inst;                        
output           ifu_had_no_op;                          
output           ifu_had_reset_on;                       
output           ifu_hpcp_btb_inst;                      
output           ifu_hpcp_btb_mispred;                   
output           ifu_hpcp_frontend_stall;                
output           ifu_hpcp_icache_access;                 
output           ifu_hpcp_icache_miss;                   
output           ifu_mmu_abort;                          
output  [62 :0]  ifu_mmu_va;                             
output           ifu_mmu_va_vld;                         
output  [9  :0]  iu_had_debug_info;                      
output           lsu_biu_ac_empty;                       
output           lsu_biu_ac_ready;                       
output  [39 :0]  lsu_biu_ar_addr;                        
output  [1  :0]  lsu_biu_ar_bar;                         
output  [1  :0]  lsu_biu_ar_burst;                       
output  [3  :0]  lsu_biu_ar_cache;                       
output  [1  :0]  lsu_biu_ar_domain;                      
output           lsu_biu_ar_dp_req;                      
output  [4  :0]  lsu_biu_ar_id;                          
output  [1  :0]  lsu_biu_ar_len;                         
output           lsu_biu_ar_lock;                        
output  [2  :0]  lsu_biu_ar_prot;                        
output           lsu_biu_ar_req;                         
output           lsu_biu_ar_req_gate;                    
output  [2  :0]  lsu_biu_ar_size;                        
output  [3  :0]  lsu_biu_ar_snoop;                       
output  [2  :0]  lsu_biu_ar_user;                        
output           lsu_biu_aw_req_gate;                    
output  [39 :0]  lsu_biu_aw_st_addr;                     
output  [1  :0]  lsu_biu_aw_st_bar;                      
output  [1  :0]  lsu_biu_aw_st_burst;                    
output  [3  :0]  lsu_biu_aw_st_cache;                    
output  [1  :0]  lsu_biu_aw_st_domain;                   
output           lsu_biu_aw_st_dp_req;                   
output  [4  :0]  lsu_biu_aw_st_id;                       
output  [1  :0]  lsu_biu_aw_st_len;                      
output           lsu_biu_aw_st_lock;                     
output  [2  :0]  lsu_biu_aw_st_prot;                     
output           lsu_biu_aw_st_req;                      
output  [2  :0]  lsu_biu_aw_st_size;                     
output  [2  :0]  lsu_biu_aw_st_snoop;                    
output           lsu_biu_aw_st_unique;                   
output           lsu_biu_aw_st_user;                     
output  [39 :0]  lsu_biu_aw_vict_addr;                   
output  [1  :0]  lsu_biu_aw_vict_bar;                    
output  [1  :0]  lsu_biu_aw_vict_burst;                  
output  [3  :0]  lsu_biu_aw_vict_cache;                  
output  [1  :0]  lsu_biu_aw_vict_domain;                 
output           lsu_biu_aw_vict_dp_req;                 
output  [4  :0]  lsu_biu_aw_vict_id;                     
output  [1  :0]  lsu_biu_aw_vict_len;                    
output           lsu_biu_aw_vict_lock;                   
output  [2  :0]  lsu_biu_aw_vict_prot;                   
output           lsu_biu_aw_vict_req;                    
output  [2  :0]  lsu_biu_aw_vict_size;                   
output  [2  :0]  lsu_biu_aw_vict_snoop;                  
output           lsu_biu_aw_vict_unique;                 
output           lsu_biu_aw_vict_user;                   
output  [127:0]  lsu_biu_cd_data;                        
output           lsu_biu_cd_last;                        
output           lsu_biu_cd_valid;                       
output  [4  :0]  lsu_biu_cr_resp;                        
output           lsu_biu_cr_valid;                       
output           lsu_biu_r_linefill_ready;               
output  [127:0]  lsu_biu_w_st_data;                      
output           lsu_biu_w_st_last;                      
output  [15 :0]  lsu_biu_w_st_strb;                      
output           lsu_biu_w_st_vld;                       
output           lsu_biu_w_st_wns;                       
output  [127:0]  lsu_biu_w_vict_data;                    
output           lsu_biu_w_vict_last;                    
output  [15 :0]  lsu_biu_w_vict_strb;                    
output           lsu_biu_w_vict_vld;                     
output           lsu_biu_w_vict_wns;                     
output  [183:0]  lsu_had_debug_info;                     
output  [39 :0]  lsu_had_ld_addr;                        
output  [63 :0]  lsu_had_ld_data;                        
output  [6  :0]  lsu_had_ld_iid;                         
output           lsu_had_ld_req;                         
output  [3  :0]  lsu_had_ld_type;                        
output           lsu_had_no_op;                          
output  [39 :0]  lsu_had_st_addr;                        
output  [63 :0]  lsu_had_st_data;                        
output  [6  :0]  lsu_had_st_iid;                         
output           lsu_had_st_req;                         
output  [3  :0]  lsu_had_st_type;                        
output           lsu_hpcp_cache_read_access;             
output           lsu_hpcp_cache_read_miss;               
output           lsu_hpcp_cache_write_access;            
output           lsu_hpcp_cache_write_miss;              
output           lsu_hpcp_fence_stall;                   
output           lsu_hpcp_ld_stall_cross_4k;             
output           lsu_hpcp_ld_stall_other;                
output           lsu_hpcp_replay_data_discard;           
output           lsu_hpcp_replay_discard_sq;             
output           lsu_hpcp_st_stall_cross_4k;             
output           lsu_hpcp_st_stall_other;                
output  [1  :0]  lsu_hpcp_unalign_inst;                  
output           lsu_mmu_abort0;                         
output           lsu_mmu_abort1;                         
output           lsu_mmu_bus_error;                      
output  [63 :0]  lsu_mmu_data;                           
output           lsu_mmu_data_vld;                       
output  [6  :0]  lsu_mmu_id0;                            
output  [6  :0]  lsu_mmu_id1;                            
output           lsu_mmu_st_inst0;                       
output           lsu_mmu_st_inst1;                       
output  [27 :0]  lsu_mmu_stamo_pa;                       
output           lsu_mmu_stamo_vld;                      
output           lsu_mmu_tlb_all_inv;                    
output  [15 :0]  lsu_mmu_tlb_asid;                       
output           lsu_mmu_tlb_asid_all_inv;               
output  [26 :0]  lsu_mmu_tlb_va;                         
output           lsu_mmu_tlb_va_all_inv;                 
output           lsu_mmu_tlb_va_asid_inv;                
output  [63 :0]  lsu_mmu_va0;                            
output           lsu_mmu_va0_vld;                        
output  [63 :0]  lsu_mmu_va1;                            
output           lsu_mmu_va1_vld;                        
output  [27 :0]  lsu_mmu_va2;                            
output           lsu_mmu_va2_vld;                        
output  [27 :0]  lsu_mmu_vabuf0;                         
output  [27 :0]  lsu_mmu_vabuf1;                         
output           rtu_cpu_no_retire;                      
output           rtu_had_bkpt_data_st;                   
output           rtu_had_data_bkpta_vld;                 
output           rtu_had_data_bkptb_vld;                 
output           rtu_had_dbg_ack_info;                   
output           rtu_had_dbgreq_ack;                     
output  [42 :0]  rtu_had_debug_info;                     
output           rtu_had_inst0_bkpt_inst;                
output  [3  :0]  rtu_had_inst0_non_irv_bkpt;             
output  [3  :0]  rtu_had_inst1_non_irv_bkpt;             
output  [3  :0]  rtu_had_inst2_non_irv_bkpt;             
output           rtu_had_inst_bkpt_inst_vld;             
output           rtu_had_inst_bkpta_vld;                 
output           rtu_had_inst_bkptb_vld;                 
output           rtu_had_inst_exe_dead;                  
output           rtu_had_inst_not_wb;                    
output           rtu_had_inst_split;                     
output  [63 :0]  rtu_had_retire_inst0_info;              
output           rtu_had_retire_inst0_vld;               
output  [63 :0]  rtu_had_retire_inst1_info;              
output           rtu_had_retire_inst1_vld;               
output  [63 :0]  rtu_had_retire_inst2_info;              
output           rtu_had_retire_inst2_vld;               
output           rtu_had_rob_empty;                      
output           rtu_had_xx_dbg_ack_pc;                  
output           rtu_had_xx_mbkpt_chgflow;               
output           rtu_had_xx_mbkpt_data_ack;              
output           rtu_had_xx_mbkpt_inst_ack;              
output  [38 :0]  rtu_had_xx_pc;                          
output           rtu_had_xx_pcfifo_inst0_chgflow;        
output           rtu_had_xx_pcfifo_inst0_condbr;         
output           rtu_had_xx_pcfifo_inst0_condbr_taken;   
output  [6  :0]  rtu_had_xx_pcfifo_inst0_iid;            
output           rtu_had_xx_pcfifo_inst0_jmp;            
output  [38 :0]  rtu_had_xx_pcfifo_inst0_next_pc;        
output           rtu_had_xx_pcfifo_inst0_pcall;          
output           rtu_had_xx_pcfifo_inst0_preturn;        
output           rtu_had_xx_pcfifo_inst1_chgflow;        
output           rtu_had_xx_pcfifo_inst1_condbr;         
output           rtu_had_xx_pcfifo_inst1_condbr_taken;   
output           rtu_had_xx_pcfifo_inst1_jmp;            
output  [38 :0]  rtu_had_xx_pcfifo_inst1_next_pc;        
output           rtu_had_xx_pcfifo_inst1_pcall;          
output           rtu_had_xx_pcfifo_inst1_preturn;        
output           rtu_had_xx_pcfifo_inst2_chgflow;        
output           rtu_had_xx_pcfifo_inst2_condbr;         
output           rtu_had_xx_pcfifo_inst2_condbr_taken;   
output           rtu_had_xx_pcfifo_inst2_jmp;            
output  [38 :0]  rtu_had_xx_pcfifo_inst2_next_pc;        
output           rtu_had_xx_pcfifo_inst2_pcall;          
output           rtu_had_xx_pcfifo_inst2_preturn;        
output           rtu_had_xx_split_inst;                  
output           rtu_hpcp_inst0_ack_int;                 
output           rtu_hpcp_inst0_bht_mispred;             
output           rtu_hpcp_inst0_condbr;                  
output  [39 :0]  rtu_hpcp_inst0_cur_pc;                  
output           rtu_hpcp_inst0_jmp;                     
output           rtu_hpcp_inst0_jmp_mispred;             
output           rtu_hpcp_inst0_jmp_pc_offset_8m;        
output  [1  :0]  rtu_hpcp_inst0_num;                     
output  [2  :0]  rtu_hpcp_inst0_pc_offset;               
output           rtu_hpcp_inst0_spec_fail;               
output           rtu_hpcp_inst0_split;                   
output           rtu_hpcp_inst0_store;                   
output           rtu_hpcp_inst0_vld;                     
output           rtu_hpcp_inst1_condbr;                  
output  [39 :0]  rtu_hpcp_inst1_cur_pc;                  
output           rtu_hpcp_inst1_jmp;                     
output           rtu_hpcp_inst1_jmp_pc_offset_8m;        
output  [1  :0]  rtu_hpcp_inst1_num;                     
output  [2  :0]  rtu_hpcp_inst1_pc_offset;               
output           rtu_hpcp_inst1_split;                   
output           rtu_hpcp_inst1_store;                   
output           rtu_hpcp_inst1_vld;                     
output           rtu_hpcp_inst2_condbr;                  
output  [39 :0]  rtu_hpcp_inst2_cur_pc;                  
output           rtu_hpcp_inst2_jmp;                     
output           rtu_hpcp_inst2_jmp_pc_offset_8m;        
output  [1  :0]  rtu_hpcp_inst2_num;                     
output  [2  :0]  rtu_hpcp_inst2_pc_offset;               
output           rtu_hpcp_inst2_split;                   
output           rtu_hpcp_inst2_store;                   
output           rtu_hpcp_inst2_vld;                     
output           rtu_hpcp_trace_inst0_chgflow;           
output  [38 :0]  rtu_hpcp_trace_inst0_next_pc;           
output           rtu_hpcp_trace_inst1_chgflow;           
output  [38 :0]  rtu_hpcp_trace_inst1_next_pc;           
output           rtu_hpcp_trace_inst2_chgflow;           
output  [38 :0]  rtu_hpcp_trace_inst2_next_pc;           
output  [26 :0]  rtu_mmu_bad_vpn;                        
output           rtu_mmu_expt_vld;                       
output           rtu_pad_retire0;                        
output  [39 :0]  rtu_pad_retire0_pc;                     
output           rtu_pad_retire1;                        
output  [39 :0]  rtu_pad_retire1_pc;                     
output           rtu_pad_retire2;                        
output  [39 :0]  rtu_pad_retire2_pc;                     
output           rtu_yy_xx_dbgon;                        
output           rtu_yy_xx_flush;                        
output           rtu_yy_xx_retire0;                      
output           rtu_yy_xx_retire0_normal;               
output           rtu_yy_xx_retire1;                      
output           rtu_yy_xx_retire2;                      

// &Regs; @29

// &Wires; @30
wire    [39 :0]  biu_cp0_apb_base;                       
wire             biu_cp0_cmplt;                          
wire    [2  :0]  biu_cp0_coreid;                         
wire             biu_cp0_me_int;                         
wire             biu_cp0_ms_int;                         
wire             biu_cp0_mt_int;                         
wire    [127:0]  biu_cp0_rdata;                          
wire    [39 :0]  biu_cp0_rvba;                           
wire             biu_cp0_se_int;                         
wire             biu_cp0_ss_int;                         
wire             biu_cp0_st_int;                         
wire    [127:0]  biu_ifu_rd_data;                        
wire             biu_ifu_rd_data_vld;                    
wire             biu_ifu_rd_grnt;                        
wire             biu_ifu_rd_id;                          
wire             biu_ifu_rd_last;                        
wire    [1  :0]  biu_ifu_rd_resp;                        
wire    [39 :0]  biu_lsu_ac_addr;                        
wire    [2  :0]  biu_lsu_ac_prot;                        
wire             biu_lsu_ac_req;                         
wire    [3  :0]  biu_lsu_ac_snoop;                       
wire             biu_lsu_ar_ready;                       
wire             biu_lsu_aw_vb_grnt;                     
wire             biu_lsu_aw_wmb_grnt;                    
wire    [4  :0]  biu_lsu_b_id;                           
wire    [1  :0]  biu_lsu_b_resp;                         
wire             biu_lsu_b_vld;                          
wire             biu_lsu_cd_ready;                       
wire             biu_lsu_cr_ready;                       
wire    [127:0]  biu_lsu_r_data;                         
wire    [4  :0]  biu_lsu_r_id;                           
wire             biu_lsu_r_last;                         
wire    [3  :0]  biu_lsu_r_resp;                         
wire             biu_lsu_r_vld;                          
wire             biu_lsu_w_vb_grnt;                      
wire             biu_lsu_w_wmb_grnt;                     
wire             biu_yy_xx_no_op;                        
wire             cp0_biu_icg_en;                         
wire    [1  :0]  cp0_biu_lpmd_b;                         
wire    [15 :0]  cp0_biu_op;                             
wire             cp0_biu_sel;                            
wire    [63 :0]  cp0_biu_wdata;                          
wire    [31 :0]  cp0_had_cpuid_0;                        
wire    [3  :0]  cp0_had_debug_info;                     
wire    [1  :0]  cp0_had_lpmd_b;                         
wire    [1  :0]  cp0_had_trace_pm_wdata;                 
wire             cp0_had_trace_pm_wen;                   
wire             cp0_hpcp_icg_en;                        
wire    [11 :0]  cp0_hpcp_index;                         
wire             cp0_hpcp_int_disable;                   
wire    [31 :0]  cp0_hpcp_mcntwen;                       
wire    [3  :0]  cp0_hpcp_op;                            
wire             cp0_hpcp_pmdm;                          
wire             cp0_hpcp_pmds;                          
wire             cp0_hpcp_pmdu;                          
wire             cp0_hpcp_sel;                           
wire    [63 :0]  cp0_hpcp_src0;                          
wire    [63 :0]  cp0_hpcp_wdata;                         
wire             cp0_idu_cskyee;                         
wire             cp0_idu_dlb_disable;                    
wire    [2  :0]  cp0_idu_frm;                            
wire    [1  :0]  cp0_idu_fs;                             
wire             cp0_idu_icg_en;                         
wire             cp0_idu_iq_bypass_disable;              
wire             cp0_idu_rob_fold_disable;               
wire             cp0_idu_src2_fwd_disable;               
wire             cp0_idu_srcv2_fwd_disable;              
wire             cp0_idu_vill;                           
wire    [1  :0]  cp0_idu_vs;                             
wire    [6  :0]  cp0_idu_vstart;                         
wire             cp0_idu_zero_delay_move_disable;        
wire             cp0_ifu_bht_en;                         
wire             cp0_ifu_bht_inv;                        
wire             cp0_ifu_btb_en;                         
wire             cp0_ifu_btb_inv;                        
wire             cp0_ifu_icache_en;                      
wire             cp0_ifu_icache_inv;                     
wire             cp0_ifu_icache_pref_en;                 
wire    [16 :0]  cp0_ifu_icache_read_index;              
wire             cp0_ifu_icache_read_req;                
wire             cp0_ifu_icache_read_tag;                
wire             cp0_ifu_icache_read_way;                
wire             cp0_ifu_icg_en;                         
wire             cp0_ifu_ind_btb_en;                     
wire             cp0_ifu_ind_btb_inv;                    
wire             cp0_ifu_insde;                          
wire             cp0_ifu_iwpe;                           
wire             cp0_ifu_l0btb_en;                       
wire             cp0_ifu_lbuf_en;                        
wire             cp0_ifu_no_op_req;                      
wire             cp0_ifu_nsfe;                           
wire             cp0_ifu_ras_en;                         
wire             cp0_ifu_rst_inv_done;                   
wire    [39 :0]  cp0_ifu_rvbr;                           
wire    [39 :0]  cp0_ifu_vbr;                            
wire    [7  :0]  cp0_ifu_vl;                             
wire    [1  :0]  cp0_ifu_vlmul;                          
wire             cp0_ifu_vsetvli_pred_disable;           
wire             cp0_ifu_vsetvli_pred_mode;              
wire    [2  :0]  cp0_ifu_vsew;                           
wire             cp0_iu_div_entry_disable;               
wire             cp0_iu_div_entry_disable_clr;           
wire             cp0_iu_ex3_abnormal;                    
wire    [38 :0]  cp0_iu_ex3_efpc;                        
wire             cp0_iu_ex3_efpc_vld;                    
wire    [4  :0]  cp0_iu_ex3_expt_vec;                    
wire             cp0_iu_ex3_expt_vld;                    
wire             cp0_iu_ex3_flush;                       
wire    [6  :0]  cp0_iu_ex3_iid;                         
wire             cp0_iu_ex3_inst_vld;                    
wire    [31 :0]  cp0_iu_ex3_mtval;                       
wire    [63 :0]  cp0_iu_ex3_rslt_data;                   
wire    [6  :0]  cp0_iu_ex3_rslt_preg;                   
wire             cp0_iu_ex3_rslt_vld;                    
wire             cp0_iu_icg_en;                          
wire             cp0_iu_vill;                            
wire    [7  :0]  cp0_iu_vl;                              
wire             cp0_iu_vsetvli_pre_decd_disable;        
wire    [6  :0]  cp0_iu_vstart;                          
wire             cp0_lsu_amr;                            
wire             cp0_lsu_amr2;                           
wire             cp0_lsu_cb_aclr_dis;                    
wire             cp0_lsu_corr_dis;                       
wire             cp0_lsu_ctc_flush_dis;                  
wire             cp0_lsu_da_fwd_dis;                     
wire             cp0_lsu_dcache_clr;                     
wire             cp0_lsu_dcache_en;                      
wire             cp0_lsu_dcache_inv;                     
wire    [1  :0]  cp0_lsu_dcache_pref_dist;               
wire             cp0_lsu_dcache_pref_en;                 
wire    [16 :0]  cp0_lsu_dcache_read_index;              
wire             cp0_lsu_dcache_read_ld_tag;             
wire             cp0_lsu_dcache_read_req;                
wire             cp0_lsu_dcache_read_st_tag;             
wire             cp0_lsu_dcache_read_way;                
wire             cp0_lsu_fencei_broad_dis;               
wire             cp0_lsu_fencerw_broad_dis;              
wire             cp0_lsu_icg_en;                         
wire    [1  :0]  cp0_lsu_l2_pref_dist;                   
wire             cp0_lsu_l2_pref_en;                     
wire             cp0_lsu_l2_st_pref_en;                  
wire             cp0_lsu_mm;                             
wire             cp0_lsu_no_op_req;                      
wire             cp0_lsu_nsfe;                           
wire             cp0_lsu_pfu_mmu_dis;                    
wire    [29 :0]  cp0_lsu_timeout_cnt;                    
wire             cp0_lsu_tlb_broad_dis;                  
wire             cp0_lsu_tvm;                            
wire             cp0_lsu_ucme;                           
wire    [6  :0]  cp0_lsu_vstart;                         
wire             cp0_lsu_wa;                             
wire             cp0_lsu_wr_burst_dis;                   
wire             cp0_mmu_cskyee;                         
wire             cp0_mmu_icg_en;                         
wire             cp0_mmu_maee;                           
wire    [1  :0]  cp0_mmu_mpp;                            
wire             cp0_mmu_mprv;                           
wire             cp0_mmu_mxr;                            
wire             cp0_mmu_no_op_req;                      
wire             cp0_mmu_ptw_en;                         
wire    [1  :0]  cp0_mmu_reg_num;                        
wire             cp0_mmu_satp_sel;                       
wire             cp0_mmu_sum;                            
wire             cp0_mmu_tlb_all_inv;                    
wire    [63 :0]  cp0_mmu_wdata;                          
wire             cp0_mmu_wreg;                           
wire    [63 :0]  cp0_pad_mstatus;                        
wire             cp0_pmp_icg_en;                         
wire    [1  :0]  cp0_pmp_mpp;                            
wire             cp0_pmp_mprv;                           
wire    [4  :0]  cp0_pmp_reg_num;                        
wire    [63 :0]  cp0_pmp_wdata;                          
wire             cp0_pmp_wreg;                           
wire             cp0_rtu_icg_en;                         
wire             cp0_rtu_srt_en;                         
wire             cp0_rtu_xx_int_b;                       
wire    [4  :0]  cp0_rtu_xx_vec;                         
wire    [63 :0]  cp0_vfpu_fcsr;                          
wire    [31 :0]  cp0_vfpu_fxcr;                          
wire             cp0_vfpu_icg_en;                        
wire    [7  :0]  cp0_vfpu_vl;                            
wire             cp0_xx_core_icg_en;                     
wire             cp0_yy_clk_en;                          
wire             cp0_yy_dcache_pref_en;                  
wire             cp0_yy_hyper;                           
wire    [1  :0]  cp0_yy_priv_mode;                       
wire             cp0_yy_virtual_mode;                    
wire             forever_cpuclk;                         
wire             fpu_rst_b;                              
wire             had_cp0_xx_dbg;                         
wire             had_idu_debug_id_inst_en;               
wire    [63 :0]  had_idu_wbbr_data;                      
wire             had_idu_wbbr_vld;                       
wire    [31 :0]  had_ifu_ir;                             
wire             had_ifu_ir_vld;                         
wire    [38 :0]  had_ifu_pc;                             
wire             had_ifu_pcload;                         
wire             had_lsu_bus_trace_en;                   
wire             had_lsu_dbg_en;                         
wire             had_rtu_data_bkpt_dbgreq;               
wire             had_rtu_dbg_disable;                    
wire             had_rtu_dbg_req_en;                     
wire             had_rtu_debug_retire_info_en;           
wire             had_rtu_event_dbgreq;                   
wire             had_rtu_fdb;                            
wire             had_rtu_hw_dbgreq;                      
wire             had_rtu_hw_dbgreq_gateclk;              
wire             had_rtu_inst_bkpt_dbgreq;               
wire             had_rtu_non_irv_bkpt_dbgreq;            
wire             had_rtu_pop1_disa;                      
wire             had_rtu_trace_dbgreq;                   
wire             had_rtu_trace_en;                       
wire             had_rtu_xx_jdbreq;                      
wire             had_rtu_xx_tme;                         
wire    [39 :0]  had_yy_xx_bkpta_base;                   
wire    [7  :0]  had_yy_xx_bkpta_mask;                   
wire             had_yy_xx_bkpta_rc;                     
wire    [39 :0]  had_yy_xx_bkptb_base;                   
wire    [7  :0]  had_yy_xx_bkptb_mask;                   
wire             had_yy_xx_bkptb_rc;                     
wire             had_yy_xx_exit_dbg;                     
wire             hpcp_cp0_cmplt;                         
wire    [63 :0]  hpcp_cp0_data;                          
wire             hpcp_cp0_int_vld;                       
wire             hpcp_cp0_sce;                           
wire             hpcp_idu_cnt_en;                        
wire             hpcp_ifu_cnt_en;                        
wire             hpcp_lsu_cnt_en;                        
wire             hpcp_rtu_cnt_en;                        
wire    [6  :0]  idu_cp0_fesr_acc_updt_val;              
wire             idu_cp0_fesr_acc_updt_vld;              
wire    [4  :0]  idu_cp0_rf_func;                        
wire             idu_cp0_rf_gateclk_sel;                 
wire    [6  :0]  idu_cp0_rf_iid;                         
wire    [31 :0]  idu_cp0_rf_opcode;                      
wire    [6  :0]  idu_cp0_rf_preg;                        
wire             idu_cp0_rf_sel;                         
wire    [63 :0]  idu_cp0_rf_src0;                        
wire    [49 :0]  idu_had_debug_info;                     
wire    [39 :0]  idu_had_id_inst0_info;                  
wire             idu_had_id_inst0_vld;                   
wire    [39 :0]  idu_had_id_inst1_info;                  
wire             idu_had_id_inst1_vld;                   
wire    [39 :0]  idu_had_id_inst2_info;                  
wire             idu_had_id_inst2_vld;                   
wire             idu_had_iq_empty;                       
wire             idu_had_pipe_stall;                     
wire             idu_had_pipeline_empty;                 
wire    [63 :0]  idu_had_wb_data;                        
wire             idu_had_wb_vld;                         
wire             idu_hpcp_backend_stall;                 
wire             idu_hpcp_fence_sync_vld;                
wire    [6  :0]  idu_hpcp_ir_inst0_type;                 
wire             idu_hpcp_ir_inst0_vld;                  
wire    [6  :0]  idu_hpcp_ir_inst1_type;                 
wire             idu_hpcp_ir_inst1_vld;                  
wire    [6  :0]  idu_hpcp_ir_inst2_type;                 
wire             idu_hpcp_ir_inst2_vld;                  
wire    [6  :0]  idu_hpcp_ir_inst3_type;                 
wire             idu_hpcp_ir_inst3_vld;                  
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
wire             idu_ifu_id_bypass_stall;                
wire             idu_ifu_id_stall;                       
wire             idu_iu_is_div_gateclk_issue;            
wire             idu_iu_is_div_issue;                    
wire    [2  :0]  idu_iu_is_pcfifo_inst_num;              
wire             idu_iu_is_pcfifo_inst_vld;              
wire             idu_iu_rf_bju_gateclk_sel;              
wire             idu_iu_rf_bju_sel;                      
wire             idu_iu_rf_div_gateclk_sel;              
wire             idu_iu_rf_div_sel;                      
wire             idu_iu_rf_mult_gateclk_sel;             
wire             idu_iu_rf_mult_sel;                     
wire             idu_iu_rf_pipe0_alu_short;              
wire             idu_iu_rf_pipe0_cbus_gateclk_sel;       
wire    [6  :0]  idu_iu_rf_pipe0_dst_preg;               
wire             idu_iu_rf_pipe0_dst_vld;                
wire    [6  :0]  idu_iu_rf_pipe0_dst_vreg;               
wire             idu_iu_rf_pipe0_dstv_vld;               
wire    [4  :0]  idu_iu_rf_pipe0_expt_vec;               
wire             idu_iu_rf_pipe0_expt_vld;               
wire    [4  :0]  idu_iu_rf_pipe0_func;                   
wire             idu_iu_rf_pipe0_gateclk_sel;            
wire             idu_iu_rf_pipe0_high_hw_expt;           
wire    [6  :0]  idu_iu_rf_pipe0_iid;                    
wire    [5  :0]  idu_iu_rf_pipe0_imm;                    
wire    [31 :0]  idu_iu_rf_pipe0_opcode;                 
wire    [4  :0]  idu_iu_rf_pipe0_pid;                    
wire    [20 :0]  idu_iu_rf_pipe0_rslt_sel;               
wire             idu_iu_rf_pipe0_sel;                    
wire    [19 :0]  idu_iu_rf_pipe0_special_imm;            
wire    [63 :0]  idu_iu_rf_pipe0_src0;                   
wire    [63 :0]  idu_iu_rf_pipe0_src1;                   
wire    [63 :0]  idu_iu_rf_pipe0_src1_no_imm;            
wire    [63 :0]  idu_iu_rf_pipe0_src2;                   
wire    [7  :0]  idu_iu_rf_pipe0_vl;                     
wire    [1  :0]  idu_iu_rf_pipe0_vlmul;                  
wire    [2  :0]  idu_iu_rf_pipe0_vsew;                   
wire             idu_iu_rf_pipe1_alu_short;              
wire             idu_iu_rf_pipe1_cbus_gateclk_sel;       
wire    [6  :0]  idu_iu_rf_pipe1_dst_preg;               
wire             idu_iu_rf_pipe1_dst_vld;                
wire    [6  :0]  idu_iu_rf_pipe1_dst_vreg;               
wire             idu_iu_rf_pipe1_dstv_vld;               
wire    [4  :0]  idu_iu_rf_pipe1_func;                   
wire             idu_iu_rf_pipe1_gateclk_sel;            
wire    [6  :0]  idu_iu_rf_pipe1_iid;                    
wire    [5  :0]  idu_iu_rf_pipe1_imm;                    
wire    [6  :0]  idu_iu_rf_pipe1_mla_src2_preg;          
wire             idu_iu_rf_pipe1_mla_src2_vld;           
wire    [7  :0]  idu_iu_rf_pipe1_mult_func;              
wire    [20 :0]  idu_iu_rf_pipe1_rslt_sel;               
wire             idu_iu_rf_pipe1_sel;                    
wire    [63 :0]  idu_iu_rf_pipe1_src0;                   
wire    [63 :0]  idu_iu_rf_pipe1_src1;                   
wire    [63 :0]  idu_iu_rf_pipe1_src1_no_imm;            
wire    [63 :0]  idu_iu_rf_pipe1_src2;                   
wire    [7  :0]  idu_iu_rf_pipe1_vl;                     
wire    [1  :0]  idu_iu_rf_pipe1_vlmul;                  
wire    [2  :0]  idu_iu_rf_pipe1_vsew;                   
wire    [7  :0]  idu_iu_rf_pipe2_func;                   
wire    [6  :0]  idu_iu_rf_pipe2_iid;                    
wire             idu_iu_rf_pipe2_length;                 
wire    [20 :0]  idu_iu_rf_pipe2_offset;                 
wire             idu_iu_rf_pipe2_pcall;                  
wire    [4  :0]  idu_iu_rf_pipe2_pid;                    
wire             idu_iu_rf_pipe2_rts;                    
wire    [63 :0]  idu_iu_rf_pipe2_src0;                   
wire    [63 :0]  idu_iu_rf_pipe2_src1;                   
wire    [7  :0]  idu_iu_rf_pipe2_vl;                     
wire    [1  :0]  idu_iu_rf_pipe2_vlmul;                  
wire    [2  :0]  idu_iu_rf_pipe2_vsew;                   
wire             idu_iu_rf_special_gateclk_sel;          
wire             idu_iu_rf_special_sel;                  
wire             idu_lsu_rf_pipe3_already_da;            
wire             idu_lsu_rf_pipe3_atomic;                
wire             idu_lsu_rf_pipe3_bkpta_data;            
wire             idu_lsu_rf_pipe3_bkptb_data;            
wire             idu_lsu_rf_pipe3_gateclk_sel;           
wire    [6  :0]  idu_lsu_rf_pipe3_iid;                   
wire             idu_lsu_rf_pipe3_inst_fls;              
wire             idu_lsu_rf_pipe3_inst_ldr;              
wire    [1  :0]  idu_lsu_rf_pipe3_inst_size;             
wire    [1  :0]  idu_lsu_rf_pipe3_inst_type;             
wire    [11 :0]  idu_lsu_rf_pipe3_lch_entry;             
wire             idu_lsu_rf_pipe3_lsfifo;                
wire             idu_lsu_rf_pipe3_no_spec;               
wire             idu_lsu_rf_pipe3_no_spec_exist;         
wire             idu_lsu_rf_pipe3_off_0_extend;          
wire    [11 :0]  idu_lsu_rf_pipe3_offset;                
wire    [12 :0]  idu_lsu_rf_pipe3_offset_plus;           
wire             idu_lsu_rf_pipe3_oldest;                
wire    [14 :0]  idu_lsu_rf_pipe3_pc;                    
wire    [6  :0]  idu_lsu_rf_pipe3_preg;                  
wire             idu_lsu_rf_pipe3_sel;                   
wire    [3  :0]  idu_lsu_rf_pipe3_shift;                 
wire             idu_lsu_rf_pipe3_sign_extend;           
wire             idu_lsu_rf_pipe3_spec_fail;             
wire             idu_lsu_rf_pipe3_split;                 
wire    [63 :0]  idu_lsu_rf_pipe3_src0;                  
wire    [63 :0]  idu_lsu_rf_pipe3_src1;                  
wire             idu_lsu_rf_pipe3_unalign_2nd;           
wire    [6  :0]  idu_lsu_rf_pipe3_vreg;                  
wire             idu_lsu_rf_pipe4_already_da;            
wire             idu_lsu_rf_pipe4_atomic;                
wire             idu_lsu_rf_pipe4_bkpta_data;            
wire             idu_lsu_rf_pipe4_bkptb_data;            
wire    [3  :0]  idu_lsu_rf_pipe4_fence_mode;            
wire             idu_lsu_rf_pipe4_gateclk_sel;           
wire             idu_lsu_rf_pipe4_icc;                   
wire    [6  :0]  idu_lsu_rf_pipe4_iid;                   
wire    [31 :0]  idu_lsu_rf_pipe4_inst_code;             
wire             idu_lsu_rf_pipe4_inst_fls;              
wire             idu_lsu_rf_pipe4_inst_flush;            
wire    [1  :0]  idu_lsu_rf_pipe4_inst_mode;             
wire             idu_lsu_rf_pipe4_inst_share;            
wire    [1  :0]  idu_lsu_rf_pipe4_inst_size;             
wire             idu_lsu_rf_pipe4_inst_str;              
wire    [1  :0]  idu_lsu_rf_pipe4_inst_type;             
wire    [11 :0]  idu_lsu_rf_pipe4_lch_entry;             
wire             idu_lsu_rf_pipe4_lsfifo;                
wire             idu_lsu_rf_pipe4_mmu_req;               
wire             idu_lsu_rf_pipe4_no_spec;               
wire             idu_lsu_rf_pipe4_off_0_extend;          
wire    [11 :0]  idu_lsu_rf_pipe4_offset;                
wire    [12 :0]  idu_lsu_rf_pipe4_offset_plus;           
wire             idu_lsu_rf_pipe4_oldest;                
wire    [14 :0]  idu_lsu_rf_pipe4_pc;                    
wire    [11 :0]  idu_lsu_rf_pipe4_sdiq_entry;            
wire             idu_lsu_rf_pipe4_sel;                   
wire    [3  :0]  idu_lsu_rf_pipe4_shift;                 
wire             idu_lsu_rf_pipe4_spec_fail;             
wire             idu_lsu_rf_pipe4_split;                 
wire    [63 :0]  idu_lsu_rf_pipe4_src0;                  
wire    [63 :0]  idu_lsu_rf_pipe4_src1;                  
wire             idu_lsu_rf_pipe4_st;                    
wire             idu_lsu_rf_pipe4_staddr;                
wire             idu_lsu_rf_pipe4_sync_fence;            
wire             idu_lsu_rf_pipe4_unalign_2nd;           
wire             idu_lsu_rf_pipe5_gateclk_sel;           
wire    [11 :0]  idu_lsu_rf_pipe5_sdiq_entry;            
wire             idu_lsu_rf_pipe5_sel;                   
wire    [63 :0]  idu_lsu_rf_pipe5_src0;                  
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_fr;              
wire             idu_lsu_rf_pipe5_srcv0_fr_vld;          
wire             idu_lsu_rf_pipe5_srcv0_vld;             
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_vr0;             
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_vr1;             
wire             idu_lsu_rf_pipe5_stdata1_vld;           
wire             idu_lsu_rf_pipe5_unalign;               
wire             idu_lsu_vmb_create0_dp_en;              
wire             idu_lsu_vmb_create0_dst_ready;          
wire             idu_lsu_vmb_create0_en;                 
wire             idu_lsu_vmb_create0_gateclk_en;         
wire    [11 :0]  idu_lsu_vmb_create0_sdiq_entry;         
wire    [6  :0]  idu_lsu_vmb_create0_split_num;          
wire             idu_lsu_vmb_create0_unit_stride;        
wire             idu_lsu_vmb_create0_vamo;               
wire    [7  :0]  idu_lsu_vmb_create0_vl;                 
wire    [5  :0]  idu_lsu_vmb_create0_vreg;               
wire    [1  :0]  idu_lsu_vmb_create0_vsew;               
wire             idu_lsu_vmb_create1_dp_en;              
wire             idu_lsu_vmb_create1_dst_ready;          
wire             idu_lsu_vmb_create1_en;                 
wire             idu_lsu_vmb_create1_gateclk_en;         
wire    [11 :0]  idu_lsu_vmb_create1_sdiq_entry;         
wire    [6  :0]  idu_lsu_vmb_create1_split_num;          
wire             idu_lsu_vmb_create1_unit_stride;        
wire             idu_lsu_vmb_create1_vamo;               
wire    [7  :0]  idu_lsu_vmb_create1_vl;                 
wire    [5  :0]  idu_lsu_vmb_create1_vreg;               
wire    [1  :0]  idu_lsu_vmb_create1_vsew;               
wire             idu_rst_b;                              
wire             idu_rtu_fence_idle;                     
wire             idu_rtu_ir_ereg0_alloc_vld;             
wire             idu_rtu_ir_ereg1_alloc_vld;             
wire             idu_rtu_ir_ereg2_alloc_vld;             
wire             idu_rtu_ir_ereg3_alloc_vld;             
wire             idu_rtu_ir_ereg_alloc_gateclk_vld;      
wire             idu_rtu_ir_freg0_alloc_vld;             
wire             idu_rtu_ir_freg1_alloc_vld;             
wire             idu_rtu_ir_freg2_alloc_vld;             
wire             idu_rtu_ir_freg3_alloc_vld;             
wire             idu_rtu_ir_freg_alloc_gateclk_vld;      
wire             idu_rtu_ir_preg0_alloc_vld;             
wire             idu_rtu_ir_preg1_alloc_vld;             
wire             idu_rtu_ir_preg2_alloc_vld;             
wire             idu_rtu_ir_preg3_alloc_vld;             
wire             idu_rtu_ir_preg_alloc_gateclk_vld;      
wire             idu_rtu_ir_vreg0_alloc_vld;             
wire             idu_rtu_ir_vreg1_alloc_vld;             
wire             idu_rtu_ir_vreg2_alloc_vld;             
wire             idu_rtu_ir_vreg3_alloc_vld;             
wire             idu_rtu_ir_vreg_alloc_gateclk_vld;      
wire    [4  :0]  idu_rtu_pst_dis_inst0_dst_reg;          
wire    [4  :0]  idu_rtu_pst_dis_inst0_dstv_reg;         
wire    [4  :0]  idu_rtu_pst_dis_inst0_ereg;             
wire    [6  :0]  idu_rtu_pst_dis_inst0_ereg_iid;         
wire             idu_rtu_pst_dis_inst0_ereg_vld;         
wire             idu_rtu_pst_dis_inst0_freg_vld;         
wire    [6  :0]  idu_rtu_pst_dis_inst0_preg;             
wire    [6  :0]  idu_rtu_pst_dis_inst0_preg_iid;         
wire             idu_rtu_pst_dis_inst0_preg_vld;         
wire    [4  :0]  idu_rtu_pst_dis_inst0_rel_ereg;         
wire    [6  :0]  idu_rtu_pst_dis_inst0_rel_preg;         
wire    [5  :0]  idu_rtu_pst_dis_inst0_rel_vreg;         
wire    [5  :0]  idu_rtu_pst_dis_inst0_vreg;             
wire    [6  :0]  idu_rtu_pst_dis_inst0_vreg_iid;         
wire             idu_rtu_pst_dis_inst0_vreg_vld;         
wire    [4  :0]  idu_rtu_pst_dis_inst1_dst_reg;          
wire    [4  :0]  idu_rtu_pst_dis_inst1_dstv_reg;         
wire    [4  :0]  idu_rtu_pst_dis_inst1_ereg;             
wire    [6  :0]  idu_rtu_pst_dis_inst1_ereg_iid;         
wire             idu_rtu_pst_dis_inst1_ereg_vld;         
wire             idu_rtu_pst_dis_inst1_freg_vld;         
wire    [6  :0]  idu_rtu_pst_dis_inst1_preg;             
wire    [6  :0]  idu_rtu_pst_dis_inst1_preg_iid;         
wire             idu_rtu_pst_dis_inst1_preg_vld;         
wire    [4  :0]  idu_rtu_pst_dis_inst1_rel_ereg;         
wire    [6  :0]  idu_rtu_pst_dis_inst1_rel_preg;         
wire    [5  :0]  idu_rtu_pst_dis_inst1_rel_vreg;         
wire    [5  :0]  idu_rtu_pst_dis_inst1_vreg;             
wire    [6  :0]  idu_rtu_pst_dis_inst1_vreg_iid;         
wire             idu_rtu_pst_dis_inst1_vreg_vld;         
wire    [4  :0]  idu_rtu_pst_dis_inst2_dst_reg;          
wire    [4  :0]  idu_rtu_pst_dis_inst2_dstv_reg;         
wire    [4  :0]  idu_rtu_pst_dis_inst2_ereg;             
wire    [6  :0]  idu_rtu_pst_dis_inst2_ereg_iid;         
wire             idu_rtu_pst_dis_inst2_ereg_vld;         
wire             idu_rtu_pst_dis_inst2_freg_vld;         
wire    [6  :0]  idu_rtu_pst_dis_inst2_preg;             
wire    [6  :0]  idu_rtu_pst_dis_inst2_preg_iid;         
wire             idu_rtu_pst_dis_inst2_preg_vld;         
wire    [4  :0]  idu_rtu_pst_dis_inst2_rel_ereg;         
wire    [6  :0]  idu_rtu_pst_dis_inst2_rel_preg;         
wire    [5  :0]  idu_rtu_pst_dis_inst2_rel_vreg;         
wire    [5  :0]  idu_rtu_pst_dis_inst2_vreg;             
wire    [6  :0]  idu_rtu_pst_dis_inst2_vreg_iid;         
wire             idu_rtu_pst_dis_inst2_vreg_vld;         
wire    [4  :0]  idu_rtu_pst_dis_inst3_dst_reg;          
wire    [4  :0]  idu_rtu_pst_dis_inst3_dstv_reg;         
wire    [4  :0]  idu_rtu_pst_dis_inst3_ereg;             
wire    [6  :0]  idu_rtu_pst_dis_inst3_ereg_iid;         
wire             idu_rtu_pst_dis_inst3_ereg_vld;         
wire             idu_rtu_pst_dis_inst3_freg_vld;         
wire    [6  :0]  idu_rtu_pst_dis_inst3_preg;             
wire    [6  :0]  idu_rtu_pst_dis_inst3_preg_iid;         
wire             idu_rtu_pst_dis_inst3_preg_vld;         
wire    [4  :0]  idu_rtu_pst_dis_inst3_rel_ereg;         
wire    [6  :0]  idu_rtu_pst_dis_inst3_rel_preg;         
wire    [5  :0]  idu_rtu_pst_dis_inst3_rel_vreg;         
wire    [5  :0]  idu_rtu_pst_dis_inst3_vreg;             
wire    [6  :0]  idu_rtu_pst_dis_inst3_vreg_iid;         
wire             idu_rtu_pst_dis_inst3_vreg_vld;         
wire    [63 :0]  idu_rtu_pst_freg_dealloc_mask;          
wire    [95 :0]  idu_rtu_pst_preg_dealloc_mask;          
wire    [63 :0]  idu_rtu_pst_vreg_dealloc_mask;          
wire    [39 :0]  idu_rtu_rob_create0_data;               
wire             idu_rtu_rob_create0_dp_en;              
wire             idu_rtu_rob_create0_en;                 
wire             idu_rtu_rob_create0_gateclk_en;         
wire    [39 :0]  idu_rtu_rob_create1_data;               
wire             idu_rtu_rob_create1_dp_en;              
wire             idu_rtu_rob_create1_en;                 
wire             idu_rtu_rob_create1_gateclk_en;         
wire    [39 :0]  idu_rtu_rob_create2_data;               
wire             idu_rtu_rob_create2_dp_en;              
wire             idu_rtu_rob_create2_en;                 
wire             idu_rtu_rob_create2_gateclk_en;         
wire    [39 :0]  idu_rtu_rob_create3_data;               
wire             idu_rtu_rob_create3_dp_en;              
wire             idu_rtu_rob_create3_en;                 
wire             idu_rtu_rob_create3_gateclk_en;         
wire             idu_vfpu_is_vdiv_gateclk_issue;         
wire             idu_vfpu_is_vdiv_issue;                 
wire    [4  :0]  idu_vfpu_rf_pipe6_dst_ereg;             
wire    [6  :0]  idu_vfpu_rf_pipe6_dst_preg;             
wire             idu_vfpu_rf_pipe6_dst_vld;              
wire    [6  :0]  idu_vfpu_rf_pipe6_dst_vreg;             
wire             idu_vfpu_rf_pipe6_dste_vld;             
wire             idu_vfpu_rf_pipe6_dstv_vld;             
wire    [11 :0]  idu_vfpu_rf_pipe6_eu_sel;               
wire    [19 :0]  idu_vfpu_rf_pipe6_func;                 
wire             idu_vfpu_rf_pipe6_gateclk_sel;          
wire    [6  :0]  idu_vfpu_rf_pipe6_iid;                  
wire    [2  :0]  idu_vfpu_rf_pipe6_imm0;                 
wire    [5  :0]  idu_vfpu_rf_pipe6_inst_type;            
wire             idu_vfpu_rf_pipe6_mla_srcv2_vld;        
wire    [6  :0]  idu_vfpu_rf_pipe6_mla_srcv2_vreg;       
wire    [2  :0]  idu_vfpu_rf_pipe6_ready_stage;          
wire             idu_vfpu_rf_pipe6_sel;                  
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv0_fr;             
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv1_fr;             
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv2_fr;             
wire    [2  :0]  idu_vfpu_rf_pipe6_vmla_type;            
wire    [4  :0]  idu_vfpu_rf_pipe7_dst_ereg;             
wire    [6  :0]  idu_vfpu_rf_pipe7_dst_preg;             
wire             idu_vfpu_rf_pipe7_dst_vld;              
wire    [6  :0]  idu_vfpu_rf_pipe7_dst_vreg;             
wire             idu_vfpu_rf_pipe7_dste_vld;             
wire             idu_vfpu_rf_pipe7_dstv_vld;             
wire    [11 :0]  idu_vfpu_rf_pipe7_eu_sel;               
wire    [19 :0]  idu_vfpu_rf_pipe7_func;                 
wire             idu_vfpu_rf_pipe7_gateclk_sel;          
wire    [6  :0]  idu_vfpu_rf_pipe7_iid;                  
wire    [2  :0]  idu_vfpu_rf_pipe7_imm0;                 
wire    [5  :0]  idu_vfpu_rf_pipe7_inst_type;            
wire             idu_vfpu_rf_pipe7_mla_srcv2_vld;        
wire    [6  :0]  idu_vfpu_rf_pipe7_mla_srcv2_vreg;       
wire    [2  :0]  idu_vfpu_rf_pipe7_ready_stage;          
wire             idu_vfpu_rf_pipe7_sel;                  
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv0_fr;             
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv1_fr;             
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv2_fr;             
wire    [2  :0]  idu_vfpu_rf_pipe7_vmla_type;            
wire             ifu_biu_r_ready;                        
wire    [39 :0]  ifu_biu_rd_addr;                        
wire    [1  :0]  ifu_biu_rd_burst;                       
wire    [3  :0]  ifu_biu_rd_cache;                       
wire    [1  :0]  ifu_biu_rd_domain;                      
wire             ifu_biu_rd_id;                          
wire    [1  :0]  ifu_biu_rd_len;                         
wire    [2  :0]  ifu_biu_rd_prot;                        
wire             ifu_biu_rd_req;                         
wire             ifu_biu_rd_req_gate;                    
wire    [2  :0]  ifu_biu_rd_size;                        
wire    [3  :0]  ifu_biu_rd_snoop;                       
wire    [1  :0]  ifu_biu_rd_user;                        
wire             ifu_cp0_bht_inv_done;                   
wire             ifu_cp0_btb_inv_done;                   
wire             ifu_cp0_icache_inv_done;                
wire    [127:0]  ifu_cp0_icache_read_data;               
wire             ifu_cp0_icache_read_data_vld;           
wire             ifu_cp0_ind_btb_inv_done;               
wire             ifu_cp0_rst_inv_req;                    
wire    [82 :0]  ifu_had_debug_info;                     
wire             ifu_had_no_inst;                        
wire             ifu_had_no_op;                          
wire             ifu_had_reset_on;                       
wire             ifu_hpcp_btb_inst;                      
wire             ifu_hpcp_btb_mispred;                   
wire             ifu_hpcp_frontend_stall;                
wire             ifu_hpcp_icache_access;                 
wire             ifu_hpcp_icache_miss;                   
wire    [72 :0]  ifu_idu_ib_inst0_data;                  
wire             ifu_idu_ib_inst0_vld;                   
wire    [72 :0]  ifu_idu_ib_inst1_data;                  
wire             ifu_idu_ib_inst1_vld;                   
wire    [72 :0]  ifu_idu_ib_inst2_data;                  
wire             ifu_idu_ib_inst2_vld;                   
wire             ifu_idu_ib_pipedown_gateclk;            
wire             ifu_iu_pcfifo_create0_bht_pred;         
wire    [24 :0]  ifu_iu_pcfifo_create0_chk_idx;          
wire    [39 :0]  ifu_iu_pcfifo_create0_cur_pc;           
wire             ifu_iu_pcfifo_create0_dst_vld;          
wire             ifu_iu_pcfifo_create0_en;               
wire             ifu_iu_pcfifo_create0_gateclk_en;       
wire             ifu_iu_pcfifo_create0_jal;              
wire             ifu_iu_pcfifo_create0_jalr;             
wire             ifu_iu_pcfifo_create0_jmp_mispred;      
wire    [39 :0]  ifu_iu_pcfifo_create0_tar_pc;           
wire             ifu_iu_pcfifo_create1_bht_pred;         
wire    [24 :0]  ifu_iu_pcfifo_create1_chk_idx;          
wire    [39 :0]  ifu_iu_pcfifo_create1_cur_pc;           
wire             ifu_iu_pcfifo_create1_dst_vld;          
wire             ifu_iu_pcfifo_create1_en;               
wire             ifu_iu_pcfifo_create1_gateclk_en;       
wire             ifu_iu_pcfifo_create1_jal;              
wire             ifu_iu_pcfifo_create1_jalr;             
wire             ifu_iu_pcfifo_create1_jmp_mispred;      
wire    [39 :0]  ifu_iu_pcfifo_create1_tar_pc;           
wire             ifu_lsu_icache_inv_done;                
wire             ifu_mmu_abort;                          
wire    [62 :0]  ifu_mmu_va;                             
wire             ifu_mmu_va_vld;                         
wire             ifu_rst_b;                              
wire    [38 :0]  ifu_rtu_cur_pc;                         
wire             ifu_rtu_cur_pc_load;                    
wire             ifu_xx_sync_reset;                      
wire             ifu_yy_xx_no_op;                        
wire    [9  :0]  iu_had_debug_info;                      
wire             iu_idu_div_busy;                        
wire             iu_idu_div_inst_vld;                    
wire    [6  :0]  iu_idu_div_preg_dup0;                   
wire    [6  :0]  iu_idu_div_preg_dup1;                   
wire    [6  :0]  iu_idu_div_preg_dup2;                   
wire    [6  :0]  iu_idu_div_preg_dup3;                   
wire    [6  :0]  iu_idu_div_preg_dup4;                   
wire             iu_idu_div_wb_stall;                    
wire    [6  :0]  iu_idu_ex1_pipe0_fwd_preg;              
wire    [63 :0]  iu_idu_ex1_pipe0_fwd_preg_data;         
wire             iu_idu_ex1_pipe0_fwd_preg_vld;          
wire    [6  :0]  iu_idu_ex1_pipe1_fwd_preg;              
wire    [63 :0]  iu_idu_ex1_pipe1_fwd_preg_data;         
wire             iu_idu_ex1_pipe1_fwd_preg_vld;          
wire             iu_idu_ex1_pipe1_mult_stall;            
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg;               
wire    [63 :0]  iu_idu_ex2_pipe0_wb_preg_data;          
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup0;          
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup1;          
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup2;          
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup3;          
wire    [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup4;          
wire    [95 :0]  iu_idu_ex2_pipe0_wb_preg_expand;        
wire             iu_idu_ex2_pipe0_wb_preg_vld;           
wire             iu_idu_ex2_pipe0_wb_preg_vld_dup0;      
wire             iu_idu_ex2_pipe0_wb_preg_vld_dup1;      
wire             iu_idu_ex2_pipe0_wb_preg_vld_dup2;      
wire             iu_idu_ex2_pipe0_wb_preg_vld_dup3;      
wire             iu_idu_ex2_pipe0_wb_preg_vld_dup4;      
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup0;    
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup1;    
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup2;    
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup3;    
wire             iu_idu_ex2_pipe1_mult_inst_vld_dup4;    
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup0;             
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup1;             
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup2;             
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup3;             
wire    [6  :0]  iu_idu_ex2_pipe1_preg_dup4;             
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg;               
wire    [63 :0]  iu_idu_ex2_pipe1_wb_preg_data;          
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup0;          
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup1;          
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup2;          
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup3;          
wire    [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup4;          
wire    [95 :0]  iu_idu_ex2_pipe1_wb_preg_expand;        
wire             iu_idu_ex2_pipe1_wb_preg_vld;           
wire             iu_idu_ex2_pipe1_wb_preg_vld_dup0;      
wire             iu_idu_ex2_pipe1_wb_preg_vld_dup1;      
wire             iu_idu_ex2_pipe1_wb_preg_vld_dup2;      
wire             iu_idu_ex2_pipe1_wb_preg_vld_dup3;      
wire             iu_idu_ex2_pipe1_wb_preg_vld_dup4;      
wire             iu_idu_mispred_stall;                   
wire    [4  :0]  iu_idu_pcfifo_dis_inst0_pid;            
wire    [4  :0]  iu_idu_pcfifo_dis_inst1_pid;            
wire    [4  :0]  iu_idu_pcfifo_dis_inst2_pid;            
wire    [4  :0]  iu_idu_pcfifo_dis_inst3_pid;            
wire             iu_idu_pipe1_mla_src2_no_fwd;           
wire             iu_ifu_bht_check_vld;                   
wire             iu_ifu_bht_condbr_taken;                
wire             iu_ifu_bht_pred;                        
wire    [62 :0]  iu_ifu_chgflw_pc;                       
wire    [7  :0]  iu_ifu_chgflw_vl;                       
wire             iu_ifu_chgflw_vld;                      
wire    [1  :0]  iu_ifu_chgflw_vlmul;                    
wire    [2  :0]  iu_ifu_chgflw_vsew;                     
wire    [24 :0]  iu_ifu_chk_idx;                         
wire    [38 :0]  iu_ifu_cur_pc;                          
wire             iu_ifu_mispred_stall;                   
wire             iu_ifu_pcfifo_full;                     
wire    [95 :0]  iu_rtu_ex2_pipe0_wb_preg_expand;        
wire             iu_rtu_ex2_pipe0_wb_preg_vld;           
wire    [95 :0]  iu_rtu_ex2_pipe1_wb_preg_expand;        
wire             iu_rtu_ex2_pipe1_wb_preg_vld;           
wire    [47 :0]  iu_rtu_pcfifo_pop0_data;                
wire    [47 :0]  iu_rtu_pcfifo_pop1_data;                
wire    [47 :0]  iu_rtu_pcfifo_pop2_data;                
wire             iu_rtu_pipe0_abnormal;                  
wire             iu_rtu_pipe0_bkpt;                      
wire             iu_rtu_pipe0_cmplt;                     
wire    [38 :0]  iu_rtu_pipe0_efpc;                      
wire             iu_rtu_pipe0_efpc_vld;                  
wire    [4  :0]  iu_rtu_pipe0_expt_vec;                  
wire             iu_rtu_pipe0_expt_vld;                  
wire             iu_rtu_pipe0_flush;                     
wire             iu_rtu_pipe0_high_hw_expt;              
wire    [6  :0]  iu_rtu_pipe0_iid;                       
wire             iu_rtu_pipe0_immu_expt;                 
wire    [31 :0]  iu_rtu_pipe0_mtval;                     
wire             iu_rtu_pipe0_vsetvl;                    
wire    [6  :0]  iu_rtu_pipe0_vstart;                    
wire             iu_rtu_pipe0_vstart_vld;                
wire             iu_rtu_pipe1_cmplt;                     
wire    [6  :0]  iu_rtu_pipe1_iid;                       
wire             iu_rtu_pipe2_abnormal;                  
wire             iu_rtu_pipe2_bht_mispred;               
wire             iu_rtu_pipe2_cmplt;                     
wire    [6  :0]  iu_rtu_pipe2_iid;                       
wire             iu_rtu_pipe2_jmp_mispred;               
wire    [4  :0]  iu_vfpu_ex1_pipe0_mtvr_inst;            
wire    [7  :0]  iu_vfpu_ex1_pipe0_mtvr_vl;              
wire             iu_vfpu_ex1_pipe0_mtvr_vld;             
wire    [1  :0]  iu_vfpu_ex1_pipe0_mtvr_vlmul;           
wire    [6  :0]  iu_vfpu_ex1_pipe0_mtvr_vreg;            
wire    [2  :0]  iu_vfpu_ex1_pipe0_mtvr_vsew;            
wire    [4  :0]  iu_vfpu_ex1_pipe1_mtvr_inst;            
wire    [7  :0]  iu_vfpu_ex1_pipe1_mtvr_vl;              
wire             iu_vfpu_ex1_pipe1_mtvr_vld;             
wire    [1  :0]  iu_vfpu_ex1_pipe1_mtvr_vlmul;           
wire    [6  :0]  iu_vfpu_ex1_pipe1_mtvr_vreg;            
wire    [2  :0]  iu_vfpu_ex1_pipe1_mtvr_vsew;            
wire    [63 :0]  iu_vfpu_ex2_pipe0_mtvr_src0;            
wire             iu_vfpu_ex2_pipe0_mtvr_vld;             
wire    [63 :0]  iu_vfpu_ex2_pipe1_mtvr_src0;            
wire             iu_vfpu_ex2_pipe1_mtvr_vld;             
wire             iu_yy_xx_cancel;                        
wire             lsu_biu_ac_empty;                       
wire             lsu_biu_ac_ready;                       
wire    [39 :0]  lsu_biu_ar_addr;                        
wire    [1  :0]  lsu_biu_ar_bar;                         
wire    [1  :0]  lsu_biu_ar_burst;                       
wire    [3  :0]  lsu_biu_ar_cache;                       
wire    [1  :0]  lsu_biu_ar_domain;                      
wire             lsu_biu_ar_dp_req;                      
wire    [4  :0]  lsu_biu_ar_id;                          
wire    [1  :0]  lsu_biu_ar_len;                         
wire             lsu_biu_ar_lock;                        
wire    [2  :0]  lsu_biu_ar_prot;                        
wire             lsu_biu_ar_req;                         
wire             lsu_biu_ar_req_gate;                    
wire    [2  :0]  lsu_biu_ar_size;                        
wire    [3  :0]  lsu_biu_ar_snoop;                       
wire    [2  :0]  lsu_biu_ar_user;                        
wire             lsu_biu_aw_req_gate;                    
wire    [39 :0]  lsu_biu_aw_st_addr;                     
wire    [1  :0]  lsu_biu_aw_st_bar;                      
wire    [1  :0]  lsu_biu_aw_st_burst;                    
wire    [3  :0]  lsu_biu_aw_st_cache;                    
wire    [1  :0]  lsu_biu_aw_st_domain;                   
wire             lsu_biu_aw_st_dp_req;                   
wire    [4  :0]  lsu_biu_aw_st_id;                       
wire    [1  :0]  lsu_biu_aw_st_len;                      
wire             lsu_biu_aw_st_lock;                     
wire    [2  :0]  lsu_biu_aw_st_prot;                     
wire             lsu_biu_aw_st_req;                      
wire    [2  :0]  lsu_biu_aw_st_size;                     
wire    [2  :0]  lsu_biu_aw_st_snoop;                    
wire             lsu_biu_aw_st_unique;                   
wire             lsu_biu_aw_st_user;                     
wire    [39 :0]  lsu_biu_aw_vict_addr;                   
wire    [1  :0]  lsu_biu_aw_vict_bar;                    
wire    [1  :0]  lsu_biu_aw_vict_burst;                  
wire    [3  :0]  lsu_biu_aw_vict_cache;                  
wire    [1  :0]  lsu_biu_aw_vict_domain;                 
wire             lsu_biu_aw_vict_dp_req;                 
wire    [4  :0]  lsu_biu_aw_vict_id;                     
wire    [1  :0]  lsu_biu_aw_vict_len;                    
wire             lsu_biu_aw_vict_lock;                   
wire    [2  :0]  lsu_biu_aw_vict_prot;                   
wire             lsu_biu_aw_vict_req;                    
wire    [2  :0]  lsu_biu_aw_vict_size;                   
wire    [2  :0]  lsu_biu_aw_vict_snoop;                  
wire             lsu_biu_aw_vict_unique;                 
wire             lsu_biu_aw_vict_user;                   
wire    [127:0]  lsu_biu_cd_data;                        
wire             lsu_biu_cd_last;                        
wire             lsu_biu_cd_valid;                       
wire    [4  :0]  lsu_biu_cr_resp;                        
wire             lsu_biu_cr_valid;                       
wire             lsu_biu_r_linefill_ready;               
wire    [127:0]  lsu_biu_w_st_data;                      
wire             lsu_biu_w_st_last;                      
wire    [15 :0]  lsu_biu_w_st_strb;                      
wire             lsu_biu_w_st_vld;                       
wire             lsu_biu_w_st_wns;                       
wire    [127:0]  lsu_biu_w_vict_data;                    
wire             lsu_biu_w_vict_last;                    
wire    [15 :0]  lsu_biu_w_vict_strb;                    
wire             lsu_biu_w_vict_vld;                     
wire             lsu_biu_w_vict_wns;                     
wire             lsu_cp0_dcache_done;                    
wire    [127:0]  lsu_cp0_dcache_read_data;               
wire             lsu_cp0_dcache_read_data_vld;           
wire    [183:0]  lsu_had_debug_info;                     
wire    [39 :0]  lsu_had_ld_addr;                        
wire    [63 :0]  lsu_had_ld_data;                        
wire    [6  :0]  lsu_had_ld_iid;                         
wire             lsu_had_ld_req;                         
wire    [3  :0]  lsu_had_ld_type;                        
wire             lsu_had_no_op;                          
wire    [39 :0]  lsu_had_st_addr;                        
wire    [63 :0]  lsu_had_st_data;                        
wire    [6  :0]  lsu_had_st_iid;                         
wire             lsu_had_st_req;                         
wire    [3  :0]  lsu_had_st_type;                        
wire             lsu_hpcp_cache_read_access;             
wire             lsu_hpcp_cache_read_miss;               
wire             lsu_hpcp_cache_write_access;            
wire             lsu_hpcp_cache_write_miss;              
wire             lsu_hpcp_fence_stall;                   
wire             lsu_hpcp_ld_stall_cross_4k;             
wire             lsu_hpcp_ld_stall_other;                
wire             lsu_hpcp_replay_data_discard;           
wire             lsu_hpcp_replay_discard_sq;             
wire             lsu_hpcp_st_stall_cross_4k;             
wire             lsu_hpcp_st_stall_other;                
wire    [1  :0]  lsu_hpcp_unalign_inst;                  
wire             lsu_idu_ag_pipe3_load_inst_vld;         
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dup0;             
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dup1;             
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dup2;             
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dup3;             
wire    [6  :0]  lsu_idu_ag_pipe3_preg_dup4;             
wire             lsu_idu_ag_pipe3_vload_inst_vld;        
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dup0;             
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dup1;             
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dup2;             
wire    [6  :0]  lsu_idu_ag_pipe3_vreg_dup3;             
wire    [11 :0]  lsu_idu_already_da;                     
wire    [11 :0]  lsu_idu_bkpta_data;                     
wire    [11 :0]  lsu_idu_bkptb_data;                     
wire    [6  :0]  lsu_idu_da_pipe3_fwd_preg;              
wire    [63 :0]  lsu_idu_da_pipe3_fwd_preg_data;         
wire             lsu_idu_da_pipe3_fwd_preg_vld;          
wire    [6  :0]  lsu_idu_da_pipe3_fwd_vreg;              
wire    [63 :0]  lsu_idu_da_pipe3_fwd_vreg_fr_data;      
wire             lsu_idu_da_pipe3_fwd_vreg_vld;          
wire    [63 :0]  lsu_idu_da_pipe3_fwd_vreg_vr0_data;     
wire    [63 :0]  lsu_idu_da_pipe3_fwd_vreg_vr1_data;     
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1; 
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2; 
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3; 
wire             lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4; 
wire             lsu_idu_dc_pipe3_load_inst_vld_dup0;    
wire             lsu_idu_dc_pipe3_load_inst_vld_dup1;    
wire             lsu_idu_dc_pipe3_load_inst_vld_dup2;    
wire             lsu_idu_dc_pipe3_load_inst_vld_dup3;    
wire             lsu_idu_dc_pipe3_load_inst_vld_dup4;    
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dup0;             
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dup1;             
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dup2;             
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dup3;             
wire    [6  :0]  lsu_idu_dc_pipe3_preg_dup4;             
wire             lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
wire             lsu_idu_dc_pipe3_vload_inst_vld_dup0;   
wire             lsu_idu_dc_pipe3_vload_inst_vld_dup1;   
wire             lsu_idu_dc_pipe3_vload_inst_vld_dup2;   
wire             lsu_idu_dc_pipe3_vload_inst_vld_dup3;   
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dup0;             
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dup1;             
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dup2;             
wire    [6  :0]  lsu_idu_dc_pipe3_vreg_dup3;             
wire    [11 :0]  lsu_idu_dc_sdiq_entry;                  
wire             lsu_idu_dc_staddr1_vld;                 
wire             lsu_idu_dc_staddr_unalign;              
wire             lsu_idu_dc_staddr_vld;                  
wire    [11 :0]  lsu_idu_ex1_sdiq_entry;                 
wire             lsu_idu_ex1_sdiq_frz_clr;               
wire             lsu_idu_ex1_sdiq_pop_vld;               
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
wire             lsu_idu_vmb_1_left_updt;                
wire    [7  :0]  lsu_idu_vmb_create0_entry;              
wire    [7  :0]  lsu_idu_vmb_create1_entry;              
wire             lsu_idu_vmb_empty;                      
wire             lsu_idu_vmb_full;                       
wire             lsu_idu_vmb_full_updt;                  
wire             lsu_idu_vmb_full_updt_clk_en;           
wire    [11 :0]  lsu_idu_wait_fence;                     
wire             lsu_idu_wait_fence_gateclk_en;          
wire    [11 :0]  lsu_idu_wait_old;                       
wire             lsu_idu_wait_old_gateclk_en;            
wire    [11 :0]  lsu_idu_wakeup;                         
wire    [6  :0]  lsu_idu_wb_pipe3_fwd_vreg;              
wire             lsu_idu_wb_pipe3_fwd_vreg_vld;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg;               
wire    [63 :0]  lsu_idu_wb_pipe3_wb_preg_data;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup0;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup1;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup2;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup3;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup4;          
wire    [95 :0]  lsu_idu_wb_pipe3_wb_preg_expand;        
wire             lsu_idu_wb_pipe3_wb_preg_vld;           
wire             lsu_idu_wb_pipe3_wb_preg_vld_dup0;      
wire             lsu_idu_wb_pipe3_wb_preg_vld_dup1;      
wire             lsu_idu_wb_pipe3_wb_preg_vld_dup2;      
wire             lsu_idu_wb_pipe3_wb_preg_vld_dup3;      
wire             lsu_idu_wb_pipe3_wb_preg_vld_dup4;      
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup0;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup1;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup2;          
wire    [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup3;          
wire    [63 :0]  lsu_idu_wb_pipe3_wb_vreg_fr_data;       
wire    [63 :0]  lsu_idu_wb_pipe3_wb_vreg_fr_expand;     
wire             lsu_idu_wb_pipe3_wb_vreg_fr_vld;        
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dup0;      
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dup1;      
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dup2;      
wire             lsu_idu_wb_pipe3_wb_vreg_vld_dup3;      
wire    [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr0_data;      
wire    [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr0_expand;    
wire             lsu_idu_wb_pipe3_wb_vreg_vr0_vld;       
wire    [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr1_data;      
wire    [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr1_expand;    
wire             lsu_idu_wb_pipe3_wb_vreg_vr1_vld;       
wire             lsu_ifu_icache_all_inv;                 
wire    [5  :0]  lsu_ifu_icache_index;                   
wire             lsu_ifu_icache_line_inv;                
wire    [27 :0]  lsu_ifu_icache_ptag;                    
wire             lsu_mmu_abort0;                         
wire             lsu_mmu_abort1;                         
wire             lsu_mmu_bus_error;                      
wire    [63 :0]  lsu_mmu_data;                           
wire             lsu_mmu_data_vld;                       
wire    [6  :0]  lsu_mmu_id0;                            
wire    [6  :0]  lsu_mmu_id1;                            
wire             lsu_mmu_st_inst0;                       
wire             lsu_mmu_st_inst1;                       
wire    [27 :0]  lsu_mmu_stamo_pa;                       
wire             lsu_mmu_stamo_vld;                      
wire             lsu_mmu_tlb_all_inv;                    
wire    [15 :0]  lsu_mmu_tlb_asid;                       
wire             lsu_mmu_tlb_asid_all_inv;               
wire    [26 :0]  lsu_mmu_tlb_va;                         
wire             lsu_mmu_tlb_va_all_inv;                 
wire             lsu_mmu_tlb_va_asid_inv;                
wire    [63 :0]  lsu_mmu_va0;                            
wire             lsu_mmu_va0_vld;                        
wire    [63 :0]  lsu_mmu_va1;                            
wire             lsu_mmu_va1_vld;                        
wire    [27 :0]  lsu_mmu_va2;                            
wire             lsu_mmu_va2_vld;                        
wire    [27 :0]  lsu_mmu_vabuf0;                         
wire    [27 :0]  lsu_mmu_vabuf1;                         
wire             lsu_rst_b;                              
wire             lsu_rtu_all_commit_data_vld;            
wire    [39 :0]  lsu_rtu_async_expt_addr;                
wire             lsu_rtu_async_expt_vld;                 
wire             lsu_rtu_ctc_flush_vld;                  
wire    [6  :0]  lsu_rtu_da_pipe3_split_spec_fail_iid;   
wire             lsu_rtu_da_pipe3_split_spec_fail_vld;   
wire    [6  :0]  lsu_rtu_da_pipe4_split_spec_fail_iid;   
wire             lsu_rtu_da_pipe4_split_spec_fail_vld;   
wire             lsu_rtu_wb_pipe3_abnormal;              
wire             lsu_rtu_wb_pipe3_bkpta_data;            
wire             lsu_rtu_wb_pipe3_bkptb_data;            
wire             lsu_rtu_wb_pipe3_cmplt;                 
wire    [4  :0]  lsu_rtu_wb_pipe3_expt_vec;              
wire             lsu_rtu_wb_pipe3_expt_vld;              
wire             lsu_rtu_wb_pipe3_flush;                 
wire    [6  :0]  lsu_rtu_wb_pipe3_iid;                   
wire    [39 :0]  lsu_rtu_wb_pipe3_mtval;                 
wire             lsu_rtu_wb_pipe3_no_spec_hit;           
wire             lsu_rtu_wb_pipe3_no_spec_mispred;       
wire             lsu_rtu_wb_pipe3_no_spec_miss;          
wire             lsu_rtu_wb_pipe3_spec_fail;             
wire             lsu_rtu_wb_pipe3_vsetvl;                
wire    [6  :0]  lsu_rtu_wb_pipe3_vstart;                
wire             lsu_rtu_wb_pipe3_vstart_vld;            
wire    [95 :0]  lsu_rtu_wb_pipe3_wb_preg_expand;        
wire             lsu_rtu_wb_pipe3_wb_preg_vld;           
wire    [63 :0]  lsu_rtu_wb_pipe3_wb_vreg_expand;        
wire             lsu_rtu_wb_pipe3_wb_vreg_fr_vld;        
wire             lsu_rtu_wb_pipe3_wb_vreg_vr_vld;        
wire             lsu_rtu_wb_pipe4_abnormal;              
wire             lsu_rtu_wb_pipe4_bkpta_data;            
wire             lsu_rtu_wb_pipe4_bkptb_data;            
wire             lsu_rtu_wb_pipe4_cmplt;                 
wire    [4  :0]  lsu_rtu_wb_pipe4_expt_vec;              
wire             lsu_rtu_wb_pipe4_expt_vld;              
wire             lsu_rtu_wb_pipe4_flush;                 
wire    [6  :0]  lsu_rtu_wb_pipe4_iid;                   
wire    [39 :0]  lsu_rtu_wb_pipe4_mtval;                 
wire             lsu_rtu_wb_pipe4_no_spec_hit;           
wire             lsu_rtu_wb_pipe4_no_spec_mispred;       
wire             lsu_rtu_wb_pipe4_no_spec_miss;          
wire             lsu_rtu_wb_pipe4_spec_fail;             
wire    [6  :0]  lsu_rtu_wb_pipe4_vstart;                
wire             lsu_rtu_wb_pipe4_vstart_vld;            
wire             lsu_yy_xx_no_op;                        
wire             mmu_cp0_cmplt;                          
wire    [63 :0]  mmu_cp0_data;                           
wire    [63 :0]  mmu_cp0_satp_data;                      
wire             mmu_cp0_tlb_done;                       
wire             mmu_ifu_buf;                            
wire             mmu_ifu_ca;                             
wire             mmu_ifu_deny;                           
wire    [27 :0]  mmu_ifu_pa;                             
wire             mmu_ifu_pavld;                          
wire             mmu_ifu_pgflt;                          
wire             mmu_ifu_sec;                            
wire             mmu_lsu_access_fault0;                  
wire             mmu_lsu_access_fault1;                  
wire             mmu_lsu_buf0;                           
wire             mmu_lsu_buf1;                           
wire             mmu_lsu_ca0;                            
wire             mmu_lsu_ca1;                            
wire             mmu_lsu_data_req;                       
wire    [39 :0]  mmu_lsu_data_req_addr;                  
wire             mmu_lsu_data_req_size;                  
wire             mmu_lsu_mmu_en;                         
wire    [27 :0]  mmu_lsu_pa0;                            
wire             mmu_lsu_pa0_vld;                        
wire    [27 :0]  mmu_lsu_pa1;                            
wire             mmu_lsu_pa1_vld;                        
wire    [27 :0]  mmu_lsu_pa2;                            
wire             mmu_lsu_pa2_err;                        
wire             mmu_lsu_pa2_vld;                        
wire             mmu_lsu_page_fault0;                    
wire             mmu_lsu_page_fault1;                    
wire             mmu_lsu_sec0;                           
wire             mmu_lsu_sec1;                           
wire             mmu_lsu_sec2;                           
wire             mmu_lsu_sh0;                            
wire             mmu_lsu_sh1;                            
wire             mmu_lsu_share2;                         
wire             mmu_lsu_so0;                            
wire             mmu_lsu_so1;                            
wire             mmu_lsu_stall0;                         
wire             mmu_lsu_stall1;                         
wire             mmu_lsu_tlb_busy;                       
wire             mmu_lsu_tlb_inv_done;                   
wire    [11 :0]  mmu_lsu_tlb_wakeup;                     
wire             mmu_xx_mmu_en;                          
wire             mmu_yy_xx_no_op;                        
wire             pad_yy_icg_scan_en;                     
wire    [63 :0]  pmp_cp0_data;                           
wire    [63 :0]  rtu_cp0_epc;                            
wire             rtu_cp0_expt_gateclk_vld;               
wire    [63 :0]  rtu_cp0_expt_mtval;                     
wire             rtu_cp0_expt_vld;                       
wire             rtu_cp0_fp_dirty_vld;                   
wire             rtu_cp0_int_ack;                        
wire             rtu_cp0_vec_dirty_vld;                  
wire             rtu_cp0_vsetvl_vill;                    
wire    [7  :0]  rtu_cp0_vsetvl_vl;                      
wire             rtu_cp0_vsetvl_vl_vld;                  
wire    [1  :0]  rtu_cp0_vsetvl_vlmul;                   
wire    [2  :0]  rtu_cp0_vsetvl_vsew;                    
wire             rtu_cp0_vsetvl_vtype_vld;               
wire    [6  :0]  rtu_cp0_vstart;                         
wire             rtu_cp0_vstart_vld;                     
wire             rtu_cpu_no_retire;                      
wire             rtu_had_bkpt_data_st;                   
wire             rtu_had_data_bkpta_vld;                 
wire             rtu_had_data_bkptb_vld;                 
wire             rtu_had_dbg_ack_info;                   
wire             rtu_had_dbgreq_ack;                     
wire    [42 :0]  rtu_had_debug_info;                     
wire             rtu_had_inst0_bkpt_inst;                
wire    [3  :0]  rtu_had_inst0_non_irv_bkpt;             
wire    [3  :0]  rtu_had_inst1_non_irv_bkpt;             
wire    [3  :0]  rtu_had_inst2_non_irv_bkpt;             
wire             rtu_had_inst_bkpt_inst_vld;             
wire             rtu_had_inst_bkpta_vld;                 
wire             rtu_had_inst_bkptb_vld;                 
wire             rtu_had_inst_exe_dead;                  
wire             rtu_had_inst_not_wb;                    
wire             rtu_had_inst_split;                     
wire    [63 :0]  rtu_had_retire_inst0_info;              
wire             rtu_had_retire_inst0_vld;               
wire    [63 :0]  rtu_had_retire_inst1_info;              
wire             rtu_had_retire_inst1_vld;               
wire    [63 :0]  rtu_had_retire_inst2_info;              
wire             rtu_had_retire_inst2_vld;               
wire             rtu_had_rob_empty;                      
wire             rtu_had_xx_dbg_ack_pc;                  
wire             rtu_had_xx_mbkpt_chgflow;               
wire             rtu_had_xx_mbkpt_data_ack;              
wire             rtu_had_xx_mbkpt_inst_ack;              
wire    [38 :0]  rtu_had_xx_pc;                          
wire             rtu_had_xx_pcfifo_inst0_chgflow;        
wire             rtu_had_xx_pcfifo_inst0_condbr;         
wire             rtu_had_xx_pcfifo_inst0_condbr_taken;   
wire    [6  :0]  rtu_had_xx_pcfifo_inst0_iid;            
wire             rtu_had_xx_pcfifo_inst0_jmp;            
wire    [38 :0]  rtu_had_xx_pcfifo_inst0_next_pc;        
wire             rtu_had_xx_pcfifo_inst0_pcall;          
wire             rtu_had_xx_pcfifo_inst0_preturn;        
wire             rtu_had_xx_pcfifo_inst1_chgflow;        
wire             rtu_had_xx_pcfifo_inst1_condbr;         
wire             rtu_had_xx_pcfifo_inst1_condbr_taken;   
wire             rtu_had_xx_pcfifo_inst1_jmp;            
wire    [38 :0]  rtu_had_xx_pcfifo_inst1_next_pc;        
wire             rtu_had_xx_pcfifo_inst1_pcall;          
wire             rtu_had_xx_pcfifo_inst1_preturn;        
wire             rtu_had_xx_pcfifo_inst2_chgflow;        
wire             rtu_had_xx_pcfifo_inst2_condbr;         
wire             rtu_had_xx_pcfifo_inst2_condbr_taken;   
wire             rtu_had_xx_pcfifo_inst2_jmp;            
wire    [38 :0]  rtu_had_xx_pcfifo_inst2_next_pc;        
wire             rtu_had_xx_pcfifo_inst2_pcall;          
wire             rtu_had_xx_pcfifo_inst2_preturn;        
wire             rtu_had_xx_split_inst;                  
wire             rtu_hpcp_inst0_ack_int;                 
wire             rtu_hpcp_inst0_bht_mispred;             
wire             rtu_hpcp_inst0_condbr;                  
wire    [39 :0]  rtu_hpcp_inst0_cur_pc;                  
wire             rtu_hpcp_inst0_jmp;                     
wire             rtu_hpcp_inst0_jmp_mispred;             
wire             rtu_hpcp_inst0_jmp_pc_offset_8m;        
wire    [1  :0]  rtu_hpcp_inst0_num;                     
wire    [2  :0]  rtu_hpcp_inst0_pc_offset;               
wire             rtu_hpcp_inst0_spec_fail;               
wire             rtu_hpcp_inst0_split;                   
wire             rtu_hpcp_inst0_store;                   
wire             rtu_hpcp_inst0_vld;                     
wire             rtu_hpcp_inst1_condbr;                  
wire    [39 :0]  rtu_hpcp_inst1_cur_pc;                  
wire             rtu_hpcp_inst1_jmp;                     
wire             rtu_hpcp_inst1_jmp_pc_offset_8m;        
wire    [1  :0]  rtu_hpcp_inst1_num;                     
wire    [2  :0]  rtu_hpcp_inst1_pc_offset;               
wire             rtu_hpcp_inst1_split;                   
wire             rtu_hpcp_inst1_store;                   
wire             rtu_hpcp_inst1_vld;                     
wire             rtu_hpcp_inst2_condbr;                  
wire    [39 :0]  rtu_hpcp_inst2_cur_pc;                  
wire             rtu_hpcp_inst2_jmp;                     
wire             rtu_hpcp_inst2_jmp_pc_offset_8m;        
wire    [1  :0]  rtu_hpcp_inst2_num;                     
wire    [2  :0]  rtu_hpcp_inst2_pc_offset;               
wire             rtu_hpcp_inst2_split;                   
wire             rtu_hpcp_inst2_store;                   
wire             rtu_hpcp_inst2_vld;                     
wire             rtu_hpcp_trace_inst0_chgflow;           
wire    [38 :0]  rtu_hpcp_trace_inst0_next_pc;           
wire             rtu_hpcp_trace_inst1_chgflow;           
wire    [38 :0]  rtu_hpcp_trace_inst1_next_pc;           
wire             rtu_hpcp_trace_inst2_chgflow;           
wire    [38 :0]  rtu_hpcp_trace_inst2_next_pc;           
wire    [4  :0]  rtu_idu_alloc_ereg0;                    
wire             rtu_idu_alloc_ereg0_vld;                
wire    [4  :0]  rtu_idu_alloc_ereg1;                    
wire             rtu_idu_alloc_ereg1_vld;                
wire    [4  :0]  rtu_idu_alloc_ereg2;                    
wire             rtu_idu_alloc_ereg2_vld;                
wire    [4  :0]  rtu_idu_alloc_ereg3;                    
wire             rtu_idu_alloc_ereg3_vld;                
wire    [5  :0]  rtu_idu_alloc_freg0;                    
wire             rtu_idu_alloc_freg0_vld;                
wire    [5  :0]  rtu_idu_alloc_freg1;                    
wire             rtu_idu_alloc_freg1_vld;                
wire    [5  :0]  rtu_idu_alloc_freg2;                    
wire             rtu_idu_alloc_freg2_vld;                
wire    [5  :0]  rtu_idu_alloc_freg3;                    
wire             rtu_idu_alloc_freg3_vld;                
wire    [6  :0]  rtu_idu_alloc_preg0;                    
wire             rtu_idu_alloc_preg0_vld;                
wire    [6  :0]  rtu_idu_alloc_preg1;                    
wire             rtu_idu_alloc_preg1_vld;                
wire    [6  :0]  rtu_idu_alloc_preg2;                    
wire             rtu_idu_alloc_preg2_vld;                
wire    [6  :0]  rtu_idu_alloc_preg3;                    
wire             rtu_idu_alloc_preg3_vld;                
wire    [5  :0]  rtu_idu_alloc_vreg0;                    
wire             rtu_idu_alloc_vreg0_vld;                
wire    [5  :0]  rtu_idu_alloc_vreg1;                    
wire             rtu_idu_alloc_vreg1_vld;                
wire    [5  :0]  rtu_idu_alloc_vreg2;                    
wire             rtu_idu_alloc_vreg2_vld;                
wire    [5  :0]  rtu_idu_alloc_vreg3;                    
wire             rtu_idu_alloc_vreg3_vld;                
wire             rtu_idu_flush_fe;                       
wire             rtu_idu_flush_is;                       
wire             rtu_idu_flush_stall;                    
wire             rtu_idu_pst_empty;                      
wire    [31 :0]  rtu_idu_pst_ereg_retired_released_wb;   
wire             rtu_idu_retire0_inst_vld;               
wire             rtu_idu_retire_int_vld;                 
wire             rtu_idu_rob_empty;                      
wire             rtu_idu_rob_full;                       
wire    [6  :0]  rtu_idu_rob_inst0_iid;                  
wire    [6  :0]  rtu_idu_rob_inst1_iid;                  
wire    [6  :0]  rtu_idu_rob_inst2_iid;                  
wire    [6  :0]  rtu_idu_rob_inst3_iid;                  
wire    [4  :0]  rtu_idu_rt_recover_ereg;                
wire    [191:0]  rtu_idu_rt_recover_freg;                
wire    [223:0]  rtu_idu_rt_recover_preg;                
wire    [191:0]  rtu_idu_rt_recover_vreg;                
wire             rtu_idu_srt_en;                         
wire    [38 :0]  rtu_ifu_chgflw_pc;                      
wire             rtu_ifu_chgflw_vld;                     
wire             rtu_ifu_flush;                          
wire    [7  :0]  rtu_ifu_retire0_chk_idx;                
wire             rtu_ifu_retire0_condbr;                 
wire             rtu_ifu_retire0_condbr_taken;           
wire    [38 :0]  rtu_ifu_retire0_inc_pc;                 
wire             rtu_ifu_retire0_jmp;                    
wire             rtu_ifu_retire0_jmp_mispred;            
wire             rtu_ifu_retire0_mispred;                
wire    [38 :0]  rtu_ifu_retire0_next_pc;                
wire             rtu_ifu_retire0_pcall;                  
wire             rtu_ifu_retire0_preturn;                
wire    [7  :0]  rtu_ifu_retire1_chk_idx;                
wire             rtu_ifu_retire1_condbr;                 
wire             rtu_ifu_retire1_condbr_taken;           
wire             rtu_ifu_retire1_jmp;                    
wire    [7  :0]  rtu_ifu_retire2_chk_idx;                
wire             rtu_ifu_retire2_condbr;                 
wire             rtu_ifu_retire2_condbr_taken;           
wire             rtu_ifu_retire2_jmp;                    
wire    [38 :0]  rtu_ifu_retire_inst0_cur_pc;            
wire             rtu_ifu_retire_inst0_load;              
wire             rtu_ifu_retire_inst0_no_spec_hit;       
wire             rtu_ifu_retire_inst0_no_spec_mispred;   
wire             rtu_ifu_retire_inst0_no_spec_miss;      
wire             rtu_ifu_retire_inst0_store;             
wire             rtu_ifu_retire_inst0_vl_hit;            
wire             rtu_ifu_retire_inst0_vl_mispred;        
wire             rtu_ifu_retire_inst0_vl_miss;           
wire             rtu_ifu_retire_inst0_vl_pred;           
wire    [38 :0]  rtu_ifu_retire_inst1_cur_pc;            
wire             rtu_ifu_retire_inst1_load;              
wire             rtu_ifu_retire_inst1_no_spec_hit;       
wire             rtu_ifu_retire_inst1_no_spec_mispred;   
wire             rtu_ifu_retire_inst1_no_spec_miss;      
wire             rtu_ifu_retire_inst1_store;             
wire             rtu_ifu_retire_inst1_vl_pred;           
wire    [38 :0]  rtu_ifu_retire_inst2_cur_pc;            
wire             rtu_ifu_retire_inst2_load;              
wire             rtu_ifu_retire_inst2_no_spec_hit;       
wire             rtu_ifu_retire_inst2_no_spec_mispred;   
wire             rtu_ifu_retire_inst2_no_spec_miss;      
wire             rtu_ifu_retire_inst2_store;             
wire             rtu_ifu_retire_inst2_vl_pred;           
wire             rtu_ifu_xx_dbgon;                       
wire    [5  :0]  rtu_ifu_xx_expt_vec;                    
wire             rtu_ifu_xx_expt_vld;                    
wire             rtu_iu_flush_chgflw_mask;               
wire             rtu_iu_flush_fe;                        
wire             rtu_iu_rob_read0_pcfifo_vld;            
wire             rtu_iu_rob_read1_pcfifo_vld;            
wire             rtu_iu_rob_read2_pcfifo_vld;            
wire             rtu_iu_rob_read_pcfifo_gateclk_vld;     
wire             rtu_lsu_async_flush;                    
wire    [6  :0]  rtu_lsu_commit0_iid_updt_val;           
wire    [6  :0]  rtu_lsu_commit1_iid_updt_val;           
wire    [6  :0]  rtu_lsu_commit2_iid_updt_val;           
wire             rtu_lsu_eret_flush;                     
wire             rtu_lsu_expt_flush;                     
wire             rtu_lsu_spec_fail_flush;                
wire    [6  :0]  rtu_lsu_spec_fail_iid;                  
wire    [26 :0]  rtu_mmu_bad_vpn;                        
wire             rtu_mmu_expt_vld;                       
wire             rtu_pad_retire0;                        
wire    [39 :0]  rtu_pad_retire0_pc;                     
wire             rtu_pad_retire1;                        
wire    [39 :0]  rtu_pad_retire1_pc;                     
wire             rtu_pad_retire2;                        
wire    [39 :0]  rtu_pad_retire2_pc;                     
wire             rtu_yy_xx_commit0;                      
wire    [6  :0]  rtu_yy_xx_commit0_iid;                  
wire             rtu_yy_xx_commit1;                      
wire    [6  :0]  rtu_yy_xx_commit1_iid;                  
wire             rtu_yy_xx_commit2;                      
wire    [6  :0]  rtu_yy_xx_commit2_iid;                  
wire             rtu_yy_xx_dbgon;                        
wire    [5  :0]  rtu_yy_xx_expt_vec;                     
wire             rtu_yy_xx_flush;                        
wire             rtu_yy_xx_retire0;                      
wire             rtu_yy_xx_retire0_normal;               
wire             rtu_yy_xx_retire1;                      
wire             rtu_yy_xx_retire2;                      
wire             vfdsu_ifu_debug_ex2_wait;               
wire             vfdsu_ifu_debug_idle;                   
wire             vfdsu_ifu_debug_pipe_busy;              
wire             vfpu_idu_ex1_pipe6_data_vld_dup0;       
wire             vfpu_idu_ex1_pipe6_data_vld_dup1;       
wire             vfpu_idu_ex1_pipe6_data_vld_dup2;       
wire             vfpu_idu_ex1_pipe6_data_vld_dup3;       
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dup0;  
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dup1;  
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dup2;  
wire             vfpu_idu_ex1_pipe6_fmla_data_vld_dup3;  
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0;  
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1;  
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2;  
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3;  
wire             vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4;  
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dup0;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dup1;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dup2;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dup3;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_preg_dup4;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup0;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup1;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup2;           
wire    [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup3;           
wire             vfpu_idu_ex1_pipe7_data_vld_dup0;       
wire             vfpu_idu_ex1_pipe7_data_vld_dup1;       
wire             vfpu_idu_ex1_pipe7_data_vld_dup2;       
wire             vfpu_idu_ex1_pipe7_data_vld_dup3;       
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dup0;  
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dup1;  
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dup2;  
wire             vfpu_idu_ex1_pipe7_fmla_data_vld_dup3;  
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0;  
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1;  
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2;  
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3;  
wire             vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4;  
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dup0;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dup1;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dup2;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dup3;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_preg_dup4;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup0;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup1;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup2;           
wire    [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup3;           
wire             vfpu_idu_ex2_pipe6_data_vld_dup0;       
wire             vfpu_idu_ex2_pipe6_data_vld_dup1;       
wire             vfpu_idu_ex2_pipe6_data_vld_dup2;       
wire             vfpu_idu_ex2_pipe6_data_vld_dup3;       
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dup0;  
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dup1;  
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dup2;  
wire             vfpu_idu_ex2_pipe6_fmla_data_vld_dup3;  
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup0;           
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup1;           
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup2;           
wire    [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup3;           
wire             vfpu_idu_ex2_pipe7_data_vld_dup0;       
wire             vfpu_idu_ex2_pipe7_data_vld_dup1;       
wire             vfpu_idu_ex2_pipe7_data_vld_dup2;       
wire             vfpu_idu_ex2_pipe7_data_vld_dup3;       
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dup0;  
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dup1;  
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dup2;  
wire             vfpu_idu_ex2_pipe7_fmla_data_vld_dup3;  
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup0;           
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup1;           
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup2;           
wire    [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup3;           
wire             vfpu_idu_ex3_pipe6_data_vld_dup0;       
wire             vfpu_idu_ex3_pipe6_data_vld_dup1;       
wire             vfpu_idu_ex3_pipe6_data_vld_dup2;       
wire             vfpu_idu_ex3_pipe6_data_vld_dup3;       
wire    [6  :0]  vfpu_idu_ex3_pipe6_fwd_vreg;            
wire    [63 :0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;    
wire             vfpu_idu_ex3_pipe6_fwd_vreg_vld;        
wire    [63 :0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data;   
wire    [63 :0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data;   
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup0;           
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup1;           
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup2;           
wire    [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup3;           
wire             vfpu_idu_ex3_pipe7_data_vld_dup0;       
wire             vfpu_idu_ex3_pipe7_data_vld_dup1;       
wire             vfpu_idu_ex3_pipe7_data_vld_dup2;       
wire             vfpu_idu_ex3_pipe7_data_vld_dup3;       
wire    [6  :0]  vfpu_idu_ex3_pipe7_fwd_vreg;            
wire    [63 :0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;    
wire             vfpu_idu_ex3_pipe7_fwd_vreg_vld;        
wire    [63 :0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data;   
wire    [63 :0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data;   
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup0;           
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup1;           
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup2;           
wire    [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup3;           
wire    [6  :0]  vfpu_idu_ex4_pipe6_fwd_vreg;            
wire    [63 :0]  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data;    
wire             vfpu_idu_ex4_pipe6_fwd_vreg_vld;        
wire    [63 :0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data;   
wire    [63 :0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data;   
wire    [6  :0]  vfpu_idu_ex4_pipe7_fwd_vreg;            
wire    [63 :0]  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data;    
wire             vfpu_idu_ex4_pipe7_fwd_vreg_vld;        
wire    [63 :0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data;   
wire    [63 :0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data;   
wire    [6  :0]  vfpu_idu_ex5_pipe6_fwd_vreg;            
wire             vfpu_idu_ex5_pipe6_fwd_vreg_vld;        
wire    [4  :0]  vfpu_idu_ex5_pipe6_wb_ereg;             
wire    [5  :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;        
wire             vfpu_idu_ex5_pipe6_wb_ereg_vld;         
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup0;        
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup1;        
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup2;        
wire    [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup3;        
wire    [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;     
wire    [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand;   
wire             vfpu_idu_ex5_pipe6_wb_vreg_fr_vld;      
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0;    
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1;    
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2;    
wire             vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3;    
wire    [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;    
wire    [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand;  
wire             vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld;     
wire    [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;    
wire    [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand;  
wire             vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld;     
wire    [6  :0]  vfpu_idu_ex5_pipe7_fwd_vreg;            
wire             vfpu_idu_ex5_pipe7_fwd_vreg_vld;        
wire    [4  :0]  vfpu_idu_ex5_pipe7_wb_ereg;             
wire    [5  :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;        
wire             vfpu_idu_ex5_pipe7_wb_ereg_vld;         
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup0;        
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup1;        
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup2;        
wire    [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup3;        
wire    [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;     
wire    [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand;   
wire             vfpu_idu_ex5_pipe7_wb_vreg_fr_vld;      
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0;    
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1;    
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2;    
wire             vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3;    
wire    [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;    
wire    [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand;  
wire             vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld;     
wire    [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;    
wire    [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand;  
wire             vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld;     
wire             vfpu_idu_pipe6_vmla_srcv2_no_fwd;       
wire             vfpu_idu_pipe7_vmla_srcv2_no_fwd;       
wire             vfpu_idu_vdiv_busy;                     
wire             vfpu_idu_vdiv_wb_stall;                 
wire    [63 :0]  vfpu_iu_ex2_pipe6_mfvr_data;            
wire             vfpu_iu_ex2_pipe6_mfvr_data_vld;        
wire    [6  :0]  vfpu_iu_ex2_pipe6_mfvr_preg;            
wire    [63 :0]  vfpu_iu_ex2_pipe7_mfvr_data;            
wire             vfpu_iu_ex2_pipe7_mfvr_data_vld;        
wire    [6  :0]  vfpu_iu_ex2_pipe7_mfvr_preg;            
wire             vfpu_rtu_ex5_pipe6_ereg_wb_vld;         
wire    [4  :0]  vfpu_rtu_ex5_pipe6_wb_ereg;             
wire    [63 :0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;      
wire             vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld;      
wire             vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld;      
wire             vfpu_rtu_ex5_pipe7_ereg_wb_vld;         
wire    [4  :0]  vfpu_rtu_ex5_pipe7_wb_ereg;             
wire    [63 :0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;      
wire             vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld;      
wire             vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld;      
wire             vfpu_rtu_pipe6_cmplt;                   
wire    [6  :0]  vfpu_rtu_pipe6_iid;                     
wire             vfpu_rtu_pipe7_cmplt;                   
wire    [6  :0]  vfpu_rtu_pipe7_iid;                     


// &Force("input", "pad_yy_scan_mode"); @32
// &Force("output","rtu_yy_xx_dbgon"); @33
// &Force("output","rtu_yy_xx_retire0_normal"); @34
// &Force("output","cp0_yy_priv_mode"); @35
// //&Force("output","cp0_yy_clk_en"); @36
// &Force("output","rtu_yy_xx_retire0"); @37
// &Force("output","rtu_yy_xx_retire1"); @38
// &Force("output","rtu_yy_xx_retire2"); @39
// &Force("output","rtu_yy_xx_flush"); @40

//==========================================================
//  Instance ct_ifu_top sub module 
//==========================================================
// &Instance("ct_ifu_top"); @45
ct_ifu_top  x_ct_ifu_top (
  .biu_ifu_rd_data                      (biu_ifu_rd_data                     ),
  .biu_ifu_rd_data_vld                  (biu_ifu_rd_data_vld                 ),
  .biu_ifu_rd_grnt                      (biu_ifu_rd_grnt                     ),
  .biu_ifu_rd_id                        (biu_ifu_rd_id                       ),
  .biu_ifu_rd_last                      (biu_ifu_rd_last                     ),
  .biu_ifu_rd_resp                      (biu_ifu_rd_resp                     ),
  .cp0_idu_cskyee                       (cp0_idu_cskyee                      ),
  .cp0_idu_frm                          (cp0_idu_frm                         ),
  .cp0_idu_fs                           (cp0_idu_fs                          ),
  .cp0_ifu_bht_en                       (cp0_ifu_bht_en                      ),
  .cp0_ifu_bht_inv                      (cp0_ifu_bht_inv                     ),
  .cp0_ifu_btb_en                       (cp0_ifu_btb_en                      ),
  .cp0_ifu_btb_inv                      (cp0_ifu_btb_inv                     ),
  .cp0_ifu_icache_en                    (cp0_ifu_icache_en                   ),
  .cp0_ifu_icache_inv                   (cp0_ifu_icache_inv                  ),
  .cp0_ifu_icache_pref_en               (cp0_ifu_icache_pref_en              ),
  .cp0_ifu_icache_read_index            (cp0_ifu_icache_read_index           ),
  .cp0_ifu_icache_read_req              (cp0_ifu_icache_read_req             ),
  .cp0_ifu_icache_read_tag              (cp0_ifu_icache_read_tag             ),
  .cp0_ifu_icache_read_way              (cp0_ifu_icache_read_way             ),
  .cp0_ifu_icg_en                       (cp0_ifu_icg_en                      ),
  .cp0_ifu_ind_btb_en                   (cp0_ifu_ind_btb_en                  ),
  .cp0_ifu_ind_btb_inv                  (cp0_ifu_ind_btb_inv                 ),
  .cp0_ifu_insde                        (cp0_ifu_insde                       ),
  .cp0_ifu_iwpe                         (cp0_ifu_iwpe                        ),
  .cp0_ifu_l0btb_en                     (cp0_ifu_l0btb_en                    ),
  .cp0_ifu_lbuf_en                      (cp0_ifu_lbuf_en                     ),
  .cp0_ifu_no_op_req                    (cp0_ifu_no_op_req                   ),
  .cp0_ifu_nsfe                         (cp0_ifu_nsfe                        ),
  .cp0_ifu_ras_en                       (cp0_ifu_ras_en                      ),
  .cp0_ifu_rst_inv_done                 (cp0_ifu_rst_inv_done                ),
  .cp0_ifu_rvbr                         (cp0_ifu_rvbr                        ),
  .cp0_ifu_vbr                          (cp0_ifu_vbr                         ),
  .cp0_ifu_vl                           (cp0_ifu_vl                          ),
  .cp0_ifu_vlmul                        (cp0_ifu_vlmul                       ),
  .cp0_ifu_vsetvli_pred_disable         (cp0_ifu_vsetvli_pred_disable        ),
  .cp0_ifu_vsetvli_pred_mode            (cp0_ifu_vsetvli_pred_mode           ),
  .cp0_ifu_vsew                         (cp0_ifu_vsew                        ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cp0_yy_priv_mode                     (cp0_yy_priv_mode                    ),
  .cpurst_b                             (ifu_rst_b                           ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_ifu_ir                           (had_ifu_ir                          ),
  .had_ifu_ir_vld                       (had_ifu_ir_vld                      ),
  .had_ifu_pc                           (had_ifu_pc                          ),
  .had_ifu_pcload                       (had_ifu_pcload                      ),
  .had_rtu_xx_jdbreq                    (had_rtu_xx_jdbreq                   ),
  .had_yy_xx_bkpta_base                 (had_yy_xx_bkpta_base                ),
  .had_yy_xx_bkpta_mask                 (had_yy_xx_bkpta_mask                ),
  .had_yy_xx_bkpta_rc                   (had_yy_xx_bkpta_rc                  ),
  .had_yy_xx_bkptb_base                 (had_yy_xx_bkptb_base                ),
  .had_yy_xx_bkptb_mask                 (had_yy_xx_bkptb_mask                ),
  .had_yy_xx_bkptb_rc                   (had_yy_xx_bkptb_rc                  ),
  .hpcp_ifu_cnt_en                      (hpcp_ifu_cnt_en                     ),
  .idu_ifu_id_bypass_stall              (idu_ifu_id_bypass_stall             ),
  .idu_ifu_id_stall                     (idu_ifu_id_stall                    ),
  .ifu_biu_r_ready                      (ifu_biu_r_ready                     ),
  .ifu_biu_rd_addr                      (ifu_biu_rd_addr                     ),
  .ifu_biu_rd_burst                     (ifu_biu_rd_burst                    ),
  .ifu_biu_rd_cache                     (ifu_biu_rd_cache                    ),
  .ifu_biu_rd_domain                    (ifu_biu_rd_domain                   ),
  .ifu_biu_rd_id                        (ifu_biu_rd_id                       ),
  .ifu_biu_rd_len                       (ifu_biu_rd_len                      ),
  .ifu_biu_rd_prot                      (ifu_biu_rd_prot                     ),
  .ifu_biu_rd_req                       (ifu_biu_rd_req                      ),
  .ifu_biu_rd_req_gate                  (ifu_biu_rd_req_gate                 ),
  .ifu_biu_rd_size                      (ifu_biu_rd_size                     ),
  .ifu_biu_rd_snoop                     (ifu_biu_rd_snoop                    ),
  .ifu_biu_rd_user                      (ifu_biu_rd_user                     ),
  .ifu_cp0_bht_inv_done                 (ifu_cp0_bht_inv_done                ),
  .ifu_cp0_btb_inv_done                 (ifu_cp0_btb_inv_done                ),
  .ifu_cp0_icache_inv_done              (ifu_cp0_icache_inv_done             ),
  .ifu_cp0_icache_read_data             (ifu_cp0_icache_read_data            ),
  .ifu_cp0_icache_read_data_vld         (ifu_cp0_icache_read_data_vld        ),
  .ifu_cp0_ind_btb_inv_done             (ifu_cp0_ind_btb_inv_done            ),
  .ifu_cp0_rst_inv_req                  (ifu_cp0_rst_inv_req                 ),
  .ifu_had_debug_info                   (ifu_had_debug_info                  ),
  .ifu_had_no_inst                      (ifu_had_no_inst                     ),
  .ifu_had_no_op                        (ifu_had_no_op                       ),
  .ifu_had_reset_on                     (ifu_had_reset_on                    ),
  .ifu_hpcp_btb_inst                    (ifu_hpcp_btb_inst                   ),
  .ifu_hpcp_btb_mispred                 (ifu_hpcp_btb_mispred                ),
  .ifu_hpcp_frontend_stall              (ifu_hpcp_frontend_stall             ),
  .ifu_hpcp_icache_access               (ifu_hpcp_icache_access              ),
  .ifu_hpcp_icache_miss                 (ifu_hpcp_icache_miss                ),
  .ifu_idu_ib_inst0_data                (ifu_idu_ib_inst0_data               ),
  .ifu_idu_ib_inst0_vld                 (ifu_idu_ib_inst0_vld                ),
  .ifu_idu_ib_inst1_data                (ifu_idu_ib_inst1_data               ),
  .ifu_idu_ib_inst1_vld                 (ifu_idu_ib_inst1_vld                ),
  .ifu_idu_ib_inst2_data                (ifu_idu_ib_inst2_data               ),
  .ifu_idu_ib_inst2_vld                 (ifu_idu_ib_inst2_vld                ),
  .ifu_idu_ib_pipedown_gateclk          (ifu_idu_ib_pipedown_gateclk         ),
  .ifu_iu_pcfifo_create0_bht_pred       (ifu_iu_pcfifo_create0_bht_pred      ),
  .ifu_iu_pcfifo_create0_chk_idx        (ifu_iu_pcfifo_create0_chk_idx       ),
  .ifu_iu_pcfifo_create0_cur_pc         (ifu_iu_pcfifo_create0_cur_pc        ),
  .ifu_iu_pcfifo_create0_dst_vld        (ifu_iu_pcfifo_create0_dst_vld       ),
  .ifu_iu_pcfifo_create0_en             (ifu_iu_pcfifo_create0_en            ),
  .ifu_iu_pcfifo_create0_gateclk_en     (ifu_iu_pcfifo_create0_gateclk_en    ),
  .ifu_iu_pcfifo_create0_jal            (ifu_iu_pcfifo_create0_jal           ),
  .ifu_iu_pcfifo_create0_jalr           (ifu_iu_pcfifo_create0_jalr          ),
  .ifu_iu_pcfifo_create0_jmp_mispred    (ifu_iu_pcfifo_create0_jmp_mispred   ),
  .ifu_iu_pcfifo_create0_tar_pc         (ifu_iu_pcfifo_create0_tar_pc        ),
  .ifu_iu_pcfifo_create1_bht_pred       (ifu_iu_pcfifo_create1_bht_pred      ),
  .ifu_iu_pcfifo_create1_chk_idx        (ifu_iu_pcfifo_create1_chk_idx       ),
  .ifu_iu_pcfifo_create1_cur_pc         (ifu_iu_pcfifo_create1_cur_pc        ),
  .ifu_iu_pcfifo_create1_dst_vld        (ifu_iu_pcfifo_create1_dst_vld       ),
  .ifu_iu_pcfifo_create1_en             (ifu_iu_pcfifo_create1_en            ),
  .ifu_iu_pcfifo_create1_gateclk_en     (ifu_iu_pcfifo_create1_gateclk_en    ),
  .ifu_iu_pcfifo_create1_jal            (ifu_iu_pcfifo_create1_jal           ),
  .ifu_iu_pcfifo_create1_jalr           (ifu_iu_pcfifo_create1_jalr          ),
  .ifu_iu_pcfifo_create1_jmp_mispred    (ifu_iu_pcfifo_create1_jmp_mispred   ),
  .ifu_iu_pcfifo_create1_tar_pc         (ifu_iu_pcfifo_create1_tar_pc        ),
  .ifu_lsu_icache_inv_done              (ifu_lsu_icache_inv_done             ),
  .ifu_mmu_abort                        (ifu_mmu_abort                       ),
  .ifu_mmu_va                           (ifu_mmu_va                          ),
  .ifu_mmu_va_vld                       (ifu_mmu_va_vld                      ),
  .ifu_rtu_cur_pc                       (ifu_rtu_cur_pc                      ),
  .ifu_rtu_cur_pc_load                  (ifu_rtu_cur_pc_load                 ),
  .ifu_xx_sync_reset                    (ifu_xx_sync_reset                   ),
  .ifu_yy_xx_no_op                      (ifu_yy_xx_no_op                     ),
  .iu_ifu_bht_check_vld                 (iu_ifu_bht_check_vld                ),
  .iu_ifu_bht_condbr_taken              (iu_ifu_bht_condbr_taken             ),
  .iu_ifu_bht_pred                      (iu_ifu_bht_pred                     ),
  .iu_ifu_chgflw_pc                     (iu_ifu_chgflw_pc                    ),
  .iu_ifu_chgflw_vl                     (iu_ifu_chgflw_vl                    ),
  .iu_ifu_chgflw_vld                    (iu_ifu_chgflw_vld                   ),
  .iu_ifu_chgflw_vlmul                  (iu_ifu_chgflw_vlmul                 ),
  .iu_ifu_chgflw_vsew                   (iu_ifu_chgflw_vsew                  ),
  .iu_ifu_chk_idx                       (iu_ifu_chk_idx                      ),
  .iu_ifu_cur_pc                        (iu_ifu_cur_pc                       ),
  .iu_ifu_mispred_stall                 (iu_ifu_mispred_stall                ),
  .iu_ifu_pcfifo_full                   (iu_ifu_pcfifo_full                  ),
  .lsu_ifu_icache_all_inv               (lsu_ifu_icache_all_inv              ),
  .lsu_ifu_icache_index                 (lsu_ifu_icache_index                ),
  .lsu_ifu_icache_line_inv              (lsu_ifu_icache_line_inv             ),
  .lsu_ifu_icache_ptag                  (lsu_ifu_icache_ptag                 ),
  .mmu_ifu_buf                          (mmu_ifu_buf                         ),
  .mmu_ifu_ca                           (mmu_ifu_ca                          ),
  .mmu_ifu_deny                         (mmu_ifu_deny                        ),
  .mmu_ifu_pa                           (mmu_ifu_pa                          ),
  .mmu_ifu_pavld                        (mmu_ifu_pavld                       ),
  .mmu_ifu_pgflt                        (mmu_ifu_pgflt                       ),
  .mmu_ifu_sec                          (mmu_ifu_sec                         ),
  .mmu_xx_mmu_en                        (mmu_xx_mmu_en                       ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_ifu_chgflw_pc                    (rtu_ifu_chgflw_pc                   ),
  .rtu_ifu_chgflw_vld                   (rtu_ifu_chgflw_vld                  ),
  .rtu_ifu_flush                        (rtu_ifu_flush                       ),
  .rtu_ifu_retire0_chk_idx              (rtu_ifu_retire0_chk_idx             ),
  .rtu_ifu_retire0_condbr               (rtu_ifu_retire0_condbr              ),
  .rtu_ifu_retire0_condbr_taken         (rtu_ifu_retire0_condbr_taken        ),
  .rtu_ifu_retire0_inc_pc               (rtu_ifu_retire0_inc_pc              ),
  .rtu_ifu_retire0_jmp                  (rtu_ifu_retire0_jmp                 ),
  .rtu_ifu_retire0_jmp_mispred          (rtu_ifu_retire0_jmp_mispred         ),
  .rtu_ifu_retire0_mispred              (rtu_ifu_retire0_mispred             ),
  .rtu_ifu_retire0_next_pc              (rtu_ifu_retire0_next_pc             ),
  .rtu_ifu_retire0_pcall                (rtu_ifu_retire0_pcall               ),
  .rtu_ifu_retire0_preturn              (rtu_ifu_retire0_preturn             ),
  .rtu_ifu_retire1_chk_idx              (rtu_ifu_retire1_chk_idx             ),
  .rtu_ifu_retire1_condbr               (rtu_ifu_retire1_condbr              ),
  .rtu_ifu_retire1_condbr_taken         (rtu_ifu_retire1_condbr_taken        ),
  .rtu_ifu_retire1_jmp                  (rtu_ifu_retire1_jmp                 ),
  .rtu_ifu_retire2_chk_idx              (rtu_ifu_retire2_chk_idx             ),
  .rtu_ifu_retire2_condbr               (rtu_ifu_retire2_condbr              ),
  .rtu_ifu_retire2_condbr_taken         (rtu_ifu_retire2_condbr_taken        ),
  .rtu_ifu_retire2_jmp                  (rtu_ifu_retire2_jmp                 ),
  .rtu_ifu_retire_inst0_cur_pc          (rtu_ifu_retire_inst0_cur_pc         ),
  .rtu_ifu_retire_inst0_load            (rtu_ifu_retire_inst0_load           ),
  .rtu_ifu_retire_inst0_no_spec_hit     (rtu_ifu_retire_inst0_no_spec_hit    ),
  .rtu_ifu_retire_inst0_no_spec_mispred (rtu_ifu_retire_inst0_no_spec_mispred),
  .rtu_ifu_retire_inst0_no_spec_miss    (rtu_ifu_retire_inst0_no_spec_miss   ),
  .rtu_ifu_retire_inst0_store           (rtu_ifu_retire_inst0_store          ),
  .rtu_ifu_retire_inst0_vl_hit          (rtu_ifu_retire_inst0_vl_hit         ),
  .rtu_ifu_retire_inst0_vl_mispred      (rtu_ifu_retire_inst0_vl_mispred     ),
  .rtu_ifu_retire_inst0_vl_miss         (rtu_ifu_retire_inst0_vl_miss        ),
  .rtu_ifu_retire_inst0_vl_pred         (rtu_ifu_retire_inst0_vl_pred        ),
  .rtu_ifu_retire_inst1_cur_pc          (rtu_ifu_retire_inst1_cur_pc         ),
  .rtu_ifu_retire_inst1_load            (rtu_ifu_retire_inst1_load           ),
  .rtu_ifu_retire_inst1_no_spec_hit     (rtu_ifu_retire_inst1_no_spec_hit    ),
  .rtu_ifu_retire_inst1_no_spec_mispred (rtu_ifu_retire_inst1_no_spec_mispred),
  .rtu_ifu_retire_inst1_no_spec_miss    (rtu_ifu_retire_inst1_no_spec_miss   ),
  .rtu_ifu_retire_inst1_store           (rtu_ifu_retire_inst1_store          ),
  .rtu_ifu_retire_inst1_vl_pred         (rtu_ifu_retire_inst1_vl_pred        ),
  .rtu_ifu_retire_inst2_cur_pc          (rtu_ifu_retire_inst2_cur_pc         ),
  .rtu_ifu_retire_inst2_load            (rtu_ifu_retire_inst2_load           ),
  .rtu_ifu_retire_inst2_no_spec_hit     (rtu_ifu_retire_inst2_no_spec_hit    ),
  .rtu_ifu_retire_inst2_no_spec_mispred (rtu_ifu_retire_inst2_no_spec_mispred),
  .rtu_ifu_retire_inst2_no_spec_miss    (rtu_ifu_retire_inst2_no_spec_miss   ),
  .rtu_ifu_retire_inst2_store           (rtu_ifu_retire_inst2_store          ),
  .rtu_ifu_retire_inst2_vl_pred         (rtu_ifu_retire_inst2_vl_pred        ),
  .rtu_ifu_xx_dbgon                     (rtu_ifu_xx_dbgon                    ),
  .rtu_ifu_xx_expt_vec                  (rtu_ifu_xx_expt_vec                 ),
  .rtu_ifu_xx_expt_vld                  (rtu_ifu_xx_expt_vld                 ),
  .rtu_yy_xx_dbgon                      (rtu_yy_xx_dbgon                     ),
  .vfdsu_ifu_debug_ex2_wait             (vfdsu_ifu_debug_ex2_wait            ),
  .vfdsu_ifu_debug_idle                 (vfdsu_ifu_debug_idle                ),
  .vfdsu_ifu_debug_pipe_busy            (vfdsu_ifu_debug_pipe_busy           )
);

// &Connect(.cpurst_b   (ifu_rst_b)); @46

//==========================================================
//  Instance ct_idu_top sub module 
//==========================================================
// &Instance("ct_idu_top"); @51
ct_idu_top  x_ct_idu_top (
  .cp0_idu_cskyee                          (cp0_idu_cskyee                         ),
  .cp0_idu_dlb_disable                     (cp0_idu_dlb_disable                    ),
  .cp0_idu_frm                             (cp0_idu_frm                            ),
  .cp0_idu_fs                              (cp0_idu_fs                             ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_idu_iq_bypass_disable               (cp0_idu_iq_bypass_disable              ),
  .cp0_idu_rob_fold_disable                (cp0_idu_rob_fold_disable               ),
  .cp0_idu_src2_fwd_disable                (cp0_idu_src2_fwd_disable               ),
  .cp0_idu_srcv2_fwd_disable               (cp0_idu_srcv2_fwd_disable              ),
  .cp0_idu_vill                            (cp0_idu_vill                           ),
  .cp0_idu_vs                              (cp0_idu_vs                             ),
  .cp0_idu_vstart                          (cp0_idu_vstart                         ),
  .cp0_idu_zero_delay_move_disable         (cp0_idu_zero_delay_move_disable        ),
  .cp0_lsu_fencei_broad_dis                (cp0_lsu_fencei_broad_dis               ),
  .cp0_lsu_fencerw_broad_dis               (cp0_lsu_fencerw_broad_dis              ),
  .cp0_lsu_tlb_broad_dis                   (cp0_lsu_tlb_broad_dis                  ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cp0_yy_hyper                            (cp0_yy_hyper                           ),
  .cpurst_b                                (idu_rst_b                              ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .had_idu_debug_id_inst_en                (had_idu_debug_id_inst_en               ),
  .had_idu_wbbr_data                       (had_idu_wbbr_data                      ),
  .had_idu_wbbr_vld                        (had_idu_wbbr_vld                       ),
  .hpcp_idu_cnt_en                         (hpcp_idu_cnt_en                        ),
  .idu_cp0_fesr_acc_updt_val               (idu_cp0_fesr_acc_updt_val              ),
  .idu_cp0_fesr_acc_updt_vld               (idu_cp0_fesr_acc_updt_vld              ),
  .idu_cp0_rf_func                         (idu_cp0_rf_func                        ),
  .idu_cp0_rf_gateclk_sel                  (idu_cp0_rf_gateclk_sel                 ),
  .idu_cp0_rf_iid                          (idu_cp0_rf_iid                         ),
  .idu_cp0_rf_opcode                       (idu_cp0_rf_opcode                      ),
  .idu_cp0_rf_preg                         (idu_cp0_rf_preg                        ),
  .idu_cp0_rf_sel                          (idu_cp0_rf_sel                         ),
  .idu_cp0_rf_src0                         (idu_cp0_rf_src0                        ),
  .idu_had_debug_info                      (idu_had_debug_info                     ),
  .idu_had_id_inst0_info                   (idu_had_id_inst0_info                  ),
  .idu_had_id_inst0_vld                    (idu_had_id_inst0_vld                   ),
  .idu_had_id_inst1_info                   (idu_had_id_inst1_info                  ),
  .idu_had_id_inst1_vld                    (idu_had_id_inst1_vld                   ),
  .idu_had_id_inst2_info                   (idu_had_id_inst2_info                  ),
  .idu_had_id_inst2_vld                    (idu_had_id_inst2_vld                   ),
  .idu_had_iq_empty                        (idu_had_iq_empty                       ),
  .idu_had_pipe_stall                      (idu_had_pipe_stall                     ),
  .idu_had_pipeline_empty                  (idu_had_pipeline_empty                 ),
  .idu_had_wb_data                         (idu_had_wb_data                        ),
  .idu_had_wb_vld                          (idu_had_wb_vld                         ),
  .idu_hpcp_backend_stall                  (idu_hpcp_backend_stall                 ),
  .idu_hpcp_fence_sync_vld                 (idu_hpcp_fence_sync_vld                ),
  .idu_hpcp_ir_inst0_type                  (idu_hpcp_ir_inst0_type                 ),
  .idu_hpcp_ir_inst0_vld                   (idu_hpcp_ir_inst0_vld                  ),
  .idu_hpcp_ir_inst1_type                  (idu_hpcp_ir_inst1_type                 ),
  .idu_hpcp_ir_inst1_vld                   (idu_hpcp_ir_inst1_vld                  ),
  .idu_hpcp_ir_inst2_type                  (idu_hpcp_ir_inst2_type                 ),
  .idu_hpcp_ir_inst2_vld                   (idu_hpcp_ir_inst2_vld                  ),
  .idu_hpcp_ir_inst3_type                  (idu_hpcp_ir_inst3_type                 ),
  .idu_hpcp_ir_inst3_vld                   (idu_hpcp_ir_inst3_vld                  ),
  .idu_hpcp_rf_inst_vld                    (idu_hpcp_rf_inst_vld                   ),
  .idu_hpcp_rf_pipe0_inst_vld              (idu_hpcp_rf_pipe0_inst_vld             ),
  .idu_hpcp_rf_pipe0_lch_fail_vld          (idu_hpcp_rf_pipe0_lch_fail_vld         ),
  .idu_hpcp_rf_pipe1_inst_vld              (idu_hpcp_rf_pipe1_inst_vld             ),
  .idu_hpcp_rf_pipe1_lch_fail_vld          (idu_hpcp_rf_pipe1_lch_fail_vld         ),
  .idu_hpcp_rf_pipe2_inst_vld              (idu_hpcp_rf_pipe2_inst_vld             ),
  .idu_hpcp_rf_pipe2_lch_fail_vld          (idu_hpcp_rf_pipe2_lch_fail_vld         ),
  .idu_hpcp_rf_pipe3_inst_vld              (idu_hpcp_rf_pipe3_inst_vld             ),
  .idu_hpcp_rf_pipe3_lch_fail_vld          (idu_hpcp_rf_pipe3_lch_fail_vld         ),
  .idu_hpcp_rf_pipe3_reg_lch_fail_vld      (idu_hpcp_rf_pipe3_reg_lch_fail_vld     ),
  .idu_hpcp_rf_pipe4_inst_vld              (idu_hpcp_rf_pipe4_inst_vld             ),
  .idu_hpcp_rf_pipe4_lch_fail_vld          (idu_hpcp_rf_pipe4_lch_fail_vld         ),
  .idu_hpcp_rf_pipe4_reg_lch_fail_vld      (idu_hpcp_rf_pipe4_reg_lch_fail_vld     ),
  .idu_hpcp_rf_pipe5_inst_vld              (idu_hpcp_rf_pipe5_inst_vld             ),
  .idu_hpcp_rf_pipe5_lch_fail_vld          (idu_hpcp_rf_pipe5_lch_fail_vld         ),
  .idu_hpcp_rf_pipe5_reg_lch_fail_vld      (idu_hpcp_rf_pipe5_reg_lch_fail_vld     ),
  .idu_hpcp_rf_pipe6_inst_vld              (idu_hpcp_rf_pipe6_inst_vld             ),
  .idu_hpcp_rf_pipe6_lch_fail_vld          (idu_hpcp_rf_pipe6_lch_fail_vld         ),
  .idu_hpcp_rf_pipe7_inst_vld              (idu_hpcp_rf_pipe7_inst_vld             ),
  .idu_hpcp_rf_pipe7_lch_fail_vld          (idu_hpcp_rf_pipe7_lch_fail_vld         ),
  .idu_ifu_id_bypass_stall                 (idu_ifu_id_bypass_stall                ),
  .idu_ifu_id_stall                        (idu_ifu_id_stall                       ),
  .idu_iu_is_div_gateclk_issue             (idu_iu_is_div_gateclk_issue            ),
  .idu_iu_is_div_issue                     (idu_iu_is_div_issue                    ),
  .idu_iu_is_pcfifo_inst_num               (idu_iu_is_pcfifo_inst_num              ),
  .idu_iu_is_pcfifo_inst_vld               (idu_iu_is_pcfifo_inst_vld              ),
  .idu_iu_rf_bju_gateclk_sel               (idu_iu_rf_bju_gateclk_sel              ),
  .idu_iu_rf_bju_sel                       (idu_iu_rf_bju_sel                      ),
  .idu_iu_rf_div_gateclk_sel               (idu_iu_rf_div_gateclk_sel              ),
  .idu_iu_rf_div_sel                       (idu_iu_rf_div_sel                      ),
  .idu_iu_rf_mult_gateclk_sel              (idu_iu_rf_mult_gateclk_sel             ),
  .idu_iu_rf_mult_sel                      (idu_iu_rf_mult_sel                     ),
  .idu_iu_rf_pipe0_alu_short               (idu_iu_rf_pipe0_alu_short              ),
  .idu_iu_rf_pipe0_cbus_gateclk_sel        (idu_iu_rf_pipe0_cbus_gateclk_sel       ),
  .idu_iu_rf_pipe0_dst_preg                (idu_iu_rf_pipe0_dst_preg               ),
  .idu_iu_rf_pipe0_dst_vld                 (idu_iu_rf_pipe0_dst_vld                ),
  .idu_iu_rf_pipe0_dst_vreg                (idu_iu_rf_pipe0_dst_vreg               ),
  .idu_iu_rf_pipe0_dstv_vld                (idu_iu_rf_pipe0_dstv_vld               ),
  .idu_iu_rf_pipe0_expt_vec                (idu_iu_rf_pipe0_expt_vec               ),
  .idu_iu_rf_pipe0_expt_vld                (idu_iu_rf_pipe0_expt_vld               ),
  .idu_iu_rf_pipe0_func                    (idu_iu_rf_pipe0_func                   ),
  .idu_iu_rf_pipe0_gateclk_sel             (idu_iu_rf_pipe0_gateclk_sel            ),
  .idu_iu_rf_pipe0_high_hw_expt            (idu_iu_rf_pipe0_high_hw_expt           ),
  .idu_iu_rf_pipe0_iid                     (idu_iu_rf_pipe0_iid                    ),
  .idu_iu_rf_pipe0_imm                     (idu_iu_rf_pipe0_imm                    ),
  .idu_iu_rf_pipe0_opcode                  (idu_iu_rf_pipe0_opcode                 ),
  .idu_iu_rf_pipe0_pid                     (idu_iu_rf_pipe0_pid                    ),
  .idu_iu_rf_pipe0_rslt_sel                (idu_iu_rf_pipe0_rslt_sel               ),
  .idu_iu_rf_pipe0_sel                     (idu_iu_rf_pipe0_sel                    ),
  .idu_iu_rf_pipe0_special_imm             (idu_iu_rf_pipe0_special_imm            ),
  .idu_iu_rf_pipe0_src0                    (idu_iu_rf_pipe0_src0                   ),
  .idu_iu_rf_pipe0_src1                    (idu_iu_rf_pipe0_src1                   ),
  .idu_iu_rf_pipe0_src1_no_imm             (idu_iu_rf_pipe0_src1_no_imm            ),
  .idu_iu_rf_pipe0_src2                    (idu_iu_rf_pipe0_src2                   ),
  .idu_iu_rf_pipe0_vl                      (idu_iu_rf_pipe0_vl                     ),
  .idu_iu_rf_pipe0_vlmul                   (idu_iu_rf_pipe0_vlmul                  ),
  .idu_iu_rf_pipe0_vsew                    (idu_iu_rf_pipe0_vsew                   ),
  .idu_iu_rf_pipe1_alu_short               (idu_iu_rf_pipe1_alu_short              ),
  .idu_iu_rf_pipe1_cbus_gateclk_sel        (idu_iu_rf_pipe1_cbus_gateclk_sel       ),
  .idu_iu_rf_pipe1_dst_preg                (idu_iu_rf_pipe1_dst_preg               ),
  .idu_iu_rf_pipe1_dst_vld                 (idu_iu_rf_pipe1_dst_vld                ),
  .idu_iu_rf_pipe1_dst_vreg                (idu_iu_rf_pipe1_dst_vreg               ),
  .idu_iu_rf_pipe1_dstv_vld                (idu_iu_rf_pipe1_dstv_vld               ),
  .idu_iu_rf_pipe1_func                    (idu_iu_rf_pipe1_func                   ),
  .idu_iu_rf_pipe1_gateclk_sel             (idu_iu_rf_pipe1_gateclk_sel            ),
  .idu_iu_rf_pipe1_iid                     (idu_iu_rf_pipe1_iid                    ),
  .idu_iu_rf_pipe1_imm                     (idu_iu_rf_pipe1_imm                    ),
  .idu_iu_rf_pipe1_mla_src2_preg           (idu_iu_rf_pipe1_mla_src2_preg          ),
  .idu_iu_rf_pipe1_mla_src2_vld            (idu_iu_rf_pipe1_mla_src2_vld           ),
  .idu_iu_rf_pipe1_mult_func               (idu_iu_rf_pipe1_mult_func              ),
  .idu_iu_rf_pipe1_rslt_sel                (idu_iu_rf_pipe1_rslt_sel               ),
  .idu_iu_rf_pipe1_sel                     (idu_iu_rf_pipe1_sel                    ),
  .idu_iu_rf_pipe1_src0                    (idu_iu_rf_pipe1_src0                   ),
  .idu_iu_rf_pipe1_src1                    (idu_iu_rf_pipe1_src1                   ),
  .idu_iu_rf_pipe1_src1_no_imm             (idu_iu_rf_pipe1_src1_no_imm            ),
  .idu_iu_rf_pipe1_src2                    (idu_iu_rf_pipe1_src2                   ),
  .idu_iu_rf_pipe1_vl                      (idu_iu_rf_pipe1_vl                     ),
  .idu_iu_rf_pipe1_vlmul                   (idu_iu_rf_pipe1_vlmul                  ),
  .idu_iu_rf_pipe1_vsew                    (idu_iu_rf_pipe1_vsew                   ),
  .idu_iu_rf_pipe2_func                    (idu_iu_rf_pipe2_func                   ),
  .idu_iu_rf_pipe2_iid                     (idu_iu_rf_pipe2_iid                    ),
  .idu_iu_rf_pipe2_length                  (idu_iu_rf_pipe2_length                 ),
  .idu_iu_rf_pipe2_offset                  (idu_iu_rf_pipe2_offset                 ),
  .idu_iu_rf_pipe2_pcall                   (idu_iu_rf_pipe2_pcall                  ),
  .idu_iu_rf_pipe2_pid                     (idu_iu_rf_pipe2_pid                    ),
  .idu_iu_rf_pipe2_rts                     (idu_iu_rf_pipe2_rts                    ),
  .idu_iu_rf_pipe2_src0                    (idu_iu_rf_pipe2_src0                   ),
  .idu_iu_rf_pipe2_src1                    (idu_iu_rf_pipe2_src1                   ),
  .idu_iu_rf_pipe2_vl                      (idu_iu_rf_pipe2_vl                     ),
  .idu_iu_rf_pipe2_vlmul                   (idu_iu_rf_pipe2_vlmul                  ),
  .idu_iu_rf_pipe2_vsew                    (idu_iu_rf_pipe2_vsew                   ),
  .idu_iu_rf_special_gateclk_sel           (idu_iu_rf_special_gateclk_sel          ),
  .idu_iu_rf_special_sel                   (idu_iu_rf_special_sel                  ),
  .idu_lsu_rf_pipe3_already_da             (idu_lsu_rf_pipe3_already_da            ),
  .idu_lsu_rf_pipe3_atomic                 (idu_lsu_rf_pipe3_atomic                ),
  .idu_lsu_rf_pipe3_bkpta_data             (idu_lsu_rf_pipe3_bkpta_data            ),
  .idu_lsu_rf_pipe3_bkptb_data             (idu_lsu_rf_pipe3_bkptb_data            ),
  .idu_lsu_rf_pipe3_gateclk_sel            (idu_lsu_rf_pipe3_gateclk_sel           ),
  .idu_lsu_rf_pipe3_iid                    (idu_lsu_rf_pipe3_iid                   ),
  .idu_lsu_rf_pipe3_inst_fls               (idu_lsu_rf_pipe3_inst_fls              ),
  .idu_lsu_rf_pipe3_inst_ldr               (idu_lsu_rf_pipe3_inst_ldr              ),
  .idu_lsu_rf_pipe3_inst_size              (idu_lsu_rf_pipe3_inst_size             ),
  .idu_lsu_rf_pipe3_inst_type              (idu_lsu_rf_pipe3_inst_type             ),
  .idu_lsu_rf_pipe3_lch_entry              (idu_lsu_rf_pipe3_lch_entry             ),
  .idu_lsu_rf_pipe3_lsfifo                 (idu_lsu_rf_pipe3_lsfifo                ),
  .idu_lsu_rf_pipe3_no_spec                (idu_lsu_rf_pipe3_no_spec               ),
  .idu_lsu_rf_pipe3_no_spec_exist          (idu_lsu_rf_pipe3_no_spec_exist         ),
  .idu_lsu_rf_pipe3_off_0_extend           (idu_lsu_rf_pipe3_off_0_extend          ),
  .idu_lsu_rf_pipe3_offset                 (idu_lsu_rf_pipe3_offset                ),
  .idu_lsu_rf_pipe3_offset_plus            (idu_lsu_rf_pipe3_offset_plus           ),
  .idu_lsu_rf_pipe3_oldest                 (idu_lsu_rf_pipe3_oldest                ),
  .idu_lsu_rf_pipe3_pc                     (idu_lsu_rf_pipe3_pc                    ),
  .idu_lsu_rf_pipe3_preg                   (idu_lsu_rf_pipe3_preg                  ),
  .idu_lsu_rf_pipe3_sel                    (idu_lsu_rf_pipe3_sel                   ),
  .idu_lsu_rf_pipe3_shift                  (idu_lsu_rf_pipe3_shift                 ),
  .idu_lsu_rf_pipe3_sign_extend            (idu_lsu_rf_pipe3_sign_extend           ),
  .idu_lsu_rf_pipe3_spec_fail              (idu_lsu_rf_pipe3_spec_fail             ),
  .idu_lsu_rf_pipe3_split                  (idu_lsu_rf_pipe3_split                 ),
  .idu_lsu_rf_pipe3_src0                   (idu_lsu_rf_pipe3_src0                  ),
  .idu_lsu_rf_pipe3_src1                   (idu_lsu_rf_pipe3_src1                  ),
  .idu_lsu_rf_pipe3_unalign_2nd            (idu_lsu_rf_pipe3_unalign_2nd           ),
  .idu_lsu_rf_pipe3_vreg                   (idu_lsu_rf_pipe3_vreg                  ),
  .idu_lsu_rf_pipe4_already_da             (idu_lsu_rf_pipe4_already_da            ),
  .idu_lsu_rf_pipe4_atomic                 (idu_lsu_rf_pipe4_atomic                ),
  .idu_lsu_rf_pipe4_bkpta_data             (idu_lsu_rf_pipe4_bkpta_data            ),
  .idu_lsu_rf_pipe4_bkptb_data             (idu_lsu_rf_pipe4_bkptb_data            ),
  .idu_lsu_rf_pipe4_fence_mode             (idu_lsu_rf_pipe4_fence_mode            ),
  .idu_lsu_rf_pipe4_gateclk_sel            (idu_lsu_rf_pipe4_gateclk_sel           ),
  .idu_lsu_rf_pipe4_icc                    (idu_lsu_rf_pipe4_icc                   ),
  .idu_lsu_rf_pipe4_iid                    (idu_lsu_rf_pipe4_iid                   ),
  .idu_lsu_rf_pipe4_inst_code              (idu_lsu_rf_pipe4_inst_code             ),
  .idu_lsu_rf_pipe4_inst_fls               (idu_lsu_rf_pipe4_inst_fls              ),
  .idu_lsu_rf_pipe4_inst_flush             (idu_lsu_rf_pipe4_inst_flush            ),
  .idu_lsu_rf_pipe4_inst_mode              (idu_lsu_rf_pipe4_inst_mode             ),
  .idu_lsu_rf_pipe4_inst_share             (idu_lsu_rf_pipe4_inst_share            ),
  .idu_lsu_rf_pipe4_inst_size              (idu_lsu_rf_pipe4_inst_size             ),
  .idu_lsu_rf_pipe4_inst_str               (idu_lsu_rf_pipe4_inst_str              ),
  .idu_lsu_rf_pipe4_inst_type              (idu_lsu_rf_pipe4_inst_type             ),
  .idu_lsu_rf_pipe4_lch_entry              (idu_lsu_rf_pipe4_lch_entry             ),
  .idu_lsu_rf_pipe4_lsfifo                 (idu_lsu_rf_pipe4_lsfifo                ),
  .idu_lsu_rf_pipe4_mmu_req                (idu_lsu_rf_pipe4_mmu_req               ),
  .idu_lsu_rf_pipe4_no_spec                (idu_lsu_rf_pipe4_no_spec               ),
  .idu_lsu_rf_pipe4_off_0_extend           (idu_lsu_rf_pipe4_off_0_extend          ),
  .idu_lsu_rf_pipe4_offset                 (idu_lsu_rf_pipe4_offset                ),
  .idu_lsu_rf_pipe4_offset_plus            (idu_lsu_rf_pipe4_offset_plus           ),
  .idu_lsu_rf_pipe4_oldest                 (idu_lsu_rf_pipe4_oldest                ),
  .idu_lsu_rf_pipe4_pc                     (idu_lsu_rf_pipe4_pc                    ),
  .idu_lsu_rf_pipe4_sdiq_entry             (idu_lsu_rf_pipe4_sdiq_entry            ),
  .idu_lsu_rf_pipe4_sel                    (idu_lsu_rf_pipe4_sel                   ),
  .idu_lsu_rf_pipe4_shift                  (idu_lsu_rf_pipe4_shift                 ),
  .idu_lsu_rf_pipe4_spec_fail              (idu_lsu_rf_pipe4_spec_fail             ),
  .idu_lsu_rf_pipe4_split                  (idu_lsu_rf_pipe4_split                 ),
  .idu_lsu_rf_pipe4_src0                   (idu_lsu_rf_pipe4_src0                  ),
  .idu_lsu_rf_pipe4_src1                   (idu_lsu_rf_pipe4_src1                  ),
  .idu_lsu_rf_pipe4_st                     (idu_lsu_rf_pipe4_st                    ),
  .idu_lsu_rf_pipe4_staddr                 (idu_lsu_rf_pipe4_staddr                ),
  .idu_lsu_rf_pipe4_sync_fence             (idu_lsu_rf_pipe4_sync_fence            ),
  .idu_lsu_rf_pipe4_unalign_2nd            (idu_lsu_rf_pipe4_unalign_2nd           ),
  .idu_lsu_rf_pipe5_gateclk_sel            (idu_lsu_rf_pipe5_gateclk_sel           ),
  .idu_lsu_rf_pipe5_sdiq_entry             (idu_lsu_rf_pipe5_sdiq_entry            ),
  .idu_lsu_rf_pipe5_sel                    (idu_lsu_rf_pipe5_sel                   ),
  .idu_lsu_rf_pipe5_src0                   (idu_lsu_rf_pipe5_src0                  ),
  .idu_lsu_rf_pipe5_srcv0_fr               (idu_lsu_rf_pipe5_srcv0_fr              ),
  .idu_lsu_rf_pipe5_srcv0_fr_vld           (idu_lsu_rf_pipe5_srcv0_fr_vld          ),
  .idu_lsu_rf_pipe5_srcv0_vld              (idu_lsu_rf_pipe5_srcv0_vld             ),
  .idu_lsu_rf_pipe5_srcv0_vr0              (idu_lsu_rf_pipe5_srcv0_vr0             ),
  .idu_lsu_rf_pipe5_srcv0_vr1              (idu_lsu_rf_pipe5_srcv0_vr1             ),
  .idu_lsu_rf_pipe5_stdata1_vld            (idu_lsu_rf_pipe5_stdata1_vld           ),
  .idu_lsu_rf_pipe5_unalign                (idu_lsu_rf_pipe5_unalign               ),
  .idu_lsu_vmb_create0_dp_en               (idu_lsu_vmb_create0_dp_en              ),
  .idu_lsu_vmb_create0_dst_ready           (idu_lsu_vmb_create0_dst_ready          ),
  .idu_lsu_vmb_create0_en                  (idu_lsu_vmb_create0_en                 ),
  .idu_lsu_vmb_create0_gateclk_en          (idu_lsu_vmb_create0_gateclk_en         ),
  .idu_lsu_vmb_create0_sdiq_entry          (idu_lsu_vmb_create0_sdiq_entry         ),
  .idu_lsu_vmb_create0_split_num           (idu_lsu_vmb_create0_split_num          ),
  .idu_lsu_vmb_create0_unit_stride         (idu_lsu_vmb_create0_unit_stride        ),
  .idu_lsu_vmb_create0_vamo                (idu_lsu_vmb_create0_vamo               ),
  .idu_lsu_vmb_create0_vl                  (idu_lsu_vmb_create0_vl                 ),
  .idu_lsu_vmb_create0_vreg                (idu_lsu_vmb_create0_vreg               ),
  .idu_lsu_vmb_create0_vsew                (idu_lsu_vmb_create0_vsew               ),
  .idu_lsu_vmb_create1_dp_en               (idu_lsu_vmb_create1_dp_en              ),
  .idu_lsu_vmb_create1_dst_ready           (idu_lsu_vmb_create1_dst_ready          ),
  .idu_lsu_vmb_create1_en                  (idu_lsu_vmb_create1_en                 ),
  .idu_lsu_vmb_create1_gateclk_en          (idu_lsu_vmb_create1_gateclk_en         ),
  .idu_lsu_vmb_create1_sdiq_entry          (idu_lsu_vmb_create1_sdiq_entry         ),
  .idu_lsu_vmb_create1_split_num           (idu_lsu_vmb_create1_split_num          ),
  .idu_lsu_vmb_create1_unit_stride         (idu_lsu_vmb_create1_unit_stride        ),
  .idu_lsu_vmb_create1_vamo                (idu_lsu_vmb_create1_vamo               ),
  .idu_lsu_vmb_create1_vl                  (idu_lsu_vmb_create1_vl                 ),
  .idu_lsu_vmb_create1_vreg                (idu_lsu_vmb_create1_vreg               ),
  .idu_lsu_vmb_create1_vsew                (idu_lsu_vmb_create1_vsew               ),
  .idu_rtu_fence_idle                      (idu_rtu_fence_idle                     ),
  .idu_rtu_ir_ereg0_alloc_vld              (idu_rtu_ir_ereg0_alloc_vld             ),
  .idu_rtu_ir_ereg1_alloc_vld              (idu_rtu_ir_ereg1_alloc_vld             ),
  .idu_rtu_ir_ereg2_alloc_vld              (idu_rtu_ir_ereg2_alloc_vld             ),
  .idu_rtu_ir_ereg3_alloc_vld              (idu_rtu_ir_ereg3_alloc_vld             ),
  .idu_rtu_ir_ereg_alloc_gateclk_vld       (idu_rtu_ir_ereg_alloc_gateclk_vld      ),
  .idu_rtu_ir_freg0_alloc_vld              (idu_rtu_ir_freg0_alloc_vld             ),
  .idu_rtu_ir_freg1_alloc_vld              (idu_rtu_ir_freg1_alloc_vld             ),
  .idu_rtu_ir_freg2_alloc_vld              (idu_rtu_ir_freg2_alloc_vld             ),
  .idu_rtu_ir_freg3_alloc_vld              (idu_rtu_ir_freg3_alloc_vld             ),
  .idu_rtu_ir_freg_alloc_gateclk_vld       (idu_rtu_ir_freg_alloc_gateclk_vld      ),
  .idu_rtu_ir_preg0_alloc_vld              (idu_rtu_ir_preg0_alloc_vld             ),
  .idu_rtu_ir_preg1_alloc_vld              (idu_rtu_ir_preg1_alloc_vld             ),
  .idu_rtu_ir_preg2_alloc_vld              (idu_rtu_ir_preg2_alloc_vld             ),
  .idu_rtu_ir_preg3_alloc_vld              (idu_rtu_ir_preg3_alloc_vld             ),
  .idu_rtu_ir_preg_alloc_gateclk_vld       (idu_rtu_ir_preg_alloc_gateclk_vld      ),
  .idu_rtu_ir_vreg0_alloc_vld              (idu_rtu_ir_vreg0_alloc_vld             ),
  .idu_rtu_ir_vreg1_alloc_vld              (idu_rtu_ir_vreg1_alloc_vld             ),
  .idu_rtu_ir_vreg2_alloc_vld              (idu_rtu_ir_vreg2_alloc_vld             ),
  .idu_rtu_ir_vreg3_alloc_vld              (idu_rtu_ir_vreg3_alloc_vld             ),
  .idu_rtu_ir_vreg_alloc_gateclk_vld       (idu_rtu_ir_vreg_alloc_gateclk_vld      ),
  .idu_rtu_pst_dis_inst0_dst_reg           (idu_rtu_pst_dis_inst0_dst_reg          ),
  .idu_rtu_pst_dis_inst0_dstv_reg          (idu_rtu_pst_dis_inst0_dstv_reg         ),
  .idu_rtu_pst_dis_inst0_ereg              (idu_rtu_pst_dis_inst0_ereg             ),
  .idu_rtu_pst_dis_inst0_ereg_iid          (idu_rtu_pst_dis_inst0_ereg_iid         ),
  .idu_rtu_pst_dis_inst0_ereg_vld          (idu_rtu_pst_dis_inst0_ereg_vld         ),
  .idu_rtu_pst_dis_inst0_freg_vld          (idu_rtu_pst_dis_inst0_freg_vld         ),
  .idu_rtu_pst_dis_inst0_preg              (idu_rtu_pst_dis_inst0_preg             ),
  .idu_rtu_pst_dis_inst0_preg_iid          (idu_rtu_pst_dis_inst0_preg_iid         ),
  .idu_rtu_pst_dis_inst0_preg_vld          (idu_rtu_pst_dis_inst0_preg_vld         ),
  .idu_rtu_pst_dis_inst0_rel_ereg          (idu_rtu_pst_dis_inst0_rel_ereg         ),
  .idu_rtu_pst_dis_inst0_rel_preg          (idu_rtu_pst_dis_inst0_rel_preg         ),
  .idu_rtu_pst_dis_inst0_rel_vreg          (idu_rtu_pst_dis_inst0_rel_vreg         ),
  .idu_rtu_pst_dis_inst0_vreg              (idu_rtu_pst_dis_inst0_vreg             ),
  .idu_rtu_pst_dis_inst0_vreg_iid          (idu_rtu_pst_dis_inst0_vreg_iid         ),
  .idu_rtu_pst_dis_inst0_vreg_vld          (idu_rtu_pst_dis_inst0_vreg_vld         ),
  .idu_rtu_pst_dis_inst1_dst_reg           (idu_rtu_pst_dis_inst1_dst_reg          ),
  .idu_rtu_pst_dis_inst1_dstv_reg          (idu_rtu_pst_dis_inst1_dstv_reg         ),
  .idu_rtu_pst_dis_inst1_ereg              (idu_rtu_pst_dis_inst1_ereg             ),
  .idu_rtu_pst_dis_inst1_ereg_iid          (idu_rtu_pst_dis_inst1_ereg_iid         ),
  .idu_rtu_pst_dis_inst1_ereg_vld          (idu_rtu_pst_dis_inst1_ereg_vld         ),
  .idu_rtu_pst_dis_inst1_freg_vld          (idu_rtu_pst_dis_inst1_freg_vld         ),
  .idu_rtu_pst_dis_inst1_preg              (idu_rtu_pst_dis_inst1_preg             ),
  .idu_rtu_pst_dis_inst1_preg_iid          (idu_rtu_pst_dis_inst1_preg_iid         ),
  .idu_rtu_pst_dis_inst1_preg_vld          (idu_rtu_pst_dis_inst1_preg_vld         ),
  .idu_rtu_pst_dis_inst1_rel_ereg          (idu_rtu_pst_dis_inst1_rel_ereg         ),
  .idu_rtu_pst_dis_inst1_rel_preg          (idu_rtu_pst_dis_inst1_rel_preg         ),
  .idu_rtu_pst_dis_inst1_rel_vreg          (idu_rtu_pst_dis_inst1_rel_vreg         ),
  .idu_rtu_pst_dis_inst1_vreg              (idu_rtu_pst_dis_inst1_vreg             ),
  .idu_rtu_pst_dis_inst1_vreg_iid          (idu_rtu_pst_dis_inst1_vreg_iid         ),
  .idu_rtu_pst_dis_inst1_vreg_vld          (idu_rtu_pst_dis_inst1_vreg_vld         ),
  .idu_rtu_pst_dis_inst2_dst_reg           (idu_rtu_pst_dis_inst2_dst_reg          ),
  .idu_rtu_pst_dis_inst2_dstv_reg          (idu_rtu_pst_dis_inst2_dstv_reg         ),
  .idu_rtu_pst_dis_inst2_ereg              (idu_rtu_pst_dis_inst2_ereg             ),
  .idu_rtu_pst_dis_inst2_ereg_iid          (idu_rtu_pst_dis_inst2_ereg_iid         ),
  .idu_rtu_pst_dis_inst2_ereg_vld          (idu_rtu_pst_dis_inst2_ereg_vld         ),
  .idu_rtu_pst_dis_inst2_freg_vld          (idu_rtu_pst_dis_inst2_freg_vld         ),
  .idu_rtu_pst_dis_inst2_preg              (idu_rtu_pst_dis_inst2_preg             ),
  .idu_rtu_pst_dis_inst2_preg_iid          (idu_rtu_pst_dis_inst2_preg_iid         ),
  .idu_rtu_pst_dis_inst2_preg_vld          (idu_rtu_pst_dis_inst2_preg_vld         ),
  .idu_rtu_pst_dis_inst2_rel_ereg          (idu_rtu_pst_dis_inst2_rel_ereg         ),
  .idu_rtu_pst_dis_inst2_rel_preg          (idu_rtu_pst_dis_inst2_rel_preg         ),
  .idu_rtu_pst_dis_inst2_rel_vreg          (idu_rtu_pst_dis_inst2_rel_vreg         ),
  .idu_rtu_pst_dis_inst2_vreg              (idu_rtu_pst_dis_inst2_vreg             ),
  .idu_rtu_pst_dis_inst2_vreg_iid          (idu_rtu_pst_dis_inst2_vreg_iid         ),
  .idu_rtu_pst_dis_inst2_vreg_vld          (idu_rtu_pst_dis_inst2_vreg_vld         ),
  .idu_rtu_pst_dis_inst3_dst_reg           (idu_rtu_pst_dis_inst3_dst_reg          ),
  .idu_rtu_pst_dis_inst3_dstv_reg          (idu_rtu_pst_dis_inst3_dstv_reg         ),
  .idu_rtu_pst_dis_inst3_ereg              (idu_rtu_pst_dis_inst3_ereg             ),
  .idu_rtu_pst_dis_inst3_ereg_iid          (idu_rtu_pst_dis_inst3_ereg_iid         ),
  .idu_rtu_pst_dis_inst3_ereg_vld          (idu_rtu_pst_dis_inst3_ereg_vld         ),
  .idu_rtu_pst_dis_inst3_freg_vld          (idu_rtu_pst_dis_inst3_freg_vld         ),
  .idu_rtu_pst_dis_inst3_preg              (idu_rtu_pst_dis_inst3_preg             ),
  .idu_rtu_pst_dis_inst3_preg_iid          (idu_rtu_pst_dis_inst3_preg_iid         ),
  .idu_rtu_pst_dis_inst3_preg_vld          (idu_rtu_pst_dis_inst3_preg_vld         ),
  .idu_rtu_pst_dis_inst3_rel_ereg          (idu_rtu_pst_dis_inst3_rel_ereg         ),
  .idu_rtu_pst_dis_inst3_rel_preg          (idu_rtu_pst_dis_inst3_rel_preg         ),
  .idu_rtu_pst_dis_inst3_rel_vreg          (idu_rtu_pst_dis_inst3_rel_vreg         ),
  .idu_rtu_pst_dis_inst3_vreg              (idu_rtu_pst_dis_inst3_vreg             ),
  .idu_rtu_pst_dis_inst3_vreg_iid          (idu_rtu_pst_dis_inst3_vreg_iid         ),
  .idu_rtu_pst_dis_inst3_vreg_vld          (idu_rtu_pst_dis_inst3_vreg_vld         ),
  .idu_rtu_pst_freg_dealloc_mask           (idu_rtu_pst_freg_dealloc_mask          ),
  .idu_rtu_pst_preg_dealloc_mask           (idu_rtu_pst_preg_dealloc_mask          ),
  .idu_rtu_pst_vreg_dealloc_mask           (idu_rtu_pst_vreg_dealloc_mask          ),
  .idu_rtu_rob_create0_data                (idu_rtu_rob_create0_data               ),
  .idu_rtu_rob_create0_dp_en               (idu_rtu_rob_create0_dp_en              ),
  .idu_rtu_rob_create0_en                  (idu_rtu_rob_create0_en                 ),
  .idu_rtu_rob_create0_gateclk_en          (idu_rtu_rob_create0_gateclk_en         ),
  .idu_rtu_rob_create1_data                (idu_rtu_rob_create1_data               ),
  .idu_rtu_rob_create1_dp_en               (idu_rtu_rob_create1_dp_en              ),
  .idu_rtu_rob_create1_en                  (idu_rtu_rob_create1_en                 ),
  .idu_rtu_rob_create1_gateclk_en          (idu_rtu_rob_create1_gateclk_en         ),
  .idu_rtu_rob_create2_data                (idu_rtu_rob_create2_data               ),
  .idu_rtu_rob_create2_dp_en               (idu_rtu_rob_create2_dp_en              ),
  .idu_rtu_rob_create2_en                  (idu_rtu_rob_create2_en                 ),
  .idu_rtu_rob_create2_gateclk_en          (idu_rtu_rob_create2_gateclk_en         ),
  .idu_rtu_rob_create3_data                (idu_rtu_rob_create3_data               ),
  .idu_rtu_rob_create3_dp_en               (idu_rtu_rob_create3_dp_en              ),
  .idu_rtu_rob_create3_en                  (idu_rtu_rob_create3_en                 ),
  .idu_rtu_rob_create3_gateclk_en          (idu_rtu_rob_create3_gateclk_en         ),
  .idu_vfpu_is_vdiv_gateclk_issue          (idu_vfpu_is_vdiv_gateclk_issue         ),
  .idu_vfpu_is_vdiv_issue                  (idu_vfpu_is_vdiv_issue                 ),
  .idu_vfpu_rf_pipe6_dst_ereg              (idu_vfpu_rf_pipe6_dst_ereg             ),
  .idu_vfpu_rf_pipe6_dst_preg              (idu_vfpu_rf_pipe6_dst_preg             ),
  .idu_vfpu_rf_pipe6_dst_vld               (idu_vfpu_rf_pipe6_dst_vld              ),
  .idu_vfpu_rf_pipe6_dst_vreg              (idu_vfpu_rf_pipe6_dst_vreg             ),
  .idu_vfpu_rf_pipe6_dste_vld              (idu_vfpu_rf_pipe6_dste_vld             ),
  .idu_vfpu_rf_pipe6_dstv_vld              (idu_vfpu_rf_pipe6_dstv_vld             ),
  .idu_vfpu_rf_pipe6_eu_sel                (idu_vfpu_rf_pipe6_eu_sel               ),
  .idu_vfpu_rf_pipe6_func                  (idu_vfpu_rf_pipe6_func                 ),
  .idu_vfpu_rf_pipe6_gateclk_sel           (idu_vfpu_rf_pipe6_gateclk_sel          ),
  .idu_vfpu_rf_pipe6_iid                   (idu_vfpu_rf_pipe6_iid                  ),
  .idu_vfpu_rf_pipe6_imm0                  (idu_vfpu_rf_pipe6_imm0                 ),
  .idu_vfpu_rf_pipe6_inst_type             (idu_vfpu_rf_pipe6_inst_type            ),
  .idu_vfpu_rf_pipe6_mla_srcv2_vld         (idu_vfpu_rf_pipe6_mla_srcv2_vld        ),
  .idu_vfpu_rf_pipe6_mla_srcv2_vreg        (idu_vfpu_rf_pipe6_mla_srcv2_vreg       ),
  .idu_vfpu_rf_pipe6_ready_stage           (idu_vfpu_rf_pipe6_ready_stage          ),
  .idu_vfpu_rf_pipe6_sel                   (idu_vfpu_rf_pipe6_sel                  ),
  .idu_vfpu_rf_pipe6_srcv0_fr              (idu_vfpu_rf_pipe6_srcv0_fr             ),
  .idu_vfpu_rf_pipe6_srcv1_fr              (idu_vfpu_rf_pipe6_srcv1_fr             ),
  .idu_vfpu_rf_pipe6_srcv2_fr              (idu_vfpu_rf_pipe6_srcv2_fr             ),
  .idu_vfpu_rf_pipe6_vmla_type             (idu_vfpu_rf_pipe6_vmla_type            ),
  .idu_vfpu_rf_pipe7_dst_ereg              (idu_vfpu_rf_pipe7_dst_ereg             ),
  .idu_vfpu_rf_pipe7_dst_preg              (idu_vfpu_rf_pipe7_dst_preg             ),
  .idu_vfpu_rf_pipe7_dst_vld               (idu_vfpu_rf_pipe7_dst_vld              ),
  .idu_vfpu_rf_pipe7_dst_vreg              (idu_vfpu_rf_pipe7_dst_vreg             ),
  .idu_vfpu_rf_pipe7_dste_vld              (idu_vfpu_rf_pipe7_dste_vld             ),
  .idu_vfpu_rf_pipe7_dstv_vld              (idu_vfpu_rf_pipe7_dstv_vld             ),
  .idu_vfpu_rf_pipe7_eu_sel                (idu_vfpu_rf_pipe7_eu_sel               ),
  .idu_vfpu_rf_pipe7_func                  (idu_vfpu_rf_pipe7_func                 ),
  .idu_vfpu_rf_pipe7_gateclk_sel           (idu_vfpu_rf_pipe7_gateclk_sel          ),
  .idu_vfpu_rf_pipe7_iid                   (idu_vfpu_rf_pipe7_iid                  ),
  .idu_vfpu_rf_pipe7_imm0                  (idu_vfpu_rf_pipe7_imm0                 ),
  .idu_vfpu_rf_pipe7_inst_type             (idu_vfpu_rf_pipe7_inst_type            ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vld         (idu_vfpu_rf_pipe7_mla_srcv2_vld        ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vreg        (idu_vfpu_rf_pipe7_mla_srcv2_vreg       ),
  .idu_vfpu_rf_pipe7_ready_stage           (idu_vfpu_rf_pipe7_ready_stage          ),
  .idu_vfpu_rf_pipe7_sel                   (idu_vfpu_rf_pipe7_sel                  ),
  .idu_vfpu_rf_pipe7_srcv0_fr              (idu_vfpu_rf_pipe7_srcv0_fr             ),
  .idu_vfpu_rf_pipe7_srcv1_fr              (idu_vfpu_rf_pipe7_srcv1_fr             ),
  .idu_vfpu_rf_pipe7_srcv2_fr              (idu_vfpu_rf_pipe7_srcv2_fr             ),
  .idu_vfpu_rf_pipe7_vmla_type             (idu_vfpu_rf_pipe7_vmla_type            ),
  .ifu_idu_ib_inst0_data                   (ifu_idu_ib_inst0_data                  ),
  .ifu_idu_ib_inst0_vld                    (ifu_idu_ib_inst0_vld                   ),
  .ifu_idu_ib_inst1_data                   (ifu_idu_ib_inst1_data                  ),
  .ifu_idu_ib_inst1_vld                    (ifu_idu_ib_inst1_vld                   ),
  .ifu_idu_ib_inst2_data                   (ifu_idu_ib_inst2_data                  ),
  .ifu_idu_ib_inst2_vld                    (ifu_idu_ib_inst2_vld                   ),
  .ifu_idu_ib_pipedown_gateclk             (ifu_idu_ib_pipedown_gateclk            ),
  .ifu_xx_sync_reset                       (ifu_xx_sync_reset                      ),
  .iu_idu_div_busy                         (iu_idu_div_busy                        ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dup0                    (iu_idu_div_preg_dup0                   ),
  .iu_idu_div_preg_dup1                    (iu_idu_div_preg_dup1                   ),
  .iu_idu_div_preg_dup2                    (iu_idu_div_preg_dup2                   ),
  .iu_idu_div_preg_dup3                    (iu_idu_div_preg_dup3                   ),
  .iu_idu_div_preg_dup4                    (iu_idu_div_preg_dup4                   ),
  .iu_idu_div_wb_stall                     (iu_idu_div_wb_stall                    ),
  .iu_idu_ex1_pipe0_fwd_preg               (iu_idu_ex1_pipe0_fwd_preg              ),
  .iu_idu_ex1_pipe0_fwd_preg_data          (iu_idu_ex1_pipe0_fwd_preg_data         ),
  .iu_idu_ex1_pipe0_fwd_preg_vld           (iu_idu_ex1_pipe0_fwd_preg_vld          ),
  .iu_idu_ex1_pipe1_fwd_preg               (iu_idu_ex1_pipe1_fwd_preg              ),
  .iu_idu_ex1_pipe1_fwd_preg_data          (iu_idu_ex1_pipe1_fwd_preg_data         ),
  .iu_idu_ex1_pipe1_fwd_preg_vld           (iu_idu_ex1_pipe1_fwd_preg_vld          ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg                (iu_idu_ex2_pipe0_wb_preg               ),
  .iu_idu_ex2_pipe0_wb_preg_data           (iu_idu_ex2_pipe0_wb_preg_data          ),
  .iu_idu_ex2_pipe0_wb_preg_dup0           (iu_idu_ex2_pipe0_wb_preg_dup0          ),
  .iu_idu_ex2_pipe0_wb_preg_dup1           (iu_idu_ex2_pipe0_wb_preg_dup1          ),
  .iu_idu_ex2_pipe0_wb_preg_dup2           (iu_idu_ex2_pipe0_wb_preg_dup2          ),
  .iu_idu_ex2_pipe0_wb_preg_dup3           (iu_idu_ex2_pipe0_wb_preg_dup3          ),
  .iu_idu_ex2_pipe0_wb_preg_dup4           (iu_idu_ex2_pipe0_wb_preg_dup4          ),
  .iu_idu_ex2_pipe0_wb_preg_expand         (iu_idu_ex2_pipe0_wb_preg_expand        ),
  .iu_idu_ex2_pipe0_wb_preg_vld            (iu_idu_ex2_pipe0_wb_preg_vld           ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup0       (iu_idu_ex2_pipe0_wb_preg_vld_dup0      ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup1       (iu_idu_ex2_pipe0_wb_preg_vld_dup1      ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup2       (iu_idu_ex2_pipe0_wb_preg_vld_dup2      ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup3       (iu_idu_ex2_pipe0_wb_preg_vld_dup3      ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup4       (iu_idu_ex2_pipe0_wb_preg_vld_dup4      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup0     (iu_idu_ex2_pipe1_mult_inst_vld_dup0    ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup1     (iu_idu_ex2_pipe1_mult_inst_vld_dup1    ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup2     (iu_idu_ex2_pipe1_mult_inst_vld_dup2    ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup3     (iu_idu_ex2_pipe1_mult_inst_vld_dup3    ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dup4     (iu_idu_ex2_pipe1_mult_inst_vld_dup4    ),
  .iu_idu_ex2_pipe1_preg_dup0              (iu_idu_ex2_pipe1_preg_dup0             ),
  .iu_idu_ex2_pipe1_preg_dup1              (iu_idu_ex2_pipe1_preg_dup1             ),
  .iu_idu_ex2_pipe1_preg_dup2              (iu_idu_ex2_pipe1_preg_dup2             ),
  .iu_idu_ex2_pipe1_preg_dup3              (iu_idu_ex2_pipe1_preg_dup3             ),
  .iu_idu_ex2_pipe1_preg_dup4              (iu_idu_ex2_pipe1_preg_dup4             ),
  .iu_idu_ex2_pipe1_wb_preg                (iu_idu_ex2_pipe1_wb_preg               ),
  .iu_idu_ex2_pipe1_wb_preg_data           (iu_idu_ex2_pipe1_wb_preg_data          ),
  .iu_idu_ex2_pipe1_wb_preg_dup0           (iu_idu_ex2_pipe1_wb_preg_dup0          ),
  .iu_idu_ex2_pipe1_wb_preg_dup1           (iu_idu_ex2_pipe1_wb_preg_dup1          ),
  .iu_idu_ex2_pipe1_wb_preg_dup2           (iu_idu_ex2_pipe1_wb_preg_dup2          ),
  .iu_idu_ex2_pipe1_wb_preg_dup3           (iu_idu_ex2_pipe1_wb_preg_dup3          ),
  .iu_idu_ex2_pipe1_wb_preg_dup4           (iu_idu_ex2_pipe1_wb_preg_dup4          ),
  .iu_idu_ex2_pipe1_wb_preg_expand         (iu_idu_ex2_pipe1_wb_preg_expand        ),
  .iu_idu_ex2_pipe1_wb_preg_vld            (iu_idu_ex2_pipe1_wb_preg_vld           ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup0       (iu_idu_ex2_pipe1_wb_preg_vld_dup0      ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup1       (iu_idu_ex2_pipe1_wb_preg_vld_dup1      ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup2       (iu_idu_ex2_pipe1_wb_preg_vld_dup2      ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup3       (iu_idu_ex2_pipe1_wb_preg_vld_dup3      ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup4       (iu_idu_ex2_pipe1_wb_preg_vld_dup4      ),
  .iu_idu_mispred_stall                    (iu_idu_mispred_stall                   ),
  .iu_idu_pcfifo_dis_inst0_pid             (iu_idu_pcfifo_dis_inst0_pid            ),
  .iu_idu_pcfifo_dis_inst1_pid             (iu_idu_pcfifo_dis_inst1_pid            ),
  .iu_idu_pcfifo_dis_inst2_pid             (iu_idu_pcfifo_dis_inst2_pid            ),
  .iu_idu_pcfifo_dis_inst3_pid             (iu_idu_pcfifo_dis_inst3_pid            ),
  .iu_idu_pipe1_mla_src2_no_fwd            (iu_idu_pipe1_mla_src2_no_fwd           ),
  .iu_yy_xx_cancel                         (iu_yy_xx_cancel                        ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dup0              (lsu_idu_ag_pipe3_preg_dup0             ),
  .lsu_idu_ag_pipe3_preg_dup1              (lsu_idu_ag_pipe3_preg_dup1             ),
  .lsu_idu_ag_pipe3_preg_dup2              (lsu_idu_ag_pipe3_preg_dup2             ),
  .lsu_idu_ag_pipe3_preg_dup3              (lsu_idu_ag_pipe3_preg_dup3             ),
  .lsu_idu_ag_pipe3_preg_dup4              (lsu_idu_ag_pipe3_preg_dup4             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dup0              (lsu_idu_ag_pipe3_vreg_dup0             ),
  .lsu_idu_ag_pipe3_vreg_dup1              (lsu_idu_ag_pipe3_vreg_dup1             ),
  .lsu_idu_ag_pipe3_vreg_dup2              (lsu_idu_ag_pipe3_vreg_dup2             ),
  .lsu_idu_ag_pipe3_vreg_dup3              (lsu_idu_ag_pipe3_vreg_dup3             ),
  .lsu_idu_already_da                      (lsu_idu_already_da                     ),
  .lsu_idu_bkpta_data                      (lsu_idu_bkpta_data                     ),
  .lsu_idu_bkptb_data                      (lsu_idu_bkptb_data                     ),
  .lsu_idu_da_pipe3_fwd_preg               (lsu_idu_da_pipe3_fwd_preg              ),
  .lsu_idu_da_pipe3_fwd_preg_data          (lsu_idu_da_pipe3_fwd_preg_data         ),
  .lsu_idu_da_pipe3_fwd_preg_vld           (lsu_idu_da_pipe3_fwd_preg_vld          ),
  .lsu_idu_da_pipe3_fwd_vreg               (lsu_idu_da_pipe3_fwd_vreg              ),
  .lsu_idu_da_pipe3_fwd_vreg_fr_data       (lsu_idu_da_pipe3_fwd_vreg_fr_data      ),
  .lsu_idu_da_pipe3_fwd_vreg_vld           (lsu_idu_da_pipe3_fwd_vreg_vld          ),
  .lsu_idu_da_pipe3_fwd_vreg_vr0_data      (lsu_idu_da_pipe3_fwd_vreg_vr0_data     ),
  .lsu_idu_da_pipe3_fwd_vreg_vr1_data      (lsu_idu_da_pipe3_fwd_vreg_vr1_data     ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4),
  .lsu_idu_dc_pipe3_load_inst_vld_dup0     (lsu_idu_dc_pipe3_load_inst_vld_dup0    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup1     (lsu_idu_dc_pipe3_load_inst_vld_dup1    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup2     (lsu_idu_dc_pipe3_load_inst_vld_dup2    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup3     (lsu_idu_dc_pipe3_load_inst_vld_dup3    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup4     (lsu_idu_dc_pipe3_load_inst_vld_dup4    ),
  .lsu_idu_dc_pipe3_preg_dup0              (lsu_idu_dc_pipe3_preg_dup0             ),
  .lsu_idu_dc_pipe3_preg_dup1              (lsu_idu_dc_pipe3_preg_dup1             ),
  .lsu_idu_dc_pipe3_preg_dup2              (lsu_idu_dc_pipe3_preg_dup2             ),
  .lsu_idu_dc_pipe3_preg_dup3              (lsu_idu_dc_pipe3_preg_dup3             ),
  .lsu_idu_dc_pipe3_preg_dup4              (lsu_idu_dc_pipe3_preg_dup4             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup0    (lsu_idu_dc_pipe3_vload_inst_vld_dup0   ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup1    (lsu_idu_dc_pipe3_vload_inst_vld_dup1   ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup2    (lsu_idu_dc_pipe3_vload_inst_vld_dup2   ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup3    (lsu_idu_dc_pipe3_vload_inst_vld_dup3   ),
  .lsu_idu_dc_pipe3_vreg_dup0              (lsu_idu_dc_pipe3_vreg_dup0             ),
  .lsu_idu_dc_pipe3_vreg_dup1              (lsu_idu_dc_pipe3_vreg_dup1             ),
  .lsu_idu_dc_pipe3_vreg_dup2              (lsu_idu_dc_pipe3_vreg_dup2             ),
  .lsu_idu_dc_pipe3_vreg_dup3              (lsu_idu_dc_pipe3_vreg_dup3             ),
  .lsu_idu_dc_sdiq_entry                   (lsu_idu_dc_sdiq_entry                  ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_dc_staddr_vld                   (lsu_idu_dc_staddr_vld                  ),
  .lsu_idu_ex1_sdiq_entry                  (lsu_idu_ex1_sdiq_entry                 ),
  .lsu_idu_ex1_sdiq_frz_clr                (lsu_idu_ex1_sdiq_frz_clr               ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_lq_full                         (lsu_idu_lq_full                        ),
  .lsu_idu_lq_full_gateclk_en              (lsu_idu_lq_full_gateclk_en             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop0_vld                   (lsu_idu_lsiq_pop0_vld                  ),
  .lsu_idu_lsiq_pop1_vld                   (lsu_idu_lsiq_pop1_vld                  ),
  .lsu_idu_lsiq_pop_entry                  (lsu_idu_lsiq_pop_entry                 ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_full                         (lsu_idu_rb_full                        ),
  .lsu_idu_rb_full_gateclk_en              (lsu_idu_rb_full_gateclk_en             ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_secd                            (lsu_idu_secd                           ),
  .lsu_idu_spec_fail                       (lsu_idu_spec_fail                      ),
  .lsu_idu_sq_full                         (lsu_idu_sq_full                        ),
  .lsu_idu_sq_full_gateclk_en              (lsu_idu_sq_full_gateclk_en             ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_tlb_busy                        (lsu_idu_tlb_busy                       ),
  .lsu_idu_tlb_busy_gateclk_en             (lsu_idu_tlb_busy_gateclk_en            ),
  .lsu_idu_tlb_wakeup                      (lsu_idu_tlb_wakeup                     ),
  .lsu_idu_unalign_gateclk_en              (lsu_idu_unalign_gateclk_en             ),
  .lsu_idu_vmb_1_left_updt                 (lsu_idu_vmb_1_left_updt                ),
  .lsu_idu_vmb_create0_entry               (lsu_idu_vmb_create0_entry              ),
  .lsu_idu_vmb_create1_entry               (lsu_idu_vmb_create1_entry              ),
  .lsu_idu_vmb_empty                       (lsu_idu_vmb_empty                      ),
  .lsu_idu_vmb_full                        (lsu_idu_vmb_full                       ),
  .lsu_idu_vmb_full_updt                   (lsu_idu_vmb_full_updt                  ),
  .lsu_idu_vmb_full_updt_clk_en            (lsu_idu_vmb_full_updt_clk_en           ),
  .lsu_idu_wait_fence                      (lsu_idu_wait_fence                     ),
  .lsu_idu_wait_fence_gateclk_en           (lsu_idu_wait_fence_gateclk_en          ),
  .lsu_idu_wait_old                        (lsu_idu_wait_old                       ),
  .lsu_idu_wait_old_gateclk_en             (lsu_idu_wait_old_gateclk_en            ),
  .lsu_idu_wakeup                          (lsu_idu_wakeup                         ),
  .lsu_idu_wb_pipe3_fwd_vreg               (lsu_idu_wb_pipe3_fwd_vreg              ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld           (lsu_idu_wb_pipe3_fwd_vreg_vld          ),
  .lsu_idu_wb_pipe3_wb_preg                (lsu_idu_wb_pipe3_wb_preg               ),
  .lsu_idu_wb_pipe3_wb_preg_data           (lsu_idu_wb_pipe3_wb_preg_data          ),
  .lsu_idu_wb_pipe3_wb_preg_dup0           (lsu_idu_wb_pipe3_wb_preg_dup0          ),
  .lsu_idu_wb_pipe3_wb_preg_dup1           (lsu_idu_wb_pipe3_wb_preg_dup1          ),
  .lsu_idu_wb_pipe3_wb_preg_dup2           (lsu_idu_wb_pipe3_wb_preg_dup2          ),
  .lsu_idu_wb_pipe3_wb_preg_dup3           (lsu_idu_wb_pipe3_wb_preg_dup3          ),
  .lsu_idu_wb_pipe3_wb_preg_dup4           (lsu_idu_wb_pipe3_wb_preg_dup4          ),
  .lsu_idu_wb_pipe3_wb_preg_expand         (lsu_idu_wb_pipe3_wb_preg_expand        ),
  .lsu_idu_wb_pipe3_wb_preg_vld            (lsu_idu_wb_pipe3_wb_preg_vld           ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup0       (lsu_idu_wb_pipe3_wb_preg_vld_dup0      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup1       (lsu_idu_wb_pipe3_wb_preg_vld_dup1      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup2       (lsu_idu_wb_pipe3_wb_preg_vld_dup2      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup3       (lsu_idu_wb_pipe3_wb_preg_vld_dup3      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup4       (lsu_idu_wb_pipe3_wb_preg_vld_dup4      ),
  .lsu_idu_wb_pipe3_wb_vreg_dup0           (lsu_idu_wb_pipe3_wb_vreg_dup0          ),
  .lsu_idu_wb_pipe3_wb_vreg_dup1           (lsu_idu_wb_pipe3_wb_vreg_dup1          ),
  .lsu_idu_wb_pipe3_wb_vreg_dup2           (lsu_idu_wb_pipe3_wb_vreg_dup2          ),
  .lsu_idu_wb_pipe3_wb_vreg_dup3           (lsu_idu_wb_pipe3_wb_vreg_dup3          ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_data        (lsu_idu_wb_pipe3_wb_vreg_fr_data       ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_expand      (lsu_idu_wb_pipe3_wb_vreg_fr_expand     ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_vld         (lsu_idu_wb_pipe3_wb_vreg_fr_vld        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup0       (lsu_idu_wb_pipe3_wb_vreg_vld_dup0      ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup1       (lsu_idu_wb_pipe3_wb_vreg_vld_dup1      ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup2       (lsu_idu_wb_pipe3_wb_vreg_vld_dup2      ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup3       (lsu_idu_wb_pipe3_wb_vreg_vld_dup3      ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_data       (lsu_idu_wb_pipe3_wb_vreg_vr0_data      ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_expand     (lsu_idu_wb_pipe3_wb_vreg_vr0_expand    ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_vld        (lsu_idu_wb_pipe3_wb_vreg_vr0_vld       ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_data       (lsu_idu_wb_pipe3_wb_vreg_vr1_data      ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_expand     (lsu_idu_wb_pipe3_wb_vreg_vr1_expand    ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_vld        (lsu_idu_wb_pipe3_wb_vreg_vr1_vld       ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_alloc_ereg0                     (rtu_idu_alloc_ereg0                    ),
  .rtu_idu_alloc_ereg0_vld                 (rtu_idu_alloc_ereg0_vld                ),
  .rtu_idu_alloc_ereg1                     (rtu_idu_alloc_ereg1                    ),
  .rtu_idu_alloc_ereg1_vld                 (rtu_idu_alloc_ereg1_vld                ),
  .rtu_idu_alloc_ereg2                     (rtu_idu_alloc_ereg2                    ),
  .rtu_idu_alloc_ereg2_vld                 (rtu_idu_alloc_ereg2_vld                ),
  .rtu_idu_alloc_ereg3                     (rtu_idu_alloc_ereg3                    ),
  .rtu_idu_alloc_ereg3_vld                 (rtu_idu_alloc_ereg3_vld                ),
  .rtu_idu_alloc_freg0                     (rtu_idu_alloc_freg0                    ),
  .rtu_idu_alloc_freg0_vld                 (rtu_idu_alloc_freg0_vld                ),
  .rtu_idu_alloc_freg1                     (rtu_idu_alloc_freg1                    ),
  .rtu_idu_alloc_freg1_vld                 (rtu_idu_alloc_freg1_vld                ),
  .rtu_idu_alloc_freg2                     (rtu_idu_alloc_freg2                    ),
  .rtu_idu_alloc_freg2_vld                 (rtu_idu_alloc_freg2_vld                ),
  .rtu_idu_alloc_freg3                     (rtu_idu_alloc_freg3                    ),
  .rtu_idu_alloc_freg3_vld                 (rtu_idu_alloc_freg3_vld                ),
  .rtu_idu_alloc_preg0                     (rtu_idu_alloc_preg0                    ),
  .rtu_idu_alloc_preg0_vld                 (rtu_idu_alloc_preg0_vld                ),
  .rtu_idu_alloc_preg1                     (rtu_idu_alloc_preg1                    ),
  .rtu_idu_alloc_preg1_vld                 (rtu_idu_alloc_preg1_vld                ),
  .rtu_idu_alloc_preg2                     (rtu_idu_alloc_preg2                    ),
  .rtu_idu_alloc_preg2_vld                 (rtu_idu_alloc_preg2_vld                ),
  .rtu_idu_alloc_preg3                     (rtu_idu_alloc_preg3                    ),
  .rtu_idu_alloc_preg3_vld                 (rtu_idu_alloc_preg3_vld                ),
  .rtu_idu_alloc_vreg0                     (rtu_idu_alloc_vreg0                    ),
  .rtu_idu_alloc_vreg0_vld                 (rtu_idu_alloc_vreg0_vld                ),
  .rtu_idu_alloc_vreg1                     (rtu_idu_alloc_vreg1                    ),
  .rtu_idu_alloc_vreg1_vld                 (rtu_idu_alloc_vreg1_vld                ),
  .rtu_idu_alloc_vreg2                     (rtu_idu_alloc_vreg2                    ),
  .rtu_idu_alloc_vreg2_vld                 (rtu_idu_alloc_vreg2_vld                ),
  .rtu_idu_alloc_vreg3                     (rtu_idu_alloc_vreg3                    ),
  .rtu_idu_alloc_vreg3_vld                 (rtu_idu_alloc_vreg3_vld                ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .rtu_idu_flush_stall                     (rtu_idu_flush_stall                    ),
  .rtu_idu_pst_empty                       (rtu_idu_pst_empty                      ),
  .rtu_idu_pst_ereg_retired_released_wb    (rtu_idu_pst_ereg_retired_released_wb   ),
  .rtu_idu_retire0_inst_vld                (rtu_idu_retire0_inst_vld               ),
  .rtu_idu_retire_int_vld                  (rtu_idu_retire_int_vld                 ),
  .rtu_idu_rob_empty                       (rtu_idu_rob_empty                      ),
  .rtu_idu_rob_full                        (rtu_idu_rob_full                       ),
  .rtu_idu_rob_inst0_iid                   (rtu_idu_rob_inst0_iid                  ),
  .rtu_idu_rob_inst1_iid                   (rtu_idu_rob_inst1_iid                  ),
  .rtu_idu_rob_inst2_iid                   (rtu_idu_rob_inst2_iid                  ),
  .rtu_idu_rob_inst3_iid                   (rtu_idu_rob_inst3_iid                  ),
  .rtu_idu_rt_recover_ereg                 (rtu_idu_rt_recover_ereg                ),
  .rtu_idu_rt_recover_freg                 (rtu_idu_rt_recover_freg                ),
  .rtu_idu_rt_recover_preg                 (rtu_idu_rt_recover_preg                ),
  .rtu_idu_rt_recover_vreg                 (rtu_idu_rt_recover_vreg                ),
  .rtu_idu_srt_en                          (rtu_idu_srt_en                         ),
  .rtu_yy_xx_dbgon                         (rtu_yy_xx_dbgon                        ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_data_vld_dup0        (vfpu_idu_ex1_pipe6_data_vld_dup0       ),
  .vfpu_idu_ex1_pipe6_data_vld_dup1        (vfpu_idu_ex1_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex1_pipe6_data_vld_dup2        (vfpu_idu_ex1_pipe6_data_vld_dup2       ),
  .vfpu_idu_ex1_pipe6_data_vld_dup3        (vfpu_idu_ex1_pipe6_data_vld_dup3       ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup0   (vfpu_idu_ex1_pipe6_fmla_data_vld_dup0  ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup1   (vfpu_idu_ex1_pipe6_fmla_data_vld_dup1  ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup2   (vfpu_idu_ex1_pipe6_fmla_data_vld_dup2  ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup3   (vfpu_idu_ex1_pipe6_fmla_data_vld_dup3  ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0  ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2  ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3  ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4  ),
  .vfpu_idu_ex1_pipe6_preg_dup0            (vfpu_idu_ex1_pipe6_preg_dup0           ),
  .vfpu_idu_ex1_pipe6_preg_dup1            (vfpu_idu_ex1_pipe6_preg_dup1           ),
  .vfpu_idu_ex1_pipe6_preg_dup2            (vfpu_idu_ex1_pipe6_preg_dup2           ),
  .vfpu_idu_ex1_pipe6_preg_dup3            (vfpu_idu_ex1_pipe6_preg_dup3           ),
  .vfpu_idu_ex1_pipe6_preg_dup4            (vfpu_idu_ex1_pipe6_preg_dup4           ),
  .vfpu_idu_ex1_pipe6_vreg_dup0            (vfpu_idu_ex1_pipe6_vreg_dup0           ),
  .vfpu_idu_ex1_pipe6_vreg_dup1            (vfpu_idu_ex1_pipe6_vreg_dup1           ),
  .vfpu_idu_ex1_pipe6_vreg_dup2            (vfpu_idu_ex1_pipe6_vreg_dup2           ),
  .vfpu_idu_ex1_pipe6_vreg_dup3            (vfpu_idu_ex1_pipe6_vreg_dup3           ),
  .vfpu_idu_ex1_pipe7_data_vld_dup0        (vfpu_idu_ex1_pipe7_data_vld_dup0       ),
  .vfpu_idu_ex1_pipe7_data_vld_dup1        (vfpu_idu_ex1_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex1_pipe7_data_vld_dup2        (vfpu_idu_ex1_pipe7_data_vld_dup2       ),
  .vfpu_idu_ex1_pipe7_data_vld_dup3        (vfpu_idu_ex1_pipe7_data_vld_dup3       ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup0   (vfpu_idu_ex1_pipe7_fmla_data_vld_dup0  ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup1   (vfpu_idu_ex1_pipe7_fmla_data_vld_dup1  ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup2   (vfpu_idu_ex1_pipe7_fmla_data_vld_dup2  ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dup3   (vfpu_idu_ex1_pipe7_fmla_data_vld_dup3  ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0  ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2  ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3  ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4  ),
  .vfpu_idu_ex1_pipe7_preg_dup0            (vfpu_idu_ex1_pipe7_preg_dup0           ),
  .vfpu_idu_ex1_pipe7_preg_dup1            (vfpu_idu_ex1_pipe7_preg_dup1           ),
  .vfpu_idu_ex1_pipe7_preg_dup2            (vfpu_idu_ex1_pipe7_preg_dup2           ),
  .vfpu_idu_ex1_pipe7_preg_dup3            (vfpu_idu_ex1_pipe7_preg_dup3           ),
  .vfpu_idu_ex1_pipe7_preg_dup4            (vfpu_idu_ex1_pipe7_preg_dup4           ),
  .vfpu_idu_ex1_pipe7_vreg_dup0            (vfpu_idu_ex1_pipe7_vreg_dup0           ),
  .vfpu_idu_ex1_pipe7_vreg_dup1            (vfpu_idu_ex1_pipe7_vreg_dup1           ),
  .vfpu_idu_ex1_pipe7_vreg_dup2            (vfpu_idu_ex1_pipe7_vreg_dup2           ),
  .vfpu_idu_ex1_pipe7_vreg_dup3            (vfpu_idu_ex1_pipe7_vreg_dup3           ),
  .vfpu_idu_ex2_pipe6_data_vld_dup0        (vfpu_idu_ex2_pipe6_data_vld_dup0       ),
  .vfpu_idu_ex2_pipe6_data_vld_dup1        (vfpu_idu_ex2_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex2_pipe6_data_vld_dup2        (vfpu_idu_ex2_pipe6_data_vld_dup2       ),
  .vfpu_idu_ex2_pipe6_data_vld_dup3        (vfpu_idu_ex2_pipe6_data_vld_dup3       ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup0   (vfpu_idu_ex2_pipe6_fmla_data_vld_dup0  ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup1   (vfpu_idu_ex2_pipe6_fmla_data_vld_dup1  ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup2   (vfpu_idu_ex2_pipe6_fmla_data_vld_dup2  ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dup3   (vfpu_idu_ex2_pipe6_fmla_data_vld_dup3  ),
  .vfpu_idu_ex2_pipe6_vreg_dup0            (vfpu_idu_ex2_pipe6_vreg_dup0           ),
  .vfpu_idu_ex2_pipe6_vreg_dup1            (vfpu_idu_ex2_pipe6_vreg_dup1           ),
  .vfpu_idu_ex2_pipe6_vreg_dup2            (vfpu_idu_ex2_pipe6_vreg_dup2           ),
  .vfpu_idu_ex2_pipe6_vreg_dup3            (vfpu_idu_ex2_pipe6_vreg_dup3           ),
  .vfpu_idu_ex2_pipe7_data_vld_dup0        (vfpu_idu_ex2_pipe7_data_vld_dup0       ),
  .vfpu_idu_ex2_pipe7_data_vld_dup1        (vfpu_idu_ex2_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex2_pipe7_data_vld_dup2        (vfpu_idu_ex2_pipe7_data_vld_dup2       ),
  .vfpu_idu_ex2_pipe7_data_vld_dup3        (vfpu_idu_ex2_pipe7_data_vld_dup3       ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup0   (vfpu_idu_ex2_pipe7_fmla_data_vld_dup0  ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup1   (vfpu_idu_ex2_pipe7_fmla_data_vld_dup1  ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup2   (vfpu_idu_ex2_pipe7_fmla_data_vld_dup2  ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dup3   (vfpu_idu_ex2_pipe7_fmla_data_vld_dup3  ),
  .vfpu_idu_ex2_pipe7_vreg_dup0            (vfpu_idu_ex2_pipe7_vreg_dup0           ),
  .vfpu_idu_ex2_pipe7_vreg_dup1            (vfpu_idu_ex2_pipe7_vreg_dup1           ),
  .vfpu_idu_ex2_pipe7_vreg_dup2            (vfpu_idu_ex2_pipe7_vreg_dup2           ),
  .vfpu_idu_ex2_pipe7_vreg_dup3            (vfpu_idu_ex2_pipe7_vreg_dup3           ),
  .vfpu_idu_ex3_pipe6_data_vld_dup0        (vfpu_idu_ex3_pipe6_data_vld_dup0       ),
  .vfpu_idu_ex3_pipe6_data_vld_dup1        (vfpu_idu_ex3_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex3_pipe6_data_vld_dup2        (vfpu_idu_ex3_pipe6_data_vld_dup2       ),
  .vfpu_idu_ex3_pipe6_data_vld_dup3        (vfpu_idu_ex3_pipe6_data_vld_dup3       ),
  .vfpu_idu_ex3_pipe6_fwd_vreg             (vfpu_idu_ex3_pipe6_fwd_vreg            ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_fr_data     (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data    ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld         (vfpu_idu_ex3_pipe6_fwd_vreg_vld        ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data    (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data   ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data    (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data   ),
  .vfpu_idu_ex3_pipe6_vreg_dup0            (vfpu_idu_ex3_pipe6_vreg_dup0           ),
  .vfpu_idu_ex3_pipe6_vreg_dup1            (vfpu_idu_ex3_pipe6_vreg_dup1           ),
  .vfpu_idu_ex3_pipe6_vreg_dup2            (vfpu_idu_ex3_pipe6_vreg_dup2           ),
  .vfpu_idu_ex3_pipe6_vreg_dup3            (vfpu_idu_ex3_pipe6_vreg_dup3           ),
  .vfpu_idu_ex3_pipe7_data_vld_dup0        (vfpu_idu_ex3_pipe7_data_vld_dup0       ),
  .vfpu_idu_ex3_pipe7_data_vld_dup1        (vfpu_idu_ex3_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex3_pipe7_data_vld_dup2        (vfpu_idu_ex3_pipe7_data_vld_dup2       ),
  .vfpu_idu_ex3_pipe7_data_vld_dup3        (vfpu_idu_ex3_pipe7_data_vld_dup3       ),
  .vfpu_idu_ex3_pipe7_fwd_vreg             (vfpu_idu_ex3_pipe7_fwd_vreg            ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_fr_data     (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data    ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld         (vfpu_idu_ex3_pipe7_fwd_vreg_vld        ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data    (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data   ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data    (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data   ),
  .vfpu_idu_ex3_pipe7_vreg_dup0            (vfpu_idu_ex3_pipe7_vreg_dup0           ),
  .vfpu_idu_ex3_pipe7_vreg_dup1            (vfpu_idu_ex3_pipe7_vreg_dup1           ),
  .vfpu_idu_ex3_pipe7_vreg_dup2            (vfpu_idu_ex3_pipe7_vreg_dup2           ),
  .vfpu_idu_ex3_pipe7_vreg_dup3            (vfpu_idu_ex3_pipe7_vreg_dup3           ),
  .vfpu_idu_ex4_pipe6_fwd_vreg             (vfpu_idu_ex4_pipe6_fwd_vreg            ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_fr_data     (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data    ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld         (vfpu_idu_ex4_pipe6_fwd_vreg_vld        ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data    (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data   ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data    (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data   ),
  .vfpu_idu_ex4_pipe7_fwd_vreg             (vfpu_idu_ex4_pipe7_fwd_vreg            ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_fr_data     (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data    ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld         (vfpu_idu_ex4_pipe7_fwd_vreg_vld        ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data    (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data   ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data    (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data   ),
  .vfpu_idu_ex5_pipe6_fwd_vreg             (vfpu_idu_ex5_pipe6_fwd_vreg            ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld         (vfpu_idu_ex5_pipe6_fwd_vreg_vld        ),
  .vfpu_idu_ex5_pipe6_wb_ereg              (vfpu_idu_ex5_pipe6_wb_ereg             ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data         (vfpu_idu_ex5_pipe6_wb_ereg_data        ),
  .vfpu_idu_ex5_pipe6_wb_ereg_vld          (vfpu_idu_ex5_pipe6_wb_ereg_vld         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup0         (vfpu_idu_ex5_pipe6_wb_vreg_dup0        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup1         (vfpu_idu_ex5_pipe6_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup2         (vfpu_idu_ex5_pipe6_wb_vreg_dup2        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dup3         (vfpu_idu_ex5_pipe6_wb_vreg_dup3        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_fr_data      (vfpu_idu_ex5_pipe6_wb_vreg_fr_data     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_fr_expand    (vfpu_idu_ex5_pipe6_wb_vreg_fr_expand   ),
  .vfpu_idu_ex5_pipe6_wb_vreg_fr_vld       (vfpu_idu_ex5_pipe6_wb_vreg_fr_vld      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr0_data     (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand   (vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld      (vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld     ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr1_data     (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand   (vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld      (vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld     ),
  .vfpu_idu_ex5_pipe7_fwd_vreg             (vfpu_idu_ex5_pipe7_fwd_vreg            ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld         (vfpu_idu_ex5_pipe7_fwd_vreg_vld        ),
  .vfpu_idu_ex5_pipe7_wb_ereg              (vfpu_idu_ex5_pipe7_wb_ereg             ),
  .vfpu_idu_ex5_pipe7_wb_ereg_data         (vfpu_idu_ex5_pipe7_wb_ereg_data        ),
  .vfpu_idu_ex5_pipe7_wb_ereg_vld          (vfpu_idu_ex5_pipe7_wb_ereg_vld         ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup0         (vfpu_idu_ex5_pipe7_wb_vreg_dup0        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup1         (vfpu_idu_ex5_pipe7_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup2         (vfpu_idu_ex5_pipe7_wb_vreg_dup2        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dup3         (vfpu_idu_ex5_pipe7_wb_vreg_dup3        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_fr_data      (vfpu_idu_ex5_pipe7_wb_vreg_fr_data     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_fr_expand    (vfpu_idu_ex5_pipe7_wb_vreg_fr_expand   ),
  .vfpu_idu_ex5_pipe7_wb_vreg_fr_vld       (vfpu_idu_ex5_pipe7_wb_vreg_fr_vld      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr0_data     (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand   (vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld      (vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld     ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr1_data     (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand   (vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld      (vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld     ),
  .vfpu_idu_pipe6_vmla_srcv2_no_fwd        (vfpu_idu_pipe6_vmla_srcv2_no_fwd       ),
  .vfpu_idu_pipe7_vmla_srcv2_no_fwd        (vfpu_idu_pipe7_vmla_srcv2_no_fwd       ),
  .vfpu_idu_vdiv_busy                      (vfpu_idu_vdiv_busy                     ),
  .vfpu_idu_vdiv_wb_stall                  (vfpu_idu_vdiv_wb_stall                 )
);

// &Connect(.cpurst_b   (idu_rst_b)); @52

//==========================================================
//  Instance ct_iu_top sub module 
//==========================================================
// &Instance("ct_iu_top"); @57
ct_iu_top  x_ct_iu_top (
  .cp0_iu_div_entry_disable            (cp0_iu_div_entry_disable           ),
  .cp0_iu_div_entry_disable_clr        (cp0_iu_div_entry_disable_clr       ),
  .cp0_iu_ex3_abnormal                 (cp0_iu_ex3_abnormal                ),
  .cp0_iu_ex3_efpc                     (cp0_iu_ex3_efpc                    ),
  .cp0_iu_ex3_efpc_vld                 (cp0_iu_ex3_efpc_vld                ),
  .cp0_iu_ex3_expt_vec                 (cp0_iu_ex3_expt_vec                ),
  .cp0_iu_ex3_expt_vld                 (cp0_iu_ex3_expt_vld                ),
  .cp0_iu_ex3_flush                    (cp0_iu_ex3_flush                   ),
  .cp0_iu_ex3_iid                      (cp0_iu_ex3_iid                     ),
  .cp0_iu_ex3_inst_vld                 (cp0_iu_ex3_inst_vld                ),
  .cp0_iu_ex3_mtval                    (cp0_iu_ex3_mtval                   ),
  .cp0_iu_ex3_rslt_data                (cp0_iu_ex3_rslt_data               ),
  .cp0_iu_ex3_rslt_preg                (cp0_iu_ex3_rslt_preg               ),
  .cp0_iu_ex3_rslt_vld                 (cp0_iu_ex3_rslt_vld                ),
  .cp0_iu_icg_en                       (cp0_iu_icg_en                      ),
  .cp0_iu_vill                         (cp0_iu_vill                        ),
  .cp0_iu_vl                           (cp0_iu_vl                          ),
  .cp0_iu_vsetvli_pre_decd_disable     (cp0_iu_vsetvli_pre_decd_disable    ),
  .cp0_iu_vstart                       (cp0_iu_vstart                      ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cp0_yy_priv_mode                    (cp0_yy_priv_mode                   ),
  .cpurst_b                            (idu_rst_b                          ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .had_idu_wbbr_data                   (had_idu_wbbr_data                  ),
  .had_idu_wbbr_vld                    (had_idu_wbbr_vld                   ),
  .idu_iu_is_div_gateclk_issue         (idu_iu_is_div_gateclk_issue        ),
  .idu_iu_is_div_issue                 (idu_iu_is_div_issue                ),
  .idu_iu_is_pcfifo_inst_num           (idu_iu_is_pcfifo_inst_num          ),
  .idu_iu_is_pcfifo_inst_vld           (idu_iu_is_pcfifo_inst_vld          ),
  .idu_iu_rf_bju_gateclk_sel           (idu_iu_rf_bju_gateclk_sel          ),
  .idu_iu_rf_bju_sel                   (idu_iu_rf_bju_sel                  ),
  .idu_iu_rf_div_gateclk_sel           (idu_iu_rf_div_gateclk_sel          ),
  .idu_iu_rf_div_sel                   (idu_iu_rf_div_sel                  ),
  .idu_iu_rf_mult_gateclk_sel          (idu_iu_rf_mult_gateclk_sel         ),
  .idu_iu_rf_mult_sel                  (idu_iu_rf_mult_sel                 ),
  .idu_iu_rf_pipe0_alu_short           (idu_iu_rf_pipe0_alu_short          ),
  .idu_iu_rf_pipe0_cbus_gateclk_sel    (idu_iu_rf_pipe0_cbus_gateclk_sel   ),
  .idu_iu_rf_pipe0_dst_preg            (idu_iu_rf_pipe0_dst_preg           ),
  .idu_iu_rf_pipe0_dst_vld             (idu_iu_rf_pipe0_dst_vld            ),
  .idu_iu_rf_pipe0_dst_vreg            (idu_iu_rf_pipe0_dst_vreg           ),
  .idu_iu_rf_pipe0_dstv_vld            (idu_iu_rf_pipe0_dstv_vld           ),
  .idu_iu_rf_pipe0_expt_vec            (idu_iu_rf_pipe0_expt_vec           ),
  .idu_iu_rf_pipe0_expt_vld            (idu_iu_rf_pipe0_expt_vld           ),
  .idu_iu_rf_pipe0_func                (idu_iu_rf_pipe0_func               ),
  .idu_iu_rf_pipe0_gateclk_sel         (idu_iu_rf_pipe0_gateclk_sel        ),
  .idu_iu_rf_pipe0_high_hw_expt        (idu_iu_rf_pipe0_high_hw_expt       ),
  .idu_iu_rf_pipe0_iid                 (idu_iu_rf_pipe0_iid                ),
  .idu_iu_rf_pipe0_imm                 (idu_iu_rf_pipe0_imm                ),
  .idu_iu_rf_pipe0_opcode              (idu_iu_rf_pipe0_opcode             ),
  .idu_iu_rf_pipe0_pid                 (idu_iu_rf_pipe0_pid                ),
  .idu_iu_rf_pipe0_rslt_sel            (idu_iu_rf_pipe0_rslt_sel           ),
  .idu_iu_rf_pipe0_sel                 (idu_iu_rf_pipe0_sel                ),
  .idu_iu_rf_pipe0_special_imm         (idu_iu_rf_pipe0_special_imm        ),
  .idu_iu_rf_pipe0_src0                (idu_iu_rf_pipe0_src0               ),
  .idu_iu_rf_pipe0_src1                (idu_iu_rf_pipe0_src1               ),
  .idu_iu_rf_pipe0_src1_no_imm         (idu_iu_rf_pipe0_src1_no_imm        ),
  .idu_iu_rf_pipe0_src2                (idu_iu_rf_pipe0_src2               ),
  .idu_iu_rf_pipe0_vl                  (idu_iu_rf_pipe0_vl                 ),
  .idu_iu_rf_pipe0_vlmul               (idu_iu_rf_pipe0_vlmul              ),
  .idu_iu_rf_pipe0_vsew                (idu_iu_rf_pipe0_vsew               ),
  .idu_iu_rf_pipe1_alu_short           (idu_iu_rf_pipe1_alu_short          ),
  .idu_iu_rf_pipe1_cbus_gateclk_sel    (idu_iu_rf_pipe1_cbus_gateclk_sel   ),
  .idu_iu_rf_pipe1_dst_preg            (idu_iu_rf_pipe1_dst_preg           ),
  .idu_iu_rf_pipe1_dst_vld             (idu_iu_rf_pipe1_dst_vld            ),
  .idu_iu_rf_pipe1_dst_vreg            (idu_iu_rf_pipe1_dst_vreg           ),
  .idu_iu_rf_pipe1_dstv_vld            (idu_iu_rf_pipe1_dstv_vld           ),
  .idu_iu_rf_pipe1_func                (idu_iu_rf_pipe1_func               ),
  .idu_iu_rf_pipe1_gateclk_sel         (idu_iu_rf_pipe1_gateclk_sel        ),
  .idu_iu_rf_pipe1_iid                 (idu_iu_rf_pipe1_iid                ),
  .idu_iu_rf_pipe1_imm                 (idu_iu_rf_pipe1_imm                ),
  .idu_iu_rf_pipe1_mla_src2_preg       (idu_iu_rf_pipe1_mla_src2_preg      ),
  .idu_iu_rf_pipe1_mla_src2_vld        (idu_iu_rf_pipe1_mla_src2_vld       ),
  .idu_iu_rf_pipe1_mult_func           (idu_iu_rf_pipe1_mult_func          ),
  .idu_iu_rf_pipe1_rslt_sel            (idu_iu_rf_pipe1_rslt_sel           ),
  .idu_iu_rf_pipe1_sel                 (idu_iu_rf_pipe1_sel                ),
  .idu_iu_rf_pipe1_src0                (idu_iu_rf_pipe1_src0               ),
  .idu_iu_rf_pipe1_src1                (idu_iu_rf_pipe1_src1               ),
  .idu_iu_rf_pipe1_src1_no_imm         (idu_iu_rf_pipe1_src1_no_imm        ),
  .idu_iu_rf_pipe1_src2                (idu_iu_rf_pipe1_src2               ),
  .idu_iu_rf_pipe1_vl                  (idu_iu_rf_pipe1_vl                 ),
  .idu_iu_rf_pipe1_vlmul               (idu_iu_rf_pipe1_vlmul              ),
  .idu_iu_rf_pipe1_vsew                (idu_iu_rf_pipe1_vsew               ),
  .idu_iu_rf_pipe2_func                (idu_iu_rf_pipe2_func               ),
  .idu_iu_rf_pipe2_iid                 (idu_iu_rf_pipe2_iid                ),
  .idu_iu_rf_pipe2_length              (idu_iu_rf_pipe2_length             ),
  .idu_iu_rf_pipe2_offset              (idu_iu_rf_pipe2_offset             ),
  .idu_iu_rf_pipe2_pcall               (idu_iu_rf_pipe2_pcall              ),
  .idu_iu_rf_pipe2_pid                 (idu_iu_rf_pipe2_pid                ),
  .idu_iu_rf_pipe2_rts                 (idu_iu_rf_pipe2_rts                ),
  .idu_iu_rf_pipe2_src0                (idu_iu_rf_pipe2_src0               ),
  .idu_iu_rf_pipe2_src1                (idu_iu_rf_pipe2_src1               ),
  .idu_iu_rf_pipe2_vl                  (idu_iu_rf_pipe2_vl                 ),
  .idu_iu_rf_pipe2_vlmul               (idu_iu_rf_pipe2_vlmul              ),
  .idu_iu_rf_pipe2_vsew                (idu_iu_rf_pipe2_vsew               ),
  .idu_iu_rf_special_gateclk_sel       (idu_iu_rf_special_gateclk_sel      ),
  .idu_iu_rf_special_sel               (idu_iu_rf_special_sel              ),
  .ifu_iu_pcfifo_create0_bht_pred      (ifu_iu_pcfifo_create0_bht_pred     ),
  .ifu_iu_pcfifo_create0_chk_idx       (ifu_iu_pcfifo_create0_chk_idx      ),
  .ifu_iu_pcfifo_create0_cur_pc        (ifu_iu_pcfifo_create0_cur_pc       ),
  .ifu_iu_pcfifo_create0_dst_vld       (ifu_iu_pcfifo_create0_dst_vld      ),
  .ifu_iu_pcfifo_create0_en            (ifu_iu_pcfifo_create0_en           ),
  .ifu_iu_pcfifo_create0_gateclk_en    (ifu_iu_pcfifo_create0_gateclk_en   ),
  .ifu_iu_pcfifo_create0_jal           (ifu_iu_pcfifo_create0_jal          ),
  .ifu_iu_pcfifo_create0_jalr          (ifu_iu_pcfifo_create0_jalr         ),
  .ifu_iu_pcfifo_create0_jmp_mispred   (ifu_iu_pcfifo_create0_jmp_mispred  ),
  .ifu_iu_pcfifo_create0_tar_pc        (ifu_iu_pcfifo_create0_tar_pc       ),
  .ifu_iu_pcfifo_create1_bht_pred      (ifu_iu_pcfifo_create1_bht_pred     ),
  .ifu_iu_pcfifo_create1_chk_idx       (ifu_iu_pcfifo_create1_chk_idx      ),
  .ifu_iu_pcfifo_create1_cur_pc        (ifu_iu_pcfifo_create1_cur_pc       ),
  .ifu_iu_pcfifo_create1_dst_vld       (ifu_iu_pcfifo_create1_dst_vld      ),
  .ifu_iu_pcfifo_create1_en            (ifu_iu_pcfifo_create1_en           ),
  .ifu_iu_pcfifo_create1_gateclk_en    (ifu_iu_pcfifo_create1_gateclk_en   ),
  .ifu_iu_pcfifo_create1_jal           (ifu_iu_pcfifo_create1_jal          ),
  .ifu_iu_pcfifo_create1_jalr          (ifu_iu_pcfifo_create1_jalr         ),
  .ifu_iu_pcfifo_create1_jmp_mispred   (ifu_iu_pcfifo_create1_jmp_mispred  ),
  .ifu_iu_pcfifo_create1_tar_pc        (ifu_iu_pcfifo_create1_tar_pc       ),
  .iu_had_debug_info                   (iu_had_debug_info                  ),
  .iu_idu_div_busy                     (iu_idu_div_busy                    ),
  .iu_idu_div_inst_vld                 (iu_idu_div_inst_vld                ),
  .iu_idu_div_preg_dup0                (iu_idu_div_preg_dup0               ),
  .iu_idu_div_preg_dup1                (iu_idu_div_preg_dup1               ),
  .iu_idu_div_preg_dup2                (iu_idu_div_preg_dup2               ),
  .iu_idu_div_preg_dup3                (iu_idu_div_preg_dup3               ),
  .iu_idu_div_preg_dup4                (iu_idu_div_preg_dup4               ),
  .iu_idu_div_wb_stall                 (iu_idu_div_wb_stall                ),
  .iu_idu_ex1_pipe0_fwd_preg           (iu_idu_ex1_pipe0_fwd_preg          ),
  .iu_idu_ex1_pipe0_fwd_preg_data      (iu_idu_ex1_pipe0_fwd_preg_data     ),
  .iu_idu_ex1_pipe0_fwd_preg_vld       (iu_idu_ex1_pipe0_fwd_preg_vld      ),
  .iu_idu_ex1_pipe1_fwd_preg           (iu_idu_ex1_pipe1_fwd_preg          ),
  .iu_idu_ex1_pipe1_fwd_preg_data      (iu_idu_ex1_pipe1_fwd_preg_data     ),
  .iu_idu_ex1_pipe1_fwd_preg_vld       (iu_idu_ex1_pipe1_fwd_preg_vld      ),
  .iu_idu_ex1_pipe1_mult_stall         (iu_idu_ex1_pipe1_mult_stall        ),
  .iu_idu_ex2_pipe0_wb_preg            (iu_idu_ex2_pipe0_wb_preg           ),
  .iu_idu_ex2_pipe0_wb_preg_data       (iu_idu_ex2_pipe0_wb_preg_data      ),
  .iu_idu_ex2_pipe0_wb_preg_dup0       (iu_idu_ex2_pipe0_wb_preg_dup0      ),
  .iu_idu_ex2_pipe0_wb_preg_dup1       (iu_idu_ex2_pipe0_wb_preg_dup1      ),
  .iu_idu_ex2_pipe0_wb_preg_dup2       (iu_idu_ex2_pipe0_wb_preg_dup2      ),
  .iu_idu_ex2_pipe0_wb_preg_dup3       (iu_idu_ex2_pipe0_wb_preg_dup3      ),
  .iu_idu_ex2_pipe0_wb_preg_dup4       (iu_idu_ex2_pipe0_wb_preg_dup4      ),
  .iu_idu_ex2_pipe0_wb_preg_expand     (iu_idu_ex2_pipe0_wb_preg_expand    ),
  .iu_idu_ex2_pipe0_wb_preg_vld        (iu_idu_ex2_pipe0_wb_preg_vld       ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup0   (iu_idu_ex2_pipe0_wb_preg_vld_dup0  ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup1   (iu_idu_ex2_pipe0_wb_preg_vld_dup1  ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup2   (iu_idu_ex2_pipe0_wb_preg_vld_dup2  ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup3   (iu_idu_ex2_pipe0_wb_preg_vld_dup3  ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dup4   (iu_idu_ex2_pipe0_wb_preg_vld_dup4  ),
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
  .iu_idu_ex2_pipe1_wb_preg            (iu_idu_ex2_pipe1_wb_preg           ),
  .iu_idu_ex2_pipe1_wb_preg_data       (iu_idu_ex2_pipe1_wb_preg_data      ),
  .iu_idu_ex2_pipe1_wb_preg_dup0       (iu_idu_ex2_pipe1_wb_preg_dup0      ),
  .iu_idu_ex2_pipe1_wb_preg_dup1       (iu_idu_ex2_pipe1_wb_preg_dup1      ),
  .iu_idu_ex2_pipe1_wb_preg_dup2       (iu_idu_ex2_pipe1_wb_preg_dup2      ),
  .iu_idu_ex2_pipe1_wb_preg_dup3       (iu_idu_ex2_pipe1_wb_preg_dup3      ),
  .iu_idu_ex2_pipe1_wb_preg_dup4       (iu_idu_ex2_pipe1_wb_preg_dup4      ),
  .iu_idu_ex2_pipe1_wb_preg_expand     (iu_idu_ex2_pipe1_wb_preg_expand    ),
  .iu_idu_ex2_pipe1_wb_preg_vld        (iu_idu_ex2_pipe1_wb_preg_vld       ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup0   (iu_idu_ex2_pipe1_wb_preg_vld_dup0  ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup1   (iu_idu_ex2_pipe1_wb_preg_vld_dup1  ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup2   (iu_idu_ex2_pipe1_wb_preg_vld_dup2  ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup3   (iu_idu_ex2_pipe1_wb_preg_vld_dup3  ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dup4   (iu_idu_ex2_pipe1_wb_preg_vld_dup4  ),
  .iu_idu_mispred_stall                (iu_idu_mispred_stall               ),
  .iu_idu_pcfifo_dis_inst0_pid         (iu_idu_pcfifo_dis_inst0_pid        ),
  .iu_idu_pcfifo_dis_inst1_pid         (iu_idu_pcfifo_dis_inst1_pid        ),
  .iu_idu_pcfifo_dis_inst2_pid         (iu_idu_pcfifo_dis_inst2_pid        ),
  .iu_idu_pcfifo_dis_inst3_pid         (iu_idu_pcfifo_dis_inst3_pid        ),
  .iu_idu_pipe1_mla_src2_no_fwd        (iu_idu_pipe1_mla_src2_no_fwd       ),
  .iu_ifu_bht_check_vld                (iu_ifu_bht_check_vld               ),
  .iu_ifu_bht_condbr_taken             (iu_ifu_bht_condbr_taken            ),
  .iu_ifu_bht_pred                     (iu_ifu_bht_pred                    ),
  .iu_ifu_chgflw_pc                    (iu_ifu_chgflw_pc                   ),
  .iu_ifu_chgflw_vl                    (iu_ifu_chgflw_vl                   ),
  .iu_ifu_chgflw_vld                   (iu_ifu_chgflw_vld                  ),
  .iu_ifu_chgflw_vlmul                 (iu_ifu_chgflw_vlmul                ),
  .iu_ifu_chgflw_vsew                  (iu_ifu_chgflw_vsew                 ),
  .iu_ifu_chk_idx                      (iu_ifu_chk_idx                     ),
  .iu_ifu_cur_pc                       (iu_ifu_cur_pc                      ),
  .iu_ifu_mispred_stall                (iu_ifu_mispred_stall               ),
  .iu_ifu_pcfifo_full                  (iu_ifu_pcfifo_full                 ),
  .iu_rtu_ex2_pipe0_wb_preg_expand     (iu_rtu_ex2_pipe0_wb_preg_expand    ),
  .iu_rtu_ex2_pipe0_wb_preg_vld        (iu_rtu_ex2_pipe0_wb_preg_vld       ),
  .iu_rtu_ex2_pipe1_wb_preg_expand     (iu_rtu_ex2_pipe1_wb_preg_expand    ),
  .iu_rtu_ex2_pipe1_wb_preg_vld        (iu_rtu_ex2_pipe1_wb_preg_vld       ),
  .iu_rtu_pcfifo_pop0_data             (iu_rtu_pcfifo_pop0_data            ),
  .iu_rtu_pcfifo_pop1_data             (iu_rtu_pcfifo_pop1_data            ),
  .iu_rtu_pcfifo_pop2_data             (iu_rtu_pcfifo_pop2_data            ),
  .iu_rtu_pipe0_abnormal               (iu_rtu_pipe0_abnormal              ),
  .iu_rtu_pipe0_bkpt                   (iu_rtu_pipe0_bkpt                  ),
  .iu_rtu_pipe0_cmplt                  (iu_rtu_pipe0_cmplt                 ),
  .iu_rtu_pipe0_efpc                   (iu_rtu_pipe0_efpc                  ),
  .iu_rtu_pipe0_efpc_vld               (iu_rtu_pipe0_efpc_vld              ),
  .iu_rtu_pipe0_expt_vec               (iu_rtu_pipe0_expt_vec              ),
  .iu_rtu_pipe0_expt_vld               (iu_rtu_pipe0_expt_vld              ),
  .iu_rtu_pipe0_flush                  (iu_rtu_pipe0_flush                 ),
  .iu_rtu_pipe0_high_hw_expt           (iu_rtu_pipe0_high_hw_expt          ),
  .iu_rtu_pipe0_iid                    (iu_rtu_pipe0_iid                   ),
  .iu_rtu_pipe0_immu_expt              (iu_rtu_pipe0_immu_expt             ),
  .iu_rtu_pipe0_mtval                  (iu_rtu_pipe0_mtval                 ),
  .iu_rtu_pipe0_vsetvl                 (iu_rtu_pipe0_vsetvl                ),
  .iu_rtu_pipe0_vstart                 (iu_rtu_pipe0_vstart                ),
  .iu_rtu_pipe0_vstart_vld             (iu_rtu_pipe0_vstart_vld            ),
  .iu_rtu_pipe1_cmplt                  (iu_rtu_pipe1_cmplt                 ),
  .iu_rtu_pipe1_iid                    (iu_rtu_pipe1_iid                   ),
  .iu_rtu_pipe2_abnormal               (iu_rtu_pipe2_abnormal              ),
  .iu_rtu_pipe2_bht_mispred            (iu_rtu_pipe2_bht_mispred           ),
  .iu_rtu_pipe2_cmplt                  (iu_rtu_pipe2_cmplt                 ),
  .iu_rtu_pipe2_iid                    (iu_rtu_pipe2_iid                   ),
  .iu_rtu_pipe2_jmp_mispred            (iu_rtu_pipe2_jmp_mispred           ),
  .iu_vfpu_ex1_pipe0_mtvr_inst         (iu_vfpu_ex1_pipe0_mtvr_inst        ),
  .iu_vfpu_ex1_pipe0_mtvr_vl           (iu_vfpu_ex1_pipe0_mtvr_vl          ),
  .iu_vfpu_ex1_pipe0_mtvr_vld          (iu_vfpu_ex1_pipe0_mtvr_vld         ),
  .iu_vfpu_ex1_pipe0_mtvr_vlmul        (iu_vfpu_ex1_pipe0_mtvr_vlmul       ),
  .iu_vfpu_ex1_pipe0_mtvr_vreg         (iu_vfpu_ex1_pipe0_mtvr_vreg        ),
  .iu_vfpu_ex1_pipe0_mtvr_vsew         (iu_vfpu_ex1_pipe0_mtvr_vsew        ),
  .iu_vfpu_ex1_pipe1_mtvr_inst         (iu_vfpu_ex1_pipe1_mtvr_inst        ),
  .iu_vfpu_ex1_pipe1_mtvr_vl           (iu_vfpu_ex1_pipe1_mtvr_vl          ),
  .iu_vfpu_ex1_pipe1_mtvr_vld          (iu_vfpu_ex1_pipe1_mtvr_vld         ),
  .iu_vfpu_ex1_pipe1_mtvr_vlmul        (iu_vfpu_ex1_pipe1_mtvr_vlmul       ),
  .iu_vfpu_ex1_pipe1_mtvr_vreg         (iu_vfpu_ex1_pipe1_mtvr_vreg        ),
  .iu_vfpu_ex1_pipe1_mtvr_vsew         (iu_vfpu_ex1_pipe1_mtvr_vsew        ),
  .iu_vfpu_ex2_pipe0_mtvr_src0         (iu_vfpu_ex2_pipe0_mtvr_src0        ),
  .iu_vfpu_ex2_pipe0_mtvr_vld          (iu_vfpu_ex2_pipe0_mtvr_vld         ),
  .iu_vfpu_ex2_pipe1_mtvr_src0         (iu_vfpu_ex2_pipe1_mtvr_src0        ),
  .iu_vfpu_ex2_pipe1_mtvr_vld          (iu_vfpu_ex2_pipe1_mtvr_vld         ),
  .iu_yy_xx_cancel                     (iu_yy_xx_cancel                    ),
  .mmu_xx_mmu_en                       (mmu_xx_mmu_en                      ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .rtu_iu_flush_chgflw_mask            (rtu_iu_flush_chgflw_mask           ),
  .rtu_iu_flush_fe                     (rtu_iu_flush_fe                    ),
  .rtu_iu_rob_read0_pcfifo_vld         (rtu_iu_rob_read0_pcfifo_vld        ),
  .rtu_iu_rob_read1_pcfifo_vld         (rtu_iu_rob_read1_pcfifo_vld        ),
  .rtu_iu_rob_read2_pcfifo_vld         (rtu_iu_rob_read2_pcfifo_vld        ),
  .rtu_iu_rob_read_pcfifo_gateclk_vld  (rtu_iu_rob_read_pcfifo_gateclk_vld ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vfpu_iu_ex2_pipe6_mfvr_data         (vfpu_iu_ex2_pipe6_mfvr_data        ),
  .vfpu_iu_ex2_pipe6_mfvr_data_vld     (vfpu_iu_ex2_pipe6_mfvr_data_vld    ),
  .vfpu_iu_ex2_pipe6_mfvr_preg         (vfpu_iu_ex2_pipe6_mfvr_preg        ),
  .vfpu_iu_ex2_pipe7_mfvr_data         (vfpu_iu_ex2_pipe7_mfvr_data        ),
  .vfpu_iu_ex2_pipe7_mfvr_data_vld     (vfpu_iu_ex2_pipe7_mfvr_data_vld    ),
  .vfpu_iu_ex2_pipe7_mfvr_preg         (vfpu_iu_ex2_pipe7_mfvr_preg        )
);

// &Connect(.cpurst_b   (idu_rst_b)); @58

//==========================================================
//  Instance ct_vfpu_top sub module 
//==========================================================
// &Instance("ct_vfpu_top_dummy"); @64
// &Connect(.cpurst_b   (fpu_rst_b)); @65
// &Instance("ct_vfpu_top"); @67
ct_vfpu_top  x_ct_vfpu_top (
  .cp0_vfpu_fcsr                         (cp0_vfpu_fcsr                        ),
  .cp0_vfpu_fxcr                         (cp0_vfpu_fxcr                        ),
  .cp0_vfpu_icg_en                       (cp0_vfpu_icg_en                      ),
  .cp0_vfpu_vl                           (cp0_vfpu_vl                          ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (fpu_rst_b                            ),
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
  .idu_vfpu_rf_pipe6_sel                 (idu_vfpu_rf_pipe6_sel                ),
  .idu_vfpu_rf_pipe6_srcv0_fr            (idu_vfpu_rf_pipe6_srcv0_fr           ),
  .idu_vfpu_rf_pipe6_srcv1_fr            (idu_vfpu_rf_pipe6_srcv1_fr           ),
  .idu_vfpu_rf_pipe6_srcv2_fr            (idu_vfpu_rf_pipe6_srcv2_fr           ),
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
  .idu_vfpu_rf_pipe7_iid                 (idu_vfpu_rf_pipe7_iid                ),
  .idu_vfpu_rf_pipe7_imm0                (idu_vfpu_rf_pipe7_imm0               ),
  .idu_vfpu_rf_pipe7_inst_type           (idu_vfpu_rf_pipe7_inst_type          ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vld       (idu_vfpu_rf_pipe7_mla_srcv2_vld      ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vreg      (idu_vfpu_rf_pipe7_mla_srcv2_vreg     ),
  .idu_vfpu_rf_pipe7_ready_stage         (idu_vfpu_rf_pipe7_ready_stage        ),
  .idu_vfpu_rf_pipe7_sel                 (idu_vfpu_rf_pipe7_sel                ),
  .idu_vfpu_rf_pipe7_srcv0_fr            (idu_vfpu_rf_pipe7_srcv0_fr           ),
  .idu_vfpu_rf_pipe7_srcv1_fr            (idu_vfpu_rf_pipe7_srcv1_fr           ),
  .idu_vfpu_rf_pipe7_srcv2_fr            (idu_vfpu_rf_pipe7_srcv2_fr           ),
  .idu_vfpu_rf_pipe7_vmla_type           (idu_vfpu_rf_pipe7_vmla_type          ),
  .iu_vfpu_ex1_pipe0_mtvr_inst           (iu_vfpu_ex1_pipe0_mtvr_inst          ),
  .iu_vfpu_ex1_pipe0_mtvr_vl             (iu_vfpu_ex1_pipe0_mtvr_vl            ),
  .iu_vfpu_ex1_pipe0_mtvr_vld            (iu_vfpu_ex1_pipe0_mtvr_vld           ),
  .iu_vfpu_ex1_pipe0_mtvr_vlmul          (iu_vfpu_ex1_pipe0_mtvr_vlmul         ),
  .iu_vfpu_ex1_pipe0_mtvr_vreg           (iu_vfpu_ex1_pipe0_mtvr_vreg          ),
  .iu_vfpu_ex1_pipe0_mtvr_vsew           (iu_vfpu_ex1_pipe0_mtvr_vsew          ),
  .iu_vfpu_ex1_pipe1_mtvr_inst           (iu_vfpu_ex1_pipe1_mtvr_inst          ),
  .iu_vfpu_ex1_pipe1_mtvr_vl             (iu_vfpu_ex1_pipe1_mtvr_vl            ),
  .iu_vfpu_ex1_pipe1_mtvr_vld            (iu_vfpu_ex1_pipe1_mtvr_vld           ),
  .iu_vfpu_ex1_pipe1_mtvr_vlmul          (iu_vfpu_ex1_pipe1_mtvr_vlmul         ),
  .iu_vfpu_ex1_pipe1_mtvr_vreg           (iu_vfpu_ex1_pipe1_mtvr_vreg          ),
  .iu_vfpu_ex1_pipe1_mtvr_vsew           (iu_vfpu_ex1_pipe1_mtvr_vsew          ),
  .iu_vfpu_ex2_pipe0_mtvr_src0           (iu_vfpu_ex2_pipe0_mtvr_src0          ),
  .iu_vfpu_ex2_pipe0_mtvr_vld            (iu_vfpu_ex2_pipe0_mtvr_vld           ),
  .iu_vfpu_ex2_pipe1_mtvr_src0           (iu_vfpu_ex2_pipe1_mtvr_src0          ),
  .iu_vfpu_ex2_pipe1_mtvr_vld            (iu_vfpu_ex2_pipe1_mtvr_vld           ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_yy_xx_flush                       (rtu_yy_xx_flush                      ),
  .vfdsu_ifu_debug_ex2_wait              (vfdsu_ifu_debug_ex2_wait             ),
  .vfdsu_ifu_debug_idle                  (vfdsu_ifu_debug_idle                 ),
  .vfdsu_ifu_debug_pipe_busy             (vfdsu_ifu_debug_pipe_busy            ),
  .vfpu_idu_ex1_pipe6_data_vld_dup0      (vfpu_idu_ex1_pipe6_data_vld_dup0     ),
  .vfpu_idu_ex1_pipe6_data_vld_dup1      (vfpu_idu_ex1_pipe6_data_vld_dup1     ),
  .vfpu_idu_ex1_pipe6_data_vld_dup2      (vfpu_idu_ex1_pipe6_data_vld_dup2     ),
  .vfpu_idu_ex1_pipe6_data_vld_dup3      (vfpu_idu_ex1_pipe6_data_vld_dup3     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup0 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup0),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup1 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup1),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup2 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup2),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dup3 (vfpu_idu_ex1_pipe6_fmla_data_vld_dup3),
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
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .vfpu_idu_vdiv_wb_stall                (vfpu_idu_vdiv_wb_stall               ),
  .vfpu_iu_ex2_pipe6_mfvr_data           (vfpu_iu_ex2_pipe6_mfvr_data          ),
  .vfpu_iu_ex2_pipe6_mfvr_data_vld       (vfpu_iu_ex2_pipe6_mfvr_data_vld      ),
  .vfpu_iu_ex2_pipe6_mfvr_preg           (vfpu_iu_ex2_pipe6_mfvr_preg          ),
  .vfpu_iu_ex2_pipe7_mfvr_data           (vfpu_iu_ex2_pipe7_mfvr_data          ),
  .vfpu_iu_ex2_pipe7_mfvr_data_vld       (vfpu_iu_ex2_pipe7_mfvr_data_vld      ),
  .vfpu_iu_ex2_pipe7_mfvr_preg           (vfpu_iu_ex2_pipe7_mfvr_preg          ),
  .vfpu_rtu_ex5_pipe6_ereg_wb_vld        (vfpu_rtu_ex5_pipe6_ereg_wb_vld       ),
  .vfpu_rtu_ex5_pipe6_wb_ereg            (vfpu_rtu_ex5_pipe6_wb_ereg           ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_expand     (vfpu_rtu_ex5_pipe6_wb_vreg_expand    ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld     (vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld    ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld     (vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld    ),
  .vfpu_rtu_ex5_pipe7_ereg_wb_vld        (vfpu_rtu_ex5_pipe7_ereg_wb_vld       ),
  .vfpu_rtu_ex5_pipe7_wb_ereg            (vfpu_rtu_ex5_pipe7_wb_ereg           ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_expand     (vfpu_rtu_ex5_pipe7_wb_vreg_expand    ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld     (vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld    ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld     (vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld    ),
  .vfpu_rtu_pipe6_cmplt                  (vfpu_rtu_pipe6_cmplt                 ),
  .vfpu_rtu_pipe6_iid                    (vfpu_rtu_pipe6_iid                   ),
  .vfpu_rtu_pipe7_cmplt                  (vfpu_rtu_pipe7_cmplt                 ),
  .vfpu_rtu_pipe7_iid                    (vfpu_rtu_pipe7_iid                   )
);

// &Connect(.cpurst_b   (fpu_rst_b)); @68
// //&Connect(.top_forever_cpuclk (forever_cpuclk)); @70

//==========================================================
//  Instance ct_lsu_top sub module 
//==========================================================
// &Instance("ct_lsu_top"); @75
ct_lsu_top  x_ct_lsu_top (
  .biu_lsu_ac_addr                         (biu_lsu_ac_addr                        ),
  .biu_lsu_ac_prot                         (biu_lsu_ac_prot                        ),
  .biu_lsu_ac_req                          (biu_lsu_ac_req                         ),
  .biu_lsu_ac_snoop                        (biu_lsu_ac_snoop                       ),
  .biu_lsu_ar_ready                        (biu_lsu_ar_ready                       ),
  .biu_lsu_aw_vb_grnt                      (biu_lsu_aw_vb_grnt                     ),
  .biu_lsu_aw_wmb_grnt                     (biu_lsu_aw_wmb_grnt                    ),
  .biu_lsu_b_id                            (biu_lsu_b_id                           ),
  .biu_lsu_b_resp                          (biu_lsu_b_resp                         ),
  .biu_lsu_b_vld                           (biu_lsu_b_vld                          ),
  .biu_lsu_cd_ready                        (biu_lsu_cd_ready                       ),
  .biu_lsu_cr_ready                        (biu_lsu_cr_ready                       ),
  .biu_lsu_r_data                          (biu_lsu_r_data                         ),
  .biu_lsu_r_id                            (biu_lsu_r_id                           ),
  .biu_lsu_r_last                          (biu_lsu_r_last                         ),
  .biu_lsu_r_resp                          (biu_lsu_r_resp                         ),
  .biu_lsu_r_vld                           (biu_lsu_r_vld                          ),
  .biu_lsu_w_vb_grnt                       (biu_lsu_w_vb_grnt                      ),
  .biu_lsu_w_wmb_grnt                      (biu_lsu_w_wmb_grnt                     ),
  .cp0_lsu_amr                             (cp0_lsu_amr                            ),
  .cp0_lsu_amr2                            (cp0_lsu_amr2                           ),
  .cp0_lsu_cb_aclr_dis                     (cp0_lsu_cb_aclr_dis                    ),
  .cp0_lsu_corr_dis                        (cp0_lsu_corr_dis                       ),
  .cp0_lsu_ctc_flush_dis                   (cp0_lsu_ctc_flush_dis                  ),
  .cp0_lsu_da_fwd_dis                      (cp0_lsu_da_fwd_dis                     ),
  .cp0_lsu_dcache_clr                      (cp0_lsu_dcache_clr                     ),
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_dcache_inv                      (cp0_lsu_dcache_inv                     ),
  .cp0_lsu_dcache_pref_dist                (cp0_lsu_dcache_pref_dist               ),
  .cp0_lsu_dcache_pref_en                  (cp0_lsu_dcache_pref_en                 ),
  .cp0_lsu_dcache_read_index               (cp0_lsu_dcache_read_index              ),
  .cp0_lsu_dcache_read_ld_tag              (cp0_lsu_dcache_read_ld_tag             ),
  .cp0_lsu_dcache_read_req                 (cp0_lsu_dcache_read_req                ),
  .cp0_lsu_dcache_read_st_tag              (cp0_lsu_dcache_read_st_tag             ),
  .cp0_lsu_dcache_read_way                 (cp0_lsu_dcache_read_way                ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_lsu_l2_pref_dist                    (cp0_lsu_l2_pref_dist                   ),
  .cp0_lsu_l2_pref_en                      (cp0_lsu_l2_pref_en                     ),
  .cp0_lsu_l2_st_pref_en                   (cp0_lsu_l2_st_pref_en                  ),
  .cp0_lsu_mm                              (cp0_lsu_mm                             ),
  .cp0_lsu_no_op_req                       (cp0_lsu_no_op_req                      ),
  .cp0_lsu_nsfe                            (cp0_lsu_nsfe                           ),
  .cp0_lsu_pfu_mmu_dis                     (cp0_lsu_pfu_mmu_dis                    ),
  .cp0_lsu_timeout_cnt                     (cp0_lsu_timeout_cnt                    ),
  .cp0_lsu_tvm                             (cp0_lsu_tvm                            ),
  .cp0_lsu_ucme                            (cp0_lsu_ucme                           ),
  .cp0_lsu_vstart                          (cp0_lsu_vstart                         ),
  .cp0_lsu_wa                              (cp0_lsu_wa                             ),
  .cp0_lsu_wr_burst_dis                    (cp0_lsu_wr_burst_dis                   ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cp0_yy_dcache_pref_en                   (cp0_yy_dcache_pref_en                  ),
  .cp0_yy_priv_mode                        (cp0_yy_priv_mode                       ),
  .cp0_yy_virtual_mode                     (cp0_yy_virtual_mode                    ),
  .cpurst_b                                (lsu_rst_b                              ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .had_lsu_bus_trace_en                    (had_lsu_bus_trace_en                   ),
  .had_lsu_dbg_en                          (had_lsu_dbg_en                         ),
  .had_yy_xx_bkpta_base                    (had_yy_xx_bkpta_base                   ),
  .had_yy_xx_bkpta_mask                    (had_yy_xx_bkpta_mask                   ),
  .had_yy_xx_bkpta_rc                      (had_yy_xx_bkpta_rc                     ),
  .had_yy_xx_bkptb_base                    (had_yy_xx_bkptb_base                   ),
  .had_yy_xx_bkptb_mask                    (had_yy_xx_bkptb_mask                   ),
  .had_yy_xx_bkptb_rc                      (had_yy_xx_bkptb_rc                     ),
  .hpcp_lsu_cnt_en                         (hpcp_lsu_cnt_en                        ),
  .idu_lsu_rf_pipe3_already_da             (idu_lsu_rf_pipe3_already_da            ),
  .idu_lsu_rf_pipe3_atomic                 (idu_lsu_rf_pipe3_atomic                ),
  .idu_lsu_rf_pipe3_bkpta_data             (idu_lsu_rf_pipe3_bkpta_data            ),
  .idu_lsu_rf_pipe3_bkptb_data             (idu_lsu_rf_pipe3_bkptb_data            ),
  .idu_lsu_rf_pipe3_gateclk_sel            (idu_lsu_rf_pipe3_gateclk_sel           ),
  .idu_lsu_rf_pipe3_iid                    (idu_lsu_rf_pipe3_iid                   ),
  .idu_lsu_rf_pipe3_inst_fls               (idu_lsu_rf_pipe3_inst_fls              ),
  .idu_lsu_rf_pipe3_inst_ldr               (idu_lsu_rf_pipe3_inst_ldr              ),
  .idu_lsu_rf_pipe3_inst_size              (idu_lsu_rf_pipe3_inst_size             ),
  .idu_lsu_rf_pipe3_inst_type              (idu_lsu_rf_pipe3_inst_type             ),
  .idu_lsu_rf_pipe3_lch_entry              (idu_lsu_rf_pipe3_lch_entry             ),
  .idu_lsu_rf_pipe3_lsfifo                 (idu_lsu_rf_pipe3_lsfifo                ),
  .idu_lsu_rf_pipe3_no_spec                (idu_lsu_rf_pipe3_no_spec               ),
  .idu_lsu_rf_pipe3_no_spec_exist          (idu_lsu_rf_pipe3_no_spec_exist         ),
  .idu_lsu_rf_pipe3_off_0_extend           (idu_lsu_rf_pipe3_off_0_extend          ),
  .idu_lsu_rf_pipe3_offset                 (idu_lsu_rf_pipe3_offset                ),
  .idu_lsu_rf_pipe3_offset_plus            (idu_lsu_rf_pipe3_offset_plus           ),
  .idu_lsu_rf_pipe3_oldest                 (idu_lsu_rf_pipe3_oldest                ),
  .idu_lsu_rf_pipe3_pc                     (idu_lsu_rf_pipe3_pc                    ),
  .idu_lsu_rf_pipe3_preg                   (idu_lsu_rf_pipe3_preg                  ),
  .idu_lsu_rf_pipe3_sel                    (idu_lsu_rf_pipe3_sel                   ),
  .idu_lsu_rf_pipe3_shift                  (idu_lsu_rf_pipe3_shift                 ),
  .idu_lsu_rf_pipe3_sign_extend            (idu_lsu_rf_pipe3_sign_extend           ),
  .idu_lsu_rf_pipe3_spec_fail              (idu_lsu_rf_pipe3_spec_fail             ),
  .idu_lsu_rf_pipe3_split                  (idu_lsu_rf_pipe3_split                 ),
  .idu_lsu_rf_pipe3_src0                   (idu_lsu_rf_pipe3_src0                  ),
  .idu_lsu_rf_pipe3_src1                   (idu_lsu_rf_pipe3_src1                  ),
  .idu_lsu_rf_pipe3_unalign_2nd            (idu_lsu_rf_pipe3_unalign_2nd           ),
  .idu_lsu_rf_pipe3_vreg                   (idu_lsu_rf_pipe3_vreg                  ),
  .idu_lsu_rf_pipe4_already_da             (idu_lsu_rf_pipe4_already_da            ),
  .idu_lsu_rf_pipe4_atomic                 (idu_lsu_rf_pipe4_atomic                ),
  .idu_lsu_rf_pipe4_bkpta_data             (idu_lsu_rf_pipe4_bkpta_data            ),
  .idu_lsu_rf_pipe4_bkptb_data             (idu_lsu_rf_pipe4_bkptb_data            ),
  .idu_lsu_rf_pipe4_fence_mode             (idu_lsu_rf_pipe4_fence_mode            ),
  .idu_lsu_rf_pipe4_gateclk_sel            (idu_lsu_rf_pipe4_gateclk_sel           ),
  .idu_lsu_rf_pipe4_icc                    (idu_lsu_rf_pipe4_icc                   ),
  .idu_lsu_rf_pipe4_iid                    (idu_lsu_rf_pipe4_iid                   ),
  .idu_lsu_rf_pipe4_inst_code              (idu_lsu_rf_pipe4_inst_code             ),
  .idu_lsu_rf_pipe4_inst_fls               (idu_lsu_rf_pipe4_inst_fls              ),
  .idu_lsu_rf_pipe4_inst_flush             (idu_lsu_rf_pipe4_inst_flush            ),
  .idu_lsu_rf_pipe4_inst_mode              (idu_lsu_rf_pipe4_inst_mode             ),
  .idu_lsu_rf_pipe4_inst_share             (idu_lsu_rf_pipe4_inst_share            ),
  .idu_lsu_rf_pipe4_inst_size              (idu_lsu_rf_pipe4_inst_size             ),
  .idu_lsu_rf_pipe4_inst_str               (idu_lsu_rf_pipe4_inst_str              ),
  .idu_lsu_rf_pipe4_inst_type              (idu_lsu_rf_pipe4_inst_type             ),
  .idu_lsu_rf_pipe4_lch_entry              (idu_lsu_rf_pipe4_lch_entry             ),
  .idu_lsu_rf_pipe4_lsfifo                 (idu_lsu_rf_pipe4_lsfifo                ),
  .idu_lsu_rf_pipe4_mmu_req                (idu_lsu_rf_pipe4_mmu_req               ),
  .idu_lsu_rf_pipe4_no_spec                (idu_lsu_rf_pipe4_no_spec               ),
  .idu_lsu_rf_pipe4_off_0_extend           (idu_lsu_rf_pipe4_off_0_extend          ),
  .idu_lsu_rf_pipe4_offset                 (idu_lsu_rf_pipe4_offset                ),
  .idu_lsu_rf_pipe4_offset_plus            (idu_lsu_rf_pipe4_offset_plus           ),
  .idu_lsu_rf_pipe4_oldest                 (idu_lsu_rf_pipe4_oldest                ),
  .idu_lsu_rf_pipe4_pc                     (idu_lsu_rf_pipe4_pc                    ),
  .idu_lsu_rf_pipe4_sdiq_entry             (idu_lsu_rf_pipe4_sdiq_entry            ),
  .idu_lsu_rf_pipe4_sel                    (idu_lsu_rf_pipe4_sel                   ),
  .idu_lsu_rf_pipe4_shift                  (idu_lsu_rf_pipe4_shift                 ),
  .idu_lsu_rf_pipe4_spec_fail              (idu_lsu_rf_pipe4_spec_fail             ),
  .idu_lsu_rf_pipe4_split                  (idu_lsu_rf_pipe4_split                 ),
  .idu_lsu_rf_pipe4_src0                   (idu_lsu_rf_pipe4_src0                  ),
  .idu_lsu_rf_pipe4_src1                   (idu_lsu_rf_pipe4_src1                  ),
  .idu_lsu_rf_pipe4_st                     (idu_lsu_rf_pipe4_st                    ),
  .idu_lsu_rf_pipe4_staddr                 (idu_lsu_rf_pipe4_staddr                ),
  .idu_lsu_rf_pipe4_sync_fence             (idu_lsu_rf_pipe4_sync_fence            ),
  .idu_lsu_rf_pipe4_unalign_2nd            (idu_lsu_rf_pipe4_unalign_2nd           ),
  .idu_lsu_rf_pipe5_gateclk_sel            (idu_lsu_rf_pipe5_gateclk_sel           ),
  .idu_lsu_rf_pipe5_sdiq_entry             (idu_lsu_rf_pipe5_sdiq_entry            ),
  .idu_lsu_rf_pipe5_sel                    (idu_lsu_rf_pipe5_sel                   ),
  .idu_lsu_rf_pipe5_src0                   (idu_lsu_rf_pipe5_src0                  ),
  .idu_lsu_rf_pipe5_srcv0_fr               (idu_lsu_rf_pipe5_srcv0_fr              ),
  .idu_lsu_rf_pipe5_srcv0_fr_vld           (idu_lsu_rf_pipe5_srcv0_fr_vld          ),
  .idu_lsu_rf_pipe5_srcv0_vld              (idu_lsu_rf_pipe5_srcv0_vld             ),
  .idu_lsu_rf_pipe5_srcv0_vr0              (idu_lsu_rf_pipe5_srcv0_vr0             ),
  .idu_lsu_rf_pipe5_srcv0_vr1              (idu_lsu_rf_pipe5_srcv0_vr1             ),
  .idu_lsu_rf_pipe5_stdata1_vld            (idu_lsu_rf_pipe5_stdata1_vld           ),
  .idu_lsu_rf_pipe5_unalign                (idu_lsu_rf_pipe5_unalign               ),
  .idu_lsu_vmb_create0_dp_en               (idu_lsu_vmb_create0_dp_en              ),
  .idu_lsu_vmb_create0_dst_ready           (idu_lsu_vmb_create0_dst_ready          ),
  .idu_lsu_vmb_create0_en                  (idu_lsu_vmb_create0_en                 ),
  .idu_lsu_vmb_create0_gateclk_en          (idu_lsu_vmb_create0_gateclk_en         ),
  .idu_lsu_vmb_create0_sdiq_entry          (idu_lsu_vmb_create0_sdiq_entry         ),
  .idu_lsu_vmb_create0_split_num           (idu_lsu_vmb_create0_split_num          ),
  .idu_lsu_vmb_create0_unit_stride         (idu_lsu_vmb_create0_unit_stride        ),
  .idu_lsu_vmb_create0_vamo                (idu_lsu_vmb_create0_vamo               ),
  .idu_lsu_vmb_create0_vl                  (idu_lsu_vmb_create0_vl                 ),
  .idu_lsu_vmb_create0_vreg                (idu_lsu_vmb_create0_vreg               ),
  .idu_lsu_vmb_create0_vsew                (idu_lsu_vmb_create0_vsew               ),
  .idu_lsu_vmb_create1_dp_en               (idu_lsu_vmb_create1_dp_en              ),
  .idu_lsu_vmb_create1_dst_ready           (idu_lsu_vmb_create1_dst_ready          ),
  .idu_lsu_vmb_create1_en                  (idu_lsu_vmb_create1_en                 ),
  .idu_lsu_vmb_create1_gateclk_en          (idu_lsu_vmb_create1_gateclk_en         ),
  .idu_lsu_vmb_create1_sdiq_entry          (idu_lsu_vmb_create1_sdiq_entry         ),
  .idu_lsu_vmb_create1_split_num           (idu_lsu_vmb_create1_split_num          ),
  .idu_lsu_vmb_create1_unit_stride         (idu_lsu_vmb_create1_unit_stride        ),
  .idu_lsu_vmb_create1_vamo                (idu_lsu_vmb_create1_vamo               ),
  .idu_lsu_vmb_create1_vl                  (idu_lsu_vmb_create1_vl                 ),
  .idu_lsu_vmb_create1_vreg                (idu_lsu_vmb_create1_vreg               ),
  .idu_lsu_vmb_create1_vsew                (idu_lsu_vmb_create1_vsew               ),
  .ifu_lsu_icache_inv_done                 (ifu_lsu_icache_inv_done                ),
  .lsu_biu_ac_empty                        (lsu_biu_ac_empty                       ),
  .lsu_biu_ac_ready                        (lsu_biu_ac_ready                       ),
  .lsu_biu_ar_addr                         (lsu_biu_ar_addr                        ),
  .lsu_biu_ar_bar                          (lsu_biu_ar_bar                         ),
  .lsu_biu_ar_burst                        (lsu_biu_ar_burst                       ),
  .lsu_biu_ar_cache                        (lsu_biu_ar_cache                       ),
  .lsu_biu_ar_domain                       (lsu_biu_ar_domain                      ),
  .lsu_biu_ar_dp_req                       (lsu_biu_ar_dp_req                      ),
  .lsu_biu_ar_id                           (lsu_biu_ar_id                          ),
  .lsu_biu_ar_len                          (lsu_biu_ar_len                         ),
  .lsu_biu_ar_lock                         (lsu_biu_ar_lock                        ),
  .lsu_biu_ar_prot                         (lsu_biu_ar_prot                        ),
  .lsu_biu_ar_req                          (lsu_biu_ar_req                         ),
  .lsu_biu_ar_req_gate                     (lsu_biu_ar_req_gate                    ),
  .lsu_biu_ar_size                         (lsu_biu_ar_size                        ),
  .lsu_biu_ar_snoop                        (lsu_biu_ar_snoop                       ),
  .lsu_biu_ar_user                         (lsu_biu_ar_user                        ),
  .lsu_biu_aw_req_gate                     (lsu_biu_aw_req_gate                    ),
  .lsu_biu_aw_st_addr                      (lsu_biu_aw_st_addr                     ),
  .lsu_biu_aw_st_bar                       (lsu_biu_aw_st_bar                      ),
  .lsu_biu_aw_st_burst                     (lsu_biu_aw_st_burst                    ),
  .lsu_biu_aw_st_cache                     (lsu_biu_aw_st_cache                    ),
  .lsu_biu_aw_st_domain                    (lsu_biu_aw_st_domain                   ),
  .lsu_biu_aw_st_dp_req                    (lsu_biu_aw_st_dp_req                   ),
  .lsu_biu_aw_st_id                        (lsu_biu_aw_st_id                       ),
  .lsu_biu_aw_st_len                       (lsu_biu_aw_st_len                      ),
  .lsu_biu_aw_st_lock                      (lsu_biu_aw_st_lock                     ),
  .lsu_biu_aw_st_prot                      (lsu_biu_aw_st_prot                     ),
  .lsu_biu_aw_st_req                       (lsu_biu_aw_st_req                      ),
  .lsu_biu_aw_st_size                      (lsu_biu_aw_st_size                     ),
  .lsu_biu_aw_st_snoop                     (lsu_biu_aw_st_snoop                    ),
  .lsu_biu_aw_st_unique                    (lsu_biu_aw_st_unique                   ),
  .lsu_biu_aw_st_user                      (lsu_biu_aw_st_user                     ),
  .lsu_biu_aw_vict_addr                    (lsu_biu_aw_vict_addr                   ),
  .lsu_biu_aw_vict_bar                     (lsu_biu_aw_vict_bar                    ),
  .lsu_biu_aw_vict_burst                   (lsu_biu_aw_vict_burst                  ),
  .lsu_biu_aw_vict_cache                   (lsu_biu_aw_vict_cache                  ),
  .lsu_biu_aw_vict_domain                  (lsu_biu_aw_vict_domain                 ),
  .lsu_biu_aw_vict_dp_req                  (lsu_biu_aw_vict_dp_req                 ),
  .lsu_biu_aw_vict_id                      (lsu_biu_aw_vict_id                     ),
  .lsu_biu_aw_vict_len                     (lsu_biu_aw_vict_len                    ),
  .lsu_biu_aw_vict_lock                    (lsu_biu_aw_vict_lock                   ),
  .lsu_biu_aw_vict_prot                    (lsu_biu_aw_vict_prot                   ),
  .lsu_biu_aw_vict_req                     (lsu_biu_aw_vict_req                    ),
  .lsu_biu_aw_vict_size                    (lsu_biu_aw_vict_size                   ),
  .lsu_biu_aw_vict_snoop                   (lsu_biu_aw_vict_snoop                  ),
  .lsu_biu_aw_vict_unique                  (lsu_biu_aw_vict_unique                 ),
  .lsu_biu_aw_vict_user                    (lsu_biu_aw_vict_user                   ),
  .lsu_biu_cd_data                         (lsu_biu_cd_data                        ),
  .lsu_biu_cd_last                         (lsu_biu_cd_last                        ),
  .lsu_biu_cd_valid                        (lsu_biu_cd_valid                       ),
  .lsu_biu_cr_resp                         (lsu_biu_cr_resp                        ),
  .lsu_biu_cr_valid                        (lsu_biu_cr_valid                       ),
  .lsu_biu_r_linefill_ready                (lsu_biu_r_linefill_ready               ),
  .lsu_biu_w_st_data                       (lsu_biu_w_st_data                      ),
  .lsu_biu_w_st_last                       (lsu_biu_w_st_last                      ),
  .lsu_biu_w_st_strb                       (lsu_biu_w_st_strb                      ),
  .lsu_biu_w_st_vld                        (lsu_biu_w_st_vld                       ),
  .lsu_biu_w_st_wns                        (lsu_biu_w_st_wns                       ),
  .lsu_biu_w_vict_data                     (lsu_biu_w_vict_data                    ),
  .lsu_biu_w_vict_last                     (lsu_biu_w_vict_last                    ),
  .lsu_biu_w_vict_strb                     (lsu_biu_w_vict_strb                    ),
  .lsu_biu_w_vict_vld                      (lsu_biu_w_vict_vld                     ),
  .lsu_biu_w_vict_wns                      (lsu_biu_w_vict_wns                     ),
  .lsu_cp0_dcache_done                     (lsu_cp0_dcache_done                    ),
  .lsu_cp0_dcache_read_data                (lsu_cp0_dcache_read_data               ),
  .lsu_cp0_dcache_read_data_vld            (lsu_cp0_dcache_read_data_vld           ),
  .lsu_had_debug_info                      (lsu_had_debug_info                     ),
  .lsu_had_ld_addr                         (lsu_had_ld_addr                        ),
  .lsu_had_ld_data                         (lsu_had_ld_data                        ),
  .lsu_had_ld_iid                          (lsu_had_ld_iid                         ),
  .lsu_had_ld_req                          (lsu_had_ld_req                         ),
  .lsu_had_ld_type                         (lsu_had_ld_type                        ),
  .lsu_had_no_op                           (lsu_had_no_op                          ),
  .lsu_had_st_addr                         (lsu_had_st_addr                        ),
  .lsu_had_st_data                         (lsu_had_st_data                        ),
  .lsu_had_st_iid                          (lsu_had_st_iid                         ),
  .lsu_had_st_req                          (lsu_had_st_req                         ),
  .lsu_had_st_type                         (lsu_had_st_type                        ),
  .lsu_hpcp_cache_read_access              (lsu_hpcp_cache_read_access             ),
  .lsu_hpcp_cache_read_miss                (lsu_hpcp_cache_read_miss               ),
  .lsu_hpcp_cache_write_access             (lsu_hpcp_cache_write_access            ),
  .lsu_hpcp_cache_write_miss               (lsu_hpcp_cache_write_miss              ),
  .lsu_hpcp_fence_stall                    (lsu_hpcp_fence_stall                   ),
  .lsu_hpcp_ld_stall_cross_4k              (lsu_hpcp_ld_stall_cross_4k             ),
  .lsu_hpcp_ld_stall_other                 (lsu_hpcp_ld_stall_other                ),
  .lsu_hpcp_replay_data_discard            (lsu_hpcp_replay_data_discard           ),
  .lsu_hpcp_replay_discard_sq              (lsu_hpcp_replay_discard_sq             ),
  .lsu_hpcp_st_stall_cross_4k              (lsu_hpcp_st_stall_cross_4k             ),
  .lsu_hpcp_st_stall_other                 (lsu_hpcp_st_stall_other                ),
  .lsu_hpcp_unalign_inst                   (lsu_hpcp_unalign_inst                  ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dup0              (lsu_idu_ag_pipe3_preg_dup0             ),
  .lsu_idu_ag_pipe3_preg_dup1              (lsu_idu_ag_pipe3_preg_dup1             ),
  .lsu_idu_ag_pipe3_preg_dup2              (lsu_idu_ag_pipe3_preg_dup2             ),
  .lsu_idu_ag_pipe3_preg_dup3              (lsu_idu_ag_pipe3_preg_dup3             ),
  .lsu_idu_ag_pipe3_preg_dup4              (lsu_idu_ag_pipe3_preg_dup4             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dup0              (lsu_idu_ag_pipe3_vreg_dup0             ),
  .lsu_idu_ag_pipe3_vreg_dup1              (lsu_idu_ag_pipe3_vreg_dup1             ),
  .lsu_idu_ag_pipe3_vreg_dup2              (lsu_idu_ag_pipe3_vreg_dup2             ),
  .lsu_idu_ag_pipe3_vreg_dup3              (lsu_idu_ag_pipe3_vreg_dup3             ),
  .lsu_idu_already_da                      (lsu_idu_already_da                     ),
  .lsu_idu_bkpta_data                      (lsu_idu_bkpta_data                     ),
  .lsu_idu_bkptb_data                      (lsu_idu_bkptb_data                     ),
  .lsu_idu_da_pipe3_fwd_preg               (lsu_idu_da_pipe3_fwd_preg              ),
  .lsu_idu_da_pipe3_fwd_preg_data          (lsu_idu_da_pipe3_fwd_preg_data         ),
  .lsu_idu_da_pipe3_fwd_preg_vld           (lsu_idu_da_pipe3_fwd_preg_vld          ),
  .lsu_idu_da_pipe3_fwd_vreg               (lsu_idu_da_pipe3_fwd_vreg              ),
  .lsu_idu_da_pipe3_fwd_vreg_fr_data       (lsu_idu_da_pipe3_fwd_vreg_fr_data      ),
  .lsu_idu_da_pipe3_fwd_vreg_vld           (lsu_idu_da_pipe3_fwd_vreg_vld          ),
  .lsu_idu_da_pipe3_fwd_vreg_vr0_data      (lsu_idu_da_pipe3_fwd_vreg_vr0_data     ),
  .lsu_idu_da_pipe3_fwd_vreg_vr1_data      (lsu_idu_da_pipe3_fwd_vreg_vr1_data     ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4 (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4),
  .lsu_idu_dc_pipe3_load_inst_vld_dup0     (lsu_idu_dc_pipe3_load_inst_vld_dup0    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup1     (lsu_idu_dc_pipe3_load_inst_vld_dup1    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup2     (lsu_idu_dc_pipe3_load_inst_vld_dup2    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup3     (lsu_idu_dc_pipe3_load_inst_vld_dup3    ),
  .lsu_idu_dc_pipe3_load_inst_vld_dup4     (lsu_idu_dc_pipe3_load_inst_vld_dup4    ),
  .lsu_idu_dc_pipe3_preg_dup0              (lsu_idu_dc_pipe3_preg_dup0             ),
  .lsu_idu_dc_pipe3_preg_dup1              (lsu_idu_dc_pipe3_preg_dup1             ),
  .lsu_idu_dc_pipe3_preg_dup2              (lsu_idu_dc_pipe3_preg_dup2             ),
  .lsu_idu_dc_pipe3_preg_dup3              (lsu_idu_dc_pipe3_preg_dup3             ),
  .lsu_idu_dc_pipe3_preg_dup4              (lsu_idu_dc_pipe3_preg_dup4             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup0    (lsu_idu_dc_pipe3_vload_inst_vld_dup0   ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup1    (lsu_idu_dc_pipe3_vload_inst_vld_dup1   ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup2    (lsu_idu_dc_pipe3_vload_inst_vld_dup2   ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dup3    (lsu_idu_dc_pipe3_vload_inst_vld_dup3   ),
  .lsu_idu_dc_pipe3_vreg_dup0              (lsu_idu_dc_pipe3_vreg_dup0             ),
  .lsu_idu_dc_pipe3_vreg_dup1              (lsu_idu_dc_pipe3_vreg_dup1             ),
  .lsu_idu_dc_pipe3_vreg_dup2              (lsu_idu_dc_pipe3_vreg_dup2             ),
  .lsu_idu_dc_pipe3_vreg_dup3              (lsu_idu_dc_pipe3_vreg_dup3             ),
  .lsu_idu_dc_sdiq_entry                   (lsu_idu_dc_sdiq_entry                  ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_dc_staddr_vld                   (lsu_idu_dc_staddr_vld                  ),
  .lsu_idu_ex1_sdiq_entry                  (lsu_idu_ex1_sdiq_entry                 ),
  .lsu_idu_ex1_sdiq_frz_clr                (lsu_idu_ex1_sdiq_frz_clr               ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_lq_full                         (lsu_idu_lq_full                        ),
  .lsu_idu_lq_full_gateclk_en              (lsu_idu_lq_full_gateclk_en             ),
  .lsu_idu_lq_not_full                     (lsu_idu_lq_not_full                    ),
  .lsu_idu_lsiq_pop0_vld                   (lsu_idu_lsiq_pop0_vld                  ),
  .lsu_idu_lsiq_pop1_vld                   (lsu_idu_lsiq_pop1_vld                  ),
  .lsu_idu_lsiq_pop_entry                  (lsu_idu_lsiq_pop_entry                 ),
  .lsu_idu_lsiq_pop_vld                    (lsu_idu_lsiq_pop_vld                   ),
  .lsu_idu_no_fence                        (lsu_idu_no_fence                       ),
  .lsu_idu_rb_full                         (lsu_idu_rb_full                        ),
  .lsu_idu_rb_full_gateclk_en              (lsu_idu_rb_full_gateclk_en             ),
  .lsu_idu_rb_not_full                     (lsu_idu_rb_not_full                    ),
  .lsu_idu_secd                            (lsu_idu_secd                           ),
  .lsu_idu_spec_fail                       (lsu_idu_spec_fail                      ),
  .lsu_idu_sq_full                         (lsu_idu_sq_full                        ),
  .lsu_idu_sq_full_gateclk_en              (lsu_idu_sq_full_gateclk_en             ),
  .lsu_idu_sq_not_full                     (lsu_idu_sq_not_full                    ),
  .lsu_idu_tlb_busy                        (lsu_idu_tlb_busy                       ),
  .lsu_idu_tlb_busy_gateclk_en             (lsu_idu_tlb_busy_gateclk_en            ),
  .lsu_idu_tlb_wakeup                      (lsu_idu_tlb_wakeup                     ),
  .lsu_idu_unalign_gateclk_en              (lsu_idu_unalign_gateclk_en             ),
  .lsu_idu_vmb_1_left_updt                 (lsu_idu_vmb_1_left_updt                ),
  .lsu_idu_vmb_create0_entry               (lsu_idu_vmb_create0_entry              ),
  .lsu_idu_vmb_create1_entry               (lsu_idu_vmb_create1_entry              ),
  .lsu_idu_vmb_empty                       (lsu_idu_vmb_empty                      ),
  .lsu_idu_vmb_full                        (lsu_idu_vmb_full                       ),
  .lsu_idu_vmb_full_updt                   (lsu_idu_vmb_full_updt                  ),
  .lsu_idu_vmb_full_updt_clk_en            (lsu_idu_vmb_full_updt_clk_en           ),
  .lsu_idu_wait_fence                      (lsu_idu_wait_fence                     ),
  .lsu_idu_wait_fence_gateclk_en           (lsu_idu_wait_fence_gateclk_en          ),
  .lsu_idu_wait_old                        (lsu_idu_wait_old                       ),
  .lsu_idu_wait_old_gateclk_en             (lsu_idu_wait_old_gateclk_en            ),
  .lsu_idu_wakeup                          (lsu_idu_wakeup                         ),
  .lsu_idu_wb_pipe3_fwd_vreg               (lsu_idu_wb_pipe3_fwd_vreg              ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld           (lsu_idu_wb_pipe3_fwd_vreg_vld          ),
  .lsu_idu_wb_pipe3_wb_preg                (lsu_idu_wb_pipe3_wb_preg               ),
  .lsu_idu_wb_pipe3_wb_preg_data           (lsu_idu_wb_pipe3_wb_preg_data          ),
  .lsu_idu_wb_pipe3_wb_preg_dup0           (lsu_idu_wb_pipe3_wb_preg_dup0          ),
  .lsu_idu_wb_pipe3_wb_preg_dup1           (lsu_idu_wb_pipe3_wb_preg_dup1          ),
  .lsu_idu_wb_pipe3_wb_preg_dup2           (lsu_idu_wb_pipe3_wb_preg_dup2          ),
  .lsu_idu_wb_pipe3_wb_preg_dup3           (lsu_idu_wb_pipe3_wb_preg_dup3          ),
  .lsu_idu_wb_pipe3_wb_preg_dup4           (lsu_idu_wb_pipe3_wb_preg_dup4          ),
  .lsu_idu_wb_pipe3_wb_preg_expand         (lsu_idu_wb_pipe3_wb_preg_expand        ),
  .lsu_idu_wb_pipe3_wb_preg_vld            (lsu_idu_wb_pipe3_wb_preg_vld           ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup0       (lsu_idu_wb_pipe3_wb_preg_vld_dup0      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup1       (lsu_idu_wb_pipe3_wb_preg_vld_dup1      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup2       (lsu_idu_wb_pipe3_wb_preg_vld_dup2      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup3       (lsu_idu_wb_pipe3_wb_preg_vld_dup3      ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup4       (lsu_idu_wb_pipe3_wb_preg_vld_dup4      ),
  .lsu_idu_wb_pipe3_wb_vreg_dup0           (lsu_idu_wb_pipe3_wb_vreg_dup0          ),
  .lsu_idu_wb_pipe3_wb_vreg_dup1           (lsu_idu_wb_pipe3_wb_vreg_dup1          ),
  .lsu_idu_wb_pipe3_wb_vreg_dup2           (lsu_idu_wb_pipe3_wb_vreg_dup2          ),
  .lsu_idu_wb_pipe3_wb_vreg_dup3           (lsu_idu_wb_pipe3_wb_vreg_dup3          ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_data        (lsu_idu_wb_pipe3_wb_vreg_fr_data       ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_expand      (lsu_idu_wb_pipe3_wb_vreg_fr_expand     ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_vld         (lsu_idu_wb_pipe3_wb_vreg_fr_vld        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup0       (lsu_idu_wb_pipe3_wb_vreg_vld_dup0      ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup1       (lsu_idu_wb_pipe3_wb_vreg_vld_dup1      ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup2       (lsu_idu_wb_pipe3_wb_vreg_vld_dup2      ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup3       (lsu_idu_wb_pipe3_wb_vreg_vld_dup3      ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_data       (lsu_idu_wb_pipe3_wb_vreg_vr0_data      ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_expand     (lsu_idu_wb_pipe3_wb_vreg_vr0_expand    ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_vld        (lsu_idu_wb_pipe3_wb_vreg_vr0_vld       ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_data       (lsu_idu_wb_pipe3_wb_vreg_vr1_data      ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_expand     (lsu_idu_wb_pipe3_wb_vreg_vr1_expand    ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_vld        (lsu_idu_wb_pipe3_wb_vreg_vr1_vld       ),
  .lsu_ifu_icache_all_inv                  (lsu_ifu_icache_all_inv                 ),
  .lsu_ifu_icache_index                    (lsu_ifu_icache_index                   ),
  .lsu_ifu_icache_line_inv                 (lsu_ifu_icache_line_inv                ),
  .lsu_ifu_icache_ptag                     (lsu_ifu_icache_ptag                    ),
  .lsu_mmu_abort0                          (lsu_mmu_abort0                         ),
  .lsu_mmu_abort1                          (lsu_mmu_abort1                         ),
  .lsu_mmu_bus_error                       (lsu_mmu_bus_error                      ),
  .lsu_mmu_data                            (lsu_mmu_data                           ),
  .lsu_mmu_data_vld                        (lsu_mmu_data_vld                       ),
  .lsu_mmu_id0                             (lsu_mmu_id0                            ),
  .lsu_mmu_id1                             (lsu_mmu_id1                            ),
  .lsu_mmu_st_inst0                        (lsu_mmu_st_inst0                       ),
  .lsu_mmu_st_inst1                        (lsu_mmu_st_inst1                       ),
  .lsu_mmu_stamo_pa                        (lsu_mmu_stamo_pa                       ),
  .lsu_mmu_stamo_vld                       (lsu_mmu_stamo_vld                      ),
  .lsu_mmu_tlb_all_inv                     (lsu_mmu_tlb_all_inv                    ),
  .lsu_mmu_tlb_asid                        (lsu_mmu_tlb_asid                       ),
  .lsu_mmu_tlb_asid_all_inv                (lsu_mmu_tlb_asid_all_inv               ),
  .lsu_mmu_tlb_va                          (lsu_mmu_tlb_va                         ),
  .lsu_mmu_tlb_va_all_inv                  (lsu_mmu_tlb_va_all_inv                 ),
  .lsu_mmu_tlb_va_asid_inv                 (lsu_mmu_tlb_va_asid_inv                ),
  .lsu_mmu_va0                             (lsu_mmu_va0                            ),
  .lsu_mmu_va0_vld                         (lsu_mmu_va0_vld                        ),
  .lsu_mmu_va1                             (lsu_mmu_va1                            ),
  .lsu_mmu_va1_vld                         (lsu_mmu_va1_vld                        ),
  .lsu_mmu_va2                             (lsu_mmu_va2                            ),
  .lsu_mmu_va2_vld                         (lsu_mmu_va2_vld                        ),
  .lsu_mmu_vabuf0                          (lsu_mmu_vabuf0                         ),
  .lsu_mmu_vabuf1                          (lsu_mmu_vabuf1                         ),
  .lsu_rtu_all_commit_data_vld             (lsu_rtu_all_commit_data_vld            ),
  .lsu_rtu_async_expt_addr                 (lsu_rtu_async_expt_addr                ),
  .lsu_rtu_async_expt_vld                  (lsu_rtu_async_expt_vld                 ),
  .lsu_rtu_ctc_flush_vld                   (lsu_rtu_ctc_flush_vld                  ),
  .lsu_rtu_da_pipe3_split_spec_fail_iid    (lsu_rtu_da_pipe3_split_spec_fail_iid   ),
  .lsu_rtu_da_pipe3_split_spec_fail_vld    (lsu_rtu_da_pipe3_split_spec_fail_vld   ),
  .lsu_rtu_da_pipe4_split_spec_fail_iid    (lsu_rtu_da_pipe4_split_spec_fail_iid   ),
  .lsu_rtu_da_pipe4_split_spec_fail_vld    (lsu_rtu_da_pipe4_split_spec_fail_vld   ),
  .lsu_rtu_wb_pipe3_abnormal               (lsu_rtu_wb_pipe3_abnormal              ),
  .lsu_rtu_wb_pipe3_bkpta_data             (lsu_rtu_wb_pipe3_bkpta_data            ),
  .lsu_rtu_wb_pipe3_bkptb_data             (lsu_rtu_wb_pipe3_bkptb_data            ),
  .lsu_rtu_wb_pipe3_cmplt                  (lsu_rtu_wb_pipe3_cmplt                 ),
  .lsu_rtu_wb_pipe3_expt_vec               (lsu_rtu_wb_pipe3_expt_vec              ),
  .lsu_rtu_wb_pipe3_expt_vld               (lsu_rtu_wb_pipe3_expt_vld              ),
  .lsu_rtu_wb_pipe3_flush                  (lsu_rtu_wb_pipe3_flush                 ),
  .lsu_rtu_wb_pipe3_iid                    (lsu_rtu_wb_pipe3_iid                   ),
  .lsu_rtu_wb_pipe3_mtval                  (lsu_rtu_wb_pipe3_mtval                 ),
  .lsu_rtu_wb_pipe3_no_spec_hit            (lsu_rtu_wb_pipe3_no_spec_hit           ),
  .lsu_rtu_wb_pipe3_no_spec_mispred        (lsu_rtu_wb_pipe3_no_spec_mispred       ),
  .lsu_rtu_wb_pipe3_no_spec_miss           (lsu_rtu_wb_pipe3_no_spec_miss          ),
  .lsu_rtu_wb_pipe3_spec_fail              (lsu_rtu_wb_pipe3_spec_fail             ),
  .lsu_rtu_wb_pipe3_vsetvl                 (lsu_rtu_wb_pipe3_vsetvl                ),
  .lsu_rtu_wb_pipe3_vstart                 (lsu_rtu_wb_pipe3_vstart                ),
  .lsu_rtu_wb_pipe3_vstart_vld             (lsu_rtu_wb_pipe3_vstart_vld            ),
  .lsu_rtu_wb_pipe3_wb_preg_expand         (lsu_rtu_wb_pipe3_wb_preg_expand        ),
  .lsu_rtu_wb_pipe3_wb_preg_vld            (lsu_rtu_wb_pipe3_wb_preg_vld           ),
  .lsu_rtu_wb_pipe3_wb_vreg_expand         (lsu_rtu_wb_pipe3_wb_vreg_expand        ),
  .lsu_rtu_wb_pipe3_wb_vreg_fr_vld         (lsu_rtu_wb_pipe3_wb_vreg_fr_vld        ),
  .lsu_rtu_wb_pipe3_wb_vreg_vr_vld         (lsu_rtu_wb_pipe3_wb_vreg_vr_vld        ),
  .lsu_rtu_wb_pipe4_abnormal               (lsu_rtu_wb_pipe4_abnormal              ),
  .lsu_rtu_wb_pipe4_bkpta_data             (lsu_rtu_wb_pipe4_bkpta_data            ),
  .lsu_rtu_wb_pipe4_bkptb_data             (lsu_rtu_wb_pipe4_bkptb_data            ),
  .lsu_rtu_wb_pipe4_cmplt                  (lsu_rtu_wb_pipe4_cmplt                 ),
  .lsu_rtu_wb_pipe4_expt_vec               (lsu_rtu_wb_pipe4_expt_vec              ),
  .lsu_rtu_wb_pipe4_expt_vld               (lsu_rtu_wb_pipe4_expt_vld              ),
  .lsu_rtu_wb_pipe4_flush                  (lsu_rtu_wb_pipe4_flush                 ),
  .lsu_rtu_wb_pipe4_iid                    (lsu_rtu_wb_pipe4_iid                   ),
  .lsu_rtu_wb_pipe4_mtval                  (lsu_rtu_wb_pipe4_mtval                 ),
  .lsu_rtu_wb_pipe4_no_spec_hit            (lsu_rtu_wb_pipe4_no_spec_hit           ),
  .lsu_rtu_wb_pipe4_no_spec_mispred        (lsu_rtu_wb_pipe4_no_spec_mispred       ),
  .lsu_rtu_wb_pipe4_no_spec_miss           (lsu_rtu_wb_pipe4_no_spec_miss          ),
  .lsu_rtu_wb_pipe4_spec_fail              (lsu_rtu_wb_pipe4_spec_fail             ),
  .lsu_rtu_wb_pipe4_vstart                 (lsu_rtu_wb_pipe4_vstart                ),
  .lsu_rtu_wb_pipe4_vstart_vld             (lsu_rtu_wb_pipe4_vstart_vld            ),
  .lsu_yy_xx_no_op                         (lsu_yy_xx_no_op                        ),
  .mmu_lsu_access_fault0                   (mmu_lsu_access_fault0                  ),
  .mmu_lsu_access_fault1                   (mmu_lsu_access_fault1                  ),
  .mmu_lsu_buf0                            (mmu_lsu_buf0                           ),
  .mmu_lsu_buf1                            (mmu_lsu_buf1                           ),
  .mmu_lsu_ca0                             (mmu_lsu_ca0                            ),
  .mmu_lsu_ca1                             (mmu_lsu_ca1                            ),
  .mmu_lsu_data_req                        (mmu_lsu_data_req                       ),
  .mmu_lsu_data_req_addr                   (mmu_lsu_data_req_addr                  ),
  .mmu_lsu_data_req_size                   (mmu_lsu_data_req_size                  ),
  .mmu_lsu_mmu_en                          (mmu_lsu_mmu_en                         ),
  .mmu_lsu_pa0                             (mmu_lsu_pa0                            ),
  .mmu_lsu_pa0_vld                         (mmu_lsu_pa0_vld                        ),
  .mmu_lsu_pa1                             (mmu_lsu_pa1                            ),
  .mmu_lsu_pa1_vld                         (mmu_lsu_pa1_vld                        ),
  .mmu_lsu_pa2                             (mmu_lsu_pa2                            ),
  .mmu_lsu_pa2_err                         (mmu_lsu_pa2_err                        ),
  .mmu_lsu_pa2_vld                         (mmu_lsu_pa2_vld                        ),
  .mmu_lsu_page_fault0                     (mmu_lsu_page_fault0                    ),
  .mmu_lsu_page_fault1                     (mmu_lsu_page_fault1                    ),
  .mmu_lsu_sec0                            (mmu_lsu_sec0                           ),
  .mmu_lsu_sec1                            (mmu_lsu_sec1                           ),
  .mmu_lsu_sec2                            (mmu_lsu_sec2                           ),
  .mmu_lsu_sh0                             (mmu_lsu_sh0                            ),
  .mmu_lsu_sh1                             (mmu_lsu_sh1                            ),
  .mmu_lsu_share2                          (mmu_lsu_share2                         ),
  .mmu_lsu_so0                             (mmu_lsu_so0                            ),
  .mmu_lsu_so1                             (mmu_lsu_so1                            ),
  .mmu_lsu_stall0                          (mmu_lsu_stall0                         ),
  .mmu_lsu_stall1                          (mmu_lsu_stall1                         ),
  .mmu_lsu_tlb_busy                        (mmu_lsu_tlb_busy                       ),
  .mmu_lsu_tlb_inv_done                    (mmu_lsu_tlb_inv_done                   ),
  .mmu_lsu_tlb_wakeup                      (mmu_lsu_tlb_wakeup                     ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_lsu_async_flush                     (rtu_lsu_async_flush                    ),
  .rtu_lsu_commit0_iid_updt_val            (rtu_lsu_commit0_iid_updt_val           ),
  .rtu_lsu_commit1_iid_updt_val            (rtu_lsu_commit1_iid_updt_val           ),
  .rtu_lsu_commit2_iid_updt_val            (rtu_lsu_commit2_iid_updt_val           ),
  .rtu_lsu_eret_flush                      (rtu_lsu_eret_flush                     ),
  .rtu_lsu_expt_flush                      (rtu_lsu_expt_flush                     ),
  .rtu_lsu_spec_fail_flush                 (rtu_lsu_spec_fail_flush                ),
  .rtu_lsu_spec_fail_iid                   (rtu_lsu_spec_fail_iid                  ),
  .rtu_yy_xx_commit0                       (rtu_yy_xx_commit0                      ),
  .rtu_yy_xx_commit0_iid                   (rtu_yy_xx_commit0_iid                  ),
  .rtu_yy_xx_commit1                       (rtu_yy_xx_commit1                      ),
  .rtu_yy_xx_commit1_iid                   (rtu_yy_xx_commit1_iid                  ),
  .rtu_yy_xx_commit2                       (rtu_yy_xx_commit2                      ),
  .rtu_yy_xx_commit2_iid                   (rtu_yy_xx_commit2_iid                  ),
  .rtu_yy_xx_dbgon                         (rtu_yy_xx_dbgon                        ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        )
);

// &Connect(.cpurst_b   (lsu_rst_b)); @76

//==========================================================
//  Instance ct_cp0_top sub module 
//==========================================================
// &Instance("ct_cp0_top"); @81
ct_cp0_top  x_ct_cp0_top (
  .biu_cp0_apb_base                (biu_cp0_apb_base               ),
  .biu_cp0_cmplt                   (biu_cp0_cmplt                  ),
  .biu_cp0_coreid                  (biu_cp0_coreid                 ),
  .biu_cp0_me_int                  (biu_cp0_me_int                 ),
  .biu_cp0_ms_int                  (biu_cp0_ms_int                 ),
  .biu_cp0_mt_int                  (biu_cp0_mt_int                 ),
  .biu_cp0_rdata                   (biu_cp0_rdata                  ),
  .biu_cp0_rvba                    (biu_cp0_rvba                   ),
  .biu_cp0_se_int                  (biu_cp0_se_int                 ),
  .biu_cp0_ss_int                  (biu_cp0_ss_int                 ),
  .biu_cp0_st_int                  (biu_cp0_st_int                 ),
  .biu_yy_xx_no_op                 (biu_yy_xx_no_op                ),
  .cp0_biu_icg_en                  (cp0_biu_icg_en                 ),
  .cp0_biu_lpmd_b                  (cp0_biu_lpmd_b                 ),
  .cp0_biu_op                      (cp0_biu_op                     ),
  .cp0_biu_sel                     (cp0_biu_sel                    ),
  .cp0_biu_wdata                   (cp0_biu_wdata                  ),
  .cp0_had_cpuid_0                 (cp0_had_cpuid_0                ),
  .cp0_had_debug_info              (cp0_had_debug_info             ),
  .cp0_had_lpmd_b                  (cp0_had_lpmd_b                 ),
  .cp0_had_trace_pm_wdata          (cp0_had_trace_pm_wdata         ),
  .cp0_had_trace_pm_wen            (cp0_had_trace_pm_wen           ),
  .cp0_hpcp_icg_en                 (cp0_hpcp_icg_en                ),
  .cp0_hpcp_index                  (cp0_hpcp_index                 ),
  .cp0_hpcp_int_disable            (cp0_hpcp_int_disable           ),
  .cp0_hpcp_mcntwen                (cp0_hpcp_mcntwen               ),
  .cp0_hpcp_op                     (cp0_hpcp_op                    ),
  .cp0_hpcp_pmdm                   (cp0_hpcp_pmdm                  ),
  .cp0_hpcp_pmds                   (cp0_hpcp_pmds                  ),
  .cp0_hpcp_pmdu                   (cp0_hpcp_pmdu                  ),
  .cp0_hpcp_sel                    (cp0_hpcp_sel                   ),
  .cp0_hpcp_src0                   (cp0_hpcp_src0                  ),
  .cp0_hpcp_wdata                  (cp0_hpcp_wdata                 ),
  .cp0_idu_cskyee                  (cp0_idu_cskyee                 ),
  .cp0_idu_dlb_disable             (cp0_idu_dlb_disable            ),
  .cp0_idu_frm                     (cp0_idu_frm                    ),
  .cp0_idu_fs                      (cp0_idu_fs                     ),
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_idu_iq_bypass_disable       (cp0_idu_iq_bypass_disable      ),
  .cp0_idu_rob_fold_disable        (cp0_idu_rob_fold_disable       ),
  .cp0_idu_src2_fwd_disable        (cp0_idu_src2_fwd_disable       ),
  .cp0_idu_srcv2_fwd_disable       (cp0_idu_srcv2_fwd_disable      ),
  .cp0_idu_vill                    (cp0_idu_vill                   ),
  .cp0_idu_vs                      (cp0_idu_vs                     ),
  .cp0_idu_vstart                  (cp0_idu_vstart                 ),
  .cp0_idu_zero_delay_move_disable (cp0_idu_zero_delay_move_disable),
  .cp0_ifu_bht_en                  (cp0_ifu_bht_en                 ),
  .cp0_ifu_bht_inv                 (cp0_ifu_bht_inv                ),
  .cp0_ifu_btb_en                  (cp0_ifu_btb_en                 ),
  .cp0_ifu_btb_inv                 (cp0_ifu_btb_inv                ),
  .cp0_ifu_icache_en               (cp0_ifu_icache_en              ),
  .cp0_ifu_icache_inv              (cp0_ifu_icache_inv             ),
  .cp0_ifu_icache_pref_en          (cp0_ifu_icache_pref_en         ),
  .cp0_ifu_icache_read_index       (cp0_ifu_icache_read_index      ),
  .cp0_ifu_icache_read_req         (cp0_ifu_icache_read_req        ),
  .cp0_ifu_icache_read_tag         (cp0_ifu_icache_read_tag        ),
  .cp0_ifu_icache_read_way         (cp0_ifu_icache_read_way        ),
  .cp0_ifu_icg_en                  (cp0_ifu_icg_en                 ),
  .cp0_ifu_ind_btb_en              (cp0_ifu_ind_btb_en             ),
  .cp0_ifu_ind_btb_inv             (cp0_ifu_ind_btb_inv            ),
  .cp0_ifu_insde                   (cp0_ifu_insde                  ),
  .cp0_ifu_iwpe                    (cp0_ifu_iwpe                   ),
  .cp0_ifu_l0btb_en                (cp0_ifu_l0btb_en               ),
  .cp0_ifu_lbuf_en                 (cp0_ifu_lbuf_en                ),
  .cp0_ifu_no_op_req               (cp0_ifu_no_op_req              ),
  .cp0_ifu_nsfe                    (cp0_ifu_nsfe                   ),
  .cp0_ifu_ras_en                  (cp0_ifu_ras_en                 ),
  .cp0_ifu_rst_inv_done            (cp0_ifu_rst_inv_done           ),
  .cp0_ifu_rvbr                    (cp0_ifu_rvbr                   ),
  .cp0_ifu_vbr                     (cp0_ifu_vbr                    ),
  .cp0_ifu_vl                      (cp0_ifu_vl                     ),
  .cp0_ifu_vlmul                   (cp0_ifu_vlmul                  ),
  .cp0_ifu_vsetvli_pred_disable    (cp0_ifu_vsetvli_pred_disable   ),
  .cp0_ifu_vsetvli_pred_mode       (cp0_ifu_vsetvli_pred_mode      ),
  .cp0_ifu_vsew                    (cp0_ifu_vsew                   ),
  .cp0_iu_div_entry_disable        (cp0_iu_div_entry_disable       ),
  .cp0_iu_div_entry_disable_clr    (cp0_iu_div_entry_disable_clr   ),
  .cp0_iu_ex3_abnormal             (cp0_iu_ex3_abnormal            ),
  .cp0_iu_ex3_efpc                 (cp0_iu_ex3_efpc                ),
  .cp0_iu_ex3_efpc_vld             (cp0_iu_ex3_efpc_vld            ),
  .cp0_iu_ex3_expt_vec             (cp0_iu_ex3_expt_vec            ),
  .cp0_iu_ex3_expt_vld             (cp0_iu_ex3_expt_vld            ),
  .cp0_iu_ex3_flush                (cp0_iu_ex3_flush               ),
  .cp0_iu_ex3_iid                  (cp0_iu_ex3_iid                 ),
  .cp0_iu_ex3_inst_vld             (cp0_iu_ex3_inst_vld            ),
  .cp0_iu_ex3_mtval                (cp0_iu_ex3_mtval               ),
  .cp0_iu_ex3_rslt_data            (cp0_iu_ex3_rslt_data           ),
  .cp0_iu_ex3_rslt_preg            (cp0_iu_ex3_rslt_preg           ),
  .cp0_iu_ex3_rslt_vld             (cp0_iu_ex3_rslt_vld            ),
  .cp0_iu_icg_en                   (cp0_iu_icg_en                  ),
  .cp0_iu_vill                     (cp0_iu_vill                    ),
  .cp0_iu_vl                       (cp0_iu_vl                      ),
  .cp0_iu_vsetvli_pre_decd_disable (cp0_iu_vsetvli_pre_decd_disable),
  .cp0_iu_vstart                   (cp0_iu_vstart                  ),
  .cp0_lsu_amr                     (cp0_lsu_amr                    ),
  .cp0_lsu_amr2                    (cp0_lsu_amr2                   ),
  .cp0_lsu_cb_aclr_dis             (cp0_lsu_cb_aclr_dis            ),
  .cp0_lsu_corr_dis                (cp0_lsu_corr_dis               ),
  .cp0_lsu_ctc_flush_dis           (cp0_lsu_ctc_flush_dis          ),
  .cp0_lsu_da_fwd_dis              (cp0_lsu_da_fwd_dis             ),
  .cp0_lsu_dcache_clr              (cp0_lsu_dcache_clr             ),
  .cp0_lsu_dcache_en               (cp0_lsu_dcache_en              ),
  .cp0_lsu_dcache_inv              (cp0_lsu_dcache_inv             ),
  .cp0_lsu_dcache_pref_dist        (cp0_lsu_dcache_pref_dist       ),
  .cp0_lsu_dcache_pref_en          (cp0_lsu_dcache_pref_en         ),
  .cp0_lsu_dcache_read_index       (cp0_lsu_dcache_read_index      ),
  .cp0_lsu_dcache_read_ld_tag      (cp0_lsu_dcache_read_ld_tag     ),
  .cp0_lsu_dcache_read_req         (cp0_lsu_dcache_read_req        ),
  .cp0_lsu_dcache_read_st_tag      (cp0_lsu_dcache_read_st_tag     ),
  .cp0_lsu_dcache_read_way         (cp0_lsu_dcache_read_way        ),
  .cp0_lsu_fencei_broad_dis        (cp0_lsu_fencei_broad_dis       ),
  .cp0_lsu_fencerw_broad_dis       (cp0_lsu_fencerw_broad_dis      ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_lsu_l2_pref_dist            (cp0_lsu_l2_pref_dist           ),
  .cp0_lsu_l2_pref_en              (cp0_lsu_l2_pref_en             ),
  .cp0_lsu_l2_st_pref_en           (cp0_lsu_l2_st_pref_en          ),
  .cp0_lsu_mm                      (cp0_lsu_mm                     ),
  .cp0_lsu_no_op_req               (cp0_lsu_no_op_req              ),
  .cp0_lsu_nsfe                    (cp0_lsu_nsfe                   ),
  .cp0_lsu_pfu_mmu_dis             (cp0_lsu_pfu_mmu_dis            ),
  .cp0_lsu_timeout_cnt             (cp0_lsu_timeout_cnt            ),
  .cp0_lsu_tlb_broad_dis           (cp0_lsu_tlb_broad_dis          ),
  .cp0_lsu_tvm                     (cp0_lsu_tvm                    ),
  .cp0_lsu_ucme                    (cp0_lsu_ucme                   ),
  .cp0_lsu_vstart                  (cp0_lsu_vstart                 ),
  .cp0_lsu_wa                      (cp0_lsu_wa                     ),
  .cp0_lsu_wr_burst_dis            (cp0_lsu_wr_burst_dis           ),
  .cp0_mmu_cskyee                  (cp0_mmu_cskyee                 ),
  .cp0_mmu_icg_en                  (cp0_mmu_icg_en                 ),
  .cp0_mmu_maee                    (cp0_mmu_maee                   ),
  .cp0_mmu_mpp                     (cp0_mmu_mpp                    ),
  .cp0_mmu_mprv                    (cp0_mmu_mprv                   ),
  .cp0_mmu_mxr                     (cp0_mmu_mxr                    ),
  .cp0_mmu_no_op_req               (cp0_mmu_no_op_req              ),
  .cp0_mmu_ptw_en                  (cp0_mmu_ptw_en                 ),
  .cp0_mmu_reg_num                 (cp0_mmu_reg_num                ),
  .cp0_mmu_satp_sel                (cp0_mmu_satp_sel               ),
  .cp0_mmu_sum                     (cp0_mmu_sum                    ),
  .cp0_mmu_tlb_all_inv             (cp0_mmu_tlb_all_inv            ),
  .cp0_mmu_wdata                   (cp0_mmu_wdata                  ),
  .cp0_mmu_wreg                    (cp0_mmu_wreg                   ),
  .cp0_pad_mstatus                 (cp0_pad_mstatus                ),
  .cp0_pmp_icg_en                  (cp0_pmp_icg_en                 ),
  .cp0_pmp_mpp                     (cp0_pmp_mpp                    ),
  .cp0_pmp_mprv                    (cp0_pmp_mprv                   ),
  .cp0_pmp_reg_num                 (cp0_pmp_reg_num                ),
  .cp0_pmp_wdata                   (cp0_pmp_wdata                  ),
  .cp0_pmp_wreg                    (cp0_pmp_wreg                   ),
  .cp0_rtu_icg_en                  (cp0_rtu_icg_en                 ),
  .cp0_rtu_srt_en                  (cp0_rtu_srt_en                 ),
  .cp0_rtu_xx_int_b                (cp0_rtu_xx_int_b               ),
  .cp0_rtu_xx_vec                  (cp0_rtu_xx_vec                 ),
  .cp0_vfpu_fcsr                   (cp0_vfpu_fcsr                  ),
  .cp0_vfpu_fxcr                   (cp0_vfpu_fxcr                  ),
  .cp0_vfpu_icg_en                 (cp0_vfpu_icg_en                ),
  .cp0_vfpu_vl                     (cp0_vfpu_vl                    ),
  .cp0_xx_core_icg_en              (cp0_xx_core_icg_en             ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cp0_yy_dcache_pref_en           (cp0_yy_dcache_pref_en          ),
  .cp0_yy_hyper                    (cp0_yy_hyper                   ),
  .cp0_yy_priv_mode                (cp0_yy_priv_mode               ),
  .cp0_yy_virtual_mode             (cp0_yy_virtual_mode            ),
  .cpurst_b                        (idu_rst_b                      ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .had_cp0_xx_dbg                  (had_cp0_xx_dbg                 ),
  .hpcp_cp0_cmplt                  (hpcp_cp0_cmplt                 ),
  .hpcp_cp0_data                   (hpcp_cp0_data                  ),
  .hpcp_cp0_int_vld                (hpcp_cp0_int_vld               ),
  .hpcp_cp0_sce                    (hpcp_cp0_sce                   ),
  .idu_cp0_fesr_acc_updt_val       (idu_cp0_fesr_acc_updt_val      ),
  .idu_cp0_fesr_acc_updt_vld       (idu_cp0_fesr_acc_updt_vld      ),
  .idu_cp0_rf_func                 (idu_cp0_rf_func                ),
  .idu_cp0_rf_gateclk_sel          (idu_cp0_rf_gateclk_sel         ),
  .idu_cp0_rf_iid                  (idu_cp0_rf_iid                 ),
  .idu_cp0_rf_opcode               (idu_cp0_rf_opcode              ),
  .idu_cp0_rf_preg                 (idu_cp0_rf_preg                ),
  .idu_cp0_rf_sel                  (idu_cp0_rf_sel                 ),
  .idu_cp0_rf_src0                 (idu_cp0_rf_src0                ),
  .ifu_cp0_bht_inv_done            (ifu_cp0_bht_inv_done           ),
  .ifu_cp0_btb_inv_done            (ifu_cp0_btb_inv_done           ),
  .ifu_cp0_icache_inv_done         (ifu_cp0_icache_inv_done        ),
  .ifu_cp0_icache_read_data        (ifu_cp0_icache_read_data       ),
  .ifu_cp0_icache_read_data_vld    (ifu_cp0_icache_read_data_vld   ),
  .ifu_cp0_ind_btb_inv_done        (ifu_cp0_ind_btb_inv_done       ),
  .ifu_cp0_rst_inv_req             (ifu_cp0_rst_inv_req            ),
  .ifu_yy_xx_no_op                 (ifu_yy_xx_no_op                ),
  .lsu_cp0_dcache_done             (lsu_cp0_dcache_done            ),
  .lsu_cp0_dcache_read_data        (lsu_cp0_dcache_read_data       ),
  .lsu_cp0_dcache_read_data_vld    (lsu_cp0_dcache_read_data_vld   ),
  .lsu_yy_xx_no_op                 (lsu_yy_xx_no_op                ),
  .mmu_cp0_cmplt                   (mmu_cp0_cmplt                  ),
  .mmu_cp0_data                    (mmu_cp0_data                   ),
  .mmu_cp0_satp_data               (mmu_cp0_satp_data              ),
  .mmu_cp0_tlb_done                (mmu_cp0_tlb_done               ),
  .mmu_yy_xx_no_op                 (mmu_yy_xx_no_op                ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .pmp_cp0_data                    (pmp_cp0_data                   ),
  .rtu_cp0_epc                     (rtu_cp0_epc                    ),
  .rtu_cp0_expt_gateclk_vld        (rtu_cp0_expt_gateclk_vld       ),
  .rtu_cp0_expt_mtval              (rtu_cp0_expt_mtval             ),
  .rtu_cp0_expt_vld                (rtu_cp0_expt_vld               ),
  .rtu_cp0_fp_dirty_vld            (rtu_cp0_fp_dirty_vld           ),
  .rtu_cp0_int_ack                 (rtu_cp0_int_ack                ),
  .rtu_cp0_vec_dirty_vld           (rtu_cp0_vec_dirty_vld          ),
  .rtu_cp0_vsetvl_vill             (rtu_cp0_vsetvl_vill            ),
  .rtu_cp0_vsetvl_vl               (rtu_cp0_vsetvl_vl              ),
  .rtu_cp0_vsetvl_vl_vld           (rtu_cp0_vsetvl_vl_vld          ),
  .rtu_cp0_vsetvl_vlmul            (rtu_cp0_vsetvl_vlmul           ),
  .rtu_cp0_vsetvl_vsew             (rtu_cp0_vsetvl_vsew            ),
  .rtu_cp0_vsetvl_vtype_vld        (rtu_cp0_vsetvl_vtype_vld       ),
  .rtu_cp0_vstart                  (rtu_cp0_vstart                 ),
  .rtu_cp0_vstart_vld              (rtu_cp0_vstart_vld             ),
  .rtu_yy_xx_commit0               (rtu_yy_xx_commit0              ),
  .rtu_yy_xx_commit0_iid           (rtu_yy_xx_commit0_iid          ),
  .rtu_yy_xx_dbgon                 (rtu_yy_xx_dbgon                ),
  .rtu_yy_xx_expt_vec              (rtu_yy_xx_expt_vec             ),
  .rtu_yy_xx_flush                 (rtu_yy_xx_flush                )
);

// &Connect(.cpurst_b   (idu_rst_b)); @82

//==========================================================
//  Instance ct_rtu_top sub module 
//==========================================================
// &Instance("ct_rtu_top"); @87
ct_rtu_top  x_ct_rtu_top (
  .cp0_rtu_icg_en                       (cp0_rtu_icg_en                      ),
  .cp0_rtu_srt_en                       (cp0_rtu_srt_en                      ),
  .cp0_rtu_xx_int_b                     (cp0_rtu_xx_int_b                    ),
  .cp0_rtu_xx_vec                       (cp0_rtu_xx_vec                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (idu_rst_b                           ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_rtu_data_bkpt_dbgreq             (had_rtu_data_bkpt_dbgreq            ),
  .had_rtu_dbg_disable                  (had_rtu_dbg_disable                 ),
  .had_rtu_dbg_req_en                   (had_rtu_dbg_req_en                  ),
  .had_rtu_debug_retire_info_en         (had_rtu_debug_retire_info_en        ),
  .had_rtu_event_dbgreq                 (had_rtu_event_dbgreq                ),
  .had_rtu_fdb                          (had_rtu_fdb                         ),
  .had_rtu_hw_dbgreq                    (had_rtu_hw_dbgreq                   ),
  .had_rtu_hw_dbgreq_gateclk            (had_rtu_hw_dbgreq_gateclk           ),
  .had_rtu_inst_bkpt_dbgreq             (had_rtu_inst_bkpt_dbgreq            ),
  .had_rtu_non_irv_bkpt_dbgreq          (had_rtu_non_irv_bkpt_dbgreq         ),
  .had_rtu_pop1_disa                    (had_rtu_pop1_disa                   ),
  .had_rtu_trace_dbgreq                 (had_rtu_trace_dbgreq                ),
  .had_rtu_trace_en                     (had_rtu_trace_en                    ),
  .had_rtu_xx_jdbreq                    (had_rtu_xx_jdbreq                   ),
  .had_rtu_xx_tme                       (had_rtu_xx_tme                      ),
  .had_yy_xx_exit_dbg                   (had_yy_xx_exit_dbg                  ),
  .hpcp_rtu_cnt_en                      (hpcp_rtu_cnt_en                     ),
  .idu_rtu_fence_idle                   (idu_rtu_fence_idle                  ),
  .idu_rtu_ir_ereg0_alloc_vld           (idu_rtu_ir_ereg0_alloc_vld          ),
  .idu_rtu_ir_ereg1_alloc_vld           (idu_rtu_ir_ereg1_alloc_vld          ),
  .idu_rtu_ir_ereg2_alloc_vld           (idu_rtu_ir_ereg2_alloc_vld          ),
  .idu_rtu_ir_ereg3_alloc_vld           (idu_rtu_ir_ereg3_alloc_vld          ),
  .idu_rtu_ir_ereg_alloc_gateclk_vld    (idu_rtu_ir_ereg_alloc_gateclk_vld   ),
  .idu_rtu_ir_freg0_alloc_vld           (idu_rtu_ir_freg0_alloc_vld          ),
  .idu_rtu_ir_freg1_alloc_vld           (idu_rtu_ir_freg1_alloc_vld          ),
  .idu_rtu_ir_freg2_alloc_vld           (idu_rtu_ir_freg2_alloc_vld          ),
  .idu_rtu_ir_freg3_alloc_vld           (idu_rtu_ir_freg3_alloc_vld          ),
  .idu_rtu_ir_freg_alloc_gateclk_vld    (idu_rtu_ir_freg_alloc_gateclk_vld   ),
  .idu_rtu_ir_preg0_alloc_vld           (idu_rtu_ir_preg0_alloc_vld          ),
  .idu_rtu_ir_preg1_alloc_vld           (idu_rtu_ir_preg1_alloc_vld          ),
  .idu_rtu_ir_preg2_alloc_vld           (idu_rtu_ir_preg2_alloc_vld          ),
  .idu_rtu_ir_preg3_alloc_vld           (idu_rtu_ir_preg3_alloc_vld          ),
  .idu_rtu_ir_preg_alloc_gateclk_vld    (idu_rtu_ir_preg_alloc_gateclk_vld   ),
  .idu_rtu_ir_vreg0_alloc_vld           (idu_rtu_ir_vreg0_alloc_vld          ),
  .idu_rtu_ir_vreg1_alloc_vld           (idu_rtu_ir_vreg1_alloc_vld          ),
  .idu_rtu_ir_vreg2_alloc_vld           (idu_rtu_ir_vreg2_alloc_vld          ),
  .idu_rtu_ir_vreg3_alloc_vld           (idu_rtu_ir_vreg3_alloc_vld          ),
  .idu_rtu_ir_vreg_alloc_gateclk_vld    (idu_rtu_ir_vreg_alloc_gateclk_vld   ),
  .idu_rtu_pst_dis_inst0_dst_reg        (idu_rtu_pst_dis_inst0_dst_reg       ),
  .idu_rtu_pst_dis_inst0_dstv_reg       (idu_rtu_pst_dis_inst0_dstv_reg      ),
  .idu_rtu_pst_dis_inst0_ereg           (idu_rtu_pst_dis_inst0_ereg          ),
  .idu_rtu_pst_dis_inst0_ereg_iid       (idu_rtu_pst_dis_inst0_ereg_iid      ),
  .idu_rtu_pst_dis_inst0_ereg_vld       (idu_rtu_pst_dis_inst0_ereg_vld      ),
  .idu_rtu_pst_dis_inst0_freg_vld       (idu_rtu_pst_dis_inst0_freg_vld      ),
  .idu_rtu_pst_dis_inst0_preg           (idu_rtu_pst_dis_inst0_preg          ),
  .idu_rtu_pst_dis_inst0_preg_iid       (idu_rtu_pst_dis_inst0_preg_iid      ),
  .idu_rtu_pst_dis_inst0_preg_vld       (idu_rtu_pst_dis_inst0_preg_vld      ),
  .idu_rtu_pst_dis_inst0_rel_ereg       (idu_rtu_pst_dis_inst0_rel_ereg      ),
  .idu_rtu_pst_dis_inst0_rel_preg       (idu_rtu_pst_dis_inst0_rel_preg      ),
  .idu_rtu_pst_dis_inst0_rel_vreg       (idu_rtu_pst_dis_inst0_rel_vreg      ),
  .idu_rtu_pst_dis_inst0_vreg           (idu_rtu_pst_dis_inst0_vreg          ),
  .idu_rtu_pst_dis_inst0_vreg_iid       (idu_rtu_pst_dis_inst0_vreg_iid      ),
  .idu_rtu_pst_dis_inst0_vreg_vld       (idu_rtu_pst_dis_inst0_vreg_vld      ),
  .idu_rtu_pst_dis_inst1_dst_reg        (idu_rtu_pst_dis_inst1_dst_reg       ),
  .idu_rtu_pst_dis_inst1_dstv_reg       (idu_rtu_pst_dis_inst1_dstv_reg      ),
  .idu_rtu_pst_dis_inst1_ereg           (idu_rtu_pst_dis_inst1_ereg          ),
  .idu_rtu_pst_dis_inst1_ereg_iid       (idu_rtu_pst_dis_inst1_ereg_iid      ),
  .idu_rtu_pst_dis_inst1_ereg_vld       (idu_rtu_pst_dis_inst1_ereg_vld      ),
  .idu_rtu_pst_dis_inst1_freg_vld       (idu_rtu_pst_dis_inst1_freg_vld      ),
  .idu_rtu_pst_dis_inst1_preg           (idu_rtu_pst_dis_inst1_preg          ),
  .idu_rtu_pst_dis_inst1_preg_iid       (idu_rtu_pst_dis_inst1_preg_iid      ),
  .idu_rtu_pst_dis_inst1_preg_vld       (idu_rtu_pst_dis_inst1_preg_vld      ),
  .idu_rtu_pst_dis_inst1_rel_ereg       (idu_rtu_pst_dis_inst1_rel_ereg      ),
  .idu_rtu_pst_dis_inst1_rel_preg       (idu_rtu_pst_dis_inst1_rel_preg      ),
  .idu_rtu_pst_dis_inst1_rel_vreg       (idu_rtu_pst_dis_inst1_rel_vreg      ),
  .idu_rtu_pst_dis_inst1_vreg           (idu_rtu_pst_dis_inst1_vreg          ),
  .idu_rtu_pst_dis_inst1_vreg_iid       (idu_rtu_pst_dis_inst1_vreg_iid      ),
  .idu_rtu_pst_dis_inst1_vreg_vld       (idu_rtu_pst_dis_inst1_vreg_vld      ),
  .idu_rtu_pst_dis_inst2_dst_reg        (idu_rtu_pst_dis_inst2_dst_reg       ),
  .idu_rtu_pst_dis_inst2_dstv_reg       (idu_rtu_pst_dis_inst2_dstv_reg      ),
  .idu_rtu_pst_dis_inst2_ereg           (idu_rtu_pst_dis_inst2_ereg          ),
  .idu_rtu_pst_dis_inst2_ereg_iid       (idu_rtu_pst_dis_inst2_ereg_iid      ),
  .idu_rtu_pst_dis_inst2_ereg_vld       (idu_rtu_pst_dis_inst2_ereg_vld      ),
  .idu_rtu_pst_dis_inst2_freg_vld       (idu_rtu_pst_dis_inst2_freg_vld      ),
  .idu_rtu_pst_dis_inst2_preg           (idu_rtu_pst_dis_inst2_preg          ),
  .idu_rtu_pst_dis_inst2_preg_iid       (idu_rtu_pst_dis_inst2_preg_iid      ),
  .idu_rtu_pst_dis_inst2_preg_vld       (idu_rtu_pst_dis_inst2_preg_vld      ),
  .idu_rtu_pst_dis_inst2_rel_ereg       (idu_rtu_pst_dis_inst2_rel_ereg      ),
  .idu_rtu_pst_dis_inst2_rel_preg       (idu_rtu_pst_dis_inst2_rel_preg      ),
  .idu_rtu_pst_dis_inst2_rel_vreg       (idu_rtu_pst_dis_inst2_rel_vreg      ),
  .idu_rtu_pst_dis_inst2_vreg           (idu_rtu_pst_dis_inst2_vreg          ),
  .idu_rtu_pst_dis_inst2_vreg_iid       (idu_rtu_pst_dis_inst2_vreg_iid      ),
  .idu_rtu_pst_dis_inst2_vreg_vld       (idu_rtu_pst_dis_inst2_vreg_vld      ),
  .idu_rtu_pst_dis_inst3_dst_reg        (idu_rtu_pst_dis_inst3_dst_reg       ),
  .idu_rtu_pst_dis_inst3_dstv_reg       (idu_rtu_pst_dis_inst3_dstv_reg      ),
  .idu_rtu_pst_dis_inst3_ereg           (idu_rtu_pst_dis_inst3_ereg          ),
  .idu_rtu_pst_dis_inst3_ereg_iid       (idu_rtu_pst_dis_inst3_ereg_iid      ),
  .idu_rtu_pst_dis_inst3_ereg_vld       (idu_rtu_pst_dis_inst3_ereg_vld      ),
  .idu_rtu_pst_dis_inst3_freg_vld       (idu_rtu_pst_dis_inst3_freg_vld      ),
  .idu_rtu_pst_dis_inst3_preg           (idu_rtu_pst_dis_inst3_preg          ),
  .idu_rtu_pst_dis_inst3_preg_iid       (idu_rtu_pst_dis_inst3_preg_iid      ),
  .idu_rtu_pst_dis_inst3_preg_vld       (idu_rtu_pst_dis_inst3_preg_vld      ),
  .idu_rtu_pst_dis_inst3_rel_ereg       (idu_rtu_pst_dis_inst3_rel_ereg      ),
  .idu_rtu_pst_dis_inst3_rel_preg       (idu_rtu_pst_dis_inst3_rel_preg      ),
  .idu_rtu_pst_dis_inst3_rel_vreg       (idu_rtu_pst_dis_inst3_rel_vreg      ),
  .idu_rtu_pst_dis_inst3_vreg           (idu_rtu_pst_dis_inst3_vreg          ),
  .idu_rtu_pst_dis_inst3_vreg_iid       (idu_rtu_pst_dis_inst3_vreg_iid      ),
  .idu_rtu_pst_dis_inst3_vreg_vld       (idu_rtu_pst_dis_inst3_vreg_vld      ),
  .idu_rtu_pst_freg_dealloc_mask        (idu_rtu_pst_freg_dealloc_mask       ),
  .idu_rtu_pst_preg_dealloc_mask        (idu_rtu_pst_preg_dealloc_mask       ),
  .idu_rtu_pst_vreg_dealloc_mask        (idu_rtu_pst_vreg_dealloc_mask       ),
  .idu_rtu_rob_create0_data             (idu_rtu_rob_create0_data            ),
  .idu_rtu_rob_create0_dp_en            (idu_rtu_rob_create0_dp_en           ),
  .idu_rtu_rob_create0_en               (idu_rtu_rob_create0_en              ),
  .idu_rtu_rob_create0_gateclk_en       (idu_rtu_rob_create0_gateclk_en      ),
  .idu_rtu_rob_create1_data             (idu_rtu_rob_create1_data            ),
  .idu_rtu_rob_create1_dp_en            (idu_rtu_rob_create1_dp_en           ),
  .idu_rtu_rob_create1_en               (idu_rtu_rob_create1_en              ),
  .idu_rtu_rob_create1_gateclk_en       (idu_rtu_rob_create1_gateclk_en      ),
  .idu_rtu_rob_create2_data             (idu_rtu_rob_create2_data            ),
  .idu_rtu_rob_create2_dp_en            (idu_rtu_rob_create2_dp_en           ),
  .idu_rtu_rob_create2_en               (idu_rtu_rob_create2_en              ),
  .idu_rtu_rob_create2_gateclk_en       (idu_rtu_rob_create2_gateclk_en      ),
  .idu_rtu_rob_create3_data             (idu_rtu_rob_create3_data            ),
  .idu_rtu_rob_create3_dp_en            (idu_rtu_rob_create3_dp_en           ),
  .idu_rtu_rob_create3_en               (idu_rtu_rob_create3_en              ),
  .idu_rtu_rob_create3_gateclk_en       (idu_rtu_rob_create3_gateclk_en      ),
  .ifu_rtu_cur_pc                       (ifu_rtu_cur_pc                      ),
  .ifu_rtu_cur_pc_load                  (ifu_rtu_cur_pc_load                 ),
  .ifu_xx_sync_reset                    (ifu_xx_sync_reset                   ),
  .iu_rtu_ex2_pipe0_wb_preg_expand      (iu_rtu_ex2_pipe0_wb_preg_expand     ),
  .iu_rtu_ex2_pipe0_wb_preg_vld         (iu_rtu_ex2_pipe0_wb_preg_vld        ),
  .iu_rtu_ex2_pipe1_wb_preg_expand      (iu_rtu_ex2_pipe1_wb_preg_expand     ),
  .iu_rtu_ex2_pipe1_wb_preg_vld         (iu_rtu_ex2_pipe1_wb_preg_vld        ),
  .iu_rtu_pcfifo_pop0_data              (iu_rtu_pcfifo_pop0_data             ),
  .iu_rtu_pcfifo_pop1_data              (iu_rtu_pcfifo_pop1_data             ),
  .iu_rtu_pcfifo_pop2_data              (iu_rtu_pcfifo_pop2_data             ),
  .iu_rtu_pipe0_abnormal                (iu_rtu_pipe0_abnormal               ),
  .iu_rtu_pipe0_bkpt                    (iu_rtu_pipe0_bkpt                   ),
  .iu_rtu_pipe0_cmplt                   (iu_rtu_pipe0_cmplt                  ),
  .iu_rtu_pipe0_efpc                    (iu_rtu_pipe0_efpc                   ),
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
  .iu_rtu_pipe1_cmplt                   (iu_rtu_pipe1_cmplt                  ),
  .iu_rtu_pipe1_iid                     (iu_rtu_pipe1_iid                    ),
  .iu_rtu_pipe2_abnormal                (iu_rtu_pipe2_abnormal               ),
  .iu_rtu_pipe2_bht_mispred             (iu_rtu_pipe2_bht_mispred            ),
  .iu_rtu_pipe2_cmplt                   (iu_rtu_pipe2_cmplt                  ),
  .iu_rtu_pipe2_iid                     (iu_rtu_pipe2_iid                    ),
  .iu_rtu_pipe2_jmp_mispred             (iu_rtu_pipe2_jmp_mispred            ),
  .lsu_rtu_all_commit_data_vld          (lsu_rtu_all_commit_data_vld         ),
  .lsu_rtu_async_expt_addr              (lsu_rtu_async_expt_addr             ),
  .lsu_rtu_async_expt_vld               (lsu_rtu_async_expt_vld              ),
  .lsu_rtu_ctc_flush_vld                (lsu_rtu_ctc_flush_vld               ),
  .lsu_rtu_da_pipe3_split_spec_fail_iid (lsu_rtu_da_pipe3_split_spec_fail_iid),
  .lsu_rtu_da_pipe3_split_spec_fail_vld (lsu_rtu_da_pipe3_split_spec_fail_vld),
  .lsu_rtu_da_pipe4_split_spec_fail_iid (lsu_rtu_da_pipe4_split_spec_fail_iid),
  .lsu_rtu_da_pipe4_split_spec_fail_vld (lsu_rtu_da_pipe4_split_spec_fail_vld),
  .lsu_rtu_wb_pipe3_abnormal            (lsu_rtu_wb_pipe3_abnormal           ),
  .lsu_rtu_wb_pipe3_bkpta_data          (lsu_rtu_wb_pipe3_bkpta_data         ),
  .lsu_rtu_wb_pipe3_bkptb_data          (lsu_rtu_wb_pipe3_bkptb_data         ),
  .lsu_rtu_wb_pipe3_cmplt               (lsu_rtu_wb_pipe3_cmplt              ),
  .lsu_rtu_wb_pipe3_expt_vec            (lsu_rtu_wb_pipe3_expt_vec           ),
  .lsu_rtu_wb_pipe3_expt_vld            (lsu_rtu_wb_pipe3_expt_vld           ),
  .lsu_rtu_wb_pipe3_flush               (lsu_rtu_wb_pipe3_flush              ),
  .lsu_rtu_wb_pipe3_iid                 (lsu_rtu_wb_pipe3_iid                ),
  .lsu_rtu_wb_pipe3_mtval               (lsu_rtu_wb_pipe3_mtval              ),
  .lsu_rtu_wb_pipe3_no_spec_hit         (lsu_rtu_wb_pipe3_no_spec_hit        ),
  .lsu_rtu_wb_pipe3_no_spec_mispred     (lsu_rtu_wb_pipe3_no_spec_mispred    ),
  .lsu_rtu_wb_pipe3_no_spec_miss        (lsu_rtu_wb_pipe3_no_spec_miss       ),
  .lsu_rtu_wb_pipe3_spec_fail           (lsu_rtu_wb_pipe3_spec_fail          ),
  .lsu_rtu_wb_pipe3_vsetvl              (lsu_rtu_wb_pipe3_vsetvl             ),
  .lsu_rtu_wb_pipe3_vstart              (lsu_rtu_wb_pipe3_vstart             ),
  .lsu_rtu_wb_pipe3_vstart_vld          (lsu_rtu_wb_pipe3_vstart_vld         ),
  .lsu_rtu_wb_pipe3_wb_preg_expand      (lsu_rtu_wb_pipe3_wb_preg_expand     ),
  .lsu_rtu_wb_pipe3_wb_preg_vld         (lsu_rtu_wb_pipe3_wb_preg_vld        ),
  .lsu_rtu_wb_pipe3_wb_vreg_expand      (lsu_rtu_wb_pipe3_wb_vreg_expand     ),
  .lsu_rtu_wb_pipe3_wb_vreg_fr_vld      (lsu_rtu_wb_pipe3_wb_vreg_fr_vld     ),
  .lsu_rtu_wb_pipe3_wb_vreg_vr_vld      (lsu_rtu_wb_pipe3_wb_vreg_vr_vld     ),
  .lsu_rtu_wb_pipe4_abnormal            (lsu_rtu_wb_pipe4_abnormal           ),
  .lsu_rtu_wb_pipe4_bkpta_data          (lsu_rtu_wb_pipe4_bkpta_data         ),
  .lsu_rtu_wb_pipe4_bkptb_data          (lsu_rtu_wb_pipe4_bkptb_data         ),
  .lsu_rtu_wb_pipe4_cmplt               (lsu_rtu_wb_pipe4_cmplt              ),
  .lsu_rtu_wb_pipe4_expt_vec            (lsu_rtu_wb_pipe4_expt_vec           ),
  .lsu_rtu_wb_pipe4_expt_vld            (lsu_rtu_wb_pipe4_expt_vld           ),
  .lsu_rtu_wb_pipe4_flush               (lsu_rtu_wb_pipe4_flush              ),
  .lsu_rtu_wb_pipe4_iid                 (lsu_rtu_wb_pipe4_iid                ),
  .lsu_rtu_wb_pipe4_mtval               (lsu_rtu_wb_pipe4_mtval              ),
  .lsu_rtu_wb_pipe4_no_spec_hit         (lsu_rtu_wb_pipe4_no_spec_hit        ),
  .lsu_rtu_wb_pipe4_no_spec_mispred     (lsu_rtu_wb_pipe4_no_spec_mispred    ),
  .lsu_rtu_wb_pipe4_no_spec_miss        (lsu_rtu_wb_pipe4_no_spec_miss       ),
  .lsu_rtu_wb_pipe4_spec_fail           (lsu_rtu_wb_pipe4_spec_fail          ),
  .lsu_rtu_wb_pipe4_vstart              (lsu_rtu_wb_pipe4_vstart             ),
  .lsu_rtu_wb_pipe4_vstart_vld          (lsu_rtu_wb_pipe4_vstart_vld         ),
  .mmu_xx_mmu_en                        (mmu_xx_mmu_en                       ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_cp0_epc                          (rtu_cp0_epc                         ),
  .rtu_cp0_expt_gateclk_vld             (rtu_cp0_expt_gateclk_vld            ),
  .rtu_cp0_expt_mtval                   (rtu_cp0_expt_mtval                  ),
  .rtu_cp0_expt_vld                     (rtu_cp0_expt_vld                    ),
  .rtu_cp0_fp_dirty_vld                 (rtu_cp0_fp_dirty_vld                ),
  .rtu_cp0_int_ack                      (rtu_cp0_int_ack                     ),
  .rtu_cp0_vec_dirty_vld                (rtu_cp0_vec_dirty_vld               ),
  .rtu_cp0_vsetvl_vill                  (rtu_cp0_vsetvl_vill                 ),
  .rtu_cp0_vsetvl_vl                    (rtu_cp0_vsetvl_vl                   ),
  .rtu_cp0_vsetvl_vl_vld                (rtu_cp0_vsetvl_vl_vld               ),
  .rtu_cp0_vsetvl_vlmul                 (rtu_cp0_vsetvl_vlmul                ),
  .rtu_cp0_vsetvl_vsew                  (rtu_cp0_vsetvl_vsew                 ),
  .rtu_cp0_vsetvl_vtype_vld             (rtu_cp0_vsetvl_vtype_vld            ),
  .rtu_cp0_vstart                       (rtu_cp0_vstart                      ),
  .rtu_cp0_vstart_vld                   (rtu_cp0_vstart_vld                  ),
  .rtu_cpu_no_retire                    (rtu_cpu_no_retire                   ),
  .rtu_had_bkpt_data_st                 (rtu_had_bkpt_data_st                ),
  .rtu_had_data_bkpta_vld               (rtu_had_data_bkpta_vld              ),
  .rtu_had_data_bkptb_vld               (rtu_had_data_bkptb_vld              ),
  .rtu_had_dbg_ack_info                 (rtu_had_dbg_ack_info                ),
  .rtu_had_dbgreq_ack                   (rtu_had_dbgreq_ack                  ),
  .rtu_had_debug_info                   (rtu_had_debug_info                  ),
  .rtu_had_inst0_bkpt_inst              (rtu_had_inst0_bkpt_inst             ),
  .rtu_had_inst0_non_irv_bkpt           (rtu_had_inst0_non_irv_bkpt          ),
  .rtu_had_inst1_non_irv_bkpt           (rtu_had_inst1_non_irv_bkpt          ),
  .rtu_had_inst2_non_irv_bkpt           (rtu_had_inst2_non_irv_bkpt          ),
  .rtu_had_inst_bkpt_inst_vld           (rtu_had_inst_bkpt_inst_vld          ),
  .rtu_had_inst_bkpta_vld               (rtu_had_inst_bkpta_vld              ),
  .rtu_had_inst_bkptb_vld               (rtu_had_inst_bkptb_vld              ),
  .rtu_had_inst_exe_dead                (rtu_had_inst_exe_dead               ),
  .rtu_had_inst_not_wb                  (rtu_had_inst_not_wb                 ),
  .rtu_had_inst_split                   (rtu_had_inst_split                  ),
  .rtu_had_retire_inst0_info            (rtu_had_retire_inst0_info           ),
  .rtu_had_retire_inst0_vld             (rtu_had_retire_inst0_vld            ),
  .rtu_had_retire_inst1_info            (rtu_had_retire_inst1_info           ),
  .rtu_had_retire_inst1_vld             (rtu_had_retire_inst1_vld            ),
  .rtu_had_retire_inst2_info            (rtu_had_retire_inst2_info           ),
  .rtu_had_retire_inst2_vld             (rtu_had_retire_inst2_vld            ),
  .rtu_had_rob_empty                    (rtu_had_rob_empty                   ),
  .rtu_had_xx_dbg_ack_pc                (rtu_had_xx_dbg_ack_pc               ),
  .rtu_had_xx_mbkpt_chgflow             (rtu_had_xx_mbkpt_chgflow            ),
  .rtu_had_xx_mbkpt_data_ack            (rtu_had_xx_mbkpt_data_ack           ),
  .rtu_had_xx_mbkpt_inst_ack            (rtu_had_xx_mbkpt_inst_ack           ),
  .rtu_had_xx_pc                        (rtu_had_xx_pc                       ),
  .rtu_had_xx_pcfifo_inst0_chgflow      (rtu_had_xx_pcfifo_inst0_chgflow     ),
  .rtu_had_xx_pcfifo_inst0_condbr       (rtu_had_xx_pcfifo_inst0_condbr      ),
  .rtu_had_xx_pcfifo_inst0_condbr_taken (rtu_had_xx_pcfifo_inst0_condbr_taken),
  .rtu_had_xx_pcfifo_inst0_iid          (rtu_had_xx_pcfifo_inst0_iid         ),
  .rtu_had_xx_pcfifo_inst0_jmp          (rtu_had_xx_pcfifo_inst0_jmp         ),
  .rtu_had_xx_pcfifo_inst0_next_pc      (rtu_had_xx_pcfifo_inst0_next_pc     ),
  .rtu_had_xx_pcfifo_inst0_pcall        (rtu_had_xx_pcfifo_inst0_pcall       ),
  .rtu_had_xx_pcfifo_inst0_preturn      (rtu_had_xx_pcfifo_inst0_preturn     ),
  .rtu_had_xx_pcfifo_inst1_chgflow      (rtu_had_xx_pcfifo_inst1_chgflow     ),
  .rtu_had_xx_pcfifo_inst1_condbr       (rtu_had_xx_pcfifo_inst1_condbr      ),
  .rtu_had_xx_pcfifo_inst1_condbr_taken (rtu_had_xx_pcfifo_inst1_condbr_taken),
  .rtu_had_xx_pcfifo_inst1_jmp          (rtu_had_xx_pcfifo_inst1_jmp         ),
  .rtu_had_xx_pcfifo_inst1_next_pc      (rtu_had_xx_pcfifo_inst1_next_pc     ),
  .rtu_had_xx_pcfifo_inst1_pcall        (rtu_had_xx_pcfifo_inst1_pcall       ),
  .rtu_had_xx_pcfifo_inst1_preturn      (rtu_had_xx_pcfifo_inst1_preturn     ),
  .rtu_had_xx_pcfifo_inst2_chgflow      (rtu_had_xx_pcfifo_inst2_chgflow     ),
  .rtu_had_xx_pcfifo_inst2_condbr       (rtu_had_xx_pcfifo_inst2_condbr      ),
  .rtu_had_xx_pcfifo_inst2_condbr_taken (rtu_had_xx_pcfifo_inst2_condbr_taken),
  .rtu_had_xx_pcfifo_inst2_jmp          (rtu_had_xx_pcfifo_inst2_jmp         ),
  .rtu_had_xx_pcfifo_inst2_next_pc      (rtu_had_xx_pcfifo_inst2_next_pc     ),
  .rtu_had_xx_pcfifo_inst2_pcall        (rtu_had_xx_pcfifo_inst2_pcall       ),
  .rtu_had_xx_pcfifo_inst2_preturn      (rtu_had_xx_pcfifo_inst2_preturn     ),
  .rtu_had_xx_split_inst                (rtu_had_xx_split_inst               ),
  .rtu_hpcp_inst0_ack_int               (rtu_hpcp_inst0_ack_int              ),
  .rtu_hpcp_inst0_bht_mispred           (rtu_hpcp_inst0_bht_mispred          ),
  .rtu_hpcp_inst0_condbr                (rtu_hpcp_inst0_condbr               ),
  .rtu_hpcp_inst0_cur_pc                (rtu_hpcp_inst0_cur_pc               ),
  .rtu_hpcp_inst0_jmp                   (rtu_hpcp_inst0_jmp                  ),
  .rtu_hpcp_inst0_jmp_mispred           (rtu_hpcp_inst0_jmp_mispred          ),
  .rtu_hpcp_inst0_jmp_pc_offset_8m      (rtu_hpcp_inst0_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst0_num                   (rtu_hpcp_inst0_num                  ),
  .rtu_hpcp_inst0_pc_offset             (rtu_hpcp_inst0_pc_offset            ),
  .rtu_hpcp_inst0_spec_fail             (rtu_hpcp_inst0_spec_fail            ),
  .rtu_hpcp_inst0_split                 (rtu_hpcp_inst0_split                ),
  .rtu_hpcp_inst0_store                 (rtu_hpcp_inst0_store                ),
  .rtu_hpcp_inst0_vld                   (rtu_hpcp_inst0_vld                  ),
  .rtu_hpcp_inst1_condbr                (rtu_hpcp_inst1_condbr               ),
  .rtu_hpcp_inst1_cur_pc                (rtu_hpcp_inst1_cur_pc               ),
  .rtu_hpcp_inst1_jmp                   (rtu_hpcp_inst1_jmp                  ),
  .rtu_hpcp_inst1_jmp_pc_offset_8m      (rtu_hpcp_inst1_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst1_num                   (rtu_hpcp_inst1_num                  ),
  .rtu_hpcp_inst1_pc_offset             (rtu_hpcp_inst1_pc_offset            ),
  .rtu_hpcp_inst1_split                 (rtu_hpcp_inst1_split                ),
  .rtu_hpcp_inst1_store                 (rtu_hpcp_inst1_store                ),
  .rtu_hpcp_inst1_vld                   (rtu_hpcp_inst1_vld                  ),
  .rtu_hpcp_inst2_condbr                (rtu_hpcp_inst2_condbr               ),
  .rtu_hpcp_inst2_cur_pc                (rtu_hpcp_inst2_cur_pc               ),
  .rtu_hpcp_inst2_jmp                   (rtu_hpcp_inst2_jmp                  ),
  .rtu_hpcp_inst2_jmp_pc_offset_8m      (rtu_hpcp_inst2_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst2_num                   (rtu_hpcp_inst2_num                  ),
  .rtu_hpcp_inst2_pc_offset             (rtu_hpcp_inst2_pc_offset            ),
  .rtu_hpcp_inst2_split                 (rtu_hpcp_inst2_split                ),
  .rtu_hpcp_inst2_store                 (rtu_hpcp_inst2_store                ),
  .rtu_hpcp_inst2_vld                   (rtu_hpcp_inst2_vld                  ),
  .rtu_hpcp_trace_inst0_chgflow         (rtu_hpcp_trace_inst0_chgflow        ),
  .rtu_hpcp_trace_inst0_next_pc         (rtu_hpcp_trace_inst0_next_pc        ),
  .rtu_hpcp_trace_inst1_chgflow         (rtu_hpcp_trace_inst1_chgflow        ),
  .rtu_hpcp_trace_inst1_next_pc         (rtu_hpcp_trace_inst1_next_pc        ),
  .rtu_hpcp_trace_inst2_chgflow         (rtu_hpcp_trace_inst2_chgflow        ),
  .rtu_hpcp_trace_inst2_next_pc         (rtu_hpcp_trace_inst2_next_pc        ),
  .rtu_idu_alloc_ereg0                  (rtu_idu_alloc_ereg0                 ),
  .rtu_idu_alloc_ereg0_vld              (rtu_idu_alloc_ereg0_vld             ),
  .rtu_idu_alloc_ereg1                  (rtu_idu_alloc_ereg1                 ),
  .rtu_idu_alloc_ereg1_vld              (rtu_idu_alloc_ereg1_vld             ),
  .rtu_idu_alloc_ereg2                  (rtu_idu_alloc_ereg2                 ),
  .rtu_idu_alloc_ereg2_vld              (rtu_idu_alloc_ereg2_vld             ),
  .rtu_idu_alloc_ereg3                  (rtu_idu_alloc_ereg3                 ),
  .rtu_idu_alloc_ereg3_vld              (rtu_idu_alloc_ereg3_vld             ),
  .rtu_idu_alloc_freg0                  (rtu_idu_alloc_freg0                 ),
  .rtu_idu_alloc_freg0_vld              (rtu_idu_alloc_freg0_vld             ),
  .rtu_idu_alloc_freg1                  (rtu_idu_alloc_freg1                 ),
  .rtu_idu_alloc_freg1_vld              (rtu_idu_alloc_freg1_vld             ),
  .rtu_idu_alloc_freg2                  (rtu_idu_alloc_freg2                 ),
  .rtu_idu_alloc_freg2_vld              (rtu_idu_alloc_freg2_vld             ),
  .rtu_idu_alloc_freg3                  (rtu_idu_alloc_freg3                 ),
  .rtu_idu_alloc_freg3_vld              (rtu_idu_alloc_freg3_vld             ),
  .rtu_idu_alloc_preg0                  (rtu_idu_alloc_preg0                 ),
  .rtu_idu_alloc_preg0_vld              (rtu_idu_alloc_preg0_vld             ),
  .rtu_idu_alloc_preg1                  (rtu_idu_alloc_preg1                 ),
  .rtu_idu_alloc_preg1_vld              (rtu_idu_alloc_preg1_vld             ),
  .rtu_idu_alloc_preg2                  (rtu_idu_alloc_preg2                 ),
  .rtu_idu_alloc_preg2_vld              (rtu_idu_alloc_preg2_vld             ),
  .rtu_idu_alloc_preg3                  (rtu_idu_alloc_preg3                 ),
  .rtu_idu_alloc_preg3_vld              (rtu_idu_alloc_preg3_vld             ),
  .rtu_idu_alloc_vreg0                  (rtu_idu_alloc_vreg0                 ),
  .rtu_idu_alloc_vreg0_vld              (rtu_idu_alloc_vreg0_vld             ),
  .rtu_idu_alloc_vreg1                  (rtu_idu_alloc_vreg1                 ),
  .rtu_idu_alloc_vreg1_vld              (rtu_idu_alloc_vreg1_vld             ),
  .rtu_idu_alloc_vreg2                  (rtu_idu_alloc_vreg2                 ),
  .rtu_idu_alloc_vreg2_vld              (rtu_idu_alloc_vreg2_vld             ),
  .rtu_idu_alloc_vreg3                  (rtu_idu_alloc_vreg3                 ),
  .rtu_idu_alloc_vreg3_vld              (rtu_idu_alloc_vreg3_vld             ),
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
  .rtu_idu_flush_stall                  (rtu_idu_flush_stall                 ),
  .rtu_idu_pst_empty                    (rtu_idu_pst_empty                   ),
  .rtu_idu_pst_ereg_retired_released_wb (rtu_idu_pst_ereg_retired_released_wb),
  .rtu_idu_retire0_inst_vld             (rtu_idu_retire0_inst_vld            ),
  .rtu_idu_retire_int_vld               (rtu_idu_retire_int_vld              ),
  .rtu_idu_rob_empty                    (rtu_idu_rob_empty                   ),
  .rtu_idu_rob_full                     (rtu_idu_rob_full                    ),
  .rtu_idu_rob_inst0_iid                (rtu_idu_rob_inst0_iid               ),
  .rtu_idu_rob_inst1_iid                (rtu_idu_rob_inst1_iid               ),
  .rtu_idu_rob_inst2_iid                (rtu_idu_rob_inst2_iid               ),
  .rtu_idu_rob_inst3_iid                (rtu_idu_rob_inst3_iid               ),
  .rtu_idu_rt_recover_ereg              (rtu_idu_rt_recover_ereg             ),
  .rtu_idu_rt_recover_freg              (rtu_idu_rt_recover_freg             ),
  .rtu_idu_rt_recover_preg              (rtu_idu_rt_recover_preg             ),
  .rtu_idu_rt_recover_vreg              (rtu_idu_rt_recover_vreg             ),
  .rtu_idu_srt_en                       (rtu_idu_srt_en                      ),
  .rtu_ifu_chgflw_pc                    (rtu_ifu_chgflw_pc                   ),
  .rtu_ifu_chgflw_vld                   (rtu_ifu_chgflw_vld                  ),
  .rtu_ifu_flush                        (rtu_ifu_flush                       ),
  .rtu_ifu_retire0_chk_idx              (rtu_ifu_retire0_chk_idx             ),
  .rtu_ifu_retire0_condbr               (rtu_ifu_retire0_condbr              ),
  .rtu_ifu_retire0_condbr_taken         (rtu_ifu_retire0_condbr_taken        ),
  .rtu_ifu_retire0_inc_pc               (rtu_ifu_retire0_inc_pc              ),
  .rtu_ifu_retire0_jmp                  (rtu_ifu_retire0_jmp                 ),
  .rtu_ifu_retire0_jmp_mispred          (rtu_ifu_retire0_jmp_mispred         ),
  .rtu_ifu_retire0_mispred              (rtu_ifu_retire0_mispred             ),
  .rtu_ifu_retire0_next_pc              (rtu_ifu_retire0_next_pc             ),
  .rtu_ifu_retire0_pcall                (rtu_ifu_retire0_pcall               ),
  .rtu_ifu_retire0_preturn              (rtu_ifu_retire0_preturn             ),
  .rtu_ifu_retire1_chk_idx              (rtu_ifu_retire1_chk_idx             ),
  .rtu_ifu_retire1_condbr               (rtu_ifu_retire1_condbr              ),
  .rtu_ifu_retire1_condbr_taken         (rtu_ifu_retire1_condbr_taken        ),
  .rtu_ifu_retire1_jmp                  (rtu_ifu_retire1_jmp                 ),
  .rtu_ifu_retire2_chk_idx              (rtu_ifu_retire2_chk_idx             ),
  .rtu_ifu_retire2_condbr               (rtu_ifu_retire2_condbr              ),
  .rtu_ifu_retire2_condbr_taken         (rtu_ifu_retire2_condbr_taken        ),
  .rtu_ifu_retire2_jmp                  (rtu_ifu_retire2_jmp                 ),
  .rtu_ifu_retire_inst0_cur_pc          (rtu_ifu_retire_inst0_cur_pc         ),
  .rtu_ifu_retire_inst0_load            (rtu_ifu_retire_inst0_load           ),
  .rtu_ifu_retire_inst0_no_spec_hit     (rtu_ifu_retire_inst0_no_spec_hit    ),
  .rtu_ifu_retire_inst0_no_spec_mispred (rtu_ifu_retire_inst0_no_spec_mispred),
  .rtu_ifu_retire_inst0_no_spec_miss    (rtu_ifu_retire_inst0_no_spec_miss   ),
  .rtu_ifu_retire_inst0_store           (rtu_ifu_retire_inst0_store          ),
  .rtu_ifu_retire_inst0_vl_hit          (rtu_ifu_retire_inst0_vl_hit         ),
  .rtu_ifu_retire_inst0_vl_mispred      (rtu_ifu_retire_inst0_vl_mispred     ),
  .rtu_ifu_retire_inst0_vl_miss         (rtu_ifu_retire_inst0_vl_miss        ),
  .rtu_ifu_retire_inst0_vl_pred         (rtu_ifu_retire_inst0_vl_pred        ),
  .rtu_ifu_retire_inst1_cur_pc          (rtu_ifu_retire_inst1_cur_pc         ),
  .rtu_ifu_retire_inst1_load            (rtu_ifu_retire_inst1_load           ),
  .rtu_ifu_retire_inst1_no_spec_hit     (rtu_ifu_retire_inst1_no_spec_hit    ),
  .rtu_ifu_retire_inst1_no_spec_mispred (rtu_ifu_retire_inst1_no_spec_mispred),
  .rtu_ifu_retire_inst1_no_spec_miss    (rtu_ifu_retire_inst1_no_spec_miss   ),
  .rtu_ifu_retire_inst1_store           (rtu_ifu_retire_inst1_store          ),
  .rtu_ifu_retire_inst1_vl_pred         (rtu_ifu_retire_inst1_vl_pred        ),
  .rtu_ifu_retire_inst2_cur_pc          (rtu_ifu_retire_inst2_cur_pc         ),
  .rtu_ifu_retire_inst2_load            (rtu_ifu_retire_inst2_load           ),
  .rtu_ifu_retire_inst2_no_spec_hit     (rtu_ifu_retire_inst2_no_spec_hit    ),
  .rtu_ifu_retire_inst2_no_spec_mispred (rtu_ifu_retire_inst2_no_spec_mispred),
  .rtu_ifu_retire_inst2_no_spec_miss    (rtu_ifu_retire_inst2_no_spec_miss   ),
  .rtu_ifu_retire_inst2_store           (rtu_ifu_retire_inst2_store          ),
  .rtu_ifu_retire_inst2_vl_pred         (rtu_ifu_retire_inst2_vl_pred        ),
  .rtu_ifu_xx_dbgon                     (rtu_ifu_xx_dbgon                    ),
  .rtu_ifu_xx_expt_vec                  (rtu_ifu_xx_expt_vec                 ),
  .rtu_ifu_xx_expt_vld                  (rtu_ifu_xx_expt_vld                 ),
  .rtu_iu_flush_chgflw_mask             (rtu_iu_flush_chgflw_mask            ),
  .rtu_iu_flush_fe                      (rtu_iu_flush_fe                     ),
  .rtu_iu_rob_read0_pcfifo_vld          (rtu_iu_rob_read0_pcfifo_vld         ),
  .rtu_iu_rob_read1_pcfifo_vld          (rtu_iu_rob_read1_pcfifo_vld         ),
  .rtu_iu_rob_read2_pcfifo_vld          (rtu_iu_rob_read2_pcfifo_vld         ),
  .rtu_iu_rob_read_pcfifo_gateclk_vld   (rtu_iu_rob_read_pcfifo_gateclk_vld  ),
  .rtu_lsu_async_flush                  (rtu_lsu_async_flush                 ),
  .rtu_lsu_commit0_iid_updt_val         (rtu_lsu_commit0_iid_updt_val        ),
  .rtu_lsu_commit1_iid_updt_val         (rtu_lsu_commit1_iid_updt_val        ),
  .rtu_lsu_commit2_iid_updt_val         (rtu_lsu_commit2_iid_updt_val        ),
  .rtu_lsu_eret_flush                   (rtu_lsu_eret_flush                  ),
  .rtu_lsu_expt_flush                   (rtu_lsu_expt_flush                  ),
  .rtu_lsu_spec_fail_flush              (rtu_lsu_spec_fail_flush             ),
  .rtu_lsu_spec_fail_iid                (rtu_lsu_spec_fail_iid               ),
  .rtu_mmu_bad_vpn                      (rtu_mmu_bad_vpn                     ),
  .rtu_mmu_expt_vld                     (rtu_mmu_expt_vld                    ),
  .rtu_pad_retire0                      (rtu_pad_retire0                     ),
  .rtu_pad_retire0_pc                   (rtu_pad_retire0_pc                  ),
  .rtu_pad_retire1                      (rtu_pad_retire1                     ),
  .rtu_pad_retire1_pc                   (rtu_pad_retire1_pc                  ),
  .rtu_pad_retire2                      (rtu_pad_retire2                     ),
  .rtu_pad_retire2_pc                   (rtu_pad_retire2_pc                  ),
  .rtu_yy_xx_commit0                    (rtu_yy_xx_commit0                   ),
  .rtu_yy_xx_commit0_iid                (rtu_yy_xx_commit0_iid               ),
  .rtu_yy_xx_commit1                    (rtu_yy_xx_commit1                   ),
  .rtu_yy_xx_commit1_iid                (rtu_yy_xx_commit1_iid               ),
  .rtu_yy_xx_commit2                    (rtu_yy_xx_commit2                   ),
  .rtu_yy_xx_commit2_iid                (rtu_yy_xx_commit2_iid               ),
  .rtu_yy_xx_dbgon                      (rtu_yy_xx_dbgon                     ),
  .rtu_yy_xx_expt_vec                   (rtu_yy_xx_expt_vec                  ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .rtu_yy_xx_retire0                    (rtu_yy_xx_retire0                   ),
  .rtu_yy_xx_retire0_normal             (rtu_yy_xx_retire0_normal            ),
  .rtu_yy_xx_retire1                    (rtu_yy_xx_retire1                   ),
  .rtu_yy_xx_retire2                    (rtu_yy_xx_retire2                   ),
  .vfpu_rtu_ex5_pipe6_ereg_wb_vld       (vfpu_rtu_ex5_pipe6_ereg_wb_vld      ),
  .vfpu_rtu_ex5_pipe6_wb_ereg           (vfpu_rtu_ex5_pipe6_wb_ereg          ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_expand    (vfpu_rtu_ex5_pipe6_wb_vreg_expand   ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld    (vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld   ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld    (vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld   ),
  .vfpu_rtu_ex5_pipe7_ereg_wb_vld       (vfpu_rtu_ex5_pipe7_ereg_wb_vld      ),
  .vfpu_rtu_ex5_pipe7_wb_ereg           (vfpu_rtu_ex5_pipe7_wb_ereg          ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_expand    (vfpu_rtu_ex5_pipe7_wb_vreg_expand   ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld    (vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld   ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld    (vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld   ),
  .vfpu_rtu_pipe6_cmplt                 (vfpu_rtu_pipe6_cmplt                ),
  .vfpu_rtu_pipe6_iid                   (vfpu_rtu_pipe6_iid                  ),
  .vfpu_rtu_pipe7_cmplt                 (vfpu_rtu_pipe7_cmplt                ),
  .vfpu_rtu_pipe7_iid                   (vfpu_rtu_pipe7_iid                  )
);

// &Connect(.cpurst_b   (idu_rst_b)); @88
//&Shell("../../../tools/scripts/delt_core_port");

// &ModuleEnd; @91
endmodule


