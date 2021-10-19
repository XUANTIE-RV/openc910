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

// &ModuleBeg; @29
module ct_lsu_sq_entry(
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
  ld_da_lsid,
  ld_dc_addr0,
  ld_dc_addr1_11to4,
  ld_dc_bytes_vld,
  ld_dc_bytes_vld1,
  ld_dc_chk_atomic_inst_vld,
  ld_dc_chk_ld_addr1_vld,
  ld_dc_chk_ld_bypass_vld,
  ld_dc_chk_ld_inst_vld,
  ld_dc_iid,
  pad_yy_icg_scan_en,
  rtu_lsu_async_flush,
  rtu_lsu_commit0_iid_updt_val,
  rtu_lsu_commit1_iid_updt_val,
  rtu_lsu_commit2_iid_updt_val,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit2,
  rtu_yy_xx_flush,
  sd_ex1_inst_vld,
  sd_rf_ex1_sdid,
  sd_rf_inst_vld_short,
  sq_age_vec_set,
  sq_create_age_vec,
  sq_create_pop_clk,
  sq_create_same_addr_newest,
  sq_create_success,
  sq_create_vld,
  sq_data_settle,
  sq_entry_addr0_v,
  sq_entry_addr1_dep_discard_x,
  sq_entry_age_vec_surplus1_ptr_x,
  sq_entry_age_vec_zero_ptr_x,
  sq_entry_atomic_x,
  sq_entry_bkpta_data_x,
  sq_entry_bkptb_data_x,
  sq_entry_bytes_vld_v,
  sq_entry_cancel_acc_req_x,
  sq_entry_cancel_ahead_wb_x,
  sq_entry_cmit_data_vld_x,
  sq_entry_cmit_x,
  sq_entry_create_dp_vld_x,
  sq_entry_create_gateclk_en_x,
  sq_entry_create_vld_x,
  sq_entry_data_depd_wakeup_v,
  sq_entry_data_discard_grnt_x,
  sq_entry_data_discard_req_short_x,
  sq_entry_data_discard_req_x,
  sq_entry_data_v,
  sq_entry_dcache_dirty_x,
  sq_entry_dcache_info_vld_x,
  sq_entry_dcache_share_x,
  sq_entry_dcache_valid_x,
  sq_entry_dcache_way_x,
  sq_entry_depd_set_x,
  sq_entry_depd_x,
  sq_entry_discard_req_x,
  sq_entry_fence_mode_v,
  sq_entry_fwd_bypass_req_x,
  sq_entry_fwd_multi_depd_set_x,
  sq_entry_fwd_req_x,
  sq_entry_icc_x,
  sq_entry_iid_v,
  sq_entry_inst_flush_x,
  sq_entry_inst_hit_x,
  sq_entry_inst_mode_v,
  sq_entry_inst_size_v,
  sq_entry_inst_type_v,
  sq_entry_newest_fwd_req_data_vld_short_x,
  sq_entry_newest_fwd_req_data_vld_x,
  sq_entry_page_buf_x,
  sq_entry_page_ca_x,
  sq_entry_page_sec_x,
  sq_entry_page_share_x,
  sq_entry_page_so_x,
  sq_entry_page_wa_x,
  sq_entry_pop_req_x,
  sq_entry_pop_to_ce_grnt_b,
  sq_entry_pop_to_ce_grnt_x,
  sq_entry_priv_mode_v,
  sq_entry_rot_sel_v,
  sq_entry_same_addr_newest_x,
  sq_entry_settle_data_hit_x,
  sq_entry_spec_fail_x,
  sq_entry_st_dc_create_age_vec_x,
  sq_entry_st_dc_same_addr_newer_x,
  sq_entry_sync_fence_x,
  sq_entry_vld_x,
  sq_entry_vstart_vld_x,
  sq_entry_wo_st_x,
  sq_pop_ptr_x,
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
  st_dc_rot_sel_rev,
  st_dc_sdid,
  st_dc_sdid_hit,
  st_dc_secd,
  st_dc_sq_data_vld,
  st_dc_sync_fence,
  st_dc_wo_st_inst,
  wmb_sq_pop_grnt
);

// &Ports; @30
input           cp0_lsu_icg_en;                          
input           cp0_yy_clk_en;                           
input   [1 :0]  cp0_yy_priv_mode;                        
input           cpurst_b;                                
input   [6 :0]  dcache_dirty_din;                        
input           dcache_dirty_gwen;                       
input   [6 :0]  dcache_dirty_wen;                        
input   [8 :0]  dcache_idx;                              
input   [51:0]  dcache_tag_din;                          
input           dcache_tag_gwen;                         
input   [1 :0]  dcache_tag_wen;                          
input           forever_cpuclk;                          
input   [11:0]  ld_da_lsid;                              
input   [39:0]  ld_dc_addr0;                             
input   [7 :0]  ld_dc_addr1_11to4;                       
input   [15:0]  ld_dc_bytes_vld;                         
input   [15:0]  ld_dc_bytes_vld1;                        
input           ld_dc_chk_atomic_inst_vld;               
input           ld_dc_chk_ld_addr1_vld;                  
input           ld_dc_chk_ld_bypass_vld;                 
input           ld_dc_chk_ld_inst_vld;                   
input   [6 :0]  ld_dc_iid;                               
input           pad_yy_icg_scan_en;                      
input           rtu_lsu_async_flush;                     
input   [6 :0]  rtu_lsu_commit0_iid_updt_val;            
input   [6 :0]  rtu_lsu_commit1_iid_updt_val;            
input   [6 :0]  rtu_lsu_commit2_iid_updt_val;            
input           rtu_yy_xx_commit0;                       
input           rtu_yy_xx_commit1;                       
input           rtu_yy_xx_commit2;                       
input           rtu_yy_xx_flush;                         
input           sd_ex1_inst_vld;                         
input   [3 :0]  sd_rf_ex1_sdid;                          
input           sd_rf_inst_vld_short;                    
input           sq_age_vec_set;                          
input   [11:0]  sq_create_age_vec;                       
input           sq_create_pop_clk;                       
input           sq_create_same_addr_newest;              
input           sq_create_success;                       
input   [11:0]  sq_create_vld;                           
input   [63:0]  sq_data_settle;                          
input           sq_entry_create_dp_vld_x;                
input           sq_entry_create_gateclk_en_x;            
input           sq_entry_create_vld_x;                   
input           sq_entry_data_discard_grnt_x;            
input           sq_entry_fwd_multi_depd_set_x;           
input   [11:0]  sq_entry_pop_to_ce_grnt_b;               
input           sq_entry_pop_to_ce_grnt_x;               
input           sq_pop_ptr_x;                            
input           st_da_bkpta_data;                        
input           st_da_bkptb_data;                        
input   [6 :0]  st_da_iid;                               
input           st_da_inst_vld;                          
input           st_da_secd;                              
input           st_da_sq_dcache_dirty;                   
input           st_da_sq_dcache_share;                   
input           st_da_sq_dcache_valid;                   
input           st_da_sq_dcache_way;                     
input           st_da_sq_ecc_stall;                      
input           st_da_sq_no_restart;                     
input           st_da_wb_expt_vld;                       
input           st_da_wb_spec_fail;                      
input           st_da_wb_vstart_vld;                     
input   [39:0]  st_dc_addr0;                             
input           st_dc_atomic;                            
input           st_dc_boundary;                          
input           st_dc_boundary_first;                    
input   [15:0]  st_dc_bytes_vld;                         
input           st_dc_cmit0_iid_crt_hit;                 
input           st_dc_cmit1_iid_crt_hit;                 
input           st_dc_cmit2_iid_crt_hit;                 
input           st_dc_da_page_buf;                       
input           st_dc_da_page_ca;                        
input           st_dc_da_page_sec;                       
input           st_dc_da_page_share;                     
input           st_dc_da_page_so;                        
input           st_dc_da_page_wa;                        
input   [3 :0]  st_dc_fence_mode;                        
input           st_dc_icc;                               
input   [6 :0]  st_dc_iid;                               
input           st_dc_inst_flush;                        
input   [1 :0]  st_dc_inst_mode;                         
input   [2 :0]  st_dc_inst_size;                         
input   [1 :0]  st_dc_inst_type;                         
input   [7 :0]  st_dc_rot_sel_rev;                       
input   [3 :0]  st_dc_sdid;                              
input           st_dc_sdid_hit;                          
input           st_dc_secd;                              
input           st_dc_sq_data_vld;                       
input           st_dc_sync_fence;                        
input           st_dc_wo_st_inst;                        
input           wmb_sq_pop_grnt;                         
output  [39:0]  sq_entry_addr0_v;                        
output          sq_entry_addr1_dep_discard_x;            
output          sq_entry_age_vec_surplus1_ptr_x;         
output          sq_entry_age_vec_zero_ptr_x;             
output          sq_entry_atomic_x;                       
output          sq_entry_bkpta_data_x;                   
output          sq_entry_bkptb_data_x;                   
output  [15:0]  sq_entry_bytes_vld_v;                    
output          sq_entry_cancel_acc_req_x;               
output          sq_entry_cancel_ahead_wb_x;              
output          sq_entry_cmit_data_vld_x;                
output          sq_entry_cmit_x;                         
output  [11:0]  sq_entry_data_depd_wakeup_v;             
output          sq_entry_data_discard_req_short_x;       
output          sq_entry_data_discard_req_x;             
output  [63:0]  sq_entry_data_v;                         
output          sq_entry_dcache_dirty_x;                 
output          sq_entry_dcache_info_vld_x;              
output          sq_entry_dcache_share_x;                 
output          sq_entry_dcache_valid_x;                 
output          sq_entry_dcache_way_x;                   
output          sq_entry_depd_set_x;                     
output          sq_entry_depd_x;                         
output          sq_entry_discard_req_x;                  
output  [3 :0]  sq_entry_fence_mode_v;                   
output          sq_entry_fwd_bypass_req_x;               
output          sq_entry_fwd_req_x;                      
output          sq_entry_icc_x;                          
output  [6 :0]  sq_entry_iid_v;                          
output          sq_entry_inst_flush_x;                   
output          sq_entry_inst_hit_x;                     
output  [1 :0]  sq_entry_inst_mode_v;                    
output  [2 :0]  sq_entry_inst_size_v;                    
output  [1 :0]  sq_entry_inst_type_v;                    
output          sq_entry_newest_fwd_req_data_vld_short_x; 
output          sq_entry_newest_fwd_req_data_vld_x;      
output          sq_entry_page_buf_x;                     
output          sq_entry_page_ca_x;                      
output          sq_entry_page_sec_x;                     
output          sq_entry_page_share_x;                   
output          sq_entry_page_so_x;                      
output          sq_entry_page_wa_x;                      
output          sq_entry_pop_req_x;                      
output  [1 :0]  sq_entry_priv_mode_v;                    
output  [7 :0]  sq_entry_rot_sel_v;                      
output          sq_entry_same_addr_newest_x;             
output          sq_entry_settle_data_hit_x;              
output          sq_entry_spec_fail_x;                    
output          sq_entry_st_dc_create_age_vec_x;         
output          sq_entry_st_dc_same_addr_newer_x;        
output          sq_entry_sync_fence_x;                   
output          sq_entry_vld_x;                          
output          sq_entry_vstart_vld_x;                   
output          sq_entry_wo_st_x;                        

// &Regs; @31
reg     [39:0]  sq_entry_addr0;                          
reg     [11:0]  sq_entry_age_vec;                        
reg     [11:0]  sq_entry_age_vec_1;                      
reg             sq_entry_atomic;                         
reg             sq_entry_bkpta_data;                     
reg             sq_entry_bkptb_data;                     
reg             sq_entry_bond_first_only;                
reg             sq_entry_boundary;                       
reg     [15:0]  sq_entry_bytes_vld;                      
reg             sq_entry_cmit;                           
reg             sq_entry_cmit0_iid_hit;                  
reg             sq_entry_cmit1_iid_hit;                  
reg             sq_entry_cmit2_iid_hit;                  
reg     [63:0]  sq_entry_data;                           
reg             sq_entry_data_set_ff;                    
reg             sq_entry_data_vld;                       
reg             sq_entry_dcache_dirty;                   
reg             sq_entry_dcache_info_vld;                
reg             sq_entry_dcache_share;                   
reg             sq_entry_dcache_valid;                   
reg             sq_entry_dcache_way;                     
reg             sq_entry_depd;                           
reg     [3 :0]  sq_entry_fence_mode;                     
reg             sq_entry_icc;                            
reg     [6 :0]  sq_entry_iid;                            
reg             sq_entry_in_wmb_ce;                      
reg             sq_entry_inst_flush;                     
reg     [1 :0]  sq_entry_inst_mode;                      
reg     [2 :0]  sq_entry_inst_size;                      
reg     [1 :0]  sq_entry_inst_type;                      
reg             sq_entry_no_restart;                     
reg             sq_entry_page_buf;                       
reg             sq_entry_page_ca;                        
reg             sq_entry_page_sec;                       
reg             sq_entry_page_share;                     
reg             sq_entry_page_so;                        
reg             sq_entry_page_wa;                        
reg     [1 :0]  sq_entry_priv_mode;                      
reg     [7 :0]  sq_entry_rot_sel;                        
reg             sq_entry_same_addr_newest;               
reg     [3 :0]  sq_entry_sdid;                           
reg             sq_entry_secd;                           
reg             sq_entry_spec_fail;                      
reg             sq_entry_st_data_sdid_hit;               
reg             sq_entry_sync_fence;                     
reg             sq_entry_vld;                            
reg             sq_entry_vstart_vld;                     
reg     [11:0]  sq_entry_wakeup_queue;                   
reg             sq_entry_wo_st;                          

// &Wires; @32
wire            cp0_lsu_icg_en;                          
wire            cp0_yy_clk_en;                           
wire    [1 :0]  cp0_yy_priv_mode;                        
wire            cpurst_b;                                
wire    [6 :0]  dcache_dirty_din;                        
wire            dcache_dirty_gwen;                       
wire    [6 :0]  dcache_dirty_wen;                        
wire    [8 :0]  dcache_idx;                              
wire    [51:0]  dcache_tag_din;                          
wire            dcache_tag_gwen;                         
wire    [1 :0]  dcache_tag_wen;                          
wire            forever_cpuclk;                          
wire    [11:0]  ld_da_lsid;                              
wire    [39:0]  ld_dc_addr0;                             
wire    [7 :0]  ld_dc_addr1_11to4;                       
wire    [15:0]  ld_dc_bytes_vld;                         
wire    [15:0]  ld_dc_bytes_vld1;                        
wire            ld_dc_chk_atomic_inst_vld;               
wire            ld_dc_chk_ld_addr1_vld;                  
wire            ld_dc_chk_ld_bypass_vld;                 
wire            ld_dc_chk_ld_inst_vld;                   
wire    [6 :0]  ld_dc_iid;                               
wire            pad_yy_icg_scan_en;                      
wire            rtu_lsu_async_flush;                     
wire    [6 :0]  rtu_lsu_commit0_iid_updt_val;            
wire    [6 :0]  rtu_lsu_commit1_iid_updt_val;            
wire    [6 :0]  rtu_lsu_commit2_iid_updt_val;            
wire            rtu_yy_xx_commit0;                       
wire            rtu_yy_xx_commit1;                       
wire            rtu_yy_xx_commit2;                       
wire            rtu_yy_xx_flush;                         
wire            sd_ex1_inst_vld;                         
wire    [3 :0]  sd_rf_ex1_sdid;                          
wire            sd_rf_inst_vld_short;                    
wire            sq_age_vec_set;                          
wire            sq_bond_secd_create_vld;                 
wire    [11:0]  sq_create_age_vec;                       
wire            sq_create_pop_clk;                       
wire            sq_create_same_addr_newest;              
wire            sq_create_success;                       
wire    [11:0]  sq_create_vld;                           
wire    [63:0]  sq_data_settle;                          
wire    [39:0]  sq_entry_addr0_v;                        
wire            sq_entry_addr1_dep_discard;              
wire            sq_entry_addr1_dep_discard_x;            
wire            sq_entry_addr_11to4_hit_st_dc;           
wire    [11:0]  sq_entry_age_vec_create;                 
wire            sq_entry_age_vec_less2;                  
wire    [11:0]  sq_entry_age_vec_next;                   
wire            sq_entry_age_vec_surplus1_ptr;           
wire            sq_entry_age_vec_surplus1_ptr_x;         
wire            sq_entry_age_vec_zero;                   
wire            sq_entry_age_vec_zero_ptr;               
wire            sq_entry_age_vec_zero_ptr_x;             
wire            sq_entry_and_ld_dc_bytes_vld1_hit;       
wire            sq_entry_and_ld_dc_bytes_vld_hit;        
wire            sq_entry_atomic_x;                       
wire            sq_entry_bkpta_data_x;                   
wire            sq_entry_bkptb_data_x;                   
wire    [15:0]  sq_entry_bytes_vld_v;                    
wire            sq_entry_cancel_acc_req;                 
wire            sq_entry_cancel_acc_req_x;               
wire            sq_entry_cancel_ahead_wb;                
wire            sq_entry_cancel_ahead_wb_x;              
wire            sq_entry_clk;                            
wire            sq_entry_clk_en;                         
wire            sq_entry_cmit0_iid_pre_hit;              
wire            sq_entry_cmit1_iid_pre_hit;              
wire            sq_entry_cmit2_iid_pre_hit;              
wire            sq_entry_cmit_data_not_vld;              
wire            sq_entry_cmit_data_vld;                  
wire            sq_entry_cmit_data_vld_x;                
wire            sq_entry_cmit_hit0;                      
wire            sq_entry_cmit_hit1;                      
wire            sq_entry_cmit_hit2;                      
wire            sq_entry_cmit_set;                       
wire            sq_entry_cmit_x;                         
wire            sq_entry_create_clk;                     
wire            sq_entry_create_clk_en;                  
wire            sq_entry_create_da_clk;                  
wire            sq_entry_create_da_clk_en;               
wire            sq_entry_create_dp_vld;                  
wire            sq_entry_create_dp_vld_x;                
wire            sq_entry_create_gateclk_en;              
wire            sq_entry_create_gateclk_en_x;            
wire            sq_entry_create_vld;                     
wire            sq_entry_create_vld_x;                   
wire            sq_entry_data_clk;                       
wire            sq_entry_data_clk_en;                    
wire    [11:0]  sq_entry_data_depd_wakeup;               
wire    [11:0]  sq_entry_data_depd_wakeup_v;             
wire            sq_entry_data_depd_wakeup_vld;           
wire            sq_entry_data_discard_grnt;              
wire            sq_entry_data_discard_grnt_x;            
wire            sq_entry_data_discard_req;               
wire            sq_entry_data_discard_req_short;         
wire            sq_entry_data_discard_req_short_x;       
wire            sq_entry_data_discard_req_x;             
wire            sq_entry_data_set;                       
wire    [63:0]  sq_entry_data_v;                         
wire            sq_entry_data_vld_now;                   
wire            sq_entry_dcache_dirty_x;                 
wire            sq_entry_dcache_hit_idx;                 
wire            sq_entry_dcache_info_vld_x;              
wire            sq_entry_dcache_inst;                    
wire            sq_entry_dcache_share_x;                 
wire            sq_entry_dcache_sw_inst;                 
wire            sq_entry_dcache_update_vld;              
wire            sq_entry_dcache_update_vld_unmask;       
wire            sq_entry_dcache_valid_x;                 
wire            sq_entry_dcache_way_x;                   
wire            sq_entry_depd_addr0_11to4_hit;           
wire            sq_entry_depd_addr1_11to4_hit;           
wire            sq_entry_depd_addr1_tto4_hit;            
wire            sq_entry_depd_addr_tto12_hit;            
wire            sq_entry_depd_addr_tto4_hit;             
wire            sq_entry_depd_bv1_do_hit;                
wire            sq_entry_depd_do_hit;                    
wire            sq_entry_depd_exact_hit;                 
wire            sq_entry_depd_hit1;                      
wire            sq_entry_depd_hit2;                      
wire            sq_entry_depd_hit3;                      
wire            sq_entry_depd_hit4;                      
wire            sq_entry_depd_hit5;                      
wire            sq_entry_depd_hit6;                      
wire            sq_entry_depd_hit7;                      
wire            sq_entry_depd_hit8;                      
wire            sq_entry_depd_part_hit;                  
wire            sq_entry_depd_set;                       
wire            sq_entry_depd_set_x;                     
wire            sq_entry_depd_whole_hit;                 
wire            sq_entry_depd_x;                         
wire            sq_entry_discard_req;                    
wire            sq_entry_discard_req_x;                  
wire            sq_entry_expt_pop_vld;                   
wire    [3 :0]  sq_entry_fence_mode_v;                   
wire            sq_entry_flush_pop_vld;                  
wire    [39:0]  sq_entry_from_ld_dc_addr0;               
wire            sq_entry_fwd_bypass_req;                 
wire            sq_entry_fwd_bypass_req_x;               
wire            sq_entry_fwd_multi_depd_set;             
wire            sq_entry_fwd_multi_depd_set_x;           
wire            sq_entry_fwd_req;                        
wire            sq_entry_fwd_req_x;                      
wire            sq_entry_has_wait_restart;               
wire            sq_entry_icc_x;                          
wire            sq_entry_iid_newer_than_st_dc;           
wire            sq_entry_iid_older_than_ld_dc;           
wire    [6 :0]  sq_entry_iid_v;                          
wire            sq_entry_inst_flush_x;                   
wire            sq_entry_inst_hit;                       
wire            sq_entry_inst_hit_x;                     
wire    [1 :0]  sq_entry_inst_mode_v;                    
wire    [2 :0]  sq_entry_inst_size_v;                    
wire    [1 :0]  sq_entry_inst_type_v;                    
wire            sq_entry_inst_vls;                       
wire            sq_entry_newer_than_st_dc;               
wire            sq_entry_newest_fwd_req_data_vld;        
wire            sq_entry_newest_fwd_req_data_vld_short;  
wire            sq_entry_newest_fwd_req_data_vld_short_x; 
wire            sq_entry_newest_fwd_req_data_vld_x;      
wire            sq_entry_not_and_ld_dc_bytes_vld_hit;    
wire            sq_entry_older_than_ld_dc;               
wire            sq_entry_page_buf_x;                     
wire            sq_entry_page_ca_x;                      
wire            sq_entry_page_sec_x;                     
wire            sq_entry_page_share_x;                   
wire            sq_entry_page_so_x;                      
wire            sq_entry_page_wa_x;                      
wire            sq_entry_pop_req;                        
wire            sq_entry_pop_req_x;                      
wire            sq_entry_pop_to_ce_grnt;                 
wire    [11:0]  sq_entry_pop_to_ce_grnt_b;               
wire            sq_entry_pop_to_ce_grnt_x;               
wire            sq_entry_pop_vld;                        
wire    [1 :0]  sq_entry_priv_mode_v;                    
wire    [7 :0]  sq_entry_rot_sel_v;                      
wire            sq_entry_same_addr_newest_clr;           
wire            sq_entry_same_addr_newest_x;             
wire            sq_entry_sdid_hit;                       
wire            sq_entry_settle_data_hit;                
wire            sq_entry_settle_data_hit_x;              
wire            sq_entry_spec_fail_x;                    
wire            sq_entry_st_da_info_set;                 
wire            sq_entry_st_dc_bv_do_hit;                
wire            sq_entry_st_dc_create_age_vec;           
wire            sq_entry_st_dc_create_age_vec_x;         
wire            sq_entry_st_dc_same_addr_newer;          
wire            sq_entry_st_dc_same_addr_newer_x;        
wire            sq_entry_st_inst;                        
wire            sq_entry_sync_fence_x;                   
wire            sq_entry_update_dcache_dirty;            
wire            sq_entry_update_dcache_share;            
wire            sq_entry_update_dcache_valid;            
wire            sq_entry_update_dcache_way;              
wire            sq_entry_vld_x;                          
wire            sq_entry_vstart_vld_x;                   
wire            sq_entry_wakeup_queue_clk;               
wire            sq_entry_wakeup_queue_clk_en;            
wire            sq_entry_wo_st_inst;                     
wire            sq_entry_wo_st_x;                        
wire            sq_pop_ptr;                              
wire            sq_pop_ptr_x;                            
wire            st_da_bkpta_data;                        
wire            st_da_bkptb_data;                        
wire    [6 :0]  st_da_iid;                               
wire            st_da_inst_vld;                          
wire            st_da_secd;                              
wire            st_da_sq_dcache_dirty;                   
wire            st_da_sq_dcache_share;                   
wire            st_da_sq_dcache_valid;                   
wire            st_da_sq_dcache_way;                     
wire            st_da_sq_ecc_stall;                      
wire            st_da_sq_no_restart;                     
wire            st_da_wb_expt_vld;                       
wire            st_da_wb_spec_fail;                      
wire            st_da_wb_vstart_vld;                     
wire    [39:0]  st_dc_addr0;                             
wire            st_dc_atomic;                            
wire            st_dc_boundary;                          
wire            st_dc_boundary_first;                    
wire    [15:0]  st_dc_bytes_vld;                         
wire            st_dc_cmit0_iid_crt_hit;                 
wire            st_dc_cmit1_iid_crt_hit;                 
wire            st_dc_cmit2_iid_crt_hit;                 
wire            st_dc_da_page_buf;                       
wire            st_dc_da_page_ca;                        
wire            st_dc_da_page_sec;                       
wire            st_dc_da_page_share;                     
wire            st_dc_da_page_so;                        
wire            st_dc_da_page_wa;                        
wire    [3 :0]  st_dc_fence_mode;                        
wire            st_dc_icc;                               
wire    [6 :0]  st_dc_iid;                               
wire            st_dc_inst_flush;                        
wire    [1 :0]  st_dc_inst_mode;                         
wire    [2 :0]  st_dc_inst_size;                         
wire    [1 :0]  st_dc_inst_type;                         
wire    [7 :0]  st_dc_rot_sel_rev;                       
wire    [3 :0]  st_dc_sdid;                              
wire            st_dc_sdid_hit;                          
wire            st_dc_secd;                              
wire            st_dc_sq_data_vld;                       
wire            st_dc_sync_fence;                        
wire            st_dc_wo_st_inst;                        
wire            wmb_sq_pop_grnt;                         


parameter SQ_ENTRY    = 12,
          LSIQ_ENTRY  = 12;


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//----------entry gateclk---------------
assign sq_entry_clk_en  = sq_entry_vld
                          ||  sq_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_sq_entry_gated_clk"); @44
gated_clk_cell  x_lsu_sq_entry_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (sq_entry_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (sq_entry_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @45
//          .external_en   (1'b0               ), @46
//          .global_en     (cp0_yy_clk_en      ), @47
//          .module_en     (cp0_lsu_icg_en     ), @48
//          .local_en      (sq_entry_clk_en    ), @49
//          .clk_out       (sq_entry_clk       )); @50

//--------create update gateclk---------
assign sq_entry_create_clk_en  = sq_entry_create_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_sq_entry_create_gated_clk"); @54
gated_clk_cell  x_lsu_sq_entry_create_gated_clk (
  .clk_in                 (forever_cpuclk        ),
  .clk_out                (sq_entry_create_clk   ),
  .external_en            (1'b0                  ),
  .global_en              (cp0_yy_clk_en         ),
  .local_en               (sq_entry_create_clk_en),
  .module_en              (cp0_lsu_icg_en        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect(.clk_in        (forever_cpuclk     ), @55
//          .external_en   (1'b0               ), @56
//          .global_en     (cp0_yy_clk_en      ), @57
//          .module_en     (cp0_lsu_icg_en     ), @58
//          .local_en      (sq_entry_create_clk_en), @59
//          .clk_out       (sq_entry_create_clk)); @60

assign sq_entry_create_da_clk_en  = sq_entry_create_gateclk_en
                                    || sq_entry_st_da_info_set;
// &Instance("gated_clk_cell", "x_lsu_sq_entry_create_da_gated_clk"); @64
gated_clk_cell  x_lsu_sq_entry_create_da_gated_clk (
  .clk_in                    (forever_cpuclk           ),
  .clk_out                   (sq_entry_create_da_clk   ),
  .external_en               (1'b0                     ),
  .global_en                 (cp0_yy_clk_en            ),
  .local_en                  (sq_entry_create_da_clk_en),
  .module_en                 (cp0_lsu_icg_en           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect(.clk_in        (forever_cpuclk     ), @65
//          .external_en   (1'b0               ), @66
//          .global_en     (cp0_yy_clk_en      ), @67
//          .module_en     (cp0_lsu_icg_en     ), @68
//          .local_en      (sq_entry_create_da_clk_en), @69
//          .clk_out       (sq_entry_create_da_clk)); @70


//----------data gateclk----------------
assign sq_entry_data_clk_en = sq_entry_data_set;
// &Instance("gated_clk_cell", "x_lsu_sq_entry_data_gated_clk"); @75
gated_clk_cell  x_lsu_sq_entry_data_gated_clk (
  .clk_in               (forever_cpuclk      ),
  .clk_out              (sq_entry_data_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (sq_entry_data_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (forever_cpuclk     ), @76
//          .external_en   (1'b0               ), @77
//          .global_en     (cp0_yy_clk_en      ), @78
//          .module_en     (cp0_lsu_icg_en     ), @79
//          .local_en      (sq_entry_data_clk_en), @80
//          .clk_out       (sq_entry_data_clk)); @81

//--------wakeup queue gateclk----------
assign sq_entry_wakeup_queue_clk_en = sq_entry_data_discard_grnt
                                      ||  (sq_entry_data_set
                                              ||  sq_entry_data_set_ff
                                              ||  rtu_yy_xx_flush)
                                          &&  sq_entry_has_wait_restart;
// &Instance("gated_clk_cell", "x_lsu_sq_entry_wakeup_queue_gated_clk"); @89
gated_clk_cell  x_lsu_sq_entry_wakeup_queue_gated_clk (
  .clk_in                       (forever_cpuclk              ),
  .clk_out                      (sq_entry_wakeup_queue_clk   ),
  .external_en                  (1'b0                        ),
  .global_en                    (cp0_yy_clk_en               ),
  .local_en                     (sq_entry_wakeup_queue_clk_en),
  .module_en                    (cp0_lsu_icg_en              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);

// &Connect(.clk_in        (forever_cpuclk     ), @90
//          .external_en   (1'b0               ), @91
//          .global_en     (cp0_yy_clk_en      ), @92
//          .module_en     (cp0_lsu_icg_en     ), @93
//          .local_en      (sq_entry_wakeup_queue_clk_en), @94
//          .clk_out       (sq_entry_wakeup_queue_clk)); @95

//==========================================================
//                 Register
//==========================================================
//+-----------+
//| entry_vld |
//+-----------+
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_vld              <=  1'b0;
  else if(sq_entry_pop_vld
    ||  rtu_lsu_async_flush
    ||  sq_entry_flush_pop_vld
    ||  sq_entry_expt_pop_vld)
    sq_entry_vld              <=  1'b0;
  else if(sq_entry_create_vld)
    sq_entry_vld              <=  1'b1;
end

//+-----------+
//| in wmb ce |
//+-----------+
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_in_wmb_ce        <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_in_wmb_ce        <=  1'b0;
  else if(sq_entry_pop_to_ce_grnt)
    sq_entry_in_wmb_ce        <=  1'b1;
end

//+-----------+
//| fwd_en    |
//+-----------+
// for most multi forward situation, use this bit for newest forward
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_same_addr_newest       <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_same_addr_newest       <=  sq_create_same_addr_newest;
  else if(sq_entry_same_addr_newest_clr)
    sq_entry_same_addr_newest       <=  1'b0;
end
//+-------------------------+
//| instruction information |
//+-------------------------+
always @(posedge sq_entry_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sq_entry_sync_fence       <=  1'b0;
    sq_entry_atomic           <=  1'b0;
    sq_entry_icc              <=  1'b0;
    sq_entry_inst_flush       <=  1'b0;
    sq_entry_inst_type[1:0]   <=  2'b0;
    sq_entry_inst_size[2:0]   <=  3'b0;
    sq_entry_inst_mode[1:0]   <=  2'b0;
    sq_entry_fence_mode[3:0]  <=  4'b0;
    sq_entry_iid[6:0]         <=  7'b0;
    sq_entry_sdid[3:0]        <=  4'b0;
    sq_entry_page_share       <=  1'b0;
    sq_entry_page_so          <=  1'b0;
    sq_entry_page_ca          <=  1'b0;
    sq_entry_page_wa          <=  1'b0;
    sq_entry_page_buf         <=  1'b0;
    sq_entry_page_sec         <=  1'b0;
    sq_entry_wo_st            <=  1'b0;
    sq_entry_boundary         <=  1'b0;
    sq_entry_secd             <=  1'b0;
    sq_entry_addr0[`PA_WIDTH-1:0] <=  {`PA_WIDTH{1'b0}};
    sq_entry_bytes_vld[15:0]  <=  16'b0;
    sq_entry_priv_mode[1:0]   <=  2'b0;
    sq_entry_rot_sel[7:0]     <=  8'b0;
  end
  else if(sq_entry_create_dp_vld)
  begin
    sq_entry_sync_fence       <=  st_dc_sync_fence;
    sq_entry_atomic           <=  st_dc_atomic;
    sq_entry_icc              <=  st_dc_icc;
    sq_entry_inst_flush       <=  st_dc_inst_flush;
    sq_entry_inst_type[1:0]   <=  st_dc_inst_type[1:0];
    sq_entry_inst_size[2:0]   <=  st_dc_inst_size[2:0];
    sq_entry_inst_mode[1:0]   <=  st_dc_inst_mode[1:0];
    sq_entry_fence_mode[3:0]  <=  st_dc_fence_mode[3:0];
    sq_entry_iid[6:0]         <=  st_dc_iid[6:0];
    sq_entry_sdid[3:0]        <=  st_dc_sdid[3:0];
    sq_entry_page_share       <=  st_dc_da_page_share;
    sq_entry_page_so          <=  st_dc_da_page_so;
    sq_entry_page_ca          <=  st_dc_da_page_ca;
    sq_entry_page_wa          <=  st_dc_da_page_wa;
    sq_entry_page_buf         <=  st_dc_da_page_buf;
    sq_entry_page_sec         <=  st_dc_da_page_sec;
    sq_entry_wo_st            <=  st_dc_wo_st_inst;
    sq_entry_boundary         <=  st_dc_boundary;
    sq_entry_secd             <=  st_dc_secd;
    sq_entry_addr0[`PA_WIDTH-1:0] <=  st_dc_addr0[`PA_WIDTH-1:0];
    sq_entry_bytes_vld[15:0]  <=  st_dc_bytes_vld[15:0];
    sq_entry_priv_mode[1:0]   <=  cp0_yy_priv_mode[1:0];
    sq_entry_rot_sel[7:0]    <=  st_dc_rot_sel_rev[7:0];
  end
end

//+------+
//| cmit |
//+------+
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_cmit             <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_cmit             <=  1'b0;
  else if(sq_entry_cmit_set)
    sq_entry_cmit             <=  1'b1;
end

//+----------+
//| data_vld |
//+----------+
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_data_vld         <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_data_vld         <=  st_dc_sq_data_vld;
  else if(sq_entry_data_set)
    sq_entry_data_vld         <=  1'b1;
end


//+-------------+
//| data_set_ff |
//+-------------+
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_data_set_ff      <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_data_set_ff      <=  1'b0;
  else if(sq_entry_data_set)
    sq_entry_data_set_ff      <=  1'b1;
  else
    sq_entry_data_set_ff      <=  1'b0;
end

//+--------------+
//| wakeup_queue |
//+--------------+
always @(posedge sq_entry_wakeup_queue_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_wakeup_queue[LSIQ_ENTRY-1:0] <=  {LSIQ_ENTRY{1'b0}};
  else if(sq_entry_data_set &&  !sq_entry_data_discard_grnt
        || sq_entry_data_set_ff
        ||  rtu_yy_xx_flush)
    sq_entry_wakeup_queue[LSIQ_ENTRY-1:0] <=  {LSIQ_ENTRY{1'b0}};
  else if(sq_entry_data_set &&  sq_entry_data_discard_grnt)
    sq_entry_wakeup_queue[LSIQ_ENTRY-1:0] <=  ld_da_lsid[LSIQ_ENTRY-1:0];
  else if(sq_entry_data_discard_grnt)
    sq_entry_wakeup_queue[LSIQ_ENTRY-1:0] <=  ld_da_lsid[LSIQ_ENTRY-1:0]
                                              | sq_entry_wakeup_queue[LSIQ_ENTRY-1:0];
end
assign sq_entry_has_wait_restart = |sq_entry_wakeup_queue[LSIQ_ENTRY-1:0];

//+------+
//| data |
//+------+
 
always @(posedge sq_entry_data_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_data[63:0]       <=  64'b0;
  else if(sq_entry_data_set)
    sq_entry_data[63:0]       <=  sq_data_settle[63:0];
end
//+-------------------+
//| st_da information |
//+-------------------+
//include dcache info/no_restart info
//include spec_fail/bkpt info for timing
always @(posedge sq_entry_create_da_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sq_entry_spec_fail        <=  1'b0;
    sq_entry_bkpta_data       <=  1'b0;
    sq_entry_bkptb_data       <=  1'b0;
    sq_entry_vstart_vld       <=  1'b0;
  end
  else if(sq_entry_st_da_info_set)
  begin
    sq_entry_spec_fail        <=  st_da_wb_spec_fail;
    sq_entry_bkpta_data       <=  st_da_bkpta_data;
    sq_entry_bkptb_data       <=  st_da_bkptb_data;
    sq_entry_vstart_vld       <=  st_da_wb_vstart_vld;
  end
end

always @(posedge sq_entry_create_da_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sq_entry_dcache_info_vld  <=  1'b0;
    sq_entry_no_restart       <=  1'b0;
  end
  else if(sq_entry_create_dp_vld)
  begin
    sq_entry_dcache_info_vld  <=  1'b0;
    sq_entry_no_restart       <=  1'b0;
  end
  else if(sq_entry_st_da_info_set)
  begin
    sq_entry_dcache_info_vld  <=  1'b1;
    sq_entry_no_restart       <=  st_da_sq_no_restart;
  end
end

//+-------------+
//| dcache info |
//+-------------+
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sq_entry_dcache_valid     <=  1'b0;
    sq_entry_dcache_share     <=  1'b0;
    sq_entry_dcache_dirty     <=  1'b0;
    sq_entry_dcache_way       <=  1'b0;
  end
  else if(sq_entry_dcache_update_vld)
  begin
    sq_entry_dcache_valid     <=  sq_entry_update_dcache_valid;
    sq_entry_dcache_share     <=  sq_entry_update_dcache_share;
    sq_entry_dcache_dirty     <=  sq_entry_update_dcache_dirty;
    sq_entry_dcache_way       <=  sq_entry_update_dcache_way;
  end
  else if(sq_entry_st_da_info_set)
  begin
    sq_entry_dcache_valid     <=  st_da_sq_dcache_valid;
    sq_entry_dcache_share     <=  st_da_sq_dcache_share;
    sq_entry_dcache_dirty     <=  st_da_sq_dcache_dirty;
    sq_entry_dcache_way       <=  st_da_sq_dcache_way;
  end
end

//+---------+
//| age_vec |
//+---------+
always @(posedge sq_create_pop_clk)
begin
  if(sq_entry_create_dp_vld)
    sq_entry_age_vec[SQ_ENTRY-1:0]  <=  sq_create_age_vec[SQ_ENTRY-1:0];
  else if(sq_age_vec_set  &&  sq_entry_vld)
    sq_entry_age_vec[SQ_ENTRY-1:0]  <=  sq_entry_age_vec_next[SQ_ENTRY-1:0];
end

//+------+
//| depd |
//+------+
always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_depd             <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_depd             <=  1'b0;
  else if(sq_entry_depd_set)
    sq_entry_depd             <=  1'b1;
end

always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    sq_entry_cmit0_iid_hit    <=  1'b0;
    sq_entry_cmit1_iid_hit    <=  1'b0;
    sq_entry_cmit2_iid_hit    <=  1'b0;
  end
  else if(sq_entry_create_dp_vld)
  begin
    sq_entry_cmit0_iid_hit    <=  st_dc_cmit0_iid_crt_hit;
    sq_entry_cmit1_iid_hit    <=  st_dc_cmit1_iid_crt_hit;
    sq_entry_cmit2_iid_hit    <=  st_dc_cmit2_iid_crt_hit;
  end
  else if(sq_entry_vld)
  begin
    sq_entry_cmit0_iid_hit    <=  sq_entry_cmit0_iid_pre_hit;
    sq_entry_cmit1_iid_hit    <=  sq_entry_cmit1_iid_pre_hit;
    sq_entry_cmit2_iid_hit    <=  sq_entry_cmit2_iid_pre_hit;
  end
end

always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_st_data_sdid_hit   <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_st_data_sdid_hit   <=  st_dc_sdid_hit;
  else if(sq_entry_vld && !sq_entry_data_vld)
    sq_entry_st_data_sdid_hit   <=  sq_entry_sdid_hit;
end

always @(posedge sq_entry_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    sq_entry_bond_first_only     <=  1'b0;
  else if(sq_entry_create_dp_vld)
    sq_entry_bond_first_only     <=  st_dc_boundary_first;
  else if(sq_bond_secd_create_vld)
    sq_entry_bond_first_only     <=  1'b0;
end

//==========================================================
//        Generate inst type
//==========================================================
assign sq_entry_dcache_inst = !sq_entry_atomic
                              &&  sq_entry_icc
                              &&  (sq_entry_inst_type[1:0]  ==  2'b10);
assign sq_entry_st_inst     = !sq_entry_icc
                              &&  !sq_entry_atomic
                              &&  !sq_entry_sync_fence;
assign sq_entry_wo_st_inst  = sq_entry_st_inst
                              &&  !sq_entry_page_so;

assign sq_entry_dcache_sw_inst  = sq_entry_dcache_inst
                                  &&  (sq_entry_inst_mode[1:0]  ==  2'b10);

//==========================================================
//      Generate cmit/st_da info/update signal
//==========================================================
//----------------------cmit signal-------------------------
assign sq_entry_cmit0_iid_pre_hit = (rtu_lsu_commit0_iid_updt_val[6:0] == sq_entry_iid[6:0]);
assign sq_entry_cmit1_iid_pre_hit = (rtu_lsu_commit1_iid_updt_val[6:0] == sq_entry_iid[6:0]);
assign sq_entry_cmit2_iid_pre_hit = (rtu_lsu_commit2_iid_updt_val[6:0] == sq_entry_iid[6:0]);

assign sq_entry_cmit_hit0       = rtu_yy_xx_commit0
                                  &&  sq_entry_cmit0_iid_hit;
assign sq_entry_cmit_hit1       = rtu_yy_xx_commit1
                                  &&  sq_entry_cmit1_iid_hit;
assign sq_entry_cmit_hit2       = rtu_yy_xx_commit2
                                  &&  sq_entry_cmit2_iid_hit;

assign sq_entry_cmit_set        = (sq_entry_cmit_hit0
                                      ||  sq_entry_cmit_hit1
                                      ||  sq_entry_cmit_hit2)
                                  &&  sq_entry_vld;

//-----------------cmit data vld signal---------------------
assign sq_entry_cmit_data_not_vld = sq_entry_vld
                                    &&  (sq_entry_cmit || sq_entry_cmit_set)
                                    &&  !sq_entry_data_vld;

assign sq_entry_cmit_data_vld     = !sq_entry_cmit_data_not_vld;

//---------------------st_da info siganl--------------------
assign sq_entry_st_da_info_set    = sq_entry_vld
                                    &&  st_da_inst_vld
                                    &&  !st_da_sq_ecc_stall
                                    &&  !sq_entry_no_restart
                                    &&  (st_da_secd  ==  sq_entry_secd)
                                    &&  (st_da_iid[6:0]  ==  sq_entry_iid[6:0]);
//-------------------boundary secd signal-------------------
assign sq_bond_secd_create_vld  = sq_entry_vld
                                  && sq_create_success
                                  && (sq_entry_iid[6:0] == st_dc_iid[6:0])
                                  && st_dc_secd;
//---------------------data update signal-------------------
assign sq_entry_sdid_hit          = sq_entry_sdid[3:0] ==  sd_rf_ex1_sdid[3:0];

assign sq_entry_settle_data_hit   = sq_entry_vld
                                    &&  !sq_entry_data_vld
                                    &&  sq_entry_st_data_sdid_hit;

assign sq_entry_data_set          = sq_entry_vld
                                    &&  !sq_entry_data_vld
                                    &&  sd_ex1_inst_vld
                                    &&  sq_entry_st_data_sdid_hit;

//-----------------------fwd signal-------------------------
//to decrease multi forward depd
assign sq_entry_addr_11to4_hit_st_dc      = (sq_entry_addr0[11:4] == st_dc_addr0[11:4]);

assign sq_entry_st_dc_bv_do_hit           = |(st_dc_bytes_vld[15:0] & sq_entry_bytes_vld[15:0]);
 
assign sq_entry_same_addr_newest_clr      = sq_entry_vld
                                            && sq_create_success
                                            && !sq_entry_newer_than_st_dc
                                            && sq_entry_addr_11to4_hit_st_dc 
                                            && sq_entry_st_dc_bv_do_hit;

//to sq_create_fwd_newest
assign sq_entry_st_dc_same_addr_newer     = sq_entry_vld
                                            && sq_entry_newer_than_st_dc
                                            && sq_entry_addr_11to4_hit_st_dc
                                            && sq_entry_st_dc_bv_do_hit;
//==========================================================
//                 sq iid check
//==========================================================
//check iid to judge whether to create sq
assign sq_entry_inst_hit  = sq_entry_vld
                            &&  !sq_entry_no_restart
                            &&  (sq_entry_secd  ==  st_dc_secd)
                            &&  (sq_entry_iid[6:0] ==  st_dc_iid[6:0]);
//==========================================================
//            Compare dcache write port(dcwp)
//==========================================================
// &Instance("ct_lsu_dcache_info_update","x_lsu_sq_entry_dcache_info_update"); @529
ct_lsu_dcache_info_update  x_lsu_sq_entry_dcache_info_update (
  .compare_dcwp_addr                 (sq_entry_addr0[39:0]             ),
  .compare_dcwp_hit_idx              (sq_entry_dcache_hit_idx          ),
  .compare_dcwp_sw_inst              (sq_entry_dcache_sw_inst          ),
  .compare_dcwp_update_vld           (sq_entry_dcache_update_vld_unmask),
  .dcache_dirty_din                  (dcache_dirty_din                 ),
  .dcache_dirty_gwen                 (dcache_dirty_gwen                ),
  .dcache_dirty_wen                  (dcache_dirty_wen                 ),
  .dcache_idx                        (dcache_idx                       ),
  .dcache_tag_din                    (dcache_tag_din                   ),
  .dcache_tag_gwen                   (dcache_tag_gwen                  ),
  .dcache_tag_wen                    (dcache_tag_wen                   ),
  .origin_dcache_dirty               (sq_entry_dcache_dirty            ),
  .origin_dcache_share               (sq_entry_dcache_share            ),
  .origin_dcache_valid               (sq_entry_dcache_valid            ),
  .origin_dcache_way                 (sq_entry_dcache_way              ),
  .update_dcache_dirty               (sq_entry_update_dcache_dirty     ),
  .update_dcache_share               (sq_entry_update_dcache_share     ),
  .update_dcache_valid               (sq_entry_update_dcache_valid     ),
  .update_dcache_way                 (sq_entry_update_dcache_way       )
);

// &Connect( .compare_dcwp_addr          (sq_entry_addr0[`PA_WIDTH-1:0]   ), @530
//           .compare_dcwp_sw_inst       (sq_entry_dcache_sw_inst), @531
//           .origin_dcache_valid        (sq_entry_dcache_valid  ), @532
//           .origin_dcache_share        (sq_entry_dcache_share  ), @533
//           .origin_dcache_dirty        (sq_entry_dcache_dirty  ), @534
//           .origin_dcache_way          (sq_entry_dcache_way    ), @535
//           .compare_dcwp_update_vld    (sq_entry_dcache_update_vld_unmask), @536
//           .compare_dcwp_hit_idx       (sq_entry_dcache_hit_idx  ), @537
//           .update_dcache_valid        (sq_entry_update_dcache_valid ), @538
//           .update_dcache_share        (sq_entry_update_dcache_share ), @539
//           .update_dcache_dirty        (sq_entry_update_dcache_dirty ), @540
//           .update_dcache_way          (sq_entry_update_dcache_way   )); @541
// &Force("nonport","sq_entry_dcache_hit_idx"); @542

assign sq_entry_dcache_update_vld   = sq_entry_dcache_update_vld_unmask
                                      &&  sq_entry_vld
                                      &&  sq_entry_dcache_info_vld;

//==========================================================
//                  Maintain Age Vector
//==========================================================
//if age_vec[n] = 1, it means sq_entry_n is older than this sq_entry
//age_vec -> age_vec_create -> age_vec_next
//-------------------age_vec after create-------------------
//sq entry newer than st_dc
// &Instance("ct_rtu_compare_iid","x_lsu_sq_entry_compare_st_dc_iid"); @555
ct_rtu_compare_iid  x_lsu_sq_entry_compare_st_dc_iid (
  .x_iid0                        (st_dc_iid[6:0]               ),
  .x_iid0_older                  (sq_entry_iid_newer_than_st_dc),
  .x_iid1                        (sq_entry_iid[6:0]            )
);

// &Connect( .x_iid0         (st_dc_iid[6:0]       ), @556
//           .x_iid1         (sq_entry_iid[6:0]    ), @557
//           .x_iid0_older   (sq_entry_iid_newer_than_st_dc)); @558

assign sq_entry_newer_than_st_dc  = !sq_entry_cmit
                                    &&  sq_entry_iid_newer_than_st_dc;

assign sq_entry_st_dc_create_age_vec  = sq_entry_vld
                                        &&  !sq_entry_in_wmb_ce
                                        &&  !sq_entry_pop_to_ce_grnt
                                        &&  !sq_entry_newer_than_st_dc;

assign sq_entry_age_vec_create[SQ_ENTRY-1:0]  =
                sq_create_vld[SQ_ENTRY-1:0]
                  & {SQ_ENTRY{sq_entry_newer_than_st_dc}}
                | sq_entry_age_vec[SQ_ENTRY-1:0];

//-------------------age_vecafter pop-----------------------
assign sq_entry_age_vec_next[SQ_ENTRY-1:0]    = sq_entry_pop_to_ce_grnt_b[SQ_ENTRY-1:0]
                                                & sq_entry_age_vec_create[SQ_ENTRY-1:0];
//---------------------pop sel------------------------------
// &CombBeg; @577
always @( sq_entry_age_vec[11:0])
begin
sq_entry_age_vec_1[SQ_ENTRY-1:0]  = 12'hfff;
casez(sq_entry_age_vec[SQ_ENTRY-1:0])
  12'b????_????_???1:sq_entry_age_vec_1[0]  = 1'b0;
  12'b????_????_??10:sq_entry_age_vec_1[1]  = 1'b0;
  12'b????_????_?100:sq_entry_age_vec_1[2]  = 1'b0;
  12'b????_????_1000:sq_entry_age_vec_1[3]  = 1'b0;
  12'b????_???1_0000:sq_entry_age_vec_1[4]  = 1'b0;
  12'b????_??10_0000:sq_entry_age_vec_1[5]  = 1'b0;
  12'b????_?100_0000:sq_entry_age_vec_1[6]  = 1'b0;
  12'b????_1000_0000:sq_entry_age_vec_1[7]  = 1'b0;
  12'b???1_0000_0000:sq_entry_age_vec_1[8]  = 1'b0;
  12'b??10_0000_0000:sq_entry_age_vec_1[9]  = 1'b0;
  12'b?100_0000_0000:sq_entry_age_vec_1[10]  = 1'b0;
  12'b1000_0000_0000:sq_entry_age_vec_1[11]  = 1'b0;
  default:sq_entry_age_vec_1[SQ_ENTRY-1:0]  = 12'hfff;
endcase
// &CombEnd; @594
end
assign sq_entry_age_vec_less2 = !(|(sq_entry_age_vec[SQ_ENTRY-1:0]  & sq_entry_age_vec_1[SQ_ENTRY-1:0]));
assign sq_entry_age_vec_zero  = !(|sq_entry_age_vec[SQ_ENTRY-1:0]);
assign sq_entry_age_vec_zero_ptr      = sq_entry_vld
                                        &&  !sq_entry_in_wmb_ce
                                        &&  sq_entry_age_vec_zero;
assign sq_entry_age_vec_surplus1_ptr  = sq_entry_vld
                                        &&  !sq_entry_in_wmb_ce
                                        &&  sq_entry_age_vec_less2
                                        &&  !sq_entry_age_vec_zero;
//---------------------pop req------------------------------
assign sq_entry_pop_req = sq_pop_ptr
                          &&  sq_entry_vld
                          &&  sq_entry_cmit
                          &&  sq_entry_data_vld
                          &&  sq_entry_no_restart
                          &&  !sq_entry_in_wmb_ce;

//==========================================================
//                 Dependency check
//==========================================================

// No.    ld pipe         sq/wmb          addr  bytes_vld data_vld      manner
// --------------------------------------------------------------------------
// 1      ld              st              :4    part      x             discard
// 2      ld atomic       any             x     x         x             discard
// 3      ld              atomic          :4    do        x             discard
// 4      ld bond(addr1)  st only boud 1  :4    do bv1    x             discard
// 5      ld              st              :4    exact     0 bypass rf   forward bypass
// 6      ld              st              :4    whole     0 exclude 5   data discard
// 7      ld              st              :4    whole     1             forward
// 8      ld(addr1)       st              :4    x         x             !acclr_en


//-----------iid compare----------------
//sq_entry older than ld_dc
// &Instance("ct_rtu_compare_iid","x_lsu_sq_entry_compare_ld_dc_iid"); @630
ct_rtu_compare_iid  x_lsu_sq_entry_compare_ld_dc_iid (
  .x_iid0                        (sq_entry_iid[6:0]            ),
  .x_iid0_older                  (sq_entry_iid_older_than_ld_dc),
  .x_iid1                        (ld_dc_iid[6:0]               )
);

// &Connect( .x_iid0         (sq_entry_iid[6:0]      ), @631
//           .x_iid1         (ld_dc_iid[6:0]         ), @632
//           .x_iid0_older   (sq_entry_iid_older_than_ld_dc)); @633

assign sq_entry_older_than_ld_dc  = sq_entry_iid_older_than_ld_dc
                                    ||  sq_entry_cmit;

//-----------addr compare---------------
//addr0 compare
assign sq_entry_from_ld_dc_addr0[`PA_WIDTH-1:0]  = ld_dc_addr0[`PA_WIDTH-1:0];
assign sq_entry_depd_addr_tto12_hit   = (sq_entry_addr0[`PA_WIDTH-1:12] == sq_entry_from_ld_dc_addr0[`PA_WIDTH-1:12]);
assign sq_entry_depd_addr0_11to4_hit  = sq_entry_addr0[11:4] == sq_entry_from_ld_dc_addr0[11:4];
assign sq_entry_depd_addr1_11to4_hit  = sq_entry_addr0[11:4] == ld_dc_addr1_11to4[7:0];

assign sq_entry_depd_addr_tto4_hit    = sq_entry_depd_addr_tto12_hit
                                        &&  sq_entry_depd_addr0_11to4_hit;

assign sq_entry_depd_addr1_tto4_hit   = sq_entry_depd_addr_tto12_hit
                                        &&  sq_entry_depd_addr1_11to4_hit;

//-----------bytes_vld compare----------
assign sq_entry_and_ld_dc_bytes_vld_hit      = |(sq_entry_bytes_vld[15:0]  & ld_dc_bytes_vld[15:0]);
assign sq_entry_not_and_ld_dc_bytes_vld_hit  = |((~sq_entry_bytes_vld[15:0]) & ld_dc_bytes_vld[15:0]);

assign sq_entry_and_ld_dc_bytes_vld1_hit     = |(sq_entry_bytes_vld[15:0]  & ld_dc_bytes_vld1[15:0]);
//example:
//depd_bytes_vld          ld_dc_bytes_vld     depd kinds
//1111                    0011                do & whole
//0011                    0011                do & whole
//0110                    0011                do & part
//0110                    1111                do & part
//1100                    0011                /

assign sq_entry_depd_do_hit         = sq_entry_and_ld_dc_bytes_vld_hit;

assign sq_entry_depd_whole_hit      = sq_entry_and_ld_dc_bytes_vld_hit
                                      &&  !sq_entry_not_and_ld_dc_bytes_vld_hit;

assign sq_entry_depd_part_hit       = sq_entry_and_ld_dc_bytes_vld_hit
                                      &&  sq_entry_not_and_ld_dc_bytes_vld_hit;

assign sq_entry_depd_exact_hit      = (sq_entry_bytes_vld[15:0] == ld_dc_bytes_vld[15:0]);

assign sq_entry_depd_bv1_do_hit    = sq_entry_and_ld_dc_bytes_vld1_hit;

//-------------data vld----------------
assign sq_entry_data_vld_now          = sq_entry_data_vld
                                        ||  sq_entry_data_set;
//------------------situation 1-----------------------------
assign sq_entry_depd_hit1   = sq_entry_vld
                              &&  sq_entry_wo_st_inst
                              &&  ld_dc_chk_ld_inst_vld
                              &&  sq_entry_older_than_ld_dc
                              &&  sq_entry_depd_addr_tto4_hit
                              &&  sq_entry_depd_part_hit;
//------------------situation 2-----------------------------
assign sq_entry_depd_hit2   = sq_entry_vld
                              &&  ld_dc_chk_atomic_inst_vld
                              &&  sq_entry_older_than_ld_dc;

//------------------situation 3-----------------------------
assign sq_entry_depd_hit3   = sq_entry_vld
                              &&  sq_entry_atomic
                              &&  ld_dc_chk_ld_inst_vld
                              &&  sq_entry_older_than_ld_dc
                              &&  sq_entry_depd_addr_tto4_hit
                              &&  sq_entry_depd_do_hit;

//------------------situation 4-----------------------------
//for reducing spec fail when boundary ld st
assign sq_entry_depd_hit4   = sq_entry_vld
                              &&  sq_entry_wo_st_inst
                              &&  ld_dc_chk_ld_addr1_vld
                              &&  sq_entry_older_than_ld_dc
                              &&  sq_entry_bond_first_only
                              &&  sq_entry_depd_addr1_tto4_hit
                              &&  sq_entry_depd_bv1_do_hit; 

//------------------situation 5-----------------------------
assign sq_entry_inst_vls = 1'b0;
//rf st_data bypass
assign sq_entry_depd_hit5   = sq_entry_vld
                              &&  sq_entry_wo_st_inst
                              &&  sd_rf_inst_vld_short
                              &&  !sq_entry_boundary
                              &&  !sq_entry_inst_vls
                              &&  ld_dc_chk_ld_bypass_vld
                              &&  sq_entry_older_than_ld_dc
                              &&  sq_entry_depd_addr_tto4_hit
                              &&  sq_entry_depd_exact_hit
                              &&  !sq_entry_data_vld
                              &&  sq_entry_sdid_hit;

//------------------situation 6-----------------------------
//data discard
assign sq_entry_depd_hit6   = sq_entry_vld
                              &&  sq_entry_wo_st_inst
                              &&  ld_dc_chk_ld_inst_vld
                              &&  sq_entry_older_than_ld_dc
                              &&  sq_entry_depd_addr_tto4_hit
                              &&  !sq_entry_data_vld_now
                              &&  sq_entry_depd_whole_hit;

//------------------situation 7-----------------------------
assign sq_entry_depd_hit7   = sq_entry_vld
                              &&  sq_entry_wo_st_inst
                              &&  ld_dc_chk_ld_inst_vld
                              &&  sq_entry_older_than_ld_dc
                              &&  sq_entry_depd_addr_tto4_hit
                              &&  sq_entry_data_vld_now
                              &&  sq_entry_depd_whole_hit;

assign sq_entry_newest_fwd_req_data_vld = sq_entry_vld
                                          &&  sq_entry_same_addr_newest
                                          &&  sq_entry_st_inst
                                          &&  ld_dc_chk_ld_inst_vld
                                          &&  sq_entry_older_than_ld_dc
                                          &&  sq_entry_depd_addr_tto4_hit
                                          &&  sq_entry_data_vld
                                          &&  sq_entry_depd_whole_hit;

assign sq_entry_newest_fwd_req_data_vld_short = sq_entry_vld
                                          &&  sq_entry_same_addr_newest
                                          &&  sq_entry_st_inst
                                          &&  ld_dc_chk_ld_inst_vld
                                          &&  sq_entry_older_than_ld_dc
                                          &&  sq_entry_depd_addr0_11to4_hit
                                          &&  sq_entry_data_vld;


//------------------situation 8-----------------------------
//for cache buffer acceleration
assign sq_entry_depd_hit8   = sq_entry_vld
                              &&  (sq_entry_wo_st_inst
                                  ||  sq_entry_atomic)
                              &&  sq_entry_older_than_ld_dc
                              &&  sq_entry_depd_addr1_tto4_hit
                              &&  sq_entry_depd_bv1_do_hit;

//------------------cancel ahead wb-------------------------
assign sq_entry_cancel_ahead_wb = sq_entry_vld
                                  &&  (sq_entry_wo_st_inst
                                      ||  sq_entry_atomic)
                                  &&  sq_entry_older_than_ld_dc
                                  &&  sq_entry_depd_addr_tto4_hit
                                  &&  sq_entry_depd_do_hit;
//------------------combine---------------------------------
assign sq_entry_discard_req       = sq_entry_depd_hit1
                                    ||  sq_entry_depd_hit2
                                    ||  sq_entry_depd_hit3
                                    ||  sq_entry_depd_hit4;

assign sq_entry_addr1_dep_discard = sq_entry_depd_hit4;
assign sq_entry_fwd_bypass_req    = sq_entry_depd_hit5;
assign sq_entry_data_discard_req_short  = sq_entry_depd_hit6;
assign sq_entry_data_discard_req  = sq_entry_depd_hit6
                                    &&  !sq_entry_depd_hit5;
assign sq_entry_fwd_req           = sq_entry_depd_hit7;
assign sq_entry_cancel_acc_req    = sq_entry_depd_hit8;

//-------------------set depd signal------------------------
assign sq_entry_depd_set      = sq_entry_discard_req
                                ||  sq_entry_fwd_multi_depd_set;

assign sq_entry_data_depd_wakeup_vld  = sq_entry_data_set
                                        ||  sq_entry_data_set_ff;

assign sq_entry_data_depd_wakeup[LSIQ_ENTRY-1:0]  = {LSIQ_ENTRY{sq_entry_data_depd_wakeup_vld}}
                                                    & sq_entry_wakeup_queue[LSIQ_ENTRY-1:0];


//==========================================================
//                 Generate pop signal
//==========================================================
assign sq_entry_flush_pop_vld = rtu_yy_xx_flush
                                &&  !sq_entry_cmit;
//if pmp deny, then create sq and then pop sq
assign sq_entry_expt_pop_vld  = sq_entry_st_da_info_set
                                &&  st_da_wb_expt_vld;

assign sq_entry_pop_vld       = sq_entry_vld
                                &&  sq_entry_in_wmb_ce
                                &&  wmb_sq_pop_grnt;

//==========================================================
//                 Generate interface
//==========================================================
//-----------------------input------------------------------
//-----------create signal--------------
assign sq_entry_create_vld          = sq_entry_create_vld_x;
assign sq_entry_create_dp_vld       = sq_entry_create_dp_vld_x;
assign sq_entry_create_gateclk_en   = sq_entry_create_gateclk_en_x;
assign sq_pop_ptr                   = sq_pop_ptr_x;
//-----------grnt signal----------------
assign sq_entry_data_discard_grnt   = sq_entry_data_discard_grnt_x;
assign sq_entry_fwd_multi_depd_set  = sq_entry_fwd_multi_depd_set_x;
assign sq_entry_pop_to_ce_grnt      = sq_entry_pop_to_ce_grnt_x;
//-----------------------output-----------------------------
//-----------sq entry signal------------
assign sq_entry_vld_x               = sq_entry_vld;
assign sq_entry_inst_hit_x          = sq_entry_inst_hit;
assign sq_entry_sync_fence_x        = sq_entry_sync_fence;
assign sq_entry_atomic_x            = sq_entry_atomic;
assign sq_entry_icc_x               = sq_entry_icc;
assign sq_entry_inst_flush_x        = sq_entry_inst_flush;
assign sq_entry_inst_type_v[1:0]    = sq_entry_inst_type[1:0];
assign sq_entry_inst_size_v[2:0]    = sq_entry_inst_size[2:0];
assign sq_entry_inst_mode_v[1:0]    = sq_entry_inst_mode[1:0];
assign sq_entry_fence_mode_v[3:0]   = sq_entry_fence_mode[3:0];
assign sq_entry_iid_v[6:0]          = sq_entry_iid[6:0];
assign sq_entry_page_share_x        = sq_entry_page_share;
assign sq_entry_page_so_x           = sq_entry_page_so;
assign sq_entry_page_ca_x           = sq_entry_page_ca;
assign sq_entry_page_wa_x           = sq_entry_page_wa;
assign sq_entry_page_buf_x          = sq_entry_page_buf;
assign sq_entry_page_sec_x          = sq_entry_page_sec;
assign sq_entry_same_addr_newest_x  = sq_entry_same_addr_newest;
assign sq_entry_wo_st_x             = sq_entry_wo_st;
assign sq_entry_addr0_v[`PA_WIDTH-1:0]  = sq_entry_addr0[`PA_WIDTH-1:0];
assign sq_entry_bytes_vld_v[15:0]   = sq_entry_bytes_vld[15:0];
assign sq_entry_spec_fail_x         = sq_entry_spec_fail;
assign sq_entry_bkpta_data_x        = sq_entry_bkpta_data;
assign sq_entry_bkptb_data_x        = sq_entry_bkptb_data;
assign sq_entry_vstart_vld_x        = sq_entry_vstart_vld;
assign sq_entry_cmit_data_vld_x     = sq_entry_cmit_data_vld;
assign sq_entry_priv_mode_v[1:0]    = sq_entry_priv_mode[1:0];
assign sq_entry_data_v[63:0]        = sq_entry_data[63:0];
assign sq_entry_rot_sel_v[7:0]      = sq_entry_rot_sel[7:0];
assign sq_entry_dcache_valid_x      = sq_entry_dcache_valid;
assign sq_entry_dcache_share_x      = sq_entry_dcache_share;
assign sq_entry_dcache_dirty_x      = sq_entry_dcache_dirty;
assign sq_entry_dcache_way_x        = sq_entry_dcache_way;
assign sq_entry_depd_x              = sq_entry_depd;
assign sq_entry_dcache_info_vld_x   = sq_entry_dcache_info_vld;
//-----------request--------------------
assign sq_entry_data_depd_wakeup_v[LSIQ_ENTRY-1:0]  = sq_entry_data_depd_wakeup[LSIQ_ENTRY-1:0];
assign sq_entry_discard_req_x       = sq_entry_discard_req;
assign sq_entry_cancel_ahead_wb_x   = sq_entry_cancel_ahead_wb;
assign sq_entry_depd_set_x          = sq_entry_depd_set;
assign sq_entry_pop_req_x           = sq_entry_pop_req;
assign sq_entry_cmit_x              = sq_entry_cmit;
assign sq_entry_newest_fwd_req_data_vld_x = sq_entry_newest_fwd_req_data_vld;
assign sq_entry_newest_fwd_req_data_vld_short_x = sq_entry_newest_fwd_req_data_vld_short;
//--------pop entry ptr-----------------
assign sq_entry_age_vec_zero_ptr_x      = sq_entry_age_vec_zero_ptr;
assign sq_entry_age_vec_surplus1_ptr_x  = sq_entry_age_vec_surplus1_ptr;
//-----------others---------------------
assign sq_entry_st_dc_create_age_vec_x  = sq_entry_st_dc_create_age_vec;
assign sq_entry_settle_data_hit_x       = sq_entry_settle_data_hit;
assign sq_entry_st_dc_same_addr_newer_x = sq_entry_st_dc_same_addr_newer;
assign sq_entry_addr1_dep_discard_x     = sq_entry_addr1_dep_discard;
assign sq_entry_fwd_bypass_req_x        = sq_entry_fwd_bypass_req;
assign sq_entry_data_discard_req_x      = sq_entry_data_discard_req;
assign sq_entry_data_discard_req_short_x= sq_entry_data_discard_req_short;
assign sq_entry_fwd_req_x               = sq_entry_fwd_req;
assign sq_entry_cancel_acc_req_x        = sq_entry_cancel_acc_req;

// &ModuleEnd; @900
endmodule


