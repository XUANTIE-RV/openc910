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

// &ModuleBeg; @26
module ct_lsu_ctrl(
  cp0_lsu_dcache_pref_dist,
  cp0_lsu_icg_en,
  cp0_lsu_l2_pref_dist,
  cp0_yy_clk_en,
  cpurst_b,
  ctrl_ld_clk,
  ctrl_st_clk,
  dcache_arb_ld_dc_borrow_vld_gate,
  dcache_arb_st_dc_borrow_vld_gate,
  forever_cpuclk,
  hpcp_lsu_cnt_en,
  icc_vb_create_gateclk_en,
  idu_lsu_rf_pipe3_gateclk_sel,
  idu_lsu_rf_pipe3_sel,
  idu_lsu_rf_pipe4_gateclk_sel,
  idu_lsu_rf_pipe4_sel,
  idu_lsu_rf_pipe5_gateclk_sel,
  idu_lsu_vmb_create0_gateclk_en,
  idu_lsu_vmb_create1_gateclk_en,
  ld_ag_inst_vld,
  ld_ag_stall_ori,
  ld_ag_stall_restart_entry,
  ld_da_borrow_vld,
  ld_da_ecc_wakeup,
  ld_da_idu_already_da,
  ld_da_idu_bkpta_data,
  ld_da_idu_bkptb_data,
  ld_da_idu_boundary_gateclk_en,
  ld_da_idu_pop_entry,
  ld_da_idu_pop_vld,
  ld_da_idu_rb_full,
  ld_da_idu_secd,
  ld_da_idu_spec_fail,
  ld_da_idu_wait_fence,
  ld_da_inst_vld,
  ld_da_rb_full_gateclk_en,
  ld_da_special_gateclk_en,
  ld_da_wait_fence_gateclk_en,
  ld_dc_borrow_vld,
  ld_dc_idu_lq_full,
  ld_dc_idu_tlb_busy,
  ld_dc_imme_wakeup,
  ld_dc_inst_vld,
  ld_dc_lq_full_gateclk_en,
  ld_dc_tlb_busy_gateclk_en,
  ld_wb_data_vld,
  ld_wb_inst_vld,
  lfb_depd_wakeup,
  lfb_empty,
  lfb_pop_depd_ff,
  lm_lfb_depd_wakeup,
  lsu_had_amr_state,
  lsu_had_cdr_state,
  lsu_had_ctcq_entry_2_cmplt,
  lsu_had_ctcq_entry_cmplt,
  lsu_had_ctcq_entry_vld,
  lsu_had_debug_info,
  lsu_had_icc_state,
  lsu_had_lfb_addr_entry_dcache_hit,
  lsu_had_lfb_addr_entry_rcl_done,
  lsu_had_lfb_addr_entry_vld,
  lsu_had_lfb_data_entry_last,
  lsu_had_lfb_data_entry_vld,
  lsu_had_lfb_lf_sm_vld,
  lsu_had_lfb_wakeup_queue,
  lsu_had_lm_state,
  lsu_had_mcic_data_req,
  lsu_had_mcic_frz,
  lsu_had_no_op,
  lsu_had_rb_entry_fence,
  lsu_had_rb_entry_state_0,
  lsu_had_rb_entry_state_1,
  lsu_had_rb_entry_state_2,
  lsu_had_rb_entry_state_3,
  lsu_had_rb_entry_state_4,
  lsu_had_rb_entry_state_5,
  lsu_had_rb_entry_state_6,
  lsu_had_rb_entry_state_7,
  lsu_had_sdb_entry_vld,
  lsu_had_snoop_data_req,
  lsu_had_snoop_tag_req,
  lsu_had_snq_entry_issued,
  lsu_had_snq_entry_vld,
  lsu_had_sq_not_empty,
  lsu_had_vb_addr_entry_vld,
  lsu_had_vb_data_entry_vld,
  lsu_had_vb_rcl_sm_state,
  lsu_had_wmb_ar_pending,
  lsu_had_wmb_aw_pending,
  lsu_had_wmb_create_ptr,
  lsu_had_wmb_data_ptr,
  lsu_had_wmb_entry_vld,
  lsu_had_wmb_read_ptr,
  lsu_had_wmb_w_pending,
  lsu_had_wmb_write_imme,
  lsu_had_wmb_write_ptr,
  lsu_has_fence,
  lsu_hpcp_cache_read_access,
  lsu_hpcp_cache_read_miss,
  lsu_hpcp_cache_write_access,
  lsu_hpcp_cache_write_miss,
  lsu_hpcp_fence_stall,
  lsu_hpcp_ld_cache_access,
  lsu_hpcp_ld_cache_miss,
  lsu_hpcp_ld_cross_4k_stall,
  lsu_hpcp_ld_data_discard,
  lsu_hpcp_ld_discard_sq,
  lsu_hpcp_ld_other_stall,
  lsu_hpcp_ld_stall_cross_4k,
  lsu_hpcp_ld_stall_other,
  lsu_hpcp_ld_unalign_inst,
  lsu_hpcp_replay_data_discard,
  lsu_hpcp_replay_discard_sq,
  lsu_hpcp_st_cache_access,
  lsu_hpcp_st_cache_miss,
  lsu_hpcp_st_cross_4k_stall,
  lsu_hpcp_st_other_stall,
  lsu_hpcp_st_stall_cross_4k,
  lsu_hpcp_st_stall_other,
  lsu_hpcp_st_unalign_inst,
  lsu_hpcp_unalign_inst,
  lsu_idu_already_da,
  lsu_idu_bkpta_data,
  lsu_idu_bkptb_data,
  lsu_idu_ld_ag_wait_old,
  lsu_idu_ld_ag_wait_old_gateclk_en,
  lsu_idu_ld_da_wait_old,
  lsu_idu_ld_da_wait_old_gateclk_en,
  lsu_idu_lq_full,
  lsu_idu_lq_full_gateclk_en,
  lsu_idu_lsiq_pop0_vld,
  lsu_idu_lsiq_pop1_vld,
  lsu_idu_lsiq_pop_entry,
  lsu_idu_lsiq_pop_vld,
  lsu_idu_rb_full,
  lsu_idu_rb_full_gateclk_en,
  lsu_idu_secd,
  lsu_idu_spec_fail,
  lsu_idu_sq_full,
  lsu_idu_sq_full_gateclk_en,
  lsu_idu_st_ag_wait_old,
  lsu_idu_st_ag_wait_old_gateclk_en,
  lsu_idu_tlb_busy,
  lsu_idu_tlb_busy_gateclk_en,
  lsu_idu_tlb_wakeup,
  lsu_idu_unalign_gateclk_en,
  lsu_idu_wait_fence,
  lsu_idu_wait_fence_gateclk_en,
  lsu_idu_wait_old,
  lsu_idu_wait_old_gateclk_en,
  lsu_idu_wakeup,
  lsu_pfu_l1_dist_sel,
  lsu_pfu_l2_dist_sel,
  lsu_special_clk,
  lsu_yy_xx_no_op,
  mmu_lsu_tlb_wakeup,
  pad_yy_icg_scan_en,
  pfu_lfb_create_gateclk_en,
  pfu_part_empty,
  rb_empty,
  rb_ld_wb_cmplt_req,
  rb_ld_wb_data_req,
  sd_ex1_inst_vld,
  sq_data_depd_wakeup,
  sq_empty,
  sq_global_depd_wakeup,
  st_ag_inst_vld,
  st_ag_stall_ori,
  st_ag_stall_restart_entry,
  st_da_borrow_vld,
  st_da_ecc_wakeup,
  st_da_idu_already_da,
  st_da_idu_bkpta_data,
  st_da_idu_bkptb_data,
  st_da_idu_boundary_gateclk_en,
  st_da_idu_pop_entry,
  st_da_idu_pop_vld,
  st_da_idu_rb_full,
  st_da_idu_secd,
  st_da_idu_spec_fail,
  st_da_idu_wait_fence,
  st_da_inst_vld,
  st_da_rb_create_gateclk_en,
  st_da_rb_full_gateclk_en,
  st_da_wait_fence_gateclk_en,
  st_dc_borrow_vld,
  st_dc_idu_sq_full,
  st_dc_idu_tlb_busy,
  st_dc_imme_wakeup,
  st_dc_inst_vld,
  st_dc_sq_full_gateclk_en,
  st_dc_tlb_busy_gateclk_en,
  st_wb_inst_vld,
  vb_empty,
  vmb_empty,
  vmb_ld_wb_data_req,
  wmb_depd_wakeup,
  wmb_empty,
  wmb_ld_wb_data_req,
  wmb_no_op,
  wmb_st_wb_cmplt_req,
  wmb_write_req_icc
);

// &Ports; @27
input   [1  :0]  cp0_lsu_dcache_pref_dist;         
input            cp0_lsu_icg_en;                   
input   [1  :0]  cp0_lsu_l2_pref_dist;             
input            cp0_yy_clk_en;                    
input            cpurst_b;                         
input            dcache_arb_ld_dc_borrow_vld_gate; 
input            dcache_arb_st_dc_borrow_vld_gate; 
input            forever_cpuclk;                   
input            hpcp_lsu_cnt_en;                  
input            icc_vb_create_gateclk_en;         
input            idu_lsu_rf_pipe3_gateclk_sel;     
input            idu_lsu_rf_pipe3_sel;             
input            idu_lsu_rf_pipe4_gateclk_sel;     
input            idu_lsu_rf_pipe4_sel;             
input            idu_lsu_rf_pipe5_gateclk_sel;     
input            idu_lsu_vmb_create0_gateclk_en;   
input            idu_lsu_vmb_create1_gateclk_en;   
input            ld_ag_inst_vld;                   
input            ld_ag_stall_ori;                  
input   [11 :0]  ld_ag_stall_restart_entry;        
input            ld_da_borrow_vld;                 
input   [11 :0]  ld_da_ecc_wakeup;                 
input   [11 :0]  ld_da_idu_already_da;             
input   [11 :0]  ld_da_idu_bkpta_data;             
input   [11 :0]  ld_da_idu_bkptb_data;             
input   [11 :0]  ld_da_idu_boundary_gateclk_en;    
input   [11 :0]  ld_da_idu_pop_entry;              
input            ld_da_idu_pop_vld;                
input   [11 :0]  ld_da_idu_rb_full;                
input   [11 :0]  ld_da_idu_secd;                   
input   [11 :0]  ld_da_idu_spec_fail;              
input   [11 :0]  ld_da_idu_wait_fence;             
input            ld_da_inst_vld;                   
input            ld_da_rb_full_gateclk_en;         
input            ld_da_special_gateclk_en;         
input            ld_da_wait_fence_gateclk_en;      
input            ld_dc_borrow_vld;                 
input   [11 :0]  ld_dc_idu_lq_full;                
input   [11 :0]  ld_dc_idu_tlb_busy;               
input   [11 :0]  ld_dc_imme_wakeup;                
input            ld_dc_inst_vld;                   
input            ld_dc_lq_full_gateclk_en;         
input            ld_dc_tlb_busy_gateclk_en;        
input            ld_wb_data_vld;                   
input            ld_wb_inst_vld;                   
input   [11 :0]  lfb_depd_wakeup;                  
input            lfb_empty;                        
input            lfb_pop_depd_ff;                  
input            lm_lfb_depd_wakeup;               
input   [2  :0]  lsu_had_amr_state;                
input   [1  :0]  lsu_had_cdr_state;                
input   [5  :0]  lsu_had_ctcq_entry_2_cmplt;       
input   [5  :0]  lsu_had_ctcq_entry_cmplt;         
input   [5  :0]  lsu_had_ctcq_entry_vld;           
input   [2  :0]  lsu_had_icc_state;                
input   [7  :0]  lsu_had_lfb_addr_entry_dcache_hit; 
input   [7  :0]  lsu_had_lfb_addr_entry_rcl_done;  
input   [7  :0]  lsu_had_lfb_addr_entry_vld;       
input   [1  :0]  lsu_had_lfb_data_entry_last;      
input   [1  :0]  lsu_had_lfb_data_entry_vld;       
input            lsu_had_lfb_lf_sm_vld;            
input   [12 :0]  lsu_had_lfb_wakeup_queue;         
input   [2  :0]  lsu_had_lm_state;                 
input            lsu_had_mcic_data_req;            
input            lsu_had_mcic_frz;                 
input   [7  :0]  lsu_had_rb_entry_fence;           
input   [3  :0]  lsu_had_rb_entry_state_0;         
input   [3  :0]  lsu_had_rb_entry_state_1;         
input   [3  :0]  lsu_had_rb_entry_state_2;         
input   [3  :0]  lsu_had_rb_entry_state_3;         
input   [3  :0]  lsu_had_rb_entry_state_4;         
input   [3  :0]  lsu_had_rb_entry_state_5;         
input   [3  :0]  lsu_had_rb_entry_state_6;         
input   [3  :0]  lsu_had_rb_entry_state_7;         
input   [2  :0]  lsu_had_sdb_entry_vld;            
input            lsu_had_snoop_data_req;           
input            lsu_had_snoop_tag_req;            
input   [5  :0]  lsu_had_snq_entry_issued;         
input   [5  :0]  lsu_had_snq_entry_vld;            
input            lsu_had_sq_not_empty;             
input   [1  :0]  lsu_had_vb_addr_entry_vld;        
input   [2  :0]  lsu_had_vb_data_entry_vld;        
input   [3  :0]  lsu_had_vb_rcl_sm_state;          
input            lsu_had_wmb_ar_pending;           
input            lsu_had_wmb_aw_pending;           
input   [7  :0]  lsu_had_wmb_create_ptr;           
input   [7  :0]  lsu_had_wmb_data_ptr;             
input   [7  :0]  lsu_had_wmb_entry_vld;            
input   [7  :0]  lsu_had_wmb_read_ptr;             
input            lsu_had_wmb_w_pending;            
input            lsu_had_wmb_write_imme;           
input   [7  :0]  lsu_had_wmb_write_ptr;            
input            lsu_has_fence;                    
input            lsu_hpcp_ld_cache_access;         
input            lsu_hpcp_ld_cache_miss;           
input            lsu_hpcp_ld_cross_4k_stall;       
input            lsu_hpcp_ld_data_discard;         
input            lsu_hpcp_ld_discard_sq;           
input            lsu_hpcp_ld_other_stall;          
input            lsu_hpcp_ld_unalign_inst;         
input            lsu_hpcp_st_cache_access;         
input            lsu_hpcp_st_cache_miss;           
input            lsu_hpcp_st_cross_4k_stall;       
input            lsu_hpcp_st_other_stall;          
input            lsu_hpcp_st_unalign_inst;         
input   [11 :0]  lsu_idu_ld_ag_wait_old;           
input            lsu_idu_ld_ag_wait_old_gateclk_en; 
input   [11 :0]  lsu_idu_ld_da_wait_old;           
input            lsu_idu_ld_da_wait_old_gateclk_en; 
input   [11 :0]  lsu_idu_st_ag_wait_old;           
input            lsu_idu_st_ag_wait_old_gateclk_en; 
input   [11 :0]  mmu_lsu_tlb_wakeup;               
input            pad_yy_icg_scan_en;               
input            pfu_lfb_create_gateclk_en;        
input            pfu_part_empty;                   
input            rb_empty;                         
input            rb_ld_wb_cmplt_req;               
input            rb_ld_wb_data_req;                
input            sd_ex1_inst_vld;                  
input   [11 :0]  sq_data_depd_wakeup;              
input            sq_empty;                         
input   [11 :0]  sq_global_depd_wakeup;            
input            st_ag_inst_vld;                   
input            st_ag_stall_ori;                  
input   [11 :0]  st_ag_stall_restart_entry;        
input            st_da_borrow_vld;                 
input   [11 :0]  st_da_ecc_wakeup;                 
input   [11 :0]  st_da_idu_already_da;             
input   [11 :0]  st_da_idu_bkpta_data;             
input   [11 :0]  st_da_idu_bkptb_data;             
input   [11 :0]  st_da_idu_boundary_gateclk_en;    
input   [11 :0]  st_da_idu_pop_entry;              
input            st_da_idu_pop_vld;                
input   [11 :0]  st_da_idu_rb_full;                
input   [11 :0]  st_da_idu_secd;                   
input   [11 :0]  st_da_idu_spec_fail;              
input   [11 :0]  st_da_idu_wait_fence;             
input            st_da_inst_vld;                   
input            st_da_rb_create_gateclk_en;       
input            st_da_rb_full_gateclk_en;         
input            st_da_wait_fence_gateclk_en;      
input            st_dc_borrow_vld;                 
input   [11 :0]  st_dc_idu_sq_full;                
input   [11 :0]  st_dc_idu_tlb_busy;               
input   [11 :0]  st_dc_imme_wakeup;                
input            st_dc_inst_vld;                   
input            st_dc_sq_full_gateclk_en;         
input            st_dc_tlb_busy_gateclk_en;        
input            st_wb_inst_vld;                   
input            vb_empty;                         
input            vmb_empty;                        
input            vmb_ld_wb_data_req;               
input   [11 :0]  wmb_depd_wakeup;                  
input            wmb_empty;                        
input            wmb_ld_wb_data_req;               
input            wmb_no_op;                        
input            wmb_st_wb_cmplt_req;              
input            wmb_write_req_icc;                
output           ctrl_ld_clk;                      
output           ctrl_st_clk;                      
output  [183:0]  lsu_had_debug_info;               
output           lsu_had_no_op;                    
output           lsu_hpcp_cache_read_access;       
output           lsu_hpcp_cache_read_miss;         
output           lsu_hpcp_cache_write_access;      
output           lsu_hpcp_cache_write_miss;        
output           lsu_hpcp_fence_stall;             
output           lsu_hpcp_ld_stall_cross_4k;       
output           lsu_hpcp_ld_stall_other;          
output           lsu_hpcp_replay_data_discard;     
output           lsu_hpcp_replay_discard_sq;       
output           lsu_hpcp_st_stall_cross_4k;       
output           lsu_hpcp_st_stall_other;          
output  [1  :0]  lsu_hpcp_unalign_inst;            
output  [11 :0]  lsu_idu_already_da;               
output  [11 :0]  lsu_idu_bkpta_data;               
output  [11 :0]  lsu_idu_bkptb_data;               
output  [11 :0]  lsu_idu_lq_full;                  
output           lsu_idu_lq_full_gateclk_en;       
output           lsu_idu_lsiq_pop0_vld;            
output           lsu_idu_lsiq_pop1_vld;            
output  [11 :0]  lsu_idu_lsiq_pop_entry;           
output           lsu_idu_lsiq_pop_vld;             
output  [11 :0]  lsu_idu_rb_full;                  
output           lsu_idu_rb_full_gateclk_en;       
output  [11 :0]  lsu_idu_secd;                     
output  [11 :0]  lsu_idu_spec_fail;                
output  [11 :0]  lsu_idu_sq_full;                  
output           lsu_idu_sq_full_gateclk_en;       
output  [11 :0]  lsu_idu_tlb_busy;                 
output           lsu_idu_tlb_busy_gateclk_en;      
output  [11 :0]  lsu_idu_tlb_wakeup;               
output  [11 :0]  lsu_idu_unalign_gateclk_en;       
output  [11 :0]  lsu_idu_wait_fence;               
output           lsu_idu_wait_fence_gateclk_en;    
output  [11 :0]  lsu_idu_wait_old;                 
output           lsu_idu_wait_old_gateclk_en;      
output  [11 :0]  lsu_idu_wakeup;                   
output  [3  :0]  lsu_pfu_l1_dist_sel;              
output  [3  :0]  lsu_pfu_l2_dist_sel;              
output           lsu_special_clk;                  
output           lsu_yy_xx_no_op;                  

// &Regs; @28
reg              lsu_hpcp_cache_read_access;       
reg              lsu_hpcp_cache_read_miss;         
reg              lsu_hpcp_cache_write_access;      
reg              lsu_hpcp_cache_write_miss;        
reg              lsu_hpcp_fence_stall;             
reg              lsu_hpcp_ld_stall_cross_4k;       
reg              lsu_hpcp_ld_stall_other;          
reg              lsu_hpcp_replay_data_discard;     
reg              lsu_hpcp_replay_discard_sq;       
reg              lsu_hpcp_st_stall_cross_4k;       
reg              lsu_hpcp_st_stall_other;          
reg     [1  :0]  lsu_hpcp_unalign_inst;            
reg     [3  :0]  lsu_pfu_l1_dist_sel;              
reg     [3  :0]  lsu_pfu_l2_dist_sel;              

// &Wires; @29
wire             cp0_lsu_clk;                      
wire             cp0_lsu_clk_en;                   
wire    [1  :0]  cp0_lsu_dcache_pref_dist;         
wire             cp0_lsu_icg_en;                   
wire    [3  :0]  cp0_lsu_l1_dist_sel;              
wire    [3  :0]  cp0_lsu_l2_dist_sel;              
wire    [1  :0]  cp0_lsu_l2_pref_dist;             
wire             cp0_lsu_up_vld;                   
wire             cp0_yy_clk_en;                    
wire             cpurst_b;                         
wire             ctrl_ld_clk;                      
wire             ctrl_ld_clk_en;                   
wire             ctrl_st_clk;                      
wire             ctrl_st_clk_en;                   
wire             dcache_arb_ld_dc_borrow_vld_gate; 
wire             dcache_arb_st_dc_borrow_vld_gate; 
wire             forever_cpuclk;                   
wire             hpcp_lsu_cnt_en;                  
wire             icc_vb_create_gateclk_en;         
wire             idu_lsu_rf_pipe3_gateclk_sel;     
wire             idu_lsu_rf_pipe3_sel;             
wire             idu_lsu_rf_pipe4_gateclk_sel;     
wire             idu_lsu_rf_pipe4_sel;             
wire             idu_lsu_rf_pipe5_gateclk_sel;     
wire             idu_lsu_vmb_create0_gateclk_en;   
wire             idu_lsu_vmb_create1_gateclk_en;   
wire             ld_ag_inst_vld;                   
wire             ld_ag_stall_ori;                  
wire    [11 :0]  ld_ag_stall_restart_entry;        
wire             ld_da_borrow_vld;                 
wire    [11 :0]  ld_da_ecc_wakeup;                 
wire    [11 :0]  ld_da_idu_already_da;             
wire    [11 :0]  ld_da_idu_bkpta_data;             
wire    [11 :0]  ld_da_idu_bkptb_data;             
wire    [11 :0]  ld_da_idu_boundary_gateclk_en;    
wire    [11 :0]  ld_da_idu_pop_entry;              
wire             ld_da_idu_pop_vld;                
wire    [11 :0]  ld_da_idu_rb_full;                
wire    [11 :0]  ld_da_idu_secd;                   
wire    [11 :0]  ld_da_idu_spec_fail;              
wire    [11 :0]  ld_da_idu_wait_fence;             
wire             ld_da_inst_vld;                   
wire             ld_da_rb_full_gateclk_en;         
wire             ld_da_special_gateclk_en;         
wire             ld_da_wait_fence_gateclk_en;      
wire             ld_dc_borrow_vld;                 
wire    [11 :0]  ld_dc_idu_lq_full;                
wire    [11 :0]  ld_dc_idu_tlb_busy;               
wire    [11 :0]  ld_dc_imme_wakeup;                
wire             ld_dc_inst_vld;                   
wire             ld_dc_lq_full_gateclk_en;         
wire             ld_dc_tlb_busy_gateclk_en;        
wire    [11 :0]  ld_rf_imme_wakeup;                
wire             ld_rf_restart_vld;                
wire             ld_wb_data_vld;                   
wire             ld_wb_inst_vld;                   
wire    [11 :0]  lfb_depd_wakeup;                  
wire             lfb_empty;                        
wire             lfb_pop_depd_ff;                  
wire             lm_lfb_depd_wakeup;               
wire    [2  :0]  lsu_had_amr_state;                
wire    [1  :0]  lsu_had_cdr_state;                
wire    [5  :0]  lsu_had_ctcq_entry_2_cmplt;       
wire    [5  :0]  lsu_had_ctcq_entry_cmplt;         
wire    [5  :0]  lsu_had_ctcq_entry_vld;           
wire    [183:0]  lsu_had_debug_info;               
wire    [2  :0]  lsu_had_icc_state;                
wire    [7  :0]  lsu_had_lfb_addr_entry_dcache_hit; 
wire    [7  :0]  lsu_had_lfb_addr_entry_rcl_done;  
wire    [7  :0]  lsu_had_lfb_addr_entry_vld;       
wire    [1  :0]  lsu_had_lfb_data_entry_last;      
wire    [1  :0]  lsu_had_lfb_data_entry_vld;       
wire             lsu_had_lfb_lf_sm_vld;            
wire    [12 :0]  lsu_had_lfb_wakeup_queue;         
wire    [2  :0]  lsu_had_lm_state;                 
wire             lsu_had_mcic_data_req;            
wire             lsu_had_mcic_frz;                 
wire             lsu_had_no_op;                    
wire    [7  :0]  lsu_had_rb_entry_fence;           
wire    [3  :0]  lsu_had_rb_entry_state_0;         
wire    [3  :0]  lsu_had_rb_entry_state_1;         
wire    [3  :0]  lsu_had_rb_entry_state_2;         
wire    [3  :0]  lsu_had_rb_entry_state_3;         
wire    [3  :0]  lsu_had_rb_entry_state_4;         
wire    [3  :0]  lsu_had_rb_entry_state_5;         
wire    [3  :0]  lsu_had_rb_entry_state_6;         
wire    [3  :0]  lsu_had_rb_entry_state_7;         
wire    [2  :0]  lsu_had_sdb_entry_vld;            
wire             lsu_had_snoop_data_req;           
wire             lsu_had_snoop_tag_req;            
wire    [5  :0]  lsu_had_snq_entry_issued;         
wire    [5  :0]  lsu_had_snq_entry_vld;            
wire             lsu_had_sq_not_empty;             
wire    [1  :0]  lsu_had_vb_addr_entry_vld;        
wire    [2  :0]  lsu_had_vb_data_entry_vld;        
wire    [3  :0]  lsu_had_vb_rcl_sm_state;          
wire             lsu_had_wmb_ar_pending;           
wire             lsu_had_wmb_aw_pending;           
wire    [7  :0]  lsu_had_wmb_create_ptr;           
wire    [7  :0]  lsu_had_wmb_data_ptr;             
wire    [7  :0]  lsu_had_wmb_entry_vld;            
wire    [7  :0]  lsu_had_wmb_read_ptr;             
wire             lsu_had_wmb_w_pending;            
wire             lsu_had_wmb_write_imme;           
wire    [7  :0]  lsu_had_wmb_write_ptr;            
wire             lsu_has_fence;                    
wire             lsu_hpcp_clk;                     
wire             lsu_hpcp_clk_en;                  
wire             lsu_hpcp_ld_cache_access;         
wire             lsu_hpcp_ld_cache_miss;           
wire             lsu_hpcp_ld_cross_4k_stall;       
wire             lsu_hpcp_ld_data_discard;         
wire             lsu_hpcp_ld_discard_sq;           
wire             lsu_hpcp_ld_other_stall;          
wire             lsu_hpcp_ld_unalign_inst;         
wire             lsu_hpcp_st_cache_access;         
wire             lsu_hpcp_st_cache_miss;           
wire             lsu_hpcp_st_cross_4k_stall;       
wire             lsu_hpcp_st_other_stall;          
wire             lsu_hpcp_st_unalign_inst;         
wire             lsu_hpcp_up_vld;                  
wire    [11 :0]  lsu_idu_already_da;               
wire    [11 :0]  lsu_idu_bkpta_data;               
wire    [11 :0]  lsu_idu_bkptb_data;               
wire    [11 :0]  lsu_idu_ld_ag_wait_old;           
wire             lsu_idu_ld_ag_wait_old_gateclk_en; 
wire    [11 :0]  lsu_idu_ld_da_wait_old;           
wire             lsu_idu_ld_da_wait_old_gateclk_en; 
wire    [11 :0]  lsu_idu_lq_full;                  
wire             lsu_idu_lq_full_gateclk_en;       
wire             lsu_idu_lsiq_pop0_vld;            
wire             lsu_idu_lsiq_pop1_vld;            
wire    [11 :0]  lsu_idu_lsiq_pop_entry;           
wire             lsu_idu_lsiq_pop_vld;             
wire    [11 :0]  lsu_idu_rb_full;                  
wire             lsu_idu_rb_full_gateclk_en;       
wire    [11 :0]  lsu_idu_secd;                     
wire    [11 :0]  lsu_idu_spec_fail;                
wire    [11 :0]  lsu_idu_sq_full;                  
wire             lsu_idu_sq_full_gateclk_en;       
wire    [11 :0]  lsu_idu_st_ag_wait_old;           
wire             lsu_idu_st_ag_wait_old_gateclk_en; 
wire    [11 :0]  lsu_idu_tlb_busy;                 
wire             lsu_idu_tlb_busy_gateclk_en;      
wire    [11 :0]  lsu_idu_tlb_wakeup;               
wire    [11 :0]  lsu_idu_unalign_gateclk_en;       
wire    [11 :0]  lsu_idu_wait_fence;               
wire             lsu_idu_wait_fence_gateclk_en;    
wire    [11 :0]  lsu_idu_wait_old;                 
wire             lsu_idu_wait_old_gateclk_en;      
wire    [11 :0]  lsu_idu_wakeup;                   
wire             lsu_pref_dist_up;                 
wire             lsu_special_clk;                  
wire             lsu_special_clk_en;               
wire             lsu_yy_xx_no_op;                  
wire    [11 :0]  mmu_lsu_tlb_wakeup;               
wire             pad_yy_icg_scan_en;               
wire             pfu_lfb_create_gateclk_en;        
wire             pfu_part_empty;                   
wire             rb_empty;                         
wire             rb_ld_wb_cmplt_req;               
wire             rb_ld_wb_data_req;                
wire             sd_ex1_inst_vld;                  
wire    [11 :0]  sq_data_depd_wakeup;              
wire             sq_empty;                         
wire    [11 :0]  sq_global_depd_wakeup;            
wire             st_ag_inst_vld;                   
wire             st_ag_stall_ori;                  
wire    [11 :0]  st_ag_stall_restart_entry;        
wire             st_da_borrow_vld;                 
wire    [11 :0]  st_da_ecc_wakeup;                 
wire    [11 :0]  st_da_idu_already_da;             
wire    [11 :0]  st_da_idu_bkpta_data;             
wire    [11 :0]  st_da_idu_bkptb_data;             
wire    [11 :0]  st_da_idu_boundary_gateclk_en;    
wire    [11 :0]  st_da_idu_pop_entry;              
wire             st_da_idu_pop_vld;                
wire    [11 :0]  st_da_idu_rb_full;                
wire    [11 :0]  st_da_idu_secd;                   
wire    [11 :0]  st_da_idu_spec_fail;              
wire    [11 :0]  st_da_idu_wait_fence;             
wire             st_da_inst_vld;                   
wire             st_da_rb_create_gateclk_en;       
wire             st_da_rb_full_gateclk_en;         
wire             st_da_wait_fence_gateclk_en;      
wire             st_dc_borrow_vld;                 
wire    [11 :0]  st_dc_idu_sq_full;                
wire    [11 :0]  st_dc_idu_tlb_busy;               
wire    [11 :0]  st_dc_imme_wakeup;                
wire             st_dc_inst_vld;                   
wire             st_dc_sq_full_gateclk_en;         
wire             st_dc_tlb_busy_gateclk_en;        
wire    [11 :0]  st_rf_imme_wakeup;                
wire             st_rf_restart_vld;                
wire             st_wb_inst_vld;                   
wire             vb_empty;                         
wire             vmb_empty;                        
wire             vmb_ld_wb_data_req;               
wire    [11 :0]  wmb_depd_wakeup;                  
wire             wmb_empty;                        
wire             wmb_ld_wb_data_req;               
wire             wmb_no_op;                        
wire             wmb_st_wb_cmplt_req;              
wire             wmb_write_req_icc;                


parameter LSIQ_ENTRY=12;

//==========================================================
//              Instance of Global Gated Cell
//==========================================================
assign lsu_special_clk_en = ld_da_special_gateclk_en
                            ||  st_da_rb_create_gateclk_en
                            ||  wmb_write_req_icc
                            ||  icc_vb_create_gateclk_en
                            ||  pfu_lfb_create_gateclk_en
                            ||  !rb_empty
                            ||  !vb_empty
                            ||  !lfb_empty
                            ||  !vmb_empty
                            ||  lfb_pop_depd_ff
                            ||  !pfu_part_empty
                            ||  lsu_has_fence
                            ||  lm_lfb_depd_wakeup
			    ||  idu_lsu_vmb_create0_gateclk_en
			    ||  idu_lsu_vmb_create1_gateclk_en;
// &Instance("gated_clk_cell", "x_lsu_special_clk"); @51
gated_clk_cell  x_lsu_special_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lsu_special_clk   ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (lsu_special_clk_en),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @52
//          .external_en   (1'b0               ), @53
//          .global_en     (1'b1               ), @54
//          .module_en     (cp0_lsu_icg_en     ), @55
//          .local_en      (lsu_special_clk_en ), @56
//          .clk_out       (lsu_special_clk    )); @57

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//ctrl_ld_clk is used for ld pipe
assign ctrl_ld_clk_en = idu_lsu_rf_pipe3_gateclk_sel
                        ||  ld_ag_inst_vld
                        ||  ld_dc_inst_vld
                        ||  ld_da_inst_vld
                        ||  rb_ld_wb_cmplt_req
                        ||  ld_wb_inst_vld
                        ||  wmb_ld_wb_data_req
                        ||  vmb_ld_wb_data_req
                        ||  rb_ld_wb_data_req
                        ||  ld_wb_data_vld
                        ||  dcache_arb_ld_dc_borrow_vld_gate
                        ||  ld_dc_borrow_vld
                        ||  ld_da_borrow_vld;
// &Instance("gated_clk_cell", "x_lsu_ctrl_ld_clk"); @76
gated_clk_cell  x_lsu_ctrl_ld_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_ld_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctrl_ld_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @77
//          .external_en   (1'b0               ), @78
//          .global_en     (1'b1               ), @79
//          .module_en     (cp0_lsu_icg_en     ), @80
//          .local_en      (ctrl_ld_clk_en     ), @81
//          .clk_out       (ctrl_ld_clk        )); @82

//ctrl_st_clk is used for st/sd pipe
assign ctrl_st_clk_en = idu_lsu_rf_pipe4_gateclk_sel
                        ||  st_ag_inst_vld
                        ||  idu_lsu_rf_pipe5_gateclk_sel
                        ||  sd_ex1_inst_vld
                        ||  st_dc_inst_vld
                        ||  st_da_inst_vld
                        ||  wmb_st_wb_cmplt_req
                        ||  st_wb_inst_vld
                        ||  dcache_arb_st_dc_borrow_vld_gate
                        ||  st_dc_borrow_vld
                        ||  st_da_borrow_vld;
// &Instance("gated_clk_cell", "x_lsu_ctrl_st_clk"); @96
gated_clk_cell  x_lsu_ctrl_st_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_st_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctrl_st_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @97
//          .external_en   (1'b0               ), @98
//          .global_en     (1'b1               ), @99
//          .module_en     (cp0_lsu_icg_en     ), @100
//          .local_en      (ctrl_st_clk_en     ), @101
//          .clk_out       (ctrl_st_clk        )); @102

assign cp0_lsu_clk_en = cp0_lsu_up_vld;
// &Instance("gated_clk_cell", "x_cp0_lsu_gated_clk"); @105
gated_clk_cell  x_cp0_lsu_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cp0_lsu_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (cp0_lsu_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @106
//          .external_en   (1'b0               ), @107
//          .global_en     (cp0_yy_clk_en      ), @108
//          .module_en     (cp0_lsu_icg_en     ), @109
//          .local_en      (cp0_lsu_clk_en     ), @110
//          .clk_out       (cp0_lsu_clk       )); @111

assign lsu_hpcp_clk_en  = lsu_hpcp_up_vld;
// &Instance("gated_clk_cell", "x_lsu_hpcp_gated_clk"); @115
gated_clk_cell  x_lsu_hpcp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (lsu_hpcp_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lsu_hpcp_clk_en   ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @116
//          .external_en   (1'b0               ), @117
//          .global_en     (cp0_yy_clk_en      ), @118
//          .module_en     (cp0_lsu_icg_en     ), @119
//          .local_en      (lsu_hpcp_clk_en    ), @120
//          .clk_out       (lsu_hpcp_clk       )); @121

//==========================================================
//                Generate cp0 signal
//==========================================================
//for timing, flop some cp0_lsu signals
assign cp0_lsu_l1_dist_sel[3:0] = {cp0_lsu_dcache_pref_dist[1]  &&  cp0_lsu_dcache_pref_dist[0],    //8x
                                  cp0_lsu_dcache_pref_dist[1]  &&  !cp0_lsu_dcache_pref_dist[0],    //4x
                                  !cp0_lsu_dcache_pref_dist[1]  &&  cp0_lsu_dcache_pref_dist[0],    //2x
                                  !cp0_lsu_dcache_pref_dist[1]  &&  !cp0_lsu_dcache_pref_dist[0]};  //1x

assign cp0_lsu_l2_dist_sel[3:0] = {cp0_lsu_l2_pref_dist[1]  &&  cp0_lsu_l2_pref_dist[0],    //8x
                                  cp0_lsu_l2_pref_dist[1]  &&  !cp0_lsu_l2_pref_dist[0],    //4x
                                  !cp0_lsu_l2_pref_dist[1]  &&  cp0_lsu_l2_pref_dist[0],    //2x
                                  !cp0_lsu_l2_pref_dist[1]  &&  !cp0_lsu_l2_pref_dist[0]};  //1x

assign lsu_pref_dist_up = (lsu_pfu_l1_dist_sel[3:0] 
                              !=  cp0_lsu_l1_dist_sel[3:0])
                          ||  (lsu_pfu_l2_dist_sel[3:0]
                              !=  cp0_lsu_l2_dist_sel[3:0]);

assign cp0_lsu_up_vld   =  lsu_pref_dist_up;

// &Force("output","lsu_pfu_l1_dist_sel"); @145
// &Force("output","lsu_pfu_l2_dist_sel"); @146
always @(posedge cp0_lsu_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lsu_pfu_l1_dist_sel[3:0]  <= 4'b0;
    lsu_pfu_l2_dist_sel[3:0]  <= 4'b0;
  end
  else if(cp0_lsu_up_vld)
  begin
    lsu_pfu_l1_dist_sel[3:0]  <=  cp0_lsu_l1_dist_sel[3:0];
    lsu_pfu_l2_dist_sel[3:0]  <=  cp0_lsu_l2_dist_sel[3:0];
  end
end

//==========================================================
//        interface to hpcp
//==========================================================
// &Force("output","lsu_hpcp_cache_read_access"); @170
// &Force("output","lsu_hpcp_cache_read_miss"); @171
// &Force("output","lsu_hpcp_cache_write_access"); @172
// &Force("output","lsu_hpcp_cache_write_miss"); @173
// &Force("output","lsu_hpcp_replay_discard_sq"); @174
// &Force("output","lsu_hpcp_replay_data_discard"); @175
// &Force("output","lsu_hpcp_ld_stall_cross_4k"); @176
// &Force("output","lsu_hpcp_ld_stall_other"); @177
// &Force("output","lsu_hpcp_st_stall_cross_4k"); @178
// &Force("output","lsu_hpcp_st_stall_other"); @179
// &Force("output","lsu_hpcp_fence_stall"); @180
// &Force("output","lsu_hpcp_unalign_inst"); @181

assign lsu_hpcp_up_vld  = (ld_da_inst_vld
                           || st_da_inst_vld
                           || ld_ag_inst_vld
                           || st_ag_inst_vld
                           || lsu_has_fence
                           || lsu_hpcp_cache_read_access
                           || lsu_hpcp_cache_read_miss
                           || lsu_hpcp_cache_write_access
                           || lsu_hpcp_cache_write_miss
                           || lsu_hpcp_replay_discard_sq
                           || lsu_hpcp_replay_data_discard
                           || lsu_hpcp_ld_stall_cross_4k
                           || lsu_hpcp_ld_stall_other
                           || lsu_hpcp_st_stall_cross_4k
                           || lsu_hpcp_st_stall_other
                           || lsu_hpcp_ld_unalign_inst
                           || lsu_hpcp_st_unalign_inst
                           || lsu_hpcp_fence_stall)
                          &&  hpcp_lsu_cnt_en;
always @(posedge lsu_hpcp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lsu_hpcp_cache_read_access    <= 1'b0;
    lsu_hpcp_cache_read_miss      <= 1'b0; 
    lsu_hpcp_cache_write_access   <= 1'b0;
    lsu_hpcp_cache_write_miss     <= 1'b0; 
    lsu_hpcp_replay_discard_sq    <= 1'b0; 
    lsu_hpcp_replay_data_discard  <= 1'b0; 
    lsu_hpcp_ld_stall_cross_4k    <= 1'b0; 
    lsu_hpcp_ld_stall_other       <= 1'b0;
    lsu_hpcp_st_stall_cross_4k    <= 1'b0; 
    lsu_hpcp_st_stall_other       <= 1'b0;
    lsu_hpcp_unalign_inst[1:0]    <= 2'b0; 
    lsu_hpcp_fence_stall          <= 1'b0; 
  end
  else if(lsu_hpcp_up_vld)
  begin
    lsu_hpcp_cache_read_access    <= lsu_hpcp_ld_cache_access;
    lsu_hpcp_cache_read_miss      <= lsu_hpcp_ld_cache_miss;
    lsu_hpcp_cache_write_access   <= lsu_hpcp_st_cache_access;
    lsu_hpcp_cache_write_miss     <= lsu_hpcp_st_cache_miss;
    lsu_hpcp_replay_discard_sq    <= lsu_hpcp_ld_discard_sq; 
    lsu_hpcp_replay_data_discard  <= lsu_hpcp_ld_data_discard; 
    lsu_hpcp_ld_stall_cross_4k    <= lsu_hpcp_ld_cross_4k_stall; 
    lsu_hpcp_ld_stall_other       <= lsu_hpcp_ld_other_stall; 
    lsu_hpcp_st_stall_cross_4k    <= lsu_hpcp_st_cross_4k_stall; 
    lsu_hpcp_st_stall_other       <= lsu_hpcp_st_other_stall; 
    lsu_hpcp_unalign_inst[1:0]    <= {1'b0,lsu_hpcp_ld_unalign_inst} + {1'b0,lsu_hpcp_st_unalign_inst}; 
    lsu_hpcp_fence_stall          <= lsu_has_fence; 
  end
end

//==========================================================
//        Pipeline signal
//==========================================================
//------------------rf stage--------------------------------
assign ld_rf_restart_vld                  = idu_lsu_rf_pipe3_sel
                                            &&  ld_ag_stall_ori;
assign ld_rf_imme_wakeup[LSIQ_ENTRY-1:0]  = ld_ag_stall_restart_entry[LSIQ_ENTRY-1:0]
                                            & {LSIQ_ENTRY{ld_rf_restart_vld}};

assign st_rf_restart_vld                  = idu_lsu_rf_pipe4_sel
                                            &&  st_ag_stall_ori;
assign st_rf_imme_wakeup[LSIQ_ENTRY-1:0]  = st_ag_stall_restart_entry[LSIQ_ENTRY-1:0]
                                            & {LSIQ_ENTRY{st_rf_restart_vld}};
//------------------ag stage--------------------------------
assign lsu_idu_tlb_busy[LSIQ_ENTRY-1:0]   = ld_dc_idu_tlb_busy[LSIQ_ENTRY-1:0]
                                            | st_dc_idu_tlb_busy[LSIQ_ENTRY-1:0];
//------------------dc stage--------------------------------
assign lsu_idu_lq_full[LSIQ_ENTRY-1:0]    = ld_dc_idu_lq_full[LSIQ_ENTRY-1:0];
assign lsu_idu_sq_full[LSIQ_ENTRY-1:0]    = st_dc_idu_sq_full[LSIQ_ENTRY-1:0];
//------------------da stage--------------------------------
assign lsu_idu_wait_fence[LSIQ_ENTRY-1:0] = ld_da_idu_wait_fence[LSIQ_ENTRY-1:0]
                                            | st_da_idu_wait_fence[LSIQ_ENTRY-1:0];
assign lsu_idu_rb_full[LSIQ_ENTRY-1:0]    = ld_da_idu_rb_full[LSIQ_ENTRY-1:0]
                                            | st_da_idu_rb_full[LSIQ_ENTRY-1:0];
assign lsu_idu_already_da[LSIQ_ENTRY-1:0] = ld_da_idu_already_da[LSIQ_ENTRY-1:0]
                                            | st_da_idu_already_da[LSIQ_ENTRY-1:0];

//---------------boundary signal----------------------------
assign lsu_idu_unalign_gateclk_en[LSIQ_ENTRY-1:0] = 
                ld_da_idu_boundary_gateclk_en[LSIQ_ENTRY-1:0]
                | st_da_idu_boundary_gateclk_en[LSIQ_ENTRY-1:0];

assign lsu_idu_secd[LSIQ_ENTRY-1:0]       = ld_da_idu_secd[LSIQ_ENTRY-1:0]
                                            | st_da_idu_secd[LSIQ_ENTRY-1:0];
assign lsu_idu_spec_fail[LSIQ_ENTRY-1:0]  = ld_da_idu_spec_fail[LSIQ_ENTRY-1:0]
                                            | st_da_idu_spec_fail[LSIQ_ENTRY-1:0];
assign lsu_idu_bkpta_data[LSIQ_ENTRY-1:0] = ld_da_idu_bkpta_data[LSIQ_ENTRY-1:0]
                                            | st_da_idu_bkpta_data[LSIQ_ENTRY-1:0];
assign lsu_idu_bkptb_data[LSIQ_ENTRY-1:0] = ld_da_idu_bkptb_data[LSIQ_ENTRY-1:0]
                                            | st_da_idu_bkptb_data[LSIQ_ENTRY-1:0];

//------------------pop signals-----------------------------
assign lsu_idu_lsiq_pop_vld               = ld_da_idu_pop_vld
                                            ||  st_da_idu_pop_vld;
assign lsu_idu_lsiq_pop_entry[LSIQ_ENTRY-1:0] = ld_da_idu_pop_entry[LSIQ_ENTRY-1:0]
                                                | st_da_idu_pop_entry[LSIQ_ENTRY-1:0];
//--------------pop num-----------------
//assign lsu_idu_lsiq_pop_num[3:0]  = {2'b0,
//                                    ld_da_lsiq_pop_vld  &  st_da_lsiq_pop_vld,
//                                    ld_da_lsiq_pop_vld  ^  st_da_lsiq_pop_vld};
assign lsu_idu_lsiq_pop0_vld = ld_da_idu_pop_vld;
assign lsu_idu_lsiq_pop1_vld = st_da_idu_pop_vld;

//--------------gateclk-----------------
assign lsu_idu_lq_full_gateclk_en   = ld_dc_lq_full_gateclk_en;
assign lsu_idu_sq_full_gateclk_en   = st_dc_sq_full_gateclk_en;
assign lsu_idu_tlb_busy_gateclk_en  = ld_dc_tlb_busy_gateclk_en
                                      ||  st_dc_tlb_busy_gateclk_en;
assign lsu_idu_rb_full_gateclk_en   = ld_da_rb_full_gateclk_en
                                      ||  st_da_rb_full_gateclk_en;
assign lsu_idu_wait_fence_gateclk_en= ld_da_wait_fence_gateclk_en
                                      ||  st_da_wait_fence_gateclk_en;

//==========================================================
//        Imme & Buffer maintain restart
//==========================================================
assign lsu_idu_wakeup[LSIQ_ENTRY-1:0]       = ld_rf_imme_wakeup[LSIQ_ENTRY-1:0]
                                              | st_rf_imme_wakeup[LSIQ_ENTRY-1:0]
                                              | ld_dc_imme_wakeup[LSIQ_ENTRY-1:0]
                                              | st_dc_imme_wakeup[LSIQ_ENTRY-1:0]
                                              | ld_da_idu_secd[LSIQ_ENTRY-1:0]
                                              | ld_da_ecc_wakeup[LSIQ_ENTRY-1:0]
                                              | st_da_idu_secd[LSIQ_ENTRY-1:0]
                                              | st_da_ecc_wakeup[LSIQ_ENTRY-1:0]
                                              | sq_global_depd_wakeup[LSIQ_ENTRY-1:0]
                                              | sq_data_depd_wakeup[LSIQ_ENTRY-1:0]
                                              | wmb_depd_wakeup[LSIQ_ENTRY-1:0]
                                              | lfb_depd_wakeup[LSIQ_ENTRY-1:0];

assign lsu_idu_tlb_wakeup[LSIQ_ENTRY-1:0] = mmu_lsu_tlb_wakeup[LSIQ_ENTRY-1:0];

//merge idu wakeup
assign lsu_idu_wait_old[LSIQ_ENTRY-1:0] = lsu_idu_ld_ag_wait_old[LSIQ_ENTRY-1:0]
                                          | lsu_idu_st_ag_wait_old[LSIQ_ENTRY-1:0]
                                          | lsu_idu_ld_da_wait_old[LSIQ_ENTRY-1:0];

assign lsu_idu_wait_old_gateclk_en = lsu_idu_ld_ag_wait_old_gateclk_en
                                     | lsu_idu_st_ag_wait_old_gateclk_en
                                     | lsu_idu_ld_da_wait_old_gateclk_en;
//==========================================================
//                Generate no_op signal
//==========================================================
assign lsu_had_no_op    = wmb_no_op
                          &&  sq_empty
                          &&  rb_empty
                          &&  lfb_empty
                          &&  vmb_empty
                          &&  vb_empty;

assign lsu_yy_xx_no_op  = wmb_empty
                          &&  sq_empty
                          &&  rb_empty
                          &&  lfb_empty
                          &&  vmb_empty
                          &&  vb_empty;


assign lsu_had_debug_info[183:0] = {lsu_had_amr_state[2:0],
      lsu_had_icc_state[2:0],
      lsu_had_lfb_addr_entry_vld[7:0],
      lsu_had_lfb_addr_entry_rcl_done[7:0],
      lsu_had_lfb_addr_entry_dcache_hit[7:0],
      lsu_had_lfb_data_entry_vld[1:0],
      lsu_had_lfb_data_entry_last[1:0],
      lsu_had_lfb_lf_sm_vld,
      lsu_had_lfb_wakeup_queue[12:0],
      lsu_had_vb_addr_entry_vld[1:0],
      lsu_had_vb_data_entry_vld[2:0],
      lsu_had_vb_rcl_sm_state[3:0],
      lsu_had_lm_state[2:0],
      lsu_had_mcic_data_req,
      lsu_had_mcic_frz,
      lsu_had_rb_entry_fence[7:0],
      lsu_had_rb_entry_state_0[3:0],
      lsu_had_rb_entry_state_1[3:0],
      lsu_had_rb_entry_state_2[3:0],
      lsu_had_rb_entry_state_3[3:0],
      lsu_had_rb_entry_state_4[3:0],
      lsu_had_rb_entry_state_5[3:0],
      lsu_had_rb_entry_state_6[3:0],
      lsu_had_rb_entry_state_7[3:0],
      lsu_had_sq_not_empty,
      lsu_had_wmb_ar_pending,
      lsu_had_wmb_aw_pending,
      lsu_had_wmb_w_pending,
      lsu_had_wmb_entry_vld[7:0],
      lsu_had_wmb_create_ptr[7:0],
      lsu_had_wmb_write_ptr[7:0],
      lsu_had_wmb_data_ptr[7:0],
      lsu_had_wmb_read_ptr[7:0],
      lsu_had_wmb_write_imme,
      lsu_had_snq_entry_vld[5:0],
      lsu_had_snq_entry_issued[5:0],
      lsu_had_snoop_tag_req,
      lsu_had_snoop_data_req,
      lsu_had_sdb_entry_vld[2:0],
      lsu_had_cdr_state[1:0],
      lsu_had_ctcq_entry_vld[5:0],
      lsu_had_ctcq_entry_cmplt[5:0],
      lsu_had_ctcq_entry_2_cmplt[5:0]      
      };

// &ModuleEnd; @389
endmodule


