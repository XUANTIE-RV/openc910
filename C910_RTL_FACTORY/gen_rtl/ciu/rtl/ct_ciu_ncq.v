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

// &ModuleBeg; @24
module ct_ciu_ncq(
  apbif_ncq_ar_grant,
  apbif_ncq_aw_grant,
  apbif_ncq_bid,
  apbif_ncq_bresp,
  apbif_ncq_bvalid,
  apbif_ncq_rdata,
  apbif_ncq_rid,
  apbif_ncq_rlast,
  apbif_ncq_rresp,
  apbif_ncq_rvalid,
  apbif_ncq_w_grant,
  bmbif_ncq_bar_req,
  bmbif_ncq_mid,
  bmbif_ncq_req_bus,
  ciu_chr2_bar_dis,
  ciu_icg_en,
  ciu_so_ostd_dis,
  cpurst_b,
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
  forever_cpuclk,
  ncq_apbif_arvalid,
  ncq_apbif_awvalid,
  ncq_apbif_b_grant,
  ncq_apbif_r_grant,
  ncq_apbif_wvalid,
  ncq_bmbif_bar_grant,
  ncq_dbg_info,
  ncq_ebiu_arvalid,
  ncq_ebiu_awvalid,
  ncq_ebiu_b_grant,
  ncq_ebiu_r_grant,
  ncq_ebiu_wvalid,
  ncq_piu0_ar_grant,
  ncq_piu0_aw_grant,
  ncq_piu0_bar_cmplt,
  ncq_piu0_bbus,
  ncq_piu0_bvalid,
  ncq_piu0_rvalid,
  ncq_piu0_wcd_grant,
  ncq_piu1_ar_grant,
  ncq_piu1_aw_grant,
  ncq_piu1_bar_cmplt,
  ncq_piu1_bbus,
  ncq_piu1_bvalid,
  ncq_piu1_rvalid,
  ncq_piu1_wcd_grant,
  ncq_piu2_ar_grant,
  ncq_piu2_aw_grant,
  ncq_piu2_bar_cmplt,
  ncq_piu2_bbus,
  ncq_piu2_bvalid,
  ncq_piu2_rvalid,
  ncq_piu2_wcd_grant,
  ncq_piu3_ar_grant,
  ncq_piu3_aw_grant,
  ncq_piu3_bar_cmplt,
  ncq_piu3_bbus,
  ncq_piu3_bvalid,
  ncq_piu3_rvalid,
  ncq_piu3_wcd_grant,
  ncq_piux_rbus,
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
  ncq_xx_aruser,
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
  ncq_xx_awuser,
  ncq_xx_no_op,
  ncq_xx_wdata,
  ncq_xx_wid,
  ncq_xx_wlast,
  ncq_xx_wstrb,
  pad_yy_icg_scan_en,
  piu0_ncq_ar_bus,
  piu0_ncq_ar_req,
  piu0_ncq_aw_bus,
  piu0_ncq_aw_req,
  piu0_ncq_b_grant,
  piu0_ncq_r_grant,
  piu0_ncq_wcd_bus,
  piu0_ncq_wcd_req,
  piu1_ncq_ar_bus,
  piu1_ncq_ar_req,
  piu1_ncq_aw_bus,
  piu1_ncq_aw_req,
  piu1_ncq_b_grant,
  piu1_ncq_r_grant,
  piu1_ncq_wcd_bus,
  piu1_ncq_wcd_req,
  piu2_ncq_ar_bus,
  piu2_ncq_ar_req,
  piu2_ncq_aw_bus,
  piu2_ncq_aw_req,
  piu2_ncq_b_grant,
  piu2_ncq_r_grant,
  piu2_ncq_wcd_bus,
  piu2_ncq_wcd_req,
  piu3_ncq_ar_bus,
  piu3_ncq_ar_req,
  piu3_ncq_aw_bus,
  piu3_ncq_aw_req,
  piu3_ncq_b_grant,
  piu3_ncq_r_grant,
  piu3_ncq_wcd_bus,
  piu3_ncq_wcd_req,
  sysio_ciu_apb_base
);

// &Ports; @25
input            apbif_ncq_ar_grant;         
input            apbif_ncq_aw_grant;         
input   [7  :0]  apbif_ncq_bid;              
input   [1  :0]  apbif_ncq_bresp;            
input            apbif_ncq_bvalid;           
input   [127:0]  apbif_ncq_rdata;            
input   [7  :0]  apbif_ncq_rid;              
input            apbif_ncq_rlast;            
input   [1  :0]  apbif_ncq_rresp;            
input            apbif_ncq_rvalid;           
input            apbif_ncq_w_grant;          
input            bmbif_ncq_bar_req;          
input   [2  :0]  bmbif_ncq_mid;              
input   [8  :0]  bmbif_ncq_req_bus;          
input            ciu_chr2_bar_dis;           
input            ciu_icg_en;                 
input            ciu_so_ostd_dis;            
input            cpurst_b;                   
input            ebiu_ncq_ar_grant;          
input            ebiu_ncq_ar_grant_gate;     
input            ebiu_ncq_aw_grant;          
input            ebiu_ncq_aw_grant_gated;    
input   [7  :0]  ebiu_ncq_bid;               
input   [1  :0]  ebiu_ncq_bresp;             
input            ebiu_ncq_bvalid;            
input   [127:0]  ebiu_ncq_rdata;             
input   [7  :0]  ebiu_ncq_rid;               
input            ebiu_ncq_rlast;             
input   [1  :0]  ebiu_ncq_rresp;             
input            ebiu_ncq_rvalid;            
input            ebiu_ncq_w_grant;           
input            forever_cpuclk;             
input            pad_yy_icg_scan_en;         
input   [73 :0]  piu0_ncq_ar_bus;            
input            piu0_ncq_ar_req;            
input   [73 :0]  piu0_ncq_aw_bus;            
input            piu0_ncq_aw_req;            
input            piu0_ncq_b_grant;           
input            piu0_ncq_r_grant;           
input   [143:0]  piu0_ncq_wcd_bus;           
input            piu0_ncq_wcd_req;           
input   [73 :0]  piu1_ncq_ar_bus;            
input            piu1_ncq_ar_req;            
input   [73 :0]  piu1_ncq_aw_bus;            
input            piu1_ncq_aw_req;            
input            piu1_ncq_b_grant;           
input            piu1_ncq_r_grant;           
input   [143:0]  piu1_ncq_wcd_bus;           
input            piu1_ncq_wcd_req;           
input   [73 :0]  piu2_ncq_ar_bus;            
input            piu2_ncq_ar_req;            
input   [73 :0]  piu2_ncq_aw_bus;            
input            piu2_ncq_aw_req;            
input            piu2_ncq_b_grant;           
input            piu2_ncq_r_grant;           
input   [143:0]  piu2_ncq_wcd_bus;           
input            piu2_ncq_wcd_req;           
input   [73 :0]  piu3_ncq_ar_bus;            
input            piu3_ncq_ar_req;            
input   [73 :0]  piu3_ncq_aw_bus;            
input            piu3_ncq_aw_req;            
input            piu3_ncq_b_grant;           
input            piu3_ncq_r_grant;           
input   [143:0]  piu3_ncq_wcd_bus;           
input            piu3_ncq_wcd_req;           
input   [39 :0]  sysio_ciu_apb_base;         
output           ncq_apbif_arvalid;          
output           ncq_apbif_awvalid;          
output           ncq_apbif_b_grant;          
output           ncq_apbif_r_grant;          
output           ncq_apbif_wvalid;           
output           ncq_bmbif_bar_grant;        
output  [4  :0]  ncq_dbg_info;               
output           ncq_ebiu_arvalid;           
output           ncq_ebiu_awvalid;           
output           ncq_ebiu_b_grant;           
output           ncq_ebiu_r_grant;           
output           ncq_ebiu_wvalid;            
output           ncq_piu0_ar_grant;          
output           ncq_piu0_aw_grant;          
output           ncq_piu0_bar_cmplt;         
output  [13 :0]  ncq_piu0_bbus;              
output           ncq_piu0_bvalid;            
output           ncq_piu0_rvalid;            
output           ncq_piu0_wcd_grant;         
output           ncq_piu1_ar_grant;          
output           ncq_piu1_aw_grant;          
output           ncq_piu1_bar_cmplt;         
output  [13 :0]  ncq_piu1_bbus;              
output           ncq_piu1_bvalid;            
output           ncq_piu1_rvalid;            
output           ncq_piu1_wcd_grant;         
output           ncq_piu2_ar_grant;          
output           ncq_piu2_aw_grant;          
output           ncq_piu2_bar_cmplt;         
output  [13 :0]  ncq_piu2_bbus;              
output           ncq_piu2_bvalid;            
output           ncq_piu2_rvalid;            
output           ncq_piu2_wcd_grant;         
output           ncq_piu3_ar_grant;          
output           ncq_piu3_aw_grant;          
output           ncq_piu3_bar_cmplt;         
output  [13 :0]  ncq_piu3_bbus;              
output           ncq_piu3_bvalid;            
output           ncq_piu3_rvalid;            
output           ncq_piu3_wcd_grant;         
output  [534:0]  ncq_piux_rbus;              
output  [39 :0]  ncq_xx_araddr;              
output  [1  :0]  ncq_xx_arbar;               
output  [1  :0]  ncq_xx_arburst;             
output  [3  :0]  ncq_xx_arcache;             
output  [1  :0]  ncq_xx_ardomain;            
output  [7  :0]  ncq_xx_arid;                
output  [7  :0]  ncq_xx_arlen;               
output           ncq_xx_arlock;              
output  [2  :0]  ncq_xx_arprot;              
output  [2  :0]  ncq_xx_arsize;              
output  [3  :0]  ncq_xx_arsnoop;             
output           ncq_xx_aruser;              
output           ncq_xx_aw_needissue;        
output  [39 :0]  ncq_xx_awaddr;              
output  [1  :0]  ncq_xx_awbar;               
output  [1  :0]  ncq_xx_awburst;             
output  [3  :0]  ncq_xx_awcache;             
output  [1  :0]  ncq_xx_awdomain;            
output  [7  :0]  ncq_xx_awid;                
output  [7  :0]  ncq_xx_awlen;               
output           ncq_xx_awlock;              
output  [2  :0]  ncq_xx_awprot;              
output  [2  :0]  ncq_xx_awsize;              
output  [2  :0]  ncq_xx_awsnoop;             
output           ncq_xx_awuser;              
output           ncq_xx_no_op;               
output  [127:0]  ncq_xx_wdata;               
output  [7  :0]  ncq_xx_wid;                 
output           ncq_xx_wlast;               
output  [15 :0]  ncq_xx_wstrb;               

// &Regs; @26
reg     [15 :0]  dsq_apb;                    
reg     [3  :0]  dsq_create_ptr;             
reg     [3  :0]  dsq_pop_ptr;                
reg     [15 :0]  dsq_vld;                    
reg              ncq_ar_apbif_sel;           
reg     [4  :0]  ncq_ar_ebiu_ostd_cnt;       
reg              ncq_ar_ebiu_so_sel;         
reg     [4  :0]  ncq_ar_ostd_cnt_piu0;       
reg     [4  :0]  ncq_ar_ostd_cnt_piu1;       
reg              ncq_aw_apbif_sel;           
reg     [4  :0]  ncq_aw_ebiu_ostd_cnt;       
reg     [4  :0]  ncq_aw_ostd_cnt_piu0;       
reg     [4  :0]  ncq_aw_ostd_cnt_piu1;       
reg     [4  :0]  ncq_bar_ar_ostd_cnt_piu0;   
reg     [4  :0]  ncq_bar_ar_ostd_cnt_piu1;   
reg     [4  :0]  ncq_bar_aw_ostd_cnt_piu0;   
reg     [4  :0]  ncq_bar_aw_ostd_cnt_piu1;   
reg     [3  :0]  ncq_bar_sh;                 
reg     [3  :0]  ncq_bar_vld;                
reg     [4  :0]  ncq_total_ar_ostd_cnt;      
reg     [4  :0]  ncq_total_aw_ostd_cnt;      
reg     [73 :0]  raq_create_bus;             
reg     [73 :0]  waq_create_bus;             
reg     [151:0]  wdq_create_bus;             

// &Wires; @27
wire             apbif_ncq_ar_grant;         
wire             apbif_ncq_aw_grant;         
wire    [9  :0]  apbif_ncq_bbus;             
wire    [7  :0]  apbif_ncq_bid;              
wire    [1  :0]  apbif_ncq_bresp;            
wire             apbif_ncq_bvalid;           
wire    [137:0]  apbif_ncq_rbus;             
wire    [127:0]  apbif_ncq_rdata;            
wire    [7  :0]  apbif_ncq_rid;              
wire    [1  :0]  apbif_ncq_rresp;            
wire             apbif_ncq_rvalid;           
wire             apbif_ncq_w_grant;          
wire             ar_prio_clk;                
wire             ar_prio_clk_en;             
wire             aw_prio_clk;                
wire             aw_prio_clk_en;             
wire             bmbif_ncq_bar_req;          
wire    [2  :0]  bmbif_ncq_mid;              
wire    [8  :0]  bmbif_ncq_req_bus;          
wire             bmbif_ncq_shareable;        
wire             ciu_chr2_bar_dis;           
wire             ciu_icg_en;                 
wire             ciu_so_ostd_dis;            
wire             cpurst_b;                   
wire             dsq_clk_en;                 
wire    [15 :0]  dsq_create_en;              
wire             dsq_pop_apb;                
wire             dsq_pop_ebiu;               
wire    [15 :0]  dsq_pop_en;                 
wire             dsqclk;                     
wire             ebiu_ncq_ar_grant;          
wire             ebiu_ncq_ar_grant_gate;     
wire             ebiu_ncq_ar_so_grant;       
wire             ebiu_ncq_aw_grant;          
wire             ebiu_ncq_aw_grant_gated;    
wire    [9  :0]  ebiu_ncq_bbus;              
wire    [7  :0]  ebiu_ncq_bid;               
wire    [1  :0]  ebiu_ncq_bresp;             
wire             ebiu_ncq_bvalid;            
wire    [137:0]  ebiu_ncq_rbus;              
wire    [127:0]  ebiu_ncq_rdata;             
wire    [7  :0]  ebiu_ncq_rid;               
wire    [1  :0]  ebiu_ncq_rresp;             
wire             ebiu_ncq_rvalid;            
wire             ebiu_ncq_w_grant;           
wire             forever_cpuclk;             
wire             gm_ar_req;                  
wire             gm_ar_req_gate;             
wire             gm_aw_req;                  
wire             gm_ctrl_clk;                
wire    [3  :0]  gm_set_vld;                 
wire    [3  :0]  gm_set_vld_gate;            
wire    [3  :0]  gm_success;                 
wire    [3  :0]  gm_vld;                     
wire             ncq_apbif_arvalid;          
wire             ncq_apbif_awvalid;          
wire             ncq_apbif_b_grant;          
wire             ncq_apbif_r_grant;          
wire             ncq_apbif_wvalid;           
wire             ncq_ar_ebiu_sel;            
wire    [4  :0]  ncq_ar_ostd_cnt_piu0_dec;   
wire    [4  :0]  ncq_ar_ostd_cnt_piu0_final; 
wire    [4  :0]  ncq_ar_ostd_cnt_piu1_dec;   
wire    [4  :0]  ncq_ar_ostd_cnt_piu1_final; 
wire             ncq_aw_ebiu_sel;            
wire    [4  :0]  ncq_aw_ostd_cnt_piu0_dec;   
wire    [4  :0]  ncq_aw_ostd_cnt_piu0_final; 
wire    [4  :0]  ncq_aw_ostd_cnt_piu1_dec;   
wire    [4  :0]  ncq_aw_ostd_cnt_piu1_final; 
wire    [4  :0]  ncq_bar_ar_ostd_cnt_piu2;   
wire    [4  :0]  ncq_bar_ar_ostd_cnt_piu3;   
wire    [4  :0]  ncq_bar_aw_ostd_cnt_piu2;   
wire    [4  :0]  ncq_bar_aw_ostd_cnt_piu3;   
wire             ncq_bar_clk_en;             
wire             ncq_bar_piu0_arcnt_pop_en;  
wire             ncq_bar_piu0_awcnt_pop_en;  
wire             ncq_bar_piu0_cnt_create_en; 
wire             ncq_bar_piu1_arcnt_pop_en;  
wire             ncq_bar_piu1_awcnt_pop_en;  
wire             ncq_bar_piu1_cnt_create_en; 
wire             ncq_barcnt_clk;             
wire             ncq_barcnt_clk_en;          
wire             ncq_bmbif_bar_grant;        
wire    [4  :0]  ncq_dbg_info;               
wire             ncq_ebiu_arvalid;           
wire             ncq_ebiu_awvalid;           
wire             ncq_ebiu_b_grant;           
wire             ncq_ebiu_r_grant;           
wire             ncq_ebiu_r_so_grant;        
wire             ncq_ebiu_wvalid;            
wire             ncq_gm_clk_en;              
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
wire    [3  :0]  ncq_piu_bar_cmplt;          
wire    [13 :0]  ncq_piu_bbus;               
wire    [534:0]  ncq_piu_rbus;               
wire    [534:0]  ncq_piux_rbus;              
wire             ncq_rd_clk_en;              
wire    [4  :0]  ncq_total_ar_ostd_cnt_dec;  
wire    [4  :0]  ncq_total_ar_ostd_cnt_final; 
wire    [4  :0]  ncq_total_aw_ostd_cnt_dec;  
wire    [4  :0]  ncq_total_aw_ostd_cnt_final; 
wire             ncq_wt_clk_en;              
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
wire             ncqbarclk;                  
wire             ncqrdclk;                   
wire             ncqwtclk;                   
wire             pad_yy_icg_scan_en;         
wire    [73 :0]  piu0_ncq_ar_bus;            
wire             piu0_ncq_ar_req;            
wire    [73 :0]  piu0_ncq_aw_bus;            
wire             piu0_ncq_aw_req;            
wire             piu0_ncq_b_grant;           
wire             piu0_ncq_r_grant;           
wire    [143:0]  piu0_ncq_wcd_bus;           
wire             piu0_ncq_wcd_req;           
wire             piu0_ostd_cmplt;            
wire    [73 :0]  piu1_ncq_ar_bus;            
wire             piu1_ncq_ar_req;            
wire    [73 :0]  piu1_ncq_aw_bus;            
wire             piu1_ncq_aw_req;            
wire             piu1_ncq_b_grant;           
wire             piu1_ncq_r_grant;           
wire    [143:0]  piu1_ncq_wcd_bus;           
wire             piu1_ncq_wcd_req;           
wire             piu1_ostd_cmplt;            
wire    [73 :0]  piu2_ncq_ar_bus;            
wire             piu2_ncq_ar_req;            
wire    [73 :0]  piu2_ncq_aw_bus;            
wire             piu2_ncq_aw_req;            
wire             piu2_ncq_b_grant;           
wire             piu2_ncq_r_grant;           
wire    [143:0]  piu2_ncq_wcd_bus;           
wire             piu2_ncq_wcd_req;           
wire             piu2_ostd_cmplt;            
wire    [73 :0]  piu3_ncq_ar_bus;            
wire             piu3_ncq_ar_req;            
wire    [73 :0]  piu3_ncq_aw_bus;            
wire             piu3_ncq_aw_req;            
wire             piu3_ncq_b_grant;           
wire             piu3_ncq_r_grant;           
wire    [143:0]  piu3_ncq_wcd_bus;           
wire             piu3_ncq_wcd_req;           
wire             piu3_ostd_cmplt;            
wire    [3  :0]  piu_ar_req;                 
wire    [3  :0]  piu_ar_req_sel;             
wire    [3  :0]  piu_aw_req;                 
wire    [3  :0]  piu_aw_req_sel;             
wire    [3  :0]  piu_b_grant;                
wire    [3  :0]  piu_r_grant;                
wire    [3  :0]  piu_w_req;                  
wire    [3  :0]  piu_w_req_sel;              
wire             raq_apbif_sel;              
wire             raq_create_en;              
wire    [1  :0]  raq_create_mid;             
wire             raq_empty;                  
wire             raq_full;                   
wire    [39 :0]  raq_pop_araddr;             
wire    [1  :0]  raq_pop_arbar;              
wire    [1  :0]  raq_pop_arburst;            
wire    [3  :0]  raq_pop_arcache;            
wire    [1  :0]  raq_pop_ardomain;           
wire    [7  :0]  raq_pop_arid;               
wire    [1  :0]  raq_pop_arlen;              
wire             raq_pop_arlock;             
wire    [2  :0]  raq_pop_arprot;             
wire    [2  :0]  raq_pop_arsize;             
wire    [3  :0]  raq_pop_arsnoop;            
wire    [2  :0]  raq_pop_aruser;             
wire             raq_pop_arvalid;            
wire    [73 :0]  raq_pop_bus;                
wire             raq_pop_bus_vld;            
wire             raq_pop_en;                 
wire             raq_pop_en_gate;            
wire             raq_pop_so;                 
wire    [137:0]  rdq_create_bus;             
wire             rdq_create_en;              
wire             rdq_empty;                  
wire             rdq_full;                   
wire    [137:0]  rdq_pop_bus;                
wire             rdq_pop_bus_vld;            
wire             rdq_pop_en;                 
wire    [2  :0]  rdq_pop_mid;                
wire    [127:0]  rdq_pop_rdata;              
wire    [4  :0]  rdq_pop_rid;                
wire    [1  :0]  rdq_pop_rresp;              
wire    [39 :0]  sysio_ciu_apb_base;         
wire             total_ar_ostd_full;         
wire             total_aw_ostd_full;         
wire             total_ostd_cmplt;           
wire             waq_apbif_sel;              
wire    [7  :0]  waq_create_awid;            
wire             waq_create_en;              
wire             waq_empty;                  
wire             waq_full;                   
wire    [39 :0]  waq_pop_awaddr;             
wire    [1  :0]  waq_pop_awbar;              
wire    [1  :0]  waq_pop_awburst;            
wire    [3  :0]  waq_pop_awcache;            
wire    [1  :0]  waq_pop_awdomain;           
wire    [7  :0]  waq_pop_awid;               
wire    [1  :0]  waq_pop_awlen;              
wire             waq_pop_awlock;             
wire    [2  :0]  waq_pop_awprot;             
wire    [2  :0]  waq_pop_awsize;             
wire    [3  :0]  waq_pop_awsnoop;            
wire    [2  :0]  waq_pop_awuser;             
wire             waq_pop_awvalid;            
wire    [73 :0]  waq_pop_bus;                
wire             waq_pop_bus_vld;            
wire             waq_pop_en;                 
wire             waq_pop_en_gated;           
wire    [9  :0]  wbq_create_bus;             
wire             wbq_create_en;              
wire             wbq_empty;                  
wire             wbq_full;                   
wire    [4  :0]  wbq_pop_bid;                
wire    [1  :0]  wbq_pop_bresp;              
wire    [9  :0]  wbq_pop_bus;                
wire             wbq_pop_bus_vld;            
wire             wbq_pop_en;                 
wire    [2  :0]  wbq_pop_mid;                
wire             wdq_create_en;              
wire             wdq_empty;                  
wire             wdq_full;                   
wire    [151:0]  wdq_pop_bus;                
wire             wdq_pop_bus_vld;            
wire             wdq_pop_en;                 
wire    [127:0]  wdq_pop_wdata;              
wire    [7  :0]  wdq_pop_wid;                
wire    [15 :0]  wdq_pop_wstrb;              
wire             wdq_pop_wvalid;             
wire    [7  :0]  woq_create_bus;             
wire             woq_create_en;              
wire             woq_empty;                  
wire             woq_full;                   
wire    [7  :0]  woq_pop_awid;               
wire    [7  :0]  woq_pop_bus;                
wire             woq_pop_bus_vld;            
wire             woq_pop_en;                 
wire             woq_pop_vld;                
wire    [3  :0]  woq_pop_w_sel;              


parameter ADDRW = 40;

//==============================================================================
//                      read channel
//==============================================================================
//================================================
//                  RAQ: 2-entry 
//================================================
// use RAQ to cut down long path from ebiu ready to PIU grant
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
parameter ARID_5     = 19;
parameter ARID_6     = 20;
parameter ARID_7     = 21;
parameter ARLEN_0    = 22;
parameter ARLEN_1    = 23;
parameter ARBURST_0  = 24;
parameter ARBURST_1  = 25;
parameter ARSNOOP_0  = 26;
parameter ARSNOOP_3  = 29;
parameter ARDOMAIN_0 = 30;
parameter ARDOMAIN_1 = 31;
parameter ARBAR_0    = 32;
parameter ARBAR_1    = 33;
parameter ARADDR_0   = 34;
parameter ARADDR_H   = 73; //ADDRW-1+ARADDR_0;
parameter ARWIDTH    = 74; //ADDRW+ARADDR_0;
// &Force("nonport","raq_empty"); @65

assign ncq_piu0_ar_grant = piu_ar_req_sel[0] && raq_create_en;
assign ncq_piu1_ar_grant = piu_ar_req_sel[1] && raq_create_en;
assign ncq_piu2_ar_grant = piu_ar_req_sel[2] && raq_create_en;
assign ncq_piu3_ar_grant = piu_ar_req_sel[3] && raq_create_en;

assign ncq_bmbif_bar_grant = bmbif_ncq_bar_req;

assign piu_ar_req[3:0] = {piu3_ncq_ar_req,
                          piu2_ncq_ar_req,
                          piu1_ncq_ar_req,
                          piu0_ncq_ar_req};

assign ar_prio_clk_en = raq_create_en;
// &Instance("gated_clk_cell", "x_ncq_ar_prio_gated_clk"); @80
gated_clk_cell  x_ncq_ar_prio_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ar_prio_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ar_prio_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @81
//          .external_en (1'b0), @82
//          .global_en   (1'b1), @83
//          .module_en   (ciu_icg_en), @84
//          .local_en    (ar_prio_clk_en), @85
//          .clk_out     (ar_prio_clk)); @86

// &Instance('#(.NUM(4))', "ct_prio", "x_ct_ncq_ar_prio"); @88
ct_prio #(.NUM(4)) x_ct_ncq_ar_prio (
  .clk            (ar_prio_clk   ),
  .clr            (raq_create_en ),
  .rst_b          (cpurst_b      ),
  .sel            (piu_ar_req_sel),
  .valid          (piu_ar_req    )
);

// &Connect( @89
//   .clk      (ar_prio_clk      ), @90
//   .rst_b    (cpurst_b         ), @91
//   .valid    (piu_ar_req       ), @92
//   .clr      (raq_create_en    ), @93
//   .sel      (piu_ar_req_sel   )); @94

assign raq_create_en = |piu_ar_req[3:0] &&
                       !bmbif_ncq_bar_req &&
                       !total_ar_ostd_full &&
                       !raq_full;

// &CombBeg; @101
always @( piu0_ncq_ar_bus[73:0]
       or piu_ar_req_sel[3:0]
       or piu2_ncq_ar_bus[73:0]
       or piu1_ncq_ar_bus[73:0]
       or piu3_ncq_ar_bus[73:0])
begin
  case (piu_ar_req_sel[3:0])
    4'b0001: raq_create_bus[ARWIDTH-1:0] = piu0_ncq_ar_bus[ARWIDTH-1:0];
    4'b0010: raq_create_bus[ARWIDTH-1:0] = piu1_ncq_ar_bus[ARWIDTH-1:0];
    4'b0100: raq_create_bus[ARWIDTH-1:0] = piu2_ncq_ar_bus[ARWIDTH-1:0];
    4'b1000: raq_create_bus[ARWIDTH-1:0] = piu3_ncq_ar_bus[ARWIDTH-1:0];
    default: raq_create_bus[ARWIDTH-1:0] = {ARWIDTH{1'bx}};
  endcase
// &CombEnd; @109
end

assign raq_create_mid[1:0] = raq_create_bus[ARID_6:ARID_5];

assign raq_pop_en = apbif_ncq_ar_grant || ebiu_ncq_ar_grant;
assign raq_pop_en_gate = apbif_ncq_ar_grant || ebiu_ncq_ar_grant_gate;

// &Instance('#(.WIDTH(ARWIDTH), .DEPTH(2), .PTR_W(1))', "ct_fifo", "x_ct_ciu_ncq_raq"); @116
ct_fifo #(.WIDTH(ARWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ciu_ncq_raq (
  .clk                (forever_cpuclk    ),
  .fifo_create_data   (raq_create_bus    ),
  .fifo_create_en     (raq_create_en     ),
  .fifo_create_en_dp  (raq_create_en     ),
  .fifo_empty         (raq_empty         ),
  .fifo_full          (raq_full          ),
  .fifo_icg_en        (ciu_icg_en        ),
  .fifo_pop_data      (raq_pop_bus       ),
  .fifo_pop_data_vld  (raq_pop_bus_vld   ),
  .fifo_pop_en        (raq_pop_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rst_b              (cpurst_b          )
);

// &Connect( @117
//   .clk                 (forever_cpuclk       ), @118
//   .rst_b               (cpurst_b             ), @119
//   .fifo_create_en      (raq_create_en        ), @120
//   .fifo_create_en_dp   (raq_create_en        ), @121
//   .fifo_pop_en         (raq_pop_en           ), @122
//   .fifo_create_data    (raq_create_bus       ), @123
//   .fifo_pop_data       (raq_pop_bus          ), @124
//   .fifo_pop_data_vld   (raq_pop_bus_vld      ), @125
//   .fifo_full           (raq_full             ), @126
//   .fifo_empty          (raq_empty            ), @127
//   .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ), @128
//   .fifo_icg_en           (ciu_icg_en) @129
// ); @130

assign raq_pop_arvalid           = raq_pop_bus_vld;
assign raq_pop_arid[7:0]         = raq_pop_bus[ARID_7:ARID_0]; //ARID: SNB:[7:6]==00;NCQ:[7]==1,[6:5]:piu_no; CTC:[7:6]==01
assign raq_pop_arsize[2:0]       = raq_pop_bus[ARSIZE_2:ARSIZE_0];
assign raq_pop_arlock            = raq_pop_bus[ARLOCK];
assign raq_pop_arcache[3:0]      = raq_pop_bus[ARCACHE_3:ARCACHE_0];
assign raq_pop_arprot[2:0]       = raq_pop_bus[ARPROT_2:ARPROT_0];
assign raq_pop_araddr[ADDRW-1:0] = raq_pop_bus[ARADDR_H:ARADDR_0];
assign raq_pop_arburst[1:0]      = raq_pop_bus[ARBURST_1:ARBURST_0];
assign raq_pop_arlen[1:0]        = raq_pop_bus[ARLEN_1:ARLEN_0];
assign raq_pop_arsnoop[3:0]      = raq_pop_bus[ARSNOOP_3:ARSNOOP_0];
assign raq_pop_ardomain[1:0]     = raq_pop_bus[ARDOMAIN_1:ARDOMAIN_0];
assign raq_pop_arbar[1:0]        = raq_pop_bus[ARBAR_1:ARBAR_0];
assign raq_pop_aruser[2:0]       = raq_pop_bus[ARUSER_2:ARUSER_0];

//================================================
//      request distribution
//================================================
//1.ebiu : all wo and so whose address not in apb
//2.apbif: only so and hit apb base address region
parameter SO_ID    = 5'b11101;
parameter WO_EX_ID = 5'b11110;
// &Force("bus","sysio_ciu_apb_base",ADDRW-1,0); @153

assign raq_apbif_sel = raq_pop_araddr[ADDRW-1:27] == sysio_ciu_apb_base[ADDRW-1:27];

always @(posedge ncqrdclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_ar_apbif_sel <= 1'b0;
  else if (apbif_ncq_ar_grant)
    ncq_ar_apbif_sel <= 1'b1;
  else if (ncq_apbif_r_grant)
    ncq_ar_apbif_sel <= 1'b0;
end

assign ebiu_ncq_ar_so_grant = ebiu_ncq_ar_grant & (raq_pop_arid[4:0] == SO_ID);
assign ncq_ebiu_r_so_grant  = ncq_ebiu_r_grant  & (ebiu_ncq_rid[4:0] == SO_ID);

always @(posedge ncqrdclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_ar_ebiu_so_sel <= 1'b0;
  else if (ebiu_ncq_ar_so_grant && !ncq_ebiu_r_so_grant)
    ncq_ar_ebiu_so_sel <= 1'b1;
  else if (!ebiu_ncq_ar_so_grant && ncq_ebiu_r_so_grant)
    ncq_ar_ebiu_so_sel <= 1'b0;
end

always @(posedge ncqrdclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_ar_ebiu_ostd_cnt[4:0] <= 5'b0;
  else if (ebiu_ncq_ar_grant && !ncq_ebiu_r_grant)
    ncq_ar_ebiu_ostd_cnt[4:0] <= ncq_ar_ebiu_ostd_cnt[4:0] + 5'b1;
  else if (!ebiu_ncq_ar_grant && ncq_ebiu_r_grant)
    ncq_ar_ebiu_ostd_cnt[4:0] <= ncq_ar_ebiu_ostd_cnt[4:0] - 5'b1;
end

assign ncq_ar_ebiu_sel = |ncq_ar_ebiu_ostd_cnt[4:0];

assign raq_pop_so = raq_pop_arid[4:0] == SO_ID;

assign ncq_apbif_arvalid = raq_pop_arvalid &&  raq_apbif_sel && !ncq_ar_ebiu_sel && !ncq_aw_apbif_sel;
assign ncq_ebiu_arvalid  = raq_pop_arvalid && !raq_apbif_sel && !ncq_ar_apbif_sel && 
                           (!ciu_so_ostd_dis || !raq_pop_so || !ncq_ar_ebiu_so_sel);

assign ncq_xx_araddr[ADDRW-1:0] = raq_pop_araddr[ADDRW-1:0];
assign ncq_xx_arid[7:0]         = raq_pop_arid[7:0];
assign ncq_xx_arsize[2:0]       = raq_pop_arsize[2:0];
assign ncq_xx_arlock            = raq_pop_arlock;
assign ncq_xx_arcache[3:0]      = raq_pop_arcache[3:0];
assign ncq_xx_arprot[2:0]       = raq_pop_arprot[2:0];
assign ncq_xx_arburst[1:0]      = raq_pop_arburst[1:0];
assign ncq_xx_arlen[7:0]        = {6'b0,raq_pop_arlen[1:0]};
assign ncq_xx_arsnoop[3:0]      = raq_pop_arsnoop[3:0];
assign ncq_xx_arbar[1:0]        = raq_pop_arbar[1:0];
assign ncq_xx_ardomain[1:0]     = raq_pop_ardomain[1:0];
assign ncq_xx_aruser            = raq_pop_aruser[1];

//================================================
//                  RDQ: 2-entry 
//================================================
parameter RDATA_0 = 0;
parameter RDATA_H = 127;
parameter RRESP_0 = 128;
parameter RRESP_1 = 129;
parameter RID_0   = 130;
parameter RID_4   = 134;
parameter MID_0   = 135;
parameter MID_1   = 136;
parameter MID_2   = 137;
parameter RWIDTH  = 138;

// &Force("output", "ncq_ebiu_r_grant"); @225
// &Force("output", "ncq_apbif_r_grant"); @226
// &Force("nonport","rdq_empty"); @227
// &Force("nonport","rdq_pop_en"); @228
// &Force("input","ebiu_ncq_rlast"); @229
// &Force("input","apbif_ncq_rlast"); @230

assign rdq_create_en = (ebiu_ncq_rvalid || apbif_ncq_rvalid) &&
                       !rdq_full;

assign apbif_ncq_rbus[RWIDTH-1:0] = {apbif_ncq_rid[7:0],
                                     apbif_ncq_rresp[1:0],
                                     apbif_ncq_rdata[127:0]};

assign ebiu_ncq_rbus[RWIDTH-1:0] = {ebiu_ncq_rid[7:0],
                                    ebiu_ncq_rresp[1:0],
                                    ebiu_ncq_rdata[127:0]};

assign rdq_create_bus[RWIDTH-1:0] = apbif_ncq_rvalid 
                                  ? apbif_ncq_rbus[RWIDTH-1:0] 
                                  : ebiu_ncq_rbus[RWIDTH-1:0];

assign ncq_ebiu_r_grant  = rdq_create_en && !apbif_ncq_rvalid;
assign ncq_apbif_r_grant = rdq_create_en && apbif_ncq_rvalid;

assign piu_r_grant[3:0] = {piu3_ncq_r_grant,
                           piu2_ncq_r_grant,
                           piu1_ncq_r_grant,
                           piu0_ncq_r_grant};

assign rdq_pop_en = |piu_r_grant[3:0];

// &Instance('#(.WIDTH(RWIDTH), .DEPTH(2), .PTR_W(1))', "ct_fifo", "x_ct_ciu_ncq_rdq"); @257
ct_fifo #(.WIDTH(RWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ciu_ncq_rdq (
  .clk                (forever_cpuclk    ),
  .fifo_create_data   (rdq_create_bus    ),
  .fifo_create_en     (rdq_create_en     ),
  .fifo_create_en_dp  (rdq_create_en     ),
  .fifo_empty         (rdq_empty         ),
  .fifo_full          (rdq_full          ),
  .fifo_icg_en        (ciu_icg_en        ),
  .fifo_pop_data      (rdq_pop_bus       ),
  .fifo_pop_data_vld  (rdq_pop_bus_vld   ),
  .fifo_pop_en        (rdq_pop_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rst_b              (cpurst_b          )
);

// &Connect( @258
//   .clk                 (forever_cpuclk       ), @259
//   .rst_b               (cpurst_b             ), @260
//   .fifo_create_en      (rdq_create_en        ), @261
//   .fifo_create_en_dp   (rdq_create_en        ), @262
//   .fifo_pop_en         (rdq_pop_en           ), @263
//   .fifo_create_data    (rdq_create_bus       ), @264
//   .fifo_pop_data       (rdq_pop_bus          ), @265
//   .fifo_pop_data_vld   (rdq_pop_bus_vld      ), @266
//   .fifo_full           (rdq_full             ), @267
//   .fifo_empty          (rdq_empty            ), @268
//   .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ), @269
//   .fifo_icg_en           (ciu_icg_en) @270
// ); @271

assign rdq_pop_mid[2:0]     = rdq_pop_bus[MID_2:MID_0];
assign rdq_pop_rid[4:0]     = rdq_pop_bus[RID_4:RID_0];
assign rdq_pop_rresp[1:0]   = rdq_pop_bus[RRESP_1:RRESP_0];
assign rdq_pop_rdata[127:0] = rdq_pop_bus[RDATA_H:RDATA_0];

assign ncq_piu0_rvalid = rdq_pop_bus_vld && (rdq_pop_mid[1:0] == 2'b00);
assign ncq_piu1_rvalid = rdq_pop_bus_vld && (rdq_pop_mid[1:0] == 2'b01);
assign ncq_piu2_rvalid = rdq_pop_bus_vld && (rdq_pop_mid[1:0] == 2'b10);
assign ncq_piu3_rvalid = rdq_pop_bus_vld && (rdq_pop_mid[1:0] == 2'b11);

parameter RBUSW   = 535;
assign ncq_piu_rbus[RBUSW-1:0] = {2'b00,             //LEN
                                  2'b0,              //ADDR_5:ADDR_4
                                  2'b10,             //sid[6:5]:stand for ncq/ctcq
                                  5'b0,              //sid[4:0]
                                  rdq_pop_rid[4:0],  //RID_4,RID0
                                  2'b0,              //resp3~2
                                  {4{rdq_pop_rresp[1]}},rdq_pop_rresp[0],//RRESP_1,RRESP_0
                                  128'b0,
                                  128'b0,
                                  128'b0,
                                  rdq_pop_rdata[127:0]};

assign ncq_piux_rbus[RBUSW-1:0] = ncq_piu_rbus[RBUSW-1:0];


//==============================================================================
//                           write channel
//==============================================================================
//================================================
//       write address queue: 2-entry
//================================================
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
parameter AWID_7     = 21;
parameter AWLEN_0    = 22;
parameter AWLEN_1    = 23;
parameter AWBURST_0  = 24;
parameter AWBURST_1  = 25;
parameter AWSNOOP_0  = 26;
parameter AWSNOOP_3  = 29;
parameter AWDOMAIN_0 = 30;
parameter AWDOMAIN_1 = 31;
parameter AWBAR_0    = 32;
parameter AWBAR_1    = 33;
parameter AWADDR_0   = 34;
parameter AWADDR_H   = 73; //ADDRW-1+AWADDR_0;
parameter AWWIDTH    = 74; //ADDRW+AWADDR_0;

// &Force("nonport","waq_empty"); @331

assign ncq_piu0_aw_grant = piu_aw_req_sel[0] && waq_create_en;
assign ncq_piu1_aw_grant = piu_aw_req_sel[1] && waq_create_en;
assign ncq_piu2_aw_grant = piu_aw_req_sel[2] && waq_create_en;
assign ncq_piu3_aw_grant = piu_aw_req_sel[3] && waq_create_en;

assign piu_aw_req[3:0] = {piu3_ncq_aw_req,
                          piu2_ncq_aw_req,
                          piu1_ncq_aw_req,
                          piu0_ncq_aw_req};

assign aw_prio_clk_en = waq_create_en;
// &Instance("gated_clk_cell", "x_ncq_aw_prio_gated_clk"); @344
gated_clk_cell  x_ncq_aw_prio_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (aw_prio_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (aw_prio_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @345
//          .external_en (1'b0), @346
//          .global_en   (1'b1), @347
//          .module_en   (ciu_icg_en), @348
//          .local_en    (aw_prio_clk_en), @349
//          .clk_out     (aw_prio_clk)); @350

// &Instance('#(.NUM(4))', "ct_prio", "x_ct_aw_prio"); @352
ct_prio #(.NUM(4)) x_ct_aw_prio (
  .clk            (aw_prio_clk   ),
  .clr            (waq_create_en ),
  .rst_b          (cpurst_b      ),
  .sel            (piu_aw_req_sel),
  .valid          (piu_aw_req    )
);

// &Connect( @353
//   .clk      (aw_prio_clk      ), @354
//   .rst_b    (cpurst_b         ), @355
//   .valid    (piu_aw_req       ), @356
//   .clr      (waq_create_en    ), @357
//   .sel      (piu_aw_req_sel   )); @358

assign waq_create_en = |piu_aw_req[3:0] &&
                       !bmbif_ncq_bar_req &&
                       !total_aw_ostd_full &&
                       !waq_full &&
                       !woq_full;
    
// &CombBeg;  @366
always @( piu2_ncq_aw_bus[73:0]
       or piu_aw_req_sel[3:0]
       or piu3_ncq_aw_bus[73:0]
       or piu1_ncq_aw_bus[73:0]
       or piu0_ncq_aw_bus[73:0])
begin
  case (piu_aw_req_sel[3:0])
    4'b0001: waq_create_bus[AWWIDTH-1:0] = piu0_ncq_aw_bus[AWWIDTH-1:0];
    4'b0010: waq_create_bus[AWWIDTH-1:0] = piu1_ncq_aw_bus[AWWIDTH-1:0];
    4'b0100: waq_create_bus[AWWIDTH-1:0] = piu2_ncq_aw_bus[AWWIDTH-1:0];
    4'b1000: waq_create_bus[AWWIDTH-1:0] = piu3_ncq_aw_bus[AWWIDTH-1:0];
    default: waq_create_bus[AWWIDTH-1:0] = {AWWIDTH{1'bx}};
  endcase 
// &CombEnd; @374
end

assign waq_create_awid[7:0] = waq_create_bus[AWID_7:AWID_0];


assign waq_pop_en = apbif_ncq_aw_grant || ebiu_ncq_aw_grant;
assign waq_pop_en_gated = apbif_ncq_aw_grant || ebiu_ncq_aw_grant_gated;

// &Instance('#(.WIDTH(AWWIDTH), .DEPTH(2), .PTR_W(1))', "ct_fifo", "x_ct_ciu_ncq_waq"); @385
ct_fifo #(.WIDTH(AWWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ciu_ncq_waq (
  .clk                (forever_cpuclk    ),
  .fifo_create_data   (waq_create_bus    ),
  .fifo_create_en     (waq_create_en     ),
  .fifo_create_en_dp  (waq_create_en     ),
  .fifo_empty         (waq_empty         ),
  .fifo_full          (waq_full          ),
  .fifo_icg_en        (ciu_icg_en        ),
  .fifo_pop_data      (waq_pop_bus       ),
  .fifo_pop_data_vld  (waq_pop_bus_vld   ),
  .fifo_pop_en        (waq_pop_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rst_b              (cpurst_b          )
);

// &Connect( @386
//   .clk                 (forever_cpuclk       ), @387
//   .rst_b               (cpurst_b             ), @388
//   .fifo_create_en      (waq_create_en        ), @389
//   .fifo_create_en_dp   (waq_create_en        ), @390
//   .fifo_pop_en         (waq_pop_en           ), @391
//   .fifo_create_data    (waq_create_bus       ), @392
//   .fifo_pop_data       (waq_pop_bus          ), @393
//   .fifo_pop_data_vld   (waq_pop_bus_vld      ), @394
//   .fifo_full           (waq_full             ), @395
//   .fifo_empty          (waq_empty            ), @396
//   .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ), @397
//   .fifo_icg_en           (ciu_icg_en) @398
// ); @399

assign waq_pop_awvalid           = waq_pop_bus_vld;
assign waq_pop_awid[7:0]         = waq_pop_bus[AWID_7:AWID_0];
assign waq_pop_awsize[2:0]       = waq_pop_bus[AWSIZE_2:AWSIZE_0];
assign waq_pop_awlock            = waq_pop_bus[AWLOCK];
assign waq_pop_awcache[3:0]      = waq_pop_bus[AWCACHE_3:AWCACHE_0];
assign waq_pop_awprot[2:0]       = waq_pop_bus[AWPROT_2:AWPROT_0];
assign waq_pop_awaddr[ADDRW-1:0] = waq_pop_bus[AWADDR_H:AWADDR_0];
assign waq_pop_awdomain[1:0]     = waq_pop_bus[AWDOMAIN_1:AWDOMAIN_0];
assign waq_pop_awsnoop[3:0]      = waq_pop_bus[AWSNOOP_3:AWSNOOP_0];
assign waq_pop_awbar[1:0]        = waq_pop_bus[AWBAR_1:AWBAR_0];
assign waq_pop_awlen[1:0]        = waq_pop_bus[AWLEN_1:AWLEN_0];
assign waq_pop_awburst[1:0]      = waq_pop_bus[AWBURST_1:AWBURST_0];
assign waq_pop_awuser[2:0]       = waq_pop_bus[AWUSER_2:AWUSER_0];

//================================================
//           local monitor
//================================================

assign gm_ar_req = raq_pop_arvalid && raq_pop_en && raq_pop_arlock &&
                  !(waq_pop_awvalid && waq_pop_en && (raq_pop_araddr[ADDRW-1:0] == waq_pop_awaddr[ADDRW-1:0]));

assign gm_ar_req_gate = raq_pop_arvalid && raq_pop_en_gate && raq_pop_arlock;

assign gm_set_vld[3:0] = (4'b1 << raq_pop_arid[6:5]) & {4{gm_ar_req}};
assign gm_set_vld_gate[3:0] = (4'b1 << raq_pop_arid[6:5]) & {4{gm_ar_req_gate}};

assign gm_aw_req = waq_pop_awvalid;

// &ConnRule(s/_x$/[0]/); @430
// &Instance("ct_ciu_ncq_gm", "x_ct_ciu_ncq_gm_core0"); @431
ct_ciu_ncq_gm  x_ct_ciu_ncq_gm_core0 (
  .ciu_icg_en         (ciu_icg_en        ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .gm_aw_req          (gm_aw_req         ),
  .gm_ctrl_clk        (gm_ctrl_clk       ),
  .gm_set_vld_gate_x  (gm_set_vld_gate[0]),
  .gm_set_vld_x       (gm_set_vld[0]     ),
  .gm_success_x       (gm_success[0]     ),
  .gm_vld_x           (gm_vld[0]         ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .raq_pop_bus        (raq_pop_bus       ),
  .waq_pop_bus        (waq_pop_bus       ),
  .waq_pop_en         (waq_pop_en        )
);


// &ConnRule(s/_x$/[1]/); @438
// &Instance("ct_ciu_ncq_gm", "x_ct_ciu_ncq_gm_core1"); @439
ct_ciu_ncq_gm  x_ct_ciu_ncq_gm_core1 (
  .ciu_icg_en         (ciu_icg_en        ),
  .cpurst_b           (cpurst_b          ),
  .forever_cpuclk     (forever_cpuclk    ),
  .gm_aw_req          (gm_aw_req         ),
  .gm_ctrl_clk        (gm_ctrl_clk       ),
  .gm_set_vld_gate_x  (gm_set_vld_gate[1]),
  .gm_set_vld_x       (gm_set_vld[1]     ),
  .gm_success_x       (gm_success[1]     ),
  .gm_vld_x           (gm_vld[1]         ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .raq_pop_bus        (raq_pop_bus       ),
  .waq_pop_bus        (waq_pop_bus       ),
  .waq_pop_en         (waq_pop_en        )
);


// &ConnRule(s/_x$/[2]/); @446
// &Instance("ct_ciu_ncq_gm", "x_ct_ciu_ncq_gm_core2"); @447
assign gm_success[2] = 1'b0;
assign gm_vld[2] = 1'b0;

// &ConnRule(s/_x$/[3]/); @454
// &Instance("ct_ciu_ncq_gm", "x_ct_ciu_ncq_gm_core3"); @455
assign gm_success[3] = 1'b0;
assign gm_vld[3] = 1'b0;

assign ncq_gm_clk_en = gm_ar_req_gate || (|gm_vld[3:0]) && waq_pop_awvalid && waq_pop_en_gated;
// &Instance("gated_clk_cell", "x_ncq_gm_ctrl_gated_clk"); @462
gated_clk_cell  x_ncq_gm_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (gm_ctrl_clk       ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncq_gm_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @463
//          .external_en (1'b0), @464
//          .global_en   (1'b1), @465
//          .module_en   (ciu_icg_en), @466
//          .local_en    (ncq_gm_clk_en), @467
//          .clk_out     (gm_ctrl_clk)); @468

//================================================
//      Request distribution
//================================================
//1.ebiu : all wo and so whose address not in apb
//2.apbif: only so and hit apb base address region
// &Force("output","ncq_apbif_b_grant"); @475
// &Force("output","ncq_ebiu_b_grant"); @476

assign waq_apbif_sel = waq_pop_awaddr[ADDRW-1:27] == sysio_ciu_apb_base[ADDRW-1:27];

always @(posedge ncqwtclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_aw_apbif_sel <= 1'b0;
  else if (apbif_ncq_aw_grant && !ncq_apbif_b_grant)
    ncq_aw_apbif_sel <= 1'b1;
  else if (!apbif_ncq_aw_grant && ncq_apbif_b_grant) 
    ncq_aw_apbif_sel <= 1'b0;
  else
    ncq_aw_apbif_sel <= ncq_aw_apbif_sel;
end

always @(posedge ncqwtclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_aw_ebiu_ostd_cnt[4:0] <= 5'b0;
  else if (ebiu_ncq_aw_grant && !ncq_ebiu_b_grant)
    ncq_aw_ebiu_ostd_cnt[4:0] <= ncq_aw_ebiu_ostd_cnt[4:0] + 5'b1;
  else if (!ebiu_ncq_aw_grant && ncq_ebiu_b_grant)
    ncq_aw_ebiu_ostd_cnt[4:0] <= ncq_aw_ebiu_ostd_cnt[4:0] - 5'b1;
end

assign ncq_aw_ebiu_sel   = |ncq_aw_ebiu_ostd_cnt[4:0];

assign ncq_apbif_awvalid = waq_pop_awvalid &&  waq_apbif_sel && !ncq_aw_ebiu_sel && !ncq_ar_apbif_sel;
assign ncq_ebiu_awvalid  = waq_pop_awvalid && !waq_apbif_sel && !ncq_aw_apbif_sel;

assign ncq_xx_awaddr[ADDRW-1:0] = waq_pop_awaddr[ADDRW-1:0];
assign ncq_xx_awid[7:0]         = waq_pop_awid[7:0];
assign ncq_xx_awsize[2:0]       = waq_pop_awsize[2:0];
assign ncq_xx_awlock            = waq_pop_awlock;
assign ncq_xx_awcache[3:0]      = waq_pop_awcache[3:0];
assign ncq_xx_awprot[2:0]       = waq_pop_awprot[2:0];
assign ncq_xx_awburst[1:0]      = waq_pop_awburst[1:0];
assign ncq_xx_awlen[7:0]        = {6'b0, waq_pop_awlen[1:0]};
assign ncq_xx_awsnoop[2:0]      = waq_pop_awsnoop[2:0];
assign ncq_xx_awdomain[1:0]     = waq_pop_awdomain[1:0];
assign ncq_xx_awbar[1:0]        = waq_pop_awbar[1:0];
assign ncq_xx_awuser            = waq_pop_awuser[1];

assign ncq_xx_aw_needissue      = waq_pop_awlock ? (|gm_success[3:0]) : 1'b1;

//================================================
//           wdata order queue:32-entry
//================================================
parameter WOQ_DEPTH = 16;
parameter WOQ_WIDTH = 8;
parameter WOQ_PTRW  = 4;

// &Force("nonport", "woq_create_en"); @529
// &Force("nonport", "woq_create_bus"); @530
// &Force("nonport", "woq_pop_en"); @531
// &Force("nonport", "woq_pop_bus"); @532
// &Force("nonport", "woq_pop_bus_vld"); @533
// &Force("nonport", "woq_full"); @534
// &Force("nonport", "woq_empty"); @535

assign woq_create_en = waq_create_en;
assign woq_pop_en = wdq_create_en;

assign woq_create_bus[WOQ_WIDTH-1:0] = {waq_create_awid[7:0]};

// &Instance('#(.WIDTH(WOQ_WIDTH+1), .DEPTH(WOQ_DEPTH), .PTR_W(WOQ_PTRW))', "ct_fifo", "x_ct_ciu_ncq_woq"); @547
// &Instance('#(.WIDTH(WOQ_WIDTH), .DEPTH(WOQ_DEPTH), .PTR_W(WOQ_PTRW))', "ct_fifo", "x_ct_ciu_ncq_woq"); @549
ct_fifo #(.WIDTH(WOQ_WIDTH), .DEPTH(WOQ_DEPTH), .PTR_W(WOQ_PTRW)) x_ct_ciu_ncq_woq (
  .clk                (forever_cpuclk    ),
  .fifo_create_data   (woq_create_bus    ),
  .fifo_create_en     (woq_create_en     ),
  .fifo_create_en_dp  (woq_create_en     ),
  .fifo_empty         (woq_empty         ),
  .fifo_full          (woq_full          ),
  .fifo_icg_en        (ciu_icg_en        ),
  .fifo_pop_data      (woq_pop_bus       ),
  .fifo_pop_data_vld  (woq_pop_bus_vld   ),
  .fifo_pop_en        (woq_pop_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rst_b              (cpurst_b          )
);

// &Connect( @551
//   .clk                    (forever_cpuclk         ), @552
//   .rst_b                  (cpurst_b               ), @553
//   .fifo_create_en         (woq_create_en          ), @554
//   .fifo_create_en_dp      (woq_create_en          ), @555
//   .fifo_pop_en            (woq_pop_en             ), @556
//   .fifo_create_data       (woq_create_bus         ), @557
//   .fifo_pop_data          (woq_pop_bus            ), @558
//   .fifo_pop_data_vld      (woq_pop_bus_vld        ), @559
//   .pad_yy_icg_scan_en     (pad_yy_icg_scan_en     ), @560
//   .fifo_icg_en            (ciu_icg_en             ), @561
//   .fifo_full              (woq_full               ), @562
//   .fifo_empty             (woq_empty              ) @563
// ); @564

assign woq_pop_vld        = woq_pop_bus_vld;
assign woq_pop_awid[7:0]  = woq_pop_bus[7:0];
assign woq_pop_w_sel[3:0] = (4'b1 << woq_pop_awid[6:5]) & {4{woq_pop_vld}};

//================================================
//       write data queue: 2-entry
//================================================
parameter WWIDTH  = 152;
parameter WLOCK   = 152;
parameter WID_7   = 151;
parameter WID_0   = 144;
parameter WSTRB_H = 143;
parameter WSTRB_0 = 128;
parameter WDATA_H = 127;
parameter WDATA_0 = 0;

parameter WWIDTH_P = 144;

// &Force("nonport","wdq_empty"); @587

assign ncq_piu0_wcd_grant = piu_w_req_sel[0] && wdq_create_en;
assign ncq_piu1_wcd_grant = piu_w_req_sel[1] && wdq_create_en;
assign ncq_piu2_wcd_grant = piu_w_req_sel[2] && wdq_create_en;
assign ncq_piu3_wcd_grant = piu_w_req_sel[3] && wdq_create_en;

assign piu_w_req[3:0] = {piu3_ncq_wcd_req,
                         piu2_ncq_wcd_req,
                         piu1_ncq_wcd_req,
                         piu0_ncq_wcd_req};

assign piu_w_req_sel[3:0] = woq_pop_w_sel[3:0] & piu_w_req[3:0];

assign wdq_create_en = |piu_w_req_sel[3:0] &&
                       !wdq_full;

// &CombBeg;  @605
// &CombEnd; @613
// &CombBeg;  @615
always @( piu3_ncq_wcd_bus[143:0]
       or piu1_ncq_wcd_bus[143:0]
       or woq_pop_awid[7:0]
       or piu_w_req_sel[3:0]
       or piu0_ncq_wcd_bus[143:0]
       or piu2_ncq_wcd_bus[143:0])
begin
  case (piu_w_req_sel[3:0])
    4'b0001: wdq_create_bus[WWIDTH-1:0] = {woq_pop_awid[7:0],piu0_ncq_wcd_bus[WWIDTH_P-1:0]};
    4'b0010: wdq_create_bus[WWIDTH-1:0] = {woq_pop_awid[7:0],piu1_ncq_wcd_bus[WWIDTH_P-1:0]};
    4'b0100: wdq_create_bus[WWIDTH-1:0] = {woq_pop_awid[7:0],piu2_ncq_wcd_bus[WWIDTH_P-1:0]};
    4'b1000: wdq_create_bus[WWIDTH-1:0] = {woq_pop_awid[7:0],piu3_ncq_wcd_bus[WWIDTH_P-1:0]};
    default: wdq_create_bus[WWIDTH-1:0] = {WWIDTH{1'bx}};
  endcase 
// &CombEnd; @623
end

assign wdq_pop_en = apbif_ncq_w_grant || ebiu_ncq_w_grant;
// &Instance('#(.WIDTH(WWIDTH+1), .DEPTH(2), .PTR_W(1))', "ct_fifo", "x_ct_ciu_ncq_wdq"); @628
// &Instance('#(.WIDTH(WWIDTH), .DEPTH(2), .PTR_W(1))', "ct_fifo", "x_ct_ciu_ncq_wdq"); @630
ct_fifo #(.WIDTH(WWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ciu_ncq_wdq (
  .clk                (forever_cpuclk    ),
  .fifo_create_data   (wdq_create_bus    ),
  .fifo_create_en     (wdq_create_en     ),
  .fifo_create_en_dp  (wdq_create_en     ),
  .fifo_empty         (wdq_empty         ),
  .fifo_full          (wdq_full          ),
  .fifo_icg_en        (ciu_icg_en        ),
  .fifo_pop_data      (wdq_pop_bus       ),
  .fifo_pop_data_vld  (wdq_pop_bus_vld   ),
  .fifo_pop_en        (wdq_pop_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rst_b              (cpurst_b          )
);

// &Connect( @632
//   .clk                 (forever_cpuclk       ), @633
//   .rst_b               (cpurst_b             ), @634
//   .fifo_create_en      (wdq_create_en        ), @635
//   .fifo_create_en_dp   (wdq_create_en        ), @636
//   .fifo_pop_en         (wdq_pop_en           ), @637
//   .fifo_create_data    (wdq_create_bus       ), @638
//   .fifo_pop_data       (wdq_pop_bus          ), @639
//   .fifo_pop_data_vld   (wdq_pop_bus_vld      ), @640
//   .fifo_full           (wdq_full             ), @641
//   .fifo_empty          (wdq_empty            ), @642
//   .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ), @643
//   .fifo_icg_en         (ciu_icg_en           ) @644
// ); @645

assign wdq_pop_wvalid       = wdq_pop_bus_vld;
assign wdq_pop_wdata[127:0] = wdq_pop_bus[WDATA_H:WDATA_0];
assign wdq_pop_wstrb[15:0]  = wdq_pop_bus[WSTRB_H:WSTRB_0];
assign wdq_pop_wid[7:0]     = wdq_pop_bus[WID_7:WID_0];

assign ncq_ebiu_wvalid      = wdq_pop_wvalid && dsq_pop_ebiu;
assign ncq_apbif_wvalid     = wdq_pop_wvalid && dsq_pop_apb;
assign ncq_xx_wdata[127:0]  = wdq_pop_wdata[127:0];
assign ncq_xx_wstrb[15:0]   = wdq_pop_wstrb[15:0];
assign ncq_xx_wlast         = 1'b1;
assign ncq_xx_wid[7:0]      = wdq_pop_wid[7:0];

//------------------------------------------------
//      destination select queue: 16-entry
//------------------------------------------------
parameter DSQ_DEPTH = 16;

assign dsq_clk_en = waq_pop_en_gated || wdq_pop_en;

// &Instance("gated_clk_cell", "x_ncq_dsq_gated_clk"); @669
gated_clk_cell  x_ncq_dsq_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dsqclk            ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dsq_clk_en        ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @670
//          .external_en (1'b0), @671
//          .global_en   (1'b1), @672
//          .module_en   (ciu_icg_en), @673
//          .local_en    (dsq_clk_en), @674
//          .clk_out     (dsqclk)); @675

always @(posedge dsqclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dsq_create_ptr[3:0] <= 4'b0;
  else if (waq_pop_en)
    dsq_create_ptr[3:0] <= dsq_create_ptr[3:0] + 4'b1;
  else
    dsq_create_ptr[3:0] <= dsq_create_ptr[3:0];
end

assign dsq_create_en[DSQ_DEPTH-1:0] = (16'b1 << dsq_create_ptr[3:0]) & {16{waq_pop_en}};

always @(posedge dsqclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    dsq_pop_ptr[3:0] <= 4'b0;
  else if (wdq_pop_en)
    dsq_pop_ptr[3:0] <= dsq_pop_ptr[3:0] + 4'b1;
end

assign dsq_pop_en[DSQ_DEPTH-1:0] = (16'b1 << dsq_pop_ptr[3:0]) & {16{wdq_pop_en}};

integer i;
always @(posedge dsqclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    for(i=0;i<DSQ_DEPTH;i=i+1)
      dsq_vld[i] <= 1'b0;
  end
  else
  begin
    for(i=0;i<DSQ_DEPTH;i=i+1)
    begin
      if (dsq_create_en[i])
        dsq_vld[i] <= 1'b1;
      else if (dsq_pop_en[i])
        dsq_vld[i] <= 1'b0;
      else
        dsq_vld[i] <= dsq_vld[i];
    end
  end
end

always @(posedge dsqclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    for(i=0;i<DSQ_DEPTH;i=i+1)
      dsq_apb[i] <= 1'b0;
  end
  else
  begin
    for(i=0;i<DSQ_DEPTH;i=i+1)
    begin
      if (dsq_create_en[i])
        dsq_apb[i] <= waq_apbif_sel;
      else
        dsq_apb[i] <= dsq_apb[i];
    end
  end
end

assign dsq_pop_apb = dsq_apb[dsq_pop_ptr[3:0]] && dsq_vld[dsq_pop_ptr[3:0]];
assign dsq_pop_ebiu= !dsq_apb[dsq_pop_ptr[3:0]] && dsq_vld[dsq_pop_ptr[3:0]];


//================================================
//       write bresp queue: 2-entry
//================================================
parameter BWIDTH  = 10;
parameter BRESP_1 = 9;
parameter BRESP_0 = 8;
parameter BID_7   = 7;
parameter BID_5   = 5;
parameter BID_4   = 4;
parameter BID_0   = 0;

// &Force("nonport","wbq_empty"); @755
// &Force("nonport", "wbq_pop_en"); @756

assign wbq_create_en = (ebiu_ncq_bvalid || apbif_ncq_bvalid) && 
                       !wbq_full;

assign apbif_ncq_bbus[BWIDTH-1:0] = {apbif_ncq_bresp[1:0],
                                     apbif_ncq_bid[7:0]};

assign ebiu_ncq_bbus[BWIDTH-1:0] = {ebiu_ncq_bresp[1:0],
                                    ebiu_ncq_bid[7:0]};

assign wbq_create_bus[BWIDTH-1:0] = apbif_ncq_bvalid
                                  ? apbif_ncq_bbus[BWIDTH-1:0]
                                  : ebiu_ncq_bbus[BWIDTH-1:0];

assign ncq_ebiu_b_grant  = wbq_create_en && !apbif_ncq_bvalid;
assign ncq_apbif_b_grant = wbq_create_en && apbif_ncq_bvalid;

assign piu_b_grant[3:0] = {piu3_ncq_b_grant,
                           piu2_ncq_b_grant,
                           piu1_ncq_b_grant,
                           piu0_ncq_b_grant};

assign wbq_pop_en = |piu_b_grant[3:0];

// &Instance('#(.WIDTH(BWIDTH), .DEPTH(2), .PTR_W(1))', "ct_fifo", "x_ct_ciu_ncq_wbq"); @781
ct_fifo #(.WIDTH(BWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ciu_ncq_wbq (
  .clk                (forever_cpuclk    ),
  .fifo_create_data   (wbq_create_bus    ),
  .fifo_create_en     (wbq_create_en     ),
  .fifo_create_en_dp  (wbq_create_en     ),
  .fifo_empty         (wbq_empty         ),
  .fifo_full          (wbq_full          ),
  .fifo_icg_en        (ciu_icg_en        ),
  .fifo_pop_data      (wbq_pop_bus       ),
  .fifo_pop_data_vld  (wbq_pop_bus_vld   ),
  .fifo_pop_en        (wbq_pop_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  .rst_b              (cpurst_b          )
);

// &Connect( @782
//   .clk                 (forever_cpuclk       ), @783
//   .rst_b               (cpurst_b             ), @784
//   .fifo_create_en      (wbq_create_en        ), @785
//   .fifo_create_en_dp   (wbq_create_en        ), @786
//   .fifo_pop_en         (wbq_pop_en           ), @787
//   .fifo_create_data    (wbq_create_bus       ), @788
//   .fifo_pop_data       (wbq_pop_bus          ), @789
//   .fifo_pop_data_vld   (wbq_pop_bus_vld      ), @790
//   .fifo_full           (wbq_full             ), @791
//   .fifo_empty          (wbq_empty            ), @792
//   .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ), @793
//   .fifo_icg_en           (ciu_icg_en) @794
// ); @795

assign wbq_pop_mid[2:0]   = wbq_pop_bus[BID_7  : BID_5];    
assign wbq_pop_bid[4:0]   = wbq_pop_bus[BID_4  : BID_0];
assign wbq_pop_bresp[1:0] = wbq_pop_bus[BRESP_1: BRESP_0];

assign ncq_piu0_bvalid = wbq_pop_bus_vld && (wbq_pop_mid[2:0] == 3'b000);
assign ncq_piu1_bvalid = wbq_pop_bus_vld && (wbq_pop_mid[2:0] == 3'b001);
assign ncq_piu2_bvalid = wbq_pop_bus_vld && (wbq_pop_mid[2:0] == 3'b010);
assign ncq_piu3_bvalid = wbq_pop_bus_vld && (wbq_pop_mid[2:0] == 3'b011);

parameter BUSW   = 14;
assign ncq_piu_bbus[BUSW-1:0] = {1'b1,6'b0,wbq_pop_bid[4:0], wbq_pop_bresp[1:0]};

assign ncq_piu0_bbus[BUSW-1:0] = ncq_piu_bbus[BUSW-1:0];
assign ncq_piu1_bbus[BUSW-1:0] = ncq_piu_bbus[BUSW-1:0];
assign ncq_piu2_bbus[BUSW-1:0] = ncq_piu_bbus[BUSW-1:0];
assign ncq_piu3_bbus[BUSW-1:0] = ncq_piu_bbus[BUSW-1:0];

//==============================================================================
//                               BAR 
//==============================================================================
parameter PIU_NUM = 4;

// &Force("bus","bmbif_ncq_req_bus",8,0); @819
// &Force("bus","bmbif_ncq_mid",2,0); @820

assign bmbif_ncq_shareable = bmbif_ncq_req_bus[1:0] != 2'b00;

always @(posedge ncqbarclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    for(i=0; i<PIU_NUM; i=i+1)
      ncq_bar_vld[i] <= 1'b0;
  end
  else 
  begin
    for(i=0; i<PIU_NUM; i=i+1)
    begin
      if (bmbif_ncq_bar_req && (bmbif_ncq_mid[1:0] == i))
        ncq_bar_vld[i] <= 1'b1;
      else if (ncq_piu_bar_cmplt[i])
        ncq_bar_vld[i] <= 1'b0;
      else
        ncq_bar_vld[i] <= ncq_bar_vld[i];
    end
  end
end

always @(posedge ncqbarclk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    for(i=0; i<PIU_NUM; i=i+1)
      ncq_bar_sh[i] <= 1'b0;    
  end
  else
  begin
    for(i=0; i<PIU_NUM; i=i+1)
    begin
      if (bmbif_ncq_bar_req && (bmbif_ncq_mid[1:0] == i))
        ncq_bar_sh[i] <= bmbif_ncq_shareable;
      else
        ncq_bar_sh[i] <= ncq_bar_sh[i];
    end
  end
end

assign ncq_bar_ar_ostd_cnt_piu3[4:0] = 5'b0;
assign ncq_bar_aw_ostd_cnt_piu3[4:0] = 5'b0;

assign ncq_bar_ar_ostd_cnt_piu2[4:0] = 5'b0;
assign ncq_bar_aw_ostd_cnt_piu2[4:0] = 5'b0;

assign ncq_bar_piu1_cnt_create_en = bmbif_ncq_bar_req & (bmbif_ncq_mid[1:0] == 2'b01);

assign ncq_bar_piu1_arcnt_pop_en = (piu_r_grant[1] | ncq_bar_sh[1] & rdq_pop_en) & !(ncq_bar_ar_ostd_cnt_piu1[4:0] == 5'b0);
assign ncq_bar_piu1_awcnt_pop_en = (piu_b_grant[1] | ncq_bar_sh[1] & wbq_pop_en) & !(ncq_bar_aw_ostd_cnt_piu1[4:0] == 5'b0);

assign ncq_ar_ostd_cnt_piu1_final[4:0] = piu_r_grant[1] ? ncq_ar_ostd_cnt_piu1_dec[4:0] : ncq_ar_ostd_cnt_piu1[4:0];
assign ncq_aw_ostd_cnt_piu1_final[4:0] = piu_b_grant[1] ? ncq_aw_ostd_cnt_piu1_dec[4:0] : ncq_aw_ostd_cnt_piu1[4:0];

always @(posedge ncq_barcnt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_bar_ar_ostd_cnt_piu1[4:0] <= 5'b0;
  else if (ncq_bar_piu1_cnt_create_en)
    ncq_bar_ar_ostd_cnt_piu1[4:0] <= bmbif_ncq_shareable ? ncq_total_ar_ostd_cnt_final[4:0] : ncq_ar_ostd_cnt_piu1_final[4:0];
  else if (ncq_bar_piu1_arcnt_pop_en)
    ncq_bar_ar_ostd_cnt_piu1[4:0] <= ncq_bar_ar_ostd_cnt_piu1[4:0] - 5'b1;
end

always @(posedge ncq_barcnt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_bar_aw_ostd_cnt_piu1[4:0] <= 5'b0;
  else if (ncq_bar_piu1_cnt_create_en)
    ncq_bar_aw_ostd_cnt_piu1[4:0] <= bmbif_ncq_shareable ? ncq_total_aw_ostd_cnt_final[4:0] : ncq_aw_ostd_cnt_piu1_final[4:0];
  else if (ncq_bar_piu1_awcnt_pop_en)
    ncq_bar_aw_ostd_cnt_piu1[4:0] <= ncq_bar_aw_ostd_cnt_piu1[4:0] - 5'b1;
end


assign ncq_bar_piu0_cnt_create_en = bmbif_ncq_bar_req & (bmbif_ncq_mid[1:0] == 2'b00);

assign ncq_bar_piu0_arcnt_pop_en = (piu_r_grant[0] | ncq_bar_sh[0] & rdq_pop_en) & !(ncq_bar_ar_ostd_cnt_piu0[4:0] == 5'b0);
assign ncq_bar_piu0_awcnt_pop_en = (piu_b_grant[0] | ncq_bar_sh[0] & wbq_pop_en) & !(ncq_bar_aw_ostd_cnt_piu0[4:0] == 5'b0);

assign ncq_ar_ostd_cnt_piu0_final[4:0] = piu_r_grant[0] ? ncq_ar_ostd_cnt_piu0_dec[4:0] : ncq_ar_ostd_cnt_piu0[4:0];
assign ncq_aw_ostd_cnt_piu0_final[4:0] = piu_b_grant[0] ? ncq_aw_ostd_cnt_piu0_dec[4:0] : ncq_aw_ostd_cnt_piu0[4:0];

always @(posedge ncq_barcnt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_bar_ar_ostd_cnt_piu0[4:0] <= 5'b0;
  else if (ncq_bar_piu0_cnt_create_en)
    ncq_bar_ar_ostd_cnt_piu0[4:0] <= bmbif_ncq_shareable ? ncq_total_ar_ostd_cnt_final[4:0] : ncq_ar_ostd_cnt_piu0_final[4:0];
  else if (ncq_bar_piu0_arcnt_pop_en)
    ncq_bar_ar_ostd_cnt_piu0[4:0] <= ncq_bar_ar_ostd_cnt_piu0[4:0] - 5'b1;
end

always @(posedge ncq_barcnt_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_bar_aw_ostd_cnt_piu0[4:0] <= 5'b0;
  else if (ncq_bar_piu0_cnt_create_en)
    ncq_bar_aw_ostd_cnt_piu0[4:0] <= bmbif_ncq_shareable ? ncq_total_aw_ostd_cnt_final[4:0] : ncq_aw_ostd_cnt_piu0_final[4:0];
  else if (ncq_bar_piu0_awcnt_pop_en)
    ncq_bar_aw_ostd_cnt_piu0[4:0] <= ncq_bar_aw_ostd_cnt_piu0[4:0] - 5'b1;
end




always @(posedge ncqrdclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_ar_ostd_cnt_piu1[4:0] <= 5'b0;
  else if (raq_create_en && (raq_create_mid[1:0] == 2'b01) && !piu_r_grant[1])
    ncq_ar_ostd_cnt_piu1[4:0] <= ncq_ar_ostd_cnt_piu1[4:0] + 5'b1;
  else if (!(raq_create_en && (raq_create_mid[1:0] == 2'b01)) && piu_r_grant[1])
    ncq_ar_ostd_cnt_piu1[4:0] <= ncq_ar_ostd_cnt_piu1[4:0] - 5'b1;
  else
    ncq_ar_ostd_cnt_piu1[4:0] <= ncq_ar_ostd_cnt_piu1[4:0];
end
assign ncq_ar_ostd_cnt_piu1_dec[4:0] =  ncq_ar_ostd_cnt_piu1[4:0] - 5'b1;

always @(posedge ncqwtclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_aw_ostd_cnt_piu1[4:0] <= 5'b0;
  else if (waq_create_en && (waq_create_awid[6:5] == 2'b01) && !piu_b_grant[1])
    ncq_aw_ostd_cnt_piu1[4:0] <= ncq_aw_ostd_cnt_piu1[4:0] + 5'b1;
  else if (!(waq_create_en && (waq_create_awid[6:5] == 2'b01)) && piu_b_grant[1])
    ncq_aw_ostd_cnt_piu1[4:0] <= ncq_aw_ostd_cnt_piu1[4:0] - 5'b1;
  else
    ncq_aw_ostd_cnt_piu1[4:0] <= ncq_aw_ostd_cnt_piu1[4:0];
end
assign ncq_aw_ostd_cnt_piu1_dec[4:0] =  ncq_aw_ostd_cnt_piu1[4:0] - 5'b1;

always @(posedge ncqrdclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_ar_ostd_cnt_piu0[4:0] <= 5'b0;
  else if (raq_create_en && (raq_create_mid[1:0] == 2'b00) && !piu_r_grant[0])
    ncq_ar_ostd_cnt_piu0[4:0] <= ncq_ar_ostd_cnt_piu0[4:0] + 5'b1;
  else if (!(raq_create_en && (raq_create_mid[1:0] == 2'b00)) && piu_r_grant[0])
    ncq_ar_ostd_cnt_piu0[4:0] <= ncq_ar_ostd_cnt_piu0[4:0] - 5'b1;
  else
    ncq_ar_ostd_cnt_piu0[4:0] <= ncq_ar_ostd_cnt_piu0[4:0];
end
assign ncq_ar_ostd_cnt_piu0_dec[4:0] =  ncq_ar_ostd_cnt_piu0[4:0] - 5'b1;

always @(posedge ncqwtclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_aw_ostd_cnt_piu0[4:0] <= 5'b0;
  else if (waq_create_en && (waq_create_awid[6:5] == 2'b00) && !piu_b_grant[0])
    ncq_aw_ostd_cnt_piu0[4:0] <= ncq_aw_ostd_cnt_piu0[4:0] + 5'b1;
  else if (!(waq_create_en && (waq_create_awid[6:5] == 2'b00)) && piu_b_grant[0])
    ncq_aw_ostd_cnt_piu0[4:0] <= ncq_aw_ostd_cnt_piu0[4:0] - 5'b1;
  else
    ncq_aw_ostd_cnt_piu0[4:0] <= ncq_aw_ostd_cnt_piu0[4:0];
end
assign ncq_aw_ostd_cnt_piu0_dec[4:0] =  ncq_aw_ostd_cnt_piu0[4:0] - 5'b1;

always @(posedge ncqrdclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_total_ar_ostd_cnt[4:0] <= 5'b0;
  else if (raq_create_en && !rdq_pop_en)
    ncq_total_ar_ostd_cnt[4:0] <= ncq_total_ar_ostd_cnt[4:0] + 5'b1;
  else if (!raq_create_en && rdq_pop_en) 
    ncq_total_ar_ostd_cnt[4:0] <= ncq_total_ar_ostd_cnt_dec[4:0]; 
end

assign ncq_total_ar_ostd_cnt_dec[4:0] = ncq_total_ar_ostd_cnt[4:0] - 5'b1;

always @(posedge ncqwtclk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_total_aw_ostd_cnt[4:0] <= 5'b0;
  else if (waq_create_en && !wbq_pop_en)
    ncq_total_aw_ostd_cnt[4:0] <= ncq_total_aw_ostd_cnt[4:0] + 5'b1;
  else if (!waq_create_en && wbq_pop_en) 
    ncq_total_aw_ostd_cnt[4:0] <= ncq_total_aw_ostd_cnt_dec[4:0]; 
end

assign ncq_total_aw_ostd_cnt_dec[4:0] = ncq_total_aw_ostd_cnt[4:0] - 5'b1;

assign ncq_total_ar_ostd_cnt_final[4:0] = rdq_pop_en ? ncq_total_ar_ostd_cnt_dec[4:0] : ncq_total_ar_ostd_cnt[4:0];
assign ncq_total_aw_ostd_cnt_final[4:0] = wbq_pop_en ? ncq_total_aw_ostd_cnt_dec[4:0] : ncq_total_aw_ostd_cnt[4:0];

assign piu0_ostd_cmplt  = (ncq_bar_ar_ostd_cnt_piu0[4:0] == 5'b0) && (ncq_bar_aw_ostd_cnt_piu0[4:0] == 5'b0);
assign piu1_ostd_cmplt  = (ncq_bar_ar_ostd_cnt_piu1[4:0] == 5'b0) && (ncq_bar_aw_ostd_cnt_piu1[4:0] == 5'b0);
assign piu2_ostd_cmplt  = (ncq_bar_ar_ostd_cnt_piu2[4:0] == 5'b0) && (ncq_bar_aw_ostd_cnt_piu2[4:0] == 5'b0);
assign piu3_ostd_cmplt  = (ncq_bar_ar_ostd_cnt_piu3[4:0] == 5'b0) && (ncq_bar_aw_ostd_cnt_piu3[4:0] == 5'b0);

assign ncq_piu_bar_cmplt[0] = ncq_bar_vld[0] && 
                                 (piu0_ostd_cmplt ||
                                  ciu_chr2_bar_dis);

assign ncq_piu_bar_cmplt[1] = ncq_bar_vld[1] && 
                                 (piu1_ostd_cmplt ||
                                  ciu_chr2_bar_dis);

assign ncq_piu_bar_cmplt[2] = ncq_bar_vld[2] && 
                                 (piu2_ostd_cmplt ||
                                  ciu_chr2_bar_dis);

assign ncq_piu_bar_cmplt[3] = ncq_bar_vld[3] && 
                                 (piu3_ostd_cmplt ||
                                  ciu_chr2_bar_dis);

assign {ncq_piu3_bar_cmplt,ncq_piu2_bar_cmplt,ncq_piu1_bar_cmplt,ncq_piu0_bar_cmplt} = ncq_piu_bar_cmplt[3:0];

assign total_ar_ostd_full = &ncq_total_ar_ostd_cnt[4:0];
assign total_aw_ostd_full = &ncq_total_aw_ostd_cnt[4:0];

assign total_ostd_cmplt = (ncq_total_ar_ostd_cnt[4:0] == 5'b0) && (ncq_total_aw_ostd_cnt[4:0] == 5'b0);
assign ncq_xx_no_op = total_ostd_cmplt;
assign ncq_dbg_info[4:0] = {total_ostd_cmplt,ncq_piu_bar_cmplt[3:0]};

//==========================================================
//             gated clock
//==========================================================
assign ncq_bar_clk_en = bmbif_ncq_bar_req || (|ncq_piu_bar_cmplt[3:0]);

// &Instance("gated_clk_cell", "x_ncq_bar_gated_clk"); @1173
gated_clk_cell  x_ncq_bar_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncqbarclk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncq_bar_clk_en    ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1174
//          .external_en (1'b0), @1175
//          .global_en   (1'b1), @1176
//          .module_en   (ciu_icg_en), @1177
//          .local_en    (ncq_bar_clk_en), @1178
//          .clk_out     (ncqbarclk)); @1179

assign ncq_rd_clk_en = raq_create_en || rdq_pop_en || raq_pop_en_gate || ncq_apbif_r_grant || ncq_ebiu_r_grant;

// &Instance("gated_clk_cell", "x_ncq_rd_gated_clk"); @1183
gated_clk_cell  x_ncq_rd_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncqrdclk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncq_rd_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1184
//          .external_en (1'b0), @1185
//          .global_en   (1'b1), @1186
//          .module_en   (ciu_icg_en), @1187
//          .local_en    (ncq_rd_clk_en), @1188
//          .clk_out     (ncqrdclk)); @1189

assign ncq_wt_clk_en = waq_create_en || wbq_pop_en || waq_pop_en_gated || ncq_apbif_b_grant || ncq_ebiu_b_grant;

// &Instance("gated_clk_cell", "x_ncq_wt_gated_clk"); @1193
gated_clk_cell  x_ncq_wt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncqwtclk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncq_wt_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1194
//          .external_en (1'b0), @1195
//          .global_en   (1'b1), @1196
//          .module_en   (ciu_icg_en), @1197
//          .local_en    (ncq_wt_clk_en), @1198
//          .clk_out     (ncqwtclk)); @1199

assign ncq_barcnt_clk_en = bmbif_ncq_bar_req || rdq_pop_en || wbq_pop_en;
// &Instance("gated_clk_cell", "x_ncq_barcnt_gated_clk"); @1202
gated_clk_cell  x_ncq_barcnt_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncq_barcnt_clk    ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncq_barcnt_clk_en ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1203
//          .external_en (1'b0), @1204
//          .global_en   (1'b1), @1205
//          .module_en   (ciu_icg_en), @1206
//          .local_en    (ncq_barcnt_clk_en), @1207
//          .clk_out     (ncq_barcnt_clk)); @1208
     
// &ModuleEnd; @1210
endmodule


