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




// &ModuleBeg; @22
module ct_ciu_top(
  apb_clk_en,
  apbif_had_pctrace_inv,
  biu_pad_araddr,
  biu_pad_arburst,
  biu_pad_arcache,
  biu_pad_arid,
  biu_pad_arlen,
  biu_pad_arlock,
  biu_pad_arprot,
  biu_pad_arsize,
  biu_pad_arvalid,
  biu_pad_awaddr,
  biu_pad_awburst,
  biu_pad_awcache,
  biu_pad_awid,
  biu_pad_awlen,
  biu_pad_awlock,
  biu_pad_awprot,
  biu_pad_awsize,
  biu_pad_awvalid,
  biu_pad_bready,
  biu_pad_cactive,
  biu_pad_csysack,
  biu_pad_rready,
  biu_pad_wdata,
  biu_pad_wlast,
  biu_pad_wstrb,
  biu_pad_wvalid,
  ciu_clint_icg_en,
  ciu_had_dbg_info,
  ciu_l2c_addr_bank_0,
  ciu_l2c_addr_bank_1,
  ciu_l2c_addr_vld_bank_0,
  ciu_l2c_addr_vld_bank_1,
  ciu_l2c_clr_cp_bank_0,
  ciu_l2c_clr_cp_bank_1,
  ciu_l2c_ctcq_req_bank_0,
  ciu_l2c_ctcq_req_bank_1,
  ciu_l2c_data_latency,
  ciu_l2c_data_setup,
  ciu_l2c_data_vld_bank_0,
  ciu_l2c_data_vld_bank_1,
  ciu_l2c_dca_addr_bank_0,
  ciu_l2c_dca_addr_bank_1,
  ciu_l2c_dca_req_bank_0,
  ciu_l2c_dca_req_bank_1,
  ciu_l2c_hpcp_bus_bank_0,
  ciu_l2c_hpcp_bus_bank_1,
  ciu_l2c_icc_mid_bank_0,
  ciu_l2c_icc_mid_bank_1,
  ciu_l2c_icc_type_bank_0,
  ciu_l2c_icc_type_bank_1,
  ciu_l2c_iprf,
  ciu_l2c_mid_bank_0,
  ciu_l2c_mid_bank_1,
  ciu_l2c_prf_ready,
  ciu_l2c_rdl_ready_bank_0,
  ciu_l2c_rdl_ready_bank_1,
  ciu_l2c_rst_req,
  ciu_l2c_set_cp_bank_0,
  ciu_l2c_set_cp_bank_1,
  ciu_l2c_sid_bank_0,
  ciu_l2c_sid_bank_1,
  ciu_l2c_snpl2_ready_bank_0,
  ciu_l2c_snpl2_ready_bank_1,
  ciu_l2c_src_bank_0,
  ciu_l2c_src_bank_1,
  ciu_l2c_tag_latency,
  ciu_l2c_tag_setup,
  ciu_l2c_tprf,
  ciu_l2c_type_bank_0,
  ciu_l2c_type_bank_1,
  ciu_l2c_wdata_bank_0,
  ciu_l2c_wdata_bank_1,
  ciu_plic_icg_en,
  ciu_sysio_icg_en,
  ciu_top_clk,
  ciu_xx_no_op,
  clk_en,
  core0_fifo_rst_b,
  core1_fifo_rst_b,
  cpurst_b,
  forever_cpuclk,
  ibiu0_pad_acready,
  ibiu0_pad_araddr,
  ibiu0_pad_arbar,
  ibiu0_pad_arburst,
  ibiu0_pad_arcache,
  ibiu0_pad_ardomain,
  ibiu0_pad_arid,
  ibiu0_pad_arlen,
  ibiu0_pad_arlock,
  ibiu0_pad_arprot,
  ibiu0_pad_arsize,
  ibiu0_pad_arsnoop,
  ibiu0_pad_aruser,
  ibiu0_pad_arvalid,
  ibiu0_pad_awaddr,
  ibiu0_pad_awbar,
  ibiu0_pad_awburst,
  ibiu0_pad_awcache,
  ibiu0_pad_awdomain,
  ibiu0_pad_awid,
  ibiu0_pad_awlen,
  ibiu0_pad_awlock,
  ibiu0_pad_awprot,
  ibiu0_pad_awsize,
  ibiu0_pad_awsnoop,
  ibiu0_pad_awunique,
  ibiu0_pad_awuser,
  ibiu0_pad_awvalid,
  ibiu0_pad_back,
  ibiu0_pad_bready,
  ibiu0_pad_cddata,
  ibiu0_pad_cderr,
  ibiu0_pad_cdlast,
  ibiu0_pad_cdvalid,
  ibiu0_pad_cnt_en,
  ibiu0_pad_crresp,
  ibiu0_pad_crvalid,
  ibiu0_pad_csr_sel,
  ibiu0_pad_csr_wdata,
  ibiu0_pad_jdb_pm,
  ibiu0_pad_lpmd_b,
  ibiu0_pad_rack,
  ibiu0_pad_rready,
  ibiu0_pad_wdata,
  ibiu0_pad_werr,
  ibiu0_pad_wlast,
  ibiu0_pad_wns,
  ibiu0_pad_wstrb,
  ibiu0_pad_wvalid,
  ibiu1_pad_acready,
  ibiu1_pad_araddr,
  ibiu1_pad_arbar,
  ibiu1_pad_arburst,
  ibiu1_pad_arcache,
  ibiu1_pad_ardomain,
  ibiu1_pad_arid,
  ibiu1_pad_arlen,
  ibiu1_pad_arlock,
  ibiu1_pad_arprot,
  ibiu1_pad_arsize,
  ibiu1_pad_arsnoop,
  ibiu1_pad_aruser,
  ibiu1_pad_arvalid,
  ibiu1_pad_awaddr,
  ibiu1_pad_awbar,
  ibiu1_pad_awburst,
  ibiu1_pad_awcache,
  ibiu1_pad_awdomain,
  ibiu1_pad_awid,
  ibiu1_pad_awlen,
  ibiu1_pad_awlock,
  ibiu1_pad_awprot,
  ibiu1_pad_awsize,
  ibiu1_pad_awsnoop,
  ibiu1_pad_awunique,
  ibiu1_pad_awuser,
  ibiu1_pad_awvalid,
  ibiu1_pad_back,
  ibiu1_pad_bready,
  ibiu1_pad_cddata,
  ibiu1_pad_cderr,
  ibiu1_pad_cdlast,
  ibiu1_pad_cdvalid,
  ibiu1_pad_cnt_en,
  ibiu1_pad_crresp,
  ibiu1_pad_crvalid,
  ibiu1_pad_csr_sel,
  ibiu1_pad_csr_wdata,
  ibiu1_pad_jdb_pm,
  ibiu1_pad_lpmd_b,
  ibiu1_pad_rack,
  ibiu1_pad_rready,
  ibiu1_pad_wdata,
  ibiu1_pad_werr,
  ibiu1_pad_wlast,
  ibiu1_pad_wns,
  ibiu1_pad_wstrb,
  ibiu1_pad_wvalid,
  l2c_ciu_addr_ready_bank_0,
  l2c_ciu_addr_ready_bank_1,
  l2c_ciu_cmplt_bank_0,
  l2c_ciu_cmplt_bank_1,
  l2c_ciu_cp_bank_0,
  l2c_ciu_cp_bank_1,
  l2c_ciu_ctcq_cmplt_bank_0,
  l2c_ciu_ctcq_cmplt_bank_1,
  l2c_ciu_ctcq_ready_bank_0,
  l2c_ciu_ctcq_ready_bank_1,
  l2c_ciu_data_bank_0,
  l2c_ciu_data_bank_1,
  l2c_ciu_data_ready_bank_0,
  l2c_ciu_data_ready_bank_1,
  l2c_ciu_data_ready_gate_bank_0,
  l2c_ciu_data_ready_gate_bank_1,
  l2c_ciu_dbg_info,
  l2c_ciu_dca_cmplt_bank_0,
  l2c_ciu_dca_cmplt_bank_1,
  l2c_ciu_dca_data_bank_0,
  l2c_ciu_dca_data_bank_1,
  l2c_ciu_dca_ready_bank_0,
  l2c_ciu_dca_ready_bank_1,
  l2c_ciu_hpcp_acc_inc_bank_0,
  l2c_ciu_hpcp_acc_inc_bank_1,
  l2c_ciu_hpcp_mid_bank_0,
  l2c_ciu_hpcp_mid_bank_1,
  l2c_ciu_hpcp_miss_inc_bank_0,
  l2c_ciu_hpcp_miss_inc_bank_1,
  l2c_ciu_prf_addr,
  l2c_ciu_prf_prot,
  l2c_ciu_prf_vld,
  l2c_ciu_rdl_addr_bank_0,
  l2c_ciu_rdl_addr_bank_1,
  l2c_ciu_rdl_dvld_bank_0,
  l2c_ciu_rdl_dvld_bank_1,
  l2c_ciu_rdl_mid_bank_0,
  l2c_ciu_rdl_mid_bank_1,
  l2c_ciu_rdl_prot_bank_0,
  l2c_ciu_rdl_prot_bank_1,
  l2c_ciu_rdl_rvld_bank_0,
  l2c_ciu_rdl_rvld_bank_1,
  l2c_ciu_resp_bank_0,
  l2c_ciu_resp_bank_1,
  l2c_ciu_sid_bank_0,
  l2c_ciu_sid_bank_1,
  l2c_ciu_snpl2_addr_bank_0,
  l2c_ciu_snpl2_addr_bank_1,
  l2c_ciu_snpl2_ini_sid_bank_0,
  l2c_ciu_snpl2_ini_sid_bank_1,
  l2c_ciu_snpl2_vld_bank_0,
  l2c_ciu_snpl2_vld_bank_1,
  l2c_had_dbg_info,
  l2c_icg_en,
  l2c_plic_ecc_int_vld,
  l2c_xx_no_op,
  pad_biu_arready,
  pad_biu_awready,
  pad_biu_bid,
  pad_biu_bresp,
  pad_biu_bvalid,
  pad_biu_csysreq,
  pad_biu_rdata,
  pad_biu_rid,
  pad_biu_rlast,
  pad_biu_rresp,
  pad_biu_rvalid,
  pad_biu_wready,
  pad_ibiu0_acaddr,
  pad_ibiu0_acprot,
  pad_ibiu0_acsnoop,
  pad_ibiu0_acvalid,
  pad_ibiu0_arready,
  pad_ibiu0_awready,
  pad_ibiu0_bid,
  pad_ibiu0_bresp,
  pad_ibiu0_bvalid,
  pad_ibiu0_cdready,
  pad_ibiu0_crready,
  pad_ibiu0_csr_cmplt,
  pad_ibiu0_csr_rdata,
  pad_ibiu0_dbgrq_b,
  pad_ibiu0_hpcp_l2of_int,
  pad_ibiu0_me_int,
  pad_ibiu0_ms_int,
  pad_ibiu0_mt_int,
  pad_ibiu0_rdata,
  pad_ibiu0_rid,
  pad_ibiu0_rlast,
  pad_ibiu0_rresp,
  pad_ibiu0_rvalid,
  pad_ibiu0_se_int,
  pad_ibiu0_ss_int,
  pad_ibiu0_st_int,
  pad_ibiu0_wns_awready,
  pad_ibiu0_wns_wready,
  pad_ibiu0_wready,
  pad_ibiu0_ws_awready,
  pad_ibiu0_ws_wready,
  pad_ibiu1_acaddr,
  pad_ibiu1_acprot,
  pad_ibiu1_acsnoop,
  pad_ibiu1_acvalid,
  pad_ibiu1_arready,
  pad_ibiu1_awready,
  pad_ibiu1_bid,
  pad_ibiu1_bresp,
  pad_ibiu1_bvalid,
  pad_ibiu1_cdready,
  pad_ibiu1_crready,
  pad_ibiu1_csr_cmplt,
  pad_ibiu1_csr_rdata,
  pad_ibiu1_dbgrq_b,
  pad_ibiu1_hpcp_l2of_int,
  pad_ibiu1_me_int,
  pad_ibiu1_ms_int,
  pad_ibiu1_mt_int,
  pad_ibiu1_rdata,
  pad_ibiu1_rid,
  pad_ibiu1_rlast,
  pad_ibiu1_rresp,
  pad_ibiu1_rvalid,
  pad_ibiu1_se_int,
  pad_ibiu1_ss_int,
  pad_ibiu1_st_int,
  pad_ibiu1_wns_awready,
  pad_ibiu1_wns_wready,
  pad_ibiu1_wready,
  pad_ibiu1_ws_awready,
  pad_ibiu1_ws_wready,
  pad_yy_icg_scan_en,
  paddr,
  penable,
  perr_clint,
  perr_had,
  perr_plic,
  perr_rmr,
  piu0_sysio_jdb_pm,
  piu0_sysio_lpmd_b,
  piu1_sysio_jdb_pm,
  piu1_sysio_lpmd_b,
  pprot,
  prdata_clint,
  prdata_had,
  prdata_plic,
  prdata_rmr,
  pready_clint,
  pready_had,
  pready_plic,
  pready_rmr,
  psel_clint,
  psel_had,
  psel_plic,
  psel_rmr,
  pwdata,
  pwrite,
  sysio_ciu_apb_base,
  sysio_l2c_flush_req,
  sysio_piu0_dbgrq_b,
  sysio_piu0_me_int,
  sysio_piu0_ms_int,
  sysio_piu0_mt_int,
  sysio_piu0_se_int,
  sysio_piu0_ss_int,
  sysio_piu0_st_int,
  sysio_piu1_dbgrq_b,
  sysio_piu1_me_int,
  sysio_piu1_ms_int,
  sysio_piu1_mt_int,
  sysio_piu1_se_int,
  sysio_piu1_ss_int,
  sysio_piu1_st_int
);

// &Ports; @23
input            apb_clk_en;                    
input            clk_en;                        
input            core0_fifo_rst_b;              
input            core1_fifo_rst_b;              
input            cpurst_b;                      
input            forever_cpuclk;                
input            ibiu0_pad_acready;             
input   [39 :0]  ibiu0_pad_araddr;              
input   [1  :0]  ibiu0_pad_arbar;               
input   [1  :0]  ibiu0_pad_arburst;             
input   [3  :0]  ibiu0_pad_arcache;             
input   [1  :0]  ibiu0_pad_ardomain;            
input   [4  :0]  ibiu0_pad_arid;                
input   [1  :0]  ibiu0_pad_arlen;               
input            ibiu0_pad_arlock;              
input   [2  :0]  ibiu0_pad_arprot;              
input   [2  :0]  ibiu0_pad_arsize;              
input   [3  :0]  ibiu0_pad_arsnoop;             
input   [2  :0]  ibiu0_pad_aruser;              
input            ibiu0_pad_arvalid;             
input   [39 :0]  ibiu0_pad_awaddr;              
input   [1  :0]  ibiu0_pad_awbar;               
input   [1  :0]  ibiu0_pad_awburst;             
input   [3  :0]  ibiu0_pad_awcache;             
input   [1  :0]  ibiu0_pad_awdomain;            
input   [4  :0]  ibiu0_pad_awid;                
input   [1  :0]  ibiu0_pad_awlen;               
input            ibiu0_pad_awlock;              
input   [2  :0]  ibiu0_pad_awprot;              
input   [2  :0]  ibiu0_pad_awsize;              
input   [2  :0]  ibiu0_pad_awsnoop;             
input            ibiu0_pad_awunique;            
input            ibiu0_pad_awuser;              
input            ibiu0_pad_awvalid;             
input            ibiu0_pad_back;                
input            ibiu0_pad_bready;              
input   [127:0]  ibiu0_pad_cddata;              
input            ibiu0_pad_cderr;               
input            ibiu0_pad_cdlast;              
input            ibiu0_pad_cdvalid;             
input   [3  :0]  ibiu0_pad_cnt_en;              
input   [4  :0]  ibiu0_pad_crresp;              
input            ibiu0_pad_crvalid;             
input            ibiu0_pad_csr_sel;             
input   [79 :0]  ibiu0_pad_csr_wdata;           
input            ibiu0_pad_jdb_pm;              
input            ibiu0_pad_lpmd_b;              
input            ibiu0_pad_rack;                
input            ibiu0_pad_rready;              
input   [127:0]  ibiu0_pad_wdata;               
input            ibiu0_pad_werr;                
input            ibiu0_pad_wlast;               
input            ibiu0_pad_wns;                 
input   [15 :0]  ibiu0_pad_wstrb;               
input            ibiu0_pad_wvalid;              
input            ibiu1_pad_acready;             
input   [39 :0]  ibiu1_pad_araddr;              
input   [1  :0]  ibiu1_pad_arbar;               
input   [1  :0]  ibiu1_pad_arburst;             
input   [3  :0]  ibiu1_pad_arcache;             
input   [1  :0]  ibiu1_pad_ardomain;            
input   [4  :0]  ibiu1_pad_arid;                
input   [1  :0]  ibiu1_pad_arlen;               
input            ibiu1_pad_arlock;              
input   [2  :0]  ibiu1_pad_arprot;              
input   [2  :0]  ibiu1_pad_arsize;              
input   [3  :0]  ibiu1_pad_arsnoop;             
input   [2  :0]  ibiu1_pad_aruser;              
input            ibiu1_pad_arvalid;             
input   [39 :0]  ibiu1_pad_awaddr;              
input   [1  :0]  ibiu1_pad_awbar;               
input   [1  :0]  ibiu1_pad_awburst;             
input   [3  :0]  ibiu1_pad_awcache;             
input   [1  :0]  ibiu1_pad_awdomain;            
input   [4  :0]  ibiu1_pad_awid;                
input   [1  :0]  ibiu1_pad_awlen;               
input            ibiu1_pad_awlock;              
input   [2  :0]  ibiu1_pad_awprot;              
input   [2  :0]  ibiu1_pad_awsize;              
input   [2  :0]  ibiu1_pad_awsnoop;             
input            ibiu1_pad_awunique;            
input            ibiu1_pad_awuser;              
input            ibiu1_pad_awvalid;             
input            ibiu1_pad_back;                
input            ibiu1_pad_bready;              
input   [127:0]  ibiu1_pad_cddata;              
input            ibiu1_pad_cderr;               
input            ibiu1_pad_cdlast;              
input            ibiu1_pad_cdvalid;             
input   [3  :0]  ibiu1_pad_cnt_en;              
input   [4  :0]  ibiu1_pad_crresp;              
input            ibiu1_pad_crvalid;             
input            ibiu1_pad_csr_sel;             
input   [79 :0]  ibiu1_pad_csr_wdata;           
input            ibiu1_pad_jdb_pm;              
input            ibiu1_pad_lpmd_b;              
input            ibiu1_pad_rack;                
input            ibiu1_pad_rready;              
input   [127:0]  ibiu1_pad_wdata;               
input            ibiu1_pad_werr;                
input            ibiu1_pad_wlast;               
input            ibiu1_pad_wns;                 
input   [15 :0]  ibiu1_pad_wstrb;               
input            ibiu1_pad_wvalid;              
input            l2c_ciu_addr_ready_bank_0;     
input            l2c_ciu_addr_ready_bank_1;     
input            l2c_ciu_cmplt_bank_0;          
input            l2c_ciu_cmplt_bank_1;          
input   [3  :0]  l2c_ciu_cp_bank_0;             
input   [3  :0]  l2c_ciu_cp_bank_1;             
input            l2c_ciu_ctcq_cmplt_bank_0;     
input            l2c_ciu_ctcq_cmplt_bank_1;     
input            l2c_ciu_ctcq_ready_bank_0;     
input            l2c_ciu_ctcq_ready_bank_1;     
input   [511:0]  l2c_ciu_data_bank_0;           
input   [511:0]  l2c_ciu_data_bank_1;           
input            l2c_ciu_data_ready_bank_0;     
input            l2c_ciu_data_ready_bank_1;     
input            l2c_ciu_data_ready_gate_bank_0; 
input            l2c_ciu_data_ready_gate_bank_1; 
input   [43 :0]  l2c_ciu_dbg_info;              
input            l2c_ciu_dca_cmplt_bank_0;      
input            l2c_ciu_dca_cmplt_bank_1;      
input   [127:0]  l2c_ciu_dca_data_bank_0;       
input   [127:0]  l2c_ciu_dca_data_bank_1;       
input            l2c_ciu_dca_ready_bank_0;      
input            l2c_ciu_dca_ready_bank_1;      
input   [1  :0]  l2c_ciu_hpcp_acc_inc_bank_0;   
input   [1  :0]  l2c_ciu_hpcp_acc_inc_bank_1;   
input   [2  :0]  l2c_ciu_hpcp_mid_bank_0;       
input   [2  :0]  l2c_ciu_hpcp_mid_bank_1;       
input   [1  :0]  l2c_ciu_hpcp_miss_inc_bank_0;  
input   [1  :0]  l2c_ciu_hpcp_miss_inc_bank_1;  
input   [33 :0]  l2c_ciu_prf_addr;              
input   [2  :0]  l2c_ciu_prf_prot;              
input            l2c_ciu_prf_vld;               
input   [32 :0]  l2c_ciu_rdl_addr_bank_0;       
input   [32 :0]  l2c_ciu_rdl_addr_bank_1;       
input            l2c_ciu_rdl_dvld_bank_0;       
input            l2c_ciu_rdl_dvld_bank_1;       
input   [2  :0]  l2c_ciu_rdl_mid_bank_0;        
input   [2  :0]  l2c_ciu_rdl_mid_bank_1;        
input   [2  :0]  l2c_ciu_rdl_prot_bank_0;       
input   [2  :0]  l2c_ciu_rdl_prot_bank_1;       
input            l2c_ciu_rdl_rvld_bank_0;       
input            l2c_ciu_rdl_rvld_bank_1;       
input   [4  :0]  l2c_ciu_resp_bank_0;           
input   [4  :0]  l2c_ciu_resp_bank_1;           
input   [4  :0]  l2c_ciu_sid_bank_0;            
input   [4  :0]  l2c_ciu_sid_bank_1;            
input   [32 :0]  l2c_ciu_snpl2_addr_bank_0;     
input   [32 :0]  l2c_ciu_snpl2_addr_bank_1;     
input   [4  :0]  l2c_ciu_snpl2_ini_sid_bank_0;  
input   [4  :0]  l2c_ciu_snpl2_ini_sid_bank_1;  
input            l2c_ciu_snpl2_vld_bank_0;      
input            l2c_ciu_snpl2_vld_bank_1;      
input            l2c_xx_no_op;                  
input            pad_biu_arready;               
input            pad_biu_awready;               
input   [7  :0]  pad_biu_bid;                   
input   [1  :0]  pad_biu_bresp;                 
input            pad_biu_bvalid;                
input            pad_biu_csysreq;               
input   [127:0]  pad_biu_rdata;                 
input   [7  :0]  pad_biu_rid;                   
input            pad_biu_rlast;                 
input   [1  :0]  pad_biu_rresp;                 
input            pad_biu_rvalid;                
input            pad_biu_wready;                
input            pad_yy_icg_scan_en;            
input            perr_clint;                    
input            perr_had;                      
input            perr_plic;                     
input            perr_rmr;                      
input   [31 :0]  prdata_clint;                  
input   [31 :0]  prdata_had;                    
input   [31 :0]  prdata_plic;                   
input   [31 :0]  prdata_rmr;                    
input            pready_clint;                  
input            pready_had;                    
input            pready_plic;                   
input            pready_rmr;                    
input   [39 :0]  sysio_ciu_apb_base;            
input            sysio_l2c_flush_req;           
input            sysio_piu0_dbgrq_b;            
input            sysio_piu0_me_int;             
input            sysio_piu0_ms_int;             
input            sysio_piu0_mt_int;             
input            sysio_piu0_se_int;             
input            sysio_piu0_ss_int;             
input            sysio_piu0_st_int;             
input            sysio_piu1_dbgrq_b;            
input            sysio_piu1_me_int;             
input            sysio_piu1_ms_int;             
input            sysio_piu1_mt_int;             
input            sysio_piu1_se_int;             
input            sysio_piu1_ss_int;             
input            sysio_piu1_st_int;             
output           apbif_had_pctrace_inv;         
output  [39 :0]  biu_pad_araddr;                
output  [1  :0]  biu_pad_arburst;               
output  [3  :0]  biu_pad_arcache;               
output  [7  :0]  biu_pad_arid;                  
output  [7  :0]  biu_pad_arlen;                 
output           biu_pad_arlock;                
output  [2  :0]  biu_pad_arprot;                
output  [2  :0]  biu_pad_arsize;                
output           biu_pad_arvalid;               
output  [39 :0]  biu_pad_awaddr;                
output  [1  :0]  biu_pad_awburst;               
output  [3  :0]  biu_pad_awcache;               
output  [7  :0]  biu_pad_awid;                  
output  [7  :0]  biu_pad_awlen;                 
output           biu_pad_awlock;                
output  [2  :0]  biu_pad_awprot;                
output  [2  :0]  biu_pad_awsize;                
output           biu_pad_awvalid;               
output           biu_pad_bready;                
output           biu_pad_cactive;               
output           biu_pad_csysack;               
output           biu_pad_rready;                
output  [127:0]  biu_pad_wdata;                 
output           biu_pad_wlast;                 
output  [15 :0]  biu_pad_wstrb;                 
output           biu_pad_wvalid;                
output           ciu_clint_icg_en;              
output  [292:0]  ciu_had_dbg_info;              
output  [32 :0]  ciu_l2c_addr_bank_0;           
output  [32 :0]  ciu_l2c_addr_bank_1;           
output           ciu_l2c_addr_vld_bank_0;       
output           ciu_l2c_addr_vld_bank_1;       
output  [3  :0]  ciu_l2c_clr_cp_bank_0;         
output  [3  :0]  ciu_l2c_clr_cp_bank_1;         
output           ciu_l2c_ctcq_req_bank_0;       
output           ciu_l2c_ctcq_req_bank_1;       
output  [2  :0]  ciu_l2c_data_latency;          
output           ciu_l2c_data_setup;            
output           ciu_l2c_data_vld_bank_0;       
output           ciu_l2c_data_vld_bank_1;       
output  [32 :0]  ciu_l2c_dca_addr_bank_0;       
output  [32 :0]  ciu_l2c_dca_addr_bank_1;       
output           ciu_l2c_dca_req_bank_0;        
output           ciu_l2c_dca_req_bank_1;        
output  [2  :0]  ciu_l2c_hpcp_bus_bank_0;       
output  [2  :0]  ciu_l2c_hpcp_bus_bank_1;       
output  [2  :0]  ciu_l2c_icc_mid_bank_0;        
output  [2  :0]  ciu_l2c_icc_mid_bank_1;        
output  [1  :0]  ciu_l2c_icc_type_bank_0;       
output  [1  :0]  ciu_l2c_icc_type_bank_1;       
output  [1  :0]  ciu_l2c_iprf;                  
output  [2  :0]  ciu_l2c_mid_bank_0;            
output  [2  :0]  ciu_l2c_mid_bank_1;            
output           ciu_l2c_prf_ready;             
output           ciu_l2c_rdl_ready_bank_0;      
output           ciu_l2c_rdl_ready_bank_1;      
output           ciu_l2c_rst_req;               
output  [3  :0]  ciu_l2c_set_cp_bank_0;         
output  [3  :0]  ciu_l2c_set_cp_bank_1;         
output  [4  :0]  ciu_l2c_sid_bank_0;            
output  [4  :0]  ciu_l2c_sid_bank_1;            
output           ciu_l2c_snpl2_ready_bank_0;    
output           ciu_l2c_snpl2_ready_bank_1;    
output  [1  :0]  ciu_l2c_src_bank_0;            
output  [1  :0]  ciu_l2c_src_bank_1;            
output  [2  :0]  ciu_l2c_tag_latency;           
output           ciu_l2c_tag_setup;             
output           ciu_l2c_tprf;                  
output  [12 :0]  ciu_l2c_type_bank_0;           
output  [12 :0]  ciu_l2c_type_bank_1;           
output  [511:0]  ciu_l2c_wdata_bank_0;          
output  [511:0]  ciu_l2c_wdata_bank_1;          
output           ciu_plic_icg_en;               
output           ciu_sysio_icg_en;              
output           ciu_top_clk;                   
output           ciu_xx_no_op;                  
output  [43 :0]  l2c_had_dbg_info;              
output           l2c_icg_en;                    
output           l2c_plic_ecc_int_vld;          
output  [39 :0]  pad_ibiu0_acaddr;              
output  [2  :0]  pad_ibiu0_acprot;              
output  [3  :0]  pad_ibiu0_acsnoop;             
output           pad_ibiu0_acvalid;             
output           pad_ibiu0_arready;             
output           pad_ibiu0_awready;             
output  [4  :0]  pad_ibiu0_bid;                 
output  [1  :0]  pad_ibiu0_bresp;               
output           pad_ibiu0_bvalid;              
output           pad_ibiu0_cdready;             
output           pad_ibiu0_crready;             
output           pad_ibiu0_csr_cmplt;           
output  [127:0]  pad_ibiu0_csr_rdata;           
output           pad_ibiu0_dbgrq_b;             
output  [3  :0]  pad_ibiu0_hpcp_l2of_int;       
output           pad_ibiu0_me_int;              
output           pad_ibiu0_ms_int;              
output           pad_ibiu0_mt_int;              
output  [127:0]  pad_ibiu0_rdata;               
output  [4  :0]  pad_ibiu0_rid;                 
output           pad_ibiu0_rlast;               
output  [3  :0]  pad_ibiu0_rresp;               
output           pad_ibiu0_rvalid;              
output           pad_ibiu0_se_int;              
output           pad_ibiu0_ss_int;              
output           pad_ibiu0_st_int;              
output           pad_ibiu0_wns_awready;         
output           pad_ibiu0_wns_wready;          
output           pad_ibiu0_wready;              
output           pad_ibiu0_ws_awready;          
output           pad_ibiu0_ws_wready;           
output  [39 :0]  pad_ibiu1_acaddr;              
output  [2  :0]  pad_ibiu1_acprot;              
output  [3  :0]  pad_ibiu1_acsnoop;             
output           pad_ibiu1_acvalid;             
output           pad_ibiu1_arready;             
output           pad_ibiu1_awready;             
output  [4  :0]  pad_ibiu1_bid;                 
output  [1  :0]  pad_ibiu1_bresp;               
output           pad_ibiu1_bvalid;              
output           pad_ibiu1_cdready;             
output           pad_ibiu1_crready;             
output           pad_ibiu1_csr_cmplt;           
output  [127:0]  pad_ibiu1_csr_rdata;           
output           pad_ibiu1_dbgrq_b;             
output  [3  :0]  pad_ibiu1_hpcp_l2of_int;       
output           pad_ibiu1_me_int;              
output           pad_ibiu1_ms_int;              
output           pad_ibiu1_mt_int;              
output  [127:0]  pad_ibiu1_rdata;               
output  [4  :0]  pad_ibiu1_rid;                 
output           pad_ibiu1_rlast;               
output  [3  :0]  pad_ibiu1_rresp;               
output           pad_ibiu1_rvalid;              
output           pad_ibiu1_se_int;              
output           pad_ibiu1_ss_int;              
output           pad_ibiu1_st_int;              
output           pad_ibiu1_wns_awready;         
output           pad_ibiu1_wns_wready;          
output           pad_ibiu1_wready;              
output           pad_ibiu1_ws_awready;          
output           pad_ibiu1_ws_wready;           
output  [31 :0]  paddr;                         
output           penable;                       
output  [1  :0]  piu0_sysio_jdb_pm;             
output  [1  :0]  piu0_sysio_lpmd_b;             
output  [1  :0]  piu1_sysio_jdb_pm;             
output  [1  :0]  piu1_sysio_lpmd_b;             
output  [1  :0]  pprot;                         
output           psel_clint;                    
output           psel_had;                      
output           psel_plic;                     
output           psel_rmr;                      
output  [31 :0]  pwdata;                        
output           pwrite;                        

// &Regs; @24
reg              ciu_top_clk_en_f;              

// &Wires; @25
wire             apb_clk_en;                    
wire             apbif_had_pctrace_inv;         
wire             apbif_ncq_ar_grant;            
wire             apbif_ncq_aw_grant;            
wire    [7  :0]  apbif_ncq_bid;                 
wire    [1  :0]  apbif_ncq_bresp;               
wire             apbif_ncq_bvalid;              
wire    [127:0]  apbif_ncq_rdata;               
wire    [7  :0]  apbif_ncq_rid;                 
wire             apbif_ncq_rlast;               
wire    [1  :0]  apbif_ncq_rresp;               
wire             apbif_ncq_rvalid;              
wire             apbif_ncq_w_grant;             
wire    [39 :0]  biu_pad_araddr;                
wire    [1  :0]  biu_pad_arburst;               
wire    [3  :0]  biu_pad_arcache;               
wire    [7  :0]  biu_pad_arid;                  
wire    [7  :0]  biu_pad_arlen;                 
wire             biu_pad_arlock;                
wire    [2  :0]  biu_pad_arprot;                
wire    [2  :0]  biu_pad_arsize;                
wire             biu_pad_arvalid;               
wire    [39 :0]  biu_pad_awaddr;                
wire    [1  :0]  biu_pad_awburst;               
wire    [3  :0]  biu_pad_awcache;               
wire    [7  :0]  biu_pad_awid;                  
wire    [7  :0]  biu_pad_awlen;                 
wire             biu_pad_awlock;                
wire    [2  :0]  biu_pad_awprot;                
wire    [2  :0]  biu_pad_awsize;                
wire             biu_pad_awvalid;               
wire             biu_pad_back;                  
wire             biu_pad_bready;                
wire             biu_pad_cactive;               
wire             biu_pad_csysack;               
wire             biu_pad_rack;                  
wire             biu_pad_rready;                
wire    [127:0]  biu_pad_wdata;                 
wire             biu_pad_wlast;                 
wire    [15 :0]  biu_pad_wstrb;                 
wire             biu_pad_wvalid;                
wire             bmbif_ctcq_bar_req;            
wire    [2  :0]  bmbif_ctcq_mid;                
wire    [8  :0]  bmbif_ctcq_req_bus;            
wire             bmbif_ncq_bar_req;             
wire    [2  :0]  bmbif_ncq_mid;                 
wire    [8  :0]  bmbif_ncq_req_bus;             
wire             bmbif_piu0_ctcq_grant;         
wire             bmbif_piu0_ncq_grant;          
wire             bmbif_piu0_snb0_grant;         
wire             bmbif_piu0_snb1_grant;         
wire             bmbif_piu1_ctcq_grant;         
wire             bmbif_piu1_ncq_grant;          
wire             bmbif_piu1_snb0_grant;         
wire             bmbif_piu1_snb1_grant;         
wire             bmbif_piu2_ctcq_grant;         
wire             bmbif_piu2_ncq_grant;          
wire             bmbif_piu2_snb0_grant;         
wire             bmbif_piu2_snb1_grant;         
wire             bmbif_piu3_ctcq_grant;         
wire             bmbif_piu3_ncq_grant;          
wire             bmbif_piu3_snb0_grant;         
wire             bmbif_piu3_snb1_grant;         
wire             bmbif_snb0_bar_req;            
wire    [2  :0]  bmbif_snb0_mid;                
wire    [8  :0]  bmbif_snb0_req_bus;            
wire             bmbif_snb1_bar_req;            
wire    [2  :0]  bmbif_snb1_mid;                
wire    [8  :0]  bmbif_snb1_req_bus;            
wire             ciu_apbif_had_pctrace_inv;     
wire             ciu_chr2_bar_dis;              
wire             ciu_chr2_dvm_dis;              
wire             ciu_chr2_sf_dis;               
wire             ciu_clint_icg_en;              
wire    [292:0]  ciu_dbg_info;                  
wire             ciu_global_icg_en;             
wire    [292:0]  ciu_had_dbg_info;              
wire             ciu_icg_en;                    
wire    [32 :0]  ciu_l2c_addr_bank_0;           
wire    [32 :0]  ciu_l2c_addr_bank_1;           
wire             ciu_l2c_addr_vld_bank_0;       
wire             ciu_l2c_addr_vld_bank_1;       
wire    [3  :0]  ciu_l2c_clr_cp_bank_0;         
wire    [3  :0]  ciu_l2c_clr_cp_bank_1;         
wire             ciu_l2c_ctcq_req_bank_0;       
wire             ciu_l2c_ctcq_req_bank_1;       
wire    [2  :0]  ciu_l2c_data_latency;          
wire             ciu_l2c_data_setup;            
wire             ciu_l2c_data_vld_bank_0;       
wire             ciu_l2c_data_vld_bank_1;       
wire    [32 :0]  ciu_l2c_dca_addr_bank_0;       
wire    [32 :0]  ciu_l2c_dca_addr_bank_1;       
wire             ciu_l2c_dca_req_bank_0;        
wire             ciu_l2c_dca_req_bank_1;        
wire    [2  :0]  ciu_l2c_hpcp_bus_bank_0;       
wire    [2  :0]  ciu_l2c_hpcp_bus_bank_1;       
wire    [2  :0]  ciu_l2c_icc_mid_bank_0;        
wire    [2  :0]  ciu_l2c_icc_mid_bank_1;        
wire    [1  :0]  ciu_l2c_icc_type_bank_0;       
wire    [1  :0]  ciu_l2c_icc_type_bank_1;       
wire    [1  :0]  ciu_l2c_iprf;                  
wire    [2  :0]  ciu_l2c_mid_bank_0;            
wire    [2  :0]  ciu_l2c_mid_bank_1;            
wire             ciu_l2c_prf_ready;             
wire             ciu_l2c_rdl_ready_bank_0;      
wire             ciu_l2c_rdl_ready_bank_1;      
wire             ciu_l2c_rst_req;               
wire    [3  :0]  ciu_l2c_set_cp_bank_0;         
wire    [3  :0]  ciu_l2c_set_cp_bank_1;         
wire    [4  :0]  ciu_l2c_sid_bank_0;            
wire    [4  :0]  ciu_l2c_sid_bank_1;            
wire             ciu_l2c_snpl2_ready_bank_0;    
wire             ciu_l2c_snpl2_ready_bank_1;    
wire    [1  :0]  ciu_l2c_src_bank_0;            
wire    [1  :0]  ciu_l2c_src_bank_1;            
wire    [2  :0]  ciu_l2c_tag_latency;           
wire             ciu_l2c_tag_setup;             
wire             ciu_l2c_tprf;                  
wire    [12 :0]  ciu_l2c_type_bank_0;           
wire    [12 :0]  ciu_l2c_type_bank_1;           
wire    [511:0]  ciu_l2c_wdata_bank_0;          
wire    [511:0]  ciu_l2c_wdata_bank_1;          
wire             ciu_no_op;                     
wire             ciu_plic_icg_en;               
wire             ciu_so_ostd_dis;               
wire             ciu_sysio_icg_en;              
wire             ciu_top_clk;                   
wire             ciu_xx_no_op;                  
wire    [3  :0]  ciu_xx_smpen;                  
wire             clk_en;                        
wire             core0_fifo_rst_b;              
wire    [31 :0]  core0_prdata_l2pmp;            
wire             core0_req_gate;                
wire             core1_fifo_rst_b;              
wire    [31 :0]  core1_prdata_l2pmp;            
wire             core1_req_gate;                
wire    [31 :0]  core2_prdata_l2pmp;            
wire             core2_req_gate;                
wire    [31 :0]  core3_prdata_l2pmp;            
wire             core3_req_gate;                
wire             core_req_gate;                 
wire             cpurst_b;                      
wire             ctcq_bmbif_bar_grant;          
wire    [55 :0]  ctcq_dbg_info;                 
wire    [39 :0]  ctcq_ebiu_araddr;              
wire    [1  :0]  ctcq_ebiu_arbar;               
wire    [1  :0]  ctcq_ebiu_arburst;             
wire    [3  :0]  ctcq_ebiu_arcache;             
wire    [1  :0]  ctcq_ebiu_ardomain;            
wire    [5  :0]  ctcq_ebiu_arid;                
wire    [7  :0]  ctcq_ebiu_arlen;               
wire             ctcq_ebiu_arlock;              
wire    [2  :0]  ctcq_ebiu_arprot;              
wire    [2  :0]  ctcq_ebiu_arsize;              
wire    [3  :0]  ctcq_ebiu_arsnoop;             
wire             ctcq_ebiu_arvalid;             
wire             ctcq_ebiu_r_grant;             
wire             ctcq_ebiuif_ac_grant;          
wire    [4  :0]  ctcq_ebiuif_crresp;            
wire             ctcq_ebiuif_crvalid;           
wire             ctcq_l2c_addr_req;             
wire    [1  :0]  ctcq_l2c_req_type;             
wire    [54 :0]  ctcq_piu0_acbus;               
wire             ctcq_piu0_acvalid;             
wire             ctcq_piu0_ar_grant;            
wire             ctcq_piu0_bar_cmplt;           
wire             ctcq_piu0_cr_grant;            
wire             ctcq_piu0_rvalid;              
wire    [54 :0]  ctcq_piu1_acbus;               
wire             ctcq_piu1_acvalid;             
wire             ctcq_piu1_ar_grant;            
wire             ctcq_piu1_bar_cmplt;           
wire             ctcq_piu1_cr_grant;            
wire             ctcq_piu1_rvalid;              
wire    [54 :0]  ctcq_piu2_acbus;               
wire             ctcq_piu2_acvalid;             
wire             ctcq_piu2_ar_grant;            
wire             ctcq_piu2_bar_cmplt;           
wire             ctcq_piu2_cr_grant;            
wire             ctcq_piu2_rvalid;              
wire    [54 :0]  ctcq_piu3_acbus;               
wire             ctcq_piu3_acvalid;             
wire             ctcq_piu3_ar_grant;            
wire             ctcq_piu3_bar_cmplt;           
wire             ctcq_piu3_cr_grant;            
wire             ctcq_piu3_rvalid;              
wire    [534:0]  ctcq_piux_rbus;                
wire             ctcq_xx_no_op;                 
wire             device0_req_gate;              
wire             ebiu_ctcq_ar_grant;            
wire    [5  :0]  ebiu_ctcq_rid;                 
wire             ebiu_ctcq_rvalid;              
wire    [39 :0]  ebiu_ebiuif_acaddr;            
wire    [4  :0]  ebiu_ebiuif_acid;              
wire    [2  :0]  ebiu_ebiuif_acprot;            
wire    [3  :0]  ebiu_ebiuif_acsnoop;           
wire             ebiu_ebiuif_acvalid;           
wire             ebiu_ebiuif_ar_grant;          
wire             ebiu_ebiuif_ar_grant_gate;     
wire             ebiu_ebiuif_cd_grant;          
wire             ebiu_ebiuif_cr_grant;          
wire    [23 :0]  ebiu_ebiuif_entry_sel;         
wire    [127:0]  ebiu_ebiuif_rdata;             
wire             ebiu_ebiuif_rlast;             
wire    [3  :0]  ebiu_ebiuif_rresp;             
wire             ebiu_ebiuif_snb0_rvalid;       
wire             ebiu_ebiuif_snb1_rvalid;       
wire             ebiu_ncq_ar_grant;             
wire             ebiu_ncq_ar_grant_gate;        
wire             ebiu_ncq_aw_grant;             
wire             ebiu_ncq_aw_grant_gated;       
wire    [7  :0]  ebiu_ncq_bid;                  
wire    [1  :0]  ebiu_ncq_bresp;                
wire             ebiu_ncq_bvalid;               
wire    [127:0]  ebiu_ncq_rdata;                
wire    [7  :0]  ebiu_ncq_rid;                  
wire             ebiu_ncq_rlast;                
wire    [1  :0]  ebiu_ncq_rresp;                
wire             ebiu_ncq_rvalid;               
wire             ebiu_ncq_w_grant;              
wire             ebiu_piu0_no_op;               
wire             ebiu_piu1_no_op;               
wire             ebiu_piu2_no_op;               
wire             ebiu_piu3_no_op;               
wire             ebiu_vb_aw_grant;              
wire             ebiu_vb_aw_grant_gated;        
wire    [4  :0]  ebiu_vb_bid;                   
wire    [1  :0]  ebiu_vb_bresp;                 
wire             ebiu_vb_bvalid;                
wire             ebiu_vb_w_grant;               
wire             ebiu_xx_no_op;                 
wire    [39 :0]  ebiuif_ctcq_acaddr;            
wire    [4  :0]  ebiuif_ctcq_acid;              
wire    [3  :0]  ebiuif_ctcq_acsnoop;           
wire             ebiuif_ctcq_acvalid;           
wire             ebiuif_ctcq_cr_grant;          
wire             ebiuif_ebiu_ac_grant;          
wire    [39 :0]  ebiuif_ebiu_araddr;            
wire    [1  :0]  ebiuif_ebiu_arbar;             
wire    [1  :0]  ebiuif_ebiu_arburst;           
wire    [3  :0]  ebiuif_ebiu_arcache;           
wire    [1  :0]  ebiuif_ebiu_ardomain;          
wire    [5  :0]  ebiuif_ebiu_arid;              
wire    [7  :0]  ebiuif_ebiu_arlen;             
wire             ebiuif_ebiu_arlock;            
wire    [2  :0]  ebiuif_ebiu_arprot;            
wire    [2  :0]  ebiuif_ebiu_arsize;            
wire    [3  :0]  ebiuif_ebiu_arsnoop;           
wire             ebiuif_ebiu_arvalid;           
wire    [127:0]  ebiuif_ebiu_cddata;            
wire             ebiuif_ebiu_cdlast;            
wire             ebiuif_ebiu_cdvalid;           
wire    [4  :0]  ebiuif_ebiu_crresp;            
wire             ebiuif_ebiu_crvalid;           
wire             ebiuif_ebiu_r_grant;           
wire             ebiuif_snb0_acvalid;           
wire             ebiuif_snb0_ar_grant;          
wire             ebiuif_snb0_ar_grant_gate;     
wire             ebiuif_snb0_rvalid;            
wire             ebiuif_snb1_acvalid;           
wire             ebiuif_snb1_ar_grant;          
wire             ebiuif_snb1_ar_grant_gate;     
wire             ebiuif_snb1_rvalid;            
wire    [70 :0]  ebiuif_snbx_acbus;             
wire    [7  :0]  ebiuif_vb_index;               
wire    [23 :0]  ebiuif_xx_entry_sel;           
wire    [127:0]  ebiuif_xx_rdata;               
wire             ebiuif_xx_rlast;               
wire    [3  :0]  ebiuif_xx_rresp;               
wire             forever_cpuclk;                
wire             ibiu0_pad_acready;             
wire    [39 :0]  ibiu0_pad_araddr;              
wire    [1  :0]  ibiu0_pad_arbar;               
wire    [1  :0]  ibiu0_pad_arburst;             
wire    [3  :0]  ibiu0_pad_arcache;             
wire    [1  :0]  ibiu0_pad_ardomain;            
wire    [4  :0]  ibiu0_pad_arid;                
wire    [1  :0]  ibiu0_pad_arlen;               
wire             ibiu0_pad_arlock;              
wire    [2  :0]  ibiu0_pad_arprot;              
wire    [2  :0]  ibiu0_pad_arsize;              
wire    [3  :0]  ibiu0_pad_arsnoop;             
wire    [2  :0]  ibiu0_pad_aruser;              
wire             ibiu0_pad_arvalid;             
wire    [39 :0]  ibiu0_pad_awaddr;              
wire    [1  :0]  ibiu0_pad_awbar;               
wire    [1  :0]  ibiu0_pad_awburst;             
wire    [3  :0]  ibiu0_pad_awcache;             
wire    [1  :0]  ibiu0_pad_awdomain;            
wire    [4  :0]  ibiu0_pad_awid;                
wire    [1  :0]  ibiu0_pad_awlen;               
wire             ibiu0_pad_awlock;              
wire    [2  :0]  ibiu0_pad_awprot;              
wire    [2  :0]  ibiu0_pad_awsize;              
wire    [2  :0]  ibiu0_pad_awsnoop;             
wire             ibiu0_pad_awunique;            
wire             ibiu0_pad_awuser;              
wire             ibiu0_pad_awvalid;             
wire             ibiu0_pad_back;                
wire             ibiu0_pad_bready;              
wire    [127:0]  ibiu0_pad_cddata;              
wire             ibiu0_pad_cderr;               
wire             ibiu0_pad_cdlast;              
wire             ibiu0_pad_cdvalid;             
wire    [3  :0]  ibiu0_pad_cnt_en;              
wire    [4  :0]  ibiu0_pad_crresp;              
wire             ibiu0_pad_crvalid;             
wire             ibiu0_pad_csr_sel;             
wire    [79 :0]  ibiu0_pad_csr_wdata;           
wire             ibiu0_pad_jdb_pm;              
wire             ibiu0_pad_lpmd_b;              
wire             ibiu0_pad_rack;                
wire             ibiu0_pad_rready;              
wire    [127:0]  ibiu0_pad_wdata;               
wire             ibiu0_pad_werr;                
wire             ibiu0_pad_wlast;               
wire             ibiu0_pad_wns;                 
wire    [15 :0]  ibiu0_pad_wstrb;               
wire             ibiu0_pad_wvalid;              
wire             ibiu1_pad_acready;             
wire    [39 :0]  ibiu1_pad_araddr;              
wire    [1  :0]  ibiu1_pad_arbar;               
wire    [1  :0]  ibiu1_pad_arburst;             
wire    [3  :0]  ibiu1_pad_arcache;             
wire    [1  :0]  ibiu1_pad_ardomain;            
wire    [4  :0]  ibiu1_pad_arid;                
wire    [1  :0]  ibiu1_pad_arlen;               
wire             ibiu1_pad_arlock;              
wire    [2  :0]  ibiu1_pad_arprot;              
wire    [2  :0]  ibiu1_pad_arsize;              
wire    [3  :0]  ibiu1_pad_arsnoop;             
wire    [2  :0]  ibiu1_pad_aruser;              
wire             ibiu1_pad_arvalid;             
wire    [39 :0]  ibiu1_pad_awaddr;              
wire    [1  :0]  ibiu1_pad_awbar;               
wire    [1  :0]  ibiu1_pad_awburst;             
wire    [3  :0]  ibiu1_pad_awcache;             
wire    [1  :0]  ibiu1_pad_awdomain;            
wire    [4  :0]  ibiu1_pad_awid;                
wire    [1  :0]  ibiu1_pad_awlen;               
wire             ibiu1_pad_awlock;              
wire    [2  :0]  ibiu1_pad_awprot;              
wire    [2  :0]  ibiu1_pad_awsize;              
wire    [2  :0]  ibiu1_pad_awsnoop;             
wire             ibiu1_pad_awunique;            
wire             ibiu1_pad_awuser;              
wire             ibiu1_pad_awvalid;             
wire             ibiu1_pad_back;                
wire             ibiu1_pad_bready;              
wire    [127:0]  ibiu1_pad_cddata;              
wire             ibiu1_pad_cderr;               
wire             ibiu1_pad_cdlast;              
wire             ibiu1_pad_cdvalid;             
wire    [3  :0]  ibiu1_pad_cnt_en;              
wire    [4  :0]  ibiu1_pad_crresp;              
wire             ibiu1_pad_crvalid;             
wire             ibiu1_pad_csr_sel;             
wire    [79 :0]  ibiu1_pad_csr_wdata;           
wire             ibiu1_pad_jdb_pm;              
wire             ibiu1_pad_lpmd_b;              
wire             ibiu1_pad_rack;                
wire             ibiu1_pad_rready;              
wire    [127:0]  ibiu1_pad_wdata;               
wire             ibiu1_pad_werr;                
wire             ibiu1_pad_wlast;               
wire             ibiu1_pad_wns;                 
wire    [15 :0]  ibiu1_pad_wstrb;               
wire             ibiu1_pad_wvalid;              
wire    [67 :0]  l2c0_vb_awbus;                 
wire             l2c0_vb_awvalid;               
wire    [2  :0]  l2c0_vb_mid;                   
wire    [1  :0]  l2c0_vb_vid;                   
wire    [534:0]  l2c0_vb_wbus;                  
wire             l2c0_vb_wvalid;                
wire    [67 :0]  l2c1_vb_awbus;                 
wire             l2c1_vb_awvalid;               
wire    [2  :0]  l2c1_vb_mid;                   
wire    [1  :0]  l2c1_vb_vid;                   
wire    [534:0]  l2c1_vb_wbus;                  
wire             l2c1_vb_wvalid;                
wire             l2c_ciu_addr_ready_bank_0;     
wire             l2c_ciu_addr_ready_bank_1;     
wire             l2c_ciu_cmplt_bank_0;          
wire             l2c_ciu_cmplt_bank_1;          
wire    [3  :0]  l2c_ciu_cp_bank_0;             
wire    [3  :0]  l2c_ciu_cp_bank_1;             
wire             l2c_ciu_ctcq_cmplt_bank_0;     
wire             l2c_ciu_ctcq_cmplt_bank_1;     
wire             l2c_ciu_ctcq_ready_bank_0;     
wire             l2c_ciu_ctcq_ready_bank_1;     
wire    [511:0]  l2c_ciu_data_bank_0;           
wire    [511:0]  l2c_ciu_data_bank_1;           
wire             l2c_ciu_data_ready_bank_0;     
wire             l2c_ciu_data_ready_bank_1;     
wire             l2c_ciu_data_ready_gate_bank_0; 
wire             l2c_ciu_data_ready_gate_bank_1; 
wire    [43 :0]  l2c_ciu_dbg_info;              
wire             l2c_ciu_dca_cmplt_bank_0;      
wire             l2c_ciu_dca_cmplt_bank_1;      
wire    [127:0]  l2c_ciu_dca_data_bank_0;       
wire    [127:0]  l2c_ciu_dca_data_bank_1;       
wire             l2c_ciu_dca_ready_bank_0;      
wire             l2c_ciu_dca_ready_bank_1;      
wire    [1  :0]  l2c_ciu_hpcp_acc_inc_bank_0;   
wire    [1  :0]  l2c_ciu_hpcp_acc_inc_bank_1;   
wire    [2  :0]  l2c_ciu_hpcp_mid_bank_0;       
wire    [2  :0]  l2c_ciu_hpcp_mid_bank_1;       
wire    [1  :0]  l2c_ciu_hpcp_miss_inc_bank_0;  
wire    [1  :0]  l2c_ciu_hpcp_miss_inc_bank_1;  
wire    [33 :0]  l2c_ciu_prf_addr;              
wire    [2  :0]  l2c_ciu_prf_prot;              
wire             l2c_ciu_prf_vld;               
wire    [32 :0]  l2c_ciu_rdl_addr_bank_0;       
wire    [32 :0]  l2c_ciu_rdl_addr_bank_1;       
wire             l2c_ciu_rdl_dvld_bank_0;       
wire             l2c_ciu_rdl_dvld_bank_1;       
wire    [2  :0]  l2c_ciu_rdl_mid_bank_0;        
wire    [2  :0]  l2c_ciu_rdl_mid_bank_1;        
wire    [2  :0]  l2c_ciu_rdl_prot_bank_0;       
wire    [2  :0]  l2c_ciu_rdl_prot_bank_1;       
wire             l2c_ciu_rdl_rvld_bank_0;       
wire             l2c_ciu_rdl_rvld_bank_1;       
wire    [4  :0]  l2c_ciu_resp_bank_0;           
wire    [4  :0]  l2c_ciu_resp_bank_1;           
wire    [4  :0]  l2c_ciu_sid_bank_0;            
wire    [4  :0]  l2c_ciu_sid_bank_1;            
wire    [32 :0]  l2c_ciu_snpl2_addr_bank_0;     
wire    [32 :0]  l2c_ciu_snpl2_addr_bank_1;     
wire    [4  :0]  l2c_ciu_snpl2_ini_sid_bank_0;  
wire    [4  :0]  l2c_ciu_snpl2_ini_sid_bank_1;  
wire             l2c_ciu_snpl2_vld_bank_0;      
wire             l2c_ciu_snpl2_vld_bank_1;      
wire             l2c_ctcq_cmplt;                
wire    [43 :0]  l2c_had_dbg_info;              
wire             l2c_icg_en;                    
wire             l2c_plic_ecc_int_vld;          
wire             l2c_snb0_addr_grant;           
wire             l2c_snb0_cmplt;                
wire    [4  :0]  l2c_snb0_cmplt_sid;            
wire    [3  :0]  l2c_snb0_cp;                   
wire    [511:0]  l2c_snb0_data;                 
wire             l2c_snb0_data_grant;           
wire             l2c_snb0_data_grant_gate;      
wire    [70 :0]  l2c_snb0_prf_bus;              
wire             l2c_snb0_prf_req;              
wire    [4  :0]  l2c_snb0_resp;                 
wire    [70 :0]  l2c_snb0_snpl2_bus;            
wire    [4  :0]  l2c_snb0_snpl2_ini_sid;        
wire             l2c_snb0_snpl2_req;            
wire             l2c_snb1_addr_grant;           
wire             l2c_snb1_cmplt;                
wire    [4  :0]  l2c_snb1_cmplt_sid;            
wire    [3  :0]  l2c_snb1_cp;                   
wire    [511:0]  l2c_snb1_data;                 
wire             l2c_snb1_data_grant;           
wire             l2c_snb1_data_grant_gate;      
wire    [70 :0]  l2c_snb1_prf_bus;              
wire             l2c_snb1_prf_req;              
wire    [4  :0]  l2c_snb1_resp;                 
wire    [70 :0]  l2c_snb1_snpl2_bus;            
wire    [4  :0]  l2c_snb1_snpl2_ini_sid;        
wire             l2c_snb1_snpl2_req;            
wire             l2c_xx_no_op;                  
wire    [3  :0]  l2cif0_regs_read_acc_inc;      
wire    [3  :0]  l2cif0_regs_read_miss_inc;     
wire    [3  :0]  l2cif0_regs_write_acc_inc;     
wire    [3  :0]  l2cif0_regs_write_miss_inc;    
wire    [3  :0]  l2cif1_regs_read_acc_inc;      
wire    [3  :0]  l2cif1_regs_read_miss_inc;     
wire    [3  :0]  l2cif1_regs_write_acc_inc;     
wire    [3  :0]  l2cif1_regs_write_miss_inc;    
wire             l2cif_piu0_read_data_vld;      
wire             l2cif_piu1_read_data_vld;      
wire             l2cif_piu2_read_data_vld;      
wire             l2cif_piu3_read_data_vld;      
wire    [127:0]  l2cif_piux_read_data;          
wire             ncq_apbif_arvalid;             
wire             ncq_apbif_awvalid;             
wire             ncq_apbif_b_grant;             
wire             ncq_apbif_r_grant;             
wire             ncq_apbif_wvalid;              
wire             ncq_bmbif_bar_grant;           
wire    [4  :0]  ncq_dbg_info;                  
wire             ncq_ebiu_arvalid;              
wire             ncq_ebiu_awvalid;              
wire             ncq_ebiu_b_grant;              
wire             ncq_ebiu_r_grant;              
wire             ncq_ebiu_wvalid;               
wire             ncq_piu0_ar_grant;             
wire             ncq_piu0_aw_grant;             
wire             ncq_piu0_bar_cmplt;            
wire    [13 :0]  ncq_piu0_bbus;                 
wire             ncq_piu0_bvalid;               
wire             ncq_piu0_rvalid;               
wire             ncq_piu0_wcd_grant;            
wire             ncq_piu1_ar_grant;             
wire             ncq_piu1_aw_grant;             
wire             ncq_piu1_bar_cmplt;            
wire    [13 :0]  ncq_piu1_bbus;                 
wire             ncq_piu1_bvalid;               
wire             ncq_piu1_rvalid;               
wire             ncq_piu1_wcd_grant;            
wire             ncq_piu2_ar_grant;             
wire             ncq_piu2_aw_grant;             
wire             ncq_piu2_bar_cmplt;            
wire    [13 :0]  ncq_piu2_bbus;                 
wire             ncq_piu2_bvalid;               
wire             ncq_piu2_rvalid;               
wire             ncq_piu2_wcd_grant;            
wire             ncq_piu3_ar_grant;             
wire             ncq_piu3_aw_grant;             
wire             ncq_piu3_bar_cmplt;            
wire    [13 :0]  ncq_piu3_bbus;                 
wire             ncq_piu3_bvalid;               
wire             ncq_piu3_rvalid;               
wire             ncq_piu3_wcd_grant;            
wire    [534:0]  ncq_piux_rbus;                 
wire    [39 :0]  ncq_xx_araddr;                 
wire    [1  :0]  ncq_xx_arbar;                  
wire    [1  :0]  ncq_xx_arburst;                
wire    [3  :0]  ncq_xx_arcache;                
wire    [1  :0]  ncq_xx_ardomain;               
wire    [7  :0]  ncq_xx_arid;                   
wire    [7  :0]  ncq_xx_arlen;                  
wire             ncq_xx_arlock;                 
wire    [2  :0]  ncq_xx_arprot;                 
wire    [2  :0]  ncq_xx_arsize;                 
wire    [3  :0]  ncq_xx_arsnoop;                
wire             ncq_xx_aruser;                 
wire             ncq_xx_aw_needissue;           
wire    [39 :0]  ncq_xx_awaddr;                 
wire    [1  :0]  ncq_xx_awbar;                  
wire    [1  :0]  ncq_xx_awburst;                
wire    [3  :0]  ncq_xx_awcache;                
wire    [1  :0]  ncq_xx_awdomain;               
wire    [7  :0]  ncq_xx_awid;                   
wire    [7  :0]  ncq_xx_awlen;                  
wire             ncq_xx_awlock;                 
wire    [2  :0]  ncq_xx_awprot;                 
wire    [2  :0]  ncq_xx_awsize;                 
wire    [2  :0]  ncq_xx_awsnoop;                
wire             ncq_xx_awuser;                 
wire             ncq_xx_no_op;                  
wire    [127:0]  ncq_xx_wdata;                  
wire    [7  :0]  ncq_xx_wid;                    
wire             ncq_xx_wlast;                  
wire    [15 :0]  ncq_xx_wstrb;                  
wire             pad_biu_arready;               
wire             pad_biu_awready;               
wire    [7  :0]  pad_biu_bid;                   
wire    [1  :0]  pad_biu_bresp;                 
wire             pad_biu_bvalid;                
wire             pad_biu_csysreq;               
wire    [127:0]  pad_biu_rdata;                 
wire    [7  :0]  pad_biu_rid;                   
wire             pad_biu_rlast;                 
wire    [1  :0]  pad_biu_rresp;                 
wire             pad_biu_rvalid;                
wire             pad_biu_wready;                
wire    [39 :0]  pad_ibiu0_acaddr;              
wire    [2  :0]  pad_ibiu0_acprot;              
wire    [3  :0]  pad_ibiu0_acsnoop;             
wire             pad_ibiu0_acvalid;             
wire             pad_ibiu0_arready;             
wire             pad_ibiu0_awready;             
wire    [4  :0]  pad_ibiu0_bid;                 
wire    [1  :0]  pad_ibiu0_bresp;               
wire             pad_ibiu0_bvalid;              
wire             pad_ibiu0_cdready;             
wire             pad_ibiu0_crready;             
wire             pad_ibiu0_csr_cmplt;           
wire    [127:0]  pad_ibiu0_csr_rdata;           
wire             pad_ibiu0_dbgrq_b;             
wire    [3  :0]  pad_ibiu0_hpcp_l2of_int;       
wire             pad_ibiu0_me_int;              
wire             pad_ibiu0_ms_int;              
wire             pad_ibiu0_mt_int;              
wire    [127:0]  pad_ibiu0_rdata;               
wire    [4  :0]  pad_ibiu0_rid;                 
wire             pad_ibiu0_rlast;               
wire    [3  :0]  pad_ibiu0_rresp;               
wire             pad_ibiu0_rvalid;              
wire             pad_ibiu0_se_int;              
wire             pad_ibiu0_ss_int;              
wire             pad_ibiu0_st_int;              
wire             pad_ibiu0_wns_awready;         
wire             pad_ibiu0_wns_wready;          
wire             pad_ibiu0_wready;              
wire             pad_ibiu0_ws_awready;          
wire             pad_ibiu0_ws_wready;           
wire    [39 :0]  pad_ibiu1_acaddr;              
wire    [2  :0]  pad_ibiu1_acprot;              
wire    [3  :0]  pad_ibiu1_acsnoop;             
wire             pad_ibiu1_acvalid;             
wire             pad_ibiu1_arready;             
wire             pad_ibiu1_awready;             
wire    [4  :0]  pad_ibiu1_bid;                 
wire    [1  :0]  pad_ibiu1_bresp;               
wire             pad_ibiu1_bvalid;              
wire             pad_ibiu1_cdready;             
wire             pad_ibiu1_crready;             
wire             pad_ibiu1_csr_cmplt;           
wire    [127:0]  pad_ibiu1_csr_rdata;           
wire             pad_ibiu1_dbgrq_b;             
wire    [3  :0]  pad_ibiu1_hpcp_l2of_int;       
wire             pad_ibiu1_me_int;              
wire             pad_ibiu1_ms_int;              
wire             pad_ibiu1_mt_int;              
wire    [127:0]  pad_ibiu1_rdata;               
wire    [4  :0]  pad_ibiu1_rid;                 
wire             pad_ibiu1_rlast;               
wire    [3  :0]  pad_ibiu1_rresp;               
wire             pad_ibiu1_rvalid;              
wire             pad_ibiu1_se_int;              
wire             pad_ibiu1_ss_int;              
wire             pad_ibiu1_st_int;              
wire             pad_ibiu1_wns_awready;         
wire             pad_ibiu1_wns_wready;          
wire             pad_ibiu1_wready;              
wire             pad_ibiu1_ws_awready;          
wire             pad_ibiu1_ws_wready;           
wire             pad_yy_icg_scan_en;            
wire    [31 :0]  paddr;                         
wire             penable;                       
wire             perr_clint;                    
wire             perr_had;                      
wire    [3  :0]  perr_l2pmp;                    
wire             perr_plic;                     
wire             perr_rmr;                      
wire             piu0_bmbif_ctcq_req;           
wire             piu0_bmbif_ncq_req;            
wire    [8  :0]  piu0_bmbif_req_bus;            
wire             piu0_bmbif_snb0_req;           
wire             piu0_bmbif_snb1_req;           
wire             piu0_csr_sel;                  
wire             piu0_ctcq_ac_grant;            
wire    [70 :0]  piu0_ctcq_ar_bus;              
wire             piu0_ctcq_ar_req;              
wire    [9  :0]  piu0_ctcq_cr_bus;              
wire             piu0_ctcq_cr_req;              
wire             piu0_ctcq_r_grant;             
wire    [9  :0]  piu0_dbg_info;                 
wire             piu0_l2cif_read_data;          
wire             piu0_l2cif_read_data_ecc;      
wire    [20 :0]  piu0_l2cif_read_index;         
wire             piu0_l2cif_read_req;           
wire             piu0_l2cif_read_tag;           
wire             piu0_l2cif_read_tag_ecc;       
wire    [3  :0]  piu0_l2cif_read_way;           
wire    [73 :0]  piu0_ncq_ar_bus;               
wire             piu0_ncq_ar_req;               
wire    [73 :0]  piu0_ncq_aw_bus;               
wire             piu0_ncq_aw_req;               
wire             piu0_ncq_b_grant;              
wire             piu0_ncq_r_grant;              
wire    [143:0]  piu0_ncq_wcd_bus;              
wire             piu0_ncq_wcd_req;              
wire    [3  :0]  piu0_regs_hpcp_cnt_en;         
wire    [15 :0]  piu0_regs_op;                  
wire             piu0_regs_sel;                 
wire    [63 :0]  piu0_regs_wdata;               
wire             piu0_snb0_ac_grant;            
wire    [70 :0]  piu0_snb0_ar_bus;              
wire             piu0_snb0_ar_req;              
wire             piu0_snb0_aw_req;              
wire             piu0_snb0_b_grant;             
wire             piu0_snb0_back;                
wire    [9  :0]  piu0_snb0_cr_bus;              
wire             piu0_snb0_cr_req;              
wire             piu0_snb0_r_grant;             
wire             piu0_snb0_rack;                
wire             piu0_snb0_wcd_req;             
wire             piu0_snb1_ac_grant;            
wire    [70 :0]  piu0_snb1_ar_bus;              
wire             piu0_snb1_ar_req;              
wire             piu0_snb1_aw_req;              
wire             piu0_snb1_b_grant;             
wire             piu0_snb1_back;                
wire    [9  :0]  piu0_snb1_cr_bus;              
wire             piu0_snb1_cr_req;              
wire             piu0_snb1_r_grant;             
wire             piu0_snb1_rack;                
wire             piu0_snb1_wcd_req;             
wire    [4  :0]  piu0_snbx_back_sid;            
wire    [4  :0]  piu0_snbx_rack_sid;            
wire    [1  :0]  piu0_sysio_jdb_pm;             
wire    [1  :0]  piu0_sysio_lpmd_b;             
wire    [70 :0]  piu0_xx_aw_bus;                
wire             piu0_xx_no_op;                 
wire             piu0_xx_regs_no_op;            
wire    [534:0]  piu0_xx_wcd_bus;               
wire             piu1_bmbif_ctcq_req;           
wire             piu1_bmbif_ncq_req;            
wire    [8  :0]  piu1_bmbif_req_bus;            
wire             piu1_bmbif_snb0_req;           
wire             piu1_bmbif_snb1_req;           
wire             piu1_csr_sel;                  
wire             piu1_ctcq_ac_grant;            
wire    [70 :0]  piu1_ctcq_ar_bus;              
wire             piu1_ctcq_ar_req;              
wire    [9  :0]  piu1_ctcq_cr_bus;              
wire             piu1_ctcq_cr_req;              
wire             piu1_ctcq_r_grant;             
wire    [9  :0]  piu1_dbg_info;                 
wire             piu1_l2cif_read_data;          
wire             piu1_l2cif_read_data_ecc;      
wire    [20 :0]  piu1_l2cif_read_index;         
wire             piu1_l2cif_read_req;           
wire             piu1_l2cif_read_tag;           
wire             piu1_l2cif_read_tag_ecc;       
wire    [3  :0]  piu1_l2cif_read_way;           
wire    [73 :0]  piu1_ncq_ar_bus;               
wire             piu1_ncq_ar_req;               
wire    [73 :0]  piu1_ncq_aw_bus;               
wire             piu1_ncq_aw_req;               
wire             piu1_ncq_b_grant;              
wire             piu1_ncq_r_grant;              
wire    [143:0]  piu1_ncq_wcd_bus;              
wire             piu1_ncq_wcd_req;              
wire    [3  :0]  piu1_regs_hpcp_cnt_en;         
wire    [15 :0]  piu1_regs_op;                  
wire             piu1_regs_sel;                 
wire    [63 :0]  piu1_regs_wdata;               
wire             piu1_snb0_ac_grant;            
wire    [70 :0]  piu1_snb0_ar_bus;              
wire             piu1_snb0_ar_req;              
wire             piu1_snb0_aw_req;              
wire             piu1_snb0_b_grant;             
wire             piu1_snb0_back;                
wire    [9  :0]  piu1_snb0_cr_bus;              
wire             piu1_snb0_cr_req;              
wire             piu1_snb0_r_grant;             
wire             piu1_snb0_rack;                
wire             piu1_snb0_wcd_req;             
wire             piu1_snb1_ac_grant;            
wire    [70 :0]  piu1_snb1_ar_bus;              
wire             piu1_snb1_ar_req;              
wire             piu1_snb1_aw_req;              
wire             piu1_snb1_b_grant;             
wire             piu1_snb1_back;                
wire    [9  :0]  piu1_snb1_cr_bus;              
wire             piu1_snb1_cr_req;              
wire             piu1_snb1_r_grant;             
wire             piu1_snb1_rack;                
wire             piu1_snb1_wcd_req;             
wire    [4  :0]  piu1_snbx_back_sid;            
wire    [4  :0]  piu1_snbx_rack_sid;            
wire    [1  :0]  piu1_sysio_jdb_pm;             
wire    [1  :0]  piu1_sysio_lpmd_b;             
wire    [70 :0]  piu1_xx_aw_bus;                
wire             piu1_xx_no_op;                 
wire             piu1_xx_regs_no_op;            
wire    [534:0]  piu1_xx_wcd_bus;               
wire             piu2_bmbif_ctcq_req;           
wire             piu2_bmbif_ncq_req;            
wire    [8  :0]  piu2_bmbif_req_bus;            
wire             piu2_bmbif_snb0_req;           
wire             piu2_bmbif_snb1_req;           
wire             piu2_ctcq_ac_grant;            
wire    [70 :0]  piu2_ctcq_ar_bus;              
wire             piu2_ctcq_ar_req;              
wire    [9  :0]  piu2_ctcq_cr_bus;              
wire             piu2_ctcq_cr_req;              
wire             piu2_ctcq_r_grant;             
wire    [9  :0]  piu2_dbg_info;                 
wire             piu2_l2cif_read_data;          
wire             piu2_l2cif_read_data_ecc;      
wire    [20 :0]  piu2_l2cif_read_index;         
wire             piu2_l2cif_read_req;           
wire             piu2_l2cif_read_tag;           
wire             piu2_l2cif_read_tag_ecc;       
wire    [3  :0]  piu2_l2cif_read_way;           
wire    [73 :0]  piu2_ncq_ar_bus;               
wire             piu2_ncq_ar_req;               
wire    [73 :0]  piu2_ncq_aw_bus;               
wire             piu2_ncq_aw_req;               
wire             piu2_ncq_b_grant;              
wire             piu2_ncq_r_grant;              
wire    [143:0]  piu2_ncq_wcd_bus;              
wire             piu2_ncq_wcd_req;              
wire    [15 :0]  piu2_regs_op;                  
wire             piu2_regs_sel;                 
wire    [63 :0]  piu2_regs_wdata;               
wire             piu2_snb0_ac_grant;            
wire    [70 :0]  piu2_snb0_ar_bus;              
wire             piu2_snb0_ar_req;              
wire             piu2_snb0_aw_req;              
wire             piu2_snb0_b_grant;             
wire             piu2_snb0_back;                
wire    [9  :0]  piu2_snb0_cr_bus;              
wire             piu2_snb0_cr_req;              
wire             piu2_snb0_r_grant;             
wire             piu2_snb0_rack;                
wire             piu2_snb0_wcd_req;             
wire             piu2_snb1_ac_grant;            
wire    [70 :0]  piu2_snb1_ar_bus;              
wire             piu2_snb1_ar_req;              
wire             piu2_snb1_aw_req;              
wire             piu2_snb1_b_grant;             
wire             piu2_snb1_back;                
wire    [9  :0]  piu2_snb1_cr_bus;              
wire             piu2_snb1_cr_req;              
wire             piu2_snb1_r_grant;             
wire             piu2_snb1_rack;                
wire             piu2_snb1_wcd_req;             
wire    [4  :0]  piu2_snbx_back_sid;            
wire    [4  :0]  piu2_snbx_rack_sid;            
wire    [70 :0]  piu2_xx_aw_bus;                
wire             piu2_xx_no_op;                 
wire             piu2_xx_regs_no_op;            
wire    [534:0]  piu2_xx_wcd_bus;               
wire             piu3_bmbif_ctcq_req;           
wire             piu3_bmbif_ncq_req;            
wire    [8  :0]  piu3_bmbif_req_bus;            
wire             piu3_bmbif_snb0_req;           
wire             piu3_bmbif_snb1_req;           
wire             piu3_ctcq_ac_grant;            
wire    [70 :0]  piu3_ctcq_ar_bus;              
wire             piu3_ctcq_ar_req;              
wire    [9  :0]  piu3_ctcq_cr_bus;              
wire             piu3_ctcq_cr_req;              
wire             piu3_ctcq_r_grant;             
wire    [9  :0]  piu3_dbg_info;                 
wire             piu3_l2cif_read_data;          
wire             piu3_l2cif_read_data_ecc;      
wire    [20 :0]  piu3_l2cif_read_index;         
wire             piu3_l2cif_read_req;           
wire             piu3_l2cif_read_tag;           
wire             piu3_l2cif_read_tag_ecc;       
wire    [3  :0]  piu3_l2cif_read_way;           
wire    [73 :0]  piu3_ncq_ar_bus;               
wire             piu3_ncq_ar_req;               
wire    [73 :0]  piu3_ncq_aw_bus;               
wire             piu3_ncq_aw_req;               
wire             piu3_ncq_b_grant;              
wire             piu3_ncq_r_grant;              
wire    [143:0]  piu3_ncq_wcd_bus;              
wire             piu3_ncq_wcd_req;              
wire    [15 :0]  piu3_regs_op;                  
wire             piu3_regs_sel;                 
wire    [63 :0]  piu3_regs_wdata;               
wire             piu3_snb0_ac_grant;            
wire    [70 :0]  piu3_snb0_ar_bus;              
wire             piu3_snb0_ar_req;              
wire             piu3_snb0_aw_req;              
wire             piu3_snb0_b_grant;             
wire             piu3_snb0_back;                
wire    [9  :0]  piu3_snb0_cr_bus;              
wire             piu3_snb0_cr_req;              
wire             piu3_snb0_r_grant;             
wire             piu3_snb0_rack;                
wire             piu3_snb0_wcd_req;             
wire             piu3_snb1_ac_grant;            
wire    [70 :0]  piu3_snb1_ar_bus;              
wire             piu3_snb1_ar_req;              
wire             piu3_snb1_aw_req;              
wire             piu3_snb1_b_grant;             
wire             piu3_snb1_back;                
wire    [9  :0]  piu3_snb1_cr_bus;              
wire             piu3_snb1_cr_req;              
wire             piu3_snb1_r_grant;             
wire             piu3_snb1_rack;                
wire             piu3_snb1_wcd_req;             
wire    [4  :0]  piu3_snbx_back_sid;            
wire    [4  :0]  piu3_snbx_rack_sid;            
wire    [70 :0]  piu3_xx_aw_bus;                
wire             piu3_xx_no_op;                 
wire             piu3_xx_regs_no_op;            
wire    [534:0]  piu3_xx_wcd_bus;               
wire    [70 :0]  piu4_snb0_ar_bus;              
wire             piu4_snb0_ar_req;              
wire             piu4_snb0_aw_req;              
wire             piu4_snb0_b_grant;             
wire             piu4_snb0_back;                
wire             piu4_snb0_r_grant;             
wire             piu4_snb0_rack;                
wire             piu4_snb0_wcd_req;             
wire    [70 :0]  piu4_snb1_ar_bus;              
wire             piu4_snb1_ar_req;              
wire             piu4_snb1_aw_req;              
wire             piu4_snb1_b_grant;             
wire             piu4_snb1_back;                
wire             piu4_snb1_r_grant;             
wire             piu4_snb1_rack;                
wire             piu4_snb1_wcd_req;             
wire    [4  :0]  piu4_snbx_back_sid;            
wire    [4  :0]  piu4_snbx_rack_sid;            
wire    [70 :0]  piu4_xx_aw_bus;                
wire             piu4_xx_no_op;                 
wire    [534:0]  piu4_xx_wcd_bus;               
wire    [1  :0]  pprot;                         
wire    [31 :0]  prdata_clint;                  
wire    [31 :0]  prdata_had;                    
wire    [31 :0]  prdata_plic;                   
wire    [31 :0]  prdata_rmr;                    
wire             pready_clint;                  
wire             pready_had;                    
wire    [3  :0]  pready_l2pmp;                  
wire             pready_plic;                   
wire             pready_rmr;                    
wire             psel_clint;                    
wire             psel_had;                      
wire    [3  :0]  psel_l2pmp;                    
wire             psel_plic;                     
wire             psel_rmr;                      
wire    [31 :0]  pwdata;                        
wire             pwrite;                        
wire             regs_apbif_icg_en;             
wire             regs_piu0_cmplt;               
wire    [3  :0]  regs_piu0_hpcp_l2of_int;       
wire             regs_piu1_cmplt;               
wire    [3  :0]  regs_piu1_hpcp_l2of_int;       
wire             regs_piu2_cmplt;               
wire             regs_piu3_cmplt;               
wire    [63 :0]  regs_piux_rdata;               
wire             slvif_xx_no_op;                
wire             snb0_bmbif_bar_grant;          
wire    [95 :0]  snb0_dbg_info;                 
wire             snb0_ebiuif_ac_grant;          
wire    [68 :0]  snb0_ebiuif_arbus;             
wire             snb0_ebiuif_arvalid;           
wire    [63 :0]  snb0_l2c_addr_bus;             
wire             snb0_l2c_addr_req;             
wire    [511:0]  snb0_l2c_data_bus;             
wire             snb0_l2c_data_req;             
wire    [2  :0]  snb0_l2c_hpcp_bus;             
wire             snb0_l2c_prf_grant;            
wire             snb0_l2c_snpl2_grant;          
wire    [54 :0]  snb0_piu0_acbus;               
wire             snb0_piu0_acvalid;             
wire             snb0_piu0_ar_grant;            
wire             snb0_piu0_aw_grant;            
wire             snb0_piu0_bar_cmplt;           
wire             snb0_piu0_bvalid;              
wire             snb0_piu0_cr_grant;            
wire             snb0_piu0_rvalid;              
wire             snb0_piu0_wcd_grant;           
wire    [54 :0]  snb0_piu1_acbus;               
wire             snb0_piu1_acvalid;             
wire             snb0_piu1_ar_grant;            
wire             snb0_piu1_aw_grant;            
wire             snb0_piu1_bar_cmplt;           
wire             snb0_piu1_bvalid;              
wire             snb0_piu1_cr_grant;            
wire             snb0_piu1_rvalid;              
wire             snb0_piu1_wcd_grant;           
wire    [54 :0]  snb0_piu2_acbus;               
wire             snb0_piu2_acvalid;             
wire             snb0_piu2_ar_grant;            
wire             snb0_piu2_aw_grant;            
wire             snb0_piu2_bar_cmplt;           
wire             snb0_piu2_bvalid;              
wire             snb0_piu2_cr_grant;            
wire             snb0_piu2_rvalid;              
wire             snb0_piu2_wcd_grant;           
wire    [54 :0]  snb0_piu3_acbus;               
wire             snb0_piu3_acvalid;             
wire             snb0_piu3_ar_grant;            
wire             snb0_piu3_aw_grant;            
wire             snb0_piu3_bar_cmplt;           
wire             snb0_piu3_bvalid;              
wire             snb0_piu3_cr_grant;            
wire             snb0_piu3_rvalid;              
wire             snb0_piu3_wcd_grant;           
wire             snb0_piu4_ar_grant;            
wire             snb0_piu4_aw_grant;            
wire             snb0_piu4_bvalid;              
wire             snb0_piu4_rvalid;              
wire             snb0_piu4_wcd_grant;           
wire    [4  :0]  snb0_piux_aw_sid;              
wire    [13 :0]  snb0_piux_bbus;                
wire    [534:0]  snb0_piux_rbus;                
wire             snb0_snpext_depd_ebiu;         
wire             snb0_snpext_depd_vb;           
wire    [67 :0]  snb0_vb_awbus;                 
wire             snb0_vb_awvalid;               
wire    [2  :0]  snb0_vb_mid;                   
wire    [1  :0]  snb0_vb_vid;                   
wire    [534:0]  snb0_vb_wbus;                  
wire             snb0_vb_wvalid;                
wire             snb0_xx_no_op;                 
wire    [7  :0]  snb0_yy_snpext_index;          
wire             snb1_bmbif_bar_grant;          
wire    [95 :0]  snb1_dbg_info;                 
wire             snb1_ebiuif_ac_grant;          
wire    [68 :0]  snb1_ebiuif_arbus;             
wire             snb1_ebiuif_arvalid;           
wire    [63 :0]  snb1_l2c_addr_bus;             
wire             snb1_l2c_addr_req;             
wire    [511:0]  snb1_l2c_data_bus;             
wire             snb1_l2c_data_req;             
wire    [2  :0]  snb1_l2c_hpcp_bus;             
wire             snb1_l2c_prf_grant;            
wire             snb1_l2c_snpl2_grant;          
wire    [54 :0]  snb1_piu0_acbus;               
wire             snb1_piu0_acvalid;             
wire             snb1_piu0_ar_grant;            
wire             snb1_piu0_aw_grant;            
wire             snb1_piu0_bar_cmplt;           
wire             snb1_piu0_bvalid;              
wire             snb1_piu0_cr_grant;            
wire             snb1_piu0_rvalid;              
wire             snb1_piu0_wcd_grant;           
wire    [54 :0]  snb1_piu1_acbus;               
wire             snb1_piu1_acvalid;             
wire             snb1_piu1_ar_grant;            
wire             snb1_piu1_aw_grant;            
wire             snb1_piu1_bar_cmplt;           
wire             snb1_piu1_bvalid;              
wire             snb1_piu1_cr_grant;            
wire             snb1_piu1_rvalid;              
wire             snb1_piu1_wcd_grant;           
wire    [54 :0]  snb1_piu2_acbus;               
wire             snb1_piu2_acvalid;             
wire             snb1_piu2_ar_grant;            
wire             snb1_piu2_aw_grant;            
wire             snb1_piu2_bar_cmplt;           
wire             snb1_piu2_bvalid;              
wire             snb1_piu2_cr_grant;            
wire             snb1_piu2_rvalid;              
wire             snb1_piu2_wcd_grant;           
wire    [54 :0]  snb1_piu3_acbus;               
wire             snb1_piu3_acvalid;             
wire             snb1_piu3_ar_grant;            
wire             snb1_piu3_aw_grant;            
wire             snb1_piu3_bar_cmplt;           
wire             snb1_piu3_bvalid;              
wire             snb1_piu3_cr_grant;            
wire             snb1_piu3_rvalid;              
wire             snb1_piu3_wcd_grant;           
wire             snb1_piu4_ar_grant;            
wire             snb1_piu4_aw_grant;            
wire             snb1_piu4_bvalid;              
wire             snb1_piu4_rvalid;              
wire             snb1_piu4_wcd_grant;           
wire    [4  :0]  snb1_piux_aw_sid;              
wire    [13 :0]  snb1_piux_bbus;                
wire    [534:0]  snb1_piux_rbus;                
wire             snb1_snpext_depd_ebiu;         
wire             snb1_snpext_depd_vb;           
wire    [67 :0]  snb1_vb_awbus;                 
wire             snb1_vb_awvalid;               
wire    [2  :0]  snb1_vb_mid;                   
wire    [1  :0]  snb1_vb_vid;                   
wire    [534:0]  snb1_vb_wbus;                  
wire             snb1_vb_wvalid;                
wire             snb1_xx_no_op;                 
wire    [7  :0]  snb1_yy_snpext_index;          
wire    [39 :0]  sysio_ciu_apb_base;            
wire             sysio_l2c_flush_req;           
wire             sysio_piu0_dbgrq_b;            
wire             sysio_piu0_me_int;             
wire             sysio_piu0_ms_int;             
wire             sysio_piu0_mt_int;             
wire             sysio_piu0_se_int;             
wire             sysio_piu0_ss_int;             
wire             sysio_piu0_st_int;             
wire             sysio_piu1_dbgrq_b;            
wire             sysio_piu1_me_int;             
wire             sysio_piu1_ms_int;             
wire             sysio_piu1_mt_int;             
wire             sysio_piu1_se_int;             
wire             sysio_piu1_ss_int;             
wire             sysio_piu1_st_int;             
wire    [39 :0]  vb_ebiu_awaddr;                
wire    [1  :0]  vb_ebiu_awbar;                 
wire    [1  :0]  vb_ebiu_awburst;               
wire    [3  :0]  vb_ebiu_awcache;               
wire    [1  :0]  vb_ebiu_awdomain;              
wire    [5  :0]  vb_ebiu_awid;                  
wire    [7  :0]  vb_ebiu_awlen;                 
wire             vb_ebiu_awlock;                
wire    [2  :0]  vb_ebiu_awprot;                
wire    [2  :0]  vb_ebiu_awsize;                
wire    [2  :0]  vb_ebiu_awsnoop;               
wire             vb_ebiu_awvalid;               
wire             vb_ebiu_b_grant;               
wire    [2  :0]  vb_ebiu_mid;                   
wire    [127:0]  vb_ebiu_wdata;                 
wire    [5  :0]  vb_ebiu_wid;                   
wire             vb_ebiu_wlast;                 
wire    [15 :0]  vb_ebiu_wstrb;                 
wire             vb_ebiu_wvalid;                
wire             vb_ebiuif_addr_depd;           
wire             vb_l2c0_vctm_grant;            
wire             vb_l2c1_vctm_grant;            
wire             vb_snb0_aw_grant;              
wire             vb_snb0_w_grant;               
wire             vb_snb1_aw_grant;              
wire             vb_snb1_w_grant;               
wire             vb_xx_no_op;                   
wire    [1  :0]  vb_yy_grant_id;                



parameter CRR_WIDTH = 10;

// &Force("nonport", "pad_ibiu0_acvalid"); @57
// &Force("nonport", "pad_ibiu0_acaddr"); @58
// &Force("nonport", "pad_ibiu0_acsnoop"); @59
// &Force("nonport", "pad_ibiu0_acprot"); @60
// &Force("nonport", "pad_ibiu0_crready"); @61
// &Force("nonport", "pad_ibiu0_cdready"); @62

//================================================
// IO
//================================================

// &ConnRule(s/piu_/piu0_/); @70
// &ConnRule(s/ciu_ibiu_/pad_ibiu0_/); @71
// &ConnRule(s/ibiu_ciu_/ibiu0_pad_/); @72
// &ConnRule(s/_x$/[0]/); @73
// &ConnRule(s/^x_/core0_/); @74
// &Instance("ct_piu_other_io", "x_ct_piu0_other_io"); @75
ct_piu_other_io  x_ct_piu0_other_io (
  .ciu_ibiu_csr_cmplt       (pad_ibiu0_csr_cmplt     ),
  .ciu_ibiu_csr_rdata       (pad_ibiu0_csr_rdata     ),
  .ciu_ibiu_dbgrq_b         (pad_ibiu0_dbgrq_b       ),
  .ciu_ibiu_hpcp_l2of_int   (pad_ibiu0_hpcp_l2of_int ),
  .ciu_ibiu_me_int          (pad_ibiu0_me_int        ),
  .ciu_ibiu_ms_int          (pad_ibiu0_ms_int        ),
  .ciu_ibiu_mt_int          (pad_ibiu0_mt_int        ),
  .ciu_ibiu_se_int          (pad_ibiu0_se_int        ),
  .ciu_ibiu_ss_int          (pad_ibiu0_ss_int        ),
  .ciu_ibiu_st_int          (pad_ibiu0_st_int        ),
  .ciu_icg_en               (ciu_icg_en              ),
  .cpurst_b                 (cpurst_b                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .ibiu_ciu_cnt_en          (ibiu0_pad_cnt_en        ),
  .ibiu_ciu_csr_sel         (ibiu0_pad_csr_sel       ),
  .ibiu_ciu_csr_wdata       (ibiu0_pad_csr_wdata     ),
  .ibiu_ciu_jdb_pm          (ibiu0_pad_jdb_pm        ),
  .ibiu_ciu_lpmd_b          (ibiu0_pad_lpmd_b        ),
  .l2cif_piu_read_data_vld  (l2cif_piu0_read_data_vld),
  .l2cif_piux_read_data     (l2cif_piux_read_data    ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .perr_l2pmp_x             (perr_l2pmp[0]           ),
  .piu_csr_sel              (piu0_csr_sel            ),
  .piu_l2cif_read_data      (piu0_l2cif_read_data    ),
  .piu_l2cif_read_data_ecc  (piu0_l2cif_read_data_ecc),
  .piu_l2cif_read_index     (piu0_l2cif_read_index   ),
  .piu_l2cif_read_req       (piu0_l2cif_read_req     ),
  .piu_l2cif_read_tag       (piu0_l2cif_read_tag     ),
  .piu_l2cif_read_tag_ecc   (piu0_l2cif_read_tag_ecc ),
  .piu_l2cif_read_way       (piu0_l2cif_read_way     ),
  .piu_regs_hpcp_cnt_en     (piu0_regs_hpcp_cnt_en   ),
  .piu_regs_op              (piu0_regs_op            ),
  .piu_regs_sel             (piu0_regs_sel           ),
  .piu_regs_wdata           (piu0_regs_wdata         ),
  .piu_sysio_jdb_pm         (piu0_sysio_jdb_pm       ),
  .piu_sysio_lpmd_b         (piu0_sysio_lpmd_b       ),
  .piu_xx_regs_no_op        (piu0_xx_regs_no_op      ),
  .pready_l2pmp_x           (pready_l2pmp[0]         ),
  .psel_l2pmp_x             (psel_l2pmp[0]           ),
  .regs_piu_cmplt           (regs_piu0_cmplt         ),
  .regs_piu_hpcp_l2of_int   (regs_piu0_hpcp_l2of_int ),
  .regs_piux_rdata          (regs_piux_rdata         ),
  .sysio_piu_dbgrq_b        (sysio_piu0_dbgrq_b      ),
  .sysio_piu_me_int         (sysio_piu0_me_int       ),
  .sysio_piu_ms_int         (sysio_piu0_ms_int       ),
  .sysio_piu_mt_int         (sysio_piu0_mt_int       ),
  .sysio_piu_se_int         (sysio_piu0_se_int       ),
  .sysio_piu_ss_int         (sysio_piu0_ss_int       ),
  .sysio_piu_st_int         (sysio_piu0_st_int       ),
  .x_prdata_l2pmp           (core0_prdata_l2pmp      )
);

// &Connect(.forever_cpuclk (forever_cpuclk)); @76

// &ConnRule(s/piu_/piu1_/); @80
// &ConnRule(s/ciu_ibiu_/pad_ibiu1_/); @81
// &ConnRule(s/ibiu_ciu_/ibiu1_pad_/); @82
// &ConnRule(s/_x$/[1]/); @83
// &ConnRule(s/^x_/core1_/); @84
// &Instance("ct_piu_other_io", "x_ct_piu1_other_io"); @85
ct_piu_other_io  x_ct_piu1_other_io (
  .ciu_ibiu_csr_cmplt       (pad_ibiu1_csr_cmplt     ),
  .ciu_ibiu_csr_rdata       (pad_ibiu1_csr_rdata     ),
  .ciu_ibiu_dbgrq_b         (pad_ibiu1_dbgrq_b       ),
  .ciu_ibiu_hpcp_l2of_int   (pad_ibiu1_hpcp_l2of_int ),
  .ciu_ibiu_me_int          (pad_ibiu1_me_int        ),
  .ciu_ibiu_ms_int          (pad_ibiu1_ms_int        ),
  .ciu_ibiu_mt_int          (pad_ibiu1_mt_int        ),
  .ciu_ibiu_se_int          (pad_ibiu1_se_int        ),
  .ciu_ibiu_ss_int          (pad_ibiu1_ss_int        ),
  .ciu_ibiu_st_int          (pad_ibiu1_st_int        ),
  .ciu_icg_en               (ciu_icg_en              ),
  .cpurst_b                 (cpurst_b                ),
  .forever_cpuclk           (forever_cpuclk          ),
  .ibiu_ciu_cnt_en          (ibiu1_pad_cnt_en        ),
  .ibiu_ciu_csr_sel         (ibiu1_pad_csr_sel       ),
  .ibiu_ciu_csr_wdata       (ibiu1_pad_csr_wdata     ),
  .ibiu_ciu_jdb_pm          (ibiu1_pad_jdb_pm        ),
  .ibiu_ciu_lpmd_b          (ibiu1_pad_lpmd_b        ),
  .l2cif_piu_read_data_vld  (l2cif_piu1_read_data_vld),
  .l2cif_piux_read_data     (l2cif_piux_read_data    ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .perr_l2pmp_x             (perr_l2pmp[1]           ),
  .piu_csr_sel              (piu1_csr_sel            ),
  .piu_l2cif_read_data      (piu1_l2cif_read_data    ),
  .piu_l2cif_read_data_ecc  (piu1_l2cif_read_data_ecc),
  .piu_l2cif_read_index     (piu1_l2cif_read_index   ),
  .piu_l2cif_read_req       (piu1_l2cif_read_req     ),
  .piu_l2cif_read_tag       (piu1_l2cif_read_tag     ),
  .piu_l2cif_read_tag_ecc   (piu1_l2cif_read_tag_ecc ),
  .piu_l2cif_read_way       (piu1_l2cif_read_way     ),
  .piu_regs_hpcp_cnt_en     (piu1_regs_hpcp_cnt_en   ),
  .piu_regs_op              (piu1_regs_op            ),
  .piu_regs_sel             (piu1_regs_sel           ),
  .piu_regs_wdata           (piu1_regs_wdata         ),
  .piu_sysio_jdb_pm         (piu1_sysio_jdb_pm       ),
  .piu_sysio_lpmd_b         (piu1_sysio_lpmd_b       ),
  .piu_xx_regs_no_op        (piu1_xx_regs_no_op      ),
  .pready_l2pmp_x           (pready_l2pmp[1]         ),
  .psel_l2pmp_x             (psel_l2pmp[1]           ),
  .regs_piu_cmplt           (regs_piu1_cmplt         ),
  .regs_piu_hpcp_l2of_int   (regs_piu1_hpcp_l2of_int ),
  .regs_piux_rdata          (regs_piux_rdata         ),
  .sysio_piu_dbgrq_b        (sysio_piu1_dbgrq_b      ),
  .sysio_piu_me_int         (sysio_piu1_me_int       ),
  .sysio_piu_ms_int         (sysio_piu1_ms_int       ),
  .sysio_piu_mt_int         (sysio_piu1_mt_int       ),
  .sysio_piu_se_int         (sysio_piu1_se_int       ),
  .sysio_piu_ss_int         (sysio_piu1_ss_int       ),
  .sysio_piu_st_int         (sysio_piu1_st_int       ),
  .x_prdata_l2pmp           (core1_prdata_l2pmp      )
);

// &Connect(.forever_cpuclk (forever_cpuclk)); @86
// &ConnRule(s/piu_/piu1_/); @88
// &ConnRule(s/_x$/[1]/); @89
// &ConnRule(s/^x_/core1_/); @90
// &Instance("ct_piu_other_io_dummy", "x_ct_piu1_other_io"); @91

// &ConnRule(s/piu_/piu2_/); @95
// &ConnRule(s/ciu_ibiu_/pad_ibiu2_/); @96
// &ConnRule(s/ibiu_ciu_/ibiu2_pad_/); @97
// &ConnRule(s/_x$/[2]/); @98
// &ConnRule(s/^x_/core2_/); @99
// &Instance("ct_piu_other_io", "x_ct_piu2_other_io"); @100
// &Connect(.forever_cpuclk (forever_cpuclk)); @101
// &ConnRule(s/piu_/piu2_/); @103
// &ConnRule(s/_x$/[2]/); @104
// &ConnRule(s/^x_/core2_/); @105
// &Instance("ct_piu_other_io_dummy", "x_ct_piu2_other_io"); @106
ct_piu_other_io_dummy  x_ct_piu2_other_io (
  .l2cif_piu_read_data_vld  (l2cif_piu2_read_data_vld),
  .perr_l2pmp_x             (perr_l2pmp[2]           ),
  .piu_l2cif_read_data      (piu2_l2cif_read_data    ),
  .piu_l2cif_read_data_ecc  (piu2_l2cif_read_data_ecc),
  .piu_l2cif_read_index     (piu2_l2cif_read_index   ),
  .piu_l2cif_read_req       (piu2_l2cif_read_req     ),
  .piu_l2cif_read_tag       (piu2_l2cif_read_tag     ),
  .piu_l2cif_read_tag_ecc   (piu2_l2cif_read_tag_ecc ),
  .piu_l2cif_read_way       (piu2_l2cif_read_way     ),
  .piu_regs_op              (piu2_regs_op            ),
  .piu_regs_sel             (piu2_regs_sel           ),
  .piu_regs_wdata           (piu2_regs_wdata         ),
  .piu_xx_regs_no_op        (piu2_xx_regs_no_op      ),
  .pready_l2pmp_x           (pready_l2pmp[2]         ),
  .psel_l2pmp_x             (psel_l2pmp[2]           ),
  .regs_piu_cmplt           (regs_piu2_cmplt         ),
  .x_prdata_l2pmp           (core2_prdata_l2pmp      )
);


// &ConnRule(s/piu_/piu3_/); @110
// &ConnRule(s/ciu_ibiu_/pad_ibiu3_/); @111
// &ConnRule(s/ibiu_ciu_/ibiu3_pad_/); @112
// &ConnRule(s/_x$/[3]/); @113
// &ConnRule(s/^x_/core3_/); @114
// &Instance("ct_piu_other_io", "x_ct_piu3_other_io"); @115
// &Connect(.forever_cpuclk (forever_cpuclk)); @116
// &ConnRule(s/piu_/piu3_/); @118
// &ConnRule(s/_x$/[3]/); @119
// &ConnRule(s/^x_/core3_/); @120
// &Instance("ct_piu_other_io_dummy", "x_ct_piu3_other_io"); @121
ct_piu_other_io_dummy  x_ct_piu3_other_io (
  .l2cif_piu_read_data_vld  (l2cif_piu3_read_data_vld),
  .perr_l2pmp_x             (perr_l2pmp[3]           ),
  .piu_l2cif_read_data      (piu3_l2cif_read_data    ),
  .piu_l2cif_read_data_ecc  (piu3_l2cif_read_data_ecc),
  .piu_l2cif_read_index     (piu3_l2cif_read_index   ),
  .piu_l2cif_read_req       (piu3_l2cif_read_req     ),
  .piu_l2cif_read_tag       (piu3_l2cif_read_tag     ),
  .piu_l2cif_read_tag_ecc   (piu3_l2cif_read_tag_ecc ),
  .piu_l2cif_read_way       (piu3_l2cif_read_way     ),
  .piu_regs_op              (piu3_regs_op            ),
  .piu_regs_sel             (piu3_regs_sel           ),
  .piu_regs_wdata           (piu3_regs_wdata         ),
  .piu_xx_regs_no_op        (piu3_xx_regs_no_op      ),
  .pready_l2pmp_x           (pready_l2pmp[3]         ),
  .psel_l2pmp_x             (psel_l2pmp[3]           ),
  .regs_piu_cmplt           (regs_piu3_cmplt         ),
  .x_prdata_l2pmp           (core3_prdata_l2pmp      )
);


//================================================
//       Instance PIU0 TOP
//================================================
// &ConnRule(s/piu_/piu0_/); @128
// &ConnRule(s/hpcp_ciu/hpcp0_ciu/); @129
// &ConnRule(s/ciu_ibiu_/pad_ibiu0_/); @130
// &ConnRule(s/ibiu_ciu_/ibiu0_pad_/); @131
// &Instance("ct_piu_top", "x_ct_piu0_top"); @132
ct_piu_top  x_ct_piu0_top (
  .bmbif_piu_ctcq_grant  (bmbif_piu0_ctcq_grant),
  .bmbif_piu_ncq_grant   (bmbif_piu0_ncq_grant ),
  .bmbif_piu_snb0_grant  (bmbif_piu0_snb0_grant),
  .bmbif_piu_snb1_grant  (bmbif_piu0_snb1_grant),
  .ciu_chr2_bar_dis      (ciu_chr2_bar_dis     ),
  .ciu_ibiu_acaddr       (pad_ibiu0_acaddr     ),
  .ciu_ibiu_acprot       (pad_ibiu0_acprot     ),
  .ciu_ibiu_acsnoop      (pad_ibiu0_acsnoop    ),
  .ciu_ibiu_acvalid      (pad_ibiu0_acvalid    ),
  .ciu_ibiu_arready      (pad_ibiu0_arready    ),
  .ciu_ibiu_awready      (pad_ibiu0_awready    ),
  .ciu_ibiu_bid          (pad_ibiu0_bid        ),
  .ciu_ibiu_bresp        (pad_ibiu0_bresp      ),
  .ciu_ibiu_bvalid       (pad_ibiu0_bvalid     ),
  .ciu_ibiu_cdready      (pad_ibiu0_cdready    ),
  .ciu_ibiu_crready      (pad_ibiu0_crready    ),
  .ciu_ibiu_rdata        (pad_ibiu0_rdata      ),
  .ciu_ibiu_rid          (pad_ibiu0_rid        ),
  .ciu_ibiu_rlast        (pad_ibiu0_rlast      ),
  .ciu_ibiu_rresp        (pad_ibiu0_rresp      ),
  .ciu_ibiu_rvalid       (pad_ibiu0_rvalid     ),
  .ciu_ibiu_wns_awready  (pad_ibiu0_wns_awready),
  .ciu_ibiu_wns_wready   (pad_ibiu0_wns_wready ),
  .ciu_ibiu_wready       (pad_ibiu0_wready     ),
  .ciu_ibiu_ws_awready   (pad_ibiu0_ws_awready ),
  .ciu_ibiu_ws_wready    (pad_ibiu0_ws_wready  ),
  .ciu_icg_en            (ciu_icg_en           ),
  .ciu_top_clk           (ciu_top_clk          ),
  .cpurst_b              (cpurst_b             ),
  .ctcq_piu_acbus        (ctcq_piu0_acbus      ),
  .ctcq_piu_acvalid      (ctcq_piu0_acvalid    ),
  .ctcq_piu_ar_grant     (ctcq_piu0_ar_grant   ),
  .ctcq_piu_bar_cmplt    (ctcq_piu0_bar_cmplt  ),
  .ctcq_piu_cr_grant     (ctcq_piu0_cr_grant   ),
  .ctcq_piu_rvalid       (ctcq_piu0_rvalid     ),
  .ctcq_piux_rbus        (ctcq_piux_rbus       ),
  .ebiu_piu_no_op        (ebiu_piu0_no_op      ),
  .forever_cpuclk        (forever_cpuclk       ),
  .ibiu_ciu_acready      (ibiu0_pad_acready    ),
  .ibiu_ciu_araddr       (ibiu0_pad_araddr     ),
  .ibiu_ciu_arbar        (ibiu0_pad_arbar      ),
  .ibiu_ciu_arburst      (ibiu0_pad_arburst    ),
  .ibiu_ciu_arcache      (ibiu0_pad_arcache    ),
  .ibiu_ciu_ardomain     (ibiu0_pad_ardomain   ),
  .ibiu_ciu_arid         (ibiu0_pad_arid       ),
  .ibiu_ciu_arlen        (ibiu0_pad_arlen      ),
  .ibiu_ciu_arlock       (ibiu0_pad_arlock     ),
  .ibiu_ciu_arprot       (ibiu0_pad_arprot     ),
  .ibiu_ciu_arsize       (ibiu0_pad_arsize     ),
  .ibiu_ciu_arsnoop      (ibiu0_pad_arsnoop    ),
  .ibiu_ciu_aruser       (ibiu0_pad_aruser     ),
  .ibiu_ciu_arvalid      (ibiu0_pad_arvalid    ),
  .ibiu_ciu_awaddr       (ibiu0_pad_awaddr     ),
  .ibiu_ciu_awbar        (ibiu0_pad_awbar      ),
  .ibiu_ciu_awburst      (ibiu0_pad_awburst    ),
  .ibiu_ciu_awcache      (ibiu0_pad_awcache    ),
  .ibiu_ciu_awdomain     (ibiu0_pad_awdomain   ),
  .ibiu_ciu_awid         (ibiu0_pad_awid       ),
  .ibiu_ciu_awlen        (ibiu0_pad_awlen      ),
  .ibiu_ciu_awlock       (ibiu0_pad_awlock     ),
  .ibiu_ciu_awprot       (ibiu0_pad_awprot     ),
  .ibiu_ciu_awsize       (ibiu0_pad_awsize     ),
  .ibiu_ciu_awsnoop      (ibiu0_pad_awsnoop    ),
  .ibiu_ciu_awunique     (ibiu0_pad_awunique   ),
  .ibiu_ciu_awuser       (ibiu0_pad_awuser     ),
  .ibiu_ciu_awvalid      (ibiu0_pad_awvalid    ),
  .ibiu_ciu_back         (ibiu0_pad_back       ),
  .ibiu_ciu_bready       (ibiu0_pad_bready     ),
  .ibiu_ciu_cddata       (ibiu0_pad_cddata     ),
  .ibiu_ciu_cderr        (ibiu0_pad_cderr      ),
  .ibiu_ciu_cdlast       (ibiu0_pad_cdlast     ),
  .ibiu_ciu_cdvalid      (ibiu0_pad_cdvalid    ),
  .ibiu_ciu_crresp       (ibiu0_pad_crresp     ),
  .ibiu_ciu_crvalid      (ibiu0_pad_crvalid    ),
  .ibiu_ciu_rack         (ibiu0_pad_rack       ),
  .ibiu_ciu_rready       (ibiu0_pad_rready     ),
  .ibiu_ciu_wdata        (ibiu0_pad_wdata      ),
  .ibiu_ciu_werr         (ibiu0_pad_werr       ),
  .ibiu_ciu_wlast        (ibiu0_pad_wlast      ),
  .ibiu_ciu_wns          (ibiu0_pad_wns        ),
  .ibiu_ciu_wstrb        (ibiu0_pad_wstrb      ),
  .ibiu_ciu_wvalid       (ibiu0_pad_wvalid     ),
  .ncq_piu_ar_grant      (ncq_piu0_ar_grant    ),
  .ncq_piu_aw_grant      (ncq_piu0_aw_grant    ),
  .ncq_piu_bar_cmplt     (ncq_piu0_bar_cmplt   ),
  .ncq_piu_bbus          (ncq_piu0_bbus        ),
  .ncq_piu_bvalid        (ncq_piu0_bvalid      ),
  .ncq_piu_rvalid        (ncq_piu0_rvalid      ),
  .ncq_piu_wcd_grant     (ncq_piu0_wcd_grant   ),
  .ncq_piux_rbus         (ncq_piux_rbus        ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu_bmbif_ctcq_req    (piu0_bmbif_ctcq_req  ),
  .piu_bmbif_ncq_req     (piu0_bmbif_ncq_req   ),
  .piu_bmbif_req_bus     (piu0_bmbif_req_bus   ),
  .piu_bmbif_snb0_req    (piu0_bmbif_snb0_req  ),
  .piu_bmbif_snb1_req    (piu0_bmbif_snb1_req  ),
  .piu_ctcq_ac_grant     (piu0_ctcq_ac_grant   ),
  .piu_ctcq_ar_bus       (piu0_ctcq_ar_bus     ),
  .piu_ctcq_ar_req       (piu0_ctcq_ar_req     ),
  .piu_ctcq_cr_bus       (piu0_ctcq_cr_bus     ),
  .piu_ctcq_cr_req       (piu0_ctcq_cr_req     ),
  .piu_ctcq_r_grant      (piu0_ctcq_r_grant    ),
  .piu_dbg_info          (piu0_dbg_info        ),
  .piu_ncq_ar_bus        (piu0_ncq_ar_bus      ),
  .piu_ncq_ar_req        (piu0_ncq_ar_req      ),
  .piu_ncq_aw_bus        (piu0_ncq_aw_bus      ),
  .piu_ncq_aw_req        (piu0_ncq_aw_req      ),
  .piu_ncq_b_grant       (piu0_ncq_b_grant     ),
  .piu_ncq_r_grant       (piu0_ncq_r_grant     ),
  .piu_ncq_wcd_bus       (piu0_ncq_wcd_bus     ),
  .piu_ncq_wcd_req       (piu0_ncq_wcd_req     ),
  .piu_no                (3'b000               ),
  .piu_snb0_ac_grant     (piu0_snb0_ac_grant   ),
  .piu_snb0_ar_bus       (piu0_snb0_ar_bus     ),
  .piu_snb0_ar_req       (piu0_snb0_ar_req     ),
  .piu_snb0_aw_req       (piu0_snb0_aw_req     ),
  .piu_snb0_b_grant      (piu0_snb0_b_grant    ),
  .piu_snb0_back         (piu0_snb0_back       ),
  .piu_snb0_cr_bus       (piu0_snb0_cr_bus     ),
  .piu_snb0_cr_req       (piu0_snb0_cr_req     ),
  .piu_snb0_r_grant      (piu0_snb0_r_grant    ),
  .piu_snb0_rack         (piu0_snb0_rack       ),
  .piu_snb0_wcd_req      (piu0_snb0_wcd_req    ),
  .piu_snb1_ac_grant     (piu0_snb1_ac_grant   ),
  .piu_snb1_ar_bus       (piu0_snb1_ar_bus     ),
  .piu_snb1_ar_req       (piu0_snb1_ar_req     ),
  .piu_snb1_aw_req       (piu0_snb1_aw_req     ),
  .piu_snb1_b_grant      (piu0_snb1_b_grant    ),
  .piu_snb1_back         (piu0_snb1_back       ),
  .piu_snb1_cr_bus       (piu0_snb1_cr_bus     ),
  .piu_snb1_cr_req       (piu0_snb1_cr_req     ),
  .piu_snb1_r_grant      (piu0_snb1_r_grant    ),
  .piu_snb1_rack         (piu0_snb1_rack       ),
  .piu_snb1_wcd_req      (piu0_snb1_wcd_req    ),
  .piu_snbx_back_sid     (piu0_snbx_back_sid   ),
  .piu_snbx_rack_sid     (piu0_snbx_rack_sid   ),
  .piu_xx_aw_bus         (piu0_xx_aw_bus       ),
  .piu_xx_no_op          (piu0_xx_no_op        ),
  .piu_xx_wcd_bus        (piu0_xx_wcd_bus      ),
  .snb0_piu_acbus        (snb0_piu0_acbus      ),
  .snb0_piu_acvalid      (snb0_piu0_acvalid    ),
  .snb0_piu_ar_grant     (snb0_piu0_ar_grant   ),
  .snb0_piu_aw_grant     (snb0_piu0_aw_grant   ),
  .snb0_piu_bar_cmplt    (snb0_piu0_bar_cmplt  ),
  .snb0_piu_bvalid       (snb0_piu0_bvalid     ),
  .snb0_piu_cr_grant     (snb0_piu0_cr_grant   ),
  .snb0_piu_rvalid       (snb0_piu0_rvalid     ),
  .snb0_piu_wcd_grant    (snb0_piu0_wcd_grant  ),
  .snb0_piux_aw_sid      (snb0_piux_aw_sid     ),
  .snb0_piux_bbus        (snb0_piux_bbus       ),
  .snb0_piux_rbus        (snb0_piux_rbus       ),
  .snb1_piu_acbus        (snb1_piu0_acbus      ),
  .snb1_piu_acvalid      (snb1_piu0_acvalid    ),
  .snb1_piu_ar_grant     (snb1_piu0_ar_grant   ),
  .snb1_piu_aw_grant     (snb1_piu0_aw_grant   ),
  .snb1_piu_bar_cmplt    (snb1_piu0_bar_cmplt  ),
  .snb1_piu_bvalid       (snb1_piu0_bvalid     ),
  .snb1_piu_cr_grant     (snb1_piu0_cr_grant   ),
  .snb1_piu_rvalid       (snb1_piu0_rvalid     ),
  .snb1_piu_wcd_grant    (snb1_piu0_wcd_grant  ),
  .snb1_piux_aw_sid      (snb1_piux_aw_sid     ),
  .snb1_piux_bbus        (snb1_piux_bbus       ),
  .snb1_piux_rbus        (snb1_piux_rbus       )
);

// &Connect(.forever_cpuclk (forever_cpuclk)); @133
// &Connect(.ciu_top_clk    (ciu_top_clk   )); @134
// &Connect(.piu_no         (3'b000        )); @135
// &Connect(.self_num       (2'b0          )); @136

// &Connect( .ciu_ibiu_acsid  (pad_ibiu0_acsid    )); @139

//================================================
//       Instance PIU1 TOP
//================================================
// &ConnRule(s/piu_/piu1_/); @265
// &ConnRule(s/hpcp_ciu/hpcp1_ciu/); @266
// &ConnRule(s/ciu_ibiu_/pad_ibiu1_/); @267
// &ConnRule(s/ibiu_ciu_/ibiu1_pad_/); @268
// &Instance("ct_piu_top", "x_ct_piu1_top"); @269
ct_piu_top  x_ct_piu1_top (
  .bmbif_piu_ctcq_grant  (bmbif_piu1_ctcq_grant),
  .bmbif_piu_ncq_grant   (bmbif_piu1_ncq_grant ),
  .bmbif_piu_snb0_grant  (bmbif_piu1_snb0_grant),
  .bmbif_piu_snb1_grant  (bmbif_piu1_snb1_grant),
  .ciu_chr2_bar_dis      (ciu_chr2_bar_dis     ),
  .ciu_ibiu_acaddr       (pad_ibiu1_acaddr     ),
  .ciu_ibiu_acprot       (pad_ibiu1_acprot     ),
  .ciu_ibiu_acsnoop      (pad_ibiu1_acsnoop    ),
  .ciu_ibiu_acvalid      (pad_ibiu1_acvalid    ),
  .ciu_ibiu_arready      (pad_ibiu1_arready    ),
  .ciu_ibiu_awready      (pad_ibiu1_awready    ),
  .ciu_ibiu_bid          (pad_ibiu1_bid        ),
  .ciu_ibiu_bresp        (pad_ibiu1_bresp      ),
  .ciu_ibiu_bvalid       (pad_ibiu1_bvalid     ),
  .ciu_ibiu_cdready      (pad_ibiu1_cdready    ),
  .ciu_ibiu_crready      (pad_ibiu1_crready    ),
  .ciu_ibiu_rdata        (pad_ibiu1_rdata      ),
  .ciu_ibiu_rid          (pad_ibiu1_rid        ),
  .ciu_ibiu_rlast        (pad_ibiu1_rlast      ),
  .ciu_ibiu_rresp        (pad_ibiu1_rresp      ),
  .ciu_ibiu_rvalid       (pad_ibiu1_rvalid     ),
  .ciu_ibiu_wns_awready  (pad_ibiu1_wns_awready),
  .ciu_ibiu_wns_wready   (pad_ibiu1_wns_wready ),
  .ciu_ibiu_wready       (pad_ibiu1_wready     ),
  .ciu_ibiu_ws_awready   (pad_ibiu1_ws_awready ),
  .ciu_ibiu_ws_wready    (pad_ibiu1_ws_wready  ),
  .ciu_icg_en            (ciu_icg_en           ),
  .ciu_top_clk           (ciu_top_clk          ),
  .cpurst_b              (cpurst_b             ),
  .ctcq_piu_acbus        (ctcq_piu1_acbus      ),
  .ctcq_piu_acvalid      (ctcq_piu1_acvalid    ),
  .ctcq_piu_ar_grant     (ctcq_piu1_ar_grant   ),
  .ctcq_piu_bar_cmplt    (ctcq_piu1_bar_cmplt  ),
  .ctcq_piu_cr_grant     (ctcq_piu1_cr_grant   ),
  .ctcq_piu_rvalid       (ctcq_piu1_rvalid     ),
  .ctcq_piux_rbus        (ctcq_piux_rbus       ),
  .ebiu_piu_no_op        (ebiu_piu1_no_op      ),
  .forever_cpuclk        (forever_cpuclk       ),
  .ibiu_ciu_acready      (ibiu1_pad_acready    ),
  .ibiu_ciu_araddr       (ibiu1_pad_araddr     ),
  .ibiu_ciu_arbar        (ibiu1_pad_arbar      ),
  .ibiu_ciu_arburst      (ibiu1_pad_arburst    ),
  .ibiu_ciu_arcache      (ibiu1_pad_arcache    ),
  .ibiu_ciu_ardomain     (ibiu1_pad_ardomain   ),
  .ibiu_ciu_arid         (ibiu1_pad_arid       ),
  .ibiu_ciu_arlen        (ibiu1_pad_arlen      ),
  .ibiu_ciu_arlock       (ibiu1_pad_arlock     ),
  .ibiu_ciu_arprot       (ibiu1_pad_arprot     ),
  .ibiu_ciu_arsize       (ibiu1_pad_arsize     ),
  .ibiu_ciu_arsnoop      (ibiu1_pad_arsnoop    ),
  .ibiu_ciu_aruser       (ibiu1_pad_aruser     ),
  .ibiu_ciu_arvalid      (ibiu1_pad_arvalid    ),
  .ibiu_ciu_awaddr       (ibiu1_pad_awaddr     ),
  .ibiu_ciu_awbar        (ibiu1_pad_awbar      ),
  .ibiu_ciu_awburst      (ibiu1_pad_awburst    ),
  .ibiu_ciu_awcache      (ibiu1_pad_awcache    ),
  .ibiu_ciu_awdomain     (ibiu1_pad_awdomain   ),
  .ibiu_ciu_awid         (ibiu1_pad_awid       ),
  .ibiu_ciu_awlen        (ibiu1_pad_awlen      ),
  .ibiu_ciu_awlock       (ibiu1_pad_awlock     ),
  .ibiu_ciu_awprot       (ibiu1_pad_awprot     ),
  .ibiu_ciu_awsize       (ibiu1_pad_awsize     ),
  .ibiu_ciu_awsnoop      (ibiu1_pad_awsnoop    ),
  .ibiu_ciu_awunique     (ibiu1_pad_awunique   ),
  .ibiu_ciu_awuser       (ibiu1_pad_awuser     ),
  .ibiu_ciu_awvalid      (ibiu1_pad_awvalid    ),
  .ibiu_ciu_back         (ibiu1_pad_back       ),
  .ibiu_ciu_bready       (ibiu1_pad_bready     ),
  .ibiu_ciu_cddata       (ibiu1_pad_cddata     ),
  .ibiu_ciu_cderr        (ibiu1_pad_cderr      ),
  .ibiu_ciu_cdlast       (ibiu1_pad_cdlast     ),
  .ibiu_ciu_cdvalid      (ibiu1_pad_cdvalid    ),
  .ibiu_ciu_crresp       (ibiu1_pad_crresp     ),
  .ibiu_ciu_crvalid      (ibiu1_pad_crvalid    ),
  .ibiu_ciu_rack         (ibiu1_pad_rack       ),
  .ibiu_ciu_rready       (ibiu1_pad_rready     ),
  .ibiu_ciu_wdata        (ibiu1_pad_wdata      ),
  .ibiu_ciu_werr         (ibiu1_pad_werr       ),
  .ibiu_ciu_wlast        (ibiu1_pad_wlast      ),
  .ibiu_ciu_wns          (ibiu1_pad_wns        ),
  .ibiu_ciu_wstrb        (ibiu1_pad_wstrb      ),
  .ibiu_ciu_wvalid       (ibiu1_pad_wvalid     ),
  .ncq_piu_ar_grant      (ncq_piu1_ar_grant    ),
  .ncq_piu_aw_grant      (ncq_piu1_aw_grant    ),
  .ncq_piu_bar_cmplt     (ncq_piu1_bar_cmplt   ),
  .ncq_piu_bbus          (ncq_piu1_bbus        ),
  .ncq_piu_bvalid        (ncq_piu1_bvalid      ),
  .ncq_piu_rvalid        (ncq_piu1_rvalid      ),
  .ncq_piu_wcd_grant     (ncq_piu1_wcd_grant   ),
  .ncq_piux_rbus         (ncq_piux_rbus        ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu_bmbif_ctcq_req    (piu1_bmbif_ctcq_req  ),
  .piu_bmbif_ncq_req     (piu1_bmbif_ncq_req   ),
  .piu_bmbif_req_bus     (piu1_bmbif_req_bus   ),
  .piu_bmbif_snb0_req    (piu1_bmbif_snb0_req  ),
  .piu_bmbif_snb1_req    (piu1_bmbif_snb1_req  ),
  .piu_ctcq_ac_grant     (piu1_ctcq_ac_grant   ),
  .piu_ctcq_ar_bus       (piu1_ctcq_ar_bus     ),
  .piu_ctcq_ar_req       (piu1_ctcq_ar_req     ),
  .piu_ctcq_cr_bus       (piu1_ctcq_cr_bus     ),
  .piu_ctcq_cr_req       (piu1_ctcq_cr_req     ),
  .piu_ctcq_r_grant      (piu1_ctcq_r_grant    ),
  .piu_dbg_info          (piu1_dbg_info        ),
  .piu_ncq_ar_bus        (piu1_ncq_ar_bus      ),
  .piu_ncq_ar_req        (piu1_ncq_ar_req      ),
  .piu_ncq_aw_bus        (piu1_ncq_aw_bus      ),
  .piu_ncq_aw_req        (piu1_ncq_aw_req      ),
  .piu_ncq_b_grant       (piu1_ncq_b_grant     ),
  .piu_ncq_r_grant       (piu1_ncq_r_grant     ),
  .piu_ncq_wcd_bus       (piu1_ncq_wcd_bus     ),
  .piu_ncq_wcd_req       (piu1_ncq_wcd_req     ),
  .piu_no                (3'b001               ),
  .piu_snb0_ac_grant     (piu1_snb0_ac_grant   ),
  .piu_snb0_ar_bus       (piu1_snb0_ar_bus     ),
  .piu_snb0_ar_req       (piu1_snb0_ar_req     ),
  .piu_snb0_aw_req       (piu1_snb0_aw_req     ),
  .piu_snb0_b_grant      (piu1_snb0_b_grant    ),
  .piu_snb0_back         (piu1_snb0_back       ),
  .piu_snb0_cr_bus       (piu1_snb0_cr_bus     ),
  .piu_snb0_cr_req       (piu1_snb0_cr_req     ),
  .piu_snb0_r_grant      (piu1_snb0_r_grant    ),
  .piu_snb0_rack         (piu1_snb0_rack       ),
  .piu_snb0_wcd_req      (piu1_snb0_wcd_req    ),
  .piu_snb1_ac_grant     (piu1_snb1_ac_grant   ),
  .piu_snb1_ar_bus       (piu1_snb1_ar_bus     ),
  .piu_snb1_ar_req       (piu1_snb1_ar_req     ),
  .piu_snb1_aw_req       (piu1_snb1_aw_req     ),
  .piu_snb1_b_grant      (piu1_snb1_b_grant    ),
  .piu_snb1_back         (piu1_snb1_back       ),
  .piu_snb1_cr_bus       (piu1_snb1_cr_bus     ),
  .piu_snb1_cr_req       (piu1_snb1_cr_req     ),
  .piu_snb1_r_grant      (piu1_snb1_r_grant    ),
  .piu_snb1_rack         (piu1_snb1_rack       ),
  .piu_snb1_wcd_req      (piu1_snb1_wcd_req    ),
  .piu_snbx_back_sid     (piu1_snbx_back_sid   ),
  .piu_snbx_rack_sid     (piu1_snbx_rack_sid   ),
  .piu_xx_aw_bus         (piu1_xx_aw_bus       ),
  .piu_xx_no_op          (piu1_xx_no_op        ),
  .piu_xx_wcd_bus        (piu1_xx_wcd_bus      ),
  .snb0_piu_acbus        (snb0_piu1_acbus      ),
  .snb0_piu_acvalid      (snb0_piu1_acvalid    ),
  .snb0_piu_ar_grant     (snb0_piu1_ar_grant   ),
  .snb0_piu_aw_grant     (snb0_piu1_aw_grant   ),
  .snb0_piu_bar_cmplt    (snb0_piu1_bar_cmplt  ),
  .snb0_piu_bvalid       (snb0_piu1_bvalid     ),
  .snb0_piu_cr_grant     (snb0_piu1_cr_grant   ),
  .snb0_piu_rvalid       (snb0_piu1_rvalid     ),
  .snb0_piu_wcd_grant    (snb0_piu1_wcd_grant  ),
  .snb0_piux_aw_sid      (snb0_piux_aw_sid     ),
  .snb0_piux_bbus        (snb0_piux_bbus       ),
  .snb0_piux_rbus        (snb0_piux_rbus       ),
  .snb1_piu_acbus        (snb1_piu1_acbus      ),
  .snb1_piu_acvalid      (snb1_piu1_acvalid    ),
  .snb1_piu_ar_grant     (snb1_piu1_ar_grant   ),
  .snb1_piu_aw_grant     (snb1_piu1_aw_grant   ),
  .snb1_piu_bar_cmplt    (snb1_piu1_bar_cmplt  ),
  .snb1_piu_bvalid       (snb1_piu1_bvalid     ),
  .snb1_piu_cr_grant     (snb1_piu1_cr_grant   ),
  .snb1_piu_rvalid       (snb1_piu1_rvalid     ),
  .snb1_piu_wcd_grant    (snb1_piu1_wcd_grant  ),
  .snb1_piux_aw_sid      (snb1_piux_aw_sid     ),
  .snb1_piux_bbus        (snb1_piux_bbus       ),
  .snb1_piux_rbus        (snb1_piux_rbus       )
);

// &Connect(.forever_cpuclk (forever_cpuclk)); @270
// &Connect(.ciu_top_clk    (ciu_top_clk   )); @271
// &Connect(.piu_no         (3'b001        )); @272
// &Connect(.self_num       (2'b1          )); @273
// &Connect(.ciu_ibiu_acsid  (pad_ibiu1_acsid    )); @275
// &ConnRule(s/piu_/piu1_/); @278
// &Instance("ct_piu_top_dummy", "x_ct_piu1_top_dummy"); @279
// &Connect( @280
//   .forever_cpuclk       (ciu_top_clk              ) @281
// ); @282

// &ConnRule(s/piu_/piu2_/); @289
// &ConnRule(s/hpcp_ciu/hpcp2_ciu/); @290
// &ConnRule(s/ciu_ibiu_/pad_ibiu2_/); @291
// &ConnRule(s/ibiu_ciu_/ibiu2_pad_/); @292
// &Instance("ct_piu_top", "x_ct_piu2_top"); @293
// &Connect(.forever_cpuclk (forever_cpuclk)); @294
// &Connect(.ciu_top_clk    (ciu_top_clk   )); @295
// &Connect(.piu_no         (3'b010        )); @296
// &Connect(.self_num       (2'b10         )); @297
// &Connect(.ciu_ibiu_acsid  (pad_ibiu2_acsid    )); @299
// &ConnRule(s/piu_/piu2_/); @302
// &Instance("ct_piu_top_dummy", "x_ct_piu2_top_dummy"); @303
ct_piu_top_dummy  x_ct_piu2_top_dummy (
  .bmbif_piu_ctcq_grant  (bmbif_piu2_ctcq_grant),
  .bmbif_piu_ncq_grant   (bmbif_piu2_ncq_grant ),
  .bmbif_piu_snb0_grant  (bmbif_piu2_snb0_grant),
  .bmbif_piu_snb1_grant  (bmbif_piu2_snb1_grant),
  .ciu_icg_en            (ciu_icg_en           ),
  .cpurst_b              (cpurst_b             ),
  .ctcq_piu_acbus        (ctcq_piu2_acbus      ),
  .ctcq_piu_acvalid      (ctcq_piu2_acvalid    ),
  .ctcq_piu_ar_grant     (ctcq_piu2_ar_grant   ),
  .ctcq_piu_bar_cmplt    (ctcq_piu2_bar_cmplt  ),
  .ctcq_piu_cr_grant     (ctcq_piu2_cr_grant   ),
  .ctcq_piu_rvalid       (ctcq_piu2_rvalid     ),
  .ctcq_piux_rbus        (ctcq_piux_rbus       ),
  .ebiu_piu_no_op        (ebiu_piu2_no_op      ),
  .forever_cpuclk        (ciu_top_clk          ),
  .ncq_piu_ar_grant      (ncq_piu2_ar_grant    ),
  .ncq_piu_aw_grant      (ncq_piu2_aw_grant    ),
  .ncq_piu_bar_cmplt     (ncq_piu2_bar_cmplt   ),
  .ncq_piu_bbus          (ncq_piu2_bbus        ),
  .ncq_piu_bvalid        (ncq_piu2_bvalid      ),
  .ncq_piu_rvalid        (ncq_piu2_rvalid      ),
  .ncq_piu_wcd_grant     (ncq_piu2_wcd_grant   ),
  .ncq_piux_rbus         (ncq_piux_rbus        ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu_bmbif_ctcq_req    (piu2_bmbif_ctcq_req  ),
  .piu_bmbif_ncq_req     (piu2_bmbif_ncq_req   ),
  .piu_bmbif_req_bus     (piu2_bmbif_req_bus   ),
  .piu_bmbif_snb0_req    (piu2_bmbif_snb0_req  ),
  .piu_bmbif_snb1_req    (piu2_bmbif_snb1_req  ),
  .piu_ctcq_ac_grant     (piu2_ctcq_ac_grant   ),
  .piu_ctcq_ar_bus       (piu2_ctcq_ar_bus     ),
  .piu_ctcq_ar_req       (piu2_ctcq_ar_req     ),
  .piu_ctcq_cr_bus       (piu2_ctcq_cr_bus     ),
  .piu_ctcq_cr_req       (piu2_ctcq_cr_req     ),
  .piu_ctcq_r_grant      (piu2_ctcq_r_grant    ),
  .piu_ncq_ar_bus        (piu2_ncq_ar_bus      ),
  .piu_ncq_ar_req        (piu2_ncq_ar_req      ),
  .piu_ncq_aw_bus        (piu2_ncq_aw_bus      ),
  .piu_ncq_aw_req        (piu2_ncq_aw_req      ),
  .piu_ncq_b_grant       (piu2_ncq_b_grant     ),
  .piu_ncq_r_grant       (piu2_ncq_r_grant     ),
  .piu_ncq_wcd_bus       (piu2_ncq_wcd_bus     ),
  .piu_ncq_wcd_req       (piu2_ncq_wcd_req     ),
  .piu_snb0_ac_grant     (piu2_snb0_ac_grant   ),
  .piu_snb0_ar_bus       (piu2_snb0_ar_bus     ),
  .piu_snb0_ar_req       (piu2_snb0_ar_req     ),
  .piu_snb0_aw_req       (piu2_snb0_aw_req     ),
  .piu_snb0_b_grant      (piu2_snb0_b_grant    ),
  .piu_snb0_back         (piu2_snb0_back       ),
  .piu_snb0_cr_bus       (piu2_snb0_cr_bus     ),
  .piu_snb0_cr_req       (piu2_snb0_cr_req     ),
  .piu_snb0_r_grant      (piu2_snb0_r_grant    ),
  .piu_snb0_rack         (piu2_snb0_rack       ),
  .piu_snb0_wcd_req      (piu2_snb0_wcd_req    ),
  .piu_snb1_ac_grant     (piu2_snb1_ac_grant   ),
  .piu_snb1_ar_bus       (piu2_snb1_ar_bus     ),
  .piu_snb1_ar_req       (piu2_snb1_ar_req     ),
  .piu_snb1_aw_req       (piu2_snb1_aw_req     ),
  .piu_snb1_b_grant      (piu2_snb1_b_grant    ),
  .piu_snb1_back         (piu2_snb1_back       ),
  .piu_snb1_cr_bus       (piu2_snb1_cr_bus     ),
  .piu_snb1_cr_req       (piu2_snb1_cr_req     ),
  .piu_snb1_r_grant      (piu2_snb1_r_grant    ),
  .piu_snb1_rack         (piu2_snb1_rack       ),
  .piu_snb1_wcd_req      (piu2_snb1_wcd_req    ),
  .piu_snbx_back_sid     (piu2_snbx_back_sid   ),
  .piu_snbx_rack_sid     (piu2_snbx_rack_sid   ),
  .piu_xx_aw_bus         (piu2_xx_aw_bus       ),
  .piu_xx_no_op          (piu2_xx_no_op        ),
  .piu_xx_wcd_bus        (piu2_xx_wcd_bus      ),
  .snb0_piu_acbus        (snb0_piu2_acbus      ),
  .snb0_piu_acvalid      (snb0_piu2_acvalid    ),
  .snb0_piu_ar_grant     (snb0_piu2_ar_grant   ),
  .snb0_piu_aw_grant     (snb0_piu2_aw_grant   ),
  .snb0_piu_bar_cmplt    (snb0_piu2_bar_cmplt  ),
  .snb0_piu_bvalid       (snb0_piu2_bvalid     ),
  .snb0_piu_cr_grant     (snb0_piu2_cr_grant   ),
  .snb0_piu_rvalid       (snb0_piu2_rvalid     ),
  .snb0_piu_wcd_grant    (snb0_piu2_wcd_grant  ),
  .snb0_piux_bbus        (snb0_piux_bbus       ),
  .snb0_piux_rbus        (snb0_piux_rbus       ),
  .snb1_piu_acbus        (snb1_piu2_acbus      ),
  .snb1_piu_acvalid      (snb1_piu2_acvalid    ),
  .snb1_piu_ar_grant     (snb1_piu2_ar_grant   ),
  .snb1_piu_aw_grant     (snb1_piu2_aw_grant   ),
  .snb1_piu_bar_cmplt    (snb1_piu2_bar_cmplt  ),
  .snb1_piu_bvalid       (snb1_piu2_bvalid     ),
  .snb1_piu_cr_grant     (snb1_piu2_cr_grant   ),
  .snb1_piu_rvalid       (snb1_piu2_rvalid     ),
  .snb1_piu_wcd_grant    (snb1_piu2_wcd_grant  ),
  .snb1_piux_bbus        (snb1_piux_bbus       ),
  .snb1_piux_rbus        (snb1_piux_rbus       )
);

// &Connect( @304
//   .forever_cpuclk       (ciu_top_clk              ) @305
// ); @306

// &ConnRule(s/piu_/piu3_/); @313
// &ConnRule(s/hpcp_ciu/hpcp3_ciu/); @314
// &ConnRule(s/ciu_ibiu_/pad_ibiu3_/); @315
// &ConnRule(s/ibiu_ciu_/ibiu3_pad_/); @316
// &Instance("ct_piu_top", "x_ct_piu3_top"); @317
// &Connect(.forever_cpuclk (forever_cpuclk)); @318
// &Connect(.ciu_top_clk    (ciu_top_clk   )); @319
// &Connect(.piu_no         (3'b011        )); @320
// &Connect(.self_num       (2'b11         )); @321
// &Connect( .ciu_ibiu_acsid  (pad_ibiu3_acsid    )); @323
// &ConnRule(s/piu_/piu3_/); @326
// &Instance("ct_piu_top_dummy", "x_ct_piu3_top_dummy"); @327
ct_piu_top_dummy  x_ct_piu3_top_dummy (
  .bmbif_piu_ctcq_grant  (bmbif_piu3_ctcq_grant),
  .bmbif_piu_ncq_grant   (bmbif_piu3_ncq_grant ),
  .bmbif_piu_snb0_grant  (bmbif_piu3_snb0_grant),
  .bmbif_piu_snb1_grant  (bmbif_piu3_snb1_grant),
  .ciu_icg_en            (ciu_icg_en           ),
  .cpurst_b              (cpurst_b             ),
  .ctcq_piu_acbus        (ctcq_piu3_acbus      ),
  .ctcq_piu_acvalid      (ctcq_piu3_acvalid    ),
  .ctcq_piu_ar_grant     (ctcq_piu3_ar_grant   ),
  .ctcq_piu_bar_cmplt    (ctcq_piu3_bar_cmplt  ),
  .ctcq_piu_cr_grant     (ctcq_piu3_cr_grant   ),
  .ctcq_piu_rvalid       (ctcq_piu3_rvalid     ),
  .ctcq_piux_rbus        (ctcq_piux_rbus       ),
  .ebiu_piu_no_op        (ebiu_piu3_no_op      ),
  .forever_cpuclk        (ciu_top_clk          ),
  .ncq_piu_ar_grant      (ncq_piu3_ar_grant    ),
  .ncq_piu_aw_grant      (ncq_piu3_aw_grant    ),
  .ncq_piu_bar_cmplt     (ncq_piu3_bar_cmplt   ),
  .ncq_piu_bbus          (ncq_piu3_bbus        ),
  .ncq_piu_bvalid        (ncq_piu3_bvalid      ),
  .ncq_piu_rvalid        (ncq_piu3_rvalid      ),
  .ncq_piu_wcd_grant     (ncq_piu3_wcd_grant   ),
  .ncq_piux_rbus         (ncq_piux_rbus        ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu_bmbif_ctcq_req    (piu3_bmbif_ctcq_req  ),
  .piu_bmbif_ncq_req     (piu3_bmbif_ncq_req   ),
  .piu_bmbif_req_bus     (piu3_bmbif_req_bus   ),
  .piu_bmbif_snb0_req    (piu3_bmbif_snb0_req  ),
  .piu_bmbif_snb1_req    (piu3_bmbif_snb1_req  ),
  .piu_ctcq_ac_grant     (piu3_ctcq_ac_grant   ),
  .piu_ctcq_ar_bus       (piu3_ctcq_ar_bus     ),
  .piu_ctcq_ar_req       (piu3_ctcq_ar_req     ),
  .piu_ctcq_cr_bus       (piu3_ctcq_cr_bus     ),
  .piu_ctcq_cr_req       (piu3_ctcq_cr_req     ),
  .piu_ctcq_r_grant      (piu3_ctcq_r_grant    ),
  .piu_ncq_ar_bus        (piu3_ncq_ar_bus      ),
  .piu_ncq_ar_req        (piu3_ncq_ar_req      ),
  .piu_ncq_aw_bus        (piu3_ncq_aw_bus      ),
  .piu_ncq_aw_req        (piu3_ncq_aw_req      ),
  .piu_ncq_b_grant       (piu3_ncq_b_grant     ),
  .piu_ncq_r_grant       (piu3_ncq_r_grant     ),
  .piu_ncq_wcd_bus       (piu3_ncq_wcd_bus     ),
  .piu_ncq_wcd_req       (piu3_ncq_wcd_req     ),
  .piu_snb0_ac_grant     (piu3_snb0_ac_grant   ),
  .piu_snb0_ar_bus       (piu3_snb0_ar_bus     ),
  .piu_snb0_ar_req       (piu3_snb0_ar_req     ),
  .piu_snb0_aw_req       (piu3_snb0_aw_req     ),
  .piu_snb0_b_grant      (piu3_snb0_b_grant    ),
  .piu_snb0_back         (piu3_snb0_back       ),
  .piu_snb0_cr_bus       (piu3_snb0_cr_bus     ),
  .piu_snb0_cr_req       (piu3_snb0_cr_req     ),
  .piu_snb0_r_grant      (piu3_snb0_r_grant    ),
  .piu_snb0_rack         (piu3_snb0_rack       ),
  .piu_snb0_wcd_req      (piu3_snb0_wcd_req    ),
  .piu_snb1_ac_grant     (piu3_snb1_ac_grant   ),
  .piu_snb1_ar_bus       (piu3_snb1_ar_bus     ),
  .piu_snb1_ar_req       (piu3_snb1_ar_req     ),
  .piu_snb1_aw_req       (piu3_snb1_aw_req     ),
  .piu_snb1_b_grant      (piu3_snb1_b_grant    ),
  .piu_snb1_back         (piu3_snb1_back       ),
  .piu_snb1_cr_bus       (piu3_snb1_cr_bus     ),
  .piu_snb1_cr_req       (piu3_snb1_cr_req     ),
  .piu_snb1_r_grant      (piu3_snb1_r_grant    ),
  .piu_snb1_rack         (piu3_snb1_rack       ),
  .piu_snb1_wcd_req      (piu3_snb1_wcd_req    ),
  .piu_snbx_back_sid     (piu3_snbx_back_sid   ),
  .piu_snbx_rack_sid     (piu3_snbx_rack_sid   ),
  .piu_xx_aw_bus         (piu3_xx_aw_bus       ),
  .piu_xx_no_op          (piu3_xx_no_op        ),
  .piu_xx_wcd_bus        (piu3_xx_wcd_bus      ),
  .snb0_piu_acbus        (snb0_piu3_acbus      ),
  .snb0_piu_acvalid      (snb0_piu3_acvalid    ),
  .snb0_piu_ar_grant     (snb0_piu3_ar_grant   ),
  .snb0_piu_aw_grant     (snb0_piu3_aw_grant   ),
  .snb0_piu_bar_cmplt    (snb0_piu3_bar_cmplt  ),
  .snb0_piu_bvalid       (snb0_piu3_bvalid     ),
  .snb0_piu_cr_grant     (snb0_piu3_cr_grant   ),
  .snb0_piu_rvalid       (snb0_piu3_rvalid     ),
  .snb0_piu_wcd_grant    (snb0_piu3_wcd_grant  ),
  .snb0_piux_bbus        (snb0_piux_bbus       ),
  .snb0_piux_rbus        (snb0_piux_rbus       ),
  .snb1_piu_acbus        (snb1_piu3_acbus      ),
  .snb1_piu_acvalid      (snb1_piu3_acvalid    ),
  .snb1_piu_ar_grant     (snb1_piu3_ar_grant   ),
  .snb1_piu_aw_grant     (snb1_piu3_aw_grant   ),
  .snb1_piu_bar_cmplt    (snb1_piu3_bar_cmplt  ),
  .snb1_piu_bvalid       (snb1_piu3_bvalid     ),
  .snb1_piu_cr_grant     (snb1_piu3_cr_grant   ),
  .snb1_piu_rvalid       (snb1_piu3_rvalid     ),
  .snb1_piu_wcd_grant    (snb1_piu3_wcd_grant  ),
  .snb1_piux_bbus        (snb1_piux_bbus       ),
  .snb1_piux_rbus        (snb1_piux_rbus       )
);

// &Connect( @328
//   .forever_cpuclk       (ciu_top_clk              ) @329
// ); @330

// &ConnRule(s/piu_/piu4_/); @337
// &ConnRule(s/ciu_ibiu_/piu4_slvif_/); @338
// &ConnRule(s/ibiu_ciu_/slvif_piu4_/); @339
// &Instance("ct_piu_top_device", "x_ct_piu4_top"); @340
// &Connect( @341
//   .forever_cpuclk       (ciu_top_clk              ) @342
// ); @343
// &ConnRule(s/piu_/piu4_/); @344
// &Instance("ct_slaveif_top", "x_ct_slaveif_top"); @345
// &Connect(.forever_cpuclk (forever_cpuclk)); @346
// &Connect(.ciu_top_clk    (ciu_top_clk   )); @347
// &ConnRule(s/piu_/piu4_/); @349
// &Instance("ct_piu_top_dummy_device", "x_ct_piu4_top_dummy"); @350
ct_piu_top_dummy_device  x_ct_piu4_top_dummy (
  .piu_snb0_ar_bus     (piu4_snb0_ar_bus   ),
  .piu_snb0_ar_req     (piu4_snb0_ar_req   ),
  .piu_snb0_aw_req     (piu4_snb0_aw_req   ),
  .piu_snb0_b_grant    (piu4_snb0_b_grant  ),
  .piu_snb0_back       (piu4_snb0_back     ),
  .piu_snb0_r_grant    (piu4_snb0_r_grant  ),
  .piu_snb0_rack       (piu4_snb0_rack     ),
  .piu_snb0_wcd_req    (piu4_snb0_wcd_req  ),
  .piu_snb1_ar_bus     (piu4_snb1_ar_bus   ),
  .piu_snb1_ar_req     (piu4_snb1_ar_req   ),
  .piu_snb1_aw_req     (piu4_snb1_aw_req   ),
  .piu_snb1_b_grant    (piu4_snb1_b_grant  ),
  .piu_snb1_back       (piu4_snb1_back     ),
  .piu_snb1_r_grant    (piu4_snb1_r_grant  ),
  .piu_snb1_rack       (piu4_snb1_rack     ),
  .piu_snb1_wcd_req    (piu4_snb1_wcd_req  ),
  .piu_snbx_back_sid   (piu4_snbx_back_sid ),
  .piu_snbx_rack_sid   (piu4_snbx_rack_sid ),
  .piu_xx_aw_bus       (piu4_xx_aw_bus     ),
  .piu_xx_no_op        (piu4_xx_no_op      ),
  .piu_xx_wcd_bus      (piu4_xx_wcd_bus    ),
  .snb0_piu_ar_grant   (snb0_piu4_ar_grant ),
  .snb0_piu_aw_grant   (snb0_piu4_aw_grant ),
  .snb0_piu_bvalid     (snb0_piu4_bvalid   ),
  .snb0_piu_rvalid     (snb0_piu4_rvalid   ),
  .snb0_piu_wcd_grant  (snb0_piu4_wcd_grant),
  .snb0_piux_bbus      (snb0_piux_bbus     ),
  .snb0_piux_rbus      (snb0_piux_rbus     ),
  .snb1_piu_ar_grant   (snb1_piu4_ar_grant ),
  .snb1_piu_aw_grant   (snb1_piu4_aw_grant ),
  .snb1_piu_bvalid     (snb1_piu4_bvalid   ),
  .snb1_piu_rvalid     (snb1_piu4_rvalid   ),
  .snb1_piu_wcd_grant  (snb1_piu4_wcd_grant),
  .snb1_piux_bbus      (snb1_piux_bbus     ),
  .snb1_piux_rbus      (snb1_piux_rbus     )
);

// &Connect( @351
//   .forever_cpuclk       (ciu_top_clk              ) @352
// ); @353

// &Instance("ct_ciu_bmbif","x_ct_ciu_bmbif"); @356
ct_ciu_bmbif  x_ct_ciu_bmbif (
  .bmbif_ctcq_bar_req    (bmbif_ctcq_bar_req   ),
  .bmbif_ctcq_mid        (bmbif_ctcq_mid       ),
  .bmbif_ctcq_req_bus    (bmbif_ctcq_req_bus   ),
  .bmbif_ncq_bar_req     (bmbif_ncq_bar_req    ),
  .bmbif_ncq_mid         (bmbif_ncq_mid        ),
  .bmbif_ncq_req_bus     (bmbif_ncq_req_bus    ),
  .bmbif_piu0_ctcq_grant (bmbif_piu0_ctcq_grant),
  .bmbif_piu0_ncq_grant  (bmbif_piu0_ncq_grant ),
  .bmbif_piu0_snb0_grant (bmbif_piu0_snb0_grant),
  .bmbif_piu0_snb1_grant (bmbif_piu0_snb1_grant),
  .bmbif_piu1_ctcq_grant (bmbif_piu1_ctcq_grant),
  .bmbif_piu1_ncq_grant  (bmbif_piu1_ncq_grant ),
  .bmbif_piu1_snb0_grant (bmbif_piu1_snb0_grant),
  .bmbif_piu1_snb1_grant (bmbif_piu1_snb1_grant),
  .bmbif_piu2_ctcq_grant (bmbif_piu2_ctcq_grant),
  .bmbif_piu2_ncq_grant  (bmbif_piu2_ncq_grant ),
  .bmbif_piu2_snb0_grant (bmbif_piu2_snb0_grant),
  .bmbif_piu2_snb1_grant (bmbif_piu2_snb1_grant),
  .bmbif_piu3_ctcq_grant (bmbif_piu3_ctcq_grant),
  .bmbif_piu3_ncq_grant  (bmbif_piu3_ncq_grant ),
  .bmbif_piu3_snb0_grant (bmbif_piu3_snb0_grant),
  .bmbif_piu3_snb1_grant (bmbif_piu3_snb1_grant),
  .bmbif_snb0_bar_req    (bmbif_snb0_bar_req   ),
  .bmbif_snb0_mid        (bmbif_snb0_mid       ),
  .bmbif_snb0_req_bus    (bmbif_snb0_req_bus   ),
  .bmbif_snb1_bar_req    (bmbif_snb1_bar_req   ),
  .bmbif_snb1_mid        (bmbif_snb1_mid       ),
  .bmbif_snb1_req_bus    (bmbif_snb1_req_bus   ),
  .ciu_icg_en            (ciu_icg_en           ),
  .cpurst_b              (cpurst_b             ),
  .ctcq_bmbif_bar_grant  (ctcq_bmbif_bar_grant ),
  .forever_cpuclk        (ciu_top_clk          ),
  .ncq_bmbif_bar_grant   (ncq_bmbif_bar_grant  ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .piu0_bmbif_ctcq_req   (piu0_bmbif_ctcq_req  ),
  .piu0_bmbif_ncq_req    (piu0_bmbif_ncq_req   ),
  .piu0_bmbif_req_bus    (piu0_bmbif_req_bus   ),
  .piu0_bmbif_snb0_req   (piu0_bmbif_snb0_req  ),
  .piu0_bmbif_snb1_req   (piu0_bmbif_snb1_req  ),
  .piu1_bmbif_ctcq_req   (piu1_bmbif_ctcq_req  ),
  .piu1_bmbif_ncq_req    (piu1_bmbif_ncq_req   ),
  .piu1_bmbif_req_bus    (piu1_bmbif_req_bus   ),
  .piu1_bmbif_snb0_req   (piu1_bmbif_snb0_req  ),
  .piu1_bmbif_snb1_req   (piu1_bmbif_snb1_req  ),
  .piu2_bmbif_ctcq_req   (piu2_bmbif_ctcq_req  ),
  .piu2_bmbif_ncq_req    (piu2_bmbif_ncq_req   ),
  .piu2_bmbif_req_bus    (piu2_bmbif_req_bus   ),
  .piu2_bmbif_snb0_req   (piu2_bmbif_snb0_req  ),
  .piu2_bmbif_snb1_req   (piu2_bmbif_snb1_req  ),
  .piu3_bmbif_ctcq_req   (piu3_bmbif_ctcq_req  ),
  .piu3_bmbif_ncq_req    (piu3_bmbif_ncq_req   ),
  .piu3_bmbif_req_bus    (piu3_bmbif_req_bus   ),
  .piu3_bmbif_snb0_req   (piu3_bmbif_snb0_req  ),
  .piu3_bmbif_snb1_req   (piu3_bmbif_snb1_req  ),
  .snb0_bmbif_bar_grant  (snb0_bmbif_bar_grant ),
  .snb1_bmbif_bar_grant  (snb1_bmbif_bar_grant )
);

// &Connect( @357
//   .forever_cpuclk       (ciu_top_clk              ) @358
// ); @359
//================================================
//           instance snb0
//================================================
// &ConnRule(s/snb_/snb0_/); @363
// &ConnRule(s/sdb_ebiuif_/sdb0_ebiuif_/); @364
// &Instance("ct_ciu_snb", "x_ct_ciu_snb_0"); @365
ct_ciu_snb  x_ct_ciu_snb_0 (
  .bmbif_snb_bar_req         (bmbif_snb0_bar_req       ),
  .bmbif_snb_mid             (bmbif_snb0_mid           ),
  .bmbif_snb_req_bus         (bmbif_snb0_req_bus       ),
  .ciu_chr2_bar_dis          (ciu_chr2_bar_dis         ),
  .ciu_chr2_sf_dis           (ciu_chr2_sf_dis          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .ciu_xx_smpen              (ciu_xx_smpen             ),
  .cpurst_b                  (cpurst_b                 ),
  .ebiuif_snb_acvalid        (ebiuif_snb0_acvalid      ),
  .ebiuif_snb_ar_grant       (ebiuif_snb0_ar_grant     ),
  .ebiuif_snb_ar_grant_gate  (ebiuif_snb0_ar_grant_gate),
  .ebiuif_snb_rvalid         (ebiuif_snb0_rvalid       ),
  .ebiuif_snbx_acbus         (ebiuif_snbx_acbus        ),
  .ebiuif_xx_entry_sel       (ebiuif_xx_entry_sel      ),
  .ebiuif_xx_rdata           (ebiuif_xx_rdata          ),
  .ebiuif_xx_rlast           (ebiuif_xx_rlast          ),
  .ebiuif_xx_rresp           (ebiuif_xx_rresp          ),
  .forever_cpuclk            (ciu_top_clk              ),
  .l2c_snb_addr_grant        (l2c_snb0_addr_grant      ),
  .l2c_snb_cmplt             (l2c_snb0_cmplt           ),
  .l2c_snb_cmplt_sid         (l2c_snb0_cmplt_sid       ),
  .l2c_snb_cp                (l2c_snb0_cp              ),
  .l2c_snb_data              (l2c_snb0_data            ),
  .l2c_snb_data_grant        (l2c_snb0_data_grant      ),
  .l2c_snb_data_grant_gate   (l2c_snb0_data_grant_gate ),
  .l2c_snb_prf_bus           (l2c_snb0_prf_bus         ),
  .l2c_snb_prf_req           (l2c_snb0_prf_req         ),
  .l2c_snb_resp              (l2c_snb0_resp            ),
  .l2c_snb_snpl2_bus         (l2c_snb0_snpl2_bus       ),
  .l2c_snb_snpl2_ini_sid     (l2c_snb0_snpl2_ini_sid   ),
  .l2c_snb_snpl2_req         (l2c_snb0_snpl2_req       ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .piu0_snb_ac_grant         (piu0_snb0_ac_grant       ),
  .piu0_snb_ar_bus           (piu0_snb0_ar_bus         ),
  .piu0_snb_ar_req           (piu0_snb0_ar_req         ),
  .piu0_snb_aw_req           (piu0_snb0_aw_req         ),
  .piu0_snb_b_grant          (piu0_snb0_b_grant        ),
  .piu0_snb_back             (piu0_snb0_back           ),
  .piu0_snb_cr_bus           (piu0_snb0_cr_bus         ),
  .piu0_snb_cr_req           (piu0_snb0_cr_req         ),
  .piu0_snb_r_grant          (piu0_snb0_r_grant        ),
  .piu0_snb_rack             (piu0_snb0_rack           ),
  .piu0_snb_wcd_req          (piu0_snb0_wcd_req        ),
  .piu0_snbx_back_sid        (piu0_snbx_back_sid       ),
  .piu0_snbx_rack_sid        (piu0_snbx_rack_sid       ),
  .piu0_xx_aw_bus            (piu0_xx_aw_bus           ),
  .piu0_xx_wcd_bus           (piu0_xx_wcd_bus          ),
  .piu1_snb_ac_grant         (piu1_snb0_ac_grant       ),
  .piu1_snb_ar_bus           (piu1_snb0_ar_bus         ),
  .piu1_snb_ar_req           (piu1_snb0_ar_req         ),
  .piu1_snb_aw_req           (piu1_snb0_aw_req         ),
  .piu1_snb_b_grant          (piu1_snb0_b_grant        ),
  .piu1_snb_back             (piu1_snb0_back           ),
  .piu1_snb_cr_bus           (piu1_snb0_cr_bus         ),
  .piu1_snb_cr_req           (piu1_snb0_cr_req         ),
  .piu1_snb_r_grant          (piu1_snb0_r_grant        ),
  .piu1_snb_rack             (piu1_snb0_rack           ),
  .piu1_snb_wcd_req          (piu1_snb0_wcd_req        ),
  .piu1_snbx_back_sid        (piu1_snbx_back_sid       ),
  .piu1_snbx_rack_sid        (piu1_snbx_rack_sid       ),
  .piu1_xx_aw_bus            (piu1_xx_aw_bus           ),
  .piu1_xx_wcd_bus           (piu1_xx_wcd_bus          ),
  .piu2_snb_ac_grant         (piu2_snb0_ac_grant       ),
  .piu2_snb_ar_bus           (piu2_snb0_ar_bus         ),
  .piu2_snb_ar_req           (piu2_snb0_ar_req         ),
  .piu2_snb_aw_req           (piu2_snb0_aw_req         ),
  .piu2_snb_b_grant          (piu2_snb0_b_grant        ),
  .piu2_snb_back             (piu2_snb0_back           ),
  .piu2_snb_cr_bus           (piu2_snb0_cr_bus         ),
  .piu2_snb_cr_req           (piu2_snb0_cr_req         ),
  .piu2_snb_r_grant          (piu2_snb0_r_grant        ),
  .piu2_snb_rack             (piu2_snb0_rack           ),
  .piu2_snb_wcd_req          (piu2_snb0_wcd_req        ),
  .piu2_snbx_back_sid        (piu2_snbx_back_sid       ),
  .piu2_snbx_rack_sid        (piu2_snbx_rack_sid       ),
  .piu2_xx_aw_bus            (piu2_xx_aw_bus           ),
  .piu2_xx_wcd_bus           (piu2_xx_wcd_bus          ),
  .piu3_snb_ac_grant         (piu3_snb0_ac_grant       ),
  .piu3_snb_ar_bus           (piu3_snb0_ar_bus         ),
  .piu3_snb_ar_req           (piu3_snb0_ar_req         ),
  .piu3_snb_aw_req           (piu3_snb0_aw_req         ),
  .piu3_snb_b_grant          (piu3_snb0_b_grant        ),
  .piu3_snb_back             (piu3_snb0_back           ),
  .piu3_snb_cr_bus           (piu3_snb0_cr_bus         ),
  .piu3_snb_cr_req           (piu3_snb0_cr_req         ),
  .piu3_snb_r_grant          (piu3_snb0_r_grant        ),
  .piu3_snb_rack             (piu3_snb0_rack           ),
  .piu3_snb_wcd_req          (piu3_snb0_wcd_req        ),
  .piu3_snbx_back_sid        (piu3_snbx_back_sid       ),
  .piu3_snbx_rack_sid        (piu3_snbx_rack_sid       ),
  .piu3_xx_aw_bus            (piu3_xx_aw_bus           ),
  .piu3_xx_wcd_bus           (piu3_xx_wcd_bus          ),
  .piu4_snb_ar_bus           (piu4_snb0_ar_bus         ),
  .piu4_snb_ar_req           (piu4_snb0_ar_req         ),
  .piu4_snb_aw_req           (piu4_snb0_aw_req         ),
  .piu4_snb_b_grant          (piu4_snb0_b_grant        ),
  .piu4_snb_back             (piu4_snb0_back           ),
  .piu4_snb_r_grant          (piu4_snb0_r_grant        ),
  .piu4_snb_rack             (piu4_snb0_rack           ),
  .piu4_snb_wcd_req          (piu4_snb0_wcd_req        ),
  .piu4_snbx_back_sid        (piu4_snbx_back_sid       ),
  .piu4_snbx_rack_sid        (piu4_snbx_rack_sid       ),
  .piu4_xx_aw_bus            (piu4_xx_aw_bus           ),
  .piu4_xx_wcd_bus           (piu4_xx_wcd_bus          ),
  .snb1                      (1'b0                     ),
  .snb_bmbif_bar_grant       (snb0_bmbif_bar_grant     ),
  .snb_dbg_info              (snb0_dbg_info            ),
  .snb_ebiuif_ac_grant       (snb0_ebiuif_ac_grant     ),
  .snb_ebiuif_arbus          (snb0_ebiuif_arbus        ),
  .snb_ebiuif_arvalid        (snb0_ebiuif_arvalid      ),
  .snb_l2c_addr_bus          (snb0_l2c_addr_bus        ),
  .snb_l2c_addr_req          (snb0_l2c_addr_req        ),
  .snb_l2c_data_bus          (snb0_l2c_data_bus        ),
  .snb_l2c_data_req          (snb0_l2c_data_req        ),
  .snb_l2c_hpcp_bus          (snb0_l2c_hpcp_bus        ),
  .snb_l2c_prf_grant         (snb0_l2c_prf_grant       ),
  .snb_l2c_snpl2_grant       (snb0_l2c_snpl2_grant     ),
  .snb_piu0_acbus            (snb0_piu0_acbus          ),
  .snb_piu0_acvalid          (snb0_piu0_acvalid        ),
  .snb_piu0_ar_grant         (snb0_piu0_ar_grant       ),
  .snb_piu0_aw_grant         (snb0_piu0_aw_grant       ),
  .snb_piu0_bar_cmplt        (snb0_piu0_bar_cmplt      ),
  .snb_piu0_bvalid           (snb0_piu0_bvalid         ),
  .snb_piu0_cr_grant         (snb0_piu0_cr_grant       ),
  .snb_piu0_rvalid           (snb0_piu0_rvalid         ),
  .snb_piu0_wcd_grant        (snb0_piu0_wcd_grant      ),
  .snb_piu1_acbus            (snb0_piu1_acbus          ),
  .snb_piu1_acvalid          (snb0_piu1_acvalid        ),
  .snb_piu1_ar_grant         (snb0_piu1_ar_grant       ),
  .snb_piu1_aw_grant         (snb0_piu1_aw_grant       ),
  .snb_piu1_bar_cmplt        (snb0_piu1_bar_cmplt      ),
  .snb_piu1_bvalid           (snb0_piu1_bvalid         ),
  .snb_piu1_cr_grant         (snb0_piu1_cr_grant       ),
  .snb_piu1_rvalid           (snb0_piu1_rvalid         ),
  .snb_piu1_wcd_grant        (snb0_piu1_wcd_grant      ),
  .snb_piu2_acbus            (snb0_piu2_acbus          ),
  .snb_piu2_acvalid          (snb0_piu2_acvalid        ),
  .snb_piu2_ar_grant         (snb0_piu2_ar_grant       ),
  .snb_piu2_aw_grant         (snb0_piu2_aw_grant       ),
  .snb_piu2_bar_cmplt        (snb0_piu2_bar_cmplt      ),
  .snb_piu2_bvalid           (snb0_piu2_bvalid         ),
  .snb_piu2_cr_grant         (snb0_piu2_cr_grant       ),
  .snb_piu2_rvalid           (snb0_piu2_rvalid         ),
  .snb_piu2_wcd_grant        (snb0_piu2_wcd_grant      ),
  .snb_piu3_acbus            (snb0_piu3_acbus          ),
  .snb_piu3_acvalid          (snb0_piu3_acvalid        ),
  .snb_piu3_ar_grant         (snb0_piu3_ar_grant       ),
  .snb_piu3_aw_grant         (snb0_piu3_aw_grant       ),
  .snb_piu3_bar_cmplt        (snb0_piu3_bar_cmplt      ),
  .snb_piu3_bvalid           (snb0_piu3_bvalid         ),
  .snb_piu3_cr_grant         (snb0_piu3_cr_grant       ),
  .snb_piu3_rvalid           (snb0_piu3_rvalid         ),
  .snb_piu3_wcd_grant        (snb0_piu3_wcd_grant      ),
  .snb_piu4_ar_grant         (snb0_piu4_ar_grant       ),
  .snb_piu4_aw_grant         (snb0_piu4_aw_grant       ),
  .snb_piu4_bvalid           (snb0_piu4_bvalid         ),
  .snb_piu4_rvalid           (snb0_piu4_rvalid         ),
  .snb_piu4_wcd_grant        (snb0_piu4_wcd_grant      ),
  .snb_piux_aw_sid           (snb0_piux_aw_sid         ),
  .snb_piux_bbus             (snb0_piux_bbus           ),
  .snb_piux_rbus             (snb0_piux_rbus           ),
  .snb_snpext_depd_ebiu      (snb0_snpext_depd_ebiu    ),
  .snb_snpext_depd_vb        (snb0_snpext_depd_vb      ),
  .snb_vb_awbus              (snb0_vb_awbus            ),
  .snb_vb_awvalid            (snb0_vb_awvalid          ),
  .snb_vb_mid                (snb0_vb_mid              ),
  .snb_vb_vid                (snb0_vb_vid              ),
  .snb_vb_wbus               (snb0_vb_wbus             ),
  .snb_vb_wvalid             (snb0_vb_wvalid           ),
  .snb_xx_no_op              (snb0_xx_no_op            ),
  .snb_yy_snpext_index       (snb0_yy_snpext_index     ),
  .vb_snb_aw_grant           (vb_snb0_aw_grant         ),
  .vb_snb_w_grant            (vb_snb0_w_grant          ),
  .vb_yy_grant_id            (vb_yy_grant_id           )
);

// &Connect( @366
//   .forever_cpuclk       (ciu_top_clk             ), @367
//   .snb1                 (1'b0                    ) @368
// ); @369


//================================================
//           instance snb1
//================================================
// &ConnRule(s/snb_/snb1_/); @478
// &ConnRule(s/sdb_ebiuif_/sdb1_ebiuif_/); @479
// &Instance("ct_ciu_snb", "x_ct_ciu_snb_1"); @480
ct_ciu_snb  x_ct_ciu_snb_1 (
  .bmbif_snb_bar_req         (bmbif_snb1_bar_req       ),
  .bmbif_snb_mid             (bmbif_snb1_mid           ),
  .bmbif_snb_req_bus         (bmbif_snb1_req_bus       ),
  .ciu_chr2_bar_dis          (ciu_chr2_bar_dis         ),
  .ciu_chr2_sf_dis           (ciu_chr2_sf_dis          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .ciu_xx_smpen              (ciu_xx_smpen             ),
  .cpurst_b                  (cpurst_b                 ),
  .ebiuif_snb_acvalid        (ebiuif_snb1_acvalid      ),
  .ebiuif_snb_ar_grant       (ebiuif_snb1_ar_grant     ),
  .ebiuif_snb_ar_grant_gate  (ebiuif_snb1_ar_grant_gate),
  .ebiuif_snb_rvalid         (ebiuif_snb1_rvalid       ),
  .ebiuif_snbx_acbus         (ebiuif_snbx_acbus        ),
  .ebiuif_xx_entry_sel       (ebiuif_xx_entry_sel      ),
  .ebiuif_xx_rdata           (ebiuif_xx_rdata          ),
  .ebiuif_xx_rlast           (ebiuif_xx_rlast          ),
  .ebiuif_xx_rresp           (ebiuif_xx_rresp          ),
  .forever_cpuclk            (ciu_top_clk              ),
  .l2c_snb_addr_grant        (l2c_snb1_addr_grant      ),
  .l2c_snb_cmplt             (l2c_snb1_cmplt           ),
  .l2c_snb_cmplt_sid         (l2c_snb1_cmplt_sid       ),
  .l2c_snb_cp                (l2c_snb1_cp              ),
  .l2c_snb_data              (l2c_snb1_data            ),
  .l2c_snb_data_grant        (l2c_snb1_data_grant      ),
  .l2c_snb_data_grant_gate   (l2c_snb1_data_grant_gate ),
  .l2c_snb_prf_bus           (l2c_snb1_prf_bus         ),
  .l2c_snb_prf_req           (l2c_snb1_prf_req         ),
  .l2c_snb_resp              (l2c_snb1_resp            ),
  .l2c_snb_snpl2_bus         (l2c_snb1_snpl2_bus       ),
  .l2c_snb_snpl2_ini_sid     (l2c_snb1_snpl2_ini_sid   ),
  .l2c_snb_snpl2_req         (l2c_snb1_snpl2_req       ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .piu0_snb_ac_grant         (piu0_snb1_ac_grant       ),
  .piu0_snb_ar_bus           (piu0_snb1_ar_bus         ),
  .piu0_snb_ar_req           (piu0_snb1_ar_req         ),
  .piu0_snb_aw_req           (piu0_snb1_aw_req         ),
  .piu0_snb_b_grant          (piu0_snb1_b_grant        ),
  .piu0_snb_back             (piu0_snb1_back           ),
  .piu0_snb_cr_bus           (piu0_snb1_cr_bus         ),
  .piu0_snb_cr_req           (piu0_snb1_cr_req         ),
  .piu0_snb_r_grant          (piu0_snb1_r_grant        ),
  .piu0_snb_rack             (piu0_snb1_rack           ),
  .piu0_snb_wcd_req          (piu0_snb1_wcd_req        ),
  .piu0_snbx_back_sid        (piu0_snbx_back_sid       ),
  .piu0_snbx_rack_sid        (piu0_snbx_rack_sid       ),
  .piu0_xx_aw_bus            (piu0_xx_aw_bus           ),
  .piu0_xx_wcd_bus           (piu0_xx_wcd_bus          ),
  .piu1_snb_ac_grant         (piu1_snb1_ac_grant       ),
  .piu1_snb_ar_bus           (piu1_snb1_ar_bus         ),
  .piu1_snb_ar_req           (piu1_snb1_ar_req         ),
  .piu1_snb_aw_req           (piu1_snb1_aw_req         ),
  .piu1_snb_b_grant          (piu1_snb1_b_grant        ),
  .piu1_snb_back             (piu1_snb1_back           ),
  .piu1_snb_cr_bus           (piu1_snb1_cr_bus         ),
  .piu1_snb_cr_req           (piu1_snb1_cr_req         ),
  .piu1_snb_r_grant          (piu1_snb1_r_grant        ),
  .piu1_snb_rack             (piu1_snb1_rack           ),
  .piu1_snb_wcd_req          (piu1_snb1_wcd_req        ),
  .piu1_snbx_back_sid        (piu1_snbx_back_sid       ),
  .piu1_snbx_rack_sid        (piu1_snbx_rack_sid       ),
  .piu1_xx_aw_bus            (piu1_xx_aw_bus           ),
  .piu1_xx_wcd_bus           (piu1_xx_wcd_bus          ),
  .piu2_snb_ac_grant         (piu2_snb1_ac_grant       ),
  .piu2_snb_ar_bus           (piu2_snb1_ar_bus         ),
  .piu2_snb_ar_req           (piu2_snb1_ar_req         ),
  .piu2_snb_aw_req           (piu2_snb1_aw_req         ),
  .piu2_snb_b_grant          (piu2_snb1_b_grant        ),
  .piu2_snb_back             (piu2_snb1_back           ),
  .piu2_snb_cr_bus           (piu2_snb1_cr_bus         ),
  .piu2_snb_cr_req           (piu2_snb1_cr_req         ),
  .piu2_snb_r_grant          (piu2_snb1_r_grant        ),
  .piu2_snb_rack             (piu2_snb1_rack           ),
  .piu2_snb_wcd_req          (piu2_snb1_wcd_req        ),
  .piu2_snbx_back_sid        (piu2_snbx_back_sid       ),
  .piu2_snbx_rack_sid        (piu2_snbx_rack_sid       ),
  .piu2_xx_aw_bus            (piu2_xx_aw_bus           ),
  .piu2_xx_wcd_bus           (piu2_xx_wcd_bus          ),
  .piu3_snb_ac_grant         (piu3_snb1_ac_grant       ),
  .piu3_snb_ar_bus           (piu3_snb1_ar_bus         ),
  .piu3_snb_ar_req           (piu3_snb1_ar_req         ),
  .piu3_snb_aw_req           (piu3_snb1_aw_req         ),
  .piu3_snb_b_grant          (piu3_snb1_b_grant        ),
  .piu3_snb_back             (piu3_snb1_back           ),
  .piu3_snb_cr_bus           (piu3_snb1_cr_bus         ),
  .piu3_snb_cr_req           (piu3_snb1_cr_req         ),
  .piu3_snb_r_grant          (piu3_snb1_r_grant        ),
  .piu3_snb_rack             (piu3_snb1_rack           ),
  .piu3_snb_wcd_req          (piu3_snb1_wcd_req        ),
  .piu3_snbx_back_sid        (piu3_snbx_back_sid       ),
  .piu3_snbx_rack_sid        (piu3_snbx_rack_sid       ),
  .piu3_xx_aw_bus            (piu3_xx_aw_bus           ),
  .piu3_xx_wcd_bus           (piu3_xx_wcd_bus          ),
  .piu4_snb_ar_bus           (piu4_snb1_ar_bus         ),
  .piu4_snb_ar_req           (piu4_snb1_ar_req         ),
  .piu4_snb_aw_req           (piu4_snb1_aw_req         ),
  .piu4_snb_b_grant          (piu4_snb1_b_grant        ),
  .piu4_snb_back             (piu4_snb1_back           ),
  .piu4_snb_r_grant          (piu4_snb1_r_grant        ),
  .piu4_snb_rack             (piu4_snb1_rack           ),
  .piu4_snb_wcd_req          (piu4_snb1_wcd_req        ),
  .piu4_snbx_back_sid        (piu4_snbx_back_sid       ),
  .piu4_snbx_rack_sid        (piu4_snbx_rack_sid       ),
  .piu4_xx_aw_bus            (piu4_xx_aw_bus           ),
  .piu4_xx_wcd_bus           (piu4_xx_wcd_bus          ),
  .snb1                      (1'b1                     ),
  .snb_bmbif_bar_grant       (snb1_bmbif_bar_grant     ),
  .snb_dbg_info              (snb1_dbg_info            ),
  .snb_ebiuif_ac_grant       (snb1_ebiuif_ac_grant     ),
  .snb_ebiuif_arbus          (snb1_ebiuif_arbus        ),
  .snb_ebiuif_arvalid        (snb1_ebiuif_arvalid      ),
  .snb_l2c_addr_bus          (snb1_l2c_addr_bus        ),
  .snb_l2c_addr_req          (snb1_l2c_addr_req        ),
  .snb_l2c_data_bus          (snb1_l2c_data_bus        ),
  .snb_l2c_data_req          (snb1_l2c_data_req        ),
  .snb_l2c_hpcp_bus          (snb1_l2c_hpcp_bus        ),
  .snb_l2c_prf_grant         (snb1_l2c_prf_grant       ),
  .snb_l2c_snpl2_grant       (snb1_l2c_snpl2_grant     ),
  .snb_piu0_acbus            (snb1_piu0_acbus          ),
  .snb_piu0_acvalid          (snb1_piu0_acvalid        ),
  .snb_piu0_ar_grant         (snb1_piu0_ar_grant       ),
  .snb_piu0_aw_grant         (snb1_piu0_aw_grant       ),
  .snb_piu0_bar_cmplt        (snb1_piu0_bar_cmplt      ),
  .snb_piu0_bvalid           (snb1_piu0_bvalid         ),
  .snb_piu0_cr_grant         (snb1_piu0_cr_grant       ),
  .snb_piu0_rvalid           (snb1_piu0_rvalid         ),
  .snb_piu0_wcd_grant        (snb1_piu0_wcd_grant      ),
  .snb_piu1_acbus            (snb1_piu1_acbus          ),
  .snb_piu1_acvalid          (snb1_piu1_acvalid        ),
  .snb_piu1_ar_grant         (snb1_piu1_ar_grant       ),
  .snb_piu1_aw_grant         (snb1_piu1_aw_grant       ),
  .snb_piu1_bar_cmplt        (snb1_piu1_bar_cmplt      ),
  .snb_piu1_bvalid           (snb1_piu1_bvalid         ),
  .snb_piu1_cr_grant         (snb1_piu1_cr_grant       ),
  .snb_piu1_rvalid           (snb1_piu1_rvalid         ),
  .snb_piu1_wcd_grant        (snb1_piu1_wcd_grant      ),
  .snb_piu2_acbus            (snb1_piu2_acbus          ),
  .snb_piu2_acvalid          (snb1_piu2_acvalid        ),
  .snb_piu2_ar_grant         (snb1_piu2_ar_grant       ),
  .snb_piu2_aw_grant         (snb1_piu2_aw_grant       ),
  .snb_piu2_bar_cmplt        (snb1_piu2_bar_cmplt      ),
  .snb_piu2_bvalid           (snb1_piu2_bvalid         ),
  .snb_piu2_cr_grant         (snb1_piu2_cr_grant       ),
  .snb_piu2_rvalid           (snb1_piu2_rvalid         ),
  .snb_piu2_wcd_grant        (snb1_piu2_wcd_grant      ),
  .snb_piu3_acbus            (snb1_piu3_acbus          ),
  .snb_piu3_acvalid          (snb1_piu3_acvalid        ),
  .snb_piu3_ar_grant         (snb1_piu3_ar_grant       ),
  .snb_piu3_aw_grant         (snb1_piu3_aw_grant       ),
  .snb_piu3_bar_cmplt        (snb1_piu3_bar_cmplt      ),
  .snb_piu3_bvalid           (snb1_piu3_bvalid         ),
  .snb_piu3_cr_grant         (snb1_piu3_cr_grant       ),
  .snb_piu3_rvalid           (snb1_piu3_rvalid         ),
  .snb_piu3_wcd_grant        (snb1_piu3_wcd_grant      ),
  .snb_piu4_ar_grant         (snb1_piu4_ar_grant       ),
  .snb_piu4_aw_grant         (snb1_piu4_aw_grant       ),
  .snb_piu4_bvalid           (snb1_piu4_bvalid         ),
  .snb_piu4_rvalid           (snb1_piu4_rvalid         ),
  .snb_piu4_wcd_grant        (snb1_piu4_wcd_grant      ),
  .snb_piux_aw_sid           (snb1_piux_aw_sid         ),
  .snb_piux_bbus             (snb1_piux_bbus           ),
  .snb_piux_rbus             (snb1_piux_rbus           ),
  .snb_snpext_depd_ebiu      (snb1_snpext_depd_ebiu    ),
  .snb_snpext_depd_vb        (snb1_snpext_depd_vb      ),
  .snb_vb_awbus              (snb1_vb_awbus            ),
  .snb_vb_awvalid            (snb1_vb_awvalid          ),
  .snb_vb_mid                (snb1_vb_mid              ),
  .snb_vb_vid                (snb1_vb_vid              ),
  .snb_vb_wbus               (snb1_vb_wbus             ),
  .snb_vb_wvalid             (snb1_vb_wvalid           ),
  .snb_xx_no_op              (snb1_xx_no_op            ),
  .snb_yy_snpext_index       (snb1_yy_snpext_index     ),
  .vb_snb_aw_grant           (vb_snb1_aw_grant         ),
  .vb_snb_w_grant            (vb_snb1_w_grant          ),
  .vb_yy_grant_id            (vb_yy_grant_id           )
);

// &Connect( @481
//   .forever_cpuclk       (ciu_top_clk             ), @482
//   .snb1                 (1'b1                    ) @483
// ); @484


//================================================
//           instance vctm buffer
//================================================

// &Instance("ct_ciu_vb", "x_ct_ciu_vb"); @594
ct_ciu_vb  x_ct_ciu_vb (
  .ciu_icg_en             (ciu_icg_en            ),
  .cpurst_b               (cpurst_b              ),
  .ebiu_vb_aw_grant       (ebiu_vb_aw_grant      ),
  .ebiu_vb_aw_grant_gated (ebiu_vb_aw_grant_gated),
  .ebiu_vb_bid            (ebiu_vb_bid           ),
  .ebiu_vb_bresp          (ebiu_vb_bresp         ),
  .ebiu_vb_bvalid         (ebiu_vb_bvalid        ),
  .ebiu_vb_w_grant        (ebiu_vb_w_grant       ),
  .ebiuif_vb_index        (ebiuif_vb_index       ),
  .forever_cpuclk         (ciu_top_clk           ),
  .l2c0_vb_awbus          (l2c0_vb_awbus         ),
  .l2c0_vb_awvalid        (l2c0_vb_awvalid       ),
  .l2c0_vb_mid            (l2c0_vb_mid           ),
  .l2c0_vb_vid            (l2c0_vb_vid           ),
  .l2c0_vb_wbus           (l2c0_vb_wbus          ),
  .l2c0_vb_wvalid         (l2c0_vb_wvalid        ),
  .l2c1_vb_awbus          (l2c1_vb_awbus         ),
  .l2c1_vb_awvalid        (l2c1_vb_awvalid       ),
  .l2c1_vb_mid            (l2c1_vb_mid           ),
  .l2c1_vb_vid            (l2c1_vb_vid           ),
  .l2c1_vb_wbus           (l2c1_vb_wbus          ),
  .l2c1_vb_wvalid         (l2c1_vb_wvalid        ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    ),
  .snb0_snpext_depd_vb    (snb0_snpext_depd_vb   ),
  .snb0_vb_awbus          (snb0_vb_awbus         ),
  .snb0_vb_awvalid        (snb0_vb_awvalid       ),
  .snb0_vb_mid            (snb0_vb_mid           ),
  .snb0_vb_vid            (snb0_vb_vid           ),
  .snb0_vb_wbus           (snb0_vb_wbus          ),
  .snb0_vb_wvalid         (snb0_vb_wvalid        ),
  .snb0_yy_snpext_index   (snb0_yy_snpext_index  ),
  .snb1_snpext_depd_vb    (snb1_snpext_depd_vb   ),
  .snb1_vb_awbus          (snb1_vb_awbus         ),
  .snb1_vb_awvalid        (snb1_vb_awvalid       ),
  .snb1_vb_mid            (snb1_vb_mid           ),
  .snb1_vb_vid            (snb1_vb_vid           ),
  .snb1_vb_wbus           (snb1_vb_wbus          ),
  .snb1_vb_wvalid         (snb1_vb_wvalid        ),
  .snb1_yy_snpext_index   (snb1_yy_snpext_index  ),
  .vb_ebiu_awaddr         (vb_ebiu_awaddr        ),
  .vb_ebiu_awbar          (vb_ebiu_awbar         ),
  .vb_ebiu_awburst        (vb_ebiu_awburst       ),
  .vb_ebiu_awcache        (vb_ebiu_awcache       ),
  .vb_ebiu_awdomain       (vb_ebiu_awdomain      ),
  .vb_ebiu_awid           (vb_ebiu_awid          ),
  .vb_ebiu_awlen          (vb_ebiu_awlen         ),
  .vb_ebiu_awlock         (vb_ebiu_awlock        ),
  .vb_ebiu_awprot         (vb_ebiu_awprot        ),
  .vb_ebiu_awsize         (vb_ebiu_awsize        ),
  .vb_ebiu_awsnoop        (vb_ebiu_awsnoop       ),
  .vb_ebiu_awvalid        (vb_ebiu_awvalid       ),
  .vb_ebiu_b_grant        (vb_ebiu_b_grant       ),
  .vb_ebiu_mid            (vb_ebiu_mid           ),
  .vb_ebiu_wdata          (vb_ebiu_wdata         ),
  .vb_ebiu_wid            (vb_ebiu_wid           ),
  .vb_ebiu_wlast          (vb_ebiu_wlast         ),
  .vb_ebiu_wstrb          (vb_ebiu_wstrb         ),
  .vb_ebiu_wvalid         (vb_ebiu_wvalid        ),
  .vb_ebiuif_addr_depd    (vb_ebiuif_addr_depd   ),
  .vb_l2c0_vctm_grant     (vb_l2c0_vctm_grant    ),
  .vb_l2c1_vctm_grant     (vb_l2c1_vctm_grant    ),
  .vb_snb0_aw_grant       (vb_snb0_aw_grant      ),
  .vb_snb0_w_grant        (vb_snb0_w_grant       ),
  .vb_snb1_aw_grant       (vb_snb1_aw_grant      ),
  .vb_snb1_w_grant        (vb_snb1_w_grant       ),
  .vb_xx_no_op            (vb_xx_no_op           ),
  .vb_yy_grant_id         (vb_yy_grant_id        )
);

// &Connect( @595
//   .forever_cpuclk       (ciu_top_clk              ) @596
// ); @597

//================================================
//           instance ebiuif
//================================================
// &Instance("ct_ciu_ebiuif", "x_ct_ciu_ebiuif"); @602
ct_ciu_ebiuif  x_ct_ciu_ebiuif (
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .ctcq_ebiuif_ac_grant      (ctcq_ebiuif_ac_grant     ),
  .ctcq_ebiuif_crresp        (ctcq_ebiuif_crresp       ),
  .ctcq_ebiuif_crvalid       (ctcq_ebiuif_crvalid      ),
  .ebiu_ebiuif_acaddr        (ebiu_ebiuif_acaddr       ),
  .ebiu_ebiuif_acid          (ebiu_ebiuif_acid         ),
  .ebiu_ebiuif_acprot        (ebiu_ebiuif_acprot       ),
  .ebiu_ebiuif_acsnoop       (ebiu_ebiuif_acsnoop      ),
  .ebiu_ebiuif_acvalid       (ebiu_ebiuif_acvalid      ),
  .ebiu_ebiuif_ar_grant      (ebiu_ebiuif_ar_grant     ),
  .ebiu_ebiuif_ar_grant_gate (ebiu_ebiuif_ar_grant_gate),
  .ebiu_ebiuif_cd_grant      (ebiu_ebiuif_cd_grant     ),
  .ebiu_ebiuif_cr_grant      (ebiu_ebiuif_cr_grant     ),
  .ebiu_ebiuif_entry_sel     (ebiu_ebiuif_entry_sel    ),
  .ebiu_ebiuif_rdata         (ebiu_ebiuif_rdata        ),
  .ebiu_ebiuif_rlast         (ebiu_ebiuif_rlast        ),
  .ebiu_ebiuif_rresp         (ebiu_ebiuif_rresp        ),
  .ebiu_ebiuif_snb0_rvalid   (ebiu_ebiuif_snb0_rvalid  ),
  .ebiu_ebiuif_snb1_rvalid   (ebiu_ebiuif_snb1_rvalid  ),
  .ebiuif_ctcq_acaddr        (ebiuif_ctcq_acaddr       ),
  .ebiuif_ctcq_acid          (ebiuif_ctcq_acid         ),
  .ebiuif_ctcq_acsnoop       (ebiuif_ctcq_acsnoop      ),
  .ebiuif_ctcq_acvalid       (ebiuif_ctcq_acvalid      ),
  .ebiuif_ctcq_cr_grant      (ebiuif_ctcq_cr_grant     ),
  .ebiuif_ebiu_ac_grant      (ebiuif_ebiu_ac_grant     ),
  .ebiuif_ebiu_araddr        (ebiuif_ebiu_araddr       ),
  .ebiuif_ebiu_arbar         (ebiuif_ebiu_arbar        ),
  .ebiuif_ebiu_arburst       (ebiuif_ebiu_arburst      ),
  .ebiuif_ebiu_arcache       (ebiuif_ebiu_arcache      ),
  .ebiuif_ebiu_ardomain      (ebiuif_ebiu_ardomain     ),
  .ebiuif_ebiu_arid          (ebiuif_ebiu_arid         ),
  .ebiuif_ebiu_arlen         (ebiuif_ebiu_arlen        ),
  .ebiuif_ebiu_arlock        (ebiuif_ebiu_arlock       ),
  .ebiuif_ebiu_arprot        (ebiuif_ebiu_arprot       ),
  .ebiuif_ebiu_arsize        (ebiuif_ebiu_arsize       ),
  .ebiuif_ebiu_arsnoop       (ebiuif_ebiu_arsnoop      ),
  .ebiuif_ebiu_arvalid       (ebiuif_ebiu_arvalid      ),
  .ebiuif_ebiu_cddata        (ebiuif_ebiu_cddata       ),
  .ebiuif_ebiu_cdlast        (ebiuif_ebiu_cdlast       ),
  .ebiuif_ebiu_cdvalid       (ebiuif_ebiu_cdvalid      ),
  .ebiuif_ebiu_crresp        (ebiuif_ebiu_crresp       ),
  .ebiuif_ebiu_crvalid       (ebiuif_ebiu_crvalid      ),
  .ebiuif_ebiu_r_grant       (ebiuif_ebiu_r_grant      ),
  .ebiuif_snb0_acvalid       (ebiuif_snb0_acvalid      ),
  .ebiuif_snb0_ar_grant      (ebiuif_snb0_ar_grant     ),
  .ebiuif_snb0_ar_grant_gate (ebiuif_snb0_ar_grant_gate),
  .ebiuif_snb0_rvalid        (ebiuif_snb0_rvalid       ),
  .ebiuif_snb1_acvalid       (ebiuif_snb1_acvalid      ),
  .ebiuif_snb1_ar_grant      (ebiuif_snb1_ar_grant     ),
  .ebiuif_snb1_ar_grant_gate (ebiuif_snb1_ar_grant_gate),
  .ebiuif_snb1_rvalid        (ebiuif_snb1_rvalid       ),
  .ebiuif_snbx_acbus         (ebiuif_snbx_acbus        ),
  .ebiuif_vb_index           (ebiuif_vb_index          ),
  .ebiuif_xx_entry_sel       (ebiuif_xx_entry_sel      ),
  .ebiuif_xx_rdata           (ebiuif_xx_rdata          ),
  .ebiuif_xx_rlast           (ebiuif_xx_rlast          ),
  .ebiuif_xx_rresp           (ebiuif_xx_rresp          ),
  .forever_cpuclk            (ciu_top_clk              ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .snb0_ebiuif_ac_grant      (snb0_ebiuif_ac_grant     ),
  .snb0_ebiuif_arbus         (snb0_ebiuif_arbus        ),
  .snb0_ebiuif_arvalid       (snb0_ebiuif_arvalid      ),
  .snb1_ebiuif_ac_grant      (snb1_ebiuif_ac_grant     ),
  .snb1_ebiuif_arbus         (snb1_ebiuif_arbus        ),
  .snb1_ebiuif_arvalid       (snb1_ebiuif_arvalid      ),
  .vb_ebiuif_addr_depd       (vb_ebiuif_addr_depd      )
);

// &Connect( @603
//   .forever_cpuclk       (ciu_top_clk              ) @604
// ); @605

//================================================
//           instance l2cif
//================================================
// &Instance("ct_ciu_l2cif", "x_ct_ciu_l2cif"); @610
ct_ciu_l2cif  x_ct_ciu_l2cif (
  .ciu_icg_en                     (ciu_icg_en                    ),
  .ciu_l2c_addr_bank_0            (ciu_l2c_addr_bank_0           ),
  .ciu_l2c_addr_bank_1            (ciu_l2c_addr_bank_1           ),
  .ciu_l2c_addr_vld_bank_0        (ciu_l2c_addr_vld_bank_0       ),
  .ciu_l2c_addr_vld_bank_1        (ciu_l2c_addr_vld_bank_1       ),
  .ciu_l2c_clr_cp_bank_0          (ciu_l2c_clr_cp_bank_0         ),
  .ciu_l2c_clr_cp_bank_1          (ciu_l2c_clr_cp_bank_1         ),
  .ciu_l2c_ctcq_req_bank_0        (ciu_l2c_ctcq_req_bank_0       ),
  .ciu_l2c_ctcq_req_bank_1        (ciu_l2c_ctcq_req_bank_1       ),
  .ciu_l2c_data_vld_bank_0        (ciu_l2c_data_vld_bank_0       ),
  .ciu_l2c_data_vld_bank_1        (ciu_l2c_data_vld_bank_1       ),
  .ciu_l2c_dca_addr_bank_0        (ciu_l2c_dca_addr_bank_0       ),
  .ciu_l2c_dca_addr_bank_1        (ciu_l2c_dca_addr_bank_1       ),
  .ciu_l2c_dca_req_bank_0         (ciu_l2c_dca_req_bank_0        ),
  .ciu_l2c_dca_req_bank_1         (ciu_l2c_dca_req_bank_1        ),
  .ciu_l2c_hpcp_bus_bank_0        (ciu_l2c_hpcp_bus_bank_0       ),
  .ciu_l2c_hpcp_bus_bank_1        (ciu_l2c_hpcp_bus_bank_1       ),
  .ciu_l2c_icc_mid_bank_0         (ciu_l2c_icc_mid_bank_0        ),
  .ciu_l2c_icc_mid_bank_1         (ciu_l2c_icc_mid_bank_1        ),
  .ciu_l2c_icc_type_bank_0        (ciu_l2c_icc_type_bank_0       ),
  .ciu_l2c_icc_type_bank_1        (ciu_l2c_icc_type_bank_1       ),
  .ciu_l2c_mid_bank_0             (ciu_l2c_mid_bank_0            ),
  .ciu_l2c_mid_bank_1             (ciu_l2c_mid_bank_1            ),
  .ciu_l2c_prf_ready              (ciu_l2c_prf_ready             ),
  .ciu_l2c_rdl_ready_bank_0       (ciu_l2c_rdl_ready_bank_0      ),
  .ciu_l2c_rdl_ready_bank_1       (ciu_l2c_rdl_ready_bank_1      ),
  .ciu_l2c_set_cp_bank_0          (ciu_l2c_set_cp_bank_0         ),
  .ciu_l2c_set_cp_bank_1          (ciu_l2c_set_cp_bank_1         ),
  .ciu_l2c_sid_bank_0             (ciu_l2c_sid_bank_0            ),
  .ciu_l2c_sid_bank_1             (ciu_l2c_sid_bank_1            ),
  .ciu_l2c_snpl2_ready_bank_0     (ciu_l2c_snpl2_ready_bank_0    ),
  .ciu_l2c_snpl2_ready_bank_1     (ciu_l2c_snpl2_ready_bank_1    ),
  .ciu_l2c_src_bank_0             (ciu_l2c_src_bank_0            ),
  .ciu_l2c_src_bank_1             (ciu_l2c_src_bank_1            ),
  .ciu_l2c_type_bank_0            (ciu_l2c_type_bank_0           ),
  .ciu_l2c_type_bank_1            (ciu_l2c_type_bank_1           ),
  .ciu_l2c_wdata_bank_0           (ciu_l2c_wdata_bank_0          ),
  .ciu_l2c_wdata_bank_1           (ciu_l2c_wdata_bank_1          ),
  .cpurst_b                       (cpurst_b                      ),
  .ctcq_l2c_addr_req              (ctcq_l2c_addr_req             ),
  .ctcq_l2c_req_type              (ctcq_l2c_req_type             ),
  .forever_cpuclk                 (ciu_top_clk                   ),
  .l2c0_vb_awbus                  (l2c0_vb_awbus                 ),
  .l2c0_vb_awvalid                (l2c0_vb_awvalid               ),
  .l2c0_vb_mid                    (l2c0_vb_mid                   ),
  .l2c0_vb_vid                    (l2c0_vb_vid                   ),
  .l2c0_vb_wbus                   (l2c0_vb_wbus                  ),
  .l2c0_vb_wvalid                 (l2c0_vb_wvalid                ),
  .l2c1_vb_awbus                  (l2c1_vb_awbus                 ),
  .l2c1_vb_awvalid                (l2c1_vb_awvalid               ),
  .l2c1_vb_mid                    (l2c1_vb_mid                   ),
  .l2c1_vb_vid                    (l2c1_vb_vid                   ),
  .l2c1_vb_wbus                   (l2c1_vb_wbus                  ),
  .l2c1_vb_wvalid                 (l2c1_vb_wvalid                ),
  .l2c_ciu_addr_ready_bank_0      (l2c_ciu_addr_ready_bank_0     ),
  .l2c_ciu_addr_ready_bank_1      (l2c_ciu_addr_ready_bank_1     ),
  .l2c_ciu_cmplt_bank_0           (l2c_ciu_cmplt_bank_0          ),
  .l2c_ciu_cmplt_bank_1           (l2c_ciu_cmplt_bank_1          ),
  .l2c_ciu_cp_bank_0              (l2c_ciu_cp_bank_0             ),
  .l2c_ciu_cp_bank_1              (l2c_ciu_cp_bank_1             ),
  .l2c_ciu_ctcq_cmplt_bank_0      (l2c_ciu_ctcq_cmplt_bank_0     ),
  .l2c_ciu_ctcq_cmplt_bank_1      (l2c_ciu_ctcq_cmplt_bank_1     ),
  .l2c_ciu_ctcq_ready_bank_0      (l2c_ciu_ctcq_ready_bank_0     ),
  .l2c_ciu_ctcq_ready_bank_1      (l2c_ciu_ctcq_ready_bank_1     ),
  .l2c_ciu_data_bank_0            (l2c_ciu_data_bank_0           ),
  .l2c_ciu_data_bank_1            (l2c_ciu_data_bank_1           ),
  .l2c_ciu_data_ready_bank_0      (l2c_ciu_data_ready_bank_0     ),
  .l2c_ciu_data_ready_bank_1      (l2c_ciu_data_ready_bank_1     ),
  .l2c_ciu_data_ready_gate_bank_0 (l2c_ciu_data_ready_gate_bank_0),
  .l2c_ciu_data_ready_gate_bank_1 (l2c_ciu_data_ready_gate_bank_1),
  .l2c_ciu_dca_cmplt_bank_0       (l2c_ciu_dca_cmplt_bank_0      ),
  .l2c_ciu_dca_cmplt_bank_1       (l2c_ciu_dca_cmplt_bank_1      ),
  .l2c_ciu_dca_data_bank_0        (l2c_ciu_dca_data_bank_0       ),
  .l2c_ciu_dca_data_bank_1        (l2c_ciu_dca_data_bank_1       ),
  .l2c_ciu_dca_ready_bank_0       (l2c_ciu_dca_ready_bank_0      ),
  .l2c_ciu_dca_ready_bank_1       (l2c_ciu_dca_ready_bank_1      ),
  .l2c_ciu_hpcp_acc_inc_bank_0    (l2c_ciu_hpcp_acc_inc_bank_0   ),
  .l2c_ciu_hpcp_acc_inc_bank_1    (l2c_ciu_hpcp_acc_inc_bank_1   ),
  .l2c_ciu_hpcp_mid_bank_0        (l2c_ciu_hpcp_mid_bank_0       ),
  .l2c_ciu_hpcp_mid_bank_1        (l2c_ciu_hpcp_mid_bank_1       ),
  .l2c_ciu_hpcp_miss_inc_bank_0   (l2c_ciu_hpcp_miss_inc_bank_0  ),
  .l2c_ciu_hpcp_miss_inc_bank_1   (l2c_ciu_hpcp_miss_inc_bank_1  ),
  .l2c_ciu_prf_addr               (l2c_ciu_prf_addr              ),
  .l2c_ciu_prf_prot               (l2c_ciu_prf_prot              ),
  .l2c_ciu_prf_vld                (l2c_ciu_prf_vld               ),
  .l2c_ciu_rdl_addr_bank_0        (l2c_ciu_rdl_addr_bank_0       ),
  .l2c_ciu_rdl_addr_bank_1        (l2c_ciu_rdl_addr_bank_1       ),
  .l2c_ciu_rdl_dvld_bank_0        (l2c_ciu_rdl_dvld_bank_0       ),
  .l2c_ciu_rdl_dvld_bank_1        (l2c_ciu_rdl_dvld_bank_1       ),
  .l2c_ciu_rdl_mid_bank_0         (l2c_ciu_rdl_mid_bank_0        ),
  .l2c_ciu_rdl_mid_bank_1         (l2c_ciu_rdl_mid_bank_1        ),
  .l2c_ciu_rdl_prot_bank_0        (l2c_ciu_rdl_prot_bank_0       ),
  .l2c_ciu_rdl_prot_bank_1        (l2c_ciu_rdl_prot_bank_1       ),
  .l2c_ciu_rdl_rvld_bank_0        (l2c_ciu_rdl_rvld_bank_0       ),
  .l2c_ciu_rdl_rvld_bank_1        (l2c_ciu_rdl_rvld_bank_1       ),
  .l2c_ciu_resp_bank_0            (l2c_ciu_resp_bank_0           ),
  .l2c_ciu_resp_bank_1            (l2c_ciu_resp_bank_1           ),
  .l2c_ciu_sid_bank_0             (l2c_ciu_sid_bank_0            ),
  .l2c_ciu_sid_bank_1             (l2c_ciu_sid_bank_1            ),
  .l2c_ciu_snpl2_addr_bank_0      (l2c_ciu_snpl2_addr_bank_0     ),
  .l2c_ciu_snpl2_addr_bank_1      (l2c_ciu_snpl2_addr_bank_1     ),
  .l2c_ciu_snpl2_ini_sid_bank_0   (l2c_ciu_snpl2_ini_sid_bank_0  ),
  .l2c_ciu_snpl2_ini_sid_bank_1   (l2c_ciu_snpl2_ini_sid_bank_1  ),
  .l2c_ciu_snpl2_vld_bank_0       (l2c_ciu_snpl2_vld_bank_0      ),
  .l2c_ciu_snpl2_vld_bank_1       (l2c_ciu_snpl2_vld_bank_1      ),
  .l2c_ctcq_cmplt                 (l2c_ctcq_cmplt                ),
  .l2c_snb0_addr_grant            (l2c_snb0_addr_grant           ),
  .l2c_snb0_cmplt                 (l2c_snb0_cmplt                ),
  .l2c_snb0_cmplt_sid             (l2c_snb0_cmplt_sid            ),
  .l2c_snb0_cp                    (l2c_snb0_cp                   ),
  .l2c_snb0_data                  (l2c_snb0_data                 ),
  .l2c_snb0_data_grant            (l2c_snb0_data_grant           ),
  .l2c_snb0_data_grant_gate       (l2c_snb0_data_grant_gate      ),
  .l2c_snb0_prf_bus               (l2c_snb0_prf_bus              ),
  .l2c_snb0_prf_req               (l2c_snb0_prf_req              ),
  .l2c_snb0_resp                  (l2c_snb0_resp                 ),
  .l2c_snb0_snpl2_bus             (l2c_snb0_snpl2_bus            ),
  .l2c_snb0_snpl2_ini_sid         (l2c_snb0_snpl2_ini_sid        ),
  .l2c_snb0_snpl2_req             (l2c_snb0_snpl2_req            ),
  .l2c_snb1_addr_grant            (l2c_snb1_addr_grant           ),
  .l2c_snb1_cmplt                 (l2c_snb1_cmplt                ),
  .l2c_snb1_cmplt_sid             (l2c_snb1_cmplt_sid            ),
  .l2c_snb1_cp                    (l2c_snb1_cp                   ),
  .l2c_snb1_data                  (l2c_snb1_data                 ),
  .l2c_snb1_data_grant            (l2c_snb1_data_grant           ),
  .l2c_snb1_data_grant_gate       (l2c_snb1_data_grant_gate      ),
  .l2c_snb1_prf_bus               (l2c_snb1_prf_bus              ),
  .l2c_snb1_prf_req               (l2c_snb1_prf_req              ),
  .l2c_snb1_resp                  (l2c_snb1_resp                 ),
  .l2c_snb1_snpl2_bus             (l2c_snb1_snpl2_bus            ),
  .l2c_snb1_snpl2_ini_sid         (l2c_snb1_snpl2_ini_sid        ),
  .l2c_snb1_snpl2_req             (l2c_snb1_snpl2_req            ),
  .l2cif0_regs_read_acc_inc       (l2cif0_regs_read_acc_inc      ),
  .l2cif0_regs_read_miss_inc      (l2cif0_regs_read_miss_inc     ),
  .l2cif0_regs_write_acc_inc      (l2cif0_regs_write_acc_inc     ),
  .l2cif0_regs_write_miss_inc     (l2cif0_regs_write_miss_inc    ),
  .l2cif1_regs_read_acc_inc       (l2cif1_regs_read_acc_inc      ),
  .l2cif1_regs_read_miss_inc      (l2cif1_regs_read_miss_inc     ),
  .l2cif1_regs_write_acc_inc      (l2cif1_regs_write_acc_inc     ),
  .l2cif1_regs_write_miss_inc     (l2cif1_regs_write_miss_inc    ),
  .l2cif_piu0_read_data_vld       (l2cif_piu0_read_data_vld      ),
  .l2cif_piu1_read_data_vld       (l2cif_piu1_read_data_vld      ),
  .l2cif_piu2_read_data_vld       (l2cif_piu2_read_data_vld      ),
  .l2cif_piu3_read_data_vld       (l2cif_piu3_read_data_vld      ),
  .l2cif_piux_read_data           (l2cif_piux_read_data          ),
  .pad_yy_icg_scan_en             (pad_yy_icg_scan_en            ),
  .piu0_l2cif_read_data           (piu0_l2cif_read_data          ),
  .piu0_l2cif_read_data_ecc       (piu0_l2cif_read_data_ecc      ),
  .piu0_l2cif_read_index          (piu0_l2cif_read_index         ),
  .piu0_l2cif_read_req            (piu0_l2cif_read_req           ),
  .piu0_l2cif_read_tag            (piu0_l2cif_read_tag           ),
  .piu0_l2cif_read_tag_ecc        (piu0_l2cif_read_tag_ecc       ),
  .piu0_l2cif_read_way            (piu0_l2cif_read_way           ),
  .piu1_l2cif_read_data           (piu1_l2cif_read_data          ),
  .piu1_l2cif_read_data_ecc       (piu1_l2cif_read_data_ecc      ),
  .piu1_l2cif_read_index          (piu1_l2cif_read_index         ),
  .piu1_l2cif_read_req            (piu1_l2cif_read_req           ),
  .piu1_l2cif_read_tag            (piu1_l2cif_read_tag           ),
  .piu1_l2cif_read_tag_ecc        (piu1_l2cif_read_tag_ecc       ),
  .piu1_l2cif_read_way            (piu1_l2cif_read_way           ),
  .piu2_l2cif_read_data           (piu2_l2cif_read_data          ),
  .piu2_l2cif_read_data_ecc       (piu2_l2cif_read_data_ecc      ),
  .piu2_l2cif_read_index          (piu2_l2cif_read_index         ),
  .piu2_l2cif_read_req            (piu2_l2cif_read_req           ),
  .piu2_l2cif_read_tag            (piu2_l2cif_read_tag           ),
  .piu2_l2cif_read_tag_ecc        (piu2_l2cif_read_tag_ecc       ),
  .piu2_l2cif_read_way            (piu2_l2cif_read_way           ),
  .piu3_l2cif_read_data           (piu3_l2cif_read_data          ),
  .piu3_l2cif_read_data_ecc       (piu3_l2cif_read_data_ecc      ),
  .piu3_l2cif_read_index          (piu3_l2cif_read_index         ),
  .piu3_l2cif_read_req            (piu3_l2cif_read_req           ),
  .piu3_l2cif_read_tag            (piu3_l2cif_read_tag           ),
  .piu3_l2cif_read_tag_ecc        (piu3_l2cif_read_tag_ecc       ),
  .piu3_l2cif_read_way            (piu3_l2cif_read_way           ),
  .snb0_l2c_addr_bus              (snb0_l2c_addr_bus             ),
  .snb0_l2c_addr_req              (snb0_l2c_addr_req             ),
  .snb0_l2c_data_bus              (snb0_l2c_data_bus             ),
  .snb0_l2c_data_req              (snb0_l2c_data_req             ),
  .snb0_l2c_hpcp_bus              (snb0_l2c_hpcp_bus             ),
  .snb0_l2c_prf_grant             (snb0_l2c_prf_grant            ),
  .snb0_l2c_snpl2_grant           (snb0_l2c_snpl2_grant          ),
  .snb1_l2c_addr_bus              (snb1_l2c_addr_bus             ),
  .snb1_l2c_addr_req              (snb1_l2c_addr_req             ),
  .snb1_l2c_data_bus              (snb1_l2c_data_bus             ),
  .snb1_l2c_data_req              (snb1_l2c_data_req             ),
  .snb1_l2c_hpcp_bus              (snb1_l2c_hpcp_bus             ),
  .snb1_l2c_prf_grant             (snb1_l2c_prf_grant            ),
  .snb1_l2c_snpl2_grant           (snb1_l2c_snpl2_grant          ),
  .vb_l2c0_vctm_grant             (vb_l2c0_vctm_grant            ),
  .vb_l2c1_vctm_grant             (vb_l2c1_vctm_grant            ),
  .vb_yy_grant_id                 (vb_yy_grant_id                )
);

// &Connect( @611
//   .forever_cpuclk       (ciu_top_clk              ) @612
// ); @613

//================================================
//           instance ctcq
//================================================
// &Instance("ct_ciu_ctcq","x_ct_ciu_ctcq"); @618
ct_ciu_ctcq  x_ct_ciu_ctcq (
  .bmbif_ctcq_bar_req   (bmbif_ctcq_bar_req  ),
  .bmbif_ctcq_mid       (bmbif_ctcq_mid      ),
  .bmbif_ctcq_req_bus   (bmbif_ctcq_req_bus  ),
  .ciu_chr2_dvm_dis     (ciu_chr2_dvm_dis    ),
  .ciu_icg_en           (ciu_icg_en          ),
  .ciu_xx_smpen         (ciu_xx_smpen        ),
  .cpurst_b             (cpurst_b            ),
  .ctcq_bmbif_bar_grant (ctcq_bmbif_bar_grant),
  .ctcq_dbg_info        (ctcq_dbg_info       ),
  .ctcq_ebiu_araddr     (ctcq_ebiu_araddr    ),
  .ctcq_ebiu_arbar      (ctcq_ebiu_arbar     ),
  .ctcq_ebiu_arburst    (ctcq_ebiu_arburst   ),
  .ctcq_ebiu_arcache    (ctcq_ebiu_arcache   ),
  .ctcq_ebiu_ardomain   (ctcq_ebiu_ardomain  ),
  .ctcq_ebiu_arid       (ctcq_ebiu_arid      ),
  .ctcq_ebiu_arlen      (ctcq_ebiu_arlen     ),
  .ctcq_ebiu_arlock     (ctcq_ebiu_arlock    ),
  .ctcq_ebiu_arprot     (ctcq_ebiu_arprot    ),
  .ctcq_ebiu_arsize     (ctcq_ebiu_arsize    ),
  .ctcq_ebiu_arsnoop    (ctcq_ebiu_arsnoop   ),
  .ctcq_ebiu_arvalid    (ctcq_ebiu_arvalid   ),
  .ctcq_ebiu_r_grant    (ctcq_ebiu_r_grant   ),
  .ctcq_ebiuif_ac_grant (ctcq_ebiuif_ac_grant),
  .ctcq_ebiuif_crresp   (ctcq_ebiuif_crresp  ),
  .ctcq_ebiuif_crvalid  (ctcq_ebiuif_crvalid ),
  .ctcq_l2c_addr_req    (ctcq_l2c_addr_req   ),
  .ctcq_l2c_req_type    (ctcq_l2c_req_type   ),
  .ctcq_piu0_acbus      (ctcq_piu0_acbus     ),
  .ctcq_piu0_acvalid    (ctcq_piu0_acvalid   ),
  .ctcq_piu0_ar_grant   (ctcq_piu0_ar_grant  ),
  .ctcq_piu0_bar_cmplt  (ctcq_piu0_bar_cmplt ),
  .ctcq_piu0_cr_grant   (ctcq_piu0_cr_grant  ),
  .ctcq_piu0_rvalid     (ctcq_piu0_rvalid    ),
  .ctcq_piu1_acbus      (ctcq_piu1_acbus     ),
  .ctcq_piu1_acvalid    (ctcq_piu1_acvalid   ),
  .ctcq_piu1_ar_grant   (ctcq_piu1_ar_grant  ),
  .ctcq_piu1_bar_cmplt  (ctcq_piu1_bar_cmplt ),
  .ctcq_piu1_cr_grant   (ctcq_piu1_cr_grant  ),
  .ctcq_piu1_rvalid     (ctcq_piu1_rvalid    ),
  .ctcq_piu2_acbus      (ctcq_piu2_acbus     ),
  .ctcq_piu2_acvalid    (ctcq_piu2_acvalid   ),
  .ctcq_piu2_ar_grant   (ctcq_piu2_ar_grant  ),
  .ctcq_piu2_bar_cmplt  (ctcq_piu2_bar_cmplt ),
  .ctcq_piu2_cr_grant   (ctcq_piu2_cr_grant  ),
  .ctcq_piu2_rvalid     (ctcq_piu2_rvalid    ),
  .ctcq_piu3_acbus      (ctcq_piu3_acbus     ),
  .ctcq_piu3_acvalid    (ctcq_piu3_acvalid   ),
  .ctcq_piu3_ar_grant   (ctcq_piu3_ar_grant  ),
  .ctcq_piu3_bar_cmplt  (ctcq_piu3_bar_cmplt ),
  .ctcq_piu3_cr_grant   (ctcq_piu3_cr_grant  ),
  .ctcq_piu3_rvalid     (ctcq_piu3_rvalid    ),
  .ctcq_piux_rbus       (ctcq_piux_rbus      ),
  .ctcq_xx_no_op        (ctcq_xx_no_op       ),
  .ebiu_ctcq_ar_grant   (ebiu_ctcq_ar_grant  ),
  .ebiu_ctcq_rid        (ebiu_ctcq_rid       ),
  .ebiu_ctcq_rvalid     (ebiu_ctcq_rvalid    ),
  .ebiuif_ctcq_acaddr   (ebiuif_ctcq_acaddr  ),
  .ebiuif_ctcq_acid     (ebiuif_ctcq_acid    ),
  .ebiuif_ctcq_acsnoop  (ebiuif_ctcq_acsnoop ),
  .ebiuif_ctcq_acvalid  (ebiuif_ctcq_acvalid ),
  .ebiuif_ctcq_cr_grant (ebiuif_ctcq_cr_grant),
  .forever_cpuclk       (ciu_top_clk         ),
  .l2c_ctcq_cmplt       (l2c_ctcq_cmplt      ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  ),
  .piu0_ctcq_ac_grant   (piu0_ctcq_ac_grant  ),
  .piu0_ctcq_ar_bus     (piu0_ctcq_ar_bus    ),
  .piu0_ctcq_ar_req     (piu0_ctcq_ar_req    ),
  .piu0_ctcq_cr_bus     (piu0_ctcq_cr_bus    ),
  .piu0_ctcq_cr_req     (piu0_ctcq_cr_req    ),
  .piu0_ctcq_r_grant    (piu0_ctcq_r_grant   ),
  .piu1_ctcq_ac_grant   (piu1_ctcq_ac_grant  ),
  .piu1_ctcq_ar_bus     (piu1_ctcq_ar_bus    ),
  .piu1_ctcq_ar_req     (piu1_ctcq_ar_req    ),
  .piu1_ctcq_cr_bus     (piu1_ctcq_cr_bus    ),
  .piu1_ctcq_cr_req     (piu1_ctcq_cr_req    ),
  .piu1_ctcq_r_grant    (piu1_ctcq_r_grant   ),
  .piu2_ctcq_ac_grant   (piu2_ctcq_ac_grant  ),
  .piu2_ctcq_ar_bus     (piu2_ctcq_ar_bus    ),
  .piu2_ctcq_ar_req     (piu2_ctcq_ar_req    ),
  .piu2_ctcq_cr_bus     (piu2_ctcq_cr_bus    ),
  .piu2_ctcq_cr_req     (piu2_ctcq_cr_req    ),
  .piu2_ctcq_r_grant    (piu2_ctcq_r_grant   ),
  .piu3_ctcq_ac_grant   (piu3_ctcq_ac_grant  ),
  .piu3_ctcq_ar_bus     (piu3_ctcq_ar_bus    ),
  .piu3_ctcq_ar_req     (piu3_ctcq_ar_req    ),
  .piu3_ctcq_cr_bus     (piu3_ctcq_cr_bus    ),
  .piu3_ctcq_cr_req     (piu3_ctcq_cr_req    ),
  .piu3_ctcq_r_grant    (piu3_ctcq_r_grant   )
);

// &Connect(.forever_cpuclk (ciu_top_clk)); @619


//================================================
//           instance ncq
//================================================
// &Instance("ct_ciu_ncq","x_ct_ciu_ncq"); @658
ct_ciu_ncq  x_ct_ciu_ncq (
  .apbif_ncq_ar_grant      (apbif_ncq_ar_grant     ),
  .apbif_ncq_aw_grant      (apbif_ncq_aw_grant     ),
  .apbif_ncq_bid           (apbif_ncq_bid          ),
  .apbif_ncq_bresp         (apbif_ncq_bresp        ),
  .apbif_ncq_bvalid        (apbif_ncq_bvalid       ),
  .apbif_ncq_rdata         (apbif_ncq_rdata        ),
  .apbif_ncq_rid           (apbif_ncq_rid          ),
  .apbif_ncq_rlast         (apbif_ncq_rlast        ),
  .apbif_ncq_rresp         (apbif_ncq_rresp        ),
  .apbif_ncq_rvalid        (apbif_ncq_rvalid       ),
  .apbif_ncq_w_grant       (apbif_ncq_w_grant      ),
  .bmbif_ncq_bar_req       (bmbif_ncq_bar_req      ),
  .bmbif_ncq_mid           (bmbif_ncq_mid          ),
  .bmbif_ncq_req_bus       (bmbif_ncq_req_bus      ),
  .ciu_chr2_bar_dis        (ciu_chr2_bar_dis       ),
  .ciu_icg_en              (ciu_icg_en             ),
  .ciu_so_ostd_dis         (ciu_so_ostd_dis        ),
  .cpurst_b                (cpurst_b               ),
  .ebiu_ncq_ar_grant       (ebiu_ncq_ar_grant      ),
  .ebiu_ncq_ar_grant_gate  (ebiu_ncq_ar_grant_gate ),
  .ebiu_ncq_aw_grant       (ebiu_ncq_aw_grant      ),
  .ebiu_ncq_aw_grant_gated (ebiu_ncq_aw_grant_gated),
  .ebiu_ncq_bid            (ebiu_ncq_bid           ),
  .ebiu_ncq_bresp          (ebiu_ncq_bresp         ),
  .ebiu_ncq_bvalid         (ebiu_ncq_bvalid        ),
  .ebiu_ncq_rdata          (ebiu_ncq_rdata         ),
  .ebiu_ncq_rid            (ebiu_ncq_rid           ),
  .ebiu_ncq_rlast          (ebiu_ncq_rlast         ),
  .ebiu_ncq_rresp          (ebiu_ncq_rresp         ),
  .ebiu_ncq_rvalid         (ebiu_ncq_rvalid        ),
  .ebiu_ncq_w_grant        (ebiu_ncq_w_grant       ),
  .forever_cpuclk          (ciu_top_clk            ),
  .ncq_apbif_arvalid       (ncq_apbif_arvalid      ),
  .ncq_apbif_awvalid       (ncq_apbif_awvalid      ),
  .ncq_apbif_b_grant       (ncq_apbif_b_grant      ),
  .ncq_apbif_r_grant       (ncq_apbif_r_grant      ),
  .ncq_apbif_wvalid        (ncq_apbif_wvalid       ),
  .ncq_bmbif_bar_grant     (ncq_bmbif_bar_grant    ),
  .ncq_dbg_info            (ncq_dbg_info           ),
  .ncq_ebiu_arvalid        (ncq_ebiu_arvalid       ),
  .ncq_ebiu_awvalid        (ncq_ebiu_awvalid       ),
  .ncq_ebiu_b_grant        (ncq_ebiu_b_grant       ),
  .ncq_ebiu_r_grant        (ncq_ebiu_r_grant       ),
  .ncq_ebiu_wvalid         (ncq_ebiu_wvalid        ),
  .ncq_piu0_ar_grant       (ncq_piu0_ar_grant      ),
  .ncq_piu0_aw_grant       (ncq_piu0_aw_grant      ),
  .ncq_piu0_bar_cmplt      (ncq_piu0_bar_cmplt     ),
  .ncq_piu0_bbus           (ncq_piu0_bbus          ),
  .ncq_piu0_bvalid         (ncq_piu0_bvalid        ),
  .ncq_piu0_rvalid         (ncq_piu0_rvalid        ),
  .ncq_piu0_wcd_grant      (ncq_piu0_wcd_grant     ),
  .ncq_piu1_ar_grant       (ncq_piu1_ar_grant      ),
  .ncq_piu1_aw_grant       (ncq_piu1_aw_grant      ),
  .ncq_piu1_bar_cmplt      (ncq_piu1_bar_cmplt     ),
  .ncq_piu1_bbus           (ncq_piu1_bbus          ),
  .ncq_piu1_bvalid         (ncq_piu1_bvalid        ),
  .ncq_piu1_rvalid         (ncq_piu1_rvalid        ),
  .ncq_piu1_wcd_grant      (ncq_piu1_wcd_grant     ),
  .ncq_piu2_ar_grant       (ncq_piu2_ar_grant      ),
  .ncq_piu2_aw_grant       (ncq_piu2_aw_grant      ),
  .ncq_piu2_bar_cmplt      (ncq_piu2_bar_cmplt     ),
  .ncq_piu2_bbus           (ncq_piu2_bbus          ),
  .ncq_piu2_bvalid         (ncq_piu2_bvalid        ),
  .ncq_piu2_rvalid         (ncq_piu2_rvalid        ),
  .ncq_piu2_wcd_grant      (ncq_piu2_wcd_grant     ),
  .ncq_piu3_ar_grant       (ncq_piu3_ar_grant      ),
  .ncq_piu3_aw_grant       (ncq_piu3_aw_grant      ),
  .ncq_piu3_bar_cmplt      (ncq_piu3_bar_cmplt     ),
  .ncq_piu3_bbus           (ncq_piu3_bbus          ),
  .ncq_piu3_bvalid         (ncq_piu3_bvalid        ),
  .ncq_piu3_rvalid         (ncq_piu3_rvalid        ),
  .ncq_piu3_wcd_grant      (ncq_piu3_wcd_grant     ),
  .ncq_piux_rbus           (ncq_piux_rbus          ),
  .ncq_xx_araddr           (ncq_xx_araddr          ),
  .ncq_xx_arbar            (ncq_xx_arbar           ),
  .ncq_xx_arburst          (ncq_xx_arburst         ),
  .ncq_xx_arcache          (ncq_xx_arcache         ),
  .ncq_xx_ardomain         (ncq_xx_ardomain        ),
  .ncq_xx_arid             (ncq_xx_arid            ),
  .ncq_xx_arlen            (ncq_xx_arlen           ),
  .ncq_xx_arlock           (ncq_xx_arlock          ),
  .ncq_xx_arprot           (ncq_xx_arprot          ),
  .ncq_xx_arsize           (ncq_xx_arsize          ),
  .ncq_xx_arsnoop          (ncq_xx_arsnoop         ),
  .ncq_xx_aruser           (ncq_xx_aruser          ),
  .ncq_xx_aw_needissue     (ncq_xx_aw_needissue    ),
  .ncq_xx_awaddr           (ncq_xx_awaddr          ),
  .ncq_xx_awbar            (ncq_xx_awbar           ),
  .ncq_xx_awburst          (ncq_xx_awburst         ),
  .ncq_xx_awcache          (ncq_xx_awcache         ),
  .ncq_xx_awdomain         (ncq_xx_awdomain        ),
  .ncq_xx_awid             (ncq_xx_awid            ),
  .ncq_xx_awlen            (ncq_xx_awlen           ),
  .ncq_xx_awlock           (ncq_xx_awlock          ),
  .ncq_xx_awprot           (ncq_xx_awprot          ),
  .ncq_xx_awsize           (ncq_xx_awsize          ),
  .ncq_xx_awsnoop          (ncq_xx_awsnoop         ),
  .ncq_xx_awuser           (ncq_xx_awuser          ),
  .ncq_xx_no_op            (ncq_xx_no_op           ),
  .ncq_xx_wdata            (ncq_xx_wdata           ),
  .ncq_xx_wid              (ncq_xx_wid             ),
  .ncq_xx_wlast            (ncq_xx_wlast           ),
  .ncq_xx_wstrb            (ncq_xx_wstrb           ),
  .pad_yy_icg_scan_en      (pad_yy_icg_scan_en     ),
  .piu0_ncq_ar_bus         (piu0_ncq_ar_bus        ),
  .piu0_ncq_ar_req         (piu0_ncq_ar_req        ),
  .piu0_ncq_aw_bus         (piu0_ncq_aw_bus        ),
  .piu0_ncq_aw_req         (piu0_ncq_aw_req        ),
  .piu0_ncq_b_grant        (piu0_ncq_b_grant       ),
  .piu0_ncq_r_grant        (piu0_ncq_r_grant       ),
  .piu0_ncq_wcd_bus        (piu0_ncq_wcd_bus       ),
  .piu0_ncq_wcd_req        (piu0_ncq_wcd_req       ),
  .piu1_ncq_ar_bus         (piu1_ncq_ar_bus        ),
  .piu1_ncq_ar_req         (piu1_ncq_ar_req        ),
  .piu1_ncq_aw_bus         (piu1_ncq_aw_bus        ),
  .piu1_ncq_aw_req         (piu1_ncq_aw_req        ),
  .piu1_ncq_b_grant        (piu1_ncq_b_grant       ),
  .piu1_ncq_r_grant        (piu1_ncq_r_grant       ),
  .piu1_ncq_wcd_bus        (piu1_ncq_wcd_bus       ),
  .piu1_ncq_wcd_req        (piu1_ncq_wcd_req       ),
  .piu2_ncq_ar_bus         (piu2_ncq_ar_bus        ),
  .piu2_ncq_ar_req         (piu2_ncq_ar_req        ),
  .piu2_ncq_aw_bus         (piu2_ncq_aw_bus        ),
  .piu2_ncq_aw_req         (piu2_ncq_aw_req        ),
  .piu2_ncq_b_grant        (piu2_ncq_b_grant       ),
  .piu2_ncq_r_grant        (piu2_ncq_r_grant       ),
  .piu2_ncq_wcd_bus        (piu2_ncq_wcd_bus       ),
  .piu2_ncq_wcd_req        (piu2_ncq_wcd_req       ),
  .piu3_ncq_ar_bus         (piu3_ncq_ar_bus        ),
  .piu3_ncq_ar_req         (piu3_ncq_ar_req        ),
  .piu3_ncq_aw_bus         (piu3_ncq_aw_bus        ),
  .piu3_ncq_aw_req         (piu3_ncq_aw_req        ),
  .piu3_ncq_b_grant        (piu3_ncq_b_grant       ),
  .piu3_ncq_r_grant        (piu3_ncq_r_grant       ),
  .piu3_ncq_wcd_bus        (piu3_ncq_wcd_bus       ),
  .piu3_ncq_wcd_req        (piu3_ncq_wcd_req       ),
  .sysio_ciu_apb_base      (sysio_ciu_apb_base     )
);

// &Connect( @659
//   .forever_cpuclk       (ciu_top_clk              ) @660
// ); @661


//================================================
//           instance ebiu top
//================================================
// &ConnRule(s/ebiu_pad_/biu_pad_/); @667
// &ConnRule(s/pad_ebiu_/pad_biu_/); @668
// &Instance("ct_ebiu_top","x_ct_ebiu_top"); @669
ct_ebiu_top  x_ct_ebiu_top (
  .ciu_icg_en                (ciu_icg_en               ),
  .ciu_so_ostd_dis           (ciu_so_ostd_dis          ),
  .ciu_top_clk               (ciu_top_clk              ),
  .clk_en                    (clk_en                   ),
  .cpurst_b                  (cpurst_b                 ),
  .ctcq_ebiu_araddr          (ctcq_ebiu_araddr         ),
  .ctcq_ebiu_arbar           (ctcq_ebiu_arbar          ),
  .ctcq_ebiu_arburst         (ctcq_ebiu_arburst        ),
  .ctcq_ebiu_arcache         (ctcq_ebiu_arcache        ),
  .ctcq_ebiu_ardomain        (ctcq_ebiu_ardomain       ),
  .ctcq_ebiu_arid            (ctcq_ebiu_arid           ),
  .ctcq_ebiu_arlen           (ctcq_ebiu_arlen          ),
  .ctcq_ebiu_arlock          (ctcq_ebiu_arlock         ),
  .ctcq_ebiu_arprot          (ctcq_ebiu_arprot         ),
  .ctcq_ebiu_arsize          (ctcq_ebiu_arsize         ),
  .ctcq_ebiu_arsnoop         (ctcq_ebiu_arsnoop        ),
  .ctcq_ebiu_arvalid         (ctcq_ebiu_arvalid        ),
  .ctcq_ebiu_r_grant         (ctcq_ebiu_r_grant        ),
  .ebiu_ctcq_ar_grant        (ebiu_ctcq_ar_grant       ),
  .ebiu_ctcq_rid             (ebiu_ctcq_rid            ),
  .ebiu_ctcq_rvalid          (ebiu_ctcq_rvalid         ),
  .ebiu_ebiuif_acaddr        (ebiu_ebiuif_acaddr       ),
  .ebiu_ebiuif_acid          (ebiu_ebiuif_acid         ),
  .ebiu_ebiuif_acprot        (ebiu_ebiuif_acprot       ),
  .ebiu_ebiuif_acsnoop       (ebiu_ebiuif_acsnoop      ),
  .ebiu_ebiuif_acvalid       (ebiu_ebiuif_acvalid      ),
  .ebiu_ebiuif_ar_grant      (ebiu_ebiuif_ar_grant     ),
  .ebiu_ebiuif_ar_grant_gate (ebiu_ebiuif_ar_grant_gate),
  .ebiu_ebiuif_cd_grant      (ebiu_ebiuif_cd_grant     ),
  .ebiu_ebiuif_cr_grant      (ebiu_ebiuif_cr_grant     ),
  .ebiu_ebiuif_entry_sel     (ebiu_ebiuif_entry_sel    ),
  .ebiu_ebiuif_rdata         (ebiu_ebiuif_rdata        ),
  .ebiu_ebiuif_rlast         (ebiu_ebiuif_rlast        ),
  .ebiu_ebiuif_rresp         (ebiu_ebiuif_rresp        ),
  .ebiu_ebiuif_snb0_rvalid   (ebiu_ebiuif_snb0_rvalid  ),
  .ebiu_ebiuif_snb1_rvalid   (ebiu_ebiuif_snb1_rvalid  ),
  .ebiu_ncq_ar_grant         (ebiu_ncq_ar_grant        ),
  .ebiu_ncq_ar_grant_gate    (ebiu_ncq_ar_grant_gate   ),
  .ebiu_ncq_aw_grant         (ebiu_ncq_aw_grant        ),
  .ebiu_ncq_aw_grant_gated   (ebiu_ncq_aw_grant_gated  ),
  .ebiu_ncq_bid              (ebiu_ncq_bid             ),
  .ebiu_ncq_bresp            (ebiu_ncq_bresp           ),
  .ebiu_ncq_bvalid           (ebiu_ncq_bvalid          ),
  .ebiu_ncq_rdata            (ebiu_ncq_rdata           ),
  .ebiu_ncq_rid              (ebiu_ncq_rid             ),
  .ebiu_ncq_rlast            (ebiu_ncq_rlast           ),
  .ebiu_ncq_rresp            (ebiu_ncq_rresp           ),
  .ebiu_ncq_rvalid           (ebiu_ncq_rvalid          ),
  .ebiu_ncq_w_grant          (ebiu_ncq_w_grant         ),
  .ebiu_pad_araddr           (biu_pad_araddr           ),
  .ebiu_pad_arburst          (biu_pad_arburst          ),
  .ebiu_pad_arcache          (biu_pad_arcache          ),
  .ebiu_pad_arid             (biu_pad_arid             ),
  .ebiu_pad_arlen            (biu_pad_arlen            ),
  .ebiu_pad_arlock           (biu_pad_arlock           ),
  .ebiu_pad_arprot           (biu_pad_arprot           ),
  .ebiu_pad_arsize           (biu_pad_arsize           ),
  .ebiu_pad_arvalid          (biu_pad_arvalid          ),
  .ebiu_pad_awaddr           (biu_pad_awaddr           ),
  .ebiu_pad_awburst          (biu_pad_awburst          ),
  .ebiu_pad_awcache          (biu_pad_awcache          ),
  .ebiu_pad_awid             (biu_pad_awid             ),
  .ebiu_pad_awlen            (biu_pad_awlen            ),
  .ebiu_pad_awlock           (biu_pad_awlock           ),
  .ebiu_pad_awprot           (biu_pad_awprot           ),
  .ebiu_pad_awsize           (biu_pad_awsize           ),
  .ebiu_pad_awvalid          (biu_pad_awvalid          ),
  .ebiu_pad_back             (biu_pad_back             ),
  .ebiu_pad_bready           (biu_pad_bready           ),
  .ebiu_pad_cactive          (biu_pad_cactive          ),
  .ebiu_pad_csysack          (biu_pad_csysack          ),
  .ebiu_pad_rack             (biu_pad_rack             ),
  .ebiu_pad_rready           (biu_pad_rready           ),
  .ebiu_pad_wdata            (biu_pad_wdata            ),
  .ebiu_pad_wlast            (biu_pad_wlast            ),
  .ebiu_pad_wstrb            (biu_pad_wstrb            ),
  .ebiu_pad_wvalid           (biu_pad_wvalid           ),
  .ebiu_piu0_no_op           (ebiu_piu0_no_op          ),
  .ebiu_piu1_no_op           (ebiu_piu1_no_op          ),
  .ebiu_piu2_no_op           (ebiu_piu2_no_op          ),
  .ebiu_piu3_no_op           (ebiu_piu3_no_op          ),
  .ebiu_vb_aw_grant          (ebiu_vb_aw_grant         ),
  .ebiu_vb_aw_grant_gated    (ebiu_vb_aw_grant_gated   ),
  .ebiu_vb_bid               (ebiu_vb_bid              ),
  .ebiu_vb_bresp             (ebiu_vb_bresp            ),
  .ebiu_vb_bvalid            (ebiu_vb_bvalid           ),
  .ebiu_vb_w_grant           (ebiu_vb_w_grant          ),
  .ebiu_xx_no_op             (ebiu_xx_no_op            ),
  .ebiuif_ebiu_ac_grant      (ebiuif_ebiu_ac_grant     ),
  .ebiuif_ebiu_araddr        (ebiuif_ebiu_araddr       ),
  .ebiuif_ebiu_arbar         (ebiuif_ebiu_arbar        ),
  .ebiuif_ebiu_arburst       (ebiuif_ebiu_arburst      ),
  .ebiuif_ebiu_arcache       (ebiuif_ebiu_arcache      ),
  .ebiuif_ebiu_ardomain      (ebiuif_ebiu_ardomain     ),
  .ebiuif_ebiu_arid          (ebiuif_ebiu_arid         ),
  .ebiuif_ebiu_arlen         (ebiuif_ebiu_arlen        ),
  .ebiuif_ebiu_arlock        (ebiuif_ebiu_arlock       ),
  .ebiuif_ebiu_arprot        (ebiuif_ebiu_arprot       ),
  .ebiuif_ebiu_arsize        (ebiuif_ebiu_arsize       ),
  .ebiuif_ebiu_arsnoop       (ebiuif_ebiu_arsnoop      ),
  .ebiuif_ebiu_arvalid       (ebiuif_ebiu_arvalid      ),
  .ebiuif_ebiu_cddata        (ebiuif_ebiu_cddata       ),
  .ebiuif_ebiu_cdlast        (ebiuif_ebiu_cdlast       ),
  .ebiuif_ebiu_cdvalid       (ebiuif_ebiu_cdvalid      ),
  .ebiuif_ebiu_crresp        (ebiuif_ebiu_crresp       ),
  .ebiuif_ebiu_crvalid       (ebiuif_ebiu_crvalid      ),
  .ebiuif_ebiu_r_grant       (ebiuif_ebiu_r_grant      ),
  .ncq_ebiu_arvalid          (ncq_ebiu_arvalid         ),
  .ncq_ebiu_awvalid          (ncq_ebiu_awvalid         ),
  .ncq_ebiu_b_grant          (ncq_ebiu_b_grant         ),
  .ncq_ebiu_r_grant          (ncq_ebiu_r_grant         ),
  .ncq_ebiu_wvalid           (ncq_ebiu_wvalid          ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_arbar              (ncq_xx_arbar             ),
  .ncq_xx_arburst            (ncq_xx_arburst           ),
  .ncq_xx_arcache            (ncq_xx_arcache           ),
  .ncq_xx_ardomain           (ncq_xx_ardomain          ),
  .ncq_xx_arid               (ncq_xx_arid              ),
  .ncq_xx_arlen              (ncq_xx_arlen             ),
  .ncq_xx_arlock             (ncq_xx_arlock            ),
  .ncq_xx_arprot             (ncq_xx_arprot            ),
  .ncq_xx_arsize             (ncq_xx_arsize            ),
  .ncq_xx_arsnoop            (ncq_xx_arsnoop           ),
  .ncq_xx_aw_needissue       (ncq_xx_aw_needissue      ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awbar              (ncq_xx_awbar             ),
  .ncq_xx_awburst            (ncq_xx_awburst           ),
  .ncq_xx_awcache            (ncq_xx_awcache           ),
  .ncq_xx_awdomain           (ncq_xx_awdomain          ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncq_xx_awlen              (ncq_xx_awlen             ),
  .ncq_xx_awlock             (ncq_xx_awlock            ),
  .ncq_xx_awprot             (ncq_xx_awprot            ),
  .ncq_xx_awsize             (ncq_xx_awsize            ),
  .ncq_xx_awsnoop            (ncq_xx_awsnoop           ),
  .ncq_xx_wdata              (ncq_xx_wdata             ),
  .ncq_xx_wid                (ncq_xx_wid               ),
  .ncq_xx_wlast              (ncq_xx_wlast             ),
  .ncq_xx_wstrb              (ncq_xx_wstrb             ),
  .pad_ebiu_arready          (pad_biu_arready          ),
  .pad_ebiu_awready          (pad_biu_awready          ),
  .pad_ebiu_bid              (pad_biu_bid              ),
  .pad_ebiu_bresp            (pad_biu_bresp            ),
  .pad_ebiu_bvalid           (pad_biu_bvalid           ),
  .pad_ebiu_csysreq          (pad_biu_csysreq          ),
  .pad_ebiu_rdata            (pad_biu_rdata            ),
  .pad_ebiu_rid              (pad_biu_rid              ),
  .pad_ebiu_rlast            (pad_biu_rlast            ),
  .pad_ebiu_rresp            (pad_biu_rresp            ),
  .pad_ebiu_rvalid           (pad_biu_rvalid           ),
  .pad_ebiu_wready           (pad_biu_wready           ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .snb0_snpext_depd_ebiu     (snb0_snpext_depd_ebiu    ),
  .snb0_yy_snpext_index      (snb0_yy_snpext_index     ),
  .snb1_snpext_depd_ebiu     (snb1_snpext_depd_ebiu    ),
  .snb1_yy_snpext_index      (snb1_yy_snpext_index     ),
  .vb_ebiu_awaddr            (vb_ebiu_awaddr           ),
  .vb_ebiu_awbar             (vb_ebiu_awbar            ),
  .vb_ebiu_awburst           (vb_ebiu_awburst          ),
  .vb_ebiu_awcache           (vb_ebiu_awcache          ),
  .vb_ebiu_awdomain          (vb_ebiu_awdomain         ),
  .vb_ebiu_awid              (vb_ebiu_awid             ),
  .vb_ebiu_awlen             (vb_ebiu_awlen            ),
  .vb_ebiu_awlock            (vb_ebiu_awlock           ),
  .vb_ebiu_awprot            (vb_ebiu_awprot           ),
  .vb_ebiu_awsize            (vb_ebiu_awsize           ),
  .vb_ebiu_awsnoop           (vb_ebiu_awsnoop          ),
  .vb_ebiu_awvalid           (vb_ebiu_awvalid          ),
  .vb_ebiu_b_grant           (vb_ebiu_b_grant          ),
  .vb_ebiu_mid               (vb_ebiu_mid              ),
  .vb_ebiu_wdata             (vb_ebiu_wdata            ),
  .vb_ebiu_wid               (vb_ebiu_wid              ),
  .vb_ebiu_wlast             (vb_ebiu_wlast            ),
  .vb_ebiu_wstrb             (vb_ebiu_wstrb            ),
  .vb_ebiu_wvalid            (vb_ebiu_wvalid           )
);

// &Connect( @670
//   .forever_cpuclk       (forever_cpuclk           ), @671
//   .ciu_top_clk          (ciu_top_clk              ) @672
// ); @673


//================================================
//           instance regs
//================================================
// &Instance("ct_ciu_regs"); @679
ct_ciu_regs  x_ct_ciu_regs (
  .ciu_apbif_had_pctrace_inv  (ciu_apbif_had_pctrace_inv ),
  .ciu_chr2_bar_dis           (ciu_chr2_bar_dis          ),
  .ciu_chr2_dvm_dis           (ciu_chr2_dvm_dis          ),
  .ciu_chr2_sf_dis            (ciu_chr2_sf_dis           ),
  .ciu_global_icg_en          (ciu_global_icg_en         ),
  .ciu_icg_en                 (ciu_icg_en                ),
  .ciu_l2c_data_latency       (ciu_l2c_data_latency      ),
  .ciu_l2c_data_setup         (ciu_l2c_data_setup        ),
  .ciu_l2c_iprf               (ciu_l2c_iprf              ),
  .ciu_l2c_rst_req            (ciu_l2c_rst_req           ),
  .ciu_l2c_tag_latency        (ciu_l2c_tag_latency       ),
  .ciu_l2c_tag_setup          (ciu_l2c_tag_setup         ),
  .ciu_l2c_tprf               (ciu_l2c_tprf              ),
  .ciu_so_ostd_dis            (ciu_so_ostd_dis           ),
  .ciu_sysio_icg_en           (ciu_sysio_icg_en          ),
  .ciu_xx_smpen               (ciu_xx_smpen              ),
  .core0_fifo_rst_b           (core0_fifo_rst_b          ),
  .core1_fifo_rst_b           (core1_fifo_rst_b          ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .l2c_icg_en                 (l2c_icg_en                ),
  .l2c_plic_ecc_int_vld       (l2c_plic_ecc_int_vld      ),
  .l2cif0_regs_read_acc_inc   (l2cif0_regs_read_acc_inc  ),
  .l2cif0_regs_read_miss_inc  (l2cif0_regs_read_miss_inc ),
  .l2cif0_regs_write_acc_inc  (l2cif0_regs_write_acc_inc ),
  .l2cif0_regs_write_miss_inc (l2cif0_regs_write_miss_inc),
  .l2cif1_regs_read_acc_inc   (l2cif1_regs_read_acc_inc  ),
  .l2cif1_regs_read_miss_inc  (l2cif1_regs_read_miss_inc ),
  .l2cif1_regs_write_acc_inc  (l2cif1_regs_write_acc_inc ),
  .l2cif1_regs_write_miss_inc (l2cif1_regs_write_miss_inc),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .piu0_regs_hpcp_cnt_en      (piu0_regs_hpcp_cnt_en     ),
  .piu0_regs_op               (piu0_regs_op              ),
  .piu0_regs_sel              (piu0_regs_sel             ),
  .piu0_regs_wdata            (piu0_regs_wdata           ),
  .piu1_regs_hpcp_cnt_en      (piu1_regs_hpcp_cnt_en     ),
  .piu1_regs_op               (piu1_regs_op              ),
  .piu1_regs_sel              (piu1_regs_sel             ),
  .piu1_regs_wdata            (piu1_regs_wdata           ),
  .piu2_regs_op               (piu2_regs_op              ),
  .piu2_regs_sel              (piu2_regs_sel             ),
  .piu2_regs_wdata            (piu2_regs_wdata           ),
  .piu3_regs_op               (piu3_regs_op              ),
  .piu3_regs_sel              (piu3_regs_sel             ),
  .piu3_regs_wdata            (piu3_regs_wdata           ),
  .regs_apbif_icg_en          (regs_apbif_icg_en         ),
  .regs_piu0_cmplt            (regs_piu0_cmplt           ),
  .regs_piu0_hpcp_l2of_int    (regs_piu0_hpcp_l2of_int   ),
  .regs_piu1_cmplt            (regs_piu1_cmplt           ),
  .regs_piu1_hpcp_l2of_int    (regs_piu1_hpcp_l2of_int   ),
  .regs_piu2_cmplt            (regs_piu2_cmplt           ),
  .regs_piu3_cmplt            (regs_piu3_cmplt           ),
  .regs_piux_rdata            (regs_piux_rdata           )
);

// &Connect( @680
//   .forever_cpuclk       (forever_cpuclk           ) @681
// ); @682

// &Force("output", "penable"); @684
// &Force("output", "pwrite"); @685
// &Force("output", "paddr");  &Force("bus", "paddr",31,0); @686
// &Force("output", "pprot");  &Force("bus", "pprot",1,0); @687
// &Force("output", "pwdata"); &Force("bus", "pwdata",31,0); @688
// &Force("output", "psec"); @690

// &Instance("ct_ciu_apbif"); @693
ct_ciu_apbif  x_ct_ciu_apbif (
  .apb_clk_en                (apb_clk_en               ),
  .apbif_had_pctrace_inv     (apbif_had_pctrace_inv    ),
  .apbif_ncq_ar_grant        (apbif_ncq_ar_grant       ),
  .apbif_ncq_aw_grant        (apbif_ncq_aw_grant       ),
  .apbif_ncq_bid             (apbif_ncq_bid            ),
  .apbif_ncq_bresp           (apbif_ncq_bresp          ),
  .apbif_ncq_bvalid          (apbif_ncq_bvalid         ),
  .apbif_ncq_rdata           (apbif_ncq_rdata          ),
  .apbif_ncq_rid             (apbif_ncq_rid            ),
  .apbif_ncq_rlast           (apbif_ncq_rlast          ),
  .apbif_ncq_rresp           (apbif_ncq_rresp          ),
  .apbif_ncq_rvalid          (apbif_ncq_rvalid         ),
  .apbif_ncq_w_grant         (apbif_ncq_w_grant        ),
  .ciu_apbif_had_pctrace_inv (ciu_apbif_had_pctrace_inv),
  .ciu_clint_icg_en          (ciu_clint_icg_en         ),
  .ciu_icg_en                (ciu_icg_en               ),
  .ciu_plic_icg_en           (ciu_plic_icg_en          ),
  .core0_prdata_l2pmp        (core0_prdata_l2pmp       ),
  .core1_prdata_l2pmp        (core1_prdata_l2pmp       ),
  .core2_prdata_l2pmp        (core2_prdata_l2pmp       ),
  .core3_prdata_l2pmp        (core3_prdata_l2pmp       ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (ciu_top_clk              ),
  .ncq_apbif_arvalid         (ncq_apbif_arvalid        ),
  .ncq_apbif_awvalid         (ncq_apbif_awvalid        ),
  .ncq_apbif_b_grant         (ncq_apbif_b_grant        ),
  .ncq_apbif_r_grant         (ncq_apbif_r_grant        ),
  .ncq_apbif_wvalid          (ncq_apbif_wvalid         ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_arid               (ncq_xx_arid              ),
  .ncq_xx_arprot             (ncq_xx_arprot            ),
  .ncq_xx_aruser             (ncq_xx_aruser            ),
  .ncq_xx_aw_needissue       (ncq_xx_aw_needissue      ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncq_xx_awprot             (ncq_xx_awprot            ),
  .ncq_xx_awuser             (ncq_xx_awuser            ),
  .ncq_xx_wdata              (ncq_xx_wdata             ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .paddr                     (paddr                    ),
  .penable                   (penable                  ),
  .perr_clint                (perr_clint               ),
  .perr_had                  (perr_had                 ),
  .perr_l2pmp                (perr_l2pmp               ),
  .perr_plic                 (perr_plic                ),
  .perr_rmr                  (perr_rmr                 ),
  .pprot                     (pprot                    ),
  .prdata_clint              (prdata_clint             ),
  .prdata_had                (prdata_had               ),
  .prdata_plic               (prdata_plic              ),
  .prdata_rmr                (prdata_rmr               ),
  .pready_clint              (pready_clint             ),
  .pready_had                (pready_had               ),
  .pready_l2pmp              (pready_l2pmp             ),
  .pready_plic               (pready_plic              ),
  .pready_rmr                (pready_rmr               ),
  .psel_clint                (psel_clint               ),
  .psel_had                  (psel_had                 ),
  .psel_l2pmp                (psel_l2pmp               ),
  .psel_plic                 (psel_plic                ),
  .psel_rmr                  (psel_rmr                 ),
  .pwdata                    (pwdata                   ),
  .pwrite                    (pwrite                   ),
  .regs_apbif_icg_en         (regs_apbif_icg_en        )
);

// &Connect( @694
//   .forever_cpuclk       (ciu_top_clk              ) @695
// ); @696

//================================================
//           ciu_no_op
//================================================
assign ciu_no_op = piu0_xx_no_op && piu1_xx_no_op && piu2_xx_no_op && piu3_xx_no_op && 
                         piu4_xx_no_op && slvif_xx_no_op && 
                         snb0_xx_no_op && snb1_xx_no_op &&
                         ncq_xx_no_op && ctcq_xx_no_op && ebiu_xx_no_op && vb_xx_no_op &&
                         piu0_xx_regs_no_op && piu1_xx_regs_no_op && piu2_xx_regs_no_op && piu3_xx_regs_no_op && 
                         l2c_xx_no_op;

assign ciu_xx_no_op = ciu_no_op;

//================================================
//           ciu_global ICG
//================================================
assign core0_req_gate = ibiu0_pad_arvalid || ibiu0_pad_awvalid || piu0_csr_sel;

assign core1_req_gate = ibiu1_pad_arvalid || ibiu1_pad_awvalid || piu1_csr_sel;

assign core2_req_gate = 1'b0;

assign core3_req_gate = 1'b0;

assign device0_req_gate = 1'b0;
assign slvif_xx_no_op  = 1'b1;
// &Force("nonport","biu_pad_rack"); @749
// &Force("nonport","biu_pad_back"); @750
assign core_req_gate = core0_req_gate || core1_req_gate ||
                       core2_req_gate || core3_req_gate ||
                       device0_req_gate || 
                       ciu_l2c_rst_req || 
                       sysio_l2c_flush_req ||
                       ciu_global_icg_en;

// &Force("output","ciu_l2c_rst_req"); @760

always @(posedge forever_cpuclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ciu_top_clk_en_f <= 1'b1;
  else if (core_req_gate)
    ciu_top_clk_en_f <= 1'b1;
  else if (ciu_no_op)
    ciu_top_clk_en_f <= 1'b0;
end

// &Instance("gated_clk_cell", "x_ciu_top_gated_clk"); @772
gated_clk_cell  x_ciu_top_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ciu_top_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ciu_top_clk_en_f  ),
  .module_en          (1'b0              ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @773
//          .external_en (1'b0), @774
//          .global_en   (1'b1), @775
//          .module_en   (1'b0), @776
//          .local_en    (ciu_top_clk_en_f), @777
//          .clk_out     (ciu_top_clk)); @778

// &Force("output", "ciu_top_clk"); @780


//==========================================================
//             DEBUG INFORMATION
//==========================================================
assign piu2_dbg_info[9:0] = 10'b0;

assign piu3_dbg_info[9:0] = 10'b0;

assign ciu_had_dbg_info[292:0] = ciu_dbg_info[292:0];

assign l2c_had_dbg_info[43:0] = l2c_ciu_dbg_info[43:0];

assign ciu_dbg_info[292:0] = {ncq_dbg_info[4:0],
                              piu3_dbg_info[9:0],piu2_dbg_info[9:0],
                              piu1_dbg_info[9:0],piu0_dbg_info[9:0],
                              snb1_dbg_info[95:0],snb0_dbg_info[95:0],
                              ctcq_dbg_info[55:0]};
// &ModuleEnd; @813
endmodule




