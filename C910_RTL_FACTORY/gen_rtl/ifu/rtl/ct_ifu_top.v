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

// &Depend("cpu_cfig.h"); @22
// &ModuleBeg; @23
module ct_ifu_top(
  biu_ifu_rd_data,
  biu_ifu_rd_data_vld,
  biu_ifu_rd_grnt,
  biu_ifu_rd_id,
  biu_ifu_rd_last,
  biu_ifu_rd_resp,
  cp0_idu_cskyee,
  cp0_idu_frm,
  cp0_idu_fs,
  cp0_ifu_bht_en,
  cp0_ifu_bht_inv,
  cp0_ifu_btb_en,
  cp0_ifu_btb_inv,
  cp0_ifu_icache_en,
  cp0_ifu_icache_inv,
  cp0_ifu_icache_pref_en,
  cp0_ifu_icache_read_index,
  cp0_ifu_icache_read_req,
  cp0_ifu_icache_read_tag,
  cp0_ifu_icache_read_way,
  cp0_ifu_icg_en,
  cp0_ifu_ind_btb_en,
  cp0_ifu_ind_btb_inv,
  cp0_ifu_insde,
  cp0_ifu_iwpe,
  cp0_ifu_l0btb_en,
  cp0_ifu_lbuf_en,
  cp0_ifu_no_op_req,
  cp0_ifu_nsfe,
  cp0_ifu_ras_en,
  cp0_ifu_rst_inv_done,
  cp0_ifu_rvbr,
  cp0_ifu_vbr,
  cp0_ifu_vl,
  cp0_ifu_vlmul,
  cp0_ifu_vsetvli_pred_disable,
  cp0_ifu_vsetvli_pred_mode,
  cp0_ifu_vsew,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  had_ifu_ir,
  had_ifu_ir_vld,
  had_ifu_pc,
  had_ifu_pcload,
  had_rtu_xx_jdbreq,
  had_yy_xx_bkpta_base,
  had_yy_xx_bkpta_mask,
  had_yy_xx_bkpta_rc,
  had_yy_xx_bkptb_base,
  had_yy_xx_bkptb_mask,
  had_yy_xx_bkptb_rc,
  hpcp_ifu_cnt_en,
  idu_ifu_id_bypass_stall,
  idu_ifu_id_stall,
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
  ifu_cp0_bht_inv_done,
  ifu_cp0_btb_inv_done,
  ifu_cp0_icache_inv_done,
  ifu_cp0_icache_read_data,
  ifu_cp0_icache_read_data_vld,
  ifu_cp0_ind_btb_inv_done,
  ifu_cp0_rst_inv_req,
  ifu_had_debug_info,
  ifu_had_no_inst,
  ifu_had_no_op,
  ifu_had_reset_on,
  ifu_hpcp_btb_inst,
  ifu_hpcp_btb_mispred,
  ifu_hpcp_frontend_stall,
  ifu_hpcp_icache_access,
  ifu_hpcp_icache_miss,
  ifu_idu_ib_inst0_data,
  ifu_idu_ib_inst0_vld,
  ifu_idu_ib_inst1_data,
  ifu_idu_ib_inst1_vld,
  ifu_idu_ib_inst2_data,
  ifu_idu_ib_inst2_vld,
  ifu_idu_ib_pipedown_gateclk,
  ifu_iu_pcfifo_create0_bht_pred,
  ifu_iu_pcfifo_create0_chk_idx,
  ifu_iu_pcfifo_create0_cur_pc,
  ifu_iu_pcfifo_create0_dst_vld,
  ifu_iu_pcfifo_create0_en,
  ifu_iu_pcfifo_create0_gateclk_en,
  ifu_iu_pcfifo_create0_jal,
  ifu_iu_pcfifo_create0_jalr,
  ifu_iu_pcfifo_create0_jmp_mispred,
  ifu_iu_pcfifo_create0_tar_pc,
  ifu_iu_pcfifo_create1_bht_pred,
  ifu_iu_pcfifo_create1_chk_idx,
  ifu_iu_pcfifo_create1_cur_pc,
  ifu_iu_pcfifo_create1_dst_vld,
  ifu_iu_pcfifo_create1_en,
  ifu_iu_pcfifo_create1_gateclk_en,
  ifu_iu_pcfifo_create1_jal,
  ifu_iu_pcfifo_create1_jalr,
  ifu_iu_pcfifo_create1_jmp_mispred,
  ifu_iu_pcfifo_create1_tar_pc,
  ifu_lsu_icache_inv_done,
  ifu_mmu_abort,
  ifu_mmu_va,
  ifu_mmu_va_vld,
  ifu_rtu_cur_pc,
  ifu_rtu_cur_pc_load,
  ifu_xx_sync_reset,
  ifu_yy_xx_no_op,
  iu_ifu_bht_check_vld,
  iu_ifu_bht_condbr_taken,
  iu_ifu_bht_pred,
  iu_ifu_chgflw_pc,
  iu_ifu_chgflw_vl,
  iu_ifu_chgflw_vld,
  iu_ifu_chgflw_vlmul,
  iu_ifu_chgflw_vsew,
  iu_ifu_chk_idx,
  iu_ifu_cur_pc,
  iu_ifu_mispred_stall,
  iu_ifu_pcfifo_full,
  lsu_ifu_icache_all_inv,
  lsu_ifu_icache_index,
  lsu_ifu_icache_line_inv,
  lsu_ifu_icache_ptag,
  mmu_ifu_buf,
  mmu_ifu_ca,
  mmu_ifu_deny,
  mmu_ifu_pa,
  mmu_ifu_pavld,
  mmu_ifu_pgflt,
  mmu_ifu_sec,
  mmu_xx_mmu_en,
  pad_yy_icg_scan_en,
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
  rtu_yy_xx_dbgon,
  vfdsu_ifu_debug_ex2_wait,
  vfdsu_ifu_debug_idle,
  vfdsu_ifu_debug_pipe_busy
);

// &Ports; @24
input   [127:0]  biu_ifu_rd_data;                     
input            biu_ifu_rd_data_vld;                 
input            biu_ifu_rd_grnt;                     
input            biu_ifu_rd_id;                       
input            biu_ifu_rd_last;                     
input   [1  :0]  biu_ifu_rd_resp;                     
input            cp0_idu_cskyee;                      
input   [2  :0]  cp0_idu_frm;                         
input   [1  :0]  cp0_idu_fs;                          
input            cp0_ifu_bht_en;                      
input            cp0_ifu_bht_inv;                     
input            cp0_ifu_btb_en;                      
input            cp0_ifu_btb_inv;                     
input            cp0_ifu_icache_en;                   
input            cp0_ifu_icache_inv;                  
input            cp0_ifu_icache_pref_en;              
input   [16 :0]  cp0_ifu_icache_read_index;           
input            cp0_ifu_icache_read_req;             
input            cp0_ifu_icache_read_tag;             
input            cp0_ifu_icache_read_way;             
input            cp0_ifu_icg_en;                      
input            cp0_ifu_ind_btb_en;                  
input            cp0_ifu_ind_btb_inv;                 
input            cp0_ifu_insde;                       
input            cp0_ifu_iwpe;                        
input            cp0_ifu_l0btb_en;                    
input            cp0_ifu_lbuf_en;                     
input            cp0_ifu_no_op_req;                   
input            cp0_ifu_nsfe;                        
input            cp0_ifu_ras_en;                      
input            cp0_ifu_rst_inv_done;                
input   [39 :0]  cp0_ifu_rvbr;                        
input   [39 :0]  cp0_ifu_vbr;                         
input   [7  :0]  cp0_ifu_vl;                          
input   [1  :0]  cp0_ifu_vlmul;                       
input            cp0_ifu_vsetvli_pred_disable;        
input            cp0_ifu_vsetvli_pred_mode;           
input   [2  :0]  cp0_ifu_vsew;                        
input            cp0_yy_clk_en;                       
input   [1  :0]  cp0_yy_priv_mode;                    
input            cpurst_b;                            
input            forever_cpuclk;                      
input   [31 :0]  had_ifu_ir;                          
input            had_ifu_ir_vld;                      
input   [38 :0]  had_ifu_pc;                          
input            had_ifu_pcload;                      
input            had_rtu_xx_jdbreq;                   
input   [39 :0]  had_yy_xx_bkpta_base;                
input   [7  :0]  had_yy_xx_bkpta_mask;                
input            had_yy_xx_bkpta_rc;                  
input   [39 :0]  had_yy_xx_bkptb_base;                
input   [7  :0]  had_yy_xx_bkptb_mask;                
input            had_yy_xx_bkptb_rc;                  
input            hpcp_ifu_cnt_en;                     
input            idu_ifu_id_bypass_stall;             
input            idu_ifu_id_stall;                    
input            iu_ifu_bht_check_vld;                
input            iu_ifu_bht_condbr_taken;             
input            iu_ifu_bht_pred;                     
input   [62 :0]  iu_ifu_chgflw_pc;                    
input   [7  :0]  iu_ifu_chgflw_vl;                    
input            iu_ifu_chgflw_vld;                   
input   [1  :0]  iu_ifu_chgflw_vlmul;                 
input   [2  :0]  iu_ifu_chgflw_vsew;                  
input   [24 :0]  iu_ifu_chk_idx;                      
input   [38 :0]  iu_ifu_cur_pc;                       
input            iu_ifu_mispred_stall;                
input            iu_ifu_pcfifo_full;                  
input            lsu_ifu_icache_all_inv;              
input   [5  :0]  lsu_ifu_icache_index;                
input            lsu_ifu_icache_line_inv;             
input   [27 :0]  lsu_ifu_icache_ptag;                 
input            mmu_ifu_buf;                         
input            mmu_ifu_ca;                          
input            mmu_ifu_deny;                        
input   [27 :0]  mmu_ifu_pa;                          
input            mmu_ifu_pavld;                       
input            mmu_ifu_pgflt;                       
input            mmu_ifu_sec;                         
input            mmu_xx_mmu_en;                       
input            pad_yy_icg_scan_en;                  
input   [38 :0]  rtu_ifu_chgflw_pc;                   
input            rtu_ifu_chgflw_vld;                  
input            rtu_ifu_flush;                       
input   [7  :0]  rtu_ifu_retire0_chk_idx;             
input            rtu_ifu_retire0_condbr;              
input            rtu_ifu_retire0_condbr_taken;        
input   [38 :0]  rtu_ifu_retire0_inc_pc;              
input            rtu_ifu_retire0_jmp;                 
input            rtu_ifu_retire0_jmp_mispred;         
input            rtu_ifu_retire0_mispred;             
input   [38 :0]  rtu_ifu_retire0_next_pc;             
input            rtu_ifu_retire0_pcall;               
input            rtu_ifu_retire0_preturn;             
input   [7  :0]  rtu_ifu_retire1_chk_idx;             
input            rtu_ifu_retire1_condbr;              
input            rtu_ifu_retire1_condbr_taken;        
input            rtu_ifu_retire1_jmp;                 
input   [7  :0]  rtu_ifu_retire2_chk_idx;             
input            rtu_ifu_retire2_condbr;              
input            rtu_ifu_retire2_condbr_taken;        
input            rtu_ifu_retire2_jmp;                 
input   [38 :0]  rtu_ifu_retire_inst0_cur_pc;         
input            rtu_ifu_retire_inst0_load;           
input            rtu_ifu_retire_inst0_no_spec_hit;    
input            rtu_ifu_retire_inst0_no_spec_mispred; 
input            rtu_ifu_retire_inst0_no_spec_miss;   
input            rtu_ifu_retire_inst0_store;          
input            rtu_ifu_retire_inst0_vl_hit;         
input            rtu_ifu_retire_inst0_vl_mispred;     
input            rtu_ifu_retire_inst0_vl_miss;        
input            rtu_ifu_retire_inst0_vl_pred;        
input   [38 :0]  rtu_ifu_retire_inst1_cur_pc;         
input            rtu_ifu_retire_inst1_load;           
input            rtu_ifu_retire_inst1_no_spec_hit;    
input            rtu_ifu_retire_inst1_no_spec_mispred; 
input            rtu_ifu_retire_inst1_no_spec_miss;   
input            rtu_ifu_retire_inst1_store;          
input            rtu_ifu_retire_inst1_vl_pred;        
input   [38 :0]  rtu_ifu_retire_inst2_cur_pc;         
input            rtu_ifu_retire_inst2_load;           
input            rtu_ifu_retire_inst2_no_spec_hit;    
input            rtu_ifu_retire_inst2_no_spec_mispred; 
input            rtu_ifu_retire_inst2_no_spec_miss;   
input            rtu_ifu_retire_inst2_store;          
input            rtu_ifu_retire_inst2_vl_pred;        
input            rtu_ifu_xx_dbgon;                    
input   [5  :0]  rtu_ifu_xx_expt_vec;                 
input            rtu_ifu_xx_expt_vld;                 
input            rtu_yy_xx_dbgon;                     
input            vfdsu_ifu_debug_ex2_wait;            
input            vfdsu_ifu_debug_idle;                
input            vfdsu_ifu_debug_pipe_busy;           
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
output           ifu_cp0_bht_inv_done;                
output           ifu_cp0_btb_inv_done;                
output           ifu_cp0_icache_inv_done;             
output  [127:0]  ifu_cp0_icache_read_data;            
output           ifu_cp0_icache_read_data_vld;        
output           ifu_cp0_ind_btb_inv_done;            
output           ifu_cp0_rst_inv_req;                 
output  [82 :0]  ifu_had_debug_info;                  
output           ifu_had_no_inst;                     
output           ifu_had_no_op;                       
output           ifu_had_reset_on;                    
output           ifu_hpcp_btb_inst;                   
output           ifu_hpcp_btb_mispred;                
output           ifu_hpcp_frontend_stall;             
output           ifu_hpcp_icache_access;              
output           ifu_hpcp_icache_miss;                
output  [72 :0]  ifu_idu_ib_inst0_data;               
output           ifu_idu_ib_inst0_vld;                
output  [72 :0]  ifu_idu_ib_inst1_data;               
output           ifu_idu_ib_inst1_vld;                
output  [72 :0]  ifu_idu_ib_inst2_data;               
output           ifu_idu_ib_inst2_vld;                
output           ifu_idu_ib_pipedown_gateclk;         
output           ifu_iu_pcfifo_create0_bht_pred;      
output  [24 :0]  ifu_iu_pcfifo_create0_chk_idx;       
output  [39 :0]  ifu_iu_pcfifo_create0_cur_pc;        
output           ifu_iu_pcfifo_create0_dst_vld;       
output           ifu_iu_pcfifo_create0_en;            
output           ifu_iu_pcfifo_create0_gateclk_en;    
output           ifu_iu_pcfifo_create0_jal;           
output           ifu_iu_pcfifo_create0_jalr;          
output           ifu_iu_pcfifo_create0_jmp_mispred;   
output  [39 :0]  ifu_iu_pcfifo_create0_tar_pc;        
output           ifu_iu_pcfifo_create1_bht_pred;      
output  [24 :0]  ifu_iu_pcfifo_create1_chk_idx;       
output  [39 :0]  ifu_iu_pcfifo_create1_cur_pc;        
output           ifu_iu_pcfifo_create1_dst_vld;       
output           ifu_iu_pcfifo_create1_en;            
output           ifu_iu_pcfifo_create1_gateclk_en;    
output           ifu_iu_pcfifo_create1_jal;           
output           ifu_iu_pcfifo_create1_jalr;          
output           ifu_iu_pcfifo_create1_jmp_mispred;   
output  [39 :0]  ifu_iu_pcfifo_create1_tar_pc;        
output           ifu_lsu_icache_inv_done;             
output           ifu_mmu_abort;                       
output  [62 :0]  ifu_mmu_va;                          
output           ifu_mmu_va_vld;                      
output  [38 :0]  ifu_rtu_cur_pc;                      
output           ifu_rtu_cur_pc_load;                 
output           ifu_xx_sync_reset;                   
output           ifu_yy_xx_no_op;                     

// &Regs; @25

// &Wires; @26
wire    [9  :0]  addrgen_btb_index;                   
wire    [9  :0]  addrgen_btb_tag;                     
wire    [19 :0]  addrgen_btb_target_pc;               
wire             addrgen_btb_update_vld;              
wire             addrgen_ibctrl_cancel;               
wire    [7  :0]  addrgen_ipdp_chgflw_vl;              
wire    [1  :0]  addrgen_ipdp_chgflw_vlmul;           
wire    [2  :0]  addrgen_ipdp_chgflw_vsew;            
wire    [15 :0]  addrgen_l0_btb_update_entry;         
wire             addrgen_l0_btb_update_vld;           
wire             addrgen_l0_btb_update_vld_bit;       
wire    [3  :0]  addrgen_l0_btb_wen;                  
wire    [38 :0]  addrgen_pcgen_pc;                    
wire             addrgen_pcgen_pcload;                
wire             addrgen_xx_pcload;                   
wire             bht_ifctrl_inv_done;                 
wire             bht_ifctrl_inv_on;                   
wire    [7  :0]  bht_ind_btb_rtu_ghr;                 
wire    [7  :0]  bht_ind_btb_vghr;                    
wire    [31 :0]  bht_ipdp_pre_array_data_ntake;       
wire    [31 :0]  bht_ipdp_pre_array_data_taken;       
wire    [15 :0]  bht_ipdp_pre_offset_onehot;          
wire    [1  :0]  bht_ipdp_sel_array_result;           
wire    [21 :0]  bht_ipdp_vghr;                       
wire    [31 :0]  bht_lbuf_pre_ntaken_result;          
wire    [31 :0]  bht_lbuf_pre_taken_result;           
wire    [21 :0]  bht_lbuf_vghr;                       
wire    [127:0]  biu_ifu_rd_data;                     
wire             biu_ifu_rd_data_vld;                 
wire             biu_ifu_rd_grnt;                     
wire             biu_ifu_rd_id;                       
wire             biu_ifu_rd_last;                     
wire    [1  :0]  biu_ifu_rd_resp;                     
wire             btb_ifctrl_inv_done;                 
wire             btb_ifctrl_inv_on;                   
wire    [1  :0]  btb_ifdp_way0_pred;                  
wire    [9  :0]  btb_ifdp_way0_tag;                   
wire    [19 :0]  btb_ifdp_way0_target;                
wire             btb_ifdp_way0_vld;                   
wire    [1  :0]  btb_ifdp_way1_pred;                  
wire    [9  :0]  btb_ifdp_way1_tag;                   
wire    [19 :0]  btb_ifdp_way1_target;                
wire             btb_ifdp_way1_vld;                   
wire    [1  :0]  btb_ifdp_way2_pred;                  
wire    [9  :0]  btb_ifdp_way2_tag;                   
wire    [19 :0]  btb_ifdp_way2_target;                
wire             btb_ifdp_way2_vld;                   
wire    [1  :0]  btb_ifdp_way3_pred;                  
wire    [9  :0]  btb_ifdp_way3_tag;                   
wire    [19 :0]  btb_ifdp_way3_target;                
wire             btb_ifdp_way3_vld;                   
wire             cp0_idu_cskyee;                      
wire    [2  :0]  cp0_idu_frm;                         
wire    [1  :0]  cp0_idu_fs;                          
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
wire             cp0_yy_clk_en;                       
wire    [1  :0]  cp0_yy_priv_mode;                    
wire             cpurst_b;                            
wire             forever_cpuclk;                      
wire    [31 :0]  had_ifu_ir;                          
wire             had_ifu_ir_vld;                      
wire    [38 :0]  had_ifu_pc;                          
wire             had_ifu_pcload;                      
wire             had_rtu_xx_jdbreq;                   
wire    [39 :0]  had_yy_xx_bkpta_base;                
wire    [7  :0]  had_yy_xx_bkpta_mask;                
wire             had_yy_xx_bkpta_rc;                  
wire    [39 :0]  had_yy_xx_bkptb_base;                
wire    [7  :0]  had_yy_xx_bkptb_mask;                
wire             had_yy_xx_bkptb_rc;                  
wire             hpcp_ifu_cnt_en;                     
wire             ibctrl_debug_buf_stall;              
wire             ibctrl_debug_bypass_inst_vld;        
wire             ibctrl_debug_fifo_full_stall;        
wire             ibctrl_debug_fifo_stall;             
wire             ibctrl_debug_ib_expt_vld;            
wire             ibctrl_debug_ib_ip_stall;            
wire             ibctrl_debug_ib_vld;                 
wire             ibctrl_debug_ibuf_empty;             
wire             ibctrl_debug_ibuf_full;              
wire             ibctrl_debug_ibuf_inst_vld;          
wire             ibctrl_debug_ind_btb_stall;          
wire             ibctrl_debug_lbuf_inst_vld;          
wire             ibctrl_debug_mispred_stall;          
wire             ibctrl_ibdp_buf_stall;               
wire             ibctrl_ibdp_bypass_inst_vld;         
wire             ibctrl_ibdp_cancel;                  
wire             ibctrl_ibdp_chgflw;                  
wire             ibctrl_ibdp_fifo_full_stall;         
wire             ibctrl_ibdp_fifo_stall;              
wire             ibctrl_ibdp_ibuf_inst_vld;           
wire             ibctrl_ibdp_if_chgflw_vld;           
wire             ibctrl_ibdp_ind_btb_rd_stall;        
wire             ibctrl_ibdp_ip_chgflw_vld;           
wire             ibctrl_ibdp_l0_btb_hit;              
wire             ibctrl_ibdp_l0_btb_mispred;          
wire             ibctrl_ibdp_l0_btb_miss;             
wire             ibctrl_ibdp_l0_btb_wait;             
wire             ibctrl_ibdp_lbuf_inst_vld;           
wire             ibctrl_ibdp_mispred_stall;           
wire             ibctrl_ibdp_self_stall;              
wire             ibctrl_ibuf_bypass_not_select;       
wire             ibctrl_ibuf_create_vld;              
wire             ibctrl_ibuf_data_vld;                
wire             ibctrl_ibuf_flush;                   
wire             ibctrl_ibuf_merge_vld;               
wire             ibctrl_ibuf_retire_vld;              
wire             ibctrl_ind_btb_check_vld;            
wire             ibctrl_ind_btb_fifo_stall;           
wire    [7  :0]  ibctrl_ind_btb_path;                 
wire             ibctrl_ipctrl_low_power_stall;       
wire             ibctrl_ipctrl_stall;                 
wire    [7  :0]  ibctrl_ipdp_chgflw_vl;               
wire    [1  :0]  ibctrl_ipdp_chgflw_vlmul;            
wire    [2  :0]  ibctrl_ipdp_chgflw_vsew;             
wire             ibctrl_ipdp_pcload;                  
wire             ibctrl_lbuf_bju_mispred;             
wire             ibctrl_lbuf_create_vld;              
wire             ibctrl_lbuf_flush;                   
wire             ibctrl_lbuf_retire_vld;              
wire             ibctrl_pcfifo_if_create_vld;         
wire             ibctrl_pcfifo_if_ind_btb_miss;       
wire    [38 :0]  ibctrl_pcfifo_if_ind_target_pc;      
wire    [38 :0]  ibctrl_pcfifo_if_ras_target_pc;      
wire             ibctrl_pcfifo_if_ras_vld;            
wire             ibctrl_pcgen_ip_stall;               
wire    [38 :0]  ibctrl_pcgen_pc;                     
wire             ibctrl_pcgen_pcload;                 
wire             ibctrl_pcgen_pcload_vld;             
wire    [1  :0]  ibctrl_pcgen_way_pred;               
wire             ibctrl_ras_inst_pcall;               
wire             ibctrl_ras_pcall_vld;                
wire             ibctrl_ras_pcall_vld_for_gateclk;    
wire             ibctrl_ras_preturn_vld;              
wire             ibctrl_ras_preturn_vld_for_gateclk;  
wire    [38 :0]  ibdp_addrgen_branch_base;            
wire    [20 :0]  ibdp_addrgen_branch_offset;          
wire    [38 :0]  ibdp_addrgen_branch_result;          
wire             ibdp_addrgen_branch_valid;           
wire    [7  :0]  ibdp_addrgen_branch_vl;              
wire    [1  :0]  ibdp_addrgen_branch_vlmul;           
wire    [2  :0]  ibdp_addrgen_branch_vsew;            
wire    [38 :0]  ibdp_addrgen_btb_index_pc;           
wire             ibdp_addrgen_l0_btb_hit;             
wire    [15 :0]  ibdp_addrgen_l0_btb_hit_entry;       
wire             ibdp_btb_miss;                       
wire             ibdp_debug_inst0_vld;                
wire             ibdp_debug_inst1_vld;                
wire             ibdp_debug_inst2_vld;                
wire             ibdp_debug_mmu_deny_vld;             
wire    [7  :0]  ibdp_ibctrl_chgflw_vl;               
wire    [1  :0]  ibdp_ibctrl_chgflw_vlmul;            
wire    [2  :0]  ibdp_ibctrl_chgflw_vsew;             
wire    [38 :0]  ibdp_ibctrl_default_pc;              
wire    [7  :0]  ibdp_ibctrl_hn_ind_br;               
wire    [7  :0]  ibdp_ibctrl_hn_pcall;                
wire    [7  :0]  ibdp_ibctrl_hn_preturn;              
wire    [38 :0]  ibdp_ibctrl_l0_btb_mispred_pc;       
wire             ibdp_ibctrl_ras_chgflw_mask;         
wire             ibdp_ibctrl_ras_mistaken;            
wire    [38 :0]  ibdp_ibctrl_ras_pc;                  
wire    [38 :0]  ibdp_ibctrl_vpc;                     
wire             ibdp_ibuf_h0_32_start;               
wire             ibdp_ibuf_h0_bkpta;                  
wire             ibdp_ibuf_h0_bkptb;                  
wire    [15 :0]  ibdp_ibuf_h0_data;                   
wire             ibdp_ibuf_h0_fence;                  
wire             ibdp_ibuf_h0_high_expt;              
wire             ibdp_ibuf_h0_ldst;                   
wire             ibdp_ibuf_h0_no_spec;                
wire    [14 :0]  ibdp_ibuf_h0_pc;                     
wire             ibdp_ibuf_h0_spe_vld;                
wire             ibdp_ibuf_h0_split0;                 
wire             ibdp_ibuf_h0_split1;                 
wire    [7  :0]  ibdp_ibuf_h0_vl;                     
wire             ibdp_ibuf_h0_vl_pred;                
wire             ibdp_ibuf_h0_vld;                    
wire    [1  :0]  ibdp_ibuf_h0_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h0_vsew;                   
wire    [15 :0]  ibdp_ibuf_h1_data;                   
wire    [14 :0]  ibdp_ibuf_h1_pc;                     
wire    [7  :0]  ibdp_ibuf_h1_vl;                     
wire    [1  :0]  ibdp_ibuf_h1_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h1_vsew;                   
wire    [15 :0]  ibdp_ibuf_h2_data;                   
wire    [14 :0]  ibdp_ibuf_h2_pc;                     
wire    [7  :0]  ibdp_ibuf_h2_vl;                     
wire    [1  :0]  ibdp_ibuf_h2_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h2_vsew;                   
wire    [15 :0]  ibdp_ibuf_h3_data;                   
wire    [14 :0]  ibdp_ibuf_h3_pc;                     
wire    [7  :0]  ibdp_ibuf_h3_vl;                     
wire    [1  :0]  ibdp_ibuf_h3_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h3_vsew;                   
wire    [15 :0]  ibdp_ibuf_h4_data;                   
wire    [14 :0]  ibdp_ibuf_h4_pc;                     
wire    [7  :0]  ibdp_ibuf_h4_vl;                     
wire    [1  :0]  ibdp_ibuf_h4_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h4_vsew;                   
wire    [15 :0]  ibdp_ibuf_h5_data;                   
wire    [14 :0]  ibdp_ibuf_h5_pc;                     
wire    [7  :0]  ibdp_ibuf_h5_vl;                     
wire    [1  :0]  ibdp_ibuf_h5_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h5_vsew;                   
wire    [15 :0]  ibdp_ibuf_h6_data;                   
wire    [14 :0]  ibdp_ibuf_h6_pc;                     
wire    [7  :0]  ibdp_ibuf_h6_vl;                     
wire    [1  :0]  ibdp_ibuf_h6_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h6_vsew;                   
wire    [15 :0]  ibdp_ibuf_h7_data;                   
wire    [14 :0]  ibdp_ibuf_h7_pc;                     
wire    [7  :0]  ibdp_ibuf_h7_vl;                     
wire    [1  :0]  ibdp_ibuf_h7_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h7_vsew;                   
wire    [15 :0]  ibdp_ibuf_h8_data;                   
wire    [14 :0]  ibdp_ibuf_h8_pc;                     
wire    [7  :0]  ibdp_ibuf_h8_vl;                     
wire    [1  :0]  ibdp_ibuf_h8_vlmul;                  
wire    [2  :0]  ibdp_ibuf_h8_vsew;                   
wire    [3  :0]  ibdp_ibuf_half_vld_num;              
wire    [7  :0]  ibdp_ibuf_hn_32_start;               
wire    [7  :0]  ibdp_ibuf_hn_acc_err;                
wire             ibdp_ibuf_hn_acc_err_vld;            
wire    [7  :0]  ibdp_ibuf_hn_bkpta;                  
wire             ibdp_ibuf_hn_bkpta_vld;              
wire    [7  :0]  ibdp_ibuf_hn_bkptb;                  
wire             ibdp_ibuf_hn_bkptb_vld;              
wire    [7  :0]  ibdp_ibuf_hn_fence;                  
wire    [7  :0]  ibdp_ibuf_hn_high_expt;              
wire    [7  :0]  ibdp_ibuf_hn_ldst;                   
wire    [7  :0]  ibdp_ibuf_hn_mmu_acc_deny;           
wire             ibdp_ibuf_hn_mmu_acc_deny_vld;       
wire    [7  :0]  ibdp_ibuf_hn_no_spec;                
wire             ibdp_ibuf_hn_no_spec_vld;            
wire    [7  :0]  ibdp_ibuf_hn_pgflt;                  
wire             ibdp_ibuf_hn_pgflt_vld;              
wire    [7  :0]  ibdp_ibuf_hn_split0;                 
wire    [7  :0]  ibdp_ibuf_hn_split1;                 
wire    [7  :0]  ibdp_ibuf_hn_vl_pred;                
wire    [7  :0]  ibdp_ibuf_hn_vld;                    
wire             ibdp_l0_btb_fifo_update_vld;         
wire             ibdp_l0_btb_update_cnt_bit;          
wire    [36 :0]  ibdp_l0_btb_update_data;             
wire    [15 :0]  ibdp_l0_btb_update_entry;            
wire             ibdp_l0_btb_update_ras_bit;          
wire             ibdp_l0_btb_update_vld;              
wire             ibdp_l0_btb_update_vld_bit;          
wire    [3  :0]  ibdp_l0_btb_wen;                     
wire    [1  :0]  ibdp_lbuf_bht_sel_array_result;      
wire    [38 :0]  ibdp_lbuf_con_br_cur_pc;             
wire    [3  :0]  ibdp_lbuf_con_br_half_num;           
wire             ibdp_lbuf_con_br_inst_32;            
wire    [20 :0]  ibdp_lbuf_con_br_offset;             
wire             ibdp_lbuf_con_br_taken;              
wire    [7  :0]  ibdp_lbuf_con_br_vl;                 
wire    [1  :0]  ibdp_lbuf_con_br_vlmul;              
wire    [2  :0]  ibdp_lbuf_con_br_vsew;               
wire             ibdp_lbuf_h0_32_start;               
wire             ibdp_lbuf_h0_bkpta;                  
wire             ibdp_lbuf_h0_bkptb;                  
wire             ibdp_lbuf_h0_con_br;                 
wire    [15 :0]  ibdp_lbuf_h0_data;                   
wire             ibdp_lbuf_h0_fence;                  
wire    [2  :0]  ibdp_lbuf_h0_split0_type;            
wire    [2  :0]  ibdp_lbuf_h0_split1_type;            
wire    [7  :0]  ibdp_lbuf_h0_vl;                     
wire             ibdp_lbuf_h0_vld;                    
wire    [1  :0]  ibdp_lbuf_h0_vlmul;                  
wire             ibdp_lbuf_h0_vsetvli;                
wire    [2  :0]  ibdp_lbuf_h0_vsew;                   
wire    [15 :0]  ibdp_lbuf_h1_data;                   
wire    [2  :0]  ibdp_lbuf_h1_split0_type;            
wire    [2  :0]  ibdp_lbuf_h1_split1_type;            
wire    [7  :0]  ibdp_lbuf_h1_vl;                     
wire    [1  :0]  ibdp_lbuf_h1_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h1_vsew;                   
wire    [15 :0]  ibdp_lbuf_h2_data;                   
wire    [2  :0]  ibdp_lbuf_h2_split0_type;            
wire    [2  :0]  ibdp_lbuf_h2_split1_type;            
wire    [7  :0]  ibdp_lbuf_h2_vl;                     
wire    [1  :0]  ibdp_lbuf_h2_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h2_vsew;                   
wire    [15 :0]  ibdp_lbuf_h3_data;                   
wire    [2  :0]  ibdp_lbuf_h3_split0_type;            
wire    [2  :0]  ibdp_lbuf_h3_split1_type;            
wire    [7  :0]  ibdp_lbuf_h3_vl;                     
wire    [1  :0]  ibdp_lbuf_h3_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h3_vsew;                   
wire    [15 :0]  ibdp_lbuf_h4_data;                   
wire    [2  :0]  ibdp_lbuf_h4_split0_type;            
wire    [2  :0]  ibdp_lbuf_h4_split1_type;            
wire    [7  :0]  ibdp_lbuf_h4_vl;                     
wire    [1  :0]  ibdp_lbuf_h4_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h4_vsew;                   
wire    [15 :0]  ibdp_lbuf_h5_data;                   
wire    [2  :0]  ibdp_lbuf_h5_split0_type;            
wire    [2  :0]  ibdp_lbuf_h5_split1_type;            
wire    [7  :0]  ibdp_lbuf_h5_vl;                     
wire    [1  :0]  ibdp_lbuf_h5_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h5_vsew;                   
wire    [15 :0]  ibdp_lbuf_h6_data;                   
wire    [2  :0]  ibdp_lbuf_h6_split0_type;            
wire    [2  :0]  ibdp_lbuf_h6_split1_type;            
wire    [7  :0]  ibdp_lbuf_h6_vl;                     
wire    [1  :0]  ibdp_lbuf_h6_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h6_vsew;                   
wire    [15 :0]  ibdp_lbuf_h7_data;                   
wire    [2  :0]  ibdp_lbuf_h7_split0_type;            
wire    [2  :0]  ibdp_lbuf_h7_split1_type;            
wire    [7  :0]  ibdp_lbuf_h7_vl;                     
wire    [1  :0]  ibdp_lbuf_h7_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h7_vsew;                   
wire    [15 :0]  ibdp_lbuf_h8_data;                   
wire    [2  :0]  ibdp_lbuf_h8_split0_type;            
wire    [2  :0]  ibdp_lbuf_h8_split1_type;            
wire    [7  :0]  ibdp_lbuf_h8_vl;                     
wire    [1  :0]  ibdp_lbuf_h8_vlmul;                  
wire    [2  :0]  ibdp_lbuf_h8_vsew;                   
wire    [3  :0]  ibdp_lbuf_half_vld_num;              
wire    [7  :0]  ibdp_lbuf_hn_32_start;               
wire    [7  :0]  ibdp_lbuf_hn_auipc;                  
wire    [7  :0]  ibdp_lbuf_hn_bkpta;                  
wire    [7  :0]  ibdp_lbuf_hn_bkptb;                  
wire    [7  :0]  ibdp_lbuf_hn_chgflw;                 
wire    [7  :0]  ibdp_lbuf_hn_con_br;                 
wire    [7  :0]  ibdp_lbuf_hn_fence;                  
wire    [7  :0]  ibdp_lbuf_hn_vld;                    
wire    [7  :0]  ibdp_lbuf_hn_vsetvli;                
wire    [1  :0]  ibdp_pcfifo_if_bht_pre_result;       
wire    [1  :0]  ibdp_pcfifo_if_bht_sel_result;       
wire    [38 :0]  ibdp_pcfifo_if_h0_cur_pc;            
wire             ibdp_pcfifo_if_h0_vld;               
wire    [38 :0]  ibdp_pcfifo_if_h1_cur_pc;            
wire    [38 :0]  ibdp_pcfifo_if_h2_cur_pc;            
wire    [38 :0]  ibdp_pcfifo_if_h3_cur_pc;            
wire    [38 :0]  ibdp_pcfifo_if_h4_cur_pc;            
wire    [38 :0]  ibdp_pcfifo_if_h5_cur_pc;            
wire    [38 :0]  ibdp_pcfifo_if_h6_cur_pc;            
wire    [38 :0]  ibdp_pcfifo_if_h7_cur_pc;            
wire    [38 :0]  ibdp_pcfifo_if_h8_cur_pc;            
wire    [7  :0]  ibdp_pcfifo_if_hn_con_br;            
wire    [7  :0]  ibdp_pcfifo_if_hn_dst_vld;           
wire    [7  :0]  ibdp_pcfifo_if_hn_jal;               
wire    [7  :0]  ibdp_pcfifo_if_hn_jalr;              
wire    [7  :0]  ibdp_pcfifo_if_hn_pc_oper;           
wire    [20 :0]  ibdp_pcfifo_if_ind_br_offset;        
wire    [21 :0]  ibdp_pcfifo_if_vghr;                 
wire    [38 :0]  ibdp_ras_push_pc;                    
wire             ibuf_ibctrl_empty;                   
wire             ibuf_ibctrl_stall;                   
wire    [31 :0]  ibuf_ibdp_bypass_inst0;              
wire             ibuf_ibdp_bypass_inst0_bkpta;        
wire             ibuf_ibdp_bypass_inst0_bkptb;        
wire             ibuf_ibdp_bypass_inst0_ecc_err;      
wire             ibuf_ibdp_bypass_inst0_expt;         
wire             ibuf_ibdp_bypass_inst0_fence;        
wire             ibuf_ibdp_bypass_inst0_high_expt;    
wire             ibuf_ibdp_bypass_inst0_no_spec;      
wire    [14 :0]  ibuf_ibdp_bypass_inst0_pc;           
wire             ibuf_ibdp_bypass_inst0_split0;       
wire             ibuf_ibdp_bypass_inst0_split1;       
wire             ibuf_ibdp_bypass_inst0_valid;        
wire    [3  :0]  ibuf_ibdp_bypass_inst0_vec;          
wire    [7  :0]  ibuf_ibdp_bypass_inst0_vl;           
wire             ibuf_ibdp_bypass_inst0_vl_pred;      
wire    [1  :0]  ibuf_ibdp_bypass_inst0_vlmul;        
wire    [2  :0]  ibuf_ibdp_bypass_inst0_vsew;         
wire    [31 :0]  ibuf_ibdp_bypass_inst1;              
wire             ibuf_ibdp_bypass_inst1_bkpta;        
wire             ibuf_ibdp_bypass_inst1_bkptb;        
wire             ibuf_ibdp_bypass_inst1_ecc_err;      
wire             ibuf_ibdp_bypass_inst1_expt;         
wire             ibuf_ibdp_bypass_inst1_fence;        
wire             ibuf_ibdp_bypass_inst1_high_expt;    
wire             ibuf_ibdp_bypass_inst1_no_spec;      
wire    [14 :0]  ibuf_ibdp_bypass_inst1_pc;           
wire             ibuf_ibdp_bypass_inst1_split0;       
wire             ibuf_ibdp_bypass_inst1_split1;       
wire             ibuf_ibdp_bypass_inst1_valid;        
wire    [3  :0]  ibuf_ibdp_bypass_inst1_vec;          
wire    [7  :0]  ibuf_ibdp_bypass_inst1_vl;           
wire             ibuf_ibdp_bypass_inst1_vl_pred;      
wire    [1  :0]  ibuf_ibdp_bypass_inst1_vlmul;        
wire    [2  :0]  ibuf_ibdp_bypass_inst1_vsew;         
wire    [31 :0]  ibuf_ibdp_bypass_inst2;              
wire             ibuf_ibdp_bypass_inst2_bkpta;        
wire             ibuf_ibdp_bypass_inst2_bkptb;        
wire             ibuf_ibdp_bypass_inst2_ecc_err;      
wire             ibuf_ibdp_bypass_inst2_expt;         
wire             ibuf_ibdp_bypass_inst2_fence;        
wire             ibuf_ibdp_bypass_inst2_high_expt;    
wire             ibuf_ibdp_bypass_inst2_no_spec;      
wire    [14 :0]  ibuf_ibdp_bypass_inst2_pc;           
wire             ibuf_ibdp_bypass_inst2_split0;       
wire             ibuf_ibdp_bypass_inst2_split1;       
wire             ibuf_ibdp_bypass_inst2_valid;        
wire    [3  :0]  ibuf_ibdp_bypass_inst2_vec;          
wire    [7  :0]  ibuf_ibdp_bypass_inst2_vl;           
wire             ibuf_ibdp_bypass_inst2_vl_pred;      
wire    [1  :0]  ibuf_ibdp_bypass_inst2_vlmul;        
wire    [2  :0]  ibuf_ibdp_bypass_inst2_vsew;         
wire    [31 :0]  ibuf_ibdp_inst0;                     
wire             ibuf_ibdp_inst0_bkpta;               
wire             ibuf_ibdp_inst0_bkptb;               
wire             ibuf_ibdp_inst0_ecc_err;             
wire             ibuf_ibdp_inst0_expt_vld;            
wire             ibuf_ibdp_inst0_fence;               
wire             ibuf_ibdp_inst0_high_expt;           
wire             ibuf_ibdp_inst0_no_spec;             
wire    [14 :0]  ibuf_ibdp_inst0_pc;                  
wire             ibuf_ibdp_inst0_split0;              
wire             ibuf_ibdp_inst0_split1;              
wire             ibuf_ibdp_inst0_valid;               
wire    [3  :0]  ibuf_ibdp_inst0_vec;                 
wire    [7  :0]  ibuf_ibdp_inst0_vl;                  
wire             ibuf_ibdp_inst0_vl_pred;             
wire    [1  :0]  ibuf_ibdp_inst0_vlmul;               
wire    [2  :0]  ibuf_ibdp_inst0_vsew;                
wire    [31 :0]  ibuf_ibdp_inst1;                     
wire             ibuf_ibdp_inst1_bkpta;               
wire             ibuf_ibdp_inst1_bkptb;               
wire             ibuf_ibdp_inst1_ecc_err;             
wire             ibuf_ibdp_inst1_expt_vld;            
wire             ibuf_ibdp_inst1_fence;               
wire             ibuf_ibdp_inst1_high_expt;           
wire             ibuf_ibdp_inst1_no_spec;             
wire    [14 :0]  ibuf_ibdp_inst1_pc;                  
wire             ibuf_ibdp_inst1_split0;              
wire             ibuf_ibdp_inst1_split1;              
wire             ibuf_ibdp_inst1_valid;               
wire    [3  :0]  ibuf_ibdp_inst1_vec;                 
wire    [7  :0]  ibuf_ibdp_inst1_vl;                  
wire             ibuf_ibdp_inst1_vl_pred;             
wire    [1  :0]  ibuf_ibdp_inst1_vlmul;               
wire    [2  :0]  ibuf_ibdp_inst1_vsew;                
wire    [31 :0]  ibuf_ibdp_inst2;                     
wire             ibuf_ibdp_inst2_bkpta;               
wire             ibuf_ibdp_inst2_bkptb;               
wire             ibuf_ibdp_inst2_ecc_err;             
wire             ibuf_ibdp_inst2_expt_vld;            
wire             ibuf_ibdp_inst2_fence;               
wire             ibuf_ibdp_inst2_high_expt;           
wire             ibuf_ibdp_inst2_no_spec;             
wire    [14 :0]  ibuf_ibdp_inst2_pc;                  
wire             ibuf_ibdp_inst2_split0;              
wire             ibuf_ibdp_inst2_split1;              
wire             ibuf_ibdp_inst2_valid;               
wire    [3  :0]  ibuf_ibdp_inst2_vec;                 
wire    [7  :0]  ibuf_ibdp_inst2_vl;                  
wire             ibuf_ibdp_inst2_vl_pred;             
wire    [1  :0]  ibuf_ibdp_inst2_vlmul;               
wire    [2  :0]  ibuf_ibdp_inst2_vsew;                
wire             ibuf_lbuf_empty;                     
wire    [127:0]  icache_if_ifctrl_inst_data0;         
wire    [127:0]  icache_if_ifctrl_inst_data1;         
wire    [28 :0]  icache_if_ifctrl_tag_data0;          
wire    [28 :0]  icache_if_ifctrl_tag_data1;          
wire             icache_if_ifdp_fifo;                 
wire    [127:0]  icache_if_ifdp_inst_data0;           
wire    [127:0]  icache_if_ifdp_inst_data1;           
wire    [31 :0]  icache_if_ifdp_precode0;             
wire    [31 :0]  icache_if_ifdp_precode1;             
wire    [28 :0]  icache_if_ifdp_tag_data0;            
wire    [28 :0]  icache_if_ifdp_tag_data1;            
wire    [28 :0]  icache_if_ipb_tag_data0;             
wire    [28 :0]  icache_if_ipb_tag_data1;             
wire             idu_ifu_id_bypass_stall;             
wire             idu_ifu_id_stall;                    
wire             ifctrl_bht_inv;                      
wire             ifctrl_bht_pipedown;                 
wire             ifctrl_bht_stall;                    
wire             ifctrl_btb_inv;                      
wire             ifctrl_debug_if_pc_vld;              
wire             ifctrl_debug_if_stall;               
wire             ifctrl_debug_if_vld;                 
wire    [3  :0]  ifctrl_debug_inv_st;                 
wire             ifctrl_debug_lsu_all_inv;            
wire             ifctrl_debug_lsu_line_inv;           
wire             ifctrl_debug_mmu_pavld;              
wire             ifctrl_debug_way_pred_stall;         
wire    [38 :0]  ifctrl_icache_if_index;              
wire             ifctrl_icache_if_inv_fifo;           
wire             ifctrl_icache_if_inv_on;             
wire             ifctrl_icache_if_read_req_data0;     
wire             ifctrl_icache_if_read_req_data1;     
wire    [38 :0]  ifctrl_icache_if_read_req_index;     
wire             ifctrl_icache_if_read_req_tag;       
wire             ifctrl_icache_if_reset_req;          
wire             ifctrl_icache_if_tag_req;            
wire    [2  :0]  ifctrl_icache_if_tag_wen;            
wire             ifctrl_ifdp_cancel;                  
wire             ifctrl_ifdp_pipedown;                
wire             ifctrl_ifdp_stall;                   
wire             ifctrl_ind_btb_inv;                  
wire             ifctrl_ipb_inv_on;                   
wire             ifctrl_ipctrl_if_pcload;             
wire             ifctrl_ipctrl_vld;                   
wire             ifctrl_l0_btb_inv;                   
wire             ifctrl_l0_btb_stall;                 
wire             ifctrl_l1_refill_ins_inv;            
wire             ifctrl_l1_refill_ins_inv_dn;         
wire             ifctrl_l1_refill_inv_busy;           
wire             ifctrl_l1_refill_inv_on;             
wire             ifctrl_lbuf_ins_inv_on;              
wire             ifctrl_lbuf_inv_req;                 
wire             ifctrl_pcgen_chgflw_no_stall_mask;   
wire             ifctrl_pcgen_chgflw_vld;             
wire             ifctrl_pcgen_ins_icache_inv_done;    
wire    [38 :0]  ifctrl_pcgen_pcload_pc;              
wire             ifctrl_pcgen_reissue_pcload;         
wire             ifctrl_pcgen_stall;                  
wire             ifctrl_pcgen_stall_short;            
wire    [1  :0]  ifctrl_pcgen_way_pred;               
wire             ifdp_debug_acc_err_vld;              
wire             ifdp_debug_mmu_expt_vld;             
wire             ifdp_ipctrl_expt_vld;                
wire             ifdp_ipctrl_expt_vld_dup;            
wire             ifdp_ipctrl_fifo;                    
wire    [27 :0]  ifdp_ipctrl_pa;                      
wire             ifdp_ipctrl_refill_on;               
wire             ifdp_ipctrl_tsize;                   
wire    [7  :0]  ifdp_ipctrl_vpc_2_0_onehot;          
wire    [7  :0]  ifdp_ipctrl_vpc_bry_mask;            
wire             ifdp_ipctrl_w0_bry0_hit;             
wire             ifdp_ipctrl_w0_bry1_hit;             
wire    [7  :0]  ifdp_ipctrl_w0b0_br_ntake;           
wire    [7  :0]  ifdp_ipctrl_w0b0_br_taken;           
wire    [7  :0]  ifdp_ipctrl_w0b0_bry_data;           
wire    [7  :0]  ifdp_ipctrl_w0b1_br_ntake;           
wire    [7  :0]  ifdp_ipctrl_w0b1_br_taken;           
wire    [7  :0]  ifdp_ipctrl_w0b1_bry_data;           
wire             ifdp_ipctrl_w1_bry0_hit;             
wire             ifdp_ipctrl_w1_bry1_hit;             
wire    [7  :0]  ifdp_ipctrl_w1b0_br_ntake;           
wire    [7  :0]  ifdp_ipctrl_w1b0_br_taken;           
wire    [7  :0]  ifdp_ipctrl_w1b0_bry_data;           
wire    [7  :0]  ifdp_ipctrl_w1b1_br_ntake;           
wire    [7  :0]  ifdp_ipctrl_w1b1_br_taken;           
wire    [7  :0]  ifdp_ipctrl_w1b1_bry_data;           
wire             ifdp_ipctrl_way0_15_8_hit;           
wire             ifdp_ipctrl_way0_15_8_hit_dup;       
wire             ifdp_ipctrl_way0_23_16_hit;          
wire             ifdp_ipctrl_way0_23_16_hit_dup;      
wire             ifdp_ipctrl_way0_28_24_hit;          
wire             ifdp_ipctrl_way0_28_24_hit_dup;      
wire             ifdp_ipctrl_way0_7_0_hit;            
wire             ifdp_ipctrl_way0_7_0_hit_dup;        
wire             ifdp_ipctrl_way1_15_8_hit;           
wire             ifdp_ipctrl_way1_23_16_hit;          
wire             ifdp_ipctrl_way1_28_24_hit;          
wire             ifdp_ipctrl_way1_7_0_hit;            
wire    [1  :0]  ifdp_ipctrl_way_pred;                
wire             ifdp_ipdp_acc_err;                   
wire    [7  :0]  ifdp_ipdp_bkpta;                     
wire    [7  :0]  ifdp_ipdp_bkptb;                     
wire    [1  :0]  ifdp_ipdp_btb_way0_pred;             
wire    [9  :0]  ifdp_ipdp_btb_way0_tag;              
wire    [19 :0]  ifdp_ipdp_btb_way0_target;           
wire             ifdp_ipdp_btb_way0_vld;              
wire    [1  :0]  ifdp_ipdp_btb_way1_pred;             
wire    [9  :0]  ifdp_ipdp_btb_way1_tag;              
wire    [19 :0]  ifdp_ipdp_btb_way1_target;           
wire             ifdp_ipdp_btb_way1_vld;              
wire    [1  :0]  ifdp_ipdp_btb_way2_pred;             
wire    [9  :0]  ifdp_ipdp_btb_way2_tag;              
wire    [19 :0]  ifdp_ipdp_btb_way2_target;           
wire             ifdp_ipdp_btb_way2_vld;              
wire    [1  :0]  ifdp_ipdp_btb_way3_pred;             
wire    [9  :0]  ifdp_ipdp_btb_way3_tag;              
wire    [19 :0]  ifdp_ipdp_btb_way3_target;           
wire             ifdp_ipdp_btb_way3_vld;              
wire    [13 :0]  ifdp_ipdp_h1_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h1_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h1_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h1_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h1_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h1_precode_way1;           
wire    [13 :0]  ifdp_ipdp_h2_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h2_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h2_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h2_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h2_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h2_precode_way1;           
wire    [13 :0]  ifdp_ipdp_h3_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h3_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h3_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h3_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h3_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h3_precode_way1;           
wire    [13 :0]  ifdp_ipdp_h4_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h4_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h4_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h4_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h4_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h4_precode_way1;           
wire    [13 :0]  ifdp_ipdp_h5_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h5_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h5_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h5_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h5_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h5_precode_way1;           
wire    [13 :0]  ifdp_ipdp_h6_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h6_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h6_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h6_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h6_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h6_precode_way1;           
wire    [13 :0]  ifdp_ipdp_h7_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h7_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h7_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h7_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h7_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h7_precode_way1;           
wire    [13 :0]  ifdp_ipdp_h8_inst_high_way0;         
wire    [13 :0]  ifdp_ipdp_h8_inst_high_way1;         
wire    [1  :0]  ifdp_ipdp_h8_inst_low_way0;          
wire    [1  :0]  ifdp_ipdp_h8_inst_low_way1;          
wire    [3  :0]  ifdp_ipdp_h8_precode_way0;           
wire    [3  :0]  ifdp_ipdp_h8_precode_way1;           
wire             ifdp_ipdp_l0_btb_counter;            
wire    [15 :0]  ifdp_ipdp_l0_btb_entry_hit;          
wire             ifdp_ipdp_l0_btb_hit;                
wire    [38 :0]  ifdp_ipdp_l0_btb_mispred_pc;         
wire             ifdp_ipdp_l0_btb_ras;                
wire    [38 :0]  ifdp_ipdp_l0_btb_target;             
wire             ifdp_ipdp_l0_btb_way0_high_hit;      
wire             ifdp_ipdp_l0_btb_way0_low_hit;       
wire             ifdp_ipdp_l0_btb_way1_high_hit;      
wire             ifdp_ipdp_l0_btb_way1_low_hit;       
wire             ifdp_ipdp_l0_btb_way2_high_hit;      
wire             ifdp_ipdp_l0_btb_way2_low_hit;       
wire             ifdp_ipdp_l0_btb_way3_high_hit;      
wire             ifdp_ipdp_l0_btb_way3_low_hit;       
wire    [1  :0]  ifdp_ipdp_l0_btb_way_pred;           
wire             ifdp_ipdp_mmu_pgflt;                 
wire    [2  :0]  ifdp_ipdp_sfp_hit_pc_lo;             
wire    [3  :0]  ifdp_ipdp_sfp_hit_type;              
wire             ifdp_ipdp_sfp_pc_hit;                
wire    [38 :0]  ifdp_ipdp_vpc;                       
wire             ifdp_l1_refill_bufferable;           
wire             ifdp_l1_refill_cacheable;            
wire             ifdp_l1_refill_fifo;                 
wire             ifdp_l1_refill_machine_mode;         
wire             ifdp_l1_refill_secure;               
wire             ifdp_l1_refill_supv_mode;            
wire             ifdp_l1_refill_tsize;                
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
wire             ifu_hpcp_icache_miss_pre;            
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
wire             ifu_no_op_req;                       
wire    [38 :0]  ifu_rtu_cur_pc;                      
wire             ifu_rtu_cur_pc_load;                 
wire             ifu_xx_sync_reset;                   
wire             ifu_yy_xx_no_op;                     
wire    [22 :0]  ind_btb_ibctrl_dout;                 
wire    [1  :0]  ind_btb_ibctrl_priv_mode;            
wire             ind_btb_ifctrl_inv_done;             
wire             ind_btb_ifctrl_inv_on;               
wire    [3  :0]  ipb_debug_req_cur_st;                
wire    [2  :0]  ipb_debug_wb_cur_st;                 
wire    [33 :0]  ipb_icache_if_index;                 
wire             ipb_icache_if_req;                   
wire             ipb_icache_if_req_for_gateclk;       
wire             ipb_ifctrl_prefetch_idle;            
wire             ipb_l1_refill_data_vld;              
wire             ipb_l1_refill_grnt;                  
wire    [127:0]  ipb_l1_refill_rdata;                 
wire             ipb_l1_refill_trans_err;             
wire             ipctrl_bht_con_br_gateclk_en;        
wire             ipctrl_bht_con_br_taken;             
wire             ipctrl_bht_con_br_vld;               
wire             ipctrl_bht_more_br;                  
wire             ipctrl_bht_vld;                      
wire             ipctrl_btb_chgflw_vld;               
wire    [1  :0]  ipctrl_btb_way_pred;                 
wire             ipctrl_btb_way_pred_error;           
wire             ipctrl_debug_bry_missigned_stall;    
wire             ipctrl_debug_h0_vld;                 
wire             ipctrl_debug_ip_expt_vld;            
wire             ipctrl_debug_ip_if_stall;            
wire             ipctrl_debug_ip_vld;                 
wire             ipctrl_debug_miss_under_refill_stall; 
wire             ipctrl_ibctrl_expt_vld;              
wire             ipctrl_ibctrl_if_chgflw_vld;         
wire             ipctrl_ibctrl_ip_chgflw_vld;         
wire             ipctrl_ibctrl_l0_btb_hit;            
wire             ipctrl_ibctrl_l0_btb_mispred;        
wire             ipctrl_ibctrl_l0_btb_miss;           
wire             ipctrl_ibctrl_l0_btb_st_wait;        
wire             ipctrl_ibctrl_vld;                   
wire             ipctrl_ibdp_expt_vld;                
wire             ipctrl_ibdp_vld;                     
wire             ipctrl_ifctrl_bht_stall;             
wire             ipctrl_ifctrl_stall;                 
wire             ipctrl_ifctrl_stall_short;           
wire             ipctrl_ifdp_gateclk_en;              
wire    [7  :0]  ipctrl_ifdp_vpc_onehot_updt;         
wire             ipctrl_ifdp_w0_bry0_hit_updt;        
wire             ipctrl_ifdp_w0_bry1_hit_updt;        
wire    [7  :0]  ipctrl_ifdp_w0b0_br_ntake_updt;      
wire    [7  :0]  ipctrl_ifdp_w0b0_br_taken_updt;      
wire    [7  :0]  ipctrl_ifdp_w0b0_bry_updt_data;      
wire    [7  :0]  ipctrl_ifdp_w0b1_br_ntake_updt;      
wire    [7  :0]  ipctrl_ifdp_w0b1_br_taken_updt;      
wire    [7  :0]  ipctrl_ifdp_w0b1_bry_updt_data;      
wire             ipctrl_ifdp_w1_bry0_hit_updt;        
wire             ipctrl_ifdp_w1_bry1_hit_updt;        
wire    [7  :0]  ipctrl_ifdp_w1b0_br_ntake_updt;      
wire    [7  :0]  ipctrl_ifdp_w1b0_br_taken_updt;      
wire    [7  :0]  ipctrl_ifdp_w1b0_bry_updt_data;      
wire    [7  :0]  ipctrl_ifdp_w1b1_br_ntake_updt;      
wire    [7  :0]  ipctrl_ifdp_w1b1_br_taken_updt;      
wire    [7  :0]  ipctrl_ifdp_w1b1_bry_updt_data;      
wire             ipctrl_ind_btb_con_br_vld;           
wire             ipctrl_ipdp_bht_vld;                 
wire             ipctrl_ipdp_br_more_than_one_stall;  
wire    [7  :0]  ipctrl_ipdp_branch;                  
wire    [7  :0]  ipctrl_ipdp_bry_data;                
wire    [38 :0]  ipctrl_ipdp_chgflw_pc;               
wire             ipctrl_ipdp_con_br;                  
wire             ipctrl_ipdp_h0_update_vld;           
wire             ipctrl_ipdp_h0_updt_gateclk_en;      
wire    [7  :0]  ipctrl_ipdp_hn_con_br;               
wire             ipctrl_ipdp_icache_way0_hit;         
wire             ipctrl_ipdp_icache_way0_hit_short;   
wire             ipctrl_ipdp_if_pcload;               
wire             ipctrl_ipdp_ip_data_vld;             
wire             ipctrl_ipdp_ip_mistaken;             
wire             ipctrl_ipdp_ip_pcload;               
wire             ipctrl_ipdp_l0_btb_hit;              
wire             ipctrl_ipdp_pipe_cancel;             
wire             ipctrl_ipdp_pipe_stall;              
wire             ipctrl_ipdp_pipe_vld;                
wire             ipctrl_ipdp_pipe_vld_for_gateclk;    
wire             ipctrl_ipdp_self_stall;              
wire    [7  :0]  ipctrl_ipdp_vpc_mask;                
wire    [2  :0]  ipctrl_ipdp_vpc_next;                
wire    [7  :0]  ipctrl_ipdp_vpc_onehot;              
wire             ipctrl_l0_btb_chgflw_vld;            
wire             ipctrl_l0_btb_ip_vld;                
wire             ipctrl_l0_btb_wait_next;             
wire             ipctrl_l1_refill_chk_err;            
wire             ipctrl_l1_refill_fifo;               
wire             ipctrl_l1_refill_miss_req;           
wire    [38 :0]  ipctrl_l1_refill_ppc;                
wire             ipctrl_l1_refill_req_for_gateclk;    
wire    [38 :0]  ipctrl_l1_refill_vpc;                
wire             ipctrl_pcgen_branch_mistaken;        
wire             ipctrl_pcgen_branch_taken;           
wire    [38 :0]  ipctrl_pcgen_chgflw_pc;              
wire             ipctrl_pcgen_chgflw_pcload;          
wire    [1  :0]  ipctrl_pcgen_chgflw_way_pred;        
wire             ipctrl_pcgen_chk_err_reissue;        
wire             ipctrl_pcgen_h0_vld;                 
wire             ipctrl_pcgen_if_stall;               
wire             ipctrl_pcgen_inner_way0;             
wire             ipctrl_pcgen_inner_way1;             
wire    [1  :0]  ipctrl_pcgen_inner_way_pred;         
wire    [38 :0]  ipctrl_pcgen_reissue_pc;             
wire             ipctrl_pcgen_reissue_pcload;         
wire    [1  :0]  ipctrl_pcgen_reissue_way_pred;       
wire    [38 :0]  ipctrl_pcgen_taken_pc;               
wire             ipdp_bht_h0_con_br;                  
wire    [38 :0]  ipdp_bht_vpc;                        
wire    [38 :0]  ipdp_btb_index_pc;                   
wire    [19 :0]  ipdp_btb_target_pc;                  
wire    [1  :0]  ipdp_ibdp_bht_pre_result;            
wire             ipdp_ibdp_bht_result;                
wire    [1  :0]  ipdp_ibdp_bht_sel_result;            
wire    [38 :0]  ipdp_ibdp_branch_base;               
wire             ipdp_ibdp_branch_btb_miss;           
wire    [20 :0]  ipdp_ibdp_branch_offset;             
wire    [38 :0]  ipdp_ibdp_branch_result;             
wire    [7  :0]  ipdp_ibdp_branch_vl;                 
wire    [1  :0]  ipdp_ibdp_branch_vlmul;              
wire    [2  :0]  ipdp_ibdp_branch_vsew;               
wire    [1  :0]  ipdp_ibdp_branch_way_pred;           
wire    [38 :0]  ipdp_ibdp_btb_index_pc;              
wire    [7  :0]  ipdp_ibdp_chgflw_mask;               
wire    [3  :0]  ipdp_ibdp_chgflw_num;                
wire             ipdp_ibdp_chgflw_num_vld;            
wire    [7  :0]  ipdp_ibdp_chgflw_vl;                 
wire    [1  :0]  ipdp_ibdp_chgflw_vlmul;              
wire    [2  :0]  ipdp_ibdp_chgflw_vsew;               
wire    [38 :0]  ipdp_ibdp_con_br_cur_pc;             
wire    [3  :0]  ipdp_ibdp_con_br_half_num;           
wire             ipdp_ibdp_con_br_inst_32;            
wire    [3  :0]  ipdp_ibdp_con_br_num;                
wire             ipdp_ibdp_con_br_num_vld;            
wire    [20 :0]  ipdp_ibdp_con_br_offset;             
wire             ipdp_ibdp_h0_bkpta;                  
wire             ipdp_ibdp_h0_bkptb;                  
wire             ipdp_ibdp_h0_con_br;                 
wire    [35 :0]  ipdp_ibdp_h0_cur_pc;                 
wire    [15 :0]  ipdp_ibdp_h0_data;                   
wire             ipdp_ibdp_h0_fence;                  
wire             ipdp_ibdp_h0_high_expt;              
wire             ipdp_ibdp_h0_ldst;                   
wire             ipdp_ibdp_h0_no_spec;                
wire             ipdp_ibdp_h0_spe_vld;                
wire             ipdp_ibdp_h0_split0;                 
wire    [2  :0]  ipdp_ibdp_h0_split0_type;            
wire             ipdp_ibdp_h0_split1;                 
wire    [2  :0]  ipdp_ibdp_h0_split1_type;            
wire    [7  :0]  ipdp_ibdp_h0_vl;                     
wire             ipdp_ibdp_h0_vl_pred;                
wire             ipdp_ibdp_h0_vld;                    
wire    [1  :0]  ipdp_ibdp_h0_vlmul;                  
wire             ipdp_ibdp_h0_vsetvli;                
wire    [2  :0]  ipdp_ibdp_h0_vsew;                   
wire    [2  :0]  ipdp_ibdp_h1_base;                   
wire    [15 :0]  ipdp_ibdp_h1_data;                   
wire    [2  :0]  ipdp_ibdp_h1_split0_type;            
wire    [2  :0]  ipdp_ibdp_h1_split1_type;            
wire    [7  :0]  ipdp_ibdp_h1_vl;                     
wire    [1  :0]  ipdp_ibdp_h1_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h1_vsew;                   
wire    [2  :0]  ipdp_ibdp_h2_base;                   
wire    [15 :0]  ipdp_ibdp_h2_data;                   
wire    [2  :0]  ipdp_ibdp_h2_split0_type;            
wire    [2  :0]  ipdp_ibdp_h2_split1_type;            
wire    [7  :0]  ipdp_ibdp_h2_vl;                     
wire    [1  :0]  ipdp_ibdp_h2_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h2_vsew;                   
wire    [2  :0]  ipdp_ibdp_h3_base;                   
wire    [15 :0]  ipdp_ibdp_h3_data;                   
wire    [2  :0]  ipdp_ibdp_h3_split0_type;            
wire    [2  :0]  ipdp_ibdp_h3_split1_type;            
wire    [7  :0]  ipdp_ibdp_h3_vl;                     
wire    [1  :0]  ipdp_ibdp_h3_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h3_vsew;                   
wire    [2  :0]  ipdp_ibdp_h4_base;                   
wire    [15 :0]  ipdp_ibdp_h4_data;                   
wire    [2  :0]  ipdp_ibdp_h4_split0_type;            
wire    [2  :0]  ipdp_ibdp_h4_split1_type;            
wire    [7  :0]  ipdp_ibdp_h4_vl;                     
wire    [1  :0]  ipdp_ibdp_h4_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h4_vsew;                   
wire    [2  :0]  ipdp_ibdp_h5_base;                   
wire    [15 :0]  ipdp_ibdp_h5_data;                   
wire    [2  :0]  ipdp_ibdp_h5_split0_type;            
wire    [2  :0]  ipdp_ibdp_h5_split1_type;            
wire    [7  :0]  ipdp_ibdp_h5_vl;                     
wire    [1  :0]  ipdp_ibdp_h5_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h5_vsew;                   
wire    [2  :0]  ipdp_ibdp_h6_base;                   
wire    [15 :0]  ipdp_ibdp_h6_data;                   
wire    [2  :0]  ipdp_ibdp_h6_split0_type;            
wire    [2  :0]  ipdp_ibdp_h6_split1_type;            
wire    [7  :0]  ipdp_ibdp_h6_vl;                     
wire    [1  :0]  ipdp_ibdp_h6_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h6_vsew;                   
wire    [2  :0]  ipdp_ibdp_h7_base;                   
wire    [15 :0]  ipdp_ibdp_h7_data;                   
wire    [2  :0]  ipdp_ibdp_h7_split0_type;            
wire    [2  :0]  ipdp_ibdp_h7_split1_type;            
wire    [7  :0]  ipdp_ibdp_h7_vl;                     
wire    [1  :0]  ipdp_ibdp_h7_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h7_vsew;                   
wire    [2  :0]  ipdp_ibdp_h8_base;                   
wire    [15 :0]  ipdp_ibdp_h8_data;                   
wire    [2  :0]  ipdp_ibdp_h8_split0_type;            
wire    [2  :0]  ipdp_ibdp_h8_split1_type;            
wire    [7  :0]  ipdp_ibdp_h8_vl;                     
wire    [1  :0]  ipdp_ibdp_h8_vlmul;                  
wire    [2  :0]  ipdp_ibdp_h8_vsew;                   
wire    [7  :0]  ipdp_ibdp_hn_32_start;               
wire    [7  :0]  ipdp_ibdp_hn_ab_br;                  
wire             ipdp_ibdp_hn_acc_err;                
wire    [7  :0]  ipdp_ibdp_hn_auipc;                  
wire    [7  :0]  ipdp_ibdp_hn_bkpta;                  
wire             ipdp_ibdp_hn_bkpta_vld;              
wire    [7  :0]  ipdp_ibdp_hn_bkptb;                  
wire             ipdp_ibdp_hn_bkptb_vld;              
wire    [7  :0]  ipdp_ibdp_hn_chgflw;                 
wire    [7  :0]  ipdp_ibdp_hn_con_br;                 
wire    [7  :0]  ipdp_ibdp_hn_dst_vld;                
wire    [7  :0]  ipdp_ibdp_hn_fence;                  
wire    [7  :0]  ipdp_ibdp_hn_ind_br;                 
wire    [7  :0]  ipdp_ibdp_hn_jal;                    
wire    [7  :0]  ipdp_ibdp_hn_jalr;                   
wire    [7  :0]  ipdp_ibdp_hn_ldst;                   
wire             ipdp_ibdp_hn_mmu_acc_deny;           
wire    [7  :0]  ipdp_ibdp_hn_no_spec;                
wire             ipdp_ibdp_hn_no_spec_vld;            
wire    [7  :0]  ipdp_ibdp_hn_pc_oper;                
wire    [7  :0]  ipdp_ibdp_hn_pcall;                  
wire             ipdp_ibdp_hn_pgflt;                  
wire    [7  :0]  ipdp_ibdp_hn_preturn;                
wire    [7  :0]  ipdp_ibdp_hn_split0;                 
wire    [7  :0]  ipdp_ibdp_hn_split1;                 
wire    [7  :0]  ipdp_ibdp_hn_vl_pred;                
wire    [7  :0]  ipdp_ibdp_hn_vld;                    
wire    [7  :0]  ipdp_ibdp_hn_vsetvli;                
wire    [20 :0]  ipdp_ibdp_ind_br_offset;             
wire    [15 :0]  ipdp_ibdp_l0_btb_entry_hit;          
wire             ipdp_ibdp_l0_btb_hit;                
wire    [38 :0]  ipdp_ibdp_l0_btb_mispred_pc;         
wire             ipdp_ibdp_l0_btb_ras;                
wire             ipdp_ibdp_l0_btb_ras_pc_hit;         
wire             ipdp_ibdp_l0_btb_update_cnt_bit;     
wire             ipdp_ibdp_l0_btb_update_vld;         
wire             ipdp_ibdp_l0_btb_update_vld_bit;     
wire    [3  :0]  ipdp_ibdp_l0_btb_wen;                
wire    [3  :0]  ipdp_ibdp_no_chgflw_num;             
wire    [38 :0]  ipdp_ibdp_ras_push_pc;               
wire    [38 :0]  ipdp_ibdp_ras_target_pc;             
wire    [21 :0]  ipdp_ibdp_vghr;                      
wire    [7  :0]  ipdp_ibdp_vl_reg;                    
wire    [1  :0]  ipdp_ibdp_vlmul_reg;                 
wire    [38 :0]  ipdp_ibdp_vpc;                       
wire    [2  :0]  ipdp_ibdp_vsew_reg;                  
wire             ipdp_ind_btb_jmp_detect;             
wire    [1  :0]  ipdp_ipctrl_bht_data;                
wire             ipdp_ipctrl_bht_result;              
wire    [1  :0]  ipdp_ipctrl_btb_way0_pred;           
wire    [19 :0]  ipdp_ipctrl_btb_way0_target;         
wire    [1  :0]  ipdp_ipctrl_btb_way1_pred;           
wire    [19 :0]  ipdp_ipctrl_btb_way1_target;         
wire    [1  :0]  ipdp_ipctrl_btb_way2_pred;           
wire    [19 :0]  ipdp_ipctrl_btb_way2_target;         
wire    [1  :0]  ipdp_ipctrl_btb_way3_pred;           
wire    [19 :0]  ipdp_ipctrl_btb_way3_target;         
wire             ipdp_ipctrl_con_br_first_branch;     
wire             ipdp_ipctrl_con_br_more_than_one;    
wire             ipdp_ipctrl_h0_ab_br;                
wire             ipdp_ipctrl_h0_br;                   
wire             ipdp_ipctrl_h0_con_br;               
wire             ipdp_ipctrl_h0_vld;                  
wire             ipdp_ipctrl_h8_br;                   
wire    [7  :0]  ipdp_ipctrl_inst_32;                 
wire             ipdp_ipctrl_ip_expt_vld;             
wire    [3  :0]  ipdp_ipctrl_l0_btb_hit_way;          
wire    [38 :0]  ipdp_ipctrl_l0_btb_mispred_pc;       
wire             ipdp_ipctrl_l0_btb_ras;              
wire             ipdp_ipctrl_l0_btb_vld;              
wire             ipdp_ipctrl_no_br;                   
wire    [38 :0]  ipdp_ipctrl_vpc;                     
wire    [7  :0]  ipdp_ipctrl_w0_ab_br;                
wire    [7  :0]  ipdp_ipctrl_w0_br;                   
wire    [7  :0]  ipdp_ipctrl_w1_ab_br;                
wire    [7  :0]  ipdp_ipctrl_w1_br;                   
wire    [7  :0]  ipdp_ipctrl_way0_32;                 
wire    [7  :0]  ipdp_ipctrl_way1_32;                 
wire    [38 :0]  ipdp_l0_btb_ras_pc;                  
wire             ipdp_l0_btb_ras_push;                
wire    [7  :0]  ipdp_lbuf_vl_reg;                    
wire    [1  :0]  ipdp_lbuf_vlmul_reg;                 
wire    [2  :0]  ipdp_lbuf_vsew_reg;                  
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
wire    [1  :0]  l0_btb_debug_cur_state;              
wire    [15 :0]  l0_btb_ibdp_entry_fifo;              
wire    [38 :0]  l0_btb_ifctrl_chgflw_pc;             
wire    [1  :0]  l0_btb_ifctrl_chgflw_way_pred;       
wire             l0_btb_ifctrl_chglfw_vld;            
wire    [38 :0]  l0_btb_ifdp_chgflw_pc;               
wire    [1  :0]  l0_btb_ifdp_chgflw_way_pred;         
wire             l0_btb_ifdp_counter;                 
wire    [15 :0]  l0_btb_ifdp_entry_hit;               
wire             l0_btb_ifdp_hit;                     
wire             l0_btb_ifdp_ras;                     
wire             l0_btb_ipctrl_st_wait;               
wire             l0_btb_update_vld_for_gateclk;       
wire    [3  :0]  l1_refill_debug_refill_st;           
wire             l1_refill_icache_if_fifo;            
wire             l1_refill_icache_if_first;           
wire    [38 :0]  l1_refill_icache_if_index;           
wire    [127:0]  l1_refill_icache_if_inst_data;       
wire             l1_refill_icache_if_last;            
wire    [31 :0]  l1_refill_icache_if_pre_code;        
wire    [27 :0]  l1_refill_icache_if_ptag;            
wire             l1_refill_icache_if_wr;              
wire             l1_refill_ifctrl_ctc;                
wire             l1_refill_ifctrl_idle;               
wire    [38 :0]  l1_refill_ifctrl_pc;                 
wire             l1_refill_ifctrl_refill_on;          
wire             l1_refill_ifctrl_reissue;            
wire             l1_refill_ifctrl_start;              
wire             l1_refill_ifctrl_start_for_gateclk;  
wire             l1_refill_ifctrl_trans_cmplt;        
wire             l1_refill_ifdp_acc_err;              
wire    [127:0]  l1_refill_ifdp_inst_data;            
wire    [31 :0]  l1_refill_ifdp_precode;              
wire             l1_refill_ifdp_refill_on;            
wire    [28 :0]  l1_refill_ifdp_tag_data;             
wire             l1_refill_inv_wfd_back;              
wire             l1_refill_ipb_bufferable;            
wire             l1_refill_ipb_cacheable;             
wire             l1_refill_ipb_ctc_inv;               
wire             l1_refill_ipb_machine_mode;          
wire    [39 :0]  l1_refill_ipb_ppc;                   
wire             l1_refill_ipb_pre_cancel;            
wire             l1_refill_ipb_refill_on;             
wire             l1_refill_ipb_req;                   
wire             l1_refill_ipb_req_for_gateclk;       
wire             l1_refill_ipb_req_pre;               
wire             l1_refill_ipb_secure;                
wire             l1_refill_ipb_supv_mode;             
wire             l1_refill_ipb_tsize;                 
wire    [39 :0]  l1_refill_ipb_vpc;                   
wire             l1_refill_ipctrl_busy;               
wire             lbuf_addrgen_active_state;           
wire             lbuf_addrgen_cache_state;            
wire             lbuf_addrgen_chgflw_mask;            
wire             lbuf_bht_active_state;               
wire             lbuf_bht_con_br_taken;               
wire             lbuf_bht_con_br_vld;                 
wire    [5  :0]  lbuf_debug_st;                       
wire             lbuf_ibctrl_active_idle_flush;       
wire    [38 :0]  lbuf_ibctrl_chgflw_pc;               
wire    [1  :0]  lbuf_ibctrl_chgflw_pred;             
wire    [7  :0]  lbuf_ibctrl_chgflw_vl;               
wire             lbuf_ibctrl_chgflw_vld;              
wire    [1  :0]  lbuf_ibctrl_chgflw_vlmul;            
wire    [2  :0]  lbuf_ibctrl_chgflw_vsew;             
wire             lbuf_ibctrl_lbuf_active;             
wire             lbuf_ibctrl_stall;                   
wire    [31 :0]  lbuf_ibdp_inst0;                     
wire             lbuf_ibdp_inst0_bkpta;               
wire             lbuf_ibdp_inst0_bkptb;               
wire             lbuf_ibdp_inst0_fence;               
wire    [14 :0]  lbuf_ibdp_inst0_pc;                  
wire             lbuf_ibdp_inst0_split0;              
wire             lbuf_ibdp_inst0_split1;              
wire             lbuf_ibdp_inst0_valid;               
wire    [7  :0]  lbuf_ibdp_inst0_vl;                  
wire    [1  :0]  lbuf_ibdp_inst0_vlmul;               
wire    [2  :0]  lbuf_ibdp_inst0_vsew;                
wire    [31 :0]  lbuf_ibdp_inst1;                     
wire             lbuf_ibdp_inst1_bkpta;               
wire             lbuf_ibdp_inst1_bkptb;               
wire             lbuf_ibdp_inst1_fence;               
wire    [14 :0]  lbuf_ibdp_inst1_pc;                  
wire             lbuf_ibdp_inst1_split0;              
wire             lbuf_ibdp_inst1_split1;              
wire             lbuf_ibdp_inst1_valid;               
wire    [7  :0]  lbuf_ibdp_inst1_vl;                  
wire    [1  :0]  lbuf_ibdp_inst1_vlmul;               
wire    [2  :0]  lbuf_ibdp_inst1_vsew;                
wire    [31 :0]  lbuf_ibdp_inst2;                     
wire             lbuf_ibdp_inst2_bkpta;               
wire             lbuf_ibdp_inst2_bkptb;               
wire             lbuf_ibdp_inst2_fence;               
wire    [14 :0]  lbuf_ibdp_inst2_pc;                  
wire             lbuf_ibdp_inst2_split0;              
wire             lbuf_ibdp_inst2_split1;              
wire             lbuf_ibdp_inst2_valid;               
wire    [7  :0]  lbuf_ibdp_inst2_vl;                  
wire    [1  :0]  lbuf_ibdp_inst2_vlmul;               
wire    [2  :0]  lbuf_ibdp_inst2_vsew;                
wire             lbuf_ipdp_lbuf_active;               
wire    [7  :0]  lbuf_ipdp_updt_vl;                   
wire    [1  :0]  lbuf_ipdp_updt_vlmul;                
wire    [2  :0]  lbuf_ipdp_updt_vsew;                 
wire             lbuf_ipdp_vtype_updt_vld;            
wire             lbuf_pcfifo_if_create_select;        
wire    [1  :0]  lbuf_pcfifo_if_inst_bht_pre_result;  
wire    [1  :0]  lbuf_pcfifo_if_inst_bht_sel_result;  
wire    [38 :0]  lbuf_pcfifo_if_inst_cur_pc;          
wire             lbuf_pcfifo_if_inst_pc_oper;         
wire    [38 :0]  lbuf_pcfifo_if_inst_target_pc;       
wire    [21 :0]  lbuf_pcfifo_if_inst_vghr;            
wire             lbuf_pcgen_active;                   
wire             lbuf_pcgen_vld_mask;                 
wire             lsu_ifu_icache_all_inv;              
wire    [5  :0]  lsu_ifu_icache_index;                
wire             lsu_ifu_icache_line_inv;             
wire    [27 :0]  lsu_ifu_icache_ptag;                 
wire             mmu_ifu_buf;                         
wire             mmu_ifu_ca;                          
wire             mmu_ifu_deny;                        
wire    [27 :0]  mmu_ifu_pa;                          
wire             mmu_ifu_pavld;                       
wire             mmu_ifu_pgflt;                       
wire             mmu_ifu_sec;                         
wire             mmu_xx_mmu_en;                       
wire             pad_yy_icg_scan_en;                  
wire             pcfifo_if_ibctrl_more_than_two;      
wire    [7  :0]  pcfifo_if_ibdp_over_mask;            
wire             pcgen_addrgen_cancel;                
wire             pcgen_bht_chgflw;                    
wire             pcgen_bht_chgflw_short;              
wire    [6  :0]  pcgen_bht_ifpc;                      
wire    [9  :0]  pcgen_bht_pcindex;                   
wire             pcgen_bht_seq_read;                  
wire             pcgen_btb_chgflw;                    
wire             pcgen_btb_chgflw_higher_than_addrgen; 
wire             pcgen_btb_chgflw_higher_than_if;     
wire             pcgen_btb_chgflw_higher_than_ip;     
wire             pcgen_btb_chgflw_short;              
wire    [9  :0]  pcgen_btb_index;                     
wire             pcgen_btb_stall;                     
wire             pcgen_btb_stall_short;               
wire             pcgen_debug_chgflw;                  
wire    [13 :0]  pcgen_debug_pcbus;                   
wire             pcgen_ibctrl_bju_chgflw;             
wire             pcgen_ibctrl_cancel;                 
wire             pcgen_ibctrl_ibuf_flush;             
wire             pcgen_ibctrl_lbuf_flush;             
wire             pcgen_icache_if_chgflw;              
wire             pcgen_icache_if_chgflw_bank0;        
wire             pcgen_icache_if_chgflw_bank1;        
wire             pcgen_icache_if_chgflw_bank2;        
wire             pcgen_icache_if_chgflw_bank3;        
wire             pcgen_icache_if_chgflw_short;        
wire             pcgen_icache_if_gateclk_en;          
wire    [15 :0]  pcgen_icache_if_index;               
wire             pcgen_icache_if_seq_data_req;        
wire             pcgen_icache_if_seq_data_req_short;  
wire             pcgen_icache_if_seq_tag_req;         
wire    [1  :0]  pcgen_icache_if_way_pred;            
wire             pcgen_ifctrl_cancel;                 
wire    [38 :0]  pcgen_ifctrl_pc;                     
wire             pcgen_ifctrl_pipe_cancel;            
wire             pcgen_ifctrl_reissue;                
wire    [1  :0]  pcgen_ifctrl_way_pred;               
wire             pcgen_ifctrl_way_pred_stall;         
wire    [38 :0]  pcgen_ifdp_inc_pc;                   
wire    [38 :0]  pcgen_ifdp_pc;                       
wire    [1  :0]  pcgen_ifdp_way_pred;                 
wire             pcgen_ipb_chgflw;                    
wire             pcgen_ipctrl_cancel;                 
wire             pcgen_ipctrl_pipe_cancel;            
wire             pcgen_l0_btb_chgflw_mask;            
wire    [14 :0]  pcgen_l0_btb_chgflw_pc;              
wire             pcgen_l0_btb_chgflw_vld;             
wire    [38 :0]  pcgen_l0_btb_if_pc;                  
wire             pcgen_l1_refill_chgflw;              
wire    [16 :0]  pcgen_sfp_pc;                        
wire             ras_ipdp_data_vld;                   
wire    [38 :0]  ras_ipdp_pc;                         
wire    [38 :0]  ras_l0_btb_pc;                       
wire    [38 :0]  ras_l0_btb_push_pc;                  
wire             ras_l0_btb_ras_push;                 
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
wire             rtu_yy_xx_dbgon;                     
wire    [2  :0]  sfp_ifdp_hit_pc_lo;                  
wire    [3  :0]  sfp_ifdp_hit_type;                   
wire             sfp_ifdp_pc_hit;                     
wire    [9  :0]  vector_debug_cur_st;                 
wire             vector_debug_reset_on;               
wire             vector_ifctrl_reset_on;              
wire             vector_ifctrl_sm_on;                 
wire             vector_ifctrl_sm_start;              
wire    [38 :0]  vector_pcgen_pc;                     
wire             vector_pcgen_pcload;                 
wire             vector_pcgen_reset_on;               
wire             vfdsu_ifu_debug_ex2_wait;            
wire             vfdsu_ifu_debug_idle;                
wire             vfdsu_ifu_debug_pipe_busy;           


//==========================================================
//            IFU Module Gated Cell
//==========================================================
//&Instance("gated_clk_cell","x_gated_cpuclk_cell_ifu");
// //&Connect( @32
// //  .clk_in               (forever_cpuclk          ), @33
// //  .clk_out              (cpuclk                  ), @34
// //  .external_en          (1'b0                    ), @35
// //  .global_en            (cp0_yy_clk_en           ), @36
// //  .local_en             (1'b1                    ), @37
// //  .module_en            (1'b1                    ), @38
// //  .pad_yy_bist_tst_en   (pad_yy_bist_tst_en     ), @39
// //  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b   ), @40
// //  .pad_yy_test_mode     (pad_yy_test_mode       ) @41
// //); @42

//==========================================================
//                IFU Module Instance
//==========================================================
// &Instance("ct_ifu_addrgen",        "x_ct_ifu_addrgen"); @47
ct_ifu_addrgen  x_ct_ifu_addrgen (
  .addrgen_btb_index             (addrgen_btb_index            ),
  .addrgen_btb_tag               (addrgen_btb_tag              ),
  .addrgen_btb_target_pc         (addrgen_btb_target_pc        ),
  .addrgen_btb_update_vld        (addrgen_btb_update_vld       ),
  .addrgen_ibctrl_cancel         (addrgen_ibctrl_cancel        ),
  .addrgen_ipdp_chgflw_vl        (addrgen_ipdp_chgflw_vl       ),
  .addrgen_ipdp_chgflw_vlmul     (addrgen_ipdp_chgflw_vlmul    ),
  .addrgen_ipdp_chgflw_vsew      (addrgen_ipdp_chgflw_vsew     ),
  .addrgen_l0_btb_update_entry   (addrgen_l0_btb_update_entry  ),
  .addrgen_l0_btb_update_vld     (addrgen_l0_btb_update_vld    ),
  .addrgen_l0_btb_update_vld_bit (addrgen_l0_btb_update_vld_bit),
  .addrgen_l0_btb_wen            (addrgen_l0_btb_wen           ),
  .addrgen_pcgen_pc              (addrgen_pcgen_pc             ),
  .addrgen_pcgen_pcload          (addrgen_pcgen_pcload         ),
  .addrgen_xx_pcload             (addrgen_xx_pcload            ),
  .cp0_ifu_icg_en                (cp0_ifu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ibdp_addrgen_branch_base      (ibdp_addrgen_branch_base     ),
  .ibdp_addrgen_branch_offset    (ibdp_addrgen_branch_offset   ),
  .ibdp_addrgen_branch_result    (ibdp_addrgen_branch_result   ),
  .ibdp_addrgen_branch_valid     (ibdp_addrgen_branch_valid    ),
  .ibdp_addrgen_branch_vl        (ibdp_addrgen_branch_vl       ),
  .ibdp_addrgen_branch_vlmul     (ibdp_addrgen_branch_vlmul    ),
  .ibdp_addrgen_branch_vsew      (ibdp_addrgen_branch_vsew     ),
  .ibdp_addrgen_btb_index_pc     (ibdp_addrgen_btb_index_pc    ),
  .ibdp_addrgen_l0_btb_hit       (ibdp_addrgen_l0_btb_hit      ),
  .ibdp_addrgen_l0_btb_hit_entry (ibdp_addrgen_l0_btb_hit_entry),
  .ifu_hpcp_btb_inst             (ifu_hpcp_btb_inst            ),
  .ifu_hpcp_btb_mispred          (ifu_hpcp_btb_mispred         ),
  .lbuf_addrgen_active_state     (lbuf_addrgen_active_state    ),
  .lbuf_addrgen_cache_state      (lbuf_addrgen_cache_state     ),
  .lbuf_addrgen_chgflw_mask      (lbuf_addrgen_chgflw_mask     ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pcgen_addrgen_cancel          (pcgen_addrgen_cancel         )
);

// &Instance("ct_ifu_bht",            "x_ct_ifu_bht"); @48
ct_ifu_bht  x_ct_ifu_bht (
  .bht_ifctrl_inv_done           (bht_ifctrl_inv_done          ),
  .bht_ifctrl_inv_on             (bht_ifctrl_inv_on            ),
  .bht_ind_btb_rtu_ghr           (bht_ind_btb_rtu_ghr          ),
  .bht_ind_btb_vghr              (bht_ind_btb_vghr             ),
  .bht_ipdp_pre_array_data_ntake (bht_ipdp_pre_array_data_ntake),
  .bht_ipdp_pre_array_data_taken (bht_ipdp_pre_array_data_taken),
  .bht_ipdp_pre_offset_onehot    (bht_ipdp_pre_offset_onehot   ),
  .bht_ipdp_sel_array_result     (bht_ipdp_sel_array_result    ),
  .bht_ipdp_vghr                 (bht_ipdp_vghr                ),
  .bht_lbuf_pre_ntaken_result    (bht_lbuf_pre_ntaken_result   ),
  .bht_lbuf_pre_taken_result     (bht_lbuf_pre_taken_result    ),
  .bht_lbuf_vghr                 (bht_lbuf_vghr                ),
  .cp0_ifu_bht_en                (cp0_ifu_bht_en               ),
  .cp0_ifu_icg_en                (cp0_ifu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ifctrl_bht_inv                (ifctrl_bht_inv               ),
  .ifctrl_bht_pipedown           (ifctrl_bht_pipedown          ),
  .ifctrl_bht_stall              (ifctrl_bht_stall             ),
  .ipctrl_bht_con_br_gateclk_en  (ipctrl_bht_con_br_gateclk_en ),
  .ipctrl_bht_con_br_taken       (ipctrl_bht_con_br_taken      ),
  .ipctrl_bht_con_br_vld         (ipctrl_bht_con_br_vld        ),
  .ipctrl_bht_more_br            (ipctrl_bht_more_br           ),
  .ipctrl_bht_vld                (ipctrl_bht_vld               ),
  .ipdp_bht_h0_con_br            (ipdp_bht_h0_con_br           ),
  .ipdp_bht_vpc                  (ipdp_bht_vpc                 ),
  .iu_ifu_bht_check_vld          (iu_ifu_bht_check_vld         ),
  .iu_ifu_bht_condbr_taken       (iu_ifu_bht_condbr_taken      ),
  .iu_ifu_bht_pred               (iu_ifu_bht_pred              ),
  .iu_ifu_chgflw_vld             (iu_ifu_chgflw_vld            ),
  .iu_ifu_chk_idx                (iu_ifu_chk_idx               ),
  .iu_ifu_cur_pc                 (iu_ifu_cur_pc                ),
  .lbuf_bht_active_state         (lbuf_bht_active_state        ),
  .lbuf_bht_con_br_taken         (lbuf_bht_con_br_taken        ),
  .lbuf_bht_con_br_vld           (lbuf_bht_con_br_vld          ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pcgen_bht_chgflw              (pcgen_bht_chgflw             ),
  .pcgen_bht_chgflw_short        (pcgen_bht_chgflw_short       ),
  .pcgen_bht_ifpc                (pcgen_bht_ifpc               ),
  .pcgen_bht_pcindex             (pcgen_bht_pcindex            ),
  .pcgen_bht_seq_read            (pcgen_bht_seq_read           ),
  .rtu_ifu_flush                 (rtu_ifu_flush                ),
  .rtu_ifu_retire0_condbr        (rtu_ifu_retire0_condbr       ),
  .rtu_ifu_retire0_condbr_taken  (rtu_ifu_retire0_condbr_taken ),
  .rtu_ifu_retire1_condbr        (rtu_ifu_retire1_condbr       ),
  .rtu_ifu_retire1_condbr_taken  (rtu_ifu_retire1_condbr_taken ),
  .rtu_ifu_retire2_condbr        (rtu_ifu_retire2_condbr       ),
  .rtu_ifu_retire2_condbr_taken  (rtu_ifu_retire2_condbr_taken )
);

// &Instance("ct_ifu_btb",            "x_ct_ifu_btb"); @49
ct_ifu_btb  x_ct_ifu_btb (
  .addrgen_btb_index                    (addrgen_btb_index                   ),
  .addrgen_btb_tag                      (addrgen_btb_tag                     ),
  .addrgen_btb_target_pc                (addrgen_btb_target_pc               ),
  .addrgen_btb_update_vld               (addrgen_btb_update_vld              ),
  .btb_ifctrl_inv_done                  (btb_ifctrl_inv_done                 ),
  .btb_ifctrl_inv_on                    (btb_ifctrl_inv_on                   ),
  .btb_ifdp_way0_pred                   (btb_ifdp_way0_pred                  ),
  .btb_ifdp_way0_tag                    (btb_ifdp_way0_tag                   ),
  .btb_ifdp_way0_target                 (btb_ifdp_way0_target                ),
  .btb_ifdp_way0_vld                    (btb_ifdp_way0_vld                   ),
  .btb_ifdp_way1_pred                   (btb_ifdp_way1_pred                  ),
  .btb_ifdp_way1_tag                    (btb_ifdp_way1_tag                   ),
  .btb_ifdp_way1_target                 (btb_ifdp_way1_target                ),
  .btb_ifdp_way1_vld                    (btb_ifdp_way1_vld                   ),
  .btb_ifdp_way2_pred                   (btb_ifdp_way2_pred                  ),
  .btb_ifdp_way2_tag                    (btb_ifdp_way2_tag                   ),
  .btb_ifdp_way2_target                 (btb_ifdp_way2_target                ),
  .btb_ifdp_way2_vld                    (btb_ifdp_way2_vld                   ),
  .btb_ifdp_way3_pred                   (btb_ifdp_way3_pred                  ),
  .btb_ifdp_way3_tag                    (btb_ifdp_way3_tag                   ),
  .btb_ifdp_way3_target                 (btb_ifdp_way3_target                ),
  .btb_ifdp_way3_vld                    (btb_ifdp_way3_vld                   ),
  .cp0_ifu_btb_en                       (cp0_ifu_btb_en                      ),
  .cp0_ifu_icg_en                       (cp0_ifu_icg_en                      ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .ibdp_btb_miss                        (ibdp_btb_miss                       ),
  .ifctrl_btb_inv                       (ifctrl_btb_inv                      ),
  .ipctrl_btb_chgflw_vld                (ipctrl_btb_chgflw_vld               ),
  .ipctrl_btb_way_pred                  (ipctrl_btb_way_pred                 ),
  .ipctrl_btb_way_pred_error            (ipctrl_btb_way_pred_error           ),
  .ipdp_btb_index_pc                    (ipdp_btb_index_pc                   ),
  .ipdp_btb_target_pc                   (ipdp_btb_target_pc                  ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pcgen_btb_chgflw                     (pcgen_btb_chgflw                    ),
  .pcgen_btb_chgflw_higher_than_addrgen (pcgen_btb_chgflw_higher_than_addrgen),
  .pcgen_btb_chgflw_higher_than_if      (pcgen_btb_chgflw_higher_than_if     ),
  .pcgen_btb_chgflw_higher_than_ip      (pcgen_btb_chgflw_higher_than_ip     ),
  .pcgen_btb_chgflw_short               (pcgen_btb_chgflw_short              ),
  .pcgen_btb_index                      (pcgen_btb_index                     ),
  .pcgen_btb_stall                      (pcgen_btb_stall                     ),
  .pcgen_btb_stall_short                (pcgen_btb_stall_short               )
);

// &Instance("ct_ifu_l0_btb",         "x_ct_ifu_l0_btb"); @50
ct_ifu_l0_btb  x_ct_ifu_l0_btb (
  .addrgen_l0_btb_update_entry   (addrgen_l0_btb_update_entry  ),
  .addrgen_l0_btb_update_vld     (addrgen_l0_btb_update_vld    ),
  .addrgen_l0_btb_update_vld_bit (addrgen_l0_btb_update_vld_bit),
  .addrgen_l0_btb_wen            (addrgen_l0_btb_wen           ),
  .cp0_ifu_btb_en                (cp0_ifu_btb_en               ),
  .cp0_ifu_icg_en                (cp0_ifu_icg_en               ),
  .cp0_ifu_l0btb_en              (cp0_ifu_l0btb_en             ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ibdp_l0_btb_fifo_update_vld   (ibdp_l0_btb_fifo_update_vld  ),
  .ibdp_l0_btb_update_cnt_bit    (ibdp_l0_btb_update_cnt_bit   ),
  .ibdp_l0_btb_update_data       (ibdp_l0_btb_update_data      ),
  .ibdp_l0_btb_update_entry      (ibdp_l0_btb_update_entry     ),
  .ibdp_l0_btb_update_ras_bit    (ibdp_l0_btb_update_ras_bit   ),
  .ibdp_l0_btb_update_vld        (ibdp_l0_btb_update_vld       ),
  .ibdp_l0_btb_update_vld_bit    (ibdp_l0_btb_update_vld_bit   ),
  .ibdp_l0_btb_wen               (ibdp_l0_btb_wen              ),
  .ifctrl_l0_btb_inv             (ifctrl_l0_btb_inv            ),
  .ifctrl_l0_btb_stall           (ifctrl_l0_btb_stall          ),
  .ipctrl_l0_btb_chgflw_vld      (ipctrl_l0_btb_chgflw_vld     ),
  .ipctrl_l0_btb_ip_vld          (ipctrl_l0_btb_ip_vld         ),
  .ipctrl_l0_btb_wait_next       (ipctrl_l0_btb_wait_next      ),
  .ipdp_l0_btb_ras_pc            (ipdp_l0_btb_ras_pc           ),
  .ipdp_l0_btb_ras_push          (ipdp_l0_btb_ras_push         ),
  .l0_btb_debug_cur_state        (l0_btb_debug_cur_state       ),
  .l0_btb_ibdp_entry_fifo        (l0_btb_ibdp_entry_fifo       ),
  .l0_btb_ifctrl_chgflw_pc       (l0_btb_ifctrl_chgflw_pc      ),
  .l0_btb_ifctrl_chgflw_way_pred (l0_btb_ifctrl_chgflw_way_pred),
  .l0_btb_ifctrl_chglfw_vld      (l0_btb_ifctrl_chglfw_vld     ),
  .l0_btb_ifdp_chgflw_pc         (l0_btb_ifdp_chgflw_pc        ),
  .l0_btb_ifdp_chgflw_way_pred   (l0_btb_ifdp_chgflw_way_pred  ),
  .l0_btb_ifdp_counter           (l0_btb_ifdp_counter          ),
  .l0_btb_ifdp_entry_hit         (l0_btb_ifdp_entry_hit        ),
  .l0_btb_ifdp_hit               (l0_btb_ifdp_hit              ),
  .l0_btb_ifdp_ras               (l0_btb_ifdp_ras              ),
  .l0_btb_ipctrl_st_wait         (l0_btb_ipctrl_st_wait        ),
  .l0_btb_update_vld_for_gateclk (l0_btb_update_vld_for_gateclk),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pcgen_l0_btb_chgflw_mask      (pcgen_l0_btb_chgflw_mask     ),
  .pcgen_l0_btb_chgflw_pc        (pcgen_l0_btb_chgflw_pc       ),
  .pcgen_l0_btb_chgflw_vld       (pcgen_l0_btb_chgflw_vld      ),
  .pcgen_l0_btb_if_pc            (pcgen_l0_btb_if_pc           ),
  .ras_l0_btb_pc                 (ras_l0_btb_pc                ),
  .ras_l0_btb_push_pc            (ras_l0_btb_push_pc           ),
  .ras_l0_btb_ras_push           (ras_l0_btb_ras_push          )
);

// &Instance("ct_ifu_sfp",            "x_ct_ifu_sfp"); @51
ct_ifu_sfp  x_ct_ifu_sfp (
  .cp0_ifu_icg_en                       (cp0_ifu_icg_en                      ),
  .cp0_ifu_nsfe                         (cp0_ifu_nsfe                        ),
  .cp0_ifu_vsetvli_pred_disable         (cp0_ifu_vsetvli_pred_disable        ),
  .cp0_ifu_vsetvli_pred_mode            (cp0_ifu_vsetvli_pred_mode           ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pcgen_sfp_pc                         (pcgen_sfp_pc                        ),
  .rtu_ifu_chgflw_vld                   (rtu_ifu_chgflw_vld                  ),
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
  .sfp_ifdp_hit_pc_lo                   (sfp_ifdp_hit_pc_lo                  ),
  .sfp_ifdp_hit_type                    (sfp_ifdp_hit_type                   ),
  .sfp_ifdp_pc_hit                      (sfp_ifdp_pc_hit                     )
);

// &Instance("ct_ifu_ibctrl",         "x_ct_ifu_ibctrl"); @52
ct_ifu_ibctrl  x_ct_ifu_ibctrl (
  .addrgen_ibctrl_cancel              (addrgen_ibctrl_cancel             ),
  .cp0_ifu_icg_en                     (cp0_ifu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ibctrl_debug_buf_stall             (ibctrl_debug_buf_stall            ),
  .ibctrl_debug_bypass_inst_vld       (ibctrl_debug_bypass_inst_vld      ),
  .ibctrl_debug_fifo_full_stall       (ibctrl_debug_fifo_full_stall      ),
  .ibctrl_debug_fifo_stall            (ibctrl_debug_fifo_stall           ),
  .ibctrl_debug_ib_expt_vld           (ibctrl_debug_ib_expt_vld          ),
  .ibctrl_debug_ib_ip_stall           (ibctrl_debug_ib_ip_stall          ),
  .ibctrl_debug_ib_vld                (ibctrl_debug_ib_vld               ),
  .ibctrl_debug_ibuf_empty            (ibctrl_debug_ibuf_empty           ),
  .ibctrl_debug_ibuf_full             (ibctrl_debug_ibuf_full            ),
  .ibctrl_debug_ibuf_inst_vld         (ibctrl_debug_ibuf_inst_vld        ),
  .ibctrl_debug_ind_btb_stall         (ibctrl_debug_ind_btb_stall        ),
  .ibctrl_debug_lbuf_inst_vld         (ibctrl_debug_lbuf_inst_vld        ),
  .ibctrl_debug_mispred_stall         (ibctrl_debug_mispred_stall        ),
  .ibctrl_ibdp_buf_stall              (ibctrl_ibdp_buf_stall             ),
  .ibctrl_ibdp_bypass_inst_vld        (ibctrl_ibdp_bypass_inst_vld       ),
  .ibctrl_ibdp_cancel                 (ibctrl_ibdp_cancel                ),
  .ibctrl_ibdp_chgflw                 (ibctrl_ibdp_chgflw                ),
  .ibctrl_ibdp_fifo_full_stall        (ibctrl_ibdp_fifo_full_stall       ),
  .ibctrl_ibdp_fifo_stall             (ibctrl_ibdp_fifo_stall            ),
  .ibctrl_ibdp_ibuf_inst_vld          (ibctrl_ibdp_ibuf_inst_vld         ),
  .ibctrl_ibdp_if_chgflw_vld          (ibctrl_ibdp_if_chgflw_vld         ),
  .ibctrl_ibdp_ind_btb_rd_stall       (ibctrl_ibdp_ind_btb_rd_stall      ),
  .ibctrl_ibdp_ip_chgflw_vld          (ibctrl_ibdp_ip_chgflw_vld         ),
  .ibctrl_ibdp_l0_btb_hit             (ibctrl_ibdp_l0_btb_hit            ),
  .ibctrl_ibdp_l0_btb_mispred         (ibctrl_ibdp_l0_btb_mispred        ),
  .ibctrl_ibdp_l0_btb_miss            (ibctrl_ibdp_l0_btb_miss           ),
  .ibctrl_ibdp_l0_btb_wait            (ibctrl_ibdp_l0_btb_wait           ),
  .ibctrl_ibdp_lbuf_inst_vld          (ibctrl_ibdp_lbuf_inst_vld         ),
  .ibctrl_ibdp_mispred_stall          (ibctrl_ibdp_mispred_stall         ),
  .ibctrl_ibdp_self_stall             (ibctrl_ibdp_self_stall            ),
  .ibctrl_ibuf_bypass_not_select      (ibctrl_ibuf_bypass_not_select     ),
  .ibctrl_ibuf_create_vld             (ibctrl_ibuf_create_vld            ),
  .ibctrl_ibuf_data_vld               (ibctrl_ibuf_data_vld              ),
  .ibctrl_ibuf_flush                  (ibctrl_ibuf_flush                 ),
  .ibctrl_ibuf_merge_vld              (ibctrl_ibuf_merge_vld             ),
  .ibctrl_ibuf_retire_vld             (ibctrl_ibuf_retire_vld            ),
  .ibctrl_ind_btb_check_vld           (ibctrl_ind_btb_check_vld          ),
  .ibctrl_ind_btb_fifo_stall          (ibctrl_ind_btb_fifo_stall         ),
  .ibctrl_ind_btb_path                (ibctrl_ind_btb_path               ),
  .ibctrl_ipctrl_low_power_stall      (ibctrl_ipctrl_low_power_stall     ),
  .ibctrl_ipctrl_stall                (ibctrl_ipctrl_stall               ),
  .ibctrl_ipdp_chgflw_vl              (ibctrl_ipdp_chgflw_vl             ),
  .ibctrl_ipdp_chgflw_vlmul           (ibctrl_ipdp_chgflw_vlmul          ),
  .ibctrl_ipdp_chgflw_vsew            (ibctrl_ipdp_chgflw_vsew           ),
  .ibctrl_ipdp_pcload                 (ibctrl_ipdp_pcload                ),
  .ibctrl_lbuf_bju_mispred            (ibctrl_lbuf_bju_mispred           ),
  .ibctrl_lbuf_create_vld             (ibctrl_lbuf_create_vld            ),
  .ibctrl_lbuf_flush                  (ibctrl_lbuf_flush                 ),
  .ibctrl_lbuf_retire_vld             (ibctrl_lbuf_retire_vld            ),
  .ibctrl_pcfifo_if_create_vld        (ibctrl_pcfifo_if_create_vld       ),
  .ibctrl_pcfifo_if_ind_btb_miss      (ibctrl_pcfifo_if_ind_btb_miss     ),
  .ibctrl_pcfifo_if_ind_target_pc     (ibctrl_pcfifo_if_ind_target_pc    ),
  .ibctrl_pcfifo_if_ras_target_pc     (ibctrl_pcfifo_if_ras_target_pc    ),
  .ibctrl_pcfifo_if_ras_vld           (ibctrl_pcfifo_if_ras_vld          ),
  .ibctrl_pcgen_ip_stall              (ibctrl_pcgen_ip_stall             ),
  .ibctrl_pcgen_pc                    (ibctrl_pcgen_pc                   ),
  .ibctrl_pcgen_pcload                (ibctrl_pcgen_pcload               ),
  .ibctrl_pcgen_pcload_vld            (ibctrl_pcgen_pcload_vld           ),
  .ibctrl_pcgen_way_pred              (ibctrl_pcgen_way_pred             ),
  .ibctrl_ras_inst_pcall              (ibctrl_ras_inst_pcall             ),
  .ibctrl_ras_pcall_vld               (ibctrl_ras_pcall_vld              ),
  .ibctrl_ras_pcall_vld_for_gateclk   (ibctrl_ras_pcall_vld_for_gateclk  ),
  .ibctrl_ras_preturn_vld             (ibctrl_ras_preturn_vld            ),
  .ibctrl_ras_preturn_vld_for_gateclk (ibctrl_ras_preturn_vld_for_gateclk),
  .ibdp_ibctrl_chgflw_vl              (ibdp_ibctrl_chgflw_vl             ),
  .ibdp_ibctrl_chgflw_vlmul           (ibdp_ibctrl_chgflw_vlmul          ),
  .ibdp_ibctrl_chgflw_vsew            (ibdp_ibctrl_chgflw_vsew           ),
  .ibdp_ibctrl_default_pc             (ibdp_ibctrl_default_pc            ),
  .ibdp_ibctrl_hn_ind_br              (ibdp_ibctrl_hn_ind_br             ),
  .ibdp_ibctrl_hn_pcall               (ibdp_ibctrl_hn_pcall              ),
  .ibdp_ibctrl_hn_preturn             (ibdp_ibctrl_hn_preturn            ),
  .ibdp_ibctrl_l0_btb_mispred_pc      (ibdp_ibctrl_l0_btb_mispred_pc     ),
  .ibdp_ibctrl_ras_chgflw_mask        (ibdp_ibctrl_ras_chgflw_mask       ),
  .ibdp_ibctrl_ras_mistaken           (ibdp_ibctrl_ras_mistaken          ),
  .ibdp_ibctrl_ras_pc                 (ibdp_ibctrl_ras_pc                ),
  .ibdp_ibctrl_vpc                    (ibdp_ibctrl_vpc                   ),
  .ibuf_ibctrl_empty                  (ibuf_ibctrl_empty                 ),
  .ibuf_ibctrl_stall                  (ibuf_ibctrl_stall                 ),
  .idu_ifu_id_bypass_stall            (idu_ifu_id_bypass_stall           ),
  .idu_ifu_id_stall                   (idu_ifu_id_stall                  ),
  .ifu_idu_ib_pipedown_gateclk        (ifu_idu_ib_pipedown_gateclk       ),
  .ind_btb_ibctrl_dout                (ind_btb_ibctrl_dout               ),
  .ind_btb_ibctrl_priv_mode           (ind_btb_ibctrl_priv_mode          ),
  .ipctrl_ibctrl_expt_vld             (ipctrl_ibctrl_expt_vld            ),
  .ipctrl_ibctrl_if_chgflw_vld        (ipctrl_ibctrl_if_chgflw_vld       ),
  .ipctrl_ibctrl_ip_chgflw_vld        (ipctrl_ibctrl_ip_chgflw_vld       ),
  .ipctrl_ibctrl_l0_btb_hit           (ipctrl_ibctrl_l0_btb_hit          ),
  .ipctrl_ibctrl_l0_btb_mispred       (ipctrl_ibctrl_l0_btb_mispred      ),
  .ipctrl_ibctrl_l0_btb_miss          (ipctrl_ibctrl_l0_btb_miss         ),
  .ipctrl_ibctrl_l0_btb_st_wait       (ipctrl_ibctrl_l0_btb_st_wait      ),
  .ipctrl_ibctrl_vld                  (ipctrl_ibctrl_vld                 ),
  .ipdp_ibdp_vl_reg                   (ipdp_ibdp_vl_reg                  ),
  .ipdp_ibdp_vlmul_reg                (ipdp_ibdp_vlmul_reg               ),
  .ipdp_ibdp_vsew_reg                 (ipdp_ibdp_vsew_reg                ),
  .iu_ifu_chgflw_vld                  (iu_ifu_chgflw_vld                 ),
  .iu_ifu_mispred_stall               (iu_ifu_mispred_stall              ),
  .iu_ifu_pcfifo_full                 (iu_ifu_pcfifo_full                ),
  .lbuf_ibctrl_active_idle_flush      (lbuf_ibctrl_active_idle_flush     ),
  .lbuf_ibctrl_chgflw_pc              (lbuf_ibctrl_chgflw_pc             ),
  .lbuf_ibctrl_chgflw_pred            (lbuf_ibctrl_chgflw_pred           ),
  .lbuf_ibctrl_chgflw_vl              (lbuf_ibctrl_chgflw_vl             ),
  .lbuf_ibctrl_chgflw_vld             (lbuf_ibctrl_chgflw_vld            ),
  .lbuf_ibctrl_chgflw_vlmul           (lbuf_ibctrl_chgflw_vlmul          ),
  .lbuf_ibctrl_chgflw_vsew            (lbuf_ibctrl_chgflw_vsew           ),
  .lbuf_ibctrl_lbuf_active            (lbuf_ibctrl_lbuf_active           ),
  .lbuf_ibctrl_stall                  (lbuf_ibctrl_stall                 ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pcfifo_if_ibctrl_more_than_two     (pcfifo_if_ibctrl_more_than_two    ),
  .pcgen_ibctrl_bju_chgflw            (pcgen_ibctrl_bju_chgflw           ),
  .pcgen_ibctrl_cancel                (pcgen_ibctrl_cancel               ),
  .pcgen_ibctrl_ibuf_flush            (pcgen_ibctrl_ibuf_flush           ),
  .pcgen_ibctrl_lbuf_flush            (pcgen_ibctrl_lbuf_flush           )
);

// &Instance("ct_ifu_ibdp",           "x_ct_ifu_ibdp"); @53
ct_ifu_ibdp  x_ct_ifu_ibdp (
  .cp0_ifu_icg_en                   (cp0_ifu_icg_en                  ),
  .cp0_ifu_ras_en                   (cp0_ifu_ras_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .ibctrl_ibdp_buf_stall            (ibctrl_ibdp_buf_stall           ),
  .ibctrl_ibdp_bypass_inst_vld      (ibctrl_ibdp_bypass_inst_vld     ),
  .ibctrl_ibdp_cancel               (ibctrl_ibdp_cancel              ),
  .ibctrl_ibdp_chgflw               (ibctrl_ibdp_chgflw              ),
  .ibctrl_ibdp_fifo_full_stall      (ibctrl_ibdp_fifo_full_stall     ),
  .ibctrl_ibdp_fifo_stall           (ibctrl_ibdp_fifo_stall          ),
  .ibctrl_ibdp_ibuf_inst_vld        (ibctrl_ibdp_ibuf_inst_vld       ),
  .ibctrl_ibdp_if_chgflw_vld        (ibctrl_ibdp_if_chgflw_vld       ),
  .ibctrl_ibdp_ind_btb_rd_stall     (ibctrl_ibdp_ind_btb_rd_stall    ),
  .ibctrl_ibdp_ip_chgflw_vld        (ibctrl_ibdp_ip_chgflw_vld       ),
  .ibctrl_ibdp_l0_btb_hit           (ibctrl_ibdp_l0_btb_hit          ),
  .ibctrl_ibdp_l0_btb_mispred       (ibctrl_ibdp_l0_btb_mispred      ),
  .ibctrl_ibdp_l0_btb_miss          (ibctrl_ibdp_l0_btb_miss         ),
  .ibctrl_ibdp_l0_btb_wait          (ibctrl_ibdp_l0_btb_wait         ),
  .ibctrl_ibdp_lbuf_inst_vld        (ibctrl_ibdp_lbuf_inst_vld       ),
  .ibctrl_ibdp_mispred_stall        (ibctrl_ibdp_mispred_stall       ),
  .ibctrl_ibdp_self_stall           (ibctrl_ibdp_self_stall          ),
  .ibdp_addrgen_branch_base         (ibdp_addrgen_branch_base        ),
  .ibdp_addrgen_branch_offset       (ibdp_addrgen_branch_offset      ),
  .ibdp_addrgen_branch_result       (ibdp_addrgen_branch_result      ),
  .ibdp_addrgen_branch_valid        (ibdp_addrgen_branch_valid       ),
  .ibdp_addrgen_branch_vl           (ibdp_addrgen_branch_vl          ),
  .ibdp_addrgen_branch_vlmul        (ibdp_addrgen_branch_vlmul       ),
  .ibdp_addrgen_branch_vsew         (ibdp_addrgen_branch_vsew        ),
  .ibdp_addrgen_btb_index_pc        (ibdp_addrgen_btb_index_pc       ),
  .ibdp_addrgen_l0_btb_hit          (ibdp_addrgen_l0_btb_hit         ),
  .ibdp_addrgen_l0_btb_hit_entry    (ibdp_addrgen_l0_btb_hit_entry   ),
  .ibdp_btb_miss                    (ibdp_btb_miss                   ),
  .ibdp_debug_inst0_vld             (ibdp_debug_inst0_vld            ),
  .ibdp_debug_inst1_vld             (ibdp_debug_inst1_vld            ),
  .ibdp_debug_inst2_vld             (ibdp_debug_inst2_vld            ),
  .ibdp_debug_mmu_deny_vld          (ibdp_debug_mmu_deny_vld         ),
  .ibdp_ibctrl_chgflw_vl            (ibdp_ibctrl_chgflw_vl           ),
  .ibdp_ibctrl_chgflw_vlmul         (ibdp_ibctrl_chgflw_vlmul        ),
  .ibdp_ibctrl_chgflw_vsew          (ibdp_ibctrl_chgflw_vsew         ),
  .ibdp_ibctrl_default_pc           (ibdp_ibctrl_default_pc          ),
  .ibdp_ibctrl_hn_ind_br            (ibdp_ibctrl_hn_ind_br           ),
  .ibdp_ibctrl_hn_pcall             (ibdp_ibctrl_hn_pcall            ),
  .ibdp_ibctrl_hn_preturn           (ibdp_ibctrl_hn_preturn          ),
  .ibdp_ibctrl_l0_btb_mispred_pc    (ibdp_ibctrl_l0_btb_mispred_pc   ),
  .ibdp_ibctrl_ras_chgflw_mask      (ibdp_ibctrl_ras_chgflw_mask     ),
  .ibdp_ibctrl_ras_mistaken         (ibdp_ibctrl_ras_mistaken        ),
  .ibdp_ibctrl_ras_pc               (ibdp_ibctrl_ras_pc              ),
  .ibdp_ibctrl_vpc                  (ibdp_ibctrl_vpc                 ),
  .ibdp_ibuf_h0_32_start            (ibdp_ibuf_h0_32_start           ),
  .ibdp_ibuf_h0_bkpta               (ibdp_ibuf_h0_bkpta              ),
  .ibdp_ibuf_h0_bkptb               (ibdp_ibuf_h0_bkptb              ),
  .ibdp_ibuf_h0_data                (ibdp_ibuf_h0_data               ),
  .ibdp_ibuf_h0_fence               (ibdp_ibuf_h0_fence              ),
  .ibdp_ibuf_h0_high_expt           (ibdp_ibuf_h0_high_expt          ),
  .ibdp_ibuf_h0_ldst                (ibdp_ibuf_h0_ldst               ),
  .ibdp_ibuf_h0_no_spec             (ibdp_ibuf_h0_no_spec            ),
  .ibdp_ibuf_h0_pc                  (ibdp_ibuf_h0_pc                 ),
  .ibdp_ibuf_h0_spe_vld             (ibdp_ibuf_h0_spe_vld            ),
  .ibdp_ibuf_h0_split0              (ibdp_ibuf_h0_split0             ),
  .ibdp_ibuf_h0_split1              (ibdp_ibuf_h0_split1             ),
  .ibdp_ibuf_h0_vl                  (ibdp_ibuf_h0_vl                 ),
  .ibdp_ibuf_h0_vl_pred             (ibdp_ibuf_h0_vl_pred            ),
  .ibdp_ibuf_h0_vld                 (ibdp_ibuf_h0_vld                ),
  .ibdp_ibuf_h0_vlmul               (ibdp_ibuf_h0_vlmul              ),
  .ibdp_ibuf_h0_vsew                (ibdp_ibuf_h0_vsew               ),
  .ibdp_ibuf_h1_data                (ibdp_ibuf_h1_data               ),
  .ibdp_ibuf_h1_pc                  (ibdp_ibuf_h1_pc                 ),
  .ibdp_ibuf_h1_vl                  (ibdp_ibuf_h1_vl                 ),
  .ibdp_ibuf_h1_vlmul               (ibdp_ibuf_h1_vlmul              ),
  .ibdp_ibuf_h1_vsew                (ibdp_ibuf_h1_vsew               ),
  .ibdp_ibuf_h2_data                (ibdp_ibuf_h2_data               ),
  .ibdp_ibuf_h2_pc                  (ibdp_ibuf_h2_pc                 ),
  .ibdp_ibuf_h2_vl                  (ibdp_ibuf_h2_vl                 ),
  .ibdp_ibuf_h2_vlmul               (ibdp_ibuf_h2_vlmul              ),
  .ibdp_ibuf_h2_vsew                (ibdp_ibuf_h2_vsew               ),
  .ibdp_ibuf_h3_data                (ibdp_ibuf_h3_data               ),
  .ibdp_ibuf_h3_pc                  (ibdp_ibuf_h3_pc                 ),
  .ibdp_ibuf_h3_vl                  (ibdp_ibuf_h3_vl                 ),
  .ibdp_ibuf_h3_vlmul               (ibdp_ibuf_h3_vlmul              ),
  .ibdp_ibuf_h3_vsew                (ibdp_ibuf_h3_vsew               ),
  .ibdp_ibuf_h4_data                (ibdp_ibuf_h4_data               ),
  .ibdp_ibuf_h4_pc                  (ibdp_ibuf_h4_pc                 ),
  .ibdp_ibuf_h4_vl                  (ibdp_ibuf_h4_vl                 ),
  .ibdp_ibuf_h4_vlmul               (ibdp_ibuf_h4_vlmul              ),
  .ibdp_ibuf_h4_vsew                (ibdp_ibuf_h4_vsew               ),
  .ibdp_ibuf_h5_data                (ibdp_ibuf_h5_data               ),
  .ibdp_ibuf_h5_pc                  (ibdp_ibuf_h5_pc                 ),
  .ibdp_ibuf_h5_vl                  (ibdp_ibuf_h5_vl                 ),
  .ibdp_ibuf_h5_vlmul               (ibdp_ibuf_h5_vlmul              ),
  .ibdp_ibuf_h5_vsew                (ibdp_ibuf_h5_vsew               ),
  .ibdp_ibuf_h6_data                (ibdp_ibuf_h6_data               ),
  .ibdp_ibuf_h6_pc                  (ibdp_ibuf_h6_pc                 ),
  .ibdp_ibuf_h6_vl                  (ibdp_ibuf_h6_vl                 ),
  .ibdp_ibuf_h6_vlmul               (ibdp_ibuf_h6_vlmul              ),
  .ibdp_ibuf_h6_vsew                (ibdp_ibuf_h6_vsew               ),
  .ibdp_ibuf_h7_data                (ibdp_ibuf_h7_data               ),
  .ibdp_ibuf_h7_pc                  (ibdp_ibuf_h7_pc                 ),
  .ibdp_ibuf_h7_vl                  (ibdp_ibuf_h7_vl                 ),
  .ibdp_ibuf_h7_vlmul               (ibdp_ibuf_h7_vlmul              ),
  .ibdp_ibuf_h7_vsew                (ibdp_ibuf_h7_vsew               ),
  .ibdp_ibuf_h8_data                (ibdp_ibuf_h8_data               ),
  .ibdp_ibuf_h8_pc                  (ibdp_ibuf_h8_pc                 ),
  .ibdp_ibuf_h8_vl                  (ibdp_ibuf_h8_vl                 ),
  .ibdp_ibuf_h8_vlmul               (ibdp_ibuf_h8_vlmul              ),
  .ibdp_ibuf_h8_vsew                (ibdp_ibuf_h8_vsew               ),
  .ibdp_ibuf_half_vld_num           (ibdp_ibuf_half_vld_num          ),
  .ibdp_ibuf_hn_32_start            (ibdp_ibuf_hn_32_start           ),
  .ibdp_ibuf_hn_acc_err             (ibdp_ibuf_hn_acc_err            ),
  .ibdp_ibuf_hn_acc_err_vld         (ibdp_ibuf_hn_acc_err_vld        ),
  .ibdp_ibuf_hn_bkpta               (ibdp_ibuf_hn_bkpta              ),
  .ibdp_ibuf_hn_bkpta_vld           (ibdp_ibuf_hn_bkpta_vld          ),
  .ibdp_ibuf_hn_bkptb               (ibdp_ibuf_hn_bkptb              ),
  .ibdp_ibuf_hn_bkptb_vld           (ibdp_ibuf_hn_bkptb_vld          ),
  .ibdp_ibuf_hn_fence               (ibdp_ibuf_hn_fence              ),
  .ibdp_ibuf_hn_high_expt           (ibdp_ibuf_hn_high_expt          ),
  .ibdp_ibuf_hn_ldst                (ibdp_ibuf_hn_ldst               ),
  .ibdp_ibuf_hn_mmu_acc_deny        (ibdp_ibuf_hn_mmu_acc_deny       ),
  .ibdp_ibuf_hn_mmu_acc_deny_vld    (ibdp_ibuf_hn_mmu_acc_deny_vld   ),
  .ibdp_ibuf_hn_no_spec             (ibdp_ibuf_hn_no_spec            ),
  .ibdp_ibuf_hn_no_spec_vld         (ibdp_ibuf_hn_no_spec_vld        ),
  .ibdp_ibuf_hn_pgflt               (ibdp_ibuf_hn_pgflt              ),
  .ibdp_ibuf_hn_pgflt_vld           (ibdp_ibuf_hn_pgflt_vld          ),
  .ibdp_ibuf_hn_split0              (ibdp_ibuf_hn_split0             ),
  .ibdp_ibuf_hn_split1              (ibdp_ibuf_hn_split1             ),
  .ibdp_ibuf_hn_vl_pred             (ibdp_ibuf_hn_vl_pred            ),
  .ibdp_ibuf_hn_vld                 (ibdp_ibuf_hn_vld                ),
  .ibdp_l0_btb_fifo_update_vld      (ibdp_l0_btb_fifo_update_vld     ),
  .ibdp_l0_btb_update_cnt_bit       (ibdp_l0_btb_update_cnt_bit      ),
  .ibdp_l0_btb_update_data          (ibdp_l0_btb_update_data         ),
  .ibdp_l0_btb_update_entry         (ibdp_l0_btb_update_entry        ),
  .ibdp_l0_btb_update_ras_bit       (ibdp_l0_btb_update_ras_bit      ),
  .ibdp_l0_btb_update_vld           (ibdp_l0_btb_update_vld          ),
  .ibdp_l0_btb_update_vld_bit       (ibdp_l0_btb_update_vld_bit      ),
  .ibdp_l0_btb_wen                  (ibdp_l0_btb_wen                 ),
  .ibdp_lbuf_bht_sel_array_result   (ibdp_lbuf_bht_sel_array_result  ),
  .ibdp_lbuf_con_br_cur_pc          (ibdp_lbuf_con_br_cur_pc         ),
  .ibdp_lbuf_con_br_half_num        (ibdp_lbuf_con_br_half_num       ),
  .ibdp_lbuf_con_br_inst_32         (ibdp_lbuf_con_br_inst_32        ),
  .ibdp_lbuf_con_br_offset          (ibdp_lbuf_con_br_offset         ),
  .ibdp_lbuf_con_br_taken           (ibdp_lbuf_con_br_taken          ),
  .ibdp_lbuf_con_br_vl              (ibdp_lbuf_con_br_vl             ),
  .ibdp_lbuf_con_br_vlmul           (ibdp_lbuf_con_br_vlmul          ),
  .ibdp_lbuf_con_br_vsew            (ibdp_lbuf_con_br_vsew           ),
  .ibdp_lbuf_h0_32_start            (ibdp_lbuf_h0_32_start           ),
  .ibdp_lbuf_h0_bkpta               (ibdp_lbuf_h0_bkpta              ),
  .ibdp_lbuf_h0_bkptb               (ibdp_lbuf_h0_bkptb              ),
  .ibdp_lbuf_h0_con_br              (ibdp_lbuf_h0_con_br             ),
  .ibdp_lbuf_h0_data                (ibdp_lbuf_h0_data               ),
  .ibdp_lbuf_h0_fence               (ibdp_lbuf_h0_fence              ),
  .ibdp_lbuf_h0_split0_type         (ibdp_lbuf_h0_split0_type        ),
  .ibdp_lbuf_h0_split1_type         (ibdp_lbuf_h0_split1_type        ),
  .ibdp_lbuf_h0_vl                  (ibdp_lbuf_h0_vl                 ),
  .ibdp_lbuf_h0_vld                 (ibdp_lbuf_h0_vld                ),
  .ibdp_lbuf_h0_vlmul               (ibdp_lbuf_h0_vlmul              ),
  .ibdp_lbuf_h0_vsetvli             (ibdp_lbuf_h0_vsetvli            ),
  .ibdp_lbuf_h0_vsew                (ibdp_lbuf_h0_vsew               ),
  .ibdp_lbuf_h1_data                (ibdp_lbuf_h1_data               ),
  .ibdp_lbuf_h1_split0_type         (ibdp_lbuf_h1_split0_type        ),
  .ibdp_lbuf_h1_split1_type         (ibdp_lbuf_h1_split1_type        ),
  .ibdp_lbuf_h1_vl                  (ibdp_lbuf_h1_vl                 ),
  .ibdp_lbuf_h1_vlmul               (ibdp_lbuf_h1_vlmul              ),
  .ibdp_lbuf_h1_vsew                (ibdp_lbuf_h1_vsew               ),
  .ibdp_lbuf_h2_data                (ibdp_lbuf_h2_data               ),
  .ibdp_lbuf_h2_split0_type         (ibdp_lbuf_h2_split0_type        ),
  .ibdp_lbuf_h2_split1_type         (ibdp_lbuf_h2_split1_type        ),
  .ibdp_lbuf_h2_vl                  (ibdp_lbuf_h2_vl                 ),
  .ibdp_lbuf_h2_vlmul               (ibdp_lbuf_h2_vlmul              ),
  .ibdp_lbuf_h2_vsew                (ibdp_lbuf_h2_vsew               ),
  .ibdp_lbuf_h3_data                (ibdp_lbuf_h3_data               ),
  .ibdp_lbuf_h3_split0_type         (ibdp_lbuf_h3_split0_type        ),
  .ibdp_lbuf_h3_split1_type         (ibdp_lbuf_h3_split1_type        ),
  .ibdp_lbuf_h3_vl                  (ibdp_lbuf_h3_vl                 ),
  .ibdp_lbuf_h3_vlmul               (ibdp_lbuf_h3_vlmul              ),
  .ibdp_lbuf_h3_vsew                (ibdp_lbuf_h3_vsew               ),
  .ibdp_lbuf_h4_data                (ibdp_lbuf_h4_data               ),
  .ibdp_lbuf_h4_split0_type         (ibdp_lbuf_h4_split0_type        ),
  .ibdp_lbuf_h4_split1_type         (ibdp_lbuf_h4_split1_type        ),
  .ibdp_lbuf_h4_vl                  (ibdp_lbuf_h4_vl                 ),
  .ibdp_lbuf_h4_vlmul               (ibdp_lbuf_h4_vlmul              ),
  .ibdp_lbuf_h4_vsew                (ibdp_lbuf_h4_vsew               ),
  .ibdp_lbuf_h5_data                (ibdp_lbuf_h5_data               ),
  .ibdp_lbuf_h5_split0_type         (ibdp_lbuf_h5_split0_type        ),
  .ibdp_lbuf_h5_split1_type         (ibdp_lbuf_h5_split1_type        ),
  .ibdp_lbuf_h5_vl                  (ibdp_lbuf_h5_vl                 ),
  .ibdp_lbuf_h5_vlmul               (ibdp_lbuf_h5_vlmul              ),
  .ibdp_lbuf_h5_vsew                (ibdp_lbuf_h5_vsew               ),
  .ibdp_lbuf_h6_data                (ibdp_lbuf_h6_data               ),
  .ibdp_lbuf_h6_split0_type         (ibdp_lbuf_h6_split0_type        ),
  .ibdp_lbuf_h6_split1_type         (ibdp_lbuf_h6_split1_type        ),
  .ibdp_lbuf_h6_vl                  (ibdp_lbuf_h6_vl                 ),
  .ibdp_lbuf_h6_vlmul               (ibdp_lbuf_h6_vlmul              ),
  .ibdp_lbuf_h6_vsew                (ibdp_lbuf_h6_vsew               ),
  .ibdp_lbuf_h7_data                (ibdp_lbuf_h7_data               ),
  .ibdp_lbuf_h7_split0_type         (ibdp_lbuf_h7_split0_type        ),
  .ibdp_lbuf_h7_split1_type         (ibdp_lbuf_h7_split1_type        ),
  .ibdp_lbuf_h7_vl                  (ibdp_lbuf_h7_vl                 ),
  .ibdp_lbuf_h7_vlmul               (ibdp_lbuf_h7_vlmul              ),
  .ibdp_lbuf_h7_vsew                (ibdp_lbuf_h7_vsew               ),
  .ibdp_lbuf_h8_data                (ibdp_lbuf_h8_data               ),
  .ibdp_lbuf_h8_split0_type         (ibdp_lbuf_h8_split0_type        ),
  .ibdp_lbuf_h8_split1_type         (ibdp_lbuf_h8_split1_type        ),
  .ibdp_lbuf_h8_vl                  (ibdp_lbuf_h8_vl                 ),
  .ibdp_lbuf_h8_vlmul               (ibdp_lbuf_h8_vlmul              ),
  .ibdp_lbuf_h8_vsew                (ibdp_lbuf_h8_vsew               ),
  .ibdp_lbuf_half_vld_num           (ibdp_lbuf_half_vld_num          ),
  .ibdp_lbuf_hn_32_start            (ibdp_lbuf_hn_32_start           ),
  .ibdp_lbuf_hn_auipc               (ibdp_lbuf_hn_auipc              ),
  .ibdp_lbuf_hn_bkpta               (ibdp_lbuf_hn_bkpta              ),
  .ibdp_lbuf_hn_bkptb               (ibdp_lbuf_hn_bkptb              ),
  .ibdp_lbuf_hn_chgflw              (ibdp_lbuf_hn_chgflw             ),
  .ibdp_lbuf_hn_con_br              (ibdp_lbuf_hn_con_br             ),
  .ibdp_lbuf_hn_fence               (ibdp_lbuf_hn_fence              ),
  .ibdp_lbuf_hn_vld                 (ibdp_lbuf_hn_vld                ),
  .ibdp_lbuf_hn_vsetvli             (ibdp_lbuf_hn_vsetvli            ),
  .ibdp_pcfifo_if_bht_pre_result    (ibdp_pcfifo_if_bht_pre_result   ),
  .ibdp_pcfifo_if_bht_sel_result    (ibdp_pcfifo_if_bht_sel_result   ),
  .ibdp_pcfifo_if_h0_cur_pc         (ibdp_pcfifo_if_h0_cur_pc        ),
  .ibdp_pcfifo_if_h0_vld            (ibdp_pcfifo_if_h0_vld           ),
  .ibdp_pcfifo_if_h1_cur_pc         (ibdp_pcfifo_if_h1_cur_pc        ),
  .ibdp_pcfifo_if_h2_cur_pc         (ibdp_pcfifo_if_h2_cur_pc        ),
  .ibdp_pcfifo_if_h3_cur_pc         (ibdp_pcfifo_if_h3_cur_pc        ),
  .ibdp_pcfifo_if_h4_cur_pc         (ibdp_pcfifo_if_h4_cur_pc        ),
  .ibdp_pcfifo_if_h5_cur_pc         (ibdp_pcfifo_if_h5_cur_pc        ),
  .ibdp_pcfifo_if_h6_cur_pc         (ibdp_pcfifo_if_h6_cur_pc        ),
  .ibdp_pcfifo_if_h7_cur_pc         (ibdp_pcfifo_if_h7_cur_pc        ),
  .ibdp_pcfifo_if_h8_cur_pc         (ibdp_pcfifo_if_h8_cur_pc        ),
  .ibdp_pcfifo_if_hn_con_br         (ibdp_pcfifo_if_hn_con_br        ),
  .ibdp_pcfifo_if_hn_dst_vld        (ibdp_pcfifo_if_hn_dst_vld       ),
  .ibdp_pcfifo_if_hn_jal            (ibdp_pcfifo_if_hn_jal           ),
  .ibdp_pcfifo_if_hn_jalr           (ibdp_pcfifo_if_hn_jalr          ),
  .ibdp_pcfifo_if_hn_pc_oper        (ibdp_pcfifo_if_hn_pc_oper       ),
  .ibdp_pcfifo_if_ind_br_offset     (ibdp_pcfifo_if_ind_br_offset    ),
  .ibdp_pcfifo_if_vghr              (ibdp_pcfifo_if_vghr             ),
  .ibdp_ras_push_pc                 (ibdp_ras_push_pc                ),
  .ibuf_ibdp_bypass_inst0           (ibuf_ibdp_bypass_inst0          ),
  .ibuf_ibdp_bypass_inst0_bkpta     (ibuf_ibdp_bypass_inst0_bkpta    ),
  .ibuf_ibdp_bypass_inst0_bkptb     (ibuf_ibdp_bypass_inst0_bkptb    ),
  .ibuf_ibdp_bypass_inst0_ecc_err   (ibuf_ibdp_bypass_inst0_ecc_err  ),
  .ibuf_ibdp_bypass_inst0_expt      (ibuf_ibdp_bypass_inst0_expt     ),
  .ibuf_ibdp_bypass_inst0_fence     (ibuf_ibdp_bypass_inst0_fence    ),
  .ibuf_ibdp_bypass_inst0_high_expt (ibuf_ibdp_bypass_inst0_high_expt),
  .ibuf_ibdp_bypass_inst0_no_spec   (ibuf_ibdp_bypass_inst0_no_spec  ),
  .ibuf_ibdp_bypass_inst0_pc        (ibuf_ibdp_bypass_inst0_pc       ),
  .ibuf_ibdp_bypass_inst0_split0    (ibuf_ibdp_bypass_inst0_split0   ),
  .ibuf_ibdp_bypass_inst0_split1    (ibuf_ibdp_bypass_inst0_split1   ),
  .ibuf_ibdp_bypass_inst0_valid     (ibuf_ibdp_bypass_inst0_valid    ),
  .ibuf_ibdp_bypass_inst0_vec       (ibuf_ibdp_bypass_inst0_vec      ),
  .ibuf_ibdp_bypass_inst0_vl        (ibuf_ibdp_bypass_inst0_vl       ),
  .ibuf_ibdp_bypass_inst0_vl_pred   (ibuf_ibdp_bypass_inst0_vl_pred  ),
  .ibuf_ibdp_bypass_inst0_vlmul     (ibuf_ibdp_bypass_inst0_vlmul    ),
  .ibuf_ibdp_bypass_inst0_vsew      (ibuf_ibdp_bypass_inst0_vsew     ),
  .ibuf_ibdp_bypass_inst1           (ibuf_ibdp_bypass_inst1          ),
  .ibuf_ibdp_bypass_inst1_bkpta     (ibuf_ibdp_bypass_inst1_bkpta    ),
  .ibuf_ibdp_bypass_inst1_bkptb     (ibuf_ibdp_bypass_inst1_bkptb    ),
  .ibuf_ibdp_bypass_inst1_ecc_err   (ibuf_ibdp_bypass_inst1_ecc_err  ),
  .ibuf_ibdp_bypass_inst1_expt      (ibuf_ibdp_bypass_inst1_expt     ),
  .ibuf_ibdp_bypass_inst1_fence     (ibuf_ibdp_bypass_inst1_fence    ),
  .ibuf_ibdp_bypass_inst1_high_expt (ibuf_ibdp_bypass_inst1_high_expt),
  .ibuf_ibdp_bypass_inst1_no_spec   (ibuf_ibdp_bypass_inst1_no_spec  ),
  .ibuf_ibdp_bypass_inst1_pc        (ibuf_ibdp_bypass_inst1_pc       ),
  .ibuf_ibdp_bypass_inst1_split0    (ibuf_ibdp_bypass_inst1_split0   ),
  .ibuf_ibdp_bypass_inst1_split1    (ibuf_ibdp_bypass_inst1_split1   ),
  .ibuf_ibdp_bypass_inst1_valid     (ibuf_ibdp_bypass_inst1_valid    ),
  .ibuf_ibdp_bypass_inst1_vec       (ibuf_ibdp_bypass_inst1_vec      ),
  .ibuf_ibdp_bypass_inst1_vl        (ibuf_ibdp_bypass_inst1_vl       ),
  .ibuf_ibdp_bypass_inst1_vl_pred   (ibuf_ibdp_bypass_inst1_vl_pred  ),
  .ibuf_ibdp_bypass_inst1_vlmul     (ibuf_ibdp_bypass_inst1_vlmul    ),
  .ibuf_ibdp_bypass_inst1_vsew      (ibuf_ibdp_bypass_inst1_vsew     ),
  .ibuf_ibdp_bypass_inst2           (ibuf_ibdp_bypass_inst2          ),
  .ibuf_ibdp_bypass_inst2_bkpta     (ibuf_ibdp_bypass_inst2_bkpta    ),
  .ibuf_ibdp_bypass_inst2_bkptb     (ibuf_ibdp_bypass_inst2_bkptb    ),
  .ibuf_ibdp_bypass_inst2_ecc_err   (ibuf_ibdp_bypass_inst2_ecc_err  ),
  .ibuf_ibdp_bypass_inst2_expt      (ibuf_ibdp_bypass_inst2_expt     ),
  .ibuf_ibdp_bypass_inst2_fence     (ibuf_ibdp_bypass_inst2_fence    ),
  .ibuf_ibdp_bypass_inst2_high_expt (ibuf_ibdp_bypass_inst2_high_expt),
  .ibuf_ibdp_bypass_inst2_no_spec   (ibuf_ibdp_bypass_inst2_no_spec  ),
  .ibuf_ibdp_bypass_inst2_pc        (ibuf_ibdp_bypass_inst2_pc       ),
  .ibuf_ibdp_bypass_inst2_split0    (ibuf_ibdp_bypass_inst2_split0   ),
  .ibuf_ibdp_bypass_inst2_split1    (ibuf_ibdp_bypass_inst2_split1   ),
  .ibuf_ibdp_bypass_inst2_valid     (ibuf_ibdp_bypass_inst2_valid    ),
  .ibuf_ibdp_bypass_inst2_vec       (ibuf_ibdp_bypass_inst2_vec      ),
  .ibuf_ibdp_bypass_inst2_vl        (ibuf_ibdp_bypass_inst2_vl       ),
  .ibuf_ibdp_bypass_inst2_vl_pred   (ibuf_ibdp_bypass_inst2_vl_pred  ),
  .ibuf_ibdp_bypass_inst2_vlmul     (ibuf_ibdp_bypass_inst2_vlmul    ),
  .ibuf_ibdp_bypass_inst2_vsew      (ibuf_ibdp_bypass_inst2_vsew     ),
  .ibuf_ibdp_inst0                  (ibuf_ibdp_inst0                 ),
  .ibuf_ibdp_inst0_bkpta            (ibuf_ibdp_inst0_bkpta           ),
  .ibuf_ibdp_inst0_bkptb            (ibuf_ibdp_inst0_bkptb           ),
  .ibuf_ibdp_inst0_ecc_err          (ibuf_ibdp_inst0_ecc_err         ),
  .ibuf_ibdp_inst0_expt_vld         (ibuf_ibdp_inst0_expt_vld        ),
  .ibuf_ibdp_inst0_fence            (ibuf_ibdp_inst0_fence           ),
  .ibuf_ibdp_inst0_high_expt        (ibuf_ibdp_inst0_high_expt       ),
  .ibuf_ibdp_inst0_no_spec          (ibuf_ibdp_inst0_no_spec         ),
  .ibuf_ibdp_inst0_pc               (ibuf_ibdp_inst0_pc              ),
  .ibuf_ibdp_inst0_split0           (ibuf_ibdp_inst0_split0          ),
  .ibuf_ibdp_inst0_split1           (ibuf_ibdp_inst0_split1          ),
  .ibuf_ibdp_inst0_valid            (ibuf_ibdp_inst0_valid           ),
  .ibuf_ibdp_inst0_vec              (ibuf_ibdp_inst0_vec             ),
  .ibuf_ibdp_inst0_vl               (ibuf_ibdp_inst0_vl              ),
  .ibuf_ibdp_inst0_vl_pred          (ibuf_ibdp_inst0_vl_pred         ),
  .ibuf_ibdp_inst0_vlmul            (ibuf_ibdp_inst0_vlmul           ),
  .ibuf_ibdp_inst0_vsew             (ibuf_ibdp_inst0_vsew            ),
  .ibuf_ibdp_inst1                  (ibuf_ibdp_inst1                 ),
  .ibuf_ibdp_inst1_bkpta            (ibuf_ibdp_inst1_bkpta           ),
  .ibuf_ibdp_inst1_bkptb            (ibuf_ibdp_inst1_bkptb           ),
  .ibuf_ibdp_inst1_ecc_err          (ibuf_ibdp_inst1_ecc_err         ),
  .ibuf_ibdp_inst1_expt_vld         (ibuf_ibdp_inst1_expt_vld        ),
  .ibuf_ibdp_inst1_fence            (ibuf_ibdp_inst1_fence           ),
  .ibuf_ibdp_inst1_high_expt        (ibuf_ibdp_inst1_high_expt       ),
  .ibuf_ibdp_inst1_no_spec          (ibuf_ibdp_inst1_no_spec         ),
  .ibuf_ibdp_inst1_pc               (ibuf_ibdp_inst1_pc              ),
  .ibuf_ibdp_inst1_split0           (ibuf_ibdp_inst1_split0          ),
  .ibuf_ibdp_inst1_split1           (ibuf_ibdp_inst1_split1          ),
  .ibuf_ibdp_inst1_valid            (ibuf_ibdp_inst1_valid           ),
  .ibuf_ibdp_inst1_vec              (ibuf_ibdp_inst1_vec             ),
  .ibuf_ibdp_inst1_vl               (ibuf_ibdp_inst1_vl              ),
  .ibuf_ibdp_inst1_vl_pred          (ibuf_ibdp_inst1_vl_pred         ),
  .ibuf_ibdp_inst1_vlmul            (ibuf_ibdp_inst1_vlmul           ),
  .ibuf_ibdp_inst1_vsew             (ibuf_ibdp_inst1_vsew            ),
  .ibuf_ibdp_inst2                  (ibuf_ibdp_inst2                 ),
  .ibuf_ibdp_inst2_bkpta            (ibuf_ibdp_inst2_bkpta           ),
  .ibuf_ibdp_inst2_bkptb            (ibuf_ibdp_inst2_bkptb           ),
  .ibuf_ibdp_inst2_ecc_err          (ibuf_ibdp_inst2_ecc_err         ),
  .ibuf_ibdp_inst2_expt_vld         (ibuf_ibdp_inst2_expt_vld        ),
  .ibuf_ibdp_inst2_fence            (ibuf_ibdp_inst2_fence           ),
  .ibuf_ibdp_inst2_high_expt        (ibuf_ibdp_inst2_high_expt       ),
  .ibuf_ibdp_inst2_no_spec          (ibuf_ibdp_inst2_no_spec         ),
  .ibuf_ibdp_inst2_pc               (ibuf_ibdp_inst2_pc              ),
  .ibuf_ibdp_inst2_split0           (ibuf_ibdp_inst2_split0          ),
  .ibuf_ibdp_inst2_split1           (ibuf_ibdp_inst2_split1          ),
  .ibuf_ibdp_inst2_valid            (ibuf_ibdp_inst2_valid           ),
  .ibuf_ibdp_inst2_vec              (ibuf_ibdp_inst2_vec             ),
  .ibuf_ibdp_inst2_vl               (ibuf_ibdp_inst2_vl              ),
  .ibuf_ibdp_inst2_vl_pred          (ibuf_ibdp_inst2_vl_pred         ),
  .ibuf_ibdp_inst2_vlmul            (ibuf_ibdp_inst2_vlmul           ),
  .ibuf_ibdp_inst2_vsew             (ibuf_ibdp_inst2_vsew            ),
  .ifu_had_no_inst                  (ifu_had_no_inst                 ),
  .ifu_idu_ib_inst0_data            (ifu_idu_ib_inst0_data           ),
  .ifu_idu_ib_inst0_vld             (ifu_idu_ib_inst0_vld            ),
  .ifu_idu_ib_inst1_data            (ifu_idu_ib_inst1_data           ),
  .ifu_idu_ib_inst1_vld             (ifu_idu_ib_inst1_vld            ),
  .ifu_idu_ib_inst2_data            (ifu_idu_ib_inst2_data           ),
  .ifu_idu_ib_inst2_vld             (ifu_idu_ib_inst2_vld            ),
  .ipctrl_ibdp_expt_vld             (ipctrl_ibdp_expt_vld            ),
  .ipctrl_ibdp_vld                  (ipctrl_ibdp_vld                 ),
  .ipdp_ibdp_bht_pre_result         (ipdp_ibdp_bht_pre_result        ),
  .ipdp_ibdp_bht_result             (ipdp_ibdp_bht_result            ),
  .ipdp_ibdp_bht_sel_result         (ipdp_ibdp_bht_sel_result        ),
  .ipdp_ibdp_branch_base            (ipdp_ibdp_branch_base           ),
  .ipdp_ibdp_branch_btb_miss        (ipdp_ibdp_branch_btb_miss       ),
  .ipdp_ibdp_branch_offset          (ipdp_ibdp_branch_offset         ),
  .ipdp_ibdp_branch_result          (ipdp_ibdp_branch_result         ),
  .ipdp_ibdp_branch_vl              (ipdp_ibdp_branch_vl             ),
  .ipdp_ibdp_branch_vlmul           (ipdp_ibdp_branch_vlmul          ),
  .ipdp_ibdp_branch_vsew            (ipdp_ibdp_branch_vsew           ),
  .ipdp_ibdp_branch_way_pred        (ipdp_ibdp_branch_way_pred       ),
  .ipdp_ibdp_btb_index_pc           (ipdp_ibdp_btb_index_pc          ),
  .ipdp_ibdp_chgflw_mask            (ipdp_ibdp_chgflw_mask           ),
  .ipdp_ibdp_chgflw_num             (ipdp_ibdp_chgflw_num            ),
  .ipdp_ibdp_chgflw_num_vld         (ipdp_ibdp_chgflw_num_vld        ),
  .ipdp_ibdp_chgflw_vl              (ipdp_ibdp_chgflw_vl             ),
  .ipdp_ibdp_chgflw_vlmul           (ipdp_ibdp_chgflw_vlmul          ),
  .ipdp_ibdp_chgflw_vsew            (ipdp_ibdp_chgflw_vsew           ),
  .ipdp_ibdp_con_br_cur_pc          (ipdp_ibdp_con_br_cur_pc         ),
  .ipdp_ibdp_con_br_half_num        (ipdp_ibdp_con_br_half_num       ),
  .ipdp_ibdp_con_br_inst_32         (ipdp_ibdp_con_br_inst_32        ),
  .ipdp_ibdp_con_br_num             (ipdp_ibdp_con_br_num            ),
  .ipdp_ibdp_con_br_num_vld         (ipdp_ibdp_con_br_num_vld        ),
  .ipdp_ibdp_con_br_offset          (ipdp_ibdp_con_br_offset         ),
  .ipdp_ibdp_h0_bkpta               (ipdp_ibdp_h0_bkpta              ),
  .ipdp_ibdp_h0_bkptb               (ipdp_ibdp_h0_bkptb              ),
  .ipdp_ibdp_h0_con_br              (ipdp_ibdp_h0_con_br             ),
  .ipdp_ibdp_h0_cur_pc              (ipdp_ibdp_h0_cur_pc             ),
  .ipdp_ibdp_h0_data                (ipdp_ibdp_h0_data               ),
  .ipdp_ibdp_h0_fence               (ipdp_ibdp_h0_fence              ),
  .ipdp_ibdp_h0_high_expt           (ipdp_ibdp_h0_high_expt          ),
  .ipdp_ibdp_h0_ldst                (ipdp_ibdp_h0_ldst               ),
  .ipdp_ibdp_h0_no_spec             (ipdp_ibdp_h0_no_spec            ),
  .ipdp_ibdp_h0_spe_vld             (ipdp_ibdp_h0_spe_vld            ),
  .ipdp_ibdp_h0_split0              (ipdp_ibdp_h0_split0             ),
  .ipdp_ibdp_h0_split0_type         (ipdp_ibdp_h0_split0_type        ),
  .ipdp_ibdp_h0_split1              (ipdp_ibdp_h0_split1             ),
  .ipdp_ibdp_h0_split1_type         (ipdp_ibdp_h0_split1_type        ),
  .ipdp_ibdp_h0_vl                  (ipdp_ibdp_h0_vl                 ),
  .ipdp_ibdp_h0_vl_pred             (ipdp_ibdp_h0_vl_pred            ),
  .ipdp_ibdp_h0_vld                 (ipdp_ibdp_h0_vld                ),
  .ipdp_ibdp_h0_vlmul               (ipdp_ibdp_h0_vlmul              ),
  .ipdp_ibdp_h0_vsetvli             (ipdp_ibdp_h0_vsetvli            ),
  .ipdp_ibdp_h0_vsew                (ipdp_ibdp_h0_vsew               ),
  .ipdp_ibdp_h1_base                (ipdp_ibdp_h1_base               ),
  .ipdp_ibdp_h1_data                (ipdp_ibdp_h1_data               ),
  .ipdp_ibdp_h1_split0_type         (ipdp_ibdp_h1_split0_type        ),
  .ipdp_ibdp_h1_split1_type         (ipdp_ibdp_h1_split1_type        ),
  .ipdp_ibdp_h1_vl                  (ipdp_ibdp_h1_vl                 ),
  .ipdp_ibdp_h1_vlmul               (ipdp_ibdp_h1_vlmul              ),
  .ipdp_ibdp_h1_vsew                (ipdp_ibdp_h1_vsew               ),
  .ipdp_ibdp_h2_base                (ipdp_ibdp_h2_base               ),
  .ipdp_ibdp_h2_data                (ipdp_ibdp_h2_data               ),
  .ipdp_ibdp_h2_split0_type         (ipdp_ibdp_h2_split0_type        ),
  .ipdp_ibdp_h2_split1_type         (ipdp_ibdp_h2_split1_type        ),
  .ipdp_ibdp_h2_vl                  (ipdp_ibdp_h2_vl                 ),
  .ipdp_ibdp_h2_vlmul               (ipdp_ibdp_h2_vlmul              ),
  .ipdp_ibdp_h2_vsew                (ipdp_ibdp_h2_vsew               ),
  .ipdp_ibdp_h3_base                (ipdp_ibdp_h3_base               ),
  .ipdp_ibdp_h3_data                (ipdp_ibdp_h3_data               ),
  .ipdp_ibdp_h3_split0_type         (ipdp_ibdp_h3_split0_type        ),
  .ipdp_ibdp_h3_split1_type         (ipdp_ibdp_h3_split1_type        ),
  .ipdp_ibdp_h3_vl                  (ipdp_ibdp_h3_vl                 ),
  .ipdp_ibdp_h3_vlmul               (ipdp_ibdp_h3_vlmul              ),
  .ipdp_ibdp_h3_vsew                (ipdp_ibdp_h3_vsew               ),
  .ipdp_ibdp_h4_base                (ipdp_ibdp_h4_base               ),
  .ipdp_ibdp_h4_data                (ipdp_ibdp_h4_data               ),
  .ipdp_ibdp_h4_split0_type         (ipdp_ibdp_h4_split0_type        ),
  .ipdp_ibdp_h4_split1_type         (ipdp_ibdp_h4_split1_type        ),
  .ipdp_ibdp_h4_vl                  (ipdp_ibdp_h4_vl                 ),
  .ipdp_ibdp_h4_vlmul               (ipdp_ibdp_h4_vlmul              ),
  .ipdp_ibdp_h4_vsew                (ipdp_ibdp_h4_vsew               ),
  .ipdp_ibdp_h5_base                (ipdp_ibdp_h5_base               ),
  .ipdp_ibdp_h5_data                (ipdp_ibdp_h5_data               ),
  .ipdp_ibdp_h5_split0_type         (ipdp_ibdp_h5_split0_type        ),
  .ipdp_ibdp_h5_split1_type         (ipdp_ibdp_h5_split1_type        ),
  .ipdp_ibdp_h5_vl                  (ipdp_ibdp_h5_vl                 ),
  .ipdp_ibdp_h5_vlmul               (ipdp_ibdp_h5_vlmul              ),
  .ipdp_ibdp_h5_vsew                (ipdp_ibdp_h5_vsew               ),
  .ipdp_ibdp_h6_base                (ipdp_ibdp_h6_base               ),
  .ipdp_ibdp_h6_data                (ipdp_ibdp_h6_data               ),
  .ipdp_ibdp_h6_split0_type         (ipdp_ibdp_h6_split0_type        ),
  .ipdp_ibdp_h6_split1_type         (ipdp_ibdp_h6_split1_type        ),
  .ipdp_ibdp_h6_vl                  (ipdp_ibdp_h6_vl                 ),
  .ipdp_ibdp_h6_vlmul               (ipdp_ibdp_h6_vlmul              ),
  .ipdp_ibdp_h6_vsew                (ipdp_ibdp_h6_vsew               ),
  .ipdp_ibdp_h7_base                (ipdp_ibdp_h7_base               ),
  .ipdp_ibdp_h7_data                (ipdp_ibdp_h7_data               ),
  .ipdp_ibdp_h7_split0_type         (ipdp_ibdp_h7_split0_type        ),
  .ipdp_ibdp_h7_split1_type         (ipdp_ibdp_h7_split1_type        ),
  .ipdp_ibdp_h7_vl                  (ipdp_ibdp_h7_vl                 ),
  .ipdp_ibdp_h7_vlmul               (ipdp_ibdp_h7_vlmul              ),
  .ipdp_ibdp_h7_vsew                (ipdp_ibdp_h7_vsew               ),
  .ipdp_ibdp_h8_base                (ipdp_ibdp_h8_base               ),
  .ipdp_ibdp_h8_data                (ipdp_ibdp_h8_data               ),
  .ipdp_ibdp_h8_split0_type         (ipdp_ibdp_h8_split0_type        ),
  .ipdp_ibdp_h8_split1_type         (ipdp_ibdp_h8_split1_type        ),
  .ipdp_ibdp_h8_vl                  (ipdp_ibdp_h8_vl                 ),
  .ipdp_ibdp_h8_vlmul               (ipdp_ibdp_h8_vlmul              ),
  .ipdp_ibdp_h8_vsew                (ipdp_ibdp_h8_vsew               ),
  .ipdp_ibdp_hn_32_start            (ipdp_ibdp_hn_32_start           ),
  .ipdp_ibdp_hn_ab_br               (ipdp_ibdp_hn_ab_br              ),
  .ipdp_ibdp_hn_acc_err             (ipdp_ibdp_hn_acc_err            ),
  .ipdp_ibdp_hn_auipc               (ipdp_ibdp_hn_auipc              ),
  .ipdp_ibdp_hn_bkpta               (ipdp_ibdp_hn_bkpta              ),
  .ipdp_ibdp_hn_bkpta_vld           (ipdp_ibdp_hn_bkpta_vld          ),
  .ipdp_ibdp_hn_bkptb               (ipdp_ibdp_hn_bkptb              ),
  .ipdp_ibdp_hn_bkptb_vld           (ipdp_ibdp_hn_bkptb_vld          ),
  .ipdp_ibdp_hn_chgflw              (ipdp_ibdp_hn_chgflw             ),
  .ipdp_ibdp_hn_con_br              (ipdp_ibdp_hn_con_br             ),
  .ipdp_ibdp_hn_dst_vld             (ipdp_ibdp_hn_dst_vld            ),
  .ipdp_ibdp_hn_fence               (ipdp_ibdp_hn_fence              ),
  .ipdp_ibdp_hn_ind_br              (ipdp_ibdp_hn_ind_br             ),
  .ipdp_ibdp_hn_jal                 (ipdp_ibdp_hn_jal                ),
  .ipdp_ibdp_hn_jalr                (ipdp_ibdp_hn_jalr               ),
  .ipdp_ibdp_hn_ldst                (ipdp_ibdp_hn_ldst               ),
  .ipdp_ibdp_hn_mmu_acc_deny        (ipdp_ibdp_hn_mmu_acc_deny       ),
  .ipdp_ibdp_hn_no_spec             (ipdp_ibdp_hn_no_spec            ),
  .ipdp_ibdp_hn_no_spec_vld         (ipdp_ibdp_hn_no_spec_vld        ),
  .ipdp_ibdp_hn_pc_oper             (ipdp_ibdp_hn_pc_oper            ),
  .ipdp_ibdp_hn_pcall               (ipdp_ibdp_hn_pcall              ),
  .ipdp_ibdp_hn_pgflt               (ipdp_ibdp_hn_pgflt              ),
  .ipdp_ibdp_hn_preturn             (ipdp_ibdp_hn_preturn            ),
  .ipdp_ibdp_hn_split0              (ipdp_ibdp_hn_split0             ),
  .ipdp_ibdp_hn_split1              (ipdp_ibdp_hn_split1             ),
  .ipdp_ibdp_hn_vl_pred             (ipdp_ibdp_hn_vl_pred            ),
  .ipdp_ibdp_hn_vld                 (ipdp_ibdp_hn_vld                ),
  .ipdp_ibdp_hn_vsetvli             (ipdp_ibdp_hn_vsetvli            ),
  .ipdp_ibdp_ind_br_offset          (ipdp_ibdp_ind_br_offset         ),
  .ipdp_ibdp_l0_btb_entry_hit       (ipdp_ibdp_l0_btb_entry_hit      ),
  .ipdp_ibdp_l0_btb_hit             (ipdp_ibdp_l0_btb_hit            ),
  .ipdp_ibdp_l0_btb_mispred_pc      (ipdp_ibdp_l0_btb_mispred_pc     ),
  .ipdp_ibdp_l0_btb_ras             (ipdp_ibdp_l0_btb_ras            ),
  .ipdp_ibdp_l0_btb_ras_pc_hit      (ipdp_ibdp_l0_btb_ras_pc_hit     ),
  .ipdp_ibdp_l0_btb_update_cnt_bit  (ipdp_ibdp_l0_btb_update_cnt_bit ),
  .ipdp_ibdp_l0_btb_update_vld      (ipdp_ibdp_l0_btb_update_vld     ),
  .ipdp_ibdp_l0_btb_update_vld_bit  (ipdp_ibdp_l0_btb_update_vld_bit ),
  .ipdp_ibdp_l0_btb_wen             (ipdp_ibdp_l0_btb_wen            ),
  .ipdp_ibdp_no_chgflw_num          (ipdp_ibdp_no_chgflw_num         ),
  .ipdp_ibdp_ras_push_pc            (ipdp_ibdp_ras_push_pc           ),
  .ipdp_ibdp_ras_target_pc          (ipdp_ibdp_ras_target_pc         ),
  .ipdp_ibdp_vghr                   (ipdp_ibdp_vghr                  ),
  .ipdp_ibdp_vpc                    (ipdp_ibdp_vpc                   ),
  .iu_ifu_pcfifo_full               (iu_ifu_pcfifo_full              ),
  .l0_btb_ibdp_entry_fifo           (l0_btb_ibdp_entry_fifo          ),
  .l0_btb_update_vld_for_gateclk    (l0_btb_update_vld_for_gateclk   ),
  .lbuf_ibdp_inst0                  (lbuf_ibdp_inst0                 ),
  .lbuf_ibdp_inst0_bkpta            (lbuf_ibdp_inst0_bkpta           ),
  .lbuf_ibdp_inst0_bkptb            (lbuf_ibdp_inst0_bkptb           ),
  .lbuf_ibdp_inst0_fence            (lbuf_ibdp_inst0_fence           ),
  .lbuf_ibdp_inst0_pc               (lbuf_ibdp_inst0_pc              ),
  .lbuf_ibdp_inst0_split0           (lbuf_ibdp_inst0_split0          ),
  .lbuf_ibdp_inst0_split1           (lbuf_ibdp_inst0_split1          ),
  .lbuf_ibdp_inst0_valid            (lbuf_ibdp_inst0_valid           ),
  .lbuf_ibdp_inst0_vl               (lbuf_ibdp_inst0_vl              ),
  .lbuf_ibdp_inst0_vlmul            (lbuf_ibdp_inst0_vlmul           ),
  .lbuf_ibdp_inst0_vsew             (lbuf_ibdp_inst0_vsew            ),
  .lbuf_ibdp_inst1                  (lbuf_ibdp_inst1                 ),
  .lbuf_ibdp_inst1_bkpta            (lbuf_ibdp_inst1_bkpta           ),
  .lbuf_ibdp_inst1_bkptb            (lbuf_ibdp_inst1_bkptb           ),
  .lbuf_ibdp_inst1_fence            (lbuf_ibdp_inst1_fence           ),
  .lbuf_ibdp_inst1_pc               (lbuf_ibdp_inst1_pc              ),
  .lbuf_ibdp_inst1_split0           (lbuf_ibdp_inst1_split0          ),
  .lbuf_ibdp_inst1_split1           (lbuf_ibdp_inst1_split1          ),
  .lbuf_ibdp_inst1_valid            (lbuf_ibdp_inst1_valid           ),
  .lbuf_ibdp_inst1_vl               (lbuf_ibdp_inst1_vl              ),
  .lbuf_ibdp_inst1_vlmul            (lbuf_ibdp_inst1_vlmul           ),
  .lbuf_ibdp_inst1_vsew             (lbuf_ibdp_inst1_vsew            ),
  .lbuf_ibdp_inst2                  (lbuf_ibdp_inst2                 ),
  .lbuf_ibdp_inst2_bkpta            (lbuf_ibdp_inst2_bkpta           ),
  .lbuf_ibdp_inst2_bkptb            (lbuf_ibdp_inst2_bkptb           ),
  .lbuf_ibdp_inst2_fence            (lbuf_ibdp_inst2_fence           ),
  .lbuf_ibdp_inst2_pc               (lbuf_ibdp_inst2_pc              ),
  .lbuf_ibdp_inst2_split0           (lbuf_ibdp_inst2_split0          ),
  .lbuf_ibdp_inst2_split1           (lbuf_ibdp_inst2_split1          ),
  .lbuf_ibdp_inst2_valid            (lbuf_ibdp_inst2_valid           ),
  .lbuf_ibdp_inst2_vl               (lbuf_ibdp_inst2_vl              ),
  .lbuf_ibdp_inst2_vlmul            (lbuf_ibdp_inst2_vlmul           ),
  .lbuf_ibdp_inst2_vsew             (lbuf_ibdp_inst2_vsew            ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              ),
  .pcfifo_if_ibdp_over_mask         (pcfifo_if_ibdp_over_mask        )
);

// &Instance("ct_ifu_ibuf",           "x_ct_ifu_ibuf"); @54
ct_ifu_ibuf  x_ct_ifu_ibuf (
  .cp0_ifu_icg_en                   (cp0_ifu_icg_en                  ),
  .cp0_yy_clk_en                    (cp0_yy_clk_en                   ),
  .cpurst_b                         (cpurst_b                        ),
  .forever_cpuclk                   (forever_cpuclk                  ),
  .ibctrl_ibuf_bypass_not_select    (ibctrl_ibuf_bypass_not_select   ),
  .ibctrl_ibuf_create_vld           (ibctrl_ibuf_create_vld          ),
  .ibctrl_ibuf_data_vld             (ibctrl_ibuf_data_vld            ),
  .ibctrl_ibuf_flush                (ibctrl_ibuf_flush               ),
  .ibctrl_ibuf_merge_vld            (ibctrl_ibuf_merge_vld           ),
  .ibctrl_ibuf_retire_vld           (ibctrl_ibuf_retire_vld          ),
  .ibdp_ibuf_h0_32_start            (ibdp_ibuf_h0_32_start           ),
  .ibdp_ibuf_h0_bkpta               (ibdp_ibuf_h0_bkpta              ),
  .ibdp_ibuf_h0_bkptb               (ibdp_ibuf_h0_bkptb              ),
  .ibdp_ibuf_h0_data                (ibdp_ibuf_h0_data               ),
  .ibdp_ibuf_h0_fence               (ibdp_ibuf_h0_fence              ),
  .ibdp_ibuf_h0_high_expt           (ibdp_ibuf_h0_high_expt          ),
  .ibdp_ibuf_h0_ldst                (ibdp_ibuf_h0_ldst               ),
  .ibdp_ibuf_h0_no_spec             (ibdp_ibuf_h0_no_spec            ),
  .ibdp_ibuf_h0_pc                  (ibdp_ibuf_h0_pc                 ),
  .ibdp_ibuf_h0_spe_vld             (ibdp_ibuf_h0_spe_vld            ),
  .ibdp_ibuf_h0_split0              (ibdp_ibuf_h0_split0             ),
  .ibdp_ibuf_h0_split1              (ibdp_ibuf_h0_split1             ),
  .ibdp_ibuf_h0_vl                  (ibdp_ibuf_h0_vl                 ),
  .ibdp_ibuf_h0_vl_pred             (ibdp_ibuf_h0_vl_pred            ),
  .ibdp_ibuf_h0_vld                 (ibdp_ibuf_h0_vld                ),
  .ibdp_ibuf_h0_vlmul               (ibdp_ibuf_h0_vlmul              ),
  .ibdp_ibuf_h0_vsew                (ibdp_ibuf_h0_vsew               ),
  .ibdp_ibuf_h1_data                (ibdp_ibuf_h1_data               ),
  .ibdp_ibuf_h1_pc                  (ibdp_ibuf_h1_pc                 ),
  .ibdp_ibuf_h1_vl                  (ibdp_ibuf_h1_vl                 ),
  .ibdp_ibuf_h1_vlmul               (ibdp_ibuf_h1_vlmul              ),
  .ibdp_ibuf_h1_vsew                (ibdp_ibuf_h1_vsew               ),
  .ibdp_ibuf_h2_data                (ibdp_ibuf_h2_data               ),
  .ibdp_ibuf_h2_pc                  (ibdp_ibuf_h2_pc                 ),
  .ibdp_ibuf_h2_vl                  (ibdp_ibuf_h2_vl                 ),
  .ibdp_ibuf_h2_vlmul               (ibdp_ibuf_h2_vlmul              ),
  .ibdp_ibuf_h2_vsew                (ibdp_ibuf_h2_vsew               ),
  .ibdp_ibuf_h3_data                (ibdp_ibuf_h3_data               ),
  .ibdp_ibuf_h3_pc                  (ibdp_ibuf_h3_pc                 ),
  .ibdp_ibuf_h3_vl                  (ibdp_ibuf_h3_vl                 ),
  .ibdp_ibuf_h3_vlmul               (ibdp_ibuf_h3_vlmul              ),
  .ibdp_ibuf_h3_vsew                (ibdp_ibuf_h3_vsew               ),
  .ibdp_ibuf_h4_data                (ibdp_ibuf_h4_data               ),
  .ibdp_ibuf_h4_pc                  (ibdp_ibuf_h4_pc                 ),
  .ibdp_ibuf_h4_vl                  (ibdp_ibuf_h4_vl                 ),
  .ibdp_ibuf_h4_vlmul               (ibdp_ibuf_h4_vlmul              ),
  .ibdp_ibuf_h4_vsew                (ibdp_ibuf_h4_vsew               ),
  .ibdp_ibuf_h5_data                (ibdp_ibuf_h5_data               ),
  .ibdp_ibuf_h5_pc                  (ibdp_ibuf_h5_pc                 ),
  .ibdp_ibuf_h5_vl                  (ibdp_ibuf_h5_vl                 ),
  .ibdp_ibuf_h5_vlmul               (ibdp_ibuf_h5_vlmul              ),
  .ibdp_ibuf_h5_vsew                (ibdp_ibuf_h5_vsew               ),
  .ibdp_ibuf_h6_data                (ibdp_ibuf_h6_data               ),
  .ibdp_ibuf_h6_pc                  (ibdp_ibuf_h6_pc                 ),
  .ibdp_ibuf_h6_vl                  (ibdp_ibuf_h6_vl                 ),
  .ibdp_ibuf_h6_vlmul               (ibdp_ibuf_h6_vlmul              ),
  .ibdp_ibuf_h6_vsew                (ibdp_ibuf_h6_vsew               ),
  .ibdp_ibuf_h7_data                (ibdp_ibuf_h7_data               ),
  .ibdp_ibuf_h7_pc                  (ibdp_ibuf_h7_pc                 ),
  .ibdp_ibuf_h7_vl                  (ibdp_ibuf_h7_vl                 ),
  .ibdp_ibuf_h7_vlmul               (ibdp_ibuf_h7_vlmul              ),
  .ibdp_ibuf_h7_vsew                (ibdp_ibuf_h7_vsew               ),
  .ibdp_ibuf_h8_data                (ibdp_ibuf_h8_data               ),
  .ibdp_ibuf_h8_pc                  (ibdp_ibuf_h8_pc                 ),
  .ibdp_ibuf_h8_vl                  (ibdp_ibuf_h8_vl                 ),
  .ibdp_ibuf_h8_vlmul               (ibdp_ibuf_h8_vlmul              ),
  .ibdp_ibuf_h8_vsew                (ibdp_ibuf_h8_vsew               ),
  .ibdp_ibuf_half_vld_num           (ibdp_ibuf_half_vld_num          ),
  .ibdp_ibuf_hn_32_start            (ibdp_ibuf_hn_32_start           ),
  .ibdp_ibuf_hn_acc_err             (ibdp_ibuf_hn_acc_err            ),
  .ibdp_ibuf_hn_acc_err_vld         (ibdp_ibuf_hn_acc_err_vld        ),
  .ibdp_ibuf_hn_bkpta               (ibdp_ibuf_hn_bkpta              ),
  .ibdp_ibuf_hn_bkpta_vld           (ibdp_ibuf_hn_bkpta_vld          ),
  .ibdp_ibuf_hn_bkptb               (ibdp_ibuf_hn_bkptb              ),
  .ibdp_ibuf_hn_bkptb_vld           (ibdp_ibuf_hn_bkptb_vld          ),
  .ibdp_ibuf_hn_fence               (ibdp_ibuf_hn_fence              ),
  .ibdp_ibuf_hn_high_expt           (ibdp_ibuf_hn_high_expt          ),
  .ibdp_ibuf_hn_ldst                (ibdp_ibuf_hn_ldst               ),
  .ibdp_ibuf_hn_mmu_acc_deny        (ibdp_ibuf_hn_mmu_acc_deny       ),
  .ibdp_ibuf_hn_mmu_acc_deny_vld    (ibdp_ibuf_hn_mmu_acc_deny_vld   ),
  .ibdp_ibuf_hn_no_spec             (ibdp_ibuf_hn_no_spec            ),
  .ibdp_ibuf_hn_no_spec_vld         (ibdp_ibuf_hn_no_spec_vld        ),
  .ibdp_ibuf_hn_pgflt               (ibdp_ibuf_hn_pgflt              ),
  .ibdp_ibuf_hn_pgflt_vld           (ibdp_ibuf_hn_pgflt_vld          ),
  .ibdp_ibuf_hn_split0              (ibdp_ibuf_hn_split0             ),
  .ibdp_ibuf_hn_split1              (ibdp_ibuf_hn_split1             ),
  .ibdp_ibuf_hn_vl_pred             (ibdp_ibuf_hn_vl_pred            ),
  .ibdp_ibuf_hn_vld                 (ibdp_ibuf_hn_vld                ),
  .ibuf_ibctrl_empty                (ibuf_ibctrl_empty               ),
  .ibuf_ibctrl_stall                (ibuf_ibctrl_stall               ),
  .ibuf_ibdp_bypass_inst0           (ibuf_ibdp_bypass_inst0          ),
  .ibuf_ibdp_bypass_inst0_bkpta     (ibuf_ibdp_bypass_inst0_bkpta    ),
  .ibuf_ibdp_bypass_inst0_bkptb     (ibuf_ibdp_bypass_inst0_bkptb    ),
  .ibuf_ibdp_bypass_inst0_ecc_err   (ibuf_ibdp_bypass_inst0_ecc_err  ),
  .ibuf_ibdp_bypass_inst0_expt      (ibuf_ibdp_bypass_inst0_expt     ),
  .ibuf_ibdp_bypass_inst0_fence     (ibuf_ibdp_bypass_inst0_fence    ),
  .ibuf_ibdp_bypass_inst0_high_expt (ibuf_ibdp_bypass_inst0_high_expt),
  .ibuf_ibdp_bypass_inst0_no_spec   (ibuf_ibdp_bypass_inst0_no_spec  ),
  .ibuf_ibdp_bypass_inst0_pc        (ibuf_ibdp_bypass_inst0_pc       ),
  .ibuf_ibdp_bypass_inst0_split0    (ibuf_ibdp_bypass_inst0_split0   ),
  .ibuf_ibdp_bypass_inst0_split1    (ibuf_ibdp_bypass_inst0_split1   ),
  .ibuf_ibdp_bypass_inst0_valid     (ibuf_ibdp_bypass_inst0_valid    ),
  .ibuf_ibdp_bypass_inst0_vec       (ibuf_ibdp_bypass_inst0_vec      ),
  .ibuf_ibdp_bypass_inst0_vl        (ibuf_ibdp_bypass_inst0_vl       ),
  .ibuf_ibdp_bypass_inst0_vl_pred   (ibuf_ibdp_bypass_inst0_vl_pred  ),
  .ibuf_ibdp_bypass_inst0_vlmul     (ibuf_ibdp_bypass_inst0_vlmul    ),
  .ibuf_ibdp_bypass_inst0_vsew      (ibuf_ibdp_bypass_inst0_vsew     ),
  .ibuf_ibdp_bypass_inst1           (ibuf_ibdp_bypass_inst1          ),
  .ibuf_ibdp_bypass_inst1_bkpta     (ibuf_ibdp_bypass_inst1_bkpta    ),
  .ibuf_ibdp_bypass_inst1_bkptb     (ibuf_ibdp_bypass_inst1_bkptb    ),
  .ibuf_ibdp_bypass_inst1_ecc_err   (ibuf_ibdp_bypass_inst1_ecc_err  ),
  .ibuf_ibdp_bypass_inst1_expt      (ibuf_ibdp_bypass_inst1_expt     ),
  .ibuf_ibdp_bypass_inst1_fence     (ibuf_ibdp_bypass_inst1_fence    ),
  .ibuf_ibdp_bypass_inst1_high_expt (ibuf_ibdp_bypass_inst1_high_expt),
  .ibuf_ibdp_bypass_inst1_no_spec   (ibuf_ibdp_bypass_inst1_no_spec  ),
  .ibuf_ibdp_bypass_inst1_pc        (ibuf_ibdp_bypass_inst1_pc       ),
  .ibuf_ibdp_bypass_inst1_split0    (ibuf_ibdp_bypass_inst1_split0   ),
  .ibuf_ibdp_bypass_inst1_split1    (ibuf_ibdp_bypass_inst1_split1   ),
  .ibuf_ibdp_bypass_inst1_valid     (ibuf_ibdp_bypass_inst1_valid    ),
  .ibuf_ibdp_bypass_inst1_vec       (ibuf_ibdp_bypass_inst1_vec      ),
  .ibuf_ibdp_bypass_inst1_vl        (ibuf_ibdp_bypass_inst1_vl       ),
  .ibuf_ibdp_bypass_inst1_vl_pred   (ibuf_ibdp_bypass_inst1_vl_pred  ),
  .ibuf_ibdp_bypass_inst1_vlmul     (ibuf_ibdp_bypass_inst1_vlmul    ),
  .ibuf_ibdp_bypass_inst1_vsew      (ibuf_ibdp_bypass_inst1_vsew     ),
  .ibuf_ibdp_bypass_inst2           (ibuf_ibdp_bypass_inst2          ),
  .ibuf_ibdp_bypass_inst2_bkpta     (ibuf_ibdp_bypass_inst2_bkpta    ),
  .ibuf_ibdp_bypass_inst2_bkptb     (ibuf_ibdp_bypass_inst2_bkptb    ),
  .ibuf_ibdp_bypass_inst2_ecc_err   (ibuf_ibdp_bypass_inst2_ecc_err  ),
  .ibuf_ibdp_bypass_inst2_expt      (ibuf_ibdp_bypass_inst2_expt     ),
  .ibuf_ibdp_bypass_inst2_fence     (ibuf_ibdp_bypass_inst2_fence    ),
  .ibuf_ibdp_bypass_inst2_high_expt (ibuf_ibdp_bypass_inst2_high_expt),
  .ibuf_ibdp_bypass_inst2_no_spec   (ibuf_ibdp_bypass_inst2_no_spec  ),
  .ibuf_ibdp_bypass_inst2_pc        (ibuf_ibdp_bypass_inst2_pc       ),
  .ibuf_ibdp_bypass_inst2_split0    (ibuf_ibdp_bypass_inst2_split0   ),
  .ibuf_ibdp_bypass_inst2_split1    (ibuf_ibdp_bypass_inst2_split1   ),
  .ibuf_ibdp_bypass_inst2_valid     (ibuf_ibdp_bypass_inst2_valid    ),
  .ibuf_ibdp_bypass_inst2_vec       (ibuf_ibdp_bypass_inst2_vec      ),
  .ibuf_ibdp_bypass_inst2_vl        (ibuf_ibdp_bypass_inst2_vl       ),
  .ibuf_ibdp_bypass_inst2_vl_pred   (ibuf_ibdp_bypass_inst2_vl_pred  ),
  .ibuf_ibdp_bypass_inst2_vlmul     (ibuf_ibdp_bypass_inst2_vlmul    ),
  .ibuf_ibdp_bypass_inst2_vsew      (ibuf_ibdp_bypass_inst2_vsew     ),
  .ibuf_ibdp_inst0                  (ibuf_ibdp_inst0                 ),
  .ibuf_ibdp_inst0_bkpta            (ibuf_ibdp_inst0_bkpta           ),
  .ibuf_ibdp_inst0_bkptb            (ibuf_ibdp_inst0_bkptb           ),
  .ibuf_ibdp_inst0_ecc_err          (ibuf_ibdp_inst0_ecc_err         ),
  .ibuf_ibdp_inst0_expt_vld         (ibuf_ibdp_inst0_expt_vld        ),
  .ibuf_ibdp_inst0_fence            (ibuf_ibdp_inst0_fence           ),
  .ibuf_ibdp_inst0_high_expt        (ibuf_ibdp_inst0_high_expt       ),
  .ibuf_ibdp_inst0_no_spec          (ibuf_ibdp_inst0_no_spec         ),
  .ibuf_ibdp_inst0_pc               (ibuf_ibdp_inst0_pc              ),
  .ibuf_ibdp_inst0_split0           (ibuf_ibdp_inst0_split0          ),
  .ibuf_ibdp_inst0_split1           (ibuf_ibdp_inst0_split1          ),
  .ibuf_ibdp_inst0_valid            (ibuf_ibdp_inst0_valid           ),
  .ibuf_ibdp_inst0_vec              (ibuf_ibdp_inst0_vec             ),
  .ibuf_ibdp_inst0_vl               (ibuf_ibdp_inst0_vl              ),
  .ibuf_ibdp_inst0_vl_pred          (ibuf_ibdp_inst0_vl_pred         ),
  .ibuf_ibdp_inst0_vlmul            (ibuf_ibdp_inst0_vlmul           ),
  .ibuf_ibdp_inst0_vsew             (ibuf_ibdp_inst0_vsew            ),
  .ibuf_ibdp_inst1                  (ibuf_ibdp_inst1                 ),
  .ibuf_ibdp_inst1_bkpta            (ibuf_ibdp_inst1_bkpta           ),
  .ibuf_ibdp_inst1_bkptb            (ibuf_ibdp_inst1_bkptb           ),
  .ibuf_ibdp_inst1_ecc_err          (ibuf_ibdp_inst1_ecc_err         ),
  .ibuf_ibdp_inst1_expt_vld         (ibuf_ibdp_inst1_expt_vld        ),
  .ibuf_ibdp_inst1_fence            (ibuf_ibdp_inst1_fence           ),
  .ibuf_ibdp_inst1_high_expt        (ibuf_ibdp_inst1_high_expt       ),
  .ibuf_ibdp_inst1_no_spec          (ibuf_ibdp_inst1_no_spec         ),
  .ibuf_ibdp_inst1_pc               (ibuf_ibdp_inst1_pc              ),
  .ibuf_ibdp_inst1_split0           (ibuf_ibdp_inst1_split0          ),
  .ibuf_ibdp_inst1_split1           (ibuf_ibdp_inst1_split1          ),
  .ibuf_ibdp_inst1_valid            (ibuf_ibdp_inst1_valid           ),
  .ibuf_ibdp_inst1_vec              (ibuf_ibdp_inst1_vec             ),
  .ibuf_ibdp_inst1_vl               (ibuf_ibdp_inst1_vl              ),
  .ibuf_ibdp_inst1_vl_pred          (ibuf_ibdp_inst1_vl_pred         ),
  .ibuf_ibdp_inst1_vlmul            (ibuf_ibdp_inst1_vlmul           ),
  .ibuf_ibdp_inst1_vsew             (ibuf_ibdp_inst1_vsew            ),
  .ibuf_ibdp_inst2                  (ibuf_ibdp_inst2                 ),
  .ibuf_ibdp_inst2_bkpta            (ibuf_ibdp_inst2_bkpta           ),
  .ibuf_ibdp_inst2_bkptb            (ibuf_ibdp_inst2_bkptb           ),
  .ibuf_ibdp_inst2_ecc_err          (ibuf_ibdp_inst2_ecc_err         ),
  .ibuf_ibdp_inst2_expt_vld         (ibuf_ibdp_inst2_expt_vld        ),
  .ibuf_ibdp_inst2_fence            (ibuf_ibdp_inst2_fence           ),
  .ibuf_ibdp_inst2_high_expt        (ibuf_ibdp_inst2_high_expt       ),
  .ibuf_ibdp_inst2_no_spec          (ibuf_ibdp_inst2_no_spec         ),
  .ibuf_ibdp_inst2_pc               (ibuf_ibdp_inst2_pc              ),
  .ibuf_ibdp_inst2_split0           (ibuf_ibdp_inst2_split0          ),
  .ibuf_ibdp_inst2_split1           (ibuf_ibdp_inst2_split1          ),
  .ibuf_ibdp_inst2_valid            (ibuf_ibdp_inst2_valid           ),
  .ibuf_ibdp_inst2_vec              (ibuf_ibdp_inst2_vec             ),
  .ibuf_ibdp_inst2_vl               (ibuf_ibdp_inst2_vl              ),
  .ibuf_ibdp_inst2_vl_pred          (ibuf_ibdp_inst2_vl_pred         ),
  .ibuf_ibdp_inst2_vlmul            (ibuf_ibdp_inst2_vlmul           ),
  .ibuf_ibdp_inst2_vsew             (ibuf_ibdp_inst2_vsew            ),
  .ibuf_lbuf_empty                  (ibuf_lbuf_empty                 ),
  .pad_yy_icg_scan_en               (pad_yy_icg_scan_en              )
);

// &Instance("ct_ifu_icache_if",      "x_ct_ifu_icache_if"); @55
ct_ifu_icache_if  x_ct_ifu_icache_if (
  .cp0_ifu_icache_en                  (cp0_ifu_icache_en                 ),
  .cp0_ifu_icg_en                     (cp0_ifu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .hpcp_ifu_cnt_en                    (hpcp_ifu_cnt_en                   ),
  .icache_if_ifctrl_inst_data0        (icache_if_ifctrl_inst_data0       ),
  .icache_if_ifctrl_inst_data1        (icache_if_ifctrl_inst_data1       ),
  .icache_if_ifctrl_tag_data0         (icache_if_ifctrl_tag_data0        ),
  .icache_if_ifctrl_tag_data1         (icache_if_ifctrl_tag_data1        ),
  .icache_if_ifdp_fifo                (icache_if_ifdp_fifo               ),
  .icache_if_ifdp_inst_data0          (icache_if_ifdp_inst_data0         ),
  .icache_if_ifdp_inst_data1          (icache_if_ifdp_inst_data1         ),
  .icache_if_ifdp_precode0            (icache_if_ifdp_precode0           ),
  .icache_if_ifdp_precode1            (icache_if_ifdp_precode1           ),
  .icache_if_ifdp_tag_data0           (icache_if_ifdp_tag_data0          ),
  .icache_if_ifdp_tag_data1           (icache_if_ifdp_tag_data1          ),
  .icache_if_ipb_tag_data0            (icache_if_ipb_tag_data0           ),
  .icache_if_ipb_tag_data1            (icache_if_ipb_tag_data1           ),
  .ifctrl_icache_if_index             (ifctrl_icache_if_index            ),
  .ifctrl_icache_if_inv_fifo          (ifctrl_icache_if_inv_fifo         ),
  .ifctrl_icache_if_inv_on            (ifctrl_icache_if_inv_on           ),
  .ifctrl_icache_if_read_req_data0    (ifctrl_icache_if_read_req_data0   ),
  .ifctrl_icache_if_read_req_data1    (ifctrl_icache_if_read_req_data1   ),
  .ifctrl_icache_if_read_req_index    (ifctrl_icache_if_read_req_index   ),
  .ifctrl_icache_if_read_req_tag      (ifctrl_icache_if_read_req_tag     ),
  .ifctrl_icache_if_reset_req         (ifctrl_icache_if_reset_req        ),
  .ifctrl_icache_if_tag_req           (ifctrl_icache_if_tag_req          ),
  .ifctrl_icache_if_tag_wen           (ifctrl_icache_if_tag_wen          ),
  .ifu_hpcp_icache_access             (ifu_hpcp_icache_access            ),
  .ifu_hpcp_icache_miss               (ifu_hpcp_icache_miss              ),
  .ifu_hpcp_icache_miss_pre           (ifu_hpcp_icache_miss_pre          ),
  .ipb_icache_if_index                (ipb_icache_if_index               ),
  .ipb_icache_if_req                  (ipb_icache_if_req                 ),
  .ipb_icache_if_req_for_gateclk      (ipb_icache_if_req_for_gateclk     ),
  .l1_refill_icache_if_fifo           (l1_refill_icache_if_fifo          ),
  .l1_refill_icache_if_first          (l1_refill_icache_if_first         ),
  .l1_refill_icache_if_index          (l1_refill_icache_if_index         ),
  .l1_refill_icache_if_inst_data      (l1_refill_icache_if_inst_data     ),
  .l1_refill_icache_if_last           (l1_refill_icache_if_last          ),
  .l1_refill_icache_if_pre_code       (l1_refill_icache_if_pre_code      ),
  .l1_refill_icache_if_ptag           (l1_refill_icache_if_ptag          ),
  .l1_refill_icache_if_wr             (l1_refill_icache_if_wr            ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pcgen_icache_if_chgflw             (pcgen_icache_if_chgflw            ),
  .pcgen_icache_if_chgflw_bank0       (pcgen_icache_if_chgflw_bank0      ),
  .pcgen_icache_if_chgflw_bank1       (pcgen_icache_if_chgflw_bank1      ),
  .pcgen_icache_if_chgflw_bank2       (pcgen_icache_if_chgflw_bank2      ),
  .pcgen_icache_if_chgflw_bank3       (pcgen_icache_if_chgflw_bank3      ),
  .pcgen_icache_if_chgflw_short       (pcgen_icache_if_chgflw_short      ),
  .pcgen_icache_if_gateclk_en         (pcgen_icache_if_gateclk_en        ),
  .pcgen_icache_if_index              (pcgen_icache_if_index             ),
  .pcgen_icache_if_seq_data_req       (pcgen_icache_if_seq_data_req      ),
  .pcgen_icache_if_seq_data_req_short (pcgen_icache_if_seq_data_req_short),
  .pcgen_icache_if_seq_tag_req        (pcgen_icache_if_seq_tag_req       ),
  .pcgen_icache_if_way_pred           (pcgen_icache_if_way_pred          )
);

// &Instance("ct_ifu_ifctrl",         "x_ct_ifu_ifctrl"); @56
ct_ifu_ifctrl  x_ct_ifu_ifctrl (
  .bht_ifctrl_inv_done                (bht_ifctrl_inv_done               ),
  .bht_ifctrl_inv_on                  (bht_ifctrl_inv_on                 ),
  .btb_ifctrl_inv_done                (btb_ifctrl_inv_done               ),
  .btb_ifctrl_inv_on                  (btb_ifctrl_inv_on                 ),
  .cp0_ifu_bht_inv                    (cp0_ifu_bht_inv                   ),
  .cp0_ifu_btb_inv                    (cp0_ifu_btb_inv                   ),
  .cp0_ifu_icache_inv                 (cp0_ifu_icache_inv                ),
  .cp0_ifu_icache_read_index          (cp0_ifu_icache_read_index         ),
  .cp0_ifu_icache_read_req            (cp0_ifu_icache_read_req           ),
  .cp0_ifu_icache_read_tag            (cp0_ifu_icache_read_tag           ),
  .cp0_ifu_icache_read_way            (cp0_ifu_icache_read_way           ),
  .cp0_ifu_icg_en                     (cp0_ifu_icg_en                    ),
  .cp0_ifu_ind_btb_inv                (cp0_ifu_ind_btb_inv               ),
  .cp0_ifu_no_op_req                  (cp0_ifu_no_op_req                 ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .hpcp_ifu_cnt_en                    (hpcp_ifu_cnt_en                   ),
  .icache_if_ifctrl_inst_data0        (icache_if_ifctrl_inst_data0       ),
  .icache_if_ifctrl_inst_data1        (icache_if_ifctrl_inst_data1       ),
  .icache_if_ifctrl_tag_data0         (icache_if_ifctrl_tag_data0        ),
  .icache_if_ifctrl_tag_data1         (icache_if_ifctrl_tag_data1        ),
  .ifctrl_bht_inv                     (ifctrl_bht_inv                    ),
  .ifctrl_bht_pipedown                (ifctrl_bht_pipedown               ),
  .ifctrl_bht_stall                   (ifctrl_bht_stall                  ),
  .ifctrl_btb_inv                     (ifctrl_btb_inv                    ),
  .ifctrl_debug_if_pc_vld             (ifctrl_debug_if_pc_vld            ),
  .ifctrl_debug_if_stall              (ifctrl_debug_if_stall             ),
  .ifctrl_debug_if_vld                (ifctrl_debug_if_vld               ),
  .ifctrl_debug_inv_st                (ifctrl_debug_inv_st               ),
  .ifctrl_debug_lsu_all_inv           (ifctrl_debug_lsu_all_inv          ),
  .ifctrl_debug_lsu_line_inv          (ifctrl_debug_lsu_line_inv         ),
  .ifctrl_debug_mmu_pavld             (ifctrl_debug_mmu_pavld            ),
  .ifctrl_debug_way_pred_stall        (ifctrl_debug_way_pred_stall       ),
  .ifctrl_icache_if_index             (ifctrl_icache_if_index            ),
  .ifctrl_icache_if_inv_fifo          (ifctrl_icache_if_inv_fifo         ),
  .ifctrl_icache_if_inv_on            (ifctrl_icache_if_inv_on           ),
  .ifctrl_icache_if_read_req_data0    (ifctrl_icache_if_read_req_data0   ),
  .ifctrl_icache_if_read_req_data1    (ifctrl_icache_if_read_req_data1   ),
  .ifctrl_icache_if_read_req_index    (ifctrl_icache_if_read_req_index   ),
  .ifctrl_icache_if_read_req_tag      (ifctrl_icache_if_read_req_tag     ),
  .ifctrl_icache_if_reset_req         (ifctrl_icache_if_reset_req        ),
  .ifctrl_icache_if_tag_req           (ifctrl_icache_if_tag_req          ),
  .ifctrl_icache_if_tag_wen           (ifctrl_icache_if_tag_wen          ),
  .ifctrl_ifdp_cancel                 (ifctrl_ifdp_cancel                ),
  .ifctrl_ifdp_pipedown               (ifctrl_ifdp_pipedown              ),
  .ifctrl_ifdp_stall                  (ifctrl_ifdp_stall                 ),
  .ifctrl_ind_btb_inv                 (ifctrl_ind_btb_inv                ),
  .ifctrl_ipb_inv_on                  (ifctrl_ipb_inv_on                 ),
  .ifctrl_ipctrl_if_pcload            (ifctrl_ipctrl_if_pcload           ),
  .ifctrl_ipctrl_vld                  (ifctrl_ipctrl_vld                 ),
  .ifctrl_l0_btb_inv                  (ifctrl_l0_btb_inv                 ),
  .ifctrl_l0_btb_stall                (ifctrl_l0_btb_stall               ),
  .ifctrl_l1_refill_ins_inv           (ifctrl_l1_refill_ins_inv          ),
  .ifctrl_l1_refill_ins_inv_dn        (ifctrl_l1_refill_ins_inv_dn       ),
  .ifctrl_l1_refill_inv_busy          (ifctrl_l1_refill_inv_busy         ),
  .ifctrl_l1_refill_inv_on            (ifctrl_l1_refill_inv_on           ),
  .ifctrl_lbuf_ins_inv_on             (ifctrl_lbuf_ins_inv_on            ),
  .ifctrl_lbuf_inv_req                (ifctrl_lbuf_inv_req               ),
  .ifctrl_pcgen_chgflw_no_stall_mask  (ifctrl_pcgen_chgflw_no_stall_mask ),
  .ifctrl_pcgen_chgflw_vld            (ifctrl_pcgen_chgflw_vld           ),
  .ifctrl_pcgen_ins_icache_inv_done   (ifctrl_pcgen_ins_icache_inv_done  ),
  .ifctrl_pcgen_pcload_pc             (ifctrl_pcgen_pcload_pc            ),
  .ifctrl_pcgen_reissue_pcload        (ifctrl_pcgen_reissue_pcload       ),
  .ifctrl_pcgen_stall                 (ifctrl_pcgen_stall                ),
  .ifctrl_pcgen_stall_short           (ifctrl_pcgen_stall_short          ),
  .ifctrl_pcgen_way_pred              (ifctrl_pcgen_way_pred             ),
  .ifu_cp0_bht_inv_done               (ifu_cp0_bht_inv_done              ),
  .ifu_cp0_btb_inv_done               (ifu_cp0_btb_inv_done              ),
  .ifu_cp0_icache_inv_done            (ifu_cp0_icache_inv_done           ),
  .ifu_cp0_icache_read_data           (ifu_cp0_icache_read_data          ),
  .ifu_cp0_icache_read_data_vld       (ifu_cp0_icache_read_data_vld      ),
  .ifu_cp0_ind_btb_inv_done           (ifu_cp0_ind_btb_inv_done          ),
  .ifu_had_no_op                      (ifu_had_no_op                     ),
  .ifu_hpcp_frontend_stall            (ifu_hpcp_frontend_stall           ),
  .ifu_lsu_icache_inv_done            (ifu_lsu_icache_inv_done           ),
  .ifu_no_op_req                      (ifu_no_op_req                     ),
  .ifu_yy_xx_no_op                    (ifu_yy_xx_no_op                   ),
  .ind_btb_ifctrl_inv_done            (ind_btb_ifctrl_inv_done           ),
  .ind_btb_ifctrl_inv_on              (ind_btb_ifctrl_inv_on             ),
  .ipb_ifctrl_prefetch_idle           (ipb_ifctrl_prefetch_idle          ),
  .ipctrl_ifctrl_bht_stall            (ipctrl_ifctrl_bht_stall           ),
  .ipctrl_ifctrl_stall                (ipctrl_ifctrl_stall               ),
  .ipctrl_ifctrl_stall_short          (ipctrl_ifctrl_stall_short         ),
  .l0_btb_ifctrl_chgflw_pc            (l0_btb_ifctrl_chgflw_pc           ),
  .l0_btb_ifctrl_chgflw_way_pred      (l0_btb_ifctrl_chgflw_way_pred     ),
  .l0_btb_ifctrl_chglfw_vld           (l0_btb_ifctrl_chglfw_vld          ),
  .l1_refill_ifctrl_ctc               (l1_refill_ifctrl_ctc              ),
  .l1_refill_ifctrl_idle              (l1_refill_ifctrl_idle             ),
  .l1_refill_ifctrl_pc                (l1_refill_ifctrl_pc               ),
  .l1_refill_ifctrl_refill_on         (l1_refill_ifctrl_refill_on        ),
  .l1_refill_ifctrl_reissue           (l1_refill_ifctrl_reissue          ),
  .l1_refill_ifctrl_start             (l1_refill_ifctrl_start            ),
  .l1_refill_ifctrl_start_for_gateclk (l1_refill_ifctrl_start_for_gateclk),
  .l1_refill_ifctrl_trans_cmplt       (l1_refill_ifctrl_trans_cmplt      ),
  .l1_refill_inv_wfd_back             (l1_refill_inv_wfd_back            ),
  .lsu_ifu_icache_all_inv             (lsu_ifu_icache_all_inv            ),
  .lsu_ifu_icache_index               (lsu_ifu_icache_index              ),
  .lsu_ifu_icache_line_inv            (lsu_ifu_icache_line_inv           ),
  .lsu_ifu_icache_ptag                (lsu_ifu_icache_ptag               ),
  .mmu_ifu_pavld                      (mmu_ifu_pavld                     ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pcgen_ifctrl_cancel                (pcgen_ifctrl_cancel               ),
  .pcgen_ifctrl_pc                    (pcgen_ifctrl_pc                   ),
  .pcgen_ifctrl_pipe_cancel           (pcgen_ifctrl_pipe_cancel          ),
  .pcgen_ifctrl_reissue               (pcgen_ifctrl_reissue              ),
  .pcgen_ifctrl_way_pred              (pcgen_ifctrl_way_pred             ),
  .pcgen_ifctrl_way_pred_stall        (pcgen_ifctrl_way_pred_stall       ),
  .rtu_ifu_xx_dbgon                   (rtu_ifu_xx_dbgon                  ),
  .vector_ifctrl_reset_on             (vector_ifctrl_reset_on            ),
  .vector_ifctrl_sm_on                (vector_ifctrl_sm_on               ),
  .vector_ifctrl_sm_start             (vector_ifctrl_sm_start            )
);

// &Instance("ct_ifu_ifdp",           "x_ct_ifu_ifdp"); @57
ct_ifu_ifdp  x_ct_ifu_ifdp (
  .btb_ifdp_way0_pred             (btb_ifdp_way0_pred            ),
  .btb_ifdp_way0_tag              (btb_ifdp_way0_tag             ),
  .btb_ifdp_way0_target           (btb_ifdp_way0_target          ),
  .btb_ifdp_way0_vld              (btb_ifdp_way0_vld             ),
  .btb_ifdp_way1_pred             (btb_ifdp_way1_pred            ),
  .btb_ifdp_way1_tag              (btb_ifdp_way1_tag             ),
  .btb_ifdp_way1_target           (btb_ifdp_way1_target          ),
  .btb_ifdp_way1_vld              (btb_ifdp_way1_vld             ),
  .btb_ifdp_way2_pred             (btb_ifdp_way2_pred            ),
  .btb_ifdp_way2_tag              (btb_ifdp_way2_tag             ),
  .btb_ifdp_way2_target           (btb_ifdp_way2_target          ),
  .btb_ifdp_way2_vld              (btb_ifdp_way2_vld             ),
  .btb_ifdp_way3_pred             (btb_ifdp_way3_pred            ),
  .btb_ifdp_way3_tag              (btb_ifdp_way3_tag             ),
  .btb_ifdp_way3_target           (btb_ifdp_way3_target          ),
  .btb_ifdp_way3_vld              (btb_ifdp_way3_vld             ),
  .cp0_ifu_icache_en              (cp0_ifu_icache_en             ),
  .cp0_ifu_icg_en                 (cp0_ifu_icg_en                ),
  .cp0_yy_clk_en                  (cp0_yy_clk_en                 ),
  .cp0_yy_priv_mode               (cp0_yy_priv_mode              ),
  .cpurst_b                       (cpurst_b                      ),
  .forever_cpuclk                 (forever_cpuclk                ),
  .had_yy_xx_bkpta_base           (had_yy_xx_bkpta_base          ),
  .had_yy_xx_bkpta_mask           (had_yy_xx_bkpta_mask          ),
  .had_yy_xx_bkpta_rc             (had_yy_xx_bkpta_rc            ),
  .had_yy_xx_bkptb_base           (had_yy_xx_bkptb_base          ),
  .had_yy_xx_bkptb_mask           (had_yy_xx_bkptb_mask          ),
  .had_yy_xx_bkptb_rc             (had_yy_xx_bkptb_rc            ),
  .icache_if_ifdp_fifo            (icache_if_ifdp_fifo           ),
  .icache_if_ifdp_inst_data0      (icache_if_ifdp_inst_data0     ),
  .icache_if_ifdp_inst_data1      (icache_if_ifdp_inst_data1     ),
  .icache_if_ifdp_precode0        (icache_if_ifdp_precode0       ),
  .icache_if_ifdp_precode1        (icache_if_ifdp_precode1       ),
  .icache_if_ifdp_tag_data0       (icache_if_ifdp_tag_data0      ),
  .icache_if_ifdp_tag_data1       (icache_if_ifdp_tag_data1      ),
  .ifctrl_ifdp_cancel             (ifctrl_ifdp_cancel            ),
  .ifctrl_ifdp_pipedown           (ifctrl_ifdp_pipedown          ),
  .ifctrl_ifdp_stall              (ifctrl_ifdp_stall             ),
  .ifdp_debug_acc_err_vld         (ifdp_debug_acc_err_vld        ),
  .ifdp_debug_mmu_expt_vld        (ifdp_debug_mmu_expt_vld       ),
  .ifdp_ipctrl_expt_vld           (ifdp_ipctrl_expt_vld          ),
  .ifdp_ipctrl_expt_vld_dup       (ifdp_ipctrl_expt_vld_dup      ),
  .ifdp_ipctrl_fifo               (ifdp_ipctrl_fifo              ),
  .ifdp_ipctrl_pa                 (ifdp_ipctrl_pa                ),
  .ifdp_ipctrl_refill_on          (ifdp_ipctrl_refill_on         ),
  .ifdp_ipctrl_tsize              (ifdp_ipctrl_tsize             ),
  .ifdp_ipctrl_vpc_2_0_onehot     (ifdp_ipctrl_vpc_2_0_onehot    ),
  .ifdp_ipctrl_vpc_bry_mask       (ifdp_ipctrl_vpc_bry_mask      ),
  .ifdp_ipctrl_w0_bry0_hit        (ifdp_ipctrl_w0_bry0_hit       ),
  .ifdp_ipctrl_w0_bry1_hit        (ifdp_ipctrl_w0_bry1_hit       ),
  .ifdp_ipctrl_w0b0_br_ntake      (ifdp_ipctrl_w0b0_br_ntake     ),
  .ifdp_ipctrl_w0b0_br_taken      (ifdp_ipctrl_w0b0_br_taken     ),
  .ifdp_ipctrl_w0b0_bry_data      (ifdp_ipctrl_w0b0_bry_data     ),
  .ifdp_ipctrl_w0b1_br_ntake      (ifdp_ipctrl_w0b1_br_ntake     ),
  .ifdp_ipctrl_w0b1_br_taken      (ifdp_ipctrl_w0b1_br_taken     ),
  .ifdp_ipctrl_w0b1_bry_data      (ifdp_ipctrl_w0b1_bry_data     ),
  .ifdp_ipctrl_w1_bry0_hit        (ifdp_ipctrl_w1_bry0_hit       ),
  .ifdp_ipctrl_w1_bry1_hit        (ifdp_ipctrl_w1_bry1_hit       ),
  .ifdp_ipctrl_w1b0_br_ntake      (ifdp_ipctrl_w1b0_br_ntake     ),
  .ifdp_ipctrl_w1b0_br_taken      (ifdp_ipctrl_w1b0_br_taken     ),
  .ifdp_ipctrl_w1b0_bry_data      (ifdp_ipctrl_w1b0_bry_data     ),
  .ifdp_ipctrl_w1b1_br_ntake      (ifdp_ipctrl_w1b1_br_ntake     ),
  .ifdp_ipctrl_w1b1_br_taken      (ifdp_ipctrl_w1b1_br_taken     ),
  .ifdp_ipctrl_w1b1_bry_data      (ifdp_ipctrl_w1b1_bry_data     ),
  .ifdp_ipctrl_way0_15_8_hit      (ifdp_ipctrl_way0_15_8_hit     ),
  .ifdp_ipctrl_way0_15_8_hit_dup  (ifdp_ipctrl_way0_15_8_hit_dup ),
  .ifdp_ipctrl_way0_23_16_hit     (ifdp_ipctrl_way0_23_16_hit    ),
  .ifdp_ipctrl_way0_23_16_hit_dup (ifdp_ipctrl_way0_23_16_hit_dup),
  .ifdp_ipctrl_way0_28_24_hit     (ifdp_ipctrl_way0_28_24_hit    ),
  .ifdp_ipctrl_way0_28_24_hit_dup (ifdp_ipctrl_way0_28_24_hit_dup),
  .ifdp_ipctrl_way0_7_0_hit       (ifdp_ipctrl_way0_7_0_hit      ),
  .ifdp_ipctrl_way0_7_0_hit_dup   (ifdp_ipctrl_way0_7_0_hit_dup  ),
  .ifdp_ipctrl_way1_15_8_hit      (ifdp_ipctrl_way1_15_8_hit     ),
  .ifdp_ipctrl_way1_23_16_hit     (ifdp_ipctrl_way1_23_16_hit    ),
  .ifdp_ipctrl_way1_28_24_hit     (ifdp_ipctrl_way1_28_24_hit    ),
  .ifdp_ipctrl_way1_7_0_hit       (ifdp_ipctrl_way1_7_0_hit      ),
  .ifdp_ipctrl_way_pred           (ifdp_ipctrl_way_pred          ),
  .ifdp_ipdp_acc_err              (ifdp_ipdp_acc_err             ),
  .ifdp_ipdp_bkpta                (ifdp_ipdp_bkpta               ),
  .ifdp_ipdp_bkptb                (ifdp_ipdp_bkptb               ),
  .ifdp_ipdp_btb_way0_pred        (ifdp_ipdp_btb_way0_pred       ),
  .ifdp_ipdp_btb_way0_tag         (ifdp_ipdp_btb_way0_tag        ),
  .ifdp_ipdp_btb_way0_target      (ifdp_ipdp_btb_way0_target     ),
  .ifdp_ipdp_btb_way0_vld         (ifdp_ipdp_btb_way0_vld        ),
  .ifdp_ipdp_btb_way1_pred        (ifdp_ipdp_btb_way1_pred       ),
  .ifdp_ipdp_btb_way1_tag         (ifdp_ipdp_btb_way1_tag        ),
  .ifdp_ipdp_btb_way1_target      (ifdp_ipdp_btb_way1_target     ),
  .ifdp_ipdp_btb_way1_vld         (ifdp_ipdp_btb_way1_vld        ),
  .ifdp_ipdp_btb_way2_pred        (ifdp_ipdp_btb_way2_pred       ),
  .ifdp_ipdp_btb_way2_tag         (ifdp_ipdp_btb_way2_tag        ),
  .ifdp_ipdp_btb_way2_target      (ifdp_ipdp_btb_way2_target     ),
  .ifdp_ipdp_btb_way2_vld         (ifdp_ipdp_btb_way2_vld        ),
  .ifdp_ipdp_btb_way3_pred        (ifdp_ipdp_btb_way3_pred       ),
  .ifdp_ipdp_btb_way3_tag         (ifdp_ipdp_btb_way3_tag        ),
  .ifdp_ipdp_btb_way3_target      (ifdp_ipdp_btb_way3_target     ),
  .ifdp_ipdp_btb_way3_vld         (ifdp_ipdp_btb_way3_vld        ),
  .ifdp_ipdp_h1_inst_high_way0    (ifdp_ipdp_h1_inst_high_way0   ),
  .ifdp_ipdp_h1_inst_high_way1    (ifdp_ipdp_h1_inst_high_way1   ),
  .ifdp_ipdp_h1_inst_low_way0     (ifdp_ipdp_h1_inst_low_way0    ),
  .ifdp_ipdp_h1_inst_low_way1     (ifdp_ipdp_h1_inst_low_way1    ),
  .ifdp_ipdp_h1_precode_way0      (ifdp_ipdp_h1_precode_way0     ),
  .ifdp_ipdp_h1_precode_way1      (ifdp_ipdp_h1_precode_way1     ),
  .ifdp_ipdp_h2_inst_high_way0    (ifdp_ipdp_h2_inst_high_way0   ),
  .ifdp_ipdp_h2_inst_high_way1    (ifdp_ipdp_h2_inst_high_way1   ),
  .ifdp_ipdp_h2_inst_low_way0     (ifdp_ipdp_h2_inst_low_way0    ),
  .ifdp_ipdp_h2_inst_low_way1     (ifdp_ipdp_h2_inst_low_way1    ),
  .ifdp_ipdp_h2_precode_way0      (ifdp_ipdp_h2_precode_way0     ),
  .ifdp_ipdp_h2_precode_way1      (ifdp_ipdp_h2_precode_way1     ),
  .ifdp_ipdp_h3_inst_high_way0    (ifdp_ipdp_h3_inst_high_way0   ),
  .ifdp_ipdp_h3_inst_high_way1    (ifdp_ipdp_h3_inst_high_way1   ),
  .ifdp_ipdp_h3_inst_low_way0     (ifdp_ipdp_h3_inst_low_way0    ),
  .ifdp_ipdp_h3_inst_low_way1     (ifdp_ipdp_h3_inst_low_way1    ),
  .ifdp_ipdp_h3_precode_way0      (ifdp_ipdp_h3_precode_way0     ),
  .ifdp_ipdp_h3_precode_way1      (ifdp_ipdp_h3_precode_way1     ),
  .ifdp_ipdp_h4_inst_high_way0    (ifdp_ipdp_h4_inst_high_way0   ),
  .ifdp_ipdp_h4_inst_high_way1    (ifdp_ipdp_h4_inst_high_way1   ),
  .ifdp_ipdp_h4_inst_low_way0     (ifdp_ipdp_h4_inst_low_way0    ),
  .ifdp_ipdp_h4_inst_low_way1     (ifdp_ipdp_h4_inst_low_way1    ),
  .ifdp_ipdp_h4_precode_way0      (ifdp_ipdp_h4_precode_way0     ),
  .ifdp_ipdp_h4_precode_way1      (ifdp_ipdp_h4_precode_way1     ),
  .ifdp_ipdp_h5_inst_high_way0    (ifdp_ipdp_h5_inst_high_way0   ),
  .ifdp_ipdp_h5_inst_high_way1    (ifdp_ipdp_h5_inst_high_way1   ),
  .ifdp_ipdp_h5_inst_low_way0     (ifdp_ipdp_h5_inst_low_way0    ),
  .ifdp_ipdp_h5_inst_low_way1     (ifdp_ipdp_h5_inst_low_way1    ),
  .ifdp_ipdp_h5_precode_way0      (ifdp_ipdp_h5_precode_way0     ),
  .ifdp_ipdp_h5_precode_way1      (ifdp_ipdp_h5_precode_way1     ),
  .ifdp_ipdp_h6_inst_high_way0    (ifdp_ipdp_h6_inst_high_way0   ),
  .ifdp_ipdp_h6_inst_high_way1    (ifdp_ipdp_h6_inst_high_way1   ),
  .ifdp_ipdp_h6_inst_low_way0     (ifdp_ipdp_h6_inst_low_way0    ),
  .ifdp_ipdp_h6_inst_low_way1     (ifdp_ipdp_h6_inst_low_way1    ),
  .ifdp_ipdp_h6_precode_way0      (ifdp_ipdp_h6_precode_way0     ),
  .ifdp_ipdp_h6_precode_way1      (ifdp_ipdp_h6_precode_way1     ),
  .ifdp_ipdp_h7_inst_high_way0    (ifdp_ipdp_h7_inst_high_way0   ),
  .ifdp_ipdp_h7_inst_high_way1    (ifdp_ipdp_h7_inst_high_way1   ),
  .ifdp_ipdp_h7_inst_low_way0     (ifdp_ipdp_h7_inst_low_way0    ),
  .ifdp_ipdp_h7_inst_low_way1     (ifdp_ipdp_h7_inst_low_way1    ),
  .ifdp_ipdp_h7_precode_way0      (ifdp_ipdp_h7_precode_way0     ),
  .ifdp_ipdp_h7_precode_way1      (ifdp_ipdp_h7_precode_way1     ),
  .ifdp_ipdp_h8_inst_high_way0    (ifdp_ipdp_h8_inst_high_way0   ),
  .ifdp_ipdp_h8_inst_high_way1    (ifdp_ipdp_h8_inst_high_way1   ),
  .ifdp_ipdp_h8_inst_low_way0     (ifdp_ipdp_h8_inst_low_way0    ),
  .ifdp_ipdp_h8_inst_low_way1     (ifdp_ipdp_h8_inst_low_way1    ),
  .ifdp_ipdp_h8_precode_way0      (ifdp_ipdp_h8_precode_way0     ),
  .ifdp_ipdp_h8_precode_way1      (ifdp_ipdp_h8_precode_way1     ),
  .ifdp_ipdp_l0_btb_counter       (ifdp_ipdp_l0_btb_counter      ),
  .ifdp_ipdp_l0_btb_entry_hit     (ifdp_ipdp_l0_btb_entry_hit    ),
  .ifdp_ipdp_l0_btb_hit           (ifdp_ipdp_l0_btb_hit          ),
  .ifdp_ipdp_l0_btb_mispred_pc    (ifdp_ipdp_l0_btb_mispred_pc   ),
  .ifdp_ipdp_l0_btb_ras           (ifdp_ipdp_l0_btb_ras          ),
  .ifdp_ipdp_l0_btb_target        (ifdp_ipdp_l0_btb_target       ),
  .ifdp_ipdp_l0_btb_way0_high_hit (ifdp_ipdp_l0_btb_way0_high_hit),
  .ifdp_ipdp_l0_btb_way0_low_hit  (ifdp_ipdp_l0_btb_way0_low_hit ),
  .ifdp_ipdp_l0_btb_way1_high_hit (ifdp_ipdp_l0_btb_way1_high_hit),
  .ifdp_ipdp_l0_btb_way1_low_hit  (ifdp_ipdp_l0_btb_way1_low_hit ),
  .ifdp_ipdp_l0_btb_way2_high_hit (ifdp_ipdp_l0_btb_way2_high_hit),
  .ifdp_ipdp_l0_btb_way2_low_hit  (ifdp_ipdp_l0_btb_way2_low_hit ),
  .ifdp_ipdp_l0_btb_way3_high_hit (ifdp_ipdp_l0_btb_way3_high_hit),
  .ifdp_ipdp_l0_btb_way3_low_hit  (ifdp_ipdp_l0_btb_way3_low_hit ),
  .ifdp_ipdp_l0_btb_way_pred      (ifdp_ipdp_l0_btb_way_pred     ),
  .ifdp_ipdp_mmu_pgflt            (ifdp_ipdp_mmu_pgflt           ),
  .ifdp_ipdp_sfp_hit_pc_lo        (ifdp_ipdp_sfp_hit_pc_lo       ),
  .ifdp_ipdp_sfp_hit_type         (ifdp_ipdp_sfp_hit_type        ),
  .ifdp_ipdp_sfp_pc_hit           (ifdp_ipdp_sfp_pc_hit          ),
  .ifdp_ipdp_vpc                  (ifdp_ipdp_vpc                 ),
  .ifdp_l1_refill_bufferable      (ifdp_l1_refill_bufferable     ),
  .ifdp_l1_refill_cacheable       (ifdp_l1_refill_cacheable      ),
  .ifdp_l1_refill_fifo            (ifdp_l1_refill_fifo           ),
  .ifdp_l1_refill_machine_mode    (ifdp_l1_refill_machine_mode   ),
  .ifdp_l1_refill_secure          (ifdp_l1_refill_secure         ),
  .ifdp_l1_refill_supv_mode       (ifdp_l1_refill_supv_mode      ),
  .ifdp_l1_refill_tsize           (ifdp_l1_refill_tsize          ),
  .ipctrl_ifdp_gateclk_en         (ipctrl_ifdp_gateclk_en        ),
  .ipctrl_ifdp_vpc_onehot_updt    (ipctrl_ifdp_vpc_onehot_updt   ),
  .ipctrl_ifdp_w0_bry0_hit_updt   (ipctrl_ifdp_w0_bry0_hit_updt  ),
  .ipctrl_ifdp_w0_bry1_hit_updt   (ipctrl_ifdp_w0_bry1_hit_updt  ),
  .ipctrl_ifdp_w0b0_br_ntake_updt (ipctrl_ifdp_w0b0_br_ntake_updt),
  .ipctrl_ifdp_w0b0_br_taken_updt (ipctrl_ifdp_w0b0_br_taken_updt),
  .ipctrl_ifdp_w0b0_bry_updt_data (ipctrl_ifdp_w0b0_bry_updt_data),
  .ipctrl_ifdp_w0b1_br_ntake_updt (ipctrl_ifdp_w0b1_br_ntake_updt),
  .ipctrl_ifdp_w0b1_br_taken_updt (ipctrl_ifdp_w0b1_br_taken_updt),
  .ipctrl_ifdp_w0b1_bry_updt_data (ipctrl_ifdp_w0b1_bry_updt_data),
  .ipctrl_ifdp_w1_bry0_hit_updt   (ipctrl_ifdp_w1_bry0_hit_updt  ),
  .ipctrl_ifdp_w1_bry1_hit_updt   (ipctrl_ifdp_w1_bry1_hit_updt  ),
  .ipctrl_ifdp_w1b0_br_ntake_updt (ipctrl_ifdp_w1b0_br_ntake_updt),
  .ipctrl_ifdp_w1b0_br_taken_updt (ipctrl_ifdp_w1b0_br_taken_updt),
  .ipctrl_ifdp_w1b0_bry_updt_data (ipctrl_ifdp_w1b0_bry_updt_data),
  .ipctrl_ifdp_w1b1_br_ntake_updt (ipctrl_ifdp_w1b1_br_ntake_updt),
  .ipctrl_ifdp_w1b1_br_taken_updt (ipctrl_ifdp_w1b1_br_taken_updt),
  .ipctrl_ifdp_w1b1_bry_updt_data (ipctrl_ifdp_w1b1_bry_updt_data),
  .l0_btb_ifdp_chgflw_pc          (l0_btb_ifdp_chgflw_pc         ),
  .l0_btb_ifdp_chgflw_way_pred    (l0_btb_ifdp_chgflw_way_pred   ),
  .l0_btb_ifdp_counter            (l0_btb_ifdp_counter           ),
  .l0_btb_ifdp_entry_hit          (l0_btb_ifdp_entry_hit         ),
  .l0_btb_ifdp_hit                (l0_btb_ifdp_hit               ),
  .l0_btb_ifdp_ras                (l0_btb_ifdp_ras               ),
  .l1_refill_ifdp_acc_err         (l1_refill_ifdp_acc_err        ),
  .l1_refill_ifdp_inst_data       (l1_refill_ifdp_inst_data      ),
  .l1_refill_ifdp_precode         (l1_refill_ifdp_precode        ),
  .l1_refill_ifdp_refill_on       (l1_refill_ifdp_refill_on      ),
  .l1_refill_ifdp_tag_data        (l1_refill_ifdp_tag_data       ),
  .mmu_ifu_buf                    (mmu_ifu_buf                   ),
  .mmu_ifu_ca                     (mmu_ifu_ca                    ),
  .mmu_ifu_pa                     (mmu_ifu_pa                    ),
  .mmu_ifu_pgflt                  (mmu_ifu_pgflt                 ),
  .mmu_ifu_sec                    (mmu_ifu_sec                   ),
  .mmu_xx_mmu_en                  (mmu_xx_mmu_en                 ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .pcgen_ifdp_inc_pc              (pcgen_ifdp_inc_pc             ),
  .pcgen_ifdp_pc                  (pcgen_ifdp_pc                 ),
  .pcgen_ifdp_way_pred            (pcgen_ifdp_way_pred           ),
  .rtu_yy_xx_dbgon                (rtu_yy_xx_dbgon               ),
  .sfp_ifdp_hit_pc_lo             (sfp_ifdp_hit_pc_lo            ),
  .sfp_ifdp_hit_type              (sfp_ifdp_hit_type             ),
  .sfp_ifdp_pc_hit                (sfp_ifdp_pc_hit               )
);

// &Instance("ct_ifu_ind_btb",        "x_ct_ifu_ind_btb"); @60
ct_ifu_ind_btb  x_ct_ifu_ind_btb (
  .bht_ind_btb_rtu_ghr         (bht_ind_btb_rtu_ghr        ),
  .bht_ind_btb_vghr            (bht_ind_btb_vghr           ),
  .cp0_ifu_icg_en              (cp0_ifu_icg_en             ),
  .cp0_ifu_ind_btb_en          (cp0_ifu_ind_btb_en         ),
  .cp0_yy_clk_en               (cp0_yy_clk_en              ),
  .cp0_yy_priv_mode            (cp0_yy_priv_mode           ),
  .cpurst_b                    (cpurst_b                   ),
  .forever_cpuclk              (forever_cpuclk             ),
  .ibctrl_ind_btb_check_vld    (ibctrl_ind_btb_check_vld   ),
  .ibctrl_ind_btb_fifo_stall   (ibctrl_ind_btb_fifo_stall  ),
  .ibctrl_ind_btb_path         (ibctrl_ind_btb_path        ),
  .ifctrl_ind_btb_inv          (ifctrl_ind_btb_inv         ),
  .ind_btb_ibctrl_dout         (ind_btb_ibctrl_dout        ),
  .ind_btb_ibctrl_priv_mode    (ind_btb_ibctrl_priv_mode   ),
  .ind_btb_ifctrl_inv_done     (ind_btb_ifctrl_inv_done    ),
  .ind_btb_ifctrl_inv_on       (ind_btb_ifctrl_inv_on      ),
  .ipctrl_ind_btb_con_br_vld   (ipctrl_ind_btb_con_br_vld  ),
  .ipdp_ind_btb_jmp_detect     (ipdp_ind_btb_jmp_detect    ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         ),
  .rtu_ifu_flush               (rtu_ifu_flush              ),
  .rtu_ifu_retire0_chk_idx     (rtu_ifu_retire0_chk_idx    ),
  .rtu_ifu_retire0_jmp         (rtu_ifu_retire0_jmp        ),
  .rtu_ifu_retire0_jmp_mispred (rtu_ifu_retire0_jmp_mispred),
  .rtu_ifu_retire0_mispred     (rtu_ifu_retire0_mispred    ),
  .rtu_ifu_retire0_next_pc     (rtu_ifu_retire0_next_pc    ),
  .rtu_ifu_retire1_chk_idx     (rtu_ifu_retire1_chk_idx    ),
  .rtu_ifu_retire1_jmp         (rtu_ifu_retire1_jmp        ),
  .rtu_ifu_retire2_chk_idx     (rtu_ifu_retire2_chk_idx    ),
  .rtu_ifu_retire2_jmp         (rtu_ifu_retire2_jmp        )
);

// &Instance("ct_ifu_ind_btb_alter",  "x_ct_ifu_ind_btb_alter"); @63
// &Force("input","rtu_ifu_retire0_chk_idx"); @66
// &Force("input","rtu_ifu_retire1_chk_idx"); @67
// &Force("input","rtu_ifu_retire2_chk_idx"); @68
// &Force("input","rtu_ifu_retire0_jmp"); @69
// &Force("input","rtu_ifu_retire1_jmp"); @70
// &Force("input","rtu_ifu_retire2_jmp"); @71
// &Force("input","rtu_ifu_retire0_jmp_mispred"); @72
// &Force("input","rtu_ifu_retire0_next_pc"); @73
// &Force("input","cp0_ifu_ind_btb_inv"); @74
// &Force("bus","rtu_ifu_retire0_chk_idx",7,0); @75
// &Force("bus","rtu_ifu_retire1_chk_idx",7,0); @76
// &Force("bus","rtu_ifu_retire2_chk_idx",7,0); @77
// &Force("bus","rtu_ifu_retire0_next_pc",38,0); @78
// &Instance("ct_ifu_ipb",            "x_ct_ifu_ipb"); @81
ct_ifu_ipb  x_ct_ifu_ipb (
  .biu_ifu_rd_data               (biu_ifu_rd_data              ),
  .biu_ifu_rd_data_vld           (biu_ifu_rd_data_vld          ),
  .biu_ifu_rd_grnt               (biu_ifu_rd_grnt              ),
  .biu_ifu_rd_id                 (biu_ifu_rd_id                ),
  .biu_ifu_rd_last               (biu_ifu_rd_last              ),
  .biu_ifu_rd_resp               (biu_ifu_rd_resp              ),
  .cp0_ifu_icache_pref_en        (cp0_ifu_icache_pref_en       ),
  .cp0_ifu_icg_en                (cp0_ifu_icg_en               ),
  .cp0_ifu_insde                 (cp0_ifu_insde                ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .icache_if_ipb_tag_data0       (icache_if_ipb_tag_data0      ),
  .icache_if_ipb_tag_data1       (icache_if_ipb_tag_data1      ),
  .ifctrl_ipb_inv_on             (ifctrl_ipb_inv_on            ),
  .ifu_biu_r_ready               (ifu_biu_r_ready              ),
  .ifu_biu_rd_addr               (ifu_biu_rd_addr              ),
  .ifu_biu_rd_burst              (ifu_biu_rd_burst             ),
  .ifu_biu_rd_cache              (ifu_biu_rd_cache             ),
  .ifu_biu_rd_domain             (ifu_biu_rd_domain            ),
  .ifu_biu_rd_id                 (ifu_biu_rd_id                ),
  .ifu_biu_rd_len                (ifu_biu_rd_len               ),
  .ifu_biu_rd_prot               (ifu_biu_rd_prot              ),
  .ifu_biu_rd_req                (ifu_biu_rd_req               ),
  .ifu_biu_rd_req_gate           (ifu_biu_rd_req_gate          ),
  .ifu_biu_rd_size               (ifu_biu_rd_size              ),
  .ifu_biu_rd_snoop              (ifu_biu_rd_snoop             ),
  .ifu_biu_rd_user               (ifu_biu_rd_user              ),
  .ifu_no_op_req                 (ifu_no_op_req                ),
  .ipb_debug_req_cur_st          (ipb_debug_req_cur_st         ),
  .ipb_debug_wb_cur_st           (ipb_debug_wb_cur_st          ),
  .ipb_icache_if_index           (ipb_icache_if_index          ),
  .ipb_icache_if_req             (ipb_icache_if_req            ),
  .ipb_icache_if_req_for_gateclk (ipb_icache_if_req_for_gateclk),
  .ipb_ifctrl_prefetch_idle      (ipb_ifctrl_prefetch_idle     ),
  .ipb_l1_refill_data_vld        (ipb_l1_refill_data_vld       ),
  .ipb_l1_refill_grnt            (ipb_l1_refill_grnt           ),
  .ipb_l1_refill_rdata           (ipb_l1_refill_rdata          ),
  .ipb_l1_refill_trans_err       (ipb_l1_refill_trans_err      ),
  .l1_refill_ipb_bufferable      (l1_refill_ipb_bufferable     ),
  .l1_refill_ipb_cacheable       (l1_refill_ipb_cacheable      ),
  .l1_refill_ipb_ctc_inv         (l1_refill_ipb_ctc_inv        ),
  .l1_refill_ipb_machine_mode    (l1_refill_ipb_machine_mode   ),
  .l1_refill_ipb_ppc             (l1_refill_ipb_ppc            ),
  .l1_refill_ipb_pre_cancel      (l1_refill_ipb_pre_cancel     ),
  .l1_refill_ipb_refill_on       (l1_refill_ipb_refill_on      ),
  .l1_refill_ipb_req             (l1_refill_ipb_req            ),
  .l1_refill_ipb_req_for_gateclk (l1_refill_ipb_req_for_gateclk),
  .l1_refill_ipb_req_pre         (l1_refill_ipb_req_pre        ),
  .l1_refill_ipb_secure          (l1_refill_ipb_secure         ),
  .l1_refill_ipb_supv_mode       (l1_refill_ipb_supv_mode      ),
  .l1_refill_ipb_tsize           (l1_refill_ipb_tsize          ),
  .l1_refill_ipb_vpc             (l1_refill_ipb_vpc            ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pcgen_ipb_chgflw              (pcgen_ipb_chgflw             )
);

// &Instance("ct_ifu_ipctrl",         "x_ct_ifu_ipctrl"); @82
ct_ifu_ipctrl  x_ct_ifu_ipctrl (
  .cp0_ifu_bht_en                       (cp0_ifu_bht_en                      ),
  .cp0_ifu_no_op_req                    (cp0_ifu_no_op_req                   ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_ifu_ir_vld                       (had_ifu_ir_vld                      ),
  .ibctrl_ipctrl_low_power_stall        (ibctrl_ipctrl_low_power_stall       ),
  .ibctrl_ipctrl_stall                  (ibctrl_ipctrl_stall                 ),
  .ifctrl_ipctrl_if_pcload              (ifctrl_ipctrl_if_pcload             ),
  .ifctrl_ipctrl_vld                    (ifctrl_ipctrl_vld                   ),
  .ifdp_ipctrl_expt_vld                 (ifdp_ipctrl_expt_vld                ),
  .ifdp_ipctrl_expt_vld_dup             (ifdp_ipctrl_expt_vld_dup            ),
  .ifdp_ipctrl_fifo                     (ifdp_ipctrl_fifo                    ),
  .ifdp_ipctrl_pa                       (ifdp_ipctrl_pa                      ),
  .ifdp_ipctrl_refill_on                (ifdp_ipctrl_refill_on               ),
  .ifdp_ipctrl_tsize                    (ifdp_ipctrl_tsize                   ),
  .ifdp_ipctrl_vpc_2_0_onehot           (ifdp_ipctrl_vpc_2_0_onehot          ),
  .ifdp_ipctrl_vpc_bry_mask             (ifdp_ipctrl_vpc_bry_mask            ),
  .ifdp_ipctrl_w0_bry0_hit              (ifdp_ipctrl_w0_bry0_hit             ),
  .ifdp_ipctrl_w0_bry1_hit              (ifdp_ipctrl_w0_bry1_hit             ),
  .ifdp_ipctrl_w0b0_br_ntake            (ifdp_ipctrl_w0b0_br_ntake           ),
  .ifdp_ipctrl_w0b0_br_taken            (ifdp_ipctrl_w0b0_br_taken           ),
  .ifdp_ipctrl_w0b0_bry_data            (ifdp_ipctrl_w0b0_bry_data           ),
  .ifdp_ipctrl_w0b1_br_ntake            (ifdp_ipctrl_w0b1_br_ntake           ),
  .ifdp_ipctrl_w0b1_br_taken            (ifdp_ipctrl_w0b1_br_taken           ),
  .ifdp_ipctrl_w0b1_bry_data            (ifdp_ipctrl_w0b1_bry_data           ),
  .ifdp_ipctrl_w1_bry0_hit              (ifdp_ipctrl_w1_bry0_hit             ),
  .ifdp_ipctrl_w1_bry1_hit              (ifdp_ipctrl_w1_bry1_hit             ),
  .ifdp_ipctrl_w1b0_br_ntake            (ifdp_ipctrl_w1b0_br_ntake           ),
  .ifdp_ipctrl_w1b0_br_taken            (ifdp_ipctrl_w1b0_br_taken           ),
  .ifdp_ipctrl_w1b0_bry_data            (ifdp_ipctrl_w1b0_bry_data           ),
  .ifdp_ipctrl_w1b1_br_ntake            (ifdp_ipctrl_w1b1_br_ntake           ),
  .ifdp_ipctrl_w1b1_br_taken            (ifdp_ipctrl_w1b1_br_taken           ),
  .ifdp_ipctrl_w1b1_bry_data            (ifdp_ipctrl_w1b1_bry_data           ),
  .ifdp_ipctrl_way0_15_8_hit            (ifdp_ipctrl_way0_15_8_hit           ),
  .ifdp_ipctrl_way0_15_8_hit_dup        (ifdp_ipctrl_way0_15_8_hit_dup       ),
  .ifdp_ipctrl_way0_23_16_hit           (ifdp_ipctrl_way0_23_16_hit          ),
  .ifdp_ipctrl_way0_23_16_hit_dup       (ifdp_ipctrl_way0_23_16_hit_dup      ),
  .ifdp_ipctrl_way0_28_24_hit           (ifdp_ipctrl_way0_28_24_hit          ),
  .ifdp_ipctrl_way0_28_24_hit_dup       (ifdp_ipctrl_way0_28_24_hit_dup      ),
  .ifdp_ipctrl_way0_7_0_hit             (ifdp_ipctrl_way0_7_0_hit            ),
  .ifdp_ipctrl_way0_7_0_hit_dup         (ifdp_ipctrl_way0_7_0_hit_dup        ),
  .ifdp_ipctrl_way1_15_8_hit            (ifdp_ipctrl_way1_15_8_hit           ),
  .ifdp_ipctrl_way1_23_16_hit           (ifdp_ipctrl_way1_23_16_hit          ),
  .ifdp_ipctrl_way1_28_24_hit           (ifdp_ipctrl_way1_28_24_hit          ),
  .ifdp_ipctrl_way1_7_0_hit             (ifdp_ipctrl_way1_7_0_hit            ),
  .ifdp_ipctrl_way_pred                 (ifdp_ipctrl_way_pred                ),
  .ipctrl_bht_con_br_gateclk_en         (ipctrl_bht_con_br_gateclk_en        ),
  .ipctrl_bht_con_br_taken              (ipctrl_bht_con_br_taken             ),
  .ipctrl_bht_con_br_vld                (ipctrl_bht_con_br_vld               ),
  .ipctrl_bht_more_br                   (ipctrl_bht_more_br                  ),
  .ipctrl_bht_vld                       (ipctrl_bht_vld                      ),
  .ipctrl_btb_chgflw_vld                (ipctrl_btb_chgflw_vld               ),
  .ipctrl_btb_way_pred                  (ipctrl_btb_way_pred                 ),
  .ipctrl_btb_way_pred_error            (ipctrl_btb_way_pred_error           ),
  .ipctrl_debug_bry_missigned_stall     (ipctrl_debug_bry_missigned_stall    ),
  .ipctrl_debug_h0_vld                  (ipctrl_debug_h0_vld                 ),
  .ipctrl_debug_ip_expt_vld             (ipctrl_debug_ip_expt_vld            ),
  .ipctrl_debug_ip_if_stall             (ipctrl_debug_ip_if_stall            ),
  .ipctrl_debug_ip_vld                  (ipctrl_debug_ip_vld                 ),
  .ipctrl_debug_miss_under_refill_stall (ipctrl_debug_miss_under_refill_stall),
  .ipctrl_ibctrl_expt_vld               (ipctrl_ibctrl_expt_vld              ),
  .ipctrl_ibctrl_if_chgflw_vld          (ipctrl_ibctrl_if_chgflw_vld         ),
  .ipctrl_ibctrl_ip_chgflw_vld          (ipctrl_ibctrl_ip_chgflw_vld         ),
  .ipctrl_ibctrl_l0_btb_hit             (ipctrl_ibctrl_l0_btb_hit            ),
  .ipctrl_ibctrl_l0_btb_mispred         (ipctrl_ibctrl_l0_btb_mispred        ),
  .ipctrl_ibctrl_l0_btb_miss            (ipctrl_ibctrl_l0_btb_miss           ),
  .ipctrl_ibctrl_l0_btb_st_wait         (ipctrl_ibctrl_l0_btb_st_wait        ),
  .ipctrl_ibctrl_vld                    (ipctrl_ibctrl_vld                   ),
  .ipctrl_ibdp_expt_vld                 (ipctrl_ibdp_expt_vld                ),
  .ipctrl_ibdp_vld                      (ipctrl_ibdp_vld                     ),
  .ipctrl_ifctrl_bht_stall              (ipctrl_ifctrl_bht_stall             ),
  .ipctrl_ifctrl_stall                  (ipctrl_ifctrl_stall                 ),
  .ipctrl_ifctrl_stall_short            (ipctrl_ifctrl_stall_short           ),
  .ipctrl_ifdp_gateclk_en               (ipctrl_ifdp_gateclk_en              ),
  .ipctrl_ifdp_vpc_onehot_updt          (ipctrl_ifdp_vpc_onehot_updt         ),
  .ipctrl_ifdp_w0_bry0_hit_updt         (ipctrl_ifdp_w0_bry0_hit_updt        ),
  .ipctrl_ifdp_w0_bry1_hit_updt         (ipctrl_ifdp_w0_bry1_hit_updt        ),
  .ipctrl_ifdp_w0b0_br_ntake_updt       (ipctrl_ifdp_w0b0_br_ntake_updt      ),
  .ipctrl_ifdp_w0b0_br_taken_updt       (ipctrl_ifdp_w0b0_br_taken_updt      ),
  .ipctrl_ifdp_w0b0_bry_updt_data       (ipctrl_ifdp_w0b0_bry_updt_data      ),
  .ipctrl_ifdp_w0b1_br_ntake_updt       (ipctrl_ifdp_w0b1_br_ntake_updt      ),
  .ipctrl_ifdp_w0b1_br_taken_updt       (ipctrl_ifdp_w0b1_br_taken_updt      ),
  .ipctrl_ifdp_w0b1_bry_updt_data       (ipctrl_ifdp_w0b1_bry_updt_data      ),
  .ipctrl_ifdp_w1_bry0_hit_updt         (ipctrl_ifdp_w1_bry0_hit_updt        ),
  .ipctrl_ifdp_w1_bry1_hit_updt         (ipctrl_ifdp_w1_bry1_hit_updt        ),
  .ipctrl_ifdp_w1b0_br_ntake_updt       (ipctrl_ifdp_w1b0_br_ntake_updt      ),
  .ipctrl_ifdp_w1b0_br_taken_updt       (ipctrl_ifdp_w1b0_br_taken_updt      ),
  .ipctrl_ifdp_w1b0_bry_updt_data       (ipctrl_ifdp_w1b0_bry_updt_data      ),
  .ipctrl_ifdp_w1b1_br_ntake_updt       (ipctrl_ifdp_w1b1_br_ntake_updt      ),
  .ipctrl_ifdp_w1b1_br_taken_updt       (ipctrl_ifdp_w1b1_br_taken_updt      ),
  .ipctrl_ifdp_w1b1_bry_updt_data       (ipctrl_ifdp_w1b1_bry_updt_data      ),
  .ipctrl_ind_btb_con_br_vld            (ipctrl_ind_btb_con_br_vld           ),
  .ipctrl_ipdp_bht_vld                  (ipctrl_ipdp_bht_vld                 ),
  .ipctrl_ipdp_br_more_than_one_stall   (ipctrl_ipdp_br_more_than_one_stall  ),
  .ipctrl_ipdp_branch                   (ipctrl_ipdp_branch                  ),
  .ipctrl_ipdp_bry_data                 (ipctrl_ipdp_bry_data                ),
  .ipctrl_ipdp_chgflw_pc                (ipctrl_ipdp_chgflw_pc               ),
  .ipctrl_ipdp_con_br                   (ipctrl_ipdp_con_br                  ),
  .ipctrl_ipdp_h0_update_vld            (ipctrl_ipdp_h0_update_vld           ),
  .ipctrl_ipdp_h0_updt_gateclk_en       (ipctrl_ipdp_h0_updt_gateclk_en      ),
  .ipctrl_ipdp_hn_con_br                (ipctrl_ipdp_hn_con_br               ),
  .ipctrl_ipdp_icache_way0_hit          (ipctrl_ipdp_icache_way0_hit         ),
  .ipctrl_ipdp_icache_way0_hit_short    (ipctrl_ipdp_icache_way0_hit_short   ),
  .ipctrl_ipdp_if_pcload                (ipctrl_ipdp_if_pcload               ),
  .ipctrl_ipdp_ip_data_vld              (ipctrl_ipdp_ip_data_vld             ),
  .ipctrl_ipdp_ip_mistaken              (ipctrl_ipdp_ip_mistaken             ),
  .ipctrl_ipdp_ip_pcload                (ipctrl_ipdp_ip_pcload               ),
  .ipctrl_ipdp_l0_btb_hit               (ipctrl_ipdp_l0_btb_hit              ),
  .ipctrl_ipdp_pipe_cancel              (ipctrl_ipdp_pipe_cancel             ),
  .ipctrl_ipdp_pipe_stall               (ipctrl_ipdp_pipe_stall              ),
  .ipctrl_ipdp_pipe_vld                 (ipctrl_ipdp_pipe_vld                ),
  .ipctrl_ipdp_pipe_vld_for_gateclk     (ipctrl_ipdp_pipe_vld_for_gateclk    ),
  .ipctrl_ipdp_self_stall               (ipctrl_ipdp_self_stall              ),
  .ipctrl_ipdp_vpc_mask                 (ipctrl_ipdp_vpc_mask                ),
  .ipctrl_ipdp_vpc_next                 (ipctrl_ipdp_vpc_next                ),
  .ipctrl_ipdp_vpc_onehot               (ipctrl_ipdp_vpc_onehot              ),
  .ipctrl_l0_btb_chgflw_vld             (ipctrl_l0_btb_chgflw_vld            ),
  .ipctrl_l0_btb_ip_vld                 (ipctrl_l0_btb_ip_vld                ),
  .ipctrl_l0_btb_wait_next              (ipctrl_l0_btb_wait_next             ),
  .ipctrl_l1_refill_chk_err             (ipctrl_l1_refill_chk_err            ),
  .ipctrl_l1_refill_fifo                (ipctrl_l1_refill_fifo               ),
  .ipctrl_l1_refill_miss_req            (ipctrl_l1_refill_miss_req           ),
  .ipctrl_l1_refill_ppc                 (ipctrl_l1_refill_ppc                ),
  .ipctrl_l1_refill_req_for_gateclk     (ipctrl_l1_refill_req_for_gateclk    ),
  .ipctrl_l1_refill_vpc                 (ipctrl_l1_refill_vpc                ),
  .ipctrl_pcgen_branch_mistaken         (ipctrl_pcgen_branch_mistaken        ),
  .ipctrl_pcgen_branch_taken            (ipctrl_pcgen_branch_taken           ),
  .ipctrl_pcgen_chgflw_pc               (ipctrl_pcgen_chgflw_pc              ),
  .ipctrl_pcgen_chgflw_pcload           (ipctrl_pcgen_chgflw_pcload          ),
  .ipctrl_pcgen_chgflw_way_pred         (ipctrl_pcgen_chgflw_way_pred        ),
  .ipctrl_pcgen_chk_err_reissue         (ipctrl_pcgen_chk_err_reissue        ),
  .ipctrl_pcgen_h0_vld                  (ipctrl_pcgen_h0_vld                 ),
  .ipctrl_pcgen_if_stall                (ipctrl_pcgen_if_stall               ),
  .ipctrl_pcgen_inner_way0              (ipctrl_pcgen_inner_way0             ),
  .ipctrl_pcgen_inner_way1              (ipctrl_pcgen_inner_way1             ),
  .ipctrl_pcgen_inner_way_pred          (ipctrl_pcgen_inner_way_pred         ),
  .ipctrl_pcgen_reissue_pc              (ipctrl_pcgen_reissue_pc             ),
  .ipctrl_pcgen_reissue_pcload          (ipctrl_pcgen_reissue_pcload         ),
  .ipctrl_pcgen_reissue_way_pred        (ipctrl_pcgen_reissue_way_pred       ),
  .ipctrl_pcgen_taken_pc                (ipctrl_pcgen_taken_pc               ),
  .ipdp_ipctrl_bht_data                 (ipdp_ipctrl_bht_data                ),
  .ipdp_ipctrl_bht_result               (ipdp_ipctrl_bht_result              ),
  .ipdp_ipctrl_btb_way0_pred            (ipdp_ipctrl_btb_way0_pred           ),
  .ipdp_ipctrl_btb_way0_target          (ipdp_ipctrl_btb_way0_target         ),
  .ipdp_ipctrl_btb_way1_pred            (ipdp_ipctrl_btb_way1_pred           ),
  .ipdp_ipctrl_btb_way1_target          (ipdp_ipctrl_btb_way1_target         ),
  .ipdp_ipctrl_btb_way2_pred            (ipdp_ipctrl_btb_way2_pred           ),
  .ipdp_ipctrl_btb_way2_target          (ipdp_ipctrl_btb_way2_target         ),
  .ipdp_ipctrl_btb_way3_pred            (ipdp_ipctrl_btb_way3_pred           ),
  .ipdp_ipctrl_btb_way3_target          (ipdp_ipctrl_btb_way3_target         ),
  .ipdp_ipctrl_con_br_first_branch      (ipdp_ipctrl_con_br_first_branch     ),
  .ipdp_ipctrl_con_br_more_than_one     (ipdp_ipctrl_con_br_more_than_one    ),
  .ipdp_ipctrl_h0_ab_br                 (ipdp_ipctrl_h0_ab_br                ),
  .ipdp_ipctrl_h0_br                    (ipdp_ipctrl_h0_br                   ),
  .ipdp_ipctrl_h0_con_br                (ipdp_ipctrl_h0_con_br               ),
  .ipdp_ipctrl_h0_vld                   (ipdp_ipctrl_h0_vld                  ),
  .ipdp_ipctrl_h8_br                    (ipdp_ipctrl_h8_br                   ),
  .ipdp_ipctrl_inst_32                  (ipdp_ipctrl_inst_32                 ),
  .ipdp_ipctrl_ip_expt_vld              (ipdp_ipctrl_ip_expt_vld             ),
  .ipdp_ipctrl_l0_btb_hit_way           (ipdp_ipctrl_l0_btb_hit_way          ),
  .ipdp_ipctrl_l0_btb_mispred_pc        (ipdp_ipctrl_l0_btb_mispred_pc       ),
  .ipdp_ipctrl_l0_btb_ras               (ipdp_ipctrl_l0_btb_ras              ),
  .ipdp_ipctrl_l0_btb_vld               (ipdp_ipctrl_l0_btb_vld              ),
  .ipdp_ipctrl_no_br                    (ipdp_ipctrl_no_br                   ),
  .ipdp_ipctrl_vpc                      (ipdp_ipctrl_vpc                     ),
  .ipdp_ipctrl_w0_ab_br                 (ipdp_ipctrl_w0_ab_br                ),
  .ipdp_ipctrl_w0_br                    (ipdp_ipctrl_w0_br                   ),
  .ipdp_ipctrl_w1_ab_br                 (ipdp_ipctrl_w1_ab_br                ),
  .ipdp_ipctrl_w1_br                    (ipdp_ipctrl_w1_br                   ),
  .ipdp_ipctrl_way0_32                  (ipdp_ipctrl_way0_32                 ),
  .ipdp_ipctrl_way1_32                  (ipdp_ipctrl_way1_32                 ),
  .l0_btb_ipctrl_st_wait                (l0_btb_ipctrl_st_wait               ),
  .l1_refill_ipctrl_busy                (l1_refill_ipctrl_busy               ),
  .pcgen_ipctrl_cancel                  (pcgen_ipctrl_cancel                 ),
  .pcgen_ipctrl_pipe_cancel             (pcgen_ipctrl_pipe_cancel            ),
  .rtu_ifu_xx_dbgon                     (rtu_ifu_xx_dbgon                    ),
  .rtu_yy_xx_dbgon                      (rtu_yy_xx_dbgon                     )
);

// &Instance("ct_ifu_ipdp",           "x_ct_ifu_ipdp"); @83
ct_ifu_ipdp  x_ct_ifu_ipdp (
  .addrgen_ipdp_chgflw_vl             (addrgen_ipdp_chgflw_vl            ),
  .addrgen_ipdp_chgflw_vlmul          (addrgen_ipdp_chgflw_vlmul         ),
  .addrgen_ipdp_chgflw_vsew           (addrgen_ipdp_chgflw_vsew          ),
  .addrgen_xx_pcload                  (addrgen_xx_pcload                 ),
  .bht_ipdp_pre_array_data_ntake      (bht_ipdp_pre_array_data_ntake     ),
  .bht_ipdp_pre_array_data_taken      (bht_ipdp_pre_array_data_taken     ),
  .bht_ipdp_pre_offset_onehot         (bht_ipdp_pre_offset_onehot        ),
  .bht_ipdp_sel_array_result          (bht_ipdp_sel_array_result         ),
  .bht_ipdp_vghr                      (bht_ipdp_vghr                     ),
  .cp0_idu_cskyee                     (cp0_idu_cskyee                    ),
  .cp0_idu_frm                        (cp0_idu_frm                       ),
  .cp0_idu_fs                         (cp0_idu_fs                        ),
  .cp0_ifu_btb_en                     (cp0_ifu_btb_en                    ),
  .cp0_ifu_icg_en                     (cp0_ifu_icg_en                    ),
  .cp0_ifu_vl                         (cp0_ifu_vl                        ),
  .cp0_ifu_vlmul                      (cp0_ifu_vlmul                     ),
  .cp0_ifu_vsetvli_pred_disable       (cp0_ifu_vsetvli_pred_disable      ),
  .cp0_ifu_vsew                       (cp0_ifu_vsew                      ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .had_ifu_ir                         (had_ifu_ir                        ),
  .had_ifu_ir_vld                     (had_ifu_ir_vld                    ),
  .ibctrl_ipdp_chgflw_vl              (ibctrl_ipdp_chgflw_vl             ),
  .ibctrl_ipdp_chgflw_vlmul           (ibctrl_ipdp_chgflw_vlmul          ),
  .ibctrl_ipdp_chgflw_vsew            (ibctrl_ipdp_chgflw_vsew           ),
  .ibctrl_ipdp_pcload                 (ibctrl_ipdp_pcload                ),
  .ifdp_ipdp_acc_err                  (ifdp_ipdp_acc_err                 ),
  .ifdp_ipdp_bkpta                    (ifdp_ipdp_bkpta                   ),
  .ifdp_ipdp_bkptb                    (ifdp_ipdp_bkptb                   ),
  .ifdp_ipdp_btb_way0_pred            (ifdp_ipdp_btb_way0_pred           ),
  .ifdp_ipdp_btb_way0_tag             (ifdp_ipdp_btb_way0_tag            ),
  .ifdp_ipdp_btb_way0_target          (ifdp_ipdp_btb_way0_target         ),
  .ifdp_ipdp_btb_way0_vld             (ifdp_ipdp_btb_way0_vld            ),
  .ifdp_ipdp_btb_way1_pred            (ifdp_ipdp_btb_way1_pred           ),
  .ifdp_ipdp_btb_way1_tag             (ifdp_ipdp_btb_way1_tag            ),
  .ifdp_ipdp_btb_way1_target          (ifdp_ipdp_btb_way1_target         ),
  .ifdp_ipdp_btb_way1_vld             (ifdp_ipdp_btb_way1_vld            ),
  .ifdp_ipdp_btb_way2_pred            (ifdp_ipdp_btb_way2_pred           ),
  .ifdp_ipdp_btb_way2_tag             (ifdp_ipdp_btb_way2_tag            ),
  .ifdp_ipdp_btb_way2_target          (ifdp_ipdp_btb_way2_target         ),
  .ifdp_ipdp_btb_way2_vld             (ifdp_ipdp_btb_way2_vld            ),
  .ifdp_ipdp_btb_way3_pred            (ifdp_ipdp_btb_way3_pred           ),
  .ifdp_ipdp_btb_way3_tag             (ifdp_ipdp_btb_way3_tag            ),
  .ifdp_ipdp_btb_way3_target          (ifdp_ipdp_btb_way3_target         ),
  .ifdp_ipdp_btb_way3_vld             (ifdp_ipdp_btb_way3_vld            ),
  .ifdp_ipdp_h1_inst_high_way0        (ifdp_ipdp_h1_inst_high_way0       ),
  .ifdp_ipdp_h1_inst_high_way1        (ifdp_ipdp_h1_inst_high_way1       ),
  .ifdp_ipdp_h1_inst_low_way0         (ifdp_ipdp_h1_inst_low_way0        ),
  .ifdp_ipdp_h1_inst_low_way1         (ifdp_ipdp_h1_inst_low_way1        ),
  .ifdp_ipdp_h1_precode_way0          (ifdp_ipdp_h1_precode_way0         ),
  .ifdp_ipdp_h1_precode_way1          (ifdp_ipdp_h1_precode_way1         ),
  .ifdp_ipdp_h2_inst_high_way0        (ifdp_ipdp_h2_inst_high_way0       ),
  .ifdp_ipdp_h2_inst_high_way1        (ifdp_ipdp_h2_inst_high_way1       ),
  .ifdp_ipdp_h2_inst_low_way0         (ifdp_ipdp_h2_inst_low_way0        ),
  .ifdp_ipdp_h2_inst_low_way1         (ifdp_ipdp_h2_inst_low_way1        ),
  .ifdp_ipdp_h2_precode_way0          (ifdp_ipdp_h2_precode_way0         ),
  .ifdp_ipdp_h2_precode_way1          (ifdp_ipdp_h2_precode_way1         ),
  .ifdp_ipdp_h3_inst_high_way0        (ifdp_ipdp_h3_inst_high_way0       ),
  .ifdp_ipdp_h3_inst_high_way1        (ifdp_ipdp_h3_inst_high_way1       ),
  .ifdp_ipdp_h3_inst_low_way0         (ifdp_ipdp_h3_inst_low_way0        ),
  .ifdp_ipdp_h3_inst_low_way1         (ifdp_ipdp_h3_inst_low_way1        ),
  .ifdp_ipdp_h3_precode_way0          (ifdp_ipdp_h3_precode_way0         ),
  .ifdp_ipdp_h3_precode_way1          (ifdp_ipdp_h3_precode_way1         ),
  .ifdp_ipdp_h4_inst_high_way0        (ifdp_ipdp_h4_inst_high_way0       ),
  .ifdp_ipdp_h4_inst_high_way1        (ifdp_ipdp_h4_inst_high_way1       ),
  .ifdp_ipdp_h4_inst_low_way0         (ifdp_ipdp_h4_inst_low_way0        ),
  .ifdp_ipdp_h4_inst_low_way1         (ifdp_ipdp_h4_inst_low_way1        ),
  .ifdp_ipdp_h4_precode_way0          (ifdp_ipdp_h4_precode_way0         ),
  .ifdp_ipdp_h4_precode_way1          (ifdp_ipdp_h4_precode_way1         ),
  .ifdp_ipdp_h5_inst_high_way0        (ifdp_ipdp_h5_inst_high_way0       ),
  .ifdp_ipdp_h5_inst_high_way1        (ifdp_ipdp_h5_inst_high_way1       ),
  .ifdp_ipdp_h5_inst_low_way0         (ifdp_ipdp_h5_inst_low_way0        ),
  .ifdp_ipdp_h5_inst_low_way1         (ifdp_ipdp_h5_inst_low_way1        ),
  .ifdp_ipdp_h5_precode_way0          (ifdp_ipdp_h5_precode_way0         ),
  .ifdp_ipdp_h5_precode_way1          (ifdp_ipdp_h5_precode_way1         ),
  .ifdp_ipdp_h6_inst_high_way0        (ifdp_ipdp_h6_inst_high_way0       ),
  .ifdp_ipdp_h6_inst_high_way1        (ifdp_ipdp_h6_inst_high_way1       ),
  .ifdp_ipdp_h6_inst_low_way0         (ifdp_ipdp_h6_inst_low_way0        ),
  .ifdp_ipdp_h6_inst_low_way1         (ifdp_ipdp_h6_inst_low_way1        ),
  .ifdp_ipdp_h6_precode_way0          (ifdp_ipdp_h6_precode_way0         ),
  .ifdp_ipdp_h6_precode_way1          (ifdp_ipdp_h6_precode_way1         ),
  .ifdp_ipdp_h7_inst_high_way0        (ifdp_ipdp_h7_inst_high_way0       ),
  .ifdp_ipdp_h7_inst_high_way1        (ifdp_ipdp_h7_inst_high_way1       ),
  .ifdp_ipdp_h7_inst_low_way0         (ifdp_ipdp_h7_inst_low_way0        ),
  .ifdp_ipdp_h7_inst_low_way1         (ifdp_ipdp_h7_inst_low_way1        ),
  .ifdp_ipdp_h7_precode_way0          (ifdp_ipdp_h7_precode_way0         ),
  .ifdp_ipdp_h7_precode_way1          (ifdp_ipdp_h7_precode_way1         ),
  .ifdp_ipdp_h8_inst_high_way0        (ifdp_ipdp_h8_inst_high_way0       ),
  .ifdp_ipdp_h8_inst_high_way1        (ifdp_ipdp_h8_inst_high_way1       ),
  .ifdp_ipdp_h8_inst_low_way0         (ifdp_ipdp_h8_inst_low_way0        ),
  .ifdp_ipdp_h8_inst_low_way1         (ifdp_ipdp_h8_inst_low_way1        ),
  .ifdp_ipdp_h8_precode_way0          (ifdp_ipdp_h8_precode_way0         ),
  .ifdp_ipdp_h8_precode_way1          (ifdp_ipdp_h8_precode_way1         ),
  .ifdp_ipdp_l0_btb_counter           (ifdp_ipdp_l0_btb_counter          ),
  .ifdp_ipdp_l0_btb_entry_hit         (ifdp_ipdp_l0_btb_entry_hit        ),
  .ifdp_ipdp_l0_btb_hit               (ifdp_ipdp_l0_btb_hit              ),
  .ifdp_ipdp_l0_btb_mispred_pc        (ifdp_ipdp_l0_btb_mispred_pc       ),
  .ifdp_ipdp_l0_btb_ras               (ifdp_ipdp_l0_btb_ras              ),
  .ifdp_ipdp_l0_btb_target            (ifdp_ipdp_l0_btb_target           ),
  .ifdp_ipdp_l0_btb_way0_high_hit     (ifdp_ipdp_l0_btb_way0_high_hit    ),
  .ifdp_ipdp_l0_btb_way0_low_hit      (ifdp_ipdp_l0_btb_way0_low_hit     ),
  .ifdp_ipdp_l0_btb_way1_high_hit     (ifdp_ipdp_l0_btb_way1_high_hit    ),
  .ifdp_ipdp_l0_btb_way1_low_hit      (ifdp_ipdp_l0_btb_way1_low_hit     ),
  .ifdp_ipdp_l0_btb_way2_high_hit     (ifdp_ipdp_l0_btb_way2_high_hit    ),
  .ifdp_ipdp_l0_btb_way2_low_hit      (ifdp_ipdp_l0_btb_way2_low_hit     ),
  .ifdp_ipdp_l0_btb_way3_high_hit     (ifdp_ipdp_l0_btb_way3_high_hit    ),
  .ifdp_ipdp_l0_btb_way3_low_hit      (ifdp_ipdp_l0_btb_way3_low_hit     ),
  .ifdp_ipdp_l0_btb_way_pred          (ifdp_ipdp_l0_btb_way_pred         ),
  .ifdp_ipdp_mmu_pgflt                (ifdp_ipdp_mmu_pgflt               ),
  .ifdp_ipdp_sfp_hit_pc_lo            (ifdp_ipdp_sfp_hit_pc_lo           ),
  .ifdp_ipdp_sfp_hit_type             (ifdp_ipdp_sfp_hit_type            ),
  .ifdp_ipdp_sfp_pc_hit               (ifdp_ipdp_sfp_pc_hit              ),
  .ifdp_ipdp_vpc                      (ifdp_ipdp_vpc                     ),
  .ipctrl_ipdp_bht_vld                (ipctrl_ipdp_bht_vld               ),
  .ipctrl_ipdp_br_more_than_one_stall (ipctrl_ipdp_br_more_than_one_stall),
  .ipctrl_ipdp_branch                 (ipctrl_ipdp_branch                ),
  .ipctrl_ipdp_bry_data               (ipctrl_ipdp_bry_data              ),
  .ipctrl_ipdp_chgflw_pc              (ipctrl_ipdp_chgflw_pc             ),
  .ipctrl_ipdp_con_br                 (ipctrl_ipdp_con_br                ),
  .ipctrl_ipdp_h0_update_vld          (ipctrl_ipdp_h0_update_vld         ),
  .ipctrl_ipdp_h0_updt_gateclk_en     (ipctrl_ipdp_h0_updt_gateclk_en    ),
  .ipctrl_ipdp_hn_con_br              (ipctrl_ipdp_hn_con_br             ),
  .ipctrl_ipdp_icache_way0_hit        (ipctrl_ipdp_icache_way0_hit       ),
  .ipctrl_ipdp_icache_way0_hit_short  (ipctrl_ipdp_icache_way0_hit_short ),
  .ipctrl_ipdp_if_pcload              (ipctrl_ipdp_if_pcload             ),
  .ipctrl_ipdp_ip_data_vld            (ipctrl_ipdp_ip_data_vld           ),
  .ipctrl_ipdp_ip_mistaken            (ipctrl_ipdp_ip_mistaken           ),
  .ipctrl_ipdp_ip_pcload              (ipctrl_ipdp_ip_pcload             ),
  .ipctrl_ipdp_l0_btb_hit             (ipctrl_ipdp_l0_btb_hit            ),
  .ipctrl_ipdp_pipe_cancel            (ipctrl_ipdp_pipe_cancel           ),
  .ipctrl_ipdp_pipe_stall             (ipctrl_ipdp_pipe_stall            ),
  .ipctrl_ipdp_pipe_vld               (ipctrl_ipdp_pipe_vld              ),
  .ipctrl_ipdp_pipe_vld_for_gateclk   (ipctrl_ipdp_pipe_vld_for_gateclk  ),
  .ipctrl_ipdp_self_stall             (ipctrl_ipdp_self_stall            ),
  .ipctrl_ipdp_vpc_mask               (ipctrl_ipdp_vpc_mask              ),
  .ipctrl_ipdp_vpc_next               (ipctrl_ipdp_vpc_next              ),
  .ipctrl_ipdp_vpc_onehot             (ipctrl_ipdp_vpc_onehot            ),
  .ipdp_bht_h0_con_br                 (ipdp_bht_h0_con_br                ),
  .ipdp_bht_vpc                       (ipdp_bht_vpc                      ),
  .ipdp_btb_index_pc                  (ipdp_btb_index_pc                 ),
  .ipdp_btb_target_pc                 (ipdp_btb_target_pc                ),
  .ipdp_ibdp_bht_pre_result           (ipdp_ibdp_bht_pre_result          ),
  .ipdp_ibdp_bht_result               (ipdp_ibdp_bht_result              ),
  .ipdp_ibdp_bht_sel_result           (ipdp_ibdp_bht_sel_result          ),
  .ipdp_ibdp_branch_base              (ipdp_ibdp_branch_base             ),
  .ipdp_ibdp_branch_btb_miss          (ipdp_ibdp_branch_btb_miss         ),
  .ipdp_ibdp_branch_offset            (ipdp_ibdp_branch_offset           ),
  .ipdp_ibdp_branch_result            (ipdp_ibdp_branch_result           ),
  .ipdp_ibdp_branch_vl                (ipdp_ibdp_branch_vl               ),
  .ipdp_ibdp_branch_vlmul             (ipdp_ibdp_branch_vlmul            ),
  .ipdp_ibdp_branch_vsew              (ipdp_ibdp_branch_vsew             ),
  .ipdp_ibdp_branch_way_pred          (ipdp_ibdp_branch_way_pred         ),
  .ipdp_ibdp_btb_index_pc             (ipdp_ibdp_btb_index_pc            ),
  .ipdp_ibdp_chgflw_mask              (ipdp_ibdp_chgflw_mask             ),
  .ipdp_ibdp_chgflw_num               (ipdp_ibdp_chgflw_num              ),
  .ipdp_ibdp_chgflw_num_vld           (ipdp_ibdp_chgflw_num_vld          ),
  .ipdp_ibdp_chgflw_vl                (ipdp_ibdp_chgflw_vl               ),
  .ipdp_ibdp_chgflw_vlmul             (ipdp_ibdp_chgflw_vlmul            ),
  .ipdp_ibdp_chgflw_vsew              (ipdp_ibdp_chgflw_vsew             ),
  .ipdp_ibdp_con_br_cur_pc            (ipdp_ibdp_con_br_cur_pc           ),
  .ipdp_ibdp_con_br_half_num          (ipdp_ibdp_con_br_half_num         ),
  .ipdp_ibdp_con_br_inst_32           (ipdp_ibdp_con_br_inst_32          ),
  .ipdp_ibdp_con_br_num               (ipdp_ibdp_con_br_num              ),
  .ipdp_ibdp_con_br_num_vld           (ipdp_ibdp_con_br_num_vld          ),
  .ipdp_ibdp_con_br_offset            (ipdp_ibdp_con_br_offset           ),
  .ipdp_ibdp_h0_bkpta                 (ipdp_ibdp_h0_bkpta                ),
  .ipdp_ibdp_h0_bkptb                 (ipdp_ibdp_h0_bkptb                ),
  .ipdp_ibdp_h0_con_br                (ipdp_ibdp_h0_con_br               ),
  .ipdp_ibdp_h0_cur_pc                (ipdp_ibdp_h0_cur_pc               ),
  .ipdp_ibdp_h0_data                  (ipdp_ibdp_h0_data                 ),
  .ipdp_ibdp_h0_fence                 (ipdp_ibdp_h0_fence                ),
  .ipdp_ibdp_h0_high_expt             (ipdp_ibdp_h0_high_expt            ),
  .ipdp_ibdp_h0_ldst                  (ipdp_ibdp_h0_ldst                 ),
  .ipdp_ibdp_h0_no_spec               (ipdp_ibdp_h0_no_spec              ),
  .ipdp_ibdp_h0_spe_vld               (ipdp_ibdp_h0_spe_vld              ),
  .ipdp_ibdp_h0_split0                (ipdp_ibdp_h0_split0               ),
  .ipdp_ibdp_h0_split0_type           (ipdp_ibdp_h0_split0_type          ),
  .ipdp_ibdp_h0_split1                (ipdp_ibdp_h0_split1               ),
  .ipdp_ibdp_h0_split1_type           (ipdp_ibdp_h0_split1_type          ),
  .ipdp_ibdp_h0_vl                    (ipdp_ibdp_h0_vl                   ),
  .ipdp_ibdp_h0_vl_pred               (ipdp_ibdp_h0_vl_pred              ),
  .ipdp_ibdp_h0_vld                   (ipdp_ibdp_h0_vld                  ),
  .ipdp_ibdp_h0_vlmul                 (ipdp_ibdp_h0_vlmul                ),
  .ipdp_ibdp_h0_vsetvli               (ipdp_ibdp_h0_vsetvli              ),
  .ipdp_ibdp_h0_vsew                  (ipdp_ibdp_h0_vsew                 ),
  .ipdp_ibdp_h1_base                  (ipdp_ibdp_h1_base                 ),
  .ipdp_ibdp_h1_data                  (ipdp_ibdp_h1_data                 ),
  .ipdp_ibdp_h1_split0_type           (ipdp_ibdp_h1_split0_type          ),
  .ipdp_ibdp_h1_split1_type           (ipdp_ibdp_h1_split1_type          ),
  .ipdp_ibdp_h1_vl                    (ipdp_ibdp_h1_vl                   ),
  .ipdp_ibdp_h1_vlmul                 (ipdp_ibdp_h1_vlmul                ),
  .ipdp_ibdp_h1_vsew                  (ipdp_ibdp_h1_vsew                 ),
  .ipdp_ibdp_h2_base                  (ipdp_ibdp_h2_base                 ),
  .ipdp_ibdp_h2_data                  (ipdp_ibdp_h2_data                 ),
  .ipdp_ibdp_h2_split0_type           (ipdp_ibdp_h2_split0_type          ),
  .ipdp_ibdp_h2_split1_type           (ipdp_ibdp_h2_split1_type          ),
  .ipdp_ibdp_h2_vl                    (ipdp_ibdp_h2_vl                   ),
  .ipdp_ibdp_h2_vlmul                 (ipdp_ibdp_h2_vlmul                ),
  .ipdp_ibdp_h2_vsew                  (ipdp_ibdp_h2_vsew                 ),
  .ipdp_ibdp_h3_base                  (ipdp_ibdp_h3_base                 ),
  .ipdp_ibdp_h3_data                  (ipdp_ibdp_h3_data                 ),
  .ipdp_ibdp_h3_split0_type           (ipdp_ibdp_h3_split0_type          ),
  .ipdp_ibdp_h3_split1_type           (ipdp_ibdp_h3_split1_type          ),
  .ipdp_ibdp_h3_vl                    (ipdp_ibdp_h3_vl                   ),
  .ipdp_ibdp_h3_vlmul                 (ipdp_ibdp_h3_vlmul                ),
  .ipdp_ibdp_h3_vsew                  (ipdp_ibdp_h3_vsew                 ),
  .ipdp_ibdp_h4_base                  (ipdp_ibdp_h4_base                 ),
  .ipdp_ibdp_h4_data                  (ipdp_ibdp_h4_data                 ),
  .ipdp_ibdp_h4_split0_type           (ipdp_ibdp_h4_split0_type          ),
  .ipdp_ibdp_h4_split1_type           (ipdp_ibdp_h4_split1_type          ),
  .ipdp_ibdp_h4_vl                    (ipdp_ibdp_h4_vl                   ),
  .ipdp_ibdp_h4_vlmul                 (ipdp_ibdp_h4_vlmul                ),
  .ipdp_ibdp_h4_vsew                  (ipdp_ibdp_h4_vsew                 ),
  .ipdp_ibdp_h5_base                  (ipdp_ibdp_h5_base                 ),
  .ipdp_ibdp_h5_data                  (ipdp_ibdp_h5_data                 ),
  .ipdp_ibdp_h5_split0_type           (ipdp_ibdp_h5_split0_type          ),
  .ipdp_ibdp_h5_split1_type           (ipdp_ibdp_h5_split1_type          ),
  .ipdp_ibdp_h5_vl                    (ipdp_ibdp_h5_vl                   ),
  .ipdp_ibdp_h5_vlmul                 (ipdp_ibdp_h5_vlmul                ),
  .ipdp_ibdp_h5_vsew                  (ipdp_ibdp_h5_vsew                 ),
  .ipdp_ibdp_h6_base                  (ipdp_ibdp_h6_base                 ),
  .ipdp_ibdp_h6_data                  (ipdp_ibdp_h6_data                 ),
  .ipdp_ibdp_h6_split0_type           (ipdp_ibdp_h6_split0_type          ),
  .ipdp_ibdp_h6_split1_type           (ipdp_ibdp_h6_split1_type          ),
  .ipdp_ibdp_h6_vl                    (ipdp_ibdp_h6_vl                   ),
  .ipdp_ibdp_h6_vlmul                 (ipdp_ibdp_h6_vlmul                ),
  .ipdp_ibdp_h6_vsew                  (ipdp_ibdp_h6_vsew                 ),
  .ipdp_ibdp_h7_base                  (ipdp_ibdp_h7_base                 ),
  .ipdp_ibdp_h7_data                  (ipdp_ibdp_h7_data                 ),
  .ipdp_ibdp_h7_split0_type           (ipdp_ibdp_h7_split0_type          ),
  .ipdp_ibdp_h7_split1_type           (ipdp_ibdp_h7_split1_type          ),
  .ipdp_ibdp_h7_vl                    (ipdp_ibdp_h7_vl                   ),
  .ipdp_ibdp_h7_vlmul                 (ipdp_ibdp_h7_vlmul                ),
  .ipdp_ibdp_h7_vsew                  (ipdp_ibdp_h7_vsew                 ),
  .ipdp_ibdp_h8_base                  (ipdp_ibdp_h8_base                 ),
  .ipdp_ibdp_h8_data                  (ipdp_ibdp_h8_data                 ),
  .ipdp_ibdp_h8_split0_type           (ipdp_ibdp_h8_split0_type          ),
  .ipdp_ibdp_h8_split1_type           (ipdp_ibdp_h8_split1_type          ),
  .ipdp_ibdp_h8_vl                    (ipdp_ibdp_h8_vl                   ),
  .ipdp_ibdp_h8_vlmul                 (ipdp_ibdp_h8_vlmul                ),
  .ipdp_ibdp_h8_vsew                  (ipdp_ibdp_h8_vsew                 ),
  .ipdp_ibdp_hn_32_start              (ipdp_ibdp_hn_32_start             ),
  .ipdp_ibdp_hn_ab_br                 (ipdp_ibdp_hn_ab_br                ),
  .ipdp_ibdp_hn_acc_err               (ipdp_ibdp_hn_acc_err              ),
  .ipdp_ibdp_hn_auipc                 (ipdp_ibdp_hn_auipc                ),
  .ipdp_ibdp_hn_bkpta                 (ipdp_ibdp_hn_bkpta                ),
  .ipdp_ibdp_hn_bkpta_vld             (ipdp_ibdp_hn_bkpta_vld            ),
  .ipdp_ibdp_hn_bkptb                 (ipdp_ibdp_hn_bkptb                ),
  .ipdp_ibdp_hn_bkptb_vld             (ipdp_ibdp_hn_bkptb_vld            ),
  .ipdp_ibdp_hn_chgflw                (ipdp_ibdp_hn_chgflw               ),
  .ipdp_ibdp_hn_con_br                (ipdp_ibdp_hn_con_br               ),
  .ipdp_ibdp_hn_dst_vld               (ipdp_ibdp_hn_dst_vld              ),
  .ipdp_ibdp_hn_fence                 (ipdp_ibdp_hn_fence                ),
  .ipdp_ibdp_hn_ind_br                (ipdp_ibdp_hn_ind_br               ),
  .ipdp_ibdp_hn_jal                   (ipdp_ibdp_hn_jal                  ),
  .ipdp_ibdp_hn_jalr                  (ipdp_ibdp_hn_jalr                 ),
  .ipdp_ibdp_hn_ldst                  (ipdp_ibdp_hn_ldst                 ),
  .ipdp_ibdp_hn_mmu_acc_deny          (ipdp_ibdp_hn_mmu_acc_deny         ),
  .ipdp_ibdp_hn_no_spec               (ipdp_ibdp_hn_no_spec              ),
  .ipdp_ibdp_hn_no_spec_vld           (ipdp_ibdp_hn_no_spec_vld          ),
  .ipdp_ibdp_hn_pc_oper               (ipdp_ibdp_hn_pc_oper              ),
  .ipdp_ibdp_hn_pcall                 (ipdp_ibdp_hn_pcall                ),
  .ipdp_ibdp_hn_pgflt                 (ipdp_ibdp_hn_pgflt                ),
  .ipdp_ibdp_hn_preturn               (ipdp_ibdp_hn_preturn              ),
  .ipdp_ibdp_hn_split0                (ipdp_ibdp_hn_split0               ),
  .ipdp_ibdp_hn_split1                (ipdp_ibdp_hn_split1               ),
  .ipdp_ibdp_hn_vl_pred               (ipdp_ibdp_hn_vl_pred              ),
  .ipdp_ibdp_hn_vld                   (ipdp_ibdp_hn_vld                  ),
  .ipdp_ibdp_hn_vsetvli               (ipdp_ibdp_hn_vsetvli              ),
  .ipdp_ibdp_ind_br_offset            (ipdp_ibdp_ind_br_offset           ),
  .ipdp_ibdp_l0_btb_entry_hit         (ipdp_ibdp_l0_btb_entry_hit        ),
  .ipdp_ibdp_l0_btb_hit               (ipdp_ibdp_l0_btb_hit              ),
  .ipdp_ibdp_l0_btb_mispred_pc        (ipdp_ibdp_l0_btb_mispred_pc       ),
  .ipdp_ibdp_l0_btb_ras               (ipdp_ibdp_l0_btb_ras              ),
  .ipdp_ibdp_l0_btb_ras_pc_hit        (ipdp_ibdp_l0_btb_ras_pc_hit       ),
  .ipdp_ibdp_l0_btb_update_cnt_bit    (ipdp_ibdp_l0_btb_update_cnt_bit   ),
  .ipdp_ibdp_l0_btb_update_vld        (ipdp_ibdp_l0_btb_update_vld       ),
  .ipdp_ibdp_l0_btb_update_vld_bit    (ipdp_ibdp_l0_btb_update_vld_bit   ),
  .ipdp_ibdp_l0_btb_wen               (ipdp_ibdp_l0_btb_wen              ),
  .ipdp_ibdp_no_chgflw_num            (ipdp_ibdp_no_chgflw_num           ),
  .ipdp_ibdp_ras_push_pc              (ipdp_ibdp_ras_push_pc             ),
  .ipdp_ibdp_ras_target_pc            (ipdp_ibdp_ras_target_pc           ),
  .ipdp_ibdp_vghr                     (ipdp_ibdp_vghr                    ),
  .ipdp_ibdp_vl_reg                   (ipdp_ibdp_vl_reg                  ),
  .ipdp_ibdp_vlmul_reg                (ipdp_ibdp_vlmul_reg               ),
  .ipdp_ibdp_vpc                      (ipdp_ibdp_vpc                     ),
  .ipdp_ibdp_vsew_reg                 (ipdp_ibdp_vsew_reg                ),
  .ipdp_ind_btb_jmp_detect            (ipdp_ind_btb_jmp_detect           ),
  .ipdp_ipctrl_bht_data               (ipdp_ipctrl_bht_data              ),
  .ipdp_ipctrl_bht_result             (ipdp_ipctrl_bht_result            ),
  .ipdp_ipctrl_btb_way0_pred          (ipdp_ipctrl_btb_way0_pred         ),
  .ipdp_ipctrl_btb_way0_target        (ipdp_ipctrl_btb_way0_target       ),
  .ipdp_ipctrl_btb_way1_pred          (ipdp_ipctrl_btb_way1_pred         ),
  .ipdp_ipctrl_btb_way1_target        (ipdp_ipctrl_btb_way1_target       ),
  .ipdp_ipctrl_btb_way2_pred          (ipdp_ipctrl_btb_way2_pred         ),
  .ipdp_ipctrl_btb_way2_target        (ipdp_ipctrl_btb_way2_target       ),
  .ipdp_ipctrl_btb_way3_pred          (ipdp_ipctrl_btb_way3_pred         ),
  .ipdp_ipctrl_btb_way3_target        (ipdp_ipctrl_btb_way3_target       ),
  .ipdp_ipctrl_con_br_first_branch    (ipdp_ipctrl_con_br_first_branch   ),
  .ipdp_ipctrl_con_br_more_than_one   (ipdp_ipctrl_con_br_more_than_one  ),
  .ipdp_ipctrl_h0_ab_br               (ipdp_ipctrl_h0_ab_br              ),
  .ipdp_ipctrl_h0_br                  (ipdp_ipctrl_h0_br                 ),
  .ipdp_ipctrl_h0_con_br              (ipdp_ipctrl_h0_con_br             ),
  .ipdp_ipctrl_h0_vld                 (ipdp_ipctrl_h0_vld                ),
  .ipdp_ipctrl_h8_br                  (ipdp_ipctrl_h8_br                 ),
  .ipdp_ipctrl_inst_32                (ipdp_ipctrl_inst_32               ),
  .ipdp_ipctrl_ip_expt_vld            (ipdp_ipctrl_ip_expt_vld           ),
  .ipdp_ipctrl_l0_btb_hit_way         (ipdp_ipctrl_l0_btb_hit_way        ),
  .ipdp_ipctrl_l0_btb_mispred_pc      (ipdp_ipctrl_l0_btb_mispred_pc     ),
  .ipdp_ipctrl_l0_btb_ras             (ipdp_ipctrl_l0_btb_ras            ),
  .ipdp_ipctrl_l0_btb_vld             (ipdp_ipctrl_l0_btb_vld            ),
  .ipdp_ipctrl_no_br                  (ipdp_ipctrl_no_br                 ),
  .ipdp_ipctrl_vpc                    (ipdp_ipctrl_vpc                   ),
  .ipdp_ipctrl_w0_ab_br               (ipdp_ipctrl_w0_ab_br              ),
  .ipdp_ipctrl_w0_br                  (ipdp_ipctrl_w0_br                 ),
  .ipdp_ipctrl_w1_ab_br               (ipdp_ipctrl_w1_ab_br              ),
  .ipdp_ipctrl_w1_br                  (ipdp_ipctrl_w1_br                 ),
  .ipdp_ipctrl_way0_32                (ipdp_ipctrl_way0_32               ),
  .ipdp_ipctrl_way1_32                (ipdp_ipctrl_way1_32               ),
  .ipdp_l0_btb_ras_pc                 (ipdp_l0_btb_ras_pc                ),
  .ipdp_l0_btb_ras_push               (ipdp_l0_btb_ras_push              ),
  .ipdp_lbuf_vl_reg                   (ipdp_lbuf_vl_reg                  ),
  .ipdp_lbuf_vlmul_reg                (ipdp_lbuf_vlmul_reg               ),
  .ipdp_lbuf_vsew_reg                 (ipdp_lbuf_vsew_reg                ),
  .iu_ifu_chgflw_vl                   (iu_ifu_chgflw_vl                  ),
  .iu_ifu_chgflw_vld                  (iu_ifu_chgflw_vld                 ),
  .iu_ifu_chgflw_vlmul                (iu_ifu_chgflw_vlmul               ),
  .iu_ifu_chgflw_vsew                 (iu_ifu_chgflw_vsew                ),
  .lbuf_ipdp_lbuf_active              (lbuf_ipdp_lbuf_active             ),
  .lbuf_ipdp_updt_vl                  (lbuf_ipdp_updt_vl                 ),
  .lbuf_ipdp_updt_vlmul               (lbuf_ipdp_updt_vlmul              ),
  .lbuf_ipdp_updt_vsew                (lbuf_ipdp_updt_vsew               ),
  .lbuf_ipdp_vtype_updt_vld           (lbuf_ipdp_vtype_updt_vld          ),
  .mmu_ifu_deny                       (mmu_ifu_deny                      ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pcgen_ipctrl_pipe_cancel           (pcgen_ipctrl_pipe_cancel          ),
  .ras_ipdp_data_vld                  (ras_ipdp_data_vld                 ),
  .ras_ipdp_pc                        (ras_ipdp_pc                       ),
  .rtu_ifu_chgflw_vld                 (rtu_ifu_chgflw_vld                ),
  .rtu_ifu_flush                      (rtu_ifu_flush                     ),
  .rtu_ifu_xx_expt_vld                (rtu_ifu_xx_expt_vld               ),
  .rtu_yy_xx_dbgon                    (rtu_yy_xx_dbgon                   )
);

// &Instance("ct_ifu_l1_refill",      "x_ct_ifu_l1_refill"); @84
ct_ifu_l1_refill  x_ct_ifu_l1_refill (
  .cp0_ifu_icg_en                     (cp0_ifu_icg_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ifctrl_l1_refill_ins_inv           (ifctrl_l1_refill_ins_inv          ),
  .ifctrl_l1_refill_ins_inv_dn        (ifctrl_l1_refill_ins_inv_dn       ),
  .ifctrl_l1_refill_inv_busy          (ifctrl_l1_refill_inv_busy         ),
  .ifctrl_l1_refill_inv_on            (ifctrl_l1_refill_inv_on           ),
  .ifdp_l1_refill_bufferable          (ifdp_l1_refill_bufferable         ),
  .ifdp_l1_refill_cacheable           (ifdp_l1_refill_cacheable          ),
  .ifdp_l1_refill_fifo                (ifdp_l1_refill_fifo               ),
  .ifdp_l1_refill_machine_mode        (ifdp_l1_refill_machine_mode       ),
  .ifdp_l1_refill_secure              (ifdp_l1_refill_secure             ),
  .ifdp_l1_refill_supv_mode           (ifdp_l1_refill_supv_mode          ),
  .ifdp_l1_refill_tsize               (ifdp_l1_refill_tsize              ),
  .ifu_hpcp_icache_miss_pre           (ifu_hpcp_icache_miss_pre          ),
  .ipb_l1_refill_data_vld             (ipb_l1_refill_data_vld            ),
  .ipb_l1_refill_grnt                 (ipb_l1_refill_grnt                ),
  .ipb_l1_refill_rdata                (ipb_l1_refill_rdata               ),
  .ipb_l1_refill_trans_err            (ipb_l1_refill_trans_err           ),
  .ipctrl_l1_refill_chk_err           (ipctrl_l1_refill_chk_err          ),
  .ipctrl_l1_refill_fifo              (ipctrl_l1_refill_fifo             ),
  .ipctrl_l1_refill_miss_req          (ipctrl_l1_refill_miss_req         ),
  .ipctrl_l1_refill_ppc               (ipctrl_l1_refill_ppc              ),
  .ipctrl_l1_refill_req_for_gateclk   (ipctrl_l1_refill_req_for_gateclk  ),
  .ipctrl_l1_refill_vpc               (ipctrl_l1_refill_vpc              ),
  .l1_refill_debug_refill_st          (l1_refill_debug_refill_st         ),
  .l1_refill_icache_if_fifo           (l1_refill_icache_if_fifo          ),
  .l1_refill_icache_if_first          (l1_refill_icache_if_first         ),
  .l1_refill_icache_if_index          (l1_refill_icache_if_index         ),
  .l1_refill_icache_if_inst_data      (l1_refill_icache_if_inst_data     ),
  .l1_refill_icache_if_last           (l1_refill_icache_if_last          ),
  .l1_refill_icache_if_pre_code       (l1_refill_icache_if_pre_code      ),
  .l1_refill_icache_if_ptag           (l1_refill_icache_if_ptag          ),
  .l1_refill_icache_if_wr             (l1_refill_icache_if_wr            ),
  .l1_refill_ifctrl_ctc               (l1_refill_ifctrl_ctc              ),
  .l1_refill_ifctrl_idle              (l1_refill_ifctrl_idle             ),
  .l1_refill_ifctrl_pc                (l1_refill_ifctrl_pc               ),
  .l1_refill_ifctrl_refill_on         (l1_refill_ifctrl_refill_on        ),
  .l1_refill_ifctrl_reissue           (l1_refill_ifctrl_reissue          ),
  .l1_refill_ifctrl_start             (l1_refill_ifctrl_start            ),
  .l1_refill_ifctrl_start_for_gateclk (l1_refill_ifctrl_start_for_gateclk),
  .l1_refill_ifctrl_trans_cmplt       (l1_refill_ifctrl_trans_cmplt      ),
  .l1_refill_ifdp_acc_err             (l1_refill_ifdp_acc_err            ),
  .l1_refill_ifdp_inst_data           (l1_refill_ifdp_inst_data          ),
  .l1_refill_ifdp_precode             (l1_refill_ifdp_precode            ),
  .l1_refill_ifdp_refill_on           (l1_refill_ifdp_refill_on          ),
  .l1_refill_ifdp_tag_data            (l1_refill_ifdp_tag_data           ),
  .l1_refill_inv_wfd_back             (l1_refill_inv_wfd_back            ),
  .l1_refill_ipb_bufferable           (l1_refill_ipb_bufferable          ),
  .l1_refill_ipb_cacheable            (l1_refill_ipb_cacheable           ),
  .l1_refill_ipb_ctc_inv              (l1_refill_ipb_ctc_inv             ),
  .l1_refill_ipb_machine_mode         (l1_refill_ipb_machine_mode        ),
  .l1_refill_ipb_ppc                  (l1_refill_ipb_ppc                 ),
  .l1_refill_ipb_pre_cancel           (l1_refill_ipb_pre_cancel          ),
  .l1_refill_ipb_refill_on            (l1_refill_ipb_refill_on           ),
  .l1_refill_ipb_req                  (l1_refill_ipb_req                 ),
  .l1_refill_ipb_req_for_gateclk      (l1_refill_ipb_req_for_gateclk     ),
  .l1_refill_ipb_req_pre              (l1_refill_ipb_req_pre             ),
  .l1_refill_ipb_secure               (l1_refill_ipb_secure              ),
  .l1_refill_ipb_supv_mode            (l1_refill_ipb_supv_mode           ),
  .l1_refill_ipb_tsize                (l1_refill_ipb_tsize               ),
  .l1_refill_ipb_vpc                  (l1_refill_ipb_vpc                 ),
  .l1_refill_ipctrl_busy              (l1_refill_ipctrl_busy             ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pcgen_l1_refill_chgflw             (pcgen_l1_refill_chgflw            )
);

// &Instance("ct_ifu_lbuf",           "x_ct_ifu_lbuf"); @85
ct_ifu_lbuf  x_ct_ifu_lbuf (
  .bht_lbuf_pre_ntaken_result         (bht_lbuf_pre_ntaken_result        ),
  .bht_lbuf_pre_taken_result          (bht_lbuf_pre_taken_result         ),
  .bht_lbuf_vghr                      (bht_lbuf_vghr                     ),
  .cp0_ifu_icg_en                     (cp0_ifu_icg_en                    ),
  .cp0_ifu_lbuf_en                    (cp0_ifu_lbuf_en                   ),
  .cp0_ifu_vl                         (cp0_ifu_vl                        ),
  .cp0_ifu_vsetvli_pred_disable       (cp0_ifu_vsetvli_pred_disable      ),
  .cp0_ifu_vsetvli_pred_mode          (cp0_ifu_vsetvli_pred_mode         ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ibctrl_lbuf_bju_mispred            (ibctrl_lbuf_bju_mispred           ),
  .ibctrl_lbuf_create_vld             (ibctrl_lbuf_create_vld            ),
  .ibctrl_lbuf_flush                  (ibctrl_lbuf_flush                 ),
  .ibctrl_lbuf_retire_vld             (ibctrl_lbuf_retire_vld            ),
  .ibdp_lbuf_bht_sel_array_result     (ibdp_lbuf_bht_sel_array_result    ),
  .ibdp_lbuf_con_br_cur_pc            (ibdp_lbuf_con_br_cur_pc           ),
  .ibdp_lbuf_con_br_half_num          (ibdp_lbuf_con_br_half_num         ),
  .ibdp_lbuf_con_br_inst_32           (ibdp_lbuf_con_br_inst_32          ),
  .ibdp_lbuf_con_br_offset            (ibdp_lbuf_con_br_offset           ),
  .ibdp_lbuf_con_br_taken             (ibdp_lbuf_con_br_taken            ),
  .ibdp_lbuf_con_br_vl                (ibdp_lbuf_con_br_vl               ),
  .ibdp_lbuf_con_br_vlmul             (ibdp_lbuf_con_br_vlmul            ),
  .ibdp_lbuf_con_br_vsew              (ibdp_lbuf_con_br_vsew             ),
  .ibdp_lbuf_h0_32_start              (ibdp_lbuf_h0_32_start             ),
  .ibdp_lbuf_h0_bkpta                 (ibdp_lbuf_h0_bkpta                ),
  .ibdp_lbuf_h0_bkptb                 (ibdp_lbuf_h0_bkptb                ),
  .ibdp_lbuf_h0_con_br                (ibdp_lbuf_h0_con_br               ),
  .ibdp_lbuf_h0_data                  (ibdp_lbuf_h0_data                 ),
  .ibdp_lbuf_h0_fence                 (ibdp_lbuf_h0_fence                ),
  .ibdp_lbuf_h0_split0_type           (ibdp_lbuf_h0_split0_type          ),
  .ibdp_lbuf_h0_split1_type           (ibdp_lbuf_h0_split1_type          ),
  .ibdp_lbuf_h0_vl                    (ibdp_lbuf_h0_vl                   ),
  .ibdp_lbuf_h0_vld                   (ibdp_lbuf_h0_vld                  ),
  .ibdp_lbuf_h0_vlmul                 (ibdp_lbuf_h0_vlmul                ),
  .ibdp_lbuf_h0_vsetvli               (ibdp_lbuf_h0_vsetvli              ),
  .ibdp_lbuf_h0_vsew                  (ibdp_lbuf_h0_vsew                 ),
  .ibdp_lbuf_h1_data                  (ibdp_lbuf_h1_data                 ),
  .ibdp_lbuf_h1_split0_type           (ibdp_lbuf_h1_split0_type          ),
  .ibdp_lbuf_h1_split1_type           (ibdp_lbuf_h1_split1_type          ),
  .ibdp_lbuf_h1_vl                    (ibdp_lbuf_h1_vl                   ),
  .ibdp_lbuf_h1_vlmul                 (ibdp_lbuf_h1_vlmul                ),
  .ibdp_lbuf_h1_vsew                  (ibdp_lbuf_h1_vsew                 ),
  .ibdp_lbuf_h2_data                  (ibdp_lbuf_h2_data                 ),
  .ibdp_lbuf_h2_split0_type           (ibdp_lbuf_h2_split0_type          ),
  .ibdp_lbuf_h2_split1_type           (ibdp_lbuf_h2_split1_type          ),
  .ibdp_lbuf_h2_vl                    (ibdp_lbuf_h2_vl                   ),
  .ibdp_lbuf_h2_vlmul                 (ibdp_lbuf_h2_vlmul                ),
  .ibdp_lbuf_h2_vsew                  (ibdp_lbuf_h2_vsew                 ),
  .ibdp_lbuf_h3_data                  (ibdp_lbuf_h3_data                 ),
  .ibdp_lbuf_h3_split0_type           (ibdp_lbuf_h3_split0_type          ),
  .ibdp_lbuf_h3_split1_type           (ibdp_lbuf_h3_split1_type          ),
  .ibdp_lbuf_h3_vl                    (ibdp_lbuf_h3_vl                   ),
  .ibdp_lbuf_h3_vlmul                 (ibdp_lbuf_h3_vlmul                ),
  .ibdp_lbuf_h3_vsew                  (ibdp_lbuf_h3_vsew                 ),
  .ibdp_lbuf_h4_data                  (ibdp_lbuf_h4_data                 ),
  .ibdp_lbuf_h4_split0_type           (ibdp_lbuf_h4_split0_type          ),
  .ibdp_lbuf_h4_split1_type           (ibdp_lbuf_h4_split1_type          ),
  .ibdp_lbuf_h4_vl                    (ibdp_lbuf_h4_vl                   ),
  .ibdp_lbuf_h4_vlmul                 (ibdp_lbuf_h4_vlmul                ),
  .ibdp_lbuf_h4_vsew                  (ibdp_lbuf_h4_vsew                 ),
  .ibdp_lbuf_h5_data                  (ibdp_lbuf_h5_data                 ),
  .ibdp_lbuf_h5_split0_type           (ibdp_lbuf_h5_split0_type          ),
  .ibdp_lbuf_h5_split1_type           (ibdp_lbuf_h5_split1_type          ),
  .ibdp_lbuf_h5_vl                    (ibdp_lbuf_h5_vl                   ),
  .ibdp_lbuf_h5_vlmul                 (ibdp_lbuf_h5_vlmul                ),
  .ibdp_lbuf_h5_vsew                  (ibdp_lbuf_h5_vsew                 ),
  .ibdp_lbuf_h6_data                  (ibdp_lbuf_h6_data                 ),
  .ibdp_lbuf_h6_split0_type           (ibdp_lbuf_h6_split0_type          ),
  .ibdp_lbuf_h6_split1_type           (ibdp_lbuf_h6_split1_type          ),
  .ibdp_lbuf_h6_vl                    (ibdp_lbuf_h6_vl                   ),
  .ibdp_lbuf_h6_vlmul                 (ibdp_lbuf_h6_vlmul                ),
  .ibdp_lbuf_h6_vsew                  (ibdp_lbuf_h6_vsew                 ),
  .ibdp_lbuf_h7_data                  (ibdp_lbuf_h7_data                 ),
  .ibdp_lbuf_h7_split0_type           (ibdp_lbuf_h7_split0_type          ),
  .ibdp_lbuf_h7_split1_type           (ibdp_lbuf_h7_split1_type          ),
  .ibdp_lbuf_h7_vl                    (ibdp_lbuf_h7_vl                   ),
  .ibdp_lbuf_h7_vlmul                 (ibdp_lbuf_h7_vlmul                ),
  .ibdp_lbuf_h7_vsew                  (ibdp_lbuf_h7_vsew                 ),
  .ibdp_lbuf_h8_data                  (ibdp_lbuf_h8_data                 ),
  .ibdp_lbuf_h8_split0_type           (ibdp_lbuf_h8_split0_type          ),
  .ibdp_lbuf_h8_split1_type           (ibdp_lbuf_h8_split1_type          ),
  .ibdp_lbuf_h8_vl                    (ibdp_lbuf_h8_vl                   ),
  .ibdp_lbuf_h8_vlmul                 (ibdp_lbuf_h8_vlmul                ),
  .ibdp_lbuf_h8_vsew                  (ibdp_lbuf_h8_vsew                 ),
  .ibdp_lbuf_half_vld_num             (ibdp_lbuf_half_vld_num            ),
  .ibdp_lbuf_hn_32_start              (ibdp_lbuf_hn_32_start             ),
  .ibdp_lbuf_hn_auipc                 (ibdp_lbuf_hn_auipc                ),
  .ibdp_lbuf_hn_bkpta                 (ibdp_lbuf_hn_bkpta                ),
  .ibdp_lbuf_hn_bkptb                 (ibdp_lbuf_hn_bkptb                ),
  .ibdp_lbuf_hn_chgflw                (ibdp_lbuf_hn_chgflw               ),
  .ibdp_lbuf_hn_con_br                (ibdp_lbuf_hn_con_br               ),
  .ibdp_lbuf_hn_fence                 (ibdp_lbuf_hn_fence                ),
  .ibdp_lbuf_hn_vld                   (ibdp_lbuf_hn_vld                  ),
  .ibdp_lbuf_hn_vsetvli               (ibdp_lbuf_hn_vsetvli              ),
  .ibuf_lbuf_empty                    (ibuf_lbuf_empty                   ),
  .ifctrl_lbuf_ins_inv_on             (ifctrl_lbuf_ins_inv_on            ),
  .ifctrl_lbuf_inv_req                (ifctrl_lbuf_inv_req               ),
  .ipdp_lbuf_vl_reg                   (ipdp_lbuf_vl_reg                  ),
  .ipdp_lbuf_vlmul_reg                (ipdp_lbuf_vlmul_reg               ),
  .ipdp_lbuf_vsew_reg                 (ipdp_lbuf_vsew_reg                ),
  .iu_ifu_bht_check_vld               (iu_ifu_bht_check_vld              ),
  .iu_ifu_bht_condbr_taken            (iu_ifu_bht_condbr_taken           ),
  .iu_ifu_chgflw_vld                  (iu_ifu_chgflw_vld                 ),
  .iu_ifu_cur_pc                      (iu_ifu_cur_pc                     ),
  .lbuf_addrgen_active_state          (lbuf_addrgen_active_state         ),
  .lbuf_addrgen_cache_state           (lbuf_addrgen_cache_state          ),
  .lbuf_addrgen_chgflw_mask           (lbuf_addrgen_chgflw_mask          ),
  .lbuf_bht_active_state              (lbuf_bht_active_state             ),
  .lbuf_bht_con_br_taken              (lbuf_bht_con_br_taken             ),
  .lbuf_bht_con_br_vld                (lbuf_bht_con_br_vld               ),
  .lbuf_debug_st                      (lbuf_debug_st                     ),
  .lbuf_ibctrl_active_idle_flush      (lbuf_ibctrl_active_idle_flush     ),
  .lbuf_ibctrl_chgflw_pc              (lbuf_ibctrl_chgflw_pc             ),
  .lbuf_ibctrl_chgflw_pred            (lbuf_ibctrl_chgflw_pred           ),
  .lbuf_ibctrl_chgflw_vl              (lbuf_ibctrl_chgflw_vl             ),
  .lbuf_ibctrl_chgflw_vld             (lbuf_ibctrl_chgflw_vld            ),
  .lbuf_ibctrl_chgflw_vlmul           (lbuf_ibctrl_chgflw_vlmul          ),
  .lbuf_ibctrl_chgflw_vsew            (lbuf_ibctrl_chgflw_vsew           ),
  .lbuf_ibctrl_lbuf_active            (lbuf_ibctrl_lbuf_active           ),
  .lbuf_ibctrl_stall                  (lbuf_ibctrl_stall                 ),
  .lbuf_ibdp_inst0                    (lbuf_ibdp_inst0                   ),
  .lbuf_ibdp_inst0_bkpta              (lbuf_ibdp_inst0_bkpta             ),
  .lbuf_ibdp_inst0_bkptb              (lbuf_ibdp_inst0_bkptb             ),
  .lbuf_ibdp_inst0_fence              (lbuf_ibdp_inst0_fence             ),
  .lbuf_ibdp_inst0_pc                 (lbuf_ibdp_inst0_pc                ),
  .lbuf_ibdp_inst0_split0             (lbuf_ibdp_inst0_split0            ),
  .lbuf_ibdp_inst0_split1             (lbuf_ibdp_inst0_split1            ),
  .lbuf_ibdp_inst0_valid              (lbuf_ibdp_inst0_valid             ),
  .lbuf_ibdp_inst0_vl                 (lbuf_ibdp_inst0_vl                ),
  .lbuf_ibdp_inst0_vlmul              (lbuf_ibdp_inst0_vlmul             ),
  .lbuf_ibdp_inst0_vsew               (lbuf_ibdp_inst0_vsew              ),
  .lbuf_ibdp_inst1                    (lbuf_ibdp_inst1                   ),
  .lbuf_ibdp_inst1_bkpta              (lbuf_ibdp_inst1_bkpta             ),
  .lbuf_ibdp_inst1_bkptb              (lbuf_ibdp_inst1_bkptb             ),
  .lbuf_ibdp_inst1_fence              (lbuf_ibdp_inst1_fence             ),
  .lbuf_ibdp_inst1_pc                 (lbuf_ibdp_inst1_pc                ),
  .lbuf_ibdp_inst1_split0             (lbuf_ibdp_inst1_split0            ),
  .lbuf_ibdp_inst1_split1             (lbuf_ibdp_inst1_split1            ),
  .lbuf_ibdp_inst1_valid              (lbuf_ibdp_inst1_valid             ),
  .lbuf_ibdp_inst1_vl                 (lbuf_ibdp_inst1_vl                ),
  .lbuf_ibdp_inst1_vlmul              (lbuf_ibdp_inst1_vlmul             ),
  .lbuf_ibdp_inst1_vsew               (lbuf_ibdp_inst1_vsew              ),
  .lbuf_ibdp_inst2                    (lbuf_ibdp_inst2                   ),
  .lbuf_ibdp_inst2_bkpta              (lbuf_ibdp_inst2_bkpta             ),
  .lbuf_ibdp_inst2_bkptb              (lbuf_ibdp_inst2_bkptb             ),
  .lbuf_ibdp_inst2_fence              (lbuf_ibdp_inst2_fence             ),
  .lbuf_ibdp_inst2_pc                 (lbuf_ibdp_inst2_pc                ),
  .lbuf_ibdp_inst2_split0             (lbuf_ibdp_inst2_split0            ),
  .lbuf_ibdp_inst2_split1             (lbuf_ibdp_inst2_split1            ),
  .lbuf_ibdp_inst2_valid              (lbuf_ibdp_inst2_valid             ),
  .lbuf_ibdp_inst2_vl                 (lbuf_ibdp_inst2_vl                ),
  .lbuf_ibdp_inst2_vlmul              (lbuf_ibdp_inst2_vlmul             ),
  .lbuf_ibdp_inst2_vsew               (lbuf_ibdp_inst2_vsew              ),
  .lbuf_ipdp_lbuf_active              (lbuf_ipdp_lbuf_active             ),
  .lbuf_ipdp_updt_vl                  (lbuf_ipdp_updt_vl                 ),
  .lbuf_ipdp_updt_vlmul               (lbuf_ipdp_updt_vlmul              ),
  .lbuf_ipdp_updt_vsew                (lbuf_ipdp_updt_vsew               ),
  .lbuf_ipdp_vtype_updt_vld           (lbuf_ipdp_vtype_updt_vld          ),
  .lbuf_pcfifo_if_create_select       (lbuf_pcfifo_if_create_select      ),
  .lbuf_pcfifo_if_inst_bht_pre_result (lbuf_pcfifo_if_inst_bht_pre_result),
  .lbuf_pcfifo_if_inst_bht_sel_result (lbuf_pcfifo_if_inst_bht_sel_result),
  .lbuf_pcfifo_if_inst_cur_pc         (lbuf_pcfifo_if_inst_cur_pc        ),
  .lbuf_pcfifo_if_inst_pc_oper        (lbuf_pcfifo_if_inst_pc_oper       ),
  .lbuf_pcfifo_if_inst_target_pc      (lbuf_pcfifo_if_inst_target_pc     ),
  .lbuf_pcfifo_if_inst_vghr           (lbuf_pcfifo_if_inst_vghr          ),
  .lbuf_pcgen_active                  (lbuf_pcgen_active                 ),
  .lbuf_pcgen_vld_mask                (lbuf_pcgen_vld_mask               ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                )
);

// &Instance("ct_ifu_pcfifo_if",      "x_ct_ifu_pcfifo_if"); @86
ct_ifu_pcfifo_if  x_ct_ifu_pcfifo_if (
  .ibctrl_pcfifo_if_create_vld        (ibctrl_pcfifo_if_create_vld       ),
  .ibctrl_pcfifo_if_ind_btb_miss      (ibctrl_pcfifo_if_ind_btb_miss     ),
  .ibctrl_pcfifo_if_ind_target_pc     (ibctrl_pcfifo_if_ind_target_pc    ),
  .ibctrl_pcfifo_if_ras_target_pc     (ibctrl_pcfifo_if_ras_target_pc    ),
  .ibctrl_pcfifo_if_ras_vld           (ibctrl_pcfifo_if_ras_vld          ),
  .ibdp_pcfifo_if_bht_pre_result      (ibdp_pcfifo_if_bht_pre_result     ),
  .ibdp_pcfifo_if_bht_sel_result      (ibdp_pcfifo_if_bht_sel_result     ),
  .ibdp_pcfifo_if_h0_cur_pc           (ibdp_pcfifo_if_h0_cur_pc          ),
  .ibdp_pcfifo_if_h0_vld              (ibdp_pcfifo_if_h0_vld             ),
  .ibdp_pcfifo_if_h1_cur_pc           (ibdp_pcfifo_if_h1_cur_pc          ),
  .ibdp_pcfifo_if_h2_cur_pc           (ibdp_pcfifo_if_h2_cur_pc          ),
  .ibdp_pcfifo_if_h3_cur_pc           (ibdp_pcfifo_if_h3_cur_pc          ),
  .ibdp_pcfifo_if_h4_cur_pc           (ibdp_pcfifo_if_h4_cur_pc          ),
  .ibdp_pcfifo_if_h5_cur_pc           (ibdp_pcfifo_if_h5_cur_pc          ),
  .ibdp_pcfifo_if_h6_cur_pc           (ibdp_pcfifo_if_h6_cur_pc          ),
  .ibdp_pcfifo_if_h7_cur_pc           (ibdp_pcfifo_if_h7_cur_pc          ),
  .ibdp_pcfifo_if_h8_cur_pc           (ibdp_pcfifo_if_h8_cur_pc          ),
  .ibdp_pcfifo_if_hn_con_br           (ibdp_pcfifo_if_hn_con_br          ),
  .ibdp_pcfifo_if_hn_dst_vld          (ibdp_pcfifo_if_hn_dst_vld         ),
  .ibdp_pcfifo_if_hn_jal              (ibdp_pcfifo_if_hn_jal             ),
  .ibdp_pcfifo_if_hn_jalr             (ibdp_pcfifo_if_hn_jalr            ),
  .ibdp_pcfifo_if_hn_pc_oper          (ibdp_pcfifo_if_hn_pc_oper         ),
  .ibdp_pcfifo_if_ind_br_offset       (ibdp_pcfifo_if_ind_br_offset      ),
  .ibdp_pcfifo_if_vghr                (ibdp_pcfifo_if_vghr               ),
  .ifu_iu_pcfifo_create0_bht_pred     (ifu_iu_pcfifo_create0_bht_pred    ),
  .ifu_iu_pcfifo_create0_chk_idx      (ifu_iu_pcfifo_create0_chk_idx     ),
  .ifu_iu_pcfifo_create0_cur_pc       (ifu_iu_pcfifo_create0_cur_pc      ),
  .ifu_iu_pcfifo_create0_dst_vld      (ifu_iu_pcfifo_create0_dst_vld     ),
  .ifu_iu_pcfifo_create0_en           (ifu_iu_pcfifo_create0_en          ),
  .ifu_iu_pcfifo_create0_gateclk_en   (ifu_iu_pcfifo_create0_gateclk_en  ),
  .ifu_iu_pcfifo_create0_jal          (ifu_iu_pcfifo_create0_jal         ),
  .ifu_iu_pcfifo_create0_jalr         (ifu_iu_pcfifo_create0_jalr        ),
  .ifu_iu_pcfifo_create0_jmp_mispred  (ifu_iu_pcfifo_create0_jmp_mispred ),
  .ifu_iu_pcfifo_create0_tar_pc       (ifu_iu_pcfifo_create0_tar_pc      ),
  .ifu_iu_pcfifo_create1_bht_pred     (ifu_iu_pcfifo_create1_bht_pred    ),
  .ifu_iu_pcfifo_create1_chk_idx      (ifu_iu_pcfifo_create1_chk_idx     ),
  .ifu_iu_pcfifo_create1_cur_pc       (ifu_iu_pcfifo_create1_cur_pc      ),
  .ifu_iu_pcfifo_create1_dst_vld      (ifu_iu_pcfifo_create1_dst_vld     ),
  .ifu_iu_pcfifo_create1_en           (ifu_iu_pcfifo_create1_en          ),
  .ifu_iu_pcfifo_create1_gateclk_en   (ifu_iu_pcfifo_create1_gateclk_en  ),
  .ifu_iu_pcfifo_create1_jal          (ifu_iu_pcfifo_create1_jal         ),
  .ifu_iu_pcfifo_create1_jalr         (ifu_iu_pcfifo_create1_jalr        ),
  .ifu_iu_pcfifo_create1_jmp_mispred  (ifu_iu_pcfifo_create1_jmp_mispred ),
  .ifu_iu_pcfifo_create1_tar_pc       (ifu_iu_pcfifo_create1_tar_pc      ),
  .lbuf_pcfifo_if_create_select       (lbuf_pcfifo_if_create_select      ),
  .lbuf_pcfifo_if_inst_bht_pre_result (lbuf_pcfifo_if_inst_bht_pre_result),
  .lbuf_pcfifo_if_inst_bht_sel_result (lbuf_pcfifo_if_inst_bht_sel_result),
  .lbuf_pcfifo_if_inst_cur_pc         (lbuf_pcfifo_if_inst_cur_pc        ),
  .lbuf_pcfifo_if_inst_pc_oper        (lbuf_pcfifo_if_inst_pc_oper       ),
  .lbuf_pcfifo_if_inst_target_pc      (lbuf_pcfifo_if_inst_target_pc     ),
  .lbuf_pcfifo_if_inst_vghr           (lbuf_pcfifo_if_inst_vghr          ),
  .pcfifo_if_ibctrl_more_than_two     (pcfifo_if_ibctrl_more_than_two    ),
  .pcfifo_if_ibdp_over_mask           (pcfifo_if_ibdp_over_mask          )
);

// &Instance("ct_ifu_pcgen",          "x_ct_ifu_pcgen"); @87
ct_ifu_pcgen  x_ct_ifu_pcgen (
  .addrgen_pcgen_pc                     (addrgen_pcgen_pc                    ),
  .addrgen_pcgen_pcload                 (addrgen_pcgen_pcload                ),
  .cp0_ifu_icg_en                       (cp0_ifu_icg_en                      ),
  .cp0_ifu_iwpe                         (cp0_ifu_iwpe                        ),
  .cp0_yy_clk_en                        (cp0_yy_clk_en                       ),
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_ifu_pc                           (had_ifu_pc                          ),
  .had_ifu_pcload                       (had_ifu_pcload                      ),
  .ibctrl_pcgen_ip_stall                (ibctrl_pcgen_ip_stall               ),
  .ibctrl_pcgen_pc                      (ibctrl_pcgen_pc                     ),
  .ibctrl_pcgen_pcload                  (ibctrl_pcgen_pcload                 ),
  .ibctrl_pcgen_pcload_vld              (ibctrl_pcgen_pcload_vld             ),
  .ibctrl_pcgen_way_pred                (ibctrl_pcgen_way_pred               ),
  .ifctrl_pcgen_chgflw_no_stall_mask    (ifctrl_pcgen_chgflw_no_stall_mask   ),
  .ifctrl_pcgen_chgflw_vld              (ifctrl_pcgen_chgflw_vld             ),
  .ifctrl_pcgen_ins_icache_inv_done     (ifctrl_pcgen_ins_icache_inv_done    ),
  .ifctrl_pcgen_pcload_pc               (ifctrl_pcgen_pcload_pc              ),
  .ifctrl_pcgen_reissue_pcload          (ifctrl_pcgen_reissue_pcload         ),
  .ifctrl_pcgen_stall                   (ifctrl_pcgen_stall                  ),
  .ifctrl_pcgen_stall_short             (ifctrl_pcgen_stall_short            ),
  .ifctrl_pcgen_way_pred                (ifctrl_pcgen_way_pred               ),
  .ifu_mmu_abort                        (ifu_mmu_abort                       ),
  .ifu_mmu_va                           (ifu_mmu_va                          ),
  .ifu_mmu_va_vld                       (ifu_mmu_va_vld                      ),
  .ifu_rtu_cur_pc                       (ifu_rtu_cur_pc                      ),
  .ifu_rtu_cur_pc_load                  (ifu_rtu_cur_pc_load                 ),
  .ipctrl_pcgen_branch_mistaken         (ipctrl_pcgen_branch_mistaken        ),
  .ipctrl_pcgen_branch_taken            (ipctrl_pcgen_branch_taken           ),
  .ipctrl_pcgen_chgflw_pc               (ipctrl_pcgen_chgflw_pc              ),
  .ipctrl_pcgen_chgflw_pcload           (ipctrl_pcgen_chgflw_pcload          ),
  .ipctrl_pcgen_chgflw_way_pred         (ipctrl_pcgen_chgflw_way_pred        ),
  .ipctrl_pcgen_chk_err_reissue         (ipctrl_pcgen_chk_err_reissue        ),
  .ipctrl_pcgen_h0_vld                  (ipctrl_pcgen_h0_vld                 ),
  .ipctrl_pcgen_if_stall                (ipctrl_pcgen_if_stall               ),
  .ipctrl_pcgen_inner_way0              (ipctrl_pcgen_inner_way0             ),
  .ipctrl_pcgen_inner_way1              (ipctrl_pcgen_inner_way1             ),
  .ipctrl_pcgen_inner_way_pred          (ipctrl_pcgen_inner_way_pred         ),
  .ipctrl_pcgen_reissue_pc              (ipctrl_pcgen_reissue_pc             ),
  .ipctrl_pcgen_reissue_pcload          (ipctrl_pcgen_reissue_pcload         ),
  .ipctrl_pcgen_reissue_way_pred        (ipctrl_pcgen_reissue_way_pred       ),
  .ipctrl_pcgen_taken_pc                (ipctrl_pcgen_taken_pc               ),
  .iu_ifu_chgflw_pc                     (iu_ifu_chgflw_pc                    ),
  .iu_ifu_chgflw_vld                    (iu_ifu_chgflw_vld                   ),
  .lbuf_pcgen_active                    (lbuf_pcgen_active                   ),
  .lbuf_pcgen_vld_mask                  (lbuf_pcgen_vld_mask                 ),
  .pad_yy_icg_scan_en                   (pad_yy_icg_scan_en                  ),
  .pcgen_addrgen_cancel                 (pcgen_addrgen_cancel                ),
  .pcgen_bht_chgflw                     (pcgen_bht_chgflw                    ),
  .pcgen_bht_chgflw_short               (pcgen_bht_chgflw_short              ),
  .pcgen_bht_ifpc                       (pcgen_bht_ifpc                      ),
  .pcgen_bht_pcindex                    (pcgen_bht_pcindex                   ),
  .pcgen_bht_seq_read                   (pcgen_bht_seq_read                  ),
  .pcgen_btb_chgflw                     (pcgen_btb_chgflw                    ),
  .pcgen_btb_chgflw_higher_than_addrgen (pcgen_btb_chgflw_higher_than_addrgen),
  .pcgen_btb_chgflw_higher_than_if      (pcgen_btb_chgflw_higher_than_if     ),
  .pcgen_btb_chgflw_higher_than_ip      (pcgen_btb_chgflw_higher_than_ip     ),
  .pcgen_btb_chgflw_short               (pcgen_btb_chgflw_short              ),
  .pcgen_btb_index                      (pcgen_btb_index                     ),
  .pcgen_btb_stall                      (pcgen_btb_stall                     ),
  .pcgen_btb_stall_short                (pcgen_btb_stall_short               ),
  .pcgen_debug_chgflw                   (pcgen_debug_chgflw                  ),
  .pcgen_debug_pcbus                    (pcgen_debug_pcbus                   ),
  .pcgen_ibctrl_bju_chgflw              (pcgen_ibctrl_bju_chgflw             ),
  .pcgen_ibctrl_cancel                  (pcgen_ibctrl_cancel                 ),
  .pcgen_ibctrl_ibuf_flush              (pcgen_ibctrl_ibuf_flush             ),
  .pcgen_ibctrl_lbuf_flush              (pcgen_ibctrl_lbuf_flush             ),
  .pcgen_icache_if_chgflw               (pcgen_icache_if_chgflw              ),
  .pcgen_icache_if_chgflw_bank0         (pcgen_icache_if_chgflw_bank0        ),
  .pcgen_icache_if_chgflw_bank1         (pcgen_icache_if_chgflw_bank1        ),
  .pcgen_icache_if_chgflw_bank2         (pcgen_icache_if_chgflw_bank2        ),
  .pcgen_icache_if_chgflw_bank3         (pcgen_icache_if_chgflw_bank3        ),
  .pcgen_icache_if_chgflw_short         (pcgen_icache_if_chgflw_short        ),
  .pcgen_icache_if_gateclk_en           (pcgen_icache_if_gateclk_en          ),
  .pcgen_icache_if_index                (pcgen_icache_if_index               ),
  .pcgen_icache_if_seq_data_req         (pcgen_icache_if_seq_data_req        ),
  .pcgen_icache_if_seq_data_req_short   (pcgen_icache_if_seq_data_req_short  ),
  .pcgen_icache_if_seq_tag_req          (pcgen_icache_if_seq_tag_req         ),
  .pcgen_icache_if_way_pred             (pcgen_icache_if_way_pred            ),
  .pcgen_ifctrl_cancel                  (pcgen_ifctrl_cancel                 ),
  .pcgen_ifctrl_pc                      (pcgen_ifctrl_pc                     ),
  .pcgen_ifctrl_pipe_cancel             (pcgen_ifctrl_pipe_cancel            ),
  .pcgen_ifctrl_reissue                 (pcgen_ifctrl_reissue                ),
  .pcgen_ifctrl_way_pred                (pcgen_ifctrl_way_pred               ),
  .pcgen_ifctrl_way_pred_stall          (pcgen_ifctrl_way_pred_stall         ),
  .pcgen_ifdp_inc_pc                    (pcgen_ifdp_inc_pc                   ),
  .pcgen_ifdp_pc                        (pcgen_ifdp_pc                       ),
  .pcgen_ifdp_way_pred                  (pcgen_ifdp_way_pred                 ),
  .pcgen_ipb_chgflw                     (pcgen_ipb_chgflw                    ),
  .pcgen_ipctrl_cancel                  (pcgen_ipctrl_cancel                 ),
  .pcgen_ipctrl_pipe_cancel             (pcgen_ipctrl_pipe_cancel            ),
  .pcgen_l0_btb_chgflw_mask             (pcgen_l0_btb_chgflw_mask            ),
  .pcgen_l0_btb_chgflw_pc               (pcgen_l0_btb_chgflw_pc              ),
  .pcgen_l0_btb_chgflw_vld              (pcgen_l0_btb_chgflw_vld             ),
  .pcgen_l0_btb_if_pc                   (pcgen_l0_btb_if_pc                  ),
  .pcgen_l1_refill_chgflw               (pcgen_l1_refill_chgflw              ),
  .pcgen_sfp_pc                         (pcgen_sfp_pc                        ),
  .rtu_ifu_chgflw_pc                    (rtu_ifu_chgflw_pc                   ),
  .rtu_ifu_chgflw_vld                   (rtu_ifu_chgflw_vld                  ),
  .rtu_ifu_xx_dbgon                     (rtu_ifu_xx_dbgon                    ),
  .rtu_ifu_xx_expt_vld                  (rtu_ifu_xx_expt_vld                 ),
  .vector_pcgen_pc                      (vector_pcgen_pc                     ),
  .vector_pcgen_pcload                  (vector_pcgen_pcload                 ),
  .vector_pcgen_reset_on                (vector_pcgen_reset_on               )
);

// &Instance("ct_ifu_ras",            "x_ct_ifu_ras"); @88
ct_ifu_ras  x_ct_ifu_ras (
  .cp0_ifu_icg_en                     (cp0_ifu_icg_en                    ),
  .cp0_ifu_ras_en                     (cp0_ifu_ras_en                    ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cp0_yy_priv_mode                   (cp0_yy_priv_mode                  ),
  .cpurst_b                           (cpurst_b                          ),
  .forever_cpuclk                     (forever_cpuclk                    ),
  .ibctrl_ras_inst_pcall              (ibctrl_ras_inst_pcall             ),
  .ibctrl_ras_pcall_vld               (ibctrl_ras_pcall_vld              ),
  .ibctrl_ras_pcall_vld_for_gateclk   (ibctrl_ras_pcall_vld_for_gateclk  ),
  .ibctrl_ras_preturn_vld             (ibctrl_ras_preturn_vld            ),
  .ibctrl_ras_preturn_vld_for_gateclk (ibctrl_ras_preturn_vld_for_gateclk),
  .ibdp_ras_push_pc                   (ibdp_ras_push_pc                  ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .ras_ipdp_data_vld                  (ras_ipdp_data_vld                 ),
  .ras_ipdp_pc                        (ras_ipdp_pc                       ),
  .ras_l0_btb_pc                      (ras_l0_btb_pc                     ),
  .ras_l0_btb_push_pc                 (ras_l0_btb_push_pc                ),
  .ras_l0_btb_ras_push                (ras_l0_btb_ras_push               ),
  .rtu_ifu_flush                      (rtu_ifu_flush                     ),
  .rtu_ifu_retire0_inc_pc             (rtu_ifu_retire0_inc_pc            ),
  .rtu_ifu_retire0_mispred            (rtu_ifu_retire0_mispred           ),
  .rtu_ifu_retire0_pcall              (rtu_ifu_retire0_pcall             ),
  .rtu_ifu_retire0_preturn            (rtu_ifu_retire0_preturn           )
);

// &Instance("ct_ifu_vector",         "x_ct_ifu_vector"); @89
ct_ifu_vector  x_ct_ifu_vector (
  .cp0_ifu_icg_en         (cp0_ifu_icg_en        ),
  .cp0_ifu_rst_inv_done   (cp0_ifu_rst_inv_done  ),
  .cp0_ifu_rvbr           (cp0_ifu_rvbr          ),
  .cp0_ifu_vbr            (cp0_ifu_vbr           ),
  .cp0_yy_clk_en          (cp0_yy_clk_en         ),
  .cpurst_b               (cpurst_b              ),
  .forever_cpuclk         (forever_cpuclk        ),
  .ifu_cp0_rst_inv_req    (ifu_cp0_rst_inv_req   ),
  .ifu_xx_sync_reset      (ifu_xx_sync_reset     ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .rtu_ifu_xx_dbgon       (rtu_ifu_xx_dbgon      ),
  .rtu_ifu_xx_expt_vec    (rtu_ifu_xx_expt_vec   ),
  .rtu_ifu_xx_expt_vld    (rtu_ifu_xx_expt_vld   ),
  .vector_debug_cur_st    (vector_debug_cur_st   ),
  .vector_debug_reset_on  (vector_debug_reset_on ),
  .vector_ifctrl_reset_on (vector_ifctrl_reset_on),
  .vector_ifctrl_sm_on    (vector_ifctrl_sm_on   ),
  .vector_ifctrl_sm_start (vector_ifctrl_sm_start),
  .vector_pcgen_pc        (vector_pcgen_pc       ),
  .vector_pcgen_pcload    (vector_pcgen_pcload   ),
  .vector_pcgen_reset_on  (vector_pcgen_reset_on )
);

// &Force("input","cp0_ifu_lbuf_en"); @92
// &Instance("ct_ifu_debug",         "x_ct_ifu_debug"); @94
ct_ifu_debug  x_ct_ifu_debug (
  .cpurst_b                             (cpurst_b                            ),
  .forever_cpuclk                       (forever_cpuclk                      ),
  .had_rtu_xx_jdbreq                    (had_rtu_xx_jdbreq                   ),
  .ibctrl_debug_buf_stall               (ibctrl_debug_buf_stall              ),
  .ibctrl_debug_bypass_inst_vld         (ibctrl_debug_bypass_inst_vld        ),
  .ibctrl_debug_fifo_full_stall         (ibctrl_debug_fifo_full_stall        ),
  .ibctrl_debug_fifo_stall              (ibctrl_debug_fifo_stall             ),
  .ibctrl_debug_ib_expt_vld             (ibctrl_debug_ib_expt_vld            ),
  .ibctrl_debug_ib_ip_stall             (ibctrl_debug_ib_ip_stall            ),
  .ibctrl_debug_ib_vld                  (ibctrl_debug_ib_vld                 ),
  .ibctrl_debug_ibuf_empty              (ibctrl_debug_ibuf_empty             ),
  .ibctrl_debug_ibuf_full               (ibctrl_debug_ibuf_full              ),
  .ibctrl_debug_ibuf_inst_vld           (ibctrl_debug_ibuf_inst_vld          ),
  .ibctrl_debug_ind_btb_stall           (ibctrl_debug_ind_btb_stall          ),
  .ibctrl_debug_lbuf_inst_vld           (ibctrl_debug_lbuf_inst_vld          ),
  .ibctrl_debug_mispred_stall           (ibctrl_debug_mispred_stall          ),
  .ibdp_debug_inst0_vld                 (ibdp_debug_inst0_vld                ),
  .ibdp_debug_inst1_vld                 (ibdp_debug_inst1_vld                ),
  .ibdp_debug_inst2_vld                 (ibdp_debug_inst2_vld                ),
  .ibdp_debug_mmu_deny_vld              (ibdp_debug_mmu_deny_vld             ),
  .ifctrl_debug_if_pc_vld               (ifctrl_debug_if_pc_vld              ),
  .ifctrl_debug_if_stall                (ifctrl_debug_if_stall               ),
  .ifctrl_debug_if_vld                  (ifctrl_debug_if_vld                 ),
  .ifctrl_debug_inv_st                  (ifctrl_debug_inv_st                 ),
  .ifctrl_debug_lsu_all_inv             (ifctrl_debug_lsu_all_inv            ),
  .ifctrl_debug_lsu_line_inv            (ifctrl_debug_lsu_line_inv           ),
  .ifctrl_debug_mmu_pavld               (ifctrl_debug_mmu_pavld              ),
  .ifctrl_debug_way_pred_stall          (ifctrl_debug_way_pred_stall         ),
  .ifdp_debug_acc_err_vld               (ifdp_debug_acc_err_vld              ),
  .ifdp_debug_mmu_expt_vld              (ifdp_debug_mmu_expt_vld             ),
  .ifu_had_debug_info                   (ifu_had_debug_info                  ),
  .ifu_had_reset_on                     (ifu_had_reset_on                    ),
  .ipb_debug_req_cur_st                 (ipb_debug_req_cur_st                ),
  .ipb_debug_wb_cur_st                  (ipb_debug_wb_cur_st                 ),
  .ipctrl_debug_bry_missigned_stall     (ipctrl_debug_bry_missigned_stall    ),
  .ipctrl_debug_h0_vld                  (ipctrl_debug_h0_vld                 ),
  .ipctrl_debug_ip_expt_vld             (ipctrl_debug_ip_expt_vld            ),
  .ipctrl_debug_ip_if_stall             (ipctrl_debug_ip_if_stall            ),
  .ipctrl_debug_ip_vld                  (ipctrl_debug_ip_vld                 ),
  .ipctrl_debug_miss_under_refill_stall (ipctrl_debug_miss_under_refill_stall),
  .l0_btb_debug_cur_state               (l0_btb_debug_cur_state              ),
  .l1_refill_debug_refill_st            (l1_refill_debug_refill_st           ),
  .lbuf_debug_st                        (lbuf_debug_st                       ),
  .pcgen_debug_chgflw                   (pcgen_debug_chgflw                  ),
  .pcgen_debug_pcbus                    (pcgen_debug_pcbus                   ),
  .rtu_ifu_xx_dbgon                     (rtu_ifu_xx_dbgon                    ),
  .vector_debug_cur_st                  (vector_debug_cur_st                 ),
  .vector_debug_reset_on                (vector_debug_reset_on               ),
  .vfdsu_ifu_debug_ex2_wait             (vfdsu_ifu_debug_ex2_wait            ),
  .vfdsu_ifu_debug_idle                 (vfdsu_ifu_debug_idle                ),
  .vfdsu_ifu_debug_pipe_busy            (vfdsu_ifu_debug_pipe_busy           )
);




// &ModuleEnd; @344
endmodule


