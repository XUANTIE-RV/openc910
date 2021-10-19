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

// &ModuleBeg; @23
module ct_lsu_dcache_arb(
  ag_dcache_arb_ld_data_gateclk_en,
  ag_dcache_arb_ld_data_high_idx,
  ag_dcache_arb_ld_data_low_idx,
  ag_dcache_arb_ld_data_req,
  ag_dcache_arb_ld_tag_gateclk_en,
  ag_dcache_arb_ld_tag_idx,
  ag_dcache_arb_ld_tag_req,
  ag_dcache_arb_st_dirty_gateclk_en,
  ag_dcache_arb_st_dirty_idx,
  ag_dcache_arb_st_dirty_req,
  ag_dcache_arb_st_tag_gateclk_en,
  ag_dcache_arb_st_tag_idx,
  ag_dcache_arb_st_tag_req,
  cp0_lsu_icg_en,
  cpurst_b,
  dcache_arb_ag_ld_sel,
  dcache_arb_ag_st_sel,
  dcache_arb_icc_ld_grnt,
  dcache_arb_ld_ag_addr,
  dcache_arb_ld_ag_borrow_addr_vld,
  dcache_arb_ld_dc_borrow_db,
  dcache_arb_ld_dc_borrow_icc,
  dcache_arb_ld_dc_borrow_mmu,
  dcache_arb_ld_dc_borrow_sndb,
  dcache_arb_ld_dc_borrow_vb,
  dcache_arb_ld_dc_borrow_vld,
  dcache_arb_ld_dc_borrow_vld_gate,
  dcache_arb_ld_dc_settle_way,
  dcache_arb_lfb_ld_grnt,
  dcache_arb_mcic_ld_grnt,
  dcache_arb_snq_ld_grnt,
  dcache_arb_snq_st_grnt,
  dcache_arb_st_ag_addr,
  dcache_arb_st_ag_borrow_addr_vld,
  dcache_arb_st_dc_borrow_icc,
  dcache_arb_st_dc_borrow_snq,
  dcache_arb_st_dc_borrow_snq_id,
  dcache_arb_st_dc_borrow_vld,
  dcache_arb_st_dc_borrow_vld_gate,
  dcache_arb_st_dc_dcache_replace,
  dcache_arb_st_dc_dcache_sw,
  dcache_arb_vb_ld_grnt,
  dcache_arb_vb_st_grnt,
  dcache_arb_wmb_ld_grnt,
  dcache_dirty_din,
  dcache_dirty_gwen,
  dcache_dirty_wen,
  dcache_idx,
  dcache_snq_st_sel,
  dcache_tag_din,
  dcache_tag_gwen,
  dcache_tag_wen,
  dcache_vb_snq_gwen,
  forever_cpuclk,
  icc_dcache_arb_data_way,
  icc_dcache_arb_ld_borrow_req,
  icc_dcache_arb_ld_data_gateclk_en,
  icc_dcache_arb_ld_data_high_idx,
  icc_dcache_arb_ld_data_low_idx,
  icc_dcache_arb_ld_data_req,
  icc_dcache_arb_ld_req,
  icc_dcache_arb_ld_tag_gateclk_en,
  icc_dcache_arb_ld_tag_idx,
  icc_dcache_arb_ld_tag_read,
  icc_dcache_arb_ld_tag_req,
  icc_dcache_arb_st_borrow_req,
  icc_dcache_arb_st_dirty_din,
  icc_dcache_arb_st_dirty_gateclk_en,
  icc_dcache_arb_st_dirty_gwen,
  icc_dcache_arb_st_dirty_idx,
  icc_dcache_arb_st_dirty_req,
  icc_dcache_arb_st_dirty_wen,
  icc_dcache_arb_st_req,
  icc_dcache_arb_st_tag_gateclk_en,
  icc_dcache_arb_st_tag_idx,
  icc_dcache_arb_st_tag_req,
  icc_dcache_arb_way,
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
  lsu_dcache_ld_data_gateclk_en,
  lsu_dcache_ld_data_gwen_b,
  lsu_dcache_ld_data_high_din,
  lsu_dcache_ld_data_high_idx,
  lsu_dcache_ld_data_low_din,
  lsu_dcache_ld_data_low_idx,
  lsu_dcache_ld_data_sel_b,
  lsu_dcache_ld_data_wen_b,
  lsu_dcache_ld_tag_din,
  lsu_dcache_ld_tag_gateclk_en,
  lsu_dcache_ld_tag_gwen_b,
  lsu_dcache_ld_tag_idx,
  lsu_dcache_ld_tag_sel_b,
  lsu_dcache_ld_tag_wen_b,
  lsu_dcache_ld_xx_gwen,
  lsu_dcache_st_dirty_din,
  lsu_dcache_st_dirty_gateclk_en,
  lsu_dcache_st_dirty_gwen_b,
  lsu_dcache_st_dirty_idx,
  lsu_dcache_st_dirty_sel_b,
  lsu_dcache_st_dirty_wen_b,
  lsu_dcache_st_tag_din,
  lsu_dcache_st_tag_gateclk_en,
  lsu_dcache_st_tag_gwen_b,
  lsu_dcache_st_tag_idx,
  lsu_dcache_st_tag_sel_b,
  lsu_dcache_st_tag_wen_b,
  mcic_dcache_arb_ld_data_gateclk_en,
  mcic_dcache_arb_ld_data_high_idx,
  mcic_dcache_arb_ld_data_low_idx,
  mcic_dcache_arb_ld_data_req,
  mcic_dcache_arb_ld_req,
  mcic_dcache_arb_ld_tag_gateclk_en,
  mcic_dcache_arb_ld_tag_idx,
  mcic_dcache_arb_req_addr,
  pad_yy_icg_scan_en,
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
  vb_rcl_sm_data_id,
  wmb_dcache_arb_data_way,
  wmb_dcache_arb_ld_borrow_req,
  wmb_dcache_arb_ld_data_gateclk_en,
  wmb_dcache_arb_ld_data_gwen,
  wmb_dcache_arb_ld_data_high_din,
  wmb_dcache_arb_ld_data_idx,
  wmb_dcache_arb_ld_data_low_din,
  wmb_dcache_arb_ld_data_req,
  wmb_dcache_arb_ld_data_wen,
  wmb_dcache_arb_ld_req,
  wmb_dcache_arb_ld_tag_gateclk_en,
  wmb_dcache_arb_ld_tag_idx,
  wmb_dcache_arb_ld_tag_req,
  wmb_dcache_arb_ld_tag_wen,
  wmb_dcache_arb_st_dirty_din,
  wmb_dcache_arb_st_dirty_gateclk_en,
  wmb_dcache_arb_st_dirty_idx,
  wmb_dcache_arb_st_dirty_req,
  wmb_dcache_arb_st_dirty_wen,
  wmb_dcache_arb_st_req
);

// &Ports; @24
input   [7  :0]  ag_dcache_arb_ld_data_gateclk_en;  
input   [10 :0]  ag_dcache_arb_ld_data_high_idx;    
input   [10 :0]  ag_dcache_arb_ld_data_low_idx;     
input   [7  :0]  ag_dcache_arb_ld_data_req;         
input            ag_dcache_arb_ld_tag_gateclk_en;   
input   [8  :0]  ag_dcache_arb_ld_tag_idx;          
input            ag_dcache_arb_ld_tag_req;          
input            ag_dcache_arb_st_dirty_gateclk_en; 
input   [8  :0]  ag_dcache_arb_st_dirty_idx;        
input            ag_dcache_arb_st_dirty_req;        
input            ag_dcache_arb_st_tag_gateclk_en;   
input   [8  :0]  ag_dcache_arb_st_tag_idx;          
input            ag_dcache_arb_st_tag_req;          
input            cp0_lsu_icg_en;                    
input            cpurst_b;                          
input            forever_cpuclk;                    
input            icc_dcache_arb_data_way;           
input            icc_dcache_arb_ld_borrow_req;      
input   [7  :0]  icc_dcache_arb_ld_data_gateclk_en; 
input   [10 :0]  icc_dcache_arb_ld_data_high_idx;   
input   [10 :0]  icc_dcache_arb_ld_data_low_idx;    
input   [7  :0]  icc_dcache_arb_ld_data_req;        
input            icc_dcache_arb_ld_req;             
input            icc_dcache_arb_ld_tag_gateclk_en;  
input   [8  :0]  icc_dcache_arb_ld_tag_idx;         
input            icc_dcache_arb_ld_tag_read;        
input            icc_dcache_arb_ld_tag_req;         
input            icc_dcache_arb_st_borrow_req;      
input   [6  :0]  icc_dcache_arb_st_dirty_din;       
input            icc_dcache_arb_st_dirty_gateclk_en; 
input            icc_dcache_arb_st_dirty_gwen;      
input   [8  :0]  icc_dcache_arb_st_dirty_idx;       
input            icc_dcache_arb_st_dirty_req;       
input   [6  :0]  icc_dcache_arb_st_dirty_wen;       
input            icc_dcache_arb_st_req;             
input            icc_dcache_arb_st_tag_gateclk_en;  
input   [8  :0]  icc_dcache_arb_st_tag_idx;         
input            icc_dcache_arb_st_tag_req;         
input            icc_dcache_arb_way;                
input   [7  :0]  lfb_dcache_arb_ld_data_gateclk_en; 
input   [127:0]  lfb_dcache_arb_ld_data_high_din;   
input   [10 :0]  lfb_dcache_arb_ld_data_idx;        
input   [127:0]  lfb_dcache_arb_ld_data_low_din;    
input            lfb_dcache_arb_ld_req;             
input   [53 :0]  lfb_dcache_arb_ld_tag_din;         
input            lfb_dcache_arb_ld_tag_gateclk_en;  
input   [8  :0]  lfb_dcache_arb_ld_tag_idx;         
input            lfb_dcache_arb_ld_tag_req;         
input   [1  :0]  lfb_dcache_arb_ld_tag_wen;         
input            lfb_dcache_arb_serial_req;         
input   [6  :0]  lfb_dcache_arb_st_dirty_din;       
input            lfb_dcache_arb_st_dirty_gateclk_en; 
input   [8  :0]  lfb_dcache_arb_st_dirty_idx;       
input            lfb_dcache_arb_st_dirty_req;       
input   [6  :0]  lfb_dcache_arb_st_dirty_wen;       
input            lfb_dcache_arb_st_req;             
input   [51 :0]  lfb_dcache_arb_st_tag_din;         
input            lfb_dcache_arb_st_tag_gateclk_en;  
input   [8  :0]  lfb_dcache_arb_st_tag_idx;         
input            lfb_dcache_arb_st_tag_req;         
input   [1  :0]  lfb_dcache_arb_st_tag_wen;         
input   [7  :0]  mcic_dcache_arb_ld_data_gateclk_en; 
input   [10 :0]  mcic_dcache_arb_ld_data_high_idx;  
input   [10 :0]  mcic_dcache_arb_ld_data_low_idx;   
input   [7  :0]  mcic_dcache_arb_ld_data_req;       
input            mcic_dcache_arb_ld_req;            
input            mcic_dcache_arb_ld_tag_gateclk_en; 
input   [8  :0]  mcic_dcache_arb_ld_tag_idx;        
input   [39 :0]  mcic_dcache_arb_req_addr;          
input            pad_yy_icg_scan_en;                
input   [39 :0]  snq_dcache_arb_borrow_addr;        
input            snq_dcache_arb_data_way;           
input            snq_dcache_arb_ld_borrow_req;      
input            snq_dcache_arb_ld_borrow_req_gate; 
input   [7  :0]  snq_dcache_arb_ld_data_gateclk_en; 
input   [10 :0]  snq_dcache_arb_ld_data_idx;        
input            snq_dcache_arb_ld_req;             
input            snq_dcache_arb_ld_tag_gateclk_en;  
input   [8  :0]  snq_dcache_arb_ld_tag_idx;         
input            snq_dcache_arb_ld_tag_req;         
input   [1  :0]  snq_dcache_arb_ld_tag_wen;         
input            snq_dcache_arb_serial_req;         
input            snq_dcache_arb_st_borrow_req;      
input   [6  :0]  snq_dcache_arb_st_dirty_din;       
input            snq_dcache_arb_st_dirty_gateclk_en; 
input            snq_dcache_arb_st_dirty_gwen;      
input   [8  :0]  snq_dcache_arb_st_dirty_idx;       
input            snq_dcache_arb_st_dirty_req;       
input   [6  :0]  snq_dcache_arb_st_dirty_wen;       
input   [5  :0]  snq_dcache_arb_st_id;              
input            snq_dcache_arb_st_req;             
input            snq_dcache_arb_st_tag_gateclk_en;  
input   [8  :0]  snq_dcache_arb_st_tag_idx;         
input            snq_dcache_arb_st_tag_req;         
input   [2  :0]  snq_dcache_sdb_id;                 
input   [39 :0]  vb_dcache_arb_borrow_addr;         
input            vb_dcache_arb_data_way;            
input            vb_dcache_arb_dcache_replace;      
input            vb_dcache_arb_ld_borrow_req;       
input            vb_dcache_arb_ld_borrow_req_gate;  
input   [7  :0]  vb_dcache_arb_ld_data_gateclk_en;  
input   [10 :0]  vb_dcache_arb_ld_data_idx;         
input            vb_dcache_arb_ld_req;              
input            vb_dcache_arb_ld_tag_gateclk_en;   
input   [8  :0]  vb_dcache_arb_ld_tag_idx;          
input            vb_dcache_arb_ld_tag_req;          
input   [1  :0]  vb_dcache_arb_ld_tag_wen;          
input            vb_dcache_arb_serial_req;          
input            vb_dcache_arb_set_way_mode;        
input            vb_dcache_arb_st_borrow_req;       
input   [6  :0]  vb_dcache_arb_st_dirty_din;        
input            vb_dcache_arb_st_dirty_gateclk_en; 
input            vb_dcache_arb_st_dirty_gwen;       
input   [8  :0]  vb_dcache_arb_st_dirty_idx;        
input            vb_dcache_arb_st_dirty_req;        
input   [6  :0]  vb_dcache_arb_st_dirty_wen;        
input            vb_dcache_arb_st_req;              
input            vb_dcache_arb_st_tag_gateclk_en;   
input   [8  :0]  vb_dcache_arb_st_tag_idx;          
input            vb_dcache_arb_st_tag_req;          
input   [2  :0]  vb_rcl_sm_data_id;                 
input            wmb_dcache_arb_data_way;           
input            wmb_dcache_arb_ld_borrow_req;      
input   [7  :0]  wmb_dcache_arb_ld_data_gateclk_en; 
input   [7  :0]  wmb_dcache_arb_ld_data_gwen;       
input   [127:0]  wmb_dcache_arb_ld_data_high_din;   
input   [10 :0]  wmb_dcache_arb_ld_data_idx;        
input   [127:0]  wmb_dcache_arb_ld_data_low_din;    
input   [7  :0]  wmb_dcache_arb_ld_data_req;        
input   [31 :0]  wmb_dcache_arb_ld_data_wen;        
input            wmb_dcache_arb_ld_req;             
input            wmb_dcache_arb_ld_tag_gateclk_en;  
input   [8  :0]  wmb_dcache_arb_ld_tag_idx;         
input            wmb_dcache_arb_ld_tag_req;         
input   [1  :0]  wmb_dcache_arb_ld_tag_wen;         
input   [6  :0]  wmb_dcache_arb_st_dirty_din;       
input            wmb_dcache_arb_st_dirty_gateclk_en; 
input   [8  :0]  wmb_dcache_arb_st_dirty_idx;       
input            wmb_dcache_arb_st_dirty_req;       
input   [6  :0]  wmb_dcache_arb_st_dirty_wen;       
input            wmb_dcache_arb_st_req;             
output           dcache_arb_ag_ld_sel;              
output           dcache_arb_ag_st_sel;              
output           dcache_arb_icc_ld_grnt;            
output  [39 :0]  dcache_arb_ld_ag_addr;             
output           dcache_arb_ld_ag_borrow_addr_vld;  
output  [2  :0]  dcache_arb_ld_dc_borrow_db;        
output           dcache_arb_ld_dc_borrow_icc;       
output           dcache_arb_ld_dc_borrow_mmu;       
output           dcache_arb_ld_dc_borrow_sndb;      
output           dcache_arb_ld_dc_borrow_vb;        
output           dcache_arb_ld_dc_borrow_vld;       
output           dcache_arb_ld_dc_borrow_vld_gate;  
output           dcache_arb_ld_dc_settle_way;       
output           dcache_arb_lfb_ld_grnt;            
output           dcache_arb_mcic_ld_grnt;           
output           dcache_arb_snq_ld_grnt;            
output           dcache_arb_snq_st_grnt;            
output  [39 :0]  dcache_arb_st_ag_addr;             
output           dcache_arb_st_ag_borrow_addr_vld;  
output           dcache_arb_st_dc_borrow_icc;       
output           dcache_arb_st_dc_borrow_snq;       
output  [5  :0]  dcache_arb_st_dc_borrow_snq_id;    
output           dcache_arb_st_dc_borrow_vld;       
output           dcache_arb_st_dc_borrow_vld_gate;  
output           dcache_arb_st_dc_dcache_replace;   
output           dcache_arb_st_dc_dcache_sw;        
output           dcache_arb_vb_ld_grnt;             
output           dcache_arb_vb_st_grnt;             
output           dcache_arb_wmb_ld_grnt;            
output  [6  :0]  dcache_dirty_din;                  
output           dcache_dirty_gwen;                 
output  [6  :0]  dcache_dirty_wen;                  
output  [8  :0]  dcache_idx;                        
output           dcache_snq_st_sel;                 
output  [51 :0]  dcache_tag_din;                    
output           dcache_tag_gwen;                   
output  [1  :0]  dcache_tag_wen;                    
output           dcache_vb_snq_gwen;                
output  [7  :0]  lsu_dcache_ld_data_gateclk_en;     
output  [7  :0]  lsu_dcache_ld_data_gwen_b;         
output  [127:0]  lsu_dcache_ld_data_high_din;       
output  [10 :0]  lsu_dcache_ld_data_high_idx;       
output  [127:0]  lsu_dcache_ld_data_low_din;        
output  [10 :0]  lsu_dcache_ld_data_low_idx;        
output  [7  :0]  lsu_dcache_ld_data_sel_b;          
output  [31 :0]  lsu_dcache_ld_data_wen_b;          
output  [53 :0]  lsu_dcache_ld_tag_din;             
output           lsu_dcache_ld_tag_gateclk_en;      
output           lsu_dcache_ld_tag_gwen_b;          
output  [8  :0]  lsu_dcache_ld_tag_idx;             
output           lsu_dcache_ld_tag_sel_b;           
output  [1  :0]  lsu_dcache_ld_tag_wen_b;           
output           lsu_dcache_ld_xx_gwen;             
output  [6  :0]  lsu_dcache_st_dirty_din;           
output           lsu_dcache_st_dirty_gateclk_en;    
output           lsu_dcache_st_dirty_gwen_b;        
output  [8  :0]  lsu_dcache_st_dirty_idx;           
output           lsu_dcache_st_dirty_sel_b;         
output  [6  :0]  lsu_dcache_st_dirty_wen_b;         
output  [51 :0]  lsu_dcache_st_tag_din;             
output           lsu_dcache_st_tag_gateclk_en;      
output           lsu_dcache_st_tag_gwen_b;          
output  [8  :0]  lsu_dcache_st_tag_idx;             
output           lsu_dcache_st_tag_sel_b;           
output  [1  :0]  lsu_dcache_st_tag_wen_b;           

// &Regs; @25
reg     [6  :0]  dcache_arb_ld_sel;                 
reg              dcache_arb_serial_lfb;             
reg              dcache_arb_serial_snq;             
reg              dcache_arb_serial_vb;              
reg              dcache_arb_serial_vld;             
reg     [5  :0]  dcache_arb_st_sel;                 
reg     [6  :0]  dcache_dirty_din;                  
reg     [6  :0]  dcache_dirty_wen;                  
reg     [8  :0]  dcache_idx;                        
reg     [10 :0]  lsu_dcache_ld_data_high_idx;       
reg     [10 :0]  lsu_dcache_ld_data_low_idx;        
reg     [8  :0]  lsu_dcache_ld_tag_idx;             
reg     [8  :0]  lsu_dcache_st_dirty_idx;           
reg     [8  :0]  lsu_dcache_st_tag_idx;             

// &Wires; @26
wire    [7  :0]  ag_dcache_arb_ld_data_gateclk_en;  
wire    [10 :0]  ag_dcache_arb_ld_data_high_idx;    
wire    [10 :0]  ag_dcache_arb_ld_data_low_idx;     
wire    [7  :0]  ag_dcache_arb_ld_data_req;         
wire             ag_dcache_arb_ld_tag_gateclk_en;   
wire    [8  :0]  ag_dcache_arb_ld_tag_idx;          
wire             ag_dcache_arb_ld_tag_req;          
wire             ag_dcache_arb_st_dirty_gateclk_en; 
wire    [8  :0]  ag_dcache_arb_st_dirty_idx;        
wire             ag_dcache_arb_st_dirty_req;        
wire             ag_dcache_arb_st_tag_gateclk_en;   
wire    [8  :0]  ag_dcache_arb_st_tag_idx;          
wire             ag_dcache_arb_st_tag_req;          
wire             cp0_lsu_icg_en;                    
wire             cpurst_b;                          
wire             dcache_arb_ag_ld_dp_sel;           
wire             dcache_arb_ag_ld_sel;              
wire             dcache_arb_ag_ld_sel_unmask;       
wire             dcache_arb_ag_st_dp_sel;           
wire             dcache_arb_ag_st_sel;              
wire             dcache_arb_ag_st_sel_unmask;       
wire             dcache_arb_icc_ld_dp_sel;          
wire             dcache_arb_icc_ld_grnt;            
wire             dcache_arb_icc_ld_sel;             
wire             dcache_arb_icc_ld_sel_unmask;      
wire             dcache_arb_icc_st_dp_sel;          
wire             dcache_arb_icc_st_sel;             
wire             dcache_arb_icc_st_sel_unmask;      
wire    [39 :0]  dcache_arb_ld_ag_addr;             
wire             dcache_arb_ld_ag_borrow_addr_vld;  
wire    [7  :0]  dcache_arb_ld_data_req;            
wire    [2  :0]  dcache_arb_ld_dc_borrow_db;        
wire             dcache_arb_ld_dc_borrow_icc;       
wire             dcache_arb_ld_dc_borrow_mmu;       
wire             dcache_arb_ld_dc_borrow_sndb;      
wire             dcache_arb_ld_dc_borrow_vb;        
wire             dcache_arb_ld_dc_borrow_vld;       
wire             dcache_arb_ld_dc_borrow_vld_gate;  
wire             dcache_arb_ld_dc_settle_way;       
wire    [6  :0]  dcache_arb_ld_dp_sel_id;           
wire    [6  :0]  dcache_arb_ld_req;                 
wire             dcache_arb_ld_tag_req;             
wire             dcache_arb_lfb_ld_dp_sel;          
wire             dcache_arb_lfb_ld_grnt;            
wire             dcache_arb_lfb_ld_sel;             
wire             dcache_arb_lfb_ld_sel_unmask;      
wire             dcache_arb_lfb_st_dp_sel;          
wire             dcache_arb_lfb_st_sel;             
wire             dcache_arb_lfb_st_sel_unmask;      
wire             dcache_arb_mcic_ld_dp_sel;         
wire             dcache_arb_mcic_ld_grnt;           
wire             dcache_arb_mcic_ld_sel;            
wire             dcache_arb_mcic_ld_sel_unmask;     
wire             dcache_arb_serial_clk;             
wire             dcache_arb_serial_clk_en;          
wire             dcache_arb_serial_lfb_sel;         
wire             dcache_arb_serial_req;             
wire             dcache_arb_serial_snq_sel;         
wire             dcache_arb_serial_vb_sel;          
wire             dcache_arb_snq_ld_dp_sel;          
wire             dcache_arb_snq_ld_grnt;            
wire             dcache_arb_snq_ld_sel;             
wire             dcache_arb_snq_ld_sel_unmask;      
wire             dcache_arb_snq_st_dp_sel;          
wire             dcache_arb_snq_st_grnt;            
wire             dcache_arb_snq_st_sel;             
wire             dcache_arb_snq_st_sel_unmask;      
wire    [39 :0]  dcache_arb_st_ag_addr;             
wire             dcache_arb_st_ag_borrow_addr_vld;  
wire             dcache_arb_st_dc_borrow_icc;       
wire             dcache_arb_st_dc_borrow_snq;       
wire    [5  :0]  dcache_arb_st_dc_borrow_snq_id;    
wire             dcache_arb_st_dc_borrow_vld;       
wire             dcache_arb_st_dc_borrow_vld_gate;  
wire             dcache_arb_st_dc_dcache_replace;   
wire             dcache_arb_st_dc_dcache_sw;        
wire             dcache_arb_st_dirty_req;           
wire    [5  :0]  dcache_arb_st_dp_sel_id;           
wire    [5  :0]  dcache_arb_st_req;                 
wire             dcache_arb_st_tag_req;             
wire             dcache_arb_vb_ld_dp_sel;           
wire             dcache_arb_vb_ld_grnt;             
wire             dcache_arb_vb_ld_sel;              
wire             dcache_arb_vb_ld_sel_unmask;       
wire             dcache_arb_vb_st_dp_sel;           
wire             dcache_arb_vb_st_grnt;             
wire             dcache_arb_vb_st_sel;              
wire             dcache_arb_vb_st_sel_unmask;       
wire             dcache_arb_wmb_ld_dp_sel;          
wire             dcache_arb_wmb_ld_grnt;            
wire             dcache_arb_wmb_ld_sel;             
wire             dcache_arb_wmb_ld_sel_unmask;      
wire             dcache_arb_wmb_st_dp_sel;          
wire             dcache_arb_wmb_st_sel;             
wire             dcache_arb_wmb_st_sel_unmask;      
wire             dcache_dirty_gwen;                 
wire             dcache_snq_st_sel;                 
wire    [51 :0]  dcache_tag_din;                    
wire             dcache_tag_gwen;                   
wire    [1  :0]  dcache_tag_wen;                    
wire             dcache_vb_snq_gwen;                
wire             forever_cpuclk;                    
wire             icc_dcache_arb_data_way;           
wire             icc_dcache_arb_ld_borrow_req;      
wire    [7  :0]  icc_dcache_arb_ld_data_gateclk_en; 
wire    [10 :0]  icc_dcache_arb_ld_data_high_idx;   
wire    [10 :0]  icc_dcache_arb_ld_data_low_idx;    
wire    [7  :0]  icc_dcache_arb_ld_data_req;        
wire             icc_dcache_arb_ld_req;             
wire             icc_dcache_arb_ld_tag_gateclk_en;  
wire    [8  :0]  icc_dcache_arb_ld_tag_idx;         
wire             icc_dcache_arb_ld_tag_read;        
wire             icc_dcache_arb_ld_tag_req;         
wire             icc_dcache_arb_st_borrow_req;      
wire    [6  :0]  icc_dcache_arb_st_dirty_din;       
wire             icc_dcache_arb_st_dirty_gateclk_en; 
wire             icc_dcache_arb_st_dirty_gwen;      
wire    [8  :0]  icc_dcache_arb_st_dirty_idx;       
wire             icc_dcache_arb_st_dirty_req;       
wire    [6  :0]  icc_dcache_arb_st_dirty_wen;       
wire             icc_dcache_arb_st_req;             
wire             icc_dcache_arb_st_tag_gateclk_en;  
wire    [8  :0]  icc_dcache_arb_st_tag_idx;         
wire             icc_dcache_arb_st_tag_req;         
wire             icc_dcache_arb_way;                
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
wire    [7  :0]  lsu_dcache_ld_data_gateclk_en;     
wire    [7  :0]  lsu_dcache_ld_data_gwen;           
wire    [7  :0]  lsu_dcache_ld_data_gwen_b;         
wire    [127:0]  lsu_dcache_ld_data_high_din;       
wire    [127:0]  lsu_dcache_ld_data_low_din;        
wire    [7  :0]  lsu_dcache_ld_data_sel_b;          
wire    [31 :0]  lsu_dcache_ld_data_wen;            
wire    [31 :0]  lsu_dcache_ld_data_wen_b;          
wire    [53 :0]  lsu_dcache_ld_tag_din;             
wire             lsu_dcache_ld_tag_gateclk_en;      
wire             lsu_dcache_ld_tag_gwen;            
wire             lsu_dcache_ld_tag_gwen_b;          
wire             lsu_dcache_ld_tag_sel_b;           
wire    [1  :0]  lsu_dcache_ld_tag_wen;             
wire    [1  :0]  lsu_dcache_ld_tag_wen_b;           
wire             lsu_dcache_ld_xx_gwen;             
wire    [6  :0]  lsu_dcache_st_dirty_din;           
wire             lsu_dcache_st_dirty_gateclk_en;    
wire             lsu_dcache_st_dirty_gwen;          
wire             lsu_dcache_st_dirty_gwen_b;        
wire             lsu_dcache_st_dirty_sel_b;         
wire    [6  :0]  lsu_dcache_st_dirty_wen;           
wire    [6  :0]  lsu_dcache_st_dirty_wen_b;         
wire    [51 :0]  lsu_dcache_st_tag_din;             
wire             lsu_dcache_st_tag_gateclk_en;      
wire             lsu_dcache_st_tag_gwen;            
wire             lsu_dcache_st_tag_gwen_b;          
wire             lsu_dcache_st_tag_sel_b;           
wire    [1  :0]  lsu_dcache_st_tag_wen;             
wire    [1  :0]  lsu_dcache_st_tag_wen_b;           
wire    [7  :0]  mcic_dcache_arb_ld_data_gateclk_en; 
wire    [10 :0]  mcic_dcache_arb_ld_data_high_idx;  
wire    [10 :0]  mcic_dcache_arb_ld_data_low_idx;   
wire    [7  :0]  mcic_dcache_arb_ld_data_req;       
wire             mcic_dcache_arb_ld_req;            
wire             mcic_dcache_arb_ld_tag_gateclk_en; 
wire    [8  :0]  mcic_dcache_arb_ld_tag_idx;        
wire    [39 :0]  mcic_dcache_arb_req_addr;          
wire             pad_yy_icg_scan_en;                
wire    [39 :0]  snq_dcache_arb_borrow_addr;        
wire             snq_dcache_arb_data_way;           
wire             snq_dcache_arb_ld_borrow_req;      
wire             snq_dcache_arb_ld_borrow_req_gate; 
wire    [7  :0]  snq_dcache_arb_ld_data_gateclk_en; 
wire    [10 :0]  snq_dcache_arb_ld_data_idx;        
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
wire    [2  :0]  snq_dcache_sdb_id;                 
wire    [39 :0]  vb_dcache_arb_borrow_addr;         
wire             vb_dcache_arb_data_way;            
wire             vb_dcache_arb_dcache_replace;      
wire             vb_dcache_arb_ld_borrow_req;       
wire             vb_dcache_arb_ld_borrow_req_gate;  
wire    [7  :0]  vb_dcache_arb_ld_data_gateclk_en;  
wire    [10 :0]  vb_dcache_arb_ld_data_idx;         
wire             vb_dcache_arb_ld_req;              
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
wire             vb_dcache_arb_st_req;              
wire             vb_dcache_arb_st_tag_gateclk_en;   
wire    [8  :0]  vb_dcache_arb_st_tag_idx;          
wire             vb_dcache_arb_st_tag_req;          
wire    [2  :0]  vb_rcl_sm_data_id;                 
wire             wmb_dcache_arb_data_way;           
wire             wmb_dcache_arb_ld_borrow_req;      
wire    [7  :0]  wmb_dcache_arb_ld_data_gateclk_en; 
wire    [7  :0]  wmb_dcache_arb_ld_data_gwen;       
wire    [127:0]  wmb_dcache_arb_ld_data_high_din;   
wire    [10 :0]  wmb_dcache_arb_ld_data_idx;        
wire    [127:0]  wmb_dcache_arb_ld_data_low_din;    
wire    [7  :0]  wmb_dcache_arb_ld_data_req;        
wire    [31 :0]  wmb_dcache_arb_ld_data_wen;        
wire             wmb_dcache_arb_ld_req;             
wire             wmb_dcache_arb_ld_tag_gateclk_en;  
wire    [8  :0]  wmb_dcache_arb_ld_tag_idx;         
wire             wmb_dcache_arb_ld_tag_req;         
wire    [1  :0]  wmb_dcache_arb_ld_tag_wen;         
wire    [6  :0]  wmb_dcache_arb_st_dirty_din;       
wire             wmb_dcache_arb_st_dirty_gateclk_en; 
wire    [8  :0]  wmb_dcache_arb_st_dirty_idx;       
wire             wmb_dcache_arb_st_dirty_req;       
wire    [6  :0]  wmb_dcache_arb_st_dirty_wen;       
wire             wmb_dcache_arb_st_req;             


parameter VB_DATA_ENTRY = 3,
          SNQ_ENTRY     = 6;

//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign dcache_arb_serial_clk_en = dcache_arb_serial_vld
                                  ||  dcache_arb_serial_req;
// &Instance("gated_clk_cell", "x_lsu_dcache_serial_clk_en"); @36
gated_clk_cell  x_lsu_dcache_serial_clk_en (
  .clk_in                   (forever_cpuclk          ),
  .clk_out                  (dcache_arb_serial_clk   ),
  .external_en              (1'b0                    ),
  .global_en                (1'b1                    ),
  .local_en                 (dcache_arb_serial_clk_en),
  .module_en                (cp0_lsu_icg_en          ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      )
);

// &Connect(.clk_in        (forever_cpuclk     ), @37
//          .external_en   (1'b0               ), @38
//          .global_en     (1'b1               ), @39
//          .module_en     (cp0_lsu_icg_en     ), @40
//          .local_en      (dcache_arb_serial_clk_en), @41
//          .clk_out       (dcache_arb_serial_clk)); @42

//==========================================================
//                 Serial request registers
//==========================================================
always @(posedge dcache_arb_serial_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    dcache_arb_serial_vld   <=  1'b0;
    dcache_arb_serial_lfb   <=  1'b0;
    dcache_arb_serial_vb    <=  1'b0;
    dcache_arb_serial_snq   <=  1'b0;
  end
  else if(dcache_arb_serial_req)
  begin
    dcache_arb_serial_vld   <=  1'b1;
    dcache_arb_serial_lfb   <=  dcache_arb_serial_lfb_sel;
    dcache_arb_serial_vb    <=  dcache_arb_serial_vb_sel;
    dcache_arb_serial_snq   <=  dcache_arb_serial_snq_sel;
  end
  else
  begin
    dcache_arb_serial_vld   <=  1'b0;
    dcache_arb_serial_lfb   <=  1'b0;
    dcache_arb_serial_vb    <=  1'b0;
    dcache_arb_serial_snq   <=  1'b0;
  end
end

//==========================================================
//                 Serial wires
//==========================================================
assign dcache_arb_serial_req      = dcache_arb_serial_lfb_sel
                                    ||  dcache_arb_serial_vb_sel
                                    ||  dcache_arb_serial_snq_sel;

assign dcache_arb_serial_lfb_sel  = dcache_arb_lfb_ld_sel &&  lfb_dcache_arb_serial_req;
assign dcache_arb_serial_vb_sel   = dcache_arb_vb_ld_sel &&  vb_dcache_arb_serial_req;
assign dcache_arb_serial_snq_sel  = dcache_arb_snq_ld_sel &&  snq_dcache_arb_serial_req;

//==========================================================
//              Sel/Grnt signal for LD part
//==========================================================
//1. lfb state machine
//2. vb state machine
//3. snq/sndb req
//4. mmu dcache issue controller
//5. wmb
//6. icc
//7. ld ag stage

//------------------unmask signal---------------------------

assign dcache_arb_ld_req[6:0] = {dcache_arb_serial_vld,
                                lfb_dcache_arb_ld_req,
                                vb_dcache_arb_ld_req,
                                snq_dcache_arb_ld_req,
                                icc_dcache_arb_ld_req,
                                wmb_dcache_arb_ld_req,
                                mcic_dcache_arb_ld_req};

//select signal send back to the source
// &CombBeg; @105
always @( dcache_arb_ld_req[6:0])
begin
dcache_arb_ld_sel[6:0] = 7'b0;
casez(dcache_arb_ld_req[6:0])
  7'b01?_????:dcache_arb_ld_sel[6]  = 1'b1;
  7'b001_????:dcache_arb_ld_sel[5]  = 1'b1;
  7'b000_1???:dcache_arb_ld_sel[4]  = 1'b1;
  7'b000_01??:dcache_arb_ld_sel[3]  = 1'b1;
  7'b000_001?:dcache_arb_ld_sel[2]  = 1'b1;
  7'b000_0001:dcache_arb_ld_sel[1]  = 1'b1;
  7'b000_0000:dcache_arb_ld_sel[0]  = 1'b1;
  default:dcache_arb_ld_sel[6:0] = 7'b0;
endcase
// &CombEnd; @117
end

assign dcache_arb_lfb_ld_sel_unmask   = dcache_arb_ld_sel[6];
assign dcache_arb_vb_ld_sel_unmask    = dcache_arb_ld_sel[5];
assign dcache_arb_snq_ld_sel_unmask   = dcache_arb_ld_sel[4];
assign dcache_arb_icc_ld_sel_unmask   = dcache_arb_ld_sel[3];
assign dcache_arb_wmb_ld_sel_unmask   = dcache_arb_ld_sel[2];
assign dcache_arb_mcic_ld_sel_unmask  = dcache_arb_ld_sel[1];
assign dcache_arb_ag_ld_sel_unmask    = dcache_arb_ld_sel[0];

//------------------masked signal---------------------------
//because lfb/vb/snq/icc may request ld and st pipeline once a time,
//to insure that they can get both sel signal simultaneously,
//if they request 2 pipeline and get 1 sel, then it must be clr to 0.
assign dcache_arb_lfb_ld_sel  = dcache_arb_lfb_ld_sel_unmask
                                    &&  (!lfb_dcache_arb_st_req
                                        ||  dcache_arb_lfb_st_sel_unmask)
                                ||  dcache_arb_serial_lfb;
assign dcache_arb_vb_ld_sel   = dcache_arb_vb_ld_sel_unmask
                                    &&  (!vb_dcache_arb_st_req
                                        ||  dcache_arb_vb_st_sel_unmask)
                                ||  dcache_arb_serial_vb;
assign dcache_arb_snq_ld_sel  = dcache_arb_snq_ld_sel_unmask
                                    &&  (!snq_dcache_arb_st_req
                                        ||  dcache_arb_snq_st_sel_unmask)
                                ||  dcache_arb_serial_snq;
assign dcache_arb_wmb_ld_sel  = dcache_arb_wmb_ld_sel_unmask
                                &&  dcache_arb_wmb_st_sel_unmask;
assign dcache_arb_icc_ld_sel  = dcache_arb_icc_ld_sel_unmask
                                &&  dcache_arb_icc_st_sel_unmask;
assign dcache_arb_mcic_ld_sel = dcache_arb_mcic_ld_sel_unmask;
// &Force("output", "dcache_arb_ag_ld_sel"); @148
assign dcache_arb_ag_ld_sel   = dcache_arb_ag_ld_sel_unmask;

//----------shorten signal to select signal-----------------
assign dcache_arb_lfb_ld_dp_sel  = dcache_arb_lfb_ld_sel_unmask  ||  dcache_arb_serial_lfb;
assign dcache_arb_vb_ld_dp_sel   = dcache_arb_vb_ld_sel_unmask   ||  dcache_arb_serial_vb;
assign dcache_arb_snq_ld_dp_sel  = dcache_arb_snq_ld_sel_unmask  ||  dcache_arb_serial_snq;
assign dcache_arb_wmb_ld_dp_sel  = dcache_arb_wmb_ld_sel_unmask;
assign dcache_arb_icc_ld_dp_sel  = dcache_arb_icc_ld_sel_unmask;
assign dcache_arb_mcic_ld_dp_sel = dcache_arb_mcic_ld_sel_unmask;
assign dcache_arb_ag_ld_dp_sel   = dcache_arb_ag_ld_sel_unmask;

assign dcache_arb_ld_dp_sel_id[6:0] = {dcache_arb_lfb_ld_dp_sel,
                                      dcache_arb_vb_ld_dp_sel,
                                      dcache_arb_snq_ld_dp_sel,
                                      dcache_arb_wmb_ld_dp_sel,
                                      dcache_arb_icc_ld_dp_sel,
                                      dcache_arb_mcic_ld_dp_sel,
                                      dcache_arb_ag_ld_dp_sel};

//------------------grnt   signal---------------------------
assign dcache_arb_lfb_ld_grnt = dcache_arb_lfb_ld_sel;
assign dcache_arb_vb_ld_grnt  = dcache_arb_vb_ld_sel;
assign dcache_arb_snq_ld_grnt = dcache_arb_snq_ld_sel;
assign dcache_arb_wmb_ld_grnt = dcache_arb_wmb_ld_sel;
assign dcache_arb_icc_ld_grnt = dcache_arb_icc_ld_sel;
assign dcache_arb_mcic_ld_grnt= dcache_arb_mcic_ld_sel;
//assign dcache_arb_ag_ld_grnt  = dcache_arb_ag_ld_sel  &&  ag_dcache_arb_ld_req;

//==========================================================
//        Borrow signal for LD part to DC stage
//==========================================================
//if vb request data, mmu request data, they will borrow ld dc/da stage
//-----------------------borrow addr------------------------
assign dcache_arb_ld_ag_borrow_addr_vld = dcache_arb_mcic_ld_sel;
assign dcache_arb_ld_ag_addr[`PA_WIDTH-1:0]      = mcic_dcache_arb_req_addr[`PA_WIDTH-1:0];
//---------------------borrow signal------------------------
assign dcache_arb_ld_dc_borrow_vld  = dcache_arb_vb_ld_sel  &&  vb_dcache_arb_ld_borrow_req
                                      ||  dcache_arb_snq_ld_sel  &&  snq_dcache_arb_ld_borrow_req
                                      ||  dcache_arb_icc_ld_sel  &&  icc_dcache_arb_ld_borrow_req
                                      ||  dcache_arb_wmb_ld_sel  &&  wmb_dcache_arb_ld_borrow_req
                                      ||  dcache_arb_mcic_ld_sel;

assign dcache_arb_ld_dc_borrow_vld_gate  = dcache_arb_vb_ld_sel  &&  vb_dcache_arb_ld_borrow_req_gate
                                           ||  dcache_arb_snq_ld_sel  &&  snq_dcache_arb_ld_borrow_req_gate
                                           ||  dcache_arb_icc_ld_sel  &&  icc_dcache_arb_ld_borrow_req
                                           ||  dcache_arb_wmb_ld_sel  &&  wmb_dcache_arb_ld_borrow_req
                                           ||  dcache_arb_mcic_ld_sel;

assign dcache_arb_ld_dc_borrow_db[VB_DATA_ENTRY-1:0]  = dcache_arb_vb_ld_sel
                                                        ? vb_rcl_sm_data_id[VB_DATA_ENTRY-1:0]
                                                        : snq_dcache_sdb_id[VB_DATA_ENTRY-1:0];
assign dcache_arb_ld_dc_borrow_vb   = dcache_arb_vb_ld_sel &&  vb_dcache_arb_ld_borrow_req;
assign dcache_arb_ld_dc_borrow_sndb = dcache_arb_snq_ld_sel  &&  snq_dcache_arb_ld_borrow_req;
assign dcache_arb_ld_dc_borrow_mmu  = dcache_arb_mcic_ld_sel;
assign dcache_arb_ld_dc_borrow_icc  = dcache_arb_icc_ld_sel  &&  icc_dcache_arb_ld_borrow_req;

//borrow way is used
assign dcache_arb_ld_dc_settle_way  = dcache_arb_vb_ld_sel  &&  vb_dcache_arb_data_way
                                      ||  dcache_arb_snq_ld_sel  &&  snq_dcache_arb_data_way
                                      ||  dcache_arb_icc_ld_sel  &&  icc_dcache_arb_data_way
                                      ||  dcache_arb_wmb_ld_sel  &&  wmb_dcache_arb_data_way;

//==========================================================
//        Input select for LD part
//==========================================================
//------------------tag   array-----------------------------
//-----------gateclk--------------------
assign lsu_dcache_ld_tag_gateclk_en = lfb_dcache_arb_ld_tag_gateclk_en
                                      ||  vb_dcache_arb_ld_tag_gateclk_en
                                      ||  snq_dcache_arb_ld_tag_gateclk_en
                                      ||  wmb_dcache_arb_ld_tag_gateclk_en
                                      ||  icc_dcache_arb_ld_tag_gateclk_en
                                      ||  mcic_dcache_arb_ld_tag_gateclk_en
                                      ||  ag_dcache_arb_ld_tag_gateclk_en;

//-----------interface------------------
assign dcache_arb_ld_tag_req  = dcache_arb_lfb_ld_sel  &&  lfb_dcache_arb_ld_tag_req
                                ||  dcache_arb_vb_ld_sel    &&  vb_dcache_arb_ld_tag_req
                                ||  dcache_arb_snq_ld_sel   &&  snq_dcache_arb_ld_tag_req
                                ||  dcache_arb_wmb_ld_sel   &&  wmb_dcache_arb_ld_tag_req
                                ||  dcache_arb_icc_ld_sel   &&  icc_dcache_arb_ld_tag_req
                                ||  dcache_arb_mcic_ld_sel
                                ||  dcache_arb_ag_ld_sel    &&  ag_dcache_arb_ld_tag_req;

assign lsu_dcache_ld_tag_sel_b    = !dcache_arb_ld_tag_req;

// &CombBeg; @247
always @( icc_dcache_arb_ld_tag_idx[8:0]
       or wmb_dcache_arb_ld_tag_idx[8:0]
       or ag_dcache_arb_ld_tag_idx[8:0]
       or snq_dcache_arb_ld_tag_idx[8:0]
       or vb_dcache_arb_ld_tag_idx[8:0]
       or lfb_dcache_arb_ld_tag_idx[8:0]
       or mcic_dcache_arb_ld_tag_idx[8:0]
       or dcache_arb_ld_dp_sel_id[6:0])
begin
case(dcache_arb_ld_dp_sel_id[6:0])
  7'b100_0000:lsu_dcache_ld_tag_idx[8:0]  = lfb_dcache_arb_ld_tag_idx[8:0];
  7'b010_0000:lsu_dcache_ld_tag_idx[8:0]  = vb_dcache_arb_ld_tag_idx[8:0];
  7'b001_0000:lsu_dcache_ld_tag_idx[8:0]  = snq_dcache_arb_ld_tag_idx[8:0];
  7'b000_1000:lsu_dcache_ld_tag_idx[8:0]  = wmb_dcache_arb_ld_tag_idx[8:0];
  7'b000_0100:lsu_dcache_ld_tag_idx[8:0]  = icc_dcache_arb_ld_tag_idx[8:0];
  7'b000_0010:lsu_dcache_ld_tag_idx[8:0]  = mcic_dcache_arb_ld_tag_idx[8:0];
  7'b000_0001:lsu_dcache_ld_tag_idx[8:0]  = ag_dcache_arb_ld_tag_idx[8:0];
  default:lsu_dcache_ld_tag_idx[8:0]  = {9{1'bx}};
endcase
// &CombEnd; @258
end
//assign lsu_dcache_ld_tag_idx[8:0] = {9{dcache_arb_lfb_ld_dp_sel}} & lfb_dcache_arb_ld_tag_idx[8:0]
//                                    | {9{dcache_arb_vb_ld_dp_sel}} & vb_dcache_arb_ld_tag_idx[8:0]
//                                    | {9{dcache_arb_snq_ld_dp_sel}} & snq_dcache_arb_ld_tag_idx[8:0]
//                                    | {9{dcache_arb_wmb_ld_dp_sel}} & wmb_dcache_arb_ld_tag_idx[8:0]
//                                    | {9{dcache_arb_icc_ld_dp_sel}} & icc_dcache_arb_ld_tag_idx[8:0]
//                                    | {9{dcache_arb_mcic_ld_dp_sel}} & mcic_dcache_arb_ld_tag_idx[8:0]
//                                    | {9{dcache_arb_ag_ld_dp_sel}} & ag_dcache_arb_ld_tag_idx[8:0];

//only lfb can write tag array
// &Force("output","lsu_dcache_ld_tag_din"); @268
assign lsu_dcache_ld_tag_din[53:0]  = {54{dcache_arb_lfb_ld_dp_sel}} & lfb_dcache_arb_ld_tag_din[53:0];

assign lsu_dcache_ld_tag_gwen     = dcache_arb_lfb_ld_dp_sel
                                    | dcache_arb_vb_ld_dp_sel
                                    | dcache_arb_snq_ld_dp_sel
                                    | dcache_arb_wmb_ld_dp_sel
                                    | dcache_arb_icc_ld_dp_sel && !icc_dcache_arb_ld_tag_read;
assign lsu_dcache_ld_tag_gwen_b   = !lsu_dcache_ld_tag_gwen;

assign lsu_dcache_ld_tag_wen[1:0] = {2{dcache_arb_lfb_ld_dp_sel}} & lfb_dcache_arb_ld_tag_wen[1:0]
                                    | {2{dcache_arb_vb_ld_dp_sel}}  & vb_dcache_arb_ld_tag_wen[1:0]
                                    | {2{dcache_arb_snq_ld_dp_sel}}  & snq_dcache_arb_ld_tag_wen[1:0]
                                    | {2{dcache_arb_wmb_ld_dp_sel}}  & wmb_dcache_arb_ld_tag_wen[1:0]
                                    | {2{dcache_arb_icc_ld_dp_sel}}  & 2'h3;
assign lsu_dcache_ld_tag_wen_b[1:0] = ~lsu_dcache_ld_tag_wen[1:0];

//------------------for cache buffer-----------------------------
assign lsu_dcache_ld_xx_gwen        = lsu_dcache_ld_tag_gwen;
//assign lsu_dcache_ld_xx_gwen_short  = dcache_arb_lfb_ld_dp_sel
//                                      ||  dcache_arb_vb_ld_dp_sel
//                                      ||  dcache_arb_snq_ld_dp_sel;

//------------------data  array-----------------------------
//-----------gateclk--------------------
assign lsu_dcache_ld_data_gateclk_en[7:0] = lfb_dcache_arb_ld_data_gateclk_en[7:0]
                                            | vb_dcache_arb_ld_data_gateclk_en[7:0]
                                            | snq_dcache_arb_ld_data_gateclk_en[7:0]
                                            | wmb_dcache_arb_ld_data_gateclk_en[7:0]
                                            | mcic_dcache_arb_ld_data_gateclk_en[7:0]
                                            | icc_dcache_arb_ld_data_gateclk_en[7:0]
                                            | ag_dcache_arb_ld_data_gateclk_en[7:0];

//-----------interface------------------
assign dcache_arb_ld_data_req[7:0]  = {8{dcache_arb_lfb_ld_sel}}
                                      | {8{dcache_arb_vb_ld_sel}}
                                      | {8{dcache_arb_snq_ld_sel}}
                                      | {8{dcache_arb_wmb_ld_sel}} & wmb_dcache_arb_ld_data_req[7:0]
                                      | {8{dcache_arb_mcic_ld_sel}} & mcic_dcache_arb_ld_data_req[7:0]
                                      | {8{dcache_arb_ag_ld_sel}} & ag_dcache_arb_ld_data_req[7:0]
                                      | {8{dcache_arb_icc_ld_sel}} & icc_dcache_arb_ld_data_req[7:0];

assign lsu_dcache_ld_data_sel_b[7:0]  = ~dcache_arb_ld_data_req[7:0];

// &CombBeg; @316
always @( snq_dcache_arb_ld_data_idx[10:0]
       or vb_dcache_arb_ld_data_idx[10:0]
       or icc_dcache_arb_ld_data_low_idx[10:0]
       or mcic_dcache_arb_ld_data_low_idx[10:0]
       or lfb_dcache_arb_ld_data_idx[10:0]
       or ag_dcache_arb_ld_data_low_idx[10:0]
       or wmb_dcache_arb_ld_data_idx[10:0]
       or dcache_arb_ld_dp_sel_id[6:0])
begin
case(dcache_arb_ld_dp_sel_id[6:0])
  7'b100_0000:lsu_dcache_ld_data_low_idx[10:0]  = lfb_dcache_arb_ld_data_idx[10:0];
  7'b010_0000:lsu_dcache_ld_data_low_idx[10:0]  = vb_dcache_arb_ld_data_idx[10:0];
  7'b001_0000:lsu_dcache_ld_data_low_idx[10:0]  = snq_dcache_arb_ld_data_idx[10:0];
  7'b000_1000:lsu_dcache_ld_data_low_idx[10:0]  = wmb_dcache_arb_ld_data_idx[10:0];
  7'b000_0100:lsu_dcache_ld_data_low_idx[10:0]  = icc_dcache_arb_ld_data_low_idx[10:0];
  7'b000_0010:lsu_dcache_ld_data_low_idx[10:0]  = mcic_dcache_arb_ld_data_low_idx[10:0];
  7'b000_0001:lsu_dcache_ld_data_low_idx[10:0]  = ag_dcache_arb_ld_data_low_idx[10:0];
  default:lsu_dcache_ld_data_low_idx[10:0]  = {11{1'bx}};
endcase
// &CombEnd; @327
end

//assign lsu_dcache_ld_data_low_idx[10:0]   = {11{dcache_arb_lfb_ld_dp_sel}} & lfb_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_vb_ld_dp_sel}}    & vb_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_snq_ld_dp_sel}}   & snq_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_wmb_ld_dp_sel}}   & wmb_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_mcic_ld_dp_sel}}  & mcic_dcache_arb_ld_data_low_idx[10:0]
//                                            | {11{dcache_arb_ag_ld_dp_sel}} & ag_dcache_arb_ld_data_low_idx[10:0]
//                                            | {11{dcache_arb_icc_ld_dp_sel}} & icc_dcache_arb_ld_data_low_idx[10:0];

// &CombBeg; @337
always @( snq_dcache_arb_ld_data_idx[10:0]
       or vb_dcache_arb_ld_data_idx[10:0]
       or lfb_dcache_arb_ld_data_idx[10:0]
       or mcic_dcache_arb_ld_data_high_idx[10:0]
       or wmb_dcache_arb_ld_data_idx[10:0]
       or ag_dcache_arb_ld_data_high_idx[10:0]
       or dcache_arb_ld_dp_sel_id[6:0]
       or icc_dcache_arb_ld_data_high_idx[10:0])
begin
case(dcache_arb_ld_dp_sel_id[6:0])
  7'b100_0000:lsu_dcache_ld_data_high_idx[10:0]  = lfb_dcache_arb_ld_data_idx[10:0];
  7'b010_0000:lsu_dcache_ld_data_high_idx[10:0]  = vb_dcache_arb_ld_data_idx[10:0];
  7'b001_0000:lsu_dcache_ld_data_high_idx[10:0]  = snq_dcache_arb_ld_data_idx[10:0];
  7'b000_1000:lsu_dcache_ld_data_high_idx[10:0]  = wmb_dcache_arb_ld_data_idx[10:0];
  7'b000_0100:lsu_dcache_ld_data_high_idx[10:0]  = icc_dcache_arb_ld_data_high_idx[10:0];
  7'b000_0010:lsu_dcache_ld_data_high_idx[10:0]  = mcic_dcache_arb_ld_data_high_idx[10:0];
  7'b000_0001:lsu_dcache_ld_data_high_idx[10:0]  = ag_dcache_arb_ld_data_high_idx[10:0];
  default:lsu_dcache_ld_data_high_idx[10:0]  = {11{1'bx}};
endcase
// &CombEnd; @348
end

//assign lsu_dcache_ld_data_high_idx[10:0]  = {11{dcache_arb_lfb_ld_dp_sel}} & lfb_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_vb_ld_dp_sel}}  & vb_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_snq_ld_dp_sel}} & snq_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_wmb_ld_dp_sel}} & wmb_dcache_arb_ld_data_idx[10:0]
//                                            | {11{dcache_arb_mcic_ld_dp_sel}} & mcic_dcache_arb_ld_data_high_idx[10:0]
//                                            | {11{dcache_arb_ag_ld_dp_sel}} & ag_dcache_arb_ld_data_high_idx[10:0]
//                                            | {11{dcache_arb_icc_ld_dp_sel}} & icc_dcache_arb_ld_data_high_idx[10:0];

assign lsu_dcache_ld_data_low_din[127:0]  = dcache_arb_lfb_ld_dp_sel
                                            ? lfb_dcache_arb_ld_data_low_din[127:0]
                                            : wmb_dcache_arb_ld_data_low_din[127:0];

assign lsu_dcache_ld_data_high_din[127:0] = dcache_arb_lfb_ld_dp_sel
                                            ? lfb_dcache_arb_ld_data_high_din[127:0]
                                            : wmb_dcache_arb_ld_data_high_din[127:0];

assign lsu_dcache_ld_data_gwen[7:0]   = {8{dcache_arb_lfb_ld_dp_sel}} & 8'hff
                                        | {8{dcache_arb_wmb_ld_dp_sel}} & wmb_dcache_arb_ld_data_gwen[7:0];
assign lsu_dcache_ld_data_gwen_b[7:0] = ~lsu_dcache_ld_data_gwen[7:0];

assign lsu_dcache_ld_data_wen[31:0]   = {32{dcache_arb_lfb_ld_dp_sel}} & 32'hffff_ffff
                                        | {32{dcache_arb_wmb_ld_dp_sel}} & wmb_dcache_arb_ld_data_wen[31:0];
assign lsu_dcache_ld_data_wen_b[31:0] = ~lsu_dcache_ld_data_wen[31:0];

//==========================================================
//        Sel/Grnt signal for ST part
//==========================================================
//1. lfb state machine
//2. vb state machine
//3. snq
//4. wmb
//5. icc
//6. st ag stage

//------------------unmask signal---------------------------

assign dcache_arb_st_req[5:0] = {dcache_arb_serial_vld,
                                lfb_dcache_arb_st_req,
                                vb_dcache_arb_st_req,
                                snq_dcache_arb_st_req,
                                icc_dcache_arb_st_req,
                                wmb_dcache_arb_st_req};

//sel signal send back to the source
// &CombBeg; @404
always @( dcache_arb_st_req[5:0])
begin
dcache_arb_st_sel[5:0] = 6'b0;
casez(dcache_arb_st_req[5:0])
  6'b01_????:dcache_arb_st_sel[5]  = 1'b1;
  6'b00_1???:dcache_arb_st_sel[4]  = 1'b1;
  6'b00_01??:dcache_arb_st_sel[3]  = 1'b1;
  6'b00_001?:dcache_arb_st_sel[2]  = 1'b1;
  6'b00_0001:dcache_arb_st_sel[1]  = 1'b1;
  6'b00_0000:dcache_arb_st_sel[0]  = 1'b1;
  default:dcache_arb_st_sel[5:0] = 6'b0;
endcase
// &CombEnd; @415
end

assign dcache_arb_lfb_st_sel_unmask   = dcache_arb_st_sel[5];
assign dcache_arb_vb_st_sel_unmask    = dcache_arb_st_sel[4];
assign dcache_arb_snq_st_sel_unmask   = dcache_arb_st_sel[3];
assign dcache_arb_icc_st_sel_unmask   = dcache_arb_st_sel[2];
assign dcache_arb_wmb_st_sel_unmask   = dcache_arb_st_sel[1];
assign dcache_arb_ag_st_sel_unmask    = dcache_arb_st_sel[0];

//------------------masked signal---------------------------
//because lfb/vb/snq/icc may request ld and st pipeline once a time,
//to insure that they can get both sel signal simultaneously,
//if they request 2 pipeline and get 1 sel, then it must be clr to 0.
assign dcache_arb_lfb_st_sel  = dcache_arb_lfb_st_sel_unmask
                                    &&  (!lfb_dcache_arb_ld_req
                                        ||  dcache_arb_lfb_ld_sel_unmask)
                                ||  dcache_arb_serial_lfb;
assign dcache_arb_vb_st_sel   = dcache_arb_vb_st_sel_unmask
                                    &&  (!vb_dcache_arb_ld_req
                                        ||  dcache_arb_vb_ld_sel_unmask)
                                ||  dcache_arb_serial_vb;
assign dcache_arb_snq_st_sel  = dcache_arb_snq_st_sel_unmask
                                    &&  (!snq_dcache_arb_ld_req
                                        ||  dcache_arb_snq_ld_sel_unmask)
                                ||  dcache_arb_serial_snq;
assign dcache_arb_wmb_st_sel  = dcache_arb_wmb_st_sel_unmask
                                &&  dcache_arb_wmb_ld_sel_unmask;
assign dcache_arb_icc_st_sel  = dcache_arb_icc_st_sel_unmask
                                &&  dcache_arb_icc_ld_sel_unmask;
// &Force("output", "dcache_arb_ag_st_sel"); @444
assign dcache_arb_ag_st_sel   = dcache_arb_ag_st_sel_unmask;

//----------shorten signal to select signal-----------------
assign dcache_arb_lfb_st_dp_sel  = dcache_arb_lfb_st_sel_unmask  ||  dcache_arb_serial_lfb;
assign dcache_arb_vb_st_dp_sel   = dcache_arb_vb_st_sel_unmask   ||  dcache_arb_serial_vb;
assign dcache_arb_snq_st_dp_sel  = dcache_arb_snq_st_sel_unmask  ||  dcache_arb_serial_snq;
assign dcache_arb_wmb_st_dp_sel  = dcache_arb_wmb_st_sel_unmask;
assign dcache_arb_icc_st_dp_sel  = dcache_arb_icc_st_sel_unmask;
assign dcache_arb_ag_st_dp_sel   = dcache_arb_ag_st_sel_unmask;

assign dcache_arb_st_dp_sel_id[5:0] = {dcache_arb_lfb_st_dp_sel,
                                      dcache_arb_vb_st_dp_sel,
                                      dcache_arb_snq_st_dp_sel,
                                      dcache_arb_wmb_st_dp_sel,
                                      dcache_arb_icc_st_dp_sel,
                                      dcache_arb_ag_st_dp_sel};
//------------------grnt   signal---------------------------
assign dcache_arb_vb_st_grnt  = dcache_arb_vb_st_sel;
assign dcache_arb_snq_st_grnt = dcache_arb_snq_st_sel;
//assign dcache_arb_ag_st_grnt  = dcache_arb_ag_st_sel  &&  ag_dcache_arb_st_req;

//==========================================================
//        Borrow signal for ST part to DC stage
//==========================================================
//if vb request tag/dirty, mmu request tag/dirty, they will borrow st dc/da stage
//---------------------borrow addr--------------------------
// &Force("output","dcache_arb_st_ag_borrow_addr_vld"); @471
assign dcache_arb_st_ag_borrow_addr_vld = dcache_arb_vb_st_sel  &&  vb_dcache_arb_st_borrow_req
                                          ||  dcache_arb_snq_st_sel  &&  snq_dcache_arb_st_borrow_req;
assign dcache_arb_st_ag_addr[`PA_WIDTH-1:0]  = {`PA_WIDTH{dcache_arb_vb_st_sel}}
                                                & vb_dcache_arb_borrow_addr[`PA_WIDTH-1:0]
                                              | {`PA_WIDTH{dcache_arb_snq_st_sel}}
                                                & snq_dcache_arb_borrow_addr[`PA_WIDTH-1:0];
//---------------------borrow signal------------------------
// &Force("output", "dcache_arb_st_dc_borrow_vld"); @479
assign dcache_arb_st_dc_borrow_vld_gate = dcache_arb_st_ag_borrow_addr_vld
                                          || dcache_arb_icc_st_sel  &&  icc_dcache_arb_st_borrow_req;
assign dcache_arb_st_dc_borrow_vld      = dcache_arb_st_ag_borrow_addr_vld
                                          || dcache_arb_icc_st_sel  &&  icc_dcache_arb_st_borrow_req;
assign dcache_arb_st_dc_borrow_snq    = dcache_arb_snq_st_sel  &&  snq_dcache_arb_st_borrow_req;
assign dcache_arb_st_dc_borrow_snq_id[SNQ_ENTRY-1:0]  = snq_dcache_arb_st_id[SNQ_ENTRY-1:0];
assign dcache_arb_st_dc_borrow_icc    = dcache_arb_icc_st_sel  &&  icc_dcache_arb_st_borrow_req;
//------------------borrow other signal---------------------
assign dcache_arb_st_dc_dcache_replace  = dcache_arb_vb_st_sel  &&  vb_dcache_arb_dcache_replace;
assign dcache_arb_st_dc_dcache_sw       = dcache_arb_vb_st_sel  &&  vb_dcache_arb_set_way_mode
                                          || dcache_arb_icc_st_sel  &&  icc_dcache_arb_way;

//==========================================================
//        Input select for ST part
//==========================================================
//------------------tag   array-----------------------------
//-----------gateclk--------------------
assign lsu_dcache_st_tag_gateclk_en = lfb_dcache_arb_st_tag_gateclk_en
                                      ||  vb_dcache_arb_st_tag_gateclk_en
                                      ||  snq_dcache_arb_st_tag_gateclk_en
                                      ||  icc_dcache_arb_st_tag_gateclk_en
                                      ||  ag_dcache_arb_st_tag_gateclk_en;

//-----------interface------------------
assign dcache_arb_st_tag_req  = dcache_arb_lfb_st_sel  &&  lfb_dcache_arb_st_tag_req
                                ||  dcache_arb_vb_st_sel  &&  vb_dcache_arb_st_tag_req
                                ||  dcache_arb_snq_st_sel &&  snq_dcache_arb_st_tag_req
                                ||  dcache_arb_icc_st_sel &&  icc_dcache_arb_st_tag_req
                                ||  dcache_arb_ag_st_sel  &&  ag_dcache_arb_st_tag_req;

assign lsu_dcache_st_tag_sel_b  = !dcache_arb_st_tag_req;

// &CombBeg; @530
always @( lfb_dcache_arb_st_tag_idx[8:0]
       or dcache_arb_st_dp_sel_id[5:0]
       or icc_dcache_arb_st_tag_idx[8:0]
       or vb_dcache_arb_st_tag_idx[8:0]
       or ag_dcache_arb_st_tag_idx[8:0]
       or snq_dcache_arb_st_tag_idx[8:0])
begin
case(dcache_arb_st_dp_sel_id[5:0])
  6'b10_0000:lsu_dcache_st_tag_idx[8:0]  = lfb_dcache_arb_st_tag_idx[8:0];
  6'b01_0000:lsu_dcache_st_tag_idx[8:0]  = vb_dcache_arb_st_tag_idx[8:0];
  6'b00_1000:lsu_dcache_st_tag_idx[8:0]  = snq_dcache_arb_st_tag_idx[8:0];
  6'b00_0010:lsu_dcache_st_tag_idx[8:0]  = icc_dcache_arb_st_tag_idx[8:0];
  6'b00_0001:lsu_dcache_st_tag_idx[8:0]  = ag_dcache_arb_st_tag_idx[8:0];
  default:lsu_dcache_st_tag_idx[8:0]  = {9{1'bx}};
endcase
// &CombEnd; @542
end

//assign lsu_dcache_st_tag_idx[8:0] = {9{dcache_arb_lfb_st_dp_sel}}  & lfb_dcache_arb_st_tag_idx[8:0]
//                                    | {9{dcache_arb_vb_st_dp_sel}}   & vb_dcache_arb_st_tag_idx[8:0]
//                                    | {9{dcache_arb_snq_st_dp_sel}}  & snq_dcache_arb_st_tag_idx[8:0]
//                                    | {9{dcache_arb_icc_st_dp_sel}}  & icc_dcache_arb_st_tag_idx[8:0]
//                                    | {9{dcache_arb_ag_st_dp_sel}}   & ag_dcache_arb_st_tag_idx[8:0];

//only lfb can write tag array
// &Force("output","lsu_dcache_st_tag_din"); @551
assign lsu_dcache_st_tag_din[51:0] = lfb_dcache_arb_st_tag_din[51:0];
assign lsu_dcache_st_tag_gwen      = dcache_arb_lfb_st_dp_sel;
assign lsu_dcache_st_tag_wen[1:0]  = {2{dcache_arb_lfb_st_dp_sel}} & lfb_dcache_arb_st_tag_wen[1:0];

assign lsu_dcache_st_tag_gwen_b   = !lsu_dcache_st_tag_gwen;

assign lsu_dcache_st_tag_wen_b[1:0] = ~lsu_dcache_st_tag_wen[1:0];

//------------------dirty array-----------------------------
//-----------gateclk--------------------
assign lsu_dcache_st_dirty_gateclk_en = lfb_dcache_arb_st_dirty_gateclk_en
                                        ||  vb_dcache_arb_st_dirty_gateclk_en
                                        ||  snq_dcache_arb_st_dirty_gateclk_en
                                        ||  wmb_dcache_arb_st_dirty_gateclk_en
                                        ||  icc_dcache_arb_st_dirty_gateclk_en
                                        ||  ag_dcache_arb_st_dirty_gateclk_en;

//-----------interface------------------
assign dcache_arb_st_dirty_req  = dcache_arb_lfb_st_sel  &&  lfb_dcache_arb_st_dirty_req
                                  ||  dcache_arb_vb_st_sel  &&  vb_dcache_arb_st_dirty_req
                                  ||  dcache_arb_snq_st_sel &&  snq_dcache_arb_st_dirty_req
                                  ||  dcache_arb_wmb_st_sel &&  wmb_dcache_arb_st_dirty_req
                                  ||  dcache_arb_icc_st_sel &&  icc_dcache_arb_st_dirty_req
                                  ||  dcache_arb_ag_st_sel  &&  ag_dcache_arb_st_dirty_req;

assign lsu_dcache_st_dirty_sel_b  = !dcache_arb_st_dirty_req;

// &CombBeg; @592
always @( ag_dcache_arb_st_dirty_idx[8:0]
       or wmb_dcache_arb_st_dirty_idx[8:0]
       or icc_dcache_arb_st_dirty_idx[8:0]
       or dcache_arb_st_dp_sel_id[5:0]
       or lfb_dcache_arb_st_dirty_idx[8:0]
       or snq_dcache_arb_st_dirty_idx[8:0]
       or vb_dcache_arb_st_dirty_idx[8:0])
begin
case(dcache_arb_st_dp_sel_id[5:0])
  6'b10_0000:lsu_dcache_st_dirty_idx[8:0]  = lfb_dcache_arb_st_dirty_idx[8:0];
  6'b01_0000:lsu_dcache_st_dirty_idx[8:0]  = vb_dcache_arb_st_dirty_idx[8:0];
  6'b00_1000:lsu_dcache_st_dirty_idx[8:0]  = snq_dcache_arb_st_dirty_idx[8:0];
  6'b00_0100:lsu_dcache_st_dirty_idx[8:0]  = wmb_dcache_arb_st_dirty_idx[8:0];
  6'b00_0010:lsu_dcache_st_dirty_idx[8:0]  = icc_dcache_arb_st_dirty_idx[8:0];
  6'b00_0001:lsu_dcache_st_dirty_idx[8:0]  = ag_dcache_arb_st_dirty_idx[8:0];
  default:lsu_dcache_st_dirty_idx[8:0]  = {9{1'bx}};
endcase
// &CombEnd; @602
end

//assign lsu_dcache_st_dirty_idx[8:0] = {9{dcache_arb_lfb_st_dp_sel}}  & lfb_dcache_arb_st_dirty_idx[8:0]
//                                      | {9{dcache_arb_vb_st_dp_sel}} & vb_dcache_arb_st_dirty_idx[8:0]
//                                      | {9{dcache_arb_snq_st_dp_sel}}  & snq_dcache_arb_st_dirty_idx[8:0]
//                                      | {9{dcache_arb_wmb_st_dp_sel}}  & wmb_dcache_arb_st_dirty_idx[8:0]
//                                      | {9{dcache_arb_icc_st_dp_sel}}  & icc_dcache_arb_st_dirty_idx[8:0]
//                                      | {9{dcache_arb_ag_st_dp_sel}}   & ag_dcache_arb_st_dirty_idx[8:0];
assign lsu_dcache_st_dirty_din[6:0] = {7{dcache_arb_lfb_st_dp_sel}}    & lfb_dcache_arb_st_dirty_din[6:0]
                                      | {7{dcache_arb_vb_st_dp_sel}}   & vb_dcache_arb_st_dirty_din[6:0]
                                      | {7{dcache_arb_snq_st_dp_sel}}  & snq_dcache_arb_st_dirty_din[6:0]
                                      | {7{dcache_arb_wmb_st_dp_sel}}  & wmb_dcache_arb_st_dirty_din[6:0]
                                      | {7{dcache_arb_icc_st_dp_sel}}  & icc_dcache_arb_st_dirty_din[6:0];

assign lsu_dcache_st_dirty_gwen     = dcache_arb_lfb_st_dp_sel
                                      ||  dcache_arb_vb_st_dp_sel    &&  vb_dcache_arb_st_dirty_gwen
                                      ||  dcache_arb_snq_st_dp_sel   &&  snq_dcache_arb_st_dirty_gwen
                                      ||  dcache_arb_wmb_st_dp_sel
                                      ||  dcache_arb_icc_st_dp_sel   &&  icc_dcache_arb_st_dirty_gwen;
assign lsu_dcache_st_dirty_gwen_b   = !lsu_dcache_st_dirty_gwen;

assign lsu_dcache_st_dirty_wen[6:0] = {7{dcache_arb_lfb_st_dp_sel}}   & lfb_dcache_arb_st_dirty_wen[6:0]
                                      | {7{dcache_arb_vb_st_dp_sel}}  & vb_dcache_arb_st_dirty_wen[6:0]
                                      | {7{dcache_arb_snq_st_dp_sel}} & snq_dcache_arb_st_dirty_wen[6:0]
                                      | {7{dcache_arb_wmb_st_dp_sel}} & wmb_dcache_arb_st_dirty_wen[6:0]
                                      | {7{dcache_arb_icc_st_dp_sel}} & icc_dcache_arb_st_dirty_wen[6:0];
assign lsu_dcache_st_dirty_wen_b[6:0] = ~lsu_dcache_st_dirty_wen[6:0];
//==========================================================
//        Dcache write port information
//==========================================================
assign dcache_dirty_gwen        = dcache_arb_lfb_st_sel
                                      &&  lfb_dcache_arb_st_dirty_req
                                  ||  dcache_arb_vb_st_sel
                                      &&  vb_dcache_arb_st_dirty_req
                                      &&  vb_dcache_arb_st_dirty_gwen
                                  ||  dcache_arb_snq_st_sel
                                      &&  snq_dcache_arb_st_dirty_req
                                      &&  snq_dcache_arb_st_dirty_gwen
                                  ||  dcache_arb_wmb_st_sel
                                      &&  wmb_dcache_arb_st_dirty_req;

assign dcache_snq_st_sel        = dcache_arb_snq_st_sel;

assign dcache_vb_snq_gwen       = dcache_arb_vb_st_sel
                                      &&  vb_dcache_arb_st_dirty_req
                                      &&  vb_dcache_arb_st_dirty_gwen
                                  ||  dcache_arb_snq_st_sel
                                      &&  snq_dcache_arb_st_dirty_req
                                      &&  snq_dcache_arb_st_dirty_gwen;

assign dcache_tag_gwen          = dcache_arb_lfb_st_sel
                                  &&  lfb_dcache_arb_st_tag_req;

//ATTENTION:there are 9 bits idx in dcache 32K, for dcwp hit, it must compare
//only 8 bits in 32K and 9 bits in 64K
// &CombBeg; @671
always @( snq_dcache_arb_st_dirty_wen[6:0]
       or wmb_dcache_arb_st_dirty_idx[8:0]
       or dcache_arb_vb_st_dp_sel
       or lfb_dcache_arb_st_dirty_din[6:0]
       or lfb_dcache_arb_st_dirty_idx[8:0]
       or wmb_dcache_arb_st_dirty_wen[6:0]
       or vb_dcache_arb_st_dirty_wen[6:0]
       or wmb_dcache_arb_st_dirty_din[6:0]
       or dcache_arb_lfb_st_dp_sel
       or snq_dcache_arb_st_dirty_idx[8:0]
       or lfb_dcache_arb_st_dirty_wen[6:0]
       or snq_dcache_arb_st_dirty_din[6:0]
       or dcache_arb_snq_st_dp_sel
       or vb_dcache_arb_st_dirty_din[6:0]
       or vb_dcache_arb_st_dirty_idx[8:0])
begin
casez({dcache_arb_lfb_st_dp_sel,dcache_arb_vb_st_dp_sel,dcache_arb_snq_st_dp_sel})
  3'b1??:
  begin
    dcache_idx[8:0]       = lfb_dcache_arb_st_dirty_idx[8:0];
    dcache_dirty_din[6:0] = lfb_dcache_arb_st_dirty_din[6:0];
    dcache_dirty_wen[6:0] = lfb_dcache_arb_st_dirty_wen[6:0];
  end
  3'b01?:
  begin
    dcache_idx[8:0]       = vb_dcache_arb_st_dirty_idx[8:0];
    dcache_dirty_din[6:0] = vb_dcache_arb_st_dirty_din[6:0];
    dcache_dirty_wen[6:0] = vb_dcache_arb_st_dirty_wen[6:0];
  end
  3'b001:
  begin
    dcache_idx[8:0]       = snq_dcache_arb_st_dirty_idx[8:0];
    dcache_dirty_din[6:0] = snq_dcache_arb_st_dirty_din[6:0];
    dcache_dirty_wen[6:0] = snq_dcache_arb_st_dirty_wen[6:0];
  end
  default:
  begin
    dcache_idx[8:0]       = wmb_dcache_arb_st_dirty_idx[8:0];
    dcache_dirty_din[6:0] = wmb_dcache_arb_st_dirty_din[6:0];
    dcache_dirty_wen[6:0] = wmb_dcache_arb_st_dirty_wen[6:0];
  end
endcase
// &CombEnd; @714
end
assign dcache_tag_din[51:0]   = lsu_dcache_st_tag_din[51:0];
assign dcache_tag_wen[1:0]    = lsu_dcache_st_tag_wen[1:0];

// &ModuleEnd; @718
endmodule


