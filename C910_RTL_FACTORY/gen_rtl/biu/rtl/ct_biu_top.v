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
module ct_biu_top(
  biu_cp0_apb_base,
  biu_cp0_cmplt,
  biu_cp0_coreid,
  biu_cp0_me_int,
  biu_cp0_ms_int,
  biu_cp0_mt_int,
  biu_cp0_rdata,
  biu_cp0_rvba,
  biu_cp0_se_int,
  biu_cp0_ss_int,
  biu_cp0_st_int,
  biu_had_coreid,
  biu_had_sdb_req_b,
  biu_hpcp_cmplt,
  biu_hpcp_l2of_int,
  biu_hpcp_rdata,
  biu_hpcp_time,
  biu_ifu_rd_data,
  biu_ifu_rd_data_vld,
  biu_ifu_rd_grnt,
  biu_ifu_rd_id,
  biu_ifu_rd_last,
  biu_ifu_rd_resp,
  biu_lsu_ac_addr,
  biu_lsu_ac_prot,
  biu_lsu_ac_req,
  biu_lsu_ac_snoop,
  biu_lsu_ar_ready,
  biu_lsu_aw_vb_grnt,
  biu_lsu_aw_wmb_grnt,
  biu_lsu_b_id,
  biu_lsu_b_resp,
  biu_lsu_b_vld,
  biu_lsu_cd_ready,
  biu_lsu_cr_ready,
  biu_lsu_r_data,
  biu_lsu_r_id,
  biu_lsu_r_last,
  biu_lsu_r_resp,
  biu_lsu_r_vld,
  biu_lsu_w_vb_grnt,
  biu_lsu_w_wmb_grnt,
  biu_mmu_smp_disable,
  biu_pad_acready,
  biu_pad_araddr,
  biu_pad_arbar,
  biu_pad_arburst,
  biu_pad_arcache,
  biu_pad_ardomain,
  biu_pad_arid,
  biu_pad_arlen,
  biu_pad_arlock,
  biu_pad_arprot,
  biu_pad_arsize,
  biu_pad_arsnoop,
  biu_pad_aruser,
  biu_pad_arvalid,
  biu_pad_awaddr,
  biu_pad_awbar,
  biu_pad_awburst,
  biu_pad_awcache,
  biu_pad_awdomain,
  biu_pad_awid,
  biu_pad_awlen,
  biu_pad_awlock,
  biu_pad_awprot,
  biu_pad_awsize,
  biu_pad_awsnoop,
  biu_pad_awunique,
  biu_pad_awuser,
  biu_pad_awvalid,
  biu_pad_back,
  biu_pad_bready,
  biu_pad_cddata,
  biu_pad_cderr,
  biu_pad_cdlast,
  biu_pad_cdvalid,
  biu_pad_cnt_en,
  biu_pad_crresp,
  biu_pad_crvalid,
  biu_pad_csr_sel,
  biu_pad_csr_wdata,
  biu_pad_jdb_pm,
  biu_pad_lpmd_b,
  biu_pad_rack,
  biu_pad_rready,
  biu_pad_wdata,
  biu_pad_werr,
  biu_pad_wlast,
  biu_pad_wns,
  biu_pad_wstrb,
  biu_pad_wvalid,
  biu_xx_dbg_wakeup,
  biu_xx_int_wakeup,
  biu_xx_normal_work,
  biu_xx_pmp_sel,
  biu_xx_snoop_vld,
  biu_yy_xx_no_op,
  coreclk,
  cp0_biu_icg_en,
  cp0_biu_lpmd_b,
  cp0_biu_op,
  cp0_biu_sel,
  cp0_biu_wdata,
  cpurst_b,
  forever_coreclk,
  had_biu_jdb_pm,
  hpcp_biu_cnt_en,
  hpcp_biu_op,
  hpcp_biu_sel,
  hpcp_biu_wdata,
  ifu_biu_r_ready,
  ifu_biu_rd_addr,
  ifu_biu_rd_burst,
  ifu_biu_rd_cache,
  ifu_biu_rd_domain,
  ifu_biu_rd_id,
  ifu_biu_rd_len,
  ifu_biu_rd_prot,
  ifu_biu_rd_req,
  ifu_biu_rd_req_gate,
  ifu_biu_rd_size,
  ifu_biu_rd_snoop,
  ifu_biu_rd_user,
  lsu_biu_ac_empty,
  lsu_biu_ac_ready,
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
  lsu_biu_cd_data,
  lsu_biu_cd_last,
  lsu_biu_cd_valid,
  lsu_biu_cr_resp,
  lsu_biu_cr_valid,
  lsu_biu_r_linefill_ready,
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
  pad_biu_acaddr,
  pad_biu_acprot,
  pad_biu_acsnoop,
  pad_biu_acvalid,
  pad_biu_arready,
  pad_biu_awready,
  pad_biu_bid,
  pad_biu_bresp,
  pad_biu_bvalid,
  pad_biu_cdready,
  pad_biu_crready,
  pad_biu_csr_cmplt,
  pad_biu_csr_rdata,
  pad_biu_dbgrq_b,
  pad_biu_hpcp_l2of_int,
  pad_biu_me_int,
  pad_biu_ms_int,
  pad_biu_mt_int,
  pad_biu_rdata,
  pad_biu_rid,
  pad_biu_rlast,
  pad_biu_rresp,
  pad_biu_rvalid,
  pad_biu_se_int,
  pad_biu_ss_int,
  pad_biu_st_int,
  pad_biu_wns_awready,
  pad_biu_wns_wready,
  pad_biu_wready,
  pad_biu_ws_awready,
  pad_biu_ws_wready,
  pad_core_hartid,
  pad_core_rvba,
  pad_xx_apb_base,
  pad_xx_time,
  pad_yy_icg_scan_en
);

// &Ports; @23
input            coreclk;                 
input            cp0_biu_icg_en;          
input   [1  :0]  cp0_biu_lpmd_b;          
input   [15 :0]  cp0_biu_op;              
input            cp0_biu_sel;             
input   [63 :0]  cp0_biu_wdata;           
input            cpurst_b;                
input            forever_coreclk;         
input   [1  :0]  had_biu_jdb_pm;          
input   [3  :0]  hpcp_biu_cnt_en;         
input   [15 :0]  hpcp_biu_op;             
input            hpcp_biu_sel;            
input   [63 :0]  hpcp_biu_wdata;          
input            ifu_biu_r_ready;         
input   [39 :0]  ifu_biu_rd_addr;         
input   [1  :0]  ifu_biu_rd_burst;        
input   [3  :0]  ifu_biu_rd_cache;        
input   [1  :0]  ifu_biu_rd_domain;       
input            ifu_biu_rd_id;           
input   [1  :0]  ifu_biu_rd_len;          
input   [2  :0]  ifu_biu_rd_prot;         
input            ifu_biu_rd_req;          
input            ifu_biu_rd_req_gate;     
input   [2  :0]  ifu_biu_rd_size;         
input   [3  :0]  ifu_biu_rd_snoop;        
input   [1  :0]  ifu_biu_rd_user;         
input            lsu_biu_ac_empty;        
input            lsu_biu_ac_ready;        
input   [39 :0]  lsu_biu_ar_addr;         
input   [1  :0]  lsu_biu_ar_bar;          
input   [1  :0]  lsu_biu_ar_burst;        
input   [3  :0]  lsu_biu_ar_cache;        
input   [1  :0]  lsu_biu_ar_domain;       
input            lsu_biu_ar_dp_req;       
input   [4  :0]  lsu_biu_ar_id;           
input   [1  :0]  lsu_biu_ar_len;          
input            lsu_biu_ar_lock;         
input   [2  :0]  lsu_biu_ar_prot;         
input            lsu_biu_ar_req;          
input            lsu_biu_ar_req_gate;     
input   [2  :0]  lsu_biu_ar_size;         
input   [3  :0]  lsu_biu_ar_snoop;        
input   [2  :0]  lsu_biu_ar_user;         
input            lsu_biu_aw_req_gate;     
input   [39 :0]  lsu_biu_aw_st_addr;      
input   [1  :0]  lsu_biu_aw_st_bar;       
input   [1  :0]  lsu_biu_aw_st_burst;     
input   [3  :0]  lsu_biu_aw_st_cache;     
input   [1  :0]  lsu_biu_aw_st_domain;    
input            lsu_biu_aw_st_dp_req;    
input   [4  :0]  lsu_biu_aw_st_id;        
input   [1  :0]  lsu_biu_aw_st_len;       
input            lsu_biu_aw_st_lock;      
input   [2  :0]  lsu_biu_aw_st_prot;      
input            lsu_biu_aw_st_req;       
input   [2  :0]  lsu_biu_aw_st_size;      
input   [2  :0]  lsu_biu_aw_st_snoop;     
input            lsu_biu_aw_st_unique;    
input            lsu_biu_aw_st_user;      
input   [39 :0]  lsu_biu_aw_vict_addr;    
input   [1  :0]  lsu_biu_aw_vict_bar;     
input   [1  :0]  lsu_biu_aw_vict_burst;   
input   [3  :0]  lsu_biu_aw_vict_cache;   
input   [1  :0]  lsu_biu_aw_vict_domain;  
input            lsu_biu_aw_vict_dp_req;  
input   [4  :0]  lsu_biu_aw_vict_id;      
input   [1  :0]  lsu_biu_aw_vict_len;     
input            lsu_biu_aw_vict_lock;    
input   [2  :0]  lsu_biu_aw_vict_prot;    
input            lsu_biu_aw_vict_req;     
input   [2  :0]  lsu_biu_aw_vict_size;    
input   [2  :0]  lsu_biu_aw_vict_snoop;   
input            lsu_biu_aw_vict_unique;  
input            lsu_biu_aw_vict_user;    
input   [127:0]  lsu_biu_cd_data;         
input            lsu_biu_cd_last;         
input            lsu_biu_cd_valid;        
input   [4  :0]  lsu_biu_cr_resp;         
input            lsu_biu_cr_valid;        
input            lsu_biu_r_linefill_ready; 
input   [127:0]  lsu_biu_w_st_data;       
input            lsu_biu_w_st_last;       
input   [15 :0]  lsu_biu_w_st_strb;       
input            lsu_biu_w_st_vld;        
input            lsu_biu_w_st_wns;        
input   [127:0]  lsu_biu_w_vict_data;     
input            lsu_biu_w_vict_last;     
input   [15 :0]  lsu_biu_w_vict_strb;     
input            lsu_biu_w_vict_vld;      
input            lsu_biu_w_vict_wns;      
input   [39 :0]  pad_biu_acaddr;          
input   [2  :0]  pad_biu_acprot;          
input   [3  :0]  pad_biu_acsnoop;         
input            pad_biu_acvalid;         
input            pad_biu_arready;         
input            pad_biu_awready;         
input   [4  :0]  pad_biu_bid;             
input   [1  :0]  pad_biu_bresp;           
input            pad_biu_bvalid;          
input            pad_biu_cdready;         
input            pad_biu_crready;         
input            pad_biu_csr_cmplt;       
input   [127:0]  pad_biu_csr_rdata;       
input            pad_biu_dbgrq_b;         
input   [3  :0]  pad_biu_hpcp_l2of_int;   
input            pad_biu_me_int;          
input            pad_biu_ms_int;          
input            pad_biu_mt_int;          
input   [127:0]  pad_biu_rdata;           
input   [4  :0]  pad_biu_rid;             
input            pad_biu_rlast;           
input   [3  :0]  pad_biu_rresp;           
input            pad_biu_rvalid;          
input            pad_biu_se_int;          
input            pad_biu_ss_int;          
input            pad_biu_st_int;          
input            pad_biu_wns_awready;     
input            pad_biu_wns_wready;      
input            pad_biu_wready;          
input            pad_biu_ws_awready;      
input            pad_biu_ws_wready;       
input   [2  :0]  pad_core_hartid;         
input   [39 :0]  pad_core_rvba;           
input   [39 :0]  pad_xx_apb_base;         
input   [63 :0]  pad_xx_time;             
input            pad_yy_icg_scan_en;      
output  [39 :0]  biu_cp0_apb_base;        
output           biu_cp0_cmplt;           
output  [2  :0]  biu_cp0_coreid;          
output           biu_cp0_me_int;          
output           biu_cp0_ms_int;          
output           biu_cp0_mt_int;          
output  [127:0]  biu_cp0_rdata;           
output  [39 :0]  biu_cp0_rvba;            
output           biu_cp0_se_int;          
output           biu_cp0_ss_int;          
output           biu_cp0_st_int;          
output  [1  :0]  biu_had_coreid;          
output           biu_had_sdb_req_b;       
output           biu_hpcp_cmplt;          
output  [3  :0]  biu_hpcp_l2of_int;       
output  [127:0]  biu_hpcp_rdata;          
output  [63 :0]  biu_hpcp_time;           
output  [127:0]  biu_ifu_rd_data;         
output           biu_ifu_rd_data_vld;     
output           biu_ifu_rd_grnt;         
output           biu_ifu_rd_id;           
output           biu_ifu_rd_last;         
output  [1  :0]  biu_ifu_rd_resp;         
output  [39 :0]  biu_lsu_ac_addr;         
output  [2  :0]  biu_lsu_ac_prot;         
output           biu_lsu_ac_req;          
output  [3  :0]  biu_lsu_ac_snoop;        
output           biu_lsu_ar_ready;        
output           biu_lsu_aw_vb_grnt;      
output           biu_lsu_aw_wmb_grnt;     
output  [4  :0]  biu_lsu_b_id;            
output  [1  :0]  biu_lsu_b_resp;          
output           biu_lsu_b_vld;           
output           biu_lsu_cd_ready;        
output           biu_lsu_cr_ready;        
output  [127:0]  biu_lsu_r_data;          
output  [4  :0]  biu_lsu_r_id;            
output           biu_lsu_r_last;          
output  [3  :0]  biu_lsu_r_resp;          
output           biu_lsu_r_vld;           
output           biu_lsu_w_vb_grnt;       
output           biu_lsu_w_wmb_grnt;      
output           biu_mmu_smp_disable;     
output           biu_pad_acready;         
output  [39 :0]  biu_pad_araddr;          
output  [1  :0]  biu_pad_arbar;           
output  [1  :0]  biu_pad_arburst;         
output  [3  :0]  biu_pad_arcache;         
output  [1  :0]  biu_pad_ardomain;        
output  [4  :0]  biu_pad_arid;            
output  [1  :0]  biu_pad_arlen;           
output           biu_pad_arlock;          
output  [2  :0]  biu_pad_arprot;          
output  [2  :0]  biu_pad_arsize;          
output  [3  :0]  biu_pad_arsnoop;         
output  [2  :0]  biu_pad_aruser;          
output           biu_pad_arvalid;         
output  [39 :0]  biu_pad_awaddr;          
output  [1  :0]  biu_pad_awbar;           
output  [1  :0]  biu_pad_awburst;         
output  [3  :0]  biu_pad_awcache;         
output  [1  :0]  biu_pad_awdomain;        
output  [4  :0]  biu_pad_awid;            
output  [1  :0]  biu_pad_awlen;           
output           biu_pad_awlock;          
output  [2  :0]  biu_pad_awprot;          
output  [2  :0]  biu_pad_awsize;          
output  [2  :0]  biu_pad_awsnoop;         
output           biu_pad_awunique;        
output           biu_pad_awuser;          
output           biu_pad_awvalid;         
output           biu_pad_back;            
output           biu_pad_bready;          
output  [127:0]  biu_pad_cddata;          
output           biu_pad_cderr;           
output           biu_pad_cdlast;          
output           biu_pad_cdvalid;         
output  [3  :0]  biu_pad_cnt_en;          
output  [4  :0]  biu_pad_crresp;          
output           biu_pad_crvalid;         
output           biu_pad_csr_sel;         
output  [79 :0]  biu_pad_csr_wdata;       
output           biu_pad_jdb_pm;          
output           biu_pad_lpmd_b;          
output           biu_pad_rack;            
output           biu_pad_rready;          
output  [127:0]  biu_pad_wdata;           
output           biu_pad_werr;            
output           biu_pad_wlast;           
output           biu_pad_wns;             
output  [15 :0]  biu_pad_wstrb;           
output           biu_pad_wvalid;          
output           biu_xx_dbg_wakeup;       
output           biu_xx_int_wakeup;       
output           biu_xx_normal_work;      
output           biu_xx_pmp_sel;          
output           biu_xx_snoop_vld;        
output           biu_yy_xx_no_op;         

// &Regs; @24

// &Wires; @25
wire             accpuclk;                
wire    [39 :0]  araddr;                  
wire    [1  :0]  arbar;                   
wire    [1  :0]  arburst;                 
wire    [3  :0]  arcache;                 
wire             arcpuclk;                
wire    [1  :0]  ardomain;                
wire    [4  :0]  arid;                    
wire    [1  :0]  arlen;                   
wire             arlock;                  
wire    [2  :0]  arprot;                  
wire             arready;                 
wire    [2  :0]  arsize;                  
wire    [3  :0]  arsnoop;                 
wire    [2  :0]  aruser;                  
wire             arvalid;                 
wire             arvalid_gate;            
wire             bcpuclk;                 
wire    [39 :0]  biu_cp0_apb_base;        
wire             biu_cp0_cmplt;           
wire    [2  :0]  biu_cp0_coreid;          
wire             biu_cp0_me_int;          
wire             biu_cp0_ms_int;          
wire             biu_cp0_mt_int;          
wire    [127:0]  biu_cp0_rdata;           
wire    [39 :0]  biu_cp0_rvba;            
wire             biu_cp0_se_int;          
wire             biu_cp0_ss_int;          
wire             biu_cp0_st_int;          
wire             biu_csr_cmplt;           
wire    [15 :0]  biu_csr_op;              
wire    [127:0]  biu_csr_rdata;           
wire             biu_csr_sel;             
wire    [63 :0]  biu_csr_wdata;           
wire    [1  :0]  biu_had_coreid;          
wire             biu_had_sdb_req_b;       
wire             biu_hpcp_cmplt;          
wire    [3  :0]  biu_hpcp_l2of_int;       
wire    [127:0]  biu_hpcp_rdata;          
wire    [63 :0]  biu_hpcp_time;           
wire    [127:0]  biu_ifu_rd_data;         
wire             biu_ifu_rd_data_vld;     
wire             biu_ifu_rd_grnt;         
wire             biu_ifu_rd_id;           
wire             biu_ifu_rd_last;         
wire    [1  :0]  biu_ifu_rd_resp;         
wire    [39 :0]  biu_lsu_ac_addr;         
wire    [2  :0]  biu_lsu_ac_prot;         
wire             biu_lsu_ac_req;          
wire    [3  :0]  biu_lsu_ac_snoop;        
wire             biu_lsu_ar_ready;        
wire             biu_lsu_aw_vb_grnt;      
wire             biu_lsu_aw_wmb_grnt;     
wire    [4  :0]  biu_lsu_b_id;            
wire    [1  :0]  biu_lsu_b_resp;          
wire             biu_lsu_b_vld;           
wire             biu_lsu_cd_ready;        
wire             biu_lsu_cr_ready;        
wire    [127:0]  biu_lsu_r_data;          
wire    [4  :0]  biu_lsu_r_id;            
wire             biu_lsu_r_last;          
wire    [3  :0]  biu_lsu_r_resp;          
wire             biu_lsu_r_vld;           
wire             biu_lsu_w_vb_grnt;       
wire             biu_lsu_w_wmb_grnt;      
wire             biu_mmu_smp_disable;     
wire             biu_pad_acready;         
wire    [39 :0]  biu_pad_araddr;          
wire    [1  :0]  biu_pad_arbar;           
wire    [1  :0]  biu_pad_arburst;         
wire    [3  :0]  biu_pad_arcache;         
wire    [1  :0]  biu_pad_ardomain;        
wire    [4  :0]  biu_pad_arid;            
wire    [1  :0]  biu_pad_arlen;           
wire             biu_pad_arlock;          
wire    [2  :0]  biu_pad_arprot;          
wire    [2  :0]  biu_pad_arsize;          
wire    [3  :0]  biu_pad_arsnoop;         
wire    [2  :0]  biu_pad_aruser;          
wire             biu_pad_arvalid;         
wire    [39 :0]  biu_pad_awaddr;          
wire    [1  :0]  biu_pad_awbar;           
wire    [1  :0]  biu_pad_awburst;         
wire    [3  :0]  biu_pad_awcache;         
wire    [1  :0]  biu_pad_awdomain;        
wire    [4  :0]  biu_pad_awid;            
wire    [1  :0]  biu_pad_awlen;           
wire             biu_pad_awlock;          
wire    [2  :0]  biu_pad_awprot;          
wire    [2  :0]  biu_pad_awsize;          
wire    [2  :0]  biu_pad_awsnoop;         
wire             biu_pad_awunique;        
wire             biu_pad_awuser;          
wire             biu_pad_awvalid;         
wire             biu_pad_back;            
wire             biu_pad_bready;          
wire    [127:0]  biu_pad_cddata;          
wire             biu_pad_cderr;           
wire             biu_pad_cdlast;          
wire             biu_pad_cdvalid;         
wire    [3  :0]  biu_pad_cnt_en;          
wire    [4  :0]  biu_pad_crresp;          
wire             biu_pad_crvalid;         
wire             biu_pad_csr_sel;         
wire    [79 :0]  biu_pad_csr_wdata;       
wire             biu_pad_jdb_pm;          
wire             biu_pad_lpmd_b;          
wire             biu_pad_rack;            
wire             biu_pad_rready;          
wire    [127:0]  biu_pad_wdata;           
wire             biu_pad_werr;            
wire             biu_pad_wlast;           
wire             biu_pad_wns;             
wire    [15 :0]  biu_pad_wstrb;           
wire             biu_pad_wvalid;          
wire             biu_xx_dbg_wakeup;       
wire             biu_xx_int_wakeup;       
wire             biu_xx_normal_work;      
wire             biu_xx_pmp_sel;          
wire             biu_xx_snoop_vld;        
wire             biu_yy_xx_no_op;         
wire             bus_arb_w_fifo_clk;      
wire             bus_arb_w_fifo_clk_en;   
wire             cdcpuclk;                
wire             coreclk;                 
wire             cp0_biu_icg_en;          
wire    [1  :0]  cp0_biu_lpmd_b;          
wire    [15 :0]  cp0_biu_op;              
wire             cp0_biu_sel;             
wire    [63 :0]  cp0_biu_wdata;           
wire             cpurst_b;                
wire             crcpuclk;                
wire             forever_coreclk;         
wire    [1  :0]  had_biu_jdb_pm;          
wire    [3  :0]  hpcp_biu_cnt_en;         
wire    [15 :0]  hpcp_biu_op;             
wire             hpcp_biu_sel;            
wire    [63 :0]  hpcp_biu_wdata;          
wire             ifu_biu_r_ready;         
wire    [39 :0]  ifu_biu_rd_addr;         
wire    [1  :0]  ifu_biu_rd_burst;        
wire    [3  :0]  ifu_biu_rd_cache;        
wire    [1  :0]  ifu_biu_rd_domain;       
wire             ifu_biu_rd_id;           
wire    [1  :0]  ifu_biu_rd_len;          
wire    [2  :0]  ifu_biu_rd_prot;         
wire             ifu_biu_rd_req;          
wire             ifu_biu_rd_req_gate;     
wire    [2  :0]  ifu_biu_rd_size;         
wire    [3  :0]  ifu_biu_rd_snoop;        
wire    [1  :0]  ifu_biu_rd_user;         
wire             lsu_biu_ac_empty;        
wire             lsu_biu_ac_ready;        
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
wire    [127:0]  lsu_biu_cd_data;         
wire             lsu_biu_cd_last;         
wire             lsu_biu_cd_valid;        
wire    [4  :0]  lsu_biu_cr_resp;         
wire             lsu_biu_cr_valid;        
wire             lsu_biu_r_linefill_ready; 
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
wire    [39 :0]  pad_biu_acaddr;          
wire    [2  :0]  pad_biu_acprot;          
wire    [3  :0]  pad_biu_acsnoop;         
wire             pad_biu_acvalid;         
wire             pad_biu_arready;         
wire             pad_biu_awready;         
wire             pad_biu_back_ready;      
wire    [4  :0]  pad_biu_bid;             
wire    [1  :0]  pad_biu_bresp;           
wire             pad_biu_bvalid;          
wire             pad_biu_cdready;         
wire             pad_biu_crready;         
wire             pad_biu_csr_cmplt;       
wire    [127:0]  pad_biu_csr_rdata;       
wire             pad_biu_dbgrq_b;         
wire    [3  :0]  pad_biu_hpcp_l2of_int;   
wire             pad_biu_me_int;          
wire             pad_biu_ms_int;          
wire             pad_biu_mt_int;          
wire             pad_biu_rack_ready;      
wire    [127:0]  pad_biu_rdata;           
wire    [4  :0]  pad_biu_rid;             
wire             pad_biu_rlast;           
wire    [3  :0]  pad_biu_rresp;           
wire             pad_biu_rvalid;          
wire             pad_biu_se_int;          
wire             pad_biu_ss_int;          
wire             pad_biu_st_int;          
wire             pad_biu_wns_awready;     
wire             pad_biu_wns_wready;      
wire             pad_biu_wready;          
wire             pad_biu_ws_awready;      
wire             pad_biu_ws_wready;       
wire    [2  :0]  pad_core_hartid;         
wire    [39 :0]  pad_core_rvba;           
wire    [39 :0]  pad_xx_apb_base;         
wire    [63 :0]  pad_xx_time;             
wire             pad_yy_icg_scan_en;      
wire             rcpuclk;                 
wire             read_ar_clk_en;          
wire             read_busy;               
wire             read_r_clk_en;           
wire             round_w_clk_en;          
wire             round_wcpuclk;           
wire             snoop_ac_clk_en;         
wire             snoop_cd_clk_en;         
wire             snoop_cr_clk_en;         
wire             st_aw_clk_en;            
wire    [39 :0]  st_awaddr;               
wire    [1  :0]  st_awbar;                
wire    [1  :0]  st_awburst;              
wire    [3  :0]  st_awcache;              
wire             st_awcpuclk;             
wire    [1  :0]  st_awdomain;             
wire    [4  :0]  st_awid;                 
wire    [1  :0]  st_awlen;                
wire             st_awlock;               
wire    [2  :0]  st_awprot;               
wire             st_awready;              
wire    [2  :0]  st_awsize;               
wire    [2  :0]  st_awsnoop;              
wire             st_awunique;             
wire             st_awuser;               
wire             st_awvalid;              
wire             st_awvalid_gate;         
wire             st_w_clk_en;             
wire             st_wcpuclk;              
wire    [127:0]  st_wdata;                
wire             st_wlast;                
wire             st_wns;                  
wire             st_wready;               
wire    [15 :0]  st_wstrb;                
wire             st_wvalid;               
wire             vict_aw_clk_en;          
wire    [39 :0]  vict_awaddr;             
wire    [1  :0]  vict_awbar;              
wire    [1  :0]  vict_awburst;            
wire    [3  :0]  vict_awcache;            
wire             vict_awcpuclk;           
wire    [1  :0]  vict_awdomain;           
wire    [4  :0]  vict_awid;               
wire    [1  :0]  vict_awlen;              
wire             vict_awlock;             
wire    [2  :0]  vict_awprot;             
wire             vict_awready;            
wire    [2  :0]  vict_awsize;             
wire    [2  :0]  vict_awsnoop;            
wire             vict_awunique;           
wire             vict_awuser;             
wire             vict_awvalid;            
wire             vict_awvalid_gate;       
wire             vict_w_clk_en;           
wire             vict_wcpuclk;            
wire    [127:0]  vict_wdata;              
wire             vict_wlast;              
wire             vict_wns;                
wire             vict_wready;             
wire    [15 :0]  vict_wstrb;              
wire             vict_wvalid;             
wire             write_b_clk_en;          
wire             write_busy;              


// &Instance("ct_biu_req_arbiter"); @27
ct_biu_req_arbiter  x_ct_biu_req_arbiter (
  .araddr                 (araddr                ),
  .arbar                  (arbar                 ),
  .arburst                (arburst               ),
  .arcache                (arcache               ),
  .ardomain               (ardomain              ),
  .arid                   (arid                  ),
  .arlen                  (arlen                 ),
  .arlock                 (arlock                ),
  .arprot                 (arprot                ),
  .arready                (arready               ),
  .arsize                 (arsize                ),
  .arsnoop                (arsnoop               ),
  .aruser                 (aruser                ),
  .arvalid                (arvalid               ),
  .arvalid_gate           (arvalid_gate          ),
  .biu_ifu_rd_grnt        (biu_ifu_rd_grnt       ),
  .biu_lsu_ar_ready       (biu_lsu_ar_ready      ),
  .biu_lsu_aw_vb_grnt     (biu_lsu_aw_vb_grnt    ),
  .biu_lsu_aw_wmb_grnt    (biu_lsu_aw_wmb_grnt   ),
  .biu_lsu_w_vb_grnt      (biu_lsu_w_vb_grnt     ),
  .biu_lsu_w_wmb_grnt     (biu_lsu_w_wmb_grnt    ),
  .ifu_biu_rd_addr        (ifu_biu_rd_addr       ),
  .ifu_biu_rd_burst       (ifu_biu_rd_burst      ),
  .ifu_biu_rd_cache       (ifu_biu_rd_cache      ),
  .ifu_biu_rd_domain      (ifu_biu_rd_domain     ),
  .ifu_biu_rd_id          (ifu_biu_rd_id         ),
  .ifu_biu_rd_len         (ifu_biu_rd_len        ),
  .ifu_biu_rd_prot        (ifu_biu_rd_prot       ),
  .ifu_biu_rd_req         (ifu_biu_rd_req        ),
  .ifu_biu_rd_req_gate    (ifu_biu_rd_req_gate   ),
  .ifu_biu_rd_size        (ifu_biu_rd_size       ),
  .ifu_biu_rd_snoop       (ifu_biu_rd_snoop      ),
  .ifu_biu_rd_user        (ifu_biu_rd_user       ),
  .lsu_biu_ar_addr        (lsu_biu_ar_addr       ),
  .lsu_biu_ar_bar         (lsu_biu_ar_bar        ),
  .lsu_biu_ar_burst       (lsu_biu_ar_burst      ),
  .lsu_biu_ar_cache       (lsu_biu_ar_cache      ),
  .lsu_biu_ar_domain      (lsu_biu_ar_domain     ),
  .lsu_biu_ar_dp_req      (lsu_biu_ar_dp_req     ),
  .lsu_biu_ar_id          (lsu_biu_ar_id         ),
  .lsu_biu_ar_len         (lsu_biu_ar_len        ),
  .lsu_biu_ar_lock        (lsu_biu_ar_lock       ),
  .lsu_biu_ar_prot        (lsu_biu_ar_prot       ),
  .lsu_biu_ar_req         (lsu_biu_ar_req        ),
  .lsu_biu_ar_req_gate    (lsu_biu_ar_req_gate   ),
  .lsu_biu_ar_size        (lsu_biu_ar_size       ),
  .lsu_biu_ar_snoop       (lsu_biu_ar_snoop      ),
  .lsu_biu_ar_user        (lsu_biu_ar_user       ),
  .lsu_biu_aw_req_gate    (lsu_biu_aw_req_gate   ),
  .lsu_biu_aw_st_addr     (lsu_biu_aw_st_addr    ),
  .lsu_biu_aw_st_bar      (lsu_biu_aw_st_bar     ),
  .lsu_biu_aw_st_burst    (lsu_biu_aw_st_burst   ),
  .lsu_biu_aw_st_cache    (lsu_biu_aw_st_cache   ),
  .lsu_biu_aw_st_domain   (lsu_biu_aw_st_domain  ),
  .lsu_biu_aw_st_dp_req   (lsu_biu_aw_st_dp_req  ),
  .lsu_biu_aw_st_id       (lsu_biu_aw_st_id      ),
  .lsu_biu_aw_st_len      (lsu_biu_aw_st_len     ),
  .lsu_biu_aw_st_lock     (lsu_biu_aw_st_lock    ),
  .lsu_biu_aw_st_prot     (lsu_biu_aw_st_prot    ),
  .lsu_biu_aw_st_req      (lsu_biu_aw_st_req     ),
  .lsu_biu_aw_st_size     (lsu_biu_aw_st_size    ),
  .lsu_biu_aw_st_snoop    (lsu_biu_aw_st_snoop   ),
  .lsu_biu_aw_st_unique   (lsu_biu_aw_st_unique  ),
  .lsu_biu_aw_st_user     (lsu_biu_aw_st_user    ),
  .lsu_biu_aw_vict_addr   (lsu_biu_aw_vict_addr  ),
  .lsu_biu_aw_vict_bar    (lsu_biu_aw_vict_bar   ),
  .lsu_biu_aw_vict_burst  (lsu_biu_aw_vict_burst ),
  .lsu_biu_aw_vict_cache  (lsu_biu_aw_vict_cache ),
  .lsu_biu_aw_vict_domain (lsu_biu_aw_vict_domain),
  .lsu_biu_aw_vict_dp_req (lsu_biu_aw_vict_dp_req),
  .lsu_biu_aw_vict_id     (lsu_biu_aw_vict_id    ),
  .lsu_biu_aw_vict_len    (lsu_biu_aw_vict_len   ),
  .lsu_biu_aw_vict_lock   (lsu_biu_aw_vict_lock  ),
  .lsu_biu_aw_vict_prot   (lsu_biu_aw_vict_prot  ),
  .lsu_biu_aw_vict_req    (lsu_biu_aw_vict_req   ),
  .lsu_biu_aw_vict_size   (lsu_biu_aw_vict_size  ),
  .lsu_biu_aw_vict_snoop  (lsu_biu_aw_vict_snoop ),
  .lsu_biu_aw_vict_unique (lsu_biu_aw_vict_unique),
  .lsu_biu_aw_vict_user   (lsu_biu_aw_vict_user  ),
  .lsu_biu_w_st_data      (lsu_biu_w_st_data     ),
  .lsu_biu_w_st_last      (lsu_biu_w_st_last     ),
  .lsu_biu_w_st_strb      (lsu_biu_w_st_strb     ),
  .lsu_biu_w_st_vld       (lsu_biu_w_st_vld      ),
  .lsu_biu_w_st_wns       (lsu_biu_w_st_wns      ),
  .lsu_biu_w_vict_data    (lsu_biu_w_vict_data   ),
  .lsu_biu_w_vict_last    (lsu_biu_w_vict_last   ),
  .lsu_biu_w_vict_strb    (lsu_biu_w_vict_strb   ),
  .lsu_biu_w_vict_vld     (lsu_biu_w_vict_vld    ),
  .lsu_biu_w_vict_wns     (lsu_biu_w_vict_wns    ),
  .st_awaddr              (st_awaddr             ),
  .st_awbar               (st_awbar              ),
  .st_awburst             (st_awburst            ),
  .st_awcache             (st_awcache            ),
  .st_awdomain            (st_awdomain           ),
  .st_awid                (st_awid               ),
  .st_awlen               (st_awlen              ),
  .st_awlock              (st_awlock             ),
  .st_awprot              (st_awprot             ),
  .st_awready             (st_awready            ),
  .st_awsize              (st_awsize             ),
  .st_awsnoop             (st_awsnoop            ),
  .st_awunique            (st_awunique           ),
  .st_awuser              (st_awuser             ),
  .st_awvalid             (st_awvalid            ),
  .st_awvalid_gate        (st_awvalid_gate       ),
  .st_wdata               (st_wdata              ),
  .st_wlast               (st_wlast              ),
  .st_wns                 (st_wns                ),
  .st_wready              (st_wready             ),
  .st_wstrb               (st_wstrb              ),
  .st_wvalid              (st_wvalid             ),
  .vict_awaddr            (vict_awaddr           ),
  .vict_awbar             (vict_awbar            ),
  .vict_awburst           (vict_awburst          ),
  .vict_awcache           (vict_awcache          ),
  .vict_awdomain          (vict_awdomain         ),
  .vict_awid              (vict_awid             ),
  .vict_awlen             (vict_awlen            ),
  .vict_awlock            (vict_awlock           ),
  .vict_awprot            (vict_awprot           ),
  .vict_awready           (vict_awready          ),
  .vict_awsize            (vict_awsize           ),
  .vict_awsnoop           (vict_awsnoop          ),
  .vict_awunique          (vict_awunique         ),
  .vict_awuser            (vict_awuser           ),
  .vict_awvalid           (vict_awvalid          ),
  .vict_awvalid_gate      (vict_awvalid_gate     ),
  .vict_wdata             (vict_wdata            ),
  .vict_wlast             (vict_wlast            ),
  .vict_wns               (vict_wns              ),
  .vict_wready            (vict_wready           ),
  .vict_wstrb             (vict_wstrb            ),
  .vict_wvalid            (vict_wvalid           )
);


// &Instance("ct_biu_read_channel"); @29
ct_biu_read_channel  x_ct_biu_read_channel (
  .araddr                   (araddr                  ),
  .arbar                    (arbar                   ),
  .arburst                  (arburst                 ),
  .arcache                  (arcache                 ),
  .arcpuclk                 (arcpuclk                ),
  .ardomain                 (ardomain                ),
  .arid                     (arid                    ),
  .arlen                    (arlen                   ),
  .arlock                   (arlock                  ),
  .arprot                   (arprot                  ),
  .arready                  (arready                 ),
  .arsize                   (arsize                  ),
  .arsnoop                  (arsnoop                 ),
  .aruser                   (aruser                  ),
  .arvalid                  (arvalid                 ),
  .arvalid_gate             (arvalid_gate            ),
  .biu_ifu_rd_data          (biu_ifu_rd_data         ),
  .biu_ifu_rd_data_vld      (biu_ifu_rd_data_vld     ),
  .biu_ifu_rd_id            (biu_ifu_rd_id           ),
  .biu_ifu_rd_last          (biu_ifu_rd_last         ),
  .biu_ifu_rd_resp          (biu_ifu_rd_resp         ),
  .biu_lsu_r_data           (biu_lsu_r_data          ),
  .biu_lsu_r_id             (biu_lsu_r_id            ),
  .biu_lsu_r_last           (biu_lsu_r_last          ),
  .biu_lsu_r_resp           (biu_lsu_r_resp          ),
  .biu_lsu_r_vld            (biu_lsu_r_vld           ),
  .biu_pad_araddr           (biu_pad_araddr          ),
  .biu_pad_arbar            (biu_pad_arbar           ),
  .biu_pad_arburst          (biu_pad_arburst         ),
  .biu_pad_arcache          (biu_pad_arcache         ),
  .biu_pad_ardomain         (biu_pad_ardomain        ),
  .biu_pad_arid             (biu_pad_arid            ),
  .biu_pad_arlen            (biu_pad_arlen           ),
  .biu_pad_arlock           (biu_pad_arlock          ),
  .biu_pad_arprot           (biu_pad_arprot          ),
  .biu_pad_arsize           (biu_pad_arsize          ),
  .biu_pad_arsnoop          (biu_pad_arsnoop         ),
  .biu_pad_aruser           (biu_pad_aruser          ),
  .biu_pad_arvalid          (biu_pad_arvalid         ),
  .biu_pad_rack             (biu_pad_rack            ),
  .biu_pad_rready           (biu_pad_rready          ),
  .coreclk                  (coreclk                 ),
  .cpurst_b                 (cpurst_b                ),
  .ifu_biu_r_ready          (ifu_biu_r_ready         ),
  .lsu_biu_r_linefill_ready (lsu_biu_r_linefill_ready),
  .pad_biu_arready          (pad_biu_arready         ),
  .pad_biu_rack_ready       (pad_biu_rack_ready      ),
  .pad_biu_rdata            (pad_biu_rdata           ),
  .pad_biu_rid              (pad_biu_rid             ),
  .pad_biu_rlast            (pad_biu_rlast           ),
  .pad_biu_rresp            (pad_biu_rresp           ),
  .pad_biu_rvalid           (pad_biu_rvalid          ),
  .rcpuclk                  (rcpuclk                 ),
  .read_ar_clk_en           (read_ar_clk_en          ),
  .read_busy                (read_busy               ),
  .read_r_clk_en            (read_r_clk_en           )
);


// &Instance("ct_biu_write_channel"); @31
ct_biu_write_channel  x_ct_biu_write_channel (
  .bcpuclk               (bcpuclk              ),
  .biu_lsu_b_id          (biu_lsu_b_id         ),
  .biu_lsu_b_resp        (biu_lsu_b_resp       ),
  .biu_lsu_b_vld         (biu_lsu_b_vld        ),
  .biu_pad_awaddr        (biu_pad_awaddr       ),
  .biu_pad_awbar         (biu_pad_awbar        ),
  .biu_pad_awburst       (biu_pad_awburst      ),
  .biu_pad_awcache       (biu_pad_awcache      ),
  .biu_pad_awdomain      (biu_pad_awdomain     ),
  .biu_pad_awid          (biu_pad_awid         ),
  .biu_pad_awlen         (biu_pad_awlen        ),
  .biu_pad_awlock        (biu_pad_awlock       ),
  .biu_pad_awprot        (biu_pad_awprot       ),
  .biu_pad_awsize        (biu_pad_awsize       ),
  .biu_pad_awsnoop       (biu_pad_awsnoop      ),
  .biu_pad_awunique      (biu_pad_awunique     ),
  .biu_pad_awuser        (biu_pad_awuser       ),
  .biu_pad_awvalid       (biu_pad_awvalid      ),
  .biu_pad_back          (biu_pad_back         ),
  .biu_pad_bready        (biu_pad_bready       ),
  .biu_pad_wdata         (biu_pad_wdata        ),
  .biu_pad_werr          (biu_pad_werr         ),
  .biu_pad_wlast         (biu_pad_wlast        ),
  .biu_pad_wns           (biu_pad_wns          ),
  .biu_pad_wstrb         (biu_pad_wstrb        ),
  .biu_pad_wvalid        (biu_pad_wvalid       ),
  .bus_arb_w_fifo_clk    (bus_arb_w_fifo_clk   ),
  .bus_arb_w_fifo_clk_en (bus_arb_w_fifo_clk_en),
  .coreclk               (coreclk              ),
  .cpurst_b              (cpurst_b             ),
  .pad_biu_awready       (pad_biu_awready      ),
  .pad_biu_back_ready    (pad_biu_back_ready   ),
  .pad_biu_bid           (pad_biu_bid          ),
  .pad_biu_bresp         (pad_biu_bresp        ),
  .pad_biu_bvalid        (pad_biu_bvalid       ),
  .pad_biu_wns_awready   (pad_biu_wns_awready  ),
  .pad_biu_wns_wready    (pad_biu_wns_wready   ),
  .pad_biu_wready        (pad_biu_wready       ),
  .pad_biu_ws_awready    (pad_biu_ws_awready   ),
  .pad_biu_ws_wready     (pad_biu_ws_wready    ),
  .round_w_clk_en        (round_w_clk_en       ),
  .round_wcpuclk         (round_wcpuclk        ),
  .st_aw_clk_en          (st_aw_clk_en         ),
  .st_awaddr             (st_awaddr            ),
  .st_awbar              (st_awbar             ),
  .st_awburst            (st_awburst           ),
  .st_awcache            (st_awcache           ),
  .st_awcpuclk           (st_awcpuclk          ),
  .st_awdomain           (st_awdomain          ),
  .st_awid               (st_awid              ),
  .st_awlen              (st_awlen             ),
  .st_awlock             (st_awlock            ),
  .st_awprot             (st_awprot            ),
  .st_awready            (st_awready           ),
  .st_awsize             (st_awsize            ),
  .st_awsnoop            (st_awsnoop           ),
  .st_awunique           (st_awunique          ),
  .st_awuser             (st_awuser            ),
  .st_awvalid            (st_awvalid           ),
  .st_awvalid_gate       (st_awvalid_gate      ),
  .st_w_clk_en           (st_w_clk_en          ),
  .st_wcpuclk            (st_wcpuclk           ),
  .st_wdata              (st_wdata             ),
  .st_wlast              (st_wlast             ),
  .st_wns                (st_wns               ),
  .st_wready             (st_wready            ),
  .st_wstrb              (st_wstrb             ),
  .st_wvalid             (st_wvalid            ),
  .vict_aw_clk_en        (vict_aw_clk_en       ),
  .vict_awaddr           (vict_awaddr          ),
  .vict_awbar            (vict_awbar           ),
  .vict_awburst          (vict_awburst         ),
  .vict_awcache          (vict_awcache         ),
  .vict_awcpuclk         (vict_awcpuclk        ),
  .vict_awdomain         (vict_awdomain        ),
  .vict_awid             (vict_awid            ),
  .vict_awlen            (vict_awlen           ),
  .vict_awlock           (vict_awlock          ),
  .vict_awprot           (vict_awprot          ),
  .vict_awready          (vict_awready         ),
  .vict_awsize           (vict_awsize          ),
  .vict_awsnoop          (vict_awsnoop         ),
  .vict_awunique         (vict_awunique        ),
  .vict_awuser           (vict_awuser          ),
  .vict_awvalid          (vict_awvalid         ),
  .vict_awvalid_gate     (vict_awvalid_gate    ),
  .vict_w_clk_en         (vict_w_clk_en        ),
  .vict_wcpuclk          (vict_wcpuclk         ),
  .vict_wdata            (vict_wdata           ),
  .vict_wlast            (vict_wlast           ),
  .vict_wns              (vict_wns             ),
  .vict_wready           (vict_wready          ),
  .vict_wstrb            (vict_wstrb           ),
  .vict_wvalid           (vict_wvalid          ),
  .write_b_clk_en        (write_b_clk_en       ),
  .write_busy            (write_busy           )
);


// &Instance("ct_biu_snoop_channel"); @33
ct_biu_snoop_channel  x_ct_biu_snoop_channel (
  .accpuclk         (accpuclk        ),
  .biu_lsu_ac_addr  (biu_lsu_ac_addr ),
  .biu_lsu_ac_prot  (biu_lsu_ac_prot ),
  .biu_lsu_ac_req   (biu_lsu_ac_req  ),
  .biu_lsu_ac_snoop (biu_lsu_ac_snoop),
  .biu_lsu_cd_ready (biu_lsu_cd_ready),
  .biu_lsu_cr_ready (biu_lsu_cr_ready),
  .biu_pad_acready  (biu_pad_acready ),
  .biu_pad_cddata   (biu_pad_cddata  ),
  .biu_pad_cderr    (biu_pad_cderr   ),
  .biu_pad_cdlast   (biu_pad_cdlast  ),
  .biu_pad_cdvalid  (biu_pad_cdvalid ),
  .biu_pad_crresp   (biu_pad_crresp  ),
  .biu_pad_crvalid  (biu_pad_crvalid ),
  .biu_xx_snoop_vld (biu_xx_snoop_vld),
  .cdcpuclk         (cdcpuclk        ),
  .cpurst_b         (cpurst_b        ),
  .crcpuclk         (crcpuclk        ),
  .forever_coreclk  (forever_coreclk ),
  .lsu_biu_ac_empty (lsu_biu_ac_empty),
  .lsu_biu_ac_ready (lsu_biu_ac_ready),
  .lsu_biu_cd_data  (lsu_biu_cd_data ),
  .lsu_biu_cd_last  (lsu_biu_cd_last ),
  .lsu_biu_cd_valid (lsu_biu_cd_valid),
  .lsu_biu_cr_resp  (lsu_biu_cr_resp ),
  .lsu_biu_cr_valid (lsu_biu_cr_valid),
  .pad_biu_acaddr   (pad_biu_acaddr  ),
  .pad_biu_acprot   (pad_biu_acprot  ),
  .pad_biu_acsnoop  (pad_biu_acsnoop ),
  .pad_biu_acvalid  (pad_biu_acvalid ),
  .pad_biu_cdready  (pad_biu_cdready ),
  .pad_biu_crready  (pad_biu_crready ),
  .snoop_ac_clk_en  (snoop_ac_clk_en ),
  .snoop_cd_clk_en  (snoop_cd_clk_en ),
  .snoop_cr_clk_en  (snoop_cr_clk_en )
);


// &Instance("ct_biu_lowpower"); @35
ct_biu_lowpower  x_ct_biu_lowpower (
  .accpuclk              (accpuclk             ),
  .arcpuclk              (arcpuclk             ),
  .bcpuclk               (bcpuclk              ),
  .biu_yy_xx_no_op       (biu_yy_xx_no_op      ),
  .bus_arb_w_fifo_clk    (bus_arb_w_fifo_clk   ),
  .bus_arb_w_fifo_clk_en (bus_arb_w_fifo_clk_en),
  .cdcpuclk              (cdcpuclk             ),
  .coreclk               (coreclk              ),
  .cp0_biu_icg_en        (cp0_biu_icg_en       ),
  .crcpuclk              (crcpuclk             ),
  .forever_coreclk       (forever_coreclk      ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .rcpuclk               (rcpuclk              ),
  .read_ar_clk_en        (read_ar_clk_en       ),
  .read_busy             (read_busy            ),
  .read_r_clk_en         (read_r_clk_en        ),
  .round_w_clk_en        (round_w_clk_en       ),
  .round_wcpuclk         (round_wcpuclk        ),
  .snoop_ac_clk_en       (snoop_ac_clk_en      ),
  .snoop_cd_clk_en       (snoop_cd_clk_en      ),
  .snoop_cr_clk_en       (snoop_cr_clk_en      ),
  .st_aw_clk_en          (st_aw_clk_en         ),
  .st_awcpuclk           (st_awcpuclk          ),
  .st_w_clk_en           (st_w_clk_en          ),
  .st_wcpuclk            (st_wcpuclk           ),
  .vict_aw_clk_en        (vict_aw_clk_en       ),
  .vict_awcpuclk         (vict_awcpuclk        ),
  .vict_w_clk_en         (vict_w_clk_en        ),
  .vict_wcpuclk          (vict_wcpuclk         ),
  .write_b_clk_en        (write_b_clk_en       ),
  .write_busy            (write_busy           )
);


// &Instance("ct_biu_csr_req_arbiter"); @37
ct_biu_csr_req_arbiter  x_ct_biu_csr_req_arbiter (
  .biu_cp0_cmplt  (biu_cp0_cmplt ),
  .biu_cp0_rdata  (biu_cp0_rdata ),
  .biu_csr_cmplt  (biu_csr_cmplt ),
  .biu_csr_op     (biu_csr_op    ),
  .biu_csr_rdata  (biu_csr_rdata ),
  .biu_csr_sel    (biu_csr_sel   ),
  .biu_csr_wdata  (biu_csr_wdata ),
  .biu_hpcp_cmplt (biu_hpcp_cmplt),
  .biu_hpcp_rdata (biu_hpcp_rdata),
  .cp0_biu_op     (cp0_biu_op    ),
  .cp0_biu_sel    (cp0_biu_sel   ),
  .cp0_biu_wdata  (cp0_biu_wdata ),
  .hpcp_biu_op    (hpcp_biu_op   ),
  .hpcp_biu_sel   (hpcp_biu_sel  ),
  .hpcp_biu_wdata (hpcp_biu_wdata)
);


// &Instance("ct_biu_bus_io_async"); @40
// &Instance("ct_biu_other_io_async"); @41
assign pad_biu_rack_ready = 1'b1;
assign pad_biu_back_ready = 1'b1;
//&Instance("ct_biu_bus_io_sync");
// &Instance("ct_biu_other_io_sync"); @46
ct_biu_other_io_sync  x_ct_biu_other_io_sync (
  .biu_cp0_apb_base      (biu_cp0_apb_base     ),
  .biu_cp0_coreid        (biu_cp0_coreid       ),
  .biu_cp0_me_int        (biu_cp0_me_int       ),
  .biu_cp0_ms_int        (biu_cp0_ms_int       ),
  .biu_cp0_mt_int        (biu_cp0_mt_int       ),
  .biu_cp0_rvba          (biu_cp0_rvba         ),
  .biu_cp0_se_int        (biu_cp0_se_int       ),
  .biu_cp0_ss_int        (biu_cp0_ss_int       ),
  .biu_cp0_st_int        (biu_cp0_st_int       ),
  .biu_csr_cmplt         (biu_csr_cmplt        ),
  .biu_csr_op            (biu_csr_op           ),
  .biu_csr_rdata         (biu_csr_rdata        ),
  .biu_csr_sel           (biu_csr_sel          ),
  .biu_csr_wdata         (biu_csr_wdata        ),
  .biu_had_coreid        (biu_had_coreid       ),
  .biu_had_sdb_req_b     (biu_had_sdb_req_b    ),
  .biu_hpcp_l2of_int     (biu_hpcp_l2of_int    ),
  .biu_hpcp_time         (biu_hpcp_time        ),
  .biu_mmu_smp_disable   (biu_mmu_smp_disable  ),
  .biu_pad_cnt_en        (biu_pad_cnt_en       ),
  .biu_pad_csr_sel       (biu_pad_csr_sel      ),
  .biu_pad_csr_wdata     (biu_pad_csr_wdata    ),
  .biu_pad_jdb_pm        (biu_pad_jdb_pm       ),
  .biu_pad_lpmd_b        (biu_pad_lpmd_b       ),
  .biu_xx_dbg_wakeup     (biu_xx_dbg_wakeup    ),
  .biu_xx_int_wakeup     (biu_xx_int_wakeup    ),
  .biu_xx_normal_work    (biu_xx_normal_work   ),
  .biu_xx_pmp_sel        (biu_xx_pmp_sel       ),
  .coreclk               (coreclk              ),
  .cp0_biu_icg_en        (cp0_biu_icg_en       ),
  .cp0_biu_lpmd_b        (cp0_biu_lpmd_b       ),
  .cpurst_b              (cpurst_b             ),
  .forever_coreclk       (forever_coreclk      ),
  .had_biu_jdb_pm        (had_biu_jdb_pm       ),
  .hpcp_biu_cnt_en       (hpcp_biu_cnt_en      ),
  .pad_biu_csr_cmplt     (pad_biu_csr_cmplt    ),
  .pad_biu_csr_rdata     (pad_biu_csr_rdata    ),
  .pad_biu_dbgrq_b       (pad_biu_dbgrq_b      ),
  .pad_biu_hpcp_l2of_int (pad_biu_hpcp_l2of_int),
  .pad_biu_me_int        (pad_biu_me_int       ),
  .pad_biu_ms_int        (pad_biu_ms_int       ),
  .pad_biu_mt_int        (pad_biu_mt_int       ),
  .pad_biu_se_int        (pad_biu_se_int       ),
  .pad_biu_ss_int        (pad_biu_ss_int       ),
  .pad_biu_st_int        (pad_biu_st_int       ),
  .pad_core_hartid       (pad_core_hartid      ),
  .pad_core_rvba         (pad_core_rvba        ),
  .pad_xx_apb_base       (pad_xx_apb_base      ),
  .pad_xx_time           (pad_xx_time          ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   )
);





// &ModuleEnd; @70
endmodule





