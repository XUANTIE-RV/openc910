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
module plic_hreg_busif(
  //input
  plic_clk,
  plicrst_b,
  bus_mtx_ict_psel,
  bus_mtx_ict_pprot,
  bus_mtx_ict_penable,
  bus_mtx_ict_paddr,
  bus_mtx_ict_pwrite,
  bus_mtx_ict_pwdata,
  bus_mtx_ict_psec,
  bus_mtx_ie_psel,
  bus_mtx_ie_pprot,
  bus_mtx_ie_penable,
  bus_mtx_ie_paddr,
  bus_mtx_ie_pwrite,
  bus_mtx_ie_pwdata,
  bus_mtx_ie_psec,
  arbx_hreg_claim_reg_ready,
  arbx_hreg_claim_mmode,
  arbx_hreg_claim_id,
  arbx_hreg_arb_start_ack,
  kid_hreg_new_int_pulse,
  ciu_plic_icg_en,
  pad_yy_icg_scan_en,
  kid_hreg_ip_prio_reg_we,
  ctrl_xx_amp_mode,
  ctrl_xx_core_sec,
  int_sec_infor,

  //output
  ie_bus_mtx_pready,
  ie_bus_mtx_prdata,
  ie_bus_mtx_pslverr,
  ict_bus_mtx_pready,
  ict_bus_mtx_prdata,
  ict_bus_mtx_pslverr,
  hreg_kid_claim_vld,
  //hreg_kid_claim_id,
  hreg_kid_cmplt_vld,
  hreg_arbx_arb_start,
  hreg_arbx_int_en,
  hreg_arbx_mint_claim,
  hreg_arbx_sint_claim,
  hreg_arbx_int_mmode,
  hreg_arbx_prio_sth,
  hreg_arbx_prio_mth,
  hreg_arbx_arb_flush
);
parameter          INT_NUM     = 1024;
parameter          MAX_HART_NUM= 32;
parameter          HART_NUM    = 5'h4;
parameter          ID_NUM      = 10;
parameter          PRIO_BIT    = 5;
parameter          IE_ADDR     = 13; // each hart will have 8 bit space,32 hart
parameter          ICT_ADDR    = 18; // each hart 2-4K space, 32 hart
localparam         HART_CT_DIV_TMP = HART_NUM/4;
localparam         CT_LEFT_NUM = HART_NUM - HART_CT_DIV_TMP * 4;
localparam         HART_CT_DIV = CT_LEFT_NUM > 0 ? HART_CT_DIV_TMP + 1 
                                                 : HART_CT_DIV_TMP;
  //input
input                             plic_clk;
input                             plicrst_b;
input                             bus_mtx_ict_psel;
input  [1:0]                      bus_mtx_ict_pprot;
input                             bus_mtx_ict_penable;
input  [ICT_ADDR-1:0]             bus_mtx_ict_paddr;
input                             bus_mtx_ict_pwrite;
input  [31:0]                     bus_mtx_ict_pwdata;
input                             bus_mtx_ict_psec;
input                             bus_mtx_ie_psel;
input  [1:0]                      bus_mtx_ie_pprot;
input                             bus_mtx_ie_penable;
input  [IE_ADDR-1:0]              bus_mtx_ie_paddr;
input                             bus_mtx_ie_pwrite;
input  [31:0]                     bus_mtx_ie_pwdata;
input                             bus_mtx_ie_psec;
input  [HART_NUM-1:0]             arbx_hreg_claim_reg_ready;
input  [HART_NUM-1:0]             arbx_hreg_claim_mmode;
input  [ID_NUM*HART_NUM-1:0]      arbx_hreg_claim_id;
input  [HART_NUM-1:0]             arbx_hreg_arb_start_ack;
input                             kid_hreg_new_int_pulse;
input                             pad_yy_icg_scan_en;
input                             kid_hreg_ip_prio_reg_we;
input                             ciu_plic_icg_en;
input                             ctrl_xx_amp_mode;
input  [HART_NUM-1:0]             ctrl_xx_core_sec;
input  [INT_NUM-1:0]              int_sec_infor;



  //output
output                            ie_bus_mtx_pready;
output [31:0]                     ie_bus_mtx_prdata;
output                            ie_bus_mtx_pslverr;
output                            ict_bus_mtx_pready;
output [31:0]                     ict_bus_mtx_prdata;
output                            ict_bus_mtx_pslverr;
output [INT_NUM-1:0]              hreg_kid_claim_vld;
//output [ID_NUM-1:0]               hreg_kid_claim_id;
output [INT_NUM-1:0]              hreg_kid_cmplt_vld;
output [HART_NUM-1:0]             hreg_arbx_arb_start;
output [HART_NUM*INT_NUM-1:0]     hreg_arbx_int_en;
output [HART_NUM-1:0]             hreg_arbx_mint_claim;
output [HART_NUM-1:0]             hreg_arbx_sint_claim;
output [HART_NUM*INT_NUM-1:0]     hreg_arbx_int_mmode;
output [HART_NUM*PRIO_BIT-1:0]    hreg_arbx_prio_sth;
output [HART_NUM*PRIO_BIT-1:0]    hreg_arbx_prio_mth;
output [HART_NUM-1:0]             hreg_arbx_arb_flush;

// wire definition
wire  [HART_NUM-1:0]              hart_ie_pready;
wire  [HART_NUM*32-1:0]           hart_ie_prdata;
wire  [HART_NUM*32-1:0]           hart_ie_pwdata;
wire  [HART_NUM-1:0]              hart_ie_pslverr;
wire  [HART_NUM-1:0]              hart_ie_psel;
wire  [HART_NUM-1:0]              hart_ie_psec;
wire  [HART_NUM*2-1:0]            hart_ie_pprot;
wire  [HART_NUM-1:0]              hart_ie_penable;
wire  [HART_NUM-1:0]              hart_ie_pwrite;
wire  [HART_NUM*IE_ADDR-1:0]      hart_ie_paddr;
wire  [HART_NUM-1:0]              ie_apb_acc_en;
wire  [MAX_HART_NUM:0]            ie_apb_write_en_exp;
wire  [MAX_HART_NUM:0]            arbx_hreg_arb_start_ack_exp;
wire  [HART_NUM-1:0]              ie_apb_write_en;
wire  [HART_NUM-1:0]              ie_apb_read_en;
wire  [HART_NUM-1:0]              ie_apb_read_acc_en;

wire  [31:0]                      hart_ie_prdata_pre[HART_NUM-1:0];
wire  [31:0]                      hart_ie_prdata_flop[HART_NUM-1:0];
wire  [HART_NUM-1:0]              hart_ie_ready_clk;
wire  [HART_NUM-1:0]              hart_ie_ready_clk_en;
wire  [HART_NUM-1:0]              ie_apb_slverr_pre;
wire  [INT_NUM/32-1:0]            ie_wr_clk[HART_NUM-1:0];
wire  [INT_NUM/32-1:0]            ie_wr_clk_en[HART_NUM-1:0];
wire  [INT_NUM-1:0]               hart_sie_flop[HART_NUM-1:0];
wire  [INT_NUM-1:0]               hart_mie_flop[HART_NUM-1:0];
wire  [INT_NUM-1:0]               hart_sie_flop_msk_zero[HART_NUM-1:0];
wire  [INT_NUM-1:0]               hart_mie_flop_msk_zero[HART_NUM-1:0];
wire  [HART_NUM*INT_NUM-1:0]      hart_sie_1d_bus;
wire  [HART_NUM*INT_NUM-1:0]      hart_mie_1d_bus;
wire                              ict_apb_acc_en;
wire                              ict_apb_write_en;
wire                              ict_apb_read_en;
wire  [HART_NUM-1:0]              busif_hart_mth_wr_en;
wire  [HART_NUM-1:0]              busif_hart_mth_rd_en;
wire  [MAX_HART_NUM:0]            busif_hart_mclaim_wr_en_exp;
wire  [HART_NUM-1:0]              busif_hart_mclaim_wr_en;
wire  [MAX_HART_NUM:0]            busif_hart_mclaim_rd_en_exp;
wire  [HART_NUM-1:0]              busif_hart_mclaim_rd_en;
wire  [HART_NUM-1:0]              busif_hart_sth_wr_en;
wire  [HART_NUM-1:0]              busif_hart_sth_rd_en;
wire  [HART_NUM-1:0]              busif_hart_sclaim_wr_en;
wire  [MAX_HART_NUM:0]            busif_hart_sclaim_wr_en_exp;
wire  [HART_NUM-1:0]              busif_hart_sclaim_rd_en;
wire  [MAX_HART_NUM:0]            busif_hart_sclaim_rd_en_exp;
wire  [HART_NUM-1:0]              hart_ict_read_en;
wire  [31:0]                      hart_ict_read_data[HART_NUM-1:0];    
wire  [(HART_NUM+1)*32-1:0]       hart_ict_read_data_tmp;
wire  [HART_NUM-1:0]              hart_claim_read_en;
wire  [31:0]                      hart_claim_read_data[HART_NUM-1:0];    
wire  [(HART_NUM+1)*32-1:0]       hart_claim_read_data_tmp;
wire                              ict_ready_clk;
wire                              ict_ready_clk_en;
wire  [31:0]                      hart_ict_prdata_pre;       
wire                              ict_apb_slverr_pre;
wire  [PRIO_BIT-1:0]              hart_mth_flop[HART_NUM-1:0];
wire  [PRIO_BIT-1:0]              hart_sth_flop[HART_NUM-1:0];
wire  [PRIO_BIT*HART_NUM-1:0]     hart_sth_1d_bus;
wire  [PRIO_BIT*HART_NUM-1:0]     hart_mth_1d_bus;
wire  [HART_NUM*ID_NUM-1:0]       hart_mclaim_set_id;
wire  [HART_NUM-1:0]              hart_mclaim_clr;
wire  [HART_NUM*ID_NUM-1:0]       hart_sclaim_set_id;
wire  [HART_NUM-1:0]              hart_sclaim_clr;
wire  [2*HART_NUM-1:0]            mclaim_eq_vec[HART_NUM-1:0];
wire  [2*HART_NUM-1:0]            sclaim_eq_vec[HART_NUM-1:0];
wire  [2*MAX_HART_NUM+1:0]        mclaim_eq_vec_exp[HART_NUM-1:0];
wire  [2*MAX_HART_NUM+1:0]        sclaim_eq_vec_exp[HART_NUM-1:0];
wire                              arbx_start_ack;
wire                              arb_start_en;
wire  [HART_NUM-1:0]              claim_clk;
wire  [HART_NUM-1:0]              tmp_claim_clk;
wire  [HART_NUM-1:0]              tmp_claim_clk_en;
wire  [HART_NUM-1:0]              th_wr_clk;
wire  [HART_NUM-1:0]              tmp_th_wr_clk;
wire  [HART_NUM-1:0]              tmp_th_wr_clk_en;
wire  [HART_NUM-1:0]              conv_tmp_claim_clk_en;
wire  [HART_NUM-1:0]              ori_tmp_claim_clk_en;
wire  [HART_NUM-1:0]              conv_tmp_th_wr_clk_en;
wire  [HART_NUM-1:0]              ori_tmp_th_wr_clk_en;
wire  [HART_NUM*IE_ADDR-1:0]      hart_ie_base_addr;
wire  [HART_NUM*IE_ADDR-1:0]      hart_ie_base_addr_msk;
wire  [(HART_NUM+1)*INT_NUM-1:0]  hart_int_cmplt_vld_tmp;
wire  [INT_NUM-1:0]               busif_hart_cmplt_int_vld[HART_NUM-1:0];
wire  [INT_NUM-1:0]               hart_cmplt_id_expnd;
wire  [(HART_NUM+1)*INT_NUM-1:0]  hart_int_claim_vld_tmp;
wire  [INT_NUM-1:0]               busif_hart_claim_int_vld[HART_NUM-1:0];
wire  [INT_NUM-1:0]               hart_claim_id_expnd;
wire  [ID_NUM-1:0]                hreg_kid_claim_id;
wire  [ID_NUM-1:0]                hreg_kid_cmplt_id;
wire                              hreg_cmplt_vld;
wire                              hreg_claim_vld;
wire                              ciu_plic_icg_en;
wire  [HART_NUM-1:0]              ict_psec_ctrl_en;
wire  [HART_NUM-1:0]              icg_psec_nonsec_err_en;
wire  [HART_NUM:0]                icg_psec_nonsec_err_en_rep;
wire  [INT_NUM-1:0]               hart_ie_sec_ctrl[HART_NUM-1:0];

//reg definition
wire  [INT_NUM+31:0]              mie_lst_read_tmp[HART_NUM-1:0];
wire  [INT_NUM+31:0]              sie_lst_read_tmp[HART_NUM-1:0];
wire  [INT_NUM/32-1:0]            busif_we_kid_mie[HART_NUM-1:0];
wire  [INT_NUM/32-1:0]            busif_rd_kid_mie[HART_NUM-1:0];
wire  [INT_NUM/32-1:0]            busif_we_kid_sie[HART_NUM-1:0];
wire  [INT_NUM/32-1:0]            busif_rd_kid_sie[HART_NUM-1:0];
wire  [INT_NUM-1:0]               busif_we_kid_mie_data[HART_NUM-1:0];
wire  [INT_NUM-1:0]               busif_we_kid_sie_data[HART_NUM-1:0];

reg   [ID_NUM-1:0]                hart_mclaim_flop[HART_NUM-1:0];
reg   [ID_NUM-1:0]                hart_sclaim_flop[HART_NUM-1:0];
reg                               arbx_arb_start_flop;

//**********************************************************************
//    the IE bus interface
//
//**********************************************************************
//**************************************
//    apb bus interface
//
//**************************************
generate
genvar j;
for(j=0;j<HART_NUM;j=j+1)
begin:HART_BASE_ADDR
  assign hart_ie_base_addr[j*IE_ADDR+:IE_ADDR]     = (j<<<8) & {IE_ADDR{1'b1}};
  assign hart_ie_base_addr_msk[j*IE_ADDR+:IE_ADDR] = {{(IE_ADDR-8){1'b1}},{8{1'b0}}};
end
endgenerate
csky_apb_1tox_matrix #(.ADDR(IE_ADDR),
                       .SLAVE(HART_NUM)
                       )x_prio_1tox_matrix(
  //input
  .pclk         (plic_clk),
  .prst_b       (plicrst_b),
  .slv_paddr    (bus_mtx_ie_paddr),
  .slv_psel     (bus_mtx_ie_psel),
  .slv_pprot    (bus_mtx_ie_pprot),
  .slv_penable  (bus_mtx_ie_penable),
  .slv_pwrite   (bus_mtx_ie_pwrite),
  .slv_pwdata   (bus_mtx_ie_pwdata),
  .slv_psec     (bus_mtx_ie_psec),
  .mst_pready   (hart_ie_pready[HART_NUM-1:0]),
  .mst_prdata   (hart_ie_prdata[HART_NUM*32-1:0]),
  .mst_pslverr  (hart_ie_pslverr[HART_NUM-1:0]),
  .mst_base_addr(hart_ie_base_addr[HART_NUM*IE_ADDR-1:0]),
  .mst_base_addr_msk(hart_ie_base_addr_msk[HART_NUM*IE_ADDR-1:0]),
  .ciu_plic_icg_en(ciu_plic_icg_en),
  .pad_yy_icg_scan_en(pad_yy_icg_scan_en),
  //.output
  .mst_psel     (hart_ie_psel[HART_NUM-1:0]),
  .mst_pprot    (hart_ie_pprot[HART_NUM*2-1:0]),
  .mst_penable  (hart_ie_penable[HART_NUM-1:0]),
  .mst_paddr    (hart_ie_paddr[HART_NUM*IE_ADDR-1:0]),
  .mst_pwrite   (hart_ie_pwrite[HART_NUM-1:0]),
  .mst_pwdata   (hart_ie_pwdata[HART_NUM*32-1:0]),
  .mst_psec     (hart_ie_psec[HART_NUM-1:0]),
  .slv_pready   (ie_bus_mtx_pready),
  .slv_prdata   (ie_bus_mtx_prdata),
  .slv_pslverr  (ie_bus_mtx_pslverr)
);

//****************************************************
//   generate the write/read signal
//   for each ie register
//   using the 2-d array
//****************************************************
genvar m;
genvar n;
generate
  for(n=0;n<HART_NUM;n=n+1)
  begin: HART_EXP
assign  mie_lst_read_tmp[n][31:0] = {32{1'b0}};
assign  sie_lst_read_tmp[n][31:0] = {32{1'b0}};
    for(m=0;m<INT_NUM/32;m=m+1)
    begin:INT_EXP
//***************************
// mie write/read en, 2-d array,
// each for 32bit ie
//***************************
assign     busif_we_kid_mie[n][m] = ie_apb_write_en[n] 
                                     && !(hart_ie_paddr[7+IE_ADDR*n])
                                     && (hart_ie_paddr[(2+IE_ADDR*n)+:5] == m);
assign     busif_rd_kid_mie[n][m] = ie_apb_read_en[n] 
                                     && !(hart_ie_paddr[7+IE_ADDR*n])
                                     && (hart_ie_paddr[(2+IE_ADDR*n)+:5] == m); 
//***************************
// mie write/read en, 2-d array,
// each for 32bit ie
//***************************

assign     busif_we_kid_sie[n][m] = ie_apb_write_en[n] 
                                     && (hart_ie_paddr[7+IE_ADDR*n])
                                     && (hart_ie_paddr[(2+IE_ADDR*n)+:5] == m);
assign     busif_rd_kid_sie[n][m] = ie_apb_read_en[n] 
                                     && (hart_ie_paddr[7+IE_ADDR*n])
                                     && (hart_ie_paddr[(2+IE_ADDR*n)+:5] == m);
//***************************
// write data 2-d array,
// hart-ie
//***************************

assign     busif_we_kid_mie_data[n][32*m+:32] 
                                   = hart_ie_pwdata[32*n+:32] & hart_ie_sec_ctrl[n][32*m+:32];
assign     busif_we_kid_sie_data[n][32*m+:32] 
                                   = hart_ie_pwdata[32*n+:32] & hart_ie_sec_ctrl[n][32*m+:32];
//***************************
// read data 2-d array,
// hart-ie
//***************************

assign     mie_lst_read_tmp[n][32*(m+1)+:32]
                                = mie_lst_read_tmp[n][32*m+:32]
                                  |({32{busif_rd_kid_mie[n][m]}} 
                                    & hart_mie_flop_msk_zero[n][32*m+:32]);
assign     sie_lst_read_tmp[n][32*(m+1)+:32]
                                      = sie_lst_read_tmp[n][32*m+:32]
                                        |({32{busif_rd_kid_sie[n][m]}} 
                                          & hart_sie_flop_msk_zero[n][32*m+:32]);

    end //end of first for loop INT_NUM     
  end //end of HART NUM
endgenerate

generate
genvar k;
for(k=0;k<HART_NUM;k=k+1)
begin:HART_IE_RW
  assign ie_apb_acc_en[k]              = hart_ie_psel[k]  && !hart_ie_penable[k];
  assign ie_apb_write_en[k]            = ie_apb_acc_en[k] 
                                         && hart_ie_pwrite[k] 
                                         && !ie_apb_slverr_pre[k]
                                         && (hart_ie_psec[k] || !ctrl_xx_core_sec[k] || !ctrl_xx_amp_mode);
  assign ie_apb_read_en[k]             = ie_apb_acc_en[k] && !hart_ie_pwrite[k] && (hart_ie_psec[k] || !ctrl_xx_core_sec[k] || !ctrl_xx_amp_mode);
  assign ie_apb_read_acc_en[k]         = ie_apb_acc_en[k] && !hart_ie_pwrite[k];
  assign hart_ie_sec_ctrl[k]           = (int_sec_infor[INT_NUM-1:0] ~^ {INT_NUM{ctrl_xx_core_sec[k]}}) | {INT_NUM{~ctrl_xx_amp_mode}};

//merge the rdata
  assign hart_ie_prdata_pre[k]        = ie_apb_slverr_pre[k] ? 32'b0: (mie_lst_read_tmp[k][INT_NUM+:32] 
                                        & {32{!(hart_ie_paddr[7+IE_ADDR*k])}})
                                      | (sie_lst_read_tmp[k][INT_NUM+:32] 
                                        & {32{(hart_ie_paddr[7+IE_ADDR*k])}});

//*************************************
//  the ie ready signal
//*************************************
  instance_reg_flog #(.DATA(1)) x_hart_ie_ready_ff(
    .clk      (hart_ie_ready_clk[k]),
    .en       (hart_ie_psel[k]),
    .rst_b    (plicrst_b),
    .data_in  (ie_apb_acc_en[k]),
    .data_out (hart_ie_pready[k])
  );
//*************************************
//  the ie rdata signal
//*************************************
  instance_reg_flog #(.DATA(32)) x_hart_ie_rdata_ff(
    .clk      (hart_ie_ready_clk[k]),
    .en       (ie_apb_read_acc_en[k]),
    .rst_b    (plicrst_b),
    .data_in  (hart_ie_prdata_pre[k]),
    .data_out (hart_ie_prdata_flop[k])
  ); 
  assign hart_ie_prdata[k*32+:32]    = hart_ie_prdata_flop[k];
//*************************************
//  the ie slverr signal
//*************************************
  instance_reg_flog #(.DATA(1)) x_hart_ie_slverr_ff(
    .clk      (hart_ie_ready_clk[k]),
    .en       (ie_apb_acc_en[k]),
    .rst_b    (plicrst_b),
    .data_in  (ie_apb_slverr_pre[k]),
    .data_out (hart_ie_pslverr[k])
  );
  assign ie_apb_slverr_pre[k] =  (hart_ie_paddr[2+IE_ADDR*k+:5] >= $unsigned(INT_NUM/32)) 
                                 || (hart_ie_pprot[2*k+1] == 1'b0)
                                 || (!hart_ie_psec[k] && ctrl_xx_core_sec[k]);
                                 
  gated_clk_cell  x_hart_ie_ready_gateclk (
    .clk_in               (plic_clk            ),
    .clk_out              (hart_ie_ready_clk[k]),
    .external_en          (1'b0                ),
    .global_en            (1'b1                ),
    .local_en             (hart_ie_ready_clk_en[k]),
    .module_en            (ciu_plic_icg_en     ),
    .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
  );
  assign hart_ie_ready_clk_en[k] = ie_apb_acc_en[k];
end
endgenerate
//****************************************************
//  MIE/SIE flop instance  
//****************************************************
generate
genvar i;
genvar rd_idx;
for(i=0;i<HART_NUM;i=i+1)
begin:HART_IE
  for(rd_idx=0;rd_idx<INT_NUM/32;rd_idx=rd_idx+1)
  begin:HART_IE_32
  instance_reg_flog #(.DATA(32)) x_hart_mie_ff(
    .clk      (ie_wr_clk[i][rd_idx]),
    .en       (busif_we_kid_mie[i][rd_idx]),
    .rst_b    (plicrst_b),
    .data_in  (busif_we_kid_mie_data[i][32*rd_idx+:32]),
    .data_out (hart_mie_flop[i][32*rd_idx+:32])
  ); 
  instance_reg_flog #(.DATA(32)) x_hart_sie_ff(
    .clk      (ie_wr_clk[i][rd_idx]),
    .en       (busif_we_kid_sie[i][rd_idx]),
    .rst_b    (plicrst_b),
    .data_in  (busif_we_kid_sie_data[i][32*rd_idx+:32]),
    .data_out (hart_sie_flop[i][32*rd_idx+:32])
  );
    // gate clk instance
  gated_clk_cell  x_hart_ie_wr_gateclk (
    .clk_in               (plic_clk            ),
    .clk_out              (ie_wr_clk[i][rd_idx]),
    .external_en          (1'b0                ),
    .global_en            (1'b1                ),
    .local_en             (ie_wr_clk_en[i][rd_idx]),
    .module_en            (ciu_plic_icg_en     ),
    .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
  );
  assign ie_wr_clk_en[i][rd_idx]   =  busif_we_kid_mie[i][rd_idx] ||
                                      busif_we_kid_sie[i][rd_idx];
  end
//here we don't need the ie of int index 0 
  assign hart_sie_flop_msk_zero[i]           =  hart_sie_flop[i] & {{(INT_NUM-1){1'b1}},1'b0};
  assign hart_mie_flop_msk_zero[i]           =  hart_mie_flop[i] & {{(INT_NUM-1){1'b1}},1'b0};
  assign hart_sie_1d_bus[i*INT_NUM+:INT_NUM] = hart_sie_flop_msk_zero[i];
  assign hart_mie_1d_bus[i*INT_NUM+:INT_NUM] = hart_mie_flop_msk_zero[i];

end
endgenerate
//**********************************************************************
//    the interrupt TH/CLAIM bus interface
//
//**********************************************************************
assign ict_apb_acc_en       = bus_mtx_ict_psel && !bus_mtx_ict_penable;
assign ict_apb_write_en     = ict_apb_acc_en && bus_mtx_ict_pwrite && !ict_apb_slverr_pre;
assign ict_apb_read_en      = ict_apb_acc_en && !bus_mtx_ict_pwrite;
assign hart_ict_read_data_tmp[31:0] = 32'b0;
assign hart_claim_read_data_tmp[31:0] = 32'b0;
generate
genvar ht_idx;
for(ht_idx=0;ht_idx<HART_NUM;ht_idx=ht_idx+1)
begin:ICT_RW
//*************************************
//  the ie mth write read enable
//*************************************
  assign ict_psec_ctrl_en[ht_idx]      = (bus_mtx_ict_psec || !ctrl_xx_core_sec[ht_idx] || !ctrl_xx_amp_mode);
  assign icg_psec_nonsec_err_en[ht_idx]= !bus_mtx_ict_psec && ctrl_xx_core_sec[ht_idx] && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx);
  assign busif_hart_mth_wr_en[ht_idx]  = ict_apb_write_en 
                                      && (bus_mtx_ict_pprot[1:0] == 2'b11)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && !(bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_paddr[11:0] == 12'b0) && ict_psec_ctrl_en[ht_idx];
  assign busif_hart_mth_rd_en[ht_idx]  = ict_apb_read_en 
                                      && (bus_mtx_ict_pprot[1:0] == 2'b11)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && !(bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_pprot[1:0] == 2'b11)
                                      && (bus_mtx_ict_paddr[11:0] == 12'b0) && ict_psec_ctrl_en[ht_idx];
//*************************************
//  the ie mclaim write read enable
//*************************************

  assign busif_hart_mclaim_wr_en[ht_idx]  = ict_apb_write_en 
                                      && (bus_mtx_ict_pprot[1:0] == 2'b11)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && !(bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_paddr[11:0] == 12'h4) && ict_psec_ctrl_en[ht_idx];
  assign busif_hart_mclaim_rd_en[ht_idx]  = ict_apb_read_en 
                                      && (bus_mtx_ict_pprot[1:0] == 2'b11)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && !(bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_paddr[11:0] == 12'h4) && ict_psec_ctrl_en[ht_idx];
//*************************************
//  the ie sth write read enable
//*************************************

  assign busif_hart_sth_wr_en[ht_idx]  = ict_apb_write_en 
                                      && (bus_mtx_ict_pprot[0] == 1'b1)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && (bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_paddr[11:0] == 12'b0)&& ict_psec_ctrl_en[ht_idx];
  assign busif_hart_sth_rd_en[ht_idx]  = ict_apb_read_en 
                                      && (bus_mtx_ict_pprot[0] == 1'b1)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && (bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_paddr[11:0] == 12'b0)&& ict_psec_ctrl_en[ht_idx];
//*************************************
//  the ie sclaim write read enable
//*************************************
  assign busif_hart_sclaim_wr_en[ht_idx]  = ict_apb_write_en 
                                      && (bus_mtx_ict_pprot[0] == 1'b1)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && (bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_paddr[11:0] == 12'h4)&& ict_psec_ctrl_en[ht_idx];
  assign busif_hart_sclaim_rd_en[ht_idx]  = ict_apb_read_en 
                                      && (bus_mtx_ict_pprot[0] == 1'b1)
                                      && (bus_mtx_ict_paddr[ICT_ADDR-1:13] == ht_idx)
                                      && (bus_mtx_ict_paddr[12])
                                      && (bus_mtx_ict_paddr[11:0] == 12'h4)&& ict_psec_ctrl_en[ht_idx];
  assign hart_ict_read_en[ht_idx]    =    busif_hart_mth_rd_en[ht_idx]
                                       || busif_hart_sth_rd_en[ht_idx]
                                       || hart_claim_read_en[ht_idx];
  assign hart_ict_read_data[ht_idx] =     ({32{busif_hart_mth_rd_en[ht_idx]}} 
                                          & {{32-PRIO_BIT{1'b0}},hart_mth_flop[ht_idx]})
                                       | ({32{busif_hart_sth_rd_en[ht_idx]}} 
                                          & {{32-PRIO_BIT{1'b0}},hart_sth_flop[ht_idx]})
                                       | hart_claim_read_data[ht_idx];
  assign hart_ict_read_data_tmp[(ht_idx+1)*32+:32]  =  hart_ict_read_data_tmp[ht_idx*32+:32]
                                                     | ({32{hart_ict_read_en[ht_idx]}}
                                                        & hart_ict_read_data[ht_idx]);
  assign hart_claim_read_en[ht_idx]   = busif_hart_mclaim_rd_en[ht_idx]
                                       || busif_hart_sclaim_rd_en[ht_idx];                                                      
  assign hart_claim_read_data[ht_idx] = ({32{busif_hart_mclaim_rd_en[ht_idx]}}
                                          & {{32-ID_NUM{1'b0}},hart_mclaim_flop[ht_idx]})
                                       | ({32{busif_hart_sclaim_rd_en[ht_idx]}}
                                          & {{32-ID_NUM{1'b0}},hart_sclaim_flop[ht_idx]});
  assign hart_claim_read_data_tmp[(ht_idx+1)*32+:32] = hart_claim_read_data_tmp[ht_idx*32+:32]
                                                     | ({32{hart_claim_read_en[ht_idx]}}
                                                        & hart_claim_read_data[ht_idx]);

end
endgenerate
//*************************************
//  the ict ready signal
//*************************************
  instance_reg_flog #(.DATA(1)) x_hart_ict_ready_ff(
    .clk      (ict_ready_clk),
    .en       (bus_mtx_ict_psel),
    .rst_b    (plicrst_b),
    .data_in  (ict_apb_acc_en),
    .data_out (ict_bus_mtx_pready)
  );
//*************************************
//  the ict rdata signal
//*************************************
  instance_reg_flog #(.DATA(32)) x_hart_ict_rdata_ff(
    .clk      (ict_ready_clk),
    .en       (ict_apb_read_en),
    .rst_b    (plicrst_b),
    .data_in  (hart_ict_prdata_pre),
    .data_out (ict_bus_mtx_prdata)
  ); 
  assign hart_ict_prdata_pre[31:0]    = ict_apb_slverr_pre ? 32'b0 
                                                    : hart_ict_read_data_tmp[HART_NUM*32+:32];
//*************************************
//  the ict slverr signal
//*************************************
  instance_reg_flog #(.DATA(1)) x_hart_ict_slverr_ff(
    .clk      (ict_ready_clk),
    .en       (ict_apb_acc_en),
    .rst_b    (plicrst_b),
    .data_in  (ict_apb_slverr_pre),
    .data_out (ict_bus_mtx_pslverr)
  );
  assign ict_apb_slverr_pre = (bus_mtx_ict_paddr[ICT_ADDR-1:13]>=HART_NUM)
                            || ((bus_mtx_ict_paddr[11:2] > 10'b1 )
                               ||((bus_mtx_ict_pprot[1] == 1'b0)
                                   && (bus_mtx_ict_paddr[12] == 1'b0) || 
                                  (bus_mtx_ict_pprot[0] == 1'b0)
                                   && (bus_mtx_ict_paddr[12] == 1'b1))) 
                            || |icg_psec_nonsec_err_en_rep;
assign icg_psec_nonsec_err_en_rep[HART_NUM:0] = {1'b0,icg_psec_nonsec_err_en[HART_NUM-1:0]};
gated_clk_cell  x_ict_ready_gateclk (
  .clk_in               (plic_clk            ),
  .clk_out              (ict_ready_clk        ),
  .external_en          (1'b0                ),
  .global_en            (1'b1                ),
  .local_en             (ict_ready_clk_en     ),
  .module_en            (ciu_plic_icg_en      ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);
assign   ict_ready_clk_en = ict_apb_acc_en;

generate
genvar ht_reg_idx;
for(ht_reg_idx=0;ht_reg_idx<HART_NUM;ht_reg_idx=ht_reg_idx+1)
begin:HART_ICT_REG
//*************************************
//  the threshold register 
//*************************************

  instance_reg_flog #(.DATA(PRIO_BIT)) x_hart_mth_ff(
    .clk      (th_wr_clk[ht_reg_idx]),
    .en       (busif_hart_mth_wr_en[ht_reg_idx]),
    .rst_b    (plicrst_b),
    .data_in  (bus_mtx_ict_pwdata[PRIO_BIT-1:0]),
    .data_out (hart_mth_flop[ht_reg_idx])
  );
  instance_reg_flog #(.DATA(PRIO_BIT)) x_hart_sth_ff(
    .clk      (th_wr_clk[ht_reg_idx]),
    .en       (busif_hart_sth_wr_en[ht_reg_idx]),
    .rst_b    (plicrst_b),
    .data_in  (bus_mtx_ict_pwdata[PRIO_BIT-1:0]),
    .data_out (hart_sth_flop[ht_reg_idx])
  );
  assign hart_sth_1d_bus[ht_reg_idx*PRIO_BIT+:PRIO_BIT] = hart_sth_flop[ht_reg_idx];
  assign hart_mth_1d_bus[ht_reg_idx*PRIO_BIT+:PRIO_BIT] = hart_mth_flop[ht_reg_idx];
  assign hart_mclaim_set_id[ht_reg_idx*ID_NUM+:ID_NUM] = 
                                         {ID_NUM{arbx_hreg_claim_mmode[ht_reg_idx]}} 
                                       & arbx_hreg_claim_id[ID_NUM*ht_reg_idx+:ID_NUM];
  assign hart_sclaim_set_id[ht_reg_idx*ID_NUM+:ID_NUM] = 
                                          {ID_NUM{!arbx_hreg_claim_mmode[ht_reg_idx]}}  
                                        & arbx_hreg_claim_id[ID_NUM*ht_reg_idx+:ID_NUM];
  assign hart_mclaim_clr[ht_reg_idx] = busif_hart_mclaim_rd_en[ht_reg_idx] 
                                       || (|(mclaim_eq_vec_exp[ht_reg_idx][0+:(MAX_HART_NUM+1)] 
                                            & {{(MAX_HART_NUM-HART_NUM+1){1'b0}},
                                              busif_hart_mclaim_rd_en[0+:HART_NUM]}))
                                       || (|(mclaim_eq_vec_exp[ht_reg_idx][(MAX_HART_NUM+1)+:(MAX_HART_NUM+1)]
                                            & {{MAX_HART_NUM-HART_NUM+1{1'b0}},
                                                busif_hart_sclaim_rd_en[0+:HART_NUM]}));
  assign hart_sclaim_clr[ht_reg_idx] = busif_hart_sclaim_rd_en[ht_reg_idx] 
                                       || (|(sclaim_eq_vec_exp[ht_reg_idx][0+:(MAX_HART_NUM+1)] 
                                            & {{(MAX_HART_NUM-HART_NUM+1){1'b0}},
                                                busif_hart_mclaim_rd_en[0+:HART_NUM]}))
                                       || (|(sclaim_eq_vec_exp[ht_reg_idx][(MAX_HART_NUM+1)+:(MAX_HART_NUM+1)]
                                            & {{(MAX_HART_NUM-HART_NUM+1){1'b0}},
                                               busif_hart_sclaim_rd_en[0+:HART_NUM]}));
//*************************************
//  the claim register 
//*************************************

  always @(posedge claim_clk[ht_reg_idx] or negedge plicrst_b)
  begin
    if(!plicrst_b)
      hart_mclaim_flop[ht_reg_idx] <= {ID_NUM{1'b0}};
    else if(hart_mclaim_clr[ht_reg_idx])
      hart_mclaim_flop[ht_reg_idx] <= {ID_NUM{1'b0}};
    else if(arbx_hreg_claim_reg_ready[ht_reg_idx])
      hart_mclaim_flop[ht_reg_idx] <= hart_mclaim_set_id[ID_NUM*ht_reg_idx+:ID_NUM];
  end
  always @(posedge claim_clk[ht_reg_idx] or negedge plicrst_b)
  begin
    if(!plicrst_b)
      hart_sclaim_flop[ht_reg_idx] <= {ID_NUM{1'b0}};
    else if(hart_sclaim_clr[ht_reg_idx])
      hart_sclaim_flop[ht_reg_idx] <= {ID_NUM{1'b0}};
    else if(arbx_hreg_claim_reg_ready[ht_reg_idx])
      hart_sclaim_flop[ht_reg_idx] <= hart_sclaim_set_id[ID_NUM*ht_reg_idx+:ID_NUM];
  end
end
endgenerate
// gate clk instance
generate 
genvar gk;
for(gk=0;gk<HART_NUM;gk=gk+1)
begin:HART_ICT_GATE_CLK
  gated_clk_cell  x_hart_claim_gateclk (
    .clk_in               (plic_clk            ),
    .clk_out              (tmp_claim_clk[gk]   ),
    .external_en          (1'b0                ),
    .global_en            (1'b1                ),
    .local_en             (tmp_claim_clk_en[gk]),
    .module_en            (ciu_plic_icg_en     ),
    .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
  );
  assign tmp_claim_clk_en[gk]         = conv_tmp_claim_clk_en[gk];
  assign claim_clk[gk]                = tmp_claim_clk[gk];
  gated_clk_cell  x_hart_th_wr_gateclk (
    .clk_in               (plic_clk            ),
    .clk_out              (tmp_th_wr_clk[gk]),
    .external_en          (1'b0                ),
    .global_en            (1'b1                ),
    .local_en             (tmp_th_wr_clk_en[gk]),
    .module_en            (ciu_plic_icg_en     ),
    .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
  );

  assign tmp_th_wr_clk_en[gk]    = conv_tmp_th_wr_clk_en[gk];
  assign th_wr_clk[gk]           = tmp_th_wr_clk[gk];

end
endgenerate
assign conv_tmp_claim_clk_en[HART_NUM-1:0]   = ori_tmp_claim_clk_en[HART_NUM-1:0];
assign ori_tmp_claim_clk_en[HART_NUM-1:0]    = arbx_hreg_claim_reg_ready[HART_NUM-1:0] 
                                              |hart_mclaim_clr[HART_NUM-1:0]
                                              |hart_sclaim_clr[HART_NUM-1:0];
assign conv_tmp_th_wr_clk_en[HART_NUM-1:0]   = ori_tmp_th_wr_clk_en[HART_NUM-1:0];
assign ori_tmp_th_wr_clk_en[HART_NUM-1:0]    = busif_hart_sth_wr_en[HART_NUM-1:0] 
                                              |busif_hart_mth_wr_en[HART_NUM-1:0];
//*************************************
//  the claim register clear vector,
//  which record the equality of each 
//  claim register
//  here, there is another more efficient
//  code
//*************************************
generate 
genvar clm_idx;
genvar hrt_clm_idx;
for(clm_idx=0;clm_idx<HART_NUM;clm_idx=clm_idx+1)
begin: CLAIM_CMPAR
  for(hrt_clm_idx=0;hrt_clm_idx<HART_NUM;hrt_clm_idx=hrt_clm_idx+1)
  begin:CLAIM_CMPARE_IN
    assign mclaim_eq_vec[clm_idx][hrt_clm_idx]         = hart_mclaim_flop[clm_idx] 
                                                          == hart_mclaim_flop[hrt_clm_idx];
    assign mclaim_eq_vec[clm_idx][HART_NUM+hrt_clm_idx]= hart_mclaim_flop[clm_idx] 
                                                          == hart_sclaim_flop[hrt_clm_idx];
    assign sclaim_eq_vec[clm_idx][hrt_clm_idx]         = hart_sclaim_flop[clm_idx] 
                                                          == hart_mclaim_flop[hrt_clm_idx];
    assign sclaim_eq_vec[clm_idx][HART_NUM+hrt_clm_idx]= hart_sclaim_flop[clm_idx] 
                                                          == hart_sclaim_flop[hrt_clm_idx];
  end
                                                         
end
endgenerate

generate 
genvar exp_idx;
for(exp_idx=0;exp_idx<HART_NUM;exp_idx=exp_idx+1)
begin: EXP_SEL
  assign mclaim_eq_vec_exp[exp_idx][MAX_HART_NUM:0]     =  {{(MAX_HART_NUM-HART_NUM+1){1'b0}},
                                                           mclaim_eq_vec[exp_idx][0+:HART_NUM]};
  assign mclaim_eq_vec_exp[exp_idx][(MAX_HART_NUM+1)+:(MAX_HART_NUM+1)] = {{(MAX_HART_NUM-HART_NUM+1){1'b0}},
                                                                   mclaim_eq_vec[exp_idx][HART_NUM+:HART_NUM]};
  assign sclaim_eq_vec_exp[exp_idx][MAX_HART_NUM:0]     =  {{(MAX_HART_NUM-HART_NUM+1){1'b0}},
                                                           sclaim_eq_vec[exp_idx][0+:HART_NUM]};
  assign sclaim_eq_vec_exp[exp_idx][(MAX_HART_NUM+1)+:(MAX_HART_NUM+1)] = {{(MAX_HART_NUM-HART_NUM+1){1'b0}},
                                                                   sclaim_eq_vec[exp_idx][HART_NUM+:HART_NUM]};

end
endgenerate
//**********************************************************************
//    to arbitor  interface
//
//**********************************************************************
assign hreg_arbx_mint_claim[HART_NUM-1:0]          = hart_mclaim_clr[HART_NUM-1:0]; 
assign hreg_arbx_sint_claim[HART_NUM-1:0]          = hart_sclaim_clr[HART_NUM-1:0];
assign hreg_arbx_arb_flush[HART_NUM-1:0]          = {HART_NUM{hreg_claim_vld
                                                      || hreg_cmplt_vld}};
assign hreg_arbx_arb_start[HART_NUM-1:0]          = {HART_NUM{arbx_arb_start_flop}};
assign hreg_arbx_prio_sth[HART_NUM*PRIO_BIT-1:0]  = hart_sth_1d_bus[HART_NUM*PRIO_BIT-1:0];
assign hreg_arbx_prio_mth[HART_NUM*PRIO_BIT-1:0]  = hart_mth_1d_bus[HART_NUM*PRIO_BIT-1:0];
assign hreg_arbx_int_en[INT_NUM*HART_NUM-1:0]     = hart_mie_1d_bus[INT_NUM*HART_NUM-1:0]
                                                    | hart_sie_1d_bus[INT_NUM*HART_NUM-1:0];
assign hreg_arbx_int_mmode[INT_NUM*HART_NUM-1:0]  = {hart_mie_1d_bus[INT_NUM*HART_NUM-1:1],1'b0};
assign ie_apb_write_en_exp[MAX_HART_NUM:0]        = {{MAX_HART_NUM-HART_NUM+1{1'b0}},
                                                      ie_apb_write_en[HART_NUM-1:0]};
assign arbx_hreg_arb_start_ack_exp[MAX_HART_NUM:0]= {{MAX_HART_NUM-HART_NUM+1{1'b0}},
                                                      arbx_hreg_arb_start_ack[HART_NUM-1:0]};
assign arbx_start_ack                             = |arbx_hreg_arb_start_ack_exp[MAX_HART_NUM:0];
assign arb_start_en                               = hreg_claim_vld 
                                                    || hreg_cmplt_vld 
                                                    || kid_hreg_new_int_pulse
                                                    || kid_hreg_ip_prio_reg_we
                                                    || |ie_apb_write_en_exp[MAX_HART_NUM:0]
                                                    || ict_apb_write_en;

// record the new event and start the arbitor
always @(posedge plic_clk or negedge plicrst_b)
begin
  if(!plicrst_b)
    arbx_arb_start_flop       <= 1'b0;
  else if(arb_start_en)
    arbx_arb_start_flop       <= 1'b1;
  else if(arbx_start_ack)   
    arbx_arb_start_flop       <= 1'b0;
end
//**********************************************************************
//    to kid interface
//
//**********************************************************************
assign busif_hart_mclaim_rd_en_exp[MAX_HART_NUM:0] = {{MAX_HART_NUM-HART_NUM+1{1'b0}},
                                                     busif_hart_mclaim_rd_en[HART_NUM-1:0]};
assign busif_hart_sclaim_rd_en_exp[MAX_HART_NUM:0] = {{MAX_HART_NUM-HART_NUM+1{1'b0}},
                                                     busif_hart_sclaim_rd_en[HART_NUM-1:0]};

assign hreg_claim_vld               =   |busif_hart_mclaim_rd_en_exp[MAX_HART_NUM:0] ||
                                            |busif_hart_sclaim_rd_en_exp[MAX_HART_NUM:0];
assign hreg_kid_claim_id[ID_NUM-1:0]    =   hart_claim_read_data_tmp[HART_NUM*32+:ID_NUM]; 
assign busif_hart_mclaim_wr_en_exp[MAX_HART_NUM:0]  = {{MAX_HART_NUM-HART_NUM+1{1'b0}},
                                                         busif_hart_mclaim_wr_en[HART_NUM-1:0]};
assign busif_hart_sclaim_wr_en_exp[MAX_HART_NUM:0]  = {{MAX_HART_NUM-HART_NUM+1{1'b0}},
                                                         busif_hart_sclaim_wr_en[HART_NUM-1:0]};
                                                       
assign hreg_cmplt_vld                   =   |busif_hart_mclaim_wr_en_exp[MAX_HART_NUM:0] ||
                                            |busif_hart_sclaim_wr_en_exp[MAX_HART_NUM:0];
assign hreg_kid_cmplt_id[ID_NUM-1:0]    =   bus_mtx_ict_pwdata[ID_NUM-1:0];

generate 
genvar hart_cmplt_idx;
  for(hart_cmplt_idx=0;hart_cmplt_idx<HART_NUM;hart_cmplt_idx=hart_cmplt_idx+1)
  begin:HART_CMPLT
    assign busif_hart_cmplt_int_vld[hart_cmplt_idx][INT_NUM-1:0] = 
                                          ({INT_NUM{busif_hart_mclaim_wr_en[hart_cmplt_idx]}} & 
                                          hart_mie_flop_msk_zero[hart_cmplt_idx]) |
                                          ({INT_NUM{busif_hart_sclaim_wr_en[hart_cmplt_idx]}} & 
                                          hart_sie_flop_msk_zero[hart_cmplt_idx]);
    assign hart_int_cmplt_vld_tmp[INT_NUM*(hart_cmplt_idx+1)+:INT_NUM] =  
                                   hart_int_cmplt_vld_tmp[INT_NUM*(hart_cmplt_idx)+:INT_NUM] | 
                                   busif_hart_cmplt_int_vld[hart_cmplt_idx];
    assign busif_hart_claim_int_vld[hart_cmplt_idx][INT_NUM-1:0] = 
                                          ({INT_NUM{busif_hart_mclaim_rd_en[hart_cmplt_idx]}} & 
                                          hart_mie_flop_msk_zero[hart_cmplt_idx]) |
                                          ({INT_NUM{busif_hart_sclaim_rd_en[hart_cmplt_idx]}} & 
                                          hart_sie_flop_msk_zero[hart_cmplt_idx]);
    assign hart_int_claim_vld_tmp[INT_NUM*(hart_cmplt_idx+1)+:INT_NUM] =  
                                   hart_int_claim_vld_tmp[INT_NUM*(hart_cmplt_idx)+:INT_NUM] | 
                                   busif_hart_claim_int_vld[hart_cmplt_idx];
  end
endgenerate
assign  hart_int_cmplt_vld_tmp[0+:INT_NUM] = {INT_NUM{1'b0}};
assign  hart_int_claim_vld_tmp[0+:INT_NUM] = {INT_NUM{1'b0}};
generate 
genvar cmplt_idx;
  for(cmplt_idx=0;cmplt_idx<INT_NUM;cmplt_idx=cmplt_idx+1)
  begin:CMPLT
    assign hart_cmplt_id_expnd[cmplt_idx] = (hreg_kid_cmplt_id[ID_NUM-1:0] == cmplt_idx);
    assign hart_claim_id_expnd[cmplt_idx] = (hreg_kid_claim_id[ID_NUM-1:0] == cmplt_idx);
  end 
endgenerate
assign hreg_kid_cmplt_vld[INT_NUM-1:0] = hart_cmplt_id_expnd[INT_NUM-1:0] & 
                                         hart_int_cmplt_vld_tmp[INT_NUM*HART_NUM +: INT_NUM];
assign hreg_kid_claim_vld[INT_NUM-1:0] = hart_claim_id_expnd[INT_NUM-1:0] & 
                                         hart_int_claim_vld_tmp[INT_NUM*HART_NUM +: INT_NUM];                                         
endmodule
