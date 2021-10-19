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
module ct_ifu_lbuf(
  bht_lbuf_pre_ntaken_result,
  bht_lbuf_pre_taken_result,
  bht_lbuf_vghr,
  cp0_ifu_icg_en,
  cp0_ifu_lbuf_en,
  cp0_ifu_vl,
  cp0_ifu_vsetvli_pred_disable,
  cp0_ifu_vsetvli_pred_mode,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  ibctrl_lbuf_bju_mispred,
  ibctrl_lbuf_create_vld,
  ibctrl_lbuf_flush,
  ibctrl_lbuf_retire_vld,
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
  ibuf_lbuf_empty,
  ifctrl_lbuf_ins_inv_on,
  ifctrl_lbuf_inv_req,
  ipdp_lbuf_vl_reg,
  ipdp_lbuf_vlmul_reg,
  ipdp_lbuf_vsew_reg,
  iu_ifu_bht_check_vld,
  iu_ifu_bht_condbr_taken,
  iu_ifu_chgflw_vld,
  iu_ifu_cur_pc,
  lbuf_addrgen_active_state,
  lbuf_addrgen_cache_state,
  lbuf_addrgen_chgflw_mask,
  lbuf_bht_active_state,
  lbuf_bht_con_br_taken,
  lbuf_bht_con_br_vld,
  lbuf_debug_st,
  lbuf_ibctrl_active_idle_flush,
  lbuf_ibctrl_chgflw_pc,
  lbuf_ibctrl_chgflw_pred,
  lbuf_ibctrl_chgflw_vl,
  lbuf_ibctrl_chgflw_vld,
  lbuf_ibctrl_chgflw_vlmul,
  lbuf_ibctrl_chgflw_vsew,
  lbuf_ibctrl_lbuf_active,
  lbuf_ibctrl_stall,
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
  lbuf_ipdp_lbuf_active,
  lbuf_ipdp_updt_vl,
  lbuf_ipdp_updt_vlmul,
  lbuf_ipdp_updt_vsew,
  lbuf_ipdp_vtype_updt_vld,
  lbuf_pcfifo_if_create_select,
  lbuf_pcfifo_if_inst_bht_pre_result,
  lbuf_pcfifo_if_inst_bht_sel_result,
  lbuf_pcfifo_if_inst_cur_pc,
  lbuf_pcfifo_if_inst_pc_oper,
  lbuf_pcfifo_if_inst_target_pc,
  lbuf_pcfifo_if_inst_vghr,
  lbuf_pcgen_active,
  lbuf_pcgen_vld_mask,
  pad_yy_icg_scan_en
);

// &Ports; @23
input   [31:0]  bht_lbuf_pre_ntaken_result;               
input   [31:0]  bht_lbuf_pre_taken_result;                
input   [21:0]  bht_lbuf_vghr;                            
input           cp0_ifu_icg_en;                           
input           cp0_ifu_lbuf_en;                          
input   [7 :0]  cp0_ifu_vl;                               
input           cp0_ifu_vsetvli_pred_disable;             
input           cp0_ifu_vsetvli_pred_mode;                
input           cp0_yy_clk_en;                            
input           cpurst_b;                                 
input           forever_cpuclk;                           
input           ibctrl_lbuf_bju_mispred;                  
input           ibctrl_lbuf_create_vld;                   
input           ibctrl_lbuf_flush;                        
input           ibctrl_lbuf_retire_vld;                   
input   [1 :0]  ibdp_lbuf_bht_sel_array_result;           
input   [38:0]  ibdp_lbuf_con_br_cur_pc;                  
input   [3 :0]  ibdp_lbuf_con_br_half_num;                
input           ibdp_lbuf_con_br_inst_32;                 
input   [20:0]  ibdp_lbuf_con_br_offset;                  
input           ibdp_lbuf_con_br_taken;                   
input   [7 :0]  ibdp_lbuf_con_br_vl;                      
input   [1 :0]  ibdp_lbuf_con_br_vlmul;                   
input   [2 :0]  ibdp_lbuf_con_br_vsew;                    
input           ibdp_lbuf_h0_32_start;                    
input           ibdp_lbuf_h0_bkpta;                       
input           ibdp_lbuf_h0_bkptb;                       
input           ibdp_lbuf_h0_con_br;                      
input   [15:0]  ibdp_lbuf_h0_data;                        
input           ibdp_lbuf_h0_fence;                       
input   [2 :0]  ibdp_lbuf_h0_split0_type;                 
input   [2 :0]  ibdp_lbuf_h0_split1_type;                 
input   [7 :0]  ibdp_lbuf_h0_vl;                          
input           ibdp_lbuf_h0_vld;                         
input   [1 :0]  ibdp_lbuf_h0_vlmul;                       
input           ibdp_lbuf_h0_vsetvli;                     
input   [2 :0]  ibdp_lbuf_h0_vsew;                        
input   [15:0]  ibdp_lbuf_h1_data;                        
input   [2 :0]  ibdp_lbuf_h1_split0_type;                 
input   [2 :0]  ibdp_lbuf_h1_split1_type;                 
input   [7 :0]  ibdp_lbuf_h1_vl;                          
input   [1 :0]  ibdp_lbuf_h1_vlmul;                       
input   [2 :0]  ibdp_lbuf_h1_vsew;                        
input   [15:0]  ibdp_lbuf_h2_data;                        
input   [2 :0]  ibdp_lbuf_h2_split0_type;                 
input   [2 :0]  ibdp_lbuf_h2_split1_type;                 
input   [7 :0]  ibdp_lbuf_h2_vl;                          
input   [1 :0]  ibdp_lbuf_h2_vlmul;                       
input   [2 :0]  ibdp_lbuf_h2_vsew;                        
input   [15:0]  ibdp_lbuf_h3_data;                        
input   [2 :0]  ibdp_lbuf_h3_split0_type;                 
input   [2 :0]  ibdp_lbuf_h3_split1_type;                 
input   [7 :0]  ibdp_lbuf_h3_vl;                          
input   [1 :0]  ibdp_lbuf_h3_vlmul;                       
input   [2 :0]  ibdp_lbuf_h3_vsew;                        
input   [15:0]  ibdp_lbuf_h4_data;                        
input   [2 :0]  ibdp_lbuf_h4_split0_type;                 
input   [2 :0]  ibdp_lbuf_h4_split1_type;                 
input   [7 :0]  ibdp_lbuf_h4_vl;                          
input   [1 :0]  ibdp_lbuf_h4_vlmul;                       
input   [2 :0]  ibdp_lbuf_h4_vsew;                        
input   [15:0]  ibdp_lbuf_h5_data;                        
input   [2 :0]  ibdp_lbuf_h5_split0_type;                 
input   [2 :0]  ibdp_lbuf_h5_split1_type;                 
input   [7 :0]  ibdp_lbuf_h5_vl;                          
input   [1 :0]  ibdp_lbuf_h5_vlmul;                       
input   [2 :0]  ibdp_lbuf_h5_vsew;                        
input   [15:0]  ibdp_lbuf_h6_data;                        
input   [2 :0]  ibdp_lbuf_h6_split0_type;                 
input   [2 :0]  ibdp_lbuf_h6_split1_type;                 
input   [7 :0]  ibdp_lbuf_h6_vl;                          
input   [1 :0]  ibdp_lbuf_h6_vlmul;                       
input   [2 :0]  ibdp_lbuf_h6_vsew;                        
input   [15:0]  ibdp_lbuf_h7_data;                        
input   [2 :0]  ibdp_lbuf_h7_split0_type;                 
input   [2 :0]  ibdp_lbuf_h7_split1_type;                 
input   [7 :0]  ibdp_lbuf_h7_vl;                          
input   [1 :0]  ibdp_lbuf_h7_vlmul;                       
input   [2 :0]  ibdp_lbuf_h7_vsew;                        
input   [15:0]  ibdp_lbuf_h8_data;                        
input   [2 :0]  ibdp_lbuf_h8_split0_type;                 
input   [2 :0]  ibdp_lbuf_h8_split1_type;                 
input   [7 :0]  ibdp_lbuf_h8_vl;                          
input   [1 :0]  ibdp_lbuf_h8_vlmul;                       
input   [2 :0]  ibdp_lbuf_h8_vsew;                        
input   [3 :0]  ibdp_lbuf_half_vld_num;                   
input   [7 :0]  ibdp_lbuf_hn_32_start;                    
input   [7 :0]  ibdp_lbuf_hn_auipc;                       
input   [7 :0]  ibdp_lbuf_hn_bkpta;                       
input   [7 :0]  ibdp_lbuf_hn_bkptb;                       
input   [7 :0]  ibdp_lbuf_hn_chgflw;                      
input   [7 :0]  ibdp_lbuf_hn_con_br;                      
input   [7 :0]  ibdp_lbuf_hn_fence;                       
input   [7 :0]  ibdp_lbuf_hn_vld;                         
input   [7 :0]  ibdp_lbuf_hn_vsetvli;                     
input           ibuf_lbuf_empty;                          
input           ifctrl_lbuf_ins_inv_on;                   
input           ifctrl_lbuf_inv_req;                      
input   [7 :0]  ipdp_lbuf_vl_reg;                         
input   [1 :0]  ipdp_lbuf_vlmul_reg;                      
input   [2 :0]  ipdp_lbuf_vsew_reg;                       
input           iu_ifu_bht_check_vld;                     
input           iu_ifu_bht_condbr_taken;                  
input           iu_ifu_chgflw_vld;                        
input   [38:0]  iu_ifu_cur_pc;                            
input           pad_yy_icg_scan_en;                       
output          lbuf_addrgen_active_state;                
output          lbuf_addrgen_cache_state;                 
output          lbuf_addrgen_chgflw_mask;                 
output          lbuf_bht_active_state;                    
output          lbuf_bht_con_br_taken;                    
output          lbuf_bht_con_br_vld;                      
output  [5 :0]  lbuf_debug_st;                            
output          lbuf_ibctrl_active_idle_flush;            
output  [38:0]  lbuf_ibctrl_chgflw_pc;                    
output  [1 :0]  lbuf_ibctrl_chgflw_pred;                  
output  [7 :0]  lbuf_ibctrl_chgflw_vl;                    
output          lbuf_ibctrl_chgflw_vld;                   
output  [1 :0]  lbuf_ibctrl_chgflw_vlmul;                 
output  [2 :0]  lbuf_ibctrl_chgflw_vsew;                  
output          lbuf_ibctrl_lbuf_active;                  
output          lbuf_ibctrl_stall;                        
output  [31:0]  lbuf_ibdp_inst0;                          
output          lbuf_ibdp_inst0_bkpta;                    
output          lbuf_ibdp_inst0_bkptb;                    
output          lbuf_ibdp_inst0_fence;                    
output  [14:0]  lbuf_ibdp_inst0_pc;                       
output          lbuf_ibdp_inst0_split0;                   
output          lbuf_ibdp_inst0_split1;                   
output          lbuf_ibdp_inst0_valid;                    
output  [7 :0]  lbuf_ibdp_inst0_vl;                       
output  [1 :0]  lbuf_ibdp_inst0_vlmul;                    
output  [2 :0]  lbuf_ibdp_inst0_vsew;                     
output  [31:0]  lbuf_ibdp_inst1;                          
output          lbuf_ibdp_inst1_bkpta;                    
output          lbuf_ibdp_inst1_bkptb;                    
output          lbuf_ibdp_inst1_fence;                    
output  [14:0]  lbuf_ibdp_inst1_pc;                       
output          lbuf_ibdp_inst1_split0;                   
output          lbuf_ibdp_inst1_split1;                   
output          lbuf_ibdp_inst1_valid;                    
output  [7 :0]  lbuf_ibdp_inst1_vl;                       
output  [1 :0]  lbuf_ibdp_inst1_vlmul;                    
output  [2 :0]  lbuf_ibdp_inst1_vsew;                     
output  [31:0]  lbuf_ibdp_inst2;                          
output          lbuf_ibdp_inst2_bkpta;                    
output          lbuf_ibdp_inst2_bkptb;                    
output          lbuf_ibdp_inst2_fence;                    
output  [14:0]  lbuf_ibdp_inst2_pc;                       
output          lbuf_ibdp_inst2_split0;                   
output          lbuf_ibdp_inst2_split1;                   
output          lbuf_ibdp_inst2_valid;                    
output  [7 :0]  lbuf_ibdp_inst2_vl;                       
output  [1 :0]  lbuf_ibdp_inst2_vlmul;                    
output  [2 :0]  lbuf_ibdp_inst2_vsew;                     
output          lbuf_ipdp_lbuf_active;                    
output  [7 :0]  lbuf_ipdp_updt_vl;                        
output  [1 :0]  lbuf_ipdp_updt_vlmul;                     
output  [2 :0]  lbuf_ipdp_updt_vsew;                      
output          lbuf_ipdp_vtype_updt_vld;                 
output          lbuf_pcfifo_if_create_select;             
output  [1 :0]  lbuf_pcfifo_if_inst_bht_pre_result;       
output  [1 :0]  lbuf_pcfifo_if_inst_bht_sel_result;       
output  [38:0]  lbuf_pcfifo_if_inst_cur_pc;               
output          lbuf_pcfifo_if_inst_pc_oper;              
output  [38:0]  lbuf_pcfifo_if_inst_target_pc;            
output  [21:0]  lbuf_pcfifo_if_inst_vghr;                 
output          lbuf_pcgen_active;                        
output          lbuf_pcgen_vld_mask;                      

// &Regs; @24
reg             active_ctc_record;                        
reg             active_front_fill_chgflw_vld;             
reg             active_idle_chgflw_vld;                   
reg     [1 :0]  back_br_bht_pre_result;                   
reg     [1 :0]  back_br_sel_array_result;                 
reg     [38:0]  back_entry_cur_pc;                        
reg             back_entry_inst_32;                       
reg     [3 :0]  back_entry_start_num;                     
reg     [38:0]  back_entry_target_pc;                     
reg             back_entry_vld;                           
reg     [38:0]  back_update_pre_cur_pc;                   
reg             back_update_pre_inst_32;                  
reg     [38:0]  back_update_pre_tar_pc;                   
reg             back_update_pre_vld_flop;                 
reg     [15:0]  create_pointer_pre;                       
reg     [1 :0]  front_br_bht_pre_result;                  
reg     [3 :0]  front_br_body_num;                        
reg     [3 :0]  front_br_body_num_pre;                    
reg     [3 :0]  front_br_body_num_record;                 
reg     [1 :0]  front_br_sel_array_result;                
reg             front_entry_body_filled;                  
reg     [38:0]  front_entry_cur_pc;                       
reg             front_entry_inst_32;                      
reg     [15:0]  front_entry_next_pointer;                 
reg     [38:0]  front_entry_target_pc;                    
reg     [15:0]  front_entry_update_pointer;               
reg             front_entry_vld;                          
reg     [15:0]  front_update_pointer;                     
reg             front_update_pre_br_taken;                
reg     [38:0]  front_update_pre_cur_pc;                  
reg             front_update_pre_inst_32;                 
reg     [3 :0]  front_update_pre_offset;                  
reg     [15:0]  front_update_pre_pointer;                 
reg     [8 :0]  front_vld_mask;                           
reg             inst0_bht_result;                         
reg             inst1_bht_result;                         
reg             inst2_bht_result;                         
reg     [15:0]  lbuf_create_pointer;                      
reg     [3 :0]  lbuf_cur_entry_num;                       
reg     [38:0]  lbuf_cur_pc;                              
reg     [38:0]  lbuf_cur_pc_branch_pre;                   
reg     [38:0]  lbuf_cur_pc_pre;                          
reg     [5 :0]  lbuf_cur_state;                           
reg     [15:0]  lbuf_front_br_pointer_pre;                
reg     [38:0]  lbuf_ibctrl_chgflw_pc;                    
reg     [7 :0]  lbuf_ibctrl_chgflw_vl;                    
reg     [1 :0]  lbuf_ibctrl_chgflw_vlmul;                 
reg     [2 :0]  lbuf_ibctrl_chgflw_vsew;                  
reg     [5 :0]  lbuf_next_state;                          
reg     [38:0]  lbuf_pc_pop1_pre;                         
reg     [38:0]  lbuf_pc_pop2_pre;                         
reg     [38:0]  lbuf_pc_pop3_pre;                         
reg     [2 :0]  lbuf_pop1_half_num;                       
reg     [2 :0]  lbuf_pop2_half_num;                       
reg     [2 :0]  lbuf_pop3_half_num;                       
reg             lbuf_pop_inst0_back_br;                   
reg             lbuf_pop_inst0_bkpta;                     
reg             lbuf_pop_inst0_bkptb;                     
reg             lbuf_pop_inst0_br;                        
reg     [31:0]  lbuf_pop_inst0_data;                      
reg             lbuf_pop_inst0_fence;                     
reg             lbuf_pop_inst0_front_br;                  
reg     [14:0]  lbuf_pop_inst0_pc;                        
reg     [38:0]  lbuf_pop_inst0_pc_br_pre;                 
reg     [15:0]  lbuf_pop_inst0_retire_pointer_br_pre;     
reg     [2 :0]  lbuf_pop_inst0_split0_type;               
reg     [2 :0]  lbuf_pop_inst0_split1_type;               
reg             lbuf_pop_inst0_valid;                     
reg     [7 :0]  lbuf_pop_inst0_vl_pre;                    
reg     [1 :0]  lbuf_pop_inst0_vlmul_pre;                 
reg             lbuf_pop_inst0_vsetvli;                   
reg     [2 :0]  lbuf_pop_inst0_vsew_pre;                  
reg             lbuf_pop_inst1_back_br;                   
reg             lbuf_pop_inst1_bkpta;                     
reg             lbuf_pop_inst1_bkptb;                     
reg             lbuf_pop_inst1_br;                        
reg     [31:0]  lbuf_pop_inst1_data;                      
reg             lbuf_pop_inst1_fence;                     
reg             lbuf_pop_inst1_front_br;                  
reg     [14:0]  lbuf_pop_inst1_pc;                        
reg     [38:0]  lbuf_pop_inst1_pc_br_pre;                 
reg     [15:0]  lbuf_pop_inst1_retire_pointer_br_pre;     
reg     [2 :0]  lbuf_pop_inst1_split0_type;               
reg     [2 :0]  lbuf_pop_inst1_split1_type;               
reg             lbuf_pop_inst1_valid;                     
reg     [7 :0]  lbuf_pop_inst1_vl_pre;                    
reg     [1 :0]  lbuf_pop_inst1_vlmul_pre;                 
reg             lbuf_pop_inst1_vsetvli;                   
reg     [2 :0]  lbuf_pop_inst1_vsew_pre;                  
reg             lbuf_pop_inst2_back_br;                   
reg             lbuf_pop_inst2_bkpta;                     
reg             lbuf_pop_inst2_bkptb;                     
reg             lbuf_pop_inst2_br;                        
reg     [31:0]  lbuf_pop_inst2_data;                      
reg             lbuf_pop_inst2_fence;                     
reg             lbuf_pop_inst2_front_br;                  
reg     [14:0]  lbuf_pop_inst2_pc;                        
reg     [38:0]  lbuf_pop_inst2_pc_br_pre;                 
reg     [15:0]  lbuf_pop_inst2_retire_pointer_br_pre;     
reg     [2 :0]  lbuf_pop_inst2_split0_type;               
reg     [2 :0]  lbuf_pop_inst2_split1_type;               
reg             lbuf_pop_inst2_valid;                     
reg     [7 :0]  lbuf_pop_inst2_vl_pre;                    
reg     [1 :0]  lbuf_pop_inst2_vlmul_pre;                 
reg             lbuf_pop_inst2_vsetvli;                   
reg     [2 :0]  lbuf_pop_inst2_vsew_pre;                  
reg     [15:0]  lbuf_retire_pointer;                      
reg     [15:0]  lbuf_retire_pointer_branch_pre;           
reg     [15:0]  lbuf_retire_pointer_pop1_pre;             
reg     [15:0]  lbuf_retire_pointer_pop2_pre;             
reg     [15:0]  lbuf_retire_pointer_pop3_pre;             
reg     [15:0]  lbuf_retire_pointer_pre;                  
reg             lbuf_stop_fetch_chgflw_vld;               
reg     [38:0]  new_record_cur_pc;                        
reg     [38:0]  new_record_target_pc;                     
reg             record_fifo_bit;                          
reg             record_fifo_entry0_ban;                   
reg             record_fifo_entry0_filled;                
reg     [3 :0]  record_fifo_entry0_offset;                
reg     [38:0]  record_fifo_entry0_pc;                    
reg     [1 :0]  record_fifo_entry0_pred_mode;             
reg             record_fifo_entry0_valid;                 
reg             record_fifo_entry1_ban;                   
reg             record_fifo_entry1_filled;                
reg     [3 :0]  record_fifo_entry1_offset;                
reg     [38:0]  record_fifo_entry1_pc;                    
reg     [1 :0]  record_fifo_entry1_pred_mode;             
reg             record_fifo_entry1_valid;                 
reg             record_fifo_update_flop;                  

// &Wires; @25
wire            active_front_fill_chgflw_gateclk_en;      
wire    [38:0]  active_front_fill_chgflw_pc_pre;          
wire            active_front_fill_chgflw_vld_pre;         
wire    [7 :0]  active_front_fill_vl_pre;                 
wire    [1 :0]  active_front_fill_vlmul_pre;              
wire    [2 :0]  active_front_fill_vsew_pre;               
wire            active_idle_chgflw_gateclk_en;            
wire    [38:0]  active_idle_chgflw_pc_pre;                
wire            active_idle_chgflw_vld_pre;               
wire    [7 :0]  active_idle_vl_pre;                       
wire    [1 :0]  active_idle_vlmul_pre;                    
wire    [2 :0]  active_idle_vsew_pre;                     
wire            active_state_enter;                       
wire            back_br_bht_result;                       
wire            back_br_check;                            
wire            back_br_hit_filled_new_entry;             
wire            back_br_hit_filled_old_entry;             
wire            back_br_hit_lbuf_end;                     
wire            back_br_hit_not_jump_lbuf_end;            
wire            back_br_hit_record_fifo_fill;             
wire            back_br_hit_record_fifo_unfill;           
wire            back_br_hit_unfill_new_entry;             
wire            back_br_hit_unfill_old_entry;             
wire            back_br_inst_32;                          
wire            back_br_not_loop_end;                     
wire    [3 :0]  back_br_offset;                           
wire            back_br_offset_less_15;                   
wire            back_br_offset_less_16;                   
wire    [38:0]  back_br_pc;                               
wire            back_br_sel_array_clk;                    
wire            back_br_sel_array_clk_en;                 
wire            back_br_sel_array_record;                 
wire    [1 :0]  back_br_sel_array_result_pre;             
wire            back_br_sel_array_update;                 
wire            back_br_taken;                            
wire    [38:0]  back_br_tar_pc;                           
wire            back_buffer_update_clk;                   
wire            back_buffer_update_clk_en;                
wire            back_entry_update;                        
wire    [15:0]  back_entry_update_pointer;                
wire    [31:0]  back_pre_array_result;                    
wire    [38:0]  back_update_cur_pc;                       
wire            back_update_inst_32;                      
wire            back_update_pre_clk;                      
wire            back_update_pre_clk_en;                   
wire            back_update_pre_vld;                      
wire    [38:0]  back_update_target_pc;                    
wire    [31:0]  bht_lbuf_pre_ntaken_result;               
wire    [31:0]  bht_lbuf_pre_taken_result;                
wire    [21:0]  bht_lbuf_vghr;                            
wire            bju_mispred;                              
wire    [38:0]  con_br_cur_pc;                            
wire    [3 :0]  con_br_half_num;                          
wire    [38:0]  con_br_offset;                            
wire            con_br_taken;                             
wire            cp0_ifu_icg_en;                           
wire            cp0_ifu_lbuf_en;                          
wire    [7 :0]  cp0_ifu_vl;                               
wire            cp0_ifu_vsetvli_pred_disable;             
wire            cp0_ifu_vsetvli_pred_mode;                
wire            cp0_yy_clk_en;                            
wire            cpurst_b;                                 
wire    [1 :0]  cur_pred_mode;                            
wire    [15:0]  entry_32_start;                           
wire    [15:0]  entry_back_br;                            
wire    [15:0]  entry_bkpta;                              
wire    [15:0]  entry_bkptb;                              
wire    [15:0]  entry_create;                             
wire    [15:0]  entry_create_32_start;                    
wire    [15:0]  entry_create_back_br;                     
wire    [15:0]  entry_create_bkpta;                       
wire    [15:0]  entry_create_bkptb;                       
wire    [15:0]  entry_create_clk_en;                      
wire    [15:0]  entry_create_fence;                       
wire    [15:0]  entry_create_front_br;                    
wire    [15:0]  entry_create_inst_data_0;                 
wire    [15:0]  entry_create_inst_data_1;                 
wire    [15:0]  entry_create_inst_data_10;                
wire    [15:0]  entry_create_inst_data_11;                
wire    [15:0]  entry_create_inst_data_12;                
wire    [15:0]  entry_create_inst_data_13;                
wire    [15:0]  entry_create_inst_data_14;                
wire    [15:0]  entry_create_inst_data_15;                
wire    [15:0]  entry_create_inst_data_2;                 
wire    [15:0]  entry_create_inst_data_3;                 
wire    [15:0]  entry_create_inst_data_4;                 
wire    [15:0]  entry_create_inst_data_5;                 
wire    [15:0]  entry_create_inst_data_6;                 
wire    [15:0]  entry_create_inst_data_7;                 
wire    [15:0]  entry_create_inst_data_8;                 
wire    [15:0]  entry_create_inst_data_9;                 
wire    [2 :0]  entry_create_split0_type_0;               
wire    [2 :0]  entry_create_split0_type_1;               
wire    [2 :0]  entry_create_split0_type_10;              
wire    [2 :0]  entry_create_split0_type_11;              
wire    [2 :0]  entry_create_split0_type_12;              
wire    [2 :0]  entry_create_split0_type_13;              
wire    [2 :0]  entry_create_split0_type_14;              
wire    [2 :0]  entry_create_split0_type_15;              
wire    [2 :0]  entry_create_split0_type_2;               
wire    [2 :0]  entry_create_split0_type_3;               
wire    [2 :0]  entry_create_split0_type_4;               
wire    [2 :0]  entry_create_split0_type_5;               
wire    [2 :0]  entry_create_split0_type_6;               
wire    [2 :0]  entry_create_split0_type_7;               
wire    [2 :0]  entry_create_split0_type_8;               
wire    [2 :0]  entry_create_split0_type_9;               
wire    [2 :0]  entry_create_split1_type_0;               
wire    [2 :0]  entry_create_split1_type_1;               
wire    [2 :0]  entry_create_split1_type_10;              
wire    [2 :0]  entry_create_split1_type_11;              
wire    [2 :0]  entry_create_split1_type_12;              
wire    [2 :0]  entry_create_split1_type_13;              
wire    [2 :0]  entry_create_split1_type_14;              
wire    [2 :0]  entry_create_split1_type_15;              
wire    [2 :0]  entry_create_split1_type_2;               
wire    [2 :0]  entry_create_split1_type_3;               
wire    [2 :0]  entry_create_split1_type_4;               
wire    [2 :0]  entry_create_split1_type_5;               
wire    [2 :0]  entry_create_split1_type_6;               
wire    [2 :0]  entry_create_split1_type_7;               
wire    [2 :0]  entry_create_split1_type_8;               
wire    [2 :0]  entry_create_split1_type_9;               
wire    [7 :0]  entry_create_vl_0;                        
wire    [7 :0]  entry_create_vl_1;                        
wire    [7 :0]  entry_create_vl_10;                       
wire    [7 :0]  entry_create_vl_11;                       
wire    [7 :0]  entry_create_vl_12;                       
wire    [7 :0]  entry_create_vl_13;                       
wire    [7 :0]  entry_create_vl_14;                       
wire    [7 :0]  entry_create_vl_15;                       
wire    [7 :0]  entry_create_vl_2;                        
wire    [7 :0]  entry_create_vl_3;                        
wire    [7 :0]  entry_create_vl_4;                        
wire    [7 :0]  entry_create_vl_5;                        
wire    [7 :0]  entry_create_vl_6;                        
wire    [7 :0]  entry_create_vl_7;                        
wire    [7 :0]  entry_create_vl_8;                        
wire    [7 :0]  entry_create_vl_9;                        
wire    [1 :0]  entry_create_vlmul_0;                     
wire    [1 :0]  entry_create_vlmul_1;                     
wire    [1 :0]  entry_create_vlmul_10;                    
wire    [1 :0]  entry_create_vlmul_11;                    
wire    [1 :0]  entry_create_vlmul_12;                    
wire    [1 :0]  entry_create_vlmul_13;                    
wire    [1 :0]  entry_create_vlmul_14;                    
wire    [1 :0]  entry_create_vlmul_15;                    
wire    [1 :0]  entry_create_vlmul_2;                     
wire    [1 :0]  entry_create_vlmul_3;                     
wire    [1 :0]  entry_create_vlmul_4;                     
wire    [1 :0]  entry_create_vlmul_5;                     
wire    [1 :0]  entry_create_vlmul_6;                     
wire    [1 :0]  entry_create_vlmul_7;                     
wire    [1 :0]  entry_create_vlmul_8;                     
wire    [1 :0]  entry_create_vlmul_9;                     
wire    [15:0]  entry_create_vsetvli;                     
wire    [2 :0]  entry_create_vsew_0;                      
wire    [2 :0]  entry_create_vsew_1;                      
wire    [2 :0]  entry_create_vsew_10;                     
wire    [2 :0]  entry_create_vsew_11;                     
wire    [2 :0]  entry_create_vsew_12;                     
wire    [2 :0]  entry_create_vsew_13;                     
wire    [2 :0]  entry_create_vsew_14;                     
wire    [2 :0]  entry_create_vsew_15;                     
wire    [2 :0]  entry_create_vsew_2;                      
wire    [2 :0]  entry_create_vsew_3;                      
wire    [2 :0]  entry_create_vsew_4;                      
wire    [2 :0]  entry_create_vsew_5;                      
wire    [2 :0]  entry_create_vsew_6;                      
wire    [2 :0]  entry_create_vsew_7;                      
wire    [2 :0]  entry_create_vsew_8;                      
wire    [2 :0]  entry_create_vsew_9;                      
wire    [15:0]  entry_fence;                              
wire    [15:0]  entry_front_br;                           
wire    [15:0]  entry_inst_data_0;                        
wire    [15:0]  entry_inst_data_1;                        
wire    [15:0]  entry_inst_data_10;                       
wire    [15:0]  entry_inst_data_11;                       
wire    [15:0]  entry_inst_data_12;                       
wire    [15:0]  entry_inst_data_13;                       
wire    [15:0]  entry_inst_data_14;                       
wire    [15:0]  entry_inst_data_15;                       
wire    [15:0]  entry_inst_data_2;                        
wire    [15:0]  entry_inst_data_3;                        
wire    [15:0]  entry_inst_data_4;                        
wire    [15:0]  entry_inst_data_5;                        
wire    [15:0]  entry_inst_data_6;                        
wire    [15:0]  entry_inst_data_7;                        
wire    [15:0]  entry_inst_data_8;                        
wire    [15:0]  entry_inst_data_9;                        
wire    [2 :0]  entry_split0_type_0;                      
wire    [2 :0]  entry_split0_type_1;                      
wire    [2 :0]  entry_split0_type_10;                     
wire    [2 :0]  entry_split0_type_11;                     
wire    [2 :0]  entry_split0_type_12;                     
wire    [2 :0]  entry_split0_type_13;                     
wire    [2 :0]  entry_split0_type_14;                     
wire    [2 :0]  entry_split0_type_15;                     
wire    [2 :0]  entry_split0_type_2;                      
wire    [2 :0]  entry_split0_type_3;                      
wire    [2 :0]  entry_split0_type_4;                      
wire    [2 :0]  entry_split0_type_5;                      
wire    [2 :0]  entry_split0_type_6;                      
wire    [2 :0]  entry_split0_type_7;                      
wire    [2 :0]  entry_split0_type_8;                      
wire    [2 :0]  entry_split0_type_9;                      
wire    [2 :0]  entry_split1_type_0;                      
wire    [2 :0]  entry_split1_type_1;                      
wire    [2 :0]  entry_split1_type_10;                     
wire    [2 :0]  entry_split1_type_11;                     
wire    [2 :0]  entry_split1_type_12;                     
wire    [2 :0]  entry_split1_type_13;                     
wire    [2 :0]  entry_split1_type_14;                     
wire    [2 :0]  entry_split1_type_15;                     
wire    [2 :0]  entry_split1_type_2;                      
wire    [2 :0]  entry_split1_type_3;                      
wire    [2 :0]  entry_split1_type_4;                      
wire    [2 :0]  entry_split1_type_5;                      
wire    [2 :0]  entry_split1_type_6;                      
wire    [2 :0]  entry_split1_type_7;                      
wire    [2 :0]  entry_split1_type_8;                      
wire    [2 :0]  entry_split1_type_9;                      
wire    [7 :0]  entry_vl_0;                               
wire    [7 :0]  entry_vl_1;                               
wire    [7 :0]  entry_vl_10;                              
wire    [7 :0]  entry_vl_11;                              
wire    [7 :0]  entry_vl_12;                              
wire    [7 :0]  entry_vl_13;                              
wire    [7 :0]  entry_vl_14;                              
wire    [7 :0]  entry_vl_15;                              
wire    [7 :0]  entry_vl_2;                               
wire    [7 :0]  entry_vl_3;                               
wire    [7 :0]  entry_vl_4;                               
wire    [7 :0]  entry_vl_5;                               
wire    [7 :0]  entry_vl_6;                               
wire    [7 :0]  entry_vl_7;                               
wire    [7 :0]  entry_vl_8;                               
wire    [7 :0]  entry_vl_9;                               
wire    [15:0]  entry_vld;                                
wire    [1 :0]  entry_vlmul_0;                            
wire    [1 :0]  entry_vlmul_1;                            
wire    [1 :0]  entry_vlmul_10;                           
wire    [1 :0]  entry_vlmul_11;                           
wire    [1 :0]  entry_vlmul_12;                           
wire    [1 :0]  entry_vlmul_13;                           
wire    [1 :0]  entry_vlmul_14;                           
wire    [1 :0]  entry_vlmul_15;                           
wire    [1 :0]  entry_vlmul_2;                            
wire    [1 :0]  entry_vlmul_3;                            
wire    [1 :0]  entry_vlmul_4;                            
wire    [1 :0]  entry_vlmul_5;                            
wire    [1 :0]  entry_vlmul_6;                            
wire    [1 :0]  entry_vlmul_7;                            
wire    [1 :0]  entry_vlmul_8;                            
wire    [1 :0]  entry_vlmul_9;                            
wire    [15:0]  entry_vsetvli;                            
wire    [2 :0]  entry_vsew_0;                             
wire    [2 :0]  entry_vsew_1;                             
wire    [2 :0]  entry_vsew_10;                            
wire    [2 :0]  entry_vsew_11;                            
wire    [2 :0]  entry_vsew_12;                            
wire    [2 :0]  entry_vsew_13;                            
wire    [2 :0]  entry_vsew_14;                            
wire    [2 :0]  entry_vsew_15;                            
wire    [2 :0]  entry_vsew_2;                             
wire    [2 :0]  entry_vsew_3;                             
wire    [2 :0]  entry_vsew_4;                             
wire    [2 :0]  entry_vsew_5;                             
wire    [2 :0]  entry_vsew_6;                             
wire    [2 :0]  entry_vsew_7;                             
wire    [2 :0]  entry_vsew_8;                             
wire    [2 :0]  entry_vsew_9;                             
wire            fill_not_under_rule;                      
wire            fill_state_enter;                         
wire            forever_cpuclk;                           
wire            front_br_bht_result;                      
wire            front_br_body_fill_finish;                
wire            front_br_body_not_filled;                 
wire            front_br_body_num_update;                 
wire            front_br_body_num_update_clk;             
wire            front_br_body_num_update_clk_en;          
wire            front_br_check;                           
wire            front_br_inst_32;                         
wire            front_br_more_than_one;                   
wire    [3 :0]  front_br_offset;                          
wire            front_br_offset_less_16;                  
wire            front_br_oversize;                        
wire    [38:0]  front_br_pc;                              
wire            front_br_sel_array_clk;                   
wire            front_br_sel_array_clk_en;                
wire            front_br_sel_array_record;                
wire    [1 :0]  front_br_sel_array_result_pre;            
wire            front_br_sel_array_update;                
wire            front_br_taken;                           
wire            front_br_under_rule;                      
wire            front_branch_state;                       
wire            front_buffer_update_clk;                  
wire            front_buffer_update_clk_en;               
wire            front_cache_active_state_enter;           
wire    [3 :0]  front_cur_num;                            
wire            front_entry_body_filled_update;           
wire            front_entry_body_filled_update_gateclk_en; 
wire            front_entry_update;                       
wire            front_fill_con_br_check;                  
wire            front_fill_enter;                         
wire            front_fill_enter_gateclk_en;              
wire            front_fill_not_under_rule;                
wire            front_fill_state;                         
wire    [31:0]  front_pre_array_result;                   
wire    [3 :0]  front_target_num;                         
wire            front_update_br_taken;                    
wire    [38:0]  front_update_cur_pc;                      
wire            front_update_inst_32;                     
wire    [15:0]  front_update_next_pointer;                
wire    [3 :0]  front_update_offset;                      
wire            front_update_pre_clk;                     
wire            front_update_pre_clk_en;                  
wire            front_update_pre_vld;                     
wire    [38:0]  front_update_target_pc;                   
wire    [15:0]  h0_data;                                  
wire    [2 :0]  h0_split0_type;                           
wire    [2 :0]  h0_split1_type;                           
wire    [7 :0]  h0_vl;                                    
wire    [1 :0]  h0_vlmul;                                 
wire    [2 :0]  h0_vsew;                                  
wire    [15:0]  h1_data;                                  
wire    [2 :0]  h1_split0_type;                           
wire    [2 :0]  h1_split1_type;                           
wire    [7 :0]  h1_vl;                                    
wire    [1 :0]  h1_vlmul;                                 
wire    [2 :0]  h1_vsew;                                  
wire    [15:0]  h2_data;                                  
wire    [2 :0]  h2_split0_type;                           
wire    [2 :0]  h2_split1_type;                           
wire    [7 :0]  h2_vl;                                    
wire    [1 :0]  h2_vlmul;                                 
wire    [2 :0]  h2_vsew;                                  
wire    [15:0]  h3_data;                                  
wire    [2 :0]  h3_split0_type;                           
wire    [2 :0]  h3_split1_type;                           
wire    [7 :0]  h3_vl;                                    
wire    [1 :0]  h3_vlmul;                                 
wire    [2 :0]  h3_vsew;                                  
wire    [15:0]  h4_data;                                  
wire    [2 :0]  h4_split0_type;                           
wire    [2 :0]  h4_split1_type;                           
wire    [7 :0]  h4_vl;                                    
wire    [1 :0]  h4_vlmul;                                 
wire    [2 :0]  h4_vsew;                                  
wire    [15:0]  h5_data;                                  
wire    [2 :0]  h5_split0_type;                           
wire    [2 :0]  h5_split1_type;                           
wire    [7 :0]  h5_vl;                                    
wire    [1 :0]  h5_vlmul;                                 
wire    [2 :0]  h5_vsew;                                  
wire    [15:0]  h6_data;                                  
wire    [2 :0]  h6_split0_type;                           
wire    [2 :0]  h6_split1_type;                           
wire    [7 :0]  h6_vl;                                    
wire    [1 :0]  h6_vlmul;                                 
wire    [2 :0]  h6_vsew;                                  
wire    [15:0]  h7_data;                                  
wire    [2 :0]  h7_split0_type;                           
wire    [2 :0]  h7_split1_type;                           
wire    [7 :0]  h7_vl;                                    
wire    [1 :0]  h7_vlmul;                                 
wire    [2 :0]  h7_vsew;                                  
wire    [15:0]  h8_data;                                  
wire    [2 :0]  h8_split0_type;                           
wire    [2 :0]  h8_split1_type;                           
wire    [7 :0]  h8_vl;                                    
wire    [1 :0]  h8_vlmul;                                 
wire    [2 :0]  h8_vsew;                                  
wire    [3 :0]  half_vld_num;                             
wire    [8 :0]  hn_32_start;                              
wire    [7 :0]  hn_auipc;                                 
wire    [8 :0]  hn_back_br;                               
wire    [8 :0]  hn_bkpta;                                 
wire    [8 :0]  hn_bkptb;                                 
wire    [7 :0]  hn_chgflw;                                
wire    [7 :0]  hn_con_br;                                
wire    [8 :0]  hn_create_vld;                            
wire    [8 :0]  hn_create_vld_pre;                        
wire    [8 :0]  hn_fence;                                 
wire    [8 :0]  hn_front_br;                              
wire    [8 :0]  hn_vsetvli;                               
wire            ibctrl_lbuf_bju_mispred;                  
wire            ibctrl_lbuf_create_vld;                   
wire            ibctrl_lbuf_flush;                        
wire            ibctrl_lbuf_retire_vld;                   
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
wire            ibuf_empty;                               
wire            ibuf_lbuf_empty;                          
wire            idle_cache_state_enter;                   
wire            ifctrl_lbuf_ins_inv_on;                   
wire            ifctrl_lbuf_inv_req;                      
wire            ins_inv_on;                               
wire            inst_auipc;                               
wire            inst_other_chgflw;                        
wire    [7 :0]  ipdp_lbuf_vl_reg;                         
wire    [1 :0]  ipdp_lbuf_vlmul_reg;                      
wire    [2 :0]  ipdp_lbuf_vsew_reg;                       
wire            iu_ifu_bht_check_vld;                     
wire            iu_ifu_bht_condbr_taken;                  
wire            iu_ifu_chgflw_vld;                        
wire    [38:0]  iu_ifu_cur_pc;                            
wire            lbuf_addrgen_active_state;                
wire            lbuf_addrgen_cache_state;                 
wire            lbuf_addrgen_chgflw_mask;                 
wire            lbuf_bht_active_state;                    
wire            lbuf_bht_con_br_taken;                    
wire            lbuf_bht_con_br_vld;                      
wire            lbuf_chgflw_clk;                          
wire            lbuf_chgflw_clk_en;                       
wire            lbuf_chgflw_record_clk;                   
wire            lbuf_chgflw_record_clk_en;                
wire    [15:0]  lbuf_create_pointer0;                     
wire    [15:0]  lbuf_create_pointer1;                     
wire    [15:0]  lbuf_create_pointer2;                     
wire    [15:0]  lbuf_create_pointer3;                     
wire    [15:0]  lbuf_create_pointer4;                     
wire    [15:0]  lbuf_create_pointer5;                     
wire    [15:0]  lbuf_create_pointer6;                     
wire    [15:0]  lbuf_create_pointer7;                     
wire    [15:0]  lbuf_create_pointer8;                     
wire            lbuf_create_pointer_update_clk;           
wire            lbuf_create_pointer_update_clk_en;        
wire            lbuf_create_vld;                          
wire            lbuf_cur_entry_num_clk;                   
wire            lbuf_cur_entry_num_clk_en;                
wire    [3 :0]  lbuf_cur_entry_num_pre;                   
wire            lbuf_cur_pc_update_clk;                   
wire            lbuf_cur_pc_update_clk_en;                
wire    [5 :0]  lbuf_debug_st;                            
wire            lbuf_fill_state;                          
wire            lbuf_flush;                               
wire            lbuf_ibctrl_active_idle_flush;            
wire    [1 :0]  lbuf_ibctrl_chgflw_pred;                  
wire            lbuf_ibctrl_chgflw_vld;                   
wire            lbuf_ibctrl_lbuf_active;                  
wire            lbuf_ibctrl_stall;                        
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
wire            lbuf_ipdp_lbuf_active;                    
wire    [7 :0]  lbuf_ipdp_updt_vl;                        
wire    [1 :0]  lbuf_ipdp_updt_vlmul;                     
wire    [2 :0]  lbuf_ipdp_updt_vsew;                      
wire            lbuf_ipdp_vtype_updt_vld;                 
wire    [38:0]  lbuf_pc_add_1;                            
wire    [38:0]  lbuf_pc_add_2;                            
wire    [38:0]  lbuf_pc_add_3;                            
wire    [38:0]  lbuf_pc_add_4;                            
wire    [38:0]  lbuf_pc_add_5;                            
wire    [38:0]  lbuf_pc_add_6;                            
wire            lbuf_pcfifo_if_create_select;             
wire    [1 :0]  lbuf_pcfifo_if_inst_bht_pre_result;       
wire    [1 :0]  lbuf_pcfifo_if_inst_bht_sel_result;       
wire    [38:0]  lbuf_pcfifo_if_inst_cur_pc;               
wire            lbuf_pcfifo_if_inst_pc_oper;              
wire    [38:0]  lbuf_pcfifo_if_inst_target_pc;            
wire    [21:0]  lbuf_pcfifo_if_inst_vghr;                 
wire            lbuf_pcgen_active;                        
wire            lbuf_pcgen_vld_mask;                      
wire            lbuf_pop_branch_vld;                      
wire    [38:0]  lbuf_pop_con_br_cur_pc;                   
wire            lbuf_pop_con_br_inst;                     
wire            lbuf_pop_con_br_taken;                    
wire            lbuf_pop_front_br;                        
wire            lbuf_pop_inst0_br_mask_vld;               
wire            lbuf_pop_inst0_con_br;                    
wire    [7 :0]  lbuf_pop_inst0_vl;                        
wire    [1 :0]  lbuf_pop_inst0_vlmul;                     
wire    [2 :0]  lbuf_pop_inst0_vsew;                      
wire            lbuf_pop_inst1_br_mask_vld;               
wire            lbuf_pop_inst1_con_br;                    
wire    [7 :0]  lbuf_pop_inst1_vl;                        
wire    [1 :0]  lbuf_pop_inst1_vlmul;                     
wire    [2 :0]  lbuf_pop_inst1_vsew;                      
wire            lbuf_pop_inst2_br_mask_vld;               
wire            lbuf_pop_inst2_con_br;                    
wire    [7 :0]  lbuf_pop_inst2_vl;                        
wire    [1 :0]  lbuf_pop_inst2_vlmul;                     
wire    [2 :0]  lbuf_pop_inst2_vsew;                      
wire            lbuf_pop_not_taken_back_br;               
wire            lbuf_pop_not_taken_front_br;              
wire    [1 :0]  lbuf_pop_pre_result;                      
wire    [1 :0]  lbuf_pop_sel_result;                      
wire    [15:0]  lbuf_retire_pointer0;                     
wire    [15:0]  lbuf_retire_pointer1;                     
wire    [15:0]  lbuf_retire_pointer2;                     
wire    [15:0]  lbuf_retire_pointer3;                     
wire    [15:0]  lbuf_retire_pointer4;                     
wire    [15:0]  lbuf_retire_pointer5;                     
wire            lbuf_retire_pointer_update_clk;           
wire            lbuf_retire_pointer_update_clk_en;        
wire            lbuf_retire_vld;                          
wire            lbuf_sm_clk;                              
wire            lbuf_sm_clk_en;                           
wire            lbuf_stop_fetch_chgflw_gateclk_en;        
wire            lbuf_stop_fetch_chgflw_vld_pre;           
wire    [7 :0]  lbuf_stop_fetch_vl_pre;                   
wire    [1 :0]  lbuf_stop_fetch_vlmul_pre;                
wire    [2 :0]  lbuf_stop_fetch_vsew_pre;                 
wire    [3 :0]  lbuf_target_entry_num;                    
wire            lbuf_vld_mask;                            
wire            loop_buffer_full;                         
wire            loop_end_br_not_taken;                    
wire    [38:0]  loop_start_pc;                            
wire            new_entry_ban;                            
wire            new_entry_filled;                         
wire    [38:0]  new_entry_pc;                             
wire    [1 :0]  new_entry_pred_mode;                      
wire    [3 :0]  new_entry_start_num;                      
wire            new_entry_valid;                          
wire            new_record_entry_out_loop;                
wire            old_entry_ban;                            
wire            old_entry_filled;                         
wire    [38:0]  old_entry_pc;                             
wire    [1 :0]  old_entry_pred_mode;                      
wire            old_entry_valid;                          
wire            pad_yy_icg_scan_en;                       
wire            pop_h0_32_start;                          
wire            pop_h0_back_br;                           
wire            pop_h0_bkpta;                             
wire            pop_h0_bkptb;                             
wire            pop_h0_br;                                
wire    [15:0]  pop_h0_data;                              
wire            pop_h0_fence;                             
wire            pop_h0_front_br;                          
wire    [2 :0]  pop_h0_split0_type;                       
wire    [2 :0]  pop_h0_split1_type;                       
wire    [7 :0]  pop_h0_vl;                                
wire            pop_h0_vld;                               
wire    [1 :0]  pop_h0_vlmul;                             
wire            pop_h0_vsetvli;                           
wire    [2 :0]  pop_h0_vsew;                              
wire            pop_h1_32_start;                          
wire            pop_h1_back_br;                           
wire            pop_h1_bkpta;                             
wire            pop_h1_bkptb;                             
wire            pop_h1_br;                                
wire    [15:0]  pop_h1_data;                              
wire            pop_h1_fence;                             
wire            pop_h1_front_br;                          
wire    [2 :0]  pop_h1_split0_type;                       
wire    [2 :0]  pop_h1_split1_type;                       
wire    [7 :0]  pop_h1_vl;                                
wire            pop_h1_vld;                               
wire    [1 :0]  pop_h1_vlmul;                             
wire            pop_h1_vsetvli;                           
wire    [2 :0]  pop_h1_vsew;                              
wire            pop_h2_32_start;                          
wire            pop_h2_back_br;                           
wire            pop_h2_bkpta;                             
wire            pop_h2_bkptb;                             
wire            pop_h2_br;                                
wire    [15:0]  pop_h2_data;                              
wire            pop_h2_fence;                             
wire            pop_h2_front_br;                          
wire    [2 :0]  pop_h2_split0_type;                       
wire    [2 :0]  pop_h2_split1_type;                       
wire    [7 :0]  pop_h2_vl;                                
wire            pop_h2_vld;                               
wire    [1 :0]  pop_h2_vlmul;                             
wire            pop_h2_vsetvli;                           
wire    [2 :0]  pop_h2_vsew;                              
wire            pop_h3_32_start;                          
wire            pop_h3_back_br;                           
wire            pop_h3_bkpta;                             
wire            pop_h3_bkptb;                             
wire            pop_h3_br;                                
wire    [15:0]  pop_h3_data;                              
wire            pop_h3_fence;                             
wire            pop_h3_front_br;                          
wire    [2 :0]  pop_h3_split0_type;                       
wire    [2 :0]  pop_h3_split1_type;                       
wire    [7 :0]  pop_h3_vl;                                
wire            pop_h3_vld;                               
wire    [1 :0]  pop_h3_vlmul;                             
wire            pop_h3_vsetvli;                           
wire    [2 :0]  pop_h3_vsew;                              
wire            pop_h4_32_start;                          
wire            pop_h4_back_br;                           
wire            pop_h4_bkpta;                             
wire            pop_h4_bkptb;                             
wire            pop_h4_br;                                
wire    [15:0]  pop_h4_data;                              
wire            pop_h4_fence;                             
wire            pop_h4_front_br;                          
wire    [2 :0]  pop_h4_split0_type;                       
wire    [2 :0]  pop_h4_split1_type;                       
wire    [7 :0]  pop_h4_vl;                                
wire            pop_h4_vld;                               
wire    [1 :0]  pop_h4_vlmul;                             
wire            pop_h4_vsetvli;                           
wire    [2 :0]  pop_h4_vsew;                              
wire    [15:0]  pop_h5_data;                              
wire    [31:0]  pre_ntaken_result;                        
wire    [31:0]  pre_taken_result;                         
wire            record_fifo_bit_clk;                      
wire            record_fifo_bit_clk_en;                   
wire            record_fifo_bit_update;                   
wire            record_fifo_entry_ban_update;             
wire            record_fifo_entry_ban_update_gateclk_en;  
wire            record_fifo_entry_clk;                    
wire            record_fifo_entry_clk_en;                 
wire            record_fifo_entry_filled_update;          
wire            record_fifo_update;                       
wire            record_fifo_update_gateclk_en;            
wire    [1 :0]  sel_array_result;                         
wire            taken_front_branch_enter;                 
wire    [13:0]  vghr;                                     


parameter PC_WIDTH  = 40;
parameter ENTRY_NUM = 16;
// &Force("bus","ibdp_lbuf_con_br_offset",20,0);   @30
//==========================================================
//                  LBUF State Machine
//==========================================================
parameter IDLE         = 6'b000000;
parameter FILL         = 6'b000001;
parameter FRONT_BRANCH = 6'b000010;
parameter CACHE        = 6'b000100;
parameter ACTIVE       = 6'b001000;
parameter FRONT_FILL   = 6'b010000;
parameter FRONT_CACHE  = 6'b100000;

//--------------------FSM of Loop Buffer--------------------
//IDLE         : Wait for the back branch 
//FILL         : Fill the Loop Buffer Entry
//ACTIVE       : Send Inst out from lbuf
//FRONT_FILL   : Fill the front branch body
//FRONT_BRANCH : Record the front branch information
//CACHE        : Wait for loop end back br record finish
//               And IBUF Empty 
                                             
//==========================================================
//                 Gate Clk of LBUF SM
//==========================================================
// &Instance("gated_clk_cell","x_lbuf_sm_clk"); @54
gated_clk_cell  x_lbuf_sm_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lbuf_sm_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lbuf_sm_clk_en    ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @55
//           .clk_out        (lbuf_sm_clk),//Out Clock @56
//           .external_en    (1'b0), @57
//           .global_en      (cp0_yy_clk_en), @58
//           .local_en       (lbuf_sm_clk_en),//Local Condition @59
//           .module_en      (cp0_ifu_icg_en) @60
//         ); @61
assign lbuf_sm_clk_en = (lbuf_cur_state[5:0] != IDLE) || 
                        back_br_taken;
//-----------------state machine update---------------------
//  1.when reset, turn to IDLE
//  2.when rtu/vector flush or expt || bju mispred
//    turn to IDLE
//  3.when lbuf_en not valid, turn to IDLE   
always @(posedge lbuf_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_cur_state[5:0] <= IDLE;
  else if(lbuf_flush || bju_mispred)
    lbuf_cur_state[5:0] <= IDLE;
  else if(!cp0_ifu_lbuf_en)
    lbuf_cur_state[5:0] <= IDLE;
  else
    lbuf_cur_state[5:0] <= lbuf_next_state[5:0];
end
assign lbuf_flush  = ibctrl_lbuf_flush;
assign bju_mispred = ibctrl_lbuf_bju_mispred;

//--------------------State Transfer-----------------------
// &CombBeg; @84
always @( lbuf_cur_state[5:0]
       or front_br_under_rule
       or ibuf_empty
       or back_br_hit_record_fifo_unfill
       or front_br_body_not_filled
       or ins_inv_on
       or lbuf_pop_not_taken_back_br
       or back_br_hit_record_fifo_fill
       or back_br_hit_lbuf_end
       or fill_not_under_rule
       or front_fill_not_under_rule)
begin
case(lbuf_cur_state[5:0])
  IDLE         : begin
                 if(back_br_hit_record_fifo_fill && !ins_inv_on)
                   lbuf_next_state[5:0] = CACHE;
                 else if(back_br_hit_record_fifo_unfill && !ins_inv_on)
                   lbuf_next_state[5:0] = FILL;
                 else
                   lbuf_next_state[5:0] = IDLE;
                 end
  FILL         : begin
                 if(fill_not_under_rule)
                   lbuf_next_state[5:0] = IDLE;
                 else if(back_br_hit_lbuf_end)
                   lbuf_next_state[5:0] = CACHE;
                 else if(front_br_under_rule)
                   lbuf_next_state[5:0] = FRONT_BRANCH;
                 else
                   lbuf_next_state[5:0] = FILL;
                 end
  CACHE        : begin
                 if(ibuf_empty && !ins_inv_on)
                   lbuf_next_state[5:0] = ACTIVE;
                 else
                   lbuf_next_state[5:0] = CACHE;
                 end
  FRONT_BRANCH : begin
                   lbuf_next_state[5:0] = FILL;
                 end
  ACTIVE       : begin
                 if(front_br_body_not_filled)
                   lbuf_next_state[5:0] = FRONT_FILL;
                 else if(lbuf_pop_not_taken_back_br)
                   lbuf_next_state[5:0] = IDLE;
                 else
                   lbuf_next_state[5:0] = ACTIVE;
                 end
  FRONT_FILL   : begin
                 if(front_fill_not_under_rule)
                   lbuf_next_state[5:0] = IDLE;
                 else if(back_br_hit_lbuf_end)
                   lbuf_next_state[5:0] = FRONT_CACHE;
                 else
                   lbuf_next_state[5:0] = FRONT_FILL;
                 end
  FRONT_CACHE  : begin
                 if(ibuf_empty && !ins_inv_on)
                   lbuf_next_state[5:0] = ACTIVE;
                 else
                   lbuf_next_state[5:0] = FRONT_CACHE;
                 end
  default      :   lbuf_next_state[5:0] = IDLE;
endcase
// &CombEnd; @137
end

//--------------------Control Signal------------------------
//back_br_hit_record_fifo_fill
//IDLE state, if cur back br hit filled entry
//turn to ACTIVE state
assign back_br_hit_record_fifo_fill = ibctrl_lbuf_create_vld && 
                                      (
                                        back_br_hit_filled_old_entry || 
                                        back_br_hit_filled_new_entry
                                      );
assign back_br_hit_filled_old_entry = back_br_taken && 
                                     (back_br_pc[PC_WIDTH-2:0] == old_entry_pc[PC_WIDTH-2:0]) && 
                                     (cur_pred_mode[1:0] == old_entry_pred_mode[1:0]) &&
                                      old_entry_filled && 
                                     !old_entry_ban && 
                                      old_entry_valid;
assign back_br_hit_filled_new_entry = back_br_taken && 
                                     (back_br_pc[PC_WIDTH-2:0] == new_entry_pc[PC_WIDTH-2:0]) && 
                                     (cur_pred_mode[1:0] == new_entry_pred_mode[1:0]) &&
                                      new_entry_filled && 
                                     !new_entry_ban && 
                                      new_entry_valid;
//back_br_hit_record_fifo_unfill
//IDLE state, if cur back br hit unfill entry
//turn to FILL state
assign back_br_hit_record_fifo_unfill = ibctrl_lbuf_create_vld && 
                                        (
                                          back_br_hit_unfill_old_entry || 
                                          back_br_hit_unfill_new_entry
                                        );
assign back_br_hit_unfill_old_entry   = back_br_taken && 
                                       (back_br_pc[PC_WIDTH-2:0] == old_entry_pc[PC_WIDTH-2:0]) && 
                                       !old_entry_filled && 
                                       !old_entry_ban && 
                                       old_entry_valid;
assign back_br_hit_unfill_new_entry   = back_br_taken && 
                                       (back_br_pc[PC_WIDTH-2:0] == new_entry_pc[PC_WIDTH-2:0]) && 
                                       !new_entry_filled && 
                                       !new_entry_ban && 
                                       new_entry_valid;
//back_br_hit_lbuf_end
//On FILL state, if cur back branch hit new enry pc
//Means Loop body fill finish
assign back_br_hit_lbuf_end          = back_br_taken && 
                                       (back_br_pc[PC_WIDTH-2:0] == new_entry_pc[PC_WIDTH-2:0]) && 
                                       lbuf_create_vld;
assign back_br_hit_not_jump_lbuf_end = !back_br_taken && 
                                       (back_br_pc[PC_WIDTH-2:0] == new_entry_pc[PC_WIDTH-2:0]) && 
                                       lbuf_create_vld;
//lbuf_pop_not_taken_back_br
//On Active state, back br hit loop end while not jump
assign lbuf_pop_not_taken_back_br = lbuf_retire_vld && 
                                    !back_br_bht_result && 
                                    (
                                      (
                                        lbuf_pop_inst0_valid && 
                                        lbuf_pop_inst0_back_br
                                      ) || 
                                      (
                                        lbuf_pop_inst1_valid && 
                                        lbuf_pop_inst1_back_br && 
                                        !lbuf_pop_inst0_br
                                      ) || 
                                      (
                                        lbuf_pop_inst2_valid && 
                                        lbuf_pop_inst2_back_br && 
                                        !lbuf_pop_inst0_br && 
                                        !lbuf_pop_inst1_br
                                      )
                                    );
//front_br_under_rule
assign front_br_under_rule  = front_br_check && 
                              !front_br_oversize && 
                              lbuf_create_vld;
//front_br_body_not_filled
//if current front branch body not filled
//turn to front_fill state to fill front branch body
assign front_br_body_not_filled = !front_entry_body_filled && 
                                  front_entry_vld && 
                                  lbuf_pop_not_taken_front_br;
assign lbuf_pop_not_taken_front_br = lbuf_retire_vld && 
                                     !front_br_bht_result && 
                                     (
                                       (
                                         lbuf_pop_inst0_valid && 
                                         lbuf_pop_inst0_front_br
                                       ) || 
                                       (
                                         lbuf_pop_inst1_valid && 
                                         lbuf_pop_inst1_front_br && 
                                         !lbuf_pop_inst0_br
                                       ) || 
                                       (
                                         lbuf_pop_inst2_valid && 
                                         lbuf_pop_inst2_front_br && 
                                         !lbuf_pop_inst0_br && 
                                         !lbuf_pop_inst1_br
                                       )
                                     );
//front_br_body_fill_finish
//front_br_body_fill_finish means the remain number of 
//front branch body to be filled is zero
assign front_br_body_fill_finish = (front_br_body_num[3:0] == 4'b0000);
//fill_not_under_rule
//fill inst into lbuf not under rule
assign fill_not_under_rule = lbuf_create_vld && 
                             (
                               inst_other_chgflw || 
                               inst_auipc || 
                               back_br_not_loop_end || 
                               front_br_more_than_one || 
                               loop_buffer_full || 
                               loop_end_br_not_taken || 
                               front_br_check && front_br_oversize
                             );
//front_fill_not_under_rule
//fill inst into lbuf not under rule
assign front_fill_not_under_rule = lbuf_create_vld && 
                                   (
                                     inst_other_chgflw || 
                                     inst_auipc || 
                                     front_fill_con_br_check 
                                   ) || 
                                   back_br_hit_not_jump_lbuf_end;                              
//ibuf_empty
//FILL/FRONT_FILL state : 
//fill lbuf and ibuf at the same time
//if ibuf not empty, lbuf does not send inst out
assign ibuf_empty = ibuf_lbuf_empty;

//==========================================================
//              IB Stage Send Data to Lbuf
//==========================================================
//lbuf_create_vld
//Mean the data send from IB stage to LBUF is valid
//And LBUF State Machine transfer and write in logic will be valid
assign lbuf_create_vld           = ibctrl_lbuf_create_vld && 
                                   (
                                     lbuf_cur_state[0] || //(lbuf_cur_state[5:0] == FILL)
                                     lbuf_cur_state[4]    //(lbuf_cur_state[5:0] == FRONT_FILL)
                                   );
//Hn chgflw signal except con_br
assign hn_chgflw[7:0]            = ibdp_lbuf_hn_chgflw[7:0];
//Hn con_br
assign hn_con_br[7:0]            = ibdp_lbuf_hn_con_br[7:0];
//con_br cur_pc
assign con_br_cur_pc[PC_WIDTH-2:0] = ibdp_lbuf_con_br_cur_pc[PC_WIDTH-2:0];
//con_br offset
assign con_br_offset[PC_WIDTH-2:0] = {{19{ibdp_lbuf_con_br_offset[20]}},ibdp_lbuf_con_br_offset[20:1]};
//con_br taken
assign con_br_taken              = ibdp_lbuf_con_br_taken;
//Hn lrw/grs
assign hn_auipc[7:0]             = ibdp_lbuf_hn_auipc[7:0];
//half_vld_num
assign half_vld_num[3:0]         = ibdp_lbuf_half_vld_num[3:0];
//con_br_half_num[3:0]
assign con_br_half_num[3:0]      = ibdp_lbuf_con_br_half_num[3:0];

//con_br_check
assign front_fill_con_br_check   = (lbuf_cur_state[5:0] == FRONT_FILL)
                                 ? (ibdp_lbuf_h0_vld)
                                   ? |(hn_con_br[7:0] & front_vld_mask[7:0])
                                   : |(hn_con_br[7:0] & front_vld_mask[8:1])
                                 : (|hn_con_br[7:0]); 
//Back Branch Information
assign back_br_taken          = (|hn_con_br[7:0]) && 
                                con_br_offset[37] && //negetive offset
                                con_br_taken;
assign back_br_check          = (|hn_con_br[7:0]) && 
                                con_br_offset[37];
assign back_br_inst_32        = ibdp_lbuf_con_br_inst_32;
assign back_br_pc[PC_WIDTH-2:0]     = con_br_cur_pc[PC_WIDTH-2:0];
assign back_br_tar_pc[PC_WIDTH-2:0] = con_br_cur_pc[PC_WIDTH-2:0] + con_br_offset[PC_WIDTH-2:0];

assign back_br_offset[3:0]    = (~con_br_offset[3:0]) + 4'b1;                           
assign back_br_offset_less_15 = (&con_br_offset[PC_WIDTH-2:4]) && //<-16
                                (con_br_offset[3:0] != 4'b0000) && //-16
                                (con_br_offset[3:0] != 4'b0001); //-15
assign back_br_offset_less_16 = (&con_br_offset[PC_WIDTH-2:4]) && //<-16
                                (con_br_offset[3:0] != 4'b0000); //-16
                                     
//Front Branch Information
assign front_br_taken    = (|hn_con_br[7:0]) && 
                           !con_br_offset[37] && //posetive offset
                           con_br_taken;
assign front_br_check    = (|hn_con_br[7:0]) && 
                           !con_br_offset[37]; 
assign front_br_inst_32 = ibdp_lbuf_con_br_inst_32;
assign front_br_pc[PC_WIDTH-2:0] = con_br_cur_pc[PC_WIDTH-2:0]; 

assign front_br_offset[3:0]    = con_br_offset[3:0];
assign front_br_offset_less_16 = !(|con_br_offset[PC_WIDTH-2:4]); //>16

assign front_cur_num[3:0]    = lbuf_cur_entry_num[3:0] + con_br_half_num[3:0];
assign front_target_num[3:0] = front_cur_num[3:0] + front_br_offset[3:0];
assign front_br_oversize     = !front_br_offset_less_16 || 
                               (front_target_num[3:0] < front_cur_num[3:0]) || //Over add
                               (front_target_num[3:0] > back_entry_start_num[3:0]);
//Other Signal Generate
assign inst_other_chgflw       = (lbuf_cur_state[5:0] == FRONT_FILL)
                               ? (ibdp_lbuf_h0_vld)
                                 ? |(hn_chgflw[7:0] & front_vld_mask[7:0])
                                 : |(hn_chgflw[7:0] & front_vld_mask[8:1])
                               : (|hn_chgflw[7:0]);//contain ab_br
assign inst_auipc              = (lbuf_cur_state[5:0] == FRONT_FILL)
                               ? (ibdp_lbuf_h0_vld)
                                 ? |(hn_auipc[7:0] & front_vld_mask[7:0])
                                 : |(hn_auipc[7:0] & front_vld_mask[8:1])
                               : (|hn_auipc[7:0]);                               
assign back_br_not_loop_end    = back_br_check && 
                                 (back_br_pc[PC_WIDTH-2:0] != new_entry_pc[PC_WIDTH-2:0]); 
assign loop_end_br_not_taken   = back_br_check && 
                                 (back_br_pc[PC_WIDTH-2:0] == new_entry_pc[PC_WIDTH-2:0]) && 
                                 !back_br_taken;
assign front_br_more_than_one  = front_br_check && front_entry_vld; 
assign lbuf_target_entry_num[3:0] = lbuf_cur_entry_num[3:0] + half_vld_num[3:0];                              
assign loop_buffer_full           = lbuf_target_entry_num[3:0] < lbuf_cur_entry_num[3:0]; //Over add

assign cur_pred_mode[1:0]      = {cp0_ifu_vsetvli_pred_disable,cp0_ifu_vsetvli_pred_mode};

//==========================================================
//            Loop Buffer Cur Entry Number
//==========================================================
//On FILL state
//Maintain lbuf_cur_entry_num for branch under rule judge
//  1.lbuf_flush               --> 0
//  2.FILL state enter         --> 0
//  3.FILL state && create_vld --> += offset / Front Br Target
always @(posedge lbuf_cur_entry_num_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_cur_entry_num[3:0] <= 4'b0;
  else if(lbuf_flush)
    lbuf_cur_entry_num[3:0] <= 4'b0;
  else if(fill_state_enter)
    lbuf_cur_entry_num[3:0] <= 4'b0;
  else if(lbuf_fill_state && lbuf_create_vld)
    lbuf_cur_entry_num[3:0] <= lbuf_cur_entry_num_pre[3:0];
  else
    lbuf_cur_entry_num[3:0] <= lbuf_cur_entry_num[3:0];
end
assign lbuf_fill_state = (lbuf_cur_state[5:0] == FILL);

assign lbuf_cur_entry_num_pre[3:0] = (front_br_taken) 
                                   ? front_target_num[3:0] 
                                   : lbuf_target_entry_num[3:0];

//Gate Clk
// &Instance("gated_clk_cell","x_lbuf_cur_entry_num_clk"); @386
gated_clk_cell  x_lbuf_cur_entry_num_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (lbuf_cur_entry_num_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (lbuf_cur_entry_num_clk_en),
  .module_en                 (cp0_ifu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect( .clk_in         (forever_cpuclk), @387
//           .clk_out        (lbuf_cur_entry_num_clk),//Out Clock @388
//           .external_en    (1'b0), @389
//           .global_en      (cp0_yy_clk_en), @390
//           .local_en       (lbuf_cur_entry_num_clk_en),//Local Condition @391
//           .module_en      (cp0_ifu_icg_en) @392
//         ); @393
assign lbuf_cur_entry_num_clk_en = lbuf_flush || 
                                   lbuf_fill_state || 
                                   fill_state_enter;  
//==========================================================
//                  Loop Record FIFO
//==========================================================
//Entry0 & Entry1
//Cur_pc[PC_WIDTH-2:0] | Offset[4:0] | Ban | Filled | Valid
//FIFO_Bit

//---------------------Signal for FSM-----------------------
assign old_entry_filled   = (record_fifo_bit)
                          ? record_fifo_entry1_filled 
                          : record_fifo_entry0_filled;
assign old_entry_ban      = (record_fifo_bit)
                          ? record_fifo_entry1_ban 
                          : record_fifo_entry0_ban;
assign old_entry_valid    = (record_fifo_bit)
                          ? record_fifo_entry1_valid 
                          : record_fifo_entry0_valid;
assign old_entry_pc[PC_WIDTH-2:0] = (record_fifo_bit)
                                  ? record_fifo_entry1_pc[PC_WIDTH-2:0] 
                                  : record_fifo_entry0_pc[PC_WIDTH-2:0];  

assign old_entry_pred_mode[1:0]   = (record_fifo_bit)
                                  ? record_fifo_entry1_pred_mode[1:0]
                                  : record_fifo_entry0_pred_mode[1:0];

assign new_entry_filled   = (!record_fifo_bit)
                          ? record_fifo_entry1_filled 
                          : record_fifo_entry0_filled;
assign new_entry_ban      = (!record_fifo_bit)
                          ? record_fifo_entry1_ban 
                          : record_fifo_entry0_ban;
assign new_entry_valid    = (!record_fifo_bit)
                          ? record_fifo_entry1_valid 
                          : record_fifo_entry0_valid;
assign new_entry_pc[PC_WIDTH-2:0] = (!record_fifo_bit)
                                  ? record_fifo_entry1_pc[PC_WIDTH-2:0] 
                                  : record_fifo_entry0_pc[PC_WIDTH-2:0];                           

assign new_entry_pred_mode[1:0]   = (!record_fifo_bit)
                                  ? record_fifo_entry1_pred_mode[1:0]
                                  : record_fifo_entry0_pred_mode[1:0];

assign new_entry_start_num[3:0] = (back_br_hit_unfill_new_entry)
                                ? (!record_fifo_bit)
                                  ? record_fifo_entry1_offset[3:0]
                                  : record_fifo_entry0_offset[3:0]
                                : (record_fifo_bit)
                                  ? record_fifo_entry1_offset[3:0]
                                  : record_fifo_entry0_offset[3:0];                

//---------------------Entry0 Register----------------------
//Gate Clk
// &Instance("gated_clk_cell","x_record_fifo_entry_clk"); @449
gated_clk_cell  x_record_fifo_entry_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (record_fifo_entry_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (record_fifo_entry_clk_en),
  .module_en                (cp0_ifu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect( .clk_in         (forever_cpuclk), @450
//           .clk_out        (record_fifo_entry_clk),//Out Clock @451
//           .external_en    (1'b0), @452
//           .global_en      (cp0_yy_clk_en), @453
//           .local_en       (record_fifo_entry_clk_en),//Local Condition @454
//           .module_en      (cp0_ifu_icg_en) @455
//         ); @456
assign record_fifo_entry_clk_en = record_fifo_update_gateclk_en || 
                                  record_fifo_entry_ban_update_gateclk_en || 
                                  //record_fifo_entry_filled_update || 
                                  record_fifo_update_flop || 
                                  //fill_state_enter || 
                                  lbuf_flush;

always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    record_fifo_entry0_valid            <= 1'b0;
    record_fifo_entry0_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    record_fifo_entry0_offset[3:0]      <= 4'b0;
  end
  else if(lbuf_flush)
  begin
    record_fifo_entry0_valid            <= 1'b0;
    record_fifo_entry0_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    record_fifo_entry0_offset[3:0]      <= 4'b0;
  end
  else if(record_fifo_update && !record_fifo_bit)
  begin
    record_fifo_entry0_valid            <= 1'b1;
    record_fifo_entry0_pc[PC_WIDTH-2:0] <= con_br_cur_pc[PC_WIDTH-2:0];
    record_fifo_entry0_offset[3:0]      <= back_br_offset[3:0];
  end
  else
  begin
    record_fifo_entry0_valid            <= record_fifo_entry0_valid;
    record_fifo_entry0_pc[PC_WIDTH-2:0] <= record_fifo_entry0_pc[PC_WIDTH-2:0];
    record_fifo_entry0_offset[3:0]      <= record_fifo_entry0_offset[3:0];
  end
end

always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    record_fifo_entry0_ban <= 1'b0;
  else if(lbuf_flush)
    record_fifo_entry0_ban <= 1'b0;
  else if(record_fifo_update && !record_fifo_bit)
    record_fifo_entry0_ban <= 1'b0;
  else if(record_fifo_entry_ban_update && record_fifo_bit)
    record_fifo_entry0_ban <= 1'b1;
  else
    record_fifo_entry0_ban <= record_fifo_entry0_ban;
end

always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    record_fifo_entry0_filled <= 1'b0;
  else if(lbuf_flush)
    record_fifo_entry0_filled <= 1'b0;
  else if(fill_state_enter || record_fifo_update)
    record_fifo_entry0_filled <= 1'b0;
  else if(record_fifo_entry_filled_update && record_fifo_bit)
    record_fifo_entry0_filled <= 1'b1;
  else
    record_fifo_entry0_filled <= record_fifo_entry0_filled;
end

always @ (posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if (~cpurst_b) 
    record_fifo_entry0_pred_mode[1:0] <= 2'b0;
  else if (lbuf_flush) 
    record_fifo_entry0_pred_mode[1:0] <= 2'b0;
  else if (record_fifo_entry_filled_update && record_fifo_bit)
    record_fifo_entry0_pred_mode[1:0] <= {cp0_ifu_vsetvli_pred_disable,cp0_ifu_vsetvli_pred_mode};
  else
    record_fifo_entry0_pred_mode[1:0] <= record_fifo_entry0_pred_mode[1:0];
end

//---------------------Entry1 Register----------------------
always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    record_fifo_entry1_valid            <= 1'b0;
    record_fifo_entry1_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    record_fifo_entry1_offset[3:0]      <= 4'b0;
  end
  else if(lbuf_flush)
  begin
    record_fifo_entry1_valid            <= 1'b0;
    record_fifo_entry1_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    record_fifo_entry1_offset[3:0]      <= 4'b0;
  end
  else if(record_fifo_update && record_fifo_bit)
  begin
    record_fifo_entry1_valid            <= 1'b1;
    record_fifo_entry1_pc[PC_WIDTH-2:0] <= con_br_cur_pc[PC_WIDTH-2:0];
    record_fifo_entry1_offset[3:0]      <= back_br_offset[3:0];
  end
  else
  begin
    record_fifo_entry1_valid            <= record_fifo_entry1_valid;
    record_fifo_entry1_pc[PC_WIDTH-2:0] <= record_fifo_entry1_pc[PC_WIDTH-2:0];
    record_fifo_entry1_offset[3:0]      <= record_fifo_entry1_offset[3:0];
  end
end

always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    record_fifo_entry1_ban <= 1'b0;
  else if(lbuf_flush)
    record_fifo_entry1_ban <= 1'b0;
  else if(record_fifo_update && record_fifo_bit)
    record_fifo_entry1_ban <= 1'b0;
  else if(record_fifo_entry_ban_update && !record_fifo_bit)
    record_fifo_entry1_ban <= 1'b1;
  else
    record_fifo_entry1_ban <= record_fifo_entry1_ban;
end

always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    record_fifo_entry1_filled <= 1'b0;
  else if(lbuf_flush)
    record_fifo_entry1_filled <= 1'b0;
  else if(fill_state_enter || record_fifo_update)
    record_fifo_entry1_filled <= 1'b0;
  else if(record_fifo_entry_filled_update && !record_fifo_bit)
    record_fifo_entry1_filled <= 1'b1;
  else
    record_fifo_entry1_filled <= record_fifo_entry1_filled;
end

always @ (posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if (~cpurst_b) 
    record_fifo_entry1_pred_mode[1:0] <= 2'b0;
  else if (lbuf_flush) 
    record_fifo_entry1_pred_mode[1:0] <= 2'b0;
  else if (record_fifo_entry_filled_update && !record_fifo_bit)
    record_fifo_entry1_pred_mode[1:0] <= {cp0_ifu_vsetvli_pred_disable,cp0_ifu_vsetvli_pred_mode};
  else
    record_fifo_entry1_pred_mode[1:0] <= record_fifo_entry1_pred_mode[1:0];
end

//------------------------FIFO Bit--------------------------                                
//Gate Clk
// &Instance("gated_clk_cell","x_record_fifo_bit_clk"); @603
gated_clk_cell  x_record_fifo_bit_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (record_fifo_bit_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (record_fifo_bit_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @604
//           .clk_out        (record_fifo_bit_clk),//Out Clock @605
//           .external_en    (1'b0), @606
//           .global_en      (cp0_yy_clk_en), @607
//           .local_en       (record_fifo_bit_clk_en),//Local Condition @608
//           .module_en      (cp0_ifu_icg_en) @609
//         ); @610
assign record_fifo_bit_clk_en = record_fifo_bit_update || 
                                lbuf_flush; 
                                 
always @(posedge record_fifo_bit_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    record_fifo_bit <= 1'b0;
  else if(lbuf_flush)
    record_fifo_bit <= 1'b0;
  else if(record_fifo_bit_update)
    record_fifo_bit <= ~record_fifo_bit;
  else
    record_fifo_bit <= record_fifo_bit;
end

//-----------------Control Signal---------------------------
//record_fifo_update
//record fifo entry data will be updated when
//1.new back_br_taken
//2.new back_br_offset_less_15 or back_br_offset_less_16
//3.new back_br not hit any entry
//  a.entry not valid
//  b.pc not hit
assign record_fifo_update = ibctrl_lbuf_create_vld && 
                            cp0_ifu_lbuf_en && 
                            back_br_taken && 
                            (
                              back_br_offset_less_15 && 
                              back_br_inst_32 || 
                              back_br_offset_less_16 && 
                              !back_br_inst_32
                            ) && 
                            (lbuf_cur_state[5:0] == IDLE) &&
                            (
                              (
                                !(back_br_pc[PC_WIDTH-2:0] == record_fifo_entry0_pc[PC_WIDTH-2:0]) || 
                                !record_fifo_entry0_valid
                              ) && 
                              (
                                !(back_br_pc[PC_WIDTH-2:0] == record_fifo_entry1_pc[PC_WIDTH-2:0]) || 
                                !record_fifo_entry1_valid
                              )
                            );
assign record_fifo_update_gateclk_en = ibctrl_lbuf_create_vld && 
                                       cp0_ifu_lbuf_en && 
                                       back_br_taken && 
                                       (lbuf_cur_state[5:0] == IDLE);
//record_fifo_bit_update                            
//record_fifo_bit will be updated when
//1.record_fifo_update
//2.new back_br hit old entry
assign record_fifo_bit_update = ibctrl_lbuf_create_vld && 
                                cp0_ifu_lbuf_en && 
                                back_br_taken && 
                                (
                                  back_br_offset_less_15 && 
                                  back_br_inst_32 || 
                                  back_br_offset_less_16 && 
                                  !back_br_inst_32
                                ) && 
                                (lbuf_cur_state[5:0] == IDLE) &&
                                (
                                  (
                                    !(back_br_pc[PC_WIDTH-2:0] == record_fifo_entry0_pc[PC_WIDTH-2:0]) || 
                                    !record_fifo_entry0_valid
                                  ) && 
                                  (
                                    !(back_br_pc[PC_WIDTH-2:0] == record_fifo_entry1_pc[PC_WIDTH-2:0]) || 
                                    !record_fifo_entry1_valid
                                  ) || 
                                  (
                                    (back_br_pc[PC_WIDTH-2:0] == record_fifo_entry0_pc[PC_WIDTH-2:0]) && 
                                    record_fifo_entry0_valid && 
                                    !record_fifo_entry0_ban && 
                                    !record_fifo_bit
                                  ) || 
                                  (   
                                    (back_br_pc[PC_WIDTH-2:0] == record_fifo_entry1_pc[PC_WIDTH-2:0]) && 
                                    record_fifo_entry1_valid && 
                                    !record_fifo_entry1_ban && 
                                    record_fifo_bit
                                  )
                                );
//record_fifo_entry_ban_update
//record_fifo_entry_ban_update will be valid when 
//1.cur_state = FILL or FRONT_FILL or SUB_FRONT_FILL
//2.fill not under rule
//3.The new record back_br is out loop of old record back_br
assign record_fifo_entry_ban_update = (lbuf_cur_state[5:0] == FILL) && 
                                       fill_not_under_rule || 
                                      (lbuf_cur_state[5:0] == FRONT_FILL) && 
                                       front_fill_not_under_rule || 
                                       new_record_entry_out_loop;
assign record_fifo_entry_ban_update_gateclk_en = (lbuf_cur_state[5:0] == FILL) || 
                                                 (lbuf_cur_state[5:0] == FRONT_FILL) || 
                                                  record_fifo_update_flop;
//new_record_entry_out_loop
//when The new record back_br is out loop of old record back_br
//should set the ban bit of new back_br
//in case of outloop fill flush the filled inner loop                                     
assign new_record_entry_out_loop    = record_fifo_update_flop && 
                                      old_entry_valid && 
                                      (old_entry_pc[PC_WIDTH-2:0] < new_record_cur_pc[PC_WIDTH-2:0]) && 
                                      (old_entry_pc[PC_WIDTH-2:0] > new_record_target_pc[PC_WIDTH-2:0]);
always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    record_fifo_update_flop <= 1'b0;
  else if(lbuf_flush)
    record_fifo_update_flop <= 1'b0;
  else if(record_fifo_update)
    record_fifo_update_flop <= 1'b1;
  else
    record_fifo_update_flop <= 1'b0;
end  

always @(posedge record_fifo_entry_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    new_record_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    new_record_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  end
  else if(lbuf_flush)
  begin
    new_record_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    new_record_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  end
  else if(record_fifo_update)
  begin
    new_record_cur_pc[PC_WIDTH-2:0]    <= con_br_cur_pc[PC_WIDTH-2:0];
    new_record_target_pc[PC_WIDTH-2:0] <= con_br_cur_pc[PC_WIDTH-2:0] - {35'b0, back_br_offset[3:0]};
  end
  else
  begin
    new_record_cur_pc[PC_WIDTH-2:0]    <= new_record_cur_pc[PC_WIDTH-2:0];
    new_record_target_pc[PC_WIDTH-2:0] <= new_record_target_pc[PC_WIDTH-2:0];
  end
end

//record_fifo_entry_filled_update
//record_fifo_entry_filled_update will be valid when
//1.cur_state = FILL
//2.back_br_hit_lbuf_end(finish fill)
assign record_fifo_entry_filled_update = (lbuf_cur_state[5:0] == FILL) && 
                                         back_br_hit_lbuf_end;
                                          
//==========================================================
//                 Front Branch Buffer
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_front_buffer_update_clk"); @762
gated_clk_cell  x_front_buffer_update_clk (
  .clk_in                     (forever_cpuclk            ),
  .clk_out                    (front_buffer_update_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (cp0_yy_clk_en             ),
  .local_en                   (front_buffer_update_clk_en),
  .module_en                  (cp0_ifu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect( .clk_in         (forever_cpuclk), @763
//           .clk_out        (front_buffer_update_clk),//Out Clock @764
//           .external_en    (1'b0), @765
//           .global_en      (cp0_yy_clk_en), @766
//           .local_en       (front_buffer_update_clk_en),//Local Condition @767
//           .module_en      (cp0_ifu_icg_en) @768
//         ); @769
assign front_buffer_update_clk_en = front_entry_update || 
                                    front_entry_body_filled_update_gateclk_en || 
                                    lbuf_flush || 
                                    fill_state_enter; 

//Front branch Buffer Entry0
always @(posedge front_buffer_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    front_entry_vld                     <= 1'b0;
    front_entry_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    front_entry_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    front_entry_update_pointer[15:0]    <= 16'b1;
    front_entry_next_pointer[15:0]      <= 16'b1;
    front_entry_inst_32                 <= 1'b0;    
  end
  else if(lbuf_flush)
  begin
    front_entry_vld                     <= 1'b0;
    front_entry_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    front_entry_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    front_entry_update_pointer[15:0]    <= 16'b1;
    front_entry_next_pointer[15:0]      <= 16'b1;
    front_entry_inst_32                 <= 1'b0;    
  end
  else if(fill_state_enter)
  begin
    front_entry_vld                     <= 1'b0;
    front_entry_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    front_entry_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    front_entry_update_pointer[15:0]    <= 16'b1;
    front_entry_next_pointer[15:0]      <= 16'b1;
    front_entry_inst_32                 <= 1'b0;    
  end
  else if(front_entry_update)
  begin
    front_entry_vld                     <= 1'b1;
    front_entry_cur_pc[PC_WIDTH-2:0]    <= front_update_cur_pc[PC_WIDTH-2:0];
    front_entry_target_pc[PC_WIDTH-2:0] <= front_update_target_pc[PC_WIDTH-2:0];
    front_entry_update_pointer[15:0]    <= front_update_pointer[15:0];
    front_entry_next_pointer[15:0]      <= front_update_next_pointer[15:0];
    front_entry_inst_32                 <= front_update_inst_32;    
  end
  else
  begin
    front_entry_vld                     <= front_entry_vld;
    front_entry_cur_pc[PC_WIDTH-2:0]    <= front_entry_cur_pc[PC_WIDTH-2:0];
    front_entry_target_pc[PC_WIDTH-2:0] <= front_entry_target_pc[PC_WIDTH-2:0];
    front_entry_update_pointer[15:0]    <= front_entry_update_pointer[15:0];
    front_entry_next_pointer[15:0]      <= front_entry_next_pointer[15:0];
    front_entry_inst_32                 <= front_entry_inst_32;    
  end
end

//Body fill bit
always @(posedge front_buffer_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    front_entry_body_filled <= 1'b0;
  else if(lbuf_flush)
    front_entry_body_filled <= 1'b0;
  else if(fill_state_enter)
    front_entry_body_filled <= 1'b0;
  else if(front_entry_body_filled_update)
    front_entry_body_filled <= 1'b1;
  else
    front_entry_body_filled <= front_entry_body_filled;
end

//fill_state_enter
//When IDLE turn to FILL state
assign fill_state_enter               = (lbuf_cur_state[5:0] == IDLE) && 
                                        back_br_hit_record_fifo_unfill;
assign idle_cache_state_enter         = (lbuf_cur_state[5:0] == IDLE) && 
                                        back_br_hit_record_fifo_fill;
assign front_cache_active_state_enter = (lbuf_cur_state[5:0] == FRONT_CACHE) && 
                                        ibuf_empty;
//front_entry_update
//When FILL state turn to FRONT_BRANCH state
//Record the information of front branch
//When the cycle after FILL state turn to FRONT_BRANCH state
//Calculate the front_update_xxx value 
//and update it to front entry
assign front_entry_update = (lbuf_cur_state[5:0] == FRONT_BRANCH);
//front_entry_body_filled_update
//When enter fill state, fill bit clear zero
//when FILL state && front_branch_under rule && !bht_result, set 1
//When FILL state && front_branch_under_rule &&  bht_result, set 0
//When FRONT_BRANCH state fill finish and turn to FILL, set 1
assign front_entry_body_filled_update = (lbuf_cur_state[5:0] == FILL) && 
                                        front_br_check && 
                                        !front_br_taken && 
                                        lbuf_create_vld || 
                                        (lbuf_cur_state[5:0] == FRONT_FILL) && 
                                        front_br_body_fill_finish || 
                                        (lbuf_cur_state[5:0] == FRONT_CACHE) && 
                                        front_br_body_fill_finish;
assign front_entry_body_filled_update_gateclk_en = (lbuf_cur_state[5:0] == FILL) || 
                                                   (lbuf_cur_state[5:0] == FRONT_FILL) || 
                                                   (lbuf_cur_state[5:0] == FRONT_CACHE);

//-------------------front_update_value---------------------
assign front_update_br_taken        = front_update_pre_br_taken;
assign front_update_offset[3:0]     = front_update_pre_offset[3:0];
assign front_update_cur_pc[PC_WIDTH-2:0]    = front_update_pre_cur_pc[PC_WIDTH-2:0];
assign front_update_target_pc[PC_WIDTH-2:0] = front_update_pre_cur_pc[PC_WIDTH-2:0] + 
                                              {35'b0, front_update_pre_offset[3:0]};
assign front_update_inst_32                 = front_update_pre_inst_32;                                    
// &CombBeg; @879
always @( front_update_pre_offset[3:0]
       or front_update_pre_pointer[15:0])
begin
case(front_update_pre_offset[3:0])
  4'b0000 : front_update_pointer[ENTRY_NUM-1:0] =  front_update_pre_pointer[ENTRY_NUM-1:0];
  4'b0001 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-2:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1]};
  4'b0010 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-3:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
  4'b0011 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-4:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
  4'b0100 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-5:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
  4'b0101 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-6:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
  4'b0110 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-7:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
  4'b0111 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-8:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-7]};
  4'b1000 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-9:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-8]};
  4'b1001 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-10:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-9]};
  4'b1010 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-11:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-10]};
  4'b1011 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-12:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-11]};
  4'b1100 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-13:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-12]};
  4'b1101 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-14:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-13]};
  4'b1110 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-15:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-14]};
  4'b1111 : front_update_pointer[ENTRY_NUM-1:0] = {front_update_pre_pointer[ENTRY_NUM-16:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-15]};
  default : front_update_pointer[ENTRY_NUM-1:0] =  front_update_pre_pointer[ENTRY_NUM-1:0];
endcase  
// &CombEnd; @914
end

assign front_update_next_pointer[ENTRY_NUM-1:0] = (front_update_inst_32)
                                                ? {front_update_pre_pointer[ENTRY_NUM-3:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1:ENTRY_NUM-2]}
                                                : {front_update_pre_pointer[ENTRY_NUM-2:0], 
                                                   front_update_pre_pointer[ENTRY_NUM-1]};

//front_update_pre_vld
//when FILL state turn to FRONT_BRANCH, record information
//to front_update_pre register
assign front_update_pre_vld = (lbuf_cur_state[5:0] == FILL) && 
                              front_br_check && 
                              !front_br_oversize && 
                              ibctrl_lbuf_create_vld;
always @(posedge front_update_pre_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    front_update_pre_br_taken               <= 1'b0;
    front_update_pre_offset[3:0]            <= 4'b0;
    front_update_pre_cur_pc[PC_WIDTH-2:0]   <= {PC_WIDTH-1{1'b0}};
    front_update_pre_pointer[ENTRY_NUM-1:0] <= 16'b0;
    front_update_pre_inst_32                <= 1'b0;
  end
  else if(lbuf_flush)
  begin
    front_update_pre_br_taken               <= 1'b0;
    front_update_pre_offset[3:0]            <= 4'b0;
    front_update_pre_cur_pc[PC_WIDTH-2:0]   <= {PC_WIDTH-1{1'b0}};
    front_update_pre_pointer[ENTRY_NUM-1:0] <= 16'b0;
    front_update_pre_inst_32                <= 1'b0;
  end
  else if(front_update_pre_vld)
  begin
    front_update_pre_br_taken               <= front_br_taken;
    front_update_pre_offset[3:0]            <= front_br_offset[3:0];
    front_update_pre_cur_pc[PC_WIDTH-2:0]   <= front_br_pc[PC_WIDTH-2:0];
    front_update_pre_pointer[ENTRY_NUM-1:0] <= lbuf_front_br_pointer_pre[ENTRY_NUM-1:0];
    front_update_pre_inst_32                <= front_br_inst_32; 
  end
  else
  begin
    front_update_pre_br_taken               <= front_update_pre_br_taken;
    front_update_pre_offset[3:0]            <= front_update_pre_offset[3:0];
    front_update_pre_cur_pc[PC_WIDTH-2:0]   <= front_update_pre_cur_pc[PC_WIDTH-2:0];
    front_update_pre_pointer[ENTRY_NUM-1:0] <= front_update_pre_pointer[ENTRY_NUM-1:0];
    front_update_pre_inst_32                <= front_update_pre_inst_32; 
  end
end
    
//Gate Clk
// &Instance("gated_clk_cell","x_front_update_pre_clk"); @966
gated_clk_cell  x_front_update_pre_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (front_update_pre_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (front_update_pre_clk_en),
  .module_en               (cp0_ifu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect( .clk_in         (forever_cpuclk), @967
//           .clk_out        (front_update_pre_clk),//Out Clock @968
//           .external_en    (1'b0), @969
//           .global_en      (cp0_yy_clk_en), @970
//           .local_en       (front_update_pre_clk_en),//Local Condition @971
//           .module_en      (cp0_ifu_icg_en) @972
//         ); @973
assign front_update_pre_clk_en = lbuf_flush || 
                                 front_update_pre_vld;

//front_update_pre_branch_half_num means
//the number of half word before con br
// &CombBeg; @979
always @( lbuf_create_pointer[15:0]
       or con_br_half_num[3:0])
begin
case(con_br_half_num[3:0])
  4'b0000 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] =  lbuf_create_pointer[ENTRY_NUM-1:0];
  4'b0001 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-2:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1]};
  4'b0010 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-3:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
  4'b0011 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-4:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
  4'b0100 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-5:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
  4'b0101 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-6:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
  4'b0110 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-7:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
  4'b0111 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-8:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-7]};
  4'b1000 : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-9:0], 
                                                        lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-8]};
  default : lbuf_front_br_pointer_pre[ENTRY_NUM-1:0] =  lbuf_create_pointer[ENTRY_NUM-1:0];
endcase
// &CombEnd; @1000
end
                                    
//==========================================================
//                Front Br Body Number
//==========================================================
//front branch body number used to mask the inst filled into
//loop buffer on FRONT_FILL state
// &CombBeg; @1007
always @( front_br_body_num[3:0]
       or half_vld_num[3:0]
       or front_update_offset[3:0]
       or lbuf_create_vld
       or front_branch_state
       or front_fill_state
       or front_br_body_num_record[3:0]
       or front_update_br_taken
       or front_fill_enter
       or front_update_inst_32)
begin
if(front_branch_state && front_update_br_taken)
  front_br_body_num_pre[3:0] = (front_update_inst_32)
                             ? (front_update_offset[3:0] - 4'b0010) 
                             : (front_update_offset[3:0] - 4'b0001);
else if(front_fill_state && lbuf_create_vld)
  front_br_body_num_pre[3:0] = (half_vld_num[3:0] < front_br_body_num[3:0]) 
                             ? (front_br_body_num[3:0] - half_vld_num[3:0]) 
                             : 4'b0;
else if(front_fill_enter)
  front_br_body_num_pre[3:0] = front_br_body_num_record[3:0];
else
  front_br_body_num_pre[3:0] = front_br_body_num[3:0]; 
// &CombEnd; @1020
end

always @(posedge front_br_body_num_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    front_br_body_num_record[3:0] <= 4'b0;
  else if(front_branch_state && front_update_br_taken)
    front_br_body_num_record[3:0] <= front_br_body_num_pre[3:0];
  else
    front_br_body_num_record[3:0] <= front_br_body_num_record[3:0];
end

always @(posedge front_br_body_num_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    front_br_body_num[3:0] <= 4'b0;
  else if(lbuf_flush)
    front_br_body_num[3:0] <= 4'b0;
  else if(fill_state_enter)
    front_br_body_num[3:0] <= 4'b0;
  else if(front_br_body_num_update)
    front_br_body_num[3:0] <= front_br_body_num_pre[3:0];
  else
    front_br_body_num[3:0] <= front_br_body_num[3:0];
end

assign front_br_body_num_update = (front_branch_state && 
                                   front_update_br_taken) || 
                                  (front_fill_state && 
                                   lbuf_create_vld) || 
                                   front_fill_enter;
//Gate clk
// &Instance("gated_clk_cell","x_front_br_body_num_update_clk"); @1052
gated_clk_cell  x_front_br_body_num_update_clk (
  .clk_in                          (forever_cpuclk                 ),
  .clk_out                         (front_br_body_num_update_clk   ),
  .external_en                     (1'b0                           ),
  .global_en                       (cp0_yy_clk_en                  ),
  .local_en                        (front_br_body_num_update_clk_en),
  .module_en                       (cp0_ifu_icg_en                 ),
  .pad_yy_icg_scan_en              (pad_yy_icg_scan_en             )
);

// &Connect( .clk_in         (forever_cpuclk), @1053
//           .clk_out        (front_br_body_num_update_clk),//Out Clock @1054
//           .external_en    (1'b0), @1055
//           .global_en      (cp0_yy_clk_en), @1056
//           .local_en       (front_br_body_num_update_clk_en),//Local Condition @1057
//           .module_en      (cp0_ifu_icg_en) @1058
//         ); @1059
assign front_br_body_num_update_clk_en = front_branch_state || 
                                         front_fill_state || 
                                         front_fill_enter || 
                                         lbuf_flush;

// &CombBeg; @1065
always @( front_br_body_num[3:0])
begin
case(front_br_body_num[3:0])
  4'b0000 : front_vld_mask[8:0] = 9'b000_000_000;
  4'b0001 : front_vld_mask[8:0] = 9'b100_000_000;
  4'b0010 : front_vld_mask[8:0] = 9'b110_000_000;
  4'b0011 : front_vld_mask[8:0] = 9'b111_000_000;
  4'b0100 : front_vld_mask[8:0] = 9'b111_100_000;
  4'b0101 : front_vld_mask[8:0] = 9'b111_110_000;
  4'b0110 : front_vld_mask[8:0] = 9'b111_111_000;
  4'b0111 : front_vld_mask[8:0] = 9'b111_111_100;
  4'b1000 : front_vld_mask[8:0] = 9'b111_111_110;
  default : front_vld_mask[8:0] = 9'b111_111_111;
endcase
// &CombEnd; @1078
end

assign front_branch_state        = (lbuf_cur_state[5:0] == FRONT_BRANCH);
assign front_fill_state          = (lbuf_cur_state[5:0] == FRONT_FILL);  

//==========================================================
//                 Back Branch Buffer
//==========================================================
//Gate Clk
// &Instance("gated_clk_cell","x_back_buffer_update_clk"); @1087
gated_clk_cell  x_back_buffer_update_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (back_buffer_update_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (back_buffer_update_clk_en),
  .module_en                 (cp0_ifu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect( .clk_in         (forever_cpuclk), @1088
//           .clk_out        (back_buffer_update_clk),//Out Clock @1089
//           .external_en    (1'b0), @1090
//           .global_en      (cp0_yy_clk_en), @1091
//           .local_en       (back_buffer_update_clk_en),//Local Condition @1092
//           .module_en      (cp0_ifu_icg_en) @1093
//         ); @1094
assign back_buffer_update_clk_en = back_entry_update || 
                                   lbuf_flush || 
                                   fill_state_enter; 

//Back branch Buffer Entry
always @(posedge back_buffer_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    back_entry_vld                     <= 1'b0;
    back_entry_start_num[3:0]          <= 4'b0;
    back_entry_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    back_entry_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    back_entry_inst_32                 <= 1'b0;
  end
  else if(lbuf_flush)
  begin
    back_entry_vld                     <= 1'b0;
    back_entry_start_num[3:0]          <= 4'b0;
    back_entry_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    back_entry_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    back_entry_inst_32                 <= 1'b0;
  end
  else if(fill_state_enter)
  begin
    back_entry_vld                     <= 1'b0;
    back_entry_start_num[3:0]          <= new_entry_start_num[3:0];
    back_entry_cur_pc[PC_WIDTH-2:0]    <= {PC_WIDTH-1{1'b0}};
    back_entry_target_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    back_entry_inst_32                 <= 1'b0;
  end
  else if(back_entry_update)
  begin
    back_entry_vld                     <= 1'b1;
    back_entry_start_num[3:0]          <= back_entry_start_num[3:0];
    back_entry_cur_pc[PC_WIDTH-2:0]    <= back_update_cur_pc[PC_WIDTH-2:0];
    back_entry_target_pc[PC_WIDTH-2:0] <= back_update_target_pc[PC_WIDTH-2:0];
    back_entry_inst_32                 <= back_update_inst_32;
  end
  else
  begin
    back_entry_vld                     <= back_entry_vld;
    back_entry_start_num[3:0]          <= back_entry_start_num[3:0];
    back_entry_cur_pc[PC_WIDTH-2:0]    <= back_entry_cur_pc[PC_WIDTH-2:0];
    back_entry_target_pc[PC_WIDTH-2:0] <= back_entry_target_pc[PC_WIDTH-2:0];
    back_entry_inst_32                 <= back_entry_inst_32;
  end
end

//back_entry_update
//When FILL state enter CACHE state
//record information into back_update_pre_xxx register
//When the first cycle of CACHE
//Update back_entry_xxx
assign back_entry_update = (lbuf_cur_state[5:0] == CACHE) && 
                           back_update_pre_vld_flop;
always @(posedge back_update_pre_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    back_update_pre_vld_flop <= 1'b0;
  else if(lbuf_flush)
    back_update_pre_vld_flop <= 1'b0;
  else
    back_update_pre_vld_flop <= back_update_pre_vld;
end
                         
//-----------------back update value------------------------
assign back_update_cur_pc[PC_WIDTH-2:0]    = back_update_pre_cur_pc[PC_WIDTH-2:0];
assign back_update_target_pc[PC_WIDTH-2:0] = back_update_pre_tar_pc[PC_WIDTH-2:0];
assign back_update_inst_32                 = back_update_pre_inst_32;                                  

//back_update_pre_vld
//when FILL state turn to CACHE, record information
//to back_update_pre register
assign back_update_pre_vld = (lbuf_cur_state[5:0] == FILL) && 
                              back_br_hit_lbuf_end;
always @(posedge back_update_pre_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    back_update_pre_tar_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    back_update_pre_cur_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    back_update_pre_inst_32              <= 1'b0;
  end
  else if(lbuf_flush)
  begin
    back_update_pre_tar_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    back_update_pre_cur_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
    back_update_pre_inst_32              <= 1'b0;
  end
  else if(back_update_pre_vld)
  begin
    back_update_pre_tar_pc[PC_WIDTH-2:0] <= back_br_tar_pc[PC_WIDTH-2:0];
    back_update_pre_cur_pc[PC_WIDTH-2:0] <= back_br_pc[PC_WIDTH-2:0];
    back_update_pre_inst_32              <= back_br_inst_32;
  end
  else
  begin
    back_update_pre_tar_pc[PC_WIDTH-2:0] <= back_update_pre_tar_pc[PC_WIDTH-2:0];
    back_update_pre_cur_pc[PC_WIDTH-2:0] <= back_update_pre_cur_pc[PC_WIDTH-2:0];
    back_update_pre_inst_32              <= back_update_pre_inst_32;
  end
end
    
//Gate Clk
// &Instance("gated_clk_cell","x_back_update_pre_clk"); @1200
gated_clk_cell  x_back_update_pre_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (back_update_pre_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (back_update_pre_clk_en),
  .module_en              (cp0_ifu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( .clk_in         (forever_cpuclk), @1201
//           .clk_out        (back_update_pre_clk),//Out Clock @1202
//           .external_en    (1'b0), @1203
//           .global_en      (cp0_yy_clk_en), @1204
//           .local_en       (back_update_pre_clk_en),//Local Condition @1205
//           .module_en      (cp0_ifu_icg_en) @1206
//         ); @1207
assign back_update_pre_clk_en = lbuf_flush || 
                                back_update_pre_vld_flop || 
                                (lbuf_cur_state[5:0] == FILL) && 
                                back_br_taken;

//==========================================================
//                 LBUF Entry Connect
//==========================================================
// &ConnRule(s/_x$/[0]/); @1216
// &ConnRule(s/_v$/_0/); @1217
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_0"); @1218
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_0 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[0]         ),
  .entry_back_br_x            (entry_back_br[0]          ),
  .entry_bkpta_x              (entry_bkpta[0]            ),
  .entry_bkptb_x              (entry_bkptb[0]            ),
  .entry_create_32_start_x    (entry_create_32_start[0]  ),
  .entry_create_back_br_x     (entry_create_back_br[0]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[0]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[0]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[0]    ),
  .entry_create_fence_x       (entry_create_fence[0]     ),
  .entry_create_front_br_x    (entry_create_front_br[0]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_0  ),
  .entry_create_split0_type_v (entry_create_split0_type_0),
  .entry_create_split1_type_v (entry_create_split1_type_0),
  .entry_create_vl_v          (entry_create_vl_0         ),
  .entry_create_vlmul_v       (entry_create_vlmul_0      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[0]   ),
  .entry_create_vsew_v        (entry_create_vsew_0       ),
  .entry_create_x             (entry_create[0]           ),
  .entry_fence_x              (entry_fence[0]            ),
  .entry_front_br_x           (entry_front_br[0]         ),
  .entry_inst_data_v          (entry_inst_data_0         ),
  .entry_split0_type_v        (entry_split0_type_0       ),
  .entry_split1_type_v        (entry_split1_type_0       ),
  .entry_vl_v                 (entry_vl_0                ),
  .entry_vld_x                (entry_vld[0]              ),
  .entry_vlmul_v              (entry_vlmul_0             ),
  .entry_vsetvli_x            (entry_vsetvli[0]          ),
  .entry_vsew_v               (entry_vsew_0              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[1]/); @1220
// &ConnRule(s/_v$/_1/); @1221
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_1"); @1222
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_1 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[1]         ),
  .entry_back_br_x            (entry_back_br[1]          ),
  .entry_bkpta_x              (entry_bkpta[1]            ),
  .entry_bkptb_x              (entry_bkptb[1]            ),
  .entry_create_32_start_x    (entry_create_32_start[1]  ),
  .entry_create_back_br_x     (entry_create_back_br[1]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[1]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[1]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[1]    ),
  .entry_create_fence_x       (entry_create_fence[1]     ),
  .entry_create_front_br_x    (entry_create_front_br[1]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_1  ),
  .entry_create_split0_type_v (entry_create_split0_type_1),
  .entry_create_split1_type_v (entry_create_split1_type_1),
  .entry_create_vl_v          (entry_create_vl_1         ),
  .entry_create_vlmul_v       (entry_create_vlmul_1      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[1]   ),
  .entry_create_vsew_v        (entry_create_vsew_1       ),
  .entry_create_x             (entry_create[1]           ),
  .entry_fence_x              (entry_fence[1]            ),
  .entry_front_br_x           (entry_front_br[1]         ),
  .entry_inst_data_v          (entry_inst_data_1         ),
  .entry_split0_type_v        (entry_split0_type_1       ),
  .entry_split1_type_v        (entry_split1_type_1       ),
  .entry_vl_v                 (entry_vl_1                ),
  .entry_vld_x                (entry_vld[1]              ),
  .entry_vlmul_v              (entry_vlmul_1             ),
  .entry_vsetvli_x            (entry_vsetvli[1]          ),
  .entry_vsew_v               (entry_vsew_1              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[2]/); @1224
// &ConnRule(s/_v$/_2/); @1225
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_2"); @1226
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_2 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[2]         ),
  .entry_back_br_x            (entry_back_br[2]          ),
  .entry_bkpta_x              (entry_bkpta[2]            ),
  .entry_bkptb_x              (entry_bkptb[2]            ),
  .entry_create_32_start_x    (entry_create_32_start[2]  ),
  .entry_create_back_br_x     (entry_create_back_br[2]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[2]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[2]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[2]    ),
  .entry_create_fence_x       (entry_create_fence[2]     ),
  .entry_create_front_br_x    (entry_create_front_br[2]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_2  ),
  .entry_create_split0_type_v (entry_create_split0_type_2),
  .entry_create_split1_type_v (entry_create_split1_type_2),
  .entry_create_vl_v          (entry_create_vl_2         ),
  .entry_create_vlmul_v       (entry_create_vlmul_2      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[2]   ),
  .entry_create_vsew_v        (entry_create_vsew_2       ),
  .entry_create_x             (entry_create[2]           ),
  .entry_fence_x              (entry_fence[2]            ),
  .entry_front_br_x           (entry_front_br[2]         ),
  .entry_inst_data_v          (entry_inst_data_2         ),
  .entry_split0_type_v        (entry_split0_type_2       ),
  .entry_split1_type_v        (entry_split1_type_2       ),
  .entry_vl_v                 (entry_vl_2                ),
  .entry_vld_x                (entry_vld[2]              ),
  .entry_vlmul_v              (entry_vlmul_2             ),
  .entry_vsetvli_x            (entry_vsetvli[2]          ),
  .entry_vsew_v               (entry_vsew_2              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[3]/); @1228
// &ConnRule(s/_v$/_3/); @1229
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_3"); @1230
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_3 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[3]         ),
  .entry_back_br_x            (entry_back_br[3]          ),
  .entry_bkpta_x              (entry_bkpta[3]            ),
  .entry_bkptb_x              (entry_bkptb[3]            ),
  .entry_create_32_start_x    (entry_create_32_start[3]  ),
  .entry_create_back_br_x     (entry_create_back_br[3]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[3]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[3]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[3]    ),
  .entry_create_fence_x       (entry_create_fence[3]     ),
  .entry_create_front_br_x    (entry_create_front_br[3]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_3  ),
  .entry_create_split0_type_v (entry_create_split0_type_3),
  .entry_create_split1_type_v (entry_create_split1_type_3),
  .entry_create_vl_v          (entry_create_vl_3         ),
  .entry_create_vlmul_v       (entry_create_vlmul_3      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[3]   ),
  .entry_create_vsew_v        (entry_create_vsew_3       ),
  .entry_create_x             (entry_create[3]           ),
  .entry_fence_x              (entry_fence[3]            ),
  .entry_front_br_x           (entry_front_br[3]         ),
  .entry_inst_data_v          (entry_inst_data_3         ),
  .entry_split0_type_v        (entry_split0_type_3       ),
  .entry_split1_type_v        (entry_split1_type_3       ),
  .entry_vl_v                 (entry_vl_3                ),
  .entry_vld_x                (entry_vld[3]              ),
  .entry_vlmul_v              (entry_vlmul_3             ),
  .entry_vsetvli_x            (entry_vsetvli[3]          ),
  .entry_vsew_v               (entry_vsew_3              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[4]/); @1232
// &ConnRule(s/_v$/_4/); @1233
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_4"); @1234
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_4 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[4]         ),
  .entry_back_br_x            (entry_back_br[4]          ),
  .entry_bkpta_x              (entry_bkpta[4]            ),
  .entry_bkptb_x              (entry_bkptb[4]            ),
  .entry_create_32_start_x    (entry_create_32_start[4]  ),
  .entry_create_back_br_x     (entry_create_back_br[4]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[4]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[4]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[4]    ),
  .entry_create_fence_x       (entry_create_fence[4]     ),
  .entry_create_front_br_x    (entry_create_front_br[4]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_4  ),
  .entry_create_split0_type_v (entry_create_split0_type_4),
  .entry_create_split1_type_v (entry_create_split1_type_4),
  .entry_create_vl_v          (entry_create_vl_4         ),
  .entry_create_vlmul_v       (entry_create_vlmul_4      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[4]   ),
  .entry_create_vsew_v        (entry_create_vsew_4       ),
  .entry_create_x             (entry_create[4]           ),
  .entry_fence_x              (entry_fence[4]            ),
  .entry_front_br_x           (entry_front_br[4]         ),
  .entry_inst_data_v          (entry_inst_data_4         ),
  .entry_split0_type_v        (entry_split0_type_4       ),
  .entry_split1_type_v        (entry_split1_type_4       ),
  .entry_vl_v                 (entry_vl_4                ),
  .entry_vld_x                (entry_vld[4]              ),
  .entry_vlmul_v              (entry_vlmul_4             ),
  .entry_vsetvli_x            (entry_vsetvli[4]          ),
  .entry_vsew_v               (entry_vsew_4              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[5]/); @1236
// &ConnRule(s/_v$/_5/); @1237
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_5"); @1238
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_5 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[5]         ),
  .entry_back_br_x            (entry_back_br[5]          ),
  .entry_bkpta_x              (entry_bkpta[5]            ),
  .entry_bkptb_x              (entry_bkptb[5]            ),
  .entry_create_32_start_x    (entry_create_32_start[5]  ),
  .entry_create_back_br_x     (entry_create_back_br[5]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[5]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[5]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[5]    ),
  .entry_create_fence_x       (entry_create_fence[5]     ),
  .entry_create_front_br_x    (entry_create_front_br[5]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_5  ),
  .entry_create_split0_type_v (entry_create_split0_type_5),
  .entry_create_split1_type_v (entry_create_split1_type_5),
  .entry_create_vl_v          (entry_create_vl_5         ),
  .entry_create_vlmul_v       (entry_create_vlmul_5      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[5]   ),
  .entry_create_vsew_v        (entry_create_vsew_5       ),
  .entry_create_x             (entry_create[5]           ),
  .entry_fence_x              (entry_fence[5]            ),
  .entry_front_br_x           (entry_front_br[5]         ),
  .entry_inst_data_v          (entry_inst_data_5         ),
  .entry_split0_type_v        (entry_split0_type_5       ),
  .entry_split1_type_v        (entry_split1_type_5       ),
  .entry_vl_v                 (entry_vl_5                ),
  .entry_vld_x                (entry_vld[5]              ),
  .entry_vlmul_v              (entry_vlmul_5             ),
  .entry_vsetvli_x            (entry_vsetvli[5]          ),
  .entry_vsew_v               (entry_vsew_5              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[6]/); @1240
// &ConnRule(s/_v$/_6/); @1241
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_6"); @1242
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_6 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[6]         ),
  .entry_back_br_x            (entry_back_br[6]          ),
  .entry_bkpta_x              (entry_bkpta[6]            ),
  .entry_bkptb_x              (entry_bkptb[6]            ),
  .entry_create_32_start_x    (entry_create_32_start[6]  ),
  .entry_create_back_br_x     (entry_create_back_br[6]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[6]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[6]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[6]    ),
  .entry_create_fence_x       (entry_create_fence[6]     ),
  .entry_create_front_br_x    (entry_create_front_br[6]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_6  ),
  .entry_create_split0_type_v (entry_create_split0_type_6),
  .entry_create_split1_type_v (entry_create_split1_type_6),
  .entry_create_vl_v          (entry_create_vl_6         ),
  .entry_create_vlmul_v       (entry_create_vlmul_6      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[6]   ),
  .entry_create_vsew_v        (entry_create_vsew_6       ),
  .entry_create_x             (entry_create[6]           ),
  .entry_fence_x              (entry_fence[6]            ),
  .entry_front_br_x           (entry_front_br[6]         ),
  .entry_inst_data_v          (entry_inst_data_6         ),
  .entry_split0_type_v        (entry_split0_type_6       ),
  .entry_split1_type_v        (entry_split1_type_6       ),
  .entry_vl_v                 (entry_vl_6                ),
  .entry_vld_x                (entry_vld[6]              ),
  .entry_vlmul_v              (entry_vlmul_6             ),
  .entry_vsetvli_x            (entry_vsetvli[6]          ),
  .entry_vsew_v               (entry_vsew_6              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[7]/); @1244
// &ConnRule(s/_v$/_7/); @1245
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_7"); @1246
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_7 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[7]         ),
  .entry_back_br_x            (entry_back_br[7]          ),
  .entry_bkpta_x              (entry_bkpta[7]            ),
  .entry_bkptb_x              (entry_bkptb[7]            ),
  .entry_create_32_start_x    (entry_create_32_start[7]  ),
  .entry_create_back_br_x     (entry_create_back_br[7]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[7]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[7]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[7]    ),
  .entry_create_fence_x       (entry_create_fence[7]     ),
  .entry_create_front_br_x    (entry_create_front_br[7]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_7  ),
  .entry_create_split0_type_v (entry_create_split0_type_7),
  .entry_create_split1_type_v (entry_create_split1_type_7),
  .entry_create_vl_v          (entry_create_vl_7         ),
  .entry_create_vlmul_v       (entry_create_vlmul_7      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[7]   ),
  .entry_create_vsew_v        (entry_create_vsew_7       ),
  .entry_create_x             (entry_create[7]           ),
  .entry_fence_x              (entry_fence[7]            ),
  .entry_front_br_x           (entry_front_br[7]         ),
  .entry_inst_data_v          (entry_inst_data_7         ),
  .entry_split0_type_v        (entry_split0_type_7       ),
  .entry_split1_type_v        (entry_split1_type_7       ),
  .entry_vl_v                 (entry_vl_7                ),
  .entry_vld_x                (entry_vld[7]              ),
  .entry_vlmul_v              (entry_vlmul_7             ),
  .entry_vsetvli_x            (entry_vsetvli[7]          ),
  .entry_vsew_v               (entry_vsew_7              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[8]/); @1248
// &ConnRule(s/_v$/_8/); @1249
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_8"); @1250
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_8 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[8]         ),
  .entry_back_br_x            (entry_back_br[8]          ),
  .entry_bkpta_x              (entry_bkpta[8]            ),
  .entry_bkptb_x              (entry_bkptb[8]            ),
  .entry_create_32_start_x    (entry_create_32_start[8]  ),
  .entry_create_back_br_x     (entry_create_back_br[8]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[8]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[8]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[8]    ),
  .entry_create_fence_x       (entry_create_fence[8]     ),
  .entry_create_front_br_x    (entry_create_front_br[8]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_8  ),
  .entry_create_split0_type_v (entry_create_split0_type_8),
  .entry_create_split1_type_v (entry_create_split1_type_8),
  .entry_create_vl_v          (entry_create_vl_8         ),
  .entry_create_vlmul_v       (entry_create_vlmul_8      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[8]   ),
  .entry_create_vsew_v        (entry_create_vsew_8       ),
  .entry_create_x             (entry_create[8]           ),
  .entry_fence_x              (entry_fence[8]            ),
  .entry_front_br_x           (entry_front_br[8]         ),
  .entry_inst_data_v          (entry_inst_data_8         ),
  .entry_split0_type_v        (entry_split0_type_8       ),
  .entry_split1_type_v        (entry_split1_type_8       ),
  .entry_vl_v                 (entry_vl_8                ),
  .entry_vld_x                (entry_vld[8]              ),
  .entry_vlmul_v              (entry_vlmul_8             ),
  .entry_vsetvli_x            (entry_vsetvli[8]          ),
  .entry_vsew_v               (entry_vsew_8              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[9]/); @1252
// &ConnRule(s/_v$/_9/); @1253
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_9"); @1254
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_9 (
  .cp0_ifu_icg_en             (cp0_ifu_icg_en            ),
  .cp0_yy_clk_en              (cp0_yy_clk_en             ),
  .cpurst_b                   (cpurst_b                  ),
  .entry_32_start_x           (entry_32_start[9]         ),
  .entry_back_br_x            (entry_back_br[9]          ),
  .entry_bkpta_x              (entry_bkpta[9]            ),
  .entry_bkptb_x              (entry_bkptb[9]            ),
  .entry_create_32_start_x    (entry_create_32_start[9]  ),
  .entry_create_back_br_x     (entry_create_back_br[9]   ),
  .entry_create_bkpta_x       (entry_create_bkpta[9]     ),
  .entry_create_bkptb_x       (entry_create_bkptb[9]     ),
  .entry_create_clk_en_x      (entry_create_clk_en[9]    ),
  .entry_create_fence_x       (entry_create_fence[9]     ),
  .entry_create_front_br_x    (entry_create_front_br[9]  ),
  .entry_create_inst_data_v   (entry_create_inst_data_9  ),
  .entry_create_split0_type_v (entry_create_split0_type_9),
  .entry_create_split1_type_v (entry_create_split1_type_9),
  .entry_create_vl_v          (entry_create_vl_9         ),
  .entry_create_vlmul_v       (entry_create_vlmul_9      ),
  .entry_create_vsetvli_x     (entry_create_vsetvli[9]   ),
  .entry_create_vsew_v        (entry_create_vsew_9       ),
  .entry_create_x             (entry_create[9]           ),
  .entry_fence_x              (entry_fence[9]            ),
  .entry_front_br_x           (entry_front_br[9]         ),
  .entry_inst_data_v          (entry_inst_data_9         ),
  .entry_split0_type_v        (entry_split0_type_9       ),
  .entry_split1_type_v        (entry_split1_type_9       ),
  .entry_vl_v                 (entry_vl_9                ),
  .entry_vld_x                (entry_vld[9]              ),
  .entry_vlmul_v              (entry_vlmul_9             ),
  .entry_vsetvli_x            (entry_vsetvli[9]          ),
  .entry_vsew_v               (entry_vsew_9              ),
  .fill_state_enter           (fill_state_enter          ),
  .forever_cpuclk             (forever_cpuclk            ),
  .lbuf_flush                 (lbuf_flush                ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);


// &ConnRule(s/_x$/[10]/); @1256
// &ConnRule(s/_v$/_10/); @1257
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_10"); @1258
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_10 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[10]         ),
  .entry_back_br_x             (entry_back_br[10]          ),
  .entry_bkpta_x               (entry_bkpta[10]            ),
  .entry_bkptb_x               (entry_bkptb[10]            ),
  .entry_create_32_start_x     (entry_create_32_start[10]  ),
  .entry_create_back_br_x      (entry_create_back_br[10]   ),
  .entry_create_bkpta_x        (entry_create_bkpta[10]     ),
  .entry_create_bkptb_x        (entry_create_bkptb[10]     ),
  .entry_create_clk_en_x       (entry_create_clk_en[10]    ),
  .entry_create_fence_x        (entry_create_fence[10]     ),
  .entry_create_front_br_x     (entry_create_front_br[10]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_10  ),
  .entry_create_split0_type_v  (entry_create_split0_type_10),
  .entry_create_split1_type_v  (entry_create_split1_type_10),
  .entry_create_vl_v           (entry_create_vl_10         ),
  .entry_create_vlmul_v        (entry_create_vlmul_10      ),
  .entry_create_vsetvli_x      (entry_create_vsetvli[10]   ),
  .entry_create_vsew_v         (entry_create_vsew_10       ),
  .entry_create_x              (entry_create[10]           ),
  .entry_fence_x               (entry_fence[10]            ),
  .entry_front_br_x            (entry_front_br[10]         ),
  .entry_inst_data_v           (entry_inst_data_10         ),
  .entry_split0_type_v         (entry_split0_type_10       ),
  .entry_split1_type_v         (entry_split1_type_10       ),
  .entry_vl_v                  (entry_vl_10                ),
  .entry_vld_x                 (entry_vld[10]              ),
  .entry_vlmul_v               (entry_vlmul_10             ),
  .entry_vsetvli_x             (entry_vsetvli[10]          ),
  .entry_vsew_v                (entry_vsew_10              ),
  .fill_state_enter            (fill_state_enter           ),
  .forever_cpuclk              (forever_cpuclk             ),
  .lbuf_flush                  (lbuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[11]/); @1260
// &ConnRule(s/_v$/_11/); @1261
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_11"); @1262
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_11 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[11]         ),
  .entry_back_br_x             (entry_back_br[11]          ),
  .entry_bkpta_x               (entry_bkpta[11]            ),
  .entry_bkptb_x               (entry_bkptb[11]            ),
  .entry_create_32_start_x     (entry_create_32_start[11]  ),
  .entry_create_back_br_x      (entry_create_back_br[11]   ),
  .entry_create_bkpta_x        (entry_create_bkpta[11]     ),
  .entry_create_bkptb_x        (entry_create_bkptb[11]     ),
  .entry_create_clk_en_x       (entry_create_clk_en[11]    ),
  .entry_create_fence_x        (entry_create_fence[11]     ),
  .entry_create_front_br_x     (entry_create_front_br[11]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_11  ),
  .entry_create_split0_type_v  (entry_create_split0_type_11),
  .entry_create_split1_type_v  (entry_create_split1_type_11),
  .entry_create_vl_v           (entry_create_vl_11         ),
  .entry_create_vlmul_v        (entry_create_vlmul_11      ),
  .entry_create_vsetvli_x      (entry_create_vsetvli[11]   ),
  .entry_create_vsew_v         (entry_create_vsew_11       ),
  .entry_create_x              (entry_create[11]           ),
  .entry_fence_x               (entry_fence[11]            ),
  .entry_front_br_x            (entry_front_br[11]         ),
  .entry_inst_data_v           (entry_inst_data_11         ),
  .entry_split0_type_v         (entry_split0_type_11       ),
  .entry_split1_type_v         (entry_split1_type_11       ),
  .entry_vl_v                  (entry_vl_11                ),
  .entry_vld_x                 (entry_vld[11]              ),
  .entry_vlmul_v               (entry_vlmul_11             ),
  .entry_vsetvli_x             (entry_vsetvli[11]          ),
  .entry_vsew_v                (entry_vsew_11              ),
  .fill_state_enter            (fill_state_enter           ),
  .forever_cpuclk              (forever_cpuclk             ),
  .lbuf_flush                  (lbuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[12]/); @1264
// &ConnRule(s/_v$/_12/); @1265
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_12"); @1266
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_12 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[12]         ),
  .entry_back_br_x             (entry_back_br[12]          ),
  .entry_bkpta_x               (entry_bkpta[12]            ),
  .entry_bkptb_x               (entry_bkptb[12]            ),
  .entry_create_32_start_x     (entry_create_32_start[12]  ),
  .entry_create_back_br_x      (entry_create_back_br[12]   ),
  .entry_create_bkpta_x        (entry_create_bkpta[12]     ),
  .entry_create_bkptb_x        (entry_create_bkptb[12]     ),
  .entry_create_clk_en_x       (entry_create_clk_en[12]    ),
  .entry_create_fence_x        (entry_create_fence[12]     ),
  .entry_create_front_br_x     (entry_create_front_br[12]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_12  ),
  .entry_create_split0_type_v  (entry_create_split0_type_12),
  .entry_create_split1_type_v  (entry_create_split1_type_12),
  .entry_create_vl_v           (entry_create_vl_12         ),
  .entry_create_vlmul_v        (entry_create_vlmul_12      ),
  .entry_create_vsetvli_x      (entry_create_vsetvli[12]   ),
  .entry_create_vsew_v         (entry_create_vsew_12       ),
  .entry_create_x              (entry_create[12]           ),
  .entry_fence_x               (entry_fence[12]            ),
  .entry_front_br_x            (entry_front_br[12]         ),
  .entry_inst_data_v           (entry_inst_data_12         ),
  .entry_split0_type_v         (entry_split0_type_12       ),
  .entry_split1_type_v         (entry_split1_type_12       ),
  .entry_vl_v                  (entry_vl_12                ),
  .entry_vld_x                 (entry_vld[12]              ),
  .entry_vlmul_v               (entry_vlmul_12             ),
  .entry_vsetvli_x             (entry_vsetvli[12]          ),
  .entry_vsew_v                (entry_vsew_12              ),
  .fill_state_enter            (fill_state_enter           ),
  .forever_cpuclk              (forever_cpuclk             ),
  .lbuf_flush                  (lbuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[13]/); @1268
// &ConnRule(s/_v$/_13/); @1269
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_13"); @1270
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_13 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[13]         ),
  .entry_back_br_x             (entry_back_br[13]          ),
  .entry_bkpta_x               (entry_bkpta[13]            ),
  .entry_bkptb_x               (entry_bkptb[13]            ),
  .entry_create_32_start_x     (entry_create_32_start[13]  ),
  .entry_create_back_br_x      (entry_create_back_br[13]   ),
  .entry_create_bkpta_x        (entry_create_bkpta[13]     ),
  .entry_create_bkptb_x        (entry_create_bkptb[13]     ),
  .entry_create_clk_en_x       (entry_create_clk_en[13]    ),
  .entry_create_fence_x        (entry_create_fence[13]     ),
  .entry_create_front_br_x     (entry_create_front_br[13]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_13  ),
  .entry_create_split0_type_v  (entry_create_split0_type_13),
  .entry_create_split1_type_v  (entry_create_split1_type_13),
  .entry_create_vl_v           (entry_create_vl_13         ),
  .entry_create_vlmul_v        (entry_create_vlmul_13      ),
  .entry_create_vsetvli_x      (entry_create_vsetvli[13]   ),
  .entry_create_vsew_v         (entry_create_vsew_13       ),
  .entry_create_x              (entry_create[13]           ),
  .entry_fence_x               (entry_fence[13]            ),
  .entry_front_br_x            (entry_front_br[13]         ),
  .entry_inst_data_v           (entry_inst_data_13         ),
  .entry_split0_type_v         (entry_split0_type_13       ),
  .entry_split1_type_v         (entry_split1_type_13       ),
  .entry_vl_v                  (entry_vl_13                ),
  .entry_vld_x                 (entry_vld[13]              ),
  .entry_vlmul_v               (entry_vlmul_13             ),
  .entry_vsetvli_x             (entry_vsetvli[13]          ),
  .entry_vsew_v                (entry_vsew_13              ),
  .fill_state_enter            (fill_state_enter           ),
  .forever_cpuclk              (forever_cpuclk             ),
  .lbuf_flush                  (lbuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[14]/); @1272
// &ConnRule(s/_v$/_14/); @1273
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_14"); @1274
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_14 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[14]         ),
  .entry_back_br_x             (entry_back_br[14]          ),
  .entry_bkpta_x               (entry_bkpta[14]            ),
  .entry_bkptb_x               (entry_bkptb[14]            ),
  .entry_create_32_start_x     (entry_create_32_start[14]  ),
  .entry_create_back_br_x      (entry_create_back_br[14]   ),
  .entry_create_bkpta_x        (entry_create_bkpta[14]     ),
  .entry_create_bkptb_x        (entry_create_bkptb[14]     ),
  .entry_create_clk_en_x       (entry_create_clk_en[14]    ),
  .entry_create_fence_x        (entry_create_fence[14]     ),
  .entry_create_front_br_x     (entry_create_front_br[14]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_14  ),
  .entry_create_split0_type_v  (entry_create_split0_type_14),
  .entry_create_split1_type_v  (entry_create_split1_type_14),
  .entry_create_vl_v           (entry_create_vl_14         ),
  .entry_create_vlmul_v        (entry_create_vlmul_14      ),
  .entry_create_vsetvli_x      (entry_create_vsetvli[14]   ),
  .entry_create_vsew_v         (entry_create_vsew_14       ),
  .entry_create_x              (entry_create[14]           ),
  .entry_fence_x               (entry_fence[14]            ),
  .entry_front_br_x            (entry_front_br[14]         ),
  .entry_inst_data_v           (entry_inst_data_14         ),
  .entry_split0_type_v         (entry_split0_type_14       ),
  .entry_split1_type_v         (entry_split1_type_14       ),
  .entry_vl_v                  (entry_vl_14                ),
  .entry_vld_x                 (entry_vld[14]              ),
  .entry_vlmul_v               (entry_vlmul_14             ),
  .entry_vsetvli_x             (entry_vsetvli[14]          ),
  .entry_vsew_v                (entry_vsew_14              ),
  .fill_state_enter            (fill_state_enter           ),
  .forever_cpuclk              (forever_cpuclk             ),
  .lbuf_flush                  (lbuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


// &ConnRule(s/_x$/[15]/); @1276
// &ConnRule(s/_v$/_15/); @1277
// &Instance("ct_ifu_lbuf_entry","x_ct_ifu_lbuf_entry_15"); @1278
ct_ifu_lbuf_entry  x_ct_ifu_lbuf_entry_15 (
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cpurst_b                    (cpurst_b                   ),
  .entry_32_start_x            (entry_32_start[15]         ),
  .entry_back_br_x             (entry_back_br[15]          ),
  .entry_bkpta_x               (entry_bkpta[15]            ),
  .entry_bkptb_x               (entry_bkptb[15]            ),
  .entry_create_32_start_x     (entry_create_32_start[15]  ),
  .entry_create_back_br_x      (entry_create_back_br[15]   ),
  .entry_create_bkpta_x        (entry_create_bkpta[15]     ),
  .entry_create_bkptb_x        (entry_create_bkptb[15]     ),
  .entry_create_clk_en_x       (entry_create_clk_en[15]    ),
  .entry_create_fence_x        (entry_create_fence[15]     ),
  .entry_create_front_br_x     (entry_create_front_br[15]  ),
  .entry_create_inst_data_v    (entry_create_inst_data_15  ),
  .entry_create_split0_type_v  (entry_create_split0_type_15),
  .entry_create_split1_type_v  (entry_create_split1_type_15),
  .entry_create_vl_v           (entry_create_vl_15         ),
  .entry_create_vlmul_v        (entry_create_vlmul_15      ),
  .entry_create_vsetvli_x      (entry_create_vsetvli[15]   ),
  .entry_create_vsew_v         (entry_create_vsew_15       ),
  .entry_create_x              (entry_create[15]           ),
  .entry_fence_x               (entry_fence[15]            ),
  .entry_front_br_x            (entry_front_br[15]         ),
  .entry_inst_data_v           (entry_inst_data_15         ),
  .entry_split0_type_v         (entry_split0_type_15       ),
  .entry_split1_type_v         (entry_split1_type_15       ),
  .entry_vl_v                  (entry_vl_15                ),
  .entry_vld_x                 (entry_vld[15]              ),
  .entry_vlmul_v               (entry_vlmul_15             ),
  .entry_vsetvli_x             (entry_vsetvli[15]          ),
  .entry_vsew_v                (entry_vsew_15              ),
  .fill_state_enter            (fill_state_enter           ),
  .forever_cpuclk              (forever_cpuclk             ),
  .lbuf_flush                  (lbuf_flush                 ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);


//-----------------Entry Create Logic-----------------------
//Include signal as following:
//entry_create[n]
//entry_retire[n]
//entry_create_front_br[n]
//entry_create_back_br[n]
//entry_create_32_start[n]
//entry_create_fence[n]

//hn_xxx source signal prepare
//hn_create_vld
assign hn_create_vld_pre[8:0] = (ibdp_lbuf_h0_vld) 
                              ? ({ibdp_lbuf_h0_vld, ibdp_lbuf_hn_vld[7:0]}) 
                              : ({ibdp_lbuf_hn_vld[7:0], 1'b0});
assign hn_create_vld[8:0]     = (lbuf_cur_state[5:0] == FRONT_FILL)
                              ? (hn_create_vld_pre[8:0] & front_vld_mask[8:0])
                              : (hn_create_vld_pre[8:0]);
//hn_front_br
assign hn_front_br[8:0]       = (ibdp_lbuf_h0_vld)
                              ? ({ibdp_lbuf_h0_con_br, ibdp_lbuf_hn_con_br[7:0]} & {9{~ibdp_lbuf_con_br_offset[20]}})
                              : ({ibdp_lbuf_hn_con_br[7:0], 1'b0} & {9{~ibdp_lbuf_con_br_offset[20]}});
//hn_back_br
assign hn_back_br[8:0]        = (ibdp_lbuf_h0_vld)
                              ? ({ibdp_lbuf_h0_con_br, ibdp_lbuf_hn_con_br[7:0]} & {9{ibdp_lbuf_con_br_offset[20]}})
                              : ({ibdp_lbuf_hn_con_br[7:0], 1'b0} & {9{ibdp_lbuf_con_br_offset[20]}});
//hn_32_start
assign hn_32_start[8:0]       = (ibdp_lbuf_h0_vld)
                              ? ({ibdp_lbuf_h0_32_start, ibdp_lbuf_hn_32_start[7:0]})
                              : ({ibdp_lbuf_hn_32_start[7:0], 1'b0});
//hn_fence
assign hn_fence[8:0]          = (ibdp_lbuf_h0_vld)
                              ? ({ibdp_lbuf_h0_fence, ibdp_lbuf_hn_fence[7:0]})
                              : ({ibdp_lbuf_hn_fence[7:0], 1'b0});                               
//hn_bkpta
assign hn_bkpta[8:0]          = (ibdp_lbuf_h0_vld)
                              ? ({ibdp_lbuf_h0_bkpta, ibdp_lbuf_hn_bkpta[7:0]})
                              : ({ibdp_lbuf_hn_bkpta[7:0], 1'b0});                               
//hn_bkptb
assign hn_bkptb[8:0]          = (ibdp_lbuf_h0_vld)
                              ? ({ibdp_lbuf_h0_bkptb, ibdp_lbuf_hn_bkptb[7:0]})
                              : ({ibdp_lbuf_hn_bkptb[7:0], 1'b0});                               
assign hn_vsetvli[8:0]        = (ibdp_lbuf_h0_vld)
                              ? ({ibdp_lbuf_h0_vsetvli,ibdp_lbuf_hn_vsetvli[7:0]})
                              : ({ibdp_lbuf_hn_vsetvli[7:0],1'b0});

//hn_data[15:0]
assign h0_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h0_data[15:0]
                              : ibdp_lbuf_h1_data[15:0];
assign h1_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h1_data[15:0]
                              : ibdp_lbuf_h2_data[15:0];
assign h2_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h2_data[15:0]
                              : ibdp_lbuf_h3_data[15:0];
assign h3_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h3_data[15:0]
                              : ibdp_lbuf_h4_data[15:0];
assign h4_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h4_data[15:0]
                              : ibdp_lbuf_h5_data[15:0];
assign h5_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h5_data[15:0]
                              : ibdp_lbuf_h6_data[15:0];
assign h6_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h6_data[15:0]
                              : ibdp_lbuf_h7_data[15:0];
assign h7_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h7_data[15:0]
                              : ibdp_lbuf_h8_data[15:0];
assign h8_data[15:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h8_data[15:0]
                              : 16'b0;

//hn_vlmul[1:0]
assign h0_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h0_vlmul[1:0]
                              : ibdp_lbuf_h1_vlmul[1:0];
assign h1_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h1_vlmul[1:0]
                              : ibdp_lbuf_h2_vlmul[1:0];
assign h2_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h2_vlmul[1:0]
                              : ibdp_lbuf_h3_vlmul[1:0];
assign h3_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h3_vlmul[1:0]
                              : ibdp_lbuf_h4_vlmul[1:0];
assign h4_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h4_vlmul[1:0]
                              : ibdp_lbuf_h5_vlmul[1:0];
assign h5_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h5_vlmul[1:0]
                              : ibdp_lbuf_h6_vlmul[1:0];
assign h6_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h6_vlmul[1:0]
                              : ibdp_lbuf_h7_vlmul[1:0];
assign h7_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h7_vlmul[1:0]
                              : ibdp_lbuf_h8_vlmul[1:0];
assign h8_vlmul[1:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h8_vlmul[1:0]
                              : 2'b0;
//hn_vsew[2:0]
assign h0_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h0_vsew[2:0]
                              : ibdp_lbuf_h1_vsew[2:0];
assign h1_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h1_vsew[2:0]
                              : ibdp_lbuf_h2_vsew[2:0];
assign h2_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h2_vsew[2:0]
                              : ibdp_lbuf_h3_vsew[2:0];
assign h3_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h3_vsew[2:0]
                              : ibdp_lbuf_h4_vsew[2:0];
assign h4_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h4_vsew[2:0]
                              : ibdp_lbuf_h5_vsew[2:0];
assign h5_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h5_vsew[2:0]
                              : ibdp_lbuf_h6_vsew[2:0];
assign h6_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h6_vsew[2:0]
                              : ibdp_lbuf_h7_vsew[2:0];
assign h7_vsew[2:0]           = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h7_vsew[2:0]
                              : ibdp_lbuf_h8_vsew[2:0];
assign h8_vsew[2:0]          = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h8_vsew[2:0]
                              : 3'b0;

//hn_vl[7:0]
assign h0_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h0_vl[7:0]
                              : ibdp_lbuf_h1_vl[7:0];
assign h1_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h1_vl[7:0]
                              : ibdp_lbuf_h2_vl[7:0];
assign h2_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h2_vl[7:0]
                              : ibdp_lbuf_h3_vl[7:0];
assign h3_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h3_vl[7:0]
                              : ibdp_lbuf_h4_vl[7:0];
assign h4_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h4_vl[7:0]
                              : ibdp_lbuf_h5_vl[7:0];
assign h5_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h5_vl[7:0]
                              : ibdp_lbuf_h6_vl[7:0];
assign h6_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h6_vl[7:0]
                              : ibdp_lbuf_h7_vl[7:0];
assign h7_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h7_vl[7:0]
                              : ibdp_lbuf_h8_vl[7:0];
assign h8_vl[7:0]             = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h8_vl[7:0]
                              : 8'b0;


//hn_split0_type
assign h0_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h0_split0_type[2:0]
                              : ibdp_lbuf_h1_split0_type[2:0];
assign h1_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h1_split0_type[2:0]
                              : ibdp_lbuf_h2_split0_type[2:0];
assign h2_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h2_split0_type[2:0]
                              : ibdp_lbuf_h3_split0_type[2:0];
assign h3_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h3_split0_type[2:0]
                              : ibdp_lbuf_h4_split0_type[2:0];
assign h4_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h4_split0_type[2:0]
                              : ibdp_lbuf_h5_split0_type[2:0];
assign h5_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h5_split0_type[2:0]
                              : ibdp_lbuf_h6_split0_type[2:0];
assign h6_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h6_split0_type[2:0]
                              : ibdp_lbuf_h7_split0_type[2:0];
assign h7_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h7_split0_type[2:0]
                              : ibdp_lbuf_h8_split0_type[2:0];
assign h8_split0_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h8_split0_type[2:0]
                              : 3'b0;

//hn_split1_type                          
assign h0_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h0_split1_type[2:0]
                              : ibdp_lbuf_h1_split1_type[2:0];
assign h1_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h1_split1_type[2:0]
                              : ibdp_lbuf_h2_split1_type[2:0];
assign h2_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h2_split1_type[2:0]
                              : ibdp_lbuf_h3_split1_type[2:0];
assign h3_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h3_split1_type[2:0]
                              : ibdp_lbuf_h4_split1_type[2:0];
assign h4_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h4_split1_type[2:0]
                              : ibdp_lbuf_h5_split1_type[2:0];
assign h5_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h5_split1_type[2:0]
                              : ibdp_lbuf_h6_split1_type[2:0];
assign h6_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h6_split1_type[2:0]
                              : ibdp_lbuf_h7_split1_type[2:0];
assign h7_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h7_split1_type[2:0]
                              : ibdp_lbuf_h8_split1_type[2:0];
assign h8_split1_type[2:0]    = (ibdp_lbuf_h0_vld)
                              ? ibdp_lbuf_h8_split1_type[2:0]
                              : 3'b0;


//entry_create[n]
assign entry_create[15:0]        = (
                                     (lbuf_create_pointer0[15:0] & {16{hn_create_vld[8]}}) | 
                                     (lbuf_create_pointer1[15:0] & {16{hn_create_vld[7]}}) |  
                                     (lbuf_create_pointer2[15:0] & {16{hn_create_vld[6]}}) |  
                                     (lbuf_create_pointer3[15:0] & {16{hn_create_vld[5]}}) |  
                                     (lbuf_create_pointer4[15:0] & {16{hn_create_vld[4]}}) |  
                                     (lbuf_create_pointer5[15:0] & {16{hn_create_vld[3]}}) |  
                                     (lbuf_create_pointer6[15:0] & {16{hn_create_vld[2]}}) |  
                                     (lbuf_create_pointer7[15:0] & {16{hn_create_vld[1]}}) |  
                                     (lbuf_create_pointer8[15:0] & {16{hn_create_vld[0]}})
                                   ) & {16{lbuf_create_vld}};
assign entry_create_clk_en[15:0] = (
                                     (lbuf_create_pointer0[15:0] & {16{hn_create_vld[8]}}) | 
                                     (lbuf_create_pointer1[15:0] & {16{hn_create_vld[7]}}) |  
                                     (lbuf_create_pointer2[15:0] & {16{hn_create_vld[6]}}) |  
                                     (lbuf_create_pointer3[15:0] & {16{hn_create_vld[5]}}) |  
                                     (lbuf_create_pointer4[15:0] & {16{hn_create_vld[4]}}) |  
                                     (lbuf_create_pointer5[15:0] & {16{hn_create_vld[3]}}) |  
                                     (lbuf_create_pointer6[15:0] & {16{hn_create_vld[2]}}) |  
                                     (lbuf_create_pointer7[15:0] & {16{hn_create_vld[1]}}) |  
                                     (lbuf_create_pointer8[15:0] & {16{hn_create_vld[0]}})
                                   ) & {16{lbuf_cur_state[0] | lbuf_cur_state[4]}};
                          
//entry_create_front_br[n]
assign entry_create_front_br[15:0]   = (lbuf_create_pointer0[15:0] & {16{hn_front_br[8]}}) | 
                                       (lbuf_create_pointer1[15:0] & {16{hn_front_br[7]}}) | 
                                       (lbuf_create_pointer2[15:0] & {16{hn_front_br[6]}}) | 
                                       (lbuf_create_pointer3[15:0] & {16{hn_front_br[5]}}) | 
                                       (lbuf_create_pointer4[15:0] & {16{hn_front_br[4]}}) | 
                                       (lbuf_create_pointer5[15:0] & {16{hn_front_br[3]}}) | 
                                       (lbuf_create_pointer6[15:0] & {16{hn_front_br[2]}}) | 
                                       (lbuf_create_pointer7[15:0] & {16{hn_front_br[1]}}) | 
                                       (lbuf_create_pointer8[15:0] & {16{hn_front_br[0]}}); 

//entry_create_back_br[n]
assign entry_create_back_br[15:0]    = (lbuf_create_pointer0[15:0] & {16{hn_back_br[8]}}) | 
                                       (lbuf_create_pointer1[15:0] & {16{hn_back_br[7]}}) | 
                                       (lbuf_create_pointer2[15:0] & {16{hn_back_br[6]}}) | 
                                       (lbuf_create_pointer3[15:0] & {16{hn_back_br[5]}}) | 
                                       (lbuf_create_pointer4[15:0] & {16{hn_back_br[4]}}) | 
                                       (lbuf_create_pointer5[15:0] & {16{hn_back_br[3]}}) | 
                                       (lbuf_create_pointer6[15:0] & {16{hn_back_br[2]}}) | 
                                       (lbuf_create_pointer7[15:0] & {16{hn_back_br[1]}}) | 
                                       (lbuf_create_pointer8[15:0] & {16{hn_back_br[0]}}); 

//entry_create_32_start[n]
assign entry_create_32_start[15:0]   = (lbuf_create_pointer0[15:0] & {16{hn_32_start[8]}}) | 
                                       (lbuf_create_pointer1[15:0] & {16{hn_32_start[7]}}) | 
                                       (lbuf_create_pointer2[15:0] & {16{hn_32_start[6]}}) | 
                                       (lbuf_create_pointer3[15:0] & {16{hn_32_start[5]}}) | 
                                       (lbuf_create_pointer4[15:0] & {16{hn_32_start[4]}}) | 
                                       (lbuf_create_pointer5[15:0] & {16{hn_32_start[3]}}) | 
                                       (lbuf_create_pointer6[15:0] & {16{hn_32_start[2]}}) | 
                                       (lbuf_create_pointer7[15:0] & {16{hn_32_start[1]}}) | 
                                       (lbuf_create_pointer8[15:0] & {16{hn_32_start[0]}});
                                     
//entry_create_fence[n]
assign entry_create_fence[15:0]      = (lbuf_create_pointer0[15:0] & {16{hn_fence[8]}}) | 
                                       (lbuf_create_pointer1[15:0] & {16{hn_fence[7]}}) | 
                                       (lbuf_create_pointer2[15:0] & {16{hn_fence[6]}}) | 
                                       (lbuf_create_pointer3[15:0] & {16{hn_fence[5]}}) | 
                                       (lbuf_create_pointer4[15:0] & {16{hn_fence[4]}}) | 
                                       (lbuf_create_pointer5[15:0] & {16{hn_fence[3]}}) | 
                                       (lbuf_create_pointer6[15:0] & {16{hn_fence[2]}}) | 
                                       (lbuf_create_pointer7[15:0] & {16{hn_fence[1]}}) | 
                                       (lbuf_create_pointer8[15:0] & {16{hn_fence[0]}});
                                     
//entry_create_bkpta[n]
assign entry_create_bkpta[15:0]      = (lbuf_create_pointer0[15:0] & {16{hn_bkpta[8]}}) | 
                                       (lbuf_create_pointer1[15:0] & {16{hn_bkpta[7]}}) | 
                                       (lbuf_create_pointer2[15:0] & {16{hn_bkpta[6]}}) | 
                                       (lbuf_create_pointer3[15:0] & {16{hn_bkpta[5]}}) | 
                                       (lbuf_create_pointer4[15:0] & {16{hn_bkpta[4]}}) | 
                                       (lbuf_create_pointer5[15:0] & {16{hn_bkpta[3]}}) | 
                                       (lbuf_create_pointer6[15:0] & {16{hn_bkpta[2]}}) | 
                                       (lbuf_create_pointer7[15:0] & {16{hn_bkpta[1]}}) | 
                                       (lbuf_create_pointer8[15:0] & {16{hn_bkpta[0]}});
//entry_create_bkptb[n]
assign entry_create_bkptb[15:0]      = (lbuf_create_pointer0[15:0] & {16{hn_bkptb[8]}}) | 
                                       (lbuf_create_pointer1[15:0] & {16{hn_bkptb[7]}}) | 
                                       (lbuf_create_pointer2[15:0] & {16{hn_bkptb[6]}}) | 
                                       (lbuf_create_pointer3[15:0] & {16{hn_bkptb[5]}}) | 
                                       (lbuf_create_pointer4[15:0] & {16{hn_bkptb[4]}}) | 
                                       (lbuf_create_pointer5[15:0] & {16{hn_bkptb[3]}}) | 
                                       (lbuf_create_pointer6[15:0] & {16{hn_bkptb[2]}}) | 
                                       (lbuf_create_pointer7[15:0] & {16{hn_bkptb[1]}}) | 
                                       (lbuf_create_pointer8[15:0] & {16{hn_bkptb[0]}});
//entry_create_vsetvli[n]
assign entry_create_vsetvli[15:0]    = (lbuf_create_pointer0[15:0] & {16{hn_vsetvli[8]}}) | 
                                       (lbuf_create_pointer1[15:0] & {16{hn_vsetvli[7]}}) | 
                                       (lbuf_create_pointer2[15:0] & {16{hn_vsetvli[6]}}) | 
                                       (lbuf_create_pointer3[15:0] & {16{hn_vsetvli[5]}}) | 
                                       (lbuf_create_pointer4[15:0] & {16{hn_vsetvli[4]}}) | 
                                       (lbuf_create_pointer5[15:0] & {16{hn_vsetvli[3]}}) | 
                                       (lbuf_create_pointer6[15:0] & {16{hn_vsetvli[2]}}) | 
                                       (lbuf_create_pointer7[15:0] & {16{hn_vsetvli[1]}}) | 
                                       (lbuf_create_pointer8[15:0] & {16{hn_vsetvli[0]}});


//entry_create_inst_data_n
assign entry_create_inst_data_0[15:0]  = ({16{lbuf_create_pointer0[ 0]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 0]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 0]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 0]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 0]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 0]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 0]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 0]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 0]}} & h8_data[15:0]);

assign entry_create_inst_data_1[15:0]  = ({16{lbuf_create_pointer0[ 1]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 1]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 1]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 1]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 1]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 1]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 1]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 1]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 1]}} & h8_data[15:0]);

assign entry_create_inst_data_2[15:0]  = ({16{lbuf_create_pointer0[ 2]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 2]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 2]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 2]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 2]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 2]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 2]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 2]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 2]}} & h8_data[15:0]);

assign entry_create_inst_data_3[15:0]  = ({16{lbuf_create_pointer0[ 3]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 3]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 3]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 3]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 3]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 3]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 3]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 3]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 3]}} & h8_data[15:0]);

assign entry_create_inst_data_4[15:0]  = ({16{lbuf_create_pointer0[ 4]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 4]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 4]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 4]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 4]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 4]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 4]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 4]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 4]}} & h8_data[15:0]);

assign entry_create_inst_data_5[15:0]  = ({16{lbuf_create_pointer0[ 5]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 5]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 5]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 5]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 5]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 5]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 5]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 5]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 5]}} & h8_data[15:0]);

assign entry_create_inst_data_6[15:0]  = ({16{lbuf_create_pointer0[ 6]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 6]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 6]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 6]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 6]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 6]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 6]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 6]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 6]}} & h8_data[15:0]);

assign entry_create_inst_data_7[15:0]  = ({16{lbuf_create_pointer0[ 7]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 7]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 7]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 7]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 7]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 7]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 7]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 7]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 7]}} & h8_data[15:0]);

assign entry_create_inst_data_8[15:0]  = ({16{lbuf_create_pointer0[ 8]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 8]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 8]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 8]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 8]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 8]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 8]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 8]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 8]}} & h8_data[15:0]);

assign entry_create_inst_data_9[15:0]  = ({16{lbuf_create_pointer0[ 9]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[ 9]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[ 9]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[ 9]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[ 9]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[ 9]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[ 9]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[ 9]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[ 9]}} & h8_data[15:0]);

assign entry_create_inst_data_10[15:0] = ({16{lbuf_create_pointer0[10]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[10]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[10]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[10]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[10]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[10]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[10]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[10]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[10]}} & h8_data[15:0]);

assign entry_create_inst_data_11[15:0] = ({16{lbuf_create_pointer0[11]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[11]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[11]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[11]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[11]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[11]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[11]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[11]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[11]}} & h8_data[15:0]);

assign entry_create_inst_data_12[15:0] = ({16{lbuf_create_pointer0[12]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[12]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[12]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[12]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[12]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[12]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[12]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[12]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[12]}} & h8_data[15:0]);

assign entry_create_inst_data_13[15:0] = ({16{lbuf_create_pointer0[13]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[13]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[13]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[13]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[13]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[13]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[13]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[13]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[13]}} & h8_data[15:0]);

assign entry_create_inst_data_14[15:0] = ({16{lbuf_create_pointer0[14]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[14]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[14]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[14]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[14]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[14]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[14]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[14]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[14]}} & h8_data[15:0]);

assign entry_create_inst_data_15[15:0] = ({16{lbuf_create_pointer0[15]}} & h0_data[15:0]) | 
                                         ({16{lbuf_create_pointer1[15]}} & h1_data[15:0]) | 
                                         ({16{lbuf_create_pointer2[15]}} & h2_data[15:0]) | 
                                         ({16{lbuf_create_pointer3[15]}} & h3_data[15:0]) | 
                                         ({16{lbuf_create_pointer4[15]}} & h4_data[15:0]) | 
                                         ({16{lbuf_create_pointer5[15]}} & h5_data[15:0]) | 
                                         ({16{lbuf_create_pointer6[15]}} & h6_data[15:0]) | 
                                         ({16{lbuf_create_pointer7[15]}} & h7_data[15:0]) | 
                                         ({16{lbuf_create_pointer8[15]}} & h8_data[15:0]);


//entry_create_vlmul_n
assign entry_create_vlmul_0[1:0] = ({2{lbuf_create_pointer0[ 0]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 0]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 0]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 0]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 0]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 0]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 0]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 0]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 0]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_1[1:0] = ({2{lbuf_create_pointer0[ 1]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 1]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 1]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 1]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 1]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 1]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 1]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 1]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 1]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_2[1:0] = ({2{lbuf_create_pointer0[ 2]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 2]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 2]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 2]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 2]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 2]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 2]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 2]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 2]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_3[1:0] = ({2{lbuf_create_pointer0[ 3]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 3]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 3]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 3]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 3]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 3]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 3]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 3]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 3]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_4[1:0] = ({2{lbuf_create_pointer0[ 4]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 4]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 4]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 4]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 4]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 4]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 4]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 4]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 4]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_5[1:0] = ({2{lbuf_create_pointer0[ 5]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 5]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 5]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 5]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 5]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 5]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 5]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 5]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 5]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_6[1:0] = ({2{lbuf_create_pointer0[ 6]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 6]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 6]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 6]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 6]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 6]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 6]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 6]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 6]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_7[1:0] = ({2{lbuf_create_pointer0[ 7]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 7]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 7]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 7]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 7]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 7]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 7]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 7]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 7]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_8[1:0] = ({2{lbuf_create_pointer0[ 8]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 8]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 8]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 8]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 8]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 8]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 8]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 8]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 8]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_9[1:0] = ({2{lbuf_create_pointer0[ 9]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[ 9]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[ 9]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[ 9]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[ 9]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[ 9]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[ 9]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[ 9]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[ 9]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_10[1:0]= ({2{lbuf_create_pointer0[10]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[10]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[10]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[10]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[10]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[10]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[10]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[10]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[10]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_11[1:0]= ({2{lbuf_create_pointer0[11]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[11]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[11]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[11]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[11]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[11]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[11]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[11]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[11]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_12[1:0]= ({2{lbuf_create_pointer0[12]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[12]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[12]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[12]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[12]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[12]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[12]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[12]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[12]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_13[1:0]= ({2{lbuf_create_pointer0[13]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[13]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[13]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[13]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[13]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[13]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[13]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[13]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[13]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_14[1:0]= ({2{lbuf_create_pointer0[14]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[14]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[14]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[14]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[14]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[14]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[14]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[14]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[14]}} & h8_vlmul[1:0]);

assign entry_create_vlmul_15[1:0]= ({2{lbuf_create_pointer0[15]}} & h0_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer1[15]}} & h1_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer2[15]}} & h2_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer3[15]}} & h3_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer4[15]}} & h4_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer5[15]}} & h5_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer6[15]}} & h6_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer7[15]}} & h7_vlmul[1:0]) | 
                                   ({2{lbuf_create_pointer8[15]}} & h8_vlmul[1:0]);

//entry_create_vsew_n
assign entry_create_vsew_0[2:0] = ({3{lbuf_create_pointer0[ 0]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 0]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 0]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 0]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 0]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 0]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 0]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 0]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 0]}} & h8_vsew[2:0]);

assign entry_create_vsew_1[2:0] = ({3{lbuf_create_pointer0[ 1]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 1]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 1]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 1]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 1]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 1]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 1]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 1]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 1]}} & h8_vsew[2:0]);

assign entry_create_vsew_2[2:0] = ({3{lbuf_create_pointer0[ 2]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 2]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 2]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 2]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 2]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 2]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 2]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 2]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 2]}} & h8_vsew[2:0]);

assign entry_create_vsew_3[2:0] = ({3{lbuf_create_pointer0[ 3]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 3]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 3]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 3]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 3]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 3]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 3]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 3]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 3]}} & h8_vsew[2:0]);

assign entry_create_vsew_4[2:0] = ({3{lbuf_create_pointer0[ 4]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 4]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 4]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 4]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 4]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 4]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 4]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 4]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 4]}} & h8_vsew[2:0]);

assign entry_create_vsew_5[2:0] = ({3{lbuf_create_pointer0[ 5]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 5]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 5]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 5]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 5]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 5]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 5]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 5]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 5]}} & h8_vsew[2:0]);

assign entry_create_vsew_6[2:0] = ({3{lbuf_create_pointer0[ 6]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 6]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 6]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 6]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 6]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 6]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 6]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 6]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 6]}} & h8_vsew[2:0]);

assign entry_create_vsew_7[2:0] = ({3{lbuf_create_pointer0[ 7]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 7]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 7]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 7]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 7]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 7]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 7]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 7]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 7]}} & h8_vsew[2:0]);

assign entry_create_vsew_8[2:0] = ({3{lbuf_create_pointer0[ 8]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 8]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 8]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 8]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 8]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 8]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 8]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 8]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 8]}} & h8_vsew[2:0]);

assign entry_create_vsew_9[2:0] = ({3{lbuf_create_pointer0[ 9]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[ 9]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[ 9]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[ 9]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[ 9]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[ 9]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[ 9]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[ 9]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[ 9]}} & h8_vsew[2:0]);

assign entry_create_vsew_10[2:0]= ({3{lbuf_create_pointer0[10]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[10]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[10]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[10]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[10]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[10]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[10]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[10]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[10]}} & h8_vsew[2:0]);

assign entry_create_vsew_11[2:0]= ({3{lbuf_create_pointer0[11]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[11]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[11]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[11]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[11]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[11]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[11]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[11]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[11]}} & h8_vsew[2:0]);

assign entry_create_vsew_12[2:0]= ({3{lbuf_create_pointer0[12]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[12]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[12]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[12]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[12]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[12]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[12]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[12]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[12]}} & h8_vsew[2:0]);

assign entry_create_vsew_13[2:0]= ({3{lbuf_create_pointer0[13]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[13]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[13]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[13]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[13]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[13]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[13]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[13]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[13]}} & h8_vsew[2:0]);

assign entry_create_vsew_14[2:0]= ({3{lbuf_create_pointer0[14]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[14]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[14]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[14]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[14]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[14]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[14]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[14]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[14]}} & h8_vsew[2:0]);

assign entry_create_vsew_15[2:0]= ({3{lbuf_create_pointer0[15]}} & h0_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer1[15]}} & h1_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer2[15]}} & h2_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer3[15]}} & h3_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer4[15]}} & h4_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer5[15]}} & h5_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer6[15]}} & h6_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer7[15]}} & h7_vsew[2:0]) | 
                                  ({3{lbuf_create_pointer8[15]}} & h8_vsew[2:0]);


//entry_create_vl_n
assign entry_create_vl_0[7:0]   = ({8{lbuf_create_pointer0[ 0]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 0]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 0]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 0]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 0]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 0]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 0]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 0]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 0]}} & h8_vl[7:0]);

assign entry_create_vl_1[7:0]   = ({8{lbuf_create_pointer0[ 1]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 1]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 1]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 1]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 1]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 1]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 1]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 1]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 1]}} & h8_vl[7:0]);

assign entry_create_vl_2[7:0]   = ({8{lbuf_create_pointer0[ 2]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 2]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 2]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 2]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 2]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 2]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 2]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 2]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 2]}} & h8_vl[7:0]);

assign entry_create_vl_3[7:0]   = ({8{lbuf_create_pointer0[ 3]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 3]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 3]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 3]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 3]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 3]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 3]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 3]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 3]}} & h8_vl[7:0]);

assign entry_create_vl_4[7:0]   = ({8{lbuf_create_pointer0[ 4]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 4]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 4]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 4]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 4]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 4]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 4]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 4]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 4]}} & h8_vl[7:0]);

assign entry_create_vl_5[7:0]   = ({8{lbuf_create_pointer0[ 5]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 5]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 5]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 5]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 5]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 5]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 5]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 5]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 5]}} & h8_vl[7:0]);

assign entry_create_vl_6[7:0]   = ({8{lbuf_create_pointer0[ 6]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 6]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 6]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 6]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 6]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 6]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 6]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 6]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 6]}} & h8_vl[7:0]);

assign entry_create_vl_7[7:0]   = ({8{lbuf_create_pointer0[ 7]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 7]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 7]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 7]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 7]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 7]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 7]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 7]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 7]}} & h8_vl[7:0]);

assign entry_create_vl_8[7:0]   = ({8{lbuf_create_pointer0[ 8]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 8]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 8]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 8]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 8]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 8]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 8]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 8]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 8]}} & h8_vl[7:0]);

assign entry_create_vl_9[7:0]   = ({8{lbuf_create_pointer0[ 9]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[ 9]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[ 9]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[ 9]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[ 9]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[ 9]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[ 9]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[ 9]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[ 9]}} & h8_vl[7:0]);

assign entry_create_vl_10[7:0]  = ({8{lbuf_create_pointer0[10]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[10]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[10]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[10]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[10]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[10]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[10]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[10]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[10]}} & h8_vl[7:0]);

assign entry_create_vl_11[7:0]  = ({8{lbuf_create_pointer0[11]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[11]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[11]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[11]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[11]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[11]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[11]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[11]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[11]}} & h8_vl[7:0]);

assign entry_create_vl_12[7:0]  = ({8{lbuf_create_pointer0[12]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[12]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[12]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[12]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[12]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[12]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[12]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[12]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[12]}} & h8_vl[7:0]);

assign entry_create_vl_13[7:0]  = ({8{lbuf_create_pointer0[13]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[13]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[13]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[13]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[13]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[13]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[13]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[13]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[13]}} & h8_vl[7:0]);

assign entry_create_vl_14[7:0]  = ({8{lbuf_create_pointer0[14]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[14]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[14]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[14]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[14]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[14]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[14]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[14]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[14]}} & h8_vl[7:0]);

assign entry_create_vl_15[7:0]  = ({8{lbuf_create_pointer0[15]}} & h0_vl[7:0]) | 
                                  ({8{lbuf_create_pointer1[15]}} & h1_vl[7:0]) | 
                                  ({8{lbuf_create_pointer2[15]}} & h2_vl[7:0]) | 
                                  ({8{lbuf_create_pointer3[15]}} & h3_vl[7:0]) | 
                                  ({8{lbuf_create_pointer4[15]}} & h4_vl[7:0]) | 
                                  ({8{lbuf_create_pointer5[15]}} & h5_vl[7:0]) | 
                                  ({8{lbuf_create_pointer6[15]}} & h6_vl[7:0]) | 
                                  ({8{lbuf_create_pointer7[15]}} & h7_vl[7:0]) | 
                                  ({8{lbuf_create_pointer8[15]}} & h8_vl[7:0]);



//entry_create_split0_type_n
assign entry_create_split0_type_0[2:0] = ({3{lbuf_create_pointer0[ 0]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 0]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 0]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 0]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 0]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 0]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 0]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 0]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 0]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_1[2:0] = ({3{lbuf_create_pointer0[ 1]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 1]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 1]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 1]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 1]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 1]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 1]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 1]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 1]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_2[2:0] = ({3{lbuf_create_pointer0[ 2]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 2]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 2]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 2]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 2]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 2]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 2]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 2]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 2]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_3[2:0] = ({3{lbuf_create_pointer0[ 3]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 3]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 3]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 3]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 3]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 3]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 3]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 3]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 3]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_4[2:0] = ({3{lbuf_create_pointer0[ 4]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 4]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 4]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 4]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 4]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 4]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 4]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 4]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 4]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_5[2:0] = ({3{lbuf_create_pointer0[ 5]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 5]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 5]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 5]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 5]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 5]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 5]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 5]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 5]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_6[2:0] = ({3{lbuf_create_pointer0[ 6]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 6]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 6]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 6]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 6]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 6]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 6]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 6]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 6]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_7[2:0] = ({3{lbuf_create_pointer0[ 7]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 7]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 7]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 7]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 7]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 7]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 7]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 7]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 7]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_8[2:0] = ({3{lbuf_create_pointer0[ 8]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 8]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 8]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 8]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 8]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 8]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 8]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 8]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 8]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_9[2:0] = ({3{lbuf_create_pointer0[ 9]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 9]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 9]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 9]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 9]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 9]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 9]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 9]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 9]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_10[2:0]= ({3{lbuf_create_pointer0[10]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[10]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[10]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[10]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[10]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[10]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[10]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[10]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[10]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_11[2:0]= ({3{lbuf_create_pointer0[11]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[11]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[11]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[11]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[11]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[11]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[11]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[11]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[11]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_12[2:0]= ({3{lbuf_create_pointer0[12]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[12]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[12]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[12]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[12]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[12]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[12]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[12]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[12]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_13[2:0]= ({3{lbuf_create_pointer0[13]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[13]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[13]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[13]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[13]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[13]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[13]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[13]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[13]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_14[2:0]= ({3{lbuf_create_pointer0[14]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[14]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[14]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[14]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[14]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[14]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[14]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[14]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[14]}} & h8_split0_type[2:0]);

assign entry_create_split0_type_15[2:0]= ({3{lbuf_create_pointer0[15]}} & h0_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[15]}} & h1_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[15]}} & h2_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[15]}} & h3_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[15]}} & h4_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[15]}} & h5_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[15]}} & h6_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[15]}} & h7_split0_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[15]}} & h8_split0_type[2:0]);

//entry_create_split1_type_n
assign entry_create_split1_type_0[2:0] = ({3{lbuf_create_pointer0[ 0]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 0]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 0]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 0]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 0]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 0]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 0]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 0]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 0]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_1[2:0] = ({3{lbuf_create_pointer0[ 1]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 1]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 1]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 1]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 1]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 1]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 1]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 1]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 1]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_2[2:0] = ({3{lbuf_create_pointer0[ 2]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 2]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 2]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 2]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 2]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 2]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 2]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 2]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 2]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_3[2:0] = ({3{lbuf_create_pointer0[ 3]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 3]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 3]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 3]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 3]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 3]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 3]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 3]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 3]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_4[2:0] = ({3{lbuf_create_pointer0[ 4]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 4]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 4]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 4]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 4]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 4]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 4]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 4]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 4]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_5[2:0] = ({3{lbuf_create_pointer0[ 5]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 5]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 5]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 5]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 5]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 5]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 5]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 5]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 5]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_6[2:0] = ({3{lbuf_create_pointer0[ 6]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 6]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 6]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 6]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 6]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 6]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 6]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 6]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 6]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_7[2:0] = ({3{lbuf_create_pointer0[ 7]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 7]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 7]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 7]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 7]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 7]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 7]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 7]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 7]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_8[2:0] = ({3{lbuf_create_pointer0[ 8]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 8]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 8]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 8]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 8]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 8]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 8]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 8]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 8]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_9[2:0] = ({3{lbuf_create_pointer0[ 9]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[ 9]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[ 9]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[ 9]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[ 9]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[ 9]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[ 9]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[ 9]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[ 9]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_10[2:0]= ({3{lbuf_create_pointer0[10]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[10]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[10]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[10]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[10]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[10]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[10]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[10]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[10]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_11[2:0]= ({3{lbuf_create_pointer0[11]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[11]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[11]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[11]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[11]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[11]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[11]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[11]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[11]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_12[2:0]= ({3{lbuf_create_pointer0[12]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[12]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[12]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[12]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[12]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[12]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[12]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[12]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[12]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_13[2:0]= ({3{lbuf_create_pointer0[13]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[13]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[13]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[13]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[13]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[13]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[13]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[13]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[13]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_14[2:0]= ({3{lbuf_create_pointer0[14]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[14]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[14]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[14]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[14]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[14]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[14]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[14]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[14]}} & h8_split1_type[2:0]);

assign entry_create_split1_type_15[2:0]= ({3{lbuf_create_pointer0[15]}} & h0_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer1[15]}} & h1_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer2[15]}} & h2_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer3[15]}} & h3_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer4[15]}} & h4_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer5[15]}} & h5_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer6[15]}} & h6_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer7[15]}} & h7_split1_type[2:0]) | 
                                         ({3{lbuf_create_pointer8[15]}} & h8_split1_type[2:0]);

//-------------------Entry Pop Logic------------------------
//including lbuf pop data:
//entry_vld[n]
//entry_front_br[n]
//entry_back_br[n]
//entry_inst_32[n]
//entry_inst_start[n]

//pop_hn_vld
assign pop_h0_vld         = |(lbuf_retire_pointer0[15:0] & entry_vld[15:0]);  
assign pop_h1_vld         = |(lbuf_retire_pointer1[15:0] & entry_vld[15:0]); 
assign pop_h2_vld         = |(lbuf_retire_pointer2[15:0] & entry_vld[15:0]); 
assign pop_h3_vld         = |(lbuf_retire_pointer3[15:0] & entry_vld[15:0]); 
assign pop_h4_vld         = |(lbuf_retire_pointer4[15:0] & entry_vld[15:0]); 

//pop_hn_front_br
assign pop_h0_front_br    = |(lbuf_retire_pointer0[15:0] & entry_front_br[15:0] & entry_vld[15:0]); 
assign pop_h1_front_br    = |(lbuf_retire_pointer1[15:0] & entry_front_br[15:0] & entry_vld[15:0]);
assign pop_h2_front_br    = |(lbuf_retire_pointer2[15:0] & entry_front_br[15:0] & entry_vld[15:0]); 
assign pop_h3_front_br    = |(lbuf_retire_pointer3[15:0] & entry_front_br[15:0] & entry_vld[15:0]);
assign pop_h4_front_br    = |(lbuf_retire_pointer4[15:0] & entry_front_br[15:0] & entry_vld[15:0]);

//pop_hn_back_br1
assign pop_h0_back_br     = |(lbuf_retire_pointer0[15:0] & entry_back_br[15:0] & entry_vld[15:0]);
assign pop_h1_back_br     = |(lbuf_retire_pointer1[15:0] & entry_back_br[15:0] & entry_vld[15:0]);
assign pop_h2_back_br     = |(lbuf_retire_pointer2[15:0] & entry_back_br[15:0] & entry_vld[15:0]);
assign pop_h3_back_br     = |(lbuf_retire_pointer3[15:0] & entry_back_br[15:0] & entry_vld[15:0]);
assign pop_h4_back_br     = |(lbuf_retire_pointer4[15:0] & entry_back_br[15:0] & entry_vld[15:0]);

//pop_hn_32_start
assign pop_h0_32_start    = |(lbuf_retire_pointer0[15:0] & entry_32_start[15:0] & entry_vld[15:0]);  
assign pop_h1_32_start    = |(lbuf_retire_pointer1[15:0] & entry_32_start[15:0] & entry_vld[15:0]);
assign pop_h2_32_start    = |(lbuf_retire_pointer2[15:0] & entry_32_start[15:0] & entry_vld[15:0]);
assign pop_h3_32_start    = |(lbuf_retire_pointer3[15:0] & entry_32_start[15:0] & entry_vld[15:0]);
assign pop_h4_32_start    = |(lbuf_retire_pointer4[15:0] & entry_32_start[15:0] & entry_vld[15:0]); 
  
//pop_hn_fence
assign pop_h0_fence          = |(lbuf_retire_pointer0[15:0] & entry_fence[15:0]);
assign pop_h1_fence          = |(lbuf_retire_pointer1[15:0] & entry_fence[15:0]);
assign pop_h2_fence          = |(lbuf_retire_pointer2[15:0] & entry_fence[15:0]);
assign pop_h3_fence          = |(lbuf_retire_pointer3[15:0] & entry_fence[15:0]);
assign pop_h4_fence          = |(lbuf_retire_pointer4[15:0] & entry_fence[15:0]);

//pop_hn_bkpta
assign pop_h0_bkpta          = |(lbuf_retire_pointer0[15:0] & entry_bkpta[15:0]); 
assign pop_h1_bkpta          = |(lbuf_retire_pointer1[15:0] & entry_bkpta[15:0]); 
assign pop_h2_bkpta          = |(lbuf_retire_pointer2[15:0] & entry_bkpta[15:0]); 
assign pop_h3_bkpta          = |(lbuf_retire_pointer3[15:0] & entry_bkpta[15:0]); 
assign pop_h4_bkpta          = |(lbuf_retire_pointer4[15:0] & entry_bkpta[15:0]); 

//pop_hn_bkptb
assign pop_h0_bkptb          = |(lbuf_retire_pointer0[15:0] & entry_bkptb[15:0]); 
assign pop_h1_bkptb          = |(lbuf_retire_pointer1[15:0] & entry_bkptb[15:0]);
assign pop_h2_bkptb          = |(lbuf_retire_pointer2[15:0] & entry_bkptb[15:0]);
assign pop_h3_bkptb          = |(lbuf_retire_pointer3[15:0] & entry_bkptb[15:0]);
assign pop_h4_bkptb          = |(lbuf_retire_pointer4[15:0] & entry_bkptb[15:0]);

//pop_hn_vsetvli
assign pop_h0_vsetvli        = |(lbuf_retire_pointer0[15:0] & entry_vsetvli[15:0]);
assign pop_h1_vsetvli        = |(lbuf_retire_pointer1[15:0] & entry_vsetvli[15:0]);
assign pop_h2_vsetvli        = |(lbuf_retire_pointer2[15:0] & entry_vsetvli[15:0]);
assign pop_h3_vsetvli        = |(lbuf_retire_pointer3[15:0] & entry_vsetvli[15:0]);
assign pop_h4_vsetvli        = |(lbuf_retire_pointer4[15:0] & entry_vsetvli[15:0]);

//pop_hn_data[15:0]
assign pop_h0_data[15:0]  = ({16{lbuf_retire_pointer0[ 0]}} & entry_inst_data_0[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 1]}} & entry_inst_data_1[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 2]}} & entry_inst_data_2[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 3]}} & entry_inst_data_3[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 4]}} & entry_inst_data_4[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 5]}} & entry_inst_data_5[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 6]}} & entry_inst_data_6[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 7]}} & entry_inst_data_7[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 8]}} & entry_inst_data_8[15:0])  | 
                            ({16{lbuf_retire_pointer0[ 9]}} & entry_inst_data_9[15:0])  | 
                            ({16{lbuf_retire_pointer0[10]}} & entry_inst_data_10[15:0]) | 
                            ({16{lbuf_retire_pointer0[11]}} & entry_inst_data_11[15:0]) | 
                            ({16{lbuf_retire_pointer0[12]}} & entry_inst_data_12[15:0]) | 
                            ({16{lbuf_retire_pointer0[13]}} & entry_inst_data_13[15:0]) | 
                            ({16{lbuf_retire_pointer0[14]}} & entry_inst_data_14[15:0]) | 
                            ({16{lbuf_retire_pointer0[15]}} & entry_inst_data_15[15:0]); 

assign pop_h1_data[15:0]  = ({16{lbuf_retire_pointer1[ 0]}} & entry_inst_data_0[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 1]}} & entry_inst_data_1[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 2]}} & entry_inst_data_2[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 3]}} & entry_inst_data_3[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 4]}} & entry_inst_data_4[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 5]}} & entry_inst_data_5[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 6]}} & entry_inst_data_6[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 7]}} & entry_inst_data_7[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 8]}} & entry_inst_data_8[15:0])  | 
                            ({16{lbuf_retire_pointer1[ 9]}} & entry_inst_data_9[15:0])  | 
                            ({16{lbuf_retire_pointer1[10]}} & entry_inst_data_10[15:0]) | 
                            ({16{lbuf_retire_pointer1[11]}} & entry_inst_data_11[15:0]) | 
                            ({16{lbuf_retire_pointer1[12]}} & entry_inst_data_12[15:0]) | 
                            ({16{lbuf_retire_pointer1[13]}} & entry_inst_data_13[15:0]) | 
                            ({16{lbuf_retire_pointer1[14]}} & entry_inst_data_14[15:0]) | 
                            ({16{lbuf_retire_pointer1[15]}} & entry_inst_data_15[15:0]); 

assign pop_h2_data[15:0]  = ({16{lbuf_retire_pointer2[ 0]}} & entry_inst_data_0[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 1]}} & entry_inst_data_1[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 2]}} & entry_inst_data_2[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 3]}} & entry_inst_data_3[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 4]}} & entry_inst_data_4[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 5]}} & entry_inst_data_5[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 6]}} & entry_inst_data_6[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 7]}} & entry_inst_data_7[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 8]}} & entry_inst_data_8[15:0])  | 
                            ({16{lbuf_retire_pointer2[ 9]}} & entry_inst_data_9[15:0])  | 
                            ({16{lbuf_retire_pointer2[10]}} & entry_inst_data_10[15:0]) | 
                            ({16{lbuf_retire_pointer2[11]}} & entry_inst_data_11[15:0]) | 
                            ({16{lbuf_retire_pointer2[12]}} & entry_inst_data_12[15:0]) | 
                            ({16{lbuf_retire_pointer2[13]}} & entry_inst_data_13[15:0]) | 
                            ({16{lbuf_retire_pointer2[14]}} & entry_inst_data_14[15:0]) | 
                            ({16{lbuf_retire_pointer2[15]}} & entry_inst_data_15[15:0]); 

assign pop_h3_data[15:0]  = ({16{lbuf_retire_pointer3[ 0]}} & entry_inst_data_0[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 1]}} & entry_inst_data_1[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 2]}} & entry_inst_data_2[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 3]}} & entry_inst_data_3[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 4]}} & entry_inst_data_4[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 5]}} & entry_inst_data_5[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 6]}} & entry_inst_data_6[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 7]}} & entry_inst_data_7[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 8]}} & entry_inst_data_8[15:0])  | 
                            ({16{lbuf_retire_pointer3[ 9]}} & entry_inst_data_9[15:0])  | 
                            ({16{lbuf_retire_pointer3[10]}} & entry_inst_data_10[15:0]) | 
                            ({16{lbuf_retire_pointer3[11]}} & entry_inst_data_11[15:0]) | 
                            ({16{lbuf_retire_pointer3[12]}} & entry_inst_data_12[15:0]) | 
                            ({16{lbuf_retire_pointer3[13]}} & entry_inst_data_13[15:0]) | 
                            ({16{lbuf_retire_pointer3[14]}} & entry_inst_data_14[15:0]) | 
                            ({16{lbuf_retire_pointer3[15]}} & entry_inst_data_15[15:0]); 

assign pop_h4_data[15:0]  = ({16{lbuf_retire_pointer4[ 0]}} & entry_inst_data_0[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 1]}} & entry_inst_data_1[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 2]}} & entry_inst_data_2[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 3]}} & entry_inst_data_3[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 4]}} & entry_inst_data_4[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 5]}} & entry_inst_data_5[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 6]}} & entry_inst_data_6[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 7]}} & entry_inst_data_7[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 8]}} & entry_inst_data_8[15:0])  | 
                            ({16{lbuf_retire_pointer4[ 9]}} & entry_inst_data_9[15:0])  | 
                            ({16{lbuf_retire_pointer4[10]}} & entry_inst_data_10[15:0]) | 
                            ({16{lbuf_retire_pointer4[11]}} & entry_inst_data_11[15:0]) | 
                            ({16{lbuf_retire_pointer4[12]}} & entry_inst_data_12[15:0]) | 
                            ({16{lbuf_retire_pointer4[13]}} & entry_inst_data_13[15:0]) | 
                            ({16{lbuf_retire_pointer4[14]}} & entry_inst_data_14[15:0]) | 
                            ({16{lbuf_retire_pointer4[15]}} & entry_inst_data_15[15:0]); 

assign pop_h5_data[15:0]  = ({16{lbuf_retire_pointer5[ 0]}} & entry_inst_data_0[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 1]}} & entry_inst_data_1[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 2]}} & entry_inst_data_2[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 3]}} & entry_inst_data_3[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 4]}} & entry_inst_data_4[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 5]}} & entry_inst_data_5[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 6]}} & entry_inst_data_6[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 7]}} & entry_inst_data_7[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 8]}} & entry_inst_data_8[15:0])  | 
                            ({16{lbuf_retire_pointer5[ 9]}} & entry_inst_data_9[15:0])  | 
                            ({16{lbuf_retire_pointer5[10]}} & entry_inst_data_10[15:0]) | 
                            ({16{lbuf_retire_pointer5[11]}} & entry_inst_data_11[15:0]) | 
                            ({16{lbuf_retire_pointer5[12]}} & entry_inst_data_12[15:0]) | 
                            ({16{lbuf_retire_pointer5[13]}} & entry_inst_data_13[15:0]) | 
                            ({16{lbuf_retire_pointer5[14]}} & entry_inst_data_14[15:0]) | 
                            ({16{lbuf_retire_pointer5[15]}} & entry_inst_data_15[15:0]);


//pop_hn_vlmul[1:0]
assign pop_h0_vlmul[1:0]  = ({2{lbuf_retire_pointer0[ 0]}} & entry_vlmul_0[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 1]}} & entry_vlmul_1[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 2]}} & entry_vlmul_2[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 3]}} & entry_vlmul_3[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 4]}} & entry_vlmul_4[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 5]}} & entry_vlmul_5[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 6]}} & entry_vlmul_6[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 7]}} & entry_vlmul_7[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 8]}} & entry_vlmul_8[1:0])  | 
                            ({2{lbuf_retire_pointer0[ 9]}} & entry_vlmul_9[1:0])  | 
                            ({2{lbuf_retire_pointer0[10]}} & entry_vlmul_10[1:0]) | 
                            ({2{lbuf_retire_pointer0[11]}} & entry_vlmul_11[1:0]) | 
                            ({2{lbuf_retire_pointer0[12]}} & entry_vlmul_12[1:0]) | 
                            ({2{lbuf_retire_pointer0[13]}} & entry_vlmul_13[1:0]) | 
                            ({2{lbuf_retire_pointer0[14]}} & entry_vlmul_14[1:0]) | 
                            ({2{lbuf_retire_pointer0[15]}} & entry_vlmul_15[1:0]); 

assign pop_h1_vlmul[1:0]  = ({2{lbuf_retire_pointer1[ 0]}} & entry_vlmul_0[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 1]}} & entry_vlmul_1[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 2]}} & entry_vlmul_2[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 3]}} & entry_vlmul_3[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 4]}} & entry_vlmul_4[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 5]}} & entry_vlmul_5[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 6]}} & entry_vlmul_6[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 7]}} & entry_vlmul_7[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 8]}} & entry_vlmul_8[1:0])  | 
                            ({2{lbuf_retire_pointer1[ 9]}} & entry_vlmul_9[1:0])  | 
                            ({2{lbuf_retire_pointer1[10]}} & entry_vlmul_10[1:0]) | 
                            ({2{lbuf_retire_pointer1[11]}} & entry_vlmul_11[1:0]) | 
                            ({2{lbuf_retire_pointer1[12]}} & entry_vlmul_12[1:0]) | 
                            ({2{lbuf_retire_pointer1[13]}} & entry_vlmul_13[1:0]) | 
                            ({2{lbuf_retire_pointer1[14]}} & entry_vlmul_14[1:0]) | 
                            ({2{lbuf_retire_pointer1[15]}} & entry_vlmul_15[1:0]); 

assign pop_h2_vlmul[1:0]  = ({2{lbuf_retire_pointer2[ 0]}} & entry_vlmul_0[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 1]}} & entry_vlmul_1[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 2]}} & entry_vlmul_2[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 3]}} & entry_vlmul_3[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 4]}} & entry_vlmul_4[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 5]}} & entry_vlmul_5[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 6]}} & entry_vlmul_6[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 7]}} & entry_vlmul_7[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 8]}} & entry_vlmul_8[1:0])  | 
                            ({2{lbuf_retire_pointer2[ 9]}} & entry_vlmul_9[1:0])  | 
                            ({2{lbuf_retire_pointer2[10]}} & entry_vlmul_10[1:0]) | 
                            ({2{lbuf_retire_pointer2[11]}} & entry_vlmul_11[1:0]) | 
                            ({2{lbuf_retire_pointer2[12]}} & entry_vlmul_12[1:0]) | 
                            ({2{lbuf_retire_pointer2[13]}} & entry_vlmul_13[1:0]) | 
                            ({2{lbuf_retire_pointer2[14]}} & entry_vlmul_14[1:0]) | 
                            ({2{lbuf_retire_pointer2[15]}} & entry_vlmul_15[1:0]); 

assign pop_h3_vlmul[1:0]  = ({2{lbuf_retire_pointer3[ 0]}} & entry_vlmul_0[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 1]}} & entry_vlmul_1[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 2]}} & entry_vlmul_2[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 3]}} & entry_vlmul_3[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 4]}} & entry_vlmul_4[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 5]}} & entry_vlmul_5[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 6]}} & entry_vlmul_6[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 7]}} & entry_vlmul_7[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 8]}} & entry_vlmul_8[1:0])  | 
                            ({2{lbuf_retire_pointer3[ 9]}} & entry_vlmul_9[1:0])  | 
                            ({2{lbuf_retire_pointer3[10]}} & entry_vlmul_10[1:0]) | 
                            ({2{lbuf_retire_pointer3[11]}} & entry_vlmul_11[1:0]) | 
                            ({2{lbuf_retire_pointer3[12]}} & entry_vlmul_12[1:0]) | 
                            ({2{lbuf_retire_pointer3[13]}} & entry_vlmul_13[1:0]) | 
                            ({2{lbuf_retire_pointer3[14]}} & entry_vlmul_14[1:0]) | 
                            ({2{lbuf_retire_pointer3[15]}} & entry_vlmul_15[1:0]); 

assign pop_h4_vlmul[1:0]  = ({2{lbuf_retire_pointer4[ 0]}} & entry_vlmul_0[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 1]}} & entry_vlmul_1[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 2]}} & entry_vlmul_2[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 3]}} & entry_vlmul_3[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 4]}} & entry_vlmul_4[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 5]}} & entry_vlmul_5[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 6]}} & entry_vlmul_6[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 7]}} & entry_vlmul_7[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 8]}} & entry_vlmul_8[1:0])  | 
                            ({2{lbuf_retire_pointer4[ 9]}} & entry_vlmul_9[1:0])  | 
                            ({2{lbuf_retire_pointer4[10]}} & entry_vlmul_10[1:0]) | 
                            ({2{lbuf_retire_pointer4[11]}} & entry_vlmul_11[1:0]) | 
                            ({2{lbuf_retire_pointer4[12]}} & entry_vlmul_12[1:0]) | 
                            ({2{lbuf_retire_pointer4[13]}} & entry_vlmul_13[1:0]) | 
                            ({2{lbuf_retire_pointer4[14]}} & entry_vlmul_14[1:0]) | 
                            ({2{lbuf_retire_pointer4[15]}} & entry_vlmul_15[1:0]); 


//pop_hn_vsew[2:0]
assign pop_h0_vsew[2:0]  = ({3{lbuf_retire_pointer0[ 0]}} & entry_vsew_0[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 1]}} & entry_vsew_1[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 2]}} & entry_vsew_2[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 3]}} & entry_vsew_3[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 4]}} & entry_vsew_4[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 5]}} & entry_vsew_5[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 6]}} & entry_vsew_6[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 7]}} & entry_vsew_7[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 8]}} & entry_vsew_8[2:0])  | 
                           ({3{lbuf_retire_pointer0[ 9]}} & entry_vsew_9[2:0])  | 
                           ({3{lbuf_retire_pointer0[10]}} & entry_vsew_10[2:0]) | 
                           ({3{lbuf_retire_pointer0[11]}} & entry_vsew_11[2:0]) | 
                           ({3{lbuf_retire_pointer0[12]}} & entry_vsew_12[2:0]) | 
                           ({3{lbuf_retire_pointer0[13]}} & entry_vsew_13[2:0]) | 
                           ({3{lbuf_retire_pointer0[14]}} & entry_vsew_14[2:0]) | 
                           ({3{lbuf_retire_pointer0[15]}} & entry_vsew_15[2:0]); 

assign pop_h1_vsew[2:0]  = ({3{lbuf_retire_pointer1[ 0]}} & entry_vsew_0[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 1]}} & entry_vsew_1[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 2]}} & entry_vsew_2[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 3]}} & entry_vsew_3[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 4]}} & entry_vsew_4[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 5]}} & entry_vsew_5[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 6]}} & entry_vsew_6[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 7]}} & entry_vsew_7[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 8]}} & entry_vsew_8[2:0])  | 
                           ({3{lbuf_retire_pointer1[ 9]}} & entry_vsew_9[2:0])  | 
                           ({3{lbuf_retire_pointer1[10]}} & entry_vsew_10[2:0]) | 
                           ({3{lbuf_retire_pointer1[11]}} & entry_vsew_11[2:0]) | 
                           ({3{lbuf_retire_pointer1[12]}} & entry_vsew_12[2:0]) | 
                           ({3{lbuf_retire_pointer1[13]}} & entry_vsew_13[2:0]) | 
                           ({3{lbuf_retire_pointer1[14]}} & entry_vsew_14[2:0]) | 
                           ({3{lbuf_retire_pointer1[15]}} & entry_vsew_15[2:0]); 

assign pop_h2_vsew[2:0]  = ({3{lbuf_retire_pointer2[ 0]}} & entry_vsew_0[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 1]}} & entry_vsew_1[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 2]}} & entry_vsew_2[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 3]}} & entry_vsew_3[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 4]}} & entry_vsew_4[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 5]}} & entry_vsew_5[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 6]}} & entry_vsew_6[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 7]}} & entry_vsew_7[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 8]}} & entry_vsew_8[2:0])  | 
                           ({3{lbuf_retire_pointer2[ 9]}} & entry_vsew_9[2:0])  | 
                           ({3{lbuf_retire_pointer2[10]}} & entry_vsew_10[2:0]) | 
                           ({3{lbuf_retire_pointer2[11]}} & entry_vsew_11[2:0]) | 
                           ({3{lbuf_retire_pointer2[12]}} & entry_vsew_12[2:0]) | 
                           ({3{lbuf_retire_pointer2[13]}} & entry_vsew_13[2:0]) | 
                           ({3{lbuf_retire_pointer2[14]}} & entry_vsew_14[2:0]) | 
                           ({3{lbuf_retire_pointer2[15]}} & entry_vsew_15[2:0]); 

assign pop_h3_vsew[2:0]  = ({3{lbuf_retire_pointer3[ 0]}} & entry_vsew_0[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 1]}} & entry_vsew_1[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 2]}} & entry_vsew_2[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 3]}} & entry_vsew_3[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 4]}} & entry_vsew_4[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 5]}} & entry_vsew_5[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 6]}} & entry_vsew_6[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 7]}} & entry_vsew_7[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 8]}} & entry_vsew_8[2:0])  | 
                           ({3{lbuf_retire_pointer3[ 9]}} & entry_vsew_9[2:0])  | 
                           ({3{lbuf_retire_pointer3[10]}} & entry_vsew_10[2:0]) | 
                           ({3{lbuf_retire_pointer3[11]}} & entry_vsew_11[2:0]) | 
                           ({3{lbuf_retire_pointer3[12]}} & entry_vsew_12[2:0]) | 
                           ({3{lbuf_retire_pointer3[13]}} & entry_vsew_13[2:0]) | 
                           ({3{lbuf_retire_pointer3[14]}} & entry_vsew_14[2:0]) | 
                           ({3{lbuf_retire_pointer3[15]}} & entry_vsew_15[2:0]); 

assign pop_h4_vsew[2:0]  = ({3{lbuf_retire_pointer4[ 0]}} & entry_vsew_0[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 1]}} & entry_vsew_1[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 2]}} & entry_vsew_2[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 3]}} & entry_vsew_3[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 4]}} & entry_vsew_4[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 5]}} & entry_vsew_5[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 6]}} & entry_vsew_6[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 7]}} & entry_vsew_7[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 8]}} & entry_vsew_8[2:0])  | 
                           ({3{lbuf_retire_pointer4[ 9]}} & entry_vsew_9[2:0])  | 
                           ({3{lbuf_retire_pointer4[10]}} & entry_vsew_10[2:0]) | 
                           ({3{lbuf_retire_pointer4[11]}} & entry_vsew_11[2:0]) | 
                           ({3{lbuf_retire_pointer4[12]}} & entry_vsew_12[2:0]) | 
                           ({3{lbuf_retire_pointer4[13]}} & entry_vsew_13[2:0]) | 
                           ({3{lbuf_retire_pointer4[14]}} & entry_vsew_14[2:0]) | 
                           ({3{lbuf_retire_pointer4[15]}} & entry_vsew_15[2:0]); 

//pop_hn_vl[7:0]
assign pop_h0_vl[7:0]    = ({8{lbuf_retire_pointer0[ 0]}} & entry_vl_0[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 1]}} & entry_vl_1[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 2]}} & entry_vl_2[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 3]}} & entry_vl_3[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 4]}} & entry_vl_4[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 5]}} & entry_vl_5[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 6]}} & entry_vl_6[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 7]}} & entry_vl_7[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 8]}} & entry_vl_8[7:0])  | 
                           ({8{lbuf_retire_pointer0[ 9]}} & entry_vl_9[7:0])  | 
                           ({8{lbuf_retire_pointer0[10]}} & entry_vl_10[7:0]) | 
                           ({8{lbuf_retire_pointer0[11]}} & entry_vl_11[7:0]) | 
                           ({8{lbuf_retire_pointer0[12]}} & entry_vl_12[7:0]) | 
                           ({8{lbuf_retire_pointer0[13]}} & entry_vl_13[7:0]) | 
                           ({8{lbuf_retire_pointer0[14]}} & entry_vl_14[7:0]) | 
                           ({8{lbuf_retire_pointer0[15]}} & entry_vl_15[7:0]); 

assign pop_h1_vl[7:0]    = ({8{lbuf_retire_pointer1[ 0]}} & entry_vl_0[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 1]}} & entry_vl_1[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 2]}} & entry_vl_2[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 3]}} & entry_vl_3[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 4]}} & entry_vl_4[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 5]}} & entry_vl_5[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 6]}} & entry_vl_6[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 7]}} & entry_vl_7[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 8]}} & entry_vl_8[7:0])  | 
                           ({8{lbuf_retire_pointer1[ 9]}} & entry_vl_9[7:0])  | 
                           ({8{lbuf_retire_pointer1[10]}} & entry_vl_10[7:0]) | 
                           ({8{lbuf_retire_pointer1[11]}} & entry_vl_11[7:0]) | 
                           ({8{lbuf_retire_pointer1[12]}} & entry_vl_12[7:0]) | 
                           ({8{lbuf_retire_pointer1[13]}} & entry_vl_13[7:0]) | 
                           ({8{lbuf_retire_pointer1[14]}} & entry_vl_14[7:0]) | 
                           ({8{lbuf_retire_pointer1[15]}} & entry_vl_15[7:0]); 

assign pop_h2_vl[7:0]    = ({8{lbuf_retire_pointer2[ 0]}} & entry_vl_0[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 1]}} & entry_vl_1[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 2]}} & entry_vl_2[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 3]}} & entry_vl_3[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 4]}} & entry_vl_4[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 5]}} & entry_vl_5[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 6]}} & entry_vl_6[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 7]}} & entry_vl_7[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 8]}} & entry_vl_8[7:0])  | 
                           ({8{lbuf_retire_pointer2[ 9]}} & entry_vl_9[7:0])  | 
                           ({8{lbuf_retire_pointer2[10]}} & entry_vl_10[7:0]) | 
                           ({8{lbuf_retire_pointer2[11]}} & entry_vl_11[7:0]) | 
                           ({8{lbuf_retire_pointer2[12]}} & entry_vl_12[7:0]) | 
                           ({8{lbuf_retire_pointer2[13]}} & entry_vl_13[7:0]) | 
                           ({8{lbuf_retire_pointer2[14]}} & entry_vl_14[7:0]) | 
                           ({8{lbuf_retire_pointer2[15]}} & entry_vl_15[7:0]); 

assign pop_h3_vl[7:0]    = ({8{lbuf_retire_pointer3[ 0]}} & entry_vl_0[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 1]}} & entry_vl_1[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 2]}} & entry_vl_2[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 3]}} & entry_vl_3[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 4]}} & entry_vl_4[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 5]}} & entry_vl_5[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 6]}} & entry_vl_6[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 7]}} & entry_vl_7[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 8]}} & entry_vl_8[7:0])  | 
                           ({8{lbuf_retire_pointer3[ 9]}} & entry_vl_9[7:0])  | 
                           ({8{lbuf_retire_pointer3[10]}} & entry_vl_10[7:0]) | 
                           ({8{lbuf_retire_pointer3[11]}} & entry_vl_11[7:0]) | 
                           ({8{lbuf_retire_pointer3[12]}} & entry_vl_12[7:0]) | 
                           ({8{lbuf_retire_pointer3[13]}} & entry_vl_13[7:0]) | 
                           ({8{lbuf_retire_pointer3[14]}} & entry_vl_14[7:0]) | 
                           ({8{lbuf_retire_pointer3[15]}} & entry_vl_15[7:0]); 

assign pop_h4_vl[7:0]    = ({8{lbuf_retire_pointer4[ 0]}} & entry_vl_0[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 1]}} & entry_vl_1[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 2]}} & entry_vl_2[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 3]}} & entry_vl_3[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 4]}} & entry_vl_4[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 5]}} & entry_vl_5[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 6]}} & entry_vl_6[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 7]}} & entry_vl_7[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 8]}} & entry_vl_8[7:0])  | 
                           ({8{lbuf_retire_pointer4[ 9]}} & entry_vl_9[7:0])  | 
                           ({8{lbuf_retire_pointer4[10]}} & entry_vl_10[7:0]) | 
                           ({8{lbuf_retire_pointer4[11]}} & entry_vl_11[7:0]) | 
                           ({8{lbuf_retire_pointer4[12]}} & entry_vl_12[7:0]) | 
                           ({8{lbuf_retire_pointer4[13]}} & entry_vl_13[7:0]) | 
                           ({8{lbuf_retire_pointer4[14]}} & entry_vl_14[7:0]) | 
                           ({8{lbuf_retire_pointer4[15]}} & entry_vl_15[7:0]); 


//pop_hn_split0_type[2:0]
assign pop_h0_split0_type[2:0]  = ({3{lbuf_retire_pointer0[ 0]}} & entry_split0_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 1]}} & entry_split0_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 2]}} & entry_split0_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 3]}} & entry_split0_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 4]}} & entry_split0_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 5]}} & entry_split0_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 6]}} & entry_split0_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 7]}} & entry_split0_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 8]}} & entry_split0_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 9]}} & entry_split0_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer0[10]}} & entry_split0_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer0[11]}} & entry_split0_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer0[12]}} & entry_split0_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer0[13]}} & entry_split0_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer0[14]}} & entry_split0_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer0[15]}} & entry_split0_type_15[2:0]); 

assign pop_h1_split0_type[2:0]  = ({3{lbuf_retire_pointer1[ 0]}} & entry_split0_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 1]}} & entry_split0_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 2]}} & entry_split0_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 3]}} & entry_split0_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 4]}} & entry_split0_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 5]}} & entry_split0_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 6]}} & entry_split0_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 7]}} & entry_split0_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 8]}} & entry_split0_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 9]}} & entry_split0_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer1[10]}} & entry_split0_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer1[11]}} & entry_split0_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer1[12]}} & entry_split0_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer1[13]}} & entry_split0_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer1[14]}} & entry_split0_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer1[15]}} & entry_split0_type_15[2:0]); 

assign pop_h2_split0_type[2:0]  = ({3{lbuf_retire_pointer2[ 0]}} & entry_split0_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 1]}} & entry_split0_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 2]}} & entry_split0_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 3]}} & entry_split0_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 4]}} & entry_split0_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 5]}} & entry_split0_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 6]}} & entry_split0_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 7]}} & entry_split0_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 8]}} & entry_split0_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 9]}} & entry_split0_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer2[10]}} & entry_split0_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer2[11]}} & entry_split0_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer2[12]}} & entry_split0_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer2[13]}} & entry_split0_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer2[14]}} & entry_split0_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer2[15]}} & entry_split0_type_15[2:0]); 

assign pop_h3_split0_type[2:0]  = ({3{lbuf_retire_pointer3[ 0]}} & entry_split0_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 1]}} & entry_split0_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 2]}} & entry_split0_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 3]}} & entry_split0_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 4]}} & entry_split0_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 5]}} & entry_split0_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 6]}} & entry_split0_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 7]}} & entry_split0_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 8]}} & entry_split0_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 9]}} & entry_split0_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer3[10]}} & entry_split0_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer3[11]}} & entry_split0_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer3[12]}} & entry_split0_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer3[13]}} & entry_split0_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer3[14]}} & entry_split0_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer3[15]}} & entry_split0_type_15[2:0]); 

assign pop_h4_split0_type[2:0]  = ({3{lbuf_retire_pointer4[ 0]}} & entry_split0_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 1]}} & entry_split0_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 2]}} & entry_split0_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 3]}} & entry_split0_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 4]}} & entry_split0_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 5]}} & entry_split0_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 6]}} & entry_split0_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 7]}} & entry_split0_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 8]}} & entry_split0_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 9]}} & entry_split0_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer4[10]}} & entry_split0_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer4[11]}} & entry_split0_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer4[12]}} & entry_split0_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer4[13]}} & entry_split0_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer4[14]}} & entry_split0_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer4[15]}} & entry_split0_type_15[2:0]); 

//pop_hn_split1_type[2:0]
assign pop_h0_split1_type[2:0]  = ({3{lbuf_retire_pointer0[ 0]}} & entry_split1_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 1]}} & entry_split1_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 2]}} & entry_split1_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 3]}} & entry_split1_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 4]}} & entry_split1_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 5]}} & entry_split1_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 6]}} & entry_split1_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 7]}} & entry_split1_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 8]}} & entry_split1_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer0[ 9]}} & entry_split1_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer0[10]}} & entry_split1_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer0[11]}} & entry_split1_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer0[12]}} & entry_split1_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer0[13]}} & entry_split1_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer0[14]}} & entry_split1_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer0[15]}} & entry_split1_type_15[2:0]); 

assign pop_h1_split1_type[2:0]  = ({3{lbuf_retire_pointer1[ 0]}} & entry_split1_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 1]}} & entry_split1_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 2]}} & entry_split1_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 3]}} & entry_split1_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 4]}} & entry_split1_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 5]}} & entry_split1_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 6]}} & entry_split1_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 7]}} & entry_split1_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 8]}} & entry_split1_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer1[ 9]}} & entry_split1_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer1[10]}} & entry_split1_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer1[11]}} & entry_split1_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer1[12]}} & entry_split1_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer1[13]}} & entry_split1_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer1[14]}} & entry_split1_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer1[15]}} & entry_split1_type_15[2:0]); 

assign pop_h2_split1_type[2:0]  = ({3{lbuf_retire_pointer2[ 0]}} & entry_split1_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 1]}} & entry_split1_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 2]}} & entry_split1_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 3]}} & entry_split1_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 4]}} & entry_split1_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 5]}} & entry_split1_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 6]}} & entry_split1_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 7]}} & entry_split1_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 8]}} & entry_split1_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer2[ 9]}} & entry_split1_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer2[10]}} & entry_split1_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer2[11]}} & entry_split1_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer2[12]}} & entry_split1_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer2[13]}} & entry_split1_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer2[14]}} & entry_split1_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer2[15]}} & entry_split1_type_15[2:0]); 

assign pop_h3_split1_type[2:0]  = ({3{lbuf_retire_pointer3[ 0]}} & entry_split1_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 1]}} & entry_split1_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 2]}} & entry_split1_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 3]}} & entry_split1_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 4]}} & entry_split1_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 5]}} & entry_split1_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 6]}} & entry_split1_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 7]}} & entry_split1_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 8]}} & entry_split1_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer3[ 9]}} & entry_split1_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer3[10]}} & entry_split1_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer3[11]}} & entry_split1_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer3[12]}} & entry_split1_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer3[13]}} & entry_split1_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer3[14]}} & entry_split1_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer3[15]}} & entry_split1_type_15[2:0]); 

assign pop_h4_split1_type[2:0]  = ({3{lbuf_retire_pointer4[ 0]}} & entry_split1_type_0[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 1]}} & entry_split1_type_1[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 2]}} & entry_split1_type_2[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 3]}} & entry_split1_type_3[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 4]}} & entry_split1_type_4[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 5]}} & entry_split1_type_5[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 6]}} & entry_split1_type_6[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 7]}} & entry_split1_type_7[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 8]}} & entry_split1_type_8[2:0])  | 
                                  ({3{lbuf_retire_pointer4[ 9]}} & entry_split1_type_9[2:0])  | 
                                  ({3{lbuf_retire_pointer4[10]}} & entry_split1_type_10[2:0]) | 
                                  ({3{lbuf_retire_pointer4[11]}} & entry_split1_type_11[2:0]) | 
                                  ({3{lbuf_retire_pointer4[12]}} & entry_split1_type_12[2:0]) | 
                                  ({3{lbuf_retire_pointer4[13]}} & entry_split1_type_13[2:0]) | 
                                  ({3{lbuf_retire_pointer4[14]}} & entry_split1_type_14[2:0]) | 
                                  ({3{lbuf_retire_pointer4[15]}} & entry_split1_type_15[2:0]); 

//==========================================================
//                Create Pointer Logic
//==========================================================

//According to the number of Half Word Pipedown, 
//Pre generate create pointer
// &CombBeg; @3176
always @( lbuf_create_pointer[15:0]
       or ibdp_lbuf_half_vld_num[3:0])
begin
case(ibdp_lbuf_half_vld_num[3:0])
  4'b0001 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-2:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1]};
  4'b0010 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-3:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
  4'b0011 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-4:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
  4'b0100 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-5:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
  4'b0101 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-6:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
  4'b0110 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-7:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
  4'b0111 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-8:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-7]};
  4'b1000 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-9:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-8]};
  4'b1001 : create_pointer_pre[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-10:0],
                                                 lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-9]};
  default : create_pointer_pre[ENTRY_NUM-1:0] = lbuf_create_pointer[ENTRY_NUM-1:0];
endcase
// &CombEnd; @3198
end

//-----------Create Pointer Register Update-----------------
//Gate Clock
// &Instance("gated_clk_cell","x_lbuf_create_pointer_update_clk"); @3202
gated_clk_cell  x_lbuf_create_pointer_update_clk (
  .clk_in                            (forever_cpuclk                   ),
  .clk_out                           (lbuf_create_pointer_update_clk   ),
  .external_en                       (1'b0                             ),
  .global_en                         (cp0_yy_clk_en                    ),
  .local_en                          (lbuf_create_pointer_update_clk_en),
  .module_en                         (cp0_ifu_icg_en                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               )
);

// &Connect( .clk_in         (forever_cpuclk), @3203
//           .clk_out        (lbuf_create_pointer_update_clk),//Out Clock @3204
//           .external_en    (1'b0), @3205
//           .global_en      (cp0_yy_clk_en), @3206
//           .local_en       (lbuf_create_pointer_update_clk_en),//Local Condition @3207
//           .module_en      (cp0_ifu_icg_en) @3208
//         ); @3209
assign lbuf_create_pointer_update_clk_en = lbuf_flush || 
                                           lbuf_create_vld || 
                                           fill_state_enter || 
                                           front_fill_enter_gateclk_en || 
                                           taken_front_branch_enter;
//Update Logic
always @(posedge lbuf_create_pointer_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_create_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(lbuf_flush)
    lbuf_create_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(fill_state_enter)
    lbuf_create_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(taken_front_branch_enter)
    lbuf_create_pointer[ENTRY_NUM-1:0] <= front_update_pointer[15:0];
  else if(front_fill_enter)
    lbuf_create_pointer[ENTRY_NUM-1:0] <= front_update_next_pointer[15:0];
  else if(lbuf_create_vld)
    lbuf_create_pointer[ENTRY_NUM-1:0] <= create_pointer_pre[ENTRY_NUM-1:0];
  else
    lbuf_create_pointer[ENTRY_NUM-1:0] <= lbuf_create_pointer[ENTRY_NUM-1:0];
end
assign taken_front_branch_enter = (lbuf_cur_state[5:0] == FRONT_BRANCH) && 
                                  front_update_br_taken;
assign front_fill_enter         = (lbuf_cur_state[5:0] == ACTIVE) && 
                                  front_br_body_not_filled;
assign front_fill_enter_gateclk_en = (lbuf_cur_state[5:0] == ACTIVE) && 
                                     (!front_entry_body_filled && 
                                       front_entry_vld && 
                                       lbuf_retire_vld && 
                                      !front_br_bht_result && 
                                      (lbuf_pop_inst0_front_br || 
                                       lbuf_pop_inst1_front_br || 
                                       lbuf_pop_inst2_front_br)
                                     );

//There are most 9 Half will be wrote into lbuf
//Thus need 9 create pointer to point different entry 
assign lbuf_create_pointer0[ENTRY_NUM-1:0] = lbuf_create_pointer[ENTRY_NUM-1:0];
assign lbuf_create_pointer1[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-2:0],
                                              lbuf_create_pointer[ENTRY_NUM-1]};
assign lbuf_create_pointer2[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-3:0],
                                              lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
assign lbuf_create_pointer3[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-4:0],
                                              lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
assign lbuf_create_pointer4[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-5:0],
                                              lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
assign lbuf_create_pointer5[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-6:0],
                                              lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
assign lbuf_create_pointer6[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-7:0],
                                              lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
assign lbuf_create_pointer7[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-8:0],
                                              lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-7]};
assign lbuf_create_pointer8[ENTRY_NUM-1:0] = {lbuf_create_pointer[ENTRY_NUM-9:0],
                                              lbuf_create_pointer[ENTRY_NUM-1:ENTRY_NUM-8]};

//==========================================================
//                Retire Pointer Logic
//==========================================================
//No Branch retire pointer prepare
//Branch retire pointer prepare

//Branch Way LBUF Retire Pointer Prepare
assign back_entry_update_pointer[ENTRY_NUM-1:0] = 16'b1;
// &CombBeg; @3275
always @( front_entry_update_pointer[15:0]
       or back_entry_update_pointer[15:0]
       or lbuf_pop_inst0_front_br)
begin
if(lbuf_pop_inst0_front_br)
  lbuf_pop_inst0_retire_pointer_br_pre[ENTRY_NUM-1:0] = front_entry_update_pointer[ENTRY_NUM-1:0];
else
  lbuf_pop_inst0_retire_pointer_br_pre[ENTRY_NUM-1:0] = back_entry_update_pointer[ENTRY_NUM-1:0];
// &CombEnd; @3280
end

// &CombBeg; @3282
always @( front_entry_update_pointer[15:0]
       or back_entry_update_pointer[15:0]
       or lbuf_pop_inst1_front_br)
begin
if(lbuf_pop_inst1_front_br)
  lbuf_pop_inst1_retire_pointer_br_pre[ENTRY_NUM-1:0] = front_entry_update_pointer[ENTRY_NUM-1:0];
else
  lbuf_pop_inst1_retire_pointer_br_pre[ENTRY_NUM-1:0] = back_entry_update_pointer[ENTRY_NUM-1:0];
// &CombEnd; @3287
end

// &CombBeg; @3289
always @( lbuf_pop_inst2_front_br
       or front_entry_update_pointer[15:0]
       or back_entry_update_pointer[15:0])
begin
if(lbuf_pop_inst2_front_br)
  lbuf_pop_inst2_retire_pointer_br_pre[ENTRY_NUM-1:0] = front_entry_update_pointer[ENTRY_NUM-1:0];
else
  lbuf_pop_inst2_retire_pointer_br_pre[ENTRY_NUM-1:0] = back_entry_update_pointer[ENTRY_NUM-1:0];
// &CombEnd; @3294
end

// &CombBeg; @3296
always @( lbuf_pop_inst0_valid
       or lbuf_pop_inst1_valid
       or lbuf_pop_inst2_retire_pointer_br_pre[15:0]
       or lbuf_pop_inst0_retire_pointer_br_pre[15:0]
       or lbuf_pop_inst1_retire_pointer_br_pre[15:0]
       or lbuf_pop_inst0_br
       or inst0_bht_result
       or inst1_bht_result
       or lbuf_pop_inst1_br)
begin
if(lbuf_pop_inst0_br && lbuf_pop_inst0_valid && inst0_bht_result)
  lbuf_retire_pointer_branch_pre[ENTRY_NUM-1:0] = lbuf_pop_inst0_retire_pointer_br_pre[ENTRY_NUM-1:0];
else if(lbuf_pop_inst1_br && lbuf_pop_inst1_valid && inst1_bht_result)
  lbuf_retire_pointer_branch_pre[ENTRY_NUM-1:0] = lbuf_pop_inst1_retire_pointer_br_pre[ENTRY_NUM-1:0];
else
  lbuf_retire_pointer_branch_pre[ENTRY_NUM-1:0] = lbuf_pop_inst2_retire_pointer_br_pre[ENTRY_NUM-1:0];
// &CombEnd; @3303
end

assign lbuf_pop_branch_vld = (
                               lbuf_pop_inst0_br && 
                               inst0_bht_result && 
                               lbuf_pop_inst0_valid
                             ) || 
                             (
                               lbuf_pop_inst1_br && 
                               inst1_bht_result && 
                               lbuf_pop_inst1_valid && 
                               !lbuf_pop_inst0_br
                             ) || 
                             (
                               lbuf_pop_inst2_br && 
                               inst2_bht_result && 
                               lbuf_pop_inst2_valid && 
                               !lbuf_pop_inst0_br && 
                               !lbuf_pop_inst1_br //deal with inst0 br not jmp, inst1 br jmp
                             );

//NO Branch Way LBUF Retire Pointer Prepare
//Contain no branch and branch not jump
// &CombBeg; @3326
always @( lbuf_pop3_half_num[2:0]
       or lbuf_retire_pointer[15:0])
begin
case(lbuf_pop3_half_num[2:0])
  3'b011  : lbuf_retire_pointer_pop3_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-4:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
  3'b100  : lbuf_retire_pointer_pop3_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-5:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
  3'b101  : lbuf_retire_pointer_pop3_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-6:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};
  3'b110  : lbuf_retire_pointer_pop3_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-7:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-6]};
  default : lbuf_retire_pointer_pop3_pre[ENTRY_NUM-1:0] =  lbuf_retire_pointer[ENTRY_NUM-1:0];
endcase
// &CombEnd; @3338
end

// &CombBeg; @3340
always @( lbuf_pop2_half_num[2:0]
       or lbuf_retire_pointer[15:0])
begin
case(lbuf_pop2_half_num[2:0])
  3'b010  : lbuf_retire_pointer_pop2_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-3:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
  3'b011  : lbuf_retire_pointer_pop2_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-4:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
  3'b100  : lbuf_retire_pointer_pop2_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-5:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
  default : lbuf_retire_pointer_pop2_pre[ENTRY_NUM-1:0] =  lbuf_retire_pointer[ENTRY_NUM-1:0];
endcase
// &CombEnd; @3350
end

// &CombBeg; @3352
always @( lbuf_retire_pointer[15:0]
       or lbuf_pop1_half_num[2:0])
begin
case(lbuf_pop1_half_num[2:0])
  3'b001  : lbuf_retire_pointer_pop1_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-2:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1]};
  3'b010  : lbuf_retire_pointer_pop1_pre[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-3:0], 
                                                           lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
  default : lbuf_retire_pointer_pop1_pre[ENTRY_NUM-1:0] =  lbuf_retire_pointer[ENTRY_NUM-1:0];
endcase
// &CombEnd; @3360
end

assign lbuf_pop_inst2_br_mask_vld = lbuf_pop_inst2_valid && 
                                    !lbuf_pop_inst1_br   && 
                                    !lbuf_pop_inst0_br;
assign lbuf_pop_inst1_br_mask_vld = lbuf_pop_inst1_valid && 
                                    !lbuf_pop_inst0_br; 
assign lbuf_pop_inst0_br_mask_vld = lbuf_pop_inst0_valid;

// &CombBeg; @3369
always @( lbuf_retire_pointer_pop2_pre[15:0]
       or lbuf_pop_inst0_br_mask_vld
       or lbuf_retire_pointer[15:0]
       or lbuf_retire_pointer_pop1_pre[15:0]
       or lbuf_retire_pointer_pop3_pre[15:0]
       or lbuf_pop_inst2_br_mask_vld
       or lbuf_pop_inst1_br_mask_vld)
begin
if(lbuf_pop_inst2_br_mask_vld)
  lbuf_retire_pointer_pre[ENTRY_NUM-1:0] = lbuf_retire_pointer_pop3_pre[ENTRY_NUM-1:0];
else if(lbuf_pop_inst1_br_mask_vld)
  lbuf_retire_pointer_pre[ENTRY_NUM-1:0] = lbuf_retire_pointer_pop2_pre[ENTRY_NUM-1:0];
else if(lbuf_pop_inst0_br_mask_vld)
  lbuf_retire_pointer_pre[ENTRY_NUM-1:0] = lbuf_retire_pointer_pop1_pre[ENTRY_NUM-1:0];
else
  lbuf_retire_pointer_pre[ENTRY_NUM-1:0] = lbuf_retire_pointer[ENTRY_NUM-1:0];
// &CombEnd; @3378
end

//Branch and NO_Branch Way select
//Gate Clock
// &Instance("gated_clk_cell","x_lbuf_retire_pointer_update_clk"); @3382
gated_clk_cell  x_lbuf_retire_pointer_update_clk (
  .clk_in                            (forever_cpuclk                   ),
  .clk_out                           (lbuf_retire_pointer_update_clk   ),
  .external_en                       (1'b0                             ),
  .global_en                         (cp0_yy_clk_en                    ),
  .local_en                          (lbuf_retire_pointer_update_clk_en),
  .module_en                         (cp0_ifu_icg_en                   ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               )
);

// &Connect( .clk_in         (forever_cpuclk), @3383
//           .clk_out        (lbuf_retire_pointer_update_clk),//Out Clock @3384
//           .external_en    (1'b0), @3385
//           .global_en      (cp0_yy_clk_en), @3386
//           .local_en       (lbuf_retire_pointer_update_clk_en),//Local Condition @3387
//           .module_en      (cp0_ifu_icg_en) @3388
//         ); @3389
assign lbuf_retire_pointer_update_clk_en = lbuf_flush || 
                                           lbuf_retire_vld || 
                                           fill_state_enter || 
                                           idle_cache_state_enter || 
                                           front_cache_active_state_enter;

always @(posedge lbuf_retire_pointer_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_retire_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(lbuf_flush)
    lbuf_retire_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(fill_state_enter || idle_cache_state_enter || front_cache_active_state_enter)
    lbuf_retire_pointer[ENTRY_NUM-1:0] <= {{(ENTRY_NUM-1){1'b0}}, 1'b1};
  else if(lbuf_retire_vld && lbuf_pop_branch_vld)
    lbuf_retire_pointer[ENTRY_NUM-1:0] <= lbuf_retire_pointer_branch_pre[ENTRY_NUM-1:0];
  else if(lbuf_retire_vld && !lbuf_pop_branch_vld)
    lbuf_retire_pointer[ENTRY_NUM-1:0] <= lbuf_retire_pointer_pre[ENTRY_NUM-1:0];
  else
    lbuf_retire_pointer[ENTRY_NUM-1:0] <= lbuf_retire_pointer[ENTRY_NUM-1:0];
end
//lbuf_retire_vld
//when ACTIVE state, loop buffer pop inst valid
assign lbuf_retire_vld = ibctrl_lbuf_retire_vld;

//There are most 6 Half will be wrote out from lbuf
//Thus need 6 retire pointer to point different entry 
assign lbuf_retire_pointer0[ENTRY_NUM-1:0] =  lbuf_retire_pointer[ENTRY_NUM-1:0];
assign lbuf_retire_pointer1[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-2:0],
                                              lbuf_retire_pointer[ENTRY_NUM-1]};
assign lbuf_retire_pointer2[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-3:0],
                                              lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-2]};
assign lbuf_retire_pointer3[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-4:0],
                                              lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-3]};
assign lbuf_retire_pointer4[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-5:0],
                                              lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-4]};
assign lbuf_retire_pointer5[ENTRY_NUM-1:0] = {lbuf_retire_pointer[ENTRY_NUM-6:0],
                                              lbuf_retire_pointer[ENTRY_NUM-1:ENTRY_NUM-5]};

//==========================================================
//            LBUF POP Data trans into inst
//==========================================================
//Prepare Inst Start and Inst 32 Information
assign pop_h0_br       = pop_h0_front_br || 
                         pop_h0_back_br; 
assign pop_h1_br       = pop_h1_front_br || 
                         pop_h1_back_br; 
assign pop_h2_br       = pop_h2_front_br || 
                         pop_h2_back_br; 
assign pop_h3_br       = pop_h3_front_br || 
                         pop_h3_back_br; 
assign pop_h4_br       = pop_h4_front_br || 
                         pop_h4_back_br; 

//6 Half Word into 3 Inst
// &CombBeg; @3445
always @( lbuf_pc_add_1[14:0]
       or lbuf_pc_add_3[14:0]
       or pop_h0_back_br
       or pop_h1_vsew[2:0]
       or lbuf_pc_add_4[14:0]
       or pop_h2_fence
       or pop_h4_vsetvli
       or pop_h0_bkptb
       or pop_h1_bkptb
       or pop_h1_split1_type[2:0]
       or pop_h1_32_start
       or pop_h4_vld
       or pop_h4_bkpta
       or pop_h2_vld
       or pop_h4_vlmul[1:0]
       or pop_h1_vlmul[1:0]
       or pop_h2_back_br
       or pop_h0_br
       or pop_h4_vl[7:0]
       or pop_h1_vl[7:0]
       or pop_h0_vlmul[1:0]
       or pop_h0_bkpta
       or pop_h4_data[15:0]
       or pop_h3_br
       or pop_h2_bkptb
       or pop_h1_vld
       or pop_h0_32_start
       or pop_h3_32_start
       or pop_h0_vsew[2:0]
       or pop_h3_back_br
       or pop_h2_split1_type[2:0]
       or lbuf_pc_add_2[14:0]
       or pop_h3_split0_type[2:0]
       or pop_h2_vl[7:0]
       or pop_h1_front_br
       or pop_h2_br
       or pop_h2_bkpta
       or pop_h3_vld
       or pop_h4_32_start
       or pop_h1_br
       or pop_h0_data[15:0]
       or pop_h4_front_br
       or pop_h0_vsetvli
       or pop_h2_vsetvli
       or pop_h3_front_br
       or pop_h2_split0_type[2:0]
       or pop_h0_front_br
       or pop_h1_vsetvli
       or pop_h2_vsew[2:0]
       or pop_h4_bkptb
       or pop_h0_fence
       or pop_h0_vl[7:0]
       or pop_h4_split0_type[2:0]
       or pop_h0_split0_type[2:0]
       or pop_h3_bkpta
       or pop_h2_front_br
       or pop_h4_fence
       or pop_h3_bkptb
       or pop_h1_back_br
       or pop_h2_vlmul[1:0]
       or pop_h3_vl[7:0]
       or pop_h3_vsew[2:0]
       or pop_h4_br
       or pop_h0_vld
       or pop_h5_data[15:0]
       or lbuf_cur_pc[14:0]
       or pop_h3_data[15:0]
       or pop_h3_fence
       or pop_h2_data[15:0]
       or pop_h1_fence
       or pop_h4_back_br
       or pop_h4_split1_type[2:0]
       or pop_h1_data[15:0]
       or pop_h3_split1_type[2:0]
       or pop_h3_vsetvli
       or pop_h2_32_start
       or pop_h1_bkpta
       or pop_h4_vsew[2:0]
       or pop_h1_split0_type[2:0]
       or pop_h3_vlmul[1:0]
       or pop_h0_split1_type[2:0])
begin
casez({pop_h0_32_start,pop_h1_32_start,pop_h2_32_start,
       pop_h3_32_start,pop_h4_32_start})
       5'b000?? : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {16'b0,pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h1_vld;
                  lbuf_pop_inst1_data[31:0]       = {16'b0,pop_h1_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h1_br;
                  lbuf_pop_inst2_valid            = pop_h2_vld;
                  lbuf_pop_inst2_data[31:0]       = {16'b0,pop_h2_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h2_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h1_front_br;
                  lbuf_pop_inst1_back_br          = pop_h1_back_br;
                  lbuf_pop_inst2_front_br         = pop_h2_front_br;
                  lbuf_pop_inst2_back_br          = pop_h2_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b011;
                  lbuf_pop2_half_num[2:0]         = 3'b010;
                  lbuf_pop1_half_num[2:0]         = 3'b001;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h1_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h2_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h1_fence;
                  lbuf_pop_inst1_bkpta            = pop_h1_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h1_bkptb;
                  lbuf_pop_inst2_fence            = pop_h2_fence;
                  lbuf_pop_inst2_bkpta            = pop_h2_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h2_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h1_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h1_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h1_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h2_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h2_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h2_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h1_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h1_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h2_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h2_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_1[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_2[14:0];
                  end
       5'b001?? : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {16'b0,pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h1_vld;
                  lbuf_pop_inst1_data[31:0]       = {16'b0,pop_h1_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h1_br;
                  lbuf_pop_inst2_valid            = pop_h2_vld;
                  lbuf_pop_inst2_data[31:0]       = {pop_h3_data[15:0],pop_h2_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h2_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h1_front_br;
                  lbuf_pop_inst1_back_br          = pop_h1_back_br;
                  lbuf_pop_inst2_front_br         = pop_h2_front_br;
                  lbuf_pop_inst2_back_br          = pop_h2_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b100;
                  lbuf_pop2_half_num[2:0]         = 3'b010;
                  lbuf_pop1_half_num[2:0]         = 3'b001;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h1_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h2_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h1_fence;
                  lbuf_pop_inst1_bkpta            = pop_h1_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h1_bkptb;
                  lbuf_pop_inst2_fence            = pop_h2_fence;
                  lbuf_pop_inst2_bkpta            = pop_h2_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h2_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h1_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h1_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h1_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h2_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h2_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h2_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h1_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h1_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h2_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h2_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_1[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_2[14:0];
                  end
       5'b01?0? : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {16'b0,pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h1_vld;
                  lbuf_pop_inst1_data[31:0]       = {pop_h2_data[15:0],pop_h1_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h1_br;
                  lbuf_pop_inst2_valid            = pop_h3_vld;
                  lbuf_pop_inst2_data[31:0]       = {16'b0,pop_h3_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h3_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h1_front_br;
                  lbuf_pop_inst1_back_br          = pop_h1_back_br;
                  lbuf_pop_inst2_front_br         = pop_h3_front_br;
                  lbuf_pop_inst2_back_br          = pop_h3_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b100;
                  lbuf_pop2_half_num[2:0]         = 3'b011;
                  lbuf_pop1_half_num[2:0]         = 3'b001;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h1_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h3_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h1_fence;
                  lbuf_pop_inst1_bkpta            = pop_h1_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h1_bkptb;
                  lbuf_pop_inst2_fence            = pop_h3_fence;
                  lbuf_pop_inst2_bkpta            = pop_h3_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h3_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h1_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h1_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h1_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h3_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h3_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h3_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h1_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h1_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h3_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h3_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_1[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_3[14:0];
                  end
       5'b01?1? : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {16'b0,pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h1_vld;
                  lbuf_pop_inst1_data[31:0]       = {pop_h2_data[15:0],pop_h1_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h1_br;
                  lbuf_pop_inst2_valid            = pop_h3_vld;
                  lbuf_pop_inst2_data[31:0]       = {pop_h4_data[15:0],pop_h3_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h3_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h1_front_br;
                  lbuf_pop_inst1_back_br          = pop_h1_back_br;
                  lbuf_pop_inst2_front_br         = pop_h3_front_br;
                  lbuf_pop_inst2_back_br          = pop_h3_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b101;
                  lbuf_pop2_half_num[2:0]         = 3'b011;
                  lbuf_pop1_half_num[2:0]         = 3'b001;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h1_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h3_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h1_fence;
                  lbuf_pop_inst1_bkpta            = pop_h1_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h1_bkptb;
                  lbuf_pop_inst2_fence            = pop_h3_fence;
                  lbuf_pop_inst2_bkpta            = pop_h3_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h3_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h1_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h1_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h1_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h3_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h3_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h3_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h1_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h1_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h3_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h3_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_1[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_3[14:0];
                  end
       5'b1?00? : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h2_vld;
                  lbuf_pop_inst1_data[31:0]       = {16'b0,pop_h2_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h2_br;
                  lbuf_pop_inst2_valid            = pop_h3_vld;
                  lbuf_pop_inst2_data[31:0]       = {16'b0,pop_h3_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h3_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h2_front_br;
                  lbuf_pop_inst1_back_br          = pop_h2_back_br;
                  lbuf_pop_inst2_front_br         = pop_h3_front_br;
                  lbuf_pop_inst2_back_br          = pop_h3_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b100;
                  lbuf_pop2_half_num[2:0]         = 3'b011;
                  lbuf_pop1_half_num[2:0]         = 3'b010;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h2_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h3_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h2_fence;
                  lbuf_pop_inst1_bkpta            = pop_h2_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h2_bkptb;
                  lbuf_pop_inst2_fence            = pop_h3_fence;
                  lbuf_pop_inst2_bkpta            = pop_h3_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h3_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h2_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h2_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h2_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h3_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h3_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h3_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h2_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h2_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h3_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h3_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_2[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_3[14:0];
                  end
       5'b1?01? : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h2_vld;
                  lbuf_pop_inst1_data[31:0]       = {16'b0,pop_h2_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h2_br;
                  lbuf_pop_inst2_valid            = pop_h3_vld;
                  lbuf_pop_inst2_data[31:0]       = {pop_h4_data[15:0],pop_h3_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h3_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h2_front_br;
                  lbuf_pop_inst1_back_br          = pop_h2_back_br;
                  lbuf_pop_inst2_front_br         = pop_h3_front_br;
                  lbuf_pop_inst2_back_br          = pop_h3_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b101;
                  lbuf_pop2_half_num[2:0]         = 3'b011;
                  lbuf_pop1_half_num[2:0]         = 3'b010;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h2_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h3_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h2_fence;
                  lbuf_pop_inst1_bkpta            = pop_h2_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h2_bkptb;
                  lbuf_pop_inst2_fence            = pop_h3_fence;
                  lbuf_pop_inst2_bkpta            = pop_h3_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h3_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h2_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h2_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h2_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h3_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h3_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h3_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h2_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h2_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h3_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h3_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_2[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_3[14:0];
                  end
       5'b1?1?0 : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h2_vld;
                  lbuf_pop_inst1_data[31:0]       = {pop_h3_data[15:0],pop_h2_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h2_br;
                  lbuf_pop_inst2_valid            = pop_h4_vld;
                  lbuf_pop_inst2_data[31:0]       = {16'b0,pop_h4_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h4_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h2_front_br;
                  lbuf_pop_inst1_back_br          = pop_h2_back_br;
                  lbuf_pop_inst2_front_br         = pop_h4_front_br;
                  lbuf_pop_inst2_back_br          = pop_h4_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b101;
                  lbuf_pop2_half_num[2:0]         = 3'b100;
                  lbuf_pop1_half_num[2:0]         = 3'b010;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h2_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h4_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h2_fence;
                  lbuf_pop_inst1_bkpta            = pop_h2_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h2_bkptb;
                  lbuf_pop_inst2_fence            = pop_h4_fence;
                  lbuf_pop_inst2_bkpta            = pop_h4_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h4_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h2_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h2_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h2_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h4_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h4_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h4_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h2_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h2_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h4_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h4_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_2[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_4[14:0];
                  end
       5'b1?1?1 : begin
                  lbuf_pop_inst0_valid            = pop_h0_vld;
                  lbuf_pop_inst0_data[31:0]       = {pop_h1_data[15:0],pop_h0_data[15:0]};
                  lbuf_pop_inst0_br               = pop_h0_br;
                  lbuf_pop_inst1_valid            = pop_h2_vld;
                  lbuf_pop_inst1_data[31:0]       = {pop_h3_data[15:0],pop_h2_data[15:0]};
                  lbuf_pop_inst1_br               = pop_h2_br;
                  lbuf_pop_inst2_valid            = pop_h4_vld;
                  lbuf_pop_inst2_data[31:0]       = {pop_h5_data[15:0],pop_h4_data[15:0]};
                  lbuf_pop_inst2_br               = pop_h4_br;
                  lbuf_pop_inst0_front_br         = pop_h0_front_br;
                  lbuf_pop_inst0_back_br          = pop_h0_back_br;
                  lbuf_pop_inst1_front_br         = pop_h2_front_br;
                  lbuf_pop_inst1_back_br          = pop_h2_back_br;
                  lbuf_pop_inst2_front_br         = pop_h4_front_br;
                  lbuf_pop_inst2_back_br          = pop_h4_back_br;
                  lbuf_pop3_half_num[2:0]         = 3'b110;
                  lbuf_pop2_half_num[2:0]         = 3'b100;
                  lbuf_pop1_half_num[2:0]         = 3'b010;
                  lbuf_pop_inst0_vsetvli          = pop_h0_vsetvli;
                  lbuf_pop_inst1_vsetvli          = pop_h2_vsetvli;
                  lbuf_pop_inst2_vsetvli          = pop_h4_vsetvli;
                  lbuf_pop_inst0_fence            = pop_h0_fence;
                  lbuf_pop_inst0_bkpta            = pop_h0_bkpta;
                  lbuf_pop_inst0_bkptb            = pop_h0_bkptb;
                  lbuf_pop_inst1_fence            = pop_h2_fence;
                  lbuf_pop_inst1_bkpta            = pop_h2_bkpta;
                  lbuf_pop_inst1_bkptb            = pop_h2_bkptb;
                  lbuf_pop_inst2_fence            = pop_h4_fence;
                  lbuf_pop_inst2_bkpta            = pop_h4_bkpta;
                  lbuf_pop_inst2_bkptb            = pop_h4_bkptb;
                  lbuf_pop_inst0_vlmul_pre[1:0]   = pop_h0_vlmul[1:0];
                  lbuf_pop_inst0_vsew_pre[2:0]    = pop_h0_vsew[2:0];
                  lbuf_pop_inst0_vl_pre[7:0]      = pop_h0_vl[7:0];
                  lbuf_pop_inst1_vlmul_pre[1:0]   = pop_h2_vlmul[1:0];
                  lbuf_pop_inst1_vsew_pre[2:0]    = pop_h2_vsew[2:0];
                  lbuf_pop_inst1_vl_pre[7:0]      = pop_h2_vl[7:0];
                  lbuf_pop_inst2_vlmul_pre[1:0]   = pop_h4_vlmul[1:0];
                  lbuf_pop_inst2_vsew_pre[2:0]    = pop_h4_vsew[2:0];
                  lbuf_pop_inst2_vl_pre[7:0]      = pop_h4_vl[7:0];
                  lbuf_pop_inst0_split0_type[2:0] = pop_h0_split0_type[2:0];
                  lbuf_pop_inst0_split1_type[2:0] = pop_h0_split1_type[2:0];
                  lbuf_pop_inst1_split0_type[2:0] = pop_h2_split0_type[2:0];
                  lbuf_pop_inst1_split1_type[2:0] = pop_h2_split1_type[2:0];
                  lbuf_pop_inst2_split0_type[2:0] = pop_h4_split0_type[2:0];
                  lbuf_pop_inst2_split1_type[2:0] = pop_h4_split1_type[2:0];
                  lbuf_pop_inst0_pc[14:0]         = lbuf_cur_pc[14:0];
                  lbuf_pop_inst1_pc[14:0]         = lbuf_pc_add_2[14:0];
                  lbuf_pop_inst2_pc[14:0]         = lbuf_pc_add_4[14:0];
                  end
       default  : begin
                  lbuf_pop_inst0_valid            =  1'b0;
                  lbuf_pop_inst0_data[31:0]       = 32'b0;
                  lbuf_pop_inst0_br               =  1'b0;
                  lbuf_pop_inst1_valid            =  1'b0; 
                  lbuf_pop_inst1_data[31:0]       = 32'b0; 
                  lbuf_pop_inst1_br               =  1'b0;
                  lbuf_pop_inst2_valid            =  1'b0; 
                  lbuf_pop_inst2_data[31:0]       = 32'b0; 
                  lbuf_pop_inst2_br               =  1'b0;
                  lbuf_pop3_half_num[2:0]         =  3'b0; 
                  lbuf_pop2_half_num[2:0]         =  3'b0; 
                  lbuf_pop1_half_num[2:0]         =  3'b0; 
                  lbuf_pop_inst0_front_br         =  1'b0; 
                  lbuf_pop_inst0_back_br          =  1'b0; 
                  lbuf_pop_inst1_front_br         =  1'b0; 
                  lbuf_pop_inst1_back_br          =  1'b0; 
                  lbuf_pop_inst2_front_br         =  1'b0; 
                  lbuf_pop_inst2_back_br          =  1'b0; 
                  lbuf_pop_inst0_vsetvli          =  1'b0;
                  lbuf_pop_inst1_vsetvli          =  1'b0;
                  lbuf_pop_inst2_vsetvli          =  1'b0;
                  lbuf_pop_inst0_fence            =  1'b0;
                  lbuf_pop_inst0_bkpta            =  1'b0;
                  lbuf_pop_inst0_bkptb            =  1'b0;
                  lbuf_pop_inst1_fence            =  1'b0;
                  lbuf_pop_inst1_bkpta            =  1'b0;
                  lbuf_pop_inst1_bkptb            =  1'b0;
                  lbuf_pop_inst2_fence            =  1'b0;
                  lbuf_pop_inst2_bkpta            =  1'b0;
                  lbuf_pop_inst2_bkptb            =  1'b0;
                  lbuf_pop_inst0_vlmul_pre[1:0]   =  2'b0; 
                  lbuf_pop_inst0_vsew_pre[2:0]    =  3'b0;
                  lbuf_pop_inst0_vl_pre[7:0]      =  8'b0;
                  lbuf_pop_inst1_vlmul_pre[1:0]   =  2'b0;
                  lbuf_pop_inst1_vsew_pre[2:0]    =  3'b0;
                  lbuf_pop_inst2_vlmul_pre[1:0]   =  2'b0;
                  lbuf_pop_inst1_vl_pre[7:0]      =  8'b0;
                  lbuf_pop_inst2_vsew_pre[2:0]    =  3'b0;
                  lbuf_pop_inst2_vl_pre[7:0]      =  8'b0;
                  lbuf_pop_inst0_split0_type[2:0] =  3'b0;
                  lbuf_pop_inst0_split1_type[2:0] =  3'b0;
                  lbuf_pop_inst1_split0_type[2:0] =  3'b0;
                  lbuf_pop_inst1_split1_type[2:0] =  3'b0;
                  lbuf_pop_inst2_split0_type[2:0] =  3'b0;
                  lbuf_pop_inst2_split1_type[2:0] =  3'b0;
                  lbuf_pop_inst0_pc[14:0]         =  15'b0;
                  lbuf_pop_inst1_pc[14:0]         =  15'b0;
                  lbuf_pop_inst2_pc[14:0]         =  15'b0;
                  end
endcase
// &CombEnd; @3899
end

//==========================================================
//               PC Related Information
//==========================================================
//No Branch PC prepare
//Branch PC prepare

//Branch Way LBUF Retire Pointer Prepare
// &CombBeg; @3908
always @( back_entry_target_pc[38:0]
       or lbuf_pop_inst0_front_br
       or front_entry_target_pc[38:0])
begin
if(lbuf_pop_inst0_front_br)
  lbuf_pop_inst0_pc_br_pre[PC_WIDTH-2:0] = front_entry_target_pc[PC_WIDTH-2:0];
else
  lbuf_pop_inst0_pc_br_pre[PC_WIDTH-2:0] = back_entry_target_pc[PC_WIDTH-2:0];
// &CombEnd; @3913
end

// &CombBeg; @3915
always @( back_entry_target_pc[38:0]
       or lbuf_pop_inst1_front_br
       or front_entry_target_pc[38:0])
begin
if(lbuf_pop_inst1_front_br)
  lbuf_pop_inst1_pc_br_pre[PC_WIDTH-2:0] = front_entry_target_pc[PC_WIDTH-2:0];
else
  lbuf_pop_inst1_pc_br_pre[PC_WIDTH-2:0] = back_entry_target_pc[PC_WIDTH-2:0];
// &CombEnd; @3920
end

// &CombBeg; @3922
always @( lbuf_pop_inst2_front_br
       or back_entry_target_pc[38:0]
       or front_entry_target_pc[38:0])
begin
if(lbuf_pop_inst2_front_br)
  lbuf_pop_inst2_pc_br_pre[PC_WIDTH-2:0] = front_entry_target_pc[PC_WIDTH-2:0];
else
  lbuf_pop_inst2_pc_br_pre[PC_WIDTH-2:0] = back_entry_target_pc[PC_WIDTH-2:0];
// &CombEnd; @3927
end

// &CombBeg; @3929
always @( lbuf_pop_inst0_valid
       or lbuf_pop_inst1_valid
       or lbuf_pop_inst2_pc_br_pre[38:0]
       or lbuf_pop_inst1_pc_br_pre[38:0]
       or lbuf_pop_inst0_br
       or lbuf_pop_inst0_pc_br_pre[38:0]
       or inst0_bht_result
       or inst1_bht_result
       or lbuf_pop_inst1_br)
begin
if(lbuf_pop_inst0_br && lbuf_pop_inst0_valid && inst0_bht_result)
  lbuf_cur_pc_branch_pre[PC_WIDTH-2:0] = lbuf_pop_inst0_pc_br_pre[PC_WIDTH-2:0];
else if(lbuf_pop_inst1_br && lbuf_pop_inst1_valid && inst1_bht_result)
  lbuf_cur_pc_branch_pre[PC_WIDTH-2:0] = lbuf_pop_inst1_pc_br_pre[PC_WIDTH-2:0];
else
  lbuf_cur_pc_branch_pre[PC_WIDTH-2:0] = lbuf_pop_inst2_pc_br_pre[PC_WIDTH-2:0];
// &CombEnd; @3936
end

//NO Branch Way LBUF Retire Pointer Prepare
//Contain no branch and branch not jump
// &CombBeg; @3940
always @( lbuf_pop3_half_num[2:0]
       or lbuf_pc_add_4[38:0]
       or lbuf_cur_pc[38:0]
       or lbuf_pc_add_6[38:0]
       or lbuf_pc_add_3[38:0]
       or lbuf_pc_add_5[38:0])
begin
case(lbuf_pop3_half_num[2:0])
  3'b011   : lbuf_pc_pop3_pre[PC_WIDTH-2:0] = lbuf_pc_add_3[PC_WIDTH-2:0]; 
  3'b100   : lbuf_pc_pop3_pre[PC_WIDTH-2:0] = lbuf_pc_add_4[PC_WIDTH-2:0]; 
  3'b101   : lbuf_pc_pop3_pre[PC_WIDTH-2:0] = lbuf_pc_add_5[PC_WIDTH-2:0]; 
  3'b110   : lbuf_pc_pop3_pre[PC_WIDTH-2:0] = lbuf_pc_add_6[PC_WIDTH-2:0]; 
  default  : lbuf_pc_pop3_pre[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0];
endcase
// &CombEnd; @3948
end

// &CombBeg; @3950
always @( lbuf_pc_add_4[38:0]
       or lbuf_cur_pc[38:0]
       or lbuf_pc_add_2[38:0]
       or lbuf_pop2_half_num[2:0]
       or lbuf_pc_add_3[38:0])
begin
case(lbuf_pop2_half_num[2:0])
  3'b010   : lbuf_pc_pop2_pre[PC_WIDTH-2:0] = lbuf_pc_add_2[PC_WIDTH-2:0];  
  3'b011   : lbuf_pc_pop2_pre[PC_WIDTH-2:0] = lbuf_pc_add_3[PC_WIDTH-2:0];
  3'b100   : lbuf_pc_pop2_pre[PC_WIDTH-2:0] = lbuf_pc_add_4[PC_WIDTH-2:0];
  default  : lbuf_pc_pop2_pre[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0];
endcase
// &CombEnd; @3957
end

// &CombBeg; @3959
always @( lbuf_cur_pc[38:0]
       or lbuf_pc_add_2[38:0]
       or lbuf_pc_add_1[38:0]
       or lbuf_pop1_half_num[2:0])
begin
case(lbuf_pop1_half_num[2:0])
  3'b001   : lbuf_pc_pop1_pre[PC_WIDTH-2:0] = lbuf_pc_add_1[PC_WIDTH-2:0]; 
  3'b010   : lbuf_pc_pop1_pre[PC_WIDTH-2:0] = lbuf_pc_add_2[PC_WIDTH-2:0]; 
  default  : lbuf_pc_pop1_pre[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0];
endcase
// &CombEnd; @3965
end

// &CombBeg; @3967
always @( lbuf_pc_pop1_pre[38:0]
       or lbuf_pc_pop3_pre[38:0]
       or lbuf_cur_pc[38:0]
       or lbuf_pop_inst0_br_mask_vld
       or lbuf_pc_pop2_pre[38:0]
       or lbuf_pop_inst1_br_mask_vld
       or lbuf_pop_inst2_br_mask_vld)
begin
if(lbuf_pop_inst2_br_mask_vld)
  lbuf_cur_pc_pre[PC_WIDTH-2:0] = lbuf_pc_pop3_pre[PC_WIDTH-2:0];
else if(lbuf_pop_inst1_br_mask_vld)
  lbuf_cur_pc_pre[PC_WIDTH-2:0] = lbuf_pc_pop2_pre[PC_WIDTH-2:0];
else if(lbuf_pop_inst0_br_mask_vld)
  lbuf_cur_pc_pre[PC_WIDTH-2:0] = lbuf_pc_pop1_pre[PC_WIDTH-2:0];
else
  lbuf_cur_pc_pre[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0];
// &CombEnd; @3976
end

//Branch and NO_Branch Way select
//Gate Clock
// &Instance("gated_clk_cell","x_lbuf_cur_pc_update_clk"); @3980
gated_clk_cell  x_lbuf_cur_pc_update_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (lbuf_cur_pc_update_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (lbuf_cur_pc_update_clk_en),
  .module_en                 (cp0_ifu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect( .clk_in         (forever_cpuclk), @3981
//           .clk_out        (lbuf_cur_pc_update_clk),//Out Clock @3982
//           .external_en    (1'b0), @3983
//           .global_en      (cp0_yy_clk_en), @3984
//           .local_en       (lbuf_cur_pc_update_clk_en),//Local Condition @3985
//           .module_en      (cp0_ifu_icg_en) @3986
//         ); @3987
assign lbuf_cur_pc_update_clk_en = lbuf_flush || 
                                   lbuf_retire_vld || 
                                   fill_state_enter || 
                                   active_state_enter;

always @(posedge lbuf_cur_pc_update_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_cur_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(lbuf_flush)
    lbuf_cur_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(fill_state_enter)
    lbuf_cur_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(active_state_enter)
    lbuf_cur_pc[PC_WIDTH-2:0] <= loop_start_pc[PC_WIDTH-2:0];
  else if(lbuf_retire_vld && lbuf_pop_branch_vld)
    lbuf_cur_pc[PC_WIDTH-2:0] <= lbuf_cur_pc_branch_pre[PC_WIDTH-2:0];
  else if(lbuf_retire_vld && !lbuf_pop_branch_vld)
    lbuf_cur_pc[PC_WIDTH-2:0] <= lbuf_cur_pc_pre[PC_WIDTH-2:0];
  else
    lbuf_cur_pc[PC_WIDTH-2:0] <= lbuf_cur_pc[PC_WIDTH-2:0];
end

//from CACHE state turn to ACTIVE state
assign active_state_enter = ((lbuf_cur_state[5:0] == CACHE) || (lbuf_cur_state[5:0] == FRONT_CACHE)) && 
                            ibuf_empty;
//loop start pc is the value which will be updated into back br target pc
//active_state_enter when fill state & back br hit loop end
assign loop_start_pc[PC_WIDTH-2:0] = back_update_target_pc[PC_WIDTH-2:0];

//lbuf_cur_pc add 1/2/3/4/5/6
assign lbuf_pc_add_1[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0] + 38'd1;
assign lbuf_pc_add_2[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0] + 38'd2;
assign lbuf_pc_add_3[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0] + 38'd3;
assign lbuf_pc_add_4[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0] + 38'd4;
assign lbuf_pc_add_5[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0] + 38'd5;
assign lbuf_pc_add_6[PC_WIDTH-2:0] = lbuf_cur_pc[PC_WIDTH-2:0] + 38'd6;

//==========================================================
//            Loop Buffer BHT Inter Active
//==========================================================
// &Force("bus","iu_ifu_cur_pc",38,0); @4029
//Loop Buffer need BHT result :
//1.Fill state, record sel array information 
//  and maintain sel array result by loop buffer self
//2.Pre Array result read from BHT directly

//Information from BHT
assign pre_taken_result[31:0]  = bht_lbuf_pre_taken_result[31:0]; 
assign pre_ntaken_result[31:0] = bht_lbuf_pre_ntaken_result[31:0];
assign vghr[13:0]              = bht_lbuf_vghr[13:0];
//need ip stage flop sel_array_result to ib stage loop buffer
assign sel_array_result[1:0]   = ibdp_lbuf_bht_sel_array_result[1:0];

//---------------------Front_br----------------------------
//Select Array Get from taken array and not taken array
assign front_pre_array_result[31:0]  = (front_br_sel_array_result[1])
                                     ? pre_taken_result[31:0] 
                                     : pre_ntaken_result[31:0];

//Get front_br final BHT result                               
// &CombBeg; @4049
always @( front_pre_array_result[31:26]
       or front_pre_array_result[1:0]
       or front_pre_array_result[13:8]
       or front_pre_array_result[21:18]
       or front_entry_cur_pc[6:3]
       or front_pre_array_result[7:2]
       or front_pre_array_result[25:22]
       or vghr[3:0]
       or front_pre_array_result[17:14])
begin
case(front_entry_cur_pc[6:3] ^ vghr[3:0])
  4'b0000 : front_br_bht_pre_result[1:0] = front_pre_array_result[ 1: 0];
  4'b0001 : front_br_bht_pre_result[1:0] = front_pre_array_result[ 3: 2];
  4'b0010 : front_br_bht_pre_result[1:0] = front_pre_array_result[ 5: 4];
  4'b0011 : front_br_bht_pre_result[1:0] = front_pre_array_result[ 7: 6];
  4'b0100 : front_br_bht_pre_result[1:0] = front_pre_array_result[ 9: 8];
  4'b0101 : front_br_bht_pre_result[1:0] = front_pre_array_result[11:10];
  4'b0110 : front_br_bht_pre_result[1:0] = front_pre_array_result[13:12];
  4'b0111 : front_br_bht_pre_result[1:0] = front_pre_array_result[15:14];
  4'b1000 : front_br_bht_pre_result[1:0] = front_pre_array_result[17:16];
  4'b1001 : front_br_bht_pre_result[1:0] = front_pre_array_result[19:18];
  4'b1010 : front_br_bht_pre_result[1:0] = front_pre_array_result[21:20];
  4'b1011 : front_br_bht_pre_result[1:0] = front_pre_array_result[23:22];
  4'b1100 : front_br_bht_pre_result[1:0] = front_pre_array_result[25:24];
  4'b1101 : front_br_bht_pre_result[1:0] = front_pre_array_result[27:26];
  4'b1110 : front_br_bht_pre_result[1:0] = front_pre_array_result[29:28];
  4'b1111 : front_br_bht_pre_result[1:0] = front_pre_array_result[31:30];
  default : front_br_bht_pre_result[1:0] = 2'b0;
endcase
// &CombEnd; @4069
end
assign front_br_bht_result = front_br_bht_pre_result[1];

//Front Br maintain Select Array Value by itself
//And not use BHT Select Array result 
//Because for sequence con_br, read Select Array can not meet timing requie
always @(posedge front_br_sel_array_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    front_br_sel_array_result[1:0] <= 2'b00;
  else if(lbuf_flush)
    front_br_sel_array_result[1:0] <= 2'b00;
  else if(fill_state_enter)
    front_br_sel_array_result[1:0] <= 2'b00;
  else if(front_br_sel_array_record)//fill state & front_br
    front_br_sel_array_result[1:0] <= sel_array_result[1:0];
  else if(front_br_sel_array_update)//after fill
    front_br_sel_array_result[1:0] <= front_br_sel_array_result_pre[1:0];
  else
    front_br_sel_array_result[1:0] <= front_br_sel_array_result[1:0];
end

//Gate Clk
// &Instance("gated_clk_cell","x_front_br_sel_array_clk"); @4092
gated_clk_cell  x_front_br_sel_array_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (front_br_sel_array_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (front_br_sel_array_clk_en),
  .module_en                 (cp0_ifu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect( .clk_in         (forever_cpuclk), @4093
//           .clk_out        (front_br_sel_array_clk),//Out Clock @4094
//           .external_en    (1'b0), @4095
//           .global_en      (cp0_yy_clk_en), @4096
//           .local_en       (front_br_sel_array_clk_en),//Local Condition @4097
//           .module_en      (cp0_ifu_icg_en) @4098
//         ); @4099
assign front_br_sel_array_clk_en = lbuf_flush || 
                                   fill_state_enter || 
                                   front_br_sel_array_record || 
                                   front_br_sel_array_update;
  
assign front_br_sel_array_record = (lbuf_cur_state[5:0] == FILL) && 
                                   front_br_check && 
                                   lbuf_create_vld;

assign front_br_sel_array_result_pre[1:0] = (iu_ifu_bht_condbr_taken)
                                           ? front_br_sel_array_result[1:0] + 2'b01 
                                           : front_br_sel_array_result[1:0] - 2'b01;

assign front_br_sel_array_update  = iu_ifu_bht_check_vld && 
                                    (iu_ifu_cur_pc[PC_WIDTH-2:0] == front_entry_cur_pc[PC_WIDTH-2:0]) && 
                                    !( ( (front_br_sel_array_result[1:0] == 2'b00) && //saturated
                                         !iu_ifu_bht_condbr_taken
                                       ) || 
                                       ( (front_br_sel_array_result[1:0] == 2'b11) && //saturated
                                         iu_ifu_bht_condbr_taken
                                       ) || 
                                       ( (front_br_sel_array_result[1] == 1'b0) && //bi-mode logic
                                         iu_ifu_bht_condbr_taken && 
                                         !iu_ifu_chgflw_vld
                                       ) || 
                                       ( (front_br_sel_array_result[1] == 1'b1) && //bi-mode logic
                                         !iu_ifu_bht_condbr_taken && 
                                         !iu_ifu_chgflw_vld
                                       )
                                     );  

//---------------------back_br-----------------------------
//Select Array Get from taken array and not taken array
assign back_pre_array_result[31:0]  = (back_br_sel_array_result[1])
                                    ? pre_taken_result[31:0] 
                                    : pre_ntaken_result[31:0];

//Get back_br final BHT result                               
// &CombBeg; @4138
always @( back_pre_array_result[13:8]
       or back_pre_array_result[31:14]
       or ins_inv_on
       or back_pre_array_result[7:4]
       or back_pre_array_result[3:0]
       or vghr[3:0]
       or back_entry_cur_pc[6:3])
begin
case(back_entry_cur_pc[6:3] ^ vghr[3:0])
  4'b0000 : back_br_bht_pre_result[1:0] = back_pre_array_result[ 1: 0] & {2{!ins_inv_on}};
  4'b0001 : back_br_bht_pre_result[1:0] = back_pre_array_result[ 3: 2] & {2{!ins_inv_on}};
  4'b0010 : back_br_bht_pre_result[1:0] = back_pre_array_result[ 5: 4] & {2{!ins_inv_on}};
  4'b0011 : back_br_bht_pre_result[1:0] = back_pre_array_result[ 7: 6] & {2{!ins_inv_on}};
  4'b0100 : back_br_bht_pre_result[1:0] = back_pre_array_result[ 9: 8] & {2{!ins_inv_on}};
  4'b0101 : back_br_bht_pre_result[1:0] = back_pre_array_result[11:10] & {2{!ins_inv_on}};
  4'b0110 : back_br_bht_pre_result[1:0] = back_pre_array_result[13:12] & {2{!ins_inv_on}};
  4'b0111 : back_br_bht_pre_result[1:0] = back_pre_array_result[15:14] & {2{!ins_inv_on}};
  4'b1000 : back_br_bht_pre_result[1:0] = back_pre_array_result[17:16] & {2{!ins_inv_on}};
  4'b1001 : back_br_bht_pre_result[1:0] = back_pre_array_result[19:18] & {2{!ins_inv_on}};
  4'b1010 : back_br_bht_pre_result[1:0] = back_pre_array_result[21:20] & {2{!ins_inv_on}};
  4'b1011 : back_br_bht_pre_result[1:0] = back_pre_array_result[23:22] & {2{!ins_inv_on}};
  4'b1100 : back_br_bht_pre_result[1:0] = back_pre_array_result[25:24] & {2{!ins_inv_on}};
  4'b1101 : back_br_bht_pre_result[1:0] = back_pre_array_result[27:26] & {2{!ins_inv_on}};
  4'b1110 : back_br_bht_pre_result[1:0] = back_pre_array_result[29:28] & {2{!ins_inv_on}};
  4'b1111 : back_br_bht_pre_result[1:0] = back_pre_array_result[31:30] & {2{!ins_inv_on}};
  default : back_br_bht_pre_result[1:0] = 2'b0;
endcase
// &CombEnd; @4158
end
assign back_br_bht_result = back_br_bht_pre_result[1];
assign ins_inv_on         = ifctrl_lbuf_ins_inv_on;

//back br maintain Select Array Value by itself
//And not use BHT Select Array result 
//Because for sequence con_br, read Select Array can not meet timing requie
always @(posedge back_br_sel_array_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    back_br_sel_array_result[1:0] <= 2'b00;
  else if(lbuf_flush)
    back_br_sel_array_result[1:0] <= 2'b00;
  else if(fill_state_enter)
    back_br_sel_array_result[1:0] <= 2'b00;
  else if(back_br_sel_array_record)//fill state & back_br
    back_br_sel_array_result[1:0] <= sel_array_result[1:0];
  else if(back_br_sel_array_update)//after fill
    back_br_sel_array_result[1:0] <= back_br_sel_array_result_pre[1:0];
  else
    back_br_sel_array_result[1:0] <= back_br_sel_array_result[1:0];
end

//Gate Clk
// &Instance("gated_clk_cell","x_back_br_sel_array_clk"); @4182
gated_clk_cell  x_back_br_sel_array_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (back_br_sel_array_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (back_br_sel_array_clk_en),
  .module_en                (cp0_ifu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect( .clk_in         (forever_cpuclk), @4183
//           .clk_out        (back_br_sel_array_clk),//Out Clock @4184
//           .external_en    (1'b0), @4185
//           .global_en      (cp0_yy_clk_en), @4186
//           .local_en       (back_br_sel_array_clk_en),//Local Condition @4187
//           .module_en      (cp0_ifu_icg_en) @4188
//         ); @4189
assign back_br_sel_array_clk_en = lbuf_flush || 
                                  fill_state_enter || 
                                  back_br_sel_array_record || 
                                  back_br_sel_array_update;

assign back_br_sel_array_record = (lbuf_cur_state[5:0] == FILL) && 
                                  back_br_check && 
                                  lbuf_create_vld;
  
assign back_br_sel_array_result_pre[1:0] = (iu_ifu_bht_condbr_taken)
                                          ? back_br_sel_array_result[1:0] + 2'b01 
                                          : back_br_sel_array_result[1:0] - 2'b01;

assign back_br_sel_array_update  = iu_ifu_bht_check_vld && 
                                   (iu_ifu_cur_pc[PC_WIDTH-2:0] == back_entry_cur_pc[PC_WIDTH-2:0]) && 
                                   !( ( (back_br_sel_array_result[1:0] == 2'b00) && //saturated
                                        !iu_ifu_bht_condbr_taken
                                      ) || 
                                      ( (back_br_sel_array_result[1:0] == 2'b11) && //saturated
                                        iu_ifu_bht_condbr_taken
                                      ) || 
                                      ( (back_br_sel_array_result[1] == 1'b0) && //bi-mode logic
                                        iu_ifu_bht_condbr_taken && 
                                        !iu_ifu_chgflw_vld
                                      ) || 
                                      ( (back_br_sel_array_result[1] == 1'b1) && //bi-mode logic
                                        !iu_ifu_bht_condbr_taken && 
                                        !iu_ifu_chgflw_vld
                                      )
                                    );

//==========================================================
//            Generate Three Inst BHT Result
//==========================================================
// &CombBeg; @4224
always @( back_br_bht_result
       or lbuf_pop_inst0_front_br
       or front_br_bht_result)
begin
if(lbuf_pop_inst0_front_br)
  inst0_bht_result = front_br_bht_result;
else
  inst0_bht_result = back_br_bht_result;
// &CombEnd; @4229
end

// &CombBeg; @4231
always @( back_br_bht_result
       or lbuf_pop_inst1_front_br
       or front_br_bht_result)
begin
if(lbuf_pop_inst1_front_br)
  inst1_bht_result = front_br_bht_result;
else
  inst1_bht_result = back_br_bht_result;
// &CombEnd; @4236
end

// &CombBeg; @4238
always @( back_br_bht_result
       or lbuf_pop_inst2_front_br
       or front_br_bht_result)
begin
if(lbuf_pop_inst2_front_br)
  inst2_bht_result = front_br_bht_result;
else
  inst2_bht_result = back_br_bht_result;
// &CombEnd; @4243
end

//==========================================================
//                Interface to BHT
//==========================================================
assign lbuf_bht_con_br_vld    = cp0_ifu_lbuf_en && 
                                lbuf_pop_con_br_inst && 
                                lbuf_retire_vld;
assign lbuf_bht_con_br_taken  = lbuf_pop_con_br_taken;
assign lbuf_bht_active_state  = lbuf_cur_state[3];
assign lbuf_pop_con_br_inst   = lbuf_pop_inst0_con_br || 
                                lbuf_pop_inst1_con_br || 
                                lbuf_pop_inst2_con_br;
assign lbuf_pop_inst0_con_br  = lbuf_pop_inst0_br && lbuf_pop_inst0_valid;
assign lbuf_pop_inst1_con_br  = lbuf_pop_inst1_br && lbuf_pop_inst1_valid;
assign lbuf_pop_inst2_con_br  = lbuf_pop_inst2_br && lbuf_pop_inst2_valid;
assign lbuf_pop_con_br_taken  = (lbuf_pop_inst0_con_br)
                              ? inst0_bht_result
                              : (lbuf_pop_inst1_con_br)
                                ? inst1_bht_result
                                : inst2_bht_result;

//==========================================================
//                  LBUF Change Flow
//==========================================================
//Loop buffer change flow source :
//  1.FILL state enter Cache state, chgflw close icache
//  2.FRONT_FILL state fill finish, chgflw close icache
//  3.ACTIVE state loop end back br not taken
//    change flow start inst fetch
//    for timing consider, chgflw happen one cycle delay
//  4.ACTIVE state enter FRONT_FILL
//    change flow start inst fetch
//    for timing consider, chgflw happen one cycle delay
//----------------------------------------------------------
//                     CTC Record
//----------------------------------------------------------

//lbuf_ibctrl_active_idle_flush
always @(posedge lbuf_sm_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    active_ctc_record <= 1'b0;
  else if(lbuf_flush)
    active_ctc_record <= 1'b0;
  else if(lbuf_cur_state[3] && ifctrl_lbuf_inv_req)
    active_ctc_record <= 1'b1;
  else 
    active_ctc_record <= active_ctc_record;
end

//----------------------------------------------------------
//                 Change Flow Vallid
//----------------------------------------------------------
//Gate Clk
// &Instance("gated_clk_cell","x_lbuf_chgflw_clk"); @4298
gated_clk_cell  x_lbuf_chgflw_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lbuf_chgflw_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lbuf_chgflw_clk_en),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in         (forever_cpuclk), @4299
//           .clk_out        (lbuf_chgflw_clk),//Out Clock @4300
//           .external_en    (1'b0), @4301
//           .global_en      (cp0_yy_clk_en), @4302
//           .local_en       (lbuf_chgflw_clk_en),//Local Condition @4303
//           .module_en      (cp0_ifu_icg_en) @4304
//         ); @4305
assign lbuf_chgflw_clk_en = (lbuf_cur_state[5:0] == FILL) || 
                            (lbuf_cur_state[5:0] == FRONT_FILL) || 
                            (lbuf_cur_state[5:0] == ACTIVE) || 
                            (lbuf_cur_state[5:0] == IDLE) &&
                            back_br_taken &&
                            cp0_ifu_lbuf_en || 
                            lbuf_stop_fetch_chgflw_vld || 
                            active_idle_chgflw_vld || 
                            active_front_fill_chgflw_vld || 
                            iu_ifu_chgflw_vld || 
                            lbuf_flush;

always @(posedge lbuf_chgflw_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_stop_fetch_chgflw_vld <= 1'b0;
  else if(lbuf_flush || iu_ifu_chgflw_vld)
    lbuf_stop_fetch_chgflw_vld <= 1'b0;
  else
    lbuf_stop_fetch_chgflw_vld <= lbuf_stop_fetch_chgflw_vld_pre;
end

always @(posedge lbuf_chgflw_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    active_idle_chgflw_vld <= 1'b0;
  else if(lbuf_flush || iu_ifu_chgflw_vld)
    active_idle_chgflw_vld <= 1'b0;
  else
    active_idle_chgflw_vld <= active_idle_chgflw_vld_pre;
end

always @(posedge lbuf_chgflw_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    active_front_fill_chgflw_vld <= 1'b0;
  else if(lbuf_flush || iu_ifu_chgflw_vld)
    active_front_fill_chgflw_vld <= 1'b0;
  else
    active_front_fill_chgflw_vld <= active_front_fill_chgflw_vld_pre;
end

//chgflw control signal
assign active_idle_chgflw_vld_pre       = (lbuf_cur_state[5:0] == ACTIVE) && 
                                           lbuf_pop_not_taken_back_br;
assign active_front_fill_chgflw_vld_pre = (lbuf_cur_state[5:0] == ACTIVE) && 
                                           front_br_body_not_filled; 
assign lbuf_stop_fetch_chgflw_vld_pre   = (lbuf_cur_state[5:0] == FILL) && 
                                          back_br_hit_lbuf_end && 
                                          !fill_not_under_rule || 
                                          (lbuf_cur_state[5:0] == FRONT_FILL) && 
                                          back_br_hit_lbuf_end && 
                                          !front_fill_not_under_rule ||
                                          (lbuf_cur_state[5:0] == IDLE) &&
                                          cp0_ifu_lbuf_en &&
                                          back_br_hit_record_fifo_fill &&
                                          !ins_inv_on;

//----------------------------------------------------------
//                  Change Flow Infor
//----------------------------------------------------------
//Gate Clk
// &Instance("gated_clk_cell","x_lbuf_chgflw_record_clk"); @4368
gated_clk_cell  x_lbuf_chgflw_record_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (lbuf_chgflw_record_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (lbuf_chgflw_record_clk_en),
  .module_en                 (cp0_ifu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect( .clk_in         (forever_cpuclk), @4369
//           .clk_out        (lbuf_chgflw_record_clk),//Out Clock @4370
//           .external_en    (1'b0), @4371
//           .global_en      (cp0_yy_clk_en), @4372
//           .local_en       (lbuf_chgflw_record_clk_en),//Local Condition @4373
//           .module_en      (cp0_ifu_icg_en) @4374
//         ); @4375
assign lbuf_chgflw_record_clk_en = lbuf_flush || 
                                   iu_ifu_chgflw_vld || 
                                   active_front_fill_chgflw_gateclk_en || 
                                   active_idle_chgflw_gateclk_en || 
                                   lbuf_stop_fetch_chgflw_gateclk_en;

//gateclk en 
assign active_idle_chgflw_gateclk_en = (lbuf_cur_state[5:0] == ACTIVE) && 
//                                       (lbuf_retire_vld && 
                                       (!back_br_bht_result && 
                                        (lbuf_pop_inst0_back_br || 
                                         lbuf_pop_inst1_back_br || 
                                         lbuf_pop_inst2_back_br)
                                       );
assign active_front_fill_chgflw_gateclk_en = (lbuf_cur_state[5:0] == ACTIVE) && 
                                             (!front_entry_body_filled && 
                                              front_entry_vld && 
//                                              lbuf_retire_vld && 
                                              !front_br_bht_result && 
                                              (lbuf_pop_inst0_front_br || 
                                               lbuf_pop_inst1_front_br || 
                                               lbuf_pop_inst2_front_br)
                                             );
assign lbuf_stop_fetch_chgflw_gateclk_en = (lbuf_cur_state[5:0] == FILL) && 
                                            back_br_hit_lbuf_end || 
                                           (lbuf_cur_state[5:0] == FRONT_FILL) && 
                                            back_br_hit_lbuf_end ||
                                           (lbuf_cur_state[5:0] == IDLE) &&
                                            cp0_ifu_lbuf_en &&
                                            back_br_hit_record_fifo_fill &&
                                            !ins_inv_on;

//lbuf_chgflw PC
always @(posedge lbuf_chgflw_record_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    lbuf_ibctrl_chgflw_pc[PC_WIDTH-2:0] <= {PC_WIDTH-1{1'b0}};
  else if(lbuf_stop_fetch_chgflw_vld_pre)
    lbuf_ibctrl_chgflw_pc[PC_WIDTH-2:0] <= back_br_tar_pc[PC_WIDTH-2:0];
  else if(active_idle_chgflw_vld_pre)
    lbuf_ibctrl_chgflw_pc[PC_WIDTH-2:0] <= active_idle_chgflw_pc_pre[PC_WIDTH-2:0];
  else if(active_front_fill_chgflw_vld_pre)
    lbuf_ibctrl_chgflw_pc[PC_WIDTH-2:0] <= active_front_fill_chgflw_pc_pre[PC_WIDTH-2:0];
  else 
    lbuf_ibctrl_chgflw_pc[PC_WIDTH-2:0] <= lbuf_ibctrl_chgflw_pc[PC_WIDTH-2:0];
end
// &Force("output","lbuf_ibctrl_chgflw_pc"); @4422

always @(posedge lbuf_chgflw_record_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
  begin
    lbuf_ibctrl_chgflw_vlmul[1:0] <= 2'b0;
    lbuf_ibctrl_chgflw_vsew[2:0]  <= 3'b0;
    lbuf_ibctrl_chgflw_vl[7:0]    <= 8'b0;
  end
  else if(lbuf_stop_fetch_chgflw_vld_pre)
  begin
    lbuf_ibctrl_chgflw_vlmul[1:0] <= lbuf_stop_fetch_vlmul_pre[1:0];
    lbuf_ibctrl_chgflw_vsew[2:0]  <= lbuf_stop_fetch_vsew_pre[2:0];
    lbuf_ibctrl_chgflw_vl         <= lbuf_stop_fetch_vl_pre[7:0];
  end
  else if(active_idle_chgflw_vld_pre)
  begin
    lbuf_ibctrl_chgflw_vlmul[1:0] <= active_idle_vlmul_pre[1:0];
    lbuf_ibctrl_chgflw_vsew[2:0]  <= active_idle_vsew_pre[2:0];
    lbuf_ibctrl_chgflw_vl[7:0]    <= active_idle_vl_pre[7:0];
  end
  else if(active_front_fill_chgflw_vld_pre)
  begin
    lbuf_ibctrl_chgflw_vlmul[1:0] <= active_front_fill_vlmul_pre[1:0];
    lbuf_ibctrl_chgflw_vsew[2:0]  <= active_front_fill_vsew_pre[2:0];
    lbuf_ibctrl_chgflw_vl[7:0]    <= active_front_fill_vl_pre[7:0];
  end
  else 
  begin
    lbuf_ibctrl_chgflw_vlmul[1:0] <= lbuf_ibctrl_chgflw_vlmul[1:0];
    lbuf_ibctrl_chgflw_vsew[2:0]  <= lbuf_ibctrl_chgflw_vsew[2:0];
    lbuf_ibctrl_chgflw_vl[7:0]    <= lbuf_ibctrl_chgflw_vl[7:0];
  end
end
// &Force("output","lbuf_ibctrl_chgflw_vlmul"); @4457
// &Force("output","lbuf_ibctrl_chgflw_vsew"); @4458
// &Force("output","lbuf_ibctrl_chgflw_vl"); @4459

//chgflw pc prepare
assign active_idle_chgflw_pc_pre[PC_WIDTH-2:0]       = (back_entry_inst_32)
                                                     ? (back_entry_cur_pc[PC_WIDTH-2:0] + 38'd2)
                                                     : (back_entry_cur_pc[PC_WIDTH-2:0] + 38'd1);
assign active_front_fill_chgflw_pc_pre[PC_WIDTH-2:0] = (front_entry_inst_32)
                                                     ? (front_entry_cur_pc[PC_WIDTH-2:0] + 38'd2)
                                                     : (front_entry_cur_pc[PC_WIDTH-2:0] + 38'd1);

//chgflw vlmul prepare
assign active_idle_vlmul_pre[1:0]       = (lbuf_pop_inst2_valid) 
                                        ? lbuf_pop_inst2_vlmul[1:0]
                                        : (lbuf_pop_inst1_valid)
                                          ? lbuf_pop_inst1_vlmul[1:0]
                                          : lbuf_pop_inst0_vlmul[1:0];
assign active_front_fill_vlmul_pre[1:0] = (lbuf_pop_inst2_valid)
                                        ? lbuf_pop_inst2_vlmul[1:0]
                                        : (lbuf_pop_inst1_valid)
                                          ? lbuf_pop_inst1_vlmul[1:0]
                                          : lbuf_pop_inst0_vlmul[1:0];
assign lbuf_stop_fetch_vlmul_pre[1:0]   = ibdp_lbuf_con_br_vlmul[1:0];

//chgflw vsew prepare
assign active_idle_vsew_pre[2:0]        = (lbuf_pop_inst2_valid) 
                                         ? lbuf_pop_inst2_vsew[2:0]
                                         : (lbuf_pop_inst1_valid)
                                           ? lbuf_pop_inst1_vsew[2:0]
                                           : lbuf_pop_inst0_vsew[2:0];
assign active_front_fill_vsew_pre[2:0]  = (lbuf_pop_inst2_valid)
                                         ? lbuf_pop_inst2_vsew[2:0]
                                         : (lbuf_pop_inst1_valid)
                                           ? lbuf_pop_inst1_vsew[2:0]
                                           : lbuf_pop_inst0_vsew[2:0];
assign lbuf_stop_fetch_vsew_pre[2:0]    = ibdp_lbuf_con_br_vsew[2:0];

//chgflw vl prepare
assign active_idle_vl_pre[7:0]          = (lbuf_pop_inst2_valid) 
                                         ? lbuf_pop_inst2_vl[7:0]
                                         : (lbuf_pop_inst1_valid)
                                           ? lbuf_pop_inst1_vl[7:0]
                                           : lbuf_pop_inst0_vl[7:0];
assign active_front_fill_vl_pre[7:0]    = (lbuf_pop_inst2_valid)
                                         ? lbuf_pop_inst2_vl[7:0]
                                         : (lbuf_pop_inst1_valid)
                                           ? lbuf_pop_inst1_vl[7:0]
                                           : lbuf_pop_inst0_vl[7:0];
assign lbuf_stop_fetch_vl_pre[7:0]      = ibdp_lbuf_con_br_vl[7:0];



//==========================================================
//               Infor send to ibctrl
//==========================================================
assign lbuf_ibctrl_lbuf_active       = (lbuf_cur_state[3]); //ACTIVE
assign lbuf_ibctrl_stall             = lbuf_cur_state[2]   //CACHE
                                    || lbuf_cur_state[1]   //FRONT_BRANCH
                                    || lbuf_cur_state[5];  //FRONT_CACHE
assign lbuf_ibctrl_active_idle_flush = active_idle_chgflw_vld && active_ctc_record;
assign lbuf_ibctrl_chgflw_pred[1:0]  = (lbuf_stop_fetch_chgflw_vld)
                                     ? 2'b00
                                     : 2'b11;
assign lbuf_ibctrl_chgflw_vld        = cp0_ifu_lbuf_en && 
                                       (
                                         lbuf_stop_fetch_chgflw_vld || 
                                         active_idle_chgflw_vld || 
                                         active_front_fill_chgflw_vld
                                       );


//==========================================================
//               Infor send to PCFIFO_IF
//==========================================================
assign lbuf_pcfifo_if_create_select            = (lbuf_cur_state[3]); //ACTIVE
assign lbuf_pcfifo_if_inst_pc_oper             = lbuf_pop_con_br_inst && 
                                                 cp0_ifu_lbuf_en && 
                                                 lbuf_retire_vld;
assign lbuf_pcfifo_if_inst_cur_pc[PC_WIDTH-2:0]    = lbuf_pop_con_br_cur_pc[PC_WIDTH-2:0];
assign lbuf_pcfifo_if_inst_target_pc[PC_WIDTH-2:0] = {PC_WIDTH-1{1'b0}};
assign lbuf_pcfifo_if_inst_vghr[21:0]          = bht_lbuf_vghr[21:0];
assign lbuf_pcfifo_if_inst_bht_pre_result[1:0] = lbuf_pop_pre_result[1:0];
assign lbuf_pcfifo_if_inst_bht_sel_result[1:0] = lbuf_pop_sel_result[1:0];
//lbuf_pop_front_br
assign lbuf_pop_front_br = (
                             lbuf_pop_inst0_front_br && 
                             lbuf_pop_inst0_valid
                           ) || 
                           (
                             lbuf_pop_inst1_front_br && 
                             lbuf_pop_inst1_valid    && 
                             !lbuf_pop_inst0_br
                           ) || 
                           (
                             lbuf_pop_inst2_front_br && 
                             lbuf_pop_inst2_valid    && 
                             !lbuf_pop_inst0_br      && 
                             !lbuf_pop_inst1_br
                           );
assign lbuf_pop_con_br_cur_pc[PC_WIDTH-2:0] = (lbuf_pop_front_br)
                                            ? front_entry_cur_pc[PC_WIDTH-2:0] 
                                            : back_entry_cur_pc[PC_WIDTH-2:0];
assign lbuf_pop_pre_result[1:0]     = (lbuf_pop_front_br) 
                                    ? front_br_bht_pre_result[1:0]
                                    : back_br_bht_pre_result[1:0];
assign lbuf_pop_sel_result[1:0]     = (lbuf_pop_front_br)
                                    ? front_br_sel_array_result[1:0]
                                    : back_br_sel_array_result[1:0];

//==========================================================
//              Infor send to ADDRGEN
//==========================================================
assign lbuf_addrgen_cache_state  = (lbuf_cur_state[2]); //CACHE
assign lbuf_addrgen_active_state = (lbuf_cur_state[3]); //ACTIVE
assign lbuf_addrgen_chgflw_mask  = cp0_ifu_lbuf_en &&
                                   !lbuf_flush &&
                                   ((lbuf_cur_state[5:0] == IDLE) &&
                                     back_br_hit_record_fifo_fill &&
                                     !ins_inv_on ||
                                    (lbuf_cur_state[5:0] == FILL) && 
                                     back_br_hit_lbuf_end && 
                                     !fill_not_under_rule || 
                                     (lbuf_cur_state[5:0] == FRONT_FILL) && 
                                      back_br_hit_lbuf_end && 
                                     !front_fill_not_under_rule
                                   );

//==========================================================
//                Inst send to ibdp
//==========================================================
assign lbuf_pop_inst0_vlmul[1:0] = (lbuf_pop_inst0_vsetvli)
                                 ? lbuf_pop_inst0_vlmul_pre[1:0]
                                 : ipdp_lbuf_vlmul_reg[1:0];
assign lbuf_pop_inst1_vlmul[1:0] = (lbuf_pop_inst1_vsetvli)
                                 ? lbuf_pop_inst1_vlmul_pre[1:0]
                                 : lbuf_pop_inst0_vlmul[1:0];
assign lbuf_pop_inst2_vlmul[1:0] = (lbuf_pop_inst2_vsetvli)
                                 ? lbuf_pop_inst2_vlmul_pre[1:0]
                                 : lbuf_pop_inst1_vlmul[1:0];
assign lbuf_pop_inst0_vsew[2:0]  = (lbuf_pop_inst0_vsetvli)
                                 ? lbuf_pop_inst0_vsew_pre[2:0]
                                 : ipdp_lbuf_vsew_reg[2:0];
assign lbuf_pop_inst1_vsew[2:0]  = (lbuf_pop_inst1_vsetvli)
                                 ? lbuf_pop_inst1_vsew_pre[2:0]
                                 : lbuf_pop_inst0_vsew[2:0];
assign lbuf_pop_inst2_vsew[2:0]  = (lbuf_pop_inst2_vsetvli)
                                 ? lbuf_pop_inst2_vsew_pre[2:0]
                                 : lbuf_pop_inst1_vsew[2:0];
assign lbuf_pop_inst0_vl[7:0]    = (lbuf_pop_inst0_vsetvli)
                                 ? lbuf_pop_inst0_vl_pre[7:0]
                                 : ipdp_lbuf_vl_reg[7:0];
assign lbuf_pop_inst1_vl[7:0]    = (lbuf_pop_inst1_vsetvli)
                                 ? lbuf_pop_inst1_vl_pre[7:0]
                                 : lbuf_pop_inst0_vl[7:0];
assign lbuf_pop_inst2_vl[7:0]    = (lbuf_pop_inst2_vsetvli)
                                 ? lbuf_pop_inst2_vl_pre[7:0]
                                 : lbuf_pop_inst1_vl[7:0];

assign lbuf_ibdp_inst0_valid    = lbuf_pop_inst0_br_mask_vld && 
                                  cp0_ifu_lbuf_en && 
                                  lbuf_retire_vld;
assign lbuf_ibdp_inst0[31:0]    = lbuf_pop_inst0_data[31:0]; 
assign lbuf_ibdp_inst0_pc[14:0] = lbuf_pop_inst0_pc[14:0];
assign lbuf_ibdp_inst1_valid    = lbuf_pop_inst1_br_mask_vld && 
                                  cp0_ifu_lbuf_en && 
                                  lbuf_retire_vld;
assign lbuf_ibdp_inst1[31:0]    = lbuf_pop_inst1_data[31:0]; 
assign lbuf_ibdp_inst1_pc[14:0] = lbuf_pop_inst1_pc[14:0];
assign lbuf_ibdp_inst2_valid    = lbuf_pop_inst2_br_mask_vld && 
                                  cp0_ifu_lbuf_en && 
                                  lbuf_retire_vld;
assign lbuf_ibdp_inst2[31:0]    = lbuf_pop_inst2_data[31:0];
assign lbuf_ibdp_inst2_pc[14:0] = lbuf_pop_inst2_pc[14:0];


assign lbuf_ibdp_inst0_vlmul[1:0] = lbuf_pop_inst0_vlmul[1:0];
assign lbuf_ibdp_inst1_vlmul[1:0] = lbuf_pop_inst1_vlmul[1:0];
assign lbuf_ibdp_inst2_vlmul[1:0] = lbuf_pop_inst2_vlmul[1:0];

assign lbuf_ibdp_inst0_vsew[2:0] = lbuf_pop_inst0_vsew[2:0];
assign lbuf_ibdp_inst1_vsew[2:0] = lbuf_pop_inst1_vsew[2:0];
assign lbuf_ibdp_inst2_vsew[2:0] = lbuf_pop_inst2_vsew[2:0];

assign lbuf_ibdp_inst0_vl[7:0]   = lbuf_pop_inst0_vl[7:0];
assign lbuf_ibdp_inst1_vl[7:0]   = lbuf_pop_inst1_vl[7:0];
assign lbuf_ibdp_inst2_vl[7:0]   = lbuf_pop_inst2_vl[7:0];

assign lbuf_ibdp_inst0_split0 = lbuf_pop_inst0_split0_type[0]
                             || lbuf_pop_inst0_split0_type[1] && (lbuf_pop_inst0_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                             || lbuf_pop_inst0_split0_type[2] && (lbuf_pop_inst0_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign lbuf_ibdp_inst1_split0 = lbuf_pop_inst1_split0_type[0]
                             || lbuf_pop_inst1_split0_type[1] && (lbuf_pop_inst1_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                             || lbuf_pop_inst1_split0_type[2] && (lbuf_pop_inst1_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign lbuf_ibdp_inst2_split0 = lbuf_pop_inst2_split0_type[0]
                             || lbuf_pop_inst2_split0_type[1] && (lbuf_pop_inst2_vlmul[1:0] == 2'b0) && (|cp0_ifu_vl[7:0])
                             || lbuf_pop_inst2_split0_type[2] && (lbuf_pop_inst2_vlmul[1:0] == 2'b1) && (|cp0_ifu_vl[7:0]);
assign lbuf_ibdp_inst0_split1 = lbuf_pop_inst0_split1_type[0]
                             || lbuf_pop_inst0_split1_type[1] && (|lbuf_pop_inst0_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                             || lbuf_pop_inst0_split1_type[2] && (lbuf_pop_inst0_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign lbuf_ibdp_inst1_split1 = lbuf_pop_inst1_split1_type[0]
                             || lbuf_pop_inst1_split1_type[1] && (|lbuf_pop_inst1_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                             || lbuf_pop_inst1_split1_type[2] && (lbuf_pop_inst1_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign lbuf_ibdp_inst2_split1 = lbuf_pop_inst2_split1_type[0]
                             || lbuf_pop_inst2_split1_type[1] && (|lbuf_pop_inst2_vlmul[1:0]) && (|cp0_ifu_vl[7:0])
                             || lbuf_pop_inst2_split1_type[2] && (lbuf_pop_inst2_vlmul[1])    && (|cp0_ifu_vl[7:0]);
assign lbuf_ibdp_inst0_fence    = lbuf_pop_inst0_fence;
assign lbuf_ibdp_inst1_fence    = lbuf_pop_inst1_fence;
assign lbuf_ibdp_inst2_fence    = lbuf_pop_inst2_fence;
assign lbuf_ibdp_inst0_bkpta    = lbuf_pop_inst0_bkpta;
assign lbuf_ibdp_inst1_bkpta    = lbuf_pop_inst1_bkpta;
assign lbuf_ibdp_inst2_bkpta    = lbuf_pop_inst2_bkpta;
assign lbuf_ibdp_inst0_bkptb    = lbuf_pop_inst0_bkptb;
assign lbuf_ibdp_inst1_bkptb    = lbuf_pop_inst1_bkptb;
assign lbuf_ibdp_inst2_bkptb    = lbuf_pop_inst2_bkptb;

//==========================================================
//               Infor send to ipdp
//==========================================================
assign lbuf_ipdp_lbuf_active     = lbuf_cur_state[3];
assign lbuf_ipdp_vtype_updt_vld  = lbuf_retire_vld
                                && (lbuf_pop_inst0_br_mask_vld && lbuf_pop_inst0_vsetvli
                                    || lbuf_pop_inst1_br_mask_vld && lbuf_pop_inst1_vsetvli
                                    || lbuf_pop_inst2_br_mask_vld && lbuf_pop_inst2_vsetvli);
assign lbuf_ipdp_updt_vlmul[1:0] = (lbuf_pop_inst2_br_mask_vld) 
                                 ? lbuf_pop_inst2_vlmul[1:0]
                                 : (lbuf_pop_inst1_br_mask_vld)
                                   ? lbuf_pop_inst1_vlmul[1:0]
                                   : lbuf_pop_inst0_vlmul[1:0];
assign lbuf_ipdp_updt_vsew[2:0]  = (lbuf_pop_inst2_br_mask_vld) 
                                 ? lbuf_pop_inst2_vsew[2:0]
                                 : (lbuf_pop_inst1_br_mask_vld)
                                   ? lbuf_pop_inst1_vsew[2:0]
                                   : lbuf_pop_inst0_vsew[2:0];

assign lbuf_ipdp_updt_vl[7:0]    = (lbuf_pop_inst2_br_mask_vld) 
                                 ? lbuf_pop_inst2_vl[7:0]
                                 : (lbuf_pop_inst1_br_mask_vld)
                                   ? lbuf_pop_inst1_vl[7:0]
                                   : lbuf_pop_inst0_vl[7:0];

//==========================================================
//                Inst send to pcgen
//==========================================================
//lbuf_active_to_other_state_vld_mask
assign lbuf_vld_mask       = cp0_ifu_lbuf_en && 
                             (
                               (lbuf_cur_state[5:0] == ACTIVE) && 
                               (
                                 active_idle_chgflw_vld_pre || 
                                 active_front_fill_chgflw_vld_pre
                               ) || 
                               lbuf_stop_fetch_chgflw_vld_pre
                             );
assign lbuf_pcgen_vld_mask = lbuf_vld_mask;
assign lbuf_pcgen_active   = lbuf_cur_state[3];


//Debug Infor
assign lbuf_debug_st[5:0] = lbuf_cur_state[5:0];

// &ModuleEnd; @4774
endmodule


