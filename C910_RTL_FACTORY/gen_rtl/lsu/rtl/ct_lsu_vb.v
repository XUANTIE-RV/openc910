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

// &ModuleBeg; @31
module ct_lsu_vb(
  biu_lsu_b_id,
  biu_lsu_b_vld,
  bus_arb_vb_aw_grnt,
  bus_arb_vb_w_grnt,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dcache_arb_vb_ld_grnt,
  dcache_arb_vb_st_grnt,
  icc_vb_addr_tto6,
  icc_vb_create_dp_vld,
  icc_vb_create_gateclk_en,
  icc_vb_create_req,
  icc_vb_create_vld,
  icc_vb_inv,
  ld_da_vb_snq_data_reissue,
  lfb_vb_addr_tto6,
  lfb_vb_create_dp_vld,
  lfb_vb_create_gateclk_en,
  lfb_vb_create_req,
  lfb_vb_create_vld,
  lfb_vb_id,
  lsu_had_vb_addr_entry_vld,
  lsu_had_vb_data_entry_vld,
  lsu_had_vb_rcl_sm_state,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfu_biu_req_addr,
  rb_biu_req_addr,
  snq_bypass_addr_tto6,
  snq_create_addr,
  snq_data_bypass_hit,
  snq_depd_vb_id,
  snq_vb_bypass_check,
  st_da_dcache_dirty,
  st_da_dcache_hit,
  st_da_dcache_miss,
  st_da_dcache_replace_dirty,
  st_da_dcache_replace_valid,
  st_da_dcache_replace_way,
  st_da_dcache_way,
  st_da_vb_ecc_err,
  st_da_vb_ecc_stall,
  st_da_vb_feedback_addr_tto14,
  st_da_vb_tag_reissue,
  vb_biu_aw_addr,
  vb_biu_aw_bar,
  vb_biu_aw_burst,
  vb_biu_aw_cache,
  vb_biu_aw_domain,
  vb_biu_aw_dp_req,
  vb_biu_aw_id,
  vb_biu_aw_len,
  vb_biu_aw_lock,
  vb_biu_aw_prot,
  vb_biu_aw_req,
  vb_biu_aw_req_gateclk_en,
  vb_biu_aw_size,
  vb_biu_aw_snoop,
  vb_biu_aw_unique,
  vb_biu_aw_user,
  vb_biu_w_data,
  vb_biu_w_id,
  vb_biu_w_last,
  vb_biu_w_req,
  vb_biu_w_strb,
  vb_biu_w_vld,
  vb_data_entry_addr_id_0,
  vb_data_entry_addr_id_1,
  vb_data_entry_addr_id_2,
  vb_data_entry_biu_req,
  vb_data_entry_biu_req_success,
  vb_data_entry_bypass_pop,
  vb_data_entry_create_dp_vld,
  vb_data_entry_create_gateclk_en,
  vb_data_entry_create_vld,
  vb_data_entry_dirty,
  vb_data_entry_inv,
  vb_data_entry_lfb_create,
  vb_data_entry_normal_pop,
  vb_data_entry_req_success,
  vb_data_entry_vld,
  vb_data_entry_wd_sm_grnt,
  vb_data_entry_wd_sm_req,
  vb_data_entry_write_data128_0,
  vb_data_entry_write_data128_1,
  vb_data_entry_write_data128_2,
  vb_dcache_arb_borrow_addr,
  vb_dcache_arb_data_way,
  vb_dcache_arb_dcache_replace,
  vb_dcache_arb_ld_borrow_req,
  vb_dcache_arb_ld_borrow_req_gate,
  vb_dcache_arb_ld_data_gateclk_en,
  vb_dcache_arb_ld_data_idx,
  vb_dcache_arb_ld_req,
  vb_dcache_arb_ld_tag_gateclk_en,
  vb_dcache_arb_ld_tag_idx,
  vb_dcache_arb_ld_tag_req,
  vb_dcache_arb_ld_tag_wen,
  vb_dcache_arb_serial_req,
  vb_dcache_arb_set_way_mode,
  vb_dcache_arb_st_borrow_req,
  vb_dcache_arb_st_dirty_din,
  vb_dcache_arb_st_dirty_gateclk_en,
  vb_dcache_arb_st_dirty_gwen,
  vb_dcache_arb_st_dirty_idx,
  vb_dcache_arb_st_dirty_req,
  vb_dcache_arb_st_dirty_wen,
  vb_dcache_arb_st_req,
  vb_dcache_arb_st_tag_gateclk_en,
  vb_dcache_arb_st_tag_idx,
  vb_dcache_arb_st_tag_req,
  vb_empty,
  vb_icc_create_grnt,
  vb_invalid_vld,
  vb_lfb_addr_entry_rcl_done,
  vb_lfb_create_grnt,
  vb_lfb_dcache_dirty,
  vb_lfb_dcache_hit,
  vb_lfb_dcache_way,
  vb_lfb_rcl_done,
  vb_lfb_vb_req_hit_idx,
  vb_pfu_biu_req_hit_idx,
  vb_rb_biu_req_hit_idx,
  vb_rcl_sm_addr_id,
  vb_rcl_sm_data_dcache_dirty,
  vb_rcl_sm_data_id,
  vb_rcl_sm_data_set_data_done,
  vb_rcl_sm_inv,
  vb_rcl_sm_lfb_create,
  vb_sdb_data_entry_vld,
  vb_snq_bypass_db_id,
  vb_snq_bypass_hit,
  vb_snq_depd,
  vb_snq_depd_remove,
  vb_snq_start_hit_idx,
  vb_snq_wait_remove,
  vb_snq_wait_vb_id,
  vb_wd_sm_data_bias,
  vb_wd_sm_data_pop_req,
  vb_wmb_create_grnt,
  vb_wmb_empty,
  vb_wmb_entry_rcl_done,
  vb_wmb_write_req_hit_idx,
  victim_addr,
  wmb_vb_addr_tto6,
  wmb_vb_create_dp_vld,
  wmb_vb_create_gateclk_en,
  wmb_vb_create_req,
  wmb_vb_create_vld,
  wmb_vb_inv,
  wmb_vb_set_way_mode,
  wmb_write_ptr_encode,
  wmb_write_req_addr
);

// &Ports; @32
input   [4  :0]  biu_lsu_b_id;                       
input            biu_lsu_b_vld;                      
input            bus_arb_vb_aw_grnt;                 
input            bus_arb_vb_w_grnt;                  
input            cp0_lsu_icg_en;                     
input            cp0_yy_clk_en;                      
input            cpurst_b;                           
input            dcache_arb_vb_ld_grnt;              
input            dcache_arb_vb_st_grnt;              
input   [33 :0]  icc_vb_addr_tto6;                   
input            icc_vb_create_dp_vld;               
input            icc_vb_create_gateclk_en;           
input            icc_vb_create_req;                  
input            icc_vb_create_vld;                  
input            icc_vb_inv;                         
input            ld_da_vb_snq_data_reissue;          
input   [33 :0]  lfb_vb_addr_tto6;                   
input            lfb_vb_create_dp_vld;               
input            lfb_vb_create_gateclk_en;           
input            lfb_vb_create_req;                  
input            lfb_vb_create_vld;                  
input   [2  :0]  lfb_vb_id;                          
input            lsu_special_clk;                    
input            pad_yy_icg_scan_en;                 
input   [39 :0]  pfu_biu_req_addr;                   
input   [39 :0]  rb_biu_req_addr;                    
input   [33 :0]  snq_bypass_addr_tto6;               
input   [39 :0]  snq_create_addr;                    
input   [1  :0]  snq_depd_vb_id;                     
input            snq_vb_bypass_check;                
input            st_da_dcache_dirty;                 
input            st_da_dcache_hit;                   
input            st_da_dcache_miss;                  
input            st_da_dcache_replace_dirty;         
input            st_da_dcache_replace_valid;         
input            st_da_dcache_replace_way;           
input            st_da_dcache_way;                   
input            st_da_vb_ecc_err;                   
input            st_da_vb_ecc_stall;                 
input   [25 :0]  st_da_vb_feedback_addr_tto14;       
input            st_da_vb_tag_reissue;               
input   [1  :0]  vb_data_entry_addr_id_0;            
input   [1  :0]  vb_data_entry_addr_id_1;            
input   [1  :0]  vb_data_entry_addr_id_2;            
input   [2  :0]  vb_data_entry_biu_req;              
input   [2  :0]  vb_data_entry_bypass_pop;           
input   [2  :0]  vb_data_entry_dirty;                
input   [2  :0]  vb_data_entry_inv;                  
input   [2  :0]  vb_data_entry_lfb_create;           
input   [2  :0]  vb_data_entry_normal_pop;           
input   [2  :0]  vb_data_entry_req_success;          
input   [2  :0]  vb_data_entry_vld;                  
input   [2  :0]  vb_data_entry_wd_sm_req;            
input   [127:0]  vb_data_entry_write_data128_0;      
input   [127:0]  vb_data_entry_write_data128_1;      
input   [127:0]  vb_data_entry_write_data128_2;      
input   [2  :0]  vb_sdb_data_entry_vld;              
input   [33 :0]  wmb_vb_addr_tto6;                   
input            wmb_vb_create_dp_vld;               
input            wmb_vb_create_gateclk_en;           
input            wmb_vb_create_req;                  
input            wmb_vb_create_vld;                  
input            wmb_vb_inv;                         
input            wmb_vb_set_way_mode;                
input   [2  :0]  wmb_write_ptr_encode;               
input   [39 :0]  wmb_write_req_addr;                 
output  [1  :0]  lsu_had_vb_addr_entry_vld;          
output  [2  :0]  lsu_had_vb_data_entry_vld;          
output  [3  :0]  lsu_had_vb_rcl_sm_state;            
output  [2  :0]  snq_data_bypass_hit;                
output  [39 :0]  vb_biu_aw_addr;                     
output  [1  :0]  vb_biu_aw_bar;                      
output  [1  :0]  vb_biu_aw_burst;                    
output  [3  :0]  vb_biu_aw_cache;                    
output  [1  :0]  vb_biu_aw_domain;                   
output           vb_biu_aw_dp_req;                   
output  [4  :0]  vb_biu_aw_id;                       
output  [1  :0]  vb_biu_aw_len;                      
output           vb_biu_aw_lock;                     
output  [2  :0]  vb_biu_aw_prot;                     
output           vb_biu_aw_req;                      
output           vb_biu_aw_req_gateclk_en;           
output  [2  :0]  vb_biu_aw_size;                     
output  [2  :0]  vb_biu_aw_snoop;                    
output           vb_biu_aw_unique;                   
output           vb_biu_aw_user;                     
output  [127:0]  vb_biu_w_data;                      
output  [4  :0]  vb_biu_w_id;                        
output           vb_biu_w_last;                      
output           vb_biu_w_req;                       
output  [15 :0]  vb_biu_w_strb;                      
output           vb_biu_w_vld;                       
output  [2  :0]  vb_data_entry_biu_req_success;      
output  [2  :0]  vb_data_entry_create_dp_vld;        
output  [2  :0]  vb_data_entry_create_gateclk_en;    
output  [2  :0]  vb_data_entry_create_vld;           
output  [2  :0]  vb_data_entry_wd_sm_grnt;           
output  [39 :0]  vb_dcache_arb_borrow_addr;          
output           vb_dcache_arb_data_way;             
output           vb_dcache_arb_dcache_replace;       
output           vb_dcache_arb_ld_borrow_req;        
output           vb_dcache_arb_ld_borrow_req_gate;   
output  [7  :0]  vb_dcache_arb_ld_data_gateclk_en;   
output  [10 :0]  vb_dcache_arb_ld_data_idx;          
output           vb_dcache_arb_ld_req;               
output           vb_dcache_arb_ld_tag_gateclk_en;    
output  [8  :0]  vb_dcache_arb_ld_tag_idx;           
output           vb_dcache_arb_ld_tag_req;           
output  [1  :0]  vb_dcache_arb_ld_tag_wen;           
output           vb_dcache_arb_serial_req;           
output           vb_dcache_arb_set_way_mode;         
output           vb_dcache_arb_st_borrow_req;        
output  [6  :0]  vb_dcache_arb_st_dirty_din;         
output           vb_dcache_arb_st_dirty_gateclk_en;  
output           vb_dcache_arb_st_dirty_gwen;        
output  [8  :0]  vb_dcache_arb_st_dirty_idx;         
output           vb_dcache_arb_st_dirty_req;         
output  [6  :0]  vb_dcache_arb_st_dirty_wen;         
output           vb_dcache_arb_st_req;               
output           vb_dcache_arb_st_tag_gateclk_en;    
output  [8  :0]  vb_dcache_arb_st_tag_idx;           
output           vb_dcache_arb_st_tag_req;           
output           vb_empty;                           
output           vb_icc_create_grnt;                 
output           vb_invalid_vld;                     
output  [7  :0]  vb_lfb_addr_entry_rcl_done;         
output           vb_lfb_create_grnt;                 
output           vb_lfb_dcache_dirty;                
output           vb_lfb_dcache_hit;                  
output           vb_lfb_dcache_way;                  
output           vb_lfb_rcl_done;                    
output           vb_lfb_vb_req_hit_idx;              
output           vb_pfu_biu_req_hit_idx;             
output           vb_rb_biu_req_hit_idx;              
output  [1  :0]  vb_rcl_sm_addr_id;                  
output           vb_rcl_sm_data_dcache_dirty;        
output  [2  :0]  vb_rcl_sm_data_id;                  
output  [2  :0]  vb_rcl_sm_data_set_data_done;       
output           vb_rcl_sm_inv;                      
output           vb_rcl_sm_lfb_create;               
output  [2  :0]  vb_snq_bypass_db_id;                
output           vb_snq_bypass_hit;                  
output  [1  :0]  vb_snq_depd;                        
output  [1  :0]  vb_snq_depd_remove;                 
output           vb_snq_start_hit_idx;               
output  [1  :0]  vb_snq_wait_remove;                 
output  [1  :0]  vb_snq_wait_vb_id;                  
output  [3  :0]  vb_wd_sm_data_bias;                 
output  [2  :0]  vb_wd_sm_data_pop_req;              
output           vb_wmb_create_grnt;                 
output           vb_wmb_empty;                       
output  [7  :0]  vb_wmb_entry_rcl_done;              
output           vb_wmb_write_req_hit_idx;           
output  [33 :0]  victim_addr;                        

// &Regs; @33
reg     [1  :0]  vb_addr_b_resp_ptr;                 
reg     [1  :0]  vb_addr_create_ptr;                 
reg     [1  :0]  vb_biu_aw_addr_ptr;                 
reg     [2  :0]  vb_biu_aw_req_snoop;                
reg     [2  :0]  vb_data_biu_req_ptr;                
reg     [2  :0]  vb_data_create_ptr;                 
reg              vb_dcache_arb_ld_req;               
reg              vb_dcache_arb_st_req;               
reg     [1  :0]  vb_rcl_sm_addr_id;                  
reg     [33 :0]  vb_rcl_sm_addr_tto6;                
reg     [2  :0]  vb_rcl_sm_data_id;                  
reg              vb_rcl_sm_dcache_dirty;             
reg              vb_rcl_sm_dcache_way;               
reg     [3  :0]  vb_rcl_sm_next_state;               
reg     [1  :0]  vb_rcl_sm_req_addr_ptr;             
reg     [3  :0]  vb_rcl_sm_state;                    
reg     [3  :0]  vb_wd_sm_data_bias;                 
reg     [2  :0]  vb_wd_sm_data_id;                   
reg              vb_wd_sm_vld;                       

// &Wires; @34
wire    [4  :0]  biu_lsu_b_id;                       
wire             biu_lsu_b_vld;                      
wire             bus_arb_vb_aw_grnt;                 
wire             bus_arb_vb_w_grnt;                  
wire             cp0_lsu_icg_en;                     
wire             cp0_yy_clk_en;                      
wire             cpurst_b;                           
wire             dcache_arb_vb_ld_grnt;              
wire             dcache_arb_vb_st_grnt;              
wire             evict_enable;                       
wire             evict_req;                          
wire    [33 :0]  evict_req_addr_tto6;                
wire             evict_req_cancel;                   
wire             evict_req_success;                  
wire    [33 :0]  icc_vb_addr_tto6;                   
wire             icc_vb_create_dp_vld;               
wire             icc_vb_create_gateclk_en;           
wire             icc_vb_create_req;                  
wire             icc_vb_create_vld;                  
wire             icc_vb_inv;                         
wire             ld_da_vb_snq_data_reissue;          
wire    [33 :0]  lfb_vb_addr_tto6;                   
wire             lfb_vb_create_dp_vld;               
wire             lfb_vb_create_gateclk_en;           
wire             lfb_vb_create_req;                  
wire             lfb_vb_create_vld;                  
wire    [2  :0]  lfb_vb_id;                          
wire    [1  :0]  lsu_had_vb_addr_entry_vld;          
wire    [2  :0]  lsu_had_vb_data_entry_vld;          
wire    [3  :0]  lsu_had_vb_rcl_sm_state;            
wire             lsu_special_clk;                    
wire             pad_yy_icg_scan_en;                 
wire    [39 :0]  pfu_biu_req_addr;                   
wire    [39 :0]  rb_biu_req_addr;                    
wire             rcl_cmp_tag_vld;                    
wire    [33 :0]  snq_bypass_addr_tto6;               
wire    [39 :0]  snq_create_addr;                    
wire    [2  :0]  snq_data_bypass_hit;                
wire    [1  :0]  snq_depd_vb_id;                     
wire             snq_vb_bypass_check;                
wire             st_da_dcache_dirty;                 
wire             st_da_dcache_hit;                   
wire             st_da_dcache_miss;                  
wire             st_da_dcache_replace_dirty;         
wire             st_da_dcache_replace_valid;         
wire             st_da_dcache_replace_way;           
wire             st_da_dcache_way;                   
wire             st_da_vb_ecc_err;                   
wire             st_da_vb_ecc_stall;                 
wire    [25 :0]  st_da_vb_feedback_addr_tto14;       
wire             st_da_vb_tag_reissue;               
wire             vb_addr_create_gateclk_en;          
wire             vb_addr_create_vld;                 
wire             vb_addr_empty;                      
wire    [33 :0]  vb_addr_entry_addr_tto6_0;          
wire    [33 :0]  vb_addr_entry_addr_tto6_1;          
wire    [1  :0]  vb_addr_entry_b_resp;               
wire    [1  :0]  vb_addr_entry_bypass_pop;           
wire    [1  :0]  vb_addr_entry_create_data;          
wire    [1  :0]  vb_addr_entry_create_gateclk_en;    
wire    [1  :0]  vb_addr_entry_create_vld;           
wire    [1  :0]  vb_addr_entry_data_pop;             
wire    [2  :0]  vb_addr_entry_db_id_0;              
wire    [2  :0]  vb_addr_entry_db_id_1;              
wire    [1  :0]  vb_addr_entry_dep_remove;           
wire    [1  :0]  vb_addr_entry_feedback_vld;         
wire    [1  :0]  vb_addr_entry_icc_create_dp_vld;    
wire    [1  :0]  vb_addr_entry_inv;                  
wire    [1  :0]  vb_addr_entry_lfb_create;           
wire    [1  :0]  vb_addr_entry_lfb_create_dp_vld;    
wire    [1  :0]  vb_addr_entry_lfb_vb_req_hit_idx;   
wire    [1  :0]  vb_addr_entry_pfu_biu_req_hit_idx;  
wire    [1  :0]  vb_addr_entry_pop;                  
wire    [1  :0]  vb_addr_entry_rb_biu_req_hit_idx;   
wire    [1  :0]  vb_addr_entry_rcl_sm_req;           
wire    [1  :0]  vb_addr_entry_set_way_mode;         
wire    [1  :0]  vb_addr_entry_snq_bypass_hit;       
wire    [1  :0]  vb_addr_entry_snq_create_hit_idx;   
wire    [1  :0]  vb_addr_entry_snq_start_wait;       
wire    [2  :0]  vb_addr_entry_source_id_0;          
wire    [7  :0]  vb_addr_entry_source_id_0_expand;   
wire    [2  :0]  vb_addr_entry_source_id_1;          
wire    [7  :0]  vb_addr_entry_source_id_1_expand;   
wire    [1  :0]  vb_addr_entry_vld;                  
wire    [1  :0]  vb_addr_entry_wmb_create;           
wire    [1  :0]  vb_addr_entry_wmb_create_dp_vld;    
wire    [1  :0]  vb_addr_entry_wmb_pop;              
wire    [1  :0]  vb_addr_entry_wmb_write_req_hit_idx; 
wire             vb_addr_feedback_vld;               
wire             vb_addr_full;                       
wire             vb_addr_icc_create_dp_vld;          
wire             vb_addr_lfb_create_dp_vld;          
wire             vb_addr_rcl_sm_req;                 
wire             vb_addr_wmb_create_dp_vld;          
wire    [39 :0]  vb_biu_aw_addr;                     
wire    [1  :0]  vb_biu_aw_bar;                      
wire    [1  :0]  vb_biu_aw_burst;                    
wire    [3  :0]  vb_biu_aw_cache;                    
wire    [1  :0]  vb_biu_aw_domain;                   
wire             vb_biu_aw_dp_req;                   
wire    [4  :0]  vb_biu_aw_id;                       
wire    [1  :0]  vb_biu_aw_len;                      
wire             vb_biu_aw_lock;                     
wire    [2  :0]  vb_biu_aw_prot;                     
wire             vb_biu_aw_req;                      
wire    [33 :0]  vb_biu_aw_req_addr_tto6;            
wire             vb_biu_aw_req_dirty;                
wire             vb_biu_aw_req_gateclk_en;           
wire    [1  :0]  vb_biu_aw_req_id;                   
wire             vb_biu_aw_req_inv;                  
wire             vb_biu_aw_req_lfb_create;           
wire    [2  :0]  vb_biu_aw_size;                     
wire    [2  :0]  vb_biu_aw_snoop;                    
wire             vb_biu_aw_unique;                   
wire             vb_biu_aw_user;                     
wire             vb_biu_b_id_hit;                    
wire    [1  :0]  vb_biu_id_1to0;                     
wire    [127:0]  vb_biu_w_data;                      
wire    [4  :0]  vb_biu_w_id;                        
wire             vb_biu_w_last;                      
wire             vb_biu_w_req;                       
wire    [15 :0]  vb_biu_w_strb;                      
wire             vb_biu_w_vld;                       
wire             vb_data_biu_req;                    
wire             vb_data_create_dp_vld;              
wire             vb_data_create_gateclk_en;          
wire             vb_data_create_vld;                 
wire             vb_data_empty;                      
wire    [1  :0]  vb_data_entry_addr_id_0;            
wire    [1  :0]  vb_data_entry_addr_id_1;            
wire    [1  :0]  vb_data_entry_addr_id_2;            
wire    [2  :0]  vb_data_entry_biu_req;              
wire    [2  :0]  vb_data_entry_biu_req_success;      
wire    [2  :0]  vb_data_entry_bypass_pop;           
wire    [2  :0]  vb_data_entry_create_dp_vld;        
wire    [2  :0]  vb_data_entry_create_gateclk_en;    
wire    [2  :0]  vb_data_entry_create_vld;           
wire    [2  :0]  vb_data_entry_dirty;                
wire    [2  :0]  vb_data_entry_id;                   
wire    [2  :0]  vb_data_entry_inv;                  
wire    [2  :0]  vb_data_entry_lfb_create;           
wire    [2  :0]  vb_data_entry_normal_pop;           
wire    [2  :0]  vb_data_entry_req_success;          
wire    [2  :0]  vb_data_entry_vld;                  
wire    [2  :0]  vb_data_entry_wd_sm_grnt;           
wire    [2  :0]  vb_data_entry_wd_sm_req;            
wire    [127:0]  vb_data_entry_write_data128_0;      
wire    [127:0]  vb_data_entry_write_data128_1;      
wire    [127:0]  vb_data_entry_write_data128_2;      
wire             vb_data_full;                       
wire             vb_data_wd_sm_req;                  
wire    [2  :0]  vb_data_wd_sm_req_ptr;              
wire    [39 :0]  vb_dcache_arb_borrow_addr;          
wire             vb_dcache_arb_data_way;             
wire             vb_dcache_arb_dcache_replace;       
wire             vb_dcache_arb_ld_borrow_req;        
wire             vb_dcache_arb_ld_borrow_req_gate;   
wire    [7  :0]  vb_dcache_arb_ld_data_gateclk_en;   
wire    [10 :0]  vb_dcache_arb_ld_data_idx;          
wire             vb_dcache_arb_ld_req_set;           
wire             vb_dcache_arb_ld_tag_gateclk_en;    
wire    [8  :0]  vb_dcache_arb_ld_tag_idx;           
wire             vb_dcache_arb_ld_tag_req;           
wire    [1  :0]  vb_dcache_arb_ld_tag_wen;           
wire             vb_dcache_arb_serial_req;           
wire             vb_dcache_arb_set_way_mode;         
wire             vb_dcache_arb_st_borrow_req;        
wire    [6  :0]  vb_dcache_arb_st_dirty_din;         
wire             vb_dcache_arb_st_dirty_gateclk_en;  
wire             vb_dcache_arb_st_dirty_gwen;        
wire    [8  :0]  vb_dcache_arb_st_dirty_idx;         
wire             vb_dcache_arb_st_dirty_req;         
wire    [6  :0]  vb_dcache_arb_st_dirty_wen;         
wire             vb_dcache_arb_st_req_set;           
wire             vb_dcache_arb_st_tag_gateclk_en;    
wire    [8  :0]  vb_dcache_arb_st_tag_idx;           
wire             vb_dcache_arb_st_tag_req;           
wire             vb_dcache_arb_write;                
wire             vb_empty;                           
wire             vb_icc_create_grnt;                 
wire             vb_icc_create_vld;                  
wire             vb_invalid_vld;                     
wire    [7  :0]  vb_lfb_addr_entry_rcl_done;         
wire             vb_lfb_create_grnt;                 
wire             vb_lfb_create_vld;                  
wire             vb_lfb_dcache_dirty;                
wire             vb_lfb_dcache_hit;                  
wire             vb_lfb_dcache_way;                  
wire             vb_lfb_rcl_done;                    
wire             vb_lfb_vb_req_hit_idx;              
wire             vb_pfu_biu_req_hit_idx;             
wire             vb_rb_biu_req_hit_idx;              
wire             vb_rcl_ecc_done;                    
wire             vb_rcl_iccwmb_unnecessary;          
wire             vb_rcl_lfb_unnecessary;             
wire             vb_rcl_req_data_done;               
wire             vb_rcl_set_dirty_done;              
wire    [1  :0]  vb_rcl_sm_addr_grnt;                
wire    [1  :0]  vb_rcl_sm_addr_pop_req;             
wire             vb_rcl_sm_addr_pop_vld;             
wire             vb_rcl_sm_clk;                      
wire             vb_rcl_sm_clk_en;                   
wire             vb_rcl_sm_create_clk;               
wire             vb_rcl_sm_create_clk_en;            
wire             vb_rcl_sm_create_vld;               
wire             vb_rcl_sm_data_dcache_dirty;        
wire             vb_rcl_sm_data_entry_req_success;   
wire    [2  :0]  vb_rcl_sm_data_set_data_done;       
wire    [1  :0]  vb_rcl_sm_done;                     
wire             vb_rcl_sm_inv;                      
wire             vb_rcl_sm_lfb_create;               
wire             vb_rcl_sm_permit;                   
wire             vb_rcl_sm_reg_set_dcache_dirty;     
wire             vb_rcl_sm_reg_set_dcache_way;       
wire    [33 :0]  vb_rcl_sm_req_addr_tto6;            
wire             vb_rcl_sm_sel_dcache_reg_info;      
wire             vb_rcl_sm_set_data_done_vld;        
wire             vb_rcl_sm_set_way_mode;             
wire    [7  :0]  vb_rcl_sm_source_id_expand;         
wire             vb_rcl_sm_vld;                      
wire    [2  :0]  vb_sdb_data_entry_vld;              
wire    [2  :0]  vb_snq_bypass_db_id;                
wire             vb_snq_bypass_hit;                  
wire    [1  :0]  vb_snq_depd;                        
wire    [1  :0]  vb_snq_depd_remove;                 
wire             vb_snq_start_hit_idx;               
wire    [1  :0]  vb_snq_wait_remove;                 
wire    [1  :0]  vb_snq_wait_vb_id;                  
wire    [1  :0]  vb_wd_sm_addr_id;                   
wire             vb_wd_sm_clk;                       
wire             vb_wd_sm_clk_en;                    
wire    [2  :0]  vb_wd_sm_data_pop_req;              
wire             vb_wd_sm_inv;                       
wire             vb_wd_sm_permit;                    
wire             vb_wd_sm_start_vld;                 
wire             vb_wd_sm_vld_permit;                
wire    [127:0]  vb_wd_sm_w_req_data;                
wire             vb_wmb_create_grnt;                 
wire             vb_wmb_create_vld;                  
wire             vb_wmb_empty;                       
wire    [7  :0]  vb_wmb_entry_rcl_done;              
wire             vb_wmb_write_req_hit_idx;           
wire    [33 :0]  victim_addr;                        
wire    [33 :0]  wmb_vb_addr_tto6;                   
wire             wmb_vb_create_dp_vld;               
wire             wmb_vb_create_gateclk_en;           
wire             wmb_vb_create_req;                  
wire             wmb_vb_create_vld;                  
wire             wmb_vb_inv;                         
wire             wmb_vb_set_way_mode;                
wire    [2  :0]  wmb_write_ptr_encode;               
wire    [39 :0]  wmb_write_req_addr;                 


parameter BIU_VB_ID_T         = 3'b000;
parameter VB_ADDR_ENTRY       = 2,
          VB_DATA_ENTRY       = 3,
          LFB_ADDR_ENTRY      = 8,
          WMB_ENTRY           = 8;
parameter OKAY                = 2'b00,
          EXOKAY              = 2'b01,
          SLVERR              = 2'b10,
          DECERR              = 2'b11;
//state[3] is used for whether has set cache info
parameter RCL_IDLE            = 4'b0000,
          RCL_R_TAG_DIRTY     = 4'b1000,
          RCL_NOP             = 4'b1001,
          RCL_CMP_TAG         = 4'b1010,
          RCL_EVICT           = 4'b1011,
          RCL_INVALID         = 4'b1100,
          RCL_REQ_DATA_ENTRY  = 4'b1101,
          RCL_READ_DATA0      = 4'b1110,
          RCL_READ_DATA1      = 4'b1111;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//rcl state machine
assign vb_rcl_sm_clk_en = vb_rcl_sm_create_vld
                          ||  vb_rcl_sm_vld;
// &Instance("gated_clk_cell", "x_lsu_vb_rcl_sm_clk"); @62
gated_clk_cell  x_lsu_vb_rcl_sm_clk (
  .clk_in             (lsu_special_clk   ),
  .clk_out            (vb_rcl_sm_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vb_rcl_sm_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (lsu_special_clk     ), @63
//          .external_en   (1'b0               ), @64
//          .global_en     (cp0_yy_clk_en      ), @65
//          .module_en     (cp0_lsu_icg_en     ), @66
//          .local_en      (vb_rcl_sm_clk_en   ), @67
//          .clk_out       (vb_rcl_sm_clk      )); @68

assign vb_rcl_sm_create_clk_en  = vb_rcl_sm_create_vld;
// &Instance("gated_clk_cell", "x_lsu_vb_rcl_sm_create_clk"); @71
gated_clk_cell  x_lsu_vb_rcl_sm_create_clk (
  .clk_in                  (lsu_special_clk        ),
  .clk_out                 (vb_rcl_sm_create_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (vb_rcl_sm_create_clk_en),
  .module_en               (cp0_lsu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in        (lsu_special_clk     ), @72
//          .external_en   (1'b0               ), @73
//          .global_en     (cp0_yy_clk_en      ), @74
//          .module_en     (cp0_lsu_icg_en     ), @75
//          .local_en      (vb_rcl_sm_create_clk_en), @76
//          .clk_out       (vb_rcl_sm_create_clk)); @77


//wd state machine
assign vb_wd_sm_clk_en  = vb_data_wd_sm_req
                          ||  vb_wd_sm_vld;
// &Instance("gated_clk_cell", "x_lsu_vb_wd_sm_clk"); @83
gated_clk_cell  x_lsu_vb_wd_sm_clk (
  .clk_in             (lsu_special_clk   ),
  .clk_out            (vb_wd_sm_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (vb_wd_sm_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (lsu_special_clk     ), @84
//          .external_en   (1'b0               ), @85
//          .global_en     (cp0_yy_clk_en      ), @86
//          .module_en     (cp0_lsu_icg_en     ), @87
//          .local_en      (vb_wd_sm_clk_en    ), @88
//          .clk_out       (vb_wd_sm_clk       )); @89

//==========================================================
//              Instance addr entry
//==========================================================
//8 addr entry
// &ConnRule(s/_x$/[0]/); @95
// &ConnRule(s/_v$/_0/); @96
// &Instance("ct_lsu_vb_addr_entry","x_ct_lsu_vb_addr_entry_0"); @97
ct_lsu_vb_addr_entry  x_ct_lsu_vb_addr_entry_0 (
  .cp0_lsu_icg_en                         (cp0_lsu_icg_en                        ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .evict_req_success                      (evict_req_success                     ),
  .icc_vb_addr_tto6                       (icc_vb_addr_tto6                      ),
  .icc_vb_inv                             (icc_vb_inv                            ),
  .lfb_vb_addr_tto6                       (lfb_vb_addr_tto6                      ),
  .lfb_vb_id                              (lfb_vb_id                             ),
  .lsu_special_clk                        (lsu_special_clk                       ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pfu_biu_req_addr                       (pfu_biu_req_addr                      ),
  .rb_biu_req_addr                        (rb_biu_req_addr                       ),
  .snq_bypass_addr_tto6                   (snq_bypass_addr_tto6                  ),
  .snq_create_addr                        (snq_create_addr                       ),
  .st_da_vb_feedback_addr_tto14           (st_da_vb_feedback_addr_tto14          ),
  .vb_addr_entry_addr_tto6_v              (vb_addr_entry_addr_tto6_0             ),
  .vb_addr_entry_create_data_x            (vb_addr_entry_create_data[0]          ),
  .vb_addr_entry_create_gateclk_en_x      (vb_addr_entry_create_gateclk_en[0]    ),
  .vb_addr_entry_create_vld_x             (vb_addr_entry_create_vld[0]           ),
  .vb_addr_entry_data_pop_x               (vb_addr_entry_data_pop[0]             ),
  .vb_addr_entry_db_id_v                  (vb_addr_entry_db_id_0                 ),
  .vb_addr_entry_dep_remove_x             (vb_addr_entry_dep_remove[0]           ),
  .vb_addr_entry_feedback_vld_x           (vb_addr_entry_feedback_vld[0]         ),
  .vb_addr_entry_icc_create_dp_vld_x      (vb_addr_entry_icc_create_dp_vld[0]    ),
  .vb_addr_entry_inv_x                    (vb_addr_entry_inv[0]                  ),
  .vb_addr_entry_lfb_create_dp_vld_x      (vb_addr_entry_lfb_create_dp_vld[0]    ),
  .vb_addr_entry_lfb_create_x             (vb_addr_entry_lfb_create[0]           ),
  .vb_addr_entry_lfb_vb_req_hit_idx_x     (vb_addr_entry_lfb_vb_req_hit_idx[0]   ),
  .vb_addr_entry_pfu_biu_req_hit_idx_x    (vb_addr_entry_pfu_biu_req_hit_idx[0]  ),
  .vb_addr_entry_pop_x                    (vb_addr_entry_pop[0]                  ),
  .vb_addr_entry_rb_biu_req_hit_idx_x     (vb_addr_entry_rb_biu_req_hit_idx[0]   ),
  .vb_addr_entry_rcl_sm_req_x             (vb_addr_entry_rcl_sm_req[0]           ),
  .vb_addr_entry_set_way_mode_x           (vb_addr_entry_set_way_mode[0]         ),
  .vb_addr_entry_snq_bypass_hit_x         (vb_addr_entry_snq_bypass_hit[0]       ),
  .vb_addr_entry_snq_create_hit_idx_x     (vb_addr_entry_snq_create_hit_idx[0]   ),
  .vb_addr_entry_snq_start_wait_x         (vb_addr_entry_snq_start_wait[0]       ),
  .vb_addr_entry_source_id_v              (vb_addr_entry_source_id_0             ),
  .vb_addr_entry_vld_x                    (vb_addr_entry_vld[0]                  ),
  .vb_addr_entry_wmb_create_dp_vld_x      (vb_addr_entry_wmb_create_dp_vld[0]    ),
  .vb_addr_entry_wmb_create_x             (vb_addr_entry_wmb_create[0]           ),
  .vb_addr_entry_wmb_write_req_hit_idx_x  (vb_addr_entry_wmb_write_req_hit_idx[0]),
  .vb_data_entry_id                       (vb_data_entry_id                      ),
  .vb_rcl_sm_addr_grnt_x                  (vb_rcl_sm_addr_grnt[0]                ),
  .vb_rcl_sm_done_x                       (vb_rcl_sm_done[0]                     ),
  .wmb_vb_addr_tto6                       (wmb_vb_addr_tto6                      ),
  .wmb_vb_inv                             (wmb_vb_inv                            ),
  .wmb_vb_set_way_mode                    (wmb_vb_set_way_mode                   ),
  .wmb_write_ptr_encode                   (wmb_write_ptr_encode                  ),
  .wmb_write_req_addr                     (wmb_write_req_addr                    )
);


// &ConnRule(s/_x$/[1]/); @99
// &ConnRule(s/_v$/_1/); @100
// &Instance("ct_lsu_vb_addr_entry","x_ct_lsu_vb_addr_entry_1"); @101
ct_lsu_vb_addr_entry  x_ct_lsu_vb_addr_entry_1 (
  .cp0_lsu_icg_en                         (cp0_lsu_icg_en                        ),
  .cp0_yy_clk_en                          (cp0_yy_clk_en                         ),
  .cpurst_b                               (cpurst_b                              ),
  .evict_req_success                      (evict_req_success                     ),
  .icc_vb_addr_tto6                       (icc_vb_addr_tto6                      ),
  .icc_vb_inv                             (icc_vb_inv                            ),
  .lfb_vb_addr_tto6                       (lfb_vb_addr_tto6                      ),
  .lfb_vb_id                              (lfb_vb_id                             ),
  .lsu_special_clk                        (lsu_special_clk                       ),
  .pad_yy_icg_scan_en                     (pad_yy_icg_scan_en                    ),
  .pfu_biu_req_addr                       (pfu_biu_req_addr                      ),
  .rb_biu_req_addr                        (rb_biu_req_addr                       ),
  .snq_bypass_addr_tto6                   (snq_bypass_addr_tto6                  ),
  .snq_create_addr                        (snq_create_addr                       ),
  .st_da_vb_feedback_addr_tto14           (st_da_vb_feedback_addr_tto14          ),
  .vb_addr_entry_addr_tto6_v              (vb_addr_entry_addr_tto6_1             ),
  .vb_addr_entry_create_data_x            (vb_addr_entry_create_data[1]          ),
  .vb_addr_entry_create_gateclk_en_x      (vb_addr_entry_create_gateclk_en[1]    ),
  .vb_addr_entry_create_vld_x             (vb_addr_entry_create_vld[1]           ),
  .vb_addr_entry_data_pop_x               (vb_addr_entry_data_pop[1]             ),
  .vb_addr_entry_db_id_v                  (vb_addr_entry_db_id_1                 ),
  .vb_addr_entry_dep_remove_x             (vb_addr_entry_dep_remove[1]           ),
  .vb_addr_entry_feedback_vld_x           (vb_addr_entry_feedback_vld[1]         ),
  .vb_addr_entry_icc_create_dp_vld_x      (vb_addr_entry_icc_create_dp_vld[1]    ),
  .vb_addr_entry_inv_x                    (vb_addr_entry_inv[1]                  ),
  .vb_addr_entry_lfb_create_dp_vld_x      (vb_addr_entry_lfb_create_dp_vld[1]    ),
  .vb_addr_entry_lfb_create_x             (vb_addr_entry_lfb_create[1]           ),
  .vb_addr_entry_lfb_vb_req_hit_idx_x     (vb_addr_entry_lfb_vb_req_hit_idx[1]   ),
  .vb_addr_entry_pfu_biu_req_hit_idx_x    (vb_addr_entry_pfu_biu_req_hit_idx[1]  ),
  .vb_addr_entry_pop_x                    (vb_addr_entry_pop[1]                  ),
  .vb_addr_entry_rb_biu_req_hit_idx_x     (vb_addr_entry_rb_biu_req_hit_idx[1]   ),
  .vb_addr_entry_rcl_sm_req_x             (vb_addr_entry_rcl_sm_req[1]           ),
  .vb_addr_entry_set_way_mode_x           (vb_addr_entry_set_way_mode[1]         ),
  .vb_addr_entry_snq_bypass_hit_x         (vb_addr_entry_snq_bypass_hit[1]       ),
  .vb_addr_entry_snq_create_hit_idx_x     (vb_addr_entry_snq_create_hit_idx[1]   ),
  .vb_addr_entry_snq_start_wait_x         (vb_addr_entry_snq_start_wait[1]       ),
  .vb_addr_entry_source_id_v              (vb_addr_entry_source_id_1             ),
  .vb_addr_entry_vld_x                    (vb_addr_entry_vld[1]                  ),
  .vb_addr_entry_wmb_create_dp_vld_x      (vb_addr_entry_wmb_create_dp_vld[1]    ),
  .vb_addr_entry_wmb_create_x             (vb_addr_entry_wmb_create[1]           ),
  .vb_addr_entry_wmb_write_req_hit_idx_x  (vb_addr_entry_wmb_write_req_hit_idx[1]),
  .vb_data_entry_id                       (vb_data_entry_id                      ),
  .vb_rcl_sm_addr_grnt_x                  (vb_rcl_sm_addr_grnt[1]                ),
  .vb_rcl_sm_done_x                       (vb_rcl_sm_done[1]                     ),
  .wmb_vb_addr_tto6                       (wmb_vb_addr_tto6                      ),
  .wmb_vb_inv                             (wmb_vb_inv                            ),
  .wmb_vb_set_way_mode                    (wmb_vb_set_way_mode                   ),
  .wmb_write_ptr_encode                   (wmb_write_ptr_encode                  ),
  .wmb_write_req_addr                     (wmb_write_req_addr                    )
);


// //&ConnRule(s/_x$/[2]/); @103
// //&ConnRule(s/_v$/_2/); @104
//&Instance("ct_lsu_vb_addr_entry","x_ct_lsu_vb_addr_entry_2");
//
// //&ConnRule(s/_x$/[3]/); @107
// //&ConnRule(s/_v$/_3/); @108
//&Instance("ct_lsu_vb_addr_entry","x_ct_lsu_vb_addr_entry_3");

//==========================================================
//            Generate addr signal
//==========================================================
//------------------create ptr------------------------------
// &CombBeg; @115
always @( vb_addr_entry_vld[1:0])
begin
vb_addr_create_ptr[VB_ADDR_ENTRY-1:0]  = {VB_ADDR_ENTRY{1'b0}};
casez(vb_addr_entry_vld[VB_ADDR_ENTRY-1:0])
  2'b?0:vb_addr_create_ptr[0] = 1'b1;
  2'b01:vb_addr_create_ptr[1] = 1'b1;
//  4'b?011:vb_addr_create_ptr[2] = 1'b1;
//  4'b0111:vb_addr_create_ptr[3] = 1'b1;
  default:vb_addr_create_ptr[VB_ADDR_ENTRY-1:0]  = {VB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @124
end

//------------------full signal-----------------------------
assign vb_addr_full   = &vb_addr_entry_vld[VB_ADDR_ENTRY-1:0];

//------------------grnt signal to vb/pfu------------------
// &Force("output","vb_icc_create_grnt"); @130
assign vb_icc_create_grnt   = icc_vb_create_req
                              &&  !vb_addr_full;
// &Force("output","vb_lfb_create_grnt"); @133
assign vb_lfb_create_grnt   = lfb_vb_create_req
                              &&  !icc_vb_create_req
                              &&  !vb_addr_full;
// &Force("output","vb_wmb_create_grnt"); @137
assign vb_wmb_create_grnt   = wmb_vb_create_req
                              &&  !lfb_vb_create_req
                              &&  !icc_vb_create_req
                              &&  !vb_addr_full;

//------------------create signal---------------------------
assign vb_icc_create_vld    = vb_icc_create_grnt  &&  icc_vb_create_vld;
assign vb_lfb_create_vld    = vb_lfb_create_grnt  &&  lfb_vb_create_vld;
assign vb_wmb_create_vld    = vb_wmb_create_grnt  &&  wmb_vb_create_vld;

assign vb_addr_create_vld               = vb_icc_create_vld
                                          ||  vb_lfb_create_vld
                                          ||  vb_wmb_create_vld;

assign vb_addr_icc_create_dp_vld        = vb_icc_create_grnt  &&  icc_vb_create_dp_vld;
assign vb_addr_lfb_create_dp_vld        = vb_lfb_create_grnt  &&  lfb_vb_create_dp_vld;
assign vb_addr_wmb_create_dp_vld        = vb_wmb_create_grnt  &&  wmb_vb_create_dp_vld;

assign vb_addr_create_gateclk_en        = icc_vb_create_gateclk_en
                                          ||  lfb_vb_create_gateclk_en
                                          ||  wmb_vb_create_gateclk_en;

assign vb_addr_entry_create_vld[VB_ADDR_ENTRY-1:0]        = {VB_ADDR_ENTRY{vb_addr_create_vld}}
                                                            & vb_addr_create_ptr[VB_ADDR_ENTRY-1:0];

assign vb_addr_entry_icc_create_dp_vld[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{vb_addr_icc_create_dp_vld}}
                                                            & vb_addr_create_ptr[VB_ADDR_ENTRY-1:0];

assign vb_addr_entry_lfb_create_dp_vld[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{vb_addr_lfb_create_dp_vld}}
                                                            & vb_addr_create_ptr[VB_ADDR_ENTRY-1:0];

assign vb_addr_entry_wmb_create_dp_vld[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{vb_addr_wmb_create_dp_vld}}
                                                            & vb_addr_create_ptr[VB_ADDR_ENTRY-1:0];

assign vb_addr_entry_create_gateclk_en[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{vb_addr_create_gateclk_en}}
                                                            & vb_addr_create_ptr[VB_ADDR_ENTRY-1:0];

//==========================================================
//            read cache line state machine
//==========================================================
//---------------------registers----------------------------
//+-------+
//| state |
//+-------+
always @(posedge vb_rcl_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_rcl_sm_state[3:0]            <=  RCL_IDLE;
  else
    vb_rcl_sm_state[3:0]            <=  vb_rcl_sm_next_state[3:0];
end

assign vb_rcl_sm_vld  = vb_rcl_sm_state[3];

//for timing dcache interface is set register
// &Force("output", "vb_dcache_arb_ld_req"); @193
always @(posedge vb_rcl_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_dcache_arb_ld_req            <=  1'b0;
  else if(vb_dcache_arb_ld_req_set)
    vb_dcache_arb_ld_req            <=  1'b1;
  else
    vb_dcache_arb_ld_req            <=  1'b0;
end

// &Force("output","vb_dcache_arb_st_req"); @204
always @(posedge vb_rcl_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_dcache_arb_st_req            <=  1'b0;
  else if(vb_dcache_arb_st_req_set)
    vb_dcache_arb_st_req            <=  1'b1;
  else
    vb_dcache_arb_st_req            <=  1'b0;
end

//+---------+------+
//| addr_id | addr |
//+---------+------+
always @(posedge vb_rcl_sm_create_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0]  <=  {VB_ADDR_ENTRY{1'b0}};
    vb_rcl_sm_addr_tto6[`PA_WIDTH-7:0]    <=  {`PA_WIDTH-6{1'b0}};
  end
  else if(vb_rcl_sm_create_vld)
  begin
    vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0]  <=  vb_rcl_sm_req_addr_ptr[VB_ADDR_ENTRY-1:0];
    vb_rcl_sm_addr_tto6[`PA_WIDTH-7:0]    <=  vb_rcl_sm_req_addr_tto6[`PA_WIDTH-7:0];
  end
end

//+-------------+-----------+
//| cache_dirty | cache_way |
//+-------------+-----------+
always @(posedge vb_rcl_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    vb_rcl_sm_dcache_dirty      <=  1'b0;
    vb_rcl_sm_dcache_way        <=  1'b0;
  end
  else if(rcl_cmp_tag_vld)
  begin
    vb_rcl_sm_dcache_dirty      <=  vb_rcl_sm_reg_set_dcache_dirty;
    vb_rcl_sm_dcache_way        <=  vb_rcl_sm_reg_set_dcache_way;
  end
end

//+---------+
//| data_id |
//+---------+
// &Force("output","vb_rcl_sm_data_id"); @252
// &Force("output","vb_rcl_sm_addr_id"); @253
// &Force("output","vb_rcl_sm_inv"); @254
// &Force("output","vb_rcl_sm_lfb_create"); @255
// &Force("output","vb_wd_sm_data_bias"); @256
always @(posedge vb_rcl_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_rcl_sm_data_id[VB_DATA_ENTRY-1:0]  <=  {VB_DATA_ENTRY{1'b0}};
  else if(vb_rcl_sm_data_entry_req_success)
    vb_rcl_sm_data_id[VB_DATA_ENTRY-1:0]  <=  vb_data_create_ptr[VB_DATA_ENTRY-1:0];
end

//------------------state change----------------------------
// &CombBeg; @266
always @( st_da_vb_tag_reissue
       or vb_rcl_sm_state[3:0]
       or st_da_vb_ecc_err
       or st_da_dcache_replace_valid
       or st_da_dcache_dirty
       or dcache_arb_vb_st_grnt
       or evict_req_cancel
       or vb_rcl_sm_lfb_create
       or st_da_dcache_hit
       or dcache_arb_vb_ld_grnt
       or st_da_vb_ecc_stall
       or st_da_dcache_replace_dirty
       or ld_da_vb_snq_data_reissue
       or vb_rcl_sm_inv
       or evict_enable
       or st_da_dcache_miss
       or vb_data_full
       or evict_req_success
       or vb_addr_rcl_sm_req)
begin
vb_rcl_sm_next_state[3:0] = RCL_IDLE;
case(vb_rcl_sm_state[3:0])
  RCL_IDLE:
    if(vb_addr_rcl_sm_req)
      vb_rcl_sm_next_state[3:0] = RCL_R_TAG_DIRTY;
    else
      vb_rcl_sm_next_state[3:0] = RCL_IDLE;
  RCL_R_TAG_DIRTY:
    if(dcache_arb_vb_st_grnt)
      vb_rcl_sm_next_state[3:0] = RCL_NOP;
    else
      vb_rcl_sm_next_state[3:0] = RCL_R_TAG_DIRTY;
  RCL_NOP:
    if(st_da_vb_tag_reissue)
      vb_rcl_sm_next_state[3:0] = RCL_R_TAG_DIRTY;
    else
      vb_rcl_sm_next_state[3:0] = RCL_CMP_TAG;
  RCL_CMP_TAG:
    if(st_da_vb_ecc_stall)  //ecc stall
        vb_rcl_sm_next_state[3:0] = RCL_CMP_TAG;
    else if(st_da_vb_ecc_err)  //ecc error
        vb_rcl_sm_next_state[3:0] = RCL_IDLE;
    else if(vb_rcl_sm_lfb_create)//lfb
    begin
      if(st_da_dcache_hit)//dcache hit
        vb_rcl_sm_next_state[3:0] = RCL_IDLE;
      else if(!st_da_dcache_replace_valid)//replace line I state
        vb_rcl_sm_next_state[3:0] = RCL_IDLE;
      else if(!st_da_dcache_replace_dirty)
        vb_rcl_sm_next_state[3:0] = RCL_INVALID;
      else//replace line E/M state
      begin
        if(!vb_data_full)
          vb_rcl_sm_next_state[3:0] = RCL_READ_DATA0;
        else
          vb_rcl_sm_next_state[3:0] = RCL_REQ_DATA_ENTRY;
      end
    end
    else//dcache va/sw, icc clear(&inv)
    begin
      if(st_da_dcache_miss)//I state
        vb_rcl_sm_next_state[3:0] = RCL_IDLE;
      else if(!st_da_dcache_dirty &&  !vb_rcl_sm_inv)//only clear, E/S state
        vb_rcl_sm_next_state[3:0] = RCL_IDLE;
      else if(!st_da_dcache_dirty)//clear&inv, S/E
        vb_rcl_sm_next_state[3:0] = RCL_INVALID;
      else//clear(&inv) M state
      begin
        if(!vb_data_full)
          vb_rcl_sm_next_state[3:0] = RCL_READ_DATA0;
        else
          vb_rcl_sm_next_state[3:0] = RCL_REQ_DATA_ENTRY;
      end
    end
  RCL_INVALID:
    if(dcache_arb_vb_st_grnt && evict_enable)
      vb_rcl_sm_next_state[3:0] = RCL_EVICT;
    else if(dcache_arb_vb_st_grnt)
      vb_rcl_sm_next_state[3:0] = RCL_IDLE;
    else
      vb_rcl_sm_next_state[3:0] = RCL_INVALID;
  RCL_EVICT:
    if(evict_req_success || evict_req_cancel)
      vb_rcl_sm_next_state[3:0] = RCL_IDLE;
    else
      vb_rcl_sm_next_state[3:0] = RCL_EVICT;
  RCL_REQ_DATA_ENTRY:
    if(!vb_data_full)
      vb_rcl_sm_next_state[3:0] = RCL_READ_DATA0;
    else
      vb_rcl_sm_next_state[3:0] = RCL_REQ_DATA_ENTRY;
  RCL_READ_DATA0:
    if(dcache_arb_vb_ld_grnt)
      vb_rcl_sm_next_state[3:0] = RCL_READ_DATA1;
    else
      vb_rcl_sm_next_state[3:0] = RCL_READ_DATA0;
  RCL_READ_DATA1:
    if(ld_da_vb_snq_data_reissue)
      vb_rcl_sm_next_state[3:0] = RCL_READ_DATA0;
    else
      vb_rcl_sm_next_state[3:0] = RCL_IDLE;
  default:vb_rcl_sm_next_state[3:0] = RCL_IDLE;
endcase
// &CombEnd; @350
end

//------------------create singal---------------------------
assign vb_rcl_sm_permit     = !vb_rcl_sm_vld;
assign vb_addr_rcl_sm_req   = |vb_addr_entry_rcl_sm_req[VB_ADDR_ENTRY-1:0];
assign vb_rcl_sm_create_vld = vb_addr_rcl_sm_req
                              &&  vb_rcl_sm_permit;

//------------------create info-----------------------------
// &CombBeg; @359
always @( vb_addr_entry_rcl_sm_req[1:0])
begin
vb_rcl_sm_req_addr_ptr[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{1'b0}};
casez(vb_addr_entry_rcl_sm_req[VB_ADDR_ENTRY-1:0])
  2'b?1:vb_rcl_sm_req_addr_ptr[0]  = 1'b1;
  2'b10:vb_rcl_sm_req_addr_ptr[1]  = 1'b1;
//  4'b?100:vb_rcl_sm_req_addr_ptr[2]  = 1'b1;
//  4'b1000:vb_rcl_sm_req_addr_ptr[3]  = 1'b1;
  default:vb_rcl_sm_req_addr_ptr[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @368
end

assign vb_rcl_sm_addr_grnt[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{vb_rcl_sm_create_vld}}
                                                & vb_rcl_sm_req_addr_ptr[VB_ADDR_ENTRY-1:0];

assign vb_rcl_sm_req_addr_tto6[`PA_WIDTH-7:0]  =
                {`PA_WIDTH-6{vb_rcl_sm_req_addr_ptr[0]}} & vb_addr_entry_addr_tto6_0[`PA_WIDTH-7:0]
                | {`PA_WIDTH-6{vb_rcl_sm_req_addr_ptr[1]}} & vb_addr_entry_addr_tto6_1[`PA_WIDTH-7:0];
//                | {`PA_WIDTH-6{vb_rcl_sm_req_addr_ptr[2]}} & vb_addr_entry_addr_tto6_2[`PA_WIDTH-7:0]
//                | {`PA_WIDTH-6{vb_rcl_sm_req_addr_ptr[3]}} & vb_addr_entry_addr_tto6_3[`PA_WIDTH-7:0];


//-------------rcl state info from addr entry---------------
assign vb_rcl_sm_set_way_mode = |(vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0]
                                  & vb_addr_entry_set_way_mode[VB_ADDR_ENTRY-1:0]);
assign vb_rcl_sm_inv          = |(vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0]
                                  & vb_addr_entry_inv[VB_ADDR_ENTRY-1:0]);
//assign vb_rcl_sm_wmb_create   = |(vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0]
//                                  & vb_addr_entry_wmb_create[VB_ADDR_ENTRY-1:0]);
assign vb_rcl_sm_lfb_create   = |(vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0]
                                  & vb_addr_entry_lfb_create[VB_ADDR_ENTRY-1:0]);
//assign vb_rcl_sm_source_id[2:0] = {3{vb_rcl_sm_addr_id[0]}}  & vb_addr_entry_source_id_0[2:0]
//                                  | {3{vb_rcl_sm_addr_id[1]}}  & vb_addr_entry_source_id_1[2:0];
//                                  | {3{vb_rcl_sm_addr_id[2]}}  & vb_addr_entry_source_id_2[2:0]
//                                  | {3{vb_rcl_sm_addr_id[3]}}  & vb_addr_entry_source_id_3[2:0];

//&Instance("ct_rtu_expand_8","x_lsu_vb_source_id_expand");
// //&Connect( .x_num          (vb_rcl_sm_source_id[2:0]               ), @395
// //          .x_num_expand   (vb_rcl_sm_source_id_expand[7:0] )); @396
//
//for wmb timing,expand vb addr id simultaneously          
// &Instance("ct_rtu_expand_8","x_lsu_vb_source_id_0_expand"); @399
ct_rtu_expand_8  x_lsu_vb_source_id_0_expand (
  .x_num                                 (vb_addr_entry_source_id_0[2:0]       ),
  .x_num_expand                          (vb_addr_entry_source_id_0_expand[7:0])
);

// &Connect( .x_num          (vb_addr_entry_source_id_0[2:0]               ), @400
//           .x_num_expand   (vb_addr_entry_source_id_0_expand[7:0] )); @401

// &Instance("ct_rtu_expand_8","x_lsu_vb_source_id_1_expand"); @403
ct_rtu_expand_8  x_lsu_vb_source_id_1_expand (
  .x_num                                 (vb_addr_entry_source_id_1[2:0]       ),
  .x_num_expand                          (vb_addr_entry_source_id_1_expand[7:0])
);

// &Connect( .x_num          (vb_addr_entry_source_id_1[2:0]               ), @404
//           .x_num_expand   (vb_addr_entry_source_id_1_expand[7:0] )); @405

assign vb_rcl_sm_source_id_expand[7:0] = {8{vb_rcl_sm_addr_id[0]}}  & vb_addr_entry_source_id_0_expand[7:0]
                                         | {8{vb_rcl_sm_addr_id[1]}}  & vb_addr_entry_source_id_1_expand[7:0];

//--------------------CMP_TAG STATE-------------------------
//-------------------feed back signal-----------------------
assign rcl_cmp_tag_vld      = (vb_rcl_sm_state[3:0]  ==  RCL_CMP_TAG)
                              && !st_da_vb_ecc_stall
                              && !st_da_vb_ecc_err;
assign vb_addr_feedback_vld = rcl_cmp_tag_vld;
assign vb_addr_entry_feedback_vld[VB_ADDR_ENTRY-1:0]  = {VB_ADDR_ENTRY{vb_addr_feedback_vld}}
                                                        & vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0];
//----------------------evict control-----------------------
assign evict_enable = vb_rcl_sm_lfb_create;

//------------------done signal to lfb/wmb------------------
assign vb_rcl_lfb_unnecessary     = rcl_cmp_tag_vld
                                    &&  (st_da_dcache_hit//dcache hit
                                        ||  !st_da_dcache_replace_valid);//fill way I state
assign vb_rcl_iccwmb_unnecessary  = rcl_cmp_tag_vld
                                    &&  (st_da_dcache_miss
                                        ||  (!st_da_dcache_dirty &&  !vb_rcl_sm_inv));//only clear E/S state
//for ecc err
assign vb_rcl_ecc_done            = (vb_rcl_sm_state[3:0]  ==  RCL_CMP_TAG)
                                    && st_da_vb_ecc_err;
assign vb_rcl_set_dirty_done  = (vb_rcl_sm_state[3:0]  ==  RCL_INVALID)
                                    &&  !evict_enable
                                    &&  dcache_arb_vb_st_grnt;
assign vb_rcl_req_data_done   = (vb_rcl_sm_state[3:0]  ==  RCL_READ_DATA1)
                                    && !ld_da_vb_snq_data_reissue;

//------------------done signal to vb entry------------------
//for snq dep, other done will invalid entry
assign vb_rcl_sm_done[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{vb_rcl_req_data_done || evict_req_success}}
                                           & vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0];
//---------------to lfb-----------------
//vb_lfb_rcl_done
// &Force("output","vb_lfb_rcl_done"); @443
assign vb_lfb_rcl_done  = vb_rcl_sm_lfb_create
                          &&  (vb_rcl_lfb_unnecessary
                              ||  vb_rcl_set_dirty_done
                              ||  evict_req_success
                              ||  evict_req_cancel
                              ||  vb_rcl_ecc_done
                              ||  vb_rcl_req_data_done);

assign vb_lfb_addr_entry_rcl_done[LFB_ADDR_ENTRY-1:0] = {LFB_ADDR_ENTRY{vb_lfb_rcl_done}}
                                                        & vb_rcl_sm_source_id_expand[LFB_ADDR_ENTRY-1:0];
//vb_lfb_dcache_hit and dirty
assign vb_lfb_dcache_hit  = rcl_cmp_tag_vld
                            &  st_da_dcache_hit;
assign vb_lfb_dcache_dirty= st_da_dcache_dirty;
//vb_lfb_cache_way
assign vb_lfb_dcache_way  = vb_rcl_sm_sel_dcache_reg_info
                            ? vb_rcl_sm_dcache_way
                            : vb_rcl_sm_reg_set_dcache_way;

//---------------to wmb-----------------
assign vb_addr_entry_pop[VB_ADDR_ENTRY-1:0] = vb_rcl_sm_addr_pop_req[VB_ADDR_ENTRY-1:0]
                                              | vb_addr_entry_bypass_pop[VB_ADDR_ENTRY-1:0]
                                              | vb_addr_entry_b_resp[VB_ADDR_ENTRY-1:0];

assign vb_addr_entry_wmb_pop[VB_ADDR_ENTRY-1:0] = vb_addr_entry_pop[VB_ADDR_ENTRY-1:0]
                                                  & vb_addr_entry_wmb_create[VB_ADDR_ENTRY-1:0];    

//assign vb_wmb_rcl_done_gateclk_en = vb_rcl_sm_wmb_create
//                                    &&  ((vb_rcl_sm_state[3:0] ==  RCL_CMP_TAG)
//                                        ||  (vb_rcl_sm_state[3:0] ==  RCL_INVALID)
//                                        ||  (vb_rcl_sm_state[3:0] ==  RCL_READ_DATA1));

//assign vb_wmb_rcl_done            = vb_rcl_sm_wmb_create
//                                    &&  (vb_rcl_iccwmb_unnecessary
//                                        ||  vb_rcl_set_dirty_done
//                                        ||  vb_rcl_ecc_done
//                                        ||  vb_rcl_req_data_done);

//assign vb_wmb_entry_rcl_done_gateclk_en[WMB_ENTRY-1:0]  = {WMB_ENTRY{vb_wmb_rcl_done_gateclk_en}}
//                                                          & vb_rcl_sm_source_id_expand[WMB_ENTRY-1:0];
//assign vb_wmb_entry_rcl_done[WMB_ENTRY-1:0]             = {WMB_ENTRY{vb_wmb_rcl_done}}
//                                                          & vb_rcl_sm_source_id_expand[WMB_ENTRY-1:0];

assign vb_wmb_entry_rcl_done[WMB_ENTRY-1:0] = {8{vb_addr_entry_wmb_pop[0]}}  & vb_addr_entry_source_id_0_expand[7:0]
                                              | {8{vb_addr_entry_wmb_pop[1]}}  & vb_addr_entry_source_id_1_expand[7:0];

// &Force("output","vb_wmb_entry_rcl_done"); @490
//assign vb_wmb_entry_rcl_done_gateclk_en[WMB_ENTRY-1:0] = vb_wmb_entry_rcl_done[WMB_ENTRY-1:0]; 
//send_data means vb write back data and wmb must wait for b_resp
//assign vb_wmb_rcl_send_data = vb_rcl_sm_wmb_create
//                              &&  vb_rcl_req_data_done;

//assign vb_wmb_aw_id[4:0]  = {BIU_VB_ID_T,vb_rcl_sm_addr_id_encode[1:0]};

//---------rcl get dcache info at CMP_TAG state-------------
// if lfb create, then set fill_way and fill_dirty to reg and data entry,
// if wmb create, then set hit way and hit dirty to reg and data entry
assign vb_rcl_sm_reg_set_dcache_way   = vb_rcl_sm_lfb_create
                                        ? st_da_dcache_replace_way
                                        : st_da_dcache_way;
assign vb_rcl_sm_reg_set_dcache_dirty = vb_rcl_sm_lfb_create
                                        ? st_da_dcache_replace_dirty
                                        : st_da_dcache_dirty;

//-------------------create data entry----------------------
assign vb_rcl_sm_sel_dcache_reg_info  = vb_rcl_sm_state[2]
                                        || evict_req;

assign vb_rcl_sm_data_dcache_dirty    = vb_rcl_sm_sel_dcache_reg_info
                                        ? vb_rcl_sm_dcache_dirty
                                        : vb_rcl_sm_reg_set_dcache_dirty;

//assign vb_rcl_sm_addr_id_encode[1:0]  = {2{vb_rcl_sm_addr_id[0]}} & 2'b00
//                                        | {2{vb_rcl_sm_addr_id[1]}} & 2'b01;
//                                        | {2{vb_rcl_sm_addr_id[2]}} & 2'b10
//                                        | {2{vb_rcl_sm_addr_id[3]}} & 2'b11;

assign vb_data_create_vld     = rcl_cmp_tag_vld
                                    &&  (vb_rcl_sm_lfb_create
                                            &&  st_da_dcache_miss
                                            &&  st_da_dcache_replace_valid
                                            &&  st_da_dcache_replace_dirty
                                        ||  !vb_rcl_sm_lfb_create
                                            &&  st_da_dcache_hit
                                            &&  st_da_dcache_dirty)//not lfb M state
                                ||  (vb_rcl_sm_state[3:0]  ==  RCL_REQ_DATA_ENTRY);

assign vb_data_create_dp_vld  = rcl_cmp_tag_vld
                                ||  (vb_rcl_sm_state[3:0]  ==  RCL_REQ_DATA_ENTRY);

assign vb_data_create_gateclk_en  = vb_data_create_dp_vld;

assign vb_rcl_sm_data_entry_req_success = vb_data_create_vld  &&  !vb_data_full;

//--------------------cache interface set-------------------
assign vb_dcache_arb_ld_req_set = (vb_rcl_sm_next_state[3:0]  ==  RCL_READ_DATA0)
                                  ||  (vb_rcl_sm_next_state[3:0]  ==  RCL_READ_DATA1)
                                  ||  (vb_rcl_sm_next_state[3:0]  ==  RCL_INVALID);

assign vb_dcache_arb_st_req_set = (vb_rcl_sm_next_state[3:0]  ==  RCL_R_TAG_DIRTY)
                                  ||  (vb_rcl_sm_next_state[3:0]  ==  RCL_READ_DATA1)
                                  ||  (vb_rcl_sm_next_state[3:0]  ==  RCL_INVALID);

//----------------------cache interface---------------------
assign vb_dcache_arb_write    = (vb_rcl_sm_state[3:0]  ==  RCL_READ_DATA1)
                                ||  (vb_rcl_sm_state[3:0]  ==  RCL_INVALID);
assign vb_dcache_arb_serial_req  = vb_rcl_sm_state[3:0]  ==  RCL_READ_DATA0;
assign vb_dcache_arb_data_way    = vb_rcl_sm_dcache_way;

// &Instance("ct_lsu_29bit_ecc_encode", "x_ct_dcache_29bit_ecc_encode"); @557
// &Connect(.data_encode    (vb_tag_bf_ecc[28:0] ),   @558
//          .ecc_code       (vb_tag_ecc[5:0]     ),  @559
//          .parity_bit     (vb_tag_parity       )  @560
//         ); @561
//---------------tag array--------------
// &Force("output","vb_dcache_arb_ld_tag_req"); @569
assign vb_dcache_arb_ld_tag_req         = vb_dcache_arb_write
                                          &&  vb_rcl_sm_inv;
assign vb_dcache_arb_ld_tag_gateclk_en  = vb_dcache_arb_ld_req
                                          &&  vb_dcache_arb_ld_tag_req;
assign vb_dcache_arb_ld_tag_idx[8:0]    = vb_rcl_sm_addr_tto6[8:0];
assign vb_dcache_arb_ld_tag_wen[1:0]    = {vb_rcl_sm_dcache_way,!vb_rcl_sm_dcache_way};

// &Force("output","vb_dcache_arb_st_tag_req"); @577
assign vb_dcache_arb_st_tag_req         = (vb_rcl_sm_state[3:0]  ==  RCL_R_TAG_DIRTY);
assign vb_dcache_arb_st_tag_gateclk_en  = vb_dcache_arb_st_req
                                          &&  vb_dcache_arb_st_tag_req;
assign vb_dcache_arb_st_tag_idx[8:0]    = vb_rcl_sm_addr_tto6[8:0];

//---------------dirty array------------
// &Force("output","vb_dcache_arb_st_dirty_req"); @590
assign vb_dcache_arb_st_dirty_req       = vb_dcache_arb_st_req;
assign vb_dcache_arb_st_dirty_gateclk_en= vb_dcache_arb_st_req
                                          &&  vb_dcache_arb_st_dirty_req;
assign vb_dcache_arb_st_dirty_idx[8:0]  = vb_rcl_sm_addr_tto6[8:0];
assign vb_dcache_arb_st_dirty_din[6:0]  = {vb_rcl_sm_dcache_way,2'b0,!vb_rcl_sm_inv,2'b0,!vb_rcl_sm_inv};
assign vb_dcache_arb_st_dirty_gwen      = vb_dcache_arb_write;
assign vb_dcache_arb_st_dirty_wen[6:0]  = vb_dcache_arb_write
                                          ? {vb_rcl_sm_inv,{3{vb_rcl_sm_dcache_way}},{3{!vb_rcl_sm_dcache_way}}}
                                          : 7'b0;

//---------------data array-------------
assign vb_dcache_arb_ld_data_gateclk_en[7:0] = {8{vb_dcache_arb_ld_req}};
assign vb_dcache_arb_ld_data_idx[10:0]  = {vb_rcl_sm_addr_tto6[8:0],
                                          vb_dcache_arb_write,
                                          vb_rcl_sm_dcache_way};
//-------------------------borrow signal--------------------
assign vb_dcache_arb_ld_borrow_req      = (vb_rcl_sm_state[3:0]  ==  RCL_READ_DATA0)
                                          ||  (vb_rcl_sm_state[3:0]  ==  RCL_READ_DATA1)
                                              && !ld_da_vb_snq_data_reissue;
assign vb_dcache_arb_ld_borrow_req_gate = (vb_rcl_sm_state[3:0]  ==  RCL_READ_DATA0)
                                          ||  (vb_rcl_sm_state[3:0]  ==  RCL_READ_DATA1);
assign vb_dcache_arb_st_borrow_req      = vb_rcl_sm_state[3:0]  ==  RCL_R_TAG_DIRTY;

assign vb_dcache_arb_borrow_addr[`PA_WIDTH-1:0]  = {vb_rcl_sm_addr_tto6[`PA_WIDTH-7:0],6'b0};

//-------------------other signal---------------------------
assign vb_dcache_arb_set_way_mode    = vb_rcl_sm_set_way_mode;
assign vb_dcache_arb_dcache_replace  = vb_rcl_sm_lfb_create;

//---------------------set data ready-----------------------
//----------------------pop/done signal---------------------
assign vb_rcl_sm_set_data_done_vld      = dcache_arb_vb_ld_grnt
                                          &&  (vb_rcl_sm_state[3:0]
                                              ==  RCL_READ_DATA0);
assign vb_rcl_sm_data_set_data_done[VB_DATA_ENTRY-1:0] = {VB_DATA_ENTRY{vb_rcl_sm_set_data_done_vld}}
                                                          & vb_rcl_sm_data_id[VB_DATA_ENTRY-1:0];

assign vb_rcl_sm_addr_pop_vld = vb_rcl_set_dirty_done
                                ||  evict_req_cancel
                                ||  vb_rcl_sm_lfb_create  &&  vb_rcl_lfb_unnecessary
                                ||  !vb_rcl_sm_lfb_create &&  vb_rcl_iccwmb_unnecessary
                                ||  vb_rcl_ecc_done;
assign vb_rcl_sm_addr_pop_req[VB_ADDR_ENTRY-1:0]  = {VB_ADDR_ENTRY{vb_rcl_sm_addr_pop_vld}}
                                                    & vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0];
       
//assign vb_rcl_sm_addr_pop_gateclk_en = (vb_rcl_sm_state[3:0]  ==  RCL_INVALID)
//                                       || (vb_rcl_sm_state[3:0]  ==   RCL_EVICT)                                            
//                                       || (vb_rcl_sm_state[3:0]  ==   RCL_CMP_TAG);                                            
//==========================================================
//                  Create data entry
//==========================================================
//------------------create ptr------------------------------
// &CombBeg; @653
always @( vb_sdb_data_entry_vld[2:0])
begin
vb_data_create_ptr[VB_DATA_ENTRY-1:0]  = {VB_DATA_ENTRY{1'b0}};
casez(vb_sdb_data_entry_vld[VB_DATA_ENTRY-1:0])
  3'b??0:vb_data_create_ptr[0] = 1'b1;
  3'b?01:vb_data_create_ptr[1] = 1'b1;
  3'b011:vb_data_create_ptr[2] = 1'b1;
  default:vb_data_create_ptr[VB_DATA_ENTRY-1:0]  = {VB_DATA_ENTRY{1'b0}};
endcase
// &CombEnd; @661
end

//------------------full signal-----------------------------
assign vb_data_full   = &vb_sdb_data_entry_vld[VB_DATA_ENTRY-1:0];

//------------------create signal---------------------------
assign vb_data_entry_create_vld[VB_DATA_ENTRY-1:0]        = {VB_DATA_ENTRY{vb_data_create_vld}}
                                                            & vb_data_create_ptr[VB_DATA_ENTRY-1:0];

assign vb_data_entry_create_dp_vld[VB_DATA_ENTRY-1:0]     = {VB_DATA_ENTRY{vb_data_create_dp_vld}}
                                                            & vb_data_create_ptr[VB_DATA_ENTRY-1:0];

assign vb_data_entry_create_gateclk_en[VB_DATA_ENTRY-1:0] = {VB_DATA_ENTRY{vb_data_create_gateclk_en}}
                                                            & vb_data_create_ptr[VB_DATA_ENTRY-1:0];

//for entry record
assign vb_data_entry_id[VB_DATA_ENTRY-1:0] = vb_data_create_ptr[VB_DATA_ENTRY-1:0];

assign vb_addr_entry_create_data[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{vb_rcl_sm_data_entry_req_success}}
                                                      & vb_rcl_sm_addr_id[VB_ADDR_ENTRY-1:0]; 
//==========================================================
//            write evict
//==========================================================
//in order to maintain snoop filter,should send evict transaction 
assign evict_req = vb_rcl_sm_state[3:0] == RCL_EVICT;

assign evict_req_addr_tto6[`PA_WIDTH-7:0] = {`PA_WIDTH-6{vb_rcl_sm_addr_id[0]}} & vb_addr_entry_addr_tto6_0[`PA_WIDTH-7:0]
                                            | {`PA_WIDTH-6{vb_rcl_sm_addr_id[1]}} & vb_addr_entry_addr_tto6_1[`PA_WIDTH-7:0];

assign evict_req_success = !vb_data_biu_req && bus_arb_vb_aw_grnt;
assign evict_req_cancel  = evict_req
                           && !bus_arb_vb_aw_grnt
                           && (vb_rcl_sm_addr_id[1:0] == snq_depd_vb_id[1:0]);

//for wfifo create mask
//assign evict_trans = evict_req && !vb_data_biu_req;

//for lm, evict or write back should clear lm
assign vb_invalid_vld  = vb_dcache_arb_ld_tag_req;

assign victim_addr[`PA_WIDTH-7:0] = evict_req_addr_tto6[`PA_WIDTH-7:0];
//==========================================================
//            arbitrate req biu signal
//==========================================================
//-----------------biu aw req ptr---------------------------
assign vb_data_biu_req = |vb_data_entry_biu_req[VB_DATA_ENTRY-1:0];

// &CombBeg; @708
always @( vb_data_entry_biu_req[2:0])
begin
vb_data_biu_req_ptr[VB_DATA_ENTRY-1:0]  = {VB_DATA_ENTRY{1'b0}};
casez(vb_data_entry_biu_req[VB_DATA_ENTRY-1:0])
  3'b??1:vb_data_biu_req_ptr[0] = 1'b1;
  3'b?10:vb_data_biu_req_ptr[1] = 1'b1;
  3'b100:vb_data_biu_req_ptr[2] = 1'b1;
  default:vb_data_biu_req_ptr[VB_DATA_ENTRY-1:0]  = {VB_DATA_ENTRY{1'b0}};
endcase
// &CombEnd; @716
end

//-----------------biu aw req success-----------------------
assign vb_data_entry_biu_req_success[VB_DATA_ENTRY-1:0] = {VB_DATA_ENTRY{bus_arb_vb_aw_grnt}}
                                                          & vb_data_biu_req_ptr[VB_DATA_ENTRY-1:0];
//-----------------biu aw req info--------------------------
// &Force("output", "vb_biu_aw_req"); @722
assign vb_biu_aw_req            = vb_data_biu_req || evict_req;
assign vb_biu_aw_dp_req         = vb_biu_aw_req;
assign vb_biu_aw_req_gateclk_en = vb_biu_aw_req;
assign vb_biu_aw_req_dirty      = |(vb_data_biu_req_ptr[VB_DATA_ENTRY-1:0]  & vb_data_entry_dirty[VB_DATA_ENTRY-1:0]);
assign vb_biu_aw_req_lfb_create = |(vb_data_biu_req_ptr[VB_DATA_ENTRY-1:0]  & vb_data_entry_lfb_create[VB_DATA_ENTRY-1:0]);
assign vb_biu_aw_req_inv        = |(vb_data_biu_req_ptr[VB_DATA_ENTRY-1:0]  & vb_data_entry_inv[VB_DATA_ENTRY-1:0]);
assign vb_biu_aw_req_id[1:0]    = {2{vb_data_biu_req_ptr[0]}} & {1'b0,vb_data_entry_addr_id_0[1]}      //encode id
                                  | {2{vb_data_biu_req_ptr[1]}} & {1'b0,vb_data_entry_addr_id_1[1]}
                                  | {2{vb_data_biu_req_ptr[2]}} & {1'b0,vb_data_entry_addr_id_2[1]};

// &CombBeg; @733
always @( vb_biu_aw_req_id[1:0])
begin
vb_biu_aw_addr_ptr[VB_ADDR_ENTRY-1:0]  = {VB_ADDR_ENTRY{1'b0}};
case(vb_biu_aw_req_id[1:0])
  2'd0:vb_biu_aw_addr_ptr[0]  = 1'b1;
  2'd1:vb_biu_aw_addr_ptr[1]  = 1'b1;
//  2'd2:vb_biu_aw_addr_ptr[2]  = 1'b1;
//  2'd3:vb_biu_aw_addr_ptr[3]  = 1'b1;
  default:vb_biu_aw_addr_ptr[VB_ADDR_ENTRY-1:0]  = {VB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @742
end

assign vb_biu_aw_req_addr_tto6[`PA_WIDTH-7:0]  =
                {`PA_WIDTH-6{vb_biu_aw_addr_ptr[0]}} & vb_addr_entry_addr_tto6_0[`PA_WIDTH-7:0]
                | {`PA_WIDTH-6{vb_biu_aw_addr_ptr[1]}} & vb_addr_entry_addr_tto6_1[`PA_WIDTH-7:0];
//                | {`PA_WIDTH-6{vb_biu_aw_addr_ptr[2]}} & vb_addr_entry_addr_tto6_2[`PA_WIDTH-7:0]
//                | {`PA_WIDTH-6{vb_biu_aw_addr_ptr[3]}} & vb_addr_entry_addr_tto6_3[`PA_WIDTH-7:0];

//-----------------interface to bus_arb---------------------
assign vb_biu_aw_id[4:0]  =  vb_data_biu_req
                             ? {BIU_VB_ID_T,vb_biu_aw_req_id[1:0]}
                             : {BIU_VB_ID_T,1'b0,vb_rcl_sm_addr_id[1]};   //evict id
assign vb_biu_aw_addr[`PA_WIDTH-1:0] = vb_data_biu_req
                                       ? {vb_biu_aw_req_addr_tto6[`PA_WIDTH-7:0],6'b0}
                                       : {evict_req_addr_tto6[`PA_WIDTH-7:0],6'b0};
assign vb_biu_aw_len[1:0]   = 2'b11;
assign vb_biu_aw_size[2:0]  = 3'b100;
assign vb_biu_aw_burst[1:0] = 2'b01;
assign vb_biu_aw_lock = 1'b0;
//cacheable,weak order, bufferable
assign vb_biu_aw_cache[3:0]  = 4'b1111;
//data,security,supervisor
assign vb_biu_aw_prot[2:0]  = 3'b011;
assign vb_biu_aw_user       = 1'b1;
// &CombBeg; @766
always @( vb_biu_aw_req_lfb_create
       or vb_biu_aw_req_inv
       or vb_biu_aw_req_dirty)
begin
vb_biu_aw_req_snoop[2:0]  = 3'b0;
casez({vb_biu_aw_req_dirty,vb_biu_aw_req_lfb_create,vb_biu_aw_req_inv})
  3'b01?:vb_biu_aw_req_snoop[2:0]  = 3'b101;//writeevict
  3'b11?:vb_biu_aw_req_snoop[2:0]  = 3'b011;//writeback
  3'b101:vb_biu_aw_req_snoop[2:0]  = 3'b011;//writeback
  3'b100:vb_biu_aw_req_snoop[2:0]  = 3'b010;//writeclean
  default:vb_biu_aw_req_snoop[2:0]  = 3'b0;
endcase
// &CombEnd; @775
end
assign vb_biu_aw_snoop[2:0]   = vb_data_biu_req
                                ? vb_biu_aw_req_snoop[2:0]
                                : 3'b100;   //evict
assign vb_biu_aw_domain[1:0]  = 2'b01;
//if lfb create, neglect bar inst
assign vb_biu_aw_bar[1:0]     = {vb_biu_aw_req_lfb_create,1'b0};
assign vb_biu_aw_unique = !vb_biu_aw_req_dirty  &&  vb_biu_aw_req_lfb_create;//writeevict

//==========================================================
//              write data state machine
//==========================================================
//---------------------registers----------------------------
//+-----+
//| vld |
//+-----+
always @(posedge vb_wd_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_wd_sm_vld                        <=  1'b0;
  else if(vb_wd_sm_start_vld)
    vb_wd_sm_vld                        <=  1'b1;
  else if(vb_wd_sm_inv)
    vb_wd_sm_vld                        <=  1'b0;
end  

//+---------+
//| data_id |
//+---------+
always @(posedge vb_wd_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_wd_sm_data_id[VB_DATA_ENTRY-1:0] <=  {VB_DATA_ENTRY{1'b0}};
  else if(vb_wd_sm_start_vld)
    vb_wd_sm_data_id[VB_DATA_ENTRY-1:0] <=  vb_data_wd_sm_req_ptr[VB_DATA_ENTRY-1:0];
end  

//+-----------+
//| data_bias |
//+-----------+
always @(posedge vb_wd_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    vb_wd_sm_data_bias[3:0]             <=  4'b1;
  else if(vb_wd_sm_start_vld)
    vb_wd_sm_data_bias[3:0]             <=  4'b1;
  else if(vb_wd_sm_vld  &&  bus_arb_vb_w_grnt)
    vb_wd_sm_data_bias[3:0]             <=  {vb_wd_sm_data_bias[2:0],1'b0};
end  


//------------------create signal---------------------------
assign vb_wd_sm_vld_permit  = vb_wd_sm_vld
                              &&  vb_wd_sm_data_bias[3]
                              &&  bus_arb_vb_w_grnt;
assign vb_wd_sm_permit      = !vb_wd_sm_vld ||  vb_wd_sm_vld_permit;
assign vb_data_wd_sm_req    = |vb_data_entry_wd_sm_req[VB_DATA_ENTRY-1:0];
assign vb_wd_sm_start_vld   = vb_data_wd_sm_req &&  vb_wd_sm_permit;
//------------------create info-----------------------------
//only 1 or 0 entry requests the wd_sm when the state machine is able to permit
//request, so it doesn't need to arbitrate
assign vb_data_wd_sm_req_ptr[VB_DATA_ENTRY-1:0]     = vb_data_entry_wd_sm_req[VB_DATA_ENTRY-1:0];
assign vb_data_entry_wd_sm_grnt[VB_DATA_ENTRY-1:0]  = {VB_DATA_ENTRY{vb_wd_sm_permit}}
                                                      & vb_data_wd_sm_req_ptr[VB_DATA_ENTRY-1:0];

//-----------------biu w req info---------------------------
assign vb_wd_sm_w_req_data[127:0] = {128{vb_wd_sm_data_id[0]}}  & vb_data_entry_write_data128_0[127:0]
                                    | {128{vb_wd_sm_data_id[1]}}  & vb_data_entry_write_data128_1[127:0]
                                    | {128{vb_wd_sm_data_id[2]}}  & vb_data_entry_write_data128_2[127:0];

//-----------------interface to bus_arb---------------------
assign vb_biu_w_req           = vb_wd_sm_vld;

//w_id is used for debug
assign vb_wd_sm_addr_id[1:0]  = {2{vb_wd_sm_data_id[0]}} & {1'b0,vb_data_entry_addr_id_0[1]}
                                | {2{vb_wd_sm_data_id[1]}}  & {1'b0,vb_data_entry_addr_id_1[1]}
                                | {2{vb_wd_sm_data_id[2]}}  & {1'b0,vb_data_entry_addr_id_2[1]};

assign vb_biu_w_id[4:0]       = {BIU_VB_ID_T,vb_wd_sm_addr_id[1:0]};

assign vb_biu_w_data[127:0]   = vb_wd_sm_w_req_data[127:0];
assign vb_biu_w_strb[15:0]    = 16'hffff;
assign vb_biu_w_last          = vb_wd_sm_data_bias[3];
assign vb_biu_w_vld           = vb_wd_sm_vld;
//------------------pop signal------------------------------
assign vb_wd_sm_data_pop_req[VB_DATA_ENTRY-1:0] = {VB_DATA_ENTRY{vb_wd_sm_vld_permit}}
                                                  & vb_wd_sm_data_id[VB_DATA_ENTRY-1:0];

assign vb_wd_sm_inv = vb_wd_sm_vld_permit
                      &&  !vb_data_wd_sm_req;

//==========================================================
//                      Compare b_id
//==========================================================
assign vb_biu_b_id_hit      = biu_lsu_b_vld
                              &&  (biu_lsu_b_id[4:2] ==  BIU_VB_ID_T);
assign vb_biu_id_1to0[1:0]  = biu_lsu_b_id[1:0];

// &CombBeg; @881
always @( vb_biu_id_1to0[1:0])
begin
vb_addr_b_resp_ptr[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{1'b0}};
case(vb_biu_id_1to0[1:0])
  2'd0:vb_addr_b_resp_ptr[0] = 1'b1;
  2'd1:vb_addr_b_resp_ptr[1] = 1'b1;
//  2'd2:vb_addr_b_resp_ptr[2] = 1'b1;
//  2'd3:vb_addr_b_resp_ptr[3] = 1'b1;
  default:vb_addr_b_resp_ptr[VB_ADDR_ENTRY-1:0] = {VB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @890
end
assign vb_addr_entry_b_resp[VB_ADDR_ENTRY-1:0]  = {VB_ADDR_ENTRY{vb_biu_b_id_hit}}
                                                  & vb_addr_b_resp_ptr[VB_ADDR_ENTRY-1:0];

//==========================================================
//              Interface to other module
//==========================================================
//---------------------hit idx------------------------------
assign vb_rb_biu_req_hit_idx    = |vb_addr_entry_rb_biu_req_hit_idx[VB_ADDR_ENTRY-1:0];
assign vb_pfu_biu_req_hit_idx   = |vb_addr_entry_pfu_biu_req_hit_idx[VB_ADDR_ENTRY-1:0];
assign vb_wmb_write_req_hit_idx = |vb_addr_entry_wmb_write_req_hit_idx[VB_ADDR_ENTRY-1:0];
assign vb_lfb_vb_req_hit_idx    = |vb_addr_entry_lfb_vb_req_hit_idx[VB_ADDR_ENTRY-1:0];
//assign vb_entry_vld[VB_ADDR_ENTRY-1:0]  = vb_addr_entry_vld[VB_ADDR_ENTRY-1:0];

//for snq
assign vb_snq_depd[VB_ADDR_ENTRY-1:0]         = vb_addr_entry_snq_create_hit_idx[VB_ADDR_ENTRY-1:0];
assign vb_snq_depd_remove[VB_ADDR_ENTRY-1:0]  = vb_addr_entry_dep_remove[VB_ADDR_ENTRY-1:0];
assign vb_snq_start_hit_idx                   = (|(vb_snq_bypass_db_id[2:0] & vb_data_entry_req_success[2:0]))
                                                || (|(vb_addr_entry_snq_start_wait[1:0]));
assign vb_snq_wait_vb_id[1:0]                 = vb_addr_entry_snq_start_wait[1:0] | vb_addr_entry_snq_bypass_hit[1:0];
assign vb_snq_wait_remove[VB_ADDR_ENTRY-1:0]  = ~vb_addr_entry_vld[VB_ADDR_ENTRY-1:0];
assign vb_snq_bypass_hit                      = |(vb_snq_bypass_db_id[2:0] & ~vb_data_entry_req_success[2:0]);

// &Force("output","vb_snq_bypass_db_id"); @913
assign vb_snq_bypass_db_id[2:0] = {3{vb_addr_entry_snq_bypass_hit[0]}} & vb_addr_entry_db_id_0[2:0]
                                  | {3{vb_addr_entry_snq_bypass_hit[1]}} & vb_addr_entry_db_id_1[2:0];

assign snq_data_bypass_hit[2:0] = {3{snq_vb_bypass_check}} & vb_snq_bypass_db_id[2:0];

//vb addr pop when bypass
assign vb_addr_entry_bypass_pop[1:0]  = {2{vb_data_entry_bypass_pop[0]}} & vb_data_entry_addr_id_0[1:0]
                                        | {2{vb_data_entry_bypass_pop[1]}} & vb_data_entry_addr_id_1[1:0]
                                        | {2{vb_data_entry_bypass_pop[2]}} & vb_data_entry_addr_id_2[1:0];

//vb addr not bypass when data has already been written
assign vb_addr_entry_data_pop[1:0]    = {2{vb_data_entry_normal_pop[0]}} & vb_data_entry_addr_id_0[1:0]
                                        | {2{vb_data_entry_normal_pop[1]}} & vb_data_entry_addr_id_1[1:0]
                                        | {2{vb_data_entry_normal_pop[2]}} & vb_data_entry_addr_id_2[1:0];

//------------------full/empty signal-----------------------
assign vb_addr_empty    = !(|vb_addr_entry_vld[VB_ADDR_ENTRY-1:0]);
assign vb_data_empty    = !(|vb_data_entry_vld[VB_DATA_ENTRY-1:0]);
// &Force("output","vb_empty"); @932
assign vb_empty         = vb_addr_empty &&  vb_data_empty;
assign vb_wmb_empty     = !(|(vb_addr_entry_vld[VB_ADDR_ENTRY-1:0]
                          & vb_addr_entry_wmb_create[VB_ADDR_ENTRY-1:0]));

assign lsu_had_vb_addr_entry_vld[VB_ADDR_ENTRY-1:0] = vb_addr_entry_vld[VB_ADDR_ENTRY-1:0];
assign lsu_had_vb_data_entry_vld[VB_DATA_ENTRY-1:0] = vb_data_entry_vld[VB_DATA_ENTRY-1:0];
assign lsu_had_vb_rcl_sm_state[3:0] = vb_rcl_sm_state[3:0];

// &ModuleEnd; @941
endmodule


