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
module ct_ifu_ipctrl(
  cp0_ifu_bht_en,
  cp0_ifu_no_op_req,
  cpurst_b,
  forever_cpuclk,
  had_ifu_ir_vld,
  ibctrl_ipctrl_low_power_stall,
  ibctrl_ipctrl_stall,
  ifctrl_ipctrl_if_pcload,
  ifctrl_ipctrl_vld,
  ifdp_ipctrl_expt_vld,
  ifdp_ipctrl_expt_vld_dup,
  ifdp_ipctrl_fifo,
  ifdp_ipctrl_pa,
  ifdp_ipctrl_refill_on,
  ifdp_ipctrl_tsize,
  ifdp_ipctrl_vpc_2_0_onehot,
  ifdp_ipctrl_vpc_bry_mask,
  ifdp_ipctrl_w0_bry0_hit,
  ifdp_ipctrl_w0_bry1_hit,
  ifdp_ipctrl_w0b0_br_ntake,
  ifdp_ipctrl_w0b0_br_taken,
  ifdp_ipctrl_w0b0_bry_data,
  ifdp_ipctrl_w0b1_br_ntake,
  ifdp_ipctrl_w0b1_br_taken,
  ifdp_ipctrl_w0b1_bry_data,
  ifdp_ipctrl_w1_bry0_hit,
  ifdp_ipctrl_w1_bry1_hit,
  ifdp_ipctrl_w1b0_br_ntake,
  ifdp_ipctrl_w1b0_br_taken,
  ifdp_ipctrl_w1b0_bry_data,
  ifdp_ipctrl_w1b1_br_ntake,
  ifdp_ipctrl_w1b1_br_taken,
  ifdp_ipctrl_w1b1_bry_data,
  ifdp_ipctrl_way0_15_8_hit,
  ifdp_ipctrl_way0_15_8_hit_dup,
  ifdp_ipctrl_way0_23_16_hit,
  ifdp_ipctrl_way0_23_16_hit_dup,
  ifdp_ipctrl_way0_28_24_hit,
  ifdp_ipctrl_way0_28_24_hit_dup,
  ifdp_ipctrl_way0_7_0_hit,
  ifdp_ipctrl_way0_7_0_hit_dup,
  ifdp_ipctrl_way1_15_8_hit,
  ifdp_ipctrl_way1_23_16_hit,
  ifdp_ipctrl_way1_28_24_hit,
  ifdp_ipctrl_way1_7_0_hit,
  ifdp_ipctrl_way_pred,
  ipctrl_bht_con_br_gateclk_en,
  ipctrl_bht_con_br_taken,
  ipctrl_bht_con_br_vld,
  ipctrl_bht_more_br,
  ipctrl_bht_vld,
  ipctrl_btb_chgflw_vld,
  ipctrl_btb_way_pred,
  ipctrl_btb_way_pred_error,
  ipctrl_debug_bry_missigned_stall,
  ipctrl_debug_h0_vld,
  ipctrl_debug_ip_expt_vld,
  ipctrl_debug_ip_if_stall,
  ipctrl_debug_ip_vld,
  ipctrl_debug_miss_under_refill_stall,
  ipctrl_ibctrl_expt_vld,
  ipctrl_ibctrl_if_chgflw_vld,
  ipctrl_ibctrl_ip_chgflw_vld,
  ipctrl_ibctrl_l0_btb_hit,
  ipctrl_ibctrl_l0_btb_mispred,
  ipctrl_ibctrl_l0_btb_miss,
  ipctrl_ibctrl_l0_btb_st_wait,
  ipctrl_ibctrl_vld,
  ipctrl_ibdp_expt_vld,
  ipctrl_ibdp_vld,
  ipctrl_ifctrl_bht_stall,
  ipctrl_ifctrl_stall,
  ipctrl_ifctrl_stall_short,
  ipctrl_ifdp_gateclk_en,
  ipctrl_ifdp_vpc_onehot_updt,
  ipctrl_ifdp_w0_bry0_hit_updt,
  ipctrl_ifdp_w0_bry1_hit_updt,
  ipctrl_ifdp_w0b0_br_ntake_updt,
  ipctrl_ifdp_w0b0_br_taken_updt,
  ipctrl_ifdp_w0b0_bry_updt_data,
  ipctrl_ifdp_w0b1_br_ntake_updt,
  ipctrl_ifdp_w0b1_br_taken_updt,
  ipctrl_ifdp_w0b1_bry_updt_data,
  ipctrl_ifdp_w1_bry0_hit_updt,
  ipctrl_ifdp_w1_bry1_hit_updt,
  ipctrl_ifdp_w1b0_br_ntake_updt,
  ipctrl_ifdp_w1b0_br_taken_updt,
  ipctrl_ifdp_w1b0_bry_updt_data,
  ipctrl_ifdp_w1b1_br_ntake_updt,
  ipctrl_ifdp_w1b1_br_taken_updt,
  ipctrl_ifdp_w1b1_bry_updt_data,
  ipctrl_ind_btb_con_br_vld,
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
  ipctrl_l0_btb_chgflw_vld,
  ipctrl_l0_btb_ip_vld,
  ipctrl_l0_btb_wait_next,
  ipctrl_l1_refill_chk_err,
  ipctrl_l1_refill_fifo,
  ipctrl_l1_refill_miss_req,
  ipctrl_l1_refill_ppc,
  ipctrl_l1_refill_req_for_gateclk,
  ipctrl_l1_refill_vpc,
  ipctrl_pcgen_branch_mistaken,
  ipctrl_pcgen_branch_taken,
  ipctrl_pcgen_chgflw_pc,
  ipctrl_pcgen_chgflw_pcload,
  ipctrl_pcgen_chgflw_way_pred,
  ipctrl_pcgen_chk_err_reissue,
  ipctrl_pcgen_h0_vld,
  ipctrl_pcgen_if_stall,
  ipctrl_pcgen_inner_way0,
  ipctrl_pcgen_inner_way1,
  ipctrl_pcgen_inner_way_pred,
  ipctrl_pcgen_reissue_pc,
  ipctrl_pcgen_reissue_pcload,
  ipctrl_pcgen_reissue_way_pred,
  ipctrl_pcgen_taken_pc,
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
  l0_btb_ipctrl_st_wait,
  l1_refill_ipctrl_busy,
  pcgen_ipctrl_cancel,
  pcgen_ipctrl_pipe_cancel,
  rtu_ifu_xx_dbgon,
  rtu_yy_xx_dbgon
);

// &Ports; @23
input           cp0_ifu_bht_en;                      
input           cp0_ifu_no_op_req;                   
input           cpurst_b;                            
input           forever_cpuclk;                      
input           had_ifu_ir_vld;                      
input           ibctrl_ipctrl_low_power_stall;       
input           ibctrl_ipctrl_stall;                 
input           ifctrl_ipctrl_if_pcload;             
input           ifctrl_ipctrl_vld;                   
input           ifdp_ipctrl_expt_vld;                
input           ifdp_ipctrl_expt_vld_dup;            
input           ifdp_ipctrl_fifo;                    
input   [27:0]  ifdp_ipctrl_pa;                      
input           ifdp_ipctrl_refill_on;               
input           ifdp_ipctrl_tsize;                   
input   [7 :0]  ifdp_ipctrl_vpc_2_0_onehot;          
input   [7 :0]  ifdp_ipctrl_vpc_bry_mask;            
input           ifdp_ipctrl_w0_bry0_hit;             
input           ifdp_ipctrl_w0_bry1_hit;             
input   [7 :0]  ifdp_ipctrl_w0b0_br_ntake;           
input   [7 :0]  ifdp_ipctrl_w0b0_br_taken;           
input   [7 :0]  ifdp_ipctrl_w0b0_bry_data;           
input   [7 :0]  ifdp_ipctrl_w0b1_br_ntake;           
input   [7 :0]  ifdp_ipctrl_w0b1_br_taken;           
input   [7 :0]  ifdp_ipctrl_w0b1_bry_data;           
input           ifdp_ipctrl_w1_bry0_hit;             
input           ifdp_ipctrl_w1_bry1_hit;             
input   [7 :0]  ifdp_ipctrl_w1b0_br_ntake;           
input   [7 :0]  ifdp_ipctrl_w1b0_br_taken;           
input   [7 :0]  ifdp_ipctrl_w1b0_bry_data;           
input   [7 :0]  ifdp_ipctrl_w1b1_br_ntake;           
input   [7 :0]  ifdp_ipctrl_w1b1_br_taken;           
input   [7 :0]  ifdp_ipctrl_w1b1_bry_data;           
input           ifdp_ipctrl_way0_15_8_hit;           
input           ifdp_ipctrl_way0_15_8_hit_dup;       
input           ifdp_ipctrl_way0_23_16_hit;          
input           ifdp_ipctrl_way0_23_16_hit_dup;      
input           ifdp_ipctrl_way0_28_24_hit;          
input           ifdp_ipctrl_way0_28_24_hit_dup;      
input           ifdp_ipctrl_way0_7_0_hit;            
input           ifdp_ipctrl_way0_7_0_hit_dup;        
input           ifdp_ipctrl_way1_15_8_hit;           
input           ifdp_ipctrl_way1_23_16_hit;          
input           ifdp_ipctrl_way1_28_24_hit;          
input           ifdp_ipctrl_way1_7_0_hit;            
input   [1 :0]  ifdp_ipctrl_way_pred;                
input   [1 :0]  ipdp_ipctrl_bht_data;                
input           ipdp_ipctrl_bht_result;              
input   [1 :0]  ipdp_ipctrl_btb_way0_pred;           
input   [19:0]  ipdp_ipctrl_btb_way0_target;         
input   [1 :0]  ipdp_ipctrl_btb_way1_pred;           
input   [19:0]  ipdp_ipctrl_btb_way1_target;         
input   [1 :0]  ipdp_ipctrl_btb_way2_pred;           
input   [19:0]  ipdp_ipctrl_btb_way2_target;         
input   [1 :0]  ipdp_ipctrl_btb_way3_pred;           
input   [19:0]  ipdp_ipctrl_btb_way3_target;         
input           ipdp_ipctrl_con_br_first_branch;     
input           ipdp_ipctrl_con_br_more_than_one;    
input           ipdp_ipctrl_h0_ab_br;                
input           ipdp_ipctrl_h0_br;                   
input           ipdp_ipctrl_h0_con_br;               
input           ipdp_ipctrl_h0_vld;                  
input           ipdp_ipctrl_h8_br;                   
input   [7 :0]  ipdp_ipctrl_inst_32;                 
input           ipdp_ipctrl_ip_expt_vld;             
input   [3 :0]  ipdp_ipctrl_l0_btb_hit_way;          
input   [38:0]  ipdp_ipctrl_l0_btb_mispred_pc;       
input           ipdp_ipctrl_l0_btb_ras;              
input           ipdp_ipctrl_l0_btb_vld;              
input           ipdp_ipctrl_no_br;                   
input   [38:0]  ipdp_ipctrl_vpc;                     
input   [7 :0]  ipdp_ipctrl_w0_ab_br;                
input   [7 :0]  ipdp_ipctrl_w0_br;                   
input   [7 :0]  ipdp_ipctrl_w1_ab_br;                
input   [7 :0]  ipdp_ipctrl_w1_br;                   
input   [7 :0]  ipdp_ipctrl_way0_32;                 
input   [7 :0]  ipdp_ipctrl_way1_32;                 
input           l0_btb_ipctrl_st_wait;               
input           l1_refill_ipctrl_busy;               
input           pcgen_ipctrl_cancel;                 
input           pcgen_ipctrl_pipe_cancel;            
input           rtu_ifu_xx_dbgon;                    
input           rtu_yy_xx_dbgon;                     
output          ipctrl_bht_con_br_gateclk_en;        
output          ipctrl_bht_con_br_taken;             
output          ipctrl_bht_con_br_vld;               
output          ipctrl_bht_more_br;                  
output          ipctrl_bht_vld;                      
output          ipctrl_btb_chgflw_vld;               
output  [1 :0]  ipctrl_btb_way_pred;                 
output          ipctrl_btb_way_pred_error;           
output          ipctrl_debug_bry_missigned_stall;    
output          ipctrl_debug_h0_vld;                 
output          ipctrl_debug_ip_expt_vld;            
output          ipctrl_debug_ip_if_stall;            
output          ipctrl_debug_ip_vld;                 
output          ipctrl_debug_miss_under_refill_stall; 
output          ipctrl_ibctrl_expt_vld;              
output          ipctrl_ibctrl_if_chgflw_vld;         
output          ipctrl_ibctrl_ip_chgflw_vld;         
output          ipctrl_ibctrl_l0_btb_hit;            
output          ipctrl_ibctrl_l0_btb_mispred;        
output          ipctrl_ibctrl_l0_btb_miss;           
output          ipctrl_ibctrl_l0_btb_st_wait;        
output          ipctrl_ibctrl_vld;                   
output          ipctrl_ibdp_expt_vld;                
output          ipctrl_ibdp_vld;                     
output          ipctrl_ifctrl_bht_stall;             
output          ipctrl_ifctrl_stall;                 
output          ipctrl_ifctrl_stall_short;           
output          ipctrl_ifdp_gateclk_en;              
output  [7 :0]  ipctrl_ifdp_vpc_onehot_updt;         
output          ipctrl_ifdp_w0_bry0_hit_updt;        
output          ipctrl_ifdp_w0_bry1_hit_updt;        
output  [7 :0]  ipctrl_ifdp_w0b0_br_ntake_updt;      
output  [7 :0]  ipctrl_ifdp_w0b0_br_taken_updt;      
output  [7 :0]  ipctrl_ifdp_w0b0_bry_updt_data;      
output  [7 :0]  ipctrl_ifdp_w0b1_br_ntake_updt;      
output  [7 :0]  ipctrl_ifdp_w0b1_br_taken_updt;      
output  [7 :0]  ipctrl_ifdp_w0b1_bry_updt_data;      
output          ipctrl_ifdp_w1_bry0_hit_updt;        
output          ipctrl_ifdp_w1_bry1_hit_updt;        
output  [7 :0]  ipctrl_ifdp_w1b0_br_ntake_updt;      
output  [7 :0]  ipctrl_ifdp_w1b0_br_taken_updt;      
output  [7 :0]  ipctrl_ifdp_w1b0_bry_updt_data;      
output  [7 :0]  ipctrl_ifdp_w1b1_br_ntake_updt;      
output  [7 :0]  ipctrl_ifdp_w1b1_br_taken_updt;      
output  [7 :0]  ipctrl_ifdp_w1b1_bry_updt_data;      
output          ipctrl_ind_btb_con_br_vld;           
output          ipctrl_ipdp_bht_vld;                 
output          ipctrl_ipdp_br_more_than_one_stall;  
output  [7 :0]  ipctrl_ipdp_branch;                  
output  [7 :0]  ipctrl_ipdp_bry_data;                
output  [38:0]  ipctrl_ipdp_chgflw_pc;               
output          ipctrl_ipdp_con_br;                  
output          ipctrl_ipdp_h0_update_vld;           
output          ipctrl_ipdp_h0_updt_gateclk_en;      
output  [7 :0]  ipctrl_ipdp_hn_con_br;               
output          ipctrl_ipdp_icache_way0_hit;         
output          ipctrl_ipdp_icache_way0_hit_short;   
output          ipctrl_ipdp_if_pcload;               
output          ipctrl_ipdp_ip_data_vld;             
output          ipctrl_ipdp_ip_mistaken;             
output          ipctrl_ipdp_ip_pcload;               
output          ipctrl_ipdp_l0_btb_hit;              
output          ipctrl_ipdp_pipe_cancel;             
output          ipctrl_ipdp_pipe_stall;              
output          ipctrl_ipdp_pipe_vld;                
output          ipctrl_ipdp_pipe_vld_for_gateclk;    
output          ipctrl_ipdp_self_stall;              
output  [7 :0]  ipctrl_ipdp_vpc_mask;                
output  [2 :0]  ipctrl_ipdp_vpc_next;                
output  [7 :0]  ipctrl_ipdp_vpc_onehot;              
output          ipctrl_l0_btb_chgflw_vld;            
output          ipctrl_l0_btb_ip_vld;                
output          ipctrl_l0_btb_wait_next;             
output          ipctrl_l1_refill_chk_err;            
output          ipctrl_l1_refill_fifo;               
output          ipctrl_l1_refill_miss_req;           
output  [38:0]  ipctrl_l1_refill_ppc;                
output          ipctrl_l1_refill_req_for_gateclk;    
output  [38:0]  ipctrl_l1_refill_vpc;                
output          ipctrl_pcgen_branch_mistaken;        
output          ipctrl_pcgen_branch_taken;           
output  [38:0]  ipctrl_pcgen_chgflw_pc;              
output          ipctrl_pcgen_chgflw_pcload;          
output  [1 :0]  ipctrl_pcgen_chgflw_way_pred;        
output          ipctrl_pcgen_chk_err_reissue;        
output          ipctrl_pcgen_h0_vld;                 
output          ipctrl_pcgen_if_stall;               
output          ipctrl_pcgen_inner_way0;             
output          ipctrl_pcgen_inner_way1;             
output  [1 :0]  ipctrl_pcgen_inner_way_pred;         
output  [38:0]  ipctrl_pcgen_reissue_pc;             
output          ipctrl_pcgen_reissue_pcload;         
output  [1 :0]  ipctrl_pcgen_reissue_way_pred;       
output  [38:0]  ipctrl_pcgen_taken_pc;               

// &Regs; @24
reg     [2 :0]  hit_cnt;                             
reg             ip_chgflw_mistaken_flop;             
reg     [2 :0]  ip_vpc_next;                         
reg             ipctrl_ibctrl_expt_vld;              
reg             ipctrl_ibctrl_if_chgflw_vld;         
reg             ipctrl_ibctrl_ip_chgflw_vld;         
reg             ipctrl_ibctrl_l0_btb_hit;            
reg             ipctrl_ibctrl_l0_btb_mispred;        
reg             ipctrl_ibctrl_l0_btb_miss;           
reg             ipctrl_ibctrl_l0_btb_st_wait;        
reg             ipctrl_ibctrl_vld;                   
reg             l0_btb_hit_ntake_way0;               
reg             l0_btb_hit_ntake_way1;               
reg             l0_btb_hit_taken_way0;               
reg             l0_btb_hit_taken_way1;               
reg     [7 :0]  vpc_onehot_masked_bry_update;        
reg     [7 :0]  w0b0_br_ntake_masked;                
reg     [7 :0]  w0b0_br_taken_masked;                
reg     [7 :0]  w0b0_bry_data_masked;                
reg     [7 :0]  w0b1_br_ntake_masked;                
reg     [7 :0]  w0b1_br_taken_masked;                
reg     [7 :0]  w0b1_bry_data_masked;                
reg     [7 :0]  w1b0_br_ntake_masked;                
reg     [7 :0]  w1b0_br_taken_masked;                
reg     [7 :0]  w1b0_bry_data_masked;                
reg     [7 :0]  w1b1_br_ntake_masked;                
reg     [7 :0]  w1b1_br_taken_masked;                
reg     [7 :0]  w1b1_bry_data_masked;                
reg     [19:0]  way0_chgflw_pc_ntake;                
reg     [19:0]  way0_chgflw_pc_taken;                
reg     [1 :0]  way0_way_pred_ntake;                 
reg     [1 :0]  way0_way_pred_taken;                 
reg     [19:0]  way1_chgflw_pc_ntake;                
reg     [19:0]  way1_chgflw_pc_taken;                
reg     [1 :0]  way1_way_pred_ntake;                 
reg     [1 :0]  way1_way_pred_taken;                 

// &Wires; @25
wire    [1 :0]  bht_data;                            
wire            bht_result;                          
wire            br_more_than_one_stall;              
wire            branch_chgflw;                       
wire            branch_ntake;                        
wire            branch_taken;                        
wire            bry0_hit;                            
wire            bry1_hit;                            
wire    [7 :0]  bry_data;                            
wire            bry_missigned_stall;                 
wire    [7 :0]  bry_vld_32;                          
wire    [38:0]  chgflw_pc;                           
wire    [18:0]  chgflw_pc_high;                      
wire    [19:0]  chgflw_pc_low;                       
wire            con_br_first_branch;                 
wire            con_br_more_than_one;                
wire            con_br_vld;                          
wire            cp0_ifu_bht_en;                      
wire            cp0_ifu_no_op_req;                   
wire            cpurst_b;                            
wire            forever_cpuclk;                      
wire            h0_vld;                              
wire            had_ifu_ir_vld;                      
wire    [2 :0]  hit_cnt_add;                         
wire    [2 :0]  hit_cnt_sub;                         
wire            ibctrl_ipctrl_low_power_stall;       
wire            ibctrl_ipctrl_stall;                 
wire            icache_chk_err_refill;               
wire            icache_chk_err_refill_ff;            
wire            icache_refill_reissue;               
wire            icache_way0_hit;                     
wire            icache_way0_hit_short;               
wire            icache_way1_hit;                     
wire            ifctrl_ipctrl_if_pcload;             
wire            ifctrl_ipctrl_vld;                   
wire            ifdp_ipctrl_expt_vld;                
wire            ifdp_ipctrl_expt_vld_dup;            
wire            ifdp_ipctrl_fifo;                    
wire    [27:0]  ifdp_ipctrl_pa;                      
wire            ifdp_ipctrl_refill_on;               
wire            ifdp_ipctrl_tsize;                   
wire    [7 :0]  ifdp_ipctrl_vpc_2_0_onehot;          
wire    [7 :0]  ifdp_ipctrl_vpc_bry_mask;            
wire            ifdp_ipctrl_w0_bry0_hit;             
wire            ifdp_ipctrl_w0_bry1_hit;             
wire    [7 :0]  ifdp_ipctrl_w0b0_br_ntake;           
wire    [7 :0]  ifdp_ipctrl_w0b0_br_taken;           
wire    [7 :0]  ifdp_ipctrl_w0b0_bry_data;           
wire    [7 :0]  ifdp_ipctrl_w0b1_br_ntake;           
wire    [7 :0]  ifdp_ipctrl_w0b1_br_taken;           
wire    [7 :0]  ifdp_ipctrl_w0b1_bry_data;           
wire            ifdp_ipctrl_w1_bry0_hit;             
wire            ifdp_ipctrl_w1_bry1_hit;             
wire    [7 :0]  ifdp_ipctrl_w1b0_br_ntake;           
wire    [7 :0]  ifdp_ipctrl_w1b0_br_taken;           
wire    [7 :0]  ifdp_ipctrl_w1b0_bry_data;           
wire    [7 :0]  ifdp_ipctrl_w1b1_br_ntake;           
wire    [7 :0]  ifdp_ipctrl_w1b1_br_taken;           
wire    [7 :0]  ifdp_ipctrl_w1b1_bry_data;           
wire            ifdp_ipctrl_way0_15_8_hit;           
wire            ifdp_ipctrl_way0_15_8_hit_dup;       
wire            ifdp_ipctrl_way0_23_16_hit;          
wire            ifdp_ipctrl_way0_23_16_hit_dup;      
wire            ifdp_ipctrl_way0_28_24_hit;          
wire            ifdp_ipctrl_way0_28_24_hit_dup;      
wire            ifdp_ipctrl_way0_7_0_hit;            
wire            ifdp_ipctrl_way0_7_0_hit_dup;        
wire            ifdp_ipctrl_way1_15_8_hit;           
wire            ifdp_ipctrl_way1_23_16_hit;          
wire            ifdp_ipctrl_way1_28_24_hit;          
wire            ifdp_ipctrl_way1_7_0_hit;            
wire    [1 :0]  ifdp_ipctrl_way_pred;                
wire    [7 :0]  inst_32;                             
wire            ip_chgflw_mask;                      
wire            ip_chgflw_mistaken;                  
wire            ip_chgflw_mistaken_pre;              
wire    [7 :0]  ip_chgflw_ntake;                     
wire            ip_chgflw_pre;                       
wire    [7 :0]  ip_chgflw_taken;                     
wire    [7 :0]  ip_con_br;                           
wire            ip_data_vld;                         
wire            ip_expt_vld;                         
wire            ip_h0_pipe_vld;                      
wire            ip_icache_refill;                    
wire            ip_if_pcload;                        
wire            ip_pcload;                           
wire            ip_refill_pre;                       
wire            ip_self_stall;                       
wire            ip_vld;                              
wire            ip_vld_for_gateclk;                  
wire            ipctrl_bht_con_br_gateclk_en;        
wire            ipctrl_bht_con_br_taken;             
wire            ipctrl_bht_con_br_vld;               
wire            ipctrl_bht_more_br;                  
wire            ipctrl_bht_vld;                      
wire            ipctrl_branch_mistaken;              
wire            ipctrl_branch_taken;                 
wire            ipctrl_btb_chgflw_vld;               
wire    [1 :0]  ipctrl_btb_way_pred;                 
wire            ipctrl_btb_way_pred_error;           
wire            ipctrl_chgflw_vld;                   
wire            ipctrl_debug_bry_missigned_stall;    
wire            ipctrl_debug_h0_vld;                 
wire            ipctrl_debug_ip_expt_vld;            
wire            ipctrl_debug_ip_if_stall;            
wire            ipctrl_debug_ip_vld;                 
wire            ipctrl_debug_miss_under_refill_stall; 
wire            ipctrl_ibdp_expt_vld;                
wire            ipctrl_ibdp_vld;                     
wire            ipctrl_ifctrl_bht_stall;             
wire            ipctrl_ifctrl_stall;                 
wire            ipctrl_ifctrl_stall_short;           
wire            ipctrl_ifdp_gateclk_en;              
wire    [7 :0]  ipctrl_ifdp_vpc_onehot_updt;         
wire            ipctrl_ifdp_w0_bry0_hit_updt;        
wire            ipctrl_ifdp_w0_bry1_hit_updt;        
wire    [7 :0]  ipctrl_ifdp_w0b0_br_ntake_updt;      
wire    [7 :0]  ipctrl_ifdp_w0b0_br_taken_updt;      
wire    [7 :0]  ipctrl_ifdp_w0b0_bry_updt_data;      
wire    [7 :0]  ipctrl_ifdp_w0b1_br_ntake_updt;      
wire    [7 :0]  ipctrl_ifdp_w0b1_br_taken_updt;      
wire    [7 :0]  ipctrl_ifdp_w0b1_bry_updt_data;      
wire            ipctrl_ifdp_w1_bry0_hit_updt;        
wire            ipctrl_ifdp_w1_bry1_hit_updt;        
wire    [7 :0]  ipctrl_ifdp_w1b0_br_ntake_updt;      
wire    [7 :0]  ipctrl_ifdp_w1b0_br_taken_updt;      
wire    [7 :0]  ipctrl_ifdp_w1b0_bry_updt_data;      
wire    [7 :0]  ipctrl_ifdp_w1b1_br_ntake_updt;      
wire    [7 :0]  ipctrl_ifdp_w1b1_br_taken_updt;      
wire    [7 :0]  ipctrl_ifdp_w1b1_bry_updt_data;      
wire            ipctrl_ind_btb_con_br_vld;           
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
wire            ipctrl_l0_btb_chgflw_vld;            
wire            ipctrl_l0_btb_ip_vld;                
wire            ipctrl_l0_btb_wait_next;             
wire            ipctrl_l1_refill_chk_err;            
wire            ipctrl_l1_refill_fifo;               
wire            ipctrl_l1_refill_miss_req;           
wire    [38:0]  ipctrl_l1_refill_ppc;                
wire            ipctrl_l1_refill_req_for_gateclk;    
wire    [38:0]  ipctrl_l1_refill_vpc;                
wire            ipctrl_pcgen_branch_mistaken;        
wire            ipctrl_pcgen_branch_taken;           
wire    [38:0]  ipctrl_pcgen_chgflw_pc;              
wire            ipctrl_pcgen_chgflw_pcload;          
wire    [1 :0]  ipctrl_pcgen_chgflw_way_pred;        
wire            ipctrl_pcgen_chk_err_reissue;        
wire            ipctrl_pcgen_h0_vld;                 
wire            ipctrl_pcgen_if_stall;               
wire            ipctrl_pcgen_inner_way0;             
wire            ipctrl_pcgen_inner_way1;             
wire    [1 :0]  ipctrl_pcgen_inner_way_pred;         
wire    [38:0]  ipctrl_pcgen_reissue_pc;             
wire            ipctrl_pcgen_reissue_pcload;         
wire    [1 :0]  ipctrl_pcgen_reissue_way_pred;       
wire    [38:0]  ipctrl_pcgen_taken_pc;               
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
wire            l0_btb_hit;                          
wire            l0_btb_hit_l1_btb;                   
wire            l0_btb_ipctrl_st_wait;               
wire            l0_btb_mispred;                      
wire            l0_btb_miss;                         
wire            l1_refill_ipctrl_busy;               
wire            masked_bry_update_vld;               
wire            miss_under_refill_stall;             
wire    [7 :0]  missigned_bry;                       
wire            missigned_bry_update_vld;            
wire    [7 :0]  missigned_bry_vld;                   
wire            pcgen_ipctrl_cancel;                 
wire            pcgen_ipctrl_pipe_cancel;            
wire            rtu_ifu_xx_dbgon;                    
wire            rtu_yy_xx_dbgon;                     
wire    [7 :0]  vpc_onehot;                          
wire    [7 :0]  w0b0_br_ntake;                       
wire    [7 :0]  w0b0_br_ntake_missigned;             
wire    [7 :0]  w0b0_br_taken;                       
wire    [7 :0]  w0b0_br_taken_missigned;             
wire    [7 :0]  w0b0_bry_data;                       
wire            w0b0_bry_hit_masked;                 
wire    [7 :0]  w0b0_con_br;                         
wire    [7 :0]  w0b1_br_ntake;                       
wire    [7 :0]  w0b1_br_ntake_missigned;             
wire    [7 :0]  w0b1_br_taken;                       
wire    [7 :0]  w0b1_br_taken_missigned;             
wire    [7 :0]  w0b1_bry_data;                       
wire            w0b1_bry_hit_masked;                 
wire    [7 :0]  w0b1_con_br;                         
wire    [7 :0]  w1b0_br_ntake;                       
wire    [7 :0]  w1b0_br_ntake_missigned;             
wire    [7 :0]  w1b0_br_taken;                       
wire    [7 :0]  w1b0_br_taken_missigned;             
wire    [7 :0]  w1b0_bry_data;                       
wire            w1b0_bry_hit_masked;                 
wire    [7 :0]  w1b0_con_br;                         
wire    [7 :0]  w1b1_br_ntake;                       
wire    [7 :0]  w1b1_br_ntake_missigned;             
wire    [7 :0]  w1b1_br_taken;                       
wire    [7 :0]  w1b1_br_taken_missigned;             
wire    [7 :0]  w1b1_bry_data;                       
wire            w1b1_bry_hit_masked;                 
wire    [7 :0]  w1b1_con_br;                         
wire    [7 :0]  way0_br_ntake;                       
wire    [7 :0]  way0_br_taken;                       
wire            way0_bry0_hit;                       
wire            way0_bry1_hit;                       
wire            way0_bry_hit_missigned;              
wire    [7 :0]  way0_con_br;                         
wire            way0_ntake;                          
wire            way0_taken;                          
wire    [7 :0]  way1_br_ntake;                       
wire    [7 :0]  way1_br_taken;                       
wire            way1_bry0_hit;                       
wire            way1_bry1_hit;                       
wire            way1_bry_hit_missigned;              
wire    [7 :0]  way1_con_br;                         
wire            way1_ntake;                          
wire            way1_taken;                          
wire            way_mispred_reissue;                 
wire    [1 :0]  way_mispred_reissue_way_pred;        
wire    [1 :0]  way_pred;                            


parameter PC_WIDTH = 40;
// &Force("bus","ipdp_ipctrl_l0_btb_mispred_pc",38,0); @28
// &Force("bus","ipdp_ipctrl_way0_32",7,0); @29
// &Force("bus","ipdp_ipctrl_way1_32",7,0); @30

//==========================================================
//           BTB Change Flow Signal of IP Stage
//==========================================================
assign way0_bry0_hit = h0_vld || ifdp_ipctrl_w0_bry0_hit;
assign way0_bry1_hit = !h0_vld && ifdp_ipctrl_w0_bry1_hit;
assign way1_bry0_hit = h0_vld || ifdp_ipctrl_w1_bry0_hit;
assign way1_bry1_hit = !h0_vld && ifdp_ipctrl_w1_bry1_hit;


assign bry0_hit = (icache_way0_hit)
                  ? way0_bry0_hit
                  : way1_bry0_hit;
assign bry1_hit = (icache_way0_hit)
                  ? way0_bry1_hit
                  : way1_bry1_hit;

//branch predecode information
assign w0b0_br_taken[7]   = ifdp_ipctrl_w0b0_br_taken[7] || ipdp_ipctrl_h0_br;
assign w0b0_br_taken[0]   = ifdp_ipctrl_w0b0_br_taken[0] && !ipdp_ipctrl_way0_32[0];
assign w0b0_br_taken[6:1] = ifdp_ipctrl_w0b0_br_taken[6:1];

assign w0b1_br_taken[7]   = ifdp_ipctrl_w0b1_br_taken[7] ;
assign w0b1_br_taken[0]   = ifdp_ipctrl_w0b1_br_taken[0] && !ipdp_ipctrl_way0_32[0];
assign w0b1_br_taken[6:1] = ifdp_ipctrl_w0b1_br_taken[6:1];

assign w1b0_br_taken[7]   = ifdp_ipctrl_w1b0_br_taken[7] || ipdp_ipctrl_h0_br;
assign w1b0_br_taken[0]   = ifdp_ipctrl_w1b0_br_taken[0] && !ipdp_ipctrl_way1_32[0];
assign w1b0_br_taken[6:1] = ifdp_ipctrl_w1b0_br_taken[6:1];

assign w1b1_br_taken[7]   = ifdp_ipctrl_w1b1_br_taken[7] ;
assign w1b1_br_taken[0]   = ifdp_ipctrl_w1b1_br_taken[0] && !ipdp_ipctrl_way1_32[0];
assign w1b1_br_taken[6:1] = ifdp_ipctrl_w1b1_br_taken[6:1];

assign w0b0_br_ntake[7]   = ifdp_ipctrl_w0b0_br_ntake[7] || ipdp_ipctrl_h0_ab_br;
assign w0b0_br_ntake[0]   = ifdp_ipctrl_w0b0_br_ntake[0] && !ipdp_ipctrl_way0_32[0];
assign w0b0_br_ntake[6:1] = ifdp_ipctrl_w0b0_br_ntake[6:1];

assign w0b1_br_ntake[7]   = ifdp_ipctrl_w0b1_br_ntake[7] ;
assign w0b1_br_ntake[0]   = ifdp_ipctrl_w0b1_br_ntake[0] && !ipdp_ipctrl_way0_32[0];
assign w0b1_br_ntake[6:1] = ifdp_ipctrl_w0b1_br_ntake[6:1];

assign w1b0_br_ntake[7]   = ifdp_ipctrl_w1b0_br_ntake[7] || ipdp_ipctrl_h0_ab_br;
assign w1b0_br_ntake[0]   = ifdp_ipctrl_w1b0_br_ntake[0] && !ipdp_ipctrl_way1_32[0];
assign w1b0_br_ntake[6:1] = ifdp_ipctrl_w1b0_br_ntake[6:1];

assign w1b1_br_ntake[7]   = ifdp_ipctrl_w1b1_br_ntake[7] ;
assign w1b1_br_ntake[0]   = ifdp_ipctrl_w1b1_br_ntake[0] && !ipdp_ipctrl_way1_32[0];
assign w1b1_br_ntake[6:1] = ifdp_ipctrl_w1b1_br_ntake[6:1];

assign w0b0_con_br[7]   = ifdp_ipctrl_w0b0_br_taken[7] ^ ifdp_ipctrl_w0b0_br_ntake[7]  || ipdp_ipctrl_h0_con_br;
assign w0b0_con_br[0]   = (ifdp_ipctrl_w0b0_br_taken[0]^ ifdp_ipctrl_w0b0_br_ntake[0]) && !ipdp_ipctrl_way0_32[0];
assign w0b0_con_br[6:1] = ifdp_ipctrl_w0b0_br_taken[6:1] ^ ifdp_ipctrl_w0b0_br_ntake[6:1];

assign w0b1_con_br[7]   = ifdp_ipctrl_w0b1_br_taken[7] ^ ifdp_ipctrl_w0b1_br_ntake[7]  || ipdp_ipctrl_h0_con_br;
assign w0b1_con_br[0]   = (ifdp_ipctrl_w0b1_br_taken[0]^ ifdp_ipctrl_w0b1_br_ntake[0]) && !ipdp_ipctrl_way0_32[0];
assign w0b1_con_br[6:1] = ifdp_ipctrl_w0b1_br_taken[6:1] ^ ifdp_ipctrl_w0b1_br_ntake[6:1];

assign w1b0_con_br[7]   = ifdp_ipctrl_w1b0_br_taken[7] ^ ifdp_ipctrl_w1b0_br_ntake[7]  || ipdp_ipctrl_h0_con_br;
assign w1b0_con_br[0]   = (ifdp_ipctrl_w1b0_br_taken[0]^ ifdp_ipctrl_w1b0_br_ntake[0]) && !ipdp_ipctrl_way1_32[0];
assign w1b0_con_br[6:1] = ifdp_ipctrl_w1b0_br_taken[6:1] ^ ifdp_ipctrl_w1b0_br_ntake[6:1];

assign w1b1_con_br[7]   = ifdp_ipctrl_w1b1_br_taken[7] ^ ifdp_ipctrl_w1b1_br_ntake[7]  || ipdp_ipctrl_h0_con_br;
assign w1b1_con_br[0]   = (ifdp_ipctrl_w1b1_br_taken[0]^ ifdp_ipctrl_w1b1_br_ntake[0]) && !ipdp_ipctrl_way1_32[0];
assign w1b1_con_br[6:1] = ifdp_ipctrl_w1b1_br_taken[6:1] ^ ifdp_ipctrl_w1b1_br_ntake[6:1];

//way0 predecode information
assign way0_br_taken[7:0] = (way0_bry1_hit)
                            ? w0b1_br_taken[7:0]
                            : w0b0_br_taken[7:0];
assign way0_br_ntake[7:0] = (way0_bry1_hit)
                            ? w0b1_br_ntake[7:0]
                            : w0b0_br_ntake[7:0];
assign way0_con_br[7:0]   = (way0_bry1_hit)
                            ? w0b1_con_br[7:0]
                            : w0b0_con_br[7:0];
//way1 prdecode information
assign way1_br_taken[7:0] = (way1_bry1_hit)
                            ? w1b1_br_taken[7:0]
                            : w1b0_br_taken[7:0];
assign way1_br_ntake[7:0] = (way1_bry1_hit)
                            ? w1b1_br_ntake[7:0]
                            : w1b0_br_ntake[7:0];
assign way1_con_br[7:0]   = (way1_bry1_hit)
                            ? w1b1_con_br[7:0]
                            : w1b0_con_br[7:0];

//way0 branch taken/ntake 
assign way0_taken = |way0_br_taken[7:0];
assign way0_ntake = |way0_br_ntake[7:0];

//way1 branch taken/ntake
assign way1_taken = |way1_br_taken[7:0];
assign way1_ntake = |way1_br_ntake[7:0];

//branch taken
assign branch_taken  = (icache_way0_hit)
                       ? way0_taken
                       : way1_taken;

//branch ntake
assign branch_ntake  = (icache_way0_hit)
                       ? way0_ntake
                       : way1_ntake;

assign bht_result    = ipdp_ipctrl_bht_result;

assign branch_chgflw = (bht_result)
                       ? branch_taken
                       : branch_ntake;

//-------------------Bry_data_send_to_ipdp------------------
assign w0b0_bry_data[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] | {h0_vld,7'b0};
assign w0b1_bry_data[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0];
assign w1b0_bry_data[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] | {h0_vld,7'b0};
assign w1b1_bry_data[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0];

assign bry_data[7:0] = (icache_way0_hit_short)
                       ? (way0_bry0_hit)
                         ? w0b0_bry_data[7:0]
                         : w0b1_bry_data[7:0]
                       : (way1_bry0_hit)
                         ? w1b0_bry_data[7:0]
                         : w1b1_bry_data[7:0];

assign ipctrl_ipdp_bry_data[7:0] = bry_data[7:0];

//--------------select right chgflw signal------------------
////ip stage chgflw valid select
assign ip_chgflw_taken[7:0] =  (icache_way0_hit_short)
                               ? way0_br_taken[7:0]
                               : way1_br_taken[7:0];
assign ip_chgflw_ntake[7:0] =  (icache_way0_hit_short)
                               ? way0_br_ntake[7:0]
                               : way1_br_ntake[7:0];
assign ip_con_br[7:0]       =  (icache_way0_hit_short)
                               ? way0_con_br[7:0]
                               : way1_con_br[7:0];
assign ipctrl_ipdp_branch[7:0] = (bht_result)
                                 ? ip_chgflw_taken[7:0]
                                 : ip_chgflw_ntake[7:0];                                 
assign ipctrl_ipdp_hn_con_br[7:0] = ip_con_br[7:0];

// &CombBeg; @175
always @( ipdp_ipctrl_l0_btb_hit_way[3:0]
       or way0_br_taken[7:2])
begin
if(|way0_br_taken[7:6])
  l0_btb_hit_taken_way0 = ipdp_ipctrl_l0_btb_hit_way[0];
else if(|way0_br_taken[5:4])
  l0_btb_hit_taken_way0 = ipdp_ipctrl_l0_btb_hit_way[1];
else if(|way0_br_taken[3:2])
  l0_btb_hit_taken_way0 = ipdp_ipctrl_l0_btb_hit_way[2];
else
  l0_btb_hit_taken_way0 = ipdp_ipctrl_l0_btb_hit_way[3];
// &CombEnd; @184
end

// &CombBeg; @186
always @( ipdp_ipctrl_l0_btb_hit_way[3:0]
       or way1_br_taken[3:2]
       or way1_br_taken[7:4])
begin
if(|way1_br_taken[7:6])
  l0_btb_hit_taken_way1 = ipdp_ipctrl_l0_btb_hit_way[0];
else if(|way1_br_taken[5:4])
  l0_btb_hit_taken_way1 = ipdp_ipctrl_l0_btb_hit_way[1];
else if(|way1_br_taken[3:2])
  l0_btb_hit_taken_way1 = ipdp_ipctrl_l0_btb_hit_way[2];
else
  l0_btb_hit_taken_way1 = ipdp_ipctrl_l0_btb_hit_way[3];
// &CombEnd; @195
end

// &CombBeg; @197
always @( ipdp_ipctrl_l0_btb_hit_way[3:0]
       or way0_br_ntake[7:4]
       or way0_br_ntake[3:2])
begin
if(|way0_br_ntake[7:6])
  l0_btb_hit_ntake_way0 = ipdp_ipctrl_l0_btb_hit_way[0];
else if(|way0_br_ntake[5:4])
  l0_btb_hit_ntake_way0 = ipdp_ipctrl_l0_btb_hit_way[1];
else if(|way0_br_ntake[3:2])
  l0_btb_hit_ntake_way0 = ipdp_ipctrl_l0_btb_hit_way[2];
else
  l0_btb_hit_ntake_way0 = ipdp_ipctrl_l0_btb_hit_way[3];
// &CombEnd; @206
end

// &CombBeg; @208
always @( way1_br_ntake[7:2]
       or ipdp_ipctrl_l0_btb_hit_way[3:0])
begin
if(|way1_br_ntake[7:6])
  l0_btb_hit_ntake_way1 = ipdp_ipctrl_l0_btb_hit_way[0];
else if(|way1_br_ntake[5:4])
  l0_btb_hit_ntake_way1 = ipdp_ipctrl_l0_btb_hit_way[1];
else if(|way1_br_ntake[3:2])
  l0_btb_hit_ntake_way1 = ipdp_ipctrl_l0_btb_hit_way[2];
else
  l0_btb_hit_ntake_way1 = ipdp_ipctrl_l0_btb_hit_way[3];
// &CombEnd; @217
end

assign l0_btb_hit_l1_btb = (bht_result)
                           ? (icache_way0_hit)
                              ? l0_btb_hit_taken_way0
                              : l0_btb_hit_taken_way1
                           : (icache_way0_hit)
                              ? l0_btb_hit_ntake_way0
                              : l0_btb_hit_ntake_way1;
assign ip_if_pcload          = ifctrl_ipctrl_if_pcload;

//chgflw taken
assign ip_chgflw_pre         = ip_data_vld
                            && (h0_vld || bry0_hit || bry1_hit); 
assign ip_chgflw_mask        = ip_if_pcload 
                            && !ipdp_ipctrl_l0_btb_ras 
                            && l0_btb_hit_l1_btb
                            && !ip_chgflw_mistaken_flop;
assign ip_pcload             = ip_chgflw_pre
                            && branch_chgflw;
                            
//mistaken :
assign ip_chgflw_mistaken_pre = ip_if_pcload
                             && !ipdp_ipctrl_l0_btb_ras
                             && !con_br_more_than_one
                             && (h0_vld || bry0_hit || bry1_hit)
                             && ip_data_vld;
assign ip_chgflw_mistaken = ip_chgflw_mistaken_pre
                         && !branch_chgflw;

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ip_chgflw_mistaken_flop <= 1'b0;
  else if(pcgen_ipctrl_pipe_cancel)
    ip_chgflw_mistaken_flop <= 1'b0;
  else if(ibctrl_ipctrl_stall || ip_self_stall || br_more_than_one_stall)
    if(ip_chgflw_mistaken || ip_pcload)
      ip_chgflw_mistaken_flop <= 1'b1;
    else
      ip_chgflw_mistaken_flop <= ip_chgflw_mistaken_flop;
  else
    ip_chgflw_mistaken_flop <= 1'b0;
end


//ipctrl chgflw valid when:
//1. ip chgflw dectect && if doesn't hit ip chgflw pc
//2. if chgflw mistaken
assign ipctrl_branch_taken    = ip_pcload && !ip_chgflw_mask;
assign ipctrl_branch_mistaken = ip_chgflw_mistaken;
assign ipctrl_chgflw_vld   = (branch_chgflw)
                            ? ip_chgflw_pre && !ip_chgflw_mask
                            : ip_chgflw_mistaken_pre;

//==========================================================
//             BTB Change Flow PC of IP Stage
//==========================================================
// &CombBeg; @278
always @( way0_br_taken[1:0]
       or ipdp_ipctrl_btb_way1_target[19:0]
       or ipdp_ipctrl_l0_btb_mispred_pc[19:0]
       or ipdp_ipctrl_btb_way3_target[19:0]
       or ipdp_ipctrl_btb_way2_target[19:0]
       or way0_br_taken[7:2]
       or ipdp_ipctrl_btb_way0_target[19:0])
begin
if(|way0_br_taken[7:6])
  way0_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way0_target[19:0];
else if(|way0_br_taken[5:4])
  way0_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way1_target[19:0];
else if(|way0_br_taken[3:2])
  way0_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way2_target[19:0];
else if(|way0_br_taken[1:0])
  way0_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way3_target[19:0];
else
  way0_chgflw_pc_taken[19:0] = ipdp_ipctrl_l0_btb_mispred_pc[19:0];
// &CombEnd; @289
end

// &CombBeg; @291
always @( way1_br_taken[7:4]
       or way1_br_taken[3:0]
       or ipdp_ipctrl_btb_way1_target[19:0]
       or ipdp_ipctrl_l0_btb_mispred_pc[19:0]
       or ipdp_ipctrl_btb_way2_target[19:0]
       or ipdp_ipctrl_btb_way3_target[19:0]
       or ipdp_ipctrl_btb_way0_target[19:0])
begin
if(|way1_br_taken[7:6])
  way1_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way0_target[19:0];
else if(|way1_br_taken[5:4])
  way1_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way1_target[19:0];
else if(|way1_br_taken[3:2])
  way1_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way2_target[19:0];
else if(|way1_br_taken[1:0])
  way1_chgflw_pc_taken[19:0] = ipdp_ipctrl_btb_way3_target[19:0];
else
  way1_chgflw_pc_taken[19:0] = ipdp_ipctrl_l0_btb_mispred_pc[19:0];
// &CombEnd; @302
end

// &CombBeg; @304
always @( way0_br_ntake[7:4]
       or ipdp_ipctrl_btb_way1_target[19:0]
       or ipdp_ipctrl_l0_btb_mispred_pc[19:0]
       or ipdp_ipctrl_btb_way2_target[19:0]
       or ipdp_ipctrl_btb_way3_target[19:0]
       or way0_br_ntake[3:0]
       or ipdp_ipctrl_btb_way0_target[19:0])
begin
if(|way0_br_ntake[7:6])
  way0_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way0_target[19:0];
else if(|way0_br_ntake[5:4])
  way0_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way1_target[19:0];
else if(|way0_br_ntake[3:2])
  way0_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way2_target[19:0];
else if(|way0_br_ntake[1:0])
  way0_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way3_target[19:0];
else
  way0_chgflw_pc_ntake[19:0] = ipdp_ipctrl_l0_btb_mispred_pc[19:0];
// &CombEnd; @315
end

// &CombBeg; @317
always @( ipdp_ipctrl_btb_way1_target[19:0]
       or ipdp_ipctrl_l0_btb_mispred_pc[19:0]
       or ipdp_ipctrl_btb_way2_target[19:0]
       or ipdp_ipctrl_btb_way3_target[19:0]
       or way1_br_ntake[7:0]
       or ipdp_ipctrl_btb_way0_target[19:0])
begin
if(|way1_br_ntake[7:6])
  way1_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way0_target[19:0];
else if(|way1_br_ntake[5:4])
  way1_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way1_target[19:0];
else if(|way1_br_ntake[3:2])
  way1_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way2_target[19:0];
else if(|way1_br_ntake[1:0])
  way1_chgflw_pc_ntake[19:0] = ipdp_ipctrl_btb_way3_target[19:0];
else
  way1_chgflw_pc_ntake[19:0] = ipdp_ipctrl_l0_btb_mispred_pc[19:0];
// &CombEnd; @328
end

assign chgflw_pc_low[19:0] = (bht_result)
                             ? (icache_way0_hit_short)
                               ? way0_chgflw_pc_taken[19:0]
                               : way1_chgflw_pc_taken[19:0]
                             : (icache_way0_hit_short)
                               ? way0_chgflw_pc_ntake[19:0]
                               : way1_chgflw_pc_ntake[19:0];

assign chgflw_pc_high[PC_WIDTH-22:0] = (branch_chgflw)
                                     ? ipdp_ipctrl_vpc[PC_WIDTH-2:20] 
                                     : ipdp_ipctrl_l0_btb_mispred_pc[PC_WIDTH-2:20];
assign chgflw_pc[PC_WIDTH-2:0]       = {chgflw_pc_high[PC_WIDTH-22:0],chgflw_pc_low[19:0]};

//==========================================================
//             Way pred Of IP stage
//==========================================================
// &CombBeg; @346
always @( way0_br_taken[1:0]
       or ipdp_ipctrl_btb_way2_pred[1:0]
       or ipdp_ipctrl_btb_way3_pred[1:0]
       or ipdp_ipctrl_btb_way1_pred[1:0]
       or ipdp_ipctrl_btb_way0_pred[1:0]
       or way0_br_taken[7:2])
begin
if(|way0_br_taken[7:6])
  way0_way_pred_taken[1:0] = ipdp_ipctrl_btb_way0_pred[1:0];
else if(|way0_br_taken[5:4])
  way0_way_pred_taken[1:0] = ipdp_ipctrl_btb_way1_pred[1:0];
else if(|way0_br_taken[3:2])
  way0_way_pred_taken[1:0] = ipdp_ipctrl_btb_way2_pred[1:0];
else if(|way0_br_taken[1:0])
  way0_way_pred_taken[1:0] = ipdp_ipctrl_btb_way3_pred[1:0];
else
  way0_way_pred_taken[1:0] = 2'b11;
// &CombEnd; @357
end

// &CombBeg; @359
always @( way1_br_taken[7:4]
       or ipdp_ipctrl_btb_way2_pred[1:0]
       or way1_br_taken[3:0]
       or ipdp_ipctrl_btb_way3_pred[1:0]
       or ipdp_ipctrl_btb_way1_pred[1:0]
       or ipdp_ipctrl_btb_way0_pred[1:0])
begin
if(|way1_br_taken[7:6])
  way1_way_pred_taken[1:0] = ipdp_ipctrl_btb_way0_pred[1:0];
else if(|way1_br_taken[5:4])
  way1_way_pred_taken[1:0] = ipdp_ipctrl_btb_way1_pred[1:0];
else if(|way1_br_taken[3:2])
  way1_way_pred_taken[1:0] = ipdp_ipctrl_btb_way2_pred[1:0];
else if(|way1_br_taken[1:0])
  way1_way_pred_taken[1:0] = ipdp_ipctrl_btb_way3_pred[1:0];
else
  way1_way_pred_taken[1:0] = 2'b11;
// &CombEnd; @370
end

// &CombBeg; @372
always @( way0_br_ntake[7:4]
       or ipdp_ipctrl_btb_way2_pred[1:0]
       or ipdp_ipctrl_btb_way3_pred[1:0]
       or ipdp_ipctrl_btb_way1_pred[1:0]
       or ipdp_ipctrl_btb_way0_pred[1:0]
       or way0_br_ntake[3:0])
begin
if(|way0_br_ntake[7:6])
  way0_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way0_pred[1:0];
else if(|way0_br_ntake[5:4])
  way0_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way1_pred[1:0];
else if(|way0_br_ntake[3:2])
  way0_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way2_pred[1:0];
else if(|way0_br_ntake[1:0])
  way0_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way3_pred[1:0];
else
  way0_way_pred_ntake[1:0] = 2'b11;
// &CombEnd; @383
end

// &CombBeg; @385
always @( ipdp_ipctrl_btb_way2_pred[1:0]
       or ipdp_ipctrl_btb_way3_pred[1:0]
       or ipdp_ipctrl_btb_way1_pred[1:0]
       or ipdp_ipctrl_btb_way0_pred[1:0]
       or way1_br_ntake[7:0])
begin
if(|way1_br_ntake[7:6])
  way1_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way0_pred[1:0];
else if(|way1_br_ntake[5:4])
  way1_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way1_pred[1:0];
else if(|way1_br_ntake[3:2])
  way1_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way2_pred[1:0];
else if(|way1_br_ntake[1:0])
  way1_way_pred_ntake[1:0] = ipdp_ipctrl_btb_way3_pred[1:0];
else
  way1_way_pred_ntake[1:0] = 2'b11;
// &CombEnd; @396
end

assign way_pred[1:0] = (bht_result)
                       ? (icache_way0_hit)
                         ? way0_way_pred_taken[1:0]
                         : way1_way_pred_taken[1:0]
                       : (icache_way0_hit)
                         ? way0_way_pred_ntake[1:0]
                         : way1_way_pred_ntake[1:0];

//==========================================================
//                       L0 BTB Signal
//==========================================================
assign bht_data[1:0] = ipdp_ipctrl_bht_data[1:0];
assign l0_btb_hit  = ip_pcload && ip_chgflw_mask;                       
assign l0_btb_miss = (!ipdp_ipctrl_l0_btb_vld || ipdp_ipctrl_l0_btb_ras && ipdp_ipctrl_l0_btb_vld)
                  && ( 
                      branch_taken && (bht_data[1:0] == 2'b11) ||
                      branch_ntake
                     ) 
                  && l0_btb_ipctrl_st_wait
                  && ip_vld
                  && !ip_expt_vld;

assign l0_btb_mispred = ip_if_pcload
                        && !ipdp_ipctrl_l0_btb_ras
                        && !l0_btb_hit_l1_btb 
                        && ip_pcload 
                        && l0_btb_ipctrl_st_wait
                     || ip_chgflw_mistaken
                        && l0_btb_ipctrl_st_wait;

assign ipctrl_ipdp_l0_btb_hit = l0_btb_hit_l1_btb;

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    ipctrl_ibctrl_l0_btb_hit     <= 1'b0;
    ipctrl_ibctrl_l0_btb_miss    <= 1'b0;
    ipctrl_ibctrl_l0_btb_mispred <= 1'b0;
    ipctrl_ibctrl_l0_btb_st_wait <= 1'b0;
    ipctrl_ibctrl_ip_chgflw_vld  <= 1'b0;
    ipctrl_ibctrl_if_chgflw_vld  <= 1'b0;
  end
  else if(pcgen_ipctrl_pipe_cancel)
  begin
    ipctrl_ibctrl_l0_btb_hit     <= 1'b0;
    ipctrl_ibctrl_l0_btb_miss    <= 1'b0;
    ipctrl_ibctrl_l0_btb_mispred <= 1'b0;
    ipctrl_ibctrl_l0_btb_st_wait <= 1'b0;
    ipctrl_ibctrl_ip_chgflw_vld  <= 1'b0;
    ipctrl_ibctrl_if_chgflw_vld  <= 1'b0;
  end
  else if(!ibctrl_ipctrl_stall)
  begin
    ipctrl_ibctrl_l0_btb_hit     <= l0_btb_hit;
    ipctrl_ibctrl_l0_btb_miss    <= l0_btb_miss;
    ipctrl_ibctrl_l0_btb_mispred <= l0_btb_mispred;
    ipctrl_ibctrl_l0_btb_st_wait <= l0_btb_ipctrl_st_wait;
    ipctrl_ibctrl_ip_chgflw_vld  <= ipctrl_chgflw_vld;
    ipctrl_ibctrl_if_chgflw_vld  <= ifctrl_ipctrl_if_pcload;
  end
  else
  begin
    ipctrl_ibctrl_l0_btb_hit     <= ipctrl_ibctrl_l0_btb_hit;
    ipctrl_ibctrl_l0_btb_miss    <= ipctrl_ibctrl_l0_btb_miss;
    ipctrl_ibctrl_l0_btb_mispred <= ipctrl_ibctrl_l0_btb_mispred;
    ipctrl_ibctrl_l0_btb_st_wait <= ipctrl_ibctrl_l0_btb_st_wait;
    ipctrl_ibctrl_ip_chgflw_vld  <= ipctrl_ibctrl_ip_chgflw_vld;
    ipctrl_ibctrl_if_chgflw_vld  <= ipctrl_ibctrl_if_chgflw_vld;
  end
end 
// &Force("output","ipctrl_ibctrl_l0_btb_hit"); @470
// &Force("output","ipctrl_ibctrl_l0_btb_miss"); @471
// &Force("output","ipctrl_ibctrl_l0_btb_mispred"); @472
// &Force("output","ipctrl_ibctrl_l0_btb_st_wait"); @473
// &Force("output","ipctrl_ibctrl_ip_chgflw_vld"); @474
// &Force("output","ipctrl_ibctrl_if_chgflw_vld"); @475

//==========================================================
//                 IP Stage Valid Signal
//==========================================================
//-----------------------ip_vld-----------------------------
//IP Stage Valid:
//  1.ip_data_vld
//  2.!ip_cancel
//  3.!ip_self_stall
//    a.misalign bry stall
//    b.icache refill miss under miss stall
//    (c.more than one branch stall should not cancel ip_vld)
assign ip_vld = (ip_data_vld || ip_expt_vld) &&
                !icache_chk_err_refill &&
                !icache_chk_err_refill_ff && 
                !pcgen_ipctrl_cancel && 
                !ip_self_stall && 
                !rtu_ifu_xx_dbgon;

//mmu_ifu_deny is critical path,for timing consideration,
//we exclude mmu_deny from gate clk
assign ip_vld_for_gateclk = ifctrl_ipctrl_vld && 
                           !pcgen_ipctrl_cancel && 
                           !ip_self_stall && 
                           !rtu_ifu_xx_dbgon;
//when expt vld, h0 will not update                         
assign ip_h0_pipe_vld     = ip_data_vld && 
                           !icache_chk_err_refill &&
                           !icache_chk_err_refill_ff && 
                           !pcgen_ipctrl_cancel && 
                           !ip_self_stall && 
                           !rtu_ifu_xx_dbgon;

assign ip_expt_vld = ifctrl_ipctrl_vld && (ifdp_ipctrl_expt_vld || ipdp_ipctrl_ip_expt_vld);
assign ipctrl_bht_vld = ip_data_vld;
assign ipctrl_ipdp_h0_updt_gateclk_en = ip_data_vld || 
                                        ifctrl_ipctrl_vld && ifdp_ipctrl_expt_vld;
//-----------------------ip_data_vld------------------------              
//IP Stage Data Valid :
//  1.ifctrl_ipctrl_vld
//  2.Tag Hit
//    a.refill not on
//      if no expt
//      icache enable
//      mmu address cacheable
//      way0 or way1 hit & pre decode on
//    b.refill on
//      if no expt
//      way0 hit
assign ip_data_vld = ifctrl_ipctrl_vld && 
                     !ifdp_ipctrl_expt_vld && 
                     (
                       (
                         !ifdp_ipctrl_refill_on && 
                         ifdp_ipctrl_tsize && 
                         (icache_way0_hit  && ifdp_ipctrl_way_pred[0] || 
                          icache_way1_hit  && ifdp_ipctrl_way_pred[1])
                       ) || 
                       (
                          ifdp_ipctrl_refill_on && 
                          icache_way0_hit
                       )
                     );
//parity check(even check)

//hit signal generate
assign icache_way0_hit = ifdp_ipctrl_way0_28_24_hit && 
                         ifdp_ipctrl_way0_23_16_hit &&
                         ifdp_ipctrl_way0_15_8_hit && 
                         ifdp_ipctrl_way0_7_0_hit || 
                         ifdp_ipctrl_expt_vld; 
assign icache_way1_hit = ifdp_ipctrl_way1_28_24_hit && 
                         ifdp_ipctrl_way1_23_16_hit && 
                         ifdp_ipctrl_way1_15_8_hit &&
                         ifdp_ipctrl_way1_7_0_hit && 
                        !ifdp_ipctrl_expt_vld; 
assign icache_way0_hit_short = ifdp_ipctrl_way0_28_24_hit_dup && 
                               ifdp_ipctrl_way0_23_16_hit_dup &&
                               ifdp_ipctrl_way0_15_8_hit_dup && 
                               ifdp_ipctrl_way0_7_0_hit_dup || 
                               ifdp_ipctrl_expt_vld_dup; 

assign ipctrl_ipdp_icache_way0_hit       = icache_way0_hit;
assign ipctrl_ipdp_icache_way0_hit_short = icache_way0_hit_short;

always @(posedge forever_cpuclk or  negedge cpurst_b)
begin
  if(!cpurst_b)
    hit_cnt[2:0] <= 3'b011;
  else if(icache_way0_hit)
    hit_cnt[2:0] <= hit_cnt_sub[2:0];
  else if(icache_way1_hit)
    hit_cnt[2:0] <= hit_cnt_add[2:0];
  else
    hit_cnt[2:0] <= hit_cnt[2:0];
end
assign hit_cnt_sub[2:0] = (hit_cnt[2:0] == 3'b000)
                        ? 3'b000
                        : hit_cnt[2:0] - 3'b1;
assign hit_cnt_add[2:0] = (hit_cnt[2:0] == 3'b111)
                        ? 3'b111
                        : hit_cnt[2:0] + 3'b1;                        

assign ipctrl_pcgen_inner_way0 = (hit_cnt[2:0] == 3'b000);
assign ipctrl_pcgen_inner_way1 = (hit_cnt[2:0] == 3'b111);

//==========================================================
//                      ip_ib_vld
//==========================================================
always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ipctrl_ibctrl_vld <= 1'b0;
  else if(rtu_yy_xx_dbgon)
    ipctrl_ibctrl_vld <= had_ifu_ir_vld;
  else if(pcgen_ipctrl_pipe_cancel)
    ipctrl_ibctrl_vld <= 1'b0;
  else if(ibctrl_ipctrl_stall)
    ipctrl_ibctrl_vld <= ipctrl_ibctrl_vld;
  else
    ipctrl_ibctrl_vld <= ip_vld;
end                      
// &Force("output","ipctrl_ibctrl_vld"); @633
assign ipctrl_ibdp_vld = ipctrl_ibctrl_vld;

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if(!cpurst_b)
    ipctrl_ibctrl_expt_vld <= 1'b0;
  else if(rtu_yy_xx_dbgon)
    ipctrl_ibctrl_expt_vld <= 1'b0;
  else if(pcgen_ipctrl_pipe_cancel)
    ipctrl_ibctrl_expt_vld <= 1'b0;
  else if(ibctrl_ipctrl_stall)
    ipctrl_ibctrl_expt_vld <= ipctrl_ibctrl_expt_vld;
  else
    ipctrl_ibctrl_expt_vld <= ip_expt_vld;
end
// &Force("output","ipctrl_ibctrl_expt_vld"); @649
assign ipctrl_ibdp_expt_vld = ipctrl_ibctrl_expt_vld;
   
//==========================================================
//                 IP Stage Stall Signal
//==========================================================                      
//-----------------------ip_self_stall----------------------
assign ip_self_stall = bry_missigned_stall || 
                       miss_under_refill_stall;

//-------------------bry_missigned_stall--------------------
assign bry_missigned_stall = missigned_bry_update_vld; 

//----------------miss_under_refill_stall-------------------
//l1_refill_ipctrl_busy means l1_refill SM not on IDLE and current refill
//can not be accepted                 
assign miss_under_refill_stall = (ip_refill_pre || icache_chk_err_refill_ff) && 
                                 l1_refill_ipctrl_busy;


//----------------cache refill pre---------------------------
// &Instance("gated_clk_cell","x_parity_err_clk"); @687
// &Connect( .clk_in         (forever_cpuclk), @688
//           .clk_out        (parity_err_clk),//Out Clock @689
//           .external_en    (1'b0), @690
//           .global_en      (cp0_yy_clk_en), @691
//           .local_en       (parity_err_clk_en),//Local Condition @692
//           .module_en      (cp0_ifu_icg_en) @693
//         ); @694
//only valid when configure L1_CACHE_ECC
assign icache_chk_err_refill    = 1'b0;
assign icache_chk_err_refill_ff = 1'b0;

assign ip_refill_pre = ifctrl_ipctrl_vld && 
                       !ifdp_ipctrl_expt_vld &&
                       (
                         (
                           !ifdp_ipctrl_refill_on && 
                           !(
                              ifdp_ipctrl_tsize && 
                              (icache_way0_hit || icache_way1_hit)
                            )
                         ) || 
                         (
                           ifdp_ipctrl_refill_on && 
                           !icache_way0_hit
                         )
                       );

//-----------------br_more_than_one_stall-------------------
//more than one conditional branch
//stall one cycle to guarantee one cycle process on con_br
assign br_more_than_one_stall = masked_bry_update_vld;

assign ipctrl_ifctrl_stall_short = ibctrl_ipctrl_stall || 
                                   bry_missigned_stall || 
                                   miss_under_refill_stall;
assign ipctrl_ifctrl_stall = //ifctrl_ipctrl_vld && 
                             ibctrl_ipctrl_stall || 
                             bry_missigned_stall || 
                             miss_under_refill_stall || 
                             br_more_than_one_stall;
assign ipctrl_ifctrl_bht_stall = ibctrl_ipctrl_stall || 
                                 bry_missigned_stall || 
                                 miss_under_refill_stall;
// &Force("output","ipctrl_ifctrl_stall"); @792
assign ipctrl_pcgen_if_stall  = ipctrl_ifctrl_stall;
assign ipctrl_ifdp_gateclk_en = !ibctrl_ipctrl_stall;

//==========================================================
//             IP Stage ICache Refill Signal
//==========================================================
assign ip_icache_refill          = (ip_refill_pre && 
                                    !ipdp_ipctrl_ip_expt_vld &&
                                    !icache_chk_err_refill ||
                                    icache_chk_err_refill_ff
                                   ) && 
                                   !l1_refill_ipctrl_busy && 
                                   !(
                                      cp0_ifu_no_op_req && 
                                      ibctrl_ipctrl_low_power_stall
                                    );
assign ipctrl_l1_refill_req_for_gateclk =  (ip_refill_pre || 
                                            icache_chk_err_refill_ff
                                           ) && 
                                           !l1_refill_ipctrl_busy && 
                                           !(
                                              cp0_ifu_no_op_req && 
                                              ibctrl_ipctrl_low_power_stall
                                            );
// &Force("output","ipctrl_l1_refill_vpc"); @825
// &Force("output","ipctrl_l1_refill_fifo"); @826
assign ipctrl_l1_refill_vpc[PC_WIDTH-2:0] = ipdp_ipctrl_vpc[PC_WIDTH-2:0];
assign ipctrl_l1_refill_ppc[PC_WIDTH-2:0] = {ifdp_ipctrl_pa[27:0],ipdp_ipctrl_vpc[10:0]};
assign ipctrl_l1_refill_fifo              = 1'b0;
assign ipctrl_l1_refill_miss_req = ip_icache_refill;
assign ipctrl_l1_refill_chk_err  = icache_chk_err_refill_ff; //for parity check error
assign icache_refill_reissue     = (ip_refill_pre || icache_chk_err_refill_ff) && 
                                   !l1_refill_ipctrl_busy;


//==========================================================
//             IP Stage Way Mispred Reissue
//==========================================================
//Tag Hit while Way pred not on
//Which condition should reissue and read another way
assign way_mispred_reissue = ifctrl_ipctrl_vld && 
                             (
                               !ifdp_ipctrl_refill_on && 
                               !ifdp_ipctrl_expt_vld && 
                               ifdp_ipctrl_tsize && 
                               (icache_way0_hit && !ifdp_ipctrl_way_pred[0] || 
                                icache_way1_hit && !ifdp_ipctrl_way_pred[1])
                             );
assign way_mispred_reissue_way_pred[1:0] = {icache_way1_hit, icache_way0_hit};

//==========================================================
//                    Bry Information
//==========================================================
//--------------------Missigned Bry-------------------------
assign bry_vld_32[7:0]  = ipdp_ipctrl_inst_32[7:0];
assign vpc_onehot[7:0]  = ifdp_ipctrl_vpc_2_0_onehot[7:0];
//Re decode bry information
//Sequence Read will not cause bry missigned
//Thus only Re decode bry under chgflw
assign missigned_bry_vld[7] = 1'b1; //H1 always be 1
assign missigned_bry_vld[6] = (vpc_onehot[6])
                            ? 1'b1 
                            : !(bry_vld_32[7] & missigned_bry_vld[7]);
assign missigned_bry_vld[5] = (vpc_onehot[5])
                            ? 1'b1 
                            : !(bry_vld_32[6] & missigned_bry_vld[6]);
assign missigned_bry_vld[4] = (vpc_onehot[4])
                            ? 1'b1 
                            : !(bry_vld_32[5] & missigned_bry_vld[5]);
assign missigned_bry_vld[3] = (vpc_onehot[3])
                            ? 1'b1 
                            : !(bry_vld_32[4] & missigned_bry_vld[4]);
assign missigned_bry_vld[2] = (vpc_onehot[2])
                            ? 1'b1 
                            : !(bry_vld_32[3] & missigned_bry_vld[3]);
assign missigned_bry_vld[1] = (vpc_onehot[1])
                            ? 1'b1 
                            : !(bry_vld_32[2] & missigned_bry_vld[2]);
assign missigned_bry_vld[0] = (vpc_onehot[0])
                            ? 1'b1 
                            : !(bry_vld_32[1] & missigned_bry_vld[1]);
//missigned bry infor                            
assign missigned_bry[7:0]   = missigned_bry_vld[7:0] & 
                              ifdp_ipctrl_vpc_bry_mask[7:0];
//missigned bry predecode infor
assign w0b0_br_taken_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w0_br[7:0];
assign w0b1_br_taken_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w0_br[7:0];
assign w1b0_br_taken_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w1_br[7:0];
assign w1b1_br_taken_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w1_br[7:0];
assign w0b0_br_ntake_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w0_ab_br[7:0];
assign w0b1_br_ntake_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w0_ab_br[7:0];
assign w1b0_br_ntake_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w1_ab_br[7:0];
assign w1b1_br_ntake_missigned[7:0] = missigned_bry[7:0] & ipdp_ipctrl_w1_ab_br[7:0];

//missigned bry hit 
//when missigned happen, bry0 and bry1 shall be same,so all bry shall hit
assign way0_bry_hit_missigned = 1'b1;
assign way1_bry_hit_missigned = 1'b1;

assign missigned_bry_update_vld = ip_data_vld && 
                                 (!h0_vld && !bry0_hit&& !bry1_hit);

//When  H0_vld, Select Bry0, 
//Thus (Hn_Bry[7] | H0_vld) will not affect Bry Select Result
//When !H0_vld, Selcet Bry1 when Target Half Bry1 is 1
assign h0_vld                   = ipdp_ipctrl_h0_vld;                                

//----------------------Masked Bry--------------------------
assign masked_bry_update_vld = ip_data_vld && 
                               !bht_result && 
                               con_br_first_branch && 
                               con_br_more_than_one;
assign con_br_first_branch  = ipdp_ipctrl_con_br_first_branch;
assign con_br_more_than_one = ipdp_ipctrl_con_br_more_than_one;

//----------------------Update Bry--------------------------
//Merge Missigned Bry and Masked Bry into bry_update_data         
assign ipctrl_ifdp_vpc_onehot_updt[7:0]    = (ibctrl_ipctrl_stall || ip_expt_vld)
                                             ? ifdp_ipctrl_vpc_2_0_onehot[7:0]
                                             : (missigned_bry_update_vld)
                                               ? vpc_onehot[7:0]
                                               : vpc_onehot_masked_bry_update[7:0]; 
assign ipctrl_ifdp_w0b0_bry_updt_data[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0b0_bry_data[7:0]
                                             : (missigned_bry_update_vld)
                                               ? missigned_bry[7:0]
                                               : w0b0_bry_data_masked[7:0];
assign ipctrl_ifdp_w0b1_bry_updt_data[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0b1_bry_data[7:0]
                                             : (missigned_bry_update_vld)
                                               ? missigned_bry[7:0]
                                               : w0b1_bry_data_masked[7:0];
assign ipctrl_ifdp_w1b0_bry_updt_data[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1b0_bry_data[7:0]
                                             : (missigned_bry_update_vld)
                                               ? missigned_bry[7:0]
                                               : w1b0_bry_data_masked[7:0];
assign ipctrl_ifdp_w1b1_bry_updt_data[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1b1_bry_data[7:0]
                                             : (missigned_bry_update_vld)
                                               ? missigned_bry[7:0]
                                               : w1b1_bry_data_masked[7:0];
assign ipctrl_ifdp_w0b0_br_taken_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0b0_br_taken[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w0b0_br_taken_missigned[7:0]
                                               : w0b0_br_taken_masked[7:0];
assign ipctrl_ifdp_w0b1_br_taken_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0b1_br_taken[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w0b1_br_taken_missigned[7:0]
                                               : w0b1_br_taken_masked[7:0];
assign ipctrl_ifdp_w1b0_br_taken_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1b0_br_taken[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w1b0_br_taken_missigned[7:0]
                                               : w1b0_br_taken_masked[7:0];
assign ipctrl_ifdp_w1b1_br_taken_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1b1_br_taken[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w1b1_br_taken_missigned[7:0]
                                               : w1b1_br_taken_masked[7:0];
assign ipctrl_ifdp_w0b0_br_ntake_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0b0_br_ntake[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w0b0_br_ntake_missigned[7:0]
                                               : w0b0_br_ntake_masked[7:0];
assign ipctrl_ifdp_w0b1_br_ntake_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0b1_br_ntake[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w0b1_br_ntake_missigned[7:0]
                                               : w0b1_br_ntake_masked[7:0];
assign ipctrl_ifdp_w1b0_br_ntake_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1b0_br_ntake[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w1b0_br_ntake_missigned[7:0]
                                               : w1b0_br_ntake_masked[7:0];
assign ipctrl_ifdp_w1b1_br_ntake_updt[7:0] = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1b1_br_ntake[7:0]
                                             : (missigned_bry_update_vld)
                                               ? w1b1_br_ntake_missigned[7:0]
                                               : w1b1_br_ntake_masked[7:0];

assign ipctrl_ifdp_w0_bry0_hit_updt        = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0_bry0_hit
                                             : (missigned_bry_update_vld)
                                               ? way0_bry_hit_missigned
                                               : w0b0_bry_hit_masked;
assign ipctrl_ifdp_w0_bry1_hit_updt        = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w0_bry1_hit
                                             : (missigned_bry_update_vld)
                                               ? way0_bry_hit_missigned
                                               : w0b1_bry_hit_masked;
assign ipctrl_ifdp_w1_bry0_hit_updt        = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1_bry0_hit
                                             : (missigned_bry_update_vld)
                                               ? way1_bry_hit_missigned
                                               : w1b0_bry_hit_masked;
assign ipctrl_ifdp_w1_bry1_hit_updt        = (ibctrl_ipctrl_stall)
                                             ? ifdp_ipctrl_w1_bry1_hit
                                             : (missigned_bry_update_vld)
                                               ? way1_bry_hit_missigned
                                               : w1b1_bry_hit_masked;


assign inst_32[7:0] = ipdp_ipctrl_inst_32[7:0];
// &CombBeg; @1010
always @( ip_con_br[7:0]
       or inst_32[7:1])
begin
casez(ip_con_br[7:0])
   8'b1??????? :  vpc_onehot_masked_bry_update[7:0] = (inst_32[7]) 
                                                    ? 8'b00100000 
                                                    : 8'b01000000;
   8'b01?????? :  vpc_onehot_masked_bry_update[7:0] = (inst_32[6]) 
                                                    ? 8'b00010000 
                                                    : 8'b00100000;
   8'b001????? :  vpc_onehot_masked_bry_update[7:0] = (inst_32[5]) 
                                                    ? 8'b00001000 
                                                    : 8'b00010000;
   8'b0001???? :  vpc_onehot_masked_bry_update[7:0] = (inst_32[4]) 
                                                    ? 8'b00000100 
                                                    : 8'b00001000;
   8'b00001??? :  vpc_onehot_masked_bry_update[7:0] = (inst_32[3]) 
                                                    ? 8'b00000010 
                                                    : 8'b00000100;
   8'b000001?? :  vpc_onehot_masked_bry_update[7:0] = (inst_32[2]) 
                                                    ? 8'b00000001 
                                                    : 8'b00000010;
   8'b0000001? :  vpc_onehot_masked_bry_update[7:0] = (inst_32[1]) 
                                                    ? 8'b00000000 
                                                    : 8'b00000001;
   default     :  vpc_onehot_masked_bry_update[7:0] = 8'b00000000;
endcase
// &CombEnd; @1035
end

// &CombBeg; @1037
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w0b0_bry_data[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b0111_1111;
  8'b01?????? : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b0011_1111;
  8'b001????? : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b0001_1111;
  8'b0001???? : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b0000_1111;
  8'b00001??? : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b0000_0111;
  8'b000001?? : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b0000_0011;
  8'b0000001? : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b0000_0001;
  default     : w0b0_bry_data_masked[7:0] = ifdp_ipctrl_w0b0_bry_data[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1048
end

// &CombBeg; @1050
always @( ifdp_ipctrl_w0b1_bry_data[7:0]
       or ip_con_br[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b0111_1111;
  8'b01?????? : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b0011_1111;
  8'b001????? : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b0001_1111;
  8'b0001???? : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b0000_1111;
  8'b00001??? : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b0000_0111;
  8'b000001?? : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b0000_0011;
  8'b0000001? : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b0000_0001;
  default     : w0b1_bry_data_masked[7:0] = ifdp_ipctrl_w0b1_bry_data[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1061
end

// &CombBeg; @1063
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w1b0_bry_data[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b0111_1111;
  8'b01?????? : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b0011_1111;
  8'b001????? : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b0001_1111;
  8'b0001???? : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b0000_1111;
  8'b00001??? : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b0000_0111;
  8'b000001?? : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b0000_0011;
  8'b0000001? : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b0000_0001;
  default     : w1b0_bry_data_masked[7:0] = ifdp_ipctrl_w1b0_bry_data[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1074
end

// &CombBeg; @1076
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w1b1_bry_data[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b0111_1111;
  8'b01?????? : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b0011_1111;
  8'b001????? : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b0001_1111;
  8'b0001???? : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b0000_1111;
  8'b00001??? : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b0000_0111;
  8'b000001?? : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b0000_0011;
  8'b0000001? : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b0000_0001;
  default     : w1b1_bry_data_masked[7:0] = ifdp_ipctrl_w1b1_bry_data[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1087
end


// &CombBeg; @1090
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w0b0_br_taken[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b0111_1111;
  8'b01?????? : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b0011_1111;
  8'b001????? : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b0001_1111;
  8'b0001???? : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b0000_1111;
  8'b00001??? : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b0000_0111;
  8'b000001?? : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b0000_0011;
  8'b0000001? : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b0000_0001;
  default     : w0b0_br_taken_masked[7:0] = ifdp_ipctrl_w0b0_br_taken[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1101
end

// &CombBeg; @1103
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w0b1_br_taken[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b0111_1111;
  8'b01?????? : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b0011_1111;
  8'b001????? : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b0001_1111;
  8'b0001???? : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b0000_1111;
  8'b00001??? : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b0000_0111;
  8'b000001?? : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b0000_0011;
  8'b0000001? : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b0000_0001;
  default     : w0b1_br_taken_masked[7:0] = ifdp_ipctrl_w0b1_br_taken[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1114
end

// &CombBeg; @1116
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w1b0_br_taken[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b0111_1111;
  8'b01?????? : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b0011_1111;
  8'b001????? : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b0001_1111;
  8'b0001???? : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b0000_1111;
  8'b00001??? : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b0000_0111;
  8'b000001?? : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b0000_0011;
  8'b0000001? : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b0000_0001;
  default     : w1b0_br_taken_masked[7:0] = ifdp_ipctrl_w1b0_br_taken[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1127
end

// &CombBeg; @1129
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w1b1_br_taken[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b0111_1111;
  8'b01?????? : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b0011_1111;
  8'b001????? : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b0001_1111;
  8'b0001???? : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b0000_1111;
  8'b00001??? : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b0000_0111;
  8'b000001?? : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b0000_0011;
  8'b0000001? : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b0000_0001;
  default     : w1b1_br_taken_masked[7:0] = ifdp_ipctrl_w1b1_br_taken[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1140
end

// &CombBeg; @1142
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w0b0_br_ntake[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b0111_1111;
  8'b01?????? : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b0011_1111;
  8'b001????? : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b0001_1111;
  8'b0001???? : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b0000_1111;
  8'b00001??? : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b0000_0111;
  8'b000001?? : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b0000_0011;
  8'b0000001? : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b0000_0001;
  default     : w0b0_br_ntake_masked[7:0] = ifdp_ipctrl_w0b0_br_ntake[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1153
end

// &CombBeg; @1155
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w0b1_br_ntake[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b0111_1111;
  8'b01?????? : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b0011_1111;
  8'b001????? : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b0001_1111;
  8'b0001???? : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b0000_1111;
  8'b00001??? : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b0000_0111;
  8'b000001?? : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b0000_0011;
  8'b0000001? : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b0000_0001;
  default     : w0b1_br_ntake_masked[7:0] = ifdp_ipctrl_w0b1_br_ntake[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1166
end

// &CombBeg; @1168
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w1b0_br_ntake[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b0111_1111;
  8'b01?????? : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b0011_1111;
  8'b001????? : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b0001_1111;
  8'b0001???? : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b0000_1111;
  8'b00001??? : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b0000_0111;
  8'b000001?? : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b0000_0011;
  8'b0000001? : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b0000_0001;
  default     : w1b0_br_ntake_masked[7:0] = ifdp_ipctrl_w1b0_br_ntake[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1179
end

// &CombBeg; @1181
always @( ip_con_br[7:0]
       or ifdp_ipctrl_w1b1_br_ntake[7:0])
begin
casez(ip_con_br[7:0])
  8'b1??????? : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b0111_1111;
  8'b01?????? : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b0011_1111;
  8'b001????? : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b0001_1111;
  8'b0001???? : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b0000_1111;
  8'b00001??? : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b0000_0111;
  8'b000001?? : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b0000_0011;
  8'b0000001? : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b0000_0001;
  default     : w1b1_br_ntake_masked[7:0] = ifdp_ipctrl_w1b1_br_ntake[7:0] & 8'b1111_1111;
endcase
// &CombEnd; @1192
end


//bry
assign w0b0_bry_hit_masked = ifdp_ipctrl_w0_bry0_hit || h0_vld;
assign w0b1_bry_hit_masked = ifdp_ipctrl_w0_bry1_hit && !h0_vld;
assign w1b0_bry_hit_masked = ifdp_ipctrl_w1_bry0_hit || h0_vld;
assign w1b1_bry_hit_masked = ifdp_ipctrl_w1_bry1_hit && !h0_vld;

// &CombBeg; @1202
always @( ip_con_br[7:0]
       or inst_32[7:1])
begin
casez(ip_con_br[7:0])
   8'b1??????? :  ip_vpc_next[2:0] = (inst_32[7])
                                   ? 3'b010
                                   : 3'b001; 
   8'b01?????? :  ip_vpc_next[2:0] = (inst_32[6])
                                   ? 3'b011
                                   : 3'b010; 
   8'b001????? :  ip_vpc_next[2:0] = (inst_32[5]) 
                                   ? 3'b100
                                   : 3'b011; 
   8'b0001???? :  ip_vpc_next[2:0] = (inst_32[4]) 
                                   ? 3'b101
                                   : 3'b100; 
   8'b00001??? :  ip_vpc_next[2:0] = (inst_32[3]) 
                                   ? 3'b110
                                   : 3'b101; 
   8'b000001?? :  ip_vpc_next[2:0] = (inst_32[2]) 
                                   ? 3'b111
                                   : 3'b110; 
   8'b0000001? :  ip_vpc_next[2:0] = (inst_32[1]) 
                                   ? 3'b000
                                   : 3'b111; 
   default     :  ip_vpc_next[2:0] = 3'b000;
endcase
// &CombEnd; @1227
end

//==========================================================
//                Interface with PCGEN
//==========================================================
assign ipctrl_pcgen_reissue_pcload        = way_mispred_reissue || 
                                            icache_refill_reissue;
assign ipctrl_pcgen_reissue_way_pred[1:0] = (way_mispred_reissue)
                                          ? way_mispred_reissue_way_pred[1:0] 
                                          : 2'b11;
assign ipctrl_pcgen_reissue_pc[PC_WIDTH-2:0] = ipdp_ipctrl_vpc[PC_WIDTH-2:0];
assign ipctrl_pcgen_chk_err_reissue          = 1'b0;
assign ipctrl_pcgen_chgflw_pcload            = ipctrl_chgflw_vld;
assign ipctrl_pcgen_chgflw_pc[PC_WIDTH-2:0]  = chgflw_pc[PC_WIDTH-2:0];
assign ipctrl_pcgen_branch_taken             = ipctrl_branch_taken;
assign ipctrl_pcgen_branch_mistaken          = ipctrl_branch_mistaken;
assign ipctrl_pcgen_taken_pc[PC_WIDTH-2:0]   = {{ipdp_ipctrl_vpc[PC_WIDTH-2:20],chgflw_pc_low[19:0]}};
assign ipctrl_pcgen_chgflw_way_pred[1:0]     = (ip_chgflw_mistaken)
                                             ? 2'b11
                                             : way_pred[1:0];
assign ipctrl_pcgen_inner_way_pred[1:0]      = {icache_way1_hit, 
                                                icache_way0_hit};
assign ipctrl_pcgen_h0_vld                   = h0_vld;

//==========================================================
//                 Interface with ipdp
//==========================================================
//assign ipctrl_ipdp_chgflw = ipctrl_chgflw_vld; 
assign ipctrl_ipdp_vpc_onehot[7:0] = vpc_onehot[7:0];
assign ipctrl_ipdp_vpc_mask[7:0]   = ifdp_ipctrl_vpc_bry_mask[7:0];
assign ipctrl_ipdp_br_more_than_one_stall  = br_more_than_one_stall;
assign ipctrl_ipdp_pipe_vld_for_gateclk    = ip_vld_for_gateclk;
assign ipctrl_ipdp_pipe_vld      = ip_vld;
assign ipctrl_ipdp_bht_vld       = ip_data_vld && 
                                   !pcgen_ipctrl_cancel && 
                                   !miss_under_refill_stall &&
                                   !rtu_ifu_xx_dbgon;
assign ipctrl_ipdp_h0_update_vld = ip_h0_pipe_vld;
assign ipctrl_ipdp_pipe_stall  = ibctrl_ipctrl_stall;
assign ipctrl_ipdp_self_stall  = ip_self_stall; 
assign ipctrl_ipdp_pipe_cancel = pcgen_ipctrl_pipe_cancel;
assign ipctrl_ipdp_ip_pcload   = ip_pcload;
assign ipctrl_ipdp_chgflw_pc[PC_WIDTH-2:0] = chgflw_pc[PC_WIDTH-2:0];
assign ipctrl_ipdp_ip_data_vld   = ip_data_vld && 
                                   !pcgen_ipctrl_cancel && 
                                   !miss_under_refill_stall &&
                                   !rtu_ifu_xx_dbgon;
assign ipctrl_ipdp_con_br      =  |ip_con_br[7:0]; 
assign ipctrl_ipdp_if_pcload   = ip_if_pcload;
assign ipctrl_ipdp_ip_mistaken = ip_chgflw_mistaken;
assign ipctrl_ipdp_vpc_next[2:0] = ip_vpc_next[2:0];

//==========================================================
//                  Interface with BHT
//==========================================================
assign con_br_vld              = con_br_first_branch && 
                                 ip_data_vld && 
                                 !pcgen_ipctrl_cancel && 
                                 !ibctrl_ipctrl_stall;
assign ipctrl_bht_con_br_vld   = con_br_vld;                               
assign ipctrl_bht_con_br_taken = bht_result;
assign ipctrl_bht_more_br      = con_br_more_than_one &&
                                 !bht_result          &&
                                 ip_data_vld;
assign ipctrl_bht_con_br_gateclk_en = con_br_first_branch && 
                                      ip_data_vld && 
                                      cp0_ifu_bht_en;

//==========================================================
//               Interface with IND_BTB
//==========================================================
//For timing consider,
//not use con_br_first_branch as judge condition
assign ipctrl_ind_btb_con_br_vld   = (|ip_con_br[7:0]) && 
                                     ip_data_vld;

//==========================================================
//                Interface with BTB
//==========================================================
assign ipctrl_btb_chgflw_vld     = ipctrl_chgflw_vld;
assign ipctrl_btb_way_pred_error = way_mispred_reissue;
//if way0 or way1 hit, use way hit infor
//if way0 and way1 both not hit, use fifo infor
//   fifo means the way to be fill
assign ipctrl_btb_way_pred[1:0]    = (!icache_way1_hit && !icache_way0_hit || 
                                      icache_way0_hit && ifdp_ipctrl_refill_on)
                                   ? {ifdp_ipctrl_fifo, ~ifdp_ipctrl_fifo} 
                                   : {icache_way1_hit, icache_way0_hit};
//l0 btb          
assign ipctrl_l0_btb_chgflw_vld    = ipctrl_chgflw_vld;
assign ipctrl_l0_btb_ip_vld        = ip_vld;
//two situation will make l0 btb FSM wait next line
//1. h8 is branch inst
//2. ip stage contains no branch,but the valid vpc is at h5-h8
assign ipctrl_l0_btb_wait_next     = (ipdp_ipctrl_h8_br 
                                      || ipdp_ipctrl_no_br && (|vpc_onehot[3:0])
                                      || br_more_than_one_stall)
                                  && ip_data_vld
                                  && !pcgen_ipctrl_cancel
                                  && !ip_self_stall
                                  && !rtu_ifu_xx_dbgon;                         


// &Force("nonport","ipctrl_h0_from_pbuf"); @1385
// &Force("nonport","ipctrl_h0_from_biu"); @1386
// &Force("nonport","ipctrl_h0_from_cache"); @1387
// &Force("nonport","ipctrl_cache_en"); @1388
// &Force("nonport","ipctrl_ca"); @1389
// &Force("nonport","ipchgflw_hit"); @1390

//Debug_infor
assign ipctrl_debug_ip_if_stall             = ipctrl_ifctrl_stall;
assign ipctrl_debug_bry_missigned_stall     = bry_missigned_stall;
assign ipctrl_debug_miss_under_refill_stall = miss_under_refill_stall;
assign ipctrl_debug_ip_expt_vld             = ip_expt_vld;
//assign ipctrl_debug_mmu_deny_vld            = ipdp_ipctrl_mmu_deny;
assign ipctrl_debug_ip_vld                  = ip_vld;
assign ipctrl_debug_h0_vld                  = h0_vld;

// &ModuleEnd; @1402
endmodule


