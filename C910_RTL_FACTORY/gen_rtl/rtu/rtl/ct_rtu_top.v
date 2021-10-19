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
module ct_rtu_top(
  cp0_rtu_icg_en,
  cp0_rtu_srt_en,
  cp0_rtu_xx_int_b,
  cp0_rtu_xx_vec,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
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
  had_yy_xx_exit_dbg,
  hpcp_rtu_cnt_en,
  idu_rtu_fence_idle,
  idu_rtu_ir_ereg0_alloc_vld,
  idu_rtu_ir_ereg1_alloc_vld,
  idu_rtu_ir_ereg2_alloc_vld,
  idu_rtu_ir_ereg3_alloc_vld,
  idu_rtu_ir_ereg_alloc_gateclk_vld,
  idu_rtu_ir_freg0_alloc_vld,
  idu_rtu_ir_freg1_alloc_vld,
  idu_rtu_ir_freg2_alloc_vld,
  idu_rtu_ir_freg3_alloc_vld,
  idu_rtu_ir_freg_alloc_gateclk_vld,
  idu_rtu_ir_preg0_alloc_vld,
  idu_rtu_ir_preg1_alloc_vld,
  idu_rtu_ir_preg2_alloc_vld,
  idu_rtu_ir_preg3_alloc_vld,
  idu_rtu_ir_preg_alloc_gateclk_vld,
  idu_rtu_ir_vreg0_alloc_vld,
  idu_rtu_ir_vreg1_alloc_vld,
  idu_rtu_ir_vreg2_alloc_vld,
  idu_rtu_ir_vreg3_alloc_vld,
  idu_rtu_ir_vreg_alloc_gateclk_vld,
  idu_rtu_pst_dis_inst0_dst_reg,
  idu_rtu_pst_dis_inst0_dstv_reg,
  idu_rtu_pst_dis_inst0_ereg,
  idu_rtu_pst_dis_inst0_ereg_iid,
  idu_rtu_pst_dis_inst0_ereg_vld,
  idu_rtu_pst_dis_inst0_freg_vld,
  idu_rtu_pst_dis_inst0_preg,
  idu_rtu_pst_dis_inst0_preg_iid,
  idu_rtu_pst_dis_inst0_preg_vld,
  idu_rtu_pst_dis_inst0_rel_ereg,
  idu_rtu_pst_dis_inst0_rel_preg,
  idu_rtu_pst_dis_inst0_rel_vreg,
  idu_rtu_pst_dis_inst0_vreg,
  idu_rtu_pst_dis_inst0_vreg_iid,
  idu_rtu_pst_dis_inst0_vreg_vld,
  idu_rtu_pst_dis_inst1_dst_reg,
  idu_rtu_pst_dis_inst1_dstv_reg,
  idu_rtu_pst_dis_inst1_ereg,
  idu_rtu_pst_dis_inst1_ereg_iid,
  idu_rtu_pst_dis_inst1_ereg_vld,
  idu_rtu_pst_dis_inst1_freg_vld,
  idu_rtu_pst_dis_inst1_preg,
  idu_rtu_pst_dis_inst1_preg_iid,
  idu_rtu_pst_dis_inst1_preg_vld,
  idu_rtu_pst_dis_inst1_rel_ereg,
  idu_rtu_pst_dis_inst1_rel_preg,
  idu_rtu_pst_dis_inst1_rel_vreg,
  idu_rtu_pst_dis_inst1_vreg,
  idu_rtu_pst_dis_inst1_vreg_iid,
  idu_rtu_pst_dis_inst1_vreg_vld,
  idu_rtu_pst_dis_inst2_dst_reg,
  idu_rtu_pst_dis_inst2_dstv_reg,
  idu_rtu_pst_dis_inst2_ereg,
  idu_rtu_pst_dis_inst2_ereg_iid,
  idu_rtu_pst_dis_inst2_ereg_vld,
  idu_rtu_pst_dis_inst2_freg_vld,
  idu_rtu_pst_dis_inst2_preg,
  idu_rtu_pst_dis_inst2_preg_iid,
  idu_rtu_pst_dis_inst2_preg_vld,
  idu_rtu_pst_dis_inst2_rel_ereg,
  idu_rtu_pst_dis_inst2_rel_preg,
  idu_rtu_pst_dis_inst2_rel_vreg,
  idu_rtu_pst_dis_inst2_vreg,
  idu_rtu_pst_dis_inst2_vreg_iid,
  idu_rtu_pst_dis_inst2_vreg_vld,
  idu_rtu_pst_dis_inst3_dst_reg,
  idu_rtu_pst_dis_inst3_dstv_reg,
  idu_rtu_pst_dis_inst3_ereg,
  idu_rtu_pst_dis_inst3_ereg_iid,
  idu_rtu_pst_dis_inst3_ereg_vld,
  idu_rtu_pst_dis_inst3_freg_vld,
  idu_rtu_pst_dis_inst3_preg,
  idu_rtu_pst_dis_inst3_preg_iid,
  idu_rtu_pst_dis_inst3_preg_vld,
  idu_rtu_pst_dis_inst3_rel_ereg,
  idu_rtu_pst_dis_inst3_rel_preg,
  idu_rtu_pst_dis_inst3_rel_vreg,
  idu_rtu_pst_dis_inst3_vreg,
  idu_rtu_pst_dis_inst3_vreg_iid,
  idu_rtu_pst_dis_inst3_vreg_vld,
  idu_rtu_pst_freg_dealloc_mask,
  idu_rtu_pst_preg_dealloc_mask,
  idu_rtu_pst_vreg_dealloc_mask,
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
  ifu_xx_sync_reset,
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
  lsu_rtu_all_commit_data_vld,
  lsu_rtu_async_expt_addr,
  lsu_rtu_async_expt_vld,
  lsu_rtu_ctc_flush_vld,
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
  lsu_rtu_wb_pipe3_wb_preg_expand,
  lsu_rtu_wb_pipe3_wb_preg_vld,
  lsu_rtu_wb_pipe3_wb_vreg_expand,
  lsu_rtu_wb_pipe3_wb_vreg_fr_vld,
  lsu_rtu_wb_pipe3_wb_vreg_vr_vld,
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
  mmu_xx_mmu_en,
  pad_yy_icg_scan_en,
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
  rtu_idu_alloc_ereg0,
  rtu_idu_alloc_ereg0_vld,
  rtu_idu_alloc_ereg1,
  rtu_idu_alloc_ereg1_vld,
  rtu_idu_alloc_ereg2,
  rtu_idu_alloc_ereg2_vld,
  rtu_idu_alloc_ereg3,
  rtu_idu_alloc_ereg3_vld,
  rtu_idu_alloc_freg0,
  rtu_idu_alloc_freg0_vld,
  rtu_idu_alloc_freg1,
  rtu_idu_alloc_freg1_vld,
  rtu_idu_alloc_freg2,
  rtu_idu_alloc_freg2_vld,
  rtu_idu_alloc_freg3,
  rtu_idu_alloc_freg3_vld,
  rtu_idu_alloc_preg0,
  rtu_idu_alloc_preg0_vld,
  rtu_idu_alloc_preg1,
  rtu_idu_alloc_preg1_vld,
  rtu_idu_alloc_preg2,
  rtu_idu_alloc_preg2_vld,
  rtu_idu_alloc_preg3,
  rtu_idu_alloc_preg3_vld,
  rtu_idu_alloc_vreg0,
  rtu_idu_alloc_vreg0_vld,
  rtu_idu_alloc_vreg1,
  rtu_idu_alloc_vreg1_vld,
  rtu_idu_alloc_vreg2,
  rtu_idu_alloc_vreg2_vld,
  rtu_idu_alloc_vreg3,
  rtu_idu_alloc_vreg3_vld,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  rtu_idu_flush_stall,
  rtu_idu_pst_empty,
  rtu_idu_pst_ereg_retired_released_wb,
  rtu_idu_retire0_inst_vld,
  rtu_idu_retire_int_vld,
  rtu_idu_rob_empty,
  rtu_idu_rob_full,
  rtu_idu_rob_inst0_iid,
  rtu_idu_rob_inst1_iid,
  rtu_idu_rob_inst2_iid,
  rtu_idu_rob_inst3_iid,
  rtu_idu_rt_recover_ereg,
  rtu_idu_rt_recover_freg,
  rtu_idu_rt_recover_preg,
  rtu_idu_rt_recover_vreg,
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
  rtu_iu_rob_read0_pcfifo_vld,
  rtu_iu_rob_read1_pcfifo_vld,
  rtu_iu_rob_read2_pcfifo_vld,
  rtu_iu_rob_read_pcfifo_gateclk_vld,
  rtu_lsu_async_flush,
  rtu_lsu_commit0_iid_updt_val,
  rtu_lsu_commit1_iid_updt_val,
  rtu_lsu_commit2_iid_updt_val,
  rtu_lsu_eret_flush,
  rtu_lsu_expt_flush,
  rtu_lsu_spec_fail_flush,
  rtu_lsu_spec_fail_iid,
  rtu_mmu_bad_vpn,
  rtu_mmu_expt_vld,
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
  rtu_yy_xx_dbgon,
  rtu_yy_xx_expt_vec,
  rtu_yy_xx_flush,
  rtu_yy_xx_retire0,
  rtu_yy_xx_retire0_normal,
  rtu_yy_xx_retire1,
  rtu_yy_xx_retire2,
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
input            cp0_rtu_icg_en;                      
input            cp0_rtu_srt_en;                      
input            cp0_rtu_xx_int_b;                    
input   [4  :0]  cp0_rtu_xx_vec;                      
input            cp0_yy_clk_en;                       
input            cpurst_b;                            
input            forever_cpuclk;                      
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
input            had_yy_xx_exit_dbg;                  
input            hpcp_rtu_cnt_en;                     
input            idu_rtu_fence_idle;                  
input            idu_rtu_ir_ereg0_alloc_vld;          
input            idu_rtu_ir_ereg1_alloc_vld;          
input            idu_rtu_ir_ereg2_alloc_vld;          
input            idu_rtu_ir_ereg3_alloc_vld;          
input            idu_rtu_ir_ereg_alloc_gateclk_vld;   
input            idu_rtu_ir_freg0_alloc_vld;          
input            idu_rtu_ir_freg1_alloc_vld;          
input            idu_rtu_ir_freg2_alloc_vld;          
input            idu_rtu_ir_freg3_alloc_vld;          
input            idu_rtu_ir_freg_alloc_gateclk_vld;   
input            idu_rtu_ir_preg0_alloc_vld;          
input            idu_rtu_ir_preg1_alloc_vld;          
input            idu_rtu_ir_preg2_alloc_vld;          
input            idu_rtu_ir_preg3_alloc_vld;          
input            idu_rtu_ir_preg_alloc_gateclk_vld;   
input            idu_rtu_ir_vreg0_alloc_vld;          
input            idu_rtu_ir_vreg1_alloc_vld;          
input            idu_rtu_ir_vreg2_alloc_vld;          
input            idu_rtu_ir_vreg3_alloc_vld;          
input            idu_rtu_ir_vreg_alloc_gateclk_vld;   
input   [4  :0]  idu_rtu_pst_dis_inst0_dst_reg;       
input   [4  :0]  idu_rtu_pst_dis_inst0_dstv_reg;      
input   [4  :0]  idu_rtu_pst_dis_inst0_ereg;          
input   [6  :0]  idu_rtu_pst_dis_inst0_ereg_iid;      
input            idu_rtu_pst_dis_inst0_ereg_vld;      
input            idu_rtu_pst_dis_inst0_freg_vld;      
input   [6  :0]  idu_rtu_pst_dis_inst0_preg;          
input   [6  :0]  idu_rtu_pst_dis_inst0_preg_iid;      
input            idu_rtu_pst_dis_inst0_preg_vld;      
input   [4  :0]  idu_rtu_pst_dis_inst0_rel_ereg;      
input   [6  :0]  idu_rtu_pst_dis_inst0_rel_preg;      
input   [5  :0]  idu_rtu_pst_dis_inst0_rel_vreg;      
input   [5  :0]  idu_rtu_pst_dis_inst0_vreg;          
input   [6  :0]  idu_rtu_pst_dis_inst0_vreg_iid;      
input            idu_rtu_pst_dis_inst0_vreg_vld;      
input   [4  :0]  idu_rtu_pst_dis_inst1_dst_reg;       
input   [4  :0]  idu_rtu_pst_dis_inst1_dstv_reg;      
input   [4  :0]  idu_rtu_pst_dis_inst1_ereg;          
input   [6  :0]  idu_rtu_pst_dis_inst1_ereg_iid;      
input            idu_rtu_pst_dis_inst1_ereg_vld;      
input            idu_rtu_pst_dis_inst1_freg_vld;      
input   [6  :0]  idu_rtu_pst_dis_inst1_preg;          
input   [6  :0]  idu_rtu_pst_dis_inst1_preg_iid;      
input            idu_rtu_pst_dis_inst1_preg_vld;      
input   [4  :0]  idu_rtu_pst_dis_inst1_rel_ereg;      
input   [6  :0]  idu_rtu_pst_dis_inst1_rel_preg;      
input   [5  :0]  idu_rtu_pst_dis_inst1_rel_vreg;      
input   [5  :0]  idu_rtu_pst_dis_inst1_vreg;          
input   [6  :0]  idu_rtu_pst_dis_inst1_vreg_iid;      
input            idu_rtu_pst_dis_inst1_vreg_vld;      
input   [4  :0]  idu_rtu_pst_dis_inst2_dst_reg;       
input   [4  :0]  idu_rtu_pst_dis_inst2_dstv_reg;      
input   [4  :0]  idu_rtu_pst_dis_inst2_ereg;          
input   [6  :0]  idu_rtu_pst_dis_inst2_ereg_iid;      
input            idu_rtu_pst_dis_inst2_ereg_vld;      
input            idu_rtu_pst_dis_inst2_freg_vld;      
input   [6  :0]  idu_rtu_pst_dis_inst2_preg;          
input   [6  :0]  idu_rtu_pst_dis_inst2_preg_iid;      
input            idu_rtu_pst_dis_inst2_preg_vld;      
input   [4  :0]  idu_rtu_pst_dis_inst2_rel_ereg;      
input   [6  :0]  idu_rtu_pst_dis_inst2_rel_preg;      
input   [5  :0]  idu_rtu_pst_dis_inst2_rel_vreg;      
input   [5  :0]  idu_rtu_pst_dis_inst2_vreg;          
input   [6  :0]  idu_rtu_pst_dis_inst2_vreg_iid;      
input            idu_rtu_pst_dis_inst2_vreg_vld;      
input   [4  :0]  idu_rtu_pst_dis_inst3_dst_reg;       
input   [4  :0]  idu_rtu_pst_dis_inst3_dstv_reg;      
input   [4  :0]  idu_rtu_pst_dis_inst3_ereg;          
input   [6  :0]  idu_rtu_pst_dis_inst3_ereg_iid;      
input            idu_rtu_pst_dis_inst3_ereg_vld;      
input            idu_rtu_pst_dis_inst3_freg_vld;      
input   [6  :0]  idu_rtu_pst_dis_inst3_preg;          
input   [6  :0]  idu_rtu_pst_dis_inst3_preg_iid;      
input            idu_rtu_pst_dis_inst3_preg_vld;      
input   [4  :0]  idu_rtu_pst_dis_inst3_rel_ereg;      
input   [6  :0]  idu_rtu_pst_dis_inst3_rel_preg;      
input   [5  :0]  idu_rtu_pst_dis_inst3_rel_vreg;      
input   [5  :0]  idu_rtu_pst_dis_inst3_vreg;          
input   [6  :0]  idu_rtu_pst_dis_inst3_vreg_iid;      
input            idu_rtu_pst_dis_inst3_vreg_vld;      
input   [63 :0]  idu_rtu_pst_freg_dealloc_mask;       
input   [95 :0]  idu_rtu_pst_preg_dealloc_mask;       
input   [63 :0]  idu_rtu_pst_vreg_dealloc_mask;       
input   [39 :0]  idu_rtu_rob_create0_data;            
input            idu_rtu_rob_create0_dp_en;           
input            idu_rtu_rob_create0_en;              
input            idu_rtu_rob_create0_gateclk_en;      
input   [39 :0]  idu_rtu_rob_create1_data;            
input            idu_rtu_rob_create1_dp_en;           
input            idu_rtu_rob_create1_en;              
input            idu_rtu_rob_create1_gateclk_en;      
input   [39 :0]  idu_rtu_rob_create2_data;            
input            idu_rtu_rob_create2_dp_en;           
input            idu_rtu_rob_create2_en;              
input            idu_rtu_rob_create2_gateclk_en;      
input   [39 :0]  idu_rtu_rob_create3_data;            
input            idu_rtu_rob_create3_dp_en;           
input            idu_rtu_rob_create3_en;              
input            idu_rtu_rob_create3_gateclk_en;      
input   [38 :0]  ifu_rtu_cur_pc;                      
input            ifu_rtu_cur_pc_load;                 
input            ifu_xx_sync_reset;                   
input   [95 :0]  iu_rtu_ex2_pipe0_wb_preg_expand;     
input            iu_rtu_ex2_pipe0_wb_preg_vld;        
input   [95 :0]  iu_rtu_ex2_pipe1_wb_preg_expand;     
input            iu_rtu_ex2_pipe1_wb_preg_vld;        
input   [47 :0]  iu_rtu_pcfifo_pop0_data;             
input   [47 :0]  iu_rtu_pcfifo_pop1_data;             
input   [47 :0]  iu_rtu_pcfifo_pop2_data;             
input            iu_rtu_pipe0_abnormal;               
input            iu_rtu_pipe0_bkpt;                   
input            iu_rtu_pipe0_cmplt;                  
input   [38 :0]  iu_rtu_pipe0_efpc;                   
input            iu_rtu_pipe0_efpc_vld;               
input   [4  :0]  iu_rtu_pipe0_expt_vec;               
input            iu_rtu_pipe0_expt_vld;               
input            iu_rtu_pipe0_flush;                  
input            iu_rtu_pipe0_high_hw_expt;           
input   [6  :0]  iu_rtu_pipe0_iid;                    
input            iu_rtu_pipe0_immu_expt;              
input   [31 :0]  iu_rtu_pipe0_mtval;                  
input            iu_rtu_pipe0_vsetvl;                 
input   [6  :0]  iu_rtu_pipe0_vstart;                 
input            iu_rtu_pipe0_vstart_vld;             
input            iu_rtu_pipe1_cmplt;                  
input   [6  :0]  iu_rtu_pipe1_iid;                    
input            iu_rtu_pipe2_abnormal;               
input            iu_rtu_pipe2_bht_mispred;            
input            iu_rtu_pipe2_cmplt;                  
input   [6  :0]  iu_rtu_pipe2_iid;                    
input            iu_rtu_pipe2_jmp_mispred;            
input            lsu_rtu_all_commit_data_vld;         
input   [39 :0]  lsu_rtu_async_expt_addr;             
input            lsu_rtu_async_expt_vld;              
input            lsu_rtu_ctc_flush_vld;               
input   [6  :0]  lsu_rtu_da_pipe3_split_spec_fail_iid; 
input            lsu_rtu_da_pipe3_split_spec_fail_vld; 
input   [6  :0]  lsu_rtu_da_pipe4_split_spec_fail_iid; 
input            lsu_rtu_da_pipe4_split_spec_fail_vld; 
input            lsu_rtu_wb_pipe3_abnormal;           
input            lsu_rtu_wb_pipe3_bkpta_data;         
input            lsu_rtu_wb_pipe3_bkptb_data;         
input            lsu_rtu_wb_pipe3_cmplt;              
input   [4  :0]  lsu_rtu_wb_pipe3_expt_vec;           
input            lsu_rtu_wb_pipe3_expt_vld;           
input            lsu_rtu_wb_pipe3_flush;              
input   [6  :0]  lsu_rtu_wb_pipe3_iid;                
input   [39 :0]  lsu_rtu_wb_pipe3_mtval;              
input            lsu_rtu_wb_pipe3_no_spec_hit;        
input            lsu_rtu_wb_pipe3_no_spec_mispred;    
input            lsu_rtu_wb_pipe3_no_spec_miss;       
input            lsu_rtu_wb_pipe3_spec_fail;          
input            lsu_rtu_wb_pipe3_vsetvl;             
input   [6  :0]  lsu_rtu_wb_pipe3_vstart;             
input            lsu_rtu_wb_pipe3_vstart_vld;         
input   [95 :0]  lsu_rtu_wb_pipe3_wb_preg_expand;     
input            lsu_rtu_wb_pipe3_wb_preg_vld;        
input   [63 :0]  lsu_rtu_wb_pipe3_wb_vreg_expand;     
input            lsu_rtu_wb_pipe3_wb_vreg_fr_vld;     
input            lsu_rtu_wb_pipe3_wb_vreg_vr_vld;     
input            lsu_rtu_wb_pipe4_abnormal;           
input            lsu_rtu_wb_pipe4_bkpta_data;         
input            lsu_rtu_wb_pipe4_bkptb_data;         
input            lsu_rtu_wb_pipe4_cmplt;              
input   [4  :0]  lsu_rtu_wb_pipe4_expt_vec;           
input            lsu_rtu_wb_pipe4_expt_vld;           
input            lsu_rtu_wb_pipe4_flush;              
input   [6  :0]  lsu_rtu_wb_pipe4_iid;                
input   [39 :0]  lsu_rtu_wb_pipe4_mtval;              
input            lsu_rtu_wb_pipe4_no_spec_hit;        
input            lsu_rtu_wb_pipe4_no_spec_mispred;    
input            lsu_rtu_wb_pipe4_no_spec_miss;       
input            lsu_rtu_wb_pipe4_spec_fail;          
input   [6  :0]  lsu_rtu_wb_pipe4_vstart;             
input            lsu_rtu_wb_pipe4_vstart_vld;         
input            mmu_xx_mmu_en;                       
input            pad_yy_icg_scan_en;                  
input            vfpu_rtu_ex5_pipe6_ereg_wb_vld;      
input   [4  :0]  vfpu_rtu_ex5_pipe6_wb_ereg;          
input   [63 :0]  vfpu_rtu_ex5_pipe6_wb_vreg_expand;   
input            vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld;   
input            vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld;   
input            vfpu_rtu_ex5_pipe7_ereg_wb_vld;      
input   [4  :0]  vfpu_rtu_ex5_pipe7_wb_ereg;          
input   [63 :0]  vfpu_rtu_ex5_pipe7_wb_vreg_expand;   
input            vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld;   
input            vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld;   
input            vfpu_rtu_pipe6_cmplt;                
input   [6  :0]  vfpu_rtu_pipe6_iid;                  
input            vfpu_rtu_pipe7_cmplt;                
input   [6  :0]  vfpu_rtu_pipe7_iid;                  
output  [63 :0]  rtu_cp0_epc;                         
output           rtu_cp0_expt_gateclk_vld;            
output  [63 :0]  rtu_cp0_expt_mtval;                  
output           rtu_cp0_expt_vld;                    
output           rtu_cp0_fp_dirty_vld;                
output           rtu_cp0_int_ack;                     
output           rtu_cp0_vec_dirty_vld;               
output           rtu_cp0_vsetvl_vill;                 
output  [7  :0]  rtu_cp0_vsetvl_vl;                   
output           rtu_cp0_vsetvl_vl_vld;               
output  [1  :0]  rtu_cp0_vsetvl_vlmul;                
output  [2  :0]  rtu_cp0_vsetvl_vsew;                 
output           rtu_cp0_vsetvl_vtype_vld;            
output  [6  :0]  rtu_cp0_vstart;                      
output           rtu_cp0_vstart_vld;                  
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
output  [4  :0]  rtu_idu_alloc_ereg0;                 
output           rtu_idu_alloc_ereg0_vld;             
output  [4  :0]  rtu_idu_alloc_ereg1;                 
output           rtu_idu_alloc_ereg1_vld;             
output  [4  :0]  rtu_idu_alloc_ereg2;                 
output           rtu_idu_alloc_ereg2_vld;             
output  [4  :0]  rtu_idu_alloc_ereg3;                 
output           rtu_idu_alloc_ereg3_vld;             
output  [5  :0]  rtu_idu_alloc_freg0;                 
output           rtu_idu_alloc_freg0_vld;             
output  [5  :0]  rtu_idu_alloc_freg1;                 
output           rtu_idu_alloc_freg1_vld;             
output  [5  :0]  rtu_idu_alloc_freg2;                 
output           rtu_idu_alloc_freg2_vld;             
output  [5  :0]  rtu_idu_alloc_freg3;                 
output           rtu_idu_alloc_freg3_vld;             
output  [6  :0]  rtu_idu_alloc_preg0;                 
output           rtu_idu_alloc_preg0_vld;             
output  [6  :0]  rtu_idu_alloc_preg1;                 
output           rtu_idu_alloc_preg1_vld;             
output  [6  :0]  rtu_idu_alloc_preg2;                 
output           rtu_idu_alloc_preg2_vld;             
output  [6  :0]  rtu_idu_alloc_preg3;                 
output           rtu_idu_alloc_preg3_vld;             
output  [5  :0]  rtu_idu_alloc_vreg0;                 
output           rtu_idu_alloc_vreg0_vld;             
output  [5  :0]  rtu_idu_alloc_vreg1;                 
output           rtu_idu_alloc_vreg1_vld;             
output  [5  :0]  rtu_idu_alloc_vreg2;                 
output           rtu_idu_alloc_vreg2_vld;             
output  [5  :0]  rtu_idu_alloc_vreg3;                 
output           rtu_idu_alloc_vreg3_vld;             
output           rtu_idu_flush_fe;                    
output           rtu_idu_flush_is;                    
output           rtu_idu_flush_stall;                 
output           rtu_idu_pst_empty;                   
output  [31 :0]  rtu_idu_pst_ereg_retired_released_wb; 
output           rtu_idu_retire0_inst_vld;            
output           rtu_idu_retire_int_vld;              
output           rtu_idu_rob_empty;                   
output           rtu_idu_rob_full;                    
output  [6  :0]  rtu_idu_rob_inst0_iid;               
output  [6  :0]  rtu_idu_rob_inst1_iid;               
output  [6  :0]  rtu_idu_rob_inst2_iid;               
output  [6  :0]  rtu_idu_rob_inst3_iid;               
output  [4  :0]  rtu_idu_rt_recover_ereg;             
output  [191:0]  rtu_idu_rt_recover_freg;             
output  [223:0]  rtu_idu_rt_recover_preg;             
output  [191:0]  rtu_idu_rt_recover_vreg;             
output           rtu_idu_srt_en;                      
output  [38 :0]  rtu_ifu_chgflw_pc;                   
output           rtu_ifu_chgflw_vld;                  
output           rtu_ifu_flush;                       
output  [7  :0]  rtu_ifu_retire0_chk_idx;             
output           rtu_ifu_retire0_condbr;              
output           rtu_ifu_retire0_condbr_taken;        
output  [38 :0]  rtu_ifu_retire0_inc_pc;              
output           rtu_ifu_retire0_jmp;                 
output           rtu_ifu_retire0_jmp_mispred;         
output           rtu_ifu_retire0_mispred;             
output  [38 :0]  rtu_ifu_retire0_next_pc;             
output           rtu_ifu_retire0_pcall;               
output           rtu_ifu_retire0_preturn;             
output  [7  :0]  rtu_ifu_retire1_chk_idx;             
output           rtu_ifu_retire1_condbr;              
output           rtu_ifu_retire1_condbr_taken;        
output           rtu_ifu_retire1_jmp;                 
output  [7  :0]  rtu_ifu_retire2_chk_idx;             
output           rtu_ifu_retire2_condbr;              
output           rtu_ifu_retire2_condbr_taken;        
output           rtu_ifu_retire2_jmp;                 
output  [38 :0]  rtu_ifu_retire_inst0_cur_pc;         
output           rtu_ifu_retire_inst0_load;           
output           rtu_ifu_retire_inst0_no_spec_hit;    
output           rtu_ifu_retire_inst0_no_spec_mispred; 
output           rtu_ifu_retire_inst0_no_spec_miss;   
output           rtu_ifu_retire_inst0_store;          
output           rtu_ifu_retire_inst0_vl_hit;         
output           rtu_ifu_retire_inst0_vl_mispred;     
output           rtu_ifu_retire_inst0_vl_miss;        
output           rtu_ifu_retire_inst0_vl_pred;        
output  [38 :0]  rtu_ifu_retire_inst1_cur_pc;         
output           rtu_ifu_retire_inst1_load;           
output           rtu_ifu_retire_inst1_no_spec_hit;    
output           rtu_ifu_retire_inst1_no_spec_mispred; 
output           rtu_ifu_retire_inst1_no_spec_miss;   
output           rtu_ifu_retire_inst1_store;          
output           rtu_ifu_retire_inst1_vl_pred;        
output  [38 :0]  rtu_ifu_retire_inst2_cur_pc;         
output           rtu_ifu_retire_inst2_load;           
output           rtu_ifu_retire_inst2_no_spec_hit;    
output           rtu_ifu_retire_inst2_no_spec_mispred; 
output           rtu_ifu_retire_inst2_no_spec_miss;   
output           rtu_ifu_retire_inst2_store;          
output           rtu_ifu_retire_inst2_vl_pred;        
output           rtu_ifu_xx_dbgon;                    
output  [5  :0]  rtu_ifu_xx_expt_vec;                 
output           rtu_ifu_xx_expt_vld;                 
output           rtu_iu_flush_chgflw_mask;            
output           rtu_iu_flush_fe;                     
output           rtu_iu_rob_read0_pcfifo_vld;         
output           rtu_iu_rob_read1_pcfifo_vld;         
output           rtu_iu_rob_read2_pcfifo_vld;         
output           rtu_iu_rob_read_pcfifo_gateclk_vld;  
output           rtu_lsu_async_flush;                 
output  [6  :0]  rtu_lsu_commit0_iid_updt_val;        
output  [6  :0]  rtu_lsu_commit1_iid_updt_val;        
output  [6  :0]  rtu_lsu_commit2_iid_updt_val;        
output           rtu_lsu_eret_flush;                  
output           rtu_lsu_expt_flush;                  
output           rtu_lsu_spec_fail_flush;             
output  [6  :0]  rtu_lsu_spec_fail_iid;               
output  [26 :0]  rtu_mmu_bad_vpn;                     
output           rtu_mmu_expt_vld;                    
output           rtu_pad_retire0;                     
output  [39 :0]  rtu_pad_retire0_pc;                  
output           rtu_pad_retire1;                     
output  [39 :0]  rtu_pad_retire1_pc;                  
output           rtu_pad_retire2;                     
output  [39 :0]  rtu_pad_retire2_pc;                  
output           rtu_yy_xx_commit0;                   
output  [6  :0]  rtu_yy_xx_commit0_iid;               
output           rtu_yy_xx_commit1;                   
output  [6  :0]  rtu_yy_xx_commit1_iid;               
output           rtu_yy_xx_commit2;                   
output  [6  :0]  rtu_yy_xx_commit2_iid;               
output           rtu_yy_xx_dbgon;                     
output  [5  :0]  rtu_yy_xx_expt_vec;                  
output           rtu_yy_xx_flush;                     
output           rtu_yy_xx_retire0;                   
output           rtu_yy_xx_retire0_normal;            
output           rtu_yy_xx_retire1;                   
output           rtu_yy_xx_retire2;                   

// &Regs; @26

// &Wires; @27
wire             cp0_rtu_icg_en;                      
wire             cp0_rtu_srt_en;                      
wire             cp0_rtu_xx_int_b;                    
wire    [4  :0]  cp0_rtu_xx_vec;                      
wire             cp0_yy_clk_en;                       
wire             cpurst_b;                            
wire             forever_cpuclk;                      
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
wire             had_yy_xx_exit_dbg;                  
wire             hpcp_rtu_cnt_en;                     
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
wire    [38 :0]  ifu_rtu_cur_pc;                      
wire             ifu_rtu_cur_pc_load;                 
wire             ifu_xx_sync_reset;                   
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
wire             mmu_xx_mmu_en;                       
wire             pad_yy_icg_scan_en;                  
wire             pst_retire_retired_reg_wb;           
wire             pst_retired_ereg_wb;                 
wire             pst_retired_freg_wb;                 
wire             pst_retired_vreg_wb;                 
wire    [2  :0]  pst_top_retired_reg_wb;              
wire             retire_pst_async_flush;              
wire             retire_pst_wb_retire_inst0_ereg_vld; 
wire             retire_pst_wb_retire_inst0_preg_vld; 
wire             retire_pst_wb_retire_inst0_vreg_vld; 
wire             retire_pst_wb_retire_inst1_ereg_vld; 
wire             retire_pst_wb_retire_inst1_preg_vld; 
wire             retire_pst_wb_retire_inst1_vreg_vld; 
wire             retire_pst_wb_retire_inst2_ereg_vld; 
wire             retire_pst_wb_retire_inst2_preg_vld; 
wire             retire_pst_wb_retire_inst2_vreg_vld; 
wire             retire_rob_async_expt_commit_mask;   
wire             retire_rob_ctc_flush_req;            
wire             retire_rob_dbg_inst0_ack_int;        
wire             retire_rob_dbg_inst0_dbg_mode_on;    
wire             retire_rob_dbg_inst0_expt_vld;       
wire             retire_rob_dbg_inst0_flush;          
wire             retire_rob_dbg_inst0_mispred;        
wire             retire_rob_flush;                    
wire    [4  :0]  retire_rob_flush_cur_state;          
wire             retire_rob_flush_gateclk;            
wire             retire_rob_inst0_jmp;                
wire             retire_rob_inst1_jmp;                
wire             retire_rob_inst2_jmp;                
wire             retire_rob_inst_flush;               
wire             retire_rob_retire_empty;             
wire             retire_rob_rt_mask;                  
wire             retire_rob_split_fof_flush;          
wire             retire_rob_srt_en;                   
wire    [1  :0]  retire_top_ae_cur_state;             
wire             rob_pst_retire_inst0_gateclk_vld;    
wire    [6  :0]  rob_pst_retire_inst0_iid;            
wire    [6  :0]  rob_pst_retire_inst0_iid_updt_val;   
wire             rob_pst_retire_inst1_gateclk_vld;    
wire    [6  :0]  rob_pst_retire_inst1_iid;            
wire    [6  :0]  rob_pst_retire_inst1_iid_updt_val;   
wire             rob_pst_retire_inst2_gateclk_vld;    
wire    [6  :0]  rob_pst_retire_inst2_iid;            
wire    [6  :0]  rob_pst_retire_inst2_iid_updt_val;   
wire             rob_retire_commit0;                  
wire             rob_retire_commit1;                  
wire             rob_retire_commit2;                  
wire             rob_retire_ctc_flush_srt_en;         
wire             rob_retire_inst0_bht_mispred;        
wire             rob_retire_inst0_bju;                
wire    [38 :0]  rob_retire_inst0_bju_inc_pc;         
wire             rob_retire_inst0_bkpt;               
wire    [7  :0]  rob_retire_inst0_chk_idx;            
wire             rob_retire_inst0_condbr;             
wire             rob_retire_inst0_condbr_taken;       
wire             rob_retire_inst0_ctc_flush;          
wire    [38 :0]  rob_retire_inst0_cur_pc;             
wire             rob_retire_inst0_data_bkpt;          
wire             rob_retire_inst0_dbg_disable;        
wire             rob_retire_inst0_efpc_vld;           
wire    [3  :0]  rob_retire_inst0_expt_vec;           
wire             rob_retire_inst0_expt_vld;           
wire             rob_retire_inst0_fp_dirty;           
wire             rob_retire_inst0_high_hw_expt;       
wire    [6  :0]  rob_retire_inst0_iid;                
wire             rob_retire_inst0_immu_expt;          
wire             rob_retire_inst0_inst_bkpt;          
wire             rob_retire_inst0_inst_flush;         
wire    [4  :0]  rob_retire_inst0_int_vec;            
wire             rob_retire_inst0_int_vld;            
wire             rob_retire_inst0_intmask;            
wire             rob_retire_inst0_jmp;                
wire             rob_retire_inst0_jmp_mispred;        
wire             rob_retire_inst0_load;               
wire    [39 :0]  rob_retire_inst0_mtval;              
wire    [38 :0]  rob_retire_inst0_next_pc;            
wire             rob_retire_inst0_no_spec_hit;        
wire             rob_retire_inst0_no_spec_mispred;    
wire             rob_retire_inst0_no_spec_miss;       
wire    [1  :0]  rob_retire_inst0_num;                
wire    [2  :0]  rob_retire_inst0_pc_offset;          
wire             rob_retire_inst0_pcal;               
wire             rob_retire_inst0_pret;               
wire             rob_retire_inst0_pst_ereg_vld;       
wire             rob_retire_inst0_pst_preg_vld;       
wire             rob_retire_inst0_pst_vreg_vld;       
wire             rob_retire_inst0_ras;                
wire             rob_retire_inst0_spec_fail;          
wire             rob_retire_inst0_spec_fail_no_ssf;   
wire             rob_retire_inst0_spec_fail_ssf;      
wire             rob_retire_inst0_split;              
wire             rob_retire_inst0_store;              
wire             rob_retire_inst0_vec_dirty;          
wire    [7  :0]  rob_retire_inst0_vl;                 
wire             rob_retire_inst0_vl_pred;            
wire             rob_retire_inst0_vld;                
wire    [1  :0]  rob_retire_inst0_vlmul;              
wire             rob_retire_inst0_vsetvl;             
wire             rob_retire_inst0_vsetvli;            
wire    [2  :0]  rob_retire_inst0_vsew;               
wire    [6  :0]  rob_retire_inst0_vstart;             
wire             rob_retire_inst0_vstart_vld;         
wire             rob_retire_inst1_bju;                
wire    [7  :0]  rob_retire_inst1_chk_idx;            
wire             rob_retire_inst1_condbr;             
wire             rob_retire_inst1_condbr_taken;       
wire    [38 :0]  rob_retire_inst1_cur_pc;             
wire             rob_retire_inst1_fp_dirty;           
wire             rob_retire_inst1_jmp;                
wire             rob_retire_inst1_load;               
wire    [38 :0]  rob_retire_inst1_next_pc;            
wire             rob_retire_inst1_no_spec_hit;        
wire             rob_retire_inst1_no_spec_mispred;    
wire             rob_retire_inst1_no_spec_miss;       
wire    [1  :0]  rob_retire_inst1_num;                
wire    [2  :0]  rob_retire_inst1_pc_offset;          
wire             rob_retire_inst1_pst_ereg_vld;       
wire             rob_retire_inst1_pst_preg_vld;       
wire             rob_retire_inst1_pst_vreg_vld;       
wire             rob_retire_inst1_split;              
wire             rob_retire_inst1_store;              
wire             rob_retire_inst1_vec_dirty;          
wire    [7  :0]  rob_retire_inst1_vl;                 
wire             rob_retire_inst1_vl_pred;            
wire             rob_retire_inst1_vld;                
wire    [1  :0]  rob_retire_inst1_vlmul;              
wire             rob_retire_inst1_vsetvli;            
wire    [2  :0]  rob_retire_inst1_vsew;               
wire             rob_retire_inst2_bju;                
wire    [7  :0]  rob_retire_inst2_chk_idx;            
wire             rob_retire_inst2_condbr;             
wire             rob_retire_inst2_condbr_taken;       
wire    [38 :0]  rob_retire_inst2_cur_pc;             
wire             rob_retire_inst2_fp_dirty;           
wire             rob_retire_inst2_jmp;                
wire             rob_retire_inst2_load;               
wire    [38 :0]  rob_retire_inst2_next_pc;            
wire             rob_retire_inst2_no_spec_hit;        
wire             rob_retire_inst2_no_spec_mispred;    
wire             rob_retire_inst2_no_spec_miss;       
wire    [1  :0]  rob_retire_inst2_num;                
wire    [2  :0]  rob_retire_inst2_pc_offset;          
wire             rob_retire_inst2_pst_ereg_vld;       
wire             rob_retire_inst2_pst_preg_vld;       
wire             rob_retire_inst2_pst_vreg_vld;       
wire             rob_retire_inst2_split;              
wire             rob_retire_inst2_store;              
wire             rob_retire_inst2_vec_dirty;          
wire    [7  :0]  rob_retire_inst2_vl;                 
wire             rob_retire_inst2_vl_pred;            
wire             rob_retire_inst2_vld;                
wire    [1  :0]  rob_retire_inst2_vlmul;              
wire             rob_retire_inst2_vsetvli;            
wire    [2  :0]  rob_retire_inst2_vsew;               
wire             rob_retire_int_srt_en;               
wire    [38 :0]  rob_retire_rob_cur_pc;               
wire             rob_retire_split_spec_fail_srt;      
wire    [6  :0]  rob_retire_ssf_iid;                  
wire             rob_top_commit0;                     
wire             rob_top_commit_st_no_vld;            
wire    [6  :0]  rob_top_create0_iid;                 
wire    [6  :0]  rob_top_entry_num;                   
wire    [4  :0]  rob_top_flush_cur_state;             
wire    [6  :0]  rob_top_read0_iid;                   
wire    [6  :0]  rob_top_rob_cur_pc;                  
wire             rob_top_rob_full;                    
wire    [1  :0]  rob_top_ssf_cur_state;               
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



//==========================================================
//                     Instance PST
//==========================================================
// &Instance("ct_rtu_pst_preg", "x_ct_rtu_pst_preg"); @33
ct_rtu_pst_preg  x_ct_rtu_pst_preg (
  .cp0_rtu_icg_en                      (cp0_rtu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_rtu_ir_preg0_alloc_vld          (idu_rtu_ir_preg0_alloc_vld         ),
  .idu_rtu_ir_preg1_alloc_vld          (idu_rtu_ir_preg1_alloc_vld         ),
  .idu_rtu_ir_preg2_alloc_vld          (idu_rtu_ir_preg2_alloc_vld         ),
  .idu_rtu_ir_preg3_alloc_vld          (idu_rtu_ir_preg3_alloc_vld         ),
  .idu_rtu_ir_preg_alloc_gateclk_vld   (idu_rtu_ir_preg_alloc_gateclk_vld  ),
  .idu_rtu_pst_dis_inst0_dst_reg       (idu_rtu_pst_dis_inst0_dst_reg      ),
  .idu_rtu_pst_dis_inst0_preg          (idu_rtu_pst_dis_inst0_preg         ),
  .idu_rtu_pst_dis_inst0_preg_iid      (idu_rtu_pst_dis_inst0_preg_iid     ),
  .idu_rtu_pst_dis_inst0_preg_vld      (idu_rtu_pst_dis_inst0_preg_vld     ),
  .idu_rtu_pst_dis_inst0_rel_preg      (idu_rtu_pst_dis_inst0_rel_preg     ),
  .idu_rtu_pst_dis_inst1_dst_reg       (idu_rtu_pst_dis_inst1_dst_reg      ),
  .idu_rtu_pst_dis_inst1_preg          (idu_rtu_pst_dis_inst1_preg         ),
  .idu_rtu_pst_dis_inst1_preg_iid      (idu_rtu_pst_dis_inst1_preg_iid     ),
  .idu_rtu_pst_dis_inst1_preg_vld      (idu_rtu_pst_dis_inst1_preg_vld     ),
  .idu_rtu_pst_dis_inst1_rel_preg      (idu_rtu_pst_dis_inst1_rel_preg     ),
  .idu_rtu_pst_dis_inst2_dst_reg       (idu_rtu_pst_dis_inst2_dst_reg      ),
  .idu_rtu_pst_dis_inst2_preg          (idu_rtu_pst_dis_inst2_preg         ),
  .idu_rtu_pst_dis_inst2_preg_iid      (idu_rtu_pst_dis_inst2_preg_iid     ),
  .idu_rtu_pst_dis_inst2_preg_vld      (idu_rtu_pst_dis_inst2_preg_vld     ),
  .idu_rtu_pst_dis_inst2_rel_preg      (idu_rtu_pst_dis_inst2_rel_preg     ),
  .idu_rtu_pst_dis_inst3_dst_reg       (idu_rtu_pst_dis_inst3_dst_reg      ),
  .idu_rtu_pst_dis_inst3_preg          (idu_rtu_pst_dis_inst3_preg         ),
  .idu_rtu_pst_dis_inst3_preg_iid      (idu_rtu_pst_dis_inst3_preg_iid     ),
  .idu_rtu_pst_dis_inst3_preg_vld      (idu_rtu_pst_dis_inst3_preg_vld     ),
  .idu_rtu_pst_dis_inst3_rel_preg      (idu_rtu_pst_dis_inst3_rel_preg     ),
  .idu_rtu_pst_preg_dealloc_mask       (idu_rtu_pst_preg_dealloc_mask      ),
  .ifu_xx_sync_reset                   (ifu_xx_sync_reset                  ),
  .iu_rtu_ex2_pipe0_wb_preg_expand     (iu_rtu_ex2_pipe0_wb_preg_expand    ),
  .iu_rtu_ex2_pipe0_wb_preg_vld        (iu_rtu_ex2_pipe0_wb_preg_vld       ),
  .iu_rtu_ex2_pipe1_wb_preg_expand     (iu_rtu_ex2_pipe1_wb_preg_expand    ),
  .iu_rtu_ex2_pipe1_wb_preg_vld        (iu_rtu_ex2_pipe1_wb_preg_vld       ),
  .lsu_rtu_wb_pipe3_wb_preg_expand     (lsu_rtu_wb_pipe3_wb_preg_expand    ),
  .lsu_rtu_wb_pipe3_wb_preg_vld        (lsu_rtu_wb_pipe3_wb_preg_vld       ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .pst_retire_retired_reg_wb           (pst_retire_retired_reg_wb          ),
  .pst_retired_ereg_wb                 (pst_retired_ereg_wb                ),
  .pst_retired_freg_wb                 (pst_retired_freg_wb                ),
  .pst_retired_vreg_wb                 (pst_retired_vreg_wb                ),
  .pst_top_retired_reg_wb              (pst_top_retired_reg_wb             ),
  .retire_pst_async_flush              (retire_pst_async_flush             ),
  .retire_pst_wb_retire_inst0_preg_vld (retire_pst_wb_retire_inst0_preg_vld),
  .retire_pst_wb_retire_inst1_preg_vld (retire_pst_wb_retire_inst1_preg_vld),
  .retire_pst_wb_retire_inst2_preg_vld (retire_pst_wb_retire_inst2_preg_vld),
  .rob_pst_retire_inst0_gateclk_vld    (rob_pst_retire_inst0_gateclk_vld   ),
  .rob_pst_retire_inst0_iid_updt_val   (rob_pst_retire_inst0_iid_updt_val  ),
  .rob_pst_retire_inst1_gateclk_vld    (rob_pst_retire_inst1_gateclk_vld   ),
  .rob_pst_retire_inst1_iid_updt_val   (rob_pst_retire_inst1_iid_updt_val  ),
  .rob_pst_retire_inst2_gateclk_vld    (rob_pst_retire_inst2_gateclk_vld   ),
  .rob_pst_retire_inst2_iid_updt_val   (rob_pst_retire_inst2_iid_updt_val  ),
  .rtu_had_inst_not_wb                 (rtu_had_inst_not_wb                ),
  .rtu_idu_alloc_preg0                 (rtu_idu_alloc_preg0                ),
  .rtu_idu_alloc_preg0_vld             (rtu_idu_alloc_preg0_vld            ),
  .rtu_idu_alloc_preg1                 (rtu_idu_alloc_preg1                ),
  .rtu_idu_alloc_preg1_vld             (rtu_idu_alloc_preg1_vld            ),
  .rtu_idu_alloc_preg2                 (rtu_idu_alloc_preg2                ),
  .rtu_idu_alloc_preg2_vld             (rtu_idu_alloc_preg2_vld            ),
  .rtu_idu_alloc_preg3                 (rtu_idu_alloc_preg3                ),
  .rtu_idu_alloc_preg3_vld             (rtu_idu_alloc_preg3_vld            ),
  .rtu_idu_pst_empty                   (rtu_idu_pst_empty                  ),
  .rtu_idu_rt_recover_preg             (rtu_idu_rt_recover_preg            ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    )
);

// &Instance("ct_rtu_pst_ereg", "x_ct_rtu_pst_ereg"); @34
ct_rtu_pst_ereg  x_ct_rtu_pst_ereg (
  .cp0_rtu_icg_en                       (cp0_rtu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .idu_rtu_ir_ereg0_alloc_vld           (idu_rtu_ir_ereg0_alloc_vld          ),
  .idu_rtu_ir_ereg1_alloc_vld           (idu_rtu_ir_ereg1_alloc_vld          ),
  .idu_rtu_ir_ereg2_alloc_vld           (idu_rtu_ir_ereg2_alloc_vld          ),
  .idu_rtu_ir_ereg3_alloc_vld           (idu_rtu_ir_ereg3_alloc_vld          ),
  .idu_rtu_ir_ereg_alloc_gateclk_vld    (idu_rtu_ir_ereg_alloc_gateclk_vld   ),
  .idu_rtu_pst_dis_inst0_ereg           (idu_rtu_pst_dis_inst0_ereg          ),
  .idu_rtu_pst_dis_inst0_ereg_iid       (idu_rtu_pst_dis_inst0_ereg_iid      ),
  .idu_rtu_pst_dis_inst0_ereg_vld       (idu_rtu_pst_dis_inst0_ereg_vld      ),
  .idu_rtu_pst_dis_inst0_rel_ereg       (idu_rtu_pst_dis_inst0_rel_ereg      ),
  .idu_rtu_pst_dis_inst1_ereg           (idu_rtu_pst_dis_inst1_ereg          ),
  .idu_rtu_pst_dis_inst1_ereg_iid       (idu_rtu_pst_dis_inst1_ereg_iid      ),
  .idu_rtu_pst_dis_inst1_ereg_vld       (idu_rtu_pst_dis_inst1_ereg_vld      ),
  .idu_rtu_pst_dis_inst1_rel_ereg       (idu_rtu_pst_dis_inst1_rel_ereg      ),
  .idu_rtu_pst_dis_inst2_ereg           (idu_rtu_pst_dis_inst2_ereg          ),
  .idu_rtu_pst_dis_inst2_ereg_iid       (idu_rtu_pst_dis_inst2_ereg_iid      ),
  .idu_rtu_pst_dis_inst2_ereg_vld       (idu_rtu_pst_dis_inst2_ereg_vld      ),
  .idu_rtu_pst_dis_inst2_rel_ereg       (idu_rtu_pst_dis_inst2_rel_ereg      ),
  .idu_rtu_pst_dis_inst3_ereg           (idu_rtu_pst_dis_inst3_ereg          ),
  .idu_rtu_pst_dis_inst3_ereg_iid       (idu_rtu_pst_dis_inst3_ereg_iid      ),
  .idu_rtu_pst_dis_inst3_ereg_vld       (idu_rtu_pst_dis_inst3_ereg_vld      ),
  .idu_rtu_pst_dis_inst3_rel_ereg       (idu_rtu_pst_dis_inst3_rel_ereg      ),
  .ifu_xx_sync_reset                    (ifu_xx_sync_reset                   ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pst_retired_ereg_wb                  (pst_retired_ereg_wb                 ),
  .retire_pst_async_flush               (retire_pst_async_flush              ),
  .retire_pst_wb_retire_inst0_ereg_vld  (retire_pst_wb_retire_inst0_ereg_vld ),
  .retire_pst_wb_retire_inst1_ereg_vld  (retire_pst_wb_retire_inst1_ereg_vld ),
  .retire_pst_wb_retire_inst2_ereg_vld  (retire_pst_wb_retire_inst2_ereg_vld ),
  .rob_pst_retire_inst0_iid             (rob_pst_retire_inst0_iid            ),
  .rob_pst_retire_inst1_iid             (rob_pst_retire_inst1_iid            ),
  .rob_pst_retire_inst2_iid             (rob_pst_retire_inst2_iid            ),
  .rtu_idu_alloc_ereg0                  (rtu_idu_alloc_ereg0                 ),
  .rtu_idu_alloc_ereg0_vld              (rtu_idu_alloc_ereg0_vld             ),
  .rtu_idu_alloc_ereg1                  (rtu_idu_alloc_ereg1                 ),
  .rtu_idu_alloc_ereg1_vld              (rtu_idu_alloc_ereg1_vld             ),
  .rtu_idu_alloc_ereg2                  (rtu_idu_alloc_ereg2                 ),
  .rtu_idu_alloc_ereg2_vld              (rtu_idu_alloc_ereg2_vld             ),
  .rtu_idu_alloc_ereg3                  (rtu_idu_alloc_ereg3                 ),
  .rtu_idu_alloc_ereg3_vld              (rtu_idu_alloc_ereg3_vld             ),
  .rtu_idu_pst_ereg_retired_released_wb (rtu_idu_pst_ereg_retired_released_wb),
  .rtu_idu_rt_recover_ereg              (rtu_idu_rt_recover_ereg             ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .vfpu_rtu_ex5_pipe6_ereg_wb_vld       (vfpu_rtu_ex5_pipe6_ereg_wb_vld      ),
  .vfpu_rtu_ex5_pipe6_wb_ereg           (vfpu_rtu_ex5_pipe6_wb_ereg          ),
  .vfpu_rtu_ex5_pipe7_ereg_wb_vld       (vfpu_rtu_ex5_pipe7_ereg_wb_vld      ),
  .vfpu_rtu_ex5_pipe7_wb_ereg           (vfpu_rtu_ex5_pipe7_wb_ereg          )
);


// &ConnRule(s/xreg/vreg/); @37
// &Instance("ct_rtu_pst_vreg", "x_ct_rtu_pst_vreg"); @38
// &Connect(.lsu_rtu_wb_pipe3_wb_vreg_vld      (lsu_rtu_wb_pipe3_wb_vreg_vr_vld), @39
//          .lsu_rtu_wb_pipe3_wb_vreg_expand   (lsu_rtu_wb_pipe3_wb_vreg_expand[63:0]), @40
//          .vfpu_rtu_ex5_pipe6_wb_vreg_vld    (vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld), @41
//          .vfpu_rtu_ex5_pipe6_wb_vreg_expand (vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0]), @42
//          .vfpu_rtu_ex5_pipe7_wb_vreg_vld    (vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld), @43
//          .vfpu_rtu_ex5_pipe7_wb_vreg_expand (vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0])); @44
// &ConnRule(s/xreg/vreg/); @46
// &Instance("ct_rtu_pst_vreg_dummy", "x_ct_rtu_pst_vreg_dummy"); @47
ct_rtu_pst_vreg_dummy  x_ct_rtu_pst_vreg_dummy (
  .idu_rtu_ir_xreg0_alloc_vld              (idu_rtu_ir_vreg0_alloc_vld             ),
  .idu_rtu_ir_xreg1_alloc_vld              (idu_rtu_ir_vreg1_alloc_vld             ),
  .idu_rtu_ir_xreg2_alloc_vld              (idu_rtu_ir_vreg2_alloc_vld             ),
  .idu_rtu_ir_xreg3_alloc_vld              (idu_rtu_ir_vreg3_alloc_vld             ),
  .idu_rtu_ir_xreg_alloc_gateclk_vld       (idu_rtu_ir_vreg_alloc_gateclk_vld      ),
  .idu_rtu_pst_dis_inst0_dstv_reg          (idu_rtu_pst_dis_inst0_dstv_reg         ),
  .idu_rtu_pst_dis_inst0_rel_vreg          (idu_rtu_pst_dis_inst0_rel_vreg         ),
  .idu_rtu_pst_dis_inst0_vreg              (idu_rtu_pst_dis_inst0_vreg             ),
  .idu_rtu_pst_dis_inst0_vreg_iid          (idu_rtu_pst_dis_inst0_vreg_iid         ),
  .idu_rtu_pst_dis_inst0_xreg_vld          (idu_rtu_pst_dis_inst0_vreg_vld         ),
  .idu_rtu_pst_dis_inst1_dstv_reg          (idu_rtu_pst_dis_inst1_dstv_reg         ),
  .idu_rtu_pst_dis_inst1_rel_vreg          (idu_rtu_pst_dis_inst1_rel_vreg         ),
  .idu_rtu_pst_dis_inst1_vreg              (idu_rtu_pst_dis_inst1_vreg             ),
  .idu_rtu_pst_dis_inst1_vreg_iid          (idu_rtu_pst_dis_inst1_vreg_iid         ),
  .idu_rtu_pst_dis_inst1_xreg_vld          (idu_rtu_pst_dis_inst1_vreg_vld         ),
  .idu_rtu_pst_dis_inst2_dstv_reg          (idu_rtu_pst_dis_inst2_dstv_reg         ),
  .idu_rtu_pst_dis_inst2_rel_vreg          (idu_rtu_pst_dis_inst2_rel_vreg         ),
  .idu_rtu_pst_dis_inst2_vreg              (idu_rtu_pst_dis_inst2_vreg             ),
  .idu_rtu_pst_dis_inst2_vreg_iid          (idu_rtu_pst_dis_inst2_vreg_iid         ),
  .idu_rtu_pst_dis_inst2_xreg_vld          (idu_rtu_pst_dis_inst2_vreg_vld         ),
  .idu_rtu_pst_dis_inst3_dstv_reg          (idu_rtu_pst_dis_inst3_dstv_reg         ),
  .idu_rtu_pst_dis_inst3_rel_vreg          (idu_rtu_pst_dis_inst3_rel_vreg         ),
  .idu_rtu_pst_dis_inst3_vreg              (idu_rtu_pst_dis_inst3_vreg             ),
  .idu_rtu_pst_dis_inst3_vreg_iid          (idu_rtu_pst_dis_inst3_vreg_iid         ),
  .idu_rtu_pst_dis_inst3_xreg_vld          (idu_rtu_pst_dis_inst3_vreg_vld         ),
  .idu_rtu_pst_xreg_dealloc_mask           (idu_rtu_pst_vreg_dealloc_mask          ),
  .lsu_rtu_wb_pipe3_wb_vreg_expand         (lsu_rtu_wb_pipe3_wb_vreg_expand[63:0]  ),
  .lsu_rtu_wb_pipe3_wb_vreg_vld            (lsu_rtu_wb_pipe3_wb_vreg_vr_vld        ),
  .pst_retired_xreg_wb                     (pst_retired_vreg_wb                    ),
  .rtu_idu_alloc_xreg0                     (rtu_idu_alloc_vreg0                    ),
  .rtu_idu_alloc_xreg0_vld                 (rtu_idu_alloc_vreg0_vld                ),
  .rtu_idu_alloc_xreg1                     (rtu_idu_alloc_vreg1                    ),
  .rtu_idu_alloc_xreg1_vld                 (rtu_idu_alloc_vreg1_vld                ),
  .rtu_idu_alloc_xreg2                     (rtu_idu_alloc_vreg2                    ),
  .rtu_idu_alloc_xreg2_vld                 (rtu_idu_alloc_vreg2_vld                ),
  .rtu_idu_alloc_xreg3                     (rtu_idu_alloc_vreg3                    ),
  .rtu_idu_alloc_xreg3_vld                 (rtu_idu_alloc_vreg3_vld                ),
  .rtu_idu_rt_recover_xreg                 (rtu_idu_rt_recover_vreg                ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_expand       (vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0]),
  .vfpu_rtu_ex5_pipe6_wb_vreg_vld          (vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld      ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_expand       (vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0]),
  .vfpu_rtu_ex5_pipe7_wb_vreg_vld          (vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld      )
);

// &Connect(.lsu_rtu_wb_pipe3_wb_vreg_vld      (lsu_rtu_wb_pipe3_wb_vreg_vr_vld), @48
//          .lsu_rtu_wb_pipe3_wb_vreg_expand   (lsu_rtu_wb_pipe3_wb_vreg_expand[63:0]), @49
//          .vfpu_rtu_ex5_pipe6_wb_vreg_vld    (vfpu_rtu_ex5_pipe6_wb_vreg_vr_vld), @50
//          .vfpu_rtu_ex5_pipe6_wb_vreg_expand (vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0]), @51
//          .vfpu_rtu_ex5_pipe7_wb_vreg_vld    (vfpu_rtu_ex5_pipe7_wb_vreg_vr_vld), @52
//          .vfpu_rtu_ex5_pipe7_wb_vreg_expand (vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0])); @53

// &ConnRule(s/xreg/freg/); @57
// &Instance("ct_rtu_pst_vreg_dummy", "x_ct_rtu_pst_freg_dummy"); @58
// &Connect(.lsu_rtu_wb_pipe3_wb_vreg_vld      (lsu_rtu_wb_pipe3_wb_vreg_fr_vld), @59
//          .lsu_rtu_wb_pipe3_wb_vreg_expand   (lsu_rtu_wb_pipe3_wb_vreg_expand[63:0]), @60
//          .vfpu_rtu_ex5_pipe6_wb_vreg_vld    (vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld), @61
//          .vfpu_rtu_ex5_pipe6_wb_vreg_expand (vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0]), @62
//          .vfpu_rtu_ex5_pipe7_wb_vreg_vld    (vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld), @63
//          .vfpu_rtu_ex5_pipe7_wb_vreg_expand (vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0])); @64
// &ConnRule(s/xreg/freg/); @66
// &Instance("ct_rtu_pst_vreg", "x_ct_rtu_pst_freg"); @67
ct_rtu_pst_vreg  x_ct_rtu_pst_freg (
  .cp0_rtu_icg_en                          (cp0_rtu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .idu_rtu_ir_xreg0_alloc_vld              (idu_rtu_ir_freg0_alloc_vld             ),
  .idu_rtu_ir_xreg1_alloc_vld              (idu_rtu_ir_freg1_alloc_vld             ),
  .idu_rtu_ir_xreg2_alloc_vld              (idu_rtu_ir_freg2_alloc_vld             ),
  .idu_rtu_ir_xreg3_alloc_vld              (idu_rtu_ir_freg3_alloc_vld             ),
  .idu_rtu_ir_xreg_alloc_gateclk_vld       (idu_rtu_ir_freg_alloc_gateclk_vld      ),
  .idu_rtu_pst_dis_inst0_dstv_reg          (idu_rtu_pst_dis_inst0_dstv_reg         ),
  .idu_rtu_pst_dis_inst0_rel_vreg          (idu_rtu_pst_dis_inst0_rel_vreg         ),
  .idu_rtu_pst_dis_inst0_vreg              (idu_rtu_pst_dis_inst0_vreg             ),
  .idu_rtu_pst_dis_inst0_vreg_iid          (idu_rtu_pst_dis_inst0_vreg_iid         ),
  .idu_rtu_pst_dis_inst0_xreg_vld          (idu_rtu_pst_dis_inst0_freg_vld         ),
  .idu_rtu_pst_dis_inst1_dstv_reg          (idu_rtu_pst_dis_inst1_dstv_reg         ),
  .idu_rtu_pst_dis_inst1_rel_vreg          (idu_rtu_pst_dis_inst1_rel_vreg         ),
  .idu_rtu_pst_dis_inst1_vreg              (idu_rtu_pst_dis_inst1_vreg             ),
  .idu_rtu_pst_dis_inst1_vreg_iid          (idu_rtu_pst_dis_inst1_vreg_iid         ),
  .idu_rtu_pst_dis_inst1_xreg_vld          (idu_rtu_pst_dis_inst1_freg_vld         ),
  .idu_rtu_pst_dis_inst2_dstv_reg          (idu_rtu_pst_dis_inst2_dstv_reg         ),
  .idu_rtu_pst_dis_inst2_rel_vreg          (idu_rtu_pst_dis_inst2_rel_vreg         ),
  .idu_rtu_pst_dis_inst2_vreg              (idu_rtu_pst_dis_inst2_vreg             ),
  .idu_rtu_pst_dis_inst2_vreg_iid          (idu_rtu_pst_dis_inst2_vreg_iid         ),
  .idu_rtu_pst_dis_inst2_xreg_vld          (idu_rtu_pst_dis_inst2_freg_vld         ),
  .idu_rtu_pst_dis_inst3_dstv_reg          (idu_rtu_pst_dis_inst3_dstv_reg         ),
  .idu_rtu_pst_dis_inst3_rel_vreg          (idu_rtu_pst_dis_inst3_rel_vreg         ),
  .idu_rtu_pst_dis_inst3_vreg              (idu_rtu_pst_dis_inst3_vreg             ),
  .idu_rtu_pst_dis_inst3_vreg_iid          (idu_rtu_pst_dis_inst3_vreg_iid         ),
  .idu_rtu_pst_dis_inst3_xreg_vld          (idu_rtu_pst_dis_inst3_freg_vld         ),
  .idu_rtu_pst_xreg_dealloc_mask           (idu_rtu_pst_freg_dealloc_mask          ),
  .ifu_xx_sync_reset                       (ifu_xx_sync_reset                      ),
  .lsu_rtu_wb_pipe3_wb_vreg_expand         (lsu_rtu_wb_pipe3_wb_vreg_expand[63:0]  ),
  .lsu_rtu_wb_pipe3_wb_vreg_vld            (lsu_rtu_wb_pipe3_wb_vreg_fr_vld        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pst_retired_xreg_wb                     (pst_retired_freg_wb                    ),
  .retire_pst_async_flush                  (retire_pst_async_flush                 ),
  .retire_pst_wb_retire_inst0_vreg_vld     (retire_pst_wb_retire_inst0_vreg_vld    ),
  .retire_pst_wb_retire_inst1_vreg_vld     (retire_pst_wb_retire_inst1_vreg_vld    ),
  .retire_pst_wb_retire_inst2_vreg_vld     (retire_pst_wb_retire_inst2_vreg_vld    ),
  .rob_pst_retire_inst0_gateclk_vld        (rob_pst_retire_inst0_gateclk_vld       ),
  .rob_pst_retire_inst0_iid_updt_val       (rob_pst_retire_inst0_iid_updt_val      ),
  .rob_pst_retire_inst1_gateclk_vld        (rob_pst_retire_inst1_gateclk_vld       ),
  .rob_pst_retire_inst1_iid_updt_val       (rob_pst_retire_inst1_iid_updt_val      ),
  .rob_pst_retire_inst2_gateclk_vld        (rob_pst_retire_inst2_gateclk_vld       ),
  .rob_pst_retire_inst2_iid_updt_val       (rob_pst_retire_inst2_iid_updt_val      ),
  .rtu_idu_alloc_xreg0                     (rtu_idu_alloc_freg0                    ),
  .rtu_idu_alloc_xreg0_vld                 (rtu_idu_alloc_freg0_vld                ),
  .rtu_idu_alloc_xreg1                     (rtu_idu_alloc_freg1                    ),
  .rtu_idu_alloc_xreg1_vld                 (rtu_idu_alloc_freg1_vld                ),
  .rtu_idu_alloc_xreg2                     (rtu_idu_alloc_freg2                    ),
  .rtu_idu_alloc_xreg2_vld                 (rtu_idu_alloc_freg2_vld                ),
  .rtu_idu_alloc_xreg3                     (rtu_idu_alloc_freg3                    ),
  .rtu_idu_alloc_xreg3_vld                 (rtu_idu_alloc_freg3_vld                ),
  .rtu_idu_rt_recover_xreg                 (rtu_idu_rt_recover_freg                ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_rtu_ex5_pipe6_wb_vreg_expand       (vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0]),
  .vfpu_rtu_ex5_pipe6_wb_vreg_vld          (vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld      ),
  .vfpu_rtu_ex5_pipe7_wb_vreg_expand       (vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0]),
  .vfpu_rtu_ex5_pipe7_wb_vreg_vld          (vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld      )
);

// &Connect(.lsu_rtu_wb_pipe3_wb_vreg_vld      (lsu_rtu_wb_pipe3_wb_vreg_fr_vld), @68
//          .lsu_rtu_wb_pipe3_wb_vreg_expand   (lsu_rtu_wb_pipe3_wb_vreg_expand[63:0]), @69
//          .vfpu_rtu_ex5_pipe6_wb_vreg_vld    (vfpu_rtu_ex5_pipe6_wb_vreg_fr_vld), @70
//          .vfpu_rtu_ex5_pipe6_wb_vreg_expand (vfpu_rtu_ex5_pipe6_wb_vreg_expand[63:0]), @71
//          .vfpu_rtu_ex5_pipe7_wb_vreg_vld    (vfpu_rtu_ex5_pipe7_wb_vreg_fr_vld), @72
//          .vfpu_rtu_ex5_pipe7_wb_vreg_expand (vfpu_rtu_ex5_pipe7_wb_vreg_expand[63:0])); @73
//==========================================================
//                  Instance Other Module
//==========================================================
// &Force("output","rtu_yy_xx_flush"); @78

// &Force("output","rtu_yy_xx_retire0"); @80
// &Force("output","rtu_yy_xx_retire1"); @81
// &Force("output","rtu_yy_xx_retire2"); @82
// &Instance("ct_rtu_rob", "x_ct_rtu_rob"); @83
ct_rtu_rob  x_ct_rtu_rob (
  .cp0_rtu_icg_en                       (cp0_rtu_icg_en                      ),
  .cp0_rtu_xx_int_b                     (cp0_rtu_xx_int_b                    ),
  .cp0_rtu_xx_vec                       (cp0_rtu_xx_vec                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_rtu_data_bkpt_dbgreq             (had_rtu_data_bkpt_dbgreq            ),
  .had_rtu_dbg_req_en                   (had_rtu_dbg_req_en                  ),
  .had_rtu_debug_retire_info_en         (had_rtu_debug_retire_info_en        ),
  .had_rtu_inst_bkpt_dbgreq             (had_rtu_inst_bkpt_dbgreq            ),
  .had_rtu_xx_tme                       (had_rtu_xx_tme                      ),
  .hpcp_rtu_cnt_en                      (hpcp_rtu_cnt_en                     ),
  .idu_rtu_fence_idle                   (idu_rtu_fence_idle                  ),
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
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .retire_rob_async_expt_commit_mask    (retire_rob_async_expt_commit_mask   ),
  .retire_rob_ctc_flush_req             (retire_rob_ctc_flush_req            ),
  .retire_rob_dbg_inst0_ack_int         (retire_rob_dbg_inst0_ack_int        ),
  .retire_rob_dbg_inst0_dbg_mode_on     (retire_rob_dbg_inst0_dbg_mode_on    ),
  .retire_rob_dbg_inst0_expt_vld        (retire_rob_dbg_inst0_expt_vld       ),
  .retire_rob_dbg_inst0_flush           (retire_rob_dbg_inst0_flush          ),
  .retire_rob_dbg_inst0_mispred         (retire_rob_dbg_inst0_mispred        ),
  .retire_rob_flush                     (retire_rob_flush                    ),
  .retire_rob_flush_cur_state           (retire_rob_flush_cur_state          ),
  .retire_rob_flush_gateclk             (retire_rob_flush_gateclk            ),
  .retire_rob_inst0_jmp                 (retire_rob_inst0_jmp                ),
  .retire_rob_inst1_jmp                 (retire_rob_inst1_jmp                ),
  .retire_rob_inst2_jmp                 (retire_rob_inst2_jmp                ),
  .retire_rob_inst_flush                (retire_rob_inst_flush               ),
  .retire_rob_retire_empty              (retire_rob_retire_empty             ),
  .retire_rob_rt_mask                   (retire_rob_rt_mask                  ),
  .retire_rob_split_fof_flush           (retire_rob_split_fof_flush          ),
  .retire_rob_srt_en                    (retire_rob_srt_en                   ),
  .rob_pst_retire_inst0_gateclk_vld     (rob_pst_retire_inst0_gateclk_vld    ),
  .rob_pst_retire_inst0_iid             (rob_pst_retire_inst0_iid            ),
  .rob_pst_retire_inst0_iid_updt_val    (rob_pst_retire_inst0_iid_updt_val   ),
  .rob_pst_retire_inst1_gateclk_vld     (rob_pst_retire_inst1_gateclk_vld    ),
  .rob_pst_retire_inst1_iid             (rob_pst_retire_inst1_iid            ),
  .rob_pst_retire_inst1_iid_updt_val    (rob_pst_retire_inst1_iid_updt_val   ),
  .rob_pst_retire_inst2_gateclk_vld     (rob_pst_retire_inst2_gateclk_vld    ),
  .rob_pst_retire_inst2_iid             (rob_pst_retire_inst2_iid            ),
  .rob_pst_retire_inst2_iid_updt_val    (rob_pst_retire_inst2_iid_updt_val   ),
  .rob_retire_commit0                   (rob_retire_commit0                  ),
  .rob_retire_commit1                   (rob_retire_commit1                  ),
  .rob_retire_commit2                   (rob_retire_commit2                  ),
  .rob_retire_ctc_flush_srt_en          (rob_retire_ctc_flush_srt_en         ),
  .rob_retire_inst0_bht_mispred         (rob_retire_inst0_bht_mispred        ),
  .rob_retire_inst0_bju                 (rob_retire_inst0_bju                ),
  .rob_retire_inst0_bju_inc_pc          (rob_retire_inst0_bju_inc_pc         ),
  .rob_retire_inst0_bkpt                (rob_retire_inst0_bkpt               ),
  .rob_retire_inst0_chk_idx             (rob_retire_inst0_chk_idx            ),
  .rob_retire_inst0_condbr              (rob_retire_inst0_condbr             ),
  .rob_retire_inst0_condbr_taken        (rob_retire_inst0_condbr_taken       ),
  .rob_retire_inst0_ctc_flush           (rob_retire_inst0_ctc_flush          ),
  .rob_retire_inst0_cur_pc              (rob_retire_inst0_cur_pc             ),
  .rob_retire_inst0_data_bkpt           (rob_retire_inst0_data_bkpt          ),
  .rob_retire_inst0_dbg_disable         (rob_retire_inst0_dbg_disable        ),
  .rob_retire_inst0_efpc_vld            (rob_retire_inst0_efpc_vld           ),
  .rob_retire_inst0_expt_vec            (rob_retire_inst0_expt_vec           ),
  .rob_retire_inst0_expt_vld            (rob_retire_inst0_expt_vld           ),
  .rob_retire_inst0_fp_dirty            (rob_retire_inst0_fp_dirty           ),
  .rob_retire_inst0_high_hw_expt        (rob_retire_inst0_high_hw_expt       ),
  .rob_retire_inst0_iid                 (rob_retire_inst0_iid                ),
  .rob_retire_inst0_immu_expt           (rob_retire_inst0_immu_expt          ),
  .rob_retire_inst0_inst_bkpt           (rob_retire_inst0_inst_bkpt          ),
  .rob_retire_inst0_inst_flush          (rob_retire_inst0_inst_flush         ),
  .rob_retire_inst0_int_vec             (rob_retire_inst0_int_vec            ),
  .rob_retire_inst0_int_vld             (rob_retire_inst0_int_vld            ),
  .rob_retire_inst0_intmask             (rob_retire_inst0_intmask            ),
  .rob_retire_inst0_jmp                 (rob_retire_inst0_jmp                ),
  .rob_retire_inst0_jmp_mispred         (rob_retire_inst0_jmp_mispred        ),
  .rob_retire_inst0_load                (rob_retire_inst0_load               ),
  .rob_retire_inst0_mtval               (rob_retire_inst0_mtval              ),
  .rob_retire_inst0_next_pc             (rob_retire_inst0_next_pc            ),
  .rob_retire_inst0_no_spec_hit         (rob_retire_inst0_no_spec_hit        ),
  .rob_retire_inst0_no_spec_mispred     (rob_retire_inst0_no_spec_mispred    ),
  .rob_retire_inst0_no_spec_miss        (rob_retire_inst0_no_spec_miss       ),
  .rob_retire_inst0_num                 (rob_retire_inst0_num                ),
  .rob_retire_inst0_pc_offset           (rob_retire_inst0_pc_offset          ),
  .rob_retire_inst0_pcal                (rob_retire_inst0_pcal               ),
  .rob_retire_inst0_pret                (rob_retire_inst0_pret               ),
  .rob_retire_inst0_pst_ereg_vld        (rob_retire_inst0_pst_ereg_vld       ),
  .rob_retire_inst0_pst_preg_vld        (rob_retire_inst0_pst_preg_vld       ),
  .rob_retire_inst0_pst_vreg_vld        (rob_retire_inst0_pst_vreg_vld       ),
  .rob_retire_inst0_ras                 (rob_retire_inst0_ras                ),
  .rob_retire_inst0_spec_fail           (rob_retire_inst0_spec_fail          ),
  .rob_retire_inst0_spec_fail_no_ssf    (rob_retire_inst0_spec_fail_no_ssf   ),
  .rob_retire_inst0_spec_fail_ssf       (rob_retire_inst0_spec_fail_ssf      ),
  .rob_retire_inst0_split               (rob_retire_inst0_split              ),
  .rob_retire_inst0_store               (rob_retire_inst0_store              ),
  .rob_retire_inst0_vec_dirty           (rob_retire_inst0_vec_dirty          ),
  .rob_retire_inst0_vl                  (rob_retire_inst0_vl                 ),
  .rob_retire_inst0_vl_pred             (rob_retire_inst0_vl_pred            ),
  .rob_retire_inst0_vld                 (rob_retire_inst0_vld                ),
  .rob_retire_inst0_vlmul               (rob_retire_inst0_vlmul              ),
  .rob_retire_inst0_vsetvl              (rob_retire_inst0_vsetvl             ),
  .rob_retire_inst0_vsetvli             (rob_retire_inst0_vsetvli            ),
  .rob_retire_inst0_vsew                (rob_retire_inst0_vsew               ),
  .rob_retire_inst0_vstart              (rob_retire_inst0_vstart             ),
  .rob_retire_inst0_vstart_vld          (rob_retire_inst0_vstart_vld         ),
  .rob_retire_inst1_bju                 (rob_retire_inst1_bju                ),
  .rob_retire_inst1_chk_idx             (rob_retire_inst1_chk_idx            ),
  .rob_retire_inst1_condbr              (rob_retire_inst1_condbr             ),
  .rob_retire_inst1_condbr_taken        (rob_retire_inst1_condbr_taken       ),
  .rob_retire_inst1_cur_pc              (rob_retire_inst1_cur_pc             ),
  .rob_retire_inst1_fp_dirty            (rob_retire_inst1_fp_dirty           ),
  .rob_retire_inst1_jmp                 (rob_retire_inst1_jmp                ),
  .rob_retire_inst1_load                (rob_retire_inst1_load               ),
  .rob_retire_inst1_next_pc             (rob_retire_inst1_next_pc            ),
  .rob_retire_inst1_no_spec_hit         (rob_retire_inst1_no_spec_hit        ),
  .rob_retire_inst1_no_spec_mispred     (rob_retire_inst1_no_spec_mispred    ),
  .rob_retire_inst1_no_spec_miss        (rob_retire_inst1_no_spec_miss       ),
  .rob_retire_inst1_num                 (rob_retire_inst1_num                ),
  .rob_retire_inst1_pc_offset           (rob_retire_inst1_pc_offset          ),
  .rob_retire_inst1_pst_ereg_vld        (rob_retire_inst1_pst_ereg_vld       ),
  .rob_retire_inst1_pst_preg_vld        (rob_retire_inst1_pst_preg_vld       ),
  .rob_retire_inst1_pst_vreg_vld        (rob_retire_inst1_pst_vreg_vld       ),
  .rob_retire_inst1_split               (rob_retire_inst1_split              ),
  .rob_retire_inst1_store               (rob_retire_inst1_store              ),
  .rob_retire_inst1_vec_dirty           (rob_retire_inst1_vec_dirty          ),
  .rob_retire_inst1_vl                  (rob_retire_inst1_vl                 ),
  .rob_retire_inst1_vl_pred             (rob_retire_inst1_vl_pred            ),
  .rob_retire_inst1_vld                 (rob_retire_inst1_vld                ),
  .rob_retire_inst1_vlmul               (rob_retire_inst1_vlmul              ),
  .rob_retire_inst1_vsetvli             (rob_retire_inst1_vsetvli            ),
  .rob_retire_inst1_vsew                (rob_retire_inst1_vsew               ),
  .rob_retire_inst2_bju                 (rob_retire_inst2_bju                ),
  .rob_retire_inst2_chk_idx             (rob_retire_inst2_chk_idx            ),
  .rob_retire_inst2_condbr              (rob_retire_inst2_condbr             ),
  .rob_retire_inst2_condbr_taken        (rob_retire_inst2_condbr_taken       ),
  .rob_retire_inst2_cur_pc              (rob_retire_inst2_cur_pc             ),
  .rob_retire_inst2_fp_dirty            (rob_retire_inst2_fp_dirty           ),
  .rob_retire_inst2_jmp                 (rob_retire_inst2_jmp                ),
  .rob_retire_inst2_load                (rob_retire_inst2_load               ),
  .rob_retire_inst2_next_pc             (rob_retire_inst2_next_pc            ),
  .rob_retire_inst2_no_spec_hit         (rob_retire_inst2_no_spec_hit        ),
  .rob_retire_inst2_no_spec_mispred     (rob_retire_inst2_no_spec_mispred    ),
  .rob_retire_inst2_no_spec_miss        (rob_retire_inst2_no_spec_miss       ),
  .rob_retire_inst2_num                 (rob_retire_inst2_num                ),
  .rob_retire_inst2_pc_offset           (rob_retire_inst2_pc_offset          ),
  .rob_retire_inst2_pst_ereg_vld        (rob_retire_inst2_pst_ereg_vld       ),
  .rob_retire_inst2_pst_preg_vld        (rob_retire_inst2_pst_preg_vld       ),
  .rob_retire_inst2_pst_vreg_vld        (rob_retire_inst2_pst_vreg_vld       ),
  .rob_retire_inst2_split               (rob_retire_inst2_split              ),
  .rob_retire_inst2_store               (rob_retire_inst2_store              ),
  .rob_retire_inst2_vec_dirty           (rob_retire_inst2_vec_dirty          ),
  .rob_retire_inst2_vl                  (rob_retire_inst2_vl                 ),
  .rob_retire_inst2_vl_pred             (rob_retire_inst2_vl_pred            ),
  .rob_retire_inst2_vld                 (rob_retire_inst2_vld                ),
  .rob_retire_inst2_vlmul               (rob_retire_inst2_vlmul              ),
  .rob_retire_inst2_vsetvli             (rob_retire_inst2_vsetvli            ),
  .rob_retire_inst2_vsew                (rob_retire_inst2_vsew               ),
  .rob_retire_int_srt_en                (rob_retire_int_srt_en               ),
  .rob_retire_rob_cur_pc                (rob_retire_rob_cur_pc               ),
  .rob_retire_split_spec_fail_srt       (rob_retire_split_spec_fail_srt      ),
  .rob_retire_ssf_iid                   (rob_retire_ssf_iid                  ),
  .rob_top_commit0                      (rob_top_commit0                     ),
  .rob_top_commit_st_no_vld             (rob_top_commit_st_no_vld            ),
  .rob_top_create0_iid                  (rob_top_create0_iid                 ),
  .rob_top_entry_num                    (rob_top_entry_num                   ),
  .rob_top_flush_cur_state              (rob_top_flush_cur_state             ),
  .rob_top_read0_iid                    (rob_top_read0_iid                   ),
  .rob_top_rob_cur_pc                   (rob_top_rob_cur_pc                  ),
  .rob_top_rob_full                     (rob_top_rob_full                    ),
  .rob_top_ssf_cur_state                (rob_top_ssf_cur_state               ),
  .rtu_cpu_no_retire                    (rtu_cpu_no_retire                   ),
  .rtu_had_bkpt_data_st                 (rtu_had_bkpt_data_st                ),
  .rtu_had_data_bkpta_vld               (rtu_had_data_bkpta_vld              ),
  .rtu_had_data_bkptb_vld               (rtu_had_data_bkptb_vld              ),
  .rtu_had_inst0_non_irv_bkpt           (rtu_had_inst0_non_irv_bkpt          ),
  .rtu_had_inst1_non_irv_bkpt           (rtu_had_inst1_non_irv_bkpt          ),
  .rtu_had_inst2_non_irv_bkpt           (rtu_had_inst2_non_irv_bkpt          ),
  .rtu_had_inst_bkpt_inst_vld           (rtu_had_inst_bkpt_inst_vld          ),
  .rtu_had_inst_bkpta_vld               (rtu_had_inst_bkpta_vld              ),
  .rtu_had_inst_bkptb_vld               (rtu_had_inst_bkptb_vld              ),
  .rtu_had_inst_exe_dead                (rtu_had_inst_exe_dead               ),
  .rtu_had_inst_split                   (rtu_had_inst_split                  ),
  .rtu_had_retire_inst0_info            (rtu_had_retire_inst0_info           ),
  .rtu_had_retire_inst0_vld             (rtu_had_retire_inst0_vld            ),
  .rtu_had_retire_inst1_info            (rtu_had_retire_inst1_info           ),
  .rtu_had_retire_inst1_vld             (rtu_had_retire_inst1_vld            ),
  .rtu_had_retire_inst2_info            (rtu_had_retire_inst2_info           ),
  .rtu_had_retire_inst2_vld             (rtu_had_retire_inst2_vld            ),
  .rtu_had_rob_empty                    (rtu_had_rob_empty                   ),
  .rtu_had_xx_mbkpt_chgflow             (rtu_had_xx_mbkpt_chgflow            ),
  .rtu_hpcp_inst0_cur_pc                (rtu_hpcp_inst0_cur_pc               ),
  .rtu_hpcp_inst0_jmp_pc_offset_8m      (rtu_hpcp_inst0_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst1_cur_pc                (rtu_hpcp_inst1_cur_pc               ),
  .rtu_hpcp_inst1_jmp_pc_offset_8m      (rtu_hpcp_inst1_jmp_pc_offset_8m     ),
  .rtu_hpcp_inst2_cur_pc                (rtu_hpcp_inst2_cur_pc               ),
  .rtu_hpcp_inst2_jmp_pc_offset_8m      (rtu_hpcp_inst2_jmp_pc_offset_8m     ),
  .rtu_idu_retire_int_vld               (rtu_idu_retire_int_vld              ),
  .rtu_idu_rob_empty                    (rtu_idu_rob_empty                   ),
  .rtu_idu_rob_full                     (rtu_idu_rob_full                    ),
  .rtu_idu_rob_inst0_iid                (rtu_idu_rob_inst0_iid               ),
  .rtu_idu_rob_inst1_iid                (rtu_idu_rob_inst1_iid               ),
  .rtu_idu_rob_inst2_iid                (rtu_idu_rob_inst2_iid               ),
  .rtu_idu_rob_inst3_iid                (rtu_idu_rob_inst3_iid               ),
  .rtu_iu_rob_read0_pcfifo_vld          (rtu_iu_rob_read0_pcfifo_vld         ),
  .rtu_iu_rob_read1_pcfifo_vld          (rtu_iu_rob_read1_pcfifo_vld         ),
  .rtu_iu_rob_read2_pcfifo_vld          (rtu_iu_rob_read2_pcfifo_vld         ),
  .rtu_iu_rob_read_pcfifo_gateclk_vld   (rtu_iu_rob_read_pcfifo_gateclk_vld  ),
  .rtu_lsu_commit0_iid_updt_val         (rtu_lsu_commit0_iid_updt_val        ),
  .rtu_lsu_commit1_iid_updt_val         (rtu_lsu_commit1_iid_updt_val        ),
  .rtu_lsu_commit2_iid_updt_val         (rtu_lsu_commit2_iid_updt_val        ),
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
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .rtu_yy_xx_retire0                    (rtu_yy_xx_retire0                   ),
  .rtu_yy_xx_retire1                    (rtu_yy_xx_retire1                   ),
  .rtu_yy_xx_retire2                    (rtu_yy_xx_retire2                   ),
  .vfpu_rtu_pipe6_cmplt                 (vfpu_rtu_pipe6_cmplt                ),
  .vfpu_rtu_pipe6_iid                   (vfpu_rtu_pipe6_iid                  ),
  .vfpu_rtu_pipe7_cmplt                 (vfpu_rtu_pipe7_cmplt                ),
  .vfpu_rtu_pipe7_iid                   (vfpu_rtu_pipe7_iid                  )
);

// &Instance("ct_rtu_retire", "x_ct_rtu_retire"); @84
ct_rtu_retire  x_ct_rtu_retire (
  .cp0_rtu_icg_en                       (cp0_rtu_icg_en                      ),
  .cp0_rtu_srt_en                       (cp0_rtu_srt_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_rtu_dbg_disable                  (had_rtu_dbg_disable                 ),
  .had_rtu_dbg_req_en                   (had_rtu_dbg_req_en                  ),
  .had_rtu_event_dbgreq                 (had_rtu_event_dbgreq                ),
  .had_rtu_fdb                          (had_rtu_fdb                         ),
  .had_rtu_hw_dbgreq                    (had_rtu_hw_dbgreq                   ),
  .had_rtu_hw_dbgreq_gateclk            (had_rtu_hw_dbgreq_gateclk           ),
  .had_rtu_non_irv_bkpt_dbgreq          (had_rtu_non_irv_bkpt_dbgreq         ),
  .had_rtu_pop1_disa                    (had_rtu_pop1_disa                   ),
  .had_rtu_trace_dbgreq                 (had_rtu_trace_dbgreq                ),
  .had_rtu_trace_en                     (had_rtu_trace_en                    ),
  .had_rtu_xx_jdbreq                    (had_rtu_xx_jdbreq                   ),
  .had_yy_xx_exit_dbg                   (had_yy_xx_exit_dbg                  ),
  .hpcp_rtu_cnt_en                      (hpcp_rtu_cnt_en                     ),
  .lsu_rtu_all_commit_data_vld          (lsu_rtu_all_commit_data_vld         ),
  .lsu_rtu_async_expt_addr              (lsu_rtu_async_expt_addr             ),
  .lsu_rtu_async_expt_vld               (lsu_rtu_async_expt_vld              ),
  .lsu_rtu_ctc_flush_vld                (lsu_rtu_ctc_flush_vld               ),
  .mmu_xx_mmu_en                        (mmu_xx_mmu_en                       ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pst_retire_retired_reg_wb            (pst_retire_retired_reg_wb           ),
  .retire_pst_async_flush               (retire_pst_async_flush              ),
  .retire_pst_wb_retire_inst0_ereg_vld  (retire_pst_wb_retire_inst0_ereg_vld ),
  .retire_pst_wb_retire_inst0_preg_vld  (retire_pst_wb_retire_inst0_preg_vld ),
  .retire_pst_wb_retire_inst0_vreg_vld  (retire_pst_wb_retire_inst0_vreg_vld ),
  .retire_pst_wb_retire_inst1_ereg_vld  (retire_pst_wb_retire_inst1_ereg_vld ),
  .retire_pst_wb_retire_inst1_preg_vld  (retire_pst_wb_retire_inst1_preg_vld ),
  .retire_pst_wb_retire_inst1_vreg_vld  (retire_pst_wb_retire_inst1_vreg_vld ),
  .retire_pst_wb_retire_inst2_ereg_vld  (retire_pst_wb_retire_inst2_ereg_vld ),
  .retire_pst_wb_retire_inst2_preg_vld  (retire_pst_wb_retire_inst2_preg_vld ),
  .retire_pst_wb_retire_inst2_vreg_vld  (retire_pst_wb_retire_inst2_vreg_vld ),
  .retire_rob_async_expt_commit_mask    (retire_rob_async_expt_commit_mask   ),
  .retire_rob_ctc_flush_req             (retire_rob_ctc_flush_req            ),
  .retire_rob_dbg_inst0_ack_int         (retire_rob_dbg_inst0_ack_int        ),
  .retire_rob_dbg_inst0_dbg_mode_on     (retire_rob_dbg_inst0_dbg_mode_on    ),
  .retire_rob_dbg_inst0_expt_vld        (retire_rob_dbg_inst0_expt_vld       ),
  .retire_rob_dbg_inst0_flush           (retire_rob_dbg_inst0_flush          ),
  .retire_rob_dbg_inst0_mispred         (retire_rob_dbg_inst0_mispred        ),
  .retire_rob_flush                     (retire_rob_flush                    ),
  .retire_rob_flush_cur_state           (retire_rob_flush_cur_state          ),
  .retire_rob_flush_gateclk             (retire_rob_flush_gateclk            ),
  .retire_rob_inst0_jmp                 (retire_rob_inst0_jmp                ),
  .retire_rob_inst1_jmp                 (retire_rob_inst1_jmp                ),
  .retire_rob_inst2_jmp                 (retire_rob_inst2_jmp                ),
  .retire_rob_inst_flush                (retire_rob_inst_flush               ),
  .retire_rob_retire_empty              (retire_rob_retire_empty             ),
  .retire_rob_rt_mask                   (retire_rob_rt_mask                  ),
  .retire_rob_split_fof_flush           (retire_rob_split_fof_flush          ),
  .retire_rob_srt_en                    (retire_rob_srt_en                   ),
  .retire_top_ae_cur_state              (retire_top_ae_cur_state             ),
  .rob_retire_commit0                   (rob_retire_commit0                  ),
  .rob_retire_commit1                   (rob_retire_commit1                  ),
  .rob_retire_commit2                   (rob_retire_commit2                  ),
  .rob_retire_ctc_flush_srt_en          (rob_retire_ctc_flush_srt_en         ),
  .rob_retire_inst0_bht_mispred         (rob_retire_inst0_bht_mispred        ),
  .rob_retire_inst0_bju                 (rob_retire_inst0_bju                ),
  .rob_retire_inst0_bju_inc_pc          (rob_retire_inst0_bju_inc_pc         ),
  .rob_retire_inst0_bkpt                (rob_retire_inst0_bkpt               ),
  .rob_retire_inst0_chk_idx             (rob_retire_inst0_chk_idx            ),
  .rob_retire_inst0_condbr              (rob_retire_inst0_condbr             ),
  .rob_retire_inst0_condbr_taken        (rob_retire_inst0_condbr_taken       ),
  .rob_retire_inst0_ctc_flush           (rob_retire_inst0_ctc_flush          ),
  .rob_retire_inst0_cur_pc              (rob_retire_inst0_cur_pc             ),
  .rob_retire_inst0_data_bkpt           (rob_retire_inst0_data_bkpt          ),
  .rob_retire_inst0_dbg_disable         (rob_retire_inst0_dbg_disable        ),
  .rob_retire_inst0_efpc_vld            (rob_retire_inst0_efpc_vld           ),
  .rob_retire_inst0_expt_vec            (rob_retire_inst0_expt_vec           ),
  .rob_retire_inst0_expt_vld            (rob_retire_inst0_expt_vld           ),
  .rob_retire_inst0_fp_dirty            (rob_retire_inst0_fp_dirty           ),
  .rob_retire_inst0_high_hw_expt        (rob_retire_inst0_high_hw_expt       ),
  .rob_retire_inst0_iid                 (rob_retire_inst0_iid                ),
  .rob_retire_inst0_immu_expt           (rob_retire_inst0_immu_expt          ),
  .rob_retire_inst0_inst_bkpt           (rob_retire_inst0_inst_bkpt          ),
  .rob_retire_inst0_inst_flush          (rob_retire_inst0_inst_flush         ),
  .rob_retire_inst0_int_vec             (rob_retire_inst0_int_vec            ),
  .rob_retire_inst0_int_vld             (rob_retire_inst0_int_vld            ),
  .rob_retire_inst0_intmask             (rob_retire_inst0_intmask            ),
  .rob_retire_inst0_jmp                 (rob_retire_inst0_jmp                ),
  .rob_retire_inst0_jmp_mispred         (rob_retire_inst0_jmp_mispred        ),
  .rob_retire_inst0_load                (rob_retire_inst0_load               ),
  .rob_retire_inst0_mtval               (rob_retire_inst0_mtval              ),
  .rob_retire_inst0_next_pc             (rob_retire_inst0_next_pc            ),
  .rob_retire_inst0_no_spec_hit         (rob_retire_inst0_no_spec_hit        ),
  .rob_retire_inst0_no_spec_mispred     (rob_retire_inst0_no_spec_mispred    ),
  .rob_retire_inst0_no_spec_miss        (rob_retire_inst0_no_spec_miss       ),
  .rob_retire_inst0_num                 (rob_retire_inst0_num                ),
  .rob_retire_inst0_pc_offset           (rob_retire_inst0_pc_offset          ),
  .rob_retire_inst0_pcal                (rob_retire_inst0_pcal               ),
  .rob_retire_inst0_pret                (rob_retire_inst0_pret               ),
  .rob_retire_inst0_pst_ereg_vld        (rob_retire_inst0_pst_ereg_vld       ),
  .rob_retire_inst0_pst_preg_vld        (rob_retire_inst0_pst_preg_vld       ),
  .rob_retire_inst0_pst_vreg_vld        (rob_retire_inst0_pst_vreg_vld       ),
  .rob_retire_inst0_ras                 (rob_retire_inst0_ras                ),
  .rob_retire_inst0_spec_fail           (rob_retire_inst0_spec_fail          ),
  .rob_retire_inst0_spec_fail_no_ssf    (rob_retire_inst0_spec_fail_no_ssf   ),
  .rob_retire_inst0_spec_fail_ssf       (rob_retire_inst0_spec_fail_ssf      ),
  .rob_retire_inst0_split               (rob_retire_inst0_split              ),
  .rob_retire_inst0_store               (rob_retire_inst0_store              ),
  .rob_retire_inst0_vec_dirty           (rob_retire_inst0_vec_dirty          ),
  .rob_retire_inst0_vl                  (rob_retire_inst0_vl                 ),
  .rob_retire_inst0_vl_pred             (rob_retire_inst0_vl_pred            ),
  .rob_retire_inst0_vld                 (rob_retire_inst0_vld                ),
  .rob_retire_inst0_vlmul               (rob_retire_inst0_vlmul              ),
  .rob_retire_inst0_vsetvl              (rob_retire_inst0_vsetvl             ),
  .rob_retire_inst0_vsetvli             (rob_retire_inst0_vsetvli            ),
  .rob_retire_inst0_vsew                (rob_retire_inst0_vsew               ),
  .rob_retire_inst0_vstart              (rob_retire_inst0_vstart             ),
  .rob_retire_inst0_vstart_vld          (rob_retire_inst0_vstart_vld         ),
  .rob_retire_inst1_bju                 (rob_retire_inst1_bju                ),
  .rob_retire_inst1_chk_idx             (rob_retire_inst1_chk_idx            ),
  .rob_retire_inst1_condbr              (rob_retire_inst1_condbr             ),
  .rob_retire_inst1_condbr_taken        (rob_retire_inst1_condbr_taken       ),
  .rob_retire_inst1_cur_pc              (rob_retire_inst1_cur_pc             ),
  .rob_retire_inst1_fp_dirty            (rob_retire_inst1_fp_dirty           ),
  .rob_retire_inst1_jmp                 (rob_retire_inst1_jmp                ),
  .rob_retire_inst1_load                (rob_retire_inst1_load               ),
  .rob_retire_inst1_next_pc             (rob_retire_inst1_next_pc            ),
  .rob_retire_inst1_no_spec_hit         (rob_retire_inst1_no_spec_hit        ),
  .rob_retire_inst1_no_spec_mispred     (rob_retire_inst1_no_spec_mispred    ),
  .rob_retire_inst1_no_spec_miss        (rob_retire_inst1_no_spec_miss       ),
  .rob_retire_inst1_num                 (rob_retire_inst1_num                ),
  .rob_retire_inst1_pc_offset           (rob_retire_inst1_pc_offset          ),
  .rob_retire_inst1_pst_ereg_vld        (rob_retire_inst1_pst_ereg_vld       ),
  .rob_retire_inst1_pst_preg_vld        (rob_retire_inst1_pst_preg_vld       ),
  .rob_retire_inst1_pst_vreg_vld        (rob_retire_inst1_pst_vreg_vld       ),
  .rob_retire_inst1_split               (rob_retire_inst1_split              ),
  .rob_retire_inst1_store               (rob_retire_inst1_store              ),
  .rob_retire_inst1_vec_dirty           (rob_retire_inst1_vec_dirty          ),
  .rob_retire_inst1_vl                  (rob_retire_inst1_vl                 ),
  .rob_retire_inst1_vl_pred             (rob_retire_inst1_vl_pred            ),
  .rob_retire_inst1_vld                 (rob_retire_inst1_vld                ),
  .rob_retire_inst1_vlmul               (rob_retire_inst1_vlmul              ),
  .rob_retire_inst1_vsetvli             (rob_retire_inst1_vsetvli            ),
  .rob_retire_inst1_vsew                (rob_retire_inst1_vsew               ),
  .rob_retire_inst2_bju                 (rob_retire_inst2_bju                ),
  .rob_retire_inst2_chk_idx             (rob_retire_inst2_chk_idx            ),
  .rob_retire_inst2_condbr              (rob_retire_inst2_condbr             ),
  .rob_retire_inst2_condbr_taken        (rob_retire_inst2_condbr_taken       ),
  .rob_retire_inst2_cur_pc              (rob_retire_inst2_cur_pc             ),
  .rob_retire_inst2_fp_dirty            (rob_retire_inst2_fp_dirty           ),
  .rob_retire_inst2_jmp                 (rob_retire_inst2_jmp                ),
  .rob_retire_inst2_load                (rob_retire_inst2_load               ),
  .rob_retire_inst2_next_pc             (rob_retire_inst2_next_pc            ),
  .rob_retire_inst2_no_spec_hit         (rob_retire_inst2_no_spec_hit        ),
  .rob_retire_inst2_no_spec_mispred     (rob_retire_inst2_no_spec_mispred    ),
  .rob_retire_inst2_no_spec_miss        (rob_retire_inst2_no_spec_miss       ),
  .rob_retire_inst2_num                 (rob_retire_inst2_num                ),
  .rob_retire_inst2_pc_offset           (rob_retire_inst2_pc_offset          ),
  .rob_retire_inst2_pst_ereg_vld        (rob_retire_inst2_pst_ereg_vld       ),
  .rob_retire_inst2_pst_preg_vld        (rob_retire_inst2_pst_preg_vld       ),
  .rob_retire_inst2_pst_vreg_vld        (rob_retire_inst2_pst_vreg_vld       ),
  .rob_retire_inst2_split               (rob_retire_inst2_split              ),
  .rob_retire_inst2_store               (rob_retire_inst2_store              ),
  .rob_retire_inst2_vec_dirty           (rob_retire_inst2_vec_dirty          ),
  .rob_retire_inst2_vl                  (rob_retire_inst2_vl                 ),
  .rob_retire_inst2_vl_pred             (rob_retire_inst2_vl_pred            ),
  .rob_retire_inst2_vld                 (rob_retire_inst2_vld                ),
  .rob_retire_inst2_vlmul               (rob_retire_inst2_vlmul              ),
  .rob_retire_inst2_vsetvli             (rob_retire_inst2_vsetvli            ),
  .rob_retire_inst2_vsew                (rob_retire_inst2_vsew               ),
  .rob_retire_int_srt_en                (rob_retire_int_srt_en               ),
  .rob_retire_rob_cur_pc                (rob_retire_rob_cur_pc               ),
  .rob_retire_split_spec_fail_srt       (rob_retire_split_spec_fail_srt      ),
  .rob_retire_ssf_iid                   (rob_retire_ssf_iid                  ),
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
  .rtu_had_dbg_ack_info                 (rtu_had_dbg_ack_info                ),
  .rtu_had_dbgreq_ack                   (rtu_had_dbgreq_ack                  ),
  .rtu_had_inst0_bkpt_inst              (rtu_had_inst0_bkpt_inst             ),
  .rtu_had_xx_dbg_ack_pc                (rtu_had_xx_dbg_ack_pc               ),
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
  .rtu_hpcp_inst0_jmp                   (rtu_hpcp_inst0_jmp                  ),
  .rtu_hpcp_inst0_jmp_mispred           (rtu_hpcp_inst0_jmp_mispred          ),
  .rtu_hpcp_inst0_num                   (rtu_hpcp_inst0_num                  ),
  .rtu_hpcp_inst0_pc_offset             (rtu_hpcp_inst0_pc_offset            ),
  .rtu_hpcp_inst0_spec_fail             (rtu_hpcp_inst0_spec_fail            ),
  .rtu_hpcp_inst0_split                 (rtu_hpcp_inst0_split                ),
  .rtu_hpcp_inst0_store                 (rtu_hpcp_inst0_store                ),
  .rtu_hpcp_inst0_vld                   (rtu_hpcp_inst0_vld                  ),
  .rtu_hpcp_inst1_condbr                (rtu_hpcp_inst1_condbr               ),
  .rtu_hpcp_inst1_jmp                   (rtu_hpcp_inst1_jmp                  ),
  .rtu_hpcp_inst1_num                   (rtu_hpcp_inst1_num                  ),
  .rtu_hpcp_inst1_pc_offset             (rtu_hpcp_inst1_pc_offset            ),
  .rtu_hpcp_inst1_split                 (rtu_hpcp_inst1_split                ),
  .rtu_hpcp_inst1_store                 (rtu_hpcp_inst1_store                ),
  .rtu_hpcp_inst1_vld                   (rtu_hpcp_inst1_vld                  ),
  .rtu_hpcp_inst2_condbr                (rtu_hpcp_inst2_condbr               ),
  .rtu_hpcp_inst2_jmp                   (rtu_hpcp_inst2_jmp                  ),
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
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
  .rtu_idu_flush_stall                  (rtu_idu_flush_stall                 ),
  .rtu_idu_retire0_inst_vld             (rtu_idu_retire0_inst_vld            ),
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
  .rtu_lsu_async_flush                  (rtu_lsu_async_flush                 ),
  .rtu_lsu_eret_flush                   (rtu_lsu_eret_flush                  ),
  .rtu_lsu_expt_flush                   (rtu_lsu_expt_flush                  ),
  .rtu_lsu_spec_fail_flush              (rtu_lsu_spec_fail_flush             ),
  .rtu_lsu_spec_fail_iid                (rtu_lsu_spec_fail_iid               ),
  .rtu_mmu_bad_vpn                      (rtu_mmu_bad_vpn                     ),
  .rtu_mmu_expt_vld                     (rtu_mmu_expt_vld                    ),
  .rtu_yy_xx_dbgon                      (rtu_yy_xx_dbgon                     ),
  .rtu_yy_xx_expt_vec                   (rtu_yy_xx_expt_vec                  ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .rtu_yy_xx_retire0_normal             (rtu_yy_xx_retire0_normal            )
);


//==========================================================
//                       Instance
//==========================================================
assign rtu_had_debug_info[2:0]   = pst_top_retired_reg_wb[2:0];
assign rtu_had_debug_info[3]     = rob_top_rob_full;
assign rtu_had_debug_info[10:4]  = rob_top_read0_iid[6:0];
assign rtu_had_debug_info[17:11] = rob_top_create0_iid[6:0];
assign rtu_had_debug_info[24:18] = rob_top_entry_num[6:0];
assign rtu_had_debug_info[31:25] = rob_top_rob_cur_pc[6:0];
assign rtu_had_debug_info[32]    = rob_top_commit0;
assign rtu_had_debug_info[33]    = rob_top_commit_st_no_vld;
assign rtu_had_debug_info[38:34] = rob_top_flush_cur_state[4:0];
assign rtu_had_debug_info[40:39] = retire_top_ae_cur_state[1:0];
assign rtu_had_debug_info[42:41] = rob_top_ssf_cur_state[1:0];

//for coverage

// &ModuleEnd; @176
endmodule









