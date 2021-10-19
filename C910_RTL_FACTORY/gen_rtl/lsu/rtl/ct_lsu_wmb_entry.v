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

// &ModuleBeg; @33
module ct_lsu_wmb_entry(
  biu_lsu_b_id,
  biu_lsu_b_vld,
  biu_lsu_r_id,
  biu_lsu_r_vld,
  bus_arb_wmb_aw_grnt,
  bus_arb_wmb_w_grnt,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dcache_dirty_din,
  dcache_dirty_gwen,
  dcache_dirty_wen,
  dcache_idx,
  dcache_snq_st_sel,
  dcache_tag_din,
  dcache_tag_gwen,
  dcache_tag_wen,
  forever_cpuclk,
  ld_dc_addr0,
  ld_dc_addr1_11to4,
  ld_dc_bytes_vld,
  ld_dc_chk_atomic_inst_vld,
  ld_dc_chk_ld_inst_vld,
  lm_state_is_ex_wait_lock,
  lm_state_is_idle,
  pad_yy_icg_scan_en,
  pfu_biu_req_addr,
  pw_merge_stall,
  rb_biu_req_addr,
  rb_biu_req_unmask,
  rtu_lsu_async_flush,
  snq_can_create_snq_uncheck,
  snq_create_addr,
  sq_pop_addr,
  sq_pop_priv_mode,
  sq_wmb_merge_req,
  sq_wmb_merge_stall_req,
  vb_wmb_empty,
  vb_wmb_entry_rcl_done_x,
  wmb_b_resp_exokay,
  wmb_biu_ar_id,
  wmb_biu_aw_id,
  wmb_biu_write_en,
  wmb_ce_addr,
  wmb_ce_atomic,
  wmb_ce_bkpta_data,
  wmb_ce_bkptb_data,
  wmb_ce_bytes_vld,
  wmb_ce_bytes_vld_full,
  wmb_ce_create_vld,
  wmb_ce_data128,
  wmb_ce_data_vld,
  wmb_ce_dcache_inst,
  wmb_ce_fence_mode,
  wmb_ce_icc,
  wmb_ce_iid,
  wmb_ce_inst_flush,
  wmb_ce_inst_mode,
  wmb_ce_inst_size,
  wmb_ce_inst_type,
  wmb_ce_last_addr_plus,
  wmb_ce_last_addr_sub,
  wmb_ce_merge_en,
  wmb_ce_page_buf,
  wmb_ce_page_ca,
  wmb_ce_page_sec,
  wmb_ce_page_share,
  wmb_ce_page_so,
  wmb_ce_page_wa,
  wmb_ce_priv_mode,
  wmb_ce_sc_wb_vld,
  wmb_ce_spec_fail,
  wmb_ce_sync_fence,
  wmb_ce_update_dcache_dirty,
  wmb_ce_update_dcache_share,
  wmb_ce_update_dcache_valid,
  wmb_ce_update_dcache_way,
  wmb_ce_update_same_dcache_line,
  wmb_ce_update_same_dcache_line_ptr,
  wmb_ce_vstart_vld,
  wmb_ce_wb_cmplt_success,
  wmb_ce_wb_data_success,
  wmb_ce_write_imme,
  wmb_create_ptr_next1_x,
  wmb_create_vb_success,
  wmb_data_ptr_x,
  wmb_dcache_arb_req_unmask,
  wmb_dcache_inst_write_req_hit_idx,
  wmb_dcache_req_ptr_x,
  wmb_entry_addr_v,
  wmb_entry_ar_pending_x,
  wmb_entry_atomic_and_vld_x,
  wmb_entry_atomic_x,
  wmb_entry_aw_pending_x,
  wmb_entry_biu_id_v,
  wmb_entry_bkpta_data_x,
  wmb_entry_bkptb_data_x,
  wmb_entry_bytes_vld_v,
  wmb_entry_cancel_acc_req_x,
  wmb_entry_create_data_vld_x,
  wmb_entry_create_dp_vld_x,
  wmb_entry_create_gateclk_en_x,
  wmb_entry_create_vld_x,
  wmb_entry_data_biu_req_x,
  wmb_entry_data_ptr_after_write_shift_imme_x,
  wmb_entry_data_ptr_with_write_shift_imme_x,
  wmb_entry_data_req_wns_x,
  wmb_entry_data_req_x,
  wmb_entry_data_v,
  wmb_entry_dcache_inst_x,
  wmb_entry_dcache_way_x,
  wmb_entry_depd_x,
  wmb_entry_discard_req_x,
  wmb_entry_fwd_bytes_vld_v,
  wmb_entry_fwd_data_pe_gateclk_en_x,
  wmb_entry_fwd_data_pe_req_x,
  wmb_entry_fwd_req_x,
  wmb_entry_hit_sq_pop_dcache_line_x,
  wmb_entry_icc_and_vld_x,
  wmb_entry_icc_x,
  wmb_entry_iid_v,
  wmb_entry_inst_flush_x,
  wmb_entry_inst_is_dcache_x,
  wmb_entry_inst_mode_v,
  wmb_entry_inst_size_v,
  wmb_entry_inst_type_v,
  wmb_entry_last_addr_plus_x,
  wmb_entry_last_addr_sub_x,
  wmb_entry_mem_set_write_gateclk_en_x,
  wmb_entry_mem_set_write_grnt_x,
  wmb_entry_merge_data_addr_hit_x,
  wmb_entry_merge_data_stall_x,
  wmb_entry_merge_data_vld_x,
  wmb_entry_merge_data_wait_not_vld_req_x,
  wmb_entry_next_nc_bypass_x,
  wmb_entry_next_so_bypass_x,
  wmb_entry_no_op_x,
  wmb_entry_page_buf_x,
  wmb_entry_page_ca_x,
  wmb_entry_page_sec_x,
  wmb_entry_page_share_x,
  wmb_entry_page_so_x,
  wmb_entry_page_wa_x,
  wmb_entry_pfu_biu_req_hit_idx_x,
  wmb_entry_pop_vld_x,
  wmb_entry_preg_v,
  wmb_entry_priv_mode_v,
  wmb_entry_rb_biu_req_hit_idx_x,
  wmb_entry_read_dp_req_x,
  wmb_entry_read_ptr_chk_idx_shift_imme_x,
  wmb_entry_read_ptr_unconditional_shift_imme_x,
  wmb_entry_read_req_x,
  wmb_entry_read_resp_ready_x,
  wmb_entry_ready_to_dcache_line_x,
  wmb_entry_sc_wb_success_x,
  wmb_entry_snq_depd_remove_x,
  wmb_entry_snq_depd_x,
  wmb_entry_spec_fail_x,
  wmb_entry_sync_fence_biu_req_success_x,
  wmb_entry_sync_fence_inst_x,
  wmb_entry_sync_fence_x,
  wmb_entry_vld_x,
  wmb_entry_vstart_vld_x,
  wmb_entry_w_last_set_x,
  wmb_entry_w_last_x,
  wmb_entry_w_pending_x,
  wmb_entry_wb_cmplt_grnt_x,
  wmb_entry_wb_cmplt_req_x,
  wmb_entry_wb_data_grnt_x,
  wmb_entry_wb_data_req_x,
  wmb_entry_write_biu_dp_req_x,
  wmb_entry_write_biu_req_x,
  wmb_entry_write_dcache_req_x,
  wmb_entry_write_imme_bypass_x,
  wmb_entry_write_imme_x,
  wmb_entry_write_ptr_chk_idx_shift_imme_x,
  wmb_entry_write_ptr_unconditional_shift_imme_x,
  wmb_entry_write_req_x,
  wmb_entry_write_stall_x,
  wmb_entry_write_vb_req_x,
  wmb_read_ptr_read_req_grnt,
  wmb_read_ptr_shift_imme_grnt,
  wmb_read_ptr_x,
  wmb_same_line_resp_ready,
  wmb_wakeup_queue_not_empty,
  wmb_write_biu_dcache_line,
  wmb_write_dcache_success,
  wmb_write_ptr_shift_imme_grnt,
  wmb_write_ptr_x
);

// &Ports; @34
input   [4  :0]  biu_lsu_b_id;                                  
input            biu_lsu_b_vld;                                 
input   [4  :0]  biu_lsu_r_id;                                  
input            biu_lsu_r_vld;                                 
input            bus_arb_wmb_aw_grnt;                           
input            bus_arb_wmb_w_grnt;                            
input            cp0_lsu_icg_en;                                
input            cp0_yy_clk_en;                                 
input            cpurst_b;                                      
input   [6  :0]  dcache_dirty_din;                              
input            dcache_dirty_gwen;                             
input   [6  :0]  dcache_dirty_wen;                              
input   [8  :0]  dcache_idx;                                    
input            dcache_snq_st_sel;                             
input   [51 :0]  dcache_tag_din;                                
input            dcache_tag_gwen;                               
input   [1  :0]  dcache_tag_wen;                                
input            forever_cpuclk;                                
input   [39 :0]  ld_dc_addr0;                                   
input   [7  :0]  ld_dc_addr1_11to4;                             
input   [15 :0]  ld_dc_bytes_vld;                               
input            ld_dc_chk_atomic_inst_vld;                     
input            ld_dc_chk_ld_inst_vld;                         
input            lm_state_is_ex_wait_lock;                      
input            lm_state_is_idle;                              
input            pad_yy_icg_scan_en;                            
input   [39 :0]  pfu_biu_req_addr;                              
input            pw_merge_stall;                                
input   [39 :0]  rb_biu_req_addr;                               
input            rb_biu_req_unmask;                             
input            rtu_lsu_async_flush;                           
input            snq_can_create_snq_uncheck;                    
input   [39 :0]  snq_create_addr;                               
input   [39 :0]  sq_pop_addr;                                   
input   [1  :0]  sq_pop_priv_mode;                              
input            sq_wmb_merge_req;                              
input            sq_wmb_merge_stall_req;                        
input            vb_wmb_empty;                                  
input            vb_wmb_entry_rcl_done_x;                       
input            wmb_b_resp_exokay;                             
input   [4  :0]  wmb_biu_ar_id;                                 
input   [4  :0]  wmb_biu_aw_id;                                 
input            wmb_biu_write_en;                              
input   [39 :0]  wmb_ce_addr;                                   
input            wmb_ce_atomic;                                 
input            wmb_ce_bkpta_data;                             
input            wmb_ce_bkptb_data;                             
input   [15 :0]  wmb_ce_bytes_vld;                              
input            wmb_ce_bytes_vld_full;                         
input            wmb_ce_create_vld;                             
input   [127:0]  wmb_ce_data128;                                
input   [3  :0]  wmb_ce_data_vld;                               
input            wmb_ce_dcache_inst;                            
input   [3  :0]  wmb_ce_fence_mode;                             
input            wmb_ce_icc;                                    
input   [6  :0]  wmb_ce_iid;                                    
input            wmb_ce_inst_flush;                             
input   [1  :0]  wmb_ce_inst_mode;                              
input   [2  :0]  wmb_ce_inst_size;                              
input   [1  :0]  wmb_ce_inst_type;                              
input            wmb_ce_last_addr_plus;                         
input            wmb_ce_last_addr_sub;                          
input            wmb_ce_merge_en;                               
input            wmb_ce_page_buf;                               
input            wmb_ce_page_ca;                                
input            wmb_ce_page_sec;                               
input            wmb_ce_page_share;                             
input            wmb_ce_page_so;                                
input            wmb_ce_page_wa;                                
input   [1  :0]  wmb_ce_priv_mode;                              
input            wmb_ce_sc_wb_vld;                              
input            wmb_ce_spec_fail;                              
input            wmb_ce_sync_fence;                             
input            wmb_ce_update_dcache_dirty;                    
input            wmb_ce_update_dcache_share;                    
input            wmb_ce_update_dcache_valid;                    
input            wmb_ce_update_dcache_way;                      
input            wmb_ce_update_same_dcache_line;                
input   [7  :0]  wmb_ce_update_same_dcache_line_ptr;            
input            wmb_ce_vstart_vld;                             
input            wmb_ce_wb_cmplt_success;                       
input            wmb_ce_wb_data_success;                        
input            wmb_ce_write_imme;                             
input            wmb_create_ptr_next1_x;                        
input            wmb_create_vb_success;                         
input            wmb_data_ptr_x;                                
input            wmb_dcache_arb_req_unmask;                     
input            wmb_dcache_inst_write_req_hit_idx;             
input            wmb_dcache_req_ptr_x;                          
input            wmb_entry_create_data_vld_x;                   
input            wmb_entry_create_dp_vld_x;                     
input            wmb_entry_create_gateclk_en_x;                 
input            wmb_entry_create_vld_x;                        
input            wmb_entry_mem_set_write_gateclk_en_x;          
input            wmb_entry_mem_set_write_grnt_x;                
input            wmb_entry_merge_data_vld_x;                    
input            wmb_entry_merge_data_wait_not_vld_req_x;       
input            wmb_entry_next_nc_bypass_x;                    
input            wmb_entry_next_so_bypass_x;                    
input            wmb_entry_w_last_set_x;                        
input            wmb_entry_wb_cmplt_grnt_x;                     
input            wmb_entry_wb_data_grnt_x;                      
input            wmb_read_ptr_read_req_grnt;                    
input            wmb_read_ptr_shift_imme_grnt;                  
input            wmb_read_ptr_x;                                
input   [7  :0]  wmb_same_line_resp_ready;                      
input            wmb_wakeup_queue_not_empty;                    
input            wmb_write_biu_dcache_line;                     
input            wmb_write_dcache_success;                      
input            wmb_write_ptr_shift_imme_grnt;                 
input            wmb_write_ptr_x;                               
output  [39 :0]  wmb_entry_addr_v;                              
output           wmb_entry_ar_pending_x;                        
output           wmb_entry_atomic_and_vld_x;                    
output           wmb_entry_atomic_x;                            
output           wmb_entry_aw_pending_x;                        
output  [4  :0]  wmb_entry_biu_id_v;                            
output           wmb_entry_bkpta_data_x;                        
output           wmb_entry_bkptb_data_x;                        
output  [15 :0]  wmb_entry_bytes_vld_v;                         
output           wmb_entry_cancel_acc_req_x;                    
output           wmb_entry_data_biu_req_x;                      
output           wmb_entry_data_ptr_after_write_shift_imme_x;   
output           wmb_entry_data_ptr_with_write_shift_imme_x;    
output           wmb_entry_data_req_wns_x;                      
output           wmb_entry_data_req_x;                          
output  [127:0]  wmb_entry_data_v;                              
output           wmb_entry_dcache_inst_x;                       
output           wmb_entry_dcache_way_x;                        
output           wmb_entry_depd_x;                              
output           wmb_entry_discard_req_x;                       
output  [15 :0]  wmb_entry_fwd_bytes_vld_v;                     
output           wmb_entry_fwd_data_pe_gateclk_en_x;            
output           wmb_entry_fwd_data_pe_req_x;                   
output           wmb_entry_fwd_req_x;                           
output           wmb_entry_hit_sq_pop_dcache_line_x;            
output           wmb_entry_icc_and_vld_x;                       
output           wmb_entry_icc_x;                               
output  [6  :0]  wmb_entry_iid_v;                               
output           wmb_entry_inst_flush_x;                        
output           wmb_entry_inst_is_dcache_x;                    
output  [1  :0]  wmb_entry_inst_mode_v;                         
output  [2  :0]  wmb_entry_inst_size_v;                         
output  [1  :0]  wmb_entry_inst_type_v;                         
output           wmb_entry_last_addr_plus_x;                    
output           wmb_entry_last_addr_sub_x;                     
output           wmb_entry_merge_data_addr_hit_x;               
output           wmb_entry_merge_data_stall_x;                  
output           wmb_entry_no_op_x;                             
output           wmb_entry_page_buf_x;                          
output           wmb_entry_page_ca_x;                           
output           wmb_entry_page_sec_x;                          
output           wmb_entry_page_share_x;                        
output           wmb_entry_page_so_x;                           
output           wmb_entry_page_wa_x;                           
output           wmb_entry_pfu_biu_req_hit_idx_x;               
output           wmb_entry_pop_vld_x;                           
output  [6  :0]  wmb_entry_preg_v;                              
output  [1  :0]  wmb_entry_priv_mode_v;                         
output           wmb_entry_rb_biu_req_hit_idx_x;                
output           wmb_entry_read_dp_req_x;                       
output           wmb_entry_read_ptr_chk_idx_shift_imme_x;       
output           wmb_entry_read_ptr_unconditional_shift_imme_x; 
output           wmb_entry_read_req_x;                          
output           wmb_entry_read_resp_ready_x;                   
output           wmb_entry_ready_to_dcache_line_x;              
output           wmb_entry_sc_wb_success_x;                     
output           wmb_entry_snq_depd_remove_x;                   
output           wmb_entry_snq_depd_x;                          
output           wmb_entry_spec_fail_x;                         
output           wmb_entry_sync_fence_biu_req_success_x;        
output           wmb_entry_sync_fence_inst_x;                   
output           wmb_entry_sync_fence_x;                        
output           wmb_entry_vld_x;                               
output           wmb_entry_vstart_vld_x;                        
output           wmb_entry_w_last_x;                            
output           wmb_entry_w_pending_x;                         
output           wmb_entry_wb_cmplt_req_x;                      
output           wmb_entry_wb_data_req_x;                       
output           wmb_entry_write_biu_dp_req_x;                  
output           wmb_entry_write_biu_req_x;                     
output           wmb_entry_write_dcache_req_x;                  
output           wmb_entry_write_imme_bypass_x;                 
output           wmb_entry_write_imme_x;                        
output           wmb_entry_write_ptr_chk_idx_shift_imme_x;      
output           wmb_entry_write_ptr_unconditional_shift_imme_x; 
output           wmb_entry_write_req_x;                         
output           wmb_entry_write_stall_x;                       
output           wmb_entry_write_vb_req_x;                      

// &Regs; @35
reg     [39 :0]  wmb_entry_addr;                                
reg              wmb_entry_atomic;                              
reg              wmb_entry_biu_b_id_vld;                        
reg     [4  :0]  wmb_entry_biu_id;                              
reg              wmb_entry_biu_r_id_vld;                        
reg              wmb_entry_bkpta_data;                          
reg              wmb_entry_bkptb_data;                          
reg     [15 :0]  wmb_entry_bytes_vld;                           
reg              wmb_entry_bytes_vld_full;                      
reg     [127:0]  wmb_entry_data;                                
reg              wmb_entry_data_req_success;                    
reg              wmb_entry_dcache_dirty;                        
reg              wmb_entry_dcache_share;                        
reg              wmb_entry_dcache_valid;                        
reg              wmb_entry_dcache_way;                          
reg              wmb_entry_depd;                                
reg     [3  :0]  wmb_entry_fence_mode;                          
reg              wmb_entry_icc;                                 
reg     [6  :0]  wmb_entry_iid;                                 
reg              wmb_entry_inst_flush;                          
reg              wmb_entry_inst_is_dcache;                      
reg     [1  :0]  wmb_entry_inst_mode;                           
reg     [2  :0]  wmb_entry_inst_size;                           
reg     [1  :0]  wmb_entry_inst_type;                           
reg              wmb_entry_last_addr_plus;                      
reg              wmb_entry_last_addr_sub;                       
reg              wmb_entry_mem_set_req;                         
reg              wmb_entry_merge_en;                            
reg              wmb_entry_page_buf;                            
reg              wmb_entry_page_ca;                             
reg              wmb_entry_page_sec;                            
reg              wmb_entry_page_share;                          
reg              wmb_entry_page_so;                             
reg              wmb_entry_page_wa;                             
reg     [1  :0]  wmb_entry_priv_mode;                           
reg              wmb_entry_read_req_success;                    
reg              wmb_entry_read_resp;                           
reg              wmb_entry_same_dcache_line;                    
reg     [7  :0]  wmb_entry_same_dcache_line_ptr;                
reg              wmb_entry_sc_wb_success;                       
reg              wmb_entry_sc_wb_vld;                           
reg              wmb_entry_spec_fail;                           
reg              wmb_entry_sync_fence;                          
reg              wmb_entry_vld;                                 
reg              wmb_entry_vstart_vld;                          
reg              wmb_entry_w_last;                              
reg              wmb_entry_wb_cmplt_success;                    
reg              wmb_entry_wb_data_success;                     
reg              wmb_entry_write_imme;                          
reg              wmb_entry_write_req_success;                   
reg              wmb_entry_write_resp;                          
reg              wmb_entry_write_stall;                         

// &Wires; @36
wire    [4  :0]  biu_lsu_b_id;                                  
wire             biu_lsu_b_vld;                                 
wire    [4  :0]  biu_lsu_r_id;                                  
wire             biu_lsu_r_vld;                                 
wire             bus_arb_wmb_aw_grnt;                           
wire             bus_arb_wmb_w_grnt;                            
wire             cp0_lsu_icg_en;                                
wire             cp0_yy_clk_en;                                 
wire             cpurst_b;                                      
wire    [6  :0]  dcache_dirty_din;                              
wire             dcache_dirty_gwen;                             
wire    [6  :0]  dcache_dirty_wen;                              
wire    [8  :0]  dcache_idx;                                    
wire             dcache_snq_st_sel;                             
wire    [51 :0]  dcache_tag_din;                                
wire             dcache_tag_gwen;                               
wire    [1  :0]  dcache_tag_wen;                                
wire             forever_cpuclk;                                
wire    [39 :0]  ld_dc_addr0;                                   
wire    [7  :0]  ld_dc_addr1_11to4;                             
wire    [15 :0]  ld_dc_bytes_vld;                               
wire             ld_dc_chk_atomic_inst_vld;                     
wire             ld_dc_chk_ld_inst_vld;                         
wire             lm_state_is_ex_wait_lock;                      
wire             lm_state_is_idle;                              
wire             pad_yy_icg_scan_en;                            
wire    [39 :0]  pfu_biu_req_addr;                              
wire             pw_merge_stall;                                
wire    [39 :0]  rb_biu_req_addr;                               
wire             rb_biu_req_unmask;                             
wire             rtu_lsu_async_flush;                           
wire             snq_can_create_snq_uncheck;                    
wire    [39 :0]  snq_create_addr;                               
wire    [39 :0]  sq_pop_addr;                                   
wire    [1  :0]  sq_pop_priv_mode;                              
wire             sq_wmb_merge_req;                              
wire             sq_wmb_merge_stall_req;                        
wire             vb_wmb_empty;                                  
wire             vb_wmb_entry_rcl_done;                         
wire             vb_wmb_entry_rcl_done_x;                       
wire             wmb_b_resp_exokay;                             
wire    [4  :0]  wmb_biu_ar_id;                                 
wire    [4  :0]  wmb_biu_aw_id;                                 
wire             wmb_biu_write_en;                              
wire    [39 :0]  wmb_ce_addr;                                   
wire             wmb_ce_atomic;                                 
wire             wmb_ce_bkpta_data;                             
wire             wmb_ce_bkptb_data;                             
wire    [15 :0]  wmb_ce_bytes_vld;                              
wire             wmb_ce_bytes_vld_full;                         
wire             wmb_ce_create_vld;                             
wire    [127:0]  wmb_ce_data128;                                
wire    [3  :0]  wmb_ce_data_vld;                               
wire             wmb_ce_dcache_inst;                            
wire    [3  :0]  wmb_ce_fence_mode;                             
wire             wmb_ce_icc;                                    
wire    [6  :0]  wmb_ce_iid;                                    
wire             wmb_ce_inst_flush;                             
wire    [1  :0]  wmb_ce_inst_mode;                              
wire    [2  :0]  wmb_ce_inst_size;                              
wire    [1  :0]  wmb_ce_inst_type;                              
wire             wmb_ce_last_addr_plus;                         
wire             wmb_ce_last_addr_sub;                          
wire             wmb_ce_merge_en;                               
wire             wmb_ce_page_buf;                               
wire             wmb_ce_page_ca;                                
wire             wmb_ce_page_sec;                               
wire             wmb_ce_page_share;                             
wire             wmb_ce_page_so;                                
wire             wmb_ce_page_wa;                                
wire    [1  :0]  wmb_ce_priv_mode;                              
wire             wmb_ce_sc_wb_vld;                              
wire             wmb_ce_spec_fail;                              
wire             wmb_ce_sync_fence;                             
wire             wmb_ce_update_dcache_dirty;                    
wire             wmb_ce_update_dcache_share;                    
wire             wmb_ce_update_dcache_valid;                    
wire             wmb_ce_update_dcache_way;                      
wire             wmb_ce_update_same_dcache_line;                
wire    [7  :0]  wmb_ce_update_same_dcache_line_ptr;            
wire             wmb_ce_vstart_vld;                             
wire             wmb_ce_wb_cmplt_success;                       
wire             wmb_ce_wb_data_success;                        
wire             wmb_ce_write_imme;                             
wire             wmb_create_ptr_next1;                          
wire             wmb_create_ptr_next1_x;                        
wire             wmb_create_vb_success;                         
wire             wmb_data_ptr;                                  
wire             wmb_data_ptr_x;                                
wire             wmb_dcache_arb_req_unmask;                     
wire             wmb_dcache_inst_write_req_hit_idx;             
wire             wmb_dcache_req_ptr;                            
wire             wmb_dcache_req_ptr_x;                          
wire    [39 :0]  wmb_entry_addr_v;                              
wire    [15 :0]  wmb_entry_and_ld_dc_bytes_vld;                 
wire             wmb_entry_and_ld_dc_bytes_vld_hit;             
wire             wmb_entry_ar_pending;                          
wire             wmb_entry_ar_pending_x;                        
wire             wmb_entry_atomic_and_vld;                      
wire             wmb_entry_atomic_and_vld_x;                    
wire             wmb_entry_atomic_x;                            
wire             wmb_entry_aw_pending;                          
wire             wmb_entry_aw_pending_x;                        
wire             wmb_entry_b_id_hit;                            
wire             wmb_entry_b_resp_vld;                          
wire             wmb_entry_biu_b_id_vld_set;                    
wire             wmb_entry_biu_id_clk;                          
wire             wmb_entry_biu_id_clk_en;                       
wire    [4  :0]  wmb_entry_biu_id_v;                            
wire             wmb_entry_biu_r_id_vld_set;                    
wire             wmb_entry_bkpta_data_x;                        
wire             wmb_entry_bkptb_data_x;                        
wire    [15 :0]  wmb_entry_bytes_vld_and;                       
wire             wmb_entry_bytes_vld_clk;                       
wire             wmb_entry_bytes_vld_clk_en;                    
wire             wmb_entry_bytes_vld_full_and;                  
wire    [15 :0]  wmb_entry_bytes_vld_v;                         
wire             wmb_entry_cancel_acc_req;                      
wire             wmb_entry_cancel_acc_req_x;                    
wire             wmb_entry_clk;                                 
wire             wmb_entry_clk_en;                              
wire             wmb_entry_create_clk;                          
wire             wmb_entry_create_clk_en;                       
wire    [3  :0]  wmb_entry_create_data;                         
wire             wmb_entry_create_data_vld;                     
wire             wmb_entry_create_data_vld_x;                   
wire             wmb_entry_create_dp_vld;                       
wire             wmb_entry_create_dp_vld_x;                     
wire             wmb_entry_create_gateclk_en;                   
wire             wmb_entry_create_gateclk_en_x;                 
wire             wmb_entry_create_merge_data_gateclk_en;        
wire             wmb_entry_create_vld;                          
wire             wmb_entry_create_vld_x;                        
wire             wmb_entry_ctc_inst;                            
wire             wmb_entry_data0_clk;                           
wire             wmb_entry_data1_clk;                           
wire             wmb_entry_data2_clk;                           
wire             wmb_entry_data3_clk;                           
wire             wmb_entry_data_biu_req;                        
wire             wmb_entry_data_biu_req_x;                      
wire    [3  :0]  wmb_entry_data_clk_en;                         
wire    [127:0]  wmb_entry_data_next;                           
wire             wmb_entry_data_ptr_after_write_shift_imme;     
wire             wmb_entry_data_ptr_after_write_shift_imme_x;   
wire             wmb_entry_data_ptr_with_write_shift_imme;      
wire             wmb_entry_data_ptr_with_write_shift_imme_x;    
wire             wmb_entry_data_req;                            
wire             wmb_entry_data_req_success_set;                
wire             wmb_entry_data_req_wns;                        
wire             wmb_entry_data_req_wns_x;                      
wire             wmb_entry_data_req_x;                          
wire    [127:0]  wmb_entry_data_v;                              
wire             wmb_entry_dcache_1line_inst;                   
wire             wmb_entry_dcache_addr_inst;                    
wire             wmb_entry_dcache_addr_l1_inst;                 
wire             wmb_entry_dcache_addr_not_l1_inst;             
wire             wmb_entry_dcache_all_inst;                     
wire             wmb_entry_dcache_clr_1line_inst;               
wire             wmb_entry_dcache_clr_addr_inst;                
wire             wmb_entry_dcache_clr_sw_inst;                  
wire             wmb_entry_dcache_except_only_inv_1line_inst;   
wire             wmb_entry_dcache_hit_idx;                      
wire             wmb_entry_dcache_inst;                         
wire             wmb_entry_dcache_inst_x;                       
wire             wmb_entry_dcache_only_inv_1line_inst;          
wire             wmb_entry_dcache_only_inv_addr_inst;           
wire             wmb_entry_dcache_only_inv_sw_inst;             
wire             wmb_entry_dcache_sw_inst;                      
wire             wmb_entry_dcache_update_vld;                   
wire             wmb_entry_dcache_update_vld_unmask;            
wire             wmb_entry_dcache_way_x;                        
wire             wmb_entry_depd_addr1_11to4_hit;                
wire             wmb_entry_depd_addr1_tto4_hit;                 
wire             wmb_entry_depd_addr_11to4_hit;                 
wire             wmb_entry_depd_addr_tto12_hit;                 
wire             wmb_entry_depd_addr_tto4_hit;                  
wire             wmb_entry_depd_do_hit;                         
wire             wmb_entry_depd_hit1;                           
wire             wmb_entry_depd_hit2;                           
wire             wmb_entry_depd_hit3;                           
wire             wmb_entry_depd_hit5;                           
wire             wmb_entry_depd_x;                              
wire             wmb_entry_discard_req;                         
wire             wmb_entry_discard_req_x;                       
wire    [15 :0]  wmb_entry_fwd_bytes_vld;                       
wire    [15 :0]  wmb_entry_fwd_bytes_vld_v;                     
wire             wmb_entry_fwd_data_pe_gateclk_en;              
wire             wmb_entry_fwd_data_pe_gateclk_en_x;            
wire             wmb_entry_fwd_data_pe_req;                     
wire             wmb_entry_fwd_data_pe_req_x;                   
wire             wmb_entry_fwd_data_pre;                        
wire             wmb_entry_fwd_req;                             
wire             wmb_entry_fwd_req_x;                           
wire             wmb_entry_hit_sq_pop_addr_5to4;                
wire             wmb_entry_hit_sq_pop_addr_tto4;                
wire             wmb_entry_hit_sq_pop_addr_tto6;                
wire             wmb_entry_hit_sq_pop_dcache_line;              
wire             wmb_entry_hit_sq_pop_dcache_line_x;            
wire             wmb_entry_icc_and_vld;                         
wire             wmb_entry_icc_and_vld_x;                       
wire             wmb_entry_icc_x;                               
wire             wmb_entry_idx_cmpare_inst;                     
wire             wmb_entry_idx_snq_dep_inst;                    
wire    [6  :0]  wmb_entry_iid_v;                               
wire             wmb_entry_inst_flush_x;                        
wire             wmb_entry_inst_is_dcache_x;                    
wire    [1  :0]  wmb_entry_inst_mode_v;                         
wire    [2  :0]  wmb_entry_inst_size_v;                         
wire    [1  :0]  wmb_entry_inst_type_v;                         
wire             wmb_entry_last_addr_plus_x;                    
wire             wmb_entry_last_addr_sub_x;                     
wire             wmb_entry_mem_set_write_gateclk_en;            
wire             wmb_entry_mem_set_write_gateclk_en_x;          
wire             wmb_entry_mem_set_write_grnt;                  
wire             wmb_entry_mem_set_write_grnt_x;                
wire    [3  :0]  wmb_entry_merge_data;                          
wire             wmb_entry_merge_data_addr_hit;                 
wire             wmb_entry_merge_data_addr_hit_x;               
wire             wmb_entry_merge_data_grnt;                     
wire             wmb_entry_merge_data_permit;                   
wire             wmb_entry_merge_data_stall;                    
wire             wmb_entry_merge_data_stall_x;                  
wire             wmb_entry_merge_data_vld;                      
wire             wmb_entry_merge_data_vld_x;                    
wire             wmb_entry_merge_data_wait_not_vld_req;         
wire             wmb_entry_merge_data_wait_not_vld_req_x;       
wire             wmb_entry_merge_data_write_imme_set;           
wire             wmb_entry_next_nc_bypass;                      
wire             wmb_entry_next_nc_bypass_x;                    
wire             wmb_entry_next_so_bypass;                      
wire             wmb_entry_next_so_bypass_x;                    
wire             wmb_entry_no_op;                               
wire             wmb_entry_no_op_x;                             
wire             wmb_entry_page_buf_x;                          
wire             wmb_entry_page_ca_dcache_valid;                
wire             wmb_entry_page_ca_x;                           
wire             wmb_entry_page_sec_x;                          
wire             wmb_entry_page_share_x;                        
wire             wmb_entry_page_so_x;                           
wire             wmb_entry_page_wa_x;                           
wire             wmb_entry_pfu_biu_req_hit_idx;                 
wire             wmb_entry_pfu_biu_req_hit_idx_x;               
wire             wmb_entry_pop_vld;                             
wire             wmb_entry_pop_vld_x;                           
wire    [6  :0]  wmb_entry_preg;                                
wire    [6  :0]  wmb_entry_preg_v;                              
wire    [1  :0]  wmb_entry_priv_mode_v;                         
wire             wmb_entry_r_id_hit;                            
wire             wmb_entry_r_resp_vld;                          
wire             wmb_entry_rb_biu_req_hit_idx;                  
wire             wmb_entry_rb_biu_req_hit_idx_x;                
wire             wmb_entry_read_dp_req;                         
wire             wmb_entry_read_dp_req_x;                       
wire             wmb_entry_read_ptr_chk_idx_shift_imme;         
wire             wmb_entry_read_ptr_chk_idx_shift_imme_x;       
wire             wmb_entry_read_ptr_not_already_success;        
wire             wmb_entry_read_ptr_shift_imme;                 
wire             wmb_entry_read_ptr_unconditional_shift_imme;   
wire             wmb_entry_read_ptr_unconditional_shift_imme_x; 
wire             wmb_entry_read_req;                            
wire             wmb_entry_read_req_success_set;                
wire             wmb_entry_read_req_x;                          
wire             wmb_entry_read_resp_not_write;                 
wire             wmb_entry_read_resp_ready;                     
wire             wmb_entry_read_resp_ready_x;                   
wire             wmb_entry_read_resp_set;                       
wire             wmb_entry_ready_to_dcache_line;                
wire             wmb_entry_ready_to_dcache_line_x;              
wire             wmb_entry_same_dcache_line_clr;                
wire             wmb_entry_same_dcache_line_ready;              
wire             wmb_entry_sc_inst;                             
wire             wmb_entry_sc_wb_set;                           
wire             wmb_entry_sc_wb_success_set;                   
wire             wmb_entry_sc_wb_success_x;                     
wire             wmb_entry_snq_create_addr_hit_idx;             
wire             wmb_entry_snq_create_hit_idx;                  
wire             wmb_entry_snq_depd;                            
wire             wmb_entry_snq_depd_remove;                     
wire             wmb_entry_snq_depd_remove_x;                   
wire             wmb_entry_snq_depd_x;                          
wire             wmb_entry_snq_set_write_imme;                  
wire             wmb_entry_so_st_inst;                          
wire             wmb_entry_spec_fail_x;                         
wire             wmb_entry_st_inst;                             
wire             wmb_entry_stamo_inst;                          
wire             wmb_entry_sync_fence_biu_req_success;          
wire             wmb_entry_sync_fence_biu_req_success_x;        
wire             wmb_entry_sync_fence_inst;                     
wire             wmb_entry_sync_fence_inst_x;                   
wire             wmb_entry_sync_fence_x;                        
wire             wmb_entry_update_dcache_dirty;                 
wire             wmb_entry_update_dcache_share;                 
wire             wmb_entry_update_dcache_valid;                 
wire             wmb_entry_update_dcache_way;                   
wire             wmb_entry_vld_x;                               
wire             wmb_entry_vstart_vld_x;                        
wire             wmb_entry_w_last_set;                          
wire             wmb_entry_w_last_set_x;                        
wire             wmb_entry_w_last_x;                            
wire             wmb_entry_w_pending;                           
wire             wmb_entry_w_pending_x;                         
wire             wmb_entry_wb_cmplt_grnt;                       
wire             wmb_entry_wb_cmplt_grnt_x;                     
wire             wmb_entry_wb_cmplt_req;                        
wire             wmb_entry_wb_cmplt_req_x;                      
wire             wmb_entry_wb_data_grnt;                        
wire             wmb_entry_wb_data_grnt_x;                      
wire             wmb_entry_wb_data_req;                         
wire             wmb_entry_wb_data_req_x;                       
wire             wmb_entry_wo_st_inst;                          
wire             wmb_entry_wo_st_write_biu_req;                 
wire             wmb_entry_write_biu_dp_req;                    
wire             wmb_entry_write_biu_dp_req_x;                  
wire             wmb_entry_write_biu_req;                       
wire             wmb_entry_write_biu_req_x;                     
wire             wmb_entry_write_dcache_req;                    
wire             wmb_entry_write_dcache_req_x;                  
wire             wmb_entry_write_imme_bypass;                   
wire             wmb_entry_write_imme_bypass_x;                 
wire             wmb_entry_write_imme_set;                      
wire             wmb_entry_write_imme_x;                        
wire             wmb_entry_write_ptr_chk_idx_shift_imme;        
wire             wmb_entry_write_ptr_chk_idx_shift_imme_x;      
wire             wmb_entry_write_ptr_shift_imme;                
wire             wmb_entry_write_ptr_unconditional_shift_imme;  
wire             wmb_entry_write_ptr_unconditional_shift_imme_x; 
wire             wmb_entry_write_req;                           
wire             wmb_entry_write_req_success_set;               
wire             wmb_entry_write_req_x;                         
wire             wmb_entry_write_resp_set;                      
wire             wmb_entry_write_stall_x;                       
wire             wmb_entry_write_vb_req;                        
wire             wmb_entry_write_vb_req_x;                      
wire             wmb_read_ptr;                                  
wire             wmb_read_ptr_read_req_grnt;                    
wire             wmb_read_ptr_shift_imme_grnt;                  
wire             wmb_read_ptr_x;                                
wire    [7  :0]  wmb_same_line_resp_ready;                      
wire             wmb_wakeup_queue_not_empty;                    
wire             wmb_write_biu_dcache_line;                     
wire             wmb_write_dcache_success;                      
wire             wmb_write_ptr;                                 
wire             wmb_write_ptr_shift_imme_grnt;                 
wire             wmb_write_ptr_x;                               


parameter WMB_ENTRY = 8;  

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//----------entry gateclk---------------
assign wmb_entry_clk_en = wmb_entry_vld
                          ||  wmb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_wmb_entry_gated_clk"); @46
gated_clk_cell  x_lsu_wmb_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wmb_entry_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (wmb_entry_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @47
//          .external_en   (1'b0               ), @48
//          .global_en     (cp0_yy_clk_en      ), @49
//          .module_en     (cp0_lsu_icg_en     ), @50
//          .local_en      (wmb_entry_clk_en    ), @51
//          .clk_out       (wmb_entry_clk       )); @52

//-----------create gateclk-------------
assign wmb_entry_create_clk_en  = wmb_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_wmb_entry_create_up_gated_clk"); @56
gated_clk_cell  x_lsu_wmb_entry_create_up_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (wmb_entry_create_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (wmb_entry_create_clk_en),
  .module_en               (cp0_lsu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in        (forever_cpuclk     ), @57
//          .external_en   (1'b0               ), @58
//          .global_en     (cp0_yy_clk_en      ), @59
//          .module_en     (cp0_lsu_icg_en     ), @60
//          .local_en      (wmb_entry_create_clk_en), @61
//          .clk_out       (wmb_entry_create_clk)); @62

//----------data gateclk----------------
// &Instance("gated_clk_cell", "x_lsu_wmb_entry_bytes_vld_gated_clk"); @65
gated_clk_cell  x_lsu_wmb_entry_bytes_vld_gated_clk (
  .clk_in                     (forever_cpuclk            ),
  .clk_out                    (wmb_entry_bytes_vld_clk   ),
  .external_en                (1'b0                      ),
  .global_en                  (cp0_yy_clk_en             ),
  .local_en                   (wmb_entry_bytes_vld_clk_en),
  .module_en                  (cp0_lsu_icg_en            ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        )
);

// &Connect(.clk_in        (forever_cpuclk     ), @66
//          .external_en   (1'b0               ), @67
//          .global_en     (cp0_yy_clk_en      ), @68
//          .module_en     (cp0_lsu_icg_en     ), @69
//          .local_en      (wmb_entry_bytes_vld_clk_en), @70
//          .clk_out       (wmb_entry_bytes_vld_clk)); @71

// &Instance("gated_clk_cell", "x_lsu_wmb_entry_data0_gated_clk"); @73
gated_clk_cell  x_lsu_wmb_entry_data0_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (wmb_entry_data0_clk     ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (wmb_entry_data_clk_en[0]),
  .module_en                (cp0_lsu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in        (forever_cpuclk     ), @74
//          .external_en   (1'b0               ), @75
//          .global_en     (cp0_yy_clk_en      ), @76
//          .module_en     (cp0_lsu_icg_en     ), @77
//          .local_en      (wmb_entry_data_clk_en[0]), @78
//          .clk_out       (wmb_entry_data0_clk)); @79

// &Instance("gated_clk_cell", "x_lsu_wmb_entry_data1_gated_clk"); @81
gated_clk_cell  x_lsu_wmb_entry_data1_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (wmb_entry_data1_clk     ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (wmb_entry_data_clk_en[1]),
  .module_en                (cp0_lsu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in        (forever_cpuclk     ), @82
//          .external_en   (1'b0               ), @83
//          .global_en     (cp0_yy_clk_en      ), @84
//          .module_en     (cp0_lsu_icg_en     ), @85
//          .local_en      (wmb_entry_data_clk_en[1]), @86
//          .clk_out       (wmb_entry_data1_clk)); @87

// &Instance("gated_clk_cell", "x_lsu_wmb_entry_data2_gated_clk"); @89
gated_clk_cell  x_lsu_wmb_entry_data2_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (wmb_entry_data2_clk     ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (wmb_entry_data_clk_en[2]),
  .module_en                (cp0_lsu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in        (forever_cpuclk     ), @90
//          .external_en   (1'b0               ), @91
//          .global_en     (cp0_yy_clk_en      ), @92
//          .module_en     (cp0_lsu_icg_en     ), @93
//          .local_en      (wmb_entry_data_clk_en[2]), @94
//          .clk_out       (wmb_entry_data2_clk)); @95

// &Instance("gated_clk_cell", "x_lsu_wmb_entry_data3_gated_clk"); @97
gated_clk_cell  x_lsu_wmb_entry_data3_gated_clk (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (wmb_entry_data3_clk     ),
  .external_en              (1'b0                    ),
  .global_en                (cp0_yy_clk_en           ),
  .local_en                 (wmb_entry_data_clk_en[3]),
  .module_en                (cp0_lsu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in        (forever_cpuclk     ), @98
//          .external_en   (1'b0               ), @99
//          .global_en     (cp0_yy_clk_en      ), @100
//          .module_en     (cp0_lsu_icg_en     ), @101
//          .local_en      (wmb_entry_data_clk_en[3]), @102
//          .clk_out       (wmb_entry_data3_clk)); @103

//biu_id_gate_clk
assign wmb_entry_biu_id_clk_en  = wmb_entry_create_gateclk_en
//                                  ||  vb_wmb_entry_rcl_done_gateclk_en
                                  ||  wmb_entry_read_req
                                  ||  wmb_entry_write_biu_req
                                  ||  wmb_entry_mem_set_write_gateclk_en
                                  ||  wmb_entry_r_id_hit
                                  ||  wmb_entry_b_id_hit;
// &Instance("gated_clk_cell", "x_lsu_wmb_entry_biu_id_gated_clk"); @113
gated_clk_cell  x_lsu_wmb_entry_biu_id_gated_clk (
  .clk_in                  (forever_cpuclk         ),
  .clk_out                 (wmb_entry_biu_id_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (wmb_entry_biu_id_clk_en),
  .module_en               (cp0_lsu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in        (forever_cpuclk     ), @114
//          .external_en   (1'b0               ), @115
//          .global_en     (cp0_yy_clk_en      ), @116
//          .module_en     (cp0_lsu_icg_en     ), @117
//          .local_en      (wmb_entry_biu_id_clk_en), @118
//          .clk_out       (wmb_entry_biu_id_clk)); @119

//==========================================================
//                 Register
//==========================================================
//+-----------+
//| entry_vld |
//+-----------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_vld             <=  1'b0;
  else if(wmb_entry_pop_vld)
    wmb_entry_vld             <=  1'b0;
  else if(wmb_entry_create_vld)
    wmb_entry_vld             <=  1'b1;
end

//+-------------------------+
//| instruction information |
//+-------------------------+
always @(posedge wmb_entry_create_clk)
begin
  if(wmb_entry_create_dp_vld)
  begin
    wmb_entry_sync_fence      <=  wmb_ce_sync_fence;
    wmb_entry_atomic          <=  wmb_ce_atomic;
    wmb_entry_icc             <=  wmb_ce_icc;
    wmb_entry_inst_flush      <=  wmb_ce_inst_flush;
    wmb_entry_inst_is_dcache  <=  wmb_ce_dcache_inst;
    wmb_entry_inst_type[1:0]  <=  wmb_ce_inst_type[1:0];
    wmb_entry_inst_size[2:0]  <=  wmb_ce_inst_size[2:0];
    wmb_entry_inst_mode[1:0]  <=  wmb_ce_inst_mode[1:0];
    wmb_entry_fence_mode[3:0] <=  wmb_ce_fence_mode[3:0];
    wmb_entry_iid[6:0]        <=  wmb_ce_iid[6:0];
    wmb_entry_priv_mode[1:0]  <=  wmb_ce_priv_mode[1:0];
    wmb_entry_page_share      <=  wmb_ce_page_share;
    wmb_entry_page_so         <=  wmb_ce_page_so;
    wmb_entry_page_ca         <=  wmb_ce_page_ca;
    wmb_entry_page_wa         <=  wmb_ce_page_wa;
    wmb_entry_page_buf        <=  wmb_ce_page_buf;
    wmb_entry_page_sec        <=  wmb_ce_page_sec;
    wmb_entry_merge_en        <=  wmb_ce_merge_en;
    wmb_entry_addr[`PA_WIDTH-1:0] <=  wmb_ce_addr[`PA_WIDTH-1:0];
    wmb_entry_spec_fail       <=  wmb_ce_spec_fail;
    wmb_entry_bkpta_data      <=  wmb_ce_bkpta_data;
    wmb_entry_bkptb_data      <=  wmb_ce_bkptb_data;
    wmb_entry_vstart_vld      <=  wmb_ce_vstart_vld;
  end
end

//+-------------------+
//| cache_information |
//+-------------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    wmb_entry_dcache_valid     <=  1'b0;
    wmb_entry_dcache_share     <=  1'b0;
    wmb_entry_dcache_dirty     <=  1'b0;
    wmb_entry_dcache_way       <=  1'b0;
  end
  else if(wmb_entry_create_dp_vld)
  begin
    wmb_entry_dcache_valid     <=  wmb_ce_update_dcache_valid;
    wmb_entry_dcache_share     <=  wmb_ce_update_dcache_share;
    wmb_entry_dcache_dirty     <=  wmb_ce_update_dcache_dirty;
    wmb_entry_dcache_way       <=  wmb_ce_update_dcache_way;
  end
  else if(wmb_entry_dcache_update_vld)
  begin
    wmb_entry_dcache_valid     <=  wmb_entry_update_dcache_valid;
    wmb_entry_dcache_share     <=  wmb_entry_update_dcache_share;
    wmb_entry_dcache_dirty     <=  wmb_entry_update_dcache_dirty;
    wmb_entry_dcache_way       <=  wmb_entry_update_dcache_way;
  end
end

//+--------------------+
//| already merge grnt |
//+--------------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_write_stall  <=  1'b0;
  else if(wmb_entry_merge_data_grnt
    &&  sq_wmb_merge_req
    &&  wmb_ce_create_vld)
    wmb_entry_write_stall  <=  1'b1;
  else
    wmb_entry_write_stall  <=  1'b0;
end

//+--------------------+
//| data and bytes_vld |
//+--------------------+
always @(posedge wmb_entry_bytes_vld_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    wmb_entry_bytes_vld_full  <=  1'b0;
    wmb_entry_bytes_vld[15:0] <=  16'b0;
  end
  else if(wmb_entry_create_dp_vld)
  begin
    wmb_entry_bytes_vld_full  <=  wmb_ce_bytes_vld_full;
    wmb_entry_bytes_vld[15:0] <=  wmb_ce_bytes_vld[15:0];
  end
  else if(wmb_entry_merge_data_vld)
  begin
    wmb_entry_bytes_vld_full  <=  wmb_entry_bytes_vld_full_and;
    wmb_entry_bytes_vld[15:0] <=  wmb_entry_bytes_vld_and[15:0];
  end
end

always @(posedge wmb_entry_data0_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_data[31:0]      <=  32'b0;
  else if(wmb_entry_create_data[0] ||  wmb_entry_merge_data[0])
    wmb_entry_data[31:0]      <=  wmb_entry_data_next[31:0];
end

always @(posedge wmb_entry_data1_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_data[63:32]     <=  32'b0;
  else if(wmb_entry_create_data[1] ||  wmb_entry_merge_data[1])
    wmb_entry_data[63:32]     <=  wmb_entry_data_next[63:32];
end

always @(posedge wmb_entry_data2_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_data[95:64]     <=  32'b0;
  else if(wmb_entry_create_data[2] ||  wmb_entry_merge_data[2])
    wmb_entry_data[95:64]     <=  wmb_entry_data_next[95:64];
end

always @(posedge wmb_entry_data3_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_data[127:96]    <=  32'b0;
  else if(wmb_entry_create_data[3] ||  wmb_entry_merge_data[3])
    wmb_entry_data[127:96]    <=  wmb_entry_data_next[127:96];
end

//------------------success/resp signal---------------------
//+------------------+
//| read_req_success |
//+------------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_read_req_success  <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_read_req_success  <=  1'b0;
  else if(wmb_entry_read_req_success_set)
    wmb_entry_read_req_success  <=  1'b1;
end

//+-----------+
//| read_resp |
//+-----------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_read_resp         <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_read_resp         <=  1'b0;
  else if(wmb_entry_read_resp_set)
    wmb_entry_read_resp         <=  1'b1;
end

//+-------------------+
//| write_req_success |
//+-------------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_write_req_success <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_write_req_success <=  1'b0;
  else if(wmb_entry_write_req_success_set)
    wmb_entry_write_req_success <=  1'b1;
end

//+-----------+
//| writ_resp |
//+-----------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_write_resp        <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_write_resp        <=  1'b0;
  else if(wmb_entry_write_resp_set)
    wmb_entry_write_resp        <=  1'b1;
end

//+------------------+
//| data_req_success |
//+------------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_data_req_success  <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_data_req_success  <=  1'b0;
  else if(wmb_entry_data_req_success_set)
    wmb_entry_data_req_success  <=  1'b1;
end

//----------------------biu id signal-----------------------
//+--------+
//| biu_id |
//+--------+
always @(posedge wmb_entry_biu_id_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_biu_id[4:0]       <=  5'b0;
//  else if(vb_wmb_entry_rcl_done)
//    wmb_entry_biu_id[4:0]       <=  vb_wmb_aw_id[4:0];
  else if(wmb_entry_read_req)
    wmb_entry_biu_id[4:0]       <=  wmb_biu_ar_id[4:0];
  else if(wmb_entry_write_biu_req ||  wmb_entry_mem_set_write_grnt)
    wmb_entry_biu_id[4:0]       <=  wmb_biu_aw_id[4:0];
end

//+------------+
//| biu_id_vld |
//+------------+
always @(posedge wmb_entry_biu_id_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_biu_r_id_vld    <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_biu_r_id_vld    <=  1'b0;
  else if(wmb_entry_biu_r_id_vld_set)
    wmb_entry_biu_r_id_vld    <=  1'b1;
  else if(wmb_entry_r_resp_vld)
    wmb_entry_biu_r_id_vld    <=  1'b0;
end

always @(posedge wmb_entry_biu_id_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_biu_b_id_vld      <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_biu_b_id_vld      <=  1'b0;
  else if(wmb_entry_biu_b_id_vld_set)
    wmb_entry_biu_b_id_vld      <=  1'b1;
  else if(wmb_entry_b_resp_vld)
    wmb_entry_biu_b_id_vld      <=  1'b0;
end

//+--------+
//| w_last |
//+--------+
always @(posedge wmb_entry_biu_id_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_w_last            <=  1'b0;
  else if(wmb_entry_write_biu_req ||  wmb_entry_mem_set_write_grnt)
    wmb_entry_w_last            <=  wmb_entry_w_last_set;
end

//+-------------+
//| mem_set_req |
//+-------------+
always @(posedge wmb_entry_biu_id_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_mem_set_req     <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_mem_set_req     <=  1'b0;
  else if(wmb_entry_mem_set_write_grnt)
    wmb_entry_mem_set_req     <=  wmb_write_biu_dcache_line;
end

//-------------cmplt/data req success signal----------------
//+------------------+
//| wb_cmplt_success |
//+------------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_wb_cmplt_success  <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_wb_cmplt_success  <=  wmb_ce_wb_cmplt_success;
  else if(wmb_entry_wb_cmplt_grnt ||  rtu_lsu_async_flush)
    wmb_entry_wb_cmplt_success  <=  1'b1;
end

//+-----------------+
//| wb_data_success |
//+-----------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_wb_data_success   <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_wb_data_success   <=  wmb_ce_wb_data_success;
  else if(wmb_entry_wb_data_grnt  ||  rtu_lsu_async_flush)
    wmb_entry_wb_data_success   <=  1'b1;
end

//------------same cache line write imme and depd-----------
//+-----------------+
//| same_dcache_line |
//+-----------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_same_dcache_line  <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_same_dcache_line  <=  wmb_ce_update_same_dcache_line;
  else if(wmb_entry_same_dcache_line_clr)
    wmb_entry_same_dcache_line  <=  1'b0;
end

always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_same_dcache_line_ptr[WMB_ENTRY-1:0]  <=  8'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_same_dcache_line_ptr[WMB_ENTRY-1:0]  <=  wmb_ce_update_same_dcache_line_ptr[WMB_ENTRY-1:0];
end
//+------------+
//| write_imme |
//+------------+
//if write req grnt, clear write imme
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_write_imme        <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_write_imme        <=  wmb_ce_write_imme;
  else if(wmb_entry_write_req_success_set)
    wmb_entry_write_imme        <=  1'b0;
  else if(wmb_entry_write_imme_set)
    wmb_entry_write_imme        <=  1'b1;
end

//+------+
//| depd |
//+------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wmb_entry_depd              <=  1'b0;
  else if(wmb_entry_create_dp_vld)
    wmb_entry_depd              <=  1'b0;
  else if(wmb_entry_discard_req ||  wmb_entry_fwd_req)
    wmb_entry_depd              <=  1'b1;
end

//----------------------stex signal-------------------------
//+-----------+---------------+
//| sc_wb_vld | sc_wb_success |
//+-----------+---------------+
always @(posedge wmb_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    wmb_entry_sc_wb_vld         <=  1'b0;
    wmb_entry_sc_wb_success     <=  1'b0;
  end
  else if(wmb_entry_create_dp_vld)
  begin
    wmb_entry_sc_wb_vld         <=  wmb_ce_sc_wb_vld;
    wmb_entry_sc_wb_success     <=  1'b0;
  end
  else if(wmb_entry_sc_wb_set)
  begin
    wmb_entry_sc_wb_vld         <=  1'b1;
    wmb_entry_sc_wb_success     <=  wmb_entry_sc_wb_success_set;
  end
end
//----------------------write burst judge signal-------------------------
//+-----------+----------+
//| addr_plus | addr_sub |
//+-----------+----------+
always @(posedge wmb_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    wmb_entry_last_addr_plus         <=  1'b0;
    wmb_entry_last_addr_sub          <=  1'b0;
  end
  else if(wmb_entry_create_dp_vld)
  begin
    wmb_entry_last_addr_plus         <=  wmb_ce_last_addr_plus;
    wmb_entry_last_addr_sub          <=  wmb_ce_last_addr_sub;
  end
end
//==========================================================
//                  Create/merge signal
//==========================================================
//wmb_entry_hit_sq_pop_cache_line is used for same_dcache_line
// &Force("bus","sq_pop_addr","39","0"); @520
assign wmb_entry_hit_sq_pop_addr_tto6   = wmb_entry_addr[`PA_WIDTH-1:6]  ==  sq_pop_addr[`PA_WIDTH-1:6];
assign wmb_entry_hit_sq_pop_addr_5to4   = wmb_entry_addr[5:4]   ==  sq_pop_addr[5:4];
assign wmb_entry_hit_sq_pop_addr_tto4   = wmb_entry_hit_sq_pop_addr_tto6
                                          &&  wmb_entry_hit_sq_pop_addr_5to4;

assign wmb_entry_hit_sq_pop_dcache_line = wmb_entry_hit_sq_pop_addr_tto6
                                          &&  wmb_entry_st_inst
                                          &&  wmb_entry_vld;

//if supv mode or page info is not hit, then set write_imme and donot grnt
//signal to sq
assign wmb_entry_merge_data_addr_hit    = wmb_entry_hit_sq_pop_addr_tto4
                                          &&  wmb_entry_merge_en
                                          &&  wmb_entry_vld;

assign wmb_entry_merge_data_permit      = (wmb_entry_priv_mode[1:0]  ==  sq_pop_priv_mode[1:0])
                                          &&  !(wmb_entry_wo_st_write_biu_req
                                                ||  wmb_entry_data_req
                                                ||  wmb_dcache_req_ptr
                                                    && (pw_merge_stall
                                                        || wmb_dcache_arb_req_unmask))
                                          &&  !wmb_entry_write_req_success
                                          &&  !wmb_entry_data_req_success;

assign wmb_entry_merge_data_stall       = wmb_entry_merge_data_addr_hit
                                          &&  !wmb_entry_merge_data_permit;

assign wmb_entry_merge_data_grnt        = wmb_entry_merge_data_addr_hit
                                          &&  wmb_entry_merge_data_permit;

assign wmb_entry_merge_data_write_imme_set  = wmb_entry_merge_data_addr_hit
                                              &&  sq_wmb_merge_stall_req;

assign wmb_entry_merge_data[3:0]        = {4{wmb_entry_merge_data_vld}}
                                          & wmb_ce_data_vld[3:0];

assign wmb_entry_create_data[3:0]       = {4{wmb_entry_create_data_vld}}
                                          & wmb_ce_data_vld[3:0];

assign wmb_entry_create_merge_data_gateclk_en = wmb_entry_create_gateclk_en
                                                ||  wmb_entry_merge_data_vld;

assign wmb_entry_data_clk_en[3:0]       = {4{wmb_entry_create_merge_data_gateclk_en}} 
                                          & wmb_ce_data_vld[3:0];
assign wmb_entry_bytes_vld_clk_en       = wmb_entry_create_merge_data_gateclk_en;

//------------------merge data------------------------------
assign wmb_entry_data_next[7:0]     = wmb_ce_bytes_vld[0]   ? wmb_ce_data128[7:0]
                                                            : wmb_entry_data[7:0];
assign wmb_entry_data_next[15:8]    = wmb_ce_bytes_vld[1]   ? wmb_ce_data128[15:8]
                                                            : wmb_entry_data[15:8];
assign wmb_entry_data_next[23:16]   = wmb_ce_bytes_vld[2]   ? wmb_ce_data128[23:16]
                                                            : wmb_entry_data[23:16];
assign wmb_entry_data_next[31:24]   = wmb_ce_bytes_vld[3]   ? wmb_ce_data128[31:24]
                                                            : wmb_entry_data[31:24];
assign wmb_entry_data_next[39:32]   = wmb_ce_bytes_vld[4]   ? wmb_ce_data128[39:32]
                                                            : wmb_entry_data[39:32];
assign wmb_entry_data_next[47:40]   = wmb_ce_bytes_vld[5]   ? wmb_ce_data128[47:40]
                                                            : wmb_entry_data[47:40];
assign wmb_entry_data_next[55:48]   = wmb_ce_bytes_vld[6]   ? wmb_ce_data128[55:48]
                                                            : wmb_entry_data[55:48];
assign wmb_entry_data_next[63:56]   = wmb_ce_bytes_vld[7]   ? wmb_ce_data128[63:56]
                                                            : wmb_entry_data[63:56];
assign wmb_entry_data_next[71:64]   = wmb_ce_bytes_vld[8]   ? wmb_ce_data128[71:64]
                                                            : wmb_entry_data[71:64];
assign wmb_entry_data_next[79:72]   = wmb_ce_bytes_vld[9]   ? wmb_ce_data128[79:72]
                                                            : wmb_entry_data[79:72];
assign wmb_entry_data_next[87:80]   = wmb_ce_bytes_vld[10]  ? wmb_ce_data128[87:80]
                                                            : wmb_entry_data[87:80];
assign wmb_entry_data_next[95:88]   = wmb_ce_bytes_vld[11]  ? wmb_ce_data128[95:88]
                                                            : wmb_entry_data[95:88];
assign wmb_entry_data_next[103:96]  = wmb_ce_bytes_vld[12]  ? wmb_ce_data128[103:96]
                                                            : wmb_entry_data[103:96];
assign wmb_entry_data_next[111:104] = wmb_ce_bytes_vld[13]  ? wmb_ce_data128[111:104]
                                                            : wmb_entry_data[111:104];
assign wmb_entry_data_next[119:112] = wmb_ce_bytes_vld[14]  ? wmb_ce_data128[119:112]
                                                            : wmb_entry_data[119:112];
assign wmb_entry_data_next[127:120] = wmb_ce_bytes_vld[15]  ? wmb_ce_data128[127:120]
                                                            : wmb_entry_data[127:120];
//------------------merge bytes_vld-------------------------
assign wmb_entry_bytes_vld_and[15:0]  = wmb_entry_bytes_vld[15:0]  | wmb_ce_bytes_vld[15:0];
assign wmb_entry_bytes_vld_full_and   = &wmb_entry_bytes_vld_and[15:0];

//----------ready to send dcache line of this entry---------
assign wmb_entry_ready_to_dcache_line = wmb_entry_vld
                                        &&  wmb_entry_wo_st_inst
                                        &&  wmb_entry_page_ca
                                        &&  wmb_entry_bytes_vld_full
                                        &&  !wmb_entry_write_req_success
                                        &&  wmb_entry_read_resp;

//==========================================================
//        Generate inst type
//==========================================================
assign wmb_entry_atomic_and_vld   = wmb_entry_atomic
                                    &&  wmb_entry_vld;
assign wmb_entry_icc_and_vld      = wmb_entry_icc
                                    &&  wmb_entry_vld;

assign wmb_entry_sync_fence_inst  = !wmb_entry_atomic
                                    &&  wmb_entry_sync_fence;
assign wmb_entry_ctc_inst         = wmb_entry_icc
                                    &&  !wmb_entry_atomic
                                    &&  (wmb_entry_inst_type[1:0]  !=  2'b10);
assign wmb_entry_dcache_inst      = wmb_entry_inst_is_dcache;
assign wmb_entry_st_inst          = !wmb_entry_icc
                                    &&  !wmb_entry_atomic
                                    &&  !wmb_entry_sync_fence;
assign wmb_entry_wo_st_inst       = wmb_entry_st_inst
                                    &&  !wmb_entry_page_so;
assign wmb_entry_so_st_inst       = wmb_entry_st_inst
                                    &&  wmb_entry_page_so;
assign wmb_entry_stamo_inst       = wmb_entry_atomic
                                    &&  (wmb_entry_inst_type[1:0] == 2'b00);
assign wmb_entry_sc_inst          = wmb_entry_atomic
                                    &&  (wmb_entry_inst_type[1:0] == 2'b01);

assign wmb_entry_dcache_all_inst        = wmb_entry_dcache_inst
                                          &&  (wmb_entry_inst_mode[1:0]  ==  2'b00);
assign wmb_entry_dcache_1line_inst      = wmb_entry_dcache_inst
                                          &&  (wmb_entry_inst_mode[1:0]  !=  2'b00);
assign wmb_entry_dcache_addr_inst       = wmb_entry_dcache_inst
                                          &&  wmb_entry_inst_mode[0];
assign wmb_entry_dcache_sw_inst         = wmb_entry_dcache_inst
                                          &&  (wmb_entry_inst_mode[1:0]  ==  2'b10);
assign wmb_entry_dcache_clr_addr_inst   = wmb_entry_dcache_addr_inst
                                          &&  (wmb_entry_inst_size[1:0] !=  2'b10);
assign wmb_entry_dcache_clr_sw_inst     = wmb_entry_dcache_sw_inst
                                          &&  (wmb_entry_inst_size[1:0] !=  2'b10);
assign wmb_entry_dcache_clr_1line_inst  = wmb_entry_dcache_clr_addr_inst
                                          ||  wmb_entry_dcache_clr_sw_inst;
assign wmb_entry_dcache_addr_l1_inst    = wmb_entry_dcache_addr_inst
                                          &&  (wmb_entry_inst_size[1:0] ==  2'b00);
assign wmb_entry_dcache_addr_not_l1_inst    = wmb_entry_dcache_addr_inst
                                              &&  (wmb_entry_inst_size[1:0] !=  2'b00);
assign wmb_entry_dcache_only_inv_addr_inst  = wmb_entry_dcache_addr_inst
                                              &&  (wmb_entry_inst_size[1:0]  ==  2'b10);
assign wmb_entry_dcache_only_inv_sw_inst    = wmb_entry_dcache_sw_inst
                                              &&  (wmb_entry_inst_size[1:0]  ==  2'b10);
assign wmb_entry_dcache_only_inv_1line_inst = wmb_entry_dcache_only_inv_addr_inst
                                              ||  wmb_entry_dcache_only_inv_sw_inst;

assign wmb_entry_dcache_except_only_inv_1line_inst  = wmb_entry_dcache_inst
                                                      &&  !wmb_entry_dcache_only_inv_1line_inst;

//==========================================================
//            Compare dcache write port(dcwp)
//==========================================================
// &Force("nonport","wmb_entry_dcache_hit_idx"); @669
// &Instance("ct_lsu_dcache_info_update","x_lsu_wmb_entry_dcache_info_update"); @670
ct_lsu_dcache_info_update  x_lsu_wmb_entry_dcache_info_update (
  .compare_dcwp_addr                  (wmb_entry_addr[39:0]              ),
  .compare_dcwp_hit_idx               (wmb_entry_dcache_hit_idx          ),
  .compare_dcwp_sw_inst               (wmb_entry_dcache_sw_inst          ),
  .compare_dcwp_update_vld            (wmb_entry_dcache_update_vld_unmask),
  .dcache_dirty_din                   (dcache_dirty_din                  ),
  .dcache_dirty_gwen                  (dcache_dirty_gwen                 ),
  .dcache_dirty_wen                   (dcache_dirty_wen                  ),
  .dcache_idx                         (dcache_idx                        ),
  .dcache_tag_din                     (dcache_tag_din                    ),
  .dcache_tag_gwen                    (dcache_tag_gwen                   ),
  .dcache_tag_wen                     (dcache_tag_wen                    ),
  .origin_dcache_dirty                (wmb_entry_dcache_dirty            ),
  .origin_dcache_share                (wmb_entry_dcache_share            ),
  .origin_dcache_valid                (wmb_entry_dcache_valid            ),
  .origin_dcache_way                  (wmb_entry_dcache_way              ),
  .update_dcache_dirty                (wmb_entry_update_dcache_dirty     ),
  .update_dcache_share                (wmb_entry_update_dcache_share     ),
  .update_dcache_valid                (wmb_entry_update_dcache_valid     ),
  .update_dcache_way                  (wmb_entry_update_dcache_way       )
);

// &Connect( .compare_dcwp_addr          (wmb_entry_addr[`PA_WIDTH-1:0]), @671
//           .compare_dcwp_sw_inst       (wmb_entry_dcache_sw_inst), @672
//           .origin_dcache_valid        (wmb_entry_dcache_valid ), @673
//           .origin_dcache_share        (wmb_entry_dcache_share ), @674
//           .origin_dcache_dirty        (wmb_entry_dcache_dirty ), @675
//           .origin_dcache_way          (wmb_entry_dcache_way   ), @676
//           .compare_dcwp_update_vld    (wmb_entry_dcache_update_vld_unmask), @677
//           .compare_dcwp_hit_idx       (wmb_entry_dcache_hit_idx), @678
//           .update_dcache_valid        (wmb_entry_update_dcache_valid), @679
//           .update_dcache_share        (wmb_entry_update_dcache_share), @680
//           .update_dcache_dirty        (wmb_entry_update_dcache_dirty), @681
//           .update_dcache_way          (wmb_entry_update_dcache_way  )); @682

assign wmb_entry_dcache_update_vld  = wmb_entry_dcache_update_vld_unmask
                                      &&  wmb_entry_vld;

//==========================================================
//                 Dependency check
//==========================================================

// situat ld pipe         sq/wmb          addr    bytes_vld data_vld  manner
// --------------------------------------------------------------------------
// 1      ld              st              :4      part      x         discard
// 2      ld atomic       any             x       x         x         discard
// 3      ld              atomic          :4      do        x         discard
// 4      ld              st              :4      whole     x         forward
// 5      ld(addr1)       st              :4      x         x         !acclr_en

//------------------compare signal--------------------------
//-----------addr compare---------------
//addr compare
// &Force("bus","ld_dc_addr0",39,0); @702
assign wmb_entry_depd_addr_tto12_hit  = wmb_entry_addr[`PA_WIDTH-1:12] == ld_dc_addr0[`PA_WIDTH-1:12];
assign wmb_entry_depd_addr_11to4_hit  = wmb_entry_addr[11:4] == ld_dc_addr0[11:4];
assign wmb_entry_depd_addr1_11to4_hit = wmb_entry_addr[11:4] == ld_dc_addr1_11to4[7:0];

assign wmb_entry_depd_addr_tto4_hit   = wmb_entry_depd_addr_tto12_hit
                                        &&  wmb_entry_depd_addr_11to4_hit;

assign wmb_entry_depd_addr1_tto4_hit  = wmb_entry_depd_addr_tto12_hit
                                        &&  wmb_entry_depd_addr1_11to4_hit;

//-----------bytes_vld compare----------

assign wmb_entry_and_ld_dc_bytes_vld[15:0]    = wmb_entry_bytes_vld[15:0]  & ld_dc_bytes_vld[15:0];
assign wmb_entry_and_ld_dc_bytes_vld_hit      = |wmb_entry_and_ld_dc_bytes_vld[15:0];

//example:
//depd_bytes_vld          ld_dc_bytes_vld     depd kinds
//1111                    0011                do & whole
//0011                    0011                do & whole
//0110                    0011                do & part
//0110                    1111                do & part
//1100                    0011                /

assign wmb_entry_depd_do_hit      = wmb_entry_and_ld_dc_bytes_vld_hit;

//------------------cancel amr------------------------------
//assign wmb_entry_discard_amr_cancel_gateclk = wmb_entry_vld
//                                      &&  (ld_dc_chk_ld_inst_vld  ||  ld_dc_chk_atomic_inst_vld)
//                                      &&  (wmb_entry_addr[11:4]  ==  ld_dc_addr0[11:4]);
//------------------fwd data pop entry----------------------
assign wmb_entry_fwd_data_pe_req  = wmb_entry_vld
                                    &&  wmb_entry_wo_st_inst
                                    &&  wmb_entry_depd_addr_tto4_hit;
assign wmb_entry_fwd_data_pe_gateclk_en = wmb_entry_vld
                                          &&  wmb_entry_wo_st_inst
                                          &&  wmb_entry_depd_addr_11to4_hit;
//------------------situation 1-----------------------------
assign wmb_entry_fwd_data_pre     = wmb_entry_fwd_data_pe_req
                                    &&  ld_dc_chk_ld_inst_vld;

assign wmb_entry_depd_hit1        = wmb_entry_fwd_data_pre
                                    &&  wmb_entry_depd_do_hit;

assign wmb_entry_fwd_bytes_vld[15:0]  = {16{wmb_entry_fwd_data_pre}}
                                        & wmb_entry_and_ld_dc_bytes_vld[15:0];

//------------------situation 2-----------------------------
assign wmb_entry_depd_hit2  = wmb_entry_vld
                              &&  ld_dc_chk_atomic_inst_vld;
//------------------situation 3-----------------------------
assign wmb_entry_depd_hit3  = wmb_entry_vld
                              &&  wmb_entry_atomic
                              &&  ld_dc_chk_ld_inst_vld
                              &&  wmb_entry_depd_addr_tto4_hit
                              &&  wmb_entry_depd_do_hit;

//for cache buffer acceleration
assign wmb_entry_depd_hit5  = wmb_entry_vld
                              && wmb_entry_depd_addr1_tto4_hit;
//------------------combine---------------------------------
assign wmb_entry_discard_req    = wmb_entry_depd_hit2
                                  ||  wmb_entry_depd_hit3;

assign wmb_entry_fwd_req        = wmb_entry_depd_hit1;

assign wmb_entry_cancel_acc_req = wmb_entry_depd_hit5;
//==========================================================
//                 Set write_imme
//==========================================================
//-------------request ar channel if need-------------------
//if has write out, then clear write imme
assign wmb_entry_write_imme_set     = wmb_entry_vld
                                      &&  !wmb_entry_write_req_success
                                      &&  (wmb_entry_discard_req
                                          ||  wmb_entry_merge_data_wait_not_vld_req
                                          ||  wmb_entry_rb_biu_req_hit_idx
                                          ||  wmb_create_ptr_next1
//                                          ||  wmb_create_ptr_next3
//                                              &&  amr_mem_set
                                          ||  wmb_entry_snq_set_write_imme
                                          ||  wmb_wakeup_queue_not_empty
                                              &&  wmb_entry_depd
                                          ||  wmb_entry_merge_data_write_imme_set);

//for timing, use write_imme_bypass to set wmb_write_imme
assign wmb_entry_write_imme_bypass  = wmb_entry_vld
                                      &&  !wmb_entry_write_req_success
                                      &&  wmb_create_ptr_next1;

//assign wmb_entry_amr_cancel           = wmb_entry_vld
//                                        &&  !wmb_entry_write_req_success;
//                                        &&  wmb_entry_snq_create_hit_idx;

//assign wmb_entry_amr_cancel_gateclk   = wmb_entry_vld
//                                        &&  !wmb_entry_write_req_success
//                                        &&  (wmb_entry_discard_amr_cancel_gateclk
//                                            ||  wmb_entry_rb_biu_req_hit_idx);
//                                            ||  wmb_entry_snq_create_hit_idx);
//==========================================================
//                    Request read
//==========================================================
assign wmb_entry_read_ptr_not_already_success = wmb_entry_vld
                                                &&  wmb_read_ptr
                                                &&  !wmb_entry_read_req_success;
//-------------request ar channel if need-------------------
assign wmb_entry_read_req   = wmb_entry_read_ptr_not_already_success
                              &&  (wmb_entry_st_inst
                                      &&  wmb_entry_page_ca
                                      &&  wmb_entry_page_share
                                      &&  wmb_entry_dcache_share
//                                          ||  !wmb_entry_dcache_valid)
                                      &&  !wmb_entry_same_dcache_line
                                  ||  wmb_entry_ctc_inst
                                  ||  wmb_entry_dcache_addr_inst
                                      &&  wmb_entry_page_ca
                                      &&  (wmb_entry_dcache_addr_not_l1_inst
                                          ||  wmb_entry_page_share)
                                      &&  wmb_entry_page_ca
                                      &&  wmb_entry_write_resp
                                  ||  wmb_entry_sc_inst
                                      &&  wmb_write_ptr
                                      &&  !wmb_entry_sc_wb_vld
                                      &&  wmb_entry_page_ca
                                      &&  wmb_entry_page_share
                                      &&  (wmb_entry_dcache_valid
                                              &&  wmb_entry_dcache_share));
//                                          ||  !wmb_entry_dcache_valid));

assign wmb_entry_read_dp_req  = wmb_entry_vld
                                &&  !wmb_entry_read_req_success
                                &&  (wmb_entry_st_inst
                                          &&  wmb_entry_page_ca
                                          &&  wmb_entry_page_share
                                          &&  (wmb_entry_dcache_share
                                              ||  !wmb_entry_dcache_valid)
                                    ||  wmb_entry_ctc_inst
                                    ||  wmb_entry_dcache_addr_inst
                                        &&  (wmb_entry_dcache_addr_not_l1_inst
                                            ||  wmb_entry_page_share)
                                        &&  wmb_entry_page_ca
                                    ||  wmb_entry_sc_inst
                                        &&  wmb_entry_page_ca
                                        &&  wmb_entry_page_share
                                        &&  !wmb_entry_sc_wb_vld);

assign wmb_entry_read_ptr_chk_idx_shift_imme  =
                wmb_entry_read_ptr_not_already_success 
//                &&  (wmb_entry_dcache_sw_inst
//                        &&  wmb_entry_write_resp
//                    ||  wmb_entry_st_inst
                &&  (wmb_entry_st_inst   
                        &&  wmb_entry_page_ca
//                        &&  wmb_entry_page_share
                        &&  (wmb_entry_same_dcache_line
                            ||  !wmb_entry_dcache_valid
                            ||  wmb_entry_dcache_valid
                                &&  !wmb_entry_dcache_share
                            ||  !wmb_entry_page_share)
                    ||  wmb_entry_stamo_inst
                    ||  wmb_entry_sc_inst
                        &&  wmb_write_ptr
                        &&  !wmb_entry_sc_wb_vld
                        &&  wmb_entry_page_ca
//                        &&  wmb_entry_page_share
                        &&  (wmb_entry_dcache_valid
                                &&  !wmb_entry_dcache_share
                             || !wmb_entry_dcache_valid
                             || !wmb_entry_page_share));

//if has sent read req and other condition, don't compare index
assign wmb_entry_read_ptr_unconditional_shift_imme  =
                wmb_entry_vld
                &&  wmb_read_ptr
                &&  (wmb_entry_read_req_success 
                    ||  wmb_entry_st_inst
//                        &&  (!wmb_entry_page_share
//                            ||  !wmb_entry_page_ca)
                        &&  !wmb_entry_page_ca
                    || wmb_entry_dcache_sw_inst
                        &&  wmb_entry_write_resp
                    ||  wmb_entry_dcache_all_inst
                    ||  wmb_entry_sync_fence_inst
                    ||  wmb_entry_dcache_addr_l1_inst
                        &&  !wmb_entry_page_share
                        &&  wmb_entry_write_resp
                    ||  wmb_entry_dcache_addr_inst
                        &&  !wmb_entry_page_ca
                        &&  wmb_entry_write_resp
//                    ||  wmb_entry_stamo_inst
                    ||  wmb_entry_sc_inst
                        &&  (!wmb_entry_page_ca
//                            ||  !wmb_entry_page_share
                            ||  wmb_entry_sc_wb_vld));

//-------------read req_success/resp set--------------------
assign wmb_entry_read_ptr_shift_imme  = wmb_entry_read_ptr_unconditional_shift_imme
                                        ||  wmb_entry_read_ptr_chk_idx_shift_imme;
assign wmb_entry_read_req_success_set = !wmb_entry_read_req_success
                                        &&  (wmb_entry_read_req
                                                &&  wmb_read_ptr_read_req_grnt
                                            ||  wmb_entry_read_ptr_shift_imme
                                                &&  wmb_read_ptr_shift_imme_grnt);

//if ctc has sent, then set read_resp
assign wmb_entry_read_resp_set        = !wmb_entry_read_resp
                                        &&  (wmb_entry_read_ptr_shift_imme
                                                &&  wmb_read_ptr_shift_imme_grnt
                                                &&  !wmb_entry_read_req_success
                                                &&  !wmb_entry_sync_fence_inst
                                                &&  !(wmb_entry_st_inst
                                                      && wmb_entry_page_ca
                                                      && wmb_entry_page_share
                                                      && wmb_entry_dcache_valid
                                                      && wmb_entry_dcache_share
                                                      && wmb_entry_same_dcache_line
                                                      && !wmb_entry_same_dcache_line_ready)
                                            ||  wmb_entry_read_req_success
                                                && wmb_entry_st_inst
                                                && wmb_entry_page_ca
                                                && wmb_entry_same_dcache_line
                                                && wmb_entry_same_dcache_line_ready
                                            ||  wmb_entry_r_resp_vld
                                            ||  wmb_entry_read_req
                                                &&  wmb_entry_ctc_inst
                                                &&  wmb_read_ptr_read_req_grnt);

//for same dcache line
assign wmb_entry_read_resp_ready = !(wmb_entry_vld
                                     && wmb_entry_read_req_success
                                     && !wmb_entry_read_resp);

assign wmb_entry_same_dcache_line_ready = |(wmb_entry_same_dcache_line_ptr[WMB_ENTRY-1:0] & wmb_same_line_resp_ready[WMB_ENTRY-1:0]);
//==========================================================
//                    Request write
//==========================================================
//-------------request dcache/vb/aw channel if need---------
//assign wmb_entry_write_permit       = wmb_pop_write_imme
//                                      ||  wmb_entry_dcache_valid
//                                          &&  !ld_ag_inst_vld
//                                          &&  !st_ag_inst_vld;

assign wmb_entry_page_ca_dcache_valid   = wmb_entry_page_ca
                                          &&  wmb_entry_dcache_valid;

//write req is used for write ptr shift
assign wmb_entry_write_req          = wmb_entry_vld
                                      &&  wmb_write_ptr
                                      &&  !wmb_entry_write_req_success
                                      &&  !wmb_entry_ctc_inst
                                      &&  !wmb_entry_dcache_all_inst;

assign wmb_entry_write_biu_req      = wmb_entry_vld
                                      &&  wmb_write_ptr
                                      &&  !wmb_entry_write_req_success
                                      &&  !wmb_entry_write_stall
                                      &&  (wmb_entry_so_st_inst
                                              &&  wmb_entry_read_resp
                                          ||  wmb_entry_wo_st_inst
                                              &&  wmb_entry_read_resp
                                              &&  !wmb_entry_page_ca_dcache_valid
                                          ||  wmb_entry_sync_fence_inst
                                              &&  wmb_entry_read_req_success
                                              &&  vb_wmb_empty
                                          ||  wmb_entry_stamo_inst
                                              &&  wmb_entry_read_resp
                                              &&  !wmb_entry_dcache_valid
                                          ||  wmb_entry_sc_inst
                                              &&  wmb_entry_read_resp
                                              &&  !wmb_entry_sc_wb_vld
                                              &&  (!wmb_entry_page_ca
                                                  ||  !wmb_entry_dcache_valid));

//if write imme, then must write this cycle or next cycle
assign wmb_entry_wo_st_write_biu_req    = wmb_entry_vld
                                          &&  wmb_write_ptr
                                          &&  wmb_entry_merge_en
                                          &&  !wmb_entry_write_req_success
                                          &&  wmb_entry_wo_st_inst
                                          &&  wmb_biu_write_en
                                          &&  wmb_entry_read_resp
                                          &&  !wmb_entry_page_ca_dcache_valid;


assign wmb_entry_write_biu_dp_req   = wmb_entry_vld
                                      &&  !wmb_entry_write_req_success
                                      &&  (wmb_entry_so_st_inst
                                          ||  wmb_entry_wo_st_inst
                                              &&  !wmb_entry_page_ca_dcache_valid
                                          ||  wmb_entry_sync_fence_inst
                                          ||  wmb_entry_stamo_inst
                                              &&  !wmb_entry_dcache_valid
                                          ||  wmb_entry_sc_inst
                                              &&  (!wmb_entry_page_ca
                                                  ||  !wmb_entry_dcache_valid)
                                              &&  !wmb_entry_sc_wb_vld);

assign wmb_entry_write_dcache_req   = wmb_entry_vld
//                                      &&  wmb_write_ptr
//                                      &&  wmb_data_ptr
                                      &&  !wmb_entry_write_resp
//                                      &&  !wmb_entry_write_stall
                                      &&  (wmb_entry_page_ca_dcache_valid
                                             &&  !wmb_entry_write_req_success
                                             &&  (wmb_entry_st_inst
                                                     &&  wmb_entry_read_resp
//                                                 ||  wmb_entry_dcache_only_inv_1line_inst
                                                 ||  wmb_entry_stamo_inst
                                                     &&  wmb_entry_read_resp
                                                 ||  wmb_entry_sc_inst
                                                     &&  wmb_entry_read_resp
                                                     &&  !wmb_entry_sc_wb_vld)
                                           || wmb_entry_dcache_only_inv_1line_inst
                                              && wmb_entry_page_ca_dcache_valid
                                              && wmb_entry_write_req_success);

//if write permit, then write dcache this cycle, if write imme, then must
//write in next cycle
//assign wmb_entry_wo_st_write_dcache_req = wmb_entry_vld
//                                          &&  wmb_write_ptr
//                                          &&  wmb_data_ptr
//                                        &&  wmb_write_dcache_permit
//                                        &&  wmb_entry_merge_en
//                                        &&  !wmb_entry_write_req_success
//                                        &&  (!wmb_entry_write_stall
//                                            ||  wmb_write_imme)
//                                        &&  wmb_entry_page_ca_dcache_valid
//                                        &&  wmb_entry_wo_st_inst
//                                          &&  wmb_entry_read_resp;
                                     

assign wmb_entry_write_vb_req       = wmb_entry_vld
                                      &&  wmb_write_ptr
                                      &&  !wmb_entry_write_req_success
                                      &&  wmb_entry_dcache_clr_1line_inst
                                      &&  wmb_entry_page_ca_dcache_valid;

//if already mem_set success, then write ptr shift imme
assign wmb_entry_write_ptr_unconditional_shift_imme =
            wmb_write_ptr
                && (!wmb_entry_vld
                    ||  wmb_dcache_req_ptr
                        &&  wmb_write_dcache_success
                    ||  wmb_entry_write_resp   //for dcache_only_inv_1line
                    ||  wmb_entry_write_req_success
                        &&  wmb_entry_mem_set_req
                    ||  !wmb_entry_write_req_success
                        &&  (wmb_entry_dcache_all_inst
                            ||  wmb_entry_ctc_inst
                            ||  wmb_entry_sc_inst
                                &&  wmb_entry_read_resp
                                &&  wmb_entry_sc_wb_vld));

assign wmb_entry_write_ptr_chk_idx_shift_imme =
                wmb_entry_vld
                &&  wmb_write_ptr
                &&  !wmb_entry_write_req_success
                &&  (wmb_entry_dcache_except_only_inv_1line_inst
                        &&  !wmb_entry_page_ca_dcache_valid);

//-------------write req_success/resp set-------------------
assign wmb_entry_write_ptr_shift_imme   = wmb_entry_write_ptr_chk_idx_shift_imme
                                          ||  wmb_entry_write_ptr_unconditional_shift_imme;
assign wmb_entry_write_req_success_set  = !wmb_entry_write_req_success
                                          &&  (wmb_entry_write_biu_req
                                                  &&  bus_arb_wmb_aw_grnt
                                              ||  wmb_entry_write_vb_req
                                                  &&  wmb_create_vb_success
                                              ||  wmb_dcache_req_ptr
                                                  &&  wmb_write_dcache_success
                                              ||  wmb_entry_vld
                                                  && wmb_entry_dcache_only_inv_1line_inst   //for timing
                                                  && !wmb_dcache_inst_write_req_hit_idx
                                                  && wmb_write_ptr 
                                              ||  wmb_entry_mem_set_write_grnt
                                              ||  wmb_entry_write_ptr_shift_imme
                                                  &&  wmb_write_ptr_shift_imme_grnt);

assign wmb_entry_write_resp_set         = !wmb_entry_write_resp
                                          &&  (vb_wmb_entry_rcl_done
                                              ||  wmb_dcache_req_ptr
                                                  &&  wmb_write_dcache_success
                                              ||  wmb_entry_vld
                                                  && wmb_entry_dcache_only_inv_1line_inst
                                                  && wmb_entry_write_req_success 
                                                  && !wmb_entry_page_ca_dcache_valid
                                              ||  wmb_entry_b_resp_vld
                                              ||  wmb_entry_write_ptr_shift_imme
                                                  &&  !wmb_entry_write_req_success
                                                  &&  wmb_write_ptr_shift_imme_grnt);

//==========================================================
//                    Request data
//==========================================================
//-------------request data channel if need-----------------
assign wmb_entry_data_req       = wmb_entry_vld
                                  &&  wmb_data_ptr
                                  &&  !wmb_entry_data_req_success
                                  &&  (wmb_entry_read_resp
                                      || !(wmb_entry_st_inst
                                          ||  wmb_entry_atomic))
                                  &&  wmb_entry_write_req_success;
//                                      ||  wmb_entry_page_ca_dcache_valid
//                                          &&  wmb_write_dcache_permit);

assign wmb_entry_data_biu_req   = wmb_data_ptr
                                  &&  wmb_entry_write_req_success
                                  &&  !wmb_entry_data_req_success
                                  &&  !wmb_entry_write_resp
                                  &&  (wmb_entry_st_inst
                                      ||  wmb_entry_atomic
                                      ||  wmb_entry_sync_fence_inst);

assign wmb_entry_data_req_wns   = wmb_data_ptr
                                  && !wmb_entry_sync_fence_inst 
                                  && !wmb_entry_page_ca; 
//                                      || !wmb_entry_page_share
//                                         && cp0_lsu_wns_en);

assign wmb_entry_data_ptr_after_write_shift_imme  = 
                wmb_data_ptr
                &&  (!wmb_entry_vld
                    || wmb_dcache_req_ptr
                       &&  wmb_write_dcache_success
                    || wmb_entry_write_resp     //for only_inv_1line_inst 
                    || wmb_entry_write_req_success
                       &&  (wmb_entry_dcache_except_only_inv_1line_inst
                           ||  wmb_entry_ctc_inst
                           ||  wmb_entry_sc_inst
                               &&  wmb_entry_sc_wb_vld));
//assign wmb_entry_data_ptr_with_write_shift_imme = 
//                wmb_data_ptr
//                &&  wmb_write_ptr
//                &&  wmb_entry_dcache_only_inv_1line_inst
//                    &&  !wmb_entry_page_ca_dcache_valid;
assign wmb_entry_data_ptr_with_write_shift_imme = 1'b0;

//-------------write req_success/resp set-------------------
assign wmb_entry_data_req_success_set = wmb_entry_data_biu_req
                                            &&  bus_arb_wmb_w_grnt
                                        ||  wmb_dcache_req_ptr
                                            &&  wmb_write_dcache_success
                                        ||  wmb_entry_data_ptr_after_write_shift_imme
                                        ||  wmb_entry_data_ptr_with_write_shift_imme
                                            &&  wmb_write_ptr_shift_imme_grnt;

//==========================================================
//                Compare biu r/b channel
//==========================================================
//---------------------biu id vld set-----------------------
assign wmb_entry_biu_r_id_vld_set = wmb_entry_read_req
                                        &&  !wmb_entry_ctc_inst
                                    ||  wmb_entry_sync_fence_inst
                                        &&  wmb_entry_write_biu_req;

assign wmb_entry_biu_b_id_vld_set = wmb_entry_write_biu_req
                                    ||  wmb_entry_mem_set_write_grnt;
//-----------------compare biu r channel--------------------
assign wmb_entry_r_id_hit = biu_lsu_r_vld
                            &&  wmb_entry_biu_r_id_vld
                            &&  (wmb_entry_biu_id[4:0]  ==  biu_lsu_r_id[4:0]);
assign wmb_entry_r_resp_vld   = wmb_entry_r_id_hit;

//-----------------compare biu b channel--------------------
assign wmb_entry_b_id_hit = biu_lsu_b_vld
                            &&  wmb_entry_biu_b_id_vld
                            &&  (wmb_entry_biu_id[4:0]  ==  biu_lsu_b_id[4:0]);

assign wmb_entry_b_resp_vld   = wmb_entry_b_id_hit
                                &&  (wmb_entry_page_ca
                                    ||  wmb_entry_atomic && !wmb_entry_page_so
                                    ||  wmb_entry_next_nc_bypass
                                    ||  wmb_entry_next_so_bypass
                                    ||  wmb_entry_dcache_clr_1line_inst
                                    ||  wmb_entry_sync_fence_inst);
                                
//==========================================================
//                 Request wb cmplt/data
//==========================================================
//stex write data first, then request cmplt to ensure there is only 1 stex
//inst in wmb
assign wmb_entry_wb_cmplt_req = wmb_entry_vld
                                &&  !wmb_entry_wb_cmplt_success
                                &&  wmb_entry_wb_data_success
                                &&  (wmb_entry_dcache_all_inst
                                    ||  wmb_entry_sync_fence_inst
                                        &&  wmb_entry_read_resp
                                        &&  wmb_entry_write_resp
                                    ||  wmb_entry_so_st_inst
                                        &&  wmb_entry_write_req_success
                                    ||  wmb_entry_sc_inst
                                        &&  wmb_entry_sc_wb_vld
                                    ||  wmb_entry_stamo_inst
                                        &&  wmb_entry_write_resp);

assign wmb_entry_wb_data_req  = wmb_entry_vld
                                &&  !wmb_entry_wb_data_success
                                &&  wmb_entry_sc_inst
                                &&  wmb_entry_sc_wb_vld;

//==========================================================
//                 sc execute
//==========================================================
assign wmb_entry_sc_wb_set    = wmb_entry_vld
                                &&  wmb_entry_sc_inst
                                &&  !wmb_entry_sc_wb_vld
                                &&  (lm_state_is_idle
                                    ||  wmb_entry_page_ca_dcache_valid
                                        &&  wmb_entry_write_resp
                                    ||  wmb_entry_page_ca
                                        &&  !wmb_entry_dcache_valid
                                        &&  wmb_entry_b_resp_vld
                                    ||  !wmb_entry_page_ca
                                        &&  wmb_entry_b_resp_vld);

assign wmb_entry_sc_wb_success_set  = lm_state_is_ex_wait_lock
                                      &&  (wmb_entry_page_ca
                                          ||  !wmb_entry_page_ca
                                              &&  wmb_b_resp_exokay);

assign wmb_entry_preg[6:0]  = {wmb_entry_icc,
                              wmb_entry_inst_mode[1:0],
                              wmb_entry_fence_mode[3:0]};

//==========================================================
//                 Compare index
//==========================================================
assign wmb_entry_idx_cmpare_inst  = wmb_entry_vld
                                    &&  (wmb_entry_st_inst
                                        ||  wmb_entry_atomic
                                        ||  wmb_entry_dcache_1line_inst)
                                    &&  wmb_entry_page_ca;

//for snq dep
assign wmb_entry_idx_snq_dep_inst  = wmb_entry_vld
                                     &&  (wmb_entry_st_inst
                                         ||  wmb_entry_stamo_inst
                                         ||  wmb_entry_dcache_only_inv_1line_inst
                                         ||  wmb_entry_sc_inst
                                             && !wmb_entry_sc_wb_vld);
//------------------compare rb biu req----------------------
//because if hit index of rb_biu_req, this entry must set write_imme bit, so it
//must compare with req_unmask signal
// &Force("bus","rb_biu_req_addr",39,0); @1245
assign wmb_entry_rb_biu_req_hit_idx = wmb_entry_idx_cmpare_inst
                                      &&  rb_biu_req_unmask
                                      &&  (wmb_entry_addr[13:6] ==  rb_biu_req_addr[13:6]);
//------------------compare pfu pop entry--------------------
// &Force("bus","pfu_biu_req_addr",39,0); @1250
assign wmb_entry_pfu_biu_req_hit_idx  = wmb_entry_idx_cmpare_inst
                                        &&  (wmb_entry_addr[13:6]
                                            ==  pfu_biu_req_addr[13:6]);
//------------------compare snq create port-----------------
//if hit snq create addr, then same_dcache_line will be cleared
//if wmb entry has not write, and has read_resp, then this entry must clr

// &Force("bus","snq_create_addr",39,0); @1258
assign wmb_entry_snq_create_addr_hit_idx  = wmb_entry_addr[13:6] ==  snq_create_addr[13:6];

assign wmb_entry_snq_create_hit_idx   = wmb_entry_idx_snq_dep_inst
//                                        &&  wmb_entry_page_share
                                        &&  snq_can_create_snq_uncheck
                                        &&  wmb_entry_snq_create_addr_hit_idx;

//if wmb entry has write and not resp, snq must wait
//assign wmb_entry_read_resp_already_write  = wmb_entry_read_req_success
//                                            &&  wmb_entry_read_resp
//                                            &&  wmb_entry_write_req_success;

//in this situation, then snq must wait, and set write imme of this entry
//assign wmb_entry_read_resp_hit_write_ptr  = wmb_entry_read_req_success
//                                            &&  wmb_entry_read_resp
//                                            &&  !wmb_entry_write_req_success
//                                            &&  wmb_write_ptr;

//read_req_success and read_resp and reset read_ptr
assign wmb_entry_read_resp_not_write      = wmb_entry_read_req_success
                                            &&  wmb_entry_read_resp
                                            &&  !wmb_entry_write_req_success;

//set snq signal
assign wmb_entry_snq_depd                 = wmb_entry_snq_create_hit_idx
                                            &&  (wmb_entry_read_resp_not_write
                                                    && !wmb_entry_dcache_only_inv_1line_inst
                                                    && wmb_entry_page_ca_dcache_valid
                                                 || wmb_entry_vld
                                                    && wmb_entry_write_req_success
                                                    && wmb_entry_dcache_only_inv_1line_inst);

assign wmb_entry_snq_set_write_imme       = wmb_entry_snq_create_hit_idx
                                            &&  wmb_entry_read_resp_not_write;

assign wmb_entry_snq_depd_remove = !wmb_entry_vld || wmb_entry_write_resp;  //write resp for dcache_inv 
//------------------compare snq dcache port-----------------
assign wmb_entry_same_dcache_line_clr = wmb_entry_vld
                                        &&  dcache_snq_st_sel
                                        &&  !wmb_entry_read_req_success
                                        &&  wmb_entry_dcache_hit_idx;

//==========================================================
//                Generate no_op signal
//==========================================================
//if not vld/ read resp & not write & not write imme
assign wmb_entry_no_op    = !wmb_entry_vld
                            ||  wmb_entry_read_resp
                                &&  !wmb_entry_write_imme
                                &&  !wmb_entry_write_req_success;

//==========================================================
//                 Generate pop signal
//==========================================================
//if write dcache line and is not the last entry of dcache line, then fast pop
assign wmb_entry_pop_vld  = wmb_entry_vld
                            &&  wmb_entry_read_resp
                            &&  (wmb_entry_write_resp
                                ||  wmb_entry_write_resp_set
                                ||  wmb_entry_mem_set_req
                                    &&  !wmb_entry_w_last)
                            &&  (wmb_entry_data_req_success  ||  wmb_entry_data_req_success_set)
                            &&  wmb_entry_wb_cmplt_success
                            &&  wmb_entry_wb_data_success;

//==========================================================
//                 Interface to rb
//==========================================================
assign wmb_entry_sync_fence_biu_req_success = wmb_entry_vld
                                              &&  wmb_entry_sync_fence_inst
                                              &&  wmb_entry_write_req_success;

//==========================================================
//                 Interface to had
//==========================================================
assign wmb_entry_ar_pending = wmb_entry_vld
                              &&  wmb_entry_read_req_success
                              &&  !wmb_entry_read_resp;

assign wmb_entry_aw_pending = wmb_entry_vld
                              &&  wmb_entry_write_req_success
                              &&  !wmb_entry_write_resp;

assign wmb_entry_w_pending  = wmb_entry_vld
                              &&  wmb_entry_data_req_success
                              &&  !wmb_entry_write_resp;
//==========================================================
//                 Generate interface
//==========================================================
//-----------------------input------------------------------
//-----------create signal--------------
assign wmb_entry_create_vld               = wmb_entry_create_vld_x;
assign wmb_entry_create_dp_vld            = wmb_entry_create_dp_vld_x;
assign wmb_entry_create_gateclk_en        = wmb_entry_create_gateclk_en_x;
assign wmb_entry_create_data_vld          = wmb_entry_create_data_vld_x;
//assign vb_wmb_entry_rcl_done_gateclk_en   = vb_wmb_entry_rcl_done_gateclk_en_x;
//---------grnt/done signal-------------
assign vb_wmb_entry_rcl_done              = vb_wmb_entry_rcl_done_x;
assign wmb_entry_next_nc_bypass           = wmb_entry_next_nc_bypass_x;
assign wmb_entry_next_so_bypass           = wmb_entry_next_so_bypass_x;
assign wmb_entry_wb_cmplt_grnt            = wmb_entry_wb_cmplt_grnt_x;
assign wmb_entry_wb_data_grnt             = wmb_entry_wb_data_grnt_x;
//-----------pointer--------------------
assign wmb_create_ptr_next1               = wmb_create_ptr_next1_x;
//assign wmb_create_ptr_next3               = wmb_create_ptr_next3_x;
assign wmb_data_ptr                       = wmb_data_ptr_x;
assign wmb_read_ptr                       = wmb_read_ptr_x;
assign wmb_write_ptr                      = wmb_write_ptr_x;
assign wmb_dcache_req_ptr                 = wmb_dcache_req_ptr_x;
assign wmb_entry_mem_set_write_grnt       = wmb_entry_mem_set_write_grnt_x;
assign wmb_entry_w_last_set               = wmb_entry_w_last_set_x;
//-----------merge signal---------------
assign wmb_entry_merge_data_vld           = wmb_entry_merge_data_vld_x;
assign wmb_entry_merge_data_wait_not_vld_req  = wmb_entry_merge_data_wait_not_vld_req_x;
//-----------gateclk signal-------------
assign wmb_entry_mem_set_write_gateclk_en = wmb_entry_mem_set_write_gateclk_en_x;
//-----------------------output-----------------------------
//-----------entry signal---------------
assign wmb_entry_vld_x                    = wmb_entry_vld;
assign wmb_entry_sync_fence_x             = wmb_entry_sync_fence;
assign wmb_entry_atomic_x                 = wmb_entry_atomic;
assign wmb_entry_atomic_and_vld_x         = wmb_entry_atomic_and_vld;
assign wmb_entry_icc_x                    = wmb_entry_icc;
assign wmb_entry_icc_and_vld_x            = wmb_entry_icc_and_vld;
assign wmb_entry_inst_flush_x             = wmb_entry_inst_flush;
assign wmb_entry_inst_is_dcache_x         = wmb_entry_inst_is_dcache;
assign wmb_entry_dcache_inst_x            = wmb_entry_dcache_inst;
assign wmb_entry_inst_type_v[1:0]         = wmb_entry_inst_type[1:0];
assign wmb_entry_inst_size_v[2:0]         = wmb_entry_inst_size[2:0];
assign wmb_entry_inst_mode_v[1:0]         = wmb_entry_inst_mode[1:0];
assign wmb_entry_iid_v[6:0]               = wmb_entry_iid[6:0];
assign wmb_entry_priv_mode_v[1:0]         = wmb_entry_priv_mode[1:0];
assign wmb_entry_page_share_x             = wmb_entry_page_share;
assign wmb_entry_page_so_x                = wmb_entry_page_so;
assign wmb_entry_page_ca_x                = wmb_entry_page_ca;
assign wmb_entry_page_wa_x                = wmb_entry_page_wa;
assign wmb_entry_page_buf_x               = wmb_entry_page_buf;
assign wmb_entry_page_sec_x               = wmb_entry_page_sec;
assign wmb_entry_addr_v[`PA_WIDTH-1:0]    = wmb_entry_addr[`PA_WIDTH-1:0];
assign wmb_entry_spec_fail_x              = wmb_entry_spec_fail;
assign wmb_entry_bkpta_data_x             = wmb_entry_bkpta_data;
assign wmb_entry_bkptb_data_x             = wmb_entry_bkptb_data;
assign wmb_entry_vstart_vld_x             = wmb_entry_vstart_vld;
assign wmb_entry_dcache_way_x             = wmb_entry_dcache_way;
assign wmb_entry_data_v[127:0]            = wmb_entry_data[127:0];
assign wmb_entry_biu_id_v[4:0]            = wmb_entry_biu_id[4:0];
assign wmb_entry_w_last_x                 = wmb_entry_w_last;
assign wmb_entry_bytes_vld_v[15:0]        = wmb_entry_bytes_vld[15:0];
assign wmb_entry_write_imme_x             = wmb_entry_write_imme;
assign wmb_entry_depd_x                   = wmb_entry_depd;
assign wmb_entry_sc_wb_success_x          = wmb_entry_sc_wb_success;
assign wmb_entry_preg_v[6:0]              = wmb_entry_preg[6:0];
assign wmb_entry_sync_fence_inst_x        = wmb_entry_sync_fence_inst;
//-----------request--------------------
assign wmb_entry_fwd_data_pe_req_x        = wmb_entry_fwd_data_pe_req;
assign wmb_entry_fwd_data_pe_gateclk_en_x = wmb_entry_fwd_data_pe_gateclk_en;
assign wmb_entry_discard_req_x            = wmb_entry_discard_req;
assign wmb_entry_fwd_req_x                = wmb_entry_fwd_req;
assign wmb_entry_fwd_bytes_vld_v[15:0]    = wmb_entry_fwd_bytes_vld[15:0];
assign wmb_entry_wb_cmplt_req_x           = wmb_entry_wb_cmplt_req;
assign wmb_entry_wb_data_req_x            = wmb_entry_wb_data_req;
assign wmb_entry_read_req_x               = wmb_entry_read_req;
assign wmb_entry_read_dp_req_x            = wmb_entry_read_dp_req;
assign wmb_entry_write_req_x              = wmb_entry_write_req;
assign wmb_entry_write_biu_req_x          = wmb_entry_write_biu_req;
assign wmb_entry_write_biu_dp_req_x       = wmb_entry_write_biu_dp_req;
assign wmb_entry_write_dcache_req_x       = wmb_entry_write_dcache_req;
assign wmb_entry_write_vb_req_x           = wmb_entry_write_vb_req;
assign wmb_entry_data_req_x               = wmb_entry_data_req;
assign wmb_entry_data_biu_req_x           = wmb_entry_data_biu_req;
assign wmb_entry_data_req_wns_x           = wmb_entry_data_req_wns;
assign wmb_entry_pop_vld_x                = wmb_entry_pop_vld;
assign wmb_entry_cancel_acc_req_x         = wmb_entry_cancel_acc_req;
assign wmb_entry_merge_data_stall_x       = wmb_entry_merge_data_stall;
assign wmb_entry_merge_data_addr_hit_x    = wmb_entry_merge_data_addr_hit;
assign wmb_entry_write_stall_x            = wmb_entry_write_stall;
//-------maintain pointer---------------
assign wmb_entry_read_ptr_unconditional_shift_imme_x  = wmb_entry_read_ptr_unconditional_shift_imme;
assign wmb_entry_read_ptr_chk_idx_shift_imme_x        = wmb_entry_read_ptr_chk_idx_shift_imme;
assign wmb_entry_write_ptr_unconditional_shift_imme_x = wmb_entry_write_ptr_unconditional_shift_imme;
assign wmb_entry_write_ptr_chk_idx_shift_imme_x       = wmb_entry_write_ptr_chk_idx_shift_imme;
assign wmb_entry_data_ptr_after_write_shift_imme_x    = wmb_entry_data_ptr_after_write_shift_imme;
assign wmb_entry_data_ptr_with_write_shift_imme_x     = wmb_entry_data_ptr_with_write_shift_imme;
//-----------hit idx--------------------
assign wmb_entry_pfu_biu_req_hit_idx_x    = wmb_entry_pfu_biu_req_hit_idx;
assign wmb_entry_rb_biu_req_hit_idx_x     = wmb_entry_rb_biu_req_hit_idx;
assign wmb_entry_snq_depd_x               = wmb_entry_snq_depd;
assign wmb_entry_hit_sq_pop_dcache_line_x = wmb_entry_hit_sq_pop_dcache_line;
//-----------other signal---------------
assign wmb_entry_write_imme_bypass_x      = wmb_entry_write_imme_bypass;
assign wmb_entry_ready_to_dcache_line_x   = wmb_entry_ready_to_dcache_line;
assign wmb_entry_last_addr_plus_x         = wmb_entry_last_addr_plus;
assign wmb_entry_last_addr_sub_x          = wmb_entry_last_addr_sub;
assign wmb_entry_no_op_x                  = wmb_entry_no_op;
assign wmb_entry_read_resp_ready_x        = wmb_entry_read_resp_ready;
assign wmb_entry_snq_depd_remove_x        = wmb_entry_snq_depd_remove;
//--------to other module signal--------
assign wmb_entry_sync_fence_biu_req_success_x = wmb_entry_sync_fence_biu_req_success;
assign wmb_entry_ar_pending_x             = wmb_entry_ar_pending;
assign wmb_entry_aw_pending_x             = wmb_entry_aw_pending;
assign wmb_entry_w_pending_x              = wmb_entry_w_pending;

// &ModuleEnd; @1461
endmodule


