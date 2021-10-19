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
module ct_lsu_snoop_snq(
  arb_snq_entry_oldest_index,
  arb_snq_snoop_addr,
  arb_snq_snoop_depd,
  arb_snq_snoop_prot,
  arb_snq_snoop_type,
  biu_lsu_ac_req,
  biu_lsu_ctc_req,
  biu_sdb_cd_ready,
  biu_snq_cr_ready,
  cp0_lsu_icg_en,
  cpurst_b,
  cur_snq_entry_empty,
  dcache_arb_snq_ld_grnt,
  dcache_arb_snq_st_grnt,
  forever_cpuclk,
  ld_da_snq_borrow_sndb,
  ld_da_vb_snq_data_reissue,
  lfb_snq_bypass_data_id,
  lfb_snq_bypass_hit,
  lfb_snq_bypass_share,
  lfb_vb_addr_tto6,
  lsu_had_cdr_state,
  lsu_had_sdb_entry_vld,
  lsu_had_snoop_data_req,
  lsu_had_snoop_tag_req,
  lsu_had_snq_entry_issued,
  lsu_had_snq_entry_vld,
  lsu_sdb_not_empty,
  lsu_snoop_clk,
  lsu_snq_not_empty,
  pad_yy_icg_scan_en,
  sdb_biu_cd_data,
  sdb_biu_cd_last,
  sdb_biu_cd_valid,
  sdb_create_data_order,
  sdb_create_en,
  sdb_data_vld,
  sdb_entry_avail,
  sdb_entry_data_0,
  sdb_entry_data_1,
  sdb_entry_data_2,
  sdb_entry_data_index,
  sdb_inv_en,
  sdb_vld,
  snoop_req_create_en,
  snq_biu_cr_resp,
  snq_biu_cr_valid,
  snq_bypass_addr_tto6,
  snq_can_create_snq_uncheck,
  snq_create_addr,
  snq_create_lfb_vb_req_hit_idx,
  snq_create_wmb_read_req_hit_idx,
  snq_create_wmb_write_req_hit_idx,
  snq_dcache_arb_borrow_addr,
  snq_dcache_arb_data_way,
  snq_dcache_arb_ld_borrow_req,
  snq_dcache_arb_ld_borrow_req_gate,
  snq_dcache_arb_ld_data_gateclk_en,
  snq_dcache_arb_ld_data_idx,
  snq_dcache_arb_ld_req,
  snq_dcache_arb_ld_tag_gateclk_en,
  snq_dcache_arb_ld_tag_idx,
  snq_dcache_arb_ld_tag_req,
  snq_dcache_arb_ld_tag_wen,
  snq_dcache_arb_serial_req,
  snq_dcache_arb_st_borrow_req,
  snq_dcache_arb_st_dirty_din,
  snq_dcache_arb_st_dirty_gateclk_en,
  snq_dcache_arb_st_dirty_gwen,
  snq_dcache_arb_st_dirty_idx,
  snq_dcache_arb_st_dirty_req,
  snq_dcache_arb_st_dirty_wen,
  snq_dcache_arb_st_id,
  snq_dcache_arb_st_req,
  snq_dcache_arb_st_tag_gateclk_en,
  snq_dcache_arb_st_tag_idx,
  snq_dcache_arb_st_tag_req,
  snq_dcache_sdb_id,
  snq_depd_vb_id,
  snq_empty,
  snq_lfb_bypass_chg_tag,
  snq_lfb_bypass_invalid,
  snq_lfb_vb_req_hit_idx,
  snq_lm_dcache_addr_tto6,
  snq_lm_dcache_req_for_inv,
  snq_vb_bypass_check,
  snq_vb_bypass_invalid,
  snq_vb_bypass_readonce,
  snq_vb_bypass_start,
  snq_wmb_read_req_hit_idx,
  snq_wmb_write_req_hit_idx,
  st_da_snq_borrow_snq,
  st_da_snq_dcache_dirty,
  st_da_snq_dcache_share,
  st_da_snq_dcache_valid,
  st_da_snq_dcache_way,
  st_da_snq_ecc_err,
  vb_snq_bypass_db_id,
  vb_snq_bypass_hit,
  vb_snq_depd_remove,
  vb_snq_start_hit_idx,
  vb_snq_wait_remove,
  vb_snq_wait_vb_id,
  wmb_read_req_addr,
  wmb_snq_depd_remove,
  wmb_write_ptr,
  wmb_write_req_addr
);

// &Ports; @23
input   [5  :0]  arb_snq_entry_oldest_index;         
input   [39 :0]  arb_snq_snoop_addr;                 
input   [9  :0]  arb_snq_snoop_depd;                 
input   [2  :0]  arb_snq_snoop_prot;                 
input   [3  :0]  arb_snq_snoop_type;                 
input            biu_lsu_ac_req;                     
input            biu_lsu_ctc_req;                    
input            biu_sdb_cd_ready;                   
input            biu_snq_cr_ready;                   
input            cp0_lsu_icg_en;                     
input            cpurst_b;                           
input            dcache_arb_snq_ld_grnt;             
input            dcache_arb_snq_st_grnt;             
input            forever_cpuclk;                     
input            ld_da_snq_borrow_sndb;              
input            ld_da_vb_snq_data_reissue;          
input   [1  :0]  lfb_snq_bypass_data_id;             
input            lfb_snq_bypass_hit;                 
input            lfb_snq_bypass_share;               
input   [33 :0]  lfb_vb_addr_tto6;                   
input            lsu_snoop_clk;                      
input            pad_yy_icg_scan_en;                 
input   [2  :0]  sdb_data_vld;                       
input   [2  :0]  sdb_entry_avail;                    
input   [127:0]  sdb_entry_data_0;                   
input   [127:0]  sdb_entry_data_1;                   
input   [127:0]  sdb_entry_data_2;                   
input   [2  :0]  sdb_vld;                            
input            snoop_req_create_en;                
input   [5  :0]  st_da_snq_borrow_snq;               
input            st_da_snq_dcache_dirty;             
input            st_da_snq_dcache_share;             
input            st_da_snq_dcache_valid;             
input            st_da_snq_dcache_way;               
input            st_da_snq_ecc_err;                  
input   [2  :0]  vb_snq_bypass_db_id;                
input            vb_snq_bypass_hit;                  
input   [1  :0]  vb_snq_depd_remove;                 
input            vb_snq_start_hit_idx;               
input   [1  :0]  vb_snq_wait_remove;                 
input   [1  :0]  vb_snq_wait_vb_id;                  
input   [39 :0]  wmb_read_req_addr;                  
input   [7  :0]  wmb_snq_depd_remove;                
input   [7  :0]  wmb_write_ptr;                      
input   [39 :0]  wmb_write_req_addr;                 
output           cur_snq_entry_empty;                
output  [1  :0]  lsu_had_cdr_state;                  
output  [2  :0]  lsu_had_sdb_entry_vld;              
output           lsu_had_snoop_data_req;             
output           lsu_had_snoop_tag_req;              
output  [5  :0]  lsu_had_snq_entry_issued;           
output  [5  :0]  lsu_had_snq_entry_vld;              
output           lsu_sdb_not_empty;                  
output           lsu_snq_not_empty;                  
output  [127:0]  sdb_biu_cd_data;                    
output           sdb_biu_cd_last;                    
output           sdb_biu_cd_valid;                   
output  [1  :0]  sdb_create_data_order;              
output  [2  :0]  sdb_create_en;                      
output  [3  :0]  sdb_entry_data_index;               
output  [2  :0]  sdb_inv_en;                         
output  [4  :0]  snq_biu_cr_resp;                    
output           snq_biu_cr_valid;                   
output  [33 :0]  snq_bypass_addr_tto6;               
output           snq_can_create_snq_uncheck;         
output  [39 :0]  snq_create_addr;                    
output           snq_create_lfb_vb_req_hit_idx;      
output           snq_create_wmb_read_req_hit_idx;    
output           snq_create_wmb_write_req_hit_idx;   
output  [39 :0]  snq_dcache_arb_borrow_addr;         
output           snq_dcache_arb_data_way;            
output           snq_dcache_arb_ld_borrow_req;       
output           snq_dcache_arb_ld_borrow_req_gate;  
output  [7  :0]  snq_dcache_arb_ld_data_gateclk_en;  
output  [10 :0]  snq_dcache_arb_ld_data_idx;         
output           snq_dcache_arb_ld_req;              
output           snq_dcache_arb_ld_tag_gateclk_en;   
output  [8  :0]  snq_dcache_arb_ld_tag_idx;          
output           snq_dcache_arb_ld_tag_req;          
output  [1  :0]  snq_dcache_arb_ld_tag_wen;          
output           snq_dcache_arb_serial_req;          
output           snq_dcache_arb_st_borrow_req;       
output  [6  :0]  snq_dcache_arb_st_dirty_din;        
output           snq_dcache_arb_st_dirty_gateclk_en; 
output           snq_dcache_arb_st_dirty_gwen;       
output  [8  :0]  snq_dcache_arb_st_dirty_idx;        
output           snq_dcache_arb_st_dirty_req;        
output  [6  :0]  snq_dcache_arb_st_dirty_wen;        
output  [5  :0]  snq_dcache_arb_st_id;               
output           snq_dcache_arb_st_req;              
output           snq_dcache_arb_st_tag_gateclk_en;   
output  [8  :0]  snq_dcache_arb_st_tag_idx;          
output           snq_dcache_arb_st_tag_req;          
output  [2  :0]  snq_dcache_sdb_id;                  
output  [1  :0]  snq_depd_vb_id;                     
output           snq_empty;                          
output  [1  :0]  snq_lfb_bypass_chg_tag;             
output  [1  :0]  snq_lfb_bypass_invalid;             
output           snq_lfb_vb_req_hit_idx;             
output  [33 :0]  snq_lm_dcache_addr_tto6;            
output           snq_lm_dcache_req_for_inv;          
output           snq_vb_bypass_check;                
output  [2  :0]  snq_vb_bypass_invalid;              
output           snq_vb_bypass_readonce;             
output  [2  :0]  snq_vb_bypass_start;                
output           snq_wmb_read_req_hit_idx;           
output           snq_wmb_write_req_hit_idx;          

// &Regs; @24
reg     [3  :0]  cdr_cur_state;                      
reg     [3  :0]  cdr_next_state;                     
reg     [2  :0]  idfifo_create_id_ori;               
reg     [2  :0]  sdb_fifo_create_ptr;                
reg     [2  :0]  sdb_fifo_pop_ptr;                   
reg     [1  :0]  snpdt_cur_state;                    
reg     [1  :0]  snpdt_next_state;                   
reg     [2  :0]  snq_dcache_sdb_id;                  
reg     [33 :0]  snq_dcache_snoop_tag_addr;          
reg     [5  :0]  snq_dcache_snoop_tag_entry_id;      
reg              snq_dcache_snoop_tag_for_inv;       
reg              snq_dcache_snoop_tag_req_before_arb; 
reg     [34 :0]  snq_dcache_snpdt_addr;              
reg     [2  :0]  snq_dcache_snpdt_chg_tag;           
reg              snq_dcache_snpdt_chg_tag_req;       
reg              snq_dcache_snpdt_data_req;          
reg              snq_dcache_snpdt_first;             
reg              snq_dcache_snpdt_req;               
reg              snq_dcache_snpdt_way;               
reg     [5  :0]  snq_rdy_reorder;                    
reg     [5  :0]  snq_req_create_ptr;                 
reg     [5  :0]  snq_snoop_tag_startbefore_arb;      

// &Wires; @25
wire    [5  :0]  arb_snq_entry_oldest_index;         
wire    [39 :0]  arb_snq_snoop_addr;                 
wire    [9  :0]  arb_snq_snoop_depd;                 
wire    [2  :0]  arb_snq_snoop_prot;                 
wire    [3  :0]  arb_snq_snoop_type;                 
wire             biu_lsu_ac_req;                     
wire             biu_lsu_ctc_req;                    
wire             biu_sdb_cd_ready;                   
wire             biu_snq_cr_ready;                   
wire    [5  :0]  biu_snq_cr_resp_acept;              
wire             cp0_lsu_icg_en;                     
wire             cpurst_b;                           
wire             cur_sdb_entry_empty;                
wire             cur_snq_entry_empty;                
wire             dcache_arb_snq_ld_grnt;             
wire             dcache_arb_snq_st_grnt;             
wire             dcache_snq_snoop_tag_grnt;          
wire             dcache_snq_snpdt_grnt;              
wire             dcache_snq_tag_resp_dirty;          
wire             dcache_snq_tag_resp_share;          
wire             dcache_snq_tag_resp_valid;          
wire             dcache_snq_tag_resp_way;            
wire             forever_cpuclk;                     
wire             idfifo_clk;                         
wire             idfifo_clk_en;                      
wire    [2  :0]  idfifo_create_id;                   
wire    [2  :0]  idfifo_entry_create_vld;            
wire    [2  :0]  idfifo_entry_id_0;                  
wire    [2  :0]  idfifo_entry_id_1;                  
wire    [2  :0]  idfifo_entry_id_2;                  
wire             ld_da_snq_borrow_sndb;              
wire             ld_da_vb_snq_data_reissue;          
wire    [5  :0]  lfb_bypass_vld;                     
wire    [1  :0]  lfb_snq_bypass_data_id;             
wire             lfb_snq_bypass_hit;                 
wire             lfb_snq_bypass_share;               
wire    [33 :0]  lfb_vb_addr_tto6;                   
wire    [1  :0]  lsu_had_cdr_state;                  
wire    [2  :0]  lsu_had_sdb_entry_vld;              
wire             lsu_had_snoop_data_req;             
wire             lsu_had_snoop_tag_req;              
wire    [5  :0]  lsu_had_snq_entry_issued;           
wire    [5  :0]  lsu_had_snq_entry_vld;              
wire             lsu_sdb_not_empty;                  
wire             lsu_snoop_clk;                      
wire             lsu_snq_not_empty;                  
wire             pad_yy_icg_scan_en;                 
wire    [35 :0]  read_data0_addr;                    
wire    [34 :0]  read_data1_addr;                    
wire    [127:0]  sdb_biu_cd_data;                    
wire             sdb_biu_cd_last;                    
wire             sdb_biu_cd_valid;                   
wire    [1  :0]  sdb_create_data_order;              
wire    [2  :0]  sdb_create_en;                      
wire    [2  :0]  sdb_create_ptr;                     
wire             sdb_data_pop_vld;                   
wire             sdb_data_return;                    
wire             sdb_data_returned;                  
wire    [2  :0]  sdb_data_vld;                       
wire    [2  :0]  sdb_entry_avail;                    
wire    [127:0]  sdb_entry_data_0;                   
wire    [127:0]  sdb_entry_data_1;                   
wire    [127:0]  sdb_entry_data_2;                   
wire    [3  :0]  sdb_entry_data_index;               
wire             sdb_entry_inv;                      
wire    [127:0]  sdb_entry_pop_data;                 
wire    [2  :0]  sdb_inv_en;                         
wire    [2  :0]  sdb_pop_ptr;                        
wire    [2  :0]  sdb_vld;                            
wire             snoop_dt_req_create_en;             
wire             snoop_dt_req_pop_en;                
wire             snoop_req_create_en;                
wire    [33 :0]  snoop_tag_addr;                     
wire    [5  :0]  snoop_tag_entry_id;                 
wire             snoop_tag_for_inv;                  
wire             snoop_tag_req_create_en;            
wire             snoop_tag_req_pop_en;               
wire             snoop_tag_req_ready;                
wire    [34 :0]  snpdt_addr;                         
wire             snpdt_check_ecc;                    
wire    [2  :0]  snpdt_chg_tag;                      
wire             snpdt_clk_en;                       
wire             snpdt_crt_up;                       
wire             snpdt_next_data;                    
wire             snpdt_sdb_create_en;                
wire             snpdt_snpt_cmplt;                   
wire    [5  :0]  snpdt_snq_cmplt;                    
wire             snpdt_state_idle;                   
wire             snpdt_state_reissue;                
wire             snpdt_way;                          
wire             snpdtclk;                           
wire             snpt_clk_en;                        
wire    [5  :0]  snpt_snpdt_start;                   
wire             snptclk;                            
wire    [4  :0]  snq_biu_cr_resp;                    
wire             snq_biu_cr_valid;                   
wire    [33 :0]  snq_bypass_addr_tto6;               
wire             snq_can_create_snq_uncheck;         
wire    [5  :0]  snq_cr_resp_valid;                  
wire    [39 :0]  snq_create_addr;                    
wire             snq_create_clk_en;                  
wire    [9  :0]  snq_create_depd;                    
wire    [5  :0]  snq_create_en;                      
wire             snq_create_lfb_vb_req_hit_idx;      
wire    [2  :0]  snq_create_prot;                    
wire    [3  :0]  snq_create_type;                    
wire             snq_create_vld;                     
wire             snq_create_wmb_read_req_hit_idx;    
wire             snq_create_wmb_write_req_hit_idx;   
wire             snq_crt_clk;                        
wire             snq_ctl_clk;                        
wire             snq_ctl_clk_en;                     
wire    [39 :0]  snq_dcache_arb_borrow_addr;         
wire             snq_dcache_arb_data_way;            
wire             snq_dcache_arb_ld_borrow_req;       
wire             snq_dcache_arb_ld_borrow_req_gate;  
wire    [7  :0]  snq_dcache_arb_ld_data_gateclk_en;  
wire    [10 :0]  snq_dcache_arb_ld_data_idx;         
wire             snq_dcache_arb_ld_data_req;         
wire             snq_dcache_arb_ld_req;              
wire             snq_dcache_arb_ld_tag_gateclk_en;   
wire    [8  :0]  snq_dcache_arb_ld_tag_idx;          
wire             snq_dcache_arb_ld_tag_req;          
wire    [1  :0]  snq_dcache_arb_ld_tag_wen;          
wire             snq_dcache_arb_serial_req;          
wire             snq_dcache_arb_st_borrow_req;       
wire    [6  :0]  snq_dcache_arb_st_dirty_din;        
wire             snq_dcache_arb_st_dirty_gateclk_en; 
wire             snq_dcache_arb_st_dirty_gwen;       
wire    [8  :0]  snq_dcache_arb_st_dirty_idx;        
wire             snq_dcache_arb_st_dirty_req;        
wire    [6  :0]  snq_dcache_arb_st_dirty_wen;        
wire    [5  :0]  snq_dcache_arb_st_id;               
wire             snq_dcache_arb_st_req;              
wire             snq_dcache_arb_st_tag_gateclk_en;   
wire    [8  :0]  snq_dcache_arb_st_tag_idx;          
wire             snq_dcache_arb_st_tag_req;          
wire    [33 :0]  snq_dcache_req_addr_tto6;           
wire             snq_dcache_snoop_tag_req;           
wire             snq_dcache_snpdt_chg_tag_req_bf;    
wire             snq_dcache_snpdt_req_bf;            
wire    [9  :0]  snq_depd_remove;                    
wire    [1  :0]  snq_depd_vb_id;                     
wire             snq_empty;                          
wire    [35 :0]  snq_entry0_addr;                    
wire    [4  :0]  snq_entry0_cr_resp;                 
wire    [35 :0]  snq_entry1_addr;                    
wire    [4  :0]  snq_entry1_cr_resp;                 
wire    [35 :0]  snq_entry2_addr;                    
wire    [4  :0]  snq_entry2_cr_resp;                 
wire    [35 :0]  snq_entry3_addr;                    
wire    [4  :0]  snq_entry3_cr_resp;                 
wire    [35 :0]  snq_entry4_addr;                    
wire    [4  :0]  snq_entry4_cr_resp;                 
wire    [35 :0]  snq_entry5_addr;                    
wire    [4  :0]  snq_entry5_cr_resp;                 
wire    [2  :0]  snq_entry_bypass_db_id_0;           
wire    [2  :0]  snq_entry_bypass_db_id_1;           
wire    [2  :0]  snq_entry_bypass_db_id_2;           
wire    [2  :0]  snq_entry_bypass_db_id_3;           
wire    [2  :0]  snq_entry_bypass_db_id_4;           
wire    [2  :0]  snq_entry_bypass_db_id_5;           
wire    [1  :0]  snq_entry_depd_vb_id_0;             
wire    [1  :0]  snq_entry_depd_vb_id_1;             
wire    [1  :0]  snq_entry_depd_vb_id_2;             
wire    [1  :0]  snq_entry_depd_vb_id_3;             
wire    [1  :0]  snq_entry_depd_vb_id_4;             
wire    [1  :0]  snq_entry_depd_vb_id_5;             
wire    [5  :0]  snq_entry_lfb_bypass_chg_tag_data0; 
wire    [5  :0]  snq_entry_lfb_bypass_chg_tag_data1; 
wire    [5  :0]  snq_entry_lfb_bypass_invalid_data0; 
wire    [5  :0]  snq_entry_lfb_bypass_invalid_data1; 
wire    [5  :0]  snq_entry_lfb_vb_req_hit_idx;       
wire    [5  :0]  snq_entry_vb_bypass_invalid;        
wire    [5  :0]  snq_entry_vb_bypass_readonce;       
wire    [5  :0]  snq_entry_vb_bypass_start;          
wire    [5  :0]  snq_entry_wmb_read_req_hit_idx;     
wire    [5  :0]  snq_entry_wmb_write_req_hit_idx;    
wire    [33 :0]  snq_from_lfb_vb_addr_tto6;          
wire    [39 :0]  snq_from_wmb_read_req_addr;         
wire    [39 :0]  snq_from_wmb_write_req_addr;        
wire    [5  :0]  snq_issued;                         
wire    [1  :0]  snq_lfb_bypass_chg_tag;             
wire    [1  :0]  snq_lfb_bypass_invalid;             
wire             snq_lfb_data_bypass_hit;            
wire             snq_lfb_vb_req_hit_idx;             
wire    [33 :0]  snq_lm_dcache_addr_tto6;            
wire             snq_lm_dcache_req_for_inv;          
wire    [5  :0]  snq_need_chg_tag;                   
wire    [5  :0]  snq_need_chg_tag_i;                 
wire    [5  :0]  snq_need_chg_tag_s;                 
wire    [5  :0]  snq_need_read_data;                 
wire    [5  :0]  snq_rd_tag_rdy;                     
wire    [5  :0]  snq_reorder_index0;                 
wire    [5  :0]  snq_reorder_index1;                 
wire    [5  :0]  snq_reorder_index2;                 
wire    [5  :0]  snq_reorder_index3;                 
wire    [5  :0]  snq_reorder_index4;                 
wire    [5  :0]  snq_reorder_index5;                 
wire    [5  :0]  snq_resp_create_en;                 
wire    [5  :0]  snq_snoop_tag_req;                  
wire    [5  :0]  snq_snoop_tag_start;                
wire             snq_snpdt_chg_tag_i;                
wire             snq_snpdt_chg_tag_s;                
wire             snq_snpdt_need_chg_tag;             
wire             snq_snpdt_need_data;                
wire             snq_snpdt_start;                    
wire    [5  :0]  snq_tag_req_for_inv;                
wire             snq_vb_bypass_check;                
wire    [2  :0]  snq_vb_bypass_id;                   
wire    [2  :0]  snq_vb_bypass_invalid;              
wire             snq_vb_bypass_readonce;             
wire    [2  :0]  snq_vb_bypass_start;                
wire             snq_vb_data_bypass_hit;             
wire    [5  :0]  snq_vld;                            
wire             snq_wait_vb_vld;                    
wire    [5  :0]  snq_way;                            
wire             snq_wmb_read_req_hit_idx;           
wire             snq_wmb_write_req_hit_idx;          
wire    [5  :0]  st_da_snq_borrow_snq;               
wire             st_da_snq_dcache_dirty;             
wire             st_da_snq_dcache_share;             
wire             st_da_snq_dcache_valid;             
wire             st_da_snq_dcache_way;               
wire             st_da_snq_ecc_err;                  
wire             vb_bypass_start;                    
wire    [5  :0]  vb_bypass_vld;                      
wire    [2  :0]  vb_snq_bypass_db_id;                
wire             vb_snq_bypass_hit;                  
wire    [1  :0]  vb_snq_depd_remove;                 
wire             vb_snq_start_hit_idx;               
wire    [5  :0]  vb_snq_start_wait;                  
wire    [1  :0]  vb_snq_wait_remove;                 
wire    [1  :0]  vb_snq_wait_vb_id;                  
wire    [39 :0]  wmb_read_req_addr;                  
wire    [7  :0]  wmb_snq_depd_remove;                
wire    [7  :0]  wmb_write_ptr;                      
wire    [39 :0]  wmb_write_req_addr;                 


//======================================
//   snoop queue req create
//======================================
// &Force("output","cur_snq_entry_empty"); @30
assign cur_snq_entry_empty = !(|(snq_req_create_ptr[5:0] & snq_vld[5:0]));
//--------------------------------------
//snoop queue pointer update:one hot
//6 entry
assign snq_create_clk_en = snoop_req_create_en;
// &Instance("gated_clk_cell","x_snq_create_gated_cell"); @36
gated_clk_cell  x_snq_create_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snq_crt_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snq_create_clk_en ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk      ), @37
//           .clk_out          (snq_crt_clk         ), @38
//           .external_en      (1'b0                ), @39
//           .global_en        (1'b1                ), @40
//           .local_en         (snq_create_clk_en   ), @41
//           .module_en        (cp0_lsu_icg_en   ) @42
//         ); @43

always @(posedge snq_crt_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    snq_req_create_ptr[5:0] <= 6'b1;
  else if(snoop_req_create_en)
    snq_req_create_ptr[5:0] <= {snq_req_create_ptr[4:0],
                                snq_req_create_ptr[5]};
end

assign snq_create_en[5:0] = {6{snoop_req_create_en}}
                          & snq_req_create_ptr[5:0];


//--------------------------------------
//for record into Create Order Queue
//assign snq_cur_create_entryid[5:0] = snq_create_en[5:0];
//--------------------------------------
//content
assign snq_create_depd[9:0] = arb_snq_snoop_depd[9:0];
assign snq_create_vld        =  biu_lsu_ac_req
                             && !biu_lsu_ctc_req;
// &Force("output","snq_can_create_snq_uncheck"); @75
assign snq_can_create_snq_uncheck =  snq_create_vld
                                  && cur_snq_entry_empty;
// &Force("output","snq_create_addr"); @78
assign snq_create_addr[`PA_WIDTH-1:0] = arb_snq_snoop_addr[`PA_WIDTH-1:0];
assign snq_create_type[3:0]  = arb_snq_snoop_type[3:0];
//prot signal is of no use
// &Force("nonport","snq_create_prot"); @82
assign snq_create_prot[2:0]  = arb_snq_snoop_prot[2:0];

//--------------------------------------
//compare idx
assign snq_from_lfb_vb_addr_tto6[`PA_WIDTH-7:0]  = lfb_vb_addr_tto6[`PA_WIDTH-7:0];
assign snq_create_lfb_vb_req_hit_idx    = snq_can_create_snq_uncheck
                                          &&  (snq_create_addr[13:6]
                                              ==  snq_from_lfb_vb_addr_tto6[7:0]);

assign snq_from_wmb_read_req_addr[`PA_WIDTH-1:0] = wmb_read_req_addr[`PA_WIDTH-1:0];
assign snq_create_wmb_read_req_hit_idx  = snq_can_create_snq_uncheck
                                          &&  (snq_create_addr[13:6]
                                              ==  snq_from_wmb_read_req_addr[13:6]);

assign snq_from_wmb_write_req_addr[`PA_WIDTH-1:0]  = wmb_write_req_addr[`PA_WIDTH-1:0];
assign snq_create_wmb_write_req_hit_idx = snq_can_create_snq_uncheck
                                          &&  (snq_create_addr[13:6]
                                              ==  snq_from_wmb_write_req_addr[13:6]);

//======================================
//     snoop req launch entry select
//      select one entry to launch(oldest ready)
//        tag_read req to DCACHE
//======================================
// &CombBeg; @107
always @( snq_req_create_ptr[5:0]
       or snq_rd_tag_rdy[5:0])
begin
  case(snq_req_create_ptr[5:0])
    6'b00_0001: snq_rdy_reorder[5:0] = snq_rd_tag_rdy[5:0];
    6'b00_0010: snq_rdy_reorder[5:0] = {snq_rd_tag_rdy[0:0], snq_rd_tag_rdy[5:1]};
    6'b00_0100: snq_rdy_reorder[5:0] = {snq_rd_tag_rdy[1:0], snq_rd_tag_rdy[5:2]};
    6'b00_1000: snq_rdy_reorder[5:0] = {snq_rd_tag_rdy[2:0], snq_rd_tag_rdy[5:3]};
    6'b01_0000: snq_rdy_reorder[5:0] = {snq_rd_tag_rdy[3:0], snq_rd_tag_rdy[5:4]};
    6'b10_0000: snq_rdy_reorder[5:0] = {snq_rd_tag_rdy[4:0], snq_rd_tag_rdy[5:5]};
    default   : snq_rdy_reorder[5:0] = 6'b0;//never
  endcase
// &CombEnd; @117
end

assign snq_reorder_index0[5:0] = snq_req_create_ptr[5:0];
assign snq_reorder_index1[5:0] = {snq_req_create_ptr[4:0], snq_req_create_ptr[5:5]};
assign snq_reorder_index2[5:0] = {snq_req_create_ptr[3:0], snq_req_create_ptr[5:4]};
assign snq_reorder_index3[5:0] = {snq_req_create_ptr[2:0], snq_req_create_ptr[5:3]};
assign snq_reorder_index4[5:0] = {snq_req_create_ptr[1:0], snq_req_create_ptr[5:2]};
assign snq_reorder_index5[5:0] = {snq_req_create_ptr[0:0], snq_req_create_ptr[5:1]};
//--------------------------------------
//select oldest rdy entry
// &CombBeg; @127
always @( snq_reorder_index3[5:0]
       or snq_reorder_index2[5:0]
       or snq_reorder_index4[5:0]
       or snq_reorder_index1[5:0]
       or snq_reorder_index0[5:0]
       or snq_rdy_reorder[5:0]
       or snq_reorder_index5[5:0])
begin
  casez(snq_rdy_reorder[5:0])
    6'b??_???1: snq_snoop_tag_startbefore_arb[5:0] = snq_reorder_index0[5:0];
    6'b??_??10: snq_snoop_tag_startbefore_arb[5:0] = snq_reorder_index1[5:0];
    6'b??_?100: snq_snoop_tag_startbefore_arb[5:0] = snq_reorder_index2[5:0];
    6'b??_1000: snq_snoop_tag_startbefore_arb[5:0] = snq_reorder_index3[5:0];
    6'b?1_0000: snq_snoop_tag_startbefore_arb[5:0] = snq_reorder_index4[5:0];
    6'b10_0000: snq_snoop_tag_startbefore_arb[5:0] = snq_reorder_index5[5:0];
    default   : snq_snoop_tag_startbefore_arb[5:0] = 6'b0;
  endcase
// &CombEnd; @137
end
//--------------------------------------
//snpdt has higher priority
assign snq_snoop_tag_start[5:0] = snq_snoop_tag_startbefore_arb[5:0];
//                                & {6{~snq_snpdt_start}};
//--------------------------------------
//grnt read tag req
//assign dcache_snq_snoop_tag_grnt = dcache_arb_snq_st_grnt;
assign dcache_snq_snoop_tag_grnt = snoop_tag_req_create_en;
//======================================
//     snoop dcache tag
//======================================
//assign snq_dcache_snoop_tag_req = |(snq_snoop_tag_req[5:0]);
assign snoop_tag_addr[`PA_WIDTH-7:0] = (snq_entry0_addr[`PA_WIDTH-5:2] & {`PA_WIDTH-6{snq_snoop_tag_start[0]}})
                            | (snq_entry1_addr[`PA_WIDTH-5:2] & {`PA_WIDTH-6{snq_snoop_tag_start[1]}})
                            | (snq_entry2_addr[`PA_WIDTH-5:2] & {`PA_WIDTH-6{snq_snoop_tag_start[2]}})
                            | (snq_entry3_addr[`PA_WIDTH-5:2] & {`PA_WIDTH-6{snq_snoop_tag_start[3]}})
                            | (snq_entry4_addr[`PA_WIDTH-5:2] & {`PA_WIDTH-6{snq_snoop_tag_start[4]}})
                            | (snq_entry5_addr[`PA_WIDTH-5:2] & {`PA_WIDTH-6{snq_snoop_tag_start[5]}});
assign snoop_tag_entry_id[5:0] = snq_snoop_tag_req[5:0];
assign snoop_tag_for_inv = |(snq_snoop_tag_start[5:0] & snq_tag_req_for_inv[5:0]);

//to remove deadlock for evict transaction
assign snq_depd_vb_id[1:0] = {2{arb_snq_entry_oldest_index[0]}} & snq_entry_depd_vb_id_0[1:0]
                             | {2{arb_snq_entry_oldest_index[1]}} & snq_entry_depd_vb_id_1[1:0]
                             | {2{arb_snq_entry_oldest_index[2]}} & snq_entry_depd_vb_id_2[1:0]
                             | {2{arb_snq_entry_oldest_index[3]}} & snq_entry_depd_vb_id_3[1:0]
                             | {2{arb_snq_entry_oldest_index[4]}} & snq_entry_depd_vb_id_4[1:0]
                             | {2{arb_snq_entry_oldest_index[5]}} & snq_entry_depd_vb_id_5[1:0];
//for timing : flop
assign snoop_tag_req_ready =  |snq_rd_tag_rdy[5:0];

assign snoop_tag_req_create_en =  snoop_tag_req_ready //(|snq_snoop_tag_req[5:0])
                               && (   !snq_dcache_snoop_tag_req_before_arb
                                   || snoop_tag_req_pop_en);
assign snoop_tag_req_pop_en =  snq_dcache_snoop_tag_req
                            && dcache_arb_snq_st_grnt;
                         // && !dcache_arb_snq_ld_grnt;
always @(posedge snq_ctl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    snq_dcache_snoop_tag_req_before_arb <= 1'b0;
  else if(snoop_tag_req_create_en)
    snq_dcache_snoop_tag_req_before_arb <= 1'b1;
  else if(snoop_tag_req_pop_en)
    snq_dcache_snoop_tag_req_before_arb <= 1'b0;
end
//snpdt has higher priority
assign snq_dcache_snoop_tag_req =  snq_dcache_snoop_tag_req_before_arb
                                && !snq_dcache_snpdt_req;
always @(posedge snptclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    snq_dcache_snoop_tag_addr[`PA_WIDTH-7:0]  <= {`PA_WIDTH-6{1'b0}};
    snq_dcache_snoop_tag_entry_id[5:0]        <= 6'b0;
    snq_dcache_snoop_tag_for_inv              <= 1'b0;
  end
  else if(snoop_tag_req_create_en)
  begin
    snq_dcache_snoop_tag_addr[`PA_WIDTH-7:0]  <= snoop_tag_addr[`PA_WIDTH-7:0];
    snq_dcache_snoop_tag_entry_id[5:0]        <= snoop_tag_entry_id[5:0];
    snq_dcache_snoop_tag_for_inv              <= snoop_tag_for_inv;
  end
end

//======================================
//     acept tag_resp from dcache
//======================================
assign snq_resp_create_en[5:0] = st_da_snq_borrow_snq[5:0];
//assign dcache_snpu_tag_resp[3:0]

//======================================
// SNPT FSM(snq entry) start SNPDT FSM
//======================================
//assign snq_snpdt_start = |(snpt_snpdt_start[5:0] & arb_snq_entry_oldest_index[5:0]);
assign snq_snpdt_start        = |snpt_snpdt_start[5:0];
//assign snq_snpdt_start_window = |snpt_snpdt_start_window[5:0];
assign snq_snpdt_chg_tag_s = |(snq_need_chg_tag_s[5:0] & arb_snq_entry_oldest_index[5:0]);
//assign snq_snpdt_chg_tag_m = |(snq_need_chg_tag_m[5:0] & arb_snq_entry_oldest_index[5:0]);
assign snq_snpdt_chg_tag_i = |(snq_need_chg_tag_i[5:0] & arb_snq_entry_oldest_index[5:0]);
assign snq_snpdt_need_chg_tag = |(snq_need_chg_tag[5:0] & arb_snq_entry_oldest_index[5:0]);
assign snq_snpdt_need_data    = |(snq_need_read_data[5:0] & arb_snq_entry_oldest_index[5:0]);

//======================================
//     acept snpdt FSM complete
//     (snoop data & change tag)
//======================================
assign snpdt_snq_cmplt[5:0] = {6{snpdt_snpt_cmplt}}
                             & arb_snq_entry_oldest_index[5:0];


//======================================
//     snoop queue return resp
//     send cr resp to biu
//     handshake with biu
//======================================
assign snq_biu_cr_valid     = |(snq_cr_resp_valid[5:0] & arb_snq_entry_oldest_index[5:0]);
assign snq_biu_cr_resp[4:0] = {snq_entry0_cr_resp[4:0] & {5{snq_cr_resp_valid[0]}}}
                            | {snq_entry1_cr_resp[4:0] & {5{snq_cr_resp_valid[1]}}}
                            | {snq_entry2_cr_resp[4:0] & {5{snq_cr_resp_valid[2]}}}
                            | {snq_entry3_cr_resp[4:0] & {5{snq_cr_resp_valid[3]}}}
                            | {snq_entry4_cr_resp[4:0] & {5{snq_cr_resp_valid[4]}}}
                            | {snq_entry5_cr_resp[4:0] & {5{snq_cr_resp_valid[5]}}};

assign biu_snq_cr_resp_acept[5:0] = {6{biu_snq_cr_ready}} & snq_cr_resp_valid[5:0]; //only one valid

// &Force("output","snq_biu_cr_valid"); @245

//==========================================================
//                  SNPDT FSM
//  snoop data and(or) change tag state(to S/E/I)
//==========================================================
parameter SNPDT_IDLE         = 2'b00;//read first data
parameter SNPDT_RD_NEXT_DATA = 2'b01;
parameter SNPDT_RD_CHECK_ECC = 2'b11;
parameter SNPDT_REISSUE      = 2'b10;

//when the fsm start, the dt pop entry should always be available,
//since last req must be received grnt when it came to wait pop state

//also,since dcache will always give snq two series grnt,we only need one grnt
//to pop

always @(posedge snq_ctl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    snpdt_cur_state[1:0] <= SNPDT_IDLE;
  else
    snpdt_cur_state[1:0] <= snpdt_next_state[1:0];
end
// &CombBeg; @277
always @( snpdt_cur_state
       or snq_snpdt_start
       or cur_sdb_entry_empty
       or ld_da_vb_snq_data_reissue
       or snq_snpdt_need_data
       or dcache_snq_snpdt_grnt)
begin
  case(snpdt_cur_state)
    SNPDT_IDLE:
    begin
      if(snq_snpdt_start && snq_snpdt_need_data && cur_sdb_entry_empty)
      begin
          snpdt_next_state[1:0] = SNPDT_RD_NEXT_DATA;
      end
      else
        snpdt_next_state[1:0] = SNPDT_IDLE;
    end
    SNPDT_RD_NEXT_DATA:
    begin
      if(dcache_snq_snpdt_grnt)
        snpdt_next_state[1:0] = SNPDT_IDLE;
      else
        snpdt_next_state[1:0] = SNPDT_RD_NEXT_DATA;
    end
    SNPDT_RD_CHECK_ECC:
    begin
      if(ld_da_vb_snq_data_reissue)
        snpdt_next_state[1:0] = SNPDT_REISSUE;
      else
        snpdt_next_state[1:0] = SNPDT_IDLE;
    end
    SNPDT_REISSUE:
    begin
      if(snq_snpdt_need_data && cur_sdb_entry_empty)
      begin
          snpdt_next_state[1:0] = SNPDT_RD_NEXT_DATA;
      end
      else
        snpdt_next_state[1:0] = SNPDT_REISSUE;
    end
  endcase
// &CombEnd; @316
end

assign snpdt_state_idle    = !snpdt_cur_state[1] && !snpdt_cur_state[0];
assign snpdt_next_data     = !snpdt_cur_state[1] && snpdt_cur_state[0];
assign snpdt_check_ecc     = snpdt_cur_state[1] && snpdt_cur_state[0];
assign snpdt_state_reissue = snpdt_cur_state[1] && !snpdt_cur_state[0];

//&CombBeg;
//  snq_dcache_snpdt_req_bf = 1'b0;
//  snq_dcache_snpdt_chg_tag_req_bf = 1'b0;
//  snpdt_sdb_create_en     = 1'b0;
////  snpdt_snpt_cmplt      = 1'b0;
//  case(snpdt_cur_state)
//    SNPDT_IDLE:
//    begin
//      if(snq_snpdt_start && snq_snpdt_need_data && cur_sdb_entry_empty)
//      begin
//        snq_dcache_snpdt_req_bf = 1'b1;
//        snq_dcache_snpdt_chg_tag_req_bf = 1'b0;
//        snpdt_sdb_create_en  = 1'b1;
////        if(snoop_dt_req_pop_en)
////          snpdt_snpt_cmplt = 1'b1; //quick cmplt
//      end
//      else if(snq_snpdt_start && !snq_snpdt_need_data && snq_snpdt_need_chg_tag)
//      begin
//        snq_dcache_snpdt_req_bf = 1'b1;
//        snq_dcache_snpdt_chg_tag_req_bf = 1'b1;
////        if(snoop_dt_req_pop_en)
////          snpdt_snpt_cmplt = 1'b1; //
//      end
//      else
//      begin
//        snq_dcache_snpdt_req_bf = 1'b0;
//        snq_dcache_snpdt_chg_tag_req_bf = 1'b0;
//        snpdt_sdb_create_en     = 1'b0;
////        snpdt_snpt_cmplt      = 1'b0;
//      end
//    end
//    SNPDT_RD_NEXT_DATA:
//    begin
//      snq_dcache_snpdt_req_bf = 1'b1;
//      if(snq_snpdt_need_chg_tag)
//        snq_dcache_snpdt_chg_tag_req_bf = 1'b1;
//      else
//        snq_dcache_snpdt_chg_tag_req_bf = 1'b0;
//    end
//  endcase
//&CombEnd;
//coding style
assign snq_dcache_snpdt_req_bf =  (snpdt_state_idle 
                                      && snq_snpdt_start
                                   || snpdt_state_reissue)
                                  && (snq_snpdt_need_data && cur_sdb_entry_empty
                                      || !snq_snpdt_need_data && snq_snpdt_need_chg_tag)
                               || snpdt_next_data;

assign snq_dcache_snpdt_chg_tag_req_bf =  snpdt_state_idle
                                          && snq_snpdt_start
                                          && !snq_snpdt_need_data && snq_snpdt_need_chg_tag
                                       || snpdt_next_data
                                          && snq_snpdt_need_chg_tag;
assign snpdt_sdb_create_en = snpdt_state_idle 
                           && snq_snpdt_start
                           && snq_snpdt_need_data
                           && cur_sdb_entry_empty;

//for timing
assign snpdt_snpt_cmplt = snoop_dt_req_pop_en;
//grnt read data and(or) change state
//assign dcache_snq_snpdt_grnt = dcache_arb_snq_ld_grnt;
assign dcache_snq_snpdt_grnt = snoop_dt_req_create_en;
//======================================
// read data and(or) change line state
//======================================
//read_data0_addr[`PA_WIDTH-6:0] is real addr[`PA_WIDTH-1:5] 256bits align
assign read_data0_addr[`PA_WIDTH-5:0] =
                (snq_entry0_addr[`PA_WIDTH-5:0] & {`PA_WIDTH-4{arb_snq_entry_oldest_index[0]}})
                | (snq_entry1_addr[`PA_WIDTH-5:0] & {`PA_WIDTH-4{arb_snq_entry_oldest_index[1]}})
                | (snq_entry2_addr[`PA_WIDTH-5:0] & {`PA_WIDTH-4{arb_snq_entry_oldest_index[2]}})
                | (snq_entry3_addr[`PA_WIDTH-5:0] & {`PA_WIDTH-4{arb_snq_entry_oldest_index[3]}})
                | (snq_entry4_addr[`PA_WIDTH-5:0] & {`PA_WIDTH-4{arb_snq_entry_oldest_index[4]}})
                | (snq_entry5_addr[`PA_WIDTH-5:0] & {`PA_WIDTH-4{arb_snq_entry_oldest_index[5]}});
//second 256bits
assign read_data1_addr[`PA_WIDTH-6:0] = {read_data0_addr[`PA_WIDTH-5:2],!read_data0_addr[1]};
//read addr
assign snpdt_addr[`PA_WIDTH-6:0]  = snpdt_next_data
                                    ? read_data1_addr[`PA_WIDTH-6:0] //NEXT_DATA
                                    : {read_data0_addr[`PA_WIDTH-5:1]};
//if need change tag state
assign snpdt_chg_tag[2:0] = snq_snpdt_chg_tag_i ? 3'b000 :
                            {1'b0,
                             snq_snpdt_chg_tag_s,
                             1'b1};
//for read data snd change tag
assign snpdt_way = (snq_way[0] & arb_snq_entry_oldest_index[0])
                 | (snq_way[1] & arb_snq_entry_oldest_index[1])
                 | (snq_way[2] & arb_snq_entry_oldest_index[2])
                 | (snq_way[3] & arb_snq_entry_oldest_index[3])
                 | (snq_way[4] & arb_snq_entry_oldest_index[4])
                 | (snq_way[5] & arb_snq_entry_oldest_index[5]);
//for timing:flop
assign snoop_dt_req_create_en =  snq_dcache_snpdt_req_bf
                              && (   !snq_dcache_snpdt_req
                                  || snoop_dt_req_pop_en);
assign snoop_dt_req_pop_en = dcache_arb_snq_st_grnt && dcache_arb_snq_ld_grnt;
always @(posedge snq_ctl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    snq_dcache_snpdt_req <= 1'b0;
  else if(snoop_dt_req_create_en)
    snq_dcache_snpdt_req <= 1'b1;
  else if(snoop_dt_req_pop_en)
    snq_dcache_snpdt_req <= 1'b0;
  else
    snq_dcache_snpdt_req <= snq_dcache_snpdt_req;
end
always @(posedge snpdtclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    snq_dcache_snpdt_chg_tag_req  <= 1'b0;
    snq_dcache_snpdt_data_req     <= 1'b0;
    snq_dcache_snpdt_addr[`PA_WIDTH-6:0]   <= {`PA_WIDTH-5{1'b0}};
    snq_dcache_snpdt_chg_tag[2:0] <= 3'b0;
    snq_dcache_snpdt_way          <= 1'b0;
    snq_dcache_snpdt_first        <= 1'b0;
  end
  else if(snoop_dt_req_create_en)
  begin
    snq_dcache_snpdt_chg_tag_req  <= snq_dcache_snpdt_chg_tag_req_bf;
    snq_dcache_snpdt_data_req     <= snq_snpdt_need_data;
    snq_dcache_snpdt_addr[`PA_WIDTH-6:0]   <= snpdt_addr[`PA_WIDTH-6:0];
    snq_dcache_snpdt_chg_tag[2:0] <= snpdt_chg_tag[2:0];
    snq_dcache_snpdt_way          <= snpdt_way;
    snq_dcache_snpdt_first        <= snpdt_state_idle || snpdt_state_reissue; //SNPDT_IDLE
  end
end

//for sdb data id
always @(posedge snpdtclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    snq_dcache_sdb_id[2:0]        <= 3'b0; 
  end
  else if(snoop_dt_req_create_en && snpdt_state_idle)
  begin
    snq_dcache_sdb_id[2:0]        <= sdb_create_ptr[2:0]; 
  end
end
    

//==========================================================
//                      CDR FSM
//                    data return
//==========================================================
parameter CDR_IDLE  = 4'b0001;
parameter CDR_DATA1 = 4'b0010;
parameter CDR_DATA2 = 4'b0100;
parameter CDR_DATA3 = 4'b1000;

always @(posedge snq_ctl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cdr_cur_state[3:0] <= CDR_IDLE;
  else
    cdr_cur_state[3:0] <= cdr_next_state[3:0];
end

// &CombBeg; @492
always @( sdb_data_pop_vld
       or biu_sdb_cd_ready
       or cdr_cur_state
       or sdb_biu_cd_valid)
begin
  case(cdr_cur_state)
    CDR_IDLE:
    begin
      if(sdb_data_pop_vld && sdb_biu_cd_valid && biu_sdb_cd_ready)
        cdr_next_state[3:0] = CDR_DATA1;
      else
        cdr_next_state[3:0] = CDR_IDLE;
    end
    CDR_DATA1:
    begin
      if(sdb_biu_cd_valid && biu_sdb_cd_ready)
        cdr_next_state[3:0] = CDR_DATA2;
      else
        cdr_next_state[3:0] = CDR_DATA1;
    end
    CDR_DATA2:
    begin
      if(sdb_biu_cd_valid && biu_sdb_cd_ready)
        cdr_next_state[3:0] = CDR_DATA3;
      else
        cdr_next_state[3:0] = CDR_DATA2;
    end
    CDR_DATA3:
    begin
      if(sdb_biu_cd_valid && biu_sdb_cd_ready)
        cdr_next_state[3:0] = CDR_IDLE;
      else
        cdr_next_state[3:0] = CDR_DATA3;
    end
  default:cdr_next_state[3:0] = CDR_IDLE;
  endcase
// &CombEnd; @524
end
//control
assign sdb_data_return         = sdb_data_pop_vld && sdb_biu_cd_valid;
assign sdb_data_returned       = sdb_data_return && biu_sdb_cd_ready;
assign sdb_entry_inv           =  sdb_data_returned && cdr_cur_state[3];
//                               && cdr_cur_state[1:0] == CDR_DATA3;
       
//==========================================================
//                 snoop data buffer maintance(2 entry)
//                    create & pop pointer(2 entry)
//                     every entry 4 data pointer
//==========================================================
//cur sdb entry create
assign sdb_create_en[2:0]          = {3{snpdt_sdb_create_en}} & sdb_create_ptr[2:0];
//assign sdb_create_window[1:0]      = {2{snq_snpdt_start_window}} & sdb_create_ptr[1:0];
assign sdb_create_data_order[1:0]  = read_data0_addr[1:0];
//cur sdb data create
//assign sdb_data_create_en[1:0]     = {2{ld_da_snq_borrow_sndb}} & sdb_data_create_ptr[1:0];
//assign sdb_data_create_data[255:0] = ld_da_data256[255:0];
//cur sdb pop entry valid
assign sdb_data_pop_vld    = |(sdb_data_vld[2:0] & sdb_pop_ptr[2:0]);
//data select
//assign sdb_entry0_data_index[3:0] = sdb_entry0_data_vld[3:0]
//                                  & sdb_entry0_data_return_ptr[3:0];
//assign sdb_entry1_data_index[3:0] = sdb_entry1_data_vld[3:0]
//                                  & sdb_entry1_data_return_ptr[3:0];
//
//assign cur_return_data_index[3:0] = sdb_entry0_data_index[3:0]
//                                  | sdb_entry1_data_index[3:0];

assign sdb_entry_data_index[3:0]  = cdr_cur_state[3:0];
assign sdb_entry_pop_data[127:0]  = sdb_entry_data_0[127:0] & {128{sdb_pop_ptr[0]}}
                                    | sdb_entry_data_1[127:0] & {128{sdb_pop_ptr[1]}}
                                    | sdb_entry_data_2[127:0] & {128{sdb_pop_ptr[2]}};

//return to biu
// &Force("output","sdb_biu_cd_valid"); @563
assign sdb_biu_cd_valid       = sdb_data_pop_vld;
assign sdb_biu_cd_data[127:0] = sdb_entry_pop_data[127:0];
assign sdb_biu_cd_last        = sdb_biu_cd_valid && cdr_cur_state[3];
//                              && cdr_cur_state[1:0] == CDR_DATA3;
//inv sdb entry
assign sdb_inv_en[2:0] = {3{sdb_entry_inv}} & sdb_pop_ptr[2:0];

//================================
//      sdb fifo           
//================================
//instance fifo
// &ConnRule(s/_x$/[0]/); @580
// &ConnRule(s/_v$/_0/); @581
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_sdb_idfifo_0"); @582
ct_lsu_idfifo_entry  x_ct_lsu_sdb_idfifo_0 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[0]),
  .idfifo_entry_id_v          (idfifo_entry_id_0         )
);


// &ConnRule(s/_x$/[1]/); @584
// &ConnRule(s/_v$/_1/); @585
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_sdb_idfifo_1"); @586
ct_lsu_idfifo_entry  x_ct_lsu_sdb_idfifo_1 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[1]),
  .idfifo_entry_id_v          (idfifo_entry_id_1         )
);


// &ConnRule(s/_x$/[2]/); @588
// &ConnRule(s/_v$/_2/); @589
// &Instance("ct_lsu_idfifo_entry","x_ct_lsu_sdb_idfifo_2"); @590
ct_lsu_idfifo_entry  x_ct_lsu_sdb_idfifo_2 (
  .cpurst_b                   (cpurst_b                  ),
  .idfifo_clk                 (idfifo_clk                ),
  .idfifo_create_id           (idfifo_create_id          ),
  .idfifo_entry_create_vld_x  (idfifo_entry_create_vld[2]),
  .idfifo_entry_id_v          (idfifo_entry_id_2         )
);


//=======================
// Instance of Gated Cell  
//=======================
assign idfifo_clk_en = snpdt_crt_up; 
// &Instance("gated_clk_cell", "x_lsu_sdb_idfifo_gated_clk"); @596
gated_clk_cell  x_lsu_sdb_idfifo_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (idfifo_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (idfifo_clk_en     ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk  ), @597
//          .external_en   (1'b0            ), @598
//          .global_en     (1'b1            ), @599
//          .module_en     (cp0_lsu_icg_en  ), @600
//          .local_en      (idfifo_clk_en   ), @601
//          .clk_out       (idfifo_clk      )); @602

//fifo create pointer      
always @(posedge snq_ctl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    sdb_fifo_create_ptr[2:0] <= 3'b001;
  else if(snpdt_crt_up)
    sdb_fifo_create_ptr[2:0] <= {sdb_fifo_create_ptr[1:0],sdb_fifo_create_ptr[2]};
end

assign snpdt_crt_up = snpdt_sdb_create_en || vb_bypass_start;

//create signal
// &CombBeg; @616
always @( sdb_entry_avail[2:0])
begin
idfifo_create_id_ori[2:0]  = 3'b0;
casez(sdb_entry_avail[2:0])
  3'b??1:idfifo_create_id_ori[0] = 1'b1;
  3'b?10:idfifo_create_id_ori[1] = 1'b1;
  3'b100:idfifo_create_id_ori[2] = 1'b1;
  default:idfifo_create_id_ori[2:0]  = 3'b0;
endcase
// &CombEnd; @624
end
assign idfifo_create_id[2:0] = vb_bypass_start
                               ? snq_vb_bypass_id[2:0]
                               : idfifo_create_id_ori[2:0];

assign sdb_create_ptr[2:0] = idfifo_create_id_ori[2:0];

assign idfifo_entry_create_vld[2:0] = sdb_fifo_create_ptr[2:0]
                                      & {3{snpdt_crt_up}};

//empty
assign lsu_sdb_not_empty   = |sdb_vld[2:0];
assign cur_sdb_entry_empty = |sdb_entry_avail[2:0];

//sdb data create pointer
//assign cur_entry_all_data_vld =  (&sdb_entry0_data_vld[3:0]) && sdb_data_create_ptr[0]
//                              || (&sdb_entry1_data_vld[3:0]) && sdb_data_create_ptr[1];
//always @(posedge snq_ctl_clk or negedge cpurst_b)
//begin
//  if(~cpurst_b)
//    is_second_data <= 1'b0;
//  else if(ld_da_snq_borrow_sndb)
//    is_second_data <= ~is_second_data;
//  else
//    is_second_data <= is_second_data;
//end
//assign sdb_data_create_ptr_updt = ld_da_snq_borrow_sndb && is_second_data;
//always @(posedge snq_ctl_clk or negedge cpurst_b)
//begin
//  if(~cpurst_b)
//    sdb_data_create_ptr[1:0] <= 2'b01;
//  else if(sdb_data_create_ptr_updt)
//    sdb_data_create_ptr[1:0] <= {sdb_data_create_ptr[0],sdb_data_create_ptr[1]};
//end

//fifo pop pointer
always @(posedge snq_ctl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    sdb_fifo_pop_ptr[2:0] <= 3'b001;
  else if(sdb_entry_inv)
    sdb_fifo_pop_ptr[2:0] <= {sdb_fifo_pop_ptr[1:0],sdb_fifo_pop_ptr[2]};
end

//pop entry sel
assign sdb_pop_ptr[2:0] = {3{sdb_fifo_pop_ptr[0]}}  & idfifo_entry_id_0[2:0]
                          | {3{sdb_fifo_pop_ptr[1]}}  & idfifo_entry_id_1[2:0]
                          | {3{sdb_fifo_pop_ptr[2]}}  & idfifo_entry_id_2[2:0];

//cur sdb pop entry data select(one one valid)
//assign sdb_entry0_data_return_ptr[3:0] = sdb_entry0_data_return_order[3:0] 
//                                       & {4{sdb_pop_ptr[0]}};
//assign sdb_entry1_data_return_ptr[3:0] = sdb_entry1_data_return_order[3:0] 
//                                       & {4{sdb_pop_ptr[1]}};

//assign sdb_data_index_update[1:0] = {2{sdb_data_returned}}
//                                  & sdb_pop_ptr[1:0];
//==========================================================
//               snq to vb interface
//==========================================================
//for wait vb
assign snq_wait_vb_vld = vb_snq_start_hit_idx && snq_dcache_snoop_tag_req_before_arb;
assign vb_snq_start_wait[5:0] = {6{snq_wait_vb_vld}} & snq_dcache_snoop_tag_entry_id[5:0];
//for vb data bypass
assign snq_bypass_addr_tto6[`PA_WIDTH-7:0] = snq_dcache_snoop_tag_addr[`PA_WIDTH-7:0];

assign snq_vb_bypass_check    = snq_dcache_snoop_tag_req_before_arb;
assign snq_vb_data_bypass_hit = vb_snq_bypass_hit && snq_dcache_snoop_tag_req_before_arb;
assign vb_bypass_vld[5:0]     = {6{snq_vb_data_bypass_hit}} & snq_dcache_snoop_tag_entry_id[5:0];

assign vb_bypass_start = |snq_entry_vb_bypass_start[5:0];

assign snq_vb_bypass_id[2:0] = {3{snq_entry_vb_bypass_start[0]}} & snq_entry_bypass_db_id_0[2:0]
                               | {3{snq_entry_vb_bypass_start[1]}} & snq_entry_bypass_db_id_1[2:0]
                               | {3{snq_entry_vb_bypass_start[2]}} & snq_entry_bypass_db_id_2[2:0]
                               | {3{snq_entry_vb_bypass_start[3]}} & snq_entry_bypass_db_id_3[2:0]
                               | {3{snq_entry_vb_bypass_start[4]}} & snq_entry_bypass_db_id_4[2:0]
                               | {3{snq_entry_vb_bypass_start[5]}} & snq_entry_bypass_db_id_5[2:0];

assign snq_vb_bypass_invalid[2:0] = {3{snq_entry_vb_bypass_invalid[0]}} & snq_entry_bypass_db_id_0[2:0]
                                    | {3{snq_entry_vb_bypass_invalid[1]}} & snq_entry_bypass_db_id_1[2:0]
                                    | {3{snq_entry_vb_bypass_invalid[2]}} & snq_entry_bypass_db_id_2[2:0]
                                    | {3{snq_entry_vb_bypass_invalid[3]}} & snq_entry_bypass_db_id_3[2:0]
                                    | {3{snq_entry_vb_bypass_invalid[4]}} & snq_entry_bypass_db_id_4[2:0]
                                    | {3{snq_entry_vb_bypass_invalid[5]}} & snq_entry_bypass_db_id_5[2:0];

assign snq_vb_bypass_readonce   = |(snq_entry_vb_bypass_start[5:0] & snq_entry_vb_bypass_readonce[5:0]);
assign snq_vb_bypass_start[2:0] = snq_vb_bypass_id[2:0];
//for lfb bypass
assign snq_lfb_data_bypass_hit = lfb_snq_bypass_hit && snq_dcache_snoop_tag_req_before_arb;
assign lfb_bypass_vld[5:0]     = {6{snq_lfb_data_bypass_hit}} & snq_dcache_snoop_tag_entry_id[5:0];

assign snq_lfb_bypass_invalid[1:0] = {|snq_entry_lfb_bypass_invalid_data1[5:0],
                                      |snq_entry_lfb_bypass_invalid_data0[5:0]};

assign snq_lfb_bypass_chg_tag[1:0] = {|snq_entry_lfb_bypass_chg_tag_data1[5:0],
                                      |snq_entry_lfb_bypass_chg_tag_data0[5:0]};    
                                     
//==========================================================
//               snq to dcache interface
//==========================================================
// &Instance("ct_lsu_29bit_ecc_encode", "x_ct_dcache_29bit_ecc_encode"); @731
// &Connect(.data_encode    (snq_tag_bf_ecc[28:0] ),   @732
//          .ecc_code       (snq_tag_ecc[5:0]     ),  @733
//          .parity_bit     (snq_tag_parity       )  @734
//         ); @735

// &Force("output","snq_dcache_arb_st_req"); @742
assign snq_dcache_arb_st_req =  snq_dcache_snoop_tag_req_before_arb  //snoop tag
                             || snq_dcache_snpdt_req; //  //change tag state

assign snq_dcache_arb_ld_req =  snq_dcache_snpdt_req;//read data and (or) change state

// &Force("output","snq_dcache_arb_st_dirty_req"); @748
assign snq_dcache_arb_st_dirty_req =  snq_dcache_snoop_tag_req
                                   || (snq_dcache_snpdt_req && snq_dcache_snpdt_chg_tag_req);//snoop tag and(or) change tag state
assign snq_dcache_arb_st_dirty_gateclk_en = snq_dcache_arb_st_dirty_req;

//snoop tag 
// &Force("output","snq_dcache_arb_st_tag_req"); @754
assign snq_dcache_arb_st_tag_req    = snq_dcache_snoop_tag_req;  //snoop tag
assign snq_dcache_arb_st_tag_gateclk_en = snq_dcache_snoop_tag_req;
assign snq_dcache_arb_st_borrow_req = snq_dcache_snoop_tag_req;

assign snq_dcache_req_addr_tto6[`PA_WIDTH-7:0]  = snq_dcache_snpdt_req
                                                  ? snq_dcache_snpdt_addr[`PA_WIDTH-6:1]
                                                  : snq_dcache_snoop_tag_addr[`PA_WIDTH-7:0];
// &Force("output","snq_dcache_arb_st_tag_idx"); @762
assign snq_dcache_arb_st_tag_idx[8:0] = snq_dcache_req_addr_tto6[8:0];

assign snq_dcache_arb_borrow_addr[`PA_WIDTH-1:0] = {snq_dcache_snoop_tag_addr[`PA_WIDTH-7:0],{6'b0}};
assign snq_dcache_arb_st_id[5:0]        = snq_dcache_snoop_tag_entry_id[5:0];

// &Force("output","snq_dcache_arb_ld_tag_req"); @768
assign snq_dcache_arb_ld_tag_req =  snq_dcache_snpdt_req
                                 && snq_dcache_snpdt_chg_tag_req
                                 && !snq_dcache_snpdt_chg_tag[0]; //change to invalid
assign snq_dcache_arb_ld_tag_gateclk_en = snq_dcache_arb_ld_tag_req;
assign snq_dcache_arb_ld_tag_idx[8:0] = snq_dcache_arb_st_tag_idx[8:0];
assign snq_dcache_arb_ld_tag_wen[1:0] = {snq_dcache_snpdt_way,~snq_dcache_snpdt_way};
// change state

assign snq_dcache_arb_st_dirty_idx[8:0] = snq_dcache_arb_st_tag_idx[8:0];

// &Force("output","snq_dcache_arb_st_dirty_gwen"); @779
assign snq_dcache_arb_st_dirty_gwen = snq_dcache_snpdt_req && snq_dcache_snpdt_chg_tag_req;//change state
//assign snq_dcache_arb_ld_dirty_gwen = snq_dcache_snpdt_req && snq_dcache_snpdt_chg_tag_req;//change state

assign snq_dcache_arb_st_dirty_wen[6:0] = {7{snq_dcache_arb_st_dirty_gwen}}
                                        & {1'b1,{3{snq_dcache_snpdt_way}},{3{~snq_dcache_snpdt_way}}};

assign snq_dcache_arb_st_dirty_din[6:0] = {snq_dcache_snpdt_way,
                                           snq_dcache_snpdt_chg_tag[2:0],
                                           snq_dcache_snpdt_chg_tag[2:0]};

//read data
assign snq_dcache_arb_ld_data_req = snq_dcache_snpdt_req && snq_dcache_snpdt_data_req; //read data
assign snq_dcache_arb_ld_data_gateclk_en[7:0] = {8{snq_dcache_arb_ld_data_req}};
assign snq_dcache_arb_ld_borrow_req = snq_dcache_arb_ld_data_req
                                      && !(snpdt_check_ecc && ld_da_vb_snq_data_reissue);
assign snq_dcache_arb_ld_borrow_req_gate = snq_dcache_arb_ld_data_req;
assign snq_dcache_arb_serial_req =  snq_dcache_snpdt_req
                                 && snq_dcache_snpdt_data_req
                                 && snq_dcache_snpdt_first;//read data first pipe

assign snq_dcache_arb_ld_data_idx[10:0] = {snq_dcache_snpdt_addr[9:0], snq_dcache_snpdt_way};

assign snq_dcache_arb_data_way = snq_dcache_snpdt_way;

//empty
assign snq_empty = !(|snq_vld[5:0] || snoop_req_create_en); 
//**************************************
//   to had
//**************************************
assign lsu_snq_not_empty     = |snq_vld[5:0];
///==========================================================
//               dcache to snq interface
//==========================================================
//stall
//lfb stall

//depend check and remove
//snq_create_addr
assign snq_depd_remove[9:0] = {wmb_snq_depd_remove[7:0],vb_snq_depd_remove[1:0]};

//wmb hit snoop queue
assign snq_wmb_write_req_hit_idx  = |snq_entry_wmb_write_req_hit_idx[5:0];
assign snq_wmb_read_req_hit_idx   = |snq_entry_wmb_read_req_hit_idx[5:0];
assign snq_lfb_vb_req_hit_idx     = |snq_entry_lfb_vb_req_hit_idx[5:0];
//read tag resp
assign dcache_snq_tag_resp_valid = st_da_snq_dcache_valid;
assign dcache_snq_tag_resp_share = st_da_snq_dcache_share;
assign dcache_snq_tag_resp_dirty = st_da_snq_dcache_dirty;
assign dcache_snq_tag_resp_way   = st_da_snq_dcache_way;

///=========================================================
//               interface to local monitor
//==========================================================
assign snq_lm_dcache_req_for_inv  = snq_dcache_arb_ld_tag_req
                                    ||  snq_dcache_snoop_tag_req
                                        &&  snq_dcache_snoop_tag_for_inv;
assign snq_lm_dcache_addr_tto6[`PA_WIDTH-7:0] = snq_dcache_req_addr_tto6[`PA_WIDTH-7:0];

//==========================================================
// low power gated clock for snq/sdb
//==========================================================
//snoop queue create and start snpdt fsm
assign snq_ctl_clk_en =  snoop_tag_req_create_en
                      || snoop_tag_req_pop_en
                      || snoop_dt_req_create_en
                      || snoop_dt_req_pop_en
                      || snq_snpdt_start
                      || !snpdt_state_idle
                      || sdb_biu_cd_valid
                      || ld_da_snq_borrow_sndb
                      || vb_bypass_start;

// &Instance("gated_clk_cell","x_snq_sdb_gated_cell"); @856
gated_clk_cell  x_snq_sdb_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snq_ctl_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snq_ctl_clk_en    ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk      ), @857
//           .clk_out          (snq_ctl_clk         ), @858
//           .external_en      (1'b0                ), @859
//           .global_en        (1'b1                ), @860
//           .local_en         (snq_ctl_clk_en      ), @861
//           .module_en        (cp0_lsu_icg_en   ) @862
//         ); @863

//snoop tag req
assign snpt_clk_en =  snoop_tag_req_create_en;
// &Instance("gated_clk_cell","x_snp_tag_gated_cell"); @867
gated_clk_cell  x_snp_tag_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snptclk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snpt_clk_en       ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk  ), @868
//           .clk_out          (snptclk         ), @869
//           .external_en      (1'b0            ), @870
//           .global_en        (1'b1            ), @871
//           .local_en         (snpt_clk_en     ), @872
//           .module_en        (cp0_lsu_icg_en   ) @873
//         ); @874

//snoop data &tag
assign snpdt_clk_en =  snoop_dt_req_create_en;
// &Instance("gated_clk_cell","x_snp_datatag_gated_cell"); @878
gated_clk_cell  x_snp_datatag_gated_cell (
  .clk_in             (lsu_snoop_clk     ),
  .clk_out            (snpdtclk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (snpdt_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in           (lsu_snoop_clk  ), @879
//           .clk_out          (snpdtclk        ), @880
//           .external_en      (1'b0            ), @881
//           .global_en        (1'b1            ), @882
//           .local_en         (snpdt_clk_en    ), @883
//           .module_en        (cp0_lsu_icg_en   ) @884
//         ); @885
//==========================================================
//               snoop data buffer instance
//==========================================================
// //&ConnRule(s/entryx/entry0/); @889
// //&ConnRule(s/_x/[0]/); @890
//&Instance("ct_lsu_snoop_sdb_entry","x_ct_lsu_snoop_sdb_entry_0");
//
// //&ConnRule(s/entryx/entry1/); @893
// //&ConnRule(s/_x/[1]/); @894
//&Instance("ct_lsu_snoop_sdb_entry","x_ct_lsu_snoop_sdb_entry_1");
//==========================================================
//                    snoop queue instance
//==========================================================
// &ConnRule(s/_x$/[0]/); @899
// &ConnRule(s/_v$/_0/); @900
// &ConnRule(s/entryx/entry0/); @901
// &Instance("ct_lsu_snoop_snq_entry","x_ct_lsu_snoop_snq_entry_0"); @902
ct_lsu_snoop_snq_entry  x_ct_lsu_snoop_snq_entry_0 (
  .arb_snq_entry_oldest_index_x          (arb_snq_entry_oldest_index[0]        ),
  .biu_snq_cr_resp_acept_x               (biu_snq_cr_resp_acept[0]             ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cpurst_b                              (cpurst_b                             ),
  .dcache_snq_snoop_tag_grnt             (dcache_snq_snoop_tag_grnt            ),
  .dcache_snq_snpdt_grnt                 (dcache_snq_snpdt_grnt                ),
  .dcache_snq_tag_resp_dirty             (dcache_snq_tag_resp_dirty            ),
  .dcache_snq_tag_resp_share             (dcache_snq_tag_resp_share            ),
  .dcache_snq_tag_resp_valid             (dcache_snq_tag_resp_valid            ),
  .dcache_snq_tag_resp_way               (dcache_snq_tag_resp_way              ),
  .lfb_bypass_vld_x                      (lfb_bypass_vld[0]                    ),
  .lfb_snq_bypass_data_id                (lfb_snq_bypass_data_id               ),
  .lfb_snq_bypass_share                  (lfb_snq_bypass_share                 ),
  .lfb_vb_addr_tto6                      (lfb_vb_addr_tto6                     ),
  .lsu_snoop_clk                         (lsu_snoop_clk                        ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .snpdt_snq_cmplt_x                     (snpdt_snq_cmplt[0]                   ),
  .snpt_snpdt_start_x                    (snpt_snpdt_start[0]                  ),
  .snq_cr_resp_valid_x                   (snq_cr_resp_valid[0]                 ),
  .snq_create_addr                       (snq_create_addr                      ),
  .snq_create_depd                       (snq_create_depd                      ),
  .snq_create_en_x                       (snq_create_en[0]                     ),
  .snq_create_type                       (snq_create_type                      ),
  .snq_depd_remove                       (snq_depd_remove                      ),
  .snq_entry_bypass_db_id_v              (snq_entry_bypass_db_id_0             ),
  .snq_entry_depd_vb_id_v                (snq_entry_depd_vb_id_0               ),
  .snq_entry_lfb_bypass_chg_tag_data0_x  (snq_entry_lfb_bypass_chg_tag_data0[0]),
  .snq_entry_lfb_bypass_chg_tag_data1_x  (snq_entry_lfb_bypass_chg_tag_data1[0]),
  .snq_entry_lfb_bypass_invalid_data0_x  (snq_entry_lfb_bypass_invalid_data0[0]),
  .snq_entry_lfb_bypass_invalid_data1_x  (snq_entry_lfb_bypass_invalid_data1[0]),
  .snq_entry_lfb_vb_req_hit_idx_x        (snq_entry_lfb_vb_req_hit_idx[0]      ),
  .snq_entry_vb_bypass_invalid_x         (snq_entry_vb_bypass_invalid[0]       ),
  .snq_entry_vb_bypass_readonce_x        (snq_entry_vb_bypass_readonce[0]      ),
  .snq_entry_vb_bypass_start_x           (snq_entry_vb_bypass_start[0]         ),
  .snq_entry_wmb_read_req_hit_idx_x      (snq_entry_wmb_read_req_hit_idx[0]    ),
  .snq_entry_wmb_write_req_hit_idx_x     (snq_entry_wmb_write_req_hit_idx[0]   ),
  .snq_entryx_addr                       (snq_entry0_addr                      ),
  .snq_entryx_cr_resp                    (snq_entry0_cr_resp                   ),
  .snq_issued_x                          (snq_issued[0]                        ),
  .snq_need_chg_tag_i_x                  (snq_need_chg_tag_i[0]                ),
  .snq_need_chg_tag_s_x                  (snq_need_chg_tag_s[0]                ),
  .snq_need_chg_tag_x                    (snq_need_chg_tag[0]                  ),
  .snq_need_read_data_x                  (snq_need_read_data[0]                ),
  .snq_rd_tag_rdy_x                      (snq_rd_tag_rdy[0]                    ),
  .snq_resp_create_en_x                  (snq_resp_create_en[0]                ),
  .snq_snoop_tag_req_x                   (snq_snoop_tag_req[0]                 ),
  .snq_snoop_tag_start_x                 (snq_snoop_tag_start[0]               ),
  .snq_tag_req_for_inv_x                 (snq_tag_req_for_inv[0]               ),
  .snq_vld_x                             (snq_vld[0]                           ),
  .snq_way_x                             (snq_way[0]                           ),
  .st_da_snq_ecc_err                     (st_da_snq_ecc_err                    ),
  .vb_bypass_vld_x                       (vb_bypass_vld[0]                     ),
  .vb_snq_bypass_db_id                   (vb_snq_bypass_db_id                  ),
  .vb_snq_start_wait_x                   (vb_snq_start_wait[0]                 ),
  .vb_snq_wait_remove                    (vb_snq_wait_remove                   ),
  .vb_snq_wait_vb_id                     (vb_snq_wait_vb_id                    ),
  .wmb_read_req_addr                     (wmb_read_req_addr                    ),
  .wmb_write_ptr                         (wmb_write_ptr                        ),
  .wmb_write_req_addr                    (wmb_write_req_addr                   )
);


// &ConnRule(s/_x$/[1]/); @904
// &ConnRule(s/_v$/_1/); @905
// &ConnRule(s/entryx/entry1/); @906
// &Instance("ct_lsu_snoop_snq_entry","x_ct_lsu_snoop_snq_entry_1"); @907
ct_lsu_snoop_snq_entry  x_ct_lsu_snoop_snq_entry_1 (
  .arb_snq_entry_oldest_index_x          (arb_snq_entry_oldest_index[1]        ),
  .biu_snq_cr_resp_acept_x               (biu_snq_cr_resp_acept[1]             ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cpurst_b                              (cpurst_b                             ),
  .dcache_snq_snoop_tag_grnt             (dcache_snq_snoop_tag_grnt            ),
  .dcache_snq_snpdt_grnt                 (dcache_snq_snpdt_grnt                ),
  .dcache_snq_tag_resp_dirty             (dcache_snq_tag_resp_dirty            ),
  .dcache_snq_tag_resp_share             (dcache_snq_tag_resp_share            ),
  .dcache_snq_tag_resp_valid             (dcache_snq_tag_resp_valid            ),
  .dcache_snq_tag_resp_way               (dcache_snq_tag_resp_way              ),
  .lfb_bypass_vld_x                      (lfb_bypass_vld[1]                    ),
  .lfb_snq_bypass_data_id                (lfb_snq_bypass_data_id               ),
  .lfb_snq_bypass_share                  (lfb_snq_bypass_share                 ),
  .lfb_vb_addr_tto6                      (lfb_vb_addr_tto6                     ),
  .lsu_snoop_clk                         (lsu_snoop_clk                        ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .snpdt_snq_cmplt_x                     (snpdt_snq_cmplt[1]                   ),
  .snpt_snpdt_start_x                    (snpt_snpdt_start[1]                  ),
  .snq_cr_resp_valid_x                   (snq_cr_resp_valid[1]                 ),
  .snq_create_addr                       (snq_create_addr                      ),
  .snq_create_depd                       (snq_create_depd                      ),
  .snq_create_en_x                       (snq_create_en[1]                     ),
  .snq_create_type                       (snq_create_type                      ),
  .snq_depd_remove                       (snq_depd_remove                      ),
  .snq_entry_bypass_db_id_v              (snq_entry_bypass_db_id_1             ),
  .snq_entry_depd_vb_id_v                (snq_entry_depd_vb_id_1               ),
  .snq_entry_lfb_bypass_chg_tag_data0_x  (snq_entry_lfb_bypass_chg_tag_data0[1]),
  .snq_entry_lfb_bypass_chg_tag_data1_x  (snq_entry_lfb_bypass_chg_tag_data1[1]),
  .snq_entry_lfb_bypass_invalid_data0_x  (snq_entry_lfb_bypass_invalid_data0[1]),
  .snq_entry_lfb_bypass_invalid_data1_x  (snq_entry_lfb_bypass_invalid_data1[1]),
  .snq_entry_lfb_vb_req_hit_idx_x        (snq_entry_lfb_vb_req_hit_idx[1]      ),
  .snq_entry_vb_bypass_invalid_x         (snq_entry_vb_bypass_invalid[1]       ),
  .snq_entry_vb_bypass_readonce_x        (snq_entry_vb_bypass_readonce[1]      ),
  .snq_entry_vb_bypass_start_x           (snq_entry_vb_bypass_start[1]         ),
  .snq_entry_wmb_read_req_hit_idx_x      (snq_entry_wmb_read_req_hit_idx[1]    ),
  .snq_entry_wmb_write_req_hit_idx_x     (snq_entry_wmb_write_req_hit_idx[1]   ),
  .snq_entryx_addr                       (snq_entry1_addr                      ),
  .snq_entryx_cr_resp                    (snq_entry1_cr_resp                   ),
  .snq_issued_x                          (snq_issued[1]                        ),
  .snq_need_chg_tag_i_x                  (snq_need_chg_tag_i[1]                ),
  .snq_need_chg_tag_s_x                  (snq_need_chg_tag_s[1]                ),
  .snq_need_chg_tag_x                    (snq_need_chg_tag[1]                  ),
  .snq_need_read_data_x                  (snq_need_read_data[1]                ),
  .snq_rd_tag_rdy_x                      (snq_rd_tag_rdy[1]                    ),
  .snq_resp_create_en_x                  (snq_resp_create_en[1]                ),
  .snq_snoop_tag_req_x                   (snq_snoop_tag_req[1]                 ),
  .snq_snoop_tag_start_x                 (snq_snoop_tag_start[1]               ),
  .snq_tag_req_for_inv_x                 (snq_tag_req_for_inv[1]               ),
  .snq_vld_x                             (snq_vld[1]                           ),
  .snq_way_x                             (snq_way[1]                           ),
  .st_da_snq_ecc_err                     (st_da_snq_ecc_err                    ),
  .vb_bypass_vld_x                       (vb_bypass_vld[1]                     ),
  .vb_snq_bypass_db_id                   (vb_snq_bypass_db_id                  ),
  .vb_snq_start_wait_x                   (vb_snq_start_wait[1]                 ),
  .vb_snq_wait_remove                    (vb_snq_wait_remove                   ),
  .vb_snq_wait_vb_id                     (vb_snq_wait_vb_id                    ),
  .wmb_read_req_addr                     (wmb_read_req_addr                    ),
  .wmb_write_ptr                         (wmb_write_ptr                        ),
  .wmb_write_req_addr                    (wmb_write_req_addr                   )
);


// &ConnRule(s/_x$/[2]/); @909
// &ConnRule(s/_v$/_2/); @910
// &ConnRule(s/entryx/entry2/); @911
// &Instance("ct_lsu_snoop_snq_entry","x_ct_lsu_snoop_snq_entry_2"); @912
ct_lsu_snoop_snq_entry  x_ct_lsu_snoop_snq_entry_2 (
  .arb_snq_entry_oldest_index_x          (arb_snq_entry_oldest_index[2]        ),
  .biu_snq_cr_resp_acept_x               (biu_snq_cr_resp_acept[2]             ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cpurst_b                              (cpurst_b                             ),
  .dcache_snq_snoop_tag_grnt             (dcache_snq_snoop_tag_grnt            ),
  .dcache_snq_snpdt_grnt                 (dcache_snq_snpdt_grnt                ),
  .dcache_snq_tag_resp_dirty             (dcache_snq_tag_resp_dirty            ),
  .dcache_snq_tag_resp_share             (dcache_snq_tag_resp_share            ),
  .dcache_snq_tag_resp_valid             (dcache_snq_tag_resp_valid            ),
  .dcache_snq_tag_resp_way               (dcache_snq_tag_resp_way              ),
  .lfb_bypass_vld_x                      (lfb_bypass_vld[2]                    ),
  .lfb_snq_bypass_data_id                (lfb_snq_bypass_data_id               ),
  .lfb_snq_bypass_share                  (lfb_snq_bypass_share                 ),
  .lfb_vb_addr_tto6                      (lfb_vb_addr_tto6                     ),
  .lsu_snoop_clk                         (lsu_snoop_clk                        ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .snpdt_snq_cmplt_x                     (snpdt_snq_cmplt[2]                   ),
  .snpt_snpdt_start_x                    (snpt_snpdt_start[2]                  ),
  .snq_cr_resp_valid_x                   (snq_cr_resp_valid[2]                 ),
  .snq_create_addr                       (snq_create_addr                      ),
  .snq_create_depd                       (snq_create_depd                      ),
  .snq_create_en_x                       (snq_create_en[2]                     ),
  .snq_create_type                       (snq_create_type                      ),
  .snq_depd_remove                       (snq_depd_remove                      ),
  .snq_entry_bypass_db_id_v              (snq_entry_bypass_db_id_2             ),
  .snq_entry_depd_vb_id_v                (snq_entry_depd_vb_id_2               ),
  .snq_entry_lfb_bypass_chg_tag_data0_x  (snq_entry_lfb_bypass_chg_tag_data0[2]),
  .snq_entry_lfb_bypass_chg_tag_data1_x  (snq_entry_lfb_bypass_chg_tag_data1[2]),
  .snq_entry_lfb_bypass_invalid_data0_x  (snq_entry_lfb_bypass_invalid_data0[2]),
  .snq_entry_lfb_bypass_invalid_data1_x  (snq_entry_lfb_bypass_invalid_data1[2]),
  .snq_entry_lfb_vb_req_hit_idx_x        (snq_entry_lfb_vb_req_hit_idx[2]      ),
  .snq_entry_vb_bypass_invalid_x         (snq_entry_vb_bypass_invalid[2]       ),
  .snq_entry_vb_bypass_readonce_x        (snq_entry_vb_bypass_readonce[2]      ),
  .snq_entry_vb_bypass_start_x           (snq_entry_vb_bypass_start[2]         ),
  .snq_entry_wmb_read_req_hit_idx_x      (snq_entry_wmb_read_req_hit_idx[2]    ),
  .snq_entry_wmb_write_req_hit_idx_x     (snq_entry_wmb_write_req_hit_idx[2]   ),
  .snq_entryx_addr                       (snq_entry2_addr                      ),
  .snq_entryx_cr_resp                    (snq_entry2_cr_resp                   ),
  .snq_issued_x                          (snq_issued[2]                        ),
  .snq_need_chg_tag_i_x                  (snq_need_chg_tag_i[2]                ),
  .snq_need_chg_tag_s_x                  (snq_need_chg_tag_s[2]                ),
  .snq_need_chg_tag_x                    (snq_need_chg_tag[2]                  ),
  .snq_need_read_data_x                  (snq_need_read_data[2]                ),
  .snq_rd_tag_rdy_x                      (snq_rd_tag_rdy[2]                    ),
  .snq_resp_create_en_x                  (snq_resp_create_en[2]                ),
  .snq_snoop_tag_req_x                   (snq_snoop_tag_req[2]                 ),
  .snq_snoop_tag_start_x                 (snq_snoop_tag_start[2]               ),
  .snq_tag_req_for_inv_x                 (snq_tag_req_for_inv[2]               ),
  .snq_vld_x                             (snq_vld[2]                           ),
  .snq_way_x                             (snq_way[2]                           ),
  .st_da_snq_ecc_err                     (st_da_snq_ecc_err                    ),
  .vb_bypass_vld_x                       (vb_bypass_vld[2]                     ),
  .vb_snq_bypass_db_id                   (vb_snq_bypass_db_id                  ),
  .vb_snq_start_wait_x                   (vb_snq_start_wait[2]                 ),
  .vb_snq_wait_remove                    (vb_snq_wait_remove                   ),
  .vb_snq_wait_vb_id                     (vb_snq_wait_vb_id                    ),
  .wmb_read_req_addr                     (wmb_read_req_addr                    ),
  .wmb_write_ptr                         (wmb_write_ptr                        ),
  .wmb_write_req_addr                    (wmb_write_req_addr                   )
);


// &ConnRule(s/_x$/[3]/); @914
// &ConnRule(s/_v$/_3/); @915
// &ConnRule(s/entryx/entry3/); @916
// &Instance("ct_lsu_snoop_snq_entry","x_ct_lsu_snoop_snq_entry_3"); @917
ct_lsu_snoop_snq_entry  x_ct_lsu_snoop_snq_entry_3 (
  .arb_snq_entry_oldest_index_x          (arb_snq_entry_oldest_index[3]        ),
  .biu_snq_cr_resp_acept_x               (biu_snq_cr_resp_acept[3]             ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cpurst_b                              (cpurst_b                             ),
  .dcache_snq_snoop_tag_grnt             (dcache_snq_snoop_tag_grnt            ),
  .dcache_snq_snpdt_grnt                 (dcache_snq_snpdt_grnt                ),
  .dcache_snq_tag_resp_dirty             (dcache_snq_tag_resp_dirty            ),
  .dcache_snq_tag_resp_share             (dcache_snq_tag_resp_share            ),
  .dcache_snq_tag_resp_valid             (dcache_snq_tag_resp_valid            ),
  .dcache_snq_tag_resp_way               (dcache_snq_tag_resp_way              ),
  .lfb_bypass_vld_x                      (lfb_bypass_vld[3]                    ),
  .lfb_snq_bypass_data_id                (lfb_snq_bypass_data_id               ),
  .lfb_snq_bypass_share                  (lfb_snq_bypass_share                 ),
  .lfb_vb_addr_tto6                      (lfb_vb_addr_tto6                     ),
  .lsu_snoop_clk                         (lsu_snoop_clk                        ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .snpdt_snq_cmplt_x                     (snpdt_snq_cmplt[3]                   ),
  .snpt_snpdt_start_x                    (snpt_snpdt_start[3]                  ),
  .snq_cr_resp_valid_x                   (snq_cr_resp_valid[3]                 ),
  .snq_create_addr                       (snq_create_addr                      ),
  .snq_create_depd                       (snq_create_depd                      ),
  .snq_create_en_x                       (snq_create_en[3]                     ),
  .snq_create_type                       (snq_create_type                      ),
  .snq_depd_remove                       (snq_depd_remove                      ),
  .snq_entry_bypass_db_id_v              (snq_entry_bypass_db_id_3             ),
  .snq_entry_depd_vb_id_v                (snq_entry_depd_vb_id_3               ),
  .snq_entry_lfb_bypass_chg_tag_data0_x  (snq_entry_lfb_bypass_chg_tag_data0[3]),
  .snq_entry_lfb_bypass_chg_tag_data1_x  (snq_entry_lfb_bypass_chg_tag_data1[3]),
  .snq_entry_lfb_bypass_invalid_data0_x  (snq_entry_lfb_bypass_invalid_data0[3]),
  .snq_entry_lfb_bypass_invalid_data1_x  (snq_entry_lfb_bypass_invalid_data1[3]),
  .snq_entry_lfb_vb_req_hit_idx_x        (snq_entry_lfb_vb_req_hit_idx[3]      ),
  .snq_entry_vb_bypass_invalid_x         (snq_entry_vb_bypass_invalid[3]       ),
  .snq_entry_vb_bypass_readonce_x        (snq_entry_vb_bypass_readonce[3]      ),
  .snq_entry_vb_bypass_start_x           (snq_entry_vb_bypass_start[3]         ),
  .snq_entry_wmb_read_req_hit_idx_x      (snq_entry_wmb_read_req_hit_idx[3]    ),
  .snq_entry_wmb_write_req_hit_idx_x     (snq_entry_wmb_write_req_hit_idx[3]   ),
  .snq_entryx_addr                       (snq_entry3_addr                      ),
  .snq_entryx_cr_resp                    (snq_entry3_cr_resp                   ),
  .snq_issued_x                          (snq_issued[3]                        ),
  .snq_need_chg_tag_i_x                  (snq_need_chg_tag_i[3]                ),
  .snq_need_chg_tag_s_x                  (snq_need_chg_tag_s[3]                ),
  .snq_need_chg_tag_x                    (snq_need_chg_tag[3]                  ),
  .snq_need_read_data_x                  (snq_need_read_data[3]                ),
  .snq_rd_tag_rdy_x                      (snq_rd_tag_rdy[3]                    ),
  .snq_resp_create_en_x                  (snq_resp_create_en[3]                ),
  .snq_snoop_tag_req_x                   (snq_snoop_tag_req[3]                 ),
  .snq_snoop_tag_start_x                 (snq_snoop_tag_start[3]               ),
  .snq_tag_req_for_inv_x                 (snq_tag_req_for_inv[3]               ),
  .snq_vld_x                             (snq_vld[3]                           ),
  .snq_way_x                             (snq_way[3]                           ),
  .st_da_snq_ecc_err                     (st_da_snq_ecc_err                    ),
  .vb_bypass_vld_x                       (vb_bypass_vld[3]                     ),
  .vb_snq_bypass_db_id                   (vb_snq_bypass_db_id                  ),
  .vb_snq_start_wait_x                   (vb_snq_start_wait[3]                 ),
  .vb_snq_wait_remove                    (vb_snq_wait_remove                   ),
  .vb_snq_wait_vb_id                     (vb_snq_wait_vb_id                    ),
  .wmb_read_req_addr                     (wmb_read_req_addr                    ),
  .wmb_write_ptr                         (wmb_write_ptr                        ),
  .wmb_write_req_addr                    (wmb_write_req_addr                   )
);


// &ConnRule(s/_x$/[4]/); @919
// &ConnRule(s/_v$/_4/); @920
// &ConnRule(s/entryx/entry4/); @921
// &Instance("ct_lsu_snoop_snq_entry","x_ct_lsu_snoop_snq_entry_4"); @922
ct_lsu_snoop_snq_entry  x_ct_lsu_snoop_snq_entry_4 (
  .arb_snq_entry_oldest_index_x          (arb_snq_entry_oldest_index[4]        ),
  .biu_snq_cr_resp_acept_x               (biu_snq_cr_resp_acept[4]             ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cpurst_b                              (cpurst_b                             ),
  .dcache_snq_snoop_tag_grnt             (dcache_snq_snoop_tag_grnt            ),
  .dcache_snq_snpdt_grnt                 (dcache_snq_snpdt_grnt                ),
  .dcache_snq_tag_resp_dirty             (dcache_snq_tag_resp_dirty            ),
  .dcache_snq_tag_resp_share             (dcache_snq_tag_resp_share            ),
  .dcache_snq_tag_resp_valid             (dcache_snq_tag_resp_valid            ),
  .dcache_snq_tag_resp_way               (dcache_snq_tag_resp_way              ),
  .lfb_bypass_vld_x                      (lfb_bypass_vld[4]                    ),
  .lfb_snq_bypass_data_id                (lfb_snq_bypass_data_id               ),
  .lfb_snq_bypass_share                  (lfb_snq_bypass_share                 ),
  .lfb_vb_addr_tto6                      (lfb_vb_addr_tto6                     ),
  .lsu_snoop_clk                         (lsu_snoop_clk                        ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .snpdt_snq_cmplt_x                     (snpdt_snq_cmplt[4]                   ),
  .snpt_snpdt_start_x                    (snpt_snpdt_start[4]                  ),
  .snq_cr_resp_valid_x                   (snq_cr_resp_valid[4]                 ),
  .snq_create_addr                       (snq_create_addr                      ),
  .snq_create_depd                       (snq_create_depd                      ),
  .snq_create_en_x                       (snq_create_en[4]                     ),
  .snq_create_type                       (snq_create_type                      ),
  .snq_depd_remove                       (snq_depd_remove                      ),
  .snq_entry_bypass_db_id_v              (snq_entry_bypass_db_id_4             ),
  .snq_entry_depd_vb_id_v                (snq_entry_depd_vb_id_4               ),
  .snq_entry_lfb_bypass_chg_tag_data0_x  (snq_entry_lfb_bypass_chg_tag_data0[4]),
  .snq_entry_lfb_bypass_chg_tag_data1_x  (snq_entry_lfb_bypass_chg_tag_data1[4]),
  .snq_entry_lfb_bypass_invalid_data0_x  (snq_entry_lfb_bypass_invalid_data0[4]),
  .snq_entry_lfb_bypass_invalid_data1_x  (snq_entry_lfb_bypass_invalid_data1[4]),
  .snq_entry_lfb_vb_req_hit_idx_x        (snq_entry_lfb_vb_req_hit_idx[4]      ),
  .snq_entry_vb_bypass_invalid_x         (snq_entry_vb_bypass_invalid[4]       ),
  .snq_entry_vb_bypass_readonce_x        (snq_entry_vb_bypass_readonce[4]      ),
  .snq_entry_vb_bypass_start_x           (snq_entry_vb_bypass_start[4]         ),
  .snq_entry_wmb_read_req_hit_idx_x      (snq_entry_wmb_read_req_hit_idx[4]    ),
  .snq_entry_wmb_write_req_hit_idx_x     (snq_entry_wmb_write_req_hit_idx[4]   ),
  .snq_entryx_addr                       (snq_entry4_addr                      ),
  .snq_entryx_cr_resp                    (snq_entry4_cr_resp                   ),
  .snq_issued_x                          (snq_issued[4]                        ),
  .snq_need_chg_tag_i_x                  (snq_need_chg_tag_i[4]                ),
  .snq_need_chg_tag_s_x                  (snq_need_chg_tag_s[4]                ),
  .snq_need_chg_tag_x                    (snq_need_chg_tag[4]                  ),
  .snq_need_read_data_x                  (snq_need_read_data[4]                ),
  .snq_rd_tag_rdy_x                      (snq_rd_tag_rdy[4]                    ),
  .snq_resp_create_en_x                  (snq_resp_create_en[4]                ),
  .snq_snoop_tag_req_x                   (snq_snoop_tag_req[4]                 ),
  .snq_snoop_tag_start_x                 (snq_snoop_tag_start[4]               ),
  .snq_tag_req_for_inv_x                 (snq_tag_req_for_inv[4]               ),
  .snq_vld_x                             (snq_vld[4]                           ),
  .snq_way_x                             (snq_way[4]                           ),
  .st_da_snq_ecc_err                     (st_da_snq_ecc_err                    ),
  .vb_bypass_vld_x                       (vb_bypass_vld[4]                     ),
  .vb_snq_bypass_db_id                   (vb_snq_bypass_db_id                  ),
  .vb_snq_start_wait_x                   (vb_snq_start_wait[4]                 ),
  .vb_snq_wait_remove                    (vb_snq_wait_remove                   ),
  .vb_snq_wait_vb_id                     (vb_snq_wait_vb_id                    ),
  .wmb_read_req_addr                     (wmb_read_req_addr                    ),
  .wmb_write_ptr                         (wmb_write_ptr                        ),
  .wmb_write_req_addr                    (wmb_write_req_addr                   )
);


// &ConnRule(s/_x$/[5]/); @924
// &ConnRule(s/_v$/_5/); @925
// &ConnRule(s/entryx/entry5/); @926
// &Instance("ct_lsu_snoop_snq_entry","x_ct_lsu_snoop_snq_entry_5"); @927
ct_lsu_snoop_snq_entry  x_ct_lsu_snoop_snq_entry_5 (
  .arb_snq_entry_oldest_index_x          (arb_snq_entry_oldest_index[5]        ),
  .biu_snq_cr_resp_acept_x               (biu_snq_cr_resp_acept[5]             ),
  .cp0_lsu_icg_en                        (cp0_lsu_icg_en                       ),
  .cpurst_b                              (cpurst_b                             ),
  .dcache_snq_snoop_tag_grnt             (dcache_snq_snoop_tag_grnt            ),
  .dcache_snq_snpdt_grnt                 (dcache_snq_snpdt_grnt                ),
  .dcache_snq_tag_resp_dirty             (dcache_snq_tag_resp_dirty            ),
  .dcache_snq_tag_resp_share             (dcache_snq_tag_resp_share            ),
  .dcache_snq_tag_resp_valid             (dcache_snq_tag_resp_valid            ),
  .dcache_snq_tag_resp_way               (dcache_snq_tag_resp_way              ),
  .lfb_bypass_vld_x                      (lfb_bypass_vld[5]                    ),
  .lfb_snq_bypass_data_id                (lfb_snq_bypass_data_id               ),
  .lfb_snq_bypass_share                  (lfb_snq_bypass_share                 ),
  .lfb_vb_addr_tto6                      (lfb_vb_addr_tto6                     ),
  .lsu_snoop_clk                         (lsu_snoop_clk                        ),
  .pad_yy_icg_scan_en                    (pad_yy_icg_scan_en                   ),
  .snpdt_snq_cmplt_x                     (snpdt_snq_cmplt[5]                   ),
  .snpt_snpdt_start_x                    (snpt_snpdt_start[5]                  ),
  .snq_cr_resp_valid_x                   (snq_cr_resp_valid[5]                 ),
  .snq_create_addr                       (snq_create_addr                      ),
  .snq_create_depd                       (snq_create_depd                      ),
  .snq_create_en_x                       (snq_create_en[5]                     ),
  .snq_create_type                       (snq_create_type                      ),
  .snq_depd_remove                       (snq_depd_remove                      ),
  .snq_entry_bypass_db_id_v              (snq_entry_bypass_db_id_5             ),
  .snq_entry_depd_vb_id_v                (snq_entry_depd_vb_id_5               ),
  .snq_entry_lfb_bypass_chg_tag_data0_x  (snq_entry_lfb_bypass_chg_tag_data0[5]),
  .snq_entry_lfb_bypass_chg_tag_data1_x  (snq_entry_lfb_bypass_chg_tag_data1[5]),
  .snq_entry_lfb_bypass_invalid_data0_x  (snq_entry_lfb_bypass_invalid_data0[5]),
  .snq_entry_lfb_bypass_invalid_data1_x  (snq_entry_lfb_bypass_invalid_data1[5]),
  .snq_entry_lfb_vb_req_hit_idx_x        (snq_entry_lfb_vb_req_hit_idx[5]      ),
  .snq_entry_vb_bypass_invalid_x         (snq_entry_vb_bypass_invalid[5]       ),
  .snq_entry_vb_bypass_readonce_x        (snq_entry_vb_bypass_readonce[5]      ),
  .snq_entry_vb_bypass_start_x           (snq_entry_vb_bypass_start[5]         ),
  .snq_entry_wmb_read_req_hit_idx_x      (snq_entry_wmb_read_req_hit_idx[5]    ),
  .snq_entry_wmb_write_req_hit_idx_x     (snq_entry_wmb_write_req_hit_idx[5]   ),
  .snq_entryx_addr                       (snq_entry5_addr                      ),
  .snq_entryx_cr_resp                    (snq_entry5_cr_resp                   ),
  .snq_issued_x                          (snq_issued[5]                        ),
  .snq_need_chg_tag_i_x                  (snq_need_chg_tag_i[5]                ),
  .snq_need_chg_tag_s_x                  (snq_need_chg_tag_s[5]                ),
  .snq_need_chg_tag_x                    (snq_need_chg_tag[5]                  ),
  .snq_need_read_data_x                  (snq_need_read_data[5]                ),
  .snq_rd_tag_rdy_x                      (snq_rd_tag_rdy[5]                    ),
  .snq_resp_create_en_x                  (snq_resp_create_en[5]                ),
  .snq_snoop_tag_req_x                   (snq_snoop_tag_req[5]                 ),
  .snq_snoop_tag_start_x                 (snq_snoop_tag_start[5]               ),
  .snq_tag_req_for_inv_x                 (snq_tag_req_for_inv[5]               ),
  .snq_vld_x                             (snq_vld[5]                           ),
  .snq_way_x                             (snq_way[5]                           ),
  .st_da_snq_ecc_err                     (st_da_snq_ecc_err                    ),
  .vb_bypass_vld_x                       (vb_bypass_vld[5]                     ),
  .vb_snq_bypass_db_id                   (vb_snq_bypass_db_id                  ),
  .vb_snq_start_wait_x                   (vb_snq_start_wait[5]                 ),
  .vb_snq_wait_remove                    (vb_snq_wait_remove                   ),
  .vb_snq_wait_vb_id                     (vb_snq_wait_vb_id                    ),
  .wmb_read_req_addr                     (wmb_read_req_addr                    ),
  .wmb_write_ptr                         (wmb_write_ptr                        ),
  .wmb_write_req_addr                    (wmb_write_req_addr                   )
);


assign lsu_had_snq_entry_vld[5:0]     = snq_vld[5:0];
assign lsu_had_snq_entry_issued[5:0]  = snq_issued[5:0];
assign lsu_had_snoop_tag_req          = snq_dcache_snoop_tag_req_before_arb;
assign lsu_had_snoop_data_req         = snq_dcache_snpdt_req;
assign lsu_had_sdb_entry_vld[2:0]     = sdb_vld[2:0];
assign lsu_had_cdr_state[1:0]         = cdr_cur_state[1:0];


// &ModuleEnd; @937
endmodule







