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

// &ModuleBeg; @37
module ct_lsu_wmb(
  amr_l2_mem_set,
  biu_lsu_b_id,
  biu_lsu_b_resp,
  biu_lsu_b_vld,
  biu_lsu_r_id,
  biu_lsu_r_vld,
  bus_arb_wmb_ar_grnt,
  bus_arb_wmb_aw_grnt,
  bus_arb_wmb_w_grnt,
  cp0_lsu_icg_en,
  cp0_lsu_no_op_req,
  cp0_lsu_wr_burst_dis,
  cp0_yy_clk_en,
  cpurst_b,
  dcache_arb_wmb_ld_grnt,
  dcache_dirty_din,
  dcache_dirty_gwen,
  dcache_dirty_wen,
  dcache_idx,
  dcache_snq_st_sel,
  dcache_tag_din,
  dcache_tag_gwen,
  dcache_tag_wen,
  dcache_vb_snq_gwen,
  forever_cpuclk,
  icc_wmb_write_imme,
  ld_ag_inst_vld,
  ld_da_fwd_ecc_stall,
  ld_da_lsid,
  ld_da_wmb_discard_vld,
  ld_dc_addr0,
  ld_dc_addr1_11to4,
  ld_dc_bytes_vld,
  ld_dc_chk_atomic_inst_vld,
  ld_dc_chk_ld_inst_vld,
  ld_wb_wmb_data_grnt,
  lfb_wmb_read_req_hit_idx,
  lfb_wmb_write_req_hit_idx,
  lm_state_is_amo_lock,
  lm_state_is_ex_wait_lock,
  lm_state_is_idle,
  lsu_had_wmb_ar_pending,
  lsu_had_wmb_aw_pending,
  lsu_had_wmb_create_ptr,
  lsu_had_wmb_data_ptr,
  lsu_had_wmb_entry_vld,
  lsu_had_wmb_read_ptr,
  lsu_had_wmb_w_pending,
  lsu_had_wmb_write_imme,
  lsu_had_wmb_write_ptr,
  pad_yy_icg_scan_en,
  pfu_biu_req_addr,
  rb_biu_req_addr,
  rb_biu_req_unmask,
  rb_wmb_so_pending,
  rtu_lsu_async_flush,
  rtu_yy_xx_flush,
  snq_can_create_snq_uncheck,
  snq_create_addr,
  snq_create_wmb_read_req_hit_idx,
  snq_create_wmb_write_req_hit_idx,
  snq_wmb_read_req_hit_idx,
  snq_wmb_write_req_hit_idx,
  sq_pop_addr,
  sq_pop_priv_mode,
  sq_wmb_merge_req,
  sq_wmb_merge_stall_req,
  sq_wmb_pop_to_ce_dp_req,
  sq_wmb_pop_to_ce_gateclk_en,
  sq_wmb_pop_to_ce_req,
  st_ag_inst_vld,
  st_rf_inst_vld,
  st_wb_wmb_cmplt_grnt,
  vb_wmb_create_grnt,
  vb_wmb_empty,
  vb_wmb_entry_rcl_done,
  vb_wmb_write_req_hit_idx,
  wmb_biu_ar_addr,
  wmb_biu_ar_bar,
  wmb_biu_ar_burst,
  wmb_biu_ar_cache,
  wmb_biu_ar_domain,
  wmb_biu_ar_dp_req,
  wmb_biu_ar_id,
  wmb_biu_ar_len,
  wmb_biu_ar_lock,
  wmb_biu_ar_prot,
  wmb_biu_ar_req,
  wmb_biu_ar_req_gateclk_en,
  wmb_biu_ar_size,
  wmb_biu_ar_snoop,
  wmb_biu_ar_user,
  wmb_biu_aw_addr,
  wmb_biu_aw_bar,
  wmb_biu_aw_burst,
  wmb_biu_aw_cache,
  wmb_biu_aw_domain,
  wmb_biu_aw_dp_req,
  wmb_biu_aw_id,
  wmb_biu_aw_len,
  wmb_biu_aw_lock,
  wmb_biu_aw_prot,
  wmb_biu_aw_req,
  wmb_biu_aw_req_gateclk_en,
  wmb_biu_aw_size,
  wmb_biu_aw_snoop,
  wmb_biu_aw_user,
  wmb_biu_w_data,
  wmb_biu_w_id,
  wmb_biu_w_last,
  wmb_biu_w_req,
  wmb_biu_w_strb,
  wmb_biu_w_vld,
  wmb_biu_w_wns,
  wmb_ce_addr,
  wmb_ce_atomic,
  wmb_ce_bkpta_data,
  wmb_ce_bkptb_data,
  wmb_ce_bytes_vld,
  wmb_ce_bytes_vld_full,
  wmb_ce_create_dp_vld,
  wmb_ce_create_gateclk_en,
  wmb_ce_create_merge,
  wmb_ce_create_merge_ptr,
  wmb_ce_create_same_dcache_line,
  wmb_ce_create_stall,
  wmb_ce_create_vld,
  wmb_ce_create_wmb_data_req,
  wmb_ce_create_wmb_dp_req,
  wmb_ce_create_wmb_gateclk_en,
  wmb_ce_create_wmb_req,
  wmb_ce_data128,
  wmb_ce_data_vld,
  wmb_ce_dcache_inst,
  wmb_ce_fence_mode,
  wmb_ce_hit_sq_pop_dcache_line,
  wmb_ce_icc,
  wmb_ce_iid,
  wmb_ce_inst_flush,
  wmb_ce_inst_mode,
  wmb_ce_inst_size,
  wmb_ce_inst_type,
  wmb_ce_merge_data_addr_hit,
  wmb_ce_merge_data_stall,
  wmb_ce_merge_en,
  wmb_ce_merge_ptr,
  wmb_ce_merge_wmb_req,
  wmb_ce_merge_wmb_wait_not_vld_req,
  wmb_ce_page_buf,
  wmb_ce_page_ca,
  wmb_ce_page_sec,
  wmb_ce_page_share,
  wmb_ce_page_so,
  wmb_ce_page_wa,
  wmb_ce_pop_vld,
  wmb_ce_priv_mode,
  wmb_ce_read_dp_req,
  wmb_ce_same_dcache_line,
  wmb_ce_sc_wb_vld,
  wmb_ce_spec_fail,
  wmb_ce_sync_fence,
  wmb_ce_update_dcache_dirty,
  wmb_ce_update_dcache_share,
  wmb_ce_update_dcache_valid,
  wmb_ce_update_dcache_way,
  wmb_ce_vld,
  wmb_ce_vstart_vld,
  wmb_ce_wb_cmplt_success,
  wmb_ce_wb_data_success,
  wmb_ce_write_biu_dp_req,
  wmb_ce_write_imme,
  wmb_clk,
  wmb_dcache_arb_data_way,
  wmb_dcache_arb_ld_borrow_req,
  wmb_dcache_arb_ld_data_gateclk_en,
  wmb_dcache_arb_ld_data_gwen,
  wmb_dcache_arb_ld_data_high_din,
  wmb_dcache_arb_ld_data_idx,
  wmb_dcache_arb_ld_data_low_din,
  wmb_dcache_arb_ld_data_req,
  wmb_dcache_arb_ld_data_wen,
  wmb_dcache_arb_ld_req,
  wmb_dcache_arb_ld_tag_gateclk_en,
  wmb_dcache_arb_ld_tag_idx,
  wmb_dcache_arb_ld_tag_req,
  wmb_dcache_arb_ld_tag_wen,
  wmb_dcache_arb_st_dirty_din,
  wmb_dcache_arb_st_dirty_gateclk_en,
  wmb_dcache_arb_st_dirty_idx,
  wmb_dcache_arb_st_dirty_req,
  wmb_dcache_arb_st_dirty_wen,
  wmb_dcache_arb_st_req,
  wmb_depd_wakeup,
  wmb_empty,
  wmb_entry_vld,
  wmb_fwd_bytes_vld,
  wmb_has_sync_fence,
  wmb_ld_da_fwd_data,
  wmb_ld_dc_cancel_acc_req,
  wmb_ld_dc_discard_req,
  wmb_ld_dc_fwd_req,
  wmb_ld_wb_data,
  wmb_ld_wb_data_addr,
  wmb_ld_wb_data_iid,
  wmb_ld_wb_data_req,
  wmb_ld_wb_inst_vfls,
  wmb_ld_wb_preg,
  wmb_ld_wb_preg_sign_sel,
  wmb_ld_wb_vreg,
  wmb_ld_wb_vreg_sign_sel,
  wmb_lm_state_clr,
  wmb_no_op,
  wmb_pfu_biu_req_hit_idx,
  wmb_rb_biu_req_hit_idx,
  wmb_rb_so_pending,
  wmb_read_req_addr,
  wmb_snq_depd,
  wmb_snq_depd_remove,
  wmb_sq_pop_grnt,
  wmb_sq_pop_to_ce_grnt,
  wmb_st_wb_bkpta_data,
  wmb_st_wb_bkptb_data,
  wmb_st_wb_cmplt_req,
  wmb_st_wb_iid,
  wmb_st_wb_inst_flush,
  wmb_st_wb_spec_fail,
  wmb_sync_fence_biu_req_success,
  wmb_vb_addr_tto6,
  wmb_vb_create_dp_vld,
  wmb_vb_create_gateclk_en,
  wmb_vb_create_req,
  wmb_vb_create_vld,
  wmb_vb_inv,
  wmb_vb_set_way_mode,
  wmb_write_ptr,
  wmb_write_ptr_encode,
  wmb_write_req_addr,
  wmb_write_req_icc
);

// &Ports; @38
input            amr_l2_mem_set;                              
input   [4  :0]  biu_lsu_b_id;                                
input   [1  :0]  biu_lsu_b_resp;                              
input            biu_lsu_b_vld;                               
input   [4  :0]  biu_lsu_r_id;                                
input            biu_lsu_r_vld;                               
input            bus_arb_wmb_ar_grnt;                         
input            bus_arb_wmb_aw_grnt;                         
input            bus_arb_wmb_w_grnt;                          
input            cp0_lsu_icg_en;                              
input            cp0_lsu_no_op_req;                           
input            cp0_lsu_wr_burst_dis;                        
input            cp0_yy_clk_en;                               
input            cpurst_b;                                    
input            dcache_arb_wmb_ld_grnt;                      
input   [6  :0]  dcache_dirty_din;                            
input            dcache_dirty_gwen;                           
input   [6  :0]  dcache_dirty_wen;                            
input   [8  :0]  dcache_idx;                                  
input            dcache_snq_st_sel;                           
input   [51 :0]  dcache_tag_din;                              
input            dcache_tag_gwen;                             
input   [1  :0]  dcache_tag_wen;                              
input            dcache_vb_snq_gwen;                          
input            forever_cpuclk;                              
input            icc_wmb_write_imme;                          
input            ld_ag_inst_vld;                              
input            ld_da_fwd_ecc_stall;                         
input   [11 :0]  ld_da_lsid;                                  
input            ld_da_wmb_discard_vld;                       
input   [39 :0]  ld_dc_addr0;                                 
input   [7  :0]  ld_dc_addr1_11to4;                           
input   [15 :0]  ld_dc_bytes_vld;                             
input            ld_dc_chk_atomic_inst_vld;                   
input            ld_dc_chk_ld_inst_vld;                       
input            ld_wb_wmb_data_grnt;                         
input            lfb_wmb_read_req_hit_idx;                    
input            lfb_wmb_write_req_hit_idx;                   
input            lm_state_is_amo_lock;                        
input            lm_state_is_ex_wait_lock;                    
input            lm_state_is_idle;                            
input            pad_yy_icg_scan_en;                          
input   [39 :0]  pfu_biu_req_addr;                            
input   [39 :0]  rb_biu_req_addr;                             
input            rb_biu_req_unmask;                           
input            rb_wmb_so_pending;                           
input            rtu_lsu_async_flush;                         
input            rtu_yy_xx_flush;                             
input            snq_can_create_snq_uncheck;                  
input   [39 :0]  snq_create_addr;                             
input            snq_create_wmb_read_req_hit_idx;             
input            snq_create_wmb_write_req_hit_idx;            
input            snq_wmb_read_req_hit_idx;                    
input            snq_wmb_write_req_hit_idx;                   
input   [39 :0]  sq_pop_addr;                                 
input   [1  :0]  sq_pop_priv_mode;                            
input            sq_wmb_merge_req;                            
input            sq_wmb_merge_stall_req;                      
input            sq_wmb_pop_to_ce_dp_req;                     
input            sq_wmb_pop_to_ce_gateclk_en;                 
input            sq_wmb_pop_to_ce_req;                        
input            st_ag_inst_vld;                              
input            st_rf_inst_vld;                              
input            st_wb_wmb_cmplt_grnt;                        
input            vb_wmb_create_grnt;                          
input            vb_wmb_empty;                                
input   [7  :0]  vb_wmb_entry_rcl_done;                       
input            vb_wmb_write_req_hit_idx;                    
input   [39 :0]  wmb_ce_addr;                                 
input            wmb_ce_atomic;                               
input            wmb_ce_bkpta_data;                           
input            wmb_ce_bkptb_data;                           
input   [15 :0]  wmb_ce_bytes_vld;                            
input            wmb_ce_bytes_vld_full;                       
input            wmb_ce_create_wmb_data_req;                  
input            wmb_ce_create_wmb_dp_req;                    
input            wmb_ce_create_wmb_gateclk_en;                
input            wmb_ce_create_wmb_req;                       
input   [127:0]  wmb_ce_data128;                              
input   [3  :0]  wmb_ce_data_vld;                             
input            wmb_ce_dcache_inst;                          
input   [3  :0]  wmb_ce_fence_mode;                           
input            wmb_ce_hit_sq_pop_dcache_line;               
input            wmb_ce_icc;                                  
input   [6  :0]  wmb_ce_iid;                                  
input            wmb_ce_inst_flush;                           
input   [1  :0]  wmb_ce_inst_mode;                            
input   [2  :0]  wmb_ce_inst_size;                            
input   [1  :0]  wmb_ce_inst_type;                            
input            wmb_ce_merge_data_addr_hit;                  
input            wmb_ce_merge_data_stall;                     
input            wmb_ce_merge_en;                             
input   [7  :0]  wmb_ce_merge_ptr;                            
input            wmb_ce_merge_wmb_req;                        
input            wmb_ce_merge_wmb_wait_not_vld_req;           
input            wmb_ce_page_buf;                             
input            wmb_ce_page_ca;                              
input            wmb_ce_page_sec;                             
input            wmb_ce_page_share;                           
input            wmb_ce_page_so;                              
input            wmb_ce_page_wa;                              
input   [1  :0]  wmb_ce_priv_mode;                            
input            wmb_ce_read_dp_req;                          
input   [7  :0]  wmb_ce_same_dcache_line;                     
input            wmb_ce_sc_wb_vld;                            
input            wmb_ce_spec_fail;                            
input            wmb_ce_sync_fence;                           
input            wmb_ce_update_dcache_dirty;                  
input            wmb_ce_update_dcache_share;                  
input            wmb_ce_update_dcache_valid;                  
input            wmb_ce_update_dcache_way;                    
input            wmb_ce_vld;                                  
input            wmb_ce_vstart_vld;                           
input            wmb_ce_wb_cmplt_success;                     
input            wmb_ce_wb_data_success;                      
input            wmb_ce_write_biu_dp_req;                     
input            wmb_ce_write_imme;                           
output           lsu_had_wmb_ar_pending;                      
output           lsu_had_wmb_aw_pending;                      
output  [7  :0]  lsu_had_wmb_create_ptr;                      
output  [7  :0]  lsu_had_wmb_data_ptr;                        
output  [7  :0]  lsu_had_wmb_entry_vld;                       
output  [7  :0]  lsu_had_wmb_read_ptr;                        
output           lsu_had_wmb_w_pending;                       
output           lsu_had_wmb_write_imme;                      
output  [7  :0]  lsu_had_wmb_write_ptr;                       
output  [39 :0]  wmb_biu_ar_addr;                             
output  [1  :0]  wmb_biu_ar_bar;                              
output  [1  :0]  wmb_biu_ar_burst;                            
output  [3  :0]  wmb_biu_ar_cache;                            
output  [1  :0]  wmb_biu_ar_domain;                           
output           wmb_biu_ar_dp_req;                           
output  [4  :0]  wmb_biu_ar_id;                               
output  [1  :0]  wmb_biu_ar_len;                              
output           wmb_biu_ar_lock;                             
output  [2  :0]  wmb_biu_ar_prot;                             
output           wmb_biu_ar_req;                              
output           wmb_biu_ar_req_gateclk_en;                   
output  [2  :0]  wmb_biu_ar_size;                             
output  [3  :0]  wmb_biu_ar_snoop;                            
output  [2  :0]  wmb_biu_ar_user;                             
output  [39 :0]  wmb_biu_aw_addr;                             
output  [1  :0]  wmb_biu_aw_bar;                              
output  [1  :0]  wmb_biu_aw_burst;                            
output  [3  :0]  wmb_biu_aw_cache;                            
output  [1  :0]  wmb_biu_aw_domain;                           
output           wmb_biu_aw_dp_req;                           
output  [4  :0]  wmb_biu_aw_id;                               
output  [1  :0]  wmb_biu_aw_len;                              
output           wmb_biu_aw_lock;                             
output  [2  :0]  wmb_biu_aw_prot;                             
output           wmb_biu_aw_req;                              
output           wmb_biu_aw_req_gateclk_en;                   
output  [2  :0]  wmb_biu_aw_size;                             
output  [2  :0]  wmb_biu_aw_snoop;                            
output           wmb_biu_aw_user;                             
output  [127:0]  wmb_biu_w_data;                              
output  [4  :0]  wmb_biu_w_id;                                
output           wmb_biu_w_last;                              
output           wmb_biu_w_req;                               
output  [15 :0]  wmb_biu_w_strb;                              
output           wmb_biu_w_vld;                               
output           wmb_biu_w_wns;                               
output           wmb_ce_create_dp_vld;                        
output           wmb_ce_create_gateclk_en;                    
output           wmb_ce_create_merge;                         
output  [7  :0]  wmb_ce_create_merge_ptr;                     
output  [7  :0]  wmb_ce_create_same_dcache_line;              
output           wmb_ce_create_stall;                         
output           wmb_ce_create_vld;                           
output           wmb_ce_pop_vld;                              
output           wmb_clk;                                     
output           wmb_dcache_arb_data_way;                     
output           wmb_dcache_arb_ld_borrow_req;                
output  [7  :0]  wmb_dcache_arb_ld_data_gateclk_en;           
output  [7  :0]  wmb_dcache_arb_ld_data_gwen;                 
output  [127:0]  wmb_dcache_arb_ld_data_high_din;             
output  [10 :0]  wmb_dcache_arb_ld_data_idx;                  
output  [127:0]  wmb_dcache_arb_ld_data_low_din;              
output  [7  :0]  wmb_dcache_arb_ld_data_req;                  
output  [31 :0]  wmb_dcache_arb_ld_data_wen;                  
output           wmb_dcache_arb_ld_req;                       
output           wmb_dcache_arb_ld_tag_gateclk_en;            
output  [8  :0]  wmb_dcache_arb_ld_tag_idx;                   
output           wmb_dcache_arb_ld_tag_req;                   
output  [1  :0]  wmb_dcache_arb_ld_tag_wen;                   
output  [6  :0]  wmb_dcache_arb_st_dirty_din;                 
output           wmb_dcache_arb_st_dirty_gateclk_en;          
output  [8  :0]  wmb_dcache_arb_st_dirty_idx;                 
output           wmb_dcache_arb_st_dirty_req;                 
output  [6  :0]  wmb_dcache_arb_st_dirty_wen;                 
output           wmb_dcache_arb_st_req;                       
output  [11 :0]  wmb_depd_wakeup;                             
output           wmb_empty;                                   
output  [7  :0]  wmb_entry_vld;                               
output  [15 :0]  wmb_fwd_bytes_vld;                           
output           wmb_has_sync_fence;                          
output  [127:0]  wmb_ld_da_fwd_data;                          
output           wmb_ld_dc_cancel_acc_req;                    
output           wmb_ld_dc_discard_req;                       
output           wmb_ld_dc_fwd_req;                           
output  [63 :0]  wmb_ld_wb_data;                              
output  [39 :0]  wmb_ld_wb_data_addr;                         
output  [6  :0]  wmb_ld_wb_data_iid;                          
output           wmb_ld_wb_data_req;                          
output           wmb_ld_wb_inst_vfls;                         
output  [6  :0]  wmb_ld_wb_preg;                              
output  [3  :0]  wmb_ld_wb_preg_sign_sel;                     
output  [5  :0]  wmb_ld_wb_vreg;                              
output  [1  :0]  wmb_ld_wb_vreg_sign_sel;                     
output           wmb_lm_state_clr;                            
output           wmb_no_op;                                   
output           wmb_pfu_biu_req_hit_idx;                     
output           wmb_rb_biu_req_hit_idx;                      
output           wmb_rb_so_pending;                           
output  [39 :0]  wmb_read_req_addr;                           
output  [7  :0]  wmb_snq_depd;                                
output  [7  :0]  wmb_snq_depd_remove;                         
output           wmb_sq_pop_grnt;                             
output           wmb_sq_pop_to_ce_grnt;                       
output           wmb_st_wb_bkpta_data;                        
output           wmb_st_wb_bkptb_data;                        
output           wmb_st_wb_cmplt_req;                         
output  [6  :0]  wmb_st_wb_iid;                               
output           wmb_st_wb_inst_flush;                        
output           wmb_st_wb_spec_fail;                         
output           wmb_sync_fence_biu_req_success;              
output  [33 :0]  wmb_vb_addr_tto6;                            
output           wmb_vb_create_dp_vld;                        
output           wmb_vb_create_gateclk_en;                    
output           wmb_vb_create_req;                           
output           wmb_vb_create_vld;                           
output           wmb_vb_inv;                                  
output           wmb_vb_set_way_mode;                         
output  [7  :0]  wmb_write_ptr;                               
output  [2  :0]  wmb_write_ptr_encode;                        
output  [39 :0]  wmb_write_req_addr;                          
output           wmb_write_req_icc;                           

// &Regs; @39
reg     [39 :0]  wmb_biu_ar_addr;                             
reg     [3  :0]  wmb_biu_ar_cache;                            
reg     [3  :0]  wmb_biu_ar_snoop;                            
reg     [4  :0]  wmb_biu_aw_id;                               
reg     [7  :0]  wmb_create_ptr;                              
reg              wmb_create_ptr_circular;                     
reg              wmb_ctc_secd;                                
reg     [7  :0]  wmb_data_ptr;                                
reg              wmb_data_ptr_circular;                       
reg     [127:0]  wmb_data_req_data;                           
reg     [15 :0]  wmb_fwd_bytes_vld;                           
reg     [127:0]  wmb_fwd_data;                                
reg     [127:0]  wmb_fwd_data_sel;                            
reg     [39 :0]  wmb_last_create_addr;                        
reg              wmb_pop_depd_ff;                             
reg              wmb_read_dp_req;                             
reg     [7  :0]  wmb_read_ptr;                                
reg              wmb_read_ptr_circular;                       
reg     [39 :0]  wmb_read_req_addr;                           
reg     [7  :0]  wmb_st_wb_cmplt_ptr;                         
reg     [11 :0]  wmb_wakeup_queue;                            
reg              wmb_write_biu_dp_req;                        
reg     [39 :0]  wmb_write_dcache_addr;                       
reg     [127:0]  wmb_write_dcache_data;                       
reg              wmb_write_dcache_pop_req;                    
reg     [7  :0]  wmb_write_dcache_priority;                   
reg     [7  :0]  wmb_write_dcache_ptr;                        
reg     [7  :0]  wmb_write_dcache_ptr_set;                    
reg              wmb_write_imme;                              
reg              wmb_write_imme_hold;                         
reg     [7  :0]  wmb_write_ptr;                               
reg              wmb_write_ptr_circular;                      
reg              wmb_write_ptr_circular_set;                  
reg     [7  :0]  wmb_write_ptr_set;                           
reg     [39 :0]  wmb_write_req_addr;                          
reg     [39 :0]  wmb_write_req_addr_set;                      
reg              wmb_write_req_atomic;                        
reg              wmb_write_req_atomic_set;                    
reg              wmb_write_req_icc;                           
reg              wmb_write_req_icc_set;                       
reg              wmb_write_req_page_ca;                       
reg              wmb_write_req_page_ca_set;                   
reg              wmb_write_req_page_share;                    
reg              wmb_write_req_page_share_set;                
reg              wmb_write_req_sync_fence;                    
reg              wmb_write_req_sync_fence_set;                

// &Wires; @40
wire             amr_l2_mem_set;                              
wire    [4  :0]  biu_lsu_b_id;                                
wire    [1  :0]  biu_lsu_b_resp;                              
wire             biu_lsu_b_vld;                               
wire    [4  :0]  biu_lsu_r_id;                                
wire             biu_lsu_r_vld;                               
wire             bus_arb_wmb_ar_grnt;                         
wire             bus_arb_wmb_aw_grnt;                         
wire             bus_arb_wmb_w_grnt;                          
wire             cp0_lsu_icg_en;                              
wire             cp0_lsu_no_op_req;                           
wire             cp0_lsu_wr_burst_dis;                        
wire             cp0_yy_clk_en;                               
wire             cpurst_b;                                    
wire             dcache_arb_wmb_ld_grnt;                      
wire    [6  :0]  dcache_dirty_din;                            
wire             dcache_dirty_gwen;                           
wire    [6  :0]  dcache_dirty_wen;                            
wire    [8  :0]  dcache_idx;                                  
wire             dcache_snq_st_sel;                           
wire    [51 :0]  dcache_tag_din;                              
wire             dcache_tag_gwen;                             
wire    [1  :0]  dcache_tag_wen;                              
wire             dcache_vb_snq_gwen;                          
wire             forever_cpuclk;                              
wire             icc_wmb_write_imme;                          
wire             ld_ag_inst_vld;                              
wire             ld_da_fwd_ecc_stall;                         
wire    [11 :0]  ld_da_lsid;                                  
wire             ld_da_wmb_discard_vld;                       
wire    [39 :0]  ld_dc_addr0;                                 
wire    [7  :0]  ld_dc_addr1_11to4;                           
wire    [15 :0]  ld_dc_bytes_vld;                             
wire             ld_dc_chk_atomic_inst_vld;                   
wire             ld_dc_chk_ld_inst_vld;                       
wire             ld_wb_wmb_data_grnt;                         
wire             lfb_wmb_read_req_hit_idx;                    
wire             lfb_wmb_write_req_hit_idx;                   
wire             lm_state_is_amo_lock;                        
wire             lm_state_is_ex_wait_lock;                    
wire             lm_state_is_idle;                            
wire             lsu_had_wmb_ar_pending;                      
wire             lsu_had_wmb_aw_pending;                      
wire    [7  :0]  lsu_had_wmb_create_ptr;                      
wire    [7  :0]  lsu_had_wmb_data_ptr;                        
wire    [7  :0]  lsu_had_wmb_entry_vld;                       
wire    [7  :0]  lsu_had_wmb_read_ptr;                        
wire             lsu_had_wmb_w_pending;                       
wire             lsu_had_wmb_write_imme;                      
wire    [7  :0]  lsu_had_wmb_write_ptr;                       
wire             pad_yy_icg_scan_en;                          
wire    [39 :0]  pfu_biu_req_addr;                            
wire             pw_ecc_idle;                                 
wire             pw_merge_stall;                              
wire             pw_read;                                     
wire    [39 :0]  rb_biu_req_addr;                             
wire             rb_biu_req_unmask;                           
wire             rb_wmb_so_pending;                           
wire             rtu_lsu_async_flush;                         
wire             rtu_yy_xx_flush;                             
wire             snq_can_create_snq_uncheck;                  
wire    [39 :0]  snq_create_addr;                             
wire             snq_create_wmb_read_req_hit_idx;             
wire             snq_create_wmb_write_req_hit_idx;            
wire             snq_wmb_read_req_hit_idx;                    
wire             snq_wmb_write_req_hit_idx;                   
wire    [39 :0]  sq_pop_addr;                                 
wire    [1  :0]  sq_pop_priv_mode;                            
wire             sq_wmb_merge_req;                            
wire             sq_wmb_merge_stall_req;                      
wire             sq_wmb_pop_to_ce_dp_req;                     
wire             sq_wmb_pop_to_ce_gateclk_en;                 
wire             sq_wmb_pop_to_ce_req;                        
wire             st_ag_inst_vld;                              
wire             st_rf_inst_vld;                              
wire             st_wb_wmb_cmplt_grnt;                        
wire             vb_wmb_create_grnt;                          
wire             vb_wmb_empty;                                
wire    [7  :0]  vb_wmb_entry_rcl_done;                       
wire             vb_wmb_write_req_hit_idx;                    
wire             wmb_b_nc_id_hit;                             
wire             wmb_b_resp_exokay;                           
wire             wmb_b_so_id_hit;                             
wire    [3  :0]  wmb_biu_ar_addr_judge;                       
wire    [1  :0]  wmb_biu_ar_bar;                              
wire    [1  :0]  wmb_biu_ar_burst;                            
wire    [1  :0]  wmb_biu_ar_domain;                           
wire             wmb_biu_ar_dp_req;                           
wire    [39 :0]  wmb_biu_ar_icache_first_addr;                
wire    [39 :0]  wmb_biu_ar_icache_secd_addr;                 
wire    [4  :0]  wmb_biu_ar_id;                               
wire    [39 :0]  wmb_biu_ar_l2cache_first_addr;               
wire    [1  :0]  wmb_biu_ar_len;                              
wire             wmb_biu_ar_lock;                             
wire    [2  :0]  wmb_biu_ar_prot;                             
wire             wmb_biu_ar_req;                              
wire             wmb_biu_ar_req_gateclk_en;                   
wire    [2  :0]  wmb_biu_ar_size;                             
wire    [39 :0]  wmb_biu_ar_tlbi_first_addr;                  
wire    [39 :0]  wmb_biu_ar_tlbi_secd_addr;                   
wire    [2  :0]  wmb_biu_ar_user;                             
wire    [39 :0]  wmb_biu_aw_addr;                             
wire    [1  :0]  wmb_biu_aw_bar;                              
wire    [1  :0]  wmb_biu_aw_burst;                            
wire    [3  :0]  wmb_biu_aw_cache;                            
wire    [1  :0]  wmb_biu_aw_domain;                           
wire             wmb_biu_aw_dp_req;                           
wire    [4  :0]  wmb_biu_aw_id_judge;                         
wire    [1  :0]  wmb_biu_aw_len;                              
wire             wmb_biu_aw_lock;                             
wire    [2  :0]  wmb_biu_aw_prot;                             
wire             wmb_biu_aw_req;                              
wire             wmb_biu_aw_req_gateclk_en;                   
wire    [2  :0]  wmb_biu_aw_size;                             
wire             wmb_biu_aw_size_maintain;                    
wire    [2  :0]  wmb_biu_aw_snoop;                            
wire             wmb_biu_aw_user;                             
wire             wmb_biu_nc_recv_gateclk_en;                  
wire             wmb_biu_nc_req_gateclk_en;                   
wire             wmb_biu_nc_req_grnt;                         
wire             wmb_biu_so_recv_gateclk_en;                  
wire             wmb_biu_so_req_gateclk_en;                   
wire             wmb_biu_so_req_grnt;                         
wire    [127:0]  wmb_biu_w_data;                              
wire    [4  :0]  wmb_biu_w_id;                                
wire             wmb_biu_w_last;                              
wire             wmb_biu_w_req;                               
wire    [15 :0]  wmb_biu_w_strb;                              
wire             wmb_biu_w_vld;                               
wire             wmb_biu_w_wns;                               
wire             wmb_biu_write_en;                            
wire    [39 :0]  wmb_ce_addr;                                 
wire             wmb_ce_atomic;                               
wire             wmb_ce_bkpta_data;                           
wire             wmb_ce_bkptb_data;                           
wire    [15 :0]  wmb_ce_bytes_vld;                            
wire             wmb_ce_bytes_vld_full;                       
wire             wmb_ce_create_dp_vld;                        
wire             wmb_ce_create_gateclk_en;                    
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
wire    [3  :0]  wmb_ce_fence_mode;                           
wire             wmb_ce_hit_sq_pop_dcache_line;               
wire             wmb_ce_icc;                                  
wire    [6  :0]  wmb_ce_iid;                                  
wire             wmb_ce_inst_flush;                           
wire    [1  :0]  wmb_ce_inst_mode;                            
wire    [2  :0]  wmb_ce_inst_size;                            
wire    [1  :0]  wmb_ce_inst_type;                            
wire             wmb_ce_last_addr_eq_high;                    
wire             wmb_ce_last_addr_plus;                       
wire             wmb_ce_last_addr_sub;                        
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
wire             wmb_ce_sync_fence;                           
wire             wmb_ce_update_dcache_dirty;                  
wire             wmb_ce_update_dcache_share;                  
wire             wmb_ce_update_dcache_valid;                  
wire             wmb_ce_update_dcache_way;                    
wire             wmb_ce_update_same_dcache_line;              
wire    [7  :0]  wmb_ce_update_same_dcache_line_ptr;          
wire             wmb_ce_vld;                                  
wire             wmb_ce_vstart_vld;                           
wire             wmb_ce_wb_cmplt_success;                     
wire             wmb_ce_wb_data_success;                      
wire             wmb_ce_write_biu_dp_req;                     
wire             wmb_ce_write_imme;                           
wire             wmb_clk;                                     
wire             wmb_clk_en;                                  
wire    [7  :0]  wmb_create_not_vld;                          
wire             wmb_create_permit;                           
wire             wmb_create_ptr_clk;                          
wire             wmb_create_ptr_clk_en;                       
wire    [7  :0]  wmb_create_ptr_next1;                        
wire             wmb_create_vb_success;                       
wire             wmb_create_vld;                              
wire             wmb_create_write_imme_set;                   
wire             wmb_data_biu_req;                            
wire             wmb_data_grnt;                               
wire             wmb_data_ptr_after_write_shift_imme;         
wire             wmb_data_ptr_clk;                            
wire             wmb_data_ptr_clk_en;                         
wire             wmb_data_ptr_met_create;                     
wire    [7  :0]  wmb_data_ptr_next1;                          
wire             wmb_data_ptr_shift_vld;                      
wire             wmb_data_ptr_with_write_shift_imme;          
wire             wmb_data_req;                                
wire    [4  :0]  wmb_data_req_biu_id;                         
wire    [15 :0]  wmb_data_req_bytes_vld;                      
wire             wmb_data_req_w_last;                         
wire             wmb_data_req_wns;                            
wire             wmb_dcache_arb_data_way;                     
wire             wmb_dcache_arb_ld_borrow_req;                
wire    [7  :0]  wmb_dcache_arb_ld_data_gateclk_en;           
wire    [7  :0]  wmb_dcache_arb_ld_data_gwen;                 
wire    [127:0]  wmb_dcache_arb_ld_data_high_din;             
wire    [10 :0]  wmb_dcache_arb_ld_data_idx;                  
wire    [127:0]  wmb_dcache_arb_ld_data_low_din;              
wire    [7  :0]  wmb_dcache_arb_ld_data_req;                  
wire    [7  :0]  wmb_dcache_arb_ld_data_req_unmask;           
wire    [31 :0]  wmb_dcache_arb_ld_data_wen;                  
wire             wmb_dcache_arb_ld_req;                       
wire             wmb_dcache_arb_ld_tag_gateclk_en;            
wire    [8  :0]  wmb_dcache_arb_ld_tag_idx;                   
wire             wmb_dcache_arb_ld_tag_req;                   
wire    [1  :0]  wmb_dcache_arb_ld_tag_wen;                   
wire             wmb_dcache_arb_req;                          
wire             wmb_dcache_arb_req_unmask;                   
wire    [6  :0]  wmb_dcache_arb_st_dirty_din;                 
wire             wmb_dcache_arb_st_dirty_gateclk_en;          
wire    [8  :0]  wmb_dcache_arb_st_dirty_idx;                 
wire             wmb_dcache_arb_st_dirty_req;                 
wire    [6  :0]  wmb_dcache_arb_st_dirty_wen;                 
wire             wmb_dcache_arb_st_req;                       
wire             wmb_dcache_data_high_sel;                    
wire    [3  :0]  wmb_dcache_data_region;                      
wire             wmb_dcache_inst_write_req_hit_idx;           
wire             wmb_dcache_req_next;                         
wire    [7  :0]  wmb_dcache_req_ptr;                          
wire    [7  :0]  wmb_dcache_req_set;                          
wire    [11 :0]  wmb_depd_wakeup;                             
wire             wmb_discard_req;                             
wire             wmb_ecc_fatal_err;                           
wire             wmb_ecc_write_req;                           
wire             wmb_empty;                                   
wire    [7  :0]  wmb_entry_1_entry_w_last;                    
wire    [39 :0]  wmb_entry_addr_0;                            
wire    [39 :0]  wmb_entry_addr_1;                            
wire    [39 :0]  wmb_entry_addr_2;                            
wire    [39 :0]  wmb_entry_addr_3;                            
wire    [39 :0]  wmb_entry_addr_4;                            
wire    [39 :0]  wmb_entry_addr_5;                            
wire    [39 :0]  wmb_entry_addr_6;                            
wire    [39 :0]  wmb_entry_addr_7;                            
wire    [7  :0]  wmb_entry_ar_pending;                        
wire    [7  :0]  wmb_entry_atomic;                            
wire    [7  :0]  wmb_entry_atomic_and_vld;                    
wire    [7  :0]  wmb_entry_aw_pending;                        
wire    [4  :0]  wmb_entry_biu_id_0;                          
wire    [4  :0]  wmb_entry_biu_id_1;                          
wire    [4  :0]  wmb_entry_biu_id_2;                          
wire    [4  :0]  wmb_entry_biu_id_3;                          
wire    [4  :0]  wmb_entry_biu_id_4;                          
wire    [4  :0]  wmb_entry_biu_id_5;                          
wire    [4  :0]  wmb_entry_biu_id_6;                          
wire    [4  :0]  wmb_entry_biu_id_7;                          
wire    [7  :0]  wmb_entry_bkpta_data;                        
wire    [7  :0]  wmb_entry_bkptb_data;                        
wire    [15 :0]  wmb_entry_bytes_vld_0;                       
wire    [15 :0]  wmb_entry_bytes_vld_1;                       
wire    [15 :0]  wmb_entry_bytes_vld_2;                       
wire    [15 :0]  wmb_entry_bytes_vld_3;                       
wire    [15 :0]  wmb_entry_bytes_vld_4;                       
wire    [15 :0]  wmb_entry_bytes_vld_5;                       
wire    [15 :0]  wmb_entry_bytes_vld_6;                       
wire    [15 :0]  wmb_entry_bytes_vld_7;                       
wire    [7  :0]  wmb_entry_cancel_acc_req;                    
wire    [7  :0]  wmb_entry_create_data_vld;                   
wire    [7  :0]  wmb_entry_create_dp_vld;                     
wire    [7  :0]  wmb_entry_create_gateclk_en;                 
wire    [7  :0]  wmb_entry_create_vld;                        
wire    [127:0]  wmb_entry_data_0;                            
wire    [127:0]  wmb_entry_data_1;                            
wire    [127:0]  wmb_entry_data_2;                            
wire    [127:0]  wmb_entry_data_3;                            
wire    [127:0]  wmb_entry_data_4;                            
wire    [127:0]  wmb_entry_data_5;                            
wire    [127:0]  wmb_entry_data_6;                            
wire    [127:0]  wmb_entry_data_7;                            
wire    [7  :0]  wmb_entry_data_biu_req;                      
wire    [7  :0]  wmb_entry_data_ptr_after_write_shift_imme;   
wire    [7  :0]  wmb_entry_data_ptr_with_write_shift_imme;    
wire    [7  :0]  wmb_entry_data_req;                          
wire    [7  :0]  wmb_entry_data_req_wns;                      
wire    [7  :0]  wmb_entry_dcache_inst;                       
wire    [7  :0]  wmb_entry_dcache_line_w_last;                
wire    [7  :0]  wmb_entry_dcache_way;                        
wire    [7  :0]  wmb_entry_depd;                              
wire    [7  :0]  wmb_entry_discard_req;                       
wire    [15 :0]  wmb_entry_fwd_bytes_vld_0;                   
wire    [15 :0]  wmb_entry_fwd_bytes_vld_1;                   
wire    [15 :0]  wmb_entry_fwd_bytes_vld_2;                   
wire    [15 :0]  wmb_entry_fwd_bytes_vld_3;                   
wire    [15 :0]  wmb_entry_fwd_bytes_vld_4;                   
wire    [15 :0]  wmb_entry_fwd_bytes_vld_5;                   
wire    [15 :0]  wmb_entry_fwd_bytes_vld_6;                   
wire    [15 :0]  wmb_entry_fwd_bytes_vld_7;                   
wire    [7  :0]  wmb_entry_fwd_data_pe_gateclk_en;            
wire    [7  :0]  wmb_entry_fwd_data_pe_req;                   
wire    [7  :0]  wmb_entry_fwd_req;                           
wire    [7  :0]  wmb_entry_hit_sq_pop_dcache_line;            
wire    [7  :0]  wmb_entry_icc;                               
wire    [7  :0]  wmb_entry_icc_and_vld;                       
wire    [6  :0]  wmb_entry_iid_0;                             
wire    [6  :0]  wmb_entry_iid_1;                             
wire    [6  :0]  wmb_entry_iid_2;                             
wire    [6  :0]  wmb_entry_iid_3;                             
wire    [6  :0]  wmb_entry_iid_4;                             
wire    [6  :0]  wmb_entry_iid_5;                             
wire    [6  :0]  wmb_entry_iid_6;                             
wire    [6  :0]  wmb_entry_iid_7;                             
wire    [7  :0]  wmb_entry_inst_flush;                        
wire    [7  :0]  wmb_entry_inst_is_dcache;                    
wire    [1  :0]  wmb_entry_inst_mode_0;                       
wire    [1  :0]  wmb_entry_inst_mode_1;                       
wire    [1  :0]  wmb_entry_inst_mode_2;                       
wire    [1  :0]  wmb_entry_inst_mode_3;                       
wire    [1  :0]  wmb_entry_inst_mode_4;                       
wire    [1  :0]  wmb_entry_inst_mode_5;                       
wire    [1  :0]  wmb_entry_inst_mode_6;                       
wire    [1  :0]  wmb_entry_inst_mode_7;                       
wire    [2  :0]  wmb_entry_inst_size_0;                       
wire    [2  :0]  wmb_entry_inst_size_1;                       
wire    [2  :0]  wmb_entry_inst_size_2;                       
wire    [2  :0]  wmb_entry_inst_size_3;                       
wire    [2  :0]  wmb_entry_inst_size_4;                       
wire    [2  :0]  wmb_entry_inst_size_5;                       
wire    [2  :0]  wmb_entry_inst_size_6;                       
wire    [2  :0]  wmb_entry_inst_size_7;                       
wire    [1  :0]  wmb_entry_inst_type_0;                       
wire    [1  :0]  wmb_entry_inst_type_1;                       
wire    [1  :0]  wmb_entry_inst_type_2;                       
wire    [1  :0]  wmb_entry_inst_type_3;                       
wire    [1  :0]  wmb_entry_inst_type_4;                       
wire    [1  :0]  wmb_entry_inst_type_5;                       
wire    [1  :0]  wmb_entry_inst_type_6;                       
wire    [1  :0]  wmb_entry_inst_type_7;                       
wire    [7  :0]  wmb_entry_last_addr_plus;                    
wire    [7  :0]  wmb_entry_last_addr_sub;                     
wire    [7  :0]  wmb_entry_mem_set_write_gateclk_en;          
wire    [7  :0]  wmb_entry_mem_set_write_grnt;                
wire    [7  :0]  wmb_entry_merge_data_addr_hit;               
wire    [7  :0]  wmb_entry_merge_data_stall;                  
wire    [7  :0]  wmb_entry_merge_data_vld;                    
wire    [7  :0]  wmb_entry_merge_data_wait_not_vld_req;       
wire    [7  :0]  wmb_entry_next_nc_bypass;                    
wire    [7  :0]  wmb_entry_next_so_bypass;                    
wire    [7  :0]  wmb_entry_no_op;                             
wire    [7  :0]  wmb_entry_page_buf;                          
wire    [7  :0]  wmb_entry_page_ca;                           
wire    [7  :0]  wmb_entry_page_sec;                          
wire    [7  :0]  wmb_entry_page_share;                        
wire    [7  :0]  wmb_entry_page_so;                           
wire    [7  :0]  wmb_entry_page_wa;                           
wire    [7  :0]  wmb_entry_pfu_biu_req_hit_idx;               
wire    [7  :0]  wmb_entry_pop_vld;                           
wire    [6  :0]  wmb_entry_preg_0;                            
wire    [6  :0]  wmb_entry_preg_1;                            
wire    [6  :0]  wmb_entry_preg_2;                            
wire    [6  :0]  wmb_entry_preg_3;                            
wire    [6  :0]  wmb_entry_preg_4;                            
wire    [6  :0]  wmb_entry_preg_5;                            
wire    [6  :0]  wmb_entry_preg_6;                            
wire    [6  :0]  wmb_entry_preg_7;                            
wire    [1  :0]  wmb_entry_priv_mode_0;                       
wire    [1  :0]  wmb_entry_priv_mode_1;                       
wire    [1  :0]  wmb_entry_priv_mode_2;                       
wire    [1  :0]  wmb_entry_priv_mode_3;                       
wire    [1  :0]  wmb_entry_priv_mode_4;                       
wire    [1  :0]  wmb_entry_priv_mode_5;                       
wire    [1  :0]  wmb_entry_priv_mode_6;                       
wire    [1  :0]  wmb_entry_priv_mode_7;                       
wire    [7  :0]  wmb_entry_rb_biu_req_hit_idx;                
wire    [7  :0]  wmb_entry_read_dp_req;                       
wire    [7  :0]  wmb_entry_read_ptr_chk_idx_shift_imme;       
wire    [7  :0]  wmb_entry_read_ptr_unconditional_shift_imme; 
wire    [7  :0]  wmb_entry_read_req;                          
wire    [7  :0]  wmb_entry_read_resp_ready;                   
wire    [7  :0]  wmb_entry_ready_to_dcache_line;              
wire    [7  :0]  wmb_entry_sc_wb_success;                     
wire    [7  :0]  wmb_entry_snq_depd;                          
wire    [7  :0]  wmb_entry_snq_depd_remove;                   
wire    [7  :0]  wmb_entry_spec_fail;                         
wire    [7  :0]  wmb_entry_sync_fence;                        
wire    [7  :0]  wmb_entry_sync_fence_biu_req_success;        
wire    [7  :0]  wmb_entry_sync_fence_inst;                   
wire    [7  :0]  wmb_entry_vld;                               
wire    [7  :0]  wmb_entry_vstart_vld;                        
wire    [7  :0]  wmb_entry_w_last;                            
wire    [7  :0]  wmb_entry_w_last_set;                        
wire    [7  :0]  wmb_entry_w_pending;                         
wire    [7  :0]  wmb_entry_wb_cmplt_grnt;                     
wire    [7  :0]  wmb_entry_wb_cmplt_req;                      
wire    [7  :0]  wmb_entry_wb_data_grnt;                      
wire    [7  :0]  wmb_entry_wb_data_req;                       
wire    [7  :0]  wmb_entry_write_biu_dp_req;                  
wire    [7  :0]  wmb_entry_write_biu_req;                     
wire    [7  :0]  wmb_entry_write_dcache_req;                  
wire    [7  :0]  wmb_entry_write_imme;                        
wire    [7  :0]  wmb_entry_write_imme_bypass;                 
wire    [7  :0]  wmb_entry_write_ptr_chk_idx_shift_imme;      
wire    [7  :0]  wmb_entry_write_ptr_unconditional_shift_imme; 
wire    [7  :0]  wmb_entry_write_req;                         
wire    [7  :0]  wmb_entry_write_stall;                       
wire    [7  :0]  wmb_entry_write_vb_req;                      
wire             wmb_fwd_data_pe_clk;                         
wire             wmb_fwd_data_pe_clk_en;                      
wire             wmb_fwd_data_pe_gateclk_en;                  
wire             wmb_fwd_data_pe_req;                         
wire             wmb_fwd_req;                                 
wire             wmb_has_dcache_inst;                         
wire             wmb_has_sync_fence;                          
wire             wmb_idfifo_nc_clk_en;                        
wire             wmb_idfifo_nc_create_vld;                    
wire             wmb_idfifo_nc_pop_vld;                       
wire             wmb_idfifo_so_clk_en;                        
wire             wmb_idfifo_so_create_vld;                    
wire             wmb_idfifo_so_pop_vld;                       
wire    [1  :0]  wmb_last_addr_plus;                          
wire    [1  :0]  wmb_last_addr_sub;                           
wire    [127:0]  wmb_ld_da_fwd_data;                          
wire             wmb_ld_dc_cancel_acc_req;                    
wire             wmb_ld_dc_discard_req;                       
wire             wmb_ld_dc_fwd_req;                           
wire    [63 :0]  wmb_ld_wb_data;                              
wire    [39 :0]  wmb_ld_wb_data_addr;                         
wire    [6  :0]  wmb_ld_wb_data_iid;                          
wire    [7  :0]  wmb_ld_wb_data_ptr;                          
wire             wmb_ld_wb_data_req;                          
wire             wmb_ld_wb_data_success;                      
wire             wmb_ld_wb_inst_vfls;                         
wire    [6  :0]  wmb_ld_wb_preg;                              
wire    [3  :0]  wmb_ld_wb_preg_sign_sel;                     
wire    [5  :0]  wmb_ld_wb_vreg;                              
wire    [1  :0]  wmb_ld_wb_vreg_sign_sel;                     
wire             wmb_lm_state_clr;                            
wire             wmb_mem_set_write_gateclk_en;                
wire             wmb_mem_set_write_grnt;                      
wire             wmb_merge_data_addr_hit;                     
wire             wmb_merge_data_stall;                        
wire             wmb_merge_vld;                               
wire             wmb_nc_no_pending;                           
wire             wmb_no_op;                                   
wire             wmb_other4_write_imme;                       
wire             wmb_other_write_imme;                        
wire             wmb_pfu_biu_req_hit_idx;                     
wire             wmb_pop_depd;                                
wire             wmb_pop_discard_req;                         
wire             wmb_pop_fwd_req;                             
wire             wmb_pop_to_ce_permit;                        
wire             wmb_rb_biu_req_hit_idx;                      
wire             wmb_rb_so_pending;                           
wire             wmb_read_dp_req_next1;                       
wire             wmb_read_grnt;                               
wire             wmb_read_pop_clk;                            
wire             wmb_read_pop_clk_en;                         
wire             wmb_read_pop_up_wmb_ce_vld;                  
wire             wmb_read_ptr_chk_idx_shift_imme;             
wire             wmb_read_ptr_clk;                            
wire             wmb_read_ptr_clk_en;                         
wire    [2  :0]  wmb_read_ptr_encode;                         
wire             wmb_read_ptr_met_create;                     
wire    [7  :0]  wmb_read_ptr_next1;                          
wire             wmb_read_ptr_next1_met_create;               
wire             wmb_read_ptr_read_req_grnt;                  
wire             wmb_read_ptr_shift_imme_grnt;                
wire             wmb_read_ptr_shift_vld;                      
wire             wmb_read_ptr_unconditional_shift_imme;       
wire    [39 :0]  wmb_read_req_addr_next1;                     
wire             wmb_read_req_atomic;                         
wire             wmb_read_req_ctc_end;                        
wire             wmb_read_req_ctc_inst;                       
wire    [15 :0]  wmb_read_req_data;                           
wire             wmb_read_req_dcache_va_l1_inst;              
wire             wmb_read_req_hit_idx;                        
wire             wmb_read_req_icache_all_inst;                
wire             wmb_read_req_icache_inst;                    
wire             wmb_read_req_icc;                            
wire             wmb_read_req_inst_is_dcache;                 
wire    [1  :0]  wmb_read_req_inst_mode;                      
wire    [1  :0]  wmb_read_req_inst_size;                      
wire    [1  :0]  wmb_read_req_inst_type;                      
wire             wmb_read_req_l2cache_inst;                   
wire             wmb_read_req_page_sec;                       
wire             wmb_read_req_page_share;                     
wire    [1  :0]  wmb_read_req_priv_mode;                      
wire             wmb_read_req_tlbi_asid_inst;                 
wire             wmb_read_req_tlbi_inst;                      
wire             wmb_read_req_tlbi_va_inst;                   
wire             wmb_read_req_unmask;                         
wire    [7  :0]  wmb_same_line_resp_ready;                    
wire    [7  :0]  wmb_snq_depd;                                
wire    [7  :0]  wmb_snq_depd_remove;                         
wire             wmb_so_no_pending;                           
wire             wmb_sq_pop_grnt;                             
wire             wmb_sq_pop_to_ce_grnt;                       
wire             wmb_st_wb_atomic;                            
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
wire             wmb_wakeup_queue_clk;                        
wire             wmb_wakeup_queue_clk_en;                     
wire    [11 :0]  wmb_wakeup_queue_grnt;                       
wire    [11 :0]  wmb_wakeup_queue_next;                       
wire             wmb_wakeup_queue_not_empty;                  
wire             wmb_write_biu_dcache_line;                   
wire             wmb_write_biu_dp_req_next1;                  
wire             wmb_write_biu_req_unmask;                    
wire             wmb_write_burst_neg;                         
wire    [39 :0]  wmb_write_dcache_addr_set;                   
wire             wmb_write_dcache_atomic;                     
wire    [15 :0]  wmb_write_dcache_bytes_vld;                  
wire             wmb_write_dcache_icc;                        
wire             wmb_write_dcache_permit;                     
wire             wmb_write_dcache_pop_clk;                    
wire             wmb_write_dcache_pop_clk_en;                 
wire             wmb_write_dcache_pop_up;                     
wire             wmb_write_dcache_req_icc_inst;               
wire             wmb_write_dcache_stall;                      
wire             wmb_write_dcache_success;                    
wire             wmb_write_dcache_success_ori;                
wire             wmb_write_dcache_sync_fence;                 
wire    [15 :0]  wmb_write_dcache_wen;                        
wire             wmb_write_grnt;                              
wire             wmb_write_imme_amr_clr;                      
wire             wmb_write_imme_bypass;                       
wire             wmb_write_imme_clr;                          
wire             wmb_write_imme_hold_set;                     
wire             wmb_write_imme_ori;                          
wire             wmb_write_imme_other_bypass;                 
wire             wmb_write_imme_set;                          
wire             wmb_write_pop_clk;                           
wire             wmb_write_pop_clk_en;                        
wire             wmb_write_pop_up_wmb_ce_gateclk_en;          
wire             wmb_write_pop_up_wmb_ce_vld;                 
wire             wmb_write_ptr_chk_idx_shift_imme;            
wire             wmb_write_ptr_circular_set_vld;              
wire             wmb_write_ptr_clk;                           
wire             wmb_write_ptr_clk_en;                        
wire    [2  :0]  wmb_write_ptr_encode;                        
wire             wmb_write_ptr_met_create;                    
wire    [7  :0]  wmb_write_ptr_next1;                         
wire             wmb_write_ptr_next1_met_create;              
wire    [7  :0]  wmb_write_ptr_next2;                         
wire    [7  :0]  wmb_write_ptr_next3;                         
wire    [2  :0]  wmb_write_ptr_next3_encode;                  
wire    [7  :0]  wmb_write_ptr_next4;                         
wire    [7  :0]  wmb_write_ptr_next5;                         
wire    [7  :0]  wmb_write_ptr_next6;                         
wire    [7  :0]  wmb_write_ptr_next7;                         
wire             wmb_write_ptr_shift_imme_grnt;               
wire             wmb_write_ptr_shift_vld;                     
wire    [7  :0]  wmb_write_ptr_to_next3;                      
wire             wmb_write_ptr_unconditional_shift_imme;      
wire             wmb_write_req;                               
wire             wmb_write_req_addr_dcache_begin;             
wire    [39 :0]  wmb_write_req_addr_next1;                    
wire             wmb_write_req_atomic_next1;                  
wire             wmb_write_req_dcache_way;                    
wire             wmb_write_req_default_domain;                
wire             wmb_write_req_hit_idx;                       
wire             wmb_write_req_icc_next1;                     
wire    [1  :0]  wmb_write_req_inst_mode;                     
wire    [2  :0]  wmb_write_req_inst_size;                     
wire    [1  :0]  wmb_write_req_inst_type;                     
wire             wmb_write_req_next1_addr_plus;               
wire             wmb_write_req_next1_addr_sub;                
wire             wmb_write_req_next1_ready_to_dcache_line;    
wire             wmb_write_req_next2_addr_plus;               
wire             wmb_write_req_next2_addr_sub;                
wire             wmb_write_req_next2_ready_to_dcache_line;    
wire             wmb_write_req_next3_addr_plus;               
wire             wmb_write_req_next3_addr_sub;                
wire             wmb_write_req_next3_ready_to_dcache_line;    
wire             wmb_write_req_no_wns;                        
wire             wmb_write_req_page_buf;                      
wire             wmb_write_req_page_ca_next1;                 
wire             wmb_write_req_page_nc_atomic;                
wire             wmb_write_req_page_sec;                      
wire             wmb_write_req_page_share_next1;              
wire             wmb_write_req_page_so;                       
wire             wmb_write_req_page_wa;                       
wire    [1  :0]  wmb_write_req_priv_mode;                     
wire             wmb_write_req_ready_to_dcache_line;          
wire             wmb_write_req_st_inst;                       
wire             wmb_write_req_stex_inst;                     
wire             wmb_write_req_sync_fence_inst;               
wire             wmb_write_req_sync_fence_next1;              
wire             wmb_write_req_sync_inst;                     
wire             wmb_write_vb_req_unmask;                     
wire             write_burst_en;                              


parameter WMB_ENTRY         = 8,
          LSIQ_ENTRY        = 12;
parameter BIU_R_NORM_ID_T   = 2'b01,
          BIU_R_CTC_ID      = 5'd28;
parameter BIU_B_NC_ID       = 5'd24,
          BIU_B_SO_ID       = 5'd29,
          BIU_B_NC_ATOM_ID  = 5'd30,
          BIU_B_SYNC_FENCE_ID = 5'd31;
parameter BYTE              = 2'b00,
          HALF              = 2'b01,
          WORD              = 2'b10;
parameter OKAY              = 2'b00,
          EXOKAY            = 2'b01,
          SLVERR            = 2'b10,
          DECERR            = 2'b11;
parameter IDLE              = 3'b000,
          REQ_DATA0         = 3'b100,
          REQ_DATA1         = 3'b101,
          REQ_DATA2         = 3'b110,
          REQ_DATA3         = 3'b111;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//if sq has entry or create sq, then this gateclk is on
assign wmb_clk_en = !wmb_empty
                    ||  sq_wmb_pop_to_ce_gateclk_en
                    ||  wmb_ce_vld
                    ||  wmb_pop_depd_ff
                    ||  wmb_read_dp_req
                    ||  wmb_write_biu_dp_req
                    ||  wmb_write_imme;
// &Force("output","wmb_clk"); @74
// &Instance("gated_clk_cell", "x_lsu_wmb_gated_clk"); @75
gated_clk_cell  x_lsu_wmb_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wmb_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (wmb_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @76
//          .external_en   (1'b0               ), @77
//          .global_en     (cp0_yy_clk_en      ), @78
//          .module_en     (cp0_lsu_icg_en     ), @79
//          .local_en      (wmb_clk_en         ), @80
//          .clk_out       (wmb_clk            )); @81

//create ptr
assign wmb_create_ptr_clk_en  = wmb_ce_create_wmb_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_wmb_create_ptr_gated_clk"); @85
gated_clk_cell  x_lsu_wmb_create_ptr_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (wmb_create_ptr_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (wmb_create_ptr_clk_en),
  .module_en             (cp0_lsu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in        (forever_cpuclk     ), @86
//          .external_en   (1'b0               ), @87
//          .global_en     (cp0_yy_clk_en      ), @88
//          .module_en     (cp0_lsu_icg_en     ), @89
//          .local_en      (wmb_create_ptr_clk_en), @90
//          .clk_out       (wmb_create_ptr_clk )); @91

//read ptr
assign wmb_read_ptr_clk_en  = wmb_read_ptr_unconditional_shift_imme
                              ||  wmb_read_ptr_chk_idx_shift_imme
                              ||  wmb_read_req_unmask;
// &Instance("gated_clk_cell", "x_lsu_wmb_read_ptr_gated_clk"); @97
gated_clk_cell  x_lsu_wmb_read_ptr_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (wmb_read_ptr_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (wmb_read_ptr_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @98
//          .external_en   (1'b0               ), @99
//          .global_en     (cp0_yy_clk_en      ), @100
//          .module_en     (cp0_lsu_icg_en     ), @101
//          .local_en      (wmb_read_ptr_clk_en), @102
//          .clk_out       (wmb_read_ptr_clk   )); @103

//write ptr
assign wmb_write_ptr_clk_en = wmb_write_ptr_unconditional_shift_imme
                              ||  wmb_write_ptr_chk_idx_shift_imme
                              ||  wmb_write_req
                              ||  wmb_dcache_arb_req_unmask;
// &Instance("gated_clk_cell", "x_lsu_wmb_write_ptr_gated_clk"); @110
gated_clk_cell  x_lsu_wmb_write_ptr_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (wmb_write_ptr_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (wmb_write_ptr_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (forever_cpuclk     ), @111
//          .external_en   (1'b0               ), @112
//          .global_en     (cp0_yy_clk_en      ), @113
//          .module_en     (cp0_lsu_icg_en     ), @114
//          .local_en      (wmb_write_ptr_clk_en), @115
//          .clk_out       (wmb_write_ptr_clk  )); @116

//data ptr
assign wmb_data_ptr_clk_en  = wmb_data_ptr_after_write_shift_imme
                              ||  wmb_data_ptr_with_write_shift_imme
                              ||  wmb_data_req
                              ||  wmb_dcache_arb_req_unmask;
// &Instance("gated_clk_cell", "x_lsu_wmb_data_ptr_gated_clk"); @123
gated_clk_cell  x_lsu_wmb_data_ptr_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (wmb_data_ptr_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (wmb_data_ptr_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @124
//          .external_en   (1'b0               ), @125
//          .global_en     (cp0_yy_clk_en      ), @126
//          .module_en     (cp0_lsu_icg_en     ), @127
//          .local_en      (wmb_data_ptr_clk_en), @128
//          .clk_out       (wmb_data_ptr_clk   )); @129

//wmb fwd ld da pop entry
assign wmb_fwd_data_pe_clk_en = wmb_fwd_data_pe_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_wmb_fwd_data_pe_gated_clk"); @133
gated_clk_cell  x_lsu_wmb_fwd_data_pe_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (wmb_fwd_data_pe_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (wmb_fwd_data_pe_clk_en),
  .module_en              (cp0_lsu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in        (forever_cpuclk     ), @134
//          .external_en   (1'b0               ), @135
//          .global_en     (cp0_yy_clk_en      ), @136
//          .module_en     (cp0_lsu_icg_en     ), @137
//          .local_en      (wmb_fwd_data_pe_clk_en), @138
//          .clk_out       (wmb_fwd_data_pe_clk)); @139

//pop entry signal
assign wmb_write_pop_clk_en = wmb_write_ptr_clk_en
                              ||  wmb_write_pop_up_wmb_ce_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_wmb_write_pop_gated_clk"); @144
gated_clk_cell  x_lsu_wmb_write_pop_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (wmb_write_pop_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (wmb_write_pop_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (forever_cpuclk     ), @145
//          .external_en   (1'b0               ), @146
//          .global_en     (cp0_yy_clk_en      ), @147
//          .module_en     (cp0_lsu_icg_en     ), @148
//          .local_en      (wmb_write_pop_clk_en), @149
//          .clk_out       (wmb_write_pop_clk  )); @150

assign wmb_write_dcache_pop_clk_en = wmb_dcache_req_next || wmb_write_dcache_pop_req;
                            
// &Instance("gated_clk_cell", "x_lsu_wmb_write_dcache_pop_gated_clk"); @154
gated_clk_cell  x_lsu_wmb_write_dcache_pop_gated_clk (
  .clk_in                      (forever_cpuclk             ),
  .clk_out                     (wmb_write_dcache_pop_clk   ),
  .external_en                 (1'b0                       ),
  .global_en                   (cp0_yy_clk_en              ),
  .local_en                    (wmb_write_dcache_pop_clk_en),
  .module_en                   (cp0_lsu_icg_en             ),
  .pad_yy_icg_scan_en          (pad_yy_icg_scan_en         )
);

// &Connect(.clk_in        (forever_cpuclk     ), @155
//          .external_en   (1'b0               ), @156
//          .global_en     (cp0_yy_clk_en      ), @157
//          .module_en     (cp0_lsu_icg_en     ), @158
//          .local_en      (wmb_write_dcache_pop_clk_en), @159
//          .clk_out       (wmb_write_dcache_pop_clk  )); @160

assign wmb_read_pop_clk_en  = wmb_read_ptr_clk_en
                              ||  wmb_ce_create_wmb_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_wmb_read_pop_gated_clk"); @164
gated_clk_cell  x_lsu_wmb_read_pop_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (wmb_read_pop_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (wmb_read_pop_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @165
//          .external_en   (1'b0               ), @166
//          .global_en     (cp0_yy_clk_en      ), @167
//          .module_en     (cp0_lsu_icg_en     ), @168
//          .local_en      (wmb_read_pop_clk_en), @169
//          .clk_out       (wmb_read_pop_clk   )); @170

//depd clk is used for wakeup queue
assign wmb_wakeup_queue_clk_en  = ld_da_wmb_discard_vld
                                  ||  wmb_pop_depd_ff
                                  ||  rtu_yy_xx_flush;
// &Instance("gated_clk_cell", "x_lsu_wmb_wakeup_queue_gated_clk"); @176
gated_clk_cell  x_lsu_wmb_wakeup_queue_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (wmb_wakeup_queue_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (wmb_wakeup_queue_clk_en),
  .module_en               (cp0_lsu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in        (forever_cpuclk     ), @177
//          .external_en   (1'b0               ), @178
//          .global_en     (cp0_yy_clk_en      ), @179
//          .module_en     (cp0_lsu_icg_en     ), @180
//          .local_en      (wmb_wakeup_queue_clk_en), @181
//          .clk_out       (wmb_wakeup_queue_clk)); @182

//==========================================================
//                      Empty cnt
//==========================================================
//------------------empty signal----------------------------
// &Force("output","wmb_entry_vld"); @188
// &Force("output","wmb_empty"); @189
assign wmb_empty                  = !(|wmb_entry_vld[WMB_ENTRY-1:0]);

//==========================================================
//                 Non-cacheable FIFO
//==========================================================
// &Instance("ct_lsu_idfifo_8","x_ct_lsu_wmb_idfifo_nc"); @195
ct_lsu_idfifo_8  x_ct_lsu_wmb_idfifo_nc (
  .cp0_lsu_icg_en                (cp0_lsu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .idfifo_clk_en                 (wmb_idfifo_nc_clk_en         ),
  .idfifo_create_id              (wmb_write_ptr_encode[2:0]    ),
  .idfifo_create_id_oh           (wmb_write_ptr[7:0]           ),
  .idfifo_create_vld             (wmb_idfifo_nc_create_vld     ),
  .idfifo_empty                  (wmb_nc_no_pending            ),
  .idfifo_pop_id_oh              (wmb_entry_next_nc_bypass[7:0]),
  .idfifo_pop_vld                (wmb_idfifo_nc_pop_vld        ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           )
);

// &Connect( .idfifo_clk_en        (wmb_idfifo_nc_clk_en         ), @196
//           .idfifo_create_vld    (wmb_idfifo_nc_create_vld     ), @197
//           .idfifo_pop_vld       (wmb_idfifo_nc_pop_vld        ), @198
//           .idfifo_create_id     (wmb_write_ptr_encode[2:0]    ), @199
//           .idfifo_create_id_oh  (wmb_write_ptr[7:0]           ), @200
//           .idfifo_pop_id_oh     (wmb_entry_next_nc_bypass[7:0]), @201
//           .idfifo_empty         (wmb_nc_no_pending            )); @202
// &Force("nonport","wmb_nc_no_pending"); @203

//-----------------------wires------------------------------
assign wmb_idfifo_nc_create_vld                = wmb_biu_nc_req_grnt;
assign wmb_idfifo_nc_pop_vld                   = wmb_b_nc_id_hit;

//------------------gateclk---------------------------------
assign wmb_biu_nc_req_gateclk_en  = wmb_write_biu_req_unmask
                                    &&  !wmb_write_req_page_ca
                                    &&  !wmb_write_req_page_so
                                    &&  (wmb_write_req_atomic
                                        ||  !wmb_write_req_icc
                                            &&  !wmb_write_req_sync_fence);
assign wmb_biu_nc_recv_gateclk_en = wmb_b_nc_id_hit;
assign wmb_idfifo_nc_clk_en          = wmb_biu_nc_req_gateclk_en
                                    ||  wmb_biu_nc_recv_gateclk_en;

//==========================================================
//                 Strong order FIFO
//==========================================================
// &Instance("ct_lsu_idfifo_8","x_ct_lsu_wmb_idfifo_so"); @223
ct_lsu_idfifo_8  x_ct_lsu_wmb_idfifo_so (
  .cp0_lsu_icg_en                (cp0_lsu_icg_en               ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .idfifo_clk_en                 (wmb_idfifo_so_clk_en         ),
  .idfifo_create_id              (wmb_write_ptr_encode[2:0]    ),
  .idfifo_create_id_oh           (wmb_write_ptr[7:0]           ),
  .idfifo_create_vld             (wmb_idfifo_so_create_vld     ),
  .idfifo_empty                  (wmb_so_no_pending            ),
  .idfifo_pop_id_oh              (wmb_entry_next_so_bypass[7:0]),
  .idfifo_pop_vld                (wmb_idfifo_so_pop_vld        ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           )
);

// &Connect( .idfifo_clk_en        (wmb_idfifo_so_clk_en         ), @224
//           .idfifo_create_vld    (wmb_idfifo_so_create_vld     ), @225
//           .idfifo_pop_vld       (wmb_idfifo_so_pop_vld        ), @226
//           .idfifo_create_id     (wmb_write_ptr_encode[2:0]    ), @227
//           .idfifo_create_id_oh  (wmb_write_ptr[7:0]           ), @228
//           .idfifo_pop_id_oh     (wmb_entry_next_so_bypass[7:0]), @229
//           .idfifo_empty         (wmb_so_no_pending            )); @230

//-----------------------wires------------------------------
assign wmb_idfifo_so_create_vld                = wmb_biu_so_req_grnt;
assign wmb_idfifo_so_pop_vld                   = wmb_b_so_id_hit;

//------------------gateclk---------------------------------
assign wmb_biu_so_req_gateclk_en  = wmb_write_biu_req_unmask
                                    &&  wmb_write_req_page_so
                                    &&  (wmb_write_req_atomic
                                        ||  !wmb_write_req_icc
                                            &&  !wmb_write_req_sync_fence);
assign wmb_biu_so_recv_gateclk_en = wmb_b_so_id_hit;
assign wmb_idfifo_so_clk_en       = wmb_biu_so_req_gateclk_en
                                    ||  wmb_biu_so_recv_gateclk_en;

//------------------pending---------------------------------
assign wmb_rb_so_pending          = !wmb_so_no_pending;

//==========================================================
//          Instance of write merge buffer entry
//==========================================================
// &ConnRule(s/_x$/[0]/); @252
// &ConnRule(s/_v$/_0/); @253
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_0"); @254
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_0 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[0]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[0]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[0]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[0]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_0                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[0]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[0]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[0]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[0]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_0                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[0]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[0]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_0                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[0]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[0]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[0]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[0]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[0]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[0]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[0]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[0]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[0]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[0]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_0                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[0]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[0]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[0]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[0]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_0                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[0]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[0]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[0]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[0]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[0]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[0]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_0                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[0]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[0]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_0                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_0                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_0                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[0]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[0]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[0]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[0]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[0]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[0]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[0]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[0]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[0]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[0]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[0]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[0]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[0]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[0]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[0]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[0]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[0]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[0]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[0]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_0                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_0                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[0]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[0]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[0]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[0] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[0]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[0]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[0]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[0]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[0]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[0]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[0]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[0]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[0]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[0]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[0]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[0]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[0]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[0]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[0]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[0]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[0]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[0]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[0]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[0]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[0]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[0]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[0]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[0]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[0]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[0]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[0]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[0]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[0]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[0]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[0]                               )
);


// &ConnRule(s/_x$/[1]/); @256
// &ConnRule(s/_v$/_1/); @257
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_1"); @258
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_1 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[1]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[1]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[1]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[1]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_1                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[1]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[1]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[1]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[1]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_1                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[1]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[1]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_1                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[1]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[1]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[1]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[1]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[1]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[1]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[1]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[1]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[1]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[1]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_1                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[1]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[1]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[1]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[1]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_1                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[1]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[1]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[1]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[1]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[1]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[1]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_1                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[1]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[1]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_1                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_1                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_1                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[1]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[1]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[1]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[1]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[1]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[1]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[1]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[1]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[1]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[1]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[1]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[1]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[1]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[1]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[1]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[1]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[1]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[1]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[1]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_1                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_1                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[1]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[1]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[1]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[1] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[1]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[1]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[1]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[1]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[1]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[1]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[1]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[1]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[1]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[1]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[1]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[1]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[1]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[1]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[1]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[1]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[1]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[1]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[1]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[1]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[1]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[1]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[1]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[1]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[1]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[1]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[1]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[1]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[1]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[1]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[1]                               )
);


// &ConnRule(s/_x$/[2]/); @260
// &ConnRule(s/_v$/_2/); @261
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_2"); @262
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_2 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[2]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[2]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[2]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[2]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_2                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[2]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[2]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[2]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[2]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_2                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[2]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[2]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_2                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[2]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[2]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[2]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[2]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[2]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[2]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[2]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[2]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[2]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[2]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_2                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[2]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[2]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[2]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[2]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_2                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[2]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[2]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[2]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[2]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[2]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[2]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_2                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[2]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[2]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_2                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_2                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_2                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[2]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[2]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[2]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[2]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[2]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[2]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[2]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[2]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[2]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[2]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[2]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[2]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[2]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[2]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[2]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[2]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[2]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[2]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[2]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_2                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_2                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[2]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[2]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[2]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[2] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[2]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[2]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[2]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[2]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[2]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[2]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[2]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[2]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[2]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[2]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[2]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[2]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[2]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[2]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[2]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[2]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[2]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[2]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[2]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[2]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[2]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[2]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[2]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[2]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[2]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[2]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[2]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[2]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[2]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[2]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[2]                               )
);


// &ConnRule(s/_x$/[3]/); @264
// &ConnRule(s/_v$/_3/); @265
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_3"); @266
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_3 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[3]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[3]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[3]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[3]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_3                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[3]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[3]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[3]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[3]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_3                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[3]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[3]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_3                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[3]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[3]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[3]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[3]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[3]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[3]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[3]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[3]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[3]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[3]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_3                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[3]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[3]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[3]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[3]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_3                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[3]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[3]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[3]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[3]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[3]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[3]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_3                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[3]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[3]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_3                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_3                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_3                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[3]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[3]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[3]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[3]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[3]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[3]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[3]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[3]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[3]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[3]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[3]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[3]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[3]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[3]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[3]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[3]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[3]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[3]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[3]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_3                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_3                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[3]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[3]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[3]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[3] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[3]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[3]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[3]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[3]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[3]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[3]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[3]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[3]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[3]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[3]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[3]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[3]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[3]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[3]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[3]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[3]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[3]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[3]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[3]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[3]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[3]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[3]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[3]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[3]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[3]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[3]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[3]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[3]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[3]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[3]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[3]                               )
);


// &ConnRule(s/_x$/[4]/); @268
// &ConnRule(s/_v$/_4/); @269
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_4"); @270
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_4 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[4]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[4]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[4]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[4]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_4                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[4]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[4]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[4]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[4]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_4                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[4]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[4]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_4                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[4]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[4]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[4]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[4]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[4]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[4]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[4]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[4]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[4]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[4]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_4                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[4]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[4]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[4]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[4]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_4                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[4]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[4]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[4]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[4]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[4]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[4]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_4                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[4]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[4]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_4                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_4                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_4                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[4]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[4]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[4]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[4]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[4]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[4]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[4]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[4]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[4]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[4]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[4]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[4]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[4]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[4]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[4]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[4]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[4]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[4]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[4]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_4                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_4                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[4]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[4]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[4]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[4] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[4]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[4]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[4]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[4]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[4]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[4]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[4]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[4]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[4]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[4]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[4]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[4]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[4]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[4]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[4]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[4]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[4]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[4]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[4]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[4]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[4]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[4]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[4]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[4]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[4]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[4]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[4]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[4]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[4]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[4]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[4]                               )
);


// &ConnRule(s/_x$/[5]/); @272
// &ConnRule(s/_v$/_5/); @273
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_5"); @274
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_5 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[5]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[5]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[5]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[5]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_5                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[5]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[5]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[5]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[5]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_5                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[5]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[5]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_5                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[5]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[5]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[5]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[5]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[5]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[5]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[5]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[5]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[5]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[5]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_5                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[5]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[5]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[5]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[5]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_5                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[5]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[5]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[5]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[5]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[5]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[5]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_5                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[5]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[5]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_5                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_5                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_5                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[5]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[5]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[5]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[5]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[5]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[5]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[5]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[5]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[5]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[5]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[5]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[5]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[5]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[5]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[5]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[5]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[5]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[5]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[5]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_5                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_5                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[5]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[5]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[5]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[5] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[5]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[5]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[5]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[5]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[5]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[5]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[5]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[5]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[5]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[5]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[5]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[5]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[5]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[5]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[5]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[5]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[5]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[5]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[5]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[5]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[5]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[5]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[5]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[5]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[5]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[5]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[5]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[5]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[5]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[5]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[5]                               )
);


// &ConnRule(s/_x$/[6]/); @276
// &ConnRule(s/_v$/_6/); @277
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_6"); @278
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_6 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[6]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[6]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[6]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[6]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_6                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[6]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[6]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[6]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[6]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_6                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[6]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[6]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_6                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[6]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[6]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[6]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[6]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[6]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[6]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[6]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[6]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[6]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[6]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_6                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[6]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[6]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[6]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[6]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_6                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[6]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[6]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[6]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[6]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[6]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[6]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_6                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[6]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[6]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_6                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_6                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_6                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[6]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[6]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[6]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[6]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[6]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[6]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[6]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[6]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[6]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[6]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[6]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[6]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[6]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[6]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[6]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[6]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[6]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[6]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[6]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_6                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_6                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[6]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[6]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[6]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[6] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[6]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[6]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[6]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[6]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[6]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[6]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[6]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[6]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[6]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[6]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[6]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[6]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[6]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[6]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[6]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[6]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[6]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[6]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[6]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[6]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[6]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[6]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[6]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[6]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[6]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[6]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[6]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[6]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[6]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[6]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[6]                               )
);


// &ConnRule(s/_x$/[7]/); @280
// &ConnRule(s/_v$/_7/); @281
// &Instance("ct_lsu_wmb_entry","x_ct_lsu_wmb_entry_7"); @282
ct_lsu_wmb_entry  x_ct_lsu_wmb_entry_7 (
  .biu_lsu_b_id                                    (biu_lsu_b_id                                   ),
  .biu_lsu_b_vld                                   (biu_lsu_b_vld                                  ),
  .biu_lsu_r_id                                    (biu_lsu_r_id                                   ),
  .biu_lsu_r_vld                                   (biu_lsu_r_vld                                  ),
  .bus_arb_wmb_aw_grnt                             (bus_arb_wmb_aw_grnt                            ),
  .bus_arb_wmb_w_grnt                              (bus_arb_wmb_w_grnt                             ),
  .cp0_lsu_icg_en                                  (cp0_lsu_icg_en                                 ),
  .cp0_yy_clk_en                                   (cp0_yy_clk_en                                  ),
  .cpurst_b                                        (cpurst_b                                       ),
  .dcache_dirty_din                                (dcache_dirty_din                               ),
  .dcache_dirty_gwen                               (dcache_dirty_gwen                              ),
  .dcache_dirty_wen                                (dcache_dirty_wen                               ),
  .dcache_idx                                      (dcache_idx                                     ),
  .dcache_snq_st_sel                               (dcache_snq_st_sel                              ),
  .dcache_tag_din                                  (dcache_tag_din                                 ),
  .dcache_tag_gwen                                 (dcache_tag_gwen                                ),
  .dcache_tag_wen                                  (dcache_tag_wen                                 ),
  .forever_cpuclk                                  (forever_cpuclk                                 ),
  .ld_dc_addr0                                     (ld_dc_addr0                                    ),
  .ld_dc_addr1_11to4                               (ld_dc_addr1_11to4                              ),
  .ld_dc_bytes_vld                                 (ld_dc_bytes_vld                                ),
  .ld_dc_chk_atomic_inst_vld                       (ld_dc_chk_atomic_inst_vld                      ),
  .ld_dc_chk_ld_inst_vld                           (ld_dc_chk_ld_inst_vld                          ),
  .lm_state_is_ex_wait_lock                        (lm_state_is_ex_wait_lock                       ),
  .lm_state_is_idle                                (lm_state_is_idle                               ),
  .pad_yy_icg_scan_en                              (pad_yy_icg_scan_en                             ),
  .pfu_biu_req_addr                                (pfu_biu_req_addr                               ),
  .pw_merge_stall                                  (pw_merge_stall                                 ),
  .rb_biu_req_addr                                 (rb_biu_req_addr                                ),
  .rb_biu_req_unmask                               (rb_biu_req_unmask                              ),
  .rtu_lsu_async_flush                             (rtu_lsu_async_flush                            ),
  .snq_can_create_snq_uncheck                      (snq_can_create_snq_uncheck                     ),
  .snq_create_addr                                 (snq_create_addr                                ),
  .sq_pop_addr                                     (sq_pop_addr                                    ),
  .sq_pop_priv_mode                                (sq_pop_priv_mode                               ),
  .sq_wmb_merge_req                                (sq_wmb_merge_req                               ),
  .sq_wmb_merge_stall_req                          (sq_wmb_merge_stall_req                         ),
  .vb_wmb_empty                                    (vb_wmb_empty                                   ),
  .vb_wmb_entry_rcl_done_x                         (vb_wmb_entry_rcl_done[7]                       ),
  .wmb_b_resp_exokay                               (wmb_b_resp_exokay                              ),
  .wmb_biu_ar_id                                   (wmb_biu_ar_id                                  ),
  .wmb_biu_aw_id                                   (wmb_biu_aw_id                                  ),
  .wmb_biu_write_en                                (wmb_biu_write_en                               ),
  .wmb_ce_addr                                     (wmb_ce_addr                                    ),
  .wmb_ce_atomic                                   (wmb_ce_atomic                                  ),
  .wmb_ce_bkpta_data                               (wmb_ce_bkpta_data                              ),
  .wmb_ce_bkptb_data                               (wmb_ce_bkptb_data                              ),
  .wmb_ce_bytes_vld                                (wmb_ce_bytes_vld                               ),
  .wmb_ce_bytes_vld_full                           (wmb_ce_bytes_vld_full                          ),
  .wmb_ce_create_vld                               (wmb_ce_create_vld                              ),
  .wmb_ce_data128                                  (wmb_ce_data128                                 ),
  .wmb_ce_data_vld                                 (wmb_ce_data_vld                                ),
  .wmb_ce_dcache_inst                              (wmb_ce_dcache_inst                             ),
  .wmb_ce_fence_mode                               (wmb_ce_fence_mode                              ),
  .wmb_ce_icc                                      (wmb_ce_icc                                     ),
  .wmb_ce_iid                                      (wmb_ce_iid                                     ),
  .wmb_ce_inst_flush                               (wmb_ce_inst_flush                              ),
  .wmb_ce_inst_mode                                (wmb_ce_inst_mode                               ),
  .wmb_ce_inst_size                                (wmb_ce_inst_size                               ),
  .wmb_ce_inst_type                                (wmb_ce_inst_type                               ),
  .wmb_ce_last_addr_plus                           (wmb_ce_last_addr_plus                          ),
  .wmb_ce_last_addr_sub                            (wmb_ce_last_addr_sub                           ),
  .wmb_ce_merge_en                                 (wmb_ce_merge_en                                ),
  .wmb_ce_page_buf                                 (wmb_ce_page_buf                                ),
  .wmb_ce_page_ca                                  (wmb_ce_page_ca                                 ),
  .wmb_ce_page_sec                                 (wmb_ce_page_sec                                ),
  .wmb_ce_page_share                               (wmb_ce_page_share                              ),
  .wmb_ce_page_so                                  (wmb_ce_page_so                                 ),
  .wmb_ce_page_wa                                  (wmb_ce_page_wa                                 ),
  .wmb_ce_priv_mode                                (wmb_ce_priv_mode                               ),
  .wmb_ce_sc_wb_vld                                (wmb_ce_sc_wb_vld                               ),
  .wmb_ce_spec_fail                                (wmb_ce_spec_fail                               ),
  .wmb_ce_sync_fence                               (wmb_ce_sync_fence                              ),
  .wmb_ce_update_dcache_dirty                      (wmb_ce_update_dcache_dirty                     ),
  .wmb_ce_update_dcache_share                      (wmb_ce_update_dcache_share                     ),
  .wmb_ce_update_dcache_valid                      (wmb_ce_update_dcache_valid                     ),
  .wmb_ce_update_dcache_way                        (wmb_ce_update_dcache_way                       ),
  .wmb_ce_update_same_dcache_line                  (wmb_ce_update_same_dcache_line                 ),
  .wmb_ce_update_same_dcache_line_ptr              (wmb_ce_update_same_dcache_line_ptr             ),
  .wmb_ce_vstart_vld                               (wmb_ce_vstart_vld                              ),
  .wmb_ce_wb_cmplt_success                         (wmb_ce_wb_cmplt_success                        ),
  .wmb_ce_wb_data_success                          (wmb_ce_wb_data_success                         ),
  .wmb_ce_write_imme                               (wmb_ce_write_imme                              ),
  .wmb_create_ptr_next1_x                          (wmb_create_ptr_next1[7]                        ),
  .wmb_create_vb_success                           (wmb_create_vb_success                          ),
  .wmb_data_ptr_x                                  (wmb_data_ptr[7]                                ),
  .wmb_dcache_arb_req_unmask                       (wmb_dcache_arb_req_unmask                      ),
  .wmb_dcache_inst_write_req_hit_idx               (wmb_dcache_inst_write_req_hit_idx              ),
  .wmb_dcache_req_ptr_x                            (wmb_dcache_req_ptr[7]                          ),
  .wmb_entry_addr_v                                (wmb_entry_addr_7                               ),
  .wmb_entry_ar_pending_x                          (wmb_entry_ar_pending[7]                        ),
  .wmb_entry_atomic_and_vld_x                      (wmb_entry_atomic_and_vld[7]                    ),
  .wmb_entry_atomic_x                              (wmb_entry_atomic[7]                            ),
  .wmb_entry_aw_pending_x                          (wmb_entry_aw_pending[7]                        ),
  .wmb_entry_biu_id_v                              (wmb_entry_biu_id_7                             ),
  .wmb_entry_bkpta_data_x                          (wmb_entry_bkpta_data[7]                        ),
  .wmb_entry_bkptb_data_x                          (wmb_entry_bkptb_data[7]                        ),
  .wmb_entry_bytes_vld_v                           (wmb_entry_bytes_vld_7                          ),
  .wmb_entry_cancel_acc_req_x                      (wmb_entry_cancel_acc_req[7]                    ),
  .wmb_entry_create_data_vld_x                     (wmb_entry_create_data_vld[7]                   ),
  .wmb_entry_create_dp_vld_x                       (wmb_entry_create_dp_vld[7]                     ),
  .wmb_entry_create_gateclk_en_x                   (wmb_entry_create_gateclk_en[7]                 ),
  .wmb_entry_create_vld_x                          (wmb_entry_create_vld[7]                        ),
  .wmb_entry_data_biu_req_x                        (wmb_entry_data_biu_req[7]                      ),
  .wmb_entry_data_ptr_after_write_shift_imme_x     (wmb_entry_data_ptr_after_write_shift_imme[7]   ),
  .wmb_entry_data_ptr_with_write_shift_imme_x      (wmb_entry_data_ptr_with_write_shift_imme[7]    ),
  .wmb_entry_data_req_wns_x                        (wmb_entry_data_req_wns[7]                      ),
  .wmb_entry_data_req_x                            (wmb_entry_data_req[7]                          ),
  .wmb_entry_data_v                                (wmb_entry_data_7                               ),
  .wmb_entry_dcache_inst_x                         (wmb_entry_dcache_inst[7]                       ),
  .wmb_entry_dcache_way_x                          (wmb_entry_dcache_way[7]                        ),
  .wmb_entry_depd_x                                (wmb_entry_depd[7]                              ),
  .wmb_entry_discard_req_x                         (wmb_entry_discard_req[7]                       ),
  .wmb_entry_fwd_bytes_vld_v                       (wmb_entry_fwd_bytes_vld_7                      ),
  .wmb_entry_fwd_data_pe_gateclk_en_x              (wmb_entry_fwd_data_pe_gateclk_en[7]            ),
  .wmb_entry_fwd_data_pe_req_x                     (wmb_entry_fwd_data_pe_req[7]                   ),
  .wmb_entry_fwd_req_x                             (wmb_entry_fwd_req[7]                           ),
  .wmb_entry_hit_sq_pop_dcache_line_x              (wmb_entry_hit_sq_pop_dcache_line[7]            ),
  .wmb_entry_icc_and_vld_x                         (wmb_entry_icc_and_vld[7]                       ),
  .wmb_entry_icc_x                                 (wmb_entry_icc[7]                               ),
  .wmb_entry_iid_v                                 (wmb_entry_iid_7                                ),
  .wmb_entry_inst_flush_x                          (wmb_entry_inst_flush[7]                        ),
  .wmb_entry_inst_is_dcache_x                      (wmb_entry_inst_is_dcache[7]                    ),
  .wmb_entry_inst_mode_v                           (wmb_entry_inst_mode_7                          ),
  .wmb_entry_inst_size_v                           (wmb_entry_inst_size_7                          ),
  .wmb_entry_inst_type_v                           (wmb_entry_inst_type_7                          ),
  .wmb_entry_last_addr_plus_x                      (wmb_entry_last_addr_plus[7]                    ),
  .wmb_entry_last_addr_sub_x                       (wmb_entry_last_addr_sub[7]                     ),
  .wmb_entry_mem_set_write_gateclk_en_x            (wmb_entry_mem_set_write_gateclk_en[7]          ),
  .wmb_entry_mem_set_write_grnt_x                  (wmb_entry_mem_set_write_grnt[7]                ),
  .wmb_entry_merge_data_addr_hit_x                 (wmb_entry_merge_data_addr_hit[7]               ),
  .wmb_entry_merge_data_stall_x                    (wmb_entry_merge_data_stall[7]                  ),
  .wmb_entry_merge_data_vld_x                      (wmb_entry_merge_data_vld[7]                    ),
  .wmb_entry_merge_data_wait_not_vld_req_x         (wmb_entry_merge_data_wait_not_vld_req[7]       ),
  .wmb_entry_next_nc_bypass_x                      (wmb_entry_next_nc_bypass[7]                    ),
  .wmb_entry_next_so_bypass_x                      (wmb_entry_next_so_bypass[7]                    ),
  .wmb_entry_no_op_x                               (wmb_entry_no_op[7]                             ),
  .wmb_entry_page_buf_x                            (wmb_entry_page_buf[7]                          ),
  .wmb_entry_page_ca_x                             (wmb_entry_page_ca[7]                           ),
  .wmb_entry_page_sec_x                            (wmb_entry_page_sec[7]                          ),
  .wmb_entry_page_share_x                          (wmb_entry_page_share[7]                        ),
  .wmb_entry_page_so_x                             (wmb_entry_page_so[7]                           ),
  .wmb_entry_page_wa_x                             (wmb_entry_page_wa[7]                           ),
  .wmb_entry_pfu_biu_req_hit_idx_x                 (wmb_entry_pfu_biu_req_hit_idx[7]               ),
  .wmb_entry_pop_vld_x                             (wmb_entry_pop_vld[7]                           ),
  .wmb_entry_preg_v                                (wmb_entry_preg_7                               ),
  .wmb_entry_priv_mode_v                           (wmb_entry_priv_mode_7                          ),
  .wmb_entry_rb_biu_req_hit_idx_x                  (wmb_entry_rb_biu_req_hit_idx[7]                ),
  .wmb_entry_read_dp_req_x                         (wmb_entry_read_dp_req[7]                       ),
  .wmb_entry_read_ptr_chk_idx_shift_imme_x         (wmb_entry_read_ptr_chk_idx_shift_imme[7]       ),
  .wmb_entry_read_ptr_unconditional_shift_imme_x   (wmb_entry_read_ptr_unconditional_shift_imme[7] ),
  .wmb_entry_read_req_x                            (wmb_entry_read_req[7]                          ),
  .wmb_entry_read_resp_ready_x                     (wmb_entry_read_resp_ready[7]                   ),
  .wmb_entry_ready_to_dcache_line_x                (wmb_entry_ready_to_dcache_line[7]              ),
  .wmb_entry_sc_wb_success_x                       (wmb_entry_sc_wb_success[7]                     ),
  .wmb_entry_snq_depd_remove_x                     (wmb_entry_snq_depd_remove[7]                   ),
  .wmb_entry_snq_depd_x                            (wmb_entry_snq_depd[7]                          ),
  .wmb_entry_spec_fail_x                           (wmb_entry_spec_fail[7]                         ),
  .wmb_entry_sync_fence_biu_req_success_x          (wmb_entry_sync_fence_biu_req_success[7]        ),
  .wmb_entry_sync_fence_inst_x                     (wmb_entry_sync_fence_inst[7]                   ),
  .wmb_entry_sync_fence_x                          (wmb_entry_sync_fence[7]                        ),
  .wmb_entry_vld_x                                 (wmb_entry_vld[7]                               ),
  .wmb_entry_vstart_vld_x                          (wmb_entry_vstart_vld[7]                        ),
  .wmb_entry_w_last_set_x                          (wmb_entry_w_last_set[7]                        ),
  .wmb_entry_w_last_x                              (wmb_entry_w_last[7]                            ),
  .wmb_entry_w_pending_x                           (wmb_entry_w_pending[7]                         ),
  .wmb_entry_wb_cmplt_grnt_x                       (wmb_entry_wb_cmplt_grnt[7]                     ),
  .wmb_entry_wb_cmplt_req_x                        (wmb_entry_wb_cmplt_req[7]                      ),
  .wmb_entry_wb_data_grnt_x                        (wmb_entry_wb_data_grnt[7]                      ),
  .wmb_entry_wb_data_req_x                         (wmb_entry_wb_data_req[7]                       ),
  .wmb_entry_write_biu_dp_req_x                    (wmb_entry_write_biu_dp_req[7]                  ),
  .wmb_entry_write_biu_req_x                       (wmb_entry_write_biu_req[7]                     ),
  .wmb_entry_write_dcache_req_x                    (wmb_entry_write_dcache_req[7]                  ),
  .wmb_entry_write_imme_bypass_x                   (wmb_entry_write_imme_bypass[7]                 ),
  .wmb_entry_write_imme_x                          (wmb_entry_write_imme[7]                        ),
  .wmb_entry_write_ptr_chk_idx_shift_imme_x        (wmb_entry_write_ptr_chk_idx_shift_imme[7]      ),
  .wmb_entry_write_ptr_unconditional_shift_imme_x  (wmb_entry_write_ptr_unconditional_shift_imme[7]),
  .wmb_entry_write_req_x                           (wmb_entry_write_req[7]                         ),
  .wmb_entry_write_stall_x                         (wmb_entry_write_stall[7]                       ),
  .wmb_entry_write_vb_req_x                        (wmb_entry_write_vb_req[7]                      ),
  .wmb_read_ptr_read_req_grnt                      (wmb_read_ptr_read_req_grnt                     ),
  .wmb_read_ptr_shift_imme_grnt                    (wmb_read_ptr_shift_imme_grnt                   ),
  .wmb_read_ptr_x                                  (wmb_read_ptr[7]                                ),
  .wmb_same_line_resp_ready                        (wmb_same_line_resp_ready                       ),
  .wmb_wakeup_queue_not_empty                      (wmb_wakeup_queue_not_empty                     ),
  .wmb_write_biu_dcache_line                       (wmb_write_biu_dcache_line                      ),
  .wmb_write_dcache_success                        (wmb_write_dcache_success                       ),
  .wmb_write_ptr_shift_imme_grnt                   (wmb_write_ptr_shift_imme_grnt                  ),
  .wmb_write_ptr_x                                 (wmb_write_ptr[7]                               )
);


//==========================================================
//                  Maintain pointer
//==========================================================
//----------------------registers---------------------------
//circular bit is to check whether write/read/data ptr equal to create_ptr
//+------------+
//| create_ptr |
//+------------+
always @(posedge wmb_create_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_create_ptr[WMB_ENTRY-1:0] <=  {{WMB_ENTRY-1{1'b0}},1'b1};
  else if(wmb_create_vld)
    wmb_create_ptr[WMB_ENTRY-1:0] <=  wmb_create_ptr_next1[WMB_ENTRY-1:0];
end

always @(posedge wmb_create_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_create_ptr_circular       <=  1'b0;
  else if(wmb_create_vld  &&  wmb_create_ptr[WMB_ENTRY-1])
    wmb_create_ptr_circular       <=  !wmb_create_ptr_circular;
end

//+----------+
//| read_ptr |
//+----------+
always @(posedge wmb_read_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_read_ptr[WMB_ENTRY-1:0]       <=  {{WMB_ENTRY-1{1'b0}},1'b1};
  else if(wmb_read_ptr_shift_vld)
    wmb_read_ptr[WMB_ENTRY-1:0]       <=  wmb_read_ptr_next1[WMB_ENTRY-1:0];
end

always @(posedge wmb_read_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_read_ptr_circular             <=  1'b0;
  else if(wmb_read_ptr_shift_vld  &&  wmb_read_ptr[WMB_ENTRY-1])
    wmb_read_ptr_circular             <=  !wmb_read_ptr_circular;
end

//+-----------+
//| write_ptr |
//+-----------+
// &Force("output","wmb_write_ptr"); @330
always @(posedge wmb_write_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_write_ptr[WMB_ENTRY-1:0]      <=  {{WMB_ENTRY-1{1'b0}},1'b1};
  else
    wmb_write_ptr[WMB_ENTRY-1:0]      <=  wmb_write_ptr_set[WMB_ENTRY-1:0];
end

always @(posedge wmb_write_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_write_ptr_circular            <=  1'b0;
  else
    wmb_write_ptr_circular            <=  wmb_write_ptr_circular_set;
end

//+----------+
//| data_ptr |
//+----------+
always @(posedge wmb_data_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_data_ptr[WMB_ENTRY-1:0]       <=  {{WMB_ENTRY-1{1'b0}},1'b1};
  else if(wmb_data_ptr_shift_vld)
    wmb_data_ptr[WMB_ENTRY-1:0]       <=  wmb_data_ptr_next1[WMB_ENTRY-1:0];
end

always @(posedge wmb_data_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_data_ptr_circular             <=  1'b0;
  else if(wmb_data_ptr_shift_vld  &&  wmb_data_ptr[WMB_ENTRY-1])
    wmb_data_ptr_circular             <=  !wmb_data_ptr_circular;
end

//------------------write ptr set---------------------------
//if snq clear read req, then read ptr must be set write_ptr_set
// &CombBeg; @368
always @( wmb_write_ptr_next1[7:0]
       or wmb_write_ptr[7:0]
       or wmb_write_ptr_shift_vld)
begin
if(wmb_write_ptr_shift_vld)
  wmb_write_ptr_set[WMB_ENTRY-1:0]  = wmb_write_ptr_next1[WMB_ENTRY-1:0];
else
  wmb_write_ptr_set[WMB_ENTRY-1:0]  = wmb_write_ptr[WMB_ENTRY-1:0];
// &CombEnd; @373
end

// &CombBeg; @375
always @( wmb_write_ptr_circular_set_vld
       or wmb_write_ptr_circular)
begin
if(wmb_write_ptr_circular_set_vld)
  wmb_write_ptr_circular_set  = !wmb_write_ptr_circular;
else
  wmb_write_ptr_circular_set  = wmb_write_ptr_circular;
// &CombEnd; @380
end
//------------------pointer encode--------------------------
// &Instance("ct_rtu_encode_8","x_lsu_wmb_read_ptr_encode"); @382
ct_rtu_encode_8  x_lsu_wmb_read_ptr_encode (
  .x_num                    (wmb_read_ptr_encode[2:0]),
  .x_num_expand             (wmb_read_ptr[7:0]       )
);

// &Connect( .x_num          (wmb_read_ptr_encode[2:0]   ), @383
//           .x_num_expand   (wmb_read_ptr[7:0]          )); @384


// &Force("output","wmb_write_ptr_encode"); @387
// &Instance("ct_rtu_encode_8","x_lsu_wmb_write_ptr_encode"); @388
ct_rtu_encode_8  x_lsu_wmb_write_ptr_encode (
  .x_num                     (wmb_write_ptr_encode[2:0]),
  .x_num_expand              (wmb_write_ptr[7:0]       )
);

// &Connect( .x_num          (wmb_write_ptr_encode[2:0]  ), @389
//           .x_num_expand   (wmb_write_ptr[7:0]         )); @390

// &Instance("ct_rtu_encode_8","x_lsu_wmb_write_ptr_next3_encode"); @392
ct_rtu_encode_8  x_lsu_wmb_write_ptr_next3_encode (
  .x_num                           (wmb_write_ptr_next3_encode[2:0]),
  .x_num_expand                    (wmb_write_ptr_next3[7:0]       )
);

// &Connect( .x_num          (wmb_write_ptr_next3_encode[2:0]  ), @393
//           .x_num_expand   (wmb_write_ptr_next3[7:0]         )); @394

//------------------condition wires-------------------------
assign wmb_write_burst_neg = (wmb_write_req_addr[5:4] ==  2'b11);

assign wmb_write_req_addr_dcache_begin  = (wmb_write_req_addr[5:4] ==  2'b11)
                                              && wmb_write_req_next1_addr_sub
                                              && wmb_write_req_next2_addr_sub
                                              && wmb_write_req_next3_addr_sub
                                          ||  (wmb_write_req_addr[5:4] ==  2'b0)
                                              && wmb_write_req_next1_addr_plus
                                              && wmb_write_req_next2_addr_plus
                                              && wmb_write_req_next3_addr_plus;

//------------has read resp in next 4 entry-----------------
assign write_burst_en = !cp0_lsu_wr_burst_dis;

assign wmb_write_biu_dcache_line  = write_burst_en
                                    &&  wmb_write_req_addr_dcache_begin
                                    &&  wmb_write_req_ready_to_dcache_line
                                    &&  wmb_write_req_next1_ready_to_dcache_line
                                    &&  wmb_write_req_next2_ready_to_dcache_line
                                    &&  wmb_write_req_next3_ready_to_dcache_line;

assign wmb_read_grnt            = bus_arb_wmb_ar_grnt;
assign wmb_read_ptr_unconditional_shift_imme  = |wmb_entry_read_ptr_unconditional_shift_imme[WMB_ENTRY-1:0];
assign wmb_read_ptr_chk_idx_shift_imme        = |wmb_entry_read_ptr_chk_idx_shift_imme[WMB_ENTRY-1:0];

assign wmb_create_vb_success    = wmb_vb_create_vld &&  vb_wmb_create_grnt;
assign wmb_write_grnt           = bus_arb_wmb_aw_grnt
//                                  ||  wmb_write_dcache_success
                                  ||  wmb_create_vb_success;
assign wmb_write_req            = |wmb_entry_write_req[WMB_ENTRY-1:0];
assign wmb_write_ptr_unconditional_shift_imme = |wmb_entry_write_ptr_unconditional_shift_imme[WMB_ENTRY-1:0];
assign wmb_write_ptr_chk_idx_shift_imme       = |wmb_entry_write_ptr_chk_idx_shift_imme[WMB_ENTRY-1:0];
assign wmb_data_grnt            = bus_arb_wmb_w_grnt;
//                                  ||  wmb_write_dcache_success;
assign wmb_data_req             = |wmb_entry_data_req[WMB_ENTRY-1:0];
assign wmb_data_ptr_after_write_shift_imme    = |wmb_entry_data_ptr_after_write_shift_imme[WMB_ENTRY-1:0];
assign wmb_data_ptr_with_write_shift_imme     = |wmb_entry_data_ptr_with_write_shift_imme[WMB_ENTRY-1:0];
//-----------------shift condition wires--------------------
assign wmb_read_ptr_shift_imme_grnt = !wmb_read_ptr_met_create
                                      &&  (wmb_read_ptr_unconditional_shift_imme
                                          ||  wmb_read_ptr_chk_idx_shift_imme
                                              &&  !wmb_read_req_hit_idx);

assign wmb_read_ptr_read_req_grnt   = wmb_read_grnt
                                      &&  (!wmb_read_req_ctc_inst
                                          ||  wmb_read_req_ctc_end);

assign wmb_read_ptr_shift_vld   = wmb_read_ptr_read_req_grnt
                                  ||  wmb_read_ptr_shift_imme_grnt;

//all shift imme don't see wmb write imme, because write_imme only effective
//to wo st
assign wmb_write_ptr_shift_imme_grnt  = !wmb_write_ptr_met_create
                                        //&&  wmb_write_imme
                                        &&  (wmb_write_ptr_unconditional_shift_imme
                                            ||  wmb_write_ptr_chk_idx_shift_imme
                                                &&  !wmb_write_req_hit_idx);

assign wmb_write_ptr_shift_vld  = wmb_write_grnt
                                  ||  wmb_write_ptr_shift_imme_grnt;
//set circular
assign wmb_write_ptr_circular_set_vld = wmb_write_ptr_shift_vld
                                        &&  wmb_write_ptr[WMB_ENTRY-1];

assign wmb_data_ptr_shift_vld   = wmb_data_grnt &&  wmb_data_req
                                  ||  !wmb_data_ptr_met_create
                                      &&  (wmb_data_ptr_after_write_shift_imme
                                          ||  wmb_data_ptr_with_write_shift_imme
                                              &&  wmb_write_ptr_shift_imme_grnt);
//------------------other pointer---------------------------
assign wmb_create_ptr_next1[WMB_ENTRY-1:0]  = {wmb_create_ptr[WMB_ENTRY-2:0],
                                              wmb_create_ptr[WMB_ENTRY-1]};
//assign wmb_create_ptr_next2[WMB_ENTRY-1:0]  = {wmb_create_ptr[WMB_ENTRY-3:0],
//                                              wmb_create_ptr[WMB_ENTRY-1:WMB_ENTRY-2]};
//assign wmb_create_ptr_next3[WMB_ENTRY-1:0]  = {wmb_create_ptr[WMB_ENTRY-4:0],
//                                              wmb_create_ptr[WMB_ENTRY-1:WMB_ENTRY-3]};
//assign wmb_create_ptr_next4[WMB_ENTRY-1:0]  = {wmb_create_ptr[WMB_ENTRY-5:0],
//                                              wmb_create_ptr[WMB_ENTRY-1:WMB_ENTRY-4]};
//assign wmb_create_ptr_next5[WMB_ENTRY-1:0]  = {wmb_create_ptr[WMB_ENTRY-6:0],
//                                              wmb_create_ptr[WMB_ENTRY-1:WMB_ENTRY-5]};
//assign wmb_create_ptr_next6[WMB_ENTRY-1:0]  = {wmb_create_ptr[WMB_ENTRY-7:0],
//                                              wmb_create_ptr[WMB_ENTRY-1:WMB_ENTRY-6]};
//assign wmb_create_ptr_next7[WMB_ENTRY-1:0]  = {wmb_create_ptr[WMB_ENTRY-8:0],
//                                              wmb_create_ptr[WMB_ENTRY-1:WMB_ENTRY-7]};

//assign wmb_read_ptr_and_vld[WMB_ENTRY-1:0]  = wmb_read_ptr[WMB_ENTRY-1:0]
//                                              & wmb_entry_vld[WMB_ENTRY-1:0];
//assign wmb_read_ptr_vld                     = |wmb_read_ptr_and_vld[WMB_ENTRY-1:0];
assign wmb_read_ptr_next1[WMB_ENTRY-1:0]    = {wmb_read_ptr[WMB_ENTRY-2:0],
                                              wmb_read_ptr[WMB_ENTRY-1]};
//mem set must use write_ptr_to_next_3
assign wmb_write_ptr_next1[WMB_ENTRY-1:0]   = {wmb_write_ptr[WMB_ENTRY-2:0],
                                              wmb_write_ptr[WMB_ENTRY-1]};
assign wmb_write_ptr_next2[WMB_ENTRY-1:0]   = {wmb_write_ptr[WMB_ENTRY-3:0],
                                              wmb_write_ptr[WMB_ENTRY-1:WMB_ENTRY-2]};
assign wmb_write_ptr_next3[WMB_ENTRY-1:0]   = {wmb_write_ptr[WMB_ENTRY-4:0],
                                              wmb_write_ptr[WMB_ENTRY-1:WMB_ENTRY-3]};
assign wmb_write_ptr_next4[WMB_ENTRY-1:0]   = {wmb_write_ptr[WMB_ENTRY-5:0],
                                              wmb_write_ptr[WMB_ENTRY-1:WMB_ENTRY-4]};
assign wmb_write_ptr_next5[WMB_ENTRY-1:0]   = {wmb_write_ptr[WMB_ENTRY-6:0],
                                              wmb_write_ptr[WMB_ENTRY-1:WMB_ENTRY-5]};
assign wmb_write_ptr_next6[WMB_ENTRY-1:0]   = {wmb_write_ptr[WMB_ENTRY-7:0],
                                              wmb_write_ptr[WMB_ENTRY-1:WMB_ENTRY-6]};
assign wmb_write_ptr_next7[WMB_ENTRY-1:0]   = {wmb_write_ptr[0],
                                              wmb_write_ptr[WMB_ENTRY-1:WMB_ENTRY-7]};
assign wmb_write_ptr_to_next3[WMB_ENTRY-1:0]  = wmb_write_ptr_next3[WMB_ENTRY-1:0]
                                                | wmb_write_ptr_next2[WMB_ENTRY-1:0]
                                                | wmb_write_ptr_next1[WMB_ENTRY-1:0]
                                                | wmb_write_ptr[WMB_ENTRY-1:0];

assign wmb_data_ptr_next1[WMB_ENTRY-1:0]    = {wmb_data_ptr[WMB_ENTRY-2:0],
                                              wmb_data_ptr[WMB_ENTRY-1]};

//-------------judge if meet create signal------------------
assign wmb_read_ptr_met_create  = (wmb_read_ptr[WMB_ENTRY-1:0]  ==  wmb_create_ptr[WMB_ENTRY-1:0])
                                  &&  (wmb_read_ptr_circular  ==  wmb_create_ptr_circular);

assign wmb_write_ptr_met_create = (wmb_write_ptr[WMB_ENTRY-1:0] ==  wmb_create_ptr[WMB_ENTRY-1:0])
                                  &&  (wmb_write_ptr_circular ==  wmb_create_ptr_circular);

assign wmb_data_ptr_met_create  = (wmb_data_ptr[WMB_ENTRY-1:0]  ==  wmb_create_ptr[WMB_ENTRY-1:0])
                                  &&  (wmb_data_ptr_circular  ==  wmb_create_ptr_circular);

//==========================================================
//          Generate signal for sq pop
//==========================================================
//----------------can't merge signal------------------------
assign wmb_has_dcache_inst      = |(wmb_entry_dcache_inst[WMB_ENTRY-1:0]
                                    & wmb_entry_vld[WMB_ENTRY-1:0]);
//------------------merge signal----------------------------
assign wmb_merge_data_stall     = |wmb_entry_merge_data_stall[WMB_ENTRY-1:0];
assign wmb_merge_data_addr_hit  = |wmb_entry_merge_data_addr_hit[WMB_ENTRY-1:0];
//assign wmb_hit_sq_pop_dcache_line = |wmb_entry_hit_sq_pop_dcache_line[WMB_ENTRY-1:0];
//------------------wmb ce create signal--------------------
assign wmb_ce_create_merge      = sq_wmb_merge_req
                                  &&  (wmb_merge_data_addr_hit
                                      ||  wmb_ce_merge_data_addr_hit);
assign wmb_ce_create_stall      = wmb_merge_data_stall
                                  ||  wmb_ce_merge_data_stall
                                  ||  (wmb_merge_data_addr_hit
                                          ||  wmb_ce_merge_data_addr_hit)
                                      &&  (sq_wmb_merge_stall_req
                                          ||  wmb_has_dcache_inst);
assign wmb_ce_create_same_dcache_line[WMB_ENTRY-1:0] =  {WMB_ENTRY{wmb_ce_hit_sq_pop_dcache_line && wmb_create_vld}}
                                                        & wmb_create_ptr[WMB_ENTRY-1:0]
                                                        |  wmb_entry_hit_sq_pop_dcache_line[WMB_ENTRY-1:0]; 
assign wmb_ce_create_merge_ptr[WMB_ENTRY-1:0] = (wmb_ce_create_wmb_dp_req  &&  wmb_ce_merge_data_addr_hit)
                                                ? wmb_create_ptr[WMB_ENTRY-1:0]
                                                : wmb_entry_merge_data_addr_hit[WMB_ENTRY-1:0];

assign wmb_pop_to_ce_permit     = wmb_sq_pop_grnt
                                  ||  !wmb_ce_vld;
// &Force("output","wmb_ce_create_vld"); @549
assign wmb_ce_create_vld        = sq_wmb_pop_to_ce_req
                                  &&  wmb_pop_to_ce_permit;
// &Force("output","wmb_ce_create_dp_vld"); @552
assign wmb_ce_create_dp_vld     = sq_wmb_pop_to_ce_dp_req
                                  &&  wmb_pop_to_ce_permit;
assign wmb_ce_create_gateclk_en = sq_wmb_pop_to_ce_gateclk_en
                                  &&  wmb_pop_to_ce_permit;

//for wmb entry
assign wmb_ce_update_same_dcache_line_ptr[WMB_ENTRY-1:0] = wmb_ce_same_dcache_line[WMB_ENTRY-1:0] 
                                                           & wmb_entry_vld[WMB_ENTRY-1:0];
assign wmb_ce_update_same_dcache_line = |wmb_ce_update_same_dcache_line_ptr[WMB_ENTRY-1:0]; 
//----------------------to sq-------------------------------
assign wmb_sq_pop_to_ce_grnt    = sq_wmb_pop_to_ce_req
                                  &&  wmb_pop_to_ce_permit;

//==========================================================
//          Generate grnt signal for wmb ce
//==========================================================
//------------------grnt signal-----------------------------
assign wmb_create_not_vld[WMB_ENTRY-1:0]    = wmb_create_ptr[WMB_ENTRY-1:0]
                                              & (~wmb_entry_vld[WMB_ENTRY-1:0]);
assign wmb_create_permit    = |wmb_create_not_vld[WMB_ENTRY-1:0];

assign wmb_create_vld       = wmb_create_permit
                              &&  wmb_ce_create_wmb_req;
assign wmb_merge_vld        = wmb_ce_merge_wmb_req;
assign wmb_entry_merge_data_vld[WMB_ENTRY-1:0]  = {WMB_ENTRY{wmb_merge_vld}}
                                                  & wmb_ce_merge_ptr[WMB_ENTRY-1:0];
assign wmb_entry_merge_data_wait_not_vld_req[WMB_ENTRY-1:0]  =
                {WMB_ENTRY{wmb_ce_merge_wmb_wait_not_vld_req}}
                & wmb_ce_merge_ptr[WMB_ENTRY-1:0];

// &Force("output","wmb_sq_pop_grnt"); @583
assign wmb_sq_pop_grnt      = wmb_create_vld
                              ||  wmb_merge_vld;
assign wmb_ce_pop_vld       = wmb_sq_pop_grnt;

//------------------create signal---------------------------
assign wmb_entry_create_vld[WMB_ENTRY-1:0]        = wmb_create_not_vld[WMB_ENTRY-1:0]
                                                    & {WMB_ENTRY{wmb_ce_create_wmb_req}};
assign wmb_entry_create_dp_vld[WMB_ENTRY-1:0]     = wmb_create_not_vld[WMB_ENTRY-1:0]
                                                    & {WMB_ENTRY{wmb_ce_create_wmb_dp_req}};
assign wmb_entry_create_gateclk_en[WMB_ENTRY-1:0] = wmb_create_not_vld[WMB_ENTRY-1:0]
                                                    & {WMB_ENTRY{wmb_ce_create_wmb_gateclk_en}};
assign wmb_entry_create_data_vld[WMB_ENTRY-1:0]   = wmb_create_not_vld[WMB_ENTRY-1:0]
                                                    & {WMB_ENTRY{wmb_ce_create_wmb_data_req}};

//==========================================================
//        Select signal from read/write/data ptr
//==========================================================
//-----------------read req info----------------------------wmb_entry_inst_flush
assign wmb_read_req_unmask          = |wmb_entry_read_req[WMB_ENTRY-1:0];
assign wmb_read_req_atomic              = |(wmb_read_ptr[WMB_ENTRY-1:0] & wmb_entry_atomic[WMB_ENTRY-1:0]);
assign wmb_read_req_icc             = |(wmb_read_ptr[WMB_ENTRY-1:0] & wmb_entry_icc[WMB_ENTRY-1:0]);
assign wmb_read_req_inst_is_dcache  = |(wmb_read_ptr[WMB_ENTRY-1:0] & wmb_entry_inst_is_dcache[WMB_ENTRY-1:0]);
assign wmb_read_req_inst_type[1:0]  = {2{wmb_read_ptr[0]}}  & wmb_entry_inst_type_0[1:0]
                                      | {2{wmb_read_ptr[1]}}  & wmb_entry_inst_type_1[1:0]
                                      | {2{wmb_read_ptr[2]}}  & wmb_entry_inst_type_2[1:0]
                                      | {2{wmb_read_ptr[3]}}  & wmb_entry_inst_type_3[1:0]
                                      | {2{wmb_read_ptr[4]}}  & wmb_entry_inst_type_4[1:0]
                                      | {2{wmb_read_ptr[5]}}  & wmb_entry_inst_type_5[1:0]
                                      | {2{wmb_read_ptr[6]}}  & wmb_entry_inst_type_6[1:0]
                                      | {2{wmb_read_ptr[7]}}  & wmb_entry_inst_type_7[1:0];

assign wmb_read_req_inst_size[1:0]  = {2{wmb_read_ptr[0]}}  & wmb_entry_inst_size_0[1:0]
                                      | {2{wmb_read_ptr[1]}}  & wmb_entry_inst_size_1[1:0]
                                      | {2{wmb_read_ptr[2]}}  & wmb_entry_inst_size_2[1:0]
                                      | {2{wmb_read_ptr[3]}}  & wmb_entry_inst_size_3[1:0]
                                      | {2{wmb_read_ptr[4]}}  & wmb_entry_inst_size_4[1:0]
                                      | {2{wmb_read_ptr[5]}}  & wmb_entry_inst_size_5[1:0]
                                      | {2{wmb_read_ptr[6]}}  & wmb_entry_inst_size_6[1:0]
                                      | {2{wmb_read_ptr[7]}}  & wmb_entry_inst_size_7[1:0];

assign wmb_read_req_inst_mode[1:0]  = {2{wmb_read_ptr[0]}}  & wmb_entry_inst_mode_0[1:0]
                                      | {2{wmb_read_ptr[1]}}  & wmb_entry_inst_mode_1[1:0]
                                      | {2{wmb_read_ptr[2]}}  & wmb_entry_inst_mode_2[1:0]
                                      | {2{wmb_read_ptr[3]}}  & wmb_entry_inst_mode_3[1:0]
                                      | {2{wmb_read_ptr[4]}}  & wmb_entry_inst_mode_4[1:0]
                                      | {2{wmb_read_ptr[5]}}  & wmb_entry_inst_mode_5[1:0]
                                      | {2{wmb_read_ptr[6]}}  & wmb_entry_inst_mode_6[1:0]
                                      | {2{wmb_read_ptr[7]}}  & wmb_entry_inst_mode_7[1:0];
assign wmb_read_req_data[15:0]      = {16{wmb_read_ptr[0]}}  & wmb_entry_data_0[15:0]
                                      | {16{wmb_read_ptr[1]}}  & wmb_entry_data_1[15:0]
                                      | {16{wmb_read_ptr[2]}}  & wmb_entry_data_2[15:0]
                                      | {16{wmb_read_ptr[3]}}  & wmb_entry_data_3[15:0]
                                      | {16{wmb_read_ptr[4]}}  & wmb_entry_data_4[15:0]
                                      | {16{wmb_read_ptr[5]}}  & wmb_entry_data_5[15:0]
                                      | {16{wmb_read_ptr[6]}}  & wmb_entry_data_6[15:0]
                                      | {16{wmb_read_ptr[7]}}  & wmb_entry_data_7[15:0];
assign wmb_read_req_priv_mode[1:0]  = {2{wmb_read_ptr[0]}}  & wmb_entry_priv_mode_0[1:0]
                                      | {2{wmb_read_ptr[1]}}  & wmb_entry_priv_mode_1[1:0]
                                      | {2{wmb_read_ptr[2]}}  & wmb_entry_priv_mode_2[1:0]
                                      | {2{wmb_read_ptr[3]}}  & wmb_entry_priv_mode_3[1:0]
                                      | {2{wmb_read_ptr[4]}}  & wmb_entry_priv_mode_4[1:0]
                                      | {2{wmb_read_ptr[5]}}  & wmb_entry_priv_mode_5[1:0]
                                      | {2{wmb_read_ptr[6]}}  & wmb_entry_priv_mode_6[1:0]
                                      | {2{wmb_read_ptr[7]}}  & wmb_entry_priv_mode_7[1:0];



assign wmb_read_req_page_share      = |(wmb_read_ptr[WMB_ENTRY-1:0] & wmb_entry_page_share[WMB_ENTRY-1:0]);
assign wmb_read_req_page_sec        = |(wmb_read_ptr[WMB_ENTRY-1:0] & wmb_entry_page_sec[WMB_ENTRY-1:0]);

assign wmb_read_dp_req_next1        = |(wmb_read_ptr_next1[WMB_ENTRY-1:0] & wmb_entry_read_dp_req[WMB_ENTRY-1:0]);
assign wmb_read_req_addr_next1[`PA_WIDTH-1:0] = {`PA_WIDTH{wmb_read_ptr_next1[0]}} & wmb_entry_addr_0[`PA_WIDTH-1:0]
                                                | {`PA_WIDTH{wmb_read_ptr_next1[1]}} & wmb_entry_addr_1[`PA_WIDTH-1:0]
                                                | {`PA_WIDTH{wmb_read_ptr_next1[2]}} & wmb_entry_addr_2[`PA_WIDTH-1:0]
                                                | {`PA_WIDTH{wmb_read_ptr_next1[3]}} & wmb_entry_addr_3[`PA_WIDTH-1:0]
                                                | {`PA_WIDTH{wmb_read_ptr_next1[4]}} & wmb_entry_addr_4[`PA_WIDTH-1:0]
                                                | {`PA_WIDTH{wmb_read_ptr_next1[5]}} & wmb_entry_addr_5[`PA_WIDTH-1:0]
                                                | {`PA_WIDTH{wmb_read_ptr_next1[6]}} & wmb_entry_addr_6[`PA_WIDTH-1:0]
                                                | {`PA_WIDTH{wmb_read_ptr_next1[7]}} & wmb_entry_addr_7[`PA_WIDTH-1:0];

//-----------------write req info---------------------------
assign wmb_write_imme_bypass        = |wmb_entry_write_imme_bypass[WMB_ENTRY-1:0];
assign wmb_write_imme_other_bypass  = |(wmb_entry_write_imme_bypass[WMB_ENTRY-1:0]
                                        & ~wmb_write_ptr[WMB_ENTRY-1:0]);
assign wmb_write_biu_req_unmask     = |wmb_entry_write_biu_req[WMB_ENTRY-1:0];
//assign wmb_write_dcache_req         = |wmb_entry_write_dcache_req[WMB_ENTRY-1:0];
assign wmb_write_vb_req_unmask      = |wmb_entry_write_vb_req[WMB_ENTRY-1:0];
//assign wmb_write_req_sync_fence       = |(wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_sync_fence[WMB_ENTRY-1:0]);
assign wmb_write_req_inst_type[1:0] = {2{wmb_write_ptr[0]}}  & wmb_entry_inst_type_0[1:0]
                                      | {2{wmb_write_ptr[1]}}  & wmb_entry_inst_type_1[1:0]
                                      | {2{wmb_write_ptr[2]}}  & wmb_entry_inst_type_2[1:0]
                                      | {2{wmb_write_ptr[3]}}  & wmb_entry_inst_type_3[1:0]
                                      | {2{wmb_write_ptr[4]}}  & wmb_entry_inst_type_4[1:0]
                                      | {2{wmb_write_ptr[5]}}  & wmb_entry_inst_type_5[1:0]
                                      | {2{wmb_write_ptr[6]}}  & wmb_entry_inst_type_6[1:0]
                                      | {2{wmb_write_ptr[7]}}  & wmb_entry_inst_type_7[1:0];

assign wmb_write_req_inst_size[2:0] = {3{wmb_write_ptr[0]}}  & wmb_entry_inst_size_0[2:0]
                                      | {3{wmb_write_ptr[1]}}  & wmb_entry_inst_size_1[2:0]
                                      | {3{wmb_write_ptr[2]}}  & wmb_entry_inst_size_2[2:0]
                                      | {3{wmb_write_ptr[3]}}  & wmb_entry_inst_size_3[2:0]
                                      | {3{wmb_write_ptr[4]}}  & wmb_entry_inst_size_4[2:0]
                                      | {3{wmb_write_ptr[5]}}  & wmb_entry_inst_size_5[2:0]
                                      | {3{wmb_write_ptr[6]}}  & wmb_entry_inst_size_6[2:0]
                                      | {3{wmb_write_ptr[7]}}  & wmb_entry_inst_size_7[2:0];

assign wmb_write_req_inst_mode[1:0] = {2{wmb_write_ptr[0]}}  & wmb_entry_inst_mode_0[1:0]
                                      | {2{wmb_write_ptr[1]}}  & wmb_entry_inst_mode_1[1:0]
                                      | {2{wmb_write_ptr[2]}}  & wmb_entry_inst_mode_2[1:0]
                                      | {2{wmb_write_ptr[3]}}  & wmb_entry_inst_mode_3[1:0]
                                      | {2{wmb_write_ptr[4]}}  & wmb_entry_inst_mode_4[1:0]
                                      | {2{wmb_write_ptr[5]}}  & wmb_entry_inst_mode_5[1:0]
                                      | {2{wmb_write_ptr[6]}}  & wmb_entry_inst_mode_6[1:0]
                                      | {2{wmb_write_ptr[7]}}  & wmb_entry_inst_mode_7[1:0];
assign wmb_write_req_priv_mode[1:0] = {2{wmb_write_ptr[0]}}  & wmb_entry_priv_mode_0[1:0]
                                      | {2{wmb_write_ptr[1]}}  & wmb_entry_priv_mode_1[1:0]
                                      | {2{wmb_write_ptr[2]}}  & wmb_entry_priv_mode_2[1:0]
                                      | {2{wmb_write_ptr[3]}}  & wmb_entry_priv_mode_3[1:0]
                                      | {2{wmb_write_ptr[4]}}  & wmb_entry_priv_mode_4[1:0]
                                      | {2{wmb_write_ptr[5]}}  & wmb_entry_priv_mode_5[1:0]
                                      | {2{wmb_write_ptr[6]}}  & wmb_entry_priv_mode_6[1:0]
                                      | {2{wmb_write_ptr[7]}}  & wmb_entry_priv_mode_7[1:0];

//assign wmb_write_req_page_share     = |(wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_page_share[WMB_ENTRY-1:0]);
assign wmb_write_req_page_so        = |(wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_page_so[WMB_ENTRY-1:0]);
//assign wmb_write_req_page_ca        = |(wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_page_ca[WMB_ENTRY-1:0]);
assign wmb_write_req_page_wa        = |(wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_page_wa[WMB_ENTRY-1:0]);
assign wmb_write_req_page_buf       = |(wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_page_buf[WMB_ENTRY-1:0]);
assign wmb_write_req_page_sec       = |(wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_page_sec[WMB_ENTRY-1:0]);
assign wmb_write_biu_dp_req_next1   = |(wmb_write_ptr_next1[WMB_ENTRY-1:0] & wmb_entry_write_biu_dp_req[WMB_ENTRY-1:0]);
assign wmb_write_req_atomic_next1   = |(wmb_write_ptr_next1[WMB_ENTRY-1:0] & wmb_entry_atomic_and_vld[WMB_ENTRY-1:0]);
assign wmb_write_req_icc_next1      = |(wmb_write_ptr_next1[WMB_ENTRY-1:0] & wmb_entry_icc_and_vld[WMB_ENTRY-1:0]);

assign wmb_write_req_sync_fence_next1 = |(wmb_write_ptr_next1[WMB_ENTRY-1:0] & wmb_entry_sync_fence[WMB_ENTRY-1:0]);
assign wmb_write_req_page_ca_next1    = |(wmb_write_ptr_next1[WMB_ENTRY-1:0] & wmb_entry_page_ca[WMB_ENTRY-1:0]);
assign wmb_write_req_page_share_next1 = |(wmb_write_ptr_next1[WMB_ENTRY-1:0] & wmb_entry_page_share[WMB_ENTRY-1:0]);
assign wmb_write_req_addr_next1[`PA_WIDTH-1:0]  = {`PA_WIDTH{wmb_write_ptr_next1[0]}} & wmb_entry_addr_0[`PA_WIDTH-1:0]
                                                  | {`PA_WIDTH{wmb_write_ptr_next1[1]}} & wmb_entry_addr_1[`PA_WIDTH-1:0]
                                                  | {`PA_WIDTH{wmb_write_ptr_next1[2]}} & wmb_entry_addr_2[`PA_WIDTH-1:0]
                                                  | {`PA_WIDTH{wmb_write_ptr_next1[3]}} & wmb_entry_addr_3[`PA_WIDTH-1:0]
                                                  | {`PA_WIDTH{wmb_write_ptr_next1[4]}} & wmb_entry_addr_4[`PA_WIDTH-1:0]
                                                  | {`PA_WIDTH{wmb_write_ptr_next1[5]}} & wmb_entry_addr_5[`PA_WIDTH-1:0]
                                                  | {`PA_WIDTH{wmb_write_ptr_next1[6]}} & wmb_entry_addr_6[`PA_WIDTH-1:0]
                                                  | {`PA_WIDTH{wmb_write_ptr_next1[7]}} & wmb_entry_addr_7[`PA_WIDTH-1:0];
//-----------------------inst type--------------------------
assign wmb_write_req_st_inst        = !wmb_write_req_atomic
                                      &&  !wmb_write_req_sync_fence
                                      &&  !wmb_write_req_icc;
assign wmb_write_req_stex_inst      = wmb_write_req_atomic;

//for write dcache_line check
assign wmb_write_req_ready_to_dcache_line       = |(wmb_write_ptr[WMB_ENTRY-1:0]
                                                    & wmb_entry_ready_to_dcache_line[WMB_ENTRY-1:0]);
assign wmb_write_req_next1_ready_to_dcache_line = |(wmb_write_ptr_next1[WMB_ENTRY-1:0]
                                                    & wmb_entry_ready_to_dcache_line[WMB_ENTRY-1:0]);
assign wmb_write_req_next2_ready_to_dcache_line = |(wmb_write_ptr_next2[WMB_ENTRY-1:0]
                                                    & wmb_entry_ready_to_dcache_line[WMB_ENTRY-1:0]);
assign wmb_write_req_next3_ready_to_dcache_line = |(wmb_write_ptr_next3[WMB_ENTRY-1:0]
                                                    & wmb_entry_ready_to_dcache_line[WMB_ENTRY-1:0]);

//addr plus or sub
assign wmb_write_req_next1_addr_plus = |(wmb_write_ptr_next1[WMB_ENTRY-1:0]
                                         & wmb_entry_last_addr_plus[WMB_ENTRY-1:0]);
assign wmb_write_req_next2_addr_plus = |(wmb_write_ptr_next2[WMB_ENTRY-1:0]
                                         & wmb_entry_last_addr_plus[WMB_ENTRY-1:0]);
assign wmb_write_req_next3_addr_plus = |(wmb_write_ptr_next3[WMB_ENTRY-1:0]
                                         & wmb_entry_last_addr_plus[WMB_ENTRY-1:0]);

assign wmb_write_req_next1_addr_sub  = |(wmb_write_ptr_next1[WMB_ENTRY-1:0]
                                          & wmb_entry_last_addr_sub[WMB_ENTRY-1:0]);
assign wmb_write_req_next2_addr_sub  = |(wmb_write_ptr_next2[WMB_ENTRY-1:0]
                                          & wmb_entry_last_addr_sub[WMB_ENTRY-1:0]);
assign wmb_write_req_next3_addr_sub  = |(wmb_write_ptr_next3[WMB_ENTRY-1:0]
                                         & wmb_entry_last_addr_sub[WMB_ENTRY-1:0]);

assign wmb_write_req_page_nc_atomic     = !wmb_write_req_page_ca  &&  wmb_write_req_atomic;
//-----------------data req info----------------------------
assign wmb_data_biu_req             = |wmb_entry_data_biu_req[WMB_ENTRY-1:0];
assign wmb_data_req_wns             = |wmb_entry_data_req_wns[WMB_ENTRY-1:0];
assign wmb_data_req_biu_id[4:0]     = {5{wmb_data_ptr[0]}}  & wmb_entry_biu_id_0[4:0]
                                      | {5{wmb_data_ptr[1]}}  & wmb_entry_biu_id_1[4:0]
                                      | {5{wmb_data_ptr[2]}}  & wmb_entry_biu_id_2[4:0]
                                      | {5{wmb_data_ptr[3]}}  & wmb_entry_biu_id_3[4:0]
                                      | {5{wmb_data_ptr[4]}}  & wmb_entry_biu_id_4[4:0]
                                      | {5{wmb_data_ptr[5]}}  & wmb_entry_biu_id_5[4:0]
                                      | {5{wmb_data_ptr[6]}}  & wmb_entry_biu_id_6[4:0]
                                      | {5{wmb_data_ptr[7]}}  & wmb_entry_biu_id_7[4:0];

// &CombBeg; @772
always @( wmb_data_ptr[7:0]
       or wmb_entry_data_1[127:0]
       or wmb_entry_data_2[127:0]
       or wmb_entry_data_0[127:0]
       or wmb_entry_data_4[127:0]
       or wmb_entry_data_3[127:0]
       or wmb_entry_data_7[127:0]
       or wmb_entry_data_5[127:0]
       or wmb_entry_data_6[127:0])
begin
case(wmb_data_ptr[7:0])
  8'h01:  wmb_data_req_data[127:0] = wmb_entry_data_0[127:0];
  8'h02:  wmb_data_req_data[127:0] = wmb_entry_data_1[127:0];
  8'h04:  wmb_data_req_data[127:0] = wmb_entry_data_2[127:0];
  8'h08:  wmb_data_req_data[127:0] = wmb_entry_data_3[127:0];
  8'h10:  wmb_data_req_data[127:0] = wmb_entry_data_4[127:0];
  8'h20:  wmb_data_req_data[127:0] = wmb_entry_data_5[127:0];
  8'h40:  wmb_data_req_data[127:0] = wmb_entry_data_6[127:0];
  8'h80:  wmb_data_req_data[127:0] = wmb_entry_data_7[127:0];
  default:wmb_data_req_data[127:0] = {128{1'bx}};
endcase
// &CombEnd; @784
end

assign wmb_data_req_bytes_vld[15:0] = {16{wmb_data_ptr[0]}} & wmb_entry_bytes_vld_0[15:0]
                                      | {16{wmb_data_ptr[1]}} & wmb_entry_bytes_vld_1[15:0]
                                      | {16{wmb_data_ptr[2]}} & wmb_entry_bytes_vld_2[15:0]
                                      | {16{wmb_data_ptr[3]}} & wmb_entry_bytes_vld_3[15:0]
                                      | {16{wmb_data_ptr[4]}} & wmb_entry_bytes_vld_4[15:0]
                                      | {16{wmb_data_ptr[5]}} & wmb_entry_bytes_vld_5[15:0]
                                      | {16{wmb_data_ptr[6]}} & wmb_entry_bytes_vld_6[15:0]
                                      | {16{wmb_data_ptr[7]}} & wmb_entry_bytes_vld_7[15:0];

assign wmb_data_req_w_last          = |(wmb_data_ptr[WMB_ENTRY-1:0] & wmb_entry_w_last[WMB_ENTRY-1:0]);

//==========================================================
//              write imme signal pop entry
//==========================================================
//wmb vld                                 mechanism
//<=5                                     write leisure(!ld_ag && !st_ag)
//>=6                                     write imme
//                                        if (st_ag && st_rf),
//                                        then write 2 cycle
//amr and >=4                             write amr
//-----------------------registers--------------------------
//if wmb too full and must write dcache, and st_ag/rf has inst, then write
//2 cycle to reduce st out of order
always @(posedge wmb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_write_imme_hold <=  1'b0;
  else if(wmb_write_imme_hold_set)
    wmb_write_imme_hold <=  1'b1;
  else
    wmb_write_imme_hold <=  1'b0;
end

//if sq pop write imme, then wmb_write_imme set immediately
always @(posedge wmb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_write_imme    <=  1'b0;
  else if(wmb_create_write_imme_set ||  wmb_write_imme_other_bypass)
    wmb_write_imme    <=  1'b1;
  else if(wmb_write_imme_amr_clr || wmb_write_imme_clr)
    wmb_write_imme    <=  1'b0;
  else if(wmb_write_imme_set)
    wmb_write_imme    <=  1'b1;
end

//------------------------signals---------------------------
assign wmb_write_imme_hold_set  = !wmb_write_imme_hold
                                  &&  !wmb_write_imme_amr_clr
                                  &&  !wmb_write_imme_clr
                                  &&  wmb_write_imme_bypass //entry >= 6
                                  &&  st_rf_inst_vld
                                  &&  st_ag_inst_vld;//may cause out of order

assign wmb_create_write_imme_set  = wmb_ce_create_wmb_req  &&  wmb_ce_write_imme;
assign wmb_write_imme_set = icc_wmb_write_imme
                            ||  cp0_lsu_no_op_req
                            ||  wmb_write_imme_bypass
                            ||  wmb_write_imme_hold
                            ||  !wmb_write_imme
                                &&  wmb_write_imme_ori;

assign wmb_write_imme_ori     = |wmb_entry_write_imme[WMB_ENTRY-1:0];
assign wmb_other_write_imme   = |(~wmb_write_ptr[WMB_ENTRY-1:0] & wmb_entry_write_imme[WMB_ENTRY-1:0]);
assign wmb_other4_write_imme  = |(~wmb_write_ptr_to_next3[WMB_ENTRY-1:0] & wmb_entry_write_imme[WMB_ENTRY-1:0]);

assign wmb_write_imme_amr_clr = !wmb_other4_write_imme
                                &&  wmb_mem_set_write_grnt;

assign wmb_write_imme_clr     = !wmb_other_write_imme
                                    &&  !wmb_write_imme_hold
                                    &&  wmb_write_ptr_shift_vld
                                ||  wmb_empty;

assign wmb_write_dcache_permit= wmb_write_imme
                                ||  !st_ag_inst_vld
                                    &&  !ld_ag_inst_vld;

//==========================================================
//            generate reset_read_ptr_req logic
//==========================================================
//if (wmb_reset_read_ptr_req_ff && wmb_ctc_secd)
//  then wmb_reset_read_ptr_req_ff hold, and send read req
//else if (wmb_reset_read_ptr_req_ff && !wmb_ctc_secd)
//  then wmb_reset_read_ptr_req_ff clear, and do not send read req
//--------------------reset_ptr_req_ff----------------------
//no need anymore
//==========================================================
//                last create pop entry
//==========================================================
//used for write burst
always @(posedge wmb_create_ptr_clk)
begin
  if(wmb_create_vld)
    wmb_last_create_addr[`PA_WIDTH-1:0]   <=  wmb_ce_addr[`PA_WIDTH-1:0];
end
//---------------------entry create signal------------------------
assign wmb_ce_last_addr_eq_high = (wmb_ce_addr[`PA_WIDTH-1:6] == wmb_last_create_addr[`PA_WIDTH-1:6]);

assign wmb_last_addr_plus[1:0] = wmb_last_create_addr[5:4] + 2'd1;
assign wmb_last_addr_sub[1:0]  = wmb_last_create_addr[5:4] - 2'd1;

assign wmb_ce_last_addr_plus = wmb_ce_last_addr_eq_high
                               && (wmb_ce_addr[5:4] == wmb_last_addr_plus[1:0]);
assign wmb_ce_last_addr_sub  = wmb_ce_last_addr_eq_high
                               && (wmb_ce_addr[5:4] == wmb_last_addr_sub[1:0]);

//==========================================================
//                Read ptr pop entry
//==========================================================
//+-------------+
//| read_dp_req |
//+-------------+
always @(posedge wmb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_read_dp_req           <=  1'b0;
  else if(wmb_empty &&  !wmb_ce_vld)
    wmb_read_dp_req           <=  1'b0;
  else if(dcache_vb_snq_gwen)
    wmb_read_dp_req           <=  1'b1;
  else if(wmb_read_pop_up_wmb_ce_vld)
    wmb_read_dp_req           <=  wmb_ce_read_dp_req;
  else if(wmb_read_ptr_next1_met_create &&  wmb_read_ptr_shift_vld)
    wmb_read_dp_req           <=  1'b0;
  else if(wmb_read_ptr_shift_vld)
    wmb_read_dp_req           <=  wmb_read_dp_req_next1;
end

//+---------------+
//| read_req_addr |
//+---------------+
// &Force("output","wmb_read_req_addr"); @918
always @(posedge wmb_read_pop_clk)
begin
  if(wmb_read_pop_up_wmb_ce_vld)
    wmb_read_req_addr[`PA_WIDTH-1:0]   <=  wmb_ce_addr[`PA_WIDTH-1:0];
  else if(wmb_read_ptr_shift_vld)
    wmb_read_req_addr[`PA_WIDTH-1:0]   <=  wmb_read_req_addr_next1[`PA_WIDTH-1:0];
end

//---------------------update signal------------------------
assign wmb_read_ptr_next1_met_create  = wmb_create_ptr[WMB_ENTRY-1:0]
                                        ==  wmb_read_ptr_next1[WMB_ENTRY-1:0];

assign wmb_read_pop_up_wmb_ce_vld     = wmb_ce_create_wmb_dp_req
                                        &&  (wmb_read_ptr_met_create
                                            ||  wmb_read_ptr_next1_met_create
                                                &&  wmb_read_ptr_shift_vld);

//for same_dcache_line
assign wmb_same_line_resp_ready[WMB_ENTRY-1:0] = wmb_entry_read_resp_ready[WMB_ENTRY-1:0]; 
//==========================================================
//                Write ptr pop entry
//==========================================================
//+------------------+
//| write_biu_dp_req |
//+------------------+
always @(posedge wmb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_write_biu_dp_req      <=  1'b0;
  else if(wmb_empty &&  !wmb_ce_vld)
    wmb_write_biu_dp_req      <=  1'b0;
  else if(dcache_vb_snq_gwen || wmb_write_dcache_req_icc_inst)
    wmb_write_biu_dp_req      <=  1'b1;
  else if(wmb_write_pop_up_wmb_ce_vld)
    wmb_write_biu_dp_req      <=  wmb_ce_write_biu_dp_req;
  else if(wmb_mem_set_write_grnt)
    wmb_write_biu_dp_req      <=  1'b1;
  else if(wmb_write_ptr_shift_vld)
    wmb_write_biu_dp_req      <=  wmb_write_biu_dp_req_next1;
end

//+----------------+
//| write_pop_addr |
//+----------------+
// &Force("output","wmb_write_req_addr"); @963
// &Force("output","wmb_write_req_icc"); @964
// //&Force("output","wmb_write_req_atomic"); @965
always @(posedge wmb_write_pop_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    wmb_write_req_atomic              <=  1'b0;
    wmb_write_req_icc                 <=  1'b0;
    wmb_write_req_sync_fence          <=  1'b0;
    wmb_write_req_page_ca             <=  1'b0;
    wmb_write_req_page_share          <=  1'b0;
  end
  else
  begin
    wmb_write_req_atomic              <=  wmb_write_req_atomic_set;
    wmb_write_req_icc                 <=  wmb_write_req_icc_set;
    wmb_write_req_sync_fence          <=  wmb_write_req_sync_fence_set;
    wmb_write_req_page_ca             <=  wmb_write_req_page_ca_set;
    wmb_write_req_page_share          <=  wmb_write_req_page_share_set;
  end
end

always @(posedge wmb_write_pop_clk)
begin
    wmb_write_req_addr[`PA_WIDTH-1:0] <=  wmb_write_req_addr_set[`PA_WIDTH-1:0];
end

// &CombBeg; @991
always @( wmb_write_pop_up_wmb_ce_vld
       or wmb_write_req_addr_next1[39:0]
       or wmb_write_req_page_share_next1
       or wmb_ce_icc
       or wmb_write_req_atomic_next1
       or wmb_write_ptr_shift_vld
       or wmb_write_req_sync_fence_next1
       or wmb_write_req_addr[39:0]
       or wmb_write_req_page_share
       or wmb_ce_page_share
       or wmb_write_req_page_ca
       or wmb_write_req_sync_fence
       or wmb_ce_atomic
       or wmb_write_req_icc_next1
       or wmb_write_req_atomic
       or wmb_write_req_icc
       or wmb_ce_page_ca
       or wmb_write_req_page_ca_next1
       or wmb_ce_addr[39:0]
       or wmb_ce_sync_fence)
begin
if(wmb_write_pop_up_wmb_ce_vld)
begin
  wmb_write_req_atomic_set              = wmb_ce_atomic;
  wmb_write_req_icc_set                 = wmb_ce_icc;
  wmb_write_req_sync_fence_set          = wmb_ce_sync_fence;
  wmb_write_req_page_ca_set             = wmb_ce_page_ca;
  wmb_write_req_page_share_set          = wmb_ce_page_share;
  wmb_write_req_addr_set[`PA_WIDTH-1:0] = wmb_ce_addr[`PA_WIDTH-1:0];
end
else if(wmb_write_ptr_shift_vld)
begin
  wmb_write_req_atomic_set              = wmb_write_req_atomic_next1;
  wmb_write_req_icc_set                 = wmb_write_req_icc_next1;
  wmb_write_req_sync_fence_set          = wmb_write_req_sync_fence_next1;
  wmb_write_req_page_ca_set             = wmb_write_req_page_ca_next1;
  wmb_write_req_page_share_set          = wmb_write_req_page_share_next1;
  wmb_write_req_addr_set[`PA_WIDTH-1:0] = wmb_write_req_addr_next1[`PA_WIDTH-1:0];
end
else
begin
  wmb_write_req_atomic_set              = wmb_write_req_atomic;
  wmb_write_req_icc_set                 = wmb_write_req_icc;
  wmb_write_req_sync_fence_set          = wmb_write_req_sync_fence;
  wmb_write_req_page_ca_set             = wmb_write_req_page_ca;
  wmb_write_req_page_share_set          = wmb_write_req_page_share;
  wmb_write_req_addr_set[`PA_WIDTH-1:0] = wmb_write_req_addr[`PA_WIDTH-1:0];
end
// &CombEnd; @1019
end

//---------------------update signal------------------------
assign wmb_write_ptr_next1_met_create = wmb_create_ptr[WMB_ENTRY-1:0]
                                        ==  wmb_write_ptr_next1[WMB_ENTRY-1:0];

assign wmb_write_pop_up_wmb_ce_vld    = wmb_ce_create_wmb_dp_req
                                        &&  (wmb_write_ptr_met_create
                                            ||  wmb_write_ptr_next1_met_create
                                                &&  wmb_write_ptr_shift_vld);

assign wmb_write_pop_up_wmb_ce_gateclk_en = wmb_ce_create_wmb_gateclk_en
                                            &&  (wmb_write_ptr_met_create
                                                ||  wmb_write_ptr_next1_met_create);

//==========================================================
//        Request biu ar channel(include ctc request)
//==========================================================
//----------------------hit_idx-----------------------------
assign wmb_read_req_hit_idx = snq_create_wmb_read_req_hit_idx
                                  && !lm_state_is_amo_lock
                              ||  snq_wmb_read_req_hit_idx
                              ||  lfb_wmb_read_req_hit_idx;
//-----------------ctc register-----------------------------
always @(posedge wmb_read_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_ctc_secd      <=  1'b0;
  else if(wmb_read_req_ctc_inst &&  !wmb_read_req_ctc_end  &&  bus_arb_wmb_ar_grnt)
    wmb_ctc_secd      <=  1'b1;
  else if(bus_arb_wmb_ar_grnt)
    wmb_ctc_secd      <=  1'b0;
end

//-----------------ctc end singal-----------------------------
assign wmb_read_req_ctc_end = !wmb_biu_ar_addr[0];
//-----------------inst type--------------------------------
assign wmb_read_req_dcache_va_l1_inst = !wmb_read_req_atomic
                                        &&  wmb_read_req_icc
                                        &&  wmb_read_req_inst_is_dcache
                                        &&  (wmb_read_req_inst_mode[1:0]  ==  2'b01)
                                        &&  (wmb_read_req_inst_size[1:0] ==  2'b00);
assign wmb_read_req_ctc_inst        = !wmb_read_req_atomic
                                      &&  wmb_read_req_icc
                                      &&  (wmb_read_req_inst_type[1:0]  !=  2'b10);
assign wmb_read_req_tlbi_inst       = !wmb_read_req_atomic
                                      &&  wmb_read_req_icc
                                      &&  (wmb_read_req_inst_type[1:0]  ==  2'b00);
assign wmb_read_req_tlbi_asid_inst  = wmb_read_req_tlbi_inst
                                      &&  wmb_read_req_inst_mode[0];
assign wmb_read_req_tlbi_va_inst    = wmb_read_req_tlbi_inst
                                      &&  wmb_read_req_inst_mode[1];
assign wmb_read_req_icache_inst     = !wmb_read_req_atomic
                                      &&  wmb_read_req_icc
                                      &&  (wmb_read_req_inst_type[1:0]  ==  2'b01);
assign wmb_read_req_icache_all_inst = wmb_read_req_icache_inst
                                      &&  (wmb_read_req_inst_mode[1:0]  ==  2'b00);
assign wmb_read_req_l2cache_inst    = !wmb_read_req_atomic
                                      &&  wmb_read_req_icc
                                      &&  (wmb_read_req_inst_type[1:0]  ==  2'b11);
//-----------------interface to bus_arb---------------------
assign wmb_biu_ar_req           = wmb_read_req_unmask
                                  &&  (!wmb_read_req_hit_idx
                                      ||  wmb_read_req_ctc_inst);
assign wmb_biu_ar_dp_req        = wmb_read_req_unmask;
assign wmb_biu_ar_req_gateclk_en  = wmb_read_dp_req;
// &Force("output","wmb_biu_ar_id"); @1085
assign wmb_biu_ar_id[4:0]       = wmb_read_req_ctc_inst
                                  ? BIU_R_CTC_ID
                                  : {BIU_R_NORM_ID_T,wmb_read_ptr_encode[2:0]};

//-----------------addr-----------------
assign wmb_biu_ar_tlbi_first_addr[`PA_WIDTH-1:0]  =
               {wmb_read_req_data[15:8],            //ASID[15:8]    39:32
                8'b0,                               //              
                wmb_read_req_data[7:0],             //ASID[7:0]     23:16
                1'b0,                               //              15
                3'b000,                             //TLBI          14:12
                2'b10,                              //Guest?        11:10
                2'b10,                              //non-sec       9:8
                1'b0,                               //              7
                1'b0,                               //`PA_WIDTH-1:24 not vld 6
                wmb_read_req_tlbi_asid_inst,        //23:16 vld     5
                4'b0,                               //              4:1
                wmb_read_req_tlbi_va_inst};         //need secd     0

assign wmb_biu_ar_tlbi_secd_addr[`PA_WIDTH-1:0]  =
                {wmb_read_req_addr[`PA_WIDTH-1:4],  //VA            PA_WIDTH-1:4
                3'b0,                               //              3:1
                1'b0};                              //end           0

assign wmb_biu_ar_icache_first_addr[`PA_WIDTH-1:0]  =
               {24'b0,                              //            PA_WIDTH-1:16
                1'b0,                               //              15
                3'b010,                             //ICACHEI       14:12
                2'b00,                              //Guest?        11:10
                2'b10,                               //              9:8
                1'b0,                               //              7
                2'b0,                               //              6:5
                4'b0,                               //              4:1
                !wmb_read_req_icache_all_inst};     //need secd?    0

assign wmb_biu_ar_icache_secd_addr[`PA_WIDTH-1:0]   = 
                {wmb_read_req_addr[`PA_WIDTH-1:4],  //VA            PA_WIDTH-1:4
                3'b0,                               //              3:1
                1'b0};                              //end           0

assign wmb_biu_ar_l2cache_first_addr[`PA_WIDTH-1:0] =
                {{`PA_WIDTH-24{1'b0}},              //              PA_WIDTH-1:24
                6'b0,                               //              23:18
                wmb_read_req_inst_size[0],          //CLEAR         17
                wmb_read_req_inst_size[1],          //INV           16
                1'b0,                               //              15
                3'b111,                             //L2CACHE       14:12
                2'b10,                              //Guest?        11:10
                2'b10,                              //non-sec       9:8
                1'b0,                               //              7
                1'b0,                               //PA_WIDTH-1:24 not vld 6
                1'b0,                               //23:16 not vld 5
                4'b0,                               //              4:1
                1'b0};                              //end           0
                                          
assign wmb_biu_ar_addr_judge[3:0]     = {wmb_ctc_secd,
                                        wmb_read_req_tlbi_inst,
                                        wmb_read_req_icache_inst,
                                        wmb_read_req_l2cache_inst};

// &Force("output","wmb_biu_ar_addr"); @1146
// &CombBeg; @1147
always @( wmb_read_req_addr[39:6]
       or wmb_biu_ar_tlbi_first_addr[39:0]
       or wmb_biu_ar_icache_first_addr[39:0]
       or wmb_biu_ar_icache_secd_addr[39:0]
       or wmb_biu_ar_l2cache_first_addr[39:0]
       or wmb_biu_ar_tlbi_secd_addr[39:0]
       or wmb_biu_ar_addr_judge[3:0])
begin
wmb_biu_ar_addr[`PA_WIDTH-1:0] = {wmb_read_req_addr[`PA_WIDTH-1:6],6'b0};
casez(wmb_biu_ar_addr_judge[3:0])
  4'b0100:wmb_biu_ar_addr[`PA_WIDTH-1:0] = wmb_biu_ar_tlbi_first_addr[`PA_WIDTH-1:0];
  4'b1100:wmb_biu_ar_addr[`PA_WIDTH-1:0] = wmb_biu_ar_tlbi_secd_addr[`PA_WIDTH-1:0];
  4'b0010:wmb_biu_ar_addr[`PA_WIDTH-1:0] = wmb_biu_ar_icache_first_addr[`PA_WIDTH-1:0];
  4'b1010:wmb_biu_ar_addr[`PA_WIDTH-1:0] = wmb_biu_ar_icache_secd_addr[`PA_WIDTH-1:0];
  4'b0001:wmb_biu_ar_addr[`PA_WIDTH-1:0] = wmb_biu_ar_l2cache_first_addr[`PA_WIDTH-1:0];
  default:wmb_biu_ar_addr[`PA_WIDTH-1:0] = {wmb_read_req_addr[`PA_WIDTH-1:6],6'b0};
endcase
// &CombEnd; @1157
end

//-----------------others-----------------
//ctc   : 1
//other : 3
assign wmb_biu_ar_len[1:0]      = wmb_read_req_ctc_inst
                                  ? 2'b00
                                  : 2'b11;
//128 bits
assign wmb_biu_ar_size[2:0]     = 3'b100;
//increase
assign wmb_biu_ar_burst[1:0]    = 2'b01;
//not exclusive
assign wmb_biu_ar_lock          = 1'b0;

//ctc 0010
//dcache.l1 0011
//others 1111
// &CombBeg; @1175
always @( wmb_read_req_dcache_va_l1_inst
       or wmb_read_req_ctc_inst)
begin
wmb_biu_ar_cache[3:0] = 4'b1111;
case({wmb_read_req_ctc_inst,wmb_read_req_dcache_va_l1_inst})
  2'b10:wmb_biu_ar_cache[3:0] = 4'b0010;
  2'b01:wmb_biu_ar_cache[3:0] = 4'b0011;
  default:wmb_biu_ar_cache[3:0] = 4'b1111;
endcase
// &CombEnd; @1182
end

assign wmb_biu_ar_prot[2:0]     = {1'b0,
                                  wmb_read_req_page_sec,
                                  wmb_read_req_priv_mode[0]};
assign wmb_biu_ar_user[2:0]     = {1'b0,
                                  wmb_read_req_priv_mode[1],
                                  1'b0};

//-----------------snoop----------------
//st cleanunique 1011
//dcache only clr cleanshared  1000
//dcache only clr l1 cleanshared  1000
//dcache clr inv  cleaninvalid 1001
//dcache only inv makeinvalid  1101
//ctc 1111
// &CombBeg; @1198
always @( wmb_read_req_icc
       or wmb_read_req_inst_size[1:0]
       or wmb_read_req_atomic
       or wmb_read_req_inst_type[1:0])
begin
wmb_biu_ar_snoop[3:0] = 4'b1011;
casez({wmb_read_req_atomic,wmb_read_req_icc,wmb_read_req_inst_type[1:0],wmb_read_req_inst_size[1:0]})
  {1'b0,1'b1,2'b10,2'b01}:wmb_biu_ar_snoop[3:0]  = 4'b1000;//CleanShared
  {1'b0,1'b1,2'b10,2'b00}:wmb_biu_ar_snoop[3:0]  = 4'b1000;//CleanShared
  {1'b0,1'b1,2'b10,2'b10}:wmb_biu_ar_snoop[3:0]  = 4'b1101;//MakeInvalid
  {1'b0,1'b1,2'b10,2'b11}:wmb_biu_ar_snoop[3:0]  = 4'b1001;//CleanInvalid
  {1'b0,1'b1,2'b00,2'b??}:wmb_biu_ar_snoop[3:0]  = 4'b1111;//CTC
  {1'b0,1'b1,2'b01,2'b??}:wmb_biu_ar_snoop[3:0]  = 4'b1111;
  {1'b0,1'b1,2'b11,2'b??}:wmb_biu_ar_snoop[3:0]  = 4'b1111;
  default:wmb_biu_ar_snoop[3:0] = 4'b1011;
endcase
// &CombEnd; @1210
end

assign wmb_biu_ar_domain[1:0]   = {1'b0,wmb_read_req_page_share};
assign wmb_biu_ar_bar[1:0]      = 2'b0;

//==========================================================
//                    Request dcache
//==========================================================
//-----------------dcache req ptr---------------------------
assign wmb_write_dcache_pop_up = wmb_write_dcache_success 
                                 || !wmb_write_dcache_pop_req 
                                    && wmb_dcache_req_next; 

assign wmb_dcache_req_ptr[WMB_ENTRY-1:0] = {WMB_ENTRY{wmb_write_dcache_pop_req}} & wmb_write_dcache_ptr[WMB_ENTRY-1:0];
assign wmb_dcache_req_set[WMB_ENTRY-1:0] = wmb_entry_write_dcache_req[WMB_ENTRY-1:0] & ~wmb_dcache_req_ptr[WMB_ENTRY-1:0];

assign wmb_dcache_req_next = |wmb_dcache_req_set[WMB_ENTRY-1:0];                

always @(posedge wmb_write_dcache_pop_clk or negedge cpurst_b)
begin
    if(!cpurst_b)
    wmb_write_dcache_pop_req  <=  1'b0; 
    else if(wmb_write_dcache_pop_up)
    wmb_write_dcache_pop_req  <=  wmb_dcache_req_next; 
end

always @(posedge wmb_write_dcache_pop_clk)
begin
    if(wmb_write_dcache_pop_up)
    begin
    wmb_write_dcache_ptr[WMB_ENTRY-1:0]  <=  wmb_write_dcache_ptr_set[WMB_ENTRY-1:0]; 
    wmb_write_dcache_addr[`PA_WIDTH-1:0] <=  wmb_write_dcache_addr_set[`PA_WIDTH-1:0];
    end
end

//sel dcache req entry
// &CombBeg; @1246
always @( wmb_write_ptr[7:0]
       or wmb_dcache_req_set[7:0])
begin
case(wmb_write_ptr[WMB_ENTRY-1:0])
  8'b00000001:wmb_write_dcache_priority[7:0] = wmb_dcache_req_set[7:0];
  8'b00000010:wmb_write_dcache_priority[7:0] = {wmb_dcache_req_set[0],wmb_dcache_req_set[7:1]};
  8'b00000100:wmb_write_dcache_priority[7:0] = {wmb_dcache_req_set[1:0],wmb_dcache_req_set[7:2]};
  8'b00001000:wmb_write_dcache_priority[7:0] = {wmb_dcache_req_set[2:0],wmb_dcache_req_set[7:3]};
  8'b00010000:wmb_write_dcache_priority[7:0] = {wmb_dcache_req_set[3:0],wmb_dcache_req_set[7:4]};
  8'b00100000:wmb_write_dcache_priority[7:0] = {wmb_dcache_req_set[4:0],wmb_dcache_req_set[7:5]};
  8'b01000000:wmb_write_dcache_priority[7:0] = {wmb_dcache_req_set[5:0],wmb_dcache_req_set[7:6]};
  8'b10000000:wmb_write_dcache_priority[7:0] = {wmb_dcache_req_set[6:0],wmb_dcache_req_set[7]};
  default:    wmb_write_dcache_priority[7:0] = 8'b0;
endcase
// &CombEnd; @1258
end

// &CombBeg; @1260
always @( wmb_write_ptr_next1[7:0]
       or wmb_write_ptr_next7[7:0]
       or wmb_write_ptr_next3[7:0]
       or wmb_write_ptr_next2[7:0]
       or wmb_write_dcache_priority[7:0]
       or wmb_write_ptr_next4[7:0]
       or wmb_write_ptr_next5[7:0]
       or wmb_write_ptr[7:0]
       or wmb_write_ptr_next6[7:0])
begin
casez(wmb_write_dcache_priority[WMB_ENTRY-1:0])
  8'b???????1:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr[WMB_ENTRY-1:0];
  8'b??????10:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr_next1[WMB_ENTRY-1:0];
  8'b?????100:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr_next2[WMB_ENTRY-1:0];
  8'b????1000:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr_next3[WMB_ENTRY-1:0];
  8'b???10000:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr_next4[WMB_ENTRY-1:0];
  8'b??100000:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr_next5[WMB_ENTRY-1:0];
  8'b?1000000:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr_next6[WMB_ENTRY-1:0];
  8'b10000000:wmb_write_dcache_ptr_set[7:0] = wmb_write_ptr_next7[WMB_ENTRY-1:0];
  default:    wmb_write_dcache_ptr_set[7:0] = 8'b0;
endcase
// &CombEnd; @1272
end

assign wmb_write_dcache_addr_set[`PA_WIDTH-1:0]  = {`PA_WIDTH{wmb_write_dcache_ptr_set[0]}} & wmb_entry_addr_0[`PA_WIDTH-1:0]
                                                   | {`PA_WIDTH{wmb_write_dcache_ptr_set[1]}} & wmb_entry_addr_1[`PA_WIDTH-1:0]
                                                   | {`PA_WIDTH{wmb_write_dcache_ptr_set[2]}} & wmb_entry_addr_2[`PA_WIDTH-1:0]
                                                   | {`PA_WIDTH{wmb_write_dcache_ptr_set[3]}} & wmb_entry_addr_3[`PA_WIDTH-1:0]
                                                   | {`PA_WIDTH{wmb_write_dcache_ptr_set[4]}} & wmb_entry_addr_4[`PA_WIDTH-1:0]
                                                   | {`PA_WIDTH{wmb_write_dcache_ptr_set[5]}} & wmb_entry_addr_5[`PA_WIDTH-1:0]
                                                   | {`PA_WIDTH{wmb_write_dcache_ptr_set[6]}} & wmb_entry_addr_6[`PA_WIDTH-1:0]
                                                   | {`PA_WIDTH{wmb_write_dcache_ptr_set[7]}} & wmb_entry_addr_7[`PA_WIDTH-1:0];

//dcache pop signal
assign wmb_write_req_dcache_way     = |(wmb_write_dcache_ptr[WMB_ENTRY-1:0] & wmb_entry_dcache_way[WMB_ENTRY-1:0]);

assign wmb_write_dcache_bytes_vld[15:0] = {16{wmb_write_dcache_ptr[0]}} & wmb_entry_bytes_vld_0[15:0]
                                          | {16{wmb_write_dcache_ptr[1]}} & wmb_entry_bytes_vld_1[15:0]
                                          | {16{wmb_write_dcache_ptr[2]}} & wmb_entry_bytes_vld_2[15:0]
                                          | {16{wmb_write_dcache_ptr[3]}} & wmb_entry_bytes_vld_3[15:0]
                                          | {16{wmb_write_dcache_ptr[4]}} & wmb_entry_bytes_vld_4[15:0]
                                          | {16{wmb_write_dcache_ptr[5]}} & wmb_entry_bytes_vld_5[15:0]
                                          | {16{wmb_write_dcache_ptr[6]}} & wmb_entry_bytes_vld_6[15:0]
                                          | {16{wmb_write_dcache_ptr[7]}} & wmb_entry_bytes_vld_7[15:0];

// &CombBeg; @1295
always @( wmb_entry_data_4[127:0]
       or wmb_entry_data_7[127:0]
       or wmb_entry_data_5[127:0]
       or wmb_write_dcache_ptr[7:0]
       or wmb_entry_data_1[127:0]
       or wmb_entry_data_2[127:0]
       or wmb_entry_data_0[127:0]
       or wmb_entry_data_3[127:0]
       or wmb_entry_data_6[127:0])
begin
case(wmb_write_dcache_ptr[7:0])
  8'h01:  wmb_write_dcache_data[127:0] = wmb_entry_data_0[127:0];
  8'h02:  wmb_write_dcache_data[127:0] = wmb_entry_data_1[127:0];
  8'h04:  wmb_write_dcache_data[127:0] = wmb_entry_data_2[127:0];
  8'h08:  wmb_write_dcache_data[127:0] = wmb_entry_data_3[127:0];
  8'h10:  wmb_write_dcache_data[127:0] = wmb_entry_data_4[127:0];
  8'h20:  wmb_write_dcache_data[127:0] = wmb_entry_data_5[127:0];
  8'h40:  wmb_write_dcache_data[127:0] = wmb_entry_data_6[127:0];
  8'h80:  wmb_write_dcache_data[127:0] = wmb_entry_data_7[127:0];
  default:wmb_write_dcache_data[127:0] = {128{1'bx}};
endcase
// &CombEnd; @1307
end

assign wmb_write_dcache_stall      = |(wmb_write_dcache_ptr[WMB_ENTRY-1:0] & wmb_entry_write_stall[WMB_ENTRY-1:0]);

assign wmb_write_dcache_sync_fence = |(wmb_write_dcache_ptr[WMB_ENTRY-1:0] & wmb_entry_sync_fence[WMB_ENTRY-1:0]);
assign wmb_write_dcache_atomic     = |(wmb_write_dcache_ptr[WMB_ENTRY-1:0] & wmb_entry_atomic_and_vld[WMB_ENTRY-1:0]);
assign wmb_write_dcache_icc        = |(wmb_write_dcache_ptr[WMB_ENTRY-1:0] & wmb_entry_icc_and_vld[WMB_ENTRY-1:0]);

assign wmb_write_dcache_req_icc_inst  = !wmb_write_dcache_atomic
                                        &&  !wmb_write_dcache_sync_fence
                                        &&  wmb_write_dcache_icc;

//----------------------hit_idx-----------------------------
assign wmb_write_req_hit_idx  = lfb_wmb_write_req_hit_idx
//                                ||  snq_create_wmb_write_req_hit_idx
//                                ||  snq_wmb_write_req_hit_idx
                                ||  vb_wmb_write_req_hit_idx;

//for dcache_inst
assign wmb_dcache_inst_write_req_hit_idx  = lfb_wmb_write_req_hit_idx
                                            ||  snq_create_wmb_write_req_hit_idx
                                            ||  snq_wmb_write_req_hit_idx
                                            ||  vb_wmb_write_req_hit_idx;
//-----------------for ecc ---------------------------------
// &Instance("ct_lsu_wmb_ecc_fsm","x_ct_lsu_wmb_ecc_fsm"); @1350
// &Instance("ct_lsu_29bit_ecc_encode", "x_ct_dcache_29bit_ecc_encode"); @1360
// &Connect(.data_encode    (wmb_tag_bf_ecc[28:0] ),   @1361
//          .ecc_code       (wmb_tag_ecc[5:0]     ),  @1362
//          .parity_bit     (wmb_tag_parity       )  @1363
//         ); @1364
assign pw_read           = 1'b0;
assign pw_ecc_idle       = 1'b1;
assign pw_merge_stall    = 1'b0;
assign wmb_ecc_write_req = 1'b0;
assign wmb_ecc_fatal_err = 1'b0;

assign wmb_dcache_arb_ld_borrow_req = wmb_dcache_arb_req && pw_read;
assign wmb_dcache_arb_data_way      = wmb_dcache_data_high_sel;

assign wmb_write_dcache_wen[15:0]   = wmb_ecc_write_req
                                      ? 16'hffff
                                      : wmb_write_dcache_bytes_vld[15:0];
//----------------------cache interface---------------------
assign wmb_dcache_arb_req_unmask  = wmb_write_dcache_pop_req
                                       &&  pw_ecc_idle
                                       &&  !wmb_write_dcache_stall
                                       &&  wmb_write_dcache_permit
                                    || wmb_ecc_write_req;
assign wmb_dcache_arb_req         = wmb_dcache_arb_req_unmask;
assign wmb_dcache_arb_ld_req      = wmb_dcache_arb_req;
assign wmb_dcache_arb_st_req      = wmb_dcache_arb_req;

assign wmb_write_dcache_success_ori = wmb_dcache_arb_req
                                      &&  dcache_arb_wmb_ld_grnt;
//                                    &&  !wmb_write_req_hit_idx;
//for ecc pw read                                    
assign wmb_write_dcache_success     = wmb_write_dcache_success_ori
                                         && (!pw_read || wmb_ecc_write_req)
                                      || wmb_ecc_fatal_err;
//----------------tag array-------------
assign wmb_dcache_arb_ld_tag_gateclk_en = wmb_dcache_arb_req_unmask
                                          &&  !pw_read
                                          &&  wmb_write_dcache_req_icc_inst;
assign wmb_dcache_arb_ld_tag_req        = wmb_dcache_arb_req_unmask
                                          &&  !pw_read
                                          &&  wmb_write_dcache_req_icc_inst;
//                                          &&  !wmb_write_req_hit_idx;
assign wmb_dcache_arb_ld_tag_idx[8:0]   = wmb_write_dcache_addr[14:6];
assign wmb_dcache_arb_ld_tag_wen[1:0]   = {wmb_write_req_dcache_way,
                                          !wmb_write_req_dcache_way};
//---------------dirty array------------
assign wmb_dcache_arb_st_dirty_gateclk_en = wmb_dcache_arb_req_unmask
                                            && !pw_read;
assign wmb_dcache_arb_st_dirty_req      = wmb_dcache_arb_req_unmask
                                          &&  !pw_read;
//                                          &&  !wmb_write_req_hit_idx;
assign wmb_dcache_arb_st_dirty_idx[8:0] = wmb_write_dcache_addr[14:6];
//fifo,dirty1,share1,valid1,dirty0,share0,valid0
assign wmb_dcache_arb_st_dirty_din[6:0] = wmb_write_dcache_req_icc_inst
                                          ? {7'b0}
                                          : {1'b0,1'b1,1'b0,1'b1,1'b1,1'b0,1'b1};
assign wmb_dcache_arb_st_dirty_wen[6:0] = {1'b0,
                                          {3{wmb_write_req_dcache_way}},
                                          {3{!wmb_write_req_dcache_way}}};

//---------------data array-------------
//pre signal
assign wmb_dcache_data_region[3]  = |wmb_write_dcache_bytes_vld[15:12];
assign wmb_dcache_data_region[2]  = |wmb_write_dcache_bytes_vld[11:8];
assign wmb_dcache_data_region[1]  = |wmb_write_dcache_bytes_vld[7:4];
assign wmb_dcache_data_region[0]  = |wmb_write_dcache_bytes_vld[3:0];
assign wmb_dcache_data_high_sel   = wmb_write_req_dcache_way  ^ wmb_write_dcache_addr[4];

// &Force("output","wmb_dcache_arb_ld_data_req"); @1452
assign wmb_dcache_arb_ld_data_req_unmask[7:0] = {wmb_dcache_data_region[3:0],wmb_dcache_data_region[3:0]}
                                                & {{4{wmb_dcache_data_high_sel}},{4{!wmb_dcache_data_high_sel}}}
                                                & {8{wmb_dcache_arb_req_unmask}};
assign wmb_dcache_arb_ld_data_req[7:0]        = wmb_dcache_arb_ld_data_req_unmask[7:0];
//                                                & {8{!wmb_write_req_hit_idx}};
assign wmb_dcache_arb_ld_data_gateclk_en[7:0] = wmb_dcache_arb_ld_data_req_unmask[7:0];
                                            
assign wmb_dcache_arb_ld_data_idx[10:0] = {wmb_write_dcache_addr[14:5],wmb_write_req_dcache_way};
assign wmb_dcache_arb_ld_data_low_din[127:0]  = wmb_write_dcache_data[127:0];
assign wmb_dcache_arb_ld_data_high_din[127:0] = wmb_write_dcache_data[127:0];
assign wmb_dcache_arb_ld_data_gwen[7:0] =  pw_read
                                           ? 8'b0
                                           : wmb_dcache_arb_ld_data_req_unmask[7:0];
assign wmb_dcache_arb_ld_data_wen[31:0] = {wmb_write_dcache_wen[15:0],wmb_write_dcache_wen[15:0]}
                                          & {{16{wmb_dcache_data_high_sel}},{16{!wmb_dcache_data_high_sel}}};

//==========================================================
//                  Request victim buffer
//==========================================================
//req signal is used for arbitration
assign wmb_vb_create_req          = wmb_write_vb_req_unmask;
// &Force("output","wmb_vb_create_vld"); @1479
//only create vb should check snq
assign wmb_vb_create_vld          = wmb_write_vb_req_unmask
                                    &&  !wmb_dcache_inst_write_req_hit_idx;
assign wmb_vb_create_dp_vld       = wmb_write_vb_req_unmask;
assign wmb_vb_create_gateclk_en   = wmb_write_vb_req_unmask;
assign wmb_vb_inv                 = wmb_write_req_inst_size[1];
assign wmb_vb_set_way_mode        = wmb_write_req_inst_mode[1:0]  ==  2'b10;
assign wmb_vb_addr_tto6[`PA_WIDTH-7:0]  = wmb_write_req_addr[`PA_WIDTH-1:6];

//==========================================================
//      Request biu aw channel(include mem set request)
//==========================================================
//-----------------------inst type--------------------------
assign wmb_write_req_sync_fence_inst  = wmb_write_req_sync_fence
                                        &&  !wmb_write_req_atomic;
assign wmb_write_req_sync_inst  = wmb_write_req_sync_fence
                                  &&  !wmb_write_req_atomic
                                  &&  (wmb_write_req_inst_type[1:0] ==  2'b00);
//assign wmb_write_req_icc_inst   = !wmb_write_req_atomic
//                                  &&  !wmb_write_req_sync_fence
//                                  &&  wmb_write_req_icc;
//-----------------interface to bus_arb---------------------
assign wmb_biu_write_en = wmb_write_imme || wmb_write_biu_dcache_line;
// &Force("output","wmb_biu_aw_req"); @1503
assign wmb_biu_aw_req   = wmb_write_biu_dp_req
                          &&  wmb_biu_write_en
                          &&  wmb_write_biu_req_unmask
                          &&  (!rb_wmb_so_pending
                              ||  !wmb_write_req_page_so)
                          &&  (!wmb_write_req_hit_idx
                              ||  wmb_write_req_sync_fence_inst);

assign wmb_biu_aw_dp_req          = wmb_write_biu_dp_req
                                    &&  wmb_biu_write_en
                                    &&  wmb_write_biu_req_unmask
                                    &&  (!rb_wmb_so_pending
                                        ||  !wmb_write_req_page_so);
assign wmb_biu_aw_req_gateclk_en  = wmb_write_biu_dp_req;
//-----------------id-------------------
assign wmb_biu_aw_id_judge[4:0] = {wmb_write_req_sync_fence_inst,
                                  wmb_write_req_page_so,
                                  wmb_write_req_page_ca,
                                  wmb_write_req_atomic,
                                  wmb_write_biu_dcache_line};

// &Force("output","wmb_biu_aw_id"); @1525
// &CombBeg; @1526
always @( wmb_write_ptr_encode[2:0]
       or wmb_biu_aw_id_judge[4:0]
       or wmb_write_ptr_next3_encode[2:0])
begin
wmb_biu_aw_id[4:0]  = 5'b0;
casez(wmb_biu_aw_id_judge[4:0])
  5'b1????:wmb_biu_aw_id[4:0] = BIU_B_SYNC_FENCE_ID;
  5'b01???:wmb_biu_aw_id[4:0] = BIU_B_SO_ID;
  5'b001?0:wmb_biu_aw_id[4:0] = {BIU_R_NORM_ID_T,wmb_write_ptr_encode[2:0]};
  5'b001?1:wmb_biu_aw_id[4:0] = {BIU_R_NORM_ID_T,wmb_write_ptr_next3_encode[2:0]};
  5'b0001?:wmb_biu_aw_id[4:0] = BIU_B_NC_ATOM_ID;
  5'b0000?:wmb_biu_aw_id[4:0] = BIU_B_NC_ID;
  default :wmb_biu_aw_id[4:0]  = 5'b0;
endcase
// &CombEnd; @1537
end

assign wmb_biu_aw_addr[`PA_WIDTH-1:4] = wmb_write_req_addr[`PA_WIDTH-1:4];

assign wmb_biu_aw_size_maintain = (wmb_write_req_page_so  ||  wmb_write_req_page_nc_atomic)
                                  &&  !wmb_write_req_sync_fence_inst;

assign wmb_biu_aw_addr[3:0]   = wmb_biu_aw_size_maintain
                                ? wmb_write_req_addr[3:0]
                                : 4'b0;

assign wmb_biu_aw_len[1:0]    = wmb_write_biu_dcache_line
                                ? 2'b11
                                : 2'b00;
assign wmb_biu_aw_size[2:0]   = wmb_biu_aw_size_maintain
                                ? {wmb_write_req_inst_size[2:0]}
                                : 3'b100;
assign wmb_biu_aw_burst[1:0]  = wmb_write_biu_dcache_line &&  wmb_write_burst_neg
                                ? 2'b11
                                : 2'b01;
assign wmb_biu_aw_lock        = !wmb_write_req_page_ca
//                                &&  wmb_write_req_page_share
                                &&  wmb_write_req_atomic;

//cache
//if sync/fence use normal, noncacheable
assign wmb_biu_aw_cache[3:0]  = wmb_write_req_sync_fence_inst
                                ? 4'b0011
                                : {wmb_write_req_page_wa  &&  !amr_l2_mem_set,
                                  wmb_write_req_page_ca,
                                  !wmb_write_req_page_so,
                                  wmb_write_req_page_buf};

//prot:supv,sec,inst
assign wmb_biu_aw_prot[2:0]   = {1'b0,
                                wmb_write_req_page_sec,
                                wmb_write_req_priv_mode[0]};

assign wmb_biu_aw_user        = wmb_write_req_priv_mode[1];

//-----------------snoop----------------
//for single core,send wu or wlu when not wns_en
//assign wmb_write_req_no_wns   = wmb_write_req_page_share || !cp0_lsu_wns_en;
assign wmb_write_req_no_wns   = 1'b1;

assign wmb_biu_aw_snoop[2:0]  = wmb_write_req_page_ca && wmb_write_req_no_wns && wmb_write_biu_dcache_line
                                ? 3'b001
                                : 3'b000;

assign wmb_write_req_default_domain = !wmb_write_req_page_ca
                                      &&  (wmb_write_req_stex_inst
                                          ||  wmb_write_req_st_inst);
assign wmb_biu_aw_domain[1:0] = wmb_write_req_default_domain
                                ? 2'b11
                                : {1'b0,wmb_write_req_no_wns};

assign wmb_biu_aw_bar[1:0]    = {wmb_write_req_sync_inst,wmb_write_req_sync_fence_inst};

//-----------------mem_set counter--------------------------
assign wmb_mem_set_write_grnt = wmb_write_biu_dcache_line
                                &&  bus_arb_wmb_aw_grnt;

assign wmb_entry_mem_set_write_grnt[WMB_ENTRY-1:0]  = {WMB_ENTRY{wmb_mem_set_write_grnt}}
                                                      & wmb_write_ptr_to_next3[WMB_ENTRY-1:0];

//for timing use mem_set write gateclk en for biu_id clk
assign wmb_mem_set_write_gateclk_en = wmb_write_biu_req_unmask
                                      &&  wmb_write_biu_dcache_line;
assign wmb_entry_mem_set_write_gateclk_en[WMB_ENTRY-1:0]  = {WMB_ENTRY{wmb_mem_set_write_gateclk_en}}
                                                            & wmb_write_ptr_to_next3[WMB_ENTRY-1:0];

//-----------------biu grnt signal--------------------------
assign wmb_biu_nc_req_grnt    = bus_arb_wmb_aw_grnt
                                &&  !wmb_write_req_page_ca
                                &&  !wmb_write_req_page_so
                                &&  !wmb_write_req_atomic
                                &&  !wmb_write_req_sync_fence_inst;
assign wmb_biu_so_req_grnt    = bus_arb_wmb_aw_grnt
                                //&&  !wmb_write_req_atomic
                                &&  wmb_write_req_page_so
                                &&  !wmb_write_req_sync_fence_inst;

//set wmb_entry_w_last signal
assign wmb_entry_1_entry_w_last[WMB_ENTRY-1:0]      = wmb_write_ptr[WMB_ENTRY-1:0];
assign wmb_entry_dcache_line_w_last[WMB_ENTRY-1:0]  = wmb_write_ptr_next3[WMB_ENTRY-1:0];
assign wmb_entry_w_last_set[WMB_ENTRY-1:0]          = wmb_write_biu_dcache_line
                                                      ? wmb_entry_dcache_line_w_last[WMB_ENTRY-1:0]
                                                      : wmb_entry_1_entry_w_last[WMB_ENTRY-1:0];

//==========================================================
//                Request biu w channel
//==========================================================
assign wmb_biu_w_req          = wmb_data_biu_req;
//w_id is used for debug
assign wmb_biu_w_id[4:0]      = wmb_data_req_biu_id[4:0];
assign wmb_biu_w_data[127:0]  = wmb_data_req_data[127:0];
assign wmb_biu_w_strb[15:0]   = wmb_data_req_bytes_vld[15:0];
assign wmb_biu_w_last         = wmb_data_req_w_last;
assign wmb_biu_w_vld          = wmb_data_biu_req;
assign wmb_biu_w_wns          = wmb_data_req_wns;

//==========================================================
//                Request wb cmplt part
//==========================================================
// &CombBeg; @1641
always @( wmb_entry_wb_cmplt_req[7:0])
begin
wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0]  = {WMB_ENTRY{1'b0}};
casez(wmb_entry_wb_cmplt_req[WMB_ENTRY-1:0])
  8'b????_???1:wmb_st_wb_cmplt_ptr[0]  = 1'b1;
  8'b????_??10:wmb_st_wb_cmplt_ptr[1]  = 1'b1;
  8'b????_?100:wmb_st_wb_cmplt_ptr[2]  = 1'b1;
  8'b????_1000:wmb_st_wb_cmplt_ptr[3]  = 1'b1;
  8'b???1_0000:wmb_st_wb_cmplt_ptr[4]  = 1'b1;
  8'b??10_0000:wmb_st_wb_cmplt_ptr[5]  = 1'b1;
  8'b?100_0000:wmb_st_wb_cmplt_ptr[6]  = 1'b1;
  8'b1000_0000:wmb_st_wb_cmplt_ptr[7]  = 1'b1;
  default:wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0]  = {WMB_ENTRY{1'b0}};
endcase
// &CombEnd; @1654
end

//-----------------cmplt req info---------------------------
// &Force("output","wmb_st_wb_cmplt_req"); @1657
assign wmb_st_wb_cmplt_req  = |wmb_entry_wb_cmplt_req[WMB_ENTRY-1:0];
assign wmb_st_wb_inst_flush = |(wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0]  & wmb_entry_inst_flush[WMB_ENTRY-1:0]);
assign wmb_st_wb_spec_fail  = |(wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0]  & wmb_entry_spec_fail[WMB_ENTRY-1:0]);
assign wmb_st_wb_bkpta_data = |(wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0]  & wmb_entry_bkpta_data[WMB_ENTRY-1:0]);
assign wmb_st_wb_bkptb_data = |(wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0]  & wmb_entry_bkptb_data[WMB_ENTRY-1:0]);
assign wmb_st_wb_iid[6:0]   = {7{wmb_st_wb_cmplt_ptr[0]}} & wmb_entry_iid_0[6:0]
                              | {7{wmb_st_wb_cmplt_ptr[1]}} & wmb_entry_iid_1[6:0]
                              | {7{wmb_st_wb_cmplt_ptr[2]}} & wmb_entry_iid_2[6:0]
                              | {7{wmb_st_wb_cmplt_ptr[3]}} & wmb_entry_iid_3[6:0]
                              | {7{wmb_st_wb_cmplt_ptr[4]}} & wmb_entry_iid_4[6:0]
                              | {7{wmb_st_wb_cmplt_ptr[5]}} & wmb_entry_iid_5[6:0]
                              | {7{wmb_st_wb_cmplt_ptr[6]}} & wmb_entry_iid_6[6:0]
                              | {7{wmb_st_wb_cmplt_ptr[7]}} & wmb_entry_iid_7[6:0];
// &Force("nonport","wmb_entry_vstart_vld"); @1674

//-------------------cmplt grnt-----------------------------
assign wmb_entry_wb_cmplt_grnt[WMB_ENTRY-1:0] = {WMB_ENTRY{st_wb_wmb_cmplt_grnt}}
                                                & wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0];
//==========================================================
//                Request wb data part
//==========================================================
assign wmb_ld_wb_data_ptr[WMB_ENTRY-1:0]  = wmb_entry_wb_data_req[WMB_ENTRY-1:0];

assign wmb_ld_wb_data_req         = |wmb_entry_wb_data_req[WMB_ENTRY-1:0];

assign wmb_ld_wb_preg[6:0]        = {7{wmb_ld_wb_data_ptr[0]}} & wmb_entry_preg_0[6:0]
                                    | {7{wmb_ld_wb_data_ptr[1]}} & wmb_entry_preg_1[6:0]
                                    | {7{wmb_ld_wb_data_ptr[2]}} & wmb_entry_preg_2[6:0]
                                    | {7{wmb_ld_wb_data_ptr[3]}} & wmb_entry_preg_3[6:0]
                                    | {7{wmb_ld_wb_data_ptr[4]}} & wmb_entry_preg_4[6:0]
                                    | {7{wmb_ld_wb_data_ptr[5]}} & wmb_entry_preg_5[6:0]
                                    | {7{wmb_ld_wb_data_ptr[6]}} & wmb_entry_preg_6[6:0]
                                    | {7{wmb_ld_wb_data_ptr[7]}} & wmb_entry_preg_7[6:0];

assign wmb_ld_wb_data_addr[`PA_WIDTH-1:0] = {`PA_WIDTH{wmb_ld_wb_data_ptr[0]}} & wmb_entry_addr_0[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{wmb_ld_wb_data_ptr[1]}} & wmb_entry_addr_1[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{wmb_ld_wb_data_ptr[2]}} & wmb_entry_addr_2[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{wmb_ld_wb_data_ptr[3]}} & wmb_entry_addr_3[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{wmb_ld_wb_data_ptr[4]}} & wmb_entry_addr_4[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{wmb_ld_wb_data_ptr[5]}} & wmb_entry_addr_5[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{wmb_ld_wb_data_ptr[6]}} & wmb_entry_addr_6[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{wmb_ld_wb_data_ptr[7]}} & wmb_entry_addr_7[`PA_WIDTH-1:0];

assign wmb_ld_wb_data_iid[6:0]    = {7{wmb_ld_wb_data_ptr[0]}} & wmb_entry_iid_0[6:0]
                                    | {7{wmb_ld_wb_data_ptr[1]}} & wmb_entry_iid_1[6:0]
                                    | {7{wmb_ld_wb_data_ptr[2]}} & wmb_entry_iid_2[6:0]
                                    | {7{wmb_ld_wb_data_ptr[3]}} & wmb_entry_iid_3[6:0]
                                    | {7{wmb_ld_wb_data_ptr[4]}} & wmb_entry_iid_4[6:0]
                                    | {7{wmb_ld_wb_data_ptr[5]}} & wmb_entry_iid_5[6:0]
                                    | {7{wmb_ld_wb_data_ptr[6]}} & wmb_entry_iid_6[6:0]
                                    | {7{wmb_ld_wb_data_ptr[7]}} & wmb_entry_iid_7[6:0];

assign wmb_ld_wb_data[63:1]         = 63'b0;
assign wmb_ld_wb_vreg_sign_sel[1:0] = 2'b0;
assign wmb_ld_wb_data[0]          = !wmb_ld_wb_data_success;
assign wmb_ld_wb_data_success     = |(wmb_ld_wb_data_ptr[WMB_ENTRY-1:0]
                                      & wmb_entry_sc_wb_success[WMB_ENTRY-1:0]);
//don't expand sign
assign wmb_ld_wb_preg_sign_sel[3:0] = 4'b0001;
assign wmb_ld_wb_vreg[5:0] = 6'b0;
assign wmb_ld_wb_inst_vfls = 1'b0;
//-------------------atomic inst----------------------------
assign wmb_st_wb_atomic     = |(wmb_st_wb_cmplt_ptr[WMB_ENTRY-1:0]  & wmb_entry_atomic[WMB_ENTRY-1:0]);
assign wmb_lm_state_clr     = wmb_st_wb_cmplt_req
                              &&  wmb_st_wb_atomic;
//-------------------data grnt------------------------------
assign wmb_entry_wb_data_grnt[WMB_ENTRY-1:0]  = {WMB_ENTRY{ld_wb_wmb_data_grnt}}
                                                & wmb_ld_wb_data_ptr[WMB_ENTRY-1:0];

//==========================================================
//            maintain restart wakeup queue
//==========================================================
//---------------------registers----------------------------
//+--------------+
//| wakeup_queue |
//+--------------+
//the queue stores the instructions waiting for wakeup
always @(posedge wmb_wakeup_queue_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_wakeup_queue[LSIQ_ENTRY-1:0]  <=  {LSIQ_ENTRY{1'b0}};
  else if(rtu_yy_xx_flush)
    wmb_wakeup_queue[LSIQ_ENTRY-1:0]  <=  {LSIQ_ENTRY{1'b0}};
  else if(ld_da_wmb_discard_vld ||  wmb_pop_depd_ff)
    wmb_wakeup_queue[LSIQ_ENTRY-1:0]  <=  wmb_wakeup_queue_next[LSIQ_ENTRY-1:0];
end

//+-------------+
//| depd_pop_ff |
//+-------------+
//if depd pop, this will set to 1, and clear wakeup_queue next cycle
always @(posedge wmb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_pop_depd_ff      <=  1'b0;
  else if(wmb_pop_depd  ||  wmb_pop_discard_req || wmb_pop_fwd_req)
    wmb_pop_depd_ff      <=  1'b1;
  else
    wmb_pop_depd_ff      <=  1'b0;
end

assign wmb_wakeup_queue_not_empty = |wmb_wakeup_queue[LSIQ_ENTRY-1:0];
//------------------request---------------------------------
//------------wmb_pop_depd--------------
assign wmb_pop_depd       = |(wmb_entry_pop_vld[WMB_ENTRY-1:0]  & wmb_entry_depd[WMB_ENTRY-1:0]);
//---------interface to ld_dc-----------
assign wmb_discard_req    = |wmb_entry_discard_req[WMB_ENTRY-1:0];
assign wmb_ld_dc_discard_req            = wmb_discard_req;
assign wmb_fwd_req                      = |wmb_entry_fwd_req[WMB_ENTRY-1:0];
// &CombBeg; @1792
always @( wmb_entry_fwd_bytes_vld_6[15:0]
       or wmb_entry_fwd_bytes_vld_1[15:0]
       or wmb_entry_fwd_data_pe_req[7:0]
       or wmb_entry_fwd_bytes_vld_7[15:0]
       or wmb_entry_fwd_bytes_vld_0[15:0]
       or wmb_entry_fwd_bytes_vld_2[15:0]
       or wmb_entry_fwd_bytes_vld_3[15:0]
       or wmb_entry_fwd_bytes_vld_5[15:0]
       or wmb_entry_fwd_bytes_vld_4[15:0])
begin
case(wmb_entry_fwd_data_pe_req[7:0])
  8'h01:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_0[15:0];
  8'h02:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_1[15:0];
  8'h04:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_2[15:0];
  8'h08:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_3[15:0];
  8'h10:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_4[15:0];
  8'h20:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_5[15:0];
  8'h40:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_6[15:0];
  8'h80:  wmb_fwd_bytes_vld[15:0] = wmb_entry_fwd_bytes_vld_7[15:0];
  default:wmb_fwd_bytes_vld[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1804
end

assign wmb_ld_dc_fwd_req                = wmb_fwd_req;
//assign wmb_ld_dc_fwd_id[WMB_ENTRY-1:0]  = wmb_entry_fwd_req[WMB_ENTRY-1:0];
assign wmb_ld_dc_cancel_acc_req         = |wmb_entry_cancel_acc_req[WMB_ENTRY-1:0];
//---------interface to wmb_entry--------
//for timing, discard req and set write imme/depd signal, and set wakeup queue
//at next cycle

//assign wmb_entry_discard_grnt[WMB_ENTRY-1:0]  = {WMB_ENTRY{ld_da_wmb_discard_vld}}
//                                                & wmb_entry_discard_req[WMB_ENTRY-1:0];
//-------forward to depd_pop_ff-------
assign wmb_pop_discard_req  = |(wmb_entry_pop_vld[WMB_ENTRY-1:0]  & wmb_entry_discard_req[WMB_ENTRY-1:0]);
assign wmb_pop_fwd_req      = |(wmb_entry_pop_vld[WMB_ENTRY-1:0]  & wmb_entry_fwd_req[WMB_ENTRY-1:0]);

//------------------update wakeup queue---------------------
assign wmb_wakeup_queue_grnt[LSIQ_ENTRY-1:0]  = wmb_wakeup_queue[LSIQ_ENTRY-1:0]
                                                | ({LSIQ_ENTRY{ld_da_wmb_discard_vld}}
                                                  & ld_da_lsid[LSIQ_ENTRY-1:0]);

assign wmb_wakeup_queue_next[LSIQ_ENTRY-1:0]  = wmb_pop_depd_ff
                                                ? {LSIQ_ENTRY{1'b0}}
                                                : wmb_wakeup_queue_grnt[LSIQ_ENTRY-1:0];

//-------------------------wakeup---------------------------
assign wmb_depd_wakeup[LSIQ_ENTRY-1:0]  = wmb_pop_depd_ff
                                          ? wmb_wakeup_queue_grnt[LSIQ_ENTRY-1:0]
                                          : {LSIQ_ENTRY{1'b0}};

//==========================================================
//                Monitor biu b channel
//==========================================================
assign wmb_b_nc_id_hit    = biu_lsu_b_vld
                            &&  (biu_lsu_b_id[4:0]  ==  BIU_B_NC_ID);
assign wmb_b_so_id_hit    = biu_lsu_b_vld
                            &&  (biu_lsu_b_id[4:0]  ==  BIU_B_SO_ID);
assign wmb_b_resp_exokay  = biu_lsu_b_resp[1:0] ==  EXOKAY;

//==========================================================
//              Forward data to ld_da
//==========================================================
always @(posedge wmb_fwd_data_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_fwd_data[127:0]   <=  128'd0;
  else if(wmb_fwd_data_pe_req)
    wmb_fwd_data[127:0]   <=  wmb_fwd_data_sel[127:0];
end

assign wmb_fwd_data_pe_req  = (|wmb_entry_fwd_data_pe_req[7:0])
                              &&  ld_dc_chk_ld_inst_vld
                              &&  !ld_da_fwd_ecc_stall;
assign wmb_fwd_data_pe_gateclk_en = (|wmb_entry_fwd_data_pe_gateclk_en[7:0])
                                    &&  ld_dc_chk_ld_inst_vld;
// &CombBeg; @1858
always @( wmb_entry_data_4[127:0]
       or wmb_entry_data_7[127:0]
       or wmb_entry_data_5[127:0]
       or wmb_entry_fwd_data_pe_req[7:0]
       or wmb_entry_data_1[127:0]
       or wmb_entry_data_2[127:0]
       or wmb_entry_data_0[127:0]
       or wmb_entry_data_3[127:0]
       or wmb_entry_data_6[127:0])
begin
case(wmb_entry_fwd_data_pe_req[7:0])
  8'h01:  wmb_fwd_data_sel[127:0] = wmb_entry_data_0[127:0];
  8'h02:  wmb_fwd_data_sel[127:0] = wmb_entry_data_1[127:0];
  8'h04:  wmb_fwd_data_sel[127:0] = wmb_entry_data_2[127:0];
  8'h08:  wmb_fwd_data_sel[127:0] = wmb_entry_data_3[127:0];
  8'h10:  wmb_fwd_data_sel[127:0] = wmb_entry_data_4[127:0];
  8'h20:  wmb_fwd_data_sel[127:0] = wmb_entry_data_5[127:0];
  8'h40:  wmb_fwd_data_sel[127:0] = wmb_entry_data_6[127:0];
  8'h80:  wmb_fwd_data_sel[127:0] = wmb_entry_data_7[127:0];
  default:wmb_fwd_data_sel[127:0] = {128{1'bx}};
endcase
// &CombEnd; @1870
end

assign wmb_ld_da_fwd_data[127:0]  = wmb_fwd_data[127:0];
//==========================================================
//                      Hit index
//==========================================================
assign wmb_pfu_biu_req_hit_idx      = |wmb_entry_pfu_biu_req_hit_idx[WMB_ENTRY-1:0];
assign wmb_snq_depd[WMB_ENTRY-1:0]  = wmb_entry_snq_depd[WMB_ENTRY-1:0];

assign wmb_snq_depd_remove[WMB_ENTRY-1:0]  = wmb_entry_snq_depd_remove[WMB_ENTRY-1:0];

//hit cache line signal
assign wmb_rb_biu_req_hit_idx     = |wmb_entry_rb_biu_req_hit_idx[WMB_ENTRY-1:0];

//==========================================================
//              Interface to other module
//==========================================================
assign wmb_sync_fence_biu_req_success = |wmb_entry_sync_fence_biu_req_success[WMB_ENTRY-1:0];
//assign wmb_amr_cancel               = |wmb_entry_amr_cancel[WMB_ENTRY-1:0];
//assign wmb_amr_cancel_gateclk       = |wmb_entry_amr_cancel_gateclk[WMB_ENTRY-1:0];
assign wmb_has_sync_fence           = |(wmb_entry_vld[WMB_ENTRY-1:0]
                                        & wmb_entry_sync_fence_inst[WMB_ENTRY-1:0]);
assign wmb_no_op                    = |wmb_entry_no_op[WMB_ENTRY-1:0];


assign lsu_had_wmb_write_imme       = wmb_write_imme;
assign lsu_had_wmb_entry_vld[WMB_ENTRY-1:0]   = wmb_entry_vld[WMB_ENTRY-1:0];
assign lsu_had_wmb_ar_pending       = |wmb_entry_ar_pending[WMB_ENTRY-1:0];
assign lsu_had_wmb_aw_pending       = |wmb_entry_aw_pending[WMB_ENTRY-1:0];
assign lsu_had_wmb_w_pending        = |wmb_entry_w_pending[WMB_ENTRY-1:0];
assign lsu_had_wmb_create_ptr[WMB_ENTRY-1:0]  = wmb_create_ptr[WMB_ENTRY-1:0];
assign lsu_had_wmb_write_ptr[WMB_ENTRY-1:0]   = wmb_write_ptr[WMB_ENTRY-1:0];
assign lsu_had_wmb_read_ptr[WMB_ENTRY-1:0]    = wmb_read_ptr[WMB_ENTRY-1:0];
assign lsu_had_wmb_data_ptr[WMB_ENTRY-1:0]    = wmb_data_ptr[WMB_ENTRY-1:0];

// &ModuleEnd; @1923
endmodule


