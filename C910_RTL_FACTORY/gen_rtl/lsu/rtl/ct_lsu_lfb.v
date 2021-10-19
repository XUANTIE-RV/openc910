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
module ct_lsu_lfb(
  biu_lsu_r_data,
  biu_lsu_r_id,
  biu_lsu_r_last,
  biu_lsu_r_resp,
  biu_lsu_r_vld,
  bus_arb_pfu_ar_sel,
  bus_arb_rb_ar_sel,
  cp0_lsu_dcache_en,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  dcache_arb_lfb_ld_grnt,
  ld_da_idx,
  ld_da_lfb_discard_grnt,
  ld_da_lfb_set_wakeup_queue,
  ld_da_lfb_wakeup_queue_next,
  ld_hit_prefetch,
  lfb_addr_full,
  lfb_addr_less2,
  lfb_dcache_arb_ld_data_gateclk_en,
  lfb_dcache_arb_ld_data_high_din,
  lfb_dcache_arb_ld_data_idx,
  lfb_dcache_arb_ld_data_low_din,
  lfb_dcache_arb_ld_req,
  lfb_dcache_arb_ld_tag_din,
  lfb_dcache_arb_ld_tag_gateclk_en,
  lfb_dcache_arb_ld_tag_idx,
  lfb_dcache_arb_ld_tag_req,
  lfb_dcache_arb_ld_tag_wen,
  lfb_dcache_arb_serial_req,
  lfb_dcache_arb_st_dirty_din,
  lfb_dcache_arb_st_dirty_gateclk_en,
  lfb_dcache_arb_st_dirty_idx,
  lfb_dcache_arb_st_dirty_req,
  lfb_dcache_arb_st_dirty_wen,
  lfb_dcache_arb_st_req,
  lfb_dcache_arb_st_tag_din,
  lfb_dcache_arb_st_tag_gateclk_en,
  lfb_dcache_arb_st_tag_idx,
  lfb_dcache_arb_st_tag_req,
  lfb_dcache_arb_st_tag_wen,
  lfb_depd_wakeup,
  lfb_empty,
  lfb_ld_da_hit_idx,
  lfb_mcic_wakeup,
  lfb_pfu_biu_req_hit_idx,
  lfb_pfu_create_id,
  lfb_pfu_dcache_hit,
  lfb_pfu_dcache_miss,
  lfb_pfu_rready_grnt,
  lfb_pop_depd_ff,
  lfb_rb_biu_req_hit_idx,
  lfb_rb_ca_rready_grnt,
  lfb_rb_create_id,
  lfb_rb_nc_rready_grnt,
  lfb_snq_bypass_data_id,
  lfb_snq_bypass_hit,
  lfb_snq_bypass_share,
  lfb_st_da_hit_idx,
  lfb_vb_addr_tto6,
  lfb_vb_create_dp_vld,
  lfb_vb_create_gateclk_en,
  lfb_vb_create_req,
  lfb_vb_create_vld,
  lfb_vb_id,
  lfb_wmb_read_req_hit_idx,
  lfb_wmb_write_req_hit_idx,
  lm_already_snoop,
  lm_lfb_depd_wakeup,
  lm_state_is_amo_lock,
  lsu_biu_r_linefill_ready,
  lsu_had_lfb_addr_entry_dcache_hit,
  lsu_had_lfb_addr_entry_rcl_done,
  lsu_had_lfb_addr_entry_vld,
  lsu_had_lfb_data_entry_last,
  lsu_had_lfb_data_entry_vld,
  lsu_had_lfb_lf_sm_vld,
  lsu_had_lfb_wakeup_queue,
  lsu_special_clk,
  pad_yy_icg_scan_en,
  pfu_biu_req_addr,
  pfu_lfb_create_dp_vld,
  pfu_lfb_create_gateclk_en,
  pfu_lfb_create_req,
  pfu_lfb_create_vld,
  pfu_lfb_id,
  rb_biu_req_addr,
  rb_lfb_addr_tto4,
  rb_lfb_atomic,
  rb_lfb_boundary_depd_wakeup,
  rb_lfb_create_dp_vld,
  rb_lfb_create_gateclk_en,
  rb_lfb_create_req,
  rb_lfb_create_vld,
  rb_lfb_depd,
  rb_lfb_ldamo,
  rtu_yy_xx_flush,
  snq_bypass_addr_tto6,
  snq_create_lfb_vb_req_hit_idx,
  snq_lfb_bypass_chg_tag,
  snq_lfb_bypass_invalid,
  snq_lfb_vb_req_hit_idx,
  st_da_addr,
  vb_lfb_addr_entry_rcl_done,
  vb_lfb_create_grnt,
  vb_lfb_dcache_dirty,
  vb_lfb_dcache_hit,
  vb_lfb_dcache_way,
  vb_lfb_rcl_done,
  vb_lfb_vb_req_hit_idx,
  wmb_read_req_addr,
  wmb_write_req_addr
);

// &Ports; @30
input   [127:0]  biu_lsu_r_data;                      
input   [4  :0]  biu_lsu_r_id;                        
input            biu_lsu_r_last;                      
input   [3  :0]  biu_lsu_r_resp;                      
input            biu_lsu_r_vld;                       
input            bus_arb_pfu_ar_sel;                  
input            bus_arb_rb_ar_sel;                   
input            cp0_lsu_dcache_en;                   
input            cp0_lsu_icg_en;                      
input            cp0_yy_clk_en;                       
input            cpurst_b;                            
input            dcache_arb_lfb_ld_grnt;              
input   [7  :0]  ld_da_idx;                           
input            ld_da_lfb_discard_grnt;              
input            ld_da_lfb_set_wakeup_queue;          
input   [12 :0]  ld_da_lfb_wakeup_queue_next;         
input            lm_already_snoop;                    
input            lm_lfb_depd_wakeup;                  
input            lm_state_is_amo_lock;                
input            lsu_special_clk;                     
input            pad_yy_icg_scan_en;                  
input   [39 :0]  pfu_biu_req_addr;                    
input            pfu_lfb_create_dp_vld;               
input            pfu_lfb_create_gateclk_en;           
input            pfu_lfb_create_req;                  
input            pfu_lfb_create_vld;                  
input   [3  :0]  pfu_lfb_id;                          
input   [39 :0]  rb_biu_req_addr;                     
input   [35 :0]  rb_lfb_addr_tto4;                    
input            rb_lfb_atomic;                       
input            rb_lfb_boundary_depd_wakeup;         
input            rb_lfb_create_dp_vld;                
input            rb_lfb_create_gateclk_en;            
input            rb_lfb_create_req;                   
input            rb_lfb_create_vld;                   
input            rb_lfb_depd;                         
input            rb_lfb_ldamo;                        
input            rtu_yy_xx_flush;                     
input   [33 :0]  snq_bypass_addr_tto6;                
input            snq_create_lfb_vb_req_hit_idx;       
input   [1  :0]  snq_lfb_bypass_chg_tag;              
input   [1  :0]  snq_lfb_bypass_invalid;              
input            snq_lfb_vb_req_hit_idx;              
input   [39 :0]  st_da_addr;                          
input   [7  :0]  vb_lfb_addr_entry_rcl_done;          
input            vb_lfb_create_grnt;                  
input            vb_lfb_dcache_dirty;                 
input            vb_lfb_dcache_hit;                   
input            vb_lfb_dcache_way;                   
input            vb_lfb_rcl_done;                     
input            vb_lfb_vb_req_hit_idx;               
input   [39 :0]  wmb_read_req_addr;                   
input   [39 :0]  wmb_write_req_addr;                  
output           ld_hit_prefetch;                     
output           lfb_addr_full;                       
output           lfb_addr_less2;                      
output  [7  :0]  lfb_dcache_arb_ld_data_gateclk_en;   
output  [127:0]  lfb_dcache_arb_ld_data_high_din;     
output  [10 :0]  lfb_dcache_arb_ld_data_idx;          
output  [127:0]  lfb_dcache_arb_ld_data_low_din;      
output           lfb_dcache_arb_ld_req;               
output  [53 :0]  lfb_dcache_arb_ld_tag_din;           
output           lfb_dcache_arb_ld_tag_gateclk_en;    
output  [8  :0]  lfb_dcache_arb_ld_tag_idx;           
output           lfb_dcache_arb_ld_tag_req;           
output  [1  :0]  lfb_dcache_arb_ld_tag_wen;           
output           lfb_dcache_arb_serial_req;           
output  [6  :0]  lfb_dcache_arb_st_dirty_din;         
output           lfb_dcache_arb_st_dirty_gateclk_en;  
output  [8  :0]  lfb_dcache_arb_st_dirty_idx;         
output           lfb_dcache_arb_st_dirty_req;         
output  [6  :0]  lfb_dcache_arb_st_dirty_wen;         
output           lfb_dcache_arb_st_req;               
output  [51 :0]  lfb_dcache_arb_st_tag_din;           
output           lfb_dcache_arb_st_tag_gateclk_en;    
output  [8  :0]  lfb_dcache_arb_st_tag_idx;           
output           lfb_dcache_arb_st_tag_req;           
output  [1  :0]  lfb_dcache_arb_st_tag_wen;           
output  [11 :0]  lfb_depd_wakeup;                     
output           lfb_empty;                           
output           lfb_ld_da_hit_idx;                   
output           lfb_mcic_wakeup;                     
output           lfb_pfu_biu_req_hit_idx;             
output  [4  :0]  lfb_pfu_create_id;                   
output  [8  :0]  lfb_pfu_dcache_hit;                  
output  [8  :0]  lfb_pfu_dcache_miss;                 
output           lfb_pfu_rready_grnt;                 
output           lfb_pop_depd_ff;                     
output           lfb_rb_biu_req_hit_idx;              
output           lfb_rb_ca_rready_grnt;               
output  [4  :0]  lfb_rb_create_id;                    
output           lfb_rb_nc_rready_grnt;               
output  [1  :0]  lfb_snq_bypass_data_id;              
output           lfb_snq_bypass_hit;                  
output           lfb_snq_bypass_share;                
output           lfb_st_da_hit_idx;                   
output  [33 :0]  lfb_vb_addr_tto6;                    
output           lfb_vb_create_dp_vld;                
output           lfb_vb_create_gateclk_en;            
output           lfb_vb_create_req;                   
output           lfb_vb_create_vld;                   
output  [2  :0]  lfb_vb_id;                           
output           lfb_wmb_read_req_hit_idx;            
output           lfb_wmb_write_req_hit_idx;           
output           lsu_biu_r_linefill_ready;            
output  [7  :0]  lsu_had_lfb_addr_entry_dcache_hit;   
output  [7  :0]  lsu_had_lfb_addr_entry_rcl_done;     
output  [7  :0]  lsu_had_lfb_addr_entry_vld;          
output  [1  :0]  lsu_had_lfb_data_entry_last;         
output  [1  :0]  lsu_had_lfb_data_entry_vld;          
output           lsu_had_lfb_lf_sm_vld;               
output  [12 :0]  lsu_had_lfb_wakeup_queue;            

// &Regs; @31
reg     [7  :0]  lfb_addr_create_ptr;                 
reg     [1  :0]  lfb_data_create_ptr;                 
reg     [3  :0]  lfb_first_pass_ptr;                  
reg     [7  :0]  lfb_lf_sm_addr_id;                   
reg     [33 :0]  lfb_lf_sm_addr_tto6;                 
reg              lfb_lf_sm_cnt;                       
reg     [1  :0]  lfb_lf_sm_data_id;                   
reg              lfb_lf_sm_dcache_share;              
reg              lfb_lf_sm_refill_way;                
reg     [1  :0]  lfb_lf_sm_req_data_ptr;              
reg              lfb_lf_sm_vld;                       
reg     [3  :0]  lfb_no_rcl_cnt;                      
reg              lfb_pop_depd_ff;                     
reg     [7  :0]  lfb_r_id_hit_addr_ptr;               
reg     [7  :0]  lfb_vb_addr_ptr;                     
reg     [33 :0]  lfb_vb_addr_tto6;                    
reg     [7  :0]  lfb_vb_pe_req_ptr;                   
reg              lfb_vb_req_unmask;                   
reg     [12 :0]  lfb_wakeup_queue;                    

// &Wires; @32
wire    [127:0]  biu_lsu_r_data;                      
wire    [4  :0]  biu_lsu_r_id;                        
wire             biu_lsu_r_last;                      
wire    [3  :0]  biu_lsu_r_resp;                      
wire             biu_lsu_r_vld;                       
wire             bus_arb_pfu_ar_sel;                  
wire             bus_arb_rb_ar_sel;                   
wire             cp0_lsu_dcache_en;                   
wire             cp0_lsu_icg_en;                      
wire             cp0_yy_clk_en;                       
wire             cpurst_b;                            
wire             dcache_arb_lfb_ld_grnt;              
wire    [7  :0]  ld_da_idx;                           
wire             ld_da_lfb_discard_grnt;              
wire             ld_da_lfb_set_wakeup_queue;          
wire    [12 :0]  ld_da_lfb_wakeup_queue_next;         
wire             ld_hit_prefetch;                     
wire    [7  :0]  ld_hit_prefetch_first;               
wire             lfb_addr_all_resp;                   
wire             lfb_addr_create_vld;                 
wire             lfb_addr_empty;                      
wire    [35 :0]  lfb_addr_entry_addr_tto4_0;          
wire    [35 :0]  lfb_addr_entry_addr_tto4_1;          
wire    [35 :0]  lfb_addr_entry_addr_tto4_2;          
wire    [35 :0]  lfb_addr_entry_addr_tto4_3;          
wire    [35 :0]  lfb_addr_entry_addr_tto4_4;          
wire    [35 :0]  lfb_addr_entry_addr_tto4_5;          
wire    [35 :0]  lfb_addr_entry_addr_tto4_6;          
wire    [35 :0]  lfb_addr_entry_addr_tto4_7;          
wire    [7  :0]  lfb_addr_entry_create_gateclk_en;    
wire    [7  :0]  lfb_addr_entry_dcache_hit;           
wire    [7  :0]  lfb_addr_entry_depd;                 
wire    [7  :0]  lfb_addr_entry_discard_vld;          
wire    [7  :0]  lfb_addr_entry_ld_da_hit_idx;        
wire    [7  :0]  lfb_addr_entry_ldamo;                
wire    [7  :0]  lfb_addr_entry_linefill_abort;       
wire    [7  :0]  lfb_addr_entry_linefill_permit;      
wire    [7  :0]  lfb_addr_entry_not_resp;             
wire    [7  :0]  lfb_addr_entry_pfu_biu_req_hit_idx;  
wire    [7  :0]  lfb_addr_entry_pfu_create_dp_vld;    
wire    [7  :0]  lfb_addr_entry_pfu_create_vld;       
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_0;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_1;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_2;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_3;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_4;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_5;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_6;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_hit_7;     
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_0;    
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_1;    
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_2;    
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_3;    
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_4;    
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_5;    
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_6;    
wire    [8  :0]  lfb_addr_entry_pfu_dcache_miss_7;    
wire    [7  :0]  lfb_addr_entry_pop_vld;              
wire    [7  :0]  lfb_addr_entry_rb_biu_req_hit_idx;   
wire    [7  :0]  lfb_addr_entry_rb_create_dp_vld;     
wire    [7  :0]  lfb_addr_entry_rb_create_vld;        
wire    [7  :0]  lfb_addr_entry_rcl_done;             
wire    [7  :0]  lfb_addr_entry_refill_way;           
wire    [7  :0]  lfb_addr_entry_resp_set;             
wire    [7  :0]  lfb_addr_entry_snq_bypass_hit;       
wire    [7  :0]  lfb_addr_entry_st_da_hit_idx;        
wire    [7  :0]  lfb_addr_entry_vb_pe_req;            
wire    [7  :0]  lfb_addr_entry_vb_pe_req_grnt;       
wire    [7  :0]  lfb_addr_entry_vld;                  
wire    [7  :0]  lfb_addr_entry_wmb_read_req_hit_idx; 
wire    [7  :0]  lfb_addr_entry_wmb_write_req_hit_idx; 
wire             lfb_addr_full;                       
wire             lfb_addr_less2;                      
wire             lfb_addr_pfu_create_dp_vld;          
wire             lfb_addr_pfu_create_vld;             
wire             lfb_addr_pop_depd;                   
wire             lfb_addr_pop_discard_vld;            
wire             lfb_addr_rb_create_dp_vld;           
wire             lfb_addr_rb_create_vld;              
wire    [2  :0]  lfb_biu_id_2to0;                     
wire             lfb_biu_r_id_hit;                    
wire             lfb_ca_rready_grnt;                  
wire             lfb_clk;                             
wire             lfb_clk_en;                          
wire    [2  :0]  lfb_create_id;                       
wire             lfb_create_vb_cancel;                
wire             lfb_create_vb_success;               
wire    [7  :0]  lfb_data_addr_pop_req;               
wire             lfb_data_create_dp_vld;              
wire             lfb_data_create_gateclk_en;          
wire             lfb_data_create_vld;                 
wire             lfb_data_empty;                      
wire    [7  :0]  lfb_data_entry_addr_id_0;            
wire    [7  :0]  lfb_data_entry_addr_id_1;            
wire    [7  :0]  lfb_data_entry_addr_pop_req_0;       
wire    [7  :0]  lfb_data_entry_addr_pop_req_1;       
wire    [1  :0]  lfb_data_entry_create_dp_vld;        
wire    [1  :0]  lfb_data_entry_create_gateclk_en;    
wire    [1  :0]  lfb_data_entry_create_vld;           
wire    [511:0]  lfb_data_entry_data_0;               
wire    [511:0]  lfb_data_entry_data_1;               
wire    [1  :0]  lfb_data_entry_dcache_share;         
wire    [1  :0]  lfb_data_entry_full;                 
wire    [1  :0]  lfb_data_entry_last;                 
wire    [1  :0]  lfb_data_entry_lf_sm_req;            
wire    [1  :0]  lfb_data_entry_vld;                  
wire    [1  :0]  lfb_data_entry_wait_surplus;         
wire             lfb_data_not_full;                   
wire             lfb_data_wait_surplus;               
wire    [7  :0]  lfb_dcache_arb_ld_data_gateclk_en;   
wire    [127:0]  lfb_dcache_arb_ld_data_high_din;     
wire    [10 :0]  lfb_dcache_arb_ld_data_idx;          
wire    [127:0]  lfb_dcache_arb_ld_data_low_din;      
wire             lfb_dcache_arb_ld_req;               
wire    [53 :0]  lfb_dcache_arb_ld_tag_din;           
wire             lfb_dcache_arb_ld_tag_gateclk_en;    
wire    [8  :0]  lfb_dcache_arb_ld_tag_idx;           
wire             lfb_dcache_arb_ld_tag_req;           
wire    [1  :0]  lfb_dcache_arb_ld_tag_wen;           
wire             lfb_dcache_arb_serial_req;           
wire    [6  :0]  lfb_dcache_arb_st_dirty_din;         
wire             lfb_dcache_arb_st_dirty_gateclk_en;  
wire    [8  :0]  lfb_dcache_arb_st_dirty_idx;         
wire             lfb_dcache_arb_st_dirty_req;         
wire    [6  :0]  lfb_dcache_arb_st_dirty_wen;         
wire             lfb_dcache_arb_st_req;               
wire    [51 :0]  lfb_dcache_arb_st_tag_din;           
wire             lfb_dcache_arb_st_tag_gateclk_en;    
wire    [8  :0]  lfb_dcache_arb_st_tag_idx;           
wire             lfb_dcache_arb_st_tag_req;           
wire    [1  :0]  lfb_dcache_arb_st_tag_wen;           
wire    [11 :0]  lfb_depd_wakeup;                     
wire             lfb_empty;                           
wire             lfb_ld_da_hit_idx;                   
wire    [7  :0]  lfb_lf_sm_addr_pop_req;              
wire             lfb_lf_sm_clk;                       
wire             lfb_lf_sm_clk_en;                    
wire             lfb_lf_sm_create_vld;                
wire    [255:0]  lfb_lf_sm_data256;                   
wire    [511:0]  lfb_lf_sm_data512;                   
wire             lfb_lf_sm_data_dcache_share;         
wire    [1  :0]  lfb_lf_sm_data_grnt;                 
wire    [1  :0]  lfb_lf_sm_data_pop_req;              
wire    [255:0]  lfb_lf_sm_data_settle;               
wire             lfb_lf_sm_permit;                    
wire             lfb_lf_sm_refill_wakeup;             
wire             lfb_lf_sm_req;                       
wire    [7  :0]  lfb_lf_sm_req_addr_ptr;              
wire    [33 :0]  lfb_lf_sm_req_addr_tto6;             
wire             lfb_lf_sm_req_clk;                   
wire             lfb_lf_sm_req_clk_en;                
wire             lfb_lf_sm_req_depd;                  
wire             lfb_lf_sm_req_refill_way;            
wire             lfb_mcic_wakeup;                     
wire             lfb_nc_rready_grnt;                  
wire    [3  :0]  lfb_no_rcl_cnt_create;               
wire    [3  :0]  lfb_no_rcl_cnt_pop;                  
wire    [3  :0]  lfb_no_rcl_cnt_updt_val;             
wire             lfb_no_rcl_cnt_updt_vld;             
wire    [1  :0]  lfb_pass_addr_5to4;                  
wire             lfb_pfu_biu_req_hit_idx;             
wire             lfb_pfu_create_grnt;                 
wire    [4  :0]  lfb_pfu_create_id;                   
wire    [8  :0]  lfb_pfu_dcache_hit;                  
wire    [8  :0]  lfb_pfu_dcache_miss;                 
wire             lfb_pfu_rready_grnt;                 
wire             lfb_r_resp_err;                      
wire             lfb_r_resp_share;                    
wire             lfb_rb_biu_req_hit_idx;              
wire             lfb_rb_ca_rready_grnt;               
wire             lfb_rb_create_grnt;                  
wire    [4  :0]  lfb_rb_create_id;                    
wire             lfb_rb_nc_rready_grnt;               
wire    [1  :0]  lfb_snq_bypass_data_id;              
wire             lfb_snq_bypass_hit;                  
wire             lfb_snq_bypass_share;                
wire             lfb_st_da_hit_idx;                   
wire             lfb_vb_create_dp_vld;                
wire             lfb_vb_create_gateclk_en;            
wire             lfb_vb_create_req;                   
wire             lfb_vb_create_vld;                   
wire    [2  :0]  lfb_vb_id;                           
wire             lfb_vb_pe_all_req;                   
wire             lfb_vb_pe_clk;                       
wire             lfb_vb_pe_clk_en;                    
wire             lfb_vb_pe_pfu_req;                   
wire             lfb_vb_pe_rb_req;                    
wire             lfb_vb_pe_req;                       
wire    [33 :0]  lfb_vb_pe_req_addr_tto6;             
wire             lfb_vb_pe_req_permit;                
wire             lfb_vb_req_entry_vld;                
wire             lfb_vb_req_hit_idx;                  
wire             lfb_vb_req_ldamo;                    
wire    [12 :0]  lfb_wakeup_queue_after_pop;          
wire             lfb_wakeup_queue_clk;                
wire             lfb_wakeup_queue_clk_en;             
wire    [12 :0]  lfb_wakeup_queue_next;               
wire             lfb_wmb_read_req_hit_idx;            
wire             lfb_wmb_write_req_hit_idx;           
wire             lm_already_snoop;                    
wire             lm_lfb_depd_wakeup;                  
wire             lm_state_is_amo_lock;                
wire             lsu_biu_r_linefill_ready;            
wire    [7  :0]  lsu_had_lfb_addr_entry_dcache_hit;   
wire    [7  :0]  lsu_had_lfb_addr_entry_rcl_done;     
wire    [7  :0]  lsu_had_lfb_addr_entry_vld;          
wire    [1  :0]  lsu_had_lfb_data_entry_last;         
wire    [1  :0]  lsu_had_lfb_data_entry_vld;          
wire             lsu_had_lfb_lf_sm_vld;               
wire    [12 :0]  lsu_had_lfb_wakeup_queue;            
wire             lsu_special_clk;                     
wire             pad_yy_icg_scan_en;                  
wire    [39 :0]  pfu_biu_req_addr;                    
wire             pfu_lfb_create_dp_vld;               
wire             pfu_lfb_create_gateclk_en;           
wire             pfu_lfb_create_req;                  
wire             pfu_lfb_create_vld;                  
wire    [3  :0]  pfu_lfb_id;                          
wire    [39 :0]  rb_biu_req_addr;                     
wire    [35 :0]  rb_lfb_addr_tto4;                    
wire             rb_lfb_atomic;                       
wire             rb_lfb_boundary_depd_wakeup;         
wire             rb_lfb_create_dp_vld;                
wire             rb_lfb_create_gateclk_en;            
wire             rb_lfb_create_req;                   
wire             rb_lfb_create_vld;                   
wire             rb_lfb_depd;                         
wire             rb_lfb_ldamo;                        
wire             rtu_yy_xx_flush;                     
wire    [33 :0]  snq_bypass_addr_tto6;                
wire             snq_create_lfb_vb_req_hit_idx;       
wire    [1  :0]  snq_lfb_bypass_chg_tag;              
wire    [1  :0]  snq_lfb_bypass_invalid;              
wire             snq_lfb_vb_req_hit_idx;              
wire    [39 :0]  st_da_addr;                          
wire    [7  :0]  vb_lfb_addr_entry_rcl_done;          
wire             vb_lfb_create_grnt;                  
wire             vb_lfb_dcache_dirty;                 
wire             vb_lfb_dcache_hit;                   
wire             vb_lfb_dcache_way;                   
wire             vb_lfb_rcl_done;                     
wire             vb_lfb_vb_req_hit_idx;               
wire    [39 :0]  wmb_read_req_addr;                   
wire    [39 :0]  wmb_write_req_addr;                  


parameter LSIQ_ENTRY      = 12,
          LFB_ADDR_ENTRY  = 8,
          LFB_DATA_ENTRY  = 2;
parameter BIU_LFB_ID_T    = 2'b00;
parameter OKAY            = 2'b00,
          EXOKAY          = 2'b01,
          SLVERR          = 2'b10,
          DECERR          = 2'b11;


//==========================================================
//                 Instance of Gated Cell  
//==========================================================
//if lfb has entry or create lfb, then this gateclk is on
//lfb_clk is only used for depd_ff now
assign lfb_clk_en = !lfb_empty
                    ||  rb_lfb_create_gateclk_en
                    ||  pfu_lfb_create_gateclk_en
                    ||  rb_lfb_boundary_depd_wakeup
                    ||  lfb_pop_depd_ff
                    ||  lm_lfb_depd_wakeup;
// &Instance("gated_clk_cell", "x_lsu_lfb_gated_clk"); @55
gated_clk_cell  x_lsu_lfb_gated_clk (
  .clk_in             (lsu_special_clk   ),
  .clk_out            (lfb_clk           ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lfb_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (lsu_special_clk     ), @56
//          .external_en   (1'b0               ), @57
//          .global_en     (cp0_yy_clk_en      ), @58
//          .module_en     (cp0_lsu_icg_en     ), @59
//          .local_en      (lfb_clk_en         ), @60
//          .clk_out       (lfb_clk            )); @61

//req vb pop entry signal
assign lfb_vb_pe_clk_en   = !lfb_vb_req_unmask
                                &&  (lfb_vb_pe_req
                                    ||  rb_lfb_create_req
                                    ||  pfu_lfb_create_req)
                            ||  lfb_create_vb_cancel
                            ||  lfb_create_vb_success;
// &Instance("gated_clk_cell", "x_lsu_lfb_vb_pe_clk"); @70
gated_clk_cell  x_lsu_lfb_vb_pe_clk (
  .clk_in             (lsu_special_clk   ),
  .clk_out            (lfb_vb_pe_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lfb_vb_pe_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (lsu_special_clk     ), @71
//          .external_en   (1'b0               ), @72
//          .global_en     (cp0_yy_clk_en      ), @73
//          .module_en     (cp0_lsu_icg_en     ), @74
//          .local_en      (lfb_vb_pe_clk_en   ), @75
//          .clk_out       (lfb_vb_pe_clk      )); @76

//lf state machine
assign lfb_lf_sm_clk_en = lfb_lf_sm_req
                          ||  lfb_lf_sm_vld;
// &Instance("gated_clk_cell", "x_lsu_lfb_lf_sm_clk"); @81
gated_clk_cell  x_lsu_lfb_lf_sm_clk (
  .clk_in             (lsu_special_clk   ),
  .clk_out            (lfb_lf_sm_clk     ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (lfb_lf_sm_clk_en  ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (lsu_special_clk     ), @82
//          .external_en   (1'b0               ), @83
//          .global_en     (cp0_yy_clk_en      ), @84
//          .module_en     (cp0_lsu_icg_en     ), @85
//          .local_en      (lfb_lf_sm_clk_en   ), @86
//          .clk_out       (lfb_lf_sm_clk      )); @87

assign lfb_lf_sm_req_clk_en = lfb_lf_sm_req
                              &&  lfb_lf_sm_permit;
// &Instance("gated_clk_cell", "x_lsu_lfb_lf_sm_req_clk"); @91
gated_clk_cell  x_lsu_lfb_lf_sm_req_clk (
  .clk_in               (lsu_special_clk     ),
  .clk_out              (lfb_lf_sm_req_clk   ),
  .external_en          (1'b0                ),
  .global_en            (cp0_yy_clk_en       ),
  .local_en             (lfb_lf_sm_req_clk_en),
  .module_en            (cp0_lsu_icg_en      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in        (lsu_special_clk     ), @92
//          .external_en   (1'b0               ), @93
//          .global_en     (cp0_yy_clk_en      ), @94
//          .module_en     (cp0_lsu_icg_en     ), @95
//          .local_en      (lfb_lf_sm_req_clk_en), @96
//          .clk_out       (lfb_lf_sm_req_clk  )); @97


assign lfb_wakeup_queue_clk_en  = lfb_pop_depd_ff
                                  ||  ld_da_lfb_set_wakeup_queue
                                  ||  rtu_yy_xx_flush;
// &Instance("gated_clk_cell", "x_lsu_lfb_wakeup_queue_gated_clk"); @103
gated_clk_cell  x_lsu_lfb_wakeup_queue_gated_clk (
  .clk_in                  (lsu_special_clk        ),
  .clk_out                 (lfb_wakeup_queue_clk   ),
  .external_en             (1'b0                   ),
  .global_en               (cp0_yy_clk_en          ),
  .local_en                (lfb_wakeup_queue_clk_en),
  .module_en               (cp0_lsu_icg_en         ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     )
);

// &Connect(.clk_in        (lsu_special_clk     ), @104
//          .external_en   (1'b0               ), @105
//          .global_en     (cp0_yy_clk_en      ), @106
//          .module_en     (cp0_lsu_icg_en     ), @107
//          .local_en      (lfb_wakeup_queue_clk_en), @108
//          .clk_out       (lfb_wakeup_queue_clk)); @109

//==========================================================
//              Instance addr entry
//==========================================================
//8 addr entry
// &ConnRule(s/_x$/[0]/); @115
// &ConnRule(s/_v$/_0/); @116
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_0"); @117
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_0 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[0]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_0             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[0]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[0]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[0]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[0]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[0]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[0]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[0]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[0]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[0]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[0]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[0]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[0]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_0        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_0       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[0]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[0]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[0]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[0]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[0]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[0]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[0]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[0]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[0]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[0]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[0]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[0]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[0] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[0]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[0]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[0]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[0]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


// &ConnRule(s/_x$/[1]/); @119
// &ConnRule(s/_v$/_1/); @120
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_1"); @121
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_1 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[1]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_1             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[1]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[1]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[1]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[1]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[1]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[1]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[1]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[1]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[1]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[1]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[1]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[1]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_1        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_1       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[1]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[1]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[1]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[1]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[1]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[1]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[1]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[1]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[1]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[1]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[1]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[1]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[1] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[1]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[1]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[1]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[1]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


// &ConnRule(s/_x$/[2]/); @123
// &ConnRule(s/_v$/_2/); @124
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_2"); @125
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_2 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[2]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_2             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[2]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[2]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[2]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[2]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[2]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[2]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[2]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[2]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[2]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[2]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[2]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[2]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_2        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_2       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[2]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[2]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[2]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[2]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[2]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[2]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[2]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[2]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[2]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[2]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[2]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[2]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[2] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[2]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[2]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[2]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[2]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


// &ConnRule(s/_x$/[3]/); @127
// &ConnRule(s/_v$/_3/); @128
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_3"); @129
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_3 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[3]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_3             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[3]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[3]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[3]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[3]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[3]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[3]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[3]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[3]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[3]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[3]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[3]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[3]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_3        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_3       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[3]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[3]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[3]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[3]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[3]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[3]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[3]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[3]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[3]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[3]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[3]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[3]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[3] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[3]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[3]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[3]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[3]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


// &ConnRule(s/_x$/[4]/); @131
// &ConnRule(s/_v$/_4/); @132
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_4"); @133
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_4 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[4]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_4             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[4]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[4]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[4]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[4]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[4]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[4]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[4]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[4]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[4]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[4]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[4]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[4]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_4        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_4       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[4]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[4]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[4]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[4]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[4]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[4]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[4]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[4]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[4]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[4]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[4]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[4]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[4] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[4]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[4]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[4]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[4]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


// &ConnRule(s/_x$/[5]/); @135
// &ConnRule(s/_v$/_5/); @136
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_5"); @137
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_5 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[5]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_5             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[5]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[5]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[5]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[5]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[5]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[5]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[5]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[5]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[5]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[5]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[5]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[5]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_5        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_5       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[5]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[5]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[5]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[5]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[5]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[5]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[5]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[5]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[5]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[5]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[5]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[5]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[5] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[5]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[5]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[5]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[5]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


// &ConnRule(s/_x$/[6]/); @139
// &ConnRule(s/_v$/_6/); @140
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_6"); @141
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_6 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[6]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_6             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[6]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[6]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[6]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[6]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[6]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[6]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[6]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[6]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[6]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[6]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[6]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[6]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_6        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_6       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[6]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[6]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[6]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[6]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[6]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[6]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[6]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[6]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[6]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[6]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[6]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[6]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[6] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[6]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[6]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[6]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[6]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


// &ConnRule(s/_x$/[7]/); @143
// &ConnRule(s/_v$/_7/); @144
// &Instance("ct_lsu_lfb_addr_entry","x_ct_lsu_lfb_addr_entry_7"); @145
ct_lsu_lfb_addr_entry  x_ct_lsu_lfb_addr_entry_7 (
  .cp0_lsu_dcache_en                       (cp0_lsu_dcache_en                      ),
  .cp0_lsu_icg_en                          (cp0_lsu_icg_en                         ),
  .cp0_yy_clk_en                           (cp0_yy_clk_en                          ),
  .cpurst_b                                (cpurst_b                               ),
  .ld_da_idx                               (ld_da_idx                              ),
  .ld_da_lfb_discard_grnt                  (ld_da_lfb_discard_grnt                 ),
  .ld_hit_prefetch_first_x                 (ld_hit_prefetch_first[7]               ),
  .lfb_addr_entry_addr_tto4_v              (lfb_addr_entry_addr_tto4_7             ),
  .lfb_addr_entry_create_gateclk_en_x      (lfb_addr_entry_create_gateclk_en[7]    ),
  .lfb_addr_entry_dcache_hit_x             (lfb_addr_entry_dcache_hit[7]           ),
  .lfb_addr_entry_depd_x                   (lfb_addr_entry_depd[7]                 ),
  .lfb_addr_entry_discard_vld_x            (lfb_addr_entry_discard_vld[7]          ),
  .lfb_addr_entry_ld_da_hit_idx_x          (lfb_addr_entry_ld_da_hit_idx[7]        ),
  .lfb_addr_entry_ldamo_x                  (lfb_addr_entry_ldamo[7]                ),
  .lfb_addr_entry_linefill_abort_x         (lfb_addr_entry_linefill_abort[7]       ),
  .lfb_addr_entry_linefill_permit_x        (lfb_addr_entry_linefill_permit[7]      ),
  .lfb_addr_entry_not_resp_x               (lfb_addr_entry_not_resp[7]             ),
  .lfb_addr_entry_pfu_biu_req_hit_idx_x    (lfb_addr_entry_pfu_biu_req_hit_idx[7]  ),
  .lfb_addr_entry_pfu_create_dp_vld_x      (lfb_addr_entry_pfu_create_dp_vld[7]    ),
  .lfb_addr_entry_pfu_create_vld_x         (lfb_addr_entry_pfu_create_vld[7]       ),
  .lfb_addr_entry_pfu_dcache_hit_v         (lfb_addr_entry_pfu_dcache_hit_7        ),
  .lfb_addr_entry_pfu_dcache_miss_v        (lfb_addr_entry_pfu_dcache_miss_7       ),
  .lfb_addr_entry_pop_vld_x                (lfb_addr_entry_pop_vld[7]              ),
  .lfb_addr_entry_rb_biu_req_hit_idx_x     (lfb_addr_entry_rb_biu_req_hit_idx[7]   ),
  .lfb_addr_entry_rb_create_dp_vld_x       (lfb_addr_entry_rb_create_dp_vld[7]     ),
  .lfb_addr_entry_rb_create_vld_x          (lfb_addr_entry_rb_create_vld[7]        ),
  .lfb_addr_entry_rcl_done_x               (lfb_addr_entry_rcl_done[7]             ),
  .lfb_addr_entry_refill_way_x             (lfb_addr_entry_refill_way[7]           ),
  .lfb_addr_entry_resp_set_x               (lfb_addr_entry_resp_set[7]             ),
  .lfb_addr_entry_snq_bypass_hit_x         (lfb_addr_entry_snq_bypass_hit[7]       ),
  .lfb_addr_entry_st_da_hit_idx_x          (lfb_addr_entry_st_da_hit_idx[7]        ),
  .lfb_addr_entry_vb_pe_req_grnt_x         (lfb_addr_entry_vb_pe_req_grnt[7]       ),
  .lfb_addr_entry_vb_pe_req_x              (lfb_addr_entry_vb_pe_req[7]            ),
  .lfb_addr_entry_vld_x                    (lfb_addr_entry_vld[7]                  ),
  .lfb_addr_entry_wmb_read_req_hit_idx_x   (lfb_addr_entry_wmb_read_req_hit_idx[7] ),
  .lfb_addr_entry_wmb_write_req_hit_idx_x  (lfb_addr_entry_wmb_write_req_hit_idx[7]),
  .lfb_data_addr_pop_req_x                 (lfb_data_addr_pop_req[7]               ),
  .lfb_lf_sm_addr_pop_req_x                (lfb_lf_sm_addr_pop_req[7]              ),
  .lfb_vb_pe_req                           (lfb_vb_pe_req                          ),
  .lfb_vb_pe_req_permit                    (lfb_vb_pe_req_permit                   ),
  .lm_already_snoop                        (lm_already_snoop                       ),
  .lsu_special_clk                         (lsu_special_clk                        ),
  .pad_yy_icg_scan_en                      (pad_yy_icg_scan_en                     ),
  .pfu_biu_req_addr                        (pfu_biu_req_addr                       ),
  .pfu_lfb_id                              (pfu_lfb_id                             ),
  .rb_biu_req_addr                         (rb_biu_req_addr                        ),
  .rb_lfb_addr_tto4                        (rb_lfb_addr_tto4                       ),
  .rb_lfb_atomic                           (rb_lfb_atomic                          ),
  .rb_lfb_depd                             (rb_lfb_depd                            ),
  .rb_lfb_ldamo                            (rb_lfb_ldamo                           ),
  .snq_bypass_addr_tto6                    (snq_bypass_addr_tto6                   ),
  .st_da_addr                              (st_da_addr                             ),
  .vb_lfb_addr_entry_rcl_done_x            (vb_lfb_addr_entry_rcl_done[7]          ),
  .vb_lfb_dcache_dirty                     (vb_lfb_dcache_dirty                    ),
  .vb_lfb_dcache_hit                       (vb_lfb_dcache_hit                      ),
  .vb_lfb_dcache_way                       (vb_lfb_dcache_way                      ),
  .wmb_read_req_addr                       (wmb_read_req_addr                      ),
  .wmb_write_req_addr                      (wmb_write_req_addr                     )
);


//==========================================================
//              Instance data entry
//==========================================================
//2 data entry
// &ConnRule(s/_x$/[0]/); @151
// &ConnRule(s/_v$/_0/); @152
// &Instance("ct_lsu_lfb_data_entry","x_ct_lsu_lfb_data_entry_0"); @153
ct_lsu_lfb_data_entry  x_ct_lsu_lfb_data_entry_0 (
  .biu_lsu_r_data                      (biu_lsu_r_data                     ),
  .biu_lsu_r_last                      (biu_lsu_r_last                     ),
  .biu_lsu_r_vld                       (biu_lsu_r_vld                      ),
  .cp0_lsu_dcache_en                   (cp0_lsu_dcache_en                  ),
  .cp0_lsu_icg_en                      (cp0_lsu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .lfb_addr_entry_linefill_abort       (lfb_addr_entry_linefill_abort      ),
  .lfb_addr_entry_linefill_permit      (lfb_addr_entry_linefill_permit     ),
  .lfb_biu_id_2to0                     (lfb_biu_id_2to0                    ),
  .lfb_biu_r_id_hit                    (lfb_biu_r_id_hit                   ),
  .lfb_data_entry_addr_id_v            (lfb_data_entry_addr_id_0           ),
  .lfb_data_entry_addr_pop_req_v       (lfb_data_entry_addr_pop_req_0      ),
  .lfb_data_entry_create_dp_vld_x      (lfb_data_entry_create_dp_vld[0]    ),
  .lfb_data_entry_create_gateclk_en_x  (lfb_data_entry_create_gateclk_en[0]),
  .lfb_data_entry_create_vld_x         (lfb_data_entry_create_vld[0]       ),
  .lfb_data_entry_data_v               (lfb_data_entry_data_0              ),
  .lfb_data_entry_dcache_share_x       (lfb_data_entry_dcache_share[0]     ),
  .lfb_data_entry_full_x               (lfb_data_entry_full[0]             ),
  .lfb_data_entry_last_x               (lfb_data_entry_last[0]             ),
  .lfb_data_entry_lf_sm_req_x          (lfb_data_entry_lf_sm_req[0]        ),
  .lfb_data_entry_vld_x                (lfb_data_entry_vld[0]              ),
  .lfb_data_entry_wait_surplus_x       (lfb_data_entry_wait_surplus[0]     ),
  .lfb_first_pass_ptr                  (lfb_first_pass_ptr                 ),
  .lfb_lf_sm_data_grnt_x               (lfb_lf_sm_data_grnt[0]             ),
  .lfb_lf_sm_data_pop_req_x            (lfb_lf_sm_data_pop_req[0]          ),
  .lfb_r_resp_err                      (lfb_r_resp_err                     ),
  .lfb_r_resp_share                    (lfb_r_resp_share                   ),
  .lsu_special_clk                     (lsu_special_clk                    ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .snq_lfb_bypass_chg_tag_x            (snq_lfb_bypass_chg_tag[0]          ),
  .snq_lfb_bypass_invalid_x            (snq_lfb_bypass_invalid[0]          )
);


// &ConnRule(s/_x$/[1]/); @155
// &ConnRule(s/_v$/_1/); @156
// &Instance("ct_lsu_lfb_data_entry","x_ct_lsu_lfb_data_entry_1"); @157
ct_lsu_lfb_data_entry  x_ct_lsu_lfb_data_entry_1 (
  .biu_lsu_r_data                      (biu_lsu_r_data                     ),
  .biu_lsu_r_last                      (biu_lsu_r_last                     ),
  .biu_lsu_r_vld                       (biu_lsu_r_vld                      ),
  .cp0_lsu_dcache_en                   (cp0_lsu_dcache_en                  ),
  .cp0_lsu_icg_en                      (cp0_lsu_icg_en                     ),
  .cp0_yy_clk_en                       (cp0_yy_clk_en                      ),
  .cpurst_b                            (cpurst_b                           ),
  .lfb_addr_entry_linefill_abort       (lfb_addr_entry_linefill_abort      ),
  .lfb_addr_entry_linefill_permit      (lfb_addr_entry_linefill_permit     ),
  .lfb_biu_id_2to0                     (lfb_biu_id_2to0                    ),
  .lfb_biu_r_id_hit                    (lfb_biu_r_id_hit                   ),
  .lfb_data_entry_addr_id_v            (lfb_data_entry_addr_id_1           ),
  .lfb_data_entry_addr_pop_req_v       (lfb_data_entry_addr_pop_req_1      ),
  .lfb_data_entry_create_dp_vld_x      (lfb_data_entry_create_dp_vld[1]    ),
  .lfb_data_entry_create_gateclk_en_x  (lfb_data_entry_create_gateclk_en[1]),
  .lfb_data_entry_create_vld_x         (lfb_data_entry_create_vld[1]       ),
  .lfb_data_entry_data_v               (lfb_data_entry_data_1              ),
  .lfb_data_entry_dcache_share_x       (lfb_data_entry_dcache_share[1]     ),
  .lfb_data_entry_full_x               (lfb_data_entry_full[1]             ),
  .lfb_data_entry_last_x               (lfb_data_entry_last[1]             ),
  .lfb_data_entry_lf_sm_req_x          (lfb_data_entry_lf_sm_req[1]        ),
  .lfb_data_entry_vld_x                (lfb_data_entry_vld[1]              ),
  .lfb_data_entry_wait_surplus_x       (lfb_data_entry_wait_surplus[1]     ),
  .lfb_first_pass_ptr                  (lfb_first_pass_ptr                 ),
  .lfb_lf_sm_data_grnt_x               (lfb_lf_sm_data_grnt[1]             ),
  .lfb_lf_sm_data_pop_req_x            (lfb_lf_sm_data_pop_req[1]          ),
  .lfb_r_resp_err                      (lfb_r_resp_err                     ),
  .lfb_r_resp_share                    (lfb_r_resp_share                   ),
  .lsu_special_clk                     (lsu_special_clk                    ),
  .pad_yy_icg_scan_en                  (pad_yy_icg_scan_en                 ),
  .snq_lfb_bypass_chg_tag_x            (snq_lfb_bypass_chg_tag[1]          ),
  .snq_lfb_bypass_invalid_x            (snq_lfb_bypass_invalid[1]          )
);



//==========================================================
//            Generate addr signal
//==========================================================
//------------------create ptr------------------------------
// &CombBeg; @164
always @( lfb_addr_entry_vld[7:0])
begin
lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0]   = {LFB_ADDR_ENTRY{1'b0}};
casez(lfb_addr_entry_vld[LFB_ADDR_ENTRY-1:0])
  8'b????_???0:lfb_addr_create_ptr[0]  = 1'b1;
  8'b????_??01:lfb_addr_create_ptr[1]  = 1'b1;
  8'b????_?011:lfb_addr_create_ptr[2]  = 1'b1;
  8'b????_0111:lfb_addr_create_ptr[3]  = 1'b1;
  8'b???0_1111:lfb_addr_create_ptr[4]  = 1'b1;
  8'b??01_1111:lfb_addr_create_ptr[5]  = 1'b1;
  8'b?011_1111:lfb_addr_create_ptr[6]  = 1'b1;
  8'b0111_1111:lfb_addr_create_ptr[7]  = 1'b1;
  default:lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0]   = {LFB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @177
end


//------------------grnt signal to lfb/pfu------------------
assign lfb_rb_create_grnt   = bus_arb_rb_ar_sel &&  rb_lfb_create_req;
assign lfb_pfu_create_grnt  = bus_arb_pfu_ar_sel  &&  pfu_lfb_create_req;

// &Instance("ct_rtu_encode_8","x_lsu_lfb_create_ptr_encode"); @184
ct_rtu_encode_8  x_lsu_lfb_create_ptr_encode (
  .x_num                    (lfb_create_id[2:0]      ),
  .x_num_expand             (lfb_addr_create_ptr[7:0])
);

// &Connect( .x_num          (lfb_create_id[2:0]   ), @185
//           .x_num_expand   (lfb_addr_create_ptr[7:0]   )); @186

assign lfb_rb_create_id[4:0]  = {BIU_LFB_ID_T,lfb_create_id[2:0]};
assign lfb_pfu_create_id[4:0] = {BIU_LFB_ID_T,lfb_create_id[2:0]};
//------------------create signal---------------------------
assign lfb_addr_rb_create_vld           = lfb_rb_create_grnt  &&  rb_lfb_create_vld;
assign lfb_addr_rb_create_dp_vld        = lfb_rb_create_grnt  &&  rb_lfb_create_dp_vld;
assign lfb_addr_pfu_create_vld          = lfb_pfu_create_grnt &&  pfu_lfb_create_vld;
assign lfb_addr_pfu_create_dp_vld       = lfb_pfu_create_grnt &&  pfu_lfb_create_dp_vld;

assign lfb_addr_entry_rb_create_vld[LFB_ADDR_ENTRY-1:0]         = {LFB_ADDR_ENTRY{lfb_addr_rb_create_vld}}
                                                                  & lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0];

assign lfb_addr_entry_rb_create_dp_vld[LFB_ADDR_ENTRY-1:0]      = {LFB_ADDR_ENTRY{lfb_addr_rb_create_dp_vld}}
                                                                  & lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0];

assign lfb_addr_entry_pfu_create_vld[LFB_ADDR_ENTRY-1:0]        = {LFB_ADDR_ENTRY{lfb_addr_pfu_create_vld}}
                                                                  & lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0];

assign lfb_addr_entry_pfu_create_dp_vld[LFB_ADDR_ENTRY-1:0]     = {LFB_ADDR_ENTRY{lfb_addr_pfu_create_dp_vld}}
                                                                  & lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0];

assign lfb_addr_entry_create_gateclk_en[LFB_ADDR_ENTRY-1:0]     = {LFB_ADDR_ENTRY{rb_lfb_create_gateclk_en
                                                                                  ||  pfu_lfb_create_gateclk_en}}
                                                                  & lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0];

//==========================================================
//                Request vb addr entry
//==========================================================
//-------------------pop entry------------------------------
always @(posedge lfb_vb_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_vb_req_unmask       <=  1'b0;
  else if(lfb_vb_pe_all_req)
    lfb_vb_req_unmask       <=  1'b1;
  else if(lfb_create_vb_success || lfb_create_vb_cancel)
    lfb_vb_req_unmask       <=  1'b0;
end

always @(posedge lfb_vb_pe_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lfb_vb_addr_ptr[LFB_ADDR_ENTRY-1:0] <= {LFB_ADDR_ENTRY{1'b0}};
    lfb_vb_addr_tto6[`PA_WIDTH-7:0]     <=  {`PA_WIDTH-6{1'b0}};
  end
  else if(lfb_vb_pe_req_permit &&  lfb_vb_pe_req)
  begin
    lfb_vb_addr_ptr[LFB_ADDR_ENTRY-1:0] <=  lfb_vb_pe_req_ptr[LFB_ADDR_ENTRY-1:0];
    lfb_vb_addr_tto6[`PA_WIDTH-7:0]     <=  lfb_vb_pe_req_addr_tto6[`PA_WIDTH-7:0];
  end
  else if(lfb_vb_pe_req_permit &&  lfb_vb_pe_rb_req)
  begin
    lfb_vb_addr_ptr[LFB_ADDR_ENTRY-1:0] <=  lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0];
    lfb_vb_addr_tto6[`PA_WIDTH-7:0]     <=  rb_lfb_addr_tto4[`PA_WIDTH-5:2];
  end
  else if(lfb_vb_pe_req_permit &&  lfb_vb_pe_pfu_req)
  begin
    lfb_vb_addr_ptr[LFB_ADDR_ENTRY-1:0] <=  lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0];
    lfb_vb_addr_tto6[`PA_WIDTH-7:0]     <=  pfu_biu_req_addr[`PA_WIDTH-1:6];
  end
end

//-----------------pop req signal---------------------------
assign lfb_vb_pe_rb_req      = cp0_lsu_dcache_en
                                &&  lfb_addr_rb_create_vld;

assign lfb_vb_pe_pfu_req     = lfb_addr_pfu_create_vld;

assign lfb_vb_pe_req         = |lfb_addr_entry_vb_pe_req[LFB_ADDR_ENTRY-1:0];

assign lfb_vb_pe_all_req     = lfb_vb_pe_req
                                ||  lfb_vb_pe_rb_req
                                ||  lfb_vb_pe_pfu_req;

//------------------permit signal---------------------------
assign lfb_vb_pe_req_permit  = !lfb_vb_req_unmask
                                ||  lfb_create_vb_cancel
                                ||  lfb_create_vb_success;

//------------------request ptr-----------------------------

//use static arbitrate
// &CombBeg; @270
always @( lfb_addr_entry_vb_pe_req[7:0])
begin
lfb_vb_pe_req_ptr[LFB_ADDR_ENTRY-1:0]  = {LFB_ADDR_ENTRY{1'b0}};
casez(lfb_addr_entry_vb_pe_req[LFB_ADDR_ENTRY-1:0])
  8'b????_???1:lfb_vb_pe_req_ptr[0]  = 1'b1;
  8'b????_??10:lfb_vb_pe_req_ptr[1]  = 1'b1;
  8'b????_?100:lfb_vb_pe_req_ptr[2]  = 1'b1;
  8'b????_1000:lfb_vb_pe_req_ptr[3]  = 1'b1;
  8'b???1_0000:lfb_vb_pe_req_ptr[4]  = 1'b1;
  8'b??10_0000:lfb_vb_pe_req_ptr[5]  = 1'b1;
  8'b?100_0000:lfb_vb_pe_req_ptr[6]  = 1'b1;
  8'b1000_0000:lfb_vb_pe_req_ptr[7]  = 1'b1;
  default:lfb_vb_pe_req_ptr[LFB_ADDR_ENTRY-1:0]  = {LFB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @283
end

assign lfb_vb_pe_req_addr_tto6[`PA_WIDTH-7:0] = 
                {`PA_WIDTH-6{lfb_vb_pe_req_ptr[0]}}  & lfb_addr_entry_addr_tto4_0[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_vb_pe_req_ptr[1]}}  & lfb_addr_entry_addr_tto4_1[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_vb_pe_req_ptr[2]}}  & lfb_addr_entry_addr_tto4_2[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_vb_pe_req_ptr[3]}}  & lfb_addr_entry_addr_tto4_3[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_vb_pe_req_ptr[4]}}  & lfb_addr_entry_addr_tto4_4[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_vb_pe_req_ptr[5]}}  & lfb_addr_entry_addr_tto4_5[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_vb_pe_req_ptr[6]}}  & lfb_addr_entry_addr_tto4_6[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_vb_pe_req_ptr[7]}}  & lfb_addr_entry_addr_tto4_7[`PA_WIDTH-5:2];

//-------------------pop grnt signal------------------------
assign lfb_addr_entry_vb_pe_req_grnt[LFB_ADDR_ENTRY-1:0] = {LFB_ADDR_ENTRY{lfb_vb_pe_req_permit}}
                                                            & lfb_vb_pe_req_ptr[LFB_ADDR_ENTRY-1:0];
//-------------------request signal-------------------------
//assign lfb_vb_req_biu_resp        = |(lfb_vb_addr_ptr[LFB_ADDR_ENTRY-1:0]  & lfb_addr_entry_resp[LFB_ADDR_ENTRY-1:0]);
assign lfb_vb_req_ldamo           = |(lfb_vb_addr_ptr[LFB_ADDR_ENTRY-1:0]  & lfb_addr_entry_ldamo[LFB_ADDR_ENTRY-1:0]);
assign lfb_vb_req_hit_idx         = vb_lfb_vb_req_hit_idx
                                    ||  snq_create_lfb_vb_req_hit_idx
                                        &&  !(lfb_vb_req_ldamo && lm_state_is_amo_lock)
                                    ||  snq_lfb_vb_req_hit_idx;
//req signal is for arbitration
assign lfb_vb_create_req          = lfb_vb_req_unmask;
// &Force("output","lfb_vb_create_vld"); @307
assign lfb_vb_create_vld          = lfb_vb_req_unmask
                                    &&  !lfb_vb_req_hit_idx;
assign lfb_vb_create_dp_vld       = lfb_vb_req_unmask;
assign lfb_vb_create_gateclk_en   = lfb_vb_req_unmask;

// &Instance("ct_rtu_encode_8","x_lsu_lfb_vb_pe_req_ptr_encode"); @313
ct_rtu_encode_8  x_lsu_lfb_vb_pe_req_ptr_encode (
  .x_num                (lfb_vb_id[2:0]      ),
  .x_num_expand         (lfb_vb_addr_ptr[7:0])
);

// &Connect( .x_num          (lfb_vb_id[2:0]       ), @314
//           .x_num_expand   (lfb_vb_addr_ptr[7:0] )); @315

assign lfb_create_vb_success    = lfb_vb_create_vld &&  vb_lfb_create_grnt;

//when snq invalid lfb,should cancel vb req
assign lfb_vb_req_entry_vld     = |(lfb_vb_addr_ptr[LFB_ADDR_ENTRY-1:0] & lfb_addr_entry_vld[LFB_ADDR_ENTRY-1:0]);
assign lfb_create_vb_cancel     = lfb_vb_req_unmask
                                  && !lfb_vb_req_entry_vld; 
//==========================================================
//            Reply dcache hit signal to pfu
//==========================================================
// &Force("output","lfb_pfu_dcache_hit"); @326
assign lfb_pfu_dcache_hit[8:0]  = lfb_addr_entry_pfu_dcache_hit_0[8:0]
                                  | lfb_addr_entry_pfu_dcache_hit_1[8:0]
                                  | lfb_addr_entry_pfu_dcache_hit_2[8:0]
                                  | lfb_addr_entry_pfu_dcache_hit_3[8:0]
                                  | lfb_addr_entry_pfu_dcache_hit_4[8:0]
                                  | lfb_addr_entry_pfu_dcache_hit_5[8:0]
                                  | lfb_addr_entry_pfu_dcache_hit_6[8:0]
                                  | lfb_addr_entry_pfu_dcache_hit_7[8:0];

// &Force("output","lfb_pfu_dcache_hit"); @336
assign lfb_pfu_dcache_miss[8:0] = lfb_addr_entry_pfu_dcache_miss_0[8:0]
                                  | lfb_addr_entry_pfu_dcache_miss_1[8:0]
                                  | lfb_addr_entry_pfu_dcache_miss_2[8:0]
                                  | lfb_addr_entry_pfu_dcache_miss_3[8:0]
                                  | lfb_addr_entry_pfu_dcache_miss_4[8:0]
                                  | lfb_addr_entry_pfu_dcache_miss_5[8:0]
                                  | lfb_addr_entry_pfu_dcache_miss_6[8:0]
                                  | lfb_addr_entry_pfu_dcache_miss_7[8:0];

//==========================================================
//                Pass data to data entry
//==========================================================
//------------------judge r signal--------------------------
//----------r id------------------------
assign lfb_biu_r_id_hit     = biu_lsu_r_vld
                              &&  (biu_lsu_r_id[4:3] ==  BIU_LFB_ID_T);
assign lfb_biu_id_2to0[2:0] = biu_lsu_r_id[2:0];

assign lfb_addr_entry_resp_set[LFB_ADDR_ENTRY-1:0]  = 
                {LFB_ADDR_ENTRY{lfb_biu_r_id_hit && lfb_data_not_full}}
                & lfb_r_id_hit_addr_ptr[LFB_ADDR_ENTRY-1:0];
//----------r resp----------------------
// &Force("bus","biu_lsu_r_resp",3,0); @359
assign lfb_r_resp_share     = biu_lsu_r_resp[3];
assign lfb_r_resp_err       = (biu_lsu_r_resp[1:0] ==  DECERR)
                              ||  (biu_lsu_r_resp[1:0] ==  SLVERR);

//------------------create ptr------------------------------
// &CombBeg; @365
always @( lfb_data_entry_vld[1:0])
begin
lfb_data_create_ptr[LFB_DATA_ENTRY-1:0]   = {LFB_DATA_ENTRY{1'b0}};
casez(lfb_data_entry_vld[LFB_DATA_ENTRY-1:0])
  2'b?0:lfb_data_create_ptr[0]  = 1'b1;
  2'b01:lfb_data_create_ptr[1]  = 1'b1;
  default:lfb_data_create_ptr[LFB_DATA_ENTRY-1:0]   = {LFB_DATA_ENTRY{1'b0}};
endcase
// &CombEnd; @372
end
//------------------create signal---------------------------
//if no vld, or only one vld and full, then create
assign lfb_data_wait_surplus  = |lfb_data_entry_wait_surplus[LFB_DATA_ENTRY-1:0];


assign lfb_data_create_vld          = lfb_biu_r_id_hit
                                      &&  !lfb_data_wait_surplus;
assign lfb_data_create_dp_vld       = lfb_data_create_vld;
assign lfb_data_create_gateclk_en   = lfb_data_create_vld;

assign lfb_data_entry_create_vld[LFB_DATA_ENTRY-1:0]        = {LFB_DATA_ENTRY{lfb_data_create_vld}}
                                                              & lfb_data_create_ptr[LFB_DATA_ENTRY-1:0];

assign lfb_data_entry_create_dp_vld[LFB_DATA_ENTRY-1:0]     = {LFB_DATA_ENTRY{lfb_data_create_dp_vld}}
                                                              & lfb_data_create_ptr[LFB_DATA_ENTRY-1:0];

assign lfb_data_entry_create_gateclk_en[LFB_DATA_ENTRY-1:0] = {LFB_DATA_ENTRY{lfb_data_create_gateclk_en}}
                                                                & lfb_data_create_ptr[LFB_DATA_ENTRY-1:0];

//------------------first pass ptr--------------------------
// &CombBeg; @393
always @( lfb_biu_id_2to0[2:0])
begin
lfb_r_id_hit_addr_ptr[LFB_ADDR_ENTRY-1:0] = {LFB_ADDR_ENTRY{1'b0}};
case(lfb_biu_id_2to0[2:0])
  3'd0:lfb_r_id_hit_addr_ptr[0] = 1'b1;
  3'd1:lfb_r_id_hit_addr_ptr[1] = 1'b1;
  3'd2:lfb_r_id_hit_addr_ptr[2] = 1'b1;
  3'd3:lfb_r_id_hit_addr_ptr[3] = 1'b1;
  3'd4:lfb_r_id_hit_addr_ptr[4] = 1'b1;
  3'd5:lfb_r_id_hit_addr_ptr[5] = 1'b1;
  3'd6:lfb_r_id_hit_addr_ptr[6] = 1'b1;
  3'd7:lfb_r_id_hit_addr_ptr[7] = 1'b1;
  default:lfb_r_id_hit_addr_ptr[LFB_ADDR_ENTRY-1:0] = {LFB_ADDR_ENTRY{1'b0}};
endcase
// &CombEnd; @406
end

assign lfb_pass_addr_5to4[1:0]  = {2{lfb_r_id_hit_addr_ptr[0]}} & lfb_addr_entry_addr_tto4_0[1:0]
                                  | {2{lfb_r_id_hit_addr_ptr[1]}} & lfb_addr_entry_addr_tto4_1[1:0]
                                  | {2{lfb_r_id_hit_addr_ptr[2]}} & lfb_addr_entry_addr_tto4_2[1:0]
                                  | {2{lfb_r_id_hit_addr_ptr[3]}} & lfb_addr_entry_addr_tto4_3[1:0]
                                  | {2{lfb_r_id_hit_addr_ptr[4]}} & lfb_addr_entry_addr_tto4_4[1:0]
                                  | {2{lfb_r_id_hit_addr_ptr[5]}} & lfb_addr_entry_addr_tto4_5[1:0]
                                  | {2{lfb_r_id_hit_addr_ptr[6]}} & lfb_addr_entry_addr_tto4_6[1:0]
                                  | {2{lfb_r_id_hit_addr_ptr[7]}} & lfb_addr_entry_addr_tto4_7[1:0];

//lfb first pass ptr is used to assign data_entry pass_ptr
// &CombBeg; @418
always @( lfb_pass_addr_5to4[1:0])
begin
lfb_first_pass_ptr[3:0]  = 4'b0;
case(lfb_pass_addr_5to4[1:0])
  2'd0:lfb_first_pass_ptr[0]  = 1'b1;
  2'd1:lfb_first_pass_ptr[1]  = 1'b1;
  2'd2:lfb_first_pass_ptr[2]  = 1'b1;
  2'd3:lfb_first_pass_ptr[3]  = 1'b1;
  default:lfb_first_pass_ptr[3:0]  = 4'b0;
endcase
// &CombEnd; @427
end

//==========================================================
//                Linefill state machine
//==========================================================
//----------------------registers---------------------------
//+-----+
//| vld |
//+-----+
always @(posedge lfb_lf_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_lf_sm_vld       <=  1'b0;
  else if(lfb_lf_sm_req)
    lfb_lf_sm_vld       <=  1'b1;
  else if(lfb_lf_sm_cnt)
    lfb_lf_sm_vld       <=  1'b0;
end

//+------------+---------+---------+------+
//| refill way | addr_id | data_id | addr |
//+------------+---------+---------+------+
always @(posedge lfb_lf_sm_req_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    lfb_lf_sm_dcache_share                <=  1'b0;
    lfb_lf_sm_refill_way                  <=  1'b0;
    lfb_lf_sm_addr_id[LFB_ADDR_ENTRY-1:0] <=  {LFB_ADDR_ENTRY{1'b0}};
    lfb_lf_sm_data_id[LFB_DATA_ENTRY-1:0] <=  {LFB_DATA_ENTRY{1'b0}};
    lfb_lf_sm_addr_tto6[`PA_WIDTH-7:0]    <=  {`PA_WIDTH-6{1'b0}};
  end
  else if(lfb_lf_sm_req  &&  lfb_lf_sm_permit)
  begin
    lfb_lf_sm_dcache_share                <=  lfb_lf_sm_data_dcache_share;
    lfb_lf_sm_refill_way                  <=  lfb_lf_sm_req_refill_way;
    lfb_lf_sm_addr_id[LFB_ADDR_ENTRY-1:0] <=  lfb_lf_sm_req_addr_ptr[LFB_ADDR_ENTRY-1:0];
    lfb_lf_sm_data_id[LFB_DATA_ENTRY-1:0] <=  lfb_lf_sm_req_data_ptr[LFB_DATA_ENTRY-1:0];
    lfb_lf_sm_addr_tto6[`PA_WIDTH-7:0]    <=  lfb_lf_sm_req_addr_tto6[`PA_WIDTH-7:0];
  end
end

//+-----+------+
//| cnt | bias |
//+-----+------+
//cnt is used for control path, bias is used for data path
always @(posedge lfb_lf_sm_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_lf_sm_cnt                         <=  1'b0;
  else if(lfb_lf_sm_create_vld)
    lfb_lf_sm_cnt                         <=  1'b0;
  else if(dcache_arb_lfb_ld_grnt)
    lfb_lf_sm_cnt                         <=  !lfb_lf_sm_cnt;
end

//------------------create singal---------------------------
assign lfb_lf_sm_permit     = !lfb_lf_sm_vld ||  lfb_lf_sm_cnt;
assign lfb_lf_sm_req        = |lfb_data_entry_lf_sm_req[LFB_DATA_ENTRY-1:0];
assign lfb_lf_sm_create_vld = lfb_lf_sm_req
                              &&  lfb_lf_sm_permit;

//------------------create info-----------------------------
// &CombBeg; @490
always @( lfb_data_entry_lf_sm_req[1:0])
begin
lfb_lf_sm_req_data_ptr[LFB_DATA_ENTRY-1:0] = {LFB_DATA_ENTRY{1'b0}};
casez(lfb_data_entry_lf_sm_req[LFB_DATA_ENTRY-1:0])
  2'b?1:lfb_lf_sm_req_data_ptr[0] = 1'b1;
  2'b10:lfb_lf_sm_req_data_ptr[1] = 1'b1;
  default:lfb_lf_sm_req_data_ptr[LFB_DATA_ENTRY-1:0] = {LFB_DATA_ENTRY{1'b0}};
endcase
// &CombEnd; @497
end

assign lfb_lf_sm_data_grnt[LFB_DATA_ENTRY-1:0]  = {LFB_DATA_ENTRY{lfb_lf_sm_create_vld}}
                                                  & lfb_lf_sm_req_data_ptr[LFB_DATA_ENTRY-1:0];

assign lfb_lf_sm_req_addr_ptr[LFB_ADDR_ENTRY-1:0] = {LFB_ADDR_ENTRY{lfb_lf_sm_req_data_ptr[0]}}
                                                      & lfb_data_entry_addr_id_0[LFB_ADDR_ENTRY-1:0]
                                                    | {LFB_ADDR_ENTRY{lfb_lf_sm_req_data_ptr[1]}}
                                                      & lfb_data_entry_addr_id_1[LFB_ADDR_ENTRY-1:0];

assign lfb_lf_sm_req_addr_tto6[`PA_WIDTH-7:0]  =
                {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[0]}}  & lfb_addr_entry_addr_tto4_0[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[1]}}  & lfb_addr_entry_addr_tto4_1[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[2]}}  & lfb_addr_entry_addr_tto4_2[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[3]}}  & lfb_addr_entry_addr_tto4_3[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[4]}}  & lfb_addr_entry_addr_tto4_4[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[5]}}  & lfb_addr_entry_addr_tto4_5[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[6]}}  & lfb_addr_entry_addr_tto4_6[`PA_WIDTH-5:2]
                | {`PA_WIDTH-6{lfb_lf_sm_req_addr_ptr[7]}}  & lfb_addr_entry_addr_tto4_7[`PA_WIDTH-5:2];


assign lfb_lf_sm_req_depd           = |(lfb_lf_sm_req_addr_ptr[LFB_ADDR_ENTRY-1:0]  & lfb_addr_entry_depd[LFB_ADDR_ENTRY-1:0]);
assign lfb_lf_sm_req_refill_way     = |(lfb_lf_sm_req_addr_ptr[LFB_ADDR_ENTRY-1:0]  & lfb_addr_entry_refill_way[LFB_ADDR_ENTRY-1:0]);
assign lfb_lf_sm_data_dcache_share  = |(lfb_lf_sm_req_data_ptr[LFB_DATA_ENTRY-1:0]  & lfb_data_entry_dcache_share[LFB_DATA_ENTRY-1:0]);

//------------------refill wakeup req-----------------------
assign lfb_lf_sm_refill_wakeup      = lfb_lf_sm_req_depd
                                      &&  lfb_lf_sm_create_vld;
//----------------------settle addr-------------------------
//-----------------data-----------------
assign lfb_lf_sm_data512[511:0]     = {512{lfb_lf_sm_data_id[0]}} & lfb_data_entry_data_0[511:0]
                                      | {512{lfb_lf_sm_data_id[1]}} & lfb_data_entry_data_1[511:0];

assign lfb_lf_sm_data256[255:0]     = lfb_lf_sm_cnt
                                      ? lfb_lf_sm_data512[511:256]
                                      : lfb_lf_sm_data512[255:0];

assign lfb_lf_sm_data_settle[255:0] = lfb_lf_sm_refill_way
                                      ? {lfb_lf_sm_data256[127:0],lfb_lf_sm_data256[255:128]}
                                      : lfb_lf_sm_data256[255:0];
//-----------------for ecc-----------------
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_0"); @549
// &Connect(.data_encode    (data_bf_ecc_0[31:0]   ),   @550
//          .ecc_code       (data_ecc_0[5:0]     ),  @551
//          .parity_bit     (data_parity_0       )  @552
//         ); @553
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_1"); @555
// &Connect(.data_encode    (data_bf_ecc_1[31:0]   ),   @556
//          .ecc_code       (data_ecc_1[5:0]     ),  @557
//          .parity_bit     (data_parity_1       )  @558
//         ); @559
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_2"); @561
// &Connect(.data_encode    (data_bf_ecc_2[31:0]   ),   @562
//          .ecc_code       (data_ecc_2[5:0]     ),  @563
//          .parity_bit     (data_parity_2       )  @564
//         ); @565
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_3"); @567
// &Connect(.data_encode    (data_bf_ecc_3[31:0]   ),   @568
//          .ecc_code       (data_ecc_3[5:0]     ),  @569
//          .parity_bit     (data_parity_3       )  @570
//         ); @571
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_4"); @573
// &Connect(.data_encode    (data_bf_ecc_4[31:0]   ),   @574
//          .ecc_code       (data_ecc_4[5:0]     ),  @575
//          .parity_bit     (data_parity_4       )  @576
//         ); @577
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_5"); @579
// &Connect(.data_encode    (data_bf_ecc_5[31:0]   ),   @580
//          .ecc_code       (data_ecc_5[5:0]     ),  @581
//          .parity_bit     (data_parity_5       )  @582
//         ); @583
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_6"); @585
// &Connect(.data_encode    (data_bf_ecc_6[31:0]   ),   @586
//          .ecc_code       (data_ecc_6[5:0]     ),  @587
//          .parity_bit     (data_parity_6       )  @588
//         ); @589
// &Instance("ct_lsu_32bit_ecc_encode", "x_ct_dcache_32bit_ecc_encode_7"); @591
// &Connect(.data_encode    (data_bf_ecc_7[31:0]   ),   @592
//          .ecc_code       (data_ecc_7[5:0]     ),  @593
//          .parity_bit     (data_parity_7       )  @594
//         ); @595
// &Instance("ct_lsu_27bit_ecc_encode", "x_ct_dcache_27bit_ecc_encode"); @616
// &Connect(.data_encode    (ld_tag_bf_ecc[26:0] ),   @617
//          .ecc_code       (ld_tag_ecc[5:0]     ),  @618
//          .parity_bit     (ld_tag_parity       )  @619
//         ); @620
// &Instance("ct_lsu_29bit_ecc_encode", "x_ct_dcache_29bit_ecc_encode"); @628
// &Connect(.data_encode    (st_tag_bf_ecc[28:0] ),   @629
//          .ecc_code       (st_tag_ecc[5:0]     ),  @630
//          .parity_bit     (st_tag_parity       )  @631
//         ); @632
//----------------------cache interface---------------------
assign lfb_dcache_arb_ld_req  = lfb_lf_sm_vld;
assign lfb_dcache_arb_st_req  = lfb_lf_sm_vld;
assign lfb_dcache_arb_serial_req  = lfb_lf_sm_vld &&  !lfb_lf_sm_cnt;

//---------------tag array--------------
// &Force("output", "lfb_dcache_arb_ld_tag_req"); @644
assign lfb_dcache_arb_ld_tag_req        = lfb_lf_sm_vld &&  lfb_lf_sm_cnt;
assign lfb_dcache_arb_ld_tag_gateclk_en = lfb_dcache_arb_ld_tag_req;
// &Force("output", "lfb_dcache_arb_ld_tag_idx"); @647
assign lfb_dcache_arb_ld_tag_idx[8:0]   = lfb_lf_sm_addr_tto6[8:0];
assign lfb_dcache_arb_ld_tag_din[53:0]  = {1'b1,lfb_lf_sm_addr_tto6[`PA_WIDTH-7:8],1'b1,lfb_lf_sm_addr_tto6[`PA_WIDTH-7:8]};
// &Force("output", "lfb_dcache_arb_ld_tag_wen"); @654
assign lfb_dcache_arb_ld_tag_wen[1:0]   = lfb_lf_sm_cnt
                                          ? {lfb_lf_sm_refill_way,!lfb_lf_sm_refill_way}
                                          : 2'b0;

assign lfb_dcache_arb_st_tag_req        = lfb_dcache_arb_ld_tag_req;
assign lfb_dcache_arb_st_tag_gateclk_en = lfb_dcache_arb_ld_tag_req;
assign lfb_dcache_arb_st_tag_idx[8:0]   = lfb_dcache_arb_ld_tag_idx[8:0];
assign lfb_dcache_arb_st_tag_din[51:0]  = {lfb_lf_sm_addr_tto6[`PA_WIDTH-7:8],lfb_lf_sm_addr_tto6[`PA_WIDTH-7:8]};
assign lfb_dcache_arb_st_tag_wen[1:0]   = lfb_dcache_arb_ld_tag_wen[1:0];

//---------------dirty array------------
assign lfb_dcache_arb_st_dirty_req      = lfb_dcache_arb_ld_tag_req;
assign lfb_dcache_arb_st_dirty_gateclk_en = lfb_dcache_arb_ld_tag_req;
assign lfb_dcache_arb_st_dirty_idx[8:0] = lfb_lf_sm_addr_tto6[8:0];
assign lfb_dcache_arb_st_dirty_din[6:0] = {!lfb_lf_sm_refill_way,1'b0,lfb_lf_sm_dcache_share,1'b1,1'b0,lfb_lf_sm_dcache_share,1'b1};
assign lfb_dcache_arb_st_dirty_wen[6:0] = {1'b1,{3{lfb_lf_sm_refill_way}},{3{!lfb_lf_sm_refill_way}}};

//---------------data array-------------
assign lfb_dcache_arb_ld_data_gateclk_en[7:0] = {8{lfb_lf_sm_vld}};
assign lfb_dcache_arb_ld_data_idx[10:0] = {lfb_lf_sm_addr_tto6[8:0],lfb_lf_sm_cnt,lfb_lf_sm_refill_way};
assign lfb_dcache_arb_ld_data_low_din[127:0]  = lfb_lf_sm_data_settle[127:0];
assign lfb_dcache_arb_ld_data_high_din[127:0] = lfb_lf_sm_data_settle[255:128];
//assign lsu_dcache_ld_data_wen[31:0]           = 32'hffff_ffff;

//----------------------pop signal--------------------------
assign lfb_lf_sm_addr_pop_req[LFB_ADDR_ENTRY-1:0] = {LFB_ADDR_ENTRY{lfb_lf_sm_vld &&  lfb_lf_sm_cnt}}
                                                    & lfb_lf_sm_addr_id[LFB_ADDR_ENTRY-1:0];

assign lfb_lf_sm_data_pop_req[LFB_DATA_ENTRY-1:0] = {LFB_DATA_ENTRY{lfb_lf_sm_vld &&  lfb_lf_sm_cnt}}
                                                    & lfb_lf_sm_data_id[LFB_DATA_ENTRY-1:0];

assign lfb_data_addr_pop_req[LFB_ADDR_ENTRY-1:0]  = lfb_data_entry_addr_pop_req_0[LFB_ADDR_ENTRY-1:0]
                                                    | lfb_data_entry_addr_pop_req_1[LFB_ADDR_ENTRY-1:0];
//==========================================================
//                Maintain wakeup queue
//==========================================================
//----------------------registers---------------------------
//+--------------+
//| wakeup_queue |
//+--------------+
//the queue stores the instructions waiting for wakeup
//the 12 bit of wakeup_queue is for mcic
always @(posedge lfb_wakeup_queue_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_wakeup_queue[LSIQ_ENTRY:0]  <=  {LSIQ_ENTRY+1{1'b0}};
  else if(rtu_yy_xx_flush)
    lfb_wakeup_queue[LSIQ_ENTRY:0]  <=  {LSIQ_ENTRY+1{1'b0}};
  else if(ld_da_lfb_set_wakeup_queue ||  lfb_pop_depd_ff)
    lfb_wakeup_queue[LSIQ_ENTRY:0]  <=  lfb_wakeup_queue_next[LSIQ_ENTRY:0];
end

//+-------------+
//| depd_pop_ff |
//+-------------+
//if depd pop, this will set to 1, and clear wakeup_queue next cycle
// &Force("output","lfb_pop_depd_ff"); @720
always @(posedge lfb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_pop_depd_ff     <=  1'b0;
  else if(lfb_addr_pop_depd
      ||  lfb_addr_pop_discard_vld
      ||  rb_lfb_boundary_depd_wakeup
      ||  lfb_lf_sm_refill_wakeup
      ||  lm_lfb_depd_wakeup)
    lfb_pop_depd_ff     <=  1'b1;
  else
    lfb_pop_depd_ff     <=  1'b0;
end

//----------------forward to depd_pop_ff------------------
assign lfb_addr_pop_depd        = |(lfb_addr_entry_pop_vld[LFB_ADDR_ENTRY-1:0]
                                    & lfb_addr_entry_depd[LFB_ADDR_ENTRY-1:0]);
assign lfb_addr_pop_discard_vld = |(lfb_addr_entry_pop_vld[LFB_ADDR_ENTRY-1:0]
                                    & lfb_addr_entry_discard_vld[LFB_ADDR_ENTRY-1:0]);

//------------------update wakeup queue---------------------
assign lfb_wakeup_queue_after_pop[LSIQ_ENTRY:0] = lfb_pop_depd_ff
                                                  ? {LSIQ_ENTRY+1{1'b0}}
                                                  : lfb_wakeup_queue[LSIQ_ENTRY:0];

assign lfb_wakeup_queue_next[LSIQ_ENTRY:0]  = lfb_wakeup_queue_after_pop[LSIQ_ENTRY:0]
                                              | {LSIQ_ENTRY+1{ld_da_lfb_set_wakeup_queue}}
                                                & ld_da_lfb_wakeup_queue_next[LSIQ_ENTRY:0];

//------------------------wakeup----------------------------
assign lfb_depd_wakeup[LSIQ_ENTRY-1:0]  = lfb_pop_depd_ff
                                          ? lfb_wakeup_queue[LSIQ_ENTRY-1:0]
                                          : {LSIQ_ENTRY{1'b0}};

assign lfb_mcic_wakeup                  = (lfb_pop_depd_ff  ||  rtu_yy_xx_flush)
                                          ? lfb_wakeup_queue[LSIQ_ENTRY]
                                          : 1'b0;
//==========================================================
//                for avoid deadlock with no rready
//==========================================================
assign lfb_addr_create_vld        = lfb_addr_rb_create_vld || lfb_addr_pfu_create_vld;
assign lfb_no_rcl_cnt_create[3:0] = {3'b0,lfb_addr_create_vld && cp0_lsu_dcache_en};
assign lfb_no_rcl_cnt_pop[3:0]    = {3'b0,vb_lfb_rcl_done} 
                                    + {3'b0,snq_lfb_bypass_invalid[0]}
                                    + {3'b0,snq_lfb_bypass_invalid[1]};

assign lfb_no_rcl_cnt_updt_vld    = lfb_addr_create_vld && cp0_lsu_dcache_en
                                    || vb_lfb_rcl_done 
                                    || |snq_lfb_bypass_invalid[1:0]; 

assign lfb_no_rcl_cnt_updt_val[3:0] = lfb_no_rcl_cnt[3:0]
                                      + lfb_no_rcl_cnt_create[3:0] 
                                      - lfb_no_rcl_cnt_pop[3:0]; 

always @(posedge lfb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    lfb_no_rcl_cnt[3:0]   <=  4'b0;
  else if(lfb_no_rcl_cnt_updt_vld)
    lfb_no_rcl_cnt[3:0]   <=  lfb_no_rcl_cnt_updt_val[3:0];
end

assign lfb_nc_rready_grnt     = (lfb_no_rcl_cnt[3:0] <= 4'd1);
assign lfb_ca_rready_grnt     = (lfb_no_rcl_cnt[3:0] <  4'd1);
assign lfb_rb_nc_rready_grnt  = lfb_nc_rready_grnt;
assign lfb_rb_ca_rready_grnt  = lfb_ca_rready_grnt;
assign lfb_pfu_rready_grnt    = lfb_ca_rready_grnt;

//for rready,if all addr entry has resp,then not deassert rready
assign lfb_addr_all_resp      = !(|lfb_addr_entry_not_resp[LFB_ADDR_ENTRY-1:0]);
//==========================================================
//              Interface to other module
//==========================================================
//---------------------hit idx------------------------------
assign lfb_ld_da_hit_idx        = |lfb_addr_entry_ld_da_hit_idx[LFB_ADDR_ENTRY-1:0];
assign lfb_st_da_hit_idx        = |lfb_addr_entry_st_da_hit_idx[LFB_ADDR_ENTRY-1:0];
assign lfb_rb_biu_req_hit_idx   = |lfb_addr_entry_rb_biu_req_hit_idx[LFB_ADDR_ENTRY-1:0];
assign lfb_pfu_biu_req_hit_idx  = |lfb_addr_entry_pfu_biu_req_hit_idx[LFB_ADDR_ENTRY-1:0];
//assign lfb_snq_stall            = |lfb_addr_entry_snq_create_hit_idx[LFB_ADDR_ENTRY-1:0];
assign lfb_wmb_read_req_hit_idx = |lfb_addr_entry_wmb_read_req_hit_idx[LFB_ADDR_ENTRY-1:0];
assign lfb_wmb_write_req_hit_idx= |lfb_addr_entry_wmb_write_req_hit_idx[LFB_ADDR_ENTRY-1:0];

//for snq
// &Force("output","lfb_snq_bypass_data_id"); @804
assign lfb_snq_bypass_hit          = |lfb_addr_entry_snq_bypass_hit[LFB_ADDR_ENTRY-1:0];
assign lfb_snq_bypass_data_id[1:0] = lfb_data_entry_vld[LFB_DATA_ENTRY-1:0]
                                     & {lfb_addr_entry_snq_bypass_hit[LFB_ADDR_ENTRY-1:0] == lfb_data_entry_addr_id_1[LFB_ADDR_ENTRY-1:0],
                                        lfb_addr_entry_snq_bypass_hit[LFB_ADDR_ENTRY-1:0] == lfb_data_entry_addr_id_0[LFB_ADDR_ENTRY-1:0]};
assign lfb_snq_bypass_share        = |(lfb_snq_bypass_data_id[1:0] & lfb_data_entry_dcache_share[1:0]);
//----------------interface to biu--------------------------
assign lfb_data_not_full        = !(&lfb_data_entry_full[LFB_DATA_ENTRY-1:0]);
assign lsu_biu_r_linefill_ready = lfb_data_not_full || lfb_addr_all_resp;
//------------------full/empty signal-----------------------
assign lfb_addr_empty           = !(|lfb_addr_entry_vld[LFB_ADDR_ENTRY-1:0]);
assign lfb_data_empty           = !(|lfb_data_entry_vld[LFB_DATA_ENTRY-1:0]);
// &Force("output","lfb_empty"); @816
assign lfb_empty                = lfb_addr_empty  &&  lfb_data_empty  &&  !lfb_vb_req_unmask;
// &Force("output","lfb_addr_full"); @818
assign lfb_addr_full            = &lfb_addr_entry_vld[LFB_ADDR_ENTRY-1:0];
assign lfb_addr_less2           = &(lfb_addr_entry_vld[LFB_ADDR_ENTRY-1:0]
                                    | lfb_addr_create_ptr[LFB_ADDR_ENTRY-1:0]);
assign lsu_had_lfb_addr_entry_vld[LFB_ADDR_ENTRY-1:0] = lfb_addr_entry_vld[LFB_ADDR_ENTRY-1:0];
assign lsu_had_lfb_addr_entry_rcl_done[LFB_ADDR_ENTRY-1:0]  = lfb_addr_entry_rcl_done[LFB_ADDR_ENTRY-1:0];
assign lsu_had_lfb_addr_entry_dcache_hit[LFB_ADDR_ENTRY-1:0]= lfb_addr_entry_dcache_hit[LFB_ADDR_ENTRY-1:0];
assign lsu_had_lfb_data_entry_vld[LFB_DATA_ENTRY-1:0] = lfb_data_entry_vld[LFB_DATA_ENTRY-1:0];
assign lsu_had_lfb_data_entry_last[LFB_DATA_ENTRY-1:0] = lfb_data_entry_last[LFB_DATA_ENTRY-1:0];
assign lsu_had_lfb_wakeup_queue[LSIQ_ENTRY:0] = lfb_wakeup_queue[LSIQ_ENTRY:0];
assign lsu_had_lfb_lf_sm_vld  = lfb_lf_sm_vld;

//==========================================================
//        interface to hpcp
//==========================================================
assign ld_hit_prefetch = |ld_hit_prefetch_first[LFB_ADDR_ENTRY-1:0]; 
// &ModuleEnd; @836
endmodule


