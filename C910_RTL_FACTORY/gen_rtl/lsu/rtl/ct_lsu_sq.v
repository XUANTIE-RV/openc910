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

// &ModuleBeg; @30
module ct_lsu_sq(
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  dcache_dirty_din,
  dcache_dirty_gwen,
  dcache_dirty_wen,
  dcache_idx,
  dcache_tag_din,
  dcache_tag_gwen,
  dcache_tag_wen,
  forever_cpuclk,
  had_lsu_bus_trace_en,
  had_lsu_dbg_en,
  icc_idle,
  icc_sq_grnt,
  ld_da_lsid,
  ld_da_sq_data_discard_vld,
  ld_da_sq_fwd_id,
  ld_da_sq_fwd_multi_vld,
  ld_da_sq_global_discard_vld,
  ld_dc_addr0,
  ld_dc_addr1_11to4,
  ld_dc_bytes_vld,
  ld_dc_bytes_vld1,
  ld_dc_chk_atomic_inst_vld,
  ld_dc_chk_ld_addr1_vld,
  ld_dc_chk_ld_bypass_vld,
  ld_dc_chk_ld_inst_vld,
  ld_dc_iid,
  lsu_had_sq_not_empty,
  lsu_had_st_addr,
  lsu_had_st_data,
  lsu_had_st_iid,
  lsu_had_st_req,
  lsu_had_st_type,
  lsu_idu_sq_not_full,
  lsu_rtu_all_commit_data_vld,
  lsu_rtu_all_commit_ld_data_vld,
  pad_yy_icg_scan_en,
  rb_sq_pop_hit_idx,
  rtu_lsu_async_flush,
  rtu_lsu_commit0_iid_updt_val,
  rtu_lsu_commit1_iid_updt_val,
  rtu_lsu_commit2_iid_updt_val,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit2,
  rtu_yy_xx_flush,
  sd_ex1_data,
  sd_ex1_inst_vld,
  sd_rf_ex1_sdid,
  sd_rf_inst_vld_short,
  sq_data_depd_wakeup,
  sq_empty,
  sq_global_depd_wakeup,
  sq_icc_clr,
  sq_icc_inv,
  sq_icc_req,
  sq_ld_da_fwd_data,
  sq_ld_da_fwd_data_pe,
  sq_ld_dc_addr1_dep_discard,
  sq_ld_dc_cancel_acc_req,
  sq_ld_dc_cancel_ahead_wb,
  sq_ld_dc_data_discard_req,
  sq_ld_dc_fwd_bypass_multi,
  sq_ld_dc_fwd_bypass_req,
  sq_ld_dc_fwd_id,
  sq_ld_dc_fwd_multi,
  sq_ld_dc_fwd_multi_mask,
  sq_ld_dc_fwd_req,
  sq_ld_dc_has_fwd_req,
  sq_ld_dc_newest_fwd_data_vld_req,
  sq_ld_dc_other_discard_req,
  sq_pfu_pop_synci_inst,
  sq_pop_addr,
  sq_pop_atomic,
  sq_pop_bytes_vld,
  sq_pop_icc,
  sq_pop_inst_flush,
  sq_pop_inst_mode,
  sq_pop_inst_size,
  sq_pop_inst_type,
  sq_pop_page_buf,
  sq_pop_page_ca,
  sq_pop_page_sec,
  sq_pop_page_share,
  sq_pop_page_so,
  sq_pop_page_wa,
  sq_pop_priv_mode,
  sq_pop_ptr,
  sq_pop_sync_fence,
  sq_pop_wo_st,
  sq_st_dc_full,
  sq_st_dc_inst_hit,
  sq_wmb_merge_req,
  sq_wmb_merge_stall_req,
  sq_wmb_pop_to_ce_dp_req,
  sq_wmb_pop_to_ce_gateclk_en,
  sq_wmb_pop_to_ce_req,
  st_da_bkpta_data,
  st_da_bkptb_data,
  st_da_iid,
  st_da_inst_vld,
  st_da_secd,
  st_da_sq_dcache_dirty,
  st_da_sq_dcache_share,
  st_da_sq_dcache_valid,
  st_da_sq_dcache_way,
  st_da_sq_ecc_stall,
  st_da_sq_no_restart,
  st_da_wb_expt_vld,
  st_da_wb_spec_fail,
  st_da_wb_vstart_vld,
  st_dc_addr0,
  st_dc_atomic,
  st_dc_boundary,
  st_dc_boundary_first,
  st_dc_bytes_vld,
  st_dc_cmit0_iid_crt_hit,
  st_dc_cmit1_iid_crt_hit,
  st_dc_cmit2_iid_crt_hit,
  st_dc_da_page_buf,
  st_dc_da_page_ca,
  st_dc_da_page_sec,
  st_dc_da_page_share,
  st_dc_da_page_so,
  st_dc_da_page_wa,
  st_dc_fence_mode,
  st_dc_icc,
  st_dc_iid,
  st_dc_inst_flush,
  st_dc_inst_mode,
  st_dc_inst_size,
  st_dc_inst_type,
  st_dc_old,
  st_dc_rot_sel_rev,
  st_dc_sdid,
  st_dc_sdid_hit,
  st_dc_secd,
  st_dc_sq_create_dp_vld,
  st_dc_sq_create_gateclk_en,
  st_dc_sq_create_vld,
  st_dc_sq_data_vld,
  st_dc_sync_fence,
  st_dc_wo_st_inst,
  wmb_ce_addr,
  wmb_ce_bkpta_data,
  wmb_ce_bkptb_data,
  wmb_ce_create_hit_rb_idx,
  wmb_ce_data128,
  wmb_ce_dcache_share,
  wmb_ce_dcache_sw_inst,
  wmb_ce_dcache_valid,
  wmb_ce_fence_mode,
  wmb_ce_iid,
  wmb_ce_spec_fail,
  wmb_ce_sq_ptr,
  wmb_ce_update_dcache_dirty,
  wmb_ce_update_dcache_share,
  wmb_ce_update_dcache_valid,
  wmb_ce_update_dcache_way,
  wmb_ce_vld,
  wmb_ce_vstart_vld,
  wmb_sq_pop_grnt,
  wmb_sq_pop_to_ce_grnt
);

// &Ports; @31
input            cp0_lsu_icg_en;                        
input            cp0_yy_clk_en;                         
input   [1  :0]  cp0_yy_priv_mode;                      
input            cpurst_b;                              
input   [6  :0]  dcache_dirty_din;                      
input            dcache_dirty_gwen;                     
input   [6  :0]  dcache_dirty_wen;                      
input   [8  :0]  dcache_idx;                            
input   [51 :0]  dcache_tag_din;                        
input            dcache_tag_gwen;                       
input   [1  :0]  dcache_tag_wen;                        
input            forever_cpuclk;                        
input            had_lsu_bus_trace_en;                  
input            had_lsu_dbg_en;                        
input            icc_idle;                              
input            icc_sq_grnt;                           
input   [11 :0]  ld_da_lsid;                            
input            ld_da_sq_data_discard_vld;             
input   [11 :0]  ld_da_sq_fwd_id;                       
input            ld_da_sq_fwd_multi_vld;                
input            ld_da_sq_global_discard_vld;           
input   [39 :0]  ld_dc_addr0;                           
input   [7  :0]  ld_dc_addr1_11to4;                     
input   [15 :0]  ld_dc_bytes_vld;                       
input   [15 :0]  ld_dc_bytes_vld1;                      
input            ld_dc_chk_atomic_inst_vld;             
input            ld_dc_chk_ld_addr1_vld;                
input            ld_dc_chk_ld_bypass_vld;               
input            ld_dc_chk_ld_inst_vld;                 
input   [6  :0]  ld_dc_iid;                             
input            lsu_rtu_all_commit_ld_data_vld;        
input            pad_yy_icg_scan_en;                    
input            rb_sq_pop_hit_idx;                     
input            rtu_lsu_async_flush;                   
input   [6  :0]  rtu_lsu_commit0_iid_updt_val;          
input   [6  :0]  rtu_lsu_commit1_iid_updt_val;          
input   [6  :0]  rtu_lsu_commit2_iid_updt_val;          
input            rtu_yy_xx_commit0;                     
input            rtu_yy_xx_commit1;                     
input            rtu_yy_xx_commit2;                     
input            rtu_yy_xx_flush;                       
input   [63 :0]  sd_ex1_data;                           
input            sd_ex1_inst_vld;                       
input   [3  :0]  sd_rf_ex1_sdid;                        
input            sd_rf_inst_vld_short;                  
input            st_da_bkpta_data;                      
input            st_da_bkptb_data;                      
input   [6  :0]  st_da_iid;                             
input            st_da_inst_vld;                        
input            st_da_secd;                            
input            st_da_sq_dcache_dirty;                 
input            st_da_sq_dcache_share;                 
input            st_da_sq_dcache_valid;                 
input            st_da_sq_dcache_way;                   
input            st_da_sq_ecc_stall;                    
input            st_da_sq_no_restart;                   
input            st_da_wb_expt_vld;                     
input            st_da_wb_spec_fail;                    
input            st_da_wb_vstart_vld;                   
input   [39 :0]  st_dc_addr0;                           
input            st_dc_atomic;                          
input            st_dc_boundary;                        
input            st_dc_boundary_first;                  
input   [15 :0]  st_dc_bytes_vld;                       
input            st_dc_cmit0_iid_crt_hit;               
input            st_dc_cmit1_iid_crt_hit;               
input            st_dc_cmit2_iid_crt_hit;               
input            st_dc_da_page_buf;                     
input            st_dc_da_page_ca;                      
input            st_dc_da_page_sec;                     
input            st_dc_da_page_share;                   
input            st_dc_da_page_so;                      
input            st_dc_da_page_wa;                      
input   [3  :0]  st_dc_fence_mode;                      
input            st_dc_icc;                             
input   [6  :0]  st_dc_iid;                             
input            st_dc_inst_flush;                      
input   [1  :0]  st_dc_inst_mode;                       
input   [2  :0]  st_dc_inst_size;                       
input   [1  :0]  st_dc_inst_type;                       
input            st_dc_old;                             
input   [7  :0]  st_dc_rot_sel_rev;                     
input   [3  :0]  st_dc_sdid;                            
input            st_dc_sdid_hit;                        
input            st_dc_secd;                            
input            st_dc_sq_create_dp_vld;                
input            st_dc_sq_create_gateclk_en;            
input            st_dc_sq_create_vld;                   
input            st_dc_sq_data_vld;                     
input            st_dc_sync_fence;                      
input            st_dc_wo_st_inst;                      
input   [39 :0]  wmb_ce_addr;                           
input            wmb_ce_dcache_sw_inst;                 
input   [11 :0]  wmb_ce_sq_ptr;                         
input            wmb_ce_vld;                            
input            wmb_sq_pop_grnt;                       
input            wmb_sq_pop_to_ce_grnt;                 
output           lsu_had_sq_not_empty;                  
output  [39 :0]  lsu_had_st_addr;                       
output  [63 :0]  lsu_had_st_data;                       
output  [6  :0]  lsu_had_st_iid;                        
output           lsu_had_st_req;                        
output  [3  :0]  lsu_had_st_type;                       
output           lsu_idu_sq_not_full;                   
output           lsu_rtu_all_commit_data_vld;           
output  [11 :0]  sq_data_depd_wakeup;                   
output           sq_empty;                              
output  [11 :0]  sq_global_depd_wakeup;                 
output           sq_icc_clr;                            
output           sq_icc_inv;                            
output           sq_icc_req;                            
output  [63 :0]  sq_ld_da_fwd_data;                     
output  [63 :0]  sq_ld_da_fwd_data_pe;                  
output           sq_ld_dc_addr1_dep_discard;            
output           sq_ld_dc_cancel_acc_req;               
output           sq_ld_dc_cancel_ahead_wb;              
output           sq_ld_dc_data_discard_req;             
output           sq_ld_dc_fwd_bypass_multi;             
output           sq_ld_dc_fwd_bypass_req;               
output  [11 :0]  sq_ld_dc_fwd_id;                       
output           sq_ld_dc_fwd_multi;                    
output           sq_ld_dc_fwd_multi_mask;               
output           sq_ld_dc_fwd_req;                      
output           sq_ld_dc_has_fwd_req;                  
output           sq_ld_dc_newest_fwd_data_vld_req;      
output           sq_ld_dc_other_discard_req;            
output           sq_pfu_pop_synci_inst;                 
output  [39 :0]  sq_pop_addr;                           
output           sq_pop_atomic;                         
output  [15 :0]  sq_pop_bytes_vld;                      
output           sq_pop_icc;                            
output           sq_pop_inst_flush;                     
output  [1  :0]  sq_pop_inst_mode;                      
output  [2  :0]  sq_pop_inst_size;                      
output  [1  :0]  sq_pop_inst_type;                      
output           sq_pop_page_buf;                       
output           sq_pop_page_ca;                        
output           sq_pop_page_sec;                       
output           sq_pop_page_share;                     
output           sq_pop_page_so;                        
output           sq_pop_page_wa;                        
output  [1  :0]  sq_pop_priv_mode;                      
output  [11 :0]  sq_pop_ptr;                            
output           sq_pop_sync_fence;                     
output           sq_pop_wo_st;                          
output           sq_st_dc_full;                         
output           sq_st_dc_inst_hit;                     
output           sq_wmb_merge_req;                      
output           sq_wmb_merge_stall_req;                
output           sq_wmb_pop_to_ce_dp_req;               
output           sq_wmb_pop_to_ce_gateclk_en;           
output           sq_wmb_pop_to_ce_req;                  
output           wmb_ce_bkpta_data;                     
output           wmb_ce_bkptb_data;                     
output           wmb_ce_create_hit_rb_idx;              
output  [127:0]  wmb_ce_data128;                        
output           wmb_ce_dcache_share;                   
output           wmb_ce_dcache_valid;                   
output  [3  :0]  wmb_ce_fence_mode;                     
output  [6  :0]  wmb_ce_iid;                            
output           wmb_ce_spec_fail;                      
output           wmb_ce_update_dcache_dirty;            
output           wmb_ce_update_dcache_share;            
output           wmb_ce_update_dcache_valid;            
output           wmb_ce_update_dcache_way;              
output           wmb_ce_vstart_vld;                     

// &Regs; @32
reg     [11 :0]  sq_create_ptr;                         
reg     [11 :0]  sq_data_discard_id_sel;                
reg     [11 :0]  sq_dbg_pop_ptr;                        
reg     [39 :0]  sq_dbg_st_addr;                        
reg     [39 :0]  sq_dbg_st_addr_ff;                     
reg     [15 :0]  sq_dbg_st_bytes_vld;                   
reg     [63 :0]  sq_dbg_st_data;                        
reg     [63 :0]  sq_dbg_st_data_ff;                     
reg     [6  :0]  sq_dbg_st_iid;                         
reg     [6  :0]  sq_dbg_st_iid_ff;                      
reg              sq_dbg_st_req;                         
reg              sq_dbg_st_req_ff;                      
reg     [63 :0]  sq_fwd_data_pe;                        
reg     [63 :0]  sq_fwd_data_sel;                       
reg              sq_fwd_multi;                          
reg     [63 :0]  sq_ld_da_fwd_data;                     
reg     [39 :0]  sq_pe_age_vec_surplus1_addr;           
reg     [15 :0]  sq_pe_age_vec_surplus1_bytes_vld;      
reg     [39 :0]  sq_pe_age_vec_zero_addr;               
reg     [15 :0]  sq_pe_age_vec_zero_bytes_vld;          
reg     [39 :0]  sq_pop_addr;                           
reg              sq_pop_atomic;                         
reg     [15 :0]  sq_pop_bytes_vld;                      
reg              sq_pop_depd_ff;                        
reg              sq_pop_icc;                            
reg              sq_pop_inst_flush;                     
reg     [1  :0]  sq_pop_inst_mode;                      
reg     [2  :0]  sq_pop_inst_size;                      
reg     [1  :0]  sq_pop_inst_type;                      
reg              sq_pop_page_buf;                       
reg              sq_pop_page_ca;                        
reg              sq_pop_page_sec;                       
reg              sq_pop_page_share;                     
reg              sq_pop_page_so;                        
reg              sq_pop_page_wa;                        
reg     [1  :0]  sq_pop_priv_mode;                      
reg     [11 :0]  sq_pop_ptr;                            
reg              sq_pop_sync_fence;                     
reg              sq_pop_wo_st;                          
reg              sq_req_icc_success;                    
reg     [11 :0]  sq_wakeup_queue;                       
reg     [63 :0]  wmb_ce_data64;                         

// &Wires; @33
wire             cp0_lsu_icg_en;                        
wire             cp0_yy_clk_en;                         
wire    [1  :0]  cp0_yy_priv_mode;                      
wire             cpurst_b;                              
wire    [6  :0]  dcache_dirty_din;                      
wire             dcache_dirty_gwen;                     
wire    [6  :0]  dcache_dirty_wen;                      
wire    [8  :0]  dcache_idx;                            
wire    [51 :0]  dcache_tag_din;                        
wire             dcache_tag_gwen;                       
wire    [1  :0]  dcache_tag_wen;                        
wire             forever_cpuclk;                        
wire             had_lsu_bus_trace_en;                  
wire             had_lsu_dbg_en;                        
wire             icc_idle;                              
wire             icc_sq_grnt;                           
wire    [11 :0]  ld_da_lsid;                            
wire             ld_da_sq_data_discard_vld;             
wire    [11 :0]  ld_da_sq_fwd_id;                       
wire             ld_da_sq_fwd_multi_vld;                
wire             ld_da_sq_global_discard_vld;           
wire    [39 :0]  ld_dc_addr0;                           
wire    [7  :0]  ld_dc_addr1_11to4;                     
wire    [15 :0]  ld_dc_bytes_vld;                       
wire    [15 :0]  ld_dc_bytes_vld1;                      
wire             ld_dc_chk_atomic_inst_vld;             
wire             ld_dc_chk_ld_addr1_vld;                
wire             ld_dc_chk_ld_bypass_vld;               
wire             ld_dc_chk_ld_inst_vld;                 
wire    [6  :0]  ld_dc_iid;                             
wire             lsu_had_sq_not_empty;                  
wire    [39 :0]  lsu_had_st_addr;                       
wire    [63 :0]  lsu_had_st_data;                       
wire    [6  :0]  lsu_had_st_iid;                        
wire             lsu_had_st_req;                        
wire    [3  :0]  lsu_had_st_type;                       
wire             lsu_idu_sq_not_full;                   
wire             lsu_rtu_all_commit_data_vld;           
wire             lsu_rtu_all_commit_ld_data_vld;        
wire             lsu_rtu_all_commit_st_data_vld;        
wire             pad_yy_icg_scan_en;                    
wire             rb_sq_pop_hit_idx;                     
wire             rtu_lsu_async_flush;                   
wire    [6  :0]  rtu_lsu_commit0_iid_updt_val;          
wire    [6  :0]  rtu_lsu_commit1_iid_updt_val;          
wire    [6  :0]  rtu_lsu_commit2_iid_updt_val;          
wire             rtu_yy_xx_commit0;                     
wire             rtu_yy_xx_commit1;                     
wire             rtu_yy_xx_commit2;                     
wire             rtu_yy_xx_flush;                       
wire    [63 :0]  sd_ex1_data;                           
wire             sd_ex1_inst_vld;                       
wire    [3  :0]  sd_rf_ex1_sdid;                        
wire             sd_rf_inst_vld_short;                  
wire             sq_age_vec_set;                        
wire             sq_clk;                                
wire             sq_clk_en;                             
wire    [11 :0]  sq_create_age_vec;                     
wire             sq_create_pop_clk;                     
wire             sq_create_pop_clk_en;                  
wire             sq_create_same_addr_newest;            
wire             sq_create_success;                     
wire    [11 :0]  sq_create_vld;                         
wire    [127:0]  sq_data_after_rot;                     
wire    [11 :0]  sq_data_depd_wakeup;                   
wire             sq_data_discard_has_newest;            
wire    [11 :0]  sq_data_discard_newest_id;             
wire             sq_data_discard_req;                   
wire             sq_data_discard_req_short;             
wire    [127:0]  sq_data_ori;                           
wire    [63 :0]  sq_data_settle;                        
wire             sq_dbg_clk;                            
wire             sq_dbg_clk_en;                         
wire    [127:0]  sq_dbg_st_bytes_vld_extend;            
wire    [127:0]  sq_dbg_st_data_after_mask;             
wire    [63 :0]  sq_dbg_st_data_compress64;             
wire             sq_empty;                              
wire             sq_empty_less2;                        
wire    [39 :0]  sq_entry_addr0_0;                      
wire    [39 :0]  sq_entry_addr0_1;                      
wire    [39 :0]  sq_entry_addr0_10;                     
wire    [39 :0]  sq_entry_addr0_11;                     
wire    [39 :0]  sq_entry_addr0_2;                      
wire    [39 :0]  sq_entry_addr0_3;                      
wire    [39 :0]  sq_entry_addr0_4;                      
wire    [39 :0]  sq_entry_addr0_5;                      
wire    [39 :0]  sq_entry_addr0_6;                      
wire    [39 :0]  sq_entry_addr0_7;                      
wire    [39 :0]  sq_entry_addr0_8;                      
wire    [39 :0]  sq_entry_addr0_9;                      
wire    [11 :0]  sq_entry_addr1_dep_discard;            
wire    [11 :0]  sq_entry_age_vec_surplus1_ptr;         
wire    [11 :0]  sq_entry_age_vec_zero_ptr;             
wire    [11 :0]  sq_entry_atomic;                       
wire    [11 :0]  sq_entry_bkpta_data;                   
wire    [11 :0]  sq_entry_bkptb_data;                   
wire    [15 :0]  sq_entry_bytes_vld_0;                  
wire    [15 :0]  sq_entry_bytes_vld_1;                  
wire    [15 :0]  sq_entry_bytes_vld_10;                 
wire    [15 :0]  sq_entry_bytes_vld_11;                 
wire    [15 :0]  sq_entry_bytes_vld_2;                  
wire    [15 :0]  sq_entry_bytes_vld_3;                  
wire    [15 :0]  sq_entry_bytes_vld_4;                  
wire    [15 :0]  sq_entry_bytes_vld_5;                  
wire    [15 :0]  sq_entry_bytes_vld_6;                  
wire    [15 :0]  sq_entry_bytes_vld_7;                  
wire    [15 :0]  sq_entry_bytes_vld_8;                  
wire    [15 :0]  sq_entry_bytes_vld_9;                  
wire    [11 :0]  sq_entry_cancel_acc_req;               
wire    [11 :0]  sq_entry_cancel_ahead_wb;              
wire    [11 :0]  sq_entry_cmit;                         
wire    [11 :0]  sq_entry_cmit_data_vld;                
wire    [11 :0]  sq_entry_create_dp_vld;                
wire    [11 :0]  sq_entry_create_gateclk_en;            
wire    [11 :0]  sq_entry_create_vld;                   
wire    [63 :0]  sq_entry_data_0;                       
wire    [63 :0]  sq_entry_data_1;                       
wire    [63 :0]  sq_entry_data_10;                      
wire    [63 :0]  sq_entry_data_11;                      
wire    [63 :0]  sq_entry_data_2;                       
wire    [63 :0]  sq_entry_data_3;                       
wire    [63 :0]  sq_entry_data_4;                       
wire    [63 :0]  sq_entry_data_5;                       
wire    [63 :0]  sq_entry_data_6;                       
wire    [63 :0]  sq_entry_data_7;                       
wire    [63 :0]  sq_entry_data_8;                       
wire    [63 :0]  sq_entry_data_9;                       
wire    [11 :0]  sq_entry_data_depd_wakeup_0;           
wire    [11 :0]  sq_entry_data_depd_wakeup_1;           
wire    [11 :0]  sq_entry_data_depd_wakeup_10;          
wire    [11 :0]  sq_entry_data_depd_wakeup_11;          
wire    [11 :0]  sq_entry_data_depd_wakeup_2;           
wire    [11 :0]  sq_entry_data_depd_wakeup_3;           
wire    [11 :0]  sq_entry_data_depd_wakeup_4;           
wire    [11 :0]  sq_entry_data_depd_wakeup_5;           
wire    [11 :0]  sq_entry_data_depd_wakeup_6;           
wire    [11 :0]  sq_entry_data_depd_wakeup_7;           
wire    [11 :0]  sq_entry_data_depd_wakeup_8;           
wire    [11 :0]  sq_entry_data_depd_wakeup_9;           
wire    [11 :0]  sq_entry_data_discard_grnt;            
wire    [11 :0]  sq_entry_data_discard_req;             
wire    [11 :0]  sq_entry_data_discard_req_short;       
wire    [11 :0]  sq_entry_dcache_dirty;                 
wire    [11 :0]  sq_entry_dcache_info_vld;              
wire    [11 :0]  sq_entry_dcache_share;                 
wire    [11 :0]  sq_entry_dcache_valid;                 
wire    [11 :0]  sq_entry_dcache_way;                   
wire    [11 :0]  sq_entry_depd;                         
wire    [11 :0]  sq_entry_depd_set;                     
wire    [11 :0]  sq_entry_discard_req;                  
wire    [3  :0]  sq_entry_fence_mode_0;                 
wire    [3  :0]  sq_entry_fence_mode_1;                 
wire    [3  :0]  sq_entry_fence_mode_10;                
wire    [3  :0]  sq_entry_fence_mode_11;                
wire    [3  :0]  sq_entry_fence_mode_2;                 
wire    [3  :0]  sq_entry_fence_mode_3;                 
wire    [3  :0]  sq_entry_fence_mode_4;                 
wire    [3  :0]  sq_entry_fence_mode_5;                 
wire    [3  :0]  sq_entry_fence_mode_6;                 
wire    [3  :0]  sq_entry_fence_mode_7;                 
wire    [3  :0]  sq_entry_fence_mode_8;                 
wire    [3  :0]  sq_entry_fence_mode_9;                 
wire    [11 :0]  sq_entry_fwd_bypass_req;               
wire    [11 :0]  sq_entry_fwd_multi_depd_set;           
wire    [11 :0]  sq_entry_fwd_req;                      
wire    [11 :0]  sq_entry_icc;                          
wire    [6  :0]  sq_entry_iid_0;                        
wire    [6  :0]  sq_entry_iid_1;                        
wire    [6  :0]  sq_entry_iid_10;                       
wire    [6  :0]  sq_entry_iid_11;                       
wire    [6  :0]  sq_entry_iid_2;                        
wire    [6  :0]  sq_entry_iid_3;                        
wire    [6  :0]  sq_entry_iid_4;                        
wire    [6  :0]  sq_entry_iid_5;                        
wire    [6  :0]  sq_entry_iid_6;                        
wire    [6  :0]  sq_entry_iid_7;                        
wire    [6  :0]  sq_entry_iid_8;                        
wire    [6  :0]  sq_entry_iid_9;                        
wire    [11 :0]  sq_entry_inst_flush;                   
wire    [11 :0]  sq_entry_inst_hit;                     
wire    [1  :0]  sq_entry_inst_mode_0;                  
wire    [1  :0]  sq_entry_inst_mode_1;                  
wire    [1  :0]  sq_entry_inst_mode_10;                 
wire    [1  :0]  sq_entry_inst_mode_11;                 
wire    [1  :0]  sq_entry_inst_mode_2;                  
wire    [1  :0]  sq_entry_inst_mode_3;                  
wire    [1  :0]  sq_entry_inst_mode_4;                  
wire    [1  :0]  sq_entry_inst_mode_5;                  
wire    [1  :0]  sq_entry_inst_mode_6;                  
wire    [1  :0]  sq_entry_inst_mode_7;                  
wire    [1  :0]  sq_entry_inst_mode_8;                  
wire    [1  :0]  sq_entry_inst_mode_9;                  
wire    [2  :0]  sq_entry_inst_size_0;                  
wire    [2  :0]  sq_entry_inst_size_1;                  
wire    [2  :0]  sq_entry_inst_size_10;                 
wire    [2  :0]  sq_entry_inst_size_11;                 
wire    [2  :0]  sq_entry_inst_size_2;                  
wire    [2  :0]  sq_entry_inst_size_3;                  
wire    [2  :0]  sq_entry_inst_size_4;                  
wire    [2  :0]  sq_entry_inst_size_5;                  
wire    [2  :0]  sq_entry_inst_size_6;                  
wire    [2  :0]  sq_entry_inst_size_7;                  
wire    [2  :0]  sq_entry_inst_size_8;                  
wire    [2  :0]  sq_entry_inst_size_9;                  
wire    [1  :0]  sq_entry_inst_type_0;                  
wire    [1  :0]  sq_entry_inst_type_1;                  
wire    [1  :0]  sq_entry_inst_type_10;                 
wire    [1  :0]  sq_entry_inst_type_11;                 
wire    [1  :0]  sq_entry_inst_type_2;                  
wire    [1  :0]  sq_entry_inst_type_3;                  
wire    [1  :0]  sq_entry_inst_type_4;                  
wire    [1  :0]  sq_entry_inst_type_5;                  
wire    [1  :0]  sq_entry_inst_type_6;                  
wire    [1  :0]  sq_entry_inst_type_7;                  
wire    [1  :0]  sq_entry_inst_type_8;                  
wire    [1  :0]  sq_entry_inst_type_9;                  
wire    [11 :0]  sq_entry_newest_fwd_req_data_vld;      
wire    [11 :0]  sq_entry_newest_fwd_req_data_vld_short; 
wire    [11 :0]  sq_entry_page_buf;                     
wire    [11 :0]  sq_entry_page_ca;                      
wire    [11 :0]  sq_entry_page_sec;                     
wire    [11 :0]  sq_entry_page_share;                   
wire    [11 :0]  sq_entry_page_so;                      
wire    [11 :0]  sq_entry_page_wa;                      
wire    [11 :0]  sq_entry_pop_req;                      
wire    [11 :0]  sq_entry_pop_to_ce_grnt;               
wire    [11 :0]  sq_entry_pop_to_ce_grnt_b;             
wire    [1  :0]  sq_entry_priv_mode_0;                  
wire    [1  :0]  sq_entry_priv_mode_1;                  
wire    [1  :0]  sq_entry_priv_mode_10;                 
wire    [1  :0]  sq_entry_priv_mode_11;                 
wire    [1  :0]  sq_entry_priv_mode_2;                  
wire    [1  :0]  sq_entry_priv_mode_3;                  
wire    [1  :0]  sq_entry_priv_mode_4;                  
wire    [1  :0]  sq_entry_priv_mode_5;                  
wire    [1  :0]  sq_entry_priv_mode_6;                  
wire    [1  :0]  sq_entry_priv_mode_7;                  
wire    [1  :0]  sq_entry_priv_mode_8;                  
wire    [1  :0]  sq_entry_priv_mode_9;                  
wire    [7  :0]  sq_entry_rot_sel_0;                    
wire    [7  :0]  sq_entry_rot_sel_1;                    
wire    [7  :0]  sq_entry_rot_sel_10;                   
wire    [7  :0]  sq_entry_rot_sel_11;                   
wire    [7  :0]  sq_entry_rot_sel_2;                    
wire    [7  :0]  sq_entry_rot_sel_3;                    
wire    [7  :0]  sq_entry_rot_sel_4;                    
wire    [7  :0]  sq_entry_rot_sel_5;                    
wire    [7  :0]  sq_entry_rot_sel_6;                    
wire    [7  :0]  sq_entry_rot_sel_7;                    
wire    [7  :0]  sq_entry_rot_sel_8;                    
wire    [7  :0]  sq_entry_rot_sel_9;                    
wire    [11 :0]  sq_entry_same_addr_newest;             
wire    [11 :0]  sq_entry_settle_data_hit;              
wire    [11 :0]  sq_entry_spec_fail;                    
wire    [11 :0]  sq_entry_st_dc_create_age_vec;         
wire    [11 :0]  sq_entry_st_dc_same_addr_newer;        
wire    [11 :0]  sq_entry_sync_fence;                   
wire    [11 :0]  sq_entry_vld;                          
wire    [11 :0]  sq_entry_vstart_vld;                   
wire    [11 :0]  sq_entry_wakeup_queue_set_id;          
wire    [11 :0]  sq_entry_wo_st;                        
wire             sq_full;                               
wire             sq_fwd_bypass_req;                     
wire             sq_fwd_data_pe_clk;                    
wire             sq_fwd_data_pe_clk_en;                 
wire             sq_fwd_data_pe_req;                    
wire             sq_fwd_req;                            
wire    [11 :0]  sq_fwd_req_id;                         
wire    [11 :0]  sq_global_depd_wakeup;                 
wire             sq_has_cmit;                           
wire             sq_icc_clr;                            
wire             sq_icc_inv;                            
wire             sq_icc_req;                            
wire    [63 :0]  sq_ld_da_fwd_data_pe;                  
wire             sq_ld_dc_addr1_dep_discard;            
wire             sq_ld_dc_cancel_acc_req;               
wire             sq_ld_dc_cancel_ahead_wb;              
wire             sq_ld_dc_data_discard_req;             
wire             sq_ld_dc_fwd_bypass_multi;             
wire             sq_ld_dc_fwd_bypass_req;               
wire    [11 :0]  sq_ld_dc_fwd_id;                       
wire             sq_ld_dc_fwd_multi;                    
wire             sq_ld_dc_fwd_multi_mask;               
wire             sq_ld_dc_fwd_req;                      
wire             sq_ld_dc_has_fwd_req;                  
wire             sq_ld_dc_newest_fwd_data_vld_req;      
wire             sq_ld_dc_other_discard_req;            
wire             sq_newest_fwd_bypass_req;              
wire             sq_newest_fwd_req;                     
wire             sq_newest_fwd_req_data_vld_short;      
wire    [11 :0]  sq_newest_fwd_req_id;                  
wire             sq_pe_age_vec_surplus1_atomic;         
wire             sq_pe_age_vec_surplus1_icc;            
wire             sq_pe_age_vec_surplus1_inst_flush;     
wire    [1  :0]  sq_pe_age_vec_surplus1_inst_mode;      
wire    [2  :0]  sq_pe_age_vec_surplus1_inst_size;      
wire    [1  :0]  sq_pe_age_vec_surplus1_inst_type;      
wire             sq_pe_age_vec_surplus1_page_buf;       
wire             sq_pe_age_vec_surplus1_page_ca;        
wire             sq_pe_age_vec_surplus1_page_sec;       
wire             sq_pe_age_vec_surplus1_page_share;     
wire             sq_pe_age_vec_surplus1_page_so;        
wire             sq_pe_age_vec_surplus1_page_wa;        
wire    [1  :0]  sq_pe_age_vec_surplus1_priv_mode;      
wire             sq_pe_age_vec_surplus1_sync_fence;     
wire             sq_pe_age_vec_surplus1_wo_st;          
wire             sq_pe_age_vec_zero_atomic;             
wire             sq_pe_age_vec_zero_icc;                
wire             sq_pe_age_vec_zero_inst_flush;         
wire    [1  :0]  sq_pe_age_vec_zero_inst_mode;          
wire    [2  :0]  sq_pe_age_vec_zero_inst_size;          
wire    [1  :0]  sq_pe_age_vec_zero_inst_type;          
wire             sq_pe_age_vec_zero_page_buf;           
wire             sq_pe_age_vec_zero_page_ca;            
wire             sq_pe_age_vec_zero_page_sec;           
wire             sq_pe_age_vec_zero_page_share;         
wire             sq_pe_age_vec_zero_page_so;            
wire             sq_pe_age_vec_zero_page_wa;            
wire    [1  :0]  sq_pe_age_vec_zero_priv_mode;          
wire             sq_pe_age_vec_zero_sync_fence;         
wire             sq_pe_age_vec_zero_wo_st;              
wire             sq_pe_sel_age_vec_surplus1_entry_vld;  
wire             sq_pe_sel_age_vec_zero_entry_vld;      
wire             sq_pfu_pop_synci_inst;                 
wire             sq_pop_clk;                            
wire             sq_pop_clk_en;                         
wire             sq_pop_dcache_1line_inst;              
wire             sq_pop_dcache_all_inst;                
wire             sq_pop_dcache_inst;                    
wire             sq_pop_merge_data_req_unmask;          
wire             sq_pop_req_unmask;                     
wire             sq_pop_st_and_atomic_inst;             
wire             sq_pop_st_inst;                        
wire             sq_pop_to_ce_req;                      
wire             sq_pop_to_ce_req_unmask;               
wire    [7  :0]  sq_settle_rot_sel;                     
wire             sq_st_dc_full;                         
wire             sq_st_dc_inst_hit;                     
wire             sq_wakeup_queue_clk;                   
wire             sq_wakeup_queue_clk_en;                
wire    [11 :0]  sq_wakeup_queue_grnt;                  
wire    [11 :0]  sq_wakeup_queue_next;                  
wire             sq_wmb_merge_req;                      
wire             sq_wmb_merge_stall_req;                
wire             sq_wmb_pop_to_ce_dp_req;               
wire             sq_wmb_pop_to_ce_gateclk_en;           
wire             sq_wmb_pop_to_ce_req;                  
wire             st_da_bkpta_data;                      
wire             st_da_bkptb_data;                      
wire    [6  :0]  st_da_iid;                             
wire             st_da_inst_vld;                        
wire             st_da_secd;                            
wire             st_da_sq_dcache_dirty;                 
wire             st_da_sq_dcache_share;                 
wire             st_da_sq_dcache_valid;                 
wire             st_da_sq_dcache_way;                   
wire             st_da_sq_ecc_stall;                    
wire             st_da_sq_no_restart;                   
wire             st_da_wb_expt_vld;                     
wire             st_da_wb_spec_fail;                    
wire             st_da_wb_vstart_vld;                   
wire    [39 :0]  st_dc_addr0;                           
wire             st_dc_atomic;                          
wire             st_dc_boundary;                        
wire             st_dc_boundary_first;                  
wire    [15 :0]  st_dc_bytes_vld;                       
wire             st_dc_cmit0_iid_crt_hit;               
wire             st_dc_cmit1_iid_crt_hit;               
wire             st_dc_cmit2_iid_crt_hit;               
wire             st_dc_da_page_buf;                     
wire             st_dc_da_page_ca;                      
wire             st_dc_da_page_sec;                     
wire             st_dc_da_page_share;                   
wire             st_dc_da_page_so;                      
wire             st_dc_da_page_wa;                      
wire    [3  :0]  st_dc_fence_mode;                      
wire             st_dc_icc;                             
wire    [6  :0]  st_dc_iid;                             
wire             st_dc_inst_flush;                      
wire    [1  :0]  st_dc_inst_mode;                       
wire    [2  :0]  st_dc_inst_size;                       
wire    [1  :0]  st_dc_inst_type;                       
wire             st_dc_old;                             
wire    [7  :0]  st_dc_rot_sel_rev;                     
wire    [3  :0]  st_dc_sdid;                            
wire             st_dc_sdid_hit;                        
wire             st_dc_secd;                            
wire             st_dc_sq_create_dp_vld;                
wire             st_dc_sq_create_gateclk_en;            
wire             st_dc_sq_create_vld;                   
wire             st_dc_sq_data_vld;                     
wire             st_dc_sync_fence;                      
wire             st_dc_wo_st_inst;                      
wire    [7  :0]  wb_dbg_r_id;                           
wire             wb_dbg_r_last;                         
wire             wb_dbg_r_req_ff;                       
wire    [3  :0]  wb_dbg_r_resp;                         
wire    [39 :0]  wmb_ce_addr;                           
wire             wmb_ce_bkpta_data;                     
wire             wmb_ce_bkptb_data;                     
wire             wmb_ce_create_hit_rb_idx;              
wire    [127:0]  wmb_ce_data128;                        
wire             wmb_ce_dcache_dirty;                   
wire             wmb_ce_dcache_hit_idx;                 
wire             wmb_ce_dcache_share;                   
wire             wmb_ce_dcache_sw_inst;                 
wire             wmb_ce_dcache_update_vld;              
wire             wmb_ce_dcache_valid;                   
wire             wmb_ce_dcache_way;                     
wire             wmb_ce_depd;                           
wire             wmb_ce_depd_set;                       
wire    [3  :0]  wmb_ce_fence_mode;                     
wire    [6  :0]  wmb_ce_iid;                            
wire             wmb_ce_spec_fail;                      
wire    [11 :0]  wmb_ce_sq_ptr;                         
wire             wmb_ce_update_dcache_dirty;            
wire             wmb_ce_update_dcache_share;            
wire             wmb_ce_update_dcache_valid;            
wire             wmb_ce_update_dcache_way;              
wire             wmb_ce_vld;                            
wire             wmb_ce_vstart_vld;                     
wire             wmb_sq_pop_grnt;                       
wire             wmb_sq_pop_to_ce_grnt;                 


parameter SQ_ENTRY    = 12,
          LSIQ_ENTRY  = 12;

parameter BYTE        = 2'b00,
          HALF        = 2'b01,
          WORD        = 2'b10,
          DWORD       = 2'b11;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//if sq has entry or create sq, then this gateclk is on
//sq_clk is only used for depd_ff now
assign sq_clk_en  = !sq_empty
                    ||  st_dc_sq_create_gateclk_en
                    ||  sq_pop_depd_ff;
// &Instance("gated_clk_cell", "x_lsu_sq_gated_clk"); @51
gated_clk_cell  x_lsu_sq_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sq_clk            ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sq_clk_en         ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @52
//          .external_en   (1'b0               ), @53
//          .global_en     (cp0_yy_clk_en      ), @54
//          .module_en     (cp0_lsu_icg_en     ), @55
//          .local_en      (sq_clk_en          ), @56
//          .clk_out       (sq_clk             )); @57

//create pop clk is used for age_vec
assign sq_create_pop_clk_en = st_dc_sq_create_gateclk_en  ||  sq_pop_req_unmask;
// &Instance("gated_clk_cell", "x_lsu_sq_create_pop_gated_clk"); @61
gated_clk_cell  x_lsu_sq_create_pop_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (sq_create_pop_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (sq_create_pop_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (forever_cpuclk     ), @62
//          .external_en   (1'b0               ), @63
//          .global_en     (cp0_yy_clk_en      ), @64
//          .module_en     (cp0_lsu_icg_en     ), @65
//          .local_en      (sq_create_pop_clk_en), @66
//          .clk_out       (sq_create_pop_clk  )); @67

//depd clk is used for wakeup queue
assign sq_wakeup_queue_clk_en = ld_da_sq_global_discard_vld
                                ||  sq_pop_depd_ff
                                ||  rtu_yy_xx_flush;
// &Instance("gated_clk_cell", "x_lsu_sq_wakeup_queue_gated_clk"); @73
gated_clk_cell  x_lsu_sq_wakeup_queue_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (sq_wakeup_queue_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (sq_wakeup_queue_clk_en),
  .module_en              (cp0_lsu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in        (forever_cpuclk     ), @74
//          .external_en   (1'b0               ), @75
//          .global_en     (cp0_yy_clk_en      ), @76
//          .module_en     (cp0_lsu_icg_en     ), @77
//          .local_en      (sq_wakeup_queue_clk_en), @78
//          .clk_out       (sq_wakeup_queue_clk)); @79

//sq fwd ld da pop entry
assign sq_fwd_data_pe_clk_en = sq_newest_fwd_req_data_vld_short;
// &Instance("gated_clk_cell", "x_lsu_sq_fwd_data_pe_gated_clk"); @83
gated_clk_cell  x_lsu_sq_fwd_data_pe_gated_clk (
  .clk_in                (forever_cpuclk       ),
  .clk_out               (sq_fwd_data_pe_clk   ),
  .external_en           (1'b0                 ),
  .global_en             (cp0_yy_clk_en        ),
  .local_en              (sq_fwd_data_pe_clk_en),
  .module_en             (cp0_lsu_icg_en       ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);

// &Connect(.clk_in        (forever_cpuclk     ), @84
//          .external_en   (1'b0               ), @85
//          .global_en     (cp0_yy_clk_en      ), @86
//          .module_en     (cp0_lsu_icg_en     ), @87
//          .local_en      (sq_fwd_data_pe_clk_en), @88
//          .clk_out       (sq_fwd_data_pe_clk)); @89

//pop entry signal
assign sq_pop_clk_en  = sq_pop_req_unmask
                        ||  sq_pe_sel_age_vec_zero_entry_vld;
// &Instance("gated_clk_cell", "x_lsu_sq_pop_gated_clk"); @94
gated_clk_cell  x_lsu_sq_pop_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sq_pop_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sq_pop_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @95
//          .external_en   (1'b0               ), @96
//          .global_en     (cp0_yy_clk_en      ), @97
//          .module_en     (cp0_lsu_icg_en     ), @98
//          .local_en      (sq_pop_clk_en      ), @99
//          .clk_out       (sq_pop_clk         )); @100

//to had signal
assign sq_dbg_clk_en  = had_lsu_dbg_en
                        &&  (sq_pop_req_unmask
                            ||  sq_dbg_st_req
                            ||  sq_dbg_st_req_ff);
// &Instance("gated_clk_cell", "x_lsu_sq_dbg_gated_clk"); @107
gated_clk_cell  x_lsu_sq_dbg_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sq_dbg_clk        ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sq_dbg_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @108
//          .external_en   (1'b0               ), @109
//          .global_en     (cp0_yy_clk_en      ), @110
//          .module_en     (cp0_lsu_icg_en     ), @111
//          .local_en      (sq_dbg_clk_en      ), @112
//          .clk_out       (sq_dbg_clk         )); @113


//==========================================================
//              Instance of store queue entry
//==========================================================
//------------------instance--------------------------------
//sq entry, that is 8
// &ConnRule(s/_x$/[0]/); @121
// &ConnRule(s/_v$/_0/); @122
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_0"); @123
ct_lsu_sq_entry  x_ct_lsu_sq_entry_0 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_0                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[0]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[0]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[0]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[0]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[0]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[0]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_0                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[0]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[0]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[0]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[0]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[0]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[0]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[0]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_0              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[0]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[0]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[0]             ),
  .sq_entry_data_v                           (sq_entry_data_0                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[0]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[0]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[0]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[0]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[0]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[0]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[0]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[0]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_0                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[0]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[0]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[0]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[0]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_0                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[0]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[0]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_0                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_0                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_0                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[0]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[0]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[0]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[0]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[0]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[0]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[0]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[0]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[0]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[0]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_0                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_0                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[0]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[0]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[0]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[0]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[0]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[0]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[0]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[0]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[0]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[0]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[1]/); @125
// &ConnRule(s/_v$/_1/); @126
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_1"); @127
ct_lsu_sq_entry  x_ct_lsu_sq_entry_1 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_1                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[1]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[1]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[1]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[1]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[1]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[1]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_1                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[1]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[1]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[1]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[1]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[1]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[1]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[1]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_1              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[1]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[1]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[1]             ),
  .sq_entry_data_v                           (sq_entry_data_1                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[1]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[1]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[1]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[1]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[1]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[1]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[1]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[1]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_1                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[1]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[1]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[1]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[1]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_1                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[1]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[1]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_1                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_1                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_1                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[1]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[1]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[1]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[1]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[1]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[1]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[1]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[1]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[1]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[1]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_1                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_1                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[1]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[1]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[1]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[1]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[1]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[1]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[1]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[1]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[1]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[1]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[2]/); @129
// &ConnRule(s/_v$/_2/); @130
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_2"); @131
ct_lsu_sq_entry  x_ct_lsu_sq_entry_2 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_2                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[2]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[2]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[2]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[2]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[2]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[2]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_2                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[2]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[2]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[2]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[2]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[2]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[2]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[2]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_2              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[2]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[2]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[2]             ),
  .sq_entry_data_v                           (sq_entry_data_2                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[2]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[2]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[2]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[2]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[2]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[2]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[2]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[2]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_2                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[2]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[2]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[2]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[2]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_2                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[2]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[2]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_2                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_2                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_2                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[2]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[2]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[2]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[2]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[2]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[2]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[2]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[2]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[2]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[2]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_2                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_2                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[2]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[2]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[2]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[2]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[2]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[2]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[2]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[2]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[2]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[2]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[3]/); @133
// &ConnRule(s/_v$/_3/); @134
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_3"); @135
ct_lsu_sq_entry  x_ct_lsu_sq_entry_3 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_3                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[3]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[3]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[3]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[3]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[3]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[3]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_3                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[3]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[3]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[3]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[3]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[3]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[3]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[3]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_3              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[3]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[3]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[3]             ),
  .sq_entry_data_v                           (sq_entry_data_3                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[3]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[3]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[3]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[3]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[3]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[3]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[3]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[3]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_3                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[3]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[3]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[3]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[3]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_3                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[3]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[3]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_3                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_3                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_3                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[3]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[3]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[3]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[3]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[3]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[3]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[3]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[3]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[3]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[3]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_3                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_3                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[3]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[3]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[3]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[3]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[3]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[3]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[3]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[3]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[3]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[3]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[4]/); @137
// &ConnRule(s/_v$/_4/); @138
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_4"); @139
ct_lsu_sq_entry  x_ct_lsu_sq_entry_4 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_4                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[4]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[4]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[4]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[4]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[4]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[4]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_4                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[4]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[4]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[4]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[4]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[4]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[4]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[4]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_4              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[4]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[4]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[4]             ),
  .sq_entry_data_v                           (sq_entry_data_4                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[4]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[4]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[4]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[4]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[4]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[4]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[4]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[4]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_4                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[4]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[4]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[4]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[4]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_4                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[4]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[4]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_4                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_4                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_4                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[4]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[4]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[4]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[4]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[4]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[4]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[4]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[4]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[4]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[4]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_4                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_4                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[4]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[4]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[4]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[4]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[4]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[4]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[4]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[4]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[4]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[4]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[5]/); @141
// &ConnRule(s/_v$/_5/); @142
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_5"); @143
ct_lsu_sq_entry  x_ct_lsu_sq_entry_5 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_5                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[5]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[5]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[5]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[5]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[5]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[5]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_5                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[5]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[5]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[5]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[5]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[5]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[5]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[5]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_5              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[5]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[5]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[5]             ),
  .sq_entry_data_v                           (sq_entry_data_5                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[5]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[5]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[5]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[5]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[5]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[5]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[5]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[5]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_5                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[5]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[5]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[5]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[5]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_5                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[5]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[5]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_5                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_5                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_5                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[5]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[5]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[5]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[5]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[5]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[5]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[5]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[5]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[5]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[5]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_5                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_5                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[5]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[5]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[5]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[5]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[5]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[5]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[5]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[5]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[5]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[5]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[6]/); @145
// &ConnRule(s/_v$/_6/); @146
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_6"); @147
ct_lsu_sq_entry  x_ct_lsu_sq_entry_6 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_6                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[6]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[6]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[6]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[6]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[6]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[6]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_6                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[6]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[6]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[6]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[6]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[6]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[6]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[6]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_6              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[6]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[6]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[6]             ),
  .sq_entry_data_v                           (sq_entry_data_6                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[6]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[6]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[6]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[6]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[6]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[6]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[6]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[6]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_6                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[6]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[6]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[6]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[6]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_6                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[6]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[6]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_6                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_6                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_6                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[6]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[6]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[6]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[6]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[6]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[6]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[6]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[6]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[6]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[6]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_6                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_6                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[6]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[6]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[6]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[6]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[6]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[6]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[6]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[6]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[6]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[6]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[7]/); @149
// &ConnRule(s/_v$/_7/); @150
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_7"); @151
ct_lsu_sq_entry  x_ct_lsu_sq_entry_7 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_7                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[7]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[7]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[7]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[7]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[7]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[7]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_7                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[7]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[7]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[7]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[7]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[7]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[7]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[7]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_7              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[7]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[7]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[7]             ),
  .sq_entry_data_v                           (sq_entry_data_7                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[7]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[7]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[7]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[7]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[7]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[7]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[7]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[7]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_7                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[7]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[7]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[7]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[7]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_7                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[7]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[7]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_7                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_7                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_7                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[7]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[7]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[7]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[7]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[7]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[7]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[7]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[7]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[7]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[7]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_7                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_7                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[7]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[7]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[7]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[7]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[7]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[7]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[7]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[7]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[7]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[7]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[8]/); @153
// &ConnRule(s/_v$/_8/); @154
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_8"); @155
ct_lsu_sq_entry  x_ct_lsu_sq_entry_8 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_8                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[8]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[8]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[8]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[8]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[8]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[8]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_8                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[8]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[8]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[8]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[8]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[8]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[8]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[8]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_8              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[8]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[8]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[8]             ),
  .sq_entry_data_v                           (sq_entry_data_8                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[8]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[8]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[8]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[8]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[8]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[8]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[8]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[8]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_8                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[8]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[8]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[8]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[8]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_8                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[8]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[8]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_8                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_8                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_8                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[8]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[8]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[8]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[8]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[8]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[8]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[8]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[8]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[8]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[8]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_8                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_8                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[8]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[8]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[8]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[8]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[8]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[8]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[8]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[8]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[8]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[8]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[9]/); @157
// &ConnRule(s/_v$/_9/); @158
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_9"); @159
ct_lsu_sq_entry  x_ct_lsu_sq_entry_9 (
  .cp0_lsu_icg_en                            (cp0_lsu_icg_en                           ),
  .cp0_yy_clk_en                             (cp0_yy_clk_en                            ),
  .cp0_yy_priv_mode                          (cp0_yy_priv_mode                         ),
  .cpurst_b                                  (cpurst_b                                 ),
  .dcache_dirty_din                          (dcache_dirty_din                         ),
  .dcache_dirty_gwen                         (dcache_dirty_gwen                        ),
  .dcache_dirty_wen                          (dcache_dirty_wen                         ),
  .dcache_idx                                (dcache_idx                               ),
  .dcache_tag_din                            (dcache_tag_din                           ),
  .dcache_tag_gwen                           (dcache_tag_gwen                          ),
  .dcache_tag_wen                            (dcache_tag_wen                           ),
  .forever_cpuclk                            (forever_cpuclk                           ),
  .ld_da_lsid                                (ld_da_lsid                               ),
  .ld_dc_addr0                               (ld_dc_addr0                              ),
  .ld_dc_addr1_11to4                         (ld_dc_addr1_11to4                        ),
  .ld_dc_bytes_vld                           (ld_dc_bytes_vld                          ),
  .ld_dc_bytes_vld1                          (ld_dc_bytes_vld1                         ),
  .ld_dc_chk_atomic_inst_vld                 (ld_dc_chk_atomic_inst_vld                ),
  .ld_dc_chk_ld_addr1_vld                    (ld_dc_chk_ld_addr1_vld                   ),
  .ld_dc_chk_ld_bypass_vld                   (ld_dc_chk_ld_bypass_vld                  ),
  .ld_dc_chk_ld_inst_vld                     (ld_dc_chk_ld_inst_vld                    ),
  .ld_dc_iid                                 (ld_dc_iid                                ),
  .pad_yy_icg_scan_en                        (pad_yy_icg_scan_en                       ),
  .rtu_lsu_async_flush                       (rtu_lsu_async_flush                      ),
  .rtu_lsu_commit0_iid_updt_val              (rtu_lsu_commit0_iid_updt_val             ),
  .rtu_lsu_commit1_iid_updt_val              (rtu_lsu_commit1_iid_updt_val             ),
  .rtu_lsu_commit2_iid_updt_val              (rtu_lsu_commit2_iid_updt_val             ),
  .rtu_yy_xx_commit0                         (rtu_yy_xx_commit0                        ),
  .rtu_yy_xx_commit1                         (rtu_yy_xx_commit1                        ),
  .rtu_yy_xx_commit2                         (rtu_yy_xx_commit2                        ),
  .rtu_yy_xx_flush                           (rtu_yy_xx_flush                          ),
  .sd_ex1_inst_vld                           (sd_ex1_inst_vld                          ),
  .sd_rf_ex1_sdid                            (sd_rf_ex1_sdid                           ),
  .sd_rf_inst_vld_short                      (sd_rf_inst_vld_short                     ),
  .sq_age_vec_set                            (sq_age_vec_set                           ),
  .sq_create_age_vec                         (sq_create_age_vec                        ),
  .sq_create_pop_clk                         (sq_create_pop_clk                        ),
  .sq_create_same_addr_newest                (sq_create_same_addr_newest               ),
  .sq_create_success                         (sq_create_success                        ),
  .sq_create_vld                             (sq_create_vld                            ),
  .sq_data_settle                            (sq_data_settle                           ),
  .sq_entry_addr0_v                          (sq_entry_addr0_9                         ),
  .sq_entry_addr1_dep_discard_x              (sq_entry_addr1_dep_discard[9]            ),
  .sq_entry_age_vec_surplus1_ptr_x           (sq_entry_age_vec_surplus1_ptr[9]         ),
  .sq_entry_age_vec_zero_ptr_x               (sq_entry_age_vec_zero_ptr[9]             ),
  .sq_entry_atomic_x                         (sq_entry_atomic[9]                       ),
  .sq_entry_bkpta_data_x                     (sq_entry_bkpta_data[9]                   ),
  .sq_entry_bkptb_data_x                     (sq_entry_bkptb_data[9]                   ),
  .sq_entry_bytes_vld_v                      (sq_entry_bytes_vld_9                     ),
  .sq_entry_cancel_acc_req_x                 (sq_entry_cancel_acc_req[9]               ),
  .sq_entry_cancel_ahead_wb_x                (sq_entry_cancel_ahead_wb[9]              ),
  .sq_entry_cmit_data_vld_x                  (sq_entry_cmit_data_vld[9]                ),
  .sq_entry_cmit_x                           (sq_entry_cmit[9]                         ),
  .sq_entry_create_dp_vld_x                  (sq_entry_create_dp_vld[9]                ),
  .sq_entry_create_gateclk_en_x              (sq_entry_create_gateclk_en[9]            ),
  .sq_entry_create_vld_x                     (sq_entry_create_vld[9]                   ),
  .sq_entry_data_depd_wakeup_v               (sq_entry_data_depd_wakeup_9              ),
  .sq_entry_data_discard_grnt_x              (sq_entry_data_discard_grnt[9]            ),
  .sq_entry_data_discard_req_short_x         (sq_entry_data_discard_req_short[9]       ),
  .sq_entry_data_discard_req_x               (sq_entry_data_discard_req[9]             ),
  .sq_entry_data_v                           (sq_entry_data_9                          ),
  .sq_entry_dcache_dirty_x                   (sq_entry_dcache_dirty[9]                 ),
  .sq_entry_dcache_info_vld_x                (sq_entry_dcache_info_vld[9]              ),
  .sq_entry_dcache_share_x                   (sq_entry_dcache_share[9]                 ),
  .sq_entry_dcache_valid_x                   (sq_entry_dcache_valid[9]                 ),
  .sq_entry_dcache_way_x                     (sq_entry_dcache_way[9]                   ),
  .sq_entry_depd_set_x                       (sq_entry_depd_set[9]                     ),
  .sq_entry_depd_x                           (sq_entry_depd[9]                         ),
  .sq_entry_discard_req_x                    (sq_entry_discard_req[9]                  ),
  .sq_entry_fence_mode_v                     (sq_entry_fence_mode_9                    ),
  .sq_entry_fwd_bypass_req_x                 (sq_entry_fwd_bypass_req[9]               ),
  .sq_entry_fwd_multi_depd_set_x             (sq_entry_fwd_multi_depd_set[9]           ),
  .sq_entry_fwd_req_x                        (sq_entry_fwd_req[9]                      ),
  .sq_entry_icc_x                            (sq_entry_icc[9]                          ),
  .sq_entry_iid_v                            (sq_entry_iid_9                           ),
  .sq_entry_inst_flush_x                     (sq_entry_inst_flush[9]                   ),
  .sq_entry_inst_hit_x                       (sq_entry_inst_hit[9]                     ),
  .sq_entry_inst_mode_v                      (sq_entry_inst_mode_9                     ),
  .sq_entry_inst_size_v                      (sq_entry_inst_size_9                     ),
  .sq_entry_inst_type_v                      (sq_entry_inst_type_9                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x  (sq_entry_newest_fwd_req_data_vld_short[9]),
  .sq_entry_newest_fwd_req_data_vld_x        (sq_entry_newest_fwd_req_data_vld[9]      ),
  .sq_entry_page_buf_x                       (sq_entry_page_buf[9]                     ),
  .sq_entry_page_ca_x                        (sq_entry_page_ca[9]                      ),
  .sq_entry_page_sec_x                       (sq_entry_page_sec[9]                     ),
  .sq_entry_page_share_x                     (sq_entry_page_share[9]                   ),
  .sq_entry_page_so_x                        (sq_entry_page_so[9]                      ),
  .sq_entry_page_wa_x                        (sq_entry_page_wa[9]                      ),
  .sq_entry_pop_req_x                        (sq_entry_pop_req[9]                      ),
  .sq_entry_pop_to_ce_grnt_b                 (sq_entry_pop_to_ce_grnt_b                ),
  .sq_entry_pop_to_ce_grnt_x                 (sq_entry_pop_to_ce_grnt[9]               ),
  .sq_entry_priv_mode_v                      (sq_entry_priv_mode_9                     ),
  .sq_entry_rot_sel_v                        (sq_entry_rot_sel_9                       ),
  .sq_entry_same_addr_newest_x               (sq_entry_same_addr_newest[9]             ),
  .sq_entry_settle_data_hit_x                (sq_entry_settle_data_hit[9]              ),
  .sq_entry_spec_fail_x                      (sq_entry_spec_fail[9]                    ),
  .sq_entry_st_dc_create_age_vec_x           (sq_entry_st_dc_create_age_vec[9]         ),
  .sq_entry_st_dc_same_addr_newer_x          (sq_entry_st_dc_same_addr_newer[9]        ),
  .sq_entry_sync_fence_x                     (sq_entry_sync_fence[9]                   ),
  .sq_entry_vld_x                            (sq_entry_vld[9]                          ),
  .sq_entry_vstart_vld_x                     (sq_entry_vstart_vld[9]                   ),
  .sq_entry_wo_st_x                          (sq_entry_wo_st[9]                        ),
  .sq_pop_ptr_x                              (sq_pop_ptr[9]                            ),
  .st_da_bkpta_data                          (st_da_bkpta_data                         ),
  .st_da_bkptb_data                          (st_da_bkptb_data                         ),
  .st_da_iid                                 (st_da_iid                                ),
  .st_da_inst_vld                            (st_da_inst_vld                           ),
  .st_da_secd                                (st_da_secd                               ),
  .st_da_sq_dcache_dirty                     (st_da_sq_dcache_dirty                    ),
  .st_da_sq_dcache_share                     (st_da_sq_dcache_share                    ),
  .st_da_sq_dcache_valid                     (st_da_sq_dcache_valid                    ),
  .st_da_sq_dcache_way                       (st_da_sq_dcache_way                      ),
  .st_da_sq_ecc_stall                        (st_da_sq_ecc_stall                       ),
  .st_da_sq_no_restart                       (st_da_sq_no_restart                      ),
  .st_da_wb_expt_vld                         (st_da_wb_expt_vld                        ),
  .st_da_wb_spec_fail                        (st_da_wb_spec_fail                       ),
  .st_da_wb_vstart_vld                       (st_da_wb_vstart_vld                      ),
  .st_dc_addr0                               (st_dc_addr0                              ),
  .st_dc_atomic                              (st_dc_atomic                             ),
  .st_dc_boundary                            (st_dc_boundary                           ),
  .st_dc_boundary_first                      (st_dc_boundary_first                     ),
  .st_dc_bytes_vld                           (st_dc_bytes_vld                          ),
  .st_dc_cmit0_iid_crt_hit                   (st_dc_cmit0_iid_crt_hit                  ),
  .st_dc_cmit1_iid_crt_hit                   (st_dc_cmit1_iid_crt_hit                  ),
  .st_dc_cmit2_iid_crt_hit                   (st_dc_cmit2_iid_crt_hit                  ),
  .st_dc_da_page_buf                         (st_dc_da_page_buf                        ),
  .st_dc_da_page_ca                          (st_dc_da_page_ca                         ),
  .st_dc_da_page_sec                         (st_dc_da_page_sec                        ),
  .st_dc_da_page_share                       (st_dc_da_page_share                      ),
  .st_dc_da_page_so                          (st_dc_da_page_so                         ),
  .st_dc_da_page_wa                          (st_dc_da_page_wa                         ),
  .st_dc_fence_mode                          (st_dc_fence_mode                         ),
  .st_dc_icc                                 (st_dc_icc                                ),
  .st_dc_iid                                 (st_dc_iid                                ),
  .st_dc_inst_flush                          (st_dc_inst_flush                         ),
  .st_dc_inst_mode                           (st_dc_inst_mode                          ),
  .st_dc_inst_size                           (st_dc_inst_size                          ),
  .st_dc_inst_type                           (st_dc_inst_type                          ),
  .st_dc_rot_sel_rev                         (st_dc_rot_sel_rev                        ),
  .st_dc_sdid                                (st_dc_sdid                               ),
  .st_dc_sdid_hit                            (st_dc_sdid_hit                           ),
  .st_dc_secd                                (st_dc_secd                               ),
  .st_dc_sq_data_vld                         (st_dc_sq_data_vld                        ),
  .st_dc_sync_fence                          (st_dc_sync_fence                         ),
  .st_dc_wo_st_inst                          (st_dc_wo_st_inst                         ),
  .wmb_sq_pop_grnt                           (wmb_sq_pop_grnt                          )
);


// &ConnRule(s/_x$/[10]/); @161
// &ConnRule(s/_v$/_10/); @162
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_10"); @163
ct_lsu_sq_entry  x_ct_lsu_sq_entry_10 (
  .cp0_lsu_icg_en                             (cp0_lsu_icg_en                            ),
  .cp0_yy_clk_en                              (cp0_yy_clk_en                             ),
  .cp0_yy_priv_mode                           (cp0_yy_priv_mode                          ),
  .cpurst_b                                   (cpurst_b                                  ),
  .dcache_dirty_din                           (dcache_dirty_din                          ),
  .dcache_dirty_gwen                          (dcache_dirty_gwen                         ),
  .dcache_dirty_wen                           (dcache_dirty_wen                          ),
  .dcache_idx                                 (dcache_idx                                ),
  .dcache_tag_din                             (dcache_tag_din                            ),
  .dcache_tag_gwen                            (dcache_tag_gwen                           ),
  .dcache_tag_wen                             (dcache_tag_wen                            ),
  .forever_cpuclk                             (forever_cpuclk                            ),
  .ld_da_lsid                                 (ld_da_lsid                                ),
  .ld_dc_addr0                                (ld_dc_addr0                               ),
  .ld_dc_addr1_11to4                          (ld_dc_addr1_11to4                         ),
  .ld_dc_bytes_vld                            (ld_dc_bytes_vld                           ),
  .ld_dc_bytes_vld1                           (ld_dc_bytes_vld1                          ),
  .ld_dc_chk_atomic_inst_vld                  (ld_dc_chk_atomic_inst_vld                 ),
  .ld_dc_chk_ld_addr1_vld                     (ld_dc_chk_ld_addr1_vld                    ),
  .ld_dc_chk_ld_bypass_vld                    (ld_dc_chk_ld_bypass_vld                   ),
  .ld_dc_chk_ld_inst_vld                      (ld_dc_chk_ld_inst_vld                     ),
  .ld_dc_iid                                  (ld_dc_iid                                 ),
  .pad_yy_icg_scan_en                         (pad_yy_icg_scan_en                        ),
  .rtu_lsu_async_flush                        (rtu_lsu_async_flush                       ),
  .rtu_lsu_commit0_iid_updt_val               (rtu_lsu_commit0_iid_updt_val              ),
  .rtu_lsu_commit1_iid_updt_val               (rtu_lsu_commit1_iid_updt_val              ),
  .rtu_lsu_commit2_iid_updt_val               (rtu_lsu_commit2_iid_updt_val              ),
  .rtu_yy_xx_commit0                          (rtu_yy_xx_commit0                         ),
  .rtu_yy_xx_commit1                          (rtu_yy_xx_commit1                         ),
  .rtu_yy_xx_commit2                          (rtu_yy_xx_commit2                         ),
  .rtu_yy_xx_flush                            (rtu_yy_xx_flush                           ),
  .sd_ex1_inst_vld                            (sd_ex1_inst_vld                           ),
  .sd_rf_ex1_sdid                             (sd_rf_ex1_sdid                            ),
  .sd_rf_inst_vld_short                       (sd_rf_inst_vld_short                      ),
  .sq_age_vec_set                             (sq_age_vec_set                            ),
  .sq_create_age_vec                          (sq_create_age_vec                         ),
  .sq_create_pop_clk                          (sq_create_pop_clk                         ),
  .sq_create_same_addr_newest                 (sq_create_same_addr_newest                ),
  .sq_create_success                          (sq_create_success                         ),
  .sq_create_vld                              (sq_create_vld                             ),
  .sq_data_settle                             (sq_data_settle                            ),
  .sq_entry_addr0_v                           (sq_entry_addr0_10                         ),
  .sq_entry_addr1_dep_discard_x               (sq_entry_addr1_dep_discard[10]            ),
  .sq_entry_age_vec_surplus1_ptr_x            (sq_entry_age_vec_surplus1_ptr[10]         ),
  .sq_entry_age_vec_zero_ptr_x                (sq_entry_age_vec_zero_ptr[10]             ),
  .sq_entry_atomic_x                          (sq_entry_atomic[10]                       ),
  .sq_entry_bkpta_data_x                      (sq_entry_bkpta_data[10]                   ),
  .sq_entry_bkptb_data_x                      (sq_entry_bkptb_data[10]                   ),
  .sq_entry_bytes_vld_v                       (sq_entry_bytes_vld_10                     ),
  .sq_entry_cancel_acc_req_x                  (sq_entry_cancel_acc_req[10]               ),
  .sq_entry_cancel_ahead_wb_x                 (sq_entry_cancel_ahead_wb[10]              ),
  .sq_entry_cmit_data_vld_x                   (sq_entry_cmit_data_vld[10]                ),
  .sq_entry_cmit_x                            (sq_entry_cmit[10]                         ),
  .sq_entry_create_dp_vld_x                   (sq_entry_create_dp_vld[10]                ),
  .sq_entry_create_gateclk_en_x               (sq_entry_create_gateclk_en[10]            ),
  .sq_entry_create_vld_x                      (sq_entry_create_vld[10]                   ),
  .sq_entry_data_depd_wakeup_v                (sq_entry_data_depd_wakeup_10              ),
  .sq_entry_data_discard_grnt_x               (sq_entry_data_discard_grnt[10]            ),
  .sq_entry_data_discard_req_short_x          (sq_entry_data_discard_req_short[10]       ),
  .sq_entry_data_discard_req_x                (sq_entry_data_discard_req[10]             ),
  .sq_entry_data_v                            (sq_entry_data_10                          ),
  .sq_entry_dcache_dirty_x                    (sq_entry_dcache_dirty[10]                 ),
  .sq_entry_dcache_info_vld_x                 (sq_entry_dcache_info_vld[10]              ),
  .sq_entry_dcache_share_x                    (sq_entry_dcache_share[10]                 ),
  .sq_entry_dcache_valid_x                    (sq_entry_dcache_valid[10]                 ),
  .sq_entry_dcache_way_x                      (sq_entry_dcache_way[10]                   ),
  .sq_entry_depd_set_x                        (sq_entry_depd_set[10]                     ),
  .sq_entry_depd_x                            (sq_entry_depd[10]                         ),
  .sq_entry_discard_req_x                     (sq_entry_discard_req[10]                  ),
  .sq_entry_fence_mode_v                      (sq_entry_fence_mode_10                    ),
  .sq_entry_fwd_bypass_req_x                  (sq_entry_fwd_bypass_req[10]               ),
  .sq_entry_fwd_multi_depd_set_x              (sq_entry_fwd_multi_depd_set[10]           ),
  .sq_entry_fwd_req_x                         (sq_entry_fwd_req[10]                      ),
  .sq_entry_icc_x                             (sq_entry_icc[10]                          ),
  .sq_entry_iid_v                             (sq_entry_iid_10                           ),
  .sq_entry_inst_flush_x                      (sq_entry_inst_flush[10]                   ),
  .sq_entry_inst_hit_x                        (sq_entry_inst_hit[10]                     ),
  .sq_entry_inst_mode_v                       (sq_entry_inst_mode_10                     ),
  .sq_entry_inst_size_v                       (sq_entry_inst_size_10                     ),
  .sq_entry_inst_type_v                       (sq_entry_inst_type_10                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x   (sq_entry_newest_fwd_req_data_vld_short[10]),
  .sq_entry_newest_fwd_req_data_vld_x         (sq_entry_newest_fwd_req_data_vld[10]      ),
  .sq_entry_page_buf_x                        (sq_entry_page_buf[10]                     ),
  .sq_entry_page_ca_x                         (sq_entry_page_ca[10]                      ),
  .sq_entry_page_sec_x                        (sq_entry_page_sec[10]                     ),
  .sq_entry_page_share_x                      (sq_entry_page_share[10]                   ),
  .sq_entry_page_so_x                         (sq_entry_page_so[10]                      ),
  .sq_entry_page_wa_x                         (sq_entry_page_wa[10]                      ),
  .sq_entry_pop_req_x                         (sq_entry_pop_req[10]                      ),
  .sq_entry_pop_to_ce_grnt_b                  (sq_entry_pop_to_ce_grnt_b                 ),
  .sq_entry_pop_to_ce_grnt_x                  (sq_entry_pop_to_ce_grnt[10]               ),
  .sq_entry_priv_mode_v                       (sq_entry_priv_mode_10                     ),
  .sq_entry_rot_sel_v                         (sq_entry_rot_sel_10                       ),
  .sq_entry_same_addr_newest_x                (sq_entry_same_addr_newest[10]             ),
  .sq_entry_settle_data_hit_x                 (sq_entry_settle_data_hit[10]              ),
  .sq_entry_spec_fail_x                       (sq_entry_spec_fail[10]                    ),
  .sq_entry_st_dc_create_age_vec_x            (sq_entry_st_dc_create_age_vec[10]         ),
  .sq_entry_st_dc_same_addr_newer_x           (sq_entry_st_dc_same_addr_newer[10]        ),
  .sq_entry_sync_fence_x                      (sq_entry_sync_fence[10]                   ),
  .sq_entry_vld_x                             (sq_entry_vld[10]                          ),
  .sq_entry_vstart_vld_x                      (sq_entry_vstart_vld[10]                   ),
  .sq_entry_wo_st_x                           (sq_entry_wo_st[10]                        ),
  .sq_pop_ptr_x                               (sq_pop_ptr[10]                            ),
  .st_da_bkpta_data                           (st_da_bkpta_data                          ),
  .st_da_bkptb_data                           (st_da_bkptb_data                          ),
  .st_da_iid                                  (st_da_iid                                 ),
  .st_da_inst_vld                             (st_da_inst_vld                            ),
  .st_da_secd                                 (st_da_secd                                ),
  .st_da_sq_dcache_dirty                      (st_da_sq_dcache_dirty                     ),
  .st_da_sq_dcache_share                      (st_da_sq_dcache_share                     ),
  .st_da_sq_dcache_valid                      (st_da_sq_dcache_valid                     ),
  .st_da_sq_dcache_way                        (st_da_sq_dcache_way                       ),
  .st_da_sq_ecc_stall                         (st_da_sq_ecc_stall                        ),
  .st_da_sq_no_restart                        (st_da_sq_no_restart                       ),
  .st_da_wb_expt_vld                          (st_da_wb_expt_vld                         ),
  .st_da_wb_spec_fail                         (st_da_wb_spec_fail                        ),
  .st_da_wb_vstart_vld                        (st_da_wb_vstart_vld                       ),
  .st_dc_addr0                                (st_dc_addr0                               ),
  .st_dc_atomic                               (st_dc_atomic                              ),
  .st_dc_boundary                             (st_dc_boundary                            ),
  .st_dc_boundary_first                       (st_dc_boundary_first                      ),
  .st_dc_bytes_vld                            (st_dc_bytes_vld                           ),
  .st_dc_cmit0_iid_crt_hit                    (st_dc_cmit0_iid_crt_hit                   ),
  .st_dc_cmit1_iid_crt_hit                    (st_dc_cmit1_iid_crt_hit                   ),
  .st_dc_cmit2_iid_crt_hit                    (st_dc_cmit2_iid_crt_hit                   ),
  .st_dc_da_page_buf                          (st_dc_da_page_buf                         ),
  .st_dc_da_page_ca                           (st_dc_da_page_ca                          ),
  .st_dc_da_page_sec                          (st_dc_da_page_sec                         ),
  .st_dc_da_page_share                        (st_dc_da_page_share                       ),
  .st_dc_da_page_so                           (st_dc_da_page_so                          ),
  .st_dc_da_page_wa                           (st_dc_da_page_wa                          ),
  .st_dc_fence_mode                           (st_dc_fence_mode                          ),
  .st_dc_icc                                  (st_dc_icc                                 ),
  .st_dc_iid                                  (st_dc_iid                                 ),
  .st_dc_inst_flush                           (st_dc_inst_flush                          ),
  .st_dc_inst_mode                            (st_dc_inst_mode                           ),
  .st_dc_inst_size                            (st_dc_inst_size                           ),
  .st_dc_inst_type                            (st_dc_inst_type                           ),
  .st_dc_rot_sel_rev                          (st_dc_rot_sel_rev                         ),
  .st_dc_sdid                                 (st_dc_sdid                                ),
  .st_dc_sdid_hit                             (st_dc_sdid_hit                            ),
  .st_dc_secd                                 (st_dc_secd                                ),
  .st_dc_sq_data_vld                          (st_dc_sq_data_vld                         ),
  .st_dc_sync_fence                           (st_dc_sync_fence                          ),
  .st_dc_wo_st_inst                           (st_dc_wo_st_inst                          ),
  .wmb_sq_pop_grnt                            (wmb_sq_pop_grnt                           )
);


// &ConnRule(s/_x$/[11]/); @165
// &ConnRule(s/_v$/_11/); @166
// &Instance("ct_lsu_sq_entry","x_ct_lsu_sq_entry_11"); @167
ct_lsu_sq_entry  x_ct_lsu_sq_entry_11 (
  .cp0_lsu_icg_en                             (cp0_lsu_icg_en                            ),
  .cp0_yy_clk_en                              (cp0_yy_clk_en                             ),
  .cp0_yy_priv_mode                           (cp0_yy_priv_mode                          ),
  .cpurst_b                                   (cpurst_b                                  ),
  .dcache_dirty_din                           (dcache_dirty_din                          ),
  .dcache_dirty_gwen                          (dcache_dirty_gwen                         ),
  .dcache_dirty_wen                           (dcache_dirty_wen                          ),
  .dcache_idx                                 (dcache_idx                                ),
  .dcache_tag_din                             (dcache_tag_din                            ),
  .dcache_tag_gwen                            (dcache_tag_gwen                           ),
  .dcache_tag_wen                             (dcache_tag_wen                            ),
  .forever_cpuclk                             (forever_cpuclk                            ),
  .ld_da_lsid                                 (ld_da_lsid                                ),
  .ld_dc_addr0                                (ld_dc_addr0                               ),
  .ld_dc_addr1_11to4                          (ld_dc_addr1_11to4                         ),
  .ld_dc_bytes_vld                            (ld_dc_bytes_vld                           ),
  .ld_dc_bytes_vld1                           (ld_dc_bytes_vld1                          ),
  .ld_dc_chk_atomic_inst_vld                  (ld_dc_chk_atomic_inst_vld                 ),
  .ld_dc_chk_ld_addr1_vld                     (ld_dc_chk_ld_addr1_vld                    ),
  .ld_dc_chk_ld_bypass_vld                    (ld_dc_chk_ld_bypass_vld                   ),
  .ld_dc_chk_ld_inst_vld                      (ld_dc_chk_ld_inst_vld                     ),
  .ld_dc_iid                                  (ld_dc_iid                                 ),
  .pad_yy_icg_scan_en                         (pad_yy_icg_scan_en                        ),
  .rtu_lsu_async_flush                        (rtu_lsu_async_flush                       ),
  .rtu_lsu_commit0_iid_updt_val               (rtu_lsu_commit0_iid_updt_val              ),
  .rtu_lsu_commit1_iid_updt_val               (rtu_lsu_commit1_iid_updt_val              ),
  .rtu_lsu_commit2_iid_updt_val               (rtu_lsu_commit2_iid_updt_val              ),
  .rtu_yy_xx_commit0                          (rtu_yy_xx_commit0                         ),
  .rtu_yy_xx_commit1                          (rtu_yy_xx_commit1                         ),
  .rtu_yy_xx_commit2                          (rtu_yy_xx_commit2                         ),
  .rtu_yy_xx_flush                            (rtu_yy_xx_flush                           ),
  .sd_ex1_inst_vld                            (sd_ex1_inst_vld                           ),
  .sd_rf_ex1_sdid                             (sd_rf_ex1_sdid                            ),
  .sd_rf_inst_vld_short                       (sd_rf_inst_vld_short                      ),
  .sq_age_vec_set                             (sq_age_vec_set                            ),
  .sq_create_age_vec                          (sq_create_age_vec                         ),
  .sq_create_pop_clk                          (sq_create_pop_clk                         ),
  .sq_create_same_addr_newest                 (sq_create_same_addr_newest                ),
  .sq_create_success                          (sq_create_success                         ),
  .sq_create_vld                              (sq_create_vld                             ),
  .sq_data_settle                             (sq_data_settle                            ),
  .sq_entry_addr0_v                           (sq_entry_addr0_11                         ),
  .sq_entry_addr1_dep_discard_x               (sq_entry_addr1_dep_discard[11]            ),
  .sq_entry_age_vec_surplus1_ptr_x            (sq_entry_age_vec_surplus1_ptr[11]         ),
  .sq_entry_age_vec_zero_ptr_x                (sq_entry_age_vec_zero_ptr[11]             ),
  .sq_entry_atomic_x                          (sq_entry_atomic[11]                       ),
  .sq_entry_bkpta_data_x                      (sq_entry_bkpta_data[11]                   ),
  .sq_entry_bkptb_data_x                      (sq_entry_bkptb_data[11]                   ),
  .sq_entry_bytes_vld_v                       (sq_entry_bytes_vld_11                     ),
  .sq_entry_cancel_acc_req_x                  (sq_entry_cancel_acc_req[11]               ),
  .sq_entry_cancel_ahead_wb_x                 (sq_entry_cancel_ahead_wb[11]              ),
  .sq_entry_cmit_data_vld_x                   (sq_entry_cmit_data_vld[11]                ),
  .sq_entry_cmit_x                            (sq_entry_cmit[11]                         ),
  .sq_entry_create_dp_vld_x                   (sq_entry_create_dp_vld[11]                ),
  .sq_entry_create_gateclk_en_x               (sq_entry_create_gateclk_en[11]            ),
  .sq_entry_create_vld_x                      (sq_entry_create_vld[11]                   ),
  .sq_entry_data_depd_wakeup_v                (sq_entry_data_depd_wakeup_11              ),
  .sq_entry_data_discard_grnt_x               (sq_entry_data_discard_grnt[11]            ),
  .sq_entry_data_discard_req_short_x          (sq_entry_data_discard_req_short[11]       ),
  .sq_entry_data_discard_req_x                (sq_entry_data_discard_req[11]             ),
  .sq_entry_data_v                            (sq_entry_data_11                          ),
  .sq_entry_dcache_dirty_x                    (sq_entry_dcache_dirty[11]                 ),
  .sq_entry_dcache_info_vld_x                 (sq_entry_dcache_info_vld[11]              ),
  .sq_entry_dcache_share_x                    (sq_entry_dcache_share[11]                 ),
  .sq_entry_dcache_valid_x                    (sq_entry_dcache_valid[11]                 ),
  .sq_entry_dcache_way_x                      (sq_entry_dcache_way[11]                   ),
  .sq_entry_depd_set_x                        (sq_entry_depd_set[11]                     ),
  .sq_entry_depd_x                            (sq_entry_depd[11]                         ),
  .sq_entry_discard_req_x                     (sq_entry_discard_req[11]                  ),
  .sq_entry_fence_mode_v                      (sq_entry_fence_mode_11                    ),
  .sq_entry_fwd_bypass_req_x                  (sq_entry_fwd_bypass_req[11]               ),
  .sq_entry_fwd_multi_depd_set_x              (sq_entry_fwd_multi_depd_set[11]           ),
  .sq_entry_fwd_req_x                         (sq_entry_fwd_req[11]                      ),
  .sq_entry_icc_x                             (sq_entry_icc[11]                          ),
  .sq_entry_iid_v                             (sq_entry_iid_11                           ),
  .sq_entry_inst_flush_x                      (sq_entry_inst_flush[11]                   ),
  .sq_entry_inst_hit_x                        (sq_entry_inst_hit[11]                     ),
  .sq_entry_inst_mode_v                       (sq_entry_inst_mode_11                     ),
  .sq_entry_inst_size_v                       (sq_entry_inst_size_11                     ),
  .sq_entry_inst_type_v                       (sq_entry_inst_type_11                     ),
  .sq_entry_newest_fwd_req_data_vld_short_x   (sq_entry_newest_fwd_req_data_vld_short[11]),
  .sq_entry_newest_fwd_req_data_vld_x         (sq_entry_newest_fwd_req_data_vld[11]      ),
  .sq_entry_page_buf_x                        (sq_entry_page_buf[11]                     ),
  .sq_entry_page_ca_x                         (sq_entry_page_ca[11]                      ),
  .sq_entry_page_sec_x                        (sq_entry_page_sec[11]                     ),
  .sq_entry_page_share_x                      (sq_entry_page_share[11]                   ),
  .sq_entry_page_so_x                         (sq_entry_page_so[11]                      ),
  .sq_entry_page_wa_x                         (sq_entry_page_wa[11]                      ),
  .sq_entry_pop_req_x                         (sq_entry_pop_req[11]                      ),
  .sq_entry_pop_to_ce_grnt_b                  (sq_entry_pop_to_ce_grnt_b                 ),
  .sq_entry_pop_to_ce_grnt_x                  (sq_entry_pop_to_ce_grnt[11]               ),
  .sq_entry_priv_mode_v                       (sq_entry_priv_mode_11                     ),
  .sq_entry_rot_sel_v                         (sq_entry_rot_sel_11                       ),
  .sq_entry_same_addr_newest_x                (sq_entry_same_addr_newest[11]             ),
  .sq_entry_settle_data_hit_x                 (sq_entry_settle_data_hit[11]              ),
  .sq_entry_spec_fail_x                       (sq_entry_spec_fail[11]                    ),
  .sq_entry_st_dc_create_age_vec_x            (sq_entry_st_dc_create_age_vec[11]         ),
  .sq_entry_st_dc_same_addr_newer_x           (sq_entry_st_dc_same_addr_newer[11]        ),
  .sq_entry_sync_fence_x                      (sq_entry_sync_fence[11]                   ),
  .sq_entry_vld_x                             (sq_entry_vld[11]                          ),
  .sq_entry_vstart_vld_x                      (sq_entry_vstart_vld[11]                   ),
  .sq_entry_wo_st_x                           (sq_entry_wo_st[11]                        ),
  .sq_pop_ptr_x                               (sq_pop_ptr[11]                            ),
  .st_da_bkpta_data                           (st_da_bkpta_data                          ),
  .st_da_bkptb_data                           (st_da_bkptb_data                          ),
  .st_da_iid                                  (st_da_iid                                 ),
  .st_da_inst_vld                             (st_da_inst_vld                            ),
  .st_da_secd                                 (st_da_secd                                ),
  .st_da_sq_dcache_dirty                      (st_da_sq_dcache_dirty                     ),
  .st_da_sq_dcache_share                      (st_da_sq_dcache_share                     ),
  .st_da_sq_dcache_valid                      (st_da_sq_dcache_valid                     ),
  .st_da_sq_dcache_way                        (st_da_sq_dcache_way                       ),
  .st_da_sq_ecc_stall                         (st_da_sq_ecc_stall                        ),
  .st_da_sq_no_restart                        (st_da_sq_no_restart                       ),
  .st_da_wb_expt_vld                          (st_da_wb_expt_vld                         ),
  .st_da_wb_spec_fail                         (st_da_wb_spec_fail                        ),
  .st_da_wb_vstart_vld                        (st_da_wb_vstart_vld                       ),
  .st_dc_addr0                                (st_dc_addr0                               ),
  .st_dc_atomic                               (st_dc_atomic                              ),
  .st_dc_boundary                             (st_dc_boundary                            ),
  .st_dc_boundary_first                       (st_dc_boundary_first                      ),
  .st_dc_bytes_vld                            (st_dc_bytes_vld                           ),
  .st_dc_cmit0_iid_crt_hit                    (st_dc_cmit0_iid_crt_hit                   ),
  .st_dc_cmit1_iid_crt_hit                    (st_dc_cmit1_iid_crt_hit                   ),
  .st_dc_cmit2_iid_crt_hit                    (st_dc_cmit2_iid_crt_hit                   ),
  .st_dc_da_page_buf                          (st_dc_da_page_buf                         ),
  .st_dc_da_page_ca                           (st_dc_da_page_ca                          ),
  .st_dc_da_page_sec                          (st_dc_da_page_sec                         ),
  .st_dc_da_page_share                        (st_dc_da_page_share                       ),
  .st_dc_da_page_so                           (st_dc_da_page_so                          ),
  .st_dc_da_page_wa                           (st_dc_da_page_wa                          ),
  .st_dc_fence_mode                           (st_dc_fence_mode                          ),
  .st_dc_icc                                  (st_dc_icc                                 ),
  .st_dc_iid                                  (st_dc_iid                                 ),
  .st_dc_inst_flush                           (st_dc_inst_flush                          ),
  .st_dc_inst_mode                            (st_dc_inst_mode                           ),
  .st_dc_inst_size                            (st_dc_inst_size                           ),
  .st_dc_inst_type                            (st_dc_inst_type                           ),
  .st_dc_rot_sel_rev                          (st_dc_rot_sel_rev                         ),
  .st_dc_sdid                                 (st_dc_sdid                                ),
  .st_dc_sdid_hit                             (st_dc_sdid_hit                            ),
  .st_dc_secd                                 (st_dc_secd                                ),
  .st_dc_sq_data_vld                          (st_dc_sq_data_vld                         ),
  .st_dc_sync_fence                           (st_dc_sync_fence                          ),
  .st_dc_wo_st_inst                           (st_dc_wo_st_inst                          ),
  .wmb_sq_pop_grnt                            (wmb_sq_pop_grnt                           )
);


//==========================================================
//                Generate full/create signal
//==========================================================
//------------------create ptr------------------------------
//ptr 0 find empty entry from No.0
// &CombBeg; @174
always @( sq_entry_vld[11:0])
begin
sq_create_ptr[SQ_ENTRY-1:0]   = {SQ_ENTRY{1'b0}};
casez(sq_entry_vld[SQ_ENTRY-1:0])
  12'b????_????_???0:sq_create_ptr[0]  = 1'b1;
  12'b????_????_??01:sq_create_ptr[1]  = 1'b1;
  12'b????_????_?011:sq_create_ptr[2]  = 1'b1;
  12'b????_????_0111:sq_create_ptr[3]  = 1'b1;
  12'b????_???0_1111:sq_create_ptr[4]  = 1'b1;
  12'b????_??01_1111:sq_create_ptr[5]  = 1'b1;
  12'b????_?011_1111:sq_create_ptr[6]  = 1'b1;
  12'b????_0111_1111:sq_create_ptr[7]  = 1'b1;
  12'b???0_1111_1111:sq_create_ptr[8]  = 1'b1;
  12'b??01_1111_1111:sq_create_ptr[9]  = 1'b1;
  12'b?011_1111_1111:sq_create_ptr[10]  = 1'b1;
  12'b0111_1111_1111:sq_create_ptr[11]  = 1'b1;
  default:sq_create_ptr[SQ_ENTRY-1:0]   = {SQ_ENTRY{1'b0}};
endcase
// &CombEnd; @191
end

//------------------full signal-----------------------------
assign sq_has_cmit      = |(sq_entry_cmit[SQ_ENTRY-1:0]
                            & sq_entry_vld[SQ_ENTRY-1:0]);
assign sq_full          = &sq_entry_vld[SQ_ENTRY-1:0];
assign sq_empty_less2   = &(sq_entry_vld[SQ_ENTRY-1:0]
                            | sq_create_ptr[SQ_ENTRY-1:0]);
assign sq_st_dc_inst_hit= |sq_entry_inst_hit[SQ_ENTRY-1:0];
// &Force("output","sq_st_dc_full"); @200
assign sq_st_dc_full    = sq_full
                          ||  !st_dc_old
                              &&  sq_empty_less2
                              &&  !sq_has_cmit;

//------------------empty signal----------------------------
// &Force("output","sq_empty"); @207
assign sq_empty         = !(|sq_entry_vld[SQ_ENTRY-1:0]);
//------------------create signal---------------------------
assign sq_create_success  = st_dc_sq_create_vld
                            &&  !sq_st_dc_full
                            &&  !rtu_yy_xx_flush;

assign sq_entry_create_vld[SQ_ENTRY-1:0]      =
                {SQ_ENTRY{sq_create_success}}
                & sq_create_ptr[SQ_ENTRY-1:0];

assign sq_entry_create_dp_vld[SQ_ENTRY-1:0]   =
                {SQ_ENTRY{st_dc_sq_create_dp_vld}}
                & sq_create_ptr[SQ_ENTRY-1:0];
                            
assign sq_entry_create_gateclk_en[SQ_ENTRY-1:0] =
                {SQ_ENTRY{st_dc_sq_create_gateclk_en}}
                & sq_create_ptr[SQ_ENTRY-1:0];

assign sq_create_same_addr_newest = &(~sq_entry_st_dc_same_addr_newer[SQ_ENTRY-1:0]);

//------------------create age_vec signal-------------------
assign sq_create_vld[SQ_ENTRY-1:0]      = sq_entry_create_vld[SQ_ENTRY-1:0];

assign sq_create_age_vec[SQ_ENTRY-1:0]  = sq_entry_st_dc_create_age_vec[SQ_ENTRY-1:0];

assign sq_age_vec_set = sq_create_success ||  wmb_sq_pop_to_ce_grnt;

//==========================================================
//            Settle data to memory mode
//==========================================================
//------------------settle data to register mode------------
// &CombBeg; @269
// &CombEnd; @301
assign sq_data_ori[127:0]       = {sd_ex1_data[63:0],sd_ex1_data[63:0]};
assign sq_settle_rot_sel[7:0]  = {8{sq_entry_settle_data_hit[0]}}  & sq_entry_rot_sel_0[7:0]
                                  | {8{sq_entry_settle_data_hit[1]}}  & sq_entry_rot_sel_1[7:0]
                                  | {8{sq_entry_settle_data_hit[2]}}  & sq_entry_rot_sel_2[7:0]
                                  | {8{sq_entry_settle_data_hit[3]}}  & sq_entry_rot_sel_3[7:0]
                                  | {8{sq_entry_settle_data_hit[4]}}  & sq_entry_rot_sel_4[7:0]
                                  | {8{sq_entry_settle_data_hit[5]}}  & sq_entry_rot_sel_5[7:0]
                                  | {8{sq_entry_settle_data_hit[6]}}  & sq_entry_rot_sel_6[7:0]
                                  | {8{sq_entry_settle_data_hit[7]}}  & sq_entry_rot_sel_7[7:0]
                                  | {8{sq_entry_settle_data_hit[8]}}  & sq_entry_rot_sel_8[7:0]
                                  | {8{sq_entry_settle_data_hit[9]}}  & sq_entry_rot_sel_9[7:0]
                                  | {8{sq_entry_settle_data_hit[10]}}  & sq_entry_rot_sel_10[7:0]
                                  | {8{sq_entry_settle_data_hit[11]}}  & sq_entry_rot_sel_11[7:0];


//rotate data
// &Instance("ct_lsu_rot_data", "x_lsu_sq_data_rot_to_mem_format"); @333
ct_lsu_rot_data  x_lsu_sq_data_rot_to_mem_format (
  .data_in           (sq_data_ori      ),
  .data_settle_out   (sq_data_after_rot),
  .rot_sel           (sq_settle_rot_sel)
);

// &Connect(.rot_sel         (sq_settle_rot_sel  ), @334
//          .data_in         (sq_data_ori        ), @335
//          .data_settle_out (sq_data_after_rot  )); @336

assign sq_data_settle[63:0]       = sq_data_after_rot[63:0];


//==========================================================
//            sq to ld_dc depd/discard signal
//==========================================================
//------------------request---------------------------------
// &Force("output","sq_ld_dc_other_discard_req"); @349
assign sq_ld_dc_cancel_ahead_wb   = (|sq_entry_cancel_ahead_wb[SQ_ENTRY-1:0]
                                       && !sq_ld_dc_newest_fwd_data_vld_req
                                    || sq_ld_dc_other_discard_req);
assign sq_ld_dc_other_discard_req = |sq_entry_discard_req[SQ_ENTRY-1:0];
assign sq_ld_dc_addr1_dep_discard = |sq_entry_addr1_dep_discard[SQ_ENTRY-1:0];
assign sq_ld_dc_cancel_acc_req    = |sq_entry_cancel_acc_req[SQ_ENTRY-1:0];

//------------------data depd-------------------------------
assign sq_fwd_bypass_req            = |sq_entry_fwd_bypass_req[SQ_ENTRY-1:0];
assign sq_newest_fwd_bypass_req     = |(sq_entry_fwd_bypass_req[SQ_ENTRY-1:0]
                                        & sq_entry_same_addr_newest[SQ_ENTRY-1:0]);
assign sq_data_discard_req_short    = |sq_entry_data_discard_req_short[SQ_ENTRY-1:0];
assign sq_data_discard_req          = |sq_entry_data_discard_req[SQ_ENTRY-1:0];
//assign sq_newest_data_discard_req   = |(sq_entry_data_discard_req[SQ_ENTRY-1:0]
//                                        & sq_entry_same_addr_newest[SQ_ENTRY-1:0]);
assign sq_fwd_req                   = |sq_entry_fwd_req[SQ_ENTRY-1:0];
assign sq_newest_fwd_req_id[SQ_ENTRY-1:0] = sq_entry_fwd_req[SQ_ENTRY-1:0]
                                            & sq_entry_same_addr_newest[SQ_ENTRY-1:0];
assign sq_newest_fwd_req            = |sq_newest_fwd_req_id[SQ_ENTRY-1:0];

//------------------judge for depd--------------------------
//to ld_dc fwd judge
assign sq_ld_dc_has_fwd_req           = sq_fwd_req;
assign sq_ld_dc_fwd_req               = sq_newest_fwd_req
                                        ||  !sq_fwd_bypass_req
                                            &&  sq_fwd_req;

// &Force("output","sq_ld_dc_newest_fwd_data_vld_req"); @377
assign sq_ld_dc_newest_fwd_data_vld_req = |sq_entry_newest_fwd_req_data_vld[SQ_ENTRY-1:0];
assign sq_newest_fwd_req_data_vld_short = |sq_entry_newest_fwd_req_data_vld_short[SQ_ENTRY-1:0];
//to ld_da pipe
assign sq_ld_dc_data_discard_req      = sq_data_discard_req
                                        &&  !sq_newest_fwd_bypass_req
                                        &&  !sq_newest_fwd_req;
//if sq_ld_dc_fwd_bypass_req && sq_ld_dc_fwd_req, then multi fwd
assign sq_ld_dc_fwd_bypass_req        = sq_newest_fwd_bypass_req
                                        ||  sq_fwd_bypass_req
                                            &&  !sq_fwd_req;

//if fwd_bypass_multi depd, then use sq_entry_data_discard_req_short id
assign sq_ld_dc_fwd_id[SQ_ENTRY-1:0]  = sq_data_discard_req_short &&  !sq_newest_fwd_req
                                        ? sq_entry_data_discard_req_short[SQ_ENTRY-1:0]
                                        : sq_fwd_req_id[SQ_ENTRY-1:0];
assign sq_fwd_req_id[SQ_ENTRY-1:0]    = sq_newest_fwd_req
                                        ? sq_newest_fwd_req_id[SQ_ENTRY-1:0]
                                        : sq_entry_fwd_req[SQ_ENTRY-1:0];

//---------multi depd-------------------
// &CombBeg; @398
always @( sq_entry_fwd_req[11:0])
begin
sq_fwd_multi = 1'b1;
case(sq_entry_fwd_req[SQ_ENTRY-1:0])
  12'b0000_0000_0000,
  12'b0000_0000_0001,
  12'b0000_0000_0010,
  12'b0000_0000_0100,
  12'b0000_0000_1000,
  12'b0000_0001_0000,
  12'b0000_0010_0000,
  12'b0000_0100_0000,
  12'b0000_1000_0000,
  12'b0001_0000_0000,
  12'b0010_0000_0000,
  12'b0100_0000_0000,
  12'b1000_0000_0000:
    sq_fwd_multi = 1'b0;
  default:sq_fwd_multi = 1'b1;
endcase
// &CombEnd; @417
end
assign sq_ld_dc_fwd_multi = sq_fwd_multi;
assign sq_ld_dc_fwd_multi_mask    = sq_newest_fwd_req;
assign sq_ld_dc_fwd_bypass_multi  = !sq_newest_fwd_bypass_req
                                    &&  !sq_newest_fwd_req
                                    &&  sq_fwd_bypass_req
                                    &&  sq_fwd_req;

//==========================================================
//              Forward data pop entry
//==========================================================
// &CombBeg; @438
// &CombEnd; @454
always @(posedge sq_fwd_data_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_fwd_data_pe[63:0]   <=  64'd0;
  else if(sq_fwd_data_pe_req)
    sq_fwd_data_pe[63:0]   <=  sq_fwd_data_sel[63:0];
end

assign sq_fwd_data_pe_req  = sq_ld_dc_newest_fwd_data_vld_req;
// &CombBeg; @466
always @( sq_entry_data_9[63:0]
       or sq_entry_newest_fwd_req_data_vld[11:0]
       or sq_entry_data_3[63:0]
       or sq_entry_data_11[63:0]
       or sq_entry_data_5[63:0]
       or sq_entry_data_4[63:0]
       or sq_entry_data_1[63:0]
       or sq_entry_data_7[63:0]
       or sq_entry_data_6[63:0]
       or sq_entry_data_8[63:0]
       or sq_entry_data_2[63:0]
       or sq_entry_data_10[63:0]
       or sq_entry_data_0[63:0])
begin
case(sq_entry_newest_fwd_req_data_vld[SQ_ENTRY-1:0])
  12'h001:  sq_fwd_data_sel[63:0] = sq_entry_data_0[63:0];
  12'h002:  sq_fwd_data_sel[63:0] = sq_entry_data_1[63:0];
  12'h004:  sq_fwd_data_sel[63:0] = sq_entry_data_2[63:0];
  12'h008:  sq_fwd_data_sel[63:0] = sq_entry_data_3[63:0];
  12'h010:  sq_fwd_data_sel[63:0] = sq_entry_data_4[63:0];
  12'h020:  sq_fwd_data_sel[63:0] = sq_entry_data_5[63:0];
  12'h040:  sq_fwd_data_sel[63:0] = sq_entry_data_6[63:0];
  12'h080:  sq_fwd_data_sel[63:0] = sq_entry_data_7[63:0];
  12'h100:  sq_fwd_data_sel[63:0] = sq_entry_data_8[63:0];
  12'h200:  sq_fwd_data_sel[63:0] = sq_entry_data_9[63:0];
  12'h400:  sq_fwd_data_sel[63:0] = sq_entry_data_10[63:0];
  12'h800:  sq_fwd_data_sel[63:0] = sq_entry_data_11[63:0];
  default:sq_fwd_data_sel[63:0] = {64{1'bx}};
endcase
// &CombEnd; @482
end
assign sq_ld_da_fwd_data_pe[63:0] = sq_fwd_data_pe[63:0];
//==========================================================
//                forward data to ld_da
//==========================================================
// &CombBeg; @489
// &CombEnd; @505
// &CombBeg; @507
always @( sq_entry_data_9[63:0]
       or ld_da_sq_fwd_id[11:0]
       or sq_entry_data_3[63:0]
       or sq_entry_data_11[63:0]
       or sq_entry_data_5[63:0]
       or sq_entry_data_4[63:0]
       or sq_entry_data_1[63:0]
       or sq_entry_data_7[63:0]
       or sq_entry_data_6[63:0]
       or sq_entry_data_8[63:0]
       or sq_entry_data_2[63:0]
       or sq_entry_data_10[63:0]
       or sq_entry_data_0[63:0])
begin
case(ld_da_sq_fwd_id[SQ_ENTRY-1:0])
  12'h001:  sq_ld_da_fwd_data[63:0] = sq_entry_data_0[63:0];
  12'h002:  sq_ld_da_fwd_data[63:0] = sq_entry_data_1[63:0];
  12'h004:  sq_ld_da_fwd_data[63:0] = sq_entry_data_2[63:0];
  12'h008:  sq_ld_da_fwd_data[63:0] = sq_entry_data_3[63:0];
  12'h010:  sq_ld_da_fwd_data[63:0] = sq_entry_data_4[63:0];
  12'h020:  sq_ld_da_fwd_data[63:0] = sq_entry_data_5[63:0];
  12'h040:  sq_ld_da_fwd_data[63:0] = sq_entry_data_6[63:0];
  12'h080:  sq_ld_da_fwd_data[63:0] = sq_entry_data_7[63:0];
  12'h100:  sq_ld_da_fwd_data[63:0] = sq_entry_data_8[63:0];
  12'h200:  sq_ld_da_fwd_data[63:0] = sq_entry_data_9[63:0];
  12'h400:  sq_ld_da_fwd_data[63:0] = sq_entry_data_10[63:0];
  12'h800:  sq_ld_da_fwd_data[63:0] = sq_entry_data_11[63:0];
  default:sq_ld_da_fwd_data[63:0] = {64{1'bx}};
endcase
// &CombEnd; @523
end
//==========================================================
//            ld_da to sq depd/discard signal
//==========================================================
//---------interface to sq_entry--------
//set depd signal
assign sq_entry_fwd_multi_depd_set[SQ_ENTRY-1:0]  = {SQ_ENTRY{ld_da_sq_fwd_multi_vld}}
                                                    & ld_da_sq_fwd_id[SQ_ENTRY-1:0]
                                                    & sq_entry_vld[SQ_ENTRY-1:0];

//-------------data depd--------------
//if more than 1 entry have depend relationship, see fwd_en signal,
//if no entry has fwd_en signal, then select the biggest entry
// &CombBeg; @537
always @( ld_da_sq_fwd_id[11:0])
begin
sq_data_discard_id_sel[SQ_ENTRY-1:0] = {SQ_ENTRY{1'b0}};
casez(ld_da_sq_fwd_id[SQ_ENTRY-1:0])
  12'b1???_????_????:sq_data_discard_id_sel[11] = 1'b1;
  12'b01??_????_????:sq_data_discard_id_sel[10] = 1'b1;
  12'b001?_????_????:sq_data_discard_id_sel[9] = 1'b1;
  12'b0001_????_????:sq_data_discard_id_sel[8] = 1'b1;
  12'b0000_1???_????:sq_data_discard_id_sel[7] = 1'b1;
  12'b0000_01??_????:sq_data_discard_id_sel[6] = 1'b1;
  12'b0000_001?_????:sq_data_discard_id_sel[5] = 1'b1;
  12'b0000_0001_????:sq_data_discard_id_sel[4] = 1'b1;
  12'b0000_0000_1???:sq_data_discard_id_sel[3] = 1'b1;
  12'b0000_0000_01??:sq_data_discard_id_sel[2] = 1'b1;
  12'b0000_0000_001?:sq_data_discard_id_sel[1] = 1'b1;
  12'b0000_0000_0001:sq_data_discard_id_sel[0] = 1'b1;
  default:sq_data_discard_id_sel[SQ_ENTRY-1:0] = {SQ_ENTRY{1'b0}};
endcase
// &CombEnd; @554
end

assign sq_data_discard_newest_id[SQ_ENTRY-1:0]    = sq_entry_same_addr_newest[SQ_ENTRY-1:0]
                                                    & ld_da_sq_fwd_id[SQ_ENTRY-1:0];

assign sq_data_discard_has_newest                 = |sq_data_discard_newest_id[SQ_ENTRY-1:0];

assign sq_entry_wakeup_queue_set_id[SQ_ENTRY-1:0] = sq_data_discard_has_newest
                                                    ? sq_data_discard_newest_id[SQ_ENTRY-1:0]
                                                    : sq_data_discard_id_sel[SQ_ENTRY-1:0];

assign sq_entry_data_discard_grnt[SQ_ENTRY-1:0]   = {SQ_ENTRY{ld_da_sq_data_discard_vld}}
                                                    &  sq_entry_wakeup_queue_set_id[SQ_ENTRY-1:0];

//==========================================================
//            maintain restart wakeup queue
//==========================================================
//---------------------registers----------------------------
//+--------------+
//| wakeup_queue |
//+--------------+
//the queue stores the instructions waiting for wakeup
always @(posedge sq_wakeup_queue_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_wakeup_queue[LSIQ_ENTRY-1:0]   <=  {LSIQ_ENTRY{1'b0}};
  else if(rtu_yy_xx_flush)
    sq_wakeup_queue[LSIQ_ENTRY-1:0]   <=  {LSIQ_ENTRY{1'b0}};
  else if(ld_da_sq_global_discard_vld ||  sq_pop_depd_ff)
    sq_wakeup_queue[LSIQ_ENTRY-1:0]   <=  sq_wakeup_queue_next[LSIQ_ENTRY-1:0];
end

//+-------------+
//| depd_pop_ff |
//+-------------+
//if depd pop, this will set to 1, and clear wakeup_queue next cycle
always @(posedge sq_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_pop_depd_ff      <=  1'b0;
  else if(wmb_sq_pop_grnt &&  (wmb_ce_depd  ||  wmb_ce_depd_set))
    sq_pop_depd_ff      <=  1'b1;
  else
    sq_pop_depd_ff      <=  1'b0;
end

//------------------update wakeup queue---------------------
assign sq_wakeup_queue_grnt[LSIQ_ENTRY-1:0]   = sq_wakeup_queue[LSIQ_ENTRY-1:0]
                                                | ({LSIQ_ENTRY{ld_da_sq_global_discard_vld}}
                                                  & ld_da_lsid[LSIQ_ENTRY-1:0]);

assign sq_wakeup_queue_next[LSIQ_ENTRY-1:0]   = sq_pop_depd_ff
                                                ? {LSIQ_ENTRY{1'b0}}
                                                : sq_wakeup_queue_grnt[LSIQ_ENTRY-1:0];

//-------------------------wakeup---------------------------
assign sq_global_depd_wakeup[LSIQ_ENTRY-1:0]  = sq_pop_depd_ff
                                                ? sq_wakeup_queue_grnt[LSIQ_ENTRY-1:0]
                                                : {LSIQ_ENTRY{1'b0}};

assign sq_data_depd_wakeup[LSIQ_ENTRY-1:0]    = sq_entry_data_depd_wakeup_0[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_1[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_2[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_3[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_4[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_5[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_6[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_7[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_8[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_9[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_10[LSIQ_ENTRY-1:0]
                                                | sq_entry_data_depd_wakeup_11[LSIQ_ENTRY-1:0];

//==========================================================
//                pop entry
//==========================================================
//+----------+---------------+
//| pop addr | pop_page_info |
//+----------+---------------+
// &Force("output","sq_pop_addr"); @633
// &Force("output","sq_pop_page_share"); @634
// &Force("output","sq_pop_page_ca"); @635
// &Force("output","sq_pop_page_so"); @636
// &Force("output","sq_pop_inst_mode"); @637
// &Force("output","sq_pop_sync_fence"); @638
// &Force("output","sq_pop_atomic"); @639
// &Force("output","sq_pop_icc"); @640
// &Force("output","sq_pop_inst_flush"); @641
// &Force("output","sq_pop_inst_type"); @642
// &Force("output","sq_pop_inst_size"); @643
// &Force("output","sq_pop_bytes_vld"); @644
// &Force("output","sq_pop_wo_st"); @645
// &Force("output","sq_pop_ptr"); @646
always @(posedge sq_pop_clk)
begin
  if(sq_pe_sel_age_vec_zero_entry_vld)
  begin
    sq_pop_addr[`PA_WIDTH-1:0]  <=  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0];
    sq_pop_page_ca            <=  sq_pe_age_vec_zero_page_ca;
    sq_pop_page_wa            <=  sq_pe_age_vec_zero_page_wa;
    sq_pop_page_so            <=  sq_pe_age_vec_zero_page_so;
    sq_pop_page_sec           <=  sq_pe_age_vec_zero_page_sec;
    sq_pop_page_buf           <=  sq_pe_age_vec_zero_page_buf;
    sq_pop_page_share         <=  sq_pe_age_vec_zero_page_share;
    sq_pop_atomic             <=  sq_pe_age_vec_zero_atomic;
    sq_pop_icc                <=  sq_pe_age_vec_zero_icc;
    sq_pop_wo_st              <=  sq_pe_age_vec_zero_wo_st;
    sq_pop_sync_fence         <=  sq_pe_age_vec_zero_sync_fence;
    sq_pop_inst_flush         <=  sq_pe_age_vec_zero_inst_flush;
    sq_pop_inst_type[1:0]     <=  sq_pe_age_vec_zero_inst_type[1:0];
    sq_pop_inst_size[2:0]     <=  sq_pe_age_vec_zero_inst_size[2:0];
    sq_pop_inst_mode[1:0]     <=  sq_pe_age_vec_zero_inst_mode[1:0];
    sq_pop_bytes_vld[15:0]    <=  sq_pe_age_vec_zero_bytes_vld[15:0];
    sq_pop_ptr[SQ_ENTRY-1:0]  <=  sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0];
    sq_pop_priv_mode[1:0]     <=  sq_pe_age_vec_zero_priv_mode[1:0];
  end
  else if(sq_pe_sel_age_vec_surplus1_entry_vld)
  begin
    sq_pop_addr[`PA_WIDTH-1:0]  <=  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0];
    sq_pop_page_ca            <=  sq_pe_age_vec_surplus1_page_ca;
    sq_pop_page_wa            <=  sq_pe_age_vec_surplus1_page_wa;
    sq_pop_page_so            <=  sq_pe_age_vec_surplus1_page_so;
    sq_pop_page_sec           <=  sq_pe_age_vec_surplus1_page_sec;
    sq_pop_page_buf           <=  sq_pe_age_vec_surplus1_page_buf;
    sq_pop_page_share         <=  sq_pe_age_vec_surplus1_page_share;
    sq_pop_atomic             <=  sq_pe_age_vec_surplus1_atomic;
    sq_pop_icc                <=  sq_pe_age_vec_surplus1_icc;
    sq_pop_wo_st              <=  sq_pe_age_vec_surplus1_wo_st;
    sq_pop_sync_fence         <=  sq_pe_age_vec_surplus1_sync_fence;
    sq_pop_inst_flush         <=  sq_pe_age_vec_surplus1_inst_flush;
    sq_pop_inst_type[1:0]     <=  sq_pe_age_vec_surplus1_inst_type[1:0];
    sq_pop_inst_size[2:0]     <=  sq_pe_age_vec_surplus1_inst_size[2:0];
    sq_pop_inst_mode[1:0]     <=  sq_pe_age_vec_surplus1_inst_mode[1:0];
    sq_pop_bytes_vld[15:0]    <=  sq_pe_age_vec_surplus1_bytes_vld[15:0];
    sq_pop_ptr[SQ_ENTRY-1:0]  <=  sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0];
    sq_pop_priv_mode[1:0]     <=  sq_pe_age_vec_surplus1_priv_mode[1:0];
  end
end

//---------------------update siganl------------------------
//if change entry to age_vec_zero, it must be new entry in st_dc pipe,
// and in st_da pipe it send no_restart signal
assign sq_pe_sel_age_vec_zero_entry_vld       = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0]
                                                  & (~sq_entry_dcache_info_vld[SQ_ENTRY-1:0]));

assign sq_pe_sel_age_vec_surplus1_entry_vld   = wmb_sq_pop_to_ce_grnt;

// &CombBeg; @701
always @( sq_entry_addr0_3[39:0]
       or sq_entry_addr0_7[39:0]
       or sq_entry_addr0_0[39:0]
       or sq_entry_addr0_11[39:0]
       or sq_entry_addr0_5[39:0]
       or sq_entry_addr0_10[39:0]
       or sq_entry_addr0_8[39:0]
       or sq_entry_addr0_1[39:0]
       or sq_entry_addr0_2[39:0]
       or sq_entry_addr0_6[39:0]
       or sq_entry_addr0_9[39:0]
       or sq_entry_age_vec_zero_ptr[11:0]
       or sq_entry_addr0_4[39:0])
begin
case(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0])
  12'h001:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_0[`PA_WIDTH-1:0];
  12'h002:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_1[`PA_WIDTH-1:0];
  12'h004:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_2[`PA_WIDTH-1:0];
  12'h008:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_3[`PA_WIDTH-1:0];
  12'h010:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_4[`PA_WIDTH-1:0];
  12'h020:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_5[`PA_WIDTH-1:0];
  12'h040:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_6[`PA_WIDTH-1:0];
  12'h080:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_7[`PA_WIDTH-1:0];
  12'h100:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_8[`PA_WIDTH-1:0];
  12'h200:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_9[`PA_WIDTH-1:0];
  12'h400:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_10[`PA_WIDTH-1:0];
  12'h800:  sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = sq_entry_addr0_11[`PA_WIDTH-1:0];
  default:sq_pe_age_vec_zero_addr[`PA_WIDTH-1:0] = {`PA_WIDTH{1'bx}};
endcase
// &CombEnd; @717
end

// &CombBeg; @719
always @( sq_entry_bytes_vld_10[15:0]
       or sq_entry_bytes_vld_6[15:0]
       or sq_entry_bytes_vld_9[15:0]
       or sq_entry_bytes_vld_8[15:0]
       or sq_entry_bytes_vld_4[15:0]
       or sq_entry_bytes_vld_11[15:0]
       or sq_entry_bytes_vld_2[15:0]
       or sq_entry_bytes_vld_7[15:0]
       or sq_entry_bytes_vld_0[15:0]
       or sq_entry_bytes_vld_1[15:0]
       or sq_entry_bytes_vld_5[15:0]
       or sq_entry_age_vec_zero_ptr[11:0]
       or sq_entry_bytes_vld_3[15:0])
begin
case(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0])
  12'h001:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_0[15:0];
  12'h002:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_1[15:0];
  12'h004:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_2[15:0];
  12'h008:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_3[15:0];
  12'h010:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_4[15:0];
  12'h020:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_5[15:0];
  12'h040:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_6[15:0];
  12'h080:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_7[15:0];
  12'h100:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_8[15:0];
  12'h200:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_9[15:0];
  12'h400:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_10[15:0];
  12'h800:  sq_pe_age_vec_zero_bytes_vld[15:0] = sq_entry_bytes_vld_11[15:0];
  default:sq_pe_age_vec_zero_bytes_vld[15:0] = {16{1'bx}};
endcase
// &CombEnd; @735
end

assign sq_pe_age_vec_zero_page_ca         = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_page_ca[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_page_wa         = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_page_wa[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_page_so         = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_page_so[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_page_buf        = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_page_buf[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_page_sec        = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_page_sec[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_page_share      = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_page_share[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_atomic          = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_atomic[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_icc             = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_icc[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_wo_st           = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_wo_st[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_sync_fence      = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_sync_fence[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_zero_inst_flush      = |(sq_entry_age_vec_zero_ptr[SQ_ENTRY-1:0] & sq_entry_inst_flush[SQ_ENTRY-1:0]);

assign sq_pe_age_vec_zero_inst_type[1:0]  = {2{sq_entry_age_vec_zero_ptr[0]}}  & sq_entry_inst_type_0[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[1]}}  & sq_entry_inst_type_1[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[2]}}  & sq_entry_inst_type_2[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[3]}}  & sq_entry_inst_type_3[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[4]}}  & sq_entry_inst_type_4[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[5]}}  & sq_entry_inst_type_5[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[6]}}  & sq_entry_inst_type_6[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[7]}}  & sq_entry_inst_type_7[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[8]}}  & sq_entry_inst_type_8[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[9]}}  & sq_entry_inst_type_9[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[10]}}  & sq_entry_inst_type_10[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[11]}}  & sq_entry_inst_type_11[1:0];

assign sq_pe_age_vec_zero_inst_size[2:0]  = {3{sq_entry_age_vec_zero_ptr[0]}}  & sq_entry_inst_size_0[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[1]}}  & sq_entry_inst_size_1[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[2]}}  & sq_entry_inst_size_2[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[3]}}  & sq_entry_inst_size_3[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[4]}}  & sq_entry_inst_size_4[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[5]}}  & sq_entry_inst_size_5[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[6]}}  & sq_entry_inst_size_6[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[7]}}  & sq_entry_inst_size_7[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[8]}}  & sq_entry_inst_size_8[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[9]}}  & sq_entry_inst_size_9[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[10]}}  & sq_entry_inst_size_10[2:0]
                                             | {3{sq_entry_age_vec_zero_ptr[11]}}  & sq_entry_inst_size_11[2:0];

assign sq_pe_age_vec_zero_inst_mode[1:0]  = {2{sq_entry_age_vec_zero_ptr[0]}}  & sq_entry_inst_mode_0[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[1]}}  & sq_entry_inst_mode_1[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[2]}}  & sq_entry_inst_mode_2[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[3]}}  & sq_entry_inst_mode_3[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[4]}}  & sq_entry_inst_mode_4[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[5]}}  & sq_entry_inst_mode_5[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[6]}}  & sq_entry_inst_mode_6[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[7]}}  & sq_entry_inst_mode_7[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[8]}}  & sq_entry_inst_mode_8[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[9]}}  & sq_entry_inst_mode_9[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[10]}}  & sq_entry_inst_mode_10[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[11]}}  & sq_entry_inst_mode_11[1:0];

assign sq_pe_age_vec_zero_priv_mode[1:0]  = {2{sq_entry_age_vec_zero_ptr[0]}}  & sq_entry_priv_mode_0[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[1]}}  & sq_entry_priv_mode_1[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[2]}}  & sq_entry_priv_mode_2[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[3]}}  & sq_entry_priv_mode_3[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[4]}}  & sq_entry_priv_mode_4[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[5]}}  & sq_entry_priv_mode_5[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[6]}}  & sq_entry_priv_mode_6[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[7]}}  & sq_entry_priv_mode_7[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[8]}}  & sq_entry_priv_mode_8[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[9]}}  & sq_entry_priv_mode_9[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[10]}}  & sq_entry_priv_mode_10[1:0]
                                             | {2{sq_entry_age_vec_zero_ptr[11]}}  & sq_entry_priv_mode_11[1:0];

// &CombBeg; @801
always @( sq_entry_addr0_3[39:0]
       or sq_entry_addr0_7[39:0]
       or sq_entry_addr0_0[39:0]
       or sq_entry_addr0_11[39:0]
       or sq_entry_addr0_5[39:0]
       or sq_entry_addr0_10[39:0]
       or sq_entry_addr0_8[39:0]
       or sq_entry_addr0_1[39:0]
       or sq_entry_addr0_2[39:0]
       or sq_entry_addr0_6[39:0]
       or sq_entry_addr0_9[39:0]
       or sq_entry_age_vec_surplus1_ptr[11:0]
       or sq_entry_addr0_4[39:0])
begin
case(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0])
  12'h001:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_0[`PA_WIDTH-1:0];
  12'h002:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_1[`PA_WIDTH-1:0];
  12'h004:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_2[`PA_WIDTH-1:0];
  12'h008:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_3[`PA_WIDTH-1:0];
  12'h010:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_4[`PA_WIDTH-1:0];
  12'h020:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_5[`PA_WIDTH-1:0];
  12'h040:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_6[`PA_WIDTH-1:0];
  12'h080:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_7[`PA_WIDTH-1:0];
  12'h100:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_8[`PA_WIDTH-1:0];
  12'h200:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_9[`PA_WIDTH-1:0];
  12'h400:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_10[`PA_WIDTH-1:0];
  12'h800:  sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = sq_entry_addr0_11[`PA_WIDTH-1:0];
  default:sq_pe_age_vec_surplus1_addr[`PA_WIDTH-1:0] = {`PA_WIDTH{1'bx}};
endcase
// &CombEnd; @817
end

// &CombBeg; @819
always @( sq_entry_bytes_vld_10[15:0]
       or sq_entry_bytes_vld_6[15:0]
       or sq_entry_bytes_vld_9[15:0]
       or sq_entry_bytes_vld_8[15:0]
       or sq_entry_bytes_vld_4[15:0]
       or sq_entry_bytes_vld_11[15:0]
       or sq_entry_bytes_vld_2[15:0]
       or sq_entry_bytes_vld_7[15:0]
       or sq_entry_bytes_vld_0[15:0]
       or sq_entry_bytes_vld_1[15:0]
       or sq_entry_bytes_vld_5[15:0]
       or sq_entry_age_vec_surplus1_ptr[11:0]
       or sq_entry_bytes_vld_3[15:0])
begin
case(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0])
  12'h001:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_0[15:0];
  12'h002:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_1[15:0];
  12'h004:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_2[15:0];
  12'h008:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_3[15:0];
  12'h010:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_4[15:0];
  12'h020:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_5[15:0];
  12'h040:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_6[15:0];
  12'h080:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_7[15:0];
  12'h100:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_8[15:0];
  12'h200:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_9[15:0];
  12'h400:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_10[15:0];
  12'h800:  sq_pe_age_vec_surplus1_bytes_vld[15:0] = sq_entry_bytes_vld_11[15:0];
  default:sq_pe_age_vec_surplus1_bytes_vld[15:0] = {16{1'bx}};
endcase
// &CombEnd; @835
end

assign sq_pe_age_vec_surplus1_page_ca     = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_page_ca[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_page_wa     = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_page_wa[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_page_so     = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_page_so[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_page_buf    = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_page_buf[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_page_sec    = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_page_sec[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_page_share  = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_page_share[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_atomic      = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_atomic[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_icc         = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_icc[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_wo_st       = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_wo_st[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_sync_fence  = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_sync_fence[SQ_ENTRY-1:0]);
assign sq_pe_age_vec_surplus1_inst_flush  = |(sq_entry_age_vec_surplus1_ptr[SQ_ENTRY-1:0] & sq_entry_inst_flush[SQ_ENTRY-1:0]);

assign sq_pe_age_vec_surplus1_inst_type[1:0]  = {2{sq_entry_age_vec_surplus1_ptr[0]}}  & sq_entry_inst_type_0[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[1]}}  & sq_entry_inst_type_1[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[2]}}  & sq_entry_inst_type_2[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[3]}}  & sq_entry_inst_type_3[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[4]}}  & sq_entry_inst_type_4[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[5]}}  & sq_entry_inst_type_5[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[6]}}  & sq_entry_inst_type_6[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[7]}}  & sq_entry_inst_type_7[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[8]}}  & sq_entry_inst_type_8[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[9]}}  & sq_entry_inst_type_9[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[10]}}  & sq_entry_inst_type_10[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[11]}}  & sq_entry_inst_type_11[1:0];

assign sq_pe_age_vec_surplus1_inst_size[2:0]  = {3{sq_entry_age_vec_surplus1_ptr[0]}}  & sq_entry_inst_size_0[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[1]}}  & sq_entry_inst_size_1[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[2]}}  & sq_entry_inst_size_2[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[3]}}  & sq_entry_inst_size_3[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[4]}}  & sq_entry_inst_size_4[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[5]}}  & sq_entry_inst_size_5[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[6]}}  & sq_entry_inst_size_6[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[7]}}  & sq_entry_inst_size_7[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[8]}}  & sq_entry_inst_size_8[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[9]}}  & sq_entry_inst_size_9[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[10]}}  & sq_entry_inst_size_10[2:0]
                                                 | {3{sq_entry_age_vec_surplus1_ptr[11]}}  & sq_entry_inst_size_11[2:0];

assign sq_pe_age_vec_surplus1_inst_mode[1:0]  = {2{sq_entry_age_vec_surplus1_ptr[0]}}  & sq_entry_inst_mode_0[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[1]}}  & sq_entry_inst_mode_1[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[2]}}  & sq_entry_inst_mode_2[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[3]}}  & sq_entry_inst_mode_3[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[4]}}  & sq_entry_inst_mode_4[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[5]}}  & sq_entry_inst_mode_5[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[6]}}  & sq_entry_inst_mode_6[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[7]}}  & sq_entry_inst_mode_7[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[8]}}  & sq_entry_inst_mode_8[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[9]}}  & sq_entry_inst_mode_9[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[10]}}  & sq_entry_inst_mode_10[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[11]}}  & sq_entry_inst_mode_11[1:0];

assign sq_pe_age_vec_surplus1_priv_mode[1:0]  = {2{sq_entry_age_vec_surplus1_ptr[0]}}  & sq_entry_priv_mode_0[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[1]}}  & sq_entry_priv_mode_1[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[2]}}  & sq_entry_priv_mode_2[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[3]}}  & sq_entry_priv_mode_3[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[4]}}  & sq_entry_priv_mode_4[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[5]}}  & sq_entry_priv_mode_5[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[6]}}  & sq_entry_priv_mode_6[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[7]}}  & sq_entry_priv_mode_7[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[8]}}  & sq_entry_priv_mode_8[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[9]}}  & sq_entry_priv_mode_9[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[10]}}  & sq_entry_priv_mode_10[1:0]
                                                 | {2{sq_entry_age_vec_surplus1_ptr[11]}}  & sq_entry_priv_mode_11[1:0];

// &Force("nonport","sq_entry_idx_order");  //temporary  @903
//==========================================================
//                request wmb ce
//==========================================================
//------------------pop info--------------------------------
assign sq_pop_req_unmask        = |(sq_entry_pop_req[SQ_ENTRY-1:0]);
//------------------inst type-------------------------------
assign sq_pop_st_inst           = !sq_pop_atomic
                                  &&  !sq_pop_icc
                                  &&  !sq_pop_sync_fence;
//assign sq_pop_sc_inst           = sq_pop_atomic
//                                  &&  (sq_pop_inst_type[1:0] ==  2'b01);
assign sq_pop_dcache_inst       = !sq_pop_atomic
                                  &&  sq_pop_icc
                                  &&  (sq_pop_inst_type[1:0] ==  2'b10);

//dcache all request pass to icc for gate_clk
assign sq_pop_dcache_all_inst   = sq_pop_dcache_inst
                                  &&  (sq_pop_inst_mode[1:0] ==  2'b00);
assign sq_pop_dcache_1line_inst = sq_pop_dcache_inst
                                  &&  (sq_pop_inst_mode[1:0] !=  2'b00);

//------------------pop request-----------------------------
//dcache all request icc success and wait for idle
//index not hit include dcache write port not hit
assign sq_pop_to_ce_req_unmask  = sq_pop_req_unmask
                                  &&  (!sq_pop_dcache_all_inst
                                      ||  sq_req_icc_success
                                          &&  icc_idle);

//because change mechanism, cache miss atomic can write, so must wait for hit_idx
assign sq_pop_to_ce_req         = sq_pop_to_ce_req_unmask
                                  &&  !rtu_lsu_async_flush;

assign sq_pop_merge_data_req_unmask = sq_pop_req_unmask
                                      &&  sq_pop_wo_st;

//------------------pop grnt--------------------------------
assign sq_entry_pop_to_ce_grnt[SQ_ENTRY-1:0]  = {SQ_ENTRY{wmb_sq_pop_to_ce_grnt}}
                                                & sq_entry_pop_req[SQ_ENTRY-1:0];
assign sq_entry_pop_to_ce_grnt_b[SQ_ENTRY-1:0]= ~sq_entry_pop_to_ce_grnt[SQ_ENTRY-1:0];

//------------------create signal---------------------------
assign sq_wmb_merge_req               = sq_pop_merge_data_req_unmask;
assign sq_wmb_pop_to_ce_req           = sq_pop_to_ce_req;
assign sq_wmb_merge_stall_req         = wmb_ce_create_hit_rb_idx;
assign sq_wmb_pop_to_ce_dp_req        = sq_pop_to_ce_req_unmask;
assign sq_wmb_pop_to_ce_gateclk_en    = sq_pop_to_ce_req_unmask;

//if hit rb idx, then cannot merge
// &Force("output","wmb_ce_create_hit_rb_idx"); @955
assign wmb_ce_create_hit_rb_idx = rb_sq_pop_hit_idx
                                  &&  (sq_pop_wo_st
                                      ||  sq_pop_atomic
                                      ||  sq_pop_dcache_1line_inst);

//==========================================================
//                request icc
//==========================================================
//-----------------register---------------------------------
always @(posedge sq_create_pop_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_req_icc_success  <=  1'b0;
  else if(icc_sq_grnt)
    sq_req_icc_success  <=  1'b1;
  else if(wmb_sq_pop_to_ce_grnt)
    sq_req_icc_success  <=  1'b0;
end
//-----------------wires------------------------------------
assign sq_icc_req = sq_pop_req_unmask
                    &&  sq_pop_dcache_all_inst
                    &&  !wmb_ce_vld
                    &&  !sq_req_icc_success;
assign sq_icc_clr = sq_pop_inst_size[0];
assign sq_icc_inv = sq_pop_inst_size[1];

//==========================================================
//                interface to pfu
//==========================================================
//clear all entry if sq pop a sync.i inst
assign sq_pfu_pop_synci_inst  = sq_pop_req_unmask
                                &&  !sq_pop_atomic
                                &&  sq_pop_sync_fence
                                &&  (sq_pop_inst_type[1:0]  ==  2'b00)
                                &&  sq_pop_inst_flush;


//==========================================================
//                wmb ce data path
//==========================================================
assign wmb_ce_fence_mode[3:0]   = {4{wmb_ce_sq_ptr[0]}}  & sq_entry_fence_mode_0[3:0]
                                  | {4{wmb_ce_sq_ptr[1]}}  & sq_entry_fence_mode_1[3:0]
                                  | {4{wmb_ce_sq_ptr[2]}}  & sq_entry_fence_mode_2[3:0]
                                  | {4{wmb_ce_sq_ptr[3]}}  & sq_entry_fence_mode_3[3:0]
                                  | {4{wmb_ce_sq_ptr[4]}}  & sq_entry_fence_mode_4[3:0]
                                  | {4{wmb_ce_sq_ptr[5]}}  & sq_entry_fence_mode_5[3:0]
                                  | {4{wmb_ce_sq_ptr[6]}}  & sq_entry_fence_mode_6[3:0]
                                  | {4{wmb_ce_sq_ptr[7]}}  & sq_entry_fence_mode_7[3:0]
                                  | {4{wmb_ce_sq_ptr[8]}}  & sq_entry_fence_mode_8[3:0]
                                  | {4{wmb_ce_sq_ptr[9]}}  & sq_entry_fence_mode_9[3:0]
                                  | {4{wmb_ce_sq_ptr[10]}}  & sq_entry_fence_mode_10[3:0]
                                  | {4{wmb_ce_sq_ptr[11]}}  & sq_entry_fence_mode_11[3:0];

assign wmb_ce_iid[6:0]          = {7{wmb_ce_sq_ptr[0]}}  & sq_entry_iid_0[6:0]
                                  | {7{wmb_ce_sq_ptr[1]}}  & sq_entry_iid_1[6:0]
                                  | {7{wmb_ce_sq_ptr[2]}}  & sq_entry_iid_2[6:0]
                                  | {7{wmb_ce_sq_ptr[3]}}  & sq_entry_iid_3[6:0]
                                  | {7{wmb_ce_sq_ptr[4]}}  & sq_entry_iid_4[6:0]
                                  | {7{wmb_ce_sq_ptr[5]}}  & sq_entry_iid_5[6:0]
                                  | {7{wmb_ce_sq_ptr[6]}}  & sq_entry_iid_6[6:0]
                                  | {7{wmb_ce_sq_ptr[7]}}  & sq_entry_iid_7[6:0]
                                  | {7{wmb_ce_sq_ptr[8]}}  & sq_entry_iid_8[6:0]
                                  | {7{wmb_ce_sq_ptr[9]}}  & sq_entry_iid_9[6:0]
                                  | {7{wmb_ce_sq_ptr[10]}}  & sq_entry_iid_10[6:0]
                                  | {7{wmb_ce_sq_ptr[11]}}  & sq_entry_iid_11[6:0];

assign wmb_ce_spec_fail         = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_spec_fail[SQ_ENTRY-1:0]);
assign wmb_ce_bkpta_data        = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_bkpta_data[SQ_ENTRY-1:0]);
assign wmb_ce_bkptb_data        = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_bkptb_data[SQ_ENTRY-1:0]);
assign wmb_ce_vstart_vld        = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_vstart_vld[SQ_ENTRY-1:0]);

// &CombBeg; @1028
// &CombEnd; @1044
// &CombBeg; @1046
always @( sq_entry_data_9[63:0]
       or sq_entry_data_3[63:0]
       or sq_entry_data_11[63:0]
       or sq_entry_data_5[63:0]
       or sq_entry_data_4[63:0]
       or sq_entry_data_1[63:0]
       or sq_entry_data_7[63:0]
       or wmb_ce_sq_ptr[11:0]
       or sq_entry_data_6[63:0]
       or sq_entry_data_8[63:0]
       or sq_entry_data_2[63:0]
       or sq_entry_data_10[63:0]
       or sq_entry_data_0[63:0])
begin
case(wmb_ce_sq_ptr[SQ_ENTRY-1:0])
  12'h001:  wmb_ce_data64[63:0] = sq_entry_data_0[63:0];
  12'h002:  wmb_ce_data64[63:0] = sq_entry_data_1[63:0];
  12'h004:  wmb_ce_data64[63:0] = sq_entry_data_2[63:0];
  12'h008:  wmb_ce_data64[63:0] = sq_entry_data_3[63:0];
  12'h010:  wmb_ce_data64[63:0] = sq_entry_data_4[63:0];
  12'h020:  wmb_ce_data64[63:0] = sq_entry_data_5[63:0];
  12'h040:  wmb_ce_data64[63:0] = sq_entry_data_6[63:0];
  12'h080:  wmb_ce_data64[63:0] = sq_entry_data_7[63:0];
  12'h100:  wmb_ce_data64[63:0] = sq_entry_data_8[63:0];
  12'h200:  wmb_ce_data64[63:0] = sq_entry_data_9[63:0];
  12'h400:  wmb_ce_data64[63:0] = sq_entry_data_10[63:0];
  12'h800:  wmb_ce_data64[63:0] = sq_entry_data_11[63:0];
  default:wmb_ce_data64[63:0] = {64{1'bx}};
endcase
// &CombEnd; @1062
end
assign wmb_ce_data128[127:0]  = {wmb_ce_data64[63:0],
                                wmb_ce_data64[63:0]};

// &Force("output","wmb_ce_dcache_valid"); @1067
assign wmb_ce_dcache_valid      = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_dcache_valid[SQ_ENTRY-1:0]);
// &Force("output","wmb_ce_dcache_share"); @1069
assign wmb_ce_dcache_share      = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_dcache_share[SQ_ENTRY-1:0]);
assign wmb_ce_dcache_dirty      = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_dcache_dirty[SQ_ENTRY-1:0]);
assign wmb_ce_dcache_way        = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_dcache_way[SQ_ENTRY-1:0]);
assign wmb_ce_depd              = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_depd[SQ_ENTRY-1:0]);
assign wmb_ce_depd_set          = |(wmb_ce_sq_ptr[SQ_ENTRY-1:0]  & sq_entry_depd_set[SQ_ENTRY-1:0]);

//==========================================================
//            Compare dcache write port(dcwp)
//==========================================================
// &Instance("ct_lsu_dcache_info_update","x_lsu_wmb_ce_dcache_info_update"); @1079
ct_lsu_dcache_info_update  x_lsu_wmb_ce_dcache_info_update (
  .compare_dcwp_addr          (wmb_ce_addr[39:0]         ),
  .compare_dcwp_hit_idx       (wmb_ce_dcache_hit_idx     ),
  .compare_dcwp_sw_inst       (wmb_ce_dcache_sw_inst     ),
  .compare_dcwp_update_vld    (wmb_ce_dcache_update_vld  ),
  .dcache_dirty_din           (dcache_dirty_din          ),
  .dcache_dirty_gwen          (dcache_dirty_gwen         ),
  .dcache_dirty_wen           (dcache_dirty_wen          ),
  .dcache_idx                 (dcache_idx                ),
  .dcache_tag_din             (dcache_tag_din            ),
  .dcache_tag_gwen            (dcache_tag_gwen           ),
  .dcache_tag_wen             (dcache_tag_wen            ),
  .origin_dcache_dirty        (wmb_ce_dcache_dirty       ),
  .origin_dcache_share        (wmb_ce_dcache_share       ),
  .origin_dcache_valid        (wmb_ce_dcache_valid       ),
  .origin_dcache_way          (wmb_ce_dcache_way         ),
  .update_dcache_dirty        (wmb_ce_update_dcache_dirty),
  .update_dcache_share        (wmb_ce_update_dcache_share),
  .update_dcache_valid        (wmb_ce_update_dcache_valid),
  .update_dcache_way          (wmb_ce_update_dcache_way  )
);

// &Connect( .compare_dcwp_addr          (wmb_ce_addr[`PA_WIDTH-1:0]   ), @1080
//           .compare_dcwp_sw_inst       (wmb_ce_dcache_sw_inst), @1081
//           .origin_dcache_valid        (wmb_ce_dcache_valid ), @1082
//           .origin_dcache_share        (wmb_ce_dcache_share ), @1083
//           .origin_dcache_dirty        (wmb_ce_dcache_dirty ), @1084
//           .origin_dcache_way          (wmb_ce_dcache_way   ), @1085
//           .compare_dcwp_update_vld    (wmb_ce_dcache_update_vld), @1086
//           .compare_dcwp_hit_idx       (wmb_ce_dcache_hit_idx), @1087
//           .update_dcache_valid        (wmb_ce_update_dcache_valid), @1088
//           .update_dcache_share        (wmb_ce_update_dcache_share), @1089
//           .update_dcache_dirty        (wmb_ce_update_dcache_dirty), @1090
//           .update_dcache_way          (wmb_ce_update_dcache_way  )); @1091
// &Force("nonport","wmb_ce_dcache_update_vld"); @1092
// &Force("nonport","wmb_ce_dcache_hit_idx"); @1093
//==========================================================
//                interface to idu
//==========================================================
assign lsu_rtu_all_commit_st_data_vld = &sq_entry_cmit_data_vld[SQ_ENTRY-1:0];
assign lsu_rtu_all_commit_data_vld    = lsu_rtu_all_commit_st_data_vld && lsu_rtu_all_commit_ld_data_vld;

assign lsu_idu_sq_not_full            = !sq_empty_less2;

//==========================================================
//                interface to had
//==========================================================
assign lsu_had_sq_not_empty       = !sq_empty;

assign sq_pop_st_and_atomic_inst  = sq_pop_st_inst  ||  sq_pop_atomic;

always @(posedge sq_dbg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_dbg_st_req   <=  1'b0;
  else if(wmb_sq_pop_to_ce_grnt &&  sq_pop_st_and_atomic_inst)
    sq_dbg_st_req   <=  1'b1;
  else
    sq_dbg_st_req   <=  1'b0;
end

always @(posedge sq_dbg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_dbg_pop_ptr[SQ_ENTRY-1:0]  <=  {SQ_ENTRY{1'b0}};
  else if(sq_pop_to_ce_req_unmask)
    sq_dbg_pop_ptr[SQ_ENTRY-1:0]  <=  sq_pop_ptr[SQ_ENTRY-1:0];
end

// &CombBeg; @1127
always @( sq_entry_iid_1[6:0]
       or sq_entry_iid_8[6:0]
       or sq_entry_iid_6[6:0]
       or sq_entry_iid_5[6:0]
       or sq_entry_iid_9[6:0]
       or sq_entry_iid_7[6:0]
       or sq_entry_iid_11[6:0]
       or sq_entry_iid_0[6:0]
       or sq_entry_iid_2[6:0]
       or sq_entry_iid_10[6:0]
       or sq_entry_iid_3[6:0]
       or sq_entry_iid_4[6:0]
       or sq_dbg_pop_ptr[11:0])
begin
case(sq_dbg_pop_ptr[SQ_ENTRY-1:0])
  12'b0000_0000_0001:sq_dbg_st_iid[6:0] = sq_entry_iid_0[6:0];
  12'b0000_0000_0010:sq_dbg_st_iid[6:0] = sq_entry_iid_1[6:0];
  12'b0000_0000_0100:sq_dbg_st_iid[6:0] = sq_entry_iid_2[6:0];
  12'b0000_0000_1000:sq_dbg_st_iid[6:0] = sq_entry_iid_3[6:0];
  12'b0000_0001_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_4[6:0];
  12'b0000_0010_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_5[6:0];
  12'b0000_0100_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_6[6:0];
  12'b0000_1000_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_7[6:0];
  12'b0001_0000_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_8[6:0];
  12'b0010_0000_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_9[6:0];
  12'b0100_0000_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_10[6:0];
  12'b1000_0000_0000:sq_dbg_st_iid[6:0] = sq_entry_iid_11[6:0];
  default:sq_dbg_st_iid[6:0] = {7{1'bx}};
endcase
// &CombEnd; @1143
end

// &CombBeg; @1145
always @( sq_entry_addr0_3[39:0]
       or sq_entry_addr0_7[39:0]
       or sq_entry_addr0_0[39:0]
       or sq_entry_addr0_11[39:0]
       or sq_entry_addr0_5[39:0]
       or sq_entry_addr0_10[39:0]
       or sq_entry_addr0_8[39:0]
       or sq_entry_addr0_1[39:0]
       or sq_entry_addr0_2[39:0]
       or sq_entry_addr0_6[39:0]
       or sq_dbg_pop_ptr[11:0]
       or sq_entry_addr0_9[39:0]
       or sq_entry_addr0_4[39:0])
begin
case(sq_dbg_pop_ptr[SQ_ENTRY-1:0])
  12'b0000_0000_0001:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_0[`PA_WIDTH-1:0];
  12'b0000_0000_0010:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_1[`PA_WIDTH-1:0];
  12'b0000_0000_0100:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_2[`PA_WIDTH-1:0];
  12'b0000_0000_1000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_3[`PA_WIDTH-1:0];
  12'b0000_0001_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_4[`PA_WIDTH-1:0];
  12'b0000_0010_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_5[`PA_WIDTH-1:0];
  12'b0000_0100_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_6[`PA_WIDTH-1:0];
  12'b0000_1000_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_7[`PA_WIDTH-1:0];
  12'b0001_0000_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_8[`PA_WIDTH-1:0];
  12'b0010_0000_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_9[`PA_WIDTH-1:0];
  12'b0100_0000_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_10[`PA_WIDTH-1:0];
  12'b1000_0000_0000:sq_dbg_st_addr[`PA_WIDTH-1:0] = sq_entry_addr0_11[`PA_WIDTH-1:0];
  default:sq_dbg_st_addr[`PA_WIDTH-1:0] = {`PA_WIDTH{1'bx}};
endcase
// &CombEnd; @1161
end

// &CombBeg; @1163
always @( sq_entry_bytes_vld_10[15:0]
       or sq_entry_bytes_vld_6[15:0]
       or sq_entry_bytes_vld_9[15:0]
       or sq_entry_bytes_vld_8[15:0]
       or sq_entry_bytes_vld_4[15:0]
       or sq_entry_bytes_vld_11[15:0]
       or sq_entry_bytes_vld_2[15:0]
       or sq_entry_bytes_vld_7[15:0]
       or sq_dbg_pop_ptr[11:0]
       or sq_entry_bytes_vld_0[15:0]
       or sq_entry_bytes_vld_1[15:0]
       or sq_entry_bytes_vld_5[15:0]
       or sq_entry_bytes_vld_3[15:0])
begin
case(sq_dbg_pop_ptr[SQ_ENTRY-1:0])
  12'b0000_0000_0001:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_0[15:0];
  12'b0000_0000_0010:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_1[15:0];
  12'b0000_0000_0100:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_2[15:0];
  12'b0000_0000_1000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_3[15:0];
  12'b0000_0001_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_4[15:0];
  12'b0000_0010_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_5[15:0];
  12'b0000_0100_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_6[15:0];
  12'b0000_1000_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_7[15:0];
  12'b0001_0000_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_8[15:0];
  12'b0010_0000_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_9[15:0];
  12'b0100_0000_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_10[15:0];
  12'b1000_0000_0000:sq_dbg_st_bytes_vld[15:0] = sq_entry_bytes_vld_11[15:0];
  default:sq_dbg_st_bytes_vld[15:0] = {16{1'bx}};
endcase
// &CombEnd; @1179
end

assign sq_dbg_st_bytes_vld_extend[127:0] = {{8{sq_dbg_st_bytes_vld[15]}},{8{sq_dbg_st_bytes_vld[14]}},
                                        {8{sq_dbg_st_bytes_vld[13]}},{8{sq_dbg_st_bytes_vld[12]}},
                                        {8{sq_dbg_st_bytes_vld[11]}},{8{sq_dbg_st_bytes_vld[10]}},
                                        {8{sq_dbg_st_bytes_vld[9]}},{8{sq_dbg_st_bytes_vld[8]}},
                                        {8{sq_dbg_st_bytes_vld[7]}},{8{sq_dbg_st_bytes_vld[6]}},
                                        {8{sq_dbg_st_bytes_vld[5]}},{8{sq_dbg_st_bytes_vld[4]}},
                                        {8{sq_dbg_st_bytes_vld[3]}},{8{sq_dbg_st_bytes_vld[2]}},
                                        {8{sq_dbg_st_bytes_vld[1]}},{8{sq_dbg_st_bytes_vld[0]}}};


// &CombBeg; @1191
always @( sq_entry_data_9[63:0]
       or sq_entry_data_3[63:0]
       or sq_entry_data_11[63:0]
       or sq_entry_data_5[63:0]
       or sq_entry_data_4[63:0]
       or sq_entry_data_1[63:0]
       or sq_entry_data_7[63:0]
       or sq_entry_data_6[63:0]
       or sq_entry_data_8[63:0]
       or sq_entry_data_2[63:0]
       or sq_entry_data_10[63:0]
       or sq_dbg_pop_ptr[11:0]
       or sq_entry_data_0[63:0])
begin
case(sq_dbg_pop_ptr[SQ_ENTRY-1:0])
  12'b0000_0000_0001:sq_dbg_st_data[63:0] = sq_entry_data_0[63:0];
  12'b0000_0000_0010:sq_dbg_st_data[63:0] = sq_entry_data_1[63:0];
  12'b0000_0000_0100:sq_dbg_st_data[63:0] = sq_entry_data_2[63:0];
  12'b0000_0000_1000:sq_dbg_st_data[63:0] = sq_entry_data_3[63:0];
  12'b0000_0001_0000:sq_dbg_st_data[63:0] = sq_entry_data_4[63:0];
  12'b0000_0010_0000:sq_dbg_st_data[63:0] = sq_entry_data_5[63:0];
  12'b0000_0100_0000:sq_dbg_st_data[63:0] = sq_entry_data_6[63:0];
  12'b0000_1000_0000:sq_dbg_st_data[63:0] = sq_entry_data_7[63:0];
  12'b0001_0000_0000:sq_dbg_st_data[63:0] = sq_entry_data_8[63:0];
  12'b0010_0000_0000:sq_dbg_st_data[63:0] = sq_entry_data_9[63:0];
  12'b0100_0000_0000:sq_dbg_st_data[63:0] = sq_entry_data_10[63:0];
  12'b1000_0000_0000:sq_dbg_st_data[63:0] = sq_entry_data_11[63:0];
  default:sq_dbg_st_data[63:0] = {64{1'bx}};
endcase
// &CombEnd; @1207
end

assign sq_dbg_st_data_after_mask[127:0]  = {sq_dbg_st_data[63:0],sq_dbg_st_data[63:0]}
                                            & sq_dbg_st_bytes_vld_extend[127:0];
assign sq_dbg_st_data_compress64[63:0] = sq_dbg_st_data_after_mask[63:0]  ^ sq_dbg_st_data_after_mask[127:64];

always @(posedge sq_dbg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_dbg_st_req_ff  <=  1'b0;
  else if(sq_dbg_st_req)
    sq_dbg_st_req_ff  <=  1'b1;
  else
    sq_dbg_st_req_ff  <=  1'b0;
end

always @(posedge sq_dbg_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sq_dbg_st_addr_ff[`PA_WIDTH-1:0] <=  {`PA_WIDTH{1'b0}};
    sq_dbg_st_data_ff[63:0] <=  64'b0;
    sq_dbg_st_iid_ff[6:0]   <=  7'b0;
  end
  else if(sq_dbg_st_req)
  begin
    sq_dbg_st_addr_ff[`PA_WIDTH-1:0] <=  sq_dbg_st_addr[`PA_WIDTH-1:0];
    sq_dbg_st_data_ff[63:0] <=  sq_dbg_st_data_compress64[63:0];
    sq_dbg_st_iid_ff[6:0]   <=  sq_dbg_st_iid[6:0];
  end
end

//ebiu r channel
// &Instance("gated_clk_cell", "x_lsu_wb_dbg_r_gated_clk"); @1247
// &Connect(.clk_in        (forever_cpuclk     ), @1248
//          .external_en   (1'b0               ), @1249
//          .global_en     (cp0_yy_clk_en      ), @1250
//          .module_en     (cp0_lsu_icg_en     ), @1251
//          .local_en      (wb_dbg_r_clk_en      ), @1252
//          .clk_out       (wb_dbg_r_clk         )); @1253
assign wb_dbg_r_req_ff    = 1'b0;
assign wb_dbg_r_id[7:0]   = 8'b0;
assign wb_dbg_r_resp[3:0] = 4'b0;
assign wb_dbg_r_last      = 1'b0;

assign lsu_had_st_req         = had_lsu_bus_trace_en
                                ? wb_dbg_r_req_ff
                                : sq_dbg_st_req_ff;
assign lsu_had_st_addr[`PA_WIDTH-1:0]  = had_lsu_bus_trace_en
                                         ? {`PA_WIDTH{1'b0}}
                                         : sq_dbg_st_addr_ff[`PA_WIDTH-1:0];
assign lsu_had_st_data[63:0]  = had_lsu_bus_trace_en
                                ? {51'b0, 
                                   wb_dbg_r_last,
                                   wb_dbg_r_resp[3:0],
                                   wb_dbg_r_id[7:0]}
                                : sq_dbg_st_data_ff[63:0];
assign lsu_had_st_iid[6:0]    = had_lsu_bus_trace_en
                                ? 7'b0
                                : sq_dbg_st_iid_ff[6:0];

assign lsu_had_st_type[3:0]   = had_lsu_bus_trace_en
                                ? 4'd5
                                : 4'd3;


// &ModuleEnd; @1308
endmodule


