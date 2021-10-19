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
module ct_ebiu_top(
  ciu_icg_en,
  ciu_so_ostd_dis,
  ciu_top_clk,
  clk_en,
  cpurst_b,
  ctcq_ebiu_araddr,
  ctcq_ebiu_arbar,
  ctcq_ebiu_arburst,
  ctcq_ebiu_arcache,
  ctcq_ebiu_ardomain,
  ctcq_ebiu_arid,
  ctcq_ebiu_arlen,
  ctcq_ebiu_arlock,
  ctcq_ebiu_arprot,
  ctcq_ebiu_arsize,
  ctcq_ebiu_arsnoop,
  ctcq_ebiu_arvalid,
  ctcq_ebiu_r_grant,
  ebiu_ctcq_ar_grant,
  ebiu_ctcq_rid,
  ebiu_ctcq_rvalid,
  ebiu_ebiuif_acaddr,
  ebiu_ebiuif_acid,
  ebiu_ebiuif_acprot,
  ebiu_ebiuif_acsnoop,
  ebiu_ebiuif_acvalid,
  ebiu_ebiuif_ar_grant,
  ebiu_ebiuif_ar_grant_gate,
  ebiu_ebiuif_cd_grant,
  ebiu_ebiuif_cr_grant,
  ebiu_ebiuif_entry_sel,
  ebiu_ebiuif_rdata,
  ebiu_ebiuif_rlast,
  ebiu_ebiuif_rresp,
  ebiu_ebiuif_snb0_rvalid,
  ebiu_ebiuif_snb1_rvalid,
  ebiu_ncq_ar_grant,
  ebiu_ncq_ar_grant_gate,
  ebiu_ncq_aw_grant,
  ebiu_ncq_aw_grant_gated,
  ebiu_ncq_bid,
  ebiu_ncq_bresp,
  ebiu_ncq_bvalid,
  ebiu_ncq_rdata,
  ebiu_ncq_rid,
  ebiu_ncq_rlast,
  ebiu_ncq_rresp,
  ebiu_ncq_rvalid,
  ebiu_ncq_w_grant,
  ebiu_pad_araddr,
  ebiu_pad_arburst,
  ebiu_pad_arcache,
  ebiu_pad_arid,
  ebiu_pad_arlen,
  ebiu_pad_arlock,
  ebiu_pad_arprot,
  ebiu_pad_arsize,
  ebiu_pad_arvalid,
  ebiu_pad_awaddr,
  ebiu_pad_awburst,
  ebiu_pad_awcache,
  ebiu_pad_awid,
  ebiu_pad_awlen,
  ebiu_pad_awlock,
  ebiu_pad_awprot,
  ebiu_pad_awsize,
  ebiu_pad_awvalid,
  ebiu_pad_back,
  ebiu_pad_bready,
  ebiu_pad_cactive,
  ebiu_pad_csysack,
  ebiu_pad_rack,
  ebiu_pad_rready,
  ebiu_pad_wdata,
  ebiu_pad_wlast,
  ebiu_pad_wstrb,
  ebiu_pad_wvalid,
  ebiu_piu0_no_op,
  ebiu_piu1_no_op,
  ebiu_piu2_no_op,
  ebiu_piu3_no_op,
  ebiu_vb_aw_grant,
  ebiu_vb_aw_grant_gated,
  ebiu_vb_bid,
  ebiu_vb_bresp,
  ebiu_vb_bvalid,
  ebiu_vb_w_grant,
  ebiu_xx_no_op,
  ebiuif_ebiu_ac_grant,
  ebiuif_ebiu_araddr,
  ebiuif_ebiu_arbar,
  ebiuif_ebiu_arburst,
  ebiuif_ebiu_arcache,
  ebiuif_ebiu_ardomain,
  ebiuif_ebiu_arid,
  ebiuif_ebiu_arlen,
  ebiuif_ebiu_arlock,
  ebiuif_ebiu_arprot,
  ebiuif_ebiu_arsize,
  ebiuif_ebiu_arsnoop,
  ebiuif_ebiu_arvalid,
  ebiuif_ebiu_cddata,
  ebiuif_ebiu_cdlast,
  ebiuif_ebiu_cdvalid,
  ebiuif_ebiu_crresp,
  ebiuif_ebiu_crvalid,
  ebiuif_ebiu_r_grant,
  ncq_ebiu_arvalid,
  ncq_ebiu_awvalid,
  ncq_ebiu_b_grant,
  ncq_ebiu_r_grant,
  ncq_ebiu_wvalid,
  ncq_xx_araddr,
  ncq_xx_arbar,
  ncq_xx_arburst,
  ncq_xx_arcache,
  ncq_xx_ardomain,
  ncq_xx_arid,
  ncq_xx_arlen,
  ncq_xx_arlock,
  ncq_xx_arprot,
  ncq_xx_arsize,
  ncq_xx_arsnoop,
  ncq_xx_aw_needissue,
  ncq_xx_awaddr,
  ncq_xx_awbar,
  ncq_xx_awburst,
  ncq_xx_awcache,
  ncq_xx_awdomain,
  ncq_xx_awid,
  ncq_xx_awlen,
  ncq_xx_awlock,
  ncq_xx_awprot,
  ncq_xx_awsize,
  ncq_xx_awsnoop,
  ncq_xx_wdata,
  ncq_xx_wid,
  ncq_xx_wlast,
  ncq_xx_wstrb,
  pad_ebiu_arready,
  pad_ebiu_awready,
  pad_ebiu_bid,
  pad_ebiu_bresp,
  pad_ebiu_bvalid,
  pad_ebiu_csysreq,
  pad_ebiu_rdata,
  pad_ebiu_rid,
  pad_ebiu_rlast,
  pad_ebiu_rresp,
  pad_ebiu_rvalid,
  pad_ebiu_wready,
  pad_yy_icg_scan_en,
  snb0_snpext_depd_ebiu,
  snb0_yy_snpext_index,
  snb1_snpext_depd_ebiu,
  snb1_yy_snpext_index,
  vb_ebiu_awaddr,
  vb_ebiu_awbar,
  vb_ebiu_awburst,
  vb_ebiu_awcache,
  vb_ebiu_awdomain,
  vb_ebiu_awid,
  vb_ebiu_awlen,
  vb_ebiu_awlock,
  vb_ebiu_awprot,
  vb_ebiu_awsize,
  vb_ebiu_awsnoop,
  vb_ebiu_awvalid,
  vb_ebiu_b_grant,
  vb_ebiu_mid,
  vb_ebiu_wdata,
  vb_ebiu_wid,
  vb_ebiu_wlast,
  vb_ebiu_wstrb,
  vb_ebiu_wvalid
);

// &Ports; @19
input            ciu_icg_en;               
input            ciu_so_ostd_dis;          
input            ciu_top_clk;              
input            clk_en;                   
input            cpurst_b;                 
input   [39 :0]  ctcq_ebiu_araddr;         
input   [1  :0]  ctcq_ebiu_arbar;          
input   [1  :0]  ctcq_ebiu_arburst;        
input   [3  :0]  ctcq_ebiu_arcache;        
input   [1  :0]  ctcq_ebiu_ardomain;       
input   [5  :0]  ctcq_ebiu_arid;           
input   [7  :0]  ctcq_ebiu_arlen;          
input            ctcq_ebiu_arlock;         
input   [2  :0]  ctcq_ebiu_arprot;         
input   [2  :0]  ctcq_ebiu_arsize;         
input   [3  :0]  ctcq_ebiu_arsnoop;        
input            ctcq_ebiu_arvalid;        
input            ctcq_ebiu_r_grant;        
input            ebiuif_ebiu_ac_grant;     
input   [39 :0]  ebiuif_ebiu_araddr;       
input   [1  :0]  ebiuif_ebiu_arbar;        
input   [1  :0]  ebiuif_ebiu_arburst;      
input   [3  :0]  ebiuif_ebiu_arcache;      
input   [1  :0]  ebiuif_ebiu_ardomain;     
input   [5  :0]  ebiuif_ebiu_arid;         
input   [7  :0]  ebiuif_ebiu_arlen;        
input            ebiuif_ebiu_arlock;       
input   [2  :0]  ebiuif_ebiu_arprot;       
input   [2  :0]  ebiuif_ebiu_arsize;       
input   [3  :0]  ebiuif_ebiu_arsnoop;      
input            ebiuif_ebiu_arvalid;      
input   [127:0]  ebiuif_ebiu_cddata;       
input            ebiuif_ebiu_cdlast;       
input            ebiuif_ebiu_cdvalid;      
input   [4  :0]  ebiuif_ebiu_crresp;       
input            ebiuif_ebiu_crvalid;      
input            ebiuif_ebiu_r_grant;      
input            ncq_ebiu_arvalid;         
input            ncq_ebiu_awvalid;         
input            ncq_ebiu_b_grant;         
input            ncq_ebiu_r_grant;         
input            ncq_ebiu_wvalid;          
input   [39 :0]  ncq_xx_araddr;            
input   [1  :0]  ncq_xx_arbar;             
input   [1  :0]  ncq_xx_arburst;           
input   [3  :0]  ncq_xx_arcache;           
input   [1  :0]  ncq_xx_ardomain;          
input   [7  :0]  ncq_xx_arid;              
input   [7  :0]  ncq_xx_arlen;             
input            ncq_xx_arlock;            
input   [2  :0]  ncq_xx_arprot;            
input   [2  :0]  ncq_xx_arsize;            
input   [3  :0]  ncq_xx_arsnoop;           
input            ncq_xx_aw_needissue;      
input   [39 :0]  ncq_xx_awaddr;            
input   [1  :0]  ncq_xx_awbar;             
input   [1  :0]  ncq_xx_awburst;           
input   [3  :0]  ncq_xx_awcache;           
input   [1  :0]  ncq_xx_awdomain;          
input   [7  :0]  ncq_xx_awid;              
input   [7  :0]  ncq_xx_awlen;             
input            ncq_xx_awlock;            
input   [2  :0]  ncq_xx_awprot;            
input   [2  :0]  ncq_xx_awsize;            
input   [2  :0]  ncq_xx_awsnoop;           
input   [127:0]  ncq_xx_wdata;             
input   [7  :0]  ncq_xx_wid;               
input            ncq_xx_wlast;             
input   [15 :0]  ncq_xx_wstrb;             
input            pad_ebiu_arready;         
input            pad_ebiu_awready;         
input   [7  :0]  pad_ebiu_bid;             
input   [1  :0]  pad_ebiu_bresp;           
input            pad_ebiu_bvalid;          
input            pad_ebiu_csysreq;         
input   [127:0]  pad_ebiu_rdata;           
input   [7  :0]  pad_ebiu_rid;             
input            pad_ebiu_rlast;           
input   [1  :0]  pad_ebiu_rresp;           
input            pad_ebiu_rvalid;          
input            pad_ebiu_wready;          
input            pad_yy_icg_scan_en;       
input   [7  :0]  snb0_yy_snpext_index;     
input   [7  :0]  snb1_yy_snpext_index;     
input   [39 :0]  vb_ebiu_awaddr;           
input   [1  :0]  vb_ebiu_awbar;            
input   [1  :0]  vb_ebiu_awburst;          
input   [3  :0]  vb_ebiu_awcache;          
input   [1  :0]  vb_ebiu_awdomain;         
input   [5  :0]  vb_ebiu_awid;             
input   [7  :0]  vb_ebiu_awlen;            
input            vb_ebiu_awlock;           
input   [2  :0]  vb_ebiu_awprot;           
input   [2  :0]  vb_ebiu_awsize;           
input   [2  :0]  vb_ebiu_awsnoop;          
input            vb_ebiu_awvalid;          
input            vb_ebiu_b_grant;          
input   [2  :0]  vb_ebiu_mid;              
input   [127:0]  vb_ebiu_wdata;            
input   [5  :0]  vb_ebiu_wid;              
input            vb_ebiu_wlast;            
input   [15 :0]  vb_ebiu_wstrb;            
input            vb_ebiu_wvalid;           
output           ebiu_ctcq_ar_grant;       
output  [5  :0]  ebiu_ctcq_rid;            
output           ebiu_ctcq_rvalid;         
output  [39 :0]  ebiu_ebiuif_acaddr;       
output  [4  :0]  ebiu_ebiuif_acid;         
output  [2  :0]  ebiu_ebiuif_acprot;       
output  [3  :0]  ebiu_ebiuif_acsnoop;      
output           ebiu_ebiuif_acvalid;      
output           ebiu_ebiuif_ar_grant;     
output           ebiu_ebiuif_ar_grant_gate; 
output           ebiu_ebiuif_cd_grant;     
output           ebiu_ebiuif_cr_grant;     
output  [23 :0]  ebiu_ebiuif_entry_sel;    
output  [127:0]  ebiu_ebiuif_rdata;        
output           ebiu_ebiuif_rlast;        
output  [3  :0]  ebiu_ebiuif_rresp;        
output           ebiu_ebiuif_snb0_rvalid;  
output           ebiu_ebiuif_snb1_rvalid;  
output           ebiu_ncq_ar_grant;        
output           ebiu_ncq_ar_grant_gate;   
output           ebiu_ncq_aw_grant;        
output           ebiu_ncq_aw_grant_gated;  
output  [7  :0]  ebiu_ncq_bid;             
output  [1  :0]  ebiu_ncq_bresp;           
output           ebiu_ncq_bvalid;          
output  [127:0]  ebiu_ncq_rdata;           
output  [7  :0]  ebiu_ncq_rid;             
output           ebiu_ncq_rlast;           
output  [1  :0]  ebiu_ncq_rresp;           
output           ebiu_ncq_rvalid;          
output           ebiu_ncq_w_grant;         
output  [39 :0]  ebiu_pad_araddr;          
output  [1  :0]  ebiu_pad_arburst;         
output  [3  :0]  ebiu_pad_arcache;         
output  [7  :0]  ebiu_pad_arid;            
output  [7  :0]  ebiu_pad_arlen;           
output           ebiu_pad_arlock;          
output  [2  :0]  ebiu_pad_arprot;          
output  [2  :0]  ebiu_pad_arsize;          
output           ebiu_pad_arvalid;         
output  [39 :0]  ebiu_pad_awaddr;          
output  [1  :0]  ebiu_pad_awburst;         
output  [3  :0]  ebiu_pad_awcache;         
output  [7  :0]  ebiu_pad_awid;            
output  [7  :0]  ebiu_pad_awlen;           
output           ebiu_pad_awlock;          
output  [2  :0]  ebiu_pad_awprot;          
output  [2  :0]  ebiu_pad_awsize;          
output           ebiu_pad_awvalid;         
output           ebiu_pad_back;            
output           ebiu_pad_bready;          
output           ebiu_pad_cactive;         
output           ebiu_pad_csysack;         
output           ebiu_pad_rack;            
output           ebiu_pad_rready;          
output  [127:0]  ebiu_pad_wdata;           
output           ebiu_pad_wlast;           
output  [15 :0]  ebiu_pad_wstrb;           
output           ebiu_pad_wvalid;          
output           ebiu_piu0_no_op;          
output           ebiu_piu1_no_op;          
output           ebiu_piu2_no_op;          
output           ebiu_piu3_no_op;          
output           ebiu_vb_aw_grant;         
output           ebiu_vb_aw_grant_gated;   
output  [4  :0]  ebiu_vb_bid;              
output  [1  :0]  ebiu_vb_bresp;            
output           ebiu_vb_bvalid;           
output           ebiu_vb_w_grant;          
output           ebiu_xx_no_op;            
output           snb0_snpext_depd_ebiu;    
output           snb1_snpext_depd_ebiu;    

// &Regs; @20

// &Wires; @21
wire    [31 :0]  ca_rd_addr_hit_cawt;      
wire             ciu_icg_en;               
wire             ciu_so_ostd_dis;          
wire             ciu_top_clk;              
wire             clk_en;                   
wire             cpurst_b;                 
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
wire    [39 :0]  ebiu_pad_araddr;          
wire    [1  :0]  ebiu_pad_arburst;         
wire    [3  :0]  ebiu_pad_arcache;         
wire    [7  :0]  ebiu_pad_arid;            
wire    [7  :0]  ebiu_pad_arlen;           
wire             ebiu_pad_arlock;          
wire    [2  :0]  ebiu_pad_arprot;          
wire    [2  :0]  ebiu_pad_arsize;          
wire             ebiu_pad_arvalid;         
wire    [39 :0]  ebiu_pad_awaddr;          
wire    [1  :0]  ebiu_pad_awburst;         
wire    [3  :0]  ebiu_pad_awcache;         
wire    [7  :0]  ebiu_pad_awid;            
wire    [7  :0]  ebiu_pad_awlen;           
wire             ebiu_pad_awlock;          
wire    [2  :0]  ebiu_pad_awprot;          
wire    [2  :0]  ebiu_pad_awsize;          
wire             ebiu_pad_awvalid;         
wire             ebiu_pad_back;            
wire             ebiu_pad_bready;          
wire             ebiu_pad_cactive;         
wire             ebiu_pad_csysack;         
wire             ebiu_pad_rack;            
wire             ebiu_pad_rready;          
wire    [127:0]  ebiu_pad_wdata;           
wire             ebiu_pad_wlast;           
wire    [15 :0]  ebiu_pad_wstrb;           
wire             ebiu_pad_wvalid;          
wire             ebiu_piu0_no_op;          
wire             ebiu_piu1_no_op;          
wire             ebiu_piu2_no_op;          
wire             ebiu_piu3_no_op;          
wire             ebiu_read_channel_no_op;  
wire             ebiu_snoop_channel_no_op; 
wire             ebiu_vb_aw_grant;         
wire             ebiu_vb_aw_grant_gated;   
wire    [4  :0]  ebiu_vb_bid;              
wire    [1  :0]  ebiu_vb_bresp;            
wire             ebiu_vb_bvalid;           
wire             ebiu_vb_w_grant;          
wire             ebiu_write_channel_no_op; 
wire             ebiu_xx_no_op;            
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
wire    [15 :0]  nc_wo_rd_depd_ncwt;       
wire             ncq_ebiu_arvalid;         
wire             ncq_ebiu_awvalid;         
wire             ncq_ebiu_b_grant;         
wire             ncq_ebiu_r_grant;         
wire             ncq_ebiu_wvalid;          
wire    [3  :0]  ncq_so_vld;               
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
wire    [127:0]  ncq_xx_wdata;             
wire    [7  :0]  ncq_xx_wid;               
wire             ncq_xx_wlast;             
wire    [15 :0]  ncq_xx_wstrb;             
wire             pad_ebiu_arready;         
wire             pad_ebiu_awready;         
wire    [7  :0]  pad_ebiu_bid;             
wire    [1  :0]  pad_ebiu_bresp;           
wire             pad_ebiu_bvalid;          
wire             pad_ebiu_csysreq;         
wire    [127:0]  pad_ebiu_rdata;           
wire    [7  :0]  pad_ebiu_rid;             
wire             pad_ebiu_rlast;           
wire    [1  :0]  pad_ebiu_rresp;           
wire             pad_ebiu_rvalid;          
wire             pad_ebiu_wready;          
wire             pad_yy_icg_scan_en;       
wire             snb0_snpext_depd_ebiu;    
wire    [7  :0]  snb0_yy_snpext_index;     
wire             snb1_snpext_depd_ebiu;    
wire    [7  :0]  snb1_yy_snpext_index;     
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


// &Instance("ct_ebiu_read_channel"); @23
ct_ebiu_read_channel  x_ct_ebiu_read_channel (
  .ca_rd_addr_hit_cawt       (ca_rd_addr_hit_cawt      ),
  .ciu_icg_en                (ciu_icg_en               ),
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
  .ebiu_ebiuif_ar_grant      (ebiu_ebiuif_ar_grant     ),
  .ebiu_ebiuif_ar_grant_gate (ebiu_ebiuif_ar_grant_gate),
  .ebiu_ebiuif_entry_sel     (ebiu_ebiuif_entry_sel    ),
  .ebiu_ebiuif_rdata         (ebiu_ebiuif_rdata        ),
  .ebiu_ebiuif_rlast         (ebiu_ebiuif_rlast        ),
  .ebiu_ebiuif_rresp         (ebiu_ebiuif_rresp        ),
  .ebiu_ebiuif_snb0_rvalid   (ebiu_ebiuif_snb0_rvalid  ),
  .ebiu_ebiuif_snb1_rvalid   (ebiu_ebiuif_snb1_rvalid  ),
  .ebiu_ncq_ar_grant         (ebiu_ncq_ar_grant        ),
  .ebiu_ncq_ar_grant_gate    (ebiu_ncq_ar_grant_gate   ),
  .ebiu_ncq_rdata            (ebiu_ncq_rdata           ),
  .ebiu_ncq_rid              (ebiu_ncq_rid             ),
  .ebiu_ncq_rlast            (ebiu_ncq_rlast           ),
  .ebiu_ncq_rresp            (ebiu_ncq_rresp           ),
  .ebiu_ncq_rvalid           (ebiu_ncq_rvalid          ),
  .ebiu_pad_araddr           (ebiu_pad_araddr          ),
  .ebiu_pad_arburst          (ebiu_pad_arburst         ),
  .ebiu_pad_arcache          (ebiu_pad_arcache         ),
  .ebiu_pad_arid             (ebiu_pad_arid            ),
  .ebiu_pad_arlen            (ebiu_pad_arlen           ),
  .ebiu_pad_arlock           (ebiu_pad_arlock          ),
  .ebiu_pad_arprot           (ebiu_pad_arprot          ),
  .ebiu_pad_arsize           (ebiu_pad_arsize          ),
  .ebiu_pad_arvalid          (ebiu_pad_arvalid         ),
  .ebiu_pad_rack             (ebiu_pad_rack            ),
  .ebiu_pad_rready           (ebiu_pad_rready          ),
  .ebiu_read_channel_no_op   (ebiu_read_channel_no_op  ),
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
  .ebiuif_ebiu_r_grant       (ebiuif_ebiu_r_grant      ),
  .forever_cpuclk            (ciu_top_clk              ),
  .nc_wo_rd_depd_ncwt        (nc_wo_rd_depd_ncwt       ),
  .ncq_ebiu_arvalid          (ncq_ebiu_arvalid         ),
  .ncq_ebiu_r_grant          (ncq_ebiu_r_grant         ),
  .ncq_so_vld                (ncq_so_vld               ),
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
  .pad_ebiu_arready          (pad_ebiu_arready         ),
  .pad_ebiu_rdata            (pad_ebiu_rdata           ),
  .pad_ebiu_rid              (pad_ebiu_rid             ),
  .pad_ebiu_rlast            (pad_ebiu_rlast           ),
  .pad_ebiu_rresp            (pad_ebiu_rresp           ),
  .pad_ebiu_rvalid           (pad_ebiu_rvalid          ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       )
);

// &Connect(.forever_cpuclk (ciu_top_clk)); @24
// &Instance("ct_ebiu_snoop_channel"); @26
// &Connect(.ciu_clk        (forever_cpuclk)); @27
// &Connect(.forever_cpuclk (ciu_top_clk)); @28
// &Instance("ct_ebiu_snoop_channel"); @31
// &Connect(.ciu_clk        (forever_cpuclk)); @32
// &Connect(.forever_cpuclk (ciu_top_clk)); @33
// &Instance("ct_ebiu_snoop_channel_dummy"); @35
ct_ebiu_snoop_channel_dummy  x_ct_ebiu_snoop_channel_dummy (
  .ebiu_ebiuif_acaddr       (ebiu_ebiuif_acaddr      ),
  .ebiu_ebiuif_acid         (ebiu_ebiuif_acid        ),
  .ebiu_ebiuif_acprot       (ebiu_ebiuif_acprot      ),
  .ebiu_ebiuif_acsnoop      (ebiu_ebiuif_acsnoop     ),
  .ebiu_ebiuif_acvalid      (ebiu_ebiuif_acvalid     ),
  .ebiu_ebiuif_cd_grant     (ebiu_ebiuif_cd_grant    ),
  .ebiu_ebiuif_cr_grant     (ebiu_ebiuif_cr_grant    ),
  .ebiu_snoop_channel_no_op (ebiu_snoop_channel_no_op),
  .ebiuif_ebiu_ac_grant     (ebiuif_ebiu_ac_grant    ),
  .ebiuif_ebiu_cddata       (ebiuif_ebiu_cddata      ),
  .ebiuif_ebiu_cdlast       (ebiuif_ebiu_cdlast      ),
  .ebiuif_ebiu_cdvalid      (ebiuif_ebiu_cdvalid     ),
  .ebiuif_ebiu_crresp       (ebiuif_ebiu_crresp      ),
  .ebiuif_ebiu_crvalid      (ebiuif_ebiu_crvalid     )
);

// &Instance("ct_ebiu_write_channel"); @38
ct_ebiu_write_channel  x_ct_ebiu_write_channel (
  .ca_rd_addr_hit_cawt      (ca_rd_addr_hit_cawt     ),
  .ciu_icg_en               (ciu_icg_en              ),
  .ciu_so_ostd_dis          (ciu_so_ostd_dis         ),
  .clk_en                   (clk_en                  ),
  .cpurst_b                 (cpurst_b                ),
  .ebiu_ncq_aw_grant        (ebiu_ncq_aw_grant       ),
  .ebiu_ncq_aw_grant_gated  (ebiu_ncq_aw_grant_gated ),
  .ebiu_ncq_bid             (ebiu_ncq_bid            ),
  .ebiu_ncq_bresp           (ebiu_ncq_bresp          ),
  .ebiu_ncq_bvalid          (ebiu_ncq_bvalid         ),
  .ebiu_ncq_w_grant         (ebiu_ncq_w_grant        ),
  .ebiu_pad_awaddr          (ebiu_pad_awaddr         ),
  .ebiu_pad_awburst         (ebiu_pad_awburst        ),
  .ebiu_pad_awcache         (ebiu_pad_awcache        ),
  .ebiu_pad_awid            (ebiu_pad_awid           ),
  .ebiu_pad_awlen           (ebiu_pad_awlen          ),
  .ebiu_pad_awlock          (ebiu_pad_awlock         ),
  .ebiu_pad_awprot          (ebiu_pad_awprot         ),
  .ebiu_pad_awsize          (ebiu_pad_awsize         ),
  .ebiu_pad_awvalid         (ebiu_pad_awvalid        ),
  .ebiu_pad_back            (ebiu_pad_back           ),
  .ebiu_pad_bready          (ebiu_pad_bready         ),
  .ebiu_pad_wdata           (ebiu_pad_wdata          ),
  .ebiu_pad_wlast           (ebiu_pad_wlast          ),
  .ebiu_pad_wstrb           (ebiu_pad_wstrb          ),
  .ebiu_pad_wvalid          (ebiu_pad_wvalid         ),
  .ebiu_piu0_no_op          (ebiu_piu0_no_op         ),
  .ebiu_piu1_no_op          (ebiu_piu1_no_op         ),
  .ebiu_piu2_no_op          (ebiu_piu2_no_op         ),
  .ebiu_piu3_no_op          (ebiu_piu3_no_op         ),
  .ebiu_vb_aw_grant         (ebiu_vb_aw_grant        ),
  .ebiu_vb_aw_grant_gated   (ebiu_vb_aw_grant_gated  ),
  .ebiu_vb_bid              (ebiu_vb_bid             ),
  .ebiu_vb_bresp            (ebiu_vb_bresp           ),
  .ebiu_vb_bvalid           (ebiu_vb_bvalid          ),
  .ebiu_vb_w_grant          (ebiu_vb_w_grant         ),
  .ebiu_write_channel_no_op (ebiu_write_channel_no_op),
  .ebiuif_ebiu_araddr       (ebiuif_ebiu_araddr      ),
  .forever_cpuclk           (ciu_top_clk             ),
  .nc_wo_rd_depd_ncwt       (nc_wo_rd_depd_ncwt      ),
  .ncq_ebiu_awvalid         (ncq_ebiu_awvalid        ),
  .ncq_ebiu_b_grant         (ncq_ebiu_b_grant        ),
  .ncq_ebiu_wvalid          (ncq_ebiu_wvalid         ),
  .ncq_so_vld               (ncq_so_vld              ),
  .ncq_xx_araddr            (ncq_xx_araddr           ),
  .ncq_xx_aw_needissue      (ncq_xx_aw_needissue     ),
  .ncq_xx_awaddr            (ncq_xx_awaddr           ),
  .ncq_xx_awbar             (ncq_xx_awbar            ),
  .ncq_xx_awburst           (ncq_xx_awburst          ),
  .ncq_xx_awcache           (ncq_xx_awcache          ),
  .ncq_xx_awdomain          (ncq_xx_awdomain         ),
  .ncq_xx_awid              (ncq_xx_awid             ),
  .ncq_xx_awlen             (ncq_xx_awlen            ),
  .ncq_xx_awlock            (ncq_xx_awlock           ),
  .ncq_xx_awprot            (ncq_xx_awprot           ),
  .ncq_xx_awsize            (ncq_xx_awsize           ),
  .ncq_xx_awsnoop           (ncq_xx_awsnoop          ),
  .ncq_xx_wdata             (ncq_xx_wdata            ),
  .ncq_xx_wid               (ncq_xx_wid              ),
  .ncq_xx_wlast             (ncq_xx_wlast            ),
  .ncq_xx_wstrb             (ncq_xx_wstrb            ),
  .pad_ebiu_awready         (pad_ebiu_awready        ),
  .pad_ebiu_bid             (pad_ebiu_bid            ),
  .pad_ebiu_bresp           (pad_ebiu_bresp          ),
  .pad_ebiu_bvalid          (pad_ebiu_bvalid         ),
  .pad_ebiu_wready          (pad_ebiu_wready         ),
  .pad_yy_icg_scan_en       (pad_yy_icg_scan_en      ),
  .snb0_snpext_depd_ebiu    (snb0_snpext_depd_ebiu   ),
  .snb0_yy_snpext_index     (snb0_yy_snpext_index    ),
  .snb1_snpext_depd_ebiu    (snb1_snpext_depd_ebiu   ),
  .snb1_yy_snpext_index     (snb1_yy_snpext_index    ),
  .vb_ebiu_awaddr           (vb_ebiu_awaddr          ),
  .vb_ebiu_awbar            (vb_ebiu_awbar           ),
  .vb_ebiu_awburst          (vb_ebiu_awburst         ),
  .vb_ebiu_awcache          (vb_ebiu_awcache         ),
  .vb_ebiu_awdomain         (vb_ebiu_awdomain        ),
  .vb_ebiu_awid             (vb_ebiu_awid            ),
  .vb_ebiu_awlen            (vb_ebiu_awlen           ),
  .vb_ebiu_awlock           (vb_ebiu_awlock          ),
  .vb_ebiu_awprot           (vb_ebiu_awprot          ),
  .vb_ebiu_awsize           (vb_ebiu_awsize          ),
  .vb_ebiu_awsnoop          (vb_ebiu_awsnoop         ),
  .vb_ebiu_awvalid          (vb_ebiu_awvalid         ),
  .vb_ebiu_b_grant          (vb_ebiu_b_grant         ),
  .vb_ebiu_mid              (vb_ebiu_mid             ),
  .vb_ebiu_wdata            (vb_ebiu_wdata           ),
  .vb_ebiu_wid              (vb_ebiu_wid             ),
  .vb_ebiu_wlast            (vb_ebiu_wlast           ),
  .vb_ebiu_wstrb            (vb_ebiu_wstrb           ),
  .vb_ebiu_wvalid           (vb_ebiu_wvalid          )
);

// &Connect(.forever_cpuclk (ciu_top_clk)); @39

// &Instance("ct_ebiu_lowpower"); @41
ct_ebiu_lowpower  x_ct_ebiu_lowpower (
  .clk_en                   (clk_en                  ),
  .cpurst_b                 (cpurst_b                ),
  .ebiu_pad_cactive         (ebiu_pad_cactive        ),
  .ebiu_pad_csysack         (ebiu_pad_csysack        ),
  .ebiu_read_channel_no_op  (ebiu_read_channel_no_op ),
  .ebiu_snoop_channel_no_op (ebiu_snoop_channel_no_op),
  .ebiu_write_channel_no_op (ebiu_write_channel_no_op),
  .ebiu_xx_no_op            (ebiu_xx_no_op           ),
  .forever_cpuclk           (ciu_top_clk             ),
  .pad_ebiu_csysreq         (pad_ebiu_csysreq        )
);

// &Connect(.forever_cpuclk (ciu_top_clk)); @42



// &ModuleEnd; @83
endmodule



