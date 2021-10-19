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

// &ModuleBeg; @26
module ct_idu_rf_dp(
  aiq0_dp_issue_entry,
  aiq0_dp_issue_read_data,
  aiq0_xx_gateclk_issue_en,
  aiq0_xx_issue_en,
  aiq1_dp_issue_entry,
  aiq1_dp_issue_read_data,
  aiq1_xx_gateclk_issue_en,
  aiq1_xx_issue_en,
  biq_dp_issue_entry,
  biq_dp_issue_read_data,
  biq_xx_gateclk_issue_en,
  biq_xx_issue_en,
  cp0_idu_icg_en,
  cp0_lsu_fencei_broad_dis,
  cp0_lsu_fencerw_broad_dis,
  cp0_lsu_tlb_broad_dis,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_dp_rf_pipe0_other_lch_fail,
  ctrl_dp_rf_pipe3_other_lch_fail,
  ctrl_dp_rf_pipe4_other_lch_fail,
  ctrl_dp_rf_pipe5_other_lch_fail,
  ctrl_dp_rf_pipe6_other_lch_fail,
  ctrl_dp_rf_pipe7_other_lch_fail,
  dp_aiq0_rf_lch_entry,
  dp_aiq0_rf_rdy_clr,
  dp_aiq1_rf_lch_entry,
  dp_aiq1_rf_rdy_clr,
  dp_biq_rf_lch_entry,
  dp_biq_rf_rdy_clr,
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
  dp_fwd_rf_pipe0_src0_preg,
  dp_fwd_rf_pipe0_src1_preg,
  dp_fwd_rf_pipe1_mla,
  dp_fwd_rf_pipe1_src0_preg,
  dp_fwd_rf_pipe1_src1_preg,
  dp_fwd_rf_pipe2_src0_preg,
  dp_fwd_rf_pipe2_src1_preg,
  dp_fwd_rf_pipe3_src0_preg,
  dp_fwd_rf_pipe3_src1_preg,
  dp_fwd_rf_pipe4_src0_preg,
  dp_fwd_rf_pipe4_src1_preg,
  dp_fwd_rf_pipe5_src0_preg,
  dp_fwd_rf_pipe5_srcv0_vreg,
  dp_fwd_rf_pipe6_srcv0_vreg,
  dp_fwd_rf_pipe6_srcv1_vreg,
  dp_fwd_rf_pipe6_srcv2_vreg,
  dp_fwd_rf_pipe6_srcvm_vreg,
  dp_fwd_rf_pipe6_vmla,
  dp_fwd_rf_pipe7_srcv0_vreg,
  dp_fwd_rf_pipe7_srcv1_vreg,
  dp_fwd_rf_pipe7_srcv2_vreg,
  dp_fwd_rf_pipe7_srcvm_vreg,
  dp_fwd_rf_pipe7_vmla,
  dp_lsiq_rf_pipe3_lch_entry,
  dp_lsiq_rf_pipe3_rdy_clr,
  dp_lsiq_rf_pipe4_lch_entry,
  dp_lsiq_rf_pipe4_rdy_clr,
  dp_prf_rf_pipe0_src0_preg,
  dp_prf_rf_pipe0_src1_preg,
  dp_prf_rf_pipe1_src0_preg,
  dp_prf_rf_pipe1_src1_preg,
  dp_prf_rf_pipe2_src0_preg,
  dp_prf_rf_pipe2_src1_preg,
  dp_prf_rf_pipe3_src0_preg,
  dp_prf_rf_pipe3_src1_preg,
  dp_prf_rf_pipe4_src0_preg,
  dp_prf_rf_pipe4_src1_preg,
  dp_prf_rf_pipe5_src0_preg,
  dp_prf_rf_pipe5_srcv0_vreg_fr,
  dp_prf_rf_pipe5_srcv0_vreg_vr0,
  dp_prf_rf_pipe5_srcv0_vreg_vr1,
  dp_prf_rf_pipe6_srcv0_vreg_fr,
  dp_prf_rf_pipe6_srcv0_vreg_vr0,
  dp_prf_rf_pipe6_srcv0_vreg_vr1,
  dp_prf_rf_pipe6_srcv1_vreg_fr,
  dp_prf_rf_pipe6_srcv1_vreg_vr0,
  dp_prf_rf_pipe6_srcv1_vreg_vr1,
  dp_prf_rf_pipe6_srcv2_vreg_fr,
  dp_prf_rf_pipe6_srcv2_vreg_vr0,
  dp_prf_rf_pipe6_srcv2_vreg_vr1,
  dp_prf_rf_pipe6_srcvm_vreg_vr0,
  dp_prf_rf_pipe6_srcvm_vreg_vr1,
  dp_prf_rf_pipe7_srcv0_vreg_fr,
  dp_prf_rf_pipe7_srcv0_vreg_vr0,
  dp_prf_rf_pipe7_srcv0_vreg_vr1,
  dp_prf_rf_pipe7_srcv1_vreg_fr,
  dp_prf_rf_pipe7_srcv1_vreg_vr0,
  dp_prf_rf_pipe7_srcv1_vreg_vr1,
  dp_prf_rf_pipe7_srcv2_vreg_fr,
  dp_prf_rf_pipe7_srcv2_vreg_vr0,
  dp_prf_rf_pipe7_srcv2_vreg_vr1,
  dp_prf_rf_pipe7_srcvm_vreg_vr0,
  dp_prf_rf_pipe7_srcvm_vreg_vr1,
  dp_sdiq_rf_lch_entry,
  dp_sdiq_rf_rdy_clr,
  dp_sdiq_rf_sdiq_entry,
  dp_sdiq_rf_staddr1_vld,
  dp_sdiq_rf_staddr_rdy_clr,
  dp_sdiq_rf_stdata1_vld,
  dp_viq0_rf_lch_entry,
  dp_viq0_rf_rdy_clr,
  dp_viq1_rf_lch_entry,
  dp_viq1_rf_rdy_clr,
  dp_xx_rf_pipe0_dst_preg_dup0,
  dp_xx_rf_pipe0_dst_preg_dup1,
  dp_xx_rf_pipe0_dst_preg_dup2,
  dp_xx_rf_pipe0_dst_preg_dup3,
  dp_xx_rf_pipe0_dst_preg_dup4,
  dp_xx_rf_pipe1_dst_preg_dup0,
  dp_xx_rf_pipe1_dst_preg_dup1,
  dp_xx_rf_pipe1_dst_preg_dup2,
  dp_xx_rf_pipe1_dst_preg_dup3,
  dp_xx_rf_pipe1_dst_preg_dup4,
  dp_xx_rf_pipe6_dst_vreg_dup0,
  dp_xx_rf_pipe6_dst_vreg_dup1,
  dp_xx_rf_pipe6_dst_vreg_dup2,
  dp_xx_rf_pipe6_dst_vreg_dup3,
  dp_xx_rf_pipe7_dst_vreg_dup0,
  dp_xx_rf_pipe7_dst_vreg_dup1,
  dp_xx_rf_pipe7_dst_vreg_dup2,
  dp_xx_rf_pipe7_dst_vreg_dup3,
  forever_cpuclk,
  fwd_dp_rf_pipe0_src0_data,
  fwd_dp_rf_pipe0_src0_no_fwd,
  fwd_dp_rf_pipe0_src1_data,
  fwd_dp_rf_pipe0_src1_no_fwd,
  fwd_dp_rf_pipe1_src0_data,
  fwd_dp_rf_pipe1_src0_no_fwd,
  fwd_dp_rf_pipe1_src1_data,
  fwd_dp_rf_pipe1_src1_no_fwd,
  fwd_dp_rf_pipe2_src0_data,
  fwd_dp_rf_pipe2_src0_no_fwd,
  fwd_dp_rf_pipe2_src1_data,
  fwd_dp_rf_pipe2_src1_no_fwd,
  fwd_dp_rf_pipe3_src0_data,
  fwd_dp_rf_pipe3_src0_no_fwd,
  fwd_dp_rf_pipe3_src1_data,
  fwd_dp_rf_pipe3_src1_no_fwd,
  fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla,
  fwd_dp_rf_pipe3_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe3_srcvm_vreg_vr1_data,
  fwd_dp_rf_pipe4_src0_data,
  fwd_dp_rf_pipe4_src0_no_fwd,
  fwd_dp_rf_pipe4_src1_data,
  fwd_dp_rf_pipe4_src1_no_fwd,
  fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla,
  fwd_dp_rf_pipe4_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe4_srcvm_vreg_vr1_data,
  fwd_dp_rf_pipe5_src0_data,
  fwd_dp_rf_pipe5_src0_no_fwd,
  fwd_dp_rf_pipe5_src0_no_fwd_expt_mla,
  fwd_dp_rf_pipe5_srcv0_no_fwd,
  fwd_dp_rf_pipe5_srcv0_vreg_fr_data,
  fwd_dp_rf_pipe5_srcv0_vreg_vr0_data,
  fwd_dp_rf_pipe5_srcv0_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcv0_no_fwd,
  fwd_dp_rf_pipe6_srcv0_vreg_fr_data,
  fwd_dp_rf_pipe6_srcv0_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcv0_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcv1_no_fwd,
  fwd_dp_rf_pipe6_srcv1_vreg_fr_data,
  fwd_dp_rf_pipe6_srcv1_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcv1_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcv2_no_fwd,
  fwd_dp_rf_pipe6_srcv2_vreg_fr_data,
  fwd_dp_rf_pipe6_srcv2_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcv2_vreg_vr1_data,
  fwd_dp_rf_pipe6_srcvm_no_fwd,
  fwd_dp_rf_pipe6_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe6_srcvm_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcv0_no_fwd,
  fwd_dp_rf_pipe7_srcv0_vreg_fr_data,
  fwd_dp_rf_pipe7_srcv0_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcv0_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcv1_no_fwd,
  fwd_dp_rf_pipe7_srcv1_vreg_fr_data,
  fwd_dp_rf_pipe7_srcv1_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcv1_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcv2_no_fwd,
  fwd_dp_rf_pipe7_srcv2_vreg_fr_data,
  fwd_dp_rf_pipe7_srcv2_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcv2_vreg_vr1_data,
  fwd_dp_rf_pipe7_srcvm_no_fwd,
  fwd_dp_rf_pipe7_srcvm_vreg_vr0_data,
  fwd_dp_rf_pipe7_srcvm_vreg_vr1_data,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  idu_cp0_rf_func,
  idu_cp0_rf_iid,
  idu_cp0_rf_opcode,
  idu_cp0_rf_preg,
  idu_cp0_rf_src0,
  idu_iu_rf_pipe0_alu_short,
  idu_iu_rf_pipe0_dst_preg,
  idu_iu_rf_pipe0_dst_vld,
  idu_iu_rf_pipe0_dst_vreg,
  idu_iu_rf_pipe0_dstv_vld,
  idu_iu_rf_pipe0_expt_vec,
  idu_iu_rf_pipe0_expt_vld,
  idu_iu_rf_pipe0_func,
  idu_iu_rf_pipe0_high_hw_expt,
  idu_iu_rf_pipe0_iid,
  idu_iu_rf_pipe0_imm,
  idu_iu_rf_pipe0_opcode,
  idu_iu_rf_pipe0_pid,
  idu_iu_rf_pipe0_rslt_sel,
  idu_iu_rf_pipe0_special_imm,
  idu_iu_rf_pipe0_src0,
  idu_iu_rf_pipe0_src1,
  idu_iu_rf_pipe0_src1_no_imm,
  idu_iu_rf_pipe0_src2,
  idu_iu_rf_pipe0_vl,
  idu_iu_rf_pipe0_vlmul,
  idu_iu_rf_pipe0_vsew,
  idu_iu_rf_pipe1_alu_short,
  idu_iu_rf_pipe1_dst_preg,
  idu_iu_rf_pipe1_dst_vld,
  idu_iu_rf_pipe1_dst_vreg,
  idu_iu_rf_pipe1_dstv_vld,
  idu_iu_rf_pipe1_func,
  idu_iu_rf_pipe1_iid,
  idu_iu_rf_pipe1_imm,
  idu_iu_rf_pipe1_mla_src2_preg,
  idu_iu_rf_pipe1_mla_src2_vld,
  idu_iu_rf_pipe1_mult_func,
  idu_iu_rf_pipe1_rslt_sel,
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
  idu_lsu_rf_pipe3_already_da,
  idu_lsu_rf_pipe3_atomic,
  idu_lsu_rf_pipe3_bkpta_data,
  idu_lsu_rf_pipe3_bkptb_data,
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
  idu_lsu_rf_pipe4_shift,
  idu_lsu_rf_pipe4_spec_fail,
  idu_lsu_rf_pipe4_split,
  idu_lsu_rf_pipe4_src0,
  idu_lsu_rf_pipe4_src1,
  idu_lsu_rf_pipe4_st,
  idu_lsu_rf_pipe4_staddr,
  idu_lsu_rf_pipe4_sync_fence,
  idu_lsu_rf_pipe4_unalign_2nd,
  idu_lsu_rf_pipe5_sdiq_entry,
  idu_lsu_rf_pipe5_src0,
  idu_lsu_rf_pipe5_srcv0_fr,
  idu_lsu_rf_pipe5_srcv0_fr_vld,
  idu_lsu_rf_pipe5_srcv0_vld,
  idu_lsu_rf_pipe5_srcv0_vr0,
  idu_lsu_rf_pipe5_srcv0_vr1,
  idu_lsu_rf_pipe5_stdata1_vld,
  idu_lsu_rf_pipe5_unalign,
  idu_vfpu_rf_pipe6_dst_ereg,
  idu_vfpu_rf_pipe6_dst_preg,
  idu_vfpu_rf_pipe6_dst_vld,
  idu_vfpu_rf_pipe6_dst_vreg,
  idu_vfpu_rf_pipe6_dste_vld,
  idu_vfpu_rf_pipe6_dstv_vld,
  idu_vfpu_rf_pipe6_eu_sel,
  idu_vfpu_rf_pipe6_func,
  idu_vfpu_rf_pipe6_iid,
  idu_vfpu_rf_pipe6_imm0,
  idu_vfpu_rf_pipe6_inst_type,
  idu_vfpu_rf_pipe6_mla_srcv2_vld,
  idu_vfpu_rf_pipe6_mla_srcv2_vreg,
  idu_vfpu_rf_pipe6_ready_stage,
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
  idu_vfpu_rf_pipe7_iid,
  idu_vfpu_rf_pipe7_imm0,
  idu_vfpu_rf_pipe7_inst_type,
  idu_vfpu_rf_pipe7_mla_srcv2_vld,
  idu_vfpu_rf_pipe7_mla_srcv2_vreg,
  idu_vfpu_rf_pipe7_ready_stage,
  idu_vfpu_rf_pipe7_srcv0_fr,
  idu_vfpu_rf_pipe7_srcv1_fr,
  idu_vfpu_rf_pipe7_srcv2_fr,
  idu_vfpu_rf_pipe7_vmla_type,
  lsiq_dp_pipe3_issue_entry,
  lsiq_dp_pipe3_issue_read_data,
  lsiq_dp_pipe4_issue_entry,
  lsiq_dp_pipe4_issue_read_data,
  lsiq_xx_gateclk_issue_en,
  lsiq_xx_pipe3_issue_en,
  lsiq_xx_pipe4_issue_en,
  lsu_idu_dc_sdiq_entry,
  lsu_idu_dc_staddr1_vld,
  lsu_idu_dc_staddr_unalign,
  lsu_idu_dc_staddr_vld,
  pad_yy_icg_scan_en,
  prf_dp_rf_pipe0_src0_data,
  prf_dp_rf_pipe0_src1_data,
  prf_dp_rf_pipe2_src0_data,
  prf_dp_rf_pipe2_src1_data,
  prf_dp_rf_pipe3_src0_data,
  prf_dp_rf_pipe3_src1_data,
  prf_dp_rf_pipe4_src0_data,
  prf_dp_rf_pipe4_src1_data,
  prf_dp_rf_pipe5_src0_data,
  prf_dp_rf_pipe5_srcv0_vreg_fr_data,
  prf_dp_rf_pipe5_srcv0_vreg_vr0_data,
  prf_dp_rf_pipe5_srcv0_vreg_vr1_data,
  prf_dp_rf_pipe6_srcv0_vreg_fr_data,
  prf_dp_rf_pipe6_srcv0_vreg_vr0_data,
  prf_dp_rf_pipe6_srcv0_vreg_vr1_data,
  prf_dp_rf_pipe6_srcv1_vreg_fr_data,
  prf_dp_rf_pipe6_srcv1_vreg_vr0_data,
  prf_dp_rf_pipe6_srcv1_vreg_vr1_data,
  prf_dp_rf_pipe6_srcv2_vreg_fr_data,
  prf_dp_rf_pipe6_srcv2_vreg_vr0_data,
  prf_dp_rf_pipe6_srcv2_vreg_vr1_data,
  prf_dp_rf_pipe6_srcvm_vreg_vr0_data,
  prf_dp_rf_pipe6_srcvm_vreg_vr1_data,
  prf_dp_rf_pipe7_srcv0_vreg_fr_data,
  prf_dp_rf_pipe7_srcv0_vreg_vr0_data,
  prf_dp_rf_pipe7_srcv0_vreg_vr1_data,
  prf_dp_rf_pipe7_srcv1_vreg_fr_data,
  prf_dp_rf_pipe7_srcv1_vreg_vr0_data,
  prf_dp_rf_pipe7_srcv1_vreg_vr1_data,
  prf_dp_rf_pipe7_srcv2_vreg_fr_data,
  prf_dp_rf_pipe7_srcv2_vreg_vr0_data,
  prf_dp_rf_pipe7_srcv2_vreg_vr1_data,
  prf_dp_rf_pipe7_srcvm_vreg_vr0_data,
  prf_dp_rf_pipe7_srcvm_vreg_vr1_data,
  prf_xx_rf_pipe1_src0_data,
  prf_xx_rf_pipe1_src1_data,
  rtu_idu_flush_fe,
  rtu_idu_flush_is,
  sdiq_dp_issue_entry,
  sdiq_dp_issue_read_data,
  sdiq_xx_gateclk_issue_en,
  sdiq_xx_issue_en,
  viq0_dp_issue_entry,
  viq0_dp_issue_read_data,
  viq0_xx_gateclk_issue_en,
  viq0_xx_issue_en,
  viq1_dp_issue_entry,
  viq1_dp_issue_read_data,
  viq1_xx_gateclk_issue_en,
  viq1_xx_issue_en
);

// &Ports; @27
input   [7  :0]  aiq0_dp_issue_entry;                   
input   [226:0]  aiq0_dp_issue_read_data;               
input            aiq0_xx_gateclk_issue_en;              
input            aiq0_xx_issue_en;                      
input   [7  :0]  aiq1_dp_issue_entry;                   
input   [213:0]  aiq1_dp_issue_read_data;               
input            aiq1_xx_gateclk_issue_en;              
input            aiq1_xx_issue_en;                      
input   [11 :0]  biq_dp_issue_entry;                    
input   [81 :0]  biq_dp_issue_read_data;                
input            biq_xx_gateclk_issue_en;               
input            biq_xx_issue_en;                       
input            cp0_idu_icg_en;                        
input            cp0_lsu_fencei_broad_dis;              
input            cp0_lsu_fencerw_broad_dis;             
input            cp0_lsu_tlb_broad_dis;                 
input            cp0_yy_clk_en;                         
input            cpurst_b;                              
input            ctrl_dp_rf_pipe0_other_lch_fail;       
input            ctrl_dp_rf_pipe3_other_lch_fail;       
input            ctrl_dp_rf_pipe4_other_lch_fail;       
input            ctrl_dp_rf_pipe5_other_lch_fail;       
input            ctrl_dp_rf_pipe6_other_lch_fail;       
input            ctrl_dp_rf_pipe7_other_lch_fail;       
input            forever_cpuclk;                        
input   [63 :0]  fwd_dp_rf_pipe0_src0_data;             
input            fwd_dp_rf_pipe0_src0_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe0_src1_data;             
input            fwd_dp_rf_pipe0_src1_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe1_src0_data;             
input            fwd_dp_rf_pipe1_src0_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe1_src1_data;             
input            fwd_dp_rf_pipe1_src1_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe2_src0_data;             
input            fwd_dp_rf_pipe2_src0_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe2_src1_data;             
input            fwd_dp_rf_pipe2_src1_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe3_src0_data;             
input            fwd_dp_rf_pipe3_src0_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe3_src1_data;             
input            fwd_dp_rf_pipe3_src1_no_fwd;           
input            fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla; 
input   [63 :0]  fwd_dp_rf_pipe3_srcvm_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe3_srcvm_vreg_vr1_data;   
input   [63 :0]  fwd_dp_rf_pipe4_src0_data;             
input            fwd_dp_rf_pipe4_src0_no_fwd;           
input   [63 :0]  fwd_dp_rf_pipe4_src1_data;             
input            fwd_dp_rf_pipe4_src1_no_fwd;           
input            fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla; 
input   [63 :0]  fwd_dp_rf_pipe4_srcvm_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe4_srcvm_vreg_vr1_data;   
input   [63 :0]  fwd_dp_rf_pipe5_src0_data;             
input            fwd_dp_rf_pipe5_src0_no_fwd;           
input            fwd_dp_rf_pipe5_src0_no_fwd_expt_mla;  
input            fwd_dp_rf_pipe5_srcv0_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe5_srcv0_vreg_fr_data;    
input   [63 :0]  fwd_dp_rf_pipe5_srcv0_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe5_srcv0_vreg_vr1_data;   
input            fwd_dp_rf_pipe6_srcv0_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe6_srcv0_vreg_fr_data;    
input   [63 :0]  fwd_dp_rf_pipe6_srcv0_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe6_srcv0_vreg_vr1_data;   
input            fwd_dp_rf_pipe6_srcv1_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe6_srcv1_vreg_fr_data;    
input   [63 :0]  fwd_dp_rf_pipe6_srcv1_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe6_srcv1_vreg_vr1_data;   
input            fwd_dp_rf_pipe6_srcv2_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe6_srcv2_vreg_fr_data;    
input   [63 :0]  fwd_dp_rf_pipe6_srcv2_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe6_srcv2_vreg_vr1_data;   
input            fwd_dp_rf_pipe6_srcvm_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe6_srcvm_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe6_srcvm_vreg_vr1_data;   
input            fwd_dp_rf_pipe7_srcv0_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe7_srcv0_vreg_fr_data;    
input   [63 :0]  fwd_dp_rf_pipe7_srcv0_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe7_srcv0_vreg_vr1_data;   
input            fwd_dp_rf_pipe7_srcv1_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe7_srcv1_vreg_fr_data;    
input   [63 :0]  fwd_dp_rf_pipe7_srcv1_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe7_srcv1_vreg_vr1_data;   
input            fwd_dp_rf_pipe7_srcv2_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe7_srcv2_vreg_fr_data;    
input   [63 :0]  fwd_dp_rf_pipe7_srcv2_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe7_srcv2_vreg_vr1_data;   
input            fwd_dp_rf_pipe7_srcvm_no_fwd;          
input   [63 :0]  fwd_dp_rf_pipe7_srcvm_vreg_vr0_data;   
input   [63 :0]  fwd_dp_rf_pipe7_srcvm_vreg_vr1_data;   
input   [63 :0]  had_idu_wbbr_data;                     
input            had_idu_wbbr_vld;                      
input   [11 :0]  lsiq_dp_pipe3_issue_entry;             
input   [162:0]  lsiq_dp_pipe3_issue_read_data;         
input   [11 :0]  lsiq_dp_pipe4_issue_entry;             
input   [162:0]  lsiq_dp_pipe4_issue_read_data;         
input            lsiq_xx_gateclk_issue_en;              
input            lsiq_xx_pipe3_issue_en;                
input            lsiq_xx_pipe4_issue_en;                
input   [11 :0]  lsu_idu_dc_sdiq_entry;                 
input            lsu_idu_dc_staddr1_vld;                
input            lsu_idu_dc_staddr_unalign;             
input            lsu_idu_dc_staddr_vld;                 
input            pad_yy_icg_scan_en;                    
input   [63 :0]  prf_dp_rf_pipe0_src0_data;             
input   [63 :0]  prf_dp_rf_pipe0_src1_data;             
input   [63 :0]  prf_dp_rf_pipe2_src0_data;             
input   [63 :0]  prf_dp_rf_pipe2_src1_data;             
input   [63 :0]  prf_dp_rf_pipe3_src0_data;             
input   [63 :0]  prf_dp_rf_pipe3_src1_data;             
input   [63 :0]  prf_dp_rf_pipe4_src0_data;             
input   [63 :0]  prf_dp_rf_pipe4_src1_data;             
input   [63 :0]  prf_dp_rf_pipe5_src0_data;             
input   [63 :0]  prf_dp_rf_pipe5_srcv0_vreg_fr_data;    
input   [63 :0]  prf_dp_rf_pipe5_srcv0_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe5_srcv0_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcv0_vreg_fr_data;    
input   [63 :0]  prf_dp_rf_pipe6_srcv0_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcv0_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcv1_vreg_fr_data;    
input   [63 :0]  prf_dp_rf_pipe6_srcv1_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcv1_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcv2_vreg_fr_data;    
input   [63 :0]  prf_dp_rf_pipe6_srcv2_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcv2_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcvm_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe6_srcvm_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcv0_vreg_fr_data;    
input   [63 :0]  prf_dp_rf_pipe7_srcv0_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcv0_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcv1_vreg_fr_data;    
input   [63 :0]  prf_dp_rf_pipe7_srcv1_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcv1_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcv2_vreg_fr_data;    
input   [63 :0]  prf_dp_rf_pipe7_srcv2_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcv2_vreg_vr1_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcvm_vreg_vr0_data;   
input   [63 :0]  prf_dp_rf_pipe7_srcvm_vreg_vr1_data;   
input   [63 :0]  prf_xx_rf_pipe1_src0_data;             
input   [63 :0]  prf_xx_rf_pipe1_src1_data;             
input            rtu_idu_flush_fe;                      
input            rtu_idu_flush_is;                      
input   [11 :0]  sdiq_dp_issue_entry;                   
input   [26 :0]  sdiq_dp_issue_read_data;               
input            sdiq_xx_gateclk_issue_en;              
input            sdiq_xx_issue_en;                      
input   [7  :0]  viq0_dp_issue_entry;                   
input   [150:0]  viq0_dp_issue_read_data;               
input            viq0_xx_gateclk_issue_en;              
input            viq0_xx_issue_en;                      
input   [7  :0]  viq1_dp_issue_entry;                   
input   [149:0]  viq1_dp_issue_read_data;               
input            viq1_xx_gateclk_issue_en;              
input            viq1_xx_issue_en;                      
output  [7  :0]  dp_aiq0_rf_lch_entry;                  
output  [2  :0]  dp_aiq0_rf_rdy_clr;                    
output  [7  :0]  dp_aiq1_rf_lch_entry;                  
output  [2  :0]  dp_aiq1_rf_rdy_clr;                    
output  [11 :0]  dp_biq_rf_lch_entry;                   
output  [1  :0]  dp_biq_rf_rdy_clr;                     
output           dp_ctrl_is_aiq0_issue_alu_short;       
output           dp_ctrl_is_aiq0_issue_div;             
output           dp_ctrl_is_aiq0_issue_dst_vld;         
output           dp_ctrl_is_aiq0_issue_lch_preg;        
output  [107:0]  dp_ctrl_is_aiq0_issue_lch_rdy;         
output           dp_ctrl_is_aiq0_issue_special;         
output           dp_ctrl_is_aiq1_issue_alu_short;       
output           dp_ctrl_is_aiq1_issue_dst_vld;         
output           dp_ctrl_is_aiq1_issue_lch_preg;        
output  [107:0]  dp_ctrl_is_aiq1_issue_lch_rdy;         
output  [7  :0]  dp_ctrl_is_aiq1_issue_mla_lch_rdy;     
output           dp_ctrl_is_aiq1_issue_mla_vld;         
output           dp_ctrl_is_viq0_issue_dstv_vld;        
output  [15 :0]  dp_ctrl_is_viq0_issue_lch_rdy;         
output           dp_ctrl_is_viq0_issue_vdiv;            
output           dp_ctrl_is_viq0_issue_vmla_rf;         
output           dp_ctrl_is_viq0_issue_vmla_short;      
output           dp_ctrl_is_viq1_issue_dstv_vld;        
output  [15 :0]  dp_ctrl_is_viq1_issue_lch_rdy;         
output           dp_ctrl_is_viq1_issue_vmla_rf;         
output           dp_ctrl_is_viq1_issue_vmla_short;      
output  [3  :0]  dp_ctrl_rf_pipe0_eu_sel;               
output           dp_ctrl_rf_pipe0_mtvr;                 
output           dp_ctrl_rf_pipe0_src2_vld;             
output           dp_ctrl_rf_pipe0_src_no_rdy;           
output  [1  :0]  dp_ctrl_rf_pipe1_eu_sel;               
output           dp_ctrl_rf_pipe1_mtvr;                 
output           dp_ctrl_rf_pipe1_src2_vld;             
output           dp_ctrl_rf_pipe1_src_no_rdy;           
output           dp_ctrl_rf_pipe2_src_no_rdy;           
output           dp_ctrl_rf_pipe3_src1_vld;             
output           dp_ctrl_rf_pipe3_src_no_rdy;           
output           dp_ctrl_rf_pipe3_srcvm_vld;            
output           dp_ctrl_rf_pipe4_src_no_rdy;           
output           dp_ctrl_rf_pipe4_srcvm_vld;            
output           dp_ctrl_rf_pipe4_staddr;               
output           dp_ctrl_rf_pipe5_src0_vld;             
output           dp_ctrl_rf_pipe5_src_no_rdy;           
output           dp_ctrl_rf_pipe6_mfvr;                 
output           dp_ctrl_rf_pipe6_src_no_rdy;           
output           dp_ctrl_rf_pipe6_srcv2_vld;            
output           dp_ctrl_rf_pipe6_vmul;                 
output           dp_ctrl_rf_pipe7_mfvr;                 
output           dp_ctrl_rf_pipe7_src_no_rdy;           
output           dp_ctrl_rf_pipe7_srcv2_vld;            
output           dp_ctrl_rf_pipe7_vmul_unsplit;         
output  [6  :0]  dp_fwd_rf_pipe0_src0_preg;             
output  [6  :0]  dp_fwd_rf_pipe0_src1_preg;             
output           dp_fwd_rf_pipe1_mla;                   
output  [6  :0]  dp_fwd_rf_pipe1_src0_preg;             
output  [6  :0]  dp_fwd_rf_pipe1_src1_preg;             
output  [6  :0]  dp_fwd_rf_pipe2_src0_preg;             
output  [6  :0]  dp_fwd_rf_pipe2_src1_preg;             
output  [6  :0]  dp_fwd_rf_pipe3_src0_preg;             
output  [6  :0]  dp_fwd_rf_pipe3_src1_preg;             
output  [6  :0]  dp_fwd_rf_pipe4_src0_preg;             
output  [6  :0]  dp_fwd_rf_pipe4_src1_preg;             
output  [6  :0]  dp_fwd_rf_pipe5_src0_preg;             
output  [6  :0]  dp_fwd_rf_pipe5_srcv0_vreg;            
output  [6  :0]  dp_fwd_rf_pipe6_srcv0_vreg;            
output  [6  :0]  dp_fwd_rf_pipe6_srcv1_vreg;            
output  [6  :0]  dp_fwd_rf_pipe6_srcv2_vreg;            
output  [6  :0]  dp_fwd_rf_pipe6_srcvm_vreg;            
output           dp_fwd_rf_pipe6_vmla;                  
output  [6  :0]  dp_fwd_rf_pipe7_srcv0_vreg;            
output  [6  :0]  dp_fwd_rf_pipe7_srcv1_vreg;            
output  [6  :0]  dp_fwd_rf_pipe7_srcv2_vreg;            
output  [6  :0]  dp_fwd_rf_pipe7_srcvm_vreg;            
output           dp_fwd_rf_pipe7_vmla;                  
output  [11 :0]  dp_lsiq_rf_pipe3_lch_entry;            
output  [2  :0]  dp_lsiq_rf_pipe3_rdy_clr;              
output  [11 :0]  dp_lsiq_rf_pipe4_lch_entry;            
output  [2  :0]  dp_lsiq_rf_pipe4_rdy_clr;              
output  [6  :0]  dp_prf_rf_pipe0_src0_preg;             
output  [6  :0]  dp_prf_rf_pipe0_src1_preg;             
output  [6  :0]  dp_prf_rf_pipe1_src0_preg;             
output  [6  :0]  dp_prf_rf_pipe1_src1_preg;             
output  [6  :0]  dp_prf_rf_pipe2_src0_preg;             
output  [6  :0]  dp_prf_rf_pipe2_src1_preg;             
output  [6  :0]  dp_prf_rf_pipe3_src0_preg;             
output  [6  :0]  dp_prf_rf_pipe3_src1_preg;             
output  [6  :0]  dp_prf_rf_pipe4_src0_preg;             
output  [6  :0]  dp_prf_rf_pipe4_src1_preg;             
output  [6  :0]  dp_prf_rf_pipe5_src0_preg;             
output  [5  :0]  dp_prf_rf_pipe5_srcv0_vreg_fr;         
output  [5  :0]  dp_prf_rf_pipe5_srcv0_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe5_srcv0_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe6_srcv0_vreg_fr;         
output  [5  :0]  dp_prf_rf_pipe6_srcv0_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe6_srcv0_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe6_srcv1_vreg_fr;         
output  [5  :0]  dp_prf_rf_pipe6_srcv1_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe6_srcv1_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe6_srcv2_vreg_fr;         
output  [5  :0]  dp_prf_rf_pipe6_srcv2_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe6_srcv2_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe6_srcvm_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe6_srcvm_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe7_srcv0_vreg_fr;         
output  [5  :0]  dp_prf_rf_pipe7_srcv0_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe7_srcv0_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe7_srcv1_vreg_fr;         
output  [5  :0]  dp_prf_rf_pipe7_srcv1_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe7_srcv1_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe7_srcv2_vreg_fr;         
output  [5  :0]  dp_prf_rf_pipe7_srcv2_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe7_srcv2_vreg_vr1;        
output  [5  :0]  dp_prf_rf_pipe7_srcvm_vreg_vr0;        
output  [5  :0]  dp_prf_rf_pipe7_srcvm_vreg_vr1;        
output  [11 :0]  dp_sdiq_rf_lch_entry;                  
output  [1  :0]  dp_sdiq_rf_rdy_clr;                    
output  [11 :0]  dp_sdiq_rf_sdiq_entry;                 
output           dp_sdiq_rf_staddr1_vld;                
output           dp_sdiq_rf_staddr_rdy_clr;             
output           dp_sdiq_rf_stdata1_vld;                
output  [7  :0]  dp_viq0_rf_lch_entry;                  
output  [3  :0]  dp_viq0_rf_rdy_clr;                    
output  [7  :0]  dp_viq1_rf_lch_entry;                  
output  [3  :0]  dp_viq1_rf_rdy_clr;                    
output  [6  :0]  dp_xx_rf_pipe0_dst_preg_dup0;          
output  [6  :0]  dp_xx_rf_pipe0_dst_preg_dup1;          
output  [6  :0]  dp_xx_rf_pipe0_dst_preg_dup2;          
output  [6  :0]  dp_xx_rf_pipe0_dst_preg_dup3;          
output  [6  :0]  dp_xx_rf_pipe0_dst_preg_dup4;          
output  [6  :0]  dp_xx_rf_pipe1_dst_preg_dup0;          
output  [6  :0]  dp_xx_rf_pipe1_dst_preg_dup1;          
output  [6  :0]  dp_xx_rf_pipe1_dst_preg_dup2;          
output  [6  :0]  dp_xx_rf_pipe1_dst_preg_dup3;          
output  [6  :0]  dp_xx_rf_pipe1_dst_preg_dup4;          
output  [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup0;          
output  [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup1;          
output  [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup2;          
output  [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup3;          
output  [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup0;          
output  [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup1;          
output  [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup2;          
output  [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup3;          
output  [4  :0]  idu_cp0_rf_func;                       
output  [6  :0]  idu_cp0_rf_iid;                        
output  [31 :0]  idu_cp0_rf_opcode;                     
output  [6  :0]  idu_cp0_rf_preg;                       
output  [63 :0]  idu_cp0_rf_src0;                       
output           idu_iu_rf_pipe0_alu_short;             
output  [6  :0]  idu_iu_rf_pipe0_dst_preg;              
output           idu_iu_rf_pipe0_dst_vld;               
output  [6  :0]  idu_iu_rf_pipe0_dst_vreg;              
output           idu_iu_rf_pipe0_dstv_vld;              
output  [4  :0]  idu_iu_rf_pipe0_expt_vec;              
output           idu_iu_rf_pipe0_expt_vld;              
output  [4  :0]  idu_iu_rf_pipe0_func;                  
output           idu_iu_rf_pipe0_high_hw_expt;          
output  [6  :0]  idu_iu_rf_pipe0_iid;                   
output  [5  :0]  idu_iu_rf_pipe0_imm;                   
output  [31 :0]  idu_iu_rf_pipe0_opcode;                
output  [4  :0]  idu_iu_rf_pipe0_pid;                   
output  [20 :0]  idu_iu_rf_pipe0_rslt_sel;              
output  [19 :0]  idu_iu_rf_pipe0_special_imm;           
output  [63 :0]  idu_iu_rf_pipe0_src0;                  
output  [63 :0]  idu_iu_rf_pipe0_src1;                  
output  [63 :0]  idu_iu_rf_pipe0_src1_no_imm;           
output  [63 :0]  idu_iu_rf_pipe0_src2;                  
output  [7  :0]  idu_iu_rf_pipe0_vl;                    
output  [1  :0]  idu_iu_rf_pipe0_vlmul;                 
output  [2  :0]  idu_iu_rf_pipe0_vsew;                  
output           idu_iu_rf_pipe1_alu_short;             
output  [6  :0]  idu_iu_rf_pipe1_dst_preg;              
output           idu_iu_rf_pipe1_dst_vld;               
output  [6  :0]  idu_iu_rf_pipe1_dst_vreg;              
output           idu_iu_rf_pipe1_dstv_vld;              
output  [4  :0]  idu_iu_rf_pipe1_func;                  
output  [6  :0]  idu_iu_rf_pipe1_iid;                   
output  [5  :0]  idu_iu_rf_pipe1_imm;                   
output  [6  :0]  idu_iu_rf_pipe1_mla_src2_preg;         
output           idu_iu_rf_pipe1_mla_src2_vld;          
output  [7  :0]  idu_iu_rf_pipe1_mult_func;             
output  [20 :0]  idu_iu_rf_pipe1_rslt_sel;              
output  [63 :0]  idu_iu_rf_pipe1_src0;                  
output  [63 :0]  idu_iu_rf_pipe1_src1;                  
output  [63 :0]  idu_iu_rf_pipe1_src1_no_imm;           
output  [63 :0]  idu_iu_rf_pipe1_src2;                  
output  [7  :0]  idu_iu_rf_pipe1_vl;                    
output  [1  :0]  idu_iu_rf_pipe1_vlmul;                 
output  [2  :0]  idu_iu_rf_pipe1_vsew;                  
output  [7  :0]  idu_iu_rf_pipe2_func;                  
output  [6  :0]  idu_iu_rf_pipe2_iid;                   
output           idu_iu_rf_pipe2_length;                
output  [20 :0]  idu_iu_rf_pipe2_offset;                
output           idu_iu_rf_pipe2_pcall;                 
output  [4  :0]  idu_iu_rf_pipe2_pid;                   
output           idu_iu_rf_pipe2_rts;                   
output  [63 :0]  idu_iu_rf_pipe2_src0;                  
output  [63 :0]  idu_iu_rf_pipe2_src1;                  
output  [7  :0]  idu_iu_rf_pipe2_vl;                    
output  [1  :0]  idu_iu_rf_pipe2_vlmul;                 
output  [2  :0]  idu_iu_rf_pipe2_vsew;                  
output           idu_lsu_rf_pipe3_already_da;           
output           idu_lsu_rf_pipe3_atomic;               
output           idu_lsu_rf_pipe3_bkpta_data;           
output           idu_lsu_rf_pipe3_bkptb_data;           
output  [6  :0]  idu_lsu_rf_pipe3_iid;                  
output           idu_lsu_rf_pipe3_inst_fls;             
output           idu_lsu_rf_pipe3_inst_ldr;             
output  [1  :0]  idu_lsu_rf_pipe3_inst_size;            
output  [1  :0]  idu_lsu_rf_pipe3_inst_type;            
output  [11 :0]  idu_lsu_rf_pipe3_lch_entry;            
output           idu_lsu_rf_pipe3_lsfifo;               
output           idu_lsu_rf_pipe3_no_spec;              
output           idu_lsu_rf_pipe3_no_spec_exist;        
output           idu_lsu_rf_pipe3_off_0_extend;         
output  [11 :0]  idu_lsu_rf_pipe3_offset;               
output  [12 :0]  idu_lsu_rf_pipe3_offset_plus;          
output           idu_lsu_rf_pipe3_oldest;               
output  [14 :0]  idu_lsu_rf_pipe3_pc;                   
output  [6  :0]  idu_lsu_rf_pipe3_preg;                 
output  [3  :0]  idu_lsu_rf_pipe3_shift;                
output           idu_lsu_rf_pipe3_sign_extend;          
output           idu_lsu_rf_pipe3_spec_fail;            
output           idu_lsu_rf_pipe3_split;                
output  [63 :0]  idu_lsu_rf_pipe3_src0;                 
output  [63 :0]  idu_lsu_rf_pipe3_src1;                 
output           idu_lsu_rf_pipe3_unalign_2nd;          
output  [6  :0]  idu_lsu_rf_pipe3_vreg;                 
output           idu_lsu_rf_pipe4_already_da;           
output           idu_lsu_rf_pipe4_atomic;               
output           idu_lsu_rf_pipe4_bkpta_data;           
output           idu_lsu_rf_pipe4_bkptb_data;           
output  [3  :0]  idu_lsu_rf_pipe4_fence_mode;           
output           idu_lsu_rf_pipe4_icc;                  
output  [6  :0]  idu_lsu_rf_pipe4_iid;                  
output  [31 :0]  idu_lsu_rf_pipe4_inst_code;            
output           idu_lsu_rf_pipe4_inst_fls;             
output           idu_lsu_rf_pipe4_inst_flush;           
output  [1  :0]  idu_lsu_rf_pipe4_inst_mode;            
output           idu_lsu_rf_pipe4_inst_share;           
output  [1  :0]  idu_lsu_rf_pipe4_inst_size;            
output           idu_lsu_rf_pipe4_inst_str;             
output  [1  :0]  idu_lsu_rf_pipe4_inst_type;            
output  [11 :0]  idu_lsu_rf_pipe4_lch_entry;            
output           idu_lsu_rf_pipe4_lsfifo;               
output           idu_lsu_rf_pipe4_mmu_req;              
output           idu_lsu_rf_pipe4_no_spec;              
output           idu_lsu_rf_pipe4_off_0_extend;         
output  [11 :0]  idu_lsu_rf_pipe4_offset;               
output  [12 :0]  idu_lsu_rf_pipe4_offset_plus;          
output           idu_lsu_rf_pipe4_oldest;               
output  [14 :0]  idu_lsu_rf_pipe4_pc;                   
output  [11 :0]  idu_lsu_rf_pipe4_sdiq_entry;           
output  [3  :0]  idu_lsu_rf_pipe4_shift;                
output           idu_lsu_rf_pipe4_spec_fail;            
output           idu_lsu_rf_pipe4_split;                
output  [63 :0]  idu_lsu_rf_pipe4_src0;                 
output  [63 :0]  idu_lsu_rf_pipe4_src1;                 
output           idu_lsu_rf_pipe4_st;                   
output           idu_lsu_rf_pipe4_staddr;               
output           idu_lsu_rf_pipe4_sync_fence;           
output           idu_lsu_rf_pipe4_unalign_2nd;          
output  [11 :0]  idu_lsu_rf_pipe5_sdiq_entry;           
output  [63 :0]  idu_lsu_rf_pipe5_src0;                 
output  [63 :0]  idu_lsu_rf_pipe5_srcv0_fr;             
output           idu_lsu_rf_pipe5_srcv0_fr_vld;         
output           idu_lsu_rf_pipe5_srcv0_vld;            
output  [63 :0]  idu_lsu_rf_pipe5_srcv0_vr0;            
output  [63 :0]  idu_lsu_rf_pipe5_srcv0_vr1;            
output           idu_lsu_rf_pipe5_stdata1_vld;          
output           idu_lsu_rf_pipe5_unalign;              
output  [4  :0]  idu_vfpu_rf_pipe6_dst_ereg;            
output  [6  :0]  idu_vfpu_rf_pipe6_dst_preg;            
output           idu_vfpu_rf_pipe6_dst_vld;             
output  [6  :0]  idu_vfpu_rf_pipe6_dst_vreg;            
output           idu_vfpu_rf_pipe6_dste_vld;            
output           idu_vfpu_rf_pipe6_dstv_vld;            
output  [11 :0]  idu_vfpu_rf_pipe6_eu_sel;              
output  [19 :0]  idu_vfpu_rf_pipe6_func;                
output  [6  :0]  idu_vfpu_rf_pipe6_iid;                 
output  [2  :0]  idu_vfpu_rf_pipe6_imm0;                
output  [5  :0]  idu_vfpu_rf_pipe6_inst_type;           
output           idu_vfpu_rf_pipe6_mla_srcv2_vld;       
output  [6  :0]  idu_vfpu_rf_pipe6_mla_srcv2_vreg;      
output  [2  :0]  idu_vfpu_rf_pipe6_ready_stage;         
output  [63 :0]  idu_vfpu_rf_pipe6_srcv0_fr;            
output  [63 :0]  idu_vfpu_rf_pipe6_srcv1_fr;            
output  [63 :0]  idu_vfpu_rf_pipe6_srcv2_fr;            
output  [2  :0]  idu_vfpu_rf_pipe6_vmla_type;           
output  [4  :0]  idu_vfpu_rf_pipe7_dst_ereg;            
output  [6  :0]  idu_vfpu_rf_pipe7_dst_preg;            
output           idu_vfpu_rf_pipe7_dst_vld;             
output  [6  :0]  idu_vfpu_rf_pipe7_dst_vreg;            
output           idu_vfpu_rf_pipe7_dste_vld;            
output           idu_vfpu_rf_pipe7_dstv_vld;            
output  [11 :0]  idu_vfpu_rf_pipe7_eu_sel;              
output  [19 :0]  idu_vfpu_rf_pipe7_func;                
output  [6  :0]  idu_vfpu_rf_pipe7_iid;                 
output  [2  :0]  idu_vfpu_rf_pipe7_imm0;                
output  [5  :0]  idu_vfpu_rf_pipe7_inst_type;           
output           idu_vfpu_rf_pipe7_mla_srcv2_vld;       
output  [6  :0]  idu_vfpu_rf_pipe7_mla_srcv2_vreg;      
output  [2  :0]  idu_vfpu_rf_pipe7_ready_stage;         
output  [63 :0]  idu_vfpu_rf_pipe7_srcv0_fr;            
output  [63 :0]  idu_vfpu_rf_pipe7_srcv1_fr;            
output  [63 :0]  idu_vfpu_rf_pipe7_srcv2_fr;            
output  [2  :0]  idu_vfpu_rf_pipe7_vmla_type;           

// &Regs; @28
reg     [226:0]  rf_pipe0_data;                         
reg     [6  :0]  rf_pipe0_dst_preg_dup0;                
reg     [6  :0]  rf_pipe0_dst_preg_dup1;                
reg     [6  :0]  rf_pipe0_dst_preg_dup2;                
reg     [6  :0]  rf_pipe0_dst_preg_dup3;                
reg     [6  :0]  rf_pipe0_dst_preg_dup4;                
reg     [6  :0]  rf_pipe0_fwd_src0_preg;                
reg     [6  :0]  rf_pipe0_fwd_src1_preg;                
reg     [7  :0]  rf_pipe0_iq_entry;                     
reg     [6  :0]  rf_pipe0_prf_src0_preg;                
reg     [6  :0]  rf_pipe0_prf_src1_preg;                
reg     [63 :0]  rf_pipe0_src0_data;                    
reg     [63 :0]  rf_pipe0_src1_data;                    
reg     [213:0]  rf_pipe1_data;                         
reg     [6  :0]  rf_pipe1_dst_preg_dup0;                
reg     [6  :0]  rf_pipe1_dst_preg_dup1;                
reg     [6  :0]  rf_pipe1_dst_preg_dup2;                
reg     [6  :0]  rf_pipe1_dst_preg_dup3;                
reg     [6  :0]  rf_pipe1_dst_preg_dup4;                
reg     [6  :0]  rf_pipe1_fwd_src0_preg;                
reg     [6  :0]  rf_pipe1_fwd_src1_preg;                
reg     [7  :0]  rf_pipe1_iq_entry;                     
reg     [6  :0]  rf_pipe1_prf_src0_preg;                
reg     [6  :0]  rf_pipe1_prf_src1_preg;                
reg     [63 :0]  rf_pipe1_src0_data;                    
reg     [63 :0]  rf_pipe1_src1_data;                    
reg     [81 :0]  rf_pipe2_data;                         
reg     [6  :0]  rf_pipe2_fwd_src0_preg;                
reg     [6  :0]  rf_pipe2_fwd_src1_preg;                
reg     [11 :0]  rf_pipe2_iq_entry;                     
reg     [6  :0]  rf_pipe2_prf_src0_preg;                
reg     [6  :0]  rf_pipe2_prf_src1_preg;                
reg     [63 :0]  rf_pipe2_src1_data;                    
reg     [162:0]  rf_pipe3_data;                         
reg     [6  :0]  rf_pipe3_fwd_src0_preg;                
reg     [6  :0]  rf_pipe3_fwd_src1_preg;                
reg     [11 :0]  rf_pipe3_iq_entry;                     
reg     [6  :0]  rf_pipe3_prf_src0_preg;                
reg     [6  :0]  rf_pipe3_prf_src1_preg;                
reg     [162:0]  rf_pipe4_data;                         
reg     [6  :0]  rf_pipe4_fwd_src0_preg;                
reg     [6  :0]  rf_pipe4_fwd_src1_preg;                
reg     [11 :0]  rf_pipe4_iq_entry;                     
reg     [6  :0]  rf_pipe4_prf_src0_preg;                
reg     [6  :0]  rf_pipe4_prf_src1_preg;                
reg     [26 :0]  rf_pipe5_data;                         
reg     [6  :0]  rf_pipe5_fwd_src0_preg;                
reg     [6  :0]  rf_pipe5_fwd_srcv0_vreg;               
reg     [11 :0]  rf_pipe5_iq_entry;                     
reg     [6  :0]  rf_pipe5_prf_src0_preg;                
reg     [5  :0]  rf_pipe5_prf_srcv0_vreg_fr;            
reg     [5  :0]  rf_pipe5_prf_srcv0_vreg_vr0;           
reg     [5  :0]  rf_pipe5_prf_srcv0_vreg_vr1;           
reg     [150:0]  rf_pipe6_data;                         
reg     [6  :0]  rf_pipe6_dst_vreg_dup0;                
reg     [6  :0]  rf_pipe6_dst_vreg_dup1;                
reg     [6  :0]  rf_pipe6_dst_vreg_dup2;                
reg     [6  :0]  rf_pipe6_dst_vreg_dup3;                
reg     [6  :0]  rf_pipe6_fwd_srcv0_vreg;               
reg     [6  :0]  rf_pipe6_fwd_srcv1_vreg;               
reg     [6  :0]  rf_pipe6_fwd_srcv2_vreg;               
reg     [6  :0]  rf_pipe6_fwd_srcvm_vreg;               
reg     [7  :0]  rf_pipe6_iq_entry;                     
reg     [5  :0]  rf_pipe6_prf_srcv0_vreg_fr;            
reg     [5  :0]  rf_pipe6_prf_srcv0_vreg_vr0;           
reg     [5  :0]  rf_pipe6_prf_srcv0_vreg_vr1;           
reg     [5  :0]  rf_pipe6_prf_srcv1_vreg_fr;            
reg     [5  :0]  rf_pipe6_prf_srcv1_vreg_vr0;           
reg     [5  :0]  rf_pipe6_prf_srcv1_vreg_vr1;           
reg     [5  :0]  rf_pipe6_prf_srcv2_vreg_fr;            
reg     [5  :0]  rf_pipe6_prf_srcv2_vreg_vr0;           
reg     [5  :0]  rf_pipe6_prf_srcv2_vreg_vr1;           
reg     [5  :0]  rf_pipe6_prf_srcvm_vreg_vr0;           
reg     [5  :0]  rf_pipe6_prf_srcvm_vreg_vr1;           
reg     [149:0]  rf_pipe7_data;                         
reg     [6  :0]  rf_pipe7_dst_vreg_dup0;                
reg     [6  :0]  rf_pipe7_dst_vreg_dup1;                
reg     [6  :0]  rf_pipe7_dst_vreg_dup2;                
reg     [6  :0]  rf_pipe7_dst_vreg_dup3;                
reg     [6  :0]  rf_pipe7_fwd_srcv0_vreg;               
reg     [6  :0]  rf_pipe7_fwd_srcv1_vreg;               
reg     [6  :0]  rf_pipe7_fwd_srcv2_vreg;               
reg     [6  :0]  rf_pipe7_fwd_srcvm_vreg;               
reg     [7  :0]  rf_pipe7_iq_entry;                     
reg     [5  :0]  rf_pipe7_prf_srcv0_vreg_fr;            
reg     [5  :0]  rf_pipe7_prf_srcv0_vreg_vr0;           
reg     [5  :0]  rf_pipe7_prf_srcv0_vreg_vr1;           
reg     [5  :0]  rf_pipe7_prf_srcv1_vreg_fr;            
reg     [5  :0]  rf_pipe7_prf_srcv1_vreg_vr0;           
reg     [5  :0]  rf_pipe7_prf_srcv1_vreg_vr1;           
reg     [5  :0]  rf_pipe7_prf_srcv2_vreg_fr;            
reg     [5  :0]  rf_pipe7_prf_srcv2_vreg_vr0;           
reg     [5  :0]  rf_pipe7_prf_srcv2_vreg_vr1;           
reg     [5  :0]  rf_pipe7_prf_srcvm_vreg_vr0;           
reg     [5  :0]  rf_pipe7_prf_srcvm_vreg_vr1;           

// &Wires; @29
wire    [7  :0]  aiq0_dp_issue_entry;                   
wire    [226:0]  aiq0_dp_issue_read_data;               
wire             aiq0_xx_gateclk_issue_en;              
wire             aiq0_xx_issue_en;                      
wire    [7  :0]  aiq1_dp_issue_entry;                   
wire    [213:0]  aiq1_dp_issue_read_data;               
wire             aiq1_xx_gateclk_issue_en;              
wire             aiq1_xx_issue_en;                      
wire    [11 :0]  biq_dp_issue_entry;                    
wire    [81 :0]  biq_dp_issue_read_data;                
wire             biq_xx_gateclk_issue_en;               
wire             biq_xx_issue_en;                       
wire             cp0_idu_icg_en;                        
wire             cp0_lsu_fencei_broad_dis;              
wire             cp0_lsu_fencerw_broad_dis;             
wire             cp0_lsu_tlb_broad_dis;                 
wire             cp0_yy_clk_en;                         
wire             cpurst_b;                              
wire             ctrl_dp_rf_pipe0_other_lch_fail;       
wire             ctrl_dp_rf_pipe3_other_lch_fail;       
wire             ctrl_dp_rf_pipe4_other_lch_fail;       
wire             ctrl_dp_rf_pipe5_other_lch_fail;       
wire             ctrl_dp_rf_pipe6_other_lch_fail;       
wire             ctrl_dp_rf_pipe7_other_lch_fail;       
wire    [7  :0]  dp_aiq0_rf_lch_entry;                  
wire    [2  :0]  dp_aiq0_rf_rdy_clr;                    
wire    [7  :0]  dp_aiq1_rf_lch_entry;                  
wire    [2  :0]  dp_aiq1_rf_rdy_clr;                    
wire    [11 :0]  dp_biq_rf_lch_entry;                   
wire    [1  :0]  dp_biq_rf_rdy_clr;                     
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
wire    [6  :0]  dp_fwd_rf_pipe0_src0_preg;             
wire    [6  :0]  dp_fwd_rf_pipe0_src1_preg;             
wire             dp_fwd_rf_pipe1_mla;                   
wire    [6  :0]  dp_fwd_rf_pipe1_src0_preg;             
wire    [6  :0]  dp_fwd_rf_pipe1_src1_preg;             
wire    [6  :0]  dp_fwd_rf_pipe2_src0_preg;             
wire    [6  :0]  dp_fwd_rf_pipe2_src1_preg;             
wire    [6  :0]  dp_fwd_rf_pipe3_src0_preg;             
wire    [6  :0]  dp_fwd_rf_pipe3_src1_preg;             
wire    [6  :0]  dp_fwd_rf_pipe4_src0_preg;             
wire    [6  :0]  dp_fwd_rf_pipe4_src1_preg;             
wire    [6  :0]  dp_fwd_rf_pipe5_src0_preg;             
wire    [6  :0]  dp_fwd_rf_pipe5_srcv0_vreg;            
wire    [6  :0]  dp_fwd_rf_pipe6_srcv0_vreg;            
wire    [6  :0]  dp_fwd_rf_pipe6_srcv1_vreg;            
wire    [6  :0]  dp_fwd_rf_pipe6_srcv2_vreg;            
wire    [6  :0]  dp_fwd_rf_pipe6_srcvm_vreg;            
wire             dp_fwd_rf_pipe6_vmla;                  
wire    [6  :0]  dp_fwd_rf_pipe7_srcv0_vreg;            
wire    [6  :0]  dp_fwd_rf_pipe7_srcv1_vreg;            
wire    [6  :0]  dp_fwd_rf_pipe7_srcv2_vreg;            
wire    [6  :0]  dp_fwd_rf_pipe7_srcvm_vreg;            
wire             dp_fwd_rf_pipe7_vmla;                  
wire    [11 :0]  dp_lsiq_rf_pipe3_lch_entry;            
wire    [2  :0]  dp_lsiq_rf_pipe3_rdy_clr;              
wire    [11 :0]  dp_lsiq_rf_pipe4_lch_entry;            
wire    [2  :0]  dp_lsiq_rf_pipe4_rdy_clr;              
wire    [6  :0]  dp_prf_rf_pipe0_src0_preg;             
wire    [6  :0]  dp_prf_rf_pipe0_src1_preg;             
wire    [6  :0]  dp_prf_rf_pipe1_src0_preg;             
wire    [6  :0]  dp_prf_rf_pipe1_src1_preg;             
wire    [6  :0]  dp_prf_rf_pipe2_src0_preg;             
wire    [6  :0]  dp_prf_rf_pipe2_src1_preg;             
wire    [6  :0]  dp_prf_rf_pipe3_src0_preg;             
wire    [6  :0]  dp_prf_rf_pipe3_src1_preg;             
wire    [6  :0]  dp_prf_rf_pipe4_src0_preg;             
wire    [6  :0]  dp_prf_rf_pipe4_src1_preg;             
wire    [6  :0]  dp_prf_rf_pipe5_src0_preg;             
wire    [5  :0]  dp_prf_rf_pipe5_srcv0_vreg_fr;         
wire    [5  :0]  dp_prf_rf_pipe5_srcv0_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe5_srcv0_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe6_srcv0_vreg_fr;         
wire    [5  :0]  dp_prf_rf_pipe6_srcv0_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe6_srcv0_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe6_srcv1_vreg_fr;         
wire    [5  :0]  dp_prf_rf_pipe6_srcv1_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe6_srcv1_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe6_srcv2_vreg_fr;         
wire    [5  :0]  dp_prf_rf_pipe6_srcv2_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe6_srcv2_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe6_srcvm_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe6_srcvm_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe7_srcv0_vreg_fr;         
wire    [5  :0]  dp_prf_rf_pipe7_srcv0_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe7_srcv0_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe7_srcv1_vreg_fr;         
wire    [5  :0]  dp_prf_rf_pipe7_srcv1_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe7_srcv1_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe7_srcv2_vreg_fr;         
wire    [5  :0]  dp_prf_rf_pipe7_srcv2_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe7_srcv2_vreg_vr1;        
wire    [5  :0]  dp_prf_rf_pipe7_srcvm_vreg_vr0;        
wire    [5  :0]  dp_prf_rf_pipe7_srcvm_vreg_vr1;        
wire    [11 :0]  dp_sdiq_rf_lch_entry;                  
wire    [1  :0]  dp_sdiq_rf_rdy_clr;                    
wire    [11 :0]  dp_sdiq_rf_sdiq_entry;                 
wire             dp_sdiq_rf_staddr1_vld;                
wire             dp_sdiq_rf_staddr_rdy_clr;             
wire             dp_sdiq_rf_stdata1_vld;                
wire    [7  :0]  dp_viq0_rf_lch_entry;                  
wire    [3  :0]  dp_viq0_rf_rdy_clr;                    
wire    [7  :0]  dp_viq1_rf_lch_entry;                  
wire    [3  :0]  dp_viq1_rf_rdy_clr;                    
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dup0;          
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dup1;          
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dup2;          
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dup3;          
wire    [6  :0]  dp_xx_rf_pipe0_dst_preg_dup4;          
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dup0;          
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dup1;          
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dup2;          
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dup3;          
wire    [6  :0]  dp_xx_rf_pipe1_dst_preg_dup4;          
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup0;          
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup1;          
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup2;          
wire    [6  :0]  dp_xx_rf_pipe6_dst_vreg_dup3;          
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup0;          
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup1;          
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup2;          
wire    [6  :0]  dp_xx_rf_pipe7_dst_vreg_dup3;          
wire             forever_cpuclk;                        
wire    [63 :0]  fwd_dp_rf_pipe0_src0_data;             
wire             fwd_dp_rf_pipe0_src0_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe0_src1_data;             
wire             fwd_dp_rf_pipe0_src1_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe1_src0_data;             
wire             fwd_dp_rf_pipe1_src0_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe1_src1_data;             
wire             fwd_dp_rf_pipe1_src1_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe2_src0_data;             
wire             fwd_dp_rf_pipe2_src0_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe2_src1_data;             
wire             fwd_dp_rf_pipe2_src1_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe3_src0_data;             
wire             fwd_dp_rf_pipe3_src0_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe3_src1_data;             
wire             fwd_dp_rf_pipe3_src1_no_fwd;           
wire             fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla; 
wire    [63 :0]  fwd_dp_rf_pipe3_srcvm_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe3_srcvm_vreg_vr1_data;   
wire    [63 :0]  fwd_dp_rf_pipe4_src0_data;             
wire             fwd_dp_rf_pipe4_src0_no_fwd;           
wire    [63 :0]  fwd_dp_rf_pipe4_src1_data;             
wire             fwd_dp_rf_pipe4_src1_no_fwd;           
wire             fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla; 
wire    [63 :0]  fwd_dp_rf_pipe4_srcvm_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe4_srcvm_vreg_vr1_data;   
wire    [63 :0]  fwd_dp_rf_pipe5_src0_data;             
wire             fwd_dp_rf_pipe5_src0_no_fwd;           
wire             fwd_dp_rf_pipe5_src0_no_fwd_expt_mla;  
wire             fwd_dp_rf_pipe5_srcv0_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe5_srcv0_vreg_fr_data;    
wire    [63 :0]  fwd_dp_rf_pipe5_srcv0_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe5_srcv0_vreg_vr1_data;   
wire             fwd_dp_rf_pipe6_srcv0_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe6_srcv0_vreg_fr_data;    
wire    [63 :0]  fwd_dp_rf_pipe6_srcv0_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe6_srcv0_vreg_vr1_data;   
wire             fwd_dp_rf_pipe6_srcv1_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe6_srcv1_vreg_fr_data;    
wire    [63 :0]  fwd_dp_rf_pipe6_srcv1_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe6_srcv1_vreg_vr1_data;   
wire             fwd_dp_rf_pipe6_srcv2_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe6_srcv2_vreg_fr_data;    
wire    [63 :0]  fwd_dp_rf_pipe6_srcv2_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe6_srcv2_vreg_vr1_data;   
wire             fwd_dp_rf_pipe6_srcvm_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe6_srcvm_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe6_srcvm_vreg_vr1_data;   
wire             fwd_dp_rf_pipe7_srcv0_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe7_srcv0_vreg_fr_data;    
wire    [63 :0]  fwd_dp_rf_pipe7_srcv0_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe7_srcv0_vreg_vr1_data;   
wire             fwd_dp_rf_pipe7_srcv1_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe7_srcv1_vreg_fr_data;    
wire    [63 :0]  fwd_dp_rf_pipe7_srcv1_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe7_srcv1_vreg_vr1_data;   
wire             fwd_dp_rf_pipe7_srcv2_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe7_srcv2_vreg_fr_data;    
wire    [63 :0]  fwd_dp_rf_pipe7_srcv2_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe7_srcv2_vreg_vr1_data;   
wire             fwd_dp_rf_pipe7_srcvm_no_fwd;          
wire    [63 :0]  fwd_dp_rf_pipe7_srcvm_vreg_vr0_data;   
wire    [63 :0]  fwd_dp_rf_pipe7_srcvm_vreg_vr1_data;   
wire    [63 :0]  had_idu_wbbr_data;                     
wire             had_idu_wbbr_vld;                      
wire    [4  :0]  idu_cp0_rf_func;                       
wire    [6  :0]  idu_cp0_rf_iid;                        
wire    [31 :0]  idu_cp0_rf_opcode;                     
wire    [6  :0]  idu_cp0_rf_preg;                       
wire    [63 :0]  idu_cp0_rf_src0;                       
wire             idu_iu_rf_pipe0_alu_short;             
wire    [6  :0]  idu_iu_rf_pipe0_dst_preg;              
wire             idu_iu_rf_pipe0_dst_vld;               
wire    [6  :0]  idu_iu_rf_pipe0_dst_vreg;              
wire             idu_iu_rf_pipe0_dstv_vld;              
wire    [4  :0]  idu_iu_rf_pipe0_expt_vec;              
wire             idu_iu_rf_pipe0_expt_vld;              
wire    [4  :0]  idu_iu_rf_pipe0_func;                  
wire             idu_iu_rf_pipe0_high_hw_expt;          
wire    [6  :0]  idu_iu_rf_pipe0_iid;                   
wire    [5  :0]  idu_iu_rf_pipe0_imm;                   
wire    [31 :0]  idu_iu_rf_pipe0_opcode;                
wire    [4  :0]  idu_iu_rf_pipe0_pid;                   
wire    [20 :0]  idu_iu_rf_pipe0_rslt_sel;              
wire    [19 :0]  idu_iu_rf_pipe0_special_imm;           
wire    [63 :0]  idu_iu_rf_pipe0_src0;                  
wire    [63 :0]  idu_iu_rf_pipe0_src1;                  
wire    [63 :0]  idu_iu_rf_pipe0_src1_no_imm;           
wire    [63 :0]  idu_iu_rf_pipe0_src2;                  
wire    [7  :0]  idu_iu_rf_pipe0_vl;                    
wire    [1  :0]  idu_iu_rf_pipe0_vlmul;                 
wire    [2  :0]  idu_iu_rf_pipe0_vsew;                  
wire             idu_iu_rf_pipe1_alu_short;             
wire    [6  :0]  idu_iu_rf_pipe1_dst_preg;              
wire             idu_iu_rf_pipe1_dst_vld;               
wire    [6  :0]  idu_iu_rf_pipe1_dst_vreg;              
wire             idu_iu_rf_pipe1_dstv_vld;              
wire    [4  :0]  idu_iu_rf_pipe1_func;                  
wire    [6  :0]  idu_iu_rf_pipe1_iid;                   
wire    [5  :0]  idu_iu_rf_pipe1_imm;                   
wire    [6  :0]  idu_iu_rf_pipe1_mla_src2_preg;         
wire             idu_iu_rf_pipe1_mla_src2_vld;          
wire    [7  :0]  idu_iu_rf_pipe1_mult_func;             
wire    [20 :0]  idu_iu_rf_pipe1_rslt_sel;              
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
wire             idu_lsu_rf_pipe3_already_da;           
wire             idu_lsu_rf_pipe3_atomic;               
wire             idu_lsu_rf_pipe3_bkpta_data;           
wire             idu_lsu_rf_pipe3_bkptb_data;           
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
wire    [3  :0]  idu_lsu_rf_pipe3_shift;                
wire             idu_lsu_rf_pipe3_sign_extend;          
wire             idu_lsu_rf_pipe3_spec_fail;            
wire             idu_lsu_rf_pipe3_split;                
wire    [63 :0]  idu_lsu_rf_pipe3_src0;                 
wire    [63 :0]  idu_lsu_rf_pipe3_src1;                 
wire    [63 :0]  idu_lsu_rf_pipe3_srcvm_vr0;            
wire    [63 :0]  idu_lsu_rf_pipe3_srcvm_vr1;            
wire             idu_lsu_rf_pipe3_unalign_2nd;          
wire    [6  :0]  idu_lsu_rf_pipe3_vreg;                 
wire             idu_lsu_rf_pipe4_already_da;           
wire             idu_lsu_rf_pipe4_atomic;               
wire             idu_lsu_rf_pipe4_bkpta_data;           
wire             idu_lsu_rf_pipe4_bkptb_data;           
wire    [3  :0]  idu_lsu_rf_pipe4_fence_mode;           
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
wire    [3  :0]  idu_lsu_rf_pipe4_shift;                
wire             idu_lsu_rf_pipe4_spec_fail;            
wire             idu_lsu_rf_pipe4_split;                
wire    [63 :0]  idu_lsu_rf_pipe4_src0;                 
wire    [63 :0]  idu_lsu_rf_pipe4_src1;                 
wire    [63 :0]  idu_lsu_rf_pipe4_srcvm_vr0;            
wire    [63 :0]  idu_lsu_rf_pipe4_srcvm_vr1;            
wire             idu_lsu_rf_pipe4_st;                   
wire             idu_lsu_rf_pipe4_staddr;               
wire             idu_lsu_rf_pipe4_sync_fence;           
wire             idu_lsu_rf_pipe4_unalign_2nd;          
wire    [11 :0]  idu_lsu_rf_pipe5_sdiq_entry;           
wire    [63 :0]  idu_lsu_rf_pipe5_src0;                 
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_fr;             
wire             idu_lsu_rf_pipe5_srcv0_fr_vld;         
wire             idu_lsu_rf_pipe5_srcv0_vld;            
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_vr0;            
wire    [63 :0]  idu_lsu_rf_pipe5_srcv0_vr1;            
wire             idu_lsu_rf_pipe5_stdata1_vld;          
wire             idu_lsu_rf_pipe5_unalign;              
wire    [4  :0]  idu_vfpu_rf_pipe6_dst_ereg;            
wire    [6  :0]  idu_vfpu_rf_pipe6_dst_preg;            
wire             idu_vfpu_rf_pipe6_dst_vld;             
wire    [6  :0]  idu_vfpu_rf_pipe6_dst_vreg;            
wire             idu_vfpu_rf_pipe6_dste_vld;            
wire             idu_vfpu_rf_pipe6_dstv_vld;            
wire    [11 :0]  idu_vfpu_rf_pipe6_eu_sel;              
wire    [19 :0]  idu_vfpu_rf_pipe6_func;                
wire    [6  :0]  idu_vfpu_rf_pipe6_iid;                 
wire    [2  :0]  idu_vfpu_rf_pipe6_imm0;                
wire    [5  :0]  idu_vfpu_rf_pipe6_inst_type;           
wire             idu_vfpu_rf_pipe6_mla_srcv2_vld;       
wire    [6  :0]  idu_vfpu_rf_pipe6_mla_srcv2_vreg;      
wire    [2  :0]  idu_vfpu_rf_pipe6_oper_size;           
wire    [2  :0]  idu_vfpu_rf_pipe6_ready_stage;         
wire    [6  :0]  idu_vfpu_rf_pipe6_split_num;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv0_fr;            
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv0_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv0_vr1;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv1_fr;            
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv1_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv1_vr1;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv2_fr;            
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv2_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcv2_vr1;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcvm_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe6_srcvm_vr1;           
wire    [4  :0]  idu_vfpu_rf_pipe6_vimm;                
wire             idu_vfpu_rf_pipe6_vimm_vld;            
wire    [7  :0]  idu_vfpu_rf_pipe6_vl;                  
wire    [1  :0]  idu_vfpu_rf_pipe6_vlmul;               
wire             idu_vfpu_rf_pipe6_vm_bit;              
wire    [2  :0]  idu_vfpu_rf_pipe6_vmla_type;           
wire    [1  :0]  idu_vfpu_rf_pipe6_vsew;                
wire    [4  :0]  idu_vfpu_rf_pipe7_dst_ereg;            
wire    [6  :0]  idu_vfpu_rf_pipe7_dst_preg;            
wire             idu_vfpu_rf_pipe7_dst_vld;             
wire    [6  :0]  idu_vfpu_rf_pipe7_dst_vreg;            
wire             idu_vfpu_rf_pipe7_dste_vld;            
wire             idu_vfpu_rf_pipe7_dstv_vld;            
wire    [11 :0]  idu_vfpu_rf_pipe7_eu_sel;              
wire    [19 :0]  idu_vfpu_rf_pipe7_func;                
wire    [6  :0]  idu_vfpu_rf_pipe7_iid;                 
wire    [2  :0]  idu_vfpu_rf_pipe7_imm0;                
wire    [5  :0]  idu_vfpu_rf_pipe7_inst_type;           
wire             idu_vfpu_rf_pipe7_mla_srcv2_vld;       
wire    [6  :0]  idu_vfpu_rf_pipe7_mla_srcv2_vreg;      
wire    [2  :0]  idu_vfpu_rf_pipe7_oper_size;           
wire    [2  :0]  idu_vfpu_rf_pipe7_ready_stage;         
wire    [6  :0]  idu_vfpu_rf_pipe7_split_num;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv0_fr;            
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv0_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv0_vr1;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv1_fr;            
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv1_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv1_vr1;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv2_fr;            
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv2_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcv2_vr1;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcvm_vr0;           
wire    [63 :0]  idu_vfpu_rf_pipe7_srcvm_vr1;           
wire    [4  :0]  idu_vfpu_rf_pipe7_vimm;                
wire             idu_vfpu_rf_pipe7_vimm_vld;            
wire    [7  :0]  idu_vfpu_rf_pipe7_vl;                  
wire    [1  :0]  idu_vfpu_rf_pipe7_vlmul;               
wire             idu_vfpu_rf_pipe7_vm_bit;              
wire    [2  :0]  idu_vfpu_rf_pipe7_vmla_type;           
wire    [1  :0]  idu_vfpu_rf_pipe7_vsew;                
wire    [11 :0]  lsiq_dp_pipe3_issue_entry;             
wire    [162:0]  lsiq_dp_pipe3_issue_read_data;         
wire    [11 :0]  lsiq_dp_pipe4_issue_entry;             
wire    [162:0]  lsiq_dp_pipe4_issue_read_data;         
wire             lsiq_xx_gateclk_issue_en;              
wire             lsiq_xx_pipe3_issue_en;                
wire             lsiq_xx_pipe4_issue_en;                
wire    [11 :0]  lsu_idu_dc_sdiq_entry;                 
wire             lsu_idu_dc_staddr1_vld;                
wire             lsu_idu_dc_staddr_unalign;             
wire             lsu_idu_dc_staddr_vld;                 
wire             pad_yy_icg_scan_en;                    
wire    [3  :0]  pipe0_decd_eu_sel;                     
wire             pipe0_decd_expt_vld;                   
wire    [4  :0]  pipe0_decd_func;                       
wire    [5  :0]  pipe0_decd_imm;                        
wire    [31 :0]  pipe0_decd_opcode;                     
wire    [20 :0]  pipe0_decd_sel;                        
wire    [63 :0]  pipe0_decd_src1_imm;                   
wire    [1  :0]  pipe1_decd_eu_sel;                     
wire    [4  :0]  pipe1_decd_func;                       
wire    [5  :0]  pipe1_decd_imm;                        
wire    [7  :0]  pipe1_decd_mult_func;                  
wire    [31 :0]  pipe1_decd_opcode;                     
wire    [20 :0]  pipe1_decd_sel;                        
wire    [63 :0]  pipe1_decd_src1_imm;                   
wire    [7  :0]  pipe2_decd_func;                       
wire    [20 :0]  pipe2_decd_offset;                     
wire    [31 :0]  pipe2_decd_opcode;                     
wire    [63 :0]  pipe2_decd_src1_imm;                   
wire             pipe3_decd_atomic;                     
wire             pipe3_decd_inst_fls;                   
wire             pipe3_decd_inst_ldr;                   
wire    [1  :0]  pipe3_decd_inst_size;                  
wire    [1  :0]  pipe3_decd_inst_type;                  
wire             pipe3_decd_lsfifo;                     
wire             pipe3_decd_off_0_extend;               
wire    [11 :0]  pipe3_decd_offset;                     
wire    [12 :0]  pipe3_decd_offset_plus;                
wire    [31 :0]  pipe3_decd_opcode;                     
wire    [3  :0]  pipe3_decd_shift;                      
wire             pipe3_decd_sign_extend;                
wire             pipe4_decd_atomic;                     
wire    [6  :0]  pipe4_decd_dst_preg;                   
wire    [3  :0]  pipe4_decd_fence_mode;                 
wire             pipe4_decd_icc;                        
wire             pipe4_decd_inst_fls;                   
wire             pipe4_decd_inst_flush;                 
wire    [1  :0]  pipe4_decd_inst_mode;                  
wire             pipe4_decd_inst_share;                 
wire    [1  :0]  pipe4_decd_inst_size;                  
wire             pipe4_decd_inst_str;                   
wire    [1  :0]  pipe4_decd_inst_type;                  
wire             pipe4_decd_lsfifo;                     
wire             pipe4_decd_mmu_req;                    
wire             pipe4_decd_off_0_extend;               
wire    [11 :0]  pipe4_decd_offset;                     
wire    [12 :0]  pipe4_decd_offset_plus;                
wire    [31 :0]  pipe4_decd_opcode;                     
wire    [3  :0]  pipe4_decd_shift;                      
wire             pipe4_decd_st;                         
wire             pipe4_decd_sync_fence;                 
wire    [11 :0]  pipe6_decd_eu_sel;                     
wire    [19 :0]  pipe6_decd_func;                       
wire    [2  :0]  pipe6_decd_imm0;                       
wire    [5  :0]  pipe6_decd_inst_type;                  
wire    [31 :0]  pipe6_decd_opcode;                     
wire    [2  :0]  pipe6_decd_oper_size;                  
wire    [2  :0]  pipe6_decd_ready_stage;                
wire    [4  :0]  pipe6_decd_vimm;                       
wire    [1  :0]  pipe6_decd_vsew;                       
wire    [11 :0]  pipe7_decd_eu_sel;                     
wire    [19 :0]  pipe7_decd_func;                       
wire    [2  :0]  pipe7_decd_imm0;                       
wire    [5  :0]  pipe7_decd_inst_type;                  
wire    [31 :0]  pipe7_decd_opcode;                     
wire    [2  :0]  pipe7_decd_oper_size;                  
wire    [2  :0]  pipe7_decd_ready_stage;                
wire    [4  :0]  pipe7_decd_vimm;                       
wire    [1  :0]  pipe7_decd_vsew;                       
wire    [63 :0]  prf_dp_rf_pipe0_src0_data;             
wire    [63 :0]  prf_dp_rf_pipe0_src1_data;             
wire    [63 :0]  prf_dp_rf_pipe2_src0_data;             
wire    [63 :0]  prf_dp_rf_pipe2_src1_data;             
wire    [63 :0]  prf_dp_rf_pipe3_src0_data;             
wire    [63 :0]  prf_dp_rf_pipe3_src1_data;             
wire    [63 :0]  prf_dp_rf_pipe4_src0_data;             
wire    [63 :0]  prf_dp_rf_pipe4_src1_data;             
wire    [63 :0]  prf_dp_rf_pipe5_src0_data;             
wire    [63 :0]  prf_dp_rf_pipe5_srcv0_vreg_fr_data;    
wire    [63 :0]  prf_dp_rf_pipe5_srcv0_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe5_srcv0_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcv0_vreg_fr_data;    
wire    [63 :0]  prf_dp_rf_pipe6_srcv0_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcv0_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcv1_vreg_fr_data;    
wire    [63 :0]  prf_dp_rf_pipe6_srcv1_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcv1_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcv2_vreg_fr_data;    
wire    [63 :0]  prf_dp_rf_pipe6_srcv2_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcv2_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcvm_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe6_srcvm_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcv0_vreg_fr_data;    
wire    [63 :0]  prf_dp_rf_pipe7_srcv0_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcv0_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcv1_vreg_fr_data;    
wire    [63 :0]  prf_dp_rf_pipe7_srcv1_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcv1_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcv2_vreg_fr_data;    
wire    [63 :0]  prf_dp_rf_pipe7_srcv2_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcv2_vreg_vr1_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcvm_vreg_vr0_data;   
wire    [63 :0]  prf_dp_rf_pipe7_srcvm_vreg_vr1_data;   
wire    [63 :0]  prf_xx_rf_pipe1_src0_data;             
wire    [63 :0]  prf_xx_rf_pipe1_src1_data;             
wire             rf_pipe03_clk;                         
wire             rf_pipe03_clk_en;                      
wire             rf_pipe0_clk;                          
wire             rf_pipe0_clk_en;                       
wire             rf_pipe0_fwd_src0_preg_updt_vld;       
wire             rf_pipe0_fwd_src1_preg_updt_vld;       
wire             rf_pipe0_fwd_src2_preg_updt_vld;       
wire             rf_pipe0_prf_src0_preg_updt_vld;       
wire             rf_pipe0_prf_src1_preg_updt_vld;       
wire             rf_pipe0_prf_src2_preg_updt_vld;       
wire    [63 :0]  rf_pipe0_src0_data_no_fwd;             
wire             rf_pipe0_src0_no_rdy;                  
wire    [63 :0]  rf_pipe0_src1_data_no_imm;             
wire             rf_pipe0_src1_no_rdy;                  
wire    [63 :0]  rf_pipe0_src2_data;                    
wire             rf_pipe0_src2_no_rdy;                  
wire             rf_pipe15_clk;                         
wire             rf_pipe15_clk_en;                      
wire             rf_pipe1_clk;                          
wire             rf_pipe1_clk_en;                       
wire             rf_pipe1_fwd_src0_preg_updt_vld;       
wire             rf_pipe1_fwd_src1_preg_updt_vld;       
wire             rf_pipe1_fwd_src2_preg_updt_vld;       
wire             rf_pipe1_prf_src0_preg_updt_vld;       
wire             rf_pipe1_prf_src1_preg_updt_vld;       
wire             rf_pipe1_prf_src2_preg_updt_vld;       
wire             rf_pipe1_src0_no_rdy;                  
wire    [63 :0]  rf_pipe1_src1_data_no_imm;             
wire             rf_pipe1_src1_no_rdy;                  
wire    [63 :0]  rf_pipe1_src2_data;                    
wire             rf_pipe1_src2_no_rdy;                  
wire             rf_pipe2_clk;                          
wire             rf_pipe2_clk_en;                       
wire             rf_pipe2_fwd_src0_preg_updt_vld;       
wire             rf_pipe2_fwd_src1_preg_updt_vld;       
wire             rf_pipe2_prf_src0_preg_updt_vld;       
wire             rf_pipe2_prf_src1_preg_updt_vld;       
wire    [63 :0]  rf_pipe2_src0_data;                    
wire             rf_pipe2_src0_no_rdy;                  
wire             rf_pipe2_src1_no_rdy;                  
wire             rf_pipe36_clk;                         
wire             rf_pipe36_clk_en;                      
wire             rf_pipe3_clk;                          
wire             rf_pipe3_clk_en;                       
wire             rf_pipe3_fwd_src0_preg_updt_vld;       
wire             rf_pipe3_fwd_src1_preg_updt_vld;       
wire             rf_pipe3_fwd_srcvm_vreg_updt_vld;      
wire             rf_pipe3_prf_src0_preg_updt_vld;       
wire             rf_pipe3_prf_src1_preg_updt_vld;       
wire             rf_pipe3_prf_srcvm_vreg_updt_vld;      
wire    [63 :0]  rf_pipe3_src0_data;                    
wire             rf_pipe3_src0_no_rdy;                  
wire    [63 :0]  rf_pipe3_src1_data;                    
wire             rf_pipe3_src1_no_rdy;                  
wire             rf_pipe3_srcvm_no_rdy;                 
wire    [63 :0]  rf_pipe3_srcvm_vr0_data;               
wire    [63 :0]  rf_pipe3_srcvm_vr1_data;               
wire             rf_pipe47_clk;                         
wire             rf_pipe47_clk_en;                      
wire             rf_pipe4_clk;                          
wire             rf_pipe4_clk_en;                       
wire             rf_pipe4_fwd_src0_preg_updt_vld;       
wire             rf_pipe4_fwd_src1_preg_updt_vld;       
wire             rf_pipe4_fwd_srcvm_vreg_updt_vld;      
wire             rf_pipe4_prf_src0_preg_updt_vld;       
wire             rf_pipe4_prf_src1_preg_updt_vld;       
wire             rf_pipe4_prf_srcvm_vreg_updt_vld;      
wire    [63 :0]  rf_pipe4_src0_data;                    
wire             rf_pipe4_src0_no_rdy;                  
wire    [63 :0]  rf_pipe4_src1_data;                    
wire             rf_pipe4_src1_no_rdy;                  
wire             rf_pipe4_srcvm_no_rdy;                 
wire    [63 :0]  rf_pipe4_srcvm_vr0_data;               
wire    [63 :0]  rf_pipe4_srcvm_vr1_data;               
wire             rf_pipe5_clk;                          
wire             rf_pipe5_clk_en;                       
wire             rf_pipe5_fwd_src0_preg_updt_vld;       
wire             rf_pipe5_fwd_srcv0_vreg_updt_vld;      
wire             rf_pipe5_prf_src0_preg_updt_vld;       
wire             rf_pipe5_prf_srcv0_vreg_updt_vld;      
wire    [63 :0]  rf_pipe5_src0_data;                    
wire             rf_pipe5_src0_no_rdy;                  
wire    [63 :0]  rf_pipe5_srcv0_fr_data;                
wire             rf_pipe5_srcv0_no_rdy;                 
wire    [63 :0]  rf_pipe5_srcv0_vr0_data;               
wire    [63 :0]  rf_pipe5_srcv0_vr1_data;               
wire             rf_pipe5_staddr_create_stq;            
wire             rf_pipe5_staddr_in_stq;                
wire             rf_pipe5_staddr_no_rdy;                
wire             rf_pipe5_unalign_with_lsu_dc;          
wire             rf_pipe6_clk;                          
wire             rf_pipe6_clk_en;                       
wire             rf_pipe6_fwd_srcv0_vreg_updt_vld;      
wire             rf_pipe6_fwd_srcv1_vreg_updt_vld;      
wire             rf_pipe6_fwd_srcv2_vreg_updt_vld;      
wire             rf_pipe6_fwd_srcvm_vreg_updt_vld;      
wire             rf_pipe6_prf_srcv0_vreg_updt_vld;      
wire             rf_pipe6_prf_srcv1_vreg_updt_vld;      
wire             rf_pipe6_prf_srcv2_vreg_updt_vld;      
wire             rf_pipe6_prf_srcvm_vreg_updt_vld;      
wire    [63 :0]  rf_pipe6_srcv0_fr_data;                
wire             rf_pipe6_srcv0_no_rdy;                 
wire    [63 :0]  rf_pipe6_srcv0_vr0_data;               
wire    [63 :0]  rf_pipe6_srcv0_vr1_data;               
wire    [63 :0]  rf_pipe6_srcv1_fr_data;                
wire             rf_pipe6_srcv1_no_rdy;                 
wire    [63 :0]  rf_pipe6_srcv1_vr0_data;               
wire    [63 :0]  rf_pipe6_srcv1_vr1_data;               
wire    [63 :0]  rf_pipe6_srcv2_fr_data;                
wire             rf_pipe6_srcv2_no_rdy;                 
wire    [63 :0]  rf_pipe6_srcv2_vr0_data;               
wire    [63 :0]  rf_pipe6_srcv2_vr1_data;               
wire             rf_pipe6_srcvm_no_rdy;                 
wire    [63 :0]  rf_pipe6_srcvm_vr0_data;               
wire    [63 :0]  rf_pipe6_srcvm_vr1_data;               
wire             rf_pipe7_clk;                          
wire             rf_pipe7_clk_en;                       
wire             rf_pipe7_fwd_srcv0_vreg_updt_vld;      
wire             rf_pipe7_fwd_srcv1_vreg_updt_vld;      
wire             rf_pipe7_fwd_srcv2_vreg_updt_vld;      
wire             rf_pipe7_fwd_srcvm_vreg_updt_vld;      
wire             rf_pipe7_prf_srcv0_vreg_updt_vld;      
wire             rf_pipe7_prf_srcv1_vreg_updt_vld;      
wire             rf_pipe7_prf_srcv2_vreg_updt_vld;      
wire             rf_pipe7_prf_srcvm_vreg_updt_vld;      
wire    [63 :0]  rf_pipe7_srcv0_fr_data;                
wire             rf_pipe7_srcv0_no_rdy;                 
wire    [63 :0]  rf_pipe7_srcv0_vr0_data;               
wire    [63 :0]  rf_pipe7_srcv0_vr1_data;               
wire    [63 :0]  rf_pipe7_srcv1_fr_data;                
wire             rf_pipe7_srcv1_no_rdy;                 
wire    [63 :0]  rf_pipe7_srcv1_vr0_data;               
wire    [63 :0]  rf_pipe7_srcv1_vr1_data;               
wire    [63 :0]  rf_pipe7_srcv2_fr_data;                
wire             rf_pipe7_srcv2_no_rdy;                 
wire    [63 :0]  rf_pipe7_srcv2_vr0_data;               
wire    [63 :0]  rf_pipe7_srcv2_vr1_data;               
wire             rf_pipe7_srcvm_no_rdy;                 
wire    [63 :0]  rf_pipe7_srcvm_vr0_data;               
wire    [63 :0]  rf_pipe7_srcvm_vr1_data;               
wire             rtu_idu_flush_fe;                      
wire             rtu_idu_flush_is;                      
wire    [11 :0]  sdiq_dp_issue_entry;                   
wire    [26 :0]  sdiq_dp_issue_read_data;               
wire             sdiq_xx_gateclk_issue_en;              
wire             sdiq_xx_issue_en;                      
wire    [7  :0]  viq0_dp_issue_entry;                   
wire    [150:0]  viq0_dp_issue_read_data;               
wire             viq0_xx_gateclk_issue_en;              
wire             viq0_xx_issue_en;                      
wire    [7  :0]  viq1_dp_issue_entry;                   
wire    [149:0]  viq1_dp_issue_read_data;               
wire             viq1_xx_gateclk_issue_en;              
wire             viq1_xx_issue_en;                      



//==========================================================
//                       Parameters
//==========================================================
//----------------------------------------------------------
//                    AIQ0 Parameters
//----------------------------------------------------------
parameter AIQ0_WIDTH             = 227;

parameter AIQ0_VL                = 226;
parameter AIQ0_LCH_PREG          = 218;
parameter AIQ0_SPECIAL           = 217;
parameter AIQ0_VSEW              = 216;
parameter AIQ0_VLMUL             = 213;
parameter AIQ0_LCH_RDY_SDIQ      = 211;
parameter AIQ0_LCH_RDY_LSIQ      = 199;
parameter AIQ0_LCH_RDY_BIQ       = 175;
parameter AIQ0_LCH_RDY_AIQ1      = 151;
parameter AIQ0_LCH_RDY_AIQ0      = 127;
parameter AIQ0_ALU_SHORT         = 103;
parameter AIQ0_PID               = 102;
parameter AIQ0_PCFIFO            = 97;
parameter AIQ0_MTVR              = 96;
parameter AIQ0_DIV               = 95;
parameter AIQ0_HIGH_HW_EXPT      = 94;
parameter AIQ0_EXPT_VEC          = 93;
parameter AIQ0_EXPT_VLD          = 88;
parameter AIQ0_SRC2_LSU_MATCH    = 87;
parameter AIQ0_SRC2_DATA         = 86;
parameter AIQ0_SRC2_PREG         = 86;
parameter AIQ0_SRC2_WB           = 79;
parameter AIQ0_SRC2_RDY          = 78;
parameter AIQ0_SRC1_LSU_MATCH    = 77;
parameter AIQ0_SRC1_DATA         = 76;
parameter AIQ0_SRC1_PREG         = 76;
parameter AIQ0_SRC1_WB           = 69;
parameter AIQ0_SRC1_RDY          = 68;
parameter AIQ0_SRC0_LSU_MATCH    = 67;
parameter AIQ0_SRC0_DATA         = 66;
parameter AIQ0_SRC0_PREG         = 66;
parameter AIQ0_SRC0_WB           = 59;
parameter AIQ0_SRC0_RDY          = 58;
parameter AIQ0_DST_VREG          = 57;
parameter AIQ0_DST_PREG          = 50;
parameter AIQ0_DSTV_VLD          = 43;
parameter AIQ0_DST_VLD           = 42;
parameter AIQ0_SRC2_VLD          = 41;
parameter AIQ0_SRC1_VLD          = 40;
parameter AIQ0_SRC0_VLD          = 39;
parameter AIQ0_IID               = 38;
parameter AIQ0_OPCODE            = 31;

//----------------------------------------------------------
//                    AIQ1 Parameters
//----------------------------------------------------------
parameter AIQ1_WIDTH             = 214;

parameter AIQ1_VL                = 213;
parameter AIQ1_LCH_PREG          = 205;
parameter AIQ1_VSEW              = 204;
parameter AIQ1_VLMUL             = 201;
parameter AIQ1_LCH_RDY_SDIQ      = 199;
parameter AIQ1_LCH_RDY_LSIQ      = 187;
parameter AIQ1_LCH_RDY_BIQ       = 163;
parameter AIQ1_LCH_RDY_AIQ1      = 139;
parameter AIQ1_LCH_RDY_AIQ0      = 115;
parameter AIQ1_ALU_SHORT         = 91;
parameter AIQ1_MLA               = 90;
parameter AIQ1_MTVR              = 89;
parameter AIQ1_SRC2_LSU_MATCH    = 88;
parameter AIQ1_SRC2_DATA         = 87;
parameter AIQ1_SRC2_PREG         = 86;
parameter AIQ1_SRC2_WB           = 79;
parameter AIQ1_SRC2_RDY          = 78;
parameter AIQ1_SRC1_LSU_MATCH    = 77;
parameter AIQ1_SRC1_DATA         = 76;
parameter AIQ1_SRC1_PREG         = 76;
parameter AIQ1_SRC1_WB           = 69;
parameter AIQ1_SRC1_RDY          = 68;
parameter AIQ1_SRC0_LSU_MATCH    = 67;
parameter AIQ1_SRC0_DATA         = 66;
parameter AIQ1_SRC0_PREG         = 66;
parameter AIQ1_SRC0_WB           = 59;
parameter AIQ1_SRC0_RDY          = 58;
parameter AIQ1_DST_VREG          = 57;
parameter AIQ1_DST_PREG          = 50;
parameter AIQ1_DSTV_VLD          = 43;
parameter AIQ1_DST_VLD           = 42;
parameter AIQ1_SRC2_VLD          = 41;
parameter AIQ1_SRC1_VLD          = 40;
parameter AIQ1_SRC0_VLD          = 39;
parameter AIQ1_IID               = 38;
parameter AIQ1_OPCODE            = 31;

//----------------------------------------------------------
//                    BIQ Parameters
//----------------------------------------------------------
parameter BIQ_WIDTH             = 82;

parameter BIQ_VL                = 81;
parameter BIQ_VSEW              = 73;
parameter BIQ_VLMUL             = 70;
parameter BIQ_PCALL             = 68;
parameter BIQ_RTS               = 67;
parameter BIQ_PID               = 66;
parameter BIQ_LENGTH            = 61;
parameter BIQ_SRC1_LSU_MATCH    = 60;
parameter BIQ_SRC1_DATA         = 59;
parameter BIQ_SRC1_PREG         = 59;
parameter BIQ_SRC1_WB           = 52;
parameter BIQ_SRC1_RDY          = 51;
parameter BIQ_SRC0_LSU_MATCH    = 50;
parameter BIQ_SRC0_DATA         = 49;
parameter BIQ_SRC0_PREG         = 49;
parameter BIQ_SRC0_WB           = 42;
parameter BIQ_SRC0_RDY          = 41;
parameter BIQ_SRC1_VLD          = 40;
parameter BIQ_SRC0_VLD          = 39;
parameter BIQ_IID               = 38;
parameter BIQ_OPCODE            = 31;

//----------------------------------------------------------
//                    LSIQ Parameters
//----------------------------------------------------------
parameter LSIQ_WIDTH             = 163;

parameter LSIQ_VL                = 162;
parameter LSIQ_VMB               = 154;
parameter LSIQ_SPLIT_NUM         = 153;
parameter LSIQ_VSEW              = 146;
parameter LSIQ_VLMUL             = 143;
parameter LSIQ_BKPTB_DATA        = 141;
parameter LSIQ_BKPTA_DATA        = 140;
parameter LSIQ_AGEVEC_ALL        = 139;
parameter LSIQ_ALREADY_DA        = 128;
parameter LSIQ_UNALIGN_2ND       = 127;
parameter LSIQ_SPEC_FAIL         = 126;
parameter LSIQ_NO_SPEC_EXIST     = 125;
parameter LSIQ_NO_SPEC           = 124;
parameter LSIQ_SPLIT             = 123;
parameter LSIQ_SDIQ_ENTRY        = 122;
parameter LSIQ_STADDR            = 110;
parameter LSIQ_PC                = 109;
parameter LSIQ_BAR_TYPE          = 94;
parameter LSIQ_BAR               = 90;
parameter LSIQ_STORE             = 89;
parameter LSIQ_LOAD              = 88;
parameter LSIQ_SRCVM_LSU_MATCH   = 87;
parameter LSIQ_SRCVM_DATA        = 86;
parameter LSIQ_SRCVM_VREG        = 86;
parameter LSIQ_SRCVM_WB          = 79;
parameter LSIQ_SRCVM_RDY         = 78;
parameter LSIQ_SRC1_LSU_MATCH    = 77;
parameter LSIQ_SRC1_DATA         = 76;
parameter LSIQ_SRC1_PREG         = 76;
parameter LSIQ_SRC1_WB           = 69;
parameter LSIQ_SRC1_RDY          = 68;
parameter LSIQ_SRC0_LSU_MATCH    = 67;
parameter LSIQ_SRC0_DATA         = 66;
parameter LSIQ_SRC0_PREG         = 66;
parameter LSIQ_SRC0_WB           = 59;
parameter LSIQ_SRC0_RDY          = 58;
parameter LSIQ_DST_VREG          = 57;
parameter LSIQ_DST_PREG          = 50;
parameter LSIQ_DSTV_VLD          = 43;
parameter LSIQ_DST_VLD           = 42;
parameter LSIQ_SRCVM_VLD         = 41;
parameter LSIQ_SRC1_VLD          = 40;
parameter LSIQ_SRC0_VLD          = 39;
parameter LSIQ_IID               = 38;
parameter LSIQ_OPCODE            = 31;

//----------------------------------------------------------
//                    SDIQ Parameters
//----------------------------------------------------------
parameter SDIQ_WIDTH             = 27;

parameter SDIQ_LOAD              = 26;
parameter SDIQ_STADDR1_IN_STQ    = 25;
parameter SDIQ_STADDR0_IN_STQ    = 24;
parameter SDIQ_STDATA1_VLD       = 23;
parameter SDIQ_UNALIGN           = 22;
parameter SDIQ_SRCV0_LSU_MATCH   = 21;
parameter SDIQ_SRCV0_DATA        = 20;
parameter SDIQ_SRCV0_VREG        = 20;
parameter SDIQ_SRCV0_WB          = 13;
parameter SDIQ_SRCV0_RDY         = 12;
parameter SDIQ_SRC0_LSU_MATCH    = 11;
parameter SDIQ_SRC0_DATA         = 10;
parameter SDIQ_SRC0_PREG         = 10;
parameter SDIQ_SRC0_WB           = 3;
parameter SDIQ_SRC0_RDY          = 2;
parameter SDIQ_SRCV0_VLD         = 1;
parameter SDIQ_SRC0_VLD          = 0;

//----------------------------------------------------------
//                    VIQ0 Parameters
//----------------------------------------------------------
parameter VIQ0_WIDTH             = 151;

parameter VIQ0_VL                = 150;
parameter VIQ0_VSEW              = 142;
parameter VIQ0_VLMUL             = 139;
parameter VIQ0_VMUL              = 137;
parameter VIQ0_VMLA_SHORT        = 136;
parameter VIQ0_VDIV              = 135;
parameter VIQ0_LCH_RDY_VIQ1      = 134;
parameter VIQ0_LCH_RDY_VIQ0      = 126;
parameter VIQ0_VMLA_TYPE         = 118;
parameter VIQ0_SPLIT_NUM         = 115;
parameter VIQ0_SPLIT_LAST        = 108;
parameter VIQ0_MFVR              = 107;
parameter VIQ0_VMLA              = 106;
parameter VIQ0_SRCVM_DATA        = 105;
parameter VIQ0_SRCVM_LSU_MATCH   = 105;
parameter VIQ0_SRCVM_VREG        = 104;
parameter VIQ0_SRCVM_WB          = 97;
parameter VIQ0_SRCVM_RDY         = 96;
parameter VIQ0_SRCV2_DATA        = 95;
parameter VIQ0_SRCV2_LSU_MATCH   = 95;
parameter VIQ0_SRCV2_VREG        = 93;
parameter VIQ0_SRCV2_WB          = 86;
parameter VIQ0_SRCV2_RDY         = 85;
parameter VIQ0_SRCV1_DATA        = 84;
parameter VIQ0_SRCV1_LSU_MATCH   = 84;
parameter VIQ0_SRCV1_VREG        = 83;
parameter VIQ0_SRCV1_WB          = 76;
parameter VIQ0_SRCV1_RDY         = 75;
parameter VIQ0_SRCV0_DATA        = 74;
parameter VIQ0_SRCV0_LSU_MATCH   = 74;
parameter VIQ0_SRCV0_VREG        = 73;
parameter VIQ0_SRCV0_WB          = 66;
parameter VIQ0_SRCV0_RDY         = 65;
parameter VIQ0_DST_EREG          = 64;
parameter VIQ0_DST_VREG          = 59;
parameter VIQ0_DST_PREG          = 52;
parameter VIQ0_DSTE_VLD          = 45;
parameter VIQ0_DSTV_VLD          = 44;
parameter VIQ0_DST_VLD           = 43;
parameter VIQ0_SRCVM_VLD         = 42;
parameter VIQ0_SRCV2_VLD         = 41;
parameter VIQ0_SRCV1_VLD         = 40;
parameter VIQ0_SRCV0_VLD         = 39;
parameter VIQ0_IID               = 38;
parameter VIQ0_OPCODE            = 31;

//----------------------------------------------------------
//                    VIQ1 Parameters
//----------------------------------------------------------
parameter VIQ1_WIDTH             = 150;

parameter VIQ1_VL                = 149;
parameter VIQ1_VSEW              = 141;
parameter VIQ1_VLMUL             = 138;
parameter VIQ1_VMUL_UNSPLIT      = 136;
parameter VIQ1_VMLA_SHORT        = 135;
parameter VIQ1_LCH_RDY_VIQ1      = 134;
parameter VIQ1_LCH_RDY_VIQ0      = 126;
parameter VIQ1_VMLA_TYPE         = 118;
parameter VIQ1_SPLIT_NUM         = 115;
parameter VIQ1_SPLIT_LAST        = 108;
parameter VIQ1_MFVR              = 107;
parameter VIQ1_VMLA              = 106;
parameter VIQ1_SRCVM_DATA        = 105;
parameter VIQ1_SRCVM_LSU_MATCH   = 105;
parameter VIQ1_SRCVM_VREG        = 104;
parameter VIQ1_SRCVM_WB          = 97;
parameter VIQ1_SRCVM_RDY         = 96;
parameter VIQ1_SRCV2_DATA        = 95;
parameter VIQ1_SRCV2_LSU_MATCH   = 95;
parameter VIQ1_SRCV2_VREG        = 93;
parameter VIQ1_SRCV2_WB          = 86;
parameter VIQ1_SRCV2_RDY         = 85;
parameter VIQ1_SRCV1_DATA        = 84;
parameter VIQ1_SRCV1_LSU_MATCH   = 84;
parameter VIQ1_SRCV1_VREG        = 83;
parameter VIQ1_SRCV1_WB          = 76;
parameter VIQ1_SRCV1_RDY         = 75;
parameter VIQ1_SRCV0_DATA        = 74;
parameter VIQ1_SRCV0_LSU_MATCH   = 74;
parameter VIQ1_SRCV0_VREG        = 73;
parameter VIQ1_SRCV0_WB          = 66;
parameter VIQ1_SRCV0_RDY         = 65;
parameter VIQ1_DST_EREG          = 64;
parameter VIQ1_DST_VREG          = 59;
parameter VIQ1_DST_PREG          = 52;
parameter VIQ1_DSTE_VLD          = 45;
parameter VIQ1_DSTV_VLD          = 44;
parameter VIQ1_DST_VLD           = 43;
parameter VIQ1_SRCVM_VLD         = 42;
parameter VIQ1_SRCV2_VLD         = 41;
parameter VIQ1_SRCV1_VLD         = 40;
parameter VIQ1_SRCV0_VLD         = 39;
parameter VIQ1_IID               = 38;
parameter VIQ1_OPCODE            = 31;

//----------------------------------------------------------
//                    ALU Parameters
//----------------------------------------------------------
parameter ALU_SEL                = 21;

//==========================================================
//                    Pipe0 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe0_clk_en = aiq0_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe0_gated_clk"); @339
gated_clk_cell  x_rf_pipe0_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe0_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe0_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @340
//          .external_en (1'b0), @341
//          .global_en   (cp0_yy_clk_en), @342
//          .module_en   (cp0_idu_icg_en), @343
//          .local_en    (rf_pipe0_clk_en), @344
//          .clk_out     (rf_pipe0_clk)); @345

//----------------------------------------------------------
//                  Rename Pipedown Data
//----------------------------------------------------------
assign dp_ctrl_is_aiq0_issue_dst_vld        = aiq0_dp_issue_read_data[AIQ0_DST_VLD];
assign dp_ctrl_is_aiq0_issue_div            = aiq0_dp_issue_read_data[AIQ0_DIV];
assign dp_ctrl_is_aiq0_issue_lch_preg       = aiq0_dp_issue_read_data[AIQ0_LCH_PREG];
assign dp_ctrl_is_aiq0_issue_alu_short      = aiq0_dp_issue_read_data[AIQ0_ALU_SHORT];
assign dp_ctrl_is_aiq0_issue_special        = aiq0_dp_issue_read_data[AIQ0_SPECIAL];

assign dp_ctrl_is_aiq0_issue_lch_rdy[107:0] = aiq0_dp_issue_read_data[AIQ0_LCH_RDY_SDIQ:AIQ0_LCH_RDY_AIQ0-23];

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe0_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe0_iq_entry[7:0]        <= 8'b0;
    rf_pipe0_data[AIQ0_WIDTH-1:0] <= {AIQ0_WIDTH{1'b0}};
    rf_pipe0_dst_preg_dup0[6:0]   <= 7'b0;
    rf_pipe0_dst_preg_dup1[6:0]   <= 7'b0;
    rf_pipe0_dst_preg_dup2[6:0]   <= 7'b0;
    rf_pipe0_dst_preg_dup3[6:0]   <= 7'b0;
    rf_pipe0_dst_preg_dup4[6:0]   <= 7'b0;
  end
  else if(aiq0_xx_issue_en) begin
    rf_pipe0_iq_entry[7:0]        <= aiq0_dp_issue_entry[7:0];
    rf_pipe0_data[AIQ0_WIDTH-1:0] <= aiq0_dp_issue_read_data[AIQ0_WIDTH-1:0];
    rf_pipe0_dst_preg_dup0[6:0]   <= aiq0_dp_issue_read_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
    rf_pipe0_dst_preg_dup1[6:0]   <= aiq0_dp_issue_read_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
    rf_pipe0_dst_preg_dup2[6:0]   <= aiq0_dp_issue_read_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
    rf_pipe0_dst_preg_dup3[6:0]   <= aiq0_dp_issue_read_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
    rf_pipe0_dst_preg_dup4[6:0]   <= aiq0_dp_issue_read_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
  end
  else begin
    rf_pipe0_iq_entry[7:0]        <= rf_pipe0_iq_entry[7:0];
    rf_pipe0_data[AIQ0_WIDTH-1:0] <= rf_pipe0_data[AIQ0_WIDTH-1:0];
    rf_pipe0_dst_preg_dup0[6:0]   <= rf_pipe0_dst_preg_dup0[6:0];
    rf_pipe0_dst_preg_dup1[6:0]   <= rf_pipe0_dst_preg_dup1[6:0];
    rf_pipe0_dst_preg_dup2[6:0]   <= rf_pipe0_dst_preg_dup2[6:0];
    rf_pipe0_dst_preg_dup3[6:0]   <= rf_pipe0_dst_preg_dup3[6:0];
    rf_pipe0_dst_preg_dup4[6:0]   <= rf_pipe0_dst_preg_dup4[6:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
assign rf_pipe0_prf_src0_preg_updt_vld = aiq0_xx_issue_en;
//                                         && aiq0_dp_issue_read_data[AIQ0_SRC0_VLD]
//                                         && aiq0_dp_issue_read_data[AIQ0_SRC0_WB];
assign rf_pipe0_fwd_src0_preg_updt_vld = aiq0_xx_issue_en;
//                                         && aiq0_dp_issue_read_data[AIQ0_SRC0_VLD]
//                                         && !aiq0_dp_issue_read_data[AIQ0_SRC0_WB];
assign rf_pipe0_prf_src1_preg_updt_vld = aiq0_xx_issue_en;
//                                         && aiq0_dp_issue_read_data[AIQ0_SRC1_VLD]
//                                         && aiq0_dp_issue_read_data[AIQ0_SRC1_WB];
assign rf_pipe0_fwd_src1_preg_updt_vld = aiq0_xx_issue_en;
//                                         && aiq0_dp_issue_read_data[AIQ0_SRC1_VLD]
//                                         && !aiq0_dp_issue_read_data[AIQ0_SRC1_WB];
assign rf_pipe0_prf_src2_preg_updt_vld = aiq0_xx_issue_en
                                         && aiq0_dp_issue_read_data[AIQ0_SRC2_VLD];
//                                         && aiq0_dp_issue_read_data[AIQ0_SRC2_WB];
assign rf_pipe0_fwd_src2_preg_updt_vld = aiq0_xx_issue_en
                                         && aiq0_dp_issue_read_data[AIQ0_SRC2_VLD];
//                                         && !aiq0_dp_issue_read_data[AIQ0_SRC2_WB];

always @(posedge rf_pipe0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe0_prf_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe0_prf_src0_preg_updt_vld)
    rf_pipe0_prf_src0_preg[6:0] <= aiq0_dp_issue_read_data[AIQ0_SRC0_PREG:AIQ0_SRC0_PREG-6];
  else
    rf_pipe0_prf_src0_preg[6:0] <= rf_pipe0_prf_src0_preg[6:0];
end

always @(posedge rf_pipe0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe0_fwd_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe0_fwd_src0_preg_updt_vld)
    rf_pipe0_fwd_src0_preg[6:0] <= aiq0_dp_issue_read_data[AIQ0_SRC0_PREG:AIQ0_SRC0_PREG-6];
  else
    rf_pipe0_fwd_src0_preg[6:0] <= rf_pipe0_fwd_src0_preg[6:0];
end

always @(posedge rf_pipe0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe0_prf_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe0_prf_src1_preg_updt_vld)
    rf_pipe0_prf_src1_preg[6:0] <= aiq0_dp_issue_read_data[AIQ0_SRC1_PREG:AIQ0_SRC1_PREG-6];
  else
    rf_pipe0_prf_src1_preg[6:0] <= rf_pipe0_prf_src1_preg[6:0];
end

always @(posedge rf_pipe0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe0_fwd_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe0_fwd_src1_preg_updt_vld)
    rf_pipe0_fwd_src1_preg[6:0] <= aiq0_dp_issue_read_data[AIQ0_SRC1_PREG:AIQ0_SRC1_PREG-6];
  else
    rf_pipe0_fwd_src1_preg[6:0] <= rf_pipe0_fwd_src1_preg[6:0];
end

//output
assign dp_prf_rf_pipe0_src0_preg[6:0] = rf_pipe0_prf_src0_preg[6:0];
assign dp_fwd_rf_pipe0_src0_preg[6:0] = rf_pipe0_fwd_src0_preg[6:0];
assign dp_prf_rf_pipe0_src1_preg[6:0] = rf_pipe0_prf_src1_preg[6:0];
assign dp_fwd_rf_pipe0_src1_preg[6:0] = rf_pipe0_fwd_src1_preg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for issue queue
assign dp_aiq0_rf_lch_entry[7:0]    = rf_pipe0_iq_entry[7:0];
//for control path
assign dp_ctrl_rf_pipe0_src2_vld    = rf_pipe0_data[AIQ0_SRC2_VLD];
assign dp_ctrl_rf_pipe0_mtvr        = rf_pipe0_data[AIQ0_MTVR];
//for dependency entry
assign dp_xx_rf_pipe0_dst_preg_dup0[6:0] = rf_pipe0_dst_preg_dup0[6:0];
assign dp_xx_rf_pipe0_dst_preg_dup1[6:0] = rf_pipe0_dst_preg_dup1[6:0];
assign dp_xx_rf_pipe0_dst_preg_dup2[6:0] = rf_pipe0_dst_preg_dup2[6:0];
assign dp_xx_rf_pipe0_dst_preg_dup3[6:0] = rf_pipe0_dst_preg_dup3[6:0];
assign dp_xx_rf_pipe0_dst_preg_dup4[6:0] = rf_pipe0_dst_preg_dup4[6:0];

//----------------------------------------------------------
//                    RF stage Decoder
//----------------------------------------------------------
// &Instance("ct_idu_rf_pipe0_decd", "x_ct_idu_rf_pipe0_decd"); @478
ct_idu_rf_pipe0_decd  x_ct_idu_rf_pipe0_decd (
  .pipe0_decd_eu_sel   (pipe0_decd_eu_sel  ),
  .pipe0_decd_expt_vld (pipe0_decd_expt_vld),
  .pipe0_decd_func     (pipe0_decd_func    ),
  .pipe0_decd_imm      (pipe0_decd_imm     ),
  .pipe0_decd_opcode   (pipe0_decd_opcode  ),
  .pipe0_decd_sel      (pipe0_decd_sel     ),
  .pipe0_decd_src1_imm (pipe0_decd_src1_imm)
);

//decode input
assign pipe0_decd_opcode[31:0]      = rf_pipe0_data[AIQ0_OPCODE:AIQ0_OPCODE-31];
assign pipe0_decd_expt_vld          = rf_pipe0_data[AIQ0_EXPT_VLD];
//decode output
assign dp_ctrl_rf_pipe0_eu_sel[3:0] = pipe0_decd_eu_sel[3:0];

//----------------------------------------------------------
//                    Source Operand 0
//----------------------------------------------------------
// &CombBeg; @488
always @( fwd_dp_rf_pipe0_src0_data[63:0]
       or prf_dp_rf_pipe0_src0_data[63:0]
       or rf_pipe0_data[59])
begin
  if(rf_pipe0_data[AIQ0_SRC0_WB])
    rf_pipe0_src0_data[63:0] = prf_dp_rf_pipe0_src0_data[63:0];
  else
    rf_pipe0_src0_data[63:0] = fwd_dp_rf_pipe0_src0_data[63:0];
// &CombEnd; @493
end

assign rf_pipe0_src0_data_no_fwd[63:0] = (had_idu_wbbr_vld)
                                         ? had_idu_wbbr_data[63:0]
                                         : prf_dp_rf_pipe0_src0_data[63:0];

assign rf_pipe0_src0_no_rdy            = rf_pipe0_data[AIQ0_SRC0_VLD]
                                         && !rf_pipe0_data[AIQ0_SRC0_WB]
                                         && fwd_dp_rf_pipe0_src0_no_fwd;

//----------------------------------------------------------
//                    Source Operand 1
//----------------------------------------------------------
// &CombBeg; @506
always @( fwd_dp_rf_pipe0_src1_data[63:0]
       or pipe0_decd_src1_imm[63:0]
       or rf_pipe0_data[40]
       or prf_dp_rf_pipe0_src1_data[63:0]
       or rf_pipe0_data[69])
begin
  if(!rf_pipe0_data[AIQ0_SRC1_VLD])
    rf_pipe0_src1_data[63:0] = pipe0_decd_src1_imm[63:0];
  else if(rf_pipe0_data[AIQ0_SRC1_WB])
    rf_pipe0_src1_data[63:0] = prf_dp_rf_pipe0_src1_data[63:0];
  else
    rf_pipe0_src1_data[63:0] = fwd_dp_rf_pipe0_src1_data[63:0];
// &CombEnd; @513
end

assign rf_pipe0_src1_data_no_imm[63:0] = (rf_pipe0_data[AIQ0_SRC1_WB])
                                         ? prf_dp_rf_pipe0_src1_data[63:0]
                                         : fwd_dp_rf_pipe0_src1_data[63:0];

assign rf_pipe0_src1_no_rdy            = rf_pipe0_data[AIQ0_SRC1_VLD]
                                         && !rf_pipe0_data[AIQ0_SRC1_WB]
                                         && fwd_dp_rf_pipe0_src1_no_fwd;

//----------------------------------------------------------
//                    Source Operand 2
//----------------------------------------------------------
assign rf_pipe0_src2_data[63:0]        = rf_pipe0_data[AIQ0_SRC2_WB]
                                         ? prf_dp_rf_pipe3_src1_data[63:0]
                                         : fwd_dp_rf_pipe3_src1_data[63:0];

assign rf_pipe0_src2_no_rdy            = rf_pipe0_data[AIQ0_SRC2_VLD]
                                         && !rf_pipe0_data[AIQ0_SRC2_WB]
                                         && fwd_dp_rf_pipe3_src1_no_fwd;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe0_src_no_rdy     = rf_pipe0_src0_no_rdy
                                         || rf_pipe0_src1_no_rdy
                                         || rf_pipe0_src2_no_rdy;
assign dp_aiq0_rf_rdy_clr[0]           = rf_pipe0_src0_no_rdy
                                         && !ctrl_dp_rf_pipe0_other_lch_fail;
assign dp_aiq0_rf_rdy_clr[1]           = rf_pipe0_src1_no_rdy
                                         && !ctrl_dp_rf_pipe0_other_lch_fail;
assign dp_aiq0_rf_rdy_clr[2]           = rf_pipe0_src2_no_rdy
                                         && !ctrl_dp_rf_pipe0_other_lch_fail;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to iu
assign idu_iu_rf_pipe0_iid[6:0]              = rf_pipe0_data[AIQ0_IID:AIQ0_IID-6];
assign idu_iu_rf_pipe0_opcode[31:0]          = rf_pipe0_data[AIQ0_OPCODE:AIQ0_OPCODE-31];
assign idu_iu_rf_pipe0_dst_vld               = rf_pipe0_data[AIQ0_DST_VLD];
assign idu_iu_rf_pipe0_dst_preg[6:0]         = rf_pipe0_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
assign idu_iu_rf_pipe0_dstv_vld              = rf_pipe0_data[AIQ0_DSTV_VLD];
assign idu_iu_rf_pipe0_dst_vreg[6:0]         = rf_pipe0_data[AIQ0_DST_VREG:AIQ0_DST_VREG-6];
assign idu_iu_rf_pipe0_func[4:0]             = pipe0_decd_func[4:0];
assign idu_iu_rf_pipe0_src0[63:0]            = rf_pipe0_src0_data[63:0];
assign idu_iu_rf_pipe0_src1[63:0]            = rf_pipe0_src1_data[63:0];
assign idu_iu_rf_pipe0_src1_no_imm[63:0]     = rf_pipe0_src1_data_no_imm[63:0];
assign idu_iu_rf_pipe0_src2[63:0]            = rf_pipe0_src2_data[63:0];
assign idu_iu_rf_pipe0_imm[5:0]              = pipe0_decd_imm[5:0];
assign idu_iu_rf_pipe0_alu_short             = rf_pipe0_data[AIQ0_ALU_SHORT];
assign idu_iu_rf_pipe0_rslt_sel[ALU_SEL-1:0] = pipe0_decd_sel[ALU_SEL-1:0];
assign idu_iu_rf_pipe0_vlmul[1:0]            = rf_pipe0_data[AIQ0_VLMUL:AIQ0_VLMUL-1];
assign idu_iu_rf_pipe0_vsew[2:0]             = rf_pipe0_data[AIQ0_VSEW:AIQ0_VSEW-2];
assign idu_iu_rf_pipe0_vl[7:0]               = rf_pipe0_data[AIQ0_VL:AIQ0_VL-7];
//output to special
assign idu_iu_rf_pipe0_expt_vld              = rf_pipe0_data[AIQ0_EXPT_VLD];
assign idu_iu_rf_pipe0_expt_vec[4:0]         = rf_pipe0_data[AIQ0_EXPT_VEC:AIQ0_EXPT_VEC-4];
assign idu_iu_rf_pipe0_high_hw_expt          = rf_pipe0_data[AIQ0_HIGH_HW_EXPT];
assign idu_iu_rf_pipe0_special_imm[19:0]     = pipe0_decd_src1_imm[19:0];
assign idu_iu_rf_pipe0_pid[4:0]              = rf_pipe0_data[AIQ0_PID:AIQ0_PID-4];
//output to cp0
assign idu_cp0_rf_iid[6:0]                   = rf_pipe0_data[AIQ0_IID:AIQ0_IID-6];
assign idu_cp0_rf_opcode[31:0]               = rf_pipe0_data[AIQ0_OPCODE:AIQ0_OPCODE-31];
assign idu_cp0_rf_preg[6:0]                  = rf_pipe0_data[AIQ0_DST_PREG:AIQ0_DST_PREG-6];
assign idu_cp0_rf_src0[63:0]                 = rf_pipe0_src0_data_no_fwd[63:0];
assign idu_cp0_rf_func[4:0]                  = pipe0_decd_func[4:0];

//==========================================================
//                    Pipe1 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe1_clk_en = aiq1_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe1_gated_clk"); @590
gated_clk_cell  x_rf_pipe1_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe1_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe1_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @591
//          .external_en (1'b0), @592
//          .global_en   (cp0_yy_clk_en), @593
//          .module_en   (cp0_idu_icg_en), @594
//          .local_en    (rf_pipe1_clk_en), @595
//          .clk_out     (rf_pipe1_clk)); @596

//----------------------------------------------------------
//                  Rename Pipedown Data
//----------------------------------------------------------
assign dp_ctrl_is_aiq1_issue_dst_vld        = aiq1_dp_issue_read_data[AIQ1_DST_VLD];
assign dp_ctrl_is_aiq1_issue_lch_preg       = aiq1_dp_issue_read_data[AIQ1_LCH_PREG];
assign dp_ctrl_is_aiq1_issue_mla_vld        = aiq1_dp_issue_read_data[AIQ1_MLA];
assign dp_ctrl_is_aiq1_issue_alu_short      = aiq1_dp_issue_read_data[AIQ1_ALU_SHORT];

assign dp_ctrl_is_aiq1_issue_lch_rdy[107:0] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_SDIQ:AIQ1_LCH_RDY_AIQ0-23];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[7] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-0];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[6] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-3];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[5] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-6];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[4] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-9];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[3] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-12];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[2] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-15];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[1] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-18];
assign dp_ctrl_is_aiq1_issue_mla_lch_rdy[0] = aiq1_dp_issue_read_data[AIQ1_LCH_RDY_AIQ1-21];

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe1_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe1_iq_entry[7:0]        <= 8'b0;
    rf_pipe1_data[AIQ1_WIDTH-1:0] <= {AIQ1_WIDTH{1'b0}};
    rf_pipe1_dst_preg_dup0[6:0]   <= 7'b0;
    rf_pipe1_dst_preg_dup1[6:0]   <= 7'b0;
    rf_pipe1_dst_preg_dup2[6:0]   <= 7'b0;
    rf_pipe1_dst_preg_dup3[6:0]   <= 7'b0;
    rf_pipe1_dst_preg_dup4[6:0]   <= 7'b0;
  end
  else if(aiq1_xx_issue_en) begin
    rf_pipe1_iq_entry[7:0]        <= aiq1_dp_issue_entry[7:0];
    rf_pipe1_data[AIQ1_WIDTH-1:0] <= aiq1_dp_issue_read_data[AIQ1_WIDTH-1:0];
    rf_pipe1_dst_preg_dup0[6:0]   <= aiq1_dp_issue_read_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6];
    rf_pipe1_dst_preg_dup1[6:0]   <= aiq1_dp_issue_read_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6];
    rf_pipe1_dst_preg_dup2[6:0]   <= aiq1_dp_issue_read_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6];
    rf_pipe1_dst_preg_dup3[6:0]   <= aiq1_dp_issue_read_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6];
    rf_pipe1_dst_preg_dup4[6:0]   <= aiq1_dp_issue_read_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6];
  end
  else begin
    rf_pipe1_iq_entry[7:0]        <= rf_pipe1_iq_entry[7:0];
    rf_pipe1_data[AIQ1_WIDTH-1:0] <= rf_pipe1_data[AIQ1_WIDTH-1:0];
    rf_pipe1_dst_preg_dup0[6:0]   <= rf_pipe1_dst_preg_dup0[6:0];
    rf_pipe1_dst_preg_dup1[6:0]   <= rf_pipe1_dst_preg_dup1[6:0];
    rf_pipe1_dst_preg_dup2[6:0]   <= rf_pipe1_dst_preg_dup2[6:0];
    rf_pipe1_dst_preg_dup3[6:0]   <= rf_pipe1_dst_preg_dup3[6:0];
    rf_pipe1_dst_preg_dup4[6:0]   <= rf_pipe1_dst_preg_dup4[6:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
//for power and timing optimization, duplicate source preg index
//rf pipe source index will never swap because:
//1.producer launch when it is allocated with preg
//2.consumer issue after producer launch no matter replay or not
assign rf_pipe1_prf_src0_preg_updt_vld = aiq1_xx_issue_en;
//                                         && aiq1_dp_issue_read_data[AIQ1_SRC0_VLD]
//                                         && aiq1_dp_issue_read_data[AIQ1_SRC0_WB];
assign rf_pipe1_fwd_src0_preg_updt_vld = aiq1_xx_issue_en;
//                                         && aiq1_dp_issue_read_data[AIQ1_SRC0_VLD]
//                                         && !aiq1_dp_issue_read_data[AIQ1_SRC0_WB];
assign rf_pipe1_prf_src1_preg_updt_vld = aiq1_xx_issue_en;
//                                         && aiq1_dp_issue_read_data[AIQ1_SRC1_VLD]
//                                         && aiq1_dp_issue_read_data[AIQ1_SRC1_WB];
assign rf_pipe1_fwd_src1_preg_updt_vld = aiq1_xx_issue_en;
//                                         && aiq1_dp_issue_read_data[AIQ1_SRC1_VLD]
//                                         && !aiq1_dp_issue_read_data[AIQ1_SRC1_WB];
assign rf_pipe1_prf_src2_preg_updt_vld = aiq1_xx_issue_en
                                         && aiq1_dp_issue_read_data[AIQ1_SRC2_VLD];
//                                         && aiq1_dp_issue_read_data[AIQ1_SRC2_WB];
assign rf_pipe1_fwd_src2_preg_updt_vld = aiq1_xx_issue_en
                                         && aiq1_dp_issue_read_data[AIQ1_SRC2_VLD];
//                                         && !aiq1_dp_issue_read_data[AIQ1_SRC2_WB];

always @(posedge rf_pipe1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe1_prf_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe1_prf_src0_preg_updt_vld)
    rf_pipe1_prf_src0_preg[6:0] <= aiq1_dp_issue_read_data[AIQ1_SRC0_PREG:AIQ1_SRC0_PREG-6];
  else
    rf_pipe1_prf_src0_preg[6:0] <= rf_pipe1_prf_src0_preg[6:0];
end

always @(posedge rf_pipe1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe1_fwd_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe1_fwd_src0_preg_updt_vld)
    rf_pipe1_fwd_src0_preg[6:0] <= aiq1_dp_issue_read_data[AIQ1_SRC0_PREG:AIQ1_SRC0_PREG-6];
  else
    rf_pipe1_fwd_src0_preg[6:0] <= rf_pipe1_fwd_src0_preg[6:0];
end

always @(posedge rf_pipe1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe1_prf_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe1_prf_src1_preg_updt_vld)
    rf_pipe1_prf_src1_preg[6:0] <= aiq1_dp_issue_read_data[AIQ1_SRC1_PREG:AIQ1_SRC1_PREG-6];
  else
    rf_pipe1_prf_src1_preg[6:0] <= rf_pipe1_prf_src1_preg[6:0];
end

always @(posedge rf_pipe1_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe1_fwd_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe1_fwd_src1_preg_updt_vld)
    rf_pipe1_fwd_src1_preg[6:0] <= aiq1_dp_issue_read_data[AIQ1_SRC1_PREG:AIQ1_SRC1_PREG-6];
  else
    rf_pipe1_fwd_src1_preg[6:0] <= rf_pipe1_fwd_src1_preg[6:0];
end

//output
assign dp_prf_rf_pipe1_src0_preg[6:0] = rf_pipe1_prf_src0_preg[6:0];
assign dp_fwd_rf_pipe1_src0_preg[6:0] = rf_pipe1_fwd_src0_preg[6:0];
assign dp_prf_rf_pipe1_src1_preg[6:0] = rf_pipe1_prf_src1_preg[6:0];
assign dp_fwd_rf_pipe1_src1_preg[6:0] = rf_pipe1_fwd_src1_preg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for issue queue
assign dp_aiq1_rf_lch_entry[7:0]    = rf_pipe1_iq_entry[7:0];
//for control path
assign dp_ctrl_rf_pipe1_src2_vld    = rf_pipe1_data[AIQ1_SRC2_VLD];
assign dp_ctrl_rf_pipe1_mtvr        = rf_pipe1_data[AIQ1_MTVR];
//for forward
assign dp_fwd_rf_pipe1_mla          = rf_pipe1_data[AIQ1_MLA];
//for dependency entry
assign dp_xx_rf_pipe1_dst_preg_dup0[6:0] = rf_pipe1_dst_preg_dup0[6:0];
assign dp_xx_rf_pipe1_dst_preg_dup1[6:0] = rf_pipe1_dst_preg_dup1[6:0];
assign dp_xx_rf_pipe1_dst_preg_dup2[6:0] = rf_pipe1_dst_preg_dup2[6:0];
assign dp_xx_rf_pipe1_dst_preg_dup3[6:0] = rf_pipe1_dst_preg_dup3[6:0];
assign dp_xx_rf_pipe1_dst_preg_dup4[6:0] = rf_pipe1_dst_preg_dup4[6:0];

//----------------------------------------------------------
//                    RF stage Decoder
//----------------------------------------------------------
// &Instance("ct_idu_rf_pipe1_decd", "x_ct_idu_rf_pipe1_decd"); @742
ct_idu_rf_pipe1_decd  x_ct_idu_rf_pipe1_decd (
  .pipe1_decd_eu_sel    (pipe1_decd_eu_sel   ),
  .pipe1_decd_func      (pipe1_decd_func     ),
  .pipe1_decd_imm       (pipe1_decd_imm      ),
  .pipe1_decd_mult_func (pipe1_decd_mult_func),
  .pipe1_decd_opcode    (pipe1_decd_opcode   ),
  .pipe1_decd_sel       (pipe1_decd_sel      ),
  .pipe1_decd_src1_imm  (pipe1_decd_src1_imm )
);

//decode input
assign pipe1_decd_opcode[31:0]      = rf_pipe1_data[AIQ1_OPCODE:AIQ1_OPCODE-31];
//decode output
assign dp_ctrl_rf_pipe1_eu_sel[1:0] = pipe1_decd_eu_sel[1:0];

//----------------------------------------------------------
//                    Source Operand 0
//----------------------------------------------------------
// &CombBeg; @751
always @( fwd_dp_rf_pipe1_src0_data[63:0]
       or prf_xx_rf_pipe1_src0_data[63:0]
       or rf_pipe1_data[59])
begin
  if(rf_pipe1_data[AIQ1_SRC0_WB])
    rf_pipe1_src0_data[63:0] = prf_xx_rf_pipe1_src0_data[63:0];
  else
    rf_pipe1_src0_data[63:0] = fwd_dp_rf_pipe1_src0_data[63:0];
// &CombEnd; @756
end

assign rf_pipe1_src0_no_rdy  = rf_pipe1_data[AIQ1_SRC0_VLD]
                               && !rf_pipe1_data[AIQ1_SRC0_WB]
                               && fwd_dp_rf_pipe1_src0_no_fwd;

//----------------------------------------------------------
//                    Source Operand 1
//----------------------------------------------------------
// &CombBeg; @765
always @( prf_xx_rf_pipe1_src1_data[63:0]
       or pipe1_decd_src1_imm[63:0]
       or fwd_dp_rf_pipe1_src1_data[63:0]
       or rf_pipe1_data[69]
       or rf_pipe1_data[40])
begin
  if(!rf_pipe1_data[AIQ1_SRC1_VLD])
    rf_pipe1_src1_data[63:0] = pipe1_decd_src1_imm[63:0];
  else if(rf_pipe1_data[AIQ1_SRC1_WB])
    rf_pipe1_src1_data[63:0] = prf_xx_rf_pipe1_src1_data[63:0];
  else
    rf_pipe1_src1_data[63:0] = fwd_dp_rf_pipe1_src1_data[63:0];
// &CombEnd; @772
end

assign rf_pipe1_src1_data_no_imm[63:0] = (rf_pipe1_data[AIQ1_SRC1_WB])
                                         ? prf_xx_rf_pipe1_src1_data[63:0]
                                         : fwd_dp_rf_pipe1_src1_data[63:0];

assign rf_pipe1_src1_no_rdy            = rf_pipe1_data[AIQ1_SRC1_VLD]
                                         && !rf_pipe1_data[AIQ1_SRC1_WB]
                                         && fwd_dp_rf_pipe1_src1_no_fwd;

//----------------------------------------------------------
//                    Source Operand 2
//----------------------------------------------------------
assign rf_pipe1_src2_data[63:0]        = rf_pipe1_data[AIQ1_SRC2_WB]
                                         ? prf_dp_rf_pipe5_src0_data[63:0]
                                         : fwd_dp_rf_pipe5_src0_data[63:0];

assign rf_pipe1_src2_no_rdy            = rf_pipe1_data[AIQ1_SRC2_VLD]
                                         && !rf_pipe1_data[AIQ1_SRC2_WB]
                                         && fwd_dp_rf_pipe5_src0_no_fwd;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe1_src_no_rdy     = rf_pipe1_src0_no_rdy
                                         || rf_pipe1_src1_no_rdy
                                         || rf_pipe1_src2_no_rdy;
assign dp_aiq1_rf_rdy_clr[0]           = rf_pipe1_src0_no_rdy;
assign dp_aiq1_rf_rdy_clr[1]           = rf_pipe1_src1_no_rdy;
assign dp_aiq1_rf_rdy_clr[2]           = rf_pipe1_src2_no_rdy;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to iu
assign idu_iu_rf_pipe1_iid[6:0]              = rf_pipe1_data[AIQ1_IID:AIQ1_IID-6];
assign idu_iu_rf_pipe1_dst_vld               = rf_pipe1_data[AIQ1_DST_VLD];
assign idu_iu_rf_pipe1_dst_preg[6:0]         = rf_pipe1_data[AIQ1_DST_PREG:AIQ1_DST_PREG-6];
assign idu_iu_rf_pipe1_dstv_vld              = rf_pipe1_data[AIQ1_DSTV_VLD];
assign idu_iu_rf_pipe1_dst_vreg[6:0]         = rf_pipe1_data[AIQ1_DST_VREG:AIQ1_DST_VREG-6];
assign idu_iu_rf_pipe1_func[4:0]             = pipe1_decd_func[4:0];
assign idu_iu_rf_pipe1_src0[63:0]            = rf_pipe1_src0_data[63:0];
assign idu_iu_rf_pipe1_src1[63:0]            = rf_pipe1_src1_data[63:0];
assign idu_iu_rf_pipe1_src2[63:0]            = rf_pipe1_src2_data[63:0];
assign idu_iu_rf_pipe1_src1_no_imm[63:0]     = rf_pipe1_src1_data_no_imm[63:0];
assign idu_iu_rf_pipe1_imm[5:0]              = pipe1_decd_imm[5:0];
assign idu_iu_rf_pipe1_mult_func[7:0]        = pipe1_decd_mult_func[7:0];
assign idu_iu_rf_pipe1_mla_src2_preg[6:0]    = rf_pipe1_data[AIQ1_SRC2_PREG:AIQ1_SRC2_PREG-6];
assign idu_iu_rf_pipe1_mla_src2_vld          = rf_pipe1_data[AIQ1_MLA];
assign idu_iu_rf_pipe1_alu_short             = rf_pipe1_data[AIQ1_ALU_SHORT];
assign idu_iu_rf_pipe1_rslt_sel[ALU_SEL-1:0] = pipe1_decd_sel[ALU_SEL-1:0];
assign idu_iu_rf_pipe1_vlmul[1:0]            = rf_pipe1_data[AIQ1_VLMUL:AIQ1_VLMUL-1];
assign idu_iu_rf_pipe1_vsew[2:0]             = rf_pipe1_data[AIQ1_VSEW:AIQ1_VSEW-2];
assign idu_iu_rf_pipe1_vl[7:0]               = rf_pipe1_data[AIQ1_VL:AIQ1_VL-7];

//==========================================================
//                    Pipe2 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe2_clk_en = biq_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe2_gated_clk"); @836
gated_clk_cell  x_rf_pipe2_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe2_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe2_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @837
//          .external_en (1'b0), @838
//          .global_en   (cp0_yy_clk_en), @839
//          .module_en   (cp0_idu_icg_en), @840
//          .local_en    (rf_pipe2_clk_en), @841
//          .clk_out     (rf_pipe2_clk)); @842

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe2_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe2_iq_entry[11:0]       <= 12'b0;
    rf_pipe2_data[BIQ_WIDTH-1:0]  <= {BIQ_WIDTH{1'b0}};
  end
  else if(biq_xx_issue_en) begin
    rf_pipe2_iq_entry[11:0]       <= biq_dp_issue_entry[11:0];
    rf_pipe2_data[BIQ_WIDTH-1:0]  <= biq_dp_issue_read_data[BIQ_WIDTH-1:0];
  end
  else begin
    rf_pipe2_iq_entry[11:0]       <= rf_pipe2_iq_entry[11:0];
    rf_pipe2_data[BIQ_WIDTH-1:0]  <= rf_pipe2_data[BIQ_WIDTH-1:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
//for power and timing optimization, duplicate source preg index
//rf pipe source index will never swap because:
//1.producer launch when it is allocated with preg
//2.consumer issue after producer launch no matter replay or not
assign rf_pipe2_prf_src0_preg_updt_vld = biq_xx_issue_en;
//                                         && biq_dp_issue_read_data[BIQ_SRC0_VLD]
//                                         && biq_dp_issue_read_data[BIQ_SRC0_WB];
assign rf_pipe2_prf_src1_preg_updt_vld = biq_xx_issue_en;
//                                         && biq_dp_issue_read_data[BIQ_SRC1_VLD]
//                                         && biq_dp_issue_read_data[BIQ_SRC1_WB];
assign rf_pipe2_fwd_src0_preg_updt_vld = biq_xx_issue_en;
//                                         && biq_dp_issue_read_data[BIQ_SRC0_VLD]
//                                         && !biq_dp_issue_read_data[BIQ_SRC0_WB];
assign rf_pipe2_fwd_src1_preg_updt_vld = biq_xx_issue_en;
//                                         && biq_dp_issue_read_data[BIQ_SRC1_VLD]
//                                         && !biq_dp_issue_read_data[BIQ_SRC1_WB];

always @(posedge rf_pipe2_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe2_prf_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe2_prf_src0_preg_updt_vld)
    rf_pipe2_prf_src0_preg[6:0] <= biq_dp_issue_read_data[BIQ_SRC0_PREG:BIQ_SRC0_PREG-6];
  else
    rf_pipe2_prf_src0_preg[6:0] <= rf_pipe2_prf_src0_preg[6:0];
end

always @(posedge rf_pipe2_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe2_prf_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe2_prf_src1_preg_updt_vld)
    rf_pipe2_prf_src1_preg[6:0] <= biq_dp_issue_read_data[BIQ_SRC1_PREG:BIQ_SRC1_PREG-6];
  else
    rf_pipe2_prf_src1_preg[6:0] <= rf_pipe2_prf_src1_preg[6:0];
end

always @(posedge rf_pipe2_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe2_fwd_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe2_fwd_src0_preg_updt_vld)
    rf_pipe2_fwd_src0_preg[6:0] <= biq_dp_issue_read_data[BIQ_SRC0_PREG:BIQ_SRC0_PREG-6];
  else
    rf_pipe2_fwd_src0_preg[6:0] <= rf_pipe2_fwd_src0_preg[6:0];
end

always @(posedge rf_pipe2_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe2_fwd_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe2_fwd_src1_preg_updt_vld)
    rf_pipe2_fwd_src1_preg[6:0] <= biq_dp_issue_read_data[BIQ_SRC1_PREG:BIQ_SRC1_PREG-6];
  else
    rf_pipe2_fwd_src1_preg[6:0] <= rf_pipe2_fwd_src1_preg[6:0];
end

//output
assign dp_prf_rf_pipe2_src0_preg[6:0] = rf_pipe2_prf_src0_preg[6:0];
assign dp_fwd_rf_pipe2_src0_preg[6:0] = rf_pipe2_fwd_src0_preg[6:0];
assign dp_prf_rf_pipe2_src1_preg[6:0] = rf_pipe2_prf_src1_preg[6:0];
assign dp_fwd_rf_pipe2_src1_preg[6:0] = rf_pipe2_fwd_src1_preg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for issue queue
assign dp_biq_rf_lch_entry[11:0]    = rf_pipe2_iq_entry[11:0];

//----------------------------------------------------------
//                    RF stage Decoder
//----------------------------------------------------------
// &Instance("ct_idu_rf_pipe2_decd", "x_ct_idu_rf_pipe2_decd"); @938
ct_idu_rf_pipe2_decd  x_ct_idu_rf_pipe2_decd (
  .pipe2_decd_func     (pipe2_decd_func    ),
  .pipe2_decd_offset   (pipe2_decd_offset  ),
  .pipe2_decd_opcode   (pipe2_decd_opcode  ),
  .pipe2_decd_src1_imm (pipe2_decd_src1_imm)
);

//decode input
assign pipe2_decd_opcode[31:0]      = rf_pipe2_data[BIQ_OPCODE:BIQ_OPCODE-31];

//----------------------------------------------------------
//                    Source Operand 0
//----------------------------------------------------------
assign rf_pipe2_src0_data[63:0]     = (rf_pipe2_data[BIQ_SRC0_WB])
                                      ? prf_dp_rf_pipe2_src0_data[63:0]
                                      : fwd_dp_rf_pipe2_src0_data[63:0];
assign rf_pipe2_src0_no_rdy         = rf_pipe2_data[BIQ_SRC0_VLD]
                                      && !rf_pipe2_data[BIQ_SRC0_WB]
                                      && fwd_dp_rf_pipe2_src0_no_fwd;

//----------------------------------------------------------
//                    Source Operand 1
//----------------------------------------------------------
// &CombBeg; @955
always @( prf_dp_rf_pipe2_src1_data[63:0]
       or pipe2_decd_src1_imm[63:0]
       or rf_pipe2_data[40]
       or rf_pipe2_data[52]
       or fwd_dp_rf_pipe2_src1_data[63:0])
begin
  if(!rf_pipe2_data[BIQ_SRC1_VLD])
    rf_pipe2_src1_data[63:0] = pipe2_decd_src1_imm[63:0];
  else if(rf_pipe2_data[BIQ_SRC1_WB])
    rf_pipe2_src1_data[63:0] = prf_dp_rf_pipe2_src1_data[63:0];
  else
    rf_pipe2_src1_data[63:0] = fwd_dp_rf_pipe2_src1_data[63:0];
// &CombEnd; @962
end

assign rf_pipe2_src1_no_rdy         = rf_pipe2_data[BIQ_SRC1_VLD]
                                      && !rf_pipe2_data[BIQ_SRC1_WB]
                                      && fwd_dp_rf_pipe2_src1_no_fwd;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe2_src_no_rdy  = rf_pipe2_src0_no_rdy
                                      || rf_pipe2_src1_no_rdy;
assign dp_biq_rf_rdy_clr[0]         = rf_pipe2_src0_no_rdy;
assign dp_biq_rf_rdy_clr[1]         = rf_pipe2_src1_no_rdy;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to iu
assign idu_iu_rf_pipe2_iid[6:0]     = rf_pipe2_data[BIQ_IID:BIQ_IID-6];
assign idu_iu_rf_pipe2_func[7:0]    = pipe2_decd_func[7:0];
assign idu_iu_rf_pipe2_src0[63:0]   = rf_pipe2_src0_data[63:0];
assign idu_iu_rf_pipe2_src1[63:0]   = rf_pipe2_src1_data[63:0];
assign idu_iu_rf_pipe2_offset[20:0] = pipe2_decd_offset[20:0];
assign idu_iu_rf_pipe2_length       = rf_pipe2_data[BIQ_LENGTH];
assign idu_iu_rf_pipe2_pid[4:0]     = rf_pipe2_data[BIQ_PID:BIQ_PID-4];
assign idu_iu_rf_pipe2_rts          = rf_pipe2_data[BIQ_RTS];
assign idu_iu_rf_pipe2_pcall        = rf_pipe2_data[BIQ_PCALL];
assign idu_iu_rf_pipe2_vlmul[1:0]   = rf_pipe2_data[BIQ_VLMUL:BIQ_VLMUL-1];
assign idu_iu_rf_pipe2_vsew[2:0]    = rf_pipe2_data[BIQ_VSEW:BIQ_VSEW-2];
assign idu_iu_rf_pipe2_vl[7:0]      = rf_pipe2_data[BIQ_VL:BIQ_VL-7];

//==========================================================
//                    Pipe3 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe3_clk_en = lsiq_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe3_gated_clk"); @1002
gated_clk_cell  x_rf_pipe3_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe3_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe3_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1003
//          .external_en (1'b0), @1004
//          .global_en   (cp0_yy_clk_en), @1005
//          .module_en   (cp0_idu_icg_en), @1006
//          .local_en    (rf_pipe3_clk_en), @1007
//          .clk_out     (rf_pipe3_clk)); @1008

assign rf_pipe03_clk_en = lsiq_xx_gateclk_issue_en
                           || aiq0_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe03_gated_clk"); @1012
gated_clk_cell  x_rf_pipe03_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe03_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe03_clk_en  ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1013
//          .external_en (1'b0), @1014
//          .global_en   (cp0_yy_clk_en), @1015
//          .module_en   (cp0_idu_icg_en), @1016
//          .local_en    (rf_pipe03_clk_en), @1017
//          .clk_out     (rf_pipe03_clk)); @1018

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe3_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe3_iq_entry[11:0]        <= 12'b0;
    rf_pipe3_data[LSIQ_WIDTH-1:0]  <= {LSIQ_WIDTH{1'b0}};
  end
  else if(lsiq_xx_pipe3_issue_en) begin
    rf_pipe3_iq_entry[11:0]        <= lsiq_dp_pipe3_issue_entry[11:0];
    rf_pipe3_data[LSIQ_WIDTH-1:0]  <=
      lsiq_dp_pipe3_issue_read_data[LSIQ_WIDTH-1:0];
  end
  else begin
    rf_pipe3_iq_entry[11:0]        <= rf_pipe3_iq_entry[11:0];
    rf_pipe3_data[LSIQ_WIDTH-1:0]  <= rf_pipe3_data[LSIQ_WIDTH-1:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
//for power and timing optimization, duplicate source preg index
//rf pipe source index will never swap because:
//1.producer launch when it is allocated with preg
//2.consumer issue after producer launch no matter replay or not
assign rf_pipe3_prf_src0_preg_updt_vld  = lsiq_xx_pipe3_issue_en;
//                                          && lsiq_dp_pipe3_issue_read_data[LSIQ_SRC0_VLD]
//                                          && lsiq_dp_pipe3_issue_read_data[LSIQ_SRC0_WB];
assign rf_pipe3_fwd_src0_preg_updt_vld  = lsiq_xx_pipe3_issue_en;
//                                          && lsiq_dp_pipe3_issue_read_data[LSIQ_SRC0_VLD]
//                                          && !lsiq_dp_pipe3_issue_read_data[LSIQ_SRC0_WB];
assign rf_pipe3_prf_src1_preg_updt_vld  = lsiq_xx_pipe3_issue_en;
//                                          && lsiq_dp_pipe3_issue_read_data[LSIQ_SRC1_VLD]
//                                          && lsiq_dp_pipe3_issue_read_data[LSIQ_SRC1_WB];
assign rf_pipe3_fwd_src1_preg_updt_vld  = lsiq_xx_pipe3_issue_en;
//                                          && lsiq_dp_pipe3_issue_read_data[LSIQ_SRC1_VLD]
//                                          && !lsiq_dp_pipe3_issue_read_data[LSIQ_SRC1_WB];
assign rf_pipe3_prf_srcvm_vreg_updt_vld = lsiq_xx_pipe3_issue_en;
//                                         && lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_VLD]
//                                         && lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_WB];
assign rf_pipe3_fwd_srcvm_vreg_updt_vld = lsiq_xx_pipe3_issue_en;
//                                         && lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_VLD]
//                                         && !lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_WB];

always @(posedge rf_pipe3_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe3_prf_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe3_prf_src0_preg_updt_vld)
    rf_pipe3_prf_src0_preg[6:0] <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRC0_PREG:LSIQ_SRC0_PREG-6];
  else
    rf_pipe3_prf_src0_preg[6:0] <= rf_pipe3_prf_src0_preg[6:0];
end

always @(posedge rf_pipe3_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe3_fwd_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe3_fwd_src0_preg_updt_vld)
    rf_pipe3_fwd_src0_preg[6:0] <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRC0_PREG:LSIQ_SRC0_PREG-6];
  else
    rf_pipe3_fwd_src0_preg[6:0] <= rf_pipe3_fwd_src0_preg[6:0];
end

always @(posedge rf_pipe03_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe3_prf_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe0_prf_src2_preg_updt_vld)
    rf_pipe3_prf_src1_preg[6:0] <= aiq0_dp_issue_read_data[AIQ0_SRC2_PREG:AIQ0_SRC2_PREG-6];
  else if(rf_pipe3_prf_src1_preg_updt_vld)
    rf_pipe3_prf_src1_preg[6:0] <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRC1_PREG:LSIQ_SRC1_PREG-6];
  else
    rf_pipe3_prf_src1_preg[6:0] <= rf_pipe3_prf_src1_preg[6:0];
end

always @(posedge rf_pipe03_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe3_fwd_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe0_fwd_src2_preg_updt_vld)
    rf_pipe3_fwd_src1_preg[6:0] <= aiq0_dp_issue_read_data[AIQ0_SRC2_PREG:AIQ0_SRC2_PREG-6];
  else if(rf_pipe3_fwd_src1_preg_updt_vld)
    rf_pipe3_fwd_src1_preg[6:0] <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRC1_PREG:LSIQ_SRC1_PREG-6];
  else
    rf_pipe3_fwd_src1_preg[6:0] <= rf_pipe3_fwd_src1_preg[6:0];
end

//output
assign dp_prf_rf_pipe3_src0_preg[6:0] = rf_pipe3_prf_src0_preg[6:0];
assign dp_fwd_rf_pipe3_src0_preg[6:0] = rf_pipe3_fwd_src0_preg[6:0];
assign dp_prf_rf_pipe3_src1_preg[6:0] = rf_pipe3_prf_src1_preg[6:0];
assign dp_fwd_rf_pipe3_src1_preg[6:0] = rf_pipe3_fwd_src1_preg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for control path
assign dp_ctrl_rf_pipe3_src1_vld        = rf_pipe3_data[LSIQ_SRC1_VLD];
assign dp_ctrl_rf_pipe3_srcvm_vld       = rf_pipe3_data[LSIQ_SRCVM_VLD];
//for issue queue
assign dp_lsiq_rf_pipe3_lch_entry[11:0] = rf_pipe3_iq_entry[11:0];

//----------------------------------------------------------
//                    RF stage Decoder
//----------------------------------------------------------
// &Instance("ct_idu_rf_pipe3_decd", "x_ct_idu_rf_pipe3_decd"); @1128
ct_idu_rf_pipe3_decd  x_ct_idu_rf_pipe3_decd (
  .pipe3_decd_atomic       (pipe3_decd_atomic      ),
  .pipe3_decd_inst_fls     (pipe3_decd_inst_fls    ),
  .pipe3_decd_inst_ldr     (pipe3_decd_inst_ldr    ),
  .pipe3_decd_inst_size    (pipe3_decd_inst_size   ),
  .pipe3_decd_inst_type    (pipe3_decd_inst_type   ),
  .pipe3_decd_lsfifo       (pipe3_decd_lsfifo      ),
  .pipe3_decd_off_0_extend (pipe3_decd_off_0_extend),
  .pipe3_decd_offset       (pipe3_decd_offset      ),
  .pipe3_decd_offset_plus  (pipe3_decd_offset_plus ),
  .pipe3_decd_opcode       (pipe3_decd_opcode      ),
  .pipe3_decd_shift        (pipe3_decd_shift       ),
  .pipe3_decd_sign_extend  (pipe3_decd_sign_extend )
);

//decode input
assign pipe3_decd_opcode[31:0]  = rf_pipe3_data[LSIQ_OPCODE:LSIQ_OPCODE-31];

//----------------------------------------------------------
//                    Source Operand
//----------------------------------------------------------
assign rf_pipe3_src0_data[63:0]      = rf_pipe3_data[LSIQ_SRC0_WB]
                                       ? prf_dp_rf_pipe3_src0_data[63:0]
                                       : fwd_dp_rf_pipe3_src0_data[63:0];
assign rf_pipe3_src1_data[63:0]      = rf_pipe3_data[LSIQ_SRC1_WB]
                                       ? prf_dp_rf_pipe3_src1_data[63:0]
                                       : fwd_dp_rf_pipe3_src1_data[63:0];
assign rf_pipe3_srcvm_vr0_data[63:0] = (rf_pipe3_data[LSIQ_SRCVM_WB])
                                       ? prf_dp_rf_pipe6_srcv2_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe3_srcvm_vreg_vr0_data[63:0];
assign rf_pipe3_srcvm_vr1_data[63:0] = (rf_pipe3_data[LSIQ_SRCVM_WB])
                                       ? prf_dp_rf_pipe6_srcv2_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe3_srcvm_vreg_vr1_data[63:0];

assign rf_pipe3_src0_no_rdy          = rf_pipe3_data[LSIQ_SRC0_VLD]
                                       && !rf_pipe3_data[LSIQ_SRC0_WB]
                                       && fwd_dp_rf_pipe3_src0_no_fwd;
assign rf_pipe3_src1_no_rdy          = rf_pipe3_data[LSIQ_SRC1_VLD]
                                       && !rf_pipe3_data[LSIQ_SRC1_WB]
                                       && fwd_dp_rf_pipe3_src1_no_fwd;
assign rf_pipe3_srcvm_no_rdy         = rf_pipe3_data[LSIQ_SRCVM_VLD]
                                       && !rf_pipe3_data[LSIQ_SRCVM_WB]
                                       && fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe3_src_no_rdy = rf_pipe3_src0_no_rdy
                                     || rf_pipe3_src1_no_rdy
                                     || rf_pipe3_srcvm_no_rdy;
assign dp_lsiq_rf_pipe3_rdy_clr[0] = rf_pipe3_src0_no_rdy
                                     && !ctrl_dp_rf_pipe3_other_lch_fail;
assign dp_lsiq_rf_pipe3_rdy_clr[1] = rf_pipe3_src1_no_rdy
                                     && !ctrl_dp_rf_pipe3_other_lch_fail;
assign dp_lsiq_rf_pipe3_rdy_clr[2] = rf_pipe3_srcvm_no_rdy
                                     && !ctrl_dp_rf_pipe3_other_lch_fail;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to lsu
assign idu_lsu_rf_pipe3_iid[6:0]          = rf_pipe3_data[LSIQ_IID:LSIQ_IID-6];
assign idu_lsu_rf_pipe3_preg[6:0]         = rf_pipe3_data[LSIQ_DST_PREG:LSIQ_DST_PREG-6];
assign idu_lsu_rf_pipe3_vreg[6:0]         = rf_pipe3_data[LSIQ_DST_VREG:LSIQ_DST_VREG-6];
assign idu_lsu_rf_pipe3_src0[63:0]        = rf_pipe3_src0_data[63:0];
assign idu_lsu_rf_pipe3_src1[63:0]        = rf_pipe3_src1_data[63:0];
assign idu_lsu_rf_pipe3_srcvm_vr0[63:0]   = rf_pipe3_srcvm_vr0_data[63:0];
assign idu_lsu_rf_pipe3_srcvm_vr1[63:0]   = rf_pipe3_srcvm_vr1_data[63:0];
assign idu_lsu_rf_pipe3_offset[11:0]      = pipe3_decd_offset[11:0];
assign idu_lsu_rf_pipe3_shift[3:0]        = pipe3_decd_shift[3:0];
assign idu_lsu_rf_pipe3_offset_plus[12:0] = pipe3_decd_offset_plus[12:0];
assign idu_lsu_rf_pipe3_pc[14:0]          = rf_pipe3_data[LSIQ_PC:LSIQ_PC-14];
assign idu_lsu_rf_pipe3_atomic            = pipe3_decd_atomic;
assign idu_lsu_rf_pipe3_sign_extend       = pipe3_decd_sign_extend;
assign idu_lsu_rf_pipe3_inst_type[1:0]    = pipe3_decd_inst_type[1:0];
assign idu_lsu_rf_pipe3_inst_size[1:0]    = pipe3_decd_inst_size[1:0];
assign idu_lsu_rf_pipe3_unalign_2nd       = rf_pipe3_data[LSIQ_UNALIGN_2ND];
assign idu_lsu_rf_pipe3_already_da        = rf_pipe3_data[LSIQ_ALREADY_DA];
assign idu_lsu_rf_pipe3_spec_fail         = rf_pipe3_data[LSIQ_SPEC_FAIL];
assign idu_lsu_rf_pipe3_bkpta_data        = rf_pipe3_data[LSIQ_BKPTA_DATA];
assign idu_lsu_rf_pipe3_bkptb_data        = rf_pipe3_data[LSIQ_BKPTB_DATA];
assign idu_lsu_rf_pipe3_lch_entry[11:0]   = rf_pipe3_iq_entry[11:0];
assign idu_lsu_rf_pipe3_oldest            = !(|rf_pipe3_data[LSIQ_AGEVEC_ALL:LSIQ_AGEVEC_ALL-10]);
assign idu_lsu_rf_pipe3_split             = rf_pipe3_data[LSIQ_SPLIT];
assign idu_lsu_rf_pipe3_inst_fls          = pipe3_decd_inst_fls;
assign idu_lsu_rf_pipe3_inst_ldr          = pipe3_decd_inst_ldr;
assign idu_lsu_rf_pipe3_off_0_extend      = pipe3_decd_off_0_extend;
assign idu_lsu_rf_pipe3_no_spec           = rf_pipe3_data[LSIQ_NO_SPEC];
assign idu_lsu_rf_pipe3_no_spec_exist     = rf_pipe3_data[LSIQ_NO_SPEC_EXIST];
assign idu_lsu_rf_pipe3_lsfifo            = pipe3_decd_lsfifo;
// &Force("nonport","idu_lsu_rf_pipe3_srcvm_vr0"); @1229
// &Force("nonport","idu_lsu_rf_pipe3_srcvm_vr1"); @1230

//==========================================================
//                    Pipe4 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe4_clk_en = lsiq_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe4_gated_clk"); @1240
gated_clk_cell  x_rf_pipe4_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe4_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe4_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1241
//          .external_en (1'b0), @1242
//          .global_en   (cp0_yy_clk_en), @1243
//          .module_en   (cp0_idu_icg_en), @1244
//          .local_en    (rf_pipe4_clk_en), @1245
//          .clk_out     (rf_pipe4_clk)); @1246

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe4_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe4_iq_entry[11:0]        <= 12'b0;
    rf_pipe4_data[LSIQ_WIDTH-1:0]  <= {LSIQ_WIDTH{1'b0}};
  end
  else if(lsiq_xx_pipe4_issue_en) begin
    rf_pipe4_iq_entry[11:0]        <= lsiq_dp_pipe4_issue_entry[11:0];
    rf_pipe4_data[LSIQ_WIDTH-1:0]  <= lsiq_dp_pipe4_issue_read_data[LSIQ_WIDTH-1:0];
  end
  else begin
    rf_pipe4_iq_entry[11:0]        <= rf_pipe4_iq_entry[11:0];
    rf_pipe4_data[LSIQ_WIDTH-1:0]  <= rf_pipe4_data[LSIQ_WIDTH-1:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
//for power and timing optimization, duplicate source preg index
//rf pipe source index will never swap because:
//1.producer launch when it is allocated with preg
//2.consumer issue after producer launch no matter replay or not
assign rf_pipe4_prf_src0_preg_updt_vld = lsiq_xx_pipe4_issue_en;
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRC0_VLD]
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRC0_WB];
assign rf_pipe4_fwd_src0_preg_updt_vld = lsiq_xx_pipe4_issue_en;
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRC0_VLD]
//                                         && !lsiq_dp_pipe4_issue_read_data[LSIQ_SRC0_WB];
assign rf_pipe4_prf_src1_preg_updt_vld = lsiq_xx_pipe4_issue_en;
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRC1_VLD];
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRC1_WB];
assign rf_pipe4_fwd_src1_preg_updt_vld = lsiq_xx_pipe4_issue_en;
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRC1_VLD];
//                                         && !lsiq_dp_pipe4_issue_read_data[LSIQ_SRC1_WB];
assign rf_pipe4_prf_srcvm_vreg_updt_vld = lsiq_xx_pipe4_issue_en;
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_VLD]
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_WB];
assign rf_pipe4_fwd_srcvm_vreg_updt_vld = lsiq_xx_pipe4_issue_en;
//                                         && lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_VLD]
//                                         && !lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_WB];

always @(posedge rf_pipe4_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe4_prf_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe4_prf_src0_preg_updt_vld)
    rf_pipe4_prf_src0_preg[6:0] <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRC0_PREG:LSIQ_SRC0_PREG-6];
  else
    rf_pipe4_prf_src0_preg[6:0] <= rf_pipe4_prf_src0_preg[6:0];
end

always @(posedge rf_pipe4_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe4_fwd_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe4_fwd_src0_preg_updt_vld)
    rf_pipe4_fwd_src0_preg[6:0] <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRC0_PREG:LSIQ_SRC0_PREG-6];
  else
    rf_pipe4_fwd_src0_preg[6:0] <= rf_pipe4_fwd_src0_preg[6:0];
end

always @(posedge rf_pipe4_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe4_prf_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe4_prf_src1_preg_updt_vld)
    rf_pipe4_prf_src1_preg[6:0] <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRC1_PREG:LSIQ_SRC1_PREG-6];
  else
    rf_pipe4_prf_src1_preg[6:0] <= rf_pipe4_prf_src1_preg[6:0];
end

always @(posedge rf_pipe4_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe4_fwd_src1_preg[6:0] <= 7'b0;
  else if(rf_pipe4_fwd_src1_preg_updt_vld)
    rf_pipe4_fwd_src1_preg[6:0] <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRC1_PREG:LSIQ_SRC1_PREG-6];
  else
    rf_pipe4_fwd_src1_preg[6:0] <= rf_pipe4_fwd_src1_preg[6:0];
end

//output
assign dp_prf_rf_pipe4_src0_preg[6:0] = rf_pipe4_prf_src0_preg[6:0];
assign dp_fwd_rf_pipe4_src0_preg[6:0] = rf_pipe4_fwd_src0_preg[6:0];
assign dp_prf_rf_pipe4_src1_preg[6:0] = rf_pipe4_prf_src1_preg[6:0];
assign dp_fwd_rf_pipe4_src1_preg[6:0] = rf_pipe4_fwd_src1_preg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for issue queue
assign dp_lsiq_rf_pipe4_lch_entry[11:0] = rf_pipe4_iq_entry[11:0];
//for LSIQ
assign dp_sdiq_rf_sdiq_entry[11:0]      = rf_pipe4_data[LSIQ_SDIQ_ENTRY:LSIQ_SDIQ_ENTRY-11];
assign dp_sdiq_rf_staddr1_vld           = rf_pipe4_data[LSIQ_UNALIGN_2ND];
//for control path
assign dp_ctrl_rf_pipe4_staddr          = rf_pipe4_data[LSIQ_STADDR];
assign dp_ctrl_rf_pipe4_srcvm_vld       = rf_pipe4_data[LSIQ_SRCVM_VLD];

//----------------------------------------------------------
//                    RF stage Decoder
//----------------------------------------------------------
// &Instance("ct_idu_rf_pipe4_decd", "x_ct_idu_rf_pipe4_decd"); @1354
ct_idu_rf_pipe4_decd  x_ct_idu_rf_pipe4_decd (
  .cp0_lsu_fencei_broad_dis  (cp0_lsu_fencei_broad_dis ),
  .cp0_lsu_fencerw_broad_dis (cp0_lsu_fencerw_broad_dis),
  .cp0_lsu_tlb_broad_dis     (cp0_lsu_tlb_broad_dis    ),
  .pipe4_decd_atomic         (pipe4_decd_atomic        ),
  .pipe4_decd_dst_preg       (pipe4_decd_dst_preg      ),
  .pipe4_decd_fence_mode     (pipe4_decd_fence_mode    ),
  .pipe4_decd_icc            (pipe4_decd_icc           ),
  .pipe4_decd_inst_fls       (pipe4_decd_inst_fls      ),
  .pipe4_decd_inst_flush     (pipe4_decd_inst_flush    ),
  .pipe4_decd_inst_mode      (pipe4_decd_inst_mode     ),
  .pipe4_decd_inst_share     (pipe4_decd_inst_share    ),
  .pipe4_decd_inst_size      (pipe4_decd_inst_size     ),
  .pipe4_decd_inst_str       (pipe4_decd_inst_str      ),
  .pipe4_decd_inst_type      (pipe4_decd_inst_type     ),
  .pipe4_decd_lsfifo         (pipe4_decd_lsfifo        ),
  .pipe4_decd_mmu_req        (pipe4_decd_mmu_req       ),
  .pipe4_decd_off_0_extend   (pipe4_decd_off_0_extend  ),
  .pipe4_decd_offset         (pipe4_decd_offset        ),
  .pipe4_decd_offset_plus    (pipe4_decd_offset_plus   ),
  .pipe4_decd_opcode         (pipe4_decd_opcode        ),
  .pipe4_decd_shift          (pipe4_decd_shift         ),
  .pipe4_decd_st             (pipe4_decd_st            ),
  .pipe4_decd_sync_fence     (pipe4_decd_sync_fence    )
);

//decode input
assign pipe4_decd_opcode[31:0]          = rf_pipe4_data[LSIQ_OPCODE:LSIQ_OPCODE-31];
assign pipe4_decd_dst_preg[6:0]         = rf_pipe4_data[LSIQ_DST_PREG:LSIQ_DST_PREG-6];

//----------------------------------------------------------
//                    Source Operand
//----------------------------------------------------------
assign rf_pipe4_src0_data[63:0]      = (rf_pipe4_data[LSIQ_SRC0_WB])
                                       ? prf_dp_rf_pipe4_src0_data[63:0]
                                       : fwd_dp_rf_pipe4_src0_data[63:0];
assign rf_pipe4_src1_data[63:0]      = (rf_pipe4_data[LSIQ_SRC1_WB])
                                       ? prf_dp_rf_pipe4_src1_data[63:0]
                                       : fwd_dp_rf_pipe4_src1_data[63:0];
assign rf_pipe4_srcvm_vr0_data[63:0] = (rf_pipe4_data[LSIQ_SRCVM_WB])
                                       ? prf_dp_rf_pipe7_srcv2_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe4_srcvm_vreg_vr0_data[63:0];
assign rf_pipe4_srcvm_vr1_data[63:0] = (rf_pipe4_data[LSIQ_SRCVM_WB])
                                       ? prf_dp_rf_pipe7_srcv2_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe4_srcvm_vreg_vr1_data[63:0];

assign rf_pipe4_src0_no_rdy          = rf_pipe4_data[LSIQ_SRC0_VLD]
                                       && !rf_pipe4_data[LSIQ_SRC0_WB]
                                       && fwd_dp_rf_pipe4_src0_no_fwd;
assign rf_pipe4_src1_no_rdy          = rf_pipe4_data[LSIQ_SRC1_VLD]
                                       && !rf_pipe4_data[LSIQ_SRC1_WB]
                                       && fwd_dp_rf_pipe4_src1_no_fwd;
assign rf_pipe4_srcvm_no_rdy         = rf_pipe4_data[LSIQ_SRCVM_VLD]
                                       && !rf_pipe4_data[LSIQ_SRCVM_WB]
                                       && fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe4_src_no_rdy      = rf_pipe4_src0_no_rdy
                                          || rf_pipe4_src1_no_rdy
                                          || rf_pipe4_srcvm_no_rdy;
assign dp_lsiq_rf_pipe4_rdy_clr[0]      = rf_pipe4_src0_no_rdy
                                          && !ctrl_dp_rf_pipe4_other_lch_fail;
assign dp_lsiq_rf_pipe4_rdy_clr[1]      = rf_pipe4_src1_no_rdy
                                          && !ctrl_dp_rf_pipe4_other_lch_fail;
assign dp_lsiq_rf_pipe4_rdy_clr[2]      = rf_pipe4_srcvm_no_rdy
                                          && !ctrl_dp_rf_pipe4_other_lch_fail;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to lsu
assign idu_lsu_rf_pipe4_inst_code[31:0]      = rf_pipe4_data[LSIQ_OPCODE:LSIQ_OPCODE-31];
assign idu_lsu_rf_pipe4_iid[6:0]             = rf_pipe4_data[LSIQ_IID:LSIQ_IID-6];
assign idu_lsu_rf_pipe4_src0[63:0]           = rf_pipe4_src0_data[63:0];
assign idu_lsu_rf_pipe4_src1[63:0]           = rf_pipe4_src1_data[63:0];
assign idu_lsu_rf_pipe4_srcvm_vr0[63:0]      = rf_pipe4_srcvm_vr0_data[63:0];
assign idu_lsu_rf_pipe4_srcvm_vr1[63:0]      = rf_pipe4_srcvm_vr1_data[63:0];
assign idu_lsu_rf_pipe4_atomic               = pipe4_decd_atomic;
assign idu_lsu_rf_pipe4_sync_fence           = pipe4_decd_sync_fence;
assign idu_lsu_rf_pipe4_icc                  = pipe4_decd_icc;
assign idu_lsu_rf_pipe4_st                   = pipe4_decd_st;
assign idu_lsu_rf_pipe4_mmu_req              = pipe4_decd_mmu_req;
assign idu_lsu_rf_pipe4_inst_share           = pipe4_decd_inst_share;
assign idu_lsu_rf_pipe4_inst_flush           = pipe4_decd_inst_flush;
assign idu_lsu_rf_pipe4_inst_type[1:0]       = pipe4_decd_inst_type[1:0];
assign idu_lsu_rf_pipe4_inst_size[1:0]       = pipe4_decd_inst_size[1:0];
assign idu_lsu_rf_pipe4_inst_mode[1:0]       = pipe4_decd_inst_mode[1:0];
assign idu_lsu_rf_pipe4_fence_mode[3:0]      = pipe4_decd_fence_mode[3:0];
assign idu_lsu_rf_pipe4_sdiq_entry[11:0]     = rf_pipe4_data[LSIQ_SDIQ_ENTRY:LSIQ_SDIQ_ENTRY-11];
assign idu_lsu_rf_pipe4_unalign_2nd          = rf_pipe4_data[LSIQ_UNALIGN_2ND];
assign idu_lsu_rf_pipe4_already_da           = rf_pipe4_data[LSIQ_ALREADY_DA];
assign idu_lsu_rf_pipe4_spec_fail            = rf_pipe4_data[LSIQ_SPEC_FAIL];
assign idu_lsu_rf_pipe4_bkpta_data           = rf_pipe4_data[LSIQ_BKPTA_DATA];
assign idu_lsu_rf_pipe4_bkptb_data           = rf_pipe4_data[LSIQ_BKPTB_DATA];
assign idu_lsu_rf_pipe4_lch_entry[11:0]      = rf_pipe4_iq_entry[11:0];
assign idu_lsu_rf_pipe4_oldest               = !(|rf_pipe4_data[LSIQ_AGEVEC_ALL:LSIQ_AGEVEC_ALL-10]);
assign idu_lsu_rf_pipe4_split                = rf_pipe4_data[LSIQ_SPLIT];
assign idu_lsu_rf_pipe4_offset[11:0]         = pipe4_decd_offset[11:0];
assign idu_lsu_rf_pipe4_offset_plus[12:0]    = pipe4_decd_offset_plus[12:0];
assign idu_lsu_rf_pipe4_inst_fls             = pipe4_decd_inst_fls;
assign idu_lsu_rf_pipe4_shift[3:0]           = pipe4_decd_shift[3:0];
assign idu_lsu_rf_pipe4_inst_str             = pipe4_decd_inst_str;
assign idu_lsu_rf_pipe4_off_0_extend         = pipe4_decd_off_0_extend;
assign idu_lsu_rf_pipe4_no_spec              = rf_pipe4_data[LSIQ_NO_SPEC];
assign idu_lsu_rf_pipe4_staddr               = rf_pipe4_data[LSIQ_STADDR];
assign idu_lsu_rf_pipe4_pc[14:0]             = rf_pipe4_data[LSIQ_PC:LSIQ_PC-14];
assign idu_lsu_rf_pipe4_lsfifo               = pipe4_decd_lsfifo;
// &Force("nonport","idu_lsu_rf_pipe4_srcvm_vr0"); @1460
// &Force("nonport","idu_lsu_rf_pipe4_srcvm_vr1"); @1461

//==========================================================
//                    Pipe5 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe5_clk_en = sdiq_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe5_gated_clk"); @1471
gated_clk_cell  x_rf_pipe5_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe5_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe5_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1472
//          .external_en (1'b0), @1473
//          .global_en   (cp0_yy_clk_en), @1474
//          .module_en   (cp0_idu_icg_en), @1475
//          .local_en    (rf_pipe5_clk_en), @1476
//          .clk_out     (rf_pipe5_clk)); @1477

assign rf_pipe15_clk_en = sdiq_xx_gateclk_issue_en
                          || aiq1_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe15_gated_clk"); @1481
gated_clk_cell  x_rf_pipe15_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe15_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe15_clk_en  ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1482
//          .external_en (1'b0), @1483
//          .global_en   (cp0_yy_clk_en), @1484
//          .module_en   (cp0_idu_icg_en), @1485
//          .local_en    (rf_pipe15_clk_en), @1486
//          .clk_out     (rf_pipe15_clk)); @1487

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe5_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe5_iq_entry[11:0]        <= 12'b0;
    rf_pipe5_data[SDIQ_WIDTH-1:0]  <= {SDIQ_WIDTH{1'b0}};
  end
  else if(sdiq_xx_issue_en) begin
    rf_pipe5_iq_entry[11:0]        <= sdiq_dp_issue_entry[11:0];
    rf_pipe5_data[SDIQ_WIDTH-1:0]  <= sdiq_dp_issue_read_data[SDIQ_WIDTH-1:0];
  end
  else begin
    rf_pipe5_iq_entry[11:0]        <= rf_pipe5_iq_entry[11:0];
    rf_pipe5_data[SDIQ_WIDTH-1:0]  <= rf_pipe5_data[SDIQ_WIDTH-1:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
//for power and timing optimization, duplicate source preg index
//rf pipe source index will never swap because:
//1.producer launch when it is allocated with preg
//2.consumer issue after producer launch no matter replay or not
assign rf_pipe5_prf_src0_preg_updt_vld  = sdiq_xx_issue_en;
//                                          && sdiq_dp_issue_read_data[SDIQ_SRC0_VLD]
//                                          && sdiq_dp_issue_read_data[SDIQ_SRC0_WB];
assign rf_pipe5_fwd_src0_preg_updt_vld  = sdiq_xx_issue_en;
//                                          && sdiq_dp_issue_read_data[SDIQ_SRC0_VLD]
//                                          && !sdiq_dp_issue_read_data[SDIQ_SRC0_WB];
assign rf_pipe5_prf_srcv0_vreg_updt_vld = sdiq_xx_issue_en;
//                                          && sdiq_dp_issue_read_data[SDIQ_SRCV0_VLD]
//                                          && sdiq_dp_issue_read_data[SDIQ_SRCV0_WB];
assign rf_pipe5_fwd_srcv0_vreg_updt_vld = sdiq_xx_issue_en;
//                                          && sdiq_dp_issue_read_data[SDIQ_SRCV0_VLD]
//                                          && !sdiq_dp_issue_read_data[SDIQ_SRCV0_WB];

//when flush fe and is, rf pipe5 inst will not be flushed
//so pipe1 should not borrow pipe5 read port when flush fe and is
always @(posedge rf_pipe15_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe5_prf_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe1_prf_src2_preg_updt_vld
          && !(rtu_idu_flush_fe || rtu_idu_flush_is))
    rf_pipe5_prf_src0_preg[6:0] <= aiq1_dp_issue_read_data[AIQ1_SRC2_PREG:AIQ1_SRC2_PREG-6];
  else if(rf_pipe5_prf_src0_preg_updt_vld)
    rf_pipe5_prf_src0_preg[6:0] <= sdiq_dp_issue_read_data[SDIQ_SRC0_PREG:SDIQ_SRC0_PREG-6];
  else
    rf_pipe5_prf_src0_preg[6:0] <= rf_pipe5_prf_src0_preg[6:0];
end

always @(posedge rf_pipe15_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe5_fwd_src0_preg[6:0] <= 7'b0;
  else if(rf_pipe1_fwd_src2_preg_updt_vld
          && !(rtu_idu_flush_fe || rtu_idu_flush_is))
    rf_pipe5_fwd_src0_preg[6:0] <= aiq1_dp_issue_read_data[AIQ1_SRC2_PREG:AIQ1_SRC2_PREG-6];
  else if(rf_pipe5_fwd_src0_preg_updt_vld)
    rf_pipe5_fwd_src0_preg[6:0] <= sdiq_dp_issue_read_data[SDIQ_SRC0_PREG:SDIQ_SRC0_PREG-6];
  else
    rf_pipe5_fwd_src0_preg[6:0] <= rf_pipe5_fwd_src0_preg[6:0];
end

always @(posedge rf_pipe5_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe5_prf_srcv0_vreg_fr[5:0]  <= 6'b0;
    rf_pipe5_prf_srcv0_vreg_vr0[5:0] <= 6'b0;
    rf_pipe5_prf_srcv0_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe5_prf_srcv0_vreg_updt_vld) begin
    rf_pipe5_prf_srcv0_vreg_fr[5:0]  <= sdiq_dp_issue_read_data[SDIQ_SRCV0_VREG-1:SDIQ_SRCV0_VREG-6];
    rf_pipe5_prf_srcv0_vreg_vr0[5:0] <= sdiq_dp_issue_read_data[SDIQ_SRCV0_VREG-1:SDIQ_SRCV0_VREG-6];
    rf_pipe5_prf_srcv0_vreg_vr1[5:0] <= sdiq_dp_issue_read_data[SDIQ_SRCV0_VREG-1:SDIQ_SRCV0_VREG-6];
  end
  else begin
    rf_pipe5_prf_srcv0_vreg_fr[5:0]  <= rf_pipe5_prf_srcv0_vreg_fr[5:0];
    rf_pipe5_prf_srcv0_vreg_vr0[5:0] <= rf_pipe5_prf_srcv0_vreg_vr0[5:0];
    rf_pipe5_prf_srcv0_vreg_vr1[5:0] <= rf_pipe5_prf_srcv0_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe5_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe5_fwd_srcv0_vreg[6:0] <= 7'b0;
  else if(rf_pipe5_fwd_srcv0_vreg_updt_vld)
    rf_pipe5_fwd_srcv0_vreg[6:0] <= sdiq_dp_issue_read_data[SDIQ_SRCV0_VREG:SDIQ_SRCV0_VREG-6];
  else
    rf_pipe5_fwd_srcv0_vreg[6:0] <= rf_pipe5_fwd_srcv0_vreg[6:0];
end

//output
assign dp_prf_rf_pipe5_src0_preg[6:0]      = rf_pipe5_prf_src0_preg[6:0];
assign dp_prf_rf_pipe5_srcv0_vreg_fr[5:0]  = rf_pipe5_prf_srcv0_vreg_fr[5:0];
assign dp_prf_rf_pipe5_srcv0_vreg_vr0[5:0] = rf_pipe5_prf_srcv0_vreg_vr0[5:0];
assign dp_prf_rf_pipe5_srcv0_vreg_vr1[5:0] = rf_pipe5_prf_srcv0_vreg_vr1[5:0];

assign dp_fwd_rf_pipe5_src0_preg[6:0]     = rf_pipe5_fwd_src0_preg[6:0];
assign dp_fwd_rf_pipe5_srcv0_vreg[6:0]    = rf_pipe5_fwd_srcv0_vreg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for issue queue
// &Force("output","dp_sdiq_rf_lch_entry"); @1598
assign dp_sdiq_rf_lch_entry[11:0]    = rf_pipe5_iq_entry[11:0];
assign dp_sdiq_rf_stdata1_vld        = rf_pipe5_data[SDIQ_STDATA1_VLD];
//for control path
assign dp_ctrl_rf_pipe5_src0_vld     = rf_pipe5_data[SDIQ_SRC0_VLD];

//----------------------------------------------------------
//                    Source Operand 0
//----------------------------------------------------------
assign rf_pipe5_src0_data[63:0]      = (rf_pipe5_data[SDIQ_SRC0_WB])
                                       ? prf_dp_rf_pipe5_src0_data[63:0]
                                       : fwd_dp_rf_pipe5_src0_data[63:0];
assign rf_pipe5_srcv0_fr_data[63:0]  = (rf_pipe5_data[SDIQ_SRCV0_WB])
                                       ? prf_dp_rf_pipe5_srcv0_vreg_fr_data[63:0]
                                       : fwd_dp_rf_pipe5_srcv0_vreg_fr_data[63:0];
assign rf_pipe5_srcv0_vr0_data[63:0] = (rf_pipe5_data[SDIQ_SRCV0_WB])
                                       ? prf_dp_rf_pipe5_srcv0_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe5_srcv0_vreg_vr0_data[63:0];
assign rf_pipe5_srcv0_vr1_data[63:0] = (rf_pipe5_data[SDIQ_SRCV0_WB])
                                       ? prf_dp_rf_pipe5_srcv0_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe5_srcv0_vreg_vr1_data[63:0];

assign rf_pipe5_src0_no_rdy          = rf_pipe5_data[SDIQ_SRC0_VLD]
                                       && !rf_pipe5_data[SDIQ_SRC0_WB]
                                       && fwd_dp_rf_pipe5_src0_no_fwd_expt_mla;
assign rf_pipe5_srcv0_no_rdy         = rf_pipe5_data[SDIQ_SRCV0_VLD]
                                       && !rf_pipe5_data[SDIQ_SRCV0_WB]
                                       && fwd_dp_rf_pipe5_srcv0_no_fwd;

//----------------------------------------------------------
//                 Staddr Not Ready Signal
//----------------------------------------------------------
//staddr inst already in store queue
assign rf_pipe5_staddr_in_stq        = !rf_pipe5_data[SDIQ_STDATA1_VLD]
                                          && rf_pipe5_data[SDIQ_STADDR0_IN_STQ]
                                       || rf_pipe5_data[SDIQ_STDATA1_VLD]
                                          && rf_pipe5_data[SDIQ_STADDR1_IN_STQ];
//staddr inst is writing into store queue
assign rf_pipe5_staddr_create_stq    = lsu_idu_dc_staddr_vld
                                       && (lsu_idu_dc_sdiq_entry[11:0]
                                           == dp_sdiq_rf_lch_entry[11:0])
                                       && (lsu_idu_dc_staddr1_vld
                                           == rf_pipe5_data[SDIQ_STDATA1_VLD]);
//staddr not ready if not in store queue
assign rf_pipe5_staddr_no_rdy        = !(rf_pipe5_data[SDIQ_LOAD]
                                      || rf_pipe5_staddr_in_stq
                                      || rf_pipe5_staddr_create_stq);

assign dp_sdiq_rf_staddr_rdy_clr     = rf_pipe5_staddr_no_rdy;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe5_src_no_rdy = rf_pipe5_src0_no_rdy
                                     || rf_pipe5_srcv0_no_rdy
                                     || rf_pipe5_staddr_no_rdy;
assign dp_sdiq_rf_rdy_clr[0]       = rf_pipe5_src0_no_rdy
                                     && !ctrl_dp_rf_pipe5_other_lch_fail;
assign dp_sdiq_rf_rdy_clr[1]       = rf_pipe5_srcv0_no_rdy
                                     && !ctrl_dp_rf_pipe5_other_lch_fail;

//----------------------------------------------------------
//                 Unalign Stdata Signal
//----------------------------------------------------------
//unalign stdata when lsu signal unalign or already unalign
assign rf_pipe5_unalign_with_lsu_dc = rf_pipe5_data[SDIQ_UNALIGN]
                                      || rf_pipe5_staddr_create_stq
                                         && lsu_idu_dc_staddr_unalign;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to lsu
assign idu_lsu_rf_pipe5_sdiq_entry[11:0] = rf_pipe5_iq_entry[11:0];
assign idu_lsu_rf_pipe5_stdata1_vld      = rf_pipe5_data[SDIQ_STDATA1_VLD];
assign idu_lsu_rf_pipe5_unalign          = rf_pipe5_unalign_with_lsu_dc;
assign idu_lsu_rf_pipe5_src0[63:0]       = rf_pipe5_src0_data[63:0];
assign idu_lsu_rf_pipe5_srcv0_fr[63:0]   = rf_pipe5_srcv0_fr_data[63:0];
assign idu_lsu_rf_pipe5_srcv0_vr0[63:0]  = rf_pipe5_srcv0_vr0_data[63:0];
assign idu_lsu_rf_pipe5_srcv0_vr1[63:0]  = rf_pipe5_srcv0_vr1_data[63:0];
assign idu_lsu_rf_pipe5_srcv0_vld        = rf_pipe5_data[SDIQ_SRCV0_VLD];
assign idu_lsu_rf_pipe5_srcv0_fr_vld     = !rf_pipe5_data[SDIQ_SRCV0_VREG];

//==========================================================
//                    Pipe6 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe6_clk_en = viq0_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe6_gated_clk"); @1690
gated_clk_cell  x_rf_pipe6_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe6_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe6_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1691
//          .external_en (1'b0), @1692
//          .global_en   (cp0_yy_clk_en), @1693
//          .module_en   (cp0_idu_icg_en), @1694
//          .local_en    (rf_pipe6_clk_en), @1695
//          .clk_out     (rf_pipe6_clk)); @1696

assign rf_pipe36_clk_en = lsiq_xx_gateclk_issue_en
                           || viq0_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe36_gated_clk"); @1700
gated_clk_cell  x_rf_pipe36_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe36_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe36_clk_en  ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1701
//          .external_en (1'b0), @1702
//          .global_en   (cp0_yy_clk_en), @1703
//          .module_en   (cp0_idu_icg_en), @1704
//          .local_en    (rf_pipe36_clk_en), @1705
//          .clk_out     (rf_pipe36_clk)); @1706

//----------------------------------------------------------
//                  Rename Pipedown Data
//----------------------------------------------------------
assign dp_ctrl_is_viq0_issue_dstv_vld      = viq0_dp_issue_read_data[VIQ0_DSTV_VLD];
assign dp_ctrl_is_viq0_issue_vdiv          = viq0_dp_issue_read_data[VIQ0_VDIV];
assign dp_ctrl_is_viq0_issue_vmla_short    = viq0_dp_issue_read_data[VIQ0_VMLA_SHORT];
assign dp_ctrl_is_viq0_issue_vmla_rf       = viq0_dp_issue_read_data[VIQ0_VMLA_TYPE];
assign dp_ctrl_is_viq0_issue_lch_rdy[15:0] = viq0_dp_issue_read_data[VIQ0_LCH_RDY_VIQ1:VIQ0_LCH_RDY_VIQ0-7];

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe6_iq_entry[7:0]        <= 8'b0;
    rf_pipe6_data[VIQ0_WIDTH-1:0] <= {VIQ0_WIDTH{1'b0}};
    rf_pipe6_dst_vreg_dup0[6:0]   <= 7'b0;
    rf_pipe6_dst_vreg_dup1[6:0]   <= 7'b0;
    rf_pipe6_dst_vreg_dup2[6:0]   <= 7'b0;
    rf_pipe6_dst_vreg_dup3[6:0]   <= 7'b0;
  end
  else if(viq0_xx_issue_en) begin
    rf_pipe6_iq_entry[7:0]        <= viq0_dp_issue_entry[7:0];
    rf_pipe6_data[VIQ0_WIDTH-1:0] <= viq0_dp_issue_read_data[VIQ0_WIDTH-1:0];
    rf_pipe6_dst_vreg_dup0[6:0]   <= viq0_dp_issue_read_data[VIQ0_DST_VREG:VIQ0_DST_VREG-6];
    rf_pipe6_dst_vreg_dup1[6:0]   <= viq0_dp_issue_read_data[VIQ0_DST_VREG:VIQ0_DST_VREG-6];
    rf_pipe6_dst_vreg_dup2[6:0]   <= viq0_dp_issue_read_data[VIQ0_DST_VREG:VIQ0_DST_VREG-6];
    rf_pipe6_dst_vreg_dup3[6:0]   <= viq0_dp_issue_read_data[VIQ0_DST_VREG:VIQ0_DST_VREG-6];
  end
  else begin
    rf_pipe6_iq_entry[7:0]        <= rf_pipe6_iq_entry[7:0];
    rf_pipe6_data[VIQ0_WIDTH-1:0] <= rf_pipe6_data[VIQ0_WIDTH-1:0];
    rf_pipe6_dst_vreg_dup0[6:0]   <= rf_pipe6_dst_vreg_dup0[6:0];
    rf_pipe6_dst_vreg_dup1[6:0]   <= rf_pipe6_dst_vreg_dup1[6:0];
    rf_pipe6_dst_vreg_dup2[6:0]   <= rf_pipe6_dst_vreg_dup2[6:0];
    rf_pipe6_dst_vreg_dup3[6:0]   <= rf_pipe6_dst_vreg_dup3[6:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
//for power and timing optimization, duplicate source vreg index
//rf pipe source index will never swap because:
//1.producer launch when it is allocated with vreg
//2.consumer issue after producer launch no matter replay or not
assign rf_pipe6_prf_srcv0_vreg_updt_vld = viq0_xx_issue_en;
//                                         && viq0_dp_issue_read_data[VIQ0_SRCV0_VLD]
//                                         && viq0_dp_issue_read_data[VIQ0_SRCV0_WB];
assign rf_pipe6_fwd_srcv0_vreg_updt_vld = viq0_xx_issue_en;
//                                         && viq0_dp_issue_read_data[VIQ0_SRCV0_VLD]
//                                         && !viq0_dp_issue_read_data[VIQ0_SRCV0_WB];
assign rf_pipe6_prf_srcv1_vreg_updt_vld = viq0_xx_issue_en;
//                                         && viq0_dp_issue_read_data[VIQ0_SRCV1_VLD]
//                                         && viq0_dp_issue_read_data[VIQ0_SRCV1_WB];
assign rf_pipe6_fwd_srcv1_vreg_updt_vld = viq0_xx_issue_en;
//                                         && viq0_dp_issue_read_data[VIQ0_SRCV1_VLD]
//                                         && !viq0_dp_issue_read_data[VIQ0_SRCV1_WB];
assign rf_pipe6_prf_srcv2_vreg_updt_vld = viq0_xx_issue_en
                                         && viq0_dp_issue_read_data[VIQ0_SRCV2_VLD];
//                                         && viq0_dp_issue_read_data[VIQ0_SRCV2_WB];
assign rf_pipe6_fwd_srcv2_vreg_updt_vld = viq0_xx_issue_en
                                         && viq0_dp_issue_read_data[VIQ0_SRCV2_VLD];
//                                         && !viq0_dp_issue_read_data[VIQ0_SRCV2_WB];
assign rf_pipe6_prf_srcvm_vreg_updt_vld = viq0_xx_issue_en;
//                                         && viq0_dp_issue_read_data[VIQ0_SRCVM_VLD]
//                                         && viq0_dp_issue_read_data[VIQ0_SRCVM_WB];
assign rf_pipe6_fwd_srcvm_vreg_updt_vld = viq0_xx_issue_en;
//                                         && viq0_dp_issue_read_data[VIQ0_SRCVM_VLD]
//                                         && !viq0_dp_issue_read_data[VIQ0_SRCVM_WB];

always @(posedge rf_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe6_prf_srcv0_vreg_fr[5:0]  <= 6'b0;
    rf_pipe6_prf_srcv0_vreg_vr0[5:0] <= 6'b0;
    rf_pipe6_prf_srcv0_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe6_prf_srcv0_vreg_updt_vld) begin
    rf_pipe6_prf_srcv0_vreg_fr[5:0]  <= viq0_dp_issue_read_data[VIQ0_SRCV0_VREG-1:VIQ0_SRCV0_VREG-6];
    rf_pipe6_prf_srcv0_vreg_vr0[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCV0_VREG-1:VIQ0_SRCV0_VREG-6];
    rf_pipe6_prf_srcv0_vreg_vr1[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCV0_VREG-1:VIQ0_SRCV0_VREG-6];
  end
  else begin
    rf_pipe6_prf_srcv0_vreg_fr[5:0]  <= rf_pipe6_prf_srcv0_vreg_fr[5:0];
    rf_pipe6_prf_srcv0_vreg_vr0[5:0] <= rf_pipe6_prf_srcv0_vreg_vr0[5:0];
    rf_pipe6_prf_srcv0_vreg_vr1[5:0] <= rf_pipe6_prf_srcv0_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe6_prf_srcv1_vreg_fr[5:0]  <= 6'b0;
    rf_pipe6_prf_srcv1_vreg_vr0[5:0] <= 6'b0;
    rf_pipe6_prf_srcv1_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe6_prf_srcv1_vreg_updt_vld) begin
    rf_pipe6_prf_srcv1_vreg_fr[5:0]  <= viq0_dp_issue_read_data[VIQ0_SRCV1_VREG-1:VIQ0_SRCV1_VREG-6];
    rf_pipe6_prf_srcv1_vreg_vr0[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCV1_VREG-1:VIQ0_SRCV1_VREG-6];
    rf_pipe6_prf_srcv1_vreg_vr1[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCV1_VREG-1:VIQ0_SRCV1_VREG-6];
  end
  else begin
    rf_pipe6_prf_srcv1_vreg_fr[5:0]  <= rf_pipe6_prf_srcv1_vreg_fr[5:0];
    rf_pipe6_prf_srcv1_vreg_vr0[5:0] <= rf_pipe6_prf_srcv1_vreg_vr0[5:0];
    rf_pipe6_prf_srcv1_vreg_vr1[5:0] <= rf_pipe6_prf_srcv1_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe36_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe6_prf_srcv2_vreg_fr[5:0]  <= 6'b0;
    rf_pipe6_prf_srcv2_vreg_vr0[5:0] <= 6'b0;
    rf_pipe6_prf_srcv2_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe6_prf_srcv2_vreg_updt_vld) begin
    rf_pipe6_prf_srcv2_vreg_fr[5:0]  <= viq0_dp_issue_read_data[VIQ0_SRCV2_VREG-1:VIQ0_SRCV2_VREG-6];
    rf_pipe6_prf_srcv2_vreg_vr0[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCV2_VREG-1:VIQ0_SRCV2_VREG-6];
    rf_pipe6_prf_srcv2_vreg_vr1[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCV2_VREG-1:VIQ0_SRCV2_VREG-6];
  end
  else if(rf_pipe3_prf_srcvm_vreg_updt_vld) begin
    rf_pipe6_prf_srcv2_vreg_fr[5:0]  <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_VREG-1:LSIQ_SRCVM_VREG-6];
    rf_pipe6_prf_srcv2_vreg_vr0[5:0] <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_VREG-1:LSIQ_SRCVM_VREG-6];
    rf_pipe6_prf_srcv2_vreg_vr1[5:0] <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_VREG-1:LSIQ_SRCVM_VREG-6];
  end
  else begin
    rf_pipe6_prf_srcv2_vreg_fr[5:0]  <= rf_pipe6_prf_srcv2_vreg_fr[5:0];
    rf_pipe6_prf_srcv2_vreg_vr0[5:0] <= rf_pipe6_prf_srcv2_vreg_vr0[5:0];
    rf_pipe6_prf_srcv2_vreg_vr1[5:0] <= rf_pipe6_prf_srcv2_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe6_prf_srcvm_vreg_vr0[5:0] <= 6'b0;
    rf_pipe6_prf_srcvm_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe6_prf_srcvm_vreg_updt_vld) begin
    rf_pipe6_prf_srcvm_vreg_vr0[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCVM_VREG-1:VIQ0_SRCVM_VREG-6];
    rf_pipe6_prf_srcvm_vreg_vr1[5:0] <= viq0_dp_issue_read_data[VIQ0_SRCVM_VREG-1:VIQ0_SRCVM_VREG-6];
  end
  else begin
    rf_pipe6_prf_srcvm_vreg_vr0[5:0] <= rf_pipe6_prf_srcvm_vreg_vr0[5:0];
    rf_pipe6_prf_srcvm_vreg_vr1[5:0] <= rf_pipe6_prf_srcvm_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe6_fwd_srcv0_vreg[6:0] <= 7'b0;
  else if(rf_pipe6_fwd_srcv0_vreg_updt_vld)
    rf_pipe6_fwd_srcv0_vreg[6:0] <= viq0_dp_issue_read_data[VIQ0_SRCV0_VREG:VIQ0_SRCV0_VREG-6];
  else
    rf_pipe6_fwd_srcv0_vreg[6:0] <= rf_pipe6_fwd_srcv0_vreg[6:0];
end

always @(posedge rf_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe6_fwd_srcv1_vreg[6:0] <= 7'b0;
  else if(rf_pipe6_fwd_srcv1_vreg_updt_vld)
    rf_pipe6_fwd_srcv1_vreg[6:0] <= viq0_dp_issue_read_data[VIQ0_SRCV1_VREG:VIQ0_SRCV1_VREG-6];
  else
    rf_pipe6_fwd_srcv1_vreg[6:0] <= rf_pipe6_fwd_srcv1_vreg[6:0];
end

always @(posedge rf_pipe36_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe6_fwd_srcv2_vreg[6:0] <= 7'b0;
  else if(rf_pipe6_fwd_srcv2_vreg_updt_vld)
    rf_pipe6_fwd_srcv2_vreg[6:0] <= viq0_dp_issue_read_data[VIQ0_SRCV2_VREG:VIQ0_SRCV2_VREG-6];
  else if(rf_pipe3_fwd_srcvm_vreg_updt_vld)
    rf_pipe6_fwd_srcv2_vreg[6:0] <= lsiq_dp_pipe3_issue_read_data[LSIQ_SRCVM_VREG:LSIQ_SRCVM_VREG-6];
  else
    rf_pipe6_fwd_srcv2_vreg[6:0] <= rf_pipe6_fwd_srcv2_vreg[6:0];
end

always @(posedge rf_pipe6_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe6_fwd_srcvm_vreg[6:0] <= 7'b0;
  else if(rf_pipe6_fwd_srcvm_vreg_updt_vld)
    rf_pipe6_fwd_srcvm_vreg[6:0] <= viq0_dp_issue_read_data[VIQ0_SRCVM_VREG:VIQ0_SRCVM_VREG-6];
  else
    rf_pipe6_fwd_srcvm_vreg[6:0] <= rf_pipe6_fwd_srcvm_vreg[6:0];
end

//output
assign dp_prf_rf_pipe6_srcv0_vreg_fr[5:0]  = rf_pipe6_prf_srcv0_vreg_fr[5:0];
assign dp_prf_rf_pipe6_srcv0_vreg_vr0[5:0] = rf_pipe6_prf_srcv0_vreg_vr0[5:0];
assign dp_prf_rf_pipe6_srcv0_vreg_vr1[5:0] = rf_pipe6_prf_srcv0_vreg_vr1[5:0];
assign dp_prf_rf_pipe6_srcv1_vreg_fr[5:0]  = rf_pipe6_prf_srcv1_vreg_fr[5:0];
assign dp_prf_rf_pipe6_srcv1_vreg_vr0[5:0] = rf_pipe6_prf_srcv1_vreg_vr0[5:0];
assign dp_prf_rf_pipe6_srcv1_vreg_vr1[5:0] = rf_pipe6_prf_srcv1_vreg_vr1[5:0];
assign dp_prf_rf_pipe6_srcv2_vreg_fr[5:0]  = rf_pipe6_prf_srcv2_vreg_fr[5:0];
assign dp_prf_rf_pipe6_srcv2_vreg_vr0[5:0] = rf_pipe6_prf_srcv2_vreg_vr0[5:0];
assign dp_prf_rf_pipe6_srcv2_vreg_vr1[5:0] = rf_pipe6_prf_srcv2_vreg_vr1[5:0];
assign dp_prf_rf_pipe6_srcvm_vreg_vr0[5:0] = rf_pipe6_prf_srcvm_vreg_vr0[5:0];
assign dp_prf_rf_pipe6_srcvm_vreg_vr1[5:0] = rf_pipe6_prf_srcvm_vreg_vr1[5:0];

assign dp_fwd_rf_pipe6_srcv0_vreg[6:0]     = rf_pipe6_fwd_srcv0_vreg[6:0];
assign dp_fwd_rf_pipe6_srcv1_vreg[6:0]     = rf_pipe6_fwd_srcv1_vreg[6:0];
assign dp_fwd_rf_pipe6_srcv2_vreg[6:0]     = rf_pipe6_fwd_srcv2_vreg[6:0];
assign dp_fwd_rf_pipe6_srcvm_vreg[6:0]     = rf_pipe6_fwd_srcvm_vreg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for issue queue
assign dp_viq0_rf_lch_entry[7:0]       = rf_pipe6_iq_entry[7:0];
//for control path
assign dp_ctrl_rf_pipe6_mfvr           = rf_pipe6_data[VIQ0_MFVR];
assign dp_ctrl_rf_pipe6_vmul           = rf_pipe6_data[VIQ0_VMUL];
assign dp_ctrl_rf_pipe6_srcv2_vld      = rf_pipe6_data[VIQ0_SRCV2_VLD];
//for forward
assign dp_fwd_rf_pipe6_vmla            = rf_pipe6_data[VIQ0_VMLA];
//for vmla lch
assign dp_xx_rf_pipe6_dst_vreg_dup0[6:0] = rf_pipe6_dst_vreg_dup0[6:0];
assign dp_xx_rf_pipe6_dst_vreg_dup1[6:0] = rf_pipe6_dst_vreg_dup1[6:0];
assign dp_xx_rf_pipe6_dst_vreg_dup2[6:0] = rf_pipe6_dst_vreg_dup2[6:0];
assign dp_xx_rf_pipe6_dst_vreg_dup3[6:0] = rf_pipe6_dst_vreg_dup3[6:0];

//----------------------------------------------------------
//                    RF stage Decoder
//----------------------------------------------------------
// &Instance("ct_idu_rf_pipe6_decd_dummy", "x_ct_idu_rf_pipe6_decd"); @1939
// &Instance("ct_idu_rf_pipe6_decd", "x_ct_idu_rf_pipe6_decd"); @1941
ct_idu_rf_pipe6_decd  x_ct_idu_rf_pipe6_decd (
  .pipe6_decd_eu_sel      (pipe6_decd_eu_sel     ),
  .pipe6_decd_func        (pipe6_decd_func       ),
  .pipe6_decd_imm0        (pipe6_decd_imm0       ),
  .pipe6_decd_inst_type   (pipe6_decd_inst_type  ),
  .pipe6_decd_opcode      (pipe6_decd_opcode     ),
  .pipe6_decd_oper_size   (pipe6_decd_oper_size  ),
  .pipe6_decd_ready_stage (pipe6_decd_ready_stage),
  .pipe6_decd_vimm        (pipe6_decd_vimm       ),
  .pipe6_decd_vsew        (pipe6_decd_vsew       )
);


//decode input
assign pipe6_decd_opcode[31:0]         = rf_pipe6_data[VIQ0_OPCODE:VIQ0_OPCODE-31];
assign pipe6_decd_vsew[1:0]            = rf_pipe6_data[VIQ0_VSEW-1:VIQ0_VSEW-2];
//----------------------------------------------------------
//                  Vector Source Operand
//----------------------------------------------------------
assign rf_pipe6_srcv0_fr_data[63:0]  = (rf_pipe6_data[VIQ0_SRCV0_WB])
                                       ? prf_dp_rf_pipe6_srcv0_vreg_fr_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv0_vreg_fr_data[63:0];
assign rf_pipe6_srcv0_vr0_data[63:0] = (rf_pipe6_data[VIQ0_SRCV0_WB])
                                       ? prf_dp_rf_pipe6_srcv0_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv0_vreg_vr0_data[63:0];
assign rf_pipe6_srcv0_vr1_data[63:0] = (rf_pipe6_data[VIQ0_SRCV0_WB])
                                       ? prf_dp_rf_pipe6_srcv0_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv0_vreg_vr1_data[63:0];
assign rf_pipe6_srcv1_fr_data[63:0]  = (rf_pipe6_data[VIQ0_SRCV1_WB])
                                       ? prf_dp_rf_pipe6_srcv1_vreg_fr_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv1_vreg_fr_data[63:0];
assign rf_pipe6_srcv1_vr0_data[63:0] = (rf_pipe6_data[VIQ0_SRCV1_WB])
                                       ? prf_dp_rf_pipe6_srcv1_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv1_vreg_vr0_data[63:0];
assign rf_pipe6_srcv1_vr1_data[63:0] = (rf_pipe6_data[VIQ0_SRCV1_WB])
                                       ? prf_dp_rf_pipe6_srcv1_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv1_vreg_vr1_data[63:0];
assign rf_pipe6_srcv2_fr_data[63:0]  = (rf_pipe6_data[VIQ0_SRCV2_WB])
                                       ? prf_dp_rf_pipe6_srcv2_vreg_fr_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv2_vreg_fr_data[63:0];
assign rf_pipe6_srcv2_vr0_data[63:0] = (rf_pipe6_data[VIQ0_SRCV2_WB])
                                       ? prf_dp_rf_pipe6_srcv2_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv2_vreg_vr0_data[63:0];
assign rf_pipe6_srcv2_vr1_data[63:0] = (rf_pipe6_data[VIQ0_SRCV2_WB])
                                       ? prf_dp_rf_pipe6_srcv2_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe6_srcv2_vreg_vr1_data[63:0];
assign rf_pipe6_srcvm_vr0_data[63:0] = (rf_pipe6_data[VIQ0_SRCVM_WB])
                                       ? prf_dp_rf_pipe6_srcvm_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe6_srcvm_vreg_vr0_data[63:0];
assign rf_pipe6_srcvm_vr1_data[63:0] = (rf_pipe6_data[VIQ0_SRCVM_WB])
                                       ? prf_dp_rf_pipe6_srcvm_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe6_srcvm_vreg_vr1_data[63:0];

assign rf_pipe6_srcv0_no_rdy         = rf_pipe6_data[VIQ0_SRCV0_VLD]
                                       && !rf_pipe6_data[VIQ0_SRCV0_WB]
                                       && fwd_dp_rf_pipe6_srcv0_no_fwd;
assign rf_pipe6_srcv1_no_rdy         = rf_pipe6_data[VIQ0_SRCV1_VLD]
                                       && !rf_pipe6_data[VIQ0_SRCV1_WB]
                                       && fwd_dp_rf_pipe6_srcv1_no_fwd;
assign rf_pipe6_srcv2_no_rdy         = rf_pipe6_data[VIQ0_SRCV2_VLD]
                                       && !rf_pipe6_data[VIQ0_SRCV2_WB]
                                       && fwd_dp_rf_pipe6_srcv2_no_fwd;
assign rf_pipe6_srcvm_no_rdy         = rf_pipe6_data[VIQ0_SRCVM_VLD]
                                       && !rf_pipe6_data[VIQ0_SRCVM_WB]
                                       && fwd_dp_rf_pipe6_srcvm_no_fwd;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe6_src_no_rdy = rf_pipe6_srcv0_no_rdy
                                     || rf_pipe6_srcv1_no_rdy
                                     || rf_pipe6_srcv2_no_rdy
                                     || rf_pipe6_srcvm_no_rdy;
assign dp_viq0_rf_rdy_clr[0]       = rf_pipe6_srcv0_no_rdy
                                     && !ctrl_dp_rf_pipe6_other_lch_fail;
assign dp_viq0_rf_rdy_clr[1]       = rf_pipe6_srcv1_no_rdy
                                     && !ctrl_dp_rf_pipe6_other_lch_fail;
assign dp_viq0_rf_rdy_clr[2]       = rf_pipe6_srcv2_no_rdy
                                     && !ctrl_dp_rf_pipe6_other_lch_fail;
assign dp_viq0_rf_rdy_clr[3]       = rf_pipe6_srcvm_no_rdy
                                     && !ctrl_dp_rf_pipe6_other_lch_fail;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to vfpu
assign idu_vfpu_rf_pipe6_iid[6:0]            = rf_pipe6_data[VIQ0_IID:VIQ0_IID-6];
assign idu_vfpu_rf_pipe6_dst_vld             = rf_pipe6_data[VIQ0_DST_VLD];
assign idu_vfpu_rf_pipe6_dst_preg[6:0]       = rf_pipe6_data[VIQ0_DST_PREG:VIQ0_DST_PREG-6];
assign idu_vfpu_rf_pipe6_dstv_vld            = rf_pipe6_data[VIQ0_DSTV_VLD];
assign idu_vfpu_rf_pipe6_dst_vreg[6:0]       = rf_pipe6_data[VIQ0_DST_VREG:VIQ0_DST_VREG-6];
assign idu_vfpu_rf_pipe6_dste_vld            = rf_pipe6_data[VIQ0_DSTE_VLD];
assign idu_vfpu_rf_pipe6_dst_ereg[4:0]       = rf_pipe6_data[VIQ0_DST_EREG:VIQ0_DST_EREG-4];
assign idu_vfpu_rf_pipe6_eu_sel[11:0]        = pipe6_decd_eu_sel[11:0];
assign idu_vfpu_rf_pipe6_func[19:0]          = pipe6_decd_func[19:0];
assign idu_vfpu_rf_pipe6_imm0[2:0]           = pipe6_decd_imm0[2:0];
assign idu_vfpu_rf_pipe6_vimm[4:0]           = pipe6_decd_vimm[4:0];
assign idu_vfpu_rf_pipe6_vimm_vld            =!rf_pipe6_data[VIQ0_SRCV1_VLD];
assign idu_vfpu_rf_pipe6_ready_stage[2:0]    = pipe6_decd_ready_stage[2:0];
assign idu_vfpu_rf_pipe6_mla_srcv2_vreg[6:0] = rf_pipe6_data[VIQ0_SRCV2_VREG:VIQ0_SRCV2_VREG-6];
assign idu_vfpu_rf_pipe6_mla_srcv2_vld       = rf_pipe6_data[VIQ0_SRCV2_VLD];
assign idu_vfpu_rf_pipe6_split_num[6:0]      = rf_pipe6_data[VIQ0_SPLIT_NUM:VIQ0_SPLIT_NUM-6];
assign idu_vfpu_rf_pipe6_vmla_type[2:0]      = rf_pipe6_data[VIQ0_VMLA_TYPE:VIQ0_VMLA_TYPE-2];
assign idu_vfpu_rf_pipe6_vlmul[1:0]          = rf_pipe6_data[VIQ0_VLMUL:VIQ0_VLMUL-1];
assign idu_vfpu_rf_pipe6_vsew[1:0]           = rf_pipe6_data[VIQ0_VSEW-1:VIQ0_VSEW-2];
assign idu_vfpu_rf_pipe6_vl[7:0]             = rf_pipe6_data[VIQ0_VL:VIQ0_VL-7];
assign idu_vfpu_rf_pipe6_vm_bit              = rf_pipe6_data[VIQ0_OPCODE-6];
assign idu_vfpu_rf_pipe6_inst_type[5:0]      = pipe6_decd_inst_type[5:0];
assign idu_vfpu_rf_pipe6_oper_size[2:0]      = pipe6_decd_oper_size[2:0];

assign idu_vfpu_rf_pipe6_srcv0_fr[63:0]      = rf_pipe6_srcv0_fr_data[63:0];
assign idu_vfpu_rf_pipe6_srcv0_vr0[63:0]     = rf_pipe6_srcv0_vr0_data[63:0];
assign idu_vfpu_rf_pipe6_srcv0_vr1[63:0]     = rf_pipe6_srcv0_vr1_data[63:0];
assign idu_vfpu_rf_pipe6_srcv1_fr[63:0]      = rf_pipe6_srcv1_fr_data[63:0];
assign idu_vfpu_rf_pipe6_srcv1_vr0[63:0]     = rf_pipe6_srcv1_vr0_data[63:0];
assign idu_vfpu_rf_pipe6_srcv1_vr1[63:0]     = rf_pipe6_srcv1_vr1_data[63:0];
assign idu_vfpu_rf_pipe6_srcv2_fr[63:0]      = rf_pipe6_srcv2_fr_data[63:0];
assign idu_vfpu_rf_pipe6_srcv2_vr0[63:0]     = rf_pipe6_srcv2_vr0_data[63:0];
assign idu_vfpu_rf_pipe6_srcv2_vr1[63:0]     = rf_pipe6_srcv2_vr1_data[63:0];
assign idu_vfpu_rf_pipe6_srcvm_vr0[63:0]     = rf_pipe6_srcvm_vr0_data[63:0];
assign idu_vfpu_rf_pipe6_srcvm_vr1[63:0]     = rf_pipe6_srcvm_vr1_data[63:0];

//assign idu_vfpu_rf_pipe6_srcv0_fr_high[31:0] = rf_pipe6_srcv0_fr_data[63:32];
//assign idu_vfpu_rf_pipe6_srcv1_fr_high[31:0] = rf_pipe6_srcv1_fr_data[63:32];
//assign idu_vfpu_rf_pipe6_srcv2_fr_high[31:0] = rf_pipe6_srcv2_fr_data[63:32];
//
//assign idu_vfpu_rf_pipe6_srcv0_fr_vfmau[63:0] = rf_pipe6_srcv0_fr_data[63:0];
//assign idu_vfpu_rf_pipe6_srcv1_fr_vfmau[63:0] = rf_pipe6_srcv1_fr_data[63:0];
//assign idu_vfpu_rf_pipe6_srcv2_fr_vfmau[63:0] = rf_pipe6_srcv2_fr_data[63:0];
//==========================================================
//                    Pipe7 Data Path
//==========================================================
//----------------------------------------------------------
//                 Instance of Gated Cell  
//----------------------------------------------------------
assign rf_pipe7_clk_en = viq1_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe7_gated_clk"); @2069
gated_clk_cell  x_rf_pipe7_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe7_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe7_clk_en   ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @2070
//          .external_en (1'b0), @2071
//          .global_en   (cp0_yy_clk_en), @2072
//          .module_en   (cp0_idu_icg_en), @2073
//          .local_en    (rf_pipe7_clk_en), @2074
//          .clk_out     (rf_pipe7_clk)); @2075

assign rf_pipe47_clk_en = lsiq_xx_gateclk_issue_en
                           || viq1_xx_gateclk_issue_en;
// &Instance("gated_clk_cell", "x_rf_pipe47_gated_clk"); @2079
gated_clk_cell  x_rf_pipe47_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (rf_pipe47_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rf_pipe47_clk_en  ),
  .module_en          (cp0_idu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @2080
//          .external_en (1'b0), @2081
//          .global_en   (cp0_yy_clk_en), @2082
//          .module_en   (cp0_idu_icg_en), @2083
//          .local_en    (rf_pipe47_clk_en), @2084
//          .clk_out     (rf_pipe47_clk)); @2085

//----------------------------------------------------------
//                  Rename Pipedown Data
//----------------------------------------------------------
assign dp_ctrl_is_viq1_issue_dstv_vld      = viq1_dp_issue_read_data[VIQ0_DSTV_VLD];
assign dp_ctrl_is_viq1_issue_vmla_short    = viq1_dp_issue_read_data[VIQ1_VMLA_SHORT];
assign dp_ctrl_is_viq1_issue_vmla_rf       = viq1_dp_issue_read_data[VIQ1_VMLA_TYPE];
assign dp_ctrl_is_viq1_issue_lch_rdy[15:0] = viq1_dp_issue_read_data[VIQ1_LCH_RDY_VIQ1:VIQ1_LCH_RDY_VIQ0-7];

//----------------------------------------------------------
//                   Pipeline Registers
//----------------------------------------------------------
always @(posedge rf_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe7_iq_entry[7:0]        <= 8'b0;
    rf_pipe7_data[VIQ1_WIDTH-1:0] <= {VIQ1_WIDTH{1'b0}};
    rf_pipe7_dst_vreg_dup0[6:0]   <= 7'b0;
    rf_pipe7_dst_vreg_dup1[6:0]   <= 7'b0;
    rf_pipe7_dst_vreg_dup2[6:0]   <= 7'b0;
    rf_pipe7_dst_vreg_dup3[6:0]   <= 7'b0;
  end
  else if(viq1_xx_issue_en) begin
    rf_pipe7_iq_entry[7:0]        <= viq1_dp_issue_entry[7:0];
    rf_pipe7_data[VIQ1_WIDTH-1:0] <= viq1_dp_issue_read_data[VIQ1_WIDTH-1:0];
    rf_pipe7_dst_vreg_dup0[6:0]   <= viq1_dp_issue_read_data[VIQ1_DST_VREG:VIQ1_DST_VREG-6];
    rf_pipe7_dst_vreg_dup1[6:0]   <= viq1_dp_issue_read_data[VIQ1_DST_VREG:VIQ1_DST_VREG-6];
    rf_pipe7_dst_vreg_dup2[6:0]   <= viq1_dp_issue_read_data[VIQ1_DST_VREG:VIQ1_DST_VREG-6];
    rf_pipe7_dst_vreg_dup3[6:0]   <= viq1_dp_issue_read_data[VIQ1_DST_VREG:VIQ1_DST_VREG-6];
  end
  else begin
    rf_pipe7_iq_entry[7:0]        <= rf_pipe7_iq_entry[7:0];
    rf_pipe7_data[VIQ1_WIDTH-1:0] <= rf_pipe7_data[VIQ1_WIDTH-1:0];
    rf_pipe7_dst_vreg_dup0[6:0]   <= rf_pipe7_dst_vreg_dup0[6:0];
    rf_pipe7_dst_vreg_dup1[6:0]   <= rf_pipe7_dst_vreg_dup1[6:0];
    rf_pipe7_dst_vreg_dup2[6:0]   <= rf_pipe7_dst_vreg_dup2[6:0];
    rf_pipe7_dst_vreg_dup3[6:0]   <= rf_pipe7_dst_vreg_dup3[6:0];
  end
end

//----------------------------------------------------------
//                Source Pipeline Registers
//----------------------------------------------------------
//for power and timing optimization, duplicate source vreg index
//rf pipe source index will never swap because:
//1.producer launch when it is allocated with vreg
//2.consumer issue after producer launch no matter replay or not
assign rf_pipe7_prf_srcv0_vreg_updt_vld = viq1_xx_issue_en;
//                                         && viq1_dp_issue_read_data[VIQ1_SRCV0_VLD]
//                                         && viq1_dp_issue_read_data[VIQ1_SRCV0_WB];
assign rf_pipe7_fwd_srcv0_vreg_updt_vld = viq1_xx_issue_en;
//                                         && viq1_dp_issue_read_data[VIQ1_SRCV0_VLD]
//                                         && !viq1_dp_issue_read_data[VIQ1_SRCV0_WB];
assign rf_pipe7_prf_srcv1_vreg_updt_vld = viq1_xx_issue_en;
//                                         && viq1_dp_issue_read_data[VIQ1_SRCV1_VLD]
//                                         && viq1_dp_issue_read_data[VIQ1_SRCV1_WB];
assign rf_pipe7_fwd_srcv1_vreg_updt_vld = viq1_xx_issue_en;
//                                         && viq1_dp_issue_read_data[VIQ1_SRCV1_VLD]
//                                         && !viq1_dp_issue_read_data[VIQ1_SRCV1_WB];
assign rf_pipe7_prf_srcv2_vreg_updt_vld = viq1_xx_issue_en
                                         && viq1_dp_issue_read_data[VIQ1_SRCV2_VLD];
//                                         && viq1_dp_issue_read_data[VIQ1_SRCV2_WB];
assign rf_pipe7_fwd_srcv2_vreg_updt_vld = viq1_xx_issue_en
                                         && viq1_dp_issue_read_data[VIQ1_SRCV2_VLD];
//                                         && !viq1_dp_issue_read_data[VIQ1_SRCV2_WB];
assign rf_pipe7_prf_srcvm_vreg_updt_vld = viq1_xx_issue_en;
//                                         && viq1_dp_issue_read_data[VIQ1_SRCVM_VLD]
//                                         && viq1_dp_issue_read_data[VIQ1_SRCVM_WB];
assign rf_pipe7_fwd_srcvm_vreg_updt_vld = viq1_xx_issue_en;
//                                         && viq1_dp_issue_read_data[VIQ1_SRCVM_VLD]
//                                         && !viq1_dp_issue_read_data[VIQ1_SRCVM_WB];

always @(posedge rf_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe7_prf_srcv0_vreg_fr[5:0]  <= 6'b0;
    rf_pipe7_prf_srcv0_vreg_vr0[5:0] <= 6'b0;
    rf_pipe7_prf_srcv0_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe7_prf_srcv0_vreg_updt_vld) begin
    rf_pipe7_prf_srcv0_vreg_fr[5:0]  <= viq1_dp_issue_read_data[VIQ1_SRCV0_VREG-1:VIQ1_SRCV0_VREG-6];
    rf_pipe7_prf_srcv0_vreg_vr0[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCV0_VREG-1:VIQ1_SRCV0_VREG-6];
    rf_pipe7_prf_srcv0_vreg_vr1[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCV0_VREG-1:VIQ1_SRCV0_VREG-6];
  end
  else begin
    rf_pipe7_prf_srcv0_vreg_fr[5:0]  <= rf_pipe7_prf_srcv0_vreg_fr[5:0];
    rf_pipe7_prf_srcv0_vreg_vr0[5:0] <= rf_pipe7_prf_srcv0_vreg_vr0[5:0];
    rf_pipe7_prf_srcv0_vreg_vr1[5:0] <= rf_pipe7_prf_srcv0_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe7_prf_srcv1_vreg_fr[5:0]  <= 6'b0;
    rf_pipe7_prf_srcv1_vreg_vr0[5:0] <= 6'b0;
    rf_pipe7_prf_srcv1_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe7_prf_srcv1_vreg_updt_vld) begin
    rf_pipe7_prf_srcv1_vreg_fr[5:0]  <= viq1_dp_issue_read_data[VIQ1_SRCV1_VREG-1:VIQ1_SRCV1_VREG-6];
    rf_pipe7_prf_srcv1_vreg_vr0[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCV1_VREG-1:VIQ1_SRCV1_VREG-6];
    rf_pipe7_prf_srcv1_vreg_vr1[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCV1_VREG-1:VIQ1_SRCV1_VREG-6];
  end
  else begin
    rf_pipe7_prf_srcv1_vreg_fr[5:0]  <= rf_pipe7_prf_srcv1_vreg_fr[5:0];
    rf_pipe7_prf_srcv1_vreg_vr0[5:0] <= rf_pipe7_prf_srcv1_vreg_vr0[5:0];
    rf_pipe7_prf_srcv1_vreg_vr1[5:0] <= rf_pipe7_prf_srcv1_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe47_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe7_prf_srcv2_vreg_fr[5:0]  <= 6'b0;
    rf_pipe7_prf_srcv2_vreg_vr0[5:0] <= 6'b0;
    rf_pipe7_prf_srcv2_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe7_prf_srcv2_vreg_updt_vld) begin
    rf_pipe7_prf_srcv2_vreg_fr[5:0]  <= viq1_dp_issue_read_data[VIQ1_SRCV2_VREG-1:VIQ1_SRCV2_VREG-6];
    rf_pipe7_prf_srcv2_vreg_vr0[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCV2_VREG-1:VIQ1_SRCV2_VREG-6];
    rf_pipe7_prf_srcv2_vreg_vr1[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCV2_VREG-1:VIQ1_SRCV2_VREG-6];
  end
  else if(rf_pipe4_prf_srcvm_vreg_updt_vld) begin
    rf_pipe7_prf_srcv2_vreg_fr[5:0]  <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_VREG-1:LSIQ_SRCVM_VREG-6];
    rf_pipe7_prf_srcv2_vreg_vr0[5:0] <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_VREG-1:LSIQ_SRCVM_VREG-6];
    rf_pipe7_prf_srcv2_vreg_vr1[5:0] <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_VREG-1:LSIQ_SRCVM_VREG-6];
  end
  else begin
    rf_pipe7_prf_srcv2_vreg_fr[5:0]  <= rf_pipe7_prf_srcv2_vreg_fr[5:0];
    rf_pipe7_prf_srcv2_vreg_vr0[5:0] <= rf_pipe7_prf_srcv2_vreg_vr0[5:0];
    rf_pipe7_prf_srcv2_vreg_vr1[5:0] <= rf_pipe7_prf_srcv2_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b) begin
    rf_pipe7_prf_srcvm_vreg_vr0[5:0] <= 6'b0;
    rf_pipe7_prf_srcvm_vreg_vr1[5:0] <= 6'b0;
  end
  else if(rf_pipe7_prf_srcvm_vreg_updt_vld) begin
    rf_pipe7_prf_srcvm_vreg_vr0[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCVM_VREG-1:VIQ1_SRCVM_VREG-6];
    rf_pipe7_prf_srcvm_vreg_vr1[5:0] <= viq1_dp_issue_read_data[VIQ1_SRCVM_VREG-1:VIQ1_SRCVM_VREG-6];
  end
  else begin
    rf_pipe7_prf_srcvm_vreg_vr0[5:0] <= rf_pipe7_prf_srcvm_vreg_vr0[5:0];
    rf_pipe7_prf_srcvm_vreg_vr1[5:0] <= rf_pipe7_prf_srcvm_vreg_vr1[5:0];
  end
end

always @(posedge rf_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe7_fwd_srcv0_vreg[6:0] <= 7'b0;
  else if(rf_pipe7_fwd_srcv0_vreg_updt_vld)
    rf_pipe7_fwd_srcv0_vreg[6:0] <= viq1_dp_issue_read_data[VIQ1_SRCV0_VREG:VIQ1_SRCV0_VREG-6];
  else
    rf_pipe7_fwd_srcv0_vreg[6:0] <= rf_pipe7_fwd_srcv0_vreg[6:0];
end

always @(posedge rf_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe7_fwd_srcv1_vreg[6:0] <= 7'b0;
  else if(rf_pipe7_fwd_srcv1_vreg_updt_vld)
    rf_pipe7_fwd_srcv1_vreg[6:0] <= viq1_dp_issue_read_data[VIQ1_SRCV1_VREG:VIQ1_SRCV1_VREG-6];
  else
    rf_pipe7_fwd_srcv1_vreg[6:0] <= rf_pipe7_fwd_srcv1_vreg[6:0];
end

always @(posedge rf_pipe47_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe7_fwd_srcv2_vreg[6:0] <= 7'b0;
  else if(rf_pipe7_fwd_srcv2_vreg_updt_vld)
    rf_pipe7_fwd_srcv2_vreg[6:0] <= viq1_dp_issue_read_data[VIQ1_SRCV2_VREG:VIQ1_SRCV2_VREG-6];
  else if(rf_pipe4_fwd_srcvm_vreg_updt_vld)
    rf_pipe7_fwd_srcv2_vreg[6:0] <= lsiq_dp_pipe4_issue_read_data[LSIQ_SRCVM_VREG:LSIQ_SRCVM_VREG-6];
  else
    rf_pipe7_fwd_srcv2_vreg[6:0] <= rf_pipe7_fwd_srcv2_vreg[6:0];
end

always @(posedge rf_pipe7_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    rf_pipe7_fwd_srcvm_vreg[6:0] <= 7'b0;
  else if(rf_pipe7_fwd_srcvm_vreg_updt_vld)
    rf_pipe7_fwd_srcvm_vreg[6:0] <= viq1_dp_issue_read_data[VIQ1_SRCVM_VREG:VIQ1_SRCVM_VREG-6];
  else
    rf_pipe7_fwd_srcvm_vreg[6:0] <= rf_pipe7_fwd_srcvm_vreg[6:0];
end

//output
assign dp_prf_rf_pipe7_srcv0_vreg_fr[5:0]  = rf_pipe7_prf_srcv0_vreg_fr[5:0];
assign dp_prf_rf_pipe7_srcv0_vreg_vr0[5:0] = rf_pipe7_prf_srcv0_vreg_vr0[5:0];
assign dp_prf_rf_pipe7_srcv0_vreg_vr1[5:0] = rf_pipe7_prf_srcv0_vreg_vr1[5:0];
assign dp_prf_rf_pipe7_srcv1_vreg_fr[5:0]  = rf_pipe7_prf_srcv1_vreg_fr[5:0];
assign dp_prf_rf_pipe7_srcv1_vreg_vr0[5:0] = rf_pipe7_prf_srcv1_vreg_vr0[5:0];
assign dp_prf_rf_pipe7_srcv1_vreg_vr1[5:0] = rf_pipe7_prf_srcv1_vreg_vr1[5:0];
assign dp_prf_rf_pipe7_srcv2_vreg_fr[5:0]  = rf_pipe7_prf_srcv2_vreg_fr[5:0];
assign dp_prf_rf_pipe7_srcv2_vreg_vr0[5:0] = rf_pipe7_prf_srcv2_vreg_vr0[5:0];
assign dp_prf_rf_pipe7_srcv2_vreg_vr1[5:0] = rf_pipe7_prf_srcv2_vreg_vr1[5:0];
assign dp_prf_rf_pipe7_srcvm_vreg_vr0[5:0] = rf_pipe7_prf_srcvm_vreg_vr0[5:0];
assign dp_prf_rf_pipe7_srcvm_vreg_vr1[5:0] = rf_pipe7_prf_srcvm_vreg_vr1[5:0];

assign dp_fwd_rf_pipe7_srcv0_vreg[6:0]     = rf_pipe7_fwd_srcv0_vreg[6:0];
assign dp_fwd_rf_pipe7_srcv1_vreg[6:0]     = rf_pipe7_fwd_srcv1_vreg[6:0];
assign dp_fwd_rf_pipe7_srcv2_vreg[6:0]     = rf_pipe7_fwd_srcv2_vreg[6:0];
assign dp_fwd_rf_pipe7_srcvm_vreg[6:0]     = rf_pipe7_fwd_srcvm_vreg[6:0];

//----------------------------------------------------------
//                  Rename for Data Path
//----------------------------------------------------------
//for issue queue
assign dp_viq1_rf_lch_entry[7:0]         = rf_pipe7_iq_entry[7:0];
//for control path
assign dp_ctrl_rf_pipe7_mfvr             = rf_pipe7_data[VIQ1_MFVR];
assign dp_ctrl_rf_pipe7_vmul_unsplit     = rf_pipe7_data[VIQ1_VMUL_UNSPLIT];
assign dp_ctrl_rf_pipe7_srcv2_vld        = rf_pipe7_data[VIQ1_SRCV2_VLD];
//for forward
assign dp_fwd_rf_pipe7_vmla              = rf_pipe7_data[VIQ1_VMLA];
//for vmla lch
assign dp_xx_rf_pipe7_dst_vreg_dup0[6:0] = rf_pipe7_dst_vreg_dup0[6:0];
assign dp_xx_rf_pipe7_dst_vreg_dup1[6:0] = rf_pipe7_dst_vreg_dup1[6:0];
assign dp_xx_rf_pipe7_dst_vreg_dup2[6:0] = rf_pipe7_dst_vreg_dup2[6:0];
assign dp_xx_rf_pipe7_dst_vreg_dup3[6:0] = rf_pipe7_dst_vreg_dup3[6:0];

//----------------------------------------------------------
//                    RF stage Decoder
//----------------------------------------------------------
// &Instance("ct_idu_rf_pipe7_decd_dummy", "x_ct_idu_rf_pipe7_decd"); @2317
// &Instance("ct_idu_rf_pipe7_decd", "x_ct_idu_rf_pipe7_decd"); @2319
ct_idu_rf_pipe7_decd  x_ct_idu_rf_pipe7_decd (
  .pipe7_decd_eu_sel      (pipe7_decd_eu_sel     ),
  .pipe7_decd_func        (pipe7_decd_func       ),
  .pipe7_decd_imm0        (pipe7_decd_imm0       ),
  .pipe7_decd_inst_type   (pipe7_decd_inst_type  ),
  .pipe7_decd_opcode      (pipe7_decd_opcode     ),
  .pipe7_decd_oper_size   (pipe7_decd_oper_size  ),
  .pipe7_decd_ready_stage (pipe7_decd_ready_stage),
  .pipe7_decd_vimm        (pipe7_decd_vimm       ),
  .pipe7_decd_vsew        (pipe7_decd_vsew       )
);

//decode input
assign pipe7_decd_opcode[31:0]         = rf_pipe7_data[VIQ1_OPCODE:VIQ1_OPCODE-31];
assign pipe7_decd_vsew[1:0]            = rf_pipe7_data[VIQ1_VSEW-1:VIQ1_VSEW-2];
//----------------------------------------------------------
//                  Vector Source Operand
//----------------------------------------------------------
assign rf_pipe7_srcv0_fr_data[63:0]  = (rf_pipe7_data[VIQ1_SRCV0_WB])
                                       ? prf_dp_rf_pipe7_srcv0_vreg_fr_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv0_vreg_fr_data[63:0];
assign rf_pipe7_srcv0_vr0_data[63:0] = (rf_pipe7_data[VIQ1_SRCV0_WB])
                                       ? prf_dp_rf_pipe7_srcv0_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv0_vreg_vr0_data[63:0];
assign rf_pipe7_srcv0_vr1_data[63:0] = (rf_pipe7_data[VIQ1_SRCV0_WB])
                                       ? prf_dp_rf_pipe7_srcv0_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv0_vreg_vr1_data[63:0];
assign rf_pipe7_srcv1_fr_data[63:0]  = (rf_pipe7_data[VIQ1_SRCV1_WB])
                                       ? prf_dp_rf_pipe7_srcv1_vreg_fr_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv1_vreg_fr_data[63:0];
assign rf_pipe7_srcv1_vr0_data[63:0] = (rf_pipe7_data[VIQ1_SRCV1_WB])
                                       ? prf_dp_rf_pipe7_srcv1_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv1_vreg_vr0_data[63:0];
assign rf_pipe7_srcv1_vr1_data[63:0] = (rf_pipe7_data[VIQ1_SRCV1_WB])
                                       ? prf_dp_rf_pipe7_srcv1_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv1_vreg_vr1_data[63:0];
assign rf_pipe7_srcv2_fr_data[63:0]  = (rf_pipe7_data[VIQ1_SRCV2_WB])
                                       ? prf_dp_rf_pipe7_srcv2_vreg_fr_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv2_vreg_fr_data[63:0];
assign rf_pipe7_srcv2_vr0_data[63:0] = (rf_pipe7_data[VIQ1_SRCV2_WB])
                                       ? prf_dp_rf_pipe7_srcv2_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv2_vreg_vr0_data[63:0];
assign rf_pipe7_srcv2_vr1_data[63:0] = (rf_pipe7_data[VIQ1_SRCV2_WB])
                                       ? prf_dp_rf_pipe7_srcv2_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe7_srcv2_vreg_vr1_data[63:0];
assign rf_pipe7_srcvm_vr0_data[63:0] = (rf_pipe7_data[VIQ1_SRCVM_WB])
                                       ? prf_dp_rf_pipe7_srcvm_vreg_vr0_data[63:0]
                                       : fwd_dp_rf_pipe7_srcvm_vreg_vr0_data[63:0];
assign rf_pipe7_srcvm_vr1_data[63:0] = (rf_pipe7_data[VIQ1_SRCVM_WB])
                                       ? prf_dp_rf_pipe7_srcvm_vreg_vr1_data[63:0]
                                       : fwd_dp_rf_pipe7_srcvm_vreg_vr1_data[63:0];

assign rf_pipe7_srcv0_no_rdy         = rf_pipe7_data[VIQ1_SRCV0_VLD]
                                       && !rf_pipe7_data[VIQ1_SRCV0_WB]
                                       && fwd_dp_rf_pipe7_srcv0_no_fwd;
assign rf_pipe7_srcv1_no_rdy         = rf_pipe7_data[VIQ1_SRCV1_VLD]
                                       && !rf_pipe7_data[VIQ1_SRCV1_WB]
                                       && fwd_dp_rf_pipe7_srcv1_no_fwd;
assign rf_pipe7_srcv2_no_rdy         = rf_pipe7_data[VIQ1_SRCV2_VLD]
                                       && !rf_pipe7_data[VIQ1_SRCV2_WB]
                                       && fwd_dp_rf_pipe7_srcv2_no_fwd;
assign rf_pipe7_srcvm_no_rdy         = rf_pipe7_data[VIQ1_SRCVM_VLD]
                                       && !rf_pipe7_data[VIQ1_SRCVM_WB]
                                       && fwd_dp_rf_pipe7_srcvm_no_fwd;

//----------------------------------------------------------
//                 Source Not Ready Signal
//----------------------------------------------------------
//if source not ready, signal rf_ctrl launch fail and clear
//issue queue ready
assign dp_ctrl_rf_pipe7_src_no_rdy = rf_pipe7_srcv0_no_rdy
                                     || rf_pipe7_srcv1_no_rdy
                                     || rf_pipe7_srcv2_no_rdy
                                     || rf_pipe7_srcvm_no_rdy;
assign dp_viq1_rf_rdy_clr[0]       = rf_pipe7_srcv0_no_rdy
                                     && !ctrl_dp_rf_pipe7_other_lch_fail;
assign dp_viq1_rf_rdy_clr[1]       = rf_pipe7_srcv1_no_rdy
                                     && !ctrl_dp_rf_pipe7_other_lch_fail;
assign dp_viq1_rf_rdy_clr[2]       = rf_pipe7_srcv2_no_rdy
                                     && !ctrl_dp_rf_pipe7_other_lch_fail;
assign dp_viq1_rf_rdy_clr[3]       = rf_pipe7_srcvm_no_rdy
                                     && !ctrl_dp_rf_pipe7_other_lch_fail;

//----------------------------------------------------------
//                Output to Execution Units
//----------------------------------------------------------
//output to vfpu
assign idu_vfpu_rf_pipe7_iid[6:0]            = rf_pipe7_data[VIQ1_IID:VIQ1_IID-6];
assign idu_vfpu_rf_pipe7_dst_vld             = rf_pipe7_data[VIQ1_DST_VLD];
assign idu_vfpu_rf_pipe7_dst_preg[6:0]       = rf_pipe7_data[VIQ1_DST_PREG:VIQ1_DST_PREG-6];
assign idu_vfpu_rf_pipe7_dstv_vld            = rf_pipe7_data[VIQ1_DSTV_VLD];
assign idu_vfpu_rf_pipe7_dst_vreg[6:0]       = rf_pipe7_data[VIQ1_DST_VREG:VIQ1_DST_VREG-6];
assign idu_vfpu_rf_pipe7_dste_vld            = rf_pipe7_data[VIQ1_DSTE_VLD];
assign idu_vfpu_rf_pipe7_dst_ereg[4:0]       = rf_pipe7_data[VIQ1_DST_EREG:VIQ1_DST_EREG-4];
assign idu_vfpu_rf_pipe7_eu_sel[11:0]        = pipe7_decd_eu_sel[11:0];
assign idu_vfpu_rf_pipe7_func[19:0]          = pipe7_decd_func[19:0];
assign idu_vfpu_rf_pipe7_imm0[2:0]           = pipe7_decd_imm0[2:0];
assign idu_vfpu_rf_pipe7_vimm[4:0]           = pipe7_decd_vimm[4:0];
assign idu_vfpu_rf_pipe7_vimm_vld            =!rf_pipe7_data[VIQ1_SRCV1_VLD];
assign idu_vfpu_rf_pipe7_ready_stage[2:0]    = pipe7_decd_ready_stage[2:0];
assign idu_vfpu_rf_pipe7_mla_srcv2_vreg[6:0] = rf_pipe7_data[VIQ1_SRCV2_VREG:VIQ1_SRCV2_VREG-6];
assign idu_vfpu_rf_pipe7_mla_srcv2_vld       = rf_pipe7_data[VIQ1_SRCV2_VLD];
assign idu_vfpu_rf_pipe7_split_num[6:0]      = rf_pipe7_data[VIQ1_SPLIT_NUM:VIQ1_SPLIT_NUM-6];
assign idu_vfpu_rf_pipe7_vmla_type[2:0]      = rf_pipe7_data[VIQ1_VMLA_TYPE:VIQ1_VMLA_TYPE-2];
assign idu_vfpu_rf_pipe7_vlmul[1:0]          = rf_pipe7_data[VIQ1_VLMUL:VIQ1_VLMUL-1];
assign idu_vfpu_rf_pipe7_vsew[1:0]           = rf_pipe7_data[VIQ1_VSEW-1:VIQ1_VSEW-2];
assign idu_vfpu_rf_pipe7_vl[7:0]             = rf_pipe7_data[VIQ1_VL:VIQ1_VL-7];
assign idu_vfpu_rf_pipe7_vm_bit              = rf_pipe7_data[VIQ1_OPCODE-6];
assign idu_vfpu_rf_pipe7_inst_type[5:0]      = pipe7_decd_inst_type[5:0];
assign idu_vfpu_rf_pipe7_oper_size[2:0]      = pipe7_decd_oper_size[2:0];

assign idu_vfpu_rf_pipe7_srcv0_fr[63:0]      = rf_pipe7_srcv0_fr_data[63:0];
assign idu_vfpu_rf_pipe7_srcv0_vr0[63:0]     = rf_pipe7_srcv0_vr0_data[63:0];
assign idu_vfpu_rf_pipe7_srcv0_vr1[63:0]     = rf_pipe7_srcv0_vr1_data[63:0];
assign idu_vfpu_rf_pipe7_srcv1_fr[63:0]      = rf_pipe7_srcv1_fr_data[63:0];
assign idu_vfpu_rf_pipe7_srcv1_vr0[63:0]     = rf_pipe7_srcv1_vr0_data[63:0];
assign idu_vfpu_rf_pipe7_srcv1_vr1[63:0]     = rf_pipe7_srcv1_vr1_data[63:0];
assign idu_vfpu_rf_pipe7_srcv2_fr[63:0]      = rf_pipe7_srcv2_fr_data[63:0];
assign idu_vfpu_rf_pipe7_srcv2_vr0[63:0]     = rf_pipe7_srcv2_vr0_data[63:0];
assign idu_vfpu_rf_pipe7_srcv2_vr1[63:0]     = rf_pipe7_srcv2_vr1_data[63:0];
assign idu_vfpu_rf_pipe7_srcvm_vr0[63:0]     = rf_pipe7_srcvm_vr0_data[63:0];
assign idu_vfpu_rf_pipe7_srcvm_vr1[63:0]     = rf_pipe7_srcvm_vr1_data[63:0];

//assign idu_vfpu_rf_pipe7_srcv0_fr_high[31:0] = rf_pipe7_srcv0_fr_data[63:32];
//assign idu_vfpu_rf_pipe7_srcv1_fr_high[31:0] = rf_pipe7_srcv1_fr_data[63:32];
//assign idu_vfpu_rf_pipe7_srcv2_fr_high[31:0] = rf_pipe7_srcv2_fr_data[63:32];
//
//assign idu_vfpu_rf_pipe7_srcv0_fr_vfmau[63:0] = rf_pipe7_srcv0_fr_data[63:0];
//assign idu_vfpu_rf_pipe7_srcv1_fr_vfmau[63:0] = rf_pipe7_srcv1_fr_data[63:0];
//assign idu_vfpu_rf_pipe7_srcv2_fr_vfmau[63:0] = rf_pipe7_srcv2_fr_data[63:0];

// &Force("nonport","idu_vfpu_rf_pipe6_split_num");  @2442
// &Force("nonport","idu_vfpu_rf_pipe6_srcv0_vr0"); @2443
// &Force("nonport","idu_vfpu_rf_pipe6_srcv0_vr1"); @2444
// &Force("nonport","idu_vfpu_rf_pipe6_srcv1_vr0"); @2445
// &Force("nonport","idu_vfpu_rf_pipe6_srcv1_vr1"); @2446
// &Force("nonport","idu_vfpu_rf_pipe6_srcv2_vr0"); @2447
// &Force("nonport","idu_vfpu_rf_pipe6_srcv2_vr1"); @2448
// &Force("nonport","idu_vfpu_rf_pipe6_srcvm_vr0"); @2449
// &Force("nonport","idu_vfpu_rf_pipe6_srcvm_vr1"); @2450
// &Force("nonport","idu_vfpu_rf_pipe6_vimm"); @2451
// &Force("nonport","idu_vfpu_rf_pipe6_vimm_vld"); @2452
// &Force("nonport","idu_vfpu_rf_pipe6_vlmul"); @2453
// &Force("nonport","idu_vfpu_rf_pipe6_vm_bit"); @2454
// &Force("nonport","idu_vfpu_rf_pipe6_vsew"); @2455
// &Force("nonport","idu_vfpu_rf_pipe6_vl"); @2456
// &Force("nonport","idu_vfpu_rf_pipe6_oper_size"); @2457
// &Force("nonport","idu_vfpu_rf_pipe7_split_num"); @2458
// &Force("nonport","idu_vfpu_rf_pipe7_srcv0_vr0"); @2459
// &Force("nonport","idu_vfpu_rf_pipe7_srcv0_vr1"); @2460
// &Force("nonport","idu_vfpu_rf_pipe7_srcv1_vr0"); @2461
// &Force("nonport","idu_vfpu_rf_pipe7_srcv1_vr1"); @2462
// &Force("nonport","idu_vfpu_rf_pipe7_srcv2_vr0"); @2463
// &Force("nonport","idu_vfpu_rf_pipe7_srcv2_vr1"); @2464
// &Force("nonport","idu_vfpu_rf_pipe7_srcvm_vr0"); @2465
// &Force("nonport","idu_vfpu_rf_pipe7_srcvm_vr1"); @2466
// &Force("nonport","idu_vfpu_rf_pipe7_vimm"); @2467
// &Force("nonport","idu_vfpu_rf_pipe7_vimm_vld"); @2468
// &Force("nonport","idu_vfpu_rf_pipe7_vlmul"); @2469
// &Force("nonport","idu_vfpu_rf_pipe7_vm_bit"); @2470
// &Force("nonport","idu_vfpu_rf_pipe7_vsew"); @2471
// &Force("nonport","idu_vfpu_rf_pipe7_vl"); @2472
// &Force("nonport","idu_vfpu_rf_pipe7_oper_size"); @2473
// &ModuleEnd; @2475
endmodule


