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
module ct_lsu_rb(
  biu_lsu_b_id,
  biu_lsu_b_vld,
  biu_lsu_r_data,
  biu_lsu_r_id,
  biu_lsu_r_resp,
  biu_lsu_r_vld,
  bus_arb_rb_ar_grnt,
  cp0_lsu_dcache_en,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  ld_da_addr,
  ld_da_bkpta_data,
  ld_da_bkptb_data,
  ld_da_boundary_after_mask,
  ld_da_bytes_vld,
  ld_da_data_ori,
  ld_da_data_rot_sel,
  ld_da_dcache_hit,
  ld_da_idx,
  ld_da_iid,
  ld_da_inst_size,
  ld_da_inst_vfls,
  ld_da_mcic_borrow_mmu,
  ld_da_old,
  ld_da_page_buf,
  ld_da_page_ca,
  ld_da_page_sec,
  ld_da_page_share,
  ld_da_page_so,
  ld_da_preg,
  ld_da_rb_atomic,
  ld_da_rb_cmit,
  ld_da_rb_cmplt_success,
  ld_da_rb_create_dp_vld,
  ld_da_rb_create_gateclk_en,
  ld_da_rb_create_judge_vld,
  ld_da_rb_create_lfb,
  ld_da_rb_create_vld,
  ld_da_rb_data_vld,
  ld_da_rb_dest_vld,
  ld_da_rb_discard_grnt,
  ld_da_rb_ldamo,
  ld_da_rb_merge_dp_vld,
  ld_da_rb_merge_expt_vld,
  ld_da_rb_merge_gateclk_en,
  ld_da_rb_merge_vld,
  ld_da_sign_extend,
  ld_da_vreg,
  ld_da_vreg_sign_sel,
  ld_wb_rb_cmplt_grnt,
  ld_wb_rb_data_grnt,
  lfb_addr_full,
  lfb_rb_biu_req_hit_idx,
  lfb_rb_ca_rready_grnt,
  lfb_rb_create_id,
  lfb_rb_nc_rready_grnt,
  lm_already_snoop,
  lsu_had_rb_entry_fence,
  lsu_had_rb_entry_state_0,
  lsu_had_rb_entry_state_1,
  lsu_had_rb_entry_state_2,
  lsu_had_rb_entry_state_3,
  lsu_had_rb_entry_state_4,
  lsu_had_rb_entry_state_5,
  lsu_had_rb_entry_state_6,
  lsu_had_rb_entry_state_7,
  lsu_has_fence,
  lsu_idu_no_fence,
  lsu_idu_rb_not_full,
  lsu_rtu_all_commit_ld_data_vld,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfu_biu_req_addr,
  rb_biu_ar_addr,
  rb_biu_ar_bar,
  rb_biu_ar_burst,
  rb_biu_ar_cache,
  rb_biu_ar_domain,
  rb_biu_ar_dp_req,
  rb_biu_ar_id,
  rb_biu_ar_len,
  rb_biu_ar_lock,
  rb_biu_ar_prot,
  rb_biu_ar_req,
  rb_biu_ar_req_gateclk_en,
  rb_biu_ar_size,
  rb_biu_ar_snoop,
  rb_biu_ar_user,
  rb_biu_req_addr,
  rb_biu_req_unmask,
  rb_empty,
  rb_fence_ld,
  rb_ld_da_full,
  rb_ld_da_hit_idx,
  rb_ld_da_merge_fail,
  rb_ld_wb_bkpta_data,
  rb_ld_wb_bkptb_data,
  rb_ld_wb_bus_err,
  rb_ld_wb_bus_err_addr,
  rb_ld_wb_cmplt_req,
  rb_ld_wb_data,
  rb_ld_wb_data_iid,
  rb_ld_wb_data_req,
  rb_ld_wb_expt_gateclk,
  rb_ld_wb_expt_vld,
  rb_ld_wb_iid,
  rb_ld_wb_inst_vfls,
  rb_ld_wb_preg,
  rb_ld_wb_preg_sign_sel,
  rb_ld_wb_vreg,
  rb_ld_wb_vreg_sign_sel,
  rb_lfb_addr_tto4,
  rb_lfb_atomic,
  rb_lfb_boundary_depd_wakeup,
  rb_lfb_create_dp_vld,
  rb_lfb_create_gateclk_en,
  rb_lfb_create_req,
  rb_lfb_create_vld,
  rb_lfb_depd,
  rb_lfb_ldamo,
  rb_lm_ar_id,
  rb_lm_atomic_next_resp,
  rb_lm_wait_resp_dp_vld,
  rb_lm_wait_resp_vld,
  rb_mcic_ar_id,
  rb_mcic_biu_req_success,
  rb_mcic_ecc_err,
  rb_mcic_not_full,
  rb_pfu_biu_req_hit_idx,
  rb_pfu_nc_no_pending,
  rb_sq_pop_hit_idx,
  rb_st_da_full,
  rb_st_da_hit_idx,
  rb_wmb_ce_hit_idx,
  rb_wmb_so_pending,
  rtu_lsu_async_flush,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_flush,
  sq_pop_addr,
  sq_pop_page_ca,
  sq_pop_page_so,
  st_da_addr,
  st_da_dcache_hit,
  st_da_fence_inst,
  st_da_fence_mode,
  st_da_iid,
  st_da_inst_size,
  st_da_old,
  st_da_page_buf,
  st_da_page_ca,
  st_da_page_sec,
  st_da_page_share,
  st_da_page_so,
  st_da_rb_cmit,
  st_da_rb_create_dp_vld,
  st_da_rb_create_gateclk_en,
  st_da_rb_create_lfb,
  st_da_rb_create_vld,
  st_da_sync_fence,
  st_da_sync_inst,
  vb_rb_biu_req_hit_idx,
  wmb_ce_addr,
  wmb_ce_page_ca,
  wmb_ce_page_so,
  wmb_has_sync_fence,
  wmb_rb_biu_req_hit_idx,
  wmb_rb_so_pending,
  wmb_sync_fence_biu_req_success
);

// &Ports; @28
input   [4  :0]  biu_lsu_b_id;                  
input            biu_lsu_b_vld;                 
input   [127:0]  biu_lsu_r_data;                
input   [4  :0]  biu_lsu_r_id;                  
input   [3  :0]  biu_lsu_r_resp;                
input            biu_lsu_r_vld;                 
input            bus_arb_rb_ar_grnt;            
input            cp0_lsu_dcache_en;             
input            cp0_lsu_icg_en;                
input            cp0_yy_clk_en;                 
input   [1  :0]  cp0_yy_priv_mode;              
input            cpurst_b;                      
input            forever_cpuclk;                
input   [39 :0]  ld_da_addr;                    
input            ld_da_bkpta_data;              
input            ld_da_bkptb_data;              
input            ld_da_boundary_after_mask;     
input   [15 :0]  ld_da_bytes_vld;               
input   [63 :0]  ld_da_data_ori;                
input   [7  :0]  ld_da_data_rot_sel;            
input            ld_da_dcache_hit;              
input   [7  :0]  ld_da_idx;                     
input   [6  :0]  ld_da_iid;                     
input   [2  :0]  ld_da_inst_size;               
input            ld_da_inst_vfls;               
input            ld_da_mcic_borrow_mmu;         
input            ld_da_old;                     
input            ld_da_page_buf;                
input            ld_da_page_ca;                 
input            ld_da_page_sec;                
input            ld_da_page_share;              
input            ld_da_page_so;                 
input   [6  :0]  ld_da_preg;                    
input            ld_da_rb_atomic;               
input            ld_da_rb_cmit;                 
input            ld_da_rb_cmplt_success;        
input            ld_da_rb_create_dp_vld;        
input            ld_da_rb_create_gateclk_en;    
input            ld_da_rb_create_judge_vld;     
input            ld_da_rb_create_lfb;           
input            ld_da_rb_create_vld;           
input            ld_da_rb_data_vld;             
input            ld_da_rb_dest_vld;             
input            ld_da_rb_discard_grnt;         
input            ld_da_rb_ldamo;                
input            ld_da_rb_merge_dp_vld;         
input            ld_da_rb_merge_expt_vld;       
input            ld_da_rb_merge_gateclk_en;     
input            ld_da_rb_merge_vld;            
input            ld_da_sign_extend;             
input   [5  :0]  ld_da_vreg;                    
input            ld_da_vreg_sign_sel;           
input            ld_wb_rb_cmplt_grnt;           
input            ld_wb_rb_data_grnt;            
input            lfb_addr_full;                 
input            lfb_rb_biu_req_hit_idx;        
input            lfb_rb_ca_rready_grnt;         
input   [4  :0]  lfb_rb_create_id;              
input            lfb_rb_nc_rready_grnt;         
input            lm_already_snoop;              
input            lsu_special_clk;               
input            pad_yy_icg_scan_en;            
input   [39 :0]  pfu_biu_req_addr;              
input            rtu_lsu_async_flush;           
input            rtu_yy_xx_commit0;             
input   [6  :0]  rtu_yy_xx_commit0_iid;         
input            rtu_yy_xx_commit1;             
input   [6  :0]  rtu_yy_xx_commit1_iid;         
input            rtu_yy_xx_commit2;             
input   [6  :0]  rtu_yy_xx_commit2_iid;         
input            rtu_yy_xx_flush;               
input   [39 :0]  sq_pop_addr;                   
input            sq_pop_page_ca;                
input            sq_pop_page_so;                
input   [39 :0]  st_da_addr;                    
input            st_da_dcache_hit;              
input            st_da_fence_inst;              
input   [3  :0]  st_da_fence_mode;              
input   [6  :0]  st_da_iid;                     
input   [2  :0]  st_da_inst_size;               
input            st_da_old;                     
input            st_da_page_buf;                
input            st_da_page_ca;                 
input            st_da_page_sec;                
input            st_da_page_share;              
input            st_da_page_so;                 
input            st_da_rb_cmit;                 
input            st_da_rb_create_dp_vld;        
input            st_da_rb_create_gateclk_en;    
input            st_da_rb_create_lfb;           
input            st_da_rb_create_vld;           
input            st_da_sync_fence;              
input            st_da_sync_inst;               
input            vb_rb_biu_req_hit_idx;         
input   [39 :0]  wmb_ce_addr;                   
input            wmb_ce_page_ca;                
input            wmb_ce_page_so;                
input            wmb_has_sync_fence;            
input            wmb_rb_biu_req_hit_idx;        
input            wmb_rb_so_pending;             
input            wmb_sync_fence_biu_req_success; 
output  [7  :0]  lsu_had_rb_entry_fence;        
output  [3  :0]  lsu_had_rb_entry_state_0;      
output  [3  :0]  lsu_had_rb_entry_state_1;      
output  [3  :0]  lsu_had_rb_entry_state_2;      
output  [3  :0]  lsu_had_rb_entry_state_3;      
output  [3  :0]  lsu_had_rb_entry_state_4;      
output  [3  :0]  lsu_had_rb_entry_state_5;      
output  [3  :0]  lsu_had_rb_entry_state_6;      
output  [3  :0]  lsu_had_rb_entry_state_7;      
output           lsu_has_fence;                 
output           lsu_idu_no_fence;              
output           lsu_idu_rb_not_full;           
output           lsu_rtu_all_commit_ld_data_vld; 
output  [39 :0]  rb_biu_ar_addr;                
output  [1  :0]  rb_biu_ar_bar;                 
output  [1  :0]  rb_biu_ar_burst;               
output  [3  :0]  rb_biu_ar_cache;               
output  [1  :0]  rb_biu_ar_domain;              
output           rb_biu_ar_dp_req;              
output  [4  :0]  rb_biu_ar_id;                  
output  [1  :0]  rb_biu_ar_len;                 
output           rb_biu_ar_lock;                
output  [2  :0]  rb_biu_ar_prot;                
output           rb_biu_ar_req;                 
output           rb_biu_ar_req_gateclk_en;      
output  [2  :0]  rb_biu_ar_size;                
output  [3  :0]  rb_biu_ar_snoop;               
output  [2  :0]  rb_biu_ar_user;                
output  [39 :0]  rb_biu_req_addr;               
output           rb_biu_req_unmask;             
output           rb_empty;                      
output           rb_fence_ld;                   
output           rb_ld_da_full;                 
output           rb_ld_da_hit_idx;              
output           rb_ld_da_merge_fail;           
output           rb_ld_wb_bkpta_data;           
output           rb_ld_wb_bkptb_data;           
output           rb_ld_wb_bus_err;              
output  [39 :0]  rb_ld_wb_bus_err_addr;         
output           rb_ld_wb_cmplt_req;            
output  [63 :0]  rb_ld_wb_data;                 
output  [6  :0]  rb_ld_wb_data_iid;             
output           rb_ld_wb_data_req;             
output           rb_ld_wb_expt_gateclk;         
output           rb_ld_wb_expt_vld;             
output  [6  :0]  rb_ld_wb_iid;                  
output           rb_ld_wb_inst_vfls;            
output  [6  :0]  rb_ld_wb_preg;                 
output  [3  :0]  rb_ld_wb_preg_sign_sel;        
output  [5  :0]  rb_ld_wb_vreg;                 
output  [1  :0]  rb_ld_wb_vreg_sign_sel;        
output  [35 :0]  rb_lfb_addr_tto4;              
output           rb_lfb_atomic;                 
output           rb_lfb_boundary_depd_wakeup;   
output           rb_lfb_create_dp_vld;          
output           rb_lfb_create_gateclk_en;      
output           rb_lfb_create_req;             
output           rb_lfb_create_vld;             
output           rb_lfb_depd;                   
output           rb_lfb_ldamo;                  
output  [4  :0]  rb_lm_ar_id;                   
output           rb_lm_atomic_next_resp;        
output           rb_lm_wait_resp_dp_vld;        
output           rb_lm_wait_resp_vld;           
output  [4  :0]  rb_mcic_ar_id;                 
output           rb_mcic_biu_req_success;       
output           rb_mcic_ecc_err;               
output           rb_mcic_not_full;              
output           rb_pfu_biu_req_hit_idx;        
output           rb_pfu_nc_no_pending;          
output           rb_sq_pop_hit_idx;             
output           rb_st_da_full;                 
output           rb_st_da_hit_idx;              
output           rb_wmb_ce_hit_idx;             
output           rb_wmb_so_pending;             

// &Regs; @29
reg              lsu_has_fence;                 
reg     [1  :0]  rb_biu_ar_bar;                 
reg     [4  :0]  rb_biu_ar_id;                  
reg     [3  :0]  rb_biu_ar_snoop;               
reg     [7  :0]  rb_biu_pe_req_ptr;             
reg     [39 :0]  rb_biu_req_addr;               
reg              rb_biu_req_create_lfb;         
reg     [7  :0]  rb_biu_req_ptr;                
reg              rb_biu_req_unmask;             
reg     [7  :0]  rb_create_ptr0;                
reg     [7  :0]  rb_create_ptr1;                
reg     [7  :0]  rb_ld_wb_cmplt_ptr;            
reg     [7  :0]  rb_ld_wb_data_ptr;             
reg     [7  :0]  rb_ld_wb_data_ptr_pre;         
reg     [3  :0]  rb_ld_wb_preg_sign_sel;        
reg     [63 :0]  rb_wb_data;                    

// &Wires; @30
wire    [4  :0]  biu_lsu_b_id;                  
wire             biu_lsu_b_vld;                 
wire    [127:0]  biu_lsu_r_data;                
wire    [127:0]  biu_lsu_r_data_mask;           
wire    [4  :0]  biu_lsu_r_id;                  
wire    [3  :0]  biu_lsu_r_resp;                
wire             biu_lsu_r_vld;                 
wire             bus_arb_rb_ar_grnt;            
wire             cp0_lsu_dcache_en;             
wire             cp0_lsu_icg_en;                
wire             cp0_yy_clk_en;                 
wire    [1  :0]  cp0_yy_priv_mode;              
wire             cpurst_b;                      
wire             forever_cpuclk;                
wire    [39 :0]  ld_da_addr;                    
wire             ld_da_bkpta_data;              
wire             ld_da_bkptb_data;              
wire             ld_da_boundary_after_mask;     
wire    [15 :0]  ld_da_bytes_vld;               
wire    [63 :0]  ld_da_data_ori;                
wire    [7  :0]  ld_da_data_rot_sel;            
wire             ld_da_dcache_hit;              
wire    [7  :0]  ld_da_idx;                     
wire    [6  :0]  ld_da_iid;                     
wire    [2  :0]  ld_da_inst_size;               
wire             ld_da_inst_vfls;               
wire             ld_da_mcic_borrow_mmu;         
wire             ld_da_old;                     
wire             ld_da_page_buf;                
wire             ld_da_page_ca;                 
wire             ld_da_page_sec;                
wire             ld_da_page_share;              
wire             ld_da_page_so;                 
wire    [6  :0]  ld_da_preg;                    
wire             ld_da_rb_atomic;               
wire             ld_da_rb_cmit;                 
wire             ld_da_rb_cmplt_success;        
wire             ld_da_rb_create_dp_vld;        
wire             ld_da_rb_create_gateclk_en;    
wire             ld_da_rb_create_judge_vld;     
wire             ld_da_rb_create_lfb;           
wire             ld_da_rb_create_vld;           
wire             ld_da_rb_data_vld;             
wire             ld_da_rb_dest_vld;             
wire             ld_da_rb_discard_grnt;         
wire             ld_da_rb_ldamo;                
wire             ld_da_rb_merge_dp_vld;         
wire             ld_da_rb_merge_expt_vld;       
wire             ld_da_rb_merge_gateclk_en;     
wire             ld_da_rb_merge_vld;            
wire             ld_da_sign_extend;             
wire    [5  :0]  ld_da_vreg;                    
wire             ld_da_vreg_sign_sel;           
wire             ld_wb_rb_cmplt_grnt;           
wire             ld_wb_rb_data_grnt;            
wire             lfb_addr_full;                 
wire             lfb_rb_biu_req_hit_idx;        
wire             lfb_rb_ca_rready_grnt;         
wire    [4  :0]  lfb_rb_create_id;              
wire             lfb_rb_nc_rready_grnt;         
wire             lm_already_snoop;              
wire    [7  :0]  lsu_had_rb_entry_fence;        
wire    [3  :0]  lsu_had_rb_entry_state_0;      
wire    [3  :0]  lsu_had_rb_entry_state_1;      
wire    [3  :0]  lsu_had_rb_entry_state_2;      
wire    [3  :0]  lsu_had_rb_entry_state_3;      
wire    [3  :0]  lsu_had_rb_entry_state_4;      
wire    [3  :0]  lsu_had_rb_entry_state_5;      
wire    [3  :0]  lsu_had_rb_entry_state_6;      
wire    [3  :0]  lsu_had_rb_entry_state_7;      
wire             lsu_has_fence_set;             
wire             lsu_idu_no_fence;              
wire             lsu_idu_rb_not_full;           
wire             lsu_rtu_all_commit_ld_data_vld; 
wire             lsu_special_clk;               
wire             pad_yy_icg_scan_en;            
wire    [39 :0]  pfu_biu_req_addr;              
wire             rb_atomic_readunique;          
wire    [39 :0]  rb_biu_ar_addr;                
wire    [1  :0]  rb_biu_ar_burst;               
wire    [3  :0]  rb_biu_ar_cache;               
wire    [1  :0]  rb_biu_ar_domain;              
wire             rb_biu_ar_dp_req;              
wire    [3  :0]  rb_biu_ar_id_judge;            
wire    [1  :0]  rb_biu_ar_len;                 
wire             rb_biu_ar_lock;                
wire    [2  :0]  rb_biu_ar_prot;                
wire             rb_biu_ar_req;                 
wire             rb_biu_ar_req_gateclk_en;      
wire    [2  :0]  rb_biu_ar_size;                
wire             rb_biu_ar_size_maintain;       
wire    [2  :0]  rb_biu_ar_user;                
wire             rb_biu_len3_sel;               
wire             rb_biu_nc_recv_gateclk_en;     
wire             rb_biu_nc_req_gateclk_en;      
wire             rb_biu_nc_req_grnt;            
wire             rb_biu_pe_create_lfb;          
wire             rb_biu_pe_req;                 
wire    [39 :0]  rb_biu_pe_req_addr;            
wire             rb_biu_pe_req_gateclk_en;      
wire             rb_biu_pe_req_permit;          
wire             rb_biu_req_atomic;             
wire             rb_biu_req_fence;              
wire             rb_biu_req_flush_clear;        
wire             rb_biu_req_hit_idx;            
wire    [2  :0]  rb_biu_req_inst_size;          
wire             rb_biu_req_ldamo;              
wire             rb_biu_req_mcic_req;           
wire             rb_biu_req_not_wait_fence;     
wire             rb_biu_req_page_buf;           
wire             rb_biu_req_page_ca;            
wire             rb_biu_req_page_ca_dcache_en;  
wire             rb_biu_req_page_nc_atomic;     
wire             rb_biu_req_page_sec;           
wire             rb_biu_req_page_share;         
wire             rb_biu_req_page_so;            
wire    [1  :0]  rb_biu_req_priv_mode;          
wire    [2  :0]  rb_biu_req_ptr_encode;         
wire             rb_biu_req_st;                 
wire             rb_biu_req_sync;               
wire             rb_biu_req_sync_fence;         
wire             rb_biu_share_refill;           
wire             rb_biu_so_recv_gateclk_en;     
wire             rb_biu_so_req_gateclk_en;      
wire             rb_biu_so_req_grnt;            
wire             rb_create_ld_success;          
wire             rb_create_st_success;          
wire             rb_data_ptr_clk;               
wire             rb_data_ptr_clk_en;            
wire             rb_empty;                      
wire             rb_empty_less2;                
wire             rb_empty_less3;                
wire    [39 :0]  rb_entry_addr_0;               
wire    [39 :0]  rb_entry_addr_1;               
wire    [39 :0]  rb_entry_addr_2;               
wire    [39 :0]  rb_entry_addr_3;               
wire    [39 :0]  rb_entry_addr_4;               
wire    [39 :0]  rb_entry_addr_5;               
wire    [39 :0]  rb_entry_addr_6;               
wire    [39 :0]  rb_entry_addr_7;               
wire    [7  :0]  rb_entry_atomic;               
wire    [7  :0]  rb_entry_atomic_next_resp;     
wire    [7  :0]  rb_entry_biu_id_gateclk_en;    
wire    [7  :0]  rb_entry_biu_pe_req;           
wire    [7  :0]  rb_entry_biu_pe_req_gateclk_en; 
wire    [7  :0]  rb_entry_biu_pe_req_grnt;      
wire    [7  :0]  rb_entry_biu_req;              
wire    [7  :0]  rb_entry_bkpta_data;           
wire    [7  :0]  rb_entry_bkptb_data;           
wire    [7  :0]  rb_entry_boundary_wakeup;      
wire    [7  :0]  rb_entry_bus_err;              
wire    [7  :0]  rb_entry_cmit_data_vld;        
wire    [7  :0]  rb_entry_create_lfb;           
wire    [63 :0]  rb_entry_data_0;               
wire    [63 :0]  rb_entry_data_1;               
wire    [63 :0]  rb_entry_data_2;               
wire    [63 :0]  rb_entry_data_3;               
wire    [63 :0]  rb_entry_data_4;               
wire    [63 :0]  rb_entry_data_5;               
wire    [63 :0]  rb_entry_data_6;               
wire    [63 :0]  rb_entry_data_7;               
wire    [7  :0]  rb_entry_depd;                 
wire    [7  :0]  rb_entry_discard_vld;          
wire    [7  :0]  rb_entry_fence;                
wire    [7  :0]  rb_entry_fence_ld_vld;         
wire    [7  :0]  rb_entry_flush_clear;          
wire    [6  :0]  rb_entry_iid_0;                
wire    [6  :0]  rb_entry_iid_1;                
wire    [6  :0]  rb_entry_iid_2;                
wire    [6  :0]  rb_entry_iid_3;                
wire    [6  :0]  rb_entry_iid_4;                
wire    [6  :0]  rb_entry_iid_5;                
wire    [6  :0]  rb_entry_iid_6;                
wire    [6  :0]  rb_entry_iid_7;                
wire    [2  :0]  rb_entry_inst_size_0;          
wire    [2  :0]  rb_entry_inst_size_1;          
wire    [2  :0]  rb_entry_inst_size_2;          
wire    [2  :0]  rb_entry_inst_size_3;          
wire    [2  :0]  rb_entry_inst_size_4;          
wire    [2  :0]  rb_entry_inst_size_5;          
wire    [2  :0]  rb_entry_inst_size_6;          
wire    [2  :0]  rb_entry_inst_size_7;          
wire    [7  :0]  rb_entry_inst_vfls;            
wire    [7  :0]  rb_entry_ld_create_dp_vld;     
wire    [7  :0]  rb_entry_ld_create_gateclk_en; 
wire    [7  :0]  rb_entry_ld_create_vld;        
wire    [7  :0]  rb_entry_ld_da_hit_idx;        
wire    [7  :0]  rb_entry_ldamo;                
wire    [7  :0]  rb_entry_mcic_req;             
wire    [7  :0]  rb_entry_merge_fail;           
wire    [7  :0]  rb_entry_next_nc_bypass;       
wire    [7  :0]  rb_entry_next_so_bypass;       
wire    [7  :0]  rb_entry_page_buf;             
wire    [7  :0]  rb_entry_page_ca;              
wire    [7  :0]  rb_entry_page_sec;             
wire    [7  :0]  rb_entry_page_share;           
wire    [7  :0]  rb_entry_page_so;              
wire    [7  :0]  rb_entry_pfu_biu_req_hit_idx;  
wire    [6  :0]  rb_entry_preg_0;               
wire    [6  :0]  rb_entry_preg_1;               
wire    [6  :0]  rb_entry_preg_2;               
wire    [6  :0]  rb_entry_preg_3;               
wire    [6  :0]  rb_entry_preg_4;               
wire    [6  :0]  rb_entry_preg_5;               
wire    [6  :0]  rb_entry_preg_6;               
wire    [6  :0]  rb_entry_preg_7;               
wire    [1  :0]  rb_entry_priv_mode_0;          
wire    [1  :0]  rb_entry_priv_mode_1;          
wire    [1  :0]  rb_entry_priv_mode_2;          
wire    [1  :0]  rb_entry_priv_mode_3;          
wire    [1  :0]  rb_entry_priv_mode_4;          
wire    [1  :0]  rb_entry_priv_mode_5;          
wire    [1  :0]  rb_entry_priv_mode_6;          
wire    [1  :0]  rb_entry_priv_mode_7;          
wire    [7  :0]  rb_entry_read_req_grnt;        
wire    [7  :0]  rb_entry_rot_sel_0;            
wire    [7  :0]  rb_entry_rot_sel_1;            
wire    [7  :0]  rb_entry_rot_sel_2;            
wire    [7  :0]  rb_entry_rot_sel_3;            
wire    [7  :0]  rb_entry_rot_sel_4;            
wire    [7  :0]  rb_entry_rot_sel_5;            
wire    [7  :0]  rb_entry_rot_sel_6;            
wire    [7  :0]  rb_entry_rot_sel_7;            
wire    [7  :0]  rb_entry_sign_extend;          
wire    [7  :0]  rb_entry_sq_pop_hit_idx;       
wire    [7  :0]  rb_entry_st;                   
wire    [7  :0]  rb_entry_st_create_dp_vld;     
wire    [7  :0]  rb_entry_st_create_gateclk_en; 
wire    [7  :0]  rb_entry_st_create_vld;        
wire    [7  :0]  rb_entry_st_da_hit_idx;        
wire    [3  :0]  rb_entry_state_0;              
wire    [3  :0]  rb_entry_state_1;              
wire    [3  :0]  rb_entry_state_2;              
wire    [3  :0]  rb_entry_state_3;              
wire    [3  :0]  rb_entry_state_4;              
wire    [3  :0]  rb_entry_state_5;              
wire    [3  :0]  rb_entry_state_6;              
wire    [3  :0]  rb_entry_state_7;              
wire    [7  :0]  rb_entry_sync;                 
wire    [7  :0]  rb_entry_sync_fence;           
wire    [7  :0]  rb_entry_vld;                  
wire    [5  :0]  rb_entry_vreg_0;               
wire    [5  :0]  rb_entry_vreg_1;               
wire    [5  :0]  rb_entry_vreg_2;               
wire    [5  :0]  rb_entry_vreg_3;               
wire    [5  :0]  rb_entry_vreg_4;               
wire    [5  :0]  rb_entry_vreg_5;               
wire    [5  :0]  rb_entry_vreg_6;               
wire    [5  :0]  rb_entry_vreg_7;               
wire    [7  :0]  rb_entry_vreg_sign_sel;        
wire    [7  :0]  rb_entry_wb_cmplt_grnt;        
wire    [7  :0]  rb_entry_wb_cmplt_req;         
wire    [7  :0]  rb_entry_wb_data_grnt;         
wire    [7  :0]  rb_entry_wb_data_pre_sel;      
wire    [7  :0]  rb_entry_wb_data_req;          
wire    [7  :0]  rb_entry_wmb_ce_hit_idx;       
wire             rb_fence_ld;                   
wire             rb_full;                       
wire             rb_has_sync_fence;             
wire             rb_idfifo_nc_clk_en;           
wire             rb_idfifo_nc_create_vld;       
wire             rb_idfifo_nc_pop_vld;          
wire             rb_idfifo_so_clk_en;           
wire             rb_idfifo_so_create_vld;       
wire             rb_idfifo_so_pop_vld;          
wire             rb_ld_biu_pe_req;              
wire             rb_ld_biu_pe_req_grnt;         
wire             rb_ld_da_full;                 
wire             rb_ld_da_hit_idx;              
wire             rb_ld_da_merge_fail;           
wire    [7  :0]  rb_ld_rot_sel;                 
wire             rb_ld_wb_bkpta_data;           
wire             rb_ld_wb_bkptb_data;           
wire             rb_ld_wb_bus_err;              
wire    [39 :0]  rb_ld_wb_bus_err_addr;         
wire             rb_ld_wb_cmplt_req;            
wire    [63 :0]  rb_ld_wb_data;                 
wire    [127:0]  rb_ld_wb_data_128;             
wire    [6  :0]  rb_ld_wb_data_iid;             
wire             rb_ld_wb_data_req;             
wire             rb_ld_wb_data_req_unmask;      
wire             rb_ld_wb_expt_gateclk;         
wire             rb_ld_wb_expt_vld;             
wire    [6  :0]  rb_ld_wb_iid;                  
wire    [2  :0]  rb_ld_wb_inst_size;            
wire             rb_ld_wb_inst_vfls;            
wire    [6  :0]  rb_ld_wb_preg;                 
wire             rb_ld_wb_sign_extend;          
wire    [5  :0]  rb_ld_wb_vreg;                 
wire             rb_ld_wb_vreg_sign;            
wire    [1  :0]  rb_ld_wb_vreg_sign_sel;        
wire    [35 :0]  rb_lfb_addr_tto4;              
wire             rb_lfb_atomic;                 
wire             rb_lfb_boundary_depd_wakeup;   
wire             rb_lfb_create_dp_vld;          
wire             rb_lfb_create_gateclk_en;      
wire             rb_lfb_create_req;             
wire             rb_lfb_create_vld;             
wire             rb_lfb_create_vld_unmask;      
wire             rb_lfb_depd;                   
wire             rb_lfb_ldamo;                  
wire    [4  :0]  rb_lm_ar_id;                   
wire             rb_lm_atomic_next_resp;        
wire             rb_lm_wait_resp_dp_vld;        
wire             rb_lm_wait_resp_vld;           
wire    [4  :0]  rb_mcic_ar_id;                 
wire             rb_mcic_biu_req_success;       
wire             rb_mcic_ecc_err;               
wire             rb_mcic_not_full;              
wire             rb_nc_ar_req;                  
wire             rb_nc_fifo_empty;              
wire             rb_nc_no_pending;              
wire             rb_not_empty;                  
wire             rb_pe_clk;                     
wire             rb_pe_clk_en;                  
wire             rb_pfu_biu_req_hit_idx;        
wire             rb_pfu_nc_no_pending;          
wire             rb_pipe_biu_pe_req;            
wire             rb_r_nc_id_hit;                
wire             rb_r_resp_ecc_err;             
wire             rb_r_resp_err;                 
wire             rb_r_resp_okay;                
wire             rb_r_so_id_hit;                
wire             rb_read_req_grnt;              
wire             rb_read_req_grnt_gateclk_en;   
wire             rb_ready_all_req_biu_success;  
wire             rb_ready_ld_req_biu;           
wire             rb_ready_ld_req_biu_success;   
wire             rb_ready_req_biu;              
wire             rb_so_no_pending;              
wire             rb_sq_pop_hit_idx;             
wire             rb_st_da_full;                 
wire             rb_st_da_hit_idx;              
wire    [127:0]  rb_wb_data_unsettle;           
wire             rb_wmb_ce_hit_idx;             
wire             rb_wmb_so_pending;             
wire             rtu_lsu_async_flush;           
wire             rtu_yy_xx_commit0;             
wire    [6  :0]  rtu_yy_xx_commit0_iid;         
wire             rtu_yy_xx_commit1;             
wire    [6  :0]  rtu_yy_xx_commit1_iid;         
wire             rtu_yy_xx_commit2;             
wire    [6  :0]  rtu_yy_xx_commit2_iid;         
wire             rtu_yy_xx_flush;               
wire    [39 :0]  sq_pop_addr;                   
wire             sq_pop_page_ca;                
wire             sq_pop_page_so;                
wire    [39 :0]  st_da_addr;                    
wire             st_da_dcache_hit;              
wire             st_da_fence_inst;              
wire    [3  :0]  st_da_fence_mode;              
wire    [6  :0]  st_da_iid;                     
wire    [2  :0]  st_da_inst_size;               
wire             st_da_old;                     
wire             st_da_page_buf;                
wire             st_da_page_ca;                 
wire             st_da_page_sec;                
wire             st_da_page_share;              
wire             st_da_page_so;                 
wire             st_da_rb_cmit;                 
wire             st_da_rb_create_dp_vld;        
wire             st_da_rb_create_gateclk_en;    
wire             st_da_rb_create_lfb;           
wire             st_da_rb_create_vld;           
wire             st_da_sync_fence;              
wire             st_da_sync_inst;               
wire             vb_rb_biu_req_hit_idx;         
wire    [39 :0]  wmb_ce_addr;                   
wire             wmb_ce_page_ca;                
wire             wmb_ce_page_so;                
wire             wmb_has_sync_fence;            
wire             wmb_rb_biu_req_hit_idx;        
wire             wmb_rb_so_pending;             
wire             wmb_sync_fence_biu_req_success; 


parameter RB_ENTRY          = 8;
parameter VMB_ENTRY         = 8;
parameter BIU_R_NC_ID       = 5'd24,
          BIU_R_SO_ID       = 5'd29,
          BIU_R_NC_ATOM_ID  = 5'd30,
          BIU_R_SYNC_FENCE_ID = 5'd31;
parameter BYTE              = 2'b00,
          HALF              = 2'b01,
          WORD              = 2'b10,
          DWORD             = 2'b11;
parameter OKAY              = 2'b00,
          EXOKAY            = 2'b01,
          SLVERR            = 2'b10,
          DECERR            = 2'b11;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//pop entry signal
assign rb_pe_clk_en   = rb_biu_req_unmask
                        ? (rb_read_req_grnt_gateclk_en
                              ||  rb_biu_req_flush_clear)
                        : (ld_da_rb_create_gateclk_en
                              ||  rb_biu_pe_req_gateclk_en);
// &Instance("gated_clk_cell", "x_lsu_rb_pe_gated_clk"); @56
gated_clk_cell  x_lsu_rb_pe_gated_clk (
  .clk_in             (lsu_special_clk   ),
  .clk_out            (rb_pe_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rb_pe_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (lsu_special_clk     ), @57
//          .external_en   (1'b0               ), @58
//          .global_en     (cp0_yy_clk_en      ), @59
//          .module_en     (cp0_lsu_icg_en     ), @60
//          .local_en      (rb_pe_clk_en       ), @61
//          .clk_out       (rb_pe_clk          )); @62

//data pop entry signal
// &Instance("gated_clk_cell", "x_lsu_rb_data_ptr_gated_clk"); @65
gated_clk_cell  x_lsu_rb_data_ptr_gated_clk (
  .clk_in             (lsu_special_clk   ),
  .clk_out            (rb_data_ptr_clk   ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (rb_data_ptr_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (lsu_special_clk     ), @66
//          .external_en   (1'b0               ), @67
//          .global_en     (cp0_yy_clk_en      ), @68
//          .module_en     (cp0_lsu_icg_en     ), @69
//          .local_en      (rb_data_ptr_clk_en       ), @70
//          .clk_out       (rb_data_ptr_clk          )); @71


//==========================================================
//                 Non-cacheable FIFO
//==========================================================
// &Instance("ct_lsu_idfifo_8","x_ct_lsu_rb_idfifo_nc"); @77
ct_lsu_idfifo_8  x_ct_lsu_rb_idfifo_nc (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .idfifo_clk_en                (rb_idfifo_nc_clk_en         ),
  .idfifo_create_id             (rb_biu_req_ptr_encode[2:0]  ),
  .idfifo_create_id_oh          (rb_biu_req_ptr[7:0]         ),
  .idfifo_create_vld            (rb_idfifo_nc_create_vld     ),
  .idfifo_empty                 (rb_nc_no_pending            ),
  .idfifo_pop_id_oh             (rb_entry_next_nc_bypass[7:0]),
  .idfifo_pop_vld               (rb_idfifo_nc_pop_vld        ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);

// &Connect( .idfifo_clk_en        (rb_idfifo_nc_clk_en          ), @78
//           .idfifo_create_vld    (rb_idfifo_nc_create_vld      ), @79
//           .idfifo_pop_vld       (rb_idfifo_nc_pop_vld         ), @80
//           .idfifo_create_id     (rb_biu_req_ptr_encode[2:0]   ), @81
//           .idfifo_create_id_oh  (rb_biu_req_ptr[7:0]          ), @82
//           .idfifo_pop_id_oh     (rb_entry_next_nc_bypass[7:0] ), @83
//           .idfifo_empty         (rb_nc_no_pending             )); @84
// &Force("nonport","rb_nc_no_pending"); @85

//-----------------------wires------------------------------
assign rb_idfifo_nc_create_vld               = rb_biu_nc_req_grnt;
assign rb_idfifo_nc_pop_vld                  = rb_r_nc_id_hit;

//------------------gateclk---------------------------------
assign rb_biu_nc_req_gateclk_en   = rb_biu_req_unmask
                                    &&  !rb_biu_req_page_ca
                                    &&  !rb_biu_req_page_so
                                    &&  !rb_biu_req_sync_fence;
assign rb_biu_nc_recv_gateclk_en  = rb_r_nc_id_hit;
assign rb_idfifo_nc_clk_en        = rb_biu_nc_req_gateclk_en
                                    ||  rb_biu_nc_recv_gateclk_en;

//==========================================================
//                 Strong order FIFO
//==========================================================
// &Instance("ct_lsu_idfifo_8","x_ct_lsu_rb_idfifo_so"); @103
ct_lsu_idfifo_8  x_ct_lsu_rb_idfifo_so (
  .cp0_lsu_icg_en               (cp0_lsu_icg_en              ),
  .cp0_yy_clk_en                (cp0_yy_clk_en               ),
  .cpurst_b                     (cpurst_b                    ),
  .forever_cpuclk               (forever_cpuclk              ),
  .idfifo_clk_en                (rb_idfifo_so_clk_en         ),
  .idfifo_create_id             (rb_biu_req_ptr_encode[2:0]  ),
  .idfifo_create_id_oh          (rb_biu_req_ptr[7:0]         ),
  .idfifo_create_vld            (rb_idfifo_so_create_vld     ),
  .idfifo_empty                 (rb_so_no_pending            ),
  .idfifo_pop_id_oh             (rb_entry_next_so_bypass[7:0]),
  .idfifo_pop_vld               (rb_idfifo_so_pop_vld        ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          )
);

// &Connect( .idfifo_clk_en        (rb_idfifo_so_clk_en          ), @104
//           .idfifo_create_vld    (rb_idfifo_so_create_vld      ), @105
//           .idfifo_pop_vld       (rb_idfifo_so_pop_vld         ), @106
//           .idfifo_create_id     (rb_biu_req_ptr_encode[2:0]   ), @107
//           .idfifo_create_id_oh  (rb_biu_req_ptr[7:0]          ), @108
//           .idfifo_pop_id_oh     (rb_entry_next_so_bypass[7:0] ), @109
//           .idfifo_empty         (rb_so_no_pending             )); @110

//-----------------------wires------------------------------
assign rb_idfifo_so_create_vld    = rb_biu_so_req_grnt;
assign rb_idfifo_so_pop_vld       = rb_r_so_id_hit;

//------------------gateclk---------------------------------
assign rb_biu_so_req_gateclk_en   = rb_biu_req_unmask
                                    &&  rb_biu_req_page_so
                                    &&  !rb_biu_req_sync_fence;
assign rb_biu_so_recv_gateclk_en  = rb_r_so_id_hit;
assign rb_idfifo_so_clk_en        = rb_biu_so_req_gateclk_en
                                    ||  rb_biu_so_recv_gateclk_en;

//------------------pending---------------------------------
assign rb_wmb_so_pending          = !rb_so_no_pending;

//-----------------biu req ptr------------------------------
// &Instance("ct_rtu_encode_8","x_lsu_rb_idfifo_so_req_ptr_encode"); @128
ct_rtu_encode_8  x_lsu_rb_idfifo_so_req_ptr_encode (
  .x_num                      (rb_biu_req_ptr_encode[2:0]),
  .x_num_expand               (rb_biu_req_ptr[7:0]       )
);

// &Connect( .x_num          (rb_biu_req_ptr_encode[2:0]    ), @129
//           .x_num_expand   (rb_biu_req_ptr[7:0] )); @130

//-----------------biu data mask------------------------------
assign biu_lsu_r_data_mask[127:0] = biu_lsu_r_resp[1]
                                    ? 128'b0
                                    : biu_lsu_r_data[127:0]; 
                                      
//==========================================================
//                 Instance read buffer entry
//==========================================================

// &ConnRule(s/_x$/[0]/); @141
// &ConnRule(s/_v$/_0/); @142
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_0"); @143
ct_lsu_rb_entry  x_ct_lsu_rb_entry_0 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[0]                ),
  .rb_entry_addr_v                   (rb_entry_addr_0                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[0]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[0]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[0]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[0]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[0]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[0]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[0]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[0]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[0]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[0]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[0]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[0]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[0]           ),
  .rb_entry_data_v                   (rb_entry_data_0                  ),
  .rb_entry_depd_x                   (rb_entry_depd[0]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[0]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[0]         ),
  .rb_entry_fence_x                  (rb_entry_fence[0]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[0]          ),
  .rb_entry_iid_v                    (rb_entry_iid_0                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_0             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[0]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[0]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[0] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[0]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[0]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[0]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[0]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[0]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[0]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[0]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[0]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[0]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[0]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[0]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[0]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[0]  ),
  .rb_entry_preg_v                   (rb_entry_preg_0                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_0             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[0]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_0               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[0]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[0]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[0]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[0] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[0]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[0]        ),
  .rb_entry_st_x                     (rb_entry_st[0]                   ),
  .rb_entry_state_v                  (rb_entry_state_0                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[0]           ),
  .rb_entry_sync_x                   (rb_entry_sync[0]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[0]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[0]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_0                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[0]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[0]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[0]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[0]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[0]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[0]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


// &ConnRule(s/_x$/[1]/); @145
// &ConnRule(s/_v$/_1/); @146
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_1"); @147
ct_lsu_rb_entry  x_ct_lsu_rb_entry_1 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[1]                ),
  .rb_entry_addr_v                   (rb_entry_addr_1                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[1]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[1]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[1]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[1]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[1]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[1]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[1]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[1]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[1]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[1]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[1]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[1]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[1]           ),
  .rb_entry_data_v                   (rb_entry_data_1                  ),
  .rb_entry_depd_x                   (rb_entry_depd[1]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[1]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[1]         ),
  .rb_entry_fence_x                  (rb_entry_fence[1]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[1]          ),
  .rb_entry_iid_v                    (rb_entry_iid_1                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_1             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[1]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[1]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[1] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[1]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[1]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[1]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[1]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[1]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[1]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[1]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[1]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[1]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[1]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[1]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[1]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[1]  ),
  .rb_entry_preg_v                   (rb_entry_preg_1                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_1             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[1]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_1               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[1]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[1]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[1]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[1] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[1]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[1]        ),
  .rb_entry_st_x                     (rb_entry_st[1]                   ),
  .rb_entry_state_v                  (rb_entry_state_1                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[1]           ),
  .rb_entry_sync_x                   (rb_entry_sync[1]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[1]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[1]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_1                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[1]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[1]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[1]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[1]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[1]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[1]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


// &ConnRule(s/_x$/[2]/); @149
// &ConnRule(s/_v$/_2/); @150
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_2"); @151
ct_lsu_rb_entry  x_ct_lsu_rb_entry_2 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[2]                ),
  .rb_entry_addr_v                   (rb_entry_addr_2                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[2]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[2]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[2]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[2]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[2]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[2]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[2]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[2]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[2]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[2]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[2]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[2]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[2]           ),
  .rb_entry_data_v                   (rb_entry_data_2                  ),
  .rb_entry_depd_x                   (rb_entry_depd[2]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[2]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[2]         ),
  .rb_entry_fence_x                  (rb_entry_fence[2]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[2]          ),
  .rb_entry_iid_v                    (rb_entry_iid_2                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_2             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[2]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[2]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[2] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[2]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[2]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[2]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[2]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[2]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[2]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[2]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[2]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[2]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[2]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[2]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[2]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[2]  ),
  .rb_entry_preg_v                   (rb_entry_preg_2                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_2             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[2]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_2               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[2]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[2]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[2]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[2] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[2]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[2]        ),
  .rb_entry_st_x                     (rb_entry_st[2]                   ),
  .rb_entry_state_v                  (rb_entry_state_2                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[2]           ),
  .rb_entry_sync_x                   (rb_entry_sync[2]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[2]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[2]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_2                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[2]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[2]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[2]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[2]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[2]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[2]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


// &ConnRule(s/_x$/[3]/); @153
// &ConnRule(s/_v$/_3/); @154
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_3"); @155
ct_lsu_rb_entry  x_ct_lsu_rb_entry_3 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[3]                ),
  .rb_entry_addr_v                   (rb_entry_addr_3                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[3]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[3]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[3]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[3]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[3]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[3]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[3]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[3]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[3]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[3]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[3]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[3]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[3]           ),
  .rb_entry_data_v                   (rb_entry_data_3                  ),
  .rb_entry_depd_x                   (rb_entry_depd[3]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[3]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[3]         ),
  .rb_entry_fence_x                  (rb_entry_fence[3]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[3]          ),
  .rb_entry_iid_v                    (rb_entry_iid_3                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_3             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[3]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[3]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[3] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[3]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[3]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[3]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[3]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[3]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[3]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[3]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[3]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[3]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[3]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[3]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[3]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[3]  ),
  .rb_entry_preg_v                   (rb_entry_preg_3                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_3             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[3]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_3               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[3]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[3]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[3]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[3] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[3]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[3]        ),
  .rb_entry_st_x                     (rb_entry_st[3]                   ),
  .rb_entry_state_v                  (rb_entry_state_3                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[3]           ),
  .rb_entry_sync_x                   (rb_entry_sync[3]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[3]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[3]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_3                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[3]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[3]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[3]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[3]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[3]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[3]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


// &ConnRule(s/_x$/[4]/); @157
// &ConnRule(s/_v$/_4/); @158
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_4"); @159
ct_lsu_rb_entry  x_ct_lsu_rb_entry_4 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[4]                ),
  .rb_entry_addr_v                   (rb_entry_addr_4                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[4]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[4]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[4]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[4]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[4]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[4]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[4]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[4]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[4]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[4]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[4]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[4]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[4]           ),
  .rb_entry_data_v                   (rb_entry_data_4                  ),
  .rb_entry_depd_x                   (rb_entry_depd[4]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[4]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[4]         ),
  .rb_entry_fence_x                  (rb_entry_fence[4]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[4]          ),
  .rb_entry_iid_v                    (rb_entry_iid_4                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_4             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[4]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[4]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[4] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[4]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[4]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[4]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[4]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[4]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[4]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[4]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[4]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[4]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[4]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[4]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[4]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[4]  ),
  .rb_entry_preg_v                   (rb_entry_preg_4                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_4             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[4]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_4               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[4]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[4]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[4]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[4] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[4]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[4]        ),
  .rb_entry_st_x                     (rb_entry_st[4]                   ),
  .rb_entry_state_v                  (rb_entry_state_4                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[4]           ),
  .rb_entry_sync_x                   (rb_entry_sync[4]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[4]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[4]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_4                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[4]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[4]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[4]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[4]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[4]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[4]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


// &ConnRule(s/_x$/[5]/); @161
// &ConnRule(s/_v$/_5/); @162
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_5"); @163
ct_lsu_rb_entry  x_ct_lsu_rb_entry_5 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[5]                ),
  .rb_entry_addr_v                   (rb_entry_addr_5                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[5]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[5]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[5]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[5]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[5]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[5]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[5]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[5]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[5]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[5]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[5]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[5]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[5]           ),
  .rb_entry_data_v                   (rb_entry_data_5                  ),
  .rb_entry_depd_x                   (rb_entry_depd[5]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[5]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[5]         ),
  .rb_entry_fence_x                  (rb_entry_fence[5]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[5]          ),
  .rb_entry_iid_v                    (rb_entry_iid_5                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_5             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[5]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[5]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[5] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[5]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[5]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[5]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[5]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[5]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[5]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[5]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[5]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[5]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[5]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[5]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[5]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[5]  ),
  .rb_entry_preg_v                   (rb_entry_preg_5                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_5             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[5]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_5               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[5]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[5]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[5]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[5] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[5]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[5]        ),
  .rb_entry_st_x                     (rb_entry_st[5]                   ),
  .rb_entry_state_v                  (rb_entry_state_5                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[5]           ),
  .rb_entry_sync_x                   (rb_entry_sync[5]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[5]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[5]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_5                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[5]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[5]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[5]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[5]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[5]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[5]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


// &ConnRule(s/_x$/[6]/); @165
// &ConnRule(s/_v$/_6/); @166
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_6"); @167
ct_lsu_rb_entry  x_ct_lsu_rb_entry_6 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[6]                ),
  .rb_entry_addr_v                   (rb_entry_addr_6                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[6]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[6]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[6]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[6]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[6]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[6]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[6]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[6]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[6]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[6]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[6]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[6]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[6]           ),
  .rb_entry_data_v                   (rb_entry_data_6                  ),
  .rb_entry_depd_x                   (rb_entry_depd[6]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[6]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[6]         ),
  .rb_entry_fence_x                  (rb_entry_fence[6]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[6]          ),
  .rb_entry_iid_v                    (rb_entry_iid_6                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_6             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[6]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[6]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[6] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[6]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[6]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[6]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[6]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[6]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[6]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[6]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[6]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[6]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[6]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[6]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[6]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[6]  ),
  .rb_entry_preg_v                   (rb_entry_preg_6                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_6             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[6]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_6               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[6]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[6]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[6]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[6] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[6]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[6]        ),
  .rb_entry_st_x                     (rb_entry_st[6]                   ),
  .rb_entry_state_v                  (rb_entry_state_6                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[6]           ),
  .rb_entry_sync_x                   (rb_entry_sync[6]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[6]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[6]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_6                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[6]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[6]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[6]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[6]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[6]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[6]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


// &ConnRule(s/_x$/[7]/); @169
// &ConnRule(s/_v$/_7/); @170
// &Instance("ct_lsu_rb_entry","x_ct_lsu_rb_entry_7"); @171
ct_lsu_rb_entry  x_ct_lsu_rb_entry_7 (
  .biu_lsu_b_id                      (biu_lsu_b_id                     ),
  .biu_lsu_b_vld                     (biu_lsu_b_vld                    ),
  .biu_lsu_r_data_mask               (biu_lsu_r_data_mask              ),
  .biu_lsu_r_id                      (biu_lsu_r_id                     ),
  .biu_lsu_r_vld                     (biu_lsu_r_vld                    ),
  .cp0_lsu_icg_en                    (cp0_lsu_icg_en                   ),
  .cp0_yy_clk_en                     (cp0_yy_clk_en                    ),
  .cp0_yy_priv_mode                  (cp0_yy_priv_mode                 ),
  .cpurst_b                          (cpurst_b                         ),
  .ld_da_addr                        (ld_da_addr                       ),
  .ld_da_bkpta_data                  (ld_da_bkpta_data                 ),
  .ld_da_bkptb_data                  (ld_da_bkptb_data                 ),
  .ld_da_boundary_after_mask         (ld_da_boundary_after_mask        ),
  .ld_da_bytes_vld                   (ld_da_bytes_vld                  ),
  .ld_da_data_ori                    (ld_da_data_ori                   ),
  .ld_da_data_rot_sel                (ld_da_data_rot_sel               ),
  .ld_da_dcache_hit                  (ld_da_dcache_hit                 ),
  .ld_da_idx                         (ld_da_idx                        ),
  .ld_da_iid                         (ld_da_iid                        ),
  .ld_da_inst_size                   (ld_da_inst_size                  ),
  .ld_da_inst_vfls                   (ld_da_inst_vfls                  ),
  .ld_da_mcic_borrow_mmu             (ld_da_mcic_borrow_mmu            ),
  .ld_da_page_buf                    (ld_da_page_buf                   ),
  .ld_da_page_ca                     (ld_da_page_ca                    ),
  .ld_da_page_sec                    (ld_da_page_sec                   ),
  .ld_da_page_share                  (ld_da_page_share                 ),
  .ld_da_page_so                     (ld_da_page_so                    ),
  .ld_da_preg                        (ld_da_preg                       ),
  .ld_da_rb_atomic                   (ld_da_rb_atomic                  ),
  .ld_da_rb_cmit                     (ld_da_rb_cmit                    ),
  .ld_da_rb_cmplt_success            (ld_da_rb_cmplt_success           ),
  .ld_da_rb_create_lfb               (ld_da_rb_create_lfb              ),
  .ld_da_rb_data_vld                 (ld_da_rb_data_vld                ),
  .ld_da_rb_dest_vld                 (ld_da_rb_dest_vld                ),
  .ld_da_rb_discard_grnt             (ld_da_rb_discard_grnt            ),
  .ld_da_rb_ldamo                    (ld_da_rb_ldamo                   ),
  .ld_da_rb_merge_dp_vld             (ld_da_rb_merge_dp_vld            ),
  .ld_da_rb_merge_expt_vld           (ld_da_rb_merge_expt_vld          ),
  .ld_da_rb_merge_gateclk_en         (ld_da_rb_merge_gateclk_en        ),
  .ld_da_rb_merge_vld                (ld_da_rb_merge_vld               ),
  .ld_da_sign_extend                 (ld_da_sign_extend                ),
  .ld_da_vreg                        (ld_da_vreg                       ),
  .ld_da_vreg_sign_sel               (ld_da_vreg_sign_sel              ),
  .lm_already_snoop                  (lm_already_snoop                 ),
  .lsu_has_fence                     (lsu_has_fence                    ),
  .lsu_special_clk                   (lsu_special_clk                  ),
  .pad_yy_icg_scan_en                (pad_yy_icg_scan_en               ),
  .pfu_biu_req_addr                  (pfu_biu_req_addr                 ),
  .rb_biu_ar_id                      (rb_biu_ar_id                     ),
  .rb_create_ptr0_x                  (rb_create_ptr0[7]                ),
  .rb_entry_addr_v                   (rb_entry_addr_7                  ),
  .rb_entry_atomic_next_resp_x       (rb_entry_atomic_next_resp[7]     ),
  .rb_entry_atomic_x                 (rb_entry_atomic[7]               ),
  .rb_entry_biu_id_gateclk_en_x      (rb_entry_biu_id_gateclk_en[7]    ),
  .rb_entry_biu_pe_req_gateclk_en_x  (rb_entry_biu_pe_req_gateclk_en[7]),
  .rb_entry_biu_pe_req_grnt_x        (rb_entry_biu_pe_req_grnt[7]      ),
  .rb_entry_biu_pe_req_x             (rb_entry_biu_pe_req[7]           ),
  .rb_entry_biu_req_x                (rb_entry_biu_req[7]              ),
  .rb_entry_bkpta_data_x             (rb_entry_bkpta_data[7]           ),
  .rb_entry_bkptb_data_x             (rb_entry_bkptb_data[7]           ),
  .rb_entry_boundary_wakeup_x        (rb_entry_boundary_wakeup[7]      ),
  .rb_entry_bus_err_x                (rb_entry_bus_err[7]              ),
  .rb_entry_cmit_data_vld_x          (rb_entry_cmit_data_vld[7]        ),
  .rb_entry_create_lfb_x             (rb_entry_create_lfb[7]           ),
  .rb_entry_data_v                   (rb_entry_data_7                  ),
  .rb_entry_depd_x                   (rb_entry_depd[7]                 ),
  .rb_entry_discard_vld_x            (rb_entry_discard_vld[7]          ),
  .rb_entry_fence_ld_vld_x           (rb_entry_fence_ld_vld[7]         ),
  .rb_entry_fence_x                  (rb_entry_fence[7]                ),
  .rb_entry_flush_clear_x            (rb_entry_flush_clear[7]          ),
  .rb_entry_iid_v                    (rb_entry_iid_7                   ),
  .rb_entry_inst_size_v              (rb_entry_inst_size_7             ),
  .rb_entry_inst_vfls_x              (rb_entry_inst_vfls[7]            ),
  .rb_entry_ld_create_dp_vld_x       (rb_entry_ld_create_dp_vld[7]     ),
  .rb_entry_ld_create_gateclk_en_x   (rb_entry_ld_create_gateclk_en[7] ),
  .rb_entry_ld_create_vld_x          (rb_entry_ld_create_vld[7]        ),
  .rb_entry_ld_da_hit_idx_x          (rb_entry_ld_da_hit_idx[7]        ),
  .rb_entry_ldamo_x                  (rb_entry_ldamo[7]                ),
  .rb_entry_mcic_req_x               (rb_entry_mcic_req[7]             ),
  .rb_entry_merge_fail_x             (rb_entry_merge_fail[7]           ),
  .rb_entry_next_nc_bypass_x         (rb_entry_next_nc_bypass[7]       ),
  .rb_entry_next_so_bypass_x         (rb_entry_next_so_bypass[7]       ),
  .rb_entry_page_buf_x               (rb_entry_page_buf[7]             ),
  .rb_entry_page_ca_x                (rb_entry_page_ca[7]              ),
  .rb_entry_page_sec_x               (rb_entry_page_sec[7]             ),
  .rb_entry_page_share_x             (rb_entry_page_share[7]           ),
  .rb_entry_page_so_x                (rb_entry_page_so[7]              ),
  .rb_entry_pfu_biu_req_hit_idx_x    (rb_entry_pfu_biu_req_hit_idx[7]  ),
  .rb_entry_preg_v                   (rb_entry_preg_7                  ),
  .rb_entry_priv_mode_v              (rb_entry_priv_mode_7             ),
  .rb_entry_read_req_grnt_x          (rb_entry_read_req_grnt[7]        ),
  .rb_entry_rot_sel_v                (rb_entry_rot_sel_7               ),
  .rb_entry_sign_extend_x            (rb_entry_sign_extend[7]          ),
  .rb_entry_sq_pop_hit_idx_x         (rb_entry_sq_pop_hit_idx[7]       ),
  .rb_entry_st_create_dp_vld_x       (rb_entry_st_create_dp_vld[7]     ),
  .rb_entry_st_create_gateclk_en_x   (rb_entry_st_create_gateclk_en[7] ),
  .rb_entry_st_create_vld_x          (rb_entry_st_create_vld[7]        ),
  .rb_entry_st_da_hit_idx_x          (rb_entry_st_da_hit_idx[7]        ),
  .rb_entry_st_x                     (rb_entry_st[7]                   ),
  .rb_entry_state_v                  (rb_entry_state_7                 ),
  .rb_entry_sync_fence_x             (rb_entry_sync_fence[7]           ),
  .rb_entry_sync_x                   (rb_entry_sync[7]                 ),
  .rb_entry_vld_x                    (rb_entry_vld[7]                  ),
  .rb_entry_vreg_sign_sel_x          (rb_entry_vreg_sign_sel[7]        ),
  .rb_entry_vreg_v                   (rb_entry_vreg_7                  ),
  .rb_entry_wb_cmplt_grnt_x          (rb_entry_wb_cmplt_grnt[7]        ),
  .rb_entry_wb_cmplt_req_x           (rb_entry_wb_cmplt_req[7]         ),
  .rb_entry_wb_data_grnt_x           (rb_entry_wb_data_grnt[7]         ),
  .rb_entry_wb_data_pre_sel_x        (rb_entry_wb_data_pre_sel[7]      ),
  .rb_entry_wb_data_req_x            (rb_entry_wb_data_req[7]          ),
  .rb_entry_wmb_ce_hit_idx_x         (rb_entry_wmb_ce_hit_idx[7]       ),
  .rb_fence_ld                       (rb_fence_ld                      ),
  .rb_ld_biu_pe_req_grnt             (rb_ld_biu_pe_req_grnt            ),
  .rb_r_resp_err                     (rb_r_resp_err                    ),
  .rb_r_resp_okay                    (rb_r_resp_okay                   ),
  .rb_ready_all_req_biu_success      (rb_ready_all_req_biu_success     ),
  .rb_ready_ld_req_biu_success       (rb_ready_ld_req_biu_success      ),
  .rtu_lsu_async_flush               (rtu_lsu_async_flush              ),
  .rtu_yy_xx_commit0                 (rtu_yy_xx_commit0                ),
  .rtu_yy_xx_commit0_iid             (rtu_yy_xx_commit0_iid            ),
  .rtu_yy_xx_commit1                 (rtu_yy_xx_commit1                ),
  .rtu_yy_xx_commit1_iid             (rtu_yy_xx_commit1_iid            ),
  .rtu_yy_xx_commit2                 (rtu_yy_xx_commit2                ),
  .rtu_yy_xx_commit2_iid             (rtu_yy_xx_commit2_iid            ),
  .rtu_yy_xx_flush                   (rtu_yy_xx_flush                  ),
  .sq_pop_addr                       (sq_pop_addr                      ),
  .sq_pop_page_ca                    (sq_pop_page_ca                   ),
  .sq_pop_page_so                    (sq_pop_page_so                   ),
  .st_da_addr                        (st_da_addr                       ),
  .st_da_dcache_hit                  (st_da_dcache_hit                 ),
  .st_da_fence_inst                  (st_da_fence_inst                 ),
  .st_da_fence_mode                  (st_da_fence_mode                 ),
  .st_da_iid                         (st_da_iid                        ),
  .st_da_inst_size                   (st_da_inst_size                  ),
  .st_da_page_buf                    (st_da_page_buf                   ),
  .st_da_page_ca                     (st_da_page_ca                    ),
  .st_da_page_sec                    (st_da_page_sec                   ),
  .st_da_page_share                  (st_da_page_share                 ),
  .st_da_page_so                     (st_da_page_so                    ),
  .st_da_rb_cmit                     (st_da_rb_cmit                    ),
  .st_da_rb_create_lfb               (st_da_rb_create_lfb              ),
  .st_da_sync_inst                   (st_da_sync_inst                  ),
  .wmb_ce_addr                       (wmb_ce_addr                      ),
  .wmb_ce_page_ca                    (wmb_ce_page_ca                   ),
  .wmb_ce_page_so                    (wmb_ce_page_so                   ),
  .wmb_rb_so_pending                 (wmb_rb_so_pending                ),
  .wmb_sync_fence_biu_req_success    (wmb_sync_fence_biu_req_success   )
);


//==========================================================
//                      Create signal
//==========================================================
//+------------+
//| create_ptr |
//+------------+
// &CombBeg; @179
always @( rb_entry_vld[7:0])
begin
rb_create_ptr0[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
casez(rb_entry_vld[RB_ENTRY-1:0])
  8'b????_???0:rb_create_ptr0[0]  = 1'b1;
  8'b????_??01:rb_create_ptr0[1]  = 1'b1;
  8'b????_?011:rb_create_ptr0[2]  = 1'b1;
  8'b????_0111:rb_create_ptr0[3]  = 1'b1;
  8'b???0_1111:rb_create_ptr0[4]  = 1'b1;
  8'b??01_1111:rb_create_ptr0[5]  = 1'b1;
  8'b?011_1111:rb_create_ptr0[6]  = 1'b1;
  8'b0111_1111:rb_create_ptr0[7]  = 1'b1;
  default:rb_create_ptr0[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
endcase
// &CombEnd; @192
end

// &CombBeg; @194
always @( rb_entry_vld[7:0])
begin
rb_create_ptr1[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
casez(rb_entry_vld[RB_ENTRY-1:0])
  8'b0???_????:rb_create_ptr1[7]  = 1'b1;
  8'b10??_????:rb_create_ptr1[6]  = 1'b1;
  8'b110?_????:rb_create_ptr1[5]  = 1'b1;
  8'b1110_????:rb_create_ptr1[4]  = 1'b1;
  8'b1111_0???:rb_create_ptr1[3]  = 1'b1;
  8'b1111_10??:rb_create_ptr1[2]  = 1'b1;
  8'b1111_110?:rb_create_ptr1[1]  = 1'b1;
  8'b1111_1110:rb_create_ptr1[0]  = 1'b1;
  default:rb_create_ptr1[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
endcase
// &CombEnd; @207
end

//------------------full signal-----------------------------
assign rb_full          = &rb_entry_vld[RB_ENTRY-1:0];
assign rb_empty_less2   = &(rb_entry_vld[RB_ENTRY-1:0]
                            | rb_create_ptr0[RB_ENTRY-1:0]);
assign rb_empty_less3   = &(rb_entry_vld[RB_ENTRY-1:0]
                            | rb_create_ptr0[RB_ENTRY-1:0]
                            | rb_create_ptr1[RB_ENTRY-1:0]);

// &Force("output","rb_ld_da_full"); @217
assign rb_ld_da_full            = rb_full
                                  ||  !ld_da_old
                                      &&  rb_empty_less2;
// &Force("output","rb_st_da_full"); @221
assign rb_st_da_full            = rb_full
                                  ||  (!st_da_old || ld_da_rb_create_judge_vld)
                                      &&  rb_empty_less2
                                  ||  ld_da_rb_create_judge_vld
                                      &&  !st_da_old
                                      &&  rb_empty_less3;
//------------------empty signal----------------------------
// &Force("output","rb_empty"); @229
assign rb_not_empty             = |rb_entry_vld[RB_ENTRY-1:0];
assign rb_empty                 = !rb_not_empty;
//------------------merge signal----------------------------
assign rb_ld_da_merge_fail      = |(rb_entry_merge_fail[RB_ENTRY-1:0]);

//------------------create vld------------------------------
assign rb_create_ld_success = ld_da_rb_create_vld
                              &&  !rb_ld_da_full
                              &&  !rtu_yy_xx_flush;

assign rb_create_st_success = st_da_rb_create_vld
                              &&  !rb_st_da_full
                              &&  !rtu_yy_xx_flush;

assign rb_entry_ld_create_vld[RB_ENTRY-1:0]     =
                rb_create_ptr0[RB_ENTRY-1:0]
                & {RB_ENTRY{rb_create_ld_success}};
assign rb_entry_st_create_vld[RB_ENTRY-1:0]     =
                rb_create_ptr1[RB_ENTRY-1:0]
                & {RB_ENTRY{rb_create_st_success}};

//------------------create dp vld---------------------------
assign rb_entry_ld_create_dp_vld[RB_ENTRY-1:0]  =
                rb_create_ptr0[RB_ENTRY-1:0]
                & {RB_ENTRY{!rb_ld_da_full}}
                & {RB_ENTRY{ld_da_rb_create_dp_vld}};
assign rb_entry_st_create_dp_vld[RB_ENTRY-1:0]  =
                rb_create_ptr1[RB_ENTRY-1:0]
                & {RB_ENTRY{!rb_st_da_full}}
                & {RB_ENTRY{st_da_rb_create_dp_vld}};

//------------------create gateclk vld----------------------
assign rb_entry_ld_create_gateclk_en[RB_ENTRY-1:0] =
                rb_create_ptr0[RB_ENTRY-1:0]
                & {RB_ENTRY{!rb_ld_da_full}}
                & {RB_ENTRY{ld_da_rb_create_gateclk_en}};
assign rb_entry_st_create_gateclk_en[RB_ENTRY-1:0] =
                rb_create_ptr1[RB_ENTRY-1:0]
                & {RB_ENTRY{!rb_st_da_full}}
                & {RB_ENTRY{st_da_rb_create_gateclk_en}};

//==========================================================
//                    info for bar ready
//==========================================================
//success neglect mmu request
assign rb_ready_ld_req_biu          = |(~rb_entry_st[RB_ENTRY-1:0]
                                        & ~rb_entry_mcic_req[RB_ENTRY-1:0]
                                        & rb_entry_biu_req[RB_ENTRY-1:0]);

assign rb_ready_ld_req_biu_success  = !rb_ready_ld_req_biu;
assign rb_ready_req_biu             = |(~rb_entry_mcic_req[RB_ENTRY-1:0]
                                        & rb_entry_biu_req[RB_ENTRY-1:0]);
assign rb_ready_all_req_biu_success = !rb_ready_req_biu;
 
//==========================================================
//                        Fence signal
//==========================================================
// &Force("output","lsu_has_fence"); @287
always @(posedge lsu_special_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lsu_has_fence   <=  1'b0;
  else if(rb_create_st_success  &&  !lsu_has_fence)
    lsu_has_fence   <=  st_da_sync_fence;
  else 
    lsu_has_fence   <=  lsu_has_fence_set;
end

assign rb_has_sync_fence  = |(rb_entry_vld[RB_ENTRY-1:0]
                              & rb_entry_sync_fence[RB_ENTRY-1:0]);
assign lsu_has_fence_set  = rb_has_sync_fence
                            ||  wmb_has_sync_fence;
assign lsu_idu_no_fence   = !lsu_has_fence;

//==========================================================
//                  Request biu pop entry
//==========================================================
//------------------------registers-------------------------
//+---------+
//| biu_req |
//+---------+
// &Force("output","rb_biu_req_unmask"); @311
always @(posedge rb_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rb_biu_req_unmask   <=  1'b0;
  else if(rb_pipe_biu_pe_req)
    rb_biu_req_unmask   <=  1'b1;
  else if(rb_read_req_grnt  ||  rb_biu_req_flush_clear)
    rb_biu_req_unmask   <=  1'b0;
end

//+---------+------+------------+
//| pop ptr | addr | lfb_create |
//+---------+------+------------+
// &Force("output","rb_biu_req_addr"); @325
always @(posedge rb_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    rb_biu_req_ptr[RB_ENTRY-1:0]    <=  {RB_ENTRY{1'b0}};
    rb_biu_req_create_lfb           <=  1'b0;
    rb_biu_req_addr[`PA_WIDTH-1:0]  <=  {`PA_WIDTH{1'b0}};
  end
  else if(rb_biu_pe_req_permit  &&  rb_biu_pe_req)
  begin
    rb_biu_req_ptr[RB_ENTRY-1:0]    <=  rb_biu_pe_req_ptr[RB_ENTRY-1:0];
    rb_biu_req_create_lfb           <=  rb_biu_pe_create_lfb;
    rb_biu_req_addr[`PA_WIDTH-1:0]  <=  rb_biu_pe_req_addr[`PA_WIDTH-1:0];
  end
  else if(rb_ld_biu_pe_req_grnt)
  begin
    rb_biu_req_ptr[RB_ENTRY-1:0]    <=  rb_create_ptr0[RB_ENTRY-1:0];
    rb_biu_req_create_lfb           <=  ld_da_rb_create_lfb;
    rb_biu_req_addr[`PA_WIDTH-1:0]  <=  ld_da_addr[`PA_WIDTH-1:0];
  end
//  else if(rb_st_biu_pe_req_grnt)
//  begin
//    rb_biu_req_ptr[RB_ENTRY-1:0]  <=  rb_create_ptr1[RB_ENTRY-1:0];
//    rb_biu_req_create_lfb         <=  st_da_rb_create_lfb;
//    rb_biu_req_addr[`PA_WIDTH-1:0]         <=  st_da_addr[`PA_WIDTH-1:0];
//  end
end

//-----------------------biu req ptr------------------------
assign rb_biu_pe_req_gateclk_en = |rb_entry_biu_pe_req_gateclk_en[RB_ENTRY-1:0];
assign rb_biu_pe_req = |rb_entry_biu_pe_req[RB_ENTRY-1:0];
// &CombBeg; @357
always @( rb_entry_biu_pe_req[7:0])
begin
rb_biu_pe_req_ptr[RB_ENTRY-1:0] = {RB_ENTRY{1'b0}};
casez(rb_entry_biu_pe_req[RB_ENTRY-1:0])
  8'b????_???1:rb_biu_pe_req_ptr[0]  = 1'b1;
  8'b????_??10:rb_biu_pe_req_ptr[1]  = 1'b1;
  8'b????_?100:rb_biu_pe_req_ptr[2]  = 1'b1;
  8'b????_1000:rb_biu_pe_req_ptr[3]  = 1'b1;
  8'b???1_0000:rb_biu_pe_req_ptr[4]  = 1'b1;
  8'b??10_0000:rb_biu_pe_req_ptr[5]  = 1'b1;
  8'b?100_0000:rb_biu_pe_req_ptr[6]  = 1'b1;
  8'b1000_0000:rb_biu_pe_req_ptr[7]  = 1'b1;
  default:rb_biu_pe_req_ptr[RB_ENTRY-1:0] = {RB_ENTRY{1'b0}};
endcase
// &CombEnd; @370
end

assign rb_biu_pe_create_lfb       = |(rb_biu_pe_req_ptr[RB_ENTRY-1:0]
                                      & rb_entry_create_lfb[RB_ENTRY-1:0]);
assign rb_biu_pe_req_addr[`PA_WIDTH-1:0]  = {`PA_WIDTH{rb_biu_pe_req_ptr[0]}}  & rb_entry_addr_0[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{rb_biu_pe_req_ptr[1]}}  & rb_entry_addr_1[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{rb_biu_pe_req_ptr[2]}}  & rb_entry_addr_2[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{rb_biu_pe_req_ptr[3]}}  & rb_entry_addr_3[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{rb_biu_pe_req_ptr[4]}}  & rb_entry_addr_4[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{rb_biu_pe_req_ptr[5]}}  & rb_entry_addr_5[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{rb_biu_pe_req_ptr[6]}}  & rb_entry_addr_6[`PA_WIDTH-1:0]
                                            | {`PA_WIDTH{rb_biu_pe_req_ptr[7]}}  & rb_entry_addr_7[`PA_WIDTH-1:0];

//-------------------ld/st biu pop req----------------------
assign rb_ld_biu_pe_req    = rb_create_ld_success
                              &&  !ld_da_rb_data_vld
                              &&  !ld_da_page_so
                              &&  !lsu_has_fence;

//assign rb_st_biu_pe_req     = st_da_rb_create_vld
//                              &&  !rb_st_da_full
//                              &&  !st_da_sync_inst
//                              &&  !st_da_fence_inst
//                              &&  !lsu_has_fence;

assign rb_pipe_biu_pe_req   = rb_biu_pe_req
                              ||  rb_ld_biu_pe_req;

//---------------------pe_req_grnt-------------------------
assign rb_biu_pe_req_permit   = !rb_biu_req_unmask
                                ||  rb_read_req_grnt
                                ||  rb_biu_req_flush_clear;
assign rb_entry_biu_pe_req_grnt[RB_ENTRY-1:0]=
                {RB_ENTRY{rb_biu_pe_req_permit}}
                & rb_biu_pe_req_ptr[RB_ENTRY-1:0];

assign rb_ld_biu_pe_req_grnt  = rb_biu_pe_req_permit
                                &&  !rb_biu_pe_req
                                &&  rb_ld_biu_pe_req;

//assign rb_st_biu_pe_req_grnt = rb_biu_pe_req_permit
//                                &&  !rb_biu_pe_req
//                                &&  !rb_ld_biu_pe_req
//                                &&  rb_st_biu_pe_req;

//-----------------flush clear in coror----------------------
assign rb_biu_req_flush_clear = ( |(rb_biu_req_ptr[RB_ENTRY-1:0]
                                    & rb_entry_flush_clear[RB_ENTRY-1:0]))
                                &&  rb_biu_req_unmask;

//==========================================================
//                      Request biu
//==========================================================
//------------------barrier---------------------------------
// &Force("output","rb_fence_ld"); @424
assign rb_fence_ld  = |rb_entry_fence_ld_vld[RB_ENTRY-1:0];

//------------------biu req info----------------------------
//rb_biu_req_unmask will send to wmb_entry
// //&Force("output","rb_biu_req_unmask"); @429
//assign rb_biu_req_unmask          = |rb_entry_biu_req[RB_ENTRY-1:0];
assign rb_biu_req_mcic_req        = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_mcic_req[RB_ENTRY-1:0]);

assign rb_biu_req_page_ca         = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_page_ca[RB_ENTRY-1:0]);
assign rb_biu_req_page_so         = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_page_so[RB_ENTRY-1:0]);
assign rb_biu_req_page_sec        = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_page_sec[RB_ENTRY-1:0]);
assign rb_biu_req_page_buf        = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_page_buf[RB_ENTRY-1:0]);
assign rb_biu_req_page_share      = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_page_share[RB_ENTRY-1:0]);
assign rb_biu_req_sync            = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_sync[RB_ENTRY-1:0]);
assign rb_biu_req_fence           = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_fence[RB_ENTRY-1:0]);
assign rb_biu_req_atomic          = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_atomic[RB_ENTRY-1:0]);
assign rb_biu_req_ldamo           = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_ldamo[RB_ENTRY-1:0]);
assign rb_biu_req_st              = |(rb_biu_req_ptr[RB_ENTRY-1:0] & rb_entry_st[RB_ENTRY-1:0]);
assign rb_biu_req_inst_size[2:0]  = {3{rb_biu_req_ptr[0]}} & rb_entry_inst_size_0[2:0]
                                    | {3{rb_biu_req_ptr[1]}} & rb_entry_inst_size_1[2:0]
                                    | {3{rb_biu_req_ptr[2]}} & rb_entry_inst_size_2[2:0]
                                    | {3{rb_biu_req_ptr[3]}} & rb_entry_inst_size_3[2:0]
                                    | {3{rb_biu_req_ptr[4]}} & rb_entry_inst_size_4[2:0]
                                    | {3{rb_biu_req_ptr[5]}} & rb_entry_inst_size_5[2:0]
                                    | {3{rb_biu_req_ptr[6]}} & rb_entry_inst_size_6[2:0]
                                    | {3{rb_biu_req_ptr[7]}} & rb_entry_inst_size_7[2:0];

assign rb_biu_req_priv_mode[1:0]  = {2{rb_biu_req_ptr[0]}} & rb_entry_priv_mode_0[1:0]
                                    | {2{rb_biu_req_ptr[1]}} & rb_entry_priv_mode_1[1:0]
                                    | {2{rb_biu_req_ptr[2]}} & rb_entry_priv_mode_2[1:0]
                                    | {2{rb_biu_req_ptr[3]}} & rb_entry_priv_mode_3[1:0]
                                    | {2{rb_biu_req_ptr[4]}} & rb_entry_priv_mode_4[1:0]
                                    | {2{rb_biu_req_ptr[5]}} & rb_entry_priv_mode_5[1:0]
                                    | {2{rb_biu_req_ptr[6]}} & rb_entry_priv_mode_6[1:0]
                                    | {2{rb_biu_req_ptr[7]}} & rb_entry_priv_mode_7[1:0];

assign rb_biu_req_page_ca_dcache_en     = rb_biu_req_page_ca  &&  cp0_lsu_dcache_en;
assign rb_biu_req_page_nc_atomic        = !rb_biu_req_page_ca &&  rb_biu_req_atomic;

assign rb_biu_req_hit_idx     = wmb_rb_biu_req_hit_idx
                                ||  lfb_rb_biu_req_hit_idx
                                ||  vb_rb_biu_req_hit_idx;
// &Force("output","rb_biu_ar_req"); @467
assign rb_biu_ar_req          = rb_biu_req_unmask
                                &&  !rb_biu_req_flush_clear
                                &&  (!rb_biu_req_hit_idx
                                        &&  rb_biu_req_page_ca
                                        &&  !lfb_addr_full
                                        &&  (lfb_rb_ca_rready_grnt
                                             || rb_nc_fifo_empty) 
                                    ||  !rb_biu_req_page_ca
                                        &&  lfb_rb_nc_rready_grnt);
assign rb_biu_ar_dp_req       = rb_biu_req_unmask
                                &&  !rb_biu_req_flush_clear
                                &&  (rb_biu_req_page_ca
                                        &&  !lfb_addr_full
                                        &&  (lfb_rb_ca_rready_grnt
                                             || rb_nc_fifo_empty) 
                                    ||  !rb_biu_req_page_ca
                                        &&  lfb_rb_nc_rready_grnt);
assign rb_biu_ar_req_gateclk_en = rb_biu_req_unmask;

//----------ar_id-----------------------
assign rb_biu_req_sync_fence      = rb_biu_req_sync  ||  rb_biu_req_fence;
assign rb_biu_ar_id_judge[3:0]    = {rb_biu_req_sync_fence,
                                    rb_biu_req_page_so,
                                    rb_biu_req_page_ca,
                                    rb_biu_req_atomic};

// &Force("output","rb_biu_ar_id"); @494
// &CombBeg; @495
always @( rb_biu_ar_id_judge[3:0]
       or lfb_rb_create_id[4:0])
begin
rb_biu_ar_id[4:0] = 5'b0;
casez(rb_biu_ar_id_judge[3:0])
  4'b1???:rb_biu_ar_id[4:0] = BIU_R_SYNC_FENCE_ID;
  4'b01??:rb_biu_ar_id[4:0] = BIU_R_SO_ID;
  4'b001?:rb_biu_ar_id[4:0] = lfb_rb_create_id[4:0];
  4'b0001:rb_biu_ar_id[4:0] = BIU_R_NC_ATOM_ID;
  4'b0000:rb_biu_ar_id[4:0] = BIU_R_NC_ID;
  default:rb_biu_ar_id[4:0] = 5'b0;
endcase
// &CombEnd; @505
end

//----------ar others-------------------
assign rb_biu_ar_addr[`PA_WIDTH-1:4]  = rb_biu_req_addr[`PA_WIDTH-1:4];

assign rb_biu_ar_size_maintain  = (rb_biu_req_page_so  ||  rb_biu_req_page_nc_atomic)
                                  &&  !rb_biu_req_sync_fence;

assign rb_biu_ar_addr[3:0]      = rb_biu_ar_size_maintain
                                  ? rb_biu_req_addr[3:0]
                                  : 4'b0;
//len: a cache line(4x) or 1x
assign rb_biu_len3_sel = rb_biu_req_page_ca_dcache_en  
                            &&  !rb_biu_req_sync_fence
                         || rb_biu_req_page_ca
                            &&  rb_biu_req_page_share 
                            &&  rb_biu_req_atomic; 
      
assign rb_biu_ar_len[1:0]       = rb_biu_len3_sel
                                  ? 2'h3
                                  : 2'h0;
//size:
//  ca/nc : 111
//  so    : so_size
assign rb_biu_ar_size[2:0]      = rb_biu_ar_size_maintain
                                  ? {rb_biu_req_inst_size[2:0]}
                                  : 3'b100;
//burst:incr1 or wrap4
assign rb_biu_ar_burst[1:0]     = (rb_biu_req_page_ca_dcache_en  &&  !rb_biu_req_sync_fence)
                                  ? 2'b10
                                  : 2'b01;
assign rb_biu_ar_lock           = rb_biu_req_page_nc_atomic;


//cache:
//if sync/bar use normal, noncacheable
assign rb_biu_ar_cache[3:0]     = rb_biu_req_sync_fence
                                  ? 4'b0011
                                  : {rb_biu_req_page_ca,
                                    rb_biu_req_page_ca,
                                    !rb_biu_req_page_so,
                                    rb_biu_req_page_buf};

//prot:2:inst,1:sec,0:supv
assign rb_biu_ar_prot[2:0]      = {1'b0,
                                  rb_biu_req_page_sec,
                                  rb_biu_req_priv_mode[0]};
//if request both biu and lfb, then the rb_entry must get two grnt signal, else
//it will not request biu or lfb. it is realized in rb top module.
assign rb_biu_ar_user[2:0]      = {1'b0,rb_biu_req_priv_mode[1],rb_biu_req_mcic_req};
//----------ar snoop--------------------
assign rb_atomic_readunique     = rb_biu_req_page_ca
                                  &&  rb_biu_req_page_share
                                  &&  rb_biu_req_ldamo;
//lr should send read shared when cache is off (for l2 snoop filter)
assign rb_biu_share_refill      = rb_biu_req_page_ca
                                  &&  rb_biu_req_page_share
                                  &&  (cp0_lsu_dcache_en || rb_biu_req_atomic);  

// &CombBeg; @567
always @( rb_biu_req_st
       or rb_atomic_readunique
       or rb_biu_share_refill)
begin
rb_biu_ar_snoop[3:0] = 4'b0;
casez({rb_atomic_readunique,rb_biu_share_refill,rb_biu_req_st})
  3'b1??:rb_biu_ar_snoop[3:0] = 4'b0111;//ReadUnique
  3'b011:rb_biu_ar_snoop[3:0] = 4'b0111;//ReadUnique
  3'b010:rb_biu_ar_snoop[3:0] = 4'b0001;//ReadShared
  default:rb_biu_ar_snoop[3:0] = 4'b0;//ReadNoSnoop & ReadOnce
endcase
// &CombEnd; @575
end

//if ld non-cacheable then domain = 2'b11
assign rb_biu_ar_domain[1:0]    = (!rb_biu_req_page_ca  &&  !rb_biu_req_st)
                                  ? 2'b11
                                  : {1'b0,rb_biu_req_page_share};

assign rb_biu_req_not_wait_fence  = rb_biu_req_mcic_req ||  rb_biu_req_st;
// &CombBeg; @583
always @( rb_biu_req_not_wait_fence
       or rb_biu_req_fence
       or rb_biu_req_sync)
begin
rb_biu_ar_bar[1:0]  = 2'b00;
case({rb_biu_req_not_wait_fence,rb_biu_req_sync,rb_biu_req_fence})
  3'b100:rb_biu_ar_bar[1:0] = 2'b10;//mmu req
  3'b110:rb_biu_ar_bar[1:0] = 2'b11;//sync req
  3'b101:rb_biu_ar_bar[1:0] = 2'b01;//fence req
  default:rb_biu_ar_bar[1:0]  = 2'b00;
endcase
// &CombEnd; @591
end

//-----------------biu grnt signal--------------------------
assign rb_biu_nc_req_grnt     = bus_arb_rb_ar_grnt
                                &&  !rb_biu_req_page_ca
                                &&  !rb_biu_req_page_so
                                &&  !rb_biu_req_atomic
                                &&  !rb_biu_req_sync_fence;
assign rb_biu_so_req_grnt     = bus_arb_rb_ar_grnt
                                &&  rb_biu_req_page_so
                                &&  !rb_biu_req_sync_fence;

assign rb_read_req_grnt       = bus_arb_rb_ar_grnt;

//for timing, use shorter route of req_success for gateclk
assign rb_read_req_grnt_gateclk_en  = rb_biu_req_unmask;
assign rb_entry_biu_id_gateclk_en[RB_ENTRY-1:0] =
                {RB_ENTRY{rb_read_req_grnt_gateclk_en}}
                & rb_biu_req_ptr[RB_ENTRY-1:0];
assign rb_entry_read_req_grnt[RB_ENTRY-1:0] =
                {RB_ENTRY{rb_read_req_grnt}}
                & rb_biu_req_ptr[RB_ENTRY-1:0];

//==========================================================
//                  Request ld_wb stage
//==========================================================
//------------------wb cmplt part signal--------------------
//because only so/ex load request cmplt, so there is only 1 complete request
//assign rb_ld_wb_cmplt_ptr[RB_ENTRY-1:0] = rb_entry_wb_cmplt_req[RB_ENTRY-1:0];
assign rb_ld_wb_cmplt_req     = |rb_entry_wb_cmplt_req[RB_ENTRY-1:0];
assign rb_ld_wb_iid[6:0]      = {7{rb_ld_wb_cmplt_ptr[0]}} & rb_entry_iid_0[6:0]
                                | {7{rb_ld_wb_cmplt_ptr[1]}} & rb_entry_iid_1[6:0]
                                | {7{rb_ld_wb_cmplt_ptr[2]}} & rb_entry_iid_2[6:0]
                                | {7{rb_ld_wb_cmplt_ptr[3]}} & rb_entry_iid_3[6:0]
                                | {7{rb_ld_wb_cmplt_ptr[4]}} & rb_entry_iid_4[6:0]
                                | {7{rb_ld_wb_cmplt_ptr[5]}} & rb_entry_iid_5[6:0]
                                | {7{rb_ld_wb_cmplt_ptr[6]}} & rb_entry_iid_6[6:0]
                                | {7{rb_ld_wb_cmplt_ptr[7]}} & rb_entry_iid_7[6:0];
assign rb_ld_wb_bkpta_data    = |(rb_ld_wb_cmplt_ptr[RB_ENTRY-1:0]  & rb_entry_bkpta_data[RB_ENTRY-1:0]);
assign rb_ld_wb_bkptb_data    = |(rb_ld_wb_cmplt_ptr[RB_ENTRY-1:0]  & rb_entry_bkptb_data[RB_ENTRY-1:0]);

//----------wb cmplt part grnt----------
assign rb_entry_wb_cmplt_grnt[RB_ENTRY-1:0] = rb_ld_wb_cmplt_ptr[RB_ENTRY-1:0]
                                              & {RB_ENTRY{ld_wb_rb_cmplt_grnt}};

// &Force("output","rb_ld_wb_expt_vld"); @637
// &Force("output","rb_ld_wb_element_cnt"); @638
assign rb_ld_wb_expt_vld     = 1'b0;
assign rb_ld_wb_expt_gateclk = 1'b0;

//------------------wb data part signal---------------------
//use static arbitrate
// &CombBeg; @723
always @( rb_entry_wb_data_pre_sel[7:0])
begin
rb_ld_wb_data_ptr_pre[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
casez(rb_entry_wb_data_pre_sel[RB_ENTRY-1:0])
  8'b????_???1:rb_ld_wb_data_ptr_pre[0]  = 1'b1;
  8'b????_??10:rb_ld_wb_data_ptr_pre[1]  = 1'b1;
  8'b????_?100:rb_ld_wb_data_ptr_pre[2]  = 1'b1;
  8'b????_1000:rb_ld_wb_data_ptr_pre[3]  = 1'b1;
  8'b???1_0000:rb_ld_wb_data_ptr_pre[4]  = 1'b1;
  8'b??10_0000:rb_ld_wb_data_ptr_pre[5]  = 1'b1;
  8'b?100_0000:rb_ld_wb_data_ptr_pre[6]  = 1'b1;
  8'b1000_0000:rb_ld_wb_data_ptr_pre[7]  = 1'b1;
  default:rb_ld_wb_data_ptr_pre[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
endcase
// &CombEnd; @736
end
//------------------wb cmplt part signal---------------------
//use static arbitrate
// &CombBeg; @739
always @( rb_entry_wb_cmplt_req[7:0])
begin
rb_ld_wb_cmplt_ptr[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
casez(rb_entry_wb_cmplt_req[RB_ENTRY-1:0])
  8'b????_???1:rb_ld_wb_cmplt_ptr[0]  = 1'b1;
  8'b????_??10:rb_ld_wb_cmplt_ptr[1]  = 1'b1;
  8'b????_?100:rb_ld_wb_cmplt_ptr[2]  = 1'b1;
  8'b????_1000:rb_ld_wb_cmplt_ptr[3]  = 1'b1;
  8'b???1_0000:rb_ld_wb_cmplt_ptr[4]  = 1'b1;
  8'b??10_0000:rb_ld_wb_cmplt_ptr[5]  = 1'b1;
  8'b?100_0000:rb_ld_wb_cmplt_ptr[6]  = 1'b1;
  8'b1000_0000:rb_ld_wb_cmplt_ptr[7]  = 1'b1;
  default:rb_ld_wb_cmplt_ptr[RB_ENTRY-1:0]  = {RB_ENTRY{1'b0}};
endcase
// &CombEnd; @752
end
//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//data_ptr pop signal
assign rb_data_ptr_clk_en = rb_not_empty; 
                            
always @(posedge rb_data_ptr_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rb_ld_wb_data_ptr[RB_ENTRY-1:0]  <= {RB_ENTRY{1'b0}};
  else if(rb_not_empty)
    rb_ld_wb_data_ptr[RB_ENTRY-1:0]  <=  rb_ld_wb_data_ptr_pre[RB_ENTRY-1:0];
end

assign rb_ld_wb_data_req_unmask = |(rb_ld_wb_data_ptr[RB_ENTRY-1:0] & rb_entry_wb_data_req[RB_ENTRY-1:0]);

assign rb_ld_wb_inst_size[2:0]  = {3{rb_ld_wb_data_ptr[0]}} & rb_entry_inst_size_0[2:0]
                                  | {3{rb_ld_wb_data_ptr[1]}} & rb_entry_inst_size_1[2:0]
                                  | {3{rb_ld_wb_data_ptr[2]}} & rb_entry_inst_size_2[2:0]
                                  | {3{rb_ld_wb_data_ptr[3]}} & rb_entry_inst_size_3[2:0]
                                  | {3{rb_ld_wb_data_ptr[4]}} & rb_entry_inst_size_4[2:0]
                                  | {3{rb_ld_wb_data_ptr[5]}} & rb_entry_inst_size_5[2:0]
                                  | {3{rb_ld_wb_data_ptr[6]}} & rb_entry_inst_size_6[2:0]
                                  | {3{rb_ld_wb_data_ptr[7]}} & rb_entry_inst_size_7[2:0];

assign rb_ld_wb_preg[6:0]       = {7{rb_ld_wb_data_ptr[0]}} & rb_entry_preg_0[6:0]
                                  | {7{rb_ld_wb_data_ptr[1]}} & rb_entry_preg_1[6:0]
                                  | {7{rb_ld_wb_data_ptr[2]}} & rb_entry_preg_2[6:0]
                                  | {7{rb_ld_wb_data_ptr[3]}} & rb_entry_preg_3[6:0]
                                  | {7{rb_ld_wb_data_ptr[4]}} & rb_entry_preg_4[6:0]
                                  | {7{rb_ld_wb_data_ptr[5]}} & rb_entry_preg_5[6:0]
                                  | {7{rb_ld_wb_data_ptr[6]}} & rb_entry_preg_6[6:0]
                                  | {7{rb_ld_wb_data_ptr[7]}} & rb_entry_preg_7[6:0];

assign rb_ld_wb_sign_extend     = |(rb_ld_wb_data_ptr[RB_ENTRY-1:0] & rb_entry_sign_extend[RB_ENTRY-1:0]);
assign rb_ld_wb_bus_err         = |(rb_ld_wb_data_ptr[RB_ENTRY-1:0]  & rb_entry_bus_err[RB_ENTRY-1:0]);
assign rb_ld_wb_data_req        = rb_ld_wb_data_req_unmask;

assign rb_ld_wb_vreg[5:0]       = {6{rb_ld_wb_data_ptr[0]}} & rb_entry_vreg_0[5:0]
                                  | {6{rb_ld_wb_data_ptr[1]}} & rb_entry_vreg_1[5:0]
                                  | {6{rb_ld_wb_data_ptr[2]}} & rb_entry_vreg_2[5:0]
                                  | {6{rb_ld_wb_data_ptr[3]}} & rb_entry_vreg_3[5:0]
                                  | {6{rb_ld_wb_data_ptr[4]}} & rb_entry_vreg_4[5:0]
                                  | {6{rb_ld_wb_data_ptr[5]}} & rb_entry_vreg_5[5:0]
                                  | {6{rb_ld_wb_data_ptr[6]}} & rb_entry_vreg_6[5:0]
                                  | {6{rb_ld_wb_data_ptr[7]}} & rb_entry_vreg_7[5:0];

assign rb_ld_wb_bus_err_addr[`PA_WIDTH-1:0] = {`PA_WIDTH{rb_ld_wb_data_ptr[0]}} & rb_entry_addr_0[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{rb_ld_wb_data_ptr[1]}} & rb_entry_addr_1[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{rb_ld_wb_data_ptr[2]}} & rb_entry_addr_2[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{rb_ld_wb_data_ptr[3]}} & rb_entry_addr_3[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{rb_ld_wb_data_ptr[4]}} & rb_entry_addr_4[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{rb_ld_wb_data_ptr[5]}} & rb_entry_addr_5[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{rb_ld_wb_data_ptr[6]}} & rb_entry_addr_6[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{rb_ld_wb_data_ptr[7]}} & rb_entry_addr_7[`PA_WIDTH-1:0];

assign rb_ld_wb_data_iid[6:0]   = {7{rb_ld_wb_data_ptr[0]}} & rb_entry_iid_0[6:0]
                                  | {7{rb_ld_wb_data_ptr[1]}} & rb_entry_iid_1[6:0]
                                  | {7{rb_ld_wb_data_ptr[2]}} & rb_entry_iid_2[6:0]
                                  | {7{rb_ld_wb_data_ptr[3]}} & rb_entry_iid_3[6:0]
                                  | {7{rb_ld_wb_data_ptr[4]}} & rb_entry_iid_4[6:0]
                                  | {7{rb_ld_wb_data_ptr[5]}} & rb_entry_iid_5[6:0]
                                  | {7{rb_ld_wb_data_ptr[6]}} & rb_entry_iid_6[6:0]
                                  | {7{rb_ld_wb_data_ptr[7]}} & rb_entry_iid_7[6:0];

// &Force("output","rb_ld_wb_inst_vfls"); @818
assign rb_ld_wb_inst_vfls       = |(rb_ld_wb_data_ptr[RB_ENTRY-1:0]  & rb_entry_inst_vfls[RB_ENTRY-1:0]);
assign rb_ld_wb_vreg_sign      = |(rb_ld_wb_data_ptr[RB_ENTRY-1:0]  & rb_entry_vreg_sign_sel[RB_ENTRY-1:0]);

// &Force("output","rb_ld_wb_inst_vls"); @823
// &Force("output","rb_ld_wb_vreg_sign_sel"); @824
//----------wb data part grnt-----------
assign rb_entry_wb_data_grnt[RB_ENTRY-1:0] = 
                rb_ld_wb_data_ptr[RB_ENTRY-1:0]
                & {RB_ENTRY{ld_wb_rb_data_grnt  &&  !rtu_yy_xx_flush}};

//==========================================================
//            Settle data to register mode
//==========================================================
// &CombBeg; @892
// &CombEnd; @904
assign rb_ld_rot_sel[7:0]   = {8{rb_ld_wb_data_ptr[0]}} & rb_entry_rot_sel_0[7:0]
                              | {8{rb_ld_wb_data_ptr[1]}} & rb_entry_rot_sel_1[7:0]
                              | {8{rb_ld_wb_data_ptr[2]}} & rb_entry_rot_sel_2[7:0]
                              | {8{rb_ld_wb_data_ptr[3]}} & rb_entry_rot_sel_3[7:0]
                              | {8{rb_ld_wb_data_ptr[4]}} & rb_entry_rot_sel_4[7:0]
                              | {8{rb_ld_wb_data_ptr[5]}} & rb_entry_rot_sel_5[7:0]
                              | {8{rb_ld_wb_data_ptr[6]}} & rb_entry_rot_sel_6[7:0]
                              | {8{rb_ld_wb_data_ptr[7]}} & rb_entry_rot_sel_7[7:0];

// &CombBeg; @916
always @( rb_entry_data_2[63:0]
       or rb_entry_data_6[63:0]
       or rb_ld_wb_data_ptr[7:0]
       or rb_entry_data_0[63:0]
       or rb_entry_data_3[63:0]
       or rb_entry_data_4[63:0]
       or rb_entry_data_1[63:0]
       or rb_entry_data_7[63:0]
       or rb_entry_data_5[63:0])
begin
case(rb_ld_wb_data_ptr[7:0])
  8'h01:  rb_wb_data[63:0] = rb_entry_data_0[63:0];
  8'h02:  rb_wb_data[63:0] = rb_entry_data_1[63:0];
  8'h04:  rb_wb_data[63:0] = rb_entry_data_2[63:0];
  8'h08:  rb_wb_data[63:0] = rb_entry_data_3[63:0];
  8'h10:  rb_wb_data[63:0] = rb_entry_data_4[63:0];
  8'h20:  rb_wb_data[63:0] = rb_entry_data_5[63:0];
  8'h40:  rb_wb_data[63:0] = rb_entry_data_6[63:0];
  8'h80:  rb_wb_data[63:0] = rb_entry_data_7[63:0];
  default:rb_wb_data[63:0] = {64{1'bx}};
endcase
// &CombEnd; @928
end
assign rb_wb_data_unsettle[127:0] = {rb_wb_data[63:0],rb_wb_data[63:0]};

//rotate data
// &Instance("ct_lsu_rot_data", "x_lsu_rb_wb_data_rot"); @933
ct_lsu_rot_data  x_lsu_rb_wb_data_rot (
  .data_in             (rb_wb_data_unsettle),
  .data_settle_out     (rb_ld_wb_data_128  ),
  .rot_sel             (rb_ld_rot_sel      )
);

// &Connect(.rot_sel         (rb_ld_rot_sel          ), @934
//          .data_in         (rb_wb_data_unsettle    ), @935
//          .data_settle_out (rb_ld_wb_data_128      )); @936

assign rb_ld_wb_data[63:0] = rb_ld_wb_data_128[63:0];

//------------------select sign bit-------------------------
// &CombBeg; @945
always @( rb_ld_wb_inst_size[1:0]
       or rb_ld_wb_sign_extend)
begin
case({rb_ld_wb_sign_extend,rb_ld_wb_inst_size[1:0]})
  {1'b1,BYTE}:rb_ld_wb_preg_sign_sel[3:0] = 4'b0010;
  {1'b1,HALF}:rb_ld_wb_preg_sign_sel[3:0] = 4'b0100;
  {1'b1,WORD}:rb_ld_wb_preg_sign_sel[3:0] = 4'b1000;
  default:rb_ld_wb_preg_sign_sel[3:0] = 4'b0001;
endcase
// &CombEnd; @952
end

// &CombBeg; @955
// &CombEnd; @973
assign rb_ld_wb_vreg_sign_sel[1:0] = {rb_ld_wb_vreg_sign && (rb_ld_wb_inst_size[1:0] == 2'b10),
                                      rb_ld_wb_vreg_sign && (rb_ld_wb_inst_size[1:0] == 2'b01)};

//==========================================================
//                    compare index
//==========================================================
assign rb_sq_pop_hit_idx      = |rb_entry_sq_pop_hit_idx[RB_ENTRY-1:0];
assign rb_wmb_ce_hit_idx      = |rb_entry_wmb_ce_hit_idx[RB_ENTRY-1:0];
assign rb_pfu_biu_req_hit_idx = |rb_entry_pfu_biu_req_hit_idx[RB_ENTRY-1:0];
assign rb_ld_da_hit_idx       = |rb_entry_ld_da_hit_idx[RB_ENTRY-1:0];
assign rb_st_da_hit_idx       = |rb_entry_st_da_hit_idx[RB_ENTRY-1:0];

//==========================================================
//                    Compare r_id
//==========================================================
assign rb_r_nc_id_hit     = biu_lsu_r_vld
                            &&  (biu_lsu_r_id[4:0]  ==  BIU_R_NC_ID);
assign rb_r_so_id_hit     = biu_lsu_r_vld
                            &&  (biu_lsu_r_id[4:0]  ==  BIU_R_SO_ID);
// &Force("bus","biu_lsu_r_resp",3,0); @995
//ecc err(DECERR) will not carry bus err expt
assign rb_r_resp_err      = biu_lsu_r_vld
                            &&  (biu_lsu_r_resp[1:0]  ==  SLVERR);
assign rb_r_resp_okay     = biu_lsu_r_vld
                            &&  (biu_lsu_r_resp[1:0]  ==  OKAY);
assign rb_r_resp_ecc_err  = biu_lsu_r_vld
                            &&  (biu_lsu_r_resp[1:0]  ==  DECERR);
//==========================================================
//                for avoid deadlock with no rready
//==========================================================
assign rb_nc_fifo_empty     = rb_so_no_pending  && rb_nc_no_pending;
assign rb_nc_ar_req         = rb_biu_req_unmask && !rb_biu_req_page_ca; 
assign rb_pfu_nc_no_pending = rb_nc_fifo_empty  && !rb_nc_ar_req;
//==========================================================
//        interface to other module (except biu_arb)
//==========================================================
//------------------------lfb-------------------------------
assign rb_lfb_create_vld_unmask   = rb_biu_req_unmask & rb_biu_req_create_lfb;
assign rb_lfb_depd                = |(rb_biu_req_ptr[RB_ENTRY-1:0]
                                      & (rb_entry_depd[RB_ENTRY-1:0]
                                        | rb_entry_discard_vld[RB_ENTRY-1:0]));
assign rb_lfb_atomic              = rb_biu_req_atomic;
assign rb_lfb_ldamo               = rb_biu_req_ldamo;
assign rb_lfb_addr_tto4[35:0]     = rb_biu_req_addr[39:4];

//create req signal is used for artribute
// &Force("output","rb_lfb_create_req"); @1022
assign rb_lfb_create_req          = rb_lfb_create_vld_unmask;
assign rb_lfb_create_vld          = bus_arb_rb_ar_grnt  &&  rb_biu_req_create_lfb;
assign rb_lfb_create_dp_vld       = rb_lfb_create_vld_unmask;
assign rb_lfb_create_gateclk_en   = rb_lfb_create_vld_unmask;
assign rb_lfb_boundary_depd_wakeup= |(rb_entry_boundary_wakeup[RB_ENTRY-1:0]);
//------------------------mcic------------------------------
assign rb_mcic_biu_req_success    = bus_arb_rb_ar_grnt &&  rb_biu_req_mcic_req;
assign rb_mcic_ar_id[4:0]         = rb_biu_ar_id[4:0];
assign rb_mcic_not_full           = !rb_full;
assign rb_mcic_ecc_err            = rb_r_resp_ecc_err;
//------------------------lm--------------------------------
assign rb_lm_wait_resp_dp_vld     = rb_biu_req_unmask &&  rb_biu_req_atomic;
assign rb_lm_wait_resp_vld        = bus_arb_rb_ar_grnt &&  rb_biu_req_atomic;
assign rb_lm_ar_id[4:0]           = rb_biu_ar_id[4:0];
assign rb_lm_atomic_next_resp     = |rb_entry_atomic_next_resp[RB_ENTRY-1:0];
//------------------------idu-------------------------------
assign lsu_idu_rb_not_full        = !rb_empty_less2;
//------------------------rtu-------------------------------
assign lsu_rtu_all_commit_ld_data_vld = &rb_entry_cmit_data_vld[RB_ENTRY-1:0];
//------------------------had-------------------------------
assign lsu_had_rb_entry_state_0[3:0]  = rb_entry_state_0[3:0];
assign lsu_had_rb_entry_state_1[3:0]  = rb_entry_state_1[3:0];
assign lsu_had_rb_entry_state_2[3:0]  = rb_entry_state_2[3:0];
assign lsu_had_rb_entry_state_3[3:0]  = rb_entry_state_3[3:0];
assign lsu_had_rb_entry_state_4[3:0]  = rb_entry_state_4[3:0];
assign lsu_had_rb_entry_state_5[3:0]  = rb_entry_state_5[3:0];
assign lsu_had_rb_entry_state_6[3:0]  = rb_entry_state_6[3:0];
assign lsu_had_rb_entry_state_7[3:0]  = rb_entry_state_7[3:0];
assign lsu_had_rb_entry_fence[RB_ENTRY-1:0] = rb_entry_fence[RB_ENTRY-1:0];

// &ModuleEnd; @1053
endmodule


