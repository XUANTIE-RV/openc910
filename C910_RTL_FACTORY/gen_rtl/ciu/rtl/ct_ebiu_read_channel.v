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
module ct_ebiu_read_channel(
  ca_rd_addr_hit_cawt,
  ciu_icg_en,
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
  ebiu_ebiuif_ar_grant,
  ebiu_ebiuif_ar_grant_gate,
  ebiu_ebiuif_entry_sel,
  ebiu_ebiuif_rdata,
  ebiu_ebiuif_rlast,
  ebiu_ebiuif_rresp,
  ebiu_ebiuif_snb0_rvalid,
  ebiu_ebiuif_snb1_rvalid,
  ebiu_ncq_ar_grant,
  ebiu_ncq_ar_grant_gate,
  ebiu_ncq_rdata,
  ebiu_ncq_rid,
  ebiu_ncq_rlast,
  ebiu_ncq_rresp,
  ebiu_ncq_rvalid,
  ebiu_pad_araddr,
  ebiu_pad_arburst,
  ebiu_pad_arcache,
  ebiu_pad_arid,
  ebiu_pad_arlen,
  ebiu_pad_arlock,
  ebiu_pad_arprot,
  ebiu_pad_arsize,
  ebiu_pad_arvalid,
  ebiu_pad_rack,
  ebiu_pad_rready,
  ebiu_read_channel_no_op,
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
  ebiuif_ebiu_r_grant,
  forever_cpuclk,
  nc_wo_rd_depd_ncwt,
  ncq_ebiu_arvalid,
  ncq_ebiu_r_grant,
  ncq_so_vld,
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
  pad_ebiu_arready,
  pad_ebiu_rdata,
  pad_ebiu_rid,
  pad_ebiu_rlast,
  pad_ebiu_rresp,
  pad_ebiu_rvalid,
  pad_yy_icg_scan_en
);

// &Ports; @25
input   [31 :0]  ca_rd_addr_hit_cawt;      
input            ciu_icg_en;               
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
input            ebiuif_ebiu_r_grant;      
input            forever_cpuclk;           
input   [15 :0]  nc_wo_rd_depd_ncwt;       
input            ncq_ebiu_arvalid;         
input            ncq_ebiu_r_grant;         
input   [3  :0]  ncq_so_vld;               
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
input            pad_ebiu_arready;         
input   [127:0]  pad_ebiu_rdata;           
input   [7  :0]  pad_ebiu_rid;             
input            pad_ebiu_rlast;           
input   [1  :0]  pad_ebiu_rresp;           
input            pad_ebiu_rvalid;          
input            pad_yy_icg_scan_en;       
output           ebiu_ctcq_ar_grant;       
output  [5  :0]  ebiu_ctcq_rid;            
output           ebiu_ctcq_rvalid;         
output           ebiu_ebiuif_ar_grant;     
output           ebiu_ebiuif_ar_grant_gate; 
output  [23 :0]  ebiu_ebiuif_entry_sel;    
output  [127:0]  ebiu_ebiuif_rdata;        
output           ebiu_ebiuif_rlast;        
output  [3  :0]  ebiu_ebiuif_rresp;        
output           ebiu_ebiuif_snb0_rvalid;  
output           ebiu_ebiuif_snb1_rvalid;  
output           ebiu_ncq_ar_grant;        
output           ebiu_ncq_ar_grant_gate;   
output  [127:0]  ebiu_ncq_rdata;           
output  [7  :0]  ebiu_ncq_rid;             
output           ebiu_ncq_rlast;           
output  [1  :0]  ebiu_ncq_rresp;           
output           ebiu_ncq_rvalid;          
output  [39 :0]  ebiu_pad_araddr;          
output  [1  :0]  ebiu_pad_arburst;         
output  [3  :0]  ebiu_pad_arcache;         
output  [7  :0]  ebiu_pad_arid;            
output  [7  :0]  ebiu_pad_arlen;           
output           ebiu_pad_arlock;          
output  [2  :0]  ebiu_pad_arprot;          
output  [2  :0]  ebiu_pad_arsize;          
output           ebiu_pad_arvalid;         
output           ebiu_pad_rack;            
output           ebiu_pad_rready;          
output           ebiu_read_channel_no_op;  

// &Regs; @26
reg     [2  :0]  ar_snb_sel;               
reg              ctcq_two_trans_mask;      
reg     [39 :0]  cur_raddr_buf_araddr;     
reg     [1  :0]  cur_raddr_buf_arbar;      
reg     [1  :0]  cur_raddr_buf_arburst;    
reg     [3  :0]  cur_raddr_buf_arcache;    
reg     [1  :0]  cur_raddr_buf_ardomain;   
reg     [7  :0]  cur_raddr_buf_arid;       
reg     [7  :0]  cur_raddr_buf_arlen;      
reg              cur_raddr_buf_arlock;     
reg     [2  :0]  cur_raddr_buf_arprot;     
reg     [2  :0]  cur_raddr_buf_arsize;     
reg     [3  :0]  cur_raddr_buf_arsnoop;    
reg              cur_raddr_buf_arvalid;    
reg              ebiu_pad_rack;            
reg              ebiu_pad_rready;          
reg     [1  :0]  rack_cnt;                 

// &Wires; @27
wire             arctrl_clk;               
wire             arctrl_clk_en;            
wire             ardp_clk;                 
wire             ardp_clk_en;              
wire    [31 :0]  ca_rd_addr_hit_cawt;      
wire             ciu_icg_en;               
wire             clk_en;                   
wire             cpurst_b;                 
wire             ctc_ar_req;               
wire             ctc_ar_sel;               
wire             ctc_select;               
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
wire             cur_raddr_buf_ready;      
wire    [3  :0]  ebiu_bus_rresp;           
wire             ebiu_ctcq_ar_grant;       
wire    [5  :0]  ebiu_ctcq_rid;            
wire             ebiu_ctcq_rvalid;         
wire             ebiu_ebiuif_ar_grant;     
wire             ebiu_ebiuif_ar_grant_gate; 
wire    [23 :0]  ebiu_ebiuif_entry_sel;    
wire    [127:0]  ebiu_ebiuif_rdata;        
wire             ebiu_ebiuif_rlast;        
wire    [3  :0]  ebiu_ebiuif_rresp;        
wire             ebiu_ebiuif_snb0_rvalid;  
wire             ebiu_ebiuif_snb1_rvalid;  
wire             ebiu_ncq_ar_grant;        
wire             ebiu_ncq_ar_grant_gate;   
wire    [127:0]  ebiu_ncq_rdata;           
wire    [7  :0]  ebiu_ncq_rid;             
wire             ebiu_ncq_rlast;           
wire    [1  :0]  ebiu_ncq_rresp;           
wire             ebiu_ncq_rvalid;          
wire    [39 :0]  ebiu_pad_araddr;          
wire    [1  :0]  ebiu_pad_arburst;         
wire    [3  :0]  ebiu_pad_arcache;         
wire    [7  :0]  ebiu_pad_arid;            
wire    [7  :0]  ebiu_pad_arlen;           
wire             ebiu_pad_arlock;          
wire    [2  :0]  ebiu_pad_arprot;          
wire    [2  :0]  ebiu_pad_arsize;          
wire             ebiu_pad_arvalid;         
wire             ebiu_read_channel_no_op;  
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
wire             ebiuif_ebiu_r_grant;      
wire    [23 :0]  entry_sel;                
wire             forever_cpuclk;           
wire    [15 :0]  nc_wo_rd_depd_ncwt;       
wire             ncq_ar_req;               
wire             ncq_ar_sel;               
wire             ncq_ebiu_arvalid;         
wire             ncq_ebiu_r_grant;         
wire             ncq_select;               
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
wire             pad_ebiu_arready;         
wire    [127:0]  pad_ebiu_rdata;           
wire    [7  :0]  pad_ebiu_rid;             
wire             pad_ebiu_rlast;           
wire    [1  :0]  pad_ebiu_rresp;           
wire             pad_ebiu_rvalid;          
wire             pad_yy_icg_scan_en;       
wire             rack_cnt_dec;             
wire             rack_cnt_inc;             
wire             rack_vld;                 
wire             rd_req_create_en;         
wire             rd_req_pop_en;            
wire    [168:0]  rfifo_create_bus;         
wire             rfifo_create_en;          
wire             rfifo_empty;              
wire             rfifo_full;               
wire    [168:0]  rfifo_pop_bus;            
wire             rfifo_pop_bus_vld;        
wire             rfifo_pop_ctc_sel;        
wire             rfifo_pop_en;             
wire    [23 :0]  rfifo_pop_entry_sel;      
wire             rfifo_pop_ncq_sel;        
wire    [127:0]  rfifo_pop_rdata;          
wire    [7  :0]  rfifo_pop_rid;            
wire             rfifo_pop_rlast;          
wire    [3  :0]  rfifo_pop_rresp;          
wire             rfifo_pop_snb0_sel;       
wire             rfifo_pop_snb1_sel;       
wire             rready_set;               
wire             snb0_select;              
wire             snb1_select;              
wire             snb_ar_req;               
wire             snb_ar_sel;               
wire             snb_select;               


parameter ADDRW = `PA_WIDTH;

//==========================================================
//           read address channel
//==========================================================
//--------------------------------------
//    request arbiter
//--------------------------------------
always @(posedge arctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ctcq_two_trans_mask <= 1'b0;
  else if (ctc_ar_req & cur_raddr_buf_ready)
    ctcq_two_trans_mask <= ctcq_ebiu_araddr[0];
end

assign ncq_ar_sel = ncq_ebiu_arvalid & !ctcq_two_trans_mask & 
                   (ar_snb_sel[0] | (!ebiuif_ebiu_arvalid & !ctcq_ebiu_arvalid));

assign snb_ar_sel = ebiuif_ebiu_arvalid & !ctcq_two_trans_mask &
                   (ar_snb_sel[1] | (!ncq_ebiu_arvalid & !ctcq_ebiu_arvalid));

assign ctc_ar_sel = ctcq_ebiu_arvalid &
                   (ar_snb_sel[2] | (!ncq_ebiu_arvalid & !ebiuif_ebiu_arvalid));

assign ncq_ar_req = ncq_ar_sel && 
                   (ncq_xx_arcache[1] && !(|nc_wo_rd_depd_ncwt[15:0]) ||
                   !ncq_xx_arcache[1] && !(|((4'b1 << ncq_xx_arid[6:5]) & ncq_so_vld[3:0])));

assign snb_ar_req = snb_ar_sel && 
                   !(|ca_rd_addr_hit_cawt[31:0]);

assign ctc_ar_req = ctc_ar_sel;

always @(posedge arctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ar_snb_sel[2:0] <= 3'b1;
  else if (clk_en & (ncq_ebiu_arvalid | ebiuif_ebiu_arvalid | ctcq_ebiu_arvalid))
    ar_snb_sel[2:0] <= {ar_snb_sel[1:0],ar_snb_sel[2]};
end

//--------------------------------------
//  read addr channel                        
//cur_raddr_buf:
//| cur_raddr_buf_arvalid | cur_raddr_buf_arid | cur_raddr_buf_araddr |
//|             ..._arlen |         ..._arsize |          ..._arburst |
//|            ..._arlock |        ..._arcache |           ..._arprot |
//--------------------------------------
assign ebiu_ncq_ar_grant    = ncq_ar_req & cur_raddr_buf_ready;
assign ebiu_ebiuif_ar_grant = snb_ar_req & cur_raddr_buf_ready;
assign ebiu_ctcq_ar_grant   = ctc_ar_req & cur_raddr_buf_ready;

assign ebiu_ncq_ar_grant_gate    = ncq_ar_sel & cur_raddr_buf_ready;
assign ebiu_ebiuif_ar_grant_gate = snb_ar_sel & cur_raddr_buf_ready;

assign rd_req_create_en = (ncq_ar_req | snb_ar_req | ctc_ar_req) & cur_raddr_buf_ready;

assign cur_raddr_buf_ready = (!cur_raddr_buf_arvalid || pad_ebiu_arready)
                           && clk_en;

assign rd_req_pop_en = cur_raddr_buf_arvalid && pad_ebiu_arready  
                    && clk_en;
                    
always @(posedge arctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    cur_raddr_buf_arvalid <= 1'b0;
  else if(rd_req_create_en)
    cur_raddr_buf_arvalid <= 1'b1;
  else if(rd_req_pop_en)
    cur_raddr_buf_arvalid <= 1'b0;
  else
    cur_raddr_buf_arvalid <= cur_raddr_buf_arvalid;
end

// &Force("bus","ncq_xx_arid",7,0); @105
always @(posedge ardp_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
  begin
    cur_raddr_buf_arid[7:0]          <= 8'b0;
    cur_raddr_buf_araddr[ADDRW-1:0]  <= {ADDRW{1'b0}};
    cur_raddr_buf_arlen[7:0]         <= 8'b0;
    cur_raddr_buf_arsize[2:0]        <= 3'b0;
    cur_raddr_buf_arburst[1:0]       <= 2'b0;
    cur_raddr_buf_arlock             <= 1'b0;
    cur_raddr_buf_arcache[3:0]       <= 4'b0;
    cur_raddr_buf_arprot[2:0]        <= 3'b0;
    cur_raddr_buf_arsnoop[3:0]       <= 4'b0;
    cur_raddr_buf_ardomain[1:0]      <= 2'b0;
    cur_raddr_buf_arbar[1:0]         <= 2'b0;
  end
  else if (rd_req_create_en)
  begin
    if (ncq_ar_sel)
    begin
      cur_raddr_buf_arid[7:0]          <= {1'b0,ncq_xx_arid[6:0]};
      cur_raddr_buf_araddr[ADDRW-1:0]  <= ncq_xx_araddr[ADDRW-1:0];
      cur_raddr_buf_arlen[7:0]         <= ncq_xx_arlen[7:0];
      cur_raddr_buf_arsize[2:0]        <= ncq_xx_arsize[2:0];
      cur_raddr_buf_arburst[1:0]       <= ncq_xx_arburst[1:0];
      cur_raddr_buf_arlock             <= ncq_xx_arlock;
      cur_raddr_buf_arcache[3:0]       <= ncq_xx_arcache[3:0];
      cur_raddr_buf_arprot[2:0]        <= ncq_xx_arprot[2:0];
      cur_raddr_buf_arsnoop[3:0]       <= ncq_xx_arsnoop[3:0];
      cur_raddr_buf_ardomain[1:0]      <= ncq_xx_ardomain[1:0];
      cur_raddr_buf_arbar[1:0]         <= ncq_xx_arbar[1:0];
    end
    else if (snb_ar_sel)
    begin
      cur_raddr_buf_arid[7:0]          <= {2'b10,ebiuif_ebiu_arid[5:0]};
      cur_raddr_buf_araddr[ADDRW-1:0]  <= ebiuif_ebiu_araddr[ADDRW-1:0];
      cur_raddr_buf_arlen[7:0]         <= ebiuif_ebiu_arlen[7:0];
      cur_raddr_buf_arsize[2:0]        <= ebiuif_ebiu_arsize[2:0];
      cur_raddr_buf_arburst[1:0]       <= ebiuif_ebiu_arburst[1:0];
      cur_raddr_buf_arlock             <= ebiuif_ebiu_arlock;
      cur_raddr_buf_arcache[3:0]       <= ebiuif_ebiu_arcache[3:0];
      cur_raddr_buf_arprot[2:0]        <= ebiuif_ebiu_arprot[2:0];
      cur_raddr_buf_arsnoop[3:0]       <= ebiuif_ebiu_arsnoop[3:0];
      cur_raddr_buf_ardomain[1:0]      <= ebiuif_ebiu_ardomain[1:0];
      cur_raddr_buf_arbar[1:0]         <= ebiuif_ebiu_arbar[1:0];
    end
    else
    begin
      cur_raddr_buf_arid[7:0]          <= {2'b11,ctcq_ebiu_arid[5:0]};
      cur_raddr_buf_araddr[ADDRW-1:0]  <= ctcq_ebiu_araddr[ADDRW-1:0];
      cur_raddr_buf_arlen[7:0]         <= ctcq_ebiu_arlen[7:0];
      cur_raddr_buf_arsize[2:0]        <= ctcq_ebiu_arsize[2:0];
      cur_raddr_buf_arburst[1:0]       <= ctcq_ebiu_arburst[1:0];
      cur_raddr_buf_arlock             <= ctcq_ebiu_arlock;
      cur_raddr_buf_arcache[3:0]       <= ctcq_ebiu_arcache[3:0];
      cur_raddr_buf_arprot[2:0]        <= ctcq_ebiu_arprot[2:0];
      cur_raddr_buf_arsnoop[3:0]       <= ctcq_ebiu_arsnoop[3:0];
      cur_raddr_buf_ardomain[1:0]      <= ctcq_ebiu_ardomain[1:0];
      cur_raddr_buf_arbar[1:0]         <= ctcq_ebiu_arbar[1:0];
    end
  end
end

assign ebiu_pad_arvalid       = cur_raddr_buf_arvalid;
assign ebiu_pad_arid[7:0]     = cur_raddr_buf_arid[7:0];
assign ebiu_pad_araddr[ADDRW-1:0]  = cur_raddr_buf_araddr[ADDRW-1:0];
assign ebiu_pad_arlen[7:0]    = cur_raddr_buf_arlen[7:0];
assign ebiu_pad_arsize[2:0]   = cur_raddr_buf_arsize[2:0];
assign ebiu_pad_arburst[1:0]  = cur_raddr_buf_arburst[1:0];
assign ebiu_pad_arlock        = cur_raddr_buf_arlock;
assign ebiu_pad_arcache[3:0]  = cur_raddr_buf_arcache[3:0];
assign ebiu_pad_arprot[2:0]   = {cur_raddr_buf_arprot[2], 1'b1, cur_raddr_buf_arprot[0]};
// &Force("nonport","cur_raddr_buf_arsnoop"); @183
// &Force("nonport","cur_raddr_buf_ardomain"); @184
// &Force("nonport","cur_raddr_buf_arbar"); @185
// //&Force("nonport","ebiu_pad_rack"); @191



//==========================================================
//           read data channel
//==========================================================
parameter RWIDTH  = 169;
parameter RDATA_0 = 0;
parameter RDATA_H = 127;
parameter RLAST   = 128;
parameter RRESP_0 = 129;
parameter RRESP_3 = 132;
parameter RID_0   = 133;
parameter RID_7   = 140;
parameter SEL_0   = 141;
parameter SEL_H   = 164;
parameter SNB1_SEL = 165;
parameter SNB0_SEL = 166;
parameter NCQ_SEL  = 167;
parameter CTC_SEL  = 168;

// &Force("nonport", "rfifo_create_bus"); @248
// &Force("nonport", "rfifo_create_en"); @249
// &Force("nonport", "rfifo_empty"); @250
// &Force("nonport", "rfifo_full"); @251
// &Force("nonport", "rfifo_pop_bus"); @252
// &Force("nonport", "rfifo_pop_bus_vld"); @253
parameter DEPTH = `SAB_DEPTH;

assign rfifo_create_en = pad_ebiu_rvalid && ebiu_pad_rready && clk_en;

assign ncq_select  = !pad_ebiu_rid[7];
assign ctc_select  = (pad_ebiu_rid[7:6] == 2'b11);
assign snb_select  = (pad_ebiu_rid[7:6] == 2'b10);
assign snb0_select = snb_select && !pad_ebiu_rid[5];
assign snb1_select = snb_select &&  pad_ebiu_rid[5];

assign entry_sel[23:0] = 24'b1 << pad_ebiu_rid[4:0];

assign ebiu_bus_rresp[3:0] = {2'b00,pad_ebiu_rresp[1:0]};

assign rfifo_create_bus[RWIDTH-1:0] = {ctc_select,
                                       ncq_select,
                                       snb0_select,
                                       snb1_select,
                                       entry_sel[23:0],
                                       pad_ebiu_rid[7:0],
                                       ebiu_bus_rresp[3:0],
                                       pad_ebiu_rlast,
                                       pad_ebiu_rdata[127:0]};

assign rfifo_pop_en = ncq_ebiu_r_grant | ebiuif_ebiu_r_grant | ctcq_ebiu_r_grant;

ct_fifo #(.WIDTH(RWIDTH), .DEPTH(2), .PTR_W(1)) x_ct_ebiu_rfifo(
  .clk                 (forever_cpuclk       ),
  .rst_b               (cpurst_b             ),
  .fifo_create_en      (rfifo_create_en      ),
  .fifo_create_en_dp   (rfifo_create_en      ),
  .fifo_pop_en         (rfifo_pop_en         ),
  .fifo_create_data    (rfifo_create_bus     ),
  .fifo_pop_data       (rfifo_pop_bus        ),
  .fifo_pop_data_vld   (rfifo_pop_bus_vld    ),
  .fifo_full           (rfifo_full           ),
  .fifo_empty          (rfifo_empty          ),
  .pad_yy_icg_scan_en  (pad_yy_icg_scan_en   ),
  .fifo_icg_en           (ciu_icg_en)
);

assign rfifo_pop_rid[7:0]     = rfifo_pop_bus[RID_7:RID_0];
assign rfifo_pop_rdata[127:0] = rfifo_pop_bus[RDATA_H:RDATA_0];
assign rfifo_pop_rresp[3:0]   = rfifo_pop_bus[RRESP_3:RRESP_0];
assign rfifo_pop_rlast        = rfifo_pop_bus[RLAST];
assign rfifo_pop_ctc_sel      = rfifo_pop_bus[CTC_SEL];
assign rfifo_pop_ncq_sel      = rfifo_pop_bus[NCQ_SEL];
assign rfifo_pop_snb0_sel     = rfifo_pop_bus[SNB0_SEL];
assign rfifo_pop_snb1_sel     = rfifo_pop_bus[SNB1_SEL];
assign rfifo_pop_entry_sel[23:0] = rfifo_pop_bus[SEL_H:SEL_0];

//assign rfifo_pop_snb         = rfifo_pop_rid[7:5] == 3'b101;

assign ebiu_ncq_rvalid       = rfifo_pop_bus_vld && rfifo_pop_ncq_sel;
assign ebiu_ncq_rid[7:0]     = rfifo_pop_rid[7:0];
assign ebiu_ncq_rdata[127:0] = rfifo_pop_rdata[127:0];
assign ebiu_ncq_rresp[1:0]   = rfifo_pop_rresp[1:0];
assign ebiu_ncq_rlast        = rfifo_pop_rlast;

assign ebiu_ebiuif_snb0_rvalid  = rfifo_pop_bus_vld && rfifo_pop_snb0_sel;
assign ebiu_ebiuif_snb1_rvalid  = rfifo_pop_bus_vld && rfifo_pop_snb1_sel;
assign ebiu_ebiuif_rdata[127:0] = rfifo_pop_rdata[127:0];
assign ebiu_ebiuif_rresp[3:0]   = {2'b0,rfifo_pop_rresp[1:0]};

// &Force("nonport", "rfifo_pop_entry_sel"); @326
assign ebiu_ebiuif_rlast        = rfifo_pop_rlast;
assign ebiu_ebiuif_entry_sel[DEPTH-1:0] = rfifo_pop_entry_sel[DEPTH-1:0];

assign ebiu_ctcq_rvalid   = rfifo_pop_bus_vld & rfifo_pop_ctc_sel;
assign ebiu_ctcq_rid[5:0] = rfifo_pop_rid[5:0];

//--------------------------------------
//    rready
//--------------------------------------
// &Force("output", "ebiu_pad_rready"); @336

assign rready_set = rfifo_empty | 
                   ~rfifo_full & (rfifo_pop_en | ~rfifo_create_en) |
                    rfifo_full &  rfifo_pop_en & ~rfifo_create_en;

always @(posedge arctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ebiu_pad_rready <= 1'b1;
  else if (clk_en)
  begin
    if (rready_set)
       ebiu_pad_rready <= 1'b1;
    else
       ebiu_pad_rready <= 1'b0;
  end
  else
    ebiu_pad_rready <= ebiu_pad_rready;
end

//--------------------------------------
//       RACK
//--------------------------------------
// &Force("output","ebiu_pad_rack"); @360

assign rack_cnt_inc = rfifo_pop_en & rfifo_pop_rlast;
assign rack_cnt_dec = clk_en & (|rack_cnt[1:0]);

always @(posedge arctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    rack_cnt[1:0] <= 2'b0;
  else if (rack_cnt_inc & !rack_cnt_dec)
    rack_cnt[1:0] <= rack_cnt[1:0] + 2'b1;
  else if (!rack_cnt_inc & rack_cnt_dec)
    rack_cnt[1:0] <= rack_cnt[1:0] - 2'b1;
end

always @(posedge arctrl_clk or negedge cpurst_b)
begin
  if (!cpurst_b)
    ebiu_pad_rack <= 1'b0;
  else if (clk_en)
  begin
    if ((|rack_cnt[1:0]))
      ebiu_pad_rack <= 1'b1;
    else
      ebiu_pad_rack <= 1'b0;
  end
end

assign rack_vld = (|rack_cnt[1:0]) || ebiu_pad_rack;
//--------------------------------------
//      gated clock
//--------------------------------------
assign ebiu_read_channel_no_op = !cur_raddr_buf_arvalid & !rack_vld & rfifo_empty;

assign ardp_clk_en = (ncq_ar_sel | snb_ar_sel | ctc_ar_sel) & cur_raddr_buf_ready;

// &Instance("gated_clk_cell", "x_ebiu_ardp_gated_clk"); @396
gated_clk_cell  x_ebiu_ardp_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ardp_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (ardp_clk_en       ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @397
//          .external_en (1'b0), @398
//          .global_en   (1'b1), @399
//          .module_en   (ciu_icg_en), @400
//          .local_en    (ardp_clk_en), @401
//          .clk_out     (ardp_clk)); @402

assign arctrl_clk_en = clk_en & (ctcq_ebiu_arvalid | ncq_ebiu_arvalid | ebiuif_ebiu_arvalid) |
                       rd_req_pop_en | 
                       clk_en & (rready_set | ebiu_pad_rready) | 
                       rfifo_pop_en | (|rack_cnt[1:0]) | ebiu_pad_rack;

// &Instance("gated_clk_cell", "x_ebiu_arctrl_gated_clk"); @409
gated_clk_cell  x_ebiu_arctrl_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (arctrl_clk        ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (arctrl_clk_en     ),
  .module_en          (ciu_icg_en        ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in      (forever_cpuclk), @410
//          .external_en (1'b0), @411
//          .global_en   (1'b1), @412
//          .module_en   (ciu_icg_en), @413
//          .local_en    (arctrl_clk_en), @414
//          .clk_out     (arctrl_clk)); @415


// &ModuleEnd; @440
endmodule


 
