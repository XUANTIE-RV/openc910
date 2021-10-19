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
module ct_lsu_bus_arb(
  biu_lsu_ar_ready,
  biu_lsu_aw_vb_grnt,
  biu_lsu_aw_wmb_grnt,
  biu_lsu_w_vb_grnt,
  biu_lsu_w_wmb_grnt,
  bus_arb_pfu_ar_grnt,
  bus_arb_pfu_ar_ready,
  bus_arb_pfu_ar_sel,
  bus_arb_rb_ar_grnt,
  bus_arb_rb_ar_sel,
  bus_arb_vb_aw_grnt,
  bus_arb_vb_w_grnt,
  bus_arb_wmb_ar_grnt,
  bus_arb_wmb_aw_grnt,
  bus_arb_wmb_w_grnt,
  cp0_lsu_icg_en,
  cp0_yy_clk_en,
  cpurst_b,
  forever_cpuclk,
  lsu_biu_ar_addr,
  lsu_biu_ar_bar,
  lsu_biu_ar_burst,
  lsu_biu_ar_cache,
  lsu_biu_ar_domain,
  lsu_biu_ar_dp_req,
  lsu_biu_ar_id,
  lsu_biu_ar_len,
  lsu_biu_ar_lock,
  lsu_biu_ar_prot,
  lsu_biu_ar_req,
  lsu_biu_ar_req_gate,
  lsu_biu_ar_size,
  lsu_biu_ar_snoop,
  lsu_biu_ar_user,
  lsu_biu_aw_req_gate,
  lsu_biu_aw_st_addr,
  lsu_biu_aw_st_bar,
  lsu_biu_aw_st_burst,
  lsu_biu_aw_st_cache,
  lsu_biu_aw_st_domain,
  lsu_biu_aw_st_dp_req,
  lsu_biu_aw_st_id,
  lsu_biu_aw_st_len,
  lsu_biu_aw_st_lock,
  lsu_biu_aw_st_prot,
  lsu_biu_aw_st_req,
  lsu_biu_aw_st_size,
  lsu_biu_aw_st_snoop,
  lsu_biu_aw_st_unique,
  lsu_biu_aw_st_user,
  lsu_biu_aw_vict_addr,
  lsu_biu_aw_vict_bar,
  lsu_biu_aw_vict_burst,
  lsu_biu_aw_vict_cache,
  lsu_biu_aw_vict_domain,
  lsu_biu_aw_vict_dp_req,
  lsu_biu_aw_vict_id,
  lsu_biu_aw_vict_len,
  lsu_biu_aw_vict_lock,
  lsu_biu_aw_vict_prot,
  lsu_biu_aw_vict_req,
  lsu_biu_aw_vict_size,
  lsu_biu_aw_vict_snoop,
  lsu_biu_aw_vict_unique,
  lsu_biu_aw_vict_user,
  lsu_biu_w_st_data,
  lsu_biu_w_st_last,
  lsu_biu_w_st_strb,
  lsu_biu_w_st_vld,
  lsu_biu_w_st_wns,
  lsu_biu_w_vict_data,
  lsu_biu_w_vict_last,
  lsu_biu_w_vict_strb,
  lsu_biu_w_vict_vld,
  lsu_biu_w_vict_wns,
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
  wmb_biu_ar_addr,
  wmb_biu_ar_bar,
  wmb_biu_ar_burst,
  wmb_biu_ar_cache,
  wmb_biu_ar_domain,
  wmb_biu_ar_dp_req,
  wmb_biu_ar_id,
  wmb_biu_ar_len,
  wmb_biu_ar_lock,
  wmb_biu_ar_prot,
  wmb_biu_ar_req,
  wmb_biu_ar_req_gateclk_en,
  wmb_biu_ar_size,
  wmb_biu_ar_snoop,
  wmb_biu_ar_user,
  wmb_biu_aw_addr,
  wmb_biu_aw_bar,
  wmb_biu_aw_burst,
  wmb_biu_aw_cache,
  wmb_biu_aw_domain,
  wmb_biu_aw_dp_req,
  wmb_biu_aw_id,
  wmb_biu_aw_len,
  wmb_biu_aw_lock,
  wmb_biu_aw_prot,
  wmb_biu_aw_req,
  wmb_biu_aw_req_gateclk_en,
  wmb_biu_aw_size,
  wmb_biu_aw_snoop,
  wmb_biu_aw_user,
  wmb_biu_w_data,
  wmb_biu_w_id,
  wmb_biu_w_last,
  wmb_biu_w_req,
  wmb_biu_w_strb,
  wmb_biu_w_vld,
  wmb_biu_w_wns
);

// &Ports; @24
input            biu_lsu_ar_ready;          
input            biu_lsu_aw_vb_grnt;        
input            biu_lsu_aw_wmb_grnt;       
input            biu_lsu_w_vb_grnt;         
input            biu_lsu_w_wmb_grnt;        
input            cp0_lsu_icg_en;            
input            cp0_yy_clk_en;             
input            cpurst_b;                  
input            forever_cpuclk;            
input            pad_yy_icg_scan_en;        
input   [39 :0]  pfu_biu_ar_addr;           
input   [1  :0]  pfu_biu_ar_bar;            
input   [1  :0]  pfu_biu_ar_burst;          
input   [3  :0]  pfu_biu_ar_cache;          
input   [1  :0]  pfu_biu_ar_domain;         
input            pfu_biu_ar_dp_req;         
input   [4  :0]  pfu_biu_ar_id;             
input   [1  :0]  pfu_biu_ar_len;            
input            pfu_biu_ar_lock;           
input   [2  :0]  pfu_biu_ar_prot;           
input            pfu_biu_ar_req;            
input            pfu_biu_ar_req_gateclk_en; 
input   [2  :0]  pfu_biu_ar_size;           
input   [3  :0]  pfu_biu_ar_snoop;          
input   [2  :0]  pfu_biu_ar_user;           
input   [39 :0]  rb_biu_ar_addr;            
input   [1  :0]  rb_biu_ar_bar;             
input   [1  :0]  rb_biu_ar_burst;           
input   [3  :0]  rb_biu_ar_cache;           
input   [1  :0]  rb_biu_ar_domain;          
input            rb_biu_ar_dp_req;          
input   [4  :0]  rb_biu_ar_id;              
input   [1  :0]  rb_biu_ar_len;             
input            rb_biu_ar_lock;            
input   [2  :0]  rb_biu_ar_prot;            
input            rb_biu_ar_req;             
input            rb_biu_ar_req_gateclk_en;  
input   [2  :0]  rb_biu_ar_size;            
input   [3  :0]  rb_biu_ar_snoop;           
input   [2  :0]  rb_biu_ar_user;            
input   [39 :0]  vb_biu_aw_addr;            
input   [1  :0]  vb_biu_aw_bar;             
input   [1  :0]  vb_biu_aw_burst;           
input   [3  :0]  vb_biu_aw_cache;           
input   [1  :0]  vb_biu_aw_domain;          
input            vb_biu_aw_dp_req;          
input   [4  :0]  vb_biu_aw_id;              
input   [1  :0]  vb_biu_aw_len;             
input            vb_biu_aw_lock;            
input   [2  :0]  vb_biu_aw_prot;            
input            vb_biu_aw_req;             
input            vb_biu_aw_req_gateclk_en;  
input   [2  :0]  vb_biu_aw_size;            
input   [2  :0]  vb_biu_aw_snoop;           
input            vb_biu_aw_unique;          
input            vb_biu_aw_user;            
input   [127:0]  vb_biu_w_data;             
input   [4  :0]  vb_biu_w_id;               
input            vb_biu_w_last;             
input            vb_biu_w_req;              
input   [15 :0]  vb_biu_w_strb;             
input            vb_biu_w_vld;              
input   [39 :0]  wmb_biu_ar_addr;           
input   [1  :0]  wmb_biu_ar_bar;            
input   [1  :0]  wmb_biu_ar_burst;          
input   [3  :0]  wmb_biu_ar_cache;          
input   [1  :0]  wmb_biu_ar_domain;         
input            wmb_biu_ar_dp_req;         
input   [4  :0]  wmb_biu_ar_id;             
input   [1  :0]  wmb_biu_ar_len;            
input            wmb_biu_ar_lock;           
input   [2  :0]  wmb_biu_ar_prot;           
input            wmb_biu_ar_req;            
input            wmb_biu_ar_req_gateclk_en; 
input   [2  :0]  wmb_biu_ar_size;           
input   [3  :0]  wmb_biu_ar_snoop;          
input   [2  :0]  wmb_biu_ar_user;           
input   [39 :0]  wmb_biu_aw_addr;           
input   [1  :0]  wmb_biu_aw_bar;            
input   [1  :0]  wmb_biu_aw_burst;          
input   [3  :0]  wmb_biu_aw_cache;          
input   [1  :0]  wmb_biu_aw_domain;         
input            wmb_biu_aw_dp_req;         
input   [4  :0]  wmb_biu_aw_id;             
input   [1  :0]  wmb_biu_aw_len;            
input            wmb_biu_aw_lock;           
input   [2  :0]  wmb_biu_aw_prot;           
input            wmb_biu_aw_req;            
input            wmb_biu_aw_req_gateclk_en; 
input   [2  :0]  wmb_biu_aw_size;           
input   [2  :0]  wmb_biu_aw_snoop;          
input            wmb_biu_aw_user;           
input   [127:0]  wmb_biu_w_data;            
input   [4  :0]  wmb_biu_w_id;              
input            wmb_biu_w_last;            
input            wmb_biu_w_req;             
input   [15 :0]  wmb_biu_w_strb;            
input            wmb_biu_w_vld;             
input            wmb_biu_w_wns;             
output           bus_arb_pfu_ar_grnt;       
output           bus_arb_pfu_ar_ready;      
output           bus_arb_pfu_ar_sel;        
output           bus_arb_rb_ar_grnt;        
output           bus_arb_rb_ar_sel;         
output           bus_arb_vb_aw_grnt;        
output           bus_arb_vb_w_grnt;         
output           bus_arb_wmb_ar_grnt;       
output           bus_arb_wmb_aw_grnt;       
output           bus_arb_wmb_w_grnt;        
output  [39 :0]  lsu_biu_ar_addr;           
output  [1  :0]  lsu_biu_ar_bar;            
output  [1  :0]  lsu_biu_ar_burst;          
output  [3  :0]  lsu_biu_ar_cache;          
output  [1  :0]  lsu_biu_ar_domain;         
output           lsu_biu_ar_dp_req;         
output  [4  :0]  lsu_biu_ar_id;             
output  [1  :0]  lsu_biu_ar_len;            
output           lsu_biu_ar_lock;           
output  [2  :0]  lsu_biu_ar_prot;           
output           lsu_biu_ar_req;            
output           lsu_biu_ar_req_gate;       
output  [2  :0]  lsu_biu_ar_size;           
output  [3  :0]  lsu_biu_ar_snoop;          
output  [2  :0]  lsu_biu_ar_user;           
output           lsu_biu_aw_req_gate;       
output  [39 :0]  lsu_biu_aw_st_addr;        
output  [1  :0]  lsu_biu_aw_st_bar;         
output  [1  :0]  lsu_biu_aw_st_burst;       
output  [3  :0]  lsu_biu_aw_st_cache;       
output  [1  :0]  lsu_biu_aw_st_domain;      
output           lsu_biu_aw_st_dp_req;      
output  [4  :0]  lsu_biu_aw_st_id;          
output  [1  :0]  lsu_biu_aw_st_len;         
output           lsu_biu_aw_st_lock;        
output  [2  :0]  lsu_biu_aw_st_prot;        
output           lsu_biu_aw_st_req;         
output  [2  :0]  lsu_biu_aw_st_size;        
output  [2  :0]  lsu_biu_aw_st_snoop;       
output           lsu_biu_aw_st_unique;      
output           lsu_biu_aw_st_user;        
output  [39 :0]  lsu_biu_aw_vict_addr;      
output  [1  :0]  lsu_biu_aw_vict_bar;       
output  [1  :0]  lsu_biu_aw_vict_burst;     
output  [3  :0]  lsu_biu_aw_vict_cache;     
output  [1  :0]  lsu_biu_aw_vict_domain;    
output           lsu_biu_aw_vict_dp_req;    
output  [4  :0]  lsu_biu_aw_vict_id;        
output  [1  :0]  lsu_biu_aw_vict_len;       
output           lsu_biu_aw_vict_lock;      
output  [2  :0]  lsu_biu_aw_vict_prot;      
output           lsu_biu_aw_vict_req;       
output  [2  :0]  lsu_biu_aw_vict_size;      
output  [2  :0]  lsu_biu_aw_vict_snoop;     
output           lsu_biu_aw_vict_unique;    
output           lsu_biu_aw_vict_user;      
output  [127:0]  lsu_biu_w_st_data;         
output           lsu_biu_w_st_last;         
output  [15 :0]  lsu_biu_w_st_strb;         
output           lsu_biu_w_st_vld;          
output           lsu_biu_w_st_wns;          
output  [127:0]  lsu_biu_w_vict_data;       
output           lsu_biu_w_vict_last;       
output  [15 :0]  lsu_biu_w_vict_strb;       
output           lsu_biu_w_vict_vld;        
output           lsu_biu_w_vict_wns;        

// &Regs; @25
reg              bus_arb_pfu_mask;          
reg              bus_arb_rb_mask;           
reg              bus_arb_wmb_mask;          

// &Wires; @26
wire             biu_lsu_ar_ready;          
wire             biu_lsu_aw_vb_grnt;        
wire             biu_lsu_aw_wmb_grnt;       
wire             biu_lsu_w_vb_grnt;         
wire             biu_lsu_w_wmb_grnt;        
wire             bus_arb_mask_clk;          
wire             bus_arb_mask_clk_en;       
wire             bus_arb_pfu_ar_dp_req_real; 
wire             bus_arb_pfu_ar_grnt;       
wire             bus_arb_pfu_ar_ready;      
wire             bus_arb_pfu_ar_sel;        
wire             bus_arb_rb_ar_dp_req_real; 
wire             bus_arb_rb_ar_grnt;        
wire             bus_arb_rb_ar_sel;         
wire             bus_arb_vb_aw_grnt;        
wire             bus_arb_vb_w_grnt;         
wire             bus_arb_wmb_ar_dp_req_real; 
wire             bus_arb_wmb_ar_grnt;       
wire             bus_arb_wmb_ar_sel;        
wire             bus_arb_wmb_aw_grnt;       
wire             bus_arb_wmb_w_grnt;        
wire             cp0_lsu_icg_en;            
wire             cp0_yy_clk_en;             
wire             cpurst_b;                  
wire             forever_cpuclk;            
wire    [39 :0]  lsu_biu_ar_addr;           
wire    [1  :0]  lsu_biu_ar_bar;            
wire    [1  :0]  lsu_biu_ar_burst;          
wire    [3  :0]  lsu_biu_ar_cache;          
wire    [1  :0]  lsu_biu_ar_domain;         
wire             lsu_biu_ar_dp_req;         
wire    [4  :0]  lsu_biu_ar_id;             
wire    [1  :0]  lsu_biu_ar_len;            
wire             lsu_biu_ar_lock;           
wire    [2  :0]  lsu_biu_ar_prot;           
wire             lsu_biu_ar_req;            
wire             lsu_biu_ar_req_gate;       
wire    [2  :0]  lsu_biu_ar_size;           
wire    [3  :0]  lsu_biu_ar_snoop;          
wire    [2  :0]  lsu_biu_ar_user;           
wire             lsu_biu_aw_req_gate;       
wire    [39 :0]  lsu_biu_aw_st_addr;        
wire    [1  :0]  lsu_biu_aw_st_bar;         
wire    [1  :0]  lsu_biu_aw_st_burst;       
wire    [3  :0]  lsu_biu_aw_st_cache;       
wire    [1  :0]  lsu_biu_aw_st_domain;      
wire             lsu_biu_aw_st_dp_req;      
wire    [4  :0]  lsu_biu_aw_st_id;          
wire    [1  :0]  lsu_biu_aw_st_len;         
wire             lsu_biu_aw_st_lock;        
wire    [2  :0]  lsu_biu_aw_st_prot;        
wire             lsu_biu_aw_st_req;         
wire    [2  :0]  lsu_biu_aw_st_size;        
wire    [2  :0]  lsu_biu_aw_st_snoop;       
wire             lsu_biu_aw_st_unique;      
wire             lsu_biu_aw_st_user;        
wire    [39 :0]  lsu_biu_aw_vict_addr;      
wire    [1  :0]  lsu_biu_aw_vict_bar;       
wire    [1  :0]  lsu_biu_aw_vict_burst;     
wire    [3  :0]  lsu_biu_aw_vict_cache;     
wire    [1  :0]  lsu_biu_aw_vict_domain;    
wire             lsu_biu_aw_vict_dp_req;    
wire    [4  :0]  lsu_biu_aw_vict_id;        
wire    [1  :0]  lsu_biu_aw_vict_len;       
wire             lsu_biu_aw_vict_lock;      
wire    [2  :0]  lsu_biu_aw_vict_prot;      
wire             lsu_biu_aw_vict_req;       
wire    [2  :0]  lsu_biu_aw_vict_size;      
wire    [2  :0]  lsu_biu_aw_vict_snoop;     
wire             lsu_biu_aw_vict_unique;    
wire             lsu_biu_aw_vict_user;      
wire    [127:0]  lsu_biu_w_st_data;         
wire             lsu_biu_w_st_last;         
wire    [15 :0]  lsu_biu_w_st_strb;         
wire             lsu_biu_w_st_vld;          
wire             lsu_biu_w_st_wns;          
wire    [127:0]  lsu_biu_w_vict_data;       
wire             lsu_biu_w_vict_last;       
wire    [15 :0]  lsu_biu_w_vict_strb;       
wire             lsu_biu_w_vict_vld;        
wire             lsu_biu_w_vict_wns;        
wire             pad_yy_icg_scan_en;        
wire    [39 :0]  pfu_biu_ar_addr;           
wire    [1  :0]  pfu_biu_ar_bar;            
wire    [1  :0]  pfu_biu_ar_burst;          
wire    [3  :0]  pfu_biu_ar_cache;          
wire    [1  :0]  pfu_biu_ar_domain;         
wire             pfu_biu_ar_dp_req;         
wire    [4  :0]  pfu_biu_ar_id;             
wire    [1  :0]  pfu_biu_ar_len;            
wire             pfu_biu_ar_lock;           
wire    [2  :0]  pfu_biu_ar_prot;           
wire             pfu_biu_ar_req;            
wire             pfu_biu_ar_req_gateclk_en; 
wire    [2  :0]  pfu_biu_ar_size;           
wire    [3  :0]  pfu_biu_ar_snoop;          
wire    [2  :0]  pfu_biu_ar_user;           
wire    [39 :0]  rb_biu_ar_addr;            
wire    [1  :0]  rb_biu_ar_bar;             
wire    [1  :0]  rb_biu_ar_burst;           
wire    [3  :0]  rb_biu_ar_cache;           
wire    [1  :0]  rb_biu_ar_domain;          
wire             rb_biu_ar_dp_req;          
wire    [4  :0]  rb_biu_ar_id;              
wire    [1  :0]  rb_biu_ar_len;             
wire             rb_biu_ar_lock;            
wire    [2  :0]  rb_biu_ar_prot;            
wire             rb_biu_ar_req;             
wire             rb_biu_ar_req_gateclk_en;  
wire    [2  :0]  rb_biu_ar_size;            
wire    [3  :0]  rb_biu_ar_snoop;           
wire    [2  :0]  rb_biu_ar_user;            
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
wire             vb_biu_aw_req_gateclk_en;  
wire    [2  :0]  vb_biu_aw_size;            
wire    [2  :0]  vb_biu_aw_snoop;           
wire             vb_biu_aw_unique;          
wire             vb_biu_aw_user;            
wire    [127:0]  vb_biu_w_data;             
wire             vb_biu_w_last;             
wire             vb_biu_w_req;              
wire    [15 :0]  vb_biu_w_strb;             
wire             vb_biu_w_vld;              
wire    [39 :0]  wmb_biu_ar_addr;           
wire    [1  :0]  wmb_biu_ar_bar;            
wire    [1  :0]  wmb_biu_ar_burst;          
wire    [3  :0]  wmb_biu_ar_cache;          
wire    [1  :0]  wmb_biu_ar_domain;         
wire             wmb_biu_ar_dp_req;         
wire    [4  :0]  wmb_biu_ar_id;             
wire    [1  :0]  wmb_biu_ar_len;            
wire             wmb_biu_ar_lock;           
wire    [2  :0]  wmb_biu_ar_prot;           
wire             wmb_biu_ar_req;            
wire             wmb_biu_ar_req_gateclk_en; 
wire    [2  :0]  wmb_biu_ar_size;           
wire    [3  :0]  wmb_biu_ar_snoop;          
wire    [2  :0]  wmb_biu_ar_user;           
wire    [39 :0]  wmb_biu_aw_addr;           
wire    [1  :0]  wmb_biu_aw_bar;            
wire    [1  :0]  wmb_biu_aw_burst;          
wire    [3  :0]  wmb_biu_aw_cache;          
wire    [1  :0]  wmb_biu_aw_domain;         
wire             wmb_biu_aw_dp_req;         
wire    [4  :0]  wmb_biu_aw_id;             
wire    [1  :0]  wmb_biu_aw_len;            
wire             wmb_biu_aw_lock;           
wire    [2  :0]  wmb_biu_aw_prot;           
wire             wmb_biu_aw_req;            
wire             wmb_biu_aw_req_gateclk_en; 
wire    [2  :0]  wmb_biu_aw_size;           
wire    [2  :0]  wmb_biu_aw_snoop;          
wire             wmb_biu_aw_user;           
wire    [127:0]  wmb_biu_w_data;            
wire             wmb_biu_w_last;            
wire             wmb_biu_w_req;             
wire    [15 :0]  wmb_biu_w_strb;            
wire             wmb_biu_w_vld;             
wire             wmb_biu_w_wns;             


parameter W_FIFO_ENTRY  = 12;
parameter WU            = 3'b000;
parameter WLU           = 3'b001;
//==========================================================
//                 Instance of Gated Cell  
//==========================================================
assign bus_arb_mask_clk_en  = rb_biu_ar_req_gateclk_en
                              ||  wmb_biu_ar_req_gateclk_en
															||	pfu_biu_ar_req_gateclk_en
                              ||  bus_arb_wmb_mask
                              ||  bus_arb_rb_mask
                              ||  bus_arb_pfu_mask;
// &Instance("gated_clk_cell", "x_lsu_bus_arb_mask_gated_clk"); @40
gated_clk_cell  x_lsu_bus_arb_mask_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (bus_arb_mask_clk   ),
  .external_en         (1'b0               ),
  .global_en           (cp0_yy_clk_en      ),
  .local_en            (bus_arb_mask_clk_en),
  .module_en           (cp0_lsu_icg_en     ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in        (forever_cpuclk     ), @41
//          .external_en   (1'b0               ), @42
//          .global_en     (cp0_yy_clk_en      ), @43
//          .module_en     (cp0_lsu_icg_en     ), @44
//          .local_en      (bus_arb_mask_clk_en), @45
//          .clk_out       (bus_arb_mask_clk   )); @46

//==========================================================
//                    Mask Register
//==========================================================
always @(posedge bus_arb_mask_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bus_arb_wmb_mask    <=  1'b0;
  else if(wmb_biu_ar_dp_req &&  !wmb_biu_ar_req)
    bus_arb_wmb_mask    <=  1'b1;
  else
    bus_arb_wmb_mask    <=  1'b0;
end

always @(posedge bus_arb_mask_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bus_arb_rb_mask    <=  1'b0;
  else if(rb_biu_ar_dp_req &&  !rb_biu_ar_req)
    bus_arb_rb_mask    <=  1'b1;
  else
    bus_arb_rb_mask    <=  1'b0;
end

always @(posedge bus_arb_mask_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bus_arb_pfu_mask    <=  1'b0;
  else if(pfu_biu_ar_dp_req &&  !pfu_biu_ar_req)
    bus_arb_pfu_mask    <=  1'b1;
  else
    bus_arb_pfu_mask    <=  1'b0;
end

//==========================================================
//                      AR channel
//==========================================================
//priority: WMB > RB > pfu
//-----------------generate grnt signal---------------------
assign bus_arb_wmb_ar_dp_req_real = wmb_biu_ar_dp_req
                                    &&  !bus_arb_wmb_mask;
assign bus_arb_rb_ar_dp_req_real  = rb_biu_ar_dp_req
                                    &&  !bus_arb_rb_mask;
assign bus_arb_pfu_ar_dp_req_real = pfu_biu_ar_dp_req
                                    &&  !bus_arb_pfu_mask;

assign bus_arb_wmb_ar_sel   = bus_arb_wmb_ar_dp_req_real;
assign bus_arb_wmb_ar_grnt  = biu_lsu_ar_ready
                              &&  bus_arb_wmb_ar_sel
                              &&  wmb_biu_ar_req;

// &Force("output","bus_arb_rb_ar_sel"); @98
assign bus_arb_rb_ar_sel    = !bus_arb_wmb_ar_dp_req_real
                              &&  bus_arb_rb_ar_dp_req_real;
assign bus_arb_rb_ar_grnt   = biu_lsu_ar_ready
                              &&  bus_arb_rb_ar_sel
                              &&  rb_biu_ar_req;

// &Force("output","bus_arb_pfu_ar_sel"); @105
assign bus_arb_pfu_ar_sel   = !bus_arb_wmb_ar_dp_req_real
                              &&  !bus_arb_rb_ar_dp_req_real
                              &&  bus_arb_pfu_ar_dp_req_real;
assign bus_arb_pfu_ar_grnt  = biu_lsu_ar_ready
                              &&  bus_arb_pfu_ar_sel
                              &&  pfu_biu_ar_req;
assign bus_arb_pfu_ar_ready = biu_lsu_ar_ready
                              &&  bus_arb_pfu_ar_sel;
//-----------------biu ar signal----------------------------
assign lsu_biu_ar_id[4:0]     = {5{bus_arb_wmb_ar_sel}}     & wmb_biu_ar_id[4:0]
                                | {5{bus_arb_rb_ar_sel}}    & rb_biu_ar_id[4:0]
                                | {5{bus_arb_pfu_ar_sel}}   & pfu_biu_ar_id[4:0];

assign lsu_biu_ar_addr[`PA_WIDTH-1:0]  = {`PA_WIDTH{bus_arb_wmb_ar_sel}}    & wmb_biu_ar_addr[`PA_WIDTH-1:0]
                                | {`PA_WIDTH{bus_arb_rb_ar_sel}}   & rb_biu_ar_addr[`PA_WIDTH-1:0]
                                | {`PA_WIDTH{bus_arb_pfu_ar_sel}}  & pfu_biu_ar_addr[`PA_WIDTH-1:0];

assign lsu_biu_ar_len[1:0]    = {2{bus_arb_wmb_ar_sel}}     & wmb_biu_ar_len[1:0]
                                | {2{bus_arb_rb_ar_sel}}    & rb_biu_ar_len[1:0]
                                | {2{bus_arb_pfu_ar_sel}}   & pfu_biu_ar_len[1:0];

assign lsu_biu_ar_size[2:0]   = {3{bus_arb_wmb_ar_sel}}     & wmb_biu_ar_size[2:0]
                                | {3{bus_arb_rb_ar_sel}}    & rb_biu_ar_size[2:0]
                                | {3{bus_arb_pfu_ar_sel}}   & pfu_biu_ar_size[2:0];

assign lsu_biu_ar_burst[1:0]  = {2{bus_arb_wmb_ar_sel}}     & wmb_biu_ar_burst[1:0]
                                | {2{bus_arb_rb_ar_sel}}    & rb_biu_ar_burst[1:0]
                                | {2{bus_arb_pfu_ar_sel}}   & pfu_biu_ar_burst[1:0];

assign lsu_biu_ar_lock        = bus_arb_wmb_ar_sel        &&  wmb_biu_ar_lock
                                ||  bus_arb_rb_ar_sel     &&  rb_biu_ar_lock
                                ||  bus_arb_pfu_ar_sel    &&  pfu_biu_ar_lock;

assign lsu_biu_ar_cache[3:0]  = {4{bus_arb_wmb_ar_sel}}     & wmb_biu_ar_cache[3:0]
                                | {4{bus_arb_rb_ar_sel}}    & rb_biu_ar_cache[3:0]
                                | {4{bus_arb_pfu_ar_sel}}   & pfu_biu_ar_cache[3:0];

assign lsu_biu_ar_prot[2:0]   = {3{bus_arb_wmb_ar_sel}}     & wmb_biu_ar_prot[2:0]
                                | {3{bus_arb_rb_ar_sel}}    & rb_biu_ar_prot[2:0]
                                | {3{bus_arb_pfu_ar_sel}}   & pfu_biu_ar_prot[2:0];

assign lsu_biu_ar_req         = bus_arb_wmb_ar_sel  &&  wmb_biu_ar_req
                                ||  bus_arb_rb_ar_sel &&  rb_biu_ar_req
                                ||  bus_arb_pfu_ar_sel  &&  pfu_biu_ar_req;

assign lsu_biu_ar_dp_req      = bus_arb_wmb_ar_dp_req_real
                                ||  bus_arb_rb_ar_dp_req_real
                                ||  bus_arb_pfu_ar_dp_req_real;

assign lsu_biu_ar_req_gate    = wmb_biu_ar_req_gateclk_en
                                ||  rb_biu_ar_req_gateclk_en
                                ||  pfu_biu_ar_req_gateclk_en;

assign lsu_biu_ar_user[2:0]   = {3{bus_arb_wmb_ar_sel}}  & wmb_biu_ar_user[2:0]
                                | {3{bus_arb_rb_ar_sel}}  & rb_biu_ar_user[2:0]
                                | {3{bus_arb_pfu_ar_sel}}  & pfu_biu_ar_user[2:0];

assign lsu_biu_ar_snoop[3:0]  = {4{bus_arb_wmb_ar_sel}}     & wmb_biu_ar_snoop[3:0]
                                | {4{bus_arb_rb_ar_sel}}    & rb_biu_ar_snoop[3:0]
                                | {4{bus_arb_pfu_ar_sel}}   & pfu_biu_ar_snoop[3:0];

assign lsu_biu_ar_domain[1:0] = {2{bus_arb_wmb_ar_sel}}     &  wmb_biu_ar_domain[1:0]
                                | {2{bus_arb_rb_ar_sel}}    &  rb_biu_ar_domain[1:0]
                                | {2{bus_arb_pfu_ar_sel}}   &  pfu_biu_ar_domain[1:0];

assign lsu_biu_ar_bar[1:0]    = {2{bus_arb_wmb_ar_sel}}     &  wmb_biu_ar_bar[1:0]
                                | {2{bus_arb_rb_ar_sel}}    &  rb_biu_ar_bar[1:0]
                                | {2{bus_arb_pfu_ar_sel}}   &  pfu_biu_ar_bar[1:0];

//==========================================================
//                      AW channel
//==========================================================
//priority: VB>WMB
//-----------------generate grnt signal---------------------
//for timing,generate total grnt here
//assign aw_ws = bus_arb_wmb_aw_sel
//               && (((wmb_biu_aw_snoop[2:0] == WU)
//                        || (wmb_biu_aw_snoop[2:0] == WLU))
//                     && (wmb_biu_aw_domain[1:0] == 2'b01)
//                   || wmb_biu_aw_bar[0]);

//assign biu_lsu_aw_grnt      = aw_ws & pad_biu_ws_awready | !aw_ws & pad_biu_wns_awready;

//assign bus_arb_vb_aw_sel    = vb_biu_aw_dp_req;
// &Force("output","bus_arb_vb_aw_grnt"); @190
assign bus_arb_vb_aw_grnt   = biu_lsu_aw_vb_grnt
                              &&  vb_biu_aw_req;

//assign bus_arb_wmb_aw_sel   = !vb_biu_aw_dp_req
//                              &&  wmb_biu_aw_dp_req;
// &Force("output","bus_arb_wmb_aw_grnt"); @196
assign bus_arb_wmb_aw_grnt  = biu_lsu_aw_wmb_grnt
                              &&  wmb_biu_aw_req;
//-----------------biu aw signal----------------------------
assign lsu_biu_aw_vict_req                 = vb_biu_aw_req;
assign lsu_biu_aw_vict_dp_req              = vb_biu_aw_dp_req;
assign lsu_biu_aw_vict_id[4:0]             = vb_biu_aw_id[4:0];
assign lsu_biu_aw_vict_addr[`PA_WIDTH-1:0] = vb_biu_aw_addr[`PA_WIDTH-1:0]; 
assign lsu_biu_aw_vict_len[1:0]            = vb_biu_aw_len[1:0];
assign lsu_biu_aw_vict_size[2:0]           = vb_biu_aw_size[2:0];
assign lsu_biu_aw_vict_burst[1:0]          = vb_biu_aw_burst[1:0];
assign lsu_biu_aw_vict_lock                = vb_biu_aw_lock;
assign lsu_biu_aw_vict_cache[3:0]          = vb_biu_aw_cache[3:0];
assign lsu_biu_aw_vict_prot[2:0]           = vb_biu_aw_prot[2:0];
assign lsu_biu_aw_vict_user                = vb_biu_aw_user;
assign lsu_biu_aw_vict_snoop[2:0]          = vb_biu_aw_snoop[2:0];
assign lsu_biu_aw_vict_domain[1:0]         = vb_biu_aw_domain[1:0];
assign lsu_biu_aw_vict_bar[1:0]            = vb_biu_aw_bar[1:0];
assign lsu_biu_aw_vict_unique              = vb_biu_aw_unique;

assign lsu_biu_aw_st_req                   = wmb_biu_aw_req;
assign lsu_biu_aw_st_dp_req                = wmb_biu_aw_dp_req;
assign lsu_biu_aw_st_id[4:0]               = wmb_biu_aw_id[4:0];
assign lsu_biu_aw_st_addr[`PA_WIDTH-1:0]   = wmb_biu_aw_addr[`PA_WIDTH-1:0]; 
assign lsu_biu_aw_st_len[1:0]              = wmb_biu_aw_len[1:0];
assign lsu_biu_aw_st_size[2:0]             = wmb_biu_aw_size[2:0];
assign lsu_biu_aw_st_burst[1:0]            = wmb_biu_aw_burst[1:0];
assign lsu_biu_aw_st_lock                  = wmb_biu_aw_lock;
assign lsu_biu_aw_st_cache[3:0]            = wmb_biu_aw_cache[3:0];
assign lsu_biu_aw_st_prot[2:0]             = wmb_biu_aw_prot[2:0];
assign lsu_biu_aw_st_user                  = wmb_biu_aw_user;
assign lsu_biu_aw_st_snoop[2:0]            = wmb_biu_aw_snoop[2:0];
assign lsu_biu_aw_st_domain[1:0]           = wmb_biu_aw_domain[1:0];
assign lsu_biu_aw_st_bar[1:0]              = wmb_biu_aw_bar[1:0];
assign lsu_biu_aw_st_unique                = 1'b0;


assign lsu_biu_aw_req_gate    = vb_biu_aw_req_gateclk_en
                                ||  wmb_biu_aw_req_gateclk_en;

//==========================================================
//                        W channel
//==========================================================
//assign bus_arb_vb_w_sel   = bus_arb_w_fifo[0]
//                            &&  !bus_arb_w_fifo_empty;
//assign bus_arb_wmb_w_sel  = !bus_arb_w_fifo[0]
//                            &&  !bus_arb_w_fifo_empty;

assign bus_arb_vb_w_grnt  = biu_lsu_w_vb_grnt
                            &&  vb_biu_w_req;
assign bus_arb_wmb_w_grnt = biu_lsu_w_wmb_grnt
                            &&  wmb_biu_w_req;

assign lsu_biu_w_vict_vld         = vb_biu_w_vld;
assign lsu_biu_w_vict_data[127:0] = vb_biu_w_data[127:0];
assign lsu_biu_w_vict_strb[15:0]  = vb_biu_w_strb[15:0];
assign lsu_biu_w_vict_last        = vb_biu_w_last;
assign lsu_biu_w_vict_wns         = 1'b1;

assign lsu_biu_w_st_vld           = wmb_biu_w_vld;
assign lsu_biu_w_st_data[127:0]   = wmb_biu_w_data[127:0];
assign lsu_biu_w_st_strb[15:0]    = wmb_biu_w_strb[15:0];
assign lsu_biu_w_st_last          = wmb_biu_w_last;
assign lsu_biu_w_st_wns           = wmb_biu_w_wns;


// &Force("input","vb_biu_w_id"); @266
// &Force("input","wmb_biu_w_id"); @267
// &Force("bus","vb_biu_w_id",4,0); @268
// &Force("bus","wmb_biu_w_id",4,0); @269


// &Force("output","lsu_biu_ar_dp_req"); @273
// &ModuleEnd; @277
endmodule


