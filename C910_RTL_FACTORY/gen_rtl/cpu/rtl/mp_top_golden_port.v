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
module mp_top_golden_port(
  axim_clk_en,
  biu_pad_araddr,
  biu_pad_arburst,
  biu_pad_arcache,
  biu_pad_arid,
  biu_pad_arlen,
  biu_pad_arlock,
  biu_pad_arprot,
  biu_pad_arsize,
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
  biu_pad_cactive,
  biu_pad_csysack,
  biu_pad_rready,
  biu_pad_wdata,
  biu_pad_wlast,
  biu_pad_wstrb,
  biu_pad_wvalid,
  core0_pad_jdb_pm,
  core0_pad_lpmd_b,
  core0_pad_mstatus,
  core0_pad_retire0,
  core0_pad_retire0_pc,
  core0_pad_retire1,
  core0_pad_retire1_pc,
  core0_pad_retire2,
  core0_pad_retire2_pc,
  core1_pad_jdb_pm,
  core1_pad_lpmd_b,
  core1_pad_mstatus,
  core1_pad_retire0,
  core1_pad_retire0_pc,
  core1_pad_retire1,
  core1_pad_retire1_pc,
  core1_pad_retire2,
  core1_pad_retire2_pc,
  cpu_debug_port,
  cpu_pad_l2cache_flush_done,
  cpu_pad_no_op,
  had_pad_jtg_tdo,
  had_pad_jtg_tdo_en,
  pad_biu_arready,
  pad_biu_awready,
  pad_biu_bid,
  pad_biu_bresp,
  pad_biu_bvalid,
  pad_biu_csysreq,
  pad_biu_rdata,
  pad_biu_rid,
  pad_biu_rlast,
  pad_biu_rresp,
  pad_biu_rvalid,
  pad_biu_wready,
  pad_core0_dbg_mask,
  pad_core0_dbgrq_b,
  pad_core0_hartid,
  pad_core0_rst_b,
  pad_core0_rvba,
  pad_core1_dbg_mask,
  pad_core1_dbgrq_b,
  pad_core1_hartid,
  pad_core1_rst_b,
  pad_core1_rvba,
  pad_cpu_apb_base,
  pad_cpu_l2cache_flush_req,
  pad_cpu_rst_b,
  pad_cpu_sys_cnt,
  pad_had_jtg_tclk,
  pad_had_jtg_tdi,
  pad_had_jtg_tms,
  pad_had_jtg_trst_b,
  pad_l2c_data_mbist_clk_ratio,
  pad_l2c_tag_mbist_clk_ratio,
  pad_plic_int_cfg,
  pad_plic_int_vld,
  pad_yy_dft_clk_rst_b,
  pad_yy_icg_scan_en,
  pad_yy_mbist_mode,
  pad_yy_scan_enable,
  pad_yy_scan_mode,
  pad_yy_scan_rst_b,
  pll_cpu_clk
);

// &Ports; @3
input            axim_clk_en; 
input            pad_biu_arready; 
input            pad_biu_awready; 
input   [7  :0]  pad_biu_bid; 
input   [1  :0]  pad_biu_bresp; 
input            pad_biu_bvalid; 
input            pad_biu_csysreq; 
input   [127:0]  pad_biu_rdata; 
input   [7  :0]  pad_biu_rid; 
input            pad_biu_rlast; 
input   [1  :0]  pad_biu_rresp; 
input            pad_biu_rvalid; 
input            pad_biu_wready; 
input            pad_core0_dbg_mask; 
input            pad_core0_dbgrq_b; 
input   [2  :0]  pad_core0_hartid; 
input            pad_core0_rst_b; 
input   [39 :0]  pad_core0_rvba; 
input            pad_core1_dbg_mask; 
input            pad_core1_dbgrq_b; 
input   [2  :0]  pad_core1_hartid; 
input            pad_core1_rst_b; 
input   [39 :0]  pad_core1_rvba; 
input   [39 :0]  pad_cpu_apb_base; 
input            pad_cpu_l2cache_flush_req; 
input            pad_cpu_rst_b; 
input   [63 :0]  pad_cpu_sys_cnt; 
input            pad_had_jtg_tclk; 
input            pad_had_jtg_tdi; 
input            pad_had_jtg_tms; 
input            pad_had_jtg_trst_b; 
input   [2  :0]  pad_l2c_data_mbist_clk_ratio; 
input   [2  :0]  pad_l2c_tag_mbist_clk_ratio; 
input   [143:0]  pad_plic_int_cfg; 
input   [143:0]  pad_plic_int_vld; 
input            pad_yy_dft_clk_rst_b; 
input            pad_yy_icg_scan_en; 
input            pad_yy_mbist_mode; 
input            pad_yy_scan_enable; 
input            pad_yy_scan_mode; 
input            pad_yy_scan_rst_b; 
input            pll_cpu_clk; 
output  [39 :0]  biu_pad_araddr; 
output  [1  :0]  biu_pad_arburst; 
output  [3  :0]  biu_pad_arcache; 
output  [7  :0]  biu_pad_arid; 
output  [7  :0]  biu_pad_arlen; 
output           biu_pad_arlock; 
output  [2  :0]  biu_pad_arprot; 
output  [2  :0]  biu_pad_arsize; 
output           biu_pad_arvalid; 
output  [39 :0]  biu_pad_awaddr; 
output  [1  :0]  biu_pad_awburst; 
output  [3  :0]  biu_pad_awcache; 
output  [7  :0]  biu_pad_awid; 
output  [7  :0]  biu_pad_awlen; 
output           biu_pad_awlock; 
output  [2  :0]  biu_pad_awprot; 
output  [2  :0]  biu_pad_awsize; 
output           biu_pad_awvalid; 
output           biu_pad_bready; 
output           biu_pad_cactive; 
output           biu_pad_csysack; 
output           biu_pad_rready; 
output  [127:0]  biu_pad_wdata; 
output           biu_pad_wlast; 
output  [15 :0]  biu_pad_wstrb; 
output           biu_pad_wvalid; 
output  [1  :0]  core0_pad_jdb_pm; 
output  [1  :0]  core0_pad_lpmd_b; 
output  [63 :0]  core0_pad_mstatus; 
output           core0_pad_retire0; 
output  [39 :0]  core0_pad_retire0_pc; 
output           core0_pad_retire1; 
output  [39 :0]  core0_pad_retire1_pc; 
output           core0_pad_retire2; 
output  [39 :0]  core0_pad_retire2_pc; 
output  [1  :0]  core1_pad_jdb_pm; 
output  [1  :0]  core1_pad_lpmd_b; 
output  [63 :0]  core1_pad_mstatus; 
output           core1_pad_retire0; 
output  [39 :0]  core1_pad_retire0_pc; 
output           core1_pad_retire1; 
output  [39 :0]  core1_pad_retire1_pc; 
output           core1_pad_retire2; 
output  [39 :0]  core1_pad_retire2_pc; 
output           cpu_debug_port; 
output           cpu_pad_l2cache_flush_done; 
output           cpu_pad_no_op; 
output           had_pad_jtg_tdo; 
output           had_pad_jtg_tdo_en; 


// &Force("input","pll_cpu_clk");                 @5
// &Force("input","axim_clk_en");                     @6
// &Force("input","pad_cpu_rst_b");                   @7
// &Force("input","pad_cpu_apb_base");                 &Force("bus","pad_cpu_apb_base",39,0); @8
// &Force("input","pad_cpu_sys_cnt");                  &Force("bus","pad_cpu_sys_cnt",63,0);             @9
// &Force("input", "pad_cpu_l2cache_flush_req"); @10
// &Force("output","cpu_pad_l2cache_flush_done"); @11

//AXI master IF
// &Force("input","pad_biu_arready");                 @14
// &Force("input","pad_biu_awready");                 @15
// &Force("input","pad_biu_bid");                      &Force("bus","pad_biu_bid",7,0); @16
// &Force("input","pad_biu_bresp");                    &Force("bus","pad_biu_bresp", 1,0); @17
// &Force("input","pad_biu_bvalid");                  @18
// &Force("input","pad_biu_csysreq");                 @19
// &Force("input","pad_biu_rdata");                    &Force("bus","pad_biu_rdata",127,0);                  @20
// &Force("input","pad_biu_rid");                      &Force("bus","pad_biu_rid",7,0);                  @21
// &Force("input","pad_biu_rlast");                                      @22
// &Force("input","pad_biu_rvalid");                  @23
// &Force("input","pad_biu_wready"); @24

// &Force("output", "biu_pad_araddr");                 &Force("bus","biu_pad_araddr",39,0);             @26
// &Force("output", "biu_pad_arburst");                &Force("bus","biu_pad_arburst",1,0);             @27
// &Force("output", "biu_pad_arcache");                &Force("bus","biu_pad_arcache",3,0); @28
// &Force("output", "biu_pad_arid");                   &Force("bus","biu_pad_arid",7,0); @29
// &Force("output", "biu_pad_arlen");                  &Force("bus","biu_pad_arlen",7,0); @30
// &Force("output", "biu_pad_arlock");                  @31
// &Force("output", "biu_pad_arprot");                 &Force("bus","biu_pad_arprot",2,0); @32
// &Force("output", "biu_pad_arsize");                 &Force("bus","biu_pad_arsize",2,0); @33
// &Force("output", "biu_pad_arvalid");                 @34
// &Force("output", "biu_pad_awaddr");                 &Force("bus","biu_pad_awaddr",39,0); @35
// &Force("output", "biu_pad_awburst");                &Force("bus","biu_pad_awburst",1,0); @36
// &Force("output", "biu_pad_awcache");                &Force("bus","biu_pad_awcache",3,0); @37
// &Force("output", "biu_pad_awid");                   &Force("bus","biu_pad_awid",7,0); @38
// &Force("output", "biu_pad_awlen");                  &Force("bus","biu_pad_awlen",7,0); @39
// &Force("output", "biu_pad_awlock");                  @40
// &Force("output", "biu_pad_awprot");                 &Force("bus","biu_pad_awprot",2,0); @41
// &Force("output", "biu_pad_awsize");                 &Force("bus","biu_pad_awsize",2,0); @42
// &Force("output", "biu_pad_awvalid");                 @43
// &Force("output", "biu_pad_bready");                  @44
// &Force("output", "biu_pad_cactive");                 @45
// &Force("output", "biu_pad_csysack");                 @46
// &Force("output", "biu_pad_rready");                  @47
// &Force("output", "biu_pad_wdata");                  &Force("bus","biu_pad_wdata",127,0); @48
// &Force("output", "biu_pad_wlast");                   @49
// &Force("output", "biu_pad_wstrb");                  &Force("bus","biu_pad_wstrb",15,0); @50
// &Force("output", "biu_pad_wvalid");                  @51
// &Force("input","pad_biu_rresp");                    &Force("bus","pad_biu_rresp",3,0);                  @53
// &Force("input", "pad_biu_acaddr");                  &Force("bus","pad_biu_acaddr",39,0); @54
// &Force("input", "pad_biu_acprot");                  &Force("bus","pad_biu_acprot",2,0); @55
// &Force("input", "pad_biu_acsnoop");                 &Force("bus","pad_biu_acsnoop",3,0); @56
// &Force("input", "pad_biu_acvalid"); @57
// &Force("input", "pad_biu_cdready"); @58
// &Force("input", "pad_biu_crready"); @59
// &Force("output", "biu_pad_acready"); @60
// &Force("output", "biu_pad_arbar");       &Force("bus","biu_pad_arbar",1,0); @61
// &Force("output", "biu_pad_ardomain");   &Force("bus","biu_pad_ardomain",1,0); @62
// &Force("output", "biu_pad_arsnoop");    &Force("bus","biu_pad_arsnoop",3,0); @63
// &Force("output", "biu_pad_awbar");      &Force("bus","biu_pad_awbar",1,0); @64
// &Force("output", "biu_pad_awdomain");   &Force("bus","biu_pad_awdomain",1,0); @65
// &Force("output", "biu_pad_awsnoop");    &Force("bus","biu_pad_awsnoop",2,0); @66
// &Force("output", "biu_pad_back"); @67
// &Force("output", "biu_pad_cddata");      &Force("bus","biu_pad_cddata",127,0); @68
// &Force("output", "biu_pad_cdlast");  @69
// &Force("output", "biu_pad_cdvalid");  @70
// &Force("output", "biu_pad_crresp");      &Force("bus","biu_pad_crresp",4,0); @71
// &Force("output", "biu_pad_crvalid"); @72
// &Force("output", "biu_pad_rack"); @73
// &Force("input","pad_biu_rresp");                    &Force("bus","pad_biu_rresp",1,0);                  @75
// &Force("input", "pad_biu_acaddr");                  &Force("bus","pad_biu_acaddr",39,0); @77
// &Force("input", "pad_biu_acprot");                  &Force("bus","pad_biu_acprot",2,0); @78
// &Force("input", "pad_biu_acsnoop");                 &Force("bus","pad_biu_acsnoop",3,0); @79
// &Force("input", "pad_biu_acvalid"); @80
// &Force("input", "pad_biu_cdready"); @81
// &Force("input", "pad_biu_crready"); @82
// &Force("output", "biu_pad_acready"); @83
// &Force("output", "biu_pad_arbar");       &Force("bus","biu_pad_arbar",1,0); @84
// &Force("output", "biu_pad_ardomain");   &Force("bus","biu_pad_ardomain",1,0); @85
// &Force("output", "biu_pad_arsnoop");    &Force("bus","biu_pad_arsnoop",3,0); @86
// &Force("output", "biu_pad_awbar");      &Force("bus","biu_pad_awbar",1,0); @87
// &Force("output", "biu_pad_awdomain");   &Force("bus","biu_pad_awdomain",1,0); @88
// &Force("output", "biu_pad_awsnoop");    &Force("bus","biu_pad_awsnoop",2,0); @89
// &Force("output", "biu_pad_back"); @90
// &Force("output", "biu_pad_cddata");      &Force("bus","biu_pad_cddata",127,0); @91
// &Force("output", "biu_pad_cdlast");  @92
// &Force("output", "biu_pad_cdvalid");  @93
// &Force("output", "biu_pad_crresp");      &Force("bus","biu_pad_crresp",4,0); @94
// &Force("output", "biu_pad_crvalid"); @95
// &Force("output", "biu_pad_rack"); @96
// &Force("input", "slvif_clk_en"); @101
// &Force("input", "pad_slvif_araddr");                 &Force("bus","pad_slvif_araddr",39,0); @102
// &Force("input", "pad_slvif_arburst");                &Force("bus","pad_slvif_arburst",1,0); @103
// &Force("input", "pad_slvif_arcache");                &Force("bus","pad_slvif_arcache",3,0); @104
// &Force("input", "pad_slvif_arid");                   &Force("bus","pad_slvif_arid",4,0); @105
// &Force("input", "pad_slvif_arlen");                  &Force("bus","pad_slvif_arlen",7,0); @106
// &Force("input", "pad_slvif_arlock"); @107
// &Force("input", "pad_slvif_arprot");                 &Force("bus","pad_slvif_arprot",2,0); @108
// &Force("input", "pad_slvif_arsize");                 &Force("bus","pad_slvif_arsize",2,0); @109
// &Force("input", "pad_slvif_arvalid"); @110
// &Force("input", "pad_slvif_awaddr");                 &Force("bus","pad_slvif_awaddr",39,0); @111
// &Force("input", "pad_slvif_awburst");                &Force("bus","pad_slvif_awburst",1,0); @112
// &Force("input", "pad_slvif_awcache");                &Force("bus","pad_slvif_awcache",3,0); @113
// &Force("input", "pad_slvif_awid");                   &Force("bus","pad_slvif_awid",4,0); @114
// &Force("input", "pad_slvif_awlen");                  &Force("bus","pad_slvif_awlen",7,0); @115
// &Force("input", "pad_slvif_awlock"); @116
// &Force("input", "pad_slvif_awprot");                 &Force("bus","pad_slvif_awprot",2,0); @117
// &Force("input", "pad_slvif_awsize");                 &Force("bus","pad_slvif_awsize",2,0); @118
// &Force("input", "pad_slvif_awvalid"); @119
// &Force("input", "pad_slvif_bready"); @120
// &Force("input", "pad_slvif_rready"); @121
// &Force("input", "pad_slvif_wdata");                  &Force("bus","pad_slvif_wdata",127,0); @122
// &Force("input", "pad_slvif_wlast"); @123
// &Force("input", "pad_slvif_wstrb");                  &Force("bus","pad_slvif_wstrb",15,0); @124
// &Force("input", "pad_slvif_wvalid"); @125
// &Force("output","slvif_pad_arready"); @127
// &Force("output","slvif_pad_awready"); @128
// &Force("output","slvif_pad_bid");                      &Force("bus","slvif_pad_bid",4,0); @129
// &Force("output","slvif_pad_bresp");                    &Force("bus","slvif_pad_bresp", 1,0); @130
// &Force("output","slvif_pad_bvalid"); @131
// &Force("output","slvif_pad_rdata");                    &Force("bus","slvif_pad_rdata",127,0); @132
// &Force("output","slvif_pad_rid");                      &Force("bus","slvif_pad_rid",4,0); @133
// &Force("output","slvif_pad_rlast"); @134
// &Force("output","slvif_pad_rresp");                    &Force("bus","slvif_pad_rresp",1,0); @135
// &Force("output","slvif_pad_rvalid"); @136
// &Force("output","slvif_pad_wready"); @137

//HAD
// &Force("input", "pad_had_jtg_tclk");                @141
// &Force("input", "pad_had_jtg_trst_b");              @142
// &Force("input", "pad_had_jtg_tdi");                 @143
// &Force("input", "pad_had_jtg_tms");               @144

// &Force("output", "had_pad_jtg_tdo");                 @146
// &Force("output", "had_pad_jtg_tdo_en");              @147

// &Force("input", "pad_cpu_tee_dbg_disable");  &Force("bus","pad_cpu_tee_dbg_disable",7,0); @150
// &Force("input", "pad_cpu_ree_dbg_disable");  &Force("bus","pad_cpu_ree_dbg_disable",7,0); @151

//mbist
// &Force("input", "pad_yy_mbist_mode");              @155
// &Force("input", "pad_yy_dft_clk_rst_b"); @156
// &Force("input", "pad_l2c_data_mbist_clk_ratio");    &Force("bus", "pad_l2c_data_mbist_clk_ratio",2,0); @157
// &Force("input", "pad_l2c_tag_mbist_clk_ratio");     &Force("bus", "pad_l2c_tag_mbist_clk_ratio",2,0); @158

//scan
// &Force("input", "pad_yy_icg_scan_en");            @161
// &Force("input", "pad_yy_scan_mode");                @162
// &Force("input", "pad_yy_scan_enable");                @163
// &Force("input", "pad_yy_scan_rst_b");                @164
// &Force("output", "cpu_pad_no_op");                   @165

// &Force("input","pad_plic_int_vld"); @168
// &Force("bus","pad_plic_int_vld",`PLIC_INT_NUM-1,0); @169
// &Force("input","pad_plic_int_cfg"); @170
// &Force("bus","pad_plic_int_cfg",`PLIC_INT_NUM-1,0); @171
// &Force("input","pad_cpu_mint_req"); @173
// &Force("bus","pad_cpu_mint_req",`HART_NUM-1,0); @174
// &Force("bus","pad_cpu_sint_req",`HART_NUM-1,0); @175
// &Force("input","pad_cpu_sint_req"); @176

// &Force("output", "cpu_debug_port");                   @180

// &Force("input", "pll_core0_clk"); @185
// &Force("input", "pad_core0_async_mode"); @186
// &Force("input", "pad_core0_dbgrq_b");               @188
// &Force("input", "pad_core0_rst_b");                 @191
// &Force("input", "pad_core0_rvba");                  &Force("bus","pad_core0_rvba",39,0); @192
// &Force("input", "pad_core0_hartid");                &Force("bus","pad_core0_hartid",2,0); @194
// &Force("input", "pad_core0_dbg_mask"); @195
// &Force("output", "core0_pad_jdb_pm");               &Force("bus","core0_pad_jdb_pm",1,0); @196
// &Force("output", "core0_pad_lpmd_b");               &Force("bus","core0_pad_lpmd_b",1,0); @197
// &Force("output", "core0_pad_retire0");               @198
// &Force("output", "core0_pad_retire0_pc");           &Force("bus","core0_pad_retire0_pc",39,0); @199
// &Force("output", "core0_pad_retire1");               @200
// &Force("output", "core0_pad_retire1_pc");           &Force("bus","core0_pad_retire1_pc",39,0); @201
// &Force("output", "core0_pad_retire2");               @202
// &Force("output", "core0_pad_retire2_pc");           &Force("bus","core0_pad_retire2_pc",39,0); @203
// &Force("output", "core0_pad_mstatus");              &Force("bus","core0_pad_mstatus",63,0); @204

// &Force("input", "pll_core1_clk"); @209
// &Force("input", "pad_core1_async_mode"); @210
// &Force("input", "pad_core1_dbgrq_b");               @212
// &Force("input", "pad_core1_rst_b");                 @215
// &Force("input", "pad_core1_rvba");                  &Force("bus","pad_core1_rvba",39,0); @216
// &Force("input", "pad_core1_hartid");                &Force("bus","pad_core1_hartid",2,0); @218
// &Force("input", "pad_core1_dbg_mask"); @219
// &Force("output", "core1_pad_jdb_pm");               &Force("bus","core1_pad_jdb_pm",1,0); @220
// &Force("output", "core1_pad_lpmd_b");               &Force("bus","core1_pad_lpmd_b",1,0); @221
// &Force("output", "core1_pad_retire0");               @222
// &Force("output", "core1_pad_retire0_pc");           &Force("bus","core1_pad_retire0_pc",39,0); @223
// &Force("output", "core1_pad_retire1");               @224
// &Force("output", "core1_pad_retire1_pc");           &Force("bus","core1_pad_retire1_pc",39,0); @225
// &Force("output", "core1_pad_retire2");               @226
// &Force("output", "core1_pad_retire2_pc");           &Force("bus","core1_pad_retire2_pc",39,0); @227
// &Force("output", "core1_pad_mstatus");              &Force("bus","core1_pad_mstatus",63,0); @228

// &Force("input", "pll_core2_clk"); @233
// &Force("input", "pad_core2_async_mode"); @234
// &Force("input", "pad_core2_dbgrq_b");               @236
// &Force("input", "pad_core2_rst_b");                 @239
// &Force("input", "pad_core2_rvba");                  &Force("bus","pad_core2_rvba",39,0); @240
// &Force("input", "pad_core2_hartid");                &Force("bus","pad_core2_hartid",2,0); @242
// &Force("input", "pad_core2_dbg_mask"); @243
// &Force("output", "core2_pad_jdb_pm");               &Force("bus","core2_pad_jdb_pm",1,0); @244
// &Force("output", "core2_pad_lpmd_b");               &Force("bus","core2_pad_lpmd_b",1,0); @245
// &Force("output", "core2_pad_retire0");               @246
// &Force("output", "core2_pad_retire0_pc");           &Force("bus","core2_pad_retire0_pc",39,0); @247
// &Force("output", "core2_pad_retire1");               @248
// &Force("output", "core2_pad_retire1_pc");           &Force("bus","core2_pad_retire1_pc",39,0); @249
// &Force("output", "core2_pad_retire2");               @250
// &Force("output", "core2_pad_retire2_pc");           &Force("bus","core2_pad_retire2_pc",39,0); @251
// &Force("output", "core2_pad_mstatus");              &Force("bus","core2_pad_mstatus",63,0); @252

// &Force("input", "pll_core3_clk"); @257
// &Force("input", "pad_core3_async_mode"); @258
// &Force("input", "pad_core3_dbgrq_b");               @260
// &Force("input", "pad_core3_rst_b");                 @263
// &Force("input", "pad_core3_rvba");                  &Force("bus","pad_core3_rvba",39,0); @264
// &Force("input", "pad_core3_hartid");                &Force("bus","pad_core3_hartid",2,0); @266
// &Force("input", "pad_core3_dbg_mask"); @267
// &Force("output", "core3_pad_jdb_pm");               &Force("bus","core3_pad_jdb_pm",1,0); @268
// &Force("output", "core3_pad_lpmd_b");               &Force("bus","core3_pad_lpmd_b",1,0); @269
// &Force("output", "core3_pad_retire0");               @270
// &Force("output", "core3_pad_retire0_pc");           &Force("bus","core3_pad_retire0_pc",39,0); @271
// &Force("output", "core3_pad_retire1");               @272
// &Force("output", "core3_pad_retire1_pc");           &Force("bus","core3_pad_retire1_pc",39,0); @273
// &Force("output", "core3_pad_retire2");               @274
// &Force("output", "core3_pad_retire2_pc");           &Force("bus","core3_pad_retire2_pc",39,0); @275
// &Force("output", "core3_pad_mstatus");              &Force("bus","core3_pad_mstatus",63,0); @276

// &Force("output","core0_pad_tee_violation"); @281
// &Force("output","core0_pad_par_violation"); &Force("bus","core0_pad_par_violation",4,0); @282
// &Force("output","core0_pad_tee_mode");    &Force("bus", "core0_pad_tee_mode", 7,0); @283
// &Force("output","core1_pad_tee_violation"); @286
// &Force("output","core1_pad_par_violation"); &Force("bus","core1_pad_par_violation",4,0); @287
// &Force("output","core1_pad_tee_mode");    &Force("bus", "core1_pad_tee_mode", 7,0); @288
// &Force("output","core2_pad_tee_violation"); @291
// &Force("output","core2_pad_par_violation"); &Force("bus","core2_pad_par_violation",4,0); @292
// &Force("output","core2_pad_tee_mode");    &Force("bus", "core2_pad_tee_mode", 7,0); @293
// &Force("output","core3_pad_tee_violation"); @296
// &Force("output","core3_pad_par_violation"); &Force("bus","core3_pad_par_violation",4,0); @297
// &Force("output","core3_pad_tee_mode");    &Force("bus", "core3_pad_tee_mode", 7,0); @298


// &Force("input","pad_cpu_mem_cfg_in");   &Force("bus","pad_cpu_mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @304
// &Force("input","pad_core0_mem_cfg_in"); &Force("bus","pad_core0_mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @306
// &Force("input","pad_core1_mem_cfg_in"); &Force("bus","pad_core1_mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @309
// &Force("input","pad_core2_mem_cfg_in"); &Force("bus","pad_core2_mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @312
// &Force("input","pad_core3_mem_cfg_in"); &Force("bus","pad_core3_mem_cfg_in",`MEM_CFG_IN_WIDTH-1,0); @315

// &Force("input",  "pad_cpu_sleep_in"); @320
// &Force("output", "cpu_pad_sleep_out"); @321
// &Force("input",  "pad_core0_iso_en"); @323
// &Force("input",  "pad_core0_sleep_in"); @324
// &Force("output", "core0_pad_sleep_out"); @325
// &Force("input", "pad_core1_iso_en"); @328
// &Force("input", "pad_core1_sleep_in"); @329
// &Force("output","core1_pad_sleep_out"); @330
// &Force("input", "pad_core2_iso_en"); @333
// &Force("input", "pad_core2_sleep_in"); @334
// &Force("output","core2_pad_sleep_out"); @335
// &Force("input", "pad_core3_iso_en"); @338
// &Force("input", "pad_core3_sleep_in"); @339
// &Force("output","core3_pad_sleep_out"); @340
//==============================================================================
//  FOR_VERIFICATION
//==============================================================================
// &Force("output", "biu_pad_verf_arid");              &Force("bus","biu_pad_verf_arid",10,0);  @347
// &Force("output", "biu_pad_verf_awid");              &Force("bus","biu_pad_verf_awid",10,0); @348
// &Force("output", "biu_pad_verf_wid");               &Force("bus","biu_pad_verf_wid",11,0); @349
// &Force("output", "biu_pad_verf_arsid");             &Force("bus","biu_pad_verf_arsid",6,0);  @350
// &Force("output", "biu_pad_verf_awsid");             &Force("bus","biu_pad_verf_awsid",6,0); @351
// &Force("output", "biu_pad_verf_wsid");              &Force("bus","biu_pad_verf_wsid",6,0); @352
// &Force("output", "ciu_l2c_axid_bank_0");            &Force("bus","ciu_l2c_axid_bank_0",10,0); @353
// &Force("output", "ciu_l2c_axid_bank_1");            &Force("bus","ciu_l2c_axid_bank_1",10,0); @354
// &Force("output", "ciu_l2c_verf_type_bank_0");       &Force("bus","ciu_l2c_verf_type_bank_0",1,0); @355
// &Force("output", "ciu_l2c_verf_type_bank_1");       &Force("bus","ciu_l2c_verf_type_bank_1",1,0); @356
// &Force("output", "snb0_verf_sab_pop_en");           &Force("bus","snb0_verf_sab_pop_en",23,0); @357
// &Force("output", "snb1_verf_sab_pop_en");           &Force("bus","snb1_verf_sab_pop_en",23,0); @358
// &Force("output","pad_ibiu0_ac_verf_bus");           &Force("bus","pad_ibiu0_ac_verf_bus",10,0); @360
// &Force("output", "ibiu0_pad_ref_cache_awaddr");     &Force("bus","ibiu0_pad_ref_cache_awaddr",39,0); @361
// &Force("output", "ibiu0_pad_ref_cache_awsize");     &Force("bus","ibiu0_pad_ref_cache_awsize",2,0); @362
// &Force("output", "ibiu0_pad_ref_cache_awvalid");     @363
// &Force("output", "ibiu0_pad_ref_cache_wdata");      &Force("bus","ibiu0_pad_ref_cache_wdata",127,0); @364
// &Force("output", "ibiu0_pad_ref_cache_wstrb");      &Force("bus","ibiu0_pad_ref_cache_wstrb",15,0); @365
// &Force("output", "ibiu0_pad_ref_pfu_ar_sel");     @366
// &Force("output","pad_ibiu1_ac_verf_bus");           &Force("bus","pad_ibiu1_ac_verf_bus",10,0); @369
// &Force("output", "ibiu1_pad_ref_cache_awaddr");     &Force("bus","ibiu1_pad_ref_cache_awaddr",39,0); @370
// &Force("output", "ibiu1_pad_ref_cache_awsize");     &Force("bus","ibiu1_pad_ref_cache_awsize",2,0); @371
// &Force("output", "ibiu1_pad_ref_cache_awvalid");  @372
// &Force("output", "ibiu1_pad_ref_cache_wdata");      &Force("bus","ibiu1_pad_ref_cache_wdata",127,0); @373
// &Force("output", "ibiu1_pad_ref_cache_wstrb");      &Force("bus","ibiu1_pad_ref_cache_wstrb",15,0); @374
// &Force("output", "ibiu1_pad_ref_pfu_ar_sel");      @375
// &Force("output","pad_ibiu2_ac_verf_bus");           &Force("bus","pad_ibiu2_ac_verf_bus",10,0); @378
// &Force("output", "ibiu2_pad_ref_cache_awaddr");     &Force("bus","ibiu2_pad_ref_cache_awaddr",39,0); @379
// &Force("output", "ibiu2_pad_ref_cache_awsize");     &Force("bus","ibiu2_pad_ref_cache_awsize",2,0); @380
// &Force("output", "ibiu2_pad_ref_cache_awvalid"); @381
// &Force("output", "ibiu2_pad_ref_cache_wdata");      &Force("bus","ibiu2_pad_ref_cache_wdata",127,0); @382
// &Force("output", "ibiu2_pad_ref_cache_wstrb");      &Force("bus","ibiu2_pad_ref_cache_wstrb",15,0); @383
// &Force("output", "ibiu2_pad_ref_pfu_ar_sel");       @384
// &Force("output","pad_ibiu3_ac_verf_bus");           &Force("bus","pad_ibiu3_ac_verf_bus",10,0); @387
// &Force("output", "ibiu3_pad_ref_cache_awaddr");     &Force("bus","ibiu3_pad_ref_cache_awaddr",39,0); @388
// &Force("output", "ibiu3_pad_ref_cache_awsize");     &Force("bus","ibiu3_pad_ref_cache_awsize",2,0); @389
// &Force("output", "ibiu3_pad_ref_cache_awvalid");  @390
// &Force("output", "ibiu3_pad_ref_cache_wdata");      &Force("bus","ibiu3_pad_ref_cache_wdata",127,0); @391
// &Force("output", "ibiu3_pad_ref_cache_wstrb");      &Force("bus","ibiu3_pad_ref_cache_wstrb",15,0); @392
// &Force("output", "ibiu3_pad_ref_pfu_ar_sel");        @393



//for ISA
// &Force("output", "core0_pad_dispatch_info"); @402
// &Force("output", "core0_pad_dispatch0_info");       &Force("bus","core0_pad_dispatch0_info",78,0); @403
// &Force("output", "core0_pad_dispatch1_info");       &Force("bus","core0_pad_dispatch1_info",78,0); @404
// &Force("output", "core0_pad_dispatch2_info");       &Force("bus","core0_pad_dispatch2_info",78,0); @405
// &Force("output", "core0_pad_dispatch3_info");       &Force("bus","core0_pad_dispatch3_info",78,0); @406
// &Force("output", "core0_pad_flush");                 @407
// &Force("output", "core0_pad_retire0_iid");          &Force("bus","core0_pad_retire0_iid",6,0); @408
// &Force("output", "core0_pad_retire1_iid");          &Force("bus","core0_pad_retire1_iid",6,0); @409
// &Force("output", "core0_pad_retire2_iid");          &Force("bus","core0_pad_retire2_iid",6,0); @410
// &Force("output", "core0_pad_wb0_vld");               @411
// &Force("output", "core0_pad_wb0_preg");             &Force("bus","core0_pad_wb0_preg",6,0); @412
// &Force("output", "core0_pad_wb0_data");             &Force("bus","core0_pad_wb0_data",63,0); @413
// &Force("output", "core0_pad_wb0_freg_vld");             @414
// &Force("output", "core0_pad_wb0_freg");             &Force("bus","core0_pad_wb0_freg",6,0); @415
// &Force("output", "core0_pad_wb0_fdata");            &Force("bus","core0_pad_wb0_fdata",63,0); @416
// &Force("output", "core0_pad_wb0_vreg_vld");             @417
// &Force("output", "core0_pad_wb0_vreg");             &Force("bus","core0_pad_wb0_vreg",6,0); @418
// &Force("output", "core0_pad_wb0_vdata");            &Force("bus","core0_pad_wb0_vdata",127,0); @419
// &Force("output", "core0_pad_wb0_ereg_vld");             @420
// &Force("output", "core0_pad_wb0_ereg");             &Force("bus","core0_pad_wb0_ereg",4,0); @421
// &Force("output", "core0_pad_wb0_edata");            &Force("bus","core0_pad_wb0_edata",5,0); @422
// &Force("output", "core0_pad_wb1_vld"); @423
// &Force("output", "core0_pad_wb1_preg");             &Force("bus","core0_pad_wb1_preg",6,0); @424
// &Force("output", "core0_pad_wb1_data");             &Force("bus","core0_pad_wb1_data",63,0); @425
// &Force("output", "core0_pad_wb1_freg_vld");             @426
// &Force("output", "core0_pad_wb1_freg");             &Force("bus","core0_pad_wb1_freg",6,0); @427
// &Force("output", "core0_pad_wb1_fdata");            &Force("bus","core0_pad_wb1_fdata",63,0); @428
// &Force("output", "core0_pad_wb1_vreg_vld");             @429
// &Force("output", "core0_pad_wb1_vreg");             &Force("bus","core0_pad_wb1_vreg",6,0); @430
// &Force("output", "core0_pad_wb1_vdata");            &Force("bus","core0_pad_wb1_vdata",127,0); @431
// &Force("output", "core0_pad_wb1_ereg_vld"); @432
// &Force("output", "core0_pad_wb1_ereg");             &Force("bus","core0_pad_wb1_ereg",4,0); @433
// &Force("output", "core0_pad_wb1_edata");            &Force("bus","core0_pad_wb1_edata",5,0); @434
// &Force("output", "core0_pad_wb2_vld"); @435
// &Force("output", "core0_pad_wb2_preg");             &Force("bus","core0_pad_wb2_preg",6,0); @436
// &Force("output", "core0_pad_wb2_data");             &Force("bus","core0_pad_wb2_data",63,0); @437
// &Force("output", "core0_pad_wb2_freg_vld");             @438
// &Force("output", "core0_pad_wb2_freg");             &Force("bus","core0_pad_wb2_freg",6,0); @439
// &Force("output", "core0_pad_wb2_fdata");            &Force("bus","core0_pad_wb2_fdata",63,0); @440
// &Force("output", "core0_pad_wb2_vreg_vld");             @441
// &Force("output", "core0_pad_wb2_vreg");             &Force("bus","core0_pad_wb2_vreg",6,0); @442
// &Force("output", "core0_pad_wb2_vdata");            &Force("bus","core0_pad_wb2_vdata",127,0); @443
// &Force("output", "core1_pad_dispatch_info"); @446
// &Force("output", "core1_pad_dispatch0_info");       &Force("bus","core1_pad_dispatch0_info",78,0); @447
// &Force("output", "core1_pad_dispatch1_info");       &Force("bus","core1_pad_dispatch1_info",78,0); @448
// &Force("output", "core1_pad_dispatch2_info");       &Force("bus","core1_pad_dispatch2_info",78,0); @449
// &Force("output", "core1_pad_dispatch3_info");       &Force("bus","core1_pad_dispatch3_info",78,0); @450
// &Force("output", "core1_pad_flush");                 @451
// &Force("output", "core1_pad_retire0_iid");          &Force("bus","core1_pad_retire0_iid",6,0); @452
// &Force("output", "core1_pad_retire1_iid");          &Force("bus","core1_pad_retire1_iid",6,0); @453
// &Force("output", "core1_pad_retire2_iid");          &Force("bus","core1_pad_retire2_iid",6,0); @454
// &Force("output", "core1_pad_wb0_vld");               @455
// &Force("output", "core1_pad_wb0_preg");             &Force("bus","core1_pad_wb0_preg",6,0); @456
// &Force("output", "core1_pad_wb0_data");             &Force("bus","core1_pad_wb0_data",63,0); @457
// &Force("output", "core1_pad_wb0_freg_vld");             @458
// &Force("output", "core1_pad_wb0_freg");             &Force("bus","core1_pad_wb0_freg",6,0); @459
// &Force("output", "core1_pad_wb0_fdata");            &Force("bus","core1_pad_wb0_fdata",63,0); @460
// &Force("output", "core1_pad_wb0_vreg_vld");             @461
// &Force("output", "core1_pad_wb0_vreg");             &Force("bus","core1_pad_wb0_vreg",6,0); @462
// &Force("output", "core1_pad_wb0_vdata");            &Force("bus","core1_pad_wb0_vdata",127,0); @463
// &Force("output", "core1_pad_wb0_ereg_vld");             @464
// &Force("output", "core1_pad_wb0_ereg");             &Force("bus","core1_pad_wb0_ereg",4,0); @465
// &Force("output", "core1_pad_wb0_edata");            &Force("bus","core1_pad_wb0_edata",5,0); @466
// &Force("output", "core1_pad_wb1_vld"); @467
// &Force("output", "core1_pad_wb1_preg");             &Force("bus","core1_pad_wb1_preg",6,0); @468
// &Force("output", "core1_pad_wb1_data");             &Force("bus","core1_pad_wb1_data",63,0); @469
// &Force("output", "core1_pad_wb1_freg_vld");             @470
// &Force("output", "core1_pad_wb1_freg");             &Force("bus","core1_pad_wb1_freg",6,0); @471
// &Force("output", "core1_pad_wb1_fdata");            &Force("bus","core1_pad_wb1_fdata",63,0); @472
// &Force("output", "core1_pad_wb1_vreg_vld");             @473
// &Force("output", "core1_pad_wb1_vreg");             &Force("bus","core1_pad_wb1_vreg",6,0); @474
// &Force("output", "core1_pad_wb1_vdata");            &Force("bus","core1_pad_wb1_vdata",127,0); @475
// &Force("output", "core1_pad_wb1_ereg_vld"); @476
// &Force("output", "core1_pad_wb1_ereg");             &Force("bus","core1_pad_wb1_ereg",4,0); @477
// &Force("output", "core1_pad_wb1_edata");            &Force("bus","core1_pad_wb1_edata",5,0); @478
// &Force("output", "core1_pad_wb2_vld"); @479
// &Force("output", "core1_pad_wb2_preg");             &Force("bus","core1_pad_wb2_preg",6,0); @480
// &Force("output", "core1_pad_wb2_data");             &Force("bus","core1_pad_wb2_data",63,0); @481
// &Force("output", "core1_pad_wb2_freg_vld");             @482
// &Force("output", "core1_pad_wb2_freg");             &Force("bus","core1_pad_wb2_freg",6,0); @483
// &Force("output", "core1_pad_wb2_fdata");            &Force("bus","core1_pad_wb2_fdata",63,0); @484
// &Force("output", "core1_pad_wb2_vreg_vld");             @485
// &Force("output", "core1_pad_wb2_vreg");             &Force("bus","core1_pad_wb2_vreg",6,0); @486
// &Force("output", "core1_pad_wb2_vdata");            &Force("bus","core1_pad_wb2_vdata",127,0); @487
// &Force("output", "core2_pad_dispatch_info"); @490
// &Force("output", "core2_pad_dispatch0_info");       &Force("bus","core2_pad_dispatch0_info",78,0); @491
// &Force("output", "core2_pad_dispatch1_info");       &Force("bus","core2_pad_dispatch1_info",78,0); @492
// &Force("output", "core2_pad_dispatch2_info");       &Force("bus","core2_pad_dispatch2_info",78,0); @493
// &Force("output", "core2_pad_dispatch3_info");       &Force("bus","core2_pad_dispatch3_info",78,0); @494
// &Force("output", "core2_pad_flush");                 @495
// &Force("output", "core2_pad_retire0_iid");          &Force("bus","core2_pad_retire0_iid",6,0); @496
// &Force("output", "core2_pad_retire1_iid");          &Force("bus","core2_pad_retire1_iid",6,0); @497
// &Force("output", "core2_pad_retire2_iid");          &Force("bus","core2_pad_retire2_iid",6,0); @498
// &Force("output", "core2_pad_wb0_vld");               @499
// &Force("output", "core2_pad_wb0_preg");             &Force("bus","core2_pad_wb0_preg",6,0); @500
// &Force("output", "core2_pad_wb0_data");             &Force("bus","core2_pad_wb0_data",63,0); @501
// &Force("output", "core2_pad_wb0_freg_vld");             @502
// &Force("output", "core2_pad_wb0_freg");             &Force("bus","core2_pad_wb0_freg",6,0); @503
// &Force("output", "core2_pad_wb0_fdata");            &Force("bus","core2_pad_wb0_fdata",63,0); @504
// &Force("output", "core2_pad_wb0_vreg_vld");             @505
// &Force("output", "core2_pad_wb0_vreg");             &Force("bus","core2_pad_wb0_vreg",6,0); @506
// &Force("output", "core2_pad_wb0_vdata");            &Force("bus","core2_pad_wb0_vdata",127,0); @507
// &Force("output", "core2_pad_wb0_ereg_vld");             @508
// &Force("output", "core2_pad_wb0_ereg");             &Force("bus","core2_pad_wb0_ereg",4,0); @509
// &Force("output", "core2_pad_wb0_edata");            &Force("bus","core2_pad_wb0_edata",5,0); @510
// &Force("output", "core2_pad_wb1_vld"); @511
// &Force("output", "core2_pad_wb1_preg");             &Force("bus","core2_pad_wb1_preg",6,0); @512
// &Force("output", "core2_pad_wb1_data");             &Force("bus","core2_pad_wb1_data",63,0); @513
// &Force("output", "core2_pad_wb1_freg_vld");             @514
// &Force("output", "core2_pad_wb1_freg");             &Force("bus","core2_pad_wb1_freg",6,0); @515
// &Force("output", "core2_pad_wb1_fdata");            &Force("bus","core2_pad_wb1_fdata",63,0); @516
// &Force("output", "core2_pad_wb1_vreg_vld");             @517
// &Force("output", "core2_pad_wb1_vreg");             &Force("bus","core2_pad_wb1_vreg",6,0); @518
// &Force("output", "core2_pad_wb1_vdata");            &Force("bus","core2_pad_wb1_vdata",127,0); @519
// &Force("output", "core2_pad_wb1_ereg_vld"); @520
// &Force("output", "core2_pad_wb1_ereg");             &Force("bus","core2_pad_wb1_ereg",4,0); @521
// &Force("output", "core2_pad_wb1_edata");            &Force("bus","core2_pad_wb1_edata",5,0); @522
// &Force("output", "core2_pad_wb2_vld"); @523
// &Force("output", "core2_pad_wb2_preg");             &Force("bus","core2_pad_wb2_preg",6,0); @524
// &Force("output", "core2_pad_wb2_data");             &Force("bus","core2_pad_wb2_data",63,0); @525
// &Force("output", "core2_pad_wb2_freg_vld");             @526
// &Force("output", "core2_pad_wb2_freg");             &Force("bus","core2_pad_wb2_freg",6,0); @527
// &Force("output", "core2_pad_wb2_fdata");            &Force("bus","core2_pad_wb2_fdata",63,0); @528
// &Force("output", "core2_pad_wb2_vreg_vld");             @529
// &Force("output", "core2_pad_wb2_vreg");             &Force("bus","core2_pad_wb2_vreg",6,0); @530
// &Force("output", "core2_pad_wb2_vdata");            &Force("bus","core2_pad_wb2_vdata",127,0); @531
// &Force("output", "core3_pad_dispatch_info"); @534
// &Force("output", "core3_pad_dispatch0_info");       &Force("bus","core3_pad_dispatch0_info",78,0); @535
// &Force("output", "core3_pad_dispatch1_info");       &Force("bus","core3_pad_dispatch1_info",78,0); @536
// &Force("output", "core3_pad_dispatch2_info");       &Force("bus","core3_pad_dispatch2_info",78,0); @537
// &Force("output", "core3_pad_dispatch3_info");       &Force("bus","core3_pad_dispatch3_info",78,0); @538
// &Force("output", "core3_pad_flush");                 @539
// &Force("output", "core3_pad_retire0_iid");          &Force("bus","core3_pad_retire0_iid",6,0); @540
// &Force("output", "core3_pad_retire1_iid");          &Force("bus","core3_pad_retire1_iid",6,0); @541
// &Force("output", "core3_pad_retire2_iid");          &Force("bus","core3_pad_retire2_iid",6,0); @542
// &Force("output", "core3_pad_wb0_vld");               @543
// &Force("output", "core3_pad_wb0_preg");             &Force("bus","core3_pad_wb0_preg",6,0); @544
// &Force("output", "core3_pad_wb0_data");             &Force("bus","core3_pad_wb0_data",63,0); @545
// &Force("output", "core3_pad_wb0_freg_vld");             @546
// &Force("output", "core3_pad_wb0_freg");             &Force("bus","core3_pad_wb0_freg",6,0); @547
// &Force("output", "core3_pad_wb0_fdata");            &Force("bus","core3_pad_wb0_fdata",63,0); @548
// &Force("output", "core3_pad_wb0_vreg_vld");             @549
// &Force("output", "core3_pad_wb0_vreg");             &Force("bus","core3_pad_wb0_vreg",6,0); @550
// &Force("output", "core3_pad_wb0_vdata");            &Force("bus","core3_pad_wb0_vdata",127,0); @551
// &Force("output", "core3_pad_wb0_ereg_vld");             @552
// &Force("output", "core3_pad_wb0_ereg");             &Force("bus","core3_pad_wb0_ereg",4,0); @553
// &Force("output", "core3_pad_wb0_edata");            &Force("bus","core3_pad_wb0_edata",5,0); @554
// &Force("output", "core3_pad_wb1_vld"); @555
// &Force("output", "core3_pad_wb1_preg");             &Force("bus","core3_pad_wb1_preg",6,0); @556
// &Force("output", "core3_pad_wb1_data");             &Force("bus","core3_pad_wb1_data",63,0); @557
// &Force("output", "core3_pad_wb1_freg_vld");             @558
// &Force("output", "core3_pad_wb1_freg");             &Force("bus","core3_pad_wb1_freg",6,0); @559
// &Force("output", "core3_pad_wb1_fdata");            &Force("bus","core3_pad_wb1_fdata",63,0); @560
// &Force("output", "core3_pad_wb1_vreg_vld");             @561
// &Force("output", "core3_pad_wb1_vreg");             &Force("bus","core3_pad_wb1_vreg",6,0); @562
// &Force("output", "core3_pad_wb1_vdata");            &Force("bus","core3_pad_wb1_vdata",127,0); @563
// &Force("output", "core3_pad_wb1_ereg_vld"); @564
// &Force("output", "core3_pad_wb1_ereg");             &Force("bus","core3_pad_wb1_ereg",4,0); @565
// &Force("output", "core3_pad_wb1_edata");            &Force("bus","core3_pad_wb1_edata",5,0); @566
// &Force("output", "core3_pad_wb2_vld"); @567
// &Force("output", "core3_pad_wb2_preg");             &Force("bus","core3_pad_wb2_preg",6,0); @568
// &Force("output", "core3_pad_wb2_data");             &Force("bus","core3_pad_wb2_data",63,0); @569
// &Force("output", "core3_pad_wb2_freg_vld");             @570
// &Force("output", "core3_pad_wb2_freg");             &Force("bus","core3_pad_wb2_freg",6,0); @571
// &Force("output", "core3_pad_wb2_fdata");            &Force("bus","core3_pad_wb2_fdata",63,0); @572
// &Force("output", "core3_pad_wb2_vreg_vld");             @573
// &Force("output", "core3_pad_wb2_vreg");             &Force("bus","core3_pad_wb2_vreg",6,0); @574
// &Force("output", "core3_pad_wb2_vdata");            &Force("bus","core3_pad_wb2_vdata",127,0); @575
// &ModuleEnd; @578
endmodule



