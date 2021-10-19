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





















module axi2ahb(
  biu_pad_araddr,
  biu_pad_arburst,
  biu_pad_arcache,
  biu_pad_arid,
  biu_pad_arlen,
  biu_pad_arlock,
  biu_pad_arprot,
  biu_pad_arsize,
  biu_pad_artrust,
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
  biu_pad_haddr,
  biu_pad_hburst,
  biu_pad_hbusreq,
  biu_pad_hlock,
  biu_pad_hprot,
  biu_pad_hsize,
  biu_pad_htrans,
  biu_pad_hwdata,
  biu_pad_hwrite,
  biu_pad_rready,
  biu_pad_wdata,
  biu_pad_wid,
  biu_pad_wlast,
  biu_pad_wstrb,
  biu_pad_wvalid,
  pad_biu_arready,
  pad_biu_awready,
  pad_biu_bid,
  pad_biu_bresp,
  pad_biu_bvalid,
  pad_biu_hgrant,
  pad_biu_hrdata,
  pad_biu_hready,
  pad_biu_hresp,
  pad_biu_rdata,
  pad_biu_rid,
  pad_biu_rlast,
  pad_biu_rresp,
  pad_biu_rvalid,
  pad_biu_wready,
  pad_cpu_rst_b,
  pll_core_cpuclk
);


input   [39 :0]  biu_pad_araddr;     
input   [1  :0]  biu_pad_arburst;    
input   [3  :0]  biu_pad_arcache;    
input   [7  :0]  biu_pad_arid;       
input   [7  :0]  biu_pad_arlen;      
input            biu_pad_arlock;     
input   [2  :0]  biu_pad_arprot;     
input   [2  :0]  biu_pad_arsize;     
input            biu_pad_artrust;    
input            biu_pad_arvalid;    
input   [39 :0]  biu_pad_awaddr;     
input   [1  :0]  biu_pad_awburst;    
input   [3  :0]  biu_pad_awcache;    
input   [7  :0]  biu_pad_awid;       
input   [7  :0]  biu_pad_awlen;      
input            biu_pad_awlock;     
input   [2  :0]  biu_pad_awprot;     
input   [2  :0]  biu_pad_awsize;     
input            biu_pad_awvalid;    
input            biu_pad_bready;     
input            biu_pad_rready;     
input   [127:0]  biu_pad_wdata;      
input   [7  :0]  biu_pad_wid;        
input            biu_pad_wlast;      
input   [15 :0]  biu_pad_wstrb;      
input            biu_pad_wvalid;     
input            pad_biu_hgrant;     
input   [127:0]  pad_biu_hrdata;     
input            pad_biu_hready;     
input   [1  :0]  pad_biu_hresp;      
input            pad_cpu_rst_b;      
input            pll_core_cpuclk;    
output  [39 :0]  biu_pad_haddr;      
output  [2  :0]  biu_pad_hburst;     
output           biu_pad_hbusreq;    
output           biu_pad_hlock;      
output  [3  :0]  biu_pad_hprot;      
output  [2  :0]  biu_pad_hsize;      
output  [1  :0]  biu_pad_htrans;     
output  [127:0]  biu_pad_hwdata;     
output           biu_pad_hwrite;     
output           pad_biu_arready;    
output           pad_biu_awready;    
output  [7  :0]  pad_biu_bid;        
output  [1  :0]  pad_biu_bresp;      
output           pad_biu_bvalid;     
output  [127:0]  pad_biu_rdata;      
output  [7  :0]  pad_biu_rid;        
output           pad_biu_rlast;      
output  [1  :0]  pad_biu_rresp;      
output           pad_biu_rvalid;     
output           pad_biu_wready;     


reg     [39 :0]  addr_wrap;          
reg              ahb_rd_en;          
reg              ahb_trans_noseq;    
reg              ahb_trans_seq;      
reg              ahb_wr_en;          
reg     [7  :0]  arid_flop;          
reg     [7  :0]  awid_flop;          
reg              axi_rd_en;          
reg              axi_rd_en_first;    
reg              axi_wr_en;          
reg     [39 :0]  biu_pad_haddr;      
reg     [2  :0]  biu_pad_hburst;     
reg              biu_pad_hlock;      
reg     [3  :0]  biu_pad_hprot;      
reg     [2  :0]  biu_pad_hsize;      
reg     [1  :0]  biu_pad_htrans;     
reg              biu_pad_hwrite;     
reg              clr_ptr;            
reg     [8  :0]  cur_st;             
reg     [127:0]  db_out_reg;         
reg     [127:0]  entry_data  [7:0]; 
reg     [7  :0]  entry_tea;          
reg              first_read_flag;    
reg              first_trans_en;     
reg     [8  :0]  nxt_st;             
reg     [1  :0]  pad_biu_bresp;      
reg     [2  :0]  pre_hburst;         
reg     [7  :0]  rd_cnt;             
reg              rd_cnt_ld;          
reg              rd_cnt_sub;         
reg     [3  :0]  rptr;               
reg     [1  :0]  rresp_reg;          
reg     [7  :0]  trans_len_flop;     
reg     [3  :0]  wptr;               
reg     [7  :0]  wr_cnt;             
reg              wr_cnt_ld;          
reg              wr_cnt_sub;         


wire             ahb_rd_cplt;        
wire             ahb_tea;            
wire             ahb_trans_hold;     
wire             ahb_trans_seq_en;   
wire             ahb_wr_cplt;        
wire             ahb_wr_tea;         
wire             axi_rd_vld;         
wire             axi_wr_vld;         
wire    [39 :0]  biu_pad_araddr;     
wire    [1  :0]  biu_pad_arburst;    
wire    [3  :0]  biu_pad_arcache;    
wire    [7  :0]  biu_pad_arid;       
wire    [7  :0]  biu_pad_arlen;      
wire             biu_pad_arlock;     
wire    [2  :0]  biu_pad_arprot;     
wire    [2  :0]  biu_pad_arsize;     
wire             biu_pad_artrust;    
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
wire             biu_pad_bready;     
wire             biu_pad_hbusreq;    
wire    [127:0]  biu_pad_hwdata;     
wire             biu_pad_rready;     
wire    [127:0]  biu_pad_wdata;      
wire             biu_pad_wlast;      
wire             biu_pad_wvalid;     
wire             bresp_hold;         
wire             bresp_update;       
wire             buffer_empty;       
wire    [127:0]  db_input_data;      
wire             db_input_tea;       
wire             db_rd;              
wire             db_wr;              
wire             first_read_flag_clr; 
wire             haddr_update;       
wire             last_ctrl;          
wire    [8  :0]  nxt_st_dly;         
wire             pad_biu_arready;    
wire             pad_biu_awready;    
wire    [7  :0]  pad_biu_bid;        
wire             pad_biu_bvalid;     
wire             pad_biu_hgrant;     
wire    [127:0]  pad_biu_hrdata;     
wire             pad_biu_hready;     
wire    [1  :0]  pad_biu_hresp;      
wire    [127:0]  pad_biu_rdata;      
wire    [7  :0]  pad_biu_rid;        
wire             pad_biu_rlast;      
wire    [1  :0]  pad_biu_rresp;      
wire             pad_biu_rvalid;     
wire             pad_biu_wready;     
wire             pad_cpu_rst_b;      
wire             pll_core_cpuclk;    
wire             rd_cnt_sub_en;      
wire             rd_cnt_zero;        
wire             readaxi_last_data;  
wire    [39 :0]  trans_addr;         
wire    [1  :0]  trans_burst;        
wire    [3  :0]  trans_cache;        
wire    [7  :0]  trans_len;          
wire    [1  :0]  trans_lock;         
wire    [2  :0]  trans_prot;         
wire             trans_req_vld;      
wire             trans_sec;          
wire    [2  :0]  trans_size;         
wire             wr_cnt_sub_en;      
wire             wr_cnt_zero;        
wire             wrap2;              
wire             wrap4;              
wire             wrap8;              






























parameter  FSM_IDLE     =9'b000000001, 
           RD_AXI       =9'b000000010, 
           WR_AHB       =9'b000000100, 
           WR_LAST_DATA =9'b000001000,
           RESP_AXI     =9'b000010000,
           
           RD_AHB       =9'b000100000,
           RD_LAST_DATA =9'b001000000,
           WR_AXI       =9'b010000000,
           WT_DB_WR     =9'b100000000; 



always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    begin
      cur_st[8:0] <= FSM_IDLE;
    end
  else //if (clk_en)
    begin
      cur_st[8:0] <= nxt_st_dly[8:0];
    end
end

assign #1 nxt_st_dly[8:0] = nxt_st[8:0];


always @( readaxi_last_data
       or ahb_rd_cplt
       or biu_pad_awvalid
       or ahb_tea
       or biu_pad_rready
       or biu_pad_bready
       or ahb_wr_cplt
       or buffer_empty
       or biu_pad_arvalid
       or cur_st[8:0]
       or pad_biu_hready)
begin
clr_ptr=0;
wr_cnt_ld=0;
rd_cnt_ld=0;
first_trans_en=0;
ahb_trans_noseq=0;
ahb_rd_en=0;
wr_cnt_sub=0;
rd_cnt_sub =0;
ahb_trans_seq=0;
axi_rd_en=0;
ahb_wr_en=0;
axi_wr_en=0;
axi_rd_en_first=0;
case(cur_st[8:0])
FSM_IDLE:
  begin
    clr_ptr=1;
    if(biu_pad_awvalid) 
      begin
        nxt_st[8:0]=RD_AXI;
        wr_cnt_ld=1;
      end
    else if (biu_pad_arvalid) 
      begin
        nxt_st[8:0]=RD_AHB;
        rd_cnt_ld=1;
        ahb_trans_noseq=1;
        first_trans_en=1;           //first trans contrl ending cannot access data 
      end
    else
      begin
        nxt_st[8:0]=FSM_IDLE;
      end
  end
RD_AXI:
  begin
    axi_wr_en=1;

    if(readaxi_last_data) 
      begin
        nxt_st[8:0]=WR_AHB;
        ahb_trans_noseq=1;
      end
    else 
      begin
        nxt_st[8:0]=RD_AXI;
      end
  end
WR_AHB:
  begin
    ahb_rd_en=1;
    wr_cnt_sub=1;
    ahb_trans_seq=1;
    if (ahb_tea) 
      begin
        nxt_st[8:0]=RESP_AXI;
      end

    else if(ahb_wr_cplt) 
      begin
        nxt_st[8:0]=WR_LAST_DATA;
      end
    else 
      begin
        nxt_st[8:0]=WR_AHB;
      end
  end      
WR_LAST_DATA:
  begin
    if(pad_biu_hready) 
      begin
        nxt_st[8:0]=RESP_AXI;
      end
    else 
      begin
        nxt_st[8:0]=WR_LAST_DATA;
      end
  end
RESP_AXI:
  begin 
    if(biu_pad_bready) 
      begin
        nxt_st[8:0]=FSM_IDLE;
      end
    else 
      begin
        nxt_st[8:0]=RESP_AXI;
      end
  end
RD_AHB:
  begin
    ahb_trans_seq=1;
    rd_cnt_sub =1;
    ahb_wr_en=1;

    if (ahb_rd_cplt) 
      begin
        nxt_st[8:0]=RD_LAST_DATA;
      end
    else 
      begin
        nxt_st[8:0]=RD_AHB;
      end
  end
RD_LAST_DATA:
  begin
    ahb_wr_en=1;
    if(pad_biu_hready)
      begin
        nxt_st[8:0]=WT_DB_WR;
      end
    else 
      begin
        nxt_st[8:0]=RD_LAST_DATA;
      end
  end
WT_DB_WR:
  begin
      axi_rd_en_first=1;
      nxt_st[8:0]=WR_AXI;
  end
WR_AXI:
  begin
    axi_rd_en=1;
    if(buffer_empty && biu_pad_rready) 
      begin
        nxt_st[8:0]=FSM_IDLE;
      end
    else 
      begin
        nxt_st[8:0]=WR_AXI;
      end
  end
default:
  begin
    nxt_st[8:0]=WR_AXI;
  end  
endcase 

end




assign #1 readaxi_last_data   = biu_pad_wlast && biu_pad_wvalid;
assign ahb_wr_cplt         = (~|wr_cnt[7:0]) && pad_biu_hready; 
assign ahb_rd_cplt         = (~|rd_cnt[7:0]) && pad_biu_hready; 
assign buffer_empty        = (wptr[3:0]==rptr[3:0]);


assign first_read_flag_clr = cur_st[5] && pad_biu_hready;

always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    begin
      first_read_flag<=1'b0;
    end
  else if(first_trans_en) 
    begin
      first_read_flag<=1'b1;
    end

  else if (first_read_flag_clr)
    begin
      first_read_flag<=1'b0;
    end
  else 
    begin
      first_read_flag<=first_read_flag;
    end    
end    


assign wr_cnt_sub_en  =  wr_cnt_sub && pad_biu_hready;

always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    begin
      wr_cnt[7:0]<=8'b0;
    end
  else if(wr_cnt_ld) 
    begin
      wr_cnt[7:0]<=biu_pad_awlen[7:0];
    end

  else if (wr_cnt_sub_en)
    begin
      wr_cnt[7:0]<=wr_cnt[7:0]-1'b1;
    end
  else 
    begin
      wr_cnt[7:0]<=wr_cnt[7:0];
    end    
end 
  
assign wr_cnt_zero   = ~|wr_cnt[7:0];
assign rd_cnt_sub_en = rd_cnt_sub && pad_biu_hready;
always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    begin
      rd_cnt[7:0]<=8'b0;
    end
  else if(rd_cnt_ld) 
    begin
      rd_cnt[7:0]<=biu_pad_arlen[7:0];
    end

  else if (rd_cnt_sub_en)
    begin
      rd_cnt[7:0]<=rd_cnt[7:0]-1'b1;
    end
  else 
    begin
      rd_cnt[7:0]<=rd_cnt[7:0];
    end    
end 

assign rd_cnt_zero = ~|rd_cnt[7:0];

assign ahb_tea= pad_biu_hready && (|pad_biu_hresp[1:0]);





assign #1 db_wr=(ahb_wr_en && pad_biu_hready && !first_read_flag) || (axi_wr_en && biu_pad_wvalid);

always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    begin
      wptr[3:0]<=4'b0;
    end
  else if(clr_ptr) 
    begin
      wptr[3:0]<=4'b0;
    end 
  else if(db_wr) 
    begin
      wptr[3:0]<=wptr[3:0]+1'b1;
    end
  else 
    begin
      wptr[3:0]<=wptr[3:0];
    end    
end 

assign db_input_data[127:0]=biu_pad_hwrite?biu_pad_wdata[127:0]:pad_biu_hrdata[127:0];

assign db_input_tea =biu_pad_hwrite?0:ahb_tea;




always @(posedge pll_core_cpuclk)
begin
  if(db_wr)
    begin
      entry_data[wptr[2:0]] <= db_input_data[127:0];
      entry_tea[wptr[2:0]]  <= db_input_tea;
    end
end


assign db_rd=(ahb_rd_en && pad_biu_hready) || ((axi_rd_en && biu_pad_rready)|| axi_rd_en_first);


always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
  if(!pad_cpu_rst_b)
    begin
      rptr[3:0]<=4'b0;
    end
  else if(clr_ptr)
    begin
      rptr[3:0]<=4'b0;
    end 
  else if(db_rd) 
    begin
      rptr[3:0]<=rptr[3:0]+1'b1;
    end
  else 
    begin
      rptr[3:0]<=rptr[3:0];
    end    
end 

always @(posedge pll_core_cpuclk)
begin
  if(db_rd) 
    begin
      db_out_reg[127:0] <=   entry_data[rptr[2:0]];
      rresp_reg[1:0]    <=  {entry_tea[rptr[2:0]],1'b0};
    end
end




assign trans_req_vld=cur_st[0] && (biu_pad_awvalid || biu_pad_arvalid);

assign trans_addr[39:0]   = biu_pad_awvalid ? biu_pad_awaddr[39:0] : biu_pad_araddr[39:0];
assign trans_burst[1:0]   = biu_pad_awvalid ? biu_pad_awburst[1:0] : biu_pad_arburst[1:0];
assign trans_size[2:0]    = biu_pad_awvalid ? biu_pad_awsize[2:0]  : biu_pad_arsize[2:0];
assign trans_len[7:0]     = biu_pad_awvalid ? biu_pad_awlen[7:0]   : biu_pad_arlen[7:0];
assign trans_prot[2:0]    = biu_pad_awvalid ? biu_pad_awprot[2:0]  : biu_pad_arprot[2:0];
assign trans_lock[1:0]    = biu_pad_awvalid ? {1'b0,biu_pad_awlock}: {1'b0,biu_pad_arlock};
assign trans_cache[3:0]   = biu_pad_awvalid ? biu_pad_awcache[3:0] : biu_pad_arcache[3:0];

assign trans_sec  = biu_pad_awvalid ? 1'b0 : biu_pad_artrust;

always @(posedge pll_core_cpuclk)
  begin
    if(trans_req_vld) 
      begin
        trans_len_flop[7:0]  <= trans_len[7:0];
      end
  end

assign wrap2 = (trans_len_flop[7:0]==8'b1);
assign wrap4 = (trans_len_flop[7:0]==8'b11);
assign wrap8 = (trans_len_flop[7:0]==8'b111);

assign axi_wr_vld = cur_st[0] && biu_pad_awvalid;
always @(posedge pll_core_cpuclk)
  begin

    if(axi_wr_vld) 
      begin
        awid_flop[7:0]<=biu_pad_awid[7:0];
      end
  end

assign axi_rd_vld=cur_st[0] && biu_pad_arvalid && !biu_pad_awvalid;
always @(posedge pll_core_cpuclk)
  begin

    if(axi_rd_vld) 
      begin
        arid_flop[7:0]<=biu_pad_arid[7:0];
      end
  end




assign last_ctrl=biu_pad_hwrite?wr_cnt_zero:rd_cnt_zero;




always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
  begin
    if(!pad_cpu_rst_b) 
      begin
        biu_pad_htrans[1:0] <=  2'b00;
      end
    else if (ahb_trans_noseq)
      begin
        biu_pad_htrans[1:0] <=  2'b10;
      end

    else if(ahb_wr_tea) 
      begin
        biu_pad_htrans[1:0] <=  2'b00;   
      end 

    else if (ahb_trans_seq_en)
      begin
        biu_pad_htrans[1:0] <=  2'b11;
      end

    else if (ahb_trans_hold) 
      begin
        biu_pad_htrans[1:0] <= biu_pad_htrans[1:0];
      end
    else 
      begin
        biu_pad_htrans[1:0] <=  2'b00;
      end 
  end

assign ahb_wr_tea        = biu_pad_hwrite && ahb_trans_seq &&  ahb_tea;
assign ahb_trans_seq_en  = ahb_trans_seq && pad_biu_hready && (!last_ctrl);
assign ahb_trans_hold    = ahb_trans_seq && !pad_biu_hready;




always @(posedge pll_core_cpuclk)
  begin
    if(trans_req_vld) 
      begin
        biu_pad_haddr[39:0]<=trans_addr[39:0];
      end

    else if(haddr_update) 
      begin
        biu_pad_haddr[39:0]<=addr_wrap[39:0];
      end
  end

assign haddr_update =ahb_trans_seq && pad_biu_hready && (!last_ctrl);







always @( wrap4
       or wrap8
       or biu_pad_haddr[39:0]
       or wrap2)
begin
addr_wrap[39:7] = biu_pad_haddr[39:7];
addr_wrap[3:0]  = biu_pad_haddr[3:0];
case ({wrap8,wrap4,wrap2}) 
3'b001:
  begin
    addr_wrap[4]   =  ~biu_pad_haddr[4];
    addr_wrap[6:5] =  biu_pad_haddr[6:5];
  end
3'b010:
  begin
    addr_wrap[5:4] = biu_pad_haddr[5:4] + 1'b1;
    addr_wrap[6]   = biu_pad_haddr[6];
  end
3'b100:
  begin
    addr_wrap[6:4] = biu_pad_haddr[6:4] + 1'b1;
  end
default:
  begin
    addr_wrap[6:4] = biu_pad_haddr[6:4];
  end
endcase

end




assign biu_pad_hwdata[127:0]=db_out_reg[127:0];




always @(posedge pll_core_cpuclk)
  begin
    if(trans_req_vld) 
      begin
        biu_pad_hsize[2:0]<=trans_size[2:0];
      end
  end






always @( trans_len[7:0]
       or trans_burst[1:0])
begin
case({trans_len[7:4],trans_burst[1:0],trans_len[3:0]})
10'b010001:
  begin
    pre_hburst[2:0]=3'b001;
  end
10'b010011:
  begin
    pre_hburst[2:0]=3'b011;
  end
10'b010111:
  begin
    pre_hburst[2:0]=3'b101;
  end
10'b100001:
  begin
    pre_hburst[2:0]=3'b001;
  end
10'b100011:
  begin
    pre_hburst[2:0]=3'b010;
  end
10'b100111:
  begin
    pre_hburst[2:0]=3'b100;
  end
default:
  begin
    pre_hburst[2:0]=3'b001;     //default is undefined lenth burst
  end
endcase

end

always @(posedge pll_core_cpuclk)
  begin
    if(trans_req_vld) 
      begin
        biu_pad_hburst[2:0]<=pre_hburst[2:0];
      end
  end




always @(posedge pll_core_cpuclk)
  begin
    if(trans_req_vld) 
      begin
        biu_pad_hwrite<=biu_pad_awvalid;
      end
  end





always @(posedge pll_core_cpuclk)
  begin
    if(trans_req_vld) 
      begin
        biu_pad_hprot[3:0]<={trans_cache[1], trans_sec, trans_prot[0], trans_prot[2]};
      end
  end





always @(posedge pll_core_cpuclk)
  begin
    if(trans_req_vld)
      begin
        biu_pad_hlock<=(|trans_lock[1:0]);
      end
  end




assign biu_pad_hbusreq=ahb_trans_noseq && pad_biu_hgrant;










assign pad_biu_awready = cur_st[0] && biu_pad_awvalid;





assign pad_biu_wready = cur_st[1]; 





assign pad_biu_bid[7:0]=awid_flop[7:0];


always @(posedge pll_core_cpuclk)
  begin

    if(bresp_update) 
      begin
        pad_biu_bresp[1:0]<={ahb_tea,1'b0};
      end

    else if(bresp_hold) 
      begin
        pad_biu_bresp[1:0]<=pad_biu_bresp[1:0];
      end
    else 
      begin
        pad_biu_bresp[1:0]<=2'b0;
      end
  end

assign pad_biu_bvalid = cur_st[4];


assign bresp_update = (cur_st[2] || cur_st[3]) && pad_biu_hready;
assign bresp_hold   = cur_st[4] && !biu_pad_bready;




assign pad_biu_arready = cur_st[0] && biu_pad_arvalid && !biu_pad_awvalid;





assign pad_biu_rid[7:0]             = arid_flop[7:0];

assign pad_biu_rdata[127:0] = db_out_reg[127:0];


assign pad_biu_rresp[1:0]           = rresp_reg[1:0];
assign pad_biu_rvalid               = cur_st[7];
assign pad_biu_rlast                = cur_st[7] && buffer_empty ;


endmodule





