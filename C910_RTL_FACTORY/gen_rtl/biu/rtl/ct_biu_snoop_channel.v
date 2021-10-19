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
module ct_biu_snoop_channel(
  accpuclk,
  biu_lsu_ac_addr,
  biu_lsu_ac_prot,
  biu_lsu_ac_req,
  biu_lsu_ac_snoop,
  biu_lsu_cd_ready,
  biu_lsu_cr_ready,
  biu_pad_acready,
  biu_pad_cddata,
  biu_pad_cderr,
  biu_pad_cdlast,
  biu_pad_cdvalid,
  biu_pad_crresp,
  biu_pad_crvalid,
  biu_xx_snoop_vld,
  cdcpuclk,
  cpurst_b,
  crcpuclk,
  forever_coreclk,
  lsu_biu_ac_empty,
  lsu_biu_ac_ready,
  lsu_biu_cd_data,
  lsu_biu_cd_last,
  lsu_biu_cd_valid,
  lsu_biu_cr_resp,
  lsu_biu_cr_valid,
  pad_biu_acaddr,
  pad_biu_acprot,
  pad_biu_acsnoop,
  pad_biu_acvalid,
  pad_biu_cdready,
  pad_biu_crready,
  snoop_ac_clk_en,
  snoop_cd_clk_en,
  snoop_cr_clk_en
);

// &Ports; @23
input            accpuclk;               
input            cdcpuclk;               
input            cpurst_b;               
input            crcpuclk;               
input            forever_coreclk;        
input            lsu_biu_ac_empty;       
input            lsu_biu_ac_ready;       
input   [127:0]  lsu_biu_cd_data;        
input            lsu_biu_cd_last;        
input            lsu_biu_cd_valid;       
input   [4  :0]  lsu_biu_cr_resp;        
input            lsu_biu_cr_valid;       
input   [39 :0]  pad_biu_acaddr;         
input   [2  :0]  pad_biu_acprot;         
input   [3  :0]  pad_biu_acsnoop;        
input            pad_biu_acvalid;        
input            pad_biu_cdready;        
input            pad_biu_crready;        
output  [39 :0]  biu_lsu_ac_addr;        
output  [2  :0]  biu_lsu_ac_prot;        
output           biu_lsu_ac_req;         
output  [3  :0]  biu_lsu_ac_snoop;       
output           biu_lsu_cd_ready;       
output           biu_lsu_cr_ready;       
output           biu_pad_acready;        
output  [127:0]  biu_pad_cddata;         
output           biu_pad_cderr;          
output           biu_pad_cdlast;         
output           biu_pad_cdvalid;        
output  [4  :0]  biu_pad_crresp;         
output           biu_pad_crvalid;        
output           biu_xx_snoop_vld;       
output           snoop_ac_clk_en;        
output           snoop_cd_clk_en;        
output           snoop_cr_clk_en;        

// &Regs; @24
reg              core_snoop_vld;         
reg     [39 :0]  cur_acaddr_buf0_acaddr; 
reg     [2  :0]  cur_acaddr_buf0_acprot; 
reg     [3  :0]  cur_acaddr_buf0_acsnoop; 
reg              cur_acaddr_buf0_acvalid; 
reg     [39 :0]  cur_acaddr_buf1_acaddr; 
reg     [2  :0]  cur_acaddr_buf1_acprot; 
reg     [3  :0]  cur_acaddr_buf1_acsnoop; 
reg              cur_acaddr_buf1_acvalid; 
reg     [39 :0]  cur_acaddr_buf_acaddr;  
reg     [2  :0]  cur_acaddr_buf_acprot;  
reg     [3  :0]  cur_acaddr_buf_acsnoop; 
reg              cur_acaddr_buf_crt1_sel; 
reg              cur_acaddr_buf_pop1_sel; 
reg     [127:0]  cur_cddata_buf0_cddata; 
reg              cur_cddata_buf0_cdlast; 
reg              cur_cddata_buf0_cdvalid; 
reg     [127:0]  cur_cddata_buf1_cddata; 
reg              cur_cddata_buf1_cdlast; 
reg              cur_cddata_buf1_cdvalid; 
reg     [127:0]  cur_cddata_buf_cddata;  
reg              cur_cddata_buf_cdlast;  
reg              cur_cddata_buf_crt1_sel; 
reg              cur_cddata_buf_pop1_sel; 
reg     [4  :0]  cur_craddr_buf0_crresp; 
reg              cur_craddr_buf0_crvalid; 
reg     [4  :0]  cur_craddr_buf1_crresp; 
reg              cur_craddr_buf1_crvalid; 
reg              cur_craddr_buf_crt1_sel; 
reg              cur_craddr_buf_pop1_sel; 

// &Wires; @25
wire             accpuclk;               
wire    [39 :0]  biu_lsu_ac_addr;        
wire    [2  :0]  biu_lsu_ac_prot;        
wire             biu_lsu_ac_req;         
wire    [3  :0]  biu_lsu_ac_snoop;       
wire             biu_lsu_cd_ready;       
wire             biu_lsu_cr_ready;       
wire             biu_pad_acready;        
wire    [127:0]  biu_pad_cddata;         
wire             biu_pad_cderr;          
wire             biu_pad_cdlast;         
wire             biu_pad_cdvalid;        
wire    [4  :0]  biu_pad_crresp;         
wire             biu_pad_crvalid;        
wire             biu_xx_snoop_vld;       
wire             cdcpuclk;               
wire             cdready;                
wire             core_ac_empty;          
wire             cpurst_b;               
wire             crcpuclk;               
wire             crready;                
wire             cur_acaddr_buf_acvalid; 
wire             cur_acaddr_buf_ready;   
wire             cur_cddata_buf_cdvalid; 
wire             cur_cddata_buf_ready;   
wire    [4  :0]  cur_craddr_buf_crresp;  
wire             cur_craddr_buf_crvalid; 
wire             cur_craddr_buf_ready;   
wire             forever_coreclk;        
wire             lsu_biu_ac_empty;       
wire             lsu_biu_ac_ready;       
wire    [127:0]  lsu_biu_cd_data;        
wire             lsu_biu_cd_last;        
wire             lsu_biu_cd_valid;       
wire    [4  :0]  lsu_biu_cr_resp;        
wire             lsu_biu_cr_valid;       
wire    [39 :0]  pad_biu_acaddr;         
wire    [2  :0]  pad_biu_acprot;         
wire    [3  :0]  pad_biu_acsnoop;        
wire             pad_biu_acvalid;        
wire             pad_biu_cdready;        
wire             pad_biu_crready;        
wire             snoop_ac_clk_en;        
wire             snoop_cd_clk_en;        
wire             snoop_cr_clk_en;        
wire             snoop_req_create_en;    


//**********************************************************
//           snoop channel(AC/CR/CD)
// transmit req from CIU to LSU
// transmit data/resp from LSU to CIU
//**********************************************************

//**********************************************************
//           snoop addr channel(AC)
// tranmit req from CIU to LSU
//**********************************************************
//handshake
assign snoop_req_create_en  =  cur_acaddr_buf_ready
                            && pad_biu_acvalid;

assign cur_acaddr_buf_ready =  !cur_acaddr_buf0_acvalid
                               || !cur_acaddr_buf1_acvalid;

assign biu_pad_acready      =  cur_acaddr_buf_ready;
//**********************************************************
//           snoop addr channel                        
//cur_acaddr_buf:
//| cur_acaddr_buf_acvalid | cur_acaddr_buf_acaddr |
//|            ..._acsnoop |            ..._acprot |
//**********************************************************
always @(posedge accpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_acaddr_buf_crt1_sel <= 1'b0;
  else if(snoop_req_create_en)
    cur_acaddr_buf_crt1_sel <= !cur_acaddr_buf_crt1_sel;
  else
    cur_acaddr_buf_crt1_sel <= cur_acaddr_buf_crt1_sel;
end

always @(posedge accpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_acaddr_buf_pop1_sel <= 1'b0;
  else if(cur_acaddr_buf_acvalid && lsu_biu_ac_ready)
    cur_acaddr_buf_pop1_sel <= !cur_acaddr_buf_pop1_sel;
  else
    cur_acaddr_buf_pop1_sel <= cur_acaddr_buf_pop1_sel;
end

always @(posedge accpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_acaddr_buf0_acvalid <= 1'b0;
  else if(snoop_req_create_en && !cur_acaddr_buf_crt1_sel)
    cur_acaddr_buf0_acvalid <= 1'b1;
  else if(lsu_biu_ac_ready && !cur_acaddr_buf_pop1_sel && cur_acaddr_buf0_acvalid)
    cur_acaddr_buf0_acvalid <= 1'b0;
  else
    cur_acaddr_buf0_acvalid <= cur_acaddr_buf0_acvalid;
end

always @(posedge accpuclk)
begin
  if(snoop_req_create_en && !cur_acaddr_buf_crt1_sel)
  begin
    cur_acaddr_buf0_acaddr[`PA_WIDTH-1:0] <= pad_biu_acaddr[`PA_WIDTH-1:0];
    cur_acaddr_buf0_acsnoop[3:0] <= pad_biu_acsnoop[3:0];
    cur_acaddr_buf0_acprot[2:0]  <= pad_biu_acprot[2:0];
  end
  else
  begin
    cur_acaddr_buf0_acaddr[`PA_WIDTH-1:0] <= cur_acaddr_buf0_acaddr[`PA_WIDTH-1:0]; 
    cur_acaddr_buf0_acsnoop[3:0] <= cur_acaddr_buf0_acsnoop[3:0];
    cur_acaddr_buf0_acprot[2:0]  <= cur_acaddr_buf0_acprot[2:0];
  end
end

always @(posedge accpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_acaddr_buf1_acvalid <= 1'b0;
  else if(snoop_req_create_en && cur_acaddr_buf_crt1_sel)
    cur_acaddr_buf1_acvalid <= 1'b1;
  else if(lsu_biu_ac_ready && cur_acaddr_buf_pop1_sel && cur_acaddr_buf1_acvalid)
    cur_acaddr_buf1_acvalid <= 1'b0;
  else
    cur_acaddr_buf1_acvalid <= cur_acaddr_buf1_acvalid;
end

always @(posedge accpuclk)
begin
  if(snoop_req_create_en && cur_acaddr_buf_crt1_sel)
  begin
    cur_acaddr_buf1_acaddr[`PA_WIDTH-1:0] <= pad_biu_acaddr[`PA_WIDTH-1:0];
    cur_acaddr_buf1_acsnoop[3:0] <= pad_biu_acsnoop[3:0];
    cur_acaddr_buf1_acprot[2:0]  <= pad_biu_acprot[2:0];
  end
  else
  begin
    cur_acaddr_buf1_acaddr[`PA_WIDTH-1:0] <= cur_acaddr_buf1_acaddr[`PA_WIDTH-1:0]; 
    cur_acaddr_buf1_acsnoop[3:0] <= cur_acaddr_buf1_acsnoop[3:0];
    cur_acaddr_buf1_acprot[2:0]  <= cur_acaddr_buf1_acprot[2:0];
  end
end

assign cur_acaddr_buf_acvalid = cur_acaddr_buf0_acvalid || cur_acaddr_buf1_acvalid;

// &CombBeg; @129
always @( cur_acaddr_buf0_acprot[2:0]
       or cur_acaddr_buf1_acsnoop[3:0]
       or cur_acaddr_buf1_acaddr[39:0]
       or cur_acaddr_buf0_acaddr[39:0]
       or cur_acaddr_buf1_acprot[2:0]
       or cur_acaddr_buf_pop1_sel
       or cur_acaddr_buf0_acsnoop[3:0])
begin
  if(cur_acaddr_buf_pop1_sel)
  begin
  cur_acaddr_buf_acaddr[`PA_WIDTH-1:0] = cur_acaddr_buf1_acaddr[`PA_WIDTH-1:0]; 
  cur_acaddr_buf_acsnoop[3:0]          = cur_acaddr_buf1_acsnoop[3:0];
  cur_acaddr_buf_acprot[2:0]           = cur_acaddr_buf1_acprot[2:0];
  end
  else
  begin
  cur_acaddr_buf_acaddr[`PA_WIDTH-1:0] = cur_acaddr_buf0_acaddr[`PA_WIDTH-1:0]; 
  cur_acaddr_buf_acsnoop[3:0]          = cur_acaddr_buf0_acsnoop[3:0];
  cur_acaddr_buf_acprot[2:0]           = cur_acaddr_buf0_acprot[2:0];
  end
// &CombEnd; @142
end

assign biu_lsu_ac_req        = cur_acaddr_buf_acvalid;
assign biu_lsu_ac_addr[`PA_WIDTH-1:0] = cur_acaddr_buf_acaddr[`PA_WIDTH-1:0];
assign biu_lsu_ac_snoop[3:0] = cur_acaddr_buf_acsnoop[3:0];
assign biu_lsu_ac_prot[2:0]  = cur_acaddr_buf_acprot[2:0];

//**********************************************************
//           snoop resp channel(CR)
// tranmit resp from LSU to CIU
//**********************************************************
assign biu_lsu_cr_ready    = crready;

assign crready = cur_craddr_buf_ready;

assign cur_craddr_buf_ready = !cur_craddr_buf0_crvalid
                              || !cur_craddr_buf1_crvalid;
//**********************************************************
//           snoop resp channel                        
//cur_crresp_buf:
//| cur_crresp_buf_crvalid | cur_crresp_buf_crresp |
//**********************************************************
assign biu_pad_crvalid     = cur_craddr_buf_crvalid;
assign biu_pad_crresp[4:0] = cur_craddr_buf_crresp[4:0];

assign cur_craddr_buf_crvalid = cur_craddr_buf0_crvalid || cur_craddr_buf1_crvalid;

assign cur_craddr_buf_crresp[4:0] = cur_craddr_buf_pop1_sel
                                    ? cur_craddr_buf1_crresp[4:0]
                                    : cur_craddr_buf0_crresp[4:0];

always @(posedge crcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_craddr_buf_crt1_sel <= 1'b0;
  else if(lsu_biu_cr_valid && cur_craddr_buf_ready)
    cur_craddr_buf_crt1_sel <= !cur_craddr_buf_crt1_sel;
  else
    cur_craddr_buf_crt1_sel <= cur_craddr_buf_crt1_sel;
end

always @(posedge crcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_craddr_buf_pop1_sel <= 1'b0;
  else if(cur_craddr_buf_crvalid && pad_biu_crready)
    cur_craddr_buf_pop1_sel <= !cur_craddr_buf_pop1_sel;
  else
    cur_craddr_buf_pop1_sel <= cur_craddr_buf_pop1_sel;
end

always @(posedge crcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_craddr_buf0_crvalid <= 1'b0;
  else if(lsu_biu_cr_valid && !cur_craddr_buf_crt1_sel && !cur_craddr_buf0_crvalid)
    cur_craddr_buf0_crvalid <= 1'b1;
  else if(pad_biu_crready && !cur_craddr_buf_pop1_sel && cur_craddr_buf0_crvalid)
    cur_craddr_buf0_crvalid <= 1'b0;
  else
    cur_craddr_buf0_crvalid <= cur_craddr_buf0_crvalid;
end

always @(posedge crcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_craddr_buf0_crresp[4:0] <= 5'b0;
  else if(lsu_biu_cr_valid && !cur_craddr_buf_crt1_sel && !cur_craddr_buf0_crvalid)
    cur_craddr_buf0_crresp[4:0] <= lsu_biu_cr_resp[4:0];
  else
    cur_craddr_buf0_crresp[4:0] <= cur_craddr_buf0_crresp[4:0];
end

always @(posedge crcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_craddr_buf1_crvalid <= 1'b0;
  else if(lsu_biu_cr_valid && cur_craddr_buf_crt1_sel && !cur_craddr_buf1_crvalid)
    cur_craddr_buf1_crvalid <= 1'b1;
  else if(pad_biu_crready && cur_craddr_buf_pop1_sel && cur_craddr_buf1_crvalid)
    cur_craddr_buf1_crvalid <= 1'b0;
  else
    cur_craddr_buf1_crvalid <= cur_craddr_buf1_crvalid;
end

always @(posedge crcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_craddr_buf1_crresp[4:0] <= 5'b0;
  else if(lsu_biu_cr_valid && cur_craddr_buf_crt1_sel && !cur_craddr_buf1_crvalid)
    cur_craddr_buf1_crresp[4:0] <= lsu_biu_cr_resp[4:0];
  else
    cur_craddr_buf1_crresp[4:0] <= cur_craddr_buf1_crresp[4:0];
end
//**********************************************************
//           snoop data channel(CD)
// tranmit data from LSU to CIU(if need)
// not  every snoop req has data
//**********************************************************
assign biu_lsu_cd_ready    = cdready;

assign cdready = cur_cddata_buf_ready;

assign cur_cddata_buf_ready = !cur_cddata_buf0_cdvalid
                              || !cur_cddata_buf1_cdvalid;
//**********************************************************
//           snoop data channel                        
//cur_crresp_buf:
//| cur_cddata_buf_cdvalid | cur_cddata_buf_cddata |
//| cur_cddata_buf_cdlast  |
//**********************************************************
assign biu_pad_cdvalid       = cur_cddata_buf_cdvalid;
assign biu_pad_cddata[127:0] = cur_cddata_buf_cddata[127:0];
assign biu_pad_cdlast        = cur_cddata_buf_cdlast;
assign biu_pad_cderr         = 1'b0;

assign cur_cddata_buf_cdvalid = cur_cddata_buf0_cdvalid || cur_cddata_buf1_cdvalid;

// &CombBeg; @288
always @( cur_cddata_buf0_cddata[127:0]
       or cur_cddata_buf1_cdlast
       or cur_cddata_buf1_cddata[127:0]
       or cur_cddata_buf0_cdlast
       or cur_cddata_buf_pop1_sel)
begin
  if(cur_cddata_buf_pop1_sel)
  begin
  cur_cddata_buf_cddata[127:0] = cur_cddata_buf1_cddata[127:0];
  cur_cddata_buf_cdlast        = cur_cddata_buf1_cdlast;
  end
  else
  begin
  cur_cddata_buf_cddata[127:0] = cur_cddata_buf0_cddata[127:0];
  cur_cddata_buf_cdlast        = cur_cddata_buf0_cdlast;
  end
// &CombEnd; @299
end

always @(posedge cdcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_cddata_buf_crt1_sel <= 1'b0;
  else if(lsu_biu_cd_valid && cur_cddata_buf_ready)
    cur_cddata_buf_crt1_sel <= !cur_cddata_buf_crt1_sel;
  else
    cur_cddata_buf_crt1_sel <= cur_cddata_buf_crt1_sel;
end

always @(posedge cdcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_cddata_buf_pop1_sel <= 1'b0;
  else if(cur_cddata_buf_cdvalid && pad_biu_cdready)
    cur_cddata_buf_pop1_sel <= !cur_cddata_buf_pop1_sel;
  else
    cur_cddata_buf_pop1_sel <= cur_cddata_buf_pop1_sel;
end

always @(posedge cdcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_cddata_buf0_cdvalid <= 1'b0;
  else if(lsu_biu_cd_valid && !cur_cddata_buf_crt1_sel && !cur_cddata_buf0_cdvalid)
    cur_cddata_buf0_cdvalid <= 1'b1;
  else if(pad_biu_cdready && !cur_cddata_buf_pop1_sel && cur_cddata_buf0_cdvalid)
    cur_cddata_buf0_cdvalid <= 1'b0;
  else
    cur_cddata_buf0_cdvalid <= cur_cddata_buf0_cdvalid;
end

always @(posedge cdcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_cddata_buf0_cddata[127:0] <= 128'b0;
    cur_cddata_buf0_cdlast        <= 1'b0;
  end
  else if(lsu_biu_cd_valid && !cur_cddata_buf_crt1_sel && !cur_cddata_buf0_cdvalid)
  begin
    cur_cddata_buf0_cddata[127:0] <= lsu_biu_cd_data[127:0];
    cur_cddata_buf0_cdlast        <= lsu_biu_cd_last;
  end
  else
  begin
    cur_cddata_buf0_cddata[127:0] <= cur_cddata_buf0_cddata[127:0];
    cur_cddata_buf0_cdlast        <= cur_cddata_buf0_cdlast;
  end
end

always @(posedge cdcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    cur_cddata_buf1_cdvalid <= 1'b0;
  else if(lsu_biu_cd_valid && cur_cddata_buf_crt1_sel && !cur_cddata_buf1_cdvalid)
    cur_cddata_buf1_cdvalid <= 1'b1;
  else if(pad_biu_cdready && cur_cddata_buf_pop1_sel && cur_cddata_buf1_cdvalid)
    cur_cddata_buf1_cdvalid <= 1'b0;
  else
    cur_cddata_buf1_cdvalid <= cur_cddata_buf1_cdvalid;
end

always @(posedge cdcpuclk or negedge cpurst_b)
begin
  if(~cpurst_b)
  begin
    cur_cddata_buf1_cddata[127:0] <= 128'b0;
    cur_cddata_buf1_cdlast        <= 1'b0;
  end
  else if(lsu_biu_cd_valid && cur_cddata_buf_crt1_sel && !cur_cddata_buf1_cdvalid)
  begin
    cur_cddata_buf1_cddata[127:0] <= lsu_biu_cd_data[127:0];
    cur_cddata_buf1_cdlast        <= lsu_biu_cd_last;
  end
  else
  begin
    cur_cddata_buf1_cddata[127:0] <= cur_cddata_buf1_cddata[127:0];
    cur_cddata_buf1_cdlast        <= cur_cddata_buf1_cdlast;
  end
end
//**********************************************************
//                 Gated Clk EN
//**********************************************************
//assign snoop_clk_en =  snoop_req_create_en   //addr req
//                    || lsu_biu_ac_ready;     //addr acept

//for timing,neglect acvalid
assign snoop_ac_clk_en = cur_acaddr_buf_ready
                         || lsu_biu_ac_ready;

assign snoop_cr_clk_en = lsu_biu_cr_valid
                         || cur_craddr_buf_crvalid;

assign snoop_cd_clk_en = lsu_biu_cd_valid
                         || cur_cddata_buf_cdvalid;

//**********************************************************
//                 for core ICG en
//**********************************************************
assign core_ac_empty = lsu_biu_ac_empty
                       && !cur_craddr_buf_crvalid
                       && !cur_cddata_buf_cdvalid;

always @(posedge forever_coreclk or negedge cpurst_b)
begin
  if(~cpurst_b)
    core_snoop_vld <= 1'b0;
  else if(snoop_req_create_en)
    core_snoop_vld <= 1'b1;
  else if(core_ac_empty)
    core_snoop_vld <= 1'b0;
  else
    core_snoop_vld <= core_snoop_vld;
end

assign biu_xx_snoop_vld = core_snoop_vld; 

// &ModuleEnd; @419
endmodule











