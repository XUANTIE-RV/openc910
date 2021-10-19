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

// &ModuleBeg; @22
module ct_ifu_ibdp(
  cp0_ifu_icg_en,
  cp0_ifu_ras_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ibctrl_ibdp_buf_stall,
  ibctrl_ibdp_bypass_inst_vld,
  ibctrl_ibdp_cancel,
  ibctrl_ibdp_chgflw,
  ibctrl_ibdp_fifo_full_stall,
  ibctrl_ibdp_fifo_stall,
  ibctrl_ibdp_ibuf_inst_vld,
  ibctrl_ibdp_if_chgflw_vld,
  ibctrl_ibdp_ind_btb_rd_stall,
  ibctrl_ibdp_ip_chgflw_vld,
  ibctrl_ibdp_l0_btb_hit,
  ibctrl_ibdp_l0_btb_mispred,
  ibctrl_ibdp_l0_btb_miss,
  ibctrl_ibdp_l0_btb_wait,
  ibctrl_ibdp_lbuf_inst_vld,
  ibctrl_ibdp_mispred_stall,
  ibctrl_ibdp_self_stall,
  ibdp_addrgen_branch_base,
  ibdp_addrgen_branch_offset,
  ibdp_addrgen_branch_result,
  ibdp_addrgen_branch_valid,
  ibdp_addrgen_branch_vl,
  ibdp_addrgen_branch_vlmul,
  ibdp_addrgen_branch_vsew,
  ibdp_addrgen_btb_index_pc,
  ibdp_addrgen_l0_btb_hit,
  ibdp_addrgen_l0_btb_hit_entry,
  ibdp_btb_miss,
  ibdp_debug_inst0_vld,
  ibdp_debug_inst1_vld,
  ibdp_debug_inst2_vld,
  ibdp_debug_mmu_deny_vld,
  ibdp_ibctrl_chgflw_vl,
  ibdp_ibctrl_chgflw_vlmul,
  ibdp_ibctrl_chgflw_vsew,
  ibdp_ibctrl_default_pc,
  ibdp_ibctrl_hn_ind_br,
  ibdp_ibctrl_hn_pcall,
  ibdp_ibctrl_hn_preturn,
  ibdp_ibctrl_l0_btb_mispred_pc,
  ibdp_ibctrl_ras_chgflw_mask,
  ibdp_ibctrl_ras_mistaken,
  ibdp_ibctrl_ras_pc,
  ibdp_ibctrl_vpc,
  ibdp_ibuf_h0_32_start,
  ibdp_ibuf_h0_bkpta,
  ibdp_ibuf_h0_bkptb,
  ibdp_ibuf_h0_data,
  ibdp_ibuf_h0_fence,
  ibdp_ibuf_h0_high_expt,
  ibdp_ibuf_h0_ldst,
  ibdp_ibuf_h0_no_spec,
  ibdp_ibuf_h0_pc,
  ibdp_ibuf_h0_spe_vld,
  ibdp_ibuf_h0_split0,
  ibdp_ibuf_h0_split1,
  ibdp_ibuf_h0_vl,
  ibdp_ibuf_h0_vl_pred,
  ibdp_ibuf_h0_vld,
  ibdp_ibuf_h0_vlmul,
  ibdp_ibuf_h0_vsew,
  ibdp_ibuf_h1_data,
  ibdp_ibuf_h1_pc,
  ibdp_ibuf_h1_vl,
  ibdp_ibuf_h1_vlmul,
  ibdp_ibuf_h1_vsew,
  ibdp_ibuf_h2_data,
  ibdp_ibuf_h2_pc,
  ibdp_ibuf_h2_vl,
  ibdp_ibuf_h2_vlmul,
  ibdp_ibuf_h2_vsew,
  ibdp_ibuf_h3_data,
  ibdp_ibuf_h3_pc,
  ibdp_ibuf_h3_vl,
  ibdp_ibuf_h3_vlmul,
  ibdp_ibuf_h3_vsew,
  ibdp_ibuf_h4_data,
  ibdp_ibuf_h4_pc,
  ibdp_ibuf_h4_vl,
  ibdp_ibuf_h4_vlmul,
  ibdp_ibuf_h4_vsew,
  ibdp_ibuf_h5_data,
  ibdp_ibuf_h5_pc,
  ibdp_ibuf_h5_vl,
  ibdp_ibuf_h5_vlmul,
  ibdp_ibuf_h5_vsew,
  ibdp_ibuf_h6_data,
  ibdp_ibuf_h6_pc,
  ibdp_ibuf_h6_vl,
  ibdp_ibuf_h6_vlmul,
  ibdp_ibuf_h6_vsew,
  ibdp_ibuf_h7_data,
  ibdp_ibuf_h7_pc,
  ibdp_ibuf_h7_vl,
  ibdp_ibuf_h7_vlmul,
  ibdp_ibuf_h7_vsew,
  ibdp_ibuf_h8_data,
  ibdp_ibuf_h8_pc,
  ibdp_ibuf_h8_vl,
  ibdp_ibuf_h8_vlmul,
  ibdp_ibuf_h8_vsew,
  ibdp_ibuf_half_vld_num,
  ibdp_ibuf_hn_32_start,
  ibdp_ibuf_hn_acc_err,
  ibdp_ibuf_hn_acc_err_vld,
  ibdp_ibuf_hn_bkpta,
  ibdp_ibuf_hn_bkpta_vld,
  ibdp_ibuf_hn_bkptb,
  ibdp_ibuf_hn_bkptb_vld,
  ibdp_ibuf_hn_fence,
  ibdp_ibuf_hn_high_expt,
  ibdp_ibuf_hn_ldst,
  ibdp_ibuf_hn_mmu_acc_deny,
  ibdp_ibuf_hn_mmu_acc_deny_vld,
  ibdp_ibuf_hn_no_spec,
  ibdp_ibuf_hn_no_spec_vld,
  ibdp_ibuf_hn_pgflt,
  ibdp_ibuf_hn_pgflt_vld,
  ibdp_ibuf_hn_split0,
  ibdp_ibuf_hn_split1,
  ibdp_ibuf_hn_vl_pred,
  ibdp_ibuf_hn_vld,
  ibdp_l0_btb_fifo_update_vld,
  ibdp_l0_btb_update_cnt_bit,
  ibdp_l0_btb_update_data,
  ibdp_l0_btb_update_entry,
  ibdp_l0_btb_update_ras_bit,
  ibdp_l0_btb_update_vld,
  ibdp_l0_btb_update_vld_bit,
  ibdp_l0_btb_wen,
  ibdp_lbuf_bht_sel_array_result,
  ibdp_lbuf_con_br_cur_pc,
  ibdp_lbuf_con_br_half_num,
  ibdp_lbuf_con_br_inst_32,
  ibdp_lbuf_con_br_offset,
  ibdp_lbuf_con_br_taken,
  ibdp_lbuf_con_br_vl,
  ibdp_lbuf_con_br_vlmul,
  ibdp_lbuf_con_br_vsew,
  ibdp_lbuf_h0_32_start,
  ibdp_lbuf_h0_bkpta,
  ibdp_lbuf_h0_bkptb,
  ibdp_lbuf_h0_con_br,
  ibdp_lbuf_h0_data,
  ibdp_lbuf_h0_fence,
  ibdp_lbuf_h0_split0_type,
  ibdp_lbuf_h0_split1_type,
  ibdp_lbuf_h0_vl,
  ibdp_lbuf_h0_vld,
  ibdp_lbuf_h0_vlmul,
  ibdp_lbuf_h0_vsetvli,
  ibdp_lbuf_h0_vsew,
  ibdp_lbuf_h1_data,
  ibdp_lbuf_h1_split0_type,
  ibdp_lbuf_h1_split1_type,
  ibdp_lbuf_h1_vl,
  ibdp_lbuf_h1_vlmul,
  ibdp_lbuf_h1_vsew,
  ibdp_lbuf_h2_data,
  ibdp_lbuf_h2_split0_type,
  ibdp_lbuf_h2_split1_type,
  ibdp_lbuf_h2_vl,
  ibdp_lbuf_h2_vlmul,
  ibdp_lbuf_h2_vsew,
  ibdp_lbuf_h3_data,
  ibdp_lbuf_h3_split0_type,
  ibdp_lbuf_h3_split1_type,
  ibdp_lbuf_h3_vl,
  ibdp_lbuf_h3_vlmul,
  ibdp_lbuf_h3_vsew,
  ibdp_lbuf_h4_data,
  ibdp_lbuf_h4_split0_type,
  ibdp_lbuf_h4_split1_type,
  ibdp_lbuf_h4_vl,
  ibdp_lbuf_h4_vlmul,
  ibdp_lbuf_h4_vsew,
  ibdp_lbuf_h5_data,
  ibdp_lbuf_h5_split0_type,
  ibdp_lbuf_h5_split1_type,
  ibdp_lbuf_h5_vl,
  ibdp_lbuf_h5_vlmul,
  ibdp_lbuf_h5_vsew,
  ibdp_lbuf_h6_data,
  ibdp_lbuf_h6_split0_type,
  ibdp_lbuf_h6_split1_type,
  ibdp_lbuf_h6_vl,
  ibdp_lbuf_h6_vlmul,
  ibdp_lbuf_h6_vsew,
  ibdp_lbuf_h7_data,
  ibdp_lbuf_h7_split0_type,
  ibdp_lbuf_h7_split1_type,
  ibdp_lbuf_h7_vl,
  ibdp_lbuf_h7_vlmul,
  ibdp_lbuf_h7_vsew,
  ibdp_lbuf_h8_data,
  ibdp_lbuf_h8_split0_type,
  ibdp_lbuf_h8_split1_type,
  ibdp_lbuf_h8_vl,
  ibdp_lbuf_h8_vlmul,
  ibdp_lbuf_h8_vsew,
  ibdp_lbuf_half_vld_num,
  ibdp_lbuf_hn_32_start,
  ibdp_lbuf_hn_auipc,
  ibdp_lbuf_hn_bkpta,
  ibdp_lbuf_hn_bkptb,
  ibdp_lbuf_hn_chgflw,
  ibdp_lbuf_hn_con_br,
  ibdp_lbuf_hn_fence,
  ibdp_lbuf_hn_vld,
  ibdp_lbuf_hn_vsetvli,
  ibdp_pcfifo_if_bht_pre_result,
  ibdp_pcfifo_if_bht_sel_result,
  ibdp_pcfifo_if_h0_cur_pc,
  ibdp_pcfifo_if_h0_vld,
  ibdp_pcfifo_if_h1_cur_pc,
  ibdp_pcfifo_if_h2_cur_pc,
  ibdp_pcfifo_if_h3_cur_pc,
  ibdp_pcfifo_if_h4_cur_pc,
  ibdp_pcfifo_if_h5_cur_pc,
  ibdp_pcfifo_if_h6_cur_pc,
  ibdp_pcfifo_if_h7_cur_pc,
  ibdp_pcfifo_if_h8_cur_pc,
  ibdp_pcfifo_if_hn_con_br,
  ibdp_pcfifo_if_hn_dst_vld,
  ibdp_pcfifo_if_hn_jal,
  ibdp_pcfifo_if_hn_jalr,
  ibdp_pcfifo_if_hn_pc_oper,
  ibdp_pcfifo_if_ind_br_offset,
  ibdp_pcfifo_if_vghr,
  ibdp_ras_push_pc,
  ibuf_ibdp_bypass_inst0,
  ibuf_ibdp_bypass_inst0_bkpta,
  ibuf_ibdp_bypass_inst0_bkptb,
  ibuf_ibdp_bypass_inst0_ecc_err,
  ibuf_ibdp_bypass_inst0_expt,
  ibuf_ibdp_bypass_inst0_fence,
  ibuf_ibdp_bypass_inst0_high_expt,
  ibuf_ibdp_bypass_inst0_no_spec,
  ibuf_ibdp_bypass_inst0_pc,
  ibuf_ibdp_bypass_inst0_split0,
  ibuf_ibdp_bypass_inst0_split1,
  ibuf_ibdp_bypass_inst0_valid,
  ibuf_ibdp_bypass_inst0_vec,
  ibuf_ibdp_bypass_inst0_vl,
  ibuf_ibdp_bypass_inst0_vl_pred,
  ibuf_ibdp_bypass_inst0_vlmul,
  ibuf_ibdp_bypass_inst0_vsew,
  ibuf_ibdp_bypass_inst1,
  ibuf_ibdp_bypass_inst1_bkpta,
  ibuf_ibdp_bypass_inst1_bkptb,
  ibuf_ibdp_bypass_inst1_ecc_err,
  ibuf_ibdp_bypass_inst1_expt,
  ibuf_ibdp_bypass_inst1_fence,
  ibuf_ibdp_bypass_inst1_high_expt,
  ibuf_ibdp_bypass_inst1_no_spec,
  ibuf_ibdp_bypass_inst1_pc,
  ibuf_ibdp_bypass_inst1_split0,
  ibuf_ibdp_bypass_inst1_split1,
  ibuf_ibdp_bypass_inst1_valid,
  ibuf_ibdp_bypass_inst1_vec,
  ibuf_ibdp_bypass_inst1_vl,
  ibuf_ibdp_bypass_inst1_vl_pred,
  ibuf_ibdp_bypass_inst1_vlmul,
  ibuf_ibdp_bypass_inst1_vsew,
  ibuf_ibdp_bypass_inst2,
  ibuf_ibdp_bypass_inst2_bkpta,
  ibuf_ibdp_bypass_inst2_bkptb,
  ibuf_ibdp_bypass_inst2_ecc_err,
  ibuf_ibdp_bypass_inst2_expt,
  ibuf_ibdp_bypass_inst2_fence,
  ibuf_ibdp_bypass_inst2_high_expt,
  ibuf_ibdp_bypass_inst2_no_spec,
  ibuf_ibdp_bypass_inst2_pc,
  ibuf_ibdp_bypass_inst2_split0,
  ibuf_ibdp_bypass_inst2_split1,
  ibuf_ibdp_bypass_inst2_valid,
  ibuf_ibdp_bypass_inst2_vec,
  ibuf_ibdp_bypass_inst2_vl,
  ibuf_ibdp_bypass_inst2_vl_pred,
  ibuf_ibdp_bypass_inst2_vlmul,
  ibuf_ibdp_bypass_inst2_vsew,
  ibuf_ibdp_inst0,
  ibuf_ibdp_inst0_bkpta,
  ibuf_ibdp_inst0_bkptb,
  ibuf_ibdp_inst0_ecc_err,
  ibuf_ibdp_inst0_expt_vld,
  ibuf_ibdp_inst0_fence,
  ibuf_ibdp_inst0_high_expt,
  ibuf_ibdp_inst0_no_spec,
  ibuf_ibdp_inst0_pc,
  ibuf_ibdp_inst0_split0,
  ibuf_ibdp_inst0_split1,
  ibuf_ibdp_inst0_valid,
  ibuf_ibdp_inst0_vec,
  ibuf_ibdp_inst0_vl,
  ibuf_ibdp_inst0_vl_pred,
  ibuf_ibdp_inst0_vlmul,
  ibuf_ibdp_inst0_vsew,
  ibuf_ibdp_inst1,
  ibuf_ibdp_inst1_bkpta,
  ibuf_ibdp_inst1_bkptb,
  ibuf_ibdp_inst1_ecc_err,
  ibuf_ibdp_inst1_expt_vld,
  ibuf_ibdp_inst1_fence,
  ibuf_ibdp_inst1_high_expt,
  ibuf_ibdp_inst1_no_spec,
  ibuf_ibdp_inst1_pc,
  ibuf_ibdp_inst1_split0,
  ibuf_ibdp_inst1_split1,
  ibuf_ibdp_inst1_valid,
  ibuf_ibdp_inst1_vec,
  ibuf_ibdp_inst1_vl,
  ibuf_ibdp_inst1_vl_pred,
  ibuf_ibdp_inst1_vlmul,
  ibuf_ibdp_inst1_vsew,
  ibuf_ibdp_inst2,
  ibuf_ibdp_inst2_bkpta,
  ibuf_ibdp_inst2_bkptb,
  ibuf_ibdp_inst2_ecc_err,
  ibuf_ibdp_inst2_expt_vld,
  ibuf_ibdp_inst2_fence,
  ibuf_ibdp_inst2_high_expt,
  ibuf_ibdp_inst2_no_spec,
  ibuf_ibdp_inst2_pc,
  ibuf_ibdp_inst2_split0,
  ibuf_ibdp_inst2_split1,
  ibuf_ibdp_inst2_valid,
  ibuf_ibdp_inst2_vec,
  ibuf_ibdp_inst2_vl,
  ibuf_ibdp_inst2_vl_pred,
  ibuf_ibdp_inst2_vlmul,
  ibuf_ibdp_inst2_vsew,
  ifu_had_no_inst,
  ifu_idu_ib_inst0_data,
  ifu_idu_ib_inst0_vld,
  ifu_idu_ib_inst1_data,
  ifu_idu_ib_inst1_vld,
  ifu_idu_ib_inst2_data,
  ifu_idu_ib_inst2_vld,
  ipctrl_ibdp_expt_vld,
  ipctrl_ibdp_vld,
  ipdp_ibdp_bht_pre_result,
  ipdp_ibdp_bht_result,
  ipdp_ibdp_bht_sel_result,
  ipdp_ibdp_branch_base,
  ipdp_ibdp_branch_btb_miss,
  ipdp_ibdp_branch_offset,
  ipdp_ibdp_branch_result,
  ipdp_ibdp_branch_vl,
  ipdp_ibdp_branch_vlmul,
  ipdp_ibdp_branch_vsew,
  ipdp_ibdp_branch_way_pred,
  ipdp_ibdp_btb_index_pc,
  ipdp_ibdp_chgflw_mask,
  ipdp_ibdp_chgflw_num,
  ipdp_ibdp_chgflw_num_vld,
  ipdp_ibdp_chgflw_vl,
  ipdp_ibdp_chgflw_vlmul,
  ipdp_ibdp_chgflw_vsew,
  ipdp_ibdp_con_br_cur_pc,
  ipdp_ibdp_con_br_half_num,
  ipdp_ibdp_con_br_inst_32,
  ipdp_ibdp_con_br_num,
  ipdp_ibdp_con_br_num_vld,
  ipdp_ibdp_con_br_offset,
  ipdp_ibdp_h0_bkpta,
  ipdp_ibdp_h0_bkptb,
  ipdp_ibdp_h0_con_br,
  ipdp_ibdp_h0_cur_pc,
  ipdp_ibdp_h0_data,
  ipdp_ibdp_h0_fence,
  ipdp_ibdp_h0_high_expt,
  ipdp_ibdp_h0_ldst,
  ipdp_ibdp_h0_no_spec,
  ipdp_ibdp_h0_spe_vld,
  ipdp_ibdp_h0_split0,
  ipdp_ibdp_h0_split0_type,
  ipdp_ibdp_h0_split1,
  ipdp_ibdp_h0_split1_type,
  ipdp_ibdp_h0_vl,
  ipdp_ibdp_h0_vl_pred,
  ipdp_ibdp_h0_vld,
  ipdp_ibdp_h0_vlmul,
  ipdp_ibdp_h0_vsetvli,
  ipdp_ibdp_h0_vsew,
  ipdp_ibdp_h1_base,
  ipdp_ibdp_h1_data,
  ipdp_ibdp_h1_split0_type,
  ipdp_ibdp_h1_split1_type,
  ipdp_ibdp_h1_vl,
  ipdp_ibdp_h1_vlmul,
  ipdp_ibdp_h1_vsew,
  ipdp_ibdp_h2_base,
  ipdp_ibdp_h2_data,
  ipdp_ibdp_h2_split0_type,
  ipdp_ibdp_h2_split1_type,
  ipdp_ibdp_h2_vl,
  ipdp_ibdp_h2_vlmul,
  ipdp_ibdp_h2_vsew,
  ipdp_ibdp_h3_base,
  ipdp_ibdp_h3_data,
  ipdp_ibdp_h3_split0_type,
  ipdp_ibdp_h3_split1_type,
  ipdp_ibdp_h3_vl,
  ipdp_ibdp_h3_vlmul,
  ipdp_ibdp_h3_vsew,
  ipdp_ibdp_h4_base,
  ipdp_ibdp_h4_data,
  ipdp_ibdp_h4_split0_type,
  ipdp_ibdp_h4_split1_type,
  ipdp_ibdp_h4_vl,
  ipdp_ibdp_h4_vlmul,
  ipdp_ibdp_h4_vsew,
  ipdp_ibdp_h5_base,
  ipdp_ibdp_h5_data,
  ipdp_ibdp_h5_split0_type,
  ipdp_ibdp_h5_split1_type,
  ipdp_ibdp_h5_vl,
  ipdp_ibdp_h5_vlmul,
  ipdp_ibdp_h5_vsew,
  ipdp_ibdp_h6_base,
  ipdp_ibdp_h6_data,
  ipdp_ibdp_h6_split0_type,
  ipdp_ibdp_h6_split1_type,
  ipdp_ibdp_h6_vl,
  ipdp_ibdp_h6_vlmul,
  ipdp_ibdp_h6_vsew,
  ipdp_ibdp_h7_base,
  ipdp_ibdp_h7_data,
  ipdp_ibdp_h7_split0_type,
  ipdp_ibdp_h7_split1_type,
  ipdp_ibdp_h7_vl,
  ipdp_ibdp_h7_vlmul,
  ipdp_ibdp_h7_vsew,
  ipdp_ibdp_h8_base,
  ipdp_ibdp_h8_data,
  ipdp_ibdp_h8_split0_type,
  ipdp_ibdp_h8_split1_type,
  ipdp_ibdp_h8_vl,
  ipdp_ibdp_h8_vlmul,
  ipdp_ibdp_h8_vsew,
  ipdp_ibdp_hn_32_start,
  ipdp_ibdp_hn_ab_br,
  ipdp_ibdp_hn_acc_err,
  ipdp_ibdp_hn_auipc,
  ipdp_ibdp_hn_bkpta,
  ipdp_ibdp_hn_bkpta_vld,
  ipdp_ibdp_hn_bkptb,
  ipdp_ibdp_hn_bkptb_vld,
  ipdp_ibdp_hn_chgflw,
  ipdp_ibdp_hn_con_br,
  ipdp_ibdp_hn_dst_vld,
  ipdp_ibdp_hn_fence,
  ipdp_ibdp_hn_ind_br,
  ipdp_ibdp_hn_jal,
  ipdp_ibdp_hn_jalr,
  ipdp_ibdp_hn_ldst,
  ipdp_ibdp_hn_mmu_acc_deny,
  ipdp_ibdp_hn_no_spec,
  ipdp_ibdp_hn_no_spec_vld,
  ipdp_ibdp_hn_pc_oper,
  ipdp_ibdp_hn_pcall,
  ipdp_ibdp_hn_pgflt,
  ipdp_ibdp_hn_preturn,
  ipdp_ibdp_hn_split0,
  ipdp_ibdp_hn_split1,
  ipdp_ibdp_hn_vl_pred,
  ipdp_ibdp_hn_vld,
  ipdp_ibdp_hn_vsetvli,
  ipdp_ibdp_ind_br_offset,
  ipdp_ibdp_l0_btb_entry_hit,
  ipdp_ibdp_l0_btb_hit,
  ipdp_ibdp_l0_btb_mispred_pc,
  ipdp_ibdp_l0_btb_ras,
  ipdp_ibdp_l0_btb_ras_pc_hit,
  ipdp_ibdp_l0_btb_update_cnt_bit,
  ipdp_ibdp_l0_btb_update_vld,
  ipdp_ibdp_l0_btb_update_vld_bit,
  ipdp_ibdp_l0_btb_wen,
  ipdp_ibdp_no_chgflw_num,
  ipdp_ibdp_ras_push_pc,
  ipdp_ibdp_ras_target_pc,
  ipdp_ibdp_vghr,
  ipdp_ibdp_vpc,
  iu_ifu_pcfifo_full,
  l0_btb_ibdp_entry_fifo,
  l0_btb_update_vld_for_gateclk,
  lbuf_ibdp_inst0,
  lbuf_ibdp_inst0_bkpta,
  lbuf_ibdp_inst0_bkptb,
  lbuf_ibdp_inst0_fence,
  lbuf_ibdp_inst0_pc,
  lbuf_ibdp_inst0_split0,
  lbuf_ibdp_inst0_split1,
  lbuf_ibdp_inst0_valid,
  lbuf_ibdp_inst0_vl,
  lbuf_ibdp_inst0_vlmul,
  lbuf_ibdp_inst0_vsew,
  lbuf_ibdp_inst1,
  lbuf_ibdp_inst1_bkpta,
  lbuf_ibdp_inst1_bkptb,
  lbuf_ibdp_inst1_fence,
  lbuf_ibdp_inst1_pc,
  lbuf_ibdp_inst1_split0,
  lbuf_ibdp_inst1_split1,
  lbuf_ibdp_inst1_valid,
  lbuf_ibdp_inst1_vl,
  lbuf_ibdp_inst1_vlmul,
  lbuf_ibdp_inst1_vsew,
  lbuf_ibdp_inst2,
  lbuf_ibdp_inst2_bkpta,
  lbuf_ibdp_inst2_bkptb,
  lbuf_ibdp_inst2_fence,
  lbuf_ibdp_inst2_pc,
  lbuf_ibdp_inst2_split0,
  lbuf_ibdp_inst2_split1,
  lbuf_ibdp_inst2_valid,
  lbuf_ibdp_inst2_vl,
  lbuf_ibdp_inst2_vlmul,
  lbuf_ibdp_inst2_vsew,
  pad_yy_icg_scan_en,
  pcfifo_if_ibdp_over_mask
);

// &Ports; @23
input           cp0_ifu_icg_en;                  
input           cp0_ifu_ras_en;                  
input           cp0_yy_clk_en;                   
input           cpurst_b;                        
input           forever_cpuclk;                  
input           ibctrl_ibdp_buf_stall;           
input           ibctrl_ibdp_bypass_inst_vld;     
input           ibctrl_ibdp_cancel;              
input           ibctrl_ibdp_chgflw;              
input           ibctrl_ibdp_fifo_full_stall;     
input           ibctrl_ibdp_fifo_stall;          
input           ibctrl_ibdp_ibuf_inst_vld;       
input           ibctrl_ibdp_if_chgflw_vld;       
input           ibctrl_ibdp_ind_btb_rd_stall;    
input           ibctrl_ibdp_ip_chgflw_vld;       
input           ibctrl_ibdp_l0_btb_hit;          
input           ibctrl_ibdp_l0_btb_mispred;      
input           ibctrl_ibdp_l0_btb_miss;         
input           ibctrl_ibdp_l0_btb_wait;         
input           ibctrl_ibdp_lbuf_inst_vld;       
input           ibctrl_ibdp_mispred_stall;       
input           ibctrl_ibdp_self_stall;          
input   [31:0]  ibuf_ibdp_bypass_inst0;          
input           ibuf_ibdp_bypass_inst0_bkpta;    
input           ibuf_ibdp_bypass_inst0_bkptb;    
input           ibuf_ibdp_bypass_inst0_ecc_err;  
input           ibuf_ibdp_bypass_inst0_expt;     
input           ibuf_ibdp_bypass_inst0_fence;    
input           ibuf_ibdp_bypass_inst0_high_expt; 
input           ibuf_ibdp_bypass_inst0_no_spec;  
input   [14:0]  ibuf_ibdp_bypass_inst0_pc;       
input           ibuf_ibdp_bypass_inst0_split0;   
input           ibuf_ibdp_bypass_inst0_split1;   
input           ibuf_ibdp_bypass_inst0_valid;    
input   [3 :0]  ibuf_ibdp_bypass_inst0_vec;      
input   [7 :0]  ibuf_ibdp_bypass_inst0_vl;       
input           ibuf_ibdp_bypass_inst0_vl_pred;  
input   [1 :0]  ibuf_ibdp_bypass_inst0_vlmul;    
input   [2 :0]  ibuf_ibdp_bypass_inst0_vsew;     
input   [31:0]  ibuf_ibdp_bypass_inst1;          
input           ibuf_ibdp_bypass_inst1_bkpta;    
input           ibuf_ibdp_bypass_inst1_bkptb;    
input           ibuf_ibdp_bypass_inst1_ecc_err;  
input           ibuf_ibdp_bypass_inst1_expt;     
input           ibuf_ibdp_bypass_inst1_fence;    
input           ibuf_ibdp_bypass_inst1_high_expt; 
input           ibuf_ibdp_bypass_inst1_no_spec;  
input   [14:0]  ibuf_ibdp_bypass_inst1_pc;       
input           ibuf_ibdp_bypass_inst1_split0;   
input           ibuf_ibdp_bypass_inst1_split1;   
input           ibuf_ibdp_bypass_inst1_valid;    
input   [3 :0]  ibuf_ibdp_bypass_inst1_vec;      
input   [7 :0]  ibuf_ibdp_bypass_inst1_vl;       
input           ibuf_ibdp_bypass_inst1_vl_pred;  
input   [1 :0]  ibuf_ibdp_bypass_inst1_vlmul;    
input   [2 :0]  ibuf_ibdp_bypass_inst1_vsew;     
input   [31:0]  ibuf_ibdp_bypass_inst2;          
input           ibuf_ibdp_bypass_inst2_bkpta;    
input           ibuf_ibdp_bypass_inst2_bkptb;    
input           ibuf_ibdp_bypass_inst2_ecc_err;  
input           ibuf_ibdp_bypass_inst2_expt;     
input           ibuf_ibdp_bypass_inst2_fence;    
input           ibuf_ibdp_bypass_inst2_high_expt; 
input           ibuf_ibdp_bypass_inst2_no_spec;  
input   [14:0]  ibuf_ibdp_bypass_inst2_pc;       
input           ibuf_ibdp_bypass_inst2_split0;   
input           ibuf_ibdp_bypass_inst2_split1;   
input           ibuf_ibdp_bypass_inst2_valid;    
input   [3 :0]  ibuf_ibdp_bypass_inst2_vec;      
input   [7 :0]  ibuf_ibdp_bypass_inst2_vl;       
input           ibuf_ibdp_bypass_inst2_vl_pred;  
input   [1 :0]  ibuf_ibdp_bypass_inst2_vlmul;    
input   [2 :0]  ibuf_ibdp_bypass_inst2_vsew;     
input   [31:0]  ibuf_ibdp_inst0;                 
input           ibuf_ibdp_inst0_bkpta;           
input           ibuf_ibdp_inst0_bkptb;           
input           ibuf_ibdp_inst0_ecc_err;         
input           ibuf_ibdp_inst0_expt_vld;        
input           ibuf_ibdp_inst0_fence;           
input           ibuf_ibdp_inst0_high_expt;       
input           ibuf_ibdp_inst0_no_spec;         
input   [14:0]  ibuf_ibdp_inst0_pc;              
input           ibuf_ibdp_inst0_split0;          
input           ibuf_ibdp_inst0_split1;          
input           ibuf_ibdp_inst0_valid;           
input   [3 :0]  ibuf_ibdp_inst0_vec;             
input   [7 :0]  ibuf_ibdp_inst0_vl;              
input           ibuf_ibdp_inst0_vl_pred;         
input   [1 :0]  ibuf_ibdp_inst0_vlmul;           
input   [2 :0]  ibuf_ibdp_inst0_vsew;            
input   [31:0]  ibuf_ibdp_inst1;                 
input           ibuf_ibdp_inst1_bkpta;           
input           ibuf_ibdp_inst1_bkptb;           
input           ibuf_ibdp_inst1_ecc_err;         
input           ibuf_ibdp_inst1_expt_vld;        
input           ibuf_ibdp_inst1_fence;           
input           ibuf_ibdp_inst1_high_expt;       
input           ibuf_ibdp_inst1_no_spec;         
input   [14:0]  ibuf_ibdp_inst1_pc;              
input           ibuf_ibdp_inst1_split0;          
input           ibuf_ibdp_inst1_split1;          
input           ibuf_ibdp_inst1_valid;           
input   [3 :0]  ibuf_ibdp_inst1_vec;             
input   [7 :0]  ibuf_ibdp_inst1_vl;              
input           ibuf_ibdp_inst1_vl_pred;         
input   [1 :0]  ibuf_ibdp_inst1_vlmul;           
input   [2 :0]  ibuf_ibdp_inst1_vsew;            
input   [31:0]  ibuf_ibdp_inst2;                 
input           ibuf_ibdp_inst2_bkpta;           
input           ibuf_ibdp_inst2_bkptb;           
input           ibuf_ibdp_inst2_ecc_err;         
input           ibuf_ibdp_inst2_expt_vld;        
input           ibuf_ibdp_inst2_fence;           
input           ibuf_ibdp_inst2_high_expt;       
input           ibuf_ibdp_inst2_no_spec;         
input   [14:0]  ibuf_ibdp_inst2_pc;              
input           ibuf_ibdp_inst2_split0;          
input           ibuf_ibdp_inst2_split1;          
input           ibuf_ibdp_inst2_valid;           
input   [3 :0]  ibuf_ibdp_inst2_vec;             
input   [7 :0]  ibuf_ibdp_inst2_vl;              
input           ibuf_ibdp_inst2_vl_pred;         
input   [1 :0]  ibuf_ibdp_inst2_vlmul;           
input   [2 :0]  ibuf_ibdp_inst2_vsew;            
input           ipctrl_ibdp_expt_vld;            
input           ipctrl_ibdp_vld;                 
input   [1 :0]  ipdp_ibdp_bht_pre_result;        
input           ipdp_ibdp_bht_result;            
input   [1 :0]  ipdp_ibdp_bht_sel_result;        
input   [38:0]  ipdp_ibdp_branch_base;           
input           ipdp_ibdp_branch_btb_miss;       
input   [20:0]  ipdp_ibdp_branch_offset;         
input   [38:0]  ipdp_ibdp_branch_result;         
input   [7 :0]  ipdp_ibdp_branch_vl;             
input   [1 :0]  ipdp_ibdp_branch_vlmul;          
input   [2 :0]  ipdp_ibdp_branch_vsew;           
input   [1 :0]  ipdp_ibdp_branch_way_pred;       
input   [38:0]  ipdp_ibdp_btb_index_pc;          
input   [7 :0]  ipdp_ibdp_chgflw_mask;           
input   [3 :0]  ipdp_ibdp_chgflw_num;            
input           ipdp_ibdp_chgflw_num_vld;        
input   [7 :0]  ipdp_ibdp_chgflw_vl;             
input   [1 :0]  ipdp_ibdp_chgflw_vlmul;          
input   [2 :0]  ipdp_ibdp_chgflw_vsew;           
input   [38:0]  ipdp_ibdp_con_br_cur_pc;         
input   [3 :0]  ipdp_ibdp_con_br_half_num;       
input           ipdp_ibdp_con_br_inst_32;        
input   [3 :0]  ipdp_ibdp_con_br_num;            
input           ipdp_ibdp_con_br_num_vld;        
input   [20:0]  ipdp_ibdp_con_br_offset;         
input           ipdp_ibdp_h0_bkpta;              
input           ipdp_ibdp_h0_bkptb;              
input           ipdp_ibdp_h0_con_br;             
input   [35:0]  ipdp_ibdp_h0_cur_pc;             
input   [15:0]  ipdp_ibdp_h0_data;               
input           ipdp_ibdp_h0_fence;              
input           ipdp_ibdp_h0_high_expt;          
input           ipdp_ibdp_h0_ldst;               
input           ipdp_ibdp_h0_no_spec;            
input           ipdp_ibdp_h0_spe_vld;            
input           ipdp_ibdp_h0_split0;             
input   [2 :0]  ipdp_ibdp_h0_split0_type;        
input           ipdp_ibdp_h0_split1;             
input   [2 :0]  ipdp_ibdp_h0_split1_type;        
input   [7 :0]  ipdp_ibdp_h0_vl;                 
input           ipdp_ibdp_h0_vl_pred;            
input           ipdp_ibdp_h0_vld;                
input   [1 :0]  ipdp_ibdp_h0_vlmul;              
input           ipdp_ibdp_h0_vsetvli;            
input   [2 :0]  ipdp_ibdp_h0_vsew;               
input   [2 :0]  ipdp_ibdp_h1_base;               
input   [15:0]  ipdp_ibdp_h1_data;               
input   [2 :0]  ipdp_ibdp_h1_split0_type;        
input   [2 :0]  ipdp_ibdp_h1_split1_type;        
input   [7 :0]  ipdp_ibdp_h1_vl;                 
input   [1 :0]  ipdp_ibdp_h1_vlmul;              
input   [2 :0]  ipdp_ibdp_h1_vsew;               
input   [2 :0]  ipdp_ibdp_h2_base;               
input   [15:0]  ipdp_ibdp_h2_data;               
input   [2 :0]  ipdp_ibdp_h2_split0_type;        
input   [2 :0]  ipdp_ibdp_h2_split1_type;        
input   [7 :0]  ipdp_ibdp_h2_vl;                 
input   [1 :0]  ipdp_ibdp_h2_vlmul;              
input   [2 :0]  ipdp_ibdp_h2_vsew;               
input   [2 :0]  ipdp_ibdp_h3_base;               
input   [15:0]  ipdp_ibdp_h3_data;               
input   [2 :0]  ipdp_ibdp_h3_split0_type;        
input   [2 :0]  ipdp_ibdp_h3_split1_type;        
input   [7 :0]  ipdp_ibdp_h3_vl;                 
input   [1 :0]  ipdp_ibdp_h3_vlmul;              
input   [2 :0]  ipdp_ibdp_h3_vsew;               
input   [2 :0]  ipdp_ibdp_h4_base;               
input   [15:0]  ipdp_ibdp_h4_data;               
input   [2 :0]  ipdp_ibdp_h4_split0_type;        
input   [2 :0]  ipdp_ibdp_h4_split1_type;        
input   [7 :0]  ipdp_ibdp_h4_vl;                 
input   [1 :0]  ipdp_ibdp_h4_vlmul;              
input   [2 :0]  ipdp_ibdp_h4_vsew;               
input   [2 :0]  ipdp_ibdp_h5_base;               
input   [15:0]  ipdp_ibdp_h5_data;               
input   [2 :0]  ipdp_ibdp_h5_split0_type;        
input   [2 :0]  ipdp_ibdp_h5_split1_type;        
input   [7 :0]  ipdp_ibdp_h5_vl;                 
input   [1 :0]  ipdp_ibdp_h5_vlmul;              
input   [2 :0]  ipdp_ibdp_h5_vsew;               
input   [2 :0]  ipdp_ibdp_h6_base;               
input   [15:0]  ipdp_ibdp_h6_data;               
input   [2 :0]  ipdp_ibdp_h6_split0_type;        
input   [2 :0]  ipdp_ibdp_h6_split1_type;        
input   [7 :0]  ipdp_ibdp_h6_vl;                 
input   [1 :0]  ipdp_ibdp_h6_vlmul;              
input   [2 :0]  ipdp_ibdp_h6_vsew;               
input   [2 :0]  ipdp_ibdp_h7_base;               
input   [15:0]  ipdp_ibdp_h7_data;               
input   [2 :0]  ipdp_ibdp_h7_split0_type;        
input   [2 :0]  ipdp_ibdp_h7_split1_type;        
input   [7 :0]  ipdp_ibdp_h7_vl;                 
input   [1 :0]  ipdp_ibdp_h7_vlmul;              
input   [2 :0]  ipdp_ibdp_h7_vsew;               
input   [2 :0]  ipdp_ibdp_h8_base;               
input   [15:0]  ipdp_ibdp_h8_data;               
input   [2 :0]  ipdp_ibdp_h8_split0_type;        
input   [2 :0]  ipdp_ibdp_h8_split1_type;        
input   [7 :0]  ipdp_ibdp_h8_vl;                 
input   [1 :0]  ipdp_ibdp_h8_vlmul;              
input   [2 :0]  ipdp_ibdp_h8_vsew;               
input   [7 :0]  ipdp_ibdp_hn_32_start;           
input   [7 :0]  ipdp_ibdp_hn_ab_br;              
input           ipdp_ibdp_hn_acc_err;            
input   [7 :0]  ipdp_ibdp_hn_auipc;              
input   [7 :0]  ipdp_ibdp_hn_bkpta;              
input           ipdp_ibdp_hn_bkpta_vld;          
input   [7 :0]  ipdp_ibdp_hn_bkptb;              
input           ipdp_ibdp_hn_bkptb_vld;          
input   [7 :0]  ipdp_ibdp_hn_chgflw;             
input   [7 :0]  ipdp_ibdp_hn_con_br;             
input   [7 :0]  ipdp_ibdp_hn_dst_vld;            
input   [7 :0]  ipdp_ibdp_hn_fence;              
input   [7 :0]  ipdp_ibdp_hn_ind_br;             
input   [7 :0]  ipdp_ibdp_hn_jal;                
input   [7 :0]  ipdp_ibdp_hn_jalr;               
input   [7 :0]  ipdp_ibdp_hn_ldst;               
input           ipdp_ibdp_hn_mmu_acc_deny;       
input   [7 :0]  ipdp_ibdp_hn_no_spec;            
input           ipdp_ibdp_hn_no_spec_vld;        
input   [7 :0]  ipdp_ibdp_hn_pc_oper;            
input   [7 :0]  ipdp_ibdp_hn_pcall;              
input           ipdp_ibdp_hn_pgflt;              
input   [7 :0]  ipdp_ibdp_hn_preturn;            
input   [7 :0]  ipdp_ibdp_hn_split0;             
input   [7 :0]  ipdp_ibdp_hn_split1;             
input   [7 :0]  ipdp_ibdp_hn_vl_pred;            
input   [7 :0]  ipdp_ibdp_hn_vld;                
input   [7 :0]  ipdp_ibdp_hn_vsetvli;            
input   [20:0]  ipdp_ibdp_ind_br_offset;         
input   [15:0]  ipdp_ibdp_l0_btb_entry_hit;      
input           ipdp_ibdp_l0_btb_hit;            
input   [38:0]  ipdp_ibdp_l0_btb_mispred_pc;     
input           ipdp_ibdp_l0_btb_ras;            
input           ipdp_ibdp_l0_btb_ras_pc_hit;     
input           ipdp_ibdp_l0_btb_update_cnt_bit; 
input           ipdp_ibdp_l0_btb_update_vld;     
input           ipdp_ibdp_l0_btb_update_vld_bit; 
input   [3 :0]  ipdp_ibdp_l0_btb_wen;            
input   [3 :0]  ipdp_ibdp_no_chgflw_num;         
input   [38:0]  ipdp_ibdp_ras_push_pc;           
input   [38:0]  ipdp_ibdp_ras_target_pc;         
input   [21:0]  ipdp_ibdp_vghr;                  
input   [38:0]  ipdp_ibdp_vpc;                   
input           iu_ifu_pcfifo_full;              
input   [15:0]  l0_btb_ibdp_entry_fifo;          
input   [31:0]  lbuf_ibdp_inst0;                 
input           lbuf_ibdp_inst0_bkpta;           
input           lbuf_ibdp_inst0_bkptb;           
input           lbuf_ibdp_inst0_fence;           
input   [14:0]  lbuf_ibdp_inst0_pc;              
input           lbuf_ibdp_inst0_split0;          
input           lbuf_ibdp_inst0_split1;          
input           lbuf_ibdp_inst0_valid;           
input   [7 :0]  lbuf_ibdp_inst0_vl;              
input   [1 :0]  lbuf_ibdp_inst0_vlmul;           
input   [2 :0]  lbuf_ibdp_inst0_vsew;            
input   [31:0]  lbuf_ibdp_inst1;                 
input           lbuf_ibdp_inst1_bkpta;           
input           lbuf_ibdp_inst1_bkptb;           
input           lbuf_ibdp_inst1_fence;           
input   [14:0]  lbuf_ibdp_inst1_pc;              
input           lbuf_ibdp_inst1_split0;          
input           lbuf_ibdp_inst1_split1;          
input           lbuf_ibdp_inst1_valid;           
input   [7 :0]  lbuf_ibdp_inst1_vl;              
input   [1 :0]  lbuf_ibdp_inst1_vlmul;           
input   [2 :0]  lbuf_ibdp_inst1_vsew;            
input   [31:0]  lbuf_ibdp_inst2;                 
input           lbuf_ibdp_inst2_bkpta;           
input           lbuf_ibdp_inst2_bkptb;           
input           lbuf_ibdp_inst2_fence;           
input   [14:0]  lbuf_ibdp_inst2_pc;              
input           lbuf_ibdp_inst2_split0;          
input           lbuf_ibdp_inst2_split1;          
input           lbuf_ibdp_inst2_valid;           
input   [7 :0]  lbuf_ibdp_inst2_vl;              
input   [1 :0]  lbuf_ibdp_inst2_vlmul;           
input   [2 :0]  lbuf_ibdp_inst2_vsew;            
input           pad_yy_icg_scan_en;              
input   [7 :0]  pcfifo_if_ibdp_over_mask;        
output  [38:0]  ibdp_addrgen_branch_base;        
output  [20:0]  ibdp_addrgen_branch_offset;      
output  [38:0]  ibdp_addrgen_branch_result;      
output          ibdp_addrgen_branch_valid;       
output  [7 :0]  ibdp_addrgen_branch_vl;          
output  [1 :0]  ibdp_addrgen_branch_vlmul;       
output  [2 :0]  ibdp_addrgen_branch_vsew;        
output  [38:0]  ibdp_addrgen_btb_index_pc;       
output          ibdp_addrgen_l0_btb_hit;         
output  [15:0]  ibdp_addrgen_l0_btb_hit_entry;   
output          ibdp_btb_miss;                   
output          ibdp_debug_inst0_vld;            
output          ibdp_debug_inst1_vld;            
output          ibdp_debug_inst2_vld;            
output          ibdp_debug_mmu_deny_vld;         
output  [7 :0]  ibdp_ibctrl_chgflw_vl;           
output  [1 :0]  ibdp_ibctrl_chgflw_vlmul;        
output  [2 :0]  ibdp_ibctrl_chgflw_vsew;         
output  [38:0]  ibdp_ibctrl_default_pc;          
output  [7 :0]  ibdp_ibctrl_hn_ind_br;           
output  [7 :0]  ibdp_ibctrl_hn_pcall;            
output  [7 :0]  ibdp_ibctrl_hn_preturn;          
output  [38:0]  ibdp_ibctrl_l0_btb_mispred_pc;   
output          ibdp_ibctrl_ras_chgflw_mask;     
output          ibdp_ibctrl_ras_mistaken;        
output  [38:0]  ibdp_ibctrl_ras_pc;              
output  [38:0]  ibdp_ibctrl_vpc;                 
output          ibdp_ibuf_h0_32_start;           
output          ibdp_ibuf_h0_bkpta;              
output          ibdp_ibuf_h0_bkptb;              
output  [15:0]  ibdp_ibuf_h0_data;               
output          ibdp_ibuf_h0_fence;              
output          ibdp_ibuf_h0_high_expt;          
output          ibdp_ibuf_h0_ldst;               
output          ibdp_ibuf_h0_no_spec;            
output  [14:0]  ibdp_ibuf_h0_pc;                 
output          ibdp_ibuf_h0_spe_vld;            
output          ibdp_ibuf_h0_split0;             
output          ibdp_ibuf_h0_split1;             
output  [7 :0]  ibdp_ibuf_h0_vl;                 
output          ibdp_ibuf_h0_vl_pred;            
output          ibdp_ibuf_h0_vld;                
output  [1 :0]  ibdp_ibuf_h0_vlmul;              
output  [2 :0]  ibdp_ibuf_h0_vsew;               
output  [15:0]  ibdp_ibuf_h1_data;               
output  [14:0]  ibdp_ibuf_h1_pc;                 
output  [7 :0]  ibdp_ibuf_h1_vl;                 
output  [1 :0]  ibdp_ibuf_h1_vlmul;              
output  [2 :0]  ibdp_ibuf_h1_vsew;               
output  [15:0]  ibdp_ibuf_h2_data;               
output  [14:0]  ibdp_ibuf_h2_pc;                 
output  [7 :0]  ibdp_ibuf_h2_vl;                 
output  [1 :0]  ibdp_ibuf_h2_vlmul;              
output  [2 :0]  ibdp_ibuf_h2_vsew;               
output  [15:0]  ibdp_ibuf_h3_data;               
output  [14:0]  ibdp_ibuf_h3_pc;                 
output  [7 :0]  ibdp_ibuf_h3_vl;                 
output  [1 :0]  ibdp_ibuf_h3_vlmul;              
output  [2 :0]  ibdp_ibuf_h3_vsew;               
output  [15:0]  ibdp_ibuf_h4_data;               
output  [14:0]  ibdp_ibuf_h4_pc;                 
output  [7 :0]  ibdp_ibuf_h4_vl;                 
output  [1 :0]  ibdp_ibuf_h4_vlmul;              
output  [2 :0]  ibdp_ibuf_h4_vsew;               
output  [15:0]  ibdp_ibuf_h5_data;               
output  [14:0]  ibdp_ibuf_h5_pc;                 
output  [7 :0]  ibdp_ibuf_h5_vl;                 
output  [1 :0]  ibdp_ibuf_h5_vlmul;              
output  [2 :0]  ibdp_ibuf_h5_vsew;               
output  [15:0]  ibdp_ibuf_h6_data;               
output  [14:0]  ibdp_ibuf_h6_pc;                 
output  [7 :0]  ibdp_ibuf_h6_vl;                 
output  [1 :0]  ibdp_ibuf_h6_vlmul;              
output  [2 :0]  ibdp_ibuf_h6_vsew;               
output  [15:0]  ibdp_ibuf_h7_data;               
output  [14:0]  ibdp_ibuf_h7_pc;                 
output  [7 :0]  ibdp_ibuf_h7_vl;                 
output  [1 :0]  ibdp_ibuf_h7_vlmul;              
output  [2 :0]  ibdp_ibuf_h7_vsew;               
output  [15:0]  ibdp_ibuf_h8_data;               
output  [14:0]  ibdp_ibuf_h8_pc;                 
output  [7 :0]  ibdp_ibuf_h8_vl;                 
output  [1 :0]  ibdp_ibuf_h8_vlmul;              
output  [2 :0]  ibdp_ibuf_h8_vsew;               
output  [3 :0]  ibdp_ibuf_half_vld_num;          
output  [7 :0]  ibdp_ibuf_hn_32_start;           
output  [7 :0]  ibdp_ibuf_hn_acc_err;            
output          ibdp_ibuf_hn_acc_err_vld;        
output  [7 :0]  ibdp_ibuf_hn_bkpta;              
output          ibdp_ibuf_hn_bkpta_vld;          
output  [7 :0]  ibdp_ibuf_hn_bkptb;              
output          ibdp_ibuf_hn_bkptb_vld;          
output  [7 :0]  ibdp_ibuf_hn_fence;              
output  [7 :0]  ibdp_ibuf_hn_high_expt;          
output  [7 :0]  ibdp_ibuf_hn_ldst;               
output  [7 :0]  ibdp_ibuf_hn_mmu_acc_deny;       
output          ibdp_ibuf_hn_mmu_acc_deny_vld;   
output  [7 :0]  ibdp_ibuf_hn_no_spec;            
output          ibdp_ibuf_hn_no_spec_vld;        
output  [7 :0]  ibdp_ibuf_hn_pgflt;              
output          ibdp_ibuf_hn_pgflt_vld;          
output  [7 :0]  ibdp_ibuf_hn_split0;             
output  [7 :0]  ibdp_ibuf_hn_split1;             
output  [7 :0]  ibdp_ibuf_hn_vl_pred;            
output  [7 :0]  ibdp_ibuf_hn_vld;                
output          ibdp_l0_btb_fifo_update_vld;     
output          ibdp_l0_btb_update_cnt_bit;      
output  [36:0]  ibdp_l0_btb_update_data;         
output  [15:0]  ibdp_l0_btb_update_entry;        
output          ibdp_l0_btb_update_ras_bit;      
output          ibdp_l0_btb_update_vld;          
output          ibdp_l0_btb_update_vld_bit;      
output  [3 :0]  ibdp_l0_btb_wen;                 
output  [1 :0]  ibdp_lbuf_bht_sel_array_result;  
output  [38:0]  ibdp_lbuf_con_br_cur_pc;         
output  [3 :0]  ibdp_lbuf_con_br_half_num;       
output          ibdp_lbuf_con_br_inst_32;        
output  [20:0]  ibdp_lbuf_con_br_offset;         
output          ibdp_lbuf_con_br_taken;          
output  [7 :0]  ibdp_lbuf_con_br_vl;             
output  [1 :0]  ibdp_lbuf_con_br_vlmul;          
output  [2 :0]  ibdp_lbuf_con_br_vsew;           
output          ibdp_lbuf_h0_32_start;           
output          ibdp_lbuf_h0_bkpta;              
output          ibdp_lbuf_h0_bkptb;              
output          ibdp_lbuf_h0_con_br;             
output  [15:0]  ibdp_lbuf_h0_data;               
output          ibdp_lbuf_h0_fence;              
output  [2 :0]  ibdp_lbuf_h0_split0_type;        
output  [2 :0]  ibdp_lbuf_h0_split1_type;        
output  [7 :0]  ibdp_lbuf_h0_vl;                 
output          ibdp_lbuf_h0_vld;                
output  [1 :0]  ibdp_lbuf_h0_vlmul;              
output          ibdp_lbuf_h0_vsetvli;            
output  [2 :0]  ibdp_lbuf_h0_vsew;               
output  [15:0]  ibdp_lbuf_h1_data;               
output  [2 :0]  ibdp_lbuf_h1_split0_type;        
output  [2 :0]  ibdp_lbuf_h1_split1_type;        
output  [7 :0]  ibdp_lbuf_h1_vl;                 
output  [1 :0]  ibdp_lbuf_h1_vlmul;              
output  [2 :0]  ibdp_lbuf_h1_vsew;               
output  [15:0]  ibdp_lbuf_h2_data;               
output  [2 :0]  ibdp_lbuf_h2_split0_type;        
output  [2 :0]  ibdp_lbuf_h2_split1_type;        
output  [7 :0]  ibdp_lbuf_h2_vl;                 
output  [1 :0]  ibdp_lbuf_h2_vlmul;              
output  [2 :0]  ibdp_lbuf_h2_vsew;               
output  [15:0]  ibdp_lbuf_h3_data;               
output  [2 :0]  ibdp_lbuf_h3_split0_type;        
output  [2 :0]  ibdp_lbuf_h3_split1_type;        
output  [7 :0]  ibdp_lbuf_h3_vl;                 
output  [1 :0]  ibdp_lbuf_h3_vlmul;              
output  [2 :0]  ibdp_lbuf_h3_vsew;               
output  [15:0]  ibdp_lbuf_h4_data;               
output  [2 :0]  ibdp_lbuf_h4_split0_type;        
output  [2 :0]  ibdp_lbuf_h4_split1_type;        
output  [7 :0]  ibdp_lbuf_h4_vl;                 
output  [1 :0]  ibdp_lbuf_h4_vlmul;              
output  [2 :0]  ibdp_lbuf_h4_vsew;               
output  [15:0]  ibdp_lbuf_h5_data;               
output  [2 :0]  ibdp_lbuf_h5_split0_type;        
output  [2 :0]  ibdp_lbuf_h5_split1_type;        
output  [7 :0]  ibdp_lbuf_h5_vl;                 
output  [1 :0]  ibdp_lbuf_h5_vlmul;              
output  [2 :0]  ibdp_lbuf_h5_vsew;               
output  [15:0]  ibdp_lbuf_h6_data;               
output  [2 :0]  ibdp_lbuf_h6_split0_type;        
output  [2 :0]  ibdp_lbuf_h6_split1_type;        
output  [7 :0]  ibdp_lbuf_h6_vl;                 
output  [1 :0]  ibdp_lbuf_h6_vlmul;              
output  [2 :0]  ibdp_lbuf_h6_vsew;               
output  [15:0]  ibdp_lbuf_h7_data;               
output  [2 :0]  ibdp_lbuf_h7_split0_type;        
output  [2 :0]  ibdp_lbuf_h7_split1_type;        
output  [7 :0]  ibdp_lbuf_h7_vl;                 
output  [1 :0]  ibdp_lbuf_h7_vlmul;              
output  [2 :0]  ibdp_lbuf_h7_vsew;               
output  [15:0]  ibdp_lbuf_h8_data;               
output  [2 :0]  ibdp_lbuf_h8_split0_type;        
output  [2 :0]  ibdp_lbuf_h8_split1_type;        
output  [7 :0]  ibdp_lbuf_h8_vl;                 
output  [1 :0]  ibdp_lbuf_h8_vlmul;              
output  [2 :0]  ibdp_lbuf_h8_vsew;               
output  [3 :0]  ibdp_lbuf_half_vld_num;          
output  [7 :0]  ibdp_lbuf_hn_32_start;           
output  [7 :0]  ibdp_lbuf_hn_auipc;              
output  [7 :0]  ibdp_lbuf_hn_bkpta;              
output  [7 :0]  ibdp_lbuf_hn_bkptb;              
output  [7 :0]  ibdp_lbuf_hn_chgflw;             
output  [7 :0]  ibdp_lbuf_hn_con_br;             
output  [7 :0]  ibdp_lbuf_hn_fence;              
output  [7 :0]  ibdp_lbuf_hn_vld;                
output  [7 :0]  ibdp_lbuf_hn_vsetvli;            
output  [1 :0]  ibdp_pcfifo_if_bht_pre_result;   
output  [1 :0]  ibdp_pcfifo_if_bht_sel_result;   
output  [38:0]  ibdp_pcfifo_if_h0_cur_pc;        
output          ibdp_pcfifo_if_h0_vld;           
output  [38:0]  ibdp_pcfifo_if_h1_cur_pc;        
output  [38:0]  ibdp_pcfifo_if_h2_cur_pc;        
output  [38:0]  ibdp_pcfifo_if_h3_cur_pc;        
output  [38:0]  ibdp_pcfifo_if_h4_cur_pc;        
output  [38:0]  ibdp_pcfifo_if_h5_cur_pc;        
output  [38:0]  ibdp_pcfifo_if_h6_cur_pc;        
output  [38:0]  ibdp_pcfifo_if_h7_cur_pc;        
output  [38:0]  ibdp_pcfifo_if_h8_cur_pc;        
output  [7 :0]  ibdp_pcfifo_if_hn_con_br;        
output  [7 :0]  ibdp_pcfifo_if_hn_dst_vld;       
output  [7 :0]  ibdp_pcfifo_if_hn_jal;           
output  [7 :0]  ibdp_pcfifo_if_hn_jalr;          
output  [7 :0]  ibdp_pcfifo_if_hn_pc_oper;       
output  [20:0]  ibdp_pcfifo_if_ind_br_offset;    
output  [21:0]  ibdp_pcfifo_if_vghr;             
output  [38:0]  ibdp_ras_push_pc;                
output          ifu_had_no_inst;                 
output  [72:0]  ifu_idu_ib_inst0_data;           
output          ifu_idu_ib_inst0_vld;            
output  [72:0]  ifu_idu_ib_inst1_data;           
output          ifu_idu_ib_inst1_vld;            
output  [72:0]  ifu_idu_ib_inst2_data;           
output          ifu_idu_ib_inst2_vld;            
output          l0_btb_update_vld_for_gateclk;   

// &Regs; @24
reg     [7 :0]  hn_pc_oper_updt_val;             
reg     [31:0]  inst0;                           
reg             inst0_bkpta;                     
reg             inst0_bkptb;                     
reg             inst0_ecc_err;                   
reg             inst0_expt_vld;                  
reg             inst0_fence;                     
reg             inst0_high_expt;                 
reg             inst0_no_spec;                   
reg     [14:0]  inst0_pc;                        
reg             inst0_split0;                    
reg             inst0_split1;                    
reg     [3 :0]  inst0_vec;                       
reg     [7 :0]  inst0_vl;                        
reg             inst0_vl_pred;                   
reg             inst0_vld;                       
reg     [1 :0]  inst0_vlmul;                     
reg     [2 :0]  inst0_vsew;                      
reg     [31:0]  inst1;                           
reg             inst1_bkpta;                     
reg             inst1_bkptb;                     
reg             inst1_ecc_err;                   
reg             inst1_expt_vld;                  
reg             inst1_fence;                     
reg             inst1_high_expt;                 
reg             inst1_no_spec;                   
reg     [14:0]  inst1_pc;                        
reg             inst1_split0;                    
reg             inst1_split1;                    
reg     [3 :0]  inst1_vec;                       
reg     [7 :0]  inst1_vl;                        
reg             inst1_vl_pred;                   
reg             inst1_vld;                       
reg     [1 :0]  inst1_vlmul;                     
reg     [2 :0]  inst1_vsew;                      
reg     [31:0]  inst2;                           
reg             inst2_bkpta;                     
reg             inst2_bkptb;                     
reg             inst2_ecc_err;                   
reg             inst2_expt_vld;                  
reg             inst2_fence;                     
reg             inst2_high_expt;                 
reg             inst2_no_spec;                   
reg     [14:0]  inst2_pc;                        
reg             inst2_split0;                    
reg             inst2_split1;                    
reg     [3 :0]  inst2_vec;                       
reg     [7 :0]  inst2_vl;                        
reg             inst2_vl_pred;                   
reg             inst2_vld;                       
reg     [1 :0]  inst2_vlmul;                     
reg     [2 :0]  inst2_vsew;                      
reg             l0_btb_update_cnt_bit;           
reg     [36:0]  l0_btb_update_data;              
reg             l0_btb_update_ras_bit;           
reg             l0_btb_update_vld_bit;           
reg     [3 :0]  l0_btb_wen;                      
reg             pc_oper_updt_vld;                

// &Wires; @25
wire            buf_stall;                       
wire            bypass_inst_vld;                 
wire    [7 :0]  chgflw_mask;                     
wire            cp0_ifu_icg_en;                  
wire            cp0_ifu_ras_en;                  
wire            cp0_yy_clk_en;                   
wire            cpurst_b;                        
wire            fifo_full_stall;                 
wire            fifo_mask_clk;                   
wire            fifo_mask_clk_en;                
wire            fifo_stall;                      
wire            forever_cpuclk;                  
wire    [7 :0]  hn_pc_oper_updt_val_pre;         
wire            ib_data_vld;                     
wire            ibctrl_ibdp_buf_stall;           
wire            ibctrl_ibdp_bypass_inst_vld;     
wire            ibctrl_ibdp_cancel;              
wire            ibctrl_ibdp_chgflw;              
wire            ibctrl_ibdp_fifo_full_stall;     
wire            ibctrl_ibdp_fifo_stall;          
wire            ibctrl_ibdp_ibuf_inst_vld;       
wire            ibctrl_ibdp_if_chgflw_vld;       
wire            ibctrl_ibdp_ind_btb_rd_stall;    
wire            ibctrl_ibdp_ip_chgflw_vld;       
wire            ibctrl_ibdp_l0_btb_hit;          
wire            ibctrl_ibdp_l0_btb_mispred;      
wire            ibctrl_ibdp_l0_btb_miss;         
wire            ibctrl_ibdp_l0_btb_wait;         
wire            ibctrl_ibdp_lbuf_inst_vld;       
wire            ibctrl_ibdp_mispred_stall;       
wire            ibctrl_ibdp_self_stall;          
wire    [38:0]  ibdp_addrgen_branch_base;        
wire    [20:0]  ibdp_addrgen_branch_offset;      
wire    [38:0]  ibdp_addrgen_branch_result;      
wire            ibdp_addrgen_branch_valid;       
wire    [7 :0]  ibdp_addrgen_branch_vl;          
wire    [1 :0]  ibdp_addrgen_branch_vlmul;       
wire    [2 :0]  ibdp_addrgen_branch_vsew;        
wire    [38:0]  ibdp_addrgen_btb_index_pc;       
wire            ibdp_addrgen_l0_btb_hit;         
wire    [15:0]  ibdp_addrgen_l0_btb_hit_entry;   
wire    [1 :0]  ibdp_bht_pre_result;             
wire            ibdp_bht_result;                 
wire    [1 :0]  ibdp_bht_sel_result;             
wire            ibdp_btb_miss;                   
wire    [38:0]  ibdp_con_br_cur_pc;              
wire    [3 :0]  ibdp_con_br_half_num;            
wire            ibdp_con_br_inst_32;             
wire    [20:0]  ibdp_con_br_offset;              
wire            ibdp_debug_inst0_vld;            
wire            ibdp_debug_inst1_vld;            
wire            ibdp_debug_inst2_vld;            
wire            ibdp_debug_mmu_deny_vld;         
wire            ibdp_h0_32_start;                
wire            ibdp_h0_bkpta;                   
wire            ibdp_h0_bkptb;                   
wire            ibdp_h0_con_br;                  
wire    [38:0]  ibdp_h0_cur_pc;                  
wire    [15:0]  ibdp_h0_data;                    
wire            ibdp_h0_fence;                   
wire            ibdp_h0_high_expt;               
wire            ibdp_h0_no_spec;                 
wire            ibdp_h0_spe_vld;                 
wire            ibdp_h0_split0;                  
wire    [2 :0]  ibdp_h0_split0_type;             
wire            ibdp_h0_split1;                  
wire    [2 :0]  ibdp_h0_split1_type;             
wire    [7 :0]  ibdp_h0_vl;                      
wire            ibdp_h0_vl_pred;                 
wire            ibdp_h0_vld;                     
wire    [1 :0]  ibdp_h0_vlmul;                   
wire            ibdp_h0_vsetvli;                 
wire    [2 :0]  ibdp_h0_vsew;                    
wire    [38:0]  ibdp_h1_cur_pc;                  
wire    [15:0]  ibdp_h1_data;                    
wire    [2 :0]  ibdp_h1_split0_type;             
wire    [2 :0]  ibdp_h1_split1_type;             
wire    [7 :0]  ibdp_h1_vl;                      
wire    [1 :0]  ibdp_h1_vlmul;                   
wire    [2 :0]  ibdp_h1_vsew;                    
wire    [38:0]  ibdp_h2_cur_pc;                  
wire    [15:0]  ibdp_h2_data;                    
wire    [2 :0]  ibdp_h2_split0_type;             
wire    [2 :0]  ibdp_h2_split1_type;             
wire    [7 :0]  ibdp_h2_vl;                      
wire    [1 :0]  ibdp_h2_vlmul;                   
wire    [2 :0]  ibdp_h2_vsew;                    
wire    [38:0]  ibdp_h3_cur_pc;                  
wire    [15:0]  ibdp_h3_data;                    
wire    [2 :0]  ibdp_h3_split0_type;             
wire    [2 :0]  ibdp_h3_split1_type;             
wire    [7 :0]  ibdp_h3_vl;                      
wire    [1 :0]  ibdp_h3_vlmul;                   
wire    [2 :0]  ibdp_h3_vsew;                    
wire    [38:0]  ibdp_h4_cur_pc;                  
wire    [15:0]  ibdp_h4_data;                    
wire    [2 :0]  ibdp_h4_split0_type;             
wire    [2 :0]  ibdp_h4_split1_type;             
wire    [7 :0]  ibdp_h4_vl;                      
wire    [1 :0]  ibdp_h4_vlmul;                   
wire    [2 :0]  ibdp_h4_vsew;                    
wire    [38:0]  ibdp_h5_cur_pc;                  
wire    [15:0]  ibdp_h5_data;                    
wire    [2 :0]  ibdp_h5_split0_type;             
wire    [2 :0]  ibdp_h5_split1_type;             
wire    [7 :0]  ibdp_h5_vl;                      
wire    [1 :0]  ibdp_h5_vlmul;                   
wire    [2 :0]  ibdp_h5_vsew;                    
wire    [38:0]  ibdp_h6_cur_pc;                  
wire    [15:0]  ibdp_h6_data;                    
wire    [2 :0]  ibdp_h6_split0_type;             
wire    [2 :0]  ibdp_h6_split1_type;             
wire    [7 :0]  ibdp_h6_vl;                      
wire    [1 :0]  ibdp_h6_vlmul;                   
wire    [2 :0]  ibdp_h6_vsew;                    
wire    [38:0]  ibdp_h7_cur_pc;                  
wire    [15:0]  ibdp_h7_data;                    
wire    [2 :0]  ibdp_h7_split0_type;             
wire    [2 :0]  ibdp_h7_split1_type;             
wire    [7 :0]  ibdp_h7_vl;                      
wire    [1 :0]  ibdp_h7_vlmul;                   
wire    [2 :0]  ibdp_h7_vsew;                    
wire    [38:0]  ibdp_h8_cur_pc;                  
wire    [15:0]  ibdp_h8_data;                    
wire    [2 :0]  ibdp_h8_split0_type;             
wire    [2 :0]  ibdp_h8_split1_type;             
wire    [7 :0]  ibdp_h8_vl;                      
wire    [1 :0]  ibdp_h8_vlmul;                   
wire    [2 :0]  ibdp_h8_vsew;                    
wire    [3 :0]  ibdp_half_vld_num;               
wire    [7 :0]  ibdp_hn_32_start;                
wire    [7 :0]  ibdp_hn_ab_br;                   
wire    [7 :0]  ibdp_hn_acc_err;                 
wire    [7 :0]  ibdp_hn_auipc;                   
wire    [7 :0]  ibdp_hn_bkpta;                   
wire    [7 :0]  ibdp_hn_bkptb;                   
wire    [7 :0]  ibdp_hn_chgflw;                  
wire    [7 :0]  ibdp_hn_con_br;                  
wire    [7 :0]  ibdp_hn_dst_vld;                 
wire    [7 :0]  ibdp_hn_fence;                   
wire    [7 :0]  ibdp_hn_high_expt;               
wire    [7 :0]  ibdp_hn_ind_br;                  
wire    [7 :0]  ibdp_hn_jal;                     
wire    [7 :0]  ibdp_hn_jalr;                    
wire    [7 :0]  ibdp_hn_ldst;                    
wire    [7 :0]  ibdp_hn_mmu_acc_deny;            
wire    [7 :0]  ibdp_hn_no_spec;                 
wire    [7 :0]  ibdp_hn_pc_oper;                 
wire    [7 :0]  ibdp_hn_pcall;                   
wire    [7 :0]  ibdp_hn_pgflt;                   
wire    [7 :0]  ibdp_hn_preturn;                 
wire    [7 :0]  ibdp_hn_split0;                  
wire    [7 :0]  ibdp_hn_split1;                  
wire    [7 :0]  ibdp_hn_vl_pred;                 
wire    [7 :0]  ibdp_hn_vld;                     
wire    [7 :0]  ibdp_hn_vsetvli;                 
wire    [7 :0]  ibdp_ibctrl_chgflw_vl;           
wire    [1 :0]  ibdp_ibctrl_chgflw_vlmul;        
wire    [2 :0]  ibdp_ibctrl_chgflw_vsew;         
wire    [38:0]  ibdp_ibctrl_default_pc;          
wire    [7 :0]  ibdp_ibctrl_hn_ind_br;           
wire    [7 :0]  ibdp_ibctrl_hn_pcall;            
wire    [7 :0]  ibdp_ibctrl_hn_preturn;          
wire    [38:0]  ibdp_ibctrl_l0_btb_mispred_pc;   
wire            ibdp_ibctrl_ras_chgflw_mask;     
wire            ibdp_ibctrl_ras_mistaken;        
wire    [38:0]  ibdp_ibctrl_ras_pc;              
wire    [38:0]  ibdp_ibctrl_vpc;                 
wire            ibdp_ibuf_h0_32_start;           
wire            ibdp_ibuf_h0_bkpta;              
wire            ibdp_ibuf_h0_bkptb;              
wire    [15:0]  ibdp_ibuf_h0_data;               
wire            ibdp_ibuf_h0_fence;              
wire            ibdp_ibuf_h0_high_expt;          
wire            ibdp_ibuf_h0_ldst;               
wire            ibdp_ibuf_h0_no_spec;            
wire    [14:0]  ibdp_ibuf_h0_pc;                 
wire            ibdp_ibuf_h0_spe_vld;            
wire            ibdp_ibuf_h0_split0;             
wire            ibdp_ibuf_h0_split1;             
wire    [7 :0]  ibdp_ibuf_h0_vl;                 
wire            ibdp_ibuf_h0_vl_pred;            
wire            ibdp_ibuf_h0_vld;                
wire    [1 :0]  ibdp_ibuf_h0_vlmul;              
wire    [2 :0]  ibdp_ibuf_h0_vsew;               
wire    [15:0]  ibdp_ibuf_h1_data;               
wire    [14:0]  ibdp_ibuf_h1_pc;                 
wire    [7 :0]  ibdp_ibuf_h1_vl;                 
wire    [1 :0]  ibdp_ibuf_h1_vlmul;              
wire    [2 :0]  ibdp_ibuf_h1_vsew;               
wire    [15:0]  ibdp_ibuf_h2_data;               
wire    [14:0]  ibdp_ibuf_h2_pc;                 
wire    [7 :0]  ibdp_ibuf_h2_vl;                 
wire    [1 :0]  ibdp_ibuf_h2_vlmul;              
wire    [2 :0]  ibdp_ibuf_h2_vsew;               
wire    [15:0]  ibdp_ibuf_h3_data;               
wire    [14:0]  ibdp_ibuf_h3_pc;                 
wire    [7 :0]  ibdp_ibuf_h3_vl;                 
wire    [1 :0]  ibdp_ibuf_h3_vlmul;              
wire    [2 :0]  ibdp_ibuf_h3_vsew;               
wire    [15:0]  ibdp_ibuf_h4_data;               
wire    [14:0]  ibdp_ibuf_h4_pc;                 
wire    [7 :0]  ibdp_ibuf_h4_vl;                 
wire    [1 :0]  ibdp_ibuf_h4_vlmul;              
wire    [2 :0]  ibdp_ibuf_h4_vsew;               
wire    [15:0]  ibdp_ibuf_h5_data;               
wire    [14:0]  ibdp_ibuf_h5_pc;                 
wire    [7 :0]  ibdp_ibuf_h5_vl;                 
wire    [1 :0]  ibdp_ibuf_h5_vlmul;              
wire    [2 :0]  ibdp_ibuf_h5_vsew;               
wire    [15:0]  ibdp_ibuf_h6_data;               
wire    [14:0]  ibdp_ibuf_h6_pc;                 
wire    [7 :0]  ibdp_ibuf_h6_vl;                 
wire    [1 :0]  ibdp_ibuf_h6_vlmul;              
wire    [2 :0]  ibdp_ibuf_h6_vsew;               
wire    [15:0]  ibdp_ibuf_h7_data;               
wire    [14:0]  ibdp_ibuf_h7_pc;                 
wire    [7 :0]  ibdp_ibuf_h7_vl;                 
wire    [1 :0]  ibdp_ibuf_h7_vlmul;              
wire    [2 :0]  ibdp_ibuf_h7_vsew;               
wire    [15:0]  ibdp_ibuf_h8_data;               
wire    [14:0]  ibdp_ibuf_h8_pc;                 
wire    [7 :0]  ibdp_ibuf_h8_vl;                 
wire    [1 :0]  ibdp_ibuf_h8_vlmul;              
wire    [2 :0]  ibdp_ibuf_h8_vsew;               
wire    [3 :0]  ibdp_ibuf_half_vld_num;          
wire    [7 :0]  ibdp_ibuf_hn_32_start;           
wire    [7 :0]  ibdp_ibuf_hn_acc_err;            
wire            ibdp_ibuf_hn_acc_err_vld;        
wire    [7 :0]  ibdp_ibuf_hn_bkpta;              
wire            ibdp_ibuf_hn_bkpta_vld;          
wire    [7 :0]  ibdp_ibuf_hn_bkptb;              
wire            ibdp_ibuf_hn_bkptb_vld;          
wire    [7 :0]  ibdp_ibuf_hn_fence;              
wire    [7 :0]  ibdp_ibuf_hn_high_expt;          
wire    [7 :0]  ibdp_ibuf_hn_ldst;               
wire    [7 :0]  ibdp_ibuf_hn_mmu_acc_deny;       
wire            ibdp_ibuf_hn_mmu_acc_deny_vld;   
wire    [7 :0]  ibdp_ibuf_hn_no_spec;            
wire            ibdp_ibuf_hn_no_spec_vld;        
wire    [7 :0]  ibdp_ibuf_hn_pgflt;              
wire            ibdp_ibuf_hn_pgflt_vld;          
wire    [7 :0]  ibdp_ibuf_hn_split0;             
wire    [7 :0]  ibdp_ibuf_hn_split1;             
wire    [7 :0]  ibdp_ibuf_hn_vl_pred;            
wire    [7 :0]  ibdp_ibuf_hn_vld;                
wire    [20:0]  ibdp_ind_br_offset;              
wire            ibdp_l0_btb_fifo_update_vld;     
wire            ibdp_l0_btb_update_cnt_bit;      
wire    [36:0]  ibdp_l0_btb_update_data;         
wire    [15:0]  ibdp_l0_btb_update_entry;        
wire            ibdp_l0_btb_update_ras_bit;      
wire            ibdp_l0_btb_update_vld;          
wire            ibdp_l0_btb_update_vld_bit;      
wire    [3 :0]  ibdp_l0_btb_wen;                 
wire    [1 :0]  ibdp_lbuf_bht_sel_array_result;  
wire    [38:0]  ibdp_lbuf_con_br_cur_pc;         
wire    [3 :0]  ibdp_lbuf_con_br_half_num;       
wire            ibdp_lbuf_con_br_inst_32;        
wire    [20:0]  ibdp_lbuf_con_br_offset;         
wire            ibdp_lbuf_con_br_taken;          
wire    [7 :0]  ibdp_lbuf_con_br_vl;             
wire    [1 :0]  ibdp_lbuf_con_br_vlmul;          
wire    [2 :0]  ibdp_lbuf_con_br_vsew;           
wire            ibdp_lbuf_h0_32_start;           
wire            ibdp_lbuf_h0_bkpta;              
wire            ibdp_lbuf_h0_bkptb;              
wire            ibdp_lbuf_h0_con_br;             
wire    [15:0]  ibdp_lbuf_h0_data;               
wire            ibdp_lbuf_h0_fence;              
wire    [2 :0]  ibdp_lbuf_h0_split0_type;        
wire    [2 :0]  ibdp_lbuf_h0_split1_type;        
wire    [7 :0]  ibdp_lbuf_h0_vl;                 
wire            ibdp_lbuf_h0_vld;                
wire    [1 :0]  ibdp_lbuf_h0_vlmul;              
wire            ibdp_lbuf_h0_vsetvli;            
wire    [2 :0]  ibdp_lbuf_h0_vsew;               
wire    [15:0]  ibdp_lbuf_h1_data;               
wire    [2 :0]  ibdp_lbuf_h1_split0_type;        
wire    [2 :0]  ibdp_lbuf_h1_split1_type;        
wire    [7 :0]  ibdp_lbuf_h1_vl;                 
wire    [1 :0]  ibdp_lbuf_h1_vlmul;              
wire    [2 :0]  ibdp_lbuf_h1_vsew;               
wire    [15:0]  ibdp_lbuf_h2_data;               
wire    [2 :0]  ibdp_lbuf_h2_split0_type;        
wire    [2 :0]  ibdp_lbuf_h2_split1_type;        
wire    [7 :0]  ibdp_lbuf_h2_vl;                 
wire    [1 :0]  ibdp_lbuf_h2_vlmul;              
wire    [2 :0]  ibdp_lbuf_h2_vsew;               
wire    [15:0]  ibdp_lbuf_h3_data;               
wire    [2 :0]  ibdp_lbuf_h3_split0_type;        
wire    [2 :0]  ibdp_lbuf_h3_split1_type;        
wire    [7 :0]  ibdp_lbuf_h3_vl;                 
wire    [1 :0]  ibdp_lbuf_h3_vlmul;              
wire    [2 :0]  ibdp_lbuf_h3_vsew;               
wire    [15:0]  ibdp_lbuf_h4_data;               
wire    [2 :0]  ibdp_lbuf_h4_split0_type;        
wire    [2 :0]  ibdp_lbuf_h4_split1_type;        
wire    [7 :0]  ibdp_lbuf_h4_vl;                 
wire    [1 :0]  ibdp_lbuf_h4_vlmul;              
wire    [2 :0]  ibdp_lbuf_h4_vsew;               
wire    [15:0]  ibdp_lbuf_h5_data;               
wire    [2 :0]  ibdp_lbuf_h5_split0_type;        
wire    [2 :0]  ibdp_lbuf_h5_split1_type;        
wire    [7 :0]  ibdp_lbuf_h5_vl;                 
wire    [1 :0]  ibdp_lbuf_h5_vlmul;              
wire    [2 :0]  ibdp_lbuf_h5_vsew;               
wire    [15:0]  ibdp_lbuf_h6_data;               
wire    [2 :0]  ibdp_lbuf_h6_split0_type;        
wire    [2 :0]  ibdp_lbuf_h6_split1_type;        
wire    [7 :0]  ibdp_lbuf_h6_vl;                 
wire    [1 :0]  ibdp_lbuf_h6_vlmul;              
wire    [2 :0]  ibdp_lbuf_h6_vsew;               
wire    [15:0]  ibdp_lbuf_h7_data;               
wire    [2 :0]  ibdp_lbuf_h7_split0_type;        
wire    [2 :0]  ibdp_lbuf_h7_split1_type;        
wire    [7 :0]  ibdp_lbuf_h7_vl;                 
wire    [1 :0]  ibdp_lbuf_h7_vlmul;              
wire    [2 :0]  ibdp_lbuf_h7_vsew;               
wire    [15:0]  ibdp_lbuf_h8_data;               
wire    [2 :0]  ibdp_lbuf_h8_split0_type;        
wire    [2 :0]  ibdp_lbuf_h8_split1_type;        
wire    [7 :0]  ibdp_lbuf_h8_vl;                 
wire    [1 :0]  ibdp_lbuf_h8_vlmul;              
wire    [2 :0]  ibdp_lbuf_h8_vsew;               
wire    [3 :0]  ibdp_lbuf_half_vld_num;          
wire    [7 :0]  ibdp_lbuf_hn_32_start;           
wire    [7 :0]  ibdp_lbuf_hn_auipc;              
wire    [7 :0]  ibdp_lbuf_hn_bkpta;              
wire    [7 :0]  ibdp_lbuf_hn_bkptb;              
wire    [7 :0]  ibdp_lbuf_hn_chgflw;             
wire    [7 :0]  ibdp_lbuf_hn_con_br;             
wire    [7 :0]  ibdp_lbuf_hn_fence;              
wire    [7 :0]  ibdp_lbuf_hn_vld;                
wire    [7 :0]  ibdp_lbuf_hn_vsetvli;            
wire    [1 :0]  ibdp_pcfifo_if_bht_pre_result;   
wire    [1 :0]  ibdp_pcfifo_if_bht_sel_result;   
wire    [38:0]  ibdp_pcfifo_if_h0_cur_pc;        
wire            ibdp_pcfifo_if_h0_vld;           
wire    [38:0]  ibdp_pcfifo_if_h1_cur_pc;        
wire    [38:0]  ibdp_pcfifo_if_h2_cur_pc;        
wire    [38:0]  ibdp_pcfifo_if_h3_cur_pc;        
wire    [38:0]  ibdp_pcfifo_if_h4_cur_pc;        
wire    [38:0]  ibdp_pcfifo_if_h5_cur_pc;        
wire    [38:0]  ibdp_pcfifo_if_h6_cur_pc;        
wire    [38:0]  ibdp_pcfifo_if_h7_cur_pc;        
wire    [38:0]  ibdp_pcfifo_if_h8_cur_pc;        
wire    [7 :0]  ibdp_pcfifo_if_hn_con_br;        
wire    [7 :0]  ibdp_pcfifo_if_hn_dst_vld;       
wire    [7 :0]  ibdp_pcfifo_if_hn_jal;           
wire    [7 :0]  ibdp_pcfifo_if_hn_jalr;          
wire    [7 :0]  ibdp_pcfifo_if_hn_pc_oper;       
wire    [20:0]  ibdp_pcfifo_if_ind_br_offset;    
wire    [21:0]  ibdp_pcfifo_if_vghr;             
wire    [38:0]  ibdp_ras_push_pc;                
wire    [38:0]  ibdp_ras_target_pc;              
wire    [38:0]  ibdp_vpc;                        
wire    [31:0]  ibuf_ibdp_bypass_inst0;          
wire            ibuf_ibdp_bypass_inst0_bkpta;    
wire            ibuf_ibdp_bypass_inst0_bkptb;    
wire            ibuf_ibdp_bypass_inst0_ecc_err;  
wire            ibuf_ibdp_bypass_inst0_expt;     
wire            ibuf_ibdp_bypass_inst0_fence;    
wire            ibuf_ibdp_bypass_inst0_high_expt; 
wire            ibuf_ibdp_bypass_inst0_no_spec;  
wire    [14:0]  ibuf_ibdp_bypass_inst0_pc;       
wire            ibuf_ibdp_bypass_inst0_split0;   
wire            ibuf_ibdp_bypass_inst0_split1;   
wire            ibuf_ibdp_bypass_inst0_valid;    
wire    [3 :0]  ibuf_ibdp_bypass_inst0_vec;      
wire    [7 :0]  ibuf_ibdp_bypass_inst0_vl;       
wire            ibuf_ibdp_bypass_inst0_vl_pred;  
wire    [1 :0]  ibuf_ibdp_bypass_inst0_vlmul;    
wire    [2 :0]  ibuf_ibdp_bypass_inst0_vsew;     
wire    [31:0]  ibuf_ibdp_bypass_inst1;          
wire            ibuf_ibdp_bypass_inst1_bkpta;    
wire            ibuf_ibdp_bypass_inst1_bkptb;    
wire            ibuf_ibdp_bypass_inst1_ecc_err;  
wire            ibuf_ibdp_bypass_inst1_expt;     
wire            ibuf_ibdp_bypass_inst1_fence;    
wire            ibuf_ibdp_bypass_inst1_high_expt; 
wire            ibuf_ibdp_bypass_inst1_no_spec;  
wire    [14:0]  ibuf_ibdp_bypass_inst1_pc;       
wire            ibuf_ibdp_bypass_inst1_split0;   
wire            ibuf_ibdp_bypass_inst1_split1;   
wire            ibuf_ibdp_bypass_inst1_valid;    
wire    [3 :0]  ibuf_ibdp_bypass_inst1_vec;      
wire    [7 :0]  ibuf_ibdp_bypass_inst1_vl;       
wire            ibuf_ibdp_bypass_inst1_vl_pred;  
wire    [1 :0]  ibuf_ibdp_bypass_inst1_vlmul;    
wire    [2 :0]  ibuf_ibdp_bypass_inst1_vsew;     
wire    [31:0]  ibuf_ibdp_bypass_inst2;          
wire            ibuf_ibdp_bypass_inst2_bkpta;    
wire            ibuf_ibdp_bypass_inst2_bkptb;    
wire            ibuf_ibdp_bypass_inst2_ecc_err;  
wire            ibuf_ibdp_bypass_inst2_expt;     
wire            ibuf_ibdp_bypass_inst2_fence;    
wire            ibuf_ibdp_bypass_inst2_high_expt; 
wire            ibuf_ibdp_bypass_inst2_no_spec;  
wire    [14:0]  ibuf_ibdp_bypass_inst2_pc;       
wire            ibuf_ibdp_bypass_inst2_split0;   
wire            ibuf_ibdp_bypass_inst2_split1;   
wire            ibuf_ibdp_bypass_inst2_valid;    
wire    [3 :0]  ibuf_ibdp_bypass_inst2_vec;      
wire    [7 :0]  ibuf_ibdp_bypass_inst2_vl;       
wire            ibuf_ibdp_bypass_inst2_vl_pred;  
wire    [1 :0]  ibuf_ibdp_bypass_inst2_vlmul;    
wire    [2 :0]  ibuf_ibdp_bypass_inst2_vsew;     
wire    [31:0]  ibuf_ibdp_inst0;                 
wire            ibuf_ibdp_inst0_bkpta;           
wire            ibuf_ibdp_inst0_bkptb;           
wire            ibuf_ibdp_inst0_ecc_err;         
wire            ibuf_ibdp_inst0_expt_vld;        
wire            ibuf_ibdp_inst0_fence;           
wire            ibuf_ibdp_inst0_high_expt;       
wire            ibuf_ibdp_inst0_no_spec;         
wire    [14:0]  ibuf_ibdp_inst0_pc;              
wire            ibuf_ibdp_inst0_split0;          
wire            ibuf_ibdp_inst0_split1;          
wire            ibuf_ibdp_inst0_valid;           
wire    [3 :0]  ibuf_ibdp_inst0_vec;             
wire    [7 :0]  ibuf_ibdp_inst0_vl;              
wire            ibuf_ibdp_inst0_vl_pred;         
wire    [1 :0]  ibuf_ibdp_inst0_vlmul;           
wire    [2 :0]  ibuf_ibdp_inst0_vsew;            
wire    [31:0]  ibuf_ibdp_inst1;                 
wire            ibuf_ibdp_inst1_bkpta;           
wire            ibuf_ibdp_inst1_bkptb;           
wire            ibuf_ibdp_inst1_ecc_err;         
wire            ibuf_ibdp_inst1_expt_vld;        
wire            ibuf_ibdp_inst1_fence;           
wire            ibuf_ibdp_inst1_high_expt;       
wire            ibuf_ibdp_inst1_no_spec;         
wire    [14:0]  ibuf_ibdp_inst1_pc;              
wire            ibuf_ibdp_inst1_split0;          
wire            ibuf_ibdp_inst1_split1;          
wire            ibuf_ibdp_inst1_valid;           
wire    [3 :0]  ibuf_ibdp_inst1_vec;             
wire    [7 :0]  ibuf_ibdp_inst1_vl;              
wire            ibuf_ibdp_inst1_vl_pred;         
wire    [1 :0]  ibuf_ibdp_inst1_vlmul;           
wire    [2 :0]  ibuf_ibdp_inst1_vsew;            
wire    [31:0]  ibuf_ibdp_inst2;                 
wire            ibuf_ibdp_inst2_bkpta;           
wire            ibuf_ibdp_inst2_bkptb;           
wire            ibuf_ibdp_inst2_ecc_err;         
wire            ibuf_ibdp_inst2_expt_vld;        
wire            ibuf_ibdp_inst2_fence;           
wire            ibuf_ibdp_inst2_high_expt;       
wire            ibuf_ibdp_inst2_no_spec;         
wire    [14:0]  ibuf_ibdp_inst2_pc;              
wire            ibuf_ibdp_inst2_split0;          
wire            ibuf_ibdp_inst2_split1;          
wire            ibuf_ibdp_inst2_valid;           
wire    [3 :0]  ibuf_ibdp_inst2_vec;             
wire    [7 :0]  ibuf_ibdp_inst2_vl;              
wire            ibuf_ibdp_inst2_vl_pred;         
wire    [1 :0]  ibuf_ibdp_inst2_vlmul;           
wire    [2 :0]  ibuf_ibdp_inst2_vsew;            
wire            ibuf_inst_vld;                   
wire            ifu_had_no_inst;                 
wire    [72:0]  ifu_idu_ib_inst0_data;           
wire            ifu_idu_ib_inst0_vld;            
wire    [72:0]  ifu_idu_ib_inst1_data;           
wire            ifu_idu_ib_inst1_vld;            
wire    [72:0]  ifu_idu_ib_inst2_data;           
wire            ifu_idu_ib_inst2_vld;            
wire            ind_btb_rd_stall;                
wire            ipctrl_ibdp_expt_vld;            
wire            ipctrl_ibdp_vld;                 
wire    [1 :0]  ipdp_ibdp_bht_pre_result;        
wire            ipdp_ibdp_bht_result;            
wire    [1 :0]  ipdp_ibdp_bht_sel_result;        
wire    [38:0]  ipdp_ibdp_branch_base;           
wire            ipdp_ibdp_branch_btb_miss;       
wire    [20:0]  ipdp_ibdp_branch_offset;         
wire    [38:0]  ipdp_ibdp_branch_result;         
wire    [7 :0]  ipdp_ibdp_branch_vl;             
wire    [1 :0]  ipdp_ibdp_branch_vlmul;          
wire    [2 :0]  ipdp_ibdp_branch_vsew;           
wire    [1 :0]  ipdp_ibdp_branch_way_pred;       
wire    [38:0]  ipdp_ibdp_btb_index_pc;          
wire    [7 :0]  ipdp_ibdp_chgflw_mask;           
wire    [3 :0]  ipdp_ibdp_chgflw_num;            
wire            ipdp_ibdp_chgflw_num_vld;        
wire    [7 :0]  ipdp_ibdp_chgflw_vl;             
wire    [1 :0]  ipdp_ibdp_chgflw_vlmul;          
wire    [2 :0]  ipdp_ibdp_chgflw_vsew;           
wire    [38:0]  ipdp_ibdp_con_br_cur_pc;         
wire    [3 :0]  ipdp_ibdp_con_br_half_num;       
wire            ipdp_ibdp_con_br_inst_32;        
wire    [3 :0]  ipdp_ibdp_con_br_num;            
wire            ipdp_ibdp_con_br_num_vld;        
wire    [20:0]  ipdp_ibdp_con_br_offset;         
wire            ipdp_ibdp_h0_bkpta;              
wire            ipdp_ibdp_h0_bkptb;              
wire            ipdp_ibdp_h0_con_br;             
wire    [35:0]  ipdp_ibdp_h0_cur_pc;             
wire    [15:0]  ipdp_ibdp_h0_data;               
wire            ipdp_ibdp_h0_fence;              
wire            ipdp_ibdp_h0_high_expt;          
wire            ipdp_ibdp_h0_ldst;               
wire            ipdp_ibdp_h0_no_spec;            
wire            ipdp_ibdp_h0_spe_vld;            
wire            ipdp_ibdp_h0_split0;             
wire    [2 :0]  ipdp_ibdp_h0_split0_type;        
wire            ipdp_ibdp_h0_split1;             
wire    [2 :0]  ipdp_ibdp_h0_split1_type;        
wire    [7 :0]  ipdp_ibdp_h0_vl;                 
wire            ipdp_ibdp_h0_vl_pred;            
wire            ipdp_ibdp_h0_vld;                
wire    [1 :0]  ipdp_ibdp_h0_vlmul;              
wire            ipdp_ibdp_h0_vsetvli;            
wire    [2 :0]  ipdp_ibdp_h0_vsew;               
wire    [2 :0]  ipdp_ibdp_h1_base;               
wire    [15:0]  ipdp_ibdp_h1_data;               
wire    [2 :0]  ipdp_ibdp_h1_split0_type;        
wire    [2 :0]  ipdp_ibdp_h1_split1_type;        
wire    [7 :0]  ipdp_ibdp_h1_vl;                 
wire    [1 :0]  ipdp_ibdp_h1_vlmul;              
wire    [2 :0]  ipdp_ibdp_h1_vsew;               
wire    [2 :0]  ipdp_ibdp_h2_base;               
wire    [15:0]  ipdp_ibdp_h2_data;               
wire    [2 :0]  ipdp_ibdp_h2_split0_type;        
wire    [2 :0]  ipdp_ibdp_h2_split1_type;        
wire    [7 :0]  ipdp_ibdp_h2_vl;                 
wire    [1 :0]  ipdp_ibdp_h2_vlmul;              
wire    [2 :0]  ipdp_ibdp_h2_vsew;               
wire    [2 :0]  ipdp_ibdp_h3_base;               
wire    [15:0]  ipdp_ibdp_h3_data;               
wire    [2 :0]  ipdp_ibdp_h3_split0_type;        
wire    [2 :0]  ipdp_ibdp_h3_split1_type;        
wire    [7 :0]  ipdp_ibdp_h3_vl;                 
wire    [1 :0]  ipdp_ibdp_h3_vlmul;              
wire    [2 :0]  ipdp_ibdp_h3_vsew;               
wire    [2 :0]  ipdp_ibdp_h4_base;               
wire    [15:0]  ipdp_ibdp_h4_data;               
wire    [2 :0]  ipdp_ibdp_h4_split0_type;        
wire    [2 :0]  ipdp_ibdp_h4_split1_type;        
wire    [7 :0]  ipdp_ibdp_h4_vl;                 
wire    [1 :0]  ipdp_ibdp_h4_vlmul;              
wire    [2 :0]  ipdp_ibdp_h4_vsew;               
wire    [2 :0]  ipdp_ibdp_h5_base;               
wire    [15:0]  ipdp_ibdp_h5_data;               
wire    [2 :0]  ipdp_ibdp_h5_split0_type;        
wire    [2 :0]  ipdp_ibdp_h5_split1_type;        
wire    [7 :0]  ipdp_ibdp_h5_vl;                 
wire    [1 :0]  ipdp_ibdp_h5_vlmul;              
wire    [2 :0]  ipdp_ibdp_h5_vsew;               
wire    [2 :0]  ipdp_ibdp_h6_base;               
wire    [15:0]  ipdp_ibdp_h6_data;               
wire    [2 :0]  ipdp_ibdp_h6_split0_type;        
wire    [2 :0]  ipdp_ibdp_h6_split1_type;        
wire    [7 :0]  ipdp_ibdp_h6_vl;                 
wire    [1 :0]  ipdp_ibdp_h6_vlmul;              
wire    [2 :0]  ipdp_ibdp_h6_vsew;               
wire    [2 :0]  ipdp_ibdp_h7_base;               
wire    [15:0]  ipdp_ibdp_h7_data;               
wire    [2 :0]  ipdp_ibdp_h7_split0_type;        
wire    [2 :0]  ipdp_ibdp_h7_split1_type;        
wire    [7 :0]  ipdp_ibdp_h7_vl;                 
wire    [1 :0]  ipdp_ibdp_h7_vlmul;              
wire    [2 :0]  ipdp_ibdp_h7_vsew;               
wire    [2 :0]  ipdp_ibdp_h8_base;               
wire    [15:0]  ipdp_ibdp_h8_data;               
wire    [2 :0]  ipdp_ibdp_h8_split0_type;        
wire    [2 :0]  ipdp_ibdp_h8_split1_type;        
wire    [7 :0]  ipdp_ibdp_h8_vl;                 
wire    [1 :0]  ipdp_ibdp_h8_vlmul;              
wire    [2 :0]  ipdp_ibdp_h8_vsew;               
wire    [7 :0]  ipdp_ibdp_hn_32_start;           
wire    [7 :0]  ipdp_ibdp_hn_ab_br;              
wire            ipdp_ibdp_hn_acc_err;            
wire    [7 :0]  ipdp_ibdp_hn_auipc;              
wire    [7 :0]  ipdp_ibdp_hn_bkpta;              
wire            ipdp_ibdp_hn_bkpta_vld;          
wire    [7 :0]  ipdp_ibdp_hn_bkptb;              
wire            ipdp_ibdp_hn_bkptb_vld;          
wire    [7 :0]  ipdp_ibdp_hn_chgflw;             
wire    [7 :0]  ipdp_ibdp_hn_con_br;             
wire    [7 :0]  ipdp_ibdp_hn_dst_vld;            
wire    [7 :0]  ipdp_ibdp_hn_fence;              
wire    [7 :0]  ipdp_ibdp_hn_ind_br;             
wire    [7 :0]  ipdp_ibdp_hn_jal;                
wire    [7 :0]  ipdp_ibdp_hn_jalr;               
wire    [7 :0]  ipdp_ibdp_hn_ldst;               
wire            ipdp_ibdp_hn_mmu_acc_deny;       
wire    [7 :0]  ipdp_ibdp_hn_no_spec;            
wire            ipdp_ibdp_hn_no_spec_vld;        
wire    [7 :0]  ipdp_ibdp_hn_pc_oper;            
wire    [7 :0]  ipdp_ibdp_hn_pcall;              
wire            ipdp_ibdp_hn_pgflt;              
wire    [7 :0]  ipdp_ibdp_hn_preturn;            
wire    [7 :0]  ipdp_ibdp_hn_split0;             
wire    [7 :0]  ipdp_ibdp_hn_split1;             
wire    [7 :0]  ipdp_ibdp_hn_vl_pred;            
wire    [7 :0]  ipdp_ibdp_hn_vld;                
wire    [7 :0]  ipdp_ibdp_hn_vsetvli;            
wire    [20:0]  ipdp_ibdp_ind_br_offset;         
wire    [15:0]  ipdp_ibdp_l0_btb_entry_hit;      
wire            ipdp_ibdp_l0_btb_hit;            
wire    [38:0]  ipdp_ibdp_l0_btb_mispred_pc;     
wire            ipdp_ibdp_l0_btb_ras;            
wire            ipdp_ibdp_l0_btb_ras_pc_hit;     
wire            ipdp_ibdp_l0_btb_update_cnt_bit; 
wire            ipdp_ibdp_l0_btb_update_vld;     
wire            ipdp_ibdp_l0_btb_update_vld_bit; 
wire    [3 :0]  ipdp_ibdp_l0_btb_wen;            
wire    [3 :0]  ipdp_ibdp_no_chgflw_num;         
wire    [38:0]  ipdp_ibdp_ras_push_pc;           
wire    [38:0]  ipdp_ibdp_ras_target_pc;         
wire    [21:0]  ipdp_ibdp_vghr;                  
wire    [38:0]  ipdp_ibdp_vpc;                   
wire            iu_ifu_pcfifo_full;              
wire            l0_btb_br_mispred;               
wire            l0_btb_br_mispred_pre;           
wire            l0_btb_br_miss;                  
wire            l0_btb_br_miss_pre;              
wire            l0_btb_br_update;                
wire            l0_btb_br_update_pre;            
wire    [15:0]  l0_btb_hit_entry;                
wire    [15:0]  l0_btb_ibdp_entry_fifo;          
wire            l0_btb_ras_hit;                  
wire            l0_btb_ras_mispred;              
wire            l0_btb_ras_miss;                 
wire            l0_btb_ras_mistaken;             
wire            l0_btb_ras_update;               
wire            l0_btb_st_wait;                  
wire            l0_btb_update_vld;               
wire            l0_btb_update_vld_for_gateclk;   
wire    [31:0]  lbuf_ibdp_inst0;                 
wire            lbuf_ibdp_inst0_bkpta;           
wire            lbuf_ibdp_inst0_bkptb;           
wire            lbuf_ibdp_inst0_fence;           
wire    [14:0]  lbuf_ibdp_inst0_pc;              
wire            lbuf_ibdp_inst0_split0;          
wire            lbuf_ibdp_inst0_split1;          
wire            lbuf_ibdp_inst0_valid;           
wire    [7 :0]  lbuf_ibdp_inst0_vl;              
wire    [1 :0]  lbuf_ibdp_inst0_vlmul;           
wire    [2 :0]  lbuf_ibdp_inst0_vsew;            
wire    [31:0]  lbuf_ibdp_inst1;                 
wire            lbuf_ibdp_inst1_bkpta;           
wire            lbuf_ibdp_inst1_bkptb;           
wire            lbuf_ibdp_inst1_fence;           
wire    [14:0]  lbuf_ibdp_inst1_pc;              
wire            lbuf_ibdp_inst1_split0;          
wire            lbuf_ibdp_inst1_split1;          
wire            lbuf_ibdp_inst1_valid;           
wire    [7 :0]  lbuf_ibdp_inst1_vl;              
wire    [1 :0]  lbuf_ibdp_inst1_vlmul;           
wire    [2 :0]  lbuf_ibdp_inst1_vsew;            
wire    [31:0]  lbuf_ibdp_inst2;                 
wire            lbuf_ibdp_inst2_bkpta;           
wire            lbuf_ibdp_inst2_bkptb;           
wire            lbuf_ibdp_inst2_fence;           
wire    [14:0]  lbuf_ibdp_inst2_pc;              
wire            lbuf_ibdp_inst2_split0;          
wire            lbuf_ibdp_inst2_split1;          
wire            lbuf_ibdp_inst2_valid;           
wire    [7 :0]  lbuf_ibdp_inst2_vl;              
wire    [1 :0]  lbuf_ibdp_inst2_vlmul;           
wire    [2 :0]  lbuf_ibdp_inst2_vsew;            
wire            lbuf_inst_vld;                   
wire            mispred_stall;                   
wire            pad_yy_icg_scan_en;              
wire    [7 :0]  pc_oper_over_mask;               
wire            pc_oper_updt_vld_pre;            
wire    [7 :0]  pcfifo_if_ibdp_over_mask;        
wire            pcfifo_mask_cancel;              
wire            updt_vld_clk;                    
wire            updt_vld_clk_en;                 


// &Force("bus","ipdp_ibdp_l0_btb_target",37,0); @27
//==========================================================
//                       Parameters
//==========================================================
parameter PC_WIDTH = 40;
//----------------------------------------------------------
//                 ID data path parameters
//----------------------------------------------------------
parameter ID_WIDTH            = 73;

parameter ID_VL_PRED          = 72;
parameter ID_VL               = 71;
parameter ID_PC               = 63;
parameter ID_VSEW             = 48;
parameter ID_VLMUL            = 45;
parameter ID_NO_SPEC          = 43;
parameter ID_BKPTA_INST       = 42;
parameter ID_BKPTB_INST       = 41;
parameter ID_SPLIT_SHORT      = 40;
parameter ID_FENCE            = 39;
parameter ID_SPLIT_LONG       = 38;
parameter ID_HIGH_HW_EXPT     = 37;
parameter ID_EXPT_VEC         = 36;
parameter ID_EXPT_VLD         = 32;
parameter ID_OPCODE           = 31;

//==========================================================
//             Deal with Infor from ipdp
//==========================================================
assign ib_data_vld               = ipctrl_ibdp_vld;
assign chgflw_mask[7:0]          = ipdp_ibdp_chgflw_mask[7:0];
assign ibdp_hn_vld[7:0]          = ipdp_ibdp_hn_vld[7:0]          & chgflw_mask[7:0];
assign ibdp_hn_con_br[7:0]       = ipdp_ibdp_hn_con_br[7:0]       & chgflw_mask[7:0];
assign ibdp_hn_jal[7:0]          = ipdp_ibdp_hn_jal[7:0]          & chgflw_mask[7:0];
assign ibdp_hn_jalr[7:0]         = ipdp_ibdp_hn_jalr[7:0]         & chgflw_mask[7:0];
assign ibdp_hn_no_spec[7:0]      = ipdp_ibdp_hn_no_spec[7:0]      & chgflw_mask[7:0];
assign ibdp_hn_vl_pred[7:0]      = ipdp_ibdp_hn_vl_pred[7:0]      & chgflw_mask[7:0];
assign ibdp_hn_ab_br[7:0]        = ipdp_ibdp_hn_ab_br[7:0]        & chgflw_mask[7:0];
assign ibdp_hn_ind_br[7:0]       = ipdp_ibdp_hn_ind_br[7:0]       & chgflw_mask[7:0];
assign ibdp_hn_32_start[7:0]     = ipdp_ibdp_hn_32_start[7:0]     & chgflw_mask[7:0];
assign ibdp_hn_pc_oper[7:0]      = ipdp_ibdp_hn_pc_oper[7:0]      & chgflw_mask[7:0];
assign ibdp_hn_ldst[7:0]         = ipdp_ibdp_hn_ldst[7:0]         & chgflw_mask[7:0];
assign ibdp_hn_dst_vld[7:0]      = ipdp_ibdp_hn_dst_vld[7:0]      & chgflw_mask[7:0];
assign ibdp_hn_pcall[7:0]        = ipdp_ibdp_hn_pcall[7:0]        & chgflw_mask[7:0];
assign ibdp_hn_preturn[7:0]      = ipdp_ibdp_hn_preturn[7:0]      & chgflw_mask[7:0];
assign ibdp_hn_pgflt[7:0]        = {8{ipdp_ibdp_hn_pgflt}}        & chgflw_mask[7:0];
assign ibdp_hn_split1[7:0]       = ipdp_ibdp_hn_split1[7:0]       & chgflw_mask[7:0];
assign ibdp_hn_split0[7:0]       = ipdp_ibdp_hn_split0[7:0]       & chgflw_mask[7:0];
assign ibdp_hn_fence[7:0]        = ipdp_ibdp_hn_fence[7:0]        & chgflw_mask[7:0];
assign ibdp_hn_bkpta[7:0]        = ipdp_ibdp_hn_bkpta[7:0]        & chgflw_mask[7:0];
assign ibdp_hn_bkptb[7:0]        = ipdp_ibdp_hn_bkptb[7:0]        & chgflw_mask[7:0];
assign ibdp_hn_vsetvli[7:0]      = ipdp_ibdp_hn_vsetvli[7:0]      & chgflw_mask[7:0];
// &Force("input","ipdp_ibdp_hn_vsetvli"); @81
// &Force("bus","ipdp_ibdp_hn_vsetvli",7,0); @82
assign ibdp_hn_acc_err[7:0]      = {8{ipdp_ibdp_hn_acc_err}}      & chgflw_mask[7:0];
assign ibdp_hn_mmu_acc_deny[7:0] = {8{ipdp_ibdp_hn_mmu_acc_deny}} & chgflw_mask[7:0]; 
assign ibdp_hn_high_expt[7:0]    = 8'b0;

assign ibdp_h0_vld        = ipdp_ibdp_h0_vld;
assign ibdp_h0_32_start   = 1'b1;
assign ibdp_h0_split1     = ipdp_ibdp_h0_split1;
assign ibdp_h0_split0     = ipdp_ibdp_h0_split0;
assign ibdp_h0_fence      = ipdp_ibdp_h0_fence;
assign ibdp_h0_bkpta      = ipdp_ibdp_h0_bkpta;
assign ibdp_h0_bkptb      = ipdp_ibdp_h0_bkptb;
assign ibdp_h0_no_spec    = ipdp_ibdp_h0_no_spec;
assign ibdp_h0_vl_pred    = ipdp_ibdp_h0_vl_pred;
assign ibdp_h0_vsetvli    = ipdp_ibdp_h0_vsetvli;
assign ibdp_h0_high_expt  = ipdp_ibdp_h0_high_expt;
assign ibdp_h0_spe_vld    = ipdp_ibdp_h0_spe_vld;

assign ibdp_h0_data[15:0] = ipdp_ibdp_h0_data[15:0];
assign ibdp_h1_data[15:0] = ipdp_ibdp_h1_data[15:0];
assign ibdp_h2_data[15:0] = ipdp_ibdp_h2_data[15:0];
assign ibdp_h3_data[15:0] = ipdp_ibdp_h3_data[15:0];
assign ibdp_h4_data[15:0] = ipdp_ibdp_h4_data[15:0];
assign ibdp_h5_data[15:0] = ipdp_ibdp_h5_data[15:0];
assign ibdp_h6_data[15:0] = ipdp_ibdp_h6_data[15:0];
assign ibdp_h7_data[15:0] = ipdp_ibdp_h7_data[15:0];
assign ibdp_h8_data[15:0] = ipdp_ibdp_h8_data[15:0];

//vlmul
assign ibdp_h0_vlmul[1:0] = ipdp_ibdp_h0_vlmul[1:0];
assign ibdp_h1_vlmul[1:0] = ipdp_ibdp_h1_vlmul[1:0];
assign ibdp_h2_vlmul[1:0] = ipdp_ibdp_h2_vlmul[1:0];
assign ibdp_h3_vlmul[1:0] = ipdp_ibdp_h3_vlmul[1:0];
assign ibdp_h4_vlmul[1:0] = ipdp_ibdp_h4_vlmul[1:0];
assign ibdp_h5_vlmul[1:0] = ipdp_ibdp_h5_vlmul[1:0];
assign ibdp_h6_vlmul[1:0] = ipdp_ibdp_h6_vlmul[1:0];
assign ibdp_h7_vlmul[1:0] = ipdp_ibdp_h7_vlmul[1:0];
assign ibdp_h8_vlmul[1:0] = ipdp_ibdp_h8_vlmul[1:0];

//vsew
assign ibdp_h0_vsew[2:0]  = ipdp_ibdp_h0_vsew[2:0];
assign ibdp_h1_vsew[2:0]  = ipdp_ibdp_h1_vsew[2:0];
assign ibdp_h2_vsew[2:0]  = ipdp_ibdp_h2_vsew[2:0];
assign ibdp_h3_vsew[2:0]  = ipdp_ibdp_h3_vsew[2:0];
assign ibdp_h4_vsew[2:0]  = ipdp_ibdp_h4_vsew[2:0];
assign ibdp_h5_vsew[2:0]  = ipdp_ibdp_h5_vsew[2:0];
assign ibdp_h6_vsew[2:0]  = ipdp_ibdp_h6_vsew[2:0];
assign ibdp_h7_vsew[2:0]  = ipdp_ibdp_h7_vsew[2:0];
assign ibdp_h8_vsew[2:0]  = ipdp_ibdp_h8_vsew[2:0];

//vl
assign ibdp_h0_vl[7:0]    = ipdp_ibdp_h0_vl[7:0];
assign ibdp_h1_vl[7:0]    = ipdp_ibdp_h1_vl[7:0];
assign ibdp_h2_vl[7:0]    = ipdp_ibdp_h2_vl[7:0];
assign ibdp_h3_vl[7:0]    = ipdp_ibdp_h3_vl[7:0];
assign ibdp_h4_vl[7:0]    = ipdp_ibdp_h4_vl[7:0];
assign ibdp_h5_vl[7:0]    = ipdp_ibdp_h5_vl[7:0];
assign ibdp_h6_vl[7:0]    = ipdp_ibdp_h6_vl[7:0];
assign ibdp_h7_vl[7:0]    = ipdp_ibdp_h7_vl[7:0];
assign ibdp_h8_vl[7:0]    = ipdp_ibdp_h8_vl[7:0];

//split0 type
assign ibdp_h0_split0_type[2:0]  = ipdp_ibdp_h0_split0_type[2:0];
assign ibdp_h1_split0_type[2:0]  = ipdp_ibdp_h1_split0_type[2:0];
assign ibdp_h2_split0_type[2:0]  = ipdp_ibdp_h2_split0_type[2:0];
assign ibdp_h3_split0_type[2:0]  = ipdp_ibdp_h3_split0_type[2:0];
assign ibdp_h4_split0_type[2:0]  = ipdp_ibdp_h4_split0_type[2:0];
assign ibdp_h5_split0_type[2:0]  = ipdp_ibdp_h5_split0_type[2:0];
assign ibdp_h6_split0_type[2:0]  = ipdp_ibdp_h6_split0_type[2:0];
assign ibdp_h7_split0_type[2:0]  = ipdp_ibdp_h7_split0_type[2:0];
assign ibdp_h8_split0_type[2:0]  = ipdp_ibdp_h8_split0_type[2:0];

//stplit1 type
assign ibdp_h0_split1_type[2:0]  = ipdp_ibdp_h0_split1_type[2:0];
assign ibdp_h1_split1_type[2:0]  = ipdp_ibdp_h1_split1_type[2:0];
assign ibdp_h2_split1_type[2:0]  = ipdp_ibdp_h2_split1_type[2:0];
assign ibdp_h3_split1_type[2:0]  = ipdp_ibdp_h3_split1_type[2:0];
assign ibdp_h4_split1_type[2:0]  = ipdp_ibdp_h4_split1_type[2:0];
assign ibdp_h5_split1_type[2:0]  = ipdp_ibdp_h5_split1_type[2:0];
assign ibdp_h6_split1_type[2:0]  = ipdp_ibdp_h6_split1_type[2:0];
assign ibdp_h7_split1_type[2:0]  = ipdp_ibdp_h7_split1_type[2:0];
assign ibdp_h8_split1_type[2:0]  = ipdp_ibdp_h8_split1_type[2:0];

assign ibdp_bht_result           = ipdp_ibdp_bht_result;
assign ibdp_bht_sel_result[1:0]  = ipdp_ibdp_bht_sel_result[1:0];
assign ibdp_bht_pre_result[1:0]  = ipdp_ibdp_bht_pre_result[1:0];

assign ibdp_half_vld_num[3:0]    = (ipdp_ibdp_con_br_num_vld)
                                 ? ipdp_ibdp_con_br_num[3:0]
                                 : (ipdp_ibdp_chgflw_num_vld)
                                   ? ipdp_ibdp_chgflw_num[3:0]
                                   : ipdp_ibdp_no_chgflw_num[3:0];

assign ibdp_vpc[PC_WIDTH-2:0]       = ipdp_ibdp_vpc[PC_WIDTH-2:0];
assign ibdp_h0_cur_pc[PC_WIDTH-2:0] = {ipdp_ibdp_h0_cur_pc[35:0],3'b111};
assign ibdp_h1_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h1_base[2:0]};
assign ibdp_h2_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h2_base[2:0]};
assign ibdp_h3_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h3_base[2:0]};
assign ibdp_h4_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h4_base[2:0]};
assign ibdp_h5_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h5_base[2:0]};
assign ibdp_h6_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h6_base[2:0]};
assign ibdp_h7_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h7_base[2:0]};
assign ibdp_h8_cur_pc[PC_WIDTH-2:0] = {ibdp_vpc[PC_WIDTH-2:3], ipdp_ibdp_h8_base[2:0]};

assign ibdp_ras_target_pc[PC_WIDTH-2:0] = ipdp_ibdp_ras_target_pc[PC_WIDTH-2:0];
assign ibdp_ind_br_offset[20:0]         = ipdp_ibdp_ind_br_offset[20:0];

//Select The first inst start Address as IND_BTB/RAS Default PC
//In case of prefetch inst from bad address
assign ibdp_ibctrl_default_pc[PC_WIDTH-2:0] = (ibdp_h0_vld)
                                            ? {ipdp_ibdp_h0_cur_pc[35:0],3'b111}
                                            : ibdp_h1_cur_pc[PC_WIDTH-2:0];

assign ibdp_con_br_cur_pc[PC_WIDTH-2:0]  = ipdp_ibdp_con_br_cur_pc[PC_WIDTH-2:0];
assign ibdp_con_br_offset[20:0]          = ipdp_ibdp_con_br_offset[20:0];
assign ibdp_con_br_inst_32               = ipdp_ibdp_con_br_inst_32;
assign ibdp_con_br_half_num[3:0]         = ipdp_ibdp_con_br_half_num[3:0];
assign ibdp_h0_con_br                    = ipdp_ibdp_h0_con_br;
assign ibdp_hn_auipc[7:0]                = ipdp_ibdp_hn_auipc[7:0]  & chgflw_mask[7:0];
assign ibdp_hn_chgflw[7:0]               = ipdp_ibdp_hn_chgflw[7:0] & chgflw_mask[7:0];
//==========================================================
//               Information send to IBUF
//==========================================================
assign ibdp_ibuf_h0_vld               = ibdp_h0_vld;
assign ibdp_ibuf_h0_high_expt         = ibdp_h0_high_expt;
assign ibdp_ibuf_h0_spe_vld           = ibdp_h0_spe_vld;
assign ibdp_ibuf_h0_split1            = ibdp_h0_split1;
assign ibdp_ibuf_h0_split0            = ibdp_h0_split0;
assign ibdp_ibuf_h0_fence             = ibdp_h0_fence;
assign ibdp_ibuf_h0_bkpta             = ibdp_h0_bkpta;
assign ibdp_ibuf_h0_bkptb             = ibdp_h0_bkptb;
assign ibdp_ibuf_h0_no_spec           = ibdp_h0_no_spec;
assign ibdp_ibuf_h0_vl_pred           = ibdp_h0_vl_pred;
assign ibdp_ibuf_h0_32_start          = ibdp_h0_32_start;
assign ibdp_ibuf_h0_ldst              = ipdp_ibdp_h0_ldst;

//hn_vld should be masked by expt vld,when expt valid,we can just pass one
//valid half word.
assign ibdp_ibuf_hn_vld[7:0]          = (ipctrl_ibdp_expt_vld) ? 8'h80 : ibdp_hn_vld[7:0];
assign ibdp_ibuf_hn_acc_err[7:0]      = ibdp_hn_acc_err[7:0]; 
assign ibdp_ibuf_hn_mmu_acc_deny[7:0] = ibdp_hn_mmu_acc_deny[7:0];
assign ibdp_ibuf_hn_pgflt[7:0]        = ibdp_hn_pgflt[7:0];
assign ibdp_ibuf_hn_high_expt[7:0]    = ibdp_hn_high_expt[7:0];
assign ibdp_ibuf_hn_split1[7:0]       = ibdp_hn_split1[7:0];
assign ibdp_ibuf_hn_split0[7:0]       = ibdp_hn_split0[7:0];
assign ibdp_ibuf_hn_fence[7:0]        = ibdp_hn_fence[7:0];
assign ibdp_ibuf_hn_bkpta[7:0]        = ibdp_hn_bkpta[7:0];
assign ibdp_ibuf_hn_bkptb[7:0]        = ibdp_hn_bkptb[7:0];
assign ibdp_ibuf_hn_no_spec[7:0]      = ibdp_hn_no_spec[7:0]; 
assign ibdp_ibuf_hn_vl_pred[7:0]      = ibdp_hn_vl_pred[7:0]; 
assign ibdp_ibuf_hn_ldst[7:0]         = ibdp_hn_ldst[7:0];
assign ibdp_ibuf_hn_32_start[7:0]     = ibdp_hn_32_start[7:0] & 
                                        {8{~ipctrl_ibdp_expt_vld}}; //in case if data = 'bx
assign ibdp_ibuf_hn_acc_err_vld       = ipdp_ibdp_hn_acc_err;
assign ibdp_ibuf_hn_mmu_acc_deny_vld  = ipdp_ibdp_hn_mmu_acc_deny;
assign ibdp_ibuf_hn_pgflt_vld         = ipdp_ibdp_hn_pgflt;
assign ibdp_ibuf_hn_bkpta_vld         = ipdp_ibdp_hn_bkpta_vld;
assign ibdp_ibuf_hn_bkptb_vld         = ipdp_ibdp_hn_bkptb_vld;
assign ibdp_ibuf_hn_no_spec_vld       = ipdp_ibdp_hn_no_spec_vld;

assign ibdp_ibuf_h0_data[15:0]        = ibdp_h0_data[15:0];
assign ibdp_ibuf_h1_data[15:0]        = ibdp_h1_data[15:0];
assign ibdp_ibuf_h2_data[15:0]        = ibdp_h2_data[15:0];
assign ibdp_ibuf_h3_data[15:0]        = ibdp_h3_data[15:0];
assign ibdp_ibuf_h4_data[15:0]        = ibdp_h4_data[15:0];
assign ibdp_ibuf_h5_data[15:0]        = ibdp_h5_data[15:0];
assign ibdp_ibuf_h6_data[15:0]        = ibdp_h6_data[15:0];
assign ibdp_ibuf_h7_data[15:0]        = ibdp_h7_data[15:0];
assign ibdp_ibuf_h8_data[15:0]        = ibdp_h8_data[15:0];

assign ibdp_ibuf_h0_pc[14:0]          = ibdp_h0_cur_pc[14:0];                                   
assign ibdp_ibuf_h1_pc[14:0]          = ibdp_h1_cur_pc[14:0];                                 
assign ibdp_ibuf_h2_pc[14:0]          = ibdp_h2_cur_pc[14:0];                                   
assign ibdp_ibuf_h3_pc[14:0]          = ibdp_h3_cur_pc[14:0];                                  
assign ibdp_ibuf_h4_pc[14:0]          = ibdp_h4_cur_pc[14:0];                                   
assign ibdp_ibuf_h5_pc[14:0]          = ibdp_h5_cur_pc[14:0];                                   
assign ibdp_ibuf_h6_pc[14:0]          = ibdp_h6_cur_pc[14:0];                                   
assign ibdp_ibuf_h7_pc[14:0]          = ibdp_h7_cur_pc[14:0];                                   
assign ibdp_ibuf_h8_pc[14:0]          = ibdp_h8_cur_pc[14:0];

assign ibdp_ibuf_h0_vlmul[1:0]        = ibdp_h0_vlmul[1:0];
assign ibdp_ibuf_h1_vlmul[1:0]        = ibdp_h1_vlmul[1:0];
assign ibdp_ibuf_h2_vlmul[1:0]        = ibdp_h2_vlmul[1:0];
assign ibdp_ibuf_h3_vlmul[1:0]        = ibdp_h3_vlmul[1:0];
assign ibdp_ibuf_h4_vlmul[1:0]        = ibdp_h4_vlmul[1:0];
assign ibdp_ibuf_h5_vlmul[1:0]        = ibdp_h5_vlmul[1:0];
assign ibdp_ibuf_h6_vlmul[1:0]        = ibdp_h6_vlmul[1:0];
assign ibdp_ibuf_h7_vlmul[1:0]        = ibdp_h7_vlmul[1:0];
assign ibdp_ibuf_h8_vlmul[1:0]        = ibdp_h8_vlmul[1:0];

assign ibdp_ibuf_h0_vsew[2:0]         = ibdp_h0_vsew[2:0];
assign ibdp_ibuf_h1_vsew[2:0]         = ibdp_h1_vsew[2:0];
assign ibdp_ibuf_h2_vsew[2:0]         = ibdp_h2_vsew[2:0];
assign ibdp_ibuf_h3_vsew[2:0]         = ibdp_h3_vsew[2:0];
assign ibdp_ibuf_h4_vsew[2:0]         = ibdp_h4_vsew[2:0];
assign ibdp_ibuf_h5_vsew[2:0]         = ibdp_h5_vsew[2:0];
assign ibdp_ibuf_h6_vsew[2:0]         = ibdp_h6_vsew[2:0];
assign ibdp_ibuf_h7_vsew[2:0]         = ibdp_h7_vsew[2:0];
assign ibdp_ibuf_h8_vsew[2:0]         = ibdp_h8_vsew[2:0];

assign ibdp_ibuf_h0_vl[7:0]           = ibdp_h0_vl[7:0];
assign ibdp_ibuf_h1_vl[7:0]           = ibdp_h1_vl[7:0];
assign ibdp_ibuf_h2_vl[7:0]           = ibdp_h2_vl[7:0];
assign ibdp_ibuf_h3_vl[7:0]           = ibdp_h3_vl[7:0];
assign ibdp_ibuf_h4_vl[7:0]           = ibdp_h4_vl[7:0];
assign ibdp_ibuf_h5_vl[7:0]           = ibdp_h5_vl[7:0];
assign ibdp_ibuf_h6_vl[7:0]           = ibdp_h6_vl[7:0];
assign ibdp_ibuf_h7_vl[7:0]           = ibdp_h7_vl[7:0];
assign ibdp_ibuf_h8_vl[7:0]           = ibdp_h8_vl[7:0];

assign ibdp_ibuf_half_vld_num[3:0]    = ibdp_half_vld_num[3:0];

//==========================================================
//                Information send to LBUF
//==========================================================
//Hn_infor
assign ibdp_lbuf_hn_vld[7:0]          = ibdp_hn_vld[7:0];
assign ibdp_lbuf_hn_chgflw[7:0]       = ibdp_hn_chgflw[7:0];
assign ibdp_lbuf_hn_con_br[7:0]       = ibdp_hn_con_br[7:0];
assign ibdp_lbuf_hn_auipc[7:0]        = ibdp_hn_auipc[7:0];
assign ibdp_lbuf_hn_32_start[7:0]     = ibdp_hn_32_start[7:0];
//assign ibdp_lbuf_hn_split1[7:0]       = ibdp_hn_split1[7:0];
//assign ibdp_lbuf_hn_split0[7:0]       = ibdp_hn_split0[7:0];
assign ibdp_lbuf_hn_fence[7:0]        = ibdp_hn_fence[7:0];
assign ibdp_lbuf_hn_bkpta[7:0]        = ibdp_hn_bkpta[7:0];
assign ibdp_lbuf_hn_bkptb[7:0]        = ibdp_hn_bkptb[7:0];
assign ibdp_lbuf_hn_vsetvli[7:0]      = ibdp_hn_vsetvli[7:0];
//H0_infor
assign ibdp_lbuf_h0_vld               = ibdp_h0_vld;
assign ibdp_lbuf_h0_con_br            = ibdp_h0_con_br;
assign ibdp_lbuf_h0_32_start          = ibdp_h0_32_start;
//assign ibdp_lbuf_h0_split1            = ibdp_h0_split1;
//assign ibdp_lbuf_h0_split0            = ibdp_h0_split0;
assign ibdp_lbuf_h0_fence             = ibdp_h0_fence;
assign ibdp_lbuf_h0_bkpta             = ibdp_h0_bkpta;
assign ibdp_lbuf_h0_bkptb             = ibdp_h0_bkptb;
assign ibdp_lbuf_h0_vsetvli           = ibdp_h0_vsetvli;
//Hn_inst_data
assign ibdp_lbuf_h0_data[15:0]        = ibdp_h0_data[15:0];
assign ibdp_lbuf_h1_data[15:0]        = ibdp_h1_data[15:0];
assign ibdp_lbuf_h2_data[15:0]        = ibdp_h2_data[15:0];
assign ibdp_lbuf_h3_data[15:0]        = ibdp_h3_data[15:0];
assign ibdp_lbuf_h4_data[15:0]        = ibdp_h4_data[15:0];
assign ibdp_lbuf_h5_data[15:0]        = ibdp_h5_data[15:0];
assign ibdp_lbuf_h6_data[15:0]        = ibdp_h6_data[15:0];
assign ibdp_lbuf_h7_data[15:0]        = ibdp_h7_data[15:0];
assign ibdp_lbuf_h8_data[15:0]        = ibdp_h8_data[15:0];

assign ibdp_lbuf_h0_vlmul[1:0]        = ibdp_h0_vlmul[1:0];
assign ibdp_lbuf_h1_vlmul[1:0]        = ibdp_h1_vlmul[1:0];
assign ibdp_lbuf_h2_vlmul[1:0]        = ibdp_h2_vlmul[1:0];
assign ibdp_lbuf_h3_vlmul[1:0]        = ibdp_h3_vlmul[1:0];
assign ibdp_lbuf_h4_vlmul[1:0]        = ibdp_h4_vlmul[1:0];
assign ibdp_lbuf_h5_vlmul[1:0]        = ibdp_h5_vlmul[1:0];
assign ibdp_lbuf_h6_vlmul[1:0]        = ibdp_h6_vlmul[1:0];
assign ibdp_lbuf_h7_vlmul[1:0]        = ibdp_h7_vlmul[1:0];
assign ibdp_lbuf_h8_vlmul[1:0]        = ibdp_h8_vlmul[1:0];

assign ibdp_lbuf_h0_vsew[2:0]         = ibdp_h0_vsew[2:0];
assign ibdp_lbuf_h1_vsew[2:0]         = ibdp_h1_vsew[2:0];
assign ibdp_lbuf_h2_vsew[2:0]         = ibdp_h2_vsew[2:0];
assign ibdp_lbuf_h3_vsew[2:0]         = ibdp_h3_vsew[2:0];
assign ibdp_lbuf_h4_vsew[2:0]         = ibdp_h4_vsew[2:0];
assign ibdp_lbuf_h5_vsew[2:0]         = ibdp_h5_vsew[2:0];
assign ibdp_lbuf_h6_vsew[2:0]         = ibdp_h6_vsew[2:0];
assign ibdp_lbuf_h7_vsew[2:0]         = ibdp_h7_vsew[2:0];
assign ibdp_lbuf_h8_vsew[2:0]         = ibdp_h8_vsew[2:0];

assign ibdp_lbuf_h0_vl[7:0]           = ibdp_h0_vl[7:0];
assign ibdp_lbuf_h1_vl[7:0]           = ibdp_h1_vl[7:0];
assign ibdp_lbuf_h2_vl[7:0]           = ibdp_h2_vl[7:0];
assign ibdp_lbuf_h3_vl[7:0]           = ibdp_h3_vl[7:0];
assign ibdp_lbuf_h4_vl[7:0]           = ibdp_h4_vl[7:0];
assign ibdp_lbuf_h5_vl[7:0]           = ibdp_h5_vl[7:0];
assign ibdp_lbuf_h6_vl[7:0]           = ibdp_h6_vl[7:0];
assign ibdp_lbuf_h7_vl[7:0]           = ibdp_h7_vl[7:0];
assign ibdp_lbuf_h8_vl[7:0]           = ibdp_h8_vl[7:0];

//Hn_split0_type
assign ibdp_lbuf_h0_split0_type[2:0]  = ibdp_h0_split0_type[2:0];
assign ibdp_lbuf_h1_split0_type[2:0]  = ibdp_h1_split0_type[2:0];
assign ibdp_lbuf_h2_split0_type[2:0]  = ibdp_h2_split0_type[2:0];
assign ibdp_lbuf_h3_split0_type[2:0]  = ibdp_h3_split0_type[2:0];
assign ibdp_lbuf_h4_split0_type[2:0]  = ibdp_h4_split0_type[2:0];
assign ibdp_lbuf_h5_split0_type[2:0]  = ibdp_h5_split0_type[2:0];
assign ibdp_lbuf_h6_split0_type[2:0]  = ibdp_h6_split0_type[2:0];
assign ibdp_lbuf_h7_split0_type[2:0]  = ibdp_h7_split0_type[2:0];
assign ibdp_lbuf_h8_split0_type[2:0]  = ibdp_h8_split0_type[2:0];

//Hn_split1_type
assign ibdp_lbuf_h0_split1_type[2:0]  = ibdp_h0_split1_type[2:0];
assign ibdp_lbuf_h1_split1_type[2:0]  = ibdp_h1_split1_type[2:0];
assign ibdp_lbuf_h2_split1_type[2:0]  = ibdp_h2_split1_type[2:0];
assign ibdp_lbuf_h3_split1_type[2:0]  = ibdp_h3_split1_type[2:0];
assign ibdp_lbuf_h4_split1_type[2:0]  = ibdp_h4_split1_type[2:0];
assign ibdp_lbuf_h5_split1_type[2:0]  = ibdp_h5_split1_type[2:0];
assign ibdp_lbuf_h6_split1_type[2:0]  = ibdp_h6_split1_type[2:0];
assign ibdp_lbuf_h7_split1_type[2:0]  = ibdp_h7_split1_type[2:0];
assign ibdp_lbuf_h8_split1_type[2:0]  = ibdp_h8_split1_type[2:0];

//Con_br infor
assign ibdp_lbuf_bht_sel_array_result[1:0]   = ibdp_bht_sel_result[1:0];
assign ibdp_lbuf_con_br_cur_pc[PC_WIDTH-2:0] = ibdp_con_br_cur_pc[PC_WIDTH-2:0];
assign ibdp_lbuf_con_br_offset[20:0]         = ibdp_con_br_offset[20:0];
assign ibdp_lbuf_con_br_inst_32              = ibdp_con_br_inst_32;
assign ibdp_lbuf_con_br_taken                = ibdp_bht_result;
assign ibdp_lbuf_con_br_vlmul[1:0]           = ipdp_ibdp_branch_vlmul[1:0];
assign ibdp_lbuf_con_br_vsew[2:0]            = ipdp_ibdp_branch_vsew[2:0];
assign ibdp_lbuf_con_br_vl[7:0]              = ipdp_ibdp_branch_vl[7:0];
//Half number infor
assign ibdp_lbuf_half_vld_num[3:0]           = ibdp_half_vld_num[3:0];
assign ibdp_lbuf_con_br_half_num[3:0]        = ibdp_con_br_half_num[3:0];

//==========================================================
//              Information send to PCFIFO_IF
//==========================================================
// &Force("output","ibdp_pcfifo_if_hn_pc_oper"); @417
// &Force("output","ibdp_pcfifo_if_hn_jal"); @418
// &Force("output","ibdp_pcfifo_if_hn_jalr"); @419
assign ibdp_pcfifo_if_h0_vld                  = ibdp_h0_vld;
assign ibdp_pcfifo_if_hn_pc_oper[7:0]         = (pc_oper_updt_vld)
                                              ? hn_pc_oper_updt_val[7:0] 
                                              : ibdp_hn_pc_oper[7:0];
assign ibdp_pcfifo_if_hn_con_br[7:0]          = ibdp_hn_con_br[7:0];                                      
assign ibdp_pcfifo_if_hn_jal[7:0]             = ibdp_hn_jal[7:0];
assign ibdp_pcfifo_if_hn_jalr[7:0]            = ibdp_hn_jalr[7:0];
assign ibdp_pcfifo_if_hn_dst_vld[7:0]         = ibdp_hn_dst_vld[7:0];
assign ibdp_pcfifo_if_ind_br_offset[20:0]     = ibdp_ind_br_offset[20:0];
assign ibdp_pcfifo_if_h0_cur_pc[PC_WIDTH-2:0] = ibdp_h0_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h1_cur_pc[PC_WIDTH-2:0] = ibdp_h1_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h2_cur_pc[PC_WIDTH-2:0] = ibdp_h2_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h3_cur_pc[PC_WIDTH-2:0] = ibdp_h3_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h4_cur_pc[PC_WIDTH-2:0] = ibdp_h4_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h5_cur_pc[PC_WIDTH-2:0] = ibdp_h5_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h6_cur_pc[PC_WIDTH-2:0] = ibdp_h6_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h7_cur_pc[PC_WIDTH-2:0] = ibdp_h7_cur_pc[PC_WIDTH-2:0];                                      
assign ibdp_pcfifo_if_h8_cur_pc[PC_WIDTH-2:0] = ibdp_h8_cur_pc[PC_WIDTH-2:0];

assign ibdp_pcfifo_if_bht_pre_result[1:0]     = ibdp_bht_pre_result[1:0];
assign ibdp_pcfifo_if_bht_sel_result[1:0]     = ibdp_bht_sel_result[1:0];
assign ibdp_pcfifo_if_vghr[21:0]              = ipdp_ibdp_vghr[21:0];

//==========================================================
//                  Infor send to BTB
//==========================================================
assign ibdp_btb_miss = ipdp_ibdp_branch_btb_miss && 
                       !ibctrl_ibdp_chgflw && 
                       ibdp_addrgen_branch_valid;                     
// &Force("output","ibdp_btb_miss"); @450

assign l0_btb_st_wait        = ibctrl_ibdp_l0_btb_wait;
assign l0_btb_ras_update     = (l0_btb_ras_miss 
                               || l0_btb_ras_mispred 
                               || l0_btb_ras_mistaken);

assign l0_btb_br_miss_pre    = ibctrl_ibdp_l0_btb_miss;    
assign l0_btb_br_mispred_pre = ibctrl_ibdp_l0_btb_mispred; 
assign l0_btb_br_update_pre  = ipdp_ibdp_l0_btb_update_vld;

assign l0_btb_br_miss    = l0_btb_br_miss_pre
                        && !ibdp_btb_miss
                        && !l0_btb_ras_update;
assign l0_btb_br_mispred = l0_btb_br_mispred_pre
                        && !ibdp_btb_miss
                        && !l0_btb_ras_update;                        
assign l0_btb_br_update  = l0_btb_br_update_pre
                        && !ibdp_btb_miss
                        && !l0_btb_ras_update;                        

assign l0_btb_update_vld = (l0_btb_br_miss
                            || l0_btb_br_mispred
                            || l0_btb_ras_miss
                            || l0_btb_ras_mispred
                            || l0_btb_ras_mistaken
                            || l0_btb_br_update)
                         && ib_data_vld
                         && !ipctrl_ibdp_expt_vld
                         && !ibctrl_ibdp_self_stall;

assign l0_btb_update_vld_for_gateclk = (l0_btb_br_miss_pre 
                                       || l0_btb_br_mispred_pre
                                       || l0_btb_br_update_pre
                                       || l0_btb_ras_mistaken
                                       || l0_btb_ras_miss
                                       || l0_btb_ras_mispred)
                                    && ib_data_vld;

//update contrl signal:
//bit3:valid bit wen
//bit2:cnt  wen
//bit1:ras  wen
//bit0:data wen
// &CombBeg; @494
always @( l0_btb_ras_mistaken
       or ipdp_ibdp_l0_btb_update_vld_bit
       or ipdp_ibdp_l0_btb_wen[3:0]
       or ibdp_hn_jal[7:0]
       or ipdp_ibdp_l0_btb_update_cnt_bit
       or ipdp_ibdp_branch_result[19:0]
       or ipdp_ibdp_branch_way_pred[1:0]
       or l0_btb_ras_update
       or l0_btb_br_mispred
       or ibdp_vpc[14:0]
       or l0_btb_br_miss)
begin
case({l0_btb_ras_update,
      l0_btb_br_miss,
      l0_btb_br_mispred})
  3'b100: begin
          l0_btb_wen[3:0]          = 4'b1111;
          l0_btb_update_vld_bit    = !l0_btb_ras_mistaken;
          l0_btb_update_cnt_bit    = 1'b1;
          l0_btb_update_ras_bit    = 1'b1;
          l0_btb_update_data[36:0] = 
            {
             ibdp_vpc[14:0],                 //entry_tag 
             2'b11,                          //entry_way_pred
             20'b0                           //entry_target
            };
          end
  3'b010: begin       
          l0_btb_wen[3:0]          = 4'b1111;
          l0_btb_update_vld_bit    = 1'b1;
          l0_btb_update_cnt_bit    = |ibdp_hn_jal[7:0]; 
          l0_btb_update_ras_bit    = 1'b0;
          l0_btb_update_data[36:0] = 
            {ibdp_vpc[14:0],                 //entry_tag 
             ipdp_ibdp_branch_way_pred[1:0], //entry_way_pred
             ipdp_ibdp_branch_result[19:0]   //entry_target
            };
          end
  3'b001: begin
          l0_btb_wen[3:0]          = 4'b1000;
          l0_btb_update_vld_bit    = 1'b0;
          l0_btb_update_cnt_bit    = 1'b0;
          l0_btb_update_ras_bit    = 1'b0;
          l0_btb_update_data[36:0] = 37'b0; 
          end
  default: begin //br_update
          l0_btb_wen[3:0]          = ipdp_ibdp_l0_btb_wen[3:0];
          l0_btb_update_vld_bit    = ipdp_ibdp_l0_btb_update_vld_bit;
          l0_btb_update_cnt_bit    = ipdp_ibdp_l0_btb_update_cnt_bit;
          l0_btb_update_ras_bit    = 1'b0;
          l0_btb_update_data[36:0] = 37'b0; 
          end
endcase
// &CombEnd; @536
end
//for timing consideration
assign l0_btb_hit_entry[15:0] = (l0_btb_ras_miss || l0_btb_br_miss_pre && !l0_btb_ras_update)
                              ? l0_btb_ibdp_entry_fifo[15:0]
                              : ipdp_ibdp_l0_btb_entry_hit[15:0];
//output to l0 btb
assign ibdp_l0_btb_update_vld        = l0_btb_update_vld;
assign ibdp_l0_btb_wen[3:0]          = l0_btb_wen[3:0];  
assign ibdp_l0_btb_update_vld_bit    = l0_btb_update_vld_bit;  
assign ibdp_l0_btb_update_cnt_bit    = l0_btb_update_cnt_bit;   
assign ibdp_l0_btb_update_ras_bit    = l0_btb_update_ras_bit;   
assign ibdp_l0_btb_update_data[36:0] = l0_btb_update_data[36:0];
assign ibdp_l0_btb_fifo_update_vld   = (l0_btb_ras_miss || l0_btb_br_miss)
                                    && ib_data_vld
                                    && !ipctrl_ibdp_expt_vld
                                    && !ibctrl_ibdp_self_stall;
assign ibdp_l0_btb_update_entry[15:0] = l0_btb_hit_entry[15:0];

//output to adddrgen
assign ibdp_addrgen_l0_btb_hit             = l0_btb_ras_miss || l0_btb_br_miss;
assign ibdp_addrgen_l0_btb_hit_entry[15:0] = (ibctrl_ibdp_l0_btb_hit)
                                           ? ipdp_ibdp_l0_btb_entry_hit[15:0]
                                           : l0_btb_ibdp_entry_fifo[15:0];
//output to ibctrl
assign ibdp_ibctrl_l0_btb_mispred_pc[PC_WIDTH-2:0] = ipdp_ibdp_l0_btb_mispred_pc[PC_WIDTH-2:0];        

//==========================================================
//                 Infor send to ADDRGEN
//==========================================================
assign ibdp_addrgen_branch_valid        = (
                                            (|ibdp_hn_con_br[7:0]) && ibdp_bht_result || 
                                            (|ibdp_hn_ab_br[7:0])
                                          ) && 
                                          ib_data_vld && 
                                          !ipctrl_ibdp_expt_vld && 
                                          !ibctrl_ibdp_self_stall;
//assign ibdp_addrgen_branch_btb_miss     = ipdp_ibdp_branch_btb_miss;
assign ibdp_addrgen_branch_base[PC_WIDTH-2:0]   = ipdp_ibdp_branch_base[PC_WIDTH-2:0];
assign ibdp_addrgen_branch_offset[20:0]         = ipdp_ibdp_branch_offset[20:0];
assign ibdp_addrgen_branch_result[PC_WIDTH-2:0] = ipdp_ibdp_branch_result[PC_WIDTH-2:0];
assign ibdp_addrgen_btb_index_pc[PC_WIDTH-2:0]  = ipdp_ibdp_btb_index_pc[PC_WIDTH-2:0];
assign ibdp_addrgen_branch_vlmul[1:0]           = ipdp_ibdp_branch_vlmul[1:0];
assign ibdp_addrgen_branch_vsew[2:0]            = ipdp_ibdp_branch_vsew[2:0];
assign ibdp_addrgen_branch_vl[7:0]              = ipdp_ibdp_branch_vl[7:0];
// &Force("output", "ibdp_addrgen_branch_valid"); @584

//==========================================================
//              Infor send to IB_CTRL
//==========================================================
assign ibdp_ibctrl_hn_ind_br[7:0]       = ibdp_hn_ind_br[7:0];
assign ibdp_ibctrl_hn_preturn[7:0]      = ibdp_hn_preturn[7:0];
assign ibdp_ibctrl_hn_pcall[7:0]        = ibdp_hn_pcall[7:0];
assign ibdp_ibctrl_vpc[PC_WIDTH-2:0]    = ibdp_vpc[PC_WIDTH-2:0];
assign ibdp_ibctrl_ras_pc[PC_WIDTH-2:0] = ibdp_ras_target_pc[PC_WIDTH-2:0];

assign ibdp_ibctrl_chgflw_vlmul[1:0]    = ipdp_ibdp_chgflw_vlmul[1:0]; 
assign ibdp_ibctrl_chgflw_vsew[2:0]     = ipdp_ibdp_chgflw_vsew[2:0];
assign ibdp_ibctrl_chgflw_vl[7:0]       = ipdp_ibdp_chgflw_vl[7:0];

assign l0_btb_ras_hit     = ibctrl_ibdp_if_chgflw_vld
                         && ipdp_ibdp_l0_btb_ras
                         && !ibctrl_ibdp_ip_chgflw_vld
                         && ipdp_ibdp_l0_btb_ras_pc_hit
                         && ib_data_vld
                         && (|ibdp_hn_preturn[7:0])
                         && cp0_ifu_ras_en;
assign l0_btb_ras_mistaken = ibctrl_ibdp_if_chgflw_vld
                         && ipdp_ibdp_l0_btb_ras
                         && !ibctrl_ibdp_ip_chgflw_vld
                         && ib_data_vld
                         && !(|ibdp_hn_preturn[7:0]);
assign l0_btb_ras_miss    = (ibctrl_ibdp_if_chgflw_vld
                            && !ipdp_ibdp_l0_btb_ras
                            || !ipdp_ibdp_l0_btb_hit)
                         && l0_btb_st_wait
                         && ib_data_vld
                         && (|ibdp_hn_preturn[7:0])
                         && cp0_ifu_ras_en;
assign l0_btb_ras_mispred = ibctrl_ibdp_if_chgflw_vld
                         && ipdp_ibdp_l0_btb_ras
                         && !ipdp_ibdp_l0_btb_ras_pc_hit
                         && l0_btb_st_wait
                         && ib_data_vld
                         && (|ibdp_hn_preturn[7:0])
                         && cp0_ifu_ras_en;                         
assign ibdp_ibctrl_ras_chgflw_mask = l0_btb_ras_hit;
assign ibdp_ibctrl_ras_mistaken    = l0_btb_ras_mistaken;

//==========================================================
//               Push PC send to RAS
//==========================================================
//send Hn pcall next pc as link pc to ras
assign ibdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_ibdp_ras_push_pc[PC_WIDTH-2:0];
 
//==========================================================
//                 Inst Send to IDU
//==========================================================
//control signal from ibctrl
assign bypass_inst_vld = ibctrl_ibdp_bypass_inst_vld;
assign ibuf_inst_vld   = ibctrl_ibdp_ibuf_inst_vld;
assign lbuf_inst_vld   = ibctrl_ibdp_lbuf_inst_vld;
                            
// &CombBeg; @646
always @( ibuf_ibdp_inst1[31:0]
       or lbuf_ibdp_inst2_split1
       or ibuf_ibdp_inst2_no_spec
       or lbuf_ibdp_inst0_vsew[2:0]
       or ibuf_ibdp_inst0_vlmul[1:0]
       or ibuf_ibdp_bypass_inst2_vl[7:0]
       or ibuf_ibdp_inst1_vsew[2:0]
       or ibuf_ibdp_inst2_bkpta
       or ibuf_ibdp_inst2_valid
       or lbuf_ibdp_inst0_fence
       or ibuf_ibdp_bypass_inst1_split0
       or ibuf_ibdp_inst1_valid
       or ibuf_ibdp_inst2_ecc_err
       or ibuf_ibdp_inst0_valid
       or lbuf_ibdp_inst1_pc[14:0]
       or ibuf_ibdp_bypass_inst1_bkpta
       or lbuf_ibdp_inst2_bkpta
       or lbuf_ibdp_inst1_bkpta
       or ibuf_ibdp_inst0_pc[14:0]
       or ibuf_ibdp_bypass_inst1_vsew[2:0]
       or ibuf_ibdp_inst1_expt_vld
       or lbuf_inst_vld
       or ibuf_ibdp_bypass_inst1_vec[3:0]
       or ibuf_ibdp_bypass_inst0_ecc_err
       or lbuf_ibdp_inst2_vl[7:0]
       or ibuf_ibdp_bypass_inst2_fence
       or ibuf_ibdp_inst2_vlmul[1:0]
       or ibuf_ibdp_inst0_vsew[2:0]
       or ibuf_ibdp_inst1_no_spec
       or ibuf_ibdp_inst0_bkptb
       or lbuf_ibdp_inst0_bkpta
       or ibuf_ibdp_inst2_vl_pred
       or ibuf_ibdp_inst1_vec[3:0]
       or ibuf_ibdp_bypass_inst2_pc[14:0]
       or ibuf_ibdp_inst2_split0
       or ibuf_ibdp_bypass_inst0_vsew[2:0]
       or ibuf_ibdp_bypass_inst0_vl[7:0]
       or ibuf_ibdp_inst1_bkptb
       or ibuf_ibdp_inst1_fence
       or ibuf_ibdp_inst1_split1
       or ibuf_ibdp_inst2_split1
       or ibuf_ibdp_bypass_inst2_expt
       or ibuf_ibdp_bypass_inst0_fence
       or ibuf_ibdp_bypass_inst2_no_spec
       or ibuf_inst_vld
       or ibuf_ibdp_bypass_inst2_bkptb
       or ibuf_ibdp_bypass_inst1_high_expt
       or lbuf_ibdp_inst1_split1
       or ibuf_ibdp_inst2_expt_vld
       or ibuf_ibdp_bypass_inst0_bkpta
       or ibuf_ibdp_bypass_inst1_ecc_err
       or ibuf_ibdp_bypass_inst1_fence
       or ibuf_ibdp_inst0_vec[3:0]
       or lbuf_ibdp_inst2[31:0]
       or ibuf_ibdp_inst2_vl[7:0]
       or lbuf_ibdp_inst1_bkptb
       or ibuf_ibdp_bypass_inst0_split1
       or ibuf_ibdp_bypass_inst1_valid
       or ibuf_ibdp_bypass_inst2_vlmul[1:0]
       or ibuf_ibdp_inst0_expt_vld
       or lbuf_ibdp_inst1[31:0]
       or ibuf_ibdp_bypass_inst1_vlmul[1:0]
       or lbuf_ibdp_inst2_vsew[2:0]
       or ibuf_ibdp_bypass_inst0_high_expt
       or lbuf_ibdp_inst0_split0
       or ibuf_ibdp_bypass_inst1_pc[14:0]
       or lbuf_ibdp_inst2_valid
       or ibuf_ibdp_inst2[31:0]
       or ibuf_ibdp_inst0_split0
       or ibuf_ibdp_inst0_bkpta
       or ibuf_ibdp_inst1_vl[7:0]
       or ibuf_ibdp_inst2_pc[14:0]
       or ibuf_ibdp_bypass_inst1_vl[7:0]
       or ibuf_ibdp_bypass_inst0_vl_pred
       or ibuf_ibdp_inst0[31:0]
       or ibuf_ibdp_inst1_ecc_err
       or ibuf_ibdp_inst2_vec[3:0]
       or lbuf_ibdp_inst1_vl[7:0]
       or lbuf_ibdp_inst0_valid
       or ibuf_ibdp_inst0_split1
       or lbuf_ibdp_inst1_vlmul[1:0]
       or ibuf_ibdp_bypass_inst0[31:0]
       or ibuf_ibdp_bypass_inst0_expt
       or lbuf_ibdp_inst0_split1
       or ibuf_ibdp_inst0_vl[7:0]
       or ibuf_ibdp_bypass_inst1_vl_pred
       or ibuf_ibdp_inst1_vlmul[1:0]
       or ibuf_ibdp_bypass_inst2[31:0]
       or lbuf_ibdp_inst0_vlmul[1:0]
       or ibuf_ibdp_bypass_inst2_bkpta
       or ibuf_ibdp_bypass_inst2_split0
       or ibuf_ibdp_bypass_inst2_valid
       or ibuf_ibdp_bypass_inst1_bkptb
       or lbuf_ibdp_inst0[31:0]
       or ibuf_ibdp_inst0_vl_pred
       or ibuf_ibdp_inst2_fence
       or lbuf_ibdp_inst1_valid
       or lbuf_ibdp_inst2_pc[14:0]
       or ibuf_ibdp_bypass_inst1[31:0]
       or ibuf_ibdp_bypass_inst0_vec[3:0]
       or ibuf_ibdp_bypass_inst1_split1
       or lbuf_ibdp_inst1_split0
       or lbuf_ibdp_inst0_bkptb
       or ibuf_ibdp_bypass_inst0_pc[14:0]
       or ibuf_ibdp_bypass_inst2_high_expt
       or ibuf_ibdp_inst0_fence
       or ibuf_ibdp_inst1_bkpta
       or ibuf_ibdp_bypass_inst0_split0
       or ibuf_ibdp_inst1_pc[14:0]
       or ibuf_ibdp_inst2_bkptb
       or ibuf_ibdp_bypass_inst0_vlmul[1:0]
       or ibuf_ibdp_inst1_vl_pred
       or lbuf_ibdp_inst1_vsew[2:0]
       or ibuf_ibdp_bypass_inst2_split1
       or lbuf_ibdp_inst0_vl[7:0]
       or ibuf_ibdp_bypass_inst2_ecc_err
       or ibuf_ibdp_bypass_inst2_vsew[2:0]
       or ibuf_ibdp_bypass_inst1_expt
       or ibuf_ibdp_inst1_split0
       or ibuf_ibdp_inst0_high_expt
       or ibuf_ibdp_bypass_inst2_vec[3:0]
       or lbuf_ibdp_inst2_vlmul[1:0]
       or ibuf_ibdp_bypass_inst0_bkptb
       or ibuf_ibdp_inst2_high_expt
       or ibuf_ibdp_inst0_ecc_err
       or ibuf_ibdp_bypass_inst0_no_spec
       or ibuf_ibdp_inst1_high_expt
       or ibuf_ibdp_inst0_no_spec
       or ibuf_ibdp_inst2_vsew[2:0]
       or lbuf_ibdp_inst0_pc[14:0]
       or ibuf_ibdp_bypass_inst2_vl_pred
       or ibuf_ibdp_bypass_inst1_no_spec
       or lbuf_ibdp_inst2_fence
       or lbuf_ibdp_inst2_bkptb
       or lbuf_ibdp_inst2_split0
       or ibuf_ibdp_bypass_inst0_valid
       or lbuf_ibdp_inst1_fence
       or bypass_inst_vld)
begin
case({bypass_inst_vld,ibuf_inst_vld,lbuf_inst_vld})
 3'b100: begin
         inst0[31:0]      = ibuf_ibdp_bypass_inst0[31:0];
         inst1[31:0]      = ibuf_ibdp_bypass_inst1[31:0];
         inst2[31:0]      = ibuf_ibdp_bypass_inst2[31:0];
         inst0_pc[14:0]   = ibuf_ibdp_bypass_inst0_pc[14:0];
         inst1_pc[14:0]   = ibuf_ibdp_bypass_inst1_pc[14:0];
         inst2_pc[14:0]   = ibuf_ibdp_bypass_inst2_pc[14:0];
         inst0_vld        = ibuf_ibdp_bypass_inst0_valid;
         inst1_vld        = ibuf_ibdp_bypass_inst1_valid;
         inst2_vld        = ibuf_ibdp_bypass_inst2_valid;
         inst0_expt_vld   = ibuf_ibdp_bypass_inst0_expt;
         inst0_vec[3:0]   = ibuf_ibdp_bypass_inst0_vec[3:0];
         inst0_high_expt  = ibuf_ibdp_bypass_inst0_high_expt;
         inst0_ecc_err    = ibuf_ibdp_bypass_inst0_ecc_err;
         inst1_expt_vld   = ibuf_ibdp_bypass_inst1_expt;
         inst1_vec[3:0]   = ibuf_ibdp_bypass_inst1_vec[3:0];
         inst1_high_expt  = ibuf_ibdp_bypass_inst1_high_expt;
         inst1_ecc_err    = ibuf_ibdp_bypass_inst1_ecc_err;
         inst2_expt_vld   = ibuf_ibdp_bypass_inst2_expt;
         inst2_vec[3:0]   = ibuf_ibdp_bypass_inst2_vec[3:0];
         inst2_high_expt  = ibuf_ibdp_bypass_inst2_high_expt;
         inst2_ecc_err    = ibuf_ibdp_bypass_inst2_ecc_err;
         inst0_split1     = ibuf_ibdp_bypass_inst0_split1;
         inst1_split1     = ibuf_ibdp_bypass_inst1_split1;
         inst2_split1     = ibuf_ibdp_bypass_inst2_split1;  
         inst0_split0     = ibuf_ibdp_bypass_inst0_split0;
         inst1_split0     = ibuf_ibdp_bypass_inst1_split0;
         inst2_split0     = ibuf_ibdp_bypass_inst2_split0;  
         inst0_fence      = ibuf_ibdp_bypass_inst0_fence;
         inst1_fence      = ibuf_ibdp_bypass_inst1_fence;
         inst2_fence      = ibuf_ibdp_bypass_inst2_fence;  
         inst0_bkpta      = ibuf_ibdp_bypass_inst0_bkpta;
         inst1_bkpta      = ibuf_ibdp_bypass_inst1_bkpta;
         inst2_bkpta      = ibuf_ibdp_bypass_inst2_bkpta;  
         inst0_bkptb      = ibuf_ibdp_bypass_inst0_bkptb;
         inst1_bkptb      = ibuf_ibdp_bypass_inst1_bkptb;
         inst2_bkptb      = ibuf_ibdp_bypass_inst2_bkptb; 
         inst0_no_spec    = ibuf_ibdp_bypass_inst0_no_spec;
         inst1_no_spec    = ibuf_ibdp_bypass_inst1_no_spec;
         inst2_no_spec    = ibuf_ibdp_bypass_inst2_no_spec;
         inst0_vl_pred    = ibuf_ibdp_bypass_inst0_vl_pred;
         inst1_vl_pred    = ibuf_ibdp_bypass_inst1_vl_pred;
         inst2_vl_pred    = ibuf_ibdp_bypass_inst2_vl_pred;
         inst0_vlmul[1:0] = ibuf_ibdp_bypass_inst0_vlmul[1:0];
         inst1_vlmul[1:0] = ibuf_ibdp_bypass_inst1_vlmul[1:0];
         inst2_vlmul[1:0] = ibuf_ibdp_bypass_inst2_vlmul[1:0];
         inst0_vsew[2:0]  = ibuf_ibdp_bypass_inst0_vsew[2:0];
         inst1_vsew[2:0]  = ibuf_ibdp_bypass_inst1_vsew[2:0];
         inst2_vsew[2:0]  = ibuf_ibdp_bypass_inst2_vsew[2:0];
         inst0_vl[7:0]    = ibuf_ibdp_bypass_inst0_vl[7:0];
         inst1_vl[7:0]    = ibuf_ibdp_bypass_inst1_vl[7:0];
         inst2_vl[7:0]    = ibuf_ibdp_bypass_inst2_vl[7:0];
         end
3'b010:  begin
         inst0[31:0]      = ibuf_ibdp_inst0[31:0];
         inst1[31:0]      = ibuf_ibdp_inst1[31:0];
         inst2[31:0]      = ibuf_ibdp_inst2[31:0];
         inst0_pc[14:0]   = ibuf_ibdp_inst0_pc[14:0];
         inst1_pc[14:0]   = ibuf_ibdp_inst1_pc[14:0];
         inst2_pc[14:0]   = ibuf_ibdp_inst2_pc[14:0];
         inst0_vld        = ibuf_ibdp_inst0_valid;
         inst1_vld        = ibuf_ibdp_inst1_valid;
         inst2_vld        = ibuf_ibdp_inst2_valid;
         inst0_expt_vld   = ibuf_ibdp_inst0_expt_vld;
         inst0_vec[3:0]   = ibuf_ibdp_inst0_vec[3:0];
         inst0_high_expt  = ibuf_ibdp_inst0_high_expt;
         inst0_ecc_err    = ibuf_ibdp_inst0_ecc_err;
         inst1_expt_vld   = ibuf_ibdp_inst1_expt_vld;
         inst1_vec[3:0]   = ibuf_ibdp_inst1_vec[3:0];
         inst1_high_expt  = ibuf_ibdp_inst1_high_expt;
         inst1_ecc_err    = ibuf_ibdp_inst1_ecc_err;
         inst2_expt_vld   = ibuf_ibdp_inst2_expt_vld;
         inst2_vec[3:0]   = ibuf_ibdp_inst2_vec[3:0];
         inst2_high_expt  = ibuf_ibdp_inst2_high_expt;
         inst2_ecc_err    = ibuf_ibdp_inst2_ecc_err;
         inst0_split1     = ibuf_ibdp_inst0_split1;
         inst1_split1     = ibuf_ibdp_inst1_split1;
         inst2_split1     = ibuf_ibdp_inst2_split1;  
         inst0_split0     = ibuf_ibdp_inst0_split0;
         inst1_split0     = ibuf_ibdp_inst1_split0;
         inst2_split0     = ibuf_ibdp_inst2_split0;  
         inst0_fence      = ibuf_ibdp_inst0_fence;
         inst1_fence      = ibuf_ibdp_inst1_fence;
         inst2_fence      = ibuf_ibdp_inst2_fence;  
         inst0_bkpta      = ibuf_ibdp_inst0_bkpta;
         inst1_bkpta      = ibuf_ibdp_inst1_bkpta;
         inst2_bkpta      = ibuf_ibdp_inst2_bkpta;  
         inst0_bkptb      = ibuf_ibdp_inst0_bkptb;
         inst1_bkptb      = ibuf_ibdp_inst1_bkptb;
         inst2_bkptb      = ibuf_ibdp_inst2_bkptb;  
         inst0_no_spec    = ibuf_ibdp_inst0_no_spec;
         inst1_no_spec    = ibuf_ibdp_inst1_no_spec;
         inst2_no_spec    = ibuf_ibdp_inst2_no_spec;
         inst0_vl_pred    = ibuf_ibdp_inst0_vl_pred;
         inst1_vl_pred    = ibuf_ibdp_inst1_vl_pred;
         inst2_vl_pred    = ibuf_ibdp_inst2_vl_pred;
         inst0_vlmul[1:0] = ibuf_ibdp_inst0_vlmul[1:0];
         inst1_vlmul[1:0] = ibuf_ibdp_inst1_vlmul[1:0];
         inst2_vlmul[1:0] = ibuf_ibdp_inst2_vlmul[1:0];
         inst0_vsew[2:0]  = ibuf_ibdp_inst0_vsew[2:0];
         inst1_vsew[2:0]  = ibuf_ibdp_inst1_vsew[2:0];
         inst2_vsew[2:0]  = ibuf_ibdp_inst2_vsew[2:0];
         inst0_vl[7:0]    = ibuf_ibdp_inst0_vl[7:0];
         inst1_vl[7:0]    = ibuf_ibdp_inst1_vl[7:0];
         inst2_vl[7:0]    = ibuf_ibdp_inst2_vl[7:0];
         end
3'b001:  begin
         inst0[31:0]      = lbuf_ibdp_inst0[31:0]; 
         inst1[31:0]      = lbuf_ibdp_inst1[31:0];
         inst2[31:0]      = lbuf_ibdp_inst2[31:0];
         inst0_pc[14:0]   = lbuf_ibdp_inst0_pc[14:0];
         inst1_pc[14:0]   = lbuf_ibdp_inst1_pc[14:0];
         inst2_pc[14:0]   = lbuf_ibdp_inst2_pc[14:0];
         inst0_vld        = lbuf_ibdp_inst0_valid;
         inst1_vld        = lbuf_ibdp_inst1_valid;
         inst2_vld        = lbuf_ibdp_inst2_valid;
         inst0_expt_vld   = 1'b0;
         inst0_vec[3:0]   = 4'b0;
         inst0_high_expt  = 1'b0;
         inst0_ecc_err    = 1'b0;
         inst1_expt_vld   = 1'b0;
         inst1_vec[3:0]   = 4'b0;
         inst1_high_expt  = 1'b0;
         inst1_ecc_err    = 1'b0;
         inst2_expt_vld   = 1'b0;
         inst2_vec[3:0]   = 4'b0;
         inst2_high_expt  = 1'b0;
         inst2_ecc_err    = 1'b0;   
         inst0_split1     = lbuf_ibdp_inst0_split1;
         inst1_split1     = lbuf_ibdp_inst1_split1;
         inst2_split1     = lbuf_ibdp_inst2_split1;
         inst0_split0     = lbuf_ibdp_inst0_split0;
         inst1_split0     = lbuf_ibdp_inst1_split0;
         inst2_split0     = lbuf_ibdp_inst2_split0;
         inst0_fence      = lbuf_ibdp_inst0_fence;
         inst1_fence      = lbuf_ibdp_inst1_fence;
         inst2_fence      = lbuf_ibdp_inst2_fence;
         inst0_bkpta      = lbuf_ibdp_inst0_bkpta;
         inst1_bkpta      = lbuf_ibdp_inst1_bkpta;
         inst2_bkpta      = lbuf_ibdp_inst2_bkpta;
         inst0_bkptb      = lbuf_ibdp_inst0_bkptb;
         inst1_bkptb      = lbuf_ibdp_inst1_bkptb;
         inst2_bkptb      = lbuf_ibdp_inst2_bkptb;
         inst0_no_spec    = 1'b0;
         inst1_no_spec    = 1'b0;
         inst2_no_spec    = 1'b0;
         inst0_vl_pred    = 1'b0;
         inst1_vl_pred    = 1'b0;
         inst2_vl_pred    = 1'b0;
         inst0_vlmul[1:0] = lbuf_ibdp_inst0_vlmul[1:0];
         inst1_vlmul[1:0] = lbuf_ibdp_inst1_vlmul[1:0];
         inst2_vlmul[1:0] = lbuf_ibdp_inst2_vlmul[1:0];
         inst0_vsew[2:0]  = lbuf_ibdp_inst0_vsew[2:0];
         inst1_vsew[2:0]  = lbuf_ibdp_inst1_vsew[2:0];
         inst2_vsew[2:0]  = lbuf_ibdp_inst2_vsew[2:0];
         inst0_vl[7:0]    = lbuf_ibdp_inst0_vl[7:0];
         inst1_vl[7:0]    = lbuf_ibdp_inst1_vl[7:0];
         inst2_vl[7:0]    = lbuf_ibdp_inst2_vl[7:0];
         end
default: begin
         inst0[31:0]      = 32'b0;
         inst1[31:0]      = 32'b0;
         inst2[31:0]      = 32'b0;
         inst0_pc[14:0]   = 15'b0;
         inst1_pc[14:0]   = 15'b0;
         inst2_pc[14:0]   = 15'b0;
         inst0_vld        = 1'b0; 
         inst1_vld        = 1'b0;
         inst2_vld        = 1'b0; 
         inst0_expt_vld   = 1'b0;
         inst0_vec[3:0]   = 4'b0;
         inst0_high_expt  = 1'b0;
         inst0_ecc_err    = 1'b0;
         inst1_expt_vld   = 1'b0;
         inst1_vec[3:0]   = 4'b0;
         inst1_high_expt  = 1'b0;
         inst1_ecc_err    = 1'b0;
         inst2_expt_vld   = 1'b0;
         inst2_vec[3:0]   = 4'b0;
         inst2_high_expt  = 1'b0;
         inst2_ecc_err    = 1'b0;   
         inst0_split1     = 1'b0;
         inst1_split1     = 1'b0;
         inst2_split1     = 1'b0;  
         inst0_split0     = 1'b0;
         inst1_split0     = 1'b0;
         inst2_split0     = 1'b0;  
         inst0_fence      = 1'b0;
         inst1_fence      = 1'b0;
         inst2_fence      = 1'b0;  
         inst0_bkpta      = 1'b0;
         inst1_bkpta      = 1'b0;
         inst2_bkpta      = 1'b0;  
         inst0_bkptb      = 1'b0;
         inst1_bkptb      = 1'b0;
         inst2_bkptb      = 1'b0;  
         inst0_no_spec    = 1'b0;
         inst1_no_spec    = 1'b0;
         inst2_no_spec    = 1'b0;
         inst0_vl_pred    = 1'b0;
         inst1_vl_pred    = 1'b0;
         inst2_vl_pred    = 1'b0;
         inst0_vlmul[1:0] = 2'b0; 
         inst1_vlmul[1:0] = 2'b0;
         inst2_vlmul[1:0] = 2'b0;
         inst0_vsew[2:0]  = 3'b0;
         inst1_vsew[2:0]  = 3'b0;
         inst2_vsew[2:0]  = 3'b0;
         inst0_vl[7:0]    = 8'b0;
         inst1_vl[7:0]    = 8'b0;
         inst2_vl[7:0]    = 8'b0;
         end
endcase
// &CombEnd; @861
end

//Three inst vld send to idu
assign ifu_idu_ib_inst0_vld =  inst0_vld;
assign ifu_idu_ib_inst1_vld =  inst1_vld;
assign ifu_idu_ib_inst2_vld =  inst2_vld;
//For had use
assign ifu_had_no_inst      = !inst0_vld;
//Three inst infor send to idu
//if there are any expt inst
//change its opcode to 32'hc4007e00(Nop)
assign ifu_idu_ib_inst0_data[ID_OPCODE:ID_OPCODE-31]    = (inst0_expt_vld)
                                                          ? 32'h00000001 //nop
                                                          : inst0[31:0];
assign ifu_idu_ib_inst1_data[ID_OPCODE:ID_OPCODE-31]    = (inst1_expt_vld)
                                                          ? 32'h00000001 //nop
                                                          : inst1[31:0];
assign ifu_idu_ib_inst2_data[ID_OPCODE:ID_OPCODE-31]    = (inst2_expt_vld)
                                                          ? 32'h00000001 //nop
                                                          : inst2[31:0];
assign ifu_idu_ib_inst0_data[ID_EXPT_VLD]               = inst0_expt_vld  && !inst0_ecc_err;
assign ifu_idu_ib_inst1_data[ID_EXPT_VLD]               = inst1_expt_vld  && !inst1_ecc_err;
assign ifu_idu_ib_inst2_data[ID_EXPT_VLD]               = inst2_expt_vld  && !inst2_ecc_err;
assign ifu_idu_ib_inst0_data[ID_HIGH_HW_EXPT]           = inst0_high_expt && !inst0_ecc_err;
assign ifu_idu_ib_inst1_data[ID_HIGH_HW_EXPT]           = inst1_high_expt && !inst1_ecc_err;
assign ifu_idu_ib_inst2_data[ID_HIGH_HW_EXPT]           = inst2_high_expt && !inst2_ecc_err;
assign ifu_idu_ib_inst0_data[ID_EXPT_VEC:ID_EXPT_VEC-3] = inst0_vec[3:0];
assign ifu_idu_ib_inst1_data[ID_EXPT_VEC:ID_EXPT_VEC-3] = inst1_vec[3:0];
assign ifu_idu_ib_inst2_data[ID_EXPT_VEC:ID_EXPT_VEC-3] = inst2_vec[3:0];
//IFU Pre_decode infor for IDU use
assign ifu_idu_ib_inst0_data[ID_SPLIT_LONG]             = inst0_split1 && !inst0_expt_vld;                                     
assign ifu_idu_ib_inst1_data[ID_SPLIT_LONG]             = inst1_split1 && !inst1_expt_vld;                                     
assign ifu_idu_ib_inst2_data[ID_SPLIT_LONG]             = inst2_split1 && !inst2_expt_vld;
assign ifu_idu_ib_inst0_data[ID_SPLIT_SHORT]            = inst0_split0 && !inst0_expt_vld;                                     
assign ifu_idu_ib_inst1_data[ID_SPLIT_SHORT]            = inst1_split0 && !inst1_expt_vld;                                     
assign ifu_idu_ib_inst2_data[ID_SPLIT_SHORT]            = inst2_split0 && !inst2_expt_vld;
assign ifu_idu_ib_inst0_data[ID_FENCE]                  = inst0_fence  && !inst0_expt_vld;                                     
assign ifu_idu_ib_inst1_data[ID_FENCE]                  = inst1_fence  && !inst1_expt_vld;                                     
assign ifu_idu_ib_inst2_data[ID_FENCE]                  = inst2_fence  && !inst2_expt_vld;                                     
assign ifu_idu_ib_inst0_data[ID_BKPTA_INST]             = inst0_bkpta;                                     
assign ifu_idu_ib_inst1_data[ID_BKPTA_INST]             = inst1_bkpta;                                     
assign ifu_idu_ib_inst2_data[ID_BKPTA_INST]             = inst2_bkpta;                                     
assign ifu_idu_ib_inst0_data[ID_BKPTB_INST]             = inst0_bkptb;                                     
assign ifu_idu_ib_inst1_data[ID_BKPTB_INST]             = inst1_bkptb;                                     
assign ifu_idu_ib_inst2_data[ID_BKPTB_INST]             = inst2_bkptb;                                     
assign ifu_idu_ib_inst0_data[ID_NO_SPEC]                = inst0_no_spec;                                     
assign ifu_idu_ib_inst1_data[ID_NO_SPEC]                = inst1_no_spec;                                     
assign ifu_idu_ib_inst2_data[ID_NO_SPEC]                = inst2_no_spec;                                     
assign ifu_idu_ib_inst0_data[ID_VLMUL:ID_VLMUL-1]       = inst0_vlmul[1:0];
assign ifu_idu_ib_inst1_data[ID_VLMUL:ID_VLMUL-1]       = inst1_vlmul[1:0];
assign ifu_idu_ib_inst2_data[ID_VLMUL:ID_VLMUL-1]       = inst2_vlmul[1:0];
assign ifu_idu_ib_inst0_data[ID_VSEW:ID_VSEW-2]         = inst0_vsew[2:0];
assign ifu_idu_ib_inst1_data[ID_VSEW:ID_VSEW-2]         = inst1_vsew[2:0];
assign ifu_idu_ib_inst2_data[ID_VSEW:ID_VSEW-2]         = inst2_vsew[2:0];
assign ifu_idu_ib_inst0_data[ID_PC:ID_PC-14]            = inst0_pc[14:0];
assign ifu_idu_ib_inst1_data[ID_PC:ID_PC-14]            = inst1_pc[14:0];
assign ifu_idu_ib_inst2_data[ID_PC:ID_PC-14]            = inst2_pc[14:0];
assign ifu_idu_ib_inst0_data[ID_VL:ID_VL-7]             = inst0_vl[7:0];
assign ifu_idu_ib_inst1_data[ID_VL:ID_VL-7]             = inst1_vl[7:0];
assign ifu_idu_ib_inst2_data[ID_VL:ID_VL-7]             = inst2_vl[7:0];
assign ifu_idu_ib_inst0_data[ID_VL_PRED]                = inst0_vl_pred;
assign ifu_idu_ib_inst1_data[ID_VL_PRED]                = inst1_vl_pred;
assign ifu_idu_ib_inst2_data[ID_VL_PRED]                = inst2_vl_pred;

//==========================================================
//               hn_pc_oper pcfifo mask
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_updt_vld_clk"); @929
gated_clk_cell  x_updt_vld_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (updt_vld_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (updt_vld_clk_en   ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @930
//           .clk_out        (updt_vld_clk),//Out Clock @931
//           .external_en    (1'b0), @932
//           .global_en      (cp0_yy_clk_en), @933
//           .local_en       (updt_vld_clk_en),//Local Condition @934
//           .module_en      (cp0_ifu_icg_en) @935
//         ); @936
assign updt_vld_clk_en = //pcfifo_mask_cancel || 
                         pc_oper_updt_vld || 
                         //ldfifo_mask_cancel || 
                         // ld_updt_vld || 
                         ib_data_vld;

//Update
always @(posedge updt_vld_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    pc_oper_updt_vld <= 1'b0;
  else if(pcfifo_mask_cancel)
    pc_oper_updt_vld <= 1'b0;
  else
    pc_oper_updt_vld <= pc_oper_updt_vld_pre;
end

always @(posedge fifo_mask_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    hn_pc_oper_updt_val[7:0] <= 8'b0;
  else
    hn_pc_oper_updt_val[7:0] <= hn_pc_oper_updt_val_pre[7:0];
end

//Infor Generate
assign pcfifo_mask_cancel           = ibctrl_ibdp_cancel;
assign hn_pc_oper_updt_val_pre[7:0] = (mispred_stall || iu_ifu_pcfifo_full || buf_stall)
                                    ? (ibdp_pcfifo_if_hn_pc_oper[7:0])
                                    : (ibdp_pcfifo_if_hn_pc_oper[7:0] & pc_oper_over_mask[7:0]);
assign pc_oper_updt_vld_pre         = ib_data_vld && 
                                      !ind_btb_rd_stall && //vld updt to 0
                                                           //Because ind_btb_stall will only occur in first cycle
                                                           //And force stall ip_ib data one cycle
                                      (
                                        mispred_stall || //vld updt to last cycle value
                                        fifo_full_stall || //vld updt to last cycle value
                                        fifo_stall || //vld updt to new value
                                        buf_stall // vld updt to last cycle value
                                      );

// &Instance("gated_clk_cell","x_fifo_mask_clk"); @978
gated_clk_cell  x_fifo_mask_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (fifo_mask_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (fifo_mask_clk_en  ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @979
//           .clk_out        (fifo_mask_clk),//Out Clock @980
//           .external_en    (1'b0), @981
//           .global_en      (cp0_yy_clk_en), @982
//           .local_en       (fifo_mask_clk_en),//Local Condition @983
//           .module_en      (cp0_ifu_icg_en) @984
//         ); @985
assign fifo_mask_clk_en = pc_oper_updt_vld_pre; 

assign mispred_stall          = ibctrl_ibdp_mispred_stall;
assign fifo_stall             = ibctrl_ibdp_fifo_stall;
assign buf_stall              = ibctrl_ibdp_buf_stall;
assign fifo_full_stall        = ibctrl_ibdp_fifo_full_stall;
assign ind_btb_rd_stall       = ibctrl_ibdp_ind_btb_rd_stall;
assign pc_oper_over_mask[7:0] = pcfifo_if_ibdp_over_mask[7:0];

//Debug_infor
assign ibdp_debug_mmu_deny_vld = ipdp_ibdp_hn_mmu_acc_deny; 
assign ibdp_debug_inst0_vld    = inst0_vld;
assign ibdp_debug_inst1_vld    = inst1_vld;
assign ibdp_debug_inst2_vld    = inst2_vld;

// &ModuleEnd;                         @1001
endmodule


