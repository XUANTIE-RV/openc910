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
module top_golden_port(
  biu_pad_acready,
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
  biu_pad_cddata,
  biu_pad_cderr,
  biu_pad_cdlast,
  biu_pad_cdvalid,
  biu_pad_cnt_en,
  biu_pad_crresp,
  biu_pad_crvalid,
  biu_pad_csr_sel,
  biu_pad_csr_wdata,
  biu_pad_jdb_pm,
  biu_pad_lpmd_b,
  biu_pad_rack,
  biu_pad_rready,
  biu_pad_wdata,
  biu_pad_werr,
  biu_pad_wlast,
  biu_pad_wns,
  biu_pad_wstrb,
  biu_pad_wvalid,
  cp0_pad_mstatus,
  ir_corex_wdata,
  pad_biu_acaddr,
  pad_biu_acprot,
  pad_biu_acsnoop,
  pad_biu_acvalid,
  pad_biu_arready,
  pad_biu_awready,
  pad_biu_bid,
  pad_biu_bresp,
  pad_biu_bvalid,
  pad_biu_cdready,
  pad_biu_crready,
  pad_biu_csr_cmplt,
  pad_biu_csr_rdata,
  pad_biu_dbgrq_b,
  pad_biu_hpcp_l2of_int,
  pad_biu_me_int,
  pad_biu_ms_int,
  pad_biu_mt_int,
  pad_biu_rdata,
  pad_biu_rid,
  pad_biu_rlast,
  pad_biu_rresp,
  pad_biu_rvalid,
  pad_biu_se_int,
  pad_biu_ss_int,
  pad_biu_st_int,
  pad_biu_wns_awready,
  pad_biu_wns_wready,
  pad_biu_wready,
  pad_biu_ws_awready,
  pad_biu_ws_wready,
  pad_core_hartid,
  pad_core_rst_b,
  pad_core_rvba,
  pad_cpu_rst_b,
  pad_xx_apb_base,
  pad_xx_time,
  pad_yy_icg_scan_en,
  pad_yy_mbist_mode,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  pll_core_clk,
  rtu_cpu_no_retire,
  rtu_pad_retire0,
  rtu_pad_retire0_pc,
  rtu_pad_retire1,
  rtu_pad_retire1_pc,
  rtu_pad_retire2,
  rtu_pad_retire2_pc,
  sm_update_dr,
  sm_update_ir,
  x_dbg_ack_pc,
  x_enter_dbg_req_i,
  x_enter_dbg_req_o,
  x_exit_dbg_req_i,
  x_exit_dbg_req_o,
  x_had_dbg_mask,
  x_regs_serial_data
);

// &Ports; @3
input   [63 :0]  ir_corex_wdata; 
input   [39 :0]  pad_biu_acaddr; 
input   [2  :0]  pad_biu_acprot; 
input   [3  :0]  pad_biu_acsnoop; 
input            pad_biu_acvalid; 
input            pad_biu_arready; 
input            pad_biu_awready; 
input   [4  :0]  pad_biu_bid; 
input   [1  :0]  pad_biu_bresp; 
input            pad_biu_bvalid; 
input            pad_biu_cdready; 
input            pad_biu_crready; 
input            pad_biu_csr_cmplt; 
input   [127:0]  pad_biu_csr_rdata; 
input            pad_biu_dbgrq_b; 
input   [3  :0]  pad_biu_hpcp_l2of_int; 
input            pad_biu_me_int; 
input            pad_biu_ms_int; 
input            pad_biu_mt_int; 
input   [127:0]  pad_biu_rdata; 
input   [4  :0]  pad_biu_rid; 
input            pad_biu_rlast; 
input   [3  :0]  pad_biu_rresp; 
input            pad_biu_rvalid; 
input            pad_biu_se_int; 
input            pad_biu_ss_int; 
input            pad_biu_st_int; 
input            pad_biu_wns_awready; 
input            pad_biu_wns_wready; 
input            pad_biu_wready; 
input            pad_biu_ws_awready; 
input            pad_biu_ws_wready; 
input   [2  :0]  pad_core_hartid; 
input            pad_core_rst_b; 
input   [39 :0]  pad_core_rvba; 
input            pad_cpu_rst_b; 
input   [39 :0]  pad_xx_apb_base; 
input   [63 :0]  pad_xx_time; 
input            pad_yy_icg_scan_en; 
input            pad_yy_mbist_mode; 
input            pad_yy_scan_mode; 
input            pad_yy_scan_rst_b; 
input            pll_core_clk; 
input            sm_update_dr; 
input            sm_update_ir; 
input            x_enter_dbg_req_i; 
input            x_exit_dbg_req_i; 
input            x_had_dbg_mask; 
output           biu_pad_acready; 
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
output  [127:0]  biu_pad_cddata; 
output           biu_pad_cderr; 
output           biu_pad_cdlast; 
output           biu_pad_cdvalid; 
output  [3  :0]  biu_pad_cnt_en; 
output  [4  :0]  biu_pad_crresp; 
output           biu_pad_crvalid; 
output           biu_pad_csr_sel; 
output  [79 :0]  biu_pad_csr_wdata; 
output           biu_pad_jdb_pm; 
output           biu_pad_lpmd_b; 
output           biu_pad_rack; 
output           biu_pad_rready; 
output  [127:0]  biu_pad_wdata; 
output           biu_pad_werr; 
output           biu_pad_wlast; 
output           biu_pad_wns; 
output  [15 :0]  biu_pad_wstrb; 
output           biu_pad_wvalid; 
output  [63 :0]  cp0_pad_mstatus; 
output           rtu_cpu_no_retire; 
output           rtu_pad_retire0; 
output  [39 :0]  rtu_pad_retire0_pc; 
output           rtu_pad_retire1; 
output  [39 :0]  rtu_pad_retire1_pc; 
output           rtu_pad_retire2; 
output  [39 :0]  rtu_pad_retire2_pc; 
output           x_dbg_ack_pc; 
output           x_enter_dbg_req_o; 
output           x_exit_dbg_req_o; 
output  [63 :0]  x_regs_serial_data; 


parameter AXWIDTH = 71;
parameter WWIDTH  = 147;
parameter CRWIDTH = 5;
parameter CDWIDTH = 130;
parameter RWIDTH  = 138;
parameter ACWIDTH = 47;
parameter BWIDTH  = 7;

// &Force("output", "sync_biu_pad_arvalid");  @14
// &Force("output", "sync_biu_pad_awvalid"); @15
// &Force("output", "sync_biu_pad_wvalid"); @16
// &Force("output", "sync_biu_pad_crvalid"); @17
// &Force("output", "sync_biu_pad_cdvalid");  @18
// &Force("output", "sync_biu_pad_rack");  @19
// &Force("output", "sync_biu_pad_back");  @20
// &Force("output", "sync_biu_pad_arbus");    &Force("bus", "sync_biu_pad_arbus", AXWIDTH,0);  @22
// &Force("output", "sync_biu_pad_arbus");    &Force("bus", "sync_biu_pad_arbus", AXWIDTH-1,0);  @24
// &Force("output", "sync_biu_pad_awbus");    &Force("bus", "sync_biu_pad_awbus", AXWIDTH-1,0); @26
// &Force("output", "sync_biu_pad_wbus");     &Force("bus", "sync_biu_pad_wbus",  WWIDTH-1,0); @27
// &Force("output", "sync_biu_pad_crbus");    &Force("bus", "sync_biu_pad_crbus", CRWIDTH-1,0); @28
// &Force("output", "sync_biu_pad_cdbus");    &Force("bus", "sync_biu_pad_cdbus", CDWIDTH-1,0); @29
// &Force("input", "sync_pad_biu_rvalid"); @31
// &Force("input", "sync_pad_biu_bvalid"); @32
// &Force("input", "sync_pad_biu_acvalid"); @33
// &Force("input", "sync_pad_biu_rbus");       &Force("bus", "sync_pad_biu_rbus",  RWIDTH-1,0);  @34
// &Force("input", "sync_pad_biu_acbus");      &Force("bus", "sync_pad_biu_acbus", ACWIDTH-1,0); @35
// &Force("input", "sync_pad_biu_bbus");       &Force("bus", "sync_pad_biu_bbus",  BWIDTH-1,0); @36
// &Force("input", "sync_pad_biu_cdready");  @38
// &Force("input", "sync_pad_biu_crready"); @39
// &Force("input", "sync_pad_biu_arready"); @40
// &Force("input", "sync_pad_biu_awready"); @41
// &Force("input", "sync_pad_biu_wready"); @42
// &Force("input",  "sync_pad_biu_wns_awready"); @43
// &Force("input",  "sync_pad_biu_wns_wready"); @44
// &Force("input",  "sync_pad_biu_ws_awready"); @45
// &Force("input",  "sync_pad_biu_ws_wready"); @46
// &Force("output", "sync_biu_pad_acready");  @47
// &Force("output", "sync_biu_pad_rready");  @48
// &Force("output", "sync_biu_pad_bready");  @49
// &Force("input",  "async_pad_biu_ar_rptr_gray");  &Force("bus", "async_pad_biu_ar_rptr_gray", 2,0); @51
// &Force("output", "async_biu_pad_ar_wptr_gray");  &Force("bus", "async_biu_pad_ar_wptr_gray",2,0); @52
// &Force("output", "async_biu_pad_arbus_0");       &Force("bus", "async_biu_pad_arbus_0", AXWIDTH,0);  @54
// &Force("output", "async_biu_pad_arbus_1");       &Force("bus", "async_biu_pad_arbus_1", AXWIDTH,0); @55
// &Force("output", "async_biu_pad_arbus_2");       &Force("bus", "async_biu_pad_arbus_2", AXWIDTH,0); @56
// &Force("output", "async_biu_pad_arbus_3");       &Force("bus", "async_biu_pad_arbus_3", AXWIDTH,0); @57
// &Force("output", "async_biu_pad_arbus_0");       &Force("bus", "async_biu_pad_arbus_0", AXWIDTH-1,0);  @59
// &Force("output", "async_biu_pad_arbus_1");       &Force("bus", "async_biu_pad_arbus_1", AXWIDTH-1,0); @60
// &Force("output", "async_biu_pad_arbus_2");       &Force("bus", "async_biu_pad_arbus_2", AXWIDTH-1,0); @61
// &Force("output", "async_biu_pad_arbus_3");       &Force("bus", "async_biu_pad_arbus_3", AXWIDTH-1,0); @62
// &Force("input",  "async_pad_biu_rbus_0");        &Force("bus", "async_pad_biu_rbus_0", RWIDTH-1,0); @64
// &Force("input",  "async_pad_biu_rbus_1");        &Force("bus", "async_pad_biu_rbus_1", RWIDTH-1,0); @65
// &Force("input",  "async_pad_biu_rbus_2");        &Force("bus", "async_pad_biu_rbus_2", RWIDTH-1,0); @66
// &Force("input",  "async_pad_biu_rbus_3");        &Force("bus", "async_pad_biu_rbus_3", RWIDTH-1,0);  @67
// &Force("input",  "async_pad_biu_r_wptr_gray");   &Force("bus", "async_pad_biu_r_wptr_gray", 2,0);   @68
// &Force("output", "async_biu_pad_r_rptr_gray");   &Force("bus", "async_biu_pad_r_rptr_gray", 2,0); @69
// &Force("input",  "async_pad_biu_wns_aw_rptr_gray");  @71
// &Force("output", "async_biu_pad_wns_aw_wptr_gray");  @72
// &Force("output", "async_biu_pad_wns_awbus_0");      &Force("bus", "async_biu_pad_wns_awbus_0",AXWIDTH-1,0); @73
// &Force("input",  "async_pad_biu_ws_aw_rptr_gray");   @75
// &Force("output", "async_biu_pad_ws_aw_wptr_gray");   @76
// &Force("output", "async_biu_pad_ws_awbus_0");       &Force("bus", "async_biu_pad_ws_awbus_0",AXWIDTH-1,0);  @77
// &Force("input",  "async_pad_biu_wns_w_rptr_gray");  &Force("bus", "async_pad_biu_wns_w_rptr_gray", 2,0);  @79
// &Force("output", "async_biu_pad_wns_w_wptr_gray");  &Force("bus", "async_biu_pad_wns_w_wptr_gray", 2,0);  @80
// &Force("output", "async_biu_pad_wns_wbus_0");       &Force("bus", "async_biu_pad_wns_wbus_0",WWIDTH-1,0); @81
// &Force("output", "async_biu_pad_wns_wbus_1");       &Force("bus", "async_biu_pad_wns_wbus_1",WWIDTH-1,0); @82
// &Force("output", "async_biu_pad_wns_wbus_2");       &Force("bus", "async_biu_pad_wns_wbus_2",WWIDTH-1,0); @83
// &Force("output", "async_biu_pad_wns_wbus_3");       &Force("bus", "async_biu_pad_wns_wbus_3",WWIDTH-1,0); @84
// &Force("input",  "async_pad_biu_ws_w_rptr_gray");  &Force("bus", "async_pad_biu_ws_w_rptr_gray", 2,0);  @86
// &Force("output", "async_biu_pad_ws_w_wptr_gray");  &Force("bus", "async_biu_pad_ws_w_wptr_gray", 2,0);  @87
// &Force("output", "async_biu_pad_ws_wbus_0");       &Force("bus", "async_biu_pad_ws_wbus_0",WWIDTH-1,0); @88
// &Force("output", "async_biu_pad_ws_wbus_1");       &Force("bus", "async_biu_pad_ws_wbus_1",WWIDTH-1,0); @89
// &Force("output", "async_biu_pad_ws_wbus_2");       &Force("bus", "async_biu_pad_ws_wbus_2",WWIDTH-1,0); @90
// &Force("output", "async_biu_pad_ws_wbus_3");       &Force("bus", "async_biu_pad_ws_wbus_3",WWIDTH-1,0); @91
// &Force("output","async_biu_pad_b_rptr_gray");      &Force("bus", "async_biu_pad_b_rptr_gray",2,0); @93
// &Force("input", "async_pad_biu_b_wptr_gray");      &Force("bus", "async_pad_biu_b_wptr_gray",2,0)       @94
// &Force("input", "async_pad_biu_bbus_0");           &Force("bus", "async_pad_biu_bbus_0",BWIDTH-1,0);   @95
// &Force("input", "async_pad_biu_bbus_1");           &Force("bus", "async_pad_biu_bbus_1",BWIDTH-1,0);  @96
// &Force("input", "async_pad_biu_bbus_2");           &Force("bus", "async_pad_biu_bbus_2",BWIDTH-1,0);  @97
// &Force("input", "async_pad_biu_bbus_3");           &Force("bus", "async_pad_biu_bbus_3",BWIDTH-1,0);  @98
// &Force("output","async_biu_pad_ac_rptr_gray");     &Force("bus", "async_biu_pad_ac_rptr_gray",2,0); @100
// &Force("input", "async_pad_biu_ac_wptr_gray");     &Force("bus", "async_pad_biu_ac_wptr_gray",2,0)       @101
// &Force("input", "async_pad_biu_acbus_0");          &Force("bus", "async_pad_biu_acbus_0",ACWIDTH-1,0);   @102
// &Force("input", "async_pad_biu_acbus_1");          &Force("bus", "async_pad_biu_acbus_1",ACWIDTH-1,0);  @103
// &Force("input", "async_pad_biu_acbus_2");          &Force("bus", "async_pad_biu_acbus_2",ACWIDTH-1,0);  @104
// &Force("input", "async_pad_biu_acbus_3");          &Force("bus", "async_pad_biu_acbus_3",ACWIDTH-1,0);  @105
// &Force("input",  "async_pad_biu_cr_rptr_gray");  &Force("bus", "async_pad_biu_cr_rptr_gray",2,0); @108
// &Force("output", "async_biu_pad_cr_wptr_gray");  &Force("bus", "async_biu_pad_cr_wptr_gray",2,0); @109
// &Force("output", "async_biu_pad_crbus_0");       &Force("bus", "async_biu_pad_crbus_0", CRWIDTH-1,0);  @110
// &Force("output", "async_biu_pad_crbus_1");       &Force("bus", "async_biu_pad_crbus_1", CRWIDTH-1,0); @111
// &Force("output", "async_biu_pad_crbus_2");       &Force("bus", "async_biu_pad_crbus_2", CRWIDTH-1,0); @112
// &Force("output", "async_biu_pad_crbus_3");       &Force("bus", "async_biu_pad_crbus_3", CRWIDTH-1,0); @113
// &Force("input",  "async_pad_biu_cd_rptr_gray");  &Force("bus", "async_pad_biu_cd_rptr_gray",2,0); @115
// &Force("output", "async_biu_pad_cd_wptr_gray");  &Force("bus", "async_biu_pad_cd_wptr_gray",2,0); @116
// &Force("output", "async_biu_pad_cdbus_0");       &Force("bus", "async_biu_pad_cdbus_0", CDWIDTH-1,0);  @117
// &Force("output", "async_biu_pad_cdbus_1");       &Force("bus", "async_biu_pad_cdbus_1", CDWIDTH-1,0); @118
// &Force("output", "async_biu_pad_cdbus_2");       &Force("bus", "async_biu_pad_cdbus_2", CDWIDTH-1,0); @119
// &Force("output", "async_biu_pad_cdbus_3");       &Force("bus", "async_biu_pad_cdbus_3", CDWIDTH-1,0); @120
// &Force("input",  "async_pad_biu_rack_rptr_gray");  &Force("bus", "async_pad_biu_rack_rptr_gray",2,0); @122
// &Force("output", "async_biu_pad_rack_wptr_gray");  &Force("bus", "async_biu_pad_rack_wptr_gray",2,0); @123
// &Force("input",  "async_pad_biu_back_rptr_gray");  &Force("bus", "async_pad_biu_back_rptr_gray",2,0); @125
// &Force("output", "async_biu_pad_back_wptr_gray");  &Force("bus", "async_biu_pad_back_wptr_gray",2,0); @126
// &Force("output", "biu_pad_arvalid");                 @128
// &Force("output", "biu_pad_araddr");                 &Force("bus","biu_pad_araddr",39,0);             @129
// &Force("output", "biu_pad_arburst");                &Force("bus","biu_pad_arburst",1,0);             @130
// &Force("output", "biu_pad_arcache");                &Force("bus","biu_pad_arcache",3,0); @131
// &Force("output", "biu_pad_arid");                   &Force("bus","biu_pad_arid",4,0); @132
// &Force("output", "biu_pad_arlen");                  &Force("bus","biu_pad_arlen",1,0); @133
// &Force("output", "biu_pad_arlock");                  @134
// &Force("output", "biu_pad_arprot");                 &Force("bus","biu_pad_arprot",2,0); @135
// &Force("output", "biu_pad_arsize");                 &Force("bus","biu_pad_arsize",2,0); @136
// &Force("output", "biu_pad_arbar");                  &Force("bus","biu_pad_arbar",1,0); @137
// &Force("output", "biu_pad_ardomain");               &Force("bus","biu_pad_ardomain",1,0); @138
// &Force("output", "biu_pad_arsnoop");                &Force("bus","biu_pad_arsnoop",3,0); @139
// &Force("output", "biu_pad_aruser");                 &Force("bus","biu_pad_aruser",2,0); @140
// &Force("input",  "pad_biu_arready");                 @141
// &Force("output", "biu_pad_ref_pfu_ar_sel");  @143

// &Force("input",  "pad_biu_rvalid");                  @146
// &Force("input",  "pad_biu_rdata");                  &Force("bus","pad_biu_rdata",127,0);    @147
// &Force("input",  "pad_biu_rresp");                  &Force("bus","pad_biu_rresp",3,0);   @148
// &Force("input",  "pad_biu_rid");                    &Force("bus","pad_biu_rid",4,0);                  @149
// &Force("input",  "pad_biu_rlast");                                      @150
// &Force("output", "biu_pad_rready");                  @151

// &Force("output", "biu_pad_awvalid");                 @153
// &Force("output", "biu_pad_awaddr");                 &Force("bus","biu_pad_awaddr",39,0); @154
// &Force("output", "biu_pad_awburst");                &Force("bus","biu_pad_awburst",1,0); @155
// &Force("output", "biu_pad_awcache");                &Force("bus","biu_pad_awcache",3,0); @156
// &Force("output", "biu_pad_awid");                   &Force("bus","biu_pad_awid",4,0); @157
// &Force("output", "biu_pad_awlen");                  &Force("bus","biu_pad_awlen",1,0); @158
// &Force("output", "biu_pad_awlock");                  @159
// &Force("output", "biu_pad_awprot");                 &Force("bus","biu_pad_awprot",2,0); @160
// &Force("output", "biu_pad_awsize");                 &Force("bus","biu_pad_awsize",2,0); @161
// &Force("output", "biu_pad_awbar");                  &Force("bus","biu_pad_awbar",1,0); @162
// &Force("output", "biu_pad_awdomain");               &Force("bus","biu_pad_awdomain",1,0); @163
// &Force("output", "biu_pad_awsnoop");                &Force("bus","biu_pad_awsnoop",2,0); @164
// &Force("output", "biu_pad_awuser");                  @165
// &Force("output", "biu_pad_awunique");                  @166
// &Force("input",  "pad_biu_awready");                 @167
// &Force("input",  "pad_biu_wns_awready");                 @168
// &Force("input",  "pad_biu_ws_awready");                 @169

// &Force("output", "biu_pad_wvalid");    @171
// &Force("output", "biu_pad_wdata");                  &Force("bus","biu_pad_wdata",127,0); @172
// &Force("output", "biu_pad_wlast");                   @173
// &Force("output", "biu_pad_werr");                   @174
// &Force("output", "biu_pad_wns");                   @175
// &Force("output", "biu_pad_wstrb");                  &Force("bus","biu_pad_wstrb",15,0); @176
// &Force("input",  "pad_biu_wready"); @177
// &Force("input",  "pad_biu_wns_wready");                 @178
// &Force("input",  "pad_biu_ws_wready");                 @179
              
// &Force("input",  "pad_biu_bvalid");                  @181
// &Force("input",  "pad_biu_bid");                    &Force("bus","pad_biu_bid",4,0); @182
// &Force("input",  "pad_biu_bresp");                  &Force("bus","pad_biu_bresp", 1,0); @183
// &Force("output", "biu_pad_bready");                              @184

// &Force("input",  "pad_biu_acvalid"); @186
// &Force("input",  "pad_biu_acaddr");                 &Force("bus","pad_biu_acaddr",39,0); @187
// &Force("input",  "pad_biu_acprot");                 &Force("bus","pad_biu_acprot",2,0); @188
// &Force("input",  "pad_biu_acsnoop");                &Force("bus","pad_biu_acsnoop",3,0); @189
// &Force("output", "biu_pad_acready"); @190

// &Force("output", "biu_pad_crvalid"); @192
// &Force("output", "biu_pad_crresp");                 &Force("bus","biu_pad_crresp",4,0); @193
// &Force("input",  "pad_biu_crready"); @194

// &Force("output", "biu_pad_cdvalid");  @196
// &Force("output", "biu_pad_cddata");                 &Force("bus","biu_pad_cddata",127,0); @197
// &Force("output", "biu_pad_cdlast");  @198
// &Force("output", "biu_pad_cderr");  @199
// &Force("input",  "pad_biu_cdready"); @200

// &Force("output", "biu_pad_rack");  @202
// &Force("output", "biu_pad_back");  @203

// &Force("output", "biu_pad_csr_sel"); @206
// &Force("output", "biu_pad_csr_wdata");  &Force("bus", "biu_pad_csr_wdata", 79,0); @207
// &Force("input",  "pad_biu_csr_cmplt"); @208
// &Force("input",  "pad_biu_csr_rdata");  &Force("bus", "pad_biu_csr_rdata",127,0); @209

// &Force("output", "biu_pad_cnt_en");     &Force("bus", "biu_pad_cnt_en",3,0); @211
// &Force("output", "biu_pad_jdb_pm"); @212
// &Force("output", "biu_pad_lpmd_b"); @213

// &Force("input", "pad_biu_hpcp_l2of_int"); &Force("bus", "pad_biu_hpcp_l2of_int",3,0); @215
// &Force("input", "pad_biu_dbgrq_b"); @216
// &Force("input", "pad_biu_me_int");  @217
// &Force("input", "pad_biu_ms_int"); @218
// &Force("input", "pad_biu_mt_int"); @219
// &Force("input", "pad_biu_se_int"); @220
// &Force("input", "pad_biu_ss_int"); @221
// &Force("input", "pad_biu_st_int"); @222

// &Force("input", "pll_core_clk"); @224
// &Force("input", "pad_cpu_rst_b"); @225
// &Force("input", "pad_core_rst_b"); @226
// &Force("input", "pad_core_hartid");      &Force("bus", "pad_core_hartid",2,0); @227
// &Force("input", "pad_core_rvba");        &Force("bus", "pad_core_rvba",39,0); @228
// &Force("input", "pad_xx_apb_base");      &Force("bus", "pad_xx_apb_base",39,0); @229
// &Force("input", "pad_xx_time");          &Force("bus", "pad_xx_time", 63,0); @230
// &Force("input", "pad_yy_icg_scan_en"); @231
// &Force("input", "pad_yy_mbist_mode"); @232
// &Force("input", "pad_yy_scan_mode"); @233
// &Force("input", "pad_yy_scan_rst_b"); @234

// &Force("output", "rtu_pad_retire0"); @236
// &Force("output", "rtu_pad_retire0_pc");  &Force("bus", "rtu_pad_retire0_pc",39,0); @237
// &Force("output", "rtu_pad_retire1"); @238
// &Force("output", "rtu_pad_retire1_pc");  &Force("bus", "rtu_pad_retire1_pc",39,0); @239
// &Force("output", "rtu_pad_retire2"); @240
// &Force("output", "rtu_pad_retire2_pc");  &Force("bus", "rtu_pad_retire2_pc",39,0); @241
// &Force("output", "cp0_pad_mstatus");     &Force("bus","cp0_pad_mstatus",63,0); @242

//==========================================================
//                           HAD
//==========================================================
// &Force("input", "sm_update_dr"); @247
// &Force("input", "sm_update_ir"); @248
// &Force("input", "ir_corex_wdata"); &Force("bus", "ir_corex_wdata", 63, 0); @249
// &Force("output", "x_regs_serial_data"); &Force("bus", "x_regs_serial_data", 63, 0); @250

// &Force("input", "x_enter_dbg_req_i"); @252
// &Force("input", "x_exit_dbg_req_i"); @253
// &Force("output", "x_enter_dbg_req_o"); @254
// &Force("output", "x_exit_dbg_req_o"); @255
// &Force("output", "x_enter_dbg_req_i_ack"); @257
// &Force("output", "x_exit_dbg_req_i_ack"); @258
// &Force("input", "x_enter_dbg_req_o_ack"); @259
// &Force("input", "x_exit_dbg_req_o_ack"); @260

// &Force("output", "x_dbg_ack_pc"); @263
// &Force("input", "x_dbg_ack_pc_ack"); @265

// &Force("input", "x_had_dbg_mask"); @268

// &Force("input", "had_xx_ree_dbg_disable");  &Force("bus", "had_xx_ree_dbg_disable", 7, 0); @271
// &Force("input", "had_xx_tee_dbg_disable");  &Force("bus", "had_xx_tee_dbg_disable", 7, 0); @272
// &Force("output","biu_pad_tee_violation"); @273
// &Force("output","biu_pad_par_violation");   &Force("bus", "biu_pad_par_violation", 4, 0); @274

// &Force("input","mem_cfg_in");    &Force("bus", "mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @278

// &Force("input", "pad_core_sleep_in"); @282
// &Force("output","core_pad_sleep_out"); @283

// &Force("input", "pad_core_async_mode"); @287

// &Force("input",  "pad_biu_psel"); @291
// &Force("input",  "pad_biu_pwdata");          &Force("bus", "pad_biu_pwdata",74,0); @292
// &Force("output", "biu_pad_pready"); @293
// &Force("output", "biu_pad_prdata");          &Force("bus", "biu_pad_prdata",32,0); @294

// &Force("output", "idu_pad_dispatch_info"); @298
// &Force("output", "idu_pad_dispatch0_info");       &Force("bus","idu_pad_dispatch0_info",78,0); @299
// &Force("output", "idu_pad_dispatch1_info");       &Force("bus","idu_pad_dispatch1_info",78,0); @300
// &Force("output", "idu_pad_dispatch2_info");       &Force("bus","idu_pad_dispatch2_info",78,0); @301
// &Force("output", "idu_pad_dispatch3_info");       &Force("bus","idu_pad_dispatch3_info",78,0); @302
// &Force("output", "rtu_pad_flush");                 @303
// &Force("output", "rtu_pad_retire0_iid");          &Force("bus","rtu_pad_retire0_iid",6,0); @304
// &Force("output", "rtu_pad_retire1_iid");          &Force("bus","rtu_pad_retire1_iid",6,0); @305
// &Force("output", "rtu_pad_retire2_iid");          &Force("bus","rtu_pad_retire2_iid",6,0); @306
// &Force("output", "rtu_pad_wb0_vld");               @307
// &Force("output", "rtu_pad_wb0_preg");             &Force("bus","rtu_pad_wb0_preg",6,0); @308
// &Force("output", "rtu_pad_wb0_data");             &Force("bus","rtu_pad_wb0_data",63,0); @309
// &Force("output", "rtu_pad_wb0_freg_vld");             @310
// &Force("output", "rtu_pad_wb0_freg");             &Force("bus","rtu_pad_wb0_freg",6,0); @311
// &Force("output", "rtu_pad_wb0_fdata");            &Force("bus","rtu_pad_wb0_fdata",63,0); @312
// &Force("output", "rtu_pad_wb0_vreg_vld");             @313
// &Force("output", "rtu_pad_wb0_vreg");             &Force("bus","rtu_pad_wb0_vreg",6,0); @314
// &Force("output", "rtu_pad_wb0_vdata");            &Force("bus","rtu_pad_wb0_vdata",127,0); @315
// &Force("output", "rtu_pad_wb0_ereg_vld");             @316
// &Force("output", "rtu_pad_wb0_ereg");             &Force("bus","rtu_pad_wb0_ereg",4,0); @317
// &Force("output", "rtu_pad_wb0_edata");            &Force("bus","rtu_pad_wb0_edata",5,0); @318
// &Force("output", "rtu_pad_wb1_vld"); @319
// &Force("output", "rtu_pad_wb1_preg");             &Force("bus","rtu_pad_wb1_preg",6,0); @320
// &Force("output", "rtu_pad_wb1_data");             &Force("bus","rtu_pad_wb1_data",63,0); @321
// &Force("output", "rtu_pad_wb1_freg_vld");             @322
// &Force("output", "rtu_pad_wb1_freg");             &Force("bus","rtu_pad_wb1_freg",6,0); @323
// &Force("output", "rtu_pad_wb1_fdata");            &Force("bus","rtu_pad_wb1_fdata",63,0); @324
// &Force("output", "rtu_pad_wb1_vreg_vld");             @325
// &Force("output", "rtu_pad_wb1_vreg");             &Force("bus","rtu_pad_wb1_vreg",6,0); @326
// &Force("output", "rtu_pad_wb1_vdata");            &Force("bus","rtu_pad_wb1_vdata",127,0); @327
// &Force("output", "rtu_pad_wb1_ereg_vld"); @328
// &Force("output", "rtu_pad_wb1_ereg");             &Force("bus","rtu_pad_wb1_ereg",4,0); @329
// &Force("output", "rtu_pad_wb1_edata");            &Force("bus","rtu_pad_wb1_edata",5,0); @330
// &Force("output", "rtu_pad_wb2_vld"); @331
// &Force("output", "rtu_pad_wb2_preg");             &Force("bus","rtu_pad_wb2_preg",6,0); @332
// &Force("output", "rtu_pad_wb2_data");             &Force("bus","rtu_pad_wb2_data",63,0); @333
// &Force("output", "rtu_pad_wb2_freg_vld");             @334
// &Force("output", "rtu_pad_wb2_freg");             &Force("bus","rtu_pad_wb2_freg",6,0); @335
// &Force("output", "rtu_pad_wb2_fdata");            &Force("bus","rtu_pad_wb2_fdata",63,0); @336
// &Force("output", "rtu_pad_wb2_vreg_vld");             @337
// &Force("output", "rtu_pad_wb2_vreg");             &Force("bus","rtu_pad_wb2_vreg",6,0); @338
// &Force("output", "rtu_pad_wb2_vdata");            &Force("bus","rtu_pad_wb2_vdata",127,0); @339
// &Force("output", "biu_pad_ref_cache_awaddr");     &Force("bus","biu_pad_ref_cache_awaddr",39,0); @340
// &Force("output", "biu_pad_ref_cache_awsize");     &Force("bus","biu_pad_ref_cache_awsize",2,0); @341
// &Force("output", "biu_pad_ref_cache_awvalid");     @342
// &Force("output", "biu_pad_ref_cache_wdata");      &Force("bus","biu_pad_ref_cache_wdata",127,0); @343
// &Force("output", "biu_pad_ref_cache_wstrb");      &Force("bus","biu_pad_ref_cache_wstrb",15,0); @344

// &Force("output", "rtu_cpu_no_retire"); @348

// &ModuleEnd; @351
endmodule


