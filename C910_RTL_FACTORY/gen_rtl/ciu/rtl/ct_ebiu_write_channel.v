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
module ct_ebiu_write_channel(
  ca_rd_addr_hit_cawt,
  ciu_icg_en,
  ciu_so_ostd_dis,
  clk_en,
  cpurst_b,
  ebiu_ncq_aw_grant,
  ebiu_ncq_aw_grant_gated,
  ebiu_ncq_bid,
  ebiu_ncq_bresp,
  ebiu_ncq_bvalid,
  ebiu_ncq_w_grant,
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
  ebiu_write_channel_no_op,
  ebiuif_ebiu_araddr,
  forever_cpuclk,
  nc_wo_rd_depd_ncwt,
  ncq_ebiu_awvalid,
  ncq_ebiu_b_grant,
  ncq_ebiu_wvalid,
  ncq_so_vld,
  ncq_xx_araddr,
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
  pad_ebiu_awready,
  pad_ebiu_bid,
  pad_ebiu_bresp,
  pad_ebiu_bvalid,
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

// &Ports; @24
input            ciu_icg_en;                     
input            ciu_so_ostd_dis;                
input            clk_en;                         
input            cpurst_b;                       
input   [39 :0]  ebiuif_ebiu_araddr;             
input            forever_cpuclk;                 
input            ncq_ebiu_awvalid;               
input            ncq_ebiu_b_grant;               
input            ncq_ebiu_wvalid;                
input   [39 :0]  ncq_xx_araddr;                  
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
input            pad_ebiu_awready;               
input   [7  :0]  pad_ebiu_bid;                   
input   [1  :0]  pad_ebiu_bresp;                 
input            pad_ebiu_bvalid;                
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
output  [31 :0]  ca_rd_addr_hit_cawt;            
output           ebiu_ncq_aw_grant;              
output           ebiu_ncq_aw_grant_gated;        
output  [7  :0]  ebiu_ncq_bid;                   
output  [1  :0]  ebiu_ncq_bresp;                 
output           ebiu_ncq_bvalid;                
output           ebiu_ncq_w_grant;               
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
output           ebiu_write_channel_no_op;       
output  [15 :0]  nc_wo_rd_depd_ncwt;             
output  [3  :0]  ncq_so_vld;                     
output           snb0_snpext_depd_ebiu;          
output           snb1_snpext_depd_ebiu;          

// &Regs; @25
reg              aw_vb_sel;                      
reg     [4  :0]  cawt_create_ptr;                
reg     [39 :0]  cur_waddr_buf_awaddr;           
reg     [1  :0]  cur_waddr_buf_awbar;            
reg     [1  :0]  cur_waddr_buf_awburst;          
reg     [3  :0]  cur_waddr_buf_awcache;          
reg     [1  :0]  cur_waddr_buf_awdomain;         
reg     [7  :0]  cur_waddr_buf_awid;             
reg     [7  :0]  cur_waddr_buf_awlen;            
reg              cur_waddr_buf_awlock;           
reg     [2  :0]  cur_waddr_buf_awprot;           
reg     [2  :0]  cur_waddr_buf_awsize;           
reg     [2  :0]  cur_waddr_buf_awsnoop;          
reg              cur_waddr_buf_awvalid;          
reg     [127:0]  cur_wdata_buf_wdata;            
reg              cur_wdata_buf_wlast;            
reg     [15 :0]  cur_wdata_buf_wstrb;            
reg              cur_wdata_buf_wvalid;           
reg              ebiu_pad_back;                  
reg              ebiu_pad_bready;                
reg     [4  :0]  ebiu_vb_bid;                    
reg              ebiu_vb_bvalid;                 
reg     [3  :0]  ncq_so_bus_cnt_core0;           
reg     [3  :0]  ncq_so_bus_cnt_core1;           
reg     [3  :0]  ncq_so_bus_cnt_core2;           
reg     [3  :0]  ncq_so_bus_cnt_core3;           
reg     [1  :0]  ncq_so_ex_fail_core0_cur_state; 
reg     [1  :0]  ncq_so_ex_fail_core0_next_state; 
reg     [1  :0]  ncq_so_ex_fail_core1_cur_state; 
reg     [1  :0]  ncq_so_ex_fail_core1_next_state; 
reg     [1  :0]  ncq_so_ex_fail_core2_cur_state; 
reg     [1  :0]  ncq_so_ex_fail_core2_next_state; 
reg     [1  :0]  ncq_so_ex_fail_core3_cur_state; 
reg     [1  :0]  ncq_so_ex_fail_core3_next_state; 
reg     [2  :0]  ncq_so_ex_fail_mid;             
reg     [3  :0]  ncwt_bresp_ptr;                 
reg     [3  :0]  ncwt_create_ptr;                
reg     [3  :0]  ncwt_wdata_ptr;                 
reg     [9  :0]  ncwt_wo_bus;                    
reg     [3  :0]  ncwt_wo_ex_pass_ptr_core0;      
reg     [3  :0]  ncwt_wo_ex_pass_ptr_core1;      
reg     [3  :0]  ncwt_wo_ex_pass_ptr_core2;      
reg     [3  :0]  ncwt_wo_ex_pass_ptr_core3;      
reg     [15 :0]  w_order_needissue;              
reg     [4  :0]  woq_create_ptr;                 
reg     [4  :0]  woq_pop_ptr;                    
reg     [15 :0]  wr_data_order_source;           

// &Wires; @26
wire             aw_needissue;                   
wire             awdp_clk;                       
wire             awdp_clk_en;                    
wire    [7  :0]  awid_after;                     
wire             back_vld;                       
wire    [9  :0]  bfifo_create_bus;               
wire             bfifo_create_en;                
wire             bfifo_empty;                    
wire             bfifo_full;                     
wire    [7  :0]  bfifo_pop_bid;                  
wire    [1  :0]  bfifo_pop_bresp;                
wire    [9  :0]  bfifo_pop_bus;                  
wire             bfifo_pop_bus_vld;              
wire             bfifo_pop_en;                   
wire             bready_set;                     
wire             bvalid_so;                      
wire             bvalid_vb;                      
wire             bvalid_wo;                      
wire             bvalid_wo_ex;                   
wire    [31 :0]  ca_rd_addr_hit_cawt;            
wire    [31 :0]  ca_wr_addr_hit_cawt;            
wire    [31 :0]  cawt_create_dp_en;              
wire    [31 :0]  cawt_create_en;                 
wire             cawt_ctrl_clk;                  
wire             cawt_ctrl_clk_en;               
wire             cawt_empty;                     
wire             cawt_full;                      
wire    [31 :0]  cawt_piu0_sel;                  
wire    [31 :0]  cawt_piu1_sel;                  
wire    [31 :0]  cawt_piu2_sel;                  
wire    [31 :0]  cawt_piu3_sel;                  
wire    [31 :0]  cawt_pop_en;                    
wire    [31 :0]  cawt_vld;                       
wire             ciu_icg_en;                     
wire             ciu_so_ostd_dis;                
wire             clk_en;                         
wire             cpurst_b;                       
wire             ctrl_clk;                       
wire             ctrl_clk_en;                    
wire             cur_waddr_buf_ready;            
wire             cur_wdata_buf_ready;            
wire             ebiu_ncq_aw_grant;              
wire             ebiu_ncq_aw_grant_gated;        
wire             ebiu_ncq_aw_so_grant;           
wire             ebiu_ncq_aw_so_grant_core0;     
wire             ebiu_ncq_aw_so_grant_core1;     
wire             ebiu_ncq_aw_so_grant_core2;     
wire             ebiu_ncq_aw_so_grant_core3;     
wire             ebiu_ncq_aw_so_grant_gated;     
wire             ebiu_ncq_aw_wo_grant;           
wire             ebiu_ncq_aw_wo_grant_core0;     
wire             ebiu_ncq_aw_wo_grant_core1;     
wire             ebiu_ncq_aw_wo_grant_core2;     
wire             ebiu_ncq_aw_wo_grant_core3;     
wire             ebiu_ncq_aw_wo_grant_gated;     
wire    [7  :0]  ebiu_ncq_bid;                   
wire    [1  :0]  ebiu_ncq_bresp;                 
wire             ebiu_ncq_bvalid;                
wire             ebiu_ncq_w_grant;               
wire             ebiu_ncq_w_so_grant;            
wire             ebiu_ncq_w_so_grant_core0;      
wire             ebiu_ncq_w_so_grant_core1;      
wire             ebiu_ncq_w_so_grant_core2;      
wire             ebiu_ncq_w_so_grant_core3;      
wire             ebiu_ncq_w_wo_grant;            
wire    [39 :0]  ebiu_pad_awaddr;                
wire    [1  :0]  ebiu_pad_awburst;               
wire    [3  :0]  ebiu_pad_awcache;               
wire    [7  :0]  ebiu_pad_awid;                  
wire    [7  :0]  ebiu_pad_awlen;                 
wire             ebiu_pad_awlock;                
wire    [2  :0]  ebiu_pad_awprot;                
wire    [2  :0]  ebiu_pad_awsize;                
wire             ebiu_pad_awvalid;               
wire    [127:0]  ebiu_pad_wdata;                 
wire             ebiu_pad_wlast;                 
wire    [15 :0]  ebiu_pad_wstrb;                 
wire             ebiu_pad_wvalid;                
wire             ebiu_piu0_no_op;                
wire             ebiu_piu1_no_op;                
wire             ebiu_piu2_no_op;                
wire             ebiu_piu3_no_op;                
wire             ebiu_vb_aw_grant;               
wire             ebiu_vb_aw_grant_gated;         
wire    [1  :0]  ebiu_vb_bresp;                  
wire             ebiu_vb_w_grant;                
wire             ebiu_write_channel_no_op;       
wire    [39 :0]  ebiuif_ebiu_araddr;             
wire    [9  :0]  entry0_ncwt_bus;                
wire    [9  :0]  entry10_ncwt_bus;               
wire    [9  :0]  entry11_ncwt_bus;               
wire    [9  :0]  entry12_ncwt_bus;               
wire    [9  :0]  entry13_ncwt_bus;               
wire    [9  :0]  entry14_ncwt_bus;               
wire    [9  :0]  entry15_ncwt_bus;               
wire    [9  :0]  entry1_ncwt_bus;                
wire    [9  :0]  entry2_ncwt_bus;                
wire    [9  :0]  entry3_ncwt_bus;                
wire    [9  :0]  entry4_ncwt_bus;                
wire    [9  :0]  entry5_ncwt_bus;                
wire    [9  :0]  entry6_ncwt_bus;                
wire    [9  :0]  entry7_ncwt_bus;                
wire    [9  :0]  entry8_ncwt_bus;                
wire    [9  :0]  entry9_ncwt_bus;                
wire             forever_cpuclk;                 
wire    [15 :0]  nc_wo_rd_depd_ncwt;             
wire    [15 :0]  nc_wo_wr_dped_ncwt;             
wire             ncq_aw_core0;                   
wire             ncq_aw_core1;                   
wire             ncq_aw_core2;                   
wire             ncq_aw_core3;                   
wire             ncq_aw_ex;                      
wire             ncq_aw_ex_fail;                 
wire             ncq_aw_req;                     
wire             ncq_aw_sel;                     
wire             ncq_aw_so;                      
wire             ncq_aw_wo;                      
wire             ncq_b_core0;                    
wire             ncq_b_core1;                    
wire             ncq_b_core2;                    
wire             ncq_b_core3;                    
wire             ncq_b_so;                       
wire             ncq_b_wo;                       
wire             ncq_ebiu_awvalid;               
wire             ncq_ebiu_b_grant;               
wire             ncq_ebiu_b_so_grant;            
wire             ncq_ebiu_b_so_grant_core0;      
wire             ncq_ebiu_b_so_grant_core1;      
wire             ncq_ebiu_b_so_grant_core2;      
wire             ncq_ebiu_b_so_grant_core3;      
wire             ncq_ebiu_b_wo_grant;            
wire             ncq_ebiu_wvalid;                
wire    [7  :0]  ncq_so_bid;                     
wire    [1  :0]  ncq_so_bresp;                   
wire    [7  :0]  ncq_so_bus_bid;                 
wire    [1  :0]  ncq_so_bus_bresp;               
wire             ncq_so_bus_bvalid;              
wire             ncq_so_bus_cnt_dec_core0;       
wire             ncq_so_bus_cnt_dec_core1;       
wire             ncq_so_bus_cnt_dec_core2;       
wire             ncq_so_bus_cnt_dec_core3;       
wire             ncq_so_bus_cnt_full_core0;      
wire             ncq_so_bus_cnt_full_core1;      
wire             ncq_so_bus_cnt_full_core2;      
wire             ncq_so_bus_cnt_full_core3;      
wire             ncq_so_bus_cnt_inc_core0;       
wire             ncq_so_bus_cnt_inc_core1;       
wire             ncq_so_bus_cnt_inc_core2;       
wire             ncq_so_bus_cnt_inc_core3;       
wire             ncq_so_bus_cnt_zero_core0;      
wire             ncq_so_bus_cnt_zero_core1;      
wire             ncq_so_bus_cnt_zero_core2;      
wire             ncq_so_bus_cnt_zero_core3;      
wire             ncq_so_bus_grant;               
wire             ncq_so_bvalid;                  
wire             ncq_so_clk;                     
wire             ncq_so_clk_en;                  
wire             ncq_so_empty;                   
wire    [7  :0]  ncq_so_ex_fail_bid;             
wire    [1  :0]  ncq_so_ex_fail_bresp;           
wire             ncq_so_ex_fail_bvalid;          
wire             ncq_so_ex_fail_bvalid_core0;    
wire             ncq_so_ex_fail_bvalid_core1;    
wire             ncq_so_ex_fail_bvalid_core2;    
wire             ncq_so_ex_fail_bvalid_core3;    
wire             ncq_so_ex_fail_grant;           
wire             ncq_so_ex_fail_vld_core0;       
wire             ncq_so_ex_fail_vld_core1;       
wire             ncq_so_ex_fail_vld_core2;       
wire             ncq_so_ex_fail_vld_core3;       
wire    [3  :0]  ncq_so_vld;                     
wire             ncq_w_core0;                    
wire             ncq_w_core1;                    
wire             ncq_w_core2;                    
wire             ncq_w_core3;                    
wire             ncq_w_req;                      
wire             ncq_w_so;                       
wire             ncq_w_wo;                       
wire    [7  :0]  ncq_wo_bid;                     
wire    [1  :0]  ncq_wo_bresp;                   
wire             ncq_wo_bvalid;                  
wire             ncq_wo_clk;                     
wire             ncq_wo_clk_en;                  
wire    [39 :0]  ncq_xx_araddr;                  
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
wire    [15 :0]  ncwt_bresp_accept_en;           
wire    [3  :0]  ncwt_bus_bresp_ptr;             
wire    [15 :0]  ncwt_bus_bresp_updt_en;         
wire    [15 :0]  ncwt_bvalid;                    
wire    [15 :0]  ncwt_create_dp_en;              
wire    [15 :0]  ncwt_create_en;                 
wire             ncwt_ctrl_clk;                  
wire             ncwt_ctrl_clk_en;               
wire             ncwt_empty;                     
wire             ncwt_full;                      
wire    [15 :0]  ncwt_piu0_sel;                  
wire    [15 :0]  ncwt_piu1_sel;                  
wire    [15 :0]  ncwt_piu2_sel;                  
wire    [15 :0]  ncwt_piu3_sel;                  
wire    [15 :0]  ncwt_vld;                       
wire    [15 :0]  ncwt_wdata_create_en;           
wire             pad_ebiu_awready;               
wire    [7  :0]  pad_ebiu_bid;                   
wire    [1  :0]  pad_ebiu_bresp;                 
wire             pad_ebiu_bvalid;                
wire             pad_ebiu_wready;                
wire             pad_yy_icg_scan_en;             
wire    [31 :0]  snb0_snpext_addr_hit_cawt;      
wire             snb0_snpext_depd_ebiu;          
wire    [7  :0]  snb0_yy_snpext_index;           
wire    [31 :0]  snb1_snpext_addr_hit_cawt;      
wire             snb1_snpext_depd_ebiu;          
wire    [7  :0]  snb1_yy_snpext_index;           
wire             vb_aw_req;                      
wire             vb_aw_sel;                      
wire             vb_b_clk;                       
wire             vb_b_clk_en;                    
wire    [39 :0]  vb_ebiu_awaddr;                 
wire    [1  :0]  vb_ebiu_awbar;                  
wire    [1  :0]  vb_ebiu_awburst;                
wire    [3  :0]  vb_ebiu_awcache;                
wire    [1  :0]  vb_ebiu_awdomain;               
wire    [7  :0]  vb_ebiu_awlen;                  
wire             vb_ebiu_awlock;                 
wire    [2  :0]  vb_ebiu_awprot;                 
wire    [2  :0]  vb_ebiu_awsize;                 
wire    [2  :0]  vb_ebiu_awsnoop;                
wire             vb_ebiu_awvalid;                
wire    [2  :0]  vb_ebiu_mid;                    
wire    [127:0]  vb_ebiu_wdata;                  
wire    [5  :0]  vb_ebiu_wid;                    
wire             vb_ebiu_wlast;                  
wire    [15 :0]  vb_ebiu_wstrb;                  
wire             vb_ebiu_wvalid;                 
wire             vb_w_req;                       
wire             w_needissue;                    
wire             w_needissue_pre;                
wire             wdp_clk;                        
wire             wdp_clk_en;                     
wire             wlast;                          
wire    [3  :0]  wo_ex_pass_bid;                 
wire             woq_empty;                      
wire             woq_full;                       
wire             wr_data_create_en;              
wire             wr_data_pop_en;                 
wire             wr_data_sel_ncq;                
wire             wr_data_sel_vb;                 
wire             wr_req_create_en;               
wire             wr_req_pop_en;                  


parameter ADDRW    = `PA_WIDTH;
parameter SO_ID    = 5'b11101;
parameter WO_EX_ID = 5'b11110;

assign snb0_snpext_depd_ebiu = |snb0_snpext_addr_hit_cawt[31:0];
assign snb1_snpext_depd_ebiu = |snb1_snpext_addr_hit_cawt[31:0];

//==========================================================
//          write address channel
//==========================================================
//--------------------------------------
//    request arbiter
//--------------------------------------
//SO: not check address dependency, for requests from the same core ,the awid is the same,
//slave should make sure return bvalid in-order; for requests from different
//core, software should make sure not access same IP device at the same time.
//WO: should check address dependency.
assign ncq_aw_wo      = ncq_xx_awcache[1];
assign ncq_aw_so      = !ncq_xx_awcache[1];
assign ncq_aw_ex      = ncq_xx_awlock;
assign ncq_aw_ex_fail = ncq_aw_ex && !ncq_xx_aw_needissue;

assign ncq_aw_req = ncq_aw_sel &&
                   (ncq_aw_wo && !ncwt_full && !(|nc_wo_wr_dped_ncwt[15:0]) || //WO
                    ncq_aw_so && (ncq_aw_ex_fail && ncq_so_ex_fail_grant ||
                                 !ncq_aw_ex_fail && ncq_so_bus_grant));       //SO

assign vb_aw_req = vb_aw_sel &&
                   !cawt_full &&
                   !(|ca_wr_addr_hit_cawt[31:0]);

assign ncq_aw_sel = ncq_ebiu_awvalid &&
                   (!aw_vb_sel || !vb_ebiu_awvalid);

assign vb_aw_sel = vb_ebiu_awvalid &&
                   (aw_vb_sel || !ncq_ebiu_awvalid);

always @(posedge ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    aw_vb_sel <= 1'b0;
  else if (clk_en & (ncq_ebiu_awvalid || vb_ebiu_awvalid))
    aw_vb_sel <= !aw_vb_sel;
  else
    aw_vb_sel <= aw_vb_sel;
end

//==========================================================
//           write addr channel                        
//cur_waddr_buf:
//| cur_waddr_buf_awvalid | cur_raddr_buf_awid | cur_raddr_buf_awaddr |
//|             ..._awlen |         ..._awsize |          ..._awburst |
//|            ..._awlock |        ..._awcache |           ..._awprot |
//==========================================================
// &Force("bus",   "ncq_xx_wid",7,0); @82
// &Force("output","ebiu_ncq_aw_grant"); @83
// &Force("output","ebiu_ncq_aw_grant_gated"); @84
// &Force("output","ebiu_ncq_w_grant"); @85
// &Force("output","ebiu_ncq_bid"); @86
// &Force("output", "ncq_so_vld"); @87

// &Force("input", "vb_ebiu_awid");          &Force("bus",   "vb_ebiu_awid",5,0); @89
// &Force("input", "vb_ebiu_b_grant"); @90
// &Force("output","ebiu_vb_aw_grant"); @91
// &Force("output","ebiu_vb_aw_grant_gated"); @92
// &Force("output","ebiu_vb_w_grant"); @93
// &Force("output","ebiu_vb_bvalid"); @94

assign ebiu_ncq_aw_grant_gated = clk_en && ncq_aw_sel && !woq_full;
assign ebiu_vb_aw_grant_gated  = clk_en && vb_aw_sel && !cawt_full && !woq_full;

assign ebiu_ncq_aw_grant = ncq_aw_req && cur_waddr_buf_ready && !woq_full;
assign ebiu_vb_aw_grant  = vb_aw_req && cur_waddr_buf_ready && !woq_full;

assign aw_needissue    = ncq_aw_sel ? ncq_xx_aw_needissue : (vb_ebiu_awsnoop[2:0] != 3'b100);
assign w_needissue_pre = ncq_aw_sel ? ncq_xx_aw_needissue : (vb_ebiu_awsnoop[2:0] != 3'b100);

assign wr_req_create_en = ebiu_ncq_aw_grant || ebiu_vb_aw_grant;

assign cur_waddr_buf_ready = (!cur_waddr_buf_awvalid || pad_ebiu_awready)
                           && clk_en;

assign wr_req_pop_en = cur_waddr_buf_awvalid && pad_ebiu_awready 
                     && clk_en;

always @(posedge ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cur_waddr_buf_awvalid <= 1'b0;
  else if(wr_req_create_en && aw_needissue) //for ex fail
    cur_waddr_buf_awvalid <= 1'b1;
  else if(wr_req_pop_en)
    cur_waddr_buf_awvalid <= 1'b0;
  else 
    cur_waddr_buf_awvalid <= cur_waddr_buf_awvalid;
end

assign awid_after[7:0] = (ncq_aw_so | ncq_aw_ex) ? ncq_xx_awid[7:0] : {4'b0,ncwt_create_ptr[3:0]};

always @(posedge awdp_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_waddr_buf_awaddr[ADDRW-1:0] <= {ADDRW{1'b0}};
    cur_waddr_buf_awid[7:0]         <= 8'b0;
    cur_waddr_buf_awlen[7:0]        <= 8'b0;
    cur_waddr_buf_awsize[2:0]       <= 3'b0;
    cur_waddr_buf_awburst[1:0]      <= 2'b0;
    cur_waddr_buf_awlock            <= 1'b0;
    cur_waddr_buf_awcache[3:0]      <= 4'b0;
    cur_waddr_buf_awprot[2:0]       <= 3'b0;
    cur_waddr_buf_awsnoop[2:0]      <= 3'b0;
    cur_waddr_buf_awdomain[1:0]     <= 2'b0;
    cur_waddr_buf_awbar[1:0]        <= 2'b0;
  end
  else if (wr_req_create_en && aw_needissue)
 begin
    if (ncq_aw_sel)
    begin
      cur_waddr_buf_awid[7:0]          <= awid_after[7:0];
      cur_waddr_buf_awaddr[ADDRW-1:0]  <= ncq_xx_awaddr[ADDRW-1:0];
      cur_waddr_buf_awlen[7:0]         <= ncq_xx_awlen[7:0];
      cur_waddr_buf_awsize[2:0]        <= ncq_xx_awsize[2:0];
      cur_waddr_buf_awburst[1:0]       <= ncq_xx_awburst[1:0];
      cur_waddr_buf_awlock             <= ncq_xx_awlock;
      cur_waddr_buf_awcache[3:0]       <= ncq_xx_awcache[3:0];
      cur_waddr_buf_awprot[2:0]        <= ncq_xx_awprot[2:0];
      cur_waddr_buf_awsnoop[2:0]       <= ncq_xx_awsnoop[2:0];
      cur_waddr_buf_awdomain[1:0]      <= ncq_xx_awdomain[1:0];
      cur_waddr_buf_awbar[1:0]         <= ncq_xx_awbar[1:0];
    end
    else 
    begin
      cur_waddr_buf_awid[7:0]          <= {3'b111,cawt_create_ptr[4:0]};
      cur_waddr_buf_awaddr[ADDRW-1:0]  <= vb_ebiu_awaddr[ADDRW-1:0];
      cur_waddr_buf_awlen[7:0]         <= vb_ebiu_awlen[7:0];
      cur_waddr_buf_awsize[2:0]        <= vb_ebiu_awsize[2:0];
      cur_waddr_buf_awburst[1:0]       <= vb_ebiu_awburst[1:0];
      cur_waddr_buf_awlock             <= vb_ebiu_awlock;
      cur_waddr_buf_awcache[3:0]       <= vb_ebiu_awcache[3:0];
      cur_waddr_buf_awprot[2:0]        <= vb_ebiu_awprot[2:0];
      cur_waddr_buf_awsnoop[2:0]       <= vb_ebiu_awsnoop[2:0];
      cur_waddr_buf_awdomain[1:0]      <= vb_ebiu_awdomain[1:0];
      cur_waddr_buf_awbar[1:0]         <= vb_ebiu_awbar[1:0];
    end
  end
end

assign ebiu_pad_awvalid           = cur_waddr_buf_awvalid;
assign ebiu_pad_awid[7:0]         = cur_waddr_buf_awid[7:0];
assign ebiu_pad_awlen[7:0]        = cur_waddr_buf_awlen[7:0];
assign ebiu_pad_awsize[2:0]       = cur_waddr_buf_awsize[2:0];
assign ebiu_pad_awburst[1:0]      = cur_waddr_buf_awburst[1:0];
assign ebiu_pad_awlock            = cur_waddr_buf_awlock;
assign ebiu_pad_awcache[3:0]      = cur_waddr_buf_awcache[3:0];
assign ebiu_pad_awprot[2:0]       = {cur_waddr_buf_awprot[2], 1'b1, cur_waddr_buf_awprot[0]};
assign ebiu_pad_awaddr[ADDRW-1:0] = cur_waddr_buf_awaddr[ADDRW-1:0];
// &Force("nonport","cur_waddr_buf_awsnoop"); @195
// &Force("nonport","cur_waddr_buf_awdomain"); @196
// &Force("nonport","cur_waddr_buf_awbar"); @197


//==========================================================
//           write data channel                        
// transmit write req (addr & data)
//==========================================================
parameter WD_ORDER_ENTRY = 16;

assign wlast = ncq_w_req ? ncq_xx_wlast : vb_ebiu_wlast;

always @(posedge awdp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    woq_create_ptr[4:0] <= 5'b0;
  else if (wr_req_create_en)
    woq_create_ptr[4:0]  <= woq_create_ptr[4:0] + 5'b1;
end

always @(posedge wdp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    woq_pop_ptr[4:0] <= 5'b0;
  else if (wr_data_create_en && wlast)
    woq_pop_ptr[4:0] <= woq_pop_ptr[4:0] + 5'b1;
end

assign woq_empty = woq_create_ptr[4:0] == woq_pop_ptr[4:0];
assign woq_full  = (woq_create_ptr[3:0] == woq_pop_ptr[3:0]) &&
                   (woq_create_ptr[4] ^ woq_pop_ptr[4]);

integer i;
always @(posedge awdp_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    for(i=0;i<WD_ORDER_ENTRY;i=i+1)
      wr_data_order_source[i] <= 1'b0;
  end
  else
  begin
    for(i=0;i<WD_ORDER_ENTRY;i=i+1)
    begin
      if(ebiu_ncq_aw_grant && (woq_create_ptr[3:0] == i))
        wr_data_order_source[i] <= 1'b0; // 0 stand for ncq
      else if(ebiu_vb_aw_grant && (woq_create_ptr[3:0] == i))
        wr_data_order_source[i] <= 1'b1; // 1 stand for vb
      else
        wr_data_order_source[i] <= wr_data_order_source[i];
    end
  end
end

always @(posedge awdp_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    for(i=0;i<WD_ORDER_ENTRY;i=i+1)
      w_order_needissue[i] <= 1'b1;
  end
  else 
  begin
    for(i=0;i<WD_ORDER_ENTRY;i=i+1)
    begin
      if(wr_req_create_en && (woq_create_ptr[3:0] == i))
        w_order_needissue[i] <= w_needissue_pre;
      else
        w_order_needissue[i] <= w_order_needissue[i];
    end 
  end
end

assign w_needissue     =  w_order_needissue[woq_pop_ptr[3:0]] && !woq_empty;
assign wr_data_sel_vb  =  wr_data_order_source[woq_pop_ptr[3:0]] && !woq_empty;
assign wr_data_sel_ncq = !wr_data_order_source[woq_pop_ptr[3:0]] && !woq_empty;

//--------------------------------------
//           write data channel                        
//cur_wdata_buf:
//| cur_wdata_buf_wvalid |
//| cur_wdata_buf_wdata  | cur_wdata_buf_wstrb | cur_wdata_buf_wlast |
//--------------------------------------

assign ncq_w_req = ncq_ebiu_wvalid && wr_data_sel_ncq;
assign vb_w_req  = vb_ebiu_wvalid && wr_data_sel_vb;

assign cur_wdata_buf_ready = (!cur_wdata_buf_wvalid || pad_ebiu_wready)
                            && clk_en;

assign ebiu_ncq_w_grant = ncq_w_req && cur_wdata_buf_ready;
assign ebiu_vb_w_grant  = vb_w_req && cur_wdata_buf_ready;

assign wr_data_create_en = ebiu_ncq_w_grant || ebiu_vb_w_grant;
assign wr_data_pop_en    = cur_wdata_buf_wvalid && pad_ebiu_wready 
                        && clk_en;

always @(posedge ctrl_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_wdata_buf_wvalid <= 1'b0;
  else if(wr_data_create_en && w_needissue)
    cur_wdata_buf_wvalid <= 1'b1;
  else if(wr_data_pop_en)
    cur_wdata_buf_wvalid <= 1'b0;
  else
    cur_wdata_buf_wvalid <= cur_wdata_buf_wvalid;
end

always @(posedge wdp_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_wdata_buf_wdata[127:0]  <= 128'b0;
    cur_wdata_buf_wstrb[15:0]   <= 16'b0;
    cur_wdata_buf_wlast         <= 1'b0;
  end
  else if(wr_data_create_en && w_needissue)
  begin
    if (ncq_w_req)
    begin
      cur_wdata_buf_wdata[127:0]  <= ncq_xx_wdata[127:0];
      cur_wdata_buf_wstrb[15:0]   <= ncq_xx_wstrb[15:0];
      cur_wdata_buf_wlast         <= ncq_xx_wlast;
    end
    else
    begin
      cur_wdata_buf_wdata[127:0]  <= vb_ebiu_wdata[127:0];
      cur_wdata_buf_wstrb[15:0]   <= vb_ebiu_wstrb[15:0];
      cur_wdata_buf_wlast         <= vb_ebiu_wlast;
    end
  end
end

assign ebiu_pad_wvalid       = cur_wdata_buf_wvalid;
assign ebiu_pad_wdata[127:0] = cur_wdata_buf_wdata[127:0];
assign ebiu_pad_wstrb[15:0]  = cur_wdata_buf_wstrb[15:0];
assign ebiu_pad_wlast        = cur_wdata_buf_wlast;



//==========================================================
//   return bvalid to vb
//==========================================================
assign vb_b_clk_en = ebiu_vb_w_grant && vb_ebiu_wlast || ebiu_vb_bvalid;

// &Instance("gated_clk_cell", "x_ebiu_vb_b_gated_clk"); @420
gated_clk_cell  x_ebiu_vb_b_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (vb_b_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (vb_b_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @421
//          .external_en (1'b0), @422
//          .global_en   (1'b1), @423
//          .module_en   (ciu_icg_en), @424
//          .local_en    (vb_b_clk_en), @425
//          .clk_out     (vb_b_clk)); @426

always @(posedge vb_b_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ebiu_vb_bvalid <= 1'b0;
  else if (ebiu_vb_w_grant && vb_ebiu_wlast)
    ebiu_vb_bvalid <= 1'b1;
  else if (ebiu_vb_bvalid)
    ebiu_vb_bvalid <= 1'b0;
end

// &Force("bus", "vb_ebiu_wid",5,0); @438

always @(posedge vb_b_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    ebiu_vb_bid[4:0] <= 5'b0;
  else if (ebiu_vb_w_grant && vb_ebiu_wlast)
    ebiu_vb_bid[4:0] <= vb_ebiu_wid[4:0];
end

assign ebiu_vb_bresp[1:0] = 2'b00;

//==========================================================
//           write resp channel                        
// transmit resp from bus to req source(lsu)
//cur_bresp_buf:
//| bfifo_pop_bus_vld |
//| bfifo_pop_bresp  | bfifo_pop_bid |
//==========================================================
parameter BWIDTH = 10;
// &Force("nonport", "bfifo_create_bus"); @458
// &Force("nonport", "bfifo_empty"); @459
// &Force("nonport", "bfifo_full"); @460
// &Force("nonport", "bfifo_pop_bus"); @461
// &Force("nonport", "bfifo_pop_bus_vld"); @462

assign bfifo_create_en = pad_ebiu_bvalid & ebiu_pad_bready & clk_en;

assign bfifo_create_bus[BWIDTH-1:0] = {pad_ebiu_bid[7:0],
                                       pad_ebiu_bresp[1:0]};

assign bfifo_pop_en = bfifo_pop_bus_vld & (!bvalid_so | ncq_ebiu_b_so_grant);
                           
ct_fifo #(.WIDTH(BWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ebiu_bfifo(
  .clk                 (forever_cpuclk       ),
  .rst_b               (cpurst_b             ),
  .fifo_create_en      (bfifo_create_en      ),
  .fifo_create_en_dp   (bfifo_create_en      ),
  .fifo_pop_en         (bfifo_pop_en         ),
  .fifo_create_data    (bfifo_create_bus     ),
  .fifo_pop_data       (bfifo_pop_bus        ),
  .fifo_pop_data_vld   (bfifo_pop_bus_vld    ),
  .fifo_full           (bfifo_full           ),
  .fifo_empty          (bfifo_empty          ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en         (ciu_icg_en           )
);
    
assign bfifo_pop_bid[7:0]   = bfifo_pop_bus[9:2];
assign bfifo_pop_bresp[1:0] = bfifo_pop_bus[1:0];


//--------------------------------------
//    rready
//--------------------------------------
// &Force("output", "ebiu_pad_bready"); @504

assign bready_set = bfifo_empty | 
                   ~bfifo_full & (bfifo_pop_en | ~bfifo_create_en) |
                    bfifo_full &  bfifo_pop_en & ~bfifo_create_en;

always @(posedge ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ebiu_pad_bready <= 1'b1;
  else if (clk_en)
  begin
    if (bready_set)
       ebiu_pad_bready <= 1'b1;
    else
       ebiu_pad_bready <= 1'b0;
  end
  else
    ebiu_pad_bready <= ebiu_pad_bready;
end

//--------------------------------------
//       BACK
//--------------------------------------
// &Force("output","ebiu_pad_back"); @528

always @(posedge ctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ebiu_pad_back <= 1'b0;
  else if (clk_en)
  begin
    if (bfifo_create_en)
      ebiu_pad_back <= 1'b1;
    else
      ebiu_pad_back <= 1'b0;
  end
end

assign back_vld = ebiu_pad_back;

//==============================================================================
//               strong order maintainance
//==============================================================================

assign ncq_aw_core0 = ncq_xx_awid[7:5] == 3'b000;
assign ncq_aw_core1 = ncq_xx_awid[7:5] == 3'b001;
assign ncq_aw_core2 = ncq_xx_awid[7:5] == 3'b010;
assign ncq_aw_core3 = ncq_xx_awid[7:5] == 3'b011;

assign ncq_w_so     = (ncq_xx_wid[4:0] == SO_ID);
assign ncq_w_wo     = !ncq_w_so;
assign ncq_w_core0  = ncq_xx_wid[7:5] == 3'b000;
assign ncq_w_core1  = ncq_xx_wid[7:5] == 3'b001;
assign ncq_w_core2  = ncq_xx_wid[7:5] == 3'b010;
assign ncq_w_core3  = ncq_xx_wid[7:5] == 3'b011;

assign ncq_b_core0  = ebiu_ncq_bid[7:5] == 3'b000;
assign ncq_b_core1  = ebiu_ncq_bid[7:5] == 3'b001;
assign ncq_b_core2  = ebiu_ncq_bid[7:5] == 3'b010;
assign ncq_b_core3  = ebiu_ncq_bid[7:5] == 3'b011;
assign ncq_b_so     = ebiu_ncq_bid[4:0] == SO_ID;
assign ncq_b_wo     = !ncq_b_so;

assign bvalid_vb    = bfifo_pop_bid[7:5] == 3'b111;
//assign bvalid_core0 = bfifo_pop_bid[7:5] == 3'b000;
//assign bvalid_core1 = bfifo_pop_bid[7:5] == 3'b001;
//assign bvalid_core2 = bfifo_pop_bid[7:5] == 3'b010;
//assign bvalid_core3 = bfifo_pop_bid[7:5] == 3'b011;
assign bvalid_so    = !bvalid_vb &  (bfifo_pop_bid[4:0] == SO_ID);
assign bvalid_wo    = !bvalid_vb & !(bfifo_pop_bid[4:0] == SO_ID);
assign bvalid_wo_ex = !bvalid_vb &  (bfifo_pop_bid[4:0] == WO_EX_ID);

//==========================================================
//   return bvalid to ncq
//==========================================================
// the priority of return bvalid to NCQ
// 1:SO & (!lock | lock & gm_pass)
// 2:SO & lock & gm_fail
// 3:WO

assign ebiu_ncq_bvalid     = ncq_so_bvalid | ncq_wo_bvalid;
assign ebiu_ncq_bid[7:0]   = ncq_so_bvalid ? ncq_so_bid[7:0] : ncq_wo_bid[7:0];
assign ebiu_ncq_bresp[1:0] = ncq_so_bvalid ? ncq_so_bresp[1:0] : ncq_wo_bresp[1:0];

//==============================================================================
//               strong order maintainance
//==============================================================================
assign ncq_so_bvalid     = ncq_so_bus_bvalid | ncq_so_ex_fail_bvalid;
assign ncq_so_bid[7:0]   = ncq_so_bus_bvalid ? ncq_so_bus_bid[7:0]   : ncq_so_ex_fail_bid[7:0];
assign ncq_so_bresp[1:0] = ncq_so_bus_bvalid ? ncq_so_bus_bresp[1:0] : ncq_so_ex_fail_bresp[1:0];

assign ncq_so_ex_fail_bvalid = ncq_so_ex_fail_bvalid_core0 |
                               ncq_so_ex_fail_bvalid_core1 |
                               ncq_so_ex_fail_bvalid_core2 |
                               ncq_so_ex_fail_bvalid_core3;
// &CombBeg; @600
always @( ncq_so_ex_fail_bvalid_core1
       or ncq_so_ex_fail_bvalid_core3
       or ncq_so_ex_fail_bvalid_core2
       or ncq_so_ex_fail_bvalid_core0)
begin
  casez({ncq_so_ex_fail_bvalid_core3,
         ncq_so_ex_fail_bvalid_core2,
         ncq_so_ex_fail_bvalid_core1,
         ncq_so_ex_fail_bvalid_core0})
    4'b???1: ncq_so_ex_fail_mid[2:0] = 3'b000;
    4'b??10: ncq_so_ex_fail_mid[2:0] = 3'b001;
    4'b?100: ncq_so_ex_fail_mid[2:0] = 3'b010;
    4'b1000: ncq_so_ex_fail_mid[2:0] = 3'b011;
    default: ncq_so_ex_fail_mid[2:0] = 3'b000;
  endcase
// &CombEnd; @611
end

assign ncq_so_ex_fail_bid[7:0]   = {ncq_so_ex_fail_mid[2:0],SO_ID};
assign ncq_so_ex_fail_bresp[1:0] = 2'b00;

//================================================
//             aw_grant for so
//================================================
assign ncq_so_ex_fail_grant = ncq_aw_core0 & ncq_so_bus_cnt_zero_core0 & !ncq_so_ex_fail_vld_core0 |
                              ncq_aw_core1 & ncq_so_bus_cnt_zero_core1 & !ncq_so_ex_fail_vld_core1 |
                              ncq_aw_core2 & ncq_so_bus_cnt_zero_core2 & !ncq_so_ex_fail_vld_core2 |
                              ncq_aw_core3 & ncq_so_bus_cnt_zero_core3 & !ncq_so_ex_fail_vld_core3 ;

assign ncq_so_bus_grant = ncq_aw_core0 & (ciu_so_ostd_dis & ncq_so_bus_cnt_zero_core0 | !ciu_so_ostd_dis & !ncq_so_bus_cnt_full_core0) & !ncq_so_ex_fail_vld_core0 |
                          ncq_aw_core1 & (ciu_so_ostd_dis & ncq_so_bus_cnt_zero_core1 | !ciu_so_ostd_dis & !ncq_so_bus_cnt_full_core1) & !ncq_so_ex_fail_vld_core1 |
                          ncq_aw_core2 & (ciu_so_ostd_dis & ncq_so_bus_cnt_zero_core2 | !ciu_so_ostd_dis & !ncq_so_bus_cnt_full_core2) & !ncq_so_ex_fail_vld_core2 |
                          ncq_aw_core3 & (ciu_so_ostd_dis & ncq_so_bus_cnt_zero_core3 | !ciu_so_ostd_dis & !ncq_so_bus_cnt_full_core3) & !ncq_so_ex_fail_vld_core3;

assign ebiu_ncq_aw_so_grant       = ebiu_ncq_aw_grant & ncq_aw_so;
assign ebiu_ncq_aw_so_grant_gated = ebiu_ncq_aw_grant_gated & ncq_aw_so;
assign ebiu_ncq_aw_so_grant_core0 = ebiu_ncq_aw_so_grant & ncq_aw_core0;
assign ebiu_ncq_aw_so_grant_core1 = ebiu_ncq_aw_so_grant & ncq_aw_core1;
assign ebiu_ncq_aw_so_grant_core2 = ebiu_ncq_aw_so_grant & ncq_aw_core2;
assign ebiu_ncq_aw_so_grant_core3 = ebiu_ncq_aw_so_grant & ncq_aw_core3;

assign ebiu_ncq_aw_wo_grant       = ebiu_ncq_aw_grant & ncq_aw_wo;
assign ebiu_ncq_aw_wo_grant_gated = ebiu_ncq_aw_grant_gated & ncq_aw_wo;
assign ebiu_ncq_aw_wo_grant_core0 = ebiu_ncq_aw_wo_grant & ncq_aw_core0;
assign ebiu_ncq_aw_wo_grant_core1 = ebiu_ncq_aw_wo_grant & ncq_aw_core1;
assign ebiu_ncq_aw_wo_grant_core2 = ebiu_ncq_aw_wo_grant & ncq_aw_core2;
assign ebiu_ncq_aw_wo_grant_core3 = ebiu_ncq_aw_wo_grant & ncq_aw_core3;

assign ebiu_ncq_w_wo_grant        = ebiu_ncq_w_grant & ncq_w_wo;
assign ebiu_ncq_w_so_grant        = ebiu_ncq_w_grant & ncq_w_so;
assign ebiu_ncq_w_so_grant_core0  = ebiu_ncq_w_so_grant & ncq_w_core0;
assign ebiu_ncq_w_so_grant_core1  = ebiu_ncq_w_so_grant & ncq_w_core1;
assign ebiu_ncq_w_so_grant_core2  = ebiu_ncq_w_so_grant & ncq_w_core2;
assign ebiu_ncq_w_so_grant_core3  = ebiu_ncq_w_so_grant & ncq_w_core3;

assign ncq_ebiu_b_wo_grant        = ncq_ebiu_b_grant & ncq_b_wo;
assign ncq_ebiu_b_so_grant        = ncq_ebiu_b_grant & ncq_b_so;
assign ncq_ebiu_b_so_grant_core0  = ncq_ebiu_b_so_grant & ncq_b_core0;
assign ncq_ebiu_b_so_grant_core1  = ncq_ebiu_b_so_grant & ncq_b_core1;
assign ncq_ebiu_b_so_grant_core2  = ncq_ebiu_b_so_grant & ncq_b_core2;
assign ncq_ebiu_b_so_grant_core3  = ncq_ebiu_b_so_grant & ncq_b_core3;

assign ncq_so_vld[3:0] = {ncq_so_ex_fail_vld_core3 | !ncq_so_bus_cnt_zero_core3,
                          ncq_so_ex_fail_vld_core2 | !ncq_so_bus_cnt_zero_core2,
                          ncq_so_ex_fail_vld_core1 | !ncq_so_bus_cnt_zero_core1,
                          ncq_so_ex_fail_vld_core0 | !ncq_so_bus_cnt_zero_core0};

assign ncq_so_empty = !(|ncq_so_vld[3:0]);

//================================================
//             so lock gm_fail 
//             core0
//================================================
parameter IDLE = 2'b00;
parameter WFD  = 2'b01;
parameter BVLD = 2'b10;

always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_ex_fail_core0_cur_state[1:0] <= IDLE;
  else
    ncq_so_ex_fail_core0_cur_state[1:0] <= ncq_so_ex_fail_core0_next_state[1:0];
end

// &CombBeg; @680
always @( aw_needissue
       or ncq_ebiu_b_so_grant_core0
       or ebiu_ncq_aw_so_grant_core0
       or ncq_so_ex_fail_core0_cur_state
       or ncq_so_bus_bvalid
       or ebiu_ncq_w_so_grant_core0
       or w_needissue)
begin
  case(ncq_so_ex_fail_core0_cur_state)
    IDLE: begin
      if (ebiu_ncq_aw_so_grant_core0 & !aw_needissue)
        ncq_so_ex_fail_core0_next_state = WFD;
      else
        ncq_so_ex_fail_core0_next_state = IDLE;
    end
    WFD: begin
      if (ebiu_ncq_w_so_grant_core0 & !w_needissue)
        ncq_so_ex_fail_core0_next_state = BVLD;
      else
        ncq_so_ex_fail_core0_next_state = WFD;
    end
    BVLD: begin
      if (ncq_ebiu_b_so_grant_core0 & !ncq_so_bus_bvalid)
        ncq_so_ex_fail_core0_next_state = IDLE;
      else
        ncq_so_ex_fail_core0_next_state = BVLD;
    end
    default: ncq_so_ex_fail_core0_next_state = IDLE;
  endcase
// &CombEnd; @702
end

assign ncq_so_ex_fail_vld_core0 = ncq_so_ex_fail_core0_cur_state != IDLE;
assign ncq_so_ex_fail_bvalid_core0 = ncq_so_ex_fail_core0_cur_state == BVLD;

//================================================
//             so lock gm_fail 
//             core1
//================================================
always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_ex_fail_core1_cur_state[1:0] <= IDLE;
  else
    ncq_so_ex_fail_core1_cur_state[1:0] <= ncq_so_ex_fail_core1_next_state[1:0];
end

// &CombBeg; @719
always @( aw_needissue
       or ebiu_ncq_w_so_grant_core1
       or ncq_ebiu_b_so_grant_core1
       or ebiu_ncq_aw_so_grant_core1
       or ncq_so_ex_fail_core1_cur_state
       or ncq_so_bus_bvalid
       or w_needissue)
begin
  case(ncq_so_ex_fail_core1_cur_state)
    IDLE: begin
      if (ebiu_ncq_aw_so_grant_core1 & !aw_needissue)
        ncq_so_ex_fail_core1_next_state = WFD;
      else
        ncq_so_ex_fail_core1_next_state = IDLE;
    end
    WFD: begin
      if (ebiu_ncq_w_so_grant_core1 & !w_needissue)
        ncq_so_ex_fail_core1_next_state = BVLD;
      else
        ncq_so_ex_fail_core1_next_state = WFD;
    end
    BVLD: begin
      if (ncq_ebiu_b_so_grant_core1 & !ncq_so_bus_bvalid)
        ncq_so_ex_fail_core1_next_state = IDLE;
      else
        ncq_so_ex_fail_core1_next_state = BVLD;
    end
    default: ncq_so_ex_fail_core1_next_state = IDLE;
  endcase
// &CombEnd; @741
end

assign ncq_so_ex_fail_vld_core1 = ncq_so_ex_fail_core1_cur_state != IDLE;
assign ncq_so_ex_fail_bvalid_core1 = ncq_so_ex_fail_core1_cur_state == BVLD;

//================================================
//             so lock gm_fail 
//             core2
//================================================

always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_ex_fail_core2_cur_state[1:0] <= IDLE;
  else
    ncq_so_ex_fail_core2_cur_state[1:0] <= ncq_so_ex_fail_core2_next_state[1:0];
end

// &CombBeg; @759
always @( ebiu_ncq_aw_so_grant_core2
       or aw_needissue
       or ncq_so_ex_fail_core2_cur_state
       or ebiu_ncq_w_so_grant_core2
       or ncq_so_bus_bvalid
       or w_needissue
       or ncq_ebiu_b_so_grant_core2)
begin
  case(ncq_so_ex_fail_core2_cur_state)
    IDLE: begin
      if (ebiu_ncq_aw_so_grant_core2 & !aw_needissue)
        ncq_so_ex_fail_core2_next_state = WFD;
      else
        ncq_so_ex_fail_core2_next_state = IDLE;
    end
    WFD: begin
      if (ebiu_ncq_w_so_grant_core2 & !w_needissue)
        ncq_so_ex_fail_core2_next_state = BVLD;
      else
        ncq_so_ex_fail_core2_next_state = WFD;
    end
    BVLD: begin
      if (ncq_ebiu_b_so_grant_core2 & !ncq_so_bus_bvalid)
        ncq_so_ex_fail_core2_next_state = IDLE;
      else
        ncq_so_ex_fail_core2_next_state = BVLD;
    end
    default: ncq_so_ex_fail_core2_next_state = IDLE;
  endcase
// &CombEnd; @781
end

assign ncq_so_ex_fail_vld_core2 = ncq_so_ex_fail_core2_cur_state != IDLE;
assign ncq_so_ex_fail_bvalid_core2 = ncq_so_ex_fail_core2_cur_state == BVLD;

//================================================
//             so lock gm_fail 
//             core3
//================================================

always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_ex_fail_core3_cur_state[1:0] <= IDLE;
  else
    ncq_so_ex_fail_core3_cur_state[1:0] <= ncq_so_ex_fail_core3_next_state[1:0];
end

// &CombBeg; @799
always @( ncq_so_ex_fail_core3_cur_state
       or aw_needissue
       or ebiu_ncq_aw_so_grant_core3
       or ebiu_ncq_w_so_grant_core3
       or ncq_ebiu_b_so_grant_core3
       or ncq_so_bus_bvalid
       or w_needissue)
begin
  case(ncq_so_ex_fail_core3_cur_state)
    IDLE: begin
      if (ebiu_ncq_aw_so_grant_core3 & !aw_needissue)
        ncq_so_ex_fail_core3_next_state = WFD;
      else
        ncq_so_ex_fail_core3_next_state = IDLE;
    end
    WFD: begin
      if (ebiu_ncq_w_so_grant_core3 & !w_needissue)
        ncq_so_ex_fail_core3_next_state = BVLD;
      else
        ncq_so_ex_fail_core3_next_state = WFD;
    end
    BVLD: begin
      if (ncq_ebiu_b_so_grant_core3 & !ncq_so_bus_bvalid)
        ncq_so_ex_fail_core3_next_state = IDLE;
      else
        ncq_so_ex_fail_core3_next_state = BVLD;
    end
    default: ncq_so_ex_fail_core3_next_state = IDLE;
  endcase
// &CombEnd; @821
end

assign ncq_so_ex_fail_vld_core3 = ncq_so_ex_fail_core3_cur_state != IDLE;
assign ncq_so_ex_fail_bvalid_core3 = ncq_so_ex_fail_core3_cur_state == BVLD;

//================================================
//             so counter: 
// record the number of so requests waiting for bus bresp
//================================================
assign ncq_so_bus_bvalid     = bfifo_pop_bus_vld & bvalid_so;
assign ncq_so_bus_bresp[1:0] = bfifo_pop_bresp[1:0];
assign ncq_so_bus_bid[7:0]   = bfifo_pop_bid[7:0];

assign ncq_so_bus_cnt_zero_core0 = ncq_so_bus_cnt_core0[3:0] == 4'b0000;
assign ncq_so_bus_cnt_zero_core1 = ncq_so_bus_cnt_core1[3:0] == 4'b0000;
assign ncq_so_bus_cnt_zero_core2 = ncq_so_bus_cnt_core2[3:0] == 4'b0000;
assign ncq_so_bus_cnt_zero_core3 = ncq_so_bus_cnt_core3[3:0] == 4'b0000;

assign ncq_so_bus_cnt_full_core0 = ncq_so_bus_cnt_core0[3:0] == 4'b1000;
assign ncq_so_bus_cnt_full_core1 = ncq_so_bus_cnt_core1[3:0] == 4'b1000;
assign ncq_so_bus_cnt_full_core2 = ncq_so_bus_cnt_core2[3:0] == 4'b1000;
assign ncq_so_bus_cnt_full_core3 = ncq_so_bus_cnt_core3[3:0] == 4'b1000;

assign ncq_so_bus_cnt_inc_core0 = ebiu_ncq_aw_so_grant_core0 & aw_needissue;
assign ncq_so_bus_cnt_inc_core1 = ebiu_ncq_aw_so_grant_core1 & aw_needissue;
assign ncq_so_bus_cnt_inc_core2 = ebiu_ncq_aw_so_grant_core2 & aw_needissue;
assign ncq_so_bus_cnt_inc_core3 = ebiu_ncq_aw_so_grant_core3 & aw_needissue;

assign ncq_so_bus_cnt_dec_core0 = ncq_ebiu_b_so_grant_core0 & ncq_so_bus_bvalid;
assign ncq_so_bus_cnt_dec_core1 = ncq_ebiu_b_so_grant_core1 & ncq_so_bus_bvalid;
assign ncq_so_bus_cnt_dec_core2 = ncq_ebiu_b_so_grant_core2 & ncq_so_bus_bvalid;
assign ncq_so_bus_cnt_dec_core3 = ncq_ebiu_b_so_grant_core3 & ncq_so_bus_bvalid;

always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_bus_cnt_core0[3:0] <= 4'b0;
  else if (ncq_so_bus_cnt_inc_core0 & !ncq_so_bus_cnt_dec_core0)
    ncq_so_bus_cnt_core0[3:0] <= ncq_so_bus_cnt_core0[3:0] + 4'b0001;
  else if (!ncq_so_bus_cnt_inc_core0 & ncq_so_bus_cnt_dec_core0)
    ncq_so_bus_cnt_core0[3:0] <= ncq_so_bus_cnt_core0[3:0] - 4'b0001;
end

always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_bus_cnt_core1[3:0] <= 4'b0;
  else if (ncq_so_bus_cnt_inc_core1 & !ncq_so_bus_cnt_dec_core1)
    ncq_so_bus_cnt_core1[3:0] <= ncq_so_bus_cnt_core1[3:0] + 4'b0001;
  else if (!ncq_so_bus_cnt_inc_core1 & ncq_so_bus_cnt_dec_core1)
    ncq_so_bus_cnt_core1[3:0] <= ncq_so_bus_cnt_core1[3:0] - 4'b0001;
end

always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_bus_cnt_core2[3:0] <= 4'b0;
  else if (ncq_so_bus_cnt_inc_core2 & !ncq_so_bus_cnt_dec_core2)
    ncq_so_bus_cnt_core2[3:0] <= ncq_so_bus_cnt_core2[3:0] + 4'b0001;
  else if (!ncq_so_bus_cnt_inc_core2 & ncq_so_bus_cnt_dec_core2)
    ncq_so_bus_cnt_core2[3:0] <= ncq_so_bus_cnt_core2[3:0] - 4'b0001;
end

always @(posedge ncq_so_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncq_so_bus_cnt_core3[3:0] <= 4'b0;
  else if (ncq_so_bus_cnt_inc_core3 & !ncq_so_bus_cnt_dec_core3)
    ncq_so_bus_cnt_core3[3:0] <= ncq_so_bus_cnt_core3[3:0] + 4'b0001;
  else if (!ncq_so_bus_cnt_inc_core3 & ncq_so_bus_cnt_dec_core3)
    ncq_so_bus_cnt_core3[3:0] <= ncq_so_bus_cnt_core3[3:0] - 4'b0001;
end

//==============================================================================
//            weak order noncacheable write_table maintainance
//==============================================================================
// ncwt using to record all weak order noncacheable requests
//================================================
//ncwt_create_ptr: using to receive request from NCQ
//================================================
always @(posedge ncq_wo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncwt_create_ptr[3:0] <= 4'b0;
  else if (ebiu_ncq_aw_wo_grant)
    ncwt_create_ptr[3:0] <= ncwt_create_ptr[3:0] + 4'b1;
end

assign ncwt_create_en[15:0]    = (16'b1 << ncwt_create_ptr[3:0]) & {16{ebiu_ncq_aw_wo_grant}};
assign ncwt_create_dp_en[15:0] = (16'b1 << ncwt_create_ptr[3:0]) & {16{ebiu_ncq_aw_wo_grant_gated}};

assign ncwt_full  = |((16'b1 << ncwt_create_ptr[3:0]) & ncwt_vld[15:0]);
assign ncwt_empty = !(|ncwt_vld[15:0]);

//================================================
//ncwt_wdata_ptr: using to receive wdata from NCQ
//================================================
// set fast bresponse for wo & (!lock | lock & gm_fail)
always @(posedge ncq_wo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncwt_wdata_ptr[3:0] <= 4'b0;
  else if (ebiu_ncq_w_wo_grant)
    ncwt_wdata_ptr[3:0] <= ncwt_wdata_ptr[3:0] + 4'b1;
end

assign ncwt_wdata_create_en[15:0] = (16'b1 << ncwt_wdata_ptr[3:0]) & {16{ebiu_ncq_w_wo_grant}};

//================================================
//ncwt_bresp_ptr: using to return bresp to NCQ
//================================================
always @(posedge ncq_wo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncwt_bresp_ptr[3:0] <= 4'b0;
  else if (ncq_ebiu_b_wo_grant)
    ncwt_bresp_ptr[3:0] <= ncwt_bresp_ptr[3:0] + 4'b1;
end

assign ncwt_bresp_accept_en[15:0] = (16'b1 << ncwt_bresp_ptr[3:0]) & {16{ncq_ebiu_b_wo_grant}};

// &CombBeg; @942
always @( entry1_ncwt_bus[9:0]
       or entry6_ncwt_bus[9:0]
       or entry0_ncwt_bus[9:0]
       or ncwt_bresp_ptr[3:0]
       or entry13_ncwt_bus[9:0]
       or entry11_ncwt_bus[9:0]
       or entry8_ncwt_bus[9:0]
       or entry2_ncwt_bus[9:0]
       or entry12_ncwt_bus[9:0]
       or entry9_ncwt_bus[9:0]
       or entry4_ncwt_bus[9:0]
       or entry10_ncwt_bus[9:0]
       or entry14_ncwt_bus[9:0]
       or entry5_ncwt_bus[9:0]
       or entry7_ncwt_bus[9:0]
       or entry3_ncwt_bus[9:0]
       or entry15_ncwt_bus[9:0])
begin
  case(ncwt_bresp_ptr[3:0])
    4'b0000: ncwt_wo_bus[9:0] = entry0_ncwt_bus[9:0];
    4'b0001: ncwt_wo_bus[9:0] = entry1_ncwt_bus[9:0];
    4'b0010: ncwt_wo_bus[9:0] = entry2_ncwt_bus[9:0];
    4'b0011: ncwt_wo_bus[9:0] = entry3_ncwt_bus[9:0];
    4'b0100: ncwt_wo_bus[9:0] = entry4_ncwt_bus[9:0];
    4'b0101: ncwt_wo_bus[9:0] = entry5_ncwt_bus[9:0];
    4'b0110: ncwt_wo_bus[9:0] = entry6_ncwt_bus[9:0];
    4'b0111: ncwt_wo_bus[9:0] = entry7_ncwt_bus[9:0];
    4'b1000: ncwt_wo_bus[9:0] = entry8_ncwt_bus[9:0];
    4'b1001: ncwt_wo_bus[9:0] = entry9_ncwt_bus[9:0];
    4'b1010: ncwt_wo_bus[9:0] = entry10_ncwt_bus[9:0];
    4'b1011: ncwt_wo_bus[9:0] = entry11_ncwt_bus[9:0];
    4'b1100: ncwt_wo_bus[9:0] = entry12_ncwt_bus[9:0];
    4'b1101: ncwt_wo_bus[9:0] = entry13_ncwt_bus[9:0];
    4'b1110: ncwt_wo_bus[9:0] = entry14_ncwt_bus[9:0];
    4'b1111: ncwt_wo_bus[9:0] = entry15_ncwt_bus[9:0];
    default: ncwt_wo_bus[9:0] = 10'b0;
  endcase
// &CombEnd; @962
end

assign ncq_wo_bvalid     = |((16'b1 << ncwt_bresp_ptr[3:0]) & ncwt_bvalid[15:0]);
assign ncq_wo_bid[7:0]   = ncwt_wo_bus[9:2];
assign ncq_wo_bresp[1:0] = ncwt_wo_bus[1:0];

//================================================
// NCWT POP PTR: using to receive bresp from bus
//================================================
//since WO & LOCK & GM_PASS remain sending original awid to BUS, 
//so ncwt entry ID should be hold in a specific buffer.
always @(posedge ncq_wo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncwt_wo_ex_pass_ptr_core0[3:0] <= 4'b0;
  else if (ebiu_ncq_aw_wo_grant_core0 & ncq_aw_ex & aw_needissue)
    ncwt_wo_ex_pass_ptr_core0[3:0] <= ncwt_create_ptr[3:0];
end

always @(posedge ncq_wo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncwt_wo_ex_pass_ptr_core1[3:0] <= 4'b0;
  else if (ebiu_ncq_aw_wo_grant_core1 & ncq_aw_ex & aw_needissue)
    ncwt_wo_ex_pass_ptr_core1[3:0] <= ncwt_create_ptr[3:0];
end

always @(posedge ncq_wo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncwt_wo_ex_pass_ptr_core2[3:0] <= 4'b0;
  else if (ebiu_ncq_aw_wo_grant_core2 & ncq_aw_ex & aw_needissue)
    ncwt_wo_ex_pass_ptr_core2[3:0] <= ncwt_create_ptr[3:0];
end

always @(posedge ncq_wo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ncwt_wo_ex_pass_ptr_core3[3:0] <= 4'b0;
  else if (ebiu_ncq_aw_wo_grant_core3 & ncq_aw_ex & aw_needissue)
    ncwt_wo_ex_pass_ptr_core3[3:0] <= ncwt_create_ptr[3:0];
end

assign wo_ex_pass_bid[3:0] = bfifo_pop_bid[6] 
                             ? bfifo_pop_bid[5] ? ncwt_wo_ex_pass_ptr_core3[3:0]
                                                    : ncwt_wo_ex_pass_ptr_core2[3:0]
                             : bfifo_pop_bid[5] ? ncwt_wo_ex_pass_ptr_core1[3:0]
                                                    : ncwt_wo_ex_pass_ptr_core0[3:0];

assign ncwt_bus_bresp_ptr[3:0]      = bvalid_wo_ex ? wo_ex_pass_bid[3:0] : bfifo_pop_bid[3:0];
assign ncwt_bus_bresp_updt_en[15:0] = (16'b1 << ncwt_bus_bresp_ptr[3:0]) & {16{bfifo_pop_bus_vld & bvalid_wo}};

                           
//==============================================================================
//                 ca_write_table maintance
//           using to record all weak order cacheable requests
//==============================================================================
//================================================
//cawt_create_ptr: using to receive request from SNB
//================================================
always @(posedge awdp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cawt_create_ptr[4:0] <= 5'b0;
  else if (ebiu_vb_aw_grant & aw_needissue)
    cawt_create_ptr[4:0] <= cawt_create_ptr[4:0] + 5'b1;
end

assign cawt_create_en[31:0]    = (32'b1 << cawt_create_ptr[4:0]) & {32{ebiu_vb_aw_grant & aw_needissue}};
assign cawt_create_dp_en[31:0] = (32'b1 << cawt_create_ptr[4:0]) & {32{ebiu_vb_aw_grant_gated}};

assign cawt_full = |((32'b1 << cawt_create_ptr[4:0]) & cawt_vld[31:0]);

assign cawt_empty = !(|cawt_vld[31:0]);

//================================================
// CAWT POP PTR: using to receive bresp from bus
//================================================
assign cawt_pop_en[31:0] = (32'b1 << bfifo_pop_bid[4:0]) & {32{bvalid_vb & bfifo_pop_bus_vld}};


//==========================================================
//          NO OP
//==========================================================

assign ebiu_write_channel_no_op = cawt_empty && ncwt_empty && ncq_so_empty && !back_vld;

assign ebiu_piu0_no_op = !(|(cawt_vld[31:0] & cawt_piu0_sel[31:0])) &
                         !(|(ncwt_vld[15:0] & ncwt_piu0_sel[15:0])) &
                         !ncq_so_vld[0];

assign ebiu_piu1_no_op = !(|(cawt_vld[31:0] & cawt_piu1_sel[31:0])) &
                         !(|(ncwt_vld[15:0] & ncwt_piu1_sel[15:0])) &
                         !ncq_so_vld[1];

assign ebiu_piu2_no_op = !(|(cawt_vld[31:0] & cawt_piu2_sel[31:0])) &
                         !(|(ncwt_vld[15:0] & ncwt_piu2_sel[15:0])) &
                         !ncq_so_vld[2];    

assign ebiu_piu3_no_op = !(|(cawt_vld[31:0] & cawt_piu3_sel[31:0])) &
                         !(|(ncwt_vld[15:0] & ncwt_piu3_sel[15:0])) &
                         !ncq_so_vld[3];

//==========================================================
//   NC_WT instance
//==========================================================
// &ConnRule(s/^x_/entry0_/); @1088
// &ConnRule(s/_x$/[0]/); @1089
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_0"); @1090
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_0 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[0]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[0]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[0]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[0]),
  .ncwt_bvalid_x             (ncwt_bvalid[0]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[0]     ),
  .ncwt_create_en_x          (ncwt_create_en[0]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[0]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[0]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[0]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[0]         ),
  .ncwt_vld_x                (ncwt_vld[0]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[0]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry0_ncwt_bus          )
);


// &ConnRule(s/^x_/entry1_/); @1092
// &ConnRule(s/_x$/[1]/); @1093
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_1"); @1094
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_1 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[1]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[1]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[1]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[1]),
  .ncwt_bvalid_x             (ncwt_bvalid[1]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[1]     ),
  .ncwt_create_en_x          (ncwt_create_en[1]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[1]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[1]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[1]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[1]         ),
  .ncwt_vld_x                (ncwt_vld[1]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[1]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry1_ncwt_bus          )
);


// &ConnRule(s/^x_/entry2_/); @1096
// &ConnRule(s/_x$/[2]/); @1097
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_2"); @1098
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_2 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[2]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[2]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[2]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[2]),
  .ncwt_bvalid_x             (ncwt_bvalid[2]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[2]     ),
  .ncwt_create_en_x          (ncwt_create_en[2]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[2]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[2]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[2]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[2]         ),
  .ncwt_vld_x                (ncwt_vld[2]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[2]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry2_ncwt_bus          )
);


// &ConnRule(s/^x_/entry3_/); @1100
// &ConnRule(s/_x$/[3]/); @1101
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_3"); @1102
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_3 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[3]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[3]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[3]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[3]),
  .ncwt_bvalid_x             (ncwt_bvalid[3]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[3]     ),
  .ncwt_create_en_x          (ncwt_create_en[3]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[3]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[3]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[3]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[3]         ),
  .ncwt_vld_x                (ncwt_vld[3]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[3]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry3_ncwt_bus          )
);


// &ConnRule(s/^x_/entry4_/); @1104
// &ConnRule(s/_x$/[4]/); @1105
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_4"); @1106
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_4 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[4]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[4]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[4]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[4]),
  .ncwt_bvalid_x             (ncwt_bvalid[4]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[4]     ),
  .ncwt_create_en_x          (ncwt_create_en[4]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[4]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[4]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[4]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[4]         ),
  .ncwt_vld_x                (ncwt_vld[4]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[4]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry4_ncwt_bus          )
);


// &ConnRule(s/^x_/entry5_/); @1108
// &ConnRule(s/_x$/[5]/); @1109
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_5"); @1110
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_5 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[5]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[5]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[5]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[5]),
  .ncwt_bvalid_x             (ncwt_bvalid[5]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[5]     ),
  .ncwt_create_en_x          (ncwt_create_en[5]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[5]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[5]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[5]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[5]         ),
  .ncwt_vld_x                (ncwt_vld[5]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[5]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry5_ncwt_bus          )
);


// &ConnRule(s/^x_/entry6_/); @1112
// &ConnRule(s/_x$/[6]/); @1113
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_6"); @1114
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_6 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[6]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[6]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[6]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[6]),
  .ncwt_bvalid_x             (ncwt_bvalid[6]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[6]     ),
  .ncwt_create_en_x          (ncwt_create_en[6]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[6]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[6]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[6]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[6]         ),
  .ncwt_vld_x                (ncwt_vld[6]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[6]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry6_ncwt_bus          )
);


// &ConnRule(s/^x_/entry7_/); @1116
// &ConnRule(s/_x$/[7]/); @1117
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_7"); @1118
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_7 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[7]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[7]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[7]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[7]),
  .ncwt_bvalid_x             (ncwt_bvalid[7]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[7]     ),
  .ncwt_create_en_x          (ncwt_create_en[7]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[7]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[7]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[7]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[7]         ),
  .ncwt_vld_x                (ncwt_vld[7]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[7]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry7_ncwt_bus          )
);


// &ConnRule(s/^x_/entry8_/); @1120
// &ConnRule(s/_x$/[8]/); @1121
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_8"); @1122
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_8 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[8]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[8]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[8]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[8]),
  .ncwt_bvalid_x             (ncwt_bvalid[8]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[8]     ),
  .ncwt_create_en_x          (ncwt_create_en[8]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[8]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[8]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[8]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[8]         ),
  .ncwt_vld_x                (ncwt_vld[8]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[8]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry8_ncwt_bus          )
);


// &ConnRule(s/^x_/entry9_/); @1124
// &ConnRule(s/_x$/[9]/); @1125
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_9"); @1126
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_9 (
  .aw_needissue              (aw_needissue             ),
  .bfifo_pop_bresp           (bfifo_pop_bresp          ),
  .ciu_icg_en                (ciu_icg_en               ),
  .cpurst_b                  (cpurst_b                 ),
  .forever_cpuclk            (forever_cpuclk           ),
  .nc_wo_rd_depd_ncwt_x      (nc_wo_rd_depd_ncwt[9]    ),
  .nc_wo_wr_dped_ncwt_x      (nc_wo_wr_dped_ncwt[9]    ),
  .ncq_xx_araddr             (ncq_xx_araddr            ),
  .ncq_xx_awaddr             (ncq_xx_awaddr            ),
  .ncq_xx_awid               (ncq_xx_awid              ),
  .ncwt_bresp_accept_en_x    (ncwt_bresp_accept_en[9]  ),
  .ncwt_bus_bresp_updt_en_x  (ncwt_bus_bresp_updt_en[9]),
  .ncwt_bvalid_x             (ncwt_bvalid[9]           ),
  .ncwt_create_dp_en_x       (ncwt_create_dp_en[9]     ),
  .ncwt_create_en_x          (ncwt_create_en[9]        ),
  .ncwt_ctrl_clk             (ncwt_ctrl_clk            ),
  .ncwt_piu0_sel_x           (ncwt_piu0_sel[9]         ),
  .ncwt_piu1_sel_x           (ncwt_piu1_sel[9]         ),
  .ncwt_piu2_sel_x           (ncwt_piu2_sel[9]         ),
  .ncwt_piu3_sel_x           (ncwt_piu3_sel[9]         ),
  .ncwt_vld_x                (ncwt_vld[9]              ),
  .ncwt_wdata_create_en_x    (ncwt_wdata_create_en[9]  ),
  .pad_yy_icg_scan_en        (pad_yy_icg_scan_en       ),
  .x_ncwt_bus                (entry9_ncwt_bus          )
);


// &ConnRule(s/^x_/entry10_/); @1128
// &ConnRule(s/_x$/[10]/); @1129
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_10"); @1130
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_10 (
  .aw_needissue               (aw_needissue              ),
  .bfifo_pop_bresp            (bfifo_pop_bresp           ),
  .ciu_icg_en                 (ciu_icg_en                ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .nc_wo_rd_depd_ncwt_x       (nc_wo_rd_depd_ncwt[10]    ),
  .nc_wo_wr_dped_ncwt_x       (nc_wo_wr_dped_ncwt[10]    ),
  .ncq_xx_araddr              (ncq_xx_araddr             ),
  .ncq_xx_awaddr              (ncq_xx_awaddr             ),
  .ncq_xx_awid                (ncq_xx_awid               ),
  .ncwt_bresp_accept_en_x     (ncwt_bresp_accept_en[10]  ),
  .ncwt_bus_bresp_updt_en_x   (ncwt_bus_bresp_updt_en[10]),
  .ncwt_bvalid_x              (ncwt_bvalid[10]           ),
  .ncwt_create_dp_en_x        (ncwt_create_dp_en[10]     ),
  .ncwt_create_en_x           (ncwt_create_en[10]        ),
  .ncwt_ctrl_clk              (ncwt_ctrl_clk             ),
  .ncwt_piu0_sel_x            (ncwt_piu0_sel[10]         ),
  .ncwt_piu1_sel_x            (ncwt_piu1_sel[10]         ),
  .ncwt_piu2_sel_x            (ncwt_piu2_sel[10]         ),
  .ncwt_piu3_sel_x            (ncwt_piu3_sel[10]         ),
  .ncwt_vld_x                 (ncwt_vld[10]              ),
  .ncwt_wdata_create_en_x     (ncwt_wdata_create_en[10]  ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .x_ncwt_bus                 (entry10_ncwt_bus          )
);


// &ConnRule(s/^x_/entry11_/); @1132
// &ConnRule(s/_x$/[11]/); @1133
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_11"); @1134
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_11 (
  .aw_needissue               (aw_needissue              ),
  .bfifo_pop_bresp            (bfifo_pop_bresp           ),
  .ciu_icg_en                 (ciu_icg_en                ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .nc_wo_rd_depd_ncwt_x       (nc_wo_rd_depd_ncwt[11]    ),
  .nc_wo_wr_dped_ncwt_x       (nc_wo_wr_dped_ncwt[11]    ),
  .ncq_xx_araddr              (ncq_xx_araddr             ),
  .ncq_xx_awaddr              (ncq_xx_awaddr             ),
  .ncq_xx_awid                (ncq_xx_awid               ),
  .ncwt_bresp_accept_en_x     (ncwt_bresp_accept_en[11]  ),
  .ncwt_bus_bresp_updt_en_x   (ncwt_bus_bresp_updt_en[11]),
  .ncwt_bvalid_x              (ncwt_bvalid[11]           ),
  .ncwt_create_dp_en_x        (ncwt_create_dp_en[11]     ),
  .ncwt_create_en_x           (ncwt_create_en[11]        ),
  .ncwt_ctrl_clk              (ncwt_ctrl_clk             ),
  .ncwt_piu0_sel_x            (ncwt_piu0_sel[11]         ),
  .ncwt_piu1_sel_x            (ncwt_piu1_sel[11]         ),
  .ncwt_piu2_sel_x            (ncwt_piu2_sel[11]         ),
  .ncwt_piu3_sel_x            (ncwt_piu3_sel[11]         ),
  .ncwt_vld_x                 (ncwt_vld[11]              ),
  .ncwt_wdata_create_en_x     (ncwt_wdata_create_en[11]  ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .x_ncwt_bus                 (entry11_ncwt_bus          )
);


// &ConnRule(s/^x_/entry12_/); @1136
// &ConnRule(s/_x$/[12]/); @1137
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_12"); @1138
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_12 (
  .aw_needissue               (aw_needissue              ),
  .bfifo_pop_bresp            (bfifo_pop_bresp           ),
  .ciu_icg_en                 (ciu_icg_en                ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .nc_wo_rd_depd_ncwt_x       (nc_wo_rd_depd_ncwt[12]    ),
  .nc_wo_wr_dped_ncwt_x       (nc_wo_wr_dped_ncwt[12]    ),
  .ncq_xx_araddr              (ncq_xx_araddr             ),
  .ncq_xx_awaddr              (ncq_xx_awaddr             ),
  .ncq_xx_awid                (ncq_xx_awid               ),
  .ncwt_bresp_accept_en_x     (ncwt_bresp_accept_en[12]  ),
  .ncwt_bus_bresp_updt_en_x   (ncwt_bus_bresp_updt_en[12]),
  .ncwt_bvalid_x              (ncwt_bvalid[12]           ),
  .ncwt_create_dp_en_x        (ncwt_create_dp_en[12]     ),
  .ncwt_create_en_x           (ncwt_create_en[12]        ),
  .ncwt_ctrl_clk              (ncwt_ctrl_clk             ),
  .ncwt_piu0_sel_x            (ncwt_piu0_sel[12]         ),
  .ncwt_piu1_sel_x            (ncwt_piu1_sel[12]         ),
  .ncwt_piu2_sel_x            (ncwt_piu2_sel[12]         ),
  .ncwt_piu3_sel_x            (ncwt_piu3_sel[12]         ),
  .ncwt_vld_x                 (ncwt_vld[12]              ),
  .ncwt_wdata_create_en_x     (ncwt_wdata_create_en[12]  ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .x_ncwt_bus                 (entry12_ncwt_bus          )
);


// &ConnRule(s/^x_/entry13_/); @1140
// &ConnRule(s/_x$/[13]/);  @1141
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_13"); @1142
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_13 (
  .aw_needissue               (aw_needissue              ),
  .bfifo_pop_bresp            (bfifo_pop_bresp           ),
  .ciu_icg_en                 (ciu_icg_en                ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .nc_wo_rd_depd_ncwt_x       (nc_wo_rd_depd_ncwt[13]    ),
  .nc_wo_wr_dped_ncwt_x       (nc_wo_wr_dped_ncwt[13]    ),
  .ncq_xx_araddr              (ncq_xx_araddr             ),
  .ncq_xx_awaddr              (ncq_xx_awaddr             ),
  .ncq_xx_awid                (ncq_xx_awid               ),
  .ncwt_bresp_accept_en_x     (ncwt_bresp_accept_en[13]  ),
  .ncwt_bus_bresp_updt_en_x   (ncwt_bus_bresp_updt_en[13]),
  .ncwt_bvalid_x              (ncwt_bvalid[13]           ),
  .ncwt_create_dp_en_x        (ncwt_create_dp_en[13]     ),
  .ncwt_create_en_x           (ncwt_create_en[13]        ),
  .ncwt_ctrl_clk              (ncwt_ctrl_clk             ),
  .ncwt_piu0_sel_x            (ncwt_piu0_sel[13]         ),
  .ncwt_piu1_sel_x            (ncwt_piu1_sel[13]         ),
  .ncwt_piu2_sel_x            (ncwt_piu2_sel[13]         ),
  .ncwt_piu3_sel_x            (ncwt_piu3_sel[13]         ),
  .ncwt_vld_x                 (ncwt_vld[13]              ),
  .ncwt_wdata_create_en_x     (ncwt_wdata_create_en[13]  ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .x_ncwt_bus                 (entry13_ncwt_bus          )
);


// &ConnRule(s/^x_/entry14_/); @1144
// &ConnRule(s/_x$/[14]/); @1145
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_14"); @1146
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_14 (
  .aw_needissue               (aw_needissue              ),
  .bfifo_pop_bresp            (bfifo_pop_bresp           ),
  .ciu_icg_en                 (ciu_icg_en                ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .nc_wo_rd_depd_ncwt_x       (nc_wo_rd_depd_ncwt[14]    ),
  .nc_wo_wr_dped_ncwt_x       (nc_wo_wr_dped_ncwt[14]    ),
  .ncq_xx_araddr              (ncq_xx_araddr             ),
  .ncq_xx_awaddr              (ncq_xx_awaddr             ),
  .ncq_xx_awid                (ncq_xx_awid               ),
  .ncwt_bresp_accept_en_x     (ncwt_bresp_accept_en[14]  ),
  .ncwt_bus_bresp_updt_en_x   (ncwt_bus_bresp_updt_en[14]),
  .ncwt_bvalid_x              (ncwt_bvalid[14]           ),
  .ncwt_create_dp_en_x        (ncwt_create_dp_en[14]     ),
  .ncwt_create_en_x           (ncwt_create_en[14]        ),
  .ncwt_ctrl_clk              (ncwt_ctrl_clk             ),
  .ncwt_piu0_sel_x            (ncwt_piu0_sel[14]         ),
  .ncwt_piu1_sel_x            (ncwt_piu1_sel[14]         ),
  .ncwt_piu2_sel_x            (ncwt_piu2_sel[14]         ),
  .ncwt_piu3_sel_x            (ncwt_piu3_sel[14]         ),
  .ncwt_vld_x                 (ncwt_vld[14]              ),
  .ncwt_wdata_create_en_x     (ncwt_wdata_create_en[14]  ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .x_ncwt_bus                 (entry14_ncwt_bus          )
);


// &ConnRule(s/^x_/entry15_/); @1148
// &ConnRule(s/_x$/[15]/); @1149
// &Instance("ct_ebiu_ncwt_entry","x_ct_ebiu_ncwt_entry_15"); @1150
ct_ebiu_ncwt_entry  x_ct_ebiu_ncwt_entry_15 (
  .aw_needissue               (aw_needissue              ),
  .bfifo_pop_bresp            (bfifo_pop_bresp           ),
  .ciu_icg_en                 (ciu_icg_en                ),
  .cpurst_b                   (cpurst_b                  ),
  .forever_cpuclk             (forever_cpuclk            ),
  .nc_wo_rd_depd_ncwt_x       (nc_wo_rd_depd_ncwt[15]    ),
  .nc_wo_wr_dped_ncwt_x       (nc_wo_wr_dped_ncwt[15]    ),
  .ncq_xx_araddr              (ncq_xx_araddr             ),
  .ncq_xx_awaddr              (ncq_xx_awaddr             ),
  .ncq_xx_awid                (ncq_xx_awid               ),
  .ncwt_bresp_accept_en_x     (ncwt_bresp_accept_en[15]  ),
  .ncwt_bus_bresp_updt_en_x   (ncwt_bus_bresp_updt_en[15]),
  .ncwt_bvalid_x              (ncwt_bvalid[15]           ),
  .ncwt_create_dp_en_x        (ncwt_create_dp_en[15]     ),
  .ncwt_create_en_x           (ncwt_create_en[15]        ),
  .ncwt_ctrl_clk              (ncwt_ctrl_clk             ),
  .ncwt_piu0_sel_x            (ncwt_piu0_sel[15]         ),
  .ncwt_piu1_sel_x            (ncwt_piu1_sel[15]         ),
  .ncwt_piu2_sel_x            (ncwt_piu2_sel[15]         ),
  .ncwt_piu3_sel_x            (ncwt_piu3_sel[15]         ),
  .ncwt_vld_x                 (ncwt_vld[15]              ),
  .ncwt_wdata_create_en_x     (ncwt_wdata_create_en[15]  ),
  .pad_yy_icg_scan_en         (pad_yy_icg_scan_en        ),
  .x_ncwt_bus                 (entry15_ncwt_bus          )
);



//==========================================================
//   CA_WT instance
//==========================================================

// &ConnRule(s/_x$/[0]/); @1157
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_0"); @1158
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_0 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[0]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[0]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[0]        ),
  .cawt_create_en_x             (cawt_create_en[0]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[0]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[0]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[0]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[0]            ),
  .cawt_pop_en_x                (cawt_pop_en[0]              ),
  .cawt_vld_x                   (cawt_vld[0]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[0]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[0]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[1]/); @1160
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_1"); @1161
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_1 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[1]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[1]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[1]        ),
  .cawt_create_en_x             (cawt_create_en[1]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[1]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[1]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[1]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[1]            ),
  .cawt_pop_en_x                (cawt_pop_en[1]              ),
  .cawt_vld_x                   (cawt_vld[1]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[1]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[1]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[2]/); @1163
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_2"); @1164
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_2 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[2]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[2]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[2]        ),
  .cawt_create_en_x             (cawt_create_en[2]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[2]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[2]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[2]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[2]            ),
  .cawt_pop_en_x                (cawt_pop_en[2]              ),
  .cawt_vld_x                   (cawt_vld[2]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[2]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[2]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[3]/); @1166
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_3"); @1167
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_3 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[3]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[3]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[3]        ),
  .cawt_create_en_x             (cawt_create_en[3]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[3]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[3]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[3]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[3]            ),
  .cawt_pop_en_x                (cawt_pop_en[3]              ),
  .cawt_vld_x                   (cawt_vld[3]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[3]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[3]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[4]/); @1169
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_4"); @1170
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_4 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[4]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[4]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[4]        ),
  .cawt_create_en_x             (cawt_create_en[4]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[4]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[4]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[4]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[4]            ),
  .cawt_pop_en_x                (cawt_pop_en[4]              ),
  .cawt_vld_x                   (cawt_vld[4]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[4]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[4]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[5]/); @1172
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_5"); @1173
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_5 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[5]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[5]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[5]        ),
  .cawt_create_en_x             (cawt_create_en[5]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[5]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[5]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[5]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[5]            ),
  .cawt_pop_en_x                (cawt_pop_en[5]              ),
  .cawt_vld_x                   (cawt_vld[5]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[5]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[5]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[6]/); @1175
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_6"); @1176
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_6 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[6]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[6]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[6]        ),
  .cawt_create_en_x             (cawt_create_en[6]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[6]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[6]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[6]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[6]            ),
  .cawt_pop_en_x                (cawt_pop_en[6]              ),
  .cawt_vld_x                   (cawt_vld[6]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[6]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[6]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[7]/); @1178
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_7"); @1179
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_7 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[7]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[7]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[7]        ),
  .cawt_create_en_x             (cawt_create_en[7]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[7]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[7]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[7]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[7]            ),
  .cawt_pop_en_x                (cawt_pop_en[7]              ),
  .cawt_vld_x                   (cawt_vld[7]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[7]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[7]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[8]/); @1181
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_8"); @1182
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_8 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[8]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[8]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[8]        ),
  .cawt_create_en_x             (cawt_create_en[8]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[8]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[8]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[8]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[8]            ),
  .cawt_pop_en_x                (cawt_pop_en[8]              ),
  .cawt_vld_x                   (cawt_vld[8]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[8]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[8]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[9]/); @1184
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_9"); @1185
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_9 (
  .ca_rd_addr_hit_cawt_x        (ca_rd_addr_hit_cawt[9]      ),
  .ca_wr_addr_hit_cawt_x        (ca_wr_addr_hit_cawt[9]      ),
  .cawt_create_dp_en_x          (cawt_create_dp_en[9]        ),
  .cawt_create_en_x             (cawt_create_en[9]           ),
  .cawt_ctrl_clk                (cawt_ctrl_clk               ),
  .cawt_piu0_sel_x              (cawt_piu0_sel[9]            ),
  .cawt_piu1_sel_x              (cawt_piu1_sel[9]            ),
  .cawt_piu2_sel_x              (cawt_piu2_sel[9]            ),
  .cawt_piu3_sel_x              (cawt_piu3_sel[9]            ),
  .cawt_pop_en_x                (cawt_pop_en[9]              ),
  .cawt_vld_x                   (cawt_vld[9]                 ),
  .ciu_icg_en                   (ciu_icg_en                  ),
  .cpurst_b                     (cpurst_b                    ),
  .ebiuif_ebiu_araddr           (ebiuif_ebiu_araddr          ),
  .forever_cpuclk               (forever_cpuclk              ),
  .pad_yy_icg_scan_en           (pad_yy_icg_scan_en          ),
  .snb0_snpext_addr_hit_cawt_x  (snb0_snpext_addr_hit_cawt[9]),
  .snb0_yy_snpext_index         (snb0_yy_snpext_index        ),
  .snb1_snpext_addr_hit_cawt_x  (snb1_snpext_addr_hit_cawt[9]),
  .snb1_yy_snpext_index         (snb1_yy_snpext_index        ),
  .vb_ebiu_awaddr               (vb_ebiu_awaddr              ),
  .vb_ebiu_mid                  (vb_ebiu_mid                 )
);


// &ConnRule(s/_x$/[10]/); @1187
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_10"); @1188
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_10 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[10]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[10]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[10]        ),
  .cawt_create_en_x              (cawt_create_en[10]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[10]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[10]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[10]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[10]            ),
  .cawt_pop_en_x                 (cawt_pop_en[10]              ),
  .cawt_vld_x                    (cawt_vld[10]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[10]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[10]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[11]/); @1190
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_11"); @1191
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_11 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[11]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[11]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[11]        ),
  .cawt_create_en_x              (cawt_create_en[11]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[11]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[11]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[11]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[11]            ),
  .cawt_pop_en_x                 (cawt_pop_en[11]              ),
  .cawt_vld_x                    (cawt_vld[11]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[11]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[11]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[12]/); @1193
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_12"); @1194
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_12 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[12]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[12]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[12]        ),
  .cawt_create_en_x              (cawt_create_en[12]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[12]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[12]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[12]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[12]            ),
  .cawt_pop_en_x                 (cawt_pop_en[12]              ),
  .cawt_vld_x                    (cawt_vld[12]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[12]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[12]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[13]/); @1196
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_13"); @1197
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_13 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[13]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[13]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[13]        ),
  .cawt_create_en_x              (cawt_create_en[13]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[13]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[13]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[13]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[13]            ),
  .cawt_pop_en_x                 (cawt_pop_en[13]              ),
  .cawt_vld_x                    (cawt_vld[13]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[13]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[13]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[14]/); @1199
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_14"); @1200
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_14 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[14]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[14]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[14]        ),
  .cawt_create_en_x              (cawt_create_en[14]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[14]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[14]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[14]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[14]            ),
  .cawt_pop_en_x                 (cawt_pop_en[14]              ),
  .cawt_vld_x                    (cawt_vld[14]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[14]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[14]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[15]/); @1202
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_15"); @1203
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_15 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[15]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[15]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[15]        ),
  .cawt_create_en_x              (cawt_create_en[15]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[15]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[15]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[15]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[15]            ),
  .cawt_pop_en_x                 (cawt_pop_en[15]              ),
  .cawt_vld_x                    (cawt_vld[15]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[15]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[15]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[16]/); @1205
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_16"); @1206
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_16 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[16]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[16]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[16]        ),
  .cawt_create_en_x              (cawt_create_en[16]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[16]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[16]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[16]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[16]            ),
  .cawt_pop_en_x                 (cawt_pop_en[16]              ),
  .cawt_vld_x                    (cawt_vld[16]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[16]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[16]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[17]/); @1208
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_17"); @1209
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_17 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[17]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[17]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[17]        ),
  .cawt_create_en_x              (cawt_create_en[17]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[17]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[17]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[17]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[17]            ),
  .cawt_pop_en_x                 (cawt_pop_en[17]              ),
  .cawt_vld_x                    (cawt_vld[17]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[17]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[17]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[18]/); @1211
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_18"); @1212
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_18 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[18]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[18]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[18]        ),
  .cawt_create_en_x              (cawt_create_en[18]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[18]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[18]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[18]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[18]            ),
  .cawt_pop_en_x                 (cawt_pop_en[18]              ),
  .cawt_vld_x                    (cawt_vld[18]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[18]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[18]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[19]/); @1214
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_19"); @1215
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_19 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[19]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[19]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[19]        ),
  .cawt_create_en_x              (cawt_create_en[19]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[19]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[19]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[19]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[19]            ),
  .cawt_pop_en_x                 (cawt_pop_en[19]              ),
  .cawt_vld_x                    (cawt_vld[19]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[19]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[19]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[20]/); @1217
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_20"); @1218
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_20 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[20]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[20]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[20]        ),
  .cawt_create_en_x              (cawt_create_en[20]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[20]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[20]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[20]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[20]            ),
  .cawt_pop_en_x                 (cawt_pop_en[20]              ),
  .cawt_vld_x                    (cawt_vld[20]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[20]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[20]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[21]/); @1220
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_21"); @1221
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_21 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[21]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[21]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[21]        ),
  .cawt_create_en_x              (cawt_create_en[21]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[21]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[21]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[21]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[21]            ),
  .cawt_pop_en_x                 (cawt_pop_en[21]              ),
  .cawt_vld_x                    (cawt_vld[21]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[21]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[21]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[22]/); @1223
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_22"); @1224
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_22 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[22]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[22]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[22]        ),
  .cawt_create_en_x              (cawt_create_en[22]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[22]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[22]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[22]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[22]            ),
  .cawt_pop_en_x                 (cawt_pop_en[22]              ),
  .cawt_vld_x                    (cawt_vld[22]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[22]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[22]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[23]/); @1226
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_23"); @1227
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_23 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[23]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[23]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[23]        ),
  .cawt_create_en_x              (cawt_create_en[23]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[23]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[23]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[23]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[23]            ),
  .cawt_pop_en_x                 (cawt_pop_en[23]              ),
  .cawt_vld_x                    (cawt_vld[23]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[23]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[23]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[24]/); @1229
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_24"); @1230
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_24 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[24]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[24]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[24]        ),
  .cawt_create_en_x              (cawt_create_en[24]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[24]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[24]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[24]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[24]            ),
  .cawt_pop_en_x                 (cawt_pop_en[24]              ),
  .cawt_vld_x                    (cawt_vld[24]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[24]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[24]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[25]/); @1232
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_25"); @1233
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_25 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[25]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[25]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[25]        ),
  .cawt_create_en_x              (cawt_create_en[25]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[25]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[25]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[25]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[25]            ),
  .cawt_pop_en_x                 (cawt_pop_en[25]              ),
  .cawt_vld_x                    (cawt_vld[25]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[25]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[25]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[26]/); @1235
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_26"); @1236
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_26 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[26]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[26]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[26]        ),
  .cawt_create_en_x              (cawt_create_en[26]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[26]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[26]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[26]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[26]            ),
  .cawt_pop_en_x                 (cawt_pop_en[26]              ),
  .cawt_vld_x                    (cawt_vld[26]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[26]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[26]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[27]/); @1238
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_27"); @1239
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_27 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[27]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[27]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[27]        ),
  .cawt_create_en_x              (cawt_create_en[27]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[27]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[27]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[27]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[27]            ),
  .cawt_pop_en_x                 (cawt_pop_en[27]              ),
  .cawt_vld_x                    (cawt_vld[27]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[27]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[27]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[28]/); @1241
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_28"); @1242
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_28 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[28]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[28]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[28]        ),
  .cawt_create_en_x              (cawt_create_en[28]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[28]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[28]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[28]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[28]            ),
  .cawt_pop_en_x                 (cawt_pop_en[28]              ),
  .cawt_vld_x                    (cawt_vld[28]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[28]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[28]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[29]/); @1244
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_29"); @1245
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_29 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[29]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[29]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[29]        ),
  .cawt_create_en_x              (cawt_create_en[29]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[29]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[29]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[29]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[29]            ),
  .cawt_pop_en_x                 (cawt_pop_en[29]              ),
  .cawt_vld_x                    (cawt_vld[29]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[29]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[29]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[30]/); @1247
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_30"); @1248
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_30 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[30]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[30]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[30]        ),
  .cawt_create_en_x              (cawt_create_en[30]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[30]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[30]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[30]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[30]            ),
  .cawt_pop_en_x                 (cawt_pop_en[30]              ),
  .cawt_vld_x                    (cawt_vld[30]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[30]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[30]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);


// &ConnRule(s/_x$/[31]/); @1250
// &Instance("ct_ebiu_cawt_entry","x_ct_ebiu_cawt_entry_31"); @1251
ct_ebiu_cawt_entry  x_ct_ebiu_cawt_entry_31 (
  .ca_rd_addr_hit_cawt_x         (ca_rd_addr_hit_cawt[31]      ),
  .ca_wr_addr_hit_cawt_x         (ca_wr_addr_hit_cawt[31]      ),
  .cawt_create_dp_en_x           (cawt_create_dp_en[31]        ),
  .cawt_create_en_x              (cawt_create_en[31]           ),
  .cawt_ctrl_clk                 (cawt_ctrl_clk                ),
  .cawt_piu0_sel_x               (cawt_piu0_sel[31]            ),
  .cawt_piu1_sel_x               (cawt_piu1_sel[31]            ),
  .cawt_piu2_sel_x               (cawt_piu2_sel[31]            ),
  .cawt_piu3_sel_x               (cawt_piu3_sel[31]            ),
  .cawt_pop_en_x                 (cawt_pop_en[31]              ),
  .cawt_vld_x                    (cawt_vld[31]                 ),
  .ciu_icg_en                    (ciu_icg_en                   ),
  .cpurst_b                      (cpurst_b                     ),
  .ebiuif_ebiu_araddr            (ebiuif_ebiu_araddr           ),
  .forever_cpuclk                (forever_cpuclk               ),
  .pad_yy_icg_scan_en            (pad_yy_icg_scan_en           ),
  .snb0_snpext_addr_hit_cawt_x   (snb0_snpext_addr_hit_cawt[31]),
  .snb0_yy_snpext_index          (snb0_yy_snpext_index         ),
  .snb1_snpext_addr_hit_cawt_x   (snb1_snpext_addr_hit_cawt[31]),
  .snb1_yy_snpext_index          (snb1_yy_snpext_index         ),
  .vb_ebiu_awaddr                (vb_ebiu_awaddr               ),
  .vb_ebiu_mid                   (vb_ebiu_mid                  )
);

//--------------------------------------
//      gated clock
//--------------------------------------
assign awdp_clk_en = ebiu_ncq_aw_grant_gated || ebiu_vb_aw_grant_gated;
// &Instance("gated_clk_cell", "x_ebiu_awdp_gated_clk"); @1256
gated_clk_cell  x_ebiu_awdp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (awdp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (awdp_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1257
//          .external_en (1'b0), @1258
//          .global_en   (1'b1), @1259
//          .module_en   (ciu_icg_en), @1260
//          .local_en    (awdp_clk_en), @1261
//          .clk_out     (awdp_clk)); @1262

assign wdp_clk_en = wr_data_create_en;
// &Instance("gated_clk_cell", "x_ebiu_wdp_gated_clk"); @1265
gated_clk_cell  x_ebiu_wdp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (wdp_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (wdp_clk_en        ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1266
//          .external_en (1'b0), @1267
//          .global_en   (1'b1), @1268
//          .module_en   (ciu_icg_en), @1269
//          .local_en    (wdp_clk_en), @1270
//          .clk_out     (wdp_clk)); @1271

assign ncq_so_clk_en = !ncq_so_empty || ebiu_ncq_aw_so_grant_gated;
// &Instance("gated_clk_cell", "x_ebiu_ncq_so_gated_clk"); @1274
gated_clk_cell  x_ebiu_ncq_so_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncq_so_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncq_so_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1275
//          .external_en (1'b0), @1276
//          .global_en   (1'b1), @1277
//          .module_en   (ciu_icg_en), @1278
//          .local_en    (ncq_so_clk_en), @1279
//          .clk_out     (ncq_so_clk)); @1280

assign ncq_wo_clk_en = !ncwt_empty || ebiu_ncq_aw_wo_grant_gated;
// &Instance("gated_clk_cell", "x_ebiu_ncq_wo_gated_clk"); @1283
gated_clk_cell  x_ebiu_ncq_wo_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncq_wo_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncq_wo_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1284
//          .external_en (1'b0), @1285
//          .global_en   (1'b1), @1286
//          .module_en   (ciu_icg_en), @1287
//          .local_en    (ncq_wo_clk_en), @1288
//          .clk_out     (ncq_wo_clk)); @1289

assign ctrl_clk_en = ncq_ebiu_awvalid || vb_ebiu_awvalid || wr_req_pop_en || 
                     wr_data_create_en || wr_data_pop_en ||
                     clk_en && (bready_set || ebiu_pad_bready) ||
                     bfifo_create_en || ebiu_pad_back;

// &Instance("gated_clk_cell", "x_ebiu_ctrl_gated_clk"); @1296
gated_clk_cell  x_ebiu_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ctrl_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ctrl_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1297
//          .external_en (1'b0), @1298
//          .global_en   (1'b1), @1299
//          .module_en   (ciu_icg_en), @1300
//          .local_en    (ctrl_clk_en), @1301
//          .clk_out     (ctrl_clk)); @1302

assign ncwt_ctrl_clk_en = ebiu_ncq_aw_grant_gated || !ncwt_empty;
// &Instance("gated_clk_cell", "x_ebiu_ncwt_ctrl_gated_clk"); @1305
gated_clk_cell  x_ebiu_ncwt_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ncwt_ctrl_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ncwt_ctrl_clk_en  ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1306
//          .external_en (1'b0), @1307
//          .global_en   (1'b1), @1308
//          .module_en   (ciu_icg_en), @1309
//          .local_en    (ncwt_ctrl_clk_en), @1310
//          .clk_out     (ncwt_ctrl_clk)); @1311

assign cawt_ctrl_clk_en = ebiu_vb_aw_grant_gated || bvalid_vb && bfifo_pop_bus_vld;
// &Instance("gated_clk_cell", "x_ebiu_cawt_ctrl_gated_clk"); @1314
gated_clk_cell  x_ebiu_cawt_ctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (cawt_ctrl_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (cawt_ctrl_clk_en  ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @1315
//          .external_en (1'b0), @1316
//          .global_en   (1'b1), @1317
//          .module_en   (ciu_icg_en), @1318
//          .local_en    (cawt_ctrl_clk_en), @1319
//          .clk_out     (cawt_ctrl_clk)); @1320

// &ModuleEnd; @1322
endmodule



