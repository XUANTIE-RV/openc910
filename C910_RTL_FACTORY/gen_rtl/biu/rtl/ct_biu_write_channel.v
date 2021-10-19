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
module ct_biu_write_channel(
  bcpuclk,
  biu_lsu_b_id,
  biu_lsu_b_resp,
  biu_lsu_b_vld,
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
  biu_pad_wdata,
  biu_pad_werr,
  biu_pad_wlast,
  biu_pad_wns,
  biu_pad_wstrb,
  biu_pad_wvalid,
  bus_arb_w_fifo_clk,
  bus_arb_w_fifo_clk_en,
  coreclk,
  cpurst_b,
  pad_biu_awready,
  pad_biu_back_ready,
  pad_biu_bid,
  pad_biu_bresp,
  pad_biu_bvalid,
  pad_biu_wns_awready,
  pad_biu_wns_wready,
  pad_biu_wready,
  pad_biu_ws_awready,
  pad_biu_ws_wready,
  round_w_clk_en,
  round_wcpuclk,
  st_aw_clk_en,
  st_awaddr,
  st_awbar,
  st_awburst,
  st_awcache,
  st_awcpuclk,
  st_awdomain,
  st_awid,
  st_awlen,
  st_awlock,
  st_awprot,
  st_awready,
  st_awsize,
  st_awsnoop,
  st_awunique,
  st_awuser,
  st_awvalid,
  st_awvalid_gate,
  st_w_clk_en,
  st_wcpuclk,
  st_wdata,
  st_wlast,
  st_wns,
  st_wready,
  st_wstrb,
  st_wvalid,
  vict_aw_clk_en,
  vict_awaddr,
  vict_awbar,
  vict_awburst,
  vict_awcache,
  vict_awcpuclk,
  vict_awdomain,
  vict_awid,
  vict_awlen,
  vict_awlock,
  vict_awprot,
  vict_awready,
  vict_awsize,
  vict_awsnoop,
  vict_awunique,
  vict_awuser,
  vict_awvalid,
  vict_awvalid_gate,
  vict_w_clk_en,
  vict_wcpuclk,
  vict_wdata,
  vict_wlast,
  vict_wns,
  vict_wready,
  vict_wstrb,
  vict_wvalid,
  write_b_clk_en,
  write_busy
);

// &Ports; @23
input            bcpuclk;                             
input            bus_arb_w_fifo_clk;                  
input            coreclk;                             
input            cpurst_b;                            
input            pad_biu_awready;                     
input            pad_biu_back_ready;                  
input   [4  :0]  pad_biu_bid;                         
input   [1  :0]  pad_biu_bresp;                       
input            pad_biu_bvalid;                      
input            pad_biu_wns_awready;                 
input            pad_biu_wns_wready;                  
input            pad_biu_wready;                      
input            pad_biu_ws_awready;                  
input            pad_biu_ws_wready;                   
input            round_wcpuclk;                       
input   [39 :0]  st_awaddr;                           
input   [1  :0]  st_awbar;                            
input   [1  :0]  st_awburst;                          
input   [3  :0]  st_awcache;                          
input            st_awcpuclk;                         
input   [1  :0]  st_awdomain;                         
input   [4  :0]  st_awid;                             
input   [1  :0]  st_awlen;                            
input            st_awlock;                           
input   [2  :0]  st_awprot;                           
input   [2  :0]  st_awsize;                           
input   [2  :0]  st_awsnoop;                          
input            st_awunique;                         
input            st_awuser;                           
input            st_awvalid;                          
input            st_awvalid_gate;                     
input            st_wcpuclk;                          
input   [127:0]  st_wdata;                            
input            st_wlast;                            
input            st_wns;                              
input   [15 :0]  st_wstrb;                            
input            st_wvalid;                           
input   [39 :0]  vict_awaddr;                         
input   [1  :0]  vict_awbar;                          
input   [1  :0]  vict_awburst;                        
input   [3  :0]  vict_awcache;                        
input            vict_awcpuclk;                       
input   [1  :0]  vict_awdomain;                       
input   [4  :0]  vict_awid;                           
input   [1  :0]  vict_awlen;                          
input            vict_awlock;                         
input   [2  :0]  vict_awprot;                         
input   [2  :0]  vict_awsize;                         
input   [2  :0]  vict_awsnoop;                        
input            vict_awunique;                       
input            vict_awuser;                         
input            vict_awvalid;                        
input            vict_awvalid_gate;                   
input            vict_wcpuclk;                        
input   [127:0]  vict_wdata;                          
input            vict_wlast;                          
input            vict_wns;                            
input   [15 :0]  vict_wstrb;                          
input            vict_wvalid;                         
output  [4  :0]  biu_lsu_b_id;                        
output  [1  :0]  biu_lsu_b_resp;                      
output           biu_lsu_b_vld;                       
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
output  [127:0]  biu_pad_wdata;                       
output           biu_pad_werr;                        
output           biu_pad_wlast;                       
output           biu_pad_wns;                         
output  [15 :0]  biu_pad_wstrb;                       
output           biu_pad_wvalid;                      
output           bus_arb_w_fifo_clk_en;               
output           round_w_clk_en;                      
output           st_aw_clk_en;                        
output           st_awready;                          
output           st_w_clk_en;                         
output           st_wready;                           
output           vict_aw_clk_en;                      
output           vict_awready;                        
output           vict_w_clk_en;                       
output           vict_wready;                         
output           write_b_clk_en;                      
output           write_busy;                          

// &Regs; @24
reg              back_pending;                        
reg              back_valid;                          
reg     [11 :0]  bus_arb_w_fifo;                      
reg     [12 :0]  bus_arb_w_fifo_create_ptr;           
reg     [4  :0]  cur_bresp_buf_bid;                   
reg     [1  :0]  cur_bresp_buf_bresp;                 
reg              cur_bresp_buf_bvalid;                
reg     [39 :0]  cur_waddr_buf_awaddr;                
reg     [1  :0]  cur_waddr_buf_awbar;                 
reg     [1  :0]  cur_waddr_buf_awburst;               
reg     [3  :0]  cur_waddr_buf_awcache;               
reg     [1  :0]  cur_waddr_buf_awdomain;              
reg     [4  :0]  cur_waddr_buf_awid;                  
reg     [1  :0]  cur_waddr_buf_awlen;                 
reg              cur_waddr_buf_awlock;                
reg     [2  :0]  cur_waddr_buf_awprot;                
reg     [2  :0]  cur_waddr_buf_awsize;                
reg     [2  :0]  cur_waddr_buf_awsnoop;               
reg              cur_waddr_buf_awunique;              
reg              cur_waddr_buf_awuser;                
reg     [39 :0]  cur_waddr_st_awaddr;                 
reg     [1  :0]  cur_waddr_st_awbar;                  
reg     [1  :0]  cur_waddr_st_awburst;                
reg     [3  :0]  cur_waddr_st_awcache;                
reg     [1  :0]  cur_waddr_st_awdomain;               
reg     [4  :0]  cur_waddr_st_awid;                   
reg     [1  :0]  cur_waddr_st_awlen;                  
reg              cur_waddr_st_awlock;                 
reg     [2  :0]  cur_waddr_st_awprot;                 
reg     [2  :0]  cur_waddr_st_awsize;                 
reg     [2  :0]  cur_waddr_st_awsnoop;                
reg              cur_waddr_st_awunique;               
reg              cur_waddr_st_awuser;                 
reg              cur_waddr_st_awvalid;                
reg     [39 :0]  cur_waddr_vict_awaddr;               
reg     [1  :0]  cur_waddr_vict_awbar;                
reg     [1  :0]  cur_waddr_vict_awburst;              
reg     [3  :0]  cur_waddr_vict_awcache;              
reg     [1  :0]  cur_waddr_vict_awdomain;             
reg     [4  :0]  cur_waddr_vict_awid;                 
reg     [1  :0]  cur_waddr_vict_awlen;                
reg              cur_waddr_vict_awlock;               
reg     [2  :0]  cur_waddr_vict_awprot;               
reg     [2  :0]  cur_waddr_vict_awsize;               
reg     [2  :0]  cur_waddr_vict_awsnoop;              
reg              cur_waddr_vict_awunique;             
reg              cur_waddr_vict_awuser;               
reg              cur_waddr_vict_awvalid;              
reg     [2  :0]  cur_wdata_buf_pop_sel;               
reg     [127:0]  cur_wdata_buf_wdata;                 
reg              cur_wdata_buf_wlast;                 
reg              cur_wdata_buf_wns;                   
reg     [15 :0]  cur_wdata_buf_wstrb;                 
reg              cur_wdata_buf_wvalid_dp;             
reg     [127:0]  cur_wdata_round_wdata;               
reg              cur_wdata_round_wlast;               
reg              cur_wdata_round_wns;                 
reg     [15 :0]  cur_wdata_round_wstrb;               
reg              cur_wdata_round_wvalid;              
reg     [127:0]  cur_wdata_st_wdata;                  
reg              cur_wdata_st_wlast;                  
reg              cur_wdata_st_wns;                    
reg     [15 :0]  cur_wdata_st_wstrb;                  
reg              cur_wdata_st_wvalid;                 
reg     [127:0]  cur_wdata_vict_wdata;                
reg              cur_wdata_vict_wlast;                
reg              cur_wdata_vict_wns;                  
reg     [15 :0]  cur_wdata_vict_wstrb;                
reg              cur_wdata_vict_wvalid;               

// &Wires; @25
wire             aw_ws;                               
wire             back_full;                           
wire             bcpuclk;                             
wire    [4  :0]  biu_lsu_b_id;                        
wire    [1  :0]  biu_lsu_b_resp;                      
wire             biu_lsu_b_vld;                       
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
wire    [127:0]  biu_pad_wdata;                       
wire             biu_pad_werr;                        
wire             biu_pad_wlast;                       
wire             biu_pad_wns;                         
wire    [15 :0]  biu_pad_wstrb;                       
wire             biu_pad_wvalid;                      
wire             blast_done;                          
wire             bus_arb_w_fifo_clk;                  
wire             bus_arb_w_fifo_clk_en;               
wire             bus_arb_w_fifo_create_vld;           
wire             bus_arb_w_fifo_create_vld_gateclk_en; 
wire             bus_arb_w_fifo_empty;                
wire             bus_arb_w_fifo_less2;                
wire    [11 :0]  bus_arb_w_fifo_next;                 
wire             bus_arb_w_fifo_pop_vld;              
wire             bus_arb_w_fifo_pop_vld_gateclk_en;   
wire    [11 :0]  bus_arb_w_fifo_stage;                
wire             coreclk;                             
wire             cpurst_b;                            
wire             cur_waddr_buf_awvalid;               
wire    [2  :0]  cur_wdata_buf_create_pop_sel;        
wire    [2  :0]  cur_wdata_buf_pop_sel_next;          
wire             cur_wdata_buf_wvalid;                
wire             evict_trans;                         
wire             pad_awready;                         
wire             pad_biu_back_ready;                  
wire    [4  :0]  pad_biu_bid;                         
wire    [1  :0]  pad_biu_bresp;                       
wire             pad_biu_bvalid;                      
wire             pad_biu_wns_awready;                 
wire             pad_biu_wns_wready;                  
wire             pad_biu_ws_awready;                  
wire             pad_biu_ws_wready;                   
wire             pad_wready;                          
wire             pop_next_w_fifo;                     
wire             round_w_clk_en;                      
wire             round_wcpuclk;                       
wire             round_wvalid;                        
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
wire             w_fifo_round_next_st;                
wire             w_fifo_round_next_victim;            
wire             wdata_st_pop_sel_next;               
wire             wdata_vict_pop_sel_next;             
wire             write_b_clk_en;                      
wire             write_busy;                          


//**********************************************************
//           write addr channel                        
// transmit write req (addr & data)
//**********************************************************
////buf ready stand for buf can acept req from lsu
//write addr channel
// &Force("input", "pad_biu_awready"); @33
parameter WU          = 3'b000;
parameter WLU         = 3'b001;
parameter EVICT       = 3'b100;

assign aw_ws       = ((cur_waddr_buf_awsnoop[2:0] == WU) || 
                      (cur_waddr_buf_awsnoop[2:0] == WLU)) && 
                      (cur_waddr_buf_awdomain[1:0] == 2'b01) ||
                     cur_waddr_buf_awbar[0];

assign pad_awready = aw_ws & pad_biu_ws_awready | !aw_ws & pad_biu_wns_awready;

assign vict_awready = !cur_waddr_vict_awvalid;
assign st_awready   = !cur_waddr_st_awvalid;

//**********************************************************
//           write addr channel                        
//cur_waddr_buf:
//| cur_waddr_buf_awvalid | cur_raddr_buf_awid | cur_raddr_buf_awaddr |
//|             ..._awlen |         ..._awsize |          ..._awburst |
//|            ..._awlock |        ..._awcache |           ..._awprot |
//|           ..._awsnoop |       ..._awdomain |            ..._awbar |
//|          ..._awunique |
//**********************************************************

assign biu_pad_awvalid                = cur_waddr_buf_awvalid;
assign biu_pad_awid[4:0]              = cur_waddr_buf_awid[4:0];
assign biu_pad_awaddr[`PA_WIDTH-1:0]  = cur_waddr_buf_awaddr[`PA_WIDTH-1:0];
assign biu_pad_awlen[1:0]             = cur_waddr_buf_awlen[1:0];
assign biu_pad_awsize[2:0]            = cur_waddr_buf_awsize[2:0];
assign biu_pad_awburst[1:0]           = cur_waddr_buf_awburst[1:0];
assign biu_pad_awlock                 = cur_waddr_buf_awlock;
assign biu_pad_awcache[3:0]           = cur_waddr_buf_awcache[3:0];
assign biu_pad_awprot[2:0]            = cur_waddr_buf_awprot[2:0];
assign biu_pad_awsnoop[2:0]           = cur_waddr_buf_awsnoop[2:0];
assign biu_pad_awuser                 = cur_waddr_buf_awuser;
assign biu_pad_awdomain[1:0]          = cur_waddr_buf_awdomain[1:0];
assign biu_pad_awbar[1:0]             = cur_waddr_buf_awbar[1:0];
assign biu_pad_awunique               = cur_waddr_buf_awunique;

assign cur_waddr_buf_awvalid          = cur_waddr_vict_awvalid
                                        || cur_waddr_st_awvalid;

// &CombBeg; @76
always @( cur_waddr_st_awid[4:0]
       or cur_waddr_st_awuser
       or cur_waddr_st_awdomain[1:0]
       or cur_waddr_vict_awuser
       or cur_waddr_vict_awcache[3:0]
       or cur_waddr_vict_awdomain[1:0]
       or cur_waddr_vict_awbar[1:0]
       or cur_waddr_vict_awsize[2:0]
       or cur_waddr_st_awlock
       or cur_waddr_st_awsize[2:0]
       or cur_waddr_vict_awsnoop[2:0]
       or cur_waddr_st_awburst[1:0]
       or cur_waddr_st_awbar[1:0]
       or cur_waddr_st_awaddr[39:0]
       or cur_waddr_vict_awaddr[39:0]
       or cur_waddr_vict_awlock
       or cur_waddr_st_awcache[3:0]
       or cur_waddr_st_awsnoop[2:0]
       or cur_waddr_vict_awid[4:0]
       or cur_waddr_vict_awvalid
       or cur_waddr_vict_awlen[1:0]
       or cur_waddr_st_awprot[2:0]
       or cur_waddr_st_awunique
       or cur_waddr_vict_awunique
       or cur_waddr_st_awlen[1:0]
       or cur_waddr_vict_awprot[2:0]
       or cur_waddr_vict_awburst[1:0])
begin
  if(cur_waddr_vict_awvalid)
  begin
  cur_waddr_buf_awid[4:0]              = cur_waddr_vict_awid[4:0];
  cur_waddr_buf_awaddr[`PA_WIDTH-1:0]  = cur_waddr_vict_awaddr[`PA_WIDTH-1:0];
  cur_waddr_buf_awlen[1:0]             = cur_waddr_vict_awlen[1:0];
  cur_waddr_buf_awsize[2:0]            = cur_waddr_vict_awsize[2:0];
  cur_waddr_buf_awburst[1:0]           = cur_waddr_vict_awburst[1:0];
  cur_waddr_buf_awlock                 = cur_waddr_vict_awlock;
  cur_waddr_buf_awcache[3:0]           = cur_waddr_vict_awcache[3:0];
  cur_waddr_buf_awprot[2:0]            = cur_waddr_vict_awprot[2:0];
  cur_waddr_buf_awsnoop[2:0]           = cur_waddr_vict_awsnoop[2:0];
  cur_waddr_buf_awuser                 = cur_waddr_vict_awuser;
  cur_waddr_buf_awdomain[1:0]          = cur_waddr_vict_awdomain[1:0];
  cur_waddr_buf_awbar[1:0]             = cur_waddr_vict_awbar[1:0];
  cur_waddr_buf_awunique               = cur_waddr_vict_awunique;
  end
  else
  begin
  cur_waddr_buf_awid[4:0]              = cur_waddr_st_awid[4:0];
  cur_waddr_buf_awaddr[`PA_WIDTH-1:0]  = cur_waddr_st_awaddr[`PA_WIDTH-1:0];
  cur_waddr_buf_awlen[1:0]             = cur_waddr_st_awlen[1:0];
  cur_waddr_buf_awsize[2:0]            = cur_waddr_st_awsize[2:0];
  cur_waddr_buf_awburst[1:0]           = cur_waddr_st_awburst[1:0];
  cur_waddr_buf_awlock                 = cur_waddr_st_awlock;
  cur_waddr_buf_awcache[3:0]           = cur_waddr_st_awcache[3:0];
  cur_waddr_buf_awprot[2:0]            = cur_waddr_st_awprot[2:0];
  cur_waddr_buf_awsnoop[2:0]           = cur_waddr_st_awsnoop[2:0];
  cur_waddr_buf_awuser                 = cur_waddr_st_awuser;
  cur_waddr_buf_awdomain[1:0]          = cur_waddr_st_awdomain[1:0];
  cur_waddr_buf_awbar[1:0]             = cur_waddr_st_awbar[1:0];
  cur_waddr_buf_awunique               = cur_waddr_st_awunique;
  end
// &CombEnd; @109
end

always @(posedge vict_awcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_waddr_vict_awvalid <= 1'b0;
  else if(vict_awvalid && !cur_waddr_vict_awvalid)
    cur_waddr_vict_awvalid <= 1'b1;
  else if(pad_biu_wns_awready && cur_waddr_vict_awvalid)
    cur_waddr_vict_awvalid <= 1'b0;
  else
    cur_waddr_vict_awvalid <= cur_waddr_vict_awvalid;
end

always @(posedge vict_awcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_waddr_vict_awid[4:0]     <= 5'b0;
    cur_waddr_vict_awaddr[`PA_WIDTH-1:0]  <= {`PA_WIDTH{1'b0}};
    cur_waddr_vict_awlen[1:0]    <= 2'b0;
    cur_waddr_vict_awsize[2:0]   <= 3'b0;
    cur_waddr_vict_awburst[1:0]  <= 2'b0;
    cur_waddr_vict_awlock        <= 1'b0;
    cur_waddr_vict_awcache[3:0]  <= 4'b0;
    cur_waddr_vict_awprot[2:0]   <= 3'b0;
    cur_waddr_vict_awsnoop[2:0]  <= 3'b0;
    cur_waddr_vict_awuser        <= 1'b0;
    cur_waddr_vict_awdomain[1:0] <= 2'b0;
    cur_waddr_vict_awbar[1:0]    <= 2'b0;
    cur_waddr_vict_awunique      <= 1'b0;
  end
  else if(vict_awvalid_gate && !cur_waddr_vict_awvalid)
  begin
    cur_waddr_vict_awid[4:0]     <= vict_awid[4:0];
    cur_waddr_vict_awaddr[`PA_WIDTH-1:0]  <= vict_awaddr[`PA_WIDTH-1:0];
    cur_waddr_vict_awlen[1:0]    <= vict_awlen[1:0];
    cur_waddr_vict_awsize[2:0]   <= vict_awsize[2:0];
    cur_waddr_vict_awburst[1:0]  <= vict_awburst[1:0];
    cur_waddr_vict_awlock        <= vict_awlock;
    cur_waddr_vict_awcache[3:0]  <= vict_awcache[3:0];
    cur_waddr_vict_awprot[2:0]   <= vict_awprot[2:0];
    cur_waddr_vict_awsnoop[2:0]  <= vict_awsnoop[2:0];
    cur_waddr_vict_awuser        <= vict_awuser;
    cur_waddr_vict_awdomain[1:0] <= vict_awdomain[1:0];
    cur_waddr_vict_awbar[1:0]    <= vict_awbar[1:0];
    cur_waddr_vict_awunique      <= vict_awunique;
  end
  else
  begin
    cur_waddr_vict_awid[4:0]     <= cur_waddr_vict_awid[4:0];
    cur_waddr_vict_awaddr[`PA_WIDTH-1:0]  <= cur_waddr_vict_awaddr[`PA_WIDTH-1:0];
    cur_waddr_vict_awlen[1:0]    <= cur_waddr_vict_awlen[1:0];
    cur_waddr_vict_awsize[2:0]   <= cur_waddr_vict_awsize[2:0];
    cur_waddr_vict_awburst[1:0]  <= cur_waddr_vict_awburst[1:0];
    cur_waddr_vict_awlock        <= cur_waddr_vict_awlock;
    cur_waddr_vict_awcache[3:0]  <= cur_waddr_vict_awcache[3:0];
    cur_waddr_vict_awprot[2:0]   <= cur_waddr_vict_awprot[2:0];
    cur_waddr_vict_awsnoop[2:0]  <= cur_waddr_vict_awsnoop[2:0];
    cur_waddr_vict_awuser        <= cur_waddr_vict_awuser;
    cur_waddr_vict_awdomain[1:0] <= cur_waddr_vict_awdomain[1:0];
    cur_waddr_vict_awbar[1:0]    <= cur_waddr_vict_awbar[1:0];
    cur_waddr_vict_awunique      <= cur_waddr_vict_awunique;
  end
end

always @(posedge st_awcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_waddr_st_awvalid <= 1'b0;
  else if(st_awvalid && !cur_waddr_st_awvalid)
    cur_waddr_st_awvalid <= 1'b1;
  else if(pad_awready && cur_waddr_st_awvalid && !cur_waddr_vict_awvalid)
    cur_waddr_st_awvalid <= 1'b0;
  else
    cur_waddr_st_awvalid <= cur_waddr_st_awvalid;
end

always @(posedge st_awcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_waddr_st_awid[4:0]     <= 5'b0;
    cur_waddr_st_awaddr[`PA_WIDTH-1:0]  <= {`PA_WIDTH{1'b0}};
    cur_waddr_st_awlen[1:0]    <= 2'b0;
    cur_waddr_st_awsize[2:0]   <= 3'b0;
    cur_waddr_st_awburst[1:0]  <= 2'b0;
    cur_waddr_st_awlock        <= 1'b0;
    cur_waddr_st_awcache[3:0]  <= 4'b0;
    cur_waddr_st_awprot[2:0]   <= 3'b0;
    cur_waddr_st_awsnoop[2:0]  <= 3'b0;
    cur_waddr_st_awuser        <= 1'b0;
    cur_waddr_st_awdomain[1:0] <= 2'b0;
    cur_waddr_st_awbar[1:0]    <= 2'b0;
    cur_waddr_st_awunique      <= 1'b0;
  end
  else if(st_awvalid_gate && !cur_waddr_st_awvalid)
  begin
    cur_waddr_st_awid[4:0]     <= st_awid[4:0];
    cur_waddr_st_awaddr[`PA_WIDTH-1:0]  <= st_awaddr[`PA_WIDTH-1:0];
    cur_waddr_st_awlen[1:0]    <= st_awlen[1:0];
    cur_waddr_st_awsize[2:0]   <= st_awsize[2:0];
    cur_waddr_st_awburst[1:0]  <= st_awburst[1:0];
    cur_waddr_st_awlock        <= st_awlock;
    cur_waddr_st_awcache[3:0]  <= st_awcache[3:0];
    cur_waddr_st_awprot[2:0]   <= st_awprot[2:0];
    cur_waddr_st_awsnoop[2:0]  <= st_awsnoop[2:0];
    cur_waddr_st_awuser        <= st_awuser;
    cur_waddr_st_awdomain[1:0] <= st_awdomain[1:0];
    cur_waddr_st_awbar[1:0]    <= st_awbar[1:0];
    cur_waddr_st_awunique      <= st_awunique;
  end
  else
  begin
    cur_waddr_st_awid[4:0]     <= cur_waddr_st_awid[4:0];
    cur_waddr_st_awaddr[`PA_WIDTH-1:0]  <= cur_waddr_st_awaddr[`PA_WIDTH-1:0];
    cur_waddr_st_awlen[1:0]    <= cur_waddr_st_awlen[1:0];
    cur_waddr_st_awsize[2:0]   <= cur_waddr_st_awsize[2:0];
    cur_waddr_st_awburst[1:0]  <= cur_waddr_st_awburst[1:0];
    cur_waddr_st_awlock        <= cur_waddr_st_awlock;
    cur_waddr_st_awcache[3:0]  <= cur_waddr_st_awcache[3:0];
    cur_waddr_st_awprot[2:0]   <= cur_waddr_st_awprot[2:0];
    cur_waddr_st_awsnoop[2:0]  <= cur_waddr_st_awsnoop[2:0];
    cur_waddr_st_awuser        <= cur_waddr_st_awuser;
    cur_waddr_st_awdomain[1:0] <= cur_waddr_st_awdomain[1:0];
    cur_waddr_st_awbar[1:0]    <= cur_waddr_st_awbar[1:0];
    cur_waddr_st_awunique      <= cur_waddr_st_awunique;
  end
end
//**********************************************************
//           write data channel                        
// transmit write req (addr & data)
//**********************************************************
//==============================================
//                W FIFO
//==============================================
parameter W_FIFO_ENTRY  = 12;
//--------------------registers-----------------------------
//bus_arb_w_fifo: 0 : wmb
//                1 : vb
//this fifo use bit shift mechanism to reduce timing
always @(posedge bus_arb_w_fifo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bus_arb_w_fifo[W_FIFO_ENTRY-1:0]  <=  {W_FIFO_ENTRY{1'b0}};
  else if(bus_arb_w_fifo_create_vld ||  bus_arb_w_fifo_pop_vld)
    bus_arb_w_fifo[W_FIFO_ENTRY-1:0]  <=  bus_arb_w_fifo_next[W_FIFO_ENTRY-1:0];
end

//create ptr
always @(posedge bus_arb_w_fifo_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    bus_arb_w_fifo_create_ptr[W_FIFO_ENTRY:0] <=  {{W_FIFO_ENTRY{1'b0}},1'b1};
  else if(bus_arb_w_fifo_create_vld &&  !bus_arb_w_fifo_pop_vld)
    bus_arb_w_fifo_create_ptr[W_FIFO_ENTRY:0] <=  {bus_arb_w_fifo_create_ptr[W_FIFO_ENTRY-1:0],1'b0};
  else if(!bus_arb_w_fifo_create_vld &&  bus_arb_w_fifo_pop_vld)
    bus_arb_w_fifo_create_ptr[W_FIFO_ENTRY:0] <=  {1'b0,bus_arb_w_fifo_create_ptr[W_FIFO_ENTRY:1]};
end

//--------------------wires-----------------------------
assign evict_trans = (cur_waddr_buf_awsnoop[2:0] == EVICT);

assign bus_arb_w_fifo_create_vld_gateclk_en = cur_waddr_buf_awvalid && !evict_trans;
assign bus_arb_w_fifo_pop_vld_gateclk_en    = cur_wdata_buf_wvalid;
assign bus_arb_w_fifo_create_vld  = cur_waddr_buf_awvalid  && !evict_trans &&  pad_awready;
assign bus_arb_w_fifo_pop_vld     = cur_wdata_buf_wvalid
                                    &&  cur_wdata_buf_wlast
                                    &&  pad_wready;

assign bus_arb_w_fifo_stage[W_FIFO_ENTRY-1:0] = {W_FIFO_ENTRY{cur_waddr_vict_awvalid && pad_biu_wns_awready && !evict_trans}}
                                                  & bus_arb_w_fifo_create_ptr[W_FIFO_ENTRY-1:0]
                                                | bus_arb_w_fifo[W_FIFO_ENTRY-1:0];
                                                        
assign bus_arb_w_fifo_next[W_FIFO_ENTRY-1:0]  = bus_arb_w_fifo_pop_vld
                                                ? {1'b0,bus_arb_w_fifo_stage[W_FIFO_ENTRY-1:1]}
                                                : bus_arb_w_fifo_stage[W_FIFO_ENTRY-1:0];

assign bus_arb_w_fifo_empty = bus_arb_w_fifo_create_ptr[0];

assign bus_arb_w_fifo_less2 = |bus_arb_w_fifo_create_ptr[1:0];

////buf ready stand for buf can acept req from lsu
//write data channel
// &Force("input","pad_biu_wready"); @293

assign pad_wready = cur_wdata_buf_wns & pad_biu_wns_wready | !cur_wdata_buf_wns & pad_biu_ws_wready;

assign vict_wready   = !cur_wdata_vict_wvalid
                       || !cur_wdata_round_wvalid
                          && w_fifo_round_next_victim;
assign st_wready     = !cur_wdata_st_wvalid
                       || !cur_wdata_round_wvalid
                          && w_fifo_round_next_st;
 
//**********************************************************
//           write data channel                        
//cur_wdata_buf:
//| cur_wdata_buf_wvalid |
//| cur_wdata_buf_wdata  | cur_wdata_buf_wstrb | cur_wdata_buf_wlast |
//**********************************************************

assign biu_pad_wvalid       = cur_wdata_buf_wvalid;
assign biu_pad_wdata[127:0] = cur_wdata_buf_wdata[127:0];
assign biu_pad_wstrb[15:0]  = cur_wdata_buf_wstrb[15:0];
assign biu_pad_wlast        = cur_wdata_buf_wlast;
assign biu_pad_wns          = cur_wdata_buf_wns;

assign biu_pad_werr         = 1'b0;

//for timing
//use three wbuffer here,one for victim,one for store(wmb)
//and the third is round buffer for both source to cut timing
//use round buffer to support back to back
assign cur_wdata_buf_wvalid = !bus_arb_w_fifo_empty
                              && cur_wdata_buf_wvalid_dp;  

// &CombBeg; @330
always @( cur_wdata_st_wdata[127:0]
       or cur_wdata_vict_wns
       or cur_wdata_vict_wlast
       or cur_wdata_buf_pop_sel[2:0]
       or cur_wdata_vict_wdata[127:0]
       or cur_wdata_round_wvalid
       or cur_wdata_round_wstrb[15:0]
       or cur_wdata_st_wstrb[15:0]
       or cur_wdata_round_wdata[127:0]
       or cur_wdata_st_wlast
       or cur_wdata_round_wlast
       or cur_wdata_st_wns
       or cur_wdata_vict_wstrb[15:0]
       or cur_wdata_round_wns
       or cur_wdata_vict_wvalid
       or cur_wdata_st_wvalid)
begin
case(cur_wdata_buf_pop_sel[2:0])
  3'b001:
  begin
    cur_wdata_buf_wvalid_dp     = cur_wdata_vict_wvalid;
    cur_wdata_buf_wdata[127:0]  = cur_wdata_vict_wdata[127:0];
    cur_wdata_buf_wstrb[15:0]   = cur_wdata_vict_wstrb[15:0];
    cur_wdata_buf_wlast         = cur_wdata_vict_wlast;
    cur_wdata_buf_wns           = cur_wdata_vict_wns;
  end
  3'b010:
  begin
    cur_wdata_buf_wvalid_dp     = cur_wdata_st_wvalid;
    cur_wdata_buf_wdata[127:0]  = cur_wdata_st_wdata[127:0];
    cur_wdata_buf_wstrb[15:0]   = cur_wdata_st_wstrb[15:0];
    cur_wdata_buf_wlast         = cur_wdata_st_wlast;
    cur_wdata_buf_wns           = cur_wdata_st_wns;
  end
  3'b100:
  begin
    cur_wdata_buf_wvalid_dp     = cur_wdata_round_wvalid;
    cur_wdata_buf_wdata[127:0]  = cur_wdata_round_wdata[127:0];
    cur_wdata_buf_wstrb[15:0]   = cur_wdata_round_wstrb[15:0];
    cur_wdata_buf_wlast         = cur_wdata_round_wlast;
    cur_wdata_buf_wns           = cur_wdata_round_wns;
  end
  default:
  begin
    cur_wdata_buf_wvalid_dp     = 1'b0;
    cur_wdata_buf_wdata[127:0]  = {128{1'b0}};
    cur_wdata_buf_wstrb[15:0]   = {16{1'b0}};
    cur_wdata_buf_wlast         = 1'b0;
    cur_wdata_buf_wns           = 1'b0;
  end
endcase
// &CombEnd; @377
end

always @(posedge bus_arb_w_fifo_clk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_wdata_buf_pop_sel[2:0] <= 3'b001;
  else if(bus_arb_w_fifo_empty && bus_arb_w_fifo_create_vld)
    cur_wdata_buf_pop_sel[2:0] <= cur_wdata_buf_create_pop_sel[2:0];
  else if(cur_wdata_buf_wvalid && pad_wready)
    cur_wdata_buf_pop_sel[2:0] <= cur_wdata_buf_pop_sel_next[2:0];
  else
    cur_wdata_buf_pop_sel[2:0] <= cur_wdata_buf_pop_sel[2:0];
end

//for timing,select pop entry in advance
assign cur_wdata_buf_create_pop_sel[2:0] = {1'b0,
                                            !cur_waddr_vict_awvalid,
                                            cur_waddr_vict_awvalid};

assign pop_next_w_fifo = cur_wdata_buf_wlast
                         ? (bus_arb_w_fifo_less2
                            ? cur_waddr_vict_awvalid
                            : bus_arb_w_fifo[1])
                         : bus_arb_w_fifo[0];

assign wdata_vict_pop_sel_next = pop_next_w_fifo
                                 && !(cur_wdata_buf_pop_sel[0]
                                      && (cur_wdata_round_wvalid
                                          || round_wvalid));

assign wdata_st_pop_sel_next   = !pop_next_w_fifo
                                 && !(cur_wdata_buf_pop_sel[1]
                                      && (cur_wdata_round_wvalid
                                          || round_wvalid));

assign cur_wdata_buf_pop_sel_next[2:0] = {!wdata_st_pop_sel_next && !wdata_vict_pop_sel_next,
                                          wdata_st_pop_sel_next,
                                          wdata_vict_pop_sel_next}; 


//w channel buffer
always @(posedge vict_wcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_wdata_vict_wvalid <= 1'b0;
  else if(vict_wvalid && !cur_wdata_vict_wvalid)
    cur_wdata_vict_wvalid <= 1'b1;
  else if(pad_biu_wns_wready && cur_wdata_buf_pop_sel[0] && cur_wdata_buf_wvalid)
    cur_wdata_vict_wvalid <= 1'b0;
  else
    cur_wdata_vict_wvalid <= cur_wdata_vict_wvalid;
end

always @(posedge vict_wcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_wdata_vict_wdata[127:0]  <= 128'b0;
    cur_wdata_vict_wstrb[15:0]   <= 16'b0;
    cur_wdata_vict_wlast         <= 1'b0;
    cur_wdata_vict_wns           <= 1'b0;
  end
  else if(vict_wvalid && !cur_wdata_vict_wvalid)
  begin
    cur_wdata_vict_wdata[127:0]  <= vict_wdata[127:0];
    cur_wdata_vict_wstrb[15:0]   <= vict_wstrb[15:0];
    cur_wdata_vict_wlast         <= vict_wlast;
    cur_wdata_vict_wns           <= vict_wns;
  end
  else
  begin
    cur_wdata_vict_wdata[127:0]  <= cur_wdata_vict_wdata[127:0];
    cur_wdata_vict_wstrb[15:0]   <= cur_wdata_vict_wstrb[15:0];
    cur_wdata_vict_wlast         <= cur_wdata_vict_wlast;
    cur_wdata_vict_wns           <= cur_wdata_vict_wns;
  end
end

always @(posedge st_wcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_wdata_st_wvalid <= 1'b0;
  else if(st_wvalid && !cur_wdata_st_wvalid)
    cur_wdata_st_wvalid <= 1'b1;
  else if(pad_wready && cur_wdata_buf_pop_sel[1] && cur_wdata_buf_wvalid)
    cur_wdata_st_wvalid <= 1'b0;
  else
    cur_wdata_st_wvalid <= cur_wdata_st_wvalid;
end

always @(posedge st_wcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_wdata_st_wdata[127:0]  <= 128'b0;
    cur_wdata_st_wstrb[15:0]   <= 16'b0;
    cur_wdata_st_wlast         <= 1'b0;
    cur_wdata_st_wns           <= 1'b0;
  end
  else if(st_wvalid && !cur_wdata_st_wvalid)
  begin
    cur_wdata_st_wdata[127:0]  <= st_wdata[127:0];
    cur_wdata_st_wstrb[15:0]   <= st_wstrb[15:0];
    cur_wdata_st_wlast         <= st_wlast;
    cur_wdata_st_wns           <= st_wns;
  end
  else
  begin
    cur_wdata_st_wdata[127:0]  <= cur_wdata_st_wdata[127:0];
    cur_wdata_st_wstrb[15:0]   <= cur_wdata_st_wstrb[15:0];
    cur_wdata_st_wlast         <= cur_wdata_st_wlast;
    cur_wdata_st_wns           <= cur_wdata_st_wns;
  end
end

//w channel round buffer
assign w_fifo_round_next_victim = !bus_arb_w_fifo_empty
                                      && bus_arb_w_fifo[0]
                                      && (!cur_wdata_vict_wlast
                                          || !bus_arb_w_fifo_less2
                                             && bus_arb_w_fifo[1]);

assign w_fifo_round_next_st     = !bus_arb_w_fifo_empty
                                      && !bus_arb_w_fifo[0]
                                      && (!cur_wdata_st_wlast
                                          || !bus_arb_w_fifo_less2
                                             && !bus_arb_w_fifo[1]);

assign round_wvalid = vict_wvalid
                         && cur_wdata_vict_wvalid
                         && w_fifo_round_next_victim
                      || st_wvalid 
                         && cur_wdata_st_wvalid
                         && w_fifo_round_next_st;

always @(posedge round_wcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_wdata_round_wvalid <= 1'b0;
  else if(round_wvalid && !cur_wdata_round_wvalid)
    cur_wdata_round_wvalid <= 1'b1;
  else if(pad_wready && cur_wdata_buf_pop_sel[2] && cur_wdata_buf_wvalid)
    cur_wdata_round_wvalid <= 1'b0;
  else
    cur_wdata_round_wvalid <= cur_wdata_round_wvalid;
end

always @(posedge round_wcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_wdata_round_wdata[127:0]  <= 128'b0;
    cur_wdata_round_wstrb[15:0]   <= 16'b0;
    cur_wdata_round_wlast         <= 1'b0;
    cur_wdata_round_wns           <= 1'b0;
  end
  else if(round_wvalid && !cur_wdata_round_wvalid && w_fifo_round_next_victim)
  begin
    cur_wdata_round_wdata[127:0]  <= vict_wdata[127:0];
    cur_wdata_round_wstrb[15:0]   <= vict_wstrb[15:0];
    cur_wdata_round_wlast         <= vict_wlast;
    cur_wdata_round_wns           <= vict_wns;
  end
  else if(round_wvalid && !cur_wdata_round_wvalid)
  begin
    cur_wdata_round_wdata[127:0]  <= st_wdata[127:0];
    cur_wdata_round_wstrb[15:0]   <= st_wstrb[15:0];
    cur_wdata_round_wlast         <= st_wlast;
    cur_wdata_round_wns           <= st_wns;
  end
  else
  begin
    cur_wdata_round_wdata[127:0]  <= cur_wdata_round_wdata[127:0];
    cur_wdata_round_wstrb[15:0]   <= cur_wdata_round_wstrb[15:0];
    cur_wdata_round_wlast         <= cur_wdata_round_wlast;
    cur_wdata_round_wns           <= cur_wdata_round_wns;
  end
end
//**********************************************************
//           write resp channel                        
// transmit resp from bus to req source(lsu)
//cur_bresp_buf:
//| cur_bresp_buf_bvalid |
//| cur_bresp_buf_bresp  | cur_bresp_buf_bid |
//**********************************************************
assign biu_pad_bready = !back_full;  //lsu can receive resp unconditioned

always @(posedge bcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_bresp_buf_bvalid <= 1'b0;
  else if(pad_biu_bvalid && !back_full)
    cur_bresp_buf_bvalid <= 1'b1;
  else if(!back_full)
    cur_bresp_buf_bvalid <= 1'b0;
end

always @(posedge bcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_bresp_buf_bresp[1:0] <= 2'b0;
    cur_bresp_buf_bid[4:0]   <= 5'b0;
  end
  else if(pad_biu_bvalid && !back_full)
  begin
    cur_bresp_buf_bresp[1:0] <= pad_biu_bresp[1:0];
    cur_bresp_buf_bid[4:0]   <= pad_biu_bid[4:0];
  end
  else
  begin
    cur_bresp_buf_bresp[1:0] <= cur_bresp_buf_bresp[1:0];
    cur_bresp_buf_bid[4:0]   <= cur_bresp_buf_bid[4:0];
  end
end

assign biu_lsu_b_vld       = cur_bresp_buf_bvalid && !back_full;
assign biu_lsu_b_resp[1:0] = cur_bresp_buf_bresp[1:0];
assign biu_lsu_b_id[4:0]   = cur_bresp_buf_bid[4:0];

//--------------------------back signal--------------------
//for async biu/piu,biu should generate back by itself
assign blast_done = cur_bresp_buf_bvalid && !back_full;

always @(posedge coreclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    back_valid <= 1'b0;
  else if(blast_done || back_pending)
    back_valid <= 1'b1;
  else if(pad_biu_back_ready)
    back_valid <= 1'b0;
end

//for simplicity
//back pending is used only when back is busy
always @(posedge coreclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    back_pending <= 1'b0;
  else if(pad_biu_back_ready)
    back_pending <= 1'b0;
  else if(blast_done && back_valid)
    back_pending <= 1'b1;
end

assign back_full = back_valid && back_pending;

assign biu_pad_back = back_valid;

//**********************************************************
//                 Gated Clk EN
//**********************************************************
assign vict_aw_clk_en = cur_waddr_vict_awvalid
                         || vict_awvalid_gate;
assign st_aw_clk_en   = cur_waddr_st_awvalid
                         || st_awvalid_gate;

assign vict_w_clk_en  = cur_wdata_vict_wvalid
                         || vict_wvalid;

assign st_w_clk_en    = cur_wdata_st_wvalid
                         || st_wvalid;

assign round_w_clk_en = cur_wdata_round_wvalid
                         || cur_wdata_vict_wvalid
                         || cur_wdata_st_wvalid;

assign bus_arb_w_fifo_clk_en	= bus_arb_w_fifo_create_vld_gateclk_en
																||	bus_arb_w_fifo_pop_vld_gateclk_en;

assign write_b_clk_en  = 1'b1;  //for timing,not use input signal

//for low power
assign write_busy = cur_waddr_buf_awvalid
                    || cur_wdata_buf_wvalid 
                    || cur_bresp_buf_bvalid 
                    || back_valid 
                    || back_pending; 

// &ModuleEnd; @687
endmodule












