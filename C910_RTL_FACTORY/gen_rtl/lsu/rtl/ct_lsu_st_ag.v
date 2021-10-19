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
module ct_lsu_st_ag(
  ag_dcache_arb_st_dirty_gateclk_en,
  ag_dcache_arb_st_dirty_idx,
  ag_dcache_arb_st_dirty_req,
  ag_dcache_arb_st_tag_gateclk_en,
  ag_dcache_arb_st_tag_idx,
  ag_dcache_arb_st_tag_req,
  cp0_lsu_dcache_en,
  cp0_lsu_icg_en,
  cp0_lsu_mm,
  cp0_lsu_tvm,
  cp0_lsu_ucme,
  cp0_lsu_wa,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cp0_yy_virtual_mode,
  cpurst_b,
  ctrl_st_clk,
  dcache_arb_ag_st_sel,
  dcache_arb_st_ag_addr,
  dcache_arb_st_ag_borrow_addr_vld,
  forever_cpuclk,
  idu_lsu_rf_pipe4_already_da,
  idu_lsu_rf_pipe4_atomic,
  idu_lsu_rf_pipe4_bkpta_data,
  idu_lsu_rf_pipe4_bkptb_data,
  idu_lsu_rf_pipe4_fence_mode,
  idu_lsu_rf_pipe4_gateclk_sel,
  idu_lsu_rf_pipe4_icc,
  idu_lsu_rf_pipe4_iid,
  idu_lsu_rf_pipe4_inst_code,
  idu_lsu_rf_pipe4_inst_fls,
  idu_lsu_rf_pipe4_inst_flush,
  idu_lsu_rf_pipe4_inst_mode,
  idu_lsu_rf_pipe4_inst_share,
  idu_lsu_rf_pipe4_inst_size,
  idu_lsu_rf_pipe4_inst_str,
  idu_lsu_rf_pipe4_inst_type,
  idu_lsu_rf_pipe4_lch_entry,
  idu_lsu_rf_pipe4_lsfifo,
  idu_lsu_rf_pipe4_mmu_req,
  idu_lsu_rf_pipe4_no_spec,
  idu_lsu_rf_pipe4_off_0_extend,
  idu_lsu_rf_pipe4_offset,
  idu_lsu_rf_pipe4_offset_plus,
  idu_lsu_rf_pipe4_oldest,
  idu_lsu_rf_pipe4_pc,
  idu_lsu_rf_pipe4_sdiq_entry,
  idu_lsu_rf_pipe4_sel,
  idu_lsu_rf_pipe4_shift,
  idu_lsu_rf_pipe4_spec_fail,
  idu_lsu_rf_pipe4_split,
  idu_lsu_rf_pipe4_src0,
  idu_lsu_rf_pipe4_src1,
  idu_lsu_rf_pipe4_st,
  idu_lsu_rf_pipe4_staddr,
  idu_lsu_rf_pipe4_sync_fence,
  idu_lsu_rf_pipe4_unalign_2nd,
  lm_addr_pa,
  lm_page_buf,
  lm_page_ca,
  lm_page_sec,
  lm_page_share,
  lm_page_so,
  lsu_hpcp_st_cross_4k_stall,
  lsu_hpcp_st_other_stall,
  lsu_idu_st_ag_wait_old,
  lsu_idu_st_ag_wait_old_gateclk_en,
  lsu_mmu_abort1,
  lsu_mmu_id1,
  lsu_mmu_st_inst1,
  lsu_mmu_stamo_pa,
  lsu_mmu_stamo_vld,
  lsu_mmu_va1,
  lsu_mmu_va1_vld,
  mmu_lsu_buf1,
  mmu_lsu_ca1,
  mmu_lsu_pa1,
  mmu_lsu_pa1_vld,
  mmu_lsu_page_fault1,
  mmu_lsu_sec1,
  mmu_lsu_sh1,
  mmu_lsu_so1,
  mmu_lsu_stall1,
  pad_yy_icg_scan_en,
  rtu_yy_xx_commit0,
  rtu_yy_xx_commit0_iid,
  rtu_yy_xx_commit1,
  rtu_yy_xx_commit1_iid,
  rtu_yy_xx_commit2,
  rtu_yy_xx_commit2_iid,
  rtu_yy_xx_dbgon,
  rtu_yy_xx_flush,
  st_ag_already_da,
  st_ag_atomic,
  st_ag_boundary,
  st_ag_dc_access_size,
  st_ag_dc_addr0,
  st_ag_dc_bytes_vld,
  st_ag_dc_inst_vld,
  st_ag_dc_mmu_req,
  st_ag_dc_page_share,
  st_ag_dc_rot_sel,
  st_ag_expt_access_fault_with_page,
  st_ag_expt_illegal_inst,
  st_ag_expt_misalign_no_page,
  st_ag_expt_misalign_with_page,
  st_ag_expt_page_fault,
  st_ag_expt_stamo_not_ca,
  st_ag_expt_vld,
  st_ag_fence_mode,
  st_ag_icc,
  st_ag_iid,
  st_ag_inst_flush,
  st_ag_inst_mode,
  st_ag_inst_type,
  st_ag_inst_vld,
  st_ag_lsfifo,
  st_ag_lsid,
  st_ag_lsiq_bkpta_data,
  st_ag_lsiq_bkptb_data,
  st_ag_lsiq_spec_fail,
  st_ag_mt_value,
  st_ag_no_spec,
  st_ag_old,
  st_ag_page_buf,
  st_ag_page_ca,
  st_ag_page_sec,
  st_ag_page_so,
  st_ag_page_wa,
  st_ag_pc,
  st_ag_sdid_oh,
  st_ag_secd,
  st_ag_split,
  st_ag_st,
  st_ag_staddr,
  st_ag_stall_ori,
  st_ag_stall_restart_entry,
  st_ag_sync_fence,
  st_ag_utlb_miss,
  st_ag_vpn,
  st_rf_inst_vld
);

// &Ports; @29
input           cp0_lsu_dcache_en;                  
input           cp0_lsu_icg_en;                     
input           cp0_lsu_mm;                         
input           cp0_lsu_tvm;                        
input           cp0_lsu_ucme;                       
input           cp0_lsu_wa;                         
input           cp0_yy_clk_en;                      
input   [1 :0]  cp0_yy_priv_mode;                   
input           cp0_yy_virtual_mode;                
input           cpurst_b;                           
input           ctrl_st_clk;                        
input           dcache_arb_ag_st_sel;               
input   [39:0]  dcache_arb_st_ag_addr;              
input           dcache_arb_st_ag_borrow_addr_vld;   
input           forever_cpuclk;                     
input           idu_lsu_rf_pipe4_already_da;        
input           idu_lsu_rf_pipe4_atomic;            
input           idu_lsu_rf_pipe4_bkpta_data;        
input           idu_lsu_rf_pipe4_bkptb_data;        
input   [3 :0]  idu_lsu_rf_pipe4_fence_mode;        
input           idu_lsu_rf_pipe4_gateclk_sel;       
input           idu_lsu_rf_pipe4_icc;               
input   [6 :0]  idu_lsu_rf_pipe4_iid;               
input   [31:0]  idu_lsu_rf_pipe4_inst_code;         
input           idu_lsu_rf_pipe4_inst_fls;          
input           idu_lsu_rf_pipe4_inst_flush;        
input   [1 :0]  idu_lsu_rf_pipe4_inst_mode;         
input           idu_lsu_rf_pipe4_inst_share;        
input   [1 :0]  idu_lsu_rf_pipe4_inst_size;         
input           idu_lsu_rf_pipe4_inst_str;          
input   [1 :0]  idu_lsu_rf_pipe4_inst_type;         
input   [11:0]  idu_lsu_rf_pipe4_lch_entry;         
input           idu_lsu_rf_pipe4_lsfifo;            
input           idu_lsu_rf_pipe4_mmu_req;           
input           idu_lsu_rf_pipe4_no_spec;           
input           idu_lsu_rf_pipe4_off_0_extend;      
input   [11:0]  idu_lsu_rf_pipe4_offset;            
input   [12:0]  idu_lsu_rf_pipe4_offset_plus;       
input           idu_lsu_rf_pipe4_oldest;            
input   [14:0]  idu_lsu_rf_pipe4_pc;                
input   [11:0]  idu_lsu_rf_pipe4_sdiq_entry;        
input           idu_lsu_rf_pipe4_sel;               
input   [3 :0]  idu_lsu_rf_pipe4_shift;             
input           idu_lsu_rf_pipe4_spec_fail;         
input           idu_lsu_rf_pipe4_split;             
input   [63:0]  idu_lsu_rf_pipe4_src0;              
input   [63:0]  idu_lsu_rf_pipe4_src1;              
input           idu_lsu_rf_pipe4_st;                
input           idu_lsu_rf_pipe4_staddr;            
input           idu_lsu_rf_pipe4_sync_fence;        
input           idu_lsu_rf_pipe4_unalign_2nd;       
input   [27:0]  lm_addr_pa;                         
input           lm_page_buf;                        
input           lm_page_ca;                         
input           lm_page_sec;                        
input           lm_page_share;                      
input           lm_page_so;                         
input           mmu_lsu_buf1;                       
input           mmu_lsu_ca1;                        
input   [27:0]  mmu_lsu_pa1;                        
input           mmu_lsu_pa1_vld;                    
input           mmu_lsu_page_fault1;                
input           mmu_lsu_sec1;                       
input           mmu_lsu_sh1;                        
input           mmu_lsu_so1;                        
input           mmu_lsu_stall1;                     
input           pad_yy_icg_scan_en;                 
input           rtu_yy_xx_commit0;                  
input   [6 :0]  rtu_yy_xx_commit0_iid;              
input           rtu_yy_xx_commit1;                  
input   [6 :0]  rtu_yy_xx_commit1_iid;              
input           rtu_yy_xx_commit2;                  
input   [6 :0]  rtu_yy_xx_commit2_iid;              
input           rtu_yy_xx_dbgon;                    
input           rtu_yy_xx_flush;                    
output          ag_dcache_arb_st_dirty_gateclk_en;  
output  [8 :0]  ag_dcache_arb_st_dirty_idx;         
output          ag_dcache_arb_st_dirty_req;         
output          ag_dcache_arb_st_tag_gateclk_en;    
output  [8 :0]  ag_dcache_arb_st_tag_idx;           
output          ag_dcache_arb_st_tag_req;           
output          lsu_hpcp_st_cross_4k_stall;         
output          lsu_hpcp_st_other_stall;            
output  [11:0]  lsu_idu_st_ag_wait_old;             
output          lsu_idu_st_ag_wait_old_gateclk_en;  
output          lsu_mmu_abort1;                     
output  [6 :0]  lsu_mmu_id1;                        
output          lsu_mmu_st_inst1;                   
output  [27:0]  lsu_mmu_stamo_pa;                   
output          lsu_mmu_stamo_vld;                  
output  [63:0]  lsu_mmu_va1;                        
output          lsu_mmu_va1_vld;                    
output          st_ag_already_da;                   
output          st_ag_atomic;                       
output          st_ag_boundary;                     
output  [2 :0]  st_ag_dc_access_size;               
output  [39:0]  st_ag_dc_addr0;                     
output  [15:0]  st_ag_dc_bytes_vld;                 
output          st_ag_dc_inst_vld;                  
output          st_ag_dc_mmu_req;                   
output          st_ag_dc_page_share;                
output  [3 :0]  st_ag_dc_rot_sel;                   
output          st_ag_expt_access_fault_with_page;  
output          st_ag_expt_illegal_inst;            
output          st_ag_expt_misalign_no_page;        
output          st_ag_expt_misalign_with_page;      
output          st_ag_expt_page_fault;              
output          st_ag_expt_stamo_not_ca;            
output          st_ag_expt_vld;                     
output  [3 :0]  st_ag_fence_mode;                   
output          st_ag_icc;                          
output  [6 :0]  st_ag_iid;                          
output          st_ag_inst_flush;                   
output  [1 :0]  st_ag_inst_mode;                    
output  [1 :0]  st_ag_inst_type;                    
output          st_ag_inst_vld;                     
output          st_ag_lsfifo;                       
output  [11:0]  st_ag_lsid;                         
output          st_ag_lsiq_bkpta_data;              
output          st_ag_lsiq_bkptb_data;              
output          st_ag_lsiq_spec_fail;               
output  [39:0]  st_ag_mt_value;                     
output          st_ag_no_spec;                      
output          st_ag_old;                          
output          st_ag_page_buf;                     
output          st_ag_page_ca;                      
output          st_ag_page_sec;                     
output          st_ag_page_so;                      
output          st_ag_page_wa;                      
output  [14:0]  st_ag_pc;                           
output  [11:0]  st_ag_sdid_oh;                      
output          st_ag_secd;                         
output          st_ag_split;                        
output          st_ag_st;                           
output          st_ag_staddr;                       
output          st_ag_stall_ori;                    
output  [11:0]  st_ag_stall_restart_entry;          
output          st_ag_sync_fence;                   
output          st_ag_utlb_miss;                    
output  [27:0]  st_ag_vpn;                          
output          st_rf_inst_vld;                     

// &Regs; @30
reg     [3 :0]  st_ag_access_size_ori;              
reg             st_ag_align;                        
reg             st_ag_already_cross_page_str_imme;  
reg             st_ag_already_da;                   
reg             st_ag_atomic;                       
reg     [63:0]  st_ag_base;                         
reg     [2 :0]  st_ag_dc_access_size;               
reg     [3 :0]  st_ag_fence_mode;                   
reg             st_ag_icc;                          
reg     [6 :0]  st_ag_iid;                          
reg     [31:0]  st_ag_inst_code;                    
reg             st_ag_inst_fls;                     
reg             st_ag_inst_flush;                   
reg     [1 :0]  st_ag_inst_mode;                    
reg             st_ag_inst_share;                   
reg     [1 :0]  st_ag_inst_size;                    
reg             st_ag_inst_str;                     
reg     [1 :0]  st_ag_inst_type;                    
reg             st_ag_inst_vld;                     
reg     [15:0]  st_ag_le_bytes_vld_high_bits_full;  
reg     [15:0]  st_ag_le_bytes_vld_low_bits_full;   
reg             st_ag_lsfifo;                       
reg     [11:0]  st_ag_lsid;                         
reg             st_ag_lsiq_bkpta_data;              
reg             st_ag_lsiq_bkptb_data;              
reg             st_ag_lsiq_spec_fail;               
reg             st_ag_mmu_req;                      
reg     [39:0]  st_ag_mt_value;                     
reg             st_ag_no_spec;                      
reg     [63:0]  st_ag_offset;                       
reg     [12:0]  st_ag_offset_plus;                  
reg     [3 :0]  st_ag_offset_shift;                 
reg             st_ag_old;                          
reg     [14:0]  st_ag_pc;                           
reg     [11:0]  st_ag_sdid_oh;                      
reg             st_ag_secd;                         
reg             st_ag_split;                        
reg             st_ag_st;                           
reg             st_ag_staddr;                       
reg             st_ag_sync_fence;                   

// &Wires; @31
wire            ag_dcache_arb_st_dirty_gateclk_en;  
wire    [8 :0]  ag_dcache_arb_st_dirty_idx;         
wire            ag_dcache_arb_st_dirty_req;         
wire            ag_dcache_arb_st_gateclk_en;        
wire            ag_dcache_arb_st_req;               
wire            ag_dcache_arb_st_tag_gateclk_en;    
wire    [8 :0]  ag_dcache_arb_st_tag_idx;           
wire            ag_dcache_arb_st_tag_req;           
wire            cp0_lsu_dcache_en;                  
wire            cp0_lsu_icg_en;                     
wire            cp0_lsu_mm;                         
wire            cp0_lsu_tvm;                        
wire            cp0_lsu_ucme;                       
wire            cp0_lsu_wa;                         
wire            cp0_yy_clk_en;                      
wire    [1 :0]  cp0_yy_priv_mode;                   
wire            cp0_yy_virtual_mode;                
wire            cpurst_b;                           
wire            ctrl_st_clk;                        
wire            dcache_arb_ag_st_sel;               
wire    [39:0]  dcache_arb_st_ag_addr;              
wire            dcache_arb_st_ag_borrow_addr_vld;   
wire            forever_cpuclk;                     
wire            idu_lsu_rf_pipe4_already_da;        
wire            idu_lsu_rf_pipe4_atomic;            
wire            idu_lsu_rf_pipe4_bkpta_data;        
wire            idu_lsu_rf_pipe4_bkptb_data;        
wire    [3 :0]  idu_lsu_rf_pipe4_fence_mode;        
wire            idu_lsu_rf_pipe4_gateclk_sel;       
wire            idu_lsu_rf_pipe4_icc;               
wire    [6 :0]  idu_lsu_rf_pipe4_iid;               
wire    [31:0]  idu_lsu_rf_pipe4_inst_code;         
wire            idu_lsu_rf_pipe4_inst_fls;          
wire            idu_lsu_rf_pipe4_inst_flush;        
wire    [1 :0]  idu_lsu_rf_pipe4_inst_mode;         
wire            idu_lsu_rf_pipe4_inst_share;        
wire    [1 :0]  idu_lsu_rf_pipe4_inst_size;         
wire            idu_lsu_rf_pipe4_inst_str;          
wire    [1 :0]  idu_lsu_rf_pipe4_inst_type;         
wire    [11:0]  idu_lsu_rf_pipe4_lch_entry;         
wire            idu_lsu_rf_pipe4_lsfifo;            
wire            idu_lsu_rf_pipe4_mmu_req;           
wire            idu_lsu_rf_pipe4_no_spec;           
wire            idu_lsu_rf_pipe4_off_0_extend;      
wire    [11:0]  idu_lsu_rf_pipe4_offset;            
wire    [12:0]  idu_lsu_rf_pipe4_offset_plus;       
wire            idu_lsu_rf_pipe4_oldest;            
wire    [14:0]  idu_lsu_rf_pipe4_pc;                
wire    [11:0]  idu_lsu_rf_pipe4_sdiq_entry;        
wire            idu_lsu_rf_pipe4_sel;               
wire    [3 :0]  idu_lsu_rf_pipe4_shift;             
wire            idu_lsu_rf_pipe4_spec_fail;         
wire            idu_lsu_rf_pipe4_split;             
wire    [63:0]  idu_lsu_rf_pipe4_src0;              
wire    [63:0]  idu_lsu_rf_pipe4_src1;              
wire            idu_lsu_rf_pipe4_st;                
wire            idu_lsu_rf_pipe4_staddr;            
wire            idu_lsu_rf_pipe4_sync_fence;        
wire            idu_lsu_rf_pipe4_unalign_2nd;       
wire    [27:0]  lm_addr_pa;                         
wire            lm_page_buf;                        
wire            lm_page_ca;                         
wire            lm_page_sec;                        
wire            lm_page_share;                      
wire            lm_page_so;                         
wire            lsu_hpcp_st_cross_4k_stall;         
wire            lsu_hpcp_st_other_stall;            
wire    [11:0]  lsu_idu_st_ag_wait_old;             
wire            lsu_idu_st_ag_wait_old_gateclk_en;  
wire            lsu_mmu_abort1;                     
wire    [6 :0]  lsu_mmu_id1;                        
wire            lsu_mmu_st_inst1;                   
wire    [27:0]  lsu_mmu_stamo_pa;                   
wire            lsu_mmu_stamo_vld;                  
wire    [63:0]  lsu_mmu_va1;                        
wire            lsu_mmu_va1_vld;                    
wire            mmu_lsu_buf1;                       
wire            mmu_lsu_ca1;                        
wire    [27:0]  mmu_lsu_pa1;                        
wire            mmu_lsu_pa1_vld;                    
wire            mmu_lsu_page_fault1;                
wire            mmu_lsu_sec1;                       
wire            mmu_lsu_sh1;                        
wire            mmu_lsu_so1;                        
wire            mmu_lsu_stall1;                     
wire            pad_yy_icg_scan_en;                 
wire            rf_iid_older_than_st_ag;            
wire            rtu_yy_xx_commit0;                  
wire    [6 :0]  rtu_yy_xx_commit0_iid;              
wire            rtu_yy_xx_commit1;                  
wire    [6 :0]  rtu_yy_xx_commit1_iid;              
wire            rtu_yy_xx_commit2;                  
wire    [6 :0]  rtu_yy_xx_commit2_iid;              
wire            rtu_yy_xx_dbgon;                    
wire            rtu_yy_xx_flush;                    
wire            st_ag_4k_sum_12;                    
wire    [12:0]  st_ag_4k_sum_ori;                   
wire    [12:0]  st_ag_4k_sum_plus;                  
wire    [3 :0]  st_ag_access_size;                  
wire    [39:0]  st_ag_addr;                         
wire            st_ag_atomic_no_cmit_restart_arb;   
wire            st_ag_atomic_no_cmit_restart_req;   
wire            st_ag_boundary;                     
wire            st_ag_boundary_stall;               
wire            st_ag_boundary_unmask;              
wire    [15:0]  st_ag_bytes_vld;                    
wire    [15:0]  st_ag_bytes_vld_high_cross_bits;    
wire    [15:0]  st_ag_bytes_vld_low_bits;           
wire            st_ag_clk;                          
wire            st_ag_clk_en;                       
wire            st_ag_cmit;                         
wire            st_ag_cmit_hit0;                    
wire            st_ag_cmit_hit1;                    
wire            st_ag_cmit_hit2;                    
wire            st_ag_cross_4k;                     
wire            st_ag_cross_page_str_imme_stall_arb; 
wire            st_ag_cross_page_str_imme_stall_req; 
wire    [39:0]  st_ag_dc_addr0;                     
wire    [15:0]  st_ag_dc_bytes_vld;                 
wire            st_ag_dc_inst_vld;                  
wire            st_ag_dc_mmu_req;                   
wire            st_ag_dc_page_share;                
wire    [3 :0]  st_ag_dc_rot_sel;                   
wire            st_ag_dcache_1line_inst;            
wire            st_ag_dcache_all_inst;              
wire            st_ag_dcache_inst;                  
wire            st_ag_dcache_pa_sw_inst;            
wire            st_ag_dcache_stall_req;             
wire            st_ag_dcache_stall_unmask;          
wire            st_ag_dcache_user_allow_inst;       
wire            st_ag_expt_access_fault_with_page;  
wire            st_ag_expt_illegal_inst;            
wire            st_ag_expt_misalign_no_page;        
wire            st_ag_expt_misalign_with_page;      
wire            st_ag_expt_page_fault;              
wire            st_ag_expt_stamo_not_ca;            
wire            st_ag_expt_vld;                     
wire            st_ag_fence_i_icache_all_inst;      
wire            st_ag_icache_all_inst;              
wire            st_ag_icache_inst;                  
wire            st_ag_icache_inv_va_inst;           
wire            st_ag_icc_inst;                     
wire            st_ag_inst_stall_gateclk_en;        
wire            st_ag_inst_vls;                     
wire            st_ag_l2cache_inst;                 
wire    [15:0]  st_ag_le_bytes_vld_cross;           
wire    [15:0]  st_ag_le_bytes_vld_high_cross_bits; 
wire    [11:0]  st_ag_mask_lsid;                    
wire            st_ag_mmu_stall_req;                
wire            st_ag_off_high_bits_all_0_ori;      
wire            st_ag_off_high_bits_all_1_ori;      
wire            st_ag_off_high_bits_not_eq;         
wire    [63:0]  st_ag_offset_aftershift;            
wire    [39:0]  st_ag_pa;                           
wire            st_ag_page_buf;                     
wire            st_ag_page_ca;                      
wire            st_ag_page_fault;                   
wire            st_ag_page_sec;                     
wire            st_ag_page_share;                   
wire            st_ag_page_so;                      
wire            st_ag_page_wa;                      
wire    [27:0]  st_ag_pn;                           
wire            st_ag_prvlg_obey;                   
wire    [15:0]  st_ag_st_bytes_vld;                 
wire            st_ag_st_inst;                      
wire            st_ag_stall_mask;                   
wire            st_ag_stall_ori;                    
wire            st_ag_stall_restart;                
wire    [11:0]  st_ag_stall_restart_entry;          
wire            st_ag_stall_vld;                    
wire            st_ag_stamo_inst;                   
wire            st_ag_statomic_inst;                
wire            st_ag_str_imme_stall;               
wire            st_ag_tlbi_all_inst;                
wire            st_ag_tlbi_inst;                    
wire            st_ag_unalign;                      
wire            st_ag_unalign_so;                   
wire            st_ag_utlb_miss;                    
wire    [63:0]  st_ag_va;                           
wire    [4 :0]  st_ag_va_add_access_size;           
wire    [39:0]  st_ag_va_am;                        
wire    [63:0]  st_ag_va_ori;                       
wire    [63:0]  st_ag_va_plus;                      
wire            st_ag_va_plus_sel;                  
wire    [27:0]  st_ag_vpn;                          
wire            st_rf_inst_str;                     
wire            st_rf_inst_vld;                     
wire            st_rf_off_0_extend;                 
wire            tcore_vld;                          


parameter BYTE        = 2'b00,
          HALF        = 2'b01,
          WORD        = 2'b10,
          DWORD       = 2'b11;

parameter LSIQ_ENTRY  = 12;
parameter PC_LEN      = 15;

//==========================================================
//                        RF signal
//==========================================================
// &Force("output","st_rf_inst_vld"); @44
assign st_rf_inst_vld     = idu_lsu_rf_pipe4_gateclk_sel;
assign st_rf_inst_str     = idu_lsu_rf_pipe4_inst_str;
assign st_rf_off_0_extend = idu_lsu_rf_pipe4_off_0_extend;
//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign st_ag_clk_en = idu_lsu_rf_pipe4_gateclk_sel || st_ag_inst_stall_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_st_ag_gated_clk"); @52
gated_clk_cell  x_lsu_st_ag_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (st_ag_clk         ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (st_ag_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @53
//          .external_en   (1'b0               ), @54
//          .global_en     (cp0_yy_clk_en      ), @55
//          .module_en     (cp0_lsu_icg_en     ), @56
//          .local_en      (st_ag_clk_en       ), @57
//          .clk_out       (st_ag_clk          )); @58

//==========================================================
//                 Pipeline Register
//==========================================================
//------------------control part----------------------------
//+----------+
//| inst_vld |
//+----------+
//if there is a stall in the AG stage ,the inst keep valid,
//elseif there is inst in RF stage and no flush,
//the inst goes to the AG stage next cycle

// &Force("output","st_ag_inst_vld"); @71
always @(posedge ctrl_st_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    st_ag_inst_vld  <=  1'b0;
  else if(rtu_yy_xx_flush)
    st_ag_inst_vld  <=  1'b0;
  else if (st_ag_stall_vld  ||  idu_lsu_rf_pipe4_sel)
    st_ag_inst_vld  <=  1'b1;
  else
    st_ag_inst_vld  <=  1'b0;
end

//------------------data part-------------------------------
//+-----------+-----------+-----------+------+------+------------+-----+-------+
//| inst_type | inst_size | inst_mode | sdid | secd | sync_fence | icc | share |
//+-----------+-----------+-----------+------+------+------------+-----+-------+
//+----------------+----+-----+------+---------+-----+-----------+------------+
//| unalign_permit | ex | iid | lsid | mmu_req | old | fdata_idx | already_da |
//+----------------+----+-----+------+---------+-----+-----------+------------+
//+----------------+------------+-------+
//| lsiq_spec_fail | inst_flush | split |
//+----------------+------------+-------+
//+-------+-------+
//| bkpta | bkptb |
//+-------+-------+
//if there is a stall in the AG stage ,the inst info keep unchanged,
//elseif there is inst in RF stage, the inst goes to the AG stage next cycle

// &Force("output","st_ag_split"); @100
// &Force("output","st_ag_inst_flush"); @101
// &Force("output","st_ag_inst_type"); @102
// //&Force("output","st_ag_inst_size"); @103
// &Force("output","st_ag_inst_mode"); @104
// &Force("output","st_ag_secd"); @105
// &Force("output","st_ag_sync_fence"); @106
// &Force("output","st_ag_icc"); @107
// &Force("output","st_ag_st"); @108
// &Force("output","st_ag_atomic"); @109
// &Force("output","st_ag_iid"); @110
// &Force("output","st_ag_lsid"); @111
// &Force("output","st_ag_sdid_oh"); @112
// &Force("output","st_ag_old"); @113
// &Force("output","st_ag_already_da"); @114
// &Force("output","st_ag_lsiq_spec_fail"); @115
// &Force("output","st_ag_lsiq_bkpta_data"); @116
// &Force("output","st_ag_lsiq_bkptb_data"); @117
// &Force("nonport","st_ag_inst_fls"); @118
// &Force("output","st_ag_pc"); @119
always @(posedge st_ag_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    st_ag_split                   <=  1'b0;
    st_ag_inst_flush              <=  1'b0;
    st_ag_inst_code[31:0]         <=  32'b0;
    st_ag_inst_type[1:0]          <=  2'b0;
    st_ag_inst_size[1:0]          <=  2'b0;
    st_ag_inst_mode[1:0]          <=  2'b0;
    st_ag_sync_fence              <=  1'b0;
    st_ag_fence_mode[3:0]         <=  4'b0;
    st_ag_inst_share              <=  1'b0;
    st_ag_st                      <=  1'b0;
    st_ag_icc                     <=  1'b0;
    st_ag_atomic                  <=  1'b0;
    st_ag_secd                    <=  1'b0;
    st_ag_iid[6:0]                <=  7'b0;
    st_ag_lsid[LSIQ_ENTRY-1:0]    <=  {LSIQ_ENTRY{1'b0}};
    st_ag_sdid_oh[LSIQ_ENTRY-1:0] <=  {LSIQ_ENTRY{1'b0}};
    st_ag_mmu_req                 <=  1'b0;
    st_ag_old                     <=  1'b0;
    st_ag_inst_str                <=  1'b0;
    st_ag_already_da              <=  1'b0;
    st_ag_lsiq_spec_fail          <=  1'b0;
    st_ag_lsiq_bkpta_data         <=  1'b0;
    st_ag_lsiq_bkptb_data         <=  1'b0;
    st_ag_inst_fls                <=  1'b0;
    st_ag_no_spec                 <=  1'b0;
    st_ag_staddr                  <=  1'b0;
    st_ag_pc[PC_LEN-1:0]          <=  {PC_LEN{1'b0}};
    st_ag_lsfifo                  <=  1'b0;
  end
  else if(!st_ag_stall_vld  &&  st_rf_inst_vld)
  begin
    st_ag_split                   <=  idu_lsu_rf_pipe4_split;
    st_ag_inst_flush              <=  idu_lsu_rf_pipe4_inst_flush;
    st_ag_inst_code[31:0]         <=  idu_lsu_rf_pipe4_inst_code[31:0];
    st_ag_inst_type[1:0]          <=  idu_lsu_rf_pipe4_inst_type[1:0];
    st_ag_inst_size[1:0]          <=  idu_lsu_rf_pipe4_inst_size[1:0];
    st_ag_inst_mode[1:0]          <=  idu_lsu_rf_pipe4_inst_mode[1:0];
    st_ag_sync_fence              <=  idu_lsu_rf_pipe4_sync_fence;
    st_ag_fence_mode[3:0]         <=  idu_lsu_rf_pipe4_fence_mode[3:0];
    st_ag_st                      <=  idu_lsu_rf_pipe4_st;
    st_ag_icc                     <=  idu_lsu_rf_pipe4_icc;
    st_ag_inst_share              <=  idu_lsu_rf_pipe4_inst_share;
    st_ag_atomic                  <=  idu_lsu_rf_pipe4_atomic;
    st_ag_secd                    <=  idu_lsu_rf_pipe4_unalign_2nd;
    st_ag_iid[6:0]                <=  idu_lsu_rf_pipe4_iid[6:0];
    st_ag_lsid[LSIQ_ENTRY-1:0]    <=  idu_lsu_rf_pipe4_lch_entry[LSIQ_ENTRY-1:0];
    st_ag_sdid_oh[LSIQ_ENTRY-1:0] <=  idu_lsu_rf_pipe4_sdiq_entry[LSIQ_ENTRY-1:0];
    st_ag_mmu_req                 <=  idu_lsu_rf_pipe4_mmu_req;
    st_ag_old                     <=  idu_lsu_rf_pipe4_oldest;
    st_ag_inst_str                <=  idu_lsu_rf_pipe4_inst_str;
    st_ag_already_da              <=  idu_lsu_rf_pipe4_already_da;
    st_ag_lsiq_spec_fail          <=  idu_lsu_rf_pipe4_spec_fail;
    st_ag_lsiq_bkpta_data         <=  idu_lsu_rf_pipe4_bkpta_data;
    st_ag_lsiq_bkptb_data         <=  idu_lsu_rf_pipe4_bkptb_data;
    st_ag_inst_fls                <=  idu_lsu_rf_pipe4_inst_fls;
    st_ag_no_spec                 <=  idu_lsu_rf_pipe4_no_spec;
    st_ag_staddr                  <=  idu_lsu_rf_pipe4_staddr;
    st_ag_pc[PC_LEN-1:0]          <=  idu_lsu_rf_pipe4_pc[PC_LEN-1:0];
    st_ag_lsfifo                  <=  idu_lsu_rf_pipe4_lsfifo;
  end
end

//+------------------+
//| already_cross_4k |
//+------------------+
//already cross 4k means addr1 is wrong, and mustn't merge from cache buffer
always @(posedge st_ag_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    st_ag_already_cross_page_str_imme  <=  1'b0;
  else if (!st_ag_stall_vld)
    st_ag_already_cross_page_str_imme  <=  1'b0;
  else if(st_ag_stall_vld &&  st_ag_cross_page_str_imme_stall_req)
    st_ag_already_cross_page_str_imme  <=  1'b1;
end

//+--------------+
//| offset_shift |
//+--------------+
//if there is a stall in the AG stage ,offset_shift is reset to 0
//cache stall will not change shift
always @(posedge st_ag_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    st_ag_offset_shift[3:0] <=  4'b1;
  else if (!st_ag_stall_vld &&  idu_lsu_rf_pipe4_sel)
    st_ag_offset_shift[3:0] <=  idu_lsu_rf_pipe4_shift[3:0];
  else if(st_ag_stall_vld && st_ag_cross_page_str_imme_stall_req)
    st_ag_offset_shift[3:0] <=  4'b1;
end

//+--------+
//| offset |
//+--------+
//if the 1st time boundary 2nd instruction stall, the offset set 16 for bias, else
//if stall, it set to 0, cache stall will not change offset
always @(posedge st_ag_clk)
begin
  if(st_ag_cross_page_str_imme_stall_arb)
    st_ag_offset[63:32]  <=  32'h0;
  else if (!st_ag_stall_vld &&  st_rf_inst_vld  &&  !st_rf_inst_str)
    st_ag_offset[63:32]  <=  {32{idu_lsu_rf_pipe4_offset[11]}};
  else if (!st_ag_stall_vld &&  st_rf_inst_vld  &&  st_rf_inst_str  &&  st_rf_off_0_extend)
    st_ag_offset[63:32]  <=  32'h0;
  else if (!st_ag_stall_vld &&  st_rf_inst_vld)
    st_ag_offset[63:32]  <=  idu_lsu_rf_pipe4_src1[63:32];
end

always @(posedge st_ag_clk)
begin
  if(st_ag_cross_page_str_imme_stall_arb  &&  st_ag_str_imme_stall)
    st_ag_offset[31:0]  <=  32'h10;
  else if(st_ag_cross_page_str_imme_stall_arb)
    st_ag_offset[31:0]  <=  32'h0;
  else if (!st_ag_stall_vld &&  st_rf_inst_vld  &&  !st_rf_inst_str)
    st_ag_offset[31:0]  <=  {{20{idu_lsu_rf_pipe4_offset[11]}},idu_lsu_rf_pipe4_offset[11:0]};
  else if (!st_ag_stall_vld &&  st_rf_inst_vld)
    st_ag_offset[31:0]  <=  idu_lsu_rf_pipe4_src1[31:0];
end

//+-------------+
//| offset_plus |
//+-------------+
//use this imm as offset when the ld/st inst need split and !secd
always @(posedge st_ag_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    st_ag_offset_plus[12:0]  <=  13'h0;
  else if(st_ag_cross_page_str_imme_stall_arb)
    st_ag_offset_plus[12:0]  <=  13'h0;
  else if (!st_ag_stall_vld &&  st_rf_inst_vld)
    st_ag_offset_plus[12:0]  <=  idu_lsu_rf_pipe4_offset_plus[12:0];
end

//+------+
//| base |
//+------+
always @(posedge st_ag_clk)
begin
  if(st_ag_cross_page_str_imme_stall_arb)
    st_ag_base[63:0]  <=  st_ag_va[63:0];
  else if (!st_ag_stall_vld &&  st_rf_inst_vld)
    st_ag_base[63:0]  <=  idu_lsu_rf_pipe4_src0[63:0];
end

//==========================================================
//                      AG gateclk
//==========================================================
assign st_ag_inst_stall_gateclk_en  = st_ag_inst_vld;

//==========================================================
//               Generate virtual address
//==========================================================
// for first boundary inst, use addr+offset+128 as va instead of addr+offset
//for secd boundary,use addr+offset as va
assign st_ag_offset_aftershift[63:0]  = {64{st_ag_offset_shift[0]}} & st_ag_offset[63:0]
                                        | {64{st_ag_offset_shift[1]}} & {st_ag_offset[62:0],1'b0}
                                        | {64{st_ag_offset_shift[2]}} & {st_ag_offset[61:0],2'b0}
                                        | {64{st_ag_offset_shift[3]}} & {st_ag_offset[60:0],3'b0};

assign st_ag_va_ori[63:0]           = st_ag_base[63:0]
                                      + st_ag_offset_aftershift[63:0];

assign st_ag_va_plus[63:0]          = st_ag_base[63:0]
                                      + {{51{st_ag_offset_plus[12]}},st_ag_offset_plus[12:0]};

assign st_ag_va_plus_sel            = st_ag_secd
                                      && !st_ag_inst_str;

assign st_ag_va[63:0]               = st_ag_va_plus_sel
                                      ? st_ag_va_plus[63:0]
                                      : st_ag_va_ori[63:0];

assign st_ag_vpn[`PA_WIDTH-13:0]     = st_ag_va[`PA_WIDTH-1:12];
 
//==========================================================
//        Generate inst type
//==========================================================
assign st_ag_stamo_inst                 = st_ag_atomic
                                          &&  (st_ag_inst_type[1:0]  ==  2'b00);
assign st_ag_icc_inst                   = !st_ag_atomic
                                          &&  !st_ag_sync_fence
                                          &&  st_ag_icc;
assign st_ag_tlbi_inst                  = st_ag_icc_inst
                                          &&  (st_ag_inst_type[1:0]  ==  2'b00);
assign st_ag_tlbi_all_inst              = st_ag_tlbi_inst
                                          &&  (st_ag_inst_mode[1:0]  ==  2'b00);
assign st_ag_dcache_inst                = st_ag_icc_inst
                                          &&  (st_ag_inst_type[1:0]  ==  2'b10);
assign st_ag_dcache_all_inst            = st_ag_dcache_inst
                                          &&  (st_ag_inst_mode[1:0]  ==  2'b00);
assign st_ag_dcache_1line_inst          = st_ag_dcache_inst
                                          &&  (st_ag_inst_mode[1:0]  !=  2'b00);

assign st_ag_dcache_pa_sw_inst          = st_ag_dcache_inst
                                          &&  st_ag_inst_mode[1];

assign st_ag_dcache_user_allow_inst     = st_ag_dcache_inst   //dcache.cva/dcache.civa/dcache.cval1
                                          &&  !(st_ag_inst_size[1:0]  ==  2'b10)
                                          &&  (st_ag_inst_mode[1:0]  ==  2'b01);
assign st_ag_icache_inst                = st_ag_icc
                                          &&  !st_ag_atomic
                                          &&  (st_ag_inst_type[1:0]  ==  2'b01);
assign st_ag_icache_all_inst            = st_ag_icache_inst
                                          &&  (st_ag_inst_mode[1:0]  ==  2'b00);
assign st_ag_icache_inv_va_inst         = st_ag_icache_inst
                                          &&  (st_ag_inst_mode[1:0]  ==  2'b01);
assign st_ag_l2cache_inst               = st_ag_icc
                                          &&  !st_ag_atomic
                                          &&  (st_ag_inst_type[1:0]  ==  2'b11);
assign st_ag_fence_i_icache_all_inst    = st_ag_split
                                          &&  st_ag_icache_inst
                                          &&  (st_ag_inst_mode[1:0]  ==  2'b00);
assign st_ag_st_inst                    = !st_ag_icc
                                          && !st_ag_atomic
                                          &&  !st_ag_sync_fence
                                          &&  (st_ag_inst_type[1:0]  ==  2'b00);
assign st_ag_statomic_inst              = st_ag_inst_vld
                                          &&  st_ag_atomic;

//==========================================================
//            Generate unalign, bytes_vld
//==========================================================
//---------------inst access size---------------
// access size is used to select bytes_vld and boundary judge
// &CombBeg; @379
always @( st_ag_inst_size[1:0])
begin
case(st_ag_inst_size[1:0])
  BYTE: st_ag_access_size_ori[3:0] = 4'b0000;
  HALF: st_ag_access_size_ori[3:0] = 4'b0001;
  WORD: st_ag_access_size_ori[3:0] = 4'b0011;
  DWORD:st_ag_access_size_ori[3:0] = 4'b0111;
  default:st_ag_access_size_ori[3:0] = 4'b0;
endcase
// &CombEnd; @387
end
assign st_ag_inst_vls         = 1'b0;
assign st_ag_access_size[3:0] = st_ag_access_size_ori[3:0]; 

// access_size pipedown to dc, used for biu req_size(strong order)
// &CombBeg; @397
always @( st_ag_access_size[3:0])
begin
case(st_ag_access_size[3:0])
  4'b0000: st_ag_dc_access_size[2:0] = 3'b000;  //byte
  4'b0001: st_ag_dc_access_size[2:0] = 3'b001;  //half
  4'b0011: st_ag_dc_access_size[2:0] = 3'b010;  //word
  4'b0111: st_ag_dc_access_size[2:0] = 3'b011;  //dword
  4'b1111: st_ag_dc_access_size[2:0] = 3'b100;  //qword
  default: st_ag_dc_access_size[2:0] = 3'b0;
endcase
// &CombEnd; @406
end
//----------------generate uanlign--------------------------
//-----------unalign--------------------
// &CombBeg; @409
always @( st_ag_inst_size[1:0]
       or st_ag_va_ori[2:0])
begin
casez({st_ag_inst_size[1:0],st_ag_va_ori[2:0]})
  {BYTE,3'b???}:st_ag_align = 1'b1;
  {HALF,3'b??0}:st_ag_align = 1'b1;
  {WORD,3'b?00}:st_ag_align = 1'b1;
  {DWORD,3'b000}:st_ag_align = 1'b1;//NOTE:in risc-v isa, double inst misalign is set
                                    //     when double not align,
                                    //     but in csky, double misalign is set
                                    //     when word not align
  default:st_ag_align  = 1'b0;
endcase
// &CombEnd; @420
end
assign st_ag_unalign = !st_ag_align;

// for strong order,only support access size aligned address
//&CombBeg;
//casez({st_ag_access_size[3:0],st_ag_va_ori[3:0]})
//  {4'b0000,4'b????}:st_ag_align_so = 1'b1;       //byte
//  {4'b0001,4'b???0}:st_ag_align_so = 1'b1;       //half
//  {4'b0011,4'b??00}:st_ag_align_so = 1'b1;       //word
//  {4'b0111,4'b?000}:st_ag_align_so = 1'b1;       //dword
//  {4'b1111,4'b0000}:st_ag_align_so = 1'b1;       //qword
//  default:st_ag_align_so  = 1'b0;
//endcase
//&CombEnd;
assign st_ag_unalign_so = !st_ag_align;

//---------------boundary---------------
assign st_ag_va_add_access_size[4:0] = {1'b0,st_ag_va_ori[3:0]} + {1'b0,st_ag_access_size[3:0]};
assign st_ag_boundary_unmask = st_ag_va_add_access_size[4];

// &Force("output", "st_ag_boundary"); @440
assign st_ag_boundary = (st_ag_boundary_unmask
                            ||  st_ag_secd)
                        &&  st_ag_st_inst;

//----------------generate bytes_vld------------------------
//-----------in le/bev2-----------------
//the 2nd half boundary inst will +128, so va[3:0] of 2nd inst will not change
// &CombBeg; @448
always @( st_ag_va_ori[3:0])
begin
case(st_ag_va_ori[3:0])
  4'b0000:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hffff;
  4'b0001:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hfffe;
  4'b0010:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hfffc;
  4'b0011:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hfff8;
  4'b0100:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hfff0;
  4'b0101:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hffe0;
  4'b0110:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hffc0;
  4'b0111:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hff80;
  4'b1000:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hff00;
  4'b1001:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hfe00;
  4'b1010:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hfc00;
  4'b1011:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hf800;
  4'b1100:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hf000;
  4'b1101:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'he000;
  4'b1110:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'hc000;
  4'b1111:st_ag_le_bytes_vld_high_bits_full[15:0] = 16'h8000;
  default:st_ag_le_bytes_vld_high_bits_full[15:0] = {16{1'bx}};
endcase
// &CombEnd; @468
end

// &CombBeg; @470
always @( st_ag_va_add_access_size[3:0])
begin
case(st_ag_va_add_access_size[3:0])
  4'b0000:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h0001;
  4'b0001:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h0003;
  4'b0010:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h0007;
  4'b0011:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h000f;
  4'b0100:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h001f;
  4'b0101:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h003f;
  4'b0110:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h007f;
  4'b0111:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h00ff;
  4'b1000:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h01ff;
  4'b1001:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h03ff;
  4'b1010:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h07ff;
  4'b1011:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h0fff;
  4'b1100:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h1fff;
  4'b1101:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h3fff;
  4'b1110:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'h7fff;
  4'b1111:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'hffff;
  default:st_ag_le_bytes_vld_low_bits_full[15:0] = 16'b0;
endcase
// &CombEnd; @490
end

assign st_ag_le_bytes_vld_cross[15:0]       = st_ag_le_bytes_vld_high_bits_full[15:0]
                                              & st_ag_le_bytes_vld_low_bits_full[15:0];

assign st_ag_le_bytes_vld_high_cross_bits[15:0] = st_ag_boundary_unmask
                                                  ? st_ag_le_bytes_vld_high_bits_full[15:0]
                                                  : st_ag_le_bytes_vld_cross[15:0];
//-----------select bytes_vld-----------
assign st_ag_bytes_vld_low_bits[15:0]   = st_ag_le_bytes_vld_low_bits_full[15:0];

assign st_ag_bytes_vld_high_cross_bits[15:0]  = st_ag_le_bytes_vld_high_cross_bits[15:0];

//used for st_dc_rot_sel when boundary split
//bytes_vld1 is the bytes_vld of lower addr when there is a first(smaller) boundary st inst,
//NOTE: it is different from ld pipe
//assign st_ag_bytes_vld1[15:0]   = st_ag_bytes_vld_high_cross_bits[15:0];

assign st_ag_st_bytes_vld[15:0] = st_ag_secd
                                  ? st_ag_bytes_vld_low_bits[15:0]
                                  : st_ag_bytes_vld_high_cross_bits[15:0];

assign st_ag_bytes_vld[15:0]    = st_ag_tlbi_inst
                                  ? 16'hffff
                                  : st_ag_st_bytes_vld[15:0];
//==========================================================
//        vector mask
//==========================================================
// &CombBeg; @523
// &CombEnd; @531
// &Force("output","st_ag_element_cnt"); @533
// &CombBeg; @540
// &CombEnd; @552
// &CombBeg; @557
// &CombEnd; @565
// &CombBeg; @650
// &CombEnd; @661
// &CombBeg; @665
// &CombEnd; @685
// &CombBeg; @694
// &CombEnd; @714
// &CombBeg; @731
// &CombEnd; @751
// &CombBeg; @753
// &CombEnd; @773
// &CombBeg; @775
// &CombEnd; @781
// &CombBeg; @783
// &CombEnd; @789
// &CombBeg; @796
// &CombEnd; @815
// &CombBeg; @818
// &CombEnd; @838
// &CombBeg; @846
// &CombEnd; @854
// &CombBeg; @858
// &CombEnd; @866
// &Force("output","st_ag_vsew"); @869
// &Force("output","st_ag_inst_vls"); @870
assign st_ag_dc_bytes_vld[15:0]  = st_ag_bytes_vld[15:0];
//assign st_ag_dc_bytes_vld1[15:0] = st_ag_bytes_vld1[15:0];
assign st_ag_dc_rot_sel[3:0]     = st_ag_tlbi_inst
                                   ? 4'h0
                                   : st_ag_va_ori[3:0];
//==========================================================
//        MMU interface
//==========================================================
//-----------mmu input--------------------------------------
assign lsu_mmu_va1_vld      = st_ag_mmu_req
                              &&  st_ag_inst_vld;
assign lsu_mmu_st_inst1     = st_ag_st;
assign lsu_mmu_va1[63:0]    = st_ag_base[63:0];
// &Force("output","lsu_mmu_abort1"); @894
assign lsu_mmu_abort1       = st_ag_cross_page_str_imme_stall_req
                              ||  st_ag_dcache_stall_req
                              ||  st_ag_expt_illegal_inst
                              ||  st_ag_expt_misalign_no_page
                              ||  rtu_yy_xx_flush;
assign lsu_mmu_id1[6:0]     = st_ag_iid[6:0];

//to avoid deadlock,stamo will not check tlb, use lm info instead
//for stamo timing
assign lsu_mmu_stamo_vld = st_ag_inst_vld
                           && st_ag_stamo_inst;

assign lsu_mmu_stamo_pa[`PA_WIDTH-13:0] = lm_addr_pa[`PA_WIDTH-13:0]; 
//-----------mmu output-------------------------------------
assign st_ag_pn[`PA_WIDTH-13:0] = mmu_lsu_pa1[`PA_WIDTH-13:0];
//0 means 4k
//1 means 2M
//2 means don't care
// &Force("output", "st_ag_page_so"); @913
assign st_ag_page_so        = st_ag_stamo_inst
                              ? lm_page_so
                              : mmu_lsu_so1 && mmu_lsu_pa1_vld;
// &Force("output","st_ag_page_ca"); @917
// &Force("output","st_ag_utlb_miss"); @918
assign st_ag_page_ca        = st_ag_stamo_inst
                              ? lm_page_ca
                              : mmu_lsu_ca1 && mmu_lsu_pa1_vld;
assign st_ag_page_wa        = st_ag_page_ca &&  cp0_lsu_wa;
assign st_ag_page_buf       = st_ag_stamo_inst
                              ? lm_page_buf
                              : mmu_lsu_buf1;
assign st_ag_page_sec       = st_ag_stamo_inst
                              ? lm_page_sec
                              : mmu_lsu_sec1;
assign st_ag_page_share     = st_ag_stamo_inst
                              ? lm_page_share
                              : mmu_lsu_sh1;

assign st_ag_utlb_miss      = !mmu_lsu_pa1_vld
                              &&  st_ag_mmu_req
                              &&  !st_ag_expt_illegal_inst;
assign st_ag_page_fault     = mmu_lsu_page_fault1;
//assign st_ag_access_fault   = mmu_lsu_access_fault1;

//==========================================================
//        Generate physical address
//==========================================================
assign st_ag_pa[`PA_WIDTH-1:0]    = {st_ag_pn[`PA_WIDTH-13:0],st_ag_va[11:0]};

assign st_ag_va_am[`PA_WIDTH-1:0] = (st_ag_sync_fence
                                        ||  st_ag_tlbi_all_inst
                                        ||  st_ag_dcache_all_inst
                                        ||  st_ag_icache_all_inst
                                        ||  st_ag_l2cache_inst)
                                    ? {`PA_WIDTH{1'b0}}
                                    : st_ag_va[`PA_WIDTH-1:0];

//mmu request use pa
assign st_ag_addr[`PA_WIDTH-1:12] = st_ag_mmu_req || st_ag_stamo_inst
                                    ? st_ag_pn[`PA_WIDTH-13:0] 
                                    : st_ag_va_am[`PA_WIDTH-1:12];

assign st_ag_addr[11:0]           = st_ag_tlbi_inst
                                    ? 12'b0
                                    : st_ag_va_am[11:0];

//==========================================================
//        Generage dcache request information
//==========================================================
assign ag_dcache_arb_st_gateclk_en  = st_ag_inst_vld
                                      &&  cp0_lsu_dcache_en
                                      &&  (st_ag_st_inst
                                          ||  st_ag_statomic_inst
                                          ||  st_ag_dcache_1line_inst);
//for timing, delete expt_vld
assign ag_dcache_arb_st_req = st_ag_inst_vld
                              &&  cp0_lsu_dcache_en
                              &&  (st_ag_st_inst
                                  ||  st_ag_statomic_inst
                                  ||  st_ag_dcache_1line_inst)
//                              &&  !st_ag_expt_vld
//                              &&  !st_ag_cross_page_str_imme_stall_arb

                              &&  (st_ag_mmu_req
                                  ||  st_ag_stamo_inst
                                  ||  st_ag_dcache_pa_sw_inst);
//                              &&  (st_ag_page_ca
//                                      &&  mmu_lsu_pa1_vld
//                                  ||  st_ag_dcache_pa_sw_inst);

//-----------tag array--------------------------------------
assign ag_dcache_arb_st_tag_gateclk_en  = ag_dcache_arb_st_gateclk_en;
assign ag_dcache_arb_st_tag_req         = ag_dcache_arb_st_req;
assign ag_dcache_arb_st_tag_idx[8:0]    = st_ag_pa[14:6];
//assign ag_dcache_arb_st_tag_din[35:0] = 36'b0;
//assign ag_dcache_arb_st_tag_wen[1:0]  = 2'b0;

//-----------dirty array------------------------------------
assign ag_dcache_arb_st_dirty_gateclk_en= ag_dcache_arb_st_gateclk_en;
assign ag_dcache_arb_st_dirty_req       = ag_dcache_arb_st_req;
assign ag_dcache_arb_st_dirty_idx[8:0]  = st_ag_pa[14:6];
//assign ag_dcache_arb_st_dirty_din[6:0]  = 7'b0;
//assign ag_dcache_arb_st_dirty_wen[6:0]  = 7'b0;

//==========================================================
//        Generage exception signal
//==========================================================
//for tee
assign tcore_vld = 1'b1;

//----------illegal_inst----------------
assign st_ag_prvlg_obey     = (cp0_yy_priv_mode[1:0]  ==  2'b00)
                                  &&  (st_ag_dcache_inst
                                          &&  !(cp0_lsu_ucme
                                                &&  st_ag_dcache_user_allow_inst)
                                      ||  st_ag_icache_inst
                                          &&  !(cp0_lsu_ucme
                                                &&  st_ag_icache_inv_va_inst)
                                          &&  !st_ag_fence_i_icache_all_inst
                                      ||  st_ag_tlbi_inst
                                      ||  st_ag_l2cache_inst)
                              ||  (cp0_yy_priv_mode[1:0]  ==  2'b01)
                                  &&  st_ag_tlbi_inst
                                  && (st_ag_inst_size[1:0] == 2'b00)
                                  &&  cp0_lsu_tvm
                              ||  (cp0_yy_priv_mode[1:0]  ==  2'b01)
                                  && (cp0_yy_virtual_mode || cp0_lsu_tvm)
                                  &&  st_ag_tlbi_inst
                                  && (st_ag_inst_size[1:0] == 2'b01)
                              ||  !tcore_vld
                                  && st_ag_l2cache_inst;

// &Force("output","st_ag_expt_illegal_inst"); @1031
assign st_ag_expt_illegal_inst  = st_ag_prvlg_obey
                                  && !rtu_yy_xx_dbgon;

// &CombBeg; @1035
always @( st_ag_va_ori[39:0]
       or st_ag_inst_code[31:0]
       or st_ag_expt_illegal_inst)
begin
if(st_ag_expt_illegal_inst)
  st_ag_mt_value[`PA_WIDTH-1:0] = {{`PA_WIDTH-32{1'b0}},st_ag_inst_code[31:0]};
else
  st_ag_mt_value[`PA_WIDTH-1:0] = st_ag_va_ori[`PA_WIDTH-1:0];  //for misalign
// &CombEnd; @1040
end

//if the 1st boundary instruction is weak order and 2nd is strong order, then treat
//this instruction as weak order
// &Force("output", "st_ag_expt_misalign_no_page"); @1044
assign st_ag_expt_misalign_no_page  = st_ag_unalign
                                      &&  (st_ag_st_inst
                                              &&  !cp0_lsu_mm
                                          ||  st_ag_inst_vls
                                          ||  st_ag_atomic);

// &Force("output","st_ag_expt_misalign_with_page"); @1051
assign st_ag_expt_misalign_with_page  = st_ag_unalign_so
                                        &&  st_ag_page_so
                                        &&  mmu_lsu_pa1_vld
                                        &&  st_ag_st_inst;

// &Force("output","st_ag_expt_page_fault"); @1057
assign st_ag_expt_page_fault          = st_ag_mmu_req
                                        &&  mmu_lsu_pa1_vld
                                        &&  st_ag_page_fault;

// &Force("output","st_ag_expt_stamo_not_ca"); @1062
assign st_ag_expt_stamo_not_ca    = mmu_lsu_pa1_vld
                                    &&  st_ag_stamo_inst
                                    &&  !st_ag_page_ca;

// //&Force("output","st_ag_expt_access_fault"); @1067
//assign st_ag_expt_access_fault        = mmu_lsu_pa1_vld
//                                        &&  st_ag_access_fault;

//for vector strong order
// &Force("output", "st_ag_expt_access_fault_with_page"); @1072
assign st_ag_expt_access_fault_with_page = mmu_lsu_pa1_vld
                                           &&  st_ag_page_so
                                           &&  st_ag_st_inst
                                           &&  st_ag_inst_vls;
                                      
assign st_ag_expt_vld       = st_ag_expt_misalign_no_page
                              ||  st_ag_expt_misalign_with_page
                              ||  st_ag_expt_access_fault_with_page
                              ||  st_ag_expt_illegal_inst
                              ||  st_ag_expt_page_fault;

//==========================================================
//        Generage stall/restart signal
//==========================================================
//-----------restart----------------------------------------
//generate commit signal
assign st_ag_cmit_hit0  = {rtu_yy_xx_commit0,rtu_yy_xx_commit0_iid[6:0]}
                          ==  {1'b1,st_ag_iid[6:0]};
assign st_ag_cmit_hit1  = {rtu_yy_xx_commit1,rtu_yy_xx_commit1_iid[6:0]}
                          ==  {1'b1,st_ag_iid[6:0]};
assign st_ag_cmit_hit2  = {rtu_yy_xx_commit2,rtu_yy_xx_commit2_iid[6:0]}
                          ==  {1'b1,st_ag_iid[6:0]};

// //&Force("output","st_ag_cmit"); @1096
assign st_ag_cmit       = st_ag_cmit_hit0
                          ||  st_ag_cmit_hit1
                          ||  st_ag_cmit_hit2;

assign st_ag_atomic_no_cmit_restart_req = st_ag_inst_vld
                                          &&  st_ag_stamo_inst
                                          &&  !st_ag_cmit;

//==========================================================
//        Generage stall/restart signal
//==========================================================
//-----------stall------------------------------------------
//get the stall signal if virtual address cross 4k address
//for timing, if there is a carry adding last 12 bits, or there is '1' in high
//bits, it will stall
//---------------------cross 4k-----------------------------
assign st_ag_4k_sum_ori[12:0]   = {1'b0,st_ag_base[11:0]} 
                                  + {st_ag_offset[63],st_ag_offset_aftershift[11:0]};

assign st_ag_off_high_bits_all_0_ori  = !(|st_ag_offset_aftershift[63:12]);
assign st_ag_off_high_bits_all_1_ori  = &st_ag_offset_aftershift[63:12];
assign st_ag_off_high_bits_not_eq     = !st_ag_off_high_bits_all_0_ori
                                        &&  !st_ag_off_high_bits_all_1_ori;

assign st_ag_4k_sum_plus[12:0]   = {1'b0,st_ag_base[11:0]} 
                                  + st_ag_offset_plus[12:0];


assign st_ag_4k_sum_12  = st_ag_va_plus_sel ? st_ag_4k_sum_plus[12]
                                            : st_ag_4k_sum_ori[12];

assign st_ag_cross_4k   = st_ag_4k_sum_12
                          ||  st_ag_off_high_bits_not_eq;

//only str will trigger secd stall, and will stall at the first split
assign st_ag_boundary_stall = st_ag_inst_str && st_ag_secd;
assign st_ag_str_imme_stall  = st_ag_boundary_stall  &&  !st_ag_already_cross_page_str_imme;

assign st_ag_dcache_stall_unmask      = !dcache_arb_ag_st_sel;
//because cross 4k to MMU, there doesn't exist cross_4k stall
assign st_ag_cross_page_str_imme_stall_req  = (st_ag_cross_4k
                                                ||  st_ag_str_imme_stall)
                                            &&  !st_ag_expt_misalign_no_page
                                            &&  st_ag_inst_vld
                                            &&  st_ag_mmu_req;

assign st_ag_dcache_stall_req   = st_ag_dcache_stall_unmask
                                  &&  st_ag_inst_vld;
assign st_ag_mmu_stall_req      = mmu_lsu_stall1;

//-----------arbiter----------------------------------------
//prioritize:
//  1. cross_page_str_imme_stall    : cross_4k
//  2. dcache_stall    : cache
//  other restart flop to dc stage
//  other_restart  : utlb_miss, tlb_busy

assign st_ag_cross_page_str_imme_stall_arb  = !st_ag_atomic_no_cmit_restart_req
                                              && st_ag_cross_page_str_imme_stall_req
                                              && !st_ag_stall_mask;

assign st_ag_atomic_no_cmit_restart_arb = st_ag_atomic_no_cmit_restart_req;
//-----------generate total siangl--------------------------
// &Force("output","st_ag_stall_ori"); @1160
assign st_ag_stall_ori            = (st_ag_cross_page_str_imme_stall_req
                                     ||  st_ag_dcache_stall_req
                                     ||  st_ag_mmu_stall_req)
                                    && !st_ag_atomic_no_cmit_restart_req;

assign st_ag_stall_vld            = st_ag_stall_ori
                                    && !st_ag_stall_mask;

assign st_ag_stall_restart        = st_ag_cross_page_str_imme_stall_req
                                    || st_ag_dcache_stall_req
                                    || st_ag_mmu_stall_req
                                    || st_ag_atomic_no_cmit_restart_req;

//for performance,when ag stall,let oldest inst go

// &Instance("ct_rtu_compare_iid","x_lsu_rf_compare_st_ag_iid"); @1176
ct_rtu_compare_iid  x_lsu_rf_compare_st_ag_iid (
  .x_iid0                    (idu_lsu_rf_pipe4_iid[6:0]),
  .x_iid0_older              (rf_iid_older_than_st_ag  ),
  .x_iid1                    (st_ag_iid[6:0]           )
);

// &Connect( .x_iid0         (idu_lsu_rf_pipe4_iid[6:0]), @1177
//           .x_iid1         (st_ag_iid[6:0]           ), @1178
//           .x_iid0_older   (rf_iid_older_than_st_ag )); @1179

assign st_ag_stall_mask = idu_lsu_rf_pipe4_sel
                          && rf_iid_older_than_st_ag;

assign st_ag_stall_restart_entry[LSIQ_ENTRY-1:0] = st_ag_stall_mask
                                                   ? st_ag_lsid[LSIQ_ENTRY-1:0]
                                                   : idu_lsu_rf_pipe4_lch_entry[LSIQ_ENTRY-1:0];

//==========================================================
//        Generate restart/lsiq signal
//==========================================================
//-----------lsiq signal----------------
assign st_ag_mask_lsid[LSIQ_ENTRY-1:0]    = {LSIQ_ENTRY{st_ag_inst_vld}}
                                            &  st_ag_lsid[LSIQ_ENTRY-1:0];

assign lsu_idu_st_ag_wait_old_gateclk_en = st_ag_atomic_no_cmit_restart_arb;
assign lsu_idu_st_ag_wait_old[LSIQ_ENTRY-1:0]  = st_ag_mask_lsid[LSIQ_ENTRY-1:0]
                                                 & {LSIQ_ENTRY{st_ag_atomic_no_cmit_restart_arb}};

//==========================================================
//        Generage to DC stage signal
//==========================================================
// &Force("output", "st_ag_dc_inst_vld"); @1202
assign st_ag_dc_inst_vld      = st_ag_inst_vld
                                &&  !st_ag_stall_restart;

assign st_ag_dc_mmu_req       = st_ag_mmu_req
                                &&  !lsu_mmu_abort1;

assign st_ag_dc_page_share    = st_ag_inst_share
                                ||  st_ag_page_share
                                    && (st_ag_mmu_req || st_ag_stamo_inst);

//this logic may be redundant
assign st_ag_dc_addr0[`PA_WIDTH-1:0] = dcache_arb_st_ag_borrow_addr_vld
                                      ? dcache_arb_st_ag_addr[`PA_WIDTH-1:0]
                                      : st_ag_addr[`PA_WIDTH-1:0];

//==========================================================
//        interface to hpcp
//==========================================================
assign lsu_hpcp_st_cross_4k_stall  = st_ag_inst_vld
                                     &&  st_ag_already_cross_page_str_imme
                                     &&  !st_ag_stall_vld
                                     &&  !st_ag_utlb_miss
                                     &&  !st_ag_already_da;
assign lsu_hpcp_st_other_stall     = st_ag_inst_vld
                                     &&  !st_ag_cross_4k
                                     &&  st_ag_stall_vld
                                     &&  !st_ag_utlb_miss
                                     &&  !st_ag_already_da;

// &ModuleEnd; @1234
endmodule


