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

// &ModuleBeg; @27
module ct_lsu_ld_dc(
  cb_ld_dc_addr_hit,
  cp0_lsu_da_fwd_dis,
  cp0_lsu_dcache_en,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ld_clk,
  dcache_arb_ld_dc_borrow_db,
  dcache_arb_ld_dc_borrow_icc,
  dcache_arb_ld_dc_borrow_mmu,
  dcache_arb_ld_dc_borrow_sndb,
  dcache_arb_ld_dc_borrow_vb,
  dcache_arb_ld_dc_borrow_vld,
  dcache_arb_ld_dc_borrow_vld_gate,
  dcache_arb_ld_dc_settle_way,
  dcache_idx,
  dcache_lsu_ld_tag_dout,
  forever_cpuclk,
  had_yy_xx_bkpta_base,
  had_yy_xx_bkpta_mask,
  had_yy_xx_bkpta_rc,
  had_yy_xx_bkptb_base,
  had_yy_xx_bkptb_mask,
  had_yy_xx_bkptb_rc,
  icc_dcache_arb_ld_tag_read,
  ld_ag_addr1_to4,
  ld_ag_ahead_predict,
  ld_ag_already_da,
  ld_ag_atomic,
  ld_ag_boundary,
  ld_ag_dc_access_size,
  ld_ag_dc_acclr_en,
  ld_ag_dc_addr0,
  ld_ag_dc_bytes_vld,
  ld_ag_dc_bytes_vld1,
  ld_ag_dc_fwd_bypass_en,
  ld_ag_dc_inst_vld,
  ld_ag_dc_load_ahead_inst_vld,
  ld_ag_dc_load_inst_vld,
  ld_ag_dc_mmu_req,
  ld_ag_dc_rot_sel,
  ld_ag_dc_vload_ahead_inst_vld,
  ld_ag_dc_vload_inst_vld,
  ld_ag_expt_access_fault_with_page,
  ld_ag_expt_ldamo_not_ca,
  ld_ag_expt_misalign_no_page,
  ld_ag_expt_misalign_with_page,
  ld_ag_expt_page_fault,
  ld_ag_expt_vld,
  ld_ag_iid,
  ld_ag_inst_type,
  ld_ag_inst_vfls,
  ld_ag_inst_vld,
  ld_ag_ldfifo_pc,
  ld_ag_lsid,
  ld_ag_lsiq_bkpta_data,
  ld_ag_lsiq_bkptb_data,
  ld_ag_lsiq_spec_fail,
  ld_ag_no_spec,
  ld_ag_no_spec_exist,
  ld_ag_old,
  ld_ag_page_buf,
  ld_ag_page_ca,
  ld_ag_page_sec,
  ld_ag_page_share,
  ld_ag_page_so,
  ld_ag_pf_inst,
  ld_ag_preg,
  ld_ag_raw_new,
  ld_ag_secd,
  ld_ag_sign_extend,
  ld_ag_split,
  ld_ag_utlb_miss,
  ld_ag_vpn,
  ld_ag_vreg,
  ld_dc_addr0,
  ld_dc_addr1,
  ld_dc_addr1_11to4,
  ld_dc_ahead_predict,
  ld_dc_ahead_preg_wb_vld,
  ld_dc_ahead_vreg_wb_vld,
  ld_dc_already_da,
  ld_dc_atomic,
  ld_dc_bkpta_data,
  ld_dc_bkptb_data,
  ld_dc_borrow_db,
  ld_dc_borrow_icc,
  ld_dc_borrow_icc_tag,
  ld_dc_borrow_mmu,
  ld_dc_borrow_sndb,
  ld_dc_borrow_vb,
  ld_dc_borrow_vld,
  ld_dc_boundary,
  ld_dc_bytes_vld,
  ld_dc_bytes_vld1,
  ld_dc_cb_addr_create_gateclk_en,
  ld_dc_cb_addr_create_vld,
  ld_dc_cb_addr_tto4,
  ld_dc_chk_atomic_inst_vld,
  ld_dc_chk_ld_addr1_vld,
  ld_dc_chk_ld_bypass_vld,
  ld_dc_chk_ld_inst_vld,
  ld_dc_da_bytes_vld,
  ld_dc_da_bytes_vld1,
  ld_dc_da_cb_addr_create,
  ld_dc_da_cb_merge_en,
  ld_dc_da_data_rot_sel,
  ld_dc_da_expt_vld_gate_en,
  ld_dc_da_icc_tag_vld,
  ld_dc_da_inst_vld,
  ld_dc_da_old,
  ld_dc_da_page_buf,
  ld_dc_da_page_ca,
  ld_dc_da_page_sec,
  ld_dc_da_page_share,
  ld_dc_da_page_so,
  ld_dc_da_pf_inst,
  ld_dc_da_tag_read,
  ld_dc_dcache_hit,
  ld_dc_expt_access_fault_extra,
  ld_dc_expt_access_fault_mask,
  ld_dc_expt_vec,
  ld_dc_expt_vld_except_access_err,
  ld_dc_fwd_bytes_vld,
  ld_dc_fwd_sq_vld,
  ld_dc_fwd_wmb_vld,
  ld_dc_get_dcache_data,
  ld_dc_hit_high_region,
  ld_dc_hit_low_region,
  ld_dc_idu_lq_full,
  ld_dc_idu_tlb_busy,
  ld_dc_iid,
  ld_dc_imme_wakeup,
  ld_dc_inst_chk_vld,
  ld_dc_inst_size,
  ld_dc_inst_type,
  ld_dc_inst_vfls,
  ld_dc_inst_vld,
  ld_dc_ldfifo_pc,
  ld_dc_lq_create1_dp_vld,
  ld_dc_lq_create1_gateclk_en,
  ld_dc_lq_create1_vld,
  ld_dc_lq_create_dp_vld,
  ld_dc_lq_create_gateclk_en,
  ld_dc_lq_create_vld,
  ld_dc_lq_full_gateclk_en,
  ld_dc_lsid,
  ld_dc_mmu_req,
  ld_dc_mt_value,
  ld_dc_no_spec,
  ld_dc_no_spec_exist,
  ld_dc_pfu_info_set_vld,
  ld_dc_pfu_va,
  ld_dc_preg,
  ld_dc_preg_sign_sel,
  ld_dc_secd,
  ld_dc_settle_way,
  ld_dc_sign_extend,
  ld_dc_spec_fail,
  ld_dc_split,
  ld_dc_tlb_busy_gateclk_en,
  ld_dc_vector_nop,
  ld_dc_vreg,
  ld_dc_vreg_sign_sel,
  ld_dc_wait_fence,
  lq_ld_dc_full,
  lq_ld_dc_inst_hit,
  lq_ld_dc_less2,
  lq_ld_dc_spec_fail,
  lsu_dcache_ld_xx_gwen,
  lsu_has_fence,
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
  lsu_mmu_vabuf0,
  mmu_lsu_data_req_size,
  mmu_lsu_mmu_en,
  mmu_lsu_tlb_busy,
  pad_yy_icg_scan_en,
  pfu_pfb_empty,
  pfu_sdb_create_gateclk_en,
  pfu_sdb_empty,
  rb_fence_ld,
  rtu_yy_xx_flush,
  sq_ld_dc_addr1_dep_discard,
  sq_ld_dc_cancel_acc_req,
  sq_ld_dc_cancel_ahead_wb,
  sq_ld_dc_fwd_req,
  sq_ld_dc_has_fwd_req,
  st_dc_addr0,
  st_dc_bytes_vld,
  st_dc_chk_st_inst_vld,
  st_dc_chk_statomic_inst_vld,
  st_dc_inst_vld,
  wmb_fwd_bytes_vld,
  wmb_ld_dc_cancel_acc_req,
  wmb_ld_dc_discard_req,
  wmb_ld_dc_fwd_req
);

// &Ports; @28
input           cb_ld_dc_addr_hit;                      
input           cp0_lsu_da_fwd_dis;                     
input           cp0_lsu_dcache_en;                      
input           cp0_lsu_icg_en;                         
input           cp0_yy_clk_en;                          
input           cpurst_b;                               
input           ctrl_ld_clk;                            
input   [2 :0]  dcache_arb_ld_dc_borrow_db;             
input           dcache_arb_ld_dc_borrow_icc;            
input           dcache_arb_ld_dc_borrow_mmu;            
input           dcache_arb_ld_dc_borrow_sndb;           
input           dcache_arb_ld_dc_borrow_vb;             
input           dcache_arb_ld_dc_borrow_vld;            
input           dcache_arb_ld_dc_borrow_vld_gate;       
input           dcache_arb_ld_dc_settle_way;            
input   [8 :0]  dcache_idx;                             
input   [53:0]  dcache_lsu_ld_tag_dout;                 
input           forever_cpuclk;                         
input   [39:0]  had_yy_xx_bkpta_base;                   
input   [7 :0]  had_yy_xx_bkpta_mask;                   
input           had_yy_xx_bkpta_rc;                     
input   [39:0]  had_yy_xx_bkptb_base;                   
input   [7 :0]  had_yy_xx_bkptb_mask;                   
input           had_yy_xx_bkptb_rc;                     
input           icc_dcache_arb_ld_tag_read;             
input   [35:0]  ld_ag_addr1_to4;                        
input           ld_ag_ahead_predict;                    
input           ld_ag_already_da;                       
input           ld_ag_atomic;                           
input           ld_ag_boundary;                         
input   [2 :0]  ld_ag_dc_access_size;                   
input           ld_ag_dc_acclr_en;                      
input   [39:0]  ld_ag_dc_addr0;                         
input   [15:0]  ld_ag_dc_bytes_vld;                     
input   [15:0]  ld_ag_dc_bytes_vld1;                    
input           ld_ag_dc_fwd_bypass_en;                 
input           ld_ag_dc_inst_vld;                      
input           ld_ag_dc_load_ahead_inst_vld;           
input           ld_ag_dc_load_inst_vld;                 
input           ld_ag_dc_mmu_req;                       
input   [3 :0]  ld_ag_dc_rot_sel;                       
input           ld_ag_dc_vload_ahead_inst_vld;          
input           ld_ag_dc_vload_inst_vld;                
input           ld_ag_expt_access_fault_with_page;      
input           ld_ag_expt_ldamo_not_ca;                
input           ld_ag_expt_misalign_no_page;            
input           ld_ag_expt_misalign_with_page;          
input           ld_ag_expt_page_fault;                  
input           ld_ag_expt_vld;                         
input   [6 :0]  ld_ag_iid;                              
input   [1 :0]  ld_ag_inst_type;                        
input           ld_ag_inst_vfls;                        
input           ld_ag_inst_vld;                         
input   [14:0]  ld_ag_ldfifo_pc;                        
input   [11:0]  ld_ag_lsid;                             
input           ld_ag_lsiq_bkpta_data;                  
input           ld_ag_lsiq_bkptb_data;                  
input           ld_ag_lsiq_spec_fail;                   
input           ld_ag_no_spec;                          
input           ld_ag_no_spec_exist;                    
input           ld_ag_old;                              
input           ld_ag_page_buf;                         
input           ld_ag_page_ca;                          
input           ld_ag_page_sec;                         
input           ld_ag_page_share;                       
input           ld_ag_page_so;                          
input           ld_ag_pf_inst;                          
input   [6 :0]  ld_ag_preg;                             
input           ld_ag_raw_new;                          
input           ld_ag_secd;                             
input           ld_ag_sign_extend;                      
input           ld_ag_split;                            
input           ld_ag_utlb_miss;                        
input   [27:0]  ld_ag_vpn;                              
input   [5 :0]  ld_ag_vreg;                             
input           lq_ld_dc_full;                          
input           lq_ld_dc_inst_hit;                      
input           lq_ld_dc_less2;                         
input           lq_ld_dc_spec_fail;                     
input           lsu_dcache_ld_xx_gwen;                  
input           lsu_has_fence;                          
input           mmu_lsu_data_req_size;                  
input           mmu_lsu_mmu_en;                         
input           mmu_lsu_tlb_busy;                       
input           pad_yy_icg_scan_en;                     
input           pfu_pfb_empty;                          
input           pfu_sdb_create_gateclk_en;              
input           pfu_sdb_empty;                          
input           rb_fence_ld;                            
input           rtu_yy_xx_flush;                        
input           sq_ld_dc_addr1_dep_discard;             
input           sq_ld_dc_cancel_acc_req;                
input           sq_ld_dc_cancel_ahead_wb;               
input           sq_ld_dc_fwd_req;                       
input           sq_ld_dc_has_fwd_req;                   
input   [39:0]  st_dc_addr0;                            
input   [15:0]  st_dc_bytes_vld;                        
input           st_dc_chk_st_inst_vld;                  
input           st_dc_chk_statomic_inst_vld;            
input           st_dc_inst_vld;                         
input   [15:0]  wmb_fwd_bytes_vld;                      
input           wmb_ld_dc_cancel_acc_req;               
input           wmb_ld_dc_discard_req;                  
input           wmb_ld_dc_fwd_req;                      
output  [39:0]  ld_dc_addr0;                            
output  [39:0]  ld_dc_addr1;                            
output  [7 :0]  ld_dc_addr1_11to4;                      
output          ld_dc_ahead_predict;                    
output          ld_dc_ahead_preg_wb_vld;                
output          ld_dc_ahead_vreg_wb_vld;                
output          ld_dc_already_da;                       
output          ld_dc_atomic;                           
output          ld_dc_bkpta_data;                       
output          ld_dc_bkptb_data;                       
output  [2 :0]  ld_dc_borrow_db;                        
output          ld_dc_borrow_icc;                       
output          ld_dc_borrow_icc_tag;                   
output          ld_dc_borrow_mmu;                       
output          ld_dc_borrow_sndb;                      
output          ld_dc_borrow_vb;                        
output          ld_dc_borrow_vld;                       
output          ld_dc_boundary;                         
output  [15:0]  ld_dc_bytes_vld;                        
output  [15:0]  ld_dc_bytes_vld1;                       
output          ld_dc_cb_addr_create_gateclk_en;        
output          ld_dc_cb_addr_create_vld;               
output  [35:0]  ld_dc_cb_addr_tto4;                     
output          ld_dc_chk_atomic_inst_vld;              
output          ld_dc_chk_ld_addr1_vld;                 
output          ld_dc_chk_ld_bypass_vld;                
output          ld_dc_chk_ld_inst_vld;                  
output  [15:0]  ld_dc_da_bytes_vld;                     
output  [15:0]  ld_dc_da_bytes_vld1;                    
output          ld_dc_da_cb_addr_create;                
output          ld_dc_da_cb_merge_en;                   
output  [7 :0]  ld_dc_da_data_rot_sel;                  
output          ld_dc_da_expt_vld_gate_en;              
output          ld_dc_da_icc_tag_vld;                   
output          ld_dc_da_inst_vld;                      
output          ld_dc_da_old;                           
output          ld_dc_da_page_buf;                      
output          ld_dc_da_page_ca;                       
output          ld_dc_da_page_sec;                      
output          ld_dc_da_page_share;                    
output          ld_dc_da_page_so;                       
output          ld_dc_da_pf_inst;                       
output  [26:0]  ld_dc_da_tag_read;                      
output          ld_dc_dcache_hit;                       
output          ld_dc_expt_access_fault_extra;          
output          ld_dc_expt_access_fault_mask;           
output  [4 :0]  ld_dc_expt_vec;                         
output          ld_dc_expt_vld_except_access_err;       
output  [15:0]  ld_dc_fwd_bytes_vld;                    
output          ld_dc_fwd_sq_vld;                       
output          ld_dc_fwd_wmb_vld;                      
output  [3 :0]  ld_dc_get_dcache_data;                  
output          ld_dc_hit_high_region;                  
output          ld_dc_hit_low_region;                   
output  [11:0]  ld_dc_idu_lq_full;                      
output  [11:0]  ld_dc_idu_tlb_busy;                     
output  [6 :0]  ld_dc_iid;                              
output  [11:0]  ld_dc_imme_wakeup;                      
output          ld_dc_inst_chk_vld;                     
output  [2 :0]  ld_dc_inst_size;                        
output  [1 :0]  ld_dc_inst_type;                        
output          ld_dc_inst_vfls;                        
output          ld_dc_inst_vld;                         
output  [14:0]  ld_dc_ldfifo_pc;                        
output          ld_dc_lq_create1_dp_vld;                
output          ld_dc_lq_create1_gateclk_en;            
output          ld_dc_lq_create1_vld;                   
output          ld_dc_lq_create_dp_vld;                 
output          ld_dc_lq_create_gateclk_en;             
output          ld_dc_lq_create_vld;                    
output          ld_dc_lq_full_gateclk_en;               
output  [11:0]  ld_dc_lsid;                             
output          ld_dc_mmu_req;                          
output  [39:0]  ld_dc_mt_value;                         
output          ld_dc_no_spec;                          
output          ld_dc_no_spec_exist;                    
output          ld_dc_pfu_info_set_vld;                 
output  [39:0]  ld_dc_pfu_va;                           
output  [6 :0]  ld_dc_preg;                             
output  [3 :0]  ld_dc_preg_sign_sel;                    
output          ld_dc_secd;                             
output          ld_dc_settle_way;                       
output          ld_dc_sign_extend;                      
output          ld_dc_spec_fail;                        
output          ld_dc_split;                            
output          ld_dc_tlb_busy_gateclk_en;              
output          ld_dc_vector_nop;                       
output  [5 :0]  ld_dc_vreg;                             
output          ld_dc_vreg_sign_sel;                    
output          ld_dc_wait_fence;                       
output          lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1; 
output          lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2; 
output          lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3; 
output          lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4; 
output          lsu_idu_dc_pipe3_load_inst_vld_dup0;    
output          lsu_idu_dc_pipe3_load_inst_vld_dup1;    
output          lsu_idu_dc_pipe3_load_inst_vld_dup2;    
output          lsu_idu_dc_pipe3_load_inst_vld_dup3;    
output          lsu_idu_dc_pipe3_load_inst_vld_dup4;    
output  [6 :0]  lsu_idu_dc_pipe3_preg_dup0;             
output  [6 :0]  lsu_idu_dc_pipe3_preg_dup1;             
output  [6 :0]  lsu_idu_dc_pipe3_preg_dup2;             
output  [6 :0]  lsu_idu_dc_pipe3_preg_dup3;             
output  [6 :0]  lsu_idu_dc_pipe3_preg_dup4;             
output          lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
output          lsu_idu_dc_pipe3_vload_inst_vld_dup0;   
output          lsu_idu_dc_pipe3_vload_inst_vld_dup1;   
output          lsu_idu_dc_pipe3_vload_inst_vld_dup2;   
output          lsu_idu_dc_pipe3_vload_inst_vld_dup3;   
output  [6 :0]  lsu_idu_dc_pipe3_vreg_dup0;             
output  [6 :0]  lsu_idu_dc_pipe3_vreg_dup1;             
output  [6 :0]  lsu_idu_dc_pipe3_vreg_dup2;             
output  [6 :0]  lsu_idu_dc_pipe3_vreg_dup3;             
output  [27:0]  lsu_mmu_vabuf0;                         

// &Regs; @29
reg             ld_dc_acclr_en;                         
reg     [39:0]  ld_dc_addr0;                            
reg     [35:0]  ld_dc_addr1_tto4;                       
reg             ld_dc_ahead_predict;                    
reg             ld_dc_already_da;                       
reg             ld_dc_atomic;                           
reg     [2 :0]  ld_dc_borrow_db;                        
reg             ld_dc_borrow_icc;                       
reg             ld_dc_borrow_icc_tag;                   
reg             ld_dc_borrow_mmu;                       
reg             ld_dc_borrow_sndb;                      
reg             ld_dc_borrow_vb;                        
reg             ld_dc_borrow_vld;                       
reg             ld_dc_boundary;                         
reg     [15:0]  ld_dc_bytes_vld;                        
reg     [15:0]  ld_dc_bytes_vld1;                       
reg     [7 :0]  ld_dc_da_data_rot_sel;                  
reg             ld_dc_expt_access_fault_with_page;      
reg             ld_dc_expt_ldamo_not_ca;                
reg             ld_dc_expt_misalign_no_page;            
reg             ld_dc_expt_misalign_with_page;          
reg             ld_dc_expt_page_fault;                  
reg     [4 :0]  ld_dc_expt_vec;                         
reg             ld_dc_expt_vld_except_access_err;       
reg             ld_dc_fwd_bypass_en;                    
reg     [15:0]  ld_dc_fwd_bytes_vld;                    
reg     [6 :0]  ld_dc_iid;                              
reg     [2 :0]  ld_dc_inst_size;                        
reg     [1 :0]  ld_dc_inst_type;                        
reg             ld_dc_inst_vfls;                        
reg             ld_dc_inst_vld;                         
reg     [14:0]  ld_dc_ldfifo_pc;                        
reg             ld_dc_load_ahead_inst_vld_dup1;         
reg             ld_dc_load_ahead_inst_vld_dup2;         
reg             ld_dc_load_ahead_inst_vld_dup3;         
reg             ld_dc_load_ahead_inst_vld_dup4;         
reg             ld_dc_load_inst_vld_dup0;               
reg             ld_dc_load_inst_vld_dup1;               
reg             ld_dc_load_inst_vld_dup2;               
reg             ld_dc_load_inst_vld_dup3;               
reg             ld_dc_load_inst_vld_dup4;               
reg     [11:0]  ld_dc_lsid;                             
reg             ld_dc_lsiq_bkpta_data;                  
reg             ld_dc_lsiq_bkptb_data;                  
reg             ld_dc_lsiq_spec_fail;                   
reg             ld_dc_mmu_req;                          
reg     [39:0]  ld_dc_mt_value;                         
reg             ld_dc_no_spec;                          
reg             ld_dc_no_spec_exist;                    
reg             ld_dc_old;                              
reg             ld_dc_page_buf;                         
reg             ld_dc_page_ca;                          
reg             ld_dc_page_sec;                         
reg             ld_dc_page_share;                       
reg             ld_dc_page_so;                          
reg             ld_dc_pf_inst;                          
reg     [6 :0]  ld_dc_preg;                             
reg     [6 :0]  ld_dc_preg_dup1;                        
reg     [6 :0]  ld_dc_preg_dup2;                        
reg     [6 :0]  ld_dc_preg_dup3;                        
reg     [6 :0]  ld_dc_preg_dup4;                        
reg     [3 :0]  ld_dc_preg_sign_sel;                    
reg             ld_dc_raw_new;                          
reg     [3 :0]  ld_dc_rot_sel;                          
reg             ld_dc_secd;                             
reg             ld_dc_settle_way;                       
reg             ld_dc_sign_extend;                      
reg             ld_dc_split;                            
reg             ld_dc_tlb_busy;                         
reg             ld_dc_utlb_miss;                        
reg             ld_dc_vload_ahead_inst_vld;             
reg             ld_dc_vload_inst_vld_dup0;              
reg             ld_dc_vload_inst_vld_dup1;              
reg             ld_dc_vload_inst_vld_dup2;              
reg             ld_dc_vload_inst_vld_dup3;              
reg     [27:0]  ld_dc_vpn;                              
reg     [5 :0]  ld_dc_vreg;                             
reg     [5 :0]  ld_dc_vreg_dup1;                        
reg     [5 :0]  ld_dc_vreg_dup2;                        
reg     [5 :0]  ld_dc_vreg_dup3;                        
reg     [15:0]  mmu_bytes_vld;                          

// &Wires; @30
wire            cb_create_hit_idx;                      
wire            cb_ld_dc_addr_hit;                      
wire            cp0_lsu_da_fwd_dis;                     
wire            cp0_lsu_dcache_en;                      
wire            cp0_lsu_icg_en;                         
wire            cp0_yy_clk_en;                          
wire            cpurst_b;                               
wire            ctrl_ld_clk;                            
wire    [2 :0]  dcache_arb_ld_dc_borrow_db;             
wire            dcache_arb_ld_dc_borrow_icc;            
wire            dcache_arb_ld_dc_borrow_mmu;            
wire            dcache_arb_ld_dc_borrow_sndb;           
wire            dcache_arb_ld_dc_borrow_vb;             
wire            dcache_arb_ld_dc_borrow_vld;            
wire            dcache_arb_ld_dc_borrow_vld_gate;       
wire            dcache_arb_ld_dc_settle_way;            
wire    [8 :0]  dcache_idx;                             
wire    [53:0]  dcache_lsu_ld_tag_dout;                 
wire            forever_cpuclk;                         
wire    [39:0]  had_yy_xx_bkpta_base;                   
wire    [7 :0]  had_yy_xx_bkpta_mask;                   
wire            had_yy_xx_bkpta_rc;                     
wire    [39:0]  had_yy_xx_bkptb_base;                   
wire    [7 :0]  had_yy_xx_bkptb_mask;                   
wire            had_yy_xx_bkptb_rc;                     
wire            icc_dcache_arb_ld_tag_read;             
wire    [35:0]  ld_ag_addr1_to4;                        
wire            ld_ag_ahead_predict;                    
wire            ld_ag_already_da;                       
wire            ld_ag_atomic;                           
wire            ld_ag_boundary;                         
wire    [2 :0]  ld_ag_dc_access_size;                   
wire            ld_ag_dc_acclr_en;                      
wire    [39:0]  ld_ag_dc_addr0;                         
wire    [15:0]  ld_ag_dc_bytes_vld;                     
wire    [15:0]  ld_ag_dc_bytes_vld1;                    
wire            ld_ag_dc_fwd_bypass_en;                 
wire            ld_ag_dc_inst_vld;                      
wire            ld_ag_dc_load_ahead_inst_vld;           
wire            ld_ag_dc_load_inst_vld;                 
wire            ld_ag_dc_mmu_req;                       
wire    [3 :0]  ld_ag_dc_rot_sel;                       
wire            ld_ag_dc_vload_ahead_inst_vld;          
wire            ld_ag_dc_vload_inst_vld;                
wire            ld_ag_expt_access_fault_with_page;      
wire            ld_ag_expt_ldamo_not_ca;                
wire            ld_ag_expt_misalign_no_page;            
wire            ld_ag_expt_misalign_with_page;          
wire            ld_ag_expt_page_fault;                  
wire            ld_ag_expt_vld;                         
wire    [6 :0]  ld_ag_iid;                              
wire    [1 :0]  ld_ag_inst_type;                        
wire            ld_ag_inst_vfls;                        
wire            ld_ag_inst_vld;                         
wire    [14:0]  ld_ag_ldfifo_pc;                        
wire    [11:0]  ld_ag_lsid;                             
wire            ld_ag_lsiq_bkpta_data;                  
wire            ld_ag_lsiq_bkptb_data;                  
wire            ld_ag_lsiq_spec_fail;                   
wire            ld_ag_no_spec;                          
wire            ld_ag_no_spec_exist;                    
wire            ld_ag_old;                              
wire            ld_ag_page_buf;                         
wire            ld_ag_page_ca;                          
wire            ld_ag_page_sec;                         
wire            ld_ag_page_share;                       
wire            ld_ag_page_so;                          
wire            ld_ag_pf_inst;                          
wire    [6 :0]  ld_ag_preg;                             
wire            ld_ag_raw_new;                          
wire            ld_ag_secd;                             
wire            ld_ag_sign_extend;                      
wire            ld_ag_split;                            
wire            ld_ag_utlb_miss;                        
wire    [27:0]  ld_ag_vpn;                              
wire    [5 :0]  ld_ag_vreg;                             
wire    [39:0]  ld_dc_addr1;                            
wire    [7 :0]  ld_dc_addr1_11to4;                      
wire            ld_dc_ahead_preg_wb_vld;                
wire            ld_dc_ahead_vreg_wb_vld;                
wire            ld_dc_ahead_wb_vld;                     
wire    [7 :0]  ld_dc_bkpta_addr0_11to4;                
wire    [3 :0]  ld_dc_bkpta_addr0_3to0;                 
wire    [7 :0]  ld_dc_bkpta_addr1_11to4;                
wire    [3 :0]  ld_dc_bkpta_addr1_3to0;                 
wire    [27:0]  ld_dc_bkpta_addr_tto12;                 
wire            ld_dc_bkpta_data;                       
wire            ld_dc_bkpta_trap;                       
wire    [7 :0]  ld_dc_bkptb_addr0_11to4;                
wire    [3 :0]  ld_dc_bkptb_addr0_3to0;                 
wire    [7 :0]  ld_dc_bkptb_addr1_11to4;                
wire    [3 :0]  ld_dc_bkptb_addr1_3to0;                 
wire    [27:0]  ld_dc_bkptb_addr_tto12;                 
wire            ld_dc_bkptb_data;                       
wire            ld_dc_bkptb_trap;                       
wire            ld_dc_borrow_clk;                       
wire            ld_dc_borrow_clk_en;                    
wire            ld_dc_borrow_mmu_vld;                   
wire            ld_dc_cb_addr_create_gateclk_en;        
wire            ld_dc_cb_addr_create_vld;               
wire    [35:0]  ld_dc_cb_addr_tto4;                     
wire            ld_dc_chk_atomic_inst_vld;              
wire            ld_dc_chk_ld_addr1_vld;                 
wire            ld_dc_chk_ld_bypass_vld;                
wire            ld_dc_chk_ld_inst_vld;                  
wire            ld_dc_clk;                              
wire            ld_dc_clk_en;                           
wire    [39:0]  ld_dc_cmp_st_dc_addr0;                  
wire    [15:0]  ld_dc_da_bytes_vld;                     
wire    [15:0]  ld_dc_da_bytes_vld1;                    
wire            ld_dc_da_cb_addr_create;                
wire            ld_dc_da_cb_merge_en;                   
wire            ld_dc_da_expt_vld_gate_en;              
wire            ld_dc_da_icc_tag_vld;                   
wire            ld_dc_da_inst_vld;                      
wire            ld_dc_da_old;                           
wire            ld_dc_da_page_buf;                      
wire            ld_dc_da_page_ca;                       
wire            ld_dc_da_page_sec;                      
wire            ld_dc_da_page_share;                    
wire            ld_dc_da_page_so;                       
wire            ld_dc_da_pf_inst;                       
wire    [26:0]  ld_dc_da_tag_read;                      
wire    [3 :0]  ld_dc_data_bias_sel;                    
wire            ld_dc_dcache_hit;                       
wire    [53:0]  ld_dc_dcache_tag_array;                 
wire            ld_dc_dcache_valid0;                    
wire            ld_dc_dcache_valid1;                    
wire            ld_dc_depd_imme_restart_req;            
wire            ld_dc_depd_imme_restart_vld;            
wire            ld_dc_depd_st_dc;                       
wire            ld_dc_depd_st_dc2;                      
wire            ld_dc_depd_st_dc3;                      
wire            ld_dc_dup_dcache_data_en;               
wire            ld_dc_expt_access_fault_extra;          
wire            ld_dc_expt_access_fault_mask;           
wire            ld_dc_expt_access_fault_short;          
wire            ld_dc_fwd_sq_vld;                       
wire            ld_dc_fwd_wmb_vld;                      
wire    [3 :0]  ld_dc_get_dcache_data;                  
wire            ld_dc_get_dcache_data_all;              
wire    [3 :0]  ld_dc_get_dcache_data_inst_mmu;         
wire    [39:0]  ld_dc_had_bkpta_addr;                   
wire    [39:0]  ld_dc_had_bkptb_addr;                   
wire            ld_dc_hit_high_region;                  
wire            ld_dc_hit_low_region;                   
wire            ld_dc_hit_way0;                         
wire            ld_dc_hit_way1;                         
wire    [11:0]  ld_dc_idu_lq_full;                      
wire    [11:0]  ld_dc_idu_tlb_busy;                     
wire            ld_dc_imme_restart_vld;                 
wire    [11:0]  ld_dc_imme_wakeup;                      
wire            ld_dc_inst_chk_vld;                     
wire            ld_dc_inst_clk;                         
wire            ld_dc_inst_clk_en;                      
wire            ld_dc_inst_vls;                         
wire            ld_dc_inst_vls_dup1;                    
wire            ld_dc_inst_vls_dup2;                    
wire            ld_dc_inst_vls_dup3;                    
wire            ld_dc_ld_inst;                          
wire            ld_dc_lq_create1_dp_vld;                
wire            ld_dc_lq_create1_gateclk_en;            
wire            ld_dc_lq_create1_vld;                   
wire            ld_dc_lq_create_dp_vld;                 
wire            ld_dc_lq_create_gateclk_en;             
wire            ld_dc_lq_create_vld;                    
wire            ld_dc_lq_full_gateclk_en;               
wire            ld_dc_lq_full_req;                      
wire            ld_dc_lq_full_vld;                      
wire    [11:0]  ld_dc_mask_lsid;                        
wire            ld_dc_pf_inst_short;                    
wire            ld_dc_pfu_info_set_vld;                 
wire    [39:0]  ld_dc_pfu_va;                           
wire    [7 :0]  ld_dc_pfu_va_11to4;                     
wire            ld_dc_pipe_bkpta_data;                  
wire            ld_dc_pipe_bkptb_data;                  
wire            ld_dc_raw_addr1_tto4_hit;               
wire            ld_dc_raw_addr_tto4_hit;                
wire            ld_dc_raw_do_hit;                       
wire            ld_dc_restart_vld;                      
wire    [3 :0]  ld_dc_rot_sel_final;                    
wire            ld_dc_spec_fail;                        
wire            ld_dc_tlb_busy_gateclk_en;              
wire            ld_dc_tlb_busy_restart_vld;             
wire            ld_dc_utlb_miss_vld;                    
wire    [39:0]  ld_dc_va;                               
wire            ld_dc_vector_nop;                       
wire            ld_dc_vreg_sign_sel;                    
wire            ld_dc_wait_fence;                       
wire            ld_dc_way0_tag_hit;                     
wire            ld_dc_way1_tag_hit;                     
wire            lq_ld_dc_full;                          
wire            lq_ld_dc_inst_hit;                      
wire            lq_ld_dc_less2;                         
wire            lq_ld_dc_spec_fail;                     
wire            lsu_dcache_ld_xx_gwen;                  
wire            lsu_has_fence;                          
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1; 
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2; 
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3; 
wire            lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4; 
wire            lsu_idu_dc_pipe3_load_inst_vld_dup0;    
wire            lsu_idu_dc_pipe3_load_inst_vld_dup1;    
wire            lsu_idu_dc_pipe3_load_inst_vld_dup2;    
wire            lsu_idu_dc_pipe3_load_inst_vld_dup3;    
wire            lsu_idu_dc_pipe3_load_inst_vld_dup4;    
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dup0;             
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dup1;             
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dup2;             
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dup3;             
wire    [6 :0]  lsu_idu_dc_pipe3_preg_dup4;             
wire            lsu_idu_dc_pipe3_vload_fwd_inst_vld;    
wire            lsu_idu_dc_pipe3_vload_inst_vld_dup0;   
wire            lsu_idu_dc_pipe3_vload_inst_vld_dup1;   
wire            lsu_idu_dc_pipe3_vload_inst_vld_dup2;   
wire            lsu_idu_dc_pipe3_vload_inst_vld_dup3;   
wire    [6 :0]  lsu_idu_dc_pipe3_vreg_dup0;             
wire    [6 :0]  lsu_idu_dc_pipe3_vreg_dup1;             
wire    [6 :0]  lsu_idu_dc_pipe3_vreg_dup2;             
wire    [6 :0]  lsu_idu_dc_pipe3_vreg_dup3;             
wire    [27:0]  lsu_mmu_vabuf0;                         
wire            mmu_lsu_data_req_size;                  
wire            mmu_lsu_mmu_en;                         
wire            mmu_lsu_tlb_busy;                       
wire    [3 :0]  mmu_rot_sel;                            
wire            pad_yy_icg_scan_en;                     
wire            pfu_pfb_empty;                          
wire            pfu_sdb_create_gateclk_en;              
wire            pfu_sdb_empty;                          
wire            rb_fence_ld;                            
wire            rtu_yy_xx_flush;                        
wire            sq_ld_dc_addr1_dep_discard;             
wire            sq_ld_dc_cancel_acc_req;                
wire            sq_ld_dc_cancel_ahead_wb;               
wire            sq_ld_dc_fwd_req;                       
wire            sq_ld_dc_has_fwd_req;                   
wire    [39:0]  st_dc_addr0;                            
wire    [15:0]  st_dc_bytes_vld;                        
wire            st_dc_chk_st_inst_vld;                  
wire            st_dc_chk_statomic_inst_vld;            
wire            st_dc_inst_vld;                         
wire    [15:0]  wmb_fwd_bytes_vld;                      
wire            wmb_ld_dc_cancel_acc_req;               
wire            wmb_ld_dc_discard_req;                  
wire            wmb_ld_dc_fwd_req;                      


parameter BYTE  = 2'b00,
          HALF  = 2'b01,
          WORD  = 2'b10,
          DWORD = 2'b11;
parameter VB_DATA_ENTRY = 3,
          LSIQ_ENTRY    = 12;
parameter VMB_ENTRY     = 8;
parameter PC_LEN        = 15;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign ld_dc_clk_en = ld_ag_inst_vld
                      ||  dcache_arb_ld_dc_borrow_vld_gate;
// &Instance("gated_clk_cell", "x_lsu_ld_dc_gated_clk"); @46
gated_clk_cell  x_lsu_ld_dc_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ld_dc_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ld_dc_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @47
//          .external_en   (1'b0               ), @48
//          .global_en     (1'b1               ), @49
//          .module_en     (cp0_lsu_icg_en     ), @50
//          .local_en      (ld_dc_clk_en       ), @51
//          .clk_out       (ld_dc_clk          )); @52

assign ld_dc_inst_clk_en = ld_ag_inst_vld;
// &Instance("gated_clk_cell", "x_lsu_ld_dc_inst_gated_clk"); @55
gated_clk_cell  x_lsu_ld_dc_inst_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ld_dc_inst_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ld_dc_inst_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @56
//          .external_en   (1'b0               ), @57
//          .global_en     (cp0_yy_clk_en      ), @58
//          .module_en     (cp0_lsu_icg_en     ), @59
//          .local_en      (ld_dc_inst_clk_en  ), @60
//          .clk_out       (ld_dc_inst_clk     )); @61

assign ld_dc_borrow_clk_en = dcache_arb_ld_dc_borrow_vld_gate;
// &Instance("gated_clk_cell", "x_lsu_ld_dc_borrow_gated_clk"); @64
gated_clk_cell  x_lsu_ld_dc_borrow_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (ld_dc_borrow_clk   ),
  .external_en         (1'b0               ),
  .global_en           (1'b1               ),
  .local_en            (ld_dc_borrow_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @65
//          .external_en   (1'b0               ), @66
//          .global_en     (1'b1               ), @67
//          .module_en     (cp0_lsu_icg_en     ), @68
//          .local_en      (ld_dc_borrow_clk_en), @69
//          .clk_out       (ld_dc_borrow_clk   )); @70

//-----------------------expt clk---------------------------
//assign ld_dc_expt_illegal_inst_clk_en = ld_ag_inst_vld
//                                        &&  ld_ag_expt_illegal_inst;
//&Instance("gated_clk_cell", "x_lsu_st_dc_expt_illegal_inst_gated_clk");
// //&Connect(.clk_in        (forever_cpuclk     ), @76
// //         .external_en   (1'b0               ), @77
// //         .global_en     (1'b1               ), @78
// //         .module_en     (cp0_lsu_icg_en     ), @79
// //         .local_en      (ld_dc_expt_illegal_inst_clk_en), @80
// //         .clk_out       (ld_dc_expt_illegal_inst_clk)); @81

//==========================================================
//                 Pipeline Register
//==========================================================
//------------------control part----------------------------
//+----------+------------+
//| inst_vld | borrow_vld |
//+----------+------------+
// &Force("output","ld_dc_inst_vld"); @90
always @(posedge ctrl_ld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_dc_inst_vld                   <=  1'b0;
    ld_dc_load_inst_vld_dup0         <=  1'b0;
    ld_dc_load_inst_vld_dup1         <=  1'b0;
    ld_dc_load_inst_vld_dup2         <=  1'b0;
    ld_dc_load_inst_vld_dup3         <=  1'b0;
    ld_dc_load_inst_vld_dup4         <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup1   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup2   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup3   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup4   <=  1'b0;
    ld_dc_vload_inst_vld_dup0        <=  1'b0;
    ld_dc_vload_inst_vld_dup1        <=  1'b0;
    ld_dc_vload_inst_vld_dup2        <=  1'b0;
    ld_dc_vload_inst_vld_dup3        <=  1'b0;
    ld_dc_vload_ahead_inst_vld       <=  1'b0;
  end
  else if(rtu_yy_xx_flush)
  begin
    ld_dc_inst_vld                   <=  1'b0;
    ld_dc_load_inst_vld_dup0         <=  1'b0;
    ld_dc_load_inst_vld_dup1         <=  1'b0;
    ld_dc_load_inst_vld_dup2         <=  1'b0;
    ld_dc_load_inst_vld_dup3         <=  1'b0;
    ld_dc_load_inst_vld_dup4         <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup1   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup2   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup3   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup4   <=  1'b0;
    ld_dc_vload_inst_vld_dup0        <=  1'b0;
    ld_dc_vload_inst_vld_dup1        <=  1'b0;
    ld_dc_vload_inst_vld_dup2        <=  1'b0;
    ld_dc_vload_inst_vld_dup3        <=  1'b0;
    ld_dc_vload_ahead_inst_vld       <=  1'b0;
  end
  else if(ld_ag_dc_inst_vld)
  begin
    ld_dc_inst_vld                   <=  1'b1;
    ld_dc_load_inst_vld_dup0         <=  ld_ag_dc_load_inst_vld;
    ld_dc_load_inst_vld_dup1         <=  ld_ag_dc_load_inst_vld;
    ld_dc_load_inst_vld_dup2         <=  ld_ag_dc_load_inst_vld;
    ld_dc_load_inst_vld_dup3         <=  ld_ag_dc_load_inst_vld;
    ld_dc_load_inst_vld_dup4         <=  ld_ag_dc_load_inst_vld;
    ld_dc_load_ahead_inst_vld_dup1   <=  ld_ag_dc_load_ahead_inst_vld;
    ld_dc_load_ahead_inst_vld_dup2   <=  ld_ag_dc_load_ahead_inst_vld;
    ld_dc_load_ahead_inst_vld_dup3   <=  ld_ag_dc_load_ahead_inst_vld;
    ld_dc_load_ahead_inst_vld_dup4   <=  ld_ag_dc_load_ahead_inst_vld;
    ld_dc_vload_inst_vld_dup0        <=  ld_ag_dc_vload_inst_vld;
    ld_dc_vload_inst_vld_dup1        <=  ld_ag_dc_vload_inst_vld;
    ld_dc_vload_inst_vld_dup2        <=  ld_ag_dc_vload_inst_vld;
    ld_dc_vload_inst_vld_dup3        <=  ld_ag_dc_vload_inst_vld;
    ld_dc_vload_ahead_inst_vld       <=  ld_ag_dc_vload_ahead_inst_vld;
  end
  else
  begin
    ld_dc_inst_vld                   <=  1'b0;
    ld_dc_load_inst_vld_dup0         <=  1'b0;
    ld_dc_load_inst_vld_dup1         <=  1'b0;
    ld_dc_load_inst_vld_dup2         <=  1'b0;
    ld_dc_load_inst_vld_dup3         <=  1'b0;
    ld_dc_load_inst_vld_dup4         <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup1   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup2   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup3   <=  1'b0;
    ld_dc_load_ahead_inst_vld_dup4   <=  1'b0;
    ld_dc_vload_inst_vld_dup0        <=  1'b0;
    ld_dc_vload_inst_vld_dup1        <=  1'b0;
    ld_dc_vload_inst_vld_dup2        <=  1'b0;
    ld_dc_vload_inst_vld_dup3        <=  1'b0;
    ld_dc_vload_ahead_inst_vld       <=  1'b0;
  end
end

// &Force("output","ld_dc_borrow_vld"); @167
always @(posedge ctrl_ld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ld_dc_borrow_vld      <=  1'b0;
  else if(dcache_arb_ld_dc_borrow_vld)
    ld_dc_borrow_vld      <=  1'b1;
  else
    ld_dc_borrow_vld      <=  1'b0;
end

//------------------expt part-------------------------------
//+-------+----------+--------+------+---------+
//| tmiss | misalign | tfatal | deny | rd_tinv |
//+-------+----------+--------+------+---------+
// &Force("output","ld_dc_mmu_req"); @182
always @(posedge ld_dc_inst_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_dc_mmu_req                     <=  1'b0;
    //ld_dc_expt_illegal_inst           <=  1'b0;
    ld_dc_expt_misalign_no_page       <=  1'b0;
    //ld_dc_expt_access_fault           <=  1'b0;
    ld_dc_expt_page_fault             <=  1'b0;
    ld_dc_expt_misalign_with_page     <=  1'b0;
    ld_dc_expt_access_fault_with_page <=  1'b0;
    ld_dc_expt_ldamo_not_ca           <=  1'b0;
  end
  else if(ld_ag_inst_vld)
  begin
    ld_dc_mmu_req                     <=  ld_ag_dc_mmu_req;
    //ld_dc_expt_illegal_inst           <=  ld_ag_expt_illegal_inst;
    ld_dc_expt_misalign_no_page       <=  ld_ag_expt_misalign_no_page;
    //ld_dc_expt_access_fault           <=  ld_ag_expt_access_fault;
    ld_dc_expt_page_fault             <=  ld_ag_expt_page_fault;
    ld_dc_expt_misalign_with_page     <=  ld_ag_expt_misalign_with_page;
    ld_dc_expt_access_fault_with_page <=  ld_ag_expt_access_fault_with_page;
    ld_dc_expt_ldamo_not_ca           <=  ld_ag_expt_ldamo_not_ca;
  end
end

//always @(posedge ld_dc_expt_illegal_inst_clk or negedge cpurst_b)
//begin
//  if (!cpurst_b)
//    ld_dc_inst_code[31:0]   <=  32'b0;
//  else if(ld_ag_inst_vld  &&  ld_ag_expt_illegal_inst)
//    ld_dc_inst_code[31:0]   <=  ld_ag_inst_code[31:0];
//end

//------------------borrow part-----------------------------
//+-----+------+-----+------------+
//| rcl | sndb | mmu | settle way |
//+-----+------+-----+------------+
// &Force("output","ld_dc_borrow_mmu"); @221
// &Force("output","ld_dc_borrow_icc"); @222
// &Force("output","ld_dc_borrow_icc_tag"); @223
// &Force("output","ld_dc_settle_way"); @224
always @(posedge ld_dc_borrow_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_dc_borrow_db[VB_DATA_ENTRY-1:0]  <=  {VB_DATA_ENTRY{1'b0}};
    ld_dc_borrow_vb                     <=  1'b0;
    ld_dc_borrow_sndb                   <=  1'b0;
    ld_dc_borrow_mmu                    <=  1'b0;
    ld_dc_borrow_icc                    <=  1'b0;
    ld_dc_borrow_icc_tag                <=  1'b0;
    ld_dc_settle_way                    <=  1'b0;
  end
  else if(dcache_arb_ld_dc_borrow_vld)
  begin
    ld_dc_borrow_db[VB_DATA_ENTRY-1:0]  <=  dcache_arb_ld_dc_borrow_db[VB_DATA_ENTRY-1:0];
    ld_dc_borrow_vb                     <=  dcache_arb_ld_dc_borrow_vb;
    ld_dc_borrow_sndb                   <=  dcache_arb_ld_dc_borrow_sndb;
    ld_dc_borrow_mmu                    <=  dcache_arb_ld_dc_borrow_mmu;
    ld_dc_borrow_icc                    <=  dcache_arb_ld_dc_borrow_icc;
    ld_dc_borrow_icc_tag                <=  icc_dcache_arb_ld_tag_read;
    ld_dc_settle_way                    <=  dcache_arb_ld_dc_settle_way;
  end
end

//------------------inst part----------------------------
//+----------+---------+-----+
//| expt_vld | pf_inst | vpn |
//+----------+---------+-----+
//+-----------+-----------+------+------------+----------------+
//| inst_type | inst_size | secd | already_da | lsiq_spec_fail |
//+-----------+-----------+------+------------+----------------+
//+-------------+----+-----+------+-----+------------+------------+
//| sign_extend | ex | iid | lsid | old | bytes_vld0 | bytes_vld1 |
//+-------------+----+-----+------+-----+------------+------------+
//+--------+----------+------+-------+
//| deform | boundary | preg | split |
//+--------+----------+------+-------+
//+-----------+-------+-------+-----------+---------+
//| ldfifo_pc | bkpta | bkptb | data_bias | pf_inst |
//+-----------+-------+-------+-----------+---------+
//+----+----+-----+-----+-------+
//| so | ca | buf | sec | share |
//+----+----+-----+-----+-------+
// &Force("output","ld_dc_split"); @278
// &Force("output","ld_dc_inst_type"); @279
// &Force("output","ld_dc_secd"); @280
// &Force("output","ld_dc_already_da"); @281
// &Force("output","ld_dc_atomic"); @282
// &Force("output","ld_dc_iid"); @283
// &Force("output","ld_dc_lsid"); @284
// &Force("output","ld_dc_bytes_vld"); @285
// &Force("output","ld_dc_bytes_vld1"); @286
// &Force("output","ld_dc_da_bytes_vld"); @287
// &Force("output","ld_dc_preg"); @288
// &Force("output","ld_dc_inst_vfls"); @289
// &Force("output","ld_dc_vreg"); @290
// &Force("output","ld_dc_addr1_11to4"); @291
// &Force("output","ld_dc_ldfifo_pc"); @292
// &Force("output","ld_dc_inst_size"); @293
// &Force("output","ld_dc_sign_extend"); @294
// &Force("output","ld_dc_expt_vld_except_access_err"); @295
// &Force("output","ld_dc_boundary"); @296
always @(posedge ld_dc_inst_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_dc_expt_vld_except_access_err  <=  1'b0;
    ld_dc_pf_inst                     <=  1'b0;
    ld_dc_vpn[27:0]                   <=  28'b0;
    ld_dc_addr1_tto4[`PA_WIDTH-5:0]   <=  {`PA_WIDTH-4{1'b0}};
    ld_dc_split                       <=  1'b0;
    ld_dc_inst_type[1:0]              <=  2'b0;
    ld_dc_inst_size[2:0]              <=  3'b0;
    ld_dc_secd                        <=  1'b0;
    ld_dc_already_da                  <=  1'b0;
    ld_dc_lsiq_spec_fail              <=  1'b0;
    ld_dc_lsiq_bkpta_data             <=  1'b0;
    ld_dc_lsiq_bkptb_data             <=  1'b0;
    ld_dc_sign_extend                 <=  1'b0;
    ld_dc_atomic                      <=  1'b0;
    ld_dc_iid[6:0]                    <=  7'b0;
    ld_dc_lsid[LSIQ_ENTRY-1:0]        <=  {LSIQ_ENTRY{1'b0}};
    ld_dc_old                         <=  1'b0;
    ld_dc_bytes_vld[15:0]             <=  16'b0;
    ld_dc_bytes_vld1[15:0]            <=  16'b0;
    ld_dc_rot_sel[3:0]                <=  4'b0;
    ld_dc_boundary                    <=  1'b0;
    ld_dc_preg[6:0]                   <=  7'b0;
    ld_dc_preg_dup1[6:0]              <=  7'b0;
    ld_dc_preg_dup2[6:0]              <=  7'b0;
    ld_dc_preg_dup3[6:0]              <=  7'b0;
    ld_dc_preg_dup4[6:0]              <=  7'b0;
    ld_dc_ldfifo_pc[PC_LEN-1:0]       <=  {PC_LEN{1'b0}};
    ld_dc_ahead_predict               <=  1'b0;
    ld_dc_page_so                     <=  1'b0;
    ld_dc_page_ca                     <=  1'b0;
    ld_dc_page_buf                    <=  1'b0;
    ld_dc_page_sec                    <=  1'b0;
    ld_dc_page_share                  <=  1'b0;
    ld_dc_utlb_miss                   <=  1'b0;
    ld_dc_tlb_busy                    <=  1'b0;
    ld_dc_vreg[5:0]                   <=  6'b0;
    ld_dc_vreg_dup1[5:0]              <=  6'b0;
    ld_dc_vreg_dup2[5:0]              <=  6'b0;
    ld_dc_vreg_dup3[5:0]              <=  6'b0;
    ld_dc_inst_vfls                   <=  1'b0;
    ld_dc_acclr_en                    <=  1'b0;
    ld_dc_fwd_bypass_en               <=  1'b0;
    ld_dc_no_spec                     <=  1'b0;
    ld_dc_no_spec_exist               <=  1'b0;
    ld_dc_raw_new                     <=  1'b0;
  end
  else if(ld_ag_inst_vld)
  begin
    ld_dc_expt_vld_except_access_err  <=  ld_ag_expt_vld;
    ld_dc_pf_inst                     <=  ld_ag_pf_inst;
    ld_dc_vpn[27:0]                   <=  ld_ag_vpn[27:0];
    ld_dc_addr1_tto4[`PA_WIDTH-5:0]   <=  ld_ag_addr1_to4[`PA_WIDTH-5:0];
    ld_dc_split                       <=  ld_ag_split;
    ld_dc_inst_type[1:0]              <=  ld_ag_inst_type[1:0];
    ld_dc_inst_size[2:0]              <=  ld_ag_dc_access_size[2:0];
    ld_dc_secd                        <=  ld_ag_secd;
    ld_dc_already_da                  <=  ld_ag_already_da;
    ld_dc_lsiq_spec_fail              <=  ld_ag_lsiq_spec_fail;
    ld_dc_lsiq_bkpta_data             <=  ld_ag_lsiq_bkpta_data;
    ld_dc_lsiq_bkptb_data             <=  ld_ag_lsiq_bkptb_data;
    ld_dc_sign_extend                 <=  ld_ag_sign_extend;
    ld_dc_atomic                      <=  ld_ag_atomic;
    ld_dc_iid[6:0]                    <=  ld_ag_iid[6:0];
    ld_dc_lsid[LSIQ_ENTRY-1:0]        <=  ld_ag_lsid[LSIQ_ENTRY-1:0];
    ld_dc_old                         <=  ld_ag_old;
    ld_dc_bytes_vld[15:0]             <=  ld_ag_dc_bytes_vld[15:0];
    ld_dc_bytes_vld1[15:0]            <=  ld_ag_dc_bytes_vld1[15:0];
    ld_dc_rot_sel[3:0]                <=  ld_ag_dc_rot_sel[3:0];
    ld_dc_boundary                    <=  ld_ag_boundary;
    ld_dc_preg[6:0]                   <=  ld_ag_preg[6:0];
    ld_dc_preg_dup1[6:0]              <=  ld_ag_preg[6:0];
    ld_dc_preg_dup2[6:0]              <=  ld_ag_preg[6:0];
    ld_dc_preg_dup3[6:0]              <=  ld_ag_preg[6:0];
    ld_dc_preg_dup4[6:0]              <=  ld_ag_preg[6:0];
    ld_dc_ldfifo_pc[PC_LEN-1:0]       <=  ld_ag_ldfifo_pc[PC_LEN-1:0];
    ld_dc_ahead_predict               <=  ld_ag_ahead_predict;
    ld_dc_page_so                     <=  ld_ag_page_so;
    ld_dc_page_ca                     <=  ld_ag_page_ca;
    ld_dc_page_buf                    <=  ld_ag_page_buf;
    ld_dc_page_sec                    <=  ld_ag_page_sec;
    ld_dc_page_share                  <=  ld_ag_page_share;
    ld_dc_utlb_miss                   <=  ld_ag_utlb_miss;
    ld_dc_tlb_busy                    <=  mmu_lsu_tlb_busy;
    ld_dc_vreg[5:0]                   <=  ld_ag_vreg[5:0];
    ld_dc_vreg_dup1[5:0]              <=  ld_ag_vreg[5:0];
    ld_dc_vreg_dup2[5:0]              <=  ld_ag_vreg[5:0];
    ld_dc_vreg_dup3[5:0]              <=  ld_ag_vreg[5:0];
    ld_dc_inst_vfls                   <=  ld_ag_inst_vfls;
    ld_dc_acclr_en                    <=  ld_ag_dc_acclr_en;
    ld_dc_fwd_bypass_en               <=  ld_ag_dc_fwd_bypass_en;
    ld_dc_no_spec                     <=  ld_ag_no_spec;
    ld_dc_no_spec_exist               <=  ld_ag_no_spec_exist;
    ld_dc_raw_new                     <=  ld_ag_raw_new;
  end
end

//------------------inst/borrow share part------------------
//+-------+
//| addr0 |
//+-------+
// &Force("output","ld_dc_addr0"); @437
always @(posedge ld_dc_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    ld_dc_addr0[`PA_WIDTH-1:0]     <=  {`PA_WIDTH{1'b0}};
  end
  else if(ld_ag_inst_vld  ||  dcache_arb_ld_dc_borrow_vld)
  begin
    ld_dc_addr0[`PA_WIDTH-1:0]     <=  ld_ag_dc_addr0[`PA_WIDTH-1:0];
  end
end

//==========================================================
//        Generate  va
//==========================================================
assign ld_dc_va[`PA_WIDTH-1:12] = ld_dc_vpn[`PA_WIDTH-13:0];
assign ld_dc_va[11:4]           = ld_dc_addr0[11:4];
assign ld_dc_va[3:0]            = (ld_dc_boundary
                                      &&  !ld_dc_secd
                                      &&  !ld_dc_expt_misalign_no_page)
                                  ? 4'b0
                                  : ld_dc_addr0[3:0];
assign ld_dc_addr1_11to4[7:0]   = ld_dc_addr1_tto4[7:0];
// for preload addr check
assign ld_dc_pfu_va_11to4[7:0]      = ld_dc_boundary  &&  !ld_dc_secd
                                      ? ld_dc_addr1_11to4[7:0]
                                      : ld_dc_addr0[11:4];
//if this inst cross 4k, this va is not accurate
assign ld_dc_pfu_va[`PA_WIDTH-1:0]  = {ld_dc_vpn[`PA_WIDTH-13:0],
                                      ld_dc_pfu_va_11to4[7:0],
                                      ld_dc_addr0[3:0]};

//==========================================================
//        Exception generate
//==========================================================
assign ld_dc_expt_access_fault_mask = ld_dc_expt_misalign_no_page
                                      ||  ld_dc_expt_page_fault;

assign ld_dc_expt_access_fault_extra  = ld_dc_mmu_req
                                        &&  ld_dc_expt_ldamo_not_ca;

assign ld_dc_expt_access_fault_short  = ld_dc_mmu_req;
//if utlb_miss and dmmu expt,
//then st_dc_expt_vld_except_access_err is 0,
//but st_dc_da_expt_vld is not certain

assign ld_dc_da_expt_vld_gate_en  = ld_dc_expt_vld_except_access_err
                                    ||  ld_dc_expt_access_fault_short;

// &CombBeg; @487
always @( ld_dc_atomic
       or ld_dc_expt_access_fault_with_page
       or ld_dc_va[39:0]
       or ld_dc_expt_misalign_with_page
       or ld_dc_addr1_tto4[35:0]
       or ld_dc_expt_misalign_no_page
       or ld_dc_expt_page_fault)
begin
ld_dc_expt_vec[4:0] = 5'b0;
ld_dc_mt_value[`PA_WIDTH-1:0] = {`PA_WIDTH{1'b0}};
if(ld_dc_expt_misalign_no_page  && !ld_dc_atomic)
begin
  ld_dc_expt_vec[4:0]   = 5'd4;
  ld_dc_mt_value[`PA_WIDTH-1:0]  = {ld_dc_addr1_tto4[`PA_WIDTH-5:0],ld_dc_va[3:0]};
end
else if(ld_dc_expt_misalign_no_page && ld_dc_atomic)
begin
  ld_dc_expt_vec[4:0]   = 5'd6;
  ld_dc_mt_value[`PA_WIDTH-1:0]  = ld_dc_va[`PA_WIDTH-1:0];
end
else if(ld_dc_expt_page_fault &&  !ld_dc_atomic)
begin
  ld_dc_expt_vec[4:0]   = 5'd13;
  ld_dc_mt_value[`PA_WIDTH-1:0]  = ld_dc_va[`PA_WIDTH-1:0];
end
else if(ld_dc_expt_page_fault &&  ld_dc_atomic)
begin
  ld_dc_expt_vec[4:0]   = 5'd15;
  ld_dc_mt_value[`PA_WIDTH-1:0]  = ld_dc_va[`PA_WIDTH-1:0];
end
else if(ld_dc_expt_misalign_with_page)
begin
  ld_dc_expt_vec[4:0]   = 5'd4;
  ld_dc_mt_value[`PA_WIDTH-1:0]  = ld_dc_va[`PA_WIDTH-1:0];
end
else if(ld_dc_expt_access_fault_with_page)
begin
  ld_dc_expt_vec[4:0]   = 5'd5;
  ld_dc_mt_value[`PA_WIDTH-1:0]  = {`PA_WIDTH{1'b0}};
end
// &CombEnd @520
end

//==========================================================
//        Generate inst type
//==========================================================
// &Force("output","ld_dc_vector_nop"); @525
assign ld_dc_vector_nop = 1'b0;
assign ld_dc_ld_inst    = !ld_dc_atomic
                          &&  (ld_dc_inst_type[1:0]  == 2'b00);

//==========================================================
//                 Create load queue
//==========================================================
//lq_create_vld is not accurate, comparing iid is a must precedure to create lq
// &Force("output","ld_dc_lq_create_vld"); @540
// &Force("output","ld_dc_lq_create1_vld"); @541
// &Force("output","ld_dc_lq_create_dp_vld"); @542
// &Force("output","ld_dc_lq_create1_dp_vld"); @543
//to reduce spec fail, create lq should be more strict

//for timing, create lq do not see access deny
assign ld_dc_lq_create_vld          = ld_dc_lq_create_dp_vld
                                      &&  !ld_dc_depd_imme_restart_req
                                      &&  !sq_ld_dc_addr1_dep_discard;

assign ld_dc_lq_create1_vld         = ld_dc_lq_create1_dp_vld
                                      &&  !ld_dc_depd_imme_restart_req
                                      && cb_ld_dc_addr_hit
                                      && !sq_ld_dc_addr1_dep_discard;

assign ld_dc_lq_create_dp_vld       = ld_dc_inst_vld
                                      &&  ld_dc_ld_inst
                                      &&  !ld_dc_vector_nop
                                      &&  !ld_dc_old
                                      &&  !ld_dc_page_so
                                      &&  !ld_dc_utlb_miss
                                      &&  !lq_ld_dc_inst_hit
                                      &&  !ld_dc_expt_vld_except_access_err;

assign ld_dc_lq_create1_dp_vld      = ld_dc_lq_create_dp_vld 
                                      && ld_dc_acclr_en;
 
// &Force("output","ld_dc_lq_create_gateclk_en"); @568
assign ld_dc_lq_create_gateclk_en   = ld_dc_inst_vld
                                      &&  ld_dc_ld_inst
                                      &&  !ld_dc_old
                                      &&  !ld_dc_page_so
                                      &&  !ld_dc_utlb_miss
                                      &&  !ld_dc_expt_vld_except_access_err;
assign ld_dc_lq_create1_gateclk_en  = ld_dc_lq_create_gateclk_en
                                      &&  ld_dc_acclr_en;

// &Force("output","ld_dc_addr1"); @578
assign ld_dc_addr1[`PA_WIDTH-1:0]   = {ld_dc_addr0[`PA_WIDTH-1:12],ld_dc_addr1_11to4[7:0],4'b0};
//==========================================================
//                 Generate check signal to lq/sq/wmb
//==========================================================
// &Force("output","ld_dc_chk_ld_inst_vld"); @583
assign ld_dc_chk_ld_inst_vld      = ld_dc_inst_vld
                                    &&  ld_dc_ld_inst
                                    &&  !ld_dc_expt_vld_except_access_err
                                    &&  !ld_dc_utlb_miss
                                    &&  !ld_dc_page_so;

assign ld_dc_chk_ld_bypass_vld    = ld_dc_chk_ld_inst_vld
                                    &&  ld_dc_fwd_bypass_en;

assign ld_dc_chk_ld_addr1_vld     = ld_dc_inst_vld
                                    &&  ld_dc_ld_inst
                                    &&  !ld_dc_expt_vld_except_access_err
                                    &&  !ld_dc_utlb_miss
                                    &&  !ld_dc_page_so
                                    &&  ld_dc_acclr_en;

assign ld_dc_chk_atomic_inst_vld  = ld_dc_inst_vld
                                    &&  !ld_dc_vector_nop
                                    &&  ld_dc_atomic
                                    &&  !ld_dc_utlb_miss
                                    &&  !ld_dc_expt_vld_except_access_err;

//==========================================================
//                 RAW speculation check
//==========================================================
// st_dc stage should check raw speculation for ld_dc stage

// situat st pipe             ld pipe           addr      bytes_vld
// ----------------------------------------------------------------
// 2      st/stex             ld                31:4       x

// &Force("output","ld_dc_inst_chk_vld"); @615
assign ld_dc_inst_chk_vld       = ld_dc_inst_vld
                                  &&  ld_dc_ld_inst
                                  &&  !ld_dc_expt_vld_except_access_err
                                  &&  !ld_dc_utlb_miss
                                  &&  !ld_dc_page_so;
//------------------compare signal--------------------------
//-----------iid compare----------------
//compare the instruction in the entry is newer or older
//&Instance("ct_rtu_compare_iid","x_lsu_ld_dc_compare_st_dc_iid");
// //&Connect( .x_iid0         (st_dc_iid[6:0]         ), @625
// //          .x_iid1         (ld_dc_iid[6:0]         ), @626
// //          .x_iid0_older   (ld_dc_raw_new          )); @627

//-----------addr compare---------------
//addr0 compare
assign ld_dc_cmp_st_dc_addr0[`PA_WIDTH-1:0] = st_dc_addr0[`PA_WIDTH-1:0];
assign ld_dc_raw_addr_tto4_hit    = ld_dc_addr0[`PA_WIDTH-1:4]
                                    ==  ld_dc_cmp_st_dc_addr0[`PA_WIDTH-1:4];

// for cache buffer
assign ld_dc_raw_addr1_tto4_hit   = ld_dc_addr1[`PA_WIDTH-1:4]
                                    ==  ld_dc_cmp_st_dc_addr0[`PA_WIDTH-1:4];
//-----------bytes_vld compare----------
assign ld_dc_raw_do_hit     = |(ld_dc_bytes_vld[15:0]  & st_dc_bytes_vld[15:0]);

//------------------situation 2-----------------------------
assign ld_dc_depd_st_dc2    = ld_dc_inst_chk_vld
                              &&  ld_dc_raw_new
                              &&  (st_dc_chk_st_inst_vld
                                  ||  st_dc_chk_statomic_inst_vld)
                              &&  ld_dc_raw_addr_tto4_hit
                              &&  ld_dc_raw_do_hit;
//------------------situation 3-----------------------------
// when ld addr hit st, then do not get data from merge buffer
assign ld_dc_depd_st_dc3    = ld_dc_inst_chk_vld
                              &&  ld_dc_raw_new
                              &&  st_dc_inst_vld
                              &&  ld_dc_raw_addr1_tto4_hit;

//------------------combine---------------------------------
assign ld_dc_depd_st_dc     = ld_dc_depd_st_dc2;

//==========================================================
//                 Dependency check
//==========================================================
// dependency check is done in sq/wmb entry file
//------------------arbitrate-------------------------------
//-----------forward arbitrate----------
//bypass: pass data from ex1
//fwd: pass data from sq/wmb
//if ld_dc_fwd_sq_bypass_vld=1, and ld_dc_fwd_sq_vld=1,
//then see as multi depd in da
assign ld_dc_fwd_sq_vld         = sq_ld_dc_fwd_req;
// &Force("output","ld_dc_fwd_wmb_vld"); @669
assign ld_dc_fwd_wmb_vld        = !sq_ld_dc_has_fwd_req
                                   &&  wmb_ld_dc_fwd_req;

// &CombBeg; @673
always @( wmb_ld_dc_fwd_req
       or wmb_fwd_bytes_vld[15:0]
       or sq_ld_dc_has_fwd_req)
begin
case({sq_ld_dc_has_fwd_req,wmb_ld_dc_fwd_req})
  2'b11:ld_dc_fwd_bytes_vld[15:0] = 16'hffff;
  2'b10:ld_dc_fwd_bytes_vld[15:0] = 16'hffff;
  2'b01:ld_dc_fwd_bytes_vld[15:0] = wmb_fwd_bytes_vld[15:0];
  2'b00:ld_dc_fwd_bytes_vld[15:0] = 16'h0;
  default:ld_dc_fwd_bytes_vld[15:0] = {16{1'bx}};
endcase
// &CombEnd; @681
end

//==========================================================
//                 Restart signal
//==========================================================
//-----------arbiter----------------------------------------
//prioritize:
//1. utlb_miss(include tlb_busy)
//2. depd st_dc/sq imme restart
//3. lq_full
//
//for timing, discard to da stage

//for timing, use create_dp signal to replay
assign ld_dc_lq_full_req      = ld_dc_lq_create_dp_vld && lq_ld_dc_full
                                || ld_dc_lq_create1_dp_vld && lq_ld_dc_less2;

assign ld_dc_depd_imme_restart_req  = ld_dc_depd_st_dc;

assign ld_dc_utlb_miss_vld    = ld_dc_inst_vld
                                &&  !ld_dc_expt_vld_except_access_err
                                &&  ld_dc_utlb_miss;

assign ld_dc_depd_imme_restart_vld  = !ld_dc_utlb_miss_vld
                                      &&  ld_dc_depd_imme_restart_req;

assign ld_dc_lq_full_vld        = ld_dc_lq_full_req
                                  &&  !ld_dc_depd_imme_restart_req
                                  &&  !ld_dc_utlb_miss_vld;

assign ld_dc_lq_full_gateclk_en = ld_dc_lq_create_gateclk_en
                                  &&  lq_ld_dc_less2;

assign ld_dc_restart_vld        = ld_dc_lq_full_req
                                  ||  ld_dc_depd_imme_restart_req
                                  ||  ld_dc_utlb_miss_vld;

//---------------------restart kinds------------------------
assign ld_dc_imme_restart_vld = ld_dc_utlb_miss_vld
                                    &&  !ld_dc_tlb_busy
                                ||  ld_dc_depd_imme_restart_vld;

assign ld_dc_tlb_busy_restart_vld = ld_dc_utlb_miss_vld
                                    &&  ld_dc_tlb_busy;

assign ld_dc_tlb_busy_gateclk_en  = ld_dc_tlb_busy_restart_vld;

//==========================================================
//                Generage had signal
//==========================================================
assign ld_dc_had_bkpta_addr[`PA_WIDTH-1:`VA_WIDTH]  = mmu_lsu_mmu_en
                ? {`PA_WIDTH-`VA_WIDTH{had_yy_xx_bkpta_base[`VA_WIDTH-1]}}
                : had_yy_xx_bkpta_base[`PA_WIDTH-1:`VA_WIDTH];

assign ld_dc_had_bkpta_addr[`VA_WIDTH-1:0] = {had_yy_xx_bkpta_base[`VA_WIDTH-1:8],
                                    had_yy_xx_bkpta_base[7:0]
                                    & had_yy_xx_bkpta_mask[7:0]};

assign ld_dc_had_bkptb_addr[`PA_WIDTH-1:`VA_WIDTH]  = mmu_lsu_mmu_en
                ? {`PA_WIDTH-`VA_WIDTH{had_yy_xx_bkptb_base[`VA_WIDTH-1]}}
                : had_yy_xx_bkptb_base[`PA_WIDTH-1:`VA_WIDTH];

assign ld_dc_had_bkptb_addr[`VA_WIDTH-1:0] = {had_yy_xx_bkptb_base[`VA_WIDTH-1:8],
                                    had_yy_xx_bkptb_base[7:0]
                                    & had_yy_xx_bkptb_mask[7:0]};

assign ld_dc_bkpta_addr_tto12[`PA_WIDTH-13:0]     = ld_dc_va[`PA_WIDTH-1:12];
assign ld_dc_bkpta_addr0_3to0[3:0]                = ld_dc_va[3:0] & had_yy_xx_bkpta_mask[3:0];
assign ld_dc_bkpta_addr1_3to0[3:0]                = ld_dc_addr0[3:0] & had_yy_xx_bkpta_mask[3:0];
assign ld_dc_bkpta_addr0_11to4[7:0]               = {ld_dc_va[11:8],
                                                     ld_dc_va[7:4] & had_yy_xx_bkpta_mask[7:4]};
assign ld_dc_bkpta_addr1_11to4[7:0]               = {ld_dc_addr1_11to4[7:4],
                                                     ld_dc_addr1_11to4[3:0] & had_yy_xx_bkpta_mask[7:4]};

assign ld_dc_bkptb_addr_tto12[`PA_WIDTH-13:0]     = ld_dc_va[`PA_WIDTH-1:12];
assign ld_dc_bkptb_addr0_3to0[3:0]                = ld_dc_va[3:0] & had_yy_xx_bkptb_mask[3:0];
assign ld_dc_bkptb_addr1_3to0[3:0]                = ld_dc_addr0[3:0] & had_yy_xx_bkptb_mask[3:0];
assign ld_dc_bkptb_addr0_11to4[7:0]               = {ld_dc_va[11:8],
                                                     ld_dc_va[7:4] & had_yy_xx_bkptb_mask[7:4]};
assign ld_dc_bkptb_addr1_11to4[7:0]               = {ld_dc_addr1_11to4[7:4],
                                                     ld_dc_addr1_11to4[3:0] & had_yy_xx_bkptb_mask[7:4]};


assign ld_dc_bkpta_trap           = had_yy_xx_bkpta_rc
                                    ^ ((ld_dc_had_bkpta_addr[`PA_WIDTH-1:12] ==  ld_dc_bkpta_addr_tto12[`PA_WIDTH-13:0])
                                       && ((ld_dc_had_bkpta_addr[11:4] ==  ld_dc_bkpta_addr0_11to4[7:0])
                                              && (ld_dc_had_bkpta_addr[3:0] ==  ld_dc_bkpta_addr0_3to0[3:0])
                                           || (ld_dc_had_bkpta_addr[11:4] ==  ld_dc_bkpta_addr1_11to4[7:0])
                                              && (ld_dc_had_bkpta_addr[3:0] ==  ld_dc_bkpta_addr1_3to0[3:0])
                                              && |ld_dc_bytes_vld1[15:0]
                                              && ld_dc_acclr_en)); 

assign ld_dc_bkptb_trap           = had_yy_xx_bkptb_rc
                                    ^ ((ld_dc_had_bkptb_addr[`PA_WIDTH-1:12] ==  ld_dc_bkptb_addr_tto12[`PA_WIDTH-13:0])
                                       && ((ld_dc_had_bkptb_addr[11:4] ==  ld_dc_bkptb_addr0_11to4[7:0])
                                              && (ld_dc_had_bkptb_addr[3:0] ==  ld_dc_bkptb_addr0_3to0[3:0])
                                           || (ld_dc_had_bkptb_addr[11:4] ==  ld_dc_bkptb_addr1_11to4[7:0])
                                              && (ld_dc_had_bkptb_addr[3:0] ==  ld_dc_bkptb_addr1_3to0[3:0])
                                              && |ld_dc_bytes_vld1[15:0]
                                              && ld_dc_acclr_en)); 


assign ld_dc_pipe_bkpta_data      = (ld_dc_ld_inst
                                        ||  ld_dc_atomic)
                                    &&  !ld_dc_vector_nop
                                    &&  ld_dc_bkpta_trap;
assign ld_dc_pipe_bkptb_data      = (ld_dc_ld_inst
                                        ||  ld_dc_atomic)
                                    &&  !ld_dc_vector_nop
                                    &&  ld_dc_bkptb_trap;

//==========================================================
//        Combine signal of spec_fail/bkpt
//==========================================================
assign ld_dc_spec_fail            = lq_ld_dc_spec_fail
                                    ||  ld_dc_lsiq_spec_fail;

assign ld_dc_bkpta_data           = ld_dc_lsiq_bkpta_data
                                    ||  ld_dc_pipe_bkpta_data;

assign ld_dc_bkptb_data           = ld_dc_lsiq_bkptb_data
                                    ||  ld_dc_pipe_bkptb_data;

//==========================================================
//            Generage get dcache signal
//==========================================================
//this data_bias_sel is for wmb/dcache
// //&Force("output","ld_dc_data_bias_sel"); @808
// //&Force("bus","ld_dc_data_bias_sel",3,0); @809

// &CombBeg; @811
always @( ld_dc_addr0[3:2]
       or mmu_lsu_data_req_size)
begin
case({mmu_lsu_data_req_size,ld_dc_addr0[3:2]})
  3'b000:mmu_bytes_vld[15:0]  = 16'h000f;
  3'b001:mmu_bytes_vld[15:0]  = 16'h00f0;
  3'b010:mmu_bytes_vld[15:0]  = 16'h0f00;
  3'b011:mmu_bytes_vld[15:0]  = 16'hf000;
  3'b100:mmu_bytes_vld[15:0]  = 16'h00ff;
  3'b110:mmu_bytes_vld[15:0]  = 16'hff00;
  default:mmu_bytes_vld[15:0]  = 16'h0;
endcase
// &CombEnd; @821
end

assign ld_dc_da_bytes_vld[15:0] = ld_dc_borrow_mmu_vld ? mmu_bytes_vld[15:0]
                                                       : ld_dc_bytes_vld[15:0];
assign ld_dc_da_bytes_vld1[15:0] = ld_dc_bytes_vld1[15:0];

assign ld_dc_data_bias_sel[0] = |ld_dc_da_bytes_vld[3:0];
assign ld_dc_data_bias_sel[1] = |ld_dc_da_bytes_vld[7:4];
assign ld_dc_data_bias_sel[2] = |ld_dc_da_bytes_vld[11:8];
assign ld_dc_data_bias_sel[3] = |ld_dc_da_bytes_vld[15:12];

//if deform/mmu double word, then open 2 groups of banks
assign ld_dc_dup_dcache_data_en = ld_dc_inst_vld 
                                  || ld_dc_borrow_mmu_vld;

assign ld_dc_get_dcache_data_inst_mmu[3:0]  =  {4{ld_dc_dup_dcache_data_en}}
                                                & ld_dc_data_bias_sel[3:0];
// &Force("output","ld_dc_borrow_wmb"); @839
assign ld_dc_get_dcache_data_all  = ld_dc_borrow_vld
                                    &&  !ld_dc_borrow_mmu;

assign ld_dc_get_dcache_data[3:0] = (ld_dc_get_dcache_data_all 
                                    || ld_dc_acclr_en && ld_dc_inst_vld)
                                    ? 4'b1111
                                    : ld_dc_get_dcache_data_inst_mmu[3:0];

//==========================================================
//            Generage to DA stage signal
//==========================================================
assign ld_dc_da_inst_vld          = ld_dc_inst_vld
                                    &&  !ld_dc_restart_vld;
//------------------page info sel if mmu req----------------
// &Force("output","ld_dc_da_page_ca"); @866
assign ld_dc_borrow_mmu_vld       = ld_dc_borrow_vld  &&  ld_dc_borrow_mmu;
assign ld_dc_da_page_so           = ld_dc_borrow_vld  ? 1'b0
                                                      : ld_dc_page_so;
assign ld_dc_da_page_ca           = ld_dc_borrow_vld  ? 1'b1
                                                      : ld_dc_page_ca;
assign ld_dc_da_page_buf          = ld_dc_borrow_vld  ? 1'b1
                                                      : ld_dc_page_buf;
assign ld_dc_da_page_sec          = ld_dc_borrow_vld  ? 1'b0
                                                      : ld_dc_page_sec;
assign ld_dc_da_page_share        = ld_dc_borrow_vld  ? 1'b1
                                                      : ld_dc_page_share;
//------------------regard mmu request as old---------------
//because the old inst may cause tlb refill
assign ld_dc_da_old               = ld_dc_borrow_mmu_vld  ? 1'b1
                                                          : ld_dc_old;
//------------------dcache tag pre_compare----------------
assign ld_dc_dcache_tag_array[53:0]  = dcache_lsu_ld_tag_dout[53:0];

assign ld_dc_way0_tag_hit   = (ld_dc_addr0[`PA_WIDTH-1:14] == ld_dc_dcache_tag_array[25:0]);

assign ld_dc_way1_tag_hit   = (ld_dc_addr0[`PA_WIDTH-1:14] == ld_dc_dcache_tag_array[52:27]);

assign ld_dc_dcache_valid0  = ld_dc_dcache_tag_array[26]
                              &&  cp0_lsu_dcache_en
                              &&  ld_dc_da_page_ca;
// &Force("output","ld_dc_hit_way0"); @922
assign ld_dc_dcache_valid1  = ld_dc_dcache_tag_array[53]
                              &&  cp0_lsu_dcache_en
                              &&  ld_dc_da_page_ca;

assign ld_dc_hit_way0       = ld_dc_dcache_valid0
                              &&  ld_dc_way0_tag_hit; 
assign ld_dc_hit_way1       = ld_dc_dcache_valid1
                              &&  ld_dc_way1_tag_hit; 

// &Force("output","ld_dc_dcache_hit"); @937
assign ld_dc_dcache_hit     = ld_dc_hit_way0  ||  ld_dc_hit_way1;
assign ld_dc_hit_low_region = ld_dc_addr0[4]
                              ? ld_dc_hit_way1
                              : ld_dc_hit_way0;
assign ld_dc_hit_high_region= ld_dc_addr0[4]
                              ? ld_dc_hit_way0
                              : ld_dc_hit_way1;
//------------------icc read tag info----------------
assign ld_dc_da_icc_tag_vld  = ld_dc_borrow_vld
                               && ld_dc_borrow_icc
                               && ld_dc_borrow_icc_tag;
assign ld_dc_da_tag_read[26:0] = ld_dc_settle_way
                                 ? dcache_lsu_ld_tag_dout[53:27]
                                 : dcache_lsu_ld_tag_dout[26:0];
//------------------data pre_select----------------
//for mmu select
assign mmu_rot_sel[3:0]   = mmu_lsu_data_req_size
                            ? {ld_dc_addr0[3],3'b0}
                            : {ld_dc_addr0[3:2],2'b0};

assign ld_dc_rot_sel_final[3:0] = ld_dc_borrow_mmu_vld
                                   ? mmu_rot_sel[3:0]
                                   : ld_dc_rot_sel[3:0]; 

// &CombBeg;    @969
// &CombEnd; @989
// &CombBeg;    @991
always @( ld_dc_rot_sel_final[2:0])
begin
casez(ld_dc_rot_sel_final[2:0])
  3'h0:ld_dc_da_data_rot_sel[7:0]  = 8'b00000001;
  3'h1:ld_dc_da_data_rot_sel[7:0]  = 8'b00000010;
  3'h2:ld_dc_da_data_rot_sel[7:0]  = 8'b00000100;
  3'h3:ld_dc_da_data_rot_sel[7:0]  = 8'b00001000;
  3'h4:ld_dc_da_data_rot_sel[7:0]  = 8'b00010000;
  3'h5:ld_dc_da_data_rot_sel[7:0]  = 8'b00100000;
  3'h6:ld_dc_da_data_rot_sel[7:0]  = 8'b01000000;
  3'h7:ld_dc_da_data_rot_sel[7:0]  = 8'b10000000;
  default:ld_dc_da_data_rot_sel[7:0]  = {8{1'bx}};
endcase
// &CombEnd; @1003
end

//----------sign_sel--------------------
//3: word sign extend
//2: half sign extend
//1: byte sign extend
//0: not extend
// &CombBeg; @1011
always @( ld_dc_sign_extend
       or ld_dc_inst_size[1:0])
begin
case({ld_dc_sign_extend,ld_dc_inst_size[1:0]})
  {1'b1,BYTE}:ld_dc_preg_sign_sel[3:0] = 4'b0010;
  {1'b1,HALF}:ld_dc_preg_sign_sel[3:0] = 4'b0100;
  {1'b1,WORD}:ld_dc_preg_sign_sel[3:0] = 4'b1000;
  default:ld_dc_preg_sign_sel[3:0] = 4'b0001;
endcase
// &CombEnd; @1018
end

// &Force("output","ld_dc_inst_vls"); @1021
assign ld_dc_vreg_sign_sel  = (ld_dc_inst_size[1:0]  !=  2'b11);//not dword
assign ld_dc_inst_vls       = 1'b0;
assign ld_dc_inst_vls_dup1  = 1'b0;
assign ld_dc_inst_vls_dup2  = 1'b0;
assign ld_dc_inst_vls_dup3  = 1'b0;

// &Force("output","ld_dc_element_cnt"); @1034
// &Force("output","ld_dc_element_size"); @1035
// &Force("output","ld_dc_vsew"); @1036
// &CombBeg;    @1038
// &CombEnd; @1058
// &CombBeg; @1060
// &CombEnd; @1068
// &CombBeg; @1072
// &CombEnd; @1079
// &CombBeg; @1090
// &CombEnd; @1098
//==========================================================
//            Generage pfu signal
//==========================================================
// &Force("output","ld_dc_da_pf_inst"); @1106
assign ld_dc_da_pf_inst       = ld_dc_pf_inst
                                &&  !ld_dc_vector_nop
                                &&  ld_dc_page_ca;

assign ld_dc_pf_inst_short    = ld_dc_pf_inst
                                &&  !ld_dc_vector_nop
                                &&  ld_dc_page_ca
                                &&  !ld_dc_utlb_miss
                                &&  !ld_dc_expt_vld_except_access_err;

assign ld_dc_pfu_info_set_vld = ld_dc_inst_vld
                                &&  ld_dc_pf_inst_short
                                &&  (!pfu_sdb_empty
                                    ||  !pfu_pfb_empty
                                    ||  pfu_sdb_create_gateclk_en);

//==========================================================
//            Generage to cache buffer signal
//==========================================================
//------------------addr prepare----------------
assign ld_dc_cb_addr_tto4[`PA_WIDTH-5:0] = ld_dc_addr0[`PA_WIDTH-1:4];

// &Force("bus","dcache_idx","8","0"); @1129
assign cb_create_hit_idx   = (ld_dc_addr0[13:6]  ==  dcache_idx[7:0]);
// &Force("output","ld_dc_cb_addr_create_vld"); @1131
assign ld_dc_cb_addr_create_vld = ld_dc_inst_vld
                                  &&  ld_dc_ld_inst
                                  &&  ld_dc_acclr_en
                                  &&  !ld_dc_vector_nop
                                  &&  !ld_dc_expt_vld_except_access_err
                                  &&  !ld_dc_restart_vld
                                  &&  !(lsu_dcache_ld_xx_gwen
                                        && cb_create_hit_idx)
                                  && !rtu_yy_xx_flush;
assign ld_dc_cb_addr_create_gateclk_en  = ld_dc_inst_vld
                                          &&  ld_dc_ld_inst
                                          &&  ld_dc_acclr_en
                                          &&  !ld_dc_expt_vld_except_access_err
                                          &&  !rtu_yy_xx_flush;

assign ld_dc_da_cb_addr_create  = ld_dc_cb_addr_create_vld;
assign ld_dc_da_cb_merge_en     = ld_dc_acclr_en
                                  &&  cb_ld_dc_addr_hit
                                  &&  !ld_dc_vector_nop
                                  &&  !ld_dc_depd_st_dc3
                                  &&  !sq_ld_dc_cancel_acc_req
                                  &&  !wmb_ld_dc_cancel_acc_req
                                  &&  !lq_ld_dc_inst_hit
                                  &&  !ld_dc_expt_vld_except_access_err;

//==========================================================
//              Generate forward write back
//==========================================================
// &Force("output","ld_dc_wait_fence"); @1160
assign ld_dc_wait_fence         = lsu_has_fence
                                  &&  rb_fence_ld;

assign ld_dc_ahead_wb_vld       = ld_dc_inst_vld
                                  &&  !cp0_lsu_da_fwd_dis
                                  &&  ld_dc_page_ca
                                  &&  ld_dc_ld_inst
                                  &&  !ld_dc_expt_vld_except_access_err
                                  &&  !ld_dc_wait_fence
                                  &&  !ld_dc_boundary
                                  &&  ld_dc_dcache_hit;

assign ld_dc_ahead_preg_wb_vld  = ld_dc_ahead_wb_vld
                                  &&  !sq_ld_dc_cancel_ahead_wb
                                  &&  !wmb_ld_dc_discard_req
                                  &&  !ld_dc_inst_vfls;
//assign ld_dc_ahead_vreg_wb_vld  = ld_dc_ahead_wb_vld
//                                  &&  !sq_ld_dc_cancel_ahead_wb
//                                  &&  !wmb_ld_dc_discard_req
//                                  &&  ld_dc_inst_vfls;
assign ld_dc_ahead_vreg_wb_vld = 1'b0;

//==========================================================
//      Generage lsiq signal (renamed in lsu_restart.vp)
//==========================================================
assign ld_dc_mask_lsid[LSIQ_ENTRY-1:0]    = {LSIQ_ENTRY{ld_dc_inst_vld}}
                                            & ld_dc_lsid[LSIQ_ENTRY-1:0];
assign ld_dc_idu_lq_full[LSIQ_ENTRY-1:0]  = {LSIQ_ENTRY{ld_dc_lq_full_vld}}
                                            & ld_dc_mask_lsid[LSIQ_ENTRY-1:0];
assign ld_dc_imme_wakeup[LSIQ_ENTRY-1:0]  = {LSIQ_ENTRY{ld_dc_imme_restart_vld}}
                                            & ld_dc_mask_lsid[LSIQ_ENTRY-1:0];
assign ld_dc_idu_tlb_busy[LSIQ_ENTRY-1:0] = {LSIQ_ENTRY{ld_dc_tlb_busy_restart_vld}}
                                            & ld_dc_mask_lsid[LSIQ_ENTRY-1:0];
                                        
//==========================================================
//                Generage signal to idu
//==========================================================
assign lsu_idu_dc_pipe3_load_inst_vld_dup0     = ld_dc_load_inst_vld_dup0;
assign lsu_idu_dc_pipe3_load_inst_vld_dup1     = ld_dc_load_inst_vld_dup1;
assign lsu_idu_dc_pipe3_load_inst_vld_dup2     = ld_dc_load_inst_vld_dup2;
assign lsu_idu_dc_pipe3_load_inst_vld_dup3     = ld_dc_load_inst_vld_dup3;
assign lsu_idu_dc_pipe3_load_inst_vld_dup4     = ld_dc_load_inst_vld_dup4;
assign lsu_idu_dc_pipe3_load_fwd_inst_vld_dup1 = ld_dc_load_ahead_inst_vld_dup1;
assign lsu_idu_dc_pipe3_load_fwd_inst_vld_dup2 = ld_dc_load_ahead_inst_vld_dup2;
assign lsu_idu_dc_pipe3_load_fwd_inst_vld_dup3 = ld_dc_load_ahead_inst_vld_dup3;
assign lsu_idu_dc_pipe3_load_fwd_inst_vld_dup4 = ld_dc_load_ahead_inst_vld_dup4;
assign lsu_idu_dc_pipe3_preg_dup0[6:0]         = ld_dc_preg[6:0];
assign lsu_idu_dc_pipe3_preg_dup1[6:0]         = ld_dc_preg_dup1[6:0];
assign lsu_idu_dc_pipe3_preg_dup2[6:0]         = ld_dc_preg_dup2[6:0];
assign lsu_idu_dc_pipe3_preg_dup3[6:0]         = ld_dc_preg_dup3[6:0];
assign lsu_idu_dc_pipe3_preg_dup4[6:0]         = ld_dc_preg_dup4[6:0];
assign lsu_idu_dc_pipe3_vload_inst_vld_dup0    = ld_dc_vload_inst_vld_dup0; 
assign lsu_idu_dc_pipe3_vload_inst_vld_dup1    = ld_dc_vload_inst_vld_dup1; 
assign lsu_idu_dc_pipe3_vload_inst_vld_dup2    = ld_dc_vload_inst_vld_dup2; 
assign lsu_idu_dc_pipe3_vload_inst_vld_dup3    = ld_dc_vload_inst_vld_dup3; 
assign lsu_idu_dc_pipe3_vload_fwd_inst_vld     = ld_dc_vload_ahead_inst_vld; 
assign lsu_idu_dc_pipe3_vreg_dup0[6:0]         = {ld_dc_inst_vls,ld_dc_vreg[5:0]};
assign lsu_idu_dc_pipe3_vreg_dup1[6:0]         = {ld_dc_inst_vls_dup1,ld_dc_vreg_dup1[5:0]};
assign lsu_idu_dc_pipe3_vreg_dup2[6:0]         = {ld_dc_inst_vls_dup2,ld_dc_vreg_dup2[5:0]};
assign lsu_idu_dc_pipe3_vreg_dup3[6:0]         = {ld_dc_inst_vls_dup3,ld_dc_vreg_dup3[5:0]};
//==========================================================
//        for mmu power
//==========================================================
assign lsu_mmu_vabuf0[27:0] = ld_dc_vpn[27:0];

// &ModuleEnd; @1234
endmodule


