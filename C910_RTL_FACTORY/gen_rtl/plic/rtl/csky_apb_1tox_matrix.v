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

module csky_apb_1tox_matrix(
  //input
  pclk,
  prst_b,
  slv_paddr,
  slv_psel,
  slv_pprot,
  slv_penable,
  slv_pwrite,
  slv_pwdata,
  slv_psec,
  mst_pready,
  mst_prdata,
  mst_pslverr,
  mst_base_addr,
  mst_base_addr_msk,
  ciu_plic_icg_en,
  pad_yy_icg_scan_en,
  //output
  mst_psel,
  mst_penable,
  mst_pprot,
  mst_paddr,
  mst_pwrite,
  mst_pwdata,
  mst_psec,
  slv_pready,
  slv_prdata,
  slv_pslverr
);
parameter ADDR   = 27;  // the address width
parameter SLAVE  = 4;   // the number of the slave
parameter FLOP   = 1;   // whether it will be floped out

localparam SLV_DIV_TMP = SLAVE/4;
localparam SLV_LEFT    = SLAVE - SLV_DIV_TMP*4;
localparam SLV_DIV     = SLV_LEFT>0 ? SLV_DIV_TMP+1 : SLV_DIV_TMP;
input                     pclk;
input                     prst_b;
input  [ADDR-1:0]         slv_paddr;
input                     slv_psel;
input  [1:0]              slv_pprot;
input                     slv_penable;
input                     slv_pwrite;
input  [31:0]             slv_pwdata;
input  [SLAVE-1:0]        mst_pready;
input  [32*SLAVE-1:0]     mst_prdata;
input  [SLAVE-1:0]        mst_pslverr;
input  [ADDR*SLAVE-1:0]   mst_base_addr;
input  [ADDR*SLAVE-1:0]   mst_base_addr_msk;
input                     ciu_plic_icg_en;
input                     pad_yy_icg_scan_en;
input                     slv_psec;

  //output
output [SLAVE-1:0]        mst_psel;
output [SLAVE*2-1:0]      mst_pprot;
output [SLAVE-1:0]        mst_penable;
output [ADDR*SLAVE-1:0]   mst_paddr;
output [SLAVE-1:0]        mst_pwrite;
output [32*SLAVE-1:0]     mst_pwdata;
output [SLAVE-1:0]        mst_psec;
output                    slv_pready;
output [31:0]             slv_prdata;
output                    slv_pslverr;

// wire definition
wire   [SLAVE-1:0]        slave_addr_sel;
wire                      apb_vlalid_select;
wire   [SLAVE-1:0]        apb_mst_psel_pre;
wire   [SLAVE-1:0]        apb_mst_penable_pre;
wire   [SLAVE:0]          slv_pready_vld;
wire                      slv_pready_pre;
wire   [32*(SLAVE+1)-1:0] slv_pready_data_pre;
wire   [31:0]             slv_prdata_pre;
wire   [SLAVE:0]          slv_pready_pslverr_pre;
wire                      slv_pslverr_pre;
wire   [SLAVE-1:0]        tmp_mst_sel_clk;
wire   [SLAVE-1:0]        mst_sel_clk;
wire   [SLAVE-1:0]          mst_sel_clk_en;
wire   [SLAVE-1:0]        ori_tmp_mst_sel_clk_en;
wire   [SLAVE-1:0]        conv_tmp_mst_sel_clk_en;
wire                      slv_ready_clk;
wire                      slv_ready_clk_en;
wire   [SLAVE:0]          mst_psel_exp;
wire                      flop_inout;
//reg definition
reg    [31:0]             slv_prdata_flop;
reg                       slv_pready_flop;
reg                       slv_pslverr_flop;
reg    [SLAVE-1:0]        mst_psel_flop;
reg    [SLAVE-1:0]        mst_psec_flop;
reg    [SLAVE*2-1:0]      mst_pprot_flop;
reg    [SLAVE-1:0]        mst_penable_flop;
reg    [SLAVE-1:0]        mst_pwrite_flop;
reg    [SLAVE*ADDR-1:0]   mst_paddr_flop;
reg    [SLAVE*32-1:0]     mst_pwdata_flop;
//**********************************************************************
// code start
//
//**********************************************************************
// the base address should not be overlaped, if does, both slave will be
// selected
genvar i;
generate
  for(i=0;i<SLAVE;i=i+1)
  begin:MASTER_ADDR_SEL
    assign slave_addr_sel[i] = ((slv_paddr[ADDR-1:0] & mst_base_addr_msk[i*ADDR+:ADDR])
                                == mst_base_addr[i*ADDR+:ADDR]);
  end
endgenerate
  
assign apb_vlalid_select                   = slv_psel && !slv_penable;
assign apb_mst_psel_pre[SLAVE-1:0]         = {SLAVE{apb_vlalid_select}} 
                                             & slave_addr_sel[SLAVE-1:0];
assign apb_mst_penable_pre[SLAVE-1:0]      = {SLAVE{slv_penable}};
assign slv_pready_vld[SLAVE:0]           =    ({1'b0,mst_psel[SLAVE-1:0]
                                                     & mst_penable[SLAVE-1:0]
                                                     & mst_pready[SLAVE-1:0]});
assign slv_pready_pre                      = |slv_pready_vld[SLAVE:0] ||
                                             (~|mst_psel_exp[SLAVE:0] && slv_psel && slv_penable);
assign mst_psel_exp[SLAVE:0]               = {1'b0,mst_psel[SLAVE-1:0]};
assign slv_pready_data_pre[31:0]           = 32'b0;
assign slv_pready_pslverr_pre[0]           = 1'b0;
genvar k;
generate
for(k=0;k<SLAVE;k=k+1)
begin:MASTER_PENABLE_REG
  assign slv_pready_data_pre[(k+2)*32-1:(k+1)*32]  = ({32{slv_pready_vld[k]}} 
                                                  & mst_prdata[(k+1)*32-1:k*32])
                                                | slv_pready_data_pre[(k+1)*32-1:k*32];
  assign slv_pready_pslverr_pre[k+1]     =  slv_pready_vld[k] & mst_pslverr[k] 
                                            | slv_pready_pslverr_pre[k];                                            
end
endgenerate
assign slv_prdata_pre[31:0]            = slv_pready_data_pre[(SLAVE+1)*32-1:SLAVE*32];
assign slv_pslverr_pre                 = slv_pready_pslverr_pre[SLAVE] ||
                                         (~|mst_psel_exp[SLAVE:0] && slv_psel && slv_penable);
gated_clk_cell  x_slv_ready_gateclk (
  .clk_in               (pclk            ),
  .clk_out              (slv_ready_clk       ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (slv_ready_clk_en    ),
  .module_en            (ciu_plic_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign   slv_ready_clk_en = slv_psel;

always @ (posedge slv_ready_clk or negedge prst_b)
begin
  if(!prst_b)
    slv_prdata_flop[31:0] <= 32'b0;
  else if(slv_pready_pre && !slv_pwrite)
    slv_prdata_flop[31:0] <= slv_prdata_pre[31:0];
end

always @ (posedge slv_ready_clk or negedge prst_b)
begin
  if(!prst_b)
    slv_pslverr_flop <= 1'b0;
  else if(slv_pready_pre )
    slv_pslverr_flop  <= slv_pslverr_pre;
end


always @ (posedge slv_ready_clk or negedge prst_b)
begin
  if(!prst_b)
    slv_pready_flop <= 1'b0;
  else if(apb_vlalid_select)
    slv_pready_flop <= 1'b0;
  else if(slv_pready_pre)
    slv_pready_flop <= 1'b1;
end


generate 
genvar idx;
for(idx=0;idx<SLAVE;idx=idx+1)
begin:GATE_CLK
  gated_clk_cell  x_mst_sel_gateclk (
    .clk_in               (pclk                ),
    .clk_out              (tmp_mst_sel_clk[idx]     ),
    .external_en          (1'b0                ),
    .global_en            (1'b1                ),
    .local_en             (mst_sel_clk_en[idx]   ),
    .module_en            (ciu_plic_icg_en       ),
    .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
  );
  assign  mst_sel_clk_en[idx]   = conv_tmp_mst_sel_clk_en[idx];
  assign  mst_sel_clk[idx]      = tmp_mst_sel_clk[idx];
end
endgenerate
assign ori_tmp_mst_sel_clk_en[SLAVE-1:0]      = apb_mst_psel_pre[SLAVE-1:0] |
                                                mst_psel_flop[SLAVE-1:0];
assign conv_tmp_mst_sel_clk_en[SLAVE-1:0]     = ori_tmp_mst_sel_clk_en[SLAVE-1:0];
generate
genvar j;
for(j=0;j<SLAVE;j=j+1)
begin: MST_FLOP
  always @(posedge mst_sel_clk[j] or negedge prst_b)
  begin
    if(!prst_b)
      mst_psel_flop[j] <= 1'b0;
    else if(apb_mst_psel_pre[j])
      mst_psel_flop[j] <= 1'b1;
    else if(mst_penable_flop[j] && mst_pready[j])
      mst_psel_flop[j] <= 1'b0;
  end
  always @(posedge mst_sel_clk[j] or negedge prst_b)
  begin
    if(!prst_b)
      mst_penable_flop[j]          <= {1'b0};
    else if(apb_mst_psel_pre[j])
      mst_penable_flop[j]          <= 1'b0;
    else if(mst_psel[j])
      mst_penable_flop[j]          <= !(mst_penable[j] && mst_pready[j]);
  end
  always @(posedge mst_sel_clk[j] or negedge prst_b)
  begin
    if(!prst_b)
    begin
      mst_pprot_flop[j*2+:2]        <= {2{1'b0}};
      mst_pwrite_flop[j]            <= {1'b0};
      mst_paddr_flop[j*ADDR+:ADDR]  <= {ADDR{1'b0}};
      mst_pwdata_flop[j*32+:32]     <= {32{1'b0}};
    end
    else 
    begin
      mst_pprot_flop[j*2+:2]         <= {{slv_pprot[1:0]}};
      mst_pwrite_flop[j]             <= {{slv_pwrite}};
      mst_paddr_flop[j*ADDR+:ADDR]   <= {{slv_paddr[ADDR-1:0]}};
      mst_pwdata_flop[j*32+:32]      <= {{slv_pwdata[31:0]}};
    end
  end
  always @(posedge mst_sel_clk[j] or negedge prst_b)
  begin
    if(!prst_b)
      mst_psec_flop[j]          <= {1'b0};
    else 
      mst_psec_flop[j]          <= slv_psec;
  end
end
endgenerate
assign flop_inout                = FLOP == 1;
assign mst_psel[SLAVE-1:0]       = flop_inout ? mst_psel_flop[SLAVE-1:0] 
                                        : apb_mst_psel_pre[SLAVE-1:0];
assign mst_pprot[SLAVE*2-1:0]    = flop_inout ? mst_pprot_flop[SLAVE*2-1:0] 
                                        : {SLAVE{slv_pprot[1:0]}};
assign mst_paddr[SLAVE*ADDR-1:0] = flop_inout ? mst_paddr_flop[SLAVE*ADDR-1:0] 
                                        : {SLAVE{slv_paddr[ADDR-1:0]}};
assign mst_penable[SLAVE-1:0]    = flop_inout ? mst_penable_flop[SLAVE-1:0]
                                        : {SLAVE{slv_penable}};
assign mst_pwrite[SLAVE-1:0]     = flop_inout ? mst_pwrite_flop[SLAVE-1:0]
                                        : {SLAVE{slv_pwrite}};
assign mst_pwdata[SLAVE*32-1:0]  = flop_inout ? mst_pwdata_flop[SLAVE*32-1:0]
                                        : {SLAVE{slv_pwdata[31:0]}};
assign slv_pready                = flop_inout ? slv_pready_flop
                                        : slv_pready_pre;
assign slv_pslverr               = flop_inout ? slv_pslverr_flop
                                         : slv_pslverr_pre;                               
assign slv_prdata[31:0]          = flop_inout  ? slv_prdata_flop[31:0] 
                                        : slv_prdata_pre[31:0];         
assign mst_psec[SLAVE-1:0]        = mst_psec_flop[SLAVE-1:0];

endmodule                                        

  
  

