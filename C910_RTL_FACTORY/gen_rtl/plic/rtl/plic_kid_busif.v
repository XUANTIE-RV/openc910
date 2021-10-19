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
module plic_kid_busif(
  //input
  plic_clk,
  plicrst_b,
  bus_mtx_prio_psel,
  bus_mtx_prio_pprot,
  bus_mtx_prio_penable,
  bus_mtx_prio_paddr,
  bus_mtx_prio_pwrite,
  bus_mtx_prio_pwdata,
  bus_mtx_prio_psec,
  bus_mtx_ip_psel,
  bus_mtx_ip_pprot,
  bus_mtx_ip_penable,
  bus_mtx_ip_paddr,
  bus_mtx_ip_pwrite,
  bus_mtx_ip_pwdata,
  bus_mtx_ip_psec,
  pad_plic_int_vld,
  pad_plic_int_cfg,
  hreg_kid_claim_vld,
  //hreg_kid_claim_id,
  hreg_kid_cmplt_vld,
  ciu_plic_icg_en,
  pad_yy_icg_scan_en,
  ctrl_xx_amp_mode,
  int_sec_infor,


  //output
  ip_bus_mtx_pready,
  ip_bus_mtx_prdata,
  ip_bus_mtx_pslverr,
  prio_bus_mtx_pready,
  prio_bus_mtx_prdata,
  prio_bus_mtx_pslverr,
  kid_hreg_new_int_pulse,
  kid_hreg_ip_prio_reg_we,
  kid_yy_int_req,
  kid_yy_int_prio

);
parameter       INT_NUM     = 1024;
parameter       PRIO_BIT    = 5;
parameter       ID_NUM      = 10;
parameter       ADDR        = 12;

localparam      PRIO_SPLIT1  = INT_NUM/128;   // each 128 will have one slave port.
localparam      RE_INT_NUM   = PRIO_SPLIT1 * 128;
localparam      LEFT_INT     = INT_NUM - RE_INT_NUM;
localparam      PRIO_SLV_NUM = LEFT_INT > 0 ?  PRIO_SPLIT1 + 1 :  PRIO_SPLIT1;
localparam      PRIO_SPLIT1_FOR_CMP = (PRIO_SPLIT1 == 0) ? 1 : PRIO_SPLIT1;
localparam      FILL_LEFT_INT = ((128-LEFT_INT) & 7'h7f) + 7'h1;

input                       plic_clk;
input                       plicrst_b;
input                       bus_mtx_ip_psel;
input   [1:0]               bus_mtx_ip_pprot;
input                       bus_mtx_ip_penable;
input   [ADDR-1:0]          bus_mtx_ip_paddr;
input                       bus_mtx_ip_pwrite;
input   [31:0]              bus_mtx_ip_pwdata;
input                       bus_mtx_ip_psec;
input   [INT_NUM-1:0]       int_sec_infor;

input                       bus_mtx_prio_psel;
input   [1:0]               bus_mtx_prio_pprot;
input                       bus_mtx_prio_penable;
input   [ADDR-1:0]          bus_mtx_prio_paddr;
input                       bus_mtx_prio_pwrite;
input   [31:0]              bus_mtx_prio_pwdata;
input                       bus_mtx_prio_psec;
input   [INT_NUM-1:0]       pad_plic_int_vld;
input   [INT_NUM-1:0]       pad_plic_int_cfg;
input   [INT_NUM-1:0]       hreg_kid_claim_vld;
//input   [ID_NUM-1:0]        hreg_kid_claim_id;
input   [INT_NUM-1:0]       hreg_kid_cmplt_vld;
input                       ciu_plic_icg_en;
input                       pad_yy_icg_scan_en;
input                       ctrl_xx_amp_mode;

output                      ip_bus_mtx_pready;
output  [31:0]              ip_bus_mtx_prdata;
output                      ip_bus_mtx_pslverr;
output                      prio_bus_mtx_pready;
output  [31:0]              prio_bus_mtx_prdata;
output                      prio_bus_mtx_pslverr;
output                      kid_hreg_new_int_pulse;
output [INT_NUM-1:0]        kid_yy_int_req;
output [INT_NUM*PRIO_BIT-1:0]kid_yy_int_prio;
output                      kid_hreg_ip_prio_reg_we;

//wire definition
wire  [INT_NUM-1:0]         busif_clr_kid_ip;
wire  [INT_NUM-1:0]         busif_set_kid_ip;
wire  [INT_NUM-1:0]         hreg_int_claim_kid;
wire  [INT_NUM*PRIO_BIT-1:0]kid_arb_int_prio;
wire  [INT_NUM-1:0]         kid_arb_int_pulse; 
wire  [INT_NUM-1:0]         kid_arb_int_req;
wire  [INT_NUM-1:0]         kid_int_active;
wire  [PRIO_BIT-1:0]        kid_busif_int_prio[PRIO_SLV_NUM*128:0];
wire  [INT_NUM-1:0]         kid_busif_pending;
wire  [INT_NUM-1:0]         kid_hreg_int_pulse;
wire  [INT_NUM-1:0]         kid_sample_en;
wire  [PRIO_SLV_NUM-1:0]    prio_split_pslverr;
wire  [PRIO_SLV_NUM-1:0]    prio_split_pslverr_pre;
wire  [PRIO_SLV_NUM-1:0]    prio_split_psel;
wire  [PRIO_SLV_NUM-1:0]    prio_split_psec;
wire  [PRIO_SLV_NUM*2-1:0]  prio_split_pprot;
wire  [PRIO_SLV_NUM-1:0]    prio_split_penable;
wire  [PRIO_SLV_NUM-1:0]    prio_split_pwrite;
wire  [PRIO_SLV_NUM*12-1:0] prio_split_paddr;
wire  [PRIO_SLV_NUM*32-1:0] prio_split_pwdata;   
wire  [PRIO_SLV_NUM*32-1:0] prio_split_prdata;
wire  [PRIO_SLV_NUM-1:0]    prio_apb_write_en;
wire  [PRIO_SLV_NUM-1:0]    prio_apb_read_en;
wire  [PRIO_SLV_NUM*PRIO_BIT-1:0]prio_split_prdata_pre;
wire                        prio_lst_apb_acc_en;
wire                        prio_lst_apb_addr_non;
wire                        ip_apb_acc_en;
wire                        ip_apb_write_en;
wire                        ip_apb_read_en;
wire [INT_NUM+31:0]         ip_read_data_tmp;
wire [INT_NUM/32-1:0]       ip_wrd_write_en;
wire [INT_NUM/32-1:0]       ip_wrd_read_en;
wire [PRIO_SLV_NUM-1:0]     prio_ready_clk;
wire [PRIO_SLV_NUM-1:0]     prio_ready_clk_en;
wire                        ip_ready_clk;
wire                        ip_ready_clk_en;
wire [INT_NUM/32-1:0]       kids_regs_clk;
wire [INT_NUM/32-1:0]       kids_regs_clk_en;
wire [INT_NUM-1:0]          kid_clk;
wire [PRIO_SLV_NUM-1:0]     prio_apb_acc_en;
wire  [PRIO_SLV_NUM-1:0]     prio_split_pready;
wire  [PRIO_SLV_NUM*PRIO_BIT-1:0] prio_split_prdata_flop;
wire  [PRIO_SLV_NUM-1:0]    prio_split_prv_vio;
wire  [PRIO_SLV_NUM*12-1:0]  prio_split_base_addr;
wire  [PRIO_SLV_NUM*12-1:0]  prio_split_base_addr_msk;
wire [9:0]                   tmp_prio_split_pslverr_pre;
wire [9:0]                   tmp_prio_split_pslverr;
wire [INT_NUM-1:0]           ip_kid_sec_mask;
wire [PRIO_SLV_NUM*128:0]  int_sec_infor_pack;
//reg definition

//reg   [INT_NUM-1:0]         plic_int_flop;
wire   [INT_NUM-1:0]         plic_int_sync;
reg                         lst_apb_slverr;
reg  [31:0]                 ip_bus_mtx_prdata_flop;
reg                         ip_bus_mtx_pready_flop;
reg                         ip_bus_mtx_pslverr_flop;
wire                         ip_bus_mtx_pslverr_pre;
wire  [PRIO_BIT-1:0]         busif_we_kid_prio_data[PRIO_SLV_NUM*128-1:0];
wire  [PRIO_SLV_NUM*128-1:0] busif_we_kid_prio;
wire   [PRIO_SLV_NUM*128-1:0]busif_rd_kid_prio;
wire  [129*PRIO_BIT-1:0]     prio_lst_read_tmp[PRIO_SLV_NUM-1:0];
wire [128*PRIO_SLV_NUM-1:0]  prio_kid_sec_mask;

//**********************************************************************
//  using 2-stage flop to sync the input interrupt
//
//**********************************************************************
sync_level2level #(.SIGNAL_WIDTH(INT_NUM)) x_plic_int_sync (
  .clk      (plic_clk          ),
  .rst_b    (plicrst_b         ),
  .sync_in  (pad_plic_int_vld  ),
  .sync_out (plic_int_sync     )
);
//always @ (posedge plic_clk or negedge plicrst_b)
//begin
//  if(!plicrst_b)
//  begin
//    plic_int_flop[INT_NUM-1:0] <= {INT_NUM{1'b0}};
//    plic_int_sync[INT_NUM-1:0] <= {INT_NUM{1'b0}};
//  end
//  else
//  begin
//    plic_int_flop[INT_NUM-1:0] <= pad_plic_int_vld[INT_NUM-1:0];
//    plic_int_sync[INT_NUM-1:0] <= plic_int_flop[INT_NUM-1:0];
//  end
//end
//**********************************************************************
//   instance the int kid
//
//**********************************************************************
generate
genvar i;
for(i=1;i<INT_NUM;i=i+1)
begin:INT_KID
  plic_int_kid #(.PRIO_BIT(PRIO_BIT)) x_plic_int_kid(
    .busif_clr_kid_ip_x         (busif_clr_kid_ip[i]),
    .busif_set_kid_ip_x         (busif_set_kid_ip[i]),
    .busif_we_kid_prio_data     (busif_we_kid_prio_data[i]), 
    .busif_we_kid_prio_x        (busif_we_kid_prio[i]),
    .hreg_int_claim_kid_x       (hreg_int_claim_kid[i]),
    .hreg_int_complete_kid_x    (hreg_kid_cmplt_vld[i]),
    .int_vld_aft_sync_x         (plic_int_sync[i]),
    .pad_plic_int_cfg_x         (pad_plic_int_cfg[i]),
    .kid_arb_int_prio_x         (kid_arb_int_prio[PRIO_BIT*i+:PRIO_BIT]),
    .kid_arb_int_pulse_x        (kid_arb_int_pulse[i]),
    .kid_arb_int_req_x          (kid_arb_int_req[i]),
    .kid_busif_int_prio_x       (kid_busif_int_prio[i]),
    .kid_busif_pending_x        (kid_busif_pending[i]),
    .kid_clk                    (kid_clk[i]),
    .kid_hreg_int_pulse_x       (kid_hreg_int_pulse[i]),
    .kid_sample_en              (kid_sample_en[i]),
    .kid_int_active_x           (kid_int_active[i]),
    .plicrst_b                  (plicrst_b)
);
end
endgenerate
// gate clk instance
assign kid_arb_int_pulse[0]  		= 1'b0;
assign kid_arb_int_prio[0+:PRIO_BIT]  	= {PRIO_BIT{1'b0}};
assign kid_arb_int_req[0]  		= 1'b1;
assign kid_busif_int_prio[0]  = {PRIO_BIT{1'b0}};
assign kid_busif_pending[0]  		= 1'b0;
assign kid_sample_en[0]			= 1'b0;
assign kid_hreg_int_pulse[0]		= 1'b0;
assign kid_int_active[0]		= 1'b0;
generate
genvar gk;
for(gk=0;gk<INT_NUM/32;gk=gk+1)
begin:KID_GATE_CLK
  gated_clk_cell  x_kid_regs_gateclk (
    .clk_in               (plic_clk            ),
    .clk_out              (kids_regs_clk[gk]   ),
    .external_en          (1'b0                ),
    .global_en            (1'b1                ),
    .local_en             (kids_regs_clk_en[gk]),
    .module_en            (ciu_plic_icg_en     ),
    .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
  );
  assign kids_regs_clk_en[gk]  =    |kid_sample_en[gk*32+:32] 
                                 || |busif_we_kid_prio[gk*32+:32]
                                 || ip_wrd_write_en[gk]
                                 || |hreg_int_claim_kid[gk*32+:32]
                                 || |hreg_kid_cmplt_vld[gk*32+:32];
  assign kid_clk[gk*32+:32]    = {32{kids_regs_clk[gk]}};
end
endgenerate

generate
genvar add_idx;
for(add_idx=0;add_idx<FILL_LEFT_INT;add_idx=add_idx+1)
begin:LFT_PRIO
assign kid_busif_int_prio[INT_NUM + add_idx][PRIO_BIT-1:0]  = {PRIO_BIT{1'b0}}; 
assign int_sec_infor_pack[INT_NUM + add_idx]                = 1'b1;
end
endgenerate
assign int_sec_infor_pack[INT_NUM-1:0]  = int_sec_infor[INT_NUM-1:0];
//**********************************************************************
//   priority  write and read interface
//   
//**********************************************************************

//**********************************************************************
//   apb matrix for prio write
//   first, prepare the base address for every slave port
//**********************************************************************
generate
genvar j;
for(j=0;j<PRIO_SLV_NUM;j=j+1)
begin:SLV_BASE_ADDR
  assign prio_split_base_addr[j*12+:12] = (j<<<9) & {12{1'b1}};
  assign prio_split_base_addr_msk[j*12+:12] = {{3{1'b1}},{9{1'b0}}};
end
endgenerate
csky_apb_1tox_matrix #(.ADDR(12),
                       .SLAVE(PRIO_SLV_NUM)
                       )x_prio_1tox_matrix(
  //input
  .pclk         (plic_clk),
  .prst_b       (plicrst_b),
  .slv_paddr    (bus_mtx_prio_paddr),
  .slv_psel     (bus_mtx_prio_psel),
  .slv_pprot    (bus_mtx_prio_pprot),
  .slv_penable  (bus_mtx_prio_penable),
  .slv_pwrite   (bus_mtx_prio_pwrite),
  .slv_pwdata   (bus_mtx_prio_pwdata),
  .slv_psec     (bus_mtx_prio_psec ),
  .mst_pready   (prio_split_pready[PRIO_SLV_NUM-1:0]),
  .mst_prdata   (prio_split_prdata[PRIO_SLV_NUM*32-1:0]),
  .mst_pslverr  (prio_split_pslverr[PRIO_SLV_NUM-1:0]),
  .mst_base_addr(prio_split_base_addr[PRIO_SLV_NUM*12-1:0]),
  .mst_base_addr_msk(prio_split_base_addr_msk[PRIO_SLV_NUM*12-1:0]),
  .ciu_plic_icg_en(ciu_plic_icg_en),
  .pad_yy_icg_scan_en(pad_yy_icg_scan_en),
  //.output(output)
  .mst_psel     (prio_split_psel[PRIO_SLV_NUM-1:0]),
  .mst_pprot    (prio_split_pprot[PRIO_SLV_NUM*2-1:0]),
  .mst_penable  (prio_split_penable[PRIO_SLV_NUM-1:0]),
  .mst_paddr    (prio_split_paddr[PRIO_SLV_NUM*12-1:0]),
  .mst_pwrite   (prio_split_pwrite[PRIO_SLV_NUM-1:0]),
  .mst_pwdata   (prio_split_pwdata[PRIO_SLV_NUM*32-1:0]),
  .mst_psec     (prio_split_psec[PRIO_SLV_NUM-1:0]),
  .slv_pready   (prio_bus_mtx_pready),
  .slv_prdata   (prio_bus_mtx_prdata),
  .slv_pslverr  (prio_bus_mtx_pslverr)
);
//****************************************************
//   generate the write/read signal
//   for each prio
//****************************************************
//*************************************
//  the int prio write en
//  the int prio write data
//  the read data collecting
//*************************************
genvar k;
genvar m;
generate
for(k=0;k<PRIO_SLV_NUM;k=k+1)
begin:WR_DATA
assign prio_lst_read_tmp[k][PRIO_BIT-1:0] = {PRIO_BIT{1'b0}};
  for(m=0;m<128;m=m+1)
    begin:WR_IN_DATA
assign      prio_kid_sec_mask[k*128+m]  = prio_split_psec[k] | ~int_sec_infor_pack[k*128+m] | ~ctrl_xx_amp_mode ;
assign      busif_we_kid_prio[k*128+m] = prio_apb_write_en[k] && (prio_split_paddr[(2+12*k)+:7] == m) 
                                        && prio_kid_sec_mask[k*128+m];
assign      busif_rd_kid_prio[k*128+m] = prio_apb_read_en[k] && (prio_split_paddr[(2+12*k)+:7] == m)
                                        && prio_kid_sec_mask[k*128+m];
assign      busif_we_kid_prio_data[k*128+m][PRIO_BIT-1:0] 
                                       = prio_split_pwdata[32*k+:PRIO_BIT];
assign      prio_lst_read_tmp[k][PRIO_BIT*(m+1)+:PRIO_BIT]
                                        = prio_lst_read_tmp[k][PRIO_BIT*m+:PRIO_BIT]
                                          |({PRIO_BIT{busif_rd_kid_prio[k*128+m]}} 
                                            & kid_busif_int_prio[k*128+m]);
   end 
end
endgenerate

generate
genvar slv_idx;
for(slv_idx=0;slv_idx<PRIO_SLV_NUM;slv_idx=slv_idx+1)
begin:APB_SEL_EN
  assign prio_apb_write_en[slv_idx]   =  prio_apb_acc_en[slv_idx] 
                                         && prio_split_pwrite[slv_idx]
                                         && !prio_split_pslverr_pre[slv_idx];
  assign prio_apb_read_en[slv_idx]    =  prio_apb_acc_en[slv_idx] 
                                         && !prio_split_pwrite[slv_idx];
  assign prio_split_prdata_pre[slv_idx*PRIO_BIT+:PRIO_BIT] 
                                      = prio_split_pslverr_pre[slv_idx] ? {PRIO_BIT{1'b0}} : prio_lst_read_tmp[slv_idx][PRIO_BIT*128+:PRIO_BIT];
//*************************************
//  the prio split ready signal
//*************************************
  assign prio_apb_acc_en[slv_idx]   = prio_split_psel[slv_idx] && !prio_split_penable[slv_idx];
  instance_reg_flog #(.DATA(1)) x_prio_split_ready_ff(
    .clk      (prio_ready_clk[slv_idx]),
    .en       (prio_split_psel[slv_idx]),
    .rst_b    (plicrst_b),
    .data_in  (prio_apb_acc_en[slv_idx]),
    .data_out (prio_split_pready[slv_idx])
  );
//*************************************
//  the prio split rdata signal
//*************************************
  instance_reg_flog #(.DATA(PRIO_BIT)) x_prio_split_rdata_ff(
    .clk      (prio_ready_clk[slv_idx]),
    .en       (prio_apb_read_en[slv_idx]),
    .rst_b    (plicrst_b),
    .data_in  (prio_split_prdata_pre[slv_idx*PRIO_BIT+:PRIO_BIT]),
    .data_out (prio_split_prdata_flop[slv_idx*PRIO_BIT+:PRIO_BIT])
  ); 
  gated_clk_cell  x_prio_split_ready_gateclk (
    .clk_in               (plic_clk            ),
    .clk_out              (prio_ready_clk[slv_idx]),
    .external_en          (1'b0                ),
    .global_en            (1'b1                ),
    .local_en             (prio_ready_clk_en[slv_idx]),
    .module_en            (ciu_plic_icg_en     ),
    .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
  );
  assign prio_ready_clk_en[slv_idx]           = prio_apb_acc_en[slv_idx];
  assign prio_split_prdata[slv_idx*32+:32]    = {{(32-PRIO_BIT){1'b0}},
                                           prio_split_prdata_flop[slv_idx*PRIO_BIT+:PRIO_BIT]};
  assign prio_split_prv_vio[slv_idx]    = (prio_split_pprot[slv_idx*2+1] == 1'b0);
end
endgenerate
//****************************************************
//   generate the slverr signal
//   for each split apb bus
//****************************************************
//*************************************
//  for the 0-PRIO_SPLIT1, the access
//  response is OK,
//  for the PRIO_SPLIT1 < PRIO_SLV_NUM
//  the access in non-exist int will 
//  response with err
//*************************************
assign prio_lst_apb_acc_en = prio_split_psel[PRIO_SLV_NUM-1] 
                              && !prio_split_penable[PRIO_SLV_NUM-1];
assign prio_lst_apb_addr_non = (prio_split_paddr[12*(PRIO_SLV_NUM-1)+:9] >=
                               $unsigned(LEFT_INT*4)) && (LEFT_INT>0);
always @(posedge prio_ready_clk[PRIO_SLV_NUM-1] or negedge plicrst_b)
begin
  if(!plicrst_b)
    lst_apb_slverr <= 1'b0;
  else if(prio_lst_apb_acc_en)
    lst_apb_slverr <= prio_lst_apb_addr_non;
end

assign tmp_prio_split_pslverr_pre[9:0]           = {{9-PRIO_SLV_NUM{1'b0}},prio_split_prv_vio[PRIO_SLV_NUM-1:0],1'b0} |
                                                   {{9-PRIO_SLV_NUM{1'b0}},prio_lst_apb_addr_non,{PRIO_SLV_NUM{1'b0}}};
assign tmp_prio_split_pslverr[9:0]               = {{9-PRIO_SLV_NUM{1'b0}},prio_split_prv_vio[PRIO_SLV_NUM-1:0],1'b0} |
                                                   {{9-PRIO_SLV_NUM{1'b0}},lst_apb_slverr,{PRIO_SLV_NUM{1'b0}}};
assign prio_split_pslverr_pre[PRIO_SLV_NUM-1:0]  = tmp_prio_split_pslverr_pre[PRIO_SLV_NUM:1];
assign prio_split_pslverr[PRIO_SLV_NUM-1:0]      = tmp_prio_split_pslverr[PRIO_SLV_NUM:1];

//**********************************************************************
//   priority  write and read interface
//   
//**********************************************************************
assign ip_apb_acc_en   = bus_mtx_ip_psel && !bus_mtx_ip_penable;
assign ip_apb_write_en = ip_apb_acc_en && bus_mtx_ip_pwrite && !ip_bus_mtx_pslverr_pre;
assign ip_apb_read_en  = ip_apb_acc_en && !bus_mtx_ip_pwrite;
assign ip_read_data_tmp[31:0] = 32'b0;
generate 
genvar n;
for(n=0;n<INT_NUM/32;n=n+1)
begin:IP_WR
  assign ip_kid_sec_mask[n*32+:32]  = {32{bus_mtx_ip_psec}} | ~int_sec_infor[n*32+:32] | {32{~ctrl_xx_amp_mode}} ;
  assign ip_wrd_write_en[n]         = ip_apb_write_en && (bus_mtx_ip_paddr[11:2] == n);
  assign ip_wrd_read_en[n]          = ip_apb_read_en && (bus_mtx_ip_paddr[11:2] == n);
  assign busif_set_kid_ip[n*32+:32] = {32{ip_wrd_write_en[n]}} & ((bus_mtx_ip_pwdata[31:0]     & ip_kid_sec_mask[n*32+:32]) |
                                                                  (kid_busif_pending[n*32+:32] & ~ip_kid_sec_mask[n*32+:32]));
  assign busif_clr_kid_ip[n*32+:32] = {32{ip_wrd_write_en[n]}} & ((~bus_mtx_ip_pwdata[31:0]     & ip_kid_sec_mask[n*32+:32]));
  assign ip_read_data_tmp[(n+1)*32+:32] = ip_read_data_tmp[n*32+:32] |
                                          ({32{ip_wrd_read_en[n]}}  
                                           & kid_busif_pending[n*32+:32]
                                           & ip_kid_sec_mask[n*32+:32]);
end
endgenerate
always @(posedge ip_ready_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    ip_bus_mtx_prdata_flop[31:0] <= 32'b0;
  else if(ip_apb_read_en)
    ip_bus_mtx_prdata_flop[31:0] <= ip_bus_mtx_pslverr_pre ? 32'b0 :ip_read_data_tmp[INT_NUM+:32];
end
always @(posedge ip_ready_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
  begin
    ip_bus_mtx_pready_flop <= 1'b0;
    ip_bus_mtx_pslverr_flop<= 1'b0;
  end
  else 
  begin
    ip_bus_mtx_pready_flop <= ip_apb_acc_en;
    ip_bus_mtx_pslverr_flop<= ip_bus_mtx_pslverr_pre;
  end
end
assign ip_bus_mtx_pslverr_pre = (bus_mtx_ip_paddr[11:2] >= $unsigned(INT_NUM/32)) 
                              || (bus_mtx_ip_pprot[1]== 1'b0);

gated_clk_cell  x_ip_ready_gateclk (
  .clk_in               (plic_clk            ),
  .clk_out              (ip_ready_clk        ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (ip_ready_clk_en     ),
  .module_en            (ciu_plic_icg_en     ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign ip_ready_clk_en          = ip_apb_acc_en;
assign ip_bus_mtx_pready        = ip_bus_mtx_pready_flop;
assign ip_bus_mtx_pslverr       = ip_bus_mtx_pslverr_flop;
assign ip_bus_mtx_prdata[31:0]  = ip_bus_mtx_prdata_flop[31:0];
//**********************************************************************
//   interface to Hreg
//   
//**********************************************************************
assign kid_hreg_new_int_pulse =  |kid_hreg_int_pulse[INT_NUM-1:0];
assign kid_hreg_ip_prio_reg_we = |prio_apb_write_en[PRIO_SLV_NUM-1:0] || ip_apb_write_en;
                                  
//**********************************************************************
//   claim and complete from hreg
//   
//**********************************************************************
//generate
//genvar claim_idx;
//  for(claim_idx=0;claim_idx<INT_NUM;claim_idx=claim_idx+1)
//  begin:CLAIM_CMPLT
//    assign hreg_int_claim_kid[claim_idx] = hreg_kid_claim_vld 
//                                           && (hreg_kid_claim_id[ID_NUM-1:0] == claim_idx);
////    assign hreg_int_complete_kid[claim_idx] = hreg_kid_cmplt_vld 
////                                           && (hreg_kid_cmplt_id[ID_NUM-1:0] == claim_idx);
//  end
//endgenerate
assign hreg_int_claim_kid[INT_NUM-1:0]  = hreg_kid_claim_vld[INT_NUM-1:0];
//**********************************************************************
//   interface to arbitor
//   
//**********************************************************************
assign kid_yy_int_req[INT_NUM-1:0]           = kid_arb_int_req[INT_NUM-1:0];
assign kid_yy_int_prio[INT_NUM*PRIO_BIT-1:0] = {kid_arb_int_prio[INT_NUM*PRIO_BIT-1:PRIO_BIT],
                                                {PRIO_BIT{1'b0}}};

endmodule

module instance_reg_flog(
  //input
  clk,
  rst_b,
  en,
  data_in,
  //output
  data_out
);
parameter DATA = 32;

input             clk;
input             rst_b;
input             en;
input  [DATA-1:0] data_in;

output [DATA-1:0] data_out;

reg    [DATA-1:0] data_flop;

always @(posedge clk or negedge rst_b)
begin
  if(!rst_b)
    data_flop[DATA-1:0] <= {DATA{1'b0}};
  else if(en)
    data_flop[DATA-1:0] <= data_in[DATA-1:0];
end
assign data_out[DATA-1:0] = data_flop[DATA-1:0];
endmodule

