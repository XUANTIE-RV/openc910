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

// &Depend("ct_fifo.v"); @18

// &ModuleBeg; @20
module ct_piu_top(
  bmbif_piu_ctcq_grant,
  bmbif_piu_ncq_grant,
  bmbif_piu_snb0_grant,
  bmbif_piu_snb1_grant,
  ciu_chr2_bar_dis,
  ciu_ibiu_acaddr,
  ciu_ibiu_acprot,
  ciu_ibiu_acsnoop,
  ciu_ibiu_acvalid,
  ciu_ibiu_arready,
  ciu_ibiu_awready,
  ciu_ibiu_bid,
  ciu_ibiu_bresp,
  ciu_ibiu_bvalid,
  ciu_ibiu_cdready,
  ciu_ibiu_crready,
  ciu_ibiu_rdata,
  ciu_ibiu_rid,
  ciu_ibiu_rlast,
  ciu_ibiu_rresp,
  ciu_ibiu_rvalid,
  ciu_ibiu_wns_awready,
  ciu_ibiu_wns_wready,
  ciu_ibiu_wready,
  ciu_ibiu_ws_awready,
  ciu_ibiu_ws_wready,
  ciu_icg_en,
  ciu_top_clk,
  cpurst_b,
  ctcq_piu_acbus,
  ctcq_piu_acvalid,
  ctcq_piu_ar_grant,
  ctcq_piu_bar_cmplt,
  ctcq_piu_cr_grant,
  ctcq_piu_rvalid,
  ctcq_piux_rbus,
  ebiu_piu_no_op,
  forever_cpuclk,
  ibiu_ciu_acready,
  ibiu_ciu_araddr,
  ibiu_ciu_arbar,
  ibiu_ciu_arburst,
  ibiu_ciu_arcache,
  ibiu_ciu_ardomain,
  ibiu_ciu_arid,
  ibiu_ciu_arlen,
  ibiu_ciu_arlock,
  ibiu_ciu_arprot,
  ibiu_ciu_arsize,
  ibiu_ciu_arsnoop,
  ibiu_ciu_aruser,
  ibiu_ciu_arvalid,
  ibiu_ciu_awaddr,
  ibiu_ciu_awbar,
  ibiu_ciu_awburst,
  ibiu_ciu_awcache,
  ibiu_ciu_awdomain,
  ibiu_ciu_awid,
  ibiu_ciu_awlen,
  ibiu_ciu_awlock,
  ibiu_ciu_awprot,
  ibiu_ciu_awsize,
  ibiu_ciu_awsnoop,
  ibiu_ciu_awunique,
  ibiu_ciu_awuser,
  ibiu_ciu_awvalid,
  ibiu_ciu_back,
  ibiu_ciu_bready,
  ibiu_ciu_cddata,
  ibiu_ciu_cderr,
  ibiu_ciu_cdlast,
  ibiu_ciu_cdvalid,
  ibiu_ciu_crresp,
  ibiu_ciu_crvalid,
  ibiu_ciu_rack,
  ibiu_ciu_rready,
  ibiu_ciu_wdata,
  ibiu_ciu_werr,
  ibiu_ciu_wlast,
  ibiu_ciu_wns,
  ibiu_ciu_wstrb,
  ibiu_ciu_wvalid,
  ncq_piu_ar_grant,
  ncq_piu_aw_grant,
  ncq_piu_bar_cmplt,
  ncq_piu_bbus,
  ncq_piu_bvalid,
  ncq_piu_rvalid,
  ncq_piu_wcd_grant,
  ncq_piux_rbus,
  pad_yy_icg_scan_en,
  piu_bmbif_ctcq_req,
  piu_bmbif_ncq_req,
  piu_bmbif_req_bus,
  piu_bmbif_snb0_req,
  piu_bmbif_snb1_req,
  piu_ctcq_ac_grant,
  piu_ctcq_ar_bus,
  piu_ctcq_ar_req,
  piu_ctcq_cr_bus,
  piu_ctcq_cr_req,
  piu_ctcq_r_grant,
  piu_dbg_info,
  piu_ncq_ar_bus,
  piu_ncq_ar_req,
  piu_ncq_aw_bus,
  piu_ncq_aw_req,
  piu_ncq_b_grant,
  piu_ncq_r_grant,
  piu_ncq_wcd_bus,
  piu_ncq_wcd_req,
  piu_no,
  piu_snb0_ac_grant,
  piu_snb0_ar_bus,
  piu_snb0_ar_req,
  piu_snb0_aw_req,
  piu_snb0_b_grant,
  piu_snb0_back,
  piu_snb0_cr_bus,
  piu_snb0_cr_req,
  piu_snb0_r_grant,
  piu_snb0_rack,
  piu_snb0_wcd_req,
  piu_snb1_ac_grant,
  piu_snb1_ar_bus,
  piu_snb1_ar_req,
  piu_snb1_aw_req,
  piu_snb1_b_grant,
  piu_snb1_back,
  piu_snb1_cr_bus,
  piu_snb1_cr_req,
  piu_snb1_r_grant,
  piu_snb1_rack,
  piu_snb1_wcd_req,
  piu_snbx_back_sid,
  piu_snbx_rack_sid,
  piu_xx_aw_bus,
  piu_xx_no_op,
  piu_xx_wcd_bus,
  snb0_piu_acbus,
  snb0_piu_acvalid,
  snb0_piu_ar_grant,
  snb0_piu_aw_grant,
  snb0_piu_bar_cmplt,
  snb0_piu_bvalid,
  snb0_piu_cr_grant,
  snb0_piu_rvalid,
  snb0_piu_wcd_grant,
  snb0_piux_aw_sid,
  snb0_piux_bbus,
  snb0_piux_rbus,
  snb1_piu_acbus,
  snb1_piu_acvalid,
  snb1_piu_ar_grant,
  snb1_piu_aw_grant,
  snb1_piu_bar_cmplt,
  snb1_piu_bvalid,
  snb1_piu_cr_grant,
  snb1_piu_rvalid,
  snb1_piu_wcd_grant,
  snb1_piux_aw_sid,
  snb1_piux_bbus,
  snb1_piux_rbus
);

// &Ports; @21
input            bmbif_piu_ctcq_grant;    
input            bmbif_piu_ncq_grant;     
input            bmbif_piu_snb0_grant;    
input            bmbif_piu_snb1_grant;    
input            ciu_chr2_bar_dis;        
input            ciu_icg_en;              
input            ciu_top_clk;             
input            cpurst_b;                
input   [54 :0]  ctcq_piu_acbus;          
input            ctcq_piu_acvalid;        
input            ctcq_piu_ar_grant;       
input            ctcq_piu_bar_cmplt;      
input            ctcq_piu_cr_grant;       
input            ctcq_piu_rvalid;         
input   [534:0]  ctcq_piux_rbus;          
input            ebiu_piu_no_op;          
input            forever_cpuclk;          
input            ibiu_ciu_acready;        
input   [39 :0]  ibiu_ciu_araddr;         
input   [1  :0]  ibiu_ciu_arbar;          
input   [1  :0]  ibiu_ciu_arburst;        
input   [3  :0]  ibiu_ciu_arcache;        
input   [1  :0]  ibiu_ciu_ardomain;       
input   [4  :0]  ibiu_ciu_arid;           
input   [1  :0]  ibiu_ciu_arlen;          
input            ibiu_ciu_arlock;         
input   [2  :0]  ibiu_ciu_arprot;         
input   [2  :0]  ibiu_ciu_arsize;         
input   [3  :0]  ibiu_ciu_arsnoop;        
input   [2  :0]  ibiu_ciu_aruser;         
input            ibiu_ciu_arvalid;        
input   [39 :0]  ibiu_ciu_awaddr;         
input   [1  :0]  ibiu_ciu_awbar;          
input   [1  :0]  ibiu_ciu_awburst;        
input   [3  :0]  ibiu_ciu_awcache;        
input   [1  :0]  ibiu_ciu_awdomain;       
input   [4  :0]  ibiu_ciu_awid;           
input   [1  :0]  ibiu_ciu_awlen;          
input            ibiu_ciu_awlock;         
input   [2  :0]  ibiu_ciu_awprot;         
input   [2  :0]  ibiu_ciu_awsize;         
input   [2  :0]  ibiu_ciu_awsnoop;        
input            ibiu_ciu_awunique;       
input            ibiu_ciu_awuser;         
input            ibiu_ciu_awvalid;        
input            ibiu_ciu_back;           
input            ibiu_ciu_bready;         
input   [127:0]  ibiu_ciu_cddata;         
input            ibiu_ciu_cderr;          
input            ibiu_ciu_cdlast;         
input            ibiu_ciu_cdvalid;        
input   [4  :0]  ibiu_ciu_crresp;         
input            ibiu_ciu_crvalid;        
input            ibiu_ciu_rack;           
input            ibiu_ciu_rready;         
input   [127:0]  ibiu_ciu_wdata;          
input            ibiu_ciu_werr;           
input            ibiu_ciu_wlast;          
input            ibiu_ciu_wns;            
input   [15 :0]  ibiu_ciu_wstrb;          
input            ibiu_ciu_wvalid;         
input            ncq_piu_ar_grant;        
input            ncq_piu_aw_grant;        
input            ncq_piu_bar_cmplt;       
input   [13 :0]  ncq_piu_bbus;            
input            ncq_piu_bvalid;          
input            ncq_piu_rvalid;          
input            ncq_piu_wcd_grant;       
input   [534:0]  ncq_piux_rbus;           
input            pad_yy_icg_scan_en;      
input   [2  :0]  piu_no;                  
input   [54 :0]  snb0_piu_acbus;          
input            snb0_piu_acvalid;        
input            snb0_piu_ar_grant;       
input            snb0_piu_aw_grant;       
input            snb0_piu_bar_cmplt;      
input            snb0_piu_bvalid;         
input            snb0_piu_cr_grant;       
input            snb0_piu_rvalid;         
input            snb0_piu_wcd_grant;      
input   [4  :0]  snb0_piux_aw_sid;        
input   [13 :0]  snb0_piux_bbus;          
input   [534:0]  snb0_piux_rbus;          
input   [54 :0]  snb1_piu_acbus;          
input            snb1_piu_acvalid;        
input            snb1_piu_ar_grant;       
input            snb1_piu_aw_grant;       
input            snb1_piu_bar_cmplt;      
input            snb1_piu_bvalid;         
input            snb1_piu_cr_grant;       
input            snb1_piu_rvalid;         
input            snb1_piu_wcd_grant;      
input   [4  :0]  snb1_piux_aw_sid;        
input   [13 :0]  snb1_piux_bbus;          
input   [534:0]  snb1_piux_rbus;          
output  [39 :0]  ciu_ibiu_acaddr;         
output  [2  :0]  ciu_ibiu_acprot;         
output  [3  :0]  ciu_ibiu_acsnoop;        
output           ciu_ibiu_acvalid;        
output           ciu_ibiu_arready;        
output           ciu_ibiu_awready;        
output  [4  :0]  ciu_ibiu_bid;            
output  [1  :0]  ciu_ibiu_bresp;          
output           ciu_ibiu_bvalid;         
output           ciu_ibiu_cdready;        
output           ciu_ibiu_crready;        
output  [127:0]  ciu_ibiu_rdata;          
output  [4  :0]  ciu_ibiu_rid;            
output           ciu_ibiu_rlast;          
output  [3  :0]  ciu_ibiu_rresp;          
output           ciu_ibiu_rvalid;         
output           ciu_ibiu_wns_awready;    
output           ciu_ibiu_wns_wready;     
output           ciu_ibiu_wready;         
output           ciu_ibiu_ws_awready;     
output           ciu_ibiu_ws_wready;      
output           piu_bmbif_ctcq_req;      
output           piu_bmbif_ncq_req;       
output  [8  :0]  piu_bmbif_req_bus;       
output           piu_bmbif_snb0_req;      
output           piu_bmbif_snb1_req;      
output           piu_ctcq_ac_grant;       
output  [70 :0]  piu_ctcq_ar_bus;         
output           piu_ctcq_ar_req;         
output  [9  :0]  piu_ctcq_cr_bus;         
output           piu_ctcq_cr_req;         
output           piu_ctcq_r_grant;        
output  [9  :0]  piu_dbg_info;            
output  [73 :0]  piu_ncq_ar_bus;          
output           piu_ncq_ar_req;          
output  [73 :0]  piu_ncq_aw_bus;          
output           piu_ncq_aw_req;          
output           piu_ncq_b_grant;         
output           piu_ncq_r_grant;         
output  [143:0]  piu_ncq_wcd_bus;         
output           piu_ncq_wcd_req;         
output           piu_snb0_ac_grant;       
output  [70 :0]  piu_snb0_ar_bus;         
output           piu_snb0_ar_req;         
output           piu_snb0_aw_req;         
output           piu_snb0_b_grant;        
output           piu_snb0_back;           
output  [9  :0]  piu_snb0_cr_bus;         
output           piu_snb0_cr_req;         
output           piu_snb0_r_grant;        
output           piu_snb0_rack;           
output           piu_snb0_wcd_req;        
output           piu_snb1_ac_grant;       
output  [70 :0]  piu_snb1_ar_bus;         
output           piu_snb1_ar_req;         
output           piu_snb1_aw_req;         
output           piu_snb1_b_grant;        
output           piu_snb1_back;           
output  [9  :0]  piu_snb1_cr_bus;         
output           piu_snb1_cr_req;         
output           piu_snb1_r_grant;        
output           piu_snb1_rack;           
output           piu_snb1_wcd_req;        
output  [4  :0]  piu_snbx_back_sid;       
output  [4  :0]  piu_snbx_rack_sid;       
output  [70 :0]  piu_xx_aw_bus;           
output           piu_xx_no_op;            
output  [534:0]  piu_xx_wcd_bus;          

// &Regs; @22
reg     [3  :0]  bar_cmplt;               
reg     [2  :0]  bar_cur_state;           
reg     [1  :0]  bar_domain;              
reg     [3  :0]  bar_grant;               
reg     [4  :0]  bar_id;                  
reg     [2  :0]  bar_next_state;          
reg     [1  :0]  bar_resp_grant;          
reg     [1  :0]  bar_type;                
reg              bar_wd_recevied;         
reg     [3  :0]  cd_sid_fifo_cnt;         
reg              ctcq_mask_snb;           
reg              ibiu_ciu_back_reg;       
reg              ibiu_ciu_rack_reg;       
reg     [1  :0]  pkb_addr_5_4;            
reg              pkb_bur_dec_val;         
reg              pkb_cd_sel;              
reg     [511:0]  pkb_data;                
reg     [1  :0]  pkb_data_sel_ff;         
reg              pkb_err;                 
reg              pkb_rdy;                 
reg     [4  :0]  pkb_sid;                 
reg              pkb_vld;                 
reg     [15 :0]  pkb_wstrb;               
reg     [3  :0]  pkb_xid;                 
reg     [3  :0]  upkb_cnt;                
reg     [534:0]  upkb_cont;               
reg     [127:0]  upkb_rdata;              
reg              upkb_rresp_1;            
reg              upkb_vld;                
reg     [74 :0]  wns_dfifo_data;          
reg              wns_dfifo_vld;           
reg     [74 :0]  ws_dfifo_data;           
reg              ws_dfifo_vld;            

// &Wires; @23
wire    [54 :0]  ac_dfifo_create_bus;     
wire             ac_dfifo_create_en;      
wire             ac_dfifo_full;           
wire    [54 :0]  ac_dfifo_pop_bus;        
wire             ac_dfifo_pop_bus_vld;    
wire             ac_dfifo_pop_en;         
wire             ac_idle;                 
wire             ac_prio_clk;             
wire             ac_prio_clk_en;          
wire    [54 :0]  ac_req_bus;              
wire             ac_req_vld;              
wire    [2  :0]  ac_sel;                  
wire    [2  :0]  ac_valid;                
wire             ar_ca;                   
wire             ar_ctc;                  
wire             ar_dfifo_bmb_req;        
wire    [74 :0]  ar_dfifo_create_bus;     
wire             ar_dfifo_create_en;      
wire             ar_dfifo_create_en_gate; 
wire             ar_dfifo_ctcq_req;       
wire             ar_dfifo_empty;          
wire             ar_dfifo_full;           
wire             ar_dfifo_ncq_req;        
wire    [74 :0]  ar_dfifo_pop_bus;        
wire             ar_dfifo_pop_bus_vld;    
wire             ar_dfifo_pop_en;         
wire             ar_dfifo_sab0_req;       
wire             ar_dfifo_sab1_req;       
wire             ar_grant;                
wire             ar_req_bar;              
wire    [1  :0]  ar_req_bar_type;         
wire    [74 :0]  ar_req_bus;              
wire             ar_req_ctc;              
wire    [1  :0]  ar_req_domain;           
wire             ar_req_ncq;              
wire    [4  :0]  ar_req_rid;              
wire             ar_req_snb0;             
wire             ar_req_snb1;             
wire             ar_req_vld;              
wire             aw_bar;                  
wire             aw_ca;                   
wire             aw_create_ws;            
wire             aw_ctrl_clk;             
wire             aw_ctrl_clk_en;          
wire             aw_dfifo_bmb_req;        
wire    [74 :0]  aw_dfifo_create_bus;     
wire             aw_dfifo_create_en;      
wire             aw_dfifo_create_en_gate; 
wire             aw_dfifo_empty;          
wire             aw_dfifo_full;           
wire             aw_grant;                
wire    [4  :0]  aw_grant_sid;            
wire    [3  :0]  aw_grant_xid;            
wire             aw_pop_evict;            
wire             aw_req_bar;              
wire             aw_req_burst_dec;        
wire    [74 :0]  aw_req_bus;              
wire             aw_req_ncq;              
wire             aw_req_snb0;             
wire             aw_req_snb1;             
wire             aw_req_vld;              
wire             b_arb_clr;               
wire    [3  :0]  b_arb_sel;               
wire    [3  :0]  b_arb_valid;             
wire             b_dfifo_bmb_grant;       
wire    [13 :0]  b_dfifo_create_bus;      
wire             b_dfifo_create_en;       
wire             b_dfifo_empty;           
wire             b_dfifo_full;            
wire             b_dfifo_grant;           
wire    [13 :0]  b_dfifo_pop_bus;         
wire             b_dfifo_pop_bus_vld;     
wire             b_dfifo_pop_en;          
wire             b_dfifo_req;             
wire             b_prio_clk;              
wire             b_prio_clk_en;           
wire    [13 :0]  b_req_bus;               
wire             b_req_vld;               
wire    [6  :0]  back_dfifo_create_bus;   
wire             back_dfifo_create_en;    
wire             back_dfifo_empty;        
wire             back_dfifo_full;         
wire    [6  :0]  back_dfifo_pop_bus;      
wire             back_dfifo_pop_bus_vld;  
wire             back_dfifo_pop_en;       
wire    [1  :0]  bar_addr_5_4;            
wire    [4  :0]  bar_bid;                 
wire    [1  :0]  bar_bresp;               
wire    [3  :0]  bar_cmplt_bus;           
wire             bar_cmplt_vld;           
wire             bar_ctrl_clk;            
wire             bar_ctrl_clk_en;         
wire             bar_dp_clk;              
wire             bar_dp_clk_en;           
wire    [3  :0]  bar_grant_bus;           
wire             bar_grant_vld;           
wire    [511:0]  bar_rdata;               
wire             bar_req_vld;             
wire    [1  :0]  bar_resp_grant_bus;      
wire             bar_resp_grant_vld;      
wire             bar_resp_vld;            
wire    [4  :0]  bar_rid;                 
wire    [6  :0]  bar_rresp;               
wire    [6  :0]  bar_sid;                 
wire             bar_vld;                 
wire             bmb_ar_dfifo_grant;      
wire             bmb_aw_dfifo_grant;      
wire    [13 :0]  bmb_b_dfifo_bbus;        
wire             bmb_b_dfifo_bvalid;      
wire             bmb_bvalid;              
wire             bmb_pkb_wcd_grant;       
wire             bmb_rvalid;              
wire    [534:0]  bmb_upkb_rbus;           
wire             bmb_upkb_rvalid;         
wire             bmbif_piu_ctcq_grant;    
wire             bmbif_piu_ncq_grant;     
wire             bmbif_piu_snb0_grant;    
wire             bmbif_piu_snb1_grant;    
wire    [1  :0]  cd_addr_5_4;             
wire    [157:0]  cd_bus;                  
wire    [129:0]  cd_dfifo_create_bus;     
wire             cd_dfifo_create_en;      
wire             cd_dfifo_full;           
wire    [129:0]  cd_dfifo_pop_bus;        
wire             cd_dfifo_pop_bus_vld;    
wire             cd_dfifo_pop_en;         
wire    [129:0]  cd_pkb_bus;              
wire             cd_pkb_req;              
wire    [11 :0]  cd_pkb_sid_bus;          
wire    [129:0]  cd_req_bus;              
wire             cd_req_vld;              
wire    [4  :0]  cd_sid;                  
wire             cd_sid_ctrl_clk_en;      
wire    [8  :0]  cd_sid_fifo_create_bus;  
wire             cd_sid_fifo_create_en;   
wire             cd_sid_fifo_ctrl_clk;    
wire             cd_sid_fifo_full;        
wire    [8  :0]  cd_sid_fifo_pop_bus;     
wire             cd_sid_fifo_pop_bus_vld; 
wire             cd_sid_fifo_pop_en;      
wire             cd_sid_vld;              
wire             cd_xid_snb0;             
wire             cd_xid_snb1;             
wire             ciu_chr2_bar_dis;        
wire    [39 :0]  ciu_ibiu_acaddr;         
wire    [2  :0]  ciu_ibiu_acprot;         
wire    [3  :0]  ciu_ibiu_acsnoop;        
wire             ciu_ibiu_acvalid;        
wire             ciu_ibiu_arready;        
wire             ciu_ibiu_awready;        
wire    [4  :0]  ciu_ibiu_bid;            
wire    [1  :0]  ciu_ibiu_bresp;          
wire             ciu_ibiu_bvalid;         
wire             ciu_ibiu_cdready;        
wire             ciu_ibiu_crready;        
wire    [127:0]  ciu_ibiu_rdata;          
wire    [4  :0]  ciu_ibiu_rid;            
wire             ciu_ibiu_rlast;          
wire    [3  :0]  ciu_ibiu_rresp;          
wire             ciu_ibiu_rvalid;         
wire             ciu_ibiu_wns_awready;    
wire             ciu_ibiu_wns_wready;     
wire             ciu_ibiu_wready;         
wire             ciu_ibiu_ws_awready;     
wire             ciu_ibiu_ws_wready;      
wire             ciu_icg_en;              
wire             ciu_top_clk;             
wire             cpurst_b;                
wire    [4  :0]  cr_dfifo_create_bus;     
wire             cr_dfifo_create_en;      
wire             cr_dfifo_full;           
wire    [4  :0]  cr_dfifo_pop_bus;        
wire             cr_dfifo_pop_bus_vld;    
wire             cr_dfifo_pop_en;         
wire    [4  :0]  cr_req_bus;              
wire             cr_req_vld;              
wire    [54 :0]  ctcq_piu_acbus;          
wire             ctcq_piu_acvalid;        
wire             ctcq_piu_ar_grant;       
wire             ctcq_piu_bar_cmplt;      
wire             ctcq_piu_cr_grant;       
wire             ctcq_piu_rvalid;         
wire    [534:0]  ctcq_piux_rbus;          
wire             ebiu_piu_no_op;          
wire             forever_cpuclk;          
wire             ibiu_ciu_acready;        
wire    [39 :0]  ibiu_ciu_araddr;         
wire    [1  :0]  ibiu_ciu_arbar;          
wire    [1  :0]  ibiu_ciu_arburst;        
wire    [3  :0]  ibiu_ciu_arcache;        
wire    [1  :0]  ibiu_ciu_ardomain;       
wire    [4  :0]  ibiu_ciu_arid;           
wire    [1  :0]  ibiu_ciu_arlen;          
wire             ibiu_ciu_arlock;         
wire    [2  :0]  ibiu_ciu_arprot;         
wire    [2  :0]  ibiu_ciu_arsize;         
wire    [3  :0]  ibiu_ciu_arsnoop;        
wire    [2  :0]  ibiu_ciu_aruser;         
wire             ibiu_ciu_arvalid;        
wire    [3  :0]  ibiu_ciu_arxid;          
wire    [39 :0]  ibiu_ciu_awaddr;         
wire    [1  :0]  ibiu_ciu_awbar;          
wire    [1  :0]  ibiu_ciu_awburst;        
wire    [3  :0]  ibiu_ciu_awcache;        
wire    [1  :0]  ibiu_ciu_awdomain;       
wire    [4  :0]  ibiu_ciu_awid;           
wire    [1  :0]  ibiu_ciu_awlen;          
wire             ibiu_ciu_awlock;         
wire    [2  :0]  ibiu_ciu_awprot;         
wire    [2  :0]  ibiu_ciu_awsize;         
wire    [2  :0]  ibiu_ciu_awsnoop;        
wire             ibiu_ciu_awuser;         
wire             ibiu_ciu_awvalid;        
wire    [2  :0]  ibiu_ciu_awxid;          
wire             ibiu_ciu_back;           
wire             ibiu_ciu_bready;         
wire    [127:0]  ibiu_ciu_cddata;         
wire             ibiu_ciu_cderr;          
wire             ibiu_ciu_cdlast;         
wire             ibiu_ciu_cdvalid;        
wire    [4  :0]  ibiu_ciu_crresp;         
wire             ibiu_ciu_crvalid;        
wire             ibiu_ciu_rack;           
wire             ibiu_ciu_rready;         
wire    [127:0]  ibiu_ciu_wdata;          
wire             ibiu_ciu_werr;           
wire             ibiu_ciu_wlast;          
wire             ibiu_ciu_wns;            
wire    [15 :0]  ibiu_ciu_wstrb;          
wire             ibiu_ciu_wvalid;         
wire             ncq_piu_ar_grant;        
wire             ncq_piu_aw_grant;        
wire             ncq_piu_bar_cmplt;       
wire    [13 :0]  ncq_piu_bbus;            
wire             ncq_piu_bvalid;          
wire             ncq_piu_rvalid;          
wire             ncq_piu_wcd_grant;       
wire    [534:0]  ncq_piux_rbus;           
wire    [127:0]  ncq_wdata;               
wire             one_bar_vld;             
wire             pad_yy_icg_scan_en;      
wire             piu_bmbif_ctcq_req;      
wire             piu_bmbif_ncq_req;       
wire    [8  :0]  piu_bmbif_req_bus;       
wire             piu_bmbif_snb0_req;      
wire             piu_bmbif_snb1_req;      
wire             piu_ctcq_ac_grant;       
wire    [70 :0]  piu_ctcq_ar_bus;         
wire             piu_ctcq_ar_req;         
wire    [9  :0]  piu_ctcq_cr_bus;         
wire             piu_ctcq_cr_req;         
wire             piu_ctcq_r_grant;        
wire    [9  :0]  piu_dbg_info;            
wire    [73 :0]  piu_ncq_ar_bus;          
wire             piu_ncq_ar_req;          
wire    [73 :0]  piu_ncq_aw_bus;          
wire             piu_ncq_aw_req;          
wire             piu_ncq_b_grant;         
wire             piu_ncq_r_grant;         
wire    [143:0]  piu_ncq_wcd_bus;         
wire             piu_ncq_wcd_req;         
wire    [2  :0]  piu_no;                  
wire             piu_snb0_ac_grant;       
wire    [70 :0]  piu_snb0_ar_bus;         
wire             piu_snb0_ar_req;         
wire             piu_snb0_aw_req;         
wire             piu_snb0_b_grant;        
wire             piu_snb0_back;           
wire    [9  :0]  piu_snb0_cr_bus;         
wire             piu_snb0_cr_req;         
wire             piu_snb0_r_grant;        
wire             piu_snb0_rack;           
wire             piu_snb0_wcd_req;        
wire             piu_snb1_ac_grant;       
wire    [70 :0]  piu_snb1_ar_bus;         
wire             piu_snb1_ar_req;         
wire             piu_snb1_aw_req;         
wire             piu_snb1_b_grant;        
wire             piu_snb1_back;           
wire    [9  :0]  piu_snb1_cr_bus;         
wire             piu_snb1_cr_req;         
wire             piu_snb1_r_grant;        
wire             piu_snb1_rack;           
wire             piu_snb1_wcd_req;        
wire    [4  :0]  piu_snbx_back_sid;       
wire    [4  :0]  piu_snbx_rack_sid;       
wire    [70 :0]  piu_xx_aw_bus;           
wire    [9  :0]  piu_xx_cr_bus;           
wire             piu_xx_no_op;            
wire    [534:0]  piu_xx_wcd_bus;          
wire             pkb_bmb_wcd_req;         
wire             pkb_bur_dec_final;       
wire    [157:0]  pkb_bus;                 
wire             pkb_cd_grant;            
wire             pkb_cd_sel_final;        
wire             pkb_cd_sid_grant;        
wire             pkb_create_en;           
wire             pkb_ctrl_clk;            
wire             pkb_ctrl_clk_en;         
wire             pkb_data0_clk;           
wire             pkb_data0_wen;           
wire             pkb_data1_clk;           
wire             pkb_data1_wen;           
wire             pkb_data2_clk;           
wire             pkb_data2_wen;           
wire             pkb_data3_clk;           
wire             pkb_data3_wen;           
wire    [1  :0]  pkb_data_sel;            
wire             pkb_dp_clk;              
wire             pkb_dp_clk_en;           
wire             pkb_dp_create_en;        
wire             pkb_idle;                
wire             pkb_pop_en;              
wire             pkb_req;                 
wire             pkb_req_vld;             
wire             pkb_wd_grant;            
wire             pkb_wd_sid_grant;        
wire    [145:0]  r_dfifo_create_bus;      
wire             r_dfifo_create_en;       
wire             r_dfifo_empty;           
wire             r_dfifo_full;            
wire    [145:0]  r_dfifo_pop_bus;         
wire             r_dfifo_pop_bus_vld;     
wire             r_dfifo_pop_en;          
wire             r_dfifo_req;             
wire             r_dfifo_upkb_grant;      
wire    [145:0]  r_req_bus;               
wire             r_req_vld;               
wire    [6  :0]  rack_dfifo_create_bus;   
wire             rack_dfifo_create_en;    
wire             rack_dfifo_empty;        
wire             rack_dfifo_full;         
wire    [6  :0]  rack_dfifo_pop_bus;      
wire             rack_dfifo_pop_bus_vld;  
wire             rack_dfifo_pop_en;       
wire             rd_bar_vld;              
wire    [1  :0]  rspq_create_addr;        
wire    [11 :0]  rspq_create_bus;         
wire             rspq_create_en;          
wire    [4  :0]  rspq_create_sid;         
wire    [4  :0]  rspq_create_xid;         
wire             rspq_full;               
wire    [1  :0]  rspq_pop_addr_5_4;       
wire    [11 :0]  rspq_pop_bus;            
wire             rspq_pop_bus_vld;        
wire             rspq_pop_en;             
wire    [4  :0]  rspq_pop_sid;            
wire    [4  :0]  rspq_pop_xid;            
wire             sab_piu_cr_grant;        
wire             snb0_ac_valid;           
wire    [54 :0]  snb0_piu_acbus;          
wire             snb0_piu_acvalid;        
wire             snb0_piu_ar_grant;       
wire             snb0_piu_aw_grant;       
wire             snb0_piu_bar_cmplt;      
wire             snb0_piu_bvalid;         
wire             snb0_piu_cr_grant;       
wire             snb0_piu_rvalid;         
wire             snb0_piu_wcd_grant;      
wire    [4  :0]  snb0_piux_aw_sid;        
wire    [13 :0]  snb0_piux_bbus;          
wire    [534:0]  snb0_piux_rbus;          
wire             snb1_ac_valid;           
wire    [54 :0]  snb1_piu_acbus;          
wire             snb1_piu_acvalid;        
wire             snb1_piu_ar_grant;       
wire             snb1_piu_aw_grant;       
wire             snb1_piu_bar_cmplt;      
wire             snb1_piu_bvalid;         
wire             snb1_piu_cr_grant;       
wire             snb1_piu_rvalid;         
wire             snb1_piu_wcd_grant;      
wire    [4  :0]  snb1_piux_aw_sid;        
wire    [13 :0]  snb1_piux_bbus;          
wire    [534:0]  snb1_piux_rbus;          
wire             two_bar_vld;             
wire             upkb_bmb_grant;          
wire             upkb_clk;                
wire             upkb_clk_en;             
wire             upkb_cnt_en;             
wire    [3  :0]  upkb_cnt_init;           
wire    [3  :0]  upkb_cnt_init_f;         
wire             upkb_cnt_last;           
wire             upkb_cont_clk;           
wire    [534:0]  upkb_create_bus;         
wire             upkb_create_en;          
wire             upkb_idle;               
wire             upkb_pop_en;             
wire             upkb_prio_clk;           
wire             upkb_prio_clk_en;        
wire             upkb_rfirst;             
wire    [4  :0]  upkb_rid;                
wire             upkb_rlast;              
wire    [3  :0]  upkb_rresp;              
wire    [6  :0]  upkb_rresp_ori;          
wire    [4  :0]  upkb_sel;                
wire    [6  :0]  upkb_sid;                
wire    [4  :0]  upkb_valid;              
wire    [157:0]  wd_bus;                  
wire    [145:0]  wd_dfifo_create_bus;     
wire             wd_dfifo_sel_wns;        
wire    [145:0]  wd_pkb_bus;              
wire             wd_pkb_req;              
wire    [11 :0]  wd_pkb_sid_bus;          
wire    [12 :0]  wd_sid_fifo_create_bus;  
wire             wd_sid_fifo_create_en;   
wire             wd_sid_fifo_empty;       
wire             wd_sid_fifo_full;        
wire    [12 :0]  wd_sid_fifo_pop_bus;     
wire             wd_sid_fifo_pop_bus_vld; 
wire             wd_sid_fifo_pop_en;      
wire             wd_wns_dfifo_create_en;  
wire             wd_wns_dfifo_full;       
wire    [145:0]  wd_wns_dfifo_pop_bus;    
wire             wd_wns_dfifo_pop_bus_vld; 
wire             wd_wns_dfifo_pop_en;     
wire    [145:0]  wd_wns_pkb_bus;          
wire             wd_wns_pkb_req;          
wire             wd_ws_dfifo_create_en;   
wire             wd_ws_dfifo_full;        
wire    [145:0]  wd_ws_dfifo_pop_bus;     
wire             wd_ws_dfifo_pop_bus_vld; 
wire             wd_ws_dfifo_pop_en;      
wire    [145:0]  wd_ws_pkb_bus;           
wire             wd_ws_pkb_req;           
wire             wns_dfifo_create_en;     
wire             wns_dfifo_pop_en;        
wire             wns_dp_clk;              
wire             ws_dfifo_create_en;      
wire             ws_dfifo_pop_en;         
wire             ws_dp_clk;               
wire             wt_bar_vld;              


parameter ADDRW = `PA_WIDTH;

//==========================================================
//                          AR
//==========================================================
parameter ARPROT_0   = 0;
parameter ARPROT_2   = 2;
parameter ARCACHE_0  = 3;
parameter ARCACHE_3  = 6;
parameter ARSIZE_0   = 7;
parameter ARSIZE_2   = 9;
parameter ARLOCK     = 10;
parameter ARUSER_0   = 11;
parameter ARUSER_1   = 12;
parameter ARUSER_2   = 13;
parameter ARID_0     = 14;
parameter ARID_4     = 18;
parameter ARLEN_0    = 19;
parameter ARLEN_1    = 20;
parameter ARBURST_0  = 21;
parameter ARBURST_1  = 22;
parameter ARSOOP_0   = 23;
parameter ARSOOP_3   = 26;
parameter ARDOMAIN_0 = 27;
parameter ARDOMAIN_1 = 28;
parameter ARBAR_0    = 29;
parameter ARBAR_1    = 30;
parameter ARSNB0     = 31;
parameter ARSNB1     = 32;
parameter ARNCQ      = 33;
parameter ARCTC      = 34;
parameter ARADDR_0   = 35;
parameter ARADDR_H   = 74; //ADDRW-1+ARADDR_0;
parameter ARWIDTH    = 75; //ADDRW+ARADDR_0;
parameter ARWIDTH_SNB = 71; //ARWIDTH -4;
parameter ARWIDTH_NCQ = 74; //ARLEN_0 + 3 + ADDRW;

parameter CTCQ = 3;
parameter NCQ  = 2;
parameter SNB1 = 1;
parameter SNB0 = 0;

// &Force("nonport","ar_dfifo_create_bus"); @67
// &Force("nonport","ar_dfifo_create_en"); @68
// &Force("nonport","ar_dfifo_create_en_gate"); @69
// &Force("nonport","ar_dfifo_empty"); @70
// &Force("nonport","ar_dfifo_full"); @71
// &Force("nonport","ar_dfifo_pop_bus"); @72
// &Force("nonport","ar_dfifo_pop_bus_vld"); @73
// &Force("nonport","ar_dfifo_pop_en"); @74

assign ar_ca  = |ibiu_ciu_arcache[3:2] || ibiu_ciu_arcache[1] && (ibiu_ciu_ardomain[1] ^ ibiu_ciu_ardomain[0]);
assign ar_ctc = &ibiu_ciu_arsnoop[3:0];

assign ibiu_ciu_arxid[CTCQ] = !ibiu_ciu_arbar[0] &&  ar_ctc;
assign ibiu_ciu_arxid[NCQ]  = !ibiu_ciu_arbar[0] && !ar_ctc &&!ar_ca;
assign ibiu_ciu_arxid[SNB1] = !ibiu_ciu_arbar[0] && !ar_ctc && ar_ca && ibiu_ciu_araddr[6];
assign ibiu_ciu_arxid[SNB0] = !ibiu_ciu_arbar[0] && !ar_ctc && ar_ca && !ibiu_ciu_araddr[6];

assign ar_dfifo_create_en = ibiu_ciu_arvalid &&
                            !ar_dfifo_full;

assign ar_dfifo_create_en_gate = ibiu_ciu_arvalid &&
                            !ar_dfifo_full;

assign ar_grant           = bmb_ar_dfifo_grant ||
                            ctcq_piu_ar_grant  ||
                            ncq_piu_ar_grant   ||
                            snb1_piu_ar_grant  ||
                            snb0_piu_ar_grant;

assign ar_dfifo_pop_en    = ar_grant &&
                            ar_dfifo_pop_bus_vld;

assign ar_dfifo_create_bus[ARWIDTH-1:0] = {ibiu_ciu_araddr[ADDRW-1:0],
                                           ibiu_ciu_arxid[3:0],
                                           ibiu_ciu_arbar[1:0],
                                           ibiu_ciu_ardomain[1:0],
                                           ibiu_ciu_arsnoop[3:0],
                                           ibiu_ciu_arburst[1:0],
                                           ibiu_ciu_arlen[1:0],
                                           ibiu_ciu_arid[4:0],
                                           ibiu_ciu_aruser[2:0],
                                           ibiu_ciu_arlock,
                                           ibiu_ciu_arsize[2:0],
                                           ibiu_ciu_arcache[3:0],
                                           ibiu_ciu_arprot[2:0]};

ct_fifo #(.WIDTH(ARWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_piu_ar_dfifo(
  .clk                     (forever_cpuclk                ),
  .rst_b                   (cpurst_b               ),
  .fifo_create_en          (ar_dfifo_create_en     ),
  .fifo_create_en_dp       (ar_dfifo_create_en_gate),
  .fifo_pop_en             (ar_dfifo_pop_en        ),
  .fifo_create_data        (ar_dfifo_create_bus    ),
  .fifo_pop_data           (ar_dfifo_pop_bus       ),
  .fifo_pop_data_vld       (ar_dfifo_pop_bus_vld   ),
  .fifo_full               (ar_dfifo_full          ),
  .fifo_empty              (ar_dfifo_empty         ),
  .pad_yy_icg_scan_en    (pad_yy_icg_scan_en   ),
  .fifo_icg_en             (ciu_icg_en)
);

assign ar_req_vld = ar_dfifo_pop_bus_vld;
assign ar_req_bus[ARWIDTH-1:0] = ar_dfifo_pop_bus[ARWIDTH-1:0];
// ar request route 
assign ar_req_bar   = ar_req_bus[ARBAR_0];
assign ar_req_ctc   = ar_req_bus[ARCTC];
assign ar_req_ncq   = ar_req_bus[ARNCQ];
assign ar_req_snb1  = ar_req_bus[ARSNB1];
assign ar_req_snb0  = ar_req_bus[ARSNB0];

assign ar_dfifo_bmb_req  = ar_req_vld && ar_req_bar;
assign ar_dfifo_ctcq_req = ar_req_vld && ar_req_ctc;
assign ar_dfifo_ncq_req  = ar_req_vld && ar_req_ncq;
assign ar_dfifo_sab0_req = ar_req_vld && ar_req_snb0;
assign ar_dfifo_sab1_req = ar_req_vld && ar_req_snb1;

assign piu_ctcq_ar_req   = ar_dfifo_ctcq_req;
assign piu_ncq_ar_req    = ar_dfifo_ncq_req ;
assign piu_snb1_ar_req   = ar_dfifo_sab1_req;
assign piu_snb0_ar_req   = ar_dfifo_sab0_req;

assign piu_snb0_ar_bus[ARWIDTH_SNB-1:0] = {ar_req_bus[ARWIDTH-1:ARADDR_0],ar_req_bus[ARBAR_1:0]};
assign piu_snb1_ar_bus[ARWIDTH_SNB-1:0] = {ar_req_bus[ARWIDTH-1:ARADDR_0],ar_req_bus[ARBAR_1:0]};
assign piu_ctcq_ar_bus[ARWIDTH_SNB-1:0] = {ar_req_bus[ARWIDTH-1:ARADDR_0],ar_req_bus[ARBAR_1:0]};
assign piu_ncq_ar_bus[ARWIDTH_NCQ-1:0]  = {ar_req_bus[ARWIDTH-1:ARADDR_0],
                                           ar_req_bus[ARBAR_1:ARLEN_0],
                                           piu_no[2:0],ar_req_bus[ARID_4:ARID_0],
                                           ar_req_bus[ARUSER_2:0]};

// to bmb
assign ar_req_rid[4:0]      = ar_req_bus[ARID_4:ARID_0];
assign ar_req_domain[1:0]   = ar_req_bus[ARDOMAIN_1:ARDOMAIN_0];
assign ar_req_bar_type[1:0] = ar_req_bus[ARBAR_1:ARBAR_0];

// arready to ibiu
assign ciu_ibiu_arready = !ar_dfifo_full;

//==========================================================
//                          AW
//==========================================================
parameter AWPROT_0   = 0;
parameter AWPROT_2   = 2;
parameter AWCACHE_0  = 3;
parameter AWCACHE_3  = 6;
parameter AWSIZE_0   = 7;
parameter AWSIZE_2   = 9;
parameter AWLOCK     = 10;
parameter AWUSER_0   = 11;
parameter AWUSER_1   = 12;
parameter AWUSER_2   = 13;
parameter AWID_0     = 14;
parameter AWID_4     = 18;
parameter AWLEN_0    = 19;
parameter AWLEN_1    = 20;
parameter AWBURST_0  = 21;
parameter AWBURST_1  = 22;
parameter AWSOOP_0   = 23;
parameter AWSOOP_2   = 25;
parameter AWSOOP_3   = 26;
parameter AWDOMAIN_0 = 27;
parameter AWDOMAIN_1 = 28;
parameter AWBAR_0    = 29;
parameter AWBAR_1    = 30;
parameter AWSNB0     = 31;
parameter AWSNB1     = 32;
parameter AWNCQ      = 33;
parameter AWCTC      = 34;
parameter AWADDR_0   = 35;
parameter AWADDR_4   = 39;
parameter AWADDR_5   = 40;
parameter AWADDR_H    = 74; //ADDRW-1+AWADDR_0;
parameter AWWIDTH     = 75; //ADDRW + AWADDR_0;
parameter AWWIDTH_SNB = 71; //ARWIDTH -4;
parameter AWWIDTH_NCQ = 74; //ARLEN_0 + 3 + ADDRW;
parameter WU          = 3'b000;
parameter WLU         = 3'b001;
parameter EVICT       = 3'b100;

// &Force("input", "ibiu_ciu_awunique"); @205

assign aw_ca = |ibiu_ciu_awcache[3:2];
assign ibiu_ciu_awxid[NCQ]  = !ibiu_ciu_awbar[0] &&!aw_ca;
assign ibiu_ciu_awxid[SNB1] = !ibiu_ciu_awbar[0] && aw_ca && ibiu_ciu_awaddr[6];
assign ibiu_ciu_awxid[SNB0] = !ibiu_ciu_awbar[0] && aw_ca && !ibiu_ciu_awaddr[6];


assign aw_bar = ibiu_ciu_awbar[0];
assign aw_create_ws = ((ibiu_ciu_awsnoop[2:0] == WU) || 
                       (ibiu_ciu_awsnoop[2:0] == WLU)) && 
                      (ibiu_ciu_awdomain[1:0] == 2'b01) ||
                      aw_bar;

assign aw_dfifo_create_en = ibiu_ciu_awvalid;

assign aw_dfifo_create_en_gate = ibiu_ciu_awvalid;

assign aw_grant_xid[3:0]  = {bmb_aw_dfifo_grant,
                             ncq_piu_aw_grant,
                             snb1_piu_aw_grant,
                             snb0_piu_aw_grant};

assign aw_grant           = |aw_grant_xid[3:0];

assign aw_dfifo_create_bus[AWWIDTH-1:0] = {ibiu_ciu_awaddr[ADDRW-1:0],
                                           1'b0,ibiu_ciu_awxid[2:0],
                                           ibiu_ciu_awbar[1:0],
                                           ibiu_ciu_awdomain[1:0],
                                           1'b0,ibiu_ciu_awsnoop[2:0],
                                           ibiu_ciu_awburst[1:0],
                                           ibiu_ciu_awlen[1:0],
                                           ibiu_ciu_awid[4:0],
                                           1'b0,ibiu_ciu_awuser, 1'b0,
                                           ibiu_ciu_awlock,
                                           ibiu_ciu_awsize[2:0],
                                           ibiu_ciu_awcache[3:0],
                                           ibiu_ciu_awprot[2:0]};

assign ws_dfifo_create_en = aw_dfifo_create_en & aw_create_ws & ~ws_dfifo_vld;
assign ws_dfifo_pop_en    = aw_grant & !wns_dfifo_vld & ws_dfifo_vld;

always@(posedge aw_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ws_dfifo_vld <= 1'b0;
  else if (ws_dfifo_create_en)
    ws_dfifo_vld <= 1'b1;
  else if (ws_dfifo_pop_en)
    ws_dfifo_vld <= 1'b0;
end

always@(posedge ws_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ws_dfifo_data[AWWIDTH-1:0] <= {AWWIDTH{1'b0}};
  else if (ws_dfifo_create_en)
    ws_dfifo_data[AWWIDTH-1:0] <= aw_dfifo_create_bus[AWWIDTH-1:0];
end

assign wns_dfifo_create_en = aw_dfifo_create_en & !aw_create_ws & ~wns_dfifo_vld;
assign wns_dfifo_pop_en    = aw_grant & wns_dfifo_vld;

always@(posedge aw_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wns_dfifo_vld <= 1'b0;
  else if (wns_dfifo_create_en)
    wns_dfifo_vld <= 1'b1;
  else if (wns_dfifo_pop_en)
    wns_dfifo_vld <= 1'b0;
end

always@(posedge wns_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    wns_dfifo_data[AWWIDTH-1:0] <= {AWWIDTH{1'b0}};
  else if (wns_dfifo_create_en)
    wns_dfifo_data[AWWIDTH-1:0] <= aw_dfifo_create_bus[AWWIDTH-1:0];
end

assign aw_dfifo_empty = !wns_dfifo_vld & !ws_dfifo_vld;
assign aw_dfifo_full  = wns_dfifo_vld & ws_dfifo_vld;

// &Instance("gated_clk_cell", "x_aw_ws_dp_gated_clk"); @293
gated_clk_cell  x_aw_ws_dp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ws_dp_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ws_dfifo_create_en),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @294
//          .external_en (1'b0), @295
//          .global_en   (1'b1), @296
//          .module_en   (ciu_icg_en), @297
//          .local_en    (ws_dfifo_create_en), @298
//          .clk_out     (ws_dp_clk)); @299

// &Instance("gated_clk_cell", "x_aw_wns_dp_gated_clk"); @301
gated_clk_cell  x_aw_wns_dp_gated_clk (
  .clk_in              (forever_cpuclk     ),
  .clk_out             (wns_dp_clk         ),
  .external_en         (1'b0               ),
  .global_en           (1'b1               ),
  .local_en            (wns_dfifo_create_en),
  .module_en           (ciu_icg_en         ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en )
);

// &Connect(.clk_in      (forever_cpuclk), @302
//          .external_en (1'b0), @303
//          .global_en   (1'b1), @304
//          .module_en   (ciu_icg_en), @305
//          .local_en    (wns_dfifo_create_en), @306
//          .clk_out     (wns_dp_clk)); @307

assign aw_ctrl_clk_en = aw_dfifo_create_en_gate | wns_dfifo_vld | ws_dfifo_vld;

// &Instance("gated_clk_cell", "x_aw_ctrl_gated_clk"); @311
gated_clk_cell  x_aw_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (aw_ctrl_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (aw_ctrl_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @312
//          .external_en (1'b0), @313
//          .global_en   (1'b1), @314
//          .module_en   (ciu_icg_en), @315
//          .local_en    (aw_ctrl_clk_en), @316
//          .clk_out     (aw_ctrl_clk)); @317

//----------------------------------------------------------
//            AW REQ 
//----------------------------------------------------------
assign aw_req_vld = (ws_dfifo_vld | wns_dfifo_vld)
                  & !wd_sid_fifo_full;

assign aw_req_bus[AWWIDTH-1:0] = wns_dfifo_vld ? wns_dfifo_data[AWWIDTH-1:0] : ws_dfifo_data[AWWIDTH-1:0];

assign aw_pop_evict     = (aw_req_bus[AWSOOP_2:AWSOOP_0] == EVICT);
assign aw_req_bar       = aw_req_bus[AWBAR_0];
assign aw_req_ncq       = aw_req_bus[AWNCQ];
assign aw_req_snb1      = aw_req_bus[AWSNB1];
assign aw_req_snb0      = aw_req_bus[AWSNB0];
assign aw_req_burst_dec =&aw_req_bus[AWBURST_1:AWBURST_0];

// ar request route
assign aw_dfifo_bmb_req = aw_req_vld && aw_req_bar;
assign piu_ncq_aw_req   = aw_req_vld && aw_req_ncq;
assign piu_snb0_aw_req  = aw_req_vld && aw_req_snb0;
assign piu_snb1_aw_req  = aw_req_vld && aw_req_snb1;

assign piu_xx_aw_bus[AWWIDTH_SNB-1:0] = {aw_req_bus[AWWIDTH-1:AWADDR_0], aw_req_bus[AWBAR_1:0]} & 
                                      {{48{1'b1}}, 2'b01, {(AWBURST_0){1'b1}}};

assign piu_ncq_aw_bus[AWWIDTH_NCQ-1:0] = {aw_req_bus[AWWIDTH-1:AWADDR_0],
                                          aw_req_bus[AWBAR_1:AWLEN_0],
                                          piu_no[2:0],aw_req_bus[AWID_4:AWID_0],
                                          aw_req_bus[AWUSER_2:0]};
// awready to ibiu
assign ciu_ibiu_ws_awready  = !ws_dfifo_vld;
assign ciu_ibiu_wns_awready = !wns_dfifo_vld;

assign ciu_ibiu_awready = (aw_create_ws & !ws_dfifo_vld | 
                          !aw_create_ws & !wns_dfifo_vld);

//==========================================================
//                   SID FIFO for WD
//==========================================================
//xid[3:0] : [3]:bmb; [2]:ncq; [1]:sab1; [0]:sab0;
parameter WD_SID_WIDTH = 12;
// &Force("nonport", "wd_sid_fifo_create_en"); @359
// &Force("nonport", "wd_sid_fifo_full"); @360
// &Force("nonport", "wd_sid_fifo_pop_en"); @361
// &Force("nonport", "wd_sid_fifo_create_bus"); @362
// &Force("nonport", "wd_sid_fifo_pop_bus"); @363
// &Force("nonport", "wd_sid_fifo_pop_bus_vld"); @364
// &Force("nonport", "wd_sid_fifo_empty"); @365

assign aw_grant_sid[4:0]  = snb1_piu_aw_grant
                          ? snb1_piux_aw_sid[4:0]
                          : snb0_piux_aw_sid[4:0];

assign wd_sid_fifo_create_en = aw_grant & !aw_pop_evict;
assign wd_sid_fifo_pop_en    = pkb_wd_sid_grant &&
                               wd_sid_fifo_pop_bus_vld;

assign wd_sid_fifo_create_bus[WD_SID_WIDTH:0] = {wns_dfifo_vld,
                                                 aw_req_burst_dec,
                                                 aw_grant_xid[3:0],
                                                 aw_req_bus[AWADDR_5:AWADDR_4],
                                                 aw_grant_sid[4:0]};

ct_fifo #(.WIDTH(WD_SID_WIDTH+1), .DEPTH(2), .PTR_W(1)) x_ct_piu_wd_sid_fifo(
  .clk                    (ciu_top_clk             ),
  .rst_b                  (cpurst_b                ),
  .fifo_create_en         (wd_sid_fifo_create_en   ),
  .fifo_create_en_dp      (wd_sid_fifo_create_en   ),
  .fifo_pop_en            (wd_sid_fifo_pop_en      ),
  .fifo_create_data       (wd_sid_fifo_create_bus  ),
  .fifo_pop_data          (wd_sid_fifo_pop_bus     ),
  .fifo_pop_data_vld      (wd_sid_fifo_pop_bus_vld ),
  .fifo_full              (wd_sid_fifo_full        ),
  .fifo_empty             (wd_sid_fifo_empty       ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en)
);

assign wd_pkb_sid_bus[WD_SID_WIDTH-1:0] = wd_sid_fifo_pop_bus[WD_SID_WIDTH-1:0];

assign wd_dfifo_sel_wns = wd_sid_fifo_pop_bus_vld & wd_sid_fifo_pop_bus[WD_SID_WIDTH];

//==========================================================
//                          WD_WNS
//==========================================================
parameter WD_WIDTH = 146;

// &Force("nonport", "wd_wns_dfifo_create_en"); @405
// &Force("nonport", "wd_dfifo_create_bus"); @406
// &Force("nonport", "wd_wns_dfifo_full"); @407
// &Force("nonport", "wd_wns_dfifo_empty"); @408
// &Force("nonport", "wd_wns_dfifo_pop_bus"); @409
// &Force("nonport", "wd_wns_dfifo_pop_bus_vld"); @410
// &Force("nonport", "wd_wns_dfifo_pop_en"); @411


assign wd_wns_dfifo_create_en = ibiu_ciu_wvalid &&
                                ibiu_ciu_wns    &&
                               !wd_wns_dfifo_full; 

assign wd_wns_dfifo_pop_en = pkb_wd_grant &&
                             wd_dfifo_sel_wns;

assign wd_dfifo_create_bus[WD_WIDTH-1:0] = {ibiu_ciu_werr,
                                            ibiu_ciu_wstrb[15:0],
                                            ibiu_ciu_wdata[127:0],
                                            ibiu_ciu_wlast};

ct_fifo #(.WIDTH(WD_WIDTH), .DEPTH(2), .PTR_W(1)) x_ct_piu_wd_wns_dfifo(
  .clk                    (forever_cpuclk          ),
  .rst_b                  (cpurst_b                ),
  .fifo_create_en         (wd_wns_dfifo_create_en  ),
  .fifo_create_en_dp      (wd_wns_dfifo_create_en  ),
  .fifo_pop_en            (wd_wns_dfifo_pop_en     ),
  .fifo_create_data       (wd_dfifo_create_bus     ),
  .fifo_pop_data          (wd_wns_dfifo_pop_bus    ),
  .fifo_pop_data_vld      (wd_wns_dfifo_pop_bus_vld),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en    ),
  .fifo_icg_en            (ciu_icg_en              ),
  .fifo_full              (wd_wns_dfifo_full       ),
  .fifo_empty             (wd_wns_dfifo_empty      )
);

assign wd_wns_pkb_req               = wd_wns_dfifo_pop_bus_vld & wd_sid_fifo_pop_bus_vld;
assign wd_wns_pkb_bus[WD_WIDTH-1:0] = wd_wns_dfifo_pop_bus[WD_WIDTH-1:0];

//==========================================================
//                          WD_WS
//==========================================================

// &Force("nonport", "wd_ws_dfifo_create_en"); @448
// &Force("nonport", "wd_ws_dfifo_full"); @449
// &Force("nonport", "wd_ws_dfifo_empty"); @450
// &Force("nonport", "wd_ws_dfifo_pop_bus"); @451
// &Force("nonport", "wd_ws_dfifo_pop_bus_vld"); @452
// &Force("nonport", "wd_ws_dfifo_pop_en"); @453

assign wd_ws_dfifo_create_en = ibiu_ciu_wvalid &&
                               !ibiu_ciu_wns   &&
                               !wd_ws_dfifo_full; 

assign wd_ws_dfifo_pop_en = pkb_wd_grant &&
                            !wd_dfifo_sel_wns;

ct_fifo #(.WIDTH(WD_WIDTH), .DEPTH(4), .PTR_W(2)) x_ct_piu_wd_ws_dfifo(
  .clk                    (forever_cpuclk         ),
  .rst_b                  (cpurst_b               ),
  .fifo_create_en         (wd_ws_dfifo_create_en  ),
  .fifo_create_en_dp      (wd_ws_dfifo_create_en  ),
  .fifo_pop_en            (wd_ws_dfifo_pop_en     ),
  .fifo_create_data       (wd_dfifo_create_bus    ),
  .fifo_pop_data          (wd_ws_dfifo_pop_bus    ),
  .fifo_pop_data_vld      (wd_ws_dfifo_pop_bus_vld),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en   ),
  .fifo_icg_en            (ciu_icg_en),
  .fifo_full              (wd_ws_dfifo_full       ),
  .fifo_empty             (wd_ws_dfifo_empty      )
);

assign wd_ws_pkb_req               = wd_ws_dfifo_pop_bus_vld & wd_sid_fifo_pop_bus_vld;
assign wd_ws_pkb_bus[WD_WIDTH-1:0] = wd_ws_dfifo_pop_bus[WD_WIDTH-1:0];

assign wd_pkb_req               = wd_dfifo_sel_wns ? wd_wns_pkb_req : wd_ws_pkb_req;
assign wd_pkb_bus[WD_WIDTH-1:0] = wd_dfifo_sel_wns ? wd_wns_pkb_bus[WD_WIDTH-1:0] : wd_ws_pkb_bus[WD_WIDTH-1:0];

assign ciu_ibiu_wready = (ibiu_ciu_wns & !wd_wns_dfifo_full | 
                         !ibiu_ciu_wns & !wd_ws_dfifo_full);

assign ciu_ibiu_ws_wready  = !wd_ws_dfifo_full;
assign ciu_ibiu_wns_wready = !wd_wns_dfifo_full;

//==========================================================
//                          CD
//==========================================================
parameter CD_RLAST     = 0;
parameter CD_RDATA_0   = 1;
parameter CD_RDATA_127 = 128;
parameter CD_ERR       = 129;
parameter CD_WIDTH     = 130;

// &Force("nonport", "cd_dfifo_create_bus"); @498
// &Force("nonport", "cd_dfifo_create_en"); @499
// &Force("nonport", "cd_dfifo_full"); @500
// &Force("nonport", "cd_dfifo_pop_bus"); @501
// &Force("nonport", "cd_dfifo_pop_bus_vld"); @502
// &Force("nonport", "cd_dfifo_pop_en"); @503
// &Force("nonport", "cd_sid_fifo_create_bus"); @504
// &Force("nonport", "cd_sid_fifo_pop_bus"); @505
// &Force("nonport", "cd_sid_fifo_pop_bus_vld"); @506

assign cd_dfifo_create_en = ibiu_ciu_cdvalid &&
                            !cd_dfifo_full;

assign cd_dfifo_pop_en    = pkb_cd_grant && 
                            cd_dfifo_pop_bus_vld;

assign cd_dfifo_create_bus[CD_WIDTH-1:0] = {ibiu_ciu_cderr,
                                            ibiu_ciu_cddata[127:0],
                                            ibiu_ciu_cdlast};

ct_fifo #(.WIDTH(CD_WIDTH), .DEPTH(2), .PTR_W(1)) x_ct_piu_cd_dfifo(
  .clk                    (ciu_top_clk            ),
  .rst_b                  (cpurst_b               ),
  .fifo_create_en         (cd_dfifo_create_en     ),
  .fifo_create_en_dp      (cd_dfifo_create_en     ),
  .fifo_pop_en            (cd_dfifo_pop_en        ),
  .fifo_create_data       (cd_dfifo_create_bus    ),
  .fifo_pop_data          (cd_dfifo_pop_bus       ),
  .fifo_pop_data_vld      (cd_dfifo_pop_bus_vld   ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en   ),
  .fifo_icg_en            (ciu_icg_en),
  .fifo_full              (cd_dfifo_full          ),
  .fifo_empty             (cd_dfifo_empty         )
);

assign cd_req_vld = cd_dfifo_pop_bus_vld &&
                    cd_sid_vld;

assign cd_req_bus[CD_WIDTH-1:0] = cd_dfifo_pop_bus[CD_WIDTH-1:0];

assign cd_pkb_req               = cd_req_vld;
assign cd_pkb_bus[CD_WIDTH-1:0] = cd_req_bus[CD_WIDTH-1:0];

assign ciu_ibiu_cdready = !cd_dfifo_full;

//==========================================================
//                          AC
//==========================================================
// XID[4:0] + ADDR_5_4[1:0] + SID[2:0] + RID[7:0] + SNOOP[3:0] + ADDR[25:0]
parameter AC_SNOOP_0 = 0;
parameter AC_SNOOP_3 = 3;
//parameter AC_RID_0   = 4;
//parameter AC_RID_7   = 11;
parameter AC_INST    = 4;
parameter AC_SID_0   = 5;
parameter AC_SID_4   = 9;
parameter AC_XID_0   = 10;
parameter AC_XID_1   = 11;
parameter AC_XID_4   = 14;
parameter AC_ADDR_0  = 15;
parameter AC_ADDR_4  = 19;
parameter AC_ADDR_5  = 20;
parameter AC_ADDR_H  = 54; //ADDRW-1+AC_ADDR_0;
parameter AC_WIDTH   = 55; //ADDRW+AC_ADDR_0;

// &Force("nonport", "ac_prio_clk"); @563
// &Force("nonport", "ac_dfifo_create_en"); @564
// &Force("nonport", "ac_dfifo_create_bus"); @565
// &Force("nonport", "ac_dfifo_full"); @566
// &Force("nonport", "ac_dfifo_pop_bus"); @567
// &Force("nonport", "ac_dfifo_pop_bus_vld"); @568
// &Force("nonport", "ac_dfifo_pop_en"); @569
// &Force("nonport", "ac_sel"); @570

assign ac_prio_clk_en = ac_idle & (|ac_sel[2:0]);

// &Instance("gated_clk_cell", "x_ac_prio_gated_clk"); @574
gated_clk_cell  x_ac_prio_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (ac_prio_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ac_prio_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @575
//          .external_en (1'b0), @576
//          .global_en   (1'b1), @577
//          .module_en (ciu_icg_en       ), @578
//          .local_en    (ac_prio_clk_en), @579
//          .clk_out     (ac_prio_clk)); @580

assign snb0_ac_valid = snb0_piu_acvalid && !ctcq_mask_snb;
assign snb1_ac_valid = snb1_piu_acvalid && !ctcq_mask_snb;

assign ac_valid[2:0] = {ctcq_piu_acvalid,
                        snb1_ac_valid,
                        snb0_ac_valid};
assign ac_idle       = !ac_dfifo_full;

ct_prio #(.NUM(3)) x_ct_piu_ac_prio(
  .clk                 (ac_prio_clk       ),
  .rst_b               (cpurst_b          ),
  .valid               (ac_valid          ),
  .clr                 (ac_idle           ),
  .sel                 (ac_sel            )
);

//AC DFIFO
assign ac_dfifo_create_en = (|ac_valid[2:0]) &&
                            !ac_dfifo_full;
//                            !ac_dfifo_bypass_en;

//assign ac_dfifo_bypass_en = ibiu_ciu_acready && 
//                            !ac_dfifo_pop_bus_vld &&
//                            !rspq_full;

assign ac_dfifo_pop_en    = ibiu_ciu_acready && 
                            ac_dfifo_pop_bus_vld &&
                            !rspq_full;

assign ac_dfifo_create_bus[AC_WIDTH-1:0] = 
       {AC_WIDTH{ac_sel[2]}} & ctcq_piu_acbus[AC_WIDTH-1:0] |
       {AC_WIDTH{ac_sel[1]}} & snb1_piu_acbus[AC_WIDTH-1:0] |
       {AC_WIDTH{ac_sel[0]}} & snb0_piu_acbus[AC_WIDTH-1:0];

ct_fifo #(.WIDTH(AC_WIDTH), .DEPTH(2), .PTR_W(1)) x_ct_piu_ac_dfifo(
  .clk                 (ciu_top_clk         ),
  .rst_b               (cpurst_b            ),
  .fifo_create_en      (ac_dfifo_create_en  ),
  .fifo_create_en_dp   (ac_dfifo_create_en  ),
  .fifo_pop_en         (ac_dfifo_pop_en     ),
  .fifo_create_data    (ac_dfifo_create_bus ),
  .fifo_pop_data       (ac_dfifo_pop_bus    ),
  .fifo_pop_data_vld   (ac_dfifo_pop_bus_vld),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en),
  .fifo_full           (ac_dfifo_full       ),
  .fifo_empty          (ac_dfifo_empty      )
);

//assign ac_req_vld = ((|ac_valid[2:0]) || ac_dfifo_pop_bus_vld) && !rspq_full;
//assign ac_req_bus[AC_WIDTH-1:0] = ac_dfifo_pop_bus_vld
//                                ? ac_dfifo_pop_bus[AC_WIDTH-1:0]
//                                : ac_dfifo_create_bus[AC_WIDTH-1:0];

assign ac_req_vld               = ac_dfifo_pop_bus_vld && !rspq_full;
assign ac_req_bus[AC_WIDTH-1:0] = ac_dfifo_pop_bus[AC_WIDTH-1:0];

assign ciu_ibiu_acvalid           = ac_req_vld;
assign ciu_ibiu_acsnoop[3:0]      = ac_req_bus[AC_SNOOP_3:AC_SNOOP_0];
assign ciu_ibiu_acprot[2:0]       = {2'b00,ac_req_bus[AC_INST]};
assign ciu_ibiu_acaddr[ADDRW-1:0] = ac_req_bus[AC_ADDR_H:AC_ADDR_0];

// &Force("nonport", "ac_verf_create_bus"); @645
// &Force("nonport", "ac_verf_pop_bus"); @646
// &Force("nonport", "ac_verf_pop_bus_vld"); @647
// &Force("nonport", "ac_verf_dfifo_full"); @648
// &Force("nonport", "ac_verf_dfifo_empty"); @649
// &Force("output", "ciu_ibiu_ac_verf_bus"); @650

assign piu_snb0_ac_grant = ac_idle && ac_sel[0];
assign piu_snb1_ac_grant = ac_idle && ac_sel[1];
assign piu_ctcq_ac_grant = ac_idle && ac_sel[2];

// &Force("output", "piu_ctcq_ac_grant"); @679
always@(posedge ac_prio_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctcq_mask_snb <= 1'b0;
  else if (piu_ctcq_ac_grant)
    ctcq_mask_snb <= ctcq_piu_acbus[AC_ADDR_0]; //1 indicate there is another transfer. twice ctc cannot be disturb
  else
    ctcq_mask_snb <= ctcq_mask_snb;
end

//==========================================================
//                          CR
//==========================================================
// VALID + CRRESP[4:0] 
// &Force("nonport", "cr_dfifo_create_bus"); @694
// &Force("nonport", "cr_dfifo_create_en"); @695
// &Force("nonport", "cr_dfifo_full"); @696
// &Force("nonport", "cr_dfifo_pop_bus"); @697
// &Force("nonport", "cr_dfifo_pop_bus_vld"); @698
// &Force("nonport", "cr_dfifo_pop_en"); @699

parameter CR_WIDTH    = 5;
parameter CR_RRESP_DT = 0;
parameter CR_RRESP_2  = 2;
parameter CR_RRESP_3  = 3;
parameter CRR_WIDTH   = 10;

assign cr_dfifo_create_en = ibiu_ciu_crvalid &&
                            !cr_dfifo_full;

assign cr_dfifo_pop_en    = sab_piu_cr_grant &&
                            cr_dfifo_pop_bus_vld ;
assign sab_piu_cr_grant   = snb0_piu_cr_grant ||
                            snb1_piu_cr_grant ||
                            ctcq_piu_cr_grant;

assign cr_dfifo_create_bus[CR_WIDTH-1:0] = ibiu_ciu_crresp[4:0];

ct_fifo #(.WIDTH(CR_WIDTH), .DEPTH(2), .PTR_W(1)) x_ct_piu_cr_dfifo(
  .clk                 (ciu_top_clk         ),
  .rst_b               (cpurst_b            ),
  .fifo_create_en      (cr_dfifo_create_en  ),
  .fifo_create_en_dp   (cr_dfifo_create_en  ),
  .fifo_pop_en         (cr_dfifo_pop_en     ),
  .fifo_create_data    (cr_dfifo_create_bus ),
  .fifo_pop_data       (cr_dfifo_pop_bus    ),
  .fifo_pop_data_vld   (cr_dfifo_pop_bus_vld),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en),
  .fifo_full           (cr_dfifo_full       ),
  .fifo_empty          (cr_dfifo_empty      )
);

assign cr_req_vld = cr_dfifo_pop_bus_vld
                 && !cd_sid_fifo_full;

assign cr_req_bus[CR_WIDTH-1:0] = cr_dfifo_pop_bus[CR_WIDTH-1:0];
assign piu_snb0_cr_req = rspq_pop_xid[1] && !rspq_pop_xid[0] && cr_req_vld;
assign piu_snb1_cr_req = rspq_pop_xid[1] &&  rspq_pop_xid[0] && cr_req_vld;
assign piu_ctcq_cr_req = rspq_pop_xid[4] && cr_req_vld;

assign piu_xx_cr_bus[CRR_WIDTH-1:0]   = {rspq_pop_sid[4:0],
                                         cr_req_bus[CR_WIDTH-1:0]};
assign piu_snb0_cr_bus[CRR_WIDTH-1:0] = piu_xx_cr_bus[CRR_WIDTH-1:0];
assign piu_snb1_cr_bus[CRR_WIDTH-1:0] = piu_xx_cr_bus[CRR_WIDTH-1:0];
assign piu_ctcq_cr_bus[CRR_WIDTH-1:0] = piu_xx_cr_bus[CRR_WIDTH-1:0];

assign ciu_ibiu_crready = !cr_dfifo_full;

//==========================================================
//                    CR response QUEUE
//==========================================================
// &Force("nonport", "rspq_create_bus"); @752
// &Force("nonport", "rspq_create_en"); @753
// &Force("nonport", "rspq_full"); @754
// &Force("nonport", "rspq_pop_bus"); @755
// &Force("nonport", "rspq_pop_bus_vld"); @756
// &Force("nonport", "rspq_pop_en"); @757

parameter RSPQ_WIDTH  = 12;
parameter RSPQ_SID_0  = 0;
parameter RSPQ_SID_4  = 4;
parameter RSPQ_ADDR_4 = 5;
parameter RSPQ_ADDR_5 = 6;
parameter RSPQ_XID_0  = 7;
parameter RSPQ_XID_3  = 10;
parameter RSPQ_XID_4  = 11;

assign rspq_create_en = ac_req_vld && ibiu_ciu_acready;
assign rspq_pop_en    = sab_piu_cr_grant;

assign rspq_create_xid[4:0] = ac_req_bus[AC_XID_4:AC_XID_0];
assign rspq_create_addr[1:0] = ac_req_bus[AC_ADDR_5:AC_ADDR_4];
assign rspq_create_sid[4:0] = ac_req_bus[AC_SID_4:AC_SID_0];
//assign rspq_create_rid[7:0] = ac_req_bus[AC_RID_7:AC_RID_0];
assign rspq_create_bus[11:0] = {rspq_create_xid[4:0], rspq_create_addr[1:0], rspq_create_sid[4:0]};

ct_fifo #(.WIDTH(RSPQ_WIDTH), .DEPTH(12), .PTR_W(4)) x_ct_piu_rspq(
  .clk                 (ciu_top_clk         ),
  .rst_b               (cpurst_b            ),
  .fifo_create_en      (rspq_create_en      ),
  .fifo_create_en_dp   (rspq_create_en      ),
  .fifo_pop_en         (rspq_pop_en         ),
  .fifo_create_data    (rspq_create_bus     ),
  .fifo_pop_data       (rspq_pop_bus        ),
  .fifo_pop_data_vld   (rspq_pop_bus_vld    ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en),
  .fifo_full           (rspq_full           ),
  .fifo_empty          (rspq_empty          )
);


assign rspq_pop_sid[4:0] = rspq_pop_bus[RSPQ_SID_4:RSPQ_SID_0];
assign rspq_pop_xid[4:0] = rspq_pop_bus[RSPQ_XID_4:RSPQ_XID_0];
assign rspq_pop_addr_5_4[1:0] = rspq_pop_bus[RSPQ_ADDR_5:RSPQ_ADDR_4];

//==========================================================
//                        SID FIFO for CD
//==========================================================
parameter CD_IDF_WIDTH = 9;
parameter CD_SID_0     = 0;
parameter CD_SID_4     = 4;
parameter CD_ADDR_4    = 5;
parameter CD_ADDR_5    = 6;
parameter CD_XID_0     = 7;
parameter CD_XID_1     = 8;

assign cd_sid_fifo_create_en = sab_piu_cr_grant &&
                               rspq_pop_bus_vld &&
                               cr_req_bus[CR_RRESP_DT];
  
assign cd_sid_fifo_pop_en    = pkb_cd_sid_grant &&
                               cd_sid_fifo_pop_bus_vld;

assign cd_sid_fifo_create_bus[CD_IDF_WIDTH-1:0] = {rspq_pop_xid[1:0],
                                                   rspq_pop_addr_5_4[1:0],
                                                   rspq_pop_sid[4:0]};

ct_fifo #(.WIDTH(CD_IDF_WIDTH), .DEPTH(8), .PTR_W(3)) x_ct_piu_cd_sid_fifo(
  .clk                 (ciu_top_clk             ),
  .rst_b               (cpurst_b                ),
  .fifo_create_en      (cd_sid_fifo_create_en   ),
  .fifo_create_en_dp   (cd_sid_fifo_create_en   ),
  .fifo_pop_en         (cd_sid_fifo_pop_en      ),
  .fifo_create_data    (cd_sid_fifo_create_bus  ),
  .fifo_pop_data       (cd_sid_fifo_pop_bus     ),
  .fifo_pop_data_vld   (cd_sid_fifo_pop_bus_vld ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en),
  .fifo_full           (cd_sid_fifo_full_fake   ), 
  .fifo_empty          (cd_sid_fifo_empty       )
);

assign cd_sid_ctrl_clk_en = cd_sid_fifo_create_en || cd_sid_fifo_pop_en;
// &Instance("gated_clk_cell","x_cd_sid_fifo_gated_cell"); @855
gated_clk_cell  x_cd_sid_fifo_gated_cell (
  .clk_in               (ciu_top_clk         ),
  .clk_out              (cd_sid_fifo_ctrl_clk),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (cd_sid_ctrl_clk_en  ),
  .module_en            (ciu_icg_en          ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect(.clk_in           (ciu_top_clk   ), @856
//          .external_en      (1'b0), @857
//          .global_en        (1'b1), @858
//          .module_en (ciu_icg_en       ), @859
//          .local_en         (cd_sid_ctrl_clk_en), @860
//          .clk_out          (cd_sid_fifo_ctrl_clk)); @861

always @(posedge cd_sid_fifo_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cd_sid_fifo_cnt[3:0] <= 4'b0;
  else if (cd_sid_fifo_create_en) begin
    if (!cd_sid_fifo_pop_en)
       cd_sid_fifo_cnt[3:0] <= cd_sid_fifo_cnt[3:0] + 4'b1;
    else
       cd_sid_fifo_cnt[3:0] <= cd_sid_fifo_cnt[3:0];
  end
  else if (cd_sid_fifo_pop_en)
    cd_sid_fifo_cnt[3:0] <= cd_sid_fifo_cnt[3:0] - 4'b1;
end

assign cd_sid_fifo_full = cd_sid_fifo_cnt[3];

assign cd_xid_snb0      = cd_sid_fifo_pop_bus[CD_XID_1] && !cd_sid_fifo_pop_bus[CD_XID_0];
assign cd_xid_snb1      = cd_sid_fifo_pop_bus[CD_XID_1] && cd_sid_fifo_pop_bus[CD_XID_0];
assign cd_addr_5_4[1:0] = cd_sid_fifo_pop_bus[CD_ADDR_5:CD_ADDR_4];
assign cd_sid[4:0]      = cd_sid_fifo_pop_bus[CD_SID_4:CD_SID_0];

assign cd_sid_vld       = cd_sid_fifo_pop_bus_vld;

parameter CD_SID_WIDTH = 12;

assign cd_pkb_sid_bus[CD_SID_WIDTH-1:0] = {1'b0,                          // burst_dec
                                           2'b00,cd_xid_snb1,cd_xid_snb0, // XID
                                           cd_addr_5_4[1:0],              // ADDR_5_4 
                                           cd_sid[4:0]};                  // SID

//==========================================================
//                        package buffer
//==========================================================
parameter PKB_WIDTH    = 158;
parameter PKB_WERR     = 157;
parameter PKB_WSTRB_15 = 156;
parameter PKB_WSTRB_0  = 141;
parameter PKB_DATA_127 = 140;
parameter PKB_DATA_0   = 13;
parameter PKB_LAST     = 12;
parameter PKB_BUR_DEC  = 11;
parameter PKB_XID_3    = 10;
parameter PKB_XID_0    = 7;
parameter PKB_ADDR_5   = 6;
parameter PKB_ADDR_4   = 5;
parameter PKB_SID_4    = 4;
parameter PKB_SID_0    = 0;

assign pkb_ctrl_clk_en = pkb_create_en | pkb_pop_en | pkb_dp_create_en;

// &Instance("gated_clk_cell", "x_pkb_ctrl_gated_clk"); @913
gated_clk_cell  x_pkb_ctrl_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (pkb_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pkb_ctrl_clk_en   ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @914
//          .external_en (1'b0), @915
//          .global_en   (1'b1), @916
//          .module_en (ciu_icg_en       ), @917
//          .local_en    (pkb_ctrl_clk_en), @918
//          .clk_out     (pkb_ctrl_clk)); @919

assign pkb_dp_clk_en = pkb_create_en;

// &Instance("gated_clk_cell", "x_pkb_dp_gated_clk"); @923
gated_clk_cell  x_pkb_dp_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (pkb_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pkb_dp_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @924
//          .external_en (1'b0), @925
//          .global_en   (1'b1), @926
//          .module_en (ciu_icg_en       ), @927
//          .local_en    (pkb_dp_clk_en), @928
//          .clk_out     (pkb_dp_clk)); @929

// &Instance("gated_clk_cell", "x_pkb_data0_gated_clk"); @931
gated_clk_cell  x_pkb_data0_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (pkb_data0_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pkb_data0_wen     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @932
//          .external_en (1'b0), @933
//          .global_en   (1'b1), @934
//          .module_en (ciu_icg_en       ), @935
//          .local_en    (pkb_data0_wen), @936
//          .clk_out     (pkb_data0_clk)); @937

// &Instance("gated_clk_cell", "x_pkb_data1_gated_clk"); @939
gated_clk_cell  x_pkb_data1_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (pkb_data1_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pkb_data1_wen     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @940
//          .external_en (1'b0), @941
//          .global_en   (1'b1), @942
//          .module_en (ciu_icg_en       ), @943
//          .local_en    (pkb_data1_wen), @944
//          .clk_out     (pkb_data1_clk)); @945
// &Instance("gated_clk_cell", "x_pkb_data2_gated_clk"); @946
gated_clk_cell  x_pkb_data2_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (pkb_data2_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pkb_data2_wen     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @947
//          .external_en (1'b0), @948
//          .global_en   (1'b1), @949
//          .module_en (ciu_icg_en       ), @950
//          .local_en    (pkb_data2_wen), @951
//          .clk_out     (pkb_data2_clk)); @952

// &Instance("gated_clk_cell", "x_pkb_data3_gated_clk"); @954
gated_clk_cell  x_pkb_data3_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (pkb_data3_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (pkb_data3_wen     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @955
//          .external_en (1'b0), @956
//          .global_en   (1'b1), @957
//          .module_en (ciu_icg_en       ), @958
//          .local_en    (pkb_data3_wen), @959
//          .clk_out     (pkb_data3_clk)); @960

//prio: CD > WD
assign pkb_cd_sid_grant = pkb_cd_grant && pkb_bus[PKB_LAST];
assign pkb_wd_sid_grant = pkb_wd_grant && pkb_bus[PKB_LAST];

assign pkb_cd_grant     = cd_pkb_req && (pkb_idle || (!pkb_rdy && pkb_cd_sel_final));
assign pkb_wd_grant     = wd_pkb_req && ((pkb_idle && !cd_pkb_req) || (!pkb_rdy && !pkb_cd_sel_final));

assign pkb_cd_sel_final = pkb_idle ? cd_pkb_req : pkb_cd_sel;

assign pkb_idle         = !pkb_vld ||
                          pkb_pop_en;

assign cd_bus[PKB_WIDTH-1:0] = {cd_pkb_bus[CD_ERR],
                                {16{1'b1}},
                                cd_pkb_bus[CD_RDATA_127:0],
                                cd_pkb_sid_bus[CD_SID_WIDTH-1:0]};

assign wd_bus[PKB_WIDTH-1:0] = {wd_pkb_bus[WD_WIDTH-1:0],
                                wd_pkb_sid_bus[WD_SID_WIDTH-1:0]};

assign pkb_bus[PKB_WIDTH-1:0] = pkb_cd_sel_final
                              ? cd_bus[PKB_WIDTH-1:0]
                              : wd_bus[PKB_WIDTH-1:0];
//first data create
assign pkb_create_en = pkb_idle &&
                       (wd_pkb_req || cd_pkb_req);
assign pkb_pop_en    = bmb_pkb_wcd_grant ||
                       ncq_piu_wcd_grant ||
                       snb1_piu_wcd_grant ||
                       snb0_piu_wcd_grant;

always@(posedge pkb_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pkb_vld <= 1'b0;
  else if (pkb_create_en)
    pkb_vld <= 1'b1;
  else if (pkb_pop_en)
    pkb_vld <= 1'b0;
end

always@(posedge pkb_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pkb_cd_sel <= 1'b0;
  else if (pkb_create_en)
    pkb_cd_sel <= cd_pkb_req;
end

always@(posedge pkb_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    pkb_wstrb[15:0]   <= 16'b0; 
    pkb_xid[3:0]      <= 4'b0;
    pkb_sid[4:0]      <= 5'b0;
    pkb_addr_5_4[1:0] <= 2'b0;
    pkb_bur_dec_val   <= 1'b0;
  end
  else if (pkb_create_en)
  begin
    pkb_wstrb[15:0]   <= pkb_bus[PKB_WSTRB_15:PKB_WSTRB_0];
    pkb_xid[3:0]      <= pkb_bus[PKB_XID_3:PKB_XID_0];
    pkb_sid[4:0]      <= pkb_bus[PKB_SID_4:PKB_SID_0];
    pkb_addr_5_4[1:0] <= pkb_bus[PKB_ADDR_5:PKB_ADDR_4];
    pkb_bur_dec_val   <= pkb_bus[PKB_BUR_DEC];
  end
end

always@(posedge pkb_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pkb_err           <= 1'b0;
  else if (pkb_create_en)
    pkb_err           <= pkb_bus[PKB_WERR];
  else if (pkb_dp_create_en)
    pkb_err           <= pkb_err | pkb_bus[PKB_WERR];
end
//--------------------------------------
//    package data
//--------------------------------------
assign pkb_dp_create_en = pkb_req_vld &&
                          (pkb_idle || !pkb_rdy);

assign pkb_req_vld      = pkb_cd_sel_final
                        ? cd_pkb_req
                        : wd_pkb_req;

always@(posedge pkb_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pkb_rdy <= 1'b0;
  else if (pkb_dp_create_en)
    pkb_rdy <= pkb_bus[PKB_LAST];
  else
    pkb_rdy <= pkb_rdy;
end

always@(posedge pkb_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    pkb_data_sel_ff[1:0] <= 2'b0;
  else if (pkb_dp_create_en)
  begin
    if (pkb_bur_dec_final)
      pkb_data_sel_ff[1:0] <= (pkb_data_sel[1:0] - 2'b1);
    else
      pkb_data_sel_ff[1:0] <= (pkb_data_sel[1:0] + 2'b1);
  end
end

assign pkb_bur_dec_final = pkb_idle
                         ? pkb_bus[PKB_BUR_DEC]
                         : pkb_bur_dec_val;
assign pkb_data_sel[1:0] = pkb_idle
                         ? pkb_bus[PKB_ADDR_5:PKB_ADDR_4]
                         : pkb_data_sel_ff[1:0];

assign pkb_data0_wen = (pkb_data_sel[1:0] == 2'b00) && pkb_dp_create_en;
assign pkb_data1_wen = (pkb_data_sel[1:0] == 2'b01) && pkb_dp_create_en;
assign pkb_data2_wen = (pkb_data_sel[1:0] == 2'b10) && pkb_dp_create_en;
assign pkb_data3_wen = (pkb_data_sel[1:0] == 2'b11) && pkb_dp_create_en;

always@(posedge pkb_data0_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
     pkb_data[127:0] <= 128'b0;
  else if (pkb_data0_wen)
     pkb_data[127:0] <= pkb_bus[PKB_DATA_127:PKB_DATA_0];
end

always@(posedge pkb_data1_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
     pkb_data[255:128] <= 128'b0;
  else if (pkb_data1_wen)
     pkb_data[255:128] <= pkb_bus[PKB_DATA_127:PKB_DATA_0];
end

always@(posedge pkb_data2_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
     pkb_data[383:256] <= 128'b0;
  else if (pkb_data2_wen)
     pkb_data[383:256] <= pkb_bus[PKB_DATA_127:PKB_DATA_0];
end

always@(posedge pkb_data3_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
     pkb_data[511:384] <= 128'b0;
  else if (pkb_data3_wen) 
     pkb_data[511:384] <= pkb_bus[PKB_DATA_127:PKB_DATA_0];
end

parameter WCD_WIDTH = 535;

assign pkb_req          = pkb_vld && pkb_rdy;
assign pkb_bmb_wcd_req  = pkb_req && pkb_xid[3];
assign piu_ncq_wcd_req  = pkb_req && pkb_xid[2];
assign piu_snb1_wcd_req = pkb_req && pkb_xid[1];
assign piu_snb0_wcd_req = pkb_req && pkb_xid[0];

assign piu_xx_wcd_bus[WCD_WIDTH-1:0] = {pkb_err,
                                        pkb_cd_sel,
                                        pkb_sid[4:0],
                                        pkb_wstrb[15:0], 
                                        pkb_data[511:0]};

assign ncq_wdata[127:0] = pkb_addr_5_4[1]  
                        ? (pkb_addr_5_4[0] ? pkb_data[511:384] : pkb_data[383:256])
                        : (pkb_addr_5_4[0] ? pkb_data[255:128] : pkb_data[127:0]);

assign piu_ncq_wcd_bus[143:0] = {pkb_wstrb[15:0], ncq_wdata[127:0]};

//================================================
//            barrier merging buffer
//================================================
parameter BAR_IDLE    = 3'b000;
parameter BAR_REQ     = 3'b001;
parameter BAR_WAIT    = 3'b010;
parameter W_BAR_CMPLT = 3'b100;
parameter BAR_RESP    = 3'b110;

assign bar_ctrl_clk_en = bar_vld | !(bar_cur_state == BAR_IDLE);

// &Instance("gated_clk_cell", "x_bar_ctrl_gated_clk"); @1148
gated_clk_cell  x_bar_ctrl_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (bar_ctrl_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (bar_ctrl_clk_en   ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @1149
//          .external_en (1'b0), @1150
//          .global_en   (1'b1), @1151
//          .module_en (ciu_icg_en       ), @1152
//          .local_en    (bar_ctrl_clk_en), @1153
//          .clk_out     (bar_ctrl_clk)); @1154

assign bar_dp_clk_en = rd_bar_vld;

// &Instance("gated_clk_cell", "x_bar_dp_gated_clk"); @1158
gated_clk_cell  x_bar_dp_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (bar_dp_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (bar_dp_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @1159
//          .external_en (1'b0), @1160
//          .global_en   (1'b1), @1161
//          .module_en (ciu_icg_en       ), @1162
//          .local_en    (bar_dp_clk_en), @1163
//          .clk_out     (bar_dp_clk)); @1164

assign rd_bar_vld  = ar_dfifo_bmb_req;
assign wt_bar_vld  = aw_dfifo_bmb_req;

assign bar_vld     = rd_bar_vld || wt_bar_vld;
assign two_bar_vld = rd_bar_vld && wt_bar_vld;
assign one_bar_vld = rd_bar_vld ^  wt_bar_vld;

assign bmb_ar_dfifo_grant = rd_bar_vld;
assign bmb_aw_dfifo_grant = wt_bar_vld;
assign bmb_pkb_wcd_grant  = pkb_bmb_wcd_req;

always@(posedge bar_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bar_cur_state[2:0] <= BAR_IDLE;
  else
    bar_cur_state[2:0] <= bar_next_state[2:0];
end

// &CombBeg; @1185
always @( two_bar_vld
       or ciu_chr2_bar_dis
       or bar_domain[0]
       or ebiu_piu_no_op
       or bar_cmplt_vld
       or bar_cur_state
       or bar_resp_grant_vld
       or bar_grant_vld
       or one_bar_vld)
begin
  bar_next_state = BAR_IDLE;
  case(bar_cur_state)
  BAR_IDLE: begin
    if (two_bar_vld) 
      bar_next_state = BAR_REQ;
    else if (one_bar_vld)
      bar_next_state = BAR_WAIT;
    else
      bar_next_state = BAR_IDLE;
  end
  BAR_WAIT: begin
    if (one_bar_vld) 
      bar_next_state = BAR_REQ;
    else
      bar_next_state = BAR_WAIT;
  end
  BAR_REQ: begin
    if (bar_grant_vld) 
      bar_next_state = W_BAR_CMPLT;
    else
      bar_next_state = BAR_REQ;
  end
  W_BAR_CMPLT: begin
    if (bar_cmplt_vld & (ciu_chr2_bar_dis & !bar_domain[0] | ebiu_piu_no_op))
      bar_next_state = BAR_RESP;
    else
      bar_next_state = W_BAR_CMPLT;
  end
  BAR_RESP: begin
    if (bar_resp_grant_vld)
      bar_next_state = BAR_IDLE; //W_BAR_ACK;
    else
      bar_next_state = BAR_RESP;
  end
  default: bar_next_state = BAR_IDLE;
  endcase
// &CombEnd; @1222
end


// bar request to sub module
parameter B    = 0;
parameter R    = 1;

assign bar_req_vld  = bar_cur_state[0] && bar_wd_recevied; //BAR_REQ
assign bar_resp_vld = (bar_cur_state == BAR_RESP);

assign piu_bmbif_snb0_req = bar_req_vld && !bar_grant[SNB0];
assign piu_bmbif_snb1_req = bar_req_vld && !bar_grant[SNB1];
assign piu_bmbif_ncq_req  = bar_req_vld && !bar_grant[NCQ] ;
assign piu_bmbif_ctcq_req = bar_req_vld && !bar_grant[CTCQ];
assign piu_bmbif_req_bus[8:0] = {bar_type[1:0],
                                 bar_id[4:0],
                                 bar_domain[1:0]};
assign bmb_rvalid  = bar_resp_vld && !bar_resp_grant[R];
assign bmb_bvalid  = bar_resp_vld && !bar_resp_grant[B];

assign bar_addr_5_4[1:0]     = 2'b0;
assign bar_sid[6:0]          = 7'b1000000; // sid[6:5] == 10 for bar\ctc\ncq; 0? for sab;
assign bar_rid[4:0]          = bar_id[4:0];
assign bar_rresp[6:0]        = 7'b0;
assign bar_rdata[511:0]      = 512'b0;
assign bar_bid[4:0]          = bar_id[4:0];
assign bar_bresp[1:0]        = 2'b0;

assign bmb_upkb_rvalid       = bmb_rvalid;
assign bmb_b_dfifo_bvalid    = bmb_bvalid;

parameter UPKB_WIDTH = 535;
parameter B_WIDTH    = 14;

assign bmb_upkb_rbus[UPKB_WIDTH-1:0] = {2'b00,  // len
                                        bar_addr_5_4[1:0],
                                        bar_sid[6:0], bar_rid[4:0],
                                        bar_rresp[6:0], bar_rdata[511:0]};

assign bmb_b_dfifo_bbus[B_WIDTH-1:0] = {bar_sid[6:0],
                                        bar_bid[4:0], bar_bresp[1:0]};

//================================================
//                bmb content
//================================================
//bar grant
assign bar_grant_bus[3:0] = {bmbif_piu_ctcq_grant,
                             bmbif_piu_ncq_grant,
                             bmbif_piu_snb1_grant,
                             bmbif_piu_snb0_grant};

always@(posedge bar_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bar_grant[3:0] <= 4'b0;
  else if (bar_vld)
    bar_grant[3:0] <= 4'b0;
  else if (|bar_grant_bus[3:0])
    bar_grant[3:0] <= bar_grant[3:0] | bar_grant_bus[3:0];
  else
    bar_grant[3:0] <= bar_grant[3:0];
end

assign bar_grant_vld = &(bar_grant[3:0] | bar_grant_bus[3:0]);

//bar_cmplt
assign bar_cmplt_bus[3:0] = {ctcq_piu_bar_cmplt,
                             ncq_piu_bar_cmplt,
                             snb1_piu_bar_cmplt,
                             snb0_piu_bar_cmplt};

always@(posedge bar_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bar_cmplt[3:0] <= 4'b0;
  else if (bar_vld)
    bar_cmplt[3:0] <= 4'b0;
  else if (|bar_cmplt_bus[3:0])
    bar_cmplt[3:0] <= bar_cmplt[3:0] | bar_cmplt_bus[3:0];
  else
    bar_cmplt[3:0] <= bar_cmplt[3:0];
end

assign bar_cmplt_vld = &(bar_cmplt[3:0] | bar_cmplt_bus[3:0]);

// bar wdata is gotten
always@(posedge bar_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bar_wd_recevied <= 1'b0;
  else if (wt_bar_vld)
    bar_wd_recevied <= 1'b0;
  else if (pkb_bmb_wcd_req)
    bar_wd_recevied <= 1'b1;
  else
    bar_wd_recevied <= bar_wd_recevied;
end

//bar_resp_grant
assign bar_resp_grant_bus[1:0] = {upkb_bmb_grant, b_dfifo_bmb_grant};

always@(posedge bar_ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bar_resp_grant[1:0] <= 2'b0;
  else if (bar_vld)
    bar_resp_grant[1:0] <= 2'b0;
  else if (|bar_resp_grant_bus[1:0])
    bar_resp_grant[1:0] <= bar_resp_grant[1:0] | bar_resp_grant_bus[1:0];
  else
    bar_resp_grant[1:0] <= bar_resp_grant[1:0];
end

assign bar_resp_grant_vld = &(bar_resp_grant[1:0] | bar_resp_grant_bus[1:0]);

//bar id
always@(posedge bar_dp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    bar_id[4:0]     <= 5'b0; 
    bar_domain[1:0] <= 2'b0; 
    bar_type[1:0]   <= 2'b0;
  end
  else if (rd_bar_vld) begin
    bar_id[4:0]     <= ar_req_rid[4:0];
    bar_domain[1:0] <= ar_req_domain[1:0];
    bar_type[1:0]   <= ar_req_bar_type[1:0];
  end
end

//================================================
//            unpackage buffer
//================================================
//valid +addr_5_4[1:0] + sid[3:0] + rid[4:0] + rresp[3:0] + rdata[511:0]
parameter UPKB_DATA_0      = 0;
parameter UPKB_DATA_127    = 127;
parameter UPKB_DATA_128    = 128;
parameter UPKB_DATA_255    = 255;
parameter UPKB_DATA_256    = 256;
parameter UPKB_DATA_383    = 383;
parameter UPKB_DATA_384    = 384;
parameter UPKB_DATA_511    = 511;
parameter UPKB_RRESP_0     = 512;
parameter UPKB_RRESP_6     = 518;
parameter UPKB_RID_0       = 519;
parameter UPKB_RID_4       = 523;
parameter UPKB_SID_0       = 524;
parameter UPKB_SID_4       = 528;
parameter UPKB_SID_5       = 529;
parameter UPKB_SID_6       = 530;
parameter UPKB_ADDR_4      = 531;
parameter UPKB_ADDR_5      = 532;
parameter UPKB_LEN_0       = 533;
parameter UPKB_LEN_1       = 534;

// &Force("nonport", "upkb_sel"); @1378

assign upkb_clk_en = upkb_create_en | upkb_pop_en | upkb_cnt_en;
                     
// &Instance("gated_clk_cell", "x_upkb_gated_clk"); @1382
gated_clk_cell  x_upkb_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (upkb_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (upkb_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @1383
//          .external_en (1'b0), @1384
//          .global_en   (1'b1), @1385
//          .module_en (ciu_icg_en       ), @1386
//          .local_en    (upkb_clk_en), @1387
//          .clk_out     (upkb_clk)); @1388

// &Force("nonport", "upkb_prio_clk"); @1390
assign upkb_prio_clk_en = upkb_idle & (|upkb_sel[4:0]);

// &Instance("gated_clk_cell", "x_upkb_prio_gated_clk"); @1393
gated_clk_cell  x_upkb_prio_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (upkb_prio_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (upkb_prio_clk_en  ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @1394
//          .external_en (1'b0), @1395
//          .global_en   (1'b1), @1396
//          .module_en (ciu_icg_en       ), @1397
//          .local_en    (upkb_prio_clk_en), @1398
//          .clk_out     (upkb_prio_clk)); @1399

// &Instance("gated_clk_cell", "x_upkb_cont_gated_clk"); @1401
gated_clk_cell  x_upkb_cont_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (upkb_cont_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (upkb_create_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @1402
//          .external_en (1'b0), @1403
//          .global_en   (1'b1), @1404
//          .module_en (ciu_icg_en       ), @1405
//          .local_en    (upkb_create_en), @1406
//          .clk_out     (upkb_cont_clk)); @1407

assign upkb_valid[4:0] = {ctcq_piu_rvalid,
                          bmb_upkb_rvalid,
                          ncq_piu_rvalid,
                          snb1_piu_rvalid,
                          snb0_piu_rvalid};

ct_prio #(.NUM(5)) x_ct_piu_r_prio(
  .clk                 (upkb_prio_clk    ),
  .rst_b               (cpurst_b         ),
  .valid               (upkb_valid       ),
  .clr                 (upkb_idle        ),
  .sel                 (upkb_sel         )
);

assign upkb_create_bus[UPKB_WIDTH-1:0] =
       {(UPKB_WIDTH){upkb_sel[4]}} & ctcq_piux_rbus[UPKB_WIDTH-1:0] |
       {(UPKB_WIDTH){upkb_sel[3]}} & bmb_upkb_rbus[UPKB_WIDTH-1:0] |
       {(UPKB_WIDTH){upkb_sel[2]}} & ncq_piux_rbus[UPKB_WIDTH-1:0]  |
       {(UPKB_WIDTH){upkb_sel[1]}} & snb1_piux_rbus[UPKB_WIDTH-1:0] |
       {(UPKB_WIDTH){upkb_sel[0]}} & snb0_piux_rbus[UPKB_WIDTH-1:0];

assign upkb_create_en = |upkb_valid[4:0] && upkb_idle;
assign upkb_cnt_en    = upkb_vld & r_dfifo_upkb_grant;
assign upkb_pop_en    = upkb_vld && 
                        upkb_rlast && upkb_cnt_en;

assign upkb_idle = !upkb_vld || upkb_pop_en;

always@(posedge upkb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    upkb_vld <= 1'b0;
  else if (upkb_create_en)
    upkb_vld <= 1'b1;
  else if (upkb_pop_en)
    upkb_vld <= 1'b0;
end

always@(posedge upkb_cont_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    upkb_cont[UPKB_WIDTH-1:0] <= {UPKB_WIDTH{1'b0}};
  else if (upkb_create_en)
    upkb_cont[UPKB_WIDTH-1:0] <= upkb_create_bus[UPKB_WIDTH-1:0];
end

assign upkb_cnt_init[3:0]   = 4'b0001 << upkb_create_bus[UPKB_ADDR_5:UPKB_ADDR_4];
assign upkb_cnt_init_f[3:0] = 4'b0001 << upkb_cont[UPKB_ADDR_5:UPKB_ADDR_4];

always@(posedge upkb_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    upkb_cnt[3:0] <= 4'b0000;
  else if (upkb_create_en)
    upkb_cnt[3:0] <= upkb_cnt_init[3:0];
  else if (upkb_cnt_en)
    upkb_cnt[3:0] <= {upkb_cnt[2:0],upkb_cnt[3]};
end

assign upkb_cnt_last = {upkb_cnt[2:0],upkb_cnt[3]} == upkb_cnt_init_f[3:0];

//TODO RRESP_1
// &CombBeg; @1471
always @( upkb_cnt[3:0]
       or upkb_rresp_ori[4:1]
       or upkb_cont[511:0])
begin
  case(upkb_cnt[3:0])
    4'b0001:
    begin
      upkb_rresp_1  = upkb_rresp_ori[1];
      upkb_rdata[127:0] = upkb_cont[UPKB_DATA_127:UPKB_DATA_0];
    end
    4'b0010:
    begin
      upkb_rresp_1  = upkb_rresp_ori[2];
      upkb_rdata[127:0] = upkb_cont[UPKB_DATA_255:UPKB_DATA_128];
    end
    4'b0100:
    begin
      upkb_rresp_1  = upkb_rresp_ori[3];
      upkb_rdata[127:0] = upkb_cont[UPKB_DATA_383:UPKB_DATA_256];
    end
    4'b1000:
    begin
      upkb_rresp_1  = upkb_rresp_ori[4];
      upkb_rdata[127:0] = upkb_cont[UPKB_DATA_511:UPKB_DATA_384];
    end

    default:
    begin
      upkb_rresp_1  = 1'bx;
      upkb_rdata[127:0] = {128{1'bx}};
    end
  endcase
// &CombEnd; @1500
end

assign upkb_rfirst       = (upkb_cnt[3:0] == upkb_cnt_init_f[3:0]);
assign upkb_rlast        = (upkb_cont[UPKB_LEN_1:UPKB_LEN_0] == 2'b00) || 
                           (upkb_cont[UPKB_LEN_1:UPKB_LEN_0] == 2'b11) && upkb_cnt_last;
assign upkb_sid[6:0]     = upkb_cont[UPKB_SID_6:UPKB_SID_0];
assign upkb_rid[4:0]     = upkb_cont[UPKB_RID_4:UPKB_RID_0];
assign upkb_rresp_ori[6:0]= upkb_cont[UPKB_RRESP_6:UPKB_RRESP_0];
assign upkb_rresp[3:0]   = {upkb_rresp_ori[6:5],upkb_rresp_1,upkb_rresp_ori[0]};

parameter R_WIDTH = 146;

assign r_dfifo_req                     = upkb_vld;
assign r_dfifo_create_bus[R_WIDTH-1:0] = {upkb_rfirst,
                                          upkb_rlast, 
                                          upkb_sid[6:0],
                                          upkb_rid[4:0], 
                                          upkb_rresp[3:0], 
                                          upkb_rdata[127:0]};

assign upkb_bmb_grant   = upkb_idle && upkb_sel[3];
assign piu_ctcq_r_grant = upkb_idle && upkb_sel[4];
assign piu_ncq_r_grant  = upkb_idle && upkb_sel[2];
assign piu_snb1_r_grant = upkb_idle && upkb_sel[1];
assign piu_snb0_r_grant = upkb_idle && upkb_sel[0];

// r_dfifo grant upkb 
assign r_dfifo_upkb_grant = !r_dfifo_full & !rack_dfifo_full;

//================================================
//           R DFIFO 
//================================================
parameter R_DATA_0   = 0;
parameter R_DATA_127 = 127;
parameter R_RESP_0   = 128;
parameter R_RESP_3   = 131;
parameter R_RID_0    = 132;
parameter R_RID_4    = 136;
parameter R_SID_0    = 137;
parameter R_SID_4    = 141;
parameter R_SID_5    = 142;
parameter R_SID_6    = 143;
parameter R_LAST     = 144;
parameter R_FIRST    = 145;

// &Force("nonport", "r_dfifo_create_en"); @1545
// &Force("nonport", "r_dfifo_create_bus"); @1546
// &Force("nonport", "r_dfifo_empty"); @1547
// &Force("nonport", "r_dfifo_full"); @1548
// &Force("nonport", "r_dfifo_pop_bus"); @1549
// &Force("nonport", "r_dfifo_pop_bus_vld"); @1550
// &Force("nonport", "r_dfifo_pop_en"); @1551

assign r_dfifo_create_en = r_dfifo_req &&
                           !r_dfifo_full &&
                           !rack_dfifo_full;// &&
//                           !r_dfifo_bypass_en;

//assign r_dfifo_bypass_en = ibiu_ciu_rready && 
//                           !r_dfifo_pop_bus_vld;

assign r_dfifo_pop_en    = ibiu_ciu_rready &&
                           r_dfifo_pop_bus_vld;

ct_fifo #(.WIDTH(R_WIDTH), .DEPTH(2), .PTR_W(1)) x_ct_piu_r_dfifo(
  .clk                 (ciu_top_clk         ),
  .rst_b               (cpurst_b            ),
  .fifo_create_en      (r_dfifo_create_en   ),
  .fifo_create_en_dp   (r_dfifo_create_en   ),
  .fifo_pop_en         (r_dfifo_pop_en      ),
  .fifo_create_data    (r_dfifo_create_bus  ),
  .fifo_pop_data       (r_dfifo_pop_bus     ),
  .fifo_pop_data_vld   (r_dfifo_pop_bus_vld ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en         (ciu_icg_en),
  .fifo_full           (r_dfifo_full        ),
  .fifo_empty          (r_dfifo_empty       )
);

assign r_req_vld = r_dfifo_pop_bus_vld;
assign r_req_bus[R_WIDTH-1:0] = r_dfifo_pop_bus[R_WIDTH-1:0];

//assign r_req_vld = r_dfifo_req || r_dfifo_pop_bus_vld;
//assign r_req_bus[R_WIDTH-1:0] = r_dfifo_pop_bus_vld
//                              ? r_dfifo_pop_bus[R_WIDTH-1:0]
//                              : r_dfifo_create_bus[R_WIDTH-1:0];

assign ciu_ibiu_rvalid       = r_req_vld;
assign ciu_ibiu_rid[4:0]     = r_req_bus[R_RID_4:R_RID_0];
assign ciu_ibiu_rresp[3:0]   = r_req_bus[R_RESP_3:R_RESP_0];
assign ciu_ibiu_rlast        = r_req_bus[R_LAST];
assign ciu_ibiu_rdata[127:0] = r_req_bus[R_DATA_127:R_DATA_0];

//================================================
//     RACK FIFO
//================================================
parameter RACK_WIDTH = 7;

// &Force("nonport", "rack_dfifo_create_en"); @1598
// &Force("nonport", "rack_dfifo_create_bus"); @1599
// &Force("nonport", "rack_dfifo_empty"); @1600
// &Force("nonport", "rack_dfifo_full"); @1601
// &Force("nonport", "rack_dfifo_pop_bus"); @1602
// &Force("nonport", "rack_dfifo_pop_bus_vld"); @1603
// &Force("nonport", "rack_dfifo_pop_en"); @1604

always@(posedge ciu_top_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ibiu_ciu_rack_reg <= 1'b0;
  else
    ibiu_ciu_rack_reg <= ibiu_ciu_rack;
end

assign rack_dfifo_create_en =  r_dfifo_create_en
                            && upkb_rlast;

assign rack_dfifo_create_bus[RACK_WIDTH-1:0] = upkb_sid[6:0];

assign rack_dfifo_pop_en = ibiu_ciu_rack_reg;

ct_fifo #(.WIDTH(RACK_WIDTH), .DEPTH(8), .PTR_W(3)) x_ct_piu_rack_dfifo(
  .clk                 (ciu_top_clk            ),
  .rst_b               (cpurst_b               ),
  .fifo_create_en      (rack_dfifo_create_en   ),
  .fifo_create_en_dp   (rack_dfifo_create_en   ),
  .fifo_pop_en         (rack_dfifo_pop_en      ),
  .fifo_create_data    (rack_dfifo_create_bus  ),
  .fifo_pop_data       (rack_dfifo_pop_bus     ),
  .fifo_pop_data_vld   (rack_dfifo_pop_bus_vld ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en     ),
  .fifo_icg_en         (ciu_icg_en             ),
  .fifo_full           (rack_dfifo_full        ),
  .fifo_empty          (rack_dfifo_empty       )
);

assign piu_snb0_rack          = ibiu_ciu_rack_reg & rack_dfifo_pop_bus_vld & !rack_dfifo_pop_bus[6] & !rack_dfifo_pop_bus[5];
assign piu_snb1_rack          = ibiu_ciu_rack_reg & rack_dfifo_pop_bus_vld & !rack_dfifo_pop_bus[6] &  rack_dfifo_pop_bus[5];
assign piu_snbx_rack_sid[4:0] = rack_dfifo_pop_bus[4:0];

//================================================
//                 B response
//================================================
parameter B_RESP_0 = 0;
parameter B_RESP_1 = 1;
parameter B_BID_0  = 2;
parameter B_BID_4  = 6;
parameter B_SID_0  = 7;
parameter B_SID_4  = 11;
parameter B_SID_5  = 12;
parameter B_SID_6  = 13;

// &Force("nonport","b_prio_clk"); @1652
// &Force("nonport", "b_arb_sel"); @1653
// &Force("nonport", "b_dfifo_create_en"); @1654
// &Force("nonport", "b_dfifo_create_bus"); @1655
// &Force("nonport", "b_dfifo_empty"); @1656
// &Force("nonport", "b_dfifo_full"); @1657
// &Force("nonport", "b_dfifo_pop_bus"); @1658
// &Force("nonport", "b_dfifo_pop_bus_vld"); @1659
// &Force("nonport", "b_dfifo_pop_en"); @1660

assign b_prio_clk_en = b_arb_clr & (|b_arb_sel[3:0]);

// &Instance("gated_clk_cell", "x_b_prio_gated_clk"); @1664
gated_clk_cell  x_b_prio_gated_clk (
  .clk_in             (ciu_top_clk       ),
  .clk_out            (b_prio_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (b_prio_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (ciu_top_clk   ), @1665
//          .external_en (1'b0), @1666
//          .global_en   (1'b1), @1667
//          .module_en (ciu_icg_en       ), @1668
//          .local_en    (b_prio_clk_en), @1669
//          .clk_out     (b_prio_clk)); @1670

assign b_arb_valid[3:0] = {bmb_b_dfifo_bvalid,
                           ncq_piu_bvalid,
                           snb1_piu_bvalid,
                           snb0_piu_bvalid};

assign b_arb_clr = !b_dfifo_full;

ct_prio #(.NUM(4)) x_ct_piu_b_prio(
  .clk                 (b_prio_clk       ),
  .rst_b               (cpurst_b         ),
  .valid               (b_arb_valid      ),
  .clr                 (b_arb_clr        ),
  .sel                 (b_arb_sel        )
);

assign b_dfifo_create_bus[B_WIDTH-1:0] =
       {B_WIDTH{b_arb_sel[3]}} & bmb_b_dfifo_bbus[B_WIDTH-1:0] |
       {B_WIDTH{b_arb_sel[2]}} & ncq_piu_bbus[B_WIDTH-1:0] |
       {B_WIDTH{b_arb_sel[1]}} & snb1_piux_bbus[B_WIDTH-1:0]|
       {B_WIDTH{b_arb_sel[0]}} & snb0_piux_bbus[B_WIDTH-1:0];

assign b_dfifo_req       = |b_arb_valid[3:0];
assign b_dfifo_create_en = b_dfifo_req && !b_dfifo_full && !back_dfifo_full;// && !b_dfifo_bypass_en;
assign b_dfifo_pop_en    = ibiu_ciu_bready && b_dfifo_pop_bus_vld;
//assign b_dfifo_bypass_en = ibiu_ciu_bready && !b_dfifo_pop_bus_vld;

ct_fifo #(.WIDTH(B_WIDTH), .DEPTH(2), .PTR_W(1)) x_ct_piu_b_dfifo(
  .clk                   (ciu_top_clk           ),
  .rst_b                 (cpurst_b              ),
  .fifo_create_en        (b_dfifo_create_en     ),
  .fifo_create_en_dp     (b_dfifo_create_en     ),
  .fifo_pop_en           (b_dfifo_pop_en        ),
  .fifo_create_data      (b_dfifo_create_bus    ),
  .fifo_pop_data         (b_dfifo_pop_bus       ),
  .fifo_pop_data_vld     (b_dfifo_pop_bus_vld   ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en  ),
  .fifo_icg_en           (ciu_icg_en            ),
  .fifo_full             (b_dfifo_full          ),
  .fifo_empty            (b_dfifo_empty         )
);

assign b_req_vld              = b_dfifo_pop_bus_vld;
//                              || b_dfifo_req;

assign b_req_bus[B_WIDTH-1:0] = b_dfifo_pop_bus[B_WIDTH-1:0];
//b_dfifo_pop_bus_vld
//                              ? b_dfifo_pop_bus[B_WIDTH-1:0]
//                              : b_dfifo_create_bus[B_WIDTH-1:0];

assign ciu_ibiu_bvalid     = b_req_vld;
assign ciu_ibiu_bid[4:0]   = b_req_bus[B_BID_4:B_BID_0];
assign ciu_ibiu_bresp[1:0] = b_req_bus[B_RESP_1:B_RESP_0];

//================================================
//     BRCK FIFO
//================================================
parameter BACK_WIDTH = 7;

// &Force("nonport", "back_dfifo_create_en"); @1730
// &Force("nonport", "back_dfifo_create_bus"); @1731
// &Force("nonport", "back_dfifo_empty"); @1732
// &Force("nonport", "back_dfifo_full"); @1733
// &Force("nonport", "back_dfifo_pop_bus"); @1734
// &Force("nonport", "back_dfifo_pop_bus_vld"); @1735
// &Force("nonport", "back_dfifo_pop_en"); @1736

always@(posedge ciu_top_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ibiu_ciu_back_reg <= 1'b0;
  else
    ibiu_ciu_back_reg <= ibiu_ciu_back;
end

assign back_dfifo_create_en = b_dfifo_create_en;

assign back_dfifo_create_bus[BACK_WIDTH-1:0] = b_dfifo_create_bus[B_SID_6:B_SID_0];

assign back_dfifo_pop_en = ibiu_ciu_back_reg;

ct_fifo #(.WIDTH(BACK_WIDTH), .DEPTH(8), .PTR_W(3)) x_ct_piu_back_dfifo(
  .clk                 (ciu_top_clk            ),
  .rst_b               (cpurst_b               ),
  .fifo_create_en      (back_dfifo_create_en   ),
  .fifo_create_en_dp   (back_dfifo_create_en   ),
  .fifo_pop_en         (back_dfifo_pop_en      ),
  .fifo_create_data    (back_dfifo_create_bus  ),
  .fifo_pop_data       (back_dfifo_pop_bus     ),
  .fifo_pop_data_vld   (back_dfifo_pop_bus_vld ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en     ),
  .fifo_icg_en         (ciu_icg_en             ),
  .fifo_full           (back_dfifo_full        ),
  .fifo_empty          (back_dfifo_empty       )
);

assign piu_snb0_back          = ibiu_ciu_back_reg & back_dfifo_pop_bus_vld & !back_dfifo_pop_bus[6] & !back_dfifo_pop_bus[5];
assign piu_snb1_back          = ibiu_ciu_back_reg & back_dfifo_pop_bus_vld & !back_dfifo_pop_bus[6] &  back_dfifo_pop_bus[5];
assign piu_snbx_back_sid[4:0] = back_dfifo_pop_bus[4:0];   

assign b_dfifo_grant     = !b_dfifo_full && !back_dfifo_full;
assign b_dfifo_bmb_grant = b_dfifo_grant && b_arb_sel[3];
assign piu_ncq_b_grant   = b_dfifo_grant && b_arb_sel[2];
assign piu_snb1_b_grant  = b_dfifo_grant && b_arb_sel[1];
assign piu_snb0_b_grant  = b_dfifo_grant && b_arb_sel[0];

//==========================================================
//  low power signal and wakeup
//==========================================================
// &Force("output","piu_xx_no_op"); @1780

assign piu_xx_no_op = ar_dfifo_empty && aw_dfifo_empty && wd_sid_fifo_empty && (bar_cur_state == BAR_IDLE) && b_dfifo_empty && r_dfifo_empty && !upkb_vld && back_dfifo_empty && rack_dfifo_empty;

//==========================================================
//        for HAD debug information
//==========================================================
assign piu_dbg_info[9:0]  = {ar_dfifo_full,aw_dfifo_full,
                              ac_dfifo_full,cr_dfifo_full,
                              r_dfifo_full, 1'b0,
                              piu_xx_no_op,bar_cur_state[2:0]};

// &Force("bus", "ciu_xx_tee_mode",3,0); @1796
// &Force("nonport","piu_sec"); @1797
// &Force("nonport","ciu_ibiu_ac_sec"); @1798
// &ModuleEnd; @1815
endmodule



