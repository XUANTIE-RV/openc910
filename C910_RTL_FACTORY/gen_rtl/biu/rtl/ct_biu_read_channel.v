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
module ct_biu_read_channel(
  araddr,
  arbar,
  arburst,
  arcache,
  arcpuclk,
  ardomain,
  arid,
  arlen,
  arlock,
  arprot,
  arready,
  arsize,
  arsnoop,
  aruser,
  arvalid,
  arvalid_gate,
  biu_ifu_rd_data,
  biu_ifu_rd_data_vld,
  biu_ifu_rd_id,
  biu_ifu_rd_last,
  biu_ifu_rd_resp,
  biu_lsu_r_data,
  biu_lsu_r_id,
  biu_lsu_r_last,
  biu_lsu_r_resp,
  biu_lsu_r_vld,
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
  biu_pad_rack,
  biu_pad_rready,
  coreclk,
  cpurst_b,
  ifu_biu_r_ready,
  lsu_biu_r_linefill_ready,
  pad_biu_arready,
  pad_biu_rack_ready,
  pad_biu_rdata,
  pad_biu_rid,
  pad_biu_rlast,
  pad_biu_rresp,
  pad_biu_rvalid,
  rcpuclk,
  read_ar_clk_en,
  read_busy,
  read_r_clk_en
);

// &Ports; @23
input   [39 :0]  araddr;                  
input   [1  :0]  arbar;                   
input   [1  :0]  arburst;                 
input   [3  :0]  arcache;                 
input            arcpuclk;                
input   [1  :0]  ardomain;                
input   [4  :0]  arid;                    
input   [1  :0]  arlen;                   
input            arlock;                  
input   [2  :0]  arprot;                  
input   [2  :0]  arsize;                  
input   [3  :0]  arsnoop;                 
input   [2  :0]  aruser;                  
input            arvalid;                 
input            arvalid_gate;            
input            coreclk;                 
input            cpurst_b;                
input            ifu_biu_r_ready;         
input            lsu_biu_r_linefill_ready; 
input            pad_biu_arready;         
input            pad_biu_rack_ready;      
input   [127:0]  pad_biu_rdata;           
input   [4  :0]  pad_biu_rid;             
input            pad_biu_rlast;           
input   [3  :0]  pad_biu_rresp;           
input            pad_biu_rvalid;          
input            rcpuclk;                 
output           arready;                 
output  [127:0]  biu_ifu_rd_data;         
output           biu_ifu_rd_data_vld;     
output           biu_ifu_rd_id;           
output           biu_ifu_rd_last;         
output  [1  :0]  biu_ifu_rd_resp;         
output  [127:0]  biu_lsu_r_data;          
output  [4  :0]  biu_lsu_r_id;            
output           biu_lsu_r_last;          
output  [3  :0]  biu_lsu_r_resp;          
output           biu_lsu_r_vld;           
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
output           biu_pad_rack;            
output           biu_pad_rready;          
output           read_ar_clk_en;          
output           read_busy;               
output           read_r_clk_en;           

// &Regs; @24
reg     [39 :0]  cur_raddr_buf0_araddr;   
reg     [1  :0]  cur_raddr_buf0_arbar;    
reg     [1  :0]  cur_raddr_buf0_arburst;  
reg     [3  :0]  cur_raddr_buf0_arcache;  
reg     [1  :0]  cur_raddr_buf0_ardomain; 
reg     [4  :0]  cur_raddr_buf0_arid;     
reg     [1  :0]  cur_raddr_buf0_arlen;    
reg              cur_raddr_buf0_arlock;   
reg     [2  :0]  cur_raddr_buf0_arprot;   
reg     [2  :0]  cur_raddr_buf0_arsize;   
reg     [3  :0]  cur_raddr_buf0_arsnoop;  
reg     [2  :0]  cur_raddr_buf0_aruser;   
reg              cur_raddr_buf0_arvalid;  
reg     [39 :0]  cur_raddr_buf1_araddr;   
reg     [1  :0]  cur_raddr_buf1_arbar;    
reg     [1  :0]  cur_raddr_buf1_arburst;  
reg     [3  :0]  cur_raddr_buf1_arcache;  
reg     [1  :0]  cur_raddr_buf1_ardomain; 
reg     [4  :0]  cur_raddr_buf1_arid;     
reg     [1  :0]  cur_raddr_buf1_arlen;    
reg              cur_raddr_buf1_arlock;   
reg     [2  :0]  cur_raddr_buf1_arprot;   
reg     [2  :0]  cur_raddr_buf1_arsize;   
reg     [3  :0]  cur_raddr_buf1_arsnoop;  
reg     [2  :0]  cur_raddr_buf1_aruser;   
reg              cur_raddr_buf1_arvalid;  
reg     [39 :0]  cur_raddr_buf_araddr;    
reg     [1  :0]  cur_raddr_buf_arbar;     
reg     [1  :0]  cur_raddr_buf_arburst;   
reg     [3  :0]  cur_raddr_buf_arcache;   
reg     [1  :0]  cur_raddr_buf_ardomain;  
reg     [4  :0]  cur_raddr_buf_arid;      
reg     [1  :0]  cur_raddr_buf_arlen;     
reg              cur_raddr_buf_arlock;    
reg     [2  :0]  cur_raddr_buf_arprot;    
reg     [2  :0]  cur_raddr_buf_arsize;    
reg     [3  :0]  cur_raddr_buf_arsnoop;   
reg     [2  :0]  cur_raddr_buf_aruser;    
reg              cur_raddr_buf_crt1_sel;  
reg              cur_raddr_buf_pop1_sel;  
reg     [127:0]  cur_rdata_buf0_rdata;    
reg     [4  :0]  cur_rdata_buf0_rid;      
reg              cur_rdata_buf0_rlast;    
reg     [3  :0]  cur_rdata_buf0_rresp;    
reg              cur_rdata_buf0_rvalid;   
reg     [127:0]  cur_rdata_buf1_rdata;    
reg     [4  :0]  cur_rdata_buf1_rid;      
reg              cur_rdata_buf1_rlast;    
reg     [3  :0]  cur_rdata_buf1_rresp;    
reg              cur_rdata_buf1_rvalid;   
reg              cur_rdata_buf_crt1_sel;  
reg              cur_rdata_buf_pop1_sel;  
reg     [127:0]  cur_rdata_buf_rdata;     
reg     [4  :0]  cur_rdata_buf_rid;       
reg              cur_rdata_buf_rlast;     
reg     [3  :0]  cur_rdata_buf_rresp;     
reg              rack_pending;            
reg              rack_valid;              

// &Wires; @25
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
wire    [127:0]  biu_ifu_rd_data;         
wire             biu_ifu_rd_data_vld;     
wire             biu_ifu_rd_id;           
wire             biu_ifu_rd_last;         
wire    [1  :0]  biu_ifu_rd_resp;         
wire    [127:0]  biu_lsu_r_data;          
wire    [4  :0]  biu_lsu_r_id;            
wire             biu_lsu_r_last;          
wire    [3  :0]  biu_lsu_r_resp;          
wire             biu_lsu_r_vld;           
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
wire             biu_pad_rack;            
wire             biu_pad_rready;          
wire             coreclk;                 
wire             cpurst_b;                
wire             cur_raddr_buf_arvalid;   
wire             cur_raddr_buf_empty;     
wire             cur_raddr_buf_ready;     
wire             cur_rdata_buf_empty;     
wire             cur_rdata_buf_ready;     
wire             cur_rdata_buf_rvalid;    
wire             cur_rdata_is_ifu;        
wire             cur_rdata_is_linefill;   
wire             cur_rdata_is_lsu;        
wire             ifu_biu_r_ready;         
wire             lsu_biu_r_linefill_ready; 
wire             pad_biu_arready;         
wire             pad_biu_rack_ready;      
wire    [127:0]  pad_biu_rdata;           
wire    [4  :0]  pad_biu_rid;             
wire             pad_biu_rlast;           
wire    [3  :0]  pad_biu_rresp;           
wire             pad_biu_rvalid;          
wire             rack_full;               
wire             rcpuclk;                 
wire             rd_data_clr_en;          
wire             rd_data_clr_en_raw;      
wire             rd_data_create_en;       
wire             read_ar_clk_en;          
wire             read_busy;               
wire             read_r_clk_en;           
wire             rlast_done;              


//**********************************************************
//           read channel                        
// transmit read req after arbitrated
// transmit data from bus to req source(lsu/ifu)
//**********************************************************
//
//**********************************************************
//           read addr channel                        
// transmit read req after arbitrated
//**********************************************************
//buf ready stand for buf can acept req from lsu/ifu
assign arready = cur_raddr_buf_ready;

assign cur_raddr_buf_ready =  cur_raddr_buf_empty; 

assign cur_raddr_buf_empty = !cur_raddr_buf0_arvalid
                             || !cur_raddr_buf1_arvalid;
//**********************************************************
//           read addr channel                        
//cur_raddr_buf:
//| cur_raddr_buf_arvalid | cur_raddr_buf_arid | cur_raddr_buf_araddr |
//|             ..._arlen |         ..._arsize |          ..._arburst |
//|            ..._arlock |        ..._arcache |           ..._arprot |
//|           ..._arsnoop |       ..._ardomain |            ..._arbar |
//**********************************************************

assign biu_pad_arvalid                = cur_raddr_buf_arvalid;
assign biu_pad_arid[4:0]              = cur_raddr_buf_arid[4:0];
assign biu_pad_araddr[`PA_WIDTH-1:0]  = cur_raddr_buf_araddr[`PA_WIDTH-1:0];
assign biu_pad_arlen[1:0]             = cur_raddr_buf_arlen[1:0];
assign biu_pad_arsize[2:0]            = cur_raddr_buf_arsize[2:0];
assign biu_pad_arburst[1:0]           = cur_raddr_buf_arburst[1:0];
assign biu_pad_arlock                 = cur_raddr_buf_arlock;
assign biu_pad_arcache[3:0]           = cur_raddr_buf_arcache[3:0];
assign biu_pad_arprot[2:0]            = cur_raddr_buf_arprot[2:0];
assign biu_pad_arsnoop[3:0]           = cur_raddr_buf_arsnoop[3:0];
assign biu_pad_ardomain[1:0]          = cur_raddr_buf_ardomain[1:0];
assign biu_pad_arbar[1:0]             = cur_raddr_buf_arbar[1:0];
assign biu_pad_aruser[2:0]            = cur_raddr_buf_aruser[2:0];//for TLB read

assign cur_raddr_buf_arvalid          = cur_raddr_buf0_arvalid
                                        || cur_raddr_buf1_arvalid;

// &CombBeg; @70
always @( cur_raddr_buf0_arprot[2:0]
       or cur_raddr_buf1_arcache[3:0]
       or cur_raddr_buf1_ardomain[1:0]
       or cur_raddr_buf1_arburst[1:0]
       or cur_raddr_buf0_arcache[3:0]
       or cur_raddr_buf0_aruser[2:0]
       or cur_raddr_buf1_arlen[1:0]
       or cur_raddr_buf1_arsnoop[3:0]
       or cur_raddr_buf0_arbar[1:0]
       or cur_raddr_buf0_araddr[39:0]
       or cur_raddr_buf0_arid[4:0]
       or cur_raddr_buf1_arlock
       or cur_raddr_buf0_arburst[1:0]
       or cur_raddr_buf0_arsnoop[3:0]
       or cur_raddr_buf_pop1_sel
       or cur_raddr_buf0_ardomain[1:0]
       or cur_raddr_buf0_arsize[2:0]
       or cur_raddr_buf1_arid[4:0]
       or cur_raddr_buf1_aruser[2:0]
       or cur_raddr_buf0_arlen[1:0]
       or cur_raddr_buf1_araddr[39:0]
       or cur_raddr_buf0_arlock
       or cur_raddr_buf1_arbar[1:0]
       or cur_raddr_buf1_arprot[2:0]
       or cur_raddr_buf1_arsize[2:0])
begin
  if(cur_raddr_buf_pop1_sel)
  begin
  cur_raddr_buf_arid[4:0]              = cur_raddr_buf1_arid[4:0];
  cur_raddr_buf_araddr[`PA_WIDTH-1:0]  = cur_raddr_buf1_araddr[`PA_WIDTH-1:0];
  cur_raddr_buf_arlen[1:0]             = cur_raddr_buf1_arlen[1:0];
  cur_raddr_buf_arsize[2:0]            = cur_raddr_buf1_arsize[2:0];
  cur_raddr_buf_arburst[1:0]           = cur_raddr_buf1_arburst[1:0];
  cur_raddr_buf_arlock                 = cur_raddr_buf1_arlock;
  cur_raddr_buf_arcache[3:0]           = cur_raddr_buf1_arcache[3:0];
  cur_raddr_buf_arprot[2:0]            = cur_raddr_buf1_arprot[2:0];
  cur_raddr_buf_arsnoop[3:0]           = cur_raddr_buf1_arsnoop[3:0];
  cur_raddr_buf_ardomain[1:0]          = cur_raddr_buf1_ardomain[1:0];
  cur_raddr_buf_arbar[1:0]             = cur_raddr_buf1_arbar[1:0];
  cur_raddr_buf_aruser[2:0]            = cur_raddr_buf1_aruser[2:0];//for TLB read
  end
  else
  begin
  cur_raddr_buf_arid[4:0]              = cur_raddr_buf0_arid[4:0];
  cur_raddr_buf_araddr[`PA_WIDTH-1:0]  = cur_raddr_buf0_araddr[`PA_WIDTH-1:0];
  cur_raddr_buf_arlen[1:0]             = cur_raddr_buf0_arlen[1:0];
  cur_raddr_buf_arsize[2:0]            = cur_raddr_buf0_arsize[2:0];
  cur_raddr_buf_arburst[1:0]           = cur_raddr_buf0_arburst[1:0];
  cur_raddr_buf_arlock                 = cur_raddr_buf0_arlock;
  cur_raddr_buf_arcache[3:0]           = cur_raddr_buf0_arcache[3:0];
  cur_raddr_buf_arprot[2:0]            = cur_raddr_buf0_arprot[2:0];
  cur_raddr_buf_arsnoop[3:0]           = cur_raddr_buf0_arsnoop[3:0];
  cur_raddr_buf_ardomain[1:0]          = cur_raddr_buf0_ardomain[1:0];
  cur_raddr_buf_arbar[1:0]             = cur_raddr_buf0_arbar[1:0];
  cur_raddr_buf_aruser[2:0]            = cur_raddr_buf0_aruser[2:0];//for TLB read
  end
// &CombEnd; @101
end

always @(posedge arcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_raddr_buf_crt1_sel <= 1'b0;
  else if(arvalid && cur_raddr_buf_ready)
    cur_raddr_buf_crt1_sel <= !cur_raddr_buf_crt1_sel;
  else
    cur_raddr_buf_crt1_sel <= cur_raddr_buf_crt1_sel;
end

always @(posedge arcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_raddr_buf_pop1_sel <= 1'b0;
  else if(cur_raddr_buf_arvalid && pad_biu_arready)
    cur_raddr_buf_pop1_sel <= !cur_raddr_buf_pop1_sel;
  else
    cur_raddr_buf_pop1_sel <= cur_raddr_buf_pop1_sel;
end

always @(posedge arcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_raddr_buf0_arvalid <= 1'b0;
  else if(arvalid && !cur_raddr_buf_crt1_sel && !cur_raddr_buf0_arvalid)
    cur_raddr_buf0_arvalid <= 1'b1;
  else if(pad_biu_arready && !cur_raddr_buf_pop1_sel && cur_raddr_buf0_arvalid)
    cur_raddr_buf0_arvalid <= 1'b0;
  else
    cur_raddr_buf0_arvalid <= cur_raddr_buf0_arvalid;
end

always @(posedge arcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_raddr_buf0_arid[4:0]     <= 5'b0; 
    cur_raddr_buf0_araddr[`PA_WIDTH-1:0]  <= {`PA_WIDTH{1'b0}};
    cur_raddr_buf0_arlen[1:0]    <= 2'b0;
    cur_raddr_buf0_arsize[2:0]   <= 3'b0;
    cur_raddr_buf0_arburst[1:0]  <= 2'b0;
    cur_raddr_buf0_arlock        <= 1'b0;
    cur_raddr_buf0_arcache[3:0]  <= 4'b0;
    cur_raddr_buf0_arprot[2:0]   <= 3'b0;
    cur_raddr_buf0_arsnoop[3:0]  <= 4'b0;
    cur_raddr_buf0_ardomain[1:0] <= 2'b0;
    cur_raddr_buf0_arbar[1:0]    <= 2'b0;
    cur_raddr_buf0_aruser[2:0]   <= 3'b0;
  end
  else if(arvalid_gate && !cur_raddr_buf_crt1_sel && !cur_raddr_buf0_arvalid)
  begin
    cur_raddr_buf0_arid[4:0]     <= arid[4:0];
    cur_raddr_buf0_araddr[`PA_WIDTH-1:0]  <= araddr[`PA_WIDTH-1:0];
    cur_raddr_buf0_arlen[1:0]    <= arlen[1:0];
    cur_raddr_buf0_arsize[2:0]   <= arsize[2:0];
    cur_raddr_buf0_arburst[1:0]  <= arburst[1:0];
    cur_raddr_buf0_arlock        <= arlock;
    cur_raddr_buf0_arcache[3:0]  <= arcache[3:0];
    cur_raddr_buf0_arprot[2:0]   <= arprot[2:0];
    cur_raddr_buf0_arsnoop[3:0]  <= arsnoop[3:0];
    cur_raddr_buf0_ardomain[1:0] <= ardomain[1:0];
    cur_raddr_buf0_arbar[1:0]    <= arbar[1:0];
    cur_raddr_buf0_aruser[2:0]   <= aruser[2:0];
  end
  else
  begin
    cur_raddr_buf0_arid[4:0]     <= cur_raddr_buf0_arid[4:0];
    cur_raddr_buf0_araddr[`PA_WIDTH-1:0]  <= cur_raddr_buf0_araddr[`PA_WIDTH-1:0];
    cur_raddr_buf0_arlen[1:0]    <= cur_raddr_buf0_arlen[1:0];
    cur_raddr_buf0_arsize[2:0]   <= cur_raddr_buf0_arsize[2:0];
    cur_raddr_buf0_arburst[1:0]  <= cur_raddr_buf0_arburst[1:0];
    cur_raddr_buf0_arlock        <= cur_raddr_buf0_arlock;
    cur_raddr_buf0_arcache[3:0]  <= cur_raddr_buf0_arcache[3:0];
    cur_raddr_buf0_arprot[2:0]   <= cur_raddr_buf0_arprot[2:0];
    cur_raddr_buf0_arsnoop[3:0]  <= cur_raddr_buf0_arsnoop[3:0];
    cur_raddr_buf0_ardomain[1:0] <= cur_raddr_buf0_ardomain[1:0];
    cur_raddr_buf0_arbar[1:0]    <= cur_raddr_buf0_arbar[1:0];
    cur_raddr_buf0_aruser[2:0]   <= cur_raddr_buf0_aruser[2:0];
  end
end

always @(posedge arcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_raddr_buf1_arvalid <= 1'b0;
  else if(arvalid && cur_raddr_buf_crt1_sel && !cur_raddr_buf1_arvalid)
    cur_raddr_buf1_arvalid <= 1'b1;
  else if(pad_biu_arready && cur_raddr_buf_pop1_sel && cur_raddr_buf1_arvalid)
    cur_raddr_buf1_arvalid <= 1'b0;
  else
    cur_raddr_buf1_arvalid <= cur_raddr_buf1_arvalid;
end

always @(posedge arcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_raddr_buf1_arid[4:0]     <= 5'b0; 
    cur_raddr_buf1_araddr[`PA_WIDTH-1:0]  <= {`PA_WIDTH{1'b0}};
    cur_raddr_buf1_arlen[1:0]    <= 2'b0;
    cur_raddr_buf1_arsize[2:0]   <= 3'b0;
    cur_raddr_buf1_arburst[1:0]  <= 2'b0;
    cur_raddr_buf1_arlock        <= 1'b0;
    cur_raddr_buf1_arcache[3:0]  <= 4'b0;
    cur_raddr_buf1_arprot[2:0]   <= 3'b0;
    cur_raddr_buf1_arsnoop[3:0]  <= 4'b0;
    cur_raddr_buf1_ardomain[1:0] <= 2'b0;
    cur_raddr_buf1_arbar[1:0]    <= 2'b0;
    cur_raddr_buf1_aruser[2:0]   <= 3'b0;
  end
  else if(arvalid_gate && cur_raddr_buf_crt1_sel && !cur_raddr_buf1_arvalid)
  begin
    cur_raddr_buf1_arid[4:0]     <= arid[4:0];
    cur_raddr_buf1_araddr[`PA_WIDTH-1:0]  <= araddr[`PA_WIDTH-1:0];
    cur_raddr_buf1_arlen[1:0]    <= arlen[1:0];
    cur_raddr_buf1_arsize[2:0]   <= arsize[2:0];
    cur_raddr_buf1_arburst[1:0]  <= arburst[1:0];
    cur_raddr_buf1_arlock        <= arlock;
    cur_raddr_buf1_arcache[3:0]  <= arcache[3:0];
    cur_raddr_buf1_arprot[2:0]   <= arprot[2:0];
    cur_raddr_buf1_arsnoop[3:0]  <= arsnoop[3:0];
    cur_raddr_buf1_ardomain[1:0] <= ardomain[1:0];
    cur_raddr_buf1_arbar[1:0]    <= arbar[1:0];
    cur_raddr_buf1_aruser[2:0]   <= aruser[2:0];
  end
  else
  begin
    cur_raddr_buf1_arid[4:0]     <= cur_raddr_buf1_arid[4:0];
    cur_raddr_buf1_araddr[`PA_WIDTH-1:0]  <= cur_raddr_buf1_araddr[`PA_WIDTH-1:0];
    cur_raddr_buf1_arlen[1:0]    <= cur_raddr_buf1_arlen[1:0];
    cur_raddr_buf1_arsize[2:0]   <= cur_raddr_buf1_arsize[2:0];
    cur_raddr_buf1_arburst[1:0]  <= cur_raddr_buf1_arburst[1:0];
    cur_raddr_buf1_arlock        <= cur_raddr_buf1_arlock;
    cur_raddr_buf1_arcache[3:0]  <= cur_raddr_buf1_arcache[3:0];
    cur_raddr_buf1_arprot[2:0]   <= cur_raddr_buf1_arprot[2:0];
    cur_raddr_buf1_arsnoop[3:0]  <= cur_raddr_buf1_arsnoop[3:0];
    cur_raddr_buf1_ardomain[1:0] <= cur_raddr_buf1_ardomain[1:0];
    cur_raddr_buf1_arbar[1:0]    <= cur_raddr_buf1_arbar[1:0];
    cur_raddr_buf1_aruser[2:0]   <= cur_raddr_buf1_aruser[2:0];
  end
end

//**********************************************************
//           read data channel    
//           bus handshake signal             
//**********************************************************
assign biu_pad_rready      =   cur_rdata_buf_ready;

assign cur_rdata_buf_ready =   cur_rdata_buf_empty;

assign cur_rdata_buf_empty =  !cur_rdata_buf0_rvalid
                              || !cur_rdata_buf1_rvalid;

//assign ifu_biu_r_ready     =   1'b1;
assign rd_data_clr_en_raw  =  (cur_rdata_is_ifu && ifu_biu_r_ready)
                           || (cur_rdata_is_lsu && lsu_biu_r_linefill_ready)
                           || (cur_rdata_is_lsu && !cur_rdata_is_linefill);

assign rd_data_clr_en      =  rd_data_clr_en_raw && !rack_full;

assign cur_rdata_is_ifu    =   cur_rdata_buf_rvalid
                           && (   (cur_rdata_buf_rid[4:0] == 5'b10000)
                               || (cur_rdata_buf_rid[4:0] == 5'b10001) );
assign cur_rdata_is_lsu    =   cur_rdata_buf_rvalid
                           && !cur_rdata_is_ifu;
//only linefill data care for lsu_biu_ready;
//other read req don't care,
assign cur_rdata_is_linefill =  cur_rdata_buf_rvalid
                             && (cur_rdata_buf_rid[4:3] == 2'b00);

assign rd_data_create_en   =   cur_rdata_buf_ready && pad_biu_rvalid;

//--------------------------rack signal--------------------
//for async biu/piu,biu should generate rack by itself
assign rlast_done = cur_rdata_buf_rvalid
                    && cur_rdata_buf_rlast
                    && rd_data_clr_en;

always @(posedge coreclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    rack_valid <= 1'b0;
  else if(rlast_done || rack_pending)
    rack_valid <= 1'b1;
  else if(pad_biu_rack_ready)
    rack_valid <= 1'b0;
end

//for simplicity
//rack pending is used only when rack is busy
always @(posedge coreclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    rack_pending <= 1'b0;
  else if(pad_biu_rack_ready)
    rack_pending <= 1'b0;
  else if(rlast_done && rack_valid)
    rack_pending <= 1'b1;
end

assign rack_full = rack_valid && rack_pending;

assign biu_pad_rack = rack_valid;
//**********************************************************
//           read data channel : get data from bus    //cur_rdata_buf:
//| cur_rdata_buf_rvalid | 
//| cur_rdata_buf_rid    | cur_rdata_buf_rdata |
//| cur_rdata_buf_rresp  | cur_rdata_buf_rlast |
//**********************************************************
assign cur_rdata_buf_rvalid  = cur_rdata_buf0_rvalid
                               || cur_rdata_buf1_rvalid;
// &CombBeg; @339
always @( cur_rdata_buf1_rid[4:0]
       or cur_rdata_buf0_rlast
       or cur_rdata_buf_pop1_sel
       or cur_rdata_buf0_rresp[3:0]
       or cur_rdata_buf0_rid[4:0]
       or cur_rdata_buf1_rresp[3:0]
       or cur_rdata_buf1_rdata[127:0]
       or cur_rdata_buf0_rdata[127:0]
       or cur_rdata_buf1_rlast)
begin
  if(cur_rdata_buf_pop1_sel)
  begin
  cur_rdata_buf_rid[4:0]     = cur_rdata_buf1_rid[4:0];
  cur_rdata_buf_rdata[127:0] = cur_rdata_buf1_rdata[127:0];
  cur_rdata_buf_rresp[3:0]   = cur_rdata_buf1_rresp[3:0];
  cur_rdata_buf_rlast        = cur_rdata_buf1_rlast;
  end
  else
  begin
  cur_rdata_buf_rid[4:0]     = cur_rdata_buf0_rid[4:0];
  cur_rdata_buf_rdata[127:0] = cur_rdata_buf0_rdata[127:0];
  cur_rdata_buf_rresp[3:0]   = cur_rdata_buf0_rresp[3:0];
  cur_rdata_buf_rlast        = cur_rdata_buf0_rlast;
  end
// &CombEnd; @354
end

always @(posedge rcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_rdata_buf_crt1_sel <= 1'b0;
  else if(rd_data_create_en)
    cur_rdata_buf_crt1_sel <= !cur_rdata_buf_crt1_sel;
  else
    cur_rdata_buf_crt1_sel <= cur_rdata_buf_crt1_sel;
end

always @(posedge rcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_rdata_buf_pop1_sel <= 1'b0;
  else if(rd_data_clr_en)
    cur_rdata_buf_pop1_sel <= !cur_rdata_buf_pop1_sel;
  else
    cur_rdata_buf_pop1_sel <= cur_rdata_buf_pop1_sel;
end

always @(posedge rcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_rdata_buf0_rvalid <= 1'b0;
  else if(rd_data_create_en && !cur_rdata_buf_crt1_sel)
    cur_rdata_buf0_rvalid <= 1'b1;
  else if(rd_data_clr_en && !cur_rdata_buf_pop1_sel)
    cur_rdata_buf0_rvalid <= 1'b0;
  else
    cur_rdata_buf0_rvalid <= cur_rdata_buf0_rvalid;
end

always @(posedge rcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_rdata_buf0_rid[4:0]     <= 5'b0;
    cur_rdata_buf0_rdata[127:0] <= 128'b0;
    cur_rdata_buf0_rresp[3:0]   <= 4'b0;
    cur_rdata_buf0_rlast        <= 1'b0;
  end
  else if(rd_data_create_en && !cur_rdata_buf_crt1_sel)
  begin
    cur_rdata_buf0_rid[4:0]     <= pad_biu_rid[4:0];
    cur_rdata_buf0_rdata[127:0] <= pad_biu_rdata[127:0];
    cur_rdata_buf0_rresp[3:0]   <= pad_biu_rresp[3:0];
    cur_rdata_buf0_rlast        <= pad_biu_rlast;
  end
  else
  begin
    cur_rdata_buf0_rid[4:0]     <= cur_rdata_buf0_rid[4:0];
    cur_rdata_buf0_rdata[127:0] <= cur_rdata_buf0_rdata[127:0];
    cur_rdata_buf0_rresp[3:0]   <= cur_rdata_buf0_rresp[3:0];
    cur_rdata_buf0_rlast        <= cur_rdata_buf0_rlast;
  end
end

always @(posedge rcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_rdata_buf1_rvalid <= 1'b0;
  else if(rd_data_create_en && cur_rdata_buf_crt1_sel)
    cur_rdata_buf1_rvalid <= 1'b1;
  else if(rd_data_clr_en && cur_rdata_buf_pop1_sel)
    cur_rdata_buf1_rvalid <= 1'b0;
  else
    cur_rdata_buf1_rvalid <= cur_rdata_buf1_rvalid;
end

always @(posedge rcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_rdata_buf1_rid[4:0]     <= 5'b0;
    cur_rdata_buf1_rdata[127:0] <= 128'b0;
    cur_rdata_buf1_rresp[3:0]   <= 4'b0;
    cur_rdata_buf1_rlast        <= 1'b0;
  end
  else if(rd_data_create_en && cur_rdata_buf_crt1_sel)
  begin
    cur_rdata_buf1_rid[4:0]     <= pad_biu_rid[4:0];
    cur_rdata_buf1_rdata[127:0] <= pad_biu_rdata[127:0];
    cur_rdata_buf1_rresp[3:0]   <= pad_biu_rresp[3:0];
    cur_rdata_buf1_rlast        <= pad_biu_rlast;
  end
  else
  begin
    cur_rdata_buf1_rid[4:0]     <= cur_rdata_buf1_rid[4:0];
    cur_rdata_buf1_rdata[127:0] <= cur_rdata_buf1_rdata[127:0];
    cur_rdata_buf1_rresp[3:0]   <= cur_rdata_buf1_rresp[3:0];
    cur_rdata_buf1_rlast        <= cur_rdata_buf1_rlast;
  end
end
//**********************************************************
//           read data channel : return data to lsu/ifu     
//           resp: [3]  ==1'b1 |IsShared :other CPU dcache has the data;only lsu
//                 [2]  ==1'b1 |passdirty:donot support
//                 [1]  ==1'b1 |Error
//                 [1:0]==2'b00|OKAY
//                 [1:0]==2'b01|EXOKAY;only lsu exclusive acess
//**********************************************************
assign biu_lsu_r_vld         = cur_rdata_is_lsu && !rack_full;
assign biu_lsu_r_id[4:0]     = cur_rdata_buf_rid[4:0];
assign biu_lsu_r_data[127:0] = cur_rdata_buf_rdata[127:0];
assign biu_lsu_r_resp[3:0]   = cur_rdata_buf_rresp[3:0];
assign biu_lsu_r_last        = cur_rdata_buf_rlast;

assign biu_ifu_rd_data_vld    = cur_rdata_is_ifu && !rack_full;
assign biu_ifu_rd_id          = cur_rdata_buf_rid[0]; 
assign biu_ifu_rd_data[127:0] = cur_rdata_buf_rdata[127:0];
assign biu_ifu_rd_resp[1:0]   = cur_rdata_buf_rresp[1:0];
assign biu_ifu_rd_last        = cur_rdata_buf_rlast;



//**********************************************************
//                 Gated Clk EN
//**********************************************************
assign read_ar_clk_en =  cur_raddr_buf_arvalid
                         || arvalid_gate;

assign read_r_clk_en  = cur_rdata_buf_ready //data acpet,for timing,neglect rvalid
                        || rd_data_clr_en;     //data inv(send to ifu/lsu)

//for low power
assign read_busy = cur_raddr_buf_arvalid
                   || cur_rdata_buf_rvalid 
                   || rack_valid 
                   || rack_pending; 

// &ModuleEnd; @486
endmodule


