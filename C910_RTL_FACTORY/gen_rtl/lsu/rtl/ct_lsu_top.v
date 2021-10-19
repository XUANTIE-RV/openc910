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
module ct_lsu_top(
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
  cp0_lsu_amr,
  cp0_lsu_amr2,
  cp0_lsu_cb_aclr_dis,
  cp0_lsu_corr_dis,
  cp0_lsu_ctc_flush_dis,
  cp0_lsu_da_fwd_dis,
  cp0_lsu_dcache_clr,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_inv,
  cp0_lsu_dcache_pref_dist,
  cp0_lsu_dcache_pref_en,
  cp0_lsu_dcache_read_index,
  cp0_lsu_dcache_read_ld_tag,
  cp0_lsu_dcache_read_req,
  cp0_lsu_dcache_read_st_tag,
  cp0_lsu_dcache_read_way,
  cp0_lsu_icg_en,
  cp0_lsu_l2_pref_dist,
  cp0_lsu_l2_pref_en,
  cp0_lsu_l2_st_pref_en,
  cp0_lsu_mm,
  cp0_lsu_no_op_req,
  cp0_lsu_nsfe,
  cp0_lsu_pfu_mmu_dis,
  cp0_lsu_timeout_cnt,
  cp0_lsu_tvm,
  cp0_lsu_ucme,
  cp0_lsu_vstart,
  cp0_lsu_wa,
  cp0_lsu_wr_burst_dis,
  cp0_yy_clk_en,
  cp0_yy_dcache_pref_en,
  cp0_yy_priv_mode,
  cp0_yy_virtual_mode,
  cpurst_b,
  forever_cpuclk,
  had_lsu_bus_trace_en,
  had_lsu_dbg_en,
  had_yy_xx_bkpta_base,
  had_yy_xx_bkpta_mask,
  had_yy_xx_bkpta_rc,
  had_yy_xx_bkptb_base,
  had_yy_xx_bkptb_mask,
  had_yy_xx_bkptb_rc,
  hpcp_lsu_cnt_en,
  idu_lsu_rf_pipe3_already_da,
  idu_lsu_rf_pipe3_atomic,
  idu_lsu_rf_pipe3_bkpta_data,
  idu_lsu_rf_pipe3_bkptb_data,
  idu_lsu_rf_pipe3_gateclk_sel,
  idu_lsu_rf_pipe3_iid,
  idu_lsu_rf_pipe3_inst_fls,
  idu_lsu_rf_pipe3_inst_ldr,
  idu_lsu_rf_pipe3_inst_size,
  idu_lsu_rf_pipe3_inst_type,
  idu_lsu_rf_pipe3_lch_entry,
  idu_lsu_rf_pipe3_lsfifo,
  idu_lsu_rf_pipe3_no_spec,
  idu_lsu_rf_pipe3_no_spec_exist,
  idu_lsu_rf_pipe3_off_0_extend,
  idu_lsu_rf_pipe3_offset,
  idu_lsu_rf_pipe3_offset_plus,
  idu_lsu_rf_pipe3_oldest,
  idu_lsu_rf_pipe3_pc,
  idu_lsu_rf_pipe3_preg,
  idu_lsu_rf_pipe3_sel,
  idu_lsu_rf_pipe3_shift,
  idu_lsu_rf_pipe3_sign_extend,
  idu_lsu_rf_pipe3_spec_fail,
  idu_lsu_rf_pipe3_split,
  idu_lsu_rf_pipe3_src0,
  idu_lsu_rf_pipe3_src1,
  idu_lsu_rf_pipe3_unalign_2nd,
  idu_lsu_rf_pipe3_vreg,
  idu_lsu_rf_pipe4_already_da,
  idu_lsu_rf_pipe4_atomic,
  idu_lsu_rf_pipe4_bkpta_data,
  idu_lsu_rf_pipe4_bkptb_data,
  idu_lsu_rf_pipe4_fence_mode,
  idu_lsu_rf_pipe4_gateclk_sel,
  idu_lsu_rf_pipe4_icc,
  idu_lsu_rf_pipe4_iid,
  idu_lsu_rf_pipe4_inst_code,
  idu_lsu_rf_pipe4_inst_fls,
  idu_lsu_rf_pipe4_inst_flush,
  idu_lsu_rf_pipe4_inst_mode,
  idu_lsu_rf_pipe4_inst_share,
  idu_lsu_rf_pipe4_inst_size,
  idu_lsu_rf_pipe4_inst_str,
  idu_lsu_rf_pipe4_inst_type,
  idu_lsu_rf_pipe4_lch_entry,
  idu_lsu_rf_pipe4_lsfifo,
  idu_lsu_rf_pipe4_mmu_req,
  idu_lsu_rf_pipe4_no_spec,
  idu_lsu_rf_pipe4_off_0_extend,
  idu_lsu_rf_pipe4_offset,
  idu_lsu_rf_pipe4_offset_plus,
  idu_lsu_rf_pipe4_oldest,
  idu_lsu_rf_pipe4_pc,
  idu_lsu_rf_pipe4_sdiq_entry,
  idu_lsu_rf_pipe4_sel,
  idu_lsu_rf_pipe4_shift,
  idu_lsu_rf_pipe4_spec_fail,
  idu_lsu_rf_pipe4_split,
  idu_lsu_rf_pipe4_src0,
  idu_lsu_rf_pipe4_src1,
  idu_lsu_rf_pipe4_st,
  idu_lsu_rf_pipe4_staddr,
  idu_lsu_rf_pipe4_sync_fence,
  idu_lsu_rf_pipe4_unalign_2nd,
  idu_lsu_rf_pipe5_gateclk_sel,
  idu_lsu_rf_pipe5_sdiq_entry,
  idu_lsu_rf_pipe5_sel,
  idu_lsu_rf_pipe5_src0,
  idu_lsu_rf_pipe5_srcv0_fr,
  idu_lsu_rf_pipe5_srcv0_fr_vld,
  idu_lsu_rf_pipe5_srcv0_vld,
  idu_lsu_rf_pipe5_srcv0_vr0,
  idu_lsu_rf_pipe5_srcv0_vr1,
  idu_lsu_rf_pipe5_stdata1_vld,
  idu_lsu_rf_pipe5_unalign,
  idu_lsu_vmb_create0_dp_en,
  idu_lsu_vmb_create0_dst_ready,
  idu_lsu_vmb_create0_en,
  idu_lsu_vmb_create0_gateclk_en,
  idu_lsu_vmb_create0_sdiq_entry,
  idu_lsu_vmb_create0_split_num,
  idu_lsu_vmb_create0_unit_stride,
  idu_lsu_vmb_create0_vamo,
  idu_lsu_vmb_create0_vl,
  idu_lsu_vmb_create0_vreg,
  idu_lsu_vmb_create0_vsew,
  idu_lsu_vmb_create1_dp_en,
  idu_lsu_vmb_create1_dst_ready,
  idu_lsu_vmb_create1_en,
  idu_lsu_vmb_create1_gateclk_en,
  idu_lsu_vmb_create1_sdiq_entry,
  idu_lsu_vmb_create1_split_num,
  idu_lsu_vmb_create1_unit_stride,
  idu_lsu_vmb_create1_vamo,
  idu_lsu_vmb_create1_vl,
  idu_lsu_vmb_create1_vreg,
  idu_lsu_vmb_create1_vsew,
  ifu_lsu_icache_inv_done,
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
  lsu_cp0_dcache_done,
  lsu_cp0_dcache_read_data,
  lsu_cp0_dcache_read_data_vld,
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
  lsu_idu_ag_pipe3_load_inst_vld,
  lsu_idu_ag_pipe3_preg_dup0,
  lsu_idu_ag_pipe3_preg_dup1,
  lsu_idu_ag_pipe3_preg_dup2,
  lsu_idu_ag_pipe3_preg_dup3,
  lsu_idu_ag_pipe3_preg_dup4,
  lsu_idu_ag_pipe3_vload_inst_vld,
  lsu_idu_ag_pipe3_vreg_dup0,
  lsu_idu_ag_pipe3_vreg_dup1,
  lsu_idu_ag_pipe3_vreg_dup2,
  lsu_idu_ag_pipe3_vreg_dup3,
  lsu_idu_already_da,
  lsu_idu_bkpta_data,
  lsu_idu_bkptb_data,
  lsu_idu_da_pipe3_fwd_preg,
  lsu_idu_da_pipe3_fwd_preg_data,
  lsu_idu_da_pipe3_fwd_preg_vld,
  lsu_idu_da_pipe3_fwd_vreg,
  lsu_idu_da_pipe3_fwd_vreg_fr_data,
  lsu_idu_da_pipe3_fwd_vreg_vld,
  lsu_idu_da_pipe3_fwd_vreg_vr0_data,
  lsu_idu_da_pipe3_fwd_vreg_vr1_data,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3,
  lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4,
  lsu_idu_dc_pipe3_load_inst_vld_dup0,
  lsu_idu_dc_pipe3_load_inst_vld_dup1,
  lsu_idu_dc_pipe3_load_inst_vld_dup2,
  lsu_idu_dc_pipe3_load_inst_vld_dup3,
  lsu_idu_dc_pipe3_load_inst_vld_dup4,
  lsu_idu_dc_pipe3_preg_dup0,
  lsu_idu_dc_pipe3_preg_dup1,
  lsu_idu_dc_pipe3_preg_dup2,
  lsu_idu_dc_pipe3_preg_dup3,
  lsu_idu_dc_pipe3_preg_dup4,
  lsu_idu_dc_pipe3_vload_fwd_inst_vld,
  lsu_idu_dc_pipe3_vload_inst_vld_dup0,
  lsu_idu_dc_pipe3_vload_inst_vld_dup1,
  lsu_idu_dc_pipe3_vload_inst_vld_dup2,
  lsu_idu_dc_pipe3_vload_inst_vld_dup3,
  lsu_idu_dc_pipe3_vreg_dup0,
  lsu_idu_dc_pipe3_vreg_dup1,
  lsu_idu_dc_pipe3_vreg_dup2,
  lsu_idu_dc_pipe3_vreg_dup3,
  lsu_idu_dc_sdiq_entry,
  lsu_idu_dc_staddr1_vld,
  lsu_idu_dc_staddr_unalign,
  lsu_idu_dc_staddr_vld,
  lsu_idu_ex1_sdiq_entry,
  lsu_idu_ex1_sdiq_frz_clr,
  lsu_idu_ex1_sdiq_pop_vld,
  lsu_idu_lq_full,
  lsu_idu_lq_full_gateclk_en,
  lsu_idu_lq_not_full,
  lsu_idu_lsiq_pop0_vld,
  lsu_idu_lsiq_pop1_vld,
  lsu_idu_lsiq_pop_entry,
  lsu_idu_lsiq_pop_vld,
  lsu_idu_no_fence,
  lsu_idu_rb_full,
  lsu_idu_rb_full_gateclk_en,
  lsu_idu_rb_not_full,
  lsu_idu_secd,
  lsu_idu_spec_fail,
  lsu_idu_sq_full,
  lsu_idu_sq_full_gateclk_en,
  lsu_idu_sq_not_full,
  lsu_idu_tlb_busy,
  lsu_idu_tlb_busy_gateclk_en,
  lsu_idu_tlb_wakeup,
  lsu_idu_unalign_gateclk_en,
  lsu_idu_vmb_1_left_updt,
  lsu_idu_vmb_create0_entry,
  lsu_idu_vmb_create1_entry,
  lsu_idu_vmb_empty,
  lsu_idu_vmb_full,
  lsu_idu_vmb_full_updt,
  lsu_idu_vmb_full_updt_clk_en,
  lsu_idu_wait_fence,
  lsu_idu_wait_fence_gateclk_en,
  lsu_idu_wait_old,
  lsu_idu_wait_old_gateclk_en,
  lsu_idu_wakeup,
  lsu_idu_wb_pipe3_fwd_vreg,
  lsu_idu_wb_pipe3_fwd_vreg_vld,
  lsu_idu_wb_pipe3_wb_preg,
  lsu_idu_wb_pipe3_wb_preg_data,
  lsu_idu_wb_pipe3_wb_preg_dup0,
  lsu_idu_wb_pipe3_wb_preg_dup1,
  lsu_idu_wb_pipe3_wb_preg_dup2,
  lsu_idu_wb_pipe3_wb_preg_dup3,
  lsu_idu_wb_pipe3_wb_preg_dup4,
  lsu_idu_wb_pipe3_wb_preg_expand,
  lsu_idu_wb_pipe3_wb_preg_vld,
  lsu_idu_wb_pipe3_wb_preg_vld_dup0,
  lsu_idu_wb_pipe3_wb_preg_vld_dup1,
  lsu_idu_wb_pipe3_wb_preg_vld_dup2,
  lsu_idu_wb_pipe3_wb_preg_vld_dup3,
  lsu_idu_wb_pipe3_wb_preg_vld_dup4,
  lsu_idu_wb_pipe3_wb_vreg_dup0,
  lsu_idu_wb_pipe3_wb_vreg_dup1,
  lsu_idu_wb_pipe3_wb_vreg_dup2,
  lsu_idu_wb_pipe3_wb_vreg_dup3,
  lsu_idu_wb_pipe3_wb_vreg_fr_data,
  lsu_idu_wb_pipe3_wb_vreg_fr_expand,
  lsu_idu_wb_pipe3_wb_vreg_fr_vld,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup0,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup1,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup2,
  lsu_idu_wb_pipe3_wb_vreg_vld_dup3,
  lsu_idu_wb_pipe3_wb_vreg_vr0_data,
  lsu_idu_wb_pipe3_wb_vreg_vr0_expand,
  lsu_idu_wb_pipe3_wb_vreg_vr0_vld,
  lsu_idu_wb_pipe3_wb_vreg_vr1_data,
  lsu_idu_wb_pipe3_wb_vreg_vr1_expand,
  lsu_idu_wb_pipe3_wb_vreg_vr1_vld,
  lsu_ifu_icache_all_inv,
  lsu_ifu_icache_index,
  lsu_ifu_icache_line_inv,
  lsu_ifu_icache_ptag,
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
  lsu_yy_xx_no_op,
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
  pad_yy_icg_scan_en,
  rtu_lsu_async_flush,
  rtu_lsu_commit0_iid_updt_val,
  rtu_lsu_commit1_iid_updt_val,
  rtu_lsu_commit2_iid_updt_val,
  rtu_lsu_eret_flush,
  rtu_lsu_expt_flush,
  rtu_lsu_spec_fail_flush,
  rtu_lsu_spec_fail_iid,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush
);

// &Ports; @25
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
input            cp0_lsu_amr;                            
input            cp0_lsu_amr2;                           
input            cp0_lsu_cb_aclr_dis;                    
input            cp0_lsu_corr_dis;                       
input            cp0_lsu_ctc_flush_dis;                  
input            cp0_lsu_da_fwd_dis;                     
input            cp0_lsu_dcache_clr;                     
input            cp0_lsu_dcache_en;                      
input            cp0_lsu_dcache_inv;                     
input   [1  :0]  cp0_lsu_dcache_pref_dist;               
input            cp0_lsu_dcache_pref_en;                 
input   [16 :0]  cp0_lsu_dcache_read_index;              
input            cp0_lsu_dcache_read_ld_tag;             
input            cp0_lsu_dcache_read_req;                
input            cp0_lsu_dcache_read_st_tag;             
input            cp0_lsu_dcache_read_way;                
input            cp0_lsu_icg_en;                         
input   [1  :0]  cp0_lsu_l2_pref_dist;                   
input            cp0_lsu_l2_pref_en;                     
input            cp0_lsu_l2_st_pref_en;                  
input            cp0_lsu_mm;                             
input            cp0_lsu_no_op_req;                      
input            cp0_lsu_nsfe;                           
input            cp0_lsu_pfu_mmu_dis;                    
input   [29 :0]  cp0_lsu_timeout_cnt;                    
input            cp0_lsu_tvm;                            
input            cp0_lsu_ucme;                           
input   [6  :0]  cp0_lsu_vstart;                         
input            cp0_lsu_wa;                             
input            cp0_lsu_wr_burst_dis;                   
input            cp0_yy_clk_en;                          
input            cp0_yy_dcache_pref_en;                  
input   [1  :0]  cp0_yy_priv_mode;                       
input            cp0_yy_virtual_mode;                    
input            cpurst_b;                               
input            forever_cpuclk;                         
input            had_lsu_bus_trace_en;                   
input            had_lsu_dbg_en;                         
input   [39 :0]  had_yy_xx_bkpta_base;                   
input   [7  :0]  had_yy_xx_bkpta_mask;                   
input            had_yy_xx_bkpta_rc;                     
input   [39 :0]  had_yy_xx_bkptb_base;                   
input   [7  :0]  had_yy_xx_bkptb_mask;                   
input            had_yy_xx_bkptb_rc;                     
input            hpcp_lsu_cnt_en;                        
input            idu_lsu_rf_pipe3_already_da;            
input            idu_lsu_rf_pipe3_atomic;                
input            idu_lsu_rf_pipe3_bkpta_data;            
input            idu_lsu_rf_pipe3_bkptb_data;            
input            idu_lsu_rf_pipe3_gateclk_sel;           
input   [6  :0]  idu_lsu_rf_pipe3_iid;                   
input            idu_lsu_rf_pipe3_inst_fls;              
input            idu_lsu_rf_pipe3_inst_ldr;              
input   [1  :0]  idu_lsu_rf_pipe3_inst_size;             
input   [1  :0]  idu_lsu_rf_pipe3_inst_type;             
input   [11 :0]  idu_lsu_rf_pipe3_lch_entry;             
input            idu_lsu_rf_pipe3_lsfifo;                
input            idu_lsu_rf_pipe3_no_spec;               
input            idu_lsu_rf_pipe3_no_spec_exist;         
input            idu_lsu_rf_pipe3_off_0_extend;          
input   [11 :0]  idu_lsu_rf_pipe3_offset;                
input   [12 :0]  idu_lsu_rf_pipe3_offset_plus;           
input            idu_lsu_rf_pipe3_oldest;                
input   [14 :0]  idu_lsu_rf_pipe3_pc;                    
input   [6  :0]  idu_lsu_rf_pipe3_preg;                  
input            idu_lsu_rf_pipe3_sel;                   
input   [3  :0]  idu_lsu_rf_pipe3_shift;                 
input            idu_lsu_rf_pipe3_sign_extend;           
input            idu_lsu_rf_pipe3_spec_fail;             
input            idu_lsu_rf_pipe3_split;                 
input   [63 :0]  idu_lsu_rf_pipe3_src0;                  
input   [63 :0]  idu_lsu_rf_pipe3_src1;                  
input            idu_lsu_rf_pipe3_unalign_2nd;           
input   [6  :0]  idu_lsu_rf_pipe3_vreg;                  
input            idu_lsu_rf_pipe4_already_da;            
input            idu_lsu_rf_pipe4_atomic;                
input            idu_lsu_rf_pipe4_bkpta_data;            
input            idu_lsu_rf_pipe4_bkptb_data;            
input   [3  :0]  idu_lsu_rf_pipe4_fence_mode;            
input            idu_lsu_rf_pipe4_gateclk_sel;           
input            idu_lsu_rf_pipe4_icc;                   
input   [6  :0]  idu_lsu_rf_pipe4_iid;                   
input   [31 :0]  idu_lsu_rf_pipe4_inst_code;             
input            idu_lsu_rf_pipe4_inst_fls;              
input            idu_lsu_rf_pipe4_inst_flush;            
input   [1  :0]  idu_lsu_rf_pipe4_inst_mode;             
input            idu_lsu_rf_pipe4_inst_share;            
input   [1  :0]  idu_lsu_rf_pipe4_inst_size;             
input            idu_lsu_rf_pipe4_inst_str;              
input   [1  :0]  idu_lsu_rf_pipe4_inst_type;             
input   [11 :0]  idu_lsu_rf_pipe4_lch_entry;             
input            idu_lsu_rf_pipe4_lsfifo;                
input            idu_lsu_rf_pipe4_mmu_req;               
input            idu_lsu_rf_pipe4_no_spec;               
input            idu_lsu_rf_pipe4_off_0_extend;          
input   [11 :0]  idu_lsu_rf_pipe4_offset;                
input   [12 :0]  idu_lsu_rf_pipe4_offset_plus;           
input            idu_lsu_rf_pipe4_oldest;                
input   [14 :0]  idu_lsu_rf_pipe4_pc;                    
input   [11 :0]  idu_lsu_rf_pipe4_sdiq_entry;            
input            idu_lsu_rf_pipe4_sel;                   
input   [3  :0]  idu_lsu_rf_pipe4_shift;                 
input            idu_lsu_rf_pipe4_spec_fail;             
input            idu_lsu_rf_pipe4_split;                 
input   [63 :0]  idu_lsu_rf_pipe4_src0;                  
input   [63 :0]  idu_lsu_rf_pipe4_src1;                  
input            idu_lsu_rf_pipe4_st;                    
input            idu_lsu_rf_pipe4_staddr;                
input            idu_lsu_rf_pipe4_sync_fence;            
input            idu_lsu_rf_pipe4_unalign_2nd;           
input            idu_lsu_rf_pipe5_gateclk_sel;           
input   [11 :0]  idu_lsu_rf_pipe5_sdiq_entry;            
input            idu_lsu_rf_pipe5_sel;                   
input   [63 :0]  idu_lsu_rf_pipe5_src0;                  
input   [63 :0]  idu_lsu_rf_pipe5_srcv0_fr;              
input            idu_lsu_rf_pipe5_srcv0_fr_vld;          
input            idu_lsu_rf_pipe5_srcv0_vld;             
input   [63 :0]  idu_lsu_rf_pipe5_srcv0_vr0;             
input   [63 :0]  idu_lsu_rf_pipe5_srcv0_vr1;             
input            idu_lsu_rf_pipe5_stdata1_vld;           
input            idu_lsu_rf_pipe5_unalign;               
input            idu_lsu_vmb_create0_dp_en;              
input            idu_lsu_vmb_create0_dst_ready;          
input            idu_lsu_vmb_create0_en;                 
input            idu_lsu_vmb_create0_gateclk_en;         
input   [11 :0]  idu_lsu_vmb_create0_sdiq_entry;         
input   [6  :0]  idu_lsu_vmb_create0_split_num;          
input            idu_lsu_vmb_create0_unit_stride;        
input            idu_lsu_vmb_create0_vamo;               
input   [7  :0]  idu_lsu_vmb_create0_vl;                 
input   [5  :0]  idu_lsu_vmb_create0_vreg;               
input   [1  :0]  idu_lsu_vmb_create0_vsew;               
input            idu_lsu_vmb_create1_dp_en;              
input            idu_lsu_vmb_create1_dst_ready;          
input            idu_lsu_vmb_create1_en;                 
input            idu_lsu_vmb_create1_gateclk_en;         
input   [11 :0]  idu_lsu_vmb_create1_sdiq_entry;         
input   [6  :0]  idu_lsu_vmb_create1_split_num;          
input            idu_lsu_vmb_create1_unit_stride;        
input            idu_lsu_vmb_create1_vamo;               
input   [7  :0]  idu_lsu_vmb_create1_vl;                 
input   [5  :0]  idu_lsu_vmb_create1_vreg;               
input   [1  :0]  idu_lsu_vmb_create1_vsew;               
input            ifu_lsu_icache_inv_done;                
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
input            pad_yy_icg_scan_en;                     
input            rtu_lsu_async_flush;                    
input   [6  :0]  rtu_lsu_commit0_iid_updt_val;           
input   [6  :0]  rtu_lsu_commit1_iid_updt_val;           
input   [6  :0]  rtu_lsu_commit2_iid_updt_val;           
input            rtu_lsu_eret_flush;                     
input            rtu_lsu_expt_flush;                     
input            rtu_lsu_spec_fail_flush;                
input   [6  :0]  rtu_lsu_spec_fail_iid;                  
input            rtu_yy_xx_commit0;                      
input   [6  :0]  rtu_yy_xx_commit0_iid;                  
input            rtu_yy_xx_commit1;                      
input   [6  :0]  rtu_yy_xx_commit1_iid;                  
input            rtu_yy_xx_commit2;                      
input   [6  :0]  rtu_yy_xx_commit2_iid;                  
input            rtu_yy_xx_dbgon;                        
input            rtu_yy_xx_flush;                        
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
output           lsu_cp0_dcache_done;                    
output  [127:0]  lsu_cp0_dcache_read_data;               
output           lsu_cp0_dcache_read_data_vld;           
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
output           lsu_idu_ag_pipe3_load_inst_vld;         
output  [6  :0]  lsu_idu_ag_pipe3_preg_dup0;             
output  [6  :0]  lsu_idu_ag_pipe3_preg_dup1;             
output  [6  :0]  lsu_idu_ag_pipe3_preg_dup2;             
output  [6  :0]  lsu_idu_ag_pipe3_preg_dup3;             
output  [6  :0]  lsu_idu_ag_pipe3_preg_dup4;             
output           lsu_idu_ag_pipe3_vload_inst_vld;        
output  [6  :0]  lsu_idu_ag_pipe3_vreg_dup0;             
output  [6  :0]  lsu_idu_ag_pipe3_vreg_dup1;             
output  [6  :0]  lsu_idu_ag_pipe3_vreg_dup2;             
output  [6  :0]  lsu_idu_ag_pipe3_vreg_dup3;             
output  [11 :0]  lsu_idu_already_da;                     
output  [11 :0]  lsu_idu_bkpta_data;                     
output  [11 :0]  lsu_idu_bkptb_data;                     
output  [6  :0]  lsu_idu_da_pipe3_fwd_preg;              
output  [63 :0]  lsu_idu_da_pipe3_fwd_preg_data;         
output           lsu_idu_da_pipe3_fwd_preg_vld;          
output  [6  :0]  lsu_idu_da_pipe3_fwd_vreg;              
output  [63 :0]  lsu_idu_da_pipe3_fwd_vreg_fr_data;      
output           lsu_idu_da_pipe3_fwd_vreg_vld;          
output  [63 :0]  lsu_idu_da_pipe3_fwd_vreg_vr0_data;     
output  [63 :0]  lsu_idu_da_pipe3_fwd_vreg_vr1_data;     
output           lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1; 
output           lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2; 
output           lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3; 
output           lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4; 
output           lsu_idu_dc_pipe3_load_inst_vld_dup0;    
output           lsu_idu_dc_pipe3_load_inst_vld_dup1;    
output           lsu_idu_dc_pipe3_load_inst_vld_dup2;    
output           lsu_idu_dc_pipe3_load_inst_vld_dup3;    
output           lsu_idu_dc_pipe3_load_inst_vld_dup4;    
output  [6  :0]  lsu_idu_dc_pipe3_preg_dup0;             
output  [6  :0]  lsu_idu_dc_pipe3_preg_dup1;             
output  [6  :0]  lsu_idu_dc_pipe3_preg_dup2;             
output  [6  :0]  lsu_idu_dc_pipe3_preg_dup3;             
output  [6  :0]  lsu_idu_dc_pipe3_preg_dup4;             
output           lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
output           lsu_idu_dc_pipe3_vload_inst_vld_dup0;   
output           lsu_idu_dc_pipe3_vload_inst_vld_dup1;   
output           lsu_idu_dc_pipe3_vload_inst_vld_dup2;   
output           lsu_idu_dc_pipe3_vload_inst_vld_dup3;   
output  [6  :0]  lsu_idu_dc_pipe3_vreg_dup0;             
output  [6  :0]  lsu_idu_dc_pipe3_vreg_dup1;             
output  [6  :0]  lsu_idu_dc_pipe3_vreg_dup2;             
output  [6  :0]  lsu_idu_dc_pipe3_vreg_dup3;             
output  [11 :0]  lsu_idu_dc_sdiq_entry;                  
output           lsu_idu_dc_staddr1_vld;                 
output           lsu_idu_dc_staddr_unalign;              
output           lsu_idu_dc_staddr_vld;                  
output  [11 :0]  lsu_idu_ex1_sdiq_entry;                 
output           lsu_idu_ex1_sdiq_frz_clr;               
output           lsu_idu_ex1_sdiq_pop_vld;               
output  [11 :0]  lsu_idu_lq_full;                        
output           lsu_idu_lq_full_gateclk_en;             
output           lsu_idu_lq_not_full;                    
output           lsu_idu_lsiq_pop0_vld;                  
output           lsu_idu_lsiq_pop1_vld;                  
output  [11 :0]  lsu_idu_lsiq_pop_entry;                 
output           lsu_idu_lsiq_pop_vld;                   
output           lsu_idu_no_fence;                       
output  [11 :0]  lsu_idu_rb_full;                        
output           lsu_idu_rb_full_gateclk_en;             
output           lsu_idu_rb_not_full;                    
output  [11 :0]  lsu_idu_secd;                           
output  [11 :0]  lsu_idu_spec_fail;                      
output  [11 :0]  lsu_idu_sq_full;                        
output           lsu_idu_sq_full_gateclk_en;             
output           lsu_idu_sq_not_full;                    
output  [11 :0]  lsu_idu_tlb_busy;                       
output           lsu_idu_tlb_busy_gateclk_en;            
output  [11 :0]  lsu_idu_tlb_wakeup;                     
output  [11 :0]  lsu_idu_unalign_gateclk_en;             
output           lsu_idu_vmb_1_left_updt;                
output  [7  :0]  lsu_idu_vmb_create0_entry;              
output  [7  :0]  lsu_idu_vmb_create1_entry;              
output           lsu_idu_vmb_empty;                      
output           lsu_idu_vmb_full;                       
output           lsu_idu_vmb_full_updt;                  
output           lsu_idu_vmb_full_updt_clk_en;           
output  [11 :0]  lsu_idu_wait_fence;                     
output           lsu_idu_wait_fence_gateclk_en;          
output  [11 :0]  lsu_idu_wait_old;                       
output           lsu_idu_wait_old_gateclk_en;            
output  [11 :0]  lsu_idu_wakeup;                         
output  [6  :0]  lsu_idu_wb_pipe3_fwd_vreg;              
output           lsu_idu_wb_pipe3_fwd_vreg_vld;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_preg;               
output  [63 :0]  lsu_idu_wb_pipe3_wb_preg_data;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup0;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup1;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup2;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup3;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup4;          
output  [95 :0]  lsu_idu_wb_pipe3_wb_preg_expand;        
output           lsu_idu_wb_pipe3_wb_preg_vld;           
output           lsu_idu_wb_pipe3_wb_preg_vld_dup0;      
output           lsu_idu_wb_pipe3_wb_preg_vld_dup1;      
output           lsu_idu_wb_pipe3_wb_preg_vld_dup2;      
output           lsu_idu_wb_pipe3_wb_preg_vld_dup3;      
output           lsu_idu_wb_pipe3_wb_preg_vld_dup4;      
output  [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup0;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup1;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup2;          
output  [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup3;          
output  [63 :0]  lsu_idu_wb_pipe3_wb_vreg_fr_data;       
output  [63 :0]  lsu_idu_wb_pipe3_wb_vreg_fr_expand;     
output           lsu_idu_wb_pipe3_wb_vreg_fr_vld;        
output           lsu_idu_wb_pipe3_wb_vreg_vld_dup0;      
output           lsu_idu_wb_pipe3_wb_vreg_vld_dup1;      
output           lsu_idu_wb_pipe3_wb_vreg_vld_dup2;      
output           lsu_idu_wb_pipe3_wb_vreg_vld_dup3;      
output  [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr0_data;      
output  [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr0_expand;    
output           lsu_idu_wb_pipe3_wb_vreg_vr0_vld;       
output  [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr1_data;      
output  [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr1_expand;    
output           lsu_idu_wb_pipe3_wb_vreg_vr1_vld;       
output           lsu_ifu_icache_all_inv;                 
output  [5  :0]  lsu_ifu_icache_index;                   
output           lsu_ifu_icache_line_inv;                
output  [27 :0]  lsu_ifu_icache_ptag;                    
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
output           lsu_rtu_all_commit_data_vld;            
output  [39 :0]  lsu_rtu_async_expt_addr;                
output           lsu_rtu_async_expt_vld;                 
output           lsu_rtu_ctc_flush_vld;                  
output  [6  :0]  lsu_rtu_da_pipe3_split_spec_fail_iid;   
output           lsu_rtu_da_pipe3_split_spec_fail_vld;   
output  [6  :0]  lsu_rtu_da_pipe4_split_spec_fail_iid;   
output           lsu_rtu_da_pipe4_split_spec_fail_vld;   
output           lsu_rtu_wb_pipe3_abnormal;              
output           lsu_rtu_wb_pipe3_bkpta_data;            
output           lsu_rtu_wb_pipe3_bkptb_data;            
output           lsu_rtu_wb_pipe3_cmplt;                 
output  [4  :0]  lsu_rtu_wb_pipe3_expt_vec;              
output           lsu_rtu_wb_pipe3_expt_vld;              
output           lsu_rtu_wb_pipe3_flush;                 
output  [6  :0]  lsu_rtu_wb_pipe3_iid;                   
output  [39 :0]  lsu_rtu_wb_pipe3_mtval;                 
output           lsu_rtu_wb_pipe3_no_spec_hit;           
output           lsu_rtu_wb_pipe3_no_spec_mispred;       
output           lsu_rtu_wb_pipe3_no_spec_miss;          
output           lsu_rtu_wb_pipe3_spec_fail;             
output           lsu_rtu_wb_pipe3_vsetvl;                
output  [6  :0]  lsu_rtu_wb_pipe3_vstart;                
output           lsu_rtu_wb_pipe3_vstart_vld;            
output  [95 :0]  lsu_rtu_wb_pipe3_wb_preg_expand;        
output           lsu_rtu_wb_pipe3_wb_preg_vld;           
output  [63 :0]  lsu_rtu_wb_pipe3_wb_vreg_expand;        
output           lsu_rtu_wb_pipe3_wb_vreg_fr_vld;        
output           lsu_rtu_wb_pipe3_wb_vreg_vr_vld;        
output           lsu_rtu_wb_pipe4_abnormal;              
output           lsu_rtu_wb_pipe4_bkpta_data;            
output           lsu_rtu_wb_pipe4_bkptb_data;            
output           lsu_rtu_wb_pipe4_cmplt;                 
output  [4  :0]  lsu_rtu_wb_pipe4_expt_vec;              
output           lsu_rtu_wb_pipe4_expt_vld;              
output           lsu_rtu_wb_pipe4_flush;                 
output  [6  :0]  lsu_rtu_wb_pipe4_iid;                   
output  [39 :0]  lsu_rtu_wb_pipe4_mtval;                 
output           lsu_rtu_wb_pipe4_no_spec_hit;           
output           lsu_rtu_wb_pipe4_no_spec_mispred;       
output           lsu_rtu_wb_pipe4_no_spec_miss;          
output           lsu_rtu_wb_pipe4_spec_fail;             
output  [6  :0]  lsu_rtu_wb_pipe4_vstart;                
output           lsu_rtu_wb_pipe4_vstart_vld;            
output           lsu_yy_xx_no_op;                        

// &Regs; @26

// &Wires; @27
wire    [7  :0]  ag_dcache_arb_ld_data_gateclk_en;       
wire    [10 :0]  ag_dcache_arb_ld_data_high_idx;         
wire    [10 :0]  ag_dcache_arb_ld_data_low_idx;          
wire    [7  :0]  ag_dcache_arb_ld_data_req;              
wire             ag_dcache_arb_ld_tag_gateclk_en;        
wire    [8  :0]  ag_dcache_arb_ld_tag_idx;               
wire             ag_dcache_arb_ld_tag_req;               
wire             ag_dcache_arb_st_dirty_gateclk_en;      
wire    [8  :0]  ag_dcache_arb_st_dirty_idx;             
wire             ag_dcache_arb_st_dirty_req;             
wire             ag_dcache_arb_st_tag_gateclk_en;        
wire    [8  :0]  ag_dcache_arb_st_tag_idx;               
wire             ag_dcache_arb_st_tag_req;               
wire             amr_l2_mem_set;                         
wire             amr_wa_cancel;                          
wire             arb_ctcq_ctc_2nd_trans;                 
wire    [23 :0]  arb_ctcq_ctc_asid_va;                   
wire    [5  :0]  arb_ctcq_ctc_type;                      
wire    [35 :0]  arb_ctcq_ctc_va_pa;                     
wire    [5  :0]  arb_ctcq_entry_oldest_index;            
wire    [5  :0]  arb_snq_entry_oldest_index;             
wire    [39 :0]  arb_snq_snoop_addr;                     
wire    [9  :0]  arb_snq_snoop_depd;                     
wire    [2  :0]  arb_snq_snoop_prot;                     
wire    [3  :0]  arb_snq_snoop_type;                     
wire             biu_ctcq_cr_ready;                      
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
wire             biu_lsu_cr_resp_acept;                  
wire             biu_lsu_ctc_req;                        
wire    [127:0]  biu_lsu_r_data;                         
wire    [4  :0]  biu_lsu_r_id;                           
wire             biu_lsu_r_last;                         
wire    [3  :0]  biu_lsu_r_resp;                         
wire             biu_lsu_r_vld;                          
wire             biu_lsu_w_vb_grnt;                      
wire             biu_lsu_w_wmb_grnt;                     
wire             biu_sdb_cd_ready;                       
wire             biu_snq_cr_ready;                       
wire             bus_arb_pfu_ar_grnt;                    
wire             bus_arb_pfu_ar_ready;                   
wire             bus_arb_pfu_ar_sel;                     
wire             bus_arb_rb_ar_grnt;                     
wire             bus_arb_rb_ar_sel;                      
wire             bus_arb_vb_aw_grnt;                     
wire             bus_arb_vb_w_grnt;                      
wire             bus_arb_wmb_ar_grnt;                    
wire             bus_arb_wmb_aw_grnt;                    
wire             bus_arb_wmb_w_grnt;                     
wire    [127:0]  cb_ld_da_data;                          
wire             cb_ld_da_data_vld;                      
wire             cb_ld_dc_addr_hit;                      
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
wire             cp0_lsu_icg_en;                         
wire    [1  :0]  cp0_lsu_l2_pref_dist;                   
wire             cp0_lsu_l2_pref_en;                     
wire             cp0_lsu_l2_st_pref_en;                  
wire             cp0_lsu_mm;                             
wire             cp0_lsu_no_op_req;                      
wire             cp0_lsu_nsfe;                           
wire             cp0_lsu_pfu_mmu_dis;                    
wire    [29 :0]  cp0_lsu_timeout_cnt;                    
wire             cp0_lsu_tvm;                            
wire             cp0_lsu_ucme;                           
wire             cp0_lsu_wa;                             
wire             cp0_lsu_wr_burst_dis;                   
wire             cp0_yy_clk_en;                          
wire             cp0_yy_dcache_pref_en;                  
wire    [1  :0]  cp0_yy_priv_mode;                       
wire             cp0_yy_virtual_mode;                    
wire             cpurst_b;                               
wire             ctc_req_create_en;                      
wire             ctcq_biu_2_cmplt;                       
wire    [4  :0]  ctcq_biu_cr_resp;                       
wire             ctcq_biu_cr_valid;                      
wire             ctrl_ld_clk;                            
wire             ctrl_st_clk;                            
wire             cur_ctcq_entry_empty;                   
wire             cur_snq_entry_empty;                    
wire             dcache_arb_ag_ld_sel;                   
wire             dcache_arb_ag_st_sel;                   
wire             dcache_arb_icc_ld_grnt;                 
wire    [39 :0]  dcache_arb_ld_ag_addr;                  
wire             dcache_arb_ld_ag_borrow_addr_vld;       
wire    [2  :0]  dcache_arb_ld_dc_borrow_db;             
wire             dcache_arb_ld_dc_borrow_icc;            
wire             dcache_arb_ld_dc_borrow_mmu;            
wire             dcache_arb_ld_dc_borrow_sndb;           
wire             dcache_arb_ld_dc_borrow_vb;             
wire             dcache_arb_ld_dc_borrow_vld;            
wire             dcache_arb_ld_dc_borrow_vld_gate;       
wire             dcache_arb_ld_dc_settle_way;            
wire             dcache_arb_lfb_ld_grnt;                 
wire             dcache_arb_mcic_ld_grnt;                
wire             dcache_arb_snq_ld_grnt;                 
wire             dcache_arb_snq_st_grnt;                 
wire    [39 :0]  dcache_arb_st_ag_addr;                  
wire             dcache_arb_st_ag_borrow_addr_vld;       
wire             dcache_arb_st_dc_borrow_icc;            
wire             dcache_arb_st_dc_borrow_snq;            
wire    [5  :0]  dcache_arb_st_dc_borrow_snq_id;         
wire             dcache_arb_st_dc_borrow_vld;            
wire             dcache_arb_st_dc_borrow_vld_gate;       
wire             dcache_arb_st_dc_dcache_replace;        
wire             dcache_arb_st_dc_dcache_sw;             
wire             dcache_arb_vb_ld_grnt;                  
wire             dcache_arb_vb_st_grnt;                  
wire             dcache_arb_wmb_ld_grnt;                 
wire    [6  :0]  dcache_dirty_din;                       
wire             dcache_dirty_gwen;                      
wire    [6  :0]  dcache_dirty_wen;                       
wire    [8  :0]  dcache_idx;                             
wire    [31 :0]  dcache_lsu_ld_data_bank0_dout;          
wire    [31 :0]  dcache_lsu_ld_data_bank1_dout;          
wire    [31 :0]  dcache_lsu_ld_data_bank2_dout;          
wire    [31 :0]  dcache_lsu_ld_data_bank3_dout;          
wire    [31 :0]  dcache_lsu_ld_data_bank4_dout;          
wire    [31 :0]  dcache_lsu_ld_data_bank5_dout;          
wire    [31 :0]  dcache_lsu_ld_data_bank6_dout;          
wire    [31 :0]  dcache_lsu_ld_data_bank7_dout;          
wire    [53 :0]  dcache_lsu_ld_tag_dout;                 
wire    [6  :0]  dcache_lsu_st_dirty_dout;               
wire    [51 :0]  dcache_lsu_st_tag_dout;                 
wire             dcache_snq_st_sel;                      
wire    [51 :0]  dcache_tag_din;                         
wire             dcache_tag_gwen;                        
wire    [1  :0]  dcache_tag_wen;                         
wire             dcache_vb_snq_gwen;                     
wire             forever_cpuclk;                         
wire             had_lsu_bus_trace_en;                   
wire             had_lsu_dbg_en;                         
wire    [39 :0]  had_yy_xx_bkpta_base;                   
wire    [7  :0]  had_yy_xx_bkpta_mask;                   
wire             had_yy_xx_bkpta_rc;                     
wire    [39 :0]  had_yy_xx_bkptb_base;                   
wire    [7  :0]  had_yy_xx_bkptb_mask;                   
wire             had_yy_xx_bkptb_rc;                     
wire             hpcp_lsu_cnt_en;                        
wire             icc_dcache_arb_data_way;                
wire             icc_dcache_arb_ld_borrow_req;           
wire    [7  :0]  icc_dcache_arb_ld_data_gateclk_en;      
wire    [10 :0]  icc_dcache_arb_ld_data_high_idx;        
wire    [10 :0]  icc_dcache_arb_ld_data_low_idx;         
wire    [7  :0]  icc_dcache_arb_ld_data_req;             
wire             icc_dcache_arb_ld_req;                  
wire             icc_dcache_arb_ld_tag_gateclk_en;       
wire    [8  :0]  icc_dcache_arb_ld_tag_idx;              
wire             icc_dcache_arb_ld_tag_read;             
wire             icc_dcache_arb_ld_tag_req;              
wire             icc_dcache_arb_st_borrow_req;           
wire    [6  :0]  icc_dcache_arb_st_dirty_din;            
wire             icc_dcache_arb_st_dirty_gateclk_en;     
wire             icc_dcache_arb_st_dirty_gwen;           
wire    [8  :0]  icc_dcache_arb_st_dirty_idx;            
wire             icc_dcache_arb_st_dirty_req;            
wire    [6  :0]  icc_dcache_arb_st_dirty_wen;            
wire             icc_dcache_arb_st_req;                  
wire             icc_dcache_arb_st_tag_gateclk_en;       
wire    [8  :0]  icc_dcache_arb_st_tag_idx;              
wire             icc_dcache_arb_st_tag_req;              
wire             icc_dcache_arb_way;                     
wire             icc_idle;                               
wire             icc_snq_create_permit;                  
wire             icc_sq_grnt;                            
wire    [33 :0]  icc_vb_addr_tto6;                       
wire             icc_vb_create_dp_vld;                   
wire             icc_vb_create_gateclk_en;               
wire             icc_vb_create_req;                      
wire             icc_vb_create_vld;                      
wire             icc_vb_inv;                             
wire             icc_wmb_write_imme;                     
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
wire             idu_lsu_vmb_create0_gateclk_en;         
wire             idu_lsu_vmb_create1_gateclk_en;         
wire             ifu_lsu_icache_inv_done;                
wire    [35 :0]  ld_ag_addr1_to4;                        
wire             ld_ag_ahead_predict;                    
wire             ld_ag_already_da;                       
wire             ld_ag_atomic;                           
wire             ld_ag_boundary;                         
wire    [2  :0]  ld_ag_dc_access_size;                   
wire             ld_ag_dc_acclr_en;                      
wire    [39 :0]  ld_ag_dc_addr0;                         
wire    [15 :0]  ld_ag_dc_bytes_vld;                     
wire    [15 :0]  ld_ag_dc_bytes_vld1;                    
wire             ld_ag_dc_fwd_bypass_en;                 
wire             ld_ag_dc_inst_vld;                      
wire             ld_ag_dc_load_ahead_inst_vld;           
wire             ld_ag_dc_load_inst_vld;                 
wire             ld_ag_dc_mmu_req;                       
wire    [3  :0]  ld_ag_dc_rot_sel;                       
wire             ld_ag_dc_vload_ahead_inst_vld;          
wire             ld_ag_dc_vload_inst_vld;                
wire             ld_ag_expt_access_fault_with_page;      
wire             ld_ag_expt_ldamo_not_ca;                
wire             ld_ag_expt_misalign_no_page;            
wire             ld_ag_expt_misalign_with_page;          
wire             ld_ag_expt_page_fault;                  
wire             ld_ag_expt_vld;                         
wire    [6  :0]  ld_ag_iid;                              
wire    [1  :0]  ld_ag_inst_type;                        
wire             ld_ag_inst_vfls;                        
wire             ld_ag_inst_vld;                         
wire    [14 :0]  ld_ag_ldfifo_pc;                        
wire             ld_ag_lm_init_vld;                      
wire             ld_ag_lr_inst;                          
wire    [11 :0]  ld_ag_lsid;                             
wire             ld_ag_lsiq_bkpta_data;                  
wire             ld_ag_lsiq_bkptb_data;                  
wire             ld_ag_lsiq_spec_fail;                   
wire             ld_ag_no_spec;                          
wire             ld_ag_no_spec_exist;                    
wire             ld_ag_old;                              
wire    [39 :0]  ld_ag_pa;                               
wire             ld_ag_page_buf;                         
wire             ld_ag_page_ca;                          
wire             ld_ag_page_sec;                         
wire             ld_ag_page_share;                       
wire             ld_ag_page_so;                          
wire             ld_ag_pf_inst;                          
wire    [6  :0]  ld_ag_preg;                             
wire             ld_ag_raw_new;                          
wire             ld_ag_secd;                             
wire             ld_ag_sign_extend;                      
wire             ld_ag_split;                            
wire             ld_ag_stall_ori;                        
wire    [11 :0]  ld_ag_stall_restart_entry;              
wire             ld_ag_utlb_miss;                        
wire    [27 :0]  ld_ag_vpn;                              
wire    [5  :0]  ld_ag_vreg;                             
wire    [39 :0]  ld_da_addr;                             
wire             ld_da_bkpta_data;                       
wire             ld_da_bkptb_data;                       
wire             ld_da_borrow_vld;                       
wire             ld_da_boundary_after_mask;              
wire    [15 :0]  ld_da_bytes_vld;                        
wire    [127:0]  ld_da_cb_data;                          
wire             ld_da_cb_data_vld;                      
wire             ld_da_cb_ecc_cancel;                    
wire             ld_da_cb_ld_inst_vld;                   
wire    [255:0]  ld_da_data256;                          
wire    [63 :0]  ld_da_data_ori;                         
wire    [7  :0]  ld_da_data_rot_sel;                     
wire             ld_da_dcache_hit;                       
wire    [11 :0]  ld_da_ecc_wakeup;                       
wire             ld_da_fwd_ecc_stall;                    
wire    [127:0]  ld_da_icc_read_data;                    
wire    [11 :0]  ld_da_idu_already_da;                   
wire    [11 :0]  ld_da_idu_bkpta_data;                   
wire    [11 :0]  ld_da_idu_bkptb_data;                   
wire    [11 :0]  ld_da_idu_boundary_gateclk_en;          
wire    [11 :0]  ld_da_idu_pop_entry;                    
wire             ld_da_idu_pop_vld;                      
wire    [11 :0]  ld_da_idu_rb_full;                      
wire    [11 :0]  ld_da_idu_secd;                         
wire    [11 :0]  ld_da_idu_spec_fail;                    
wire    [11 :0]  ld_da_idu_wait_fence;                   
wire    [7  :0]  ld_da_idx;                              
wire    [6  :0]  ld_da_iid;                              
wire    [2  :0]  ld_da_inst_size;                        
wire             ld_da_inst_vfls;                        
wire             ld_da_inst_vld;                         
wire    [14 :0]  ld_da_ldfifo_pc;                        
wire             ld_da_lfb_discard_grnt;                 
wire             ld_da_lfb_set_wakeup_queue;             
wire    [12 :0]  ld_da_lfb_wakeup_queue_next;            
wire             ld_da_lm_discard_grnt;                  
wire             ld_da_lm_ecc_err;                       
wire             ld_da_lm_no_req;                        
wire             ld_da_lm_vector_nop;                    
wire    [11 :0]  ld_da_lsid;                             
wire             ld_da_mcic_borrow_mmu;                  
wire             ld_da_mcic_borrow_mmu_req;              
wire    [63 :0]  ld_da_mcic_bypass_data;                 
wire             ld_da_mcic_data_err;                    
wire             ld_da_mcic_rb_full;                     
wire             ld_da_mcic_wakeup;                      
wire             ld_da_old;                              
wire             ld_da_page_buf;                         
wire             ld_da_page_ca;                          
wire             ld_da_page_sec;                         
wire             ld_da_page_sec_ff;                      
wire             ld_da_page_share;                       
wire             ld_da_page_share_ff;                    
wire             ld_da_page_so;                          
wire             ld_da_pfu_act_dp_vld;                   
wire             ld_da_pfu_act_vld;                      
wire             ld_da_pfu_biu_req_hit_idx;              
wire             ld_da_pfu_evict_cnt_vld;                
wire             ld_da_pfu_pf_inst_vld;                  
wire    [39 :0]  ld_da_pfu_va;                           
wire    [39 :0]  ld_da_ppfu_va;                          
wire    [27 :0]  ld_da_ppn_ff;                           
wire    [6  :0]  ld_da_preg;                             
wire    [3  :0]  ld_da_preg_sign_sel;                    
wire             ld_da_rb_atomic;                        
wire             ld_da_rb_cmit;                          
wire             ld_da_rb_cmplt_success;                 
wire             ld_da_rb_create_dp_vld;                 
wire             ld_da_rb_create_gateclk_en;             
wire             ld_da_rb_create_judge_vld;              
wire             ld_da_rb_create_lfb;                    
wire             ld_da_rb_create_vld;                    
wire             ld_da_rb_data_vld;                      
wire             ld_da_rb_dest_vld;                      
wire             ld_da_rb_discard_grnt;                  
wire             ld_da_rb_full_gateclk_en;               
wire             ld_da_rb_ldamo;                         
wire             ld_da_rb_merge_dp_vld;                  
wire             ld_da_rb_merge_expt_vld;                
wire             ld_da_rb_merge_gateclk_en;              
wire             ld_da_rb_merge_vld;                     
wire    [35 :0]  ld_da_sf_addr_tto4;                     
wire    [15 :0]  ld_da_sf_bytes_vld;                     
wire             ld_da_sf_spec_chk_req;                  
wire             ld_da_sign_extend;                      
wire             ld_da_snq_borrow_icc;                   
wire             ld_da_snq_borrow_sndb;                  
wire             ld_da_special_gateclk_en;               
wire             ld_da_sq_data_discard_vld;              
wire    [11 :0]  ld_da_sq_fwd_id;                        
wire             ld_da_sq_fwd_multi_vld;                 
wire             ld_da_sq_global_discard_vld;            
wire             ld_da_st_da_hit_idx;                    
wire    [2  :0]  ld_da_vb_borrow_vb;                     
wire             ld_da_vb_snq_data_reissue;              
wire    [5  :0]  ld_da_vreg;                             
wire             ld_da_vreg_sign_sel;                    
wire             ld_da_wait_fence_gateclk_en;            
wire             ld_da_wb_cmplt_req;                     
wire    [63 :0]  ld_da_wb_data;                          
wire             ld_da_wb_data_req;                      
wire             ld_da_wb_data_req_gateclk_en;           
wire    [4  :0]  ld_da_wb_expt_vec;                      
wire             ld_da_wb_expt_vld;                      
wire    [39 :0]  ld_da_wb_mt_value;                      
wire             ld_da_wb_no_spec_hit;                   
wire             ld_da_wb_no_spec_mispred;               
wire             ld_da_wb_no_spec_miss;                  
wire             ld_da_wb_spec_fail;                     
wire    [1  :0]  ld_da_wb_vreg_sign_sel;                 
wire             ld_da_wmb_discard_vld;                  
wire    [39 :0]  ld_dc_addr0;                            
wire    [39 :0]  ld_dc_addr1;                            
wire    [7  :0]  ld_dc_addr1_11to4;                      
wire             ld_dc_ahead_predict;                    
wire             ld_dc_ahead_preg_wb_vld;                
wire             ld_dc_ahead_vreg_wb_vld;                
wire             ld_dc_already_da;                       
wire             ld_dc_atomic;                           
wire             ld_dc_bkpta_data;                       
wire             ld_dc_bkptb_data;                       
wire    [2  :0]  ld_dc_borrow_db;                        
wire             ld_dc_borrow_icc;                       
wire             ld_dc_borrow_icc_tag;                   
wire             ld_dc_borrow_mmu;                       
wire             ld_dc_borrow_sndb;                      
wire             ld_dc_borrow_vb;                        
wire             ld_dc_borrow_vld;                       
wire             ld_dc_boundary;                         
wire    [15 :0]  ld_dc_bytes_vld;                        
wire    [15 :0]  ld_dc_bytes_vld1;                       
wire             ld_dc_cb_addr_create_gateclk_en;        
wire             ld_dc_cb_addr_create_vld;               
wire    [35 :0]  ld_dc_cb_addr_tto4;                     
wire             ld_dc_chk_atomic_inst_vld;              
wire             ld_dc_chk_ld_addr1_vld;                 
wire             ld_dc_chk_ld_bypass_vld;                
wire             ld_dc_chk_ld_inst_vld;                  
wire    [15 :0]  ld_dc_da_bytes_vld;                     
wire    [15 :0]  ld_dc_da_bytes_vld1;                    
wire             ld_dc_da_cb_addr_create;                
wire             ld_dc_da_cb_merge_en;                   
wire    [7  :0]  ld_dc_da_data_rot_sel;                  
wire             ld_dc_da_expt_vld_gate_en;              
wire             ld_dc_da_icc_tag_vld;                   
wire             ld_dc_da_inst_vld;                      
wire             ld_dc_da_old;                           
wire             ld_dc_da_page_buf;                      
wire             ld_dc_da_page_ca;                       
wire             ld_dc_da_page_sec;                      
wire             ld_dc_da_page_share;                    
wire             ld_dc_da_page_so;                       
wire             ld_dc_da_pf_inst;                       
wire    [26 :0]  ld_dc_da_tag_read;                      
wire             ld_dc_dcache_hit;                       
wire             ld_dc_expt_access_fault_extra;          
wire             ld_dc_expt_access_fault_mask;           
wire    [4  :0]  ld_dc_expt_vec;                         
wire             ld_dc_expt_vld_except_access_err;       
wire    [15 :0]  ld_dc_fwd_bytes_vld;                    
wire             ld_dc_fwd_sq_vld;                       
wire             ld_dc_fwd_wmb_vld;                      
wire    [3  :0]  ld_dc_get_dcache_data;                  
wire             ld_dc_hit_high_region;                  
wire             ld_dc_hit_low_region;                   
wire    [11 :0]  ld_dc_idu_lq_full;                      
wire    [11 :0]  ld_dc_idu_tlb_busy;                     
wire    [6  :0]  ld_dc_iid;                              
wire    [11 :0]  ld_dc_imme_wakeup;                      
wire             ld_dc_inst_chk_vld;                     
wire    [2  :0]  ld_dc_inst_size;                        
wire    [1  :0]  ld_dc_inst_type;                        
wire             ld_dc_inst_vfls;                        
wire             ld_dc_inst_vld;                         
wire    [14 :0]  ld_dc_ldfifo_pc;                        
wire             ld_dc_lq_create1_dp_vld;                
wire             ld_dc_lq_create1_gateclk_en;            
wire             ld_dc_lq_create1_vld;                   
wire             ld_dc_lq_create_dp_vld;                 
wire             ld_dc_lq_create_gateclk_en;             
wire             ld_dc_lq_create_vld;                    
wire             ld_dc_lq_full_gateclk_en;               
wire    [11 :0]  ld_dc_lsid;                             
wire             ld_dc_mmu_req;                          
wire    [39 :0]  ld_dc_mt_value;                         
wire             ld_dc_no_spec;                          
wire             ld_dc_no_spec_exist;                    
wire             ld_dc_pfu_info_set_vld;                 
wire    [39 :0]  ld_dc_pfu_va;                           
wire    [6  :0]  ld_dc_preg;                             
wire    [3  :0]  ld_dc_preg_sign_sel;                    
wire             ld_dc_secd;                             
wire             ld_dc_settle_way;                       
wire             ld_dc_sign_extend;                      
wire             ld_dc_spec_fail;                        
wire             ld_dc_split;                            
wire             ld_dc_tlb_busy_gateclk_en;              
wire             ld_dc_vector_nop;                       
wire    [5  :0]  ld_dc_vreg;                             
wire             ld_dc_vreg_sign_sel;                    
wire             ld_dc_wait_fence;                       
wire             ld_hit_prefetch;                        
wire             ld_wb_data_vld;                         
wire             ld_wb_inst_vld;                         
wire             ld_wb_rb_cmplt_grnt;                    
wire             ld_wb_rb_data_grnt;                     
wire             ld_wb_wmb_data_grnt;                    
wire             lfb_addr_full;                          
wire             lfb_addr_less2;                         
wire    [7  :0]  lfb_dcache_arb_ld_data_gateclk_en;      
wire    [127:0]  lfb_dcache_arb_ld_data_high_din;        
wire    [10 :0]  lfb_dcache_arb_ld_data_idx;             
wire    [127:0]  lfb_dcache_arb_ld_data_low_din;         
wire             lfb_dcache_arb_ld_req;                  
wire    [53 :0]  lfb_dcache_arb_ld_tag_din;              
wire             lfb_dcache_arb_ld_tag_gateclk_en;       
wire    [8  :0]  lfb_dcache_arb_ld_tag_idx;              
wire             lfb_dcache_arb_ld_tag_req;              
wire    [1  :0]  lfb_dcache_arb_ld_tag_wen;              
wire             lfb_dcache_arb_serial_req;              
wire    [6  :0]  lfb_dcache_arb_st_dirty_din;            
wire             lfb_dcache_arb_st_dirty_gateclk_en;     
wire    [8  :0]  lfb_dcache_arb_st_dirty_idx;            
wire             lfb_dcache_arb_st_dirty_req;            
wire    [6  :0]  lfb_dcache_arb_st_dirty_wen;            
wire             lfb_dcache_arb_st_req;                  
wire    [51 :0]  lfb_dcache_arb_st_tag_din;              
wire             lfb_dcache_arb_st_tag_gateclk_en;       
wire    [8  :0]  lfb_dcache_arb_st_tag_idx;              
wire             lfb_dcache_arb_st_tag_req;              
wire    [1  :0]  lfb_dcache_arb_st_tag_wen;              
wire    [11 :0]  lfb_depd_wakeup;                        
wire             lfb_empty;                              
wire             lfb_ld_da_hit_idx;                      
wire             lfb_mcic_wakeup;                        
wire             lfb_pfu_biu_req_hit_idx;                
wire    [4  :0]  lfb_pfu_create_id;                      
wire    [8  :0]  lfb_pfu_dcache_hit;                     
wire    [8  :0]  lfb_pfu_dcache_miss;                    
wire             lfb_pfu_rready_grnt;                    
wire             lfb_pop_depd_ff;                        
wire             lfb_rb_biu_req_hit_idx;                 
wire             lfb_rb_ca_rready_grnt;                  
wire    [4  :0]  lfb_rb_create_id;                       
wire             lfb_rb_nc_rready_grnt;                  
wire    [1  :0]  lfb_snq_bypass_data_id;                 
wire             lfb_snq_bypass_hit;                     
wire             lfb_snq_bypass_share;                   
wire             lfb_st_da_hit_idx;                      
wire    [33 :0]  lfb_vb_addr_tto6;                       
wire             lfb_vb_create_dp_vld;                   
wire             lfb_vb_create_gateclk_en;               
wire             lfb_vb_create_req;                      
wire             lfb_vb_create_vld;                      
wire    [2  :0]  lfb_vb_id;                              
wire             lfb_wmb_read_req_hit_idx;               
wire             lfb_wmb_write_req_hit_idx;              
wire    [27 :0]  lm_addr_pa;                             
wire             lm_already_snoop;                       
wire             lm_ld_da_hit_idx;                       
wire             lm_lfb_depd_wakeup;                     
wire             lm_page_buf;                            
wire             lm_page_ca;                             
wire             lm_page_sec;                            
wire             lm_page_share;                          
wire             lm_page_so;                             
wire             lm_pfu_biu_req_hit_idx;                 
wire             lm_snq_stall;                           
wire             lm_sq_sc_fail;                          
wire             lm_st_da_hit_idx;                       
wire             lm_state_is_amo_lock;                   
wire             lm_state_is_ex_wait_lock;               
wire             lm_state_is_idle;                       
wire             lq_ld_dc_full;                          
wire             lq_ld_dc_inst_hit;                      
wire             lq_ld_dc_less2;                         
wire             lq_ld_dc_spec_fail;                     
wire             lq_st_dc_spec_fail;                     
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
wire             lsu_ctcq_not_empty;                     
wire    [7  :0]  lsu_dcache_ld_data_gateclk_en;          
wire    [7  :0]  lsu_dcache_ld_data_gwen_b;              
wire    [127:0]  lsu_dcache_ld_data_high_din;            
wire    [10 :0]  lsu_dcache_ld_data_high_idx;            
wire    [127:0]  lsu_dcache_ld_data_low_din;             
wire    [10 :0]  lsu_dcache_ld_data_low_idx;             
wire    [7  :0]  lsu_dcache_ld_data_sel_b;               
wire    [31 :0]  lsu_dcache_ld_data_wen_b;               
wire    [53 :0]  lsu_dcache_ld_tag_din;                  
wire             lsu_dcache_ld_tag_gateclk_en;           
wire             lsu_dcache_ld_tag_gwen_b;               
wire    [8  :0]  lsu_dcache_ld_tag_idx;                  
wire             lsu_dcache_ld_tag_sel_b;                
wire    [1  :0]  lsu_dcache_ld_tag_wen_b;                
wire             lsu_dcache_ld_xx_gwen;                  
wire    [6  :0]  lsu_dcache_st_dirty_din;                
wire             lsu_dcache_st_dirty_gateclk_en;         
wire             lsu_dcache_st_dirty_gwen_b;             
wire    [8  :0]  lsu_dcache_st_dirty_idx;                
wire             lsu_dcache_st_dirty_sel_b;              
wire    [6  :0]  lsu_dcache_st_dirty_wen_b;              
wire    [51 :0]  lsu_dcache_st_tag_din;                  
wire             lsu_dcache_st_tag_gateclk_en;           
wire             lsu_dcache_st_tag_gwen_b;               
wire    [8  :0]  lsu_dcache_st_tag_idx;                  
wire             lsu_dcache_st_tag_sel_b;                
wire    [1  :0]  lsu_dcache_st_tag_wen_b;                
wire    [2  :0]  lsu_had_amr_state;                      
wire    [1  :0]  lsu_had_cdr_state;                      
wire    [5  :0]  lsu_had_ctcq_entry_2_cmplt;             
wire    [5  :0]  lsu_had_ctcq_entry_cmplt;               
wire    [5  :0]  lsu_had_ctcq_entry_vld;                 
wire    [183:0]  lsu_had_debug_info;                     
wire    [2  :0]  lsu_had_icc_state;                      
wire    [39 :0]  lsu_had_ld_addr;                        
wire    [63 :0]  lsu_had_ld_data;                        
wire    [6  :0]  lsu_had_ld_iid;                         
wire             lsu_had_ld_req;                         
wire    [3  :0]  lsu_had_ld_type;                        
wire    [7  :0]  lsu_had_lfb_addr_entry_dcache_hit;      
wire    [7  :0]  lsu_had_lfb_addr_entry_rcl_done;        
wire    [7  :0]  lsu_had_lfb_addr_entry_vld;             
wire    [1  :0]  lsu_had_lfb_data_entry_last;            
wire    [1  :0]  lsu_had_lfb_data_entry_vld;             
wire             lsu_had_lfb_lf_sm_vld;                  
wire    [12 :0]  lsu_had_lfb_wakeup_queue;               
wire    [2  :0]  lsu_had_lm_state;                       
wire             lsu_had_mcic_data_req;                  
wire             lsu_had_mcic_frz;                       
wire             lsu_had_no_op;                          
wire    [7  :0]  lsu_had_rb_entry_fence;                 
wire    [3  :0]  lsu_had_rb_entry_state_0;               
wire    [3  :0]  lsu_had_rb_entry_state_1;               
wire    [3  :0]  lsu_had_rb_entry_state_2;               
wire    [3  :0]  lsu_had_rb_entry_state_3;               
wire    [3  :0]  lsu_had_rb_entry_state_4;               
wire    [3  :0]  lsu_had_rb_entry_state_5;               
wire    [3  :0]  lsu_had_rb_entry_state_6;               
wire    [3  :0]  lsu_had_rb_entry_state_7;               
wire    [2  :0]  lsu_had_sdb_entry_vld;                  
wire             lsu_had_snoop_data_req;                 
wire             lsu_had_snoop_tag_req;                  
wire    [5  :0]  lsu_had_snq_entry_issued;               
wire    [5  :0]  lsu_had_snq_entry_vld;                  
wire             lsu_had_sq_not_empty;                   
wire    [39 :0]  lsu_had_st_addr;                        
wire    [63 :0]  lsu_had_st_data;                        
wire    [6  :0]  lsu_had_st_iid;                         
wire             lsu_had_st_req;                         
wire    [3  :0]  lsu_had_st_type;                        
wire    [1  :0]  lsu_had_vb_addr_entry_vld;              
wire    [2  :0]  lsu_had_vb_data_entry_vld;              
wire    [3  :0]  lsu_had_vb_rcl_sm_state;                
wire             lsu_had_wmb_ar_pending;                 
wire             lsu_had_wmb_aw_pending;                 
wire    [7  :0]  lsu_had_wmb_create_ptr;                 
wire    [7  :0]  lsu_had_wmb_data_ptr;                   
wire    [7  :0]  lsu_had_wmb_entry_vld;                  
wire    [7  :0]  lsu_had_wmb_read_ptr;                   
wire             lsu_had_wmb_w_pending;                  
wire             lsu_had_wmb_write_imme;                 
wire    [7  :0]  lsu_had_wmb_write_ptr;                  
wire             lsu_has_fence;                          
wire             lsu_hpcp_cache_read_access;             
wire             lsu_hpcp_cache_read_miss;               
wire             lsu_hpcp_cache_write_access;            
wire             lsu_hpcp_cache_write_miss;              
wire             lsu_hpcp_fence_stall;                   
wire             lsu_hpcp_ld_cache_access;               
wire             lsu_hpcp_ld_cache_miss;                 
wire             lsu_hpcp_ld_cross_4k_stall;             
wire             lsu_hpcp_ld_data_discard;               
wire             lsu_hpcp_ld_discard_sq;                 
wire             lsu_hpcp_ld_other_stall;                
wire             lsu_hpcp_ld_stall_cross_4k;             
wire             lsu_hpcp_ld_stall_other;                
wire             lsu_hpcp_ld_unalign_inst;               
wire             lsu_hpcp_replay_data_discard;           
wire             lsu_hpcp_replay_discard_sq;             
wire             lsu_hpcp_st_cache_access;               
wire             lsu_hpcp_st_cache_miss;                 
wire             lsu_hpcp_st_cross_4k_stall;             
wire             lsu_hpcp_st_other_stall;                
wire             lsu_hpcp_st_stall_cross_4k;             
wire             lsu_hpcp_st_stall_other;                
wire             lsu_hpcp_st_unalign_inst;               
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
wire    [11 :0]  lsu_idu_ld_ag_wait_old;                 
wire             lsu_idu_ld_ag_wait_old_gateclk_en;      
wire    [11 :0]  lsu_idu_ld_da_wait_old;                 
wire             lsu_idu_ld_da_wait_old_gateclk_en;      
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
wire    [11 :0]  lsu_idu_st_ag_wait_old;                 
wire             lsu_idu_st_ag_wait_old_gateclk_en;      
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
wire    [3  :0]  lsu_pfu_l1_dist_sel;                    
wire    [3  :0]  lsu_pfu_l2_dist_sel;                    
wire             lsu_rtu_all_commit_data_vld;            
wire             lsu_rtu_all_commit_ld_data_vld;         
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
wire             lsu_sdb_not_empty;                      
wire             lsu_snoop_clk;                          
wire             lsu_snq_not_empty;                      
wire             lsu_special_clk;                        
wire             lsu_yy_xx_no_op;                        
wire    [7  :0]  mcic_dcache_arb_ld_data_gateclk_en;     
wire    [10 :0]  mcic_dcache_arb_ld_data_high_idx;       
wire    [10 :0]  mcic_dcache_arb_ld_data_low_idx;        
wire    [7  :0]  mcic_dcache_arb_ld_data_req;            
wire             mcic_dcache_arb_ld_req;                 
wire             mcic_dcache_arb_ld_tag_gateclk_en;      
wire    [8  :0]  mcic_dcache_arb_ld_tag_idx;             
wire    [39 :0]  mcic_dcache_arb_req_addr;               
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
wire             pad_yy_icg_scan_en;                     
wire    [39 :0]  pfu_biu_ar_addr;                        
wire    [1  :0]  pfu_biu_ar_bar;                         
wire    [1  :0]  pfu_biu_ar_burst;                       
wire    [3  :0]  pfu_biu_ar_cache;                       
wire    [1  :0]  pfu_biu_ar_domain;                      
wire             pfu_biu_ar_dp_req;                      
wire    [4  :0]  pfu_biu_ar_id;                          
wire    [1  :0]  pfu_biu_ar_len;                         
wire             pfu_biu_ar_lock;                        
wire    [2  :0]  pfu_biu_ar_prot;                        
wire             pfu_biu_ar_req;                         
wire             pfu_biu_ar_req_gateclk_en;              
wire    [2  :0]  pfu_biu_ar_size;                        
wire    [3  :0]  pfu_biu_ar_snoop;                       
wire    [2  :0]  pfu_biu_ar_user;                        
wire    [39 :0]  pfu_biu_req_addr;                       
wire             pfu_icc_ready;                          
wire             pfu_lfb_create_dp_vld;                  
wire             pfu_lfb_create_gateclk_en;              
wire             pfu_lfb_create_req;                     
wire             pfu_lfb_create_vld;                     
wire    [3  :0]  pfu_lfb_id;                             
wire             pfu_part_empty;                         
wire             pfu_pfb_empty;                          
wire             pfu_sdb_create_gateclk_en;              
wire             pfu_sdb_empty;                          
wire    [39 :0]  rb_biu_ar_addr;                         
wire    [1  :0]  rb_biu_ar_bar;                          
wire    [1  :0]  rb_biu_ar_burst;                        
wire    [3  :0]  rb_biu_ar_cache;                        
wire    [1  :0]  rb_biu_ar_domain;                       
wire             rb_biu_ar_dp_req;                       
wire    [4  :0]  rb_biu_ar_id;                           
wire    [1  :0]  rb_biu_ar_len;                          
wire             rb_biu_ar_lock;                         
wire    [2  :0]  rb_biu_ar_prot;                         
wire             rb_biu_ar_req;                          
wire             rb_biu_ar_req_gateclk_en;               
wire    [2  :0]  rb_biu_ar_size;                         
wire    [3  :0]  rb_biu_ar_snoop;                        
wire    [2  :0]  rb_biu_ar_user;                         
wire    [39 :0]  rb_biu_req_addr;                        
wire             rb_biu_req_unmask;                      
wire             rb_empty;                               
wire             rb_fence_ld;                            
wire             rb_ld_da_full;                          
wire             rb_ld_da_hit_idx;                       
wire             rb_ld_da_merge_fail;                    
wire             rb_ld_wb_bkpta_data;                    
wire             rb_ld_wb_bkptb_data;                    
wire             rb_ld_wb_bus_err;                       
wire    [39 :0]  rb_ld_wb_bus_err_addr;                  
wire             rb_ld_wb_cmplt_req;                     
wire    [63 :0]  rb_ld_wb_data;                          
wire    [6  :0]  rb_ld_wb_data_iid;                      
wire             rb_ld_wb_data_req;                      
wire             rb_ld_wb_expt_gateclk;                  
wire             rb_ld_wb_expt_vld;                      
wire    [6  :0]  rb_ld_wb_iid;                           
wire             rb_ld_wb_inst_vfls;                     
wire    [6  :0]  rb_ld_wb_preg;                          
wire    [3  :0]  rb_ld_wb_preg_sign_sel;                 
wire    [5  :0]  rb_ld_wb_vreg;                          
wire    [1  :0]  rb_ld_wb_vreg_sign_sel;                 
wire    [35 :0]  rb_lfb_addr_tto4;                       
wire             rb_lfb_atomic;                          
wire             rb_lfb_boundary_depd_wakeup;            
wire             rb_lfb_create_dp_vld;                   
wire             rb_lfb_create_gateclk_en;               
wire             rb_lfb_create_req;                      
wire             rb_lfb_create_vld;                      
wire             rb_lfb_depd;                            
wire             rb_lfb_ldamo;                           
wire    [4  :0]  rb_lm_ar_id;                            
wire             rb_lm_atomic_next_resp;                 
wire             rb_lm_wait_resp_dp_vld;                 
wire             rb_lm_wait_resp_vld;                    
wire    [4  :0]  rb_mcic_ar_id;                          
wire             rb_mcic_biu_req_success;                
wire             rb_mcic_ecc_err;                        
wire             rb_mcic_not_full;                       
wire             rb_pfu_biu_req_hit_idx;                 
wire             rb_pfu_nc_no_pending;                   
wire             rb_sq_pop_hit_idx;                      
wire             rb_st_da_full;                          
wire             rb_st_da_hit_idx;                       
wire             rb_wmb_ce_hit_idx;                      
wire             rb_wmb_so_pending;                      
wire             rtu_lsu_async_flush;                    
wire    [6  :0]  rtu_lsu_commit0_iid_updt_val;           
wire    [6  :0]  rtu_lsu_commit1_iid_updt_val;           
wire    [6  :0]  rtu_lsu_commit2_iid_updt_val;           
wire             rtu_lsu_eret_flush;                     
wire             rtu_lsu_expt_flush;                     
wire             rtu_lsu_spec_fail_flush;                
wire    [6  :0]  rtu_lsu_spec_fail_iid;                  
wire             rtu_yy_xx_commit0;                      
wire    [6  :0]  rtu_yy_xx_commit0_iid;                  
wire             rtu_yy_xx_commit1;                      
wire    [6  :0]  rtu_yy_xx_commit1_iid;                  
wire             rtu_yy_xx_commit2;                      
wire    [6  :0]  rtu_yy_xx_commit2_iid;                  
wire             rtu_yy_xx_dbgon;                        
wire             rtu_yy_xx_flush;                        
wire    [63 :0]  sd_ex1_data;                            
wire    [127:0]  sd_ex1_data_bypass;                     
wire             sd_ex1_inst_vld;                        
wire    [3  :0]  sd_rf_ex1_sdid;                         
wire             sd_rf_inst_vld_short;                   
wire    [127:0]  sdb_biu_cd_data;                        
wire             sdb_biu_cd_last;                        
wire             sdb_biu_cd_valid;                       
wire    [1  :0]  sdb_create_data_order;                  
wire    [2  :0]  sdb_create_en;                          
wire    [2  :0]  sdb_data_vld;                           
wire    [2  :0]  sdb_entry_avail;                        
wire    [127:0]  sdb_entry_data_0;                       
wire    [127:0]  sdb_entry_data_1;                       
wire    [127:0]  sdb_entry_data_2;                       
wire    [3  :0]  sdb_entry_data_index;                   
wire    [2  :0]  sdb_inv_en;                             
wire    [2  :0]  sdb_vld;                                
wire             sf_spec_hit;                            
wire             sf_spec_mark;                           
wire             snoop_req_create_en;                    
wire    [4  :0]  snq_biu_cr_resp;                        
wire             snq_biu_cr_valid;                       
wire    [33 :0]  snq_bypass_addr_tto6;                   
wire             snq_can_create_snq_uncheck;             
wire    [39 :0]  snq_create_addr;                        
wire             snq_create_lfb_vb_req_hit_idx;          
wire             snq_create_wmb_read_req_hit_idx;        
wire             snq_create_wmb_write_req_hit_idx;       
wire    [2  :0]  snq_data_bypass_hit;                    
wire    [39 :0]  snq_dcache_arb_borrow_addr;             
wire             snq_dcache_arb_data_way;                
wire             snq_dcache_arb_ld_borrow_req;           
wire             snq_dcache_arb_ld_borrow_req_gate;      
wire    [7  :0]  snq_dcache_arb_ld_data_gateclk_en;      
wire    [10 :0]  snq_dcache_arb_ld_data_idx;             
wire             snq_dcache_arb_ld_req;                  
wire             snq_dcache_arb_ld_tag_gateclk_en;       
wire    [8  :0]  snq_dcache_arb_ld_tag_idx;              
wire             snq_dcache_arb_ld_tag_req;              
wire    [1  :0]  snq_dcache_arb_ld_tag_wen;              
wire             snq_dcache_arb_serial_req;              
wire             snq_dcache_arb_st_borrow_req;           
wire    [6  :0]  snq_dcache_arb_st_dirty_din;            
wire             snq_dcache_arb_st_dirty_gateclk_en;     
wire             snq_dcache_arb_st_dirty_gwen;           
wire    [8  :0]  snq_dcache_arb_st_dirty_idx;            
wire             snq_dcache_arb_st_dirty_req;            
wire    [6  :0]  snq_dcache_arb_st_dirty_wen;            
wire    [5  :0]  snq_dcache_arb_st_id;                   
wire             snq_dcache_arb_st_req;                  
wire             snq_dcache_arb_st_tag_gateclk_en;       
wire    [8  :0]  snq_dcache_arb_st_tag_idx;              
wire             snq_dcache_arb_st_tag_req;              
wire    [2  :0]  snq_dcache_sdb_id;                      
wire    [1  :0]  snq_depd_vb_id;                         
wire             snq_empty;                              
wire    [1  :0]  snq_lfb_bypass_chg_tag;                 
wire    [1  :0]  snq_lfb_bypass_invalid;                 
wire             snq_lfb_vb_req_hit_idx;                 
wire    [33 :0]  snq_lm_dcache_addr_tto6;                
wire             snq_lm_dcache_req_for_inv;              
wire             snq_vb_bypass_check;                    
wire    [2  :0]  snq_vb_bypass_invalid;                  
wire             snq_vb_bypass_readonce;                 
wire    [2  :0]  snq_vb_bypass_start;                    
wire             snq_wmb_read_req_hit_idx;               
wire             snq_wmb_write_req_hit_idx;              
wire    [11 :0]  sq_data_depd_wakeup;                    
wire             sq_empty;                               
wire    [11 :0]  sq_global_depd_wakeup;                  
wire             sq_icc_clr;                             
wire             sq_icc_inv;                             
wire             sq_icc_req;                             
wire    [63 :0]  sq_ld_da_fwd_data;                      
wire    [63 :0]  sq_ld_da_fwd_data_pe;                   
wire             sq_ld_dc_addr1_dep_discard;             
wire             sq_ld_dc_cancel_acc_req;                
wire             sq_ld_dc_cancel_ahead_wb;               
wire             sq_ld_dc_data_discard_req;              
wire             sq_ld_dc_fwd_bypass_multi;              
wire             sq_ld_dc_fwd_bypass_req;                
wire    [11 :0]  sq_ld_dc_fwd_id;                        
wire             sq_ld_dc_fwd_multi;                     
wire             sq_ld_dc_fwd_multi_mask;                
wire             sq_ld_dc_fwd_req;                       
wire             sq_ld_dc_has_fwd_req;                   
wire             sq_ld_dc_newest_fwd_data_vld_req;       
wire             sq_ld_dc_other_discard_req;             
wire             sq_pfu_pop_synci_inst;                  
wire    [39 :0]  sq_pop_addr;                            
wire             sq_pop_atomic;                          
wire    [15 :0]  sq_pop_bytes_vld;                       
wire             sq_pop_icc;                             
wire             sq_pop_inst_flush;                      
wire    [1  :0]  sq_pop_inst_mode;                       
wire    [2  :0]  sq_pop_inst_size;                       
wire    [1  :0]  sq_pop_inst_type;                       
wire             sq_pop_page_buf;                        
wire             sq_pop_page_ca;                         
wire             sq_pop_page_sec;                        
wire             sq_pop_page_share;                      
wire             sq_pop_page_so;                         
wire             sq_pop_page_wa;                         
wire    [1  :0]  sq_pop_priv_mode;                       
wire    [11 :0]  sq_pop_ptr;                             
wire             sq_pop_sync_fence;                      
wire             sq_pop_wo_st;                           
wire             sq_st_dc_full;                          
wire             sq_st_dc_inst_hit;                      
wire             sq_wmb_merge_req;                       
wire             sq_wmb_merge_stall_req;                 
wire             sq_wmb_pop_to_ce_dp_req;                
wire             sq_wmb_pop_to_ce_gateclk_en;            
wire             sq_wmb_pop_to_ce_req;                   
wire             st_ag_already_da;                       
wire             st_ag_atomic;                           
wire             st_ag_boundary;                         
wire    [2  :0]  st_ag_dc_access_size;                   
wire    [39 :0]  st_ag_dc_addr0;                         
wire    [15 :0]  st_ag_dc_bytes_vld;                     
wire             st_ag_dc_inst_vld;                      
wire             st_ag_dc_mmu_req;                       
wire             st_ag_dc_page_share;                    
wire    [3  :0]  st_ag_dc_rot_sel;                       
wire             st_ag_expt_access_fault_with_page;      
wire             st_ag_expt_illegal_inst;                
wire             st_ag_expt_misalign_no_page;            
wire             st_ag_expt_misalign_with_page;          
wire             st_ag_expt_page_fault;                  
wire             st_ag_expt_stamo_not_ca;                
wire             st_ag_expt_vld;                         
wire    [3  :0]  st_ag_fence_mode;                       
wire             st_ag_icc;                              
wire    [6  :0]  st_ag_iid;                              
wire             st_ag_inst_flush;                       
wire    [1  :0]  st_ag_inst_mode;                        
wire    [1  :0]  st_ag_inst_type;                        
wire             st_ag_inst_vld;                         
wire             st_ag_lsfifo;                           
wire    [11 :0]  st_ag_lsid;                             
wire             st_ag_lsiq_bkpta_data;                  
wire             st_ag_lsiq_bkptb_data;                  
wire             st_ag_lsiq_spec_fail;                   
wire    [39 :0]  st_ag_mt_value;                         
wire             st_ag_no_spec;                          
wire             st_ag_old;                              
wire             st_ag_page_buf;                         
wire             st_ag_page_ca;                          
wire             st_ag_page_sec;                         
wire             st_ag_page_so;                          
wire             st_ag_page_wa;                          
wire    [14 :0]  st_ag_pc;                               
wire    [11 :0]  st_ag_sdid_oh;                          
wire             st_ag_secd;                             
wire             st_ag_split;                            
wire             st_ag_st;                               
wire             st_ag_staddr;                           
wire             st_ag_stall_ori;                        
wire    [11 :0]  st_ag_stall_restart_entry;              
wire             st_ag_sync_fence;                       
wire             st_ag_utlb_miss;                        
wire    [27 :0]  st_ag_vpn;                              
wire    [39 :0]  st_da_addr;                             
wire             st_da_bkpta_data;                       
wire             st_da_bkptb_data;                       
wire             st_da_borrow_icc_vld;                   
wire             st_da_borrow_vld;                       
wire             st_da_dcache_dirty;                     
wire             st_da_dcache_hit;                       
wire             st_da_dcache_miss;                      
wire             st_da_dcache_replace_dirty;             
wire             st_da_dcache_replace_valid;             
wire             st_da_dcache_replace_way;               
wire             st_da_dcache_way;                       
wire    [11 :0]  st_da_ecc_wakeup;                       
wire             st_da_fence_inst;                       
wire    [3  :0]  st_da_fence_mode;                       
wire    [2  :0]  st_da_icc_dirty_info;                   
wire    [25 :0]  st_da_icc_tag_info;                     
wire    [11 :0]  st_da_idu_already_da;                   
wire    [11 :0]  st_da_idu_bkpta_data;                   
wire    [11 :0]  st_da_idu_bkptb_data;                   
wire    [11 :0]  st_da_idu_boundary_gateclk_en;          
wire    [11 :0]  st_da_idu_pop_entry;                    
wire             st_da_idu_pop_vld;                      
wire    [11 :0]  st_da_idu_rb_full;                      
wire    [11 :0]  st_da_idu_secd;                         
wire    [11 :0]  st_da_idu_spec_fail;                    
wire    [11 :0]  st_da_idu_wait_fence;                   
wire    [6  :0]  st_da_iid;                              
wire    [2  :0]  st_da_inst_size;                        
wire             st_da_inst_vld;                         
wire             st_da_old;                              
wire             st_da_page_buf;                         
wire             st_da_page_ca;                          
wire             st_da_page_sec;                         
wire             st_da_page_sec_ff;                      
wire             st_da_page_share;                       
wire             st_da_page_share_ff;                    
wire             st_da_page_so;                          
wire    [14 :0]  st_da_pc;                               
wire             st_da_pfu_act_dp_vld;                   
wire             st_da_pfu_act_vld;                      
wire             st_da_pfu_biu_req_hit_idx;              
wire             st_da_pfu_evict_cnt_vld;                
wire             st_da_pfu_pf_inst_vld;                  
wire    [39 :0]  st_da_ppfu_va;                          
wire    [27 :0]  st_da_ppn_ff;                           
wire             st_da_rb_cmit;                          
wire             st_da_rb_create_dp_vld;                 
wire             st_da_rb_create_gateclk_en;             
wire             st_da_rb_create_lfb;                    
wire             st_da_rb_create_vld;                    
wire             st_da_rb_full_gateclk_en;               
wire             st_da_secd;                             
wire    [35 :0]  st_da_sf_addr_tto4;                     
wire    [15 :0]  st_da_sf_bytes_vld;                     
wire    [6  :0]  st_da_sf_iid;                           
wire             st_da_sf_no_spec_miss;                  
wire             st_da_sf_no_spec_miss_gate;             
wire             st_da_sf_spec_chk;                      
wire             st_da_sf_spec_chk_gate;                 
wire    [5  :0]  st_da_snq_borrow_snq;                   
wire             st_da_snq_dcache_dirty;                 
wire             st_da_snq_dcache_share;                 
wire             st_da_snq_dcache_valid;                 
wire             st_da_snq_dcache_way;                   
wire             st_da_snq_ecc_err;                      
wire             st_da_sq_dcache_dirty;                  
wire             st_da_sq_dcache_share;                  
wire             st_da_sq_dcache_valid;                  
wire             st_da_sq_dcache_way;                    
wire             st_da_sq_ecc_stall;                     
wire             st_da_sq_no_restart;                    
wire             st_da_sync_fence;                       
wire             st_da_sync_inst;                        
wire             st_da_vb_ecc_err;                       
wire             st_da_vb_ecc_stall;                     
wire    [25 :0]  st_da_vb_feedback_addr_tto14;           
wire             st_da_vb_tag_reissue;                   
wire             st_da_wait_fence_gateclk_en;            
wire             st_da_wb_cmplt_req;                     
wire    [4  :0]  st_da_wb_expt_vec;                      
wire             st_da_wb_expt_vld;                      
wire    [39 :0]  st_da_wb_mt_value;                      
wire             st_da_wb_no_spec_hit;                   
wire             st_da_wb_no_spec_mispred;               
wire             st_da_wb_no_spec_miss;                  
wire             st_da_wb_spec_fail;                     
wire             st_da_wb_vstart_vld;                    
wire    [39 :0]  st_dc_addr0;                            
wire             st_dc_already_da;                       
wire             st_dc_atomic;                           
wire             st_dc_bkpta_data;                       
wire             st_dc_bkptb_data;                       
wire             st_dc_borrow_dcache_replace;            
wire             st_dc_borrow_dcache_sw;                 
wire             st_dc_borrow_icc;                       
wire             st_dc_borrow_snq;                       
wire    [5  :0]  st_dc_borrow_snq_id;                    
wire             st_dc_borrow_vld;                       
wire             st_dc_boundary;                         
wire             st_dc_boundary_first;                   
wire    [15 :0]  st_dc_bytes_vld;                        
wire             st_dc_chk_st_inst_vld;                  
wire             st_dc_chk_statomic_inst_vld;            
wire             st_dc_cmit0_iid_crt_hit;                
wire             st_dc_cmit1_iid_crt_hit;                
wire             st_dc_cmit2_iid_crt_hit;                
wire    [6  :0]  st_dc_da_dcache_dirty_array;            
wire    [51 :0]  st_dc_da_dcache_tag_array;              
wire             st_dc_da_expt_vld_gate_en;              
wire             st_dc_da_inst_vld;                      
wire             st_dc_da_page_buf;                      
wire             st_dc_da_page_ca;                       
wire             st_dc_da_page_sec;                      
wire             st_dc_da_page_share;                    
wire             st_dc_da_page_so;                       
wire             st_dc_da_page_wa;                       
wire             st_dc_da_tag0_hit;                      
wire             st_dc_da_tag1_hit;                      
wire             st_dc_dcwp_hit_idx;                     
wire             st_dc_expt_access_fault_extra;          
wire             st_dc_expt_access_fault_mask;           
wire    [4  :0]  st_dc_expt_vec;                         
wire             st_dc_expt_vld_except_access_err;       
wire    [3  :0]  st_dc_fence_mode;                       
wire             st_dc_get_dcache_tag_dirty;             
wire             st_dc_icc;                              
wire    [11 :0]  st_dc_idu_sq_full;                      
wire    [11 :0]  st_dc_idu_tlb_busy;                     
wire    [6  :0]  st_dc_iid;                              
wire    [11 :0]  st_dc_imme_wakeup;                      
wire             st_dc_inst_flush;                       
wire    [1  :0]  st_dc_inst_mode;                        
wire    [2  :0]  st_dc_inst_size;                        
wire    [1  :0]  st_dc_inst_type;                        
wire             st_dc_inst_vld;                         
wire    [11 :0]  st_dc_lsid;                             
wire             st_dc_mmu_req;                          
wire    [39 :0]  st_dc_mt_value;                         
wire             st_dc_no_spec;                          
wire             st_dc_old;                              
wire    [14 :0]  st_dc_pc;                               
wire             st_dc_pf_inst;                          
wire    [39 :0]  st_dc_pfu_va;                           
wire    [7  :0]  st_dc_rot_sel_rev;                      
wire    [3  :0]  st_dc_sdid;                             
wire             st_dc_sdid_hit;                         
wire             st_dc_secd;                             
wire             st_dc_spec_fail;                        
wire             st_dc_split;                            
wire             st_dc_sq_create_dp_vld;                 
wire             st_dc_sq_create_gateclk_en;             
wire             st_dc_sq_create_vld;                    
wire             st_dc_sq_data_vld;                      
wire             st_dc_sq_full_gateclk_en;               
wire             st_dc_st;                               
wire             st_dc_sync_fence;                       
wire             st_dc_tlb_busy_gateclk_en;              
wire             st_dc_vector_nop;                       
wire             st_dc_wo_st_inst;                       
wire             st_rf_inst_vld;                         
wire             st_wb_inst_vld;                         
wire             st_wb_wmb_cmplt_grnt;                   
wire    [39 :0]  vb_biu_aw_addr;                         
wire    [1  :0]  vb_biu_aw_bar;                          
wire    [1  :0]  vb_biu_aw_burst;                        
wire    [3  :0]  vb_biu_aw_cache;                        
wire    [1  :0]  vb_biu_aw_domain;                       
wire             vb_biu_aw_dp_req;                       
wire    [4  :0]  vb_biu_aw_id;                           
wire    [1  :0]  vb_biu_aw_len;                          
wire             vb_biu_aw_lock;                         
wire    [2  :0]  vb_biu_aw_prot;                         
wire             vb_biu_aw_req;                          
wire             vb_biu_aw_req_gateclk_en;               
wire    [2  :0]  vb_biu_aw_size;                         
wire    [2  :0]  vb_biu_aw_snoop;                        
wire             vb_biu_aw_unique;                       
wire             vb_biu_aw_user;                         
wire    [127:0]  vb_biu_w_data;                          
wire    [4  :0]  vb_biu_w_id;                            
wire             vb_biu_w_last;                          
wire             vb_biu_w_req;                           
wire    [15 :0]  vb_biu_w_strb;                          
wire             vb_biu_w_vld;                           
wire    [1  :0]  vb_data_entry_addr_id_0;                
wire    [1  :0]  vb_data_entry_addr_id_1;                
wire    [1  :0]  vb_data_entry_addr_id_2;                
wire    [2  :0]  vb_data_entry_biu_req;                  
wire    [2  :0]  vb_data_entry_biu_req_success;          
wire    [2  :0]  vb_data_entry_bypass_pop;               
wire    [2  :0]  vb_data_entry_create_dp_vld;            
wire    [2  :0]  vb_data_entry_create_gateclk_en;        
wire    [2  :0]  vb_data_entry_create_vld;               
wire    [2  :0]  vb_data_entry_dirty;                    
wire    [2  :0]  vb_data_entry_inv;                      
wire    [2  :0]  vb_data_entry_lfb_create;               
wire    [2  :0]  vb_data_entry_normal_pop;               
wire    [2  :0]  vb_data_entry_req_success;              
wire    [2  :0]  vb_data_entry_vld;                      
wire    [2  :0]  vb_data_entry_wd_sm_grnt;               
wire    [2  :0]  vb_data_entry_wd_sm_req;                
wire    [127:0]  vb_data_entry_write_data128_0;          
wire    [127:0]  vb_data_entry_write_data128_1;          
wire    [127:0]  vb_data_entry_write_data128_2;          
wire    [39 :0]  vb_dcache_arb_borrow_addr;              
wire             vb_dcache_arb_data_way;                 
wire             vb_dcache_arb_dcache_replace;           
wire             vb_dcache_arb_ld_borrow_req;            
wire             vb_dcache_arb_ld_borrow_req_gate;       
wire    [7  :0]  vb_dcache_arb_ld_data_gateclk_en;       
wire    [10 :0]  vb_dcache_arb_ld_data_idx;              
wire             vb_dcache_arb_ld_req;                   
wire             vb_dcache_arb_ld_tag_gateclk_en;        
wire    [8  :0]  vb_dcache_arb_ld_tag_idx;               
wire             vb_dcache_arb_ld_tag_req;               
wire    [1  :0]  vb_dcache_arb_ld_tag_wen;               
wire             vb_dcache_arb_serial_req;               
wire             vb_dcache_arb_set_way_mode;             
wire             vb_dcache_arb_st_borrow_req;            
wire    [6  :0]  vb_dcache_arb_st_dirty_din;             
wire             vb_dcache_arb_st_dirty_gateclk_en;      
wire             vb_dcache_arb_st_dirty_gwen;            
wire    [8  :0]  vb_dcache_arb_st_dirty_idx;             
wire             vb_dcache_arb_st_dirty_req;             
wire    [6  :0]  vb_dcache_arb_st_dirty_wen;             
wire             vb_dcache_arb_st_req;                   
wire             vb_dcache_arb_st_tag_gateclk_en;        
wire    [8  :0]  vb_dcache_arb_st_tag_idx;               
wire             vb_dcache_arb_st_tag_req;               
wire             vb_empty;                               
wire             vb_icc_create_grnt;                     
wire             vb_invalid_vld;                         
wire    [7  :0]  vb_lfb_addr_entry_rcl_done;             
wire             vb_lfb_create_grnt;                     
wire             vb_lfb_dcache_dirty;                    
wire             vb_lfb_dcache_hit;                      
wire             vb_lfb_dcache_way;                      
wire             vb_lfb_rcl_done;                        
wire             vb_lfb_vb_req_hit_idx;                  
wire             vb_pfu_biu_req_hit_idx;                 
wire             vb_rb_biu_req_hit_idx;                  
wire    [1  :0]  vb_rcl_sm_addr_id;                      
wire             vb_rcl_sm_data_dcache_dirty;            
wire    [2  :0]  vb_rcl_sm_data_id;                      
wire    [2  :0]  vb_rcl_sm_data_set_data_done;           
wire             vb_rcl_sm_inv;                          
wire             vb_rcl_sm_lfb_create;                   
wire    [2  :0]  vb_sdb_data_entry_vld;                  
wire    [2  :0]  vb_snq_bypass_db_id;                    
wire             vb_snq_bypass_hit;                      
wire    [1  :0]  vb_snq_depd;                            
wire    [1  :0]  vb_snq_depd_remove;                     
wire             vb_snq_start_hit_idx;                   
wire    [1  :0]  vb_snq_wait_remove;                     
wire    [1  :0]  vb_snq_wait_vb_id;                      
wire    [3  :0]  vb_wd_sm_data_bias;                     
wire    [2  :0]  vb_wd_sm_data_pop_req;                  
wire             vb_wmb_create_grnt;                     
wire             vb_wmb_empty;                           
wire    [7  :0]  vb_wmb_entry_rcl_done;                  
wire             vb_wmb_write_req_hit_idx;               
wire    [33 :0]  victim_addr;                            
wire             vmb_empty;                              
wire             vmb_ld_wb_data_req;                     
wire    [39 :0]  wmb_biu_ar_addr;                        
wire    [1  :0]  wmb_biu_ar_bar;                         
wire    [1  :0]  wmb_biu_ar_burst;                       
wire    [3  :0]  wmb_biu_ar_cache;                       
wire    [1  :0]  wmb_biu_ar_domain;                      
wire             wmb_biu_ar_dp_req;                      
wire    [4  :0]  wmb_biu_ar_id;                          
wire    [1  :0]  wmb_biu_ar_len;                         
wire             wmb_biu_ar_lock;                        
wire    [2  :0]  wmb_biu_ar_prot;                        
wire             wmb_biu_ar_req;                         
wire             wmb_biu_ar_req_gateclk_en;              
wire    [2  :0]  wmb_biu_ar_size;                        
wire    [3  :0]  wmb_biu_ar_snoop;                       
wire    [2  :0]  wmb_biu_ar_user;                        
wire    [39 :0]  wmb_biu_aw_addr;                        
wire    [1  :0]  wmb_biu_aw_bar;                         
wire    [1  :0]  wmb_biu_aw_burst;                       
wire    [3  :0]  wmb_biu_aw_cache;                       
wire    [1  :0]  wmb_biu_aw_domain;                      
wire             wmb_biu_aw_dp_req;                      
wire    [4  :0]  wmb_biu_aw_id;                          
wire    [1  :0]  wmb_biu_aw_len;                         
wire             wmb_biu_aw_lock;                        
wire    [2  :0]  wmb_biu_aw_prot;                        
wire             wmb_biu_aw_req;                         
wire             wmb_biu_aw_req_gateclk_en;              
wire    [2  :0]  wmb_biu_aw_size;                        
wire    [2  :0]  wmb_biu_aw_snoop;                       
wire             wmb_biu_aw_user;                        
wire    [127:0]  wmb_biu_w_data;                         
wire    [4  :0]  wmb_biu_w_id;                           
wire             wmb_biu_w_last;                         
wire             wmb_biu_w_req;                          
wire    [15 :0]  wmb_biu_w_strb;                         
wire             wmb_biu_w_vld;                          
wire             wmb_biu_w_wns;                          
wire    [39 :0]  wmb_ce_addr;                            
wire             wmb_ce_atomic;                          
wire             wmb_ce_bkpta_data;                      
wire             wmb_ce_bkptb_data;                      
wire    [15 :0]  wmb_ce_bytes_vld;                       
wire             wmb_ce_bytes_vld_full;                  
wire             wmb_ce_ca_st_inst;                      
wire             wmb_ce_create_dp_vld;                   
wire             wmb_ce_create_gateclk_en;               
wire             wmb_ce_create_hit_rb_idx;               
wire             wmb_ce_create_merge;                    
wire    [7  :0]  wmb_ce_create_merge_ptr;                
wire    [7  :0]  wmb_ce_create_same_dcache_line;         
wire             wmb_ce_create_stall;                    
wire             wmb_ce_create_vld;                      
wire             wmb_ce_create_wmb_data_req;             
wire             wmb_ce_create_wmb_dp_req;               
wire             wmb_ce_create_wmb_gateclk_en;           
wire             wmb_ce_create_wmb_req;                  
wire    [127:0]  wmb_ce_data128;                         
wire    [3  :0]  wmb_ce_data_vld;                        
wire             wmb_ce_dcache_inst;                     
wire             wmb_ce_dcache_share;                    
wire             wmb_ce_dcache_sw_inst;                  
wire             wmb_ce_dcache_valid;                    
wire    [3  :0]  wmb_ce_fence_mode;                      
wire             wmb_ce_hit_sq_pop_dcache_line;          
wire             wmb_ce_icc;                             
wire    [6  :0]  wmb_ce_iid;                             
wire             wmb_ce_inst_flush;                      
wire    [1  :0]  wmb_ce_inst_mode;                       
wire    [2  :0]  wmb_ce_inst_size;                       
wire    [1  :0]  wmb_ce_inst_type;                       
wire             wmb_ce_merge_data_addr_hit;             
wire             wmb_ce_merge_data_stall;                
wire             wmb_ce_merge_en;                        
wire    [7  :0]  wmb_ce_merge_ptr;                       
wire             wmb_ce_merge_wmb_req;                   
wire             wmb_ce_merge_wmb_wait_not_vld_req;      
wire             wmb_ce_page_buf;                        
wire             wmb_ce_page_ca;                         
wire             wmb_ce_page_sec;                        
wire             wmb_ce_page_share;                      
wire             wmb_ce_page_so;                         
wire             wmb_ce_page_wa;                         
wire             wmb_ce_pop_vld;                         
wire    [1  :0]  wmb_ce_priv_mode;                       
wire             wmb_ce_read_dp_req;                     
wire    [7  :0]  wmb_ce_same_dcache_line;                
wire             wmb_ce_sc_wb_vld;                       
wire             wmb_ce_spec_fail;                       
wire    [11 :0]  wmb_ce_sq_ptr;                          
wire             wmb_ce_sync_fence;                      
wire             wmb_ce_update_dcache_dirty;             
wire             wmb_ce_update_dcache_share;             
wire             wmb_ce_update_dcache_valid;             
wire             wmb_ce_update_dcache_way;               
wire             wmb_ce_vld;                             
wire             wmb_ce_vstart_vld;                      
wire             wmb_ce_wb_cmplt_success;                
wire             wmb_ce_wb_data_success;                 
wire             wmb_ce_write_biu_dp_req;                
wire             wmb_ce_write_imme;                      
wire             wmb_clk;                                
wire             wmb_dcache_arb_data_way;                
wire             wmb_dcache_arb_ld_borrow_req;           
wire    [7  :0]  wmb_dcache_arb_ld_data_gateclk_en;      
wire    [7  :0]  wmb_dcache_arb_ld_data_gwen;            
wire    [127:0]  wmb_dcache_arb_ld_data_high_din;        
wire    [10 :0]  wmb_dcache_arb_ld_data_idx;             
wire    [127:0]  wmb_dcache_arb_ld_data_low_din;         
wire    [7  :0]  wmb_dcache_arb_ld_data_req;             
wire    [31 :0]  wmb_dcache_arb_ld_data_wen;             
wire             wmb_dcache_arb_ld_req;                  
wire             wmb_dcache_arb_ld_tag_gateclk_en;       
wire    [8  :0]  wmb_dcache_arb_ld_tag_idx;              
wire             wmb_dcache_arb_ld_tag_req;              
wire    [1  :0]  wmb_dcache_arb_ld_tag_wen;              
wire    [6  :0]  wmb_dcache_arb_st_dirty_din;            
wire             wmb_dcache_arb_st_dirty_gateclk_en;     
wire    [8  :0]  wmb_dcache_arb_st_dirty_idx;            
wire             wmb_dcache_arb_st_dirty_req;            
wire    [6  :0]  wmb_dcache_arb_st_dirty_wen;            
wire             wmb_dcache_arb_st_req;                  
wire    [11 :0]  wmb_depd_wakeup;                        
wire             wmb_empty;                              
wire    [7  :0]  wmb_entry_vld;                          
wire    [15 :0]  wmb_fwd_bytes_vld;                      
wire             wmb_has_sync_fence;                     
wire    [127:0]  wmb_ld_da_fwd_data;                     
wire             wmb_ld_dc_cancel_acc_req;               
wire             wmb_ld_dc_discard_req;                  
wire             wmb_ld_dc_fwd_req;                      
wire    [63 :0]  wmb_ld_wb_data;                         
wire    [39 :0]  wmb_ld_wb_data_addr;                    
wire    [6  :0]  wmb_ld_wb_data_iid;                     
wire             wmb_ld_wb_data_req;                     
wire             wmb_ld_wb_inst_vfls;                    
wire    [6  :0]  wmb_ld_wb_preg;                         
wire    [3  :0]  wmb_ld_wb_preg_sign_sel;                
wire    [5  :0]  wmb_ld_wb_vreg;                         
wire    [1  :0]  wmb_ld_wb_vreg_sign_sel;                
wire             wmb_lm_state_clr;                       
wire             wmb_no_op;                              
wire             wmb_pfu_biu_req_hit_idx;                
wire             wmb_rb_biu_req_hit_idx;                 
wire             wmb_rb_so_pending;                      
wire    [39 :0]  wmb_read_req_addr;                      
wire    [7  :0]  wmb_snq_depd;                           
wire    [7  :0]  wmb_snq_depd_remove;                    
wire             wmb_sq_pop_grnt;                        
wire             wmb_sq_pop_to_ce_grnt;                  
wire             wmb_st_wb_bkpta_data;                   
wire             wmb_st_wb_bkptb_data;                   
wire             wmb_st_wb_cmplt_req;                    
wire    [6  :0]  wmb_st_wb_iid;                          
wire             wmb_st_wb_inst_flush;                   
wire             wmb_st_wb_spec_fail;                    
wire             wmb_sync_fence_biu_req_success;         
wire    [33 :0]  wmb_vb_addr_tto6;                       
wire             wmb_vb_create_dp_vld;                   
wire             wmb_vb_create_gateclk_en;               
wire             wmb_vb_create_req;                      
wire             wmb_vb_create_vld;                      
wire             wmb_vb_inv;                             
wire             wmb_vb_set_way_mode;                    
wire    [7  :0]  wmb_write_ptr;                          
wire    [2  :0]  wmb_write_ptr_encode;                   
wire    [39 :0]  wmb_write_req_addr;                     
wire             wmb_write_req_icc;                      


// &Force("input","idu_lsu_vmb_create0_dp_en"); @31
// &Force("input","idu_lsu_vmb_create0_dst_ready"); @32
// &Force("input","idu_lsu_vmb_create0_en"); @33
// &Force("input","idu_lsu_vmb_create0_sdiq_entry"); @34
// &Force("input","idu_lsu_vmb_create0_split_num"); @35
// &Force("input","idu_lsu_vmb_create0_unit_stride"); @36
// &Force("input","idu_lsu_vmb_create0_vreg"); @37
// &Force("input","idu_lsu_vmb_create0_vsew"); @38
// &Force("input","idu_lsu_vmb_create0_vamo"); @39
// &Force("input","idu_lsu_vmb_create0_vl"); @40
// &Force("input","idu_lsu_vmb_create1_dp_en"); @41
// &Force("input","idu_lsu_vmb_create1_dst_ready"); @42
// &Force("input","idu_lsu_vmb_create1_en"); @43
// &Force("input","idu_lsu_vmb_create1_sdiq_entry"); @44
// &Force("input","idu_lsu_vmb_create1_split_num"); @45
// &Force("input","idu_lsu_vmb_create1_unit_stride"); @46
// &Force("input","idu_lsu_vmb_create1_vreg"); @47
// &Force("input","idu_lsu_vmb_create1_vsew"); @48
// &Force("input","idu_lsu_vmb_create1_vamo"); @49
// &Force("input","idu_lsu_vmb_create1_vl"); @50
// &Force("input","cp0_lsu_vstart"); @51

// &Force("bus","idu_lsu_vmb_create0_sdiq_entry",11,0); @53
// &Force("bus","idu_lsu_vmb_create0_split_num",6,0); @54
// &Force("bus","idu_lsu_vmb_create0_vreg",5,0); @55
// &Force("bus","idu_lsu_vmb_create0_vsew",1,0); @56
// &Force("bus","idu_lsu_vmb_create0_vl",7,0); @57
// &Force("bus","idu_lsu_vmb_create1_sdiq_entry",11,0); @58
// &Force("bus","idu_lsu_vmb_create1_split_num",6,0); @59
// &Force("bus","idu_lsu_vmb_create1_vreg",5,0); @60
// &Force("bus","idu_lsu_vmb_create1_vsew",1,0); @61
// &Force("bus","idu_lsu_vmb_create1_vl",7,0); @62
// &Force("bus","cp0_lsu_vstart",6,0); @63


assign lsu_idu_vmb_create0_entry[7:0] = 8'b0;
assign lsu_idu_vmb_create1_entry[7:0] = 8'b0;

assign lsu_rtu_wb_pipe3_vsetvl = 1'b0;
assign lsu_rtu_wb_pipe3_vstart[6:0] = 7'b0;
assign lsu_rtu_wb_pipe3_vstart_vld = 1'b0;
assign lsu_rtu_wb_pipe4_vstart[6:0] = 7'b0;
assign lsu_rtu_wb_pipe4_vstart_vld = 1'b0;

assign lsu_idu_vmb_1_left_updt = 1'b0;
assign lsu_idu_vmb_empty  = 1'b1;
assign lsu_idu_vmb_full = 1'b0;
assign lsu_idu_vmb_full_updt = 1'b0;
assign lsu_idu_vmb_full_updt_clk_en = 1'b0;

//==========================================================
//                    AG/EX1 Stage
//==========================================================
// &Instance("ct_lsu_ld_ag","x_ct_lsu_ld_ag"); @85
ct_lsu_ld_ag  x_ct_lsu_ld_ag (
  .ag_dcache_arb_ld_data_gateclk_en  (ag_dcache_arb_ld_data_gateclk_en ),
  .ag_dcache_arb_ld_data_high_idx    (ag_dcache_arb_ld_data_high_idx   ),
  .ag_dcache_arb_ld_data_low_idx     (ag_dcache_arb_ld_data_low_idx    ),
  .ag_dcache_arb_ld_data_req         (ag_dcache_arb_ld_data_req        ),
  .ag_dcache_arb_ld_tag_gateclk_en   (ag_dcache_arb_ld_tag_gateclk_en  ),
  .ag_dcache_arb_ld_tag_idx          (ag_dcache_arb_ld_tag_idx         ),
  .ag_dcache_arb_ld_tag_req          (ag_dcache_arb_ld_tag_req         ),
  .cp0_lsu_cb_aclr_dis               (cp0_lsu_cb_aclr_dis              ),
  .cp0_lsu_da_fwd_dis                (cp0_lsu_da_fwd_dis               ),
  .cp0_lsu_dcache_en                 (cp0_lsu_dcache_en                ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_lsu_mm                        (cp0_lsu_mm                       ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .ctrl_ld_clk                       (ctrl_ld_clk                      ),
  .dcache_arb_ag_ld_sel              (dcache_arb_ag_ld_sel             ),
  .dcache_arb_ld_ag_addr             (dcache_arb_ld_ag_addr            ),
  .dcache_arb_ld_ag_borrow_addr_vld  (dcache_arb_ld_ag_borrow_addr_vld ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .idu_lsu_rf_pipe3_already_da       (idu_lsu_rf_pipe3_already_da      ),
  .idu_lsu_rf_pipe3_atomic           (idu_lsu_rf_pipe3_atomic          ),
  .idu_lsu_rf_pipe3_bkpta_data       (idu_lsu_rf_pipe3_bkpta_data      ),
  .idu_lsu_rf_pipe3_bkptb_data       (idu_lsu_rf_pipe3_bkptb_data      ),
  .idu_lsu_rf_pipe3_gateclk_sel      (idu_lsu_rf_pipe3_gateclk_sel     ),
  .idu_lsu_rf_pipe3_iid              (idu_lsu_rf_pipe3_iid             ),
  .idu_lsu_rf_pipe3_inst_fls         (idu_lsu_rf_pipe3_inst_fls        ),
  .idu_lsu_rf_pipe3_inst_ldr         (idu_lsu_rf_pipe3_inst_ldr        ),
  .idu_lsu_rf_pipe3_inst_size        (idu_lsu_rf_pipe3_inst_size       ),
  .idu_lsu_rf_pipe3_inst_type        (idu_lsu_rf_pipe3_inst_type       ),
  .idu_lsu_rf_pipe3_lch_entry        (idu_lsu_rf_pipe3_lch_entry       ),
  .idu_lsu_rf_pipe3_lsfifo           (idu_lsu_rf_pipe3_lsfifo          ),
  .idu_lsu_rf_pipe3_no_spec          (idu_lsu_rf_pipe3_no_spec         ),
  .idu_lsu_rf_pipe3_no_spec_exist    (idu_lsu_rf_pipe3_no_spec_exist   ),
  .idu_lsu_rf_pipe3_off_0_extend     (idu_lsu_rf_pipe3_off_0_extend    ),
  .idu_lsu_rf_pipe3_offset           (idu_lsu_rf_pipe3_offset          ),
  .idu_lsu_rf_pipe3_offset_plus      (idu_lsu_rf_pipe3_offset_plus     ),
  .idu_lsu_rf_pipe3_oldest           (idu_lsu_rf_pipe3_oldest          ),
  .idu_lsu_rf_pipe3_pc               (idu_lsu_rf_pipe3_pc              ),
  .idu_lsu_rf_pipe3_preg             (idu_lsu_rf_pipe3_preg            ),
  .idu_lsu_rf_pipe3_sel              (idu_lsu_rf_pipe3_sel             ),
  .idu_lsu_rf_pipe3_shift            (idu_lsu_rf_pipe3_shift           ),
  .idu_lsu_rf_pipe3_sign_extend      (idu_lsu_rf_pipe3_sign_extend     ),
  .idu_lsu_rf_pipe3_spec_fail        (idu_lsu_rf_pipe3_spec_fail       ),
  .idu_lsu_rf_pipe3_split            (idu_lsu_rf_pipe3_split           ),
  .idu_lsu_rf_pipe3_src0             (idu_lsu_rf_pipe3_src0            ),
  .idu_lsu_rf_pipe3_src1             (idu_lsu_rf_pipe3_src1            ),
  .idu_lsu_rf_pipe3_unalign_2nd      (idu_lsu_rf_pipe3_unalign_2nd     ),
  .idu_lsu_rf_pipe3_vreg             (idu_lsu_rf_pipe3_vreg            ),
  .ld_ag_addr1_to4                   (ld_ag_addr1_to4                  ),
  .ld_ag_ahead_predict               (ld_ag_ahead_predict              ),
  .ld_ag_already_da                  (ld_ag_already_da                 ),
  .ld_ag_atomic                      (ld_ag_atomic                     ),
  .ld_ag_boundary                    (ld_ag_boundary                   ),
  .ld_ag_dc_access_size              (ld_ag_dc_access_size             ),
  .ld_ag_dc_acclr_en                 (ld_ag_dc_acclr_en                ),
  .ld_ag_dc_addr0                    (ld_ag_dc_addr0                   ),
  .ld_ag_dc_bytes_vld                (ld_ag_dc_bytes_vld               ),
  .ld_ag_dc_bytes_vld1               (ld_ag_dc_bytes_vld1              ),
  .ld_ag_dc_fwd_bypass_en            (ld_ag_dc_fwd_bypass_en           ),
  .ld_ag_dc_inst_vld                 (ld_ag_dc_inst_vld                ),
  .ld_ag_dc_load_ahead_inst_vld      (ld_ag_dc_load_ahead_inst_vld     ),
  .ld_ag_dc_load_inst_vld            (ld_ag_dc_load_inst_vld           ),
  .ld_ag_dc_mmu_req                  (ld_ag_dc_mmu_req                 ),
  .ld_ag_dc_rot_sel                  (ld_ag_dc_rot_sel                 ),
  .ld_ag_dc_vload_ahead_inst_vld     (ld_ag_dc_vload_ahead_inst_vld    ),
  .ld_ag_dc_vload_inst_vld           (ld_ag_dc_vload_inst_vld          ),
  .ld_ag_expt_access_fault_with_page (ld_ag_expt_access_fault_with_page),
  .ld_ag_expt_ldamo_not_ca           (ld_ag_expt_ldamo_not_ca          ),
  .ld_ag_expt_misalign_no_page       (ld_ag_expt_misalign_no_page      ),
  .ld_ag_expt_misalign_with_page     (ld_ag_expt_misalign_with_page    ),
  .ld_ag_expt_page_fault             (ld_ag_expt_page_fault            ),
  .ld_ag_expt_vld                    (ld_ag_expt_vld                   ),
  .ld_ag_iid                         (ld_ag_iid                        ),
  .ld_ag_inst_type                   (ld_ag_inst_type                  ),
  .ld_ag_inst_vfls                   (ld_ag_inst_vfls                  ),
  .ld_ag_inst_vld                    (ld_ag_inst_vld                   ),
  .ld_ag_ldfifo_pc                   (ld_ag_ldfifo_pc                  ),
  .ld_ag_lm_init_vld                 (ld_ag_lm_init_vld                ),
  .ld_ag_lr_inst                     (ld_ag_lr_inst                    ),
  .ld_ag_lsid                        (ld_ag_lsid                       ),
  .ld_ag_lsiq_bkpta_data             (ld_ag_lsiq_bkpta_data            ),
  .ld_ag_lsiq_bkptb_data             (ld_ag_lsiq_bkptb_data            ),
  .ld_ag_lsiq_spec_fail              (ld_ag_lsiq_spec_fail             ),
  .ld_ag_no_spec                     (ld_ag_no_spec                    ),
  .ld_ag_no_spec_exist               (ld_ag_no_spec_exist              ),
  .ld_ag_old                         (ld_ag_old                        ),
  .ld_ag_pa                          (ld_ag_pa                         ),
  .ld_ag_page_buf                    (ld_ag_page_buf                   ),
  .ld_ag_page_ca                     (ld_ag_page_ca                    ),
  .ld_ag_page_sec                    (ld_ag_page_sec                   ),
  .ld_ag_page_share                  (ld_ag_page_share                 ),
  .ld_ag_page_so                     (ld_ag_page_so                    ),
  .ld_ag_pf_inst                     (ld_ag_pf_inst                    ),
  .ld_ag_preg                        (ld_ag_preg                       ),
  .ld_ag_raw_new                     (ld_ag_raw_new                    ),
  .ld_ag_secd                        (ld_ag_secd                       ),
  .ld_ag_sign_extend                 (ld_ag_sign_extend                ),
  .ld_ag_split                       (ld_ag_split                      ),
  .ld_ag_stall_ori                   (ld_ag_stall_ori                  ),
  .ld_ag_stall_restart_entry         (ld_ag_stall_restart_entry        ),
  .ld_ag_utlb_miss                   (ld_ag_utlb_miss                  ),
  .ld_ag_vpn                         (ld_ag_vpn                        ),
  .ld_ag_vreg                        (ld_ag_vreg                       ),
  .lsu_hpcp_ld_cross_4k_stall        (lsu_hpcp_ld_cross_4k_stall       ),
  .lsu_hpcp_ld_other_stall           (lsu_hpcp_ld_other_stall          ),
  .lsu_idu_ag_pipe3_load_inst_vld    (lsu_idu_ag_pipe3_load_inst_vld   ),
  .lsu_idu_ag_pipe3_preg_dup0        (lsu_idu_ag_pipe3_preg_dup0       ),
  .lsu_idu_ag_pipe3_preg_dup1        (lsu_idu_ag_pipe3_preg_dup1       ),
  .lsu_idu_ag_pipe3_preg_dup2        (lsu_idu_ag_pipe3_preg_dup2       ),
  .lsu_idu_ag_pipe3_preg_dup3        (lsu_idu_ag_pipe3_preg_dup3       ),
  .lsu_idu_ag_pipe3_preg_dup4        (lsu_idu_ag_pipe3_preg_dup4       ),
  .lsu_idu_ag_pipe3_vload_inst_vld   (lsu_idu_ag_pipe3_vload_inst_vld  ),
  .lsu_idu_ag_pipe3_vreg_dup0        (lsu_idu_ag_pipe3_vreg_dup0       ),
  .lsu_idu_ag_pipe3_vreg_dup1        (lsu_idu_ag_pipe3_vreg_dup1       ),
  .lsu_idu_ag_pipe3_vreg_dup2        (lsu_idu_ag_pipe3_vreg_dup2       ),
  .lsu_idu_ag_pipe3_vreg_dup3        (lsu_idu_ag_pipe3_vreg_dup3       ),
  .lsu_idu_ld_ag_wait_old            (lsu_idu_ld_ag_wait_old           ),
  .lsu_idu_ld_ag_wait_old_gateclk_en (lsu_idu_ld_ag_wait_old_gateclk_en),
  .lsu_mmu_abort0                    (lsu_mmu_abort0                   ),
  .lsu_mmu_id0                       (lsu_mmu_id0                      ),
  .lsu_mmu_st_inst0                  (lsu_mmu_st_inst0                 ),
  .lsu_mmu_va0                       (lsu_mmu_va0                      ),
  .lsu_mmu_va0_vld                   (lsu_mmu_va0_vld                  ),
  .mmu_lsu_buf0                      (mmu_lsu_buf0                     ),
  .mmu_lsu_ca0                       (mmu_lsu_ca0                      ),
  .mmu_lsu_pa0                       (mmu_lsu_pa0                      ),
  .mmu_lsu_pa0_vld                   (mmu_lsu_pa0_vld                  ),
  .mmu_lsu_page_fault0               (mmu_lsu_page_fault0              ),
  .mmu_lsu_sec0                      (mmu_lsu_sec0                     ),
  .mmu_lsu_sh0                       (mmu_lsu_sh0                      ),
  .mmu_lsu_so0                       (mmu_lsu_so0                      ),
  .mmu_lsu_stall0                    (mmu_lsu_stall0                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .st_ag_iid                         (st_ag_iid                        )
);

//&Instance("ct_lsu_cmit_monitor","x_ct_lsu_cmit_monitor");
// &Instance("ct_lsu_st_ag","x_ct_lsu_st_ag"); @87
ct_lsu_st_ag  x_ct_lsu_st_ag (
  .ag_dcache_arb_st_dirty_gateclk_en (ag_dcache_arb_st_dirty_gateclk_en),
  .ag_dcache_arb_st_dirty_idx        (ag_dcache_arb_st_dirty_idx       ),
  .ag_dcache_arb_st_dirty_req        (ag_dcache_arb_st_dirty_req       ),
  .ag_dcache_arb_st_tag_gateclk_en   (ag_dcache_arb_st_tag_gateclk_en  ),
  .ag_dcache_arb_st_tag_idx          (ag_dcache_arb_st_tag_idx         ),
  .ag_dcache_arb_st_tag_req          (ag_dcache_arb_st_tag_req         ),
  .cp0_lsu_dcache_en                 (cp0_lsu_dcache_en                ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_lsu_mm                        (cp0_lsu_mm                       ),
  .cp0_lsu_tvm                       (cp0_lsu_tvm                      ),
  .cp0_lsu_ucme                      (cp0_lsu_ucme                     ),
  .cp0_lsu_wa                        (cp0_lsu_wa                       ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cp0_yy_virtual_mode               (cp0_yy_virtual_mode              ),
  .cpurst_b                          (cpurst_b                         ),
  .ctrl_st_clk                       (ctrl_st_clk                      ),
  .dcache_arb_ag_st_sel              (dcache_arb_ag_st_sel             ),
  .dcache_arb_st_ag_addr             (dcache_arb_st_ag_addr            ),
  .dcache_arb_st_ag_borrow_addr_vld  (dcache_arb_st_ag_borrow_addr_vld ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .idu_lsu_rf_pipe4_already_da       (idu_lsu_rf_pipe4_already_da      ),
  .idu_lsu_rf_pipe4_atomic           (idu_lsu_rf_pipe4_atomic          ),
  .idu_lsu_rf_pipe4_bkpta_data       (idu_lsu_rf_pipe4_bkpta_data      ),
  .idu_lsu_rf_pipe4_bkptb_data       (idu_lsu_rf_pipe4_bkptb_data      ),
  .idu_lsu_rf_pipe4_fence_mode       (idu_lsu_rf_pipe4_fence_mode      ),
  .idu_lsu_rf_pipe4_gateclk_sel      (idu_lsu_rf_pipe4_gateclk_sel     ),
  .idu_lsu_rf_pipe4_icc              (idu_lsu_rf_pipe4_icc             ),
  .idu_lsu_rf_pipe4_iid              (idu_lsu_rf_pipe4_iid             ),
  .idu_lsu_rf_pipe4_inst_code        (idu_lsu_rf_pipe4_inst_code       ),
  .idu_lsu_rf_pipe4_inst_fls         (idu_lsu_rf_pipe4_inst_fls        ),
  .idu_lsu_rf_pipe4_inst_flush       (idu_lsu_rf_pipe4_inst_flush      ),
  .idu_lsu_rf_pipe4_inst_mode        (idu_lsu_rf_pipe4_inst_mode       ),
  .idu_lsu_rf_pipe4_inst_share       (idu_lsu_rf_pipe4_inst_share      ),
  .idu_lsu_rf_pipe4_inst_size        (idu_lsu_rf_pipe4_inst_size       ),
  .idu_lsu_rf_pipe4_inst_str         (idu_lsu_rf_pipe4_inst_str        ),
  .idu_lsu_rf_pipe4_inst_type        (idu_lsu_rf_pipe4_inst_type       ),
  .idu_lsu_rf_pipe4_lch_entry        (idu_lsu_rf_pipe4_lch_entry       ),
  .idu_lsu_rf_pipe4_lsfifo           (idu_lsu_rf_pipe4_lsfifo          ),
  .idu_lsu_rf_pipe4_mmu_req          (idu_lsu_rf_pipe4_mmu_req         ),
  .idu_lsu_rf_pipe4_no_spec          (idu_lsu_rf_pipe4_no_spec         ),
  .idu_lsu_rf_pipe4_off_0_extend     (idu_lsu_rf_pipe4_off_0_extend    ),
  .idu_lsu_rf_pipe4_offset           (idu_lsu_rf_pipe4_offset          ),
  .idu_lsu_rf_pipe4_offset_plus      (idu_lsu_rf_pipe4_offset_plus     ),
  .idu_lsu_rf_pipe4_oldest           (idu_lsu_rf_pipe4_oldest          ),
  .idu_lsu_rf_pipe4_pc               (idu_lsu_rf_pipe4_pc              ),
  .idu_lsu_rf_pipe4_sdiq_entry       (idu_lsu_rf_pipe4_sdiq_entry      ),
  .idu_lsu_rf_pipe4_sel              (idu_lsu_rf_pipe4_sel             ),
  .idu_lsu_rf_pipe4_shift            (idu_lsu_rf_pipe4_shift           ),
  .idu_lsu_rf_pipe4_spec_fail        (idu_lsu_rf_pipe4_spec_fail       ),
  .idu_lsu_rf_pipe4_split            (idu_lsu_rf_pipe4_split           ),
  .idu_lsu_rf_pipe4_src0             (idu_lsu_rf_pipe4_src0            ),
  .idu_lsu_rf_pipe4_src1             (idu_lsu_rf_pipe4_src1            ),
  .idu_lsu_rf_pipe4_st               (idu_lsu_rf_pipe4_st              ),
  .idu_lsu_rf_pipe4_staddr           (idu_lsu_rf_pipe4_staddr          ),
  .idu_lsu_rf_pipe4_sync_fence       (idu_lsu_rf_pipe4_sync_fence      ),
  .idu_lsu_rf_pipe4_unalign_2nd      (idu_lsu_rf_pipe4_unalign_2nd     ),
  .lm_addr_pa                        (lm_addr_pa                       ),
  .lm_page_buf                       (lm_page_buf                      ),
  .lm_page_ca                        (lm_page_ca                       ),
  .lm_page_sec                       (lm_page_sec                      ),
  .lm_page_share                     (lm_page_share                    ),
  .lm_page_so                        (lm_page_so                       ),
  .lsu_hpcp_st_cross_4k_stall        (lsu_hpcp_st_cross_4k_stall       ),
  .lsu_hpcp_st_other_stall           (lsu_hpcp_st_other_stall          ),
  .lsu_idu_st_ag_wait_old            (lsu_idu_st_ag_wait_old           ),
  .lsu_idu_st_ag_wait_old_gateclk_en (lsu_idu_st_ag_wait_old_gateclk_en),
  .lsu_mmu_abort1                    (lsu_mmu_abort1                   ),
  .lsu_mmu_id1                       (lsu_mmu_id1                      ),
  .lsu_mmu_st_inst1                  (lsu_mmu_st_inst1                 ),
  .lsu_mmu_stamo_pa                  (lsu_mmu_stamo_pa                 ),
  .lsu_mmu_stamo_vld                 (lsu_mmu_stamo_vld                ),
  .lsu_mmu_va1                       (lsu_mmu_va1                      ),
  .lsu_mmu_va1_vld                   (lsu_mmu_va1_vld                  ),
  .mmu_lsu_buf1                      (mmu_lsu_buf1                     ),
  .mmu_lsu_ca1                       (mmu_lsu_ca1                      ),
  .mmu_lsu_pa1                       (mmu_lsu_pa1                      ),
  .mmu_lsu_pa1_vld                   (mmu_lsu_pa1_vld                  ),
  .mmu_lsu_page_fault1               (mmu_lsu_page_fault1              ),
  .mmu_lsu_sec1                      (mmu_lsu_sec1                     ),
  .mmu_lsu_sh1                       (mmu_lsu_sh1                      ),
  .mmu_lsu_so1                       (mmu_lsu_so1                      ),
  .mmu_lsu_stall1                    (mmu_lsu_stall1                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_dbgon                   (rtu_yy_xx_dbgon                  ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .st_ag_already_da                  (st_ag_already_da                 ),
  .st_ag_atomic                      (st_ag_atomic                     ),
  .st_ag_boundary                    (st_ag_boundary                   ),
  .st_ag_dc_access_size              (st_ag_dc_access_size             ),
  .st_ag_dc_addr0                    (st_ag_dc_addr0                   ),
  .st_ag_dc_bytes_vld                (st_ag_dc_bytes_vld               ),
  .st_ag_dc_inst_vld                 (st_ag_dc_inst_vld                ),
  .st_ag_dc_mmu_req                  (st_ag_dc_mmu_req                 ),
  .st_ag_dc_page_share               (st_ag_dc_page_share              ),
  .st_ag_dc_rot_sel                  (st_ag_dc_rot_sel                 ),
  .st_ag_expt_access_fault_with_page (st_ag_expt_access_fault_with_page),
  .st_ag_expt_illegal_inst           (st_ag_expt_illegal_inst          ),
  .st_ag_expt_misalign_no_page       (st_ag_expt_misalign_no_page      ),
  .st_ag_expt_misalign_with_page     (st_ag_expt_misalign_with_page    ),
  .st_ag_expt_page_fault             (st_ag_expt_page_fault            ),
  .st_ag_expt_stamo_not_ca           (st_ag_expt_stamo_not_ca          ),
  .st_ag_expt_vld                    (st_ag_expt_vld                   ),
  .st_ag_fence_mode                  (st_ag_fence_mode                 ),
  .st_ag_icc                         (st_ag_icc                        ),
  .st_ag_iid                         (st_ag_iid                        ),
  .st_ag_inst_flush                  (st_ag_inst_flush                 ),
  .st_ag_inst_mode                   (st_ag_inst_mode                  ),
  .st_ag_inst_type                   (st_ag_inst_type                  ),
  .st_ag_inst_vld                    (st_ag_inst_vld                   ),
  .st_ag_lsfifo                      (st_ag_lsfifo                     ),
  .st_ag_lsid                        (st_ag_lsid                       ),
  .st_ag_lsiq_bkpta_data             (st_ag_lsiq_bkpta_data            ),
  .st_ag_lsiq_bkptb_data             (st_ag_lsiq_bkptb_data            ),
  .st_ag_lsiq_spec_fail              (st_ag_lsiq_spec_fail             ),
  .st_ag_mt_value                    (st_ag_mt_value                   ),
  .st_ag_no_spec                     (st_ag_no_spec                    ),
  .st_ag_old                         (st_ag_old                        ),
  .st_ag_page_buf                    (st_ag_page_buf                   ),
  .st_ag_page_ca                     (st_ag_page_ca                    ),
  .st_ag_page_sec                    (st_ag_page_sec                   ),
  .st_ag_page_so                     (st_ag_page_so                    ),
  .st_ag_page_wa                     (st_ag_page_wa                    ),
  .st_ag_pc                          (st_ag_pc                         ),
  .st_ag_sdid_oh                     (st_ag_sdid_oh                    ),
  .st_ag_secd                        (st_ag_secd                       ),
  .st_ag_split                       (st_ag_split                      ),
  .st_ag_st                          (st_ag_st                         ),
  .st_ag_staddr                      (st_ag_staddr                     ),
  .st_ag_stall_ori                   (st_ag_stall_ori                  ),
  .st_ag_stall_restart_entry         (st_ag_stall_restart_entry        ),
  .st_ag_sync_fence                  (st_ag_sync_fence                 ),
  .st_ag_utlb_miss                   (st_ag_utlb_miss                  ),
  .st_ag_vpn                         (st_ag_vpn                        ),
  .st_rf_inst_vld                    (st_rf_inst_vld                   )
);

// &Instance("ct_lsu_sd_ex1","x_ct_lsu_sd_ex1"); @88
ct_lsu_sd_ex1  x_ct_lsu_sd_ex1 (
  .cp0_lsu_icg_en                (cp0_lsu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_st_clk                   (ctrl_st_clk                  ),
  .forever_cpuclk                (forever_cpuclk               ),
  .idu_lsu_rf_pipe5_gateclk_sel  (idu_lsu_rf_pipe5_gateclk_sel ),
  .idu_lsu_rf_pipe5_sdiq_entry   (idu_lsu_rf_pipe5_sdiq_entry  ),
  .idu_lsu_rf_pipe5_sel          (idu_lsu_rf_pipe5_sel         ),
  .idu_lsu_rf_pipe5_src0         (idu_lsu_rf_pipe5_src0        ),
  .idu_lsu_rf_pipe5_srcv0_fr     (idu_lsu_rf_pipe5_srcv0_fr    ),
  .idu_lsu_rf_pipe5_srcv0_fr_vld (idu_lsu_rf_pipe5_srcv0_fr_vld),
  .idu_lsu_rf_pipe5_srcv0_vld    (idu_lsu_rf_pipe5_srcv0_vld   ),
  .idu_lsu_rf_pipe5_srcv0_vr0    (idu_lsu_rf_pipe5_srcv0_vr0   ),
  .idu_lsu_rf_pipe5_srcv0_vr1    (idu_lsu_rf_pipe5_srcv0_vr1   ),
  .idu_lsu_rf_pipe5_stdata1_vld  (idu_lsu_rf_pipe5_stdata1_vld ),
  .idu_lsu_rf_pipe5_unalign      (idu_lsu_rf_pipe5_unalign     ),
  .lsu_idu_ex1_sdiq_entry        (lsu_idu_ex1_sdiq_entry       ),
  .lsu_idu_ex1_sdiq_frz_clr      (lsu_idu_ex1_sdiq_frz_clr     ),
  .lsu_idu_ex1_sdiq_pop_vld      (lsu_idu_ex1_sdiq_pop_vld     ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_yy_xx_flush               (rtu_yy_xx_flush              ),
  .sd_ex1_data                   (sd_ex1_data                  ),
  .sd_ex1_data_bypass            (sd_ex1_data_bypass           ),
  .sd_ex1_inst_vld               (sd_ex1_inst_vld              ),
  .sd_rf_ex1_sdid                (sd_rf_ex1_sdid               ),
  .sd_rf_inst_vld_short          (sd_rf_inst_vld_short         )
);


// &Instance("ct_lsu_mcic","x_ct_lsu_mcic"); @90
ct_lsu_mcic  x_ct_lsu_mcic (
  .biu_lsu_r_data                     (biu_lsu_r_data                    ),
  .biu_lsu_r_id                       (biu_lsu_r_id                      ),
  .biu_lsu_r_resp                     (biu_lsu_r_resp                    ),
  .biu_lsu_r_vld                      (biu_lsu_r_vld                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .dcache_arb_mcic_ld_grnt            (dcache_arb_mcic_ld_grnt           ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ld_da_dcache_hit                   (ld_da_dcache_hit                  ),
  .ld_da_mcic_borrow_mmu_req          (ld_da_mcic_borrow_mmu_req         ),
  .ld_da_mcic_bypass_data             (ld_da_mcic_bypass_data            ),
  .ld_da_mcic_data_err                (ld_da_mcic_data_err               ),
  .ld_da_mcic_rb_full                 (ld_da_mcic_rb_full                ),
  .ld_da_mcic_wakeup                  (ld_da_mcic_wakeup                 ),
  .lfb_mcic_wakeup                    (lfb_mcic_wakeup                   ),
  .lsu_had_mcic_data_req              (lsu_had_mcic_data_req             ),
  .lsu_had_mcic_frz                   (lsu_had_mcic_frz                  ),
  .lsu_mmu_bus_error                  (lsu_mmu_bus_error                 ),
  .lsu_mmu_data                       (lsu_mmu_data                      ),
  .lsu_mmu_data_vld                   (lsu_mmu_data_vld                  ),
  .mcic_dcache_arb_ld_data_gateclk_en (mcic_dcache_arb_ld_data_gateclk_en),
  .mcic_dcache_arb_ld_data_high_idx   (mcic_dcache_arb_ld_data_high_idx  ),
  .mcic_dcache_arb_ld_data_low_idx    (mcic_dcache_arb_ld_data_low_idx   ),
  .mcic_dcache_arb_ld_data_req        (mcic_dcache_arb_ld_data_req       ),
  .mcic_dcache_arb_ld_req             (mcic_dcache_arb_ld_req            ),
  .mcic_dcache_arb_ld_tag_gateclk_en  (mcic_dcache_arb_ld_tag_gateclk_en ),
  .mcic_dcache_arb_ld_tag_idx         (mcic_dcache_arb_ld_tag_idx        ),
  .mcic_dcache_arb_req_addr           (mcic_dcache_arb_req_addr          ),
  .mmu_lsu_data_req                   (mmu_lsu_data_req                  ),
  .mmu_lsu_data_req_addr              (mmu_lsu_data_req_addr             ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .rb_mcic_ar_id                      (rb_mcic_ar_id                     ),
  .rb_mcic_biu_req_success            (rb_mcic_biu_req_success           ),
  .rb_mcic_ecc_err                    (rb_mcic_ecc_err                   ),
  .rb_mcic_not_full                   (rb_mcic_not_full                  )
);

// &Instance("ct_lsu_dcache_arb","x_ct_lsu_dcache_arb"); @91
ct_lsu_dcache_arb  x_ct_lsu_dcache_arb (
  .ag_dcache_arb_ld_data_gateclk_en   (ag_dcache_arb_ld_data_gateclk_en  ),
  .ag_dcache_arb_ld_data_high_idx     (ag_dcache_arb_ld_data_high_idx    ),
  .ag_dcache_arb_ld_data_low_idx      (ag_dcache_arb_ld_data_low_idx     ),
  .ag_dcache_arb_ld_data_req          (ag_dcache_arb_ld_data_req         ),
  .ag_dcache_arb_ld_tag_gateclk_en    (ag_dcache_arb_ld_tag_gateclk_en   ),
  .ag_dcache_arb_ld_tag_idx           (ag_dcache_arb_ld_tag_idx          ),
  .ag_dcache_arb_ld_tag_req           (ag_dcache_arb_ld_tag_req          ),
  .ag_dcache_arb_st_dirty_gateclk_en  (ag_dcache_arb_st_dirty_gateclk_en ),
  .ag_dcache_arb_st_dirty_idx         (ag_dcache_arb_st_dirty_idx        ),
  .ag_dcache_arb_st_dirty_req         (ag_dcache_arb_st_dirty_req        ),
  .ag_dcache_arb_st_tag_gateclk_en    (ag_dcache_arb_st_tag_gateclk_en   ),
  .ag_dcache_arb_st_tag_idx           (ag_dcache_arb_st_tag_idx          ),
  .ag_dcache_arb_st_tag_req           (ag_dcache_arb_st_tag_req          ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cpurst_b                           (cpurst_b                          ),
  .dcache_arb_ag_ld_sel               (dcache_arb_ag_ld_sel              ),
  .dcache_arb_ag_st_sel               (dcache_arb_ag_st_sel              ),
  .dcache_arb_icc_ld_grnt             (dcache_arb_icc_ld_grnt            ),
  .dcache_arb_ld_ag_addr              (dcache_arb_ld_ag_addr             ),
  .dcache_arb_ld_ag_borrow_addr_vld   (dcache_arb_ld_ag_borrow_addr_vld  ),
  .dcache_arb_ld_dc_borrow_db         (dcache_arb_ld_dc_borrow_db        ),
  .dcache_arb_ld_dc_borrow_icc        (dcache_arb_ld_dc_borrow_icc       ),
  .dcache_arb_ld_dc_borrow_mmu        (dcache_arb_ld_dc_borrow_mmu       ),
  .dcache_arb_ld_dc_borrow_sndb       (dcache_arb_ld_dc_borrow_sndb      ),
  .dcache_arb_ld_dc_borrow_vb         (dcache_arb_ld_dc_borrow_vb        ),
  .dcache_arb_ld_dc_borrow_vld        (dcache_arb_ld_dc_borrow_vld       ),
  .dcache_arb_ld_dc_borrow_vld_gate   (dcache_arb_ld_dc_borrow_vld_gate  ),
  .dcache_arb_ld_dc_settle_way        (dcache_arb_ld_dc_settle_way       ),
  .dcache_arb_lfb_ld_grnt             (dcache_arb_lfb_ld_grnt            ),
  .dcache_arb_mcic_ld_grnt            (dcache_arb_mcic_ld_grnt           ),
  .dcache_arb_snq_ld_grnt             (dcache_arb_snq_ld_grnt            ),
  .dcache_arb_snq_st_grnt             (dcache_arb_snq_st_grnt            ),
  .dcache_arb_st_ag_addr              (dcache_arb_st_ag_addr             ),
  .dcache_arb_st_ag_borrow_addr_vld   (dcache_arb_st_ag_borrow_addr_vld  ),
  .dcache_arb_st_dc_borrow_icc        (dcache_arb_st_dc_borrow_icc       ),
  .dcache_arb_st_dc_borrow_snq        (dcache_arb_st_dc_borrow_snq       ),
  .dcache_arb_st_dc_borrow_snq_id     (dcache_arb_st_dc_borrow_snq_id    ),
  .dcache_arb_st_dc_borrow_vld        (dcache_arb_st_dc_borrow_vld       ),
  .dcache_arb_st_dc_borrow_vld_gate   (dcache_arb_st_dc_borrow_vld_gate  ),
  .dcache_arb_st_dc_dcache_replace    (dcache_arb_st_dc_dcache_replace   ),
  .dcache_arb_st_dc_dcache_sw         (dcache_arb_st_dc_dcache_sw        ),
  .dcache_arb_vb_ld_grnt              (dcache_arb_vb_ld_grnt             ),
  .dcache_arb_vb_st_grnt              (dcache_arb_vb_st_grnt             ),
  .dcache_arb_wmb_ld_grnt             (dcache_arb_wmb_ld_grnt            ),
  .dcache_dirty_din                   (dcache_dirty_din                  ),
  .dcache_dirty_gwen                  (dcache_dirty_gwen                 ),
  .dcache_dirty_wen                   (dcache_dirty_wen                  ),
  .dcache_idx                         (dcache_idx                        ),
  .dcache_snq_st_sel                  (dcache_snq_st_sel                 ),
  .dcache_tag_din                     (dcache_tag_din                    ),
  .dcache_tag_gwen                    (dcache_tag_gwen                   ),
  .dcache_tag_wen                     (dcache_tag_wen                    ),
  .dcache_vb_snq_gwen                 (dcache_vb_snq_gwen                ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .icc_dcache_arb_data_way            (icc_dcache_arb_data_way           ),
  .icc_dcache_arb_ld_borrow_req       (icc_dcache_arb_ld_borrow_req      ),
  .icc_dcache_arb_ld_data_gateclk_en  (icc_dcache_arb_ld_data_gateclk_en ),
  .icc_dcache_arb_ld_data_high_idx    (icc_dcache_arb_ld_data_high_idx   ),
  .icc_dcache_arb_ld_data_low_idx     (icc_dcache_arb_ld_data_low_idx    ),
  .icc_dcache_arb_ld_data_req         (icc_dcache_arb_ld_data_req        ),
  .icc_dcache_arb_ld_req              (icc_dcache_arb_ld_req             ),
  .icc_dcache_arb_ld_tag_gateclk_en   (icc_dcache_arb_ld_tag_gateclk_en  ),
  .icc_dcache_arb_ld_tag_idx          (icc_dcache_arb_ld_tag_idx         ),
  .icc_dcache_arb_ld_tag_read         (icc_dcache_arb_ld_tag_read        ),
  .icc_dcache_arb_ld_tag_req          (icc_dcache_arb_ld_tag_req         ),
  .icc_dcache_arb_st_borrow_req       (icc_dcache_arb_st_borrow_req      ),
  .icc_dcache_arb_st_dirty_din        (icc_dcache_arb_st_dirty_din       ),
  .icc_dcache_arb_st_dirty_gateclk_en (icc_dcache_arb_st_dirty_gateclk_en),
  .icc_dcache_arb_st_dirty_gwen       (icc_dcache_arb_st_dirty_gwen      ),
  .icc_dcache_arb_st_dirty_idx        (icc_dcache_arb_st_dirty_idx       ),
  .icc_dcache_arb_st_dirty_req        (icc_dcache_arb_st_dirty_req       ),
  .icc_dcache_arb_st_dirty_wen        (icc_dcache_arb_st_dirty_wen       ),
  .icc_dcache_arb_st_req              (icc_dcache_arb_st_req             ),
  .icc_dcache_arb_st_tag_gateclk_en   (icc_dcache_arb_st_tag_gateclk_en  ),
  .icc_dcache_arb_st_tag_idx          (icc_dcache_arb_st_tag_idx         ),
  .icc_dcache_arb_st_tag_req          (icc_dcache_arb_st_tag_req         ),
  .icc_dcache_arb_way                 (icc_dcache_arb_way                ),
  .lfb_dcache_arb_ld_data_gateclk_en  (lfb_dcache_arb_ld_data_gateclk_en ),
  .lfb_dcache_arb_ld_data_high_din    (lfb_dcache_arb_ld_data_high_din   ),
  .lfb_dcache_arb_ld_data_idx         (lfb_dcache_arb_ld_data_idx        ),
  .lfb_dcache_arb_ld_data_low_din     (lfb_dcache_arb_ld_data_low_din    ),
  .lfb_dcache_arb_ld_req              (lfb_dcache_arb_ld_req             ),
  .lfb_dcache_arb_ld_tag_din          (lfb_dcache_arb_ld_tag_din         ),
  .lfb_dcache_arb_ld_tag_gateclk_en   (lfb_dcache_arb_ld_tag_gateclk_en  ),
  .lfb_dcache_arb_ld_tag_idx          (lfb_dcache_arb_ld_tag_idx         ),
  .lfb_dcache_arb_ld_tag_req          (lfb_dcache_arb_ld_tag_req         ),
  .lfb_dcache_arb_ld_tag_wen          (lfb_dcache_arb_ld_tag_wen         ),
  .lfb_dcache_arb_serial_req          (lfb_dcache_arb_serial_req         ),
  .lfb_dcache_arb_st_dirty_din        (lfb_dcache_arb_st_dirty_din       ),
  .lfb_dcache_arb_st_dirty_gateclk_en (lfb_dcache_arb_st_dirty_gateclk_en),
  .lfb_dcache_arb_st_dirty_idx        (lfb_dcache_arb_st_dirty_idx       ),
  .lfb_dcache_arb_st_dirty_req        (lfb_dcache_arb_st_dirty_req       ),
  .lfb_dcache_arb_st_dirty_wen        (lfb_dcache_arb_st_dirty_wen       ),
  .lfb_dcache_arb_st_req              (lfb_dcache_arb_st_req             ),
  .lfb_dcache_arb_st_tag_din          (lfb_dcache_arb_st_tag_din         ),
  .lfb_dcache_arb_st_tag_gateclk_en   (lfb_dcache_arb_st_tag_gateclk_en  ),
  .lfb_dcache_arb_st_tag_idx          (lfb_dcache_arb_st_tag_idx         ),
  .lfb_dcache_arb_st_tag_req          (lfb_dcache_arb_st_tag_req         ),
  .lfb_dcache_arb_st_tag_wen          (lfb_dcache_arb_st_tag_wen         ),
  .lsu_dcache_ld_data_gateclk_en      (lsu_dcache_ld_data_gateclk_en     ),
  .lsu_dcache_ld_data_gwen_b          (lsu_dcache_ld_data_gwen_b         ),
  .lsu_dcache_ld_data_high_din        (lsu_dcache_ld_data_high_din       ),
  .lsu_dcache_ld_data_high_idx        (lsu_dcache_ld_data_high_idx       ),
  .lsu_dcache_ld_data_low_din         (lsu_dcache_ld_data_low_din        ),
  .lsu_dcache_ld_data_low_idx         (lsu_dcache_ld_data_low_idx        ),
  .lsu_dcache_ld_data_sel_b           (lsu_dcache_ld_data_sel_b          ),
  .lsu_dcache_ld_data_wen_b           (lsu_dcache_ld_data_wen_b          ),
  .lsu_dcache_ld_tag_din              (lsu_dcache_ld_tag_din             ),
  .lsu_dcache_ld_tag_gateclk_en       (lsu_dcache_ld_tag_gateclk_en      ),
  .lsu_dcache_ld_tag_gwen_b           (lsu_dcache_ld_tag_gwen_b          ),
  .lsu_dcache_ld_tag_idx              (lsu_dcache_ld_tag_idx             ),
  .lsu_dcache_ld_tag_sel_b            (lsu_dcache_ld_tag_sel_b           ),
  .lsu_dcache_ld_tag_wen_b            (lsu_dcache_ld_tag_wen_b           ),
  .lsu_dcache_ld_xx_gwen              (lsu_dcache_ld_xx_gwen             ),
  .lsu_dcache_st_dirty_din            (lsu_dcache_st_dirty_din           ),
  .lsu_dcache_st_dirty_gateclk_en     (lsu_dcache_st_dirty_gateclk_en    ),
  .lsu_dcache_st_dirty_gwen_b         (lsu_dcache_st_dirty_gwen_b        ),
  .lsu_dcache_st_dirty_idx            (lsu_dcache_st_dirty_idx           ),
  .lsu_dcache_st_dirty_sel_b          (lsu_dcache_st_dirty_sel_b         ),
  .lsu_dcache_st_dirty_wen_b          (lsu_dcache_st_dirty_wen_b         ),
  .lsu_dcache_st_tag_din              (lsu_dcache_st_tag_din             ),
  .lsu_dcache_st_tag_gateclk_en       (lsu_dcache_st_tag_gateclk_en      ),
  .lsu_dcache_st_tag_gwen_b           (lsu_dcache_st_tag_gwen_b          ),
  .lsu_dcache_st_tag_idx              (lsu_dcache_st_tag_idx             ),
  .lsu_dcache_st_tag_sel_b            (lsu_dcache_st_tag_sel_b           ),
  .lsu_dcache_st_tag_wen_b            (lsu_dcache_st_tag_wen_b           ),
  .mcic_dcache_arb_ld_data_gateclk_en (mcic_dcache_arb_ld_data_gateclk_en),
  .mcic_dcache_arb_ld_data_high_idx   (mcic_dcache_arb_ld_data_high_idx  ),
  .mcic_dcache_arb_ld_data_low_idx    (mcic_dcache_arb_ld_data_low_idx   ),
  .mcic_dcache_arb_ld_data_req        (mcic_dcache_arb_ld_data_req       ),
  .mcic_dcache_arb_ld_req             (mcic_dcache_arb_ld_req            ),
  .mcic_dcache_arb_ld_tag_gateclk_en  (mcic_dcache_arb_ld_tag_gateclk_en ),
  .mcic_dcache_arb_ld_tag_idx         (mcic_dcache_arb_ld_tag_idx        ),
  .mcic_dcache_arb_req_addr           (mcic_dcache_arb_req_addr          ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .snq_dcache_arb_borrow_addr         (snq_dcache_arb_borrow_addr        ),
  .snq_dcache_arb_data_way            (snq_dcache_arb_data_way           ),
  .snq_dcache_arb_ld_borrow_req       (snq_dcache_arb_ld_borrow_req      ),
  .snq_dcache_arb_ld_borrow_req_gate  (snq_dcache_arb_ld_borrow_req_gate ),
  .snq_dcache_arb_ld_data_gateclk_en  (snq_dcache_arb_ld_data_gateclk_en ),
  .snq_dcache_arb_ld_data_idx         (snq_dcache_arb_ld_data_idx        ),
  .snq_dcache_arb_ld_req              (snq_dcache_arb_ld_req             ),
  .snq_dcache_arb_ld_tag_gateclk_en   (snq_dcache_arb_ld_tag_gateclk_en  ),
  .snq_dcache_arb_ld_tag_idx          (snq_dcache_arb_ld_tag_idx         ),
  .snq_dcache_arb_ld_tag_req          (snq_dcache_arb_ld_tag_req         ),
  .snq_dcache_arb_ld_tag_wen          (snq_dcache_arb_ld_tag_wen         ),
  .snq_dcache_arb_serial_req          (snq_dcache_arb_serial_req         ),
  .snq_dcache_arb_st_borrow_req       (snq_dcache_arb_st_borrow_req      ),
  .snq_dcache_arb_st_dirty_din        (snq_dcache_arb_st_dirty_din       ),
  .snq_dcache_arb_st_dirty_gateclk_en (snq_dcache_arb_st_dirty_gateclk_en),
  .snq_dcache_arb_st_dirty_gwen       (snq_dcache_arb_st_dirty_gwen      ),
  .snq_dcache_arb_st_dirty_idx        (snq_dcache_arb_st_dirty_idx       ),
  .snq_dcache_arb_st_dirty_req        (snq_dcache_arb_st_dirty_req       ),
  .snq_dcache_arb_st_dirty_wen        (snq_dcache_arb_st_dirty_wen       ),
  .snq_dcache_arb_st_id               (snq_dcache_arb_st_id              ),
  .snq_dcache_arb_st_req              (snq_dcache_arb_st_req             ),
  .snq_dcache_arb_st_tag_gateclk_en   (snq_dcache_arb_st_tag_gateclk_en  ),
  .snq_dcache_arb_st_tag_idx          (snq_dcache_arb_st_tag_idx         ),
  .snq_dcache_arb_st_tag_req          (snq_dcache_arb_st_tag_req         ),
  .snq_dcache_sdb_id                  (snq_dcache_sdb_id                 ),
  .vb_dcache_arb_borrow_addr          (vb_dcache_arb_borrow_addr         ),
  .vb_dcache_arb_data_way             (vb_dcache_arb_data_way            ),
  .vb_dcache_arb_dcache_replace       (vb_dcache_arb_dcache_replace      ),
  .vb_dcache_arb_ld_borrow_req        (vb_dcache_arb_ld_borrow_req       ),
  .vb_dcache_arb_ld_borrow_req_gate   (vb_dcache_arb_ld_borrow_req_gate  ),
  .vb_dcache_arb_ld_data_gateclk_en   (vb_dcache_arb_ld_data_gateclk_en  ),
  .vb_dcache_arb_ld_data_idx          (vb_dcache_arb_ld_data_idx         ),
  .vb_dcache_arb_ld_req               (vb_dcache_arb_ld_req              ),
  .vb_dcache_arb_ld_tag_gateclk_en    (vb_dcache_arb_ld_tag_gateclk_en   ),
  .vb_dcache_arb_ld_tag_idx           (vb_dcache_arb_ld_tag_idx          ),
  .vb_dcache_arb_ld_tag_req           (vb_dcache_arb_ld_tag_req          ),
  .vb_dcache_arb_ld_tag_wen           (vb_dcache_arb_ld_tag_wen          ),
  .vb_dcache_arb_serial_req           (vb_dcache_arb_serial_req          ),
  .vb_dcache_arb_set_way_mode         (vb_dcache_arb_set_way_mode        ),
  .vb_dcache_arb_st_borrow_req        (vb_dcache_arb_st_borrow_req       ),
  .vb_dcache_arb_st_dirty_din         (vb_dcache_arb_st_dirty_din        ),
  .vb_dcache_arb_st_dirty_gateclk_en  (vb_dcache_arb_st_dirty_gateclk_en ),
  .vb_dcache_arb_st_dirty_gwen        (vb_dcache_arb_st_dirty_gwen       ),
  .vb_dcache_arb_st_dirty_idx         (vb_dcache_arb_st_dirty_idx        ),
  .vb_dcache_arb_st_dirty_req         (vb_dcache_arb_st_dirty_req        ),
  .vb_dcache_arb_st_dirty_wen         (vb_dcache_arb_st_dirty_wen        ),
  .vb_dcache_arb_st_req               (vb_dcache_arb_st_req              ),
  .vb_dcache_arb_st_tag_gateclk_en    (vb_dcache_arb_st_tag_gateclk_en   ),
  .vb_dcache_arb_st_tag_idx           (vb_dcache_arb_st_tag_idx          ),
  .vb_dcache_arb_st_tag_req           (vb_dcache_arb_st_tag_req          ),
  .vb_rcl_sm_data_id                  (vb_rcl_sm_data_id                 ),
  .wmb_dcache_arb_data_way            (wmb_dcache_arb_data_way           ),
  .wmb_dcache_arb_ld_borrow_req       (wmb_dcache_arb_ld_borrow_req      ),
  .wmb_dcache_arb_ld_data_gateclk_en  (wmb_dcache_arb_ld_data_gateclk_en ),
  .wmb_dcache_arb_ld_data_gwen        (wmb_dcache_arb_ld_data_gwen       ),
  .wmb_dcache_arb_ld_data_high_din    (wmb_dcache_arb_ld_data_high_din   ),
  .wmb_dcache_arb_ld_data_idx         (wmb_dcache_arb_ld_data_idx        ),
  .wmb_dcache_arb_ld_data_low_din     (wmb_dcache_arb_ld_data_low_din    ),
  .wmb_dcache_arb_ld_data_req         (wmb_dcache_arb_ld_data_req        ),
  .wmb_dcache_arb_ld_data_wen         (wmb_dcache_arb_ld_data_wen        ),
  .wmb_dcache_arb_ld_req              (wmb_dcache_arb_ld_req             ),
  .wmb_dcache_arb_ld_tag_gateclk_en   (wmb_dcache_arb_ld_tag_gateclk_en  ),
  .wmb_dcache_arb_ld_tag_idx          (wmb_dcache_arb_ld_tag_idx         ),
  .wmb_dcache_arb_ld_tag_req          (wmb_dcache_arb_ld_tag_req         ),
  .wmb_dcache_arb_ld_tag_wen          (wmb_dcache_arb_ld_tag_wen         ),
  .wmb_dcache_arb_st_dirty_din        (wmb_dcache_arb_st_dirty_din       ),
  .wmb_dcache_arb_st_dirty_gateclk_en (wmb_dcache_arb_st_dirty_gateclk_en),
  .wmb_dcache_arb_st_dirty_idx        (wmb_dcache_arb_st_dirty_idx       ),
  .wmb_dcache_arb_st_dirty_req        (wmb_dcache_arb_st_dirty_req       ),
  .wmb_dcache_arb_st_dirty_wen        (wmb_dcache_arb_st_dirty_wen       ),
  .wmb_dcache_arb_st_req              (wmb_dcache_arb_st_req             )
);

//==========================================================
//                       DC Stage
//==========================================================
// &Instance("ct_lsu_dcache_top","x_ct_lsu_dcache_top"); @95
ct_lsu_dcache_top  x_ct_lsu_dcache_top (
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .dcache_lsu_ld_data_bank0_dout  (dcache_lsu_ld_data_bank0_dout ),
  .dcache_lsu_ld_data_bank1_dout  (dcache_lsu_ld_data_bank1_dout ),
  .dcache_lsu_ld_data_bank2_dout  (dcache_lsu_ld_data_bank2_dout ),
  .dcache_lsu_ld_data_bank3_dout  (dcache_lsu_ld_data_bank3_dout ),
  .dcache_lsu_ld_data_bank4_dout  (dcache_lsu_ld_data_bank4_dout ),
  .dcache_lsu_ld_data_bank5_dout  (dcache_lsu_ld_data_bank5_dout ),
  .dcache_lsu_ld_data_bank6_dout  (dcache_lsu_ld_data_bank6_dout ),
  .dcache_lsu_ld_data_bank7_dout  (dcache_lsu_ld_data_bank7_dout ),
  .dcache_lsu_ld_tag_dout         (dcache_lsu_ld_tag_dout        ),
  .dcache_lsu_st_dirty_dout       (dcache_lsu_st_dirty_dout      ),
  .dcache_lsu_st_tag_dout         (dcache_lsu_st_tag_dout        ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .lsu_dcache_ld_data_gateclk_en  (lsu_dcache_ld_data_gateclk_en ),
  .lsu_dcache_ld_data_gwen_b      (lsu_dcache_ld_data_gwen_b     ),
  .lsu_dcache_ld_data_high_din    (lsu_dcache_ld_data_high_din   ),
  .lsu_dcache_ld_data_high_idx    (lsu_dcache_ld_data_high_idx   ),
  .lsu_dcache_ld_data_low_din     (lsu_dcache_ld_data_low_din    ),
  .lsu_dcache_ld_data_low_idx     (lsu_dcache_ld_data_low_idx    ),
  .lsu_dcache_ld_data_sel_b       (lsu_dcache_ld_data_sel_b      ),
  .lsu_dcache_ld_data_wen_b       (lsu_dcache_ld_data_wen_b      ),
  .lsu_dcache_ld_tag_din          (lsu_dcache_ld_tag_din         ),
  .lsu_dcache_ld_tag_gateclk_en   (lsu_dcache_ld_tag_gateclk_en  ),
  .lsu_dcache_ld_tag_gwen_b       (lsu_dcache_ld_tag_gwen_b      ),
  .lsu_dcache_ld_tag_idx          (lsu_dcache_ld_tag_idx         ),
  .lsu_dcache_ld_tag_sel_b        (lsu_dcache_ld_tag_sel_b       ),
  .lsu_dcache_ld_tag_wen_b        (lsu_dcache_ld_tag_wen_b       ),
  .lsu_dcache_st_dirty_din        (lsu_dcache_st_dirty_din       ),
  .lsu_dcache_st_dirty_gateclk_en (lsu_dcache_st_dirty_gateclk_en),
  .lsu_dcache_st_dirty_gwen_b     (lsu_dcache_st_dirty_gwen_b    ),
  .lsu_dcache_st_dirty_idx        (lsu_dcache_st_dirty_idx       ),
  .lsu_dcache_st_dirty_sel_b      (lsu_dcache_st_dirty_sel_b     ),
  .lsu_dcache_st_dirty_wen_b      (lsu_dcache_st_dirty_wen_b     ),
  .lsu_dcache_st_tag_din          (lsu_dcache_st_tag_din         ),
  .lsu_dcache_st_tag_gateclk_en   (lsu_dcache_st_tag_gateclk_en  ),
  .lsu_dcache_st_tag_gwen_b       (lsu_dcache_st_tag_gwen_b      ),
  .lsu_dcache_st_tag_idx          (lsu_dcache_st_tag_idx         ),
  .lsu_dcache_st_tag_sel_b        (lsu_dcache_st_tag_sel_b       ),
  .lsu_dcache_st_tag_wen_b        (lsu_dcache_st_tag_wen_b       ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            )
);

// &Instance("ct_lsu_ld_dc","x_ct_lsu_ld_dc"); @96
ct_lsu_ld_dc  x_ct_lsu_ld_dc (
  .cb_ld_dc_addr_hit                       (cb_ld_dc_addr_hit                      ),
  .cp0_lsu_da_fwd_dis                      (cp0_lsu_da_fwd_dis                     ),
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_ld_clk                             (ctrl_ld_clk                            ),
  .dcache_arb_ld_dc_borrow_db              (dcache_arb_ld_dc_borrow_db             ),
  .dcache_arb_ld_dc_borrow_icc             (dcache_arb_ld_dc_borrow_icc            ),
  .dcache_arb_ld_dc_borrow_mmu             (dcache_arb_ld_dc_borrow_mmu            ),
  .dcache_arb_ld_dc_borrow_sndb            (dcache_arb_ld_dc_borrow_sndb           ),
  .dcache_arb_ld_dc_borrow_vb              (dcache_arb_ld_dc_borrow_vb             ),
  .dcache_arb_ld_dc_borrow_vld             (dcache_arb_ld_dc_borrow_vld            ),
  .dcache_arb_ld_dc_borrow_vld_gate        (dcache_arb_ld_dc_borrow_vld_gate       ),
  .dcache_arb_ld_dc_settle_way             (dcache_arb_ld_dc_settle_way            ),
  .dcache_idx                              (dcache_idx                             ),
  .dcache_lsu_ld_tag_dout                  (dcache_lsu_ld_tag_dout                 ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .had_yy_xx_bkpta_base                    (had_yy_xx_bkpta_base                   ),
  .had_yy_xx_bkpta_mask                    (had_yy_xx_bkpta_mask                   ),
  .had_yy_xx_bkpta_rc                      (had_yy_xx_bkpta_rc                     ),
  .had_yy_xx_bkptb_base                    (had_yy_xx_bkptb_base                   ),
  .had_yy_xx_bkptb_mask                    (had_yy_xx_bkptb_mask                   ),
  .had_yy_xx_bkptb_rc                      (had_yy_xx_bkptb_rc                     ),
  .icc_dcache_arb_ld_tag_read              (icc_dcache_arb_ld_tag_read             ),
  .ld_ag_addr1_to4                         (ld_ag_addr1_to4                        ),
  .ld_ag_ahead_predict                     (ld_ag_ahead_predict                    ),
  .ld_ag_already_da                        (ld_ag_already_da                       ),
  .ld_ag_atomic                            (ld_ag_atomic                           ),
  .ld_ag_boundary                          (ld_ag_boundary                         ),
  .ld_ag_dc_access_size                    (ld_ag_dc_access_size                   ),
  .ld_ag_dc_acclr_en                       (ld_ag_dc_acclr_en                      ),
  .ld_ag_dc_addr0                          (ld_ag_dc_addr0                         ),
  .ld_ag_dc_bytes_vld                      (ld_ag_dc_bytes_vld                     ),
  .ld_ag_dc_bytes_vld1                     (ld_ag_dc_bytes_vld1                    ),
  .ld_ag_dc_fwd_bypass_en                  (ld_ag_dc_fwd_bypass_en                 ),
  .ld_ag_dc_inst_vld                       (ld_ag_dc_inst_vld                      ),
  .ld_ag_dc_load_ahead_inst_vld            (ld_ag_dc_load_ahead_inst_vld           ),
  .ld_ag_dc_load_inst_vld                  (ld_ag_dc_load_inst_vld                 ),
  .ld_ag_dc_mmu_req                        (ld_ag_dc_mmu_req                       ),
  .ld_ag_dc_rot_sel                        (ld_ag_dc_rot_sel                       ),
  .ld_ag_dc_vload_ahead_inst_vld           (ld_ag_dc_vload_ahead_inst_vld          ),
  .ld_ag_dc_vload_inst_vld                 (ld_ag_dc_vload_inst_vld                ),
  .ld_ag_expt_access_fault_with_page       (ld_ag_expt_access_fault_with_page      ),
  .ld_ag_expt_ldamo_not_ca                 (ld_ag_expt_ldamo_not_ca                ),
  .ld_ag_expt_misalign_no_page             (ld_ag_expt_misalign_no_page            ),
  .ld_ag_expt_misalign_with_page           (ld_ag_expt_misalign_with_page          ),
  .ld_ag_expt_page_fault                   (ld_ag_expt_page_fault                  ),
  .ld_ag_expt_vld                          (ld_ag_expt_vld                         ),
  .ld_ag_iid                               (ld_ag_iid                              ),
  .ld_ag_inst_type                         (ld_ag_inst_type                        ),
  .ld_ag_inst_vfls                         (ld_ag_inst_vfls                        ),
  .ld_ag_inst_vld                          (ld_ag_inst_vld                         ),
  .ld_ag_ldfifo_pc                         (ld_ag_ldfifo_pc                        ),
  .ld_ag_lsid                              (ld_ag_lsid                             ),
  .ld_ag_lsiq_bkpta_data                   (ld_ag_lsiq_bkpta_data                  ),
  .ld_ag_lsiq_bkptb_data                   (ld_ag_lsiq_bkptb_data                  ),
  .ld_ag_lsiq_spec_fail                    (ld_ag_lsiq_spec_fail                   ),
  .ld_ag_no_spec                           (ld_ag_no_spec                          ),
  .ld_ag_no_spec_exist                     (ld_ag_no_spec_exist                    ),
  .ld_ag_old                               (ld_ag_old                              ),
  .ld_ag_page_buf                          (ld_ag_page_buf                         ),
  .ld_ag_page_ca                           (ld_ag_page_ca                          ),
  .ld_ag_page_sec                          (ld_ag_page_sec                         ),
  .ld_ag_page_share                        (ld_ag_page_share                       ),
  .ld_ag_page_so                           (ld_ag_page_so                          ),
  .ld_ag_pf_inst                           (ld_ag_pf_inst                          ),
  .ld_ag_preg                              (ld_ag_preg                             ),
  .ld_ag_raw_new                           (ld_ag_raw_new                          ),
  .ld_ag_secd                              (ld_ag_secd                             ),
  .ld_ag_sign_extend                       (ld_ag_sign_extend                      ),
  .ld_ag_split                             (ld_ag_split                            ),
  .ld_ag_utlb_miss                         (ld_ag_utlb_miss                        ),
  .ld_ag_vpn                               (ld_ag_vpn                              ),
  .ld_ag_vreg                              (ld_ag_vreg                             ),
  .ld_dc_addr0                             (ld_dc_addr0                            ),
  .ld_dc_addr1                             (ld_dc_addr1                            ),
  .ld_dc_addr1_11to4                       (ld_dc_addr1_11to4                      ),
  .ld_dc_ahead_predict                     (ld_dc_ahead_predict                    ),
  .ld_dc_ahead_preg_wb_vld                 (ld_dc_ahead_preg_wb_vld                ),
  .ld_dc_ahead_vreg_wb_vld                 (ld_dc_ahead_vreg_wb_vld                ),
  .ld_dc_already_da                        (ld_dc_already_da                       ),
  .ld_dc_atomic                            (ld_dc_atomic                           ),
  .ld_dc_bkpta_data                        (ld_dc_bkpta_data                       ),
  .ld_dc_bkptb_data                        (ld_dc_bkptb_data                       ),
  .ld_dc_borrow_db                         (ld_dc_borrow_db                        ),
  .ld_dc_borrow_icc                        (ld_dc_borrow_icc                       ),
  .ld_dc_borrow_icc_tag                    (ld_dc_borrow_icc_tag                   ),
  .ld_dc_borrow_mmu                        (ld_dc_borrow_mmu                       ),
  .ld_dc_borrow_sndb                       (ld_dc_borrow_sndb                      ),
  .ld_dc_borrow_vb                         (ld_dc_borrow_vb                        ),
  .ld_dc_borrow_vld                        (ld_dc_borrow_vld                       ),
  .ld_dc_boundary                          (ld_dc_boundary                         ),
  .ld_dc_bytes_vld                         (ld_dc_bytes_vld                        ),
  .ld_dc_bytes_vld1                        (ld_dc_bytes_vld1                       ),
  .ld_dc_cb_addr_create_gateclk_en         (ld_dc_cb_addr_create_gateclk_en        ),
  .ld_dc_cb_addr_create_vld                (ld_dc_cb_addr_create_vld               ),
  .ld_dc_cb_addr_tto4                      (ld_dc_cb_addr_tto4                     ),
  .ld_dc_chk_atomic_inst_vld               (ld_dc_chk_atomic_inst_vld              ),
  .ld_dc_chk_ld_addr1_vld                  (ld_dc_chk_ld_addr1_vld                 ),
  .ld_dc_chk_ld_bypass_vld                 (ld_dc_chk_ld_bypass_vld                ),
  .ld_dc_chk_ld_inst_vld                   (ld_dc_chk_ld_inst_vld                  ),
  .ld_dc_da_bytes_vld                      (ld_dc_da_bytes_vld                     ),
  .ld_dc_da_bytes_vld1                     (ld_dc_da_bytes_vld1                    ),
  .ld_dc_da_cb_addr_create                 (ld_dc_da_cb_addr_create                ),
  .ld_dc_da_cb_merge_en                    (ld_dc_da_cb_merge_en                   ),
  .ld_dc_da_data_rot_sel                   (ld_dc_da_data_rot_sel                  ),
  .ld_dc_da_expt_vld_gate_en               (ld_dc_da_expt_vld_gate_en              ),
  .ld_dc_da_icc_tag_vld                    (ld_dc_da_icc_tag_vld                   ),
  .ld_dc_da_inst_vld                       (ld_dc_da_inst_vld                      ),
  .ld_dc_da_old                            (ld_dc_da_old                           ),
  .ld_dc_da_page_buf                       (ld_dc_da_page_buf                      ),
  .ld_dc_da_page_ca                        (ld_dc_da_page_ca                       ),
  .ld_dc_da_page_sec                       (ld_dc_da_page_sec                      ),
  .ld_dc_da_page_share                     (ld_dc_da_page_share                    ),
  .ld_dc_da_page_so                        (ld_dc_da_page_so                       ),
  .ld_dc_da_pf_inst                        (ld_dc_da_pf_inst                       ),
  .ld_dc_da_tag_read                       (ld_dc_da_tag_read                      ),
  .ld_dc_dcache_hit                        (ld_dc_dcache_hit                       ),
  .ld_dc_expt_access_fault_extra           (ld_dc_expt_access_fault_extra          ),
  .ld_dc_expt_access_fault_mask            (ld_dc_expt_access_fault_mask           ),
  .ld_dc_expt_vec                          (ld_dc_expt_vec                         ),
  .ld_dc_expt_vld_except_access_err        (ld_dc_expt_vld_except_access_err       ),
  .ld_dc_fwd_bytes_vld                     (ld_dc_fwd_bytes_vld                    ),
  .ld_dc_fwd_sq_vld                        (ld_dc_fwd_sq_vld                       ),
  .ld_dc_fwd_wmb_vld                       (ld_dc_fwd_wmb_vld                      ),
  .ld_dc_get_dcache_data                   (ld_dc_get_dcache_data                  ),
  .ld_dc_hit_high_region                   (ld_dc_hit_high_region                  ),
  .ld_dc_hit_low_region                    (ld_dc_hit_low_region                   ),
  .ld_dc_idu_lq_full                       (ld_dc_idu_lq_full                      ),
  .ld_dc_idu_tlb_busy                      (ld_dc_idu_tlb_busy                     ),
  .ld_dc_iid                               (ld_dc_iid                              ),
  .ld_dc_imme_wakeup                       (ld_dc_imme_wakeup                      ),
  .ld_dc_inst_chk_vld                      (ld_dc_inst_chk_vld                     ),
  .ld_dc_inst_size                         (ld_dc_inst_size                        ),
  .ld_dc_inst_type                         (ld_dc_inst_type                        ),
  .ld_dc_inst_vfls                         (ld_dc_inst_vfls                        ),
  .ld_dc_inst_vld                          (ld_dc_inst_vld                         ),
  .ld_dc_ldfifo_pc                         (ld_dc_ldfifo_pc                        ),
  .ld_dc_lq_create1_dp_vld                 (ld_dc_lq_create1_dp_vld                ),
  .ld_dc_lq_create1_gateclk_en             (ld_dc_lq_create1_gateclk_en            ),
  .ld_dc_lq_create1_vld                    (ld_dc_lq_create1_vld                   ),
  .ld_dc_lq_create_dp_vld                  (ld_dc_lq_create_dp_vld                 ),
  .ld_dc_lq_create_gateclk_en              (ld_dc_lq_create_gateclk_en             ),
  .ld_dc_lq_create_vld                     (ld_dc_lq_create_vld                    ),
  .ld_dc_lq_full_gateclk_en                (ld_dc_lq_full_gateclk_en               ),
  .ld_dc_lsid                              (ld_dc_lsid                             ),
  .ld_dc_mmu_req                           (ld_dc_mmu_req                          ),
  .ld_dc_mt_value                          (ld_dc_mt_value                         ),
  .ld_dc_no_spec                           (ld_dc_no_spec                          ),
  .ld_dc_no_spec_exist                     (ld_dc_no_spec_exist                    ),
  .ld_dc_pfu_info_set_vld                  (ld_dc_pfu_info_set_vld                 ),
  .ld_dc_pfu_va                            (ld_dc_pfu_va                           ),
  .ld_dc_preg                              (ld_dc_preg                             ),
  .ld_dc_preg_sign_sel                     (ld_dc_preg_sign_sel                    ),
  .ld_dc_secd                              (ld_dc_secd                             ),
  .ld_dc_settle_way                        (ld_dc_settle_way                       ),
  .ld_dc_sign_extend                       (ld_dc_sign_extend                      ),
  .ld_dc_spec_fail                         (ld_dc_spec_fail                        ),
  .ld_dc_split                             (ld_dc_split                            ),
  .ld_dc_tlb_busy_gateclk_en               (ld_dc_tlb_busy_gateclk_en              ),
  .ld_dc_vector_nop                        (ld_dc_vector_nop                       ),
  .ld_dc_vreg                              (ld_dc_vreg                             ),
  .ld_dc_vreg_sign_sel                     (ld_dc_vreg_sign_sel                    ),
  .ld_dc_wait_fence                        (ld_dc_wait_fence                       ),
  .lq_ld_dc_full                           (lq_ld_dc_full                          ),
  .lq_ld_dc_inst_hit                       (lq_ld_dc_inst_hit                      ),
  .lq_ld_dc_less2                          (lq_ld_dc_less2                         ),
  .lq_ld_dc_spec_fail                      (lq_ld_dc_spec_fail                     ),
  .lsu_dcache_ld_xx_gwen                   (lsu_dcache_ld_xx_gwen                  ),
  .lsu_has_fence                           (lsu_has_fence                          ),
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
  .lsu_mmu_vabuf0                          (lsu_mmu_vabuf0                         ),
  .mmu_lsu_data_req_size                   (mmu_lsu_data_req_size                  ),
  .mmu_lsu_mmu_en                          (mmu_lsu_mmu_en                         ),
  .mmu_lsu_tlb_busy                        (mmu_lsu_tlb_busy                       ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_pfb_empty                           (pfu_pfb_empty                          ),
  .pfu_sdb_create_gateclk_en               (pfu_sdb_create_gateclk_en              ),
  .pfu_sdb_empty                           (pfu_sdb_empty                          ),
  .rb_fence_ld                             (rb_fence_ld                            ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .sq_ld_dc_addr1_dep_discard              (sq_ld_dc_addr1_dep_discard             ),
  .sq_ld_dc_cancel_acc_req                 (sq_ld_dc_cancel_acc_req                ),
  .sq_ld_dc_cancel_ahead_wb                (sq_ld_dc_cancel_ahead_wb               ),
  .sq_ld_dc_fwd_req                        (sq_ld_dc_fwd_req                       ),
  .sq_ld_dc_has_fwd_req                    (sq_ld_dc_has_fwd_req                   ),
  .st_dc_addr0                             (st_dc_addr0                            ),
  .st_dc_bytes_vld                         (st_dc_bytes_vld                        ),
  .st_dc_chk_st_inst_vld                   (st_dc_chk_st_inst_vld                  ),
  .st_dc_chk_statomic_inst_vld             (st_dc_chk_statomic_inst_vld            ),
  .st_dc_inst_vld                          (st_dc_inst_vld                         ),
  .wmb_fwd_bytes_vld                       (wmb_fwd_bytes_vld                      ),
  .wmb_ld_dc_cancel_acc_req                (wmb_ld_dc_cancel_acc_req               ),
  .wmb_ld_dc_discard_req                   (wmb_ld_dc_discard_req                  ),
  .wmb_ld_dc_fwd_req                       (wmb_ld_dc_fwd_req                      )
);

// &Instance("ct_lsu_st_dc","x_ct_lsu_st_dc"); @97
ct_lsu_st_dc  x_ct_lsu_st_dc (
  .cp0_lsu_dcache_en                 (cp0_lsu_dcache_en                ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_lsu_l2_st_pref_en             (cp0_lsu_l2_st_pref_en            ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .ctrl_st_clk                       (ctrl_st_clk                      ),
  .dcache_arb_st_dc_borrow_icc       (dcache_arb_st_dc_borrow_icc      ),
  .dcache_arb_st_dc_borrow_snq       (dcache_arb_st_dc_borrow_snq      ),
  .dcache_arb_st_dc_borrow_snq_id    (dcache_arb_st_dc_borrow_snq_id   ),
  .dcache_arb_st_dc_borrow_vld       (dcache_arb_st_dc_borrow_vld      ),
  .dcache_arb_st_dc_borrow_vld_gate  (dcache_arb_st_dc_borrow_vld_gate ),
  .dcache_arb_st_dc_dcache_replace   (dcache_arb_st_dc_dcache_replace  ),
  .dcache_arb_st_dc_dcache_sw        (dcache_arb_st_dc_dcache_sw       ),
  .dcache_dirty_gwen                 (dcache_dirty_gwen                ),
  .dcache_idx                        (dcache_idx                       ),
  .dcache_lsu_st_dirty_dout          (dcache_lsu_st_dirty_dout         ),
  .dcache_lsu_st_tag_dout            (dcache_lsu_st_tag_dout           ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .had_yy_xx_bkpta_base              (had_yy_xx_bkpta_base             ),
  .had_yy_xx_bkpta_mask              (had_yy_xx_bkpta_mask             ),
  .had_yy_xx_bkpta_rc                (had_yy_xx_bkpta_rc               ),
  .had_yy_xx_bkptb_base              (had_yy_xx_bkptb_base             ),
  .had_yy_xx_bkptb_mask              (had_yy_xx_bkptb_mask             ),
  .had_yy_xx_bkptb_rc                (had_yy_xx_bkptb_rc               ),
  .lq_st_dc_spec_fail                (lq_st_dc_spec_fail               ),
  .lsu_idu_dc_sdiq_entry             (lsu_idu_dc_sdiq_entry            ),
  .lsu_idu_dc_staddr1_vld            (lsu_idu_dc_staddr1_vld           ),
  .lsu_idu_dc_staddr_unalign         (lsu_idu_dc_staddr_unalign        ),
  .lsu_idu_dc_staddr_vld             (lsu_idu_dc_staddr_vld            ),
  .lsu_mmu_vabuf1                    (lsu_mmu_vabuf1                   ),
  .mmu_lsu_mmu_en                    (mmu_lsu_mmu_en                   ),
  .mmu_lsu_tlb_busy                  (mmu_lsu_tlb_busy                 ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rtu_lsu_commit0_iid_updt_val      (rtu_lsu_commit0_iid_updt_val     ),
  .rtu_lsu_commit1_iid_updt_val      (rtu_lsu_commit1_iid_updt_val     ),
  .rtu_lsu_commit2_iid_updt_val      (rtu_lsu_commit2_iid_updt_val     ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sd_rf_ex1_sdid                    (sd_rf_ex1_sdid                   ),
  .sq_st_dc_full                     (sq_st_dc_full                    ),
  .sq_st_dc_inst_hit                 (sq_st_dc_inst_hit                ),
  .st_ag_already_da                  (st_ag_already_da                 ),
  .st_ag_atomic                      (st_ag_atomic                     ),
  .st_ag_boundary                    (st_ag_boundary                   ),
  .st_ag_dc_access_size              (st_ag_dc_access_size             ),
  .st_ag_dc_addr0                    (st_ag_dc_addr0                   ),
  .st_ag_dc_bytes_vld                (st_ag_dc_bytes_vld               ),
  .st_ag_dc_inst_vld                 (st_ag_dc_inst_vld                ),
  .st_ag_dc_mmu_req                  (st_ag_dc_mmu_req                 ),
  .st_ag_dc_page_share               (st_ag_dc_page_share              ),
  .st_ag_dc_rot_sel                  (st_ag_dc_rot_sel                 ),
  .st_ag_expt_access_fault_with_page (st_ag_expt_access_fault_with_page),
  .st_ag_expt_illegal_inst           (st_ag_expt_illegal_inst          ),
  .st_ag_expt_misalign_no_page       (st_ag_expt_misalign_no_page      ),
  .st_ag_expt_misalign_with_page     (st_ag_expt_misalign_with_page    ),
  .st_ag_expt_page_fault             (st_ag_expt_page_fault            ),
  .st_ag_expt_stamo_not_ca           (st_ag_expt_stamo_not_ca          ),
  .st_ag_expt_vld                    (st_ag_expt_vld                   ),
  .st_ag_fence_mode                  (st_ag_fence_mode                 ),
  .st_ag_icc                         (st_ag_icc                        ),
  .st_ag_iid                         (st_ag_iid                        ),
  .st_ag_inst_flush                  (st_ag_inst_flush                 ),
  .st_ag_inst_mode                   (st_ag_inst_mode                  ),
  .st_ag_inst_type                   (st_ag_inst_type                  ),
  .st_ag_inst_vld                    (st_ag_inst_vld                   ),
  .st_ag_lsfifo                      (st_ag_lsfifo                     ),
  .st_ag_lsid                        (st_ag_lsid                       ),
  .st_ag_lsiq_bkpta_data             (st_ag_lsiq_bkpta_data            ),
  .st_ag_lsiq_bkptb_data             (st_ag_lsiq_bkptb_data            ),
  .st_ag_lsiq_spec_fail              (st_ag_lsiq_spec_fail             ),
  .st_ag_mt_value                    (st_ag_mt_value                   ),
  .st_ag_no_spec                     (st_ag_no_spec                    ),
  .st_ag_old                         (st_ag_old                        ),
  .st_ag_page_buf                    (st_ag_page_buf                   ),
  .st_ag_page_ca                     (st_ag_page_ca                    ),
  .st_ag_page_sec                    (st_ag_page_sec                   ),
  .st_ag_page_so                     (st_ag_page_so                    ),
  .st_ag_page_wa                     (st_ag_page_wa                    ),
  .st_ag_pc                          (st_ag_pc                         ),
  .st_ag_sdid_oh                     (st_ag_sdid_oh                    ),
  .st_ag_secd                        (st_ag_secd                       ),
  .st_ag_split                       (st_ag_split                      ),
  .st_ag_st                          (st_ag_st                         ),
  .st_ag_staddr                      (st_ag_staddr                     ),
  .st_ag_sync_fence                  (st_ag_sync_fence                 ),
  .st_ag_utlb_miss                   (st_ag_utlb_miss                  ),
  .st_ag_vpn                         (st_ag_vpn                        ),
  .st_dc_addr0                       (st_dc_addr0                      ),
  .st_dc_already_da                  (st_dc_already_da                 ),
  .st_dc_atomic                      (st_dc_atomic                     ),
  .st_dc_bkpta_data                  (st_dc_bkpta_data                 ),
  .st_dc_bkptb_data                  (st_dc_bkptb_data                 ),
  .st_dc_borrow_dcache_replace       (st_dc_borrow_dcache_replace      ),
  .st_dc_borrow_dcache_sw            (st_dc_borrow_dcache_sw           ),
  .st_dc_borrow_icc                  (st_dc_borrow_icc                 ),
  .st_dc_borrow_snq                  (st_dc_borrow_snq                 ),
  .st_dc_borrow_snq_id               (st_dc_borrow_snq_id              ),
  .st_dc_borrow_vld                  (st_dc_borrow_vld                 ),
  .st_dc_boundary                    (st_dc_boundary                   ),
  .st_dc_boundary_first              (st_dc_boundary_first             ),
  .st_dc_bytes_vld                   (st_dc_bytes_vld                  ),
  .st_dc_chk_st_inst_vld             (st_dc_chk_st_inst_vld            ),
  .st_dc_chk_statomic_inst_vld       (st_dc_chk_statomic_inst_vld      ),
  .st_dc_cmit0_iid_crt_hit           (st_dc_cmit0_iid_crt_hit          ),
  .st_dc_cmit1_iid_crt_hit           (st_dc_cmit1_iid_crt_hit          ),
  .st_dc_cmit2_iid_crt_hit           (st_dc_cmit2_iid_crt_hit          ),
  .st_dc_da_dcache_dirty_array       (st_dc_da_dcache_dirty_array      ),
  .st_dc_da_dcache_tag_array         (st_dc_da_dcache_tag_array        ),
  .st_dc_da_expt_vld_gate_en         (st_dc_da_expt_vld_gate_en        ),
  .st_dc_da_inst_vld                 (st_dc_da_inst_vld                ),
  .st_dc_da_page_buf                 (st_dc_da_page_buf                ),
  .st_dc_da_page_ca                  (st_dc_da_page_ca                 ),
  .st_dc_da_page_sec                 (st_dc_da_page_sec                ),
  .st_dc_da_page_share               (st_dc_da_page_share              ),
  .st_dc_da_page_so                  (st_dc_da_page_so                 ),
  .st_dc_da_page_wa                  (st_dc_da_page_wa                 ),
  .st_dc_da_tag0_hit                 (st_dc_da_tag0_hit                ),
  .st_dc_da_tag1_hit                 (st_dc_da_tag1_hit                ),
  .st_dc_dcwp_hit_idx                (st_dc_dcwp_hit_idx               ),
  .st_dc_expt_access_fault_extra     (st_dc_expt_access_fault_extra    ),
  .st_dc_expt_access_fault_mask      (st_dc_expt_access_fault_mask     ),
  .st_dc_expt_vec                    (st_dc_expt_vec                   ),
  .st_dc_expt_vld_except_access_err  (st_dc_expt_vld_except_access_err ),
  .st_dc_fence_mode                  (st_dc_fence_mode                 ),
  .st_dc_get_dcache_tag_dirty        (st_dc_get_dcache_tag_dirty       ),
  .st_dc_icc                         (st_dc_icc                        ),
  .st_dc_idu_sq_full                 (st_dc_idu_sq_full                ),
  .st_dc_idu_tlb_busy                (st_dc_idu_tlb_busy               ),
  .st_dc_iid                         (st_dc_iid                        ),
  .st_dc_imme_wakeup                 (st_dc_imme_wakeup                ),
  .st_dc_inst_flush                  (st_dc_inst_flush                 ),
  .st_dc_inst_mode                   (st_dc_inst_mode                  ),
  .st_dc_inst_size                   (st_dc_inst_size                  ),
  .st_dc_inst_type                   (st_dc_inst_type                  ),
  .st_dc_inst_vld                    (st_dc_inst_vld                   ),
  .st_dc_lsid                        (st_dc_lsid                       ),
  .st_dc_mmu_req                     (st_dc_mmu_req                    ),
  .st_dc_mt_value                    (st_dc_mt_value                   ),
  .st_dc_no_spec                     (st_dc_no_spec                    ),
  .st_dc_old                         (st_dc_old                        ),
  .st_dc_pc                          (st_dc_pc                         ),
  .st_dc_pf_inst                     (st_dc_pf_inst                    ),
  .st_dc_pfu_va                      (st_dc_pfu_va                     ),
  .st_dc_rot_sel_rev                 (st_dc_rot_sel_rev                ),
  .st_dc_sdid                        (st_dc_sdid                       ),
  .st_dc_sdid_hit                    (st_dc_sdid_hit                   ),
  .st_dc_secd                        (st_dc_secd                       ),
  .st_dc_spec_fail                   (st_dc_spec_fail                  ),
  .st_dc_split                       (st_dc_split                      ),
  .st_dc_sq_create_dp_vld            (st_dc_sq_create_dp_vld           ),
  .st_dc_sq_create_gateclk_en        (st_dc_sq_create_gateclk_en       ),
  .st_dc_sq_create_vld               (st_dc_sq_create_vld              ),
  .st_dc_sq_data_vld                 (st_dc_sq_data_vld                ),
  .st_dc_sq_full_gateclk_en          (st_dc_sq_full_gateclk_en         ),
  .st_dc_st                          (st_dc_st                         ),
  .st_dc_sync_fence                  (st_dc_sync_fence                 ),
  .st_dc_tlb_busy_gateclk_en         (st_dc_tlb_busy_gateclk_en        ),
  .st_dc_vector_nop                  (st_dc_vector_nop                 ),
  .st_dc_wo_st_inst                  (st_dc_wo_st_inst                 )
);


// &Instance("ct_lsu_lq","x_ct_lsu_lq"); @99
ct_lsu_lq  x_ct_lsu_lq (
  .cp0_lsu_corr_dis            (cp0_lsu_corr_dis           ),
  .cp0_lsu_icg_en              (cp0_lsu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ld_dc_addr0                 (ld_dc_addr0                ),
  .ld_dc_addr1                 (ld_dc_addr1                ),
  .ld_dc_bytes_vld             (ld_dc_bytes_vld            ),
  .ld_dc_bytes_vld1            (ld_dc_bytes_vld1           ),
  .ld_dc_chk_ld_addr1_vld      (ld_dc_chk_ld_addr1_vld     ),
  .ld_dc_iid                   (ld_dc_iid                  ),
  .ld_dc_inst_chk_vld          (ld_dc_inst_chk_vld         ),
  .ld_dc_lq_create1_dp_vld     (ld_dc_lq_create1_dp_vld    ),
  .ld_dc_lq_create1_gateclk_en (ld_dc_lq_create1_gateclk_en),
  .ld_dc_lq_create1_vld        (ld_dc_lq_create1_vld       ),
  .ld_dc_lq_create_dp_vld      (ld_dc_lq_create_dp_vld     ),
  .ld_dc_lq_create_gateclk_en  (ld_dc_lq_create_gateclk_en ),
  .ld_dc_lq_create_vld         (ld_dc_lq_create_vld        ),
  .ld_dc_secd                  (ld_dc_secd                 ),
  .lq_ld_dc_full               (lq_ld_dc_full              ),
  .lq_ld_dc_inst_hit           (lq_ld_dc_inst_hit          ),
  .lq_ld_dc_less2              (lq_ld_dc_less2             ),
  .lq_ld_dc_spec_fail          (lq_ld_dc_spec_fail         ),
  .lq_st_dc_spec_fail          (lq_st_dc_spec_fail         ),
  .lsu_idu_lq_not_full         (lsu_idu_lq_not_full        ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_yy_xx_commit0           (rtu_yy_xx_commit0          ),
  .rtu_yy_xx_commit0_iid       (rtu_yy_xx_commit0_iid      ),
  .rtu_yy_xx_commit1           (rtu_yy_xx_commit1          ),
  .rtu_yy_xx_commit1_iid       (rtu_yy_xx_commit1_iid      ),
  .rtu_yy_xx_commit2           (rtu_yy_xx_commit2          ),
  .rtu_yy_xx_commit2_iid       (rtu_yy_xx_commit2_iid      ),
  .rtu_yy_xx_flush             (rtu_yy_xx_flush            ),
  .st_dc_addr0                 (st_dc_addr0                ),
  .st_dc_bytes_vld             (st_dc_bytes_vld            ),
  .st_dc_chk_st_inst_vld       (st_dc_chk_st_inst_vld      ),
  .st_dc_chk_statomic_inst_vld (st_dc_chk_statomic_inst_vld),
  .st_dc_iid                   (st_dc_iid                  )
);

// &Instance("ct_lsu_sq","x_ct_lsu_sq"); @100
ct_lsu_sq  x_ct_lsu_sq (
  .cp0_lsu_icg_en                   (cp0_lsu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cp0_yy_priv_mode                 (cp0_yy_priv_mode                ),
  .cpurst_b                         (cpurst_b                        ),
  .dcache_dirty_din                 (dcache_dirty_din                ),
  .dcache_dirty_gwen                (dcache_dirty_gwen               ),
  .dcache_dirty_wen                 (dcache_dirty_wen                ),
  .dcache_idx                       (dcache_idx                      ),
  .dcache_tag_din                   (dcache_tag_din                  ),
  .dcache_tag_gwen                  (dcache_tag_gwen                 ),
  .dcache_tag_wen                   (dcache_tag_wen                  ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .had_lsu_bus_trace_en             (had_lsu_bus_trace_en            ),
  .had_lsu_dbg_en                   (had_lsu_dbg_en                  ),
  .icc_idle                         (icc_idle                        ),
  .icc_sq_grnt                      (icc_sq_grnt                     ),
  .ld_da_lsid                       (ld_da_lsid                      ),
  .ld_da_sq_data_discard_vld        (ld_da_sq_data_discard_vld       ),
  .ld_da_sq_fwd_id                  (ld_da_sq_fwd_id                 ),
  .ld_da_sq_fwd_multi_vld           (ld_da_sq_fwd_multi_vld          ),
  .ld_da_sq_global_discard_vld      (ld_da_sq_global_discard_vld     ),
  .ld_dc_addr0                      (ld_dc_addr0                     ),
  .ld_dc_addr1_11to4                (ld_dc_addr1_11to4               ),
  .ld_dc_bytes_vld                  (ld_dc_bytes_vld                 ),
  .ld_dc_bytes_vld1                 (ld_dc_bytes_vld1                ),
  .ld_dc_chk_atomic_inst_vld        (ld_dc_chk_atomic_inst_vld       ),
  .ld_dc_chk_ld_addr1_vld           (ld_dc_chk_ld_addr1_vld          ),
  .ld_dc_chk_ld_bypass_vld          (ld_dc_chk_ld_bypass_vld         ),
  .ld_dc_chk_ld_inst_vld            (ld_dc_chk_ld_inst_vld           ),
  .ld_dc_iid                        (ld_dc_iid                       ),
  .lsu_had_sq_not_empty             (lsu_had_sq_not_empty            ),
  .lsu_had_st_addr                  (lsu_had_st_addr                 ),
  .lsu_had_st_data                  (lsu_had_st_data                 ),
  .lsu_had_st_iid                   (lsu_had_st_iid                  ),
  .lsu_had_st_req                   (lsu_had_st_req                  ),
  .lsu_had_st_type                  (lsu_had_st_type                 ),
  .lsu_idu_sq_not_full              (lsu_idu_sq_not_full             ),
  .lsu_rtu_all_commit_data_vld      (lsu_rtu_all_commit_data_vld     ),
  .lsu_rtu_all_commit_ld_data_vld   (lsu_rtu_all_commit_ld_data_vld  ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .rb_sq_pop_hit_idx                (rb_sq_pop_hit_idx               ),
  .rtu_lsu_async_flush              (rtu_lsu_async_flush             ),
  .rtu_lsu_commit0_iid_updt_val     (rtu_lsu_commit0_iid_updt_val    ),
  .rtu_lsu_commit1_iid_updt_val     (rtu_lsu_commit1_iid_updt_val    ),
  .rtu_lsu_commit2_iid_updt_val     (rtu_lsu_commit2_iid_updt_val    ),
  .rtu_yy_xx_commit0                (rtu_yy_xx_commit0               ),
  .rtu_yy_xx_commit1                (rtu_yy_xx_commit1               ),
  .rtu_yy_xx_commit2                (rtu_yy_xx_commit2               ),
  .rtu_yy_xx_flush                  (rtu_yy_xx_flush                 ),
  .sd_ex1_data                      (sd_ex1_data                     ),
  .sd_ex1_inst_vld                  (sd_ex1_inst_vld                 ),
  .sd_rf_ex1_sdid                   (sd_rf_ex1_sdid                  ),
  .sd_rf_inst_vld_short             (sd_rf_inst_vld_short            ),
  .sq_data_depd_wakeup              (sq_data_depd_wakeup             ),
  .sq_empty                         (sq_empty                        ),
  .sq_global_depd_wakeup            (sq_global_depd_wakeup           ),
  .sq_icc_clr                       (sq_icc_clr                      ),
  .sq_icc_inv                       (sq_icc_inv                      ),
  .sq_icc_req                       (sq_icc_req                      ),
  .sq_ld_da_fwd_data                (sq_ld_da_fwd_data               ),
  .sq_ld_da_fwd_data_pe             (sq_ld_da_fwd_data_pe            ),
  .sq_ld_dc_addr1_dep_discard       (sq_ld_dc_addr1_dep_discard      ),
  .sq_ld_dc_cancel_acc_req          (sq_ld_dc_cancel_acc_req         ),
  .sq_ld_dc_cancel_ahead_wb         (sq_ld_dc_cancel_ahead_wb        ),
  .sq_ld_dc_data_discard_req        (sq_ld_dc_data_discard_req       ),
  .sq_ld_dc_fwd_bypass_multi        (sq_ld_dc_fwd_bypass_multi       ),
  .sq_ld_dc_fwd_bypass_req          (sq_ld_dc_fwd_bypass_req         ),
  .sq_ld_dc_fwd_id                  (sq_ld_dc_fwd_id                 ),
  .sq_ld_dc_fwd_multi               (sq_ld_dc_fwd_multi              ),
  .sq_ld_dc_fwd_multi_mask          (sq_ld_dc_fwd_multi_mask         ),
  .sq_ld_dc_fwd_req                 (sq_ld_dc_fwd_req                ),
  .sq_ld_dc_has_fwd_req             (sq_ld_dc_has_fwd_req            ),
  .sq_ld_dc_newest_fwd_data_vld_req (sq_ld_dc_newest_fwd_data_vld_req),
  .sq_ld_dc_other_discard_req       (sq_ld_dc_other_discard_req      ),
  .sq_pfu_pop_synci_inst            (sq_pfu_pop_synci_inst           ),
  .sq_pop_addr                      (sq_pop_addr                     ),
  .sq_pop_atomic                    (sq_pop_atomic                   ),
  .sq_pop_bytes_vld                 (sq_pop_bytes_vld                ),
  .sq_pop_icc                       (sq_pop_icc                      ),
  .sq_pop_inst_flush                (sq_pop_inst_flush               ),
  .sq_pop_inst_mode                 (sq_pop_inst_mode                ),
  .sq_pop_inst_size                 (sq_pop_inst_size                ),
  .sq_pop_inst_type                 (sq_pop_inst_type                ),
  .sq_pop_page_buf                  (sq_pop_page_buf                 ),
  .sq_pop_page_ca                   (sq_pop_page_ca                  ),
  .sq_pop_page_sec                  (sq_pop_page_sec                 ),
  .sq_pop_page_share                (sq_pop_page_share               ),
  .sq_pop_page_so                   (sq_pop_page_so                  ),
  .sq_pop_page_wa                   (sq_pop_page_wa                  ),
  .sq_pop_priv_mode                 (sq_pop_priv_mode                ),
  .sq_pop_ptr                       (sq_pop_ptr                      ),
  .sq_pop_sync_fence                (sq_pop_sync_fence               ),
  .sq_pop_wo_st                     (sq_pop_wo_st                    ),
  .sq_st_dc_full                    (sq_st_dc_full                   ),
  .sq_st_dc_inst_hit                (sq_st_dc_inst_hit               ),
  .sq_wmb_merge_req                 (sq_wmb_merge_req                ),
  .sq_wmb_merge_stall_req           (sq_wmb_merge_stall_req          ),
  .sq_wmb_pop_to_ce_dp_req          (sq_wmb_pop_to_ce_dp_req         ),
  .sq_wmb_pop_to_ce_gateclk_en      (sq_wmb_pop_to_ce_gateclk_en     ),
  .sq_wmb_pop_to_ce_req             (sq_wmb_pop_to_ce_req            ),
  .st_da_bkpta_data                 (st_da_bkpta_data                ),
  .st_da_bkptb_data                 (st_da_bkptb_data                ),
  .st_da_iid                        (st_da_iid                       ),
  .st_da_inst_vld                   (st_da_inst_vld                  ),
  .st_da_secd                       (st_da_secd                      ),
  .st_da_sq_dcache_dirty            (st_da_sq_dcache_dirty           ),
  .st_da_sq_dcache_share            (st_da_sq_dcache_share           ),
  .st_da_sq_dcache_valid            (st_da_sq_dcache_valid           ),
  .st_da_sq_dcache_way              (st_da_sq_dcache_way             ),
  .st_da_sq_ecc_stall               (st_da_sq_ecc_stall              ),
  .st_da_sq_no_restart              (st_da_sq_no_restart             ),
  .st_da_wb_expt_vld                (st_da_wb_expt_vld               ),
  .st_da_wb_spec_fail               (st_da_wb_spec_fail              ),
  .st_da_wb_vstart_vld              (st_da_wb_vstart_vld             ),
  .st_dc_addr0                      (st_dc_addr0                     ),
  .st_dc_atomic                     (st_dc_atomic                    ),
  .st_dc_boundary                   (st_dc_boundary                  ),
  .st_dc_boundary_first             (st_dc_boundary_first            ),
  .st_dc_bytes_vld                  (st_dc_bytes_vld                 ),
  .st_dc_cmit0_iid_crt_hit          (st_dc_cmit0_iid_crt_hit         ),
  .st_dc_cmit1_iid_crt_hit          (st_dc_cmit1_iid_crt_hit         ),
  .st_dc_cmit2_iid_crt_hit          (st_dc_cmit2_iid_crt_hit         ),
  .st_dc_da_page_buf                (st_dc_da_page_buf               ),
  .st_dc_da_page_ca                 (st_dc_da_page_ca                ),
  .st_dc_da_page_sec                (st_dc_da_page_sec               ),
  .st_dc_da_page_share              (st_dc_da_page_share             ),
  .st_dc_da_page_so                 (st_dc_da_page_so                ),
  .st_dc_da_page_wa                 (st_dc_da_page_wa                ),
  .st_dc_fence_mode                 (st_dc_fence_mode                ),
  .st_dc_icc                        (st_dc_icc                       ),
  .st_dc_iid                        (st_dc_iid                       ),
  .st_dc_inst_flush                 (st_dc_inst_flush                ),
  .st_dc_inst_mode                  (st_dc_inst_mode                 ),
  .st_dc_inst_size                  (st_dc_inst_size                 ),
  .st_dc_inst_type                  (st_dc_inst_type                 ),
  .st_dc_old                        (st_dc_old                       ),
  .st_dc_rot_sel_rev                (st_dc_rot_sel_rev               ),
  .st_dc_sdid                       (st_dc_sdid                      ),
  .st_dc_sdid_hit                   (st_dc_sdid_hit                  ),
  .st_dc_secd                       (st_dc_secd                      ),
  .st_dc_sq_create_dp_vld           (st_dc_sq_create_dp_vld          ),
  .st_dc_sq_create_gateclk_en       (st_dc_sq_create_gateclk_en      ),
  .st_dc_sq_create_vld              (st_dc_sq_create_vld             ),
  .st_dc_sq_data_vld                (st_dc_sq_data_vld               ),
  .st_dc_sync_fence                 (st_dc_sync_fence                ),
  .st_dc_wo_st_inst                 (st_dc_wo_st_inst                ),
  .wmb_ce_addr                      (wmb_ce_addr                     ),
  .wmb_ce_bkpta_data                (wmb_ce_bkpta_data               ),
  .wmb_ce_bkptb_data                (wmb_ce_bkptb_data               ),
  .wmb_ce_create_hit_rb_idx         (wmb_ce_create_hit_rb_idx        ),
  .wmb_ce_data128                   (wmb_ce_data128                  ),
  .wmb_ce_dcache_share              (wmb_ce_dcache_share             ),
  .wmb_ce_dcache_sw_inst            (wmb_ce_dcache_sw_inst           ),
  .wmb_ce_dcache_valid              (wmb_ce_dcache_valid             ),
  .wmb_ce_fence_mode                (wmb_ce_fence_mode               ),
  .wmb_ce_iid                       (wmb_ce_iid                      ),
  .wmb_ce_spec_fail                 (wmb_ce_spec_fail                ),
  .wmb_ce_sq_ptr                    (wmb_ce_sq_ptr                   ),
  .wmb_ce_update_dcache_dirty       (wmb_ce_update_dcache_dirty      ),
  .wmb_ce_update_dcache_share       (wmb_ce_update_dcache_share      ),
  .wmb_ce_update_dcache_valid       (wmb_ce_update_dcache_valid      ),
  .wmb_ce_update_dcache_way         (wmb_ce_update_dcache_way        ),
  .wmb_ce_vld                       (wmb_ce_vld                      ),
  .wmb_ce_vstart_vld                (wmb_ce_vstart_vld               ),
  .wmb_sq_pop_grnt                  (wmb_sq_pop_grnt                 ),
  .wmb_sq_pop_to_ce_grnt            (wmb_sq_pop_to_ce_grnt           )
);

//==========================================================
//                       DA Stage
//==========================================================
// &Instance("ct_lsu_ld_da","x_ct_lsu_ld_da"); @104
ct_lsu_ld_da  x_ct_lsu_ld_da (
  .cb_ld_da_data                        (cb_ld_da_data                       ),
  .cb_ld_da_data_vld                    (cb_ld_da_data_vld                   ),
  .cp0_lsu_dcache_en                    (cp0_lsu_dcache_en                   ),
  .cp0_lsu_icg_en                       (cp0_lsu_icg_en                      ),
  .cp0_lsu_l2_pref_en                   (cp0_lsu_l2_pref_en                  ),
  .cp0_lsu_nsfe                         (cp0_lsu_nsfe                        ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cp0_yy_dcache_pref_en                (cp0_yy_dcache_pref_en               ),
  .cpurst_b                             (cpurst_b                            ),
  .ctrl_ld_clk                          (ctrl_ld_clk                         ),
  .dcache_lsu_ld_data_bank0_dout        (dcache_lsu_ld_data_bank0_dout       ),
  .dcache_lsu_ld_data_bank1_dout        (dcache_lsu_ld_data_bank1_dout       ),
  .dcache_lsu_ld_data_bank2_dout        (dcache_lsu_ld_data_bank2_dout       ),
  .dcache_lsu_ld_data_bank3_dout        (dcache_lsu_ld_data_bank3_dout       ),
  .dcache_lsu_ld_data_bank4_dout        (dcache_lsu_ld_data_bank4_dout       ),
  .dcache_lsu_ld_data_bank5_dout        (dcache_lsu_ld_data_bank5_dout       ),
  .dcache_lsu_ld_data_bank6_dout        (dcache_lsu_ld_data_bank6_dout       ),
  .dcache_lsu_ld_data_bank7_dout        (dcache_lsu_ld_data_bank7_dout       ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .ld_da_addr                           (ld_da_addr                          ),
  .ld_da_bkpta_data                     (ld_da_bkpta_data                    ),
  .ld_da_bkptb_data                     (ld_da_bkptb_data                    ),
  .ld_da_borrow_vld                     (ld_da_borrow_vld                    ),
  .ld_da_boundary_after_mask            (ld_da_boundary_after_mask           ),
  .ld_da_bytes_vld                      (ld_da_bytes_vld                     ),
  .ld_da_cb_data                        (ld_da_cb_data                       ),
  .ld_da_cb_data_vld                    (ld_da_cb_data_vld                   ),
  .ld_da_cb_ecc_cancel                  (ld_da_cb_ecc_cancel                 ),
  .ld_da_cb_ld_inst_vld                 (ld_da_cb_ld_inst_vld                ),
  .ld_da_data256                        (ld_da_data256                       ),
  .ld_da_data_ori                       (ld_da_data_ori                      ),
  .ld_da_data_rot_sel                   (ld_da_data_rot_sel                  ),
  .ld_da_dcache_hit                     (ld_da_dcache_hit                    ),
  .ld_da_ecc_wakeup                     (ld_da_ecc_wakeup                    ),
  .ld_da_fwd_ecc_stall                  (ld_da_fwd_ecc_stall                 ),
  .ld_da_icc_read_data                  (ld_da_icc_read_data                 ),
  .ld_da_idu_already_da                 (ld_da_idu_already_da                ),
  .ld_da_idu_bkpta_data                 (ld_da_idu_bkpta_data                ),
  .ld_da_idu_bkptb_data                 (ld_da_idu_bkptb_data                ),
  .ld_da_idu_boundary_gateclk_en        (ld_da_idu_boundary_gateclk_en       ),
  .ld_da_idu_pop_entry                  (ld_da_idu_pop_entry                 ),
  .ld_da_idu_pop_vld                    (ld_da_idu_pop_vld                   ),
  .ld_da_idu_rb_full                    (ld_da_idu_rb_full                   ),
  .ld_da_idu_secd                       (ld_da_idu_secd                      ),
  .ld_da_idu_spec_fail                  (ld_da_idu_spec_fail                 ),
  .ld_da_idu_wait_fence                 (ld_da_idu_wait_fence                ),
  .ld_da_idx                            (ld_da_idx                           ),
  .ld_da_iid                            (ld_da_iid                           ),
  .ld_da_inst_size                      (ld_da_inst_size                     ),
  .ld_da_inst_vfls                      (ld_da_inst_vfls                     ),
  .ld_da_inst_vld                       (ld_da_inst_vld                      ),
  .ld_da_ldfifo_pc                      (ld_da_ldfifo_pc                     ),
  .ld_da_lfb_discard_grnt               (ld_da_lfb_discard_grnt              ),
  .ld_da_lfb_set_wakeup_queue           (ld_da_lfb_set_wakeup_queue          ),
  .ld_da_lfb_wakeup_queue_next          (ld_da_lfb_wakeup_queue_next         ),
  .ld_da_lm_discard_grnt                (ld_da_lm_discard_grnt               ),
  .ld_da_lm_ecc_err                     (ld_da_lm_ecc_err                    ),
  .ld_da_lm_no_req                      (ld_da_lm_no_req                     ),
  .ld_da_lm_vector_nop                  (ld_da_lm_vector_nop                 ),
  .ld_da_lsid                           (ld_da_lsid                          ),
  .ld_da_mcic_borrow_mmu                (ld_da_mcic_borrow_mmu               ),
  .ld_da_mcic_borrow_mmu_req            (ld_da_mcic_borrow_mmu_req           ),
  .ld_da_mcic_bypass_data               (ld_da_mcic_bypass_data              ),
  .ld_da_mcic_data_err                  (ld_da_mcic_data_err                 ),
  .ld_da_mcic_rb_full                   (ld_da_mcic_rb_full                  ),
  .ld_da_mcic_wakeup                    (ld_da_mcic_wakeup                   ),
  .ld_da_old                            (ld_da_old                           ),
  .ld_da_page_buf                       (ld_da_page_buf                      ),
  .ld_da_page_ca                        (ld_da_page_ca                       ),
  .ld_da_page_sec                       (ld_da_page_sec                      ),
  .ld_da_page_sec_ff                    (ld_da_page_sec_ff                   ),
  .ld_da_page_share                     (ld_da_page_share                    ),
  .ld_da_page_share_ff                  (ld_da_page_share_ff                 ),
  .ld_da_page_so                        (ld_da_page_so                       ),
  .ld_da_pfu_act_dp_vld                 (ld_da_pfu_act_dp_vld                ),
  .ld_da_pfu_act_vld                    (ld_da_pfu_act_vld                   ),
  .ld_da_pfu_biu_req_hit_idx            (ld_da_pfu_biu_req_hit_idx           ),
  .ld_da_pfu_evict_cnt_vld              (ld_da_pfu_evict_cnt_vld             ),
  .ld_da_pfu_pf_inst_vld                (ld_da_pfu_pf_inst_vld               ),
  .ld_da_pfu_va                         (ld_da_pfu_va                        ),
  .ld_da_ppfu_va                        (ld_da_ppfu_va                       ),
  .ld_da_ppn_ff                         (ld_da_ppn_ff                        ),
  .ld_da_preg                           (ld_da_preg                          ),
  .ld_da_preg_sign_sel                  (ld_da_preg_sign_sel                 ),
  .ld_da_rb_atomic                      (ld_da_rb_atomic                     ),
  .ld_da_rb_cmit                        (ld_da_rb_cmit                       ),
  .ld_da_rb_cmplt_success               (ld_da_rb_cmplt_success              ),
  .ld_da_rb_create_dp_vld               (ld_da_rb_create_dp_vld              ),
  .ld_da_rb_create_gateclk_en           (ld_da_rb_create_gateclk_en          ),
  .ld_da_rb_create_judge_vld            (ld_da_rb_create_judge_vld           ),
  .ld_da_rb_create_lfb                  (ld_da_rb_create_lfb                 ),
  .ld_da_rb_create_vld                  (ld_da_rb_create_vld                 ),
  .ld_da_rb_data_vld                    (ld_da_rb_data_vld                   ),
  .ld_da_rb_dest_vld                    (ld_da_rb_dest_vld                   ),
  .ld_da_rb_discard_grnt                (ld_da_rb_discard_grnt               ),
  .ld_da_rb_full_gateclk_en             (ld_da_rb_full_gateclk_en            ),
  .ld_da_rb_ldamo                       (ld_da_rb_ldamo                      ),
  .ld_da_rb_merge_dp_vld                (ld_da_rb_merge_dp_vld               ),
  .ld_da_rb_merge_expt_vld              (ld_da_rb_merge_expt_vld             ),
  .ld_da_rb_merge_gateclk_en            (ld_da_rb_merge_gateclk_en           ),
  .ld_da_rb_merge_vld                   (ld_da_rb_merge_vld                  ),
  .ld_da_sf_addr_tto4                   (ld_da_sf_addr_tto4                  ),
  .ld_da_sf_bytes_vld                   (ld_da_sf_bytes_vld                  ),
  .ld_da_sf_spec_chk_req                (ld_da_sf_spec_chk_req               ),
  .ld_da_sign_extend                    (ld_da_sign_extend                   ),
  .ld_da_snq_borrow_icc                 (ld_da_snq_borrow_icc                ),
  .ld_da_snq_borrow_sndb                (ld_da_snq_borrow_sndb               ),
  .ld_da_special_gateclk_en             (ld_da_special_gateclk_en            ),
  .ld_da_sq_data_discard_vld            (ld_da_sq_data_discard_vld           ),
  .ld_da_sq_fwd_id                      (ld_da_sq_fwd_id                     ),
  .ld_da_sq_fwd_multi_vld               (ld_da_sq_fwd_multi_vld              ),
  .ld_da_sq_global_discard_vld          (ld_da_sq_global_discard_vld         ),
  .ld_da_st_da_hit_idx                  (ld_da_st_da_hit_idx                 ),
  .ld_da_vb_borrow_vb                   (ld_da_vb_borrow_vb                  ),
  .ld_da_vb_snq_data_reissue            (ld_da_vb_snq_data_reissue           ),
  .ld_da_vreg                           (ld_da_vreg                          ),
  .ld_da_vreg_sign_sel                  (ld_da_vreg_sign_sel                 ),
  .ld_da_wait_fence_gateclk_en          (ld_da_wait_fence_gateclk_en         ),
  .ld_da_wb_cmplt_req                   (ld_da_wb_cmplt_req                  ),
  .ld_da_wb_data                        (ld_da_wb_data                       ),
  .ld_da_wb_data_req                    (ld_da_wb_data_req                   ),
  .ld_da_wb_data_req_gateclk_en         (ld_da_wb_data_req_gateclk_en        ),
  .ld_da_wb_expt_vec                    (ld_da_wb_expt_vec                   ),
  .ld_da_wb_expt_vld                    (ld_da_wb_expt_vld                   ),
  .ld_da_wb_mt_value                    (ld_da_wb_mt_value                   ),
  .ld_da_wb_no_spec_hit                 (ld_da_wb_no_spec_hit                ),
  .ld_da_wb_no_spec_mispred             (ld_da_wb_no_spec_mispred            ),
  .ld_da_wb_no_spec_miss                (ld_da_wb_no_spec_miss               ),
  .ld_da_wb_spec_fail                   (ld_da_wb_spec_fail                  ),
  .ld_da_wb_vreg_sign_sel               (ld_da_wb_vreg_sign_sel              ),
  .ld_da_wmb_discard_vld                (ld_da_wmb_discard_vld               ),
  .ld_dc_addr0                          (ld_dc_addr0                         ),
  .ld_dc_ahead_predict                  (ld_dc_ahead_predict                 ),
  .ld_dc_ahead_preg_wb_vld              (ld_dc_ahead_preg_wb_vld             ),
  .ld_dc_ahead_vreg_wb_vld              (ld_dc_ahead_vreg_wb_vld             ),
  .ld_dc_already_da                     (ld_dc_already_da                    ),
  .ld_dc_atomic                         (ld_dc_atomic                        ),
  .ld_dc_bkpta_data                     (ld_dc_bkpta_data                    ),
  .ld_dc_bkptb_data                     (ld_dc_bkptb_data                    ),
  .ld_dc_borrow_db                      (ld_dc_borrow_db                     ),
  .ld_dc_borrow_icc                     (ld_dc_borrow_icc                    ),
  .ld_dc_borrow_icc_tag                 (ld_dc_borrow_icc_tag                ),
  .ld_dc_borrow_mmu                     (ld_dc_borrow_mmu                    ),
  .ld_dc_borrow_sndb                    (ld_dc_borrow_sndb                   ),
  .ld_dc_borrow_vb                      (ld_dc_borrow_vb                     ),
  .ld_dc_borrow_vld                     (ld_dc_borrow_vld                    ),
  .ld_dc_boundary                       (ld_dc_boundary                      ),
  .ld_dc_da_bytes_vld                   (ld_dc_da_bytes_vld                  ),
  .ld_dc_da_bytes_vld1                  (ld_dc_da_bytes_vld1                 ),
  .ld_dc_da_cb_addr_create              (ld_dc_da_cb_addr_create             ),
  .ld_dc_da_cb_merge_en                 (ld_dc_da_cb_merge_en                ),
  .ld_dc_da_data_rot_sel                (ld_dc_da_data_rot_sel               ),
  .ld_dc_da_expt_vld_gate_en            (ld_dc_da_expt_vld_gate_en           ),
  .ld_dc_da_icc_tag_vld                 (ld_dc_da_icc_tag_vld                ),
  .ld_dc_da_inst_vld                    (ld_dc_da_inst_vld                   ),
  .ld_dc_da_old                         (ld_dc_da_old                        ),
  .ld_dc_da_page_buf                    (ld_dc_da_page_buf                   ),
  .ld_dc_da_page_ca                     (ld_dc_da_page_ca                    ),
  .ld_dc_da_page_sec                    (ld_dc_da_page_sec                   ),
  .ld_dc_da_page_share                  (ld_dc_da_page_share                 ),
  .ld_dc_da_page_so                     (ld_dc_da_page_so                    ),
  .ld_dc_da_pf_inst                     (ld_dc_da_pf_inst                    ),
  .ld_dc_da_tag_read                    (ld_dc_da_tag_read                   ),
  .ld_dc_dcache_hit                     (ld_dc_dcache_hit                    ),
  .ld_dc_expt_access_fault_extra        (ld_dc_expt_access_fault_extra       ),
  .ld_dc_expt_access_fault_mask         (ld_dc_expt_access_fault_mask        ),
  .ld_dc_expt_vec                       (ld_dc_expt_vec                      ),
  .ld_dc_expt_vld_except_access_err     (ld_dc_expt_vld_except_access_err    ),
  .ld_dc_fwd_bytes_vld                  (ld_dc_fwd_bytes_vld                 ),
  .ld_dc_fwd_sq_vld                     (ld_dc_fwd_sq_vld                    ),
  .ld_dc_fwd_wmb_vld                    (ld_dc_fwd_wmb_vld                   ),
  .ld_dc_get_dcache_data                (ld_dc_get_dcache_data               ),
  .ld_dc_hit_high_region                (ld_dc_hit_high_region               ),
  .ld_dc_hit_low_region                 (ld_dc_hit_low_region                ),
  .ld_dc_iid                            (ld_dc_iid                           ),
  .ld_dc_inst_size                      (ld_dc_inst_size                     ),
  .ld_dc_inst_type                      (ld_dc_inst_type                     ),
  .ld_dc_inst_vfls                      (ld_dc_inst_vfls                     ),
  .ld_dc_inst_vld                       (ld_dc_inst_vld                      ),
  .ld_dc_ldfifo_pc                      (ld_dc_ldfifo_pc                     ),
  .ld_dc_lsid                           (ld_dc_lsid                          ),
  .ld_dc_mmu_req                        (ld_dc_mmu_req                       ),
  .ld_dc_mt_value                       (ld_dc_mt_value                      ),
  .ld_dc_no_spec                        (ld_dc_no_spec                       ),
  .ld_dc_no_spec_exist                  (ld_dc_no_spec_exist                 ),
  .ld_dc_pfu_info_set_vld               (ld_dc_pfu_info_set_vld              ),
  .ld_dc_pfu_va                         (ld_dc_pfu_va                        ),
  .ld_dc_preg                           (ld_dc_preg                          ),
  .ld_dc_preg_sign_sel                  (ld_dc_preg_sign_sel                 ),
  .ld_dc_secd                           (ld_dc_secd                          ),
  .ld_dc_settle_way                     (ld_dc_settle_way                    ),
  .ld_dc_sign_extend                    (ld_dc_sign_extend                   ),
  .ld_dc_spec_fail                      (ld_dc_spec_fail                     ),
  .ld_dc_split                          (ld_dc_split                         ),
  .ld_dc_vector_nop                     (ld_dc_vector_nop                    ),
  .ld_dc_vreg                           (ld_dc_vreg                          ),
  .ld_dc_vreg_sign_sel                  (ld_dc_vreg_sign_sel                 ),
  .ld_dc_wait_fence                     (ld_dc_wait_fence                    ),
  .ld_hit_prefetch                      (ld_hit_prefetch                     ),
  .lfb_ld_da_hit_idx                    (lfb_ld_da_hit_idx                   ),
  .lm_ld_da_hit_idx                     (lm_ld_da_hit_idx                    ),
  .lsu_hpcp_ld_cache_access             (lsu_hpcp_ld_cache_access            ),
  .lsu_hpcp_ld_cache_miss               (lsu_hpcp_ld_cache_miss              ),
  .lsu_hpcp_ld_data_discard             (lsu_hpcp_ld_data_discard            ),
  .lsu_hpcp_ld_discard_sq               (lsu_hpcp_ld_discard_sq              ),
  .lsu_hpcp_ld_unalign_inst             (lsu_hpcp_ld_unalign_inst            ),
  .lsu_idu_da_pipe3_fwd_preg            (lsu_idu_da_pipe3_fwd_preg           ),
  .lsu_idu_da_pipe3_fwd_preg_data       (lsu_idu_da_pipe3_fwd_preg_data      ),
  .lsu_idu_da_pipe3_fwd_preg_vld        (lsu_idu_da_pipe3_fwd_preg_vld       ),
  .lsu_idu_da_pipe3_fwd_vreg            (lsu_idu_da_pipe3_fwd_vreg           ),
  .lsu_idu_da_pipe3_fwd_vreg_fr_data    (lsu_idu_da_pipe3_fwd_vreg_fr_data   ),
  .lsu_idu_da_pipe3_fwd_vreg_vld        (lsu_idu_da_pipe3_fwd_vreg_vld       ),
  .lsu_idu_da_pipe3_fwd_vreg_vr0_data   (lsu_idu_da_pipe3_fwd_vreg_vr0_data  ),
  .lsu_idu_da_pipe3_fwd_vreg_vr1_data   (lsu_idu_da_pipe3_fwd_vreg_vr1_data  ),
  .lsu_idu_ld_da_wait_old               (lsu_idu_ld_da_wait_old              ),
  .lsu_idu_ld_da_wait_old_gateclk_en    (lsu_idu_ld_da_wait_old_gateclk_en   ),
  .lsu_rtu_da_pipe3_split_spec_fail_iid (lsu_rtu_da_pipe3_split_spec_fail_iid),
  .lsu_rtu_da_pipe3_split_spec_fail_vld (lsu_rtu_da_pipe3_split_spec_fail_vld),
  .lsu_special_clk                      (lsu_special_clk                     ),
  .mmu_lsu_access_fault0                (mmu_lsu_access_fault0               ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pfu_biu_req_addr                     (pfu_biu_req_addr                    ),
  .rb_ld_da_full                        (rb_ld_da_full                       ),
  .rb_ld_da_hit_idx                     (rb_ld_da_hit_idx                    ),
  .rb_ld_da_merge_fail                  (rb_ld_da_merge_fail                 ),
  .rtu_yy_xx_commit0                    (rtu_yy_xx_commit0                   ),
  .rtu_yy_xx_commit0_iid                (rtu_yy_xx_commit0_iid               ),
  .rtu_yy_xx_commit1                    (rtu_yy_xx_commit1                   ),
  .rtu_yy_xx_commit1_iid                (rtu_yy_xx_commit1_iid               ),
  .rtu_yy_xx_commit2                    (rtu_yy_xx_commit2                   ),
  .rtu_yy_xx_commit2_iid                (rtu_yy_xx_commit2_iid               ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .sd_ex1_data_bypass                   (sd_ex1_data_bypass                  ),
  .sd_ex1_inst_vld                      (sd_ex1_inst_vld                     ),
  .sf_spec_hit                          (sf_spec_hit                         ),
  .sf_spec_mark                         (sf_spec_mark                        ),
  .sq_ld_da_fwd_data                    (sq_ld_da_fwd_data                   ),
  .sq_ld_da_fwd_data_pe                 (sq_ld_da_fwd_data_pe                ),
  .sq_ld_dc_data_discard_req            (sq_ld_dc_data_discard_req           ),
  .sq_ld_dc_fwd_bypass_multi            (sq_ld_dc_fwd_bypass_multi           ),
  .sq_ld_dc_fwd_bypass_req              (sq_ld_dc_fwd_bypass_req             ),
  .sq_ld_dc_fwd_id                      (sq_ld_dc_fwd_id                     ),
  .sq_ld_dc_fwd_multi                   (sq_ld_dc_fwd_multi                  ),
  .sq_ld_dc_fwd_multi_mask              (sq_ld_dc_fwd_multi_mask             ),
  .sq_ld_dc_newest_fwd_data_vld_req     (sq_ld_dc_newest_fwd_data_vld_req    ),
  .sq_ld_dc_other_discard_req           (sq_ld_dc_other_discard_req          ),
  .st_da_addr                           (st_da_addr                          ),
  .wmb_ld_da_fwd_data                   (wmb_ld_da_fwd_data                  ),
  .wmb_ld_dc_discard_req                (wmb_ld_dc_discard_req               )
);

// &Instance("ct_lsu_st_da","x_ct_lsu_st_da"); @105
ct_lsu_st_da  x_ct_lsu_st_da (
  .amr_wa_cancel                        (amr_wa_cancel                       ),
  .cp0_lsu_dcache_en                    (cp0_lsu_dcache_en                   ),
  .cp0_lsu_icg_en                       (cp0_lsu_icg_en                      ),
  .cp0_lsu_l2_st_pref_en                (cp0_lsu_l2_st_pref_en               ),
  .cp0_lsu_nsfe                         (cp0_lsu_nsfe                        ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .ctrl_st_clk                          (ctrl_st_clk                         ),
  .dcache_dirty_din                     (dcache_dirty_din                    ),
  .dcache_dirty_gwen                    (dcache_dirty_gwen                   ),
  .dcache_dirty_wen                     (dcache_dirty_wen                    ),
  .dcache_idx                           (dcache_idx                          ),
  .dcache_tag_din                       (dcache_tag_din                      ),
  .dcache_tag_gwen                      (dcache_tag_gwen                     ),
  .dcache_tag_wen                       (dcache_tag_wen                      ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .ld_da_st_da_hit_idx                  (ld_da_st_da_hit_idx                 ),
  .lfb_st_da_hit_idx                    (lfb_st_da_hit_idx                   ),
  .lm_st_da_hit_idx                     (lm_st_da_hit_idx                    ),
  .lsu_has_fence                        (lsu_has_fence                       ),
  .lsu_hpcp_st_cache_access             (lsu_hpcp_st_cache_access            ),
  .lsu_hpcp_st_cache_miss               (lsu_hpcp_st_cache_miss              ),
  .lsu_hpcp_st_unalign_inst             (lsu_hpcp_st_unalign_inst            ),
  .lsu_rtu_da_pipe4_split_spec_fail_iid (lsu_rtu_da_pipe4_split_spec_fail_iid),
  .lsu_rtu_da_pipe4_split_spec_fail_vld (lsu_rtu_da_pipe4_split_spec_fail_vld),
  .mmu_lsu_access_fault1                (mmu_lsu_access_fault1               ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pfu_biu_req_addr                     (pfu_biu_req_addr                    ),
  .rb_st_da_full                        (rb_st_da_full                       ),
  .rb_st_da_hit_idx                     (rb_st_da_hit_idx                    ),
  .rtu_yy_xx_commit0                    (rtu_yy_xx_commit0                   ),
  .rtu_yy_xx_commit0_iid                (rtu_yy_xx_commit0_iid               ),
  .rtu_yy_xx_commit1                    (rtu_yy_xx_commit1                   ),
  .rtu_yy_xx_commit1_iid                (rtu_yy_xx_commit1_iid               ),
  .rtu_yy_xx_commit2                    (rtu_yy_xx_commit2                   ),
  .rtu_yy_xx_commit2_iid                (rtu_yy_xx_commit2_iid               ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .st_da_addr                           (st_da_addr                          ),
  .st_da_bkpta_data                     (st_da_bkpta_data                    ),
  .st_da_bkptb_data                     (st_da_bkptb_data                    ),
  .st_da_borrow_icc_vld                 (st_da_borrow_icc_vld                ),
  .st_da_borrow_vld                     (st_da_borrow_vld                    ),
  .st_da_dcache_dirty                   (st_da_dcache_dirty                  ),
  .st_da_dcache_hit                     (st_da_dcache_hit                    ),
  .st_da_dcache_miss                    (st_da_dcache_miss                   ),
  .st_da_dcache_replace_dirty           (st_da_dcache_replace_dirty          ),
  .st_da_dcache_replace_valid           (st_da_dcache_replace_valid          ),
  .st_da_dcache_replace_way             (st_da_dcache_replace_way            ),
  .st_da_dcache_way                     (st_da_dcache_way                    ),
  .st_da_ecc_wakeup                     (st_da_ecc_wakeup                    ),
  .st_da_fence_inst                     (st_da_fence_inst                    ),
  .st_da_fence_mode                     (st_da_fence_mode                    ),
  .st_da_icc_dirty_info                 (st_da_icc_dirty_info                ),
  .st_da_icc_tag_info                   (st_da_icc_tag_info                  ),
  .st_da_idu_already_da                 (st_da_idu_already_da                ),
  .st_da_idu_bkpta_data                 (st_da_idu_bkpta_data                ),
  .st_da_idu_bkptb_data                 (st_da_idu_bkptb_data                ),
  .st_da_idu_boundary_gateclk_en        (st_da_idu_boundary_gateclk_en       ),
  .st_da_idu_pop_entry                  (st_da_idu_pop_entry                 ),
  .st_da_idu_pop_vld                    (st_da_idu_pop_vld                   ),
  .st_da_idu_rb_full                    (st_da_idu_rb_full                   ),
  .st_da_idu_secd                       (st_da_idu_secd                      ),
  .st_da_idu_spec_fail                  (st_da_idu_spec_fail                 ),
  .st_da_idu_wait_fence                 (st_da_idu_wait_fence                ),
  .st_da_iid                            (st_da_iid                           ),
  .st_da_inst_size                      (st_da_inst_size                     ),
  .st_da_inst_vld                       (st_da_inst_vld                      ),
  .st_da_old                            (st_da_old                           ),
  .st_da_page_buf                       (st_da_page_buf                      ),
  .st_da_page_ca                        (st_da_page_ca                       ),
  .st_da_page_sec                       (st_da_page_sec                      ),
  .st_da_page_sec_ff                    (st_da_page_sec_ff                   ),
  .st_da_page_share                     (st_da_page_share                    ),
  .st_da_page_share_ff                  (st_da_page_share_ff                 ),
  .st_da_page_so                        (st_da_page_so                       ),
  .st_da_pc                             (st_da_pc                            ),
  .st_da_pfu_act_dp_vld                 (st_da_pfu_act_dp_vld                ),
  .st_da_pfu_act_vld                    (st_da_pfu_act_vld                   ),
  .st_da_pfu_biu_req_hit_idx            (st_da_pfu_biu_req_hit_idx           ),
  .st_da_pfu_evict_cnt_vld              (st_da_pfu_evict_cnt_vld             ),
  .st_da_pfu_pf_inst_vld                (st_da_pfu_pf_inst_vld               ),
  .st_da_ppfu_va                        (st_da_ppfu_va                       ),
  .st_da_ppn_ff                         (st_da_ppn_ff                        ),
  .st_da_rb_cmit                        (st_da_rb_cmit                       ),
  .st_da_rb_create_dp_vld               (st_da_rb_create_dp_vld              ),
  .st_da_rb_create_gateclk_en           (st_da_rb_create_gateclk_en          ),
  .st_da_rb_create_lfb                  (st_da_rb_create_lfb                 ),
  .st_da_rb_create_vld                  (st_da_rb_create_vld                 ),
  .st_da_rb_full_gateclk_en             (st_da_rb_full_gateclk_en            ),
  .st_da_secd                           (st_da_secd                          ),
  .st_da_sf_addr_tto4                   (st_da_sf_addr_tto4                  ),
  .st_da_sf_bytes_vld                   (st_da_sf_bytes_vld                  ),
  .st_da_sf_iid                         (st_da_sf_iid                        ),
  .st_da_sf_no_spec_miss                (st_da_sf_no_spec_miss               ),
  .st_da_sf_no_spec_miss_gate           (st_da_sf_no_spec_miss_gate          ),
  .st_da_sf_spec_chk                    (st_da_sf_spec_chk                   ),
  .st_da_sf_spec_chk_gate               (st_da_sf_spec_chk_gate              ),
  .st_da_snq_borrow_snq                 (st_da_snq_borrow_snq                ),
  .st_da_snq_dcache_dirty               (st_da_snq_dcache_dirty              ),
  .st_da_snq_dcache_share               (st_da_snq_dcache_share              ),
  .st_da_snq_dcache_valid               (st_da_snq_dcache_valid              ),
  .st_da_snq_dcache_way                 (st_da_snq_dcache_way                ),
  .st_da_snq_ecc_err                    (st_da_snq_ecc_err                   ),
  .st_da_sq_dcache_dirty                (st_da_sq_dcache_dirty               ),
  .st_da_sq_dcache_share                (st_da_sq_dcache_share               ),
  .st_da_sq_dcache_valid                (st_da_sq_dcache_valid               ),
  .st_da_sq_dcache_way                  (st_da_sq_dcache_way                 ),
  .st_da_sq_ecc_stall                   (st_da_sq_ecc_stall                  ),
  .st_da_sq_no_restart                  (st_da_sq_no_restart                 ),
  .st_da_sync_fence                     (st_da_sync_fence                    ),
  .st_da_sync_inst                      (st_da_sync_inst                     ),
  .st_da_vb_ecc_err                     (st_da_vb_ecc_err                    ),
  .st_da_vb_ecc_stall                   (st_da_vb_ecc_stall                  ),
  .st_da_vb_feedback_addr_tto14         (st_da_vb_feedback_addr_tto14        ),
  .st_da_vb_tag_reissue                 (st_da_vb_tag_reissue                ),
  .st_da_wait_fence_gateclk_en          (st_da_wait_fence_gateclk_en         ),
  .st_da_wb_cmplt_req                   (st_da_wb_cmplt_req                  ),
  .st_da_wb_expt_vec                    (st_da_wb_expt_vec                   ),
  .st_da_wb_expt_vld                    (st_da_wb_expt_vld                   ),
  .st_da_wb_mt_value                    (st_da_wb_mt_value                   ),
  .st_da_wb_no_spec_hit                 (st_da_wb_no_spec_hit                ),
  .st_da_wb_no_spec_mispred             (st_da_wb_no_spec_mispred            ),
  .st_da_wb_no_spec_miss                (st_da_wb_no_spec_miss               ),
  .st_da_wb_spec_fail                   (st_da_wb_spec_fail                  ),
  .st_da_wb_vstart_vld                  (st_da_wb_vstart_vld                 ),
  .st_dc_addr0                          (st_dc_addr0                         ),
  .st_dc_already_da                     (st_dc_already_da                    ),
  .st_dc_atomic                         (st_dc_atomic                        ),
  .st_dc_bkpta_data                     (st_dc_bkpta_data                    ),
  .st_dc_bkptb_data                     (st_dc_bkptb_data                    ),
  .st_dc_borrow_dcache_replace          (st_dc_borrow_dcache_replace         ),
  .st_dc_borrow_dcache_sw               (st_dc_borrow_dcache_sw              ),
  .st_dc_borrow_icc                     (st_dc_borrow_icc                    ),
  .st_dc_borrow_snq                     (st_dc_borrow_snq                    ),
  .st_dc_borrow_snq_id                  (st_dc_borrow_snq_id                 ),
  .st_dc_borrow_vld                     (st_dc_borrow_vld                    ),
  .st_dc_boundary                       (st_dc_boundary                      ),
  .st_dc_bytes_vld                      (st_dc_bytes_vld                     ),
  .st_dc_da_dcache_dirty_array          (st_dc_da_dcache_dirty_array         ),
  .st_dc_da_dcache_tag_array            (st_dc_da_dcache_tag_array           ),
  .st_dc_da_expt_vld_gate_en            (st_dc_da_expt_vld_gate_en           ),
  .st_dc_da_inst_vld                    (st_dc_da_inst_vld                   ),
  .st_dc_da_page_buf                    (st_dc_da_page_buf                   ),
  .st_dc_da_page_ca                     (st_dc_da_page_ca                    ),
  .st_dc_da_page_sec                    (st_dc_da_page_sec                   ),
  .st_dc_da_page_share                  (st_dc_da_page_share                 ),
  .st_dc_da_page_so                     (st_dc_da_page_so                    ),
  .st_dc_da_page_wa                     (st_dc_da_page_wa                    ),
  .st_dc_da_tag0_hit                    (st_dc_da_tag0_hit                   ),
  .st_dc_da_tag1_hit                    (st_dc_da_tag1_hit                   ),
  .st_dc_dcwp_hit_idx                   (st_dc_dcwp_hit_idx                  ),
  .st_dc_expt_access_fault_extra        (st_dc_expt_access_fault_extra       ),
  .st_dc_expt_access_fault_mask         (st_dc_expt_access_fault_mask        ),
  .st_dc_expt_vec                       (st_dc_expt_vec                      ),
  .st_dc_expt_vld_except_access_err     (st_dc_expt_vld_except_access_err    ),
  .st_dc_fence_mode                     (st_dc_fence_mode                    ),
  .st_dc_get_dcache_tag_dirty           (st_dc_get_dcache_tag_dirty          ),
  .st_dc_icc                            (st_dc_icc                           ),
  .st_dc_iid                            (st_dc_iid                           ),
  .st_dc_inst_mode                      (st_dc_inst_mode                     ),
  .st_dc_inst_size                      (st_dc_inst_size                     ),
  .st_dc_inst_type                      (st_dc_inst_type                     ),
  .st_dc_inst_vld                       (st_dc_inst_vld                      ),
  .st_dc_lsid                           (st_dc_lsid                          ),
  .st_dc_mmu_req                        (st_dc_mmu_req                       ),
  .st_dc_mt_value                       (st_dc_mt_value                      ),
  .st_dc_no_spec                        (st_dc_no_spec                       ),
  .st_dc_old                            (st_dc_old                           ),
  .st_dc_pc                             (st_dc_pc                            ),
  .st_dc_pf_inst                        (st_dc_pf_inst                       ),
  .st_dc_pfu_va                         (st_dc_pfu_va                        ),
  .st_dc_secd                           (st_dc_secd                          ),
  .st_dc_spec_fail                      (st_dc_spec_fail                     ),
  .st_dc_split                          (st_dc_split                         ),
  .st_dc_st                             (st_dc_st                            ),
  .st_dc_sync_fence                     (st_dc_sync_fence                    ),
  .st_dc_vector_nop                     (st_dc_vector_nop                    )
);


// &Instance("ct_lsu_rb","x_ct_lsu_rb"); @107
ct_lsu_rb  x_ct_lsu_rb (
  .biu_lsu_b_id                   (biu_lsu_b_id                  ),
  .biu_lsu_b_vld                  (biu_lsu_b_vld                 ),
  .biu_lsu_r_data                 (biu_lsu_r_data                ),
  .biu_lsu_r_id                   (biu_lsu_r_id                  ),
  .biu_lsu_r_resp                 (biu_lsu_r_resp                ),
  .biu_lsu_r_vld                  (biu_lsu_r_vld                 ),
  .bus_arb_rb_ar_grnt             (bus_arb_rb_ar_grnt            ),
  .cp0_lsu_dcache_en              (cp0_lsu_dcache_en             ),
  .cp0_lsu_icg_en                 (cp0_lsu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cp0_yy_priv_mode               (cp0_yy_priv_mode              ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .ld_da_addr                     (ld_da_addr                    ),
  .ld_da_bkpta_data               (ld_da_bkpta_data              ),
  .ld_da_bkptb_data               (ld_da_bkptb_data              ),
  .ld_da_boundary_after_mask      (ld_da_boundary_after_mask     ),
  .ld_da_bytes_vld                (ld_da_bytes_vld               ),
  .ld_da_data_ori                 (ld_da_data_ori                ),
  .ld_da_data_rot_sel             (ld_da_data_rot_sel            ),
  .ld_da_dcache_hit               (ld_da_dcache_hit              ),
  .ld_da_idx                      (ld_da_idx                     ),
  .ld_da_iid                      (ld_da_iid                     ),
  .ld_da_inst_size                (ld_da_inst_size               ),
  .ld_da_inst_vfls                (ld_da_inst_vfls               ),
  .ld_da_mcic_borrow_mmu          (ld_da_mcic_borrow_mmu         ),
  .ld_da_old                      (ld_da_old                     ),
  .ld_da_page_buf                 (ld_da_page_buf                ),
  .ld_da_page_ca                  (ld_da_page_ca                 ),
  .ld_da_page_sec                 (ld_da_page_sec                ),
  .ld_da_page_share               (ld_da_page_share              ),
  .ld_da_page_so                  (ld_da_page_so                 ),
  .ld_da_preg                     (ld_da_preg                    ),
  .ld_da_rb_atomic                (ld_da_rb_atomic               ),
  .ld_da_rb_cmit                  (ld_da_rb_cmit                 ),
  .ld_da_rb_cmplt_success         (ld_da_rb_cmplt_success        ),
  .ld_da_rb_create_dp_vld         (ld_da_rb_create_dp_vld        ),
  .ld_da_rb_create_gateclk_en     (ld_da_rb_create_gateclk_en    ),
  .ld_da_rb_create_judge_vld      (ld_da_rb_create_judge_vld     ),
  .ld_da_rb_create_lfb            (ld_da_rb_create_lfb           ),
  .ld_da_rb_create_vld            (ld_da_rb_create_vld           ),
  .ld_da_rb_data_vld              (ld_da_rb_data_vld             ),
  .ld_da_rb_dest_vld              (ld_da_rb_dest_vld             ),
  .ld_da_rb_discard_grnt          (ld_da_rb_discard_grnt         ),
  .ld_da_rb_ldamo                 (ld_da_rb_ldamo                ),
  .ld_da_rb_merge_dp_vld          (ld_da_rb_merge_dp_vld         ),
  .ld_da_rb_merge_expt_vld        (ld_da_rb_merge_expt_vld       ),
  .ld_da_rb_merge_gateclk_en      (ld_da_rb_merge_gateclk_en     ),
  .ld_da_rb_merge_vld             (ld_da_rb_merge_vld            ),
  .ld_da_sign_extend              (ld_da_sign_extend             ),
  .ld_da_vreg                     (ld_da_vreg                    ),
  .ld_da_vreg_sign_sel            (ld_da_vreg_sign_sel           ),
  .ld_wb_rb_cmplt_grnt            (ld_wb_rb_cmplt_grnt           ),
  .ld_wb_rb_data_grnt             (ld_wb_rb_data_grnt            ),
  .lfb_addr_full                  (lfb_addr_full                 ),
  .lfb_rb_biu_req_hit_idx         (lfb_rb_biu_req_hit_idx        ),
  .lfb_rb_ca_rready_grnt          (lfb_rb_ca_rready_grnt         ),
  .lfb_rb_create_id               (lfb_rb_create_id              ),
  .lfb_rb_nc_rready_grnt          (lfb_rb_nc_rready_grnt         ),
  .lm_already_snoop               (lm_already_snoop              ),
  .lsu_had_rb_entry_fence         (lsu_had_rb_entry_fence        ),
  .lsu_had_rb_entry_state_0       (lsu_had_rb_entry_state_0      ),
  .lsu_had_rb_entry_state_1       (lsu_had_rb_entry_state_1      ),
  .lsu_had_rb_entry_state_2       (lsu_had_rb_entry_state_2      ),
  .lsu_had_rb_entry_state_3       (lsu_had_rb_entry_state_3      ),
  .lsu_had_rb_entry_state_4       (lsu_had_rb_entry_state_4      ),
  .lsu_had_rb_entry_state_5       (lsu_had_rb_entry_state_5      ),
  .lsu_had_rb_entry_state_6       (lsu_had_rb_entry_state_6      ),
  .lsu_had_rb_entry_state_7       (lsu_had_rb_entry_state_7      ),
  .lsu_has_fence                  (lsu_has_fence                 ),
  .lsu_idu_no_fence               (lsu_idu_no_fence              ),
  .lsu_idu_rb_not_full            (lsu_idu_rb_not_full           ),
  .lsu_rtu_all_commit_ld_data_vld (lsu_rtu_all_commit_ld_data_vld),
  .lsu_special_clk                (lsu_special_clk               ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .pfu_biu_req_addr               (pfu_biu_req_addr              ),
  .rb_biu_ar_addr                 (rb_biu_ar_addr                ),
  .rb_biu_ar_bar                  (rb_biu_ar_bar                 ),
  .rb_biu_ar_burst                (rb_biu_ar_burst               ),
  .rb_biu_ar_cache                (rb_biu_ar_cache               ),
  .rb_biu_ar_domain               (rb_biu_ar_domain              ),
  .rb_biu_ar_dp_req               (rb_biu_ar_dp_req              ),
  .rb_biu_ar_id                   (rb_biu_ar_id                  ),
  .rb_biu_ar_len                  (rb_biu_ar_len                 ),
  .rb_biu_ar_lock                 (rb_biu_ar_lock                ),
  .rb_biu_ar_prot                 (rb_biu_ar_prot                ),
  .rb_biu_ar_req                  (rb_biu_ar_req                 ),
  .rb_biu_ar_req_gateclk_en       (rb_biu_ar_req_gateclk_en      ),
  .rb_biu_ar_size                 (rb_biu_ar_size                ),
  .rb_biu_ar_snoop                (rb_biu_ar_snoop               ),
  .rb_biu_ar_user                 (rb_biu_ar_user                ),
  .rb_biu_req_addr                (rb_biu_req_addr               ),
  .rb_biu_req_unmask              (rb_biu_req_unmask             ),
  .rb_empty                       (rb_empty                      ),
  .rb_fence_ld                    (rb_fence_ld                   ),
  .rb_ld_da_full                  (rb_ld_da_full                 ),
  .rb_ld_da_hit_idx               (rb_ld_da_hit_idx              ),
  .rb_ld_da_merge_fail            (rb_ld_da_merge_fail           ),
  .rb_ld_wb_bkpta_data            (rb_ld_wb_bkpta_data           ),
  .rb_ld_wb_bkptb_data            (rb_ld_wb_bkptb_data           ),
  .rb_ld_wb_bus_err               (rb_ld_wb_bus_err              ),
  .rb_ld_wb_bus_err_addr          (rb_ld_wb_bus_err_addr         ),
  .rb_ld_wb_cmplt_req             (rb_ld_wb_cmplt_req            ),
  .rb_ld_wb_data                  (rb_ld_wb_data                 ),
  .rb_ld_wb_data_iid              (rb_ld_wb_data_iid             ),
  .rb_ld_wb_data_req              (rb_ld_wb_data_req             ),
  .rb_ld_wb_expt_gateclk          (rb_ld_wb_expt_gateclk         ),
  .rb_ld_wb_expt_vld              (rb_ld_wb_expt_vld             ),
  .rb_ld_wb_iid                   (rb_ld_wb_iid                  ),
  .rb_ld_wb_inst_vfls             (rb_ld_wb_inst_vfls            ),
  .rb_ld_wb_preg                  (rb_ld_wb_preg                 ),
  .rb_ld_wb_preg_sign_sel         (rb_ld_wb_preg_sign_sel        ),
  .rb_ld_wb_vreg                  (rb_ld_wb_vreg                 ),
  .rb_ld_wb_vreg_sign_sel         (rb_ld_wb_vreg_sign_sel        ),
  .rb_lfb_addr_tto4               (rb_lfb_addr_tto4              ),
  .rb_lfb_atomic                  (rb_lfb_atomic                 ),
  .rb_lfb_boundary_depd_wakeup    (rb_lfb_boundary_depd_wakeup   ),
  .rb_lfb_create_dp_vld           (rb_lfb_create_dp_vld          ),
  .rb_lfb_create_gateclk_en       (rb_lfb_create_gateclk_en      ),
  .rb_lfb_create_req              (rb_lfb_create_req             ),
  .rb_lfb_create_vld              (rb_lfb_create_vld             ),
  .rb_lfb_depd                    (rb_lfb_depd                   ),
  .rb_lfb_ldamo                   (rb_lfb_ldamo                  ),
  .rb_lm_ar_id                    (rb_lm_ar_id                   ),
  .rb_lm_atomic_next_resp         (rb_lm_atomic_next_resp        ),
  .rb_lm_wait_resp_dp_vld         (rb_lm_wait_resp_dp_vld        ),
  .rb_lm_wait_resp_vld            (rb_lm_wait_resp_vld           ),
  .rb_mcic_ar_id                  (rb_mcic_ar_id                 ),
  .rb_mcic_biu_req_success        (rb_mcic_biu_req_success       ),
  .rb_mcic_ecc_err                (rb_mcic_ecc_err               ),
  .rb_mcic_not_full               (rb_mcic_not_full              ),
  .rb_pfu_biu_req_hit_idx         (rb_pfu_biu_req_hit_idx        ),
  .rb_pfu_nc_no_pending           (rb_pfu_nc_no_pending          ),
  .rb_sq_pop_hit_idx              (rb_sq_pop_hit_idx             ),
  .rb_st_da_full                  (rb_st_da_full                 ),
  .rb_st_da_hit_idx               (rb_st_da_hit_idx              ),
  .rb_wmb_ce_hit_idx              (rb_wmb_ce_hit_idx             ),
  .rb_wmb_so_pending              (rb_wmb_so_pending             ),
  .rtu_lsu_async_flush            (rtu_lsu_async_flush           ),
  .rtu_yy_xx_commit0              (rtu_yy_xx_commit0             ),
  .rtu_yy_xx_commit0_iid          (rtu_yy_xx_commit0_iid         ),
  .rtu_yy_xx_commit1              (rtu_yy_xx_commit1             ),
  .rtu_yy_xx_commit1_iid          (rtu_yy_xx_commit1_iid         ),
  .rtu_yy_xx_commit2              (rtu_yy_xx_commit2             ),
  .rtu_yy_xx_commit2_iid          (rtu_yy_xx_commit2_iid         ),
  .rtu_yy_xx_flush                (rtu_yy_xx_flush               ),
  .sq_pop_addr                    (sq_pop_addr                   ),
  .sq_pop_page_ca                 (sq_pop_page_ca                ),
  .sq_pop_page_so                 (sq_pop_page_so                ),
  .st_da_addr                     (st_da_addr                    ),
  .st_da_dcache_hit               (st_da_dcache_hit              ),
  .st_da_fence_inst               (st_da_fence_inst              ),
  .st_da_fence_mode               (st_da_fence_mode              ),
  .st_da_iid                      (st_da_iid                     ),
  .st_da_inst_size                (st_da_inst_size               ),
  .st_da_old                      (st_da_old                     ),
  .st_da_page_buf                 (st_da_page_buf                ),
  .st_da_page_ca                  (st_da_page_ca                 ),
  .st_da_page_sec                 (st_da_page_sec                ),
  .st_da_page_share               (st_da_page_share              ),
  .st_da_page_so                  (st_da_page_so                 ),
  .st_da_rb_cmit                  (st_da_rb_cmit                 ),
  .st_da_rb_create_dp_vld         (st_da_rb_create_dp_vld        ),
  .st_da_rb_create_gateclk_en     (st_da_rb_create_gateclk_en    ),
  .st_da_rb_create_lfb            (st_da_rb_create_lfb           ),
  .st_da_rb_create_vld            (st_da_rb_create_vld           ),
  .st_da_sync_fence               (st_da_sync_fence              ),
  .st_da_sync_inst                (st_da_sync_inst               ),
  .vb_rb_biu_req_hit_idx          (vb_rb_biu_req_hit_idx         ),
  .wmb_ce_addr                    (wmb_ce_addr                   ),
  .wmb_ce_page_ca                 (wmb_ce_page_ca                ),
  .wmb_ce_page_so                 (wmb_ce_page_so                ),
  .wmb_has_sync_fence             (wmb_has_sync_fence            ),
  .wmb_rb_biu_req_hit_idx         (wmb_rb_biu_req_hit_idx        ),
  .wmb_rb_so_pending              (wmb_rb_so_pending             ),
  .wmb_sync_fence_biu_req_success (wmb_sync_fence_biu_req_success)
);

// &Instance("ct_lsu_wmb","x_ct_lsu_wmb"); @108
ct_lsu_wmb  x_ct_lsu_wmb (
  .amr_l2_mem_set                     (amr_l2_mem_set                    ),
  .biu_lsu_b_id                       (biu_lsu_b_id                      ),
  .biu_lsu_b_resp                     (biu_lsu_b_resp                    ),
  .biu_lsu_b_vld                      (biu_lsu_b_vld                     ),
  .biu_lsu_r_id                       (biu_lsu_r_id                      ),
  .biu_lsu_r_vld                      (biu_lsu_r_vld                     ),
  .bus_arb_wmb_ar_grnt                (bus_arb_wmb_ar_grnt               ),
  .bus_arb_wmb_aw_grnt                (bus_arb_wmb_aw_grnt               ),
  .bus_arb_wmb_w_grnt                 (bus_arb_wmb_w_grnt                ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_no_op_req                  (cp0_lsu_no_op_req                 ),
  .cp0_lsu_wr_burst_dis               (cp0_lsu_wr_burst_dis              ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .dcache_arb_wmb_ld_grnt             (dcache_arb_wmb_ld_grnt            ),
  .dcache_dirty_din                   (dcache_dirty_din                  ),
  .dcache_dirty_gwen                  (dcache_dirty_gwen                 ),
  .dcache_dirty_wen                   (dcache_dirty_wen                  ),
  .dcache_idx                         (dcache_idx                        ),
  .dcache_snq_st_sel                  (dcache_snq_st_sel                 ),
  .dcache_tag_din                     (dcache_tag_din                    ),
  .dcache_tag_gwen                    (dcache_tag_gwen                   ),
  .dcache_tag_wen                     (dcache_tag_wen                    ),
  .dcache_vb_snq_gwen                 (dcache_vb_snq_gwen                ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .icc_wmb_write_imme                 (icc_wmb_write_imme                ),
  .ld_ag_inst_vld                     (ld_ag_inst_vld                    ),
  .ld_da_fwd_ecc_stall                (ld_da_fwd_ecc_stall               ),
  .ld_da_lsid                         (ld_da_lsid                        ),
  .ld_da_wmb_discard_vld              (ld_da_wmb_discard_vld             ),
  .ld_dc_addr0                        (ld_dc_addr0                       ),
  .ld_dc_addr1_11to4                  (ld_dc_addr1_11to4                 ),
  .ld_dc_bytes_vld                    (ld_dc_bytes_vld                   ),
  .ld_dc_chk_atomic_inst_vld          (ld_dc_chk_atomic_inst_vld         ),
  .ld_dc_chk_ld_inst_vld              (ld_dc_chk_ld_inst_vld             ),
  .ld_wb_wmb_data_grnt                (ld_wb_wmb_data_grnt               ),
  .lfb_wmb_read_req_hit_idx           (lfb_wmb_read_req_hit_idx          ),
  .lfb_wmb_write_req_hit_idx          (lfb_wmb_write_req_hit_idx         ),
  .lm_state_is_amo_lock               (lm_state_is_amo_lock              ),
  .lm_state_is_ex_wait_lock           (lm_state_is_ex_wait_lock          ),
  .lm_state_is_idle                   (lm_state_is_idle                  ),
  .lsu_had_wmb_ar_pending             (lsu_had_wmb_ar_pending            ),
  .lsu_had_wmb_aw_pending             (lsu_had_wmb_aw_pending            ),
  .lsu_had_wmb_create_ptr             (lsu_had_wmb_create_ptr            ),
  .lsu_had_wmb_data_ptr               (lsu_had_wmb_data_ptr              ),
  .lsu_had_wmb_entry_vld              (lsu_had_wmb_entry_vld             ),
  .lsu_had_wmb_read_ptr               (lsu_had_wmb_read_ptr              ),
  .lsu_had_wmb_w_pending              (lsu_had_wmb_w_pending             ),
  .lsu_had_wmb_write_imme             (lsu_had_wmb_write_imme            ),
  .lsu_had_wmb_write_ptr              (lsu_had_wmb_write_ptr             ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_biu_req_addr                   (pfu_biu_req_addr                  ),
  .rb_biu_req_addr                    (rb_biu_req_addr                   ),
  .rb_biu_req_unmask                  (rb_biu_req_unmask                 ),
  .rb_wmb_so_pending                  (rb_wmb_so_pending                 ),
  .rtu_lsu_async_flush                (rtu_lsu_async_flush               ),
  .rtu_yy_xx_flush                    (rtu_yy_xx_flush                   ),
  .snq_can_create_snq_uncheck         (snq_can_create_snq_uncheck        ),
  .snq_create_addr                    (snq_create_addr                   ),
  .snq_create_wmb_read_req_hit_idx    (snq_create_wmb_read_req_hit_idx   ),
  .snq_create_wmb_write_req_hit_idx   (snq_create_wmb_write_req_hit_idx  ),
  .snq_wmb_read_req_hit_idx           (snq_wmb_read_req_hit_idx          ),
  .snq_wmb_write_req_hit_idx          (snq_wmb_write_req_hit_idx         ),
  .sq_pop_addr                        (sq_pop_addr                       ),
  .sq_pop_priv_mode                   (sq_pop_priv_mode                  ),
  .sq_wmb_merge_req                   (sq_wmb_merge_req                  ),
  .sq_wmb_merge_stall_req             (sq_wmb_merge_stall_req            ),
  .sq_wmb_pop_to_ce_dp_req            (sq_wmb_pop_to_ce_dp_req           ),
  .sq_wmb_pop_to_ce_gateclk_en        (sq_wmb_pop_to_ce_gateclk_en       ),
  .sq_wmb_pop_to_ce_req               (sq_wmb_pop_to_ce_req              ),
  .st_ag_inst_vld                     (st_ag_inst_vld                    ),
  .st_rf_inst_vld                     (st_rf_inst_vld                    ),
  .st_wb_wmb_cmplt_grnt               (st_wb_wmb_cmplt_grnt              ),
  .vb_wmb_create_grnt                 (vb_wmb_create_grnt                ),
  .vb_wmb_empty                       (vb_wmb_empty                      ),
  .vb_wmb_entry_rcl_done              (vb_wmb_entry_rcl_done             ),
  .vb_wmb_write_req_hit_idx           (vb_wmb_write_req_hit_idx          ),
  .wmb_biu_ar_addr                    (wmb_biu_ar_addr                   ),
  .wmb_biu_ar_bar                     (wmb_biu_ar_bar                    ),
  .wmb_biu_ar_burst                   (wmb_biu_ar_burst                  ),
  .wmb_biu_ar_cache                   (wmb_biu_ar_cache                  ),
  .wmb_biu_ar_domain                  (wmb_biu_ar_domain                 ),
  .wmb_biu_ar_dp_req                  (wmb_biu_ar_dp_req                 ),
  .wmb_biu_ar_id                      (wmb_biu_ar_id                     ),
  .wmb_biu_ar_len                     (wmb_biu_ar_len                    ),
  .wmb_biu_ar_lock                    (wmb_biu_ar_lock                   ),
  .wmb_biu_ar_prot                    (wmb_biu_ar_prot                   ),
  .wmb_biu_ar_req                     (wmb_biu_ar_req                    ),
  .wmb_biu_ar_req_gateclk_en          (wmb_biu_ar_req_gateclk_en         ),
  .wmb_biu_ar_size                    (wmb_biu_ar_size                   ),
  .wmb_biu_ar_snoop                   (wmb_biu_ar_snoop                  ),
  .wmb_biu_ar_user                    (wmb_biu_ar_user                   ),
  .wmb_biu_aw_addr                    (wmb_biu_aw_addr                   ),
  .wmb_biu_aw_bar                     (wmb_biu_aw_bar                    ),
  .wmb_biu_aw_burst                   (wmb_biu_aw_burst                  ),
  .wmb_biu_aw_cache                   (wmb_biu_aw_cache                  ),
  .wmb_biu_aw_domain                  (wmb_biu_aw_domain                 ),
  .wmb_biu_aw_dp_req                  (wmb_biu_aw_dp_req                 ),
  .wmb_biu_aw_id                      (wmb_biu_aw_id                     ),
  .wmb_biu_aw_len                     (wmb_biu_aw_len                    ),
  .wmb_biu_aw_lock                    (wmb_biu_aw_lock                   ),
  .wmb_biu_aw_prot                    (wmb_biu_aw_prot                   ),
  .wmb_biu_aw_req                     (wmb_biu_aw_req                    ),
  .wmb_biu_aw_req_gateclk_en          (wmb_biu_aw_req_gateclk_en         ),
  .wmb_biu_aw_size                    (wmb_biu_aw_size                   ),
  .wmb_biu_aw_snoop                   (wmb_biu_aw_snoop                  ),
  .wmb_biu_aw_user                    (wmb_biu_aw_user                   ),
  .wmb_biu_w_data                     (wmb_biu_w_data                    ),
  .wmb_biu_w_id                       (wmb_biu_w_id                      ),
  .wmb_biu_w_last                     (wmb_biu_w_last                    ),
  .wmb_biu_w_req                      (wmb_biu_w_req                     ),
  .wmb_biu_w_strb                     (wmb_biu_w_strb                    ),
  .wmb_biu_w_vld                      (wmb_biu_w_vld                     ),
  .wmb_biu_w_wns                      (wmb_biu_w_wns                     ),
  .wmb_ce_addr                        (wmb_ce_addr                       ),
  .wmb_ce_atomic                      (wmb_ce_atomic                     ),
  .wmb_ce_bkpta_data                  (wmb_ce_bkpta_data                 ),
  .wmb_ce_bkptb_data                  (wmb_ce_bkptb_data                 ),
  .wmb_ce_bytes_vld                   (wmb_ce_bytes_vld                  ),
  .wmb_ce_bytes_vld_full              (wmb_ce_bytes_vld_full             ),
  .wmb_ce_create_dp_vld               (wmb_ce_create_dp_vld              ),
  .wmb_ce_create_gateclk_en           (wmb_ce_create_gateclk_en          ),
  .wmb_ce_create_merge                (wmb_ce_create_merge               ),
  .wmb_ce_create_merge_ptr            (wmb_ce_create_merge_ptr           ),
  .wmb_ce_create_same_dcache_line     (wmb_ce_create_same_dcache_line    ),
  .wmb_ce_create_stall                (wmb_ce_create_stall               ),
  .wmb_ce_create_vld                  (wmb_ce_create_vld                 ),
  .wmb_ce_create_wmb_data_req         (wmb_ce_create_wmb_data_req        ),
  .wmb_ce_create_wmb_dp_req           (wmb_ce_create_wmb_dp_req          ),
  .wmb_ce_create_wmb_gateclk_en       (wmb_ce_create_wmb_gateclk_en      ),
  .wmb_ce_create_wmb_req              (wmb_ce_create_wmb_req             ),
  .wmb_ce_data128                     (wmb_ce_data128                    ),
  .wmb_ce_data_vld                    (wmb_ce_data_vld                   ),
  .wmb_ce_dcache_inst                 (wmb_ce_dcache_inst                ),
  .wmb_ce_fence_mode                  (wmb_ce_fence_mode                 ),
  .wmb_ce_hit_sq_pop_dcache_line      (wmb_ce_hit_sq_pop_dcache_line     ),
  .wmb_ce_icc                         (wmb_ce_icc                        ),
  .wmb_ce_iid                         (wmb_ce_iid                        ),
  .wmb_ce_inst_flush                  (wmb_ce_inst_flush                 ),
  .wmb_ce_inst_mode                   (wmb_ce_inst_mode                  ),
  .wmb_ce_inst_size                   (wmb_ce_inst_size                  ),
  .wmb_ce_inst_type                   (wmb_ce_inst_type                  ),
  .wmb_ce_merge_data_addr_hit         (wmb_ce_merge_data_addr_hit        ),
  .wmb_ce_merge_data_stall            (wmb_ce_merge_data_stall           ),
  .wmb_ce_merge_en                    (wmb_ce_merge_en                   ),
  .wmb_ce_merge_ptr                   (wmb_ce_merge_ptr                  ),
  .wmb_ce_merge_wmb_req               (wmb_ce_merge_wmb_req              ),
  .wmb_ce_merge_wmb_wait_not_vld_req  (wmb_ce_merge_wmb_wait_not_vld_req ),
  .wmb_ce_page_buf                    (wmb_ce_page_buf                   ),
  .wmb_ce_page_ca                     (wmb_ce_page_ca                    ),
  .wmb_ce_page_sec                    (wmb_ce_page_sec                   ),
  .wmb_ce_page_share                  (wmb_ce_page_share                 ),
  .wmb_ce_page_so                     (wmb_ce_page_so                    ),
  .wmb_ce_page_wa                     (wmb_ce_page_wa                    ),
  .wmb_ce_pop_vld                     (wmb_ce_pop_vld                    ),
  .wmb_ce_priv_mode                   (wmb_ce_priv_mode                  ),
  .wmb_ce_read_dp_req                 (wmb_ce_read_dp_req                ),
  .wmb_ce_same_dcache_line            (wmb_ce_same_dcache_line           ),
  .wmb_ce_sc_wb_vld                   (wmb_ce_sc_wb_vld                  ),
  .wmb_ce_spec_fail                   (wmb_ce_spec_fail                  ),
  .wmb_ce_sync_fence                  (wmb_ce_sync_fence                 ),
  .wmb_ce_update_dcache_dirty         (wmb_ce_update_dcache_dirty        ),
  .wmb_ce_update_dcache_share         (wmb_ce_update_dcache_share        ),
  .wmb_ce_update_dcache_valid         (wmb_ce_update_dcache_valid        ),
  .wmb_ce_update_dcache_way           (wmb_ce_update_dcache_way          ),
  .wmb_ce_vld                         (wmb_ce_vld                        ),
  .wmb_ce_vstart_vld                  (wmb_ce_vstart_vld                 ),
  .wmb_ce_wb_cmplt_success            (wmb_ce_wb_cmplt_success           ),
  .wmb_ce_wb_data_success             (wmb_ce_wb_data_success            ),
  .wmb_ce_write_biu_dp_req            (wmb_ce_write_biu_dp_req           ),
  .wmb_ce_write_imme                  (wmb_ce_write_imme                 ),
  .wmb_clk                            (wmb_clk                           ),
  .wmb_dcache_arb_data_way            (wmb_dcache_arb_data_way           ),
  .wmb_dcache_arb_ld_borrow_req       (wmb_dcache_arb_ld_borrow_req      ),
  .wmb_dcache_arb_ld_data_gateclk_en  (wmb_dcache_arb_ld_data_gateclk_en ),
  .wmb_dcache_arb_ld_data_gwen        (wmb_dcache_arb_ld_data_gwen       ),
  .wmb_dcache_arb_ld_data_high_din    (wmb_dcache_arb_ld_data_high_din   ),
  .wmb_dcache_arb_ld_data_idx         (wmb_dcache_arb_ld_data_idx        ),
  .wmb_dcache_arb_ld_data_low_din     (wmb_dcache_arb_ld_data_low_din    ),
  .wmb_dcache_arb_ld_data_req         (wmb_dcache_arb_ld_data_req        ),
  .wmb_dcache_arb_ld_data_wen         (wmb_dcache_arb_ld_data_wen        ),
  .wmb_dcache_arb_ld_req              (wmb_dcache_arb_ld_req             ),
  .wmb_dcache_arb_ld_tag_gateclk_en   (wmb_dcache_arb_ld_tag_gateclk_en  ),
  .wmb_dcache_arb_ld_tag_idx          (wmb_dcache_arb_ld_tag_idx         ),
  .wmb_dcache_arb_ld_tag_req          (wmb_dcache_arb_ld_tag_req         ),
  .wmb_dcache_arb_ld_tag_wen          (wmb_dcache_arb_ld_tag_wen         ),
  .wmb_dcache_arb_st_dirty_din        (wmb_dcache_arb_st_dirty_din       ),
  .wmb_dcache_arb_st_dirty_gateclk_en (wmb_dcache_arb_st_dirty_gateclk_en),
  .wmb_dcache_arb_st_dirty_idx        (wmb_dcache_arb_st_dirty_idx       ),
  .wmb_dcache_arb_st_dirty_req        (wmb_dcache_arb_st_dirty_req       ),
  .wmb_dcache_arb_st_dirty_wen        (wmb_dcache_arb_st_dirty_wen       ),
  .wmb_dcache_arb_st_req              (wmb_dcache_arb_st_req             ),
  .wmb_depd_wakeup                    (wmb_depd_wakeup                   ),
  .wmb_empty                          (wmb_empty                         ),
  .wmb_entry_vld                      (wmb_entry_vld                     ),
  .wmb_fwd_bytes_vld                  (wmb_fwd_bytes_vld                 ),
  .wmb_has_sync_fence                 (wmb_has_sync_fence                ),
  .wmb_ld_da_fwd_data                 (wmb_ld_da_fwd_data                ),
  .wmb_ld_dc_cancel_acc_req           (wmb_ld_dc_cancel_acc_req          ),
  .wmb_ld_dc_discard_req              (wmb_ld_dc_discard_req             ),
  .wmb_ld_dc_fwd_req                  (wmb_ld_dc_fwd_req                 ),
  .wmb_ld_wb_data                     (wmb_ld_wb_data                    ),
  .wmb_ld_wb_data_addr                (wmb_ld_wb_data_addr               ),
  .wmb_ld_wb_data_iid                 (wmb_ld_wb_data_iid                ),
  .wmb_ld_wb_data_req                 (wmb_ld_wb_data_req                ),
  .wmb_ld_wb_inst_vfls                (wmb_ld_wb_inst_vfls               ),
  .wmb_ld_wb_preg                     (wmb_ld_wb_preg                    ),
  .wmb_ld_wb_preg_sign_sel            (wmb_ld_wb_preg_sign_sel           ),
  .wmb_ld_wb_vreg                     (wmb_ld_wb_vreg                    ),
  .wmb_ld_wb_vreg_sign_sel            (wmb_ld_wb_vreg_sign_sel           ),
  .wmb_lm_state_clr                   (wmb_lm_state_clr                  ),
  .wmb_no_op                          (wmb_no_op                         ),
  .wmb_pfu_biu_req_hit_idx            (wmb_pfu_biu_req_hit_idx           ),
  .wmb_rb_biu_req_hit_idx             (wmb_rb_biu_req_hit_idx            ),
  .wmb_rb_so_pending                  (wmb_rb_so_pending                 ),
  .wmb_read_req_addr                  (wmb_read_req_addr                 ),
  .wmb_snq_depd                       (wmb_snq_depd                      ),
  .wmb_snq_depd_remove                (wmb_snq_depd_remove               ),
  .wmb_sq_pop_grnt                    (wmb_sq_pop_grnt                   ),
  .wmb_sq_pop_to_ce_grnt              (wmb_sq_pop_to_ce_grnt             ),
  .wmb_st_wb_bkpta_data               (wmb_st_wb_bkpta_data              ),
  .wmb_st_wb_bkptb_data               (wmb_st_wb_bkptb_data              ),
  .wmb_st_wb_cmplt_req                (wmb_st_wb_cmplt_req               ),
  .wmb_st_wb_iid                      (wmb_st_wb_iid                     ),
  .wmb_st_wb_inst_flush               (wmb_st_wb_inst_flush              ),
  .wmb_st_wb_spec_fail                (wmb_st_wb_spec_fail               ),
  .wmb_sync_fence_biu_req_success     (wmb_sync_fence_biu_req_success    ),
  .wmb_vb_addr_tto6                   (wmb_vb_addr_tto6                  ),
  .wmb_vb_create_dp_vld               (wmb_vb_create_dp_vld              ),
  .wmb_vb_create_gateclk_en           (wmb_vb_create_gateclk_en          ),
  .wmb_vb_create_req                  (wmb_vb_create_req                 ),
  .wmb_vb_create_vld                  (wmb_vb_create_vld                 ),
  .wmb_vb_inv                         (wmb_vb_inv                        ),
  .wmb_vb_set_way_mode                (wmb_vb_set_way_mode               ),
  .wmb_write_ptr                      (wmb_write_ptr                     ),
  .wmb_write_ptr_encode               (wmb_write_ptr_encode              ),
  .wmb_write_req_addr                 (wmb_write_req_addr                ),
  .wmb_write_req_icc                  (wmb_write_req_icc                 )
);

// &Instance("ct_lsu_wmb_ce","x_ct_lsu_wmb_ce"); @109
ct_lsu_wmb_ce  x_ct_lsu_wmb_ce (
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .lm_sq_sc_fail                     (lm_sq_sc_fail                    ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .rb_wmb_ce_hit_idx                 (rb_wmb_ce_hit_idx                ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_atomic                     (sq_pop_atomic                    ),
  .sq_pop_bytes_vld                  (sq_pop_bytes_vld                 ),
  .sq_pop_icc                        (sq_pop_icc                       ),
  .sq_pop_inst_flush                 (sq_pop_inst_flush                ),
  .sq_pop_inst_mode                  (sq_pop_inst_mode                 ),
  .sq_pop_inst_size                  (sq_pop_inst_size                 ),
  .sq_pop_inst_type                  (sq_pop_inst_type                 ),
  .sq_pop_page_buf                   (sq_pop_page_buf                  ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_sec                   (sq_pop_page_sec                  ),
  .sq_pop_page_share                 (sq_pop_page_share                ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .sq_pop_page_wa                    (sq_pop_page_wa                   ),
  .sq_pop_priv_mode                  (sq_pop_priv_mode                 ),
  .sq_pop_ptr                        (sq_pop_ptr                       ),
  .sq_pop_sync_fence                 (sq_pop_sync_fence                ),
  .sq_pop_wo_st                      (sq_pop_wo_st                     ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_atomic                     (wmb_ce_atomic                    ),
  .wmb_ce_bytes_vld                  (wmb_ce_bytes_vld                 ),
  .wmb_ce_bytes_vld_full             (wmb_ce_bytes_vld_full            ),
  .wmb_ce_ca_st_inst                 (wmb_ce_ca_st_inst                ),
  .wmb_ce_create_dp_vld              (wmb_ce_create_dp_vld             ),
  .wmb_ce_create_gateclk_en          (wmb_ce_create_gateclk_en         ),
  .wmb_ce_create_hit_rb_idx          (wmb_ce_create_hit_rb_idx         ),
  .wmb_ce_create_merge               (wmb_ce_create_merge              ),
  .wmb_ce_create_merge_ptr           (wmb_ce_create_merge_ptr          ),
  .wmb_ce_create_same_dcache_line    (wmb_ce_create_same_dcache_line   ),
  .wmb_ce_create_stall               (wmb_ce_create_stall              ),
  .wmb_ce_create_vld                 (wmb_ce_create_vld                ),
  .wmb_ce_create_wmb_data_req        (wmb_ce_create_wmb_data_req       ),
  .wmb_ce_create_wmb_dp_req          (wmb_ce_create_wmb_dp_req         ),
  .wmb_ce_create_wmb_gateclk_en      (wmb_ce_create_wmb_gateclk_en     ),
  .wmb_ce_create_wmb_req             (wmb_ce_create_wmb_req            ),
  .wmb_ce_data_vld                   (wmb_ce_data_vld                  ),
  .wmb_ce_dcache_inst                (wmb_ce_dcache_inst               ),
  .wmb_ce_dcache_share               (wmb_ce_dcache_share              ),
  .wmb_ce_dcache_sw_inst             (wmb_ce_dcache_sw_inst            ),
  .wmb_ce_dcache_valid               (wmb_ce_dcache_valid              ),
  .wmb_ce_hit_sq_pop_dcache_line     (wmb_ce_hit_sq_pop_dcache_line    ),
  .wmb_ce_icc                        (wmb_ce_icc                       ),
  .wmb_ce_inst_flush                 (wmb_ce_inst_flush                ),
  .wmb_ce_inst_mode                  (wmb_ce_inst_mode                 ),
  .wmb_ce_inst_size                  (wmb_ce_inst_size                 ),
  .wmb_ce_inst_type                  (wmb_ce_inst_type                 ),
  .wmb_ce_merge_data_addr_hit        (wmb_ce_merge_data_addr_hit       ),
  .wmb_ce_merge_data_stall           (wmb_ce_merge_data_stall          ),
  .wmb_ce_merge_en                   (wmb_ce_merge_en                  ),
  .wmb_ce_merge_ptr                  (wmb_ce_merge_ptr                 ),
  .wmb_ce_merge_wmb_req              (wmb_ce_merge_wmb_req             ),
  .wmb_ce_merge_wmb_wait_not_vld_req (wmb_ce_merge_wmb_wait_not_vld_req),
  .wmb_ce_page_buf                   (wmb_ce_page_buf                  ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_sec                   (wmb_ce_page_sec                  ),
  .wmb_ce_page_share                 (wmb_ce_page_share                ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_ce_page_wa                    (wmb_ce_page_wa                   ),
  .wmb_ce_pop_vld                    (wmb_ce_pop_vld                   ),
  .wmb_ce_priv_mode                  (wmb_ce_priv_mode                 ),
  .wmb_ce_read_dp_req                (wmb_ce_read_dp_req               ),
  .wmb_ce_same_dcache_line           (wmb_ce_same_dcache_line          ),
  .wmb_ce_sc_wb_vld                  (wmb_ce_sc_wb_vld                 ),
  .wmb_ce_sq_ptr                     (wmb_ce_sq_ptr                    ),
  .wmb_ce_sync_fence                 (wmb_ce_sync_fence                ),
  .wmb_ce_vld                        (wmb_ce_vld                       ),
  .wmb_ce_wb_cmplt_success           (wmb_ce_wb_cmplt_success          ),
  .wmb_ce_wb_data_success            (wmb_ce_wb_data_success           ),
  .wmb_ce_write_biu_dp_req           (wmb_ce_write_biu_dp_req          ),
  .wmb_ce_write_imme                 (wmb_ce_write_imme                ),
  .wmb_clk                           (wmb_clk                          ),
  .wmb_entry_vld                     (wmb_entry_vld                    )
);


//==========================================================
//                       WB Stage
//==========================================================
// &Instance("ct_lsu_ld_wb","x_ct_lsu_ld_wb"); @114
ct_lsu_ld_wb  x_ct_lsu_ld_wb (
  .cp0_lsu_icg_en                      (cp0_lsu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .ctrl_ld_clk                         (ctrl_ld_clk                        ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .had_lsu_bus_trace_en                (had_lsu_bus_trace_en               ),
  .had_lsu_dbg_en                      (had_lsu_dbg_en                     ),
  .ld_da_addr                          (ld_da_addr                         ),
  .ld_da_bkpta_data                    (ld_da_bkpta_data                   ),
  .ld_da_bkptb_data                    (ld_da_bkptb_data                   ),
  .ld_da_iid                           (ld_da_iid                          ),
  .ld_da_inst_vfls                     (ld_da_inst_vfls                    ),
  .ld_da_inst_vld                      (ld_da_inst_vld                     ),
  .ld_da_preg                          (ld_da_preg                         ),
  .ld_da_preg_sign_sel                 (ld_da_preg_sign_sel                ),
  .ld_da_vreg                          (ld_da_vreg                         ),
  .ld_da_wb_cmplt_req                  (ld_da_wb_cmplt_req                 ),
  .ld_da_wb_data                       (ld_da_wb_data                      ),
  .ld_da_wb_data_req                   (ld_da_wb_data_req                  ),
  .ld_da_wb_data_req_gateclk_en        (ld_da_wb_data_req_gateclk_en       ),
  .ld_da_wb_expt_vec                   (ld_da_wb_expt_vec                  ),
  .ld_da_wb_expt_vld                   (ld_da_wb_expt_vld                  ),
  .ld_da_wb_mt_value                   (ld_da_wb_mt_value                  ),
  .ld_da_wb_no_spec_hit                (ld_da_wb_no_spec_hit               ),
  .ld_da_wb_no_spec_mispred            (ld_da_wb_no_spec_mispred           ),
  .ld_da_wb_no_spec_miss               (ld_da_wb_no_spec_miss              ),
  .ld_da_wb_spec_fail                  (ld_da_wb_spec_fail                 ),
  .ld_da_wb_vreg_sign_sel              (ld_da_wb_vreg_sign_sel             ),
  .ld_wb_data_vld                      (ld_wb_data_vld                     ),
  .ld_wb_inst_vld                      (ld_wb_inst_vld                     ),
  .ld_wb_rb_cmplt_grnt                 (ld_wb_rb_cmplt_grnt                ),
  .ld_wb_rb_data_grnt                  (ld_wb_rb_data_grnt                 ),
  .ld_wb_wmb_data_grnt                 (ld_wb_wmb_data_grnt                ),
  .lsu_had_ld_addr                     (lsu_had_ld_addr                    ),
  .lsu_had_ld_data                     (lsu_had_ld_data                    ),
  .lsu_had_ld_iid                      (lsu_had_ld_iid                     ),
  .lsu_had_ld_req                      (lsu_had_ld_req                     ),
  .lsu_had_ld_type                     (lsu_had_ld_type                    ),
  .lsu_idu_wb_pipe3_fwd_vreg           (lsu_idu_wb_pipe3_fwd_vreg          ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld       (lsu_idu_wb_pipe3_fwd_vreg_vld      ),
  .lsu_idu_wb_pipe3_wb_preg            (lsu_idu_wb_pipe3_wb_preg           ),
  .lsu_idu_wb_pipe3_wb_preg_data       (lsu_idu_wb_pipe3_wb_preg_data      ),
  .lsu_idu_wb_pipe3_wb_preg_dup0       (lsu_idu_wb_pipe3_wb_preg_dup0      ),
  .lsu_idu_wb_pipe3_wb_preg_dup1       (lsu_idu_wb_pipe3_wb_preg_dup1      ),
  .lsu_idu_wb_pipe3_wb_preg_dup2       (lsu_idu_wb_pipe3_wb_preg_dup2      ),
  .lsu_idu_wb_pipe3_wb_preg_dup3       (lsu_idu_wb_pipe3_wb_preg_dup3      ),
  .lsu_idu_wb_pipe3_wb_preg_dup4       (lsu_idu_wb_pipe3_wb_preg_dup4      ),
  .lsu_idu_wb_pipe3_wb_preg_expand     (lsu_idu_wb_pipe3_wb_preg_expand    ),
  .lsu_idu_wb_pipe3_wb_preg_vld        (lsu_idu_wb_pipe3_wb_preg_vld       ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup0   (lsu_idu_wb_pipe3_wb_preg_vld_dup0  ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup1   (lsu_idu_wb_pipe3_wb_preg_vld_dup1  ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup2   (lsu_idu_wb_pipe3_wb_preg_vld_dup2  ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup3   (lsu_idu_wb_pipe3_wb_preg_vld_dup3  ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dup4   (lsu_idu_wb_pipe3_wb_preg_vld_dup4  ),
  .lsu_idu_wb_pipe3_wb_vreg_dup0       (lsu_idu_wb_pipe3_wb_vreg_dup0      ),
  .lsu_idu_wb_pipe3_wb_vreg_dup1       (lsu_idu_wb_pipe3_wb_vreg_dup1      ),
  .lsu_idu_wb_pipe3_wb_vreg_dup2       (lsu_idu_wb_pipe3_wb_vreg_dup2      ),
  .lsu_idu_wb_pipe3_wb_vreg_dup3       (lsu_idu_wb_pipe3_wb_vreg_dup3      ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_data    (lsu_idu_wb_pipe3_wb_vreg_fr_data   ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_expand  (lsu_idu_wb_pipe3_wb_vreg_fr_expand ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_vld     (lsu_idu_wb_pipe3_wb_vreg_fr_vld    ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup0   (lsu_idu_wb_pipe3_wb_vreg_vld_dup0  ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup1   (lsu_idu_wb_pipe3_wb_vreg_vld_dup1  ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup2   (lsu_idu_wb_pipe3_wb_vreg_vld_dup2  ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dup3   (lsu_idu_wb_pipe3_wb_vreg_vld_dup3  ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_data   (lsu_idu_wb_pipe3_wb_vreg_vr0_data  ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_expand (lsu_idu_wb_pipe3_wb_vreg_vr0_expand),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_vld    (lsu_idu_wb_pipe3_wb_vreg_vr0_vld   ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_data   (lsu_idu_wb_pipe3_wb_vreg_vr1_data  ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_expand (lsu_idu_wb_pipe3_wb_vreg_vr1_expand),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_vld    (lsu_idu_wb_pipe3_wb_vreg_vr1_vld   ),
  .lsu_rtu_async_expt_addr             (lsu_rtu_async_expt_addr            ),
  .lsu_rtu_async_expt_vld              (lsu_rtu_async_expt_vld             ),
  .lsu_rtu_wb_pipe3_abnormal           (lsu_rtu_wb_pipe3_abnormal          ),
  .lsu_rtu_wb_pipe3_bkpta_data         (lsu_rtu_wb_pipe3_bkpta_data        ),
  .lsu_rtu_wb_pipe3_bkptb_data         (lsu_rtu_wb_pipe3_bkptb_data        ),
  .lsu_rtu_wb_pipe3_cmplt              (lsu_rtu_wb_pipe3_cmplt             ),
  .lsu_rtu_wb_pipe3_expt_vec           (lsu_rtu_wb_pipe3_expt_vec          ),
  .lsu_rtu_wb_pipe3_expt_vld           (lsu_rtu_wb_pipe3_expt_vld          ),
  .lsu_rtu_wb_pipe3_flush              (lsu_rtu_wb_pipe3_flush             ),
  .lsu_rtu_wb_pipe3_iid                (lsu_rtu_wb_pipe3_iid               ),
  .lsu_rtu_wb_pipe3_mtval              (lsu_rtu_wb_pipe3_mtval             ),
  .lsu_rtu_wb_pipe3_no_spec_hit        (lsu_rtu_wb_pipe3_no_spec_hit       ),
  .lsu_rtu_wb_pipe3_no_spec_mispred    (lsu_rtu_wb_pipe3_no_spec_mispred   ),
  .lsu_rtu_wb_pipe3_no_spec_miss       (lsu_rtu_wb_pipe3_no_spec_miss      ),
  .lsu_rtu_wb_pipe3_spec_fail          (lsu_rtu_wb_pipe3_spec_fail         ),
  .lsu_rtu_wb_pipe3_wb_preg_expand     (lsu_rtu_wb_pipe3_wb_preg_expand    ),
  .lsu_rtu_wb_pipe3_wb_preg_vld        (lsu_rtu_wb_pipe3_wb_preg_vld       ),
  .lsu_rtu_wb_pipe3_wb_vreg_expand     (lsu_rtu_wb_pipe3_wb_vreg_expand    ),
  .lsu_rtu_wb_pipe3_wb_vreg_fr_vld     (lsu_rtu_wb_pipe3_wb_vreg_fr_vld    ),
  .lsu_rtu_wb_pipe3_wb_vreg_vr_vld     (lsu_rtu_wb_pipe3_wb_vreg_vr_vld    ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .rb_ld_wb_bkpta_data                 (rb_ld_wb_bkpta_data                ),
  .rb_ld_wb_bkptb_data                 (rb_ld_wb_bkptb_data                ),
  .rb_ld_wb_bus_err                    (rb_ld_wb_bus_err                   ),
  .rb_ld_wb_bus_err_addr               (rb_ld_wb_bus_err_addr              ),
  .rb_ld_wb_cmplt_req                  (rb_ld_wb_cmplt_req                 ),
  .rb_ld_wb_data                       (rb_ld_wb_data                      ),
  .rb_ld_wb_data_iid                   (rb_ld_wb_data_iid                  ),
  .rb_ld_wb_data_req                   (rb_ld_wb_data_req                  ),
  .rb_ld_wb_expt_gateclk               (rb_ld_wb_expt_gateclk              ),
  .rb_ld_wb_expt_vld                   (rb_ld_wb_expt_vld                  ),
  .rb_ld_wb_iid                        (rb_ld_wb_iid                       ),
  .rb_ld_wb_inst_vfls                  (rb_ld_wb_inst_vfls                 ),
  .rb_ld_wb_preg                       (rb_ld_wb_preg                      ),
  .rb_ld_wb_preg_sign_sel              (rb_ld_wb_preg_sign_sel             ),
  .rb_ld_wb_vreg                       (rb_ld_wb_vreg                      ),
  .rb_ld_wb_vreg_sign_sel              (rb_ld_wb_vreg_sign_sel             ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .vmb_ld_wb_data_req                  (vmb_ld_wb_data_req                 ),
  .wmb_ld_wb_data                      (wmb_ld_wb_data                     ),
  .wmb_ld_wb_data_addr                 (wmb_ld_wb_data_addr                ),
  .wmb_ld_wb_data_iid                  (wmb_ld_wb_data_iid                 ),
  .wmb_ld_wb_data_req                  (wmb_ld_wb_data_req                 ),
  .wmb_ld_wb_inst_vfls                 (wmb_ld_wb_inst_vfls                ),
  .wmb_ld_wb_preg                      (wmb_ld_wb_preg                     ),
  .wmb_ld_wb_preg_sign_sel             (wmb_ld_wb_preg_sign_sel            ),
  .wmb_ld_wb_vreg                      (wmb_ld_wb_vreg                     ),
  .wmb_ld_wb_vreg_sign_sel             (wmb_ld_wb_vreg_sign_sel            )
);

// &Instance("ct_lsu_st_wb","x_ct_lsu_st_wb"); @115
ct_lsu_st_wb  x_ct_lsu_st_wb (
  .cp0_lsu_icg_en                   (cp0_lsu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .ctrl_st_clk                      (ctrl_st_clk                     ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .lsu_rtu_wb_pipe4_abnormal        (lsu_rtu_wb_pipe4_abnormal       ),
  .lsu_rtu_wb_pipe4_bkpta_data      (lsu_rtu_wb_pipe4_bkpta_data     ),
  .lsu_rtu_wb_pipe4_bkptb_data      (lsu_rtu_wb_pipe4_bkptb_data     ),
  .lsu_rtu_wb_pipe4_cmplt           (lsu_rtu_wb_pipe4_cmplt          ),
  .lsu_rtu_wb_pipe4_expt_vec        (lsu_rtu_wb_pipe4_expt_vec       ),
  .lsu_rtu_wb_pipe4_expt_vld        (lsu_rtu_wb_pipe4_expt_vld       ),
  .lsu_rtu_wb_pipe4_flush           (lsu_rtu_wb_pipe4_flush          ),
  .lsu_rtu_wb_pipe4_iid             (lsu_rtu_wb_pipe4_iid            ),
  .lsu_rtu_wb_pipe4_mtval           (lsu_rtu_wb_pipe4_mtval          ),
  .lsu_rtu_wb_pipe4_no_spec_hit     (lsu_rtu_wb_pipe4_no_spec_hit    ),
  .lsu_rtu_wb_pipe4_no_spec_mispred (lsu_rtu_wb_pipe4_no_spec_mispred),
  .lsu_rtu_wb_pipe4_no_spec_miss    (lsu_rtu_wb_pipe4_no_spec_miss   ),
  .lsu_rtu_wb_pipe4_spec_fail       (lsu_rtu_wb_pipe4_spec_fail      ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .rtu_yy_xx_flush                  (rtu_yy_xx_flush                 ),
  .st_da_bkpta_data                 (st_da_bkpta_data                ),
  .st_da_bkptb_data                 (st_da_bkptb_data                ),
  .st_da_iid                        (st_da_iid                       ),
  .st_da_inst_vld                   (st_da_inst_vld                  ),
  .st_da_wb_cmplt_req               (st_da_wb_cmplt_req              ),
  .st_da_wb_expt_vec                (st_da_wb_expt_vec               ),
  .st_da_wb_expt_vld                (st_da_wb_expt_vld               ),
  .st_da_wb_mt_value                (st_da_wb_mt_value               ),
  .st_da_wb_no_spec_hit             (st_da_wb_no_spec_hit            ),
  .st_da_wb_no_spec_mispred         (st_da_wb_no_spec_mispred        ),
  .st_da_wb_no_spec_miss            (st_da_wb_no_spec_miss           ),
  .st_da_wb_spec_fail               (st_da_wb_spec_fail              ),
  .st_wb_inst_vld                   (st_wb_inst_vld                  ),
  .st_wb_wmb_cmplt_grnt             (st_wb_wmb_cmplt_grnt            ),
  .wmb_st_wb_bkpta_data             (wmb_st_wb_bkpta_data            ),
  .wmb_st_wb_bkptb_data             (wmb_st_wb_bkptb_data            ),
  .wmb_st_wb_cmplt_req              (wmb_st_wb_cmplt_req             ),
  .wmb_st_wb_iid                    (wmb_st_wb_iid                   ),
  .wmb_st_wb_inst_flush             (wmb_st_wb_inst_flush            ),
  .wmb_st_wb_spec_fail              (wmb_st_wb_spec_fail             )
);


//==========================================================
//                Linefill/Victim buffer
//==========================================================
// &Instance("ct_lsu_lfb","x_ct_lsu_lfb"); @120
ct_lsu_lfb  x_ct_lsu_lfb (
  .biu_lsu_r_data                     (biu_lsu_r_data                    ),
  .biu_lsu_r_id                       (biu_lsu_r_id                      ),
  .biu_lsu_r_last                     (biu_lsu_r_last                    ),
  .biu_lsu_r_resp                     (biu_lsu_r_resp                    ),
  .biu_lsu_r_vld                      (biu_lsu_r_vld                     ),
  .bus_arb_pfu_ar_sel                 (bus_arb_pfu_ar_sel                ),
  .bus_arb_rb_ar_sel                  (bus_arb_rb_ar_sel                 ),
  .cp0_lsu_dcache_en                  (cp0_lsu_dcache_en                 ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .dcache_arb_lfb_ld_grnt             (dcache_arb_lfb_ld_grnt            ),
  .ld_da_idx                          (ld_da_idx                         ),
  .ld_da_lfb_discard_grnt             (ld_da_lfb_discard_grnt            ),
  .ld_da_lfb_set_wakeup_queue         (ld_da_lfb_set_wakeup_queue        ),
  .ld_da_lfb_wakeup_queue_next        (ld_da_lfb_wakeup_queue_next       ),
  .ld_hit_prefetch                    (ld_hit_prefetch                   ),
  .lfb_addr_full                      (lfb_addr_full                     ),
  .lfb_addr_less2                     (lfb_addr_less2                    ),
  .lfb_dcache_arb_ld_data_gateclk_en  (lfb_dcache_arb_ld_data_gateclk_en ),
  .lfb_dcache_arb_ld_data_high_din    (lfb_dcache_arb_ld_data_high_din   ),
  .lfb_dcache_arb_ld_data_idx         (lfb_dcache_arb_ld_data_idx        ),
  .lfb_dcache_arb_ld_data_low_din     (lfb_dcache_arb_ld_data_low_din    ),
  .lfb_dcache_arb_ld_req              (lfb_dcache_arb_ld_req             ),
  .lfb_dcache_arb_ld_tag_din          (lfb_dcache_arb_ld_tag_din         ),
  .lfb_dcache_arb_ld_tag_gateclk_en   (lfb_dcache_arb_ld_tag_gateclk_en  ),
  .lfb_dcache_arb_ld_tag_idx          (lfb_dcache_arb_ld_tag_idx         ),
  .lfb_dcache_arb_ld_tag_req          (lfb_dcache_arb_ld_tag_req         ),
  .lfb_dcache_arb_ld_tag_wen          (lfb_dcache_arb_ld_tag_wen         ),
  .lfb_dcache_arb_serial_req          (lfb_dcache_arb_serial_req         ),
  .lfb_dcache_arb_st_dirty_din        (lfb_dcache_arb_st_dirty_din       ),
  .lfb_dcache_arb_st_dirty_gateclk_en (lfb_dcache_arb_st_dirty_gateclk_en),
  .lfb_dcache_arb_st_dirty_idx        (lfb_dcache_arb_st_dirty_idx       ),
  .lfb_dcache_arb_st_dirty_req        (lfb_dcache_arb_st_dirty_req       ),
  .lfb_dcache_arb_st_dirty_wen        (lfb_dcache_arb_st_dirty_wen       ),
  .lfb_dcache_arb_st_req              (lfb_dcache_arb_st_req             ),
  .lfb_dcache_arb_st_tag_din          (lfb_dcache_arb_st_tag_din         ),
  .lfb_dcache_arb_st_tag_gateclk_en   (lfb_dcache_arb_st_tag_gateclk_en  ),
  .lfb_dcache_arb_st_tag_idx          (lfb_dcache_arb_st_tag_idx         ),
  .lfb_dcache_arb_st_tag_req          (lfb_dcache_arb_st_tag_req         ),
  .lfb_dcache_arb_st_tag_wen          (lfb_dcache_arb_st_tag_wen         ),
  .lfb_depd_wakeup                    (lfb_depd_wakeup                   ),
  .lfb_empty                          (lfb_empty                         ),
  .lfb_ld_da_hit_idx                  (lfb_ld_da_hit_idx                 ),
  .lfb_mcic_wakeup                    (lfb_mcic_wakeup                   ),
  .lfb_pfu_biu_req_hit_idx            (lfb_pfu_biu_req_hit_idx           ),
  .lfb_pfu_create_id                  (lfb_pfu_create_id                 ),
  .lfb_pfu_dcache_hit                 (lfb_pfu_dcache_hit                ),
  .lfb_pfu_dcache_miss                (lfb_pfu_dcache_miss               ),
  .lfb_pfu_rready_grnt                (lfb_pfu_rready_grnt               ),
  .lfb_pop_depd_ff                    (lfb_pop_depd_ff                   ),
  .lfb_rb_biu_req_hit_idx             (lfb_rb_biu_req_hit_idx            ),
  .lfb_rb_ca_rready_grnt              (lfb_rb_ca_rready_grnt             ),
  .lfb_rb_create_id                   (lfb_rb_create_id                  ),
  .lfb_rb_nc_rready_grnt              (lfb_rb_nc_rready_grnt             ),
  .lfb_snq_bypass_data_id             (lfb_snq_bypass_data_id            ),
  .lfb_snq_bypass_hit                 (lfb_snq_bypass_hit                ),
  .lfb_snq_bypass_share               (lfb_snq_bypass_share              ),
  .lfb_st_da_hit_idx                  (lfb_st_da_hit_idx                 ),
  .lfb_vb_addr_tto6                   (lfb_vb_addr_tto6                  ),
  .lfb_vb_create_dp_vld               (lfb_vb_create_dp_vld              ),
  .lfb_vb_create_gateclk_en           (lfb_vb_create_gateclk_en          ),
  .lfb_vb_create_req                  (lfb_vb_create_req                 ),
  .lfb_vb_create_vld                  (lfb_vb_create_vld                 ),
  .lfb_vb_id                          (lfb_vb_id                         ),
  .lfb_wmb_read_req_hit_idx           (lfb_wmb_read_req_hit_idx          ),
  .lfb_wmb_write_req_hit_idx          (lfb_wmb_write_req_hit_idx         ),
  .lm_already_snoop                   (lm_already_snoop                  ),
  .lm_lfb_depd_wakeup                 (lm_lfb_depd_wakeup                ),
  .lm_state_is_amo_lock               (lm_state_is_amo_lock              ),
  .lsu_biu_r_linefill_ready           (lsu_biu_r_linefill_ready          ),
  .lsu_had_lfb_addr_entry_dcache_hit  (lsu_had_lfb_addr_entry_dcache_hit ),
  .lsu_had_lfb_addr_entry_rcl_done    (lsu_had_lfb_addr_entry_rcl_done   ),
  .lsu_had_lfb_addr_entry_vld         (lsu_had_lfb_addr_entry_vld        ),
  .lsu_had_lfb_data_entry_last        (lsu_had_lfb_data_entry_last       ),
  .lsu_had_lfb_data_entry_vld         (lsu_had_lfb_data_entry_vld        ),
  .lsu_had_lfb_lf_sm_vld              (lsu_had_lfb_lf_sm_vld             ),
  .lsu_had_lfb_wakeup_queue           (lsu_had_lfb_wakeup_queue          ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_biu_req_addr                   (pfu_biu_req_addr                  ),
  .pfu_lfb_create_dp_vld              (pfu_lfb_create_dp_vld             ),
  .pfu_lfb_create_gateclk_en          (pfu_lfb_create_gateclk_en         ),
  .pfu_lfb_create_req                 (pfu_lfb_create_req                ),
  .pfu_lfb_create_vld                 (pfu_lfb_create_vld                ),
  .pfu_lfb_id                         (pfu_lfb_id                        ),
  .rb_biu_req_addr                    (rb_biu_req_addr                   ),
  .rb_lfb_addr_tto4                   (rb_lfb_addr_tto4                  ),
  .rb_lfb_atomic                      (rb_lfb_atomic                     ),
  .rb_lfb_boundary_depd_wakeup        (rb_lfb_boundary_depd_wakeup       ),
  .rb_lfb_create_dp_vld               (rb_lfb_create_dp_vld              ),
  .rb_lfb_create_gateclk_en           (rb_lfb_create_gateclk_en          ),
  .rb_lfb_create_req                  (rb_lfb_create_req                 ),
  .rb_lfb_create_vld                  (rb_lfb_create_vld                 ),
  .rb_lfb_depd                        (rb_lfb_depd                       ),
  .rb_lfb_ldamo                       (rb_lfb_ldamo                      ),
  .rtu_yy_xx_flush                    (rtu_yy_xx_flush                   ),
  .snq_bypass_addr_tto6               (snq_bypass_addr_tto6              ),
  .snq_create_lfb_vb_req_hit_idx      (snq_create_lfb_vb_req_hit_idx     ),
  .snq_lfb_bypass_chg_tag             (snq_lfb_bypass_chg_tag            ),
  .snq_lfb_bypass_invalid             (snq_lfb_bypass_invalid            ),
  .snq_lfb_vb_req_hit_idx             (snq_lfb_vb_req_hit_idx            ),
  .st_da_addr                         (st_da_addr                        ),
  .vb_lfb_addr_entry_rcl_done         (vb_lfb_addr_entry_rcl_done        ),
  .vb_lfb_create_grnt                 (vb_lfb_create_grnt                ),
  .vb_lfb_dcache_dirty                (vb_lfb_dcache_dirty               ),
  .vb_lfb_dcache_hit                  (vb_lfb_dcache_hit                 ),
  .vb_lfb_dcache_way                  (vb_lfb_dcache_way                 ),
  .vb_lfb_rcl_done                    (vb_lfb_rcl_done                   ),
  .vb_lfb_vb_req_hit_idx              (vb_lfb_vb_req_hit_idx             ),
  .wmb_read_req_addr                  (wmb_read_req_addr                 ),
  .wmb_write_req_addr                 (wmb_write_req_addr                )
);

// &Instance("ct_lsu_vb","x_ct_lsu_vb"); @121
ct_lsu_vb  x_ct_lsu_vb (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .bus_arb_vb_aw_grnt                (bus_arb_vb_aw_grnt               ),
  .bus_arb_vb_w_grnt                 (bus_arb_vb_w_grnt                ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .dcache_arb_vb_ld_grnt             (dcache_arb_vb_ld_grnt            ),
  .dcache_arb_vb_st_grnt             (dcache_arb_vb_st_grnt            ),
  .icc_vb_addr_tto6                  (icc_vb_addr_tto6                 ),
  .icc_vb_create_dp_vld              (icc_vb_create_dp_vld             ),
  .icc_vb_create_gateclk_en          (icc_vb_create_gateclk_en         ),
  .icc_vb_create_req                 (icc_vb_create_req                ),
  .icc_vb_create_vld                 (icc_vb_create_vld                ),
  .icc_vb_inv                        (icc_vb_inv                       ),
  .ld_da_vb_snq_data_reissue         (ld_da_vb_snq_data_reissue        ),
  .lfb_vb_addr_tto6                  (lfb_vb_addr_tto6                 ),
  .lfb_vb_create_dp_vld              (lfb_vb_create_dp_vld             ),
  .lfb_vb_create_gateclk_en          (lfb_vb_create_gateclk_en         ),
  .lfb_vb_create_req                 (lfb_vb_create_req                ),
  .lfb_vb_create_vld                 (lfb_vb_create_vld                ),
  .lfb_vb_id                         (lfb_vb_id                        ),
  .lsu_had_vb_addr_entry_vld         (lsu_had_vb_addr_entry_vld        ),
  .lsu_had_vb_data_entry_vld         (lsu_had_vb_data_entry_vld        ),
  .lsu_had_vb_rcl_sm_state           (lsu_had_vb_rcl_sm_state          ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_req_addr                   (rb_biu_req_addr                  ),
  .snq_bypass_addr_tto6              (snq_bypass_addr_tto6             ),
  .snq_create_addr                   (snq_create_addr                  ),
  .snq_data_bypass_hit               (snq_data_bypass_hit              ),
  .snq_depd_vb_id                    (snq_depd_vb_id                   ),
  .snq_vb_bypass_check               (snq_vb_bypass_check              ),
  .st_da_dcache_dirty                (st_da_dcache_dirty               ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_dcache_miss                 (st_da_dcache_miss                ),
  .st_da_dcache_replace_dirty        (st_da_dcache_replace_dirty       ),
  .st_da_dcache_replace_valid        (st_da_dcache_replace_valid       ),
  .st_da_dcache_replace_way          (st_da_dcache_replace_way         ),
  .st_da_dcache_way                  (st_da_dcache_way                 ),
  .st_da_vb_ecc_err                  (st_da_vb_ecc_err                 ),
  .st_da_vb_ecc_stall                (st_da_vb_ecc_stall               ),
  .st_da_vb_feedback_addr_tto14      (st_da_vb_feedback_addr_tto14     ),
  .st_da_vb_tag_reissue              (st_da_vb_tag_reissue             ),
  .vb_biu_aw_addr                    (vb_biu_aw_addr                   ),
  .vb_biu_aw_bar                     (vb_biu_aw_bar                    ),
  .vb_biu_aw_burst                   (vb_biu_aw_burst                  ),
  .vb_biu_aw_cache                   (vb_biu_aw_cache                  ),
  .vb_biu_aw_domain                  (vb_biu_aw_domain                 ),
  .vb_biu_aw_dp_req                  (vb_biu_aw_dp_req                 ),
  .vb_biu_aw_id                      (vb_biu_aw_id                     ),
  .vb_biu_aw_len                     (vb_biu_aw_len                    ),
  .vb_biu_aw_lock                    (vb_biu_aw_lock                   ),
  .vb_biu_aw_prot                    (vb_biu_aw_prot                   ),
  .vb_biu_aw_req                     (vb_biu_aw_req                    ),
  .vb_biu_aw_req_gateclk_en          (vb_biu_aw_req_gateclk_en         ),
  .vb_biu_aw_size                    (vb_biu_aw_size                   ),
  .vb_biu_aw_snoop                   (vb_biu_aw_snoop                  ),
  .vb_biu_aw_unique                  (vb_biu_aw_unique                 ),
  .vb_biu_aw_user                    (vb_biu_aw_user                   ),
  .vb_biu_w_data                     (vb_biu_w_data                    ),
  .vb_biu_w_id                       (vb_biu_w_id                      ),
  .vb_biu_w_last                     (vb_biu_w_last                    ),
  .vb_biu_w_req                      (vb_biu_w_req                     ),
  .vb_biu_w_strb                     (vb_biu_w_strb                    ),
  .vb_biu_w_vld                      (vb_biu_w_vld                     ),
  .vb_data_entry_addr_id_0           (vb_data_entry_addr_id_0          ),
  .vb_data_entry_addr_id_1           (vb_data_entry_addr_id_1          ),
  .vb_data_entry_addr_id_2           (vb_data_entry_addr_id_2          ),
  .vb_data_entry_biu_req             (vb_data_entry_biu_req            ),
  .vb_data_entry_biu_req_success     (vb_data_entry_biu_req_success    ),
  .vb_data_entry_bypass_pop          (vb_data_entry_bypass_pop         ),
  .vb_data_entry_create_dp_vld       (vb_data_entry_create_dp_vld      ),
  .vb_data_entry_create_gateclk_en   (vb_data_entry_create_gateclk_en  ),
  .vb_data_entry_create_vld          (vb_data_entry_create_vld         ),
  .vb_data_entry_dirty               (vb_data_entry_dirty              ),
  .vb_data_entry_inv                 (vb_data_entry_inv                ),
  .vb_data_entry_lfb_create          (vb_data_entry_lfb_create         ),
  .vb_data_entry_normal_pop          (vb_data_entry_normal_pop         ),
  .vb_data_entry_req_success         (vb_data_entry_req_success        ),
  .vb_data_entry_vld                 (vb_data_entry_vld                ),
  .vb_data_entry_wd_sm_grnt          (vb_data_entry_wd_sm_grnt         ),
  .vb_data_entry_wd_sm_req           (vb_data_entry_wd_sm_req          ),
  .vb_data_entry_write_data128_0     (vb_data_entry_write_data128_0    ),
  .vb_data_entry_write_data128_1     (vb_data_entry_write_data128_1    ),
  .vb_data_entry_write_data128_2     (vb_data_entry_write_data128_2    ),
  .vb_dcache_arb_borrow_addr         (vb_dcache_arb_borrow_addr        ),
  .vb_dcache_arb_data_way            (vb_dcache_arb_data_way           ),
  .vb_dcache_arb_dcache_replace      (vb_dcache_arb_dcache_replace     ),
  .vb_dcache_arb_ld_borrow_req       (vb_dcache_arb_ld_borrow_req      ),
  .vb_dcache_arb_ld_borrow_req_gate  (vb_dcache_arb_ld_borrow_req_gate ),
  .vb_dcache_arb_ld_data_gateclk_en  (vb_dcache_arb_ld_data_gateclk_en ),
  .vb_dcache_arb_ld_data_idx         (vb_dcache_arb_ld_data_idx        ),
  .vb_dcache_arb_ld_req              (vb_dcache_arb_ld_req             ),
  .vb_dcache_arb_ld_tag_gateclk_en   (vb_dcache_arb_ld_tag_gateclk_en  ),
  .vb_dcache_arb_ld_tag_idx          (vb_dcache_arb_ld_tag_idx         ),
  .vb_dcache_arb_ld_tag_req          (vb_dcache_arb_ld_tag_req         ),
  .vb_dcache_arb_ld_tag_wen          (vb_dcache_arb_ld_tag_wen         ),
  .vb_dcache_arb_serial_req          (vb_dcache_arb_serial_req         ),
  .vb_dcache_arb_set_way_mode        (vb_dcache_arb_set_way_mode       ),
  .vb_dcache_arb_st_borrow_req       (vb_dcache_arb_st_borrow_req      ),
  .vb_dcache_arb_st_dirty_din        (vb_dcache_arb_st_dirty_din       ),
  .vb_dcache_arb_st_dirty_gateclk_en (vb_dcache_arb_st_dirty_gateclk_en),
  .vb_dcache_arb_st_dirty_gwen       (vb_dcache_arb_st_dirty_gwen      ),
  .vb_dcache_arb_st_dirty_idx        (vb_dcache_arb_st_dirty_idx       ),
  .vb_dcache_arb_st_dirty_req        (vb_dcache_arb_st_dirty_req       ),
  .vb_dcache_arb_st_dirty_wen        (vb_dcache_arb_st_dirty_wen       ),
  .vb_dcache_arb_st_req              (vb_dcache_arb_st_req             ),
  .vb_dcache_arb_st_tag_gateclk_en   (vb_dcache_arb_st_tag_gateclk_en  ),
  .vb_dcache_arb_st_tag_idx          (vb_dcache_arb_st_tag_idx         ),
  .vb_dcache_arb_st_tag_req          (vb_dcache_arb_st_tag_req         ),
  .vb_empty                          (vb_empty                         ),
  .vb_icc_create_grnt                (vb_icc_create_grnt               ),
  .vb_invalid_vld                    (vb_invalid_vld                   ),
  .vb_lfb_addr_entry_rcl_done        (vb_lfb_addr_entry_rcl_done       ),
  .vb_lfb_create_grnt                (vb_lfb_create_grnt               ),
  .vb_lfb_dcache_dirty               (vb_lfb_dcache_dirty              ),
  .vb_lfb_dcache_hit                 (vb_lfb_dcache_hit                ),
  .vb_lfb_dcache_way                 (vb_lfb_dcache_way                ),
  .vb_lfb_rcl_done                   (vb_lfb_rcl_done                  ),
  .vb_lfb_vb_req_hit_idx             (vb_lfb_vb_req_hit_idx            ),
  .vb_pfu_biu_req_hit_idx            (vb_pfu_biu_req_hit_idx           ),
  .vb_rb_biu_req_hit_idx             (vb_rb_biu_req_hit_idx            ),
  .vb_rcl_sm_addr_id                 (vb_rcl_sm_addr_id                ),
  .vb_rcl_sm_data_dcache_dirty       (vb_rcl_sm_data_dcache_dirty      ),
  .vb_rcl_sm_data_id                 (vb_rcl_sm_data_id                ),
  .vb_rcl_sm_data_set_data_done      (vb_rcl_sm_data_set_data_done     ),
  .vb_rcl_sm_inv                     (vb_rcl_sm_inv                    ),
  .vb_rcl_sm_lfb_create              (vb_rcl_sm_lfb_create             ),
  .vb_sdb_data_entry_vld             (vb_sdb_data_entry_vld            ),
  .vb_snq_bypass_db_id               (vb_snq_bypass_db_id              ),
  .vb_snq_bypass_hit                 (vb_snq_bypass_hit                ),
  .vb_snq_depd                       (vb_snq_depd                      ),
  .vb_snq_depd_remove                (vb_snq_depd_remove               ),
  .vb_snq_start_hit_idx              (vb_snq_start_hit_idx             ),
  .vb_snq_wait_remove                (vb_snq_wait_remove               ),
  .vb_snq_wait_vb_id                 (vb_snq_wait_vb_id                ),
  .vb_wd_sm_data_bias                (vb_wd_sm_data_bias               ),
  .vb_wd_sm_data_pop_req             (vb_wd_sm_data_pop_req            ),
  .vb_wmb_create_grnt                (vb_wmb_create_grnt               ),
  .vb_wmb_empty                      (vb_wmb_empty                     ),
  .vb_wmb_entry_rcl_done             (vb_wmb_entry_rcl_done            ),
  .vb_wmb_write_req_hit_idx          (vb_wmb_write_req_hit_idx         ),
  .victim_addr                       (victim_addr                      ),
  .wmb_vb_addr_tto6                  (wmb_vb_addr_tto6                 ),
  .wmb_vb_create_dp_vld              (wmb_vb_create_dp_vld             ),
  .wmb_vb_create_gateclk_en          (wmb_vb_create_gateclk_en         ),
  .wmb_vb_create_req                 (wmb_vb_create_req                ),
  .wmb_vb_create_vld                 (wmb_vb_create_vld                ),
  .wmb_vb_inv                        (wmb_vb_inv                       ),
  .wmb_vb_set_way_mode               (wmb_vb_set_way_mode              ),
  .wmb_write_ptr_encode              (wmb_write_ptr_encode             ),
  .wmb_write_req_addr                (wmb_write_req_addr               )
);

// &Instance("ct_lsu_vb_sdb_data","x_ct_lsu_vb_sdb_data"); @122
ct_lsu_vb_sdb_data  x_ct_lsu_vb_sdb_data (
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cpurst_b                        (cpurst_b                       ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .ld_da_data256                   (ld_da_data256                  ),
  .ld_da_vb_borrow_vb              (ld_da_vb_borrow_vb             ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .sdb_create_data_order           (sdb_create_data_order          ),
  .sdb_create_en                   (sdb_create_en                  ),
  .sdb_data_vld                    (sdb_data_vld                   ),
  .sdb_entry_avail                 (sdb_entry_avail                ),
  .sdb_entry_data_0                (sdb_entry_data_0               ),
  .sdb_entry_data_1                (sdb_entry_data_1               ),
  .sdb_entry_data_2                (sdb_entry_data_2               ),
  .sdb_entry_data_index            (sdb_entry_data_index           ),
  .sdb_inv_en                      (sdb_inv_en                     ),
  .sdb_vld                         (sdb_vld                        ),
  .snq_data_bypass_hit             (snq_data_bypass_hit            ),
  .snq_vb_bypass_invalid           (snq_vb_bypass_invalid          ),
  .snq_vb_bypass_readonce          (snq_vb_bypass_readonce         ),
  .snq_vb_bypass_start             (snq_vb_bypass_start            ),
  .vb_data_entry_addr_id_0         (vb_data_entry_addr_id_0        ),
  .vb_data_entry_addr_id_1         (vb_data_entry_addr_id_1        ),
  .vb_data_entry_addr_id_2         (vb_data_entry_addr_id_2        ),
  .vb_data_entry_biu_req           (vb_data_entry_biu_req          ),
  .vb_data_entry_biu_req_success   (vb_data_entry_biu_req_success  ),
  .vb_data_entry_bypass_pop        (vb_data_entry_bypass_pop       ),
  .vb_data_entry_create_dp_vld     (vb_data_entry_create_dp_vld    ),
  .vb_data_entry_create_gateclk_en (vb_data_entry_create_gateclk_en),
  .vb_data_entry_create_vld        (vb_data_entry_create_vld       ),
  .vb_data_entry_dirty             (vb_data_entry_dirty            ),
  .vb_data_entry_inv               (vb_data_entry_inv              ),
  .vb_data_entry_lfb_create        (vb_data_entry_lfb_create       ),
  .vb_data_entry_normal_pop        (vb_data_entry_normal_pop       ),
  .vb_data_entry_req_success       (vb_data_entry_req_success      ),
  .vb_data_entry_vld               (vb_data_entry_vld              ),
  .vb_data_entry_wd_sm_grnt        (vb_data_entry_wd_sm_grnt       ),
  .vb_data_entry_wd_sm_req         (vb_data_entry_wd_sm_req        ),
  .vb_data_entry_write_data128_0   (vb_data_entry_write_data128_0  ),
  .vb_data_entry_write_data128_1   (vb_data_entry_write_data128_1  ),
  .vb_data_entry_write_data128_2   (vb_data_entry_write_data128_2  ),
  .vb_rcl_sm_addr_id               (vb_rcl_sm_addr_id              ),
  .vb_rcl_sm_data_dcache_dirty     (vb_rcl_sm_data_dcache_dirty    ),
  .vb_rcl_sm_data_set_data_done    (vb_rcl_sm_data_set_data_done   ),
  .vb_rcl_sm_inv                   (vb_rcl_sm_inv                  ),
  .vb_rcl_sm_lfb_create            (vb_rcl_sm_lfb_create           ),
  .vb_sdb_data_entry_vld           (vb_sdb_data_entry_vld          ),
  .vb_wd_sm_data_bias              (vb_wd_sm_data_bias             ),
  .vb_wd_sm_data_pop_req           (vb_wd_sm_data_pop_req          )
);


//==========================================================
//                      Snoop
//==========================================================
// &Instance("ct_lsu_snoop_req_arbiter","x_ct_lsu_snoop_req_arbiter"); @127
ct_lsu_snoop_req_arbiter  x_ct_lsu_snoop_req_arbiter (
  .arb_ctcq_ctc_2nd_trans      (arb_ctcq_ctc_2nd_trans     ),
  .arb_ctcq_ctc_asid_va        (arb_ctcq_ctc_asid_va       ),
  .arb_ctcq_ctc_type           (arb_ctcq_ctc_type          ),
  .arb_ctcq_ctc_va_pa          (arb_ctcq_ctc_va_pa         ),
  .arb_ctcq_entry_oldest_index (arb_ctcq_entry_oldest_index),
  .arb_snq_entry_oldest_index  (arb_snq_entry_oldest_index ),
  .arb_snq_snoop_addr          (arb_snq_snoop_addr         ),
  .arb_snq_snoop_depd          (arb_snq_snoop_depd         ),
  .arb_snq_snoop_prot          (arb_snq_snoop_prot         ),
  .arb_snq_snoop_type          (arb_snq_snoop_type         ),
  .biu_lsu_ac_addr             (biu_lsu_ac_addr            ),
  .biu_lsu_ac_prot             (biu_lsu_ac_prot            ),
  .biu_lsu_ac_req              (biu_lsu_ac_req             ),
  .biu_lsu_ac_snoop            (biu_lsu_ac_snoop           ),
  .biu_lsu_cr_resp_acept       (biu_lsu_cr_resp_acept      ),
  .biu_lsu_ctc_req             (biu_lsu_ctc_req            ),
  .cp0_lsu_icg_en              (cp0_lsu_icg_en             ),
  .cpurst_b                    (cpurst_b                   ),
  .ctc_req_create_en           (ctc_req_create_en          ),
  .ctcq_biu_2_cmplt            (ctcq_biu_2_cmplt           ),
  .ctcq_biu_cr_valid           (ctcq_biu_cr_valid          ),
  .cur_ctcq_entry_empty        (cur_ctcq_entry_empty       ),
  .cur_snq_entry_empty         (cur_snq_entry_empty        ),
  .forever_cpuclk              (forever_cpuclk             ),
  .icc_snq_create_permit       (icc_snq_create_permit      ),
  .lm_snq_stall                (lm_snq_stall               ),
  .lsu_biu_ac_empty            (lsu_biu_ac_empty           ),
  .lsu_biu_ac_ready            (lsu_biu_ac_ready           ),
  .lsu_ctcq_not_empty          (lsu_ctcq_not_empty         ),
  .lsu_sdb_not_empty           (lsu_sdb_not_empty          ),
  .lsu_snoop_clk               (lsu_snoop_clk              ),
  .lsu_snq_not_empty           (lsu_snq_not_empty          ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .snoop_req_create_en         (snoop_req_create_en        ),
  .snq_biu_cr_valid            (snq_biu_cr_valid           ),
  .vb_snq_depd                 (vb_snq_depd                ),
  .wmb_snq_depd                (wmb_snq_depd               )
);

// &Instance("ct_lsu_snoop_resp","x_ct_lsu_snoop_resp"); @128
ct_lsu_snoop_resp  x_ct_lsu_snoop_resp (
  .biu_ctcq_cr_ready     (biu_ctcq_cr_ready    ),
  .biu_lsu_cd_ready      (biu_lsu_cd_ready     ),
  .biu_lsu_cr_ready      (biu_lsu_cr_ready     ),
  .biu_lsu_cr_resp_acept (biu_lsu_cr_resp_acept),
  .biu_sdb_cd_ready      (biu_sdb_cd_ready     ),
  .biu_snq_cr_ready      (biu_snq_cr_ready     ),
  .ctcq_biu_cr_resp      (ctcq_biu_cr_resp     ),
  .ctcq_biu_cr_valid     (ctcq_biu_cr_valid    ),
  .lsu_biu_cd_data       (lsu_biu_cd_data      ),
  .lsu_biu_cd_last       (lsu_biu_cd_last      ),
  .lsu_biu_cd_valid      (lsu_biu_cd_valid     ),
  .lsu_biu_cr_resp       (lsu_biu_cr_resp      ),
  .lsu_biu_cr_valid      (lsu_biu_cr_valid     ),
  .sdb_biu_cd_data       (sdb_biu_cd_data      ),
  .sdb_biu_cd_last       (sdb_biu_cd_last      ),
  .sdb_biu_cd_valid      (sdb_biu_cd_valid     ),
  .snq_biu_cr_resp       (snq_biu_cr_resp      ),
  .snq_biu_cr_valid      (snq_biu_cr_valid     )
);

// &Instance("ct_lsu_snoop_ctcq","x_ct_lsu_snoop_ctcq"); @129
ct_lsu_snoop_ctcq  x_ct_lsu_snoop_ctcq (
  .arb_ctcq_ctc_2nd_trans      (arb_ctcq_ctc_2nd_trans     ),
  .arb_ctcq_ctc_asid_va        (arb_ctcq_ctc_asid_va       ),
  .arb_ctcq_ctc_type           (arb_ctcq_ctc_type          ),
  .arb_ctcq_ctc_va_pa          (arb_ctcq_ctc_va_pa         ),
  .arb_ctcq_entry_oldest_index (arb_ctcq_entry_oldest_index),
  .biu_ctcq_cr_ready           (biu_ctcq_cr_ready          ),
  .cp0_lsu_ctc_flush_dis       (cp0_lsu_ctc_flush_dis      ),
  .cp0_lsu_icg_en              (cp0_lsu_icg_en             ),
  .cpurst_b                    (cpurst_b                   ),
  .ctc_req_create_en           (ctc_req_create_en          ),
  .ctcq_biu_2_cmplt            (ctcq_biu_2_cmplt           ),
  .ctcq_biu_cr_resp            (ctcq_biu_cr_resp           ),
  .ctcq_biu_cr_valid           (ctcq_biu_cr_valid          ),
  .cur_ctcq_entry_empty        (cur_ctcq_entry_empty       ),
  .ifu_lsu_icache_inv_done     (ifu_lsu_icache_inv_done    ),
  .lsu_ctcq_not_empty          (lsu_ctcq_not_empty         ),
  .lsu_had_ctcq_entry_2_cmplt  (lsu_had_ctcq_entry_2_cmplt ),
  .lsu_had_ctcq_entry_cmplt    (lsu_had_ctcq_entry_cmplt   ),
  .lsu_had_ctcq_entry_vld      (lsu_had_ctcq_entry_vld     ),
  .lsu_ifu_icache_all_inv      (lsu_ifu_icache_all_inv     ),
  .lsu_ifu_icache_index        (lsu_ifu_icache_index       ),
  .lsu_ifu_icache_line_inv     (lsu_ifu_icache_line_inv    ),
  .lsu_ifu_icache_ptag         (lsu_ifu_icache_ptag        ),
  .lsu_mmu_tlb_all_inv         (lsu_mmu_tlb_all_inv        ),
  .lsu_mmu_tlb_asid            (lsu_mmu_tlb_asid           ),
  .lsu_mmu_tlb_asid_all_inv    (lsu_mmu_tlb_asid_all_inv   ),
  .lsu_mmu_tlb_va              (lsu_mmu_tlb_va             ),
  .lsu_mmu_tlb_va_all_inv      (lsu_mmu_tlb_va_all_inv     ),
  .lsu_mmu_tlb_va_asid_inv     (lsu_mmu_tlb_va_asid_inv    ),
  .lsu_rtu_ctc_flush_vld       (lsu_rtu_ctc_flush_vld      ),
  .lsu_snoop_clk               (lsu_snoop_clk              ),
  .mmu_lsu_tlb_inv_done        (mmu_lsu_tlb_inv_done       ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Instance("ct_lsu_snoop_snq","x_ct_lsu_snoop_snq"); @131
ct_lsu_snoop_snq  x_ct_lsu_snoop_snq (
  .arb_snq_entry_oldest_index         (arb_snq_entry_oldest_index        ),
  .arb_snq_snoop_addr                 (arb_snq_snoop_addr                ),
  .arb_snq_snoop_depd                 (arb_snq_snoop_depd                ),
  .arb_snq_snoop_prot                 (arb_snq_snoop_prot                ),
  .arb_snq_snoop_type                 (arb_snq_snoop_type                ),
  .biu_lsu_ac_req                     (biu_lsu_ac_req                    ),
  .biu_lsu_ctc_req                    (biu_lsu_ctc_req                   ),
  .biu_sdb_cd_ready                   (biu_sdb_cd_ready                  ),
  .biu_snq_cr_ready                   (biu_snq_cr_ready                  ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cpurst_b                           (cpurst_b                          ),
  .cur_snq_entry_empty                (cur_snq_entry_empty               ),
  .dcache_arb_snq_ld_grnt             (dcache_arb_snq_ld_grnt            ),
  .dcache_arb_snq_st_grnt             (dcache_arb_snq_st_grnt            ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ld_da_snq_borrow_sndb              (ld_da_snq_borrow_sndb             ),
  .ld_da_vb_snq_data_reissue          (ld_da_vb_snq_data_reissue         ),
  .lfb_snq_bypass_data_id             (lfb_snq_bypass_data_id            ),
  .lfb_snq_bypass_hit                 (lfb_snq_bypass_hit                ),
  .lfb_snq_bypass_share               (lfb_snq_bypass_share              ),
  .lfb_vb_addr_tto6                   (lfb_vb_addr_tto6                  ),
  .lsu_had_cdr_state                  (lsu_had_cdr_state                 ),
  .lsu_had_sdb_entry_vld              (lsu_had_sdb_entry_vld             ),
  .lsu_had_snoop_data_req             (lsu_had_snoop_data_req            ),
  .lsu_had_snoop_tag_req              (lsu_had_snoop_tag_req             ),
  .lsu_had_snq_entry_issued           (lsu_had_snq_entry_issued          ),
  .lsu_had_snq_entry_vld              (lsu_had_snq_entry_vld             ),
  .lsu_sdb_not_empty                  (lsu_sdb_not_empty                 ),
  .lsu_snoop_clk                      (lsu_snoop_clk                     ),
  .lsu_snq_not_empty                  (lsu_snq_not_empty                 ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .sdb_biu_cd_data                    (sdb_biu_cd_data                   ),
  .sdb_biu_cd_last                    (sdb_biu_cd_last                   ),
  .sdb_biu_cd_valid                   (sdb_biu_cd_valid                  ),
  .sdb_create_data_order              (sdb_create_data_order             ),
  .sdb_create_en                      (sdb_create_en                     ),
  .sdb_data_vld                       (sdb_data_vld                      ),
  .sdb_entry_avail                    (sdb_entry_avail                   ),
  .sdb_entry_data_0                   (sdb_entry_data_0                  ),
  .sdb_entry_data_1                   (sdb_entry_data_1                  ),
  .sdb_entry_data_2                   (sdb_entry_data_2                  ),
  .sdb_entry_data_index               (sdb_entry_data_index              ),
  .sdb_inv_en                         (sdb_inv_en                        ),
  .sdb_vld                            (sdb_vld                           ),
  .snoop_req_create_en                (snoop_req_create_en               ),
  .snq_biu_cr_resp                    (snq_biu_cr_resp                   ),
  .snq_biu_cr_valid                   (snq_biu_cr_valid                  ),
  .snq_bypass_addr_tto6               (snq_bypass_addr_tto6              ),
  .snq_can_create_snq_uncheck         (snq_can_create_snq_uncheck        ),
  .snq_create_addr                    (snq_create_addr                   ),
  .snq_create_lfb_vb_req_hit_idx      (snq_create_lfb_vb_req_hit_idx     ),
  .snq_create_wmb_read_req_hit_idx    (snq_create_wmb_read_req_hit_idx   ),
  .snq_create_wmb_write_req_hit_idx   (snq_create_wmb_write_req_hit_idx  ),
  .snq_dcache_arb_borrow_addr         (snq_dcache_arb_borrow_addr        ),
  .snq_dcache_arb_data_way            (snq_dcache_arb_data_way           ),
  .snq_dcache_arb_ld_borrow_req       (snq_dcache_arb_ld_borrow_req      ),
  .snq_dcache_arb_ld_borrow_req_gate  (snq_dcache_arb_ld_borrow_req_gate ),
  .snq_dcache_arb_ld_data_gateclk_en  (snq_dcache_arb_ld_data_gateclk_en ),
  .snq_dcache_arb_ld_data_idx         (snq_dcache_arb_ld_data_idx        ),
  .snq_dcache_arb_ld_req              (snq_dcache_arb_ld_req             ),
  .snq_dcache_arb_ld_tag_gateclk_en   (snq_dcache_arb_ld_tag_gateclk_en  ),
  .snq_dcache_arb_ld_tag_idx          (snq_dcache_arb_ld_tag_idx         ),
  .snq_dcache_arb_ld_tag_req          (snq_dcache_arb_ld_tag_req         ),
  .snq_dcache_arb_ld_tag_wen          (snq_dcache_arb_ld_tag_wen         ),
  .snq_dcache_arb_serial_req          (snq_dcache_arb_serial_req         ),
  .snq_dcache_arb_st_borrow_req       (snq_dcache_arb_st_borrow_req      ),
  .snq_dcache_arb_st_dirty_din        (snq_dcache_arb_st_dirty_din       ),
  .snq_dcache_arb_st_dirty_gateclk_en (snq_dcache_arb_st_dirty_gateclk_en),
  .snq_dcache_arb_st_dirty_gwen       (snq_dcache_arb_st_dirty_gwen      ),
  .snq_dcache_arb_st_dirty_idx        (snq_dcache_arb_st_dirty_idx       ),
  .snq_dcache_arb_st_dirty_req        (snq_dcache_arb_st_dirty_req       ),
  .snq_dcache_arb_st_dirty_wen        (snq_dcache_arb_st_dirty_wen       ),
  .snq_dcache_arb_st_id               (snq_dcache_arb_st_id              ),
  .snq_dcache_arb_st_req              (snq_dcache_arb_st_req             ),
  .snq_dcache_arb_st_tag_gateclk_en   (snq_dcache_arb_st_tag_gateclk_en  ),
  .snq_dcache_arb_st_tag_idx          (snq_dcache_arb_st_tag_idx         ),
  .snq_dcache_arb_st_tag_req          (snq_dcache_arb_st_tag_req         ),
  .snq_dcache_sdb_id                  (snq_dcache_sdb_id                 ),
  .snq_depd_vb_id                     (snq_depd_vb_id                    ),
  .snq_empty                          (snq_empty                         ),
  .snq_lfb_bypass_chg_tag             (snq_lfb_bypass_chg_tag            ),
  .snq_lfb_bypass_invalid             (snq_lfb_bypass_invalid            ),
  .snq_lfb_vb_req_hit_idx             (snq_lfb_vb_req_hit_idx            ),
  .snq_lm_dcache_addr_tto6            (snq_lm_dcache_addr_tto6           ),
  .snq_lm_dcache_req_for_inv          (snq_lm_dcache_req_for_inv         ),
  .snq_vb_bypass_check                (snq_vb_bypass_check               ),
  .snq_vb_bypass_invalid              (snq_vb_bypass_invalid             ),
  .snq_vb_bypass_readonce             (snq_vb_bypass_readonce            ),
  .snq_vb_bypass_start                (snq_vb_bypass_start               ),
  .snq_wmb_read_req_hit_idx           (snq_wmb_read_req_hit_idx          ),
  .snq_wmb_write_req_hit_idx          (snq_wmb_write_req_hit_idx         ),
  .st_da_snq_borrow_snq               (st_da_snq_borrow_snq              ),
  .st_da_snq_dcache_dirty             (st_da_snq_dcache_dirty            ),
  .st_da_snq_dcache_share             (st_da_snq_dcache_share            ),
  .st_da_snq_dcache_valid             (st_da_snq_dcache_valid            ),
  .st_da_snq_dcache_way               (st_da_snq_dcache_way              ),
  .st_da_snq_ecc_err                  (st_da_snq_ecc_err                 ),
  .vb_snq_bypass_db_id                (vb_snq_bypass_db_id               ),
  .vb_snq_bypass_hit                  (vb_snq_bypass_hit                 ),
  .vb_snq_depd_remove                 (vb_snq_depd_remove                ),
  .vb_snq_start_hit_idx               (vb_snq_start_hit_idx              ),
  .vb_snq_wait_remove                 (vb_snq_wait_remove                ),
  .vb_snq_wait_vb_id                  (vb_snq_wait_vb_id                 ),
  .wmb_read_req_addr                  (wmb_read_req_addr                 ),
  .wmb_snq_depd_remove                (wmb_snq_depd_remove               ),
  .wmb_write_ptr                      (wmb_write_ptr                     ),
  .wmb_write_req_addr                 (wmb_write_req_addr                )
);

// &Instance("ct_lsu_snoop_dummy","x_ct_lsu_snoop_dummy"); @133

//==========================================================
//                    Other modules
//==========================================================
// &Instance("ct_lsu_lm","x_ct_lsu_lm"); @139
ct_lsu_lm  x_ct_lsu_lm (
  .biu_lsu_r_id              (biu_lsu_r_id             ),
  .biu_lsu_r_resp            (biu_lsu_r_resp           ),
  .biu_lsu_r_vld             (biu_lsu_r_vld            ),
  .cp0_lsu_icg_en            (cp0_lsu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .ld_ag_dc_access_size      (ld_ag_dc_access_size     ),
  .ld_ag_lm_init_vld         (ld_ag_lm_init_vld        ),
  .ld_ag_lr_inst             (ld_ag_lr_inst            ),
  .ld_ag_pa                  (ld_ag_pa                 ),
  .ld_da_idx                 (ld_da_idx                ),
  .ld_da_lm_discard_grnt     (ld_da_lm_discard_grnt    ),
  .ld_da_lm_ecc_err          (ld_da_lm_ecc_err         ),
  .ld_da_lm_no_req           (ld_da_lm_no_req          ),
  .ld_da_lm_vector_nop       (ld_da_lm_vector_nop      ),
  .lm_addr_pa                (lm_addr_pa               ),
  .lm_already_snoop          (lm_already_snoop         ),
  .lm_ld_da_hit_idx          (lm_ld_da_hit_idx         ),
  .lm_lfb_depd_wakeup        (lm_lfb_depd_wakeup       ),
  .lm_page_buf               (lm_page_buf              ),
  .lm_page_ca                (lm_page_ca               ),
  .lm_page_sec               (lm_page_sec              ),
  .lm_page_share             (lm_page_share            ),
  .lm_page_so                (lm_page_so               ),
  .lm_pfu_biu_req_hit_idx    (lm_pfu_biu_req_hit_idx   ),
  .lm_snq_stall              (lm_snq_stall             ),
  .lm_sq_sc_fail             (lm_sq_sc_fail            ),
  .lm_st_da_hit_idx          (lm_st_da_hit_idx         ),
  .lm_state_is_amo_lock      (lm_state_is_amo_lock     ),
  .lm_state_is_ex_wait_lock  (lm_state_is_ex_wait_lock ),
  .lm_state_is_idle          (lm_state_is_idle         ),
  .lsu_had_lm_state          (lsu_had_lm_state         ),
  .mmu_lsu_buf0              (mmu_lsu_buf0             ),
  .mmu_lsu_ca0               (mmu_lsu_ca0              ),
  .mmu_lsu_sec0              (mmu_lsu_sec0             ),
  .mmu_lsu_sh0               (mmu_lsu_sh0              ),
  .mmu_lsu_so0               (mmu_lsu_so0              ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pfu_biu_req_addr          (pfu_biu_req_addr         ),
  .rb_lm_ar_id               (rb_lm_ar_id              ),
  .rb_lm_atomic_next_resp    (rb_lm_atomic_next_resp   ),
  .rb_lm_wait_resp_dp_vld    (rb_lm_wait_resp_dp_vld   ),
  .rb_lm_wait_resp_vld       (rb_lm_wait_resp_vld      ),
  .rtu_lsu_async_flush       (rtu_lsu_async_flush      ),
  .rtu_lsu_eret_flush        (rtu_lsu_eret_flush       ),
  .rtu_lsu_expt_flush        (rtu_lsu_expt_flush       ),
  .rtu_yy_xx_flush           (rtu_yy_xx_flush          ),
  .snq_create_addr           (snq_create_addr          ),
  .snq_lm_dcache_addr_tto6   (snq_lm_dcache_addr_tto6  ),
  .snq_lm_dcache_req_for_inv (snq_lm_dcache_req_for_inv),
  .st_da_addr                (st_da_addr               ),
  .vb_invalid_vld            (vb_invalid_vld           ),
  .victim_addr               (victim_addr              ),
  .wmb_ce_addr               (wmb_ce_addr              ),
  .wmb_ce_inst_size          (wmb_ce_inst_size         ),
  .wmb_lm_state_clr          (wmb_lm_state_clr         )
);

// &Instance("ct_lsu_amr","x_ct_lsu_amr"); @140
ct_lsu_amr  x_ct_lsu_amr (
  .amr_l2_mem_set     (amr_l2_mem_set    ),
  .amr_wa_cancel      (amr_wa_cancel     ),
  .cp0_lsu_amr        (cp0_lsu_amr       ),
  .cp0_lsu_amr2       (cp0_lsu_amr2      ),
  .cp0_lsu_icg_en     (cp0_lsu_icg_en    ),
  .cp0_lsu_no_op_req  (cp0_lsu_no_op_req ),
  .cp0_yy_clk_en      (cp0_yy_clk_en     ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .icc_idle           (icc_idle          ),
  .lsu_had_amr_state  (lsu_had_amr_state ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .wmb_ce_addr        (wmb_ce_addr       ),
  .wmb_ce_bytes_vld   (wmb_ce_bytes_vld  ),
  .wmb_ce_ca_st_inst  (wmb_ce_ca_st_inst ),
  .wmb_ce_pop_vld     (wmb_ce_pop_vld    ),
  .wmb_ce_vld         (wmb_ce_vld        )
);

// &Instance("ct_lsu_icc","x_ct_lsu_icc"); @141
ct_lsu_icc  x_ct_lsu_icc (
  .cp0_lsu_dcache_clr                 (cp0_lsu_dcache_clr                ),
  .cp0_lsu_dcache_inv                 (cp0_lsu_dcache_inv                ),
  .cp0_lsu_dcache_read_index          (cp0_lsu_dcache_read_index         ),
  .cp0_lsu_dcache_read_ld_tag         (cp0_lsu_dcache_read_ld_tag        ),
  .cp0_lsu_dcache_read_req            (cp0_lsu_dcache_read_req           ),
  .cp0_lsu_dcache_read_st_tag         (cp0_lsu_dcache_read_st_tag        ),
  .cp0_lsu_dcache_read_way            (cp0_lsu_dcache_read_way           ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .dcache_arb_icc_ld_grnt             (dcache_arb_icc_ld_grnt            ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .icc_dcache_arb_data_way            (icc_dcache_arb_data_way           ),
  .icc_dcache_arb_ld_borrow_req       (icc_dcache_arb_ld_borrow_req      ),
  .icc_dcache_arb_ld_data_gateclk_en  (icc_dcache_arb_ld_data_gateclk_en ),
  .icc_dcache_arb_ld_data_high_idx    (icc_dcache_arb_ld_data_high_idx   ),
  .icc_dcache_arb_ld_data_low_idx     (icc_dcache_arb_ld_data_low_idx    ),
  .icc_dcache_arb_ld_data_req         (icc_dcache_arb_ld_data_req        ),
  .icc_dcache_arb_ld_req              (icc_dcache_arb_ld_req             ),
  .icc_dcache_arb_ld_tag_gateclk_en   (icc_dcache_arb_ld_tag_gateclk_en  ),
  .icc_dcache_arb_ld_tag_idx          (icc_dcache_arb_ld_tag_idx         ),
  .icc_dcache_arb_ld_tag_read         (icc_dcache_arb_ld_tag_read        ),
  .icc_dcache_arb_ld_tag_req          (icc_dcache_arb_ld_tag_req         ),
  .icc_dcache_arb_st_borrow_req       (icc_dcache_arb_st_borrow_req      ),
  .icc_dcache_arb_st_dirty_din        (icc_dcache_arb_st_dirty_din       ),
  .icc_dcache_arb_st_dirty_gateclk_en (icc_dcache_arb_st_dirty_gateclk_en),
  .icc_dcache_arb_st_dirty_gwen       (icc_dcache_arb_st_dirty_gwen      ),
  .icc_dcache_arb_st_dirty_idx        (icc_dcache_arb_st_dirty_idx       ),
  .icc_dcache_arb_st_dirty_req        (icc_dcache_arb_st_dirty_req       ),
  .icc_dcache_arb_st_dirty_wen        (icc_dcache_arb_st_dirty_wen       ),
  .icc_dcache_arb_st_req              (icc_dcache_arb_st_req             ),
  .icc_dcache_arb_st_tag_gateclk_en   (icc_dcache_arb_st_tag_gateclk_en  ),
  .icc_dcache_arb_st_tag_idx          (icc_dcache_arb_st_tag_idx         ),
  .icc_dcache_arb_st_tag_req          (icc_dcache_arb_st_tag_req         ),
  .icc_dcache_arb_way                 (icc_dcache_arb_way                ),
  .icc_idle                           (icc_idle                          ),
  .icc_snq_create_permit              (icc_snq_create_permit             ),
  .icc_sq_grnt                        (icc_sq_grnt                       ),
  .icc_vb_addr_tto6                   (icc_vb_addr_tto6                  ),
  .icc_vb_create_dp_vld               (icc_vb_create_dp_vld              ),
  .icc_vb_create_gateclk_en           (icc_vb_create_gateclk_en          ),
  .icc_vb_create_req                  (icc_vb_create_req                 ),
  .icc_vb_create_vld                  (icc_vb_create_vld                 ),
  .icc_vb_inv                         (icc_vb_inv                        ),
  .icc_wmb_write_imme                 (icc_wmb_write_imme                ),
  .ld_da_icc_read_data                (ld_da_icc_read_data               ),
  .ld_da_snq_borrow_icc               (ld_da_snq_borrow_icc              ),
  .lfb_empty                          (lfb_empty                         ),
  .lsu_cp0_dcache_done                (lsu_cp0_dcache_done               ),
  .lsu_cp0_dcache_read_data           (lsu_cp0_dcache_read_data          ),
  .lsu_cp0_dcache_read_data_vld       (lsu_cp0_dcache_read_data_vld      ),
  .lsu_had_icc_state                  (lsu_had_icc_state                 ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_icc_ready                      (pfu_icc_ready                     ),
  .rb_empty                           (rb_empty                          ),
  .snq_empty                          (snq_empty                         ),
  .sq_empty                           (sq_empty                          ),
  .sq_icc_clr                         (sq_icc_clr                        ),
  .sq_icc_inv                         (sq_icc_inv                        ),
  .sq_icc_req                         (sq_icc_req                        ),
  .st_da_borrow_icc_vld               (st_da_borrow_icc_vld              ),
  .st_da_icc_dirty_info               (st_da_icc_dirty_info              ),
  .st_da_icc_tag_info                 (st_da_icc_tag_info                ),
  .vb_empty                           (vb_empty                          ),
  .vb_icc_create_grnt                 (vb_icc_create_grnt                ),
  .wmb_empty                          (wmb_empty                         )
);

// &Instance("ct_lsu_ctrl","x_ct_lsu_ctrl"); @142
ct_lsu_ctrl  x_ct_lsu_ctrl (
  .cp0_lsu_dcache_pref_dist          (cp0_lsu_dcache_pref_dist         ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_lsu_l2_pref_dist              (cp0_lsu_l2_pref_dist             ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cpurst_b                          (cpurst_b                         ),
  .ctrl_ld_clk                       (ctrl_ld_clk                      ),
  .ctrl_st_clk                       (ctrl_st_clk                      ),
  .dcache_arb_ld_dc_borrow_vld_gate  (dcache_arb_ld_dc_borrow_vld_gate ),
  .dcache_arb_st_dc_borrow_vld_gate  (dcache_arb_st_dc_borrow_vld_gate ),
  .forever_cpuclk                    (forever_cpuclk                   ),
  .hpcp_lsu_cnt_en                   (hpcp_lsu_cnt_en                  ),
  .icc_vb_create_gateclk_en          (icc_vb_create_gateclk_en         ),
  .idu_lsu_rf_pipe3_gateclk_sel      (idu_lsu_rf_pipe3_gateclk_sel     ),
  .idu_lsu_rf_pipe3_sel              (idu_lsu_rf_pipe3_sel             ),
  .idu_lsu_rf_pipe4_gateclk_sel      (idu_lsu_rf_pipe4_gateclk_sel     ),
  .idu_lsu_rf_pipe4_sel              (idu_lsu_rf_pipe4_sel             ),
  .idu_lsu_rf_pipe5_gateclk_sel      (idu_lsu_rf_pipe5_gateclk_sel     ),
  .idu_lsu_vmb_create0_gateclk_en    (idu_lsu_vmb_create0_gateclk_en   ),
  .idu_lsu_vmb_create1_gateclk_en    (idu_lsu_vmb_create1_gateclk_en   ),
  .ld_ag_inst_vld                    (ld_ag_inst_vld                   ),
  .ld_ag_stall_ori                   (ld_ag_stall_ori                  ),
  .ld_ag_stall_restart_entry         (ld_ag_stall_restart_entry        ),
  .ld_da_borrow_vld                  (ld_da_borrow_vld                 ),
  .ld_da_ecc_wakeup                  (ld_da_ecc_wakeup                 ),
  .ld_da_idu_already_da              (ld_da_idu_already_da             ),
  .ld_da_idu_bkpta_data              (ld_da_idu_bkpta_data             ),
  .ld_da_idu_bkptb_data              (ld_da_idu_bkptb_data             ),
  .ld_da_idu_boundary_gateclk_en     (ld_da_idu_boundary_gateclk_en    ),
  .ld_da_idu_pop_entry               (ld_da_idu_pop_entry              ),
  .ld_da_idu_pop_vld                 (ld_da_idu_pop_vld                ),
  .ld_da_idu_rb_full                 (ld_da_idu_rb_full                ),
  .ld_da_idu_secd                    (ld_da_idu_secd                   ),
  .ld_da_idu_spec_fail               (ld_da_idu_spec_fail              ),
  .ld_da_idu_wait_fence              (ld_da_idu_wait_fence             ),
  .ld_da_inst_vld                    (ld_da_inst_vld                   ),
  .ld_da_rb_full_gateclk_en          (ld_da_rb_full_gateclk_en         ),
  .ld_da_special_gateclk_en          (ld_da_special_gateclk_en         ),
  .ld_da_wait_fence_gateclk_en       (ld_da_wait_fence_gateclk_en      ),
  .ld_dc_borrow_vld                  (ld_dc_borrow_vld                 ),
  .ld_dc_idu_lq_full                 (ld_dc_idu_lq_full                ),
  .ld_dc_idu_tlb_busy                (ld_dc_idu_tlb_busy               ),
  .ld_dc_imme_wakeup                 (ld_dc_imme_wakeup                ),
  .ld_dc_inst_vld                    (ld_dc_inst_vld                   ),
  .ld_dc_lq_full_gateclk_en          (ld_dc_lq_full_gateclk_en         ),
  .ld_dc_tlb_busy_gateclk_en         (ld_dc_tlb_busy_gateclk_en        ),
  .ld_wb_data_vld                    (ld_wb_data_vld                   ),
  .ld_wb_inst_vld                    (ld_wb_inst_vld                   ),
  .lfb_depd_wakeup                   (lfb_depd_wakeup                  ),
  .lfb_empty                         (lfb_empty                        ),
  .lfb_pop_depd_ff                   (lfb_pop_depd_ff                  ),
  .lm_lfb_depd_wakeup                (lm_lfb_depd_wakeup               ),
  .lsu_had_amr_state                 (lsu_had_amr_state                ),
  .lsu_had_cdr_state                 (lsu_had_cdr_state                ),
  .lsu_had_ctcq_entry_2_cmplt        (lsu_had_ctcq_entry_2_cmplt       ),
  .lsu_had_ctcq_entry_cmplt          (lsu_had_ctcq_entry_cmplt         ),
  .lsu_had_ctcq_entry_vld            (lsu_had_ctcq_entry_vld           ),
  .lsu_had_debug_info                (lsu_had_debug_info               ),
  .lsu_had_icc_state                 (lsu_had_icc_state                ),
  .lsu_had_lfb_addr_entry_dcache_hit (lsu_had_lfb_addr_entry_dcache_hit),
  .lsu_had_lfb_addr_entry_rcl_done   (lsu_had_lfb_addr_entry_rcl_done  ),
  .lsu_had_lfb_addr_entry_vld        (lsu_had_lfb_addr_entry_vld       ),
  .lsu_had_lfb_data_entry_last       (lsu_had_lfb_data_entry_last      ),
  .lsu_had_lfb_data_entry_vld        (lsu_had_lfb_data_entry_vld       ),
  .lsu_had_lfb_lf_sm_vld             (lsu_had_lfb_lf_sm_vld            ),
  .lsu_had_lfb_wakeup_queue          (lsu_had_lfb_wakeup_queue         ),
  .lsu_had_lm_state                  (lsu_had_lm_state                 ),
  .lsu_had_mcic_data_req             (lsu_had_mcic_data_req            ),
  .lsu_had_mcic_frz                  (lsu_had_mcic_frz                 ),
  .lsu_had_no_op                     (lsu_had_no_op                    ),
  .lsu_had_rb_entry_fence            (lsu_had_rb_entry_fence           ),
  .lsu_had_rb_entry_state_0          (lsu_had_rb_entry_state_0         ),
  .lsu_had_rb_entry_state_1          (lsu_had_rb_entry_state_1         ),
  .lsu_had_rb_entry_state_2          (lsu_had_rb_entry_state_2         ),
  .lsu_had_rb_entry_state_3          (lsu_had_rb_entry_state_3         ),
  .lsu_had_rb_entry_state_4          (lsu_had_rb_entry_state_4         ),
  .lsu_had_rb_entry_state_5          (lsu_had_rb_entry_state_5         ),
  .lsu_had_rb_entry_state_6          (lsu_had_rb_entry_state_6         ),
  .lsu_had_rb_entry_state_7          (lsu_had_rb_entry_state_7         ),
  .lsu_had_sdb_entry_vld             (lsu_had_sdb_entry_vld            ),
  .lsu_had_snoop_data_req            (lsu_had_snoop_data_req           ),
  .lsu_had_snoop_tag_req             (lsu_had_snoop_tag_req            ),
  .lsu_had_snq_entry_issued          (lsu_had_snq_entry_issued         ),
  .lsu_had_snq_entry_vld             (lsu_had_snq_entry_vld            ),
  .lsu_had_sq_not_empty              (lsu_had_sq_not_empty             ),
  .lsu_had_vb_addr_entry_vld         (lsu_had_vb_addr_entry_vld        ),
  .lsu_had_vb_data_entry_vld         (lsu_had_vb_data_entry_vld        ),
  .lsu_had_vb_rcl_sm_state           (lsu_had_vb_rcl_sm_state          ),
  .lsu_had_wmb_ar_pending            (lsu_had_wmb_ar_pending           ),
  .lsu_had_wmb_aw_pending            (lsu_had_wmb_aw_pending           ),
  .lsu_had_wmb_create_ptr            (lsu_had_wmb_create_ptr           ),
  .lsu_had_wmb_data_ptr              (lsu_had_wmb_data_ptr             ),
  .lsu_had_wmb_entry_vld             (lsu_had_wmb_entry_vld            ),
  .lsu_had_wmb_read_ptr              (lsu_had_wmb_read_ptr             ),
  .lsu_had_wmb_w_pending             (lsu_had_wmb_w_pending            ),
  .lsu_had_wmb_write_imme            (lsu_had_wmb_write_imme           ),
  .lsu_had_wmb_write_ptr             (lsu_had_wmb_write_ptr            ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_hpcp_cache_read_access        (lsu_hpcp_cache_read_access       ),
  .lsu_hpcp_cache_read_miss          (lsu_hpcp_cache_read_miss         ),
  .lsu_hpcp_cache_write_access       (lsu_hpcp_cache_write_access      ),
  .lsu_hpcp_cache_write_miss         (lsu_hpcp_cache_write_miss        ),
  .lsu_hpcp_fence_stall              (lsu_hpcp_fence_stall             ),
  .lsu_hpcp_ld_cache_access          (lsu_hpcp_ld_cache_access         ),
  .lsu_hpcp_ld_cache_miss            (lsu_hpcp_ld_cache_miss           ),
  .lsu_hpcp_ld_cross_4k_stall        (lsu_hpcp_ld_cross_4k_stall       ),
  .lsu_hpcp_ld_data_discard          (lsu_hpcp_ld_data_discard         ),
  .lsu_hpcp_ld_discard_sq            (lsu_hpcp_ld_discard_sq           ),
  .lsu_hpcp_ld_other_stall           (lsu_hpcp_ld_other_stall          ),
  .lsu_hpcp_ld_stall_cross_4k        (lsu_hpcp_ld_stall_cross_4k       ),
  .lsu_hpcp_ld_stall_other           (lsu_hpcp_ld_stall_other          ),
  .lsu_hpcp_ld_unalign_inst          (lsu_hpcp_ld_unalign_inst         ),
  .lsu_hpcp_replay_data_discard      (lsu_hpcp_replay_data_discard     ),
  .lsu_hpcp_replay_discard_sq        (lsu_hpcp_replay_discard_sq       ),
  .lsu_hpcp_st_cache_access          (lsu_hpcp_st_cache_access         ),
  .lsu_hpcp_st_cache_miss            (lsu_hpcp_st_cache_miss           ),
  .lsu_hpcp_st_cross_4k_stall        (lsu_hpcp_st_cross_4k_stall       ),
  .lsu_hpcp_st_other_stall           (lsu_hpcp_st_other_stall          ),
  .lsu_hpcp_st_stall_cross_4k        (lsu_hpcp_st_stall_cross_4k       ),
  .lsu_hpcp_st_stall_other           (lsu_hpcp_st_stall_other          ),
  .lsu_hpcp_st_unalign_inst          (lsu_hpcp_st_unalign_inst         ),
  .lsu_hpcp_unalign_inst             (lsu_hpcp_unalign_inst            ),
  .lsu_idu_already_da                (lsu_idu_already_da               ),
  .lsu_idu_bkpta_data                (lsu_idu_bkpta_data               ),
  .lsu_idu_bkptb_data                (lsu_idu_bkptb_data               ),
  .lsu_idu_ld_ag_wait_old            (lsu_idu_ld_ag_wait_old           ),
  .lsu_idu_ld_ag_wait_old_gateclk_en (lsu_idu_ld_ag_wait_old_gateclk_en),
  .lsu_idu_ld_da_wait_old            (lsu_idu_ld_da_wait_old           ),
  .lsu_idu_ld_da_wait_old_gateclk_en (lsu_idu_ld_da_wait_old_gateclk_en),
  .lsu_idu_lq_full                   (lsu_idu_lq_full                  ),
  .lsu_idu_lq_full_gateclk_en        (lsu_idu_lq_full_gateclk_en       ),
  .lsu_idu_lsiq_pop0_vld             (lsu_idu_lsiq_pop0_vld            ),
  .lsu_idu_lsiq_pop1_vld             (lsu_idu_lsiq_pop1_vld            ),
  .lsu_idu_lsiq_pop_entry            (lsu_idu_lsiq_pop_entry           ),
  .lsu_idu_lsiq_pop_vld              (lsu_idu_lsiq_pop_vld             ),
  .lsu_idu_rb_full                   (lsu_idu_rb_full                  ),
  .lsu_idu_rb_full_gateclk_en        (lsu_idu_rb_full_gateclk_en       ),
  .lsu_idu_secd                      (lsu_idu_secd                     ),
  .lsu_idu_spec_fail                 (lsu_idu_spec_fail                ),
  .lsu_idu_sq_full                   (lsu_idu_sq_full                  ),
  .lsu_idu_sq_full_gateclk_en        (lsu_idu_sq_full_gateclk_en       ),
  .lsu_idu_st_ag_wait_old            (lsu_idu_st_ag_wait_old           ),
  .lsu_idu_st_ag_wait_old_gateclk_en (lsu_idu_st_ag_wait_old_gateclk_en),
  .lsu_idu_tlb_busy                  (lsu_idu_tlb_busy                 ),
  .lsu_idu_tlb_busy_gateclk_en       (lsu_idu_tlb_busy_gateclk_en      ),
  .lsu_idu_tlb_wakeup                (lsu_idu_tlb_wakeup               ),
  .lsu_idu_unalign_gateclk_en        (lsu_idu_unalign_gateclk_en       ),
  .lsu_idu_wait_fence                (lsu_idu_wait_fence               ),
  .lsu_idu_wait_fence_gateclk_en     (lsu_idu_wait_fence_gateclk_en    ),
  .lsu_idu_wait_old                  (lsu_idu_wait_old                 ),
  .lsu_idu_wait_old_gateclk_en       (lsu_idu_wait_old_gateclk_en      ),
  .lsu_idu_wakeup                    (lsu_idu_wakeup                   ),
  .lsu_pfu_l1_dist_sel               (lsu_pfu_l1_dist_sel              ),
  .lsu_pfu_l2_dist_sel               (lsu_pfu_l2_dist_sel              ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .lsu_yy_xx_no_op                   (lsu_yy_xx_no_op                  ),
  .mmu_lsu_tlb_wakeup                (mmu_lsu_tlb_wakeup               ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_lfb_create_gateclk_en         (pfu_lfb_create_gateclk_en        ),
  .pfu_part_empty                    (pfu_part_empty                   ),
  .rb_empty                          (rb_empty                         ),
  .rb_ld_wb_cmplt_req                (rb_ld_wb_cmplt_req               ),
  .rb_ld_wb_data_req                 (rb_ld_wb_data_req                ),
  .sd_ex1_inst_vld                   (sd_ex1_inst_vld                  ),
  .sq_data_depd_wakeup               (sq_data_depd_wakeup              ),
  .sq_empty                          (sq_empty                         ),
  .sq_global_depd_wakeup             (sq_global_depd_wakeup            ),
  .st_ag_inst_vld                    (st_ag_inst_vld                   ),
  .st_ag_stall_ori                   (st_ag_stall_ori                  ),
  .st_ag_stall_restart_entry         (st_ag_stall_restart_entry        ),
  .st_da_borrow_vld                  (st_da_borrow_vld                 ),
  .st_da_ecc_wakeup                  (st_da_ecc_wakeup                 ),
  .st_da_idu_already_da              (st_da_idu_already_da             ),
  .st_da_idu_bkpta_data              (st_da_idu_bkpta_data             ),
  .st_da_idu_bkptb_data              (st_da_idu_bkptb_data             ),
  .st_da_idu_boundary_gateclk_en     (st_da_idu_boundary_gateclk_en    ),
  .st_da_idu_pop_entry               (st_da_idu_pop_entry              ),
  .st_da_idu_pop_vld                 (st_da_idu_pop_vld                ),
  .st_da_idu_rb_full                 (st_da_idu_rb_full                ),
  .st_da_idu_secd                    (st_da_idu_secd                   ),
  .st_da_idu_spec_fail               (st_da_idu_spec_fail              ),
  .st_da_idu_wait_fence              (st_da_idu_wait_fence             ),
  .st_da_inst_vld                    (st_da_inst_vld                   ),
  .st_da_rb_create_gateclk_en        (st_da_rb_create_gateclk_en       ),
  .st_da_rb_full_gateclk_en          (st_da_rb_full_gateclk_en         ),
  .st_da_wait_fence_gateclk_en       (st_da_wait_fence_gateclk_en      ),
  .st_dc_borrow_vld                  (st_dc_borrow_vld                 ),
  .st_dc_idu_sq_full                 (st_dc_idu_sq_full                ),
  .st_dc_idu_tlb_busy                (st_dc_idu_tlb_busy               ),
  .st_dc_imme_wakeup                 (st_dc_imme_wakeup                ),
  .st_dc_inst_vld                    (st_dc_inst_vld                   ),
  .st_dc_sq_full_gateclk_en          (st_dc_sq_full_gateclk_en         ),
  .st_dc_tlb_busy_gateclk_en         (st_dc_tlb_busy_gateclk_en        ),
  .st_wb_inst_vld                    (st_wb_inst_vld                   ),
  .vb_empty                          (vb_empty                         ),
  .vmb_empty                         (vmb_empty                        ),
  .vmb_ld_wb_data_req                (vmb_ld_wb_data_req               ),
  .wmb_depd_wakeup                   (wmb_depd_wakeup                  ),
  .wmb_empty                         (wmb_empty                        ),
  .wmb_ld_wb_data_req                (wmb_ld_wb_data_req               ),
  .wmb_no_op                         (wmb_no_op                        ),
  .wmb_st_wb_cmplt_req               (wmb_st_wb_cmplt_req              ),
  .wmb_write_req_icc                 (wmb_write_req_icc                )
);

// &Instance("ct_lsu_bus_arb","x_ct_lsu_bus_arb"); @143
ct_lsu_bus_arb  x_ct_lsu_bus_arb (
  .biu_lsu_ar_ready          (biu_lsu_ar_ready         ),
  .biu_lsu_aw_vb_grnt        (biu_lsu_aw_vb_grnt       ),
  .biu_lsu_aw_wmb_grnt       (biu_lsu_aw_wmb_grnt      ),
  .biu_lsu_w_vb_grnt         (biu_lsu_w_vb_grnt        ),
  .biu_lsu_w_wmb_grnt        (biu_lsu_w_wmb_grnt       ),
  .bus_arb_pfu_ar_grnt       (bus_arb_pfu_ar_grnt      ),
  .bus_arb_pfu_ar_ready      (bus_arb_pfu_ar_ready     ),
  .bus_arb_pfu_ar_sel        (bus_arb_pfu_ar_sel       ),
  .bus_arb_rb_ar_grnt        (bus_arb_rb_ar_grnt       ),
  .bus_arb_rb_ar_sel         (bus_arb_rb_ar_sel        ),
  .bus_arb_vb_aw_grnt        (bus_arb_vb_aw_grnt       ),
  .bus_arb_vb_w_grnt         (bus_arb_vb_w_grnt        ),
  .bus_arb_wmb_ar_grnt       (bus_arb_wmb_ar_grnt      ),
  .bus_arb_wmb_aw_grnt       (bus_arb_wmb_aw_grnt      ),
  .bus_arb_wmb_w_grnt        (bus_arb_wmb_w_grnt       ),
  .cp0_lsu_icg_en            (cp0_lsu_icg_en           ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .lsu_biu_ar_addr           (lsu_biu_ar_addr          ),
  .lsu_biu_ar_bar            (lsu_biu_ar_bar           ),
  .lsu_biu_ar_burst          (lsu_biu_ar_burst         ),
  .lsu_biu_ar_cache          (lsu_biu_ar_cache         ),
  .lsu_biu_ar_domain         (lsu_biu_ar_domain        ),
  .lsu_biu_ar_dp_req         (lsu_biu_ar_dp_req        ),
  .lsu_biu_ar_id             (lsu_biu_ar_id            ),
  .lsu_biu_ar_len            (lsu_biu_ar_len           ),
  .lsu_biu_ar_lock           (lsu_biu_ar_lock          ),
  .lsu_biu_ar_prot           (lsu_biu_ar_prot          ),
  .lsu_biu_ar_req            (lsu_biu_ar_req           ),
  .lsu_biu_ar_req_gate       (lsu_biu_ar_req_gate      ),
  .lsu_biu_ar_size           (lsu_biu_ar_size          ),
  .lsu_biu_ar_snoop          (lsu_biu_ar_snoop         ),
  .lsu_biu_ar_user           (lsu_biu_ar_user          ),
  .lsu_biu_aw_req_gate       (lsu_biu_aw_req_gate      ),
  .lsu_biu_aw_st_addr        (lsu_biu_aw_st_addr       ),
  .lsu_biu_aw_st_bar         (lsu_biu_aw_st_bar        ),
  .lsu_biu_aw_st_burst       (lsu_biu_aw_st_burst      ),
  .lsu_biu_aw_st_cache       (lsu_biu_aw_st_cache      ),
  .lsu_biu_aw_st_domain      (lsu_biu_aw_st_domain     ),
  .lsu_biu_aw_st_dp_req      (lsu_biu_aw_st_dp_req     ),
  .lsu_biu_aw_st_id          (lsu_biu_aw_st_id         ),
  .lsu_biu_aw_st_len         (lsu_biu_aw_st_len        ),
  .lsu_biu_aw_st_lock        (lsu_biu_aw_st_lock       ),
  .lsu_biu_aw_st_prot        (lsu_biu_aw_st_prot       ),
  .lsu_biu_aw_st_req         (lsu_biu_aw_st_req        ),
  .lsu_biu_aw_st_size        (lsu_biu_aw_st_size       ),
  .lsu_biu_aw_st_snoop       (lsu_biu_aw_st_snoop      ),
  .lsu_biu_aw_st_unique      (lsu_biu_aw_st_unique     ),
  .lsu_biu_aw_st_user        (lsu_biu_aw_st_user       ),
  .lsu_biu_aw_vict_addr      (lsu_biu_aw_vict_addr     ),
  .lsu_biu_aw_vict_bar       (lsu_biu_aw_vict_bar      ),
  .lsu_biu_aw_vict_burst     (lsu_biu_aw_vict_burst    ),
  .lsu_biu_aw_vict_cache     (lsu_biu_aw_vict_cache    ),
  .lsu_biu_aw_vict_domain    (lsu_biu_aw_vict_domain   ),
  .lsu_biu_aw_vict_dp_req    (lsu_biu_aw_vict_dp_req   ),
  .lsu_biu_aw_vict_id        (lsu_biu_aw_vict_id       ),
  .lsu_biu_aw_vict_len       (lsu_biu_aw_vict_len      ),
  .lsu_biu_aw_vict_lock      (lsu_biu_aw_vict_lock     ),
  .lsu_biu_aw_vict_prot      (lsu_biu_aw_vict_prot     ),
  .lsu_biu_aw_vict_req       (lsu_biu_aw_vict_req      ),
  .lsu_biu_aw_vict_size      (lsu_biu_aw_vict_size     ),
  .lsu_biu_aw_vict_snoop     (lsu_biu_aw_vict_snoop    ),
  .lsu_biu_aw_vict_unique    (lsu_biu_aw_vict_unique   ),
  .lsu_biu_aw_vict_user      (lsu_biu_aw_vict_user     ),
  .lsu_biu_w_st_data         (lsu_biu_w_st_data        ),
  .lsu_biu_w_st_last         (lsu_biu_w_st_last        ),
  .lsu_biu_w_st_strb         (lsu_biu_w_st_strb        ),
  .lsu_biu_w_st_vld          (lsu_biu_w_st_vld         ),
  .lsu_biu_w_st_wns          (lsu_biu_w_st_wns         ),
  .lsu_biu_w_vict_data       (lsu_biu_w_vict_data      ),
  .lsu_biu_w_vict_last       (lsu_biu_w_vict_last      ),
  .lsu_biu_w_vict_strb       (lsu_biu_w_vict_strb      ),
  .lsu_biu_w_vict_vld        (lsu_biu_w_vict_vld       ),
  .lsu_biu_w_vict_wns        (lsu_biu_w_vict_wns       ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pfu_biu_ar_addr           (pfu_biu_ar_addr          ),
  .pfu_biu_ar_bar            (pfu_biu_ar_bar           ),
  .pfu_biu_ar_burst          (pfu_biu_ar_burst         ),
  .pfu_biu_ar_cache          (pfu_biu_ar_cache         ),
  .pfu_biu_ar_domain         (pfu_biu_ar_domain        ),
  .pfu_biu_ar_dp_req         (pfu_biu_ar_dp_req        ),
  .pfu_biu_ar_id             (pfu_biu_ar_id            ),
  .pfu_biu_ar_len            (pfu_biu_ar_len           ),
  .pfu_biu_ar_lock           (pfu_biu_ar_lock          ),
  .pfu_biu_ar_prot           (pfu_biu_ar_prot          ),
  .pfu_biu_ar_req            (pfu_biu_ar_req           ),
  .pfu_biu_ar_req_gateclk_en (pfu_biu_ar_req_gateclk_en),
  .pfu_biu_ar_size           (pfu_biu_ar_size          ),
  .pfu_biu_ar_snoop          (pfu_biu_ar_snoop         ),
  .pfu_biu_ar_user           (pfu_biu_ar_user          ),
  .rb_biu_ar_addr            (rb_biu_ar_addr           ),
  .rb_biu_ar_bar             (rb_biu_ar_bar            ),
  .rb_biu_ar_burst           (rb_biu_ar_burst          ),
  .rb_biu_ar_cache           (rb_biu_ar_cache          ),
  .rb_biu_ar_domain          (rb_biu_ar_domain         ),
  .rb_biu_ar_dp_req          (rb_biu_ar_dp_req         ),
  .rb_biu_ar_id              (rb_biu_ar_id             ),
  .rb_biu_ar_len             (rb_biu_ar_len            ),
  .rb_biu_ar_lock            (rb_biu_ar_lock           ),
  .rb_biu_ar_prot            (rb_biu_ar_prot           ),
  .rb_biu_ar_req             (rb_biu_ar_req            ),
  .rb_biu_ar_req_gateclk_en  (rb_biu_ar_req_gateclk_en ),
  .rb_biu_ar_size            (rb_biu_ar_size           ),
  .rb_biu_ar_snoop           (rb_biu_ar_snoop          ),
  .rb_biu_ar_user            (rb_biu_ar_user           ),
  .vb_biu_aw_addr            (vb_biu_aw_addr           ),
  .vb_biu_aw_bar             (vb_biu_aw_bar            ),
  .vb_biu_aw_burst           (vb_biu_aw_burst          ),
  .vb_biu_aw_cache           (vb_biu_aw_cache          ),
  .vb_biu_aw_domain          (vb_biu_aw_domain         ),
  .vb_biu_aw_dp_req          (vb_biu_aw_dp_req         ),
  .vb_biu_aw_id              (vb_biu_aw_id             ),
  .vb_biu_aw_len             (vb_biu_aw_len            ),
  .vb_biu_aw_lock            (vb_biu_aw_lock           ),
  .vb_biu_aw_prot            (vb_biu_aw_prot           ),
  .vb_biu_aw_req             (vb_biu_aw_req            ),
  .vb_biu_aw_req_gateclk_en  (vb_biu_aw_req_gateclk_en ),
  .vb_biu_aw_size            (vb_biu_aw_size           ),
  .vb_biu_aw_snoop           (vb_biu_aw_snoop          ),
  .vb_biu_aw_unique          (vb_biu_aw_unique         ),
  .vb_biu_aw_user            (vb_biu_aw_user           ),
  .vb_biu_w_data             (vb_biu_w_data            ),
  .vb_biu_w_id               (vb_biu_w_id              ),
  .vb_biu_w_last             (vb_biu_w_last            ),
  .vb_biu_w_req              (vb_biu_w_req             ),
  .vb_biu_w_strb             (vb_biu_w_strb            ),
  .vb_biu_w_vld              (vb_biu_w_vld             ),
  .wmb_biu_ar_addr           (wmb_biu_ar_addr          ),
  .wmb_biu_ar_bar            (wmb_biu_ar_bar           ),
  .wmb_biu_ar_burst          (wmb_biu_ar_burst         ),
  .wmb_biu_ar_cache          (wmb_biu_ar_cache         ),
  .wmb_biu_ar_domain         (wmb_biu_ar_domain        ),
  .wmb_biu_ar_dp_req         (wmb_biu_ar_dp_req        ),
  .wmb_biu_ar_id             (wmb_biu_ar_id            ),
  .wmb_biu_ar_len            (wmb_biu_ar_len           ),
  .wmb_biu_ar_lock           (wmb_biu_ar_lock          ),
  .wmb_biu_ar_prot           (wmb_biu_ar_prot          ),
  .wmb_biu_ar_req            (wmb_biu_ar_req           ),
  .wmb_biu_ar_req_gateclk_en (wmb_biu_ar_req_gateclk_en),
  .wmb_biu_ar_size           (wmb_biu_ar_size          ),
  .wmb_biu_ar_snoop          (wmb_biu_ar_snoop         ),
  .wmb_biu_ar_user           (wmb_biu_ar_user          ),
  .wmb_biu_aw_addr           (wmb_biu_aw_addr          ),
  .wmb_biu_aw_bar            (wmb_biu_aw_bar           ),
  .wmb_biu_aw_burst          (wmb_biu_aw_burst         ),
  .wmb_biu_aw_cache          (wmb_biu_aw_cache         ),
  .wmb_biu_aw_domain         (wmb_biu_aw_domain        ),
  .wmb_biu_aw_dp_req         (wmb_biu_aw_dp_req        ),
  .wmb_biu_aw_id             (wmb_biu_aw_id            ),
  .wmb_biu_aw_len            (wmb_biu_aw_len           ),
  .wmb_biu_aw_lock           (wmb_biu_aw_lock          ),
  .wmb_biu_aw_prot           (wmb_biu_aw_prot          ),
  .wmb_biu_aw_req            (wmb_biu_aw_req           ),
  .wmb_biu_aw_req_gateclk_en (wmb_biu_aw_req_gateclk_en),
  .wmb_biu_aw_size           (wmb_biu_aw_size          ),
  .wmb_biu_aw_snoop          (wmb_biu_aw_snoop         ),
  .wmb_biu_aw_user           (wmb_biu_aw_user          ),
  .wmb_biu_w_data            (wmb_biu_w_data           ),
  .wmb_biu_w_id              (wmb_biu_w_id             ),
  .wmb_biu_w_last            (wmb_biu_w_last           ),
  .wmb_biu_w_req             (wmb_biu_w_req            ),
  .wmb_biu_w_strb            (wmb_biu_w_strb           ),
  .wmb_biu_w_vld             (wmb_biu_w_vld            ),
  .wmb_biu_w_wns             (wmb_biu_w_wns            )
);

// &Instance("ct_lsu_pfu","x_ct_lsu_pfu"); @144
ct_lsu_pfu  x_ct_lsu_pfu (
  .amr_wa_cancel             (amr_wa_cancel            ),
  .bus_arb_pfu_ar_grnt       (bus_arb_pfu_ar_grnt      ),
  .bus_arb_pfu_ar_ready      (bus_arb_pfu_ar_ready     ),
  .cp0_lsu_dcache_en         (cp0_lsu_dcache_en        ),
  .cp0_lsu_dcache_pref_en    (cp0_lsu_dcache_pref_en   ),
  .cp0_lsu_icg_en            (cp0_lsu_icg_en           ),
  .cp0_lsu_l2_pref_en        (cp0_lsu_l2_pref_en       ),
  .cp0_lsu_l2_st_pref_en     (cp0_lsu_l2_st_pref_en    ),
  .cp0_lsu_no_op_req         (cp0_lsu_no_op_req        ),
  .cp0_lsu_pfu_mmu_dis       (cp0_lsu_pfu_mmu_dis      ),
  .cp0_lsu_timeout_cnt       (cp0_lsu_timeout_cnt      ),
  .cp0_yy_clk_en             (cp0_yy_clk_en            ),
  .cp0_yy_dcache_pref_en     (cp0_yy_dcache_pref_en    ),
  .cp0_yy_priv_mode          (cp0_yy_priv_mode         ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .icc_idle                  (icc_idle                 ),
  .ld_da_iid                 (ld_da_iid                ),
  .ld_da_ldfifo_pc           (ld_da_ldfifo_pc          ),
  .ld_da_page_sec_ff         (ld_da_page_sec_ff        ),
  .ld_da_page_share_ff       (ld_da_page_share_ff      ),
  .ld_da_pfu_act_dp_vld      (ld_da_pfu_act_dp_vld     ),
  .ld_da_pfu_act_vld         (ld_da_pfu_act_vld        ),
  .ld_da_pfu_biu_req_hit_idx (ld_da_pfu_biu_req_hit_idx),
  .ld_da_pfu_evict_cnt_vld   (ld_da_pfu_evict_cnt_vld  ),
  .ld_da_pfu_pf_inst_vld     (ld_da_pfu_pf_inst_vld    ),
  .ld_da_pfu_va              (ld_da_pfu_va             ),
  .ld_da_ppfu_va             (ld_da_ppfu_va            ),
  .ld_da_ppn_ff              (ld_da_ppn_ff             ),
  .lfb_addr_full             (lfb_addr_full            ),
  .lfb_addr_less2            (lfb_addr_less2           ),
  .lfb_pfu_biu_req_hit_idx   (lfb_pfu_biu_req_hit_idx  ),
  .lfb_pfu_create_id         (lfb_pfu_create_id        ),
  .lfb_pfu_dcache_hit        (lfb_pfu_dcache_hit       ),
  .lfb_pfu_dcache_miss       (lfb_pfu_dcache_miss      ),
  .lfb_pfu_rready_grnt       (lfb_pfu_rready_grnt      ),
  .lm_pfu_biu_req_hit_idx    (lm_pfu_biu_req_hit_idx   ),
  .lsu_mmu_va2               (lsu_mmu_va2              ),
  .lsu_mmu_va2_vld           (lsu_mmu_va2_vld          ),
  .lsu_pfu_l1_dist_sel       (lsu_pfu_l1_dist_sel      ),
  .lsu_pfu_l2_dist_sel       (lsu_pfu_l2_dist_sel      ),
  .lsu_special_clk           (lsu_special_clk          ),
  .mmu_lsu_pa2               (mmu_lsu_pa2              ),
  .mmu_lsu_pa2_err           (mmu_lsu_pa2_err          ),
  .mmu_lsu_pa2_vld           (mmu_lsu_pa2_vld          ),
  .mmu_lsu_sec2              (mmu_lsu_sec2             ),
  .mmu_lsu_share2            (mmu_lsu_share2           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .pfu_biu_ar_addr           (pfu_biu_ar_addr          ),
  .pfu_biu_ar_bar            (pfu_biu_ar_bar           ),
  .pfu_biu_ar_burst          (pfu_biu_ar_burst         ),
  .pfu_biu_ar_cache          (pfu_biu_ar_cache         ),
  .pfu_biu_ar_domain         (pfu_biu_ar_domain        ),
  .pfu_biu_ar_dp_req         (pfu_biu_ar_dp_req        ),
  .pfu_biu_ar_id             (pfu_biu_ar_id            ),
  .pfu_biu_ar_len            (pfu_biu_ar_len           ),
  .pfu_biu_ar_lock           (pfu_biu_ar_lock          ),
  .pfu_biu_ar_prot           (pfu_biu_ar_prot          ),
  .pfu_biu_ar_req            (pfu_biu_ar_req           ),
  .pfu_biu_ar_req_gateclk_en (pfu_biu_ar_req_gateclk_en),
  .pfu_biu_ar_size           (pfu_biu_ar_size          ),
  .pfu_biu_ar_snoop          (pfu_biu_ar_snoop         ),
  .pfu_biu_ar_user           (pfu_biu_ar_user          ),
  .pfu_biu_req_addr          (pfu_biu_req_addr         ),
  .pfu_icc_ready             (pfu_icc_ready            ),
  .pfu_lfb_create_dp_vld     (pfu_lfb_create_dp_vld    ),
  .pfu_lfb_create_gateclk_en (pfu_lfb_create_gateclk_en),
  .pfu_lfb_create_req        (pfu_lfb_create_req       ),
  .pfu_lfb_create_vld        (pfu_lfb_create_vld       ),
  .pfu_lfb_id                (pfu_lfb_id               ),
  .pfu_part_empty            (pfu_part_empty           ),
  .pfu_pfb_empty             (pfu_pfb_empty            ),
  .pfu_sdb_create_gateclk_en (pfu_sdb_create_gateclk_en),
  .pfu_sdb_empty             (pfu_sdb_empty            ),
  .rb_pfu_biu_req_hit_idx    (rb_pfu_biu_req_hit_idx   ),
  .rb_pfu_nc_no_pending      (rb_pfu_nc_no_pending     ),
  .rtu_yy_xx_commit0         (rtu_yy_xx_commit0        ),
  .rtu_yy_xx_commit0_iid     (rtu_yy_xx_commit0_iid    ),
  .rtu_yy_xx_commit1         (rtu_yy_xx_commit1        ),
  .rtu_yy_xx_commit1_iid     (rtu_yy_xx_commit1_iid    ),
  .rtu_yy_xx_commit2         (rtu_yy_xx_commit2        ),
  .rtu_yy_xx_commit2_iid     (rtu_yy_xx_commit2_iid    ),
  .rtu_yy_xx_flush           (rtu_yy_xx_flush          ),
  .sq_pfu_pop_synci_inst     (sq_pfu_pop_synci_inst    ),
  .st_da_iid                 (st_da_iid                ),
  .st_da_page_sec_ff         (st_da_page_sec_ff        ),
  .st_da_page_share_ff       (st_da_page_share_ff      ),
  .st_da_pc                  (st_da_pc                 ),
  .st_da_pfu_act_dp_vld      (st_da_pfu_act_dp_vld     ),
  .st_da_pfu_act_vld         (st_da_pfu_act_vld        ),
  .st_da_pfu_biu_req_hit_idx (st_da_pfu_biu_req_hit_idx),
  .st_da_pfu_evict_cnt_vld   (st_da_pfu_evict_cnt_vld  ),
  .st_da_pfu_pf_inst_vld     (st_da_pfu_pf_inst_vld    ),
  .st_da_ppfu_va             (st_da_ppfu_va            ),
  .st_da_ppn_ff              (st_da_ppn_ff             ),
  .vb_pfu_biu_req_hit_idx    (vb_pfu_biu_req_hit_idx   ),
  .wmb_pfu_biu_req_hit_idx   (wmb_pfu_biu_req_hit_idx  )
);

// &Instance("ct_lsu_cache_buffer","x_ct_lsu_cache_buffer"); @145
ct_lsu_cache_buffer  x_ct_lsu_cache_buffer (
  .cb_ld_da_data                   (cb_ld_da_data                  ),
  .cb_ld_da_data_vld               (cb_ld_da_data_vld              ),
  .cb_ld_dc_addr_hit               (cb_ld_dc_addr_hit              ),
  .cp0_lsu_cb_aclr_dis             (cp0_lsu_cb_aclr_dis            ),
  .cp0_lsu_dcache_en               (cp0_lsu_dcache_en              ),
  .cp0_lsu_icg_en                  (cp0_lsu_icg_en                 ),
  .cp0_lsu_no_op_req               (cp0_lsu_no_op_req              ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cpurst_b                        (cpurst_b                       ),
  .dcache_idx                      (dcache_idx                     ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .icc_idle                        (icc_idle                       ),
  .ld_da_cb_data                   (ld_da_cb_data                  ),
  .ld_da_cb_data_vld               (ld_da_cb_data_vld              ),
  .ld_da_cb_ecc_cancel             (ld_da_cb_ecc_cancel            ),
  .ld_da_cb_ld_inst_vld            (ld_da_cb_ld_inst_vld           ),
  .ld_dc_addr1                     (ld_dc_addr1                    ),
  .ld_dc_cb_addr_create_gateclk_en (ld_dc_cb_addr_create_gateclk_en),
  .ld_dc_cb_addr_create_vld        (ld_dc_cb_addr_create_vld       ),
  .ld_dc_cb_addr_tto4              (ld_dc_cb_addr_tto4             ),
  .lsu_dcache_ld_xx_gwen           (lsu_dcache_ld_xx_gwen          ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             )
);

// &Instance("ct_lsu_spec_fail_predict","x_ct_lsu_spec_fail_predict"); @146
ct_lsu_spec_fail_predict  x_ct_lsu_spec_fail_predict (
  .cp0_lsu_icg_en             (cp0_lsu_icg_en            ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .ld_da_sf_addr_tto4         (ld_da_sf_addr_tto4        ),
  .ld_da_sf_bytes_vld         (ld_da_sf_bytes_vld        ),
  .ld_da_sf_spec_chk_req      (ld_da_sf_spec_chk_req     ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .rtu_lsu_spec_fail_flush    (rtu_lsu_spec_fail_flush   ),
  .rtu_lsu_spec_fail_iid      (rtu_lsu_spec_fail_iid     ),
  .rtu_yy_xx_flush            (rtu_yy_xx_flush           ),
  .sf_spec_hit                (sf_spec_hit               ),
  .sf_spec_mark               (sf_spec_mark              ),
  .st_da_sf_addr_tto4         (st_da_sf_addr_tto4        ),
  .st_da_sf_bytes_vld         (st_da_sf_bytes_vld        ),
  .st_da_sf_iid               (st_da_sf_iid              ),
  .st_da_sf_no_spec_miss      (st_da_sf_no_spec_miss     ),
  .st_da_sf_no_spec_miss_gate (st_da_sf_no_spec_miss_gate),
  .st_da_sf_spec_chk          (st_da_sf_spec_chk         ),
  .st_da_sf_spec_chk_gate     (st_da_sf_spec_chk_gate    )
);


//==========================================================
//                    VECTOR
//==========================================================
// &Instance("ct_lsu_vmb","x_ct_lsu_vmb"); @152
assign vmb_empty = 1'b1;
assign vmb_ld_wb_data_req = 1'b0;

//for ecc info
// &Instance("ct_lsu_ecc_info","x_ct_lsu_ecc_info"); @160
//&Instance("ct_lsu_snq_assert","x_ct_lsu_snq_assert");


//dcache icc assertion

// &ModuleEnd; @1199
endmodule


