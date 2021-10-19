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
module ct_ifu_ipdp(
  addrgen_ipdp_chgflw_vl,
  addrgen_ipdp_chgflw_vlmul,
  addrgen_ipdp_chgflw_vsew,
  addrgen_xx_pcload,
  bht_ipdp_pre_array_data_ntake,
  bht_ipdp_pre_array_data_taken,
  bht_ipdp_pre_offset_onehot,
  bht_ipdp_sel_array_result,
  bht_ipdp_vghr,
  cp0_idu_cskyee,
  cp0_idu_frm,
  cp0_idu_fs,
  cp0_ifu_btb_en,
  cp0_ifu_icg_en,
  cp0_ifu_vl,
  cp0_ifu_vlmul,
  cp0_ifu_vsetvli_pred_disable,
  cp0_ifu_vsew,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  had_ifu_ir,
  had_ifu_ir_vld,
  ibctrl_ipdp_chgflw_vl,
  ibctrl_ipdp_chgflw_vlmul,
  ibctrl_ipdp_chgflw_vsew,
  ibctrl_ipdp_pcload,
  ifdp_ipdp_acc_err,
  ifdp_ipdp_bkpta,
  ifdp_ipdp_bkptb,
  ifdp_ipdp_btb_way0_pred,
  ifdp_ipdp_btb_way0_tag,
  ifdp_ipdp_btb_way0_target,
  ifdp_ipdp_btb_way0_vld,
  ifdp_ipdp_btb_way1_pred,
  ifdp_ipdp_btb_way1_tag,
  ifdp_ipdp_btb_way1_target,
  ifdp_ipdp_btb_way1_vld,
  ifdp_ipdp_btb_way2_pred,
  ifdp_ipdp_btb_way2_tag,
  ifdp_ipdp_btb_way2_target,
  ifdp_ipdp_btb_way2_vld,
  ifdp_ipdp_btb_way3_pred,
  ifdp_ipdp_btb_way3_tag,
  ifdp_ipdp_btb_way3_target,
  ifdp_ipdp_btb_way3_vld,
  ifdp_ipdp_h1_inst_high_way0,
  ifdp_ipdp_h1_inst_high_way1,
  ifdp_ipdp_h1_inst_low_way0,
  ifdp_ipdp_h1_inst_low_way1,
  ifdp_ipdp_h1_precode_way0,
  ifdp_ipdp_h1_precode_way1,
  ifdp_ipdp_h2_inst_high_way0,
  ifdp_ipdp_h2_inst_high_way1,
  ifdp_ipdp_h2_inst_low_way0,
  ifdp_ipdp_h2_inst_low_way1,
  ifdp_ipdp_h2_precode_way0,
  ifdp_ipdp_h2_precode_way1,
  ifdp_ipdp_h3_inst_high_way0,
  ifdp_ipdp_h3_inst_high_way1,
  ifdp_ipdp_h3_inst_low_way0,
  ifdp_ipdp_h3_inst_low_way1,
  ifdp_ipdp_h3_precode_way0,
  ifdp_ipdp_h3_precode_way1,
  ifdp_ipdp_h4_inst_high_way0,
  ifdp_ipdp_h4_inst_high_way1,
  ifdp_ipdp_h4_inst_low_way0,
  ifdp_ipdp_h4_inst_low_way1,
  ifdp_ipdp_h4_precode_way0,
  ifdp_ipdp_h4_precode_way1,
  ifdp_ipdp_h5_inst_high_way0,
  ifdp_ipdp_h5_inst_high_way1,
  ifdp_ipdp_h5_inst_low_way0,
  ifdp_ipdp_h5_inst_low_way1,
  ifdp_ipdp_h5_precode_way0,
  ifdp_ipdp_h5_precode_way1,
  ifdp_ipdp_h6_inst_high_way0,
  ifdp_ipdp_h6_inst_high_way1,
  ifdp_ipdp_h6_inst_low_way0,
  ifdp_ipdp_h6_inst_low_way1,
  ifdp_ipdp_h6_precode_way0,
  ifdp_ipdp_h6_precode_way1,
  ifdp_ipdp_h7_inst_high_way0,
  ifdp_ipdp_h7_inst_high_way1,
  ifdp_ipdp_h7_inst_low_way0,
  ifdp_ipdp_h7_inst_low_way1,
  ifdp_ipdp_h7_precode_way0,
  ifdp_ipdp_h7_precode_way1,
  ifdp_ipdp_h8_inst_high_way0,
  ifdp_ipdp_h8_inst_high_way1,
  ifdp_ipdp_h8_inst_low_way0,
  ifdp_ipdp_h8_inst_low_way1,
  ifdp_ipdp_h8_precode_way0,
  ifdp_ipdp_h8_precode_way1,
  ifdp_ipdp_l0_btb_counter,
  ifdp_ipdp_l0_btb_entry_hit,
  ifdp_ipdp_l0_btb_hit,
  ifdp_ipdp_l0_btb_mispred_pc,
  ifdp_ipdp_l0_btb_ras,
  ifdp_ipdp_l0_btb_target,
  ifdp_ipdp_l0_btb_way0_high_hit,
  ifdp_ipdp_l0_btb_way0_low_hit,
  ifdp_ipdp_l0_btb_way1_high_hit,
  ifdp_ipdp_l0_btb_way1_low_hit,
  ifdp_ipdp_l0_btb_way2_high_hit,
  ifdp_ipdp_l0_btb_way2_low_hit,
  ifdp_ipdp_l0_btb_way3_high_hit,
  ifdp_ipdp_l0_btb_way3_low_hit,
  ifdp_ipdp_l0_btb_way_pred,
  ifdp_ipdp_mmu_pgflt,
  ifdp_ipdp_sfp_hit_pc_lo,
  ifdp_ipdp_sfp_hit_type,
  ifdp_ipdp_sfp_pc_hit,
  ifdp_ipdp_vpc,
  ipctrl_ipdp_bht_vld,
  ipctrl_ipdp_br_more_than_one_stall,
  ipctrl_ipdp_branch,
  ipctrl_ipdp_bry_data,
  ipctrl_ipdp_chgflw_pc,
  ipctrl_ipdp_con_br,
  ipctrl_ipdp_h0_update_vld,
  ipctrl_ipdp_h0_updt_gateclk_en,
  ipctrl_ipdp_hn_con_br,
  ipctrl_ipdp_icache_way0_hit,
  ipctrl_ipdp_icache_way0_hit_short,
  ipctrl_ipdp_if_pcload,
  ipctrl_ipdp_ip_data_vld,
  ipctrl_ipdp_ip_mistaken,
  ipctrl_ipdp_ip_pcload,
  ipctrl_ipdp_l0_btb_hit,
  ipctrl_ipdp_pipe_cancel,
  ipctrl_ipdp_pipe_stall,
  ipctrl_ipdp_pipe_vld,
  ipctrl_ipdp_pipe_vld_for_gateclk,
  ipctrl_ipdp_self_stall,
  ipctrl_ipdp_vpc_mask,
  ipctrl_ipdp_vpc_next,
  ipctrl_ipdp_vpc_onehot,
  ipdp_bht_h0_con_br,
  ipdp_bht_vpc,
  ipdp_btb_index_pc,
  ipdp_btb_target_pc,
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
  ipdp_ibdp_vl_reg,
  ipdp_ibdp_vlmul_reg,
  ipdp_ibdp_vpc,
  ipdp_ibdp_vsew_reg,
  ipdp_ind_btb_jmp_detect,
  ipdp_ipctrl_bht_data,
  ipdp_ipctrl_bht_result,
  ipdp_ipctrl_btb_way0_pred,
  ipdp_ipctrl_btb_way0_target,
  ipdp_ipctrl_btb_way1_pred,
  ipdp_ipctrl_btb_way1_target,
  ipdp_ipctrl_btb_way2_pred,
  ipdp_ipctrl_btb_way2_target,
  ipdp_ipctrl_btb_way3_pred,
  ipdp_ipctrl_btb_way3_target,
  ipdp_ipctrl_con_br_first_branch,
  ipdp_ipctrl_con_br_more_than_one,
  ipdp_ipctrl_h0_ab_br,
  ipdp_ipctrl_h0_br,
  ipdp_ipctrl_h0_con_br,
  ipdp_ipctrl_h0_vld,
  ipdp_ipctrl_h8_br,
  ipdp_ipctrl_inst_32,
  ipdp_ipctrl_ip_expt_vld,
  ipdp_ipctrl_l0_btb_hit_way,
  ipdp_ipctrl_l0_btb_mispred_pc,
  ipdp_ipctrl_l0_btb_ras,
  ipdp_ipctrl_l0_btb_vld,
  ipdp_ipctrl_no_br,
  ipdp_ipctrl_vpc,
  ipdp_ipctrl_w0_ab_br,
  ipdp_ipctrl_w0_br,
  ipdp_ipctrl_w1_ab_br,
  ipdp_ipctrl_w1_br,
  ipdp_ipctrl_way0_32,
  ipdp_ipctrl_way1_32,
  ipdp_l0_btb_ras_pc,
  ipdp_l0_btb_ras_push,
  ipdp_lbuf_vl_reg,
  ipdp_lbuf_vlmul_reg,
  ipdp_lbuf_vsew_reg,
  iu_ifu_chgflw_vl,
  iu_ifu_chgflw_vld,
  iu_ifu_chgflw_vlmul,
  iu_ifu_chgflw_vsew,
  lbuf_ipdp_lbuf_active,
  lbuf_ipdp_updt_vl,
  lbuf_ipdp_updt_vlmul,
  lbuf_ipdp_updt_vsew,
  lbuf_ipdp_vtype_updt_vld,
  mmu_ifu_deny,
  pad_yy_icg_scan_en,
  pcgen_ipctrl_pipe_cancel,
  ras_ipdp_data_vld,
  ras_ipdp_pc,
  rtu_ifu_chgflw_vld,
  rtu_ifu_flush,
  rtu_ifu_xx_expt_vld,
  rtu_yy_xx_dbgon
);

// &Ports; @23
input   [7 :0]  addrgen_ipdp_chgflw_vl;            
input   [1 :0]  addrgen_ipdp_chgflw_vlmul;         
input   [2 :0]  addrgen_ipdp_chgflw_vsew;          
input           addrgen_xx_pcload;                 
input   [31:0]  bht_ipdp_pre_array_data_ntake;     
input   [31:0]  bht_ipdp_pre_array_data_taken;     
input   [15:0]  bht_ipdp_pre_offset_onehot;        
input   [1 :0]  bht_ipdp_sel_array_result;         
input   [21:0]  bht_ipdp_vghr;                     
input           cp0_idu_cskyee;                    
input   [2 :0]  cp0_idu_frm;                       
input   [1 :0]  cp0_idu_fs;                        
input           cp0_ifu_btb_en;                    
input           cp0_ifu_icg_en;                    
input   [7 :0]  cp0_ifu_vl;                        
input   [1 :0]  cp0_ifu_vlmul;                     
input           cp0_ifu_vsetvli_pred_disable;      
input   [2 :0]  cp0_ifu_vsew;                      
input           cp0_yy_clk_en;                     
input           cpurst_b;                          
input           forever_cpuclk;                    
input   [31:0]  had_ifu_ir;                        
input           had_ifu_ir_vld;                    
input   [7 :0]  ibctrl_ipdp_chgflw_vl;             
input   [1 :0]  ibctrl_ipdp_chgflw_vlmul;          
input   [2 :0]  ibctrl_ipdp_chgflw_vsew;           
input           ibctrl_ipdp_pcload;                
input           ifdp_ipdp_acc_err;                 
input   [7 :0]  ifdp_ipdp_bkpta;                   
input   [7 :0]  ifdp_ipdp_bkptb;                   
input   [1 :0]  ifdp_ipdp_btb_way0_pred;           
input   [9 :0]  ifdp_ipdp_btb_way0_tag;            
input   [19:0]  ifdp_ipdp_btb_way0_target;         
input           ifdp_ipdp_btb_way0_vld;            
input   [1 :0]  ifdp_ipdp_btb_way1_pred;           
input   [9 :0]  ifdp_ipdp_btb_way1_tag;            
input   [19:0]  ifdp_ipdp_btb_way1_target;         
input           ifdp_ipdp_btb_way1_vld;            
input   [1 :0]  ifdp_ipdp_btb_way2_pred;           
input   [9 :0]  ifdp_ipdp_btb_way2_tag;            
input   [19:0]  ifdp_ipdp_btb_way2_target;         
input           ifdp_ipdp_btb_way2_vld;            
input   [1 :0]  ifdp_ipdp_btb_way3_pred;           
input   [9 :0]  ifdp_ipdp_btb_way3_tag;            
input   [19:0]  ifdp_ipdp_btb_way3_target;         
input           ifdp_ipdp_btb_way3_vld;            
input   [13:0]  ifdp_ipdp_h1_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h1_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h1_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h1_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h1_precode_way0;         
input   [3 :0]  ifdp_ipdp_h1_precode_way1;         
input   [13:0]  ifdp_ipdp_h2_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h2_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h2_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h2_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h2_precode_way0;         
input   [3 :0]  ifdp_ipdp_h2_precode_way1;         
input   [13:0]  ifdp_ipdp_h3_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h3_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h3_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h3_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h3_precode_way0;         
input   [3 :0]  ifdp_ipdp_h3_precode_way1;         
input   [13:0]  ifdp_ipdp_h4_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h4_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h4_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h4_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h4_precode_way0;         
input   [3 :0]  ifdp_ipdp_h4_precode_way1;         
input   [13:0]  ifdp_ipdp_h5_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h5_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h5_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h5_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h5_precode_way0;         
input   [3 :0]  ifdp_ipdp_h5_precode_way1;         
input   [13:0]  ifdp_ipdp_h6_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h6_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h6_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h6_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h6_precode_way0;         
input   [3 :0]  ifdp_ipdp_h6_precode_way1;         
input   [13:0]  ifdp_ipdp_h7_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h7_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h7_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h7_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h7_precode_way0;         
input   [3 :0]  ifdp_ipdp_h7_precode_way1;         
input   [13:0]  ifdp_ipdp_h8_inst_high_way0;       
input   [13:0]  ifdp_ipdp_h8_inst_high_way1;       
input   [1 :0]  ifdp_ipdp_h8_inst_low_way0;        
input   [1 :0]  ifdp_ipdp_h8_inst_low_way1;        
input   [3 :0]  ifdp_ipdp_h8_precode_way0;         
input   [3 :0]  ifdp_ipdp_h8_precode_way1;         
input           ifdp_ipdp_l0_btb_counter;          
input   [15:0]  ifdp_ipdp_l0_btb_entry_hit;        
input           ifdp_ipdp_l0_btb_hit;              
input   [38:0]  ifdp_ipdp_l0_btb_mispred_pc;       
input           ifdp_ipdp_l0_btb_ras;              
input   [38:0]  ifdp_ipdp_l0_btb_target;           
input           ifdp_ipdp_l0_btb_way0_high_hit;    
input           ifdp_ipdp_l0_btb_way0_low_hit;     
input           ifdp_ipdp_l0_btb_way1_high_hit;    
input           ifdp_ipdp_l0_btb_way1_low_hit;     
input           ifdp_ipdp_l0_btb_way2_high_hit;    
input           ifdp_ipdp_l0_btb_way2_low_hit;     
input           ifdp_ipdp_l0_btb_way3_high_hit;    
input           ifdp_ipdp_l0_btb_way3_low_hit;     
input   [1 :0]  ifdp_ipdp_l0_btb_way_pred;         
input           ifdp_ipdp_mmu_pgflt;               
input   [2 :0]  ifdp_ipdp_sfp_hit_pc_lo;           
input   [3 :0]  ifdp_ipdp_sfp_hit_type;            
input           ifdp_ipdp_sfp_pc_hit;              
input   [38:0]  ifdp_ipdp_vpc;                     
input           ipctrl_ipdp_bht_vld;               
input           ipctrl_ipdp_br_more_than_one_stall; 
input   [7 :0]  ipctrl_ipdp_branch;                
input   [7 :0]  ipctrl_ipdp_bry_data;              
input   [38:0]  ipctrl_ipdp_chgflw_pc;             
input           ipctrl_ipdp_con_br;                
input           ipctrl_ipdp_h0_update_vld;         
input           ipctrl_ipdp_h0_updt_gateclk_en;    
input   [7 :0]  ipctrl_ipdp_hn_con_br;             
input           ipctrl_ipdp_icache_way0_hit;       
input           ipctrl_ipdp_icache_way0_hit_short; 
input           ipctrl_ipdp_if_pcload;             
input           ipctrl_ipdp_ip_data_vld;           
input           ipctrl_ipdp_ip_mistaken;           
input           ipctrl_ipdp_ip_pcload;             
input           ipctrl_ipdp_l0_btb_hit;            
input           ipctrl_ipdp_pipe_cancel;           
input           ipctrl_ipdp_pipe_stall;            
input           ipctrl_ipdp_pipe_vld;              
input           ipctrl_ipdp_pipe_vld_for_gateclk;  
input           ipctrl_ipdp_self_stall;            
input   [7 :0]  ipctrl_ipdp_vpc_mask;              
input   [2 :0]  ipctrl_ipdp_vpc_next;              
input   [7 :0]  ipctrl_ipdp_vpc_onehot;            
input   [7 :0]  iu_ifu_chgflw_vl;                  
input           iu_ifu_chgflw_vld;                 
input   [1 :0]  iu_ifu_chgflw_vlmul;               
input   [2 :0]  iu_ifu_chgflw_vsew;                
input           lbuf_ipdp_lbuf_active;             
input   [7 :0]  lbuf_ipdp_updt_vl;                 
input   [1 :0]  lbuf_ipdp_updt_vlmul;              
input   [2 :0]  lbuf_ipdp_updt_vsew;               
input           lbuf_ipdp_vtype_updt_vld;          
input           mmu_ifu_deny;                      
input           pad_yy_icg_scan_en;                
input           pcgen_ipctrl_pipe_cancel;          
input           ras_ipdp_data_vld;                 
input   [38:0]  ras_ipdp_pc;                       
input           rtu_ifu_chgflw_vld;                
input           rtu_ifu_flush;                     
input           rtu_ifu_xx_expt_vld;               
input           rtu_yy_xx_dbgon;                   
output          ipdp_bht_h0_con_br;                
output  [38:0]  ipdp_bht_vpc;                      
output  [38:0]  ipdp_btb_index_pc;                 
output  [19:0]  ipdp_btb_target_pc;                
output  [1 :0]  ipdp_ibdp_bht_pre_result;          
output          ipdp_ibdp_bht_result;              
output  [1 :0]  ipdp_ibdp_bht_sel_result;          
output  [38:0]  ipdp_ibdp_branch_base;             
output          ipdp_ibdp_branch_btb_miss;         
output  [20:0]  ipdp_ibdp_branch_offset;           
output  [38:0]  ipdp_ibdp_branch_result;           
output  [7 :0]  ipdp_ibdp_branch_vl;               
output  [1 :0]  ipdp_ibdp_branch_vlmul;            
output  [2 :0]  ipdp_ibdp_branch_vsew;             
output  [1 :0]  ipdp_ibdp_branch_way_pred;         
output  [38:0]  ipdp_ibdp_btb_index_pc;            
output  [7 :0]  ipdp_ibdp_chgflw_mask;             
output  [3 :0]  ipdp_ibdp_chgflw_num;              
output          ipdp_ibdp_chgflw_num_vld;          
output  [7 :0]  ipdp_ibdp_chgflw_vl;               
output  [1 :0]  ipdp_ibdp_chgflw_vlmul;            
output  [2 :0]  ipdp_ibdp_chgflw_vsew;             
output  [38:0]  ipdp_ibdp_con_br_cur_pc;           
output  [3 :0]  ipdp_ibdp_con_br_half_num;         
output          ipdp_ibdp_con_br_inst_32;          
output  [3 :0]  ipdp_ibdp_con_br_num;              
output          ipdp_ibdp_con_br_num_vld;          
output  [20:0]  ipdp_ibdp_con_br_offset;           
output          ipdp_ibdp_h0_bkpta;                
output          ipdp_ibdp_h0_bkptb;                
output          ipdp_ibdp_h0_con_br;               
output  [35:0]  ipdp_ibdp_h0_cur_pc;               
output  [15:0]  ipdp_ibdp_h0_data;                 
output          ipdp_ibdp_h0_fence;                
output          ipdp_ibdp_h0_high_expt;            
output          ipdp_ibdp_h0_ldst;                 
output          ipdp_ibdp_h0_no_spec;              
output          ipdp_ibdp_h0_spe_vld;              
output          ipdp_ibdp_h0_split0;               
output  [2 :0]  ipdp_ibdp_h0_split0_type;          
output          ipdp_ibdp_h0_split1;               
output  [2 :0]  ipdp_ibdp_h0_split1_type;          
output  [7 :0]  ipdp_ibdp_h0_vl;                   
output          ipdp_ibdp_h0_vl_pred;              
output          ipdp_ibdp_h0_vld;                  
output  [1 :0]  ipdp_ibdp_h0_vlmul;                
output          ipdp_ibdp_h0_vsetvli;              
output  [2 :0]  ipdp_ibdp_h0_vsew;                 
output  [2 :0]  ipdp_ibdp_h1_base;                 
output  [15:0]  ipdp_ibdp_h1_data;                 
output  [2 :0]  ipdp_ibdp_h1_split0_type;          
output  [2 :0]  ipdp_ibdp_h1_split1_type;          
output  [7 :0]  ipdp_ibdp_h1_vl;                   
output  [1 :0]  ipdp_ibdp_h1_vlmul;                
output  [2 :0]  ipdp_ibdp_h1_vsew;                 
output  [2 :0]  ipdp_ibdp_h2_base;                 
output  [15:0]  ipdp_ibdp_h2_data;                 
output  [2 :0]  ipdp_ibdp_h2_split0_type;          
output  [2 :0]  ipdp_ibdp_h2_split1_type;          
output  [7 :0]  ipdp_ibdp_h2_vl;                   
output  [1 :0]  ipdp_ibdp_h2_vlmul;                
output  [2 :0]  ipdp_ibdp_h2_vsew;                 
output  [2 :0]  ipdp_ibdp_h3_base;                 
output  [15:0]  ipdp_ibdp_h3_data;                 
output  [2 :0]  ipdp_ibdp_h3_split0_type;          
output  [2 :0]  ipdp_ibdp_h3_split1_type;          
output  [7 :0]  ipdp_ibdp_h3_vl;                   
output  [1 :0]  ipdp_ibdp_h3_vlmul;                
output  [2 :0]  ipdp_ibdp_h3_vsew;                 
output  [2 :0]  ipdp_ibdp_h4_base;                 
output  [15:0]  ipdp_ibdp_h4_data;                 
output  [2 :0]  ipdp_ibdp_h4_split0_type;          
output  [2 :0]  ipdp_ibdp_h4_split1_type;          
output  [7 :0]  ipdp_ibdp_h4_vl;                   
output  [1 :0]  ipdp_ibdp_h4_vlmul;                
output  [2 :0]  ipdp_ibdp_h4_vsew;                 
output  [2 :0]  ipdp_ibdp_h5_base;                 
output  [15:0]  ipdp_ibdp_h5_data;                 
output  [2 :0]  ipdp_ibdp_h5_split0_type;          
output  [2 :0]  ipdp_ibdp_h5_split1_type;          
output  [7 :0]  ipdp_ibdp_h5_vl;                   
output  [1 :0]  ipdp_ibdp_h5_vlmul;                
output  [2 :0]  ipdp_ibdp_h5_vsew;                 
output  [2 :0]  ipdp_ibdp_h6_base;                 
output  [15:0]  ipdp_ibdp_h6_data;                 
output  [2 :0]  ipdp_ibdp_h6_split0_type;          
output  [2 :0]  ipdp_ibdp_h6_split1_type;          
output  [7 :0]  ipdp_ibdp_h6_vl;                   
output  [1 :0]  ipdp_ibdp_h6_vlmul;                
output  [2 :0]  ipdp_ibdp_h6_vsew;                 
output  [2 :0]  ipdp_ibdp_h7_base;                 
output  [15:0]  ipdp_ibdp_h7_data;                 
output  [2 :0]  ipdp_ibdp_h7_split0_type;          
output  [2 :0]  ipdp_ibdp_h7_split1_type;          
output  [7 :0]  ipdp_ibdp_h7_vl;                   
output  [1 :0]  ipdp_ibdp_h7_vlmul;                
output  [2 :0]  ipdp_ibdp_h7_vsew;                 
output  [2 :0]  ipdp_ibdp_h8_base;                 
output  [15:0]  ipdp_ibdp_h8_data;                 
output  [2 :0]  ipdp_ibdp_h8_split0_type;          
output  [2 :0]  ipdp_ibdp_h8_split1_type;          
output  [7 :0]  ipdp_ibdp_h8_vl;                   
output  [1 :0]  ipdp_ibdp_h8_vlmul;                
output  [2 :0]  ipdp_ibdp_h8_vsew;                 
output  [7 :0]  ipdp_ibdp_hn_32_start;             
output  [7 :0]  ipdp_ibdp_hn_ab_br;                
output          ipdp_ibdp_hn_acc_err;              
output  [7 :0]  ipdp_ibdp_hn_auipc;                
output  [7 :0]  ipdp_ibdp_hn_bkpta;                
output          ipdp_ibdp_hn_bkpta_vld;            
output  [7 :0]  ipdp_ibdp_hn_bkptb;                
output          ipdp_ibdp_hn_bkptb_vld;            
output  [7 :0]  ipdp_ibdp_hn_chgflw;               
output  [7 :0]  ipdp_ibdp_hn_con_br;               
output  [7 :0]  ipdp_ibdp_hn_dst_vld;              
output  [7 :0]  ipdp_ibdp_hn_fence;                
output  [7 :0]  ipdp_ibdp_hn_ind_br;               
output  [7 :0]  ipdp_ibdp_hn_jal;                  
output  [7 :0]  ipdp_ibdp_hn_jalr;                 
output  [7 :0]  ipdp_ibdp_hn_ldst;                 
output          ipdp_ibdp_hn_mmu_acc_deny;         
output  [7 :0]  ipdp_ibdp_hn_no_spec;              
output          ipdp_ibdp_hn_no_spec_vld;          
output  [7 :0]  ipdp_ibdp_hn_pc_oper;              
output  [7 :0]  ipdp_ibdp_hn_pcall;                
output          ipdp_ibdp_hn_pgflt;                
output  [7 :0]  ipdp_ibdp_hn_preturn;              
output  [7 :0]  ipdp_ibdp_hn_split0;               
output  [7 :0]  ipdp_ibdp_hn_split1;               
output  [7 :0]  ipdp_ibdp_hn_vl_pred;              
output  [7 :0]  ipdp_ibdp_hn_vld;                  
output  [7 :0]  ipdp_ibdp_hn_vsetvli;              
output  [20:0]  ipdp_ibdp_ind_br_offset;           
output  [15:0]  ipdp_ibdp_l0_btb_entry_hit;        
output          ipdp_ibdp_l0_btb_hit;              
output  [38:0]  ipdp_ibdp_l0_btb_mispred_pc;       
output          ipdp_ibdp_l0_btb_ras;              
output          ipdp_ibdp_l0_btb_ras_pc_hit;       
output          ipdp_ibdp_l0_btb_update_cnt_bit;   
output          ipdp_ibdp_l0_btb_update_vld;       
output          ipdp_ibdp_l0_btb_update_vld_bit;   
output  [3 :0]  ipdp_ibdp_l0_btb_wen;              
output  [3 :0]  ipdp_ibdp_no_chgflw_num;           
output  [38:0]  ipdp_ibdp_ras_push_pc;             
output  [38:0]  ipdp_ibdp_ras_target_pc;           
output  [21:0]  ipdp_ibdp_vghr;                    
output  [7 :0]  ipdp_ibdp_vl_reg;                  
output  [1 :0]  ipdp_ibdp_vlmul_reg;               
output  [38:0]  ipdp_ibdp_vpc;                     
output  [2 :0]  ipdp_ibdp_vsew_reg;                
output          ipdp_ind_btb_jmp_detect;           
output  [1 :0]  ipdp_ipctrl_bht_data;              
output          ipdp_ipctrl_bht_result;            
output  [1 :0]  ipdp_ipctrl_btb_way0_pred;         
output  [19:0]  ipdp_ipctrl_btb_way0_target;       
output  [1 :0]  ipdp_ipctrl_btb_way1_pred;         
output  [19:0]  ipdp_ipctrl_btb_way1_target;       
output  [1 :0]  ipdp_ipctrl_btb_way2_pred;         
output  [19:0]  ipdp_ipctrl_btb_way2_target;       
output  [1 :0]  ipdp_ipctrl_btb_way3_pred;         
output  [19:0]  ipdp_ipctrl_btb_way3_target;       
output          ipdp_ipctrl_con_br_first_branch;   
output          ipdp_ipctrl_con_br_more_than_one;  
output          ipdp_ipctrl_h0_ab_br;              
output          ipdp_ipctrl_h0_br;                 
output          ipdp_ipctrl_h0_con_br;             
output          ipdp_ipctrl_h0_vld;                
output          ipdp_ipctrl_h8_br;                 
output  [7 :0]  ipdp_ipctrl_inst_32;               
output          ipdp_ipctrl_ip_expt_vld;           
output  [3 :0]  ipdp_ipctrl_l0_btb_hit_way;        
output  [38:0]  ipdp_ipctrl_l0_btb_mispred_pc;     
output          ipdp_ipctrl_l0_btb_ras;            
output          ipdp_ipctrl_l0_btb_vld;            
output          ipdp_ipctrl_no_br;                 
output  [38:0]  ipdp_ipctrl_vpc;                   
output  [7 :0]  ipdp_ipctrl_w0_ab_br;              
output  [7 :0]  ipdp_ipctrl_w0_br;                 
output  [7 :0]  ipdp_ipctrl_w1_ab_br;              
output  [7 :0]  ipdp_ipctrl_w1_br;                 
output  [7 :0]  ipdp_ipctrl_way0_32;               
output  [7 :0]  ipdp_ipctrl_way1_32;               
output  [38:0]  ipdp_l0_btb_ras_pc;                
output          ipdp_l0_btb_ras_push;              
output  [7 :0]  ipdp_lbuf_vl_reg;                  
output  [1 :0]  ipdp_lbuf_vlmul_reg;               
output  [2 :0]  ipdp_lbuf_vsew_reg;                

// &Regs; @24
reg     [7 :0]  ab_br_after_head;                  
reg     [7 :0]  auipc_after_head;                  
reg     [38:0]  base_pc_branch;                    
reg     [38:0]  base_pc_con_br;                    
reg     [1 :0]  bht_pre_result;                    
reg     [7 :0]  bkpta_after_head;                  
reg     [7 :0]  bkptb_after_head;                  
reg     [7 :0]  bry_data_after_head;               
reg     [1 :0]  btb_branch_pred;                   
reg     [9 :0]  btb_branch_tag;                    
reg     [19:0]  btb_branch_target;                 
reg             btb_branch_way_vld;                
reg     [38:0]  btb_index_pc;                      
reg     [7 :0]  chgflw_after_head;                 
reg     [7 :0]  chgflw_mask;                       
reg     [7 :0]  chgflw_vl;                         
reg     [1 :0]  chgflw_vlmul;                      
reg     [2 :0]  chgflw_vsew;                       
reg     [7 :0]  con_br_after_head;                 
reg             con_br_first_branch;               
reg     [7 :0]  con_br_vl;                         
reg     [1 :0]  con_br_vlmul;                      
reg     [7 :0]  con_br_vmask;                      
reg     [2 :0]  con_br_vsew;                       
reg     [7 :0]  dst_vld_after_head;                
reg     [7 :0]  fence_after_head;                  
reg             h0_ab_br;                          
reg             h0_auipc;                          
reg             h0_bkpta;                          
reg             h0_bkptb;                          
reg             h0_br;                             
reg             h0_chgflw;                         
reg             h0_con_br;                         
reg     [35:0]  h0_cur_pc;                         
reg     [15:0]  h0_data;                           
reg             h0_dst_vld;                        
reg             h0_jal;                            
reg             h0_jalr;                           
reg             h0_no_spec;                        
reg             h0_pc_oper;                        
reg             h0_vl_pred;                        
reg             h0_vl_pred_raw;                    
reg             h0_vld;                            
reg             h0_vld_dup;                        
reg     [2 :0]  h1_base_after_head;                
reg     [15:0]  h1_data_after_head;                
reg     [2 :0]  h1_split0_type_after_head;         
reg     [2 :0]  h1_split1_type_after_head;         
reg     [7 :0]  h1_vl_after_head;                  
reg     [1 :0]  h1_vlmul_after_head;               
reg     [2 :0]  h1_vsew_after_head;                
reg     [2 :0]  h2_base_after_head;                
reg     [15:0]  h2_data_after_head;                
reg     [2 :0]  h2_split0_type_after_head;         
reg     [2 :0]  h2_split1_type_after_head;         
reg     [7 :0]  h2_vl_after_head;                  
reg     [1 :0]  h2_vlmul_after_head;               
reg     [2 :0]  h2_vsew_after_head;                
reg     [2 :0]  h3_base_after_head;                
reg     [15:0]  h3_data_after_head;                
reg     [2 :0]  h3_split0_type_after_head;         
reg     [2 :0]  h3_split1_type_after_head;         
reg     [7 :0]  h3_vl_after_head;                  
reg     [1 :0]  h3_vlmul_after_head;               
reg     [2 :0]  h3_vsew_after_head;                
reg     [2 :0]  h4_base_after_head;                
reg     [15:0]  h4_data_after_head;                
reg     [2 :0]  h4_split0_type_after_head;         
reg     [2 :0]  h4_split1_type_after_head;         
reg     [7 :0]  h4_vl_after_head;                  
reg     [1 :0]  h4_vlmul_after_head;               
reg     [2 :0]  h4_vsew_after_head;                
reg     [2 :0]  h5_base_after_head;                
reg     [15:0]  h5_data_after_head;                
reg     [2 :0]  h5_split0_type_after_head;         
reg     [2 :0]  h5_split1_type_after_head;         
reg     [7 :0]  h5_vl_after_head;                  
reg     [1 :0]  h5_vlmul_after_head;               
reg     [2 :0]  h5_vsew_after_head;                
reg     [2 :0]  h6_base_after_head;                
reg     [15:0]  h6_data_after_head;                
reg     [2 :0]  h6_split0_type_after_head;         
reg     [2 :0]  h6_split1_type_after_head;         
reg     [7 :0]  h6_vl_after_head;                  
reg     [1 :0]  h6_vlmul_after_head;               
reg     [2 :0]  h6_vsew_after_head;                
reg     [3 :0]  half_num_before_con_br;            
reg     [3 :0]  half_num_chgflw;                   
reg     [3 :0]  half_num_con_br;                   
reg     [3 :0]  half_num_no_chgflw;                
reg     [7 :0]  ind_br_after_head;                 
reg     [7 :0]  inst_32_after_head;                
reg             inst_32_con_br;                    
reg     [7 :0]  inst_chgflw_vl;                    
reg     [1 :0]  inst_chgflw_vlmul;                 
reg     [7 :0]  inst_chgflw_vmask;                 
reg     [2 :0]  inst_chgflw_vsew;                  
reg     [7 :0]  inst_ldst_after_head;              
reg             ip_mmu_acc_deny_ff;                
reg             ip_mmu_acc_deny_ff_vld;            
reg     [1 :0]  ipdp_ibdp_bht_pre_result;          
reg             ipdp_ibdp_bht_result;              
reg     [1 :0]  ipdp_ibdp_bht_sel_result;          
reg     [38:0]  ipdp_ibdp_branch_base;             
reg             ipdp_ibdp_branch_btb_miss;         
reg     [20:0]  ipdp_ibdp_branch_offset;           
reg     [38:0]  ipdp_ibdp_branch_result;           
reg     [7 :0]  ipdp_ibdp_branch_vl;               
reg     [1 :0]  ipdp_ibdp_branch_vlmul;            
reg     [2 :0]  ipdp_ibdp_branch_vsew;             
reg     [1 :0]  ipdp_ibdp_branch_way_pred;         
reg     [38:0]  ipdp_ibdp_btb_index_pc;            
reg     [7 :0]  ipdp_ibdp_chgflw_mask;             
reg     [3 :0]  ipdp_ibdp_chgflw_num;              
reg             ipdp_ibdp_chgflw_num_vld;          
reg     [7 :0]  ipdp_ibdp_chgflw_vl;               
reg     [1 :0]  ipdp_ibdp_chgflw_vlmul;            
reg     [2 :0]  ipdp_ibdp_chgflw_vsew;             
reg     [38:0]  ipdp_ibdp_con_br_cur_pc;           
reg     [3 :0]  ipdp_ibdp_con_br_half_num;         
reg             ipdp_ibdp_con_br_inst_32;          
reg     [3 :0]  ipdp_ibdp_con_br_num;              
reg             ipdp_ibdp_con_br_num_vld;          
reg     [20:0]  ipdp_ibdp_con_br_offset;           
reg             ipdp_ibdp_h0_bkpta;                
reg             ipdp_ibdp_h0_bkptb;                
reg             ipdp_ibdp_h0_con_br;               
reg     [35:0]  ipdp_ibdp_h0_cur_pc;               
reg     [15:0]  ipdp_ibdp_h0_data;                 
reg             ipdp_ibdp_h0_fence;                
reg             ipdp_ibdp_h0_high_expt;            
reg             ipdp_ibdp_h0_ldst;                 
reg             ipdp_ibdp_h0_no_spec;              
reg             ipdp_ibdp_h0_spe_vld;              
reg             ipdp_ibdp_h0_split0;               
reg     [2 :0]  ipdp_ibdp_h0_split0_type;          
reg             ipdp_ibdp_h0_split1;               
reg     [2 :0]  ipdp_ibdp_h0_split1_type;          
reg     [7 :0]  ipdp_ibdp_h0_vl;                   
reg             ipdp_ibdp_h0_vl_pred;              
reg             ipdp_ibdp_h0_vld;                  
reg     [1 :0]  ipdp_ibdp_h0_vlmul;                
reg             ipdp_ibdp_h0_vsetvli;              
reg     [2 :0]  ipdp_ibdp_h0_vsew;                 
reg     [2 :0]  ipdp_ibdp_h1_base;                 
reg     [15:0]  ipdp_ibdp_h1_data;                 
reg     [2 :0]  ipdp_ibdp_h1_split0_type;          
reg     [2 :0]  ipdp_ibdp_h1_split1_type;          
reg     [7 :0]  ipdp_ibdp_h1_vl;                   
reg     [1 :0]  ipdp_ibdp_h1_vlmul;                
reg     [2 :0]  ipdp_ibdp_h1_vsew;                 
reg     [2 :0]  ipdp_ibdp_h2_base;                 
reg     [15:0]  ipdp_ibdp_h2_data;                 
reg     [2 :0]  ipdp_ibdp_h2_split0_type;          
reg     [2 :0]  ipdp_ibdp_h2_split1_type;          
reg     [7 :0]  ipdp_ibdp_h2_vl;                   
reg     [1 :0]  ipdp_ibdp_h2_vlmul;                
reg     [2 :0]  ipdp_ibdp_h2_vsew;                 
reg     [2 :0]  ipdp_ibdp_h3_base;                 
reg     [15:0]  ipdp_ibdp_h3_data;                 
reg     [2 :0]  ipdp_ibdp_h3_split0_type;          
reg     [2 :0]  ipdp_ibdp_h3_split1_type;          
reg     [7 :0]  ipdp_ibdp_h3_vl;                   
reg     [1 :0]  ipdp_ibdp_h3_vlmul;                
reg     [2 :0]  ipdp_ibdp_h3_vsew;                 
reg     [2 :0]  ipdp_ibdp_h4_base;                 
reg     [15:0]  ipdp_ibdp_h4_data;                 
reg     [2 :0]  ipdp_ibdp_h4_split0_type;          
reg     [2 :0]  ipdp_ibdp_h4_split1_type;          
reg     [7 :0]  ipdp_ibdp_h4_vl;                   
reg     [1 :0]  ipdp_ibdp_h4_vlmul;                
reg     [2 :0]  ipdp_ibdp_h4_vsew;                 
reg     [2 :0]  ipdp_ibdp_h5_base;                 
reg     [15:0]  ipdp_ibdp_h5_data;                 
reg     [2 :0]  ipdp_ibdp_h5_split0_type;          
reg     [2 :0]  ipdp_ibdp_h5_split1_type;          
reg     [7 :0]  ipdp_ibdp_h5_vl;                   
reg     [1 :0]  ipdp_ibdp_h5_vlmul;                
reg     [2 :0]  ipdp_ibdp_h5_vsew;                 
reg     [2 :0]  ipdp_ibdp_h6_base;                 
reg     [15:0]  ipdp_ibdp_h6_data;                 
reg     [2 :0]  ipdp_ibdp_h6_split0_type;          
reg     [2 :0]  ipdp_ibdp_h6_split1_type;          
reg     [7 :0]  ipdp_ibdp_h6_vl;                   
reg     [1 :0]  ipdp_ibdp_h6_vlmul;                
reg     [2 :0]  ipdp_ibdp_h6_vsew;                 
reg     [2 :0]  ipdp_ibdp_h7_base;                 
reg     [15:0]  ipdp_ibdp_h7_data;                 
reg     [2 :0]  ipdp_ibdp_h7_split0_type;          
reg     [2 :0]  ipdp_ibdp_h7_split1_type;          
reg     [7 :0]  ipdp_ibdp_h7_vl;                   
reg     [1 :0]  ipdp_ibdp_h7_vlmul;                
reg     [2 :0]  ipdp_ibdp_h7_vsew;                 
reg     [2 :0]  ipdp_ibdp_h8_base;                 
reg     [15:0]  ipdp_ibdp_h8_data;                 
reg     [2 :0]  ipdp_ibdp_h8_split0_type;          
reg     [2 :0]  ipdp_ibdp_h8_split1_type;          
reg     [7 :0]  ipdp_ibdp_h8_vl;                   
reg     [1 :0]  ipdp_ibdp_h8_vlmul;                
reg     [2 :0]  ipdp_ibdp_h8_vsew;                 
reg     [7 :0]  ipdp_ibdp_hn_32_start;             
reg     [7 :0]  ipdp_ibdp_hn_ab_br;                
reg             ipdp_ibdp_hn_acc_err;              
reg     [7 :0]  ipdp_ibdp_hn_auipc;                
reg     [7 :0]  ipdp_ibdp_hn_bkpta;                
reg             ipdp_ibdp_hn_bkpta_vld;            
reg     [7 :0]  ipdp_ibdp_hn_bkptb;                
reg             ipdp_ibdp_hn_bkptb_vld;            
reg     [7 :0]  ipdp_ibdp_hn_chgflw;               
reg     [7 :0]  ipdp_ibdp_hn_con_br;               
reg     [7 :0]  ipdp_ibdp_hn_dst_vld;              
reg     [7 :0]  ipdp_ibdp_hn_fence;                
reg     [7 :0]  ipdp_ibdp_hn_ind_br;               
reg     [7 :0]  ipdp_ibdp_hn_jal;                  
reg     [7 :0]  ipdp_ibdp_hn_jalr;                 
reg     [7 :0]  ipdp_ibdp_hn_ldst;                 
reg             ipdp_ibdp_hn_mmu_acc_deny;         
reg     [7 :0]  ipdp_ibdp_hn_no_spec;              
reg             ipdp_ibdp_hn_no_spec_vld;          
reg     [7 :0]  ipdp_ibdp_hn_pc_oper;              
reg     [7 :0]  ipdp_ibdp_hn_pcall;                
reg             ipdp_ibdp_hn_pgflt;                
reg     [7 :0]  ipdp_ibdp_hn_preturn;              
reg     [7 :0]  ipdp_ibdp_hn_split0;               
reg     [7 :0]  ipdp_ibdp_hn_split1;               
reg     [7 :0]  ipdp_ibdp_hn_vl_pred;              
reg     [7 :0]  ipdp_ibdp_hn_vld;                  
reg     [7 :0]  ipdp_ibdp_hn_vsetvli;              
reg     [20:0]  ipdp_ibdp_ind_br_offset;           
reg     [15:0]  ipdp_ibdp_l0_btb_entry_hit;        
reg             ipdp_ibdp_l0_btb_hit;              
reg     [38:0]  ipdp_ibdp_l0_btb_mispred_pc;       
reg             ipdp_ibdp_l0_btb_ras;              
reg             ipdp_ibdp_l0_btb_ras_pc_hit;       
reg             ipdp_ibdp_l0_btb_update_cnt_bit;   
reg             ipdp_ibdp_l0_btb_update_vld;       
reg             ipdp_ibdp_l0_btb_update_vld_bit;   
reg     [3 :0]  ipdp_ibdp_l0_btb_wen;              
reg     [3 :0]  ipdp_ibdp_no_chgflw_num;           
reg     [38:0]  ipdp_ibdp_ras_push_pc;             
reg     [38:0]  ipdp_ibdp_ras_target_pc;           
reg     [21:0]  ipdp_ibdp_vghr;                    
reg     [38:0]  ipdp_ibdp_vpc;                     
reg     [38:0]  ipdp_ras_push_pc;                  
reg     [7 :0]  jal_after_head;                    
reg     [7 :0]  jalr_after_head;                   
reg     [7 :0]  mask_ab_br;                        
reg     [7 :0]  mask_auipc;                        
reg     [7 :0]  mask_bkpta;                        
reg     [7 :0]  mask_bkptb;                        
reg     [7 :0]  mask_bry_data;                     
reg     [7 :0]  mask_chgflw;                       
reg     [7 :0]  mask_con_br;                       
reg     [7 :0]  mask_dst_vld;                      
reg     [7 :0]  mask_fence;                        
reg     [7 :0]  mask_hn_vld;                       
reg     [7 :0]  mask_ind_br;                       
reg     [7 :0]  mask_inst_32;                      
reg     [7 :0]  mask_jal;                          
reg     [7 :0]  mask_jalr;                         
reg     [7 :0]  mask_pc_oper;                      
reg     [7 :0]  mask_pcall;                        
reg     [7 :0]  mask_preturn;                      
reg     [7 :0]  mask_split0;                       
reg     [7 :0]  mask_split1;                       
reg     [7 :0]  no_spec_after_head;                
reg     [20:0]  offset_branch;                     
reg     [20:0]  offset_con_br;                     
reg     [20:0]  offset_ind_br;                     
reg     [7 :0]  pc_oper_after_head;                
reg     [7 :0]  pcall_after_head;                  
reg     [7 :0]  preturn_after_head;                
reg     [7 :0]  sfp_pc_hit_onehot;                 
reg     [7 :0]  split0_after_head;                 
reg     [7 :0]  split1_after_head;                 
reg     [7 :0]  vl_branch;                         
reg     [7 :0]  vl_pred_after_head;                
reg     [7 :0]  vl_reg;                            
reg     [7 :0]  vl_updt_value;                     
reg     [1 :0]  vlmul_branch;                      
reg     [1 :0]  vlmul_reg;                         
reg     [1 :0]  vlmul_updt_value;                  
reg     [7 :0]  vsetvli_after_head;                
reg     [2 :0]  vsew_branch;                       
reg     [2 :0]  vsew_reg;                          
reg     [2 :0]  vsew_updt_value;                   

// &Wires; @25
wire    [7 :0]  ab_br;                             
wire    [7 :0]  ab_br_pre;                         
wire    [7 :0]  addrgen_ipdp_chgflw_vl;            
wire    [1 :0]  addrgen_ipdp_chgflw_vlmul;         
wire    [2 :0]  addrgen_ipdp_chgflw_vsew;          
wire            addrgen_xx_pcload;                 
wire    [7 :0]  auipc_pre;                         
wire            bar_hit;                           
wire    [31:0]  bht_ipdp_pre_array_data_ntake;     
wire    [31:0]  bht_ipdp_pre_array_data_taken;     
wire    [15:0]  bht_ipdp_pre_offset_onehot;        
wire    [1 :0]  bht_ipdp_sel_array_result;         
wire    [21:0]  bht_ipdp_vghr;                     
wire            bht_result;                        
wire    [1 :0]  bht_sel_result;                    
wire    [7 :0]  bkpta;                             
wire    [7 :0]  bkptb;                             
wire    [7 :0]  br;                                
wire    [7 :0]  br_pre;                            
wire    [7 :0]  branch;                            
wire    [7 :0]  bry_data;                          
wire            btb_branch_miss;                   
wire    [7 :0]  chgflw;                            
wire    [7 :0]  chgflw_pre;                        
wire    [7 :0]  con_br;                            
wire            con_br_more_than_one;              
wire    [7 :0]  con_br_pre;                        
wire            cp0_idu_cskyee;                    
wire    [2 :0]  cp0_idu_frm;                       
wire    [1 :0]  cp0_idu_fs;                        
wire            cp0_ifu_btb_en;                    
wire            cp0_ifu_icg_en;                    
wire    [7 :0]  cp0_ifu_vl;                        
wire    [1 :0]  cp0_ifu_vlmul;                     
wire            cp0_ifu_vsetvli_pred_disable;      
wire    [2 :0]  cp0_ifu_vsew;                      
wire            cp0_yy_clk_en;                     
wire            cpurst_b;                          
wire    [7 :0]  dst_vld;                           
wire    [7 :0]  dst_vld_pre;                       
wire    [7 :0]  fence;                             
wire    [7 :0]  fence_pre;                         
wire            forever_cpuclk;                    
wire            h0_ab_br_pre;                      
wire            h0_auipc_pre;                      
wire            h0_bkpta_pre;                      
wire            h0_bkptb_pre;                      
wire            h0_br_pre;                         
wire            h0_chgflw_pre;                     
wire            h0_con_br_pre;                     
wire            h0_dst_vld_pre;                    
wire            h0_fence;                          
wire            h0_ind_br;                         
wire            h0_jal_pre;                        
wire            h0_jalr_pre;                       
wire            h0_ld;                             
wire            h0_no_spec_pre;                    
wire    [20:0]  h0_offset;                         
wire            h0_pc_oper_pre;                    
wire            h0_pcall;                          
wire            h0_preturn;                        
wire            h0_split0;                         
wire    [2 :0]  h0_split0_type;                    
wire            h0_split1;                         
wire    [2 :0]  h0_split1_type;                    
wire            h0_st;                             
wire            h0_update_vld;                     
wire            h0_updt_clk;                       
wire            h0_updt_clk_en;                    
wire    [7 :0]  h0_vl;                             
wire            h0_vl_pred_pre;                    
wire            h0_vl_pred_raw_pre;                
wire            h0_vld_pre;                        
wire    [7 :0]  h0_vlmax_pre;                      
wire    [1 :0]  h0_vlmul;                          
wire    [1 :0]  h0_vlmul_pre;                      
wire            h0_vsetvli;                        
wire    [2 :0]  h0_vsew;                           
wire    [2 :0]  h0_vsew_pre;                       
wire            h1_32_way0;                        
wire            h1_32_way1;                        
wire            h1_ab_br_way0;                     
wire            h1_ab_br_way1;                     
wire            h1_br_way0;                        
wire            h1_br_way1;                        
wire    [15:0]  h1_data;                           
wire    [15:0]  h1_data_way0;                      
wire    [15:0]  h1_data_way1;                      
wire    [13:0]  h1_high_way0;                      
wire    [13:0]  h1_high_way1;                      
wire    [1 :0]  h1_low_way0;                       
wire    [1 :0]  h1_low_way1;                       
wire    [20:0]  h1_offset;                         
wire    [3 :0]  h1_precode_way0;                   
wire    [3 :0]  h1_precode_way1;                   
wire            h1_split0;                         
wire    [2 :0]  h1_split0_type;                    
wire            h1_split1;                         
wire    [2 :0]  h1_split1_type;                    
wire    [7 :0]  h1_vl;                             
wire            h1_vld_after_head;                 
wire    [7 :0]  h1_vlmax_pre;                      
wire    [1 :0]  h1_vlmul;                          
wire    [1 :0]  h1_vlmul_pre;                      
wire    [2 :0]  h1_vsew;                           
wire    [2 :0]  h1_vsew_pre;                       
wire            h2_32_way0;                        
wire            h2_32_way1;                        
wire            h2_ab_br_way0;                     
wire            h2_ab_br_way1;                     
wire            h2_br_way0;                        
wire            h2_br_way1;                        
wire    [15:0]  h2_data;                           
wire    [15:0]  h2_data_way0;                      
wire    [15:0]  h2_data_way1;                      
wire    [13:0]  h2_high_way0;                      
wire    [13:0]  h2_high_way1;                      
wire    [1 :0]  h2_low_way0;                       
wire    [1 :0]  h2_low_way1;                       
wire    [20:0]  h2_offset;                         
wire    [3 :0]  h2_precode_way0;                   
wire    [3 :0]  h2_precode_way1;                   
wire            h2_split0;                         
wire    [2 :0]  h2_split0_type;                    
wire            h2_split1;                         
wire    [2 :0]  h2_split1_type;                    
wire    [7 :0]  h2_vl;                             
wire            h2_vld_after_head;                 
wire    [7 :0]  h2_vlmax_pre;                      
wire    [1 :0]  h2_vlmul;                          
wire    [1 :0]  h2_vlmul_pre;                      
wire    [2 :0]  h2_vsew;                           
wire    [2 :0]  h2_vsew_pre;                       
wire            h3_32_way0;                        
wire            h3_32_way1;                        
wire            h3_ab_br_way0;                     
wire            h3_ab_br_way1;                     
wire            h3_br_way0;                        
wire            h3_br_way1;                        
wire    [15:0]  h3_data;                           
wire    [15:0]  h3_data_way0;                      
wire    [15:0]  h3_data_way1;                      
wire    [13:0]  h3_high_way0;                      
wire    [13:0]  h3_high_way1;                      
wire    [1 :0]  h3_low_way0;                       
wire    [1 :0]  h3_low_way1;                       
wire    [20:0]  h3_offset;                         
wire    [3 :0]  h3_precode_way0;                   
wire    [3 :0]  h3_precode_way1;                   
wire            h3_split0;                         
wire    [2 :0]  h3_split0_type;                    
wire            h3_split1;                         
wire    [2 :0]  h3_split1_type;                    
wire    [7 :0]  h3_vl;                             
wire            h3_vld_after_head;                 
wire    [7 :0]  h3_vlmax_pre;                      
wire    [1 :0]  h3_vlmul;                          
wire    [1 :0]  h3_vlmul_pre;                      
wire    [2 :0]  h3_vsew;                           
wire    [2 :0]  h3_vsew_pre;                       
wire            h4_32_way0;                        
wire            h4_32_way1;                        
wire            h4_ab_br_way0;                     
wire            h4_ab_br_way1;                     
wire            h4_br_way0;                        
wire            h4_br_way1;                        
wire    [15:0]  h4_data;                           
wire    [15:0]  h4_data_way0;                      
wire    [15:0]  h4_data_way1;                      
wire    [13:0]  h4_high_way0;                      
wire    [13:0]  h4_high_way1;                      
wire    [1 :0]  h4_low_way0;                       
wire    [1 :0]  h4_low_way1;                       
wire    [20:0]  h4_offset;                         
wire    [3 :0]  h4_precode_way0;                   
wire    [3 :0]  h4_precode_way1;                   
wire            h4_split0;                         
wire    [2 :0]  h4_split0_type;                    
wire            h4_split1;                         
wire    [2 :0]  h4_split1_type;                    
wire    [7 :0]  h4_vl;                             
wire            h4_vld_after_head;                 
wire    [7 :0]  h4_vlmax_pre;                      
wire    [1 :0]  h4_vlmul;                          
wire    [1 :0]  h4_vlmul_pre;                      
wire    [2 :0]  h4_vsew;                           
wire    [2 :0]  h4_vsew_pre;                       
wire            h5_32_way0;                        
wire            h5_32_way1;                        
wire            h5_ab_br_way0;                     
wire            h5_ab_br_way1;                     
wire            h5_br_way0;                        
wire            h5_br_way1;                        
wire    [15:0]  h5_data;                           
wire    [15:0]  h5_data_way0;                      
wire    [15:0]  h5_data_way1;                      
wire    [13:0]  h5_high_way0;                      
wire    [13:0]  h5_high_way1;                      
wire    [1 :0]  h5_low_way0;                       
wire    [1 :0]  h5_low_way1;                       
wire    [20:0]  h5_offset;                         
wire    [3 :0]  h5_precode_way0;                   
wire    [3 :0]  h5_precode_way1;                   
wire            h5_split0;                         
wire    [2 :0]  h5_split0_type;                    
wire            h5_split1;                         
wire    [2 :0]  h5_split1_type;                    
wire    [7 :0]  h5_vl;                             
wire            h5_vld_after_head;                 
wire    [7 :0]  h5_vlmax_pre;                      
wire    [1 :0]  h5_vlmul;                          
wire    [1 :0]  h5_vlmul_pre;                      
wire    [2 :0]  h5_vsew;                           
wire    [2 :0]  h5_vsew_pre;                       
wire            h6_32_way0;                        
wire            h6_32_way1;                        
wire            h6_ab_br_way0;                     
wire            h6_ab_br_way1;                     
wire            h6_br_way0;                        
wire            h6_br_way1;                        
wire    [15:0]  h6_data;                           
wire    [15:0]  h6_data_way0;                      
wire    [15:0]  h6_data_way1;                      
wire    [13:0]  h6_high_way0;                      
wire    [13:0]  h6_high_way1;                      
wire    [1 :0]  h6_low_way0;                       
wire    [1 :0]  h6_low_way1;                       
wire    [20:0]  h6_offset;                         
wire    [3 :0]  h6_precode_way0;                   
wire    [3 :0]  h6_precode_way1;                   
wire            h6_split0;                         
wire    [2 :0]  h6_split0_type;                    
wire            h6_split1;                         
wire    [2 :0]  h6_split1_type;                    
wire    [7 :0]  h6_vl;                             
wire            h6_vld_after_head;                 
wire    [7 :0]  h6_vlmax_pre;                      
wire    [1 :0]  h6_vlmul;                          
wire    [1 :0]  h6_vlmul_pre;                      
wire    [2 :0]  h6_vsew;                           
wire    [2 :0]  h6_vsew_pre;                       
wire            h7_32_way0;                        
wire            h7_32_way1;                        
wire            h7_ab_br_way0;                     
wire            h7_ab_br_way1;                     
wire    [2 :0]  h7_base_after_head;                
wire            h7_br_way0;                        
wire            h7_br_way1;                        
wire    [15:0]  h7_data;                           
wire    [15:0]  h7_data_after_head;                
wire    [15:0]  h7_data_way0;                      
wire    [15:0]  h7_data_way1;                      
wire    [13:0]  h7_high_way0;                      
wire    [13:0]  h7_high_way1;                      
wire    [1 :0]  h7_low_way0;                       
wire    [1 :0]  h7_low_way1;                       
wire    [20:0]  h7_offset;                         
wire    [3 :0]  h7_precode_way0;                   
wire    [3 :0]  h7_precode_way1;                   
wire            h7_split0;                         
wire    [2 :0]  h7_split0_type;                    
wire    [2 :0]  h7_split0_type_after_head;         
wire            h7_split1;                         
wire    [2 :0]  h7_split1_type;                    
wire    [2 :0]  h7_split1_type_after_head;         
wire    [7 :0]  h7_vl;                             
wire    [7 :0]  h7_vl_after_head;                  
wire            h7_vld_after_head;                 
wire    [7 :0]  h7_vlmax_pre;                      
wire    [1 :0]  h7_vlmul;                          
wire    [1 :0]  h7_vlmul_after_head;               
wire    [1 :0]  h7_vlmul_pre;                      
wire    [2 :0]  h7_vsew;                           
wire    [2 :0]  h7_vsew_after_head;                
wire    [2 :0]  h7_vsew_pre;                       
wire            h8_32_way0;                        
wire            h8_32_way1;                        
wire            h8_ab_br_way0;                     
wire            h8_ab_br_way1;                     
wire    [2 :0]  h8_base_after_head;                
wire            h8_br_way0;                        
wire            h8_br_way1;                        
wire    [15:0]  h8_data;                           
wire    [15:0]  h8_data_after_head;                
wire    [15:0]  h8_data_way0;                      
wire    [15:0]  h8_data_way1;                      
wire    [13:0]  h8_high_way0;                      
wire    [13:0]  h8_high_way1;                      
wire    [1 :0]  h8_low_way0;                       
wire    [1 :0]  h8_low_way1;                       
wire    [20:0]  h8_offset;                         
wire    [3 :0]  h8_precode_way0;                   
wire    [3 :0]  h8_precode_way1;                   
wire            h8_split0;                         
wire    [2 :0]  h8_split0_type;                    
wire    [2 :0]  h8_split0_type_after_head;         
wire            h8_split1;                         
wire    [2 :0]  h8_split1_type;                    
wire    [2 :0]  h8_split1_type_after_head;         
wire    [7 :0]  h8_vl;                             
wire    [7 :0]  h8_vl_after_head;                  
wire            h8_vld_after_head;                 
wire    [7 :0]  h8_vlmax_pre;                      
wire    [1 :0]  h8_vlmul;                          
wire    [1 :0]  h8_vlmul_after_head;               
wire    [1 :0]  h8_vlmul_pre;                      
wire    [2 :0]  h8_vsew;                           
wire    [2 :0]  h8_vsew_after_head;                
wire    [2 :0]  h8_vsew_pre;                       
wire            had_ab_br;                         
wire            had_auipc;                         
wire            had_br;                            
wire            had_branch;                        
wire            had_chgflw;                        
wire            had_con_br;                        
wire    [15:0]  had_data;                          
wire            had_dst_vld;                       
wire            had_fence;                         
wire    [2 :0]  had_fence_type;                    
wire    [31:0]  had_ifu_ir;                        
wire            had_ifu_ir_vld;                    
wire            had_ind_br;                        
wire    [31:0]  had_inst;                          
wire            had_jal;                           
wire            had_jalr;                          
wire            had_ld;                            
wire    [20:0]  had_offset;                        
wire            had_pc_oper;                       
wire            had_pcall;                         
wire            had_preturn;                       
wire            had_split;                         
wire            had_split0;                        
wire    [2 :0]  had_split0_type;                   
wire            had_split1;                        
wire    [2 :0]  had_split1_type;                   
wire    [9 :0]  had_split_long_type;               
wire    [2 :0]  had_split_potnt;                   
wire            had_split_short;                   
wire    [2 :0]  had_split_short_potnt;             
wire    [6 :0]  had_split_short_type;              
wire            had_st;                            
wire    [7 :0]  had_vlmax;                         
wire    [1 :0]  had_vlmul;                         
wire            had_vsetvli;                       
wire    [2 :0]  had_vsew;                          
wire            had_vtype_updt_vld;                
wire    [3 :0]  half_0_num;                        
wire    [3 :0]  half_1_num;                        
wire    [3 :0]  half_2_num;                        
wire    [3 :0]  half_3_num;                        
wire    [3 :0]  half_4_num;                        
wire    [3 :0]  half_5_num;                        
wire    [3 :0]  half_6_num;                        
wire    [3 :0]  half_7_num;                        
wire    [3 :0]  half_num_expt;                     
wire    [7 :0]  hn_vld_after_head;                 
wire    [7 :0]  ibctrl_ipdp_chgflw_vl;             
wire    [1 :0]  ibctrl_ipdp_chgflw_vlmul;          
wire    [2 :0]  ibctrl_ipdp_chgflw_vsew;           
wire            ibctrl_ipdp_pcload;                
wire            ifdp_ipdp_acc_err;                 
wire    [7 :0]  ifdp_ipdp_bkpta;                   
wire    [7 :0]  ifdp_ipdp_bkptb;                   
wire    [1 :0]  ifdp_ipdp_btb_way0_pred;           
wire    [9 :0]  ifdp_ipdp_btb_way0_tag;            
wire    [19:0]  ifdp_ipdp_btb_way0_target;         
wire            ifdp_ipdp_btb_way0_vld;            
wire    [1 :0]  ifdp_ipdp_btb_way1_pred;           
wire    [9 :0]  ifdp_ipdp_btb_way1_tag;            
wire    [19:0]  ifdp_ipdp_btb_way1_target;         
wire            ifdp_ipdp_btb_way1_vld;            
wire    [1 :0]  ifdp_ipdp_btb_way2_pred;           
wire    [9 :0]  ifdp_ipdp_btb_way2_tag;            
wire    [19:0]  ifdp_ipdp_btb_way2_target;         
wire            ifdp_ipdp_btb_way2_vld;            
wire    [1 :0]  ifdp_ipdp_btb_way3_pred;           
wire    [9 :0]  ifdp_ipdp_btb_way3_tag;            
wire    [19:0]  ifdp_ipdp_btb_way3_target;         
wire            ifdp_ipdp_btb_way3_vld;            
wire    [13:0]  ifdp_ipdp_h1_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h1_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h1_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h1_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h1_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h1_precode_way1;         
wire    [13:0]  ifdp_ipdp_h2_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h2_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h2_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h2_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h2_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h2_precode_way1;         
wire    [13:0]  ifdp_ipdp_h3_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h3_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h3_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h3_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h3_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h3_precode_way1;         
wire    [13:0]  ifdp_ipdp_h4_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h4_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h4_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h4_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h4_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h4_precode_way1;         
wire    [13:0]  ifdp_ipdp_h5_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h5_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h5_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h5_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h5_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h5_precode_way1;         
wire    [13:0]  ifdp_ipdp_h6_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h6_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h6_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h6_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h6_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h6_precode_way1;         
wire    [13:0]  ifdp_ipdp_h7_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h7_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h7_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h7_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h7_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h7_precode_way1;         
wire    [13:0]  ifdp_ipdp_h8_inst_high_way0;       
wire    [13:0]  ifdp_ipdp_h8_inst_high_way1;       
wire    [1 :0]  ifdp_ipdp_h8_inst_low_way0;        
wire    [1 :0]  ifdp_ipdp_h8_inst_low_way1;        
wire    [3 :0]  ifdp_ipdp_h8_precode_way0;         
wire    [3 :0]  ifdp_ipdp_h8_precode_way1;         
wire            ifdp_ipdp_l0_btb_counter;          
wire    [15:0]  ifdp_ipdp_l0_btb_entry_hit;        
wire            ifdp_ipdp_l0_btb_hit;              
wire    [38:0]  ifdp_ipdp_l0_btb_mispred_pc;       
wire            ifdp_ipdp_l0_btb_ras;              
wire    [38:0]  ifdp_ipdp_l0_btb_target;           
wire            ifdp_ipdp_l0_btb_way0_high_hit;    
wire            ifdp_ipdp_l0_btb_way0_low_hit;     
wire            ifdp_ipdp_l0_btb_way1_high_hit;    
wire            ifdp_ipdp_l0_btb_way1_low_hit;     
wire            ifdp_ipdp_l0_btb_way2_high_hit;    
wire            ifdp_ipdp_l0_btb_way2_low_hit;     
wire            ifdp_ipdp_l0_btb_way3_high_hit;    
wire            ifdp_ipdp_l0_btb_way3_low_hit;     
wire    [1 :0]  ifdp_ipdp_l0_btb_way_pred;         
wire            ifdp_ipdp_mmu_pgflt;               
wire    [2 :0]  ifdp_ipdp_sfp_hit_pc_lo;           
wire    [3 :0]  ifdp_ipdp_sfp_hit_type;            
wire            ifdp_ipdp_sfp_pc_hit;              
wire    [38:0]  ifdp_ipdp_vpc;                     
wire    [7 :0]  ind_br;                            
wire    [7 :0]  ind_br_pre;                        
wire    [7 :0]  inst_32;                           
wire    [7 :0]  inst_32_pre;                       
wire    [7 :0]  inst_32_vpc_mask;                  
wire    [7 :0]  inst_auipc;                        
wire    [7 :0]  inst_branch;                       
wire    [7 :0]  inst_branch_pre;                   
wire    [7 :0]  inst_branch_w0_pre;                
wire    [7 :0]  inst_branch_w1_pre;                
wire    [7 :0]  inst_chgflw;                       
wire    [7 :0]  inst_ld;                           
wire    [7 :0]  inst_ld_pre;                       
wire    [7 :0]  inst_ldst;                         
wire    [7 :0]  inst_no_spec;                      
wire    [7 :0]  inst_st;                           
wire    [7 :0]  inst_st_pre;                       
wire    [7 :0]  inst_vl_pred;                      
wire    [7 :0]  ip_ab_br;                          
wire            ip_acc_err;                        
wire    [7 :0]  ip_auipc;                          
wire    [7 :0]  ip_bkpta;                          
wire    [7 :0]  ip_bkptb;                          
wire    [7 :0]  ip_bry_data;                       
wire    [7 :0]  ip_chgflw;                         
wire    [7 :0]  ip_con_br;                         
wire    [7 :0]  ip_dst_vld;                        
wire            ip_expt;                           
wire    [7 :0]  ip_fence;                          
wire    [15:0]  ip_h1_data;                        
wire    [15:0]  ip_h2_data;                        
wire    [15:0]  ip_h3_data;                        
wire    [15:0]  ip_h4_data;                        
wire    [15:0]  ip_h5_data;                        
wire    [15:0]  ip_h6_data;                        
wire    [15:0]  ip_h7_data;                        
wire    [15:0]  ip_h8_data;                        
wire    [7 :0]  ip_had_ab_br;                      
wire    [7 :0]  ip_had_auipc;                      
wire    [7 :0]  ip_had_bkpta;                      
wire    [7 :0]  ip_had_bkptb;                      
wire    [7 :0]  ip_had_bry_data;                   
wire    [7 :0]  ip_had_chgflw;                     
wire    [7 :0]  ip_had_con_br;                     
wire    [7 :0]  ip_had_dst_vld;                    
wire    [7 :0]  ip_had_fence;                      
wire    [7 :0]  ip_had_ind_br;                     
wire    [7 :0]  ip_had_inst_32;                    
wire    [7 :0]  ip_had_inst_ldst;                  
wire    [7 :0]  ip_had_jal;                        
wire    [7 :0]  ip_had_jalr;                       
wire    [7 :0]  ip_had_no_spec;                    
wire    [7 :0]  ip_had_pc_oper;                    
wire    [7 :0]  ip_had_pcall;                      
wire    [7 :0]  ip_had_preturn;                    
wire    [7 :0]  ip_had_split0;                     
wire    [7 :0]  ip_had_split1;                     
wire    [7 :0]  ip_had_vl_pred;                    
wire    [7 :0]  ip_had_vld;                        
wire    [7 :0]  ip_had_vsetvli;                    
wire    [7 :0]  ip_hn_vld;                         
wire            ip_ib_pipe_clk;                    
wire            ip_ib_pipe_clk_en;                 
wire            ip_ib_pipe_h0_clk;                 
wire            ip_ib_pipe_h0_clk_en;              
wire    [7 :0]  ip_ind_br;                         
wire    [7 :0]  ip_inst_32;                        
wire    [7 :0]  ip_inst_ldst;                      
wire    [7 :0]  ip_jal;                            
wire    [7 :0]  ip_jalr;                           
wire            ip_mmu_acc_deny;                   
wire            ip_mmu_pgflt;                      
wire    [7 :0]  ip_no_spec;                        
wire    [7 :0]  ip_pc_oper;                        
wire    [7 :0]  ip_pcall;                          
wire    [7 :0]  ip_preturn;                        
wire    [7 :0]  ip_split0;                         
wire    [7 :0]  ip_split1;                         
wire    [7 :0]  ip_vl;                             
wire    [7 :0]  ip_vl_pred;                        
wire    [1 :0]  ip_vlmul;                          
wire    [7 :0]  ip_vmask;                          
wire    [38:0]  ip_vpc;                            
wire    [7 :0]  ip_vsetvli;                        
wire    [2 :0]  ip_vsew;                           
wire            ip_vtype_updt_vld;                 
wire            ipctrl_ipdp_bht_vld;               
wire            ipctrl_ipdp_br_more_than_one_stall; 
wire    [7 :0]  ipctrl_ipdp_branch;                
wire    [7 :0]  ipctrl_ipdp_bry_data;              
wire    [38:0]  ipctrl_ipdp_chgflw_pc;             
wire            ipctrl_ipdp_con_br;                
wire            ipctrl_ipdp_h0_update_vld;         
wire            ipctrl_ipdp_h0_updt_gateclk_en;    
wire    [7 :0]  ipctrl_ipdp_hn_con_br;             
wire            ipctrl_ipdp_icache_way0_hit;       
wire            ipctrl_ipdp_icache_way0_hit_short; 
wire            ipctrl_ipdp_if_pcload;             
wire            ipctrl_ipdp_ip_data_vld;           
wire            ipctrl_ipdp_ip_mistaken;           
wire            ipctrl_ipdp_ip_pcload;             
wire            ipctrl_ipdp_l0_btb_hit;            
wire            ipctrl_ipdp_pipe_cancel;           
wire            ipctrl_ipdp_pipe_stall;            
wire            ipctrl_ipdp_pipe_vld;              
wire            ipctrl_ipdp_pipe_vld_for_gateclk;  
wire            ipctrl_ipdp_self_stall;            
wire    [7 :0]  ipctrl_ipdp_vpc_mask;              
wire    [2 :0]  ipctrl_ipdp_vpc_next;              
wire    [7 :0]  ipctrl_ipdp_vpc_onehot;            
wire            ipdp_bht_h0_con_br;                
wire    [38:0]  ipdp_bht_vpc;                      
wire    [38:0]  ipdp_btb_index_pc;                 
wire    [19:0]  ipdp_btb_target_pc;                
wire    [38:0]  ipdp_h1_next_pc;                   
wire    [38:0]  ipdp_h2_next_pc;                   
wire    [38:0]  ipdp_h3_next_pc;                   
wire    [38:0]  ipdp_h4_next_pc;                   
wire    [38:0]  ipdp_h5_next_pc;                   
wire    [38:0]  ipdp_h6_next_pc;                   
wire    [38:0]  ipdp_h7_next_pc;                   
wire    [38:0]  ipdp_h8_next_pc;                   
wire    [7 :0]  ipdp_ibdp_vl_reg;                  
wire    [1 :0]  ipdp_ibdp_vlmul_reg;               
wire    [2 :0]  ipdp_ibdp_vsew_reg;                
wire            ipdp_ind_btb_jmp_detect;           
wire    [1 :0]  ipdp_ipctrl_bht_data;              
wire            ipdp_ipctrl_bht_result;            
wire    [1 :0]  ipdp_ipctrl_btb_way0_pred;         
wire    [19:0]  ipdp_ipctrl_btb_way0_target;       
wire    [1 :0]  ipdp_ipctrl_btb_way1_pred;         
wire    [19:0]  ipdp_ipctrl_btb_way1_target;       
wire    [1 :0]  ipdp_ipctrl_btb_way2_pred;         
wire    [19:0]  ipdp_ipctrl_btb_way2_target;       
wire    [1 :0]  ipdp_ipctrl_btb_way3_pred;         
wire    [19:0]  ipdp_ipctrl_btb_way3_target;       
wire            ipdp_ipctrl_con_br_first_branch;   
wire            ipdp_ipctrl_con_br_more_than_one;  
wire            ipdp_ipctrl_h0_ab_br;              
wire            ipdp_ipctrl_h0_br;                 
wire            ipdp_ipctrl_h0_con_br;             
wire            ipdp_ipctrl_h0_vld;                
wire            ipdp_ipctrl_h8_br;                 
wire    [7 :0]  ipdp_ipctrl_inst_32;               
wire            ipdp_ipctrl_ip_expt_vld;           
wire    [3 :0]  ipdp_ipctrl_l0_btb_hit_way;        
wire    [38:0]  ipdp_ipctrl_l0_btb_mispred_pc;     
wire            ipdp_ipctrl_l0_btb_ras;            
wire            ipdp_ipctrl_l0_btb_vld;            
wire            ipdp_ipctrl_no_br;                 
wire    [38:0]  ipdp_ipctrl_vpc;                   
wire    [7 :0]  ipdp_ipctrl_w0_ab_br;              
wire    [7 :0]  ipdp_ipctrl_w0_br;                 
wire    [7 :0]  ipdp_ipctrl_w1_ab_br;              
wire    [7 :0]  ipdp_ipctrl_w1_br;                 
wire    [7 :0]  ipdp_ipctrl_way0_32;               
wire    [7 :0]  ipdp_ipctrl_way1_32;               
wire    [38:0]  ipdp_l0_btb_ras_pc;                
wire            ipdp_l0_btb_ras_push;              
wire    [7 :0]  ipdp_lbuf_vl_reg;                  
wire    [1 :0]  ipdp_lbuf_vlmul_reg;               
wire    [2 :0]  ipdp_lbuf_vsew_reg;                
wire    [7 :0]  iu_ifu_chgflw_vl;                  
wire            iu_ifu_chgflw_vld;                 
wire    [1 :0]  iu_ifu_chgflw_vlmul;               
wire    [2 :0]  iu_ifu_chgflw_vsew;                
wire    [7 :0]  jal;                               
wire    [7 :0]  jal_pre;                           
wire    [7 :0]  jalr;                              
wire    [7 :0]  jalr_pre;                          
wire            l0_btb_counter_zero;               
wire            l0_btb_hit_l1_btb;                 
wire            l0_btb_mistaken;                   
wire            l0_btb_not_saturate;               
wire            l0_btb_ras_pc_hit;                 
wire            l0_btb_update_cnt_bit;             
wire            l0_btb_update_vld;                 
wire            l0_btb_update_vld_bit;             
wire            l0_btb_way0_hit;                   
wire            l0_btb_way1_hit;                   
wire            l0_btb_way2_hit;                   
wire            l0_btb_way3_hit;                   
wire    [3 :0]  l0_btb_wen;                        
wire            lbuf_ipdp_lbuf_active;             
wire    [7 :0]  lbuf_ipdp_updt_vl;                 
wire    [1 :0]  lbuf_ipdp_updt_vlmul;              
wire    [2 :0]  lbuf_ipdp_updt_vsew;               
wire            lbuf_ipdp_vtype_updt_vld;          
wire            mmu_ifu_deny;                      
wire            more_than_one_br_vld;              
wire            pad_yy_icg_scan_en;                
wire    [7 :0]  pc_oper;                           
wire    [7 :0]  pc_oper_pre;                       
wire    [7 :0]  pcall;                             
wire    [7 :0]  pcall_pre;                         
wire    [7 :0]  pcall_vpc_mask;                    
wire            pcgen_ipctrl_pipe_cancel;          
wire    [1 :0]  pipe_bht_pre_result;               
wire            pipe_bht_result;                   
wire    [1 :0]  pipe_bht_sel_result;               
wire    [38:0]  pipe_branch_base;                  
wire            pipe_branch_btb_miss;              
wire    [20:0]  pipe_branch_offset;                
wire    [38:0]  pipe_branch_result;                
wire    [7 :0]  pipe_branch_vl;                    
wire    [1 :0]  pipe_branch_vlmul;                 
wire    [2 :0]  pipe_branch_vsew;                  
wire    [1 :0]  pipe_branch_way_pred;              
wire    [38:0]  pipe_btb_index_pc;                 
wire    [7 :0]  pipe_chgflw_mask;                  
wire    [3 :0]  pipe_chgflw_num;                   
wire            pipe_chgflw_num_vld;               
wire    [7 :0]  pipe_chgflw_vl;                    
wire    [1 :0]  pipe_chgflw_vlmul;                 
wire    [2 :0]  pipe_chgflw_vsew;                  
wire    [38:0]  pipe_con_br_cur_pc;                
wire    [3 :0]  pipe_con_br_half_num;              
wire            pipe_con_br_inst_32;               
wire    [3 :0]  pipe_con_br_num;                   
wire            pipe_con_br_num_vld;               
wire    [20:0]  pipe_con_br_offset;                
wire            pipe_h0_bkpta;                     
wire            pipe_h0_bkptb;                     
wire            pipe_h0_con_br;                    
wire    [35:0]  pipe_h0_cur_pc;                    
wire    [15:0]  pipe_h0_data;                      
wire            pipe_h0_fence;                     
wire            pipe_h0_high_expt;                 
wire            pipe_h0_ldst;                      
wire            pipe_h0_no_spec;                   
wire            pipe_h0_spe_vld;                   
wire            pipe_h0_split0;                    
wire    [2 :0]  pipe_h0_split0_type;               
wire            pipe_h0_split1;                    
wire    [2 :0]  pipe_h0_split1_type;               
wire    [7 :0]  pipe_h0_vl;                        
wire            pipe_h0_vl_pred;                   
wire            pipe_h0_vld;                       
wire    [1 :0]  pipe_h0_vlmul;                     
wire            pipe_h0_vsetvli;                   
wire    [2 :0]  pipe_h0_vsew;                      
wire    [2 :0]  pipe_h1_base;                      
wire    [15:0]  pipe_h1_data;                      
wire    [2 :0]  pipe_h1_split0_type;               
wire    [2 :0]  pipe_h1_split1_type;               
wire    [7 :0]  pipe_h1_vl;                        
wire    [1 :0]  pipe_h1_vlmul;                     
wire    [2 :0]  pipe_h1_vsew;                      
wire    [2 :0]  pipe_h2_base;                      
wire    [15:0]  pipe_h2_data;                      
wire    [2 :0]  pipe_h2_split0_type;               
wire    [2 :0]  pipe_h2_split1_type;               
wire    [7 :0]  pipe_h2_vl;                        
wire    [1 :0]  pipe_h2_vlmul;                     
wire    [2 :0]  pipe_h2_vsew;                      
wire    [2 :0]  pipe_h3_base;                      
wire    [15:0]  pipe_h3_data;                      
wire    [2 :0]  pipe_h3_split0_type;               
wire    [2 :0]  pipe_h3_split1_type;               
wire    [7 :0]  pipe_h3_vl;                        
wire    [1 :0]  pipe_h3_vlmul;                     
wire    [2 :0]  pipe_h3_vsew;                      
wire    [2 :0]  pipe_h4_base;                      
wire    [15:0]  pipe_h4_data;                      
wire    [2 :0]  pipe_h4_split0_type;               
wire    [2 :0]  pipe_h4_split1_type;               
wire    [7 :0]  pipe_h4_vl;                        
wire    [1 :0]  pipe_h4_vlmul;                     
wire    [2 :0]  pipe_h4_vsew;                      
wire    [2 :0]  pipe_h5_base;                      
wire    [15:0]  pipe_h5_data;                      
wire    [2 :0]  pipe_h5_split0_type;               
wire    [2 :0]  pipe_h5_split1_type;               
wire    [7 :0]  pipe_h5_vl;                        
wire    [1 :0]  pipe_h5_vlmul;                     
wire    [2 :0]  pipe_h5_vsew;                      
wire    [2 :0]  pipe_h6_base;                      
wire    [15:0]  pipe_h6_data;                      
wire    [2 :0]  pipe_h6_split0_type;               
wire    [2 :0]  pipe_h6_split1_type;               
wire    [7 :0]  pipe_h6_vl;                        
wire    [1 :0]  pipe_h6_vlmul;                     
wire    [2 :0]  pipe_h6_vsew;                      
wire    [2 :0]  pipe_h7_base;                      
wire    [15:0]  pipe_h7_data;                      
wire    [2 :0]  pipe_h7_split0_type;               
wire    [2 :0]  pipe_h7_split1_type;               
wire    [7 :0]  pipe_h7_vl;                        
wire    [1 :0]  pipe_h7_vlmul;                     
wire    [2 :0]  pipe_h7_vsew;                      
wire    [2 :0]  pipe_h8_base;                      
wire    [15:0]  pipe_h8_data;                      
wire    [2 :0]  pipe_h8_split0_type;               
wire    [2 :0]  pipe_h8_split1_type;               
wire    [7 :0]  pipe_h8_vl;                        
wire    [1 :0]  pipe_h8_vlmul;                     
wire    [2 :0]  pipe_h8_vsew;                      
wire    [7 :0]  pipe_hn_32_start;                  
wire    [7 :0]  pipe_hn_ab_br;                     
wire            pipe_hn_acc_err;                   
wire    [7 :0]  pipe_hn_auipc;                     
wire    [7 :0]  pipe_hn_bkpta;                     
wire            pipe_hn_bkpta_vld;                 
wire    [7 :0]  pipe_hn_bkptb;                     
wire            pipe_hn_bkptb_vld;                 
wire    [7 :0]  pipe_hn_chgflw;                    
wire    [7 :0]  pipe_hn_con_br;                    
wire    [7 :0]  pipe_hn_dst_vld;                   
wire    [7 :0]  pipe_hn_fence;                     
wire    [7 :0]  pipe_hn_ind_br;                    
wire    [7 :0]  pipe_hn_jal;                       
wire    [7 :0]  pipe_hn_jalr;                      
wire    [7 :0]  pipe_hn_ldst;                      
wire            pipe_hn_mmu_acc_deny;              
wire    [7 :0]  pipe_hn_no_spec;                   
wire            pipe_hn_no_spec_vld;               
wire    [7 :0]  pipe_hn_pc_oper;                   
wire    [7 :0]  pipe_hn_pcall;                     
wire            pipe_hn_pgflt;                     
wire    [7 :0]  pipe_hn_preturn;                   
wire    [7 :0]  pipe_hn_split0;                    
wire    [7 :0]  pipe_hn_split1;                    
wire    [7 :0]  pipe_hn_vl_pred;                   
wire    [7 :0]  pipe_hn_vld;                       
wire    [7 :0]  pipe_hn_vsetvli;                   
wire    [20:0]  pipe_ind_br_offset;                
wire    [15:0]  pipe_l0_btb_entry_hit;             
wire            pipe_l0_btb_hit;                   
wire    [38:0]  pipe_l0_btb_mispred_pc;            
wire            pipe_l0_btb_ras;                   
wire            pipe_l0_btb_ras_pc_hit;            
wire            pipe_l0_btb_update_cnt_bit;        
wire            pipe_l0_btb_update_vld;            
wire            pipe_l0_btb_update_vld_bit;        
wire    [3 :0]  pipe_l0_btb_wen;                   
wire    [3 :0]  pipe_no_chgflw_num;                
wire    [38:0]  pipe_ras_push_pc;                  
wire    [38:0]  pipe_ras_target_pc;                
wire            pipe_stall;                        
wire    [21:0]  pipe_vghr;                         
wire            pipe_vld;                          
wire            pipe_vld_for_gateclk;              
wire    [38:0]  pipe_vpc;                          
wire    [31:0]  pre_array_data;                    
wire    [7 :0]  preturn;                           
wire    [7 :0]  preturn_pre;                       
wire    [38:0]  ras_default_vpc;                   
wire            ras_ipdp_data_vld;                 
wire    [38:0]  ras_ipdp_pc;                       
wire    [38:0]  ras_target_pc;                     
wire            rtu_ifu_chgflw_vld;                
wire            rtu_ifu_flush;                     
wire            rtu_ifu_xx_expt_vld;               
wire            rtu_yy_xx_dbgon;                   
wire            sf_hit;                            
wire    [7 :0]  sfp_bar_pc_hit;                    
wire    [7 :0]  sfp_sf_pc_hit;                     
wire    [7 :0]  sfp_vl_pc_hit;                     
wire    [7 :0]  sfp_vl_pc_raw_hit;                 
wire    [7 :0]  split0;                            
wire    [7 :0]  split0_pre;                        
wire    [7 :0]  split1;                            
wire    [7 :0]  split1_pre;                        
wire            tail_vld;                          
wire            vl_hit;                            
wire            vl_hit_raw;                        
wire    [7 :0]  vl_pred;                           
wire    [7 :0]  vl_pred_pre;                       
wire    [7 :0]  vpc_onehot;                        
wire    [7 :0]  vsetvli;                           
wire    [7 :0]  vsetvli_pre;                       
wire            vtype_updt_vld;                    
wire    [7 :0]  way0_32;                           
wire    [7 :0]  way0_ab_br;                        
wire    [7 :0]  way0_ab_br_pre;                    
wire    [7 :0]  way0_auipc;                        
wire    [7 :0]  way0_auipc_pre;                    
wire    [7 :0]  way0_br;                           
wire    [7 :0]  way0_br_pre;                       
wire    [7 :0]  way0_branch;                       
wire    [7 :0]  way0_chgflw;                       
wire    [7 :0]  way0_chgflw_pre;                   
wire    [7 :0]  way0_con_br;                       
wire    [7 :0]  way0_con_br_pre;                   
wire    [7 :0]  way0_dst_vld;                      
wire    [7 :0]  way0_dst_vld_pre;                  
wire    [7 :0]  way0_fence;                        
wire    [7 :0]  way0_fence_pre;                    
wire            way0_h0_fence;                     
wire            way0_h0_ind_br;                    
wire            way0_h0_ld;                        
wire    [20:0]  way0_h0_offset;                    
wire            way0_h0_pcall;                     
wire            way0_h0_preturn;                   
wire    [2 :0]  way0_h0_split0_type;               
wire    [2 :0]  way0_h0_split1_type;               
wire            way0_h0_st;                        
wire            way0_h0_vl_pred;                   
wire            way0_h0_vl_pred_raw;               
wire    [7 :0]  way0_h0_vlmax;                     
wire    [1 :0]  way0_h0_vlmul;                     
wire            way0_h0_vsetvli;                   
wire    [2 :0]  way0_h0_vsew;                      
wire    [20:0]  way0_h1_offset;                    
wire    [2 :0]  way0_h1_split0_type;               
wire    [2 :0]  way0_h1_split1_type;               
wire    [20:0]  way0_h2_offset;                    
wire    [2 :0]  way0_h2_split0_type;               
wire    [2 :0]  way0_h2_split1_type;               
wire    [20:0]  way0_h3_offset;                    
wire    [2 :0]  way0_h3_split0_type;               
wire    [2 :0]  way0_h3_split1_type;               
wire    [20:0]  way0_h4_offset;                    
wire    [2 :0]  way0_h4_split0_type;               
wire    [2 :0]  way0_h4_split1_type;               
wire    [20:0]  way0_h5_offset;                    
wire    [2 :0]  way0_h5_split0_type;               
wire    [2 :0]  way0_h5_split1_type;               
wire    [20:0]  way0_h6_offset;                    
wire    [2 :0]  way0_h6_split0_type;               
wire    [2 :0]  way0_h6_split1_type;               
wire    [20:0]  way0_h7_offset;                    
wire    [2 :0]  way0_h7_split0_type;               
wire    [2 :0]  way0_h7_split1_type;               
wire    [20:0]  way0_h8_offset;                    
wire    [2 :0]  way0_h8_split0_type;               
wire    [2 :0]  way0_h8_split1_type;               
wire            way0_hit;                          
wire            way0_hit_short;                    
wire    [7 :0]  way0_ind_br;                       
wire    [7 :0]  way0_ind_br_pre;                   
wire    [7 :0]  way0_inst_ld_pre;                  
wire    [7 :0]  way0_inst_st_pre;                  
wire    [7 :0]  way0_jal;                          
wire    [7 :0]  way0_jal_pre;                      
wire    [7 :0]  way0_jalr;                         
wire    [7 :0]  way0_jalr_pre;                     
wire    [7 :0]  way0_ld;                           
wire            way0_no_spec;                      
wire    [7 :0]  way0_pc_oper;                      
wire    [7 :0]  way0_pc_oper_pre;                  
wire    [7 :0]  way0_pcall;                        
wire    [7 :0]  way0_pcall_pre;                    
wire    [7 :0]  way0_preturn;                      
wire    [7 :0]  way0_preturn_pre;                  
wire    [7 :0]  way0_st;                           
wire    [7 :0]  way0_vl_pred_pre;                  
wire    [63:0]  way0_vlmax;                        
wire    [15:0]  way0_vlmul;                        
wire    [7 :0]  way0_vsetvli;                      
wire    [7 :0]  way0_vsetvli_pre;                  
wire    [23:0]  way0_vsew;                         
wire    [7 :0]  way1_32;                           
wire    [7 :0]  way1_ab_br;                        
wire    [7 :0]  way1_ab_br_pre;                    
wire    [7 :0]  way1_auipc;                        
wire    [7 :0]  way1_auipc_pre;                    
wire    [7 :0]  way1_br;                           
wire    [7 :0]  way1_br_pre;                       
wire    [7 :0]  way1_branch;                       
wire    [7 :0]  way1_chgflw;                       
wire    [7 :0]  way1_chgflw_pre;                   
wire    [7 :0]  way1_con_br;                       
wire    [7 :0]  way1_con_br_pre;                   
wire    [7 :0]  way1_dst_vld;                      
wire    [7 :0]  way1_dst_vld_pre;                  
wire    [7 :0]  way1_fence;                        
wire    [7 :0]  way1_fence_pre;                    
wire            way1_h0_fence;                     
wire            way1_h0_ind_br;                    
wire            way1_h0_ld;                        
wire    [20:0]  way1_h0_offset;                    
wire            way1_h0_pcall;                     
wire            way1_h0_preturn;                   
wire    [2 :0]  way1_h0_split0_type;               
wire    [2 :0]  way1_h0_split1_type;               
wire            way1_h0_st;                        
wire            way1_h0_vl_pred;                   
wire            way1_h0_vl_pred_raw;               
wire    [7 :0]  way1_h0_vlmax;                     
wire    [1 :0]  way1_h0_vlmul;                     
wire            way1_h0_vsetvli;                   
wire    [2 :0]  way1_h0_vsew;                      
wire    [20:0]  way1_h1_offset;                    
wire    [2 :0]  way1_h1_split0_type;               
wire    [2 :0]  way1_h1_split1_type;               
wire    [20:0]  way1_h2_offset;                    
wire    [2 :0]  way1_h2_split0_type;               
wire    [2 :0]  way1_h2_split1_type;               
wire    [20:0]  way1_h3_offset;                    
wire    [2 :0]  way1_h3_split0_type;               
wire    [2 :0]  way1_h3_split1_type;               
wire    [20:0]  way1_h4_offset;                    
wire    [2 :0]  way1_h4_split0_type;               
wire    [2 :0]  way1_h4_split1_type;               
wire    [20:0]  way1_h5_offset;                    
wire    [2 :0]  way1_h5_split0_type;               
wire    [2 :0]  way1_h5_split1_type;               
wire    [20:0]  way1_h6_offset;                    
wire    [2 :0]  way1_h6_split0_type;               
wire    [2 :0]  way1_h6_split1_type;               
wire    [20:0]  way1_h7_offset;                    
wire    [2 :0]  way1_h7_split0_type;               
wire    [2 :0]  way1_h7_split1_type;               
wire    [20:0]  way1_h8_offset;                    
wire    [2 :0]  way1_h8_split0_type;               
wire    [2 :0]  way1_h8_split1_type;               
wire    [7 :0]  way1_ind_br;                       
wire    [7 :0]  way1_ind_br_pre;                   
wire    [7 :0]  way1_inst_ld_pre;                  
wire    [7 :0]  way1_inst_st_pre;                  
wire    [7 :0]  way1_jal;                          
wire    [7 :0]  way1_jal_pre;                      
wire    [7 :0]  way1_jalr;                         
wire    [7 :0]  way1_jalr_pre;                     
wire    [7 :0]  way1_ld;                           
wire            way1_no_spec;                      
wire    [7 :0]  way1_pc_oper;                      
wire    [7 :0]  way1_pc_oper_pre;                  
wire    [7 :0]  way1_pcall;                        
wire    [7 :0]  way1_pcall_pre;                    
wire    [7 :0]  way1_preturn;                      
wire    [7 :0]  way1_preturn_pre;                  
wire    [7 :0]  way1_st;                           
wire    [7 :0]  way1_vl_pred_pre;                  
wire    [63:0]  way1_vlmax;                        
wire    [15:0]  way1_vlmul;                        
wire    [7 :0]  way1_vsetvli;                      
wire    [7 :0]  way1_vsetvli_pre;                  
wire    [23:0]  way1_vsew;                         


parameter  PC_WIDTH = 40;
//==========================================================
//                     VPC Onehot
//==========================================================
//VPC onehot may come from two way:
//  1.if more than one br stall occur last cycle : stall_vpc
//  2.if no more than one br stall : if_vpc
//This part of logic maybe put in IF Stage
assign vpc_onehot[7:0] = ipctrl_ipdp_vpc_onehot[7:0];

//==========================================================
//                 IP data Parity Check
//==========================================================

//==========================================================
//                     Data from ifdp
//==========================================================
//ip_vpc
assign ip_vpc[PC_WIDTH-2:0]          = ifdp_ipdp_vpc[PC_WIDTH-2:0];
assign ipdp_ipctrl_vpc[PC_WIDTH-2:0] = ip_vpc[PC_WIDTH-2:0];
assign ipdp_bht_vpc[PC_WIDTH-2:0]    = ip_vpc[PC_WIDTH-2:0];
assign ipdp_bht_h0_con_br            = h0_vld_pre && 
                                       h0_con_br_pre && 
                                       ipctrl_ipdp_bht_vld;
 
//icache way0
assign h1_high_way0[13:0]  = ifdp_ipdp_h1_inst_high_way0[13:0]; 
assign h2_high_way0[13:0]  = ifdp_ipdp_h2_inst_high_way0[13:0]; 
assign h3_high_way0[13:0]  = ifdp_ipdp_h3_inst_high_way0[13:0]; 
assign h4_high_way0[13:0]  = ifdp_ipdp_h4_inst_high_way0[13:0]; 
assign h5_high_way0[13:0]  = ifdp_ipdp_h5_inst_high_way0[13:0]; 
assign h6_high_way0[13:0]  = ifdp_ipdp_h6_inst_high_way0[13:0]; 
assign h7_high_way0[13:0]  = ifdp_ipdp_h7_inst_high_way0[13:0]; 
assign h8_high_way0[13:0]  = ifdp_ipdp_h8_inst_high_way0[13:0]; 

assign h1_low_way0[1:0]    = ifdp_ipdp_h1_inst_low_way0[1:0];
assign h2_low_way0[1:0]    = ifdp_ipdp_h2_inst_low_way0[1:0];
assign h3_low_way0[1:0]    = ifdp_ipdp_h3_inst_low_way0[1:0];
assign h4_low_way0[1:0]    = ifdp_ipdp_h4_inst_low_way0[1:0];
assign h5_low_way0[1:0]    = ifdp_ipdp_h5_inst_low_way0[1:0];
assign h6_low_way0[1:0]    = ifdp_ipdp_h6_inst_low_way0[1:0];
assign h7_low_way0[1:0]    = ifdp_ipdp_h7_inst_low_way0[1:0];
assign h8_low_way0[1:0]    = ifdp_ipdp_h8_inst_low_way0[1:0];

//hn_br,hn_bry1,hn_bry0
//hn_bry1 : suppose h1 is the start of one inst
//hn_bry0 : suppose h1 is not the start of one inst
assign h1_precode_way0[3:0] = ifdp_ipdp_h1_precode_way0[3:0];
assign h2_precode_way0[3:0] = ifdp_ipdp_h2_precode_way0[3:0];
assign h3_precode_way0[3:0] = ifdp_ipdp_h3_precode_way0[3:0];
assign h4_precode_way0[3:0] = ifdp_ipdp_h4_precode_way0[3:0];
assign h5_precode_way0[3:0] = ifdp_ipdp_h5_precode_way0[3:0];
assign h6_precode_way0[3:0] = ifdp_ipdp_h6_precode_way0[3:0];
assign h7_precode_way0[3:0] = ifdp_ipdp_h7_precode_way0[3:0];
assign h8_precode_way0[3:0] = ifdp_ipdp_h8_precode_way0[3:0];


//icache way1
assign h1_high_way1[13:0]  = ifdp_ipdp_h1_inst_high_way1[13:0]; 
assign h2_high_way1[13:0]  = ifdp_ipdp_h2_inst_high_way1[13:0]; 
assign h3_high_way1[13:0]  = ifdp_ipdp_h3_inst_high_way1[13:0]; 
assign h4_high_way1[13:0]  = ifdp_ipdp_h4_inst_high_way1[13:0]; 
assign h5_high_way1[13:0]  = ifdp_ipdp_h5_inst_high_way1[13:0]; 
assign h6_high_way1[13:0]  = ifdp_ipdp_h6_inst_high_way1[13:0]; 
assign h7_high_way1[13:0]  = ifdp_ipdp_h7_inst_high_way1[13:0]; 
assign h8_high_way1[13:0]  = ifdp_ipdp_h8_inst_high_way1[13:0]; 

assign h1_low_way1[1:0]    = ifdp_ipdp_h1_inst_low_way1[1:0];
assign h2_low_way1[1:0]    = ifdp_ipdp_h2_inst_low_way1[1:0];
assign h3_low_way1[1:0]    = ifdp_ipdp_h3_inst_low_way1[1:0];
assign h4_low_way1[1:0]    = ifdp_ipdp_h4_inst_low_way1[1:0];
assign h5_low_way1[1:0]    = ifdp_ipdp_h5_inst_low_way1[1:0];
assign h6_low_way1[1:0]    = ifdp_ipdp_h6_inst_low_way1[1:0];
assign h7_low_way1[1:0]    = ifdp_ipdp_h7_inst_low_way1[1:0];
assign h8_low_way1[1:0]    = ifdp_ipdp_h8_inst_low_way1[1:0];

//hn_br,hn_bry1,hn_bry0
//hn_bry1 : suppose h1 is the start of one inst
//hn_bry0 : suppose h1 is not the start of one inst
assign h1_precode_way1[3:0] = ifdp_ipdp_h1_precode_way1[3:0];
assign h2_precode_way1[3:0] = ifdp_ipdp_h2_precode_way1[3:0];
assign h3_precode_way1[3:0] = ifdp_ipdp_h3_precode_way1[3:0];
assign h4_precode_way1[3:0] = ifdp_ipdp_h4_precode_way1[3:0];
assign h5_precode_way1[3:0] = ifdp_ipdp_h5_precode_way1[3:0];
assign h6_precode_way1[3:0] = ifdp_ipdp_h6_precode_way1[3:0];
assign h7_precode_way1[3:0] = ifdp_ipdp_h7_precode_way1[3:0];
assign h8_precode_way1[3:0] = ifdp_ipdp_h8_precode_way1[3:0];

//==========================================================
//                 IP Pre_Decode Connect
//==========================================================
//way0 connect signal
assign h1_data_way0[15:0] = {h1_high_way0[13:0], h1_low_way0[1:0]};
assign h2_data_way0[15:0] = {h2_high_way0[13:0], h2_low_way0[1:0]};
assign h3_data_way0[15:0] = {h3_high_way0[13:0], h3_low_way0[1:0]};
assign h4_data_way0[15:0] = {h4_high_way0[13:0], h4_low_way0[1:0]};
assign h5_data_way0[15:0] = {h5_high_way0[13:0], h5_low_way0[1:0]};
assign h6_data_way0[15:0] = {h6_high_way0[13:0], h6_low_way0[1:0]};
assign h7_data_way0[15:0] = {h7_high_way0[13:0], h7_low_way0[1:0]};
assign h8_data_way0[15:0] = {h8_high_way0[13:0], h8_low_way0[1:0]};
assign h1_br_way0         = h1_precode_way0[2];
assign h2_br_way0         = h2_precode_way0[2];
assign h3_br_way0         = h3_precode_way0[2];
assign h4_br_way0         = h4_precode_way0[2];
assign h5_br_way0         = h5_precode_way0[2];
assign h6_br_way0         = h6_precode_way0[2];
assign h7_br_way0         = h7_precode_way0[2];
assign h8_br_way0         = h8_precode_way0[2];
assign h1_ab_br_way0      = h1_precode_way0[3];
assign h2_ab_br_way0      = h2_precode_way0[3];
assign h3_ab_br_way0      = h3_precode_way0[3];
assign h4_ab_br_way0      = h4_precode_way0[3];
assign h5_ab_br_way0      = h5_precode_way0[3];
assign h6_ab_br_way0      = h6_precode_way0[3];
assign h7_ab_br_way0      = h7_precode_way0[3];
assign h8_ab_br_way0      = h8_precode_way0[3];


//way1 connect signal
assign h1_data_way1[15:0] = {h1_high_way1[13:0], h1_low_way1[1:0]};
assign h2_data_way1[15:0] = {h2_high_way1[13:0], h2_low_way1[1:0]};
assign h3_data_way1[15:0] = {h3_high_way1[13:0], h3_low_way1[1:0]};
assign h4_data_way1[15:0] = {h4_high_way1[13:0], h4_low_way1[1:0]};
assign h5_data_way1[15:0] = {h5_high_way1[13:0], h5_low_way1[1:0]};
assign h6_data_way1[15:0] = {h6_high_way1[13:0], h6_low_way1[1:0]};
assign h7_data_way1[15:0] = {h7_high_way1[13:0], h7_low_way1[1:0]};
assign h8_data_way1[15:0] = {h8_high_way1[13:0], h8_low_way1[1:0]};
assign h1_br_way1         = h1_precode_way1[2];
assign h2_br_way1         = h2_precode_way1[2];
assign h3_br_way1         = h3_precode_way1[2];
assign h4_br_way1         = h4_precode_way1[2];
assign h5_br_way1         = h5_precode_way1[2];
assign h6_br_way1         = h6_precode_way1[2];
assign h7_br_way1         = h7_precode_way1[2];
assign h8_br_way1         = h8_precode_way1[2];
assign h1_ab_br_way1      = h1_precode_way1[3];
assign h2_ab_br_way1      = h2_precode_way1[3];
assign h3_ab_br_way1      = h3_precode_way1[3];
assign h4_ab_br_way1      = h4_precode_way1[3];
assign h5_ab_br_way1      = h5_precode_way1[3];
assign h6_ab_br_way1      = h6_precode_way1[3];
assign h7_ab_br_way1      = h7_precode_way1[3];
assign h8_ab_br_way1      = h8_precode_way1[3];

//for timing consideration,had inst will firstly sent to ip stage 
assign had_inst[31:0]     = had_ifu_ir[31:0];
assign had_data[15:0]     = had_ifu_ir[15:0];

//ip_decode_unit
// &ConnRule(s/data/data_way0/); @238
// &ConnRule(s/ipdecode_ipdp_/way0_/); @239
// &Instance("ct_ifu_ipdecode", "x_ct_ifu_ipdecode0"); @240
ct_ifu_ipdecode  x_ct_ifu_ipdecode0 (
  .cp0_idu_cskyee               (cp0_idu_cskyee              ),
  .cp0_idu_frm                  (cp0_idu_frm                 ),
  .cp0_idu_fs                   (cp0_idu_fs                  ),
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .h0_data                      (h0_data                     ),
  .h1_br                        (h1_br_way0                  ),
  .h1_data                      (h1_data_way0                ),
  .h2_br                        (h2_br_way0                  ),
  .h2_data                      (h2_data_way0                ),
  .h3_br                        (h3_br_way0                  ),
  .h3_data                      (h3_data_way0                ),
  .h4_br                        (h4_br_way0                  ),
  .h4_data                      (h4_data_way0                ),
  .h5_br                        (h5_br_way0                  ),
  .h5_data                      (h5_data_way0                ),
  .h6_br                        (h6_br_way0                  ),
  .h6_data                      (h6_data_way0                ),
  .h7_br                        (h7_br_way0                  ),
  .h7_data                      (h7_data_way0                ),
  .h8_br                        (h8_br_way0                  ),
  .h8_data                      (h8_data_way0                ),
  .ipdecode_ipdp_auipc          (way0_auipc                  ),
  .ipdecode_ipdp_branch         (way0_branch                 ),
  .ipdecode_ipdp_chgflw         (way0_chgflw                 ),
  .ipdecode_ipdp_con_br         (way0_con_br                 ),
  .ipdecode_ipdp_dst_vld        (way0_dst_vld                ),
  .ipdecode_ipdp_fence          (way0_fence                  ),
  .ipdecode_ipdp_h0_fence       (way0_h0_fence               ),
  .ipdecode_ipdp_h0_ind_br      (way0_h0_ind_br              ),
  .ipdecode_ipdp_h0_ld          (way0_h0_ld                  ),
  .ipdecode_ipdp_h0_offset      (way0_h0_offset              ),
  .ipdecode_ipdp_h0_pcall       (way0_h0_pcall               ),
  .ipdecode_ipdp_h0_preturn     (way0_h0_preturn             ),
  .ipdecode_ipdp_h0_split0_type (way0_h0_split0_type         ),
  .ipdecode_ipdp_h0_split1_type (way0_h0_split1_type         ),
  .ipdecode_ipdp_h0_st          (way0_h0_st                  ),
  .ipdecode_ipdp_h0_vlmax       (way0_h0_vlmax               ),
  .ipdecode_ipdp_h0_vlmul       (way0_h0_vlmul               ),
  .ipdecode_ipdp_h0_vsetvli     (way0_h0_vsetvli             ),
  .ipdecode_ipdp_h0_vsew        (way0_h0_vsew                ),
  .ipdecode_ipdp_h1_offset      (way0_h1_offset              ),
  .ipdecode_ipdp_h1_split0_type (way0_h1_split0_type         ),
  .ipdecode_ipdp_h1_split1_type (way0_h1_split1_type         ),
  .ipdecode_ipdp_h2_offset      (way0_h2_offset              ),
  .ipdecode_ipdp_h2_split0_type (way0_h2_split0_type         ),
  .ipdecode_ipdp_h2_split1_type (way0_h2_split1_type         ),
  .ipdecode_ipdp_h3_offset      (way0_h3_offset              ),
  .ipdecode_ipdp_h3_split0_type (way0_h3_split0_type         ),
  .ipdecode_ipdp_h3_split1_type (way0_h3_split1_type         ),
  .ipdecode_ipdp_h4_offset      (way0_h4_offset              ),
  .ipdecode_ipdp_h4_split0_type (way0_h4_split0_type         ),
  .ipdecode_ipdp_h4_split1_type (way0_h4_split1_type         ),
  .ipdecode_ipdp_h5_offset      (way0_h5_offset              ),
  .ipdecode_ipdp_h5_split0_type (way0_h5_split0_type         ),
  .ipdecode_ipdp_h5_split1_type (way0_h5_split1_type         ),
  .ipdecode_ipdp_h6_offset      (way0_h6_offset              ),
  .ipdecode_ipdp_h6_split0_type (way0_h6_split0_type         ),
  .ipdecode_ipdp_h6_split1_type (way0_h6_split1_type         ),
  .ipdecode_ipdp_h7_offset      (way0_h7_offset              ),
  .ipdecode_ipdp_h7_split0_type (way0_h7_split0_type         ),
  .ipdecode_ipdp_h7_split1_type (way0_h7_split1_type         ),
  .ipdecode_ipdp_h8_offset      (way0_h8_offset              ),
  .ipdecode_ipdp_h8_split0_type (way0_h8_split0_type         ),
  .ipdecode_ipdp_h8_split1_type (way0_h8_split1_type         ),
  .ipdecode_ipdp_ind_br         (way0_ind_br                 ),
  .ipdecode_ipdp_jal            (way0_jal                    ),
  .ipdecode_ipdp_jalr           (way0_jalr                   ),
  .ipdecode_ipdp_ld             (way0_ld                     ),
  .ipdecode_ipdp_pc_oper        (way0_pc_oper                ),
  .ipdecode_ipdp_pcall          (way0_pcall                  ),
  .ipdecode_ipdp_preturn        (way0_preturn                ),
  .ipdecode_ipdp_st             (way0_st                     ),
  .ipdecode_ipdp_vlmax          (way0_vlmax                  ),
  .ipdecode_ipdp_vlmul          (way0_vlmul                  ),
  .ipdecode_ipdp_vsetvli        (way0_vsetvli                ),
  .ipdecode_ipdp_vsew           (way0_vsew                   )
);

// &Connect(.h0_data       (h0_data)); @241
// &Connect(.h1_br         (h1_br_way0)); @242
// &Connect(.h2_br         (h2_br_way0)); @243
// &Connect(.h3_br         (h3_br_way0)); @244
// &Connect(.h4_br         (h4_br_way0)); @245
// &Connect(.h5_br         (h5_br_way0)); @246
// &Connect(.h6_br         (h6_br_way0)); @247
// &Connect(.h7_br         (h7_br_way0)); @248
// &Connect(.h8_br         (h8_br_way0)); @249


// &ConnRule(s/data/data_way1/); @252
// &ConnRule(s/ipdecode_ipdp_/way1_/); @253
// &Instance("ct_ifu_ipdecode", "x_ct_ifu_ipdecode1"); @254
ct_ifu_ipdecode  x_ct_ifu_ipdecode1 (
  .cp0_idu_cskyee               (cp0_idu_cskyee              ),
  .cp0_idu_frm                  (cp0_idu_frm                 ),
  .cp0_idu_fs                   (cp0_idu_fs                  ),
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .h0_data                      (h0_data                     ),
  .h1_br                        (h1_br_way1                  ),
  .h1_data                      (h1_data_way1                ),
  .h2_br                        (h2_br_way1                  ),
  .h2_data                      (h2_data_way1                ),
  .h3_br                        (h3_br_way1                  ),
  .h3_data                      (h3_data_way1                ),
  .h4_br                        (h4_br_way1                  ),
  .h4_data                      (h4_data_way1                ),
  .h5_br                        (h5_br_way1                  ),
  .h5_data                      (h5_data_way1                ),
  .h6_br                        (h6_br_way1                  ),
  .h6_data                      (h6_data_way1                ),
  .h7_br                        (h7_br_way1                  ),
  .h7_data                      (h7_data_way1                ),
  .h8_br                        (h8_br_way1                  ),
  .h8_data                      (h8_data_way1                ),
  .ipdecode_ipdp_auipc          (way1_auipc                  ),
  .ipdecode_ipdp_branch         (way1_branch                 ),
  .ipdecode_ipdp_chgflw         (way1_chgflw                 ),
  .ipdecode_ipdp_con_br         (way1_con_br                 ),
  .ipdecode_ipdp_dst_vld        (way1_dst_vld                ),
  .ipdecode_ipdp_fence          (way1_fence                  ),
  .ipdecode_ipdp_h0_fence       (way1_h0_fence               ),
  .ipdecode_ipdp_h0_ind_br      (way1_h0_ind_br              ),
  .ipdecode_ipdp_h0_ld          (way1_h0_ld                  ),
  .ipdecode_ipdp_h0_offset      (way1_h0_offset              ),
  .ipdecode_ipdp_h0_pcall       (way1_h0_pcall               ),
  .ipdecode_ipdp_h0_preturn     (way1_h0_preturn             ),
  .ipdecode_ipdp_h0_split0_type (way1_h0_split0_type         ),
  .ipdecode_ipdp_h0_split1_type (way1_h0_split1_type         ),
  .ipdecode_ipdp_h0_st          (way1_h0_st                  ),
  .ipdecode_ipdp_h0_vlmax       (way1_h0_vlmax               ),
  .ipdecode_ipdp_h0_vlmul       (way1_h0_vlmul               ),
  .ipdecode_ipdp_h0_vsetvli     (way1_h0_vsetvli             ),
  .ipdecode_ipdp_h0_vsew        (way1_h0_vsew                ),
  .ipdecode_ipdp_h1_offset      (way1_h1_offset              ),
  .ipdecode_ipdp_h1_split0_type (way1_h1_split0_type         ),
  .ipdecode_ipdp_h1_split1_type (way1_h1_split1_type         ),
  .ipdecode_ipdp_h2_offset      (way1_h2_offset              ),
  .ipdecode_ipdp_h2_split0_type (way1_h2_split0_type         ),
  .ipdecode_ipdp_h2_split1_type (way1_h2_split1_type         ),
  .ipdecode_ipdp_h3_offset      (way1_h3_offset              ),
  .ipdecode_ipdp_h3_split0_type (way1_h3_split0_type         ),
  .ipdecode_ipdp_h3_split1_type (way1_h3_split1_type         ),
  .ipdecode_ipdp_h4_offset      (way1_h4_offset              ),
  .ipdecode_ipdp_h4_split0_type (way1_h4_split0_type         ),
  .ipdecode_ipdp_h4_split1_type (way1_h4_split1_type         ),
  .ipdecode_ipdp_h5_offset      (way1_h5_offset              ),
  .ipdecode_ipdp_h5_split0_type (way1_h5_split0_type         ),
  .ipdecode_ipdp_h5_split1_type (way1_h5_split1_type         ),
  .ipdecode_ipdp_h6_offset      (way1_h6_offset              ),
  .ipdecode_ipdp_h6_split0_type (way1_h6_split0_type         ),
  .ipdecode_ipdp_h6_split1_type (way1_h6_split1_type         ),
  .ipdecode_ipdp_h7_offset      (way1_h7_offset              ),
  .ipdecode_ipdp_h7_split0_type (way1_h7_split0_type         ),
  .ipdecode_ipdp_h7_split1_type (way1_h7_split1_type         ),
  .ipdecode_ipdp_h8_offset      (way1_h8_offset              ),
  .ipdecode_ipdp_h8_split0_type (way1_h8_split0_type         ),
  .ipdecode_ipdp_h8_split1_type (way1_h8_split1_type         ),
  .ipdecode_ipdp_ind_br         (way1_ind_br                 ),
  .ipdecode_ipdp_jal            (way1_jal                    ),
  .ipdecode_ipdp_jalr           (way1_jalr                   ),
  .ipdecode_ipdp_ld             (way1_ld                     ),
  .ipdecode_ipdp_pc_oper        (way1_pc_oper                ),
  .ipdecode_ipdp_pcall          (way1_pcall                  ),
  .ipdecode_ipdp_preturn        (way1_preturn                ),
  .ipdecode_ipdp_st             (way1_st                     ),
  .ipdecode_ipdp_vlmax          (way1_vlmax                  ),
  .ipdecode_ipdp_vlmul          (way1_vlmul                  ),
  .ipdecode_ipdp_vsetvli        (way1_vsetvli                ),
  .ipdecode_ipdp_vsew           (way1_vsew                   )
);

// &Connect(.h0_data       (h0_data)); @255
// &Connect(.h1_br         (h1_br_way1)); @256
// &Connect(.h2_br         (h2_br_way1)); @257
// &Connect(.h3_br         (h3_br_way1)); @258
// &Connect(.h4_br         (h4_br_way1)); @259
// &Connect(.h5_br         (h5_br_way1)); @260
// &Connect(.h6_br         (h6_br_way1)); @261
// &Connect(.h7_br         (h7_br_way1)); @262
// &Connect(.h8_br         (h8_br_way1)); @263

//no spec decode
assign way0_no_spec   = way0_st[0] && sf_hit  && sfp_pc_hit_onehot[0] 
                     || way0_ld[0] && bar_hit && sfp_pc_hit_onehot[0];
assign way1_no_spec   = way1_st[0] && sf_hit  && sfp_pc_hit_onehot[0] 
                     || way1_ld[0] && bar_hit && sfp_pc_hit_onehot[0];

assign way0_h0_vl_pred = way0_vsetvli[0] && vl_hit && sfp_pc_hit_onehot[0];  
assign way1_h0_vl_pred = way1_vsetvli[0] && vl_hit && sfp_pc_hit_onehot[0];  

assign way0_h0_vl_pred_raw = way0_vsetvli[0] && vl_hit_raw && sfp_pc_hit_onehot[0];  
assign way1_h0_vl_pred_raw = way1_vsetvli[0] && vl_hit_raw && sfp_pc_hit_onehot[0];  

//Decode For had
assign had_br = (had_data[6:0] == 7'b1101111) || //jal
                ({had_data[14:12],had_data[6:0]} == 10'b000_1100011) || //beq
                ({had_data[14:12],had_data[6:0]} == 10'b001_1100011) || //bne
                ({had_data[14:12],had_data[6:0]} == 10'b100_1100011) || //blt
                ({had_data[14:12],had_data[6:0]} == 10'b101_1100011) || //bge
                ({had_data[14:12],had_data[6:0]} == 10'b110_1100011) || //bltu
                ({had_data[14:12],had_data[6:0]} == 10'b111_1100011) || //bgeu
                ({had_data[15:14],had_data[1:0]} == 4'b1101) || //c.beqz/c.bnez
                ({had_data[15:13],had_data[1:0]} == 5'b10101); //c.j 
assign had_ab_br = (had_data[6:0] == 7'b1101111) || //jal
                   ({had_data[15:13],had_data[1:0]} == 5'b10101); //c.j 
//TODO split short/long
// &ConnRule(s/^x_/had_/); @290
// &Instance("ct_ifu_decd_normal","x_had_decd_normal"); @291
ct_ifu_decd_normal  x_had_decd_normal (
  .cp0_ifu_vl                   (cp0_ifu_vl                  ),
  .cp0_ifu_vsetvli_pred_disable (cp0_ifu_vsetvli_pred_disable),
  .x_auipc                      (had_auipc                   ),
  .x_br                         (had_br                      ),
  .x_branch                     (had_branch                  ),
  .x_chgflw                     (had_chgflw                  ),
  .x_con_br                     (had_con_br                  ),
  .x_dst_vld                    (had_dst_vld                 ),
  .x_ind_br                     (had_ind_br                  ),
  .x_inst                       (had_inst                    ),
  .x_jal                        (had_jal                     ),
  .x_jalr                       (had_jalr                    ),
  .x_ld                         (had_ld                      ),
  .x_offset                     (had_offset                  ),
  .x_pc_oper                    (had_pc_oper                 ),
  .x_pcall                      (had_pcall                   ),
  .x_preturn                    (had_preturn                 ),
  .x_st                         (had_st                      ),
  .x_vlmax                      (had_vlmax                   ),
  .x_vlmul                      (had_vlmul                   ),
  .x_vsetvli                    (had_vsetvli                 ),
  .x_vsew                       (had_vsew                    )
);

// &ConnRule(s/^x_/had_/); @292
// &Instance("ct_idu_id_decd_special","x_had_decd_special"); @293
ct_idu_id_decd_special  x_had_decd_special (
  .cp0_idu_cskyee        (cp0_idu_cskyee       ),
  .cp0_idu_frm           (cp0_idu_frm          ),
  .cp0_idu_fs            (cp0_idu_fs           ),
  .x_fence               (had_fence            ),
  .x_fence_type          (had_fence_type       ),
  .x_inst                (had_inst             ),
  .x_split               (had_split            ),
  .x_split_long_type     (had_split_long_type  ),
  .x_split_potnt         (had_split_potnt      ),
  .x_split_short         (had_split_short      ),
  .x_split_short_potnt   (had_split_short_potnt),
  .x_split_short_type    (had_split_short_type )
);

// &Connect(.x_vl (cp0_ifu_vl)); @294
// &Force("nonport","had_branch"); @295
// &Force("nonport","had_offset"); @296
// &Force("nonport","had_split_long_type"); @297
// &Force("nonport","had_split_short_type"); @298
// &Force("nonport","had_fence_type"); @299
// &Force("nonport","had_split_short"); @300
// &Force("nonport","had_split"); @301
assign had_split0_type[2:0] = had_split_short_potnt[2:0];
assign had_split1_type[2:0] = had_split_potnt[2:0];
assign had_split0           = had_split0_type[0]
                           || had_split0_type[1] && (had_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                           || had_split0_type[2] && (had_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign had_split1           = had_split1_type[0]
                           || had_split1_type[1] && (|had_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                           || had_split1_type[2] && (had_vlmul[1])    && (|cp0_ifu_vl[7:0]);

//Hn_32 decode        
assign h1_32_way0   = (h1_low_way0[1:0] == 2'b11);
assign h2_32_way0   = (h2_low_way0[1:0] == 2'b11);
assign h3_32_way0   = (h3_low_way0[1:0] == 2'b11);
assign h4_32_way0   = (h4_low_way0[1:0] == 2'b11);
assign h5_32_way0   = (h5_low_way0[1:0] == 2'b11);
assign h6_32_way0   = (h6_low_way0[1:0] == 2'b11);
assign h7_32_way0   = (h7_low_way0[1:0] == 2'b11);
assign h8_32_way0   = (h8_low_way0[1:0] == 2'b11);
assign way0_32[7:0] = {h1_32_way0,
                       h2_32_way0,
                       h3_32_way0,
                       h4_32_way0,
                       h5_32_way0,
                       h6_32_way0,
                       h7_32_way0,
                       h8_32_way0};

assign h1_32_way1   = (h1_low_way1[1:0] == 2'b11);
assign h2_32_way1   = (h2_low_way1[1:0] == 2'b11);
assign h3_32_way1   = (h3_low_way1[1:0] == 2'b11);
assign h4_32_way1   = (h4_low_way1[1:0] == 2'b11);
assign h5_32_way1   = (h5_low_way1[1:0] == 2'b11);
assign h6_32_way1   = (h6_low_way1[1:0] == 2'b11);
assign h7_32_way1   = (h7_low_way1[1:0] == 2'b11);
assign h8_32_way1   = (h8_low_way1[1:0] == 2'b11);
assign way1_32[7:0] = {h1_32_way1,
                       h2_32_way1,
                       h3_32_way1,
                       h4_32_way1,
                       h5_32_way1,
                       h6_32_way1,
                       h7_32_way1,
                       h8_32_way1};

assign ipdp_ipctrl_way0_32[7:0] = way0_32[7:0];
assign ipdp_ipctrl_way1_32[7:0] = way1_32[7:0];

assign way0_br[7:0]             = {h1_br_way0,
                                   h2_br_way0,
                                   h3_br_way0,
                                   h4_br_way0,
                                   h5_br_way0,
                                   h6_br_way0,
                                   h7_br_way0,
                                   h8_br_way0};
assign way1_br[7:0]             = {h1_br_way1,
                                   h2_br_way1,
                                   h3_br_way1,
                                   h4_br_way1,
                                   h5_br_way1,
                                   h6_br_way1,
                                   h7_br_way1,
                                   h8_br_way1};
assign way0_ab_br[7:0]          = {h1_ab_br_way0,
                                   h2_ab_br_way0,
                                   h3_ab_br_way0,
                                   h4_ab_br_way0,
                                   h5_ab_br_way0,
                                   h6_ab_br_way0,
                                   h7_ab_br_way0,
                                   h8_ab_br_way0};
assign way1_ab_br[7:0]          = {h1_ab_br_way1,
                                   h2_ab_br_way1,
                                   h3_ab_br_way1,
                                   h4_ab_br_way1,
                                   h5_ab_br_way1,
                                   h6_ab_br_way1,
                                   h7_ab_br_way1,
                                   h8_ab_br_way1};

assign ipdp_ipctrl_w0_br[7:0]    = way0_br[7:0];
assign ipdp_ipctrl_w1_br[7:0]    = way1_br[7:0];
assign ipdp_ipctrl_w0_ab_br[7:0] = way0_ab_br[7:0];
assign ipdp_ipctrl_w1_ab_br[7:0] = way1_ab_br[7:0];

//==========================================================
//               Icache way data select
//==========================================================
//Way select infor
assign way0_hit             = ipctrl_ipdp_icache_way0_hit;
assign way0_hit_short       = ipctrl_ipdp_icache_way0_hit_short;
assign bry_data[7:0]        = ipctrl_ipdp_bry_data[7:0];

//inst decode info
//br contain: 
//1. conditinal branch
//2. absolute branch
//3. preturn
//it is only used for l0 btb
assign br[7:0]         = br_pre[7:0]      & bry_data[7:0];
assign ab_br[7:0]      = ab_br_pre[7:0]   & bry_data[7:0]; 
assign con_br[7:0]     = con_br_pre[7:0]  & bry_data[7:0]; 
assign pcall[7:0]      = pcall_pre[7:0]   & bry_data[7:0]; 
assign preturn[7:0]    = preturn_pre[7:0] & bry_data[7:0]; 
assign pc_oper[7:0]    = pc_oper_pre[7:0] & bry_data[7:0]; 
assign chgflw[7:0]     = chgflw_pre[7:0]  & bry_data[7:0]; 
assign inst_ld[7:0]    = inst_ld_pre[7:0] & bry_data[7:0]; 
assign inst_st[7:0]    = inst_st_pre[7:0] & bry_data[7:0]; 
assign inst_auipc[7:0] = auipc_pre[7:0]   & bry_data[7:0]; 
assign ind_br[7:0]     = ind_br_pre[7:0]  & bry_data[7:0]; 
assign jal[7:0]        = jal_pre[7:0]     & bry_data[7:0]; 
assign jalr[7:0]       = jalr_pre[7:0]    & bry_data[7:0]; 
assign dst_vld[7:0]    = dst_vld_pre[7:0] & bry_data[7:0]; 
assign split0[7:0]     = split0_pre[7:0]  & bry_data[7:0]; 
assign split1[7:0]     = split1_pre[7:0]  & bry_data[7:0]; 
assign fence[7:0]      = fence_pre[7:0]   & bry_data[7:0]; 
assign vsetvli[7:0]    = vsetvli_pre[7:0] & bry_data[7:0];
assign vl_pred[7:0]    = vl_pred_pre[7:0] & bry_data[7:0];
assign bkpta[7:0]      = ifdp_ipdp_bkpta[7:0];
assign bkptb[7:0]      = ifdp_ipdp_bkptb[7:0];
assign inst_32[7]      = (h0_vld) ? 1'b0 : inst_32_pre[7];
assign inst_32[0]      = (inst_32_pre[0]);
assign inst_32[6:1]    = inst_32_pre[6:1];
assign inst_ldst[7:0]  = inst_ld[7:0] | inst_st[7:0];  

//H2-H7 br signal from ip stage predecode
//H1 br signal :
//  from ip stage predecode when H0 not valid
//  set to H0 br signal when H0 is valid
//H8 br signal
//  equal to ip stage predecode when H8 is 16 bit inst
//  set to 0 when H8 is 32 bit inst
//  Way0
assign way0_br_pre[7]         = (h0_vld) ? (h0_ab_br   || h0_con_br || h0_preturn) 
                                         : (way0_br[7] || way0_preturn[7]);
assign way0_ab_br_pre[7]      = (h0_vld) ? h0_ab_br      : way0_ab_br[7];
assign way0_con_br_pre[7]     = (h0_vld) ? h0_con_br     : way0_con_br[7];
assign way0_pcall_pre[7]      = (h0_vld) ? h0_pcall      : way0_pcall[7];
assign way0_preturn_pre[7]    = (h0_vld) ? h0_preturn    : way0_preturn[7];
assign way0_pc_oper_pre[7]    = (h0_vld) ? h0_pc_oper    : way0_pc_oper[7];
assign way0_chgflw_pre[7]     = (h0_vld) ? h0_chgflw     : way0_chgflw[7];
assign way0_auipc_pre[7]      = (h0_vld) ? h0_auipc      : way0_auipc[7];
assign way0_ind_br_pre[7]     = (h0_vld) ? h0_ind_br     : way0_ind_br[7];
assign way0_jal_pre[7]        = (h0_vld) ? h0_jal        : way0_jal[7];
assign way0_jalr_pre[7]       = (h0_vld) ? h0_jalr       : way0_jalr[7];
assign way0_fence_pre[7]      = (h0_vld) ? h0_fence      : way0_fence[7];
assign way0_inst_ld_pre[7]    = (h0_vld) ? h0_ld         : way0_ld[7];
assign way0_inst_st_pre[7]    = (h0_vld) ? h0_st         : way0_st[7];
assign way0_dst_vld_pre[7]    = (h0_vld) ? h0_dst_vld    : way0_dst_vld[7];
assign way0_vsetvli_pre[7]    = (h0_vld) ? h0_vsetvli    : way0_vsetvli[7];
assign way0_vl_pred_pre[7]    = (h0_vld) ? h0_vsetvli & h0_vl_pred
                                         : way0_vsetvli[7] & sfp_vl_pc_hit[7];


assign way0_br_pre[0]         = (inst_32_pre[0]) ? 1'b0 
                                                 : (way0_br[0] || way0_preturn[0]);
assign way0_ab_br_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way0_ab_br[0];
assign way0_con_br_pre[0]     = (inst_32_pre[0]) ? 1'b0 : way0_con_br[0];
assign way0_pcall_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way0_pcall[0];
assign way0_preturn_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way0_preturn[0];
assign way0_pc_oper_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way0_pc_oper[0];
assign way0_chgflw_pre[0]     = (inst_32_pre[0]) ? 1'b0 : way0_chgflw[0];
assign way0_auipc_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way0_auipc[0];
assign way0_ind_br_pre[0]     = (inst_32_pre[0]) ? 1'b0 : way0_ind_br[0];
assign way0_jal_pre[0]        = (inst_32_pre[0]) ? 1'b0 : way0_jal[0];
assign way0_jalr_pre[0]       = (inst_32_pre[0]) ? 1'b0 : way0_jalr[0];
assign way0_fence_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way0_fence[0];
assign way0_inst_ld_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way0_ld[0];
assign way0_inst_st_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way0_st[0];
assign way0_dst_vld_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way0_dst_vld[0];
assign way0_vsetvli_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way0_vsetvli[0];
assign way0_vl_pred_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way0_vsetvli[0] & sfp_vl_pc_hit[0];


assign way0_br_pre[6:1]       = way0_br[6:1] | way0_preturn[6:1];
assign way0_ab_br_pre[6:1]    = way0_ab_br[6:1];
assign way0_con_br_pre[6:1]   = way0_con_br[6:1];
assign way0_pcall_pre[6:1]    = way0_pcall[6:1];
assign way0_preturn_pre[6:1]  = way0_preturn[6:1];
assign way0_pc_oper_pre[6:1]  = way0_pc_oper[6:1];
assign way0_chgflw_pre[6:1]   = way0_chgflw[6:1];
assign way0_auipc_pre[6:1]    = way0_auipc[6:1];
assign way0_ind_br_pre[6:1]   = way0_ind_br[6:1];
assign way0_jal_pre[6:1]      = way0_jal[6:1];
assign way0_jalr_pre[6:1]     = way0_jalr[6:1];
assign way0_fence_pre[6:1]    = way0_fence[6:1];
assign way0_inst_ld_pre[6:1]  = way0_ld[6:1];
assign way0_inst_st_pre[6:1]  = way0_st[6:1];
assign way0_dst_vld_pre[6:1]  = way0_dst_vld[6:1];
assign way0_vsetvli_pre[6:1]  = way0_vsetvli[6:1];
assign way0_vl_pred_pre[6:1]  = way0_vsetvli[6:1] & sfp_vl_pc_hit[6:1];

//Way1
assign way1_br_pre[7]         = (h0_vld) ? (h0_ab_br   || h0_con_br || h0_preturn) 
                                         : (way1_br[7] || way1_preturn[7]);
assign way1_ab_br_pre[7]      = (h0_vld) ? h0_ab_br      : way1_ab_br[7];
assign way1_con_br_pre[7]     = (h0_vld) ? h0_con_br     : way1_con_br[7];
assign way1_pcall_pre[7]      = (h0_vld) ? h0_pcall      : way1_pcall[7];
assign way1_preturn_pre[7]    = (h0_vld) ? h0_preturn    : way1_preturn[7];
assign way1_pc_oper_pre[7]    = (h0_vld) ? h0_pc_oper    : way1_pc_oper[7];
assign way1_chgflw_pre[7]     = (h0_vld) ? h0_chgflw     : way1_chgflw[7];
assign way1_auipc_pre[7]      = (h0_vld) ? h0_auipc      : way1_auipc[7];
assign way1_ind_br_pre[7]     = (h0_vld) ? h0_ind_br     : way1_ind_br[7];
assign way1_jal_pre[7]        = (h0_vld) ? h0_jal        : way1_jal[7];
assign way1_jalr_pre[7]       = (h0_vld) ? h0_jalr       : way1_jalr[7];
assign way1_fence_pre[7]      = (h0_vld) ? h0_fence      : way1_fence[7];
assign way1_inst_ld_pre[7]    = (h0_vld) ? h0_ld         : way1_ld[7];
assign way1_inst_st_pre[7]    = (h0_vld) ? h0_st         : way1_st[7];
assign way1_dst_vld_pre[7]    = (h0_vld) ? h0_dst_vld    : way1_dst_vld[7];
assign way1_vsetvli_pre[7]    = (h0_vld) ? h0_vsetvli    : way1_vsetvli[7];
assign way1_vl_pred_pre[7]    = (h0_vld) ? h0_vsetvli & h0_vl_pred
                                         : way1_vsetvli[7] & sfp_vl_pc_hit[7];

assign way1_br_pre[0]         = (inst_32_pre[0]) ? 1'b0 
                                                 : (way1_br[0] || way1_preturn[0]);
assign way1_ab_br_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way1_ab_br[0];
assign way1_con_br_pre[0]     = (inst_32_pre[0]) ? 1'b0 : way1_con_br[0];
assign way1_pcall_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way1_pcall[0];
assign way1_preturn_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way1_preturn[0];
assign way1_pc_oper_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way1_pc_oper[0];
assign way1_chgflw_pre[0]     = (inst_32_pre[0]) ? 1'b0 : way1_chgflw[0];
assign way1_auipc_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way1_auipc[0];
assign way1_ind_br_pre[0]     = (inst_32_pre[0]) ? 1'b0 : way1_ind_br[0];
assign way1_jal_pre[0]        = (inst_32_pre[0]) ? 1'b0 : way1_jal[0];
assign way1_jalr_pre[0]       = (inst_32_pre[0]) ? 1'b0 : way1_jalr[0];
assign way1_fence_pre[0]      = (inst_32_pre[0]) ? 1'b0 : way1_fence[0];
assign way1_inst_ld_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way1_ld[0];
assign way1_inst_st_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way1_st[0];
assign way1_dst_vld_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way1_dst_vld[0];
assign way1_vsetvli_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way1_vsetvli[0];
assign way1_vl_pred_pre[0]    = (inst_32_pre[0]) ? 1'b0 : way1_vsetvli[0] & sfp_vl_pc_hit[0];


assign way1_br_pre[6:1]       = way1_br[6:1] | way1_preturn[6:1];
assign way1_ab_br_pre[6:1]    = way1_ab_br[6:1];
assign way1_con_br_pre[6:1]   = way1_con_br[6:1];
assign way1_pcall_pre[6:1]    = way1_pcall[6:1];
assign way1_preturn_pre[6:1]  = way1_preturn[6:1];
assign way1_pc_oper_pre[6:1]  = way1_pc_oper[6:1];
assign way1_chgflw_pre[6:1]   = way1_chgflw[6:1];
assign way1_auipc_pre[6:1]    = way1_auipc[6:1];
assign way1_ind_br_pre[6:1]   = way1_ind_br[6:1];
assign way1_jal_pre[6:1]      = way1_jal[6:1];
assign way1_jalr_pre[6:1]     = way1_jalr[6:1];
assign way1_fence_pre[6:1]    = way1_fence[6:1];
assign way1_inst_ld_pre[6:1]  = way1_ld[6:1];
assign way1_inst_st_pre[6:1]  = way1_st[6:1];
assign way1_dst_vld_pre[6:1]  = way1_dst_vld[6:1];
assign way1_vsetvli_pre[6:1]  = way1_vsetvli[6:1];
assign way1_vl_pred_pre[6:1]  = way1_vsetvli[6:1] & sfp_vl_pc_hit[6:1];

assign br_pre[7:0]      = (way0_hit) ? way0_br_pre[7:0]      : way1_br_pre[7:0];
assign ab_br_pre[7:0]   = (way0_hit) ? way0_ab_br_pre[7:0]   : way1_ab_br_pre[7:0];
assign con_br_pre[7:0]  = (way0_hit) ? way0_con_br_pre[7:0]  : way1_con_br_pre[7:0];
assign pcall_pre[7:0]   = (way0_hit) ? way0_pcall_pre[7:0]   : way1_pcall_pre[7:0];
assign preturn_pre[7:0] = (way0_hit) ? way0_preturn_pre[7:0] : way1_preturn_pre[7:0];
assign pc_oper_pre[7:0] = (way0_hit) ? way0_pc_oper_pre[7:0] : way1_pc_oper_pre[7:0];
assign chgflw_pre[7:0]  = (way0_hit) ? way0_chgflw_pre[7:0]  : way1_chgflw_pre[7:0];
assign auipc_pre[7:0]   = (way0_hit) ? way0_auipc_pre[7:0]   : way1_auipc_pre[7:0];
assign ind_br_pre[7:0]  = (way0_hit) ? way0_ind_br_pre[7:0]  : way1_ind_br_pre[7:0];
assign jal_pre[7:0]     = (way0_hit) ? way0_jal_pre[7:0]     : way1_jal_pre[7:0];
assign jalr_pre[7:0]    = (way0_hit) ? way0_jalr_pre[7:0]    : way1_jalr_pre[7:0];
assign fence_pre[7:0]   = (way0_hit) ? way0_fence_pre[7:0]   : way1_fence_pre[7:0];
assign inst_ld_pre[7:0] = (way0_hit) ? way0_inst_ld_pre[7:0] : way1_inst_ld_pre[7:0];
assign inst_st_pre[7:0] = (way0_hit) ? way0_inst_st_pre[7:0] : way1_inst_st_pre[7:0];
assign dst_vld_pre[7:0] = (way0_hit) ? way0_dst_vld_pre[7:0] : way1_dst_vld_pre[7:0];
assign vsetvli_pre[7:0] = (way0_hit) ? way0_vsetvli_pre[7:0] : way1_vsetvli_pre[7:0];
assign vl_pred_pre[7:0] =(way0_hit) ? way0_vl_pred_pre[7:0]: way1_vl_pred_pre[7:0];
assign inst_32_pre[7:0] = (way0_hit) ? way0_32[7:0]          : way1_32[7:0];

//h0 data
assign h0_ld            = (way0_hit) ? way0_h0_ld      : way1_h0_ld;
assign h0_st            = (way0_hit) ? way0_h0_st      : way1_h0_st;
//assign h0_split1        = (way0_hit) ? way0_h0_split1  : way1_h0_split1;
//assign h0_split0        = (way0_hit) ? way0_h0_split0  : way1_h0_split0;
assign h0_fence         = (way0_hit) ? way0_h0_fence   : way1_h0_fence;
assign h0_ind_br        = (way0_hit) ? way0_h0_ind_br  : way1_h0_ind_br;
assign h0_pcall         = (way0_hit) ? way0_h0_pcall   : way1_h0_pcall;
assign h0_preturn       = (way0_hit) ? way0_h0_preturn : way1_h0_preturn;
assign h0_vsetvli       = (way0_hit) ? way0_h0_vsetvli : way1_h0_vsetvli;

//inst data                    
assign h1_data[15:0] = (way0_hit) ? h1_data_way0[15:0] : h1_data_way1[15:0];
assign h2_data[15:0] = (way0_hit) ? h2_data_way0[15:0] : h2_data_way1[15:0];
assign h3_data[15:0] = (way0_hit) ? h3_data_way0[15:0] : h3_data_way1[15:0];
assign h4_data[15:0] = (way0_hit) ? h4_data_way0[15:0] : h4_data_way1[15:0];
assign h5_data[15:0] = (way0_hit) ? h5_data_way0[15:0] : h5_data_way1[15:0];
assign h6_data[15:0] = (way0_hit) ? h6_data_way0[15:0] : h6_data_way1[15:0];
assign h7_data[15:0] = (way0_hit) ? h7_data_way0[15:0] : h7_data_way1[15:0];
assign h8_data[15:0] = (way0_hit) ? h8_data_way0[15:0] : h8_data_way1[15:0];

//inst offset                     
assign h1_offset[20:0] = (way0_hit) ? way0_h1_offset[20:0] : way1_h1_offset[20:0];
assign h2_offset[20:0] = (way0_hit) ? way0_h2_offset[20:0] : way1_h2_offset[20:0];
assign h3_offset[20:0] = (way0_hit) ? way0_h3_offset[20:0] : way1_h3_offset[20:0];
assign h4_offset[20:0] = (way0_hit) ? way0_h4_offset[20:0] : way1_h4_offset[20:0];
assign h5_offset[20:0] = (way0_hit) ? way0_h5_offset[20:0] : way1_h5_offset[20:0];
assign h6_offset[20:0] = (way0_hit) ? way0_h6_offset[20:0] : way1_h6_offset[20:0];
assign h7_offset[20:0] = (way0_hit) ? way0_h7_offset[20:0] : way1_h7_offset[20:0];
assign h8_offset[20:0] = (way0_hit) ? way0_h8_offset[20:0] : way1_h8_offset[20:0];
assign h0_offset[20:0] = (way0_hit) ? way0_h0_offset[20:0] : way1_h0_offset[20:0];

//vlmul
assign h0_vlmul_pre[1:0] = (way0_hit) ? way0_h0_vlmul[1:0] : way1_h0_vlmul[1:0];
assign h1_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[15:14]  : way1_vlmul[15:14];
assign h2_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[13:12]  : way1_vlmul[13:12];
assign h3_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[11:10]  : way1_vlmul[11:10];
assign h4_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[ 9: 8]  : way1_vlmul[ 9: 8];
assign h5_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[ 7: 6]  : way1_vlmul[ 7: 6];
assign h6_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[ 5: 4]  : way1_vlmul[ 5: 4];
assign h7_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[ 3: 2]  : way1_vlmul[ 3: 2];
assign h8_vlmul_pre[1:0] = (way0_hit) ? way0_vlmul[ 1: 0]  : way1_vlmul[ 1: 0];

//vsew
assign h0_vsew_pre[2:0] = (way0_hit) ? way0_h0_vsew[2:0] : way1_h0_vsew[2:0];                                        
assign h1_vsew_pre[2:0] = (way0_hit) ? way0_vsew[23:21]  : way1_vsew[23:21];
assign h2_vsew_pre[2:0] = (way0_hit) ? way0_vsew[20:18]  : way1_vsew[20:18];
assign h3_vsew_pre[2:0] = (way0_hit) ? way0_vsew[17:15]  : way1_vsew[17:15];
assign h4_vsew_pre[2:0] = (way0_hit) ? way0_vsew[14:12]  : way1_vsew[14:12];
assign h5_vsew_pre[2:0] = (way0_hit) ? way0_vsew[11: 9]  : way1_vsew[11: 9];
assign h6_vsew_pre[2:0] = (way0_hit) ? way0_vsew[ 8: 6]  : way1_vsew[ 8: 6];
assign h7_vsew_pre[2:0] = (way0_hit) ? way0_vsew[ 5: 3]  : way1_vsew[ 5: 3];
assign h8_vsew_pre[2:0] = (way0_hit) ? way0_vsew[ 2: 0]  : way1_vsew[ 2: 0];

//vlmax
assign h0_vlmax_pre[7:0] = (way0_hit) ? way0_h0_vlmax[7:0]   : way1_h0_vlmax[7:0];
assign h1_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[63:56]    : way1_vlmax[63:56];
assign h2_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[55:48]    : way1_vlmax[55:48];
assign h3_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[47:40]    : way1_vlmax[47:40];
assign h4_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[39:32]    : way1_vlmax[39:32];
assign h5_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[31:24]    : way1_vlmax[31:24];
assign h6_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[23:16]    : way1_vlmax[23:16];
assign h7_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[15: 8]    : way1_vlmax[15: 8];
assign h8_vlmax_pre[7:0] = (way0_hit) ? way0_vlmax[ 7: 0]    : way1_vlmax[ 7: 0];

//split short
assign h0_split0_type[2:0] = (way0_hit) ? way0_h0_split0_type[2:0] : way1_h0_split0_type[2:0];
assign h1_split0_type[2:0] = (way0_hit) ? way0_h1_split0_type[2:0] : way1_h1_split0_type[2:0];
assign h2_split0_type[2:0] = (way0_hit) ? way0_h2_split0_type[2:0] : way1_h2_split0_type[2:0];
assign h3_split0_type[2:0] = (way0_hit) ? way0_h3_split0_type[2:0] : way1_h3_split0_type[2:0];
assign h4_split0_type[2:0] = (way0_hit) ? way0_h4_split0_type[2:0] : way1_h4_split0_type[2:0];
assign h5_split0_type[2:0] = (way0_hit) ? way0_h5_split0_type[2:0] : way1_h5_split0_type[2:0];
assign h6_split0_type[2:0] = (way0_hit) ? way0_h6_split0_type[2:0] : way1_h6_split0_type[2:0];
assign h7_split0_type[2:0] = (way0_hit) ? way0_h7_split0_type[2:0] : way1_h7_split0_type[2:0];
assign h8_split0_type[2:0] = (way0_hit) ? way0_h8_split0_type[2:0] : way1_h8_split0_type[2:0];

//split long
assign h0_split1_type[2:0] = (way0_hit) ? way0_h0_split1_type[2:0] : way1_h0_split1_type[2:0];
assign h1_split1_type[2:0] = (way0_hit) ? way0_h1_split1_type[2:0] : way1_h1_split1_type[2:0];
assign h2_split1_type[2:0] = (way0_hit) ? way0_h2_split1_type[2:0] : way1_h2_split1_type[2:0];
assign h3_split1_type[2:0] = (way0_hit) ? way0_h3_split1_type[2:0] : way1_h3_split1_type[2:0];
assign h4_split1_type[2:0] = (way0_hit) ? way0_h4_split1_type[2:0] : way1_h4_split1_type[2:0];
assign h5_split1_type[2:0] = (way0_hit) ? way0_h5_split1_type[2:0] : way1_h5_split1_type[2:0];
assign h6_split1_type[2:0] = (way0_hit) ? way0_h6_split1_type[2:0] : way1_h6_split1_type[2:0];
assign h7_split1_type[2:0] = (way0_hit) ? way0_h7_split1_type[2:0] : way1_h7_split1_type[2:0];
assign h8_split1_type[2:0] = (way0_hit) ? way0_h8_split1_type[2:0] : way1_h8_split1_type[2:0];

//==========================================================
//                   VLMUL & VSEW Update
//==========================================================
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    begin
      vlmul_reg[1:0] <= 2'b0;
      vsew_reg[2:0]  <= 3'b0;
      vl_reg[7:0]    <= 8'b0;
    end
    else if(vtype_updt_vld)
    begin
      vlmul_reg[1:0] <= vlmul_updt_value[1:0];
      vsew_reg[2:0]  <= vsew_updt_value[2:0];
      vl_reg[7:0]    <= vl_updt_value[7:0];
    end
    else
    begin
      vlmul_reg[1:0] <= vlmul_reg[1:0];
      vsew_reg[2:0]  <= vsew_reg[2:0];
      vl_reg[7:0]    <= vl_reg[7:0];
    end
end
assign ipdp_lbuf_vlmul_reg[1:0] = vlmul_reg[1:0];
assign ipdp_lbuf_vsew_reg[2:0]  = vsew_reg[2:0];
assign ipdp_lbuf_vl_reg[7:0]    = vl_reg[7:0];

assign ipdp_ibdp_vlmul_reg[1:0]  = vlmul_reg[1:0];
assign ipdp_ibdp_vsew_reg[2:0]   = vsew_reg[2:0];
assign ipdp_ibdp_vl_reg[7:0]     = vl_reg[7:0];

//vlmul/vsew can be updated by:
//1. Had vsetvli inst
//2. rtu chgflw
//3. rtu expt vld
//4. bju chgflw
//5. addrgen chgflw
//6. ib chgflw
//7. ip vsetvli inst

assign vtype_updt_vld = had_vtype_updt_vld
                     || rtu_ifu_chgflw_vld
                     || rtu_ifu_flush
                     || rtu_ifu_xx_expt_vld
                     || iu_ifu_chgflw_vld
                     || addrgen_xx_pcload
                     || ibctrl_ipdp_pcload
                     || lbuf_ipdp_vtype_updt_vld
                     || ip_vtype_updt_vld; 

// &CombBeg; @712
always @( cp0_ifu_vsew[2:0]
       or ibctrl_ipdp_chgflw_vlmul[1:0]
       or ibctrl_ipdp_chgflw_vsew[2:0]
       or addrgen_ipdp_chgflw_vlmul[1:0]
       or rtu_ifu_chgflw_vld
       or ibctrl_ipdp_chgflw_vl[7:0]
       or cp0_ifu_vlmul[1:0]
       or addrgen_ipdp_chgflw_vsew[2:0]
       or cp0_ifu_vl[7:0]
       or had_vlmul[1:0]
       or ip_vl[7:0]
       or lbuf_ipdp_updt_vsew[2:0]
       or addrgen_ipdp_chgflw_vl[7:0]
       or iu_ifu_chgflw_vsew[2:0]
       or rtu_ifu_flush
       or ip_vsew[2:0]
       or ip_vlmul[1:0]
       or iu_ifu_chgflw_vlmul[1:0]
       or iu_ifu_chgflw_vl[7:0]
       or had_vtype_updt_vld
       or ibctrl_ipdp_pcload
       or rtu_ifu_xx_expt_vld
       or lbuf_ipdp_updt_vl[7:0]
       or lbuf_ipdp_updt_vlmul[1:0]
       or had_vlmax[7:0]
       or addrgen_xx_pcload
       or had_vsew[2:0]
       or iu_ifu_chgflw_vld
       or lbuf_ipdp_vtype_updt_vld)
begin
if(had_vtype_updt_vld)
begin
  vlmul_updt_value[1:0] = had_vlmul[1:0];
  vsew_updt_value[2:0]  = had_vsew[2:0];
  vl_updt_value[7:0]    = had_vlmax[7:0];
end
else if(rtu_ifu_chgflw_vld || rtu_ifu_flush)
begin
  vlmul_updt_value[1:0] = cp0_ifu_vlmul[1:0];
  vsew_updt_value[2:0]  = cp0_ifu_vsew[2:0];
  vl_updt_value[7:0]    = cp0_ifu_vl[7:0];
end
else if(rtu_ifu_xx_expt_vld)
begin
  vlmul_updt_value[1:0] = cp0_ifu_vlmul[1:0];
  vsew_updt_value[2:0]  = cp0_ifu_vsew[2:0];
  vl_updt_value[7:0]    = cp0_ifu_vl[7:0];
end
else if(iu_ifu_chgflw_vld)
begin
  vlmul_updt_value[1:0] = iu_ifu_chgflw_vlmul[1:0];
  vsew_updt_value[2:0]  = iu_ifu_chgflw_vsew[2:0];
  vl_updt_value[7:0]    = iu_ifu_chgflw_vl[7:0];
end
else if(addrgen_xx_pcload) 
begin
  vlmul_updt_value[1:0] = addrgen_ipdp_chgflw_vlmul[1:0];
  vsew_updt_value[2:0]  = addrgen_ipdp_chgflw_vsew[2:0];
  vl_updt_value[7:0]    = addrgen_ipdp_chgflw_vl[7:0];
end
else if(ibctrl_ipdp_pcload)
begin
  vlmul_updt_value[1:0] = ibctrl_ipdp_chgflw_vlmul[1:0];
  vsew_updt_value[2:0]  = ibctrl_ipdp_chgflw_vsew[2:0];
  vl_updt_value[7:0]    = ibctrl_ipdp_chgflw_vl[7:0];
end
else if(lbuf_ipdp_vtype_updt_vld)
begin
  vlmul_updt_value[1:0] = lbuf_ipdp_updt_vlmul[1:0];
  vsew_updt_value[2:0]  = lbuf_ipdp_updt_vsew[2:0];
  vl_updt_value[7:0]    = lbuf_ipdp_updt_vl[7:0];
end
else
begin
  vlmul_updt_value[1:0] = ip_vlmul[1:0];
  vsew_updt_value[2:0]  = ip_vsew[2:0];
  vl_updt_value[7:0]    = ip_vl[7:0];
end
// &CombEnd; @761
end

//ctrl signal
assign had_vtype_updt_vld = had_ifu_ir_vld && had_vsetvli;
assign ip_vtype_updt_vld  = pipe_vld 
                        && !lbuf_ipdp_lbuf_active
                        && !pipe_stall
                        && !pcgen_ipctrl_pipe_cancel
                        && (|(vsetvli[7:0] & ip_vmask[7:0])
                            || h0_vsetvli && h0_vld); 

//vlmul update
//h0 update value:
//1. h0 vsetvli   : vtype new
//2. h0 not valid : Any
//3. h0 valid not vsetvli : vlmul reg
assign h0_vlmul[1:0] = (h0_vld && h0_vsetvli) ? h0_vlmul_pre[1:0] 
                                              : vlmul_reg[1:0];
// h1  update value
// 1. h0 valid    : h1 is not inst head,use vlmul the same as h0
// 2. h0 not valid & h1 vsetvli    : h1 vlmul new
// 3. h0 not valid & h1 not vsetvli: vlmul reg                                             
assign h1_vlmul[1:0] = (h0_vld    ) ? h0_vlmul[1:0]     
                                    : (vsetvli[7])
                                      ? h1_vlmul_pre[1:0]
                                      : vlmul_reg[1:0];
assign h2_vlmul[1:0] = (vsetvli[6]) ? h2_vlmul_pre[1:0] : h1_vlmul[1:0];
assign h3_vlmul[1:0] = (vsetvli[5]) ? h3_vlmul_pre[1:0] : h2_vlmul[1:0];
assign h4_vlmul[1:0] = (vsetvli[4]) ? h4_vlmul_pre[1:0] : h3_vlmul[1:0];
assign h5_vlmul[1:0] = (vsetvli[3]) ? h5_vlmul_pre[1:0] : h4_vlmul[1:0];
assign h6_vlmul[1:0] = (vsetvli[2]) ? h6_vlmul_pre[1:0] : h5_vlmul[1:0];
assign h7_vlmul[1:0] = (vsetvli[1]) ? h7_vlmul_pre[1:0] : h6_vlmul[1:0];
assign h8_vlmul[1:0] = (vsetvli[0]) ? h8_vlmul_pre[1:0] : h7_vlmul[1:0];

//vsew update
assign h0_vsew[2:0] = (h0_vld && h0_vsetvli) ? h0_vsew_pre[2:0] 
                                             : vsew_reg[2:0];
assign h1_vsew[2:0] = (h0_vld    ) ? h0_vsew[2:0]     
                                   : (vsetvli[7])
                                     ? h1_vsew_pre[2:0]
                                     : vsew_reg[2:0];
assign h2_vsew[2:0] = (vsetvli[6]) ? h2_vsew_pre[2:0] : h1_vsew[2:0];
assign h3_vsew[2:0] = (vsetvli[5]) ? h3_vsew_pre[2:0] : h2_vsew[2:0];
assign h4_vsew[2:0] = (vsetvli[4]) ? h4_vsew_pre[2:0] : h3_vsew[2:0];
assign h5_vsew[2:0] = (vsetvli[3]) ? h5_vsew_pre[2:0] : h4_vsew[2:0];
assign h6_vsew[2:0] = (vsetvli[2]) ? h6_vsew_pre[2:0] : h5_vsew[2:0];
assign h7_vsew[2:0] = (vsetvli[1]) ? h7_vsew_pre[2:0] : h6_vsew[2:0];
assign h8_vsew[2:0] = (vsetvli[0]) ? h8_vsew_pre[2:0] : h7_vsew[2:0];



assign h0_vl[7:0]   = (h0_vld && h0_vsetvli && ~h0_vl_pred) 
                    ? h0_vlmax_pre[7:0]
                    : vl_reg[7:0];

assign h1_vl[7:0]   = (h0_vld)
                    ? h0_vl[7:0]
                    : (vsetvli[7] && ~vl_pred[7])
                      ? h1_vlmax_pre[7:0]
                      : vl_reg[7:0];

assign h2_vl[7:0]   = (vsetvli[6] && ~vl_pred[6]) ? h2_vlmax_pre[7:0] : h1_vl[7:0]; 
assign h3_vl[7:0]   = (vsetvli[5] && ~vl_pred[5]) ? h3_vlmax_pre[7:0] : h2_vl[7:0]; 
assign h4_vl[7:0]   = (vsetvli[4] && ~vl_pred[4]) ? h4_vlmax_pre[7:0] : h3_vl[7:0]; 
assign h5_vl[7:0]   = (vsetvli[3] && ~vl_pred[3]) ? h5_vlmax_pre[7:0] : h4_vl[7:0]; 
assign h6_vl[7:0]   = (vsetvli[2] && ~vl_pred[2]) ? h6_vlmax_pre[7:0] : h5_vl[7:0]; 
assign h7_vl[7:0]   = (vsetvli[1] && ~vl_pred[1]) ? h7_vlmax_pre[7:0] : h6_vl[7:0]; 
assign h8_vl[7:0]   = (vsetvli[0] && ~vl_pred[0]) ? h8_vlmax_pre[7:0] : h7_vl[7:0]; 

//TODO
assign h0_split0    = h0_split0_type[0]
                   || h0_split0_type[1] && (h0_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h0_split0_type[2] && (h0_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h1_split0    = h1_split0_type[0]
                   || h1_split0_type[1] && (h1_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h1_split0_type[2] && (h1_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h2_split0    = h2_split0_type[0]
                   || h2_split0_type[1] && (h2_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h2_split0_type[2] && (h2_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h3_split0    = h3_split0_type[0]
                   || h3_split0_type[1] && (h3_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h3_split0_type[2] && (h3_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h4_split0    = h4_split0_type[0]
                   || h4_split0_type[1] && (h4_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h4_split0_type[2] && (h4_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h5_split0    = h5_split0_type[0]
                   || h5_split0_type[1] && (h5_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h5_split0_type[2] && (h5_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h6_split0    = h6_split0_type[0]
                   || h6_split0_type[1] && (h6_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h6_split0_type[2] && (h6_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h7_split0    = h7_split0_type[0]
                   || h7_split0_type[1] && (h7_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h7_split0_type[2] && (h7_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h8_split0    = h8_split0_type[0]
                   || h8_split0_type[1] && (h8_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                   || h8_split0_type[2] && (h8_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign h0_split1    = h0_split1_type[0]
                   || h0_split1_type[1] && (|h0_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h0_split1_type[2] && (h0_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h1_split1    = h1_split1_type[0]
                   || h1_split1_type[1] && (|h1_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h1_split1_type[2] && (h1_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h2_split1    = h2_split1_type[0]
                   || h2_split1_type[1] && (|h2_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h2_split1_type[2] && (h2_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h3_split1    = h3_split1_type[0]
                   || h3_split1_type[1] && (|h3_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h3_split1_type[2] && (h3_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h4_split1    = h4_split1_type[0]
                   || h4_split1_type[1] && (|h4_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h4_split1_type[2] && (h4_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h5_split1    = h5_split1_type[0]
                   || h5_split1_type[1] && (|h5_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h5_split1_type[2] && (h5_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h6_split1    = h6_split1_type[0]
                   || h6_split1_type[1] && (|h6_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h6_split1_type[2] && (h6_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h7_split1    = h7_split1_type[0]
                   || h7_split1_type[1] && (|h7_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h7_split1_type[2] && (h7_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign h8_split1    = h8_split1_type[0]
                   || h8_split1_type[1] && (|h8_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                   || h8_split1_type[2] && (h8_vlmul[1])    && (|cp0_ifu_vl[7:0]);

assign split0_pre[7]   = (h0_vld) ? h0_split0 : h1_split0;                   
assign split0_pre[6:0] = {h2_split0,
                          h3_split0,
                          h4_split0,
                          h5_split0,
                          h6_split0,
                          h7_split0,
                          h8_split0};
                        
assign split1_pre[7]   = (h0_vld) ? h0_split1 : h1_split1;                   
assign split1_pre[6:0] = {h2_split1,
                          h3_split1,
                          h4_split1,
                          h5_split1,
                          h6_split1,
                          h7_split1,
                          h8_split1};


//remove head according to vpc
// &CombBeg; @906
always @( h7_vlmul[1:0]
       or h4_vlmul[1:0]
       or h8_vlmul[1:0]
       or h1_vlmul[1:0]
       or vpc_onehot[7:0]
       or h2_vlmul[1:0]
       or h5_vlmul[1:0]
       or h3_vlmul[1:0]
       or h6_vlmul[1:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h1_vlmul_after_head[1:0] = h1_vlmul[1:0];
  8'b01000000: h1_vlmul_after_head[1:0] = h2_vlmul[1:0];
  8'b00100000: h1_vlmul_after_head[1:0] = h3_vlmul[1:0];
  8'b00010000: h1_vlmul_after_head[1:0] = h4_vlmul[1:0];
  8'b00001000: h1_vlmul_after_head[1:0] = h5_vlmul[1:0];
  8'b00000100: h1_vlmul_after_head[1:0] = h6_vlmul[1:0];
  8'b00000010: h1_vlmul_after_head[1:0] = h7_vlmul[1:0];
  8'b00000001: h1_vlmul_after_head[1:0] = h8_vlmul[1:0];
  default    : h1_vlmul_after_head[1:0] = {2{1'bx}};
endcase
// &CombEnd; @918
end

// &CombBeg; @920
always @( h7_vlmul[1:0]
       or h4_vlmul[1:0]
       or h8_vlmul[1:0]
       or vpc_onehot[7:0]
       or h2_vlmul[1:0]
       or h5_vlmul[1:0]
       or h3_vlmul[1:0]
       or h6_vlmul[1:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h2_vlmul_after_head[1:0] = h2_vlmul[1:0];
  8'b01000000: h2_vlmul_after_head[1:0] = h3_vlmul[1:0];
  8'b00100000: h2_vlmul_after_head[1:0] = h4_vlmul[1:0];
  8'b00010000: h2_vlmul_after_head[1:0] = h5_vlmul[1:0];
  8'b00001000: h2_vlmul_after_head[1:0] = h6_vlmul[1:0];
  8'b00000100: h2_vlmul_after_head[1:0] = h7_vlmul[1:0];
  8'b00000010: h2_vlmul_after_head[1:0] = h8_vlmul[1:0];
  default    : h2_vlmul_after_head[1:0] = {2{1'bx}};
endcase
// &CombEnd; @931
end

// &CombBeg; @933
always @( h7_vlmul[1:0]
       or h4_vlmul[1:0]
       or h8_vlmul[1:0]
       or vpc_onehot[7:0]
       or h5_vlmul[1:0]
       or h3_vlmul[1:0]
       or h6_vlmul[1:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h3_vlmul_after_head[1:0] = h3_vlmul[1:0];
  8'b01000000: h3_vlmul_after_head[1:0] = h4_vlmul[1:0];
  8'b00100000: h3_vlmul_after_head[1:0] = h5_vlmul[1:0];
  8'b00010000: h3_vlmul_after_head[1:0] = h6_vlmul[1:0];
  8'b00001000: h3_vlmul_after_head[1:0] = h7_vlmul[1:0];
  8'b00000100: h3_vlmul_after_head[1:0] = h8_vlmul[1:0];
  default    : h3_vlmul_after_head[1:0] = {2{1'bx}};
endcase
// &CombEnd; @943
end

// &CombBeg; @945
always @( h7_vlmul[1:0]
       or h4_vlmul[1:0]
       or h8_vlmul[1:0]
       or vpc_onehot[7:0]
       or h5_vlmul[1:0]
       or h6_vlmul[1:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h4_vlmul_after_head[1:0] = h4_vlmul[1:0];
  8'b01000000: h4_vlmul_after_head[1:0] = h5_vlmul[1:0];
  8'b00100000: h4_vlmul_after_head[1:0] = h6_vlmul[1:0];
  8'b00010000: h4_vlmul_after_head[1:0] = h7_vlmul[1:0];
  8'b00001000: h4_vlmul_after_head[1:0] = h8_vlmul[1:0];
  default    : h4_vlmul_after_head[1:0] = {2{1'bx}};
endcase
// &CombEnd; @954
end

// &CombBeg; @956
always @( h7_vlmul[1:0]
       or h8_vlmul[1:0]
       or vpc_onehot[7:0]
       or h5_vlmul[1:0]
       or h6_vlmul[1:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h5_vlmul_after_head[1:0] = h5_vlmul[1:0];
  8'b01000000: h5_vlmul_after_head[1:0] = h6_vlmul[1:0];
  8'b00100000: h5_vlmul_after_head[1:0] = h7_vlmul[1:0];
  8'b00010000: h5_vlmul_after_head[1:0] = h8_vlmul[1:0];
  default    : h5_vlmul_after_head[1:0] = {2{1'bx}};
endcase
// &CombEnd; @964
end

// &CombBeg; @966
always @( h7_vlmul[1:0]
       or h8_vlmul[1:0]
       or vpc_onehot[7:0]
       or h6_vlmul[1:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h6_vlmul_after_head[1:0] = h6_vlmul[1:0];
  8'b01000000: h6_vlmul_after_head[1:0] = h7_vlmul[1:0];
  8'b00100000: h6_vlmul_after_head[1:0] = h8_vlmul[1:0];
  default    : h6_vlmul_after_head[1:0] = {2{1'bx}};
endcase
// &CombEnd; @973
end

assign h7_vlmul_after_head[1:0] = (vpc_onehot[7])
                                  ? h7_vlmul[1:0]
                                  : h8_vlmul[1:0];

assign h8_vlmul_after_head[1:0] = h8_vlmul[1:0]; 


// &CombBeg; @982
always @( h6_vsew[2:0]
       or vpc_onehot[7:0]
       or h5_vsew[2:0]
       or h3_vsew[2:0]
       or h2_vsew[2:0]
       or h8_vsew[2:0]
       or h4_vsew[2:0]
       or h1_vsew[2:0]
       or h7_vsew[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h1_vsew_after_head[2:0] = h1_vsew[2:0];
  8'b01000000: h1_vsew_after_head[2:0] = h2_vsew[2:0];
  8'b00100000: h1_vsew_after_head[2:0] = h3_vsew[2:0];
  8'b00010000: h1_vsew_after_head[2:0] = h4_vsew[2:0];
  8'b00001000: h1_vsew_after_head[2:0] = h5_vsew[2:0];
  8'b00000100: h1_vsew_after_head[2:0] = h6_vsew[2:0];
  8'b00000010: h1_vsew_after_head[2:0] = h7_vsew[2:0];
  8'b00000001: h1_vsew_after_head[2:0] = h8_vsew[2:0];
  default    : h1_vsew_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @994
end

// &CombBeg; @996
always @( h6_vsew[2:0]
       or vpc_onehot[7:0]
       or h5_vsew[2:0]
       or h3_vsew[2:0]
       or h2_vsew[2:0]
       or h8_vsew[2:0]
       or h4_vsew[2:0]
       or h7_vsew[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h2_vsew_after_head[2:0] = h2_vsew[2:0];
  8'b01000000: h2_vsew_after_head[2:0] = h3_vsew[2:0];
  8'b00100000: h2_vsew_after_head[2:0] = h4_vsew[2:0];
  8'b00010000: h2_vsew_after_head[2:0] = h5_vsew[2:0];
  8'b00001000: h2_vsew_after_head[2:0] = h6_vsew[2:0];
  8'b00000100: h2_vsew_after_head[2:0] = h7_vsew[2:0];
  8'b00000010: h2_vsew_after_head[2:0] = h8_vsew[2:0];
  default    : h2_vsew_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1007
end

// &CombBeg; @1009
always @( h6_vsew[2:0]
       or vpc_onehot[7:0]
       or h5_vsew[2:0]
       or h3_vsew[2:0]
       or h8_vsew[2:0]
       or h4_vsew[2:0]
       or h7_vsew[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h3_vsew_after_head[2:0] = h3_vsew[2:0];
  8'b01000000: h3_vsew_after_head[2:0] = h4_vsew[2:0];
  8'b00100000: h3_vsew_after_head[2:0] = h5_vsew[2:0];
  8'b00010000: h3_vsew_after_head[2:0] = h6_vsew[2:0];
  8'b00001000: h3_vsew_after_head[2:0] = h7_vsew[2:0];
  8'b00000100: h3_vsew_after_head[2:0] = h8_vsew[2:0];
  default    : h3_vsew_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1019
end

// &CombBeg; @1021
always @( h6_vsew[2:0]
       or vpc_onehot[7:0]
       or h5_vsew[2:0]
       or h8_vsew[2:0]
       or h4_vsew[2:0]
       or h7_vsew[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h4_vsew_after_head[2:0] = h4_vsew[2:0];
  8'b01000000: h4_vsew_after_head[2:0] = h5_vsew[2:0];
  8'b00100000: h4_vsew_after_head[2:0] = h6_vsew[2:0];
  8'b00010000: h4_vsew_after_head[2:0] = h7_vsew[2:0];
  8'b00001000: h4_vsew_after_head[2:0] = h8_vsew[2:0];
  default    : h4_vsew_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1030
end

// &CombBeg; @1032
always @( h6_vsew[2:0]
       or vpc_onehot[7:0]
       or h5_vsew[2:0]
       or h8_vsew[2:0]
       or h7_vsew[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h5_vsew_after_head[2:0] = h5_vsew[2:0];
  8'b01000000: h5_vsew_after_head[2:0] = h6_vsew[2:0];
  8'b00100000: h5_vsew_after_head[2:0] = h7_vsew[2:0];
  8'b00010000: h5_vsew_after_head[2:0] = h8_vsew[2:0];
  default    : h5_vsew_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1040
end

// &CombBeg; @1042
always @( h6_vsew[2:0]
       or vpc_onehot[7:0]
       or h8_vsew[2:0]
       or h7_vsew[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h6_vsew_after_head[2:0] = h6_vsew[2:0];
  8'b01000000: h6_vsew_after_head[2:0] = h7_vsew[2:0];
  8'b00100000: h6_vsew_after_head[2:0] = h8_vsew[2:0];
  default    : h6_vsew_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1049
end

assign h7_vsew_after_head[2:0] = (vpc_onehot[7])
                                  ? h7_vsew[2:0]
                                  : h8_vsew[2:0];

assign h8_vsew_after_head[2:0] = h8_vsew[2:0]; 

//vl 
// &CombBeg; @1058
always @( h3_vl[7:0]
       or h5_vl[7:0]
       or h6_vl[7:0]
       or h2_vl[7:0]
       or h1_vl[7:0]
       or h8_vl[7:0]
       or vpc_onehot[7:0]
       or h7_vl[7:0]
       or h4_vl[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h1_vl_after_head[7:0] = h1_vl[7:0];
  8'b01000000: h1_vl_after_head[7:0] = h2_vl[7:0];
  8'b00100000: h1_vl_after_head[7:0] = h3_vl[7:0];
  8'b00010000: h1_vl_after_head[7:0] = h4_vl[7:0];
  8'b00001000: h1_vl_after_head[7:0] = h5_vl[7:0];
  8'b00000100: h1_vl_after_head[7:0] = h6_vl[7:0];
  8'b00000010: h1_vl_after_head[7:0] = h7_vl[7:0];
  8'b00000001: h1_vl_after_head[7:0] = h8_vl[7:0];
  default    : h1_vl_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1070
end

// &CombBeg; @1072
always @( h3_vl[7:0]
       or h5_vl[7:0]
       or h6_vl[7:0]
       or h2_vl[7:0]
       or h8_vl[7:0]
       or vpc_onehot[7:0]
       or h7_vl[7:0]
       or h4_vl[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h2_vl_after_head[7:0] = h2_vl[7:0];
  8'b01000000: h2_vl_after_head[7:0] = h3_vl[7:0];
  8'b00100000: h2_vl_after_head[7:0] = h4_vl[7:0];
  8'b00010000: h2_vl_after_head[7:0] = h5_vl[7:0];
  8'b00001000: h2_vl_after_head[7:0] = h6_vl[7:0];
  8'b00000100: h2_vl_after_head[7:0] = h7_vl[7:0];
  8'b00000010: h2_vl_after_head[7:0] = h8_vl[7:0];
  default    : h2_vl_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1083
end

// &CombBeg; @1085
always @( h3_vl[7:0]
       or h5_vl[7:0]
       or h6_vl[7:0]
       or h8_vl[7:0]
       or vpc_onehot[7:0]
       or h7_vl[7:0]
       or h4_vl[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h3_vl_after_head[7:0] = h3_vl[7:0];
  8'b01000000: h3_vl_after_head[7:0] = h4_vl[7:0];
  8'b00100000: h3_vl_after_head[7:0] = h5_vl[7:0];
  8'b00010000: h3_vl_after_head[7:0] = h6_vl[7:0];
  8'b00001000: h3_vl_after_head[7:0] = h7_vl[7:0];
  8'b00000100: h3_vl_after_head[7:0] = h8_vl[7:0];
  default    : h3_vl_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1095
end

// &CombBeg; @1097
always @( h5_vl[7:0]
       or h6_vl[7:0]
       or h8_vl[7:0]
       or vpc_onehot[7:0]
       or h7_vl[7:0]
       or h4_vl[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h4_vl_after_head[7:0] = h4_vl[7:0];
  8'b01000000: h4_vl_after_head[7:0] = h5_vl[7:0];
  8'b00100000: h4_vl_after_head[7:0] = h6_vl[7:0];
  8'b00010000: h4_vl_after_head[7:0] = h7_vl[7:0];
  8'b00001000: h4_vl_after_head[7:0] = h8_vl[7:0];
  default    : h4_vl_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1106
end

// &CombBeg; @1108
always @( h5_vl[7:0]
       or h6_vl[7:0]
       or h8_vl[7:0]
       or vpc_onehot[7:0]
       or h7_vl[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h5_vl_after_head[7:0] = h5_vl[7:0];
  8'b01000000: h5_vl_after_head[7:0] = h6_vl[7:0];
  8'b00100000: h5_vl_after_head[7:0] = h7_vl[7:0];
  8'b00010000: h5_vl_after_head[7:0] = h8_vl[7:0];
  default    : h5_vl_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1116
end

// &CombBeg; @1118
always @( h6_vl[7:0]
       or h8_vl[7:0]
       or vpc_onehot[7:0]
       or h7_vl[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h6_vl_after_head[7:0] = h6_vl[7:0];
  8'b01000000: h6_vl_after_head[7:0] = h7_vl[7:0];
  8'b00100000: h6_vl_after_head[7:0] = h8_vl[7:0];
  default    : h6_vl_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1125
end

assign h7_vl_after_head[7:0] = (vpc_onehot[7])
                                  ? h7_vl[7:0]
                                  : h8_vl[7:0];

assign h8_vl_after_head[7:0] = h8_vl[7:0]; 



// &CombBeg; @1135
always @( h5_split0_type[2:0]
       or h2_split0_type[2:0]
       or h3_split0_type[2:0]
       or vpc_onehot[7:0]
       or h1_split0_type[2:0]
       or h6_split0_type[2:0]
       or h4_split0_type[2:0]
       or h8_split0_type[2:0]
       or h7_split0_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h1_split0_type_after_head[2:0] = h1_split0_type[2:0];
  8'b01000000: h1_split0_type_after_head[2:0] = h2_split0_type[2:0];
  8'b00100000: h1_split0_type_after_head[2:0] = h3_split0_type[2:0];
  8'b00010000: h1_split0_type_after_head[2:0] = h4_split0_type[2:0];
  8'b00001000: h1_split0_type_after_head[2:0] = h5_split0_type[2:0];
  8'b00000100: h1_split0_type_after_head[2:0] = h6_split0_type[2:0];
  8'b00000010: h1_split0_type_after_head[2:0] = h7_split0_type[2:0];
  8'b00000001: h1_split0_type_after_head[2:0] = h8_split0_type[2:0];
  default    : h1_split0_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1147
end

// &CombBeg; @1149
always @( h5_split0_type[2:0]
       or h2_split0_type[2:0]
       or h3_split0_type[2:0]
       or vpc_onehot[7:0]
       or h6_split0_type[2:0]
       or h4_split0_type[2:0]
       or h7_split0_type[2:0]
       or h8_split0_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h2_split0_type_after_head[2:0] = h2_split0_type[2:0];
  8'b01000000: h2_split0_type_after_head[2:0] = h3_split0_type[2:0];
  8'b00100000: h2_split0_type_after_head[2:0] = h4_split0_type[2:0];
  8'b00010000: h2_split0_type_after_head[2:0] = h5_split0_type[2:0];
  8'b00001000: h2_split0_type_after_head[2:0] = h6_split0_type[2:0];
  8'b00000100: h2_split0_type_after_head[2:0] = h7_split0_type[2:0];
  8'b00000010: h2_split0_type_after_head[2:0] = h8_split0_type[2:0];
  default    : h2_split0_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1160
end

// &CombBeg; @1162
always @( h5_split0_type[2:0]
       or h3_split0_type[2:0]
       or vpc_onehot[7:0]
       or h6_split0_type[2:0]
       or h4_split0_type[2:0]
       or h8_split0_type[2:0]
       or h7_split0_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h3_split0_type_after_head[2:0] = h3_split0_type[2:0];
  8'b01000000: h3_split0_type_after_head[2:0] = h4_split0_type[2:0];
  8'b00100000: h3_split0_type_after_head[2:0] = h5_split0_type[2:0];
  8'b00010000: h3_split0_type_after_head[2:0] = h6_split0_type[2:0];
  8'b00001000: h3_split0_type_after_head[2:0] = h7_split0_type[2:0];
  8'b00000100: h3_split0_type_after_head[2:0] = h8_split0_type[2:0];
  default    : h3_split0_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1172
end

// &CombBeg; @1174
always @( h5_split0_type[2:0]
       or vpc_onehot[7:0]
       or h6_split0_type[2:0]
       or h4_split0_type[2:0]
       or h8_split0_type[2:0]
       or h7_split0_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h4_split0_type_after_head[2:0] = h4_split0_type[2:0];
  8'b01000000: h4_split0_type_after_head[2:0] = h5_split0_type[2:0];
  8'b00100000: h4_split0_type_after_head[2:0] = h6_split0_type[2:0];
  8'b00010000: h4_split0_type_after_head[2:0] = h7_split0_type[2:0];
  8'b00001000: h4_split0_type_after_head[2:0] = h8_split0_type[2:0];
  default    : h4_split0_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1183
end

// &CombBeg; @1185
always @( h5_split0_type[2:0]
       or vpc_onehot[7:0]
       or h6_split0_type[2:0]
       or h8_split0_type[2:0]
       or h7_split0_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h5_split0_type_after_head[2:0] = h5_split0_type[2:0];
  8'b01000000: h5_split0_type_after_head[2:0] = h6_split0_type[2:0];
  8'b00100000: h5_split0_type_after_head[2:0] = h7_split0_type[2:0];
  8'b00010000: h5_split0_type_after_head[2:0] = h8_split0_type[2:0];
  default    : h5_split0_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1193
end

// &CombBeg; @1195
always @( vpc_onehot[7:0]
       or h6_split0_type[2:0]
       or h8_split0_type[2:0]
       or h7_split0_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h6_split0_type_after_head[2:0] = h6_split0_type[2:0];
  8'b01000000: h6_split0_type_after_head[2:0] = h7_split0_type[2:0];
  8'b00100000: h6_split0_type_after_head[2:0] = h8_split0_type[2:0];
  default    : h6_split0_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1202
end

assign h7_split0_type_after_head[2:0] = (vpc_onehot[7])
                                      ? h7_split0_type[2:0]
                                      : h8_split0_type[2:0];

assign h8_split0_type_after_head[2:0] = h8_split0_type[2:0]; 

// &CombBeg; @1210
always @( h6_split1_type[2:0]
       or h1_split1_type[2:0]
       or h3_split1_type[2:0]
       or h4_split1_type[2:0]
       or h2_split1_type[2:0]
       or h5_split1_type[2:0]
       or vpc_onehot[7:0]
       or h7_split1_type[2:0]
       or h8_split1_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h1_split1_type_after_head[2:0] = h1_split1_type[2:0];
  8'b01000000: h1_split1_type_after_head[2:0] = h2_split1_type[2:0];
  8'b00100000: h1_split1_type_after_head[2:0] = h3_split1_type[2:0];
  8'b00010000: h1_split1_type_after_head[2:0] = h4_split1_type[2:0];
  8'b00001000: h1_split1_type_after_head[2:0] = h5_split1_type[2:0];
  8'b00000100: h1_split1_type_after_head[2:0] = h6_split1_type[2:0];
  8'b00000010: h1_split1_type_after_head[2:0] = h7_split1_type[2:0];
  8'b00000001: h1_split1_type_after_head[2:0] = h8_split1_type[2:0];
  default    : h1_split1_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1222
end

// &CombBeg; @1224
always @( h6_split1_type[2:0]
       or h3_split1_type[2:0]
       or h4_split1_type[2:0]
       or h2_split1_type[2:0]
       or h5_split1_type[2:0]
       or vpc_onehot[7:0]
       or h7_split1_type[2:0]
       or h8_split1_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h2_split1_type_after_head[2:0] = h2_split1_type[2:0];
  8'b01000000: h2_split1_type_after_head[2:0] = h3_split1_type[2:0];
  8'b00100000: h2_split1_type_after_head[2:0] = h4_split1_type[2:0];
  8'b00010000: h2_split1_type_after_head[2:0] = h5_split1_type[2:0];
  8'b00001000: h2_split1_type_after_head[2:0] = h6_split1_type[2:0];
  8'b00000100: h2_split1_type_after_head[2:0] = h7_split1_type[2:0];
  8'b00000010: h2_split1_type_after_head[2:0] = h8_split1_type[2:0];
  default    : h2_split1_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1235
end

// &CombBeg; @1237
always @( h6_split1_type[2:0]
       or h3_split1_type[2:0]
       or h4_split1_type[2:0]
       or h5_split1_type[2:0]
       or vpc_onehot[7:0]
       or h7_split1_type[2:0]
       or h8_split1_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h3_split1_type_after_head[2:0] = h3_split1_type[2:0];
  8'b01000000: h3_split1_type_after_head[2:0] = h4_split1_type[2:0];
  8'b00100000: h3_split1_type_after_head[2:0] = h5_split1_type[2:0];
  8'b00010000: h3_split1_type_after_head[2:0] = h6_split1_type[2:0];
  8'b00001000: h3_split1_type_after_head[2:0] = h7_split1_type[2:0];
  8'b00000100: h3_split1_type_after_head[2:0] = h8_split1_type[2:0];
  default    : h3_split1_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1247
end

// &CombBeg; @1249
always @( h6_split1_type[2:0]
       or h4_split1_type[2:0]
       or h5_split1_type[2:0]
       or vpc_onehot[7:0]
       or h7_split1_type[2:0]
       or h8_split1_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h4_split1_type_after_head[2:0] = h4_split1_type[2:0];
  8'b01000000: h4_split1_type_after_head[2:0] = h5_split1_type[2:0];
  8'b00100000: h4_split1_type_after_head[2:0] = h6_split1_type[2:0];
  8'b00010000: h4_split1_type_after_head[2:0] = h7_split1_type[2:0];
  8'b00001000: h4_split1_type_after_head[2:0] = h8_split1_type[2:0];
  default    : h4_split1_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1258
end

// &CombBeg; @1260
always @( h6_split1_type[2:0]
       or h5_split1_type[2:0]
       or vpc_onehot[7:0]
       or h7_split1_type[2:0]
       or h8_split1_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h5_split1_type_after_head[2:0] = h5_split1_type[2:0];
  8'b01000000: h5_split1_type_after_head[2:0] = h6_split1_type[2:0];
  8'b00100000: h5_split1_type_after_head[2:0] = h7_split1_type[2:0];
  8'b00010000: h5_split1_type_after_head[2:0] = h8_split1_type[2:0];
  default    : h5_split1_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1268
end

// &CombBeg; @1270
always @( h6_split1_type[2:0]
       or vpc_onehot[7:0]
       or h7_split1_type[2:0]
       or h8_split1_type[2:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h6_split1_type_after_head[2:0] = h6_split1_type[2:0];
  8'b01000000: h6_split1_type_after_head[2:0] = h7_split1_type[2:0];
  8'b00100000: h6_split1_type_after_head[2:0] = h8_split1_type[2:0];
  default    : h6_split1_type_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @1277
end

assign h7_split1_type_after_head[2:0] = (vpc_onehot[7])
                                      ? h7_split1_type[2:0]
                                      : h8_split1_type[2:0];

assign h8_split1_type_after_head[2:0] = h8_split1_type[2:0]; 


//==========================================================
//            Head Remove according to VPC
//==========================================================
//onehot after head select logic
//Because default = 'bx should not be used
//Achive onehot logic use & | logic
// &CombBeg; @1292
always @( h8_data[15:0]
       or h3_data[15:0]
       or h6_data[15:0]
       or h5_data[15:0]
       or vpc_onehot[7:0]
       or h1_data[15:0]
       or h2_data[15:0]
       or h7_data[15:0]
       or h4_data[15:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h1_data_after_head[15:0] = h1_data[15:0];
  8'b01000000: h1_data_after_head[15:0] = h2_data[15:0];
  8'b00100000: h1_data_after_head[15:0] = h3_data[15:0];
  8'b00010000: h1_data_after_head[15:0] = h4_data[15:0];
  8'b00001000: h1_data_after_head[15:0] = h5_data[15:0];
  8'b00000100: h1_data_after_head[15:0] = h6_data[15:0];
  8'b00000010: h1_data_after_head[15:0] = h7_data[15:0];
  8'b00000001: h1_data_after_head[15:0] = h8_data[15:0];
  default    : h1_data_after_head[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1304
end


//Hn will not be valid when Hn is the last Half word && Hn is strat of 32 inst
assign h1_vld_after_head        = !(vpc_onehot[0] && inst_32[0] && bry_data[0]);

// &CombBeg; @1310
always @( h8_data[15:0]
       or h3_data[15:0]
       or h6_data[15:0]
       or h5_data[15:0]
       or vpc_onehot[7:0]
       or h2_data[15:0]
       or h7_data[15:0]
       or h4_data[15:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h2_data_after_head[15:0] = h2_data[15:0];
  8'b01000000: h2_data_after_head[15:0] = h3_data[15:0];
  8'b00100000: h2_data_after_head[15:0] = h4_data[15:0];
  8'b00010000: h2_data_after_head[15:0] = h5_data[15:0];
  8'b00001000: h2_data_after_head[15:0] = h6_data[15:0];
  8'b00000100: h2_data_after_head[15:0] = h7_data[15:0];
  8'b00000010: h2_data_after_head[15:0] = h8_data[15:0];
  default    : h2_data_after_head[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1321
end

assign h2_vld_after_head        = !(vpc_onehot[0] || vpc_onehot[1] && inst_32[0] && bry_data[0]);


// &CombBeg; @1326
always @( h8_data[15:0]
       or h3_data[15:0]
       or h6_data[15:0]
       or h5_data[15:0]
       or vpc_onehot[7:0]
       or h7_data[15:0]
       or h4_data[15:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h3_data_after_head[15:0] = h3_data[15:0];
  8'b01000000: h3_data_after_head[15:0] = h4_data[15:0];
  8'b00100000: h3_data_after_head[15:0] = h5_data[15:0];
  8'b00010000: h3_data_after_head[15:0] = h6_data[15:0];
  8'b00001000: h3_data_after_head[15:0] = h7_data[15:0];
  8'b00000100: h3_data_after_head[15:0] = h8_data[15:0];
  default    : h3_data_after_head[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1336
end
assign h3_vld_after_head        = !(|vpc_onehot[1:0] || vpc_onehot[2] && inst_32[0] && bry_data[0]);

// &CombBeg; @1339
always @( h8_data[15:0]
       or h6_data[15:0]
       or h5_data[15:0]
       or vpc_onehot[7:0]
       or h7_data[15:0]
       or h4_data[15:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h4_data_after_head[15:0] = h4_data[15:0];
  8'b01000000: h4_data_after_head[15:0] = h5_data[15:0];
  8'b00100000: h4_data_after_head[15:0] = h6_data[15:0];
  8'b00010000: h4_data_after_head[15:0] = h7_data[15:0];
  8'b00001000: h4_data_after_head[15:0] = h8_data[15:0];
  default    : h4_data_after_head[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1348
end
assign h4_vld_after_head        = !(|vpc_onehot[2:0] || vpc_onehot[3] && inst_32[0] && bry_data[0]);

// &CombBeg; @1351
always @( h8_data[15:0]
       or h6_data[15:0]
       or h5_data[15:0]
       or vpc_onehot[7:0]
       or h7_data[15:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h5_data_after_head[15:0] = h5_data[15:0];
  8'b01000000: h5_data_after_head[15:0] = h6_data[15:0];
  8'b00100000: h5_data_after_head[15:0] = h7_data[15:0];
  8'b00010000: h5_data_after_head[15:0] = h8_data[15:0];
  default    : h5_data_after_head[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1359
end
assign h5_vld_after_head        = !(|vpc_onehot[3:0] || vpc_onehot[4] && inst_32[0] && bry_data[0]);

// &CombBeg; @1362
always @( h8_data[15:0]
       or h6_data[15:0]
       or vpc_onehot[7:0]
       or h7_data[15:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h6_data_after_head[15:0] = h6_data[15:0];
  8'b01000000: h6_data_after_head[15:0] = h7_data[15:0];
  8'b00100000: h6_data_after_head[15:0] = h8_data[15:0];
  default    : h6_data_after_head[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1369
end
assign h6_vld_after_head        = (|vpc_onehot[7:5]) && !(vpc_onehot[5] && inst_32[0] && bry_data[0]);

assign h7_data_after_head[15:0] = (vpc_onehot[7])
                                  ? h7_data[15:0]
                                  : h8_data[15:0];
assign h7_vld_after_head        = (|vpc_onehot[7:6]) && !(vpc_onehot[6] && inst_32[0] && bry_data[0]);

assign h8_data_after_head[15:0] = h8_data[15:0]; 
assign h8_vld_after_head        = vpc_onehot[7] && !(inst_32[0] && bry_data[0]);

assign hn_vld_after_head[7:0] = {h1_vld_after_head,
                                 h2_vld_after_head,
                                 h3_vld_after_head,
                                 h4_vld_after_head,
                                 h5_vld_after_head,
                                 h6_vld_after_head,
                                 h7_vld_after_head,
                                 h8_vld_after_head};

//pre decode info after head remove
// &CombBeg; @1390
always @( vpc_onehot[7:0]
       or ab_br[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: ab_br_after_head[7:0] =  ab_br[7:0];
  8'b01000000: ab_br_after_head[7:0] = {ab_br[6:0],1'b0};
  8'b00100000: ab_br_after_head[7:0] = {ab_br[5:0],2'b0};
  8'b00010000: ab_br_after_head[7:0] = {ab_br[4:0],3'b0};
  8'b00001000: ab_br_after_head[7:0] = {ab_br[3:0],4'b0};
  8'b00000100: ab_br_after_head[7:0] = {ab_br[2:0],5'b0};
  8'b00000010: ab_br_after_head[7:0] = {ab_br[1:0],6'b0};
  8'b00000001: ab_br_after_head[7:0] = {ab_br[0],7'b0};
  default    : ab_br_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1402
end

// &CombBeg; @1404
always @( vpc_onehot[7:0]
       or con_br[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: con_br_after_head[7:0] =  con_br[7:0];
  8'b01000000: con_br_after_head[7:0] = {con_br[6:0],1'b0};
  8'b00100000: con_br_after_head[7:0] = {con_br[5:0],2'b0};
  8'b00010000: con_br_after_head[7:0] = {con_br[4:0],3'b0};
  8'b00001000: con_br_after_head[7:0] = {con_br[3:0],4'b0};
  8'b00000100: con_br_after_head[7:0] = {con_br[2:0],5'b0};
  8'b00000010: con_br_after_head[7:0] = {con_br[1:0],6'b0};
  8'b00000001: con_br_after_head[7:0] = {con_br[0],7'b0};
  default    : con_br_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1416
end

// &CombBeg; @1418
always @( pcall[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: pcall_after_head[7:0] =  pcall[7:0];
  8'b01000000: pcall_after_head[7:0] = {pcall[6:0],1'b0};
  8'b00100000: pcall_after_head[7:0] = {pcall[5:0],2'b0};
  8'b00010000: pcall_after_head[7:0] = {pcall[4:0],3'b0};
  8'b00001000: pcall_after_head[7:0] = {pcall[3:0],4'b0};
  8'b00000100: pcall_after_head[7:0] = {pcall[2:0],5'b0};
  8'b00000010: pcall_after_head[7:0] = {pcall[1:0],6'b0};
  8'b00000001: pcall_after_head[7:0] = {pcall[0],7'b0};
  default    : pcall_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1430
end
                                  
// &CombBeg; @1432
always @( preturn[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: preturn_after_head[7:0] =  preturn[7:0];
  8'b01000000: preturn_after_head[7:0] = {preturn[6:0],1'b0};
  8'b00100000: preturn_after_head[7:0] = {preturn[5:0],2'b0};
  8'b00010000: preturn_after_head[7:0] = {preturn[4:0],3'b0};
  8'b00001000: preturn_after_head[7:0] = {preturn[3:0],4'b0};
  8'b00000100: preturn_after_head[7:0] = {preturn[2:0],5'b0};
  8'b00000010: preturn_after_head[7:0] = {preturn[1:0],6'b0};
  8'b00000001: preturn_after_head[7:0] = {preturn[0],7'b0};
  default    : preturn_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1444
end
                                  
// &CombBeg; @1446
always @( pc_oper[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: pc_oper_after_head[7:0] =  pc_oper[7:0];
  8'b01000000: pc_oper_after_head[7:0] = {pc_oper[6:0],1'b0};
  8'b00100000: pc_oper_after_head[7:0] = {pc_oper[5:0],2'b0};
  8'b00010000: pc_oper_after_head[7:0] = {pc_oper[4:0],3'b0};
  8'b00001000: pc_oper_after_head[7:0] = {pc_oper[3:0],4'b0};
  8'b00000100: pc_oper_after_head[7:0] = {pc_oper[2:0],5'b0};
  8'b00000010: pc_oper_after_head[7:0] = {pc_oper[1:0],6'b0};
  8'b00000001: pc_oper_after_head[7:0] = {pc_oper[0],7'b0};
  default    : pc_oper_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1458
end
                                  
// &CombBeg; @1460
always @( chgflw[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: chgflw_after_head[7:0] =  chgflw[7:0];
  8'b01000000: chgflw_after_head[7:0] = {chgflw[6:0],1'b0};
  8'b00100000: chgflw_after_head[7:0] = {chgflw[5:0],2'b0};
  8'b00010000: chgflw_after_head[7:0] = {chgflw[4:0],3'b0};
  8'b00001000: chgflw_after_head[7:0] = {chgflw[3:0],4'b0};
  8'b00000100: chgflw_after_head[7:0] = {chgflw[2:0],5'b0};
  8'b00000010: chgflw_after_head[7:0] = {chgflw[1:0],6'b0};
  8'b00000001: chgflw_after_head[7:0] = {chgflw[0],7'b0};
  default    : chgflw_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1472
end
                                  
// &CombBeg; @1474
always @( inst_ldst[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: inst_ldst_after_head[7:0] =  inst_ldst[7:0];
  8'b01000000: inst_ldst_after_head[7:0] = {inst_ldst[6:0],1'b0};
  8'b00100000: inst_ldst_after_head[7:0] = {inst_ldst[5:0],2'b0};
  8'b00010000: inst_ldst_after_head[7:0] = {inst_ldst[4:0],3'b0};
  8'b00001000: inst_ldst_after_head[7:0] = {inst_ldst[3:0],4'b0};
  8'b00000100: inst_ldst_after_head[7:0] = {inst_ldst[2:0],5'b0};
  8'b00000010: inst_ldst_after_head[7:0] = {inst_ldst[1:0],6'b0};
  8'b00000001: inst_ldst_after_head[7:0] = {inst_ldst[0],7'b0};
  default    : inst_ldst_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1486
end
                                  
// &CombBeg; @1488
always @( dst_vld[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: dst_vld_after_head[7:0] =  dst_vld[7:0];
  8'b01000000: dst_vld_after_head[7:0] = {dst_vld[6:0],1'b0};
  8'b00100000: dst_vld_after_head[7:0] = {dst_vld[5:0],2'b0};
  8'b00010000: dst_vld_after_head[7:0] = {dst_vld[4:0],3'b0};
  8'b00001000: dst_vld_after_head[7:0] = {dst_vld[3:0],4'b0};
  8'b00000100: dst_vld_after_head[7:0] = {dst_vld[2:0],5'b0};
  8'b00000010: dst_vld_after_head[7:0] = {dst_vld[1:0],6'b0};
  8'b00000001: dst_vld_after_head[7:0] = {dst_vld[0],7'b0};
  default    : dst_vld_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1500
end

// &CombBeg; @1502
always @( inst_auipc[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: auipc_after_head[7:0] =  inst_auipc[7:0];
  8'b01000000: auipc_after_head[7:0] = {inst_auipc[6:0],1'b0};
  8'b00100000: auipc_after_head[7:0] = {inst_auipc[5:0],2'b0};
  8'b00010000: auipc_after_head[7:0] = {inst_auipc[4:0],3'b0};
  8'b00001000: auipc_after_head[7:0] = {inst_auipc[3:0],4'b0};
  8'b00000100: auipc_after_head[7:0] = {inst_auipc[2:0],5'b0};
  8'b00000010: auipc_after_head[7:0] = {inst_auipc[1:0],6'b0};
  8'b00000001: auipc_after_head[7:0] = {inst_auipc[0],7'b0};
  default    : auipc_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1514
end

// &CombBeg; @1516
always @( ind_br[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: ind_br_after_head[7:0] =  ind_br[7:0];
  8'b01000000: ind_br_after_head[7:0] = {ind_br[6:0],1'b0};
  8'b00100000: ind_br_after_head[7:0] = {ind_br[5:0],2'b0};
  8'b00010000: ind_br_after_head[7:0] = {ind_br[4:0],3'b0};
  8'b00001000: ind_br_after_head[7:0] = {ind_br[3:0],4'b0};
  8'b00000100: ind_br_after_head[7:0] = {ind_br[2:0],5'b0};
  8'b00000010: ind_br_after_head[7:0] = {ind_br[1:0],6'b0};
  8'b00000001: ind_br_after_head[7:0] = {ind_br[0],7'b0};
  default    : ind_br_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1528
end

// &CombBeg; @1530
always @( jal[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: jal_after_head[7:0] =  jal[7:0];
  8'b01000000: jal_after_head[7:0] = {jal[6:0],1'b0};
  8'b00100000: jal_after_head[7:0] = {jal[5:0],2'b0};
  8'b00010000: jal_after_head[7:0] = {jal[4:0],3'b0};
  8'b00001000: jal_after_head[7:0] = {jal[3:0],4'b0};
  8'b00000100: jal_after_head[7:0] = {jal[2:0],5'b0};
  8'b00000010: jal_after_head[7:0] = {jal[1:0],6'b0};
  8'b00000001: jal_after_head[7:0] = {jal[0],7'b0};
  default    : jal_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1542
end
                                  
// &CombBeg; @1544
always @( jalr[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: jalr_after_head[7:0] =  jalr[7:0];
  8'b01000000: jalr_after_head[7:0] = {jalr[6:0],1'b0};
  8'b00100000: jalr_after_head[7:0] = {jalr[5:0],2'b0};
  8'b00010000: jalr_after_head[7:0] = {jalr[4:0],3'b0};
  8'b00001000: jalr_after_head[7:0] = {jalr[3:0],4'b0};
  8'b00000100: jalr_after_head[7:0] = {jalr[2:0],5'b0};
  8'b00000010: jalr_after_head[7:0] = {jalr[1:0],6'b0};
  8'b00000001: jalr_after_head[7:0] = {jalr[0],7'b0};
  default    : jalr_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1556
end
                                  
// &CombBeg; @1558
always @( vpc_onehot[7:0]
       or inst_32[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: inst_32_after_head[7:0] =  inst_32[7:0];
  8'b01000000: inst_32_after_head[7:0] = {inst_32[6:0],1'b0};
  8'b00100000: inst_32_after_head[7:0] = {inst_32[5:0],2'b0};
  8'b00010000: inst_32_after_head[7:0] = {inst_32[4:0],3'b0};
  8'b00001000: inst_32_after_head[7:0] = {inst_32[3:0],4'b0};
  8'b00000100: inst_32_after_head[7:0] = {inst_32[2:0],5'b0};
  8'b00000010: inst_32_after_head[7:0] = {inst_32[1:0],6'b0};
  8'b00000001: inst_32_after_head[7:0] = {inst_32[0],7'b0};
  default    : inst_32_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1570
end
                                  
// &CombBeg; @1572
always @( vpc_onehot[7:0]
       or bry_data[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: bry_data_after_head[7:0] =  bry_data[7:0];
  8'b01000000: bry_data_after_head[7:0] = {bry_data[6:0],1'b0};
  8'b00100000: bry_data_after_head[7:0] = {bry_data[5:0],2'b0};
  8'b00010000: bry_data_after_head[7:0] = {bry_data[4:0],3'b0};
  8'b00001000: bry_data_after_head[7:0] = {bry_data[3:0],4'b0};
  8'b00000100: bry_data_after_head[7:0] = {bry_data[2:0],5'b0};
  8'b00000010: bry_data_after_head[7:0] = {bry_data[1:0],6'b0};
  8'b00000001: bry_data_after_head[7:0] = {bry_data[0],7'b0};
  default    : bry_data_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1584
end
                               
// &CombBeg; @1586
always @( split0[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: split0_after_head[7:0] =  split0[7:0];
  8'b01000000: split0_after_head[7:0] = {split0[6:0],1'b0};
  8'b00100000: split0_after_head[7:0] = {split0[5:0],2'b0};
  8'b00010000: split0_after_head[7:0] = {split0[4:0],3'b0};
  8'b00001000: split0_after_head[7:0] = {split0[3:0],4'b0};
  8'b00000100: split0_after_head[7:0] = {split0[2:0],5'b0};
  8'b00000010: split0_after_head[7:0] = {split0[1:0],6'b0};
  8'b00000001: split0_after_head[7:0] = {split0[0],7'b0};
  default    : split0_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1598
end

// &CombBeg; @1600
always @( split1[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: split1_after_head[7:0] =  split1[7:0];
  8'b01000000: split1_after_head[7:0] = {split1[6:0],1'b0};
  8'b00100000: split1_after_head[7:0] = {split1[5:0],2'b0};
  8'b00010000: split1_after_head[7:0] = {split1[4:0],3'b0};
  8'b00001000: split1_after_head[7:0] = {split1[3:0],4'b0};
  8'b00000100: split1_after_head[7:0] = {split1[2:0],5'b0};
  8'b00000010: split1_after_head[7:0] = {split1[1:0],6'b0};
  8'b00000001: split1_after_head[7:0] = {split1[0],7'b0};
  default    : split1_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1612
end

// &CombBeg; @1614
always @( vpc_onehot[7:0]
       or fence[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: fence_after_head[7:0] =  fence[7:0];
  8'b01000000: fence_after_head[7:0] = {fence[6:0],1'b0};
  8'b00100000: fence_after_head[7:0] = {fence[5:0],2'b0};
  8'b00010000: fence_after_head[7:0] = {fence[4:0],3'b0};
  8'b00001000: fence_after_head[7:0] = {fence[3:0],4'b0};
  8'b00000100: fence_after_head[7:0] = {fence[2:0],5'b0};
  8'b00000010: fence_after_head[7:0] = {fence[1:0],6'b0};
  8'b00000001: fence_after_head[7:0] = {fence[0],7'b0};
  default    : fence_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1626
end

// &CombBeg; @1628
always @( vpc_onehot[7:0]
       or bkpta[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: bkpta_after_head[7:0] =  bkpta[7:0];
  8'b01000000: bkpta_after_head[7:0] = {bkpta[6:0],1'b0};
  8'b00100000: bkpta_after_head[7:0] = {bkpta[5:0],2'b0};
  8'b00010000: bkpta_after_head[7:0] = {bkpta[4:0],3'b0};
  8'b00001000: bkpta_after_head[7:0] = {bkpta[3:0],4'b0};
  8'b00000100: bkpta_after_head[7:0] = {bkpta[2:0],5'b0};
  8'b00000010: bkpta_after_head[7:0] = {bkpta[1:0],6'b0};
  8'b00000001: bkpta_after_head[7:0] = {bkpta[0],7'b0};
  default    : bkpta_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1640
end

// &CombBeg; @1642
always @( vpc_onehot[7:0]
       or bkptb[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: bkptb_after_head[7:0] =  bkptb[7:0];
  8'b01000000: bkptb_after_head[7:0] = {bkptb[6:0],1'b0};
  8'b00100000: bkptb_after_head[7:0] = {bkptb[5:0],2'b0};
  8'b00010000: bkptb_after_head[7:0] = {bkptb[4:0],3'b0};
  8'b00001000: bkptb_after_head[7:0] = {bkptb[3:0],4'b0};
  8'b00000100: bkptb_after_head[7:0] = {bkptb[2:0],5'b0};
  8'b00000010: bkptb_after_head[7:0] = {bkptb[1:0],6'b0};
  8'b00000001: bkptb_after_head[7:0] = {bkptb[0],7'b0};
  default    : bkptb_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1654
end

// &CombBeg; @1656
always @( vsetvli[7:0]
       or vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: vsetvli_after_head[7:0] =  vsetvli[7:0];
  8'b01000000: vsetvli_after_head[7:0] = {vsetvli[6:0],1'b0};
  8'b00100000: vsetvli_after_head[7:0] = {vsetvli[5:0],2'b0};
  8'b00010000: vsetvli_after_head[7:0] = {vsetvli[4:0],3'b0};
  8'b00001000: vsetvli_after_head[7:0] = {vsetvli[3:0],4'b0};
  8'b00000100: vsetvli_after_head[7:0] = {vsetvli[2:0],5'b0};
  8'b00000010: vsetvli_after_head[7:0] = {vsetvli[1:0],6'b0};
  8'b00000001: vsetvli_after_head[7:0] = {vsetvli[0],7'b0};
  default    : vsetvli_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1668
end

//==========================================================
//                 Hn after head for sf/bar
//==========================================================
assign sf_hit     = ifdp_ipdp_sfp_pc_hit && ifdp_ipdp_sfp_hit_type[0];
assign bar_hit    = ifdp_ipdp_sfp_pc_hit && ifdp_ipdp_sfp_hit_type[1];
assign vl_hit     = ifdp_ipdp_sfp_pc_hit && ifdp_ipdp_sfp_hit_type[2];
assign vl_hit_raw = ifdp_ipdp_sfp_pc_hit && ifdp_ipdp_sfp_hit_type[3];

// &CombBeg; @1678
always @( ifdp_ipdp_sfp_hit_pc_lo[2:0])
begin
case(ifdp_ipdp_sfp_hit_pc_lo[2:0])
  3'b000  : sfp_pc_hit_onehot[7:0] = 8'b10000000;
  3'b001  : sfp_pc_hit_onehot[7:0] = 8'b01000000;
  3'b010  : sfp_pc_hit_onehot[7:0] = 8'b00100000;
  3'b011  : sfp_pc_hit_onehot[7:0] = 8'b00010000;
  3'b100  : sfp_pc_hit_onehot[7:0] = 8'b00001000;
  3'b101  : sfp_pc_hit_onehot[7:0] = 8'b00000100;
  3'b110  : sfp_pc_hit_onehot[7:0] = 8'b00000010;
  3'b111  : sfp_pc_hit_onehot[7:0] = 8'b00000001;
  default : sfp_pc_hit_onehot[7:0] = 8'b0;
endcase
// &CombEnd; @1690
end

assign sfp_sf_pc_hit[7:0]     = {8{sf_hit}}     & sfp_pc_hit_onehot[7:0];
assign sfp_bar_pc_hit[7:0]    = {8{bar_hit}}    & sfp_pc_hit_onehot[7:0];
assign sfp_vl_pc_hit[7:0]     = {8{vl_hit}}     & sfp_pc_hit_onehot[7:0];
assign sfp_vl_pc_raw_hit[7:0] = {8{vl_hit_raw}} & sfp_pc_hit_onehot[7:0];

assign inst_no_spec[7:0]   = sfp_sf_pc_hit[7:0]  & inst_st[7:0]
                           | sfp_bar_pc_hit[7:0] & inst_ld[7:0];

assign inst_vl_pred[7:0]   = sfp_vl_pc_raw_hit[7:0]  & vsetvli[7:0];

// &CombBeg; @1702
always @( vpc_onehot[7:0]
       or inst_no_spec[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: no_spec_after_head[7:0] =  inst_no_spec[7:0];
  8'b01000000: no_spec_after_head[7:0] = {inst_no_spec[6:0],1'b0};
  8'b00100000: no_spec_after_head[7:0] = {inst_no_spec[5:0],2'b0};
  8'b00010000: no_spec_after_head[7:0] = {inst_no_spec[4:0],3'b0};
  8'b00001000: no_spec_after_head[7:0] = {inst_no_spec[3:0],4'b0};
  8'b00000100: no_spec_after_head[7:0] = {inst_no_spec[2:0],5'b0};
  8'b00000010: no_spec_after_head[7:0] = {inst_no_spec[1:0],6'b0};
  8'b00000001: no_spec_after_head[7:0] = {inst_no_spec[0],7'b0};
  default    : no_spec_after_head[7:0] = {8{1'bx}};
endcase
// &CombEnd; @1714
end

// &CombBeg; @1716
always @( vpc_onehot[7:0]
       or inst_vl_pred[7:0])
begin
  case(vpc_onehot[7:0])
  8'b10000000: vl_pred_after_head[7:0] =  inst_vl_pred[7:0];
  8'b01000000: vl_pred_after_head[7:0] = {inst_vl_pred[6:0],1'b0};
  8'b00100000: vl_pred_after_head[7:0] = {inst_vl_pred[5:0],2'b0};
  8'b00010000: vl_pred_after_head[7:0] = {inst_vl_pred[4:0],3'b0};
  8'b00001000: vl_pred_after_head[7:0] = {inst_vl_pred[3:0],4'b0};
  8'b00000100: vl_pred_after_head[7:0] = {inst_vl_pred[2:0],5'b0};
  8'b00000010: vl_pred_after_head[7:0] = {inst_vl_pred[1:0],6'b0};
  8'b00000001: vl_pred_after_head[7:0] = {inst_vl_pred[0],7'b0};
  default    : vl_pred_after_head[7:0] = {8{1'bx}};
  endcase
// &CombEnd; @1728
end

//==========================================================
//                 Hn after tail mask
//==========================================================
//tail mask will happen under two condition:
//  1.con_br chgflw taken
//  2.con_br chgflw not taken but have more than one con_br
// &CombBeg; @1736
always @( con_br_after_head[7:0]
       or split1_after_head[7:0]
       or ind_br_after_head[7:0]
       or split0_after_head[7:0]
       or dst_vld_after_head[7:0]
       or bkpta_after_head[7:0]
       or bry_data_after_head[7:0]
       or pc_oper_after_head[7:0]
       or auipc_after_head[7:0]
       or hn_vld_after_head[7:0]
       or inst_32_after_head[7:0]
       or jal_after_head[7:0]
       or fence_after_head[7:0]
       or chgflw_after_head[7:0]
       or preturn_after_head[7:0]
       or pcall_after_head[7:0]
       or jalr_after_head[7:0]
       or bkptb_after_head[7:0]
       or ab_br_after_head[7:0])
begin
casez(con_br_after_head[7:0])
  8'b1??????? : 
  begin
                mask_ab_br[7:0]      = {ab_br_after_head[7], 7'b0};
                mask_con_br[7:0]     = {con_br_after_head[7], 7'b0};
                mask_pcall[7:0]      = {pcall_after_head[7], 7'b0};
                mask_preturn[7:0]    = {preturn_after_head[7], 7'b0};
                mask_chgflw[7:0]     = {chgflw_after_head[7], 7'b0};
                mask_pc_oper[7:0]    = {pc_oper_after_head[7], 7'b0};
                mask_dst_vld[7:0]    = {dst_vld_after_head[7], 7'b0};
                mask_inst_32[7:0]    = {inst_32_after_head[7], 7'b0};
                mask_auipc[7:0]      = {auipc_after_head[7], 7'b0};
                mask_ind_br[7:0]     = {ind_br_after_head[7], 7'b0};
                mask_jal[7:0]        = {jal_after_head[7], 7'b0};
                mask_jalr[7:0]       = {jalr_after_head[7], 7'b0};
                mask_hn_vld[7:0]     = (inst_32_after_head[7])
                                     ? {hn_vld_after_head[7:6], 6'b0}
                                     : {hn_vld_after_head[7],   7'b0};
                mask_bry_data[7:0]   = {bry_data_after_head[7],7'b0};
                mask_split1[7:0]     = {split1_after_head[7], 7'b0};
                mask_split0[7:0]     = {split0_after_head[7], 7'b0};
                mask_fence[7:0]      = {fence_after_head[7], 7'b0};
                mask_bkpta[7:0]      = {bkpta_after_head[7], 7'b0};
                mask_bkptb[7:0]      = {bkptb_after_head[7], 7'b0};
  end
  8'b01?????? : 
  begin
                mask_ab_br[7:0]      = {ab_br_after_head[7:6], 6'b0};
                mask_con_br[7:0]     = {con_br_after_head[7:6], 6'b0};
                mask_pcall[7:0]      = {pcall_after_head[7:6], 6'b0};
                mask_preturn[7:0]    = {preturn_after_head[7:6], 6'b0};
                mask_chgflw[7:0]     = {chgflw_after_head[7:6], 6'b0};
                mask_pc_oper[7:0]    = {pc_oper_after_head[7:6], 6'b0};
                mask_dst_vld[7:0]    = {dst_vld_after_head[7:6], 6'b0};
                mask_inst_32[7:0]    = {inst_32_after_head[7:6], 6'b0};
                mask_auipc[7:0]      = {auipc_after_head[7:6], 6'b0};
                mask_ind_br[7:0]     = {ind_br_after_head[7:6], 6'b0};
                mask_jal[7:0]        = {jal_after_head[7:6], 6'b0};
                mask_jalr[7:0]       = {jalr_after_head[7:6], 6'b0};
                mask_hn_vld[7:0]     = (inst_32_after_head[6])
                                     ? {hn_vld_after_head[7:5], 5'b0}
                                     : {hn_vld_after_head[7:6], 6'b0};
                mask_bry_data[7:0]   = {bry_data_after_head[7:6],6'b0};
                mask_split1[7:0]     = {split1_after_head[7:6], 6'b0};
                mask_split0[7:0]     = {split0_after_head[7:6], 6'b0};
                mask_fence[7:0]      = {fence_after_head[7:6], 6'b0};
                mask_bkpta[7:0]      = {bkpta_after_head[7:6], 6'b0};
                mask_bkptb[7:0]      = {bkptb_after_head[7:6], 6'b0};
  end
  8'b001????? : 
  begin
                mask_ab_br[7:0]      = {ab_br_after_head[7:5], 5'b0};
                mask_con_br[7:0]     = {con_br_after_head[7:5], 5'b0};
                mask_pcall[7:0]      = {pcall_after_head[7:5], 5'b0};
                mask_preturn[7:0]    = {preturn_after_head[7:5], 5'b0};
                mask_chgflw[7:0]     = {chgflw_after_head[7:5], 5'b0};
                mask_pc_oper[7:0]    = {pc_oper_after_head[7:5], 5'b0};
                mask_dst_vld[7:0]    = {dst_vld_after_head[7:5], 5'b0};
                mask_inst_32[7:0]    = {inst_32_after_head[7:5], 5'b0};
                mask_auipc[7:0]      = {auipc_after_head[7:5], 5'b0};
                mask_ind_br[7:0]     = {ind_br_after_head[7:5], 5'b0};
                mask_jal[7:0]        = {jal_after_head[7:5], 5'b0};
                mask_jalr[7:0]       = {jalr_after_head[7:5], 5'b0};
                mask_hn_vld[7:0]     = (inst_32_after_head[5])
                                     ? {hn_vld_after_head[7:4], 4'b0}
                                     : {hn_vld_after_head[7:5], 5'b0};
                mask_bry_data[7:0]   = {bry_data_after_head[7:5],5'b0};
                mask_split1[7:0]     = {split1_after_head[7:5], 5'b0};
                mask_split0[7:0]     = {split0_after_head[7:5], 5'b0};
                mask_fence[7:0]      = {fence_after_head[7:5], 5'b0};
                mask_bkpta[7:0]      = {bkpta_after_head[7:5], 5'b0};
                mask_bkptb[7:0]      = {bkptb_after_head[7:5], 5'b0};
  end
  8'b0001???? : 
  begin
                mask_ab_br[7:0]      = {ab_br_after_head[7:4], 4'b0};
                mask_con_br[7:0]     = {con_br_after_head[7:4], 4'b0};
                mask_pcall[7:0]      = {pcall_after_head[7:4], 4'b0};
                mask_preturn[7:0]    = {preturn_after_head[7:4], 4'b0};
                mask_chgflw[7:0]     = {chgflw_after_head[7:4], 4'b0};
                mask_pc_oper[7:0]    = {pc_oper_after_head[7:4], 4'b0};
                mask_dst_vld[7:0]    = {dst_vld_after_head[7:4], 4'b0};
                mask_inst_32[7:0]    = {inst_32_after_head[7:4], 4'b0};
                mask_auipc[7:0]      = {auipc_after_head[7:4], 4'b0};
                mask_ind_br[7:0]     = {ind_br_after_head[7:4], 4'b0};
                mask_jal[7:0]        = {jal_after_head[7:4], 4'b0};
                mask_jalr[7:0]       = {jalr_after_head[7:4], 4'b0};
                mask_hn_vld[7:0]     = (inst_32_after_head[4])
                                     ? {hn_vld_after_head[7:3], 3'b0}
                                     : {hn_vld_after_head[7:4], 4'b0};
                mask_bry_data[7:0]   = {bry_data_after_head[7:4],4'b0};
                mask_split1[7:0]     = {split1_after_head[7:4], 4'b0};
                mask_split0[7:0]     = {split0_after_head[7:4], 4'b0};
                mask_fence[7:0]      = {fence_after_head[7:4], 4'b0};
                mask_bkpta[7:0]      = {bkpta_after_head[7:4], 4'b0};
                mask_bkptb[7:0]      = {bkptb_after_head[7:4], 4'b0};
  end
  8'b00001??? : 
  begin
                mask_ab_br[7:0]      = {ab_br_after_head[7:3], 3'b0};
                mask_con_br[7:0]     = {con_br_after_head[7:3], 3'b0};
                mask_pcall[7:0]      = {pcall_after_head[7:3], 3'b0};
                mask_preturn[7:0]    = {preturn_after_head[7:3], 3'b0};
                mask_chgflw[7:0]     = {chgflw_after_head[7:3], 3'b0};
                mask_pc_oper[7:0]    = {pc_oper_after_head[7:3], 3'b0};
                mask_dst_vld[7:0]    = {dst_vld_after_head[7:3], 3'b0};
                mask_inst_32[7:0]    = {inst_32_after_head[7:3], 3'b0};
                mask_auipc[7:0]      = {auipc_after_head[7:3], 3'b0};
                mask_ind_br[7:0]     = {ind_br_after_head[7:3], 3'b0};
                mask_jal[7:0]        = {jal_after_head[7:3], 3'b0};
                mask_jalr[7:0]       = {jalr_after_head[7:3], 3'b0};
                mask_hn_vld[7:0]     = (inst_32_after_head[3])
                                     ? {hn_vld_after_head[7:2], 2'b0}
                                     : {hn_vld_after_head[7:3], 3'b0};
                mask_bry_data[7:0]   = {bry_data_after_head[7:3],3'b0};
                mask_split1[7:0]     = {split1_after_head[7:3], 3'b0};
                mask_split0[7:0]     = {split0_after_head[7:3], 3'b0};
                mask_fence[7:0]      = {fence_after_head[7:3], 3'b0};
                mask_bkpta[7:0]      = {bkpta_after_head[7:3], 3'b0};
                mask_bkptb[7:0]      = {bkptb_after_head[7:3], 3'b0};
  end
  8'b000001?? : 
  begin
                mask_ab_br[7:0]      = {ab_br_after_head[7:2], 2'b0};
                mask_con_br[7:0]     = {con_br_after_head[7:2], 2'b0};
                mask_pcall[7:0]      = {pcall_after_head[7:2], 2'b0};
                mask_preturn[7:0]    = {preturn_after_head[7:2], 2'b0};
                mask_chgflw[7:0]     = {chgflw_after_head[7:2], 2'b0};
                mask_pc_oper[7:0]    = {pc_oper_after_head[7:2], 2'b0};
                mask_dst_vld[7:0]    = {dst_vld_after_head[7:2], 2'b0};
                mask_inst_32[7:0]    = {inst_32_after_head[7:2], 2'b0};
                mask_auipc[7:0]      = {auipc_after_head[7:2], 2'b0};
                mask_ind_br[7:0]     = {ind_br_after_head[7:2], 2'b0};
                mask_jal[7:0]        = {jal_after_head[7:2], 2'b0};
                mask_jalr[7:0]       = {jalr_after_head[7:2], 2'b0};
                mask_hn_vld[7:0]     = (inst_32_after_head[2])
                                     ? {hn_vld_after_head[7:1], 1'b0}
                                     : {hn_vld_after_head[7:2], 2'b0};
                mask_bry_data[7:0]   = {bry_data_after_head[7:2],2'b0};
                mask_split1[7:0]     = {split1_after_head[7:2], 2'b0};
                mask_split0[7:0]     = {split0_after_head[7:2], 2'b0};
                mask_fence[7:0]      = {fence_after_head[7:2], 2'b0};
                mask_bkpta[7:0]      = {bkpta_after_head[7:2], 2'b0};
                mask_bkptb[7:0]      = {bkptb_after_head[7:2], 2'b0};
  end
  8'b0000001? : 
  begin
                mask_ab_br[7:0]      = {ab_br_after_head[7:1], 1'b0};
                mask_con_br[7:0]     = {con_br_after_head[7:1], 1'b0};
                mask_pcall[7:0]      = {pcall_after_head[7:1], 1'b0};
                mask_preturn[7:0]    = {preturn_after_head[7:1], 1'b0};
                mask_chgflw[7:0]     = {chgflw_after_head[7:1], 1'b0};
                mask_pc_oper[7:0]    = {pc_oper_after_head[7:1], 1'b0};
                mask_dst_vld[7:0]    = {dst_vld_after_head[7:1], 1'b0};
                mask_inst_32[7:0]    = {inst_32_after_head[7:1], 1'b0};
                mask_auipc[7:0]      = {auipc_after_head[7:1], 1'b0};
                mask_ind_br[7:0]     = {ind_br_after_head[7:1], 1'b0};
                mask_jal[7:0]        = {jal_after_head[7:1], 1'b0};
                mask_jalr[7:0]       = {jalr_after_head[7:1], 1'b0};
                mask_hn_vld[7:0]     = (inst_32_after_head[1])
                                     ? {hn_vld_after_head[7:0]}
                                     : {hn_vld_after_head[7:1], 1'b0};
                mask_bry_data[7:0]   = {bry_data_after_head[7:1],1'b0};
                mask_split1[7:0]     = {split1_after_head[7:1], 1'b0};
                mask_split0[7:0]     = {split0_after_head[7:1], 1'b0};
                mask_fence[7:0]      = {fence_after_head[7:1], 1'b0};
                mask_bkpta[7:0]      = {bkpta_after_head[7:1], 1'b0};
                mask_bkptb[7:0]      = {bkptb_after_head[7:1], 1'b0};
  end
  default     : 
  begin
                mask_ab_br[7:0]      = ab_br_after_head[7:0];
                mask_con_br[7:0]     = con_br_after_head[7:0];
                mask_pcall[7:0]      = pcall_after_head[7:0];
                mask_preturn[7:0]    = preturn_after_head[7:0];
                mask_chgflw[7:0]     = chgflw_after_head[7:0];
                mask_pc_oper[7:0]    = pc_oper_after_head[7:0];
                mask_dst_vld[7:0]    = dst_vld_after_head[7:0];
                mask_inst_32[7:0]    = inst_32_after_head[7:0];
                mask_auipc[7:0]      = auipc_after_head[7:0];
                mask_ind_br[7:0]     = ind_br_after_head[7:0];
                mask_jal[7:0]        = jal_after_head[7:0];
                mask_jalr[7:0]       = jalr_after_head[7:0];
                mask_hn_vld[7:0]     = hn_vld_after_head[7:0];
                mask_bry_data[7:0]   = bry_data_after_head[7:0];
                mask_split1[7:0]     = split1_after_head[7:0];
                mask_split0[7:0]     = split0_after_head[7:0];
                mask_fence[7:0]      = fence_after_head[7:0];
                mask_bkpta[7:0]      = bkpta_after_head[7:0];
                mask_bkptb[7:0]      = bkptb_after_head[7:0];
  end
endcase
// &CombEnd; @1929
end

//==========================================================
//                      Chgflw Mask
//==========================================================
//chgflw mask used to mask half word after chgflw except con_br
// &CombBeg; @1935
always @( inst_32_after_head[7:1]
       or inst_32_after_head[2:1]
       or chgflw_after_head[7:0])
begin
casez(chgflw_after_head[7:0])
  8'b1??????? :  chgflw_mask[7:0] = (inst_32_after_head[7]) 
                                  ? 8'b11000000 
                                  : 8'b10000000;
  8'b01?????? :  chgflw_mask[7:0] = (inst_32_after_head[6]) 
                                  ? 8'b11100000 
                                  : 8'b11000000;
  8'b001????? :  chgflw_mask[7:0] = (inst_32_after_head[5]) 
                                  ? 8'b11110000 
                                  : 8'b11100000;
  8'b0001???? :  chgflw_mask[7:0] = (inst_32_after_head[4]) 
                                  ? 8'b11111000 
                                  : 8'b11110000;
  8'b00001??? :  chgflw_mask[7:0] = (inst_32_after_head[3]) 
                                  ? 8'b11111100 
                                  : 8'b11111000;
  8'b000001?? :  chgflw_mask[7:0] = (inst_32_after_head[2]) 
                                  ? 8'b11111110 
                                  : 8'b11111100;
  8'b0000001? :  chgflw_mask[7:0] = (inst_32_after_head[1]) 
                                  ? 8'b11111111 
                                  : 8'b11111110;
  default     :  chgflw_mask[7:0] = 8'b11111111;
endcase
// &CombEnd; @1960
end

// &CombBeg; @1962
always @( h3_vlmul_after_head[1:0]
       or h2_vl_after_head[7:0]
       or h6_vlmul_after_head[1:0]
       or h4_vsew_after_head[2:0]
       or h8_vlmul_after_head[1:0]
       or h2_vsew_after_head[2:0]
       or h6_vl_after_head[7:0]
       or h8_vsew_after_head[2:0]
       or h7_vl_after_head[7:0]
       or h4_vlmul_after_head[1:0]
       or h7_vlmul_after_head[1:0]
       or h8_vl_after_head[7:0]
       or h5_vl_after_head[7:0]
       or h7_vsew_after_head[2:0]
       or h1_vsew_after_head[2:0]
       or chgflw_after_head[7:0]
       or h1_vlmul_after_head[1:0]
       or h3_vsew_after_head[2:0]
       or h5_vsew_after_head[2:0]
       or h6_vsew_after_head[2:0]
       or h2_vlmul_after_head[1:0]
       or h3_vl_after_head[7:0]
       or h5_vlmul_after_head[1:0]
       or h1_vl_after_head[7:0]
       or h4_vl_after_head[7:0])
begin
casez(chgflw_after_head[7:0])
  8'b1??????? : begin
                chgflw_vlmul[1:0] = h1_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h1_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h1_vl_after_head[7:0];
                end
  8'b01?????? : begin
                chgflw_vlmul[1:0] = h2_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h2_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h2_vl_after_head[7:0];
                end
  8'b001????? : begin
                chgflw_vlmul[1:0] = h3_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h3_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h3_vl_after_head[7:0];
                end
  8'b0001???? : begin
                chgflw_vlmul[1:0] = h4_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h4_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h4_vl_after_head[7:0];
                end
  8'b00001??? : begin
                chgflw_vlmul[1:0] = h5_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h5_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h5_vl_after_head[7:0];
                end
  8'b000001?? : begin
                chgflw_vlmul[1:0] = h6_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h6_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h6_vl_after_head[7:0];
                end
  8'b0000001? : begin
                chgflw_vlmul[1:0] = h7_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h7_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h7_vl_after_head[7:0];
                end
  default     : begin
                chgflw_vlmul[1:0] = h8_vlmul_after_head[1:0];
                chgflw_vsew[2:0]  = h8_vsew_after_head[2:0];
                chgflw_vl[7:0]    = h8_vl_after_head[7:0];
                end
endcase
// &CombEnd;              @2005
end

//==========================================================
//                IP to IB Stage Data
//==========================================================
assign ip_h1_data[15:0] = h1_data_after_head[15:0];
assign ip_h2_data[15:0] = h2_data_after_head[15:0];
assign ip_h3_data[15:0] = h3_data_after_head[15:0];
assign ip_h4_data[15:0] = h4_data_after_head[15:0];
assign ip_h5_data[15:0] = h5_data_after_head[15:0];
assign ip_h6_data[15:0] = h6_data_after_head[15:0];
assign ip_h7_data[15:0] = h7_data_after_head[15:0];
assign ip_h8_data[15:0] = h8_data_after_head[15:0];

assign more_than_one_br_vld = ipctrl_ipdp_br_more_than_one_stall;
assign tail_vld             = con_br_first_branch && bht_result || 
                              more_than_one_br_vld;

assign ip_ab_br[7:0]      = (tail_vld) 
                          ? mask_ab_br[7:0] 
                          : ab_br_after_head[7:0];
assign ip_con_br[7:0]     = (tail_vld) 
                          ? mask_con_br[7:0] 
                          : con_br_after_head[7:0];
assign ip_pcall[7:0]      = (tail_vld) 
                          ? mask_pcall[7:0] 
                          : pcall_after_head[7:0];
assign ip_preturn[7:0]    = (tail_vld) 
                          ? mask_preturn[7:0] 
                          : preturn_after_head[7:0];
assign ip_chgflw[7:0]     = (tail_vld)
                          ? mask_chgflw[7:0]
                          : chgflw_after_head[7:0];
assign ip_pc_oper[7:0]    = (tail_vld) 
                          ? mask_pc_oper[7:0] 
                          : pc_oper_after_head[7:0];
assign ip_dst_vld[7:0]    = (tail_vld) 
                          ? mask_dst_vld[7:0] 
                          : dst_vld_after_head[7:0];                          
assign ip_inst_32[7:0]    = (tail_vld) 
                          ? mask_inst_32[7:0] 
                          : inst_32_after_head[7:0];
assign ip_auipc[7:0] =    (tail_vld) 
                          ? mask_auipc[7:0] 
                          : auipc_after_head[7:0]; 
assign ip_ind_br[7:0]     = (tail_vld) 
                          ? mask_ind_br[7:0] 
                          : ind_br_after_head[7:0];                       
assign ip_jal[7:0]        = (tail_vld) 
                          ? mask_jal[7:0] 
                          : jal_after_head[7:0];                       
assign ip_jalr[7:0]       = (tail_vld) 
                          ? mask_jalr[7:0] 
                          : jalr_after_head[7:0];                       
assign ip_hn_vld[7:0]     = (tail_vld)
                          ? mask_hn_vld[7:0]
                          : hn_vld_after_head[7:0];
assign ip_bry_data[7:0]   = (tail_vld)
                          ? mask_bry_data[7:0]
                          : bry_data_after_head[7:0];
assign ip_split1[7:0]     = (tail_vld) 
                          ? mask_split1[7:0] 
                          : split1_after_head[7:0];                          
assign ip_split0[7:0]     = (tail_vld) 
                          ? mask_split0[7:0] 
                          : split0_after_head[7:0];                          
assign ip_fence[7:0]      = (tail_vld) 
                          ? mask_fence[7:0] 
                          : fence_after_head[7:0];                          
assign ip_bkpta[7:0]      = (tail_vld) 
                          ? mask_bkpta[7:0] 
                          : bkpta_after_head[7:0];                          
assign ip_bkptb[7:0]      = (tail_vld) 
                          ? mask_bkptb[7:0] 
                          : bkptb_after_head[7:0];    
assign ip_vlmul[1:0]      = (more_than_one_br_vld)
                          ? con_br_vlmul[1:0]
                          : inst_chgflw_vlmul[1:0];
assign ip_vsew[2:0]       = (more_than_one_br_vld)
                          ? con_br_vsew[2:0]
                          : inst_chgflw_vsew[2:0];
assign ip_vl[7:0]         = (more_than_one_br_vld)
                          ? con_br_vl[7:0]
                          : inst_chgflw_vl[7:0];

assign ip_vmask[7:0]      = (more_than_one_br_vld)
                          ? con_br_vmask[7:0]
                          : inst_chgflw_vmask[7:0];

//mask tail is not necessory for spec fail information                          
assign ip_inst_ldst[7:0]  = inst_ldst_after_head[7:0];
assign ip_no_spec[7:0]    = no_spec_after_head[7:0];
assign ip_vl_pred[7:0]    = vl_pred_after_head[7:0];
assign ip_vsetvli[7:0]    = vsetvli_after_head[7:0];
assign ipdp_ipctrl_no_br = ~(|br[7:0]);
//  &Force("nonport","br"); @2102
//had data
assign ip_had_ab_br[7:0]    = {had_ab_br,7'b0};
assign ip_had_con_br[7:0]   = {had_con_br,7'b0};
assign ip_had_pcall[7:0]    = {had_pcall,7'b0};
assign ip_had_preturn[7:0]  = {had_preturn,7'b0};
assign ip_had_chgflw[7:0]   = {had_chgflw,7'b0};
assign ip_had_pc_oper[7:0]  = {had_pc_oper,7'b0};
assign ip_had_inst_ldst[7:0]= {had_ld || had_st,7'b0};
assign ip_had_dst_vld[7:0]  = {had_dst_vld,7'b0};
assign ip_had_auipc[7:0]    = {had_auipc,7'b0};
assign ip_had_ind_br[7:0]   = {had_ind_br,7'b0};
assign ip_had_jal[7:0]      = {had_jal,7'b0};
assign ip_had_jalr[7:0]     = {had_jalr,7'b0};
assign ip_had_no_spec[7:0]  = 8'b0;
assign ip_had_vl_pred[7:0]  = 8'b0;
assign ip_had_bry_data[7:0] = 8'h80;
assign ip_had_split0[7:0]   = {had_split0,7'b0};
assign ip_had_split1[7:0]   = {had_split1,7'b0};
assign ip_had_fence[7:0]    = {had_fence,7'b0};
assign ip_had_bkpta[7:0]    = 8'b0;
assign ip_had_bkptb[7:0]    = 8'b0;
assign ip_had_vsetvli[7:0]  = {had_vsetvli,7'b0};
assign ip_had_inst_32[7]    = had_data[1:0] == 2'b11;
assign ip_had_inst_32[6:0]  = 7'b0;
assign ip_had_vld[7]        = had_ifu_ir_vld;
assign ip_had_vld[6]        = had_ifu_ir_vld && (had_data[1:0] == 2'b11);
assign ip_had_vld[5:0]      = 6'b0;


always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ip_mmu_acc_deny_ff <= 1'b0;
  else 
    ip_mmu_acc_deny_ff <= ip_mmu_acc_deny; 
end

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ip_mmu_acc_deny_ff_vld <= 1'b0;
  else if(pcgen_ipctrl_pipe_cancel)
    ip_mmu_acc_deny_ff_vld <= 1'b0;
  else if(ipctrl_ipdp_pipe_stall || ipctrl_ipdp_self_stall || ipctrl_ipdp_br_more_than_one_stall)
    ip_mmu_acc_deny_ff_vld <= 1'b1;
  else
    ip_mmu_acc_deny_ff_vld <= 1'b0;
end

assign ip_mmu_acc_deny = (ip_mmu_acc_deny_ff_vld)
                       ? ip_mmu_acc_deny_ff
                       : mmu_ifu_deny;
assign ip_mmu_pgflt    = ifdp_ipdp_mmu_pgflt;
assign ip_acc_err      = ifdp_ipdp_acc_err;

//==========================================================
//                 Hn Base & Hn Offset
//==========================================================
//Hn_base[2:0]
// &CombBeg; @2166
always @( vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h1_base_after_head[2:0] = 3'b000;
  8'b01000000: h1_base_after_head[2:0] = 3'b001;
  8'b00100000: h1_base_after_head[2:0] = 3'b010;
  8'b00010000: h1_base_after_head[2:0] = 3'b011;
  8'b00001000: h1_base_after_head[2:0] = 3'b100;
  8'b00000100: h1_base_after_head[2:0] = 3'b101;
  8'b00000010: h1_base_after_head[2:0] = 3'b110;
  8'b00000001: h1_base_after_head[2:0] = 3'b111;
  default    : h1_base_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @2178
end

// &CombBeg; @2180
always @( vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h2_base_after_head[2:0] = 3'b001;
  8'b01000000: h2_base_after_head[2:0] = 3'b010;
  8'b00100000: h2_base_after_head[2:0] = 3'b011;
  8'b00010000: h2_base_after_head[2:0] = 3'b100;
  8'b00001000: h2_base_after_head[2:0] = 3'b101;
  8'b00000100: h2_base_after_head[2:0] = 3'b110;
  8'b00000010: h2_base_after_head[2:0] = 3'b111;
  default    : h2_base_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @2191
end

// &CombBeg; @2193
always @( vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h3_base_after_head[2:0] = 3'b010;
  8'b01000000: h3_base_after_head[2:0] = 3'b011;
  8'b00100000: h3_base_after_head[2:0] = 3'b100;
  8'b00010000: h3_base_after_head[2:0] = 3'b101;
  8'b00001000: h3_base_after_head[2:0] = 3'b110;
  8'b00000100: h3_base_after_head[2:0] = 3'b111;
  default    : h3_base_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @2203
end

// &CombBeg; @2205
always @( vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h4_base_after_head[2:0] = 3'b011;
  8'b01000000: h4_base_after_head[2:0] = 3'b100;
  8'b00100000: h4_base_after_head[2:0] = 3'b101;
  8'b00010000: h4_base_after_head[2:0] = 3'b110;
  8'b00001000: h4_base_after_head[2:0] = 3'b111;
  default    : h4_base_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd; @2214
end

// &CombBeg; @2216
always @( vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h5_base_after_head[2:0] = 3'b100;
  8'b01000000: h5_base_after_head[2:0] = 3'b101;
  8'b00100000: h5_base_after_head[2:0] = 3'b110;
  8'b00010000: h5_base_after_head[2:0] = 3'b111;
  default    : h5_base_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd;                                 @2224
end

// &CombBeg; @2226
always @( vpc_onehot[7:0])
begin
case(vpc_onehot[7:0])
  8'b10000000: h6_base_after_head[2:0] = 3'b101;
  8'b01000000: h6_base_after_head[2:0] = 3'b110;
  8'b00100000: h6_base_after_head[2:0] = 3'b111;
  default    : h6_base_after_head[2:0] = {3{1'bx}};
endcase
// &CombEnd;                                 @2233
end

                                
assign h7_base_after_head[2:0] = (vpc_onehot[7])
                                 ? 3'b110
                                 : 3'b111;
                                
assign h8_base_after_head[2:0] = 3'b111;

//==========================================================
//                   BHT Information
//==========================================================
//BHT Result Get
//bht_ipdp_pre_array_data[31:0]
//bht_ipdp_pre_offset_onehot[15:0]
assign pre_array_data[31:0] = (bht_sel_result[1])
                            ? bht_ipdp_pre_array_data_taken[31:0]
                            : bht_ipdp_pre_array_data_ntake[31:0];

// &CombBeg; @2252
always @( pre_array_data[1:0]
       or pre_array_data[31:26]
       or pre_array_data[9:2]
       or pre_array_data[15:10]
       or bht_ipdp_pre_offset_onehot[15:0]
       or pre_array_data[25:16])
begin
case(bht_ipdp_pre_offset_onehot[15:0])
  16'b1000000000000000: bht_pre_result[1:0] = pre_array_data[31:30];
  16'b0100000000000000: bht_pre_result[1:0] = pre_array_data[29:28];
  16'b0010000000000000: bht_pre_result[1:0] = pre_array_data[27:26];
  16'b0001000000000000: bht_pre_result[1:0] = pre_array_data[25:24];
  16'b0000100000000000: bht_pre_result[1:0] = pre_array_data[23:22];
  16'b0000010000000000: bht_pre_result[1:0] = pre_array_data[21:20];
  16'b0000001000000000: bht_pre_result[1:0] = pre_array_data[19:18];
  16'b0000000100000000: bht_pre_result[1:0] = pre_array_data[17:16];
  16'b0000000010000000: bht_pre_result[1:0] = pre_array_data[15:14];
  16'b0000000001000000: bht_pre_result[1:0] = pre_array_data[13:12];
  16'b0000000000100000: bht_pre_result[1:0] = pre_array_data[11:10];
  16'b0000000000010000: bht_pre_result[1:0] = pre_array_data[9:8];
  16'b0000000000001000: bht_pre_result[1:0] = pre_array_data[7:6];
  16'b0000000000000100: bht_pre_result[1:0] = pre_array_data[5:4];
  16'b0000000000000010: bht_pre_result[1:0] = pre_array_data[3:2];
  16'b0000000000000001: bht_pre_result[1:0] = pre_array_data[1:0];
  default             : bht_pre_result[1:0] = {2{1'bx}};
endcase
// &CombEnd; @2272
end

assign bht_result = bht_pre_result[1];
assign bht_sel_result[1:0] = bht_ipdp_sel_array_result[1:0];
assign ipdp_ipctrl_bht_result = bht_result;
assign ipdp_ipctrl_bht_data[1:0] = bht_pre_result[1:0];

//==========================================================
//                The first Branch Inst
//==========================================================
//Way0 & Way1 branch pre
//All Branch include con_br & ab_br & jump 
assign inst_branch_w0_pre[7]   = (h0_vld)
                               ? (h0_chgflw | h0_con_br)
                               : (way0_branch[7]);
assign inst_branch_w0_pre[6:1] = (way0_branch[6:1]);
assign inst_branch_w0_pre[0]   = (way0_32[0])
                               ? 1'b0
                               : (way0_branch[0]);

assign inst_branch_w1_pre[7]   = (h0_vld)
                               ? (h0_chgflw | h0_con_br)
                               : (way1_branch[7]);
assign inst_branch_w1_pre[6:1] = (way1_branch[6:1]);
assign inst_branch_w1_pre[0]   = (way1_32[0])
                               ? 1'b0
                               : (way1_branch[0]);

assign inst_branch_pre[7:0]    = (way0_hit_short) 
                                 ? inst_branch_w0_pre[7:0] 
                                 : inst_branch_w1_pre[7:0];
assign inst_branch[7:0]        = inst_branch_pre[7:0] & bry_data[7:0];

// &CombBeg; @2307
always @( inst_branch[7:0]
       or ipctrl_ipdp_hn_con_br[7:3]
       or ipctrl_ipdp_hn_con_br[2:0])
begin
casez(inst_branch[7:0])
  8'b1??????? : con_br_first_branch = ipctrl_ipdp_hn_con_br[7];
  8'b01?????? : con_br_first_branch = ipctrl_ipdp_hn_con_br[6];
  8'b001????? : con_br_first_branch = ipctrl_ipdp_hn_con_br[5];
  8'b0001???? : con_br_first_branch = ipctrl_ipdp_hn_con_br[4];
  8'b00001??? : con_br_first_branch = ipctrl_ipdp_hn_con_br[3];
  8'b000001?? : con_br_first_branch = ipctrl_ipdp_hn_con_br[2];
  8'b0000001? : con_br_first_branch = ipctrl_ipdp_hn_con_br[1];
  8'b00000001 : con_br_first_branch = ipctrl_ipdp_hn_con_br[0];
  default     : con_br_first_branch = 1'b0;
endcase
// &CombEnd; @2319
end

assign ipdp_ipctrl_con_br_first_branch = con_br_first_branch;

//==========================================================
//                Con_br more than one
//==========================================================
assign con_br_more_than_one = !(
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0000_0000) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0000_0001) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0000_0010) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0000_0100) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0000_1000) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0001_0000) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0010_0000) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b0100_0000) || 
                                 (ipctrl_ipdp_hn_con_br[7:0] == 8'b1000_0000) 
                               );

assign ipdp_ipctrl_con_br_more_than_one = con_br_more_than_one;

//==========================================================
//              The first branch Inst
//==========================================================
//The logic of finding the first branch 
//According the location of first branch
//generate the BTB Target/Tag/Base/offset infor
assign branch[7:0]      = ipctrl_ipdp_branch[7:0];
// &CombBeg; @2347
always @( h6_vl[7:0]
       or h4_vl[7:0]
       or h5_vlmul[1:0]
       or h2_offset[20:0]
       or h2_vsew[2:0]
       or h4_vlmul[1:0]
       or h0_cur_pc[35:0]
       or h7_vl[7:0]
       or ip_vpc[38:3]
       or h4_offset[20:0]
       or h7_vsew[2:0]
       or h0_offset[20:0]
       or h3_offset[20:0]
       or h1_vlmul[1:0]
       or h3_vsew[2:0]
       or h1_vl[7:0]
       or h8_vl[7:0]
       or h8_vlmul[1:0]
       or h5_offset[20:0]
       or h8_vsew[2:0]
       or branch[7:0]
       or h2_vl[7:0]
       or h3_vl[7:0]
       or h5_vl[7:0]
       or h6_vsew[2:0]
       or h7_vlmul[1:0]
       or h5_vsew[2:0]
       or h6_offset[20:0]
       or h0_vld
       or h1_offset[20:0]
       or h8_offset[20:0]
       or h2_vlmul[1:0]
       or h3_vlmul[1:0]
       or h6_vlmul[1:0]
       or h7_offset[20:0]
       or h4_vsew[2:0]
       or h1_vsew[2:0])
begin
casez(branch[7:0])
  8'b1??????? : begin
                base_pc_branch[PC_WIDTH-2:0] = (h0_vld) 
                                             ? {h0_cur_pc[35:0],3'b111} 
                                             : {ip_vpc[PC_WIDTH-2:3],3'b000};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b000};
                offset_branch[20:0]          = (h0_vld)
                                             ? h0_offset[20:0] 
                                             : h1_offset[20:0];
                vlmul_branch[1:0]            = h1_vlmul[1:0];
                vsew_branch[2:0]             = h1_vsew[2:0];
                vl_branch[7:0]               = h1_vl[7:0];
                end
  8'b01?????? : begin
                base_pc_branch[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b001};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b001};
                offset_branch[20:0]          = h2_offset[20:0];
                vlmul_branch[1:0]            = h2_vlmul[1:0];
                vsew_branch[2:0]             = h2_vsew[2:0];
                vl_branch[7:0]               = h2_vl[7:0];
                end
  8'b001????? : begin
                base_pc_branch[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b010};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b010};
                offset_branch[20:0]          = h3_offset[20:0];
                vlmul_branch[1:0]            = h3_vlmul[1:0];
                vsew_branch[2:0]             = h3_vsew[2:0];
                vl_branch[7:0]               = h3_vl[7:0];
                end
  8'b0001???? : begin
                base_pc_branch[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b011};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b011};
                offset_branch[20:0]          = h4_offset[20:0];
                vlmul_branch[1:0]            = h4_vlmul[1:0];
                vsew_branch[2:0]             = h4_vsew[2:0];
                vl_branch[7:0]               = h4_vl[7:0];
                end
  8'b00001??? : begin
                base_pc_branch[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b100};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b100};
                offset_branch[20:0]          = h5_offset[20:0];
                vlmul_branch[1:0]            = h5_vlmul[1:0];
                vsew_branch[2:0]             = h5_vsew[2:0];
                vl_branch[7:0]               = h5_vl[7:0];
                end
  8'b000001?? : begin
                base_pc_branch[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b101};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b101};
                offset_branch[20:0]          = h6_offset[20:0];
                vlmul_branch[1:0]            = h6_vlmul[1:0];
                vsew_branch[2:0]             = h6_vsew[2:0];
                vl_branch[7:0]               = h6_vl[7:0];
                end
  8'b0000001? : begin
                base_pc_branch[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b110};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b110};
                offset_branch[20:0]          = h7_offset[20:0];
                vlmul_branch[1:0]            = h7_vlmul[1:0];
                vsew_branch[2:0]             = h7_vsew[2:0];
                vl_branch[7:0]               = h7_vl[7:0];
                end
  8'b00000001 : begin
                base_pc_branch[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b111};
                btb_index_pc[PC_WIDTH-2:0]   = {ip_vpc[PC_WIDTH-2:3],3'b111};
                offset_branch[20:0]          = h8_offset[20:0];
                vlmul_branch[1:0]            = h8_vlmul[1:0];
                vsew_branch[2:0]             = h8_vsew[2:0];
                vl_branch[7:0]               = h8_vl[7:0];
                end
  default     : begin
                base_pc_branch[PC_WIDTH-2:0] = {PC_WIDTH-1{1'b0}};
                btb_index_pc[PC_WIDTH-2:0]   = {PC_WIDTH-1{1'b0}};
                offset_branch[20:0]          = 21'b0;
                vlmul_branch[1:0]            = h8_vlmul[1:0];
                vsew_branch[2:0]             = h8_vsew[2:0];
                vl_branch[7:0]               = h8_vl[7:0];
                end              
endcase
// &CombEnd; @2426
end


//==========================================================
//              The first con_br Inst
//==========================================================
//The logic of finding the first con_br 
//According the location of first con_br
//generate the BTB Target/Tag/Base/offset infor
//which info will be used in ib stage for con_br
// &CombBeg; @2436
always @( h6_vl[7:0]
       or inst_32[7:3]
       or h4_vl[7:0]
       or h5_vlmul[1:0]
       or h2_offset[20:0]
       or h2_vsew[2:0]
       or h4_vlmul[1:0]
       or h0_cur_pc[35:0]
       or h7_vl[7:0]
       or ip_vpc[38:3]
       or inst_32[4:0]
       or h4_offset[20:0]
       or h7_vsew[2:0]
       or h0_offset[20:0]
       or h3_offset[20:0]
       or h1_vlmul[1:0]
       or h3_vsew[2:0]
       or inst_32[1:0]
       or h1_vl[7:0]
       or h8_vl[7:0]
       or h8_vlmul[1:0]
       or h5_offset[20:0]
       or con_br[7:0]
       or h8_vsew[2:0]
       or h2_vl[7:0]
       or h3_vl[7:0]
       or h5_vl[7:0]
       or h6_vsew[2:0]
       or h7_vlmul[1:0]
       or h5_vsew[2:0]
       or h6_offset[20:0]
       or h0_vld
       or h1_offset[20:0]
       or h8_offset[20:0]
       or h2_vlmul[1:0]
       or h3_vlmul[1:0]
       or h6_vlmul[1:0]
       or h7_offset[20:0]
       or h4_vsew[2:0]
       or h1_vsew[2:0])
begin
casez(con_br[7:0])
  8'b1??????? : begin
                base_pc_con_br[PC_WIDTH-2:0] = (h0_vld) 
                                             ? {h0_cur_pc[35:0],3'b111} 
                                             : {ip_vpc[PC_WIDTH-2:3],3'b000};
                offset_con_br[20:0]          = (h0_vld)
                                             ? h0_offset[20:0] 
                                             : h1_offset[20:0];
                inst_32_con_br               = (h0_vld)
                                             ? 1'b1
                                             : inst_32[7];
                con_br_vlmul[1:0]            = h1_vlmul[1:0];
                con_br_vsew[2:0]             = h1_vsew[2:0];
                con_br_vl[7:0]               = h1_vl[7:0];
                con_br_vmask[7:0]            = 8'b10000000;
                end
  8'b01?????? : begin
                base_pc_con_br[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b001};
                offset_con_br[20:0]          = h2_offset[20:0];
                inst_32_con_br               = inst_32[6];                       
                con_br_vlmul[1:0]            = h2_vlmul[1:0];
                con_br_vsew[2:0]             = h2_vsew[2:0];
                con_br_vl[7:0]               = h2_vl[7:0];
                con_br_vmask[7:0]            = 8'b11000000;
                end
  8'b001????? : begin
                base_pc_con_br[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b010};
                offset_con_br[20:0]          = h3_offset[20:0];
                inst_32_con_br               = inst_32[5];                       
                con_br_vlmul[1:0]            = h3_vlmul[1:0];
                con_br_vsew[2:0]             = h3_vsew[2:0];
                con_br_vl[7:0]               = h3_vl[7:0];
                con_br_vmask[7:0]            = 8'b11100000;
                end
  8'b0001???? : begin
                base_pc_con_br[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b011};
                offset_con_br[20:0]          = h4_offset[20:0];
                inst_32_con_br               = inst_32[4];                       
                con_br_vlmul[1:0]            = h4_vlmul[1:0];
                con_br_vsew[2:0]             = h4_vsew[2:0];
                con_br_vl[7:0]               = h4_vl[7:0];
                con_br_vmask[7:0]            = 8'b11110000;
                end
  8'b00001??? : begin
                base_pc_con_br[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b100};
                offset_con_br[20:0]          = h5_offset[20:0];
                inst_32_con_br               = inst_32[3];                       
                con_br_vlmul[1:0]            = h5_vlmul[1:0];
                con_br_vsew[2:0]             = h5_vsew[2:0];
                con_br_vl[7:0]               = h5_vl[7:0];
                con_br_vmask[7:0]            = 8'b11111000;
                end
  8'b000001?? : begin
                base_pc_con_br[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b101};
                offset_con_br[20:0]          = h6_offset[20:0];
                inst_32_con_br               = inst_32[2];                       
                con_br_vlmul[1:0]            = h6_vlmul[1:0];
                con_br_vsew[2:0]             = h6_vsew[2:0];
                con_br_vl[7:0]               = h6_vl[7:0];
                con_br_vmask[7:0]            = 8'b11111100;
                end
  8'b0000001? : begin
                base_pc_con_br[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b110};
                offset_con_br[20:0]          = h7_offset[20:0];
                inst_32_con_br               = inst_32[1];                       
                con_br_vlmul[1:0]            = h7_vlmul[1:0];
                con_br_vsew[2:0]             = h7_vsew[2:0];
                con_br_vl[7:0]               = h7_vl[7:0];
                con_br_vmask[7:0]            = 8'b11111110;
                end
  8'b00000001 : begin
                base_pc_con_br[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b111};
                offset_con_br[20:0]          = h8_offset[20:0];
                inst_32_con_br               = inst_32[0];                       
                con_br_vlmul[1:0]            = h8_vlmul[1:0];
                con_br_vsew[2:0]             = h8_vsew[2:0];
                con_br_vl[7:0]               = h8_vl[7:0];
                con_br_vmask[7:0]            = 8'b11111111;
                end
  default     : begin
                base_pc_con_br[PC_WIDTH-2:0] = {PC_WIDTH-1{1'b0}};
                offset_con_br[20:0]          = 21'b0;
                inst_32_con_br               = 1'b0;                       
                con_br_vlmul[1:0]            = 2'b0;
                con_br_vsew[2:0]             = 3'b0;
                con_br_vl[7:0]               = 8'b0;
                con_br_vmask[7:0]            = 8'b11111111;
                end
endcase
// &CombEnd; @2526
end

//==========================================================
//              The first chgflw Inst
//==========================================================
//The logic of finding the first chglfw 
//According the location of first chgflw
//generate the information for VMUL/VSEW maintanance
assign inst_chgflw[7:0] = branch[7:0] | chgflw[7:0]; 
// &CombBeg; @2535
always @( inst_chgflw[7:0]
       or h6_vl[7:0]
       or h4_vl[7:0]
       or h5_vlmul[1:0]
       or h2_vsew[2:0]
       or h4_vlmul[1:0]
       or h7_vl[7:0]
       or h7_vsew[2:0]
       or h1_vlmul[1:0]
       or h3_vsew[2:0]
       or h1_vl[7:0]
       or h8_vl[7:0]
       or h8_vlmul[1:0]
       or h8_vsew[2:0]
       or h2_vl[7:0]
       or h3_vl[7:0]
       or h5_vl[7:0]
       or h6_vsew[2:0]
       or h7_vlmul[1:0]
       or h5_vsew[2:0]
       or h2_vlmul[1:0]
       or h3_vlmul[1:0]
       or h6_vlmul[1:0]
       or h4_vsew[2:0]
       or h1_vsew[2:0])
begin
casez(inst_chgflw[7:0])
  8'b1??????? : begin
                inst_chgflw_vlmul[1:0] = h1_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h1_vsew[2:0];
                inst_chgflw_vl[7:0]    = h1_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b10000000;
                end
  8'b01?????? : begin
                inst_chgflw_vlmul[1:0] = h2_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h2_vsew[2:0];
                inst_chgflw_vl[7:0]    = h2_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11000000;
                end
  8'b001????? : begin
                inst_chgflw_vlmul[1:0] = h3_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h3_vsew[2:0];
                inst_chgflw_vl[7:0]    = h3_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11100000;
                end
  8'b0001???? : begin
                inst_chgflw_vlmul[1:0] = h4_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h4_vsew[2:0];
                inst_chgflw_vl[7:0]    = h4_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11110000;
                end
  8'b00001??? : begin
                inst_chgflw_vlmul[1:0] = h5_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h5_vsew[2:0];
                inst_chgflw_vl[7:0]    = h5_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11111000;
                end
  8'b000001?? : begin
                inst_chgflw_vlmul[1:0] = h6_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h6_vsew[2:0];
                inst_chgflw_vl[7:0]    = h6_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11111100;
                end
  8'b0000001? : begin
                inst_chgflw_vlmul[1:0] = h7_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h7_vsew[2:0];
                inst_chgflw_vl[7:0]    = h7_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11111110;
                end
  8'b00000001 : begin
                inst_chgflw_vlmul[1:0] = h8_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h8_vsew[2:0];
                inst_chgflw_vl[7:0]    = h8_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11111111;
                end
  default     : begin
                inst_chgflw_vlmul[1:0] = h8_vlmul[1:0];
                inst_chgflw_vsew[2:0]  = h8_vsew[2:0];
                inst_chgflw_vl[7:0]    = h8_vl[7:0];
                inst_chgflw_vmask[7:0] = 8'b11111111;
                end
endcase                
// &CombEnd; @2592
end


//==========================================================
//              The first ind_br Inst
//==========================================================
//The logic of finding the first ind_br 
//According the location of first ind_br
//generate offset infor which info will 
//be used in ib stage for ind_br
// &CombBeg; @2602
always @( h2_offset[20:0]
       or ind_br[7:0]
       or h4_offset[20:0]
       or h0_offset[20:0]
       or h3_offset[20:0]
       or h5_offset[20:0]
       or h6_offset[20:0]
       or h0_vld
       or h1_offset[20:0]
       or h8_offset[20:0]
       or h7_offset[20:0])
begin
casez(ind_br[7:0])
  8'b1??????? : offset_ind_br[20:0] = (h0_vld)
                                    ? h0_offset[20:0]
                                    : h1_offset[20:0];
  8'b01?????? : offset_ind_br[20:0] = h2_offset[20:0];
  8'b001????? : offset_ind_br[20:0] = h3_offset[20:0];
  8'b0001???? : offset_ind_br[20:0] = h4_offset[20:0];
  8'b00001??? : offset_ind_br[20:0] = h5_offset[20:0];
  8'b000001?? : offset_ind_br[20:0] = h6_offset[20:0];
  8'b0000001? : offset_ind_br[20:0] = h7_offset[20:0];
  8'b00000001 : offset_ind_br[20:0] = h8_offset[20:0];
  default     : offset_ind_br[20:0] = 21'b0;
endcase
// &CombEnd; @2616
end

//==========================================================
//              Half Word Number Generate
//==========================================================
//half_num_before_con_br[3:0]
//The number of half word before con_br
// &CombBeg; @2623
always @( con_br_after_head[7:0]
       or h0_vld)
begin
casez(con_br_after_head[7:0])
  8'b1??????? : half_num_before_con_br[3:0] = 4'b0000;
  8'b01?????? : half_num_before_con_br[3:0] = (h0_vld) ? 4'b0010 : 4'b0001;
  8'b001????? : half_num_before_con_br[3:0] = (h0_vld) ? 4'b0011 : 4'b0010;
  8'b0001???? : half_num_before_con_br[3:0] = (h0_vld) ? 4'b0100 : 4'b0011;
  8'b00001??? : half_num_before_con_br[3:0] = (h0_vld) ? 4'b0101 : 4'b0100;
  8'b000001?? : half_num_before_con_br[3:0] = (h0_vld) ? 4'b0110 : 4'b0101;
  8'b0000001? : half_num_before_con_br[3:0] = (h0_vld) ? 4'b0111 : 4'b0110;
  8'b00000001 : half_num_before_con_br[3:0] = (h0_vld) ? 4'b1000 : 4'b0111;
  default     : half_num_before_con_br[3:0] = 4'b0000;
endcase
// &CombEnd; @2635
end

assign half_7_num[3:0] = (inst_32_after_head[7]) 
                       ? ({4{ h0_vld}} & 4'b0010 | 
                          {4{~h0_vld}} & 4'b0010)
                       : ({4{ h0_vld}} & 4'b0010 | 
                          {4{~h0_vld}} & 4'b0001);
assign half_6_num[3:0] = (inst_32_after_head[6])
                       ? ({4{ h0_vld}} & 4'b0100 | 
                          {4{~h0_vld}} & 4'b0011) 
                       : ({4{ h0_vld}} & 4'b0011 | 
                          {4{~h0_vld}} & 4'b0010);
assign half_5_num[3:0] = (inst_32_after_head[5])
                       ? ({4{ h0_vld}} & 4'b0101 | 
                          {4{~h0_vld}} & 4'b0100) 
                       : ({4{ h0_vld}} & 4'b0100 | 
                          {4{~h0_vld}} & 4'b0011);
assign half_4_num[3:0] = (inst_32_after_head[4])
                       ? ({4{ h0_vld}} & 4'b0110 | 
                          {4{~h0_vld}} & 4'b0101) 
                       : ({4{ h0_vld}} & 4'b0101 | 
                          {4{~h0_vld}} & 4'b0100);
assign half_3_num[3:0] = (inst_32_after_head[3])
                       ? ({4{ h0_vld}} & 4'b0111 | 
                          {4{~h0_vld}} & 4'b0110) 
                       : ({4{ h0_vld}} & 4'b0110 | 
                          {4{~h0_vld}} & 4'b0101);
assign half_2_num[3:0] = (inst_32_after_head[2])
                       ? ({4{ h0_vld}} & 4'b1000 | 
                          {4{~h0_vld}} & 4'b0111) 
                       : ({4{ h0_vld}} & 4'b0111 | 
                          {4{~h0_vld}} & 4'b0110);
assign half_1_num[3:0] = (inst_32_after_head[1])
                       ? ({4{ h0_vld}} & 4'b1001 | 
                          {4{~h0_vld}} & 4'b1000) 
                       : ({4{ h0_vld}} & 4'b1000 | 
                          {4{~h0_vld}} & 4'b0111);
assign half_0_num[3:0] = (h0_vld)
                       ? 4'b1001  
                       : 4'b1000;


// &CombBeg; @2677
always @( half_0_num[3:0]
       or half_5_num[3:0]
       or half_4_num[3:0]
       or half_2_num[3:0]
       or half_1_num[3:0]
       or half_3_num[3:0]
       or chgflw_after_head[7:0]
       or half_6_num[3:0]
       or half_7_num[3:0])
begin
casez(chgflw_after_head[7:0])
  8'b1??????? : half_num_chgflw[3:0] = half_7_num[3:0];
  8'b01?????? : half_num_chgflw[3:0] = half_6_num[3:0];
  8'b001????? : half_num_chgflw[3:0] = half_5_num[3:0];
  8'b0001???? : half_num_chgflw[3:0] = half_4_num[3:0];
  8'b00001??? : half_num_chgflw[3:0] = half_3_num[3:0];
  8'b000001?? : half_num_chgflw[3:0] = half_2_num[3:0];
  8'b0000001? : half_num_chgflw[3:0] = half_1_num[3:0];
  8'b00000001 : half_num_chgflw[3:0] = half_0_num[3:0]; 
  default     : half_num_chgflw[3:0] = half_0_num[3:0];
endcase
// &CombEnd; @2689
end


// &CombBeg; @2692
always @( half_0_num[3:0]
       or con_br_after_head[7:0]
       or half_5_num[3:0]
       or half_4_num[3:0]
       or half_2_num[3:0]
       or half_1_num[3:0]
       or half_3_num[3:0]
       or half_6_num[3:0]
       or half_7_num[3:0])
begin
casez(con_br_after_head[7:0])
  8'b1??????? : half_num_con_br[3:0] = half_7_num[3:0];
  8'b01?????? : half_num_con_br[3:0] = half_6_num[3:0];
  8'b001????? : half_num_con_br[3:0] = half_5_num[3:0];
  8'b0001???? : half_num_con_br[3:0] = half_4_num[3:0];
  8'b00001??? : half_num_con_br[3:0] = half_3_num[3:0];
  8'b000001?? : half_num_con_br[3:0] = half_2_num[3:0];
  8'b0000001? : half_num_con_br[3:0] = half_1_num[3:0];
  8'b00000001 : half_num_con_br[3:0] = half_0_num[3:0]; 
  default     : half_num_con_br[3:0] = half_0_num[3:0];
endcase
// &CombEnd; @2704
end

//half_num_no_chgflw[3:0]
//Accord to the Hn_vld_after_head to get number of Half Word
//If there are not any chgflw inst
// &CombBeg; @2709
always @( hn_vld_after_head[7:0]
       or h0_vld)
begin
casez(hn_vld_after_head[7:0])
  8'b11111111 : half_num_no_chgflw[3:0] = (h0_vld) 
                                        ? 4'b1001 
                                        : 4'b1000;
  8'b11111110 : half_num_no_chgflw[3:0] = (h0_vld)
                                        ? 4'b1000
                                        : 4'b0111;
  8'b11111100 : half_num_no_chgflw[3:0] = (h0_vld)
                                        ? 4'b0111
                                        : 4'b0110;
  8'b11111000 : half_num_no_chgflw[3:0] = (h0_vld)
                                        ? 4'b0110
                                        : 4'b0101;
  8'b11110000 : half_num_no_chgflw[3:0] = (h0_vld)
                                        ? 4'b0101
                                        : 4'b0100;
  8'b11100000 : half_num_no_chgflw[3:0] = (h0_vld)
                                        ? 4'b0100
                                        : 4'b0011;
  8'b11000000 : half_num_no_chgflw[3:0] = (h0_vld)
                                        ? 4'b0011
                                        : 4'b0010;
  8'b10000000 : half_num_no_chgflw[3:0] = (h0_vld)
                                        ? 4'b0010  
                                        : 4'b0001;                                     
  default     : half_num_no_chgflw[3:0] = 4'b0000;
endcase
// &CombEnd; @2737
end

//==========================================================
//                    BTB Change flow data
//==========================================================
// &CombBeg; @2743
always @( ifdp_ipdp_btb_way0_target[19:0]
       or ifdp_ipdp_btb_way3_pred[1:0]
       or ifdp_ipdp_btb_way3_tag[9:0]
       or ifdp_ipdp_btb_way0_vld
       or ifdp_ipdp_btb_way1_pred[1:0]
       or branch[7:2]
       or ifdp_ipdp_btb_way2_pred[1:0]
       or ifdp_ipdp_btb_way3_vld
       or ip_vpc[19:0]
       or ifdp_ipdp_btb_way2_vld
       or ifdp_ipdp_btb_way2_target[19:0]
       or ifdp_ipdp_btb_way0_tag[9:0]
       or ifdp_ipdp_btb_way1_tag[9:0]
       or ifdp_ipdp_btb_way1_vld
       or ifdp_ipdp_btb_way1_target[19:0]
       or ifdp_ipdp_btb_way2_tag[9:0]
       or ifdp_ipdp_btb_way0_pred[1:0]
       or ifdp_ipdp_btb_way3_target[19:0])
begin
if(|branch[7:6])
begin
  btb_branch_way_vld      = ifdp_ipdp_btb_way0_vld;
  btb_branch_target[19:0] = (ifdp_ipdp_btb_way0_vld) 
                            ? ifdp_ipdp_btb_way0_target[19:0] 
                            : ip_vpc[19:0];
  btb_branch_tag[9:0]     = ifdp_ipdp_btb_way0_tag[9:0];
  btb_branch_pred[1:0]    = (ifdp_ipdp_btb_way0_vld)
                            ? ifdp_ipdp_btb_way0_pred[1:0]
                            : 2'b11;
end
else if(|branch[5:4])
begin
  btb_branch_way_vld      = ifdp_ipdp_btb_way1_vld;
  btb_branch_target[19:0] = (ifdp_ipdp_btb_way1_vld) 
                            ? ifdp_ipdp_btb_way1_target[19:0] 
                            : ip_vpc[19:0];
  btb_branch_tag[9:0]     = ifdp_ipdp_btb_way1_tag[9:0];
  btb_branch_pred[1:0]    = (ifdp_ipdp_btb_way1_vld)
                            ? ifdp_ipdp_btb_way1_pred[1:0]
                            : 2'b11;
end
else if(|branch[3:2])
begin
  btb_branch_way_vld      = ifdp_ipdp_btb_way2_vld;
  btb_branch_target[19:0] = (ifdp_ipdp_btb_way2_vld) 
                            ? ifdp_ipdp_btb_way2_target[19:0] 
                            : ip_vpc[19:0];
  btb_branch_tag[9:0]     = ifdp_ipdp_btb_way2_tag[9:0];
  btb_branch_pred[1:0]    = (ifdp_ipdp_btb_way2_vld)
                            ? ifdp_ipdp_btb_way2_pred[1:0]
                            : 2'b11;
end
else
begin
  btb_branch_way_vld      = ifdp_ipdp_btb_way3_vld;
  btb_branch_target[19:0] = (ifdp_ipdp_btb_way3_vld) 
                            ? ifdp_ipdp_btb_way3_target[19:0] 
                            : ip_vpc[19:0];
  btb_branch_tag[9:0]     = ifdp_ipdp_btb_way3_tag[9:0];
  btb_branch_pred[1:0]    = (ifdp_ipdp_btb_way3_vld)
                            ? ifdp_ipdp_btb_way3_pred[1:0]
                            : 2'b11;
end
// &CombEnd; @2788
end

//btb logic output interface signal
assign btb_branch_miss = !btb_branch_way_vld ||
                         (btb_branch_tag[9:0] != {btb_index_pc[19:13], btb_index_pc[2:0]}) || 
                         !cp0_ifu_btb_en;

//==========================================================
//                  Ras Update Logic
//==========================================================
assign ras_target_pc[PC_WIDTH-2:0]   = (ras_ipdp_data_vld)
                                       ? ras_ipdp_pc[PC_WIDTH-2:0]
                                       : ras_default_vpc[PC_WIDTH-2:0];
assign ras_default_vpc[PC_WIDTH-2:0] = (h0_vld)
                                       ? {h0_cur_pc[35:0],3'b111}
                                       : {ip_vpc[PC_WIDTH-2:3],pipe_h1_base[2:0]};
assign l0_btb_ras_pc_hit             = (ras_target_pc[PC_WIDTH-2:0] == ifdp_ipdp_l0_btb_target[PC_WIDTH-2:0]);
//ras push pc can be calculated at ip stage
assign pcall_vpc_mask[7:0]           = pcall[7:0] & ipctrl_ipdp_vpc_mask[7:0];
assign inst_32_vpc_mask[7:0]         = inst_32[7:0] & ipctrl_ipdp_vpc_mask[7:0];
assign ipdp_h1_next_pc[PC_WIDTH-2:0] = (h0_vld)
                                       ? {ip_vpc[PC_WIDTH-2:3],3'b001}
                                       : (inst_32_vpc_mask[7])
                                         ? {ip_vpc[PC_WIDTH-2:3],3'b010}
                                         : {ip_vpc[PC_WIDTH-2:3],3'b001};
assign ipdp_h2_next_pc[PC_WIDTH-2:0] = (inst_32_vpc_mask[6])
                                       ? {ip_vpc[PC_WIDTH-2:3],3'b011}
                                       : {ip_vpc[PC_WIDTH-2:3],3'b010};
assign ipdp_h3_next_pc[PC_WIDTH-2:0] = (inst_32_vpc_mask[5])
                                       ? {ip_vpc[PC_WIDTH-2:3],3'b100}
                                       : {ip_vpc[PC_WIDTH-2:3],3'b011};
assign ipdp_h4_next_pc[PC_WIDTH-2:0] = (inst_32_vpc_mask[4])
                                       ? {ip_vpc[PC_WIDTH-2:3],3'b101}
                                       : {ip_vpc[PC_WIDTH-2:3],3'b100};
assign ipdp_h5_next_pc[PC_WIDTH-2:0] = (inst_32_vpc_mask[3])
                                       ? {ip_vpc[PC_WIDTH-2:3],3'b110}
                                       : {ip_vpc[PC_WIDTH-2:3],3'b101};
assign ipdp_h6_next_pc[PC_WIDTH-2:0] = (inst_32_vpc_mask[2])
                                       ? {ip_vpc[PC_WIDTH-2:3],3'b111}
                                       : {ip_vpc[PC_WIDTH-2:3],3'b110};
assign ipdp_h7_next_pc[PC_WIDTH-2:0] = (inst_32_vpc_mask[1])
                                       ? ({ip_vpc[PC_WIDTH-2:3],3'b0} + 39'd8)
                                       : {ip_vpc[PC_WIDTH-2:3],3'b111};
assign ipdp_h8_next_pc[PC_WIDTH-2:0] = {ip_vpc[PC_WIDTH-2:3],3'b0} + 39'd8;

// &CombBeg; @2836
always @( ipdp_h4_next_pc[38:0]
       or ip_vpc[38:0]
       or ipdp_h5_next_pc[38:0]
       or ipdp_h3_next_pc[38:0]
       or ipdp_h1_next_pc[38:0]
       or ipdp_h2_next_pc[38:0]
       or ipdp_h7_next_pc[38:0]
       or ipdp_h6_next_pc[38:0]
       or ipdp_h8_next_pc[38:0]
       or pcall_vpc_mask[7:0])
begin
casez(pcall_vpc_mask[7:0])
  8'b1??????? : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h1_next_pc[PC_WIDTH-2:0];
  8'b01?????? : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h2_next_pc[PC_WIDTH-2:0];
  8'b001????? : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h3_next_pc[PC_WIDTH-2:0];
  8'b0001???? : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h4_next_pc[PC_WIDTH-2:0];
  8'b00001??? : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h5_next_pc[PC_WIDTH-2:0];
  8'b000001?? : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h6_next_pc[PC_WIDTH-2:0];
  8'b0000001? : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h7_next_pc[PC_WIDTH-2:0];
  8'b00000001 : ipdp_ras_push_pc[PC_WIDTH-2:0] = ipdp_h8_next_pc[PC_WIDTH-2:0];
  default     : ipdp_ras_push_pc[PC_WIDTH-2:0] = ip_vpc[PC_WIDTH-2:0];
endcase
// &CombEnd; @2848
end
assign ipdp_l0_btb_ras_pc[PC_WIDTH-2:0] = ipdp_ras_push_pc[PC_WIDTH-2:0];
assign ipdp_l0_btb_ras_push             = !ipctrl_ipdp_pipe_cancel
                                       && ipctrl_ipdp_ip_data_vld
                                       && (|pcall_vpc_mask[7:0]);

//==========================================================
//                  H0 Update Logic
//==========================================================
//H0 update under following rule:
//if higher chgflw flush or ip stage chgflw happens
//  h0_vld <= 0
//else if ipctrl_ipdp_pipe_stall
//  h0_vld <= h0_vld
//else if update valid
//  h0_vld <= h0_vld_pre
//else
//  h0_vld <= h0_vld
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    h0_vld     <= 1'b0;
    h0_vld_dup <= 1'b0;
  end
  else if(ipctrl_ipdp_pipe_cancel)
  begin
    h0_vld     <= 1'b0;
    h0_vld_dup <= 1'b0;
  end
  else if(ipctrl_ipdp_pipe_stall)
  begin
    h0_vld     <= h0_vld;
    h0_vld_dup <= h0_vld_dup;
  end
  else if(h0_update_vld && !ip_mmu_acc_deny) //when deny,h0 should not update
  begin
    h0_vld     <= h0_vld_pre;
    h0_vld_dup <= h0_vld_pre;
  end
  else
  begin
    h0_vld     <= h0_vld;
    h0_vld_dup <= h0_vld_dup;
  end
end

assign h0_update_vld    = ipctrl_ipdp_h0_update_vld;                        
assign h0_vld_pre       = (inst_32[0] && bry_data[0]) &&
                          !(|chgflw[7:1])             && 
                          !ipctrl_ipdp_ip_pcload      && 
                          !ipctrl_ipdp_br_more_than_one_stall;
assign ipdp_ipctrl_h0_vld = h0_vld_dup;

//--------------------H0 Data Record------------------------
//Gate Clk
// &Instance("gated_clk_cell","x_h0_updt_clk"); @2906
gated_clk_cell  x_h0_updt_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (h0_updt_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (h0_updt_clk_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @2907
//           .clk_out        (h0_updt_clk),//Out Clock @2908
//           .external_en    (1'b0), @2909
//           .global_en      (cp0_yy_clk_en), @2910
//           .local_en       (h0_updt_clk_en),//Local Condition @2911
//           .module_en      (cp0_ifu_icg_en) @2912
//         ); @2913
assign h0_updt_clk_en = ipctrl_ipdp_h0_updt_gateclk_en;
assign h0_con_br_pre  = (way0_hit) ? way0_con_br[0]  : way1_con_br[0];
assign h0_ab_br_pre   = (way0_hit) ? way0_ab_br[0]   : way1_ab_br[0];
assign h0_br_pre      = (way0_hit) ? way0_br[0]      : way1_br[0];
assign h0_dst_vld_pre = (way0_hit) ? way0_dst_vld[0] : way1_dst_vld[0];
assign h0_chgflw_pre  = (way0_hit) ? way0_chgflw[0]  : way1_chgflw[0];
assign h0_jal_pre     = (way0_hit) ? way0_jal[0]     : way1_jal[0];
assign h0_jalr_pre    = (way0_hit) ? way0_jalr[0]    : way1_jalr[0];
assign h0_auipc_pre   = (way0_hit) ? way0_auipc[0]   : way1_auipc[0];
assign h0_pc_oper_pre = (way0_hit) ? way0_pc_oper[0] : way1_pc_oper[0];
assign h0_bkpta_pre   = ifdp_ipdp_bkpta[0];
assign h0_bkptb_pre   = ifdp_ipdp_bkptb[0];
assign h0_no_spec_pre = (way0_hit) ? way0_no_spec : way1_no_spec; 
assign h0_vl_pred_pre = (way0_hit) ? way0_h0_vl_pred : way1_h0_vl_pred; 
assign h0_vl_pred_raw_pre = (way0_hit) ? way0_h0_vl_pred_raw : way1_h0_vl_pred_raw; 


always @(posedge h0_updt_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    h0_cur_pc[35:0] <= 36'b0;
    h0_data[15:0]   <= 16'b0;
    h0_con_br       <=  1'b0;
    h0_ab_br        <=  1'b0;
    h0_br           <=  1'b0;
    h0_dst_vld      <=  1'b0;
    h0_bkpta        <=  1'b0;
    h0_bkptb        <=  1'b0;
    h0_chgflw       <=  1'b0;
    h0_jal          <=  1'b0;
    h0_jalr         <=  1'b0;
    h0_auipc        <=  1'b0;
    h0_pc_oper      <=  1'b0;
    h0_no_spec      <=  1'b0;
    h0_vl_pred      <=  1'b0;
    h0_vl_pred_raw  <=  1'b0;
  end
  else if(h0_update_vld && !ipctrl_ipdp_pipe_stall)
  begin
    h0_cur_pc[35:0] <= ip_vpc[PC_WIDTH-2:3]; 
    h0_data[15:0]   <= h8_data[15:0];
    h0_con_br       <= h0_con_br_pre;
    h0_ab_br        <= h0_ab_br_pre;
    h0_br           <= h0_br_pre;
    h0_dst_vld      <= h0_dst_vld_pre;
    h0_bkpta        <= h0_bkpta_pre;
    h0_bkptb        <= h0_bkptb_pre;
    h0_chgflw       <= h0_chgflw_pre;
    h0_jal          <= h0_jal_pre;
    h0_jalr         <= h0_jalr_pre;
    h0_auipc        <= h0_auipc_pre;
    h0_pc_oper      <= h0_pc_oper_pre;
    h0_no_spec      <= h0_no_spec_pre;
    h0_vl_pred      <= h0_vl_pred_pre;
    h0_vl_pred_raw  <= h0_vl_pred_raw_pre;
  end
  else
  begin
    h0_cur_pc[35:0] <= h0_cur_pc[35:0];
    h0_data[15:0]   <= h0_data[15:0];
    h0_con_br       <= h0_con_br;
    h0_ab_br        <= h0_ab_br;
    h0_br           <= h0_br;
    h0_dst_vld      <= h0_dst_vld;
    h0_bkpta        <= h0_bkpta;
    h0_bkptb        <= h0_bkptb;
    h0_chgflw       <= h0_chgflw;
    h0_jal          <= h0_jal;
    h0_jalr         <= h0_jalr;
    h0_auipc        <= h0_auipc;
    h0_pc_oper      <= h0_pc_oper;
    h0_no_spec      <= h0_no_spec;
    h0_vl_pred      <= h0_vl_pred;
    h0_vl_pred_raw  <= h0_vl_pred_raw;
  end
end    


assign ip_expt = ip_acc_err || 
                 ip_mmu_acc_deny || 
                 ip_mmu_pgflt; 
assign ipdp_ipctrl_ip_expt_vld = ip_mmu_acc_deny;
assign ipdp_ipctrl_h0_br       = h0_vld && h0_br;
assign ipdp_ipctrl_h0_ab_br    = h0_vld && h0_ab_br;
assign ipdp_ipctrl_h0_con_br   = h0_vld && h0_con_br;
assign ipdp_ipctrl_h8_br       = h0_vld_pre && (h0_con_br_pre|| h0_ab_br_pre); 

//==========================================================
//                Interface with ipctrl
//==========================================================
//l0 btb logic
assign l0_btb_way0_hit     = ifdp_ipdp_btb_way0_vld 
                          && ifdp_ipdp_l0_btb_way0_high_hit 
                          && ifdp_ipdp_l0_btb_way0_low_hit
                          && (ifdp_ipdp_l0_btb_way_pred[1:0] == ifdp_ipdp_btb_way0_pred[1:0]);
assign l0_btb_way1_hit     = ifdp_ipdp_btb_way1_vld
                          && ifdp_ipdp_l0_btb_way1_high_hit 
                          && ifdp_ipdp_l0_btb_way1_low_hit
                          && (ifdp_ipdp_l0_btb_way_pred[1:0] == ifdp_ipdp_btb_way1_pred[1:0]);
assign l0_btb_way2_hit     = ifdp_ipdp_btb_way2_vld 
                          && ifdp_ipdp_l0_btb_way2_high_hit 
                          && ifdp_ipdp_l0_btb_way2_low_hit
                          && (ifdp_ipdp_l0_btb_way_pred[1:0] == ifdp_ipdp_btb_way2_pred[1:0]);
assign l0_btb_way3_hit     = ifdp_ipdp_btb_way3_vld
                          && ifdp_ipdp_l0_btb_way3_high_hit 
                          && ifdp_ipdp_l0_btb_way3_low_hit
                          && (ifdp_ipdp_l0_btb_way_pred[1:0] == ifdp_ipdp_btb_way3_pred[1:0]);
assign l0_btb_hit_l1_btb   = ipctrl_ipdp_l0_btb_hit;

//assign ipdp_ipctrl_l0_btb_hit              = l0_btb_hit_l1_btb;
assign ipdp_ipctrl_l0_btb_hit_way[3:0]             = {l0_btb_way3_hit,l0_btb_way2_hit,
                                                      l0_btb_way1_hit,l0_btb_way0_hit};
assign ipdp_ipctrl_l0_btb_vld                      = ifdp_ipdp_l0_btb_hit;
assign ipdp_ipctrl_l0_btb_ras                      = ifdp_ipdp_l0_btb_ras;
assign ipdp_ipctrl_l0_btb_mispred_pc[PC_WIDTH-2:0] = ifdp_ipdp_l0_btb_mispred_pc[PC_WIDTH-2:0];

//Part of interface with ipctrl
assign ipdp_ipctrl_btb_way0_target[19:0] = (ifdp_ipdp_btb_way0_vld)
                                          ? ifdp_ipdp_btb_way0_target[19:0]
                                          : ip_vpc[19: 0];
assign ipdp_ipctrl_btb_way1_target[19:0] = (ifdp_ipdp_btb_way1_vld)
                                          ? ifdp_ipdp_btb_way1_target[19:0]
                                          : ip_vpc[19: 0];
assign ipdp_ipctrl_btb_way2_target[19:0] = (ifdp_ipdp_btb_way2_vld)
                                          ? ifdp_ipdp_btb_way2_target[19:0]
                                          : ip_vpc[19: 0];
assign ipdp_ipctrl_btb_way3_target[19:0] = (ifdp_ipdp_btb_way3_vld)
                                          ? ifdp_ipdp_btb_way3_target[19:0]
                                          : ip_vpc[19: 0];
assign ipdp_ipctrl_btb_way0_pred[1:0]    = (ifdp_ipdp_btb_way0_vld)
                                          ? ifdp_ipdp_btb_way0_pred[1:0]
                                          : 2'b11;
assign ipdp_ipctrl_btb_way1_pred[1:0]    = (ifdp_ipdp_btb_way1_vld)
                                          ? ifdp_ipdp_btb_way1_pred[1:0]
                                          : 2'b11;
assign ipdp_ipctrl_btb_way2_pred[1:0]    = (ifdp_ipdp_btb_way2_vld)
                                          ? ifdp_ipdp_btb_way2_pred[1:0]
                                          : 2'b11;
assign ipdp_ipctrl_btb_way3_pred[1:0]    = (ifdp_ipdp_btb_way3_vld)
                                          ? ifdp_ipdp_btb_way3_pred[1:0]
                                          : 2'b11;


//if h0_vld, h1 must be inst_16
assign ipdp_ipctrl_inst_32[7:0] = inst_32_pre[7:0] & {(~h0_vld), 7'b1111111};

//==========================================================
//                Interface with BTB
//==========================================================
assign ipdp_btb_index_pc[PC_WIDTH-2:0]  = btb_index_pc[PC_WIDTH-2:0];
assign ipdp_btb_target_pc[19:0]         = btb_branch_target[19:0];

//==========================================================
//                Interface with L0 BTB
//==========================================================
//up date L0 btb entry
//1. bht predict as weak taken,it may cause next branch not taken
//2. l0 btb hit,but counter is zero,we should count up to 1
//3. if chgflw valid,but ip doesn't chgflw
assign l0_btb_not_saturate = ipctrl_ipdp_if_pcload
                          && l0_btb_hit_l1_btb
                          && ipctrl_ipdp_ip_pcload
                          && !ifdp_ipdp_l0_btb_ras
                          && ipctrl_ipdp_con_br 
                          && (bht_pre_result[1:0] == 2'b10);
assign l0_btb_counter_zero = ifdp_ipdp_l0_btb_hit
                          && !ifdp_ipdp_l0_btb_counter
                          && l0_btb_hit_l1_btb
                          && !ifdp_ipdp_l0_btb_ras
                          && ipctrl_ipdp_ip_pcload
                          && ipctrl_ipdp_con_br
                          && (bht_pre_result[1:0] == 2'b11);
assign l0_btb_mistaken     = ipctrl_ipdp_ip_mistaken;


assign l0_btb_update_vld    = ipctrl_ipdp_ip_data_vld
                           && (l0_btb_not_saturate
                               || l0_btb_mistaken
                               || l0_btb_counter_zero);
assign l0_btb_wen[3]        = ipctrl_ipdp_ip_data_vld
                           && (l0_btb_not_saturate
                              || l0_btb_mistaken);
assign l0_btb_wen[2]        = ipctrl_ipdp_ip_data_vld && l0_btb_counter_zero;
assign l0_btb_wen[1]        = 1'b0;
assign l0_btb_wen[0]        = 1'b0;

assign l0_btb_update_vld_bit    = l0_btb_counter_zero;
assign l0_btb_update_cnt_bit    = l0_btb_counter_zero;


//==========================================================
//                Interface with IND_BTB
//==========================================================
assign ipdp_ind_btb_jmp_detect = |(ind_br[7:0]) &&
                                 ipctrl_ipdp_ip_data_vld; 
//==========================================================
//                 Infor send to IBDP
//==========================================================
//Control Signal
assign pipe_stall           = ipctrl_ipdp_pipe_stall;
assign pipe_vld             = ipctrl_ipdp_pipe_vld;
assign pipe_vld_for_gateclk = ipctrl_ipdp_pipe_vld_for_gateclk;
//pipe_hn_infor
assign pipe_chgflw_mask[7:0]     = (rtu_yy_xx_dbgon) ? 8'hc0                : chgflw_mask[7:0];
assign pipe_chgflw_vlmul[1:0]    = (rtu_yy_xx_dbgon) ? 2'b0                 : chgflw_vlmul[1:0];
assign pipe_chgflw_vsew[2:0]     = (rtu_yy_xx_dbgon) ? 3'b0                 : chgflw_vsew[2:0];
assign pipe_chgflw_vl[7:0]       = (rtu_yy_xx_dbgon) ? 8'b0                 : chgflw_vl[7:0];
assign pipe_hn_vld[7:0]          = (rtu_yy_xx_dbgon) ? ip_had_vld[7:0]      : ip_hn_vld[7:0];
assign pipe_hn_chgflw[7:0]       = (rtu_yy_xx_dbgon) ? ip_had_chgflw[7:0]   : ip_chgflw[7:0];
assign pipe_hn_con_br[7:0]       = (rtu_yy_xx_dbgon) ? ip_had_con_br[7:0]   : ip_con_br[7:0];
assign pipe_hn_ab_br[7:0]        = (rtu_yy_xx_dbgon) ? ip_had_ab_br[7:0 ]   : ip_ab_br[7:0];
assign pipe_hn_auipc[7:0]        = (rtu_yy_xx_dbgon) ? ip_had_auipc[7:0]    : ip_auipc[7:0];
assign pipe_hn_ind_br[7:0]       = (rtu_yy_xx_dbgon) ? ip_had_ind_br[7:0]   : ip_ind_br[7:0];
assign pipe_hn_jal[7:0]          = (rtu_yy_xx_dbgon) ? ip_had_jal[7:0]      : ip_jal[7:0];
assign pipe_hn_jalr[7:0]         = (rtu_yy_xx_dbgon) ? ip_had_jalr[7:0]     : ip_jalr[7:0];
assign pipe_hn_no_spec[7:0]      = (rtu_yy_xx_dbgon) ? ip_had_no_spec[7:0]  : ip_no_spec[7:0];
assign pipe_hn_vl_pred[7:0]      = (rtu_yy_xx_dbgon) ? ip_had_vl_pred[7:0]  : ip_vl_pred[7:0];
assign pipe_hn_32_start[7:0]     = (rtu_yy_xx_dbgon) ? ip_had_bry_data[7:0] & ip_had_inst_32[7:0]
                                                     : ip_bry_data[7:0]     & ip_inst_32[7:0];
assign pipe_hn_pc_oper[7:0]      = (rtu_yy_xx_dbgon) ? ip_had_pc_oper[7:0]  : ip_pc_oper[7:0];
assign pipe_hn_ldst[7:0]         = (rtu_yy_xx_dbgon) ? ip_had_inst_ldst[7:0]: ip_inst_ldst[7:0];
assign pipe_hn_dst_vld[7:0]      = (rtu_yy_xx_dbgon) ? ip_had_dst_vld[7:0]  : ip_dst_vld[7:0];
assign pipe_hn_pcall[7:0]        = (rtu_yy_xx_dbgon) ? ip_had_pcall[7:0]    : ip_pcall[7:0];
assign pipe_hn_preturn[7:0]      = (rtu_yy_xx_dbgon) ? ip_had_preturn[7:0]  : ip_preturn[7:0];
assign pipe_hn_acc_err           = (rtu_yy_xx_dbgon) ? 1'b0                 : ip_acc_err;
assign pipe_hn_mmu_acc_deny      = (rtu_yy_xx_dbgon) ? 1'b0                 : ip_mmu_acc_deny;
assign pipe_hn_pgflt             = (rtu_yy_xx_dbgon) ? 1'b0                 : ip_mmu_pgflt;
assign pipe_hn_split1[7:0]       = (rtu_yy_xx_dbgon) ? ip_had_split1[7:0]   : ip_split1[7:0];
assign pipe_hn_split0[7:0]       = (rtu_yy_xx_dbgon) ? ip_had_split0[7:0]   : ip_split0[7:0];
assign pipe_hn_fence[7:0]        = (rtu_yy_xx_dbgon) ? ip_had_fence[7:0]    : ip_fence[7:0];
assign pipe_hn_bkpta[7:0]        = (rtu_yy_xx_dbgon) ? ip_had_bkpta[7:0]    : ip_bkpta[7:0];
assign pipe_hn_bkptb[7:0]        = (rtu_yy_xx_dbgon) ? ip_had_bkptb[7:0]    : ip_bkptb[7:0];
assign pipe_hn_vsetvli[7:0]      = (rtu_yy_xx_dbgon) ? ip_had_vsetvli[7:0]  : ip_vsetvli[7:0];
//for gateclk of ibuf spe data 
assign pipe_hn_bkpta_vld         = |ip_bkpta[7:0];
assign pipe_hn_bkptb_vld         = |ip_bkptb[7:0];
assign pipe_hn_no_spec_vld       = |ip_no_spec[7:0];


//pipe_hn_data
assign pipe_h1_data[15:0] = (rtu_yy_xx_dbgon) ? had_ifu_ir[15:0]  : ip_h1_data[15:0];
assign pipe_h2_data[15:0] = (rtu_yy_xx_dbgon) ? had_ifu_ir[31:16] : ip_h2_data[15:0];
assign pipe_h3_data[15:0] = ip_h3_data[15:0];
assign pipe_h4_data[15:0] = ip_h4_data[15:0];
assign pipe_h5_data[15:0] = ip_h5_data[15:0];
assign pipe_h6_data[15:0] = ip_h6_data[15:0];
assign pipe_h7_data[15:0] = ip_h7_data[15:0];
assign pipe_h8_data[15:0] = ip_h8_data[15:0];

//pipe_hn_base & ip_vpc
assign pipe_vpc[PC_WIDTH-2:0] = ip_vpc[PC_WIDTH-2:0];
//assign pipe_next_vpc[30:0] = {(ip_vpc[30:3] + 28'b1), 3'b0};
assign pipe_h1_base[2:0]  = h1_base_after_head[2:0];
assign pipe_h2_base[2:0]  = h2_base_after_head[2:0];
assign pipe_h3_base[2:0]  = h3_base_after_head[2:0];
assign pipe_h4_base[2:0]  = h4_base_after_head[2:0];
assign pipe_h5_base[2:0]  = h5_base_after_head[2:0];
assign pipe_h6_base[2:0]  = h6_base_after_head[2:0];
assign pipe_h7_base[2:0]  = h7_base_after_head[2:0];
assign pipe_h8_base[2:0]  = h8_base_after_head[2:0];

//pipe vlmul
assign pipe_h1_vlmul[1:0] = (rtu_yy_xx_dbgon) 
                          ? (had_vsetvli)
                            ? had_vlmul[1:0]
                            : vlmul_reg[1:0]
                          : h1_vlmul_after_head[1:0]; 
assign pipe_h2_vlmul[1:0] = h2_vlmul_after_head[1:0]; 
assign pipe_h3_vlmul[1:0] = h3_vlmul_after_head[1:0]; 
assign pipe_h4_vlmul[1:0] = h4_vlmul_after_head[1:0]; 
assign pipe_h5_vlmul[1:0] = h5_vlmul_after_head[1:0]; 
assign pipe_h6_vlmul[1:0] = h6_vlmul_after_head[1:0]; 
assign pipe_h7_vlmul[1:0] = h7_vlmul_after_head[1:0]; 
assign pipe_h8_vlmul[1:0] = h8_vlmul_after_head[1:0]; 

//pipe vsew
assign pipe_h1_vsew[2:0] = (rtu_yy_xx_dbgon) 
                         ? (had_vsetvli)
                           ? had_vsew[2:0]
                           : vsew_reg[2:0]
                         : h1_vsew_after_head[2:0]; 
assign pipe_h2_vsew[2:0] = h2_vsew_after_head[2:0]; 
assign pipe_h3_vsew[2:0] = h3_vsew_after_head[2:0]; 
assign pipe_h4_vsew[2:0] = h4_vsew_after_head[2:0]; 
assign pipe_h5_vsew[2:0] = h5_vsew_after_head[2:0]; 
assign pipe_h6_vsew[2:0] = h6_vsew_after_head[2:0]; 
assign pipe_h7_vsew[2:0] = h7_vsew_after_head[2:0]; 
assign pipe_h8_vsew[2:0] = h8_vsew_after_head[2:0]; 


//pipe vl
assign pipe_h1_vl[7:0] = (rtu_yy_xx_dbgon) 
                         ? (had_vsetvli)
                           ? had_vlmax[7:0]
                           : vl_reg[7:0]
                         : h1_vl_after_head[7:0]; 
assign pipe_h2_vl[7:0] = h2_vl_after_head[7:0]; 
assign pipe_h3_vl[7:0] = h3_vl_after_head[7:0]; 
assign pipe_h4_vl[7:0] = h4_vl_after_head[7:0]; 
assign pipe_h5_vl[7:0] = h5_vl_after_head[7:0]; 
assign pipe_h6_vl[7:0] = h6_vl_after_head[7:0]; 
assign pipe_h7_vl[7:0] = h7_vl_after_head[7:0]; 
assign pipe_h8_vl[7:0] = h8_vl_after_head[7:0]; 

//pipe split0 type
assign pipe_h1_split0_type[2:0] = (rtu_yy_xx_dbgon) 
                                ? had_split0_type[2:0]
                                : h1_split0_type_after_head[2:0]; 
assign pipe_h2_split0_type[2:0] = h2_split0_type_after_head[2:0]; 
assign pipe_h3_split0_type[2:0] = h3_split0_type_after_head[2:0]; 
assign pipe_h4_split0_type[2:0] = h4_split0_type_after_head[2:0]; 
assign pipe_h5_split0_type[2:0] = h5_split0_type_after_head[2:0]; 
assign pipe_h6_split0_type[2:0] = h6_split0_type_after_head[2:0]; 
assign pipe_h7_split0_type[2:0] = h7_split0_type_after_head[2:0]; 
assign pipe_h8_split0_type[2:0] = h8_split0_type_after_head[2:0]; 

assign pipe_h1_split1_type[2:0] = (rtu_yy_xx_dbgon) 
                                ? had_split1_type[2:0]
                                : h1_split1_type_after_head[2:0]; 
assign pipe_h2_split1_type[2:0] = h2_split1_type_after_head[2:0]; 
assign pipe_h3_split1_type[2:0] = h3_split1_type_after_head[2:0]; 
assign pipe_h4_split1_type[2:0] = h4_split1_type_after_head[2:0]; 
assign pipe_h5_split1_type[2:0] = h5_split1_type_after_head[2:0]; 
assign pipe_h6_split1_type[2:0] = h6_split1_type_after_head[2:0]; 
assign pipe_h7_split1_type[2:0] = h7_split1_type_after_head[2:0]; 
assign pipe_h8_split1_type[2:0] = h8_split1_type_after_head[2:0]; 

//pipe_branch infor
assign pipe_bht_result                  = bht_result;
assign pipe_bht_pre_result[1:0]         = bht_pre_result[1:0];
assign pipe_bht_sel_result[1:0]         = bht_sel_result[1:0];
assign pipe_con_br_inst_32              = inst_32_con_br;
assign pipe_con_br_half_num[3:0]        = half_num_before_con_br[3:0];
assign pipe_con_br_offset[20:0]         = offset_con_br[20:0];
assign pipe_con_br_cur_pc[PC_WIDTH-2:0] = base_pc_con_br[PC_WIDTH-2:0];

//pipe_ras_infor
assign pipe_ras_target_pc[PC_WIDTH-2:0] = ras_target_pc[PC_WIDTH-2:0];
assign pipe_ras_push_pc[PC_WIDTH-2:0]   = ipdp_ras_push_pc[PC_WIDTH-2:0];
//pipe_ind_br infor
assign pipe_ind_br_offset[20:0] = offset_ind_br[20:0];

//pipe_half_number
assign pipe_con_br_num_vld     = (con_br_first_branch && bht_result || 
                                  more_than_one_br_vld) && !ip_expt;
assign pipe_chgflw_num_vld     = (|chgflw_after_head[7:0]) && !ip_expt;
assign pipe_con_br_num[3:0]    = half_num_con_br[3:0];
assign pipe_chgflw_num[3:0]    = half_num_chgflw[3:0];
assign pipe_no_chgflw_num[3:0] = (ip_expt) 
                                 ? half_num_expt[3:0] 
                                 : half_num_no_chgflw[3:0];
assign half_num_expt[3:0]      = (h0_vld)
                               ? 4'b0010
                               : 4'b0001;

//pipe_h0_infor
assign pipe_h0_cur_pc[35:0]     = h0_cur_pc[35:0];
assign pipe_h0_data[15:0]       = h0_data[15:0];
assign pipe_h0_vld              = h0_vld && !rtu_yy_xx_dbgon;
assign pipe_h0_ldst             = h0_ld || h0_st;
assign pipe_h0_split1           = h0_split1;
assign pipe_h0_split0           = h0_split0;
assign pipe_h0_fence            = h0_fence;
assign pipe_h0_bkpta            = h0_bkpta;
assign pipe_h0_bkptb            = h0_bkptb;
assign pipe_h0_no_spec          = h0_no_spec;
assign pipe_h0_vl_pred          = h0_vl_pred_raw;
assign pipe_h0_high_expt        = ip_expt && h0_vld;
assign pipe_h0_vlmul[1:0]       = h0_vlmul[1:0];
assign pipe_h0_vsew[2:0]        = h0_vsew[2:0];
assign pipe_h0_vl[7:0]          = h0_vl[7:0];
assign pipe_h0_con_br           = h0_con_br;
assign pipe_h0_vsetvli          = h0_vsetvli;
assign pipe_h0_split0_type[2:0] = h0_split0_type[2:0];
assign pipe_h0_split1_type[2:0] = h0_split1_type[2:0];
assign pipe_h0_spe_vld          = h0_vld && (ip_expt ||h0_bkptb || h0_bkpta || h0_no_spec || h0_vl_pred_raw);

//branch BTB infor
assign pipe_branch_base[PC_WIDTH-2:0]   = base_pc_branch[PC_WIDTH-2:0];
assign pipe_btb_index_pc[PC_WIDTH-2:0]  = btb_index_pc[PC_WIDTH-2:0];
assign pipe_branch_offset[20:0]         = offset_branch[20:0];
assign pipe_branch_result[PC_WIDTH-2:0] = ipctrl_ipdp_chgflw_pc[PC_WIDTH-2:0];
assign pipe_vghr[21:0]                  = bht_ipdp_vghr[21:0];
assign pipe_branch_vlmul[1:0]           = vlmul_branch[1:0];
assign pipe_branch_vsew[2:0]            = vsew_branch[2:0];
assign pipe_branch_vl[7:0]              = vl_branch[7:0];
assign pipe_branch_btb_miss        = btb_branch_miss;
assign pipe_branch_way_pred[1:0]   = btb_branch_pred[1:0]; 
assign pipe_l0_btb_ras             = ifdp_ipdp_l0_btb_ras;
assign pipe_l0_btb_hit             = ifdp_ipdp_l0_btb_hit;
assign pipe_l0_btb_entry_hit[15:0] = ifdp_ipdp_l0_btb_entry_hit[15:0]; 
assign pipe_l0_btb_ras_pc_hit      = l0_btb_ras_pc_hit;
assign pipe_l0_btb_mispred_pc[PC_WIDTH-2:0] = (more_than_one_br_vld)
                                            ? {ip_vpc[PC_WIDTH-2:3],ipctrl_ipdp_vpc_next[2:0]}
                                            : (h0_vld_pre && h0_update_vld)
                                              ? {ip_vpc[PC_WIDTH-2:3],3'b111}
                                              : ifdp_ipdp_l0_btb_mispred_pc[PC_WIDTH-2:0];
assign pipe_l0_btb_update_vld      = l0_btb_update_vld;
assign pipe_l0_btb_wen[3:0]        = l0_btb_wen[3:0];
assign pipe_l0_btb_update_vld_bit  = l0_btb_update_vld_bit;
assign pipe_l0_btb_update_cnt_bit  = l0_btb_update_cnt_bit;

//----------------ip_ib register pipedown-------------------
//Gate Clk
// &Instance("gated_clk_cell","x_ip_ib_pipe_clk"); @3341
gated_clk_cell  x_ip_ib_pipe_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ip_ib_pipe_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ip_ib_pipe_clk_en ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @3342
//           .clk_out        (ip_ib_pipe_clk),//Out Clock @3343
//           .external_en    (1'b0), @3344
//           .global_en      (cp0_yy_clk_en), @3345
//           .local_en       (ip_ib_pipe_clk_en),//Local Condition @3346
//           .module_en      (cp0_ifu_icg_en) @3347
//         ); @3348
assign ip_ib_pipe_clk_en = pipe_vld_for_gateclk && 
                           !pipe_stall          ||
                           had_ifu_ir_vld;
                

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_chgflw_mask[7:0]                <= 8'b0;
    ipdp_ibdp_chgflw_vlmul[1:0]               <= 2'b0;
    ipdp_ibdp_chgflw_vsew[2:0]                <= 3'b0;
    ipdp_ibdp_chgflw_vl[7:0]                  <= 8'b0;
    ipdp_ibdp_hn_vld[7:0]                     <= 8'b0;
    ipdp_ibdp_h0_vld                          <= 1'b0;
    ipdp_ibdp_hn_con_br[7:0]                  <= 8'b0;
    ipdp_ibdp_hn_ab_br[7:0]                   <= 8'b0;
    ipdp_ibdp_hn_ind_br[7:0]                  <= 8'b0;
    ipdp_ibdp_hn_jal[7:0]                     <= 8'b0;
    ipdp_ibdp_hn_jalr[7:0]                    <= 8'b0;
    ipdp_ibdp_hn_no_spec[7:0]                 <= 8'b0;
    ipdp_ibdp_hn_vl_pred[7:0]                 <= 8'b0;
    ipdp_ibdp_hn_32_start[7:0]                <= 8'b0;
    ipdp_ibdp_hn_pc_oper[7:0]                 <= 8'b0;
    ipdp_ibdp_hn_ldst[7:0]                    <= 8'b0;
    ipdp_ibdp_hn_dst_vld[7:0]                 <= 8'b0;
    ipdp_ibdp_hn_pcall[7:0]                   <= 8'b0;
    ipdp_ibdp_hn_preturn[7:0]                 <= 8'b0; 
    ipdp_ibdp_hn_acc_err                      <= 1'b0;
    ipdp_ibdp_hn_mmu_acc_deny                 <= 1'b0;
    ipdp_ibdp_hn_pgflt                        <= 1'b0;
    ipdp_ibdp_hn_split1[7:0]                  <= 8'b0;
    ipdp_ibdp_hn_split0[7:0]                  <= 8'b0;
    ipdp_ibdp_hn_fence[7:0]                   <= 8'b0;
    ipdp_ibdp_hn_bkpta[7:0]                   <= 8'b0;
    ipdp_ibdp_hn_bkptb[7:0]                   <= 8'b0;
    ipdp_ibdp_hn_vsetvli[7:0]                 <= 8'b0;
    ipdp_ibdp_hn_bkpta_vld                    <= 1'b0;
    ipdp_ibdp_hn_bkptb_vld                    <= 1'b0;
    ipdp_ibdp_hn_no_spec_vld                  <= 1'b0;
    ipdp_ibdp_vpc[PC_WIDTH-2:0]               <= {PC_WIDTH-1{1'b0}};
    ipdp_ibdp_bht_result                      <= 1'b0;
    ipdp_ibdp_bht_pre_result[1:0]             <= 2'b0;
    ipdp_ibdp_bht_sel_result[1:0]             <= 2'b0;
    ipdp_ibdp_con_br_num_vld                  <= 1'b0;
    ipdp_ibdp_con_br_num[3:0]                 <= 4'b0;
    ipdp_ibdp_chgflw_num_vld                  <= 1'b0;
    ipdp_ibdp_chgflw_num[3:0]                 <= 4'b0;
    ipdp_ibdp_no_chgflw_num[3:0]              <= 4'b0;
    ipdp_ibdp_branch_base[PC_WIDTH-2:0]       <= {PC_WIDTH-1{1'b0}};
    ipdp_ibdp_branch_offset[20:0]             <= 21'b0;
    ipdp_ibdp_branch_result[PC_WIDTH-2:0]     <= {PC_WIDTH-1{1'b0}};
    ipdp_ibdp_branch_vlmul[1:0]               <= 2'b0;
    ipdp_ibdp_branch_vsew[2:0]                <= 3'b0;
    ipdp_ibdp_branch_vl[7:0]                  <= 8'b0;
    ipdp_ibdp_branch_way_pred[1:0]            <= 2'b0;
    ipdp_ibdp_branch_btb_miss                 <= 1'b0;
    ipdp_ibdp_l0_btb_ras                      <= 1'b0;
    ipdp_ibdp_l0_btb_hit                      <= 1'b0;
    ipdp_ibdp_l0_btb_ras_pc_hit               <= 1'b0;
    ipdp_ibdp_l0_btb_entry_hit[15:0]          <= 16'b0;
    ipdp_ibdp_l0_btb_mispred_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    ipdp_ibdp_l0_btb_update_vld               <= 1'b0;
    ipdp_ibdp_l0_btb_wen[3:0]                 <= 4'b0;
    ipdp_ibdp_l0_btb_update_vld_bit           <= 1'b0;
    ipdp_ibdp_l0_btb_update_cnt_bit           <= 1'b0;
    ipdp_ibdp_ras_target_pc[PC_WIDTH-2:0]     <= {PC_WIDTH-1{1'b0}};    
    ipdp_ibdp_ras_push_pc[PC_WIDTH-2:0]       <= {PC_WIDTH-1{1'b0}};    
    ipdp_ibdp_ind_br_offset[20:0]             <= 21'b0;
    ipdp_ibdp_vghr[21:0]                      <= 22'b0;
    ipdp_ibdp_btb_index_pc[PC_WIDTH-2:0]      <= {PC_WIDTH-1{1'b0}};
  end
  else if(pipe_vld && !pipe_stall || rtu_yy_xx_dbgon)
  begin
    ipdp_ibdp_chgflw_mask[7:0]             <= pipe_chgflw_mask[7:0];
    ipdp_ibdp_chgflw_vlmul[1:0]            <= pipe_chgflw_vlmul[1:0];
    ipdp_ibdp_chgflw_vsew[2:0]             <= pipe_chgflw_vsew[2:0];
    ipdp_ibdp_chgflw_vl[7:0]               <= pipe_chgflw_vl[7:0];
    ipdp_ibdp_hn_vld[7:0]                  <= pipe_hn_vld[7:0];
    ipdp_ibdp_h0_vld                       <= pipe_h0_vld;
    ipdp_ibdp_hn_con_br[7:0]               <= pipe_hn_con_br[7:0];
    ipdp_ibdp_hn_ab_br[7:0]                <= pipe_hn_ab_br[7:0];
    ipdp_ibdp_hn_ind_br[7:0]               <= pipe_hn_ind_br[7:0];
    ipdp_ibdp_hn_jal[7:0]                  <= pipe_hn_jal[7:0];
    ipdp_ibdp_hn_jalr[7:0]                 <= pipe_hn_jalr[7:0];
    ipdp_ibdp_hn_no_spec[7:0]              <= pipe_hn_no_spec[7:0];
    ipdp_ibdp_hn_vl_pred[7:0]              <= pipe_hn_vl_pred[7:0];
    ipdp_ibdp_hn_32_start[7:0]             <= pipe_hn_32_start[7:0];
    ipdp_ibdp_hn_pc_oper[7:0]              <= pipe_hn_pc_oper[7:0];
    ipdp_ibdp_hn_ldst[7:0]                 <= pipe_hn_ldst[7:0];
    ipdp_ibdp_hn_dst_vld[7:0]              <= pipe_hn_dst_vld[7:0];
    ipdp_ibdp_hn_pcall[7:0]                <= pipe_hn_pcall[7:0];
    ipdp_ibdp_hn_preturn[7:0]              <= pipe_hn_preturn[7:0];
    ipdp_ibdp_hn_acc_err                   <= pipe_hn_acc_err;
    ipdp_ibdp_hn_mmu_acc_deny              <= pipe_hn_mmu_acc_deny;
    ipdp_ibdp_hn_pgflt                     <= pipe_hn_pgflt;
    ipdp_ibdp_hn_split1[7:0]               <= pipe_hn_split1[7:0];
    ipdp_ibdp_hn_split0[7:0]               <= pipe_hn_split0[7:0];
    ipdp_ibdp_hn_fence[7:0]                <= pipe_hn_fence[7:0];
    ipdp_ibdp_hn_bkpta[7:0]                <= pipe_hn_bkpta[7:0];
    ipdp_ibdp_hn_bkptb[7:0]                <= pipe_hn_bkptb[7:0];
    ipdp_ibdp_hn_vsetvli[7:0]              <= pipe_hn_vsetvli[7:0];
    ipdp_ibdp_hn_bkpta_vld                 <= pipe_hn_bkpta_vld;
    ipdp_ibdp_hn_bkptb_vld                 <= pipe_hn_bkptb_vld;
    ipdp_ibdp_hn_no_spec_vld               <= pipe_hn_no_spec_vld;
    ipdp_ibdp_vpc[PC_WIDTH-2:0]            <= pipe_vpc[PC_WIDTH-2:0];
    ipdp_ibdp_bht_result                   <= pipe_bht_result;
    ipdp_ibdp_bht_pre_result[1:0]          <= pipe_bht_pre_result[1:0];
    ipdp_ibdp_bht_sel_result[1:0]          <= pipe_bht_sel_result[1:0];
    ipdp_ibdp_con_br_num_vld               <= pipe_con_br_num_vld;
    ipdp_ibdp_con_br_num[3:0]              <= pipe_con_br_num[3:0];
    ipdp_ibdp_chgflw_num_vld               <= pipe_chgflw_num_vld;
    ipdp_ibdp_chgflw_num[3:0]              <= pipe_chgflw_num[3:0];
    ipdp_ibdp_no_chgflw_num[3:0]           <= pipe_no_chgflw_num[3:0];
    ipdp_ibdp_branch_base[PC_WIDTH-2:0]    <= pipe_branch_base[PC_WIDTH-2:0];
    ipdp_ibdp_branch_offset[20:0]          <= pipe_branch_offset[20:0];
    ipdp_ibdp_branch_result[PC_WIDTH-2:0]  <= pipe_branch_result[PC_WIDTH-2:0];
    ipdp_ibdp_branch_vlmul[1:0]            <= pipe_branch_vlmul[1:0];
    ipdp_ibdp_branch_vsew[2:0]             <= pipe_branch_vsew[2:0];
    ipdp_ibdp_branch_vl[7:0]               <= pipe_branch_vl[7:0];
    ipdp_ibdp_branch_way_pred[1:0]         <= pipe_branch_way_pred[1:0];
    ipdp_ibdp_branch_btb_miss              <= pipe_branch_btb_miss;
    ipdp_ibdp_l0_btb_ras                   <= pipe_l0_btb_ras;
    ipdp_ibdp_l0_btb_hit                   <= pipe_l0_btb_hit;
    ipdp_ibdp_l0_btb_ras_pc_hit            <= pipe_l0_btb_ras_pc_hit;
    ipdp_ibdp_l0_btb_entry_hit[15:0]       <= pipe_l0_btb_entry_hit[15:0];
    ipdp_ibdp_l0_btb_mispred_pc[PC_WIDTH-2:0] <= pipe_l0_btb_mispred_pc[PC_WIDTH-2:0];
    ipdp_ibdp_l0_btb_update_vld               <= pipe_l0_btb_update_vld;
    ipdp_ibdp_l0_btb_wen[3:0]                 <= pipe_l0_btb_wen[3:0];
    ipdp_ibdp_l0_btb_update_vld_bit           <= pipe_l0_btb_update_vld_bit;
    ipdp_ibdp_l0_btb_update_cnt_bit           <= pipe_l0_btb_update_cnt_bit;
    ipdp_ibdp_ras_target_pc[PC_WIDTH-2:0]  <= pipe_ras_target_pc[PC_WIDTH-2:0];    
    ipdp_ibdp_ras_push_pc[PC_WIDTH-2:0]    <= pipe_ras_push_pc[PC_WIDTH-2:0];    
    ipdp_ibdp_ind_br_offset[20:0]          <= pipe_ind_br_offset[20:0];
    ipdp_ibdp_vghr[21:0]                   <= pipe_vghr[21:0];
    ipdp_ibdp_btb_index_pc[PC_WIDTH-2:0]   <= pipe_btb_index_pc[PC_WIDTH-2:0];
  end
  else
  begin
    ipdp_ibdp_chgflw_mask[7:0]             <= ipdp_ibdp_chgflw_mask[7:0];
    ipdp_ibdp_chgflw_vlmul[1:0]            <= ipdp_ibdp_chgflw_vlmul[1:0];
    ipdp_ibdp_chgflw_vsew[2:0]             <= ipdp_ibdp_chgflw_vsew[2:0];
    ipdp_ibdp_chgflw_vl[7:0]               <= ipdp_ibdp_chgflw_vl[7:0];
    ipdp_ibdp_hn_vld[7:0]                  <= ipdp_ibdp_hn_vld[7:0];
    ipdp_ibdp_h0_vld                       <= ipdp_ibdp_h0_vld;
    ipdp_ibdp_hn_con_br[7:0]               <= ipdp_ibdp_hn_con_br[7:0];
    ipdp_ibdp_hn_ab_br[7:0]                <= ipdp_ibdp_hn_ab_br[7:0];
    ipdp_ibdp_hn_ind_br[7:0]               <= ipdp_ibdp_hn_ind_br[7:0];
    ipdp_ibdp_hn_jal[7:0]                  <= ipdp_ibdp_hn_jal[7:0];
    ipdp_ibdp_hn_jalr[7:0]                 <= ipdp_ibdp_hn_jalr[7:0];
    ipdp_ibdp_hn_no_spec[7:0]              <= ipdp_ibdp_hn_no_spec[7:0];
    ipdp_ibdp_hn_vl_pred[7:0]              <= ipdp_ibdp_hn_vl_pred[7:0];
    ipdp_ibdp_hn_32_start[7:0]             <= ipdp_ibdp_hn_32_start[7:0];
    ipdp_ibdp_hn_pc_oper[7:0]              <= ipdp_ibdp_hn_pc_oper[7:0];
    ipdp_ibdp_hn_ldst[7:0]                 <= ipdp_ibdp_hn_ldst[7:0];
    ipdp_ibdp_hn_dst_vld[7:0]              <= ipdp_ibdp_hn_dst_vld[7:0];
    ipdp_ibdp_hn_pcall[7:0]                <= ipdp_ibdp_hn_pcall[7:0];
    ipdp_ibdp_hn_preturn[7:0]              <= ipdp_ibdp_hn_preturn[7:0];
    ipdp_ibdp_hn_acc_err                   <= ipdp_ibdp_hn_acc_err;
    ipdp_ibdp_hn_mmu_acc_deny              <= ipdp_ibdp_hn_mmu_acc_deny;
    ipdp_ibdp_hn_pgflt                     <= ipdp_ibdp_hn_pgflt;
    ipdp_ibdp_hn_split1[7:0]               <= ipdp_ibdp_hn_split1[7:0];
    ipdp_ibdp_hn_split0[7:0]               <= ipdp_ibdp_hn_split0[7:0];
    ipdp_ibdp_hn_fence[7:0]                <= ipdp_ibdp_hn_fence[7:0];
    ipdp_ibdp_hn_bkpta[7:0]                <= ipdp_ibdp_hn_bkpta[7:0];
    ipdp_ibdp_hn_bkptb[7:0]                <= ipdp_ibdp_hn_bkptb[7:0];
    ipdp_ibdp_hn_vsetvli[7:0]              <= ipdp_ibdp_hn_vsetvli[7:0];
    ipdp_ibdp_hn_bkpta_vld                 <= ipdp_ibdp_hn_bkpta_vld;
    ipdp_ibdp_hn_bkptb_vld                 <= ipdp_ibdp_hn_bkptb_vld;
    ipdp_ibdp_hn_no_spec_vld               <= ipdp_ibdp_hn_no_spec_vld;
    ipdp_ibdp_vpc[PC_WIDTH-2:0]            <= ipdp_ibdp_vpc[PC_WIDTH-2:0];
    ipdp_ibdp_bht_result                   <= ipdp_ibdp_bht_result;
    ipdp_ibdp_bht_pre_result[1:0]          <= ipdp_ibdp_bht_pre_result[1:0];
    ipdp_ibdp_bht_sel_result[1:0]          <= ipdp_ibdp_bht_sel_result[1:0];
    ipdp_ibdp_con_br_num_vld               <= ipdp_ibdp_con_br_num_vld;
    ipdp_ibdp_con_br_num[3:0]              <= ipdp_ibdp_con_br_num[3:0];
    ipdp_ibdp_chgflw_num_vld               <= ipdp_ibdp_chgflw_num_vld;
    ipdp_ibdp_chgflw_num[3:0]              <= ipdp_ibdp_chgflw_num[3:0];
    ipdp_ibdp_no_chgflw_num[3:0]           <= ipdp_ibdp_no_chgflw_num[3:0];
    ipdp_ibdp_branch_base[PC_WIDTH-2:0]    <= ipdp_ibdp_branch_base[PC_WIDTH-2:0];
    ipdp_ibdp_branch_offset[20:0]          <= ipdp_ibdp_branch_offset[20:0];
    ipdp_ibdp_branch_result[PC_WIDTH-2:0]  <= ipdp_ibdp_branch_result[PC_WIDTH-2:0];
    ipdp_ibdp_branch_vlmul[1:0]            <= ipdp_ibdp_branch_vlmul[1:0];
    ipdp_ibdp_branch_vsew[2:0]             <= ipdp_ibdp_branch_vsew[2:0];
    ipdp_ibdp_branch_vl[7:0]               <= ipdp_ibdp_branch_vl[7:0];
    ipdp_ibdp_branch_way_pred[1:0]         <= ipdp_ibdp_branch_way_pred[1:0];
    ipdp_ibdp_branch_btb_miss              <= ipdp_ibdp_branch_btb_miss;
    ipdp_ibdp_l0_btb_ras                   <= ipdp_ibdp_l0_btb_ras;
    ipdp_ibdp_l0_btb_hit                   <= ipdp_ibdp_l0_btb_hit;
    ipdp_ibdp_l0_btb_ras_pc_hit            <= ipdp_ibdp_l0_btb_ras_pc_hit;
    ipdp_ibdp_l0_btb_entry_hit[15:0]       <= ipdp_ibdp_l0_btb_entry_hit[15:0];
    ipdp_ibdp_l0_btb_mispred_pc[PC_WIDTH-2:0] <= ipdp_ibdp_l0_btb_mispred_pc[PC_WIDTH-2:0];
    ipdp_ibdp_l0_btb_update_vld               <= ipdp_ibdp_l0_btb_update_vld;
    ipdp_ibdp_l0_btb_wen[3:0]                 <= ipdp_ibdp_l0_btb_wen[3:0];
    ipdp_ibdp_l0_btb_update_vld_bit           <= ipdp_ibdp_l0_btb_update_vld_bit;
    ipdp_ibdp_l0_btb_update_cnt_bit           <= ipdp_ibdp_l0_btb_update_cnt_bit;
    ipdp_ibdp_ras_target_pc[PC_WIDTH-2:0]  <= ipdp_ibdp_ras_target_pc[PC_WIDTH-2:0];    
    ipdp_ibdp_ras_push_pc[PC_WIDTH-2:0]    <= ipdp_ibdp_ras_push_pc[PC_WIDTH-2:0];    
    ipdp_ibdp_ind_br_offset[20:0]          <= ipdp_ibdp_ind_br_offset[20:0];
    ipdp_ibdp_vghr[21:0]                   <= ipdp_ibdp_vghr[21:0];
    ipdp_ibdp_btb_index_pc[PC_WIDTH-2:0]   <= ipdp_ibdp_btb_index_pc[PC_WIDTH-2:0];
  end
end

// &Force("output","ipdp_ibdp_hn_ecc_err");       @3569


always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h1_data[15:0]       <= 16'b0;
    ipdp_ibdp_h1_base[2:0]        <=  3'b0;
    ipdp_ibdp_h1_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h1_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h1_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h1_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h1_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[7] || rtu_yy_xx_dbgon)
  begin
    ipdp_ibdp_h1_data[15:0]       <= pipe_h1_data[15:0];
    ipdp_ibdp_h1_base[2:0]        <= pipe_h1_base[2:0];
    ipdp_ibdp_h1_vlmul[1:0]       <= pipe_h1_vlmul[1:0];
    ipdp_ibdp_h1_vsew[2:0]        <= pipe_h1_vsew[2:0];
    ipdp_ibdp_h1_vl[7:0]          <= pipe_h1_vl[7:0];
    ipdp_ibdp_h1_split0_type[2:0] <= pipe_h1_split0_type[2:0];
    ipdp_ibdp_h1_split1_type[2:0] <= pipe_h1_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h1_data[15:0]       <= ipdp_ibdp_h1_data[15:0];
    ipdp_ibdp_h1_base[2:0]        <= ipdp_ibdp_h1_base[2:0];
    ipdp_ibdp_h1_vlmul[1:0]       <= ipdp_ibdp_h1_vlmul[1:0];
    ipdp_ibdp_h1_vsew[2:0]        <= ipdp_ibdp_h1_vsew[2:0];
    ipdp_ibdp_h1_vl[7:0]          <= ipdp_ibdp_h1_vl[7:0];
    ipdp_ibdp_h1_split0_type[2:0] <= ipdp_ibdp_h1_split0_type[2:0];
    ipdp_ibdp_h1_split1_type[2:0] <= ipdp_ibdp_h1_split1_type[2:0];
  end
end

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h2_data[15:0]       <= 16'b0;
    ipdp_ibdp_h2_base[2:0]        <=  3'b0;
    ipdp_ibdp_h2_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h2_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h2_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h2_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h2_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[6] || rtu_yy_xx_dbgon)
  begin
    ipdp_ibdp_h2_data[15:0]       <= pipe_h2_data[15:0];
    ipdp_ibdp_h2_base[2:0]        <= pipe_h2_base[2:0];
    ipdp_ibdp_h2_vlmul[1:0]       <= pipe_h2_vlmul[1:0];
    ipdp_ibdp_h2_vsew[2:0]        <= pipe_h2_vsew[2:0];
    ipdp_ibdp_h2_vl[7:0]          <= pipe_h2_vl[7:0];
    ipdp_ibdp_h2_split0_type[2:0] <= pipe_h2_split0_type[2:0];
    ipdp_ibdp_h2_split1_type[2:0] <= pipe_h2_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h2_data[15:0]       <= ipdp_ibdp_h2_data[15:0];
    ipdp_ibdp_h2_base[2:0]        <= ipdp_ibdp_h2_base[2:0];
    ipdp_ibdp_h2_vlmul[1:0]       <= ipdp_ibdp_h2_vlmul[1:0];
    ipdp_ibdp_h2_vsew[2:0]        <= ipdp_ibdp_h2_vsew[2:0];
    ipdp_ibdp_h2_vl[7:0]          <= ipdp_ibdp_h2_vl[7:0];
    ipdp_ibdp_h2_split0_type[2:0] <= ipdp_ibdp_h2_split0_type[2:0];
    ipdp_ibdp_h2_split1_type[2:0] <= ipdp_ibdp_h2_split1_type[2:0];
  end
end

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h3_data[15:0]       <= 16'b0;
    ipdp_ibdp_h3_base[2:0]        <=  3'b0;
    ipdp_ibdp_h3_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h3_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h3_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h3_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h3_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[5])
  begin
    ipdp_ibdp_h3_data[15:0]       <= pipe_h3_data[15:0];
    ipdp_ibdp_h3_base[2:0]        <= pipe_h3_base[2:0];
    ipdp_ibdp_h3_vlmul[1:0]       <= pipe_h3_vlmul[1:0];
    ipdp_ibdp_h3_vsew[2:0]        <= pipe_h3_vsew[2:0];
    ipdp_ibdp_h3_vl[7:0]          <= pipe_h3_vl[7:0];
    ipdp_ibdp_h3_split0_type[2:0] <= pipe_h3_split0_type[2:0];
    ipdp_ibdp_h3_split1_type[2:0] <= pipe_h3_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h3_data[15:0]       <= ipdp_ibdp_h3_data[15:0];
    ipdp_ibdp_h3_base[2:0]        <= ipdp_ibdp_h3_base[2:0];
    ipdp_ibdp_h3_vlmul[1:0]       <= ipdp_ibdp_h3_vlmul[1:0];
    ipdp_ibdp_h3_vsew[2:0]        <= ipdp_ibdp_h3_vsew[2:0];
    ipdp_ibdp_h3_vl[7:0]          <= ipdp_ibdp_h3_vl[7:0];
    ipdp_ibdp_h3_split0_type[2:0] <= ipdp_ibdp_h3_split0_type[2:0];
    ipdp_ibdp_h3_split1_type[2:0] <= ipdp_ibdp_h3_split1_type[2:0];
  end
end

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h4_data[15:0]       <= 16'b0;
    ipdp_ibdp_h4_base[2:0]        <=  3'b0;
    ipdp_ibdp_h4_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h4_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h4_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h4_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h4_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[4])
  begin
    ipdp_ibdp_h4_data[15:0]       <= pipe_h4_data[15:0];
    ipdp_ibdp_h4_base[2:0]        <= pipe_h4_base[2:0];
    ipdp_ibdp_h4_vlmul[1:0]       <= pipe_h4_vlmul[1:0];
    ipdp_ibdp_h4_vsew[2:0]        <= pipe_h4_vsew[2:0];
    ipdp_ibdp_h4_vl[7:0]          <= pipe_h4_vl[7:0];
    ipdp_ibdp_h4_split0_type[2:0] <= pipe_h4_split0_type[2:0];
    ipdp_ibdp_h4_split1_type[2:0] <= pipe_h4_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h4_data[15:0]       <= ipdp_ibdp_h4_data[15:0];
    ipdp_ibdp_h4_base[2:0]        <= ipdp_ibdp_h4_base[2:0];
    ipdp_ibdp_h4_vlmul[1:0]       <= ipdp_ibdp_h4_vlmul[1:0];
    ipdp_ibdp_h4_vsew[2:0]        <= ipdp_ibdp_h4_vsew[2:0];
    ipdp_ibdp_h4_vl[7:0]          <= ipdp_ibdp_h4_vl[7:0];
    ipdp_ibdp_h4_split0_type[2:0] <= ipdp_ibdp_h4_split0_type[2:0];
    ipdp_ibdp_h4_split1_type[2:0] <= ipdp_ibdp_h4_split1_type[2:0];
  end
end

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h5_data[15:0]       <= 16'b0;
    ipdp_ibdp_h5_base[2:0]        <=  3'b0;
    ipdp_ibdp_h5_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h5_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h5_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h5_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h5_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[3])
  begin
    ipdp_ibdp_h5_data[15:0]       <= pipe_h5_data[15:0];
    ipdp_ibdp_h5_base[2:0]        <= pipe_h5_base[2:0];
    ipdp_ibdp_h5_vlmul[1:0]       <= pipe_h5_vlmul[1:0];
    ipdp_ibdp_h5_vsew[2:0]        <= pipe_h5_vsew[2:0];
    ipdp_ibdp_h5_vl[7:0]          <= pipe_h5_vl[7:0];
    ipdp_ibdp_h5_split0_type[2:0] <= pipe_h5_split0_type[2:0];
    ipdp_ibdp_h5_split1_type[2:0] <= pipe_h5_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h5_data[15:0]       <= ipdp_ibdp_h5_data[15:0];
    ipdp_ibdp_h5_base[2:0]        <= ipdp_ibdp_h5_base[2:0];
    ipdp_ibdp_h5_vlmul[1:0]       <= ipdp_ibdp_h5_vlmul[1:0];
    ipdp_ibdp_h5_vsew[2:0]        <= ipdp_ibdp_h5_vsew[2:0];
    ipdp_ibdp_h5_vl[7:0]          <= ipdp_ibdp_h5_vl[7:0];
    ipdp_ibdp_h5_split0_type[2:0] <= ipdp_ibdp_h5_split0_type[2:0];
    ipdp_ibdp_h5_split1_type[2:0] <= ipdp_ibdp_h5_split1_type[2:0];
  end
end

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h6_data[15:0]       <= 16'b0;
    ipdp_ibdp_h6_base[2:0]        <=  3'b0;
    ipdp_ibdp_h6_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h6_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h6_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h6_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h6_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[2])
  begin
    ipdp_ibdp_h6_data[15:0]       <= pipe_h6_data[15:0];
    ipdp_ibdp_h6_base[2:0]        <= pipe_h6_base[2:0];
    ipdp_ibdp_h6_vlmul[1:0]       <= pipe_h6_vlmul[1:0];
    ipdp_ibdp_h6_vsew[2:0]        <= pipe_h6_vsew[2:0];
    ipdp_ibdp_h6_vl[7:0]          <= pipe_h6_vl[7:0];
    ipdp_ibdp_h6_split0_type[2:0] <= pipe_h6_split0_type[2:0];
    ipdp_ibdp_h6_split1_type[2:0] <= pipe_h6_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h6_data[15:0]       <= ipdp_ibdp_h6_data[15:0];
    ipdp_ibdp_h6_base[2:0]        <= ipdp_ibdp_h6_base[2:0];
    ipdp_ibdp_h6_vlmul[1:0]       <= ipdp_ibdp_h6_vlmul[1:0];
    ipdp_ibdp_h6_vsew[2:0]        <= ipdp_ibdp_h6_vsew[2:0];
    ipdp_ibdp_h6_vl[7:0]          <= ipdp_ibdp_h6_vl[7:0];
    ipdp_ibdp_h6_split0_type[2:0] <= ipdp_ibdp_h6_split0_type[2:0];
    ipdp_ibdp_h6_split1_type[2:0] <= ipdp_ibdp_h6_split1_type[2:0];
  end
end

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h7_data[15:0]       <= 16'b0;
    ipdp_ibdp_h7_base[2:0]        <=  3'b0;
    ipdp_ibdp_h7_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h7_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h7_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h7_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h7_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[1])
  begin
    ipdp_ibdp_h7_data[15:0]       <= pipe_h7_data[15:0];
    ipdp_ibdp_h7_base[2:0]        <= pipe_h7_base[2:0];
    ipdp_ibdp_h7_vlmul[1:0]       <= pipe_h7_vlmul[1:0];
    ipdp_ibdp_h7_vsew[2:0]        <= pipe_h7_vsew[2:0];
    ipdp_ibdp_h7_vl[7:0]          <= pipe_h7_vl[7:0];
    ipdp_ibdp_h7_split0_type[2:0] <= pipe_h7_split0_type[2:0];
    ipdp_ibdp_h7_split1_type[2:0] <= pipe_h7_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h7_data[15:0]       <= ipdp_ibdp_h7_data[15:0];
    ipdp_ibdp_h7_base[2:0]        <= ipdp_ibdp_h7_base[2:0];
    ipdp_ibdp_h7_vlmul[1:0]       <= ipdp_ibdp_h7_vlmul[1:0];
    ipdp_ibdp_h7_vsew[2:0]        <= ipdp_ibdp_h7_vsew[2:0];
    ipdp_ibdp_h7_vl[7:0]          <= ipdp_ibdp_h7_vl[7:0];
    ipdp_ibdp_h7_split0_type[2:0] <= ipdp_ibdp_h7_split0_type[2:0];
    ipdp_ibdp_h7_split1_type[2:0] <= ipdp_ibdp_h7_split1_type[2:0];
  end
end

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h8_data[15:0]       <= 16'b0;
    ipdp_ibdp_h8_base[2:0]        <=  3'b0;
    ipdp_ibdp_h8_vlmul[1:0]       <=  2'b0;
    ipdp_ibdp_h8_vsew[2:0]        <=  3'b0;
    ipdp_ibdp_h8_vl[7:0]          <=  8'b0;
    ipdp_ibdp_h8_split0_type[2:0] <=  3'b0;
    ipdp_ibdp_h8_split1_type[2:0] <=  3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_hn_vld[0])
  begin
    ipdp_ibdp_h8_data[15:0]       <= pipe_h8_data[15:0];
    ipdp_ibdp_h8_base[2:0]        <= pipe_h8_base[2:0];
    ipdp_ibdp_h8_vlmul[1:0]       <= pipe_h8_vlmul[1:0];
    ipdp_ibdp_h8_vsew[2:0]        <= pipe_h8_vsew[2:0];
    ipdp_ibdp_h8_vl[7:0]          <= pipe_h8_vl[7:0];
    ipdp_ibdp_h8_split0_type[2:0] <= pipe_h8_split0_type[2:0];
    ipdp_ibdp_h8_split1_type[2:0] <= pipe_h8_split1_type[2:0];
  end
  else
  begin
    ipdp_ibdp_h8_data[15:0]       <= ipdp_ibdp_h8_data[15:0];
    ipdp_ibdp_h8_base[2:0]        <= ipdp_ibdp_h8_base[2:0];
    ipdp_ibdp_h8_vlmul[1:0]       <= ipdp_ibdp_h8_vlmul[1:0];
    ipdp_ibdp_h8_vsew[2:0]        <= ipdp_ibdp_h8_vsew[2:0];
    ipdp_ibdp_h8_vl[7:0]          <= ipdp_ibdp_h8_vl[7:0];
    ipdp_ibdp_h8_split0_type[2:0] <= ipdp_ibdp_h8_split0_type[2:0];
    ipdp_ibdp_h8_split1_type[2:0] <= ipdp_ibdp_h8_split1_type[2:0];
  end
end


// &Instance("gated_clk_cell","x_ip_ib_pipe_h0_clk"); @3846
gated_clk_cell  x_ip_ib_pipe_h0_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (ip_ib_pipe_h0_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (ip_ib_pipe_h0_clk_en),
  .module_en            (cp0_ifu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect( .clk_in         (forever_cpuclk), @3847
//           .clk_out        (ip_ib_pipe_h0_clk),//Out Clock @3848
//           .external_en    (1'b0), @3849
//           .global_en      (cp0_yy_clk_en), @3850
//           .local_en       (ip_ib_pipe_h0_clk_en),//Local Condition @3851
//           .module_en      (cp0_ifu_icg_en) @3852
//         ); @3853
assign ip_ib_pipe_h0_clk_en = pipe_vld_for_gateclk    && 
                              pipe_h0_vld && 
                             !pipe_stall;         
always @(posedge ip_ib_pipe_h0_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_h0_cur_pc[35:0]      <= 36'b0;
    ipdp_ibdp_h0_data[15:0]        <= 16'b0;
    ipdp_ibdp_h0_split1            <= 1'b0;
    ipdp_ibdp_h0_split0            <= 1'b0;
    ipdp_ibdp_h0_fence             <= 1'b0;
    ipdp_ibdp_h0_bkpta             <= 1'b0;
    ipdp_ibdp_h0_bkptb             <= 1'b0;
    ipdp_ibdp_h0_ldst              <= 1'b0;
    ipdp_ibdp_h0_no_spec           <= 1'b0;
    ipdp_ibdp_h0_vl_pred           <= 1'b0;
    ipdp_ibdp_h0_high_expt         <= 1'b0;
    ipdp_ibdp_h0_spe_vld           <= 1'b0;
    ipdp_ibdp_h0_vlmul[1:0]        <= 2'b0;
    ipdp_ibdp_h0_vsew[2:0]         <= 3'b0;
    ipdp_ibdp_h0_vl[7:0]           <= 8'b0;
    ipdp_ibdp_h0_con_br            <= 1'b0;
    ipdp_ibdp_h0_vsetvli           <= 1'b0;
    ipdp_ibdp_h0_split0_type[2:0]  <= 3'b0;
    ipdp_ibdp_h0_split1_type[2:0]  <= 3'b0;
  end
  else if(pipe_vld && !pipe_stall && pipe_h0_vld)
  begin
    ipdp_ibdp_h0_cur_pc[35:0]      <= pipe_h0_cur_pc[35:0];
    ipdp_ibdp_h0_data[15:0]        <= pipe_h0_data[15:0];
    ipdp_ibdp_h0_split1            <= pipe_h0_split1;
    ipdp_ibdp_h0_split0            <= pipe_h0_split0;
    ipdp_ibdp_h0_fence             <= pipe_h0_fence;
    ipdp_ibdp_h0_bkpta             <= pipe_h0_bkpta;
    ipdp_ibdp_h0_bkptb             <= pipe_h0_bkptb;
    ipdp_ibdp_h0_ldst              <= pipe_h0_ldst;
    ipdp_ibdp_h0_no_spec           <= pipe_h0_no_spec;
    ipdp_ibdp_h0_vl_pred           <= pipe_h0_vl_pred;
    ipdp_ibdp_h0_high_expt         <= pipe_h0_high_expt;
    ipdp_ibdp_h0_spe_vld           <= pipe_h0_spe_vld;
    ipdp_ibdp_h0_vlmul[1:0]        <= pipe_h0_vlmul[1:0];
    ipdp_ibdp_h0_vsew[2:0]         <= pipe_h0_vsew[2:0];
    ipdp_ibdp_h0_vl[7:0]           <= pipe_h0_vl[7:0];
    ipdp_ibdp_h0_con_br            <= pipe_h0_con_br;
    ipdp_ibdp_h0_vsetvli           <= pipe_h0_vsetvli;
    ipdp_ibdp_h0_split0_type[2:0]  <= pipe_h0_split0_type[2:0];
    ipdp_ibdp_h0_split1_type[2:0]  <= pipe_h0_split1_type[2:0];
  end
  else  
  begin
    ipdp_ibdp_h0_cur_pc[35:0]      <= ipdp_ibdp_h0_cur_pc[35:0];
    ipdp_ibdp_h0_data[15:0]        <= ipdp_ibdp_h0_data[15:0];
    ipdp_ibdp_h0_split1            <= ipdp_ibdp_h0_split1;
    ipdp_ibdp_h0_split0            <= ipdp_ibdp_h0_split0;
    ipdp_ibdp_h0_fence             <= ipdp_ibdp_h0_fence;
    ipdp_ibdp_h0_bkpta             <= ipdp_ibdp_h0_bkpta;
    ipdp_ibdp_h0_bkptb             <= ipdp_ibdp_h0_bkptb;
    ipdp_ibdp_h0_ldst              <= ipdp_ibdp_h0_ldst;
    ipdp_ibdp_h0_no_spec           <= ipdp_ibdp_h0_no_spec;
    ipdp_ibdp_h0_vl_pred           <= ipdp_ibdp_h0_vl_pred;
    ipdp_ibdp_h0_high_expt         <= ipdp_ibdp_h0_high_expt;
    ipdp_ibdp_h0_spe_vld           <= ipdp_ibdp_h0_spe_vld;
    ipdp_ibdp_h0_vlmul[1:0]        <= ipdp_ibdp_h0_vlmul[1:0];
    ipdp_ibdp_h0_vsew[2:0]         <= ipdp_ibdp_h0_vsew[2:0];
    ipdp_ibdp_h0_vl[7:0]           <= ipdp_ibdp_h0_vl[7:0];
    ipdp_ibdp_h0_con_br            <= ipdp_ibdp_h0_con_br;
    ipdp_ibdp_h0_vsetvli           <= ipdp_ibdp_h0_vsetvli;
    ipdp_ibdp_h0_split0_type[2:0]  <= ipdp_ibdp_h0_split0_type[2:0];
    ipdp_ibdp_h0_split1_type[2:0]  <= ipdp_ibdp_h0_split1_type[2:0];
  end
end


// &Force("output","ipdp_ibdp_chgflw_mask");     @3934
// &Force("output","ipdp_ibdp_chgflw_vlmul");     @3935
// &Force("output","ipdp_ibdp_chgflw_vsew");     @3936
// &Force("output","ipdp_ibdp_chgflw_vl");     @3937
// &Force("output","ipdp_ibdp_hn_vld");           @3938
// &Force("output","ipdp_ibdp_hn_con_br");        @3939
// &Force("output","ipdp_ibdp_hn_ab_br");         @3940
// &Force("output","ipdp_ibdp_hn_ind_br");        @3941
// &Force("output","ipdp_ibdp_hn_jal");        @3942
// &Force("output","ipdp_ibdp_hn_jalr");        @3943
// &Force("output","ipdp_ibdp_hn_no_spec");        @3944
// &Force("output","ipdp_ibdp_hn_vl_pred");        @3945
// &Force("output","ipdp_ibdp_hn_32_start");    @3946
// &Force("output","ipdp_ibdp_hn_pc_oper");       @3947
// &Force("output","ipdp_ibdp_hn_ldst");            @3948
// &Force("output","ipdp_ibdp_hn_dst_vld");            @3949
// &Force("output","ipdp_ibdp_hn_pcall");         @3950
// &Force("output","ipdp_ibdp_hn_preturn"); @3951
// &Force("output","ipdp_ibdp_hn_split1");  @3952
// &Force("output","ipdp_ibdp_hn_split0");  @3953
// &Force("output","ipdp_ibdp_hn_fence");  @3954
// &Force("output","ipdp_ibdp_hn_bkpta");  @3955
// &Force("output","ipdp_ibdp_hn_bkptb");  @3956
// &Force("output","ipdp_ibdp_hn_vsetvli");  @3957
// &Force("output","ipdp_ibdp_hn_bkpta_vld");  @3958
// &Force("output","ipdp_ibdp_hn_bkptb_vld");  @3959
// &Force("output","ipdp_ibdp_hn_no_spec_vld");  @3960
// &Force("output","ipdp_ibdp_hn_acc_err");       @3961
// &Force("output","ipdp_ibdp_hn_mmu_acc_deny");  @3962
// &Force("output","ipdp_ibdp_hn_pgflt");         @3963
// &Force("output","ipdp_ibdp_h1_data"); @3964
// &Force("output","ipdp_ibdp_h2_data"); @3965
// &Force("output","ipdp_ibdp_h3_data"); @3966
// &Force("output","ipdp_ibdp_h4_data"); @3967
// &Force("output","ipdp_ibdp_h5_data"); @3968
// &Force("output","ipdp_ibdp_h6_data"); @3969
// &Force("output","ipdp_ibdp_h7_data"); @3970
// &Force("output","ipdp_ibdp_h8_data"); @3971
// &Force("output","ipdp_ibdp_vpc");             @3972
// &Force("output","ipdp_ibdp_h1_base"); @3973
// &Force("output","ipdp_ibdp_h2_base"); @3974
// &Force("output","ipdp_ibdp_h3_base"); @3975
// &Force("output","ipdp_ibdp_h4_base"); @3976
// &Force("output","ipdp_ibdp_h5_base"); @3977
// &Force("output","ipdp_ibdp_h6_base"); @3978
// &Force("output","ipdp_ibdp_h7_base"); @3979
// &Force("output","ipdp_ibdp_h8_base"); @3980
// &Force("output","ipdp_ibdp_h1_vlmul"); @3981
// &Force("output","ipdp_ibdp_h2_vlmul"); @3982
// &Force("output","ipdp_ibdp_h3_vlmul"); @3983
// &Force("output","ipdp_ibdp_h4_vlmul"); @3984
// &Force("output","ipdp_ibdp_h5_vlmul"); @3985
// &Force("output","ipdp_ibdp_h6_vlmul"); @3986
// &Force("output","ipdp_ibdp_h7_vlmul"); @3987
// &Force("output","ipdp_ibdp_h8_vlmul"); @3988
// &Force("output","ipdp_ibdp_h1_vsew"); @3989
// &Force("output","ipdp_ibdp_h2_vsew"); @3990
// &Force("output","ipdp_ibdp_h3_vsew"); @3991
// &Force("output","ipdp_ibdp_h4_vsew"); @3992
// &Force("output","ipdp_ibdp_h5_vsew"); @3993
// &Force("output","ipdp_ibdp_h6_vsew"); @3994
// &Force("output","ipdp_ibdp_h7_vsew"); @3995
// &Force("output","ipdp_ibdp_h8_vsew"); @3996
// &Force("output","ipdp_ibdp_h1_vl"); @3997
// &Force("output","ipdp_ibdp_h2_vl"); @3998
// &Force("output","ipdp_ibdp_h3_vl"); @3999
// &Force("output","ipdp_ibdp_h4_vl"); @4000
// &Force("output","ipdp_ibdp_h5_vl"); @4001
// &Force("output","ipdp_ibdp_h6_vl"); @4002
// &Force("output","ipdp_ibdp_h7_vl"); @4003
// &Force("output","ipdp_ibdp_h8_vl"); @4004
// &Force("output","ipdp_ibdp_h1_split0_type"); @4006
// &Force("output","ipdp_ibdp_h2_split0_type"); @4007
// &Force("output","ipdp_ibdp_h3_split0_type"); @4008
// &Force("output","ipdp_ibdp_h4_split0_type"); @4009
// &Force("output","ipdp_ibdp_h5_split0_type"); @4010
// &Force("output","ipdp_ibdp_h6_split0_type"); @4011
// &Force("output","ipdp_ibdp_h7_split0_type"); @4012
// &Force("output","ipdp_ibdp_h8_split0_type"); @4013
// &Force("output","ipdp_ibdp_h1_split1_type"); @4014
// &Force("output","ipdp_ibdp_h2_split1_type"); @4015
// &Force("output","ipdp_ibdp_h3_split1_type"); @4016
// &Force("output","ipdp_ibdp_h4_split1_type"); @4017
// &Force("output","ipdp_ibdp_h5_split1_type"); @4018
// &Force("output","ipdp_ibdp_h6_split1_type"); @4019
// &Force("output","ipdp_ibdp_h7_split1_type"); @4020
// &Force("output","ipdp_ibdp_h8_split1_type"); @4021
// &Force("output","ipdp_ibdp_h0_con_br"); @4022
// &Force("output","ipdp_ibdp_h0_split0_type");                @4023
// &Force("output","ipdp_ibdp_h0_split1_type");                @4024
// &Force("output","ipdp_ibdp_h0_vsetvli");                @4025
// &Force("output","ipdp_ibdp_bht_result");            @4027
// &Force("output","ipdp_ibdp_bht_pre_result");  @4028
// &Force("output","ipdp_ibdp_bht_sel_result");   @4029
// &Force("output","ipdp_ibdp_con_br_num_vld"); @4030
// &Force("output","ipdp_ibdp_con_br_num");  @4031
// &Force("output","ipdp_ibdp_chgflw_num_vld"); @4032
// &Force("output","ipdp_ibdp_chgflw_num"); @4033
// &Force("output","ipdp_ibdp_ras_target_pc"); @4034
// &Force("output","ipdp_ibdp_ras_push_pc"); @4035
// &Force("output","ipdp_ibdp_no_chgflw_num"); @4036
// &Force("output","ipdp_ibdp_h0_cur_pc");       @4037
// &Force("output","ipdp_ibdp_h0_data");         @4038
// &Force("output","ipdp_ibdp_h0_vld");                @4039
// &Force("output","ipdp_ibdp_h0_split1");                @4040
// &Force("output","ipdp_ibdp_h0_split0");                @4041
// &Force("output","ipdp_ibdp_h0_fence");                @4042
// &Force("output","ipdp_ibdp_h0_bkpta");                @4043
// &Force("output","ipdp_ibdp_h0_bkptb");                @4044
// &Force("output","ipdp_ibdp_h0_ldst"); @4045
// &Force("output","ipdp_ibdp_h0_no_spec");                @4046
// &Force("output","ipdp_ibdp_h0_vl_pred");                @4047
// &Force("output","ipdp_ibdp_h0_high_expt");                @4048
// &Force("output","ipdp_ibdp_h0_spe_vld");                @4049
// &Force("output","ipdp_ibdp_h0_vlmul");                @4050
// &Force("output","ipdp_ibdp_h0_vsew");                @4051
// &Force("output","ipdp_ibdp_h0_vl");                @4052
// &Force("output","ipdp_ibdp_branch_base");     @4053
// &Force("output","ipdp_ibdp_branch_offset");   @4054
// &Force("output","ipdp_ibdp_branch_result"); @4055
// &Force("output","ipdp_ibdp_branch_vlmul"); @4056
// &Force("output","ipdp_ibdp_branch_vsew"); @4057
// &Force("output","ipdp_ibdp_branch_vl"); @4058
// &Force("output","ipdp_ibdp_ind_br_offset"); @4059
// &Force("output","ipdp_ibdp_vghr"); @4060
// &Force("output","ipdp_ibdp_btb_index_pc"); @4061
// &Force("output","ipdp_ibdp_branch_btb_miss");       @4063
// &Force("output","ipdp_ibdp_branch_way_pred"); @4064
// &Force("output","ipdp_ibdp_l0_btb_ras"); @4065
// &Force("output","ipdp_ibdp_l0_btb_hit"); @4066
// &Force("output","ipdp_ibdp_l0_btb_ras_pc_hit"); @4067
// &Force("output","ipdp_ibdp_l0_btb_entry_hit"); @4068
// &Force("output","ipdp_ibdp_l0_btb_mispred_pc"); @4069
// &Force("output","ipdp_ibdp_l0_btb_update_vld"); @4070
// &Force("output","ipdp_ibdp_l0_btb_wen"); @4071
// &Force("output","ipdp_ibdp_l0_btb_update_vld_bit"); @4072
// &Force("output","ipdp_ibdp_l0_btb_update_cnt_bit"); @4073

always @(posedge ip_ib_pipe_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipdp_ibdp_hn_chgflw[7:0]              <= 8'b0;
    ipdp_ibdp_hn_auipc[7:0]               <= 8'b0;
    ipdp_ibdp_con_br_inst_32              <= 1'b0;
    ipdp_ibdp_con_br_cur_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    ipdp_ibdp_con_br_offset[20:0]         <= 21'b0;
    ipdp_ibdp_con_br_half_num[3:0]        <= 4'b0;
  end
  else if(pipe_vld && !pipe_stall || rtu_yy_xx_dbgon)
  begin
    ipdp_ibdp_hn_chgflw[7:0]              <= pipe_hn_chgflw[7:0]; 
    ipdp_ibdp_hn_auipc[7:0]               <= pipe_hn_auipc[7:0];
    ipdp_ibdp_con_br_inst_32              <= pipe_con_br_inst_32;
    ipdp_ibdp_con_br_cur_pc[PC_WIDTH-2:0] <= pipe_con_br_cur_pc[PC_WIDTH-2:0];
    ipdp_ibdp_con_br_offset[20:0]         <= pipe_con_br_offset[20:0];
    ipdp_ibdp_con_br_half_num[3:0]        <= pipe_con_br_half_num[3:0];
  end
  else
  begin
    ipdp_ibdp_hn_chgflw[7:0]              <= ipdp_ibdp_hn_chgflw[7:0]; 
    ipdp_ibdp_hn_auipc[7:0]               <= ipdp_ibdp_hn_auipc[7:0];
    ipdp_ibdp_con_br_inst_32              <= ipdp_ibdp_con_br_inst_32;
    ipdp_ibdp_con_br_cur_pc[PC_WIDTH-2:0] <= ipdp_ibdp_con_br_cur_pc[PC_WIDTH-2:0];
    ipdp_ibdp_con_br_offset[20:0]         <= ipdp_ibdp_con_br_offset[20:0];
    ipdp_ibdp_con_br_half_num[3:0]        <= ipdp_ibdp_con_br_half_num[3:0];
  end
end

// &Force("output","ipdp_ibdp_hn_chgflw"); @4108
// &Force("output","ipdp_ibdp_hn_auipc"); @4109
// &Force("output","ipdp_ibdp_con_br_inst_32");        @4110
// &Force("output","ipdp_ibdp_con_br_cur_pc");   @4111
// &Force("output","ipdp_ibdp_con_br_offset");   @4112
// &Force("output","ipdp_ibdp_con_br_half_num"); @4113

// &Force("nonport", "pipe_con_br_cur_pc"); @4116
// &Force("nonport", "pipe_con_br_half_num"); @4117
// &Force("nonport", "pipe_con_br_inst_32"); @4118
// &Force("nonport", "pipe_con_br_offset"); @4119
// &Force("nonport", "pipe_h0_ld"); @4120
// &Force("nonport", "pipe_hn_chgflw"); @4121
// &Force("nonport", "pipe_hn_auipc"); @4122

// &ModuleEnd; @4152
endmodule


