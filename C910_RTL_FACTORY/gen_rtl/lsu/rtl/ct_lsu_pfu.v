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

// &ModuleBeg; @28
module ct_lsu_pfu(
  amr_wa_cancel,
  bus_arb_pfu_ar_grnt,
  bus_arb_pfu_ar_ready,
  cp0_lsu_dcache_en,
  cp0_lsu_dcache_pref_en,
  cp0_lsu_icg_en,
  cp0_lsu_l2_pref_en,
  cp0_lsu_l2_st_pref_en,
  cp0_lsu_no_op_req,
  cp0_lsu_pfu_mmu_dis,
  cp0_lsu_timeout_cnt,
  cp0_yy_clk_en,
  cp0_yy_dcache_pref_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  icc_idle,
  ld_da_iid,
  ld_da_ldfifo_pc,
  ld_da_page_sec_ff,
  ld_da_page_share_ff,
  ld_da_pfu_act_dp_vld,
  ld_da_pfu_act_vld,
  ld_da_pfu_biu_req_hit_idx,
  ld_da_pfu_evict_cnt_vld,
  ld_da_pfu_pf_inst_vld,
  ld_da_pfu_va,
  ld_da_ppfu_va,
  ld_da_ppn_ff,
  lfb_addr_full,
  lfb_addr_less2,
  lfb_pfu_biu_req_hit_idx,
  lfb_pfu_create_id,
  lfb_pfu_dcache_hit,
  lfb_pfu_dcache_miss,
  lfb_pfu_rready_grnt,
  lm_pfu_biu_req_hit_idx,
  lsu_mmu_va2,
  lsu_mmu_va2_vld,
  lsu_pfu_l1_dist_sel,
  lsu_pfu_l2_dist_sel,
  lsu_special_clk,
  mmu_lsu_pa2,
  mmu_lsu_pa2_err,
  mmu_lsu_pa2_vld,
  mmu_lsu_sec2,
  mmu_lsu_share2,
  pad_yy_icg_scan_en,
  pfu_biu_ar_addr,
  pfu_biu_ar_bar,
  pfu_biu_ar_burst,
  pfu_biu_ar_cache,
  pfu_biu_ar_domain,
  pfu_biu_ar_dp_req,
  pfu_biu_ar_id,
  pfu_biu_ar_len,
  pfu_biu_ar_lock,
  pfu_biu_ar_prot,
  pfu_biu_ar_req,
  pfu_biu_ar_req_gateclk_en,
  pfu_biu_ar_size,
  pfu_biu_ar_snoop,
  pfu_biu_ar_user,
  pfu_biu_req_addr,
  pfu_icc_ready,
  pfu_lfb_create_dp_vld,
  pfu_lfb_create_gateclk_en,
  pfu_lfb_create_req,
  pfu_lfb_create_vld,
  pfu_lfb_id,
  pfu_part_empty,
  pfu_pfb_empty,
  pfu_sdb_create_gateclk_en,
  pfu_sdb_empty,
  rb_pfu_biu_req_hit_idx,
  rb_pfu_nc_no_pending,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_flush,
  sq_pfu_pop_synci_inst,
  st_da_iid,
  st_da_page_sec_ff,
  st_da_page_share_ff,
  st_da_pc,
  st_da_pfu_act_dp_vld,
  st_da_pfu_act_vld,
  st_da_pfu_biu_req_hit_idx,
  st_da_pfu_evict_cnt_vld,
  st_da_pfu_pf_inst_vld,
  st_da_ppfu_va,
  st_da_ppn_ff,
  vb_pfu_biu_req_hit_idx,
  wmb_pfu_biu_req_hit_idx
);

// &Ports; @29
input           amr_wa_cancel;                     
input           bus_arb_pfu_ar_grnt;               
input           bus_arb_pfu_ar_ready;              
input           cp0_lsu_dcache_en;                 
input           cp0_lsu_dcache_pref_en;            
input           cp0_lsu_icg_en;                    
input           cp0_lsu_l2_pref_en;                
input           cp0_lsu_l2_st_pref_en;             
input           cp0_lsu_no_op_req;                 
input           cp0_lsu_pfu_mmu_dis;               
input   [29:0]  cp0_lsu_timeout_cnt;               
input           cp0_yy_clk_en;                     
input           cp0_yy_dcache_pref_en;             
input   [1 :0]  cp0_yy_priv_mode;                  
input           cpurst_b;                          
input           forever_cpuclk;                    
input           icc_idle;                          
input   [6 :0]  ld_da_iid;                         
input   [14:0]  ld_da_ldfifo_pc;                   
input           ld_da_page_sec_ff;                 
input           ld_da_page_share_ff;               
input           ld_da_pfu_act_dp_vld;              
input           ld_da_pfu_act_vld;                 
input           ld_da_pfu_biu_req_hit_idx;         
input           ld_da_pfu_evict_cnt_vld;           
input           ld_da_pfu_pf_inst_vld;             
input   [39:0]  ld_da_pfu_va;                      
input   [39:0]  ld_da_ppfu_va;                     
input   [27:0]  ld_da_ppn_ff;                      
input           lfb_addr_full;                     
input           lfb_addr_less2;                    
input           lfb_pfu_biu_req_hit_idx;           
input   [4 :0]  lfb_pfu_create_id;                 
input   [8 :0]  lfb_pfu_dcache_hit;                
input   [8 :0]  lfb_pfu_dcache_miss;               
input           lfb_pfu_rready_grnt;               
input           lm_pfu_biu_req_hit_idx;            
input   [3 :0]  lsu_pfu_l1_dist_sel;               
input   [3 :0]  lsu_pfu_l2_dist_sel;               
input           lsu_special_clk;                   
input   [27:0]  mmu_lsu_pa2;                       
input           mmu_lsu_pa2_err;                   
input           mmu_lsu_pa2_vld;                   
input           mmu_lsu_sec2;                      
input           mmu_lsu_share2;                    
input           pad_yy_icg_scan_en;                
input           rb_pfu_biu_req_hit_idx;            
input           rb_pfu_nc_no_pending;              
input           rtu_yy_xx_commit0;                 
input   [6 :0]  rtu_yy_xx_commit0_iid;             
input           rtu_yy_xx_commit1;                 
input   [6 :0]  rtu_yy_xx_commit1_iid;             
input           rtu_yy_xx_commit2;                 
input   [6 :0]  rtu_yy_xx_commit2_iid;             
input           rtu_yy_xx_flush;                   
input           sq_pfu_pop_synci_inst;             
input   [6 :0]  st_da_iid;                         
input           st_da_page_sec_ff;                 
input           st_da_page_share_ff;               
input   [14:0]  st_da_pc;                          
input           st_da_pfu_act_dp_vld;              
input           st_da_pfu_act_vld;                 
input           st_da_pfu_biu_req_hit_idx;         
input           st_da_pfu_evict_cnt_vld;           
input           st_da_pfu_pf_inst_vld;             
input   [39:0]  st_da_ppfu_va;                     
input   [27:0]  st_da_ppn_ff;                      
input           vb_pfu_biu_req_hit_idx;            
input           wmb_pfu_biu_req_hit_idx;           
output  [27:0]  lsu_mmu_va2;                       
output          lsu_mmu_va2_vld;                   
output  [39:0]  pfu_biu_ar_addr;                   
output  [1 :0]  pfu_biu_ar_bar;                    
output  [1 :0]  pfu_biu_ar_burst;                  
output  [3 :0]  pfu_biu_ar_cache;                  
output  [1 :0]  pfu_biu_ar_domain;                 
output          pfu_biu_ar_dp_req;                 
output  [4 :0]  pfu_biu_ar_id;                     
output  [1 :0]  pfu_biu_ar_len;                    
output          pfu_biu_ar_lock;                   
output  [2 :0]  pfu_biu_ar_prot;                   
output          pfu_biu_ar_req;                    
output          pfu_biu_ar_req_gateclk_en;         
output  [2 :0]  pfu_biu_ar_size;                   
output  [3 :0]  pfu_biu_ar_snoop;                  
output  [2 :0]  pfu_biu_ar_user;                   
output  [39:0]  pfu_biu_req_addr;                  
output          pfu_icc_ready;                     
output          pfu_lfb_create_dp_vld;             
output          pfu_lfb_create_gateclk_en;         
output          pfu_lfb_create_req;                
output          pfu_lfb_create_vld;                
output  [3 :0]  pfu_lfb_id;                        
output          pfu_part_empty;                    
output          pfu_pfb_empty;                     
output          pfu_sdb_create_gateclk_en;         
output          pfu_sdb_empty;                     

// &Regs; @30
reg     [8 :0]  pfu_biu_pe_req_ptr_priority_0;     
reg     [8 :0]  pfu_biu_pe_req_ptr_priority_1;     
reg     [33:0]  pfu_biu_req_addr_tto6;             
reg             pfu_biu_req_l1;                    
reg             pfu_biu_req_page_sec;              
reg             pfu_biu_req_page_share;            
reg     [8 :0]  pfu_biu_req_priority;              
reg     [1 :0]  pfu_biu_req_priv_mode;             
reg     [8 :0]  pfu_biu_req_ptr;                   
reg             pfu_biu_req_unmask;                
reg     [8 :0]  pfu_mmu_pe_req_ptr;                
reg             pfu_mmu_req;                       
reg             pfu_mmu_req_l1;                    
reg     [8 :0]  pfu_mmu_req_ptr;                   
reg     [27:0]  pfu_mmu_req_vpn;                   
reg     [7 :0]  pfu_pfb_empty_create_ptr;          
reg     [7 :0]  pfu_pfb_evict_create_ptr;          
reg     [7 :0]  pfu_pmb_empty_create_ptr;          
reg     [7 :0]  pfu_pmb_evict_create_ptr;          
reg     [7 :0]  pfu_pmb_pop_ptr;                   
reg     [1 :0]  pfu_sdb_empty_create_ptr;          
reg     [1 :0]  pfu_sdb_evict_create_ptr;          
reg     [1 :0]  pfu_sdb_pop_ptr;                   

// &Wires; @31
wire            amr_wa_cancel;                     
wire            bus_arb_pfu_ar_grnt;               
wire            bus_arb_pfu_ar_ready;              
wire            cp0_lsu_dcache_en;                 
wire            cp0_lsu_dcache_pref_en;            
wire            cp0_lsu_icg_en;                    
wire            cp0_lsu_l2_pref_en;                
wire            cp0_lsu_l2_st_pref_en;             
wire            cp0_lsu_no_op_req;                 
wire            cp0_lsu_pfu_mmu_dis;               
wire    [29:0]  cp0_lsu_timeout_cnt;               
wire            cp0_yy_clk_en;                     
wire            cp0_yy_dcache_pref_en;             
wire    [1 :0]  cp0_yy_priv_mode;                  
wire            cpurst_b;                          
wire            forever_cpuclk;                    
wire            icc_idle;                          
wire    [6 :0]  ld_da_iid;                         
wire    [14:0]  ld_da_ldfifo_pc;                   
wire            ld_da_page_sec_ff;                 
wire            ld_da_page_share_ff;               
wire            ld_da_pfu_act_dp_vld;              
wire            ld_da_pfu_act_vld;                 
wire            ld_da_pfu_biu_req_hit_idx;         
wire            ld_da_pfu_evict_cnt_vld;           
wire            ld_da_pfu_pf_inst_vld;             
wire    [39:0]  ld_da_pfu_va;                      
wire    [39:0]  ld_da_ppfu_va;                     
wire    [27:0]  ld_da_ppn_ff;                      
wire            lfb_addr_full;                     
wire            lfb_addr_less2;                    
wire            lfb_pfu_biu_req_hit_idx;           
wire    [4 :0]  lfb_pfu_create_id;                 
wire    [8 :0]  lfb_pfu_dcache_hit;                
wire    [8 :0]  lfb_pfu_dcache_miss;               
wire            lfb_pfu_rready_grnt;               
wire            lm_pfu_biu_req_hit_idx;            
wire    [27:0]  lsu_mmu_va2;                       
wire            lsu_mmu_va2_vld;                   
wire    [3 :0]  lsu_pfu_l1_dist_sel;               
wire    [3 :0]  lsu_pfu_l2_dist_sel;               
wire            lsu_special_clk;                   
wire    [27:0]  mmu_lsu_pa2;                       
wire            mmu_lsu_pa2_err;                   
wire            mmu_lsu_pa2_vld;                   
wire            mmu_lsu_sec2;                      
wire            mmu_lsu_share2;                    
wire            pad_yy_icg_scan_en;                
wire    [5 :0]  pfb_no_req_cnt_val;                
wire    [7 :0]  pfb_timeout_cnt_val;               
wire    [8 :0]  pfu_all_pfb_biu_pe_req;            
wire    [8 :0]  pfu_all_pfb_biu_pe_req_ptiority_0; 
wire    [8 :0]  pfu_all_pfb_biu_pe_req_ptiority_1; 
wire    [8 :0]  pfu_all_pfb_mmu_pe_req;            
wire    [39:0]  pfu_biu_ar_addr;                   
wire    [1 :0]  pfu_biu_ar_bar;                    
wire    [1 :0]  pfu_biu_ar_burst;                  
wire    [3 :0]  pfu_biu_ar_cache;                  
wire    [1 :0]  pfu_biu_ar_domain;                 
wire            pfu_biu_ar_dp_req;                 
wire    [4 :0]  pfu_biu_ar_id;                     
wire    [1 :0]  pfu_biu_ar_len;                    
wire            pfu_biu_ar_lock;                   
wire    [2 :0]  pfu_biu_ar_prot;                   
wire            pfu_biu_ar_req;                    
wire            pfu_biu_ar_req_gateclk_en;         
wire    [2 :0]  pfu_biu_ar_size;                   
wire    [3 :0]  pfu_biu_ar_snoop;                  
wire    [2 :0]  pfu_biu_ar_user;                   
wire    [33:0]  pfu_biu_l1_pe_req_addr_tto6;       
wire            pfu_biu_l1_pe_req_page_sec;        
wire            pfu_biu_l1_pe_req_page_share;      
wire    [33:0]  pfu_biu_l2_pe_req_addr_tto6;       
wire            pfu_biu_l2_pe_req_page_sec;        
wire            pfu_biu_l2_pe_req_page_share;      
wire            pfu_biu_pe_clk;                    
wire            pfu_biu_pe_clk_en;                 
wire            pfu_biu_pe_req;                    
wire    [33:0]  pfu_biu_pe_req_addr_tto6;          
wire            pfu_biu_pe_req_grnt;               
wire            pfu_biu_pe_req_page_sec;           
wire            pfu_biu_pe_req_page_share;         
wire    [1 :0]  pfu_biu_pe_req_priv_mode;          
wire            pfu_biu_pe_req_ptiority_0;         
wire    [8 :0]  pfu_biu_pe_req_ptr;                
wire            pfu_biu_pe_req_sel_l1;             
wire    [1 :0]  pfu_biu_pe_req_src;                
wire            pfu_biu_pe_update_permit;          
wire            pfu_biu_pe_update_vld;             
wire    [39:0]  pfu_biu_req_addr;                  
wire            pfu_biu_req_bus_grnt;              
wire            pfu_biu_req_grnt;                  
wire            pfu_biu_req_hit_idx;               
wire    [8 :0]  pfu_biu_req_priority_next;         
wire            pfu_dcache_pref_en;                
wire            pfu_get_page_sec;                  
wire            pfu_get_page_share;                
wire    [27:0]  pfu_get_ppn;                       
wire            pfu_get_ppn_err;                   
wire            pfu_get_ppn_vld;                   
wire            pfu_gpfb_biu_pe_req;               
wire            pfu_gpfb_biu_pe_req_grnt;          
wire    [1 :0]  pfu_gpfb_biu_pe_req_src;           
wire            pfu_gpfb_from_lfb_dcache_hit;      
wire            pfu_gpfb_from_lfb_dcache_miss;     
wire            pfu_gpfb_l1_page_sec;              
wire            pfu_gpfb_l1_page_share;            
wire    [39:0]  pfu_gpfb_l1_pf_addr;               
wire    [27:0]  pfu_gpfb_l1_vpn;                   
wire            pfu_gpfb_l2_page_sec;              
wire            pfu_gpfb_l2_page_share;            
wire    [39:0]  pfu_gpfb_l2_pf_addr;               
wire    [27:0]  pfu_gpfb_l2_vpn;                   
wire            pfu_gpfb_mmu_pe_req;               
wire            pfu_gpfb_mmu_pe_req_grnt;          
wire    [1 :0]  pfu_gpfb_mmu_pe_req_src;           
wire    [1 :0]  pfu_gpfb_priv_mode;                
wire            pfu_gpfb_vld;                      
wire            pfu_gsdb_gpfb_create_vld;          
wire            pfu_gsdb_gpfb_pop_req;             
wire    [10:0]  pfu_gsdb_stride;                   
wire            pfu_gsdb_stride_neg;               
wire    [6 :0]  pfu_gsdb_strideh_6to0;             
wire            pfu_hit_pc;                        
wire            pfu_icc_ready;                     
wire            pfu_l2_pref_en;                    
wire            pfu_lfb_create_dp_vld;             
wire            pfu_lfb_create_gateclk_en;         
wire            pfu_lfb_create_req;                
wire            pfu_lfb_create_vld;                
wire    [3 :0]  pfu_lfb_id;                        
wire    [27:0]  pfu_mmu_l1_pe_req_vpn;             
wire    [27:0]  pfu_mmu_l2_pe_req_vpn;             
wire            pfu_mmu_pe_clk;                    
wire            pfu_mmu_pe_clk_en;                 
wire            pfu_mmu_pe_req;                    
wire            pfu_mmu_pe_req_sel_l1;             
wire    [1 :0]  pfu_mmu_pe_req_src;                
wire    [27:0]  pfu_mmu_pe_req_vpn;                
wire            pfu_mmu_pe_update_permit;          
wire            pfu_part_empty;                    
wire            pfu_pfb_create_dp_vld;             
wire            pfu_pfb_create_gateclk_en;         
wire    [14:0]  pfu_pfb_create_pc;                 
wire    [7 :0]  pfu_pfb_create_ptr;                
wire    [10:0]  pfu_pfb_create_stride;             
wire            pfu_pfb_create_stride_neg;         
wire    [6 :0]  pfu_pfb_create_strideh_6to0;       
wire            pfu_pfb_create_type_ld;            
wire            pfu_pfb_create_vld;                
wire            pfu_pfb_empty;                     
wire    [7 :0]  pfu_pfb_entry_biu_pe_req;          
wire    [7 :0]  pfu_pfb_entry_biu_pe_req_grnt;     
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_0;    
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_1;    
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_2;    
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_3;    
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_4;    
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_5;    
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_6;    
wire    [1 :0]  pfu_pfb_entry_biu_pe_req_src_7;    
wire    [7 :0]  pfu_pfb_entry_create_dp_vld;       
wire    [7 :0]  pfu_pfb_entry_create_gateclk_en;   
wire    [7 :0]  pfu_pfb_entry_create_vld;          
wire    [7 :0]  pfu_pfb_entry_evict;               
wire    [7 :0]  pfu_pfb_entry_from_lfb_dcache_hit; 
wire    [7 :0]  pfu_pfb_entry_from_lfb_dcache_miss; 
wire    [7 :0]  pfu_pfb_entry_hit_pc;              
wire    [7 :0]  pfu_pfb_entry_l1_page_sec;         
wire    [7 :0]  pfu_pfb_entry_l1_page_share;       
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_0;        
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_1;        
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_2;        
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_3;        
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_4;        
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_5;        
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_6;        
wire    [39:0]  pfu_pfb_entry_l1_pf_addr_7;        
wire    [27:0]  pfu_pfb_entry_l1_vpn_0;            
wire    [27:0]  pfu_pfb_entry_l1_vpn_1;            
wire    [27:0]  pfu_pfb_entry_l1_vpn_2;            
wire    [27:0]  pfu_pfb_entry_l1_vpn_3;            
wire    [27:0]  pfu_pfb_entry_l1_vpn_4;            
wire    [27:0]  pfu_pfb_entry_l1_vpn_5;            
wire    [27:0]  pfu_pfb_entry_l1_vpn_6;            
wire    [27:0]  pfu_pfb_entry_l1_vpn_7;            
wire    [7 :0]  pfu_pfb_entry_l2_page_sec;         
wire    [7 :0]  pfu_pfb_entry_l2_page_share;       
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_0;        
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_1;        
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_2;        
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_3;        
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_4;        
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_5;        
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_6;        
wire    [39:0]  pfu_pfb_entry_l2_pf_addr_7;        
wire    [27:0]  pfu_pfb_entry_l2_vpn_0;            
wire    [27:0]  pfu_pfb_entry_l2_vpn_1;            
wire    [27:0]  pfu_pfb_entry_l2_vpn_2;            
wire    [27:0]  pfu_pfb_entry_l2_vpn_3;            
wire    [27:0]  pfu_pfb_entry_l2_vpn_4;            
wire    [27:0]  pfu_pfb_entry_l2_vpn_5;            
wire    [27:0]  pfu_pfb_entry_l2_vpn_6;            
wire    [27:0]  pfu_pfb_entry_l2_vpn_7;            
wire    [7 :0]  pfu_pfb_entry_mmu_pe_req;          
wire    [7 :0]  pfu_pfb_entry_mmu_pe_req_grnt;     
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_0;    
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_1;    
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_2;    
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_3;    
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_4;    
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_5;    
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_6;    
wire    [1 :0]  pfu_pfb_entry_mmu_pe_req_src_7;    
wire    [1 :0]  pfu_pfb_entry_priv_mode_0;         
wire    [1 :0]  pfu_pfb_entry_priv_mode_1;         
wire    [1 :0]  pfu_pfb_entry_priv_mode_2;         
wire    [1 :0]  pfu_pfb_entry_priv_mode_3;         
wire    [1 :0]  pfu_pfb_entry_priv_mode_4;         
wire    [1 :0]  pfu_pfb_entry_priv_mode_5;         
wire    [1 :0]  pfu_pfb_entry_priv_mode_6;         
wire    [1 :0]  pfu_pfb_entry_priv_mode_7;         
wire    [7 :0]  pfu_pfb_entry_vld;                 
wire            pfu_pfb_full;                      
wire            pfu_pfb_has_evict;                 
wire            pfu_pfb_hit_pc;                    
wire            pfu_pmb_create_dp_vld;             
wire            pfu_pmb_create_gateclk_en;         
wire    [7 :0]  pfu_pmb_create_ptr;                
wire            pfu_pmb_create_vld;                
wire            pfu_pmb_empty;                     
wire    [7 :0]  pfu_pmb_entry_create_dp_vld;       
wire    [7 :0]  pfu_pmb_entry_create_gateclk_en;   
wire    [7 :0]  pfu_pmb_entry_create_vld;          
wire    [7 :0]  pfu_pmb_entry_evict;               
wire    [7 :0]  pfu_pmb_entry_hit_pc;              
wire    [14:0]  pfu_pmb_entry_pc_0;                
wire    [14:0]  pfu_pmb_entry_pc_1;                
wire    [14:0]  pfu_pmb_entry_pc_2;                
wire    [14:0]  pfu_pmb_entry_pc_3;                
wire    [14:0]  pfu_pmb_entry_pc_4;                
wire    [14:0]  pfu_pmb_entry_pc_5;                
wire    [14:0]  pfu_pmb_entry_pc_6;                
wire    [14:0]  pfu_pmb_entry_pc_7;                
wire    [7 :0]  pfu_pmb_entry_ready;               
wire    [7 :0]  pfu_pmb_entry_ready_grnt;          
wire    [7 :0]  pfu_pmb_entry_type_ld;             
wire    [7 :0]  pfu_pmb_entry_vld;                 
wire            pfu_pmb_full;                      
wire            pfu_pmb_hit_pc;                    
wire            pfu_pmb_ready_grnt;                
wire            pfu_pop_all_part_vld;              
wire            pfu_pop_all_vld;                   
wire            pfu_sdb_create_dp_vld;             
wire            pfu_sdb_create_gateclk_en;         
wire    [14:0]  pfu_sdb_create_pc;                 
wire    [1 :0]  pfu_sdb_create_ptr;                
wire            pfu_sdb_create_type_ld;            
wire            pfu_sdb_create_vld;                
wire            pfu_sdb_empty;                     
wire    [1 :0]  pfu_sdb_entry_create_dp_vld;       
wire    [1 :0]  pfu_sdb_entry_create_gateclk_en;   
wire    [1 :0]  pfu_sdb_entry_create_vld;          
wire    [1 :0]  pfu_sdb_entry_evict;               
wire    [1 :0]  pfu_sdb_entry_hit_pc;              
wire    [14:0]  pfu_sdb_entry_pc_0;                
wire    [14:0]  pfu_sdb_entry_pc_1;                
wire    [1 :0]  pfu_sdb_entry_ready;               
wire    [1 :0]  pfu_sdb_entry_ready_grnt;          
wire    [10:0]  pfu_sdb_entry_stride_0;            
wire    [10:0]  pfu_sdb_entry_stride_1;            
wire    [1 :0]  pfu_sdb_entry_stride_neg;          
wire    [6 :0]  pfu_sdb_entry_strideh_6to0_0;      
wire    [6 :0]  pfu_sdb_entry_strideh_6to0_1;      
wire    [1 :0]  pfu_sdb_entry_type_ld;             
wire    [1 :0]  pfu_sdb_entry_vld;                 
wire            pfu_sdb_full;                      
wire            pfu_sdb_has_evict;                 
wire            pfu_sdb_hit_pc;                    
wire            pfu_sdb_ready_grnt;                
wire            pipe_create_dp_vld;                
wire    [14:0]  pipe_create_pc;                    
wire            pipe_create_vld;                   
wire    [7 :0]  pmb_timeout_cnt_val;               
wire            rb_pfu_biu_req_hit_idx;            
wire            rb_pfu_nc_no_pending;              
wire            rtu_yy_xx_commit0;                 
wire    [6 :0]  rtu_yy_xx_commit0_iid;             
wire            rtu_yy_xx_commit1;                 
wire    [6 :0]  rtu_yy_xx_commit1_iid;             
wire            rtu_yy_xx_commit2;                 
wire    [6 :0]  rtu_yy_xx_commit2_iid;             
wire            rtu_yy_xx_flush;                   
wire    [7 :0]  sdb_timeout_cnt_val;               
wire            sq_pfu_pop_synci_inst;             
wire    [6 :0]  st_da_iid;                         
wire            st_da_page_sec_ff;                 
wire            st_da_page_share_ff;               
wire    [14:0]  st_da_pc;                          
wire            st_da_pfu_act_dp_vld;              
wire            st_da_pfu_act_vld;                 
wire            st_da_pfu_biu_req_hit_idx;         
wire            st_da_pfu_evict_cnt_vld;           
wire            st_da_pfu_pf_inst_vld;             
wire    [39:0]  st_da_ppfu_va;                     
wire    [27:0]  st_da_ppn_ff;                      
wire            vb_pfu_biu_req_hit_idx;            
wire            wmb_pfu_biu_req_hit_idx;           


parameter PMB_ENTRY = 8,
          SDB_ENTRY = 2,
          PFB_ENTRY = 8;
parameter PC_LEN    = 15;
parameter BIU_R_L2PREF_ID = 5'd25;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//--------------------mmu req pop entry---------------------
assign pfu_mmu_pe_clk_en  = pfu_get_ppn_vld
                            || pfu_mmu_pe_req;
// &Instance("gated_clk_cell", "x_lsu_pfu_mmu_pe_gated_clk"); @45
gated_clk_cell  x_lsu_pfu_mmu_pe_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pfu_mmu_pe_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pfu_mmu_pe_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @46
//          .external_en   (1'b0               ), @47
//          .global_en     (cp0_yy_clk_en      ), @48
//          .module_en     (cp0_lsu_icg_en     ), @49
//          .local_en      (pfu_mmu_pe_clk_en ), @50
//          .clk_out       (pfu_mmu_pe_clk    )); @51

//--------------------biu req pop entry---------------------
assign pfu_biu_pe_clk_en  = pfu_biu_pe_req
                            ||  pfu_biu_req_unmask;

// &Instance("gated_clk_cell", "x_lsu_pfu_biu_pe_gated_clk"); @57
gated_clk_cell  x_lsu_pfu_biu_pe_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (pfu_biu_pe_clk    ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (pfu_biu_pe_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @58
//          .external_en   (1'b0               ), @59
//          .global_en     (cp0_yy_clk_en      ), @60
//          .module_en     (cp0_lsu_icg_en     ), @61
//          .local_en      (pfu_biu_pe_clk_en ), @62
//          .clk_out       (pfu_biu_pe_clk    )); @63

//==========================================================
//                 Instance pmb entry
//==========================================================

// &ConnRule(s/_x$/[0]/); @69
// &ConnRule(s/_v$/_0/); @70
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_0"); @71
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_0 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[0]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[0]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[0]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[0]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[0]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_0                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[0]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[0]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[0]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[0]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


// &ConnRule(s/_x$/[1]/); @73
// &ConnRule(s/_v$/_1/); @74
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_1"); @75
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_1 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[1]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[1]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[1]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[1]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[1]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_1                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[1]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[1]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[1]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[1]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


// &ConnRule(s/_x$/[2]/); @77
// &ConnRule(s/_v$/_2/); @78
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_2"); @79
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_2 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[2]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[2]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[2]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[2]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[2]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_2                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[2]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[2]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[2]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[2]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


// &ConnRule(s/_x$/[3]/); @81
// &ConnRule(s/_v$/_3/); @82
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_3"); @83
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_3 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[3]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[3]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[3]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[3]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[3]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_3                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[3]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[3]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[3]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[3]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


// &ConnRule(s/_x$/[4]/); @85
// &ConnRule(s/_v$/_4/); @86
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_4"); @87
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_4 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[4]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[4]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[4]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[4]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[4]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_4                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[4]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[4]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[4]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[4]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


// &ConnRule(s/_x$/[5]/); @89
// &ConnRule(s/_v$/_5/); @90
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_5"); @91
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_5 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[5]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[5]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[5]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[5]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[5]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_5                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[5]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[5]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[5]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[5]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


// &ConnRule(s/_x$/[6]/); @93
// &ConnRule(s/_v$/_6/); @94
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_6"); @95
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_6 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[6]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[6]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[6]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[6]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[6]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_6                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[6]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[6]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[6]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[6]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


// &ConnRule(s/_x$/[7]/); @97
// &ConnRule(s/_v$/_7/); @98
// &Instance("ct_lsu_pfu_pmb_entry","x_ct_lsu_pfu_pmb_entry_7"); @99
ct_lsu_pfu_pmb_entry  x_ct_lsu_pfu_pmb_entry_7 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pmb_entry_create_dp_vld_x      (pfu_pmb_entry_create_dp_vld[7]    ),
  .pfu_pmb_entry_create_gateclk_en_x  (pfu_pmb_entry_create_gateclk_en[7]),
  .pfu_pmb_entry_create_vld_x         (pfu_pmb_entry_create_vld[7]       ),
  .pfu_pmb_entry_evict_x              (pfu_pmb_entry_evict[7]            ),
  .pfu_pmb_entry_hit_pc_x             (pfu_pmb_entry_hit_pc[7]           ),
  .pfu_pmb_entry_pc_v                 (pfu_pmb_entry_pc_7                ),
  .pfu_pmb_entry_ready_grnt_x         (pfu_pmb_entry_ready_grnt[7]       ),
  .pfu_pmb_entry_ready_x              (pfu_pmb_entry_ready[7]            ),
  .pfu_pmb_entry_type_ld_x            (pfu_pmb_entry_type_ld[7]          ),
  .pfu_pmb_entry_vld_x                (pfu_pmb_entry_vld[7]              ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pipe_create_pc                     (pipe_create_pc                    ),
  .pmb_timeout_cnt_val                (pmb_timeout_cnt_val               ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             )
);


//==========================================================
//            Generate full/create signal of pmb
//==========================================================
//---------------------create pointer-----------------------
//if it has empty entry, then create signal to empty entry,
//else create siganl to evict entry,
//else create fail
// &CombBeg; @108
always @( pfu_pmb_entry_vld[7:0])
begin
pfu_pmb_empty_create_ptr[PMB_ENTRY-1:0]   = {PMB_ENTRY{1'b0}};
casez(pfu_pmb_entry_vld[PMB_ENTRY-1:0])
  8'b????_???0:pfu_pmb_empty_create_ptr[0]  = 1'b1;
  8'b????_??01:pfu_pmb_empty_create_ptr[1]  = 1'b1;
  8'b????_?011:pfu_pmb_empty_create_ptr[2]  = 1'b1;
  8'b????_0111:pfu_pmb_empty_create_ptr[3]  = 1'b1;
  8'b???0_1111:pfu_pmb_empty_create_ptr[4]  = 1'b1;
  8'b??01_1111:pfu_pmb_empty_create_ptr[5]  = 1'b1;
  8'b?011_1111:pfu_pmb_empty_create_ptr[6]  = 1'b1;
  8'b0111_1111:pfu_pmb_empty_create_ptr[7]  = 1'b1;
  default:pfu_pmb_empty_create_ptr[PMB_ENTRY-1:0]   = {PMB_ENTRY{1'b0}};
endcase
// &CombEnd; @121
end

// &CombBeg; @123
always @( pfu_pmb_entry_evict[7:0])
begin
pfu_pmb_evict_create_ptr[PMB_ENTRY-1:0]  = {PMB_ENTRY{1'b0}};
casez(pfu_pmb_entry_evict[PMB_ENTRY-1:0])
  8'b????_???1:pfu_pmb_evict_create_ptr[0]  = 1'b1;
  8'b????_??10:pfu_pmb_evict_create_ptr[1]  = 1'b1;
  8'b????_?100:pfu_pmb_evict_create_ptr[2]  = 1'b1;
  8'b????_1000:pfu_pmb_evict_create_ptr[3]  = 1'b1;
  8'b???1_0000:pfu_pmb_evict_create_ptr[4]  = 1'b1;
  8'b??10_0000:pfu_pmb_evict_create_ptr[5]  = 1'b1;
  8'b?100_0000:pfu_pmb_evict_create_ptr[6]  = 1'b1;
  8'b1000_0000:pfu_pmb_evict_create_ptr[7]  = 1'b1;
  default:pfu_pmb_evict_create_ptr[PMB_ENTRY-1:0]  = {PMB_ENTRY{1'b0}};
endcase
// &CombEnd; @136
end

assign pfu_pmb_full = &pfu_pmb_entry_vld[PMB_ENTRY-1:0];
assign pfu_pmb_create_ptr[PMB_ENTRY-1:0]  = pfu_pmb_full
                                            ? pfu_pmb_evict_create_ptr[PMB_ENTRY-1:0]
                                            : pfu_pmb_empty_create_ptr[PMB_ENTRY-1:0];
//==========================================================
//            pipe info create select
//==========================================================
//when ld and st create pmu simultaneously,ld has higher priority
assign pipe_create_pc[PC_LEN-1:0] = ld_da_pfu_act_dp_vld
                                    ? ld_da_ldfifo_pc[PC_LEN-1:0]
                                    : st_da_pc[PC_LEN-1:0];

assign pipe_create_vld    = ld_da_pfu_act_vld || st_da_pfu_act_vld && !ld_da_pfu_act_dp_vld;
 
assign pipe_create_dp_vld = ld_da_pfu_act_dp_vld || st_da_pfu_act_dp_vld;

//------------------------hit pc----------------------------
assign pfu_pmb_hit_pc     = |pfu_pmb_entry_hit_pc[PMB_ENTRY-1:0];
assign pfu_sdb_hit_pc     = |pfu_sdb_entry_hit_pc[SDB_ENTRY-1:0];
assign pfu_pfb_hit_pc     = |pfu_pfb_entry_hit_pc[PFB_ENTRY-1:0];
assign pfu_hit_pc         = pfu_pmb_hit_pc
                            ||  pfu_sdb_hit_pc
                            ||  pfu_pfb_hit_pc;
//-------------------create signal--------------------------
assign pfu_pmb_create_vld         = pipe_create_vld
                                    &&  !pfu_hit_pc
                                    &&  !pfu_gpfb_vld;
assign pfu_pmb_create_dp_vld      = pipe_create_dp_vld
                                    &&  !pfu_hit_pc
                                    &&  !pfu_gpfb_vld;
assign pfu_pmb_create_gateclk_en  = pipe_create_dp_vld
                                    &&  !pfu_gpfb_vld;

assign pfu_pmb_entry_create_vld[PMB_ENTRY-1:0]          = {PMB_ENTRY{pfu_pmb_create_vld}}
                                                          & pfu_pmb_create_ptr[PMB_ENTRY-1:0];
assign pfu_pmb_entry_create_dp_vld[PMB_ENTRY-1:0]       = {PMB_ENTRY{pfu_pmb_create_dp_vld}}
                                                          & pfu_pmb_create_ptr[PMB_ENTRY-1:0];
assign pfu_pmb_entry_create_gateclk_en[PMB_ENTRY-1:0]   = {PMB_ENTRY{pfu_pmb_create_gateclk_en}}
                                                          & pfu_pmb_create_ptr[PMB_ENTRY-1:0];

//==========================================================
//                 Instance sdb entry
//==========================================================

// &ConnRule(s/_x$/[0]/); @182
// &ConnRule(s/_v$/_0/); @183
// &Instance("ct_lsu_pfu_sdb_entry","x_ct_lsu_pfu_sdb_entry_0"); @184
ct_lsu_pfu_sdb_entry  x_ct_lsu_pfu_sdb_entry_0 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_iid                          (ld_da_iid                         ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .ld_da_ppfu_va                      (ld_da_ppfu_va                     ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pfu_sdb_create_pc                  (pfu_sdb_create_pc                 ),
  .pfu_sdb_create_type_ld             (pfu_sdb_create_type_ld            ),
  .pfu_sdb_entry_create_dp_vld_x      (pfu_sdb_entry_create_dp_vld[0]    ),
  .pfu_sdb_entry_create_gateclk_en_x  (pfu_sdb_entry_create_gateclk_en[0]),
  .pfu_sdb_entry_create_vld_x         (pfu_sdb_entry_create_vld[0]       ),
  .pfu_sdb_entry_evict_x              (pfu_sdb_entry_evict[0]            ),
  .pfu_sdb_entry_hit_pc_x             (pfu_sdb_entry_hit_pc[0]           ),
  .pfu_sdb_entry_pc_v                 (pfu_sdb_entry_pc_0                ),
  .pfu_sdb_entry_ready_grnt_x         (pfu_sdb_entry_ready_grnt[0]       ),
  .pfu_sdb_entry_ready_x              (pfu_sdb_entry_ready[0]            ),
  .pfu_sdb_entry_stride_neg_x         (pfu_sdb_entry_stride_neg[0]       ),
  .pfu_sdb_entry_stride_v             (pfu_sdb_entry_stride_0            ),
  .pfu_sdb_entry_strideh_6to0_v       (pfu_sdb_entry_strideh_6to0_0      ),
  .pfu_sdb_entry_type_ld_x            (pfu_sdb_entry_type_ld[0]          ),
  .pfu_sdb_entry_vld_x                (pfu_sdb_entry_vld[0]              ),
  .rtu_yy_xx_commit0                  (rtu_yy_xx_commit0                 ),
  .rtu_yy_xx_commit0_iid              (rtu_yy_xx_commit0_iid             ),
  .rtu_yy_xx_commit1                  (rtu_yy_xx_commit1                 ),
  .rtu_yy_xx_commit1_iid              (rtu_yy_xx_commit1_iid             ),
  .rtu_yy_xx_commit2                  (rtu_yy_xx_commit2                 ),
  .rtu_yy_xx_commit2_iid              (rtu_yy_xx_commit2_iid             ),
  .rtu_yy_xx_flush                    (rtu_yy_xx_flush                   ),
  .sdb_timeout_cnt_val                (sdb_timeout_cnt_val               ),
  .st_da_iid                          (st_da_iid                         ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             ),
  .st_da_ppfu_va                      (st_da_ppfu_va                     )
);


// &ConnRule(s/_x$/[1]/); @186
// &ConnRule(s/_v$/_1/); @187
// &Instance("ct_lsu_pfu_sdb_entry","x_ct_lsu_pfu_sdb_entry_1"); @188
ct_lsu_pfu_sdb_entry  x_ct_lsu_pfu_sdb_entry_1 (
  .amr_wa_cancel                      (amr_wa_cancel                     ),
  .cp0_lsu_icg_en                     (cp0_lsu_icg_en                    ),
  .cp0_lsu_l2_st_pref_en              (cp0_lsu_l2_st_pref_en             ),
  .cp0_yy_clk_en                      (cp0_yy_clk_en                     ),
  .cpurst_b                           (cpurst_b                          ),
  .ld_da_iid                          (ld_da_iid                         ),
  .ld_da_ldfifo_pc                    (ld_da_ldfifo_pc                   ),
  .ld_da_pfu_act_dp_vld               (ld_da_pfu_act_dp_vld              ),
  .ld_da_pfu_evict_cnt_vld            (ld_da_pfu_evict_cnt_vld           ),
  .ld_da_pfu_pf_inst_vld              (ld_da_pfu_pf_inst_vld             ),
  .ld_da_ppfu_va                      (ld_da_ppfu_va                     ),
  .lsu_special_clk                    (lsu_special_clk                   ),
  .pad_yy_icg_scan_en                 (pad_yy_icg_scan_en                ),
  .pfu_pop_all_part_vld               (pfu_pop_all_part_vld              ),
  .pfu_sdb_create_pc                  (pfu_sdb_create_pc                 ),
  .pfu_sdb_create_type_ld             (pfu_sdb_create_type_ld            ),
  .pfu_sdb_entry_create_dp_vld_x      (pfu_sdb_entry_create_dp_vld[1]    ),
  .pfu_sdb_entry_create_gateclk_en_x  (pfu_sdb_entry_create_gateclk_en[1]),
  .pfu_sdb_entry_create_vld_x         (pfu_sdb_entry_create_vld[1]       ),
  .pfu_sdb_entry_evict_x              (pfu_sdb_entry_evict[1]            ),
  .pfu_sdb_entry_hit_pc_x             (pfu_sdb_entry_hit_pc[1]           ),
  .pfu_sdb_entry_pc_v                 (pfu_sdb_entry_pc_1                ),
  .pfu_sdb_entry_ready_grnt_x         (pfu_sdb_entry_ready_grnt[1]       ),
  .pfu_sdb_entry_ready_x              (pfu_sdb_entry_ready[1]            ),
  .pfu_sdb_entry_stride_neg_x         (pfu_sdb_entry_stride_neg[1]       ),
  .pfu_sdb_entry_stride_v             (pfu_sdb_entry_stride_1            ),
  .pfu_sdb_entry_strideh_6to0_v       (pfu_sdb_entry_strideh_6to0_1      ),
  .pfu_sdb_entry_type_ld_x            (pfu_sdb_entry_type_ld[1]          ),
  .pfu_sdb_entry_vld_x                (pfu_sdb_entry_vld[1]              ),
  .rtu_yy_xx_commit0                  (rtu_yy_xx_commit0                 ),
  .rtu_yy_xx_commit0_iid              (rtu_yy_xx_commit0_iid             ),
  .rtu_yy_xx_commit1                  (rtu_yy_xx_commit1                 ),
  .rtu_yy_xx_commit1_iid              (rtu_yy_xx_commit1_iid             ),
  .rtu_yy_xx_commit2                  (rtu_yy_xx_commit2                 ),
  .rtu_yy_xx_commit2_iid              (rtu_yy_xx_commit2_iid             ),
  .rtu_yy_xx_flush                    (rtu_yy_xx_flush                   ),
  .sdb_timeout_cnt_val                (sdb_timeout_cnt_val               ),
  .st_da_iid                          (st_da_iid                         ),
  .st_da_pc                           (st_da_pc                          ),
  .st_da_pfu_evict_cnt_vld            (st_da_pfu_evict_cnt_vld           ),
  .st_da_pfu_pf_inst_vld              (st_da_pfu_pf_inst_vld             ),
  .st_da_ppfu_va                      (st_da_ppfu_va                     )
);


//==========================================================
//            Generate full/create signal of sdb
//==========================================================
//------------------pop pointer of pmb----------------------
// &CombBeg; @194
always @( pfu_pmb_entry_ready[7:0])
begin
pfu_pmb_pop_ptr[PMB_ENTRY-1:0]  = {PMB_ENTRY{1'b0}};
casez(pfu_pmb_entry_ready[PMB_ENTRY-1:0])
  8'b????_???1:pfu_pmb_pop_ptr[0]  = 1'b1;
  8'b????_??10:pfu_pmb_pop_ptr[1]  = 1'b1;
  8'b????_?100:pfu_pmb_pop_ptr[2]  = 1'b1;
  8'b????_1000:pfu_pmb_pop_ptr[3]  = 1'b1;
  8'b???1_0000:pfu_pmb_pop_ptr[4]  = 1'b1;
  8'b??10_0000:pfu_pmb_pop_ptr[5]  = 1'b1;
  8'b?100_0000:pfu_pmb_pop_ptr[6]  = 1'b1;
  8'b1000_0000:pfu_pmb_pop_ptr[7]  = 1'b1;
  default:pfu_pmb_pop_ptr[PMB_ENTRY-1:0]  = {PMB_ENTRY{1'b0}};
endcase
// &CombEnd; @207
end

//-------------------create info of sdb---------------------
assign pfu_sdb_create_pc[PC_LEN-1:0]  = {PC_LEN{pfu_pmb_pop_ptr[0]}}  & pfu_pmb_entry_pc_0[PC_LEN-1:0]
                                        | {PC_LEN{pfu_pmb_pop_ptr[1]}}  & pfu_pmb_entry_pc_1[PC_LEN-1:0]
                                        | {PC_LEN{pfu_pmb_pop_ptr[2]}}  & pfu_pmb_entry_pc_2[PC_LEN-1:0]
                                        | {PC_LEN{pfu_pmb_pop_ptr[3]}}  & pfu_pmb_entry_pc_3[PC_LEN-1:0]
                                        | {PC_LEN{pfu_pmb_pop_ptr[4]}}  & pfu_pmb_entry_pc_4[PC_LEN-1:0]
                                        | {PC_LEN{pfu_pmb_pop_ptr[5]}}  & pfu_pmb_entry_pc_5[PC_LEN-1:0]
                                        | {PC_LEN{pfu_pmb_pop_ptr[6]}}  & pfu_pmb_entry_pc_6[PC_LEN-1:0]
                                        | {PC_LEN{pfu_pmb_pop_ptr[7]}}  & pfu_pmb_entry_pc_7[PC_LEN-1:0];

assign pfu_sdb_create_type_ld = |(pfu_pmb_pop_ptr[7:0] & pfu_pmb_entry_type_ld[7:0]);

//---------------------create pointer-----------------------
//if it has empty entry, then create signal to empty entry,
//else create siganl to evict entry,
//else wait
// &CombBeg; @225
always @( pfu_sdb_entry_vld[1:0])
begin
pfu_sdb_empty_create_ptr[SDB_ENTRY-1:0]   = {SDB_ENTRY{1'b0}};
casez(pfu_sdb_entry_vld[SDB_ENTRY-1:0])
  2'b?0:pfu_sdb_empty_create_ptr[0]  = 1'b1;
  2'b01:pfu_sdb_empty_create_ptr[1]  = 1'b1;
  default:pfu_sdb_empty_create_ptr[SDB_ENTRY-1:0]   = {SDB_ENTRY{1'b0}};
endcase
// &CombEnd; @232
end

// &CombBeg; @234
always @( pfu_sdb_entry_evict[1:0])
begin
pfu_sdb_evict_create_ptr[SDB_ENTRY-1:0]  = {SDB_ENTRY{1'b0}};
casez(pfu_sdb_entry_evict[SDB_ENTRY-1:0])
  2'b?1:pfu_sdb_evict_create_ptr[0]  = 1'b1;
  2'b10:pfu_sdb_evict_create_ptr[1]  = 1'b1;
  default:pfu_sdb_evict_create_ptr[SDB_ENTRY-1:0]  = {SDB_ENTRY{1'b0}};
endcase
// &CombEnd; @241
end

assign pfu_sdb_full       = &pfu_sdb_entry_vld[SDB_ENTRY-1:0];
assign pfu_sdb_has_evict  = |pfu_sdb_entry_evict[SDB_ENTRY-1:0];
assign pfu_sdb_create_ptr[SDB_ENTRY-1:0]  = pfu_sdb_full
                                            ? pfu_sdb_evict_create_ptr[SDB_ENTRY-1:0]
                                            : pfu_sdb_empty_create_ptr[SDB_ENTRY-1:0];

//-------------------grnt signal of pmb---------------------
assign pfu_pmb_ready_grnt         = !pfu_sdb_full
                                    ||  pfu_sdb_has_evict;
assign pfu_pmb_entry_ready_grnt[PMB_ENTRY-1:0]  = {PMB_ENTRY{pfu_pmb_ready_grnt}}
                                                  & pfu_pmb_pop_ptr[PMB_ENTRY-1:0];

//------------------create signal of sdb--------------------
assign pfu_sdb_create_vld         = |pfu_pmb_entry_ready[PMB_ENTRY-1:0];
assign pfu_sdb_create_dp_vld      = pfu_sdb_create_vld;
// &Force("output","pfu_sdb_create_gateclk_en"); @258
assign pfu_sdb_create_gateclk_en  = pfu_sdb_create_dp_vld;

assign pfu_sdb_entry_create_vld[SDB_ENTRY-1:0]          = {SDB_ENTRY{pfu_sdb_create_vld}}
                                                          & pfu_sdb_create_ptr[SDB_ENTRY-1:0];
assign pfu_sdb_entry_create_dp_vld[SDB_ENTRY-1:0]       = {SDB_ENTRY{pfu_sdb_create_dp_vld}}
                                                          & pfu_sdb_create_ptr[SDB_ENTRY-1:0];
assign pfu_sdb_entry_create_gateclk_en[SDB_ENTRY-1:0]   = {SDB_ENTRY{pfu_sdb_create_gateclk_en}}
                                                          & pfu_sdb_create_ptr[SDB_ENTRY-1:0];

//==========================================================
//                 Instance pfb entry
//==========================================================
// &ConnRule(s/_x$/[0]/); @271
// &ConnRule(s/_v$/_0/); @272
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_0"); @273
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_0 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[0]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_0       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[0]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[0]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[0]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[0]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[0]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[0] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[0]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[0]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[0]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[0]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_0           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_0               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[0]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[0]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_0           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_0               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[0]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_0       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[0]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_0            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[0]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


// &ConnRule(s/_x$/[1]/); @275
// &ConnRule(s/_v$/_1/); @276
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_1"); @277
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_1 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[1]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_1       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[1]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[1]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[1]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[1]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[1]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[1] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[1]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[1]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[1]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[1]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_1           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_1               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[1]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[1]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_1           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_1               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[1]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_1       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[1]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_1            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[1]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


// &ConnRule(s/_x$/[2]/); @279
// &ConnRule(s/_v$/_2/); @280
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_2"); @281
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_2 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[2]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_2       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[2]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[2]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[2]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[2]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[2]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[2] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[2]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[2]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[2]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[2]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_2           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_2               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[2]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[2]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_2           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_2               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[2]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_2       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[2]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_2            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[2]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


// &ConnRule(s/_x$/[3]/); @283
// &ConnRule(s/_v$/_3/); @284
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_3"); @285
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_3 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[3]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_3       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[3]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[3]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[3]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[3]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[3]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[3] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[3]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[3]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[3]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[3]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_3           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_3               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[3]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[3]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_3           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_3               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[3]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_3       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[3]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_3            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[3]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


// &ConnRule(s/_x$/[4]/); @287
// &ConnRule(s/_v$/_4/); @288
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_4"); @289
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_4 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[4]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_4       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[4]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[4]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[4]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[4]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[4]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[4] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[4]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[4]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[4]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[4]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_4           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_4               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[4]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[4]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_4           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_4               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[4]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_4       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[4]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_4            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[4]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


// &ConnRule(s/_x$/[5]/); @291
// &ConnRule(s/_v$/_5/); @292
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_5"); @293
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_5 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[5]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_5       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[5]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[5]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[5]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[5]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[5]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[5] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[5]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[5]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[5]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[5]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_5           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_5               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[5]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[5]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_5           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_5               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[5]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_5       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[5]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_5            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[5]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


// &ConnRule(s/_x$/[6]/); @295
// &ConnRule(s/_v$/_6/); @296
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_6"); @297
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_6 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[6]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_6       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[6]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[6]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[6]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[6]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[6]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[6] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[6]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[6]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[6]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[6]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_6           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_6               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[6]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[6]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_6           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_6               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[6]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_6       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[6]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_6            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[6]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


// &ConnRule(s/_x$/[7]/); @299
// &ConnRule(s/_v$/_7/); @300
// &Instance("ct_lsu_pfu_pfb_entry","x_ct_lsu_pfu_pfb_entry_7"); @301
ct_lsu_pfu_pfb_entry  x_ct_lsu_pfu_pfb_entry_7 (
  .amr_wa_cancel                         (amr_wa_cancel                        ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cp0_lsu_l2_st_pref_en                 (cp0_lsu_l2_st_pref_en                ),
  .cp0_lsu_pfu_mmu_dis                   (cp0_lsu_pfu_mmu_dis                  ),
  .cp0_yy_clk_en                         (cp0_yy_clk_en                        ),
  .cp0_yy_priv_mode                      (cp0_yy_priv_mode                     ),
  .cpurst_b                              (cpurst_b                             ),
  .ld_da_ldfifo_pc                       (ld_da_ldfifo_pc                      ),
  .ld_da_page_sec_ff                     (ld_da_page_sec_ff                    ),
  .ld_da_page_share_ff                   (ld_da_page_share_ff                  ),
  .ld_da_pfu_act_dp_vld                  (ld_da_pfu_act_dp_vld                 ),
  .ld_da_pfu_act_vld                     (ld_da_pfu_act_vld                    ),
  .ld_da_pfu_evict_cnt_vld               (ld_da_pfu_evict_cnt_vld              ),
  .ld_da_pfu_pf_inst_vld                 (ld_da_pfu_pf_inst_vld                ),
  .ld_da_ppfu_va                         (ld_da_ppfu_va                        ),
  .ld_da_ppn_ff                          (ld_da_ppn_ff                         ),
  .lsu_pfu_l1_dist_sel                   (lsu_pfu_l1_dist_sel                  ),
  .lsu_pfu_l2_dist_sel                   (lsu_pfu_l2_dist_sel                  ),
  .lsu_special_clk                       (lsu_special_clk                      ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .pfb_no_req_cnt_val                    (pfb_no_req_cnt_val                   ),
  .pfb_timeout_cnt_val                   (pfb_timeout_cnt_val                  ),
  .pfu_biu_pe_req_sel_l1                 (pfu_biu_pe_req_sel_l1                ),
  .pfu_dcache_pref_en                    (pfu_dcache_pref_en                   ),
  .pfu_get_page_sec                      (pfu_get_page_sec                     ),
  .pfu_get_page_share                    (pfu_get_page_share                   ),
  .pfu_get_ppn                           (pfu_get_ppn                          ),
  .pfu_get_ppn_err                       (pfu_get_ppn_err                      ),
  .pfu_get_ppn_vld                       (pfu_get_ppn_vld                      ),
  .pfu_l2_pref_en                        (pfu_l2_pref_en                       ),
  .pfu_mmu_pe_req_sel_l1                 (pfu_mmu_pe_req_sel_l1                ),
  .pfu_pfb_create_pc                     (pfu_pfb_create_pc                    ),
  .pfu_pfb_create_stride                 (pfu_pfb_create_stride                ),
  .pfu_pfb_create_stride_neg             (pfu_pfb_create_stride_neg            ),
  .pfu_pfb_create_strideh_6to0           (pfu_pfb_create_strideh_6to0          ),
  .pfu_pfb_create_type_ld                (pfu_pfb_create_type_ld               ),
  .pfu_pfb_entry_biu_pe_req_grnt_x       (pfu_pfb_entry_biu_pe_req_grnt[7]     ),
  .pfu_pfb_entry_biu_pe_req_src_v        (pfu_pfb_entry_biu_pe_req_src_7       ),
  .pfu_pfb_entry_biu_pe_req_x            (pfu_pfb_entry_biu_pe_req[7]          ),
  .pfu_pfb_entry_create_dp_vld_x         (pfu_pfb_entry_create_dp_vld[7]       ),
  .pfu_pfb_entry_create_gateclk_en_x     (pfu_pfb_entry_create_gateclk_en[7]   ),
  .pfu_pfb_entry_create_vld_x            (pfu_pfb_entry_create_vld[7]          ),
  .pfu_pfb_entry_evict_x                 (pfu_pfb_entry_evict[7]               ),
  .pfu_pfb_entry_from_lfb_dcache_hit_x   (pfu_pfb_entry_from_lfb_dcache_hit[7] ),
  .pfu_pfb_entry_from_lfb_dcache_miss_x  (pfu_pfb_entry_from_lfb_dcache_miss[7]),
  .pfu_pfb_entry_hit_pc_x                (pfu_pfb_entry_hit_pc[7]              ),
  .pfu_pfb_entry_l1_page_sec_x           (pfu_pfb_entry_l1_page_sec[7]         ),
  .pfu_pfb_entry_l1_page_share_x         (pfu_pfb_entry_l1_page_share[7]       ),
  .pfu_pfb_entry_l1_pf_addr_v            (pfu_pfb_entry_l1_pf_addr_7           ),
  .pfu_pfb_entry_l1_vpn_v                (pfu_pfb_entry_l1_vpn_7               ),
  .pfu_pfb_entry_l2_page_sec_x           (pfu_pfb_entry_l2_page_sec[7]         ),
  .pfu_pfb_entry_l2_page_share_x         (pfu_pfb_entry_l2_page_share[7]       ),
  .pfu_pfb_entry_l2_pf_addr_v            (pfu_pfb_entry_l2_pf_addr_7           ),
  .pfu_pfb_entry_l2_vpn_v                (pfu_pfb_entry_l2_vpn_7               ),
  .pfu_pfb_entry_mmu_pe_req_grnt_x       (pfu_pfb_entry_mmu_pe_req_grnt[7]     ),
  .pfu_pfb_entry_mmu_pe_req_src_v        (pfu_pfb_entry_mmu_pe_req_src_7       ),
  .pfu_pfb_entry_mmu_pe_req_x            (pfu_pfb_entry_mmu_pe_req[7]          ),
  .pfu_pfb_entry_priv_mode_v             (pfu_pfb_entry_priv_mode_7            ),
  .pfu_pfb_entry_vld_x                   (pfu_pfb_entry_vld[7]                 ),
  .pfu_pop_all_part_vld                  (pfu_pop_all_part_vld                 ),
  .st_da_page_sec_ff                     (st_da_page_sec_ff                    ),
  .st_da_page_share_ff                   (st_da_page_share_ff                  ),
  .st_da_pc                              (st_da_pc                             ),
  .st_da_pfu_act_vld                     (st_da_pfu_act_vld                    ),
  .st_da_pfu_evict_cnt_vld               (st_da_pfu_evict_cnt_vld              ),
  .st_da_pfu_pf_inst_vld                 (st_da_pfu_pf_inst_vld                ),
  .st_da_ppfu_va                         (st_da_ppfu_va                        ),
  .st_da_ppn_ff                          (st_da_ppn_ff                         )
);


//==========================================================
//            Generate full/create signal of pfb
//==========================================================
//------------------pop pointer of sdb----------------------
// &CombBeg; @307
always @( pfu_sdb_entry_ready[1:0])
begin
pfu_sdb_pop_ptr[SDB_ENTRY-1:0]  = {SDB_ENTRY{1'b0}};
casez(pfu_sdb_entry_ready[SDB_ENTRY-1:0])
  2'b?1:pfu_sdb_pop_ptr[0]  = 1'b1;
  2'b10:pfu_sdb_pop_ptr[1]  = 1'b1;
  default:pfu_sdb_pop_ptr[SDB_ENTRY-1:0]  = {SDB_ENTRY{1'b0}};
endcase
// &CombEnd; @314
end

//-------------------create info of pfb---------------------
assign pfu_pfb_create_pc[PC_LEN-1:0]    = {PC_LEN{pfu_sdb_pop_ptr[0]}}  & pfu_sdb_entry_pc_0[PC_LEN-1:0]
                                          | {PC_LEN{pfu_sdb_pop_ptr[1]}}  & pfu_sdb_entry_pc_1[PC_LEN-1:0];
assign pfu_pfb_create_stride[10:0]      = {11{pfu_sdb_pop_ptr[0]}}  & pfu_sdb_entry_stride_0[10:0]
                                          | {11{pfu_sdb_pop_ptr[1]}}  & pfu_sdb_entry_stride_1[10:0];
assign pfu_pfb_create_strideh_6to0[6:0] = {7{pfu_sdb_pop_ptr[0]}} & pfu_sdb_entry_strideh_6to0_0[6:0]
                                          | {7{pfu_sdb_pop_ptr[1]}} & pfu_sdb_entry_strideh_6to0_1[6:0];
assign pfu_pfb_create_stride_neg        = |(pfu_sdb_pop_ptr[SDB_ENTRY-1:0]
                                            & pfu_sdb_entry_stride_neg[SDB_ENTRY-1:0]);
assign pfu_pfb_create_type_ld           = |(pfu_sdb_pop_ptr[SDB_ENTRY-1:0]
                                            & pfu_sdb_entry_type_ld[SDB_ENTRY-1:0]);

//---------------------create pointer-----------------------
//if it has empty entry, then create signal to empty entry,
//else create siganl to evict entry,
//else create fail
// &CombBeg; @332
always @( pfu_pfb_entry_vld[7:0])
begin
pfu_pfb_empty_create_ptr[PFB_ENTRY-1:0]   = {PFB_ENTRY{1'b0}};
casez(pfu_pfb_entry_vld[PFB_ENTRY-1:0])
  8'b????_???0:pfu_pfb_empty_create_ptr[0]  = 1'b1;
  8'b????_??01:pfu_pfb_empty_create_ptr[1]  = 1'b1;
  8'b????_?011:pfu_pfb_empty_create_ptr[2]  = 1'b1;
  8'b????_0111:pfu_pfb_empty_create_ptr[3]  = 1'b1;
  8'b???0_1111:pfu_pfb_empty_create_ptr[4]  = 1'b1;
  8'b??01_1111:pfu_pfb_empty_create_ptr[5]  = 1'b1;
  8'b?011_1111:pfu_pfb_empty_create_ptr[6]  = 1'b1;
  8'b0111_1111:pfu_pfb_empty_create_ptr[7]  = 1'b1;
  default:pfu_pfb_empty_create_ptr[PFB_ENTRY-1:0]   = {PFB_ENTRY{1'b0}};
endcase
// &CombEnd; @345
end

// &CombBeg; @347
always @( pfu_pfb_entry_evict[7:0])
begin
pfu_pfb_evict_create_ptr[PFB_ENTRY-1:0]  = {PFB_ENTRY{1'b0}};
casez(pfu_pfb_entry_evict[PFB_ENTRY-1:0])
  8'b????_???1:pfu_pfb_evict_create_ptr[0]  = 1'b1;
  8'b????_??10:pfu_pfb_evict_create_ptr[1]  = 1'b1;
  8'b????_?100:pfu_pfb_evict_create_ptr[2]  = 1'b1;
  8'b????_1000:pfu_pfb_evict_create_ptr[3]  = 1'b1;
  8'b???1_0000:pfu_pfb_evict_create_ptr[4]  = 1'b1;
  8'b??10_0000:pfu_pfb_evict_create_ptr[5]  = 1'b1;
  8'b?100_0000:pfu_pfb_evict_create_ptr[6]  = 1'b1;
  8'b1000_0000:pfu_pfb_evict_create_ptr[7]  = 1'b1;
  default:pfu_pfb_evict_create_ptr[PFB_ENTRY-1:0]  = {PFB_ENTRY{1'b0}};
endcase
// &CombEnd; @360
end

assign pfu_pfb_full       = &pfu_pfb_entry_vld[PFB_ENTRY-1:0];
assign pfu_pfb_has_evict  = |pfu_pfb_entry_evict[PFB_ENTRY-1:0];
assign pfu_pfb_create_ptr[PFB_ENTRY-1:0]  = pfu_pfb_full
                                            ? pfu_pfb_evict_create_ptr[PFB_ENTRY-1:0]
                                            : pfu_pfb_empty_create_ptr[PFB_ENTRY-1:0];

//-------------------grnt signal of pmb---------------------
assign pfu_sdb_ready_grnt         = !pfu_pfb_full
                                    ||  pfu_pfb_has_evict;
assign pfu_sdb_entry_ready_grnt[SDB_ENTRY-1:0]  = {SDB_ENTRY{pfu_sdb_ready_grnt}}
                                                  & pfu_sdb_pop_ptr[SDB_ENTRY-1:0];

//------------------create signal of sdb--------------------
assign pfu_pfb_create_vld         = |pfu_sdb_entry_ready[SDB_ENTRY-1:0];
assign pfu_pfb_create_dp_vld      = pfu_pfb_create_vld;
assign pfu_pfb_create_gateclk_en  = pfu_pfb_create_dp_vld;

assign pfu_pfb_entry_create_vld[PFB_ENTRY-1:0]          = {PFB_ENTRY{pfu_pfb_create_vld}}
                                                          & pfu_pfb_create_ptr[PFB_ENTRY-1:0];
assign pfu_pfb_entry_create_dp_vld[PFB_ENTRY-1:0]       = {PFB_ENTRY{pfu_pfb_create_dp_vld}}
                                                          & pfu_pfb_create_ptr[PFB_ENTRY-1:0];
assign pfu_pfb_entry_create_gateclk_en[PFB_ENTRY-1:0]  = {PFB_ENTRY{pfu_pfb_create_gateclk_en}}
                                                          & pfu_pfb_create_ptr[PFB_ENTRY-1:0];

//==========================================================
//                      Global PFU
//==========================================================
// &Instance("ct_lsu_pfu_gsdb","x_ct_lsu_pfu_gsdb"); @389
ct_lsu_pfu_gsdb  x_ct_lsu_pfu_gsdb (
  .cp0_lsu_icg_en           (cp0_lsu_icg_en          ),
  .cp0_yy_clk_en            (cp0_yy_clk_en           ),
  .cp0_yy_dcache_pref_en    (cp0_yy_dcache_pref_en   ),
  .cpurst_b                 (cpurst_b                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .ld_da_iid                (ld_da_iid               ),
  .ld_da_pfu_act_vld        (ld_da_pfu_act_vld       ),
  .ld_da_pfu_pf_inst_vld    (ld_da_pfu_pf_inst_vld   ),
  .ld_da_pfu_va             (ld_da_pfu_va            ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .pfu_gpfb_vld             (pfu_gpfb_vld            ),
  .pfu_gsdb_gpfb_create_vld (pfu_gsdb_gpfb_create_vld),
  .pfu_gsdb_gpfb_pop_req    (pfu_gsdb_gpfb_pop_req   ),
  .pfu_gsdb_stride          (pfu_gsdb_stride         ),
  .pfu_gsdb_stride_neg      (pfu_gsdb_stride_neg     ),
  .pfu_gsdb_strideh_6to0    (pfu_gsdb_strideh_6to0   ),
  .pfu_pop_all_vld          (pfu_pop_all_vld         ),
  .rtu_yy_xx_commit0        (rtu_yy_xx_commit0       ),
  .rtu_yy_xx_commit0_iid    (rtu_yy_xx_commit0_iid   ),
  .rtu_yy_xx_commit1        (rtu_yy_xx_commit1       ),
  .rtu_yy_xx_commit1_iid    (rtu_yy_xx_commit1_iid   ),
  .rtu_yy_xx_commit2        (rtu_yy_xx_commit2       ),
  .rtu_yy_xx_commit2_iid    (rtu_yy_xx_commit2_iid   ),
  .rtu_yy_xx_flush          (rtu_yy_xx_flush         )
);


// &Instance("ct_lsu_pfu_gpfb","x_ct_lsu_pfu_gpfb"); @391
ct_lsu_pfu_gpfb  x_ct_lsu_pfu_gpfb (
  .cp0_lsu_icg_en                (cp0_lsu_icg_en               ),
  .cp0_lsu_pfu_mmu_dis           (cp0_lsu_pfu_mmu_dis          ),
  .cp0_yy_clk_en                 (cp0_yy_clk_en                ),
  .cp0_yy_priv_mode              (cp0_yy_priv_mode             ),
  .cpurst_b                      (cpurst_b                     ),
  .forever_cpuclk                (forever_cpuclk               ),
  .ld_da_page_sec_ff             (ld_da_page_sec_ff            ),
  .ld_da_page_share_ff           (ld_da_page_share_ff          ),
  .ld_da_pfu_act_vld             (ld_da_pfu_act_vld            ),
  .ld_da_pfu_pf_inst_vld         (ld_da_pfu_pf_inst_vld        ),
  .ld_da_pfu_va                  (ld_da_pfu_va                 ),
  .ld_da_ppn_ff                  (ld_da_ppn_ff                 ),
  .lsu_pfu_l1_dist_sel           (lsu_pfu_l1_dist_sel          ),
  .lsu_pfu_l2_dist_sel           (lsu_pfu_l2_dist_sel          ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .pfu_biu_pe_req_sel_l1         (pfu_biu_pe_req_sel_l1        ),
  .pfu_dcache_pref_en            (pfu_dcache_pref_en           ),
  .pfu_get_page_sec              (pfu_get_page_sec             ),
  .pfu_get_page_share            (pfu_get_page_share           ),
  .pfu_get_ppn                   (pfu_get_ppn                  ),
  .pfu_get_ppn_err               (pfu_get_ppn_err              ),
  .pfu_get_ppn_vld               (pfu_get_ppn_vld              ),
  .pfu_gpfb_biu_pe_req           (pfu_gpfb_biu_pe_req          ),
  .pfu_gpfb_biu_pe_req_grnt      (pfu_gpfb_biu_pe_req_grnt     ),
  .pfu_gpfb_biu_pe_req_src       (pfu_gpfb_biu_pe_req_src      ),
  .pfu_gpfb_from_lfb_dcache_hit  (pfu_gpfb_from_lfb_dcache_hit ),
  .pfu_gpfb_from_lfb_dcache_miss (pfu_gpfb_from_lfb_dcache_miss),
  .pfu_gpfb_l1_page_sec          (pfu_gpfb_l1_page_sec         ),
  .pfu_gpfb_l1_page_share        (pfu_gpfb_l1_page_share       ),
  .pfu_gpfb_l1_pf_addr           (pfu_gpfb_l1_pf_addr          ),
  .pfu_gpfb_l1_vpn               (pfu_gpfb_l1_vpn              ),
  .pfu_gpfb_l2_page_sec          (pfu_gpfb_l2_page_sec         ),
  .pfu_gpfb_l2_page_share        (pfu_gpfb_l2_page_share       ),
  .pfu_gpfb_l2_pf_addr           (pfu_gpfb_l2_pf_addr          ),
  .pfu_gpfb_l2_vpn               (pfu_gpfb_l2_vpn              ),
  .pfu_gpfb_mmu_pe_req           (pfu_gpfb_mmu_pe_req          ),
  .pfu_gpfb_mmu_pe_req_grnt      (pfu_gpfb_mmu_pe_req_grnt     ),
  .pfu_gpfb_mmu_pe_req_src       (pfu_gpfb_mmu_pe_req_src      ),
  .pfu_gpfb_priv_mode            (pfu_gpfb_priv_mode           ),
  .pfu_gpfb_vld                  (pfu_gpfb_vld                 ),
  .pfu_gsdb_gpfb_create_vld      (pfu_gsdb_gpfb_create_vld     ),
  .pfu_gsdb_gpfb_pop_req         (pfu_gsdb_gpfb_pop_req        ),
  .pfu_gsdb_stride               (pfu_gsdb_stride              ),
  .pfu_gsdb_stride_neg           (pfu_gsdb_stride_neg          ),
  .pfu_gsdb_strideh_6to0         (pfu_gsdb_strideh_6to0        ),
  .pfu_l2_pref_en                (pfu_l2_pref_en               ),
  .pfu_mmu_pe_req_sel_l1         (pfu_mmu_pe_req_sel_l1        ),
  .pfu_pop_all_vld               (pfu_pop_all_vld              )
);


//==========================================================
//          Instance mmu pop entry and logic
//==========================================================
//----------------------registers---------------------------
//+-----+-----+----+
//| req | vpn | id |
//+-----+-----+----+
always @(posedge pfu_mmu_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_mmu_req               <=  1'b0;
  else if(pfu_pop_all_vld)
    pfu_mmu_req               <=  1'b0;
  else if(pfu_mmu_pe_update_permit  &&  pfu_mmu_pe_req)
    pfu_mmu_req               <=  1'b1;
  else if(pfu_get_ppn_vld)
    pfu_mmu_req               <=  1'b0;
end

// &Force("nonport","pfu_mmu_req_l1"); @412
// &Force("nonport","pfu_mmu_req_ptr"); @413
always @(posedge pfu_mmu_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    pfu_mmu_req_l1                  <=  1'b0;
    pfu_mmu_req_ptr[PFB_ENTRY:0]    <=  {PFB_ENTRY+1{1'b0}};
    pfu_mmu_req_vpn[`PA_WIDTH-13:0] <=  {`PA_WIDTH-12{1'b0}};
  end
  else if(pfu_mmu_pe_update_permit &&  pfu_mmu_pe_req)
  begin
    pfu_mmu_req_l1                  <=  pfu_mmu_pe_req_sel_l1;
    pfu_mmu_req_ptr[PFB_ENTRY:0]    <=  pfu_mmu_pe_req_ptr[PFB_ENTRY:0];
    pfu_mmu_req_vpn[`PA_WIDTH-13:0] <=  pfu_mmu_pe_req_vpn[`PA_WIDTH-13:0];
  end
end

//---------------------update signal------------------------
assign pfu_all_pfb_mmu_pe_req[PFB_ENTRY:0]  = {pfu_gpfb_mmu_pe_req,
                                              pfu_pfb_entry_mmu_pe_req[PFB_ENTRY-1:0]};
assign pfu_mmu_pe_req       = |pfu_all_pfb_mmu_pe_req[PFB_ENTRY:0];

assign pfu_mmu_pe_update_permit = !pfu_mmu_req
                                  ||  pfu_get_ppn_vld;


//---------------------grnt and resp signal-----------------
assign pfu_pfb_entry_mmu_pe_req_grnt[PFB_ENTRY-1:0] =
                {PFB_ENTRY{pfu_mmu_pe_update_permit}}
                & pfu_mmu_pe_req_ptr[PFB_ENTRY-1:0];
assign pfu_gpfb_mmu_pe_req_grnt = pfu_mmu_pe_update_permit  &&  pfu_mmu_pe_req_ptr[8];

// &CombBeg; @445
always @( pfu_all_pfb_mmu_pe_req[8:0])
begin
pfu_mmu_pe_req_ptr[PFB_ENTRY:0] = {PFB_ENTRY+1{1'b0}};
casez(pfu_all_pfb_mmu_pe_req[PFB_ENTRY:0])
  9'b?_????_???1:pfu_mmu_pe_req_ptr[0]  = 1'b1;
  9'b?_????_??10:pfu_mmu_pe_req_ptr[1]  = 1'b1;
  9'b?_????_?100:pfu_mmu_pe_req_ptr[2]  = 1'b1;
  9'b?_????_1000:pfu_mmu_pe_req_ptr[3]  = 1'b1;
  9'b?_???1_0000:pfu_mmu_pe_req_ptr[4]  = 1'b1;
  9'b?_??10_0000:pfu_mmu_pe_req_ptr[5]  = 1'b1;
  9'b?_?100_0000:pfu_mmu_pe_req_ptr[6]  = 1'b1;
  9'b?_1000_0000:pfu_mmu_pe_req_ptr[7]  = 1'b1;
  9'b1_0000_0000:pfu_mmu_pe_req_ptr[8]  = 1'b1;
  default:pfu_mmu_pe_req_ptr[PFB_ENTRY:0] = {PFB_ENTRY+1{1'b0}};
endcase
// &CombEnd; @459
end


//------------sel info to pop entry---------------
assign pfu_mmu_l1_pe_req_vpn[`PA_WIDTH-13:0]  =
                {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[0]}} & pfu_pfb_entry_l1_vpn_0[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[1]}} & pfu_pfb_entry_l1_vpn_1[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[2]}} & pfu_pfb_entry_l1_vpn_2[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[3]}} & pfu_pfb_entry_l1_vpn_3[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[4]}} & pfu_pfb_entry_l1_vpn_4[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[5]}} & pfu_pfb_entry_l1_vpn_5[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[6]}} & pfu_pfb_entry_l1_vpn_6[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[7]}} & pfu_pfb_entry_l1_vpn_7[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[8]}} & pfu_gpfb_l1_vpn[`PA_WIDTH-13:0];

assign pfu_mmu_l2_pe_req_vpn[`PA_WIDTH-13:0]  =
                {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[0]}} & pfu_pfb_entry_l2_vpn_0[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[1]}} & pfu_pfb_entry_l2_vpn_1[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[2]}} & pfu_pfb_entry_l2_vpn_2[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[3]}} & pfu_pfb_entry_l2_vpn_3[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[4]}} & pfu_pfb_entry_l2_vpn_4[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[5]}} & pfu_pfb_entry_l2_vpn_5[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[6]}} & pfu_pfb_entry_l2_vpn_6[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[7]}} & pfu_pfb_entry_l2_vpn_7[`PA_WIDTH-13:0]
                | {`PA_WIDTH-12{pfu_mmu_pe_req_ptr[8]}} & pfu_gpfb_l2_vpn[`PA_WIDTH-13:0];

assign pfu_mmu_pe_req_src[1:0]  = {2{pfu_mmu_pe_req_ptr[0]}}  & pfu_pfb_entry_mmu_pe_req_src_0[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[1]}}  & pfu_pfb_entry_mmu_pe_req_src_1[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[2]}}  & pfu_pfb_entry_mmu_pe_req_src_2[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[3]}}  & pfu_pfb_entry_mmu_pe_req_src_3[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[4]}}  & pfu_pfb_entry_mmu_pe_req_src_4[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[5]}}  & pfu_pfb_entry_mmu_pe_req_src_5[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[6]}}  & pfu_pfb_entry_mmu_pe_req_src_6[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[7]}}  & pfu_pfb_entry_mmu_pe_req_src_7[1:0]
                                  | {2{pfu_mmu_pe_req_ptr[8]}}  & pfu_gpfb_mmu_pe_req_src[1:0];

assign pfu_mmu_pe_req_sel_l1        = pfu_mmu_pe_req_src[0];

assign pfu_mmu_pe_req_vpn[`PA_WIDTH-13:0] = pfu_mmu_pe_req_sel_l1
                                            ? pfu_mmu_l1_pe_req_vpn[`PA_WIDTH-13:0]
                                            : pfu_mmu_l2_pe_req_vpn[`PA_WIDTH-13:0];

//------------------interface with mmu----------------------
assign lsu_mmu_va2_vld              = pfu_mmu_req;
assign lsu_mmu_va2[`PA_WIDTH-13:0]  = pfu_mmu_req_vpn[`PA_WIDTH-13:0];
assign pfu_get_ppn_vld              = mmu_lsu_pa2_vld;
assign pfu_get_ppn_err              = mmu_lsu_pa2_err;
assign pfu_get_ppn[`PA_WIDTH-13:0]  = mmu_lsu_pa2[`PA_WIDTH-13:0];
assign pfu_get_page_sec             = mmu_lsu_sec2;
assign pfu_get_page_share           = mmu_lsu_share2;

//==========================================================
//          Instance biu pop entry and logic
//==========================================================
//----------------------registers---------------------------
//+-----+------+---------+----------+
//| req | addr | req_ptr | priority |
//+-----+------+---------+----------+
always @(posedge pfu_biu_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pfu_biu_req_unmask          <=  1'b0;
  else if(pfu_pop_all_vld)
    pfu_biu_req_unmask          <=  1'b0;
  else if(pfu_biu_pe_req_grnt)
    pfu_biu_req_unmask          <=  1'b1;
  else if(pfu_biu_req_grnt)
    pfu_biu_req_unmask          <=  1'b0;
end

always @(posedge pfu_biu_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    pfu_biu_req_l1                        <=  1'b0;
    pfu_biu_req_addr_tto6[`PA_WIDTH-7:0]  <=  {`PA_WIDTH-6{1'b0}};
    pfu_biu_req_page_sec                  <=  1'b0;
    pfu_biu_req_page_share                <=  1'b0;
    pfu_biu_req_priv_mode[1:0]            <=  2'b0;
    pfu_biu_req_ptr[PFB_ENTRY:0]          <=  {PFB_ENTRY+1{1'b0}};
    pfu_biu_req_priority[PFB_ENTRY:0]     <=  {PFB_ENTRY+1{1'b0}};
  end
  else if(pfu_biu_pe_update_vld)
  begin
    pfu_biu_req_l1                        <=  pfu_biu_pe_req_sel_l1;
    pfu_biu_req_addr_tto6[`PA_WIDTH-7:0]  <=  pfu_biu_pe_req_addr_tto6[`PA_WIDTH-7:0];
    pfu_biu_req_page_sec                  <=  pfu_biu_pe_req_page_sec;
    pfu_biu_req_page_share                <=  pfu_biu_pe_req_page_share;
    pfu_biu_req_priv_mode[1:0]            <=  pfu_biu_pe_req_priv_mode[1:0];
    pfu_biu_req_ptr[PFB_ENTRY:0]          <=  pfu_biu_pe_req_ptr[PFB_ENTRY:0];
    pfu_biu_req_priority[PFB_ENTRY:0]     <=  pfu_biu_req_priority_next[PFB_ENTRY:0];
  end
end

//---------------------update signal------------------------
assign pfu_all_pfb_biu_pe_req[PFB_ENTRY:0]  = {pfu_gpfb_biu_pe_req,
                                              pfu_pfb_entry_biu_pe_req[PFB_ENTRY-1:0]};
assign pfu_biu_pe_req       = |pfu_all_pfb_biu_pe_req[PFB_ENTRY:0];
assign pfu_biu_req_grnt     = bus_arb_pfu_ar_grnt
                              ||  pfu_biu_req_unmask
                                  &&  pfu_biu_req_l1
                                  &&  pfu_biu_req_hit_idx;
//for timing,create bus grant without hit_idx
assign pfu_biu_req_bus_grnt = bus_arb_pfu_ar_ready
                              && (!lfb_addr_full
                                     && (lfb_pfu_rready_grnt
                                         || rb_pfu_nc_no_pending)
                                  || !pfu_biu_req_l1);

//for timing, do not use pipe
assign pfu_biu_pe_update_permit = !pfu_biu_req_unmask
                                  || pfu_biu_req_bus_grnt;

assign pfu_biu_pe_update_vld    = pfu_biu_pe_update_permit
                                  &&  pfu_biu_pe_req;

//if grnt entry only req l1, and lfb_addr_less 2, then do not grnt
assign pfu_biu_pe_req_grnt      = pfu_biu_pe_update_permit
                                  &&  (pfu_biu_pe_req_sel_l1
                                      ||  pfu_biu_pe_req_src[1]);
//---------------------grnt signal--------------------------
//for timing grnt signal add gateclk
assign pfu_pfb_entry_biu_pe_req_grnt[PFB_ENTRY-1:0] =
                {PFB_ENTRY{pfu_biu_pe_req_grnt}}
                & pfu_biu_pe_req_ptr[PFB_ENTRY-1:0];
assign pfu_gpfb_biu_pe_req_grnt = pfu_biu_pe_req_grnt  &&  pfu_biu_pe_req_ptr[8];
//---------------------update info--------------------------
assign pfu_all_pfb_biu_pe_req_ptiority_0[PFB_ENTRY:0] = pfu_all_pfb_biu_pe_req[PFB_ENTRY:0]
                                                        & (~pfu_biu_req_priority[PFB_ENTRY:0]);
assign pfu_all_pfb_biu_pe_req_ptiority_1[PFB_ENTRY:0] = pfu_all_pfb_biu_pe_req[PFB_ENTRY:0]
                                                        & pfu_biu_req_priority[PFB_ENTRY:0];

assign pfu_biu_pe_req_ptiority_0 = |pfu_all_pfb_biu_pe_req_ptiority_0[PFB_ENTRY:0];
//----------------req_ptr---------------
//sel priority 0 first, then priority 1
// &CombBeg; @594
always @( pfu_all_pfb_biu_pe_req_ptiority_0[8:0])
begin
pfu_biu_pe_req_ptr_priority_0[PFB_ENTRY:0] = {PFB_ENTRY+1{1'b0}};
casez(pfu_all_pfb_biu_pe_req_ptiority_0[PFB_ENTRY:0])
  9'b?_????_???1:pfu_biu_pe_req_ptr_priority_0[0]  = 1'b1;
  9'b?_????_??10:pfu_biu_pe_req_ptr_priority_0[1]  = 1'b1;
  9'b?_????_?100:pfu_biu_pe_req_ptr_priority_0[2]  = 1'b1;
  9'b?_????_1000:pfu_biu_pe_req_ptr_priority_0[3]  = 1'b1;
  9'b?_???1_0000:pfu_biu_pe_req_ptr_priority_0[4]  = 1'b1;
  9'b?_??10_0000:pfu_biu_pe_req_ptr_priority_0[5]  = 1'b1;
  9'b?_?100_0000:pfu_biu_pe_req_ptr_priority_0[6]  = 1'b1;
  9'b?_1000_0000:pfu_biu_pe_req_ptr_priority_0[7]  = 1'b1;
  9'b1_0000_0000:pfu_biu_pe_req_ptr_priority_0[8]  = 1'b1;
  default:pfu_biu_pe_req_ptr_priority_0[PFB_ENTRY:0] = {PFB_ENTRY+1{1'b0}};
endcase
// &CombEnd; @608
end

// &CombBeg; @610
always @( pfu_all_pfb_biu_pe_req_ptiority_1[8:0])
begin
pfu_biu_pe_req_ptr_priority_1[PFB_ENTRY:0] = {PFB_ENTRY+1{1'b0}};
casez(pfu_all_pfb_biu_pe_req_ptiority_1[PFB_ENTRY:0])
  9'b?_????_???1:pfu_biu_pe_req_ptr_priority_1[0]  = 1'b1;
  9'b?_????_??10:pfu_biu_pe_req_ptr_priority_1[1]  = 1'b1;
  9'b?_????_?100:pfu_biu_pe_req_ptr_priority_1[2]  = 1'b1;
  9'b?_????_1000:pfu_biu_pe_req_ptr_priority_1[3]  = 1'b1;
  9'b?_???1_0000:pfu_biu_pe_req_ptr_priority_1[4]  = 1'b1;
  9'b?_??10_0000:pfu_biu_pe_req_ptr_priority_1[5]  = 1'b1;
  9'b?_?100_0000:pfu_biu_pe_req_ptr_priority_1[6]  = 1'b1;
  9'b?_1000_0000:pfu_biu_pe_req_ptr_priority_1[7]  = 1'b1;
  9'b1_0000_0000:pfu_biu_pe_req_ptr_priority_1[8]  = 1'b1;
  default:pfu_biu_pe_req_ptr_priority_1[PFB_ENTRY:0] = {PFB_ENTRY+1{1'b0}};
endcase
// &CombEnd; @624
end

assign pfu_biu_pe_req_ptr[PFB_ENTRY:0]  = pfu_biu_pe_req_ptiority_0
                                          ? pfu_biu_pe_req_ptr_priority_0[PFB_ENTRY:0]
                                          : pfu_biu_pe_req_ptr_priority_1[PFB_ENTRY:0];

//------------sel info to pop entry---------------
assign pfu_biu_l1_pe_req_addr_tto6[`PA_WIDTH-7:0] =
                {`PA_WIDTH-6{pfu_biu_pe_req_ptr[0]}} & pfu_pfb_entry_l1_pf_addr_0[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[1]}} & pfu_pfb_entry_l1_pf_addr_1[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[2]}} & pfu_pfb_entry_l1_pf_addr_2[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[3]}} & pfu_pfb_entry_l1_pf_addr_3[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[4]}} & pfu_pfb_entry_l1_pf_addr_4[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[5]}} & pfu_pfb_entry_l1_pf_addr_5[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[6]}} & pfu_pfb_entry_l1_pf_addr_6[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[7]}} & pfu_pfb_entry_l1_pf_addr_7[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[8]}} & pfu_gpfb_l1_pf_addr[`PA_WIDTH-1:6];

assign pfu_biu_l2_pe_req_addr_tto6[`PA_WIDTH-7:0] =
                {`PA_WIDTH-6{pfu_biu_pe_req_ptr[0]}} & pfu_pfb_entry_l2_pf_addr_0[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[1]}} & pfu_pfb_entry_l2_pf_addr_1[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[2]}} & pfu_pfb_entry_l2_pf_addr_2[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[3]}} & pfu_pfb_entry_l2_pf_addr_3[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[4]}} & pfu_pfb_entry_l2_pf_addr_4[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[5]}} & pfu_pfb_entry_l2_pf_addr_5[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[6]}} & pfu_pfb_entry_l2_pf_addr_6[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[7]}} & pfu_pfb_entry_l2_pf_addr_7[`PA_WIDTH-1:6]
                | {`PA_WIDTH-6{pfu_biu_pe_req_ptr[8]}} & pfu_gpfb_l2_pf_addr[`PA_WIDTH-1:6];

assign pfu_biu_l1_pe_req_page_sec   = |(pfu_biu_pe_req_ptr[PFB_ENTRY:0]
                                        & {pfu_gpfb_l1_page_sec,
                                          pfu_pfb_entry_l1_page_sec[PFB_ENTRY-1:0]});
assign pfu_biu_l2_pe_req_page_sec   = |(pfu_biu_pe_req_ptr[PFB_ENTRY:0]
                                        & {pfu_gpfb_l2_page_sec,
                                          pfu_pfb_entry_l2_page_sec[PFB_ENTRY-1:0]});
assign pfu_biu_l1_pe_req_page_share = |(pfu_biu_pe_req_ptr[PFB_ENTRY:0]
                                        & {pfu_gpfb_l1_page_share,
                                          pfu_pfb_entry_l1_page_share[PFB_ENTRY-1:0]});
assign pfu_biu_l2_pe_req_page_share = |(pfu_biu_pe_req_ptr[PFB_ENTRY:0]
                                        & {pfu_gpfb_l2_page_share,
                                          pfu_pfb_entry_l2_page_share[PFB_ENTRY-1:0]});


assign pfu_biu_pe_req_src[1:0]  = {2{pfu_biu_pe_req_ptr[0]}}  & pfu_pfb_entry_biu_pe_req_src_0[1:0]
                                  | {2{pfu_biu_pe_req_ptr[1]}}  & pfu_pfb_entry_biu_pe_req_src_1[1:0]
                                  | {2{pfu_biu_pe_req_ptr[2]}}  & pfu_pfb_entry_biu_pe_req_src_2[1:0]
                                  | {2{pfu_biu_pe_req_ptr[3]}}  & pfu_pfb_entry_biu_pe_req_src_3[1:0]
                                  | {2{pfu_biu_pe_req_ptr[4]}}  & pfu_pfb_entry_biu_pe_req_src_4[1:0]
                                  | {2{pfu_biu_pe_req_ptr[5]}}  & pfu_pfb_entry_biu_pe_req_src_5[1:0]
                                  | {2{pfu_biu_pe_req_ptr[6]}}  & pfu_pfb_entry_biu_pe_req_src_6[1:0]
                                  | {2{pfu_biu_pe_req_ptr[7]}}  & pfu_pfb_entry_biu_pe_req_src_7[1:0]
                                  | {2{pfu_biu_pe_req_ptr[8]}}  & pfu_gpfb_biu_pe_req_src[1:0];

assign pfu_biu_pe_req_sel_l1    = pfu_biu_pe_req_src[0] &&  !lfb_addr_less2;

assign pfu_biu_pe_req_addr_tto6[`PA_WIDTH-7:0]  = pfu_biu_pe_req_sel_l1
                                                  ? pfu_biu_l1_pe_req_addr_tto6[`PA_WIDTH-7:0]
                                                  : pfu_biu_l2_pe_req_addr_tto6[`PA_WIDTH-7:0];


assign pfu_biu_pe_req_page_sec    = pfu_biu_pe_req_sel_l1
                                    ? pfu_biu_l1_pe_req_page_sec
                                    : pfu_biu_l2_pe_req_page_sec;
assign pfu_biu_pe_req_page_share  = pfu_biu_pe_req_sel_l1
                                    ? pfu_biu_l1_pe_req_page_share
                                    : pfu_biu_l2_pe_req_page_share;

assign pfu_biu_pe_req_priv_mode[1:0]  = {2{pfu_biu_pe_req_ptr[0]}}  & pfu_pfb_entry_priv_mode_0[1:0]
                                        | {2{pfu_biu_pe_req_ptr[1]}}  & pfu_pfb_entry_priv_mode_1[1:0]
                                        | {2{pfu_biu_pe_req_ptr[2]}}  & pfu_pfb_entry_priv_mode_2[1:0]
                                        | {2{pfu_biu_pe_req_ptr[3]}}  & pfu_pfb_entry_priv_mode_3[1:0]
                                        | {2{pfu_biu_pe_req_ptr[4]}}  & pfu_pfb_entry_priv_mode_4[1:0]
                                        | {2{pfu_biu_pe_req_ptr[5]}}  & pfu_pfb_entry_priv_mode_5[1:0]
                                        | {2{pfu_biu_pe_req_ptr[6]}}  & pfu_pfb_entry_priv_mode_6[1:0]
                                        | {2{pfu_biu_pe_req_ptr[7]}}  & pfu_pfb_entry_priv_mode_7[1:0]
                                        | {2{pfu_biu_pe_req_ptr[8]}}  & pfu_gpfb_priv_mode[1:0];

//----------------priority_next---------------
//set pfu_biu_pe_req_ptr 0~x to 1
assign pfu_biu_req_priority_next[PFB_ENTRY:0] = {PFB_ENTRY+1{pfu_biu_pe_req_ptr[0]}} & 9'b0_0000_0001
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[1]}} & 9'b0_0000_0011
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[2]}} & 9'b0_0000_0111
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[3]}} & 9'b0_0000_1111
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[4]}} & 9'b0_0001_1111
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[5]}} & 9'b0_0011_1111
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[6]}} & 9'b0_0111_1111
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[7]}} & 9'b0_1111_1111
                                                | {PFB_ENTRY+1{pfu_biu_pe_req_ptr[8]}} & 9'b1_1111_1111;

//--------------------page_sel------------------------------
//--------------------hit index signal----------------------
assign pfu_biu_req_addr[`PA_WIDTH-1:0] = {pfu_biu_req_addr_tto6[`PA_WIDTH-7:0],6'b0};

assign pfu_biu_req_hit_idx    = ld_da_pfu_biu_req_hit_idx
                                ||  st_da_pfu_biu_req_hit_idx
                                ||  lfb_pfu_biu_req_hit_idx
                                ||  vb_pfu_biu_req_hit_idx
                                ||  rb_pfu_biu_req_hit_idx
                                ||  wmb_pfu_biu_req_hit_idx
                                ||  lm_pfu_biu_req_hit_idx;

//----------------------req bus_arb-------------------------
// &Force("output","pfu_biu_ar_req"); @726
assign pfu_biu_ar_req   = pfu_biu_req_unmask
                          &&  !cp0_lsu_no_op_req
                          &&  (!pfu_biu_req_hit_idx
                                  &&  !lfb_addr_full
                                  &&  (lfb_pfu_rready_grnt
                                       || rb_pfu_nc_no_pending)
                               || !pfu_biu_req_l1);

assign pfu_biu_ar_dp_req= pfu_biu_req_unmask
                          &&  !cp0_lsu_no_op_req
                          &&  (!lfb_addr_full
                                  &&  (lfb_pfu_rready_grnt
                                       || rb_pfu_nc_no_pending)
                               || !pfu_biu_req_l1);

assign pfu_biu_ar_req_gateclk_en = pfu_biu_req_unmask;
assign pfu_biu_ar_id[4:0]     = pfu_biu_req_l1
                                ? lfb_pfu_create_id[4:0]
                                : BIU_R_L2PREF_ID;

assign pfu_biu_ar_addr[`PA_WIDTH-1:0]  = {pfu_biu_req_addr_tto6[`PA_WIDTH-7:0],6'b0};
//1 dcache line
assign pfu_biu_ar_len[1:0]    = 2'b11;
//128bits
assign pfu_biu_ar_size[2:0]   = 3'b100;
//increase
assign pfu_biu_ar_burst[1:0]  = 2'b10;
//not exclusive
assign pfu_biu_ar_lock        = 1'b0;
//cacheable,weak order, bufferable
assign pfu_biu_ar_cache[3:0]  = 4'b1111;

assign pfu_biu_ar_prot[2:0]   = {1'b0,
                                pfu_biu_req_page_sec,
                                pfu_biu_req_priv_mode[0]};

assign pfu_biu_ar_user[2:0]   = {!pfu_biu_req_l1,cp0_yy_priv_mode[1],1'b0};
//-------------ar snoop-----------------
//assign pfu_biu_req_l1_page_share  = pfu_biu_req_page_share && pfu_biu_req_l1;
assign pfu_biu_ar_snoop[3:0]  = pfu_biu_req_page_share
                                ? 4'b0001 //ReadShared
                                : 4'b0000;//ReadNoSnoop
assign pfu_biu_ar_domain[1:0] = {1'b0,pfu_biu_req_page_share};

assign pfu_biu_ar_bar[1:0]    = 2'b10;

//------------------------req lfb---------------------------
assign pfu_lfb_id[3:0]            = {4{pfu_biu_req_ptr[0]}} & 4'd0
                                    | {4{pfu_biu_req_ptr[1]}} & 4'd1
                                    | {4{pfu_biu_req_ptr[2]}} & 4'd2
                                    | {4{pfu_biu_req_ptr[3]}} & 4'd3
                                    | {4{pfu_biu_req_ptr[4]}} & 4'd4
                                    | {4{pfu_biu_req_ptr[5]}} & 4'd5
                                    | {4{pfu_biu_req_ptr[6]}} & 4'd6
                                    | {4{pfu_biu_req_ptr[7]}} & 4'd7
                                    | {4{pfu_biu_req_ptr[8]}} & 4'd8;

assign pfu_lfb_create_req         = pfu_biu_req_unmask
                                    &&  pfu_biu_req_l1;
assign pfu_lfb_create_vld         = pfu_biu_ar_req
                                    &&  pfu_biu_req_l1
                                    &&  bus_arb_pfu_ar_ready;
assign pfu_lfb_create_dp_vld      = pfu_biu_ar_req
                                    &&  pfu_biu_req_l1;
assign pfu_lfb_create_gateclk_en  = pfu_biu_req_unmask
                                    &&  pfu_biu_req_l1;
//---------------------lfb back signal----------------------
assign pfu_gpfb_from_lfb_dcache_hit                       = lfb_pfu_dcache_hit[8];
assign pfu_pfb_entry_from_lfb_dcache_hit[PFB_ENTRY-1:0]   = lfb_pfu_dcache_hit[PFB_ENTRY-1:0];
assign pfu_gpfb_from_lfb_dcache_miss                      = lfb_pfu_dcache_miss[8];
assign pfu_pfb_entry_from_lfb_dcache_miss[PFB_ENTRY-1:0]  = lfb_pfu_dcache_miss[PFB_ENTRY-1:0];

//==========================================================
//                  Generate pop signal
//==========================================================
assign pfu_dcache_pref_en = cp0_lsu_dcache_en &&  cp0_lsu_dcache_pref_en;
assign pfu_l2_pref_en     = cp0_lsu_l2_pref_en;  //l2 is always enabled
//broad cp0_yy_dcache_pref_en means l1 or l2
//cp0_lsu_dcache_pref_en means l1
//cp0_lsu_l2_pref_en means l2
assign pfu_pop_all_vld  = !icc_idle
                          ||  !(pfu_dcache_pref_en
                                ||  pfu_l2_pref_en)
                          ||  cp0_lsu_no_op_req
                          ||  sq_pfu_pop_synci_inst;
assign pfu_pop_all_part_vld = pfu_pop_all_vld
                              ||  pfu_gpfb_vld;

assign pfu_pmb_empty    = !(|pfu_pmb_entry_vld[PMB_ENTRY-1:0]);
// &Force("output","pfu_sdb_empty"); @816
assign pfu_sdb_empty    = !(|pfu_sdb_entry_vld[SDB_ENTRY-1:0]);
// &Force("output","pfu_pfb_empty"); @818
assign pfu_pfb_empty    = !(|pfu_pfb_entry_vld[PFB_ENTRY-1:0]);
assign pfu_icc_ready    = !pfu_biu_req_unmask;
assign pfu_part_empty   = pfu_pmb_empty
                          &&  pfu_sdb_empty
                          &&  pfu_pfb_empty;
//==========================================================
//                  for cp0 control
//==========================================================
//timeout cnt
// &Force("bus","cp0_lsu_timeout_cnt",29,0); @828
assign pmb_timeout_cnt_val[7:0] = cp0_lsu_timeout_cnt[7:0]; 
assign sdb_timeout_cnt_val[7:0] = cp0_lsu_timeout_cnt[15:8];
assign pfb_timeout_cnt_val[7:0] = cp0_lsu_timeout_cnt[23:16]; 
assign pfb_no_req_cnt_val[5:0]  = cp0_lsu_timeout_cnt[29:24];

// &ModuleEnd; @834
endmodule


