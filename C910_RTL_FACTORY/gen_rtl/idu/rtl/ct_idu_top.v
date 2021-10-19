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
module ct_idu_top(
  cp0_idu_cskyee,
  cp0_idu_dlb_disable,
  cp0_idu_frm,
  cp0_idu_fs,
  cp0_idu_icg_en,
  cp0_idu_iq_bypass_disable,
  cp0_idu_rob_fold_disable,
  cp0_idu_src2_fwd_disable,
  cp0_idu_srcv2_fwd_disable,
  cp0_idu_vill,
  cp0_idu_vs,
  cp0_idu_vstart,
  cp0_idu_zero_delay_move_disable,
  cp0_lsu_fencei_broad_dis,
  cp0_lsu_fencerw_broad_dis,
  cp0_lsu_tlb_broad_dis,
  cp0_yy_clk_en,
  cp0_yy_hyper,
  cpurst_b,
  forever_cpuclk,
  had_idu_debug_id_inst_en,
  had_idu_wbbr_data,
  had_idu_wbbr_vld,
  hpcp_idu_cnt_en,
  idu_cp0_fesr_acc_updt_val,
  idu_cp0_fesr_acc_updt_vld,
  idu_cp0_rf_func,
  idu_cp0_rf_gateclk_sel,
  idu_cp0_rf_iid,
  idu_cp0_rf_opcode,
  idu_cp0_rf_preg,
  idu_cp0_rf_sel,
  idu_cp0_rf_src0,
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
  idu_ifu_id_bypass_stall,
  idu_ifu_id_stall,
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
  ifu_idu_ib_inst0_data,
  ifu_idu_ib_inst0_vld,
  ifu_idu_ib_inst1_data,
  ifu_idu_ib_inst1_vld,
  ifu_idu_ib_inst2_data,
  ifu_idu_ib_inst2_vld,
  ifu_idu_ib_pipedown_gateclk,
  ifu_xx_sync_reset,
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
  iu_yy_xx_cancel,
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
  pad_yy_icg_scan_en,
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
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
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
  vfpu_idu_vdiv_wb_stall
);

// &Ports; @25
input            cp0_idu_cskyee;                         
input            cp0_idu_dlb_disable;                    
input   [2  :0]  cp0_idu_frm;                            
input   [1  :0]  cp0_idu_fs;                             
input            cp0_idu_icg_en;                         
input            cp0_idu_iq_bypass_disable;              
input            cp0_idu_rob_fold_disable;               
input            cp0_idu_src2_fwd_disable;               
input            cp0_idu_srcv2_fwd_disable;              
input            cp0_idu_vill;                           
input   [1  :0]  cp0_idu_vs;                             
input   [6  :0]  cp0_idu_vstart;                         
input            cp0_idu_zero_delay_move_disable;        
input            cp0_lsu_fencei_broad_dis;               
input            cp0_lsu_fencerw_broad_dis;              
input            cp0_lsu_tlb_broad_dis;                  
input            cp0_yy_clk_en;                          
input            cp0_yy_hyper;                           
input            cpurst_b;                               
input            forever_cpuclk;                         
input            had_idu_debug_id_inst_en;               
input   [63 :0]  had_idu_wbbr_data;                      
input            had_idu_wbbr_vld;                       
input            hpcp_idu_cnt_en;                        
input   [72 :0]  ifu_idu_ib_inst0_data;                  
input            ifu_idu_ib_inst0_vld;                   
input   [72 :0]  ifu_idu_ib_inst1_data;                  
input            ifu_idu_ib_inst1_vld;                   
input   [72 :0]  ifu_idu_ib_inst2_data;                  
input            ifu_idu_ib_inst2_vld;                   
input            ifu_idu_ib_pipedown_gateclk;            
input            ifu_xx_sync_reset;                      
input            iu_idu_div_busy;                        
input            iu_idu_div_inst_vld;                    
input   [6  :0]  iu_idu_div_preg_dup0;                   
input   [6  :0]  iu_idu_div_preg_dup1;                   
input   [6  :0]  iu_idu_div_preg_dup2;                   
input   [6  :0]  iu_idu_div_preg_dup3;                   
input   [6  :0]  iu_idu_div_preg_dup4;                   
input            iu_idu_div_wb_stall;                    
input   [6  :0]  iu_idu_ex1_pipe0_fwd_preg;              
input   [63 :0]  iu_idu_ex1_pipe0_fwd_preg_data;         
input            iu_idu_ex1_pipe0_fwd_preg_vld;          
input   [6  :0]  iu_idu_ex1_pipe1_fwd_preg;              
input   [63 :0]  iu_idu_ex1_pipe1_fwd_preg_data;         
input            iu_idu_ex1_pipe1_fwd_preg_vld;          
input            iu_idu_ex1_pipe1_mult_stall;            
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg;               
input   [63 :0]  iu_idu_ex2_pipe0_wb_preg_data;          
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup0;          
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup1;          
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup2;          
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup3;          
input   [6  :0]  iu_idu_ex2_pipe0_wb_preg_dup4;          
input   [95 :0]  iu_idu_ex2_pipe0_wb_preg_expand;        
input            iu_idu_ex2_pipe0_wb_preg_vld;           
input            iu_idu_ex2_pipe0_wb_preg_vld_dup0;      
input            iu_idu_ex2_pipe0_wb_preg_vld_dup1;      
input            iu_idu_ex2_pipe0_wb_preg_vld_dup2;      
input            iu_idu_ex2_pipe0_wb_preg_vld_dup3;      
input            iu_idu_ex2_pipe0_wb_preg_vld_dup4;      
input            iu_idu_ex2_pipe1_mult_inst_vld_dup0;    
input            iu_idu_ex2_pipe1_mult_inst_vld_dup1;    
input            iu_idu_ex2_pipe1_mult_inst_vld_dup2;    
input            iu_idu_ex2_pipe1_mult_inst_vld_dup3;    
input            iu_idu_ex2_pipe1_mult_inst_vld_dup4;    
input   [6  :0]  iu_idu_ex2_pipe1_preg_dup0;             
input   [6  :0]  iu_idu_ex2_pipe1_preg_dup1;             
input   [6  :0]  iu_idu_ex2_pipe1_preg_dup2;             
input   [6  :0]  iu_idu_ex2_pipe1_preg_dup3;             
input   [6  :0]  iu_idu_ex2_pipe1_preg_dup4;             
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg;               
input   [63 :0]  iu_idu_ex2_pipe1_wb_preg_data;          
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup0;          
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup1;          
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup2;          
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup3;          
input   [6  :0]  iu_idu_ex2_pipe1_wb_preg_dup4;          
input   [95 :0]  iu_idu_ex2_pipe1_wb_preg_expand;        
input            iu_idu_ex2_pipe1_wb_preg_vld;           
input            iu_idu_ex2_pipe1_wb_preg_vld_dup0;      
input            iu_idu_ex2_pipe1_wb_preg_vld_dup1;      
input            iu_idu_ex2_pipe1_wb_preg_vld_dup2;      
input            iu_idu_ex2_pipe1_wb_preg_vld_dup3;      
input            iu_idu_ex2_pipe1_wb_preg_vld_dup4;      
input            iu_idu_mispred_stall;                   
input   [4  :0]  iu_idu_pcfifo_dis_inst0_pid;            
input   [4  :0]  iu_idu_pcfifo_dis_inst1_pid;            
input   [4  :0]  iu_idu_pcfifo_dis_inst2_pid;            
input   [4  :0]  iu_idu_pcfifo_dis_inst3_pid;            
input            iu_idu_pipe1_mla_src2_no_fwd;           
input            iu_yy_xx_cancel;                        
input            lsu_idu_ag_pipe3_load_inst_vld;         
input   [6  :0]  lsu_idu_ag_pipe3_preg_dup0;             
input   [6  :0]  lsu_idu_ag_pipe3_preg_dup1;             
input   [6  :0]  lsu_idu_ag_pipe3_preg_dup2;             
input   [6  :0]  lsu_idu_ag_pipe3_preg_dup3;             
input   [6  :0]  lsu_idu_ag_pipe3_preg_dup4;             
input            lsu_idu_ag_pipe3_vload_inst_vld;        
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dup0;             
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dup1;             
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dup2;             
input   [6  :0]  lsu_idu_ag_pipe3_vreg_dup3;             
input   [11 :0]  lsu_idu_already_da;                     
input   [11 :0]  lsu_idu_bkpta_data;                     
input   [11 :0]  lsu_idu_bkptb_data;                     
input   [6  :0]  lsu_idu_da_pipe3_fwd_preg;              
input   [63 :0]  lsu_idu_da_pipe3_fwd_preg_data;         
input            lsu_idu_da_pipe3_fwd_preg_vld;          
input   [6  :0]  lsu_idu_da_pipe3_fwd_vreg;              
input   [63 :0]  lsu_idu_da_pipe3_fwd_vreg_fr_data;      
input            lsu_idu_da_pipe3_fwd_vreg_vld;          
input   [63 :0]  lsu_idu_da_pipe3_fwd_vreg_vr0_data;     
input   [63 :0]  lsu_idu_da_pipe3_fwd_vreg_vr1_data;     
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1; 
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2; 
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3; 
input            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4; 
input            lsu_idu_dc_pipe3_load_inst_vld_dup0;    
input            lsu_idu_dc_pipe3_load_inst_vld_dup1;    
input            lsu_idu_dc_pipe3_load_inst_vld_dup2;    
input            lsu_idu_dc_pipe3_load_inst_vld_dup3;    
input            lsu_idu_dc_pipe3_load_inst_vld_dup4;    
input   [6  :0]  lsu_idu_dc_pipe3_preg_dup0;             
input   [6  :0]  lsu_idu_dc_pipe3_preg_dup1;             
input   [6  :0]  lsu_idu_dc_pipe3_preg_dup2;             
input   [6  :0]  lsu_idu_dc_pipe3_preg_dup3;             
input   [6  :0]  lsu_idu_dc_pipe3_preg_dup4;             
input            lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
input            lsu_idu_dc_pipe3_vload_inst_vld_dup0;   
input            lsu_idu_dc_pipe3_vload_inst_vld_dup1;   
input            lsu_idu_dc_pipe3_vload_inst_vld_dup2;   
input            lsu_idu_dc_pipe3_vload_inst_vld_dup3;   
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dup0;             
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dup1;             
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dup2;             
input   [6  :0]  lsu_idu_dc_pipe3_vreg_dup3;             
input   [11 :0]  lsu_idu_dc_sdiq_entry;                  
input            lsu_idu_dc_staddr1_vld;                 
input            lsu_idu_dc_staddr_unalign;              
input            lsu_idu_dc_staddr_vld;                  
input   [11 :0]  lsu_idu_ex1_sdiq_entry;                 
input            lsu_idu_ex1_sdiq_frz_clr;               
input            lsu_idu_ex1_sdiq_pop_vld;               
input   [11 :0]  lsu_idu_lq_full;                        
input            lsu_idu_lq_full_gateclk_en;             
input            lsu_idu_lq_not_full;                    
input            lsu_idu_lsiq_pop0_vld;                  
input            lsu_idu_lsiq_pop1_vld;                  
input   [11 :0]  lsu_idu_lsiq_pop_entry;                 
input            lsu_idu_lsiq_pop_vld;                   
input            lsu_idu_no_fence;                       
input   [11 :0]  lsu_idu_rb_full;                        
input            lsu_idu_rb_full_gateclk_en;             
input            lsu_idu_rb_not_full;                    
input   [11 :0]  lsu_idu_secd;                           
input   [11 :0]  lsu_idu_spec_fail;                      
input   [11 :0]  lsu_idu_sq_full;                        
input            lsu_idu_sq_full_gateclk_en;             
input            lsu_idu_sq_not_full;                    
input   [11 :0]  lsu_idu_tlb_busy;                       
input            lsu_idu_tlb_busy_gateclk_en;            
input   [11 :0]  lsu_idu_tlb_wakeup;                     
input   [11 :0]  lsu_idu_unalign_gateclk_en;             
input            lsu_idu_vmb_1_left_updt;                
input   [7  :0]  lsu_idu_vmb_create0_entry;              
input   [7  :0]  lsu_idu_vmb_create1_entry;              
input            lsu_idu_vmb_empty;                      
input            lsu_idu_vmb_full;                       
input            lsu_idu_vmb_full_updt;                  
input            lsu_idu_vmb_full_updt_clk_en;           
input   [11 :0]  lsu_idu_wait_fence;                     
input            lsu_idu_wait_fence_gateclk_en;          
input   [11 :0]  lsu_idu_wait_old;                       
input            lsu_idu_wait_old_gateclk_en;            
input   [11 :0]  lsu_idu_wakeup;                         
input   [6  :0]  lsu_idu_wb_pipe3_fwd_vreg;              
input            lsu_idu_wb_pipe3_fwd_vreg_vld;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg;               
input   [63 :0]  lsu_idu_wb_pipe3_wb_preg_data;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup0;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup1;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup2;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup3;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_preg_dup4;          
input   [95 :0]  lsu_idu_wb_pipe3_wb_preg_expand;        
input            lsu_idu_wb_pipe3_wb_preg_vld;           
input            lsu_idu_wb_pipe3_wb_preg_vld_dup0;      
input            lsu_idu_wb_pipe3_wb_preg_vld_dup1;      
input            lsu_idu_wb_pipe3_wb_preg_vld_dup2;      
input            lsu_idu_wb_pipe3_wb_preg_vld_dup3;      
input            lsu_idu_wb_pipe3_wb_preg_vld_dup4;      
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup0;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup1;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup2;          
input   [6  :0]  lsu_idu_wb_pipe3_wb_vreg_dup3;          
input   [63 :0]  lsu_idu_wb_pipe3_wb_vreg_fr_data;       
input   [63 :0]  lsu_idu_wb_pipe3_wb_vreg_fr_expand;     
input            lsu_idu_wb_pipe3_wb_vreg_fr_vld;        
input            lsu_idu_wb_pipe3_wb_vreg_vld_dup0;      
input            lsu_idu_wb_pipe3_wb_vreg_vld_dup1;      
input            lsu_idu_wb_pipe3_wb_vreg_vld_dup2;      
input            lsu_idu_wb_pipe3_wb_vreg_vld_dup3;      
input   [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr0_data;      
input   [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr0_expand;    
input            lsu_idu_wb_pipe3_wb_vreg_vr0_vld;       
input   [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr1_data;      
input   [63 :0]  lsu_idu_wb_pipe3_wb_vreg_vr1_expand;    
input            lsu_idu_wb_pipe3_wb_vreg_vr1_vld;       
input            pad_yy_icg_scan_en;                     
input   [4  :0]  rtu_idu_alloc_ereg0;                    
input            rtu_idu_alloc_ereg0_vld;                
input   [4  :0]  rtu_idu_alloc_ereg1;                    
input            rtu_idu_alloc_ereg1_vld;                
input   [4  :0]  rtu_idu_alloc_ereg2;                    
input            rtu_idu_alloc_ereg2_vld;                
input   [4  :0]  rtu_idu_alloc_ereg3;                    
input            rtu_idu_alloc_ereg3_vld;                
input   [5  :0]  rtu_idu_alloc_freg0;                    
input            rtu_idu_alloc_freg0_vld;                
input   [5  :0]  rtu_idu_alloc_freg1;                    
input            rtu_idu_alloc_freg1_vld;                
input   [5  :0]  rtu_idu_alloc_freg2;                    
input            rtu_idu_alloc_freg2_vld;                
input   [5  :0]  rtu_idu_alloc_freg3;                    
input            rtu_idu_alloc_freg3_vld;                
input   [6  :0]  rtu_idu_alloc_preg0;                    
input            rtu_idu_alloc_preg0_vld;                
input   [6  :0]  rtu_idu_alloc_preg1;                    
input            rtu_idu_alloc_preg1_vld;                
input   [6  :0]  rtu_idu_alloc_preg2;                    
input            rtu_idu_alloc_preg2_vld;                
input   [6  :0]  rtu_idu_alloc_preg3;                    
input            rtu_idu_alloc_preg3_vld;                
input   [5  :0]  rtu_idu_alloc_vreg0;                    
input            rtu_idu_alloc_vreg0_vld;                
input   [5  :0]  rtu_idu_alloc_vreg1;                    
input            rtu_idu_alloc_vreg1_vld;                
input   [5  :0]  rtu_idu_alloc_vreg2;                    
input            rtu_idu_alloc_vreg2_vld;                
input   [5  :0]  rtu_idu_alloc_vreg3;                    
input            rtu_idu_alloc_vreg3_vld;                
input            rtu_idu_flush_fe;                       
input            rtu_idu_flush_is;                       
input            rtu_idu_flush_stall;                    
input            rtu_idu_pst_empty;                      
input   [31 :0]  rtu_idu_pst_ereg_retired_released_wb;   
input            rtu_idu_retire0_inst_vld;               
input            rtu_idu_retire_int_vld;                 
input            rtu_idu_rob_empty;                      
input            rtu_idu_rob_full;                       
input   [6  :0]  rtu_idu_rob_inst0_iid;                  
input   [6  :0]  rtu_idu_rob_inst1_iid;                  
input   [6  :0]  rtu_idu_rob_inst2_iid;                  
input   [6  :0]  rtu_idu_rob_inst3_iid;                  
input   [4  :0]  rtu_idu_rt_recover_ereg;                
input   [191:0]  rtu_idu_rt_recover_freg;                
input   [223:0]  rtu_idu_rt_recover_preg;                
input   [191:0]  rtu_idu_rt_recover_vreg;                
input            rtu_idu_srt_en;                         
input            rtu_yy_xx_dbgon;                        
input            rtu_yy_xx_flush;                        
input            vfpu_idu_ex1_pipe6_data_vld_dup0;       
input            vfpu_idu_ex1_pipe6_data_vld_dup1;       
input            vfpu_idu_ex1_pipe6_data_vld_dup2;       
input            vfpu_idu_ex1_pipe6_data_vld_dup3;       
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dup0;  
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dup1;  
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dup2;  
input            vfpu_idu_ex1_pipe6_fmla_data_vld_dup3;  
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0;  
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1;  
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2;  
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3;  
input            vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4;  
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dup0;           
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dup1;           
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dup2;           
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dup3;           
input   [6  :0]  vfpu_idu_ex1_pipe6_preg_dup4;           
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup0;           
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup1;           
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup2;           
input   [6  :0]  vfpu_idu_ex1_pipe6_vreg_dup3;           
input            vfpu_idu_ex1_pipe7_data_vld_dup0;       
input            vfpu_idu_ex1_pipe7_data_vld_dup1;       
input            vfpu_idu_ex1_pipe7_data_vld_dup2;       
input            vfpu_idu_ex1_pipe7_data_vld_dup3;       
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dup0;  
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dup1;  
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dup2;  
input            vfpu_idu_ex1_pipe7_fmla_data_vld_dup3;  
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0;  
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1;  
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2;  
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3;  
input            vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4;  
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dup0;           
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dup1;           
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dup2;           
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dup3;           
input   [6  :0]  vfpu_idu_ex1_pipe7_preg_dup4;           
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup0;           
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup1;           
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup2;           
input   [6  :0]  vfpu_idu_ex1_pipe7_vreg_dup3;           
input            vfpu_idu_ex2_pipe6_data_vld_dup0;       
input            vfpu_idu_ex2_pipe6_data_vld_dup1;       
input            vfpu_idu_ex2_pipe6_data_vld_dup2;       
input            vfpu_idu_ex2_pipe6_data_vld_dup3;       
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dup0;  
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dup1;  
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dup2;  
input            vfpu_idu_ex2_pipe6_fmla_data_vld_dup3;  
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup0;           
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup1;           
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup2;           
input   [6  :0]  vfpu_idu_ex2_pipe6_vreg_dup3;           
input            vfpu_idu_ex2_pipe7_data_vld_dup0;       
input            vfpu_idu_ex2_pipe7_data_vld_dup1;       
input            vfpu_idu_ex2_pipe7_data_vld_dup2;       
input            vfpu_idu_ex2_pipe7_data_vld_dup3;       
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dup0;  
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dup1;  
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dup2;  
input            vfpu_idu_ex2_pipe7_fmla_data_vld_dup3;  
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup0;           
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup1;           
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup2;           
input   [6  :0]  vfpu_idu_ex2_pipe7_vreg_dup3;           
input            vfpu_idu_ex3_pipe6_data_vld_dup0;       
input            vfpu_idu_ex3_pipe6_data_vld_dup1;       
input            vfpu_idu_ex3_pipe6_data_vld_dup2;       
input            vfpu_idu_ex3_pipe6_data_vld_dup3;       
input   [6  :0]  vfpu_idu_ex3_pipe6_fwd_vreg;            
input   [63 :0]  vfpu_idu_ex3_pipe6_fwd_vreg_fr_data;    
input            vfpu_idu_ex3_pipe6_fwd_vreg_vld;        
input   [63 :0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data;   
input   [63 :0]  vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data;   
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup0;           
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup1;           
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup2;           
input   [6  :0]  vfpu_idu_ex3_pipe6_vreg_dup3;           
input            vfpu_idu_ex3_pipe7_data_vld_dup0;       
input            vfpu_idu_ex3_pipe7_data_vld_dup1;       
input            vfpu_idu_ex3_pipe7_data_vld_dup2;       
input            vfpu_idu_ex3_pipe7_data_vld_dup3;       
input   [6  :0]  vfpu_idu_ex3_pipe7_fwd_vreg;            
input   [63 :0]  vfpu_idu_ex3_pipe7_fwd_vreg_fr_data;    
input            vfpu_idu_ex3_pipe7_fwd_vreg_vld;        
input   [63 :0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data;   
input   [63 :0]  vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data;   
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup0;           
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup1;           
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup2;           
input   [6  :0]  vfpu_idu_ex3_pipe7_vreg_dup3;           
input   [6  :0]  vfpu_idu_ex4_pipe6_fwd_vreg;            
input   [63 :0]  vfpu_idu_ex4_pipe6_fwd_vreg_fr_data;    
input            vfpu_idu_ex4_pipe6_fwd_vreg_vld;        
input   [63 :0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data;   
input   [63 :0]  vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data;   
input   [6  :0]  vfpu_idu_ex4_pipe7_fwd_vreg;            
input   [63 :0]  vfpu_idu_ex4_pipe7_fwd_vreg_fr_data;    
input            vfpu_idu_ex4_pipe7_fwd_vreg_vld;        
input   [63 :0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data;   
input   [63 :0]  vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data;   
input   [6  :0]  vfpu_idu_ex5_pipe6_fwd_vreg;            
input            vfpu_idu_ex5_pipe6_fwd_vreg_vld;        
input   [4  :0]  vfpu_idu_ex5_pipe6_wb_ereg;             
input   [5  :0]  vfpu_idu_ex5_pipe6_wb_ereg_data;        
input            vfpu_idu_ex5_pipe6_wb_ereg_vld;         
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup0;        
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup1;        
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup2;        
input   [6  :0]  vfpu_idu_ex5_pipe6_wb_vreg_dup3;        
input   [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_data;     
input   [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_fr_expand;   
input            vfpu_idu_ex5_pipe6_wb_vreg_fr_vld;      
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0;    
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1;    
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2;    
input            vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3;    
input   [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_data;    
input   [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand;  
input            vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld;     
input   [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_data;    
input   [63 :0]  vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand;  
input            vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld;     
input   [6  :0]  vfpu_idu_ex5_pipe7_fwd_vreg;            
input            vfpu_idu_ex5_pipe7_fwd_vreg_vld;        
input   [4  :0]  vfpu_idu_ex5_pipe7_wb_ereg;             
input   [5  :0]  vfpu_idu_ex5_pipe7_wb_ereg_data;        
input            vfpu_idu_ex5_pipe7_wb_ereg_vld;         
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup0;        
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup1;        
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup2;        
input   [6  :0]  vfpu_idu_ex5_pipe7_wb_vreg_dup3;        
input   [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_data;     
input   [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_fr_expand;   
input            vfpu_idu_ex5_pipe7_wb_vreg_fr_vld;      
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0;    
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1;    
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2;    
input            vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3;    
input   [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_data;    
input   [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand;  
input            vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld;     
input   [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_data;    
input   [63 :0]  vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand;  
input            vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld;     
input            vfpu_idu_pipe6_vmla_srcv2_no_fwd;       
input            vfpu_idu_pipe7_vmla_srcv2_no_fwd;       
input            vfpu_idu_vdiv_busy;                     
input            vfpu_idu_vdiv_wb_stall;                 
output  [6  :0]  idu_cp0_fesr_acc_updt_val;              
output           idu_cp0_fesr_acc_updt_vld;              
output  [4  :0]  idu_cp0_rf_func;                        
output           idu_cp0_rf_gateclk_sel;                 
output  [6  :0]  idu_cp0_rf_iid;                         
output  [31 :0]  idu_cp0_rf_opcode;                      
output  [6  :0]  idu_cp0_rf_preg;                        
output           idu_cp0_rf_sel;                         
output  [63 :0]  idu_cp0_rf_src0;                        
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
output           idu_ifu_id_bypass_stall;                
output           idu_ifu_id_stall;                       
output           idu_iu_is_div_gateclk_issue;            
output           idu_iu_is_div_issue;                    
output  [2  :0]  idu_iu_is_pcfifo_inst_num;              
output           idu_iu_is_pcfifo_inst_vld;              
output           idu_iu_rf_bju_gateclk_sel;              
output           idu_iu_rf_bju_sel;                      
output           idu_iu_rf_div_gateclk_sel;              
output           idu_iu_rf_div_sel;                      
output           idu_iu_rf_mult_gateclk_sel;             
output           idu_iu_rf_mult_sel;                     
output           idu_iu_rf_pipe0_alu_short;              
output           idu_iu_rf_pipe0_cbus_gateclk_sel;       
output  [6  :0]  idu_iu_rf_pipe0_dst_preg;               
output           idu_iu_rf_pipe0_dst_vld;                
output  [6  :0]  idu_iu_rf_pipe0_dst_vreg;               
output           idu_iu_rf_pipe0_dstv_vld;               
output  [4  :0]  idu_iu_rf_pipe0_expt_vec;               
output           idu_iu_rf_pipe0_expt_vld;               
output  [4  :0]  idu_iu_rf_pipe0_func;                   
output           idu_iu_rf_pipe0_gateclk_sel;            
output           idu_iu_rf_pipe0_high_hw_expt;           
output  [6  :0]  idu_iu_rf_pipe0_iid;                    
output  [5  :0]  idu_iu_rf_pipe0_imm;                    
output  [31 :0]  idu_iu_rf_pipe0_opcode;                 
output  [4  :0]  idu_iu_rf_pipe0_pid;                    
output  [20 :0]  idu_iu_rf_pipe0_rslt_sel;               
output           idu_iu_rf_pipe0_sel;                    
output  [19 :0]  idu_iu_rf_pipe0_special_imm;            
output  [63 :0]  idu_iu_rf_pipe0_src0;                   
output  [63 :0]  idu_iu_rf_pipe0_src1;                   
output  [63 :0]  idu_iu_rf_pipe0_src1_no_imm;            
output  [63 :0]  idu_iu_rf_pipe0_src2;                   
output  [7  :0]  idu_iu_rf_pipe0_vl;                     
output  [1  :0]  idu_iu_rf_pipe0_vlmul;                  
output  [2  :0]  idu_iu_rf_pipe0_vsew;                   
output           idu_iu_rf_pipe1_alu_short;              
output           idu_iu_rf_pipe1_cbus_gateclk_sel;       
output  [6  :0]  idu_iu_rf_pipe1_dst_preg;               
output           idu_iu_rf_pipe1_dst_vld;                
output  [6  :0]  idu_iu_rf_pipe1_dst_vreg;               
output           idu_iu_rf_pipe1_dstv_vld;               
output  [4  :0]  idu_iu_rf_pipe1_func;                   
output           idu_iu_rf_pipe1_gateclk_sel;            
output  [6  :0]  idu_iu_rf_pipe1_iid;                    
output  [5  :0]  idu_iu_rf_pipe1_imm;                    
output  [6  :0]  idu_iu_rf_pipe1_mla_src2_preg;          
output           idu_iu_rf_pipe1_mla_src2_vld;           
output  [7  :0]  idu_iu_rf_pipe1_mult_func;              
output  [20 :0]  idu_iu_rf_pipe1_rslt_sel;               
output           idu_iu_rf_pipe1_sel;                    
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
output           idu_iu_rf_special_gateclk_sel;          
output           idu_iu_rf_special_sel;                  
output           idu_lsu_rf_pipe3_already_da;            
output           idu_lsu_rf_pipe3_atomic;                
output           idu_lsu_rf_pipe3_bkpta_data;            
output           idu_lsu_rf_pipe3_bkptb_data;            
output           idu_lsu_rf_pipe3_gateclk_sel;           
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
output           idu_lsu_rf_pipe3_sel;                   
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
output           idu_lsu_rf_pipe4_gateclk_sel;           
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
output           idu_lsu_rf_pipe4_sel;                   
output  [3  :0]  idu_lsu_rf_pipe4_shift;                 
output           idu_lsu_rf_pipe4_spec_fail;             
output           idu_lsu_rf_pipe4_split;                 
output  [63 :0]  idu_lsu_rf_pipe4_src0;                  
output  [63 :0]  idu_lsu_rf_pipe4_src1;                  
output           idu_lsu_rf_pipe4_st;                    
output           idu_lsu_rf_pipe4_staddr;                
output           idu_lsu_rf_pipe4_sync_fence;            
output           idu_lsu_rf_pipe4_unalign_2nd;           
output           idu_lsu_rf_pipe5_gateclk_sel;           
output  [11 :0]  idu_lsu_rf_pipe5_sdiq_entry;            
output           idu_lsu_rf_pipe5_sel;                   
output  [63 :0]  idu_lsu_rf_pipe5_src0;                  
output  [63 :0]  idu_lsu_rf_pipe5_srcv0_fr;              
output           idu_lsu_rf_pipe5_srcv0_fr_vld;          
output           idu_lsu_rf_pipe5_srcv0_vld;             
output  [63 :0]  idu_lsu_rf_pipe5_srcv0_vr0;             
output  [63 :0]  idu_lsu_rf_pipe5_srcv0_vr1;             
output           idu_lsu_rf_pipe5_stdata1_vld;           
output           idu_lsu_rf_pipe5_unalign;               
output           idu_lsu_vmb_create0_dp_en;              
output           idu_lsu_vmb_create0_dst_ready;          
output           idu_lsu_vmb_create0_en;                 
output           idu_lsu_vmb_create0_gateclk_en;         
output  [11 :0]  idu_lsu_vmb_create0_sdiq_entry;         
output  [6  :0]  idu_lsu_vmb_create0_split_num;          
output           idu_lsu_vmb_create0_unit_stride;        
output           idu_lsu_vmb_create0_vamo;               
output  [7  :0]  idu_lsu_vmb_create0_vl;                 
output  [5  :0]  idu_lsu_vmb_create0_vreg;               
output  [1  :0]  idu_lsu_vmb_create0_vsew;               
output           idu_lsu_vmb_create1_dp_en;              
output           idu_lsu_vmb_create1_dst_ready;          
output           idu_lsu_vmb_create1_en;                 
output           idu_lsu_vmb_create1_gateclk_en;         
output  [11 :0]  idu_lsu_vmb_create1_sdiq_entry;         
output  [6  :0]  idu_lsu_vmb_create1_split_num;          
output           idu_lsu_vmb_create1_unit_stride;        
output           idu_lsu_vmb_create1_vamo;               
output  [7  :0]  idu_lsu_vmb_create1_vl;                 
output  [5  :0]  idu_lsu_vmb_create1_vreg;               
output  [1  :0]  idu_lsu_vmb_create1_vsew;               
output           idu_rtu_fence_idle;                     
output           idu_rtu_ir_ereg0_alloc_vld;             
output           idu_rtu_ir_ereg1_alloc_vld;             
output           idu_rtu_ir_ereg2_alloc_vld;             
output           idu_rtu_ir_ereg3_alloc_vld;             
output           idu_rtu_ir_ereg_alloc_gateclk_vld;      
output           idu_rtu_ir_freg0_alloc_vld;             
output           idu_rtu_ir_freg1_alloc_vld;             
output           idu_rtu_ir_freg2_alloc_vld;             
output           idu_rtu_ir_freg3_alloc_vld;             
output           idu_rtu_ir_freg_alloc_gateclk_vld;      
output           idu_rtu_ir_preg0_alloc_vld;             
output           idu_rtu_ir_preg1_alloc_vld;             
output           idu_rtu_ir_preg2_alloc_vld;             
output           idu_rtu_ir_preg3_alloc_vld;             
output           idu_rtu_ir_preg_alloc_gateclk_vld;      
output           idu_rtu_ir_vreg0_alloc_vld;             
output           idu_rtu_ir_vreg1_alloc_vld;             
output           idu_rtu_ir_vreg2_alloc_vld;             
output           idu_rtu_ir_vreg3_alloc_vld;             
output           idu_rtu_ir_vreg_alloc_gateclk_vld;      
output  [4  :0]  idu_rtu_pst_dis_inst0_dst_reg;          
output  [4  :0]  idu_rtu_pst_dis_inst0_dstv_reg;         
output  [4  :0]  idu_rtu_pst_dis_inst0_ereg;             
output  [6  :0]  idu_rtu_pst_dis_inst0_ereg_iid;         
output           idu_rtu_pst_dis_inst0_ereg_vld;         
output           idu_rtu_pst_dis_inst0_freg_vld;         
output  [6  :0]  idu_rtu_pst_dis_inst0_preg;             
output  [6  :0]  idu_rtu_pst_dis_inst0_preg_iid;         
output           idu_rtu_pst_dis_inst0_preg_vld;         
output  [4  :0]  idu_rtu_pst_dis_inst0_rel_ereg;         
output  [6  :0]  idu_rtu_pst_dis_inst0_rel_preg;         
output  [5  :0]  idu_rtu_pst_dis_inst0_rel_vreg;         
output  [5  :0]  idu_rtu_pst_dis_inst0_vreg;             
output  [6  :0]  idu_rtu_pst_dis_inst0_vreg_iid;         
output           idu_rtu_pst_dis_inst0_vreg_vld;         
output  [4  :0]  idu_rtu_pst_dis_inst1_dst_reg;          
output  [4  :0]  idu_rtu_pst_dis_inst1_dstv_reg;         
output  [4  :0]  idu_rtu_pst_dis_inst1_ereg;             
output  [6  :0]  idu_rtu_pst_dis_inst1_ereg_iid;         
output           idu_rtu_pst_dis_inst1_ereg_vld;         
output           idu_rtu_pst_dis_inst1_freg_vld;         
output  [6  :0]  idu_rtu_pst_dis_inst1_preg;             
output  [6  :0]  idu_rtu_pst_dis_inst1_preg_iid;         
output           idu_rtu_pst_dis_inst1_preg_vld;         
output  [4  :0]  idu_rtu_pst_dis_inst1_rel_ereg;         
output  [6  :0]  idu_rtu_pst_dis_inst1_rel_preg;         
output  [5  :0]  idu_rtu_pst_dis_inst1_rel_vreg;         
output  [5  :0]  idu_rtu_pst_dis_inst1_vreg;             
output  [6  :0]  idu_rtu_pst_dis_inst1_vreg_iid;         
output           idu_rtu_pst_dis_inst1_vreg_vld;         
output  [4  :0]  idu_rtu_pst_dis_inst2_dst_reg;          
output  [4  :0]  idu_rtu_pst_dis_inst2_dstv_reg;         
output  [4  :0]  idu_rtu_pst_dis_inst2_ereg;             
output  [6  :0]  idu_rtu_pst_dis_inst2_ereg_iid;         
output           idu_rtu_pst_dis_inst2_ereg_vld;         
output           idu_rtu_pst_dis_inst2_freg_vld;         
output  [6  :0]  idu_rtu_pst_dis_inst2_preg;             
output  [6  :0]  idu_rtu_pst_dis_inst2_preg_iid;         
output           idu_rtu_pst_dis_inst2_preg_vld;         
output  [4  :0]  idu_rtu_pst_dis_inst2_rel_ereg;         
output  [6  :0]  idu_rtu_pst_dis_inst2_rel_preg;         
output  [5  :0]  idu_rtu_pst_dis_inst2_rel_vreg;         
output  [5  :0]  idu_rtu_pst_dis_inst2_vreg;             
output  [6  :0]  idu_rtu_pst_dis_inst2_vreg_iid;         
output           idu_rtu_pst_dis_inst2_vreg_vld;         
output  [4  :0]  idu_rtu_pst_dis_inst3_dst_reg;          
output  [4  :0]  idu_rtu_pst_dis_inst3_dstv_reg;         
output  [4  :0]  idu_rtu_pst_dis_inst3_ereg;             
output  [6  :0]  idu_rtu_pst_dis_inst3_ereg_iid;         
output           idu_rtu_pst_dis_inst3_ereg_vld;         
output           idu_rtu_pst_dis_inst3_freg_vld;         
output  [6  :0]  idu_rtu_pst_dis_inst3_preg;             
output  [6  :0]  idu_rtu_pst_dis_inst3_preg_iid;         
output           idu_rtu_pst_dis_inst3_preg_vld;         
output  [4  :0]  idu_rtu_pst_dis_inst3_rel_ereg;         
output  [6  :0]  idu_rtu_pst_dis_inst3_rel_preg;         
output  [5  :0]  idu_rtu_pst_dis_inst3_rel_vreg;         
output  [5  :0]  idu_rtu_pst_dis_inst3_vreg;             
output  [6  :0]  idu_rtu_pst_dis_inst3_vreg_iid;         
output           idu_rtu_pst_dis_inst3_vreg_vld;         
output  [63 :0]  idu_rtu_pst_freg_dealloc_mask;          
output  [95 :0]  idu_rtu_pst_preg_dealloc_mask;          
output  [63 :0]  idu_rtu_pst_vreg_dealloc_mask;          
output  [39 :0]  idu_rtu_rob_create0_data;               
output           idu_rtu_rob_create0_dp_en;              
output           idu_rtu_rob_create0_en;                 
output           idu_rtu_rob_create0_gateclk_en;         
output  [39 :0]  idu_rtu_rob_create1_data;               
output           idu_rtu_rob_create1_dp_en;              
output           idu_rtu_rob_create1_en;                 
output           idu_rtu_rob_create1_gateclk_en;         
output  [39 :0]  idu_rtu_rob_create2_data;               
output           idu_rtu_rob_create2_dp_en;              
output           idu_rtu_rob_create2_en;                 
output           idu_rtu_rob_create2_gateclk_en;         
output  [39 :0]  idu_rtu_rob_create3_data;               
output           idu_rtu_rob_create3_dp_en;              
output           idu_rtu_rob_create3_en;                 
output           idu_rtu_rob_create3_gateclk_en;         
output           idu_vfpu_is_vdiv_gateclk_issue;         
output           idu_vfpu_is_vdiv_issue;                 
output  [4  :0]  idu_vfpu_rf_pipe6_dst_ereg;             
output  [6  :0]  idu_vfpu_rf_pipe6_dst_preg;             
output           idu_vfpu_rf_pipe6_dst_vld;              
output  [6  :0]  idu_vfpu_rf_pipe6_dst_vreg;             
output           idu_vfpu_rf_pipe6_dste_vld;             
output           idu_vfpu_rf_pipe6_dstv_vld;             
output  [11 :0]  idu_vfpu_rf_pipe6_eu_sel;               
output  [19 :0]  idu_vfpu_rf_pipe6_func;                 
output           idu_vfpu_rf_pipe6_gateclk_sel;          
output  [6  :0]  idu_vfpu_rf_pipe6_iid;                  
output  [2  :0]  idu_vfpu_rf_pipe6_imm0;                 
output  [5  :0]  idu_vfpu_rf_pipe6_inst_type;            
output           idu_vfpu_rf_pipe6_mla_srcv2_vld;        
output  [6  :0]  idu_vfpu_rf_pipe6_mla_srcv2_vreg;       
output  [2  :0]  idu_vfpu_rf_pipe6_ready_stage;          
output           idu_vfpu_rf_pipe6_sel;                  
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
output           idu_vfpu_rf_pipe7_gateclk_sel;          
output  [6  :0]  idu_vfpu_rf_pipe7_iid;                  
output  [2  :0]  idu_vfpu_rf_pipe7_imm0;                 
output  [5  :0]  idu_vfpu_rf_pipe7_inst_type;            
output           idu_vfpu_rf_pipe7_mla_srcv2_vld;        
output  [6  :0]  idu_vfpu_rf_pipe7_mla_srcv2_vreg;       
output  [2  :0]  idu_vfpu_rf_pipe7_ready_stage;          
output           idu_vfpu_rf_pipe7_sel;                  
output  [63 :0]  idu_vfpu_rf_pipe7_srcv0_fr;             
output  [63 :0]  idu_vfpu_rf_pipe7_srcv1_fr;             
output  [63 :0]  idu_vfpu_rf_pipe7_srcv2_fr;             
output  [2  :0]  idu_vfpu_rf_pipe7_vmla_type;            

// &Regs; @26

// &Wires; @27
wire    [7  :0]  aiq0_aiq_create0_entry;                 
wire    [7  :0]  aiq0_aiq_create1_entry;                 
wire             aiq0_ctrl_1_left_updt;                  
wire             aiq0_ctrl_empty;                        
wire    [3  :0]  aiq0_ctrl_entry_cnt_updt_val;           
wire             aiq0_ctrl_entry_cnt_updt_vld;           
wire             aiq0_ctrl_full;                         
wire             aiq0_ctrl_full_updt;                    
wire             aiq0_ctrl_full_updt_clk_en;             
wire    [7  :0]  aiq0_dp_issue_entry;                    
wire    [226:0]  aiq0_dp_issue_read_data;                
wire    [3  :0]  aiq0_top_aiq0_entry_cnt;                
wire             aiq0_xx_gateclk_issue_en;               
wire             aiq0_xx_issue_en;                       
wire    [7  :0]  aiq1_aiq_create0_entry;                 
wire    [7  :0]  aiq1_aiq_create1_entry;                 
wire             aiq1_ctrl_1_left_updt;                  
wire             aiq1_ctrl_empty;                        
wire    [3  :0]  aiq1_ctrl_entry_cnt_updt_val;           
wire             aiq1_ctrl_entry_cnt_updt_vld;           
wire             aiq1_ctrl_full;                         
wire             aiq1_ctrl_full_updt;                    
wire             aiq1_ctrl_full_updt_clk_en;             
wire    [7  :0]  aiq1_dp_issue_entry;                    
wire    [213:0]  aiq1_dp_issue_read_data;                
wire    [3  :0]  aiq1_top_aiq1_entry_cnt;                
wire             aiq1_xx_gateclk_issue_en;               
wire             aiq1_xx_issue_en;                       
wire    [11 :0]  biq_aiq_create0_entry;                  
wire    [11 :0]  biq_aiq_create1_entry;                  
wire             biq_ctrl_1_left_updt;                   
wire             biq_ctrl_empty;                         
wire             biq_ctrl_full;                          
wire             biq_ctrl_full_updt;                     
wire             biq_ctrl_full_updt_clk_en;              
wire    [11 :0]  biq_dp_issue_entry;                     
wire    [81 :0]  biq_dp_issue_read_data;                 
wire    [3  :0]  biq_top_biq_entry_cnt;                  
wire             biq_xx_gateclk_issue_en;                
wire             biq_xx_issue_en;                        
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
wire             cp0_lsu_fencei_broad_dis;               
wire             cp0_lsu_fencerw_broad_dis;              
wire             cp0_lsu_tlb_broad_dis;                  
wire             cp0_yy_clk_en;                          
wire             cp0_yy_hyper;                           
wire             cpurst_b;                               
wire             ctrl_aiq0_create0_dp_en;                
wire             ctrl_aiq0_create0_en;                   
wire             ctrl_aiq0_create0_gateclk_en;           
wire             ctrl_aiq0_create1_dp_en;                
wire             ctrl_aiq0_create1_en;                   
wire             ctrl_aiq0_create1_gateclk_en;           
wire             ctrl_aiq0_rf_lch_fail_vld;              
wire    [23 :0]  ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld;     
wire    [23 :0]  ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld;     
wire             ctrl_aiq0_rf_pop_dlb_vld;               
wire             ctrl_aiq0_rf_pop_vld;                   
wire             ctrl_aiq0_stall;                        
wire             ctrl_aiq1_create0_dp_en;                
wire             ctrl_aiq1_create0_en;                   
wire             ctrl_aiq1_create0_gateclk_en;           
wire             ctrl_aiq1_create1_dp_en;                
wire             ctrl_aiq1_create1_en;                   
wire             ctrl_aiq1_create1_gateclk_en;           
wire             ctrl_aiq1_rf_lch_fail_vld;              
wire    [23 :0]  ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld;     
wire    [23 :0]  ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld;     
wire    [7  :0]  ctrl_aiq1_rf_pipe1_mla_reg_lch_vld;     
wire             ctrl_aiq1_rf_pop_dlb_vld;               
wire             ctrl_aiq1_rf_pop_vld;                   
wire             ctrl_aiq1_stall;                        
wire             ctrl_biq_create0_dp_en;                 
wire             ctrl_biq_create0_en;                    
wire             ctrl_biq_create0_gateclk_en;            
wire             ctrl_biq_create1_dp_en;                 
wire             ctrl_biq_create1_en;                    
wire             ctrl_biq_create1_gateclk_en;            
wire             ctrl_biq_rf_lch_fail_vld;               
wire    [23 :0]  ctrl_biq_rf_pipe0_alu_reg_fwd_vld;      
wire    [23 :0]  ctrl_biq_rf_pipe1_alu_reg_fwd_vld;      
wire             ctrl_biq_rf_pop_vld;                    
wire             ctrl_dp_dis_inst0_ereg_vld;             
wire             ctrl_dp_dis_inst0_freg_vld;             
wire             ctrl_dp_dis_inst0_preg_vld;             
wire             ctrl_dp_dis_inst0_vreg_vld;             
wire             ctrl_dp_dis_inst1_ereg_vld;             
wire             ctrl_dp_dis_inst1_freg_vld;             
wire             ctrl_dp_dis_inst1_preg_vld;             
wire             ctrl_dp_dis_inst1_vreg_vld;             
wire             ctrl_dp_dis_inst2_ereg_vld;             
wire             ctrl_dp_dis_inst2_freg_vld;             
wire             ctrl_dp_dis_inst2_preg_vld;             
wire             ctrl_dp_dis_inst2_vreg_vld;             
wire             ctrl_dp_dis_inst3_ereg_vld;             
wire             ctrl_dp_dis_inst3_freg_vld;             
wire             ctrl_dp_dis_inst3_preg_vld;             
wire             ctrl_dp_dis_inst3_vreg_vld;             
wire             ctrl_dp_id_debug_id_pipedown3;          
wire             ctrl_dp_id_inst0_vld;                   
wire             ctrl_dp_id_inst1_vld;                   
wire             ctrl_dp_id_inst2_vld;                   
wire             ctrl_dp_id_pipedown_1_inst;             
wire             ctrl_dp_id_pipedown_2_inst;             
wire             ctrl_dp_id_pipedown_3_inst;             
wire             ctrl_dp_id_stall;                       
wire             ctrl_dp_ir_inst0_vld;                   
wire    [1  :0]  ctrl_dp_is_dis_aiq0_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_aiq0_create1_sel;        
wire    [1  :0]  ctrl_dp_is_dis_aiq1_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_aiq1_create1_sel;        
wire    [1  :0]  ctrl_dp_is_dis_biq_create0_sel;         
wire    [1  :0]  ctrl_dp_is_dis_biq_create1_sel;         
wire    [1  :0]  ctrl_dp_is_dis_lsiq_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_lsiq_create1_sel;        
wire             ctrl_dp_is_dis_pst_create1_iid_sel;     
wire    [2  :0]  ctrl_dp_is_dis_pst_create2_iid_sel;     
wire    [2  :0]  ctrl_dp_is_dis_pst_create3_iid_sel;     
wire    [1  :0]  ctrl_dp_is_dis_rob_create0_sel;         
wire    [2  :0]  ctrl_dp_is_dis_rob_create1_sel;         
wire    [1  :0]  ctrl_dp_is_dis_rob_create2_sel;         
wire    [1  :0]  ctrl_dp_is_dis_sdiq_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_sdiq_create1_sel;        
wire             ctrl_dp_is_dis_stall;                   
wire    [1  :0]  ctrl_dp_is_dis_viq0_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_viq0_create1_sel;        
wire    [1  :0]  ctrl_dp_is_dis_viq1_create0_sel;        
wire    [1  :0]  ctrl_dp_is_dis_viq1_create1_sel;        
wire    [1  :0]  ctrl_dp_is_dis_vmb_create0_sel;         
wire    [1  :0]  ctrl_dp_is_dis_vmb_create1_sel;         
wire             ctrl_dp_is_inst0_vld;                   
wire             ctrl_dp_is_inst1_vld;                   
wire             ctrl_dp_is_inst2_vld;                   
wire             ctrl_dp_is_inst3_vld;                   
wire             ctrl_dp_rf_pipe0_other_lch_fail;        
wire             ctrl_dp_rf_pipe3_other_lch_fail;        
wire             ctrl_dp_rf_pipe4_other_lch_fail;        
wire             ctrl_dp_rf_pipe5_other_lch_fail;        
wire             ctrl_dp_rf_pipe6_other_lch_fail;        
wire             ctrl_dp_rf_pipe7_other_lch_fail;        
wire             ctrl_fence_id_inst_vld;                 
wire             ctrl_fence_id_stall;                    
wire             ctrl_fence_ir_pipe_empty;               
wire             ctrl_fence_is_pipe_empty;               
wire             ctrl_id_pipedown_gateclk;               
wire             ctrl_id_pipedown_inst0_vld;             
wire             ctrl_id_pipedown_inst1_vld;             
wire             ctrl_id_pipedown_inst2_vld;             
wire             ctrl_id_pipedown_inst3_vld;             
wire             ctrl_ir_pipedown;                       
wire             ctrl_ir_pipedown_gateclk;               
wire             ctrl_ir_pipedown_inst0_vld;             
wire             ctrl_ir_pipedown_inst1_vld;             
wire             ctrl_ir_pipedown_inst2_vld;             
wire             ctrl_ir_pipedown_inst3_vld;             
wire             ctrl_ir_pre_dis_aiq0_create0_en;        
wire    [1  :0]  ctrl_ir_pre_dis_aiq0_create0_sel;       
wire             ctrl_ir_pre_dis_aiq0_create1_en;        
wire    [1  :0]  ctrl_ir_pre_dis_aiq0_create1_sel;       
wire             ctrl_ir_pre_dis_aiq1_create0_en;        
wire    [1  :0]  ctrl_ir_pre_dis_aiq1_create0_sel;       
wire             ctrl_ir_pre_dis_aiq1_create1_en;        
wire    [1  :0]  ctrl_ir_pre_dis_aiq1_create1_sel;       
wire             ctrl_ir_pre_dis_biq_create0_en;         
wire    [1  :0]  ctrl_ir_pre_dis_biq_create0_sel;        
wire             ctrl_ir_pre_dis_biq_create1_en;         
wire    [1  :0]  ctrl_ir_pre_dis_biq_create1_sel;        
wire             ctrl_ir_pre_dis_inst0_vld;              
wire             ctrl_ir_pre_dis_inst1_vld;              
wire             ctrl_ir_pre_dis_inst2_vld;              
wire             ctrl_ir_pre_dis_inst3_vld;              
wire             ctrl_ir_pre_dis_lsiq_create0_en;        
wire    [1  :0]  ctrl_ir_pre_dis_lsiq_create0_sel;       
wire             ctrl_ir_pre_dis_lsiq_create1_en;        
wire    [1  :0]  ctrl_ir_pre_dis_lsiq_create1_sel;       
wire             ctrl_ir_pre_dis_pipedown2;              
wire             ctrl_ir_pre_dis_pst_create1_iid_sel;    
wire    [2  :0]  ctrl_ir_pre_dis_pst_create2_iid_sel;    
wire    [2  :0]  ctrl_ir_pre_dis_pst_create3_iid_sel;    
wire    [1  :0]  ctrl_ir_pre_dis_rob_create0_sel;        
wire             ctrl_ir_pre_dis_rob_create1_en;         
wire    [2  :0]  ctrl_ir_pre_dis_rob_create1_sel;        
wire             ctrl_ir_pre_dis_rob_create2_en;         
wire    [1  :0]  ctrl_ir_pre_dis_rob_create2_sel;        
wire             ctrl_ir_pre_dis_rob_create3_en;         
wire             ctrl_ir_pre_dis_sdiq_create0_en;        
wire    [1  :0]  ctrl_ir_pre_dis_sdiq_create0_sel;       
wire             ctrl_ir_pre_dis_sdiq_create1_en;        
wire    [1  :0]  ctrl_ir_pre_dis_sdiq_create1_sel;       
wire             ctrl_ir_pre_dis_viq0_create0_en;        
wire    [1  :0]  ctrl_ir_pre_dis_viq0_create0_sel;       
wire             ctrl_ir_pre_dis_viq0_create1_en;        
wire    [1  :0]  ctrl_ir_pre_dis_viq0_create1_sel;       
wire             ctrl_ir_pre_dis_viq1_create0_en;        
wire    [1  :0]  ctrl_ir_pre_dis_viq1_create0_sel;       
wire             ctrl_ir_pre_dis_viq1_create1_en;        
wire    [1  :0]  ctrl_ir_pre_dis_viq1_create1_sel;       
wire             ctrl_ir_pre_dis_vmb_create0_en;         
wire    [1  :0]  ctrl_ir_pre_dis_vmb_create0_sel;        
wire             ctrl_ir_pre_dis_vmb_create1_en;         
wire    [1  :0]  ctrl_ir_pre_dis_vmb_create1_sel;        
wire             ctrl_ir_stage_stall;                    
wire             ctrl_ir_stall;                          
wire             ctrl_ir_type_stall_inst2_vld;           
wire             ctrl_ir_type_stall_inst3_vld;           
wire             ctrl_is_dis_type_stall;                 
wire             ctrl_is_inst2_vld;                      
wire             ctrl_is_inst3_vld;                      
wire             ctrl_is_stall;                          
wire             ctrl_lsiq_create0_dp_en;                
wire             ctrl_lsiq_create0_en;                   
wire             ctrl_lsiq_create0_gateclk_en;           
wire             ctrl_lsiq_create1_dp_en;                
wire             ctrl_lsiq_create1_en;                   
wire             ctrl_lsiq_create1_gateclk_en;           
wire             ctrl_lsiq_ir_bar_inst_vld;              
wire             ctrl_lsiq_is_bar_inst_vld;              
wire    [23 :0]  ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld;     
wire    [23 :0]  ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld;     
wire             ctrl_lsiq_rf_pipe3_lch_fail_vld;        
wire             ctrl_lsiq_rf_pipe4_lch_fail_vld;        
wire             ctrl_rt_inst0_vld;                      
wire             ctrl_rt_inst1_vld;                      
wire             ctrl_rt_inst2_vld;                      
wire             ctrl_rt_inst3_vld;                      
wire             ctrl_sdiq_create0_dp_en;                
wire             ctrl_sdiq_create0_en;                   
wire             ctrl_sdiq_create0_gateclk_en;           
wire             ctrl_sdiq_create1_dp_en;                
wire             ctrl_sdiq_create1_en;                   
wire             ctrl_sdiq_create1_gateclk_en;           
wire             ctrl_sdiq_rf_lch_fail_vld;              
wire    [11 :0]  ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld;     
wire    [11 :0]  ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld;     
wire             ctrl_sdiq_rf_staddr_rdy_set;            
wire             ctrl_split_long_id_inst_vld;            
wire             ctrl_split_long_id_stall;               
wire             ctrl_top_id_inst0_vld;                  
wire             ctrl_top_id_inst1_vld;                  
wire             ctrl_top_id_inst2_vld;                  
wire             ctrl_top_ir_ereg_not_vld;               
wire             ctrl_top_ir_freg_not_vld;               
wire             ctrl_top_ir_inst0_vld;                  
wire             ctrl_top_ir_inst1_vld;                  
wire             ctrl_top_ir_inst2_vld;                  
wire             ctrl_top_ir_inst3_vld;                  
wire             ctrl_top_ir_mispred_stall;              
wire             ctrl_top_ir_preg_not_vld;               
wire             ctrl_top_ir_vreg_not_vld;               
wire             ctrl_top_is_dis_pipedown2;              
wire             ctrl_top_is_inst0_vld;                  
wire             ctrl_top_is_inst1_vld;                  
wire             ctrl_top_is_inst2_vld;                  
wire             ctrl_top_is_inst3_vld;                  
wire             ctrl_top_is_iq_full;                    
wire             ctrl_top_is_vmb_full;                   
wire             ctrl_viq0_create0_dp_en;                
wire             ctrl_viq0_create0_en;                   
wire             ctrl_viq0_create0_gateclk_en;           
wire             ctrl_viq0_create1_dp_en;                
wire             ctrl_viq0_create1_en;                   
wire             ctrl_viq0_create1_gateclk_en;           
wire             ctrl_viq0_rf_lch_fail_vld;              
wire    [7  :0]  ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld;   
wire    [7  :0]  ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld;   
wire             ctrl_viq0_rf_pop_dlb_vld;               
wire             ctrl_viq0_rf_pop_vld;                   
wire             ctrl_viq0_stall;                        
wire             ctrl_viq1_create0_dp_en;                
wire             ctrl_viq1_create0_en;                   
wire             ctrl_viq1_create0_gateclk_en;           
wire             ctrl_viq1_create1_dp_en;                
wire             ctrl_viq1_create1_en;                   
wire             ctrl_viq1_create1_gateclk_en;           
wire             ctrl_viq1_rf_lch_fail_vld;              
wire    [7  :0]  ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld;   
wire    [7  :0]  ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld;   
wire             ctrl_viq1_rf_pop_dlb_vld;               
wire             ctrl_viq1_rf_pop_vld;                   
wire             ctrl_viq1_stall;                        
wire    [1  :0]  ctrl_xx_is_inst0_sel;                   
wire    [2  :0]  ctrl_xx_is_inst_sel;                    
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup0;     
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup1;     
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup2;     
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup3;     
wire             ctrl_xx_rf_pipe0_preg_lch_vld_dup4;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup0;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup1;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup2;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup3;     
wire             ctrl_xx_rf_pipe1_preg_lch_vld_dup4;     
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup0;     
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup1;     
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup2;     
wire             ctrl_xx_rf_pipe6_vmla_lch_vld_dup3;     
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup0;     
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup1;     
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup2;     
wire             ctrl_xx_rf_pipe7_vmla_lch_vld_dup3;     
wire    [226:0]  dp_aiq0_bypass_data;                    
wire    [226:0]  dp_aiq0_create0_data;                   
wire    [226:0]  dp_aiq0_create1_data;                   
wire             dp_aiq0_create_div;                     
wire             dp_aiq0_create_src0_rdy_for_bypass;     
wire             dp_aiq0_create_src1_rdy_for_bypass;     
wire             dp_aiq0_create_src2_rdy_for_bypass;     
wire    [7  :0]  dp_aiq0_rf_lch_entry;                   
wire    [2  :0]  dp_aiq0_rf_rdy_clr;                     
wire    [213:0]  dp_aiq1_bypass_data;                    
wire    [213:0]  dp_aiq1_create0_data;                   
wire    [213:0]  dp_aiq1_create1_data;                   
wire             dp_aiq1_create_alu;                     
wire             dp_aiq1_create_src0_rdy_for_bypass;     
wire             dp_aiq1_create_src1_rdy_for_bypass;     
wire             dp_aiq1_create_src2_rdy_for_bypass;     
wire    [7  :0]  dp_aiq1_rf_lch_entry;                   
wire    [2  :0]  dp_aiq1_rf_rdy_clr;                     
wire    [6  :0]  dp_aiq_dis_inst0_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst0_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst0_src2_preg;             
wire    [6  :0]  dp_aiq_dis_inst1_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst1_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst1_src2_preg;             
wire    [6  :0]  dp_aiq_dis_inst2_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst2_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst2_src2_preg;             
wire    [6  :0]  dp_aiq_dis_inst3_src0_preg;             
wire    [6  :0]  dp_aiq_dis_inst3_src1_preg;             
wire    [6  :0]  dp_aiq_dis_inst3_src2_preg;             
wire             dp_aiq_sdiq_create0_src_sel;            
wire             dp_aiq_sdiq_create1_src_sel;            
wire    [81 :0]  dp_biq_bypass_data;                     
wire    [81 :0]  dp_biq_create0_data;                    
wire    [81 :0]  dp_biq_create1_data;                    
wire             dp_biq_create_src0_rdy_for_bypass;      
wire             dp_biq_create_src1_rdy_for_bypass;      
wire    [11 :0]  dp_biq_rf_lch_entry;                    
wire    [1  :0]  dp_biq_rf_rdy_clr;                      
wire             dp_ctrl_id_inst0_fence;                 
wire             dp_ctrl_id_inst0_normal;                
wire             dp_ctrl_id_inst0_split_long;            
wire             dp_ctrl_id_inst0_split_short;           
wire             dp_ctrl_id_inst1_fence;                 
wire             dp_ctrl_id_inst1_normal;                
wire             dp_ctrl_id_inst1_split_long;            
wire             dp_ctrl_id_inst1_split_short;           
wire             dp_ctrl_id_inst2_fence;                 
wire             dp_ctrl_id_inst2_normal;                
wire             dp_ctrl_id_inst2_split_long;            
wire             dp_ctrl_id_inst2_split_short;           
wire             dp_ctrl_ir_inst0_bar;                   
wire    [12 :0]  dp_ctrl_ir_inst0_ctrl_info;             
wire             dp_ctrl_ir_inst0_dst_vld;               
wire             dp_ctrl_ir_inst0_dst_x0;                
wire             dp_ctrl_ir_inst0_dste_vld;              
wire             dp_ctrl_ir_inst0_dstf_vld;              
wire             dp_ctrl_ir_inst0_dstv_vld;              
wire    [6  :0]  dp_ctrl_ir_inst0_hpcp_type;             
wire             dp_ctrl_ir_inst1_bar;                   
wire    [12 :0]  dp_ctrl_ir_inst1_ctrl_info;             
wire             dp_ctrl_ir_inst1_dst_vld;               
wire             dp_ctrl_ir_inst1_dst_x0;                
wire             dp_ctrl_ir_inst1_dste_vld;              
wire             dp_ctrl_ir_inst1_dstf_vld;              
wire             dp_ctrl_ir_inst1_dstv_vld;              
wire    [6  :0]  dp_ctrl_ir_inst1_hpcp_type;             
wire             dp_ctrl_ir_inst2_bar;                   
wire    [12 :0]  dp_ctrl_ir_inst2_ctrl_info;             
wire             dp_ctrl_ir_inst2_dst_vld;               
wire             dp_ctrl_ir_inst2_dst_x0;                
wire             dp_ctrl_ir_inst2_dste_vld;              
wire             dp_ctrl_ir_inst2_dstf_vld;              
wire             dp_ctrl_ir_inst2_dstv_vld;              
wire    [6  :0]  dp_ctrl_ir_inst2_hpcp_type;             
wire             dp_ctrl_ir_inst3_bar;                   
wire    [12 :0]  dp_ctrl_ir_inst3_ctrl_info;             
wire             dp_ctrl_ir_inst3_dst_vld;               
wire             dp_ctrl_ir_inst3_dst_x0;                
wire             dp_ctrl_ir_inst3_dste_vld;              
wire             dp_ctrl_ir_inst3_dstf_vld;              
wire             dp_ctrl_ir_inst3_dstv_vld;              
wire    [6  :0]  dp_ctrl_ir_inst3_hpcp_type;             
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
wire    [12 :0]  dp_ctrl_is_dis_inst2_ctrl_info;         
wire    [12 :0]  dp_ctrl_is_dis_inst3_ctrl_info;         
wire             dp_ctrl_is_inst0_bar;                   
wire             dp_ctrl_is_inst0_dst_vld;               
wire             dp_ctrl_is_inst0_dste_vld;              
wire             dp_ctrl_is_inst0_dstv_vec;              
wire             dp_ctrl_is_inst0_dstv_vld;              
wire             dp_ctrl_is_inst0_pcfifo;                
wire             dp_ctrl_is_inst1_bar;                   
wire             dp_ctrl_is_inst1_dst_vld;               
wire             dp_ctrl_is_inst1_dste_vld;              
wire             dp_ctrl_is_inst1_dstv_vec;              
wire             dp_ctrl_is_inst1_dstv_vld;              
wire             dp_ctrl_is_inst1_pcfifo;                
wire             dp_ctrl_is_inst2_bar;                   
wire             dp_ctrl_is_inst2_dst_vld;               
wire             dp_ctrl_is_inst2_dste_vld;              
wire             dp_ctrl_is_inst2_dstv_vec;              
wire             dp_ctrl_is_inst2_dstv_vld;              
wire             dp_ctrl_is_inst2_pcfifo;                
wire             dp_ctrl_is_inst3_bar;                   
wire             dp_ctrl_is_inst3_dst_vld;               
wire             dp_ctrl_is_inst3_dste_vld;              
wire             dp_ctrl_is_inst3_dstv_vec;              
wire             dp_ctrl_is_inst3_dstv_vld;              
wire             dp_ctrl_is_inst3_pcfifo;                
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
wire             dp_fence_id_bkpta_inst;                 
wire             dp_fence_id_bkptb_inst;                 
wire    [2  :0]  dp_fence_id_fence_type;                 
wire    [31 :0]  dp_fence_id_inst;                       
wire    [14 :0]  dp_fence_id_pc;                         
wire    [7  :0]  dp_fence_id_vl;                         
wire             dp_fence_id_vl_pred;                    
wire    [1  :0]  dp_fence_id_vlmul;                      
wire    [2  :0]  dp_fence_id_vsew;                       
wire    [4  :0]  dp_frt_inst0_dst_ereg;                  
wire    [5  :0]  dp_frt_inst0_dst_freg;                  
wire             dp_frt_inst0_dste_vld;                  
wire    [5  :0]  dp_frt_inst0_dstf_reg;                  
wire             dp_frt_inst0_dstf_vld;                  
wire             dp_frt_inst0_fmla;                      
wire             dp_frt_inst0_fmov;                      
wire    [5  :0]  dp_frt_inst0_srcf0_reg;                 
wire             dp_frt_inst0_srcf0_vld;                 
wire    [5  :0]  dp_frt_inst0_srcf1_reg;                 
wire             dp_frt_inst0_srcf1_vld;                 
wire    [5  :0]  dp_frt_inst0_srcf2_reg;                 
wire             dp_frt_inst0_srcf2_vld;                 
wire    [4  :0]  dp_frt_inst1_dst_ereg;                  
wire    [5  :0]  dp_frt_inst1_dst_freg;                  
wire             dp_frt_inst1_dste_vld;                  
wire    [5  :0]  dp_frt_inst1_dstf_reg;                  
wire             dp_frt_inst1_dstf_vld;                  
wire             dp_frt_inst1_fmla;                      
wire             dp_frt_inst1_fmov;                      
wire    [5  :0]  dp_frt_inst1_srcf0_reg;                 
wire             dp_frt_inst1_srcf0_vld;                 
wire    [5  :0]  dp_frt_inst1_srcf1_reg;                 
wire             dp_frt_inst1_srcf1_vld;                 
wire    [5  :0]  dp_frt_inst1_srcf2_reg;                 
wire             dp_frt_inst1_srcf2_vld;                 
wire    [4  :0]  dp_frt_inst2_dst_ereg;                  
wire    [5  :0]  dp_frt_inst2_dst_freg;                  
wire             dp_frt_inst2_dste_vld;                  
wire    [5  :0]  dp_frt_inst2_dstf_reg;                  
wire             dp_frt_inst2_dstf_vld;                  
wire             dp_frt_inst2_fmla;                      
wire             dp_frt_inst2_fmov;                      
wire    [5  :0]  dp_frt_inst2_srcf0_reg;                 
wire             dp_frt_inst2_srcf0_vld;                 
wire    [5  :0]  dp_frt_inst2_srcf1_reg;                 
wire             dp_frt_inst2_srcf1_vld;                 
wire    [5  :0]  dp_frt_inst2_srcf2_reg;                 
wire             dp_frt_inst2_srcf2_vld;                 
wire    [4  :0]  dp_frt_inst3_dst_ereg;                  
wire    [5  :0]  dp_frt_inst3_dst_freg;                  
wire             dp_frt_inst3_dste_vld;                  
wire    [5  :0]  dp_frt_inst3_dstf_reg;                  
wire             dp_frt_inst3_dstf_vld;                  
wire             dp_frt_inst3_fmla;                      
wire    [5  :0]  dp_frt_inst3_srcf0_reg;                 
wire             dp_frt_inst3_srcf0_vld;                 
wire    [5  :0]  dp_frt_inst3_srcf1_reg;                 
wire             dp_frt_inst3_srcf1_vld;                 
wire    [5  :0]  dp_frt_inst3_srcf2_reg;                 
wire             dp_frt_inst3_srcf2_vld;                 
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
wire    [16 :0]  dp_id_pipedown_dep_info;                
wire    [177:0]  dp_id_pipedown_inst0_data;              
wire    [177:0]  dp_id_pipedown_inst1_data;              
wire    [177:0]  dp_id_pipedown_inst2_data;              
wire    [177:0]  dp_id_pipedown_inst3_data;              
wire    [3  :0]  dp_ir_inst01_src_match;                 
wire    [3  :0]  dp_ir_inst02_src_match;                 
wire    [3  :0]  dp_ir_inst03_src_match;                 
wire    [270:0]  dp_ir_inst0_data;                       
wire    [3  :0]  dp_ir_inst12_src_match;                 
wire    [3  :0]  dp_ir_inst13_src_match;                 
wire    [270:0]  dp_ir_inst1_data;                       
wire    [3  :0]  dp_ir_inst23_src_match;                 
wire    [270:0]  dp_ir_inst2_data;                       
wire    [270:0]  dp_ir_inst3_data;                       
wire    [162:0]  dp_lsiq_bypass_data;                    
wire             dp_lsiq_create0_bar;                    
wire    [162:0]  dp_lsiq_create0_data;                   
wire             dp_lsiq_create0_load;                   
wire             dp_lsiq_create0_no_spec;                
wire             dp_lsiq_create0_src0_rdy_for_bypass;    
wire             dp_lsiq_create0_src1_rdy_for_bypass;    
wire             dp_lsiq_create0_srcvm_rdy_for_bypass;   
wire             dp_lsiq_create0_store;                  
wire             dp_lsiq_create1_bar;                    
wire    [162:0]  dp_lsiq_create1_data;                   
wire             dp_lsiq_create1_load;                   
wire             dp_lsiq_create1_no_spec;                
wire             dp_lsiq_create1_store;                  
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
wire    [16 :0]  dp_rt_dep_info;                         
wire    [6  :0]  dp_rt_inst0_dst_preg;                   
wire    [5  :0]  dp_rt_inst0_dst_reg;                    
wire             dp_rt_inst0_dst_vld;                    
wire             dp_rt_inst0_mla;                        
wire             dp_rt_inst0_mov;                        
wire    [5  :0]  dp_rt_inst0_src0_reg;                   
wire             dp_rt_inst0_src0_vld;                   
wire    [5  :0]  dp_rt_inst0_src1_reg;                   
wire             dp_rt_inst0_src1_vld;                   
wire             dp_rt_inst0_src2_vld;                   
wire    [6  :0]  dp_rt_inst1_dst_preg;                   
wire    [5  :0]  dp_rt_inst1_dst_reg;                    
wire             dp_rt_inst1_dst_vld;                    
wire             dp_rt_inst1_mla;                        
wire             dp_rt_inst1_mov;                        
wire    [5  :0]  dp_rt_inst1_src0_reg;                   
wire             dp_rt_inst1_src0_vld;                   
wire    [5  :0]  dp_rt_inst1_src1_reg;                   
wire             dp_rt_inst1_src1_vld;                   
wire             dp_rt_inst1_src2_vld;                   
wire    [6  :0]  dp_rt_inst2_dst_preg;                   
wire    [5  :0]  dp_rt_inst2_dst_reg;                    
wire             dp_rt_inst2_dst_vld;                    
wire             dp_rt_inst2_mla;                        
wire             dp_rt_inst2_mov;                        
wire    [5  :0]  dp_rt_inst2_src0_reg;                   
wire             dp_rt_inst2_src0_vld;                   
wire    [5  :0]  dp_rt_inst2_src1_reg;                   
wire             dp_rt_inst2_src1_vld;                   
wire             dp_rt_inst2_src2_vld;                   
wire    [6  :0]  dp_rt_inst3_dst_preg;                   
wire    [5  :0]  dp_rt_inst3_dst_reg;                    
wire             dp_rt_inst3_dst_vld;                    
wire             dp_rt_inst3_mla;                        
wire    [5  :0]  dp_rt_inst3_src0_reg;                   
wire             dp_rt_inst3_src0_vld;                   
wire    [5  :0]  dp_rt_inst3_src1_reg;                   
wire             dp_rt_inst3_src1_vld;                   
wire             dp_rt_inst3_src2_vld;                   
wire    [26 :0]  dp_sdiq_create0_data;                   
wire    [26 :0]  dp_sdiq_create1_data;                   
wire    [11 :0]  dp_sdiq_rf_lch_entry;                   
wire    [1  :0]  dp_sdiq_rf_rdy_clr;                     
wire    [11 :0]  dp_sdiq_rf_sdiq_entry;                  
wire             dp_sdiq_rf_staddr1_vld;                 
wire             dp_sdiq_rf_staddr_rdy_clr;              
wire             dp_sdiq_rf_stdata1_vld;                 
wire    [150:0]  dp_viq0_bypass_data;                    
wire    [150:0]  dp_viq0_create0_data;                   
wire    [150:0]  dp_viq0_create1_data;                   
wire             dp_viq0_create_srcv0_rdy_for_bypass;    
wire             dp_viq0_create_srcv1_rdy_for_bypass;    
wire             dp_viq0_create_srcv2_rdy_for_bypass;    
wire             dp_viq0_create_srcvm_rdy_for_bypass;    
wire             dp_viq0_create_vdiv;                    
wire    [7  :0]  dp_viq0_rf_lch_entry;                   
wire    [3  :0]  dp_viq0_rf_rdy_clr;                     
wire    [149:0]  dp_viq1_bypass_data;                    
wire    [149:0]  dp_viq1_create0_data;                   
wire    [149:0]  dp_viq1_create1_data;                   
wire             dp_viq1_create_srcv0_rdy_for_bypass;    
wire             dp_viq1_create_srcv1_rdy_for_bypass;    
wire             dp_viq1_create_srcv2_rdy_for_bypass;    
wire             dp_viq1_create_srcvm_rdy_for_bypass;    
wire    [7  :0]  dp_viq1_rf_lch_entry;                   
wire    [3  :0]  dp_viq1_rf_rdy_clr;                     
wire    [6  :0]  dp_viq_dis_inst0_srcv2_vreg;            
wire    [6  :0]  dp_viq_dis_inst1_srcv2_vreg;            
wire    [6  :0]  dp_viq_dis_inst2_srcv2_vreg;            
wire    [6  :0]  dp_viq_dis_inst3_srcv2_vreg;            
wire    [5  :0]  dp_vrt_inst0_dst_vreg;                  
wire    [5  :0]  dp_vrt_inst0_dstv_reg;                  
wire             dp_vrt_inst0_dstv_vld;                  
wire    [5  :0]  dp_vrt_inst0_srcv0_reg;                 
wire             dp_vrt_inst0_srcv0_vld;                 
wire    [5  :0]  dp_vrt_inst0_srcv1_reg;                 
wire             dp_vrt_inst0_srcv1_vld;                 
wire             dp_vrt_inst0_srcv2_vld;                 
wire             dp_vrt_inst0_srcvm_vld;                 
wire             dp_vrt_inst0_vmla;                      
wire    [5  :0]  dp_vrt_inst1_dst_vreg;                  
wire    [5  :0]  dp_vrt_inst1_dstv_reg;                  
wire             dp_vrt_inst1_dstv_vld;                  
wire    [5  :0]  dp_vrt_inst1_srcv0_reg;                 
wire             dp_vrt_inst1_srcv0_vld;                 
wire    [5  :0]  dp_vrt_inst1_srcv1_reg;                 
wire             dp_vrt_inst1_srcv1_vld;                 
wire             dp_vrt_inst1_srcv2_vld;                 
wire             dp_vrt_inst1_srcvm_vld;                 
wire             dp_vrt_inst1_vmla;                      
wire    [5  :0]  dp_vrt_inst2_dst_vreg;                  
wire    [5  :0]  dp_vrt_inst2_dstv_reg;                  
wire             dp_vrt_inst2_dstv_vld;                  
wire    [5  :0]  dp_vrt_inst2_srcv0_reg;                 
wire             dp_vrt_inst2_srcv0_vld;                 
wire    [5  :0]  dp_vrt_inst2_srcv1_reg;                 
wire             dp_vrt_inst2_srcv1_vld;                 
wire             dp_vrt_inst2_srcv2_vld;                 
wire             dp_vrt_inst2_srcvm_vld;                 
wire             dp_vrt_inst2_vmla;                      
wire    [5  :0]  dp_vrt_inst3_dst_vreg;                  
wire    [5  :0]  dp_vrt_inst3_dstv_reg;                  
wire             dp_vrt_inst3_dstv_vld;                  
wire    [5  :0]  dp_vrt_inst3_srcv0_reg;                 
wire             dp_vrt_inst3_srcv0_vld;                 
wire    [5  :0]  dp_vrt_inst3_srcv1_reg;                 
wire             dp_vrt_inst3_srcv1_vld;                 
wire             dp_vrt_inst3_srcv2_vld;                 
wire             dp_vrt_inst3_srcvm_vld;                 
wire             dp_vrt_inst3_vmla;                      
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
wire             fence_ctrl_id_stall;                    
wire             fence_ctrl_inst0_vld;                   
wire             fence_ctrl_inst1_vld;                   
wire             fence_ctrl_inst2_vld;                   
wire    [177:0]  fence_dp_inst0_data;                    
wire    [177:0]  fence_dp_inst1_data;                    
wire    [177:0]  fence_dp_inst2_data;                    
wire    [2  :0]  fence_top_cur_state;                    
wire             forever_cpuclk;                         
wire             frt_dp_inst01_srcf2_match;              
wire             frt_dp_inst02_srcf2_match;              
wire             frt_dp_inst03_srcf2_match;              
wire    [4  :0]  frt_dp_inst0_rel_ereg;                  
wire    [6  :0]  frt_dp_inst0_rel_freg;                  
wire    [8  :0]  frt_dp_inst0_srcf0_data;                
wire    [8  :0]  frt_dp_inst0_srcf1_data;                
wire    [9  :0]  frt_dp_inst0_srcf2_data;                
wire             frt_dp_inst12_srcf2_match;              
wire             frt_dp_inst13_srcf2_match;              
wire    [4  :0]  frt_dp_inst1_rel_ereg;                  
wire    [6  :0]  frt_dp_inst1_rel_freg;                  
wire    [8  :0]  frt_dp_inst1_srcf0_data;                
wire    [8  :0]  frt_dp_inst1_srcf1_data;                
wire    [9  :0]  frt_dp_inst1_srcf2_data;                
wire             frt_dp_inst23_srcf2_match;              
wire    [4  :0]  frt_dp_inst2_rel_ereg;                  
wire    [6  :0]  frt_dp_inst2_rel_freg;                  
wire    [8  :0]  frt_dp_inst2_srcf0_data;                
wire    [8  :0]  frt_dp_inst2_srcf1_data;                
wire    [9  :0]  frt_dp_inst2_srcf2_data;                
wire    [4  :0]  frt_dp_inst3_rel_ereg;                  
wire    [6  :0]  frt_dp_inst3_rel_freg;                  
wire    [8  :0]  frt_dp_inst3_srcf0_data;                
wire    [8  :0]  frt_dp_inst3_srcf1_data;                
wire    [9  :0]  frt_dp_inst3_srcf2_data;                
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
wire             had_idu_debug_id_inst_en;               
wire    [63 :0]  had_idu_wbbr_data;                      
wire             had_idu_wbbr_vld;                       
wire             hpcp_idu_cnt_en;                        
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
wire    [72 :0]  ifu_idu_ib_inst0_data;                  
wire             ifu_idu_ib_inst0_vld;                   
wire    [72 :0]  ifu_idu_ib_inst1_data;                  
wire             ifu_idu_ib_inst1_vld;                   
wire    [72 :0]  ifu_idu_ib_inst2_data;                  
wire             ifu_idu_ib_inst2_vld;                   
wire             ifu_idu_ib_pipedown_gateclk;            
wire             ifu_xx_sync_reset;                      
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
wire             iu_yy_xx_cancel;                        
wire    [11 :0]  lsiq_aiq_create0_entry;                 
wire    [11 :0]  lsiq_aiq_create1_entry;                 
wire             lsiq_ctrl_1_left_updt;                  
wire             lsiq_ctrl_empty;                        
wire             lsiq_ctrl_full;                         
wire             lsiq_ctrl_full_updt;                    
wire             lsiq_ctrl_full_updt_clk_en;             
wire             lsiq_dp_create_bypass_oldest;           
wire             lsiq_dp_no_spec_store_vld;              
wire    [11 :0]  lsiq_dp_pipe3_issue_entry;              
wire    [162:0]  lsiq_dp_pipe3_issue_read_data;          
wire    [11 :0]  lsiq_dp_pipe4_issue_entry;              
wire    [162:0]  lsiq_dp_pipe4_issue_read_data;          
wire             lsiq_top_frz_entry_vld;                 
wire    [3  :0]  lsiq_top_lsiq_entry_cnt;                
wire             lsiq_xx_gateclk_issue_en;               
wire             lsiq_xx_pipe3_issue_en;                 
wire             lsiq_xx_pipe4_issue_en;                 
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
wire             pad_yy_icg_scan_en;                     
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
wire    [2  :0]  rt_dp_inst01_src_match;                 
wire    [2  :0]  rt_dp_inst02_src_match;                 
wire    [2  :0]  rt_dp_inst03_src_match;                 
wire    [6  :0]  rt_dp_inst0_rel_preg;                   
wire    [8  :0]  rt_dp_inst0_src0_data;                  
wire    [8  :0]  rt_dp_inst0_src1_data;                  
wire    [9  :0]  rt_dp_inst0_src2_data;                  
wire    [2  :0]  rt_dp_inst12_src_match;                 
wire    [2  :0]  rt_dp_inst13_src_match;                 
wire    [6  :0]  rt_dp_inst1_rel_preg;                   
wire    [8  :0]  rt_dp_inst1_src0_data;                  
wire    [8  :0]  rt_dp_inst1_src1_data;                  
wire    [9  :0]  rt_dp_inst1_src2_data;                  
wire    [2  :0]  rt_dp_inst23_src_match;                 
wire    [6  :0]  rt_dp_inst2_rel_preg;                   
wire    [8  :0]  rt_dp_inst2_src0_data;                  
wire    [8  :0]  rt_dp_inst2_src1_data;                  
wire    [9  :0]  rt_dp_inst2_src2_data;                  
wire    [6  :0]  rt_dp_inst3_rel_preg;                   
wire    [8  :0]  rt_dp_inst3_src0_data;                  
wire    [8  :0]  rt_dp_inst3_src1_data;                  
wire    [9  :0]  rt_dp_inst3_src2_data;                  
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
wire             rtu_yy_xx_dbgon;                        
wire             rtu_yy_xx_flush;                        
wire    [11 :0]  sdiq_aiq_create0_entry;                 
wire    [11 :0]  sdiq_aiq_create1_entry;                 
wire             sdiq_ctrl_1_left_updt;                  
wire             sdiq_ctrl_empty;                        
wire             sdiq_ctrl_full;                         
wire             sdiq_ctrl_full_updt;                    
wire             sdiq_ctrl_full_updt_clk_en;             
wire    [11 :0]  sdiq_dp_create0_entry;                  
wire    [11 :0]  sdiq_dp_create1_entry;                  
wire    [11 :0]  sdiq_dp_issue_entry;                    
wire    [26 :0]  sdiq_dp_issue_read_data;                
wire    [3  :0]  sdiq_top_sdiq_entry_cnt;                
wire             sdiq_xx_gateclk_issue_en;               
wire             sdiq_xx_issue_en;                       
wire             split_long_ctrl_id_stall;               
wire    [3  :0]  split_long_ctrl_inst_vld;               
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
wire             viq0_ctrl_1_left_updt;                  
wire             viq0_ctrl_empty;                        
wire    [3  :0]  viq0_ctrl_entry_cnt_updt_val;           
wire             viq0_ctrl_entry_cnt_updt_vld;           
wire             viq0_ctrl_full;                         
wire             viq0_ctrl_full_updt;                    
wire             viq0_ctrl_full_updt_clk_en;             
wire    [7  :0]  viq0_dp_issue_entry;                    
wire    [150:0]  viq0_dp_issue_read_data;                
wire    [3  :0]  viq0_top_viq0_entry_cnt;                
wire    [7  :0]  viq0_viq_create0_entry;                 
wire    [7  :0]  viq0_viq_create1_entry;                 
wire             viq0_xx_gateclk_issue_en;               
wire             viq0_xx_issue_en;                       
wire             viq1_ctrl_1_left_updt;                  
wire             viq1_ctrl_empty;                        
wire    [3  :0]  viq1_ctrl_entry_cnt_updt_val;           
wire             viq1_ctrl_entry_cnt_updt_vld;           
wire             viq1_ctrl_full;                         
wire             viq1_ctrl_full_updt;                    
wire             viq1_ctrl_full_updt_clk_en;             
wire    [7  :0]  viq1_dp_issue_entry;                    
wire    [149:0]  viq1_dp_issue_read_data;                
wire    [3  :0]  viq1_top_viq1_entry_cnt;                
wire    [7  :0]  viq1_viq_create0_entry;                 
wire    [7  :0]  viq1_viq_create1_entry;                 
wire             viq1_xx_gateclk_issue_en;               
wire             viq1_xx_issue_en;                       
wire             vrt_dp_inst01_srcv2_match;              
wire             vrt_dp_inst02_srcv2_match;              
wire             vrt_dp_inst03_srcv2_match;              
wire    [6  :0]  vrt_dp_inst0_rel_vreg;                  
wire    [8  :0]  vrt_dp_inst0_srcv0_data;                
wire    [8  :0]  vrt_dp_inst0_srcv1_data;                
wire    [9  :0]  vrt_dp_inst0_srcv2_data;                
wire    [8  :0]  vrt_dp_inst0_srcvm_data;                
wire             vrt_dp_inst12_srcv2_match;              
wire             vrt_dp_inst13_srcv2_match;              
wire    [6  :0]  vrt_dp_inst1_rel_vreg;                  
wire    [8  :0]  vrt_dp_inst1_srcv0_data;                
wire    [8  :0]  vrt_dp_inst1_srcv1_data;                
wire    [9  :0]  vrt_dp_inst1_srcv2_data;                
wire    [8  :0]  vrt_dp_inst1_srcvm_data;                
wire             vrt_dp_inst23_srcv2_match;              
wire    [6  :0]  vrt_dp_inst2_rel_vreg;                  
wire    [8  :0]  vrt_dp_inst2_srcv0_data;                
wire    [8  :0]  vrt_dp_inst2_srcv1_data;                
wire    [9  :0]  vrt_dp_inst2_srcv2_data;                
wire    [8  :0]  vrt_dp_inst2_srcvm_data;                
wire    [6  :0]  vrt_dp_inst3_rel_vreg;                  
wire    [8  :0]  vrt_dp_inst3_srcv0_data;                
wire    [8  :0]  vrt_dp_inst3_srcv1_data;                
wire    [9  :0]  vrt_dp_inst3_srcv2_data;                
wire    [8  :0]  vrt_dp_inst3_srcvm_data;                


//==========================================================
//                       ID Stage
//==========================================================
// &Instance("ct_idu_id_ctrl", "x_ct_idu_id_ctrl"); @32
ct_idu_id_ctrl  x_ct_idu_id_ctrl (
  .cp0_idu_icg_en                (cp0_idu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .ctrl_dp_id_debug_id_pipedown3 (ctrl_dp_id_debug_id_pipedown3),
  .ctrl_dp_id_inst0_vld          (ctrl_dp_id_inst0_vld         ),
  .ctrl_dp_id_inst1_vld          (ctrl_dp_id_inst1_vld         ),
  .ctrl_dp_id_inst2_vld          (ctrl_dp_id_inst2_vld         ),
  .ctrl_dp_id_pipedown_1_inst    (ctrl_dp_id_pipedown_1_inst   ),
  .ctrl_dp_id_pipedown_2_inst    (ctrl_dp_id_pipedown_2_inst   ),
  .ctrl_dp_id_pipedown_3_inst    (ctrl_dp_id_pipedown_3_inst   ),
  .ctrl_dp_id_stall              (ctrl_dp_id_stall             ),
  .ctrl_fence_id_inst_vld        (ctrl_fence_id_inst_vld       ),
  .ctrl_fence_id_stall           (ctrl_fence_id_stall          ),
  .ctrl_id_pipedown_gateclk      (ctrl_id_pipedown_gateclk     ),
  .ctrl_id_pipedown_inst0_vld    (ctrl_id_pipedown_inst0_vld   ),
  .ctrl_id_pipedown_inst1_vld    (ctrl_id_pipedown_inst1_vld   ),
  .ctrl_id_pipedown_inst2_vld    (ctrl_id_pipedown_inst2_vld   ),
  .ctrl_id_pipedown_inst3_vld    (ctrl_id_pipedown_inst3_vld   ),
  .ctrl_ir_stage_stall           (ctrl_ir_stage_stall          ),
  .ctrl_ir_stall                 (ctrl_ir_stall                ),
  .ctrl_split_long_id_inst_vld   (ctrl_split_long_id_inst_vld  ),
  .ctrl_split_long_id_stall      (ctrl_split_long_id_stall     ),
  .ctrl_top_id_inst0_vld         (ctrl_top_id_inst0_vld        ),
  .ctrl_top_id_inst1_vld         (ctrl_top_id_inst1_vld        ),
  .ctrl_top_id_inst2_vld         (ctrl_top_id_inst2_vld        ),
  .dp_ctrl_id_inst0_fence        (dp_ctrl_id_inst0_fence       ),
  .dp_ctrl_id_inst0_normal       (dp_ctrl_id_inst0_normal      ),
  .dp_ctrl_id_inst0_split_long   (dp_ctrl_id_inst0_split_long  ),
  .dp_ctrl_id_inst0_split_short  (dp_ctrl_id_inst0_split_short ),
  .dp_ctrl_id_inst1_fence        (dp_ctrl_id_inst1_fence       ),
  .dp_ctrl_id_inst1_normal       (dp_ctrl_id_inst1_normal      ),
  .dp_ctrl_id_inst1_split_long   (dp_ctrl_id_inst1_split_long  ),
  .dp_ctrl_id_inst1_split_short  (dp_ctrl_id_inst1_split_short ),
  .dp_ctrl_id_inst2_fence        (dp_ctrl_id_inst2_fence       ),
  .dp_ctrl_id_inst2_normal       (dp_ctrl_id_inst2_normal      ),
  .dp_ctrl_id_inst2_split_long   (dp_ctrl_id_inst2_split_long  ),
  .dp_ctrl_id_inst2_split_short  (dp_ctrl_id_inst2_split_short ),
  .fence_ctrl_id_stall           (fence_ctrl_id_stall          ),
  .fence_ctrl_inst0_vld          (fence_ctrl_inst0_vld         ),
  .fence_ctrl_inst1_vld          (fence_ctrl_inst1_vld         ),
  .fence_ctrl_inst2_vld          (fence_ctrl_inst2_vld         ),
  .forever_cpuclk                (forever_cpuclk               ),
  .had_idu_debug_id_inst_en      (had_idu_debug_id_inst_en     ),
  .hpcp_idu_cnt_en               (hpcp_idu_cnt_en              ),
  .idu_had_id_inst0_vld          (idu_had_id_inst0_vld         ),
  .idu_had_id_inst1_vld          (idu_had_id_inst1_vld         ),
  .idu_had_id_inst2_vld          (idu_had_id_inst2_vld         ),
  .idu_had_pipe_stall            (idu_had_pipe_stall           ),
  .idu_hpcp_backend_stall        (idu_hpcp_backend_stall       ),
  .idu_ifu_id_bypass_stall       (idu_ifu_id_bypass_stall      ),
  .idu_ifu_id_stall              (idu_ifu_id_stall             ),
  .ifu_idu_ib_inst0_vld          (ifu_idu_ib_inst0_vld         ),
  .ifu_idu_ib_inst1_vld          (ifu_idu_ib_inst1_vld         ),
  .ifu_idu_ib_inst2_vld          (ifu_idu_ib_inst2_vld         ),
  .ifu_idu_ib_pipedown_gateclk   (ifu_idu_ib_pipedown_gateclk  ),
  .iu_yy_xx_cancel               (iu_yy_xx_cancel              ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .rtu_idu_flush_fe              (rtu_idu_flush_fe             ),
  .split_long_ctrl_id_stall      (split_long_ctrl_id_stall     ),
  .split_long_ctrl_inst_vld      (split_long_ctrl_inst_vld     )
);

// &Instance("ct_idu_id_dp", "x_ct_idu_id_dp"); @33
ct_idu_id_dp  x_ct_idu_id_dp (
  .cp0_idu_cskyee                  (cp0_idu_cskyee                 ),
  .cp0_idu_frm                     (cp0_idu_frm                    ),
  .cp0_idu_fs                      (cp0_idu_fs                     ),
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_idu_vill                    (cp0_idu_vill                   ),
  .cp0_idu_vs                      (cp0_idu_vs                     ),
  .cp0_idu_vstart                  (cp0_idu_vstart                 ),
  .cp0_idu_zero_delay_move_disable (cp0_idu_zero_delay_move_disable),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .cp0_yy_hyper                    (cp0_yy_hyper                   ),
  .cpurst_b                        (cpurst_b                       ),
  .ctrl_dp_id_debug_id_pipedown3   (ctrl_dp_id_debug_id_pipedown3  ),
  .ctrl_dp_id_inst0_vld            (ctrl_dp_id_inst0_vld           ),
  .ctrl_dp_id_inst1_vld            (ctrl_dp_id_inst1_vld           ),
  .ctrl_dp_id_inst2_vld            (ctrl_dp_id_inst2_vld           ),
  .ctrl_dp_id_pipedown_1_inst      (ctrl_dp_id_pipedown_1_inst     ),
  .ctrl_dp_id_pipedown_2_inst      (ctrl_dp_id_pipedown_2_inst     ),
  .ctrl_dp_id_pipedown_3_inst      (ctrl_dp_id_pipedown_3_inst     ),
  .ctrl_dp_id_stall                (ctrl_dp_id_stall               ),
  .ctrl_split_long_id_inst_vld     (ctrl_split_long_id_inst_vld    ),
  .ctrl_split_long_id_stall        (ctrl_split_long_id_stall       ),
  .dp_ctrl_id_inst0_fence          (dp_ctrl_id_inst0_fence         ),
  .dp_ctrl_id_inst0_normal         (dp_ctrl_id_inst0_normal        ),
  .dp_ctrl_id_inst0_split_long     (dp_ctrl_id_inst0_split_long    ),
  .dp_ctrl_id_inst0_split_short    (dp_ctrl_id_inst0_split_short   ),
  .dp_ctrl_id_inst1_fence          (dp_ctrl_id_inst1_fence         ),
  .dp_ctrl_id_inst1_normal         (dp_ctrl_id_inst1_normal        ),
  .dp_ctrl_id_inst1_split_long     (dp_ctrl_id_inst1_split_long    ),
  .dp_ctrl_id_inst1_split_short    (dp_ctrl_id_inst1_split_short   ),
  .dp_ctrl_id_inst2_fence          (dp_ctrl_id_inst2_fence         ),
  .dp_ctrl_id_inst2_normal         (dp_ctrl_id_inst2_normal        ),
  .dp_ctrl_id_inst2_split_long     (dp_ctrl_id_inst2_split_long    ),
  .dp_ctrl_id_inst2_split_short    (dp_ctrl_id_inst2_split_short   ),
  .dp_fence_id_bkpta_inst          (dp_fence_id_bkpta_inst         ),
  .dp_fence_id_bkptb_inst          (dp_fence_id_bkptb_inst         ),
  .dp_fence_id_fence_type          (dp_fence_id_fence_type         ),
  .dp_fence_id_inst                (dp_fence_id_inst               ),
  .dp_fence_id_pc                  (dp_fence_id_pc                 ),
  .dp_fence_id_vl                  (dp_fence_id_vl                 ),
  .dp_fence_id_vl_pred             (dp_fence_id_vl_pred            ),
  .dp_fence_id_vlmul               (dp_fence_id_vlmul              ),
  .dp_fence_id_vsew                (dp_fence_id_vsew               ),
  .dp_id_pipedown_dep_info         (dp_id_pipedown_dep_info        ),
  .dp_id_pipedown_inst0_data       (dp_id_pipedown_inst0_data      ),
  .dp_id_pipedown_inst1_data       (dp_id_pipedown_inst1_data      ),
  .dp_id_pipedown_inst2_data       (dp_id_pipedown_inst2_data      ),
  .dp_id_pipedown_inst3_data       (dp_id_pipedown_inst3_data      ),
  .fence_dp_inst0_data             (fence_dp_inst0_data            ),
  .fence_dp_inst1_data             (fence_dp_inst1_data            ),
  .fence_dp_inst2_data             (fence_dp_inst2_data            ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .idu_had_id_inst0_info           (idu_had_id_inst0_info          ),
  .idu_had_id_inst1_info           (idu_had_id_inst1_info          ),
  .idu_had_id_inst2_info           (idu_had_id_inst2_info          ),
  .ifu_idu_ib_inst0_data           (ifu_idu_ib_inst0_data          ),
  .ifu_idu_ib_inst1_data           (ifu_idu_ib_inst1_data          ),
  .ifu_idu_ib_inst2_data           (ifu_idu_ib_inst2_data          ),
  .ifu_idu_ib_pipedown_gateclk     (ifu_idu_ib_pipedown_gateclk    ),
  .iu_yy_xx_cancel                 (iu_yy_xx_cancel                ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .rtu_idu_flush_fe                (rtu_idu_flush_fe               ),
  .split_long_ctrl_id_stall        (split_long_ctrl_id_stall       ),
  .split_long_ctrl_inst_vld        (split_long_ctrl_inst_vld       )
);

// &Instance("ct_idu_id_fence", "x_ct_idu_id_fence"); @34
ct_idu_id_fence  x_ct_idu_id_fence (
  .cp0_idu_icg_en           (cp0_idu_icg_en          ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cpurst_b                 (cpurst_b                ),
  .ctrl_fence_id_inst_vld   (ctrl_fence_id_inst_vld  ),
  .ctrl_fence_id_stall      (ctrl_fence_id_stall     ),
  .ctrl_fence_ir_pipe_empty (ctrl_fence_ir_pipe_empty),
  .ctrl_fence_is_pipe_empty (ctrl_fence_is_pipe_empty),
  .dp_fence_id_bkpta_inst   (dp_fence_id_bkpta_inst  ),
  .dp_fence_id_bkptb_inst   (dp_fence_id_bkptb_inst  ),
  .dp_fence_id_fence_type   (dp_fence_id_fence_type  ),
  .dp_fence_id_inst         (dp_fence_id_inst        ),
  .dp_fence_id_pc           (dp_fence_id_pc          ),
  .dp_fence_id_vl           (dp_fence_id_vl          ),
  .dp_fence_id_vl_pred      (dp_fence_id_vl_pred     ),
  .dp_fence_id_vlmul        (dp_fence_id_vlmul       ),
  .dp_fence_id_vsew         (dp_fence_id_vsew        ),
  .fence_ctrl_id_stall      (fence_ctrl_id_stall     ),
  .fence_ctrl_inst0_vld     (fence_ctrl_inst0_vld    ),
  .fence_ctrl_inst1_vld     (fence_ctrl_inst1_vld    ),
  .fence_ctrl_inst2_vld     (fence_ctrl_inst2_vld    ),
  .fence_dp_inst0_data      (fence_dp_inst0_data     ),
  .fence_dp_inst1_data      (fence_dp_inst1_data     ),
  .fence_dp_inst2_data      (fence_dp_inst2_data     ),
  .fence_top_cur_state      (fence_top_cur_state     ),
  .forever_cpuclk           (forever_cpuclk          ),
  .idu_had_pipeline_empty   (idu_had_pipeline_empty  ),
  .idu_hpcp_fence_sync_vld  (idu_hpcp_fence_sync_vld ),
  .idu_rtu_fence_idle       (idu_rtu_fence_idle      ),
  .iu_idu_div_busy          (iu_idu_div_busy         ),
  .iu_yy_xx_cancel          (iu_yy_xx_cancel         ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .rtu_idu_flush_fe         (rtu_idu_flush_fe        ),
  .rtu_idu_pst_empty        (rtu_idu_pst_empty       ),
  .rtu_idu_rob_empty        (rtu_idu_rob_empty       )
);


//==========================================================
//                       IR Stage
//==========================================================
// &Instance("ct_idu_ir_ctrl", "x_ct_idu_ir_ctrl"); @39
ct_idu_ir_ctrl  x_ct_idu_ir_ctrl (
  .aiq0_ctrl_entry_cnt_updt_val        (aiq0_ctrl_entry_cnt_updt_val       ),
  .aiq0_ctrl_entry_cnt_updt_vld        (aiq0_ctrl_entry_cnt_updt_vld       ),
  .aiq1_ctrl_entry_cnt_updt_val        (aiq1_ctrl_entry_cnt_updt_val       ),
  .aiq1_ctrl_entry_cnt_updt_vld        (aiq1_ctrl_entry_cnt_updt_vld       ),
  .cp0_idu_dlb_disable                 (cp0_idu_dlb_disable                ),
  .cp0_idu_icg_en                      (cp0_idu_icg_en                     ),
  .cp0_idu_rob_fold_disable            (cp0_idu_rob_fold_disable           ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .ctrl_dp_ir_inst0_vld                (ctrl_dp_ir_inst0_vld               ),
  .ctrl_fence_ir_pipe_empty            (ctrl_fence_ir_pipe_empty           ),
  .ctrl_id_pipedown_gateclk            (ctrl_id_pipedown_gateclk           ),
  .ctrl_id_pipedown_inst0_vld          (ctrl_id_pipedown_inst0_vld         ),
  .ctrl_id_pipedown_inst1_vld          (ctrl_id_pipedown_inst1_vld         ),
  .ctrl_id_pipedown_inst2_vld          (ctrl_id_pipedown_inst2_vld         ),
  .ctrl_id_pipedown_inst3_vld          (ctrl_id_pipedown_inst3_vld         ),
  .ctrl_ir_pipedown                    (ctrl_ir_pipedown                   ),
  .ctrl_ir_pipedown_gateclk            (ctrl_ir_pipedown_gateclk           ),
  .ctrl_ir_pipedown_inst0_vld          (ctrl_ir_pipedown_inst0_vld         ),
  .ctrl_ir_pipedown_inst1_vld          (ctrl_ir_pipedown_inst1_vld         ),
  .ctrl_ir_pipedown_inst2_vld          (ctrl_ir_pipedown_inst2_vld         ),
  .ctrl_ir_pipedown_inst3_vld          (ctrl_ir_pipedown_inst3_vld         ),
  .ctrl_ir_pre_dis_aiq0_create0_en     (ctrl_ir_pre_dis_aiq0_create0_en    ),
  .ctrl_ir_pre_dis_aiq0_create0_sel    (ctrl_ir_pre_dis_aiq0_create0_sel   ),
  .ctrl_ir_pre_dis_aiq0_create1_en     (ctrl_ir_pre_dis_aiq0_create1_en    ),
  .ctrl_ir_pre_dis_aiq0_create1_sel    (ctrl_ir_pre_dis_aiq0_create1_sel   ),
  .ctrl_ir_pre_dis_aiq1_create0_en     (ctrl_ir_pre_dis_aiq1_create0_en    ),
  .ctrl_ir_pre_dis_aiq1_create0_sel    (ctrl_ir_pre_dis_aiq1_create0_sel   ),
  .ctrl_ir_pre_dis_aiq1_create1_en     (ctrl_ir_pre_dis_aiq1_create1_en    ),
  .ctrl_ir_pre_dis_aiq1_create1_sel    (ctrl_ir_pre_dis_aiq1_create1_sel   ),
  .ctrl_ir_pre_dis_biq_create0_en      (ctrl_ir_pre_dis_biq_create0_en     ),
  .ctrl_ir_pre_dis_biq_create0_sel     (ctrl_ir_pre_dis_biq_create0_sel    ),
  .ctrl_ir_pre_dis_biq_create1_en      (ctrl_ir_pre_dis_biq_create1_en     ),
  .ctrl_ir_pre_dis_biq_create1_sel     (ctrl_ir_pre_dis_biq_create1_sel    ),
  .ctrl_ir_pre_dis_inst0_vld           (ctrl_ir_pre_dis_inst0_vld          ),
  .ctrl_ir_pre_dis_inst1_vld           (ctrl_ir_pre_dis_inst1_vld          ),
  .ctrl_ir_pre_dis_inst2_vld           (ctrl_ir_pre_dis_inst2_vld          ),
  .ctrl_ir_pre_dis_inst3_vld           (ctrl_ir_pre_dis_inst3_vld          ),
  .ctrl_ir_pre_dis_lsiq_create0_en     (ctrl_ir_pre_dis_lsiq_create0_en    ),
  .ctrl_ir_pre_dis_lsiq_create0_sel    (ctrl_ir_pre_dis_lsiq_create0_sel   ),
  .ctrl_ir_pre_dis_lsiq_create1_en     (ctrl_ir_pre_dis_lsiq_create1_en    ),
  .ctrl_ir_pre_dis_lsiq_create1_sel    (ctrl_ir_pre_dis_lsiq_create1_sel   ),
  .ctrl_ir_pre_dis_pipedown2           (ctrl_ir_pre_dis_pipedown2          ),
  .ctrl_ir_pre_dis_pst_create1_iid_sel (ctrl_ir_pre_dis_pst_create1_iid_sel),
  .ctrl_ir_pre_dis_pst_create2_iid_sel (ctrl_ir_pre_dis_pst_create2_iid_sel),
  .ctrl_ir_pre_dis_pst_create3_iid_sel (ctrl_ir_pre_dis_pst_create3_iid_sel),
  .ctrl_ir_pre_dis_rob_create0_sel     (ctrl_ir_pre_dis_rob_create0_sel    ),
  .ctrl_ir_pre_dis_rob_create1_en      (ctrl_ir_pre_dis_rob_create1_en     ),
  .ctrl_ir_pre_dis_rob_create1_sel     (ctrl_ir_pre_dis_rob_create1_sel    ),
  .ctrl_ir_pre_dis_rob_create2_en      (ctrl_ir_pre_dis_rob_create2_en     ),
  .ctrl_ir_pre_dis_rob_create2_sel     (ctrl_ir_pre_dis_rob_create2_sel    ),
  .ctrl_ir_pre_dis_rob_create3_en      (ctrl_ir_pre_dis_rob_create3_en     ),
  .ctrl_ir_pre_dis_sdiq_create0_en     (ctrl_ir_pre_dis_sdiq_create0_en    ),
  .ctrl_ir_pre_dis_sdiq_create0_sel    (ctrl_ir_pre_dis_sdiq_create0_sel   ),
  .ctrl_ir_pre_dis_sdiq_create1_en     (ctrl_ir_pre_dis_sdiq_create1_en    ),
  .ctrl_ir_pre_dis_sdiq_create1_sel    (ctrl_ir_pre_dis_sdiq_create1_sel   ),
  .ctrl_ir_pre_dis_viq0_create0_en     (ctrl_ir_pre_dis_viq0_create0_en    ),
  .ctrl_ir_pre_dis_viq0_create0_sel    (ctrl_ir_pre_dis_viq0_create0_sel   ),
  .ctrl_ir_pre_dis_viq0_create1_en     (ctrl_ir_pre_dis_viq0_create1_en    ),
  .ctrl_ir_pre_dis_viq0_create1_sel    (ctrl_ir_pre_dis_viq0_create1_sel   ),
  .ctrl_ir_pre_dis_viq1_create0_en     (ctrl_ir_pre_dis_viq1_create0_en    ),
  .ctrl_ir_pre_dis_viq1_create0_sel    (ctrl_ir_pre_dis_viq1_create0_sel   ),
  .ctrl_ir_pre_dis_viq1_create1_en     (ctrl_ir_pre_dis_viq1_create1_en    ),
  .ctrl_ir_pre_dis_viq1_create1_sel    (ctrl_ir_pre_dis_viq1_create1_sel   ),
  .ctrl_ir_pre_dis_vmb_create0_en      (ctrl_ir_pre_dis_vmb_create0_en     ),
  .ctrl_ir_pre_dis_vmb_create0_sel     (ctrl_ir_pre_dis_vmb_create0_sel    ),
  .ctrl_ir_pre_dis_vmb_create1_en      (ctrl_ir_pre_dis_vmb_create1_en     ),
  .ctrl_ir_pre_dis_vmb_create1_sel     (ctrl_ir_pre_dis_vmb_create1_sel    ),
  .ctrl_ir_stage_stall                 (ctrl_ir_stage_stall                ),
  .ctrl_ir_stall                       (ctrl_ir_stall                      ),
  .ctrl_ir_type_stall_inst2_vld        (ctrl_ir_type_stall_inst2_vld       ),
  .ctrl_ir_type_stall_inst3_vld        (ctrl_ir_type_stall_inst3_vld       ),
  .ctrl_is_dis_type_stall              (ctrl_is_dis_type_stall             ),
  .ctrl_is_inst2_vld                   (ctrl_is_inst2_vld                  ),
  .ctrl_is_inst3_vld                   (ctrl_is_inst3_vld                  ),
  .ctrl_is_stall                       (ctrl_is_stall                      ),
  .ctrl_lsiq_ir_bar_inst_vld           (ctrl_lsiq_ir_bar_inst_vld          ),
  .ctrl_rt_inst0_vld                   (ctrl_rt_inst0_vld                  ),
  .ctrl_rt_inst1_vld                   (ctrl_rt_inst1_vld                  ),
  .ctrl_rt_inst2_vld                   (ctrl_rt_inst2_vld                  ),
  .ctrl_rt_inst3_vld                   (ctrl_rt_inst3_vld                  ),
  .ctrl_top_ir_ereg_not_vld            (ctrl_top_ir_ereg_not_vld           ),
  .ctrl_top_ir_freg_not_vld            (ctrl_top_ir_freg_not_vld           ),
  .ctrl_top_ir_inst0_vld               (ctrl_top_ir_inst0_vld              ),
  .ctrl_top_ir_inst1_vld               (ctrl_top_ir_inst1_vld              ),
  .ctrl_top_ir_inst2_vld               (ctrl_top_ir_inst2_vld              ),
  .ctrl_top_ir_inst3_vld               (ctrl_top_ir_inst3_vld              ),
  .ctrl_top_ir_mispred_stall           (ctrl_top_ir_mispred_stall          ),
  .ctrl_top_ir_preg_not_vld            (ctrl_top_ir_preg_not_vld           ),
  .ctrl_top_ir_vreg_not_vld            (ctrl_top_ir_vreg_not_vld           ),
  .ctrl_xx_is_inst0_sel                (ctrl_xx_is_inst0_sel               ),
  .ctrl_xx_is_inst_sel                 (ctrl_xx_is_inst_sel                ),
  .dp_ctrl_ir_inst0_bar                (dp_ctrl_ir_inst0_bar               ),
  .dp_ctrl_ir_inst0_ctrl_info          (dp_ctrl_ir_inst0_ctrl_info         ),
  .dp_ctrl_ir_inst0_dst_vld            (dp_ctrl_ir_inst0_dst_vld           ),
  .dp_ctrl_ir_inst0_dst_x0             (dp_ctrl_ir_inst0_dst_x0            ),
  .dp_ctrl_ir_inst0_dste_vld           (dp_ctrl_ir_inst0_dste_vld          ),
  .dp_ctrl_ir_inst0_dstf_vld           (dp_ctrl_ir_inst0_dstf_vld          ),
  .dp_ctrl_ir_inst0_dstv_vld           (dp_ctrl_ir_inst0_dstv_vld          ),
  .dp_ctrl_ir_inst0_hpcp_type          (dp_ctrl_ir_inst0_hpcp_type         ),
  .dp_ctrl_ir_inst1_bar                (dp_ctrl_ir_inst1_bar               ),
  .dp_ctrl_ir_inst1_ctrl_info          (dp_ctrl_ir_inst1_ctrl_info         ),
  .dp_ctrl_ir_inst1_dst_vld            (dp_ctrl_ir_inst1_dst_vld           ),
  .dp_ctrl_ir_inst1_dst_x0             (dp_ctrl_ir_inst1_dst_x0            ),
  .dp_ctrl_ir_inst1_dste_vld           (dp_ctrl_ir_inst1_dste_vld          ),
  .dp_ctrl_ir_inst1_dstf_vld           (dp_ctrl_ir_inst1_dstf_vld          ),
  .dp_ctrl_ir_inst1_dstv_vld           (dp_ctrl_ir_inst1_dstv_vld          ),
  .dp_ctrl_ir_inst1_hpcp_type          (dp_ctrl_ir_inst1_hpcp_type         ),
  .dp_ctrl_ir_inst2_bar                (dp_ctrl_ir_inst2_bar               ),
  .dp_ctrl_ir_inst2_ctrl_info          (dp_ctrl_ir_inst2_ctrl_info         ),
  .dp_ctrl_ir_inst2_dst_vld            (dp_ctrl_ir_inst2_dst_vld           ),
  .dp_ctrl_ir_inst2_dst_x0             (dp_ctrl_ir_inst2_dst_x0            ),
  .dp_ctrl_ir_inst2_dste_vld           (dp_ctrl_ir_inst2_dste_vld          ),
  .dp_ctrl_ir_inst2_dstf_vld           (dp_ctrl_ir_inst2_dstf_vld          ),
  .dp_ctrl_ir_inst2_dstv_vld           (dp_ctrl_ir_inst2_dstv_vld          ),
  .dp_ctrl_ir_inst2_hpcp_type          (dp_ctrl_ir_inst2_hpcp_type         ),
  .dp_ctrl_ir_inst3_bar                (dp_ctrl_ir_inst3_bar               ),
  .dp_ctrl_ir_inst3_ctrl_info          (dp_ctrl_ir_inst3_ctrl_info         ),
  .dp_ctrl_ir_inst3_dst_vld            (dp_ctrl_ir_inst3_dst_vld           ),
  .dp_ctrl_ir_inst3_dst_x0             (dp_ctrl_ir_inst3_dst_x0            ),
  .dp_ctrl_ir_inst3_dste_vld           (dp_ctrl_ir_inst3_dste_vld          ),
  .dp_ctrl_ir_inst3_dstf_vld           (dp_ctrl_ir_inst3_dstf_vld          ),
  .dp_ctrl_ir_inst3_dstv_vld           (dp_ctrl_ir_inst3_dstv_vld          ),
  .dp_ctrl_ir_inst3_hpcp_type          (dp_ctrl_ir_inst3_hpcp_type         ),
  .dp_ctrl_is_dis_inst2_ctrl_info      (dp_ctrl_is_dis_inst2_ctrl_info     ),
  .dp_ctrl_is_dis_inst3_ctrl_info      (dp_ctrl_is_dis_inst3_ctrl_info     ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .hpcp_idu_cnt_en                     (hpcp_idu_cnt_en                    ),
  .idu_hpcp_ir_inst0_type              (idu_hpcp_ir_inst0_type             ),
  .idu_hpcp_ir_inst0_vld               (idu_hpcp_ir_inst0_vld              ),
  .idu_hpcp_ir_inst1_type              (idu_hpcp_ir_inst1_type             ),
  .idu_hpcp_ir_inst1_vld               (idu_hpcp_ir_inst1_vld              ),
  .idu_hpcp_ir_inst2_type              (idu_hpcp_ir_inst2_type             ),
  .idu_hpcp_ir_inst2_vld               (idu_hpcp_ir_inst2_vld              ),
  .idu_hpcp_ir_inst3_type              (idu_hpcp_ir_inst3_type             ),
  .idu_hpcp_ir_inst3_vld               (idu_hpcp_ir_inst3_vld              ),
  .idu_rtu_ir_ereg0_alloc_vld          (idu_rtu_ir_ereg0_alloc_vld         ),
  .idu_rtu_ir_ereg1_alloc_vld          (idu_rtu_ir_ereg1_alloc_vld         ),
  .idu_rtu_ir_ereg2_alloc_vld          (idu_rtu_ir_ereg2_alloc_vld         ),
  .idu_rtu_ir_ereg3_alloc_vld          (idu_rtu_ir_ereg3_alloc_vld         ),
  .idu_rtu_ir_ereg_alloc_gateclk_vld   (idu_rtu_ir_ereg_alloc_gateclk_vld  ),
  .idu_rtu_ir_freg0_alloc_vld          (idu_rtu_ir_freg0_alloc_vld         ),
  .idu_rtu_ir_freg1_alloc_vld          (idu_rtu_ir_freg1_alloc_vld         ),
  .idu_rtu_ir_freg2_alloc_vld          (idu_rtu_ir_freg2_alloc_vld         ),
  .idu_rtu_ir_freg3_alloc_vld          (idu_rtu_ir_freg3_alloc_vld         ),
  .idu_rtu_ir_freg_alloc_gateclk_vld   (idu_rtu_ir_freg_alloc_gateclk_vld  ),
  .idu_rtu_ir_preg0_alloc_vld          (idu_rtu_ir_preg0_alloc_vld         ),
  .idu_rtu_ir_preg1_alloc_vld          (idu_rtu_ir_preg1_alloc_vld         ),
  .idu_rtu_ir_preg2_alloc_vld          (idu_rtu_ir_preg2_alloc_vld         ),
  .idu_rtu_ir_preg3_alloc_vld          (idu_rtu_ir_preg3_alloc_vld         ),
  .idu_rtu_ir_preg_alloc_gateclk_vld   (idu_rtu_ir_preg_alloc_gateclk_vld  ),
  .idu_rtu_ir_vreg0_alloc_vld          (idu_rtu_ir_vreg0_alloc_vld         ),
  .idu_rtu_ir_vreg1_alloc_vld          (idu_rtu_ir_vreg1_alloc_vld         ),
  .idu_rtu_ir_vreg2_alloc_vld          (idu_rtu_ir_vreg2_alloc_vld         ),
  .idu_rtu_ir_vreg3_alloc_vld          (idu_rtu_ir_vreg3_alloc_vld         ),
  .idu_rtu_ir_vreg_alloc_gateclk_vld   (idu_rtu_ir_vreg_alloc_gateclk_vld  ),
  .iu_idu_mispred_stall                (iu_idu_mispred_stall               ),
  .iu_yy_xx_cancel                     (iu_yy_xx_cancel                    ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .rtu_idu_alloc_ereg0_vld             (rtu_idu_alloc_ereg0_vld            ),
  .rtu_idu_alloc_ereg1_vld             (rtu_idu_alloc_ereg1_vld            ),
  .rtu_idu_alloc_ereg2_vld             (rtu_idu_alloc_ereg2_vld            ),
  .rtu_idu_alloc_ereg3_vld             (rtu_idu_alloc_ereg3_vld            ),
  .rtu_idu_alloc_freg0_vld             (rtu_idu_alloc_freg0_vld            ),
  .rtu_idu_alloc_freg1_vld             (rtu_idu_alloc_freg1_vld            ),
  .rtu_idu_alloc_freg2_vld             (rtu_idu_alloc_freg2_vld            ),
  .rtu_idu_alloc_freg3_vld             (rtu_idu_alloc_freg3_vld            ),
  .rtu_idu_alloc_preg0_vld             (rtu_idu_alloc_preg0_vld            ),
  .rtu_idu_alloc_preg1_vld             (rtu_idu_alloc_preg1_vld            ),
  .rtu_idu_alloc_preg2_vld             (rtu_idu_alloc_preg2_vld            ),
  .rtu_idu_alloc_preg3_vld             (rtu_idu_alloc_preg3_vld            ),
  .rtu_idu_alloc_vreg0_vld             (rtu_idu_alloc_vreg0_vld            ),
  .rtu_idu_alloc_vreg1_vld             (rtu_idu_alloc_vreg1_vld            ),
  .rtu_idu_alloc_vreg2_vld             (rtu_idu_alloc_vreg2_vld            ),
  .rtu_idu_alloc_vreg3_vld             (rtu_idu_alloc_vreg3_vld            ),
  .rtu_idu_flush_fe                    (rtu_idu_flush_fe                   ),
  .rtu_idu_flush_is                    (rtu_idu_flush_is                   ),
  .rtu_idu_flush_stall                 (rtu_idu_flush_stall                ),
  .rtu_idu_srt_en                      (rtu_idu_srt_en                     ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .viq0_ctrl_entry_cnt_updt_val        (viq0_ctrl_entry_cnt_updt_val       ),
  .viq0_ctrl_entry_cnt_updt_vld        (viq0_ctrl_entry_cnt_updt_vld       ),
  .viq1_ctrl_entry_cnt_updt_val        (viq1_ctrl_entry_cnt_updt_val       ),
  .viq1_ctrl_entry_cnt_updt_vld        (viq1_ctrl_entry_cnt_updt_vld       )
);

// &Instance("ct_idu_ir_dp", "x_ct_idu_ir_dp"); @40
ct_idu_ir_dp  x_ct_idu_ir_dp (
  .cp0_idu_icg_en             (cp0_idu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .ctrl_dp_ir_inst0_vld       (ctrl_dp_ir_inst0_vld      ),
  .ctrl_id_pipedown_gateclk   (ctrl_id_pipedown_gateclk  ),
  .ctrl_ir_stall              (ctrl_ir_stall             ),
  .dp_ctrl_ir_inst0_bar       (dp_ctrl_ir_inst0_bar      ),
  .dp_ctrl_ir_inst0_ctrl_info (dp_ctrl_ir_inst0_ctrl_info),
  .dp_ctrl_ir_inst0_dst_vld   (dp_ctrl_ir_inst0_dst_vld  ),
  .dp_ctrl_ir_inst0_dst_x0    (dp_ctrl_ir_inst0_dst_x0   ),
  .dp_ctrl_ir_inst0_dste_vld  (dp_ctrl_ir_inst0_dste_vld ),
  .dp_ctrl_ir_inst0_dstf_vld  (dp_ctrl_ir_inst0_dstf_vld ),
  .dp_ctrl_ir_inst0_dstv_vld  (dp_ctrl_ir_inst0_dstv_vld ),
  .dp_ctrl_ir_inst0_hpcp_type (dp_ctrl_ir_inst0_hpcp_type),
  .dp_ctrl_ir_inst1_bar       (dp_ctrl_ir_inst1_bar      ),
  .dp_ctrl_ir_inst1_ctrl_info (dp_ctrl_ir_inst1_ctrl_info),
  .dp_ctrl_ir_inst1_dst_vld   (dp_ctrl_ir_inst1_dst_vld  ),
  .dp_ctrl_ir_inst1_dst_x0    (dp_ctrl_ir_inst1_dst_x0   ),
  .dp_ctrl_ir_inst1_dste_vld  (dp_ctrl_ir_inst1_dste_vld ),
  .dp_ctrl_ir_inst1_dstf_vld  (dp_ctrl_ir_inst1_dstf_vld ),
  .dp_ctrl_ir_inst1_dstv_vld  (dp_ctrl_ir_inst1_dstv_vld ),
  .dp_ctrl_ir_inst1_hpcp_type (dp_ctrl_ir_inst1_hpcp_type),
  .dp_ctrl_ir_inst2_bar       (dp_ctrl_ir_inst2_bar      ),
  .dp_ctrl_ir_inst2_ctrl_info (dp_ctrl_ir_inst2_ctrl_info),
  .dp_ctrl_ir_inst2_dst_vld   (dp_ctrl_ir_inst2_dst_vld  ),
  .dp_ctrl_ir_inst2_dst_x0    (dp_ctrl_ir_inst2_dst_x0   ),
  .dp_ctrl_ir_inst2_dste_vld  (dp_ctrl_ir_inst2_dste_vld ),
  .dp_ctrl_ir_inst2_dstf_vld  (dp_ctrl_ir_inst2_dstf_vld ),
  .dp_ctrl_ir_inst2_dstv_vld  (dp_ctrl_ir_inst2_dstv_vld ),
  .dp_ctrl_ir_inst2_hpcp_type (dp_ctrl_ir_inst2_hpcp_type),
  .dp_ctrl_ir_inst3_bar       (dp_ctrl_ir_inst3_bar      ),
  .dp_ctrl_ir_inst3_ctrl_info (dp_ctrl_ir_inst3_ctrl_info),
  .dp_ctrl_ir_inst3_dst_vld   (dp_ctrl_ir_inst3_dst_vld  ),
  .dp_ctrl_ir_inst3_dst_x0    (dp_ctrl_ir_inst3_dst_x0   ),
  .dp_ctrl_ir_inst3_dste_vld  (dp_ctrl_ir_inst3_dste_vld ),
  .dp_ctrl_ir_inst3_dstf_vld  (dp_ctrl_ir_inst3_dstf_vld ),
  .dp_ctrl_ir_inst3_dstv_vld  (dp_ctrl_ir_inst3_dstv_vld ),
  .dp_ctrl_ir_inst3_hpcp_type (dp_ctrl_ir_inst3_hpcp_type),
  .dp_frt_inst0_dst_ereg      (dp_frt_inst0_dst_ereg     ),
  .dp_frt_inst0_dst_freg      (dp_frt_inst0_dst_freg     ),
  .dp_frt_inst0_dste_vld      (dp_frt_inst0_dste_vld     ),
  .dp_frt_inst0_dstf_reg      (dp_frt_inst0_dstf_reg     ),
  .dp_frt_inst0_dstf_vld      (dp_frt_inst0_dstf_vld     ),
  .dp_frt_inst0_fmla          (dp_frt_inst0_fmla         ),
  .dp_frt_inst0_fmov          (dp_frt_inst0_fmov         ),
  .dp_frt_inst0_srcf0_reg     (dp_frt_inst0_srcf0_reg    ),
  .dp_frt_inst0_srcf0_vld     (dp_frt_inst0_srcf0_vld    ),
  .dp_frt_inst0_srcf1_reg     (dp_frt_inst0_srcf1_reg    ),
  .dp_frt_inst0_srcf1_vld     (dp_frt_inst0_srcf1_vld    ),
  .dp_frt_inst0_srcf2_reg     (dp_frt_inst0_srcf2_reg    ),
  .dp_frt_inst0_srcf2_vld     (dp_frt_inst0_srcf2_vld    ),
  .dp_frt_inst1_dst_ereg      (dp_frt_inst1_dst_ereg     ),
  .dp_frt_inst1_dst_freg      (dp_frt_inst1_dst_freg     ),
  .dp_frt_inst1_dste_vld      (dp_frt_inst1_dste_vld     ),
  .dp_frt_inst1_dstf_reg      (dp_frt_inst1_dstf_reg     ),
  .dp_frt_inst1_dstf_vld      (dp_frt_inst1_dstf_vld     ),
  .dp_frt_inst1_fmla          (dp_frt_inst1_fmla         ),
  .dp_frt_inst1_fmov          (dp_frt_inst1_fmov         ),
  .dp_frt_inst1_srcf0_reg     (dp_frt_inst1_srcf0_reg    ),
  .dp_frt_inst1_srcf0_vld     (dp_frt_inst1_srcf0_vld    ),
  .dp_frt_inst1_srcf1_reg     (dp_frt_inst1_srcf1_reg    ),
  .dp_frt_inst1_srcf1_vld     (dp_frt_inst1_srcf1_vld    ),
  .dp_frt_inst1_srcf2_reg     (dp_frt_inst1_srcf2_reg    ),
  .dp_frt_inst1_srcf2_vld     (dp_frt_inst1_srcf2_vld    ),
  .dp_frt_inst2_dst_ereg      (dp_frt_inst2_dst_ereg     ),
  .dp_frt_inst2_dst_freg      (dp_frt_inst2_dst_freg     ),
  .dp_frt_inst2_dste_vld      (dp_frt_inst2_dste_vld     ),
  .dp_frt_inst2_dstf_reg      (dp_frt_inst2_dstf_reg     ),
  .dp_frt_inst2_dstf_vld      (dp_frt_inst2_dstf_vld     ),
  .dp_frt_inst2_fmla          (dp_frt_inst2_fmla         ),
  .dp_frt_inst2_fmov          (dp_frt_inst2_fmov         ),
  .dp_frt_inst2_srcf0_reg     (dp_frt_inst2_srcf0_reg    ),
  .dp_frt_inst2_srcf0_vld     (dp_frt_inst2_srcf0_vld    ),
  .dp_frt_inst2_srcf1_reg     (dp_frt_inst2_srcf1_reg    ),
  .dp_frt_inst2_srcf1_vld     (dp_frt_inst2_srcf1_vld    ),
  .dp_frt_inst2_srcf2_reg     (dp_frt_inst2_srcf2_reg    ),
  .dp_frt_inst2_srcf2_vld     (dp_frt_inst2_srcf2_vld    ),
  .dp_frt_inst3_dst_ereg      (dp_frt_inst3_dst_ereg     ),
  .dp_frt_inst3_dst_freg      (dp_frt_inst3_dst_freg     ),
  .dp_frt_inst3_dste_vld      (dp_frt_inst3_dste_vld     ),
  .dp_frt_inst3_dstf_reg      (dp_frt_inst3_dstf_reg     ),
  .dp_frt_inst3_dstf_vld      (dp_frt_inst3_dstf_vld     ),
  .dp_frt_inst3_fmla          (dp_frt_inst3_fmla         ),
  .dp_frt_inst3_srcf0_reg     (dp_frt_inst3_srcf0_reg    ),
  .dp_frt_inst3_srcf0_vld     (dp_frt_inst3_srcf0_vld    ),
  .dp_frt_inst3_srcf1_reg     (dp_frt_inst3_srcf1_reg    ),
  .dp_frt_inst3_srcf1_vld     (dp_frt_inst3_srcf1_vld    ),
  .dp_frt_inst3_srcf2_reg     (dp_frt_inst3_srcf2_reg    ),
  .dp_frt_inst3_srcf2_vld     (dp_frt_inst3_srcf2_vld    ),
  .dp_id_pipedown_dep_info    (dp_id_pipedown_dep_info   ),
  .dp_id_pipedown_inst0_data  (dp_id_pipedown_inst0_data ),
  .dp_id_pipedown_inst1_data  (dp_id_pipedown_inst1_data ),
  .dp_id_pipedown_inst2_data  (dp_id_pipedown_inst2_data ),
  .dp_id_pipedown_inst3_data  (dp_id_pipedown_inst3_data ),
  .dp_ir_inst01_src_match     (dp_ir_inst01_src_match    ),
  .dp_ir_inst02_src_match     (dp_ir_inst02_src_match    ),
  .dp_ir_inst03_src_match     (dp_ir_inst03_src_match    ),
  .dp_ir_inst0_data           (dp_ir_inst0_data          ),
  .dp_ir_inst12_src_match     (dp_ir_inst12_src_match    ),
  .dp_ir_inst13_src_match     (dp_ir_inst13_src_match    ),
  .dp_ir_inst1_data           (dp_ir_inst1_data          ),
  .dp_ir_inst23_src_match     (dp_ir_inst23_src_match    ),
  .dp_ir_inst2_data           (dp_ir_inst2_data          ),
  .dp_ir_inst3_data           (dp_ir_inst3_data          ),
  .dp_rt_dep_info             (dp_rt_dep_info            ),
  .dp_rt_inst0_dst_preg       (dp_rt_inst0_dst_preg      ),
  .dp_rt_inst0_dst_reg        (dp_rt_inst0_dst_reg       ),
  .dp_rt_inst0_dst_vld        (dp_rt_inst0_dst_vld       ),
  .dp_rt_inst0_mla            (dp_rt_inst0_mla           ),
  .dp_rt_inst0_mov            (dp_rt_inst0_mov           ),
  .dp_rt_inst0_src0_reg       (dp_rt_inst0_src0_reg      ),
  .dp_rt_inst0_src0_vld       (dp_rt_inst0_src0_vld      ),
  .dp_rt_inst0_src1_reg       (dp_rt_inst0_src1_reg      ),
  .dp_rt_inst0_src1_vld       (dp_rt_inst0_src1_vld      ),
  .dp_rt_inst0_src2_vld       (dp_rt_inst0_src2_vld      ),
  .dp_rt_inst1_dst_preg       (dp_rt_inst1_dst_preg      ),
  .dp_rt_inst1_dst_reg        (dp_rt_inst1_dst_reg       ),
  .dp_rt_inst1_dst_vld        (dp_rt_inst1_dst_vld       ),
  .dp_rt_inst1_mla            (dp_rt_inst1_mla           ),
  .dp_rt_inst1_mov            (dp_rt_inst1_mov           ),
  .dp_rt_inst1_src0_reg       (dp_rt_inst1_src0_reg      ),
  .dp_rt_inst1_src0_vld       (dp_rt_inst1_src0_vld      ),
  .dp_rt_inst1_src1_reg       (dp_rt_inst1_src1_reg      ),
  .dp_rt_inst1_src1_vld       (dp_rt_inst1_src1_vld      ),
  .dp_rt_inst1_src2_vld       (dp_rt_inst1_src2_vld      ),
  .dp_rt_inst2_dst_preg       (dp_rt_inst2_dst_preg      ),
  .dp_rt_inst2_dst_reg        (dp_rt_inst2_dst_reg       ),
  .dp_rt_inst2_dst_vld        (dp_rt_inst2_dst_vld       ),
  .dp_rt_inst2_mla            (dp_rt_inst2_mla           ),
  .dp_rt_inst2_mov            (dp_rt_inst2_mov           ),
  .dp_rt_inst2_src0_reg       (dp_rt_inst2_src0_reg      ),
  .dp_rt_inst2_src0_vld       (dp_rt_inst2_src0_vld      ),
  .dp_rt_inst2_src1_reg       (dp_rt_inst2_src1_reg      ),
  .dp_rt_inst2_src1_vld       (dp_rt_inst2_src1_vld      ),
  .dp_rt_inst2_src2_vld       (dp_rt_inst2_src2_vld      ),
  .dp_rt_inst3_dst_preg       (dp_rt_inst3_dst_preg      ),
  .dp_rt_inst3_dst_reg        (dp_rt_inst3_dst_reg       ),
  .dp_rt_inst3_dst_vld        (dp_rt_inst3_dst_vld       ),
  .dp_rt_inst3_mla            (dp_rt_inst3_mla           ),
  .dp_rt_inst3_src0_reg       (dp_rt_inst3_src0_reg      ),
  .dp_rt_inst3_src0_vld       (dp_rt_inst3_src0_vld      ),
  .dp_rt_inst3_src1_reg       (dp_rt_inst3_src1_reg      ),
  .dp_rt_inst3_src1_vld       (dp_rt_inst3_src1_vld      ),
  .dp_rt_inst3_src2_vld       (dp_rt_inst3_src2_vld      ),
  .dp_vrt_inst0_dst_vreg      (dp_vrt_inst0_dst_vreg     ),
  .dp_vrt_inst0_dstv_reg      (dp_vrt_inst0_dstv_reg     ),
  .dp_vrt_inst0_dstv_vld      (dp_vrt_inst0_dstv_vld     ),
  .dp_vrt_inst0_srcv0_reg     (dp_vrt_inst0_srcv0_reg    ),
  .dp_vrt_inst0_srcv0_vld     (dp_vrt_inst0_srcv0_vld    ),
  .dp_vrt_inst0_srcv1_reg     (dp_vrt_inst0_srcv1_reg    ),
  .dp_vrt_inst0_srcv1_vld     (dp_vrt_inst0_srcv1_vld    ),
  .dp_vrt_inst0_srcv2_vld     (dp_vrt_inst0_srcv2_vld    ),
  .dp_vrt_inst0_srcvm_vld     (dp_vrt_inst0_srcvm_vld    ),
  .dp_vrt_inst0_vmla          (dp_vrt_inst0_vmla         ),
  .dp_vrt_inst1_dst_vreg      (dp_vrt_inst1_dst_vreg     ),
  .dp_vrt_inst1_dstv_reg      (dp_vrt_inst1_dstv_reg     ),
  .dp_vrt_inst1_dstv_vld      (dp_vrt_inst1_dstv_vld     ),
  .dp_vrt_inst1_srcv0_reg     (dp_vrt_inst1_srcv0_reg    ),
  .dp_vrt_inst1_srcv0_vld     (dp_vrt_inst1_srcv0_vld    ),
  .dp_vrt_inst1_srcv1_reg     (dp_vrt_inst1_srcv1_reg    ),
  .dp_vrt_inst1_srcv1_vld     (dp_vrt_inst1_srcv1_vld    ),
  .dp_vrt_inst1_srcv2_vld     (dp_vrt_inst1_srcv2_vld    ),
  .dp_vrt_inst1_srcvm_vld     (dp_vrt_inst1_srcvm_vld    ),
  .dp_vrt_inst1_vmla          (dp_vrt_inst1_vmla         ),
  .dp_vrt_inst2_dst_vreg      (dp_vrt_inst2_dst_vreg     ),
  .dp_vrt_inst2_dstv_reg      (dp_vrt_inst2_dstv_reg     ),
  .dp_vrt_inst2_dstv_vld      (dp_vrt_inst2_dstv_vld     ),
  .dp_vrt_inst2_srcv0_reg     (dp_vrt_inst2_srcv0_reg    ),
  .dp_vrt_inst2_srcv0_vld     (dp_vrt_inst2_srcv0_vld    ),
  .dp_vrt_inst2_srcv1_reg     (dp_vrt_inst2_srcv1_reg    ),
  .dp_vrt_inst2_srcv1_vld     (dp_vrt_inst2_srcv1_vld    ),
  .dp_vrt_inst2_srcv2_vld     (dp_vrt_inst2_srcv2_vld    ),
  .dp_vrt_inst2_srcvm_vld     (dp_vrt_inst2_srcvm_vld    ),
  .dp_vrt_inst2_vmla          (dp_vrt_inst2_vmla         ),
  .dp_vrt_inst3_dst_vreg      (dp_vrt_inst3_dst_vreg     ),
  .dp_vrt_inst3_dstv_reg      (dp_vrt_inst3_dstv_reg     ),
  .dp_vrt_inst3_dstv_vld      (dp_vrt_inst3_dstv_vld     ),
  .dp_vrt_inst3_srcv0_reg     (dp_vrt_inst3_srcv0_reg    ),
  .dp_vrt_inst3_srcv0_vld     (dp_vrt_inst3_srcv0_vld    ),
  .dp_vrt_inst3_srcv1_reg     (dp_vrt_inst3_srcv1_reg    ),
  .dp_vrt_inst3_srcv1_vld     (dp_vrt_inst3_srcv1_vld    ),
  .dp_vrt_inst3_srcv2_vld     (dp_vrt_inst3_srcv2_vld    ),
  .dp_vrt_inst3_srcvm_vld     (dp_vrt_inst3_srcvm_vld    ),
  .dp_vrt_inst3_vmla          (dp_vrt_inst3_vmla         ),
  .forever_cpuclk             (forever_cpuclk            ),
  .frt_dp_inst01_srcf2_match  (frt_dp_inst01_srcf2_match ),
  .frt_dp_inst02_srcf2_match  (frt_dp_inst02_srcf2_match ),
  .frt_dp_inst03_srcf2_match  (frt_dp_inst03_srcf2_match ),
  .frt_dp_inst0_rel_ereg      (frt_dp_inst0_rel_ereg     ),
  .frt_dp_inst0_rel_freg      (frt_dp_inst0_rel_freg     ),
  .frt_dp_inst0_srcf0_data    (frt_dp_inst0_srcf0_data   ),
  .frt_dp_inst0_srcf1_data    (frt_dp_inst0_srcf1_data   ),
  .frt_dp_inst0_srcf2_data    (frt_dp_inst0_srcf2_data   ),
  .frt_dp_inst12_srcf2_match  (frt_dp_inst12_srcf2_match ),
  .frt_dp_inst13_srcf2_match  (frt_dp_inst13_srcf2_match ),
  .frt_dp_inst1_rel_ereg      (frt_dp_inst1_rel_ereg     ),
  .frt_dp_inst1_rel_freg      (frt_dp_inst1_rel_freg     ),
  .frt_dp_inst1_srcf0_data    (frt_dp_inst1_srcf0_data   ),
  .frt_dp_inst1_srcf1_data    (frt_dp_inst1_srcf1_data   ),
  .frt_dp_inst1_srcf2_data    (frt_dp_inst1_srcf2_data   ),
  .frt_dp_inst23_srcf2_match  (frt_dp_inst23_srcf2_match ),
  .frt_dp_inst2_rel_ereg      (frt_dp_inst2_rel_ereg     ),
  .frt_dp_inst2_rel_freg      (frt_dp_inst2_rel_freg     ),
  .frt_dp_inst2_srcf0_data    (frt_dp_inst2_srcf0_data   ),
  .frt_dp_inst2_srcf1_data    (frt_dp_inst2_srcf1_data   ),
  .frt_dp_inst2_srcf2_data    (frt_dp_inst2_srcf2_data   ),
  .frt_dp_inst3_rel_ereg      (frt_dp_inst3_rel_ereg     ),
  .frt_dp_inst3_rel_freg      (frt_dp_inst3_rel_freg     ),
  .frt_dp_inst3_srcf0_data    (frt_dp_inst3_srcf0_data   ),
  .frt_dp_inst3_srcf1_data    (frt_dp_inst3_srcf1_data   ),
  .frt_dp_inst3_srcf2_data    (frt_dp_inst3_srcf2_data   ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .rt_dp_inst01_src_match     (rt_dp_inst01_src_match    ),
  .rt_dp_inst02_src_match     (rt_dp_inst02_src_match    ),
  .rt_dp_inst03_src_match     (rt_dp_inst03_src_match    ),
  .rt_dp_inst0_rel_preg       (rt_dp_inst0_rel_preg      ),
  .rt_dp_inst0_src0_data      (rt_dp_inst0_src0_data     ),
  .rt_dp_inst0_src1_data      (rt_dp_inst0_src1_data     ),
  .rt_dp_inst0_src2_data      (rt_dp_inst0_src2_data     ),
  .rt_dp_inst12_src_match     (rt_dp_inst12_src_match    ),
  .rt_dp_inst13_src_match     (rt_dp_inst13_src_match    ),
  .rt_dp_inst1_rel_preg       (rt_dp_inst1_rel_preg      ),
  .rt_dp_inst1_src0_data      (rt_dp_inst1_src0_data     ),
  .rt_dp_inst1_src1_data      (rt_dp_inst1_src1_data     ),
  .rt_dp_inst1_src2_data      (rt_dp_inst1_src2_data     ),
  .rt_dp_inst23_src_match     (rt_dp_inst23_src_match    ),
  .rt_dp_inst2_rel_preg       (rt_dp_inst2_rel_preg      ),
  .rt_dp_inst2_src0_data      (rt_dp_inst2_src0_data     ),
  .rt_dp_inst2_src1_data      (rt_dp_inst2_src1_data     ),
  .rt_dp_inst2_src2_data      (rt_dp_inst2_src2_data     ),
  .rt_dp_inst3_rel_preg       (rt_dp_inst3_rel_preg      ),
  .rt_dp_inst3_src0_data      (rt_dp_inst3_src0_data     ),
  .rt_dp_inst3_src1_data      (rt_dp_inst3_src1_data     ),
  .rt_dp_inst3_src2_data      (rt_dp_inst3_src2_data     ),
  .rtu_idu_alloc_ereg0        (rtu_idu_alloc_ereg0       ),
  .rtu_idu_alloc_ereg1        (rtu_idu_alloc_ereg1       ),
  .rtu_idu_alloc_ereg2        (rtu_idu_alloc_ereg2       ),
  .rtu_idu_alloc_ereg3        (rtu_idu_alloc_ereg3       ),
  .rtu_idu_alloc_freg0        (rtu_idu_alloc_freg0       ),
  .rtu_idu_alloc_freg1        (rtu_idu_alloc_freg1       ),
  .rtu_idu_alloc_freg2        (rtu_idu_alloc_freg2       ),
  .rtu_idu_alloc_freg3        (rtu_idu_alloc_freg3       ),
  .rtu_idu_alloc_preg0        (rtu_idu_alloc_preg0       ),
  .rtu_idu_alloc_preg1        (rtu_idu_alloc_preg1       ),
  .rtu_idu_alloc_preg2        (rtu_idu_alloc_preg2       ),
  .rtu_idu_alloc_preg3        (rtu_idu_alloc_preg3       ),
  .rtu_idu_alloc_vreg0        (rtu_idu_alloc_vreg0       ),
  .rtu_idu_alloc_vreg1        (rtu_idu_alloc_vreg1       ),
  .rtu_idu_alloc_vreg2        (rtu_idu_alloc_vreg2       ),
  .rtu_idu_alloc_vreg3        (rtu_idu_alloc_vreg3       ),
  .vrt_dp_inst01_srcv2_match  (vrt_dp_inst01_srcv2_match ),
  .vrt_dp_inst02_srcv2_match  (vrt_dp_inst02_srcv2_match ),
  .vrt_dp_inst03_srcv2_match  (vrt_dp_inst03_srcv2_match ),
  .vrt_dp_inst0_rel_vreg      (vrt_dp_inst0_rel_vreg     ),
  .vrt_dp_inst0_srcv0_data    (vrt_dp_inst0_srcv0_data   ),
  .vrt_dp_inst0_srcv1_data    (vrt_dp_inst0_srcv1_data   ),
  .vrt_dp_inst0_srcv2_data    (vrt_dp_inst0_srcv2_data   ),
  .vrt_dp_inst0_srcvm_data    (vrt_dp_inst0_srcvm_data   ),
  .vrt_dp_inst12_srcv2_match  (vrt_dp_inst12_srcv2_match ),
  .vrt_dp_inst13_srcv2_match  (vrt_dp_inst13_srcv2_match ),
  .vrt_dp_inst1_rel_vreg      (vrt_dp_inst1_rel_vreg     ),
  .vrt_dp_inst1_srcv0_data    (vrt_dp_inst1_srcv0_data   ),
  .vrt_dp_inst1_srcv1_data    (vrt_dp_inst1_srcv1_data   ),
  .vrt_dp_inst1_srcv2_data    (vrt_dp_inst1_srcv2_data   ),
  .vrt_dp_inst1_srcvm_data    (vrt_dp_inst1_srcvm_data   ),
  .vrt_dp_inst23_srcv2_match  (vrt_dp_inst23_srcv2_match ),
  .vrt_dp_inst2_rel_vreg      (vrt_dp_inst2_rel_vreg     ),
  .vrt_dp_inst2_srcv0_data    (vrt_dp_inst2_srcv0_data   ),
  .vrt_dp_inst2_srcv1_data    (vrt_dp_inst2_srcv1_data   ),
  .vrt_dp_inst2_srcv2_data    (vrt_dp_inst2_srcv2_data   ),
  .vrt_dp_inst2_srcvm_data    (vrt_dp_inst2_srcvm_data   ),
  .vrt_dp_inst3_rel_vreg      (vrt_dp_inst3_rel_vreg     ),
  .vrt_dp_inst3_srcv0_data    (vrt_dp_inst3_srcv0_data   ),
  .vrt_dp_inst3_srcv1_data    (vrt_dp_inst3_srcv1_data   ),
  .vrt_dp_inst3_srcv2_data    (vrt_dp_inst3_srcv2_data   ),
  .vrt_dp_inst3_srcvm_data    (vrt_dp_inst3_srcvm_data   )
);

// &ConnRule(s/_dupx/_dup0/); @41
// &Instance("ct_idu_ir_rt", "x_ct_idu_ir_rt"); @42
ct_idu_ir_rt  x_ct_idu_ir_rt (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_ir_stall                         (ctrl_ir_stall                        ),
  .ctrl_rt_inst0_vld                     (ctrl_rt_inst0_vld                    ),
  .ctrl_rt_inst1_vld                     (ctrl_rt_inst1_vld                    ),
  .ctrl_rt_inst2_vld                     (ctrl_rt_inst2_vld                    ),
  .ctrl_rt_inst3_vld                     (ctrl_rt_inst3_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx    (ctrl_xx_rf_pipe0_preg_lch_vld_dup0   ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx    (ctrl_xx_rf_pipe1_preg_lch_vld_dup0   ),
  .dp_rt_dep_info                        (dp_rt_dep_info                       ),
  .dp_rt_inst0_dst_preg                  (dp_rt_inst0_dst_preg                 ),
  .dp_rt_inst0_dst_reg                   (dp_rt_inst0_dst_reg                  ),
  .dp_rt_inst0_dst_vld                   (dp_rt_inst0_dst_vld                  ),
  .dp_rt_inst0_mla                       (dp_rt_inst0_mla                      ),
  .dp_rt_inst0_mov                       (dp_rt_inst0_mov                      ),
  .dp_rt_inst0_src0_reg                  (dp_rt_inst0_src0_reg                 ),
  .dp_rt_inst0_src0_vld                  (dp_rt_inst0_src0_vld                 ),
  .dp_rt_inst0_src1_reg                  (dp_rt_inst0_src1_reg                 ),
  .dp_rt_inst0_src1_vld                  (dp_rt_inst0_src1_vld                 ),
  .dp_rt_inst0_src2_vld                  (dp_rt_inst0_src2_vld                 ),
  .dp_rt_inst1_dst_preg                  (dp_rt_inst1_dst_preg                 ),
  .dp_rt_inst1_dst_reg                   (dp_rt_inst1_dst_reg                  ),
  .dp_rt_inst1_dst_vld                   (dp_rt_inst1_dst_vld                  ),
  .dp_rt_inst1_mla                       (dp_rt_inst1_mla                      ),
  .dp_rt_inst1_mov                       (dp_rt_inst1_mov                      ),
  .dp_rt_inst1_src0_reg                  (dp_rt_inst1_src0_reg                 ),
  .dp_rt_inst1_src0_vld                  (dp_rt_inst1_src0_vld                 ),
  .dp_rt_inst1_src1_reg                  (dp_rt_inst1_src1_reg                 ),
  .dp_rt_inst1_src1_vld                  (dp_rt_inst1_src1_vld                 ),
  .dp_rt_inst1_src2_vld                  (dp_rt_inst1_src2_vld                 ),
  .dp_rt_inst2_dst_preg                  (dp_rt_inst2_dst_preg                 ),
  .dp_rt_inst2_dst_reg                   (dp_rt_inst2_dst_reg                  ),
  .dp_rt_inst2_dst_vld                   (dp_rt_inst2_dst_vld                  ),
  .dp_rt_inst2_mla                       (dp_rt_inst2_mla                      ),
  .dp_rt_inst2_mov                       (dp_rt_inst2_mov                      ),
  .dp_rt_inst2_src0_reg                  (dp_rt_inst2_src0_reg                 ),
  .dp_rt_inst2_src0_vld                  (dp_rt_inst2_src0_vld                 ),
  .dp_rt_inst2_src1_reg                  (dp_rt_inst2_src1_reg                 ),
  .dp_rt_inst2_src1_vld                  (dp_rt_inst2_src1_vld                 ),
  .dp_rt_inst2_src2_vld                  (dp_rt_inst2_src2_vld                 ),
  .dp_rt_inst3_dst_preg                  (dp_rt_inst3_dst_preg                 ),
  .dp_rt_inst3_dst_reg                   (dp_rt_inst3_dst_reg                  ),
  .dp_rt_inst3_dst_vld                   (dp_rt_inst3_dst_vld                  ),
  .dp_rt_inst3_mla                       (dp_rt_inst3_mla                      ),
  .dp_rt_inst3_src0_reg                  (dp_rt_inst3_src0_reg                 ),
  .dp_rt_inst3_src0_vld                  (dp_rt_inst3_src0_vld                 ),
  .dp_rt_inst3_src1_reg                  (dp_rt_inst3_src1_reg                 ),
  .dp_rt_inst3_src1_vld                  (dp_rt_inst3_src1_vld                 ),
  .dp_rt_inst3_src2_vld                  (dp_rt_inst3_src2_vld                 ),
  .dp_xx_rf_pipe0_dst_preg_dupx          (dp_xx_rf_pipe0_dst_preg_dup0         ),
  .dp_xx_rf_pipe1_dst_preg_dupx          (dp_xx_rf_pipe1_dst_preg_dup0         ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .ifu_xx_sync_reset                     (ifu_xx_sync_reset                    ),
  .iu_idu_div_inst_vld                   (iu_idu_div_inst_vld                  ),
  .iu_idu_div_preg_dupx                  (iu_idu_div_preg_dup0                 ),
  .iu_idu_ex2_pipe0_wb_preg_dupx         (iu_idu_ex2_pipe0_wb_preg_dup0        ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx     (iu_idu_ex2_pipe0_wb_preg_vld_dup0    ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx   (iu_idu_ex2_pipe1_mult_inst_vld_dup0  ),
  .iu_idu_ex2_pipe1_preg_dupx            (iu_idu_ex2_pipe1_preg_dup0           ),
  .iu_idu_ex2_pipe1_wb_preg_dupx         (iu_idu_ex2_pipe1_wb_preg_dup0        ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx     (iu_idu_ex2_pipe1_wb_preg_vld_dup0    ),
  .lsu_idu_ag_pipe3_load_inst_vld        (lsu_idu_ag_pipe3_load_inst_vld       ),
  .lsu_idu_ag_pipe3_preg_dupx            (lsu_idu_ag_pipe3_preg_dup0           ),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx   (lsu_idu_dc_pipe3_load_inst_vld_dup0  ),
  .lsu_idu_dc_pipe3_preg_dupx            (lsu_idu_dc_pipe3_preg_dup0           ),
  .lsu_idu_wb_pipe3_wb_preg_dupx         (lsu_idu_wb_pipe3_wb_preg_dup0        ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx     (lsu_idu_wb_pipe3_wb_preg_vld_dup0    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rt_dp_inst01_src_match                (rt_dp_inst01_src_match               ),
  .rt_dp_inst02_src_match                (rt_dp_inst02_src_match               ),
  .rt_dp_inst03_src_match                (rt_dp_inst03_src_match               ),
  .rt_dp_inst0_rel_preg                  (rt_dp_inst0_rel_preg                 ),
  .rt_dp_inst0_src0_data                 (rt_dp_inst0_src0_data                ),
  .rt_dp_inst0_src1_data                 (rt_dp_inst0_src1_data                ),
  .rt_dp_inst0_src2_data                 (rt_dp_inst0_src2_data                ),
  .rt_dp_inst12_src_match                (rt_dp_inst12_src_match               ),
  .rt_dp_inst13_src_match                (rt_dp_inst13_src_match               ),
  .rt_dp_inst1_rel_preg                  (rt_dp_inst1_rel_preg                 ),
  .rt_dp_inst1_src0_data                 (rt_dp_inst1_src0_data                ),
  .rt_dp_inst1_src1_data                 (rt_dp_inst1_src1_data                ),
  .rt_dp_inst1_src2_data                 (rt_dp_inst1_src2_data                ),
  .rt_dp_inst23_src_match                (rt_dp_inst23_src_match               ),
  .rt_dp_inst2_rel_preg                  (rt_dp_inst2_rel_preg                 ),
  .rt_dp_inst2_src0_data                 (rt_dp_inst2_src0_data                ),
  .rt_dp_inst2_src1_data                 (rt_dp_inst2_src1_data                ),
  .rt_dp_inst2_src2_data                 (rt_dp_inst2_src2_data                ),
  .rt_dp_inst3_rel_preg                  (rt_dp_inst3_rel_preg                 ),
  .rt_dp_inst3_src0_data                 (rt_dp_inst3_src0_data                ),
  .rt_dp_inst3_src1_data                 (rt_dp_inst3_src1_data                ),
  .rt_dp_inst3_src2_data                 (rt_dp_inst3_src2_data                ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .rtu_idu_rt_recover_preg               (rtu_idu_rt_recover_preg              ),
  .rtu_yy_xx_flush                       (rtu_yy_xx_flush                      ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup0),
  .vfpu_idu_ex1_pipe6_preg_dupx          (vfpu_idu_ex1_pipe6_preg_dup0         ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup0),
  .vfpu_idu_ex1_pipe7_preg_dupx          (vfpu_idu_ex1_pipe7_preg_dup0         )
);

// &ConnRule(s/_dupx/_dup0/); @43
// &Instance("ct_idu_ir_frt", "x_ct_idu_ir_frt"); @44
ct_idu_ir_frt  x_ct_idu_ir_frt (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_ir_stall                         (ctrl_ir_stall                        ),
  .ctrl_rt_inst0_vld                     (ctrl_rt_inst0_vld                    ),
  .ctrl_rt_inst1_vld                     (ctrl_rt_inst1_vld                    ),
  .ctrl_rt_inst2_vld                     (ctrl_rt_inst2_vld                    ),
  .ctrl_rt_inst3_vld                     (ctrl_rt_inst3_vld                    ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dup0   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dup0   ),
  .dp_frt_inst0_dst_ereg                 (dp_frt_inst0_dst_ereg                ),
  .dp_frt_inst0_dst_freg                 (dp_frt_inst0_dst_freg                ),
  .dp_frt_inst0_dste_vld                 (dp_frt_inst0_dste_vld                ),
  .dp_frt_inst0_dstf_reg                 (dp_frt_inst0_dstf_reg                ),
  .dp_frt_inst0_dstf_vld                 (dp_frt_inst0_dstf_vld                ),
  .dp_frt_inst0_fmla                     (dp_frt_inst0_fmla                    ),
  .dp_frt_inst0_fmov                     (dp_frt_inst0_fmov                    ),
  .dp_frt_inst0_srcf0_reg                (dp_frt_inst0_srcf0_reg               ),
  .dp_frt_inst0_srcf0_vld                (dp_frt_inst0_srcf0_vld               ),
  .dp_frt_inst0_srcf1_reg                (dp_frt_inst0_srcf1_reg               ),
  .dp_frt_inst0_srcf1_vld                (dp_frt_inst0_srcf1_vld               ),
  .dp_frt_inst0_srcf2_reg                (dp_frt_inst0_srcf2_reg               ),
  .dp_frt_inst0_srcf2_vld                (dp_frt_inst0_srcf2_vld               ),
  .dp_frt_inst1_dst_ereg                 (dp_frt_inst1_dst_ereg                ),
  .dp_frt_inst1_dst_freg                 (dp_frt_inst1_dst_freg                ),
  .dp_frt_inst1_dste_vld                 (dp_frt_inst1_dste_vld                ),
  .dp_frt_inst1_dstf_reg                 (dp_frt_inst1_dstf_reg                ),
  .dp_frt_inst1_dstf_vld                 (dp_frt_inst1_dstf_vld                ),
  .dp_frt_inst1_fmla                     (dp_frt_inst1_fmla                    ),
  .dp_frt_inst1_fmov                     (dp_frt_inst1_fmov                    ),
  .dp_frt_inst1_srcf0_reg                (dp_frt_inst1_srcf0_reg               ),
  .dp_frt_inst1_srcf0_vld                (dp_frt_inst1_srcf0_vld               ),
  .dp_frt_inst1_srcf1_reg                (dp_frt_inst1_srcf1_reg               ),
  .dp_frt_inst1_srcf1_vld                (dp_frt_inst1_srcf1_vld               ),
  .dp_frt_inst1_srcf2_reg                (dp_frt_inst1_srcf2_reg               ),
  .dp_frt_inst1_srcf2_vld                (dp_frt_inst1_srcf2_vld               ),
  .dp_frt_inst2_dst_ereg                 (dp_frt_inst2_dst_ereg                ),
  .dp_frt_inst2_dst_freg                 (dp_frt_inst2_dst_freg                ),
  .dp_frt_inst2_dste_vld                 (dp_frt_inst2_dste_vld                ),
  .dp_frt_inst2_dstf_reg                 (dp_frt_inst2_dstf_reg                ),
  .dp_frt_inst2_dstf_vld                 (dp_frt_inst2_dstf_vld                ),
  .dp_frt_inst2_fmla                     (dp_frt_inst2_fmla                    ),
  .dp_frt_inst2_fmov                     (dp_frt_inst2_fmov                    ),
  .dp_frt_inst2_srcf0_reg                (dp_frt_inst2_srcf0_reg               ),
  .dp_frt_inst2_srcf0_vld                (dp_frt_inst2_srcf0_vld               ),
  .dp_frt_inst2_srcf1_reg                (dp_frt_inst2_srcf1_reg               ),
  .dp_frt_inst2_srcf1_vld                (dp_frt_inst2_srcf1_vld               ),
  .dp_frt_inst2_srcf2_reg                (dp_frt_inst2_srcf2_reg               ),
  .dp_frt_inst2_srcf2_vld                (dp_frt_inst2_srcf2_vld               ),
  .dp_frt_inst3_dst_ereg                 (dp_frt_inst3_dst_ereg                ),
  .dp_frt_inst3_dst_freg                 (dp_frt_inst3_dst_freg                ),
  .dp_frt_inst3_dste_vld                 (dp_frt_inst3_dste_vld                ),
  .dp_frt_inst3_dstf_reg                 (dp_frt_inst3_dstf_reg                ),
  .dp_frt_inst3_dstf_vld                 (dp_frt_inst3_dstf_vld                ),
  .dp_frt_inst3_fmla                     (dp_frt_inst3_fmla                    ),
  .dp_frt_inst3_srcf0_reg                (dp_frt_inst3_srcf0_reg               ),
  .dp_frt_inst3_srcf0_vld                (dp_frt_inst3_srcf0_vld               ),
  .dp_frt_inst3_srcf1_reg                (dp_frt_inst3_srcf1_reg               ),
  .dp_frt_inst3_srcf1_vld                (dp_frt_inst3_srcf1_vld               ),
  .dp_frt_inst3_srcf2_reg                (dp_frt_inst3_srcf2_reg               ),
  .dp_frt_inst3_srcf2_vld                (dp_frt_inst3_srcf2_vld               ),
  .dp_rt_dep_info                        (dp_rt_dep_info                       ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dup0         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dup0         ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .frt_dp_inst01_srcf2_match             (frt_dp_inst01_srcf2_match            ),
  .frt_dp_inst02_srcf2_match             (frt_dp_inst02_srcf2_match            ),
  .frt_dp_inst03_srcf2_match             (frt_dp_inst03_srcf2_match            ),
  .frt_dp_inst0_rel_ereg                 (frt_dp_inst0_rel_ereg                ),
  .frt_dp_inst0_rel_freg                 (frt_dp_inst0_rel_freg                ),
  .frt_dp_inst0_srcf0_data               (frt_dp_inst0_srcf0_data              ),
  .frt_dp_inst0_srcf1_data               (frt_dp_inst0_srcf1_data              ),
  .frt_dp_inst0_srcf2_data               (frt_dp_inst0_srcf2_data              ),
  .frt_dp_inst12_srcf2_match             (frt_dp_inst12_srcf2_match            ),
  .frt_dp_inst13_srcf2_match             (frt_dp_inst13_srcf2_match            ),
  .frt_dp_inst1_rel_ereg                 (frt_dp_inst1_rel_ereg                ),
  .frt_dp_inst1_rel_freg                 (frt_dp_inst1_rel_freg                ),
  .frt_dp_inst1_srcf0_data               (frt_dp_inst1_srcf0_data              ),
  .frt_dp_inst1_srcf1_data               (frt_dp_inst1_srcf1_data              ),
  .frt_dp_inst1_srcf2_data               (frt_dp_inst1_srcf2_data              ),
  .frt_dp_inst23_srcf2_match             (frt_dp_inst23_srcf2_match            ),
  .frt_dp_inst2_rel_ereg                 (frt_dp_inst2_rel_ereg                ),
  .frt_dp_inst2_rel_freg                 (frt_dp_inst2_rel_freg                ),
  .frt_dp_inst2_srcf0_data               (frt_dp_inst2_srcf0_data              ),
  .frt_dp_inst2_srcf1_data               (frt_dp_inst2_srcf1_data              ),
  .frt_dp_inst2_srcf2_data               (frt_dp_inst2_srcf2_data              ),
  .frt_dp_inst3_rel_ereg                 (frt_dp_inst3_rel_ereg                ),
  .frt_dp_inst3_rel_freg                 (frt_dp_inst3_rel_freg                ),
  .frt_dp_inst3_srcf0_data               (frt_dp_inst3_srcf0_data              ),
  .frt_dp_inst3_srcf1_data               (frt_dp_inst3_srcf1_data              ),
  .frt_dp_inst3_srcf2_data               (frt_dp_inst3_srcf2_data              ),
  .ifu_xx_sync_reset                     (ifu_xx_sync_reset                    ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dup0           ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dup0 ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dup0           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dup0        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dup0    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .rtu_idu_rt_recover_ereg               (rtu_idu_rt_recover_ereg              ),
  .rtu_idu_rt_recover_freg               (rtu_idu_rt_recover_freg              ),
  .rtu_yy_xx_flush                       (rtu_yy_xx_flush                      ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dup0     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dup0),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dup0         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dup0     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dup0),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dup0         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dup0     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dup0),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dup0         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dup0     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dup0),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dup0         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dup0     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dup0         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dup0     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dup0         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dup0      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup0  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dup0      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup0  )
);

// &ConnRule(s/_dupx/_dup0/); @45
// &Instance("ct_idu_ir_vrt", "x_ct_idu_ir_vrt"); @46
ct_idu_ir_vrt  x_ct_idu_ir_vrt (
  .dp_vrt_inst0_dst_vreg     (dp_vrt_inst0_dst_vreg    ),
  .dp_vrt_inst0_dstv_reg     (dp_vrt_inst0_dstv_reg    ),
  .dp_vrt_inst0_dstv_vld     (dp_vrt_inst0_dstv_vld    ),
  .dp_vrt_inst0_srcv0_reg    (dp_vrt_inst0_srcv0_reg   ),
  .dp_vrt_inst0_srcv0_vld    (dp_vrt_inst0_srcv0_vld   ),
  .dp_vrt_inst0_srcv1_reg    (dp_vrt_inst0_srcv1_reg   ),
  .dp_vrt_inst0_srcv1_vld    (dp_vrt_inst0_srcv1_vld   ),
  .dp_vrt_inst0_srcv2_vld    (dp_vrt_inst0_srcv2_vld   ),
  .dp_vrt_inst0_srcvm_vld    (dp_vrt_inst0_srcvm_vld   ),
  .dp_vrt_inst0_vmla         (dp_vrt_inst0_vmla        ),
  .dp_vrt_inst1_dst_vreg     (dp_vrt_inst1_dst_vreg    ),
  .dp_vrt_inst1_dstv_reg     (dp_vrt_inst1_dstv_reg    ),
  .dp_vrt_inst1_dstv_vld     (dp_vrt_inst1_dstv_vld    ),
  .dp_vrt_inst1_srcv0_reg    (dp_vrt_inst1_srcv0_reg   ),
  .dp_vrt_inst1_srcv0_vld    (dp_vrt_inst1_srcv0_vld   ),
  .dp_vrt_inst1_srcv1_reg    (dp_vrt_inst1_srcv1_reg   ),
  .dp_vrt_inst1_srcv1_vld    (dp_vrt_inst1_srcv1_vld   ),
  .dp_vrt_inst1_srcv2_vld    (dp_vrt_inst1_srcv2_vld   ),
  .dp_vrt_inst1_srcvm_vld    (dp_vrt_inst1_srcvm_vld   ),
  .dp_vrt_inst1_vmla         (dp_vrt_inst1_vmla        ),
  .dp_vrt_inst2_dst_vreg     (dp_vrt_inst2_dst_vreg    ),
  .dp_vrt_inst2_dstv_reg     (dp_vrt_inst2_dstv_reg    ),
  .dp_vrt_inst2_dstv_vld     (dp_vrt_inst2_dstv_vld    ),
  .dp_vrt_inst2_srcv0_reg    (dp_vrt_inst2_srcv0_reg   ),
  .dp_vrt_inst2_srcv0_vld    (dp_vrt_inst2_srcv0_vld   ),
  .dp_vrt_inst2_srcv1_reg    (dp_vrt_inst2_srcv1_reg   ),
  .dp_vrt_inst2_srcv1_vld    (dp_vrt_inst2_srcv1_vld   ),
  .dp_vrt_inst2_srcv2_vld    (dp_vrt_inst2_srcv2_vld   ),
  .dp_vrt_inst2_srcvm_vld    (dp_vrt_inst2_srcvm_vld   ),
  .dp_vrt_inst2_vmla         (dp_vrt_inst2_vmla        ),
  .dp_vrt_inst3_dst_vreg     (dp_vrt_inst3_dst_vreg    ),
  .dp_vrt_inst3_dstv_reg     (dp_vrt_inst3_dstv_reg    ),
  .dp_vrt_inst3_dstv_vld     (dp_vrt_inst3_dstv_vld    ),
  .dp_vrt_inst3_srcv0_reg    (dp_vrt_inst3_srcv0_reg   ),
  .dp_vrt_inst3_srcv0_vld    (dp_vrt_inst3_srcv0_vld   ),
  .dp_vrt_inst3_srcv1_reg    (dp_vrt_inst3_srcv1_reg   ),
  .dp_vrt_inst3_srcv1_vld    (dp_vrt_inst3_srcv1_vld   ),
  .dp_vrt_inst3_srcv2_vld    (dp_vrt_inst3_srcv2_vld   ),
  .dp_vrt_inst3_srcvm_vld    (dp_vrt_inst3_srcvm_vld   ),
  .dp_vrt_inst3_vmla         (dp_vrt_inst3_vmla        ),
  .rtu_idu_rt_recover_vreg   (rtu_idu_rt_recover_vreg  ),
  .vrt_dp_inst01_srcv2_match (vrt_dp_inst01_srcv2_match),
  .vrt_dp_inst02_srcv2_match (vrt_dp_inst02_srcv2_match),
  .vrt_dp_inst03_srcv2_match (vrt_dp_inst03_srcv2_match),
  .vrt_dp_inst0_rel_vreg     (vrt_dp_inst0_rel_vreg    ),
  .vrt_dp_inst0_srcv0_data   (vrt_dp_inst0_srcv0_data  ),
  .vrt_dp_inst0_srcv1_data   (vrt_dp_inst0_srcv1_data  ),
  .vrt_dp_inst0_srcv2_data   (vrt_dp_inst0_srcv2_data  ),
  .vrt_dp_inst0_srcvm_data   (vrt_dp_inst0_srcvm_data  ),
  .vrt_dp_inst12_srcv2_match (vrt_dp_inst12_srcv2_match),
  .vrt_dp_inst13_srcv2_match (vrt_dp_inst13_srcv2_match),
  .vrt_dp_inst1_rel_vreg     (vrt_dp_inst1_rel_vreg    ),
  .vrt_dp_inst1_srcv0_data   (vrt_dp_inst1_srcv0_data  ),
  .vrt_dp_inst1_srcv1_data   (vrt_dp_inst1_srcv1_data  ),
  .vrt_dp_inst1_srcv2_data   (vrt_dp_inst1_srcv2_data  ),
  .vrt_dp_inst1_srcvm_data   (vrt_dp_inst1_srcvm_data  ),
  .vrt_dp_inst23_srcv2_match (vrt_dp_inst23_srcv2_match),
  .vrt_dp_inst2_rel_vreg     (vrt_dp_inst2_rel_vreg    ),
  .vrt_dp_inst2_srcv0_data   (vrt_dp_inst2_srcv0_data  ),
  .vrt_dp_inst2_srcv1_data   (vrt_dp_inst2_srcv1_data  ),
  .vrt_dp_inst2_srcv2_data   (vrt_dp_inst2_srcv2_data  ),
  .vrt_dp_inst2_srcvm_data   (vrt_dp_inst2_srcvm_data  ),
  .vrt_dp_inst3_rel_vreg     (vrt_dp_inst3_rel_vreg    ),
  .vrt_dp_inst3_srcv0_data   (vrt_dp_inst3_srcv0_data  ),
  .vrt_dp_inst3_srcv1_data   (vrt_dp_inst3_srcv1_data  ),
  .vrt_dp_inst3_srcv2_data   (vrt_dp_inst3_srcv2_data  ),
  .vrt_dp_inst3_srcvm_data   (vrt_dp_inst3_srcvm_data  )
);


//==========================================================
//                       IS Stage
//==========================================================
// &Instance("ct_idu_is_ctrl", "x_ct_idu_is_ctrl"); @51
ct_idu_is_ctrl  x_ct_idu_is_ctrl (
  .aiq0_ctrl_1_left_updt               (aiq0_ctrl_1_left_updt              ),
  .aiq0_ctrl_empty                     (aiq0_ctrl_empty                    ),
  .aiq0_ctrl_full                      (aiq0_ctrl_full                     ),
  .aiq0_ctrl_full_updt                 (aiq0_ctrl_full_updt                ),
  .aiq0_ctrl_full_updt_clk_en          (aiq0_ctrl_full_updt_clk_en         ),
  .aiq1_ctrl_1_left_updt               (aiq1_ctrl_1_left_updt              ),
  .aiq1_ctrl_empty                     (aiq1_ctrl_empty                    ),
  .aiq1_ctrl_full                      (aiq1_ctrl_full                     ),
  .aiq1_ctrl_full_updt                 (aiq1_ctrl_full_updt                ),
  .aiq1_ctrl_full_updt_clk_en          (aiq1_ctrl_full_updt_clk_en         ),
  .biq_ctrl_1_left_updt                (biq_ctrl_1_left_updt               ),
  .biq_ctrl_empty                      (biq_ctrl_empty                     ),
  .biq_ctrl_full                       (biq_ctrl_full                      ),
  .biq_ctrl_full_updt                  (biq_ctrl_full_updt                 ),
  .biq_ctrl_full_updt_clk_en           (biq_ctrl_full_updt_clk_en          ),
  .cp0_idu_icg_en                      (cp0_idu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .ctrl_aiq0_create0_dp_en             (ctrl_aiq0_create0_dp_en            ),
  .ctrl_aiq0_create0_en                (ctrl_aiq0_create0_en               ),
  .ctrl_aiq0_create0_gateclk_en        (ctrl_aiq0_create0_gateclk_en       ),
  .ctrl_aiq0_create1_dp_en             (ctrl_aiq0_create1_dp_en            ),
  .ctrl_aiq0_create1_en                (ctrl_aiq0_create1_en               ),
  .ctrl_aiq0_create1_gateclk_en        (ctrl_aiq0_create1_gateclk_en       ),
  .ctrl_aiq1_create0_dp_en             (ctrl_aiq1_create0_dp_en            ),
  .ctrl_aiq1_create0_en                (ctrl_aiq1_create0_en               ),
  .ctrl_aiq1_create0_gateclk_en        (ctrl_aiq1_create0_gateclk_en       ),
  .ctrl_aiq1_create1_dp_en             (ctrl_aiq1_create1_dp_en            ),
  .ctrl_aiq1_create1_en                (ctrl_aiq1_create1_en               ),
  .ctrl_aiq1_create1_gateclk_en        (ctrl_aiq1_create1_gateclk_en       ),
  .ctrl_biq_create0_dp_en              (ctrl_biq_create0_dp_en             ),
  .ctrl_biq_create0_en                 (ctrl_biq_create0_en                ),
  .ctrl_biq_create0_gateclk_en         (ctrl_biq_create0_gateclk_en        ),
  .ctrl_biq_create1_dp_en              (ctrl_biq_create1_dp_en             ),
  .ctrl_biq_create1_en                 (ctrl_biq_create1_en                ),
  .ctrl_biq_create1_gateclk_en         (ctrl_biq_create1_gateclk_en        ),
  .ctrl_dp_dis_inst0_ereg_vld          (ctrl_dp_dis_inst0_ereg_vld         ),
  .ctrl_dp_dis_inst0_freg_vld          (ctrl_dp_dis_inst0_freg_vld         ),
  .ctrl_dp_dis_inst0_preg_vld          (ctrl_dp_dis_inst0_preg_vld         ),
  .ctrl_dp_dis_inst0_vreg_vld          (ctrl_dp_dis_inst0_vreg_vld         ),
  .ctrl_dp_dis_inst1_ereg_vld          (ctrl_dp_dis_inst1_ereg_vld         ),
  .ctrl_dp_dis_inst1_freg_vld          (ctrl_dp_dis_inst1_freg_vld         ),
  .ctrl_dp_dis_inst1_preg_vld          (ctrl_dp_dis_inst1_preg_vld         ),
  .ctrl_dp_dis_inst1_vreg_vld          (ctrl_dp_dis_inst1_vreg_vld         ),
  .ctrl_dp_dis_inst2_ereg_vld          (ctrl_dp_dis_inst2_ereg_vld         ),
  .ctrl_dp_dis_inst2_freg_vld          (ctrl_dp_dis_inst2_freg_vld         ),
  .ctrl_dp_dis_inst2_preg_vld          (ctrl_dp_dis_inst2_preg_vld         ),
  .ctrl_dp_dis_inst2_vreg_vld          (ctrl_dp_dis_inst2_vreg_vld         ),
  .ctrl_dp_dis_inst3_ereg_vld          (ctrl_dp_dis_inst3_ereg_vld         ),
  .ctrl_dp_dis_inst3_freg_vld          (ctrl_dp_dis_inst3_freg_vld         ),
  .ctrl_dp_dis_inst3_preg_vld          (ctrl_dp_dis_inst3_preg_vld         ),
  .ctrl_dp_dis_inst3_vreg_vld          (ctrl_dp_dis_inst3_vreg_vld         ),
  .ctrl_dp_is_dis_aiq0_create0_sel     (ctrl_dp_is_dis_aiq0_create0_sel    ),
  .ctrl_dp_is_dis_aiq0_create1_sel     (ctrl_dp_is_dis_aiq0_create1_sel    ),
  .ctrl_dp_is_dis_aiq1_create0_sel     (ctrl_dp_is_dis_aiq1_create0_sel    ),
  .ctrl_dp_is_dis_aiq1_create1_sel     (ctrl_dp_is_dis_aiq1_create1_sel    ),
  .ctrl_dp_is_dis_biq_create0_sel      (ctrl_dp_is_dis_biq_create0_sel     ),
  .ctrl_dp_is_dis_biq_create1_sel      (ctrl_dp_is_dis_biq_create1_sel     ),
  .ctrl_dp_is_dis_lsiq_create0_sel     (ctrl_dp_is_dis_lsiq_create0_sel    ),
  .ctrl_dp_is_dis_lsiq_create1_sel     (ctrl_dp_is_dis_lsiq_create1_sel    ),
  .ctrl_dp_is_dis_pst_create1_iid_sel  (ctrl_dp_is_dis_pst_create1_iid_sel ),
  .ctrl_dp_is_dis_pst_create2_iid_sel  (ctrl_dp_is_dis_pst_create2_iid_sel ),
  .ctrl_dp_is_dis_pst_create3_iid_sel  (ctrl_dp_is_dis_pst_create3_iid_sel ),
  .ctrl_dp_is_dis_rob_create0_sel      (ctrl_dp_is_dis_rob_create0_sel     ),
  .ctrl_dp_is_dis_rob_create1_sel      (ctrl_dp_is_dis_rob_create1_sel     ),
  .ctrl_dp_is_dis_rob_create2_sel      (ctrl_dp_is_dis_rob_create2_sel     ),
  .ctrl_dp_is_dis_sdiq_create0_sel     (ctrl_dp_is_dis_sdiq_create0_sel    ),
  .ctrl_dp_is_dis_sdiq_create1_sel     (ctrl_dp_is_dis_sdiq_create1_sel    ),
  .ctrl_dp_is_dis_stall                (ctrl_dp_is_dis_stall               ),
  .ctrl_dp_is_dis_viq0_create0_sel     (ctrl_dp_is_dis_viq0_create0_sel    ),
  .ctrl_dp_is_dis_viq0_create1_sel     (ctrl_dp_is_dis_viq0_create1_sel    ),
  .ctrl_dp_is_dis_viq1_create0_sel     (ctrl_dp_is_dis_viq1_create0_sel    ),
  .ctrl_dp_is_dis_viq1_create1_sel     (ctrl_dp_is_dis_viq1_create1_sel    ),
  .ctrl_dp_is_dis_vmb_create0_sel      (ctrl_dp_is_dis_vmb_create0_sel     ),
  .ctrl_dp_is_dis_vmb_create1_sel      (ctrl_dp_is_dis_vmb_create1_sel     ),
  .ctrl_dp_is_inst0_vld                (ctrl_dp_is_inst0_vld               ),
  .ctrl_dp_is_inst1_vld                (ctrl_dp_is_inst1_vld               ),
  .ctrl_dp_is_inst2_vld                (ctrl_dp_is_inst2_vld               ),
  .ctrl_dp_is_inst3_vld                (ctrl_dp_is_inst3_vld               ),
  .ctrl_fence_is_pipe_empty            (ctrl_fence_is_pipe_empty           ),
  .ctrl_ir_pipedown_gateclk            (ctrl_ir_pipedown_gateclk           ),
  .ctrl_ir_pipedown_inst0_vld          (ctrl_ir_pipedown_inst0_vld         ),
  .ctrl_ir_pipedown_inst1_vld          (ctrl_ir_pipedown_inst1_vld         ),
  .ctrl_ir_pipedown_inst2_vld          (ctrl_ir_pipedown_inst2_vld         ),
  .ctrl_ir_pipedown_inst3_vld          (ctrl_ir_pipedown_inst3_vld         ),
  .ctrl_ir_pre_dis_aiq0_create0_en     (ctrl_ir_pre_dis_aiq0_create0_en    ),
  .ctrl_ir_pre_dis_aiq0_create0_sel    (ctrl_ir_pre_dis_aiq0_create0_sel   ),
  .ctrl_ir_pre_dis_aiq0_create1_en     (ctrl_ir_pre_dis_aiq0_create1_en    ),
  .ctrl_ir_pre_dis_aiq0_create1_sel    (ctrl_ir_pre_dis_aiq0_create1_sel   ),
  .ctrl_ir_pre_dis_aiq1_create0_en     (ctrl_ir_pre_dis_aiq1_create0_en    ),
  .ctrl_ir_pre_dis_aiq1_create0_sel    (ctrl_ir_pre_dis_aiq1_create0_sel   ),
  .ctrl_ir_pre_dis_aiq1_create1_en     (ctrl_ir_pre_dis_aiq1_create1_en    ),
  .ctrl_ir_pre_dis_aiq1_create1_sel    (ctrl_ir_pre_dis_aiq1_create1_sel   ),
  .ctrl_ir_pre_dis_biq_create0_en      (ctrl_ir_pre_dis_biq_create0_en     ),
  .ctrl_ir_pre_dis_biq_create0_sel     (ctrl_ir_pre_dis_biq_create0_sel    ),
  .ctrl_ir_pre_dis_biq_create1_en      (ctrl_ir_pre_dis_biq_create1_en     ),
  .ctrl_ir_pre_dis_biq_create1_sel     (ctrl_ir_pre_dis_biq_create1_sel    ),
  .ctrl_ir_pre_dis_inst0_vld           (ctrl_ir_pre_dis_inst0_vld          ),
  .ctrl_ir_pre_dis_inst1_vld           (ctrl_ir_pre_dis_inst1_vld          ),
  .ctrl_ir_pre_dis_inst2_vld           (ctrl_ir_pre_dis_inst2_vld          ),
  .ctrl_ir_pre_dis_inst3_vld           (ctrl_ir_pre_dis_inst3_vld          ),
  .ctrl_ir_pre_dis_lsiq_create0_en     (ctrl_ir_pre_dis_lsiq_create0_en    ),
  .ctrl_ir_pre_dis_lsiq_create0_sel    (ctrl_ir_pre_dis_lsiq_create0_sel   ),
  .ctrl_ir_pre_dis_lsiq_create1_en     (ctrl_ir_pre_dis_lsiq_create1_en    ),
  .ctrl_ir_pre_dis_lsiq_create1_sel    (ctrl_ir_pre_dis_lsiq_create1_sel   ),
  .ctrl_ir_pre_dis_pipedown2           (ctrl_ir_pre_dis_pipedown2          ),
  .ctrl_ir_pre_dis_pst_create1_iid_sel (ctrl_ir_pre_dis_pst_create1_iid_sel),
  .ctrl_ir_pre_dis_pst_create2_iid_sel (ctrl_ir_pre_dis_pst_create2_iid_sel),
  .ctrl_ir_pre_dis_pst_create3_iid_sel (ctrl_ir_pre_dis_pst_create3_iid_sel),
  .ctrl_ir_pre_dis_rob_create0_sel     (ctrl_ir_pre_dis_rob_create0_sel    ),
  .ctrl_ir_pre_dis_rob_create1_en      (ctrl_ir_pre_dis_rob_create1_en     ),
  .ctrl_ir_pre_dis_rob_create1_sel     (ctrl_ir_pre_dis_rob_create1_sel    ),
  .ctrl_ir_pre_dis_rob_create2_en      (ctrl_ir_pre_dis_rob_create2_en     ),
  .ctrl_ir_pre_dis_rob_create2_sel     (ctrl_ir_pre_dis_rob_create2_sel    ),
  .ctrl_ir_pre_dis_rob_create3_en      (ctrl_ir_pre_dis_rob_create3_en     ),
  .ctrl_ir_pre_dis_sdiq_create0_en     (ctrl_ir_pre_dis_sdiq_create0_en    ),
  .ctrl_ir_pre_dis_sdiq_create0_sel    (ctrl_ir_pre_dis_sdiq_create0_sel   ),
  .ctrl_ir_pre_dis_sdiq_create1_en     (ctrl_ir_pre_dis_sdiq_create1_en    ),
  .ctrl_ir_pre_dis_sdiq_create1_sel    (ctrl_ir_pre_dis_sdiq_create1_sel   ),
  .ctrl_ir_pre_dis_viq0_create0_en     (ctrl_ir_pre_dis_viq0_create0_en    ),
  .ctrl_ir_pre_dis_viq0_create0_sel    (ctrl_ir_pre_dis_viq0_create0_sel   ),
  .ctrl_ir_pre_dis_viq0_create1_en     (ctrl_ir_pre_dis_viq0_create1_en    ),
  .ctrl_ir_pre_dis_viq0_create1_sel    (ctrl_ir_pre_dis_viq0_create1_sel   ),
  .ctrl_ir_pre_dis_viq1_create0_en     (ctrl_ir_pre_dis_viq1_create0_en    ),
  .ctrl_ir_pre_dis_viq1_create0_sel    (ctrl_ir_pre_dis_viq1_create0_sel   ),
  .ctrl_ir_pre_dis_viq1_create1_en     (ctrl_ir_pre_dis_viq1_create1_en    ),
  .ctrl_ir_pre_dis_viq1_create1_sel    (ctrl_ir_pre_dis_viq1_create1_sel   ),
  .ctrl_ir_pre_dis_vmb_create0_en      (ctrl_ir_pre_dis_vmb_create0_en     ),
  .ctrl_ir_pre_dis_vmb_create0_sel     (ctrl_ir_pre_dis_vmb_create0_sel    ),
  .ctrl_ir_pre_dis_vmb_create1_en      (ctrl_ir_pre_dis_vmb_create1_en     ),
  .ctrl_ir_pre_dis_vmb_create1_sel     (ctrl_ir_pre_dis_vmb_create1_sel    ),
  .ctrl_ir_type_stall_inst2_vld        (ctrl_ir_type_stall_inst2_vld       ),
  .ctrl_ir_type_stall_inst3_vld        (ctrl_ir_type_stall_inst3_vld       ),
  .ctrl_is_dis_type_stall              (ctrl_is_dis_type_stall             ),
  .ctrl_is_inst2_vld                   (ctrl_is_inst2_vld                  ),
  .ctrl_is_inst3_vld                   (ctrl_is_inst3_vld                  ),
  .ctrl_is_stall                       (ctrl_is_stall                      ),
  .ctrl_lsiq_create0_dp_en             (ctrl_lsiq_create0_dp_en            ),
  .ctrl_lsiq_create0_en                (ctrl_lsiq_create0_en               ),
  .ctrl_lsiq_create0_gateclk_en        (ctrl_lsiq_create0_gateclk_en       ),
  .ctrl_lsiq_create1_dp_en             (ctrl_lsiq_create1_dp_en            ),
  .ctrl_lsiq_create1_en                (ctrl_lsiq_create1_en               ),
  .ctrl_lsiq_create1_gateclk_en        (ctrl_lsiq_create1_gateclk_en       ),
  .ctrl_lsiq_is_bar_inst_vld           (ctrl_lsiq_is_bar_inst_vld          ),
  .ctrl_sdiq_create0_dp_en             (ctrl_sdiq_create0_dp_en            ),
  .ctrl_sdiq_create0_en                (ctrl_sdiq_create0_en               ),
  .ctrl_sdiq_create0_gateclk_en        (ctrl_sdiq_create0_gateclk_en       ),
  .ctrl_sdiq_create1_dp_en             (ctrl_sdiq_create1_dp_en            ),
  .ctrl_sdiq_create1_en                (ctrl_sdiq_create1_en               ),
  .ctrl_sdiq_create1_gateclk_en        (ctrl_sdiq_create1_gateclk_en       ),
  .ctrl_top_is_dis_pipedown2           (ctrl_top_is_dis_pipedown2          ),
  .ctrl_top_is_inst0_vld               (ctrl_top_is_inst0_vld              ),
  .ctrl_top_is_inst1_vld               (ctrl_top_is_inst1_vld              ),
  .ctrl_top_is_inst2_vld               (ctrl_top_is_inst2_vld              ),
  .ctrl_top_is_inst3_vld               (ctrl_top_is_inst3_vld              ),
  .ctrl_top_is_iq_full                 (ctrl_top_is_iq_full                ),
  .ctrl_top_is_vmb_full                (ctrl_top_is_vmb_full               ),
  .ctrl_viq0_create0_dp_en             (ctrl_viq0_create0_dp_en            ),
  .ctrl_viq0_create0_en                (ctrl_viq0_create0_en               ),
  .ctrl_viq0_create0_gateclk_en        (ctrl_viq0_create0_gateclk_en       ),
  .ctrl_viq0_create1_dp_en             (ctrl_viq0_create1_dp_en            ),
  .ctrl_viq0_create1_en                (ctrl_viq0_create1_en               ),
  .ctrl_viq0_create1_gateclk_en        (ctrl_viq0_create1_gateclk_en       ),
  .ctrl_viq1_create0_dp_en             (ctrl_viq1_create0_dp_en            ),
  .ctrl_viq1_create0_en                (ctrl_viq1_create0_en               ),
  .ctrl_viq1_create0_gateclk_en        (ctrl_viq1_create0_gateclk_en       ),
  .ctrl_viq1_create1_dp_en             (ctrl_viq1_create1_dp_en            ),
  .ctrl_viq1_create1_en                (ctrl_viq1_create1_en               ),
  .ctrl_viq1_create1_gateclk_en        (ctrl_viq1_create1_gateclk_en       ),
  .ctrl_xx_is_inst0_sel                (ctrl_xx_is_inst0_sel               ),
  .ctrl_xx_is_inst_sel                 (ctrl_xx_is_inst_sel                ),
  .dp_ctrl_is_inst0_bar                (dp_ctrl_is_inst0_bar               ),
  .dp_ctrl_is_inst0_dst_vld            (dp_ctrl_is_inst0_dst_vld           ),
  .dp_ctrl_is_inst0_dste_vld           (dp_ctrl_is_inst0_dste_vld          ),
  .dp_ctrl_is_inst0_dstv_vec           (dp_ctrl_is_inst0_dstv_vec          ),
  .dp_ctrl_is_inst0_dstv_vld           (dp_ctrl_is_inst0_dstv_vld          ),
  .dp_ctrl_is_inst0_pcfifo             (dp_ctrl_is_inst0_pcfifo            ),
  .dp_ctrl_is_inst1_bar                (dp_ctrl_is_inst1_bar               ),
  .dp_ctrl_is_inst1_dst_vld            (dp_ctrl_is_inst1_dst_vld           ),
  .dp_ctrl_is_inst1_dste_vld           (dp_ctrl_is_inst1_dste_vld          ),
  .dp_ctrl_is_inst1_dstv_vec           (dp_ctrl_is_inst1_dstv_vec          ),
  .dp_ctrl_is_inst1_dstv_vld           (dp_ctrl_is_inst1_dstv_vld          ),
  .dp_ctrl_is_inst1_pcfifo             (dp_ctrl_is_inst1_pcfifo            ),
  .dp_ctrl_is_inst2_bar                (dp_ctrl_is_inst2_bar               ),
  .dp_ctrl_is_inst2_dst_vld            (dp_ctrl_is_inst2_dst_vld           ),
  .dp_ctrl_is_inst2_dste_vld           (dp_ctrl_is_inst2_dste_vld          ),
  .dp_ctrl_is_inst2_dstv_vec           (dp_ctrl_is_inst2_dstv_vec          ),
  .dp_ctrl_is_inst2_dstv_vld           (dp_ctrl_is_inst2_dstv_vld          ),
  .dp_ctrl_is_inst2_pcfifo             (dp_ctrl_is_inst2_pcfifo            ),
  .dp_ctrl_is_inst3_bar                (dp_ctrl_is_inst3_bar               ),
  .dp_ctrl_is_inst3_dst_vld            (dp_ctrl_is_inst3_dst_vld           ),
  .dp_ctrl_is_inst3_dste_vld           (dp_ctrl_is_inst3_dste_vld          ),
  .dp_ctrl_is_inst3_dstv_vec           (dp_ctrl_is_inst3_dstv_vec          ),
  .dp_ctrl_is_inst3_dstv_vld           (dp_ctrl_is_inst3_dstv_vld          ),
  .dp_ctrl_is_inst3_pcfifo             (dp_ctrl_is_inst3_pcfifo            ),
  .forever_cpuclk                      (forever_cpuclk                     ),
  .idu_had_iq_empty                    (idu_had_iq_empty                   ),
  .idu_iu_is_pcfifo_inst_num           (idu_iu_is_pcfifo_inst_num          ),
  .idu_iu_is_pcfifo_inst_vld           (idu_iu_is_pcfifo_inst_vld          ),
  .idu_lsu_vmb_create0_dp_en           (idu_lsu_vmb_create0_dp_en          ),
  .idu_lsu_vmb_create0_en              (idu_lsu_vmb_create0_en             ),
  .idu_lsu_vmb_create0_gateclk_en      (idu_lsu_vmb_create0_gateclk_en     ),
  .idu_lsu_vmb_create1_dp_en           (idu_lsu_vmb_create1_dp_en          ),
  .idu_lsu_vmb_create1_en              (idu_lsu_vmb_create1_en             ),
  .idu_lsu_vmb_create1_gateclk_en      (idu_lsu_vmb_create1_gateclk_en     ),
  .idu_rtu_pst_dis_inst0_ereg_vld      (idu_rtu_pst_dis_inst0_ereg_vld     ),
  .idu_rtu_pst_dis_inst0_freg_vld      (idu_rtu_pst_dis_inst0_freg_vld     ),
  .idu_rtu_pst_dis_inst0_preg_vld      (idu_rtu_pst_dis_inst0_preg_vld     ),
  .idu_rtu_pst_dis_inst0_vreg_vld      (idu_rtu_pst_dis_inst0_vreg_vld     ),
  .idu_rtu_pst_dis_inst1_ereg_vld      (idu_rtu_pst_dis_inst1_ereg_vld     ),
  .idu_rtu_pst_dis_inst1_freg_vld      (idu_rtu_pst_dis_inst1_freg_vld     ),
  .idu_rtu_pst_dis_inst1_preg_vld      (idu_rtu_pst_dis_inst1_preg_vld     ),
  .idu_rtu_pst_dis_inst1_vreg_vld      (idu_rtu_pst_dis_inst1_vreg_vld     ),
  .idu_rtu_pst_dis_inst2_ereg_vld      (idu_rtu_pst_dis_inst2_ereg_vld     ),
  .idu_rtu_pst_dis_inst2_freg_vld      (idu_rtu_pst_dis_inst2_freg_vld     ),
  .idu_rtu_pst_dis_inst2_preg_vld      (idu_rtu_pst_dis_inst2_preg_vld     ),
  .idu_rtu_pst_dis_inst2_vreg_vld      (idu_rtu_pst_dis_inst2_vreg_vld     ),
  .idu_rtu_pst_dis_inst3_ereg_vld      (idu_rtu_pst_dis_inst3_ereg_vld     ),
  .idu_rtu_pst_dis_inst3_freg_vld      (idu_rtu_pst_dis_inst3_freg_vld     ),
  .idu_rtu_pst_dis_inst3_preg_vld      (idu_rtu_pst_dis_inst3_preg_vld     ),
  .idu_rtu_pst_dis_inst3_vreg_vld      (idu_rtu_pst_dis_inst3_vreg_vld     ),
  .idu_rtu_rob_create0_dp_en           (idu_rtu_rob_create0_dp_en          ),
  .idu_rtu_rob_create0_en              (idu_rtu_rob_create0_en             ),
  .idu_rtu_rob_create0_gateclk_en      (idu_rtu_rob_create0_gateclk_en     ),
  .idu_rtu_rob_create1_dp_en           (idu_rtu_rob_create1_dp_en          ),
  .idu_rtu_rob_create1_en              (idu_rtu_rob_create1_en             ),
  .idu_rtu_rob_create1_gateclk_en      (idu_rtu_rob_create1_gateclk_en     ),
  .idu_rtu_rob_create2_dp_en           (idu_rtu_rob_create2_dp_en          ),
  .idu_rtu_rob_create2_en              (idu_rtu_rob_create2_en             ),
  .idu_rtu_rob_create2_gateclk_en      (idu_rtu_rob_create2_gateclk_en     ),
  .idu_rtu_rob_create3_dp_en           (idu_rtu_rob_create3_dp_en          ),
  .idu_rtu_rob_create3_en              (idu_rtu_rob_create3_en             ),
  .idu_rtu_rob_create3_gateclk_en      (idu_rtu_rob_create3_gateclk_en     ),
  .iu_yy_xx_cancel                     (iu_yy_xx_cancel                    ),
  .lsiq_ctrl_1_left_updt               (lsiq_ctrl_1_left_updt              ),
  .lsiq_ctrl_empty                     (lsiq_ctrl_empty                    ),
  .lsiq_ctrl_full                      (lsiq_ctrl_full                     ),
  .lsiq_ctrl_full_updt                 (lsiq_ctrl_full_updt                ),
  .lsiq_ctrl_full_updt_clk_en          (lsiq_ctrl_full_updt_clk_en         ),
  .lsu_idu_vmb_1_left_updt             (lsu_idu_vmb_1_left_updt            ),
  .lsu_idu_vmb_empty                   (lsu_idu_vmb_empty                  ),
  .lsu_idu_vmb_full                    (lsu_idu_vmb_full                   ),
  .lsu_idu_vmb_full_updt               (lsu_idu_vmb_full_updt              ),
  .lsu_idu_vmb_full_updt_clk_en        (lsu_idu_vmb_full_updt_clk_en       ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .rtu_idu_flush_fe                    (rtu_idu_flush_fe                   ),
  .rtu_idu_flush_is                    (rtu_idu_flush_is                   ),
  .rtu_idu_rob_full                    (rtu_idu_rob_full                   ),
  .rtu_yy_xx_flush                     (rtu_yy_xx_flush                    ),
  .sdiq_ctrl_1_left_updt               (sdiq_ctrl_1_left_updt              ),
  .sdiq_ctrl_empty                     (sdiq_ctrl_empty                    ),
  .sdiq_ctrl_full                      (sdiq_ctrl_full                     ),
  .sdiq_ctrl_full_updt                 (sdiq_ctrl_full_updt                ),
  .sdiq_ctrl_full_updt_clk_en          (sdiq_ctrl_full_updt_clk_en         ),
  .viq0_ctrl_1_left_updt               (viq0_ctrl_1_left_updt              ),
  .viq0_ctrl_empty                     (viq0_ctrl_empty                    ),
  .viq0_ctrl_full                      (viq0_ctrl_full                     ),
  .viq0_ctrl_full_updt                 (viq0_ctrl_full_updt                ),
  .viq0_ctrl_full_updt_clk_en          (viq0_ctrl_full_updt_clk_en         ),
  .viq1_ctrl_1_left_updt               (viq1_ctrl_1_left_updt              ),
  .viq1_ctrl_empty                     (viq1_ctrl_empty                    ),
  .viq1_ctrl_full                      (viq1_ctrl_full                     ),
  .viq1_ctrl_full_updt                 (viq1_ctrl_full_updt                ),
  .viq1_ctrl_full_updt_clk_en          (viq1_ctrl_full_updt_clk_en         )
);

// &ConnRule(s/_dupx/_dup1/); @52
// &Instance("ct_idu_is_dp", "x_ct_idu_is_dp"); @53
ct_idu_is_dp  x_ct_idu_is_dp (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_dis_inst0_ereg_vld              (ctrl_dp_dis_inst0_ereg_vld             ),
  .ctrl_dp_dis_inst0_freg_vld              (ctrl_dp_dis_inst0_freg_vld             ),
  .ctrl_dp_dis_inst0_preg_vld              (ctrl_dp_dis_inst0_preg_vld             ),
  .ctrl_dp_dis_inst0_vreg_vld              (ctrl_dp_dis_inst0_vreg_vld             ),
  .ctrl_dp_dis_inst1_ereg_vld              (ctrl_dp_dis_inst1_ereg_vld             ),
  .ctrl_dp_dis_inst1_freg_vld              (ctrl_dp_dis_inst1_freg_vld             ),
  .ctrl_dp_dis_inst1_preg_vld              (ctrl_dp_dis_inst1_preg_vld             ),
  .ctrl_dp_dis_inst1_vreg_vld              (ctrl_dp_dis_inst1_vreg_vld             ),
  .ctrl_dp_dis_inst2_ereg_vld              (ctrl_dp_dis_inst2_ereg_vld             ),
  .ctrl_dp_dis_inst2_freg_vld              (ctrl_dp_dis_inst2_freg_vld             ),
  .ctrl_dp_dis_inst2_preg_vld              (ctrl_dp_dis_inst2_preg_vld             ),
  .ctrl_dp_dis_inst2_vreg_vld              (ctrl_dp_dis_inst2_vreg_vld             ),
  .ctrl_dp_dis_inst3_ereg_vld              (ctrl_dp_dis_inst3_ereg_vld             ),
  .ctrl_dp_dis_inst3_freg_vld              (ctrl_dp_dis_inst3_freg_vld             ),
  .ctrl_dp_dis_inst3_preg_vld              (ctrl_dp_dis_inst3_preg_vld             ),
  .ctrl_dp_dis_inst3_vreg_vld              (ctrl_dp_dis_inst3_vreg_vld             ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_pst_create1_iid_sel      (ctrl_dp_is_dis_pst_create1_iid_sel     ),
  .ctrl_dp_is_dis_pst_create2_iid_sel      (ctrl_dp_is_dis_pst_create2_iid_sel     ),
  .ctrl_dp_is_dis_pst_create3_iid_sel      (ctrl_dp_is_dis_pst_create3_iid_sel     ),
  .ctrl_dp_is_dis_rob_create0_sel          (ctrl_dp_is_dis_rob_create0_sel         ),
  .ctrl_dp_is_dis_rob_create1_sel          (ctrl_dp_is_dis_rob_create1_sel         ),
  .ctrl_dp_is_dis_rob_create2_sel          (ctrl_dp_is_dis_rob_create2_sel         ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_dp_is_dis_stall                    (ctrl_dp_is_dis_stall                   ),
  .ctrl_dp_is_dis_viq0_create0_sel         (ctrl_dp_is_dis_viq0_create0_sel        ),
  .ctrl_dp_is_dis_viq0_create1_sel         (ctrl_dp_is_dis_viq0_create1_sel        ),
  .ctrl_dp_is_dis_viq1_create0_sel         (ctrl_dp_is_dis_viq1_create0_sel        ),
  .ctrl_dp_is_dis_viq1_create1_sel         (ctrl_dp_is_dis_viq1_create1_sel        ),
  .ctrl_dp_is_dis_vmb_create0_sel          (ctrl_dp_is_dis_vmb_create0_sel         ),
  .ctrl_dp_is_dis_vmb_create1_sel          (ctrl_dp_is_dis_vmb_create1_sel         ),
  .ctrl_dp_is_inst0_vld                    (ctrl_dp_is_inst0_vld                   ),
  .ctrl_dp_is_inst1_vld                    (ctrl_dp_is_inst1_vld                   ),
  .ctrl_dp_is_inst2_vld                    (ctrl_dp_is_inst2_vld                   ),
  .ctrl_dp_is_inst3_vld                    (ctrl_dp_is_inst3_vld                   ),
  .ctrl_ir_pipedown                        (ctrl_ir_pipedown                       ),
  .ctrl_ir_pipedown_gateclk                (ctrl_ir_pipedown_gateclk               ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_viq0_create0_dp_en                 (ctrl_viq0_create0_dp_en                ),
  .ctrl_viq0_create0_gateclk_en            (ctrl_viq0_create0_gateclk_en           ),
  .ctrl_viq0_create1_dp_en                 (ctrl_viq0_create1_dp_en                ),
  .ctrl_viq0_create1_gateclk_en            (ctrl_viq0_create1_gateclk_en           ),
  .ctrl_viq1_create0_dp_en                 (ctrl_viq1_create0_dp_en                ),
  .ctrl_viq1_create0_gateclk_en            (ctrl_viq1_create0_gateclk_en           ),
  .ctrl_viq1_create1_dp_en                 (ctrl_viq1_create1_dp_en                ),
  .ctrl_viq1_create1_gateclk_en            (ctrl_viq1_create1_gateclk_en           ),
  .ctrl_xx_is_inst0_sel                    (ctrl_xx_is_inst0_sel                   ),
  .ctrl_xx_is_inst_sel                     (ctrl_xx_is_inst_sel                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dup1     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dup1     ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx      (ctrl_xx_rf_pipe6_vmla_lch_vld_dup1     ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx      (ctrl_xx_rf_pipe7_vmla_lch_vld_dup1     ),
  .dp_aiq0_bypass_data                     (dp_aiq0_bypass_data                    ),
  .dp_aiq0_create0_data                    (dp_aiq0_create0_data                   ),
  .dp_aiq0_create1_data                    (dp_aiq0_create1_data                   ),
  .dp_aiq0_create_div                      (dp_aiq0_create_div                     ),
  .dp_aiq0_create_src0_rdy_for_bypass      (dp_aiq0_create_src0_rdy_for_bypass     ),
  .dp_aiq0_create_src1_rdy_for_bypass      (dp_aiq0_create_src1_rdy_for_bypass     ),
  .dp_aiq0_create_src2_rdy_for_bypass      (dp_aiq0_create_src2_rdy_for_bypass     ),
  .dp_aiq1_bypass_data                     (dp_aiq1_bypass_data                    ),
  .dp_aiq1_create0_data                    (dp_aiq1_create0_data                   ),
  .dp_aiq1_create1_data                    (dp_aiq1_create1_data                   ),
  .dp_aiq1_create_alu                      (dp_aiq1_create_alu                     ),
  .dp_aiq1_create_src0_rdy_for_bypass      (dp_aiq1_create_src0_rdy_for_bypass     ),
  .dp_aiq1_create_src1_rdy_for_bypass      (dp_aiq1_create_src1_rdy_for_bypass     ),
  .dp_aiq1_create_src2_rdy_for_bypass      (dp_aiq1_create_src2_rdy_for_bypass     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_biq_bypass_data                      (dp_biq_bypass_data                     ),
  .dp_biq_create0_data                     (dp_biq_create0_data                    ),
  .dp_biq_create1_data                     (dp_biq_create1_data                    ),
  .dp_biq_create_src0_rdy_for_bypass       (dp_biq_create_src0_rdy_for_bypass      ),
  .dp_biq_create_src1_rdy_for_bypass       (dp_biq_create_src1_rdy_for_bypass      ),
  .dp_ctrl_is_dis_inst2_ctrl_info          (dp_ctrl_is_dis_inst2_ctrl_info         ),
  .dp_ctrl_is_dis_inst3_ctrl_info          (dp_ctrl_is_dis_inst3_ctrl_info         ),
  .dp_ctrl_is_inst0_bar                    (dp_ctrl_is_inst0_bar                   ),
  .dp_ctrl_is_inst0_dst_vld                (dp_ctrl_is_inst0_dst_vld               ),
  .dp_ctrl_is_inst0_dste_vld               (dp_ctrl_is_inst0_dste_vld              ),
  .dp_ctrl_is_inst0_dstv_vec               (dp_ctrl_is_inst0_dstv_vec              ),
  .dp_ctrl_is_inst0_dstv_vld               (dp_ctrl_is_inst0_dstv_vld              ),
  .dp_ctrl_is_inst0_pcfifo                 (dp_ctrl_is_inst0_pcfifo                ),
  .dp_ctrl_is_inst1_bar                    (dp_ctrl_is_inst1_bar                   ),
  .dp_ctrl_is_inst1_dst_vld                (dp_ctrl_is_inst1_dst_vld               ),
  .dp_ctrl_is_inst1_dste_vld               (dp_ctrl_is_inst1_dste_vld              ),
  .dp_ctrl_is_inst1_dstv_vec               (dp_ctrl_is_inst1_dstv_vec              ),
  .dp_ctrl_is_inst1_dstv_vld               (dp_ctrl_is_inst1_dstv_vld              ),
  .dp_ctrl_is_inst1_pcfifo                 (dp_ctrl_is_inst1_pcfifo                ),
  .dp_ctrl_is_inst2_bar                    (dp_ctrl_is_inst2_bar                   ),
  .dp_ctrl_is_inst2_dst_vld                (dp_ctrl_is_inst2_dst_vld               ),
  .dp_ctrl_is_inst2_dste_vld               (dp_ctrl_is_inst2_dste_vld              ),
  .dp_ctrl_is_inst2_dstv_vec               (dp_ctrl_is_inst2_dstv_vec              ),
  .dp_ctrl_is_inst2_dstv_vld               (dp_ctrl_is_inst2_dstv_vld              ),
  .dp_ctrl_is_inst2_pcfifo                 (dp_ctrl_is_inst2_pcfifo                ),
  .dp_ctrl_is_inst3_bar                    (dp_ctrl_is_inst3_bar                   ),
  .dp_ctrl_is_inst3_dst_vld                (dp_ctrl_is_inst3_dst_vld               ),
  .dp_ctrl_is_inst3_dste_vld               (dp_ctrl_is_inst3_dste_vld              ),
  .dp_ctrl_is_inst3_dstv_vec               (dp_ctrl_is_inst3_dstv_vec              ),
  .dp_ctrl_is_inst3_dstv_vld               (dp_ctrl_is_inst3_dstv_vld              ),
  .dp_ctrl_is_inst3_pcfifo                 (dp_ctrl_is_inst3_pcfifo                ),
  .dp_ir_inst01_src_match                  (dp_ir_inst01_src_match                 ),
  .dp_ir_inst02_src_match                  (dp_ir_inst02_src_match                 ),
  .dp_ir_inst03_src_match                  (dp_ir_inst03_src_match                 ),
  .dp_ir_inst0_data                        (dp_ir_inst0_data                       ),
  .dp_ir_inst12_src_match                  (dp_ir_inst12_src_match                 ),
  .dp_ir_inst13_src_match                  (dp_ir_inst13_src_match                 ),
  .dp_ir_inst1_data                        (dp_ir_inst1_data                       ),
  .dp_ir_inst23_src_match                  (dp_ir_inst23_src_match                 ),
  .dp_ir_inst2_data                        (dp_ir_inst2_data                       ),
  .dp_ir_inst3_data                        (dp_ir_inst3_data                       ),
  .dp_lsiq_bypass_data                     (dp_lsiq_bypass_data                    ),
  .dp_lsiq_create0_bar                     (dp_lsiq_create0_bar                    ),
  .dp_lsiq_create0_data                    (dp_lsiq_create0_data                   ),
  .dp_lsiq_create0_load                    (dp_lsiq_create0_load                   ),
  .dp_lsiq_create0_no_spec                 (dp_lsiq_create0_no_spec                ),
  .dp_lsiq_create0_src0_rdy_for_bypass     (dp_lsiq_create0_src0_rdy_for_bypass    ),
  .dp_lsiq_create0_src1_rdy_for_bypass     (dp_lsiq_create0_src1_rdy_for_bypass    ),
  .dp_lsiq_create0_srcvm_rdy_for_bypass    (dp_lsiq_create0_srcvm_rdy_for_bypass   ),
  .dp_lsiq_create0_store                   (dp_lsiq_create0_store                  ),
  .dp_lsiq_create1_bar                     (dp_lsiq_create1_bar                    ),
  .dp_lsiq_create1_data                    (dp_lsiq_create1_data                   ),
  .dp_lsiq_create1_load                    (dp_lsiq_create1_load                   ),
  .dp_lsiq_create1_no_spec                 (dp_lsiq_create1_no_spec                ),
  .dp_lsiq_create1_store                   (dp_lsiq_create1_store                  ),
  .dp_sdiq_create0_data                    (dp_sdiq_create0_data                   ),
  .dp_sdiq_create1_data                    (dp_sdiq_create1_data                   ),
  .dp_viq0_bypass_data                     (dp_viq0_bypass_data                    ),
  .dp_viq0_create0_data                    (dp_viq0_create0_data                   ),
  .dp_viq0_create1_data                    (dp_viq0_create1_data                   ),
  .dp_viq0_create_srcv0_rdy_for_bypass     (dp_viq0_create_srcv0_rdy_for_bypass    ),
  .dp_viq0_create_srcv1_rdy_for_bypass     (dp_viq0_create_srcv1_rdy_for_bypass    ),
  .dp_viq0_create_srcv2_rdy_for_bypass     (dp_viq0_create_srcv2_rdy_for_bypass    ),
  .dp_viq0_create_srcvm_rdy_for_bypass     (dp_viq0_create_srcvm_rdy_for_bypass    ),
  .dp_viq0_create_vdiv                     (dp_viq0_create_vdiv                    ),
  .dp_viq1_bypass_data                     (dp_viq1_bypass_data                    ),
  .dp_viq1_create0_data                    (dp_viq1_create0_data                   ),
  .dp_viq1_create1_data                    (dp_viq1_create1_data                   ),
  .dp_viq1_create_srcv0_rdy_for_bypass     (dp_viq1_create_srcv0_rdy_for_bypass    ),
  .dp_viq1_create_srcv1_rdy_for_bypass     (dp_viq1_create_srcv1_rdy_for_bypass    ),
  .dp_viq1_create_srcv2_rdy_for_bypass     (dp_viq1_create_srcv2_rdy_for_bypass    ),
  .dp_viq1_create_srcvm_rdy_for_bypass     (dp_viq1_create_srcvm_rdy_for_bypass    ),
  .dp_viq_dis_inst0_srcv2_vreg             (dp_viq_dis_inst0_srcv2_vreg            ),
  .dp_viq_dis_inst1_srcv2_vreg             (dp_viq_dis_inst1_srcv2_vreg            ),
  .dp_viq_dis_inst2_srcv2_vreg             (dp_viq_dis_inst2_srcv2_vreg            ),
  .dp_viq_dis_inst3_srcv2_vreg             (dp_viq_dis_inst3_srcv2_vreg            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dup1           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dup1           ),
  .dp_xx_rf_pipe6_dst_vreg_dupx            (dp_xx_rf_pipe6_dst_vreg_dup1           ),
  .dp_xx_rf_pipe7_dst_vreg_dupx            (dp_xx_rf_pipe7_dst_vreg_dup1           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .idu_lsu_vmb_create0_dst_ready           (idu_lsu_vmb_create0_dst_ready          ),
  .idu_lsu_vmb_create0_sdiq_entry          (idu_lsu_vmb_create0_sdiq_entry         ),
  .idu_lsu_vmb_create0_split_num           (idu_lsu_vmb_create0_split_num          ),
  .idu_lsu_vmb_create0_unit_stride         (idu_lsu_vmb_create0_unit_stride        ),
  .idu_lsu_vmb_create0_vamo                (idu_lsu_vmb_create0_vamo               ),
  .idu_lsu_vmb_create0_vl                  (idu_lsu_vmb_create0_vl                 ),
  .idu_lsu_vmb_create0_vreg                (idu_lsu_vmb_create0_vreg               ),
  .idu_lsu_vmb_create0_vsew                (idu_lsu_vmb_create0_vsew               ),
  .idu_lsu_vmb_create1_dst_ready           (idu_lsu_vmb_create1_dst_ready          ),
  .idu_lsu_vmb_create1_sdiq_entry          (idu_lsu_vmb_create1_sdiq_entry         ),
  .idu_lsu_vmb_create1_split_num           (idu_lsu_vmb_create1_split_num          ),
  .idu_lsu_vmb_create1_unit_stride         (idu_lsu_vmb_create1_unit_stride        ),
  .idu_lsu_vmb_create1_vamo                (idu_lsu_vmb_create1_vamo               ),
  .idu_lsu_vmb_create1_vl                  (idu_lsu_vmb_create1_vl                 ),
  .idu_lsu_vmb_create1_vreg                (idu_lsu_vmb_create1_vreg               ),
  .idu_lsu_vmb_create1_vsew                (idu_lsu_vmb_create1_vsew               ),
  .idu_rtu_pst_dis_inst0_dst_reg           (idu_rtu_pst_dis_inst0_dst_reg          ),
  .idu_rtu_pst_dis_inst0_dstv_reg          (idu_rtu_pst_dis_inst0_dstv_reg         ),
  .idu_rtu_pst_dis_inst0_ereg              (idu_rtu_pst_dis_inst0_ereg             ),
  .idu_rtu_pst_dis_inst0_ereg_iid          (idu_rtu_pst_dis_inst0_ereg_iid         ),
  .idu_rtu_pst_dis_inst0_preg              (idu_rtu_pst_dis_inst0_preg             ),
  .idu_rtu_pst_dis_inst0_preg_iid          (idu_rtu_pst_dis_inst0_preg_iid         ),
  .idu_rtu_pst_dis_inst0_rel_ereg          (idu_rtu_pst_dis_inst0_rel_ereg         ),
  .idu_rtu_pst_dis_inst0_rel_preg          (idu_rtu_pst_dis_inst0_rel_preg         ),
  .idu_rtu_pst_dis_inst0_rel_vreg          (idu_rtu_pst_dis_inst0_rel_vreg         ),
  .idu_rtu_pst_dis_inst0_vreg              (idu_rtu_pst_dis_inst0_vreg             ),
  .idu_rtu_pst_dis_inst0_vreg_iid          (idu_rtu_pst_dis_inst0_vreg_iid         ),
  .idu_rtu_pst_dis_inst1_dst_reg           (idu_rtu_pst_dis_inst1_dst_reg          ),
  .idu_rtu_pst_dis_inst1_dstv_reg          (idu_rtu_pst_dis_inst1_dstv_reg         ),
  .idu_rtu_pst_dis_inst1_ereg              (idu_rtu_pst_dis_inst1_ereg             ),
  .idu_rtu_pst_dis_inst1_ereg_iid          (idu_rtu_pst_dis_inst1_ereg_iid         ),
  .idu_rtu_pst_dis_inst1_preg              (idu_rtu_pst_dis_inst1_preg             ),
  .idu_rtu_pst_dis_inst1_preg_iid          (idu_rtu_pst_dis_inst1_preg_iid         ),
  .idu_rtu_pst_dis_inst1_rel_ereg          (idu_rtu_pst_dis_inst1_rel_ereg         ),
  .idu_rtu_pst_dis_inst1_rel_preg          (idu_rtu_pst_dis_inst1_rel_preg         ),
  .idu_rtu_pst_dis_inst1_rel_vreg          (idu_rtu_pst_dis_inst1_rel_vreg         ),
  .idu_rtu_pst_dis_inst1_vreg              (idu_rtu_pst_dis_inst1_vreg             ),
  .idu_rtu_pst_dis_inst1_vreg_iid          (idu_rtu_pst_dis_inst1_vreg_iid         ),
  .idu_rtu_pst_dis_inst2_dst_reg           (idu_rtu_pst_dis_inst2_dst_reg          ),
  .idu_rtu_pst_dis_inst2_dstv_reg          (idu_rtu_pst_dis_inst2_dstv_reg         ),
  .idu_rtu_pst_dis_inst2_ereg              (idu_rtu_pst_dis_inst2_ereg             ),
  .idu_rtu_pst_dis_inst2_ereg_iid          (idu_rtu_pst_dis_inst2_ereg_iid         ),
  .idu_rtu_pst_dis_inst2_preg              (idu_rtu_pst_dis_inst2_preg             ),
  .idu_rtu_pst_dis_inst2_preg_iid          (idu_rtu_pst_dis_inst2_preg_iid         ),
  .idu_rtu_pst_dis_inst2_rel_ereg          (idu_rtu_pst_dis_inst2_rel_ereg         ),
  .idu_rtu_pst_dis_inst2_rel_preg          (idu_rtu_pst_dis_inst2_rel_preg         ),
  .idu_rtu_pst_dis_inst2_rel_vreg          (idu_rtu_pst_dis_inst2_rel_vreg         ),
  .idu_rtu_pst_dis_inst2_vreg              (idu_rtu_pst_dis_inst2_vreg             ),
  .idu_rtu_pst_dis_inst2_vreg_iid          (idu_rtu_pst_dis_inst2_vreg_iid         ),
  .idu_rtu_pst_dis_inst3_dst_reg           (idu_rtu_pst_dis_inst3_dst_reg          ),
  .idu_rtu_pst_dis_inst3_dstv_reg          (idu_rtu_pst_dis_inst3_dstv_reg         ),
  .idu_rtu_pst_dis_inst3_ereg              (idu_rtu_pst_dis_inst3_ereg             ),
  .idu_rtu_pst_dis_inst3_ereg_iid          (idu_rtu_pst_dis_inst3_ereg_iid         ),
  .idu_rtu_pst_dis_inst3_preg              (idu_rtu_pst_dis_inst3_preg             ),
  .idu_rtu_pst_dis_inst3_preg_iid          (idu_rtu_pst_dis_inst3_preg_iid         ),
  .idu_rtu_pst_dis_inst3_rel_ereg          (idu_rtu_pst_dis_inst3_rel_ereg         ),
  .idu_rtu_pst_dis_inst3_rel_preg          (idu_rtu_pst_dis_inst3_rel_preg         ),
  .idu_rtu_pst_dis_inst3_rel_vreg          (idu_rtu_pst_dis_inst3_rel_vreg         ),
  .idu_rtu_pst_dis_inst3_vreg              (idu_rtu_pst_dis_inst3_vreg             ),
  .idu_rtu_pst_dis_inst3_vreg_iid          (idu_rtu_pst_dis_inst3_vreg_iid         ),
  .idu_rtu_rob_create0_data                (idu_rtu_rob_create0_data               ),
  .idu_rtu_rob_create1_data                (idu_rtu_rob_create1_data               ),
  .idu_rtu_rob_create2_data                (idu_rtu_rob_create2_data               ),
  .idu_rtu_rob_create3_data                (idu_rtu_rob_create3_data               ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dup1                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dup1          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dup1      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dup1    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dup1             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dup1          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dup1      ),
  .iu_idu_pcfifo_dis_inst0_pid             (iu_idu_pcfifo_dis_inst0_pid            ),
  .iu_idu_pcfifo_dis_inst1_pid             (iu_idu_pcfifo_dis_inst1_pid            ),
  .iu_idu_pcfifo_dis_inst2_pid             (iu_idu_pcfifo_dis_inst2_pid            ),
  .iu_idu_pcfifo_dis_inst3_pid             (iu_idu_pcfifo_dis_inst3_pid            ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
  .lsiq_dp_create_bypass_oldest            (lsiq_dp_create_bypass_oldest           ),
  .lsiq_dp_no_spec_store_vld               (lsiq_dp_no_spec_store_vld              ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dup1             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dup1             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dup1    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dup1             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dup1   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dup1             ),
  .lsu_idu_vmb_create0_entry               (lsu_idu_vmb_create0_entry              ),
  .lsu_idu_vmb_create1_entry               (lsu_idu_vmb_create1_entry              ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dup1          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dup1      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dup1          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dup1      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .rtu_idu_retire_int_vld                  (rtu_idu_retire_int_vld                 ),
  .rtu_idu_rob_inst0_iid                   (rtu_idu_rob_inst0_iid                  ),
  .rtu_idu_rob_inst1_iid                   (rtu_idu_rob_inst1_iid                  ),
  .rtu_idu_rob_inst2_iid                   (rtu_idu_rob_inst2_iid                  ),
  .rtu_idu_rob_inst3_iid                   (rtu_idu_rob_inst3_iid                  ),
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .sdiq_dp_create0_entry                   (sdiq_dp_create0_entry                  ),
  .sdiq_dp_create1_entry                   (sdiq_dp_create1_entry                  ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx   (vfpu_idu_ex1_pipe6_fmla_data_vld_dup1  ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dup1           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dup1           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx   (vfpu_idu_ex1_pipe7_fmla_data_vld_dup1  ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dup1           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dup1           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx   (vfpu_idu_ex2_pipe6_fmla_data_vld_dup1  ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dup1           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx   (vfpu_idu_ex2_pipe7_fmla_data_vld_dup1  ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dup1           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dup1           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dup1           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1    ),
  .viq0_viq_create0_entry                  (viq0_viq_create0_entry                 ),
  .viq0_viq_create1_entry                  (viq0_viq_create1_entry                 ),
  .viq1_viq_create0_entry                  (viq1_viq_create0_entry                 ),
  .viq1_viq_create1_entry                  (viq1_viq_create1_entry                 )
);

// &ConnRule(s/_dupx/_dup2/); @54
// &Instance("ct_idu_is_aiq0", "x_ct_idu_is_aiq0"); @55
ct_idu_is_aiq0  x_ct_idu_is_aiq0 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq0_ctrl_1_left_updt                   (aiq0_ctrl_1_left_updt                  ),
  .aiq0_ctrl_empty                         (aiq0_ctrl_empty                        ),
  .aiq0_ctrl_entry_cnt_updt_val            (aiq0_ctrl_entry_cnt_updt_val           ),
  .aiq0_ctrl_entry_cnt_updt_vld            (aiq0_ctrl_entry_cnt_updt_vld           ),
  .aiq0_ctrl_full                          (aiq0_ctrl_full                         ),
  .aiq0_ctrl_full_updt                     (aiq0_ctrl_full_updt                    ),
  .aiq0_ctrl_full_updt_clk_en              (aiq0_ctrl_full_updt_clk_en             ),
  .aiq0_dp_issue_entry                     (aiq0_dp_issue_entry                    ),
  .aiq0_dp_issue_read_data                 (aiq0_dp_issue_read_data                ),
  .aiq0_top_aiq0_entry_cnt                 (aiq0_top_aiq0_entry_cnt                ),
  .aiq0_xx_gateclk_issue_en                (aiq0_xx_gateclk_issue_en               ),
  .aiq0_xx_issue_en                        (aiq0_xx_issue_en                       ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_idu_iq_bypass_disable               (cp0_idu_iq_bypass_disable              ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_en                    (ctrl_aiq0_create0_en                   ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_en                    (ctrl_aiq0_create1_en                   ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq0_rf_lch_fail_vld               (ctrl_aiq0_rf_lch_fail_vld              ),
  .ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld      (ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld     ),
  .ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld      (ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld     ),
  .ctrl_aiq0_rf_pop_dlb_vld                (ctrl_aiq0_rf_pop_dlb_vld               ),
  .ctrl_aiq0_rf_pop_vld                    (ctrl_aiq0_rf_pop_vld                   ),
  .ctrl_aiq0_stall                         (ctrl_aiq0_stall                        ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dup2     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dup2     ),
  .dp_aiq0_bypass_data                     (dp_aiq0_bypass_data                    ),
  .dp_aiq0_create0_data                    (dp_aiq0_create0_data                   ),
  .dp_aiq0_create1_data                    (dp_aiq0_create1_data                   ),
  .dp_aiq0_create_div                      (dp_aiq0_create_div                     ),
  .dp_aiq0_create_src0_rdy_for_bypass      (dp_aiq0_create_src0_rdy_for_bypass     ),
  .dp_aiq0_create_src1_rdy_for_bypass      (dp_aiq0_create_src1_rdy_for_bypass     ),
  .dp_aiq0_create_src2_rdy_for_bypass      (dp_aiq0_create_src2_rdy_for_bypass     ),
  .dp_aiq0_rf_lch_entry                    (dp_aiq0_rf_lch_entry                   ),
  .dp_aiq0_rf_rdy_clr                      (dp_aiq0_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dup2           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dup2           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_busy                         (iu_idu_div_busy                        ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dup2                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dup2          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dup2      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dup2    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dup2             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dup2          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dup2      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dup2             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dup2    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dup2             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dup2          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dup2      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup2  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dup2           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup2  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dup2           )
);

// &ConnRule(s/_dupx/_dup3/); @56
// &Instance("ct_idu_is_aiq1", "x_ct_idu_is_aiq1"); @57
ct_idu_is_aiq1  x_ct_idu_is_aiq1 (
  .aiq0_aiq_create0_entry                  (aiq0_aiq_create0_entry                 ),
  .aiq0_aiq_create1_entry                  (aiq0_aiq_create1_entry                 ),
  .aiq1_aiq_create0_entry                  (aiq1_aiq_create0_entry                 ),
  .aiq1_aiq_create1_entry                  (aiq1_aiq_create1_entry                 ),
  .aiq1_ctrl_1_left_updt                   (aiq1_ctrl_1_left_updt                  ),
  .aiq1_ctrl_empty                         (aiq1_ctrl_empty                        ),
  .aiq1_ctrl_entry_cnt_updt_val            (aiq1_ctrl_entry_cnt_updt_val           ),
  .aiq1_ctrl_entry_cnt_updt_vld            (aiq1_ctrl_entry_cnt_updt_vld           ),
  .aiq1_ctrl_full                          (aiq1_ctrl_full                         ),
  .aiq1_ctrl_full_updt                     (aiq1_ctrl_full_updt                    ),
  .aiq1_ctrl_full_updt_clk_en              (aiq1_ctrl_full_updt_clk_en             ),
  .aiq1_dp_issue_entry                     (aiq1_dp_issue_entry                    ),
  .aiq1_dp_issue_read_data                 (aiq1_dp_issue_read_data                ),
  .aiq1_top_aiq1_entry_cnt                 (aiq1_top_aiq1_entry_cnt                ),
  .aiq1_xx_gateclk_issue_en                (aiq1_xx_gateclk_issue_en               ),
  .aiq1_xx_issue_en                        (aiq1_xx_issue_en                       ),
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_idu_iq_bypass_disable               (cp0_idu_iq_bypass_disable              ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_aiq0_create0_dp_en                 (ctrl_aiq0_create0_dp_en                ),
  .ctrl_aiq0_create0_gateclk_en            (ctrl_aiq0_create0_gateclk_en           ),
  .ctrl_aiq0_create1_dp_en                 (ctrl_aiq0_create1_dp_en                ),
  .ctrl_aiq0_create1_gateclk_en            (ctrl_aiq0_create1_gateclk_en           ),
  .ctrl_aiq1_create0_dp_en                 (ctrl_aiq1_create0_dp_en                ),
  .ctrl_aiq1_create0_en                    (ctrl_aiq1_create0_en                   ),
  .ctrl_aiq1_create0_gateclk_en            (ctrl_aiq1_create0_gateclk_en           ),
  .ctrl_aiq1_create1_dp_en                 (ctrl_aiq1_create1_dp_en                ),
  .ctrl_aiq1_create1_en                    (ctrl_aiq1_create1_en                   ),
  .ctrl_aiq1_create1_gateclk_en            (ctrl_aiq1_create1_gateclk_en           ),
  .ctrl_aiq1_rf_lch_fail_vld               (ctrl_aiq1_rf_lch_fail_vld              ),
  .ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld      (ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld     ),
  .ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld      (ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld     ),
  .ctrl_aiq1_rf_pipe1_mla_reg_lch_vld      (ctrl_aiq1_rf_pipe1_mla_reg_lch_vld     ),
  .ctrl_aiq1_rf_pop_dlb_vld                (ctrl_aiq1_rf_pop_dlb_vld               ),
  .ctrl_aiq1_rf_pop_vld                    (ctrl_aiq1_rf_pop_vld                   ),
  .ctrl_aiq1_stall                         (ctrl_aiq1_stall                        ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_dp_is_dis_aiq0_create0_sel         (ctrl_dp_is_dis_aiq0_create0_sel        ),
  .ctrl_dp_is_dis_aiq0_create1_sel         (ctrl_dp_is_dis_aiq0_create1_sel        ),
  .ctrl_dp_is_dis_aiq1_create0_sel         (ctrl_dp_is_dis_aiq1_create0_sel        ),
  .ctrl_dp_is_dis_aiq1_create1_sel         (ctrl_dp_is_dis_aiq1_create1_sel        ),
  .ctrl_dp_is_dis_biq_create0_sel          (ctrl_dp_is_dis_biq_create0_sel         ),
  .ctrl_dp_is_dis_biq_create1_sel          (ctrl_dp_is_dis_biq_create1_sel         ),
  .ctrl_dp_is_dis_lsiq_create0_sel         (ctrl_dp_is_dis_lsiq_create0_sel        ),
  .ctrl_dp_is_dis_lsiq_create1_sel         (ctrl_dp_is_dis_lsiq_create1_sel        ),
  .ctrl_dp_is_dis_sdiq_create0_sel         (ctrl_dp_is_dis_sdiq_create0_sel        ),
  .ctrl_dp_is_dis_sdiq_create1_sel         (ctrl_dp_is_dis_sdiq_create1_sel        ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dup3     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dup3     ),
  .dp_aiq1_bypass_data                     (dp_aiq1_bypass_data                    ),
  .dp_aiq1_create0_data                    (dp_aiq1_create0_data                   ),
  .dp_aiq1_create1_data                    (dp_aiq1_create1_data                   ),
  .dp_aiq1_create_alu                      (dp_aiq1_create_alu                     ),
  .dp_aiq1_create_src0_rdy_for_bypass      (dp_aiq1_create_src0_rdy_for_bypass     ),
  .dp_aiq1_create_src1_rdy_for_bypass      (dp_aiq1_create_src1_rdy_for_bypass     ),
  .dp_aiq1_create_src2_rdy_for_bypass      (dp_aiq1_create_src2_rdy_for_bypass     ),
  .dp_aiq1_rf_lch_entry                    (dp_aiq1_rf_lch_entry                   ),
  .dp_aiq1_rf_rdy_clr                      (dp_aiq1_rf_rdy_clr                     ),
  .dp_aiq_dis_inst0_src0_preg              (dp_aiq_dis_inst0_src0_preg             ),
  .dp_aiq_dis_inst0_src1_preg              (dp_aiq_dis_inst0_src1_preg             ),
  .dp_aiq_dis_inst0_src2_preg              (dp_aiq_dis_inst0_src2_preg             ),
  .dp_aiq_dis_inst1_src0_preg              (dp_aiq_dis_inst1_src0_preg             ),
  .dp_aiq_dis_inst1_src1_preg              (dp_aiq_dis_inst1_src1_preg             ),
  .dp_aiq_dis_inst1_src2_preg              (dp_aiq_dis_inst1_src2_preg             ),
  .dp_aiq_dis_inst2_src0_preg              (dp_aiq_dis_inst2_src0_preg             ),
  .dp_aiq_dis_inst2_src1_preg              (dp_aiq_dis_inst2_src1_preg             ),
  .dp_aiq_dis_inst2_src2_preg              (dp_aiq_dis_inst2_src2_preg             ),
  .dp_aiq_dis_inst3_src0_preg              (dp_aiq_dis_inst3_src0_preg             ),
  .dp_aiq_dis_inst3_src1_preg              (dp_aiq_dis_inst3_src1_preg             ),
  .dp_aiq_dis_inst3_src2_preg              (dp_aiq_dis_inst3_src2_preg             ),
  .dp_aiq_sdiq_create0_src_sel             (dp_aiq_sdiq_create0_src_sel            ),
  .dp_aiq_sdiq_create1_src_sel             (dp_aiq_sdiq_create1_src_sel            ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dup3           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dup3           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dup3                   ),
  .iu_idu_ex1_pipe1_mult_stall             (iu_idu_ex1_pipe1_mult_stall            ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dup3          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dup3      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dup3    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dup3             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dup3          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dup3      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dup3             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dup3    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dup3             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dup3          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dup3      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup3  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dup3           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup3  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dup3           )
);

// &ConnRule(s/_dupx/_dup4/); @58
// &Instance("ct_idu_is_biq", "x_ct_idu_is_biq"); @59
ct_idu_is_biq  x_ct_idu_is_biq (
  .biq_aiq_create0_entry                   (biq_aiq_create0_entry                  ),
  .biq_aiq_create1_entry                   (biq_aiq_create1_entry                  ),
  .biq_ctrl_1_left_updt                    (biq_ctrl_1_left_updt                   ),
  .biq_ctrl_empty                          (biq_ctrl_empty                         ),
  .biq_ctrl_full                           (biq_ctrl_full                          ),
  .biq_ctrl_full_updt                      (biq_ctrl_full_updt                     ),
  .biq_ctrl_full_updt_clk_en               (biq_ctrl_full_updt_clk_en              ),
  .biq_dp_issue_entry                      (biq_dp_issue_entry                     ),
  .biq_dp_issue_read_data                  (biq_dp_issue_read_data                 ),
  .biq_top_biq_entry_cnt                   (biq_top_biq_entry_cnt                  ),
  .biq_xx_gateclk_issue_en                 (biq_xx_gateclk_issue_en                ),
  .biq_xx_issue_en                         (biq_xx_issue_en                        ),
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_idu_iq_bypass_disable               (cp0_idu_iq_bypass_disable              ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_biq_create0_dp_en                  (ctrl_biq_create0_dp_en                 ),
  .ctrl_biq_create0_en                     (ctrl_biq_create0_en                    ),
  .ctrl_biq_create0_gateclk_en             (ctrl_biq_create0_gateclk_en            ),
  .ctrl_biq_create1_dp_en                  (ctrl_biq_create1_dp_en                 ),
  .ctrl_biq_create1_en                     (ctrl_biq_create1_en                    ),
  .ctrl_biq_create1_gateclk_en             (ctrl_biq_create1_gateclk_en            ),
  .ctrl_biq_rf_lch_fail_vld                (ctrl_biq_rf_lch_fail_vld               ),
  .ctrl_biq_rf_pipe0_alu_reg_fwd_vld       (ctrl_biq_rf_pipe0_alu_reg_fwd_vld      ),
  .ctrl_biq_rf_pipe1_alu_reg_fwd_vld       (ctrl_biq_rf_pipe1_alu_reg_fwd_vld      ),
  .ctrl_biq_rf_pop_vld                     (ctrl_biq_rf_pop_vld                    ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dup4     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dup4     ),
  .dp_biq_bypass_data                      (dp_biq_bypass_data                     ),
  .dp_biq_create0_data                     (dp_biq_create0_data                    ),
  .dp_biq_create1_data                     (dp_biq_create1_data                    ),
  .dp_biq_create_src0_rdy_for_bypass       (dp_biq_create_src0_rdy_for_bypass      ),
  .dp_biq_create_src1_rdy_for_bypass       (dp_biq_create_src1_rdy_for_bypass      ),
  .dp_biq_rf_lch_entry                     (dp_biq_rf_lch_entry                    ),
  .dp_biq_rf_rdy_clr                       (dp_biq_rf_rdy_clr                      ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dup4           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dup4           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dup4                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dup4          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dup4      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dup4    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dup4             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dup4          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dup4      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dup4             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dup4    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dup4             ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dup4          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dup4      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup4  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dup4           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup4  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dup4           )
);

// &ConnRule(s/_dupx/_dup1/); @60
// &Instance("ct_idu_is_lsiq", "x_ct_idu_is_lsiq"); @61
ct_idu_is_lsiq  x_ct_idu_is_lsiq (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_idu_iq_bypass_disable               (cp0_idu_iq_bypass_disable              ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_lsiq_create0_dp_en                 (ctrl_lsiq_create0_dp_en                ),
  .ctrl_lsiq_create0_en                    (ctrl_lsiq_create0_en                   ),
  .ctrl_lsiq_create0_gateclk_en            (ctrl_lsiq_create0_gateclk_en           ),
  .ctrl_lsiq_create1_dp_en                 (ctrl_lsiq_create1_dp_en                ),
  .ctrl_lsiq_create1_en                    (ctrl_lsiq_create1_en                   ),
  .ctrl_lsiq_create1_gateclk_en            (ctrl_lsiq_create1_gateclk_en           ),
  .ctrl_lsiq_ir_bar_inst_vld               (ctrl_lsiq_ir_bar_inst_vld              ),
  .ctrl_lsiq_is_bar_inst_vld               (ctrl_lsiq_is_bar_inst_vld              ),
  .ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld      (ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld     ),
  .ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld      (ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld     ),
  .ctrl_lsiq_rf_pipe3_lch_fail_vld         (ctrl_lsiq_rf_pipe3_lch_fail_vld        ),
  .ctrl_lsiq_rf_pipe4_lch_fail_vld         (ctrl_lsiq_rf_pipe4_lch_fail_vld        ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dup1     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dup1     ),
  .dp_lsiq_bypass_data                     (dp_lsiq_bypass_data                    ),
  .dp_lsiq_create0_bar                     (dp_lsiq_create0_bar                    ),
  .dp_lsiq_create0_data                    (dp_lsiq_create0_data                   ),
  .dp_lsiq_create0_load                    (dp_lsiq_create0_load                   ),
  .dp_lsiq_create0_no_spec                 (dp_lsiq_create0_no_spec                ),
  .dp_lsiq_create0_src0_rdy_for_bypass     (dp_lsiq_create0_src0_rdy_for_bypass    ),
  .dp_lsiq_create0_src1_rdy_for_bypass     (dp_lsiq_create0_src1_rdy_for_bypass    ),
  .dp_lsiq_create0_srcvm_rdy_for_bypass    (dp_lsiq_create0_srcvm_rdy_for_bypass   ),
  .dp_lsiq_create0_store                   (dp_lsiq_create0_store                  ),
  .dp_lsiq_create1_bar                     (dp_lsiq_create1_bar                    ),
  .dp_lsiq_create1_data                    (dp_lsiq_create1_data                   ),
  .dp_lsiq_create1_load                    (dp_lsiq_create1_load                   ),
  .dp_lsiq_create1_no_spec                 (dp_lsiq_create1_no_spec                ),
  .dp_lsiq_create1_store                   (dp_lsiq_create1_store                  ),
  .dp_lsiq_rf_pipe3_lch_entry              (dp_lsiq_rf_pipe3_lch_entry             ),
  .dp_lsiq_rf_pipe3_rdy_clr                (dp_lsiq_rf_pipe3_rdy_clr               ),
  .dp_lsiq_rf_pipe4_lch_entry              (dp_lsiq_rf_pipe4_lch_entry             ),
  .dp_lsiq_rf_pipe4_rdy_clr                (dp_lsiq_rf_pipe4_rdy_clr               ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dup1           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dup1           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dup1                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dup1          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dup1      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dup1    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dup1             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dup1          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dup1      ),
  .lsiq_aiq_create0_entry                  (lsiq_aiq_create0_entry                 ),
  .lsiq_aiq_create1_entry                  (lsiq_aiq_create1_entry                 ),
  .lsiq_ctrl_1_left_updt                   (lsiq_ctrl_1_left_updt                  ),
  .lsiq_ctrl_empty                         (lsiq_ctrl_empty                        ),
  .lsiq_ctrl_full                          (lsiq_ctrl_full                         ),
  .lsiq_ctrl_full_updt                     (lsiq_ctrl_full_updt                    ),
  .lsiq_ctrl_full_updt_clk_en              (lsiq_ctrl_full_updt_clk_en             ),
  .lsiq_dp_create_bypass_oldest            (lsiq_dp_create_bypass_oldest           ),
  .lsiq_dp_no_spec_store_vld               (lsiq_dp_no_spec_store_vld              ),
  .lsiq_dp_pipe3_issue_entry               (lsiq_dp_pipe3_issue_entry              ),
  .lsiq_dp_pipe3_issue_read_data           (lsiq_dp_pipe3_issue_read_data          ),
  .lsiq_dp_pipe4_issue_entry               (lsiq_dp_pipe4_issue_entry              ),
  .lsiq_dp_pipe4_issue_read_data           (lsiq_dp_pipe4_issue_read_data          ),
  .lsiq_top_frz_entry_vld                  (lsiq_top_frz_entry_vld                 ),
  .lsiq_top_lsiq_entry_cnt                 (lsiq_top_lsiq_entry_cnt                ),
  .lsiq_xx_gateclk_issue_en                (lsiq_xx_gateclk_issue_en               ),
  .lsiq_xx_pipe3_issue_en                  (lsiq_xx_pipe3_issue_en                 ),
  .lsiq_xx_pipe4_issue_en                  (lsiq_xx_pipe4_issue_en                 ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dup1             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dup1             ),
  .lsu_idu_already_da                      (lsu_idu_already_da                     ),
  .lsu_idu_bkpta_data                      (lsu_idu_bkpta_data                     ),
  .lsu_idu_bkptb_data                      (lsu_idu_bkptb_data                     ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dup1    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dup1             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dup1   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dup1             ),
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
  .lsu_idu_wait_fence                      (lsu_idu_wait_fence                     ),
  .lsu_idu_wait_fence_gateclk_en           (lsu_idu_wait_fence_gateclk_en          ),
  .lsu_idu_wait_old                        (lsu_idu_wait_old                       ),
  .lsu_idu_wait_old_gateclk_en             (lsu_idu_wait_old_gateclk_en            ),
  .lsu_idu_wakeup                          (lsu_idu_wakeup                         ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dup1          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dup1      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dup1          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dup1      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_idu_flush_fe                        (rtu_idu_flush_fe                       ),
  .rtu_idu_flush_is                        (rtu_idu_flush_is                       ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dup1           ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dup1           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1    )
);

// &ConnRule(s/_dupx/_dup1/); @62
// &Instance("ct_idu_is_sdiq", "x_ct_idu_is_sdiq"); @63
ct_idu_is_sdiq  x_ct_idu_is_sdiq (
  .cp0_idu_icg_en                          (cp0_idu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ctrl_sdiq_create0_dp_en                 (ctrl_sdiq_create0_dp_en                ),
  .ctrl_sdiq_create0_en                    (ctrl_sdiq_create0_en                   ),
  .ctrl_sdiq_create0_gateclk_en            (ctrl_sdiq_create0_gateclk_en           ),
  .ctrl_sdiq_create1_dp_en                 (ctrl_sdiq_create1_dp_en                ),
  .ctrl_sdiq_create1_en                    (ctrl_sdiq_create1_en                   ),
  .ctrl_sdiq_create1_gateclk_en            (ctrl_sdiq_create1_gateclk_en           ),
  .ctrl_sdiq_rf_lch_fail_vld               (ctrl_sdiq_rf_lch_fail_vld              ),
  .ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld      (ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld     ),
  .ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld      (ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld     ),
  .ctrl_sdiq_rf_staddr_rdy_set             (ctrl_sdiq_rf_staddr_rdy_set            ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dupx      (ctrl_xx_rf_pipe0_preg_lch_vld_dup1     ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dupx      (ctrl_xx_rf_pipe1_preg_lch_vld_dup1     ),
  .dp_sdiq_create0_data                    (dp_sdiq_create0_data                   ),
  .dp_sdiq_create1_data                    (dp_sdiq_create1_data                   ),
  .dp_sdiq_rf_lch_entry                    (dp_sdiq_rf_lch_entry                   ),
  .dp_sdiq_rf_rdy_clr                      (dp_sdiq_rf_rdy_clr                     ),
  .dp_sdiq_rf_sdiq_entry                   (dp_sdiq_rf_sdiq_entry                  ),
  .dp_sdiq_rf_staddr1_vld                  (dp_sdiq_rf_staddr1_vld                 ),
  .dp_sdiq_rf_staddr_rdy_clr               (dp_sdiq_rf_staddr_rdy_clr              ),
  .dp_sdiq_rf_stdata1_vld                  (dp_sdiq_rf_stdata1_vld                 ),
  .dp_xx_rf_pipe0_dst_preg_dupx            (dp_xx_rf_pipe0_dst_preg_dup1           ),
  .dp_xx_rf_pipe1_dst_preg_dupx            (dp_xx_rf_pipe1_dst_preg_dup1           ),
  .forever_cpuclk                          (forever_cpuclk                         ),
  .idu_rtu_pst_freg_dealloc_mask           (idu_rtu_pst_freg_dealloc_mask          ),
  .idu_rtu_pst_preg_dealloc_mask           (idu_rtu_pst_preg_dealloc_mask          ),
  .idu_rtu_pst_vreg_dealloc_mask           (idu_rtu_pst_vreg_dealloc_mask          ),
  .iu_idu_div_inst_vld                     (iu_idu_div_inst_vld                    ),
  .iu_idu_div_preg_dupx                    (iu_idu_div_preg_dup1                   ),
  .iu_idu_ex2_pipe0_wb_preg_dupx           (iu_idu_ex2_pipe0_wb_preg_dup1          ),
  .iu_idu_ex2_pipe0_wb_preg_vld_dupx       (iu_idu_ex2_pipe0_wb_preg_vld_dup1      ),
  .iu_idu_ex2_pipe1_mult_inst_vld_dupx     (iu_idu_ex2_pipe1_mult_inst_vld_dup1    ),
  .iu_idu_ex2_pipe1_preg_dupx              (iu_idu_ex2_pipe1_preg_dup1             ),
  .iu_idu_ex2_pipe1_wb_preg_dupx           (iu_idu_ex2_pipe1_wb_preg_dup1          ),
  .iu_idu_ex2_pipe1_wb_preg_vld_dupx       (iu_idu_ex2_pipe1_wb_preg_vld_dup1      ),
  .lsu_idu_ag_pipe3_load_inst_vld          (lsu_idu_ag_pipe3_load_inst_vld         ),
  .lsu_idu_ag_pipe3_preg_dupx              (lsu_idu_ag_pipe3_preg_dup1             ),
  .lsu_idu_ag_pipe3_vload_inst_vld         (lsu_idu_ag_pipe3_vload_inst_vld        ),
  .lsu_idu_ag_pipe3_vreg_dupx              (lsu_idu_ag_pipe3_vreg_dup1             ),
  .lsu_idu_dc_pipe3_load_fwd_inst_vld_dupx (lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1),
  .lsu_idu_dc_pipe3_load_inst_vld_dupx     (lsu_idu_dc_pipe3_load_inst_vld_dup1    ),
  .lsu_idu_dc_pipe3_preg_dupx              (lsu_idu_dc_pipe3_preg_dup1             ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld     (lsu_idu_dc_pipe3_vload_fwd_inst_vld    ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx    (lsu_idu_dc_pipe3_vload_inst_vld_dup1   ),
  .lsu_idu_dc_pipe3_vreg_dupx              (lsu_idu_dc_pipe3_vreg_dup1             ),
  .lsu_idu_dc_sdiq_entry                   (lsu_idu_dc_sdiq_entry                  ),
  .lsu_idu_dc_staddr1_vld                  (lsu_idu_dc_staddr1_vld                 ),
  .lsu_idu_dc_staddr_unalign               (lsu_idu_dc_staddr_unalign              ),
  .lsu_idu_dc_staddr_vld                   (lsu_idu_dc_staddr_vld                  ),
  .lsu_idu_ex1_sdiq_entry                  (lsu_idu_ex1_sdiq_entry                 ),
  .lsu_idu_ex1_sdiq_frz_clr                (lsu_idu_ex1_sdiq_frz_clr               ),
  .lsu_idu_ex1_sdiq_pop_vld                (lsu_idu_ex1_sdiq_pop_vld               ),
  .lsu_idu_wb_pipe3_wb_preg_dupx           (lsu_idu_wb_pipe3_wb_preg_dup1          ),
  .lsu_idu_wb_pipe3_wb_preg_vld_dupx       (lsu_idu_wb_pipe3_wb_preg_vld_dup1      ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx           (lsu_idu_wb_pipe3_wb_vreg_dup1          ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx       (lsu_idu_wb_pipe3_wb_vreg_vld_dup1      ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .rtu_yy_xx_flush                         (rtu_yy_xx_flush                        ),
  .sdiq_aiq_create0_entry                  (sdiq_aiq_create0_entry                 ),
  .sdiq_aiq_create1_entry                  (sdiq_aiq_create1_entry                 ),
  .sdiq_ctrl_1_left_updt                   (sdiq_ctrl_1_left_updt                  ),
  .sdiq_ctrl_empty                         (sdiq_ctrl_empty                        ),
  .sdiq_ctrl_full                          (sdiq_ctrl_full                         ),
  .sdiq_ctrl_full_updt                     (sdiq_ctrl_full_updt                    ),
  .sdiq_ctrl_full_updt_clk_en              (sdiq_ctrl_full_updt_clk_en             ),
  .sdiq_dp_create0_entry                   (sdiq_dp_create0_entry                  ),
  .sdiq_dp_create1_entry                   (sdiq_dp_create1_entry                  ),
  .sdiq_dp_issue_entry                     (sdiq_dp_issue_entry                    ),
  .sdiq_dp_issue_read_data                 (sdiq_dp_issue_read_data                ),
  .sdiq_top_sdiq_entry_cnt                 (sdiq_top_sdiq_entry_cnt                ),
  .sdiq_xx_gateclk_issue_en                (sdiq_xx_gateclk_issue_en               ),
  .sdiq_xx_issue_en                        (sdiq_xx_issue_en                       ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx        (vfpu_idu_ex1_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex1_pipe6_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe6_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe6_preg_dupx            (vfpu_idu_ex1_pipe6_preg_dup1           ),
  .vfpu_idu_ex1_pipe6_vreg_dupx            (vfpu_idu_ex1_pipe6_vreg_dup1           ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx        (vfpu_idu_ex1_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex1_pipe7_mfvr_inst_vld_dupx   (vfpu_idu_ex1_pipe7_mfvr_inst_vld_dup1  ),
  .vfpu_idu_ex1_pipe7_preg_dupx            (vfpu_idu_ex1_pipe7_preg_dup1           ),
  .vfpu_idu_ex1_pipe7_vreg_dupx            (vfpu_idu_ex1_pipe7_vreg_dup1           ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx        (vfpu_idu_ex2_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex2_pipe6_vreg_dupx            (vfpu_idu_ex2_pipe6_vreg_dup1           ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx        (vfpu_idu_ex2_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex2_pipe7_vreg_dupx            (vfpu_idu_ex2_pipe7_vreg_dup1           ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx        (vfpu_idu_ex3_pipe6_data_vld_dup1       ),
  .vfpu_idu_ex3_pipe6_vreg_dupx            (vfpu_idu_ex3_pipe6_vreg_dup1           ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx        (vfpu_idu_ex3_pipe7_data_vld_dup1       ),
  .vfpu_idu_ex3_pipe7_vreg_dupx            (vfpu_idu_ex3_pipe7_vreg_dup1           ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx         (vfpu_idu_ex5_pipe6_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup1    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx         (vfpu_idu_ex5_pipe7_wb_vreg_dup1        ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx     (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup1    )
);


// &ConnRule(s/_dupx/_dup2/); @66
// &Instance("ct_idu_is_viq0_dummy", "x_ct_idu_is_viq0"); @67
// &ConnRule(s/_dupx/_dup3/); @68
// &Instance("ct_idu_is_viq1_dummy", "x_ct_idu_is_viq1"); @69
// &ConnRule(s/_dupx/_dup2/); @71
// &Instance("ct_idu_is_viq0", "x_ct_idu_is_viq0"); @72
ct_idu_is_viq0  x_ct_idu_is_viq0 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_idu_iq_bypass_disable             (cp0_idu_iq_bypass_disable            ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_en                  (ctrl_viq0_create0_en                 ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_en                  (ctrl_viq0_create1_en                 ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq0_rf_lch_fail_vld             (ctrl_viq0_rf_lch_fail_vld            ),
  .ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld  (ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld ),
  .ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld  (ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld ),
  .ctrl_viq0_rf_pop_dlb_vld              (ctrl_viq0_rf_pop_dlb_vld             ),
  .ctrl_viq0_rf_pop_vld                  (ctrl_viq0_rf_pop_vld                 ),
  .ctrl_viq0_stall                       (ctrl_viq0_stall                      ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dup2   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dup2   ),
  .dp_viq0_bypass_data                   (dp_viq0_bypass_data                  ),
  .dp_viq0_create0_data                  (dp_viq0_create0_data                 ),
  .dp_viq0_create1_data                  (dp_viq0_create1_data                 ),
  .dp_viq0_create_srcv0_rdy_for_bypass   (dp_viq0_create_srcv0_rdy_for_bypass  ),
  .dp_viq0_create_srcv1_rdy_for_bypass   (dp_viq0_create_srcv1_rdy_for_bypass  ),
  .dp_viq0_create_srcv2_rdy_for_bypass   (dp_viq0_create_srcv2_rdy_for_bypass  ),
  .dp_viq0_create_srcvm_rdy_for_bypass   (dp_viq0_create_srcvm_rdy_for_bypass  ),
  .dp_viq0_create_vdiv                   (dp_viq0_create_vdiv                  ),
  .dp_viq0_rf_lch_entry                  (dp_viq0_rf_lch_entry                 ),
  .dp_viq0_rf_rdy_clr                    (dp_viq0_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dup2         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dup2         ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dup2           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dup2 ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dup2           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dup2        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dup2    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .rtu_yy_xx_flush                       (rtu_yy_xx_flush                      ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dup2     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dup2),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dup2         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dup2     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dup2),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dup2         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dup2     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dup2),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dup2         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dup2     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dup2),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dup2         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dup2     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dup2         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dup2     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dup2         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dup2      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup2  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dup2      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup2  ),
  .vfpu_idu_vdiv_busy                    (vfpu_idu_vdiv_busy                   ),
  .viq0_ctrl_1_left_updt                 (viq0_ctrl_1_left_updt                ),
  .viq0_ctrl_empty                       (viq0_ctrl_empty                      ),
  .viq0_ctrl_entry_cnt_updt_val          (viq0_ctrl_entry_cnt_updt_val         ),
  .viq0_ctrl_entry_cnt_updt_vld          (viq0_ctrl_entry_cnt_updt_vld         ),
  .viq0_ctrl_full                        (viq0_ctrl_full                       ),
  .viq0_ctrl_full_updt                   (viq0_ctrl_full_updt                  ),
  .viq0_ctrl_full_updt_clk_en            (viq0_ctrl_full_updt_clk_en           ),
  .viq0_dp_issue_entry                   (viq0_dp_issue_entry                  ),
  .viq0_dp_issue_read_data               (viq0_dp_issue_read_data              ),
  .viq0_top_viq0_entry_cnt               (viq0_top_viq0_entry_cnt              ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq0_xx_gateclk_issue_en              (viq0_xx_gateclk_issue_en             ),
  .viq0_xx_issue_en                      (viq0_xx_issue_en                     ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               )
);

// &ConnRule(s/_dupx/_dup3/); @73
// &Instance("ct_idu_is_viq1", "x_ct_idu_is_viq1"); @74
ct_idu_is_viq1  x_ct_idu_is_viq1 (
  .cp0_idu_icg_en                        (cp0_idu_icg_en                       ),
  .cp0_idu_iq_bypass_disable             (cp0_idu_iq_bypass_disable            ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cpurst_b                              (cpurst_b                             ),
  .ctrl_dp_is_dis_viq0_create0_sel       (ctrl_dp_is_dis_viq0_create0_sel      ),
  .ctrl_dp_is_dis_viq0_create1_sel       (ctrl_dp_is_dis_viq0_create1_sel      ),
  .ctrl_dp_is_dis_viq1_create0_sel       (ctrl_dp_is_dis_viq1_create0_sel      ),
  .ctrl_dp_is_dis_viq1_create1_sel       (ctrl_dp_is_dis_viq1_create1_sel      ),
  .ctrl_viq0_create0_dp_en               (ctrl_viq0_create0_dp_en              ),
  .ctrl_viq0_create0_gateclk_en          (ctrl_viq0_create0_gateclk_en         ),
  .ctrl_viq0_create1_dp_en               (ctrl_viq0_create1_dp_en              ),
  .ctrl_viq0_create1_gateclk_en          (ctrl_viq0_create1_gateclk_en         ),
  .ctrl_viq1_create0_dp_en               (ctrl_viq1_create0_dp_en              ),
  .ctrl_viq1_create0_en                  (ctrl_viq1_create0_en                 ),
  .ctrl_viq1_create0_gateclk_en          (ctrl_viq1_create0_gateclk_en         ),
  .ctrl_viq1_create1_dp_en               (ctrl_viq1_create1_dp_en              ),
  .ctrl_viq1_create1_en                  (ctrl_viq1_create1_en                 ),
  .ctrl_viq1_create1_gateclk_en          (ctrl_viq1_create1_gateclk_en         ),
  .ctrl_viq1_rf_lch_fail_vld             (ctrl_viq1_rf_lch_fail_vld            ),
  .ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld  (ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld ),
  .ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld  (ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld ),
  .ctrl_viq1_rf_pop_dlb_vld              (ctrl_viq1_rf_pop_dlb_vld             ),
  .ctrl_viq1_rf_pop_vld                  (ctrl_viq1_rf_pop_vld                 ),
  .ctrl_viq1_stall                       (ctrl_viq1_stall                      ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe6_vmla_lch_vld_dup3   ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dupx    (ctrl_xx_rf_pipe7_vmla_lch_vld_dup3   ),
  .dp_viq1_bypass_data                   (dp_viq1_bypass_data                  ),
  .dp_viq1_create0_data                  (dp_viq1_create0_data                 ),
  .dp_viq1_create1_data                  (dp_viq1_create1_data                 ),
  .dp_viq1_create_srcv0_rdy_for_bypass   (dp_viq1_create_srcv0_rdy_for_bypass  ),
  .dp_viq1_create_srcv1_rdy_for_bypass   (dp_viq1_create_srcv1_rdy_for_bypass  ),
  .dp_viq1_create_srcv2_rdy_for_bypass   (dp_viq1_create_srcv2_rdy_for_bypass  ),
  .dp_viq1_create_srcvm_rdy_for_bypass   (dp_viq1_create_srcvm_rdy_for_bypass  ),
  .dp_viq1_rf_lch_entry                  (dp_viq1_rf_lch_entry                 ),
  .dp_viq1_rf_rdy_clr                    (dp_viq1_rf_rdy_clr                   ),
  .dp_viq_dis_inst0_srcv2_vreg           (dp_viq_dis_inst0_srcv2_vreg          ),
  .dp_viq_dis_inst1_srcv2_vreg           (dp_viq_dis_inst1_srcv2_vreg          ),
  .dp_viq_dis_inst2_srcv2_vreg           (dp_viq_dis_inst2_srcv2_vreg          ),
  .dp_viq_dis_inst3_srcv2_vreg           (dp_viq_dis_inst3_srcv2_vreg          ),
  .dp_xx_rf_pipe6_dst_vreg_dupx          (dp_xx_rf_pipe6_dst_vreg_dup3         ),
  .dp_xx_rf_pipe7_dst_vreg_dupx          (dp_xx_rf_pipe7_dst_vreg_dup3         ),
  .forever_cpuclk                        (forever_cpuclk                       ),
  .lsu_idu_ag_pipe3_vload_inst_vld       (lsu_idu_ag_pipe3_vload_inst_vld      ),
  .lsu_idu_ag_pipe3_vreg_dupx            (lsu_idu_ag_pipe3_vreg_dup3           ),
  .lsu_idu_dc_pipe3_vload_fwd_inst_vld   (lsu_idu_dc_pipe3_vload_fwd_inst_vld  ),
  .lsu_idu_dc_pipe3_vload_inst_vld_dupx  (lsu_idu_dc_pipe3_vload_inst_vld_dup3 ),
  .lsu_idu_dc_pipe3_vreg_dupx            (lsu_idu_dc_pipe3_vreg_dup3           ),
  .lsu_idu_wb_pipe3_wb_vreg_dupx         (lsu_idu_wb_pipe3_wb_vreg_dup3        ),
  .lsu_idu_wb_pipe3_wb_vreg_vld_dupx     (lsu_idu_wb_pipe3_wb_vreg_vld_dup3    ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .rtu_idu_flush_fe                      (rtu_idu_flush_fe                     ),
  .rtu_idu_flush_is                      (rtu_idu_flush_is                     ),
  .rtu_yy_xx_flush                       (rtu_yy_xx_flush                      ),
  .vfpu_idu_ex1_pipe6_data_vld_dupx      (vfpu_idu_ex1_pipe6_data_vld_dup3     ),
  .vfpu_idu_ex1_pipe6_fmla_data_vld_dupx (vfpu_idu_ex1_pipe6_fmla_data_vld_dup3),
  .vfpu_idu_ex1_pipe6_vreg_dupx          (vfpu_idu_ex1_pipe6_vreg_dup3         ),
  .vfpu_idu_ex1_pipe7_data_vld_dupx      (vfpu_idu_ex1_pipe7_data_vld_dup3     ),
  .vfpu_idu_ex1_pipe7_fmla_data_vld_dupx (vfpu_idu_ex1_pipe7_fmla_data_vld_dup3),
  .vfpu_idu_ex1_pipe7_vreg_dupx          (vfpu_idu_ex1_pipe7_vreg_dup3         ),
  .vfpu_idu_ex2_pipe6_data_vld_dupx      (vfpu_idu_ex2_pipe6_data_vld_dup3     ),
  .vfpu_idu_ex2_pipe6_fmla_data_vld_dupx (vfpu_idu_ex2_pipe6_fmla_data_vld_dup3),
  .vfpu_idu_ex2_pipe6_vreg_dupx          (vfpu_idu_ex2_pipe6_vreg_dup3         ),
  .vfpu_idu_ex2_pipe7_data_vld_dupx      (vfpu_idu_ex2_pipe7_data_vld_dup3     ),
  .vfpu_idu_ex2_pipe7_fmla_data_vld_dupx (vfpu_idu_ex2_pipe7_fmla_data_vld_dup3),
  .vfpu_idu_ex2_pipe7_vreg_dupx          (vfpu_idu_ex2_pipe7_vreg_dup3         ),
  .vfpu_idu_ex3_pipe6_data_vld_dupx      (vfpu_idu_ex3_pipe6_data_vld_dup3     ),
  .vfpu_idu_ex3_pipe6_vreg_dupx          (vfpu_idu_ex3_pipe6_vreg_dup3         ),
  .vfpu_idu_ex3_pipe7_data_vld_dupx      (vfpu_idu_ex3_pipe7_data_vld_dup3     ),
  .vfpu_idu_ex3_pipe7_vreg_dupx          (vfpu_idu_ex3_pipe7_vreg_dup3         ),
  .vfpu_idu_ex5_pipe6_wb_vreg_dupx       (vfpu_idu_ex5_pipe6_wb_vreg_dup3      ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe6_wb_vreg_vld_dup3  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_dupx       (vfpu_idu_ex5_pipe7_wb_vreg_dup3      ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld_dupx   (vfpu_idu_ex5_pipe7_wb_vreg_vld_dup3  ),
  .viq0_viq_create0_entry                (viq0_viq_create0_entry               ),
  .viq0_viq_create1_entry                (viq0_viq_create1_entry               ),
  .viq1_ctrl_1_left_updt                 (viq1_ctrl_1_left_updt                ),
  .viq1_ctrl_empty                       (viq1_ctrl_empty                      ),
  .viq1_ctrl_entry_cnt_updt_val          (viq1_ctrl_entry_cnt_updt_val         ),
  .viq1_ctrl_entry_cnt_updt_vld          (viq1_ctrl_entry_cnt_updt_vld         ),
  .viq1_ctrl_full                        (viq1_ctrl_full                       ),
  .viq1_ctrl_full_updt                   (viq1_ctrl_full_updt                  ),
  .viq1_ctrl_full_updt_clk_en            (viq1_ctrl_full_updt_clk_en           ),
  .viq1_dp_issue_entry                   (viq1_dp_issue_entry                  ),
  .viq1_dp_issue_read_data               (viq1_dp_issue_read_data              ),
  .viq1_top_viq1_entry_cnt               (viq1_top_viq1_entry_cnt              ),
  .viq1_viq_create0_entry                (viq1_viq_create0_entry               ),
  .viq1_viq_create1_entry                (viq1_viq_create1_entry               ),
  .viq1_xx_gateclk_issue_en              (viq1_xx_gateclk_issue_en             ),
  .viq1_xx_issue_en                      (viq1_xx_issue_en                     )
);


//==========================================================
//                       RF Stage
//==========================================================
// &Instance("ct_idu_rf_ctrl", "x_ct_idu_rf_ctrl"); @80
ct_idu_rf_ctrl  x_ct_idu_rf_ctrl (
  .aiq0_xx_gateclk_issue_en             (aiq0_xx_gateclk_issue_en            ),
  .aiq0_xx_issue_en                     (aiq0_xx_issue_en                    ),
  .aiq1_xx_gateclk_issue_en             (aiq1_xx_gateclk_issue_en            ),
  .aiq1_xx_issue_en                     (aiq1_xx_issue_en                    ),
  .biq_xx_gateclk_issue_en              (biq_xx_gateclk_issue_en             ),
  .biq_xx_issue_en                      (biq_xx_issue_en                     ),
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .ctrl_aiq0_rf_lch_fail_vld            (ctrl_aiq0_rf_lch_fail_vld           ),
  .ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld   (ctrl_aiq0_rf_pipe0_alu_reg_fwd_vld  ),
  .ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld   (ctrl_aiq0_rf_pipe1_alu_reg_fwd_vld  ),
  .ctrl_aiq0_rf_pop_dlb_vld             (ctrl_aiq0_rf_pop_dlb_vld            ),
  .ctrl_aiq0_rf_pop_vld                 (ctrl_aiq0_rf_pop_vld                ),
  .ctrl_aiq0_stall                      (ctrl_aiq0_stall                     ),
  .ctrl_aiq1_rf_lch_fail_vld            (ctrl_aiq1_rf_lch_fail_vld           ),
  .ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld   (ctrl_aiq1_rf_pipe0_alu_reg_fwd_vld  ),
  .ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld   (ctrl_aiq1_rf_pipe1_alu_reg_fwd_vld  ),
  .ctrl_aiq1_rf_pipe1_mla_reg_lch_vld   (ctrl_aiq1_rf_pipe1_mla_reg_lch_vld  ),
  .ctrl_aiq1_rf_pop_dlb_vld             (ctrl_aiq1_rf_pop_dlb_vld            ),
  .ctrl_aiq1_rf_pop_vld                 (ctrl_aiq1_rf_pop_vld                ),
  .ctrl_aiq1_stall                      (ctrl_aiq1_stall                     ),
  .ctrl_biq_rf_lch_fail_vld             (ctrl_biq_rf_lch_fail_vld            ),
  .ctrl_biq_rf_pipe0_alu_reg_fwd_vld    (ctrl_biq_rf_pipe0_alu_reg_fwd_vld   ),
  .ctrl_biq_rf_pipe1_alu_reg_fwd_vld    (ctrl_biq_rf_pipe1_alu_reg_fwd_vld   ),
  .ctrl_biq_rf_pop_vld                  (ctrl_biq_rf_pop_vld                 ),
  .ctrl_dp_rf_pipe0_other_lch_fail      (ctrl_dp_rf_pipe0_other_lch_fail     ),
  .ctrl_dp_rf_pipe3_other_lch_fail      (ctrl_dp_rf_pipe3_other_lch_fail     ),
  .ctrl_dp_rf_pipe4_other_lch_fail      (ctrl_dp_rf_pipe4_other_lch_fail     ),
  .ctrl_dp_rf_pipe5_other_lch_fail      (ctrl_dp_rf_pipe5_other_lch_fail     ),
  .ctrl_dp_rf_pipe6_other_lch_fail      (ctrl_dp_rf_pipe6_other_lch_fail     ),
  .ctrl_dp_rf_pipe7_other_lch_fail      (ctrl_dp_rf_pipe7_other_lch_fail     ),
  .ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld   (ctrl_lsiq_rf_pipe0_alu_reg_fwd_vld  ),
  .ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld   (ctrl_lsiq_rf_pipe1_alu_reg_fwd_vld  ),
  .ctrl_lsiq_rf_pipe3_lch_fail_vld      (ctrl_lsiq_rf_pipe3_lch_fail_vld     ),
  .ctrl_lsiq_rf_pipe4_lch_fail_vld      (ctrl_lsiq_rf_pipe4_lch_fail_vld     ),
  .ctrl_sdiq_rf_lch_fail_vld            (ctrl_sdiq_rf_lch_fail_vld           ),
  .ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld   (ctrl_sdiq_rf_pipe0_alu_reg_fwd_vld  ),
  .ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld   (ctrl_sdiq_rf_pipe1_alu_reg_fwd_vld  ),
  .ctrl_sdiq_rf_staddr_rdy_set          (ctrl_sdiq_rf_staddr_rdy_set         ),
  .ctrl_viq0_rf_lch_fail_vld            (ctrl_viq0_rf_lch_fail_vld           ),
  .ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld (ctrl_viq0_rf_pipe6_vmla_vreg_fwd_vld),
  .ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld (ctrl_viq0_rf_pipe7_vmla_vreg_fwd_vld),
  .ctrl_viq0_rf_pop_dlb_vld             (ctrl_viq0_rf_pop_dlb_vld            ),
  .ctrl_viq0_rf_pop_vld                 (ctrl_viq0_rf_pop_vld                ),
  .ctrl_viq0_stall                      (ctrl_viq0_stall                     ),
  .ctrl_viq1_rf_lch_fail_vld            (ctrl_viq1_rf_lch_fail_vld           ),
  .ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld (ctrl_viq1_rf_pipe6_vmla_vreg_fwd_vld),
  .ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld (ctrl_viq1_rf_pipe7_vmla_vreg_fwd_vld),
  .ctrl_viq1_rf_pop_dlb_vld             (ctrl_viq1_rf_pop_dlb_vld            ),
  .ctrl_viq1_rf_pop_vld                 (ctrl_viq1_rf_pop_vld                ),
  .ctrl_viq1_stall                      (ctrl_viq1_stall                     ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dup0   (ctrl_xx_rf_pipe0_preg_lch_vld_dup0  ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dup1   (ctrl_xx_rf_pipe0_preg_lch_vld_dup1  ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dup2   (ctrl_xx_rf_pipe0_preg_lch_vld_dup2  ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dup3   (ctrl_xx_rf_pipe0_preg_lch_vld_dup3  ),
  .ctrl_xx_rf_pipe0_preg_lch_vld_dup4   (ctrl_xx_rf_pipe0_preg_lch_vld_dup4  ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dup0   (ctrl_xx_rf_pipe1_preg_lch_vld_dup0  ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dup1   (ctrl_xx_rf_pipe1_preg_lch_vld_dup1  ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dup2   (ctrl_xx_rf_pipe1_preg_lch_vld_dup2  ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dup3   (ctrl_xx_rf_pipe1_preg_lch_vld_dup3  ),
  .ctrl_xx_rf_pipe1_preg_lch_vld_dup4   (ctrl_xx_rf_pipe1_preg_lch_vld_dup4  ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dup0   (ctrl_xx_rf_pipe6_vmla_lch_vld_dup0  ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dup1   (ctrl_xx_rf_pipe6_vmla_lch_vld_dup1  ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dup2   (ctrl_xx_rf_pipe6_vmla_lch_vld_dup2  ),
  .ctrl_xx_rf_pipe6_vmla_lch_vld_dup3   (ctrl_xx_rf_pipe6_vmla_lch_vld_dup3  ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dup0   (ctrl_xx_rf_pipe7_vmla_lch_vld_dup0  ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dup1   (ctrl_xx_rf_pipe7_vmla_lch_vld_dup1  ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dup2   (ctrl_xx_rf_pipe7_vmla_lch_vld_dup2  ),
  .ctrl_xx_rf_pipe7_vmla_lch_vld_dup3   (ctrl_xx_rf_pipe7_vmla_lch_vld_dup3  ),
  .dp_ctrl_is_aiq0_issue_alu_short      (dp_ctrl_is_aiq0_issue_alu_short     ),
  .dp_ctrl_is_aiq0_issue_div            (dp_ctrl_is_aiq0_issue_div           ),
  .dp_ctrl_is_aiq0_issue_dst_vld        (dp_ctrl_is_aiq0_issue_dst_vld       ),
  .dp_ctrl_is_aiq0_issue_lch_preg       (dp_ctrl_is_aiq0_issue_lch_preg      ),
  .dp_ctrl_is_aiq0_issue_lch_rdy        (dp_ctrl_is_aiq0_issue_lch_rdy       ),
  .dp_ctrl_is_aiq0_issue_special        (dp_ctrl_is_aiq0_issue_special       ),
  .dp_ctrl_is_aiq1_issue_alu_short      (dp_ctrl_is_aiq1_issue_alu_short     ),
  .dp_ctrl_is_aiq1_issue_dst_vld        (dp_ctrl_is_aiq1_issue_dst_vld       ),
  .dp_ctrl_is_aiq1_issue_lch_preg       (dp_ctrl_is_aiq1_issue_lch_preg      ),
  .dp_ctrl_is_aiq1_issue_lch_rdy        (dp_ctrl_is_aiq1_issue_lch_rdy       ),
  .dp_ctrl_is_aiq1_issue_mla_lch_rdy    (dp_ctrl_is_aiq1_issue_mla_lch_rdy   ),
  .dp_ctrl_is_aiq1_issue_mla_vld        (dp_ctrl_is_aiq1_issue_mla_vld       ),
  .dp_ctrl_is_viq0_issue_dstv_vld       (dp_ctrl_is_viq0_issue_dstv_vld      ),
  .dp_ctrl_is_viq0_issue_lch_rdy        (dp_ctrl_is_viq0_issue_lch_rdy       ),
  .dp_ctrl_is_viq0_issue_vdiv           (dp_ctrl_is_viq0_issue_vdiv          ),
  .dp_ctrl_is_viq0_issue_vmla_rf        (dp_ctrl_is_viq0_issue_vmla_rf       ),
  .dp_ctrl_is_viq0_issue_vmla_short     (dp_ctrl_is_viq0_issue_vmla_short    ),
  .dp_ctrl_is_viq1_issue_dstv_vld       (dp_ctrl_is_viq1_issue_dstv_vld      ),
  .dp_ctrl_is_viq1_issue_lch_rdy        (dp_ctrl_is_viq1_issue_lch_rdy       ),
  .dp_ctrl_is_viq1_issue_vmla_rf        (dp_ctrl_is_viq1_issue_vmla_rf       ),
  .dp_ctrl_is_viq1_issue_vmla_short     (dp_ctrl_is_viq1_issue_vmla_short    ),
  .dp_ctrl_rf_pipe0_eu_sel              (dp_ctrl_rf_pipe0_eu_sel             ),
  .dp_ctrl_rf_pipe0_mtvr                (dp_ctrl_rf_pipe0_mtvr               ),
  .dp_ctrl_rf_pipe0_src2_vld            (dp_ctrl_rf_pipe0_src2_vld           ),
  .dp_ctrl_rf_pipe0_src_no_rdy          (dp_ctrl_rf_pipe0_src_no_rdy         ),
  .dp_ctrl_rf_pipe1_eu_sel              (dp_ctrl_rf_pipe1_eu_sel             ),
  .dp_ctrl_rf_pipe1_mtvr                (dp_ctrl_rf_pipe1_mtvr               ),
  .dp_ctrl_rf_pipe1_src2_vld            (dp_ctrl_rf_pipe1_src2_vld           ),
  .dp_ctrl_rf_pipe1_src_no_rdy          (dp_ctrl_rf_pipe1_src_no_rdy         ),
  .dp_ctrl_rf_pipe2_src_no_rdy          (dp_ctrl_rf_pipe2_src_no_rdy         ),
  .dp_ctrl_rf_pipe3_src1_vld            (dp_ctrl_rf_pipe3_src1_vld           ),
  .dp_ctrl_rf_pipe3_src_no_rdy          (dp_ctrl_rf_pipe3_src_no_rdy         ),
  .dp_ctrl_rf_pipe3_srcvm_vld           (dp_ctrl_rf_pipe3_srcvm_vld          ),
  .dp_ctrl_rf_pipe4_src_no_rdy          (dp_ctrl_rf_pipe4_src_no_rdy         ),
  .dp_ctrl_rf_pipe4_srcvm_vld           (dp_ctrl_rf_pipe4_srcvm_vld          ),
  .dp_ctrl_rf_pipe4_staddr              (dp_ctrl_rf_pipe4_staddr             ),
  .dp_ctrl_rf_pipe5_src0_vld            (dp_ctrl_rf_pipe5_src0_vld           ),
  .dp_ctrl_rf_pipe5_src_no_rdy          (dp_ctrl_rf_pipe5_src_no_rdy         ),
  .dp_ctrl_rf_pipe6_mfvr                (dp_ctrl_rf_pipe6_mfvr               ),
  .dp_ctrl_rf_pipe6_src_no_rdy          (dp_ctrl_rf_pipe6_src_no_rdy         ),
  .dp_ctrl_rf_pipe6_srcv2_vld           (dp_ctrl_rf_pipe6_srcv2_vld          ),
  .dp_ctrl_rf_pipe6_vmul                (dp_ctrl_rf_pipe6_vmul               ),
  .dp_ctrl_rf_pipe7_mfvr                (dp_ctrl_rf_pipe7_mfvr               ),
  .dp_ctrl_rf_pipe7_src_no_rdy          (dp_ctrl_rf_pipe7_src_no_rdy         ),
  .dp_ctrl_rf_pipe7_srcv2_vld           (dp_ctrl_rf_pipe7_srcv2_vld          ),
  .dp_ctrl_rf_pipe7_vmul_unsplit        (dp_ctrl_rf_pipe7_vmul_unsplit       ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .hpcp_idu_cnt_en                      (hpcp_idu_cnt_en                     ),
  .idu_cp0_rf_gateclk_sel               (idu_cp0_rf_gateclk_sel              ),
  .idu_cp0_rf_sel                       (idu_cp0_rf_sel                      ),
  .idu_hpcp_rf_inst_vld                 (idu_hpcp_rf_inst_vld                ),
  .idu_hpcp_rf_pipe0_inst_vld           (idu_hpcp_rf_pipe0_inst_vld          ),
  .idu_hpcp_rf_pipe0_lch_fail_vld       (idu_hpcp_rf_pipe0_lch_fail_vld      ),
  .idu_hpcp_rf_pipe1_inst_vld           (idu_hpcp_rf_pipe1_inst_vld          ),
  .idu_hpcp_rf_pipe1_lch_fail_vld       (idu_hpcp_rf_pipe1_lch_fail_vld      ),
  .idu_hpcp_rf_pipe2_inst_vld           (idu_hpcp_rf_pipe2_inst_vld          ),
  .idu_hpcp_rf_pipe2_lch_fail_vld       (idu_hpcp_rf_pipe2_lch_fail_vld      ),
  .idu_hpcp_rf_pipe3_inst_vld           (idu_hpcp_rf_pipe3_inst_vld          ),
  .idu_hpcp_rf_pipe3_lch_fail_vld       (idu_hpcp_rf_pipe3_lch_fail_vld      ),
  .idu_hpcp_rf_pipe3_reg_lch_fail_vld   (idu_hpcp_rf_pipe3_reg_lch_fail_vld  ),
  .idu_hpcp_rf_pipe4_inst_vld           (idu_hpcp_rf_pipe4_inst_vld          ),
  .idu_hpcp_rf_pipe4_lch_fail_vld       (idu_hpcp_rf_pipe4_lch_fail_vld      ),
  .idu_hpcp_rf_pipe4_reg_lch_fail_vld   (idu_hpcp_rf_pipe4_reg_lch_fail_vld  ),
  .idu_hpcp_rf_pipe5_inst_vld           (idu_hpcp_rf_pipe5_inst_vld          ),
  .idu_hpcp_rf_pipe5_lch_fail_vld       (idu_hpcp_rf_pipe5_lch_fail_vld      ),
  .idu_hpcp_rf_pipe5_reg_lch_fail_vld   (idu_hpcp_rf_pipe5_reg_lch_fail_vld  ),
  .idu_hpcp_rf_pipe6_inst_vld           (idu_hpcp_rf_pipe6_inst_vld          ),
  .idu_hpcp_rf_pipe6_lch_fail_vld       (idu_hpcp_rf_pipe6_lch_fail_vld      ),
  .idu_hpcp_rf_pipe7_inst_vld           (idu_hpcp_rf_pipe7_inst_vld          ),
  .idu_hpcp_rf_pipe7_lch_fail_vld       (idu_hpcp_rf_pipe7_lch_fail_vld      ),
  .idu_iu_is_div_gateclk_issue          (idu_iu_is_div_gateclk_issue         ),
  .idu_iu_is_div_issue                  (idu_iu_is_div_issue                 ),
  .idu_iu_rf_bju_gateclk_sel            (idu_iu_rf_bju_gateclk_sel           ),
  .idu_iu_rf_bju_sel                    (idu_iu_rf_bju_sel                   ),
  .idu_iu_rf_div_gateclk_sel            (idu_iu_rf_div_gateclk_sel           ),
  .idu_iu_rf_div_sel                    (idu_iu_rf_div_sel                   ),
  .idu_iu_rf_mult_gateclk_sel           (idu_iu_rf_mult_gateclk_sel          ),
  .idu_iu_rf_mult_sel                   (idu_iu_rf_mult_sel                  ),
  .idu_iu_rf_pipe0_cbus_gateclk_sel     (idu_iu_rf_pipe0_cbus_gateclk_sel    ),
  .idu_iu_rf_pipe0_gateclk_sel          (idu_iu_rf_pipe0_gateclk_sel         ),
  .idu_iu_rf_pipe0_sel                  (idu_iu_rf_pipe0_sel                 ),
  .idu_iu_rf_pipe1_cbus_gateclk_sel     (idu_iu_rf_pipe1_cbus_gateclk_sel    ),
  .idu_iu_rf_pipe1_gateclk_sel          (idu_iu_rf_pipe1_gateclk_sel         ),
  .idu_iu_rf_pipe1_sel                  (idu_iu_rf_pipe1_sel                 ),
  .idu_iu_rf_special_gateclk_sel        (idu_iu_rf_special_gateclk_sel       ),
  .idu_iu_rf_special_sel                (idu_iu_rf_special_sel               ),
  .idu_lsu_rf_pipe3_gateclk_sel         (idu_lsu_rf_pipe3_gateclk_sel        ),
  .idu_lsu_rf_pipe3_sel                 (idu_lsu_rf_pipe3_sel                ),
  .idu_lsu_rf_pipe4_gateclk_sel         (idu_lsu_rf_pipe4_gateclk_sel        ),
  .idu_lsu_rf_pipe4_sel                 (idu_lsu_rf_pipe4_sel                ),
  .idu_lsu_rf_pipe5_gateclk_sel         (idu_lsu_rf_pipe5_gateclk_sel        ),
  .idu_lsu_rf_pipe5_sel                 (idu_lsu_rf_pipe5_sel                ),
  .idu_vfpu_is_vdiv_gateclk_issue       (idu_vfpu_is_vdiv_gateclk_issue      ),
  .idu_vfpu_is_vdiv_issue               (idu_vfpu_is_vdiv_issue              ),
  .idu_vfpu_rf_pipe6_gateclk_sel        (idu_vfpu_rf_pipe6_gateclk_sel       ),
  .idu_vfpu_rf_pipe6_sel                (idu_vfpu_rf_pipe6_sel               ),
  .idu_vfpu_rf_pipe7_gateclk_sel        (idu_vfpu_rf_pipe7_gateclk_sel       ),
  .idu_vfpu_rf_pipe7_sel                (idu_vfpu_rf_pipe7_sel               ),
  .iu_idu_div_wb_stall                  (iu_idu_div_wb_stall                 ),
  .iu_idu_ex1_pipe1_mult_stall          (iu_idu_ex1_pipe1_mult_stall         ),
  .lsiq_xx_gateclk_issue_en             (lsiq_xx_gateclk_issue_en            ),
  .lsiq_xx_pipe3_issue_en               (lsiq_xx_pipe3_issue_en              ),
  .lsiq_xx_pipe4_issue_en               (lsiq_xx_pipe4_issue_en              ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_idu_flush_fe                     (rtu_idu_flush_fe                    ),
  .rtu_idu_flush_is                     (rtu_idu_flush_is                    ),
  .rtu_yy_xx_flush                      (rtu_yy_xx_flush                     ),
  .sdiq_xx_gateclk_issue_en             (sdiq_xx_gateclk_issue_en            ),
  .sdiq_xx_issue_en                     (sdiq_xx_issue_en                    ),
  .vfpu_idu_vdiv_wb_stall               (vfpu_idu_vdiv_wb_stall              ),
  .viq0_xx_gateclk_issue_en             (viq0_xx_gateclk_issue_en            ),
  .viq0_xx_issue_en                     (viq0_xx_issue_en                    ),
  .viq1_xx_gateclk_issue_en             (viq1_xx_gateclk_issue_en            ),
  .viq1_xx_issue_en                     (viq1_xx_issue_en                    )
);

// &Instance("ct_idu_rf_dp", "x_ct_idu_rf_dp"); @81
ct_idu_rf_dp  x_ct_idu_rf_dp (
  .aiq0_dp_issue_entry                    (aiq0_dp_issue_entry                   ),
  .aiq0_dp_issue_read_data                (aiq0_dp_issue_read_data               ),
  .aiq0_xx_gateclk_issue_en               (aiq0_xx_gateclk_issue_en              ),
  .aiq0_xx_issue_en                       (aiq0_xx_issue_en                      ),
  .aiq1_dp_issue_entry                    (aiq1_dp_issue_entry                   ),
  .aiq1_dp_issue_read_data                (aiq1_dp_issue_read_data               ),
  .aiq1_xx_gateclk_issue_en               (aiq1_xx_gateclk_issue_en              ),
  .aiq1_xx_issue_en                       (aiq1_xx_issue_en                      ),
  .biq_dp_issue_entry                     (biq_dp_issue_entry                    ),
  .biq_dp_issue_read_data                 (biq_dp_issue_read_data                ),
  .biq_xx_gateclk_issue_en                (biq_xx_gateclk_issue_en               ),
  .biq_xx_issue_en                        (biq_xx_issue_en                       ),
  .cp0_idu_icg_en                         (cp0_idu_icg_en                        ),
  .cp0_lsu_fencei_broad_dis               (cp0_lsu_fencei_broad_dis              ),
  .cp0_lsu_fencerw_broad_dis              (cp0_lsu_fencerw_broad_dis             ),
  .cp0_lsu_tlb_broad_dis                  (cp0_lsu_tlb_broad_dis                 ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .ctrl_dp_rf_pipe0_other_lch_fail        (ctrl_dp_rf_pipe0_other_lch_fail       ),
  .ctrl_dp_rf_pipe3_other_lch_fail        (ctrl_dp_rf_pipe3_other_lch_fail       ),
  .ctrl_dp_rf_pipe4_other_lch_fail        (ctrl_dp_rf_pipe4_other_lch_fail       ),
  .ctrl_dp_rf_pipe5_other_lch_fail        (ctrl_dp_rf_pipe5_other_lch_fail       ),
  .ctrl_dp_rf_pipe6_other_lch_fail        (ctrl_dp_rf_pipe6_other_lch_fail       ),
  .ctrl_dp_rf_pipe7_other_lch_fail        (ctrl_dp_rf_pipe7_other_lch_fail       ),
  .dp_aiq0_rf_lch_entry                   (dp_aiq0_rf_lch_entry                  ),
  .dp_aiq0_rf_rdy_clr                     (dp_aiq0_rf_rdy_clr                    ),
  .dp_aiq1_rf_lch_entry                   (dp_aiq1_rf_lch_entry                  ),
  .dp_aiq1_rf_rdy_clr                     (dp_aiq1_rf_rdy_clr                    ),
  .dp_biq_rf_lch_entry                    (dp_biq_rf_lch_entry                   ),
  .dp_biq_rf_rdy_clr                      (dp_biq_rf_rdy_clr                     ),
  .dp_ctrl_is_aiq0_issue_alu_short        (dp_ctrl_is_aiq0_issue_alu_short       ),
  .dp_ctrl_is_aiq0_issue_div              (dp_ctrl_is_aiq0_issue_div             ),
  .dp_ctrl_is_aiq0_issue_dst_vld          (dp_ctrl_is_aiq0_issue_dst_vld         ),
  .dp_ctrl_is_aiq0_issue_lch_preg         (dp_ctrl_is_aiq0_issue_lch_preg        ),
  .dp_ctrl_is_aiq0_issue_lch_rdy          (dp_ctrl_is_aiq0_issue_lch_rdy         ),
  .dp_ctrl_is_aiq0_issue_special          (dp_ctrl_is_aiq0_issue_special         ),
  .dp_ctrl_is_aiq1_issue_alu_short        (dp_ctrl_is_aiq1_issue_alu_short       ),
  .dp_ctrl_is_aiq1_issue_dst_vld          (dp_ctrl_is_aiq1_issue_dst_vld         ),
  .dp_ctrl_is_aiq1_issue_lch_preg         (dp_ctrl_is_aiq1_issue_lch_preg        ),
  .dp_ctrl_is_aiq1_issue_lch_rdy          (dp_ctrl_is_aiq1_issue_lch_rdy         ),
  .dp_ctrl_is_aiq1_issue_mla_lch_rdy      (dp_ctrl_is_aiq1_issue_mla_lch_rdy     ),
  .dp_ctrl_is_aiq1_issue_mla_vld          (dp_ctrl_is_aiq1_issue_mla_vld         ),
  .dp_ctrl_is_viq0_issue_dstv_vld         (dp_ctrl_is_viq0_issue_dstv_vld        ),
  .dp_ctrl_is_viq0_issue_lch_rdy          (dp_ctrl_is_viq0_issue_lch_rdy         ),
  .dp_ctrl_is_viq0_issue_vdiv             (dp_ctrl_is_viq0_issue_vdiv            ),
  .dp_ctrl_is_viq0_issue_vmla_rf          (dp_ctrl_is_viq0_issue_vmla_rf         ),
  .dp_ctrl_is_viq0_issue_vmla_short       (dp_ctrl_is_viq0_issue_vmla_short      ),
  .dp_ctrl_is_viq1_issue_dstv_vld         (dp_ctrl_is_viq1_issue_dstv_vld        ),
  .dp_ctrl_is_viq1_issue_lch_rdy          (dp_ctrl_is_viq1_issue_lch_rdy         ),
  .dp_ctrl_is_viq1_issue_vmla_rf          (dp_ctrl_is_viq1_issue_vmla_rf         ),
  .dp_ctrl_is_viq1_issue_vmla_short       (dp_ctrl_is_viq1_issue_vmla_short      ),
  .dp_ctrl_rf_pipe0_eu_sel                (dp_ctrl_rf_pipe0_eu_sel               ),
  .dp_ctrl_rf_pipe0_mtvr                  (dp_ctrl_rf_pipe0_mtvr                 ),
  .dp_ctrl_rf_pipe0_src2_vld              (dp_ctrl_rf_pipe0_src2_vld             ),
  .dp_ctrl_rf_pipe0_src_no_rdy            (dp_ctrl_rf_pipe0_src_no_rdy           ),
  .dp_ctrl_rf_pipe1_eu_sel                (dp_ctrl_rf_pipe1_eu_sel               ),
  .dp_ctrl_rf_pipe1_mtvr                  (dp_ctrl_rf_pipe1_mtvr                 ),
  .dp_ctrl_rf_pipe1_src2_vld              (dp_ctrl_rf_pipe1_src2_vld             ),
  .dp_ctrl_rf_pipe1_src_no_rdy            (dp_ctrl_rf_pipe1_src_no_rdy           ),
  .dp_ctrl_rf_pipe2_src_no_rdy            (dp_ctrl_rf_pipe2_src_no_rdy           ),
  .dp_ctrl_rf_pipe3_src1_vld              (dp_ctrl_rf_pipe3_src1_vld             ),
  .dp_ctrl_rf_pipe3_src_no_rdy            (dp_ctrl_rf_pipe3_src_no_rdy           ),
  .dp_ctrl_rf_pipe3_srcvm_vld             (dp_ctrl_rf_pipe3_srcvm_vld            ),
  .dp_ctrl_rf_pipe4_src_no_rdy            (dp_ctrl_rf_pipe4_src_no_rdy           ),
  .dp_ctrl_rf_pipe4_srcvm_vld             (dp_ctrl_rf_pipe4_srcvm_vld            ),
  .dp_ctrl_rf_pipe4_staddr                (dp_ctrl_rf_pipe4_staddr               ),
  .dp_ctrl_rf_pipe5_src0_vld              (dp_ctrl_rf_pipe5_src0_vld             ),
  .dp_ctrl_rf_pipe5_src_no_rdy            (dp_ctrl_rf_pipe5_src_no_rdy           ),
  .dp_ctrl_rf_pipe6_mfvr                  (dp_ctrl_rf_pipe6_mfvr                 ),
  .dp_ctrl_rf_pipe6_src_no_rdy            (dp_ctrl_rf_pipe6_src_no_rdy           ),
  .dp_ctrl_rf_pipe6_srcv2_vld             (dp_ctrl_rf_pipe6_srcv2_vld            ),
  .dp_ctrl_rf_pipe6_vmul                  (dp_ctrl_rf_pipe6_vmul                 ),
  .dp_ctrl_rf_pipe7_mfvr                  (dp_ctrl_rf_pipe7_mfvr                 ),
  .dp_ctrl_rf_pipe7_src_no_rdy            (dp_ctrl_rf_pipe7_src_no_rdy           ),
  .dp_ctrl_rf_pipe7_srcv2_vld             (dp_ctrl_rf_pipe7_srcv2_vld            ),
  .dp_ctrl_rf_pipe7_vmul_unsplit          (dp_ctrl_rf_pipe7_vmul_unsplit         ),
  .dp_fwd_rf_pipe0_src0_preg              (dp_fwd_rf_pipe0_src0_preg             ),
  .dp_fwd_rf_pipe0_src1_preg              (dp_fwd_rf_pipe0_src1_preg             ),
  .dp_fwd_rf_pipe1_mla                    (dp_fwd_rf_pipe1_mla                   ),
  .dp_fwd_rf_pipe1_src0_preg              (dp_fwd_rf_pipe1_src0_preg             ),
  .dp_fwd_rf_pipe1_src1_preg              (dp_fwd_rf_pipe1_src1_preg             ),
  .dp_fwd_rf_pipe2_src0_preg              (dp_fwd_rf_pipe2_src0_preg             ),
  .dp_fwd_rf_pipe2_src1_preg              (dp_fwd_rf_pipe2_src1_preg             ),
  .dp_fwd_rf_pipe3_src0_preg              (dp_fwd_rf_pipe3_src0_preg             ),
  .dp_fwd_rf_pipe3_src1_preg              (dp_fwd_rf_pipe3_src1_preg             ),
  .dp_fwd_rf_pipe4_src0_preg              (dp_fwd_rf_pipe4_src0_preg             ),
  .dp_fwd_rf_pipe4_src1_preg              (dp_fwd_rf_pipe4_src1_preg             ),
  .dp_fwd_rf_pipe5_src0_preg              (dp_fwd_rf_pipe5_src0_preg             ),
  .dp_fwd_rf_pipe5_srcv0_vreg             (dp_fwd_rf_pipe5_srcv0_vreg            ),
  .dp_fwd_rf_pipe6_srcv0_vreg             (dp_fwd_rf_pipe6_srcv0_vreg            ),
  .dp_fwd_rf_pipe6_srcv1_vreg             (dp_fwd_rf_pipe6_srcv1_vreg            ),
  .dp_fwd_rf_pipe6_srcv2_vreg             (dp_fwd_rf_pipe6_srcv2_vreg            ),
  .dp_fwd_rf_pipe6_srcvm_vreg             (dp_fwd_rf_pipe6_srcvm_vreg            ),
  .dp_fwd_rf_pipe6_vmla                   (dp_fwd_rf_pipe6_vmla                  ),
  .dp_fwd_rf_pipe7_srcv0_vreg             (dp_fwd_rf_pipe7_srcv0_vreg            ),
  .dp_fwd_rf_pipe7_srcv1_vreg             (dp_fwd_rf_pipe7_srcv1_vreg            ),
  .dp_fwd_rf_pipe7_srcv2_vreg             (dp_fwd_rf_pipe7_srcv2_vreg            ),
  .dp_fwd_rf_pipe7_srcvm_vreg             (dp_fwd_rf_pipe7_srcvm_vreg            ),
  .dp_fwd_rf_pipe7_vmla                   (dp_fwd_rf_pipe7_vmla                  ),
  .dp_lsiq_rf_pipe3_lch_entry             (dp_lsiq_rf_pipe3_lch_entry            ),
  .dp_lsiq_rf_pipe3_rdy_clr               (dp_lsiq_rf_pipe3_rdy_clr              ),
  .dp_lsiq_rf_pipe4_lch_entry             (dp_lsiq_rf_pipe4_lch_entry            ),
  .dp_lsiq_rf_pipe4_rdy_clr               (dp_lsiq_rf_pipe4_rdy_clr              ),
  .dp_prf_rf_pipe0_src0_preg              (dp_prf_rf_pipe0_src0_preg             ),
  .dp_prf_rf_pipe0_src1_preg              (dp_prf_rf_pipe0_src1_preg             ),
  .dp_prf_rf_pipe1_src0_preg              (dp_prf_rf_pipe1_src0_preg             ),
  .dp_prf_rf_pipe1_src1_preg              (dp_prf_rf_pipe1_src1_preg             ),
  .dp_prf_rf_pipe2_src0_preg              (dp_prf_rf_pipe2_src0_preg             ),
  .dp_prf_rf_pipe2_src1_preg              (dp_prf_rf_pipe2_src1_preg             ),
  .dp_prf_rf_pipe3_src0_preg              (dp_prf_rf_pipe3_src0_preg             ),
  .dp_prf_rf_pipe3_src1_preg              (dp_prf_rf_pipe3_src1_preg             ),
  .dp_prf_rf_pipe4_src0_preg              (dp_prf_rf_pipe4_src0_preg             ),
  .dp_prf_rf_pipe4_src1_preg              (dp_prf_rf_pipe4_src1_preg             ),
  .dp_prf_rf_pipe5_src0_preg              (dp_prf_rf_pipe5_src0_preg             ),
  .dp_prf_rf_pipe5_srcv0_vreg_fr          (dp_prf_rf_pipe5_srcv0_vreg_fr         ),
  .dp_prf_rf_pipe5_srcv0_vreg_vr0         (dp_prf_rf_pipe5_srcv0_vreg_vr0        ),
  .dp_prf_rf_pipe5_srcv0_vreg_vr1         (dp_prf_rf_pipe5_srcv0_vreg_vr1        ),
  .dp_prf_rf_pipe6_srcv0_vreg_fr          (dp_prf_rf_pipe6_srcv0_vreg_fr         ),
  .dp_prf_rf_pipe6_srcv0_vreg_vr0         (dp_prf_rf_pipe6_srcv0_vreg_vr0        ),
  .dp_prf_rf_pipe6_srcv0_vreg_vr1         (dp_prf_rf_pipe6_srcv0_vreg_vr1        ),
  .dp_prf_rf_pipe6_srcv1_vreg_fr          (dp_prf_rf_pipe6_srcv1_vreg_fr         ),
  .dp_prf_rf_pipe6_srcv1_vreg_vr0         (dp_prf_rf_pipe6_srcv1_vreg_vr0        ),
  .dp_prf_rf_pipe6_srcv1_vreg_vr1         (dp_prf_rf_pipe6_srcv1_vreg_vr1        ),
  .dp_prf_rf_pipe6_srcv2_vreg_fr          (dp_prf_rf_pipe6_srcv2_vreg_fr         ),
  .dp_prf_rf_pipe6_srcv2_vreg_vr0         (dp_prf_rf_pipe6_srcv2_vreg_vr0        ),
  .dp_prf_rf_pipe6_srcv2_vreg_vr1         (dp_prf_rf_pipe6_srcv2_vreg_vr1        ),
  .dp_prf_rf_pipe6_srcvm_vreg_vr0         (dp_prf_rf_pipe6_srcvm_vreg_vr0        ),
  .dp_prf_rf_pipe6_srcvm_vreg_vr1         (dp_prf_rf_pipe6_srcvm_vreg_vr1        ),
  .dp_prf_rf_pipe7_srcv0_vreg_fr          (dp_prf_rf_pipe7_srcv0_vreg_fr         ),
  .dp_prf_rf_pipe7_srcv0_vreg_vr0         (dp_prf_rf_pipe7_srcv0_vreg_vr0        ),
  .dp_prf_rf_pipe7_srcv0_vreg_vr1         (dp_prf_rf_pipe7_srcv0_vreg_vr1        ),
  .dp_prf_rf_pipe7_srcv1_vreg_fr          (dp_prf_rf_pipe7_srcv1_vreg_fr         ),
  .dp_prf_rf_pipe7_srcv1_vreg_vr0         (dp_prf_rf_pipe7_srcv1_vreg_vr0        ),
  .dp_prf_rf_pipe7_srcv1_vreg_vr1         (dp_prf_rf_pipe7_srcv1_vreg_vr1        ),
  .dp_prf_rf_pipe7_srcv2_vreg_fr          (dp_prf_rf_pipe7_srcv2_vreg_fr         ),
  .dp_prf_rf_pipe7_srcv2_vreg_vr0         (dp_prf_rf_pipe7_srcv2_vreg_vr0        ),
  .dp_prf_rf_pipe7_srcv2_vreg_vr1         (dp_prf_rf_pipe7_srcv2_vreg_vr1        ),
  .dp_prf_rf_pipe7_srcvm_vreg_vr0         (dp_prf_rf_pipe7_srcvm_vreg_vr0        ),
  .dp_prf_rf_pipe7_srcvm_vreg_vr1         (dp_prf_rf_pipe7_srcvm_vreg_vr1        ),
  .dp_sdiq_rf_lch_entry                   (dp_sdiq_rf_lch_entry                  ),
  .dp_sdiq_rf_rdy_clr                     (dp_sdiq_rf_rdy_clr                    ),
  .dp_sdiq_rf_sdiq_entry                  (dp_sdiq_rf_sdiq_entry                 ),
  .dp_sdiq_rf_staddr1_vld                 (dp_sdiq_rf_staddr1_vld                ),
  .dp_sdiq_rf_staddr_rdy_clr              (dp_sdiq_rf_staddr_rdy_clr             ),
  .dp_sdiq_rf_stdata1_vld                 (dp_sdiq_rf_stdata1_vld                ),
  .dp_viq0_rf_lch_entry                   (dp_viq0_rf_lch_entry                  ),
  .dp_viq0_rf_rdy_clr                     (dp_viq0_rf_rdy_clr                    ),
  .dp_viq1_rf_lch_entry                   (dp_viq1_rf_lch_entry                  ),
  .dp_viq1_rf_rdy_clr                     (dp_viq1_rf_rdy_clr                    ),
  .dp_xx_rf_pipe0_dst_preg_dup0           (dp_xx_rf_pipe0_dst_preg_dup0          ),
  .dp_xx_rf_pipe0_dst_preg_dup1           (dp_xx_rf_pipe0_dst_preg_dup1          ),
  .dp_xx_rf_pipe0_dst_preg_dup2           (dp_xx_rf_pipe0_dst_preg_dup2          ),
  .dp_xx_rf_pipe0_dst_preg_dup3           (dp_xx_rf_pipe0_dst_preg_dup3          ),
  .dp_xx_rf_pipe0_dst_preg_dup4           (dp_xx_rf_pipe0_dst_preg_dup4          ),
  .dp_xx_rf_pipe1_dst_preg_dup0           (dp_xx_rf_pipe1_dst_preg_dup0          ),
  .dp_xx_rf_pipe1_dst_preg_dup1           (dp_xx_rf_pipe1_dst_preg_dup1          ),
  .dp_xx_rf_pipe1_dst_preg_dup2           (dp_xx_rf_pipe1_dst_preg_dup2          ),
  .dp_xx_rf_pipe1_dst_preg_dup3           (dp_xx_rf_pipe1_dst_preg_dup3          ),
  .dp_xx_rf_pipe1_dst_preg_dup4           (dp_xx_rf_pipe1_dst_preg_dup4          ),
  .dp_xx_rf_pipe6_dst_vreg_dup0           (dp_xx_rf_pipe6_dst_vreg_dup0          ),
  .dp_xx_rf_pipe6_dst_vreg_dup1           (dp_xx_rf_pipe6_dst_vreg_dup1          ),
  .dp_xx_rf_pipe6_dst_vreg_dup2           (dp_xx_rf_pipe6_dst_vreg_dup2          ),
  .dp_xx_rf_pipe6_dst_vreg_dup3           (dp_xx_rf_pipe6_dst_vreg_dup3          ),
  .dp_xx_rf_pipe7_dst_vreg_dup0           (dp_xx_rf_pipe7_dst_vreg_dup0          ),
  .dp_xx_rf_pipe7_dst_vreg_dup1           (dp_xx_rf_pipe7_dst_vreg_dup1          ),
  .dp_xx_rf_pipe7_dst_vreg_dup2           (dp_xx_rf_pipe7_dst_vreg_dup2          ),
  .dp_xx_rf_pipe7_dst_vreg_dup3           (dp_xx_rf_pipe7_dst_vreg_dup3          ),
  .forever_cpuclk                         (forever_cpuclk                        ),
  .fwd_dp_rf_pipe0_src0_data              (fwd_dp_rf_pipe0_src0_data             ),
  .fwd_dp_rf_pipe0_src0_no_fwd            (fwd_dp_rf_pipe0_src0_no_fwd           ),
  .fwd_dp_rf_pipe0_src1_data              (fwd_dp_rf_pipe0_src1_data             ),
  .fwd_dp_rf_pipe0_src1_no_fwd            (fwd_dp_rf_pipe0_src1_no_fwd           ),
  .fwd_dp_rf_pipe1_src0_data              (fwd_dp_rf_pipe1_src0_data             ),
  .fwd_dp_rf_pipe1_src0_no_fwd            (fwd_dp_rf_pipe1_src0_no_fwd           ),
  .fwd_dp_rf_pipe1_src1_data              (fwd_dp_rf_pipe1_src1_data             ),
  .fwd_dp_rf_pipe1_src1_no_fwd            (fwd_dp_rf_pipe1_src1_no_fwd           ),
  .fwd_dp_rf_pipe2_src0_data              (fwd_dp_rf_pipe2_src0_data             ),
  .fwd_dp_rf_pipe2_src0_no_fwd            (fwd_dp_rf_pipe2_src0_no_fwd           ),
  .fwd_dp_rf_pipe2_src1_data              (fwd_dp_rf_pipe2_src1_data             ),
  .fwd_dp_rf_pipe2_src1_no_fwd            (fwd_dp_rf_pipe2_src1_no_fwd           ),
  .fwd_dp_rf_pipe3_src0_data              (fwd_dp_rf_pipe3_src0_data             ),
  .fwd_dp_rf_pipe3_src0_no_fwd            (fwd_dp_rf_pipe3_src0_no_fwd           ),
  .fwd_dp_rf_pipe3_src1_data              (fwd_dp_rf_pipe3_src1_data             ),
  .fwd_dp_rf_pipe3_src1_no_fwd            (fwd_dp_rf_pipe3_src1_no_fwd           ),
  .fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla (fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla),
  .fwd_dp_rf_pipe3_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe3_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe3_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe3_srcvm_vreg_vr1_data   ),
  .fwd_dp_rf_pipe4_src0_data              (fwd_dp_rf_pipe4_src0_data             ),
  .fwd_dp_rf_pipe4_src0_no_fwd            (fwd_dp_rf_pipe4_src0_no_fwd           ),
  .fwd_dp_rf_pipe4_src1_data              (fwd_dp_rf_pipe4_src1_data             ),
  .fwd_dp_rf_pipe4_src1_no_fwd            (fwd_dp_rf_pipe4_src1_no_fwd           ),
  .fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla (fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla),
  .fwd_dp_rf_pipe4_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe4_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe4_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe4_srcvm_vreg_vr1_data   ),
  .fwd_dp_rf_pipe5_src0_data              (fwd_dp_rf_pipe5_src0_data             ),
  .fwd_dp_rf_pipe5_src0_no_fwd            (fwd_dp_rf_pipe5_src0_no_fwd           ),
  .fwd_dp_rf_pipe5_src0_no_fwd_expt_mla   (fwd_dp_rf_pipe5_src0_no_fwd_expt_mla  ),
  .fwd_dp_rf_pipe5_srcv0_no_fwd           (fwd_dp_rf_pipe5_srcv0_no_fwd          ),
  .fwd_dp_rf_pipe5_srcv0_vreg_fr_data     (fwd_dp_rf_pipe5_srcv0_vreg_fr_data    ),
  .fwd_dp_rf_pipe5_srcv0_vreg_vr0_data    (fwd_dp_rf_pipe5_srcv0_vreg_vr0_data   ),
  .fwd_dp_rf_pipe5_srcv0_vreg_vr1_data    (fwd_dp_rf_pipe5_srcv0_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcv0_no_fwd           (fwd_dp_rf_pipe6_srcv0_no_fwd          ),
  .fwd_dp_rf_pipe6_srcv0_vreg_fr_data     (fwd_dp_rf_pipe6_srcv0_vreg_fr_data    ),
  .fwd_dp_rf_pipe6_srcv0_vreg_vr0_data    (fwd_dp_rf_pipe6_srcv0_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcv0_vreg_vr1_data    (fwd_dp_rf_pipe6_srcv0_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcv1_no_fwd           (fwd_dp_rf_pipe6_srcv1_no_fwd          ),
  .fwd_dp_rf_pipe6_srcv1_vreg_fr_data     (fwd_dp_rf_pipe6_srcv1_vreg_fr_data    ),
  .fwd_dp_rf_pipe6_srcv1_vreg_vr0_data    (fwd_dp_rf_pipe6_srcv1_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcv1_vreg_vr1_data    (fwd_dp_rf_pipe6_srcv1_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcv2_no_fwd           (fwd_dp_rf_pipe6_srcv2_no_fwd          ),
  .fwd_dp_rf_pipe6_srcv2_vreg_fr_data     (fwd_dp_rf_pipe6_srcv2_vreg_fr_data    ),
  .fwd_dp_rf_pipe6_srcv2_vreg_vr0_data    (fwd_dp_rf_pipe6_srcv2_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcv2_vreg_vr1_data    (fwd_dp_rf_pipe6_srcv2_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcvm_no_fwd           (fwd_dp_rf_pipe6_srcvm_no_fwd          ),
  .fwd_dp_rf_pipe6_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe6_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe6_srcvm_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcv0_no_fwd           (fwd_dp_rf_pipe7_srcv0_no_fwd          ),
  .fwd_dp_rf_pipe7_srcv0_vreg_fr_data     (fwd_dp_rf_pipe7_srcv0_vreg_fr_data    ),
  .fwd_dp_rf_pipe7_srcv0_vreg_vr0_data    (fwd_dp_rf_pipe7_srcv0_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcv0_vreg_vr1_data    (fwd_dp_rf_pipe7_srcv0_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcv1_no_fwd           (fwd_dp_rf_pipe7_srcv1_no_fwd          ),
  .fwd_dp_rf_pipe7_srcv1_vreg_fr_data     (fwd_dp_rf_pipe7_srcv1_vreg_fr_data    ),
  .fwd_dp_rf_pipe7_srcv1_vreg_vr0_data    (fwd_dp_rf_pipe7_srcv1_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcv1_vreg_vr1_data    (fwd_dp_rf_pipe7_srcv1_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcv2_no_fwd           (fwd_dp_rf_pipe7_srcv2_no_fwd          ),
  .fwd_dp_rf_pipe7_srcv2_vreg_fr_data     (fwd_dp_rf_pipe7_srcv2_vreg_fr_data    ),
  .fwd_dp_rf_pipe7_srcv2_vreg_vr0_data    (fwd_dp_rf_pipe7_srcv2_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcv2_vreg_vr1_data    (fwd_dp_rf_pipe7_srcv2_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcvm_no_fwd           (fwd_dp_rf_pipe7_srcvm_no_fwd          ),
  .fwd_dp_rf_pipe7_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe7_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe7_srcvm_vreg_vr1_data   ),
  .had_idu_wbbr_data                      (had_idu_wbbr_data                     ),
  .had_idu_wbbr_vld                       (had_idu_wbbr_vld                      ),
  .idu_cp0_rf_func                        (idu_cp0_rf_func                       ),
  .idu_cp0_rf_iid                         (idu_cp0_rf_iid                        ),
  .idu_cp0_rf_opcode                      (idu_cp0_rf_opcode                     ),
  .idu_cp0_rf_preg                        (idu_cp0_rf_preg                       ),
  .idu_cp0_rf_src0                        (idu_cp0_rf_src0                       ),
  .idu_iu_rf_pipe0_alu_short              (idu_iu_rf_pipe0_alu_short             ),
  .idu_iu_rf_pipe0_dst_preg               (idu_iu_rf_pipe0_dst_preg              ),
  .idu_iu_rf_pipe0_dst_vld                (idu_iu_rf_pipe0_dst_vld               ),
  .idu_iu_rf_pipe0_dst_vreg               (idu_iu_rf_pipe0_dst_vreg              ),
  .idu_iu_rf_pipe0_dstv_vld               (idu_iu_rf_pipe0_dstv_vld              ),
  .idu_iu_rf_pipe0_expt_vec               (idu_iu_rf_pipe0_expt_vec              ),
  .idu_iu_rf_pipe0_expt_vld               (idu_iu_rf_pipe0_expt_vld              ),
  .idu_iu_rf_pipe0_func                   (idu_iu_rf_pipe0_func                  ),
  .idu_iu_rf_pipe0_high_hw_expt           (idu_iu_rf_pipe0_high_hw_expt          ),
  .idu_iu_rf_pipe0_iid                    (idu_iu_rf_pipe0_iid                   ),
  .idu_iu_rf_pipe0_imm                    (idu_iu_rf_pipe0_imm                   ),
  .idu_iu_rf_pipe0_opcode                 (idu_iu_rf_pipe0_opcode                ),
  .idu_iu_rf_pipe0_pid                    (idu_iu_rf_pipe0_pid                   ),
  .idu_iu_rf_pipe0_rslt_sel               (idu_iu_rf_pipe0_rslt_sel              ),
  .idu_iu_rf_pipe0_special_imm            (idu_iu_rf_pipe0_special_imm           ),
  .idu_iu_rf_pipe0_src0                   (idu_iu_rf_pipe0_src0                  ),
  .idu_iu_rf_pipe0_src1                   (idu_iu_rf_pipe0_src1                  ),
  .idu_iu_rf_pipe0_src1_no_imm            (idu_iu_rf_pipe0_src1_no_imm           ),
  .idu_iu_rf_pipe0_src2                   (idu_iu_rf_pipe0_src2                  ),
  .idu_iu_rf_pipe0_vl                     (idu_iu_rf_pipe0_vl                    ),
  .idu_iu_rf_pipe0_vlmul                  (idu_iu_rf_pipe0_vlmul                 ),
  .idu_iu_rf_pipe0_vsew                   (idu_iu_rf_pipe0_vsew                  ),
  .idu_iu_rf_pipe1_alu_short              (idu_iu_rf_pipe1_alu_short             ),
  .idu_iu_rf_pipe1_dst_preg               (idu_iu_rf_pipe1_dst_preg              ),
  .idu_iu_rf_pipe1_dst_vld                (idu_iu_rf_pipe1_dst_vld               ),
  .idu_iu_rf_pipe1_dst_vreg               (idu_iu_rf_pipe1_dst_vreg              ),
  .idu_iu_rf_pipe1_dstv_vld               (idu_iu_rf_pipe1_dstv_vld              ),
  .idu_iu_rf_pipe1_func                   (idu_iu_rf_pipe1_func                  ),
  .idu_iu_rf_pipe1_iid                    (idu_iu_rf_pipe1_iid                   ),
  .idu_iu_rf_pipe1_imm                    (idu_iu_rf_pipe1_imm                   ),
  .idu_iu_rf_pipe1_mla_src2_preg          (idu_iu_rf_pipe1_mla_src2_preg         ),
  .idu_iu_rf_pipe1_mla_src2_vld           (idu_iu_rf_pipe1_mla_src2_vld          ),
  .idu_iu_rf_pipe1_mult_func              (idu_iu_rf_pipe1_mult_func             ),
  .idu_iu_rf_pipe1_rslt_sel               (idu_iu_rf_pipe1_rslt_sel              ),
  .idu_iu_rf_pipe1_src0                   (idu_iu_rf_pipe1_src0                  ),
  .idu_iu_rf_pipe1_src1                   (idu_iu_rf_pipe1_src1                  ),
  .idu_iu_rf_pipe1_src1_no_imm            (idu_iu_rf_pipe1_src1_no_imm           ),
  .idu_iu_rf_pipe1_src2                   (idu_iu_rf_pipe1_src2                  ),
  .idu_iu_rf_pipe1_vl                     (idu_iu_rf_pipe1_vl                    ),
  .idu_iu_rf_pipe1_vlmul                  (idu_iu_rf_pipe1_vlmul                 ),
  .idu_iu_rf_pipe1_vsew                   (idu_iu_rf_pipe1_vsew                  ),
  .idu_iu_rf_pipe2_func                   (idu_iu_rf_pipe2_func                  ),
  .idu_iu_rf_pipe2_iid                    (idu_iu_rf_pipe2_iid                   ),
  .idu_iu_rf_pipe2_length                 (idu_iu_rf_pipe2_length                ),
  .idu_iu_rf_pipe2_offset                 (idu_iu_rf_pipe2_offset                ),
  .idu_iu_rf_pipe2_pcall                  (idu_iu_rf_pipe2_pcall                 ),
  .idu_iu_rf_pipe2_pid                    (idu_iu_rf_pipe2_pid                   ),
  .idu_iu_rf_pipe2_rts                    (idu_iu_rf_pipe2_rts                   ),
  .idu_iu_rf_pipe2_src0                   (idu_iu_rf_pipe2_src0                  ),
  .idu_iu_rf_pipe2_src1                   (idu_iu_rf_pipe2_src1                  ),
  .idu_iu_rf_pipe2_vl                     (idu_iu_rf_pipe2_vl                    ),
  .idu_iu_rf_pipe2_vlmul                  (idu_iu_rf_pipe2_vlmul                 ),
  .idu_iu_rf_pipe2_vsew                   (idu_iu_rf_pipe2_vsew                  ),
  .idu_lsu_rf_pipe3_already_da            (idu_lsu_rf_pipe3_already_da           ),
  .idu_lsu_rf_pipe3_atomic                (idu_lsu_rf_pipe3_atomic               ),
  .idu_lsu_rf_pipe3_bkpta_data            (idu_lsu_rf_pipe3_bkpta_data           ),
  .idu_lsu_rf_pipe3_bkptb_data            (idu_lsu_rf_pipe3_bkptb_data           ),
  .idu_lsu_rf_pipe3_iid                   (idu_lsu_rf_pipe3_iid                  ),
  .idu_lsu_rf_pipe3_inst_fls              (idu_lsu_rf_pipe3_inst_fls             ),
  .idu_lsu_rf_pipe3_inst_ldr              (idu_lsu_rf_pipe3_inst_ldr             ),
  .idu_lsu_rf_pipe3_inst_size             (idu_lsu_rf_pipe3_inst_size            ),
  .idu_lsu_rf_pipe3_inst_type             (idu_lsu_rf_pipe3_inst_type            ),
  .idu_lsu_rf_pipe3_lch_entry             (idu_lsu_rf_pipe3_lch_entry            ),
  .idu_lsu_rf_pipe3_lsfifo                (idu_lsu_rf_pipe3_lsfifo               ),
  .idu_lsu_rf_pipe3_no_spec               (idu_lsu_rf_pipe3_no_spec              ),
  .idu_lsu_rf_pipe3_no_spec_exist         (idu_lsu_rf_pipe3_no_spec_exist        ),
  .idu_lsu_rf_pipe3_off_0_extend          (idu_lsu_rf_pipe3_off_0_extend         ),
  .idu_lsu_rf_pipe3_offset                (idu_lsu_rf_pipe3_offset               ),
  .idu_lsu_rf_pipe3_offset_plus           (idu_lsu_rf_pipe3_offset_plus          ),
  .idu_lsu_rf_pipe3_oldest                (idu_lsu_rf_pipe3_oldest               ),
  .idu_lsu_rf_pipe3_pc                    (idu_lsu_rf_pipe3_pc                   ),
  .idu_lsu_rf_pipe3_preg                  (idu_lsu_rf_pipe3_preg                 ),
  .idu_lsu_rf_pipe3_shift                 (idu_lsu_rf_pipe3_shift                ),
  .idu_lsu_rf_pipe3_sign_extend           (idu_lsu_rf_pipe3_sign_extend          ),
  .idu_lsu_rf_pipe3_spec_fail             (idu_lsu_rf_pipe3_spec_fail            ),
  .idu_lsu_rf_pipe3_split                 (idu_lsu_rf_pipe3_split                ),
  .idu_lsu_rf_pipe3_src0                  (idu_lsu_rf_pipe3_src0                 ),
  .idu_lsu_rf_pipe3_src1                  (idu_lsu_rf_pipe3_src1                 ),
  .idu_lsu_rf_pipe3_unalign_2nd           (idu_lsu_rf_pipe3_unalign_2nd          ),
  .idu_lsu_rf_pipe3_vreg                  (idu_lsu_rf_pipe3_vreg                 ),
  .idu_lsu_rf_pipe4_already_da            (idu_lsu_rf_pipe4_already_da           ),
  .idu_lsu_rf_pipe4_atomic                (idu_lsu_rf_pipe4_atomic               ),
  .idu_lsu_rf_pipe4_bkpta_data            (idu_lsu_rf_pipe4_bkpta_data           ),
  .idu_lsu_rf_pipe4_bkptb_data            (idu_lsu_rf_pipe4_bkptb_data           ),
  .idu_lsu_rf_pipe4_fence_mode            (idu_lsu_rf_pipe4_fence_mode           ),
  .idu_lsu_rf_pipe4_icc                   (idu_lsu_rf_pipe4_icc                  ),
  .idu_lsu_rf_pipe4_iid                   (idu_lsu_rf_pipe4_iid                  ),
  .idu_lsu_rf_pipe4_inst_code             (idu_lsu_rf_pipe4_inst_code            ),
  .idu_lsu_rf_pipe4_inst_fls              (idu_lsu_rf_pipe4_inst_fls             ),
  .idu_lsu_rf_pipe4_inst_flush            (idu_lsu_rf_pipe4_inst_flush           ),
  .idu_lsu_rf_pipe4_inst_mode             (idu_lsu_rf_pipe4_inst_mode            ),
  .idu_lsu_rf_pipe4_inst_share            (idu_lsu_rf_pipe4_inst_share           ),
  .idu_lsu_rf_pipe4_inst_size             (idu_lsu_rf_pipe4_inst_size            ),
  .idu_lsu_rf_pipe4_inst_str              (idu_lsu_rf_pipe4_inst_str             ),
  .idu_lsu_rf_pipe4_inst_type             (idu_lsu_rf_pipe4_inst_type            ),
  .idu_lsu_rf_pipe4_lch_entry             (idu_lsu_rf_pipe4_lch_entry            ),
  .idu_lsu_rf_pipe4_lsfifo                (idu_lsu_rf_pipe4_lsfifo               ),
  .idu_lsu_rf_pipe4_mmu_req               (idu_lsu_rf_pipe4_mmu_req              ),
  .idu_lsu_rf_pipe4_no_spec               (idu_lsu_rf_pipe4_no_spec              ),
  .idu_lsu_rf_pipe4_off_0_extend          (idu_lsu_rf_pipe4_off_0_extend         ),
  .idu_lsu_rf_pipe4_offset                (idu_lsu_rf_pipe4_offset               ),
  .idu_lsu_rf_pipe4_offset_plus           (idu_lsu_rf_pipe4_offset_plus          ),
  .idu_lsu_rf_pipe4_oldest                (idu_lsu_rf_pipe4_oldest               ),
  .idu_lsu_rf_pipe4_pc                    (idu_lsu_rf_pipe4_pc                   ),
  .idu_lsu_rf_pipe4_sdiq_entry            (idu_lsu_rf_pipe4_sdiq_entry           ),
  .idu_lsu_rf_pipe4_shift                 (idu_lsu_rf_pipe4_shift                ),
  .idu_lsu_rf_pipe4_spec_fail             (idu_lsu_rf_pipe4_spec_fail            ),
  .idu_lsu_rf_pipe4_split                 (idu_lsu_rf_pipe4_split                ),
  .idu_lsu_rf_pipe4_src0                  (idu_lsu_rf_pipe4_src0                 ),
  .idu_lsu_rf_pipe4_src1                  (idu_lsu_rf_pipe4_src1                 ),
  .idu_lsu_rf_pipe4_st                    (idu_lsu_rf_pipe4_st                   ),
  .idu_lsu_rf_pipe4_staddr                (idu_lsu_rf_pipe4_staddr               ),
  .idu_lsu_rf_pipe4_sync_fence            (idu_lsu_rf_pipe4_sync_fence           ),
  .idu_lsu_rf_pipe4_unalign_2nd           (idu_lsu_rf_pipe4_unalign_2nd          ),
  .idu_lsu_rf_pipe5_sdiq_entry            (idu_lsu_rf_pipe5_sdiq_entry           ),
  .idu_lsu_rf_pipe5_src0                  (idu_lsu_rf_pipe5_src0                 ),
  .idu_lsu_rf_pipe5_srcv0_fr              (idu_lsu_rf_pipe5_srcv0_fr             ),
  .idu_lsu_rf_pipe5_srcv0_fr_vld          (idu_lsu_rf_pipe5_srcv0_fr_vld         ),
  .idu_lsu_rf_pipe5_srcv0_vld             (idu_lsu_rf_pipe5_srcv0_vld            ),
  .idu_lsu_rf_pipe5_srcv0_vr0             (idu_lsu_rf_pipe5_srcv0_vr0            ),
  .idu_lsu_rf_pipe5_srcv0_vr1             (idu_lsu_rf_pipe5_srcv0_vr1            ),
  .idu_lsu_rf_pipe5_stdata1_vld           (idu_lsu_rf_pipe5_stdata1_vld          ),
  .idu_lsu_rf_pipe5_unalign               (idu_lsu_rf_pipe5_unalign              ),
  .idu_vfpu_rf_pipe6_dst_ereg             (idu_vfpu_rf_pipe6_dst_ereg            ),
  .idu_vfpu_rf_pipe6_dst_preg             (idu_vfpu_rf_pipe6_dst_preg            ),
  .idu_vfpu_rf_pipe6_dst_vld              (idu_vfpu_rf_pipe6_dst_vld             ),
  .idu_vfpu_rf_pipe6_dst_vreg             (idu_vfpu_rf_pipe6_dst_vreg            ),
  .idu_vfpu_rf_pipe6_dste_vld             (idu_vfpu_rf_pipe6_dste_vld            ),
  .idu_vfpu_rf_pipe6_dstv_vld             (idu_vfpu_rf_pipe6_dstv_vld            ),
  .idu_vfpu_rf_pipe6_eu_sel               (idu_vfpu_rf_pipe6_eu_sel              ),
  .idu_vfpu_rf_pipe6_func                 (idu_vfpu_rf_pipe6_func                ),
  .idu_vfpu_rf_pipe6_iid                  (idu_vfpu_rf_pipe6_iid                 ),
  .idu_vfpu_rf_pipe6_imm0                 (idu_vfpu_rf_pipe6_imm0                ),
  .idu_vfpu_rf_pipe6_inst_type            (idu_vfpu_rf_pipe6_inst_type           ),
  .idu_vfpu_rf_pipe6_mla_srcv2_vld        (idu_vfpu_rf_pipe6_mla_srcv2_vld       ),
  .idu_vfpu_rf_pipe6_mla_srcv2_vreg       (idu_vfpu_rf_pipe6_mla_srcv2_vreg      ),
  .idu_vfpu_rf_pipe6_ready_stage          (idu_vfpu_rf_pipe6_ready_stage         ),
  .idu_vfpu_rf_pipe6_srcv0_fr             (idu_vfpu_rf_pipe6_srcv0_fr            ),
  .idu_vfpu_rf_pipe6_srcv1_fr             (idu_vfpu_rf_pipe6_srcv1_fr            ),
  .idu_vfpu_rf_pipe6_srcv2_fr             (idu_vfpu_rf_pipe6_srcv2_fr            ),
  .idu_vfpu_rf_pipe6_vmla_type            (idu_vfpu_rf_pipe6_vmla_type           ),
  .idu_vfpu_rf_pipe7_dst_ereg             (idu_vfpu_rf_pipe7_dst_ereg            ),
  .idu_vfpu_rf_pipe7_dst_preg             (idu_vfpu_rf_pipe7_dst_preg            ),
  .idu_vfpu_rf_pipe7_dst_vld              (idu_vfpu_rf_pipe7_dst_vld             ),
  .idu_vfpu_rf_pipe7_dst_vreg             (idu_vfpu_rf_pipe7_dst_vreg            ),
  .idu_vfpu_rf_pipe7_dste_vld             (idu_vfpu_rf_pipe7_dste_vld            ),
  .idu_vfpu_rf_pipe7_dstv_vld             (idu_vfpu_rf_pipe7_dstv_vld            ),
  .idu_vfpu_rf_pipe7_eu_sel               (idu_vfpu_rf_pipe7_eu_sel              ),
  .idu_vfpu_rf_pipe7_func                 (idu_vfpu_rf_pipe7_func                ),
  .idu_vfpu_rf_pipe7_iid                  (idu_vfpu_rf_pipe7_iid                 ),
  .idu_vfpu_rf_pipe7_imm0                 (idu_vfpu_rf_pipe7_imm0                ),
  .idu_vfpu_rf_pipe7_inst_type            (idu_vfpu_rf_pipe7_inst_type           ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vld        (idu_vfpu_rf_pipe7_mla_srcv2_vld       ),
  .idu_vfpu_rf_pipe7_mla_srcv2_vreg       (idu_vfpu_rf_pipe7_mla_srcv2_vreg      ),
  .idu_vfpu_rf_pipe7_ready_stage          (idu_vfpu_rf_pipe7_ready_stage         ),
  .idu_vfpu_rf_pipe7_srcv0_fr             (idu_vfpu_rf_pipe7_srcv0_fr            ),
  .idu_vfpu_rf_pipe7_srcv1_fr             (idu_vfpu_rf_pipe7_srcv1_fr            ),
  .idu_vfpu_rf_pipe7_srcv2_fr             (idu_vfpu_rf_pipe7_srcv2_fr            ),
  .idu_vfpu_rf_pipe7_vmla_type            (idu_vfpu_rf_pipe7_vmla_type           ),
  .lsiq_dp_pipe3_issue_entry              (lsiq_dp_pipe3_issue_entry             ),
  .lsiq_dp_pipe3_issue_read_data          (lsiq_dp_pipe3_issue_read_data         ),
  .lsiq_dp_pipe4_issue_entry              (lsiq_dp_pipe4_issue_entry             ),
  .lsiq_dp_pipe4_issue_read_data          (lsiq_dp_pipe4_issue_read_data         ),
  .lsiq_xx_gateclk_issue_en               (lsiq_xx_gateclk_issue_en              ),
  .lsiq_xx_pipe3_issue_en                 (lsiq_xx_pipe3_issue_en                ),
  .lsiq_xx_pipe4_issue_en                 (lsiq_xx_pipe4_issue_en                ),
  .lsu_idu_dc_sdiq_entry                  (lsu_idu_dc_sdiq_entry                 ),
  .lsu_idu_dc_staddr1_vld                 (lsu_idu_dc_staddr1_vld                ),
  .lsu_idu_dc_staddr_unalign              (lsu_idu_dc_staddr_unalign             ),
  .lsu_idu_dc_staddr_vld                  (lsu_idu_dc_staddr_vld                 ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .prf_dp_rf_pipe0_src0_data              (prf_dp_rf_pipe0_src0_data             ),
  .prf_dp_rf_pipe0_src1_data              (prf_dp_rf_pipe0_src1_data             ),
  .prf_dp_rf_pipe2_src0_data              (prf_dp_rf_pipe2_src0_data             ),
  .prf_dp_rf_pipe2_src1_data              (prf_dp_rf_pipe2_src1_data             ),
  .prf_dp_rf_pipe3_src0_data              (prf_dp_rf_pipe3_src0_data             ),
  .prf_dp_rf_pipe3_src1_data              (prf_dp_rf_pipe3_src1_data             ),
  .prf_dp_rf_pipe4_src0_data              (prf_dp_rf_pipe4_src0_data             ),
  .prf_dp_rf_pipe4_src1_data              (prf_dp_rf_pipe4_src1_data             ),
  .prf_dp_rf_pipe5_src0_data              (prf_dp_rf_pipe5_src0_data             ),
  .prf_dp_rf_pipe5_srcv0_vreg_fr_data     (prf_dp_rf_pipe5_srcv0_vreg_fr_data    ),
  .prf_dp_rf_pipe5_srcv0_vreg_vr0_data    (prf_dp_rf_pipe5_srcv0_vreg_vr0_data   ),
  .prf_dp_rf_pipe5_srcv0_vreg_vr1_data    (prf_dp_rf_pipe5_srcv0_vreg_vr1_data   ),
  .prf_dp_rf_pipe6_srcv0_vreg_fr_data     (prf_dp_rf_pipe6_srcv0_vreg_fr_data    ),
  .prf_dp_rf_pipe6_srcv0_vreg_vr0_data    (prf_dp_rf_pipe6_srcv0_vreg_vr0_data   ),
  .prf_dp_rf_pipe6_srcv0_vreg_vr1_data    (prf_dp_rf_pipe6_srcv0_vreg_vr1_data   ),
  .prf_dp_rf_pipe6_srcv1_vreg_fr_data     (prf_dp_rf_pipe6_srcv1_vreg_fr_data    ),
  .prf_dp_rf_pipe6_srcv1_vreg_vr0_data    (prf_dp_rf_pipe6_srcv1_vreg_vr0_data   ),
  .prf_dp_rf_pipe6_srcv1_vreg_vr1_data    (prf_dp_rf_pipe6_srcv1_vreg_vr1_data   ),
  .prf_dp_rf_pipe6_srcv2_vreg_fr_data     (prf_dp_rf_pipe6_srcv2_vreg_fr_data    ),
  .prf_dp_rf_pipe6_srcv2_vreg_vr0_data    (prf_dp_rf_pipe6_srcv2_vreg_vr0_data   ),
  .prf_dp_rf_pipe6_srcv2_vreg_vr1_data    (prf_dp_rf_pipe6_srcv2_vreg_vr1_data   ),
  .prf_dp_rf_pipe6_srcvm_vreg_vr0_data    (prf_dp_rf_pipe6_srcvm_vreg_vr0_data   ),
  .prf_dp_rf_pipe6_srcvm_vreg_vr1_data    (prf_dp_rf_pipe6_srcvm_vreg_vr1_data   ),
  .prf_dp_rf_pipe7_srcv0_vreg_fr_data     (prf_dp_rf_pipe7_srcv0_vreg_fr_data    ),
  .prf_dp_rf_pipe7_srcv0_vreg_vr0_data    (prf_dp_rf_pipe7_srcv0_vreg_vr0_data   ),
  .prf_dp_rf_pipe7_srcv0_vreg_vr1_data    (prf_dp_rf_pipe7_srcv0_vreg_vr1_data   ),
  .prf_dp_rf_pipe7_srcv1_vreg_fr_data     (prf_dp_rf_pipe7_srcv1_vreg_fr_data    ),
  .prf_dp_rf_pipe7_srcv1_vreg_vr0_data    (prf_dp_rf_pipe7_srcv1_vreg_vr0_data   ),
  .prf_dp_rf_pipe7_srcv1_vreg_vr1_data    (prf_dp_rf_pipe7_srcv1_vreg_vr1_data   ),
  .prf_dp_rf_pipe7_srcv2_vreg_fr_data     (prf_dp_rf_pipe7_srcv2_vreg_fr_data    ),
  .prf_dp_rf_pipe7_srcv2_vreg_vr0_data    (prf_dp_rf_pipe7_srcv2_vreg_vr0_data   ),
  .prf_dp_rf_pipe7_srcv2_vreg_vr1_data    (prf_dp_rf_pipe7_srcv2_vreg_vr1_data   ),
  .prf_dp_rf_pipe7_srcvm_vreg_vr0_data    (prf_dp_rf_pipe7_srcvm_vreg_vr0_data   ),
  .prf_dp_rf_pipe7_srcvm_vreg_vr1_data    (prf_dp_rf_pipe7_srcvm_vreg_vr1_data   ),
  .prf_xx_rf_pipe1_src0_data              (prf_xx_rf_pipe1_src0_data             ),
  .prf_xx_rf_pipe1_src1_data              (prf_xx_rf_pipe1_src1_data             ),
  .rtu_idu_flush_fe                       (rtu_idu_flush_fe                      ),
  .rtu_idu_flush_is                       (rtu_idu_flush_is                      ),
  .sdiq_dp_issue_entry                    (sdiq_dp_issue_entry                   ),
  .sdiq_dp_issue_read_data                (sdiq_dp_issue_read_data               ),
  .sdiq_xx_gateclk_issue_en               (sdiq_xx_gateclk_issue_en              ),
  .sdiq_xx_issue_en                       (sdiq_xx_issue_en                      ),
  .viq0_dp_issue_entry                    (viq0_dp_issue_entry                   ),
  .viq0_dp_issue_read_data                (viq0_dp_issue_read_data               ),
  .viq0_xx_gateclk_issue_en               (viq0_xx_gateclk_issue_en              ),
  .viq0_xx_issue_en                       (viq0_xx_issue_en                      ),
  .viq1_dp_issue_entry                    (viq1_dp_issue_entry                   ),
  .viq1_dp_issue_read_data                (viq1_dp_issue_read_data               ),
  .viq1_xx_gateclk_issue_en               (viq1_xx_gateclk_issue_en              ),
  .viq1_xx_issue_en                       (viq1_xx_issue_en                      )
);

// &Instance("ct_idu_rf_fwd", "x_ct_idu_rf_fwd"); @82
ct_idu_rf_fwd  x_ct_idu_rf_fwd (
  .cp0_idu_src2_fwd_disable               (cp0_idu_src2_fwd_disable              ),
  .cp0_idu_srcv2_fwd_disable              (cp0_idu_srcv2_fwd_disable             ),
  .dp_fwd_rf_pipe0_src0_preg              (dp_fwd_rf_pipe0_src0_preg             ),
  .dp_fwd_rf_pipe0_src1_preg              (dp_fwd_rf_pipe0_src1_preg             ),
  .dp_fwd_rf_pipe1_mla                    (dp_fwd_rf_pipe1_mla                   ),
  .dp_fwd_rf_pipe1_src0_preg              (dp_fwd_rf_pipe1_src0_preg             ),
  .dp_fwd_rf_pipe1_src1_preg              (dp_fwd_rf_pipe1_src1_preg             ),
  .dp_fwd_rf_pipe2_src0_preg              (dp_fwd_rf_pipe2_src0_preg             ),
  .dp_fwd_rf_pipe2_src1_preg              (dp_fwd_rf_pipe2_src1_preg             ),
  .dp_fwd_rf_pipe3_src0_preg              (dp_fwd_rf_pipe3_src0_preg             ),
  .dp_fwd_rf_pipe3_src1_preg              (dp_fwd_rf_pipe3_src1_preg             ),
  .dp_fwd_rf_pipe4_src0_preg              (dp_fwd_rf_pipe4_src0_preg             ),
  .dp_fwd_rf_pipe4_src1_preg              (dp_fwd_rf_pipe4_src1_preg             ),
  .dp_fwd_rf_pipe5_src0_preg              (dp_fwd_rf_pipe5_src0_preg             ),
  .dp_fwd_rf_pipe5_srcv0_vreg             (dp_fwd_rf_pipe5_srcv0_vreg            ),
  .dp_fwd_rf_pipe6_srcv0_vreg             (dp_fwd_rf_pipe6_srcv0_vreg            ),
  .dp_fwd_rf_pipe6_srcv1_vreg             (dp_fwd_rf_pipe6_srcv1_vreg            ),
  .dp_fwd_rf_pipe6_srcv2_vreg             (dp_fwd_rf_pipe6_srcv2_vreg            ),
  .dp_fwd_rf_pipe6_srcvm_vreg             (dp_fwd_rf_pipe6_srcvm_vreg            ),
  .dp_fwd_rf_pipe6_vmla                   (dp_fwd_rf_pipe6_vmla                  ),
  .dp_fwd_rf_pipe7_srcv0_vreg             (dp_fwd_rf_pipe7_srcv0_vreg            ),
  .dp_fwd_rf_pipe7_srcv1_vreg             (dp_fwd_rf_pipe7_srcv1_vreg            ),
  .dp_fwd_rf_pipe7_srcv2_vreg             (dp_fwd_rf_pipe7_srcv2_vreg            ),
  .dp_fwd_rf_pipe7_srcvm_vreg             (dp_fwd_rf_pipe7_srcvm_vreg            ),
  .dp_fwd_rf_pipe7_vmla                   (dp_fwd_rf_pipe7_vmla                  ),
  .fwd_dp_rf_pipe0_src0_data              (fwd_dp_rf_pipe0_src0_data             ),
  .fwd_dp_rf_pipe0_src0_no_fwd            (fwd_dp_rf_pipe0_src0_no_fwd           ),
  .fwd_dp_rf_pipe0_src1_data              (fwd_dp_rf_pipe0_src1_data             ),
  .fwd_dp_rf_pipe0_src1_no_fwd            (fwd_dp_rf_pipe0_src1_no_fwd           ),
  .fwd_dp_rf_pipe1_src0_data              (fwd_dp_rf_pipe1_src0_data             ),
  .fwd_dp_rf_pipe1_src0_no_fwd            (fwd_dp_rf_pipe1_src0_no_fwd           ),
  .fwd_dp_rf_pipe1_src1_data              (fwd_dp_rf_pipe1_src1_data             ),
  .fwd_dp_rf_pipe1_src1_no_fwd            (fwd_dp_rf_pipe1_src1_no_fwd           ),
  .fwd_dp_rf_pipe2_src0_data              (fwd_dp_rf_pipe2_src0_data             ),
  .fwd_dp_rf_pipe2_src0_no_fwd            (fwd_dp_rf_pipe2_src0_no_fwd           ),
  .fwd_dp_rf_pipe2_src1_data              (fwd_dp_rf_pipe2_src1_data             ),
  .fwd_dp_rf_pipe2_src1_no_fwd            (fwd_dp_rf_pipe2_src1_no_fwd           ),
  .fwd_dp_rf_pipe3_src0_data              (fwd_dp_rf_pipe3_src0_data             ),
  .fwd_dp_rf_pipe3_src0_no_fwd            (fwd_dp_rf_pipe3_src0_no_fwd           ),
  .fwd_dp_rf_pipe3_src1_data              (fwd_dp_rf_pipe3_src1_data             ),
  .fwd_dp_rf_pipe3_src1_no_fwd            (fwd_dp_rf_pipe3_src1_no_fwd           ),
  .fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla (fwd_dp_rf_pipe3_srcvm_no_fwd_expt_vmla),
  .fwd_dp_rf_pipe3_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe3_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe3_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe3_srcvm_vreg_vr1_data   ),
  .fwd_dp_rf_pipe4_src0_data              (fwd_dp_rf_pipe4_src0_data             ),
  .fwd_dp_rf_pipe4_src0_no_fwd            (fwd_dp_rf_pipe4_src0_no_fwd           ),
  .fwd_dp_rf_pipe4_src1_data              (fwd_dp_rf_pipe4_src1_data             ),
  .fwd_dp_rf_pipe4_src1_no_fwd            (fwd_dp_rf_pipe4_src1_no_fwd           ),
  .fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla (fwd_dp_rf_pipe4_srcvm_no_fwd_expt_vmla),
  .fwd_dp_rf_pipe4_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe4_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe4_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe4_srcvm_vreg_vr1_data   ),
  .fwd_dp_rf_pipe5_src0_data              (fwd_dp_rf_pipe5_src0_data             ),
  .fwd_dp_rf_pipe5_src0_no_fwd            (fwd_dp_rf_pipe5_src0_no_fwd           ),
  .fwd_dp_rf_pipe5_src0_no_fwd_expt_mla   (fwd_dp_rf_pipe5_src0_no_fwd_expt_mla  ),
  .fwd_dp_rf_pipe5_srcv0_no_fwd           (fwd_dp_rf_pipe5_srcv0_no_fwd          ),
  .fwd_dp_rf_pipe5_srcv0_vreg_fr_data     (fwd_dp_rf_pipe5_srcv0_vreg_fr_data    ),
  .fwd_dp_rf_pipe5_srcv0_vreg_vr0_data    (fwd_dp_rf_pipe5_srcv0_vreg_vr0_data   ),
  .fwd_dp_rf_pipe5_srcv0_vreg_vr1_data    (fwd_dp_rf_pipe5_srcv0_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcv0_no_fwd           (fwd_dp_rf_pipe6_srcv0_no_fwd          ),
  .fwd_dp_rf_pipe6_srcv0_vreg_fr_data     (fwd_dp_rf_pipe6_srcv0_vreg_fr_data    ),
  .fwd_dp_rf_pipe6_srcv0_vreg_vr0_data    (fwd_dp_rf_pipe6_srcv0_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcv0_vreg_vr1_data    (fwd_dp_rf_pipe6_srcv0_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcv1_no_fwd           (fwd_dp_rf_pipe6_srcv1_no_fwd          ),
  .fwd_dp_rf_pipe6_srcv1_vreg_fr_data     (fwd_dp_rf_pipe6_srcv1_vreg_fr_data    ),
  .fwd_dp_rf_pipe6_srcv1_vreg_vr0_data    (fwd_dp_rf_pipe6_srcv1_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcv1_vreg_vr1_data    (fwd_dp_rf_pipe6_srcv1_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcv2_no_fwd           (fwd_dp_rf_pipe6_srcv2_no_fwd          ),
  .fwd_dp_rf_pipe6_srcv2_vreg_fr_data     (fwd_dp_rf_pipe6_srcv2_vreg_fr_data    ),
  .fwd_dp_rf_pipe6_srcv2_vreg_vr0_data    (fwd_dp_rf_pipe6_srcv2_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcv2_vreg_vr1_data    (fwd_dp_rf_pipe6_srcv2_vreg_vr1_data   ),
  .fwd_dp_rf_pipe6_srcvm_no_fwd           (fwd_dp_rf_pipe6_srcvm_no_fwd          ),
  .fwd_dp_rf_pipe6_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe6_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe6_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe6_srcvm_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcv0_no_fwd           (fwd_dp_rf_pipe7_srcv0_no_fwd          ),
  .fwd_dp_rf_pipe7_srcv0_vreg_fr_data     (fwd_dp_rf_pipe7_srcv0_vreg_fr_data    ),
  .fwd_dp_rf_pipe7_srcv0_vreg_vr0_data    (fwd_dp_rf_pipe7_srcv0_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcv0_vreg_vr1_data    (fwd_dp_rf_pipe7_srcv0_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcv1_no_fwd           (fwd_dp_rf_pipe7_srcv1_no_fwd          ),
  .fwd_dp_rf_pipe7_srcv1_vreg_fr_data     (fwd_dp_rf_pipe7_srcv1_vreg_fr_data    ),
  .fwd_dp_rf_pipe7_srcv1_vreg_vr0_data    (fwd_dp_rf_pipe7_srcv1_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcv1_vreg_vr1_data    (fwd_dp_rf_pipe7_srcv1_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcv2_no_fwd           (fwd_dp_rf_pipe7_srcv2_no_fwd          ),
  .fwd_dp_rf_pipe7_srcv2_vreg_fr_data     (fwd_dp_rf_pipe7_srcv2_vreg_fr_data    ),
  .fwd_dp_rf_pipe7_srcv2_vreg_vr0_data    (fwd_dp_rf_pipe7_srcv2_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcv2_vreg_vr1_data    (fwd_dp_rf_pipe7_srcv2_vreg_vr1_data   ),
  .fwd_dp_rf_pipe7_srcvm_no_fwd           (fwd_dp_rf_pipe7_srcvm_no_fwd          ),
  .fwd_dp_rf_pipe7_srcvm_vreg_vr0_data    (fwd_dp_rf_pipe7_srcvm_vreg_vr0_data   ),
  .fwd_dp_rf_pipe7_srcvm_vreg_vr1_data    (fwd_dp_rf_pipe7_srcvm_vreg_vr1_data   ),
  .iu_idu_ex1_pipe0_fwd_preg              (iu_idu_ex1_pipe0_fwd_preg             ),
  .iu_idu_ex1_pipe0_fwd_preg_data         (iu_idu_ex1_pipe0_fwd_preg_data        ),
  .iu_idu_ex1_pipe0_fwd_preg_vld          (iu_idu_ex1_pipe0_fwd_preg_vld         ),
  .iu_idu_ex1_pipe1_fwd_preg              (iu_idu_ex1_pipe1_fwd_preg             ),
  .iu_idu_ex1_pipe1_fwd_preg_data         (iu_idu_ex1_pipe1_fwd_preg_data        ),
  .iu_idu_ex1_pipe1_fwd_preg_vld          (iu_idu_ex1_pipe1_fwd_preg_vld         ),
  .iu_idu_ex2_pipe0_wb_preg               (iu_idu_ex2_pipe0_wb_preg              ),
  .iu_idu_ex2_pipe0_wb_preg_data          (iu_idu_ex2_pipe0_wb_preg_data         ),
  .iu_idu_ex2_pipe0_wb_preg_vld           (iu_idu_ex2_pipe0_wb_preg_vld          ),
  .iu_idu_ex2_pipe1_wb_preg               (iu_idu_ex2_pipe1_wb_preg              ),
  .iu_idu_ex2_pipe1_wb_preg_data          (iu_idu_ex2_pipe1_wb_preg_data         ),
  .iu_idu_ex2_pipe1_wb_preg_vld           (iu_idu_ex2_pipe1_wb_preg_vld          ),
  .iu_idu_pipe1_mla_src2_no_fwd           (iu_idu_pipe1_mla_src2_no_fwd          ),
  .lsu_idu_da_pipe3_fwd_preg              (lsu_idu_da_pipe3_fwd_preg             ),
  .lsu_idu_da_pipe3_fwd_preg_data         (lsu_idu_da_pipe3_fwd_preg_data        ),
  .lsu_idu_da_pipe3_fwd_preg_vld          (lsu_idu_da_pipe3_fwd_preg_vld         ),
  .lsu_idu_da_pipe3_fwd_vreg              (lsu_idu_da_pipe3_fwd_vreg             ),
  .lsu_idu_da_pipe3_fwd_vreg_fr_data      (lsu_idu_da_pipe3_fwd_vreg_fr_data     ),
  .lsu_idu_da_pipe3_fwd_vreg_vld          (lsu_idu_da_pipe3_fwd_vreg_vld         ),
  .lsu_idu_da_pipe3_fwd_vreg_vr0_data     (lsu_idu_da_pipe3_fwd_vreg_vr0_data    ),
  .lsu_idu_da_pipe3_fwd_vreg_vr1_data     (lsu_idu_da_pipe3_fwd_vreg_vr1_data    ),
  .lsu_idu_wb_pipe3_fwd_vreg              (lsu_idu_wb_pipe3_fwd_vreg             ),
  .lsu_idu_wb_pipe3_fwd_vreg_vld          (lsu_idu_wb_pipe3_fwd_vreg_vld         ),
  .lsu_idu_wb_pipe3_wb_preg               (lsu_idu_wb_pipe3_wb_preg              ),
  .lsu_idu_wb_pipe3_wb_preg_data          (lsu_idu_wb_pipe3_wb_preg_data         ),
  .lsu_idu_wb_pipe3_wb_preg_vld           (lsu_idu_wb_pipe3_wb_preg_vld          ),
  .lsu_idu_wb_pipe3_wb_vreg_fr_data       (lsu_idu_wb_pipe3_wb_vreg_fr_data      ),
  .lsu_idu_wb_pipe3_wb_vreg_vr0_data      (lsu_idu_wb_pipe3_wb_vreg_vr0_data     ),
  .lsu_idu_wb_pipe3_wb_vreg_vr1_data      (lsu_idu_wb_pipe3_wb_vreg_vr1_data     ),
  .vfpu_idu_ex3_pipe6_fwd_vreg            (vfpu_idu_ex3_pipe6_fwd_vreg           ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_fr_data    (vfpu_idu_ex3_pipe6_fwd_vreg_fr_data   ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vld        (vfpu_idu_ex3_pipe6_fwd_vreg_vld       ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data   (vfpu_idu_ex3_pipe6_fwd_vreg_vr0_data  ),
  .vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data   (vfpu_idu_ex3_pipe6_fwd_vreg_vr1_data  ),
  .vfpu_idu_ex3_pipe7_fwd_vreg            (vfpu_idu_ex3_pipe7_fwd_vreg           ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_fr_data    (vfpu_idu_ex3_pipe7_fwd_vreg_fr_data   ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vld        (vfpu_idu_ex3_pipe7_fwd_vreg_vld       ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data   (vfpu_idu_ex3_pipe7_fwd_vreg_vr0_data  ),
  .vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data   (vfpu_idu_ex3_pipe7_fwd_vreg_vr1_data  ),
  .vfpu_idu_ex4_pipe6_fwd_vreg            (vfpu_idu_ex4_pipe6_fwd_vreg           ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_fr_data    (vfpu_idu_ex4_pipe6_fwd_vreg_fr_data   ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vld        (vfpu_idu_ex4_pipe6_fwd_vreg_vld       ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data   (vfpu_idu_ex4_pipe6_fwd_vreg_vr0_data  ),
  .vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data   (vfpu_idu_ex4_pipe6_fwd_vreg_vr1_data  ),
  .vfpu_idu_ex4_pipe7_fwd_vreg            (vfpu_idu_ex4_pipe7_fwd_vreg           ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_fr_data    (vfpu_idu_ex4_pipe7_fwd_vreg_fr_data   ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vld        (vfpu_idu_ex4_pipe7_fwd_vreg_vld       ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data   (vfpu_idu_ex4_pipe7_fwd_vreg_vr0_data  ),
  .vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data   (vfpu_idu_ex4_pipe7_fwd_vreg_vr1_data  ),
  .vfpu_idu_ex5_pipe6_fwd_vreg            (vfpu_idu_ex5_pipe6_fwd_vreg           ),
  .vfpu_idu_ex5_pipe6_fwd_vreg_vld        (vfpu_idu_ex5_pipe6_fwd_vreg_vld       ),
  .vfpu_idu_ex5_pipe6_wb_vreg_fr_data     (vfpu_idu_ex5_pipe6_wb_vreg_fr_data    ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr0_data    (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data   ),
  .vfpu_idu_ex5_pipe6_wb_vreg_vr1_data    (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data   ),
  .vfpu_idu_ex5_pipe7_fwd_vreg            (vfpu_idu_ex5_pipe7_fwd_vreg           ),
  .vfpu_idu_ex5_pipe7_fwd_vreg_vld        (vfpu_idu_ex5_pipe7_fwd_vreg_vld       ),
  .vfpu_idu_ex5_pipe7_wb_vreg_fr_data     (vfpu_idu_ex5_pipe7_wb_vreg_fr_data    ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr0_data    (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data   ),
  .vfpu_idu_ex5_pipe7_wb_vreg_vr1_data    (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data   ),
  .vfpu_idu_pipe6_vmla_srcv2_no_fwd       (vfpu_idu_pipe6_vmla_srcv2_no_fwd      ),
  .vfpu_idu_pipe7_vmla_srcv2_no_fwd       (vfpu_idu_pipe7_vmla_srcv2_no_fwd      )
);

// &Instance("ct_idu_rf_prf_pregfile", "x_ct_idu_rf_prf_pregfile"); @83
ct_idu_rf_prf_pregfile  x_ct_idu_rf_prf_pregfile (
  .cp0_idu_icg_en                  (cp0_idu_icg_en                 ),
  .cp0_yy_clk_en                   (cp0_yy_clk_en                  ),
  .dp_prf_rf_pipe0_src0_preg       (dp_prf_rf_pipe0_src0_preg      ),
  .dp_prf_rf_pipe0_src1_preg       (dp_prf_rf_pipe0_src1_preg      ),
  .dp_prf_rf_pipe1_src0_preg       (dp_prf_rf_pipe1_src0_preg      ),
  .dp_prf_rf_pipe1_src1_preg       (dp_prf_rf_pipe1_src1_preg      ),
  .dp_prf_rf_pipe2_src0_preg       (dp_prf_rf_pipe2_src0_preg      ),
  .dp_prf_rf_pipe2_src1_preg       (dp_prf_rf_pipe2_src1_preg      ),
  .dp_prf_rf_pipe3_src0_preg       (dp_prf_rf_pipe3_src0_preg      ),
  .dp_prf_rf_pipe3_src1_preg       (dp_prf_rf_pipe3_src1_preg      ),
  .dp_prf_rf_pipe4_src0_preg       (dp_prf_rf_pipe4_src0_preg      ),
  .dp_prf_rf_pipe4_src1_preg       (dp_prf_rf_pipe4_src1_preg      ),
  .dp_prf_rf_pipe5_src0_preg       (dp_prf_rf_pipe5_src0_preg      ),
  .forever_cpuclk                  (forever_cpuclk                 ),
  .idu_had_wb_data                 (idu_had_wb_data                ),
  .idu_had_wb_vld                  (idu_had_wb_vld                 ),
  .iu_idu_ex2_pipe0_wb_preg_data   (iu_idu_ex2_pipe0_wb_preg_data  ),
  .iu_idu_ex2_pipe0_wb_preg_expand (iu_idu_ex2_pipe0_wb_preg_expand),
  .iu_idu_ex2_pipe0_wb_preg_vld    (iu_idu_ex2_pipe0_wb_preg_vld   ),
  .iu_idu_ex2_pipe1_wb_preg_data   (iu_idu_ex2_pipe1_wb_preg_data  ),
  .iu_idu_ex2_pipe1_wb_preg_expand (iu_idu_ex2_pipe1_wb_preg_expand),
  .iu_idu_ex2_pipe1_wb_preg_vld    (iu_idu_ex2_pipe1_wb_preg_vld   ),
  .lsu_idu_wb_pipe3_wb_preg_data   (lsu_idu_wb_pipe3_wb_preg_data  ),
  .lsu_idu_wb_pipe3_wb_preg_expand (lsu_idu_wb_pipe3_wb_preg_expand),
  .lsu_idu_wb_pipe3_wb_preg_vld    (lsu_idu_wb_pipe3_wb_preg_vld   ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             ),
  .prf_dp_rf_pipe0_src0_data       (prf_dp_rf_pipe0_src0_data      ),
  .prf_dp_rf_pipe0_src1_data       (prf_dp_rf_pipe0_src1_data      ),
  .prf_dp_rf_pipe2_src0_data       (prf_dp_rf_pipe2_src0_data      ),
  .prf_dp_rf_pipe2_src1_data       (prf_dp_rf_pipe2_src1_data      ),
  .prf_dp_rf_pipe3_src0_data       (prf_dp_rf_pipe3_src0_data      ),
  .prf_dp_rf_pipe3_src1_data       (prf_dp_rf_pipe3_src1_data      ),
  .prf_dp_rf_pipe4_src0_data       (prf_dp_rf_pipe4_src0_data      ),
  .prf_dp_rf_pipe4_src1_data       (prf_dp_rf_pipe4_src1_data      ),
  .prf_dp_rf_pipe5_src0_data       (prf_dp_rf_pipe5_src0_data      ),
  .prf_xx_rf_pipe1_src0_data       (prf_xx_rf_pipe1_src0_data      ),
  .prf_xx_rf_pipe1_src1_data       (prf_xx_rf_pipe1_src1_data      ),
  .rtu_yy_xx_dbgon                 (rtu_yy_xx_dbgon                )
);

// &Instance("ct_idu_rf_prf_eregfile", "x_ct_idu_rf_prf_eregfile"); @84
ct_idu_rf_prf_eregfile  x_ct_idu_rf_prf_eregfile (
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .idu_cp0_fesr_acc_updt_val            (idu_cp0_fesr_acc_updt_val           ),
  .idu_cp0_fesr_acc_updt_vld            (idu_cp0_fesr_acc_updt_vld           ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .rtu_idu_pst_ereg_retired_released_wb (rtu_idu_pst_ereg_retired_released_wb),
  .rtu_idu_retire0_inst_vld             (rtu_idu_retire0_inst_vld            ),
  .vfpu_idu_ex5_pipe6_wb_ereg           (vfpu_idu_ex5_pipe6_wb_ereg          ),
  .vfpu_idu_ex5_pipe6_wb_ereg_data      (vfpu_idu_ex5_pipe6_wb_ereg_data     ),
  .vfpu_idu_ex5_pipe6_wb_ereg_vld       (vfpu_idu_ex5_pipe6_wb_ereg_vld      ),
  .vfpu_idu_ex5_pipe7_wb_ereg           (vfpu_idu_ex5_pipe7_wb_ereg          ),
  .vfpu_idu_ex5_pipe7_wb_ereg_data      (vfpu_idu_ex5_pipe7_wb_ereg_data     ),
  .vfpu_idu_ex5_pipe7_wb_ereg_vld       (vfpu_idu_ex5_pipe7_wb_ereg_vld      )
);

// &ConnRule(s/vreg/vreg_fr/); @85
// &Instance("ct_idu_rf_prf_fregfile_dummy", "x_ct_idu_rf_prf_vregfile_fr"); @87
// &Instance("ct_idu_rf_prf_fregfile", "x_ct_idu_rf_prf_vregfile_fr"); @89
ct_idu_rf_prf_fregfile  x_ct_idu_rf_prf_vregfile_fr (
  .cp0_idu_icg_en                       (cp0_idu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .dp_prf_rf_pipe5_srcv0_vreg           (dp_prf_rf_pipe5_srcv0_vreg_fr       ),
  .dp_prf_rf_pipe6_srcv0_vreg           (dp_prf_rf_pipe6_srcv0_vreg_fr       ),
  .dp_prf_rf_pipe6_srcv1_vreg           (dp_prf_rf_pipe6_srcv1_vreg_fr       ),
  .dp_prf_rf_pipe6_srcv2_vreg           (dp_prf_rf_pipe6_srcv2_vreg_fr       ),
  .dp_prf_rf_pipe7_srcv0_vreg           (dp_prf_rf_pipe7_srcv0_vreg_fr       ),
  .dp_prf_rf_pipe7_srcv1_vreg           (dp_prf_rf_pipe7_srcv1_vreg_fr       ),
  .dp_prf_rf_pipe7_srcv2_vreg           (dp_prf_rf_pipe7_srcv2_vreg_fr       ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .lsu_idu_wb_pipe3_wb_vreg_data        (lsu_idu_wb_pipe3_wb_vreg_fr_data    ),
  .lsu_idu_wb_pipe3_wb_vreg_expand      (lsu_idu_wb_pipe3_wb_vreg_fr_expand  ),
  .lsu_idu_wb_pipe3_wb_vreg_vld         (lsu_idu_wb_pipe3_wb_vreg_fr_vld     ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .prf_dp_rf_pipe5_srcv0_vreg_data      (prf_dp_rf_pipe5_srcv0_vreg_fr_data  ),
  .prf_dp_rf_pipe6_srcv0_vreg_data      (prf_dp_rf_pipe6_srcv0_vreg_fr_data  ),
  .prf_dp_rf_pipe6_srcv1_vreg_data      (prf_dp_rf_pipe6_srcv1_vreg_fr_data  ),
  .prf_dp_rf_pipe6_srcv2_vreg_data      (prf_dp_rf_pipe6_srcv2_vreg_fr_data  ),
  .prf_dp_rf_pipe7_srcv0_vreg_data      (prf_dp_rf_pipe7_srcv0_vreg_fr_data  ),
  .prf_dp_rf_pipe7_srcv1_vreg_data      (prf_dp_rf_pipe7_srcv1_vreg_fr_data  ),
  .prf_dp_rf_pipe7_srcv2_vreg_data      (prf_dp_rf_pipe7_srcv2_vreg_fr_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data      (vfpu_idu_ex5_pipe6_wb_vreg_fr_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_expand    (vfpu_idu_ex5_pipe6_wb_vreg_fr_expand),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld       (vfpu_idu_ex5_pipe6_wb_vreg_fr_vld   ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data      (vfpu_idu_ex5_pipe7_wb_vreg_fr_data  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_expand    (vfpu_idu_ex5_pipe7_wb_vreg_fr_expand),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld       (vfpu_idu_ex5_pipe7_wb_vreg_fr_vld   )
);

// &ConnRule(s/vreg/vreg_vr0/); @91
// &Instance("ct_idu_rf_prf_vregfile", "x_ct_idu_rf_prf_vregfile_vr0"); @92
ct_idu_rf_prf_vregfile  x_ct_idu_rf_prf_vregfile_vr0 (
  .dp_prf_rf_pipe5_srcv0_vreg            (dp_prf_rf_pipe5_srcv0_vreg_vr0       ),
  .dp_prf_rf_pipe6_srcv0_vreg            (dp_prf_rf_pipe6_srcv0_vreg_vr0       ),
  .dp_prf_rf_pipe6_srcv1_vreg            (dp_prf_rf_pipe6_srcv1_vreg_vr0       ),
  .dp_prf_rf_pipe6_srcv2_vreg            (dp_prf_rf_pipe6_srcv2_vreg_vr0       ),
  .dp_prf_rf_pipe6_srcvm_vreg            (dp_prf_rf_pipe6_srcvm_vreg_vr0       ),
  .dp_prf_rf_pipe7_srcv0_vreg            (dp_prf_rf_pipe7_srcv0_vreg_vr0       ),
  .dp_prf_rf_pipe7_srcv1_vreg            (dp_prf_rf_pipe7_srcv1_vreg_vr0       ),
  .dp_prf_rf_pipe7_srcv2_vreg            (dp_prf_rf_pipe7_srcv2_vreg_vr0       ),
  .dp_prf_rf_pipe7_srcvm_vreg            (dp_prf_rf_pipe7_srcvm_vreg_vr0       ),
  .lsu_idu_wb_pipe3_wb_vreg_data         (lsu_idu_wb_pipe3_wb_vreg_vr0_data    ),
  .lsu_idu_wb_pipe3_wb_vreg_expand       (lsu_idu_wb_pipe3_wb_vreg_vr0_expand  ),
  .lsu_idu_wb_pipe3_wb_vreg_vld          (lsu_idu_wb_pipe3_wb_vreg_vr0_vld     ),
  .prf_dp_rf_pipe5_srcv0_vreg_data       (prf_dp_rf_pipe5_srcv0_vreg_vr0_data  ),
  .prf_dp_rf_pipe6_srcv0_vreg_data       (prf_dp_rf_pipe6_srcv0_vreg_vr0_data  ),
  .prf_dp_rf_pipe6_srcv1_vreg_data       (prf_dp_rf_pipe6_srcv1_vreg_vr0_data  ),
  .prf_dp_rf_pipe6_srcv2_vreg_data       (prf_dp_rf_pipe6_srcv2_vreg_vr0_data  ),
  .prf_dp_rf_pipe6_srcvm_vreg_data       (prf_dp_rf_pipe6_srcvm_vreg_vr0_data  ),
  .prf_dp_rf_pipe7_srcv0_vreg_data       (prf_dp_rf_pipe7_srcv0_vreg_vr0_data  ),
  .prf_dp_rf_pipe7_srcv1_vreg_data       (prf_dp_rf_pipe7_srcv1_vreg_vr0_data  ),
  .prf_dp_rf_pipe7_srcv2_vreg_data       (prf_dp_rf_pipe7_srcv2_vreg_vr0_data  ),
  .prf_dp_rf_pipe7_srcvm_vreg_data       (prf_dp_rf_pipe7_srcvm_vreg_vr0_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data       (vfpu_idu_ex5_pipe6_wb_vreg_vr0_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_expand     (vfpu_idu_ex5_pipe6_wb_vreg_vr0_expand),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld        (vfpu_idu_ex5_pipe6_wb_vreg_vr0_vld   ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data       (vfpu_idu_ex5_pipe7_wb_vreg_vr0_data  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_expand     (vfpu_idu_ex5_pipe7_wb_vreg_vr0_expand),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld        (vfpu_idu_ex5_pipe7_wb_vreg_vr0_vld   )
);

// &ConnRule(s/vreg/vreg_vr1/); @93
// &Instance("ct_idu_rf_prf_vregfile", "x_ct_idu_rf_prf_vregfile_vr1"); @94
ct_idu_rf_prf_vregfile  x_ct_idu_rf_prf_vregfile_vr1 (
  .dp_prf_rf_pipe5_srcv0_vreg            (dp_prf_rf_pipe5_srcv0_vreg_vr1       ),
  .dp_prf_rf_pipe6_srcv0_vreg            (dp_prf_rf_pipe6_srcv0_vreg_vr1       ),
  .dp_prf_rf_pipe6_srcv1_vreg            (dp_prf_rf_pipe6_srcv1_vreg_vr1       ),
  .dp_prf_rf_pipe6_srcv2_vreg            (dp_prf_rf_pipe6_srcv2_vreg_vr1       ),
  .dp_prf_rf_pipe6_srcvm_vreg            (dp_prf_rf_pipe6_srcvm_vreg_vr1       ),
  .dp_prf_rf_pipe7_srcv0_vreg            (dp_prf_rf_pipe7_srcv0_vreg_vr1       ),
  .dp_prf_rf_pipe7_srcv1_vreg            (dp_prf_rf_pipe7_srcv1_vreg_vr1       ),
  .dp_prf_rf_pipe7_srcv2_vreg            (dp_prf_rf_pipe7_srcv2_vreg_vr1       ),
  .dp_prf_rf_pipe7_srcvm_vreg            (dp_prf_rf_pipe7_srcvm_vreg_vr1       ),
  .lsu_idu_wb_pipe3_wb_vreg_data         (lsu_idu_wb_pipe3_wb_vreg_vr1_data    ),
  .lsu_idu_wb_pipe3_wb_vreg_expand       (lsu_idu_wb_pipe3_wb_vreg_vr1_expand  ),
  .lsu_idu_wb_pipe3_wb_vreg_vld          (lsu_idu_wb_pipe3_wb_vreg_vr1_vld     ),
  .prf_dp_rf_pipe5_srcv0_vreg_data       (prf_dp_rf_pipe5_srcv0_vreg_vr1_data  ),
  .prf_dp_rf_pipe6_srcv0_vreg_data       (prf_dp_rf_pipe6_srcv0_vreg_vr1_data  ),
  .prf_dp_rf_pipe6_srcv1_vreg_data       (prf_dp_rf_pipe6_srcv1_vreg_vr1_data  ),
  .prf_dp_rf_pipe6_srcv2_vreg_data       (prf_dp_rf_pipe6_srcv2_vreg_vr1_data  ),
  .prf_dp_rf_pipe6_srcvm_vreg_data       (prf_dp_rf_pipe6_srcvm_vreg_vr1_data  ),
  .prf_dp_rf_pipe7_srcv0_vreg_data       (prf_dp_rf_pipe7_srcv0_vreg_vr1_data  ),
  .prf_dp_rf_pipe7_srcv1_vreg_data       (prf_dp_rf_pipe7_srcv1_vreg_vr1_data  ),
  .prf_dp_rf_pipe7_srcv2_vreg_data       (prf_dp_rf_pipe7_srcv2_vreg_vr1_data  ),
  .prf_dp_rf_pipe7_srcvm_vreg_data       (prf_dp_rf_pipe7_srcvm_vreg_vr1_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_data       (vfpu_idu_ex5_pipe6_wb_vreg_vr1_data  ),
  .vfpu_idu_ex5_pipe6_wb_vreg_expand     (vfpu_idu_ex5_pipe6_wb_vreg_vr1_expand),
  .vfpu_idu_ex5_pipe6_wb_vreg_vld        (vfpu_idu_ex5_pipe6_wb_vreg_vr1_vld   ),
  .vfpu_idu_ex5_pipe7_wb_vreg_data       (vfpu_idu_ex5_pipe7_wb_vreg_vr1_data  ),
  .vfpu_idu_ex5_pipe7_wb_vreg_expand     (vfpu_idu_ex5_pipe7_wb_vreg_vr1_expand),
  .vfpu_idu_ex5_pipe7_wb_vreg_vld        (vfpu_idu_ex5_pipe7_wb_vreg_vr1_vld   )
);


//==========================================================
//                  Debug info for HAD
//==========================================================
assign idu_had_debug_info[0]     = ctrl_top_id_inst0_vld;
assign idu_had_debug_info[1]     = ctrl_top_id_inst1_vld;
assign idu_had_debug_info[2]     = ctrl_top_id_inst2_vld;
assign idu_had_debug_info[5:3]   = fence_top_cur_state[2:0];
assign idu_had_debug_info[6]     = ctrl_top_ir_inst0_vld;
assign idu_had_debug_info[7]     = ctrl_top_ir_inst1_vld;
assign idu_had_debug_info[8]     = ctrl_top_ir_inst2_vld;
assign idu_had_debug_info[9]     = ctrl_top_ir_inst3_vld;
assign idu_had_debug_info[10]    = ctrl_top_ir_preg_not_vld;
assign idu_had_debug_info[11]    = ctrl_top_ir_vreg_not_vld || ctrl_top_ir_freg_not_vld;
assign idu_had_debug_info[12]    = ctrl_top_ir_ereg_not_vld;
assign idu_had_debug_info[13]    = ctrl_top_ir_mispred_stall;
assign idu_had_debug_info[14]    = ctrl_top_is_inst0_vld;
assign idu_had_debug_info[15]    = ctrl_top_is_inst1_vld;
assign idu_had_debug_info[16]    = ctrl_top_is_inst2_vld;
assign idu_had_debug_info[17]    = ctrl_top_is_inst3_vld;
assign idu_had_debug_info[18]    = ctrl_top_is_dis_pipedown2;
assign idu_had_debug_info[19]    = ctrl_top_is_iq_full;
assign idu_had_debug_info[23:20] = aiq0_top_aiq0_entry_cnt[3:0];
assign idu_had_debug_info[27:24] = aiq1_top_aiq1_entry_cnt[3:0];
assign idu_had_debug_info[31:28] = biq_top_biq_entry_cnt[3:0];
assign idu_had_debug_info[35:32] = lsiq_top_lsiq_entry_cnt[3:0];
assign idu_had_debug_info[39:36] = sdiq_top_sdiq_entry_cnt[3:0];
assign idu_had_debug_info[43:40] = viq0_top_viq0_entry_cnt[3:0];
assign idu_had_debug_info[47:44] = viq1_top_viq1_entry_cnt[3:0];
assign idu_had_debug_info[48]    = lsiq_top_frz_entry_vld;
assign idu_had_debug_info[49]    = ctrl_top_is_vmb_full;



// &ModuleEnd; @269
endmodule


