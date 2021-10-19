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

module cpu_sub_system_axi
///////////////////////////////////////////////////
// Ports Declarations
///////////////////////////////////////////////////
(
  axim_clk_en                              ,
  pad_biu_arready                          ,
  pad_biu_awready                          ,
  pad_biu_bid                              ,
  pad_biu_bresp                            ,
  pad_biu_bvalid                           ,
  pad_biu_rdata                            ,
  pad_biu_rid                              ,
  pad_biu_rlast                            ,
  pad_biu_rresp                            ,
  pad_biu_rvalid                           ,
  pad_biu_wready                           ,
  pad_cpu_rst_b                            ,
  pad_had_jtg_tclk                         ,
  pad_had_jtg_tdi                          ,
  pad_had_jtg_trst_b                       ,
  pad_yy_dft_clk_rst_b                     ,
  pll_cpu_clk                              ,
  biu_pad_araddr                           ,
  biu_pad_arburst                          ,
  biu_pad_arcache                          ,
  biu_pad_arid                             ,
  biu_pad_arlen                            ,
  biu_pad_arlock                           ,
  biu_pad_arprot                           ,
  biu_pad_arsize                           ,
  biu_pad_arvalid                          ,
  biu_pad_awaddr                           ,
  biu_pad_awburst                          ,
  biu_pad_awcache                          ,
  biu_pad_awid                             ,
  biu_pad_awlen                            ,
  biu_pad_awlock                           ,
  biu_pad_awprot                           ,
  biu_pad_awsize                           ,
  biu_pad_awvalid                          ,
  biu_pad_bready                           ,
  biu_pad_rready                           ,
  biu_pad_wdata                            ,
  biu_pad_wlast                            ,
  biu_pad_wstrb                            ,
  biu_pad_wvalid                           ,

  had_pad_jtg_tdo                             ,
  had_pad_jtg_tdo_en                          ,
  //-------------------
`ifdef PMU_LP_MODE_TEST
  pmu_cpu_pwr_on , 
  pmu_cpu_iso_in , 
  pmu_cpu_iso_out, 
  pmu_cpu_save   , 
  pmu_cpu_restore, 
`endif
  xx_intc_vld                                 ,
  per_clk                                     ,
  i_pad_jtg_tms                               ,
  biu_pad_wid                                 ,
  biu_pad_lpmd_b
);


///////////////////////////////////////////////////
// Input/Output Declarations 
///////////////////////////////////////////////////
input                  axim_clk_en                              ;
input                  pad_biu_arready                          ;
input                  pad_biu_awready                          ;
input      [7 : 0]     pad_biu_bid                              ;
input      [1 : 0]     pad_biu_bresp                            ;
input                  pad_biu_bvalid                           ;
input      [127 : 0]   pad_biu_rdata                            ;
input      [7 : 0]     pad_biu_rid                              ;
input                  pad_biu_rlast                            ;
input      [3 : 0]     pad_biu_rresp                            ;
input                  pad_biu_rvalid                           ;
input                  pad_biu_wready                           ;
input                  pad_cpu_rst_b                            ;
input                  pad_had_jtg_tclk                         ;
input                  pad_had_jtg_tdi                          ;
input                  pad_had_jtg_trst_b                       ;
input                  pad_yy_dft_clk_rst_b                     ;
input                  pll_cpu_clk                              ;
output     [39 : 0]    biu_pad_araddr                           ;
output     [1 : 0]     biu_pad_arburst                          ;
output     [3 : 0]     biu_pad_arcache                          ;
output     [7 : 0]     biu_pad_arid                             ;
output     [7 : 0]     biu_pad_arlen                            ;
output                 biu_pad_arlock                           ;
output     [2 : 0]     biu_pad_arprot                           ;
output     [2 : 0]     biu_pad_arsize                           ;
output                 biu_pad_arvalid                          ;
output     [39 : 0]    biu_pad_awaddr                           ;
output     [1 : 0]     biu_pad_awburst                          ;
output     [3 : 0]     biu_pad_awcache                          ;
output     [7 : 0]     biu_pad_awid                             ;
output     [7 : 0]     biu_pad_awlen                            ;
output                 biu_pad_awlock                           ;
output     [2 : 0]     biu_pad_awprot                           ;
output     [2 : 0]     biu_pad_awsize                           ;
output                 biu_pad_awvalid                          ;
output                 biu_pad_bready                           ;
output                 biu_pad_rready                           ;
output     [127 : 0]   biu_pad_wdata                            ;
output                 biu_pad_wlast                            ;
output     [15 : 0]    biu_pad_wstrb                            ;
output                 biu_pad_wvalid                           ;
output                 had_pad_jtg_tdo                          ;
output                 had_pad_jtg_tdo_en                       ;

//----------------------------------------------------------------------
`ifdef PMU_LP_MODE_TEST
input                  pmu_cpu_pwr_on ; 
input                  pmu_cpu_iso_in ; 
input                  pmu_cpu_iso_out; 
input                  pmu_cpu_save   ; 
input                  pmu_cpu_restore; 
`endif
input                  per_clk;                
input      [39 :0]     xx_intc_vld;            
input                  i_pad_jtg_tms;          
output     [7  :0]     biu_pad_wid;            
output     [1  :0]     biu_pad_lpmd_b;         

///////////////////////////////////////////////////
// Wire Declarations 
///////////////////////////////////////////////////
wire                   axim_clk_en                              ;
wire                   pad_biu_arready                          ;
wire                   pad_biu_awready                          ;
wire       [7 : 0]     pad_biu_bid                              ;
wire       [1 : 0]     pad_biu_bresp                            ;
wire                   pad_biu_bvalid                           ;
wire       [127 : 0]   pad_biu_rdata                            ;
wire       [7 : 0]     pad_biu_rid                              ;
wire                   pad_biu_rlast                            ;
wire       [3 : 0]     pad_biu_rresp                            ;
wire                   pad_biu_rvalid                           ;
wire                   pad_biu_wready                           ;
wire                   pad_cpu_rst_b                            ;
wire                   pad_had_jtg_tclk                         ;
wire                   pad_had_jtg_tdi                          ;
wire                   pad_had_jtg_tms                          ;
wire                   pad_had_jtg_trst_b                       ;
wire       [144 - 1 : 0] pad_plic_int_cfg ;
wire       [144 - 1 : 0] pad_plic_int_vld ;
wire                   pad_yy_dft_clk_rst_b                     ;
wire                   pll_cpu_clk                              ;
wire       [39 : 0]    biu_pad_araddr                           ;
wire       [1 : 0]     biu_pad_arburst                          ;
wire       [3 : 0]     biu_pad_arcache                          ;
wire       [7 : 0]     biu_pad_arid                             ;
wire       [7 : 0]     biu_pad_arlen                            ;
wire                   biu_pad_arlock                           ;
wire       [2 : 0]     biu_pad_arprot                           ;
wire       [2 : 0]     biu_pad_arsize                           ;
wire                   biu_pad_arvalid                          ;
wire       [39 : 0]    biu_pad_awaddr                           ;
wire       [1 : 0]     biu_pad_awburst                          ;
wire       [3 : 0]     biu_pad_awcache                          ;
wire       [7 : 0]     biu_pad_awid                             ;
wire       [7 : 0]     biu_pad_awlen                            ;
wire                   biu_pad_awlock                           ;
wire       [2 : 0]     biu_pad_awprot                           ;
wire       [2 : 0]     biu_pad_awsize                           ;
wire                   biu_pad_awvalid                          ;
wire                   biu_pad_bready                           ;
wire                   biu_pad_rready                           ;
wire       [127 : 0]   biu_pad_wdata                            ;
wire                   biu_pad_wlast                            ;
wire       [15 : 0]    biu_pad_wstrb                            ;
wire                   biu_pad_wvalid                           ;
wire       [1 : 0]     core0_pad_lpmd_b                         ;
wire                   had_pad_jtg_tdo                             ;
wire                   had_pad_jtg_tdo_en                          ;

//----------------------------------------------------------------------
wire     [7  : 0]     biu_pad_wid;            
wire     [63 : 0]     xx_intc_int;            
wire     [39 : 0]     xx_intc_vld;            
reg      [63 : 0]     pad_cpu_sys_cnt;

///////////////////////////////////////////////////
// Module Instantiation 
///////////////////////////////////////////////////
rv_integration_platform  x_rv_integration_platform (
    .axim_clk_en                                  (axim_clk_en                              ),
    .pad_biu_arready                              (pad_biu_arready                          ),
    .pad_biu_awready                              (pad_biu_awready                          ),
    .pad_biu_bid                                  (pad_biu_bid                              ),
    .pad_biu_bresp                                (pad_biu_bresp                            ),
    .pad_biu_bvalid                               (pad_biu_bvalid                           ),
    .pad_biu_csysreq                              (1'b0                                     ),
    .pad_biu_rdata                                (pad_biu_rdata                            ),
    .pad_biu_rid                                  (pad_biu_rid                              ),
    .pad_biu_rlast                                (pad_biu_rlast                            ),
    .pad_biu_rresp                                (pad_biu_rresp                            ),
    .pad_biu_rvalid                               (pad_biu_rvalid                           ),
    .pad_biu_wready                               (pad_biu_wready                           ),
    .pad_core0_dbg_mask                           (1'b0                                     ),
    .pad_core0_dbgrq_b                            (1'b1                                     ),
    .pad_core0_rst_b                              (pad_cpu_rst_b                            ),
    .pad_core0_hartid                             (3'h0                                     ),
    .pad_cpu_apb_base                             (`APB_BASE_ADDR                           ),
    .pad_cpu_l2cache_flush_req                    (1'b0                                     ),
    .pad_cpu_rst_b                                (pad_cpu_rst_b                            ),
    .pad_core0_rvba                               (40'b0                                    ),
    .pad_cpu_sys_cnt                              (pad_cpu_sys_cnt                          ),
    .pad_had_jtg_tclk                             (pad_had_jtg_tclk                         ),
    .pad_had_jtg_tdi                              (pad_had_jtg_tdi                          ),
    .pad_had_jtg_tms                              (pad_had_jtg_tms                          ),
    .pad_had_jtg_trst_b                           (pad_had_jtg_trst_b                       ),
    .pad_l2c_data_mbist_clk_ratio                 (3'b0                                     ),
    .pad_l2c_tag_mbist_clk_ratio                  (3'b0                                     ),
    .pad_plic_int_cfg                             (pad_plic_int_cfg                         ),
    .pad_plic_int_vld                             (pad_plic_int_vld                         ),
    .pad_yy_dft_clk_rst_b                         (pad_yy_dft_clk_rst_b                     ),
    .pad_yy_icg_scan_en                           (1'b0                                     ),
    .pad_yy_mbist_mode                            (1'b0                                     ),
    .pad_yy_scan_enable                           (1'b0                                     ),
    .pad_yy_scan_mode                             (1'b0                                     ),
    .pad_yy_scan_rst_b                            (1'b1                                     ),
    .pll_cpu_clk                                  (pll_cpu_clk                              ),
    .biu_pad_araddr                               (biu_pad_araddr                           ),
    .biu_pad_arburst                              (biu_pad_arburst                          ),
    .biu_pad_arcache                              (biu_pad_arcache                          ),
    .biu_pad_arid                                 (biu_pad_arid                             ),
    .biu_pad_arlen                                (biu_pad_arlen                            ),
    .biu_pad_arlock                               (biu_pad_arlock                           ),
    .biu_pad_arprot                               (biu_pad_arprot                           ),
    .biu_pad_arsize                               (biu_pad_arsize                           ),
    .biu_pad_arvalid                              (biu_pad_arvalid                          ),
    .biu_pad_awaddr                               (biu_pad_awaddr                           ),
    .biu_pad_awburst                              (biu_pad_awburst                          ),
    .biu_pad_awcache                              (biu_pad_awcache                          ),
    .biu_pad_awid                                 (biu_pad_awid                             ),
    .biu_pad_awlen                                (biu_pad_awlen                            ),
    .biu_pad_awlock                               (biu_pad_awlock                           ),
    .biu_pad_awprot                               (biu_pad_awprot                           ),
    .biu_pad_awsize                               (biu_pad_awsize                           ),
    .biu_pad_awvalid                              (biu_pad_awvalid                          ),
    .biu_pad_bready                               (biu_pad_bready                           ),
    .biu_pad_cactive                              (                                         ),
    .biu_pad_csysack                              (                                         ),
    .biu_pad_rready                               (biu_pad_rready                           ),
    .biu_pad_wdata                                (biu_pad_wdata                            ),
    .biu_pad_wlast                                (biu_pad_wlast                            ),
    .biu_pad_wstrb                                (biu_pad_wstrb                            ),
    .biu_pad_wvalid                               (biu_pad_wvalid                           ),
//     .core0_pad_dispatch0_info                     (                                         ),
//     .core0_pad_dispatch1_info                     (                                         ),
//     .core0_pad_dispatch2_info                     (                                         ),
//     .core0_pad_dispatch3_info                     (                                         ),
//     .core0_pad_dispatch_info                      (                                         ),
//     .core0_pad_flush                              (                                         ),
    .core0_pad_jdb_pm                             (                                         ),
    .core0_pad_lpmd_b                             (core0_pad_lpmd_b                         ),
    .core0_pad_mstatus                            (                                         ),
    .core0_pad_retire0                            (                                         ),
//    .core0_pad_retire0_iid                        (                                         ),
    .core0_pad_retire0_pc                         (                                         ),
    .core0_pad_retire1                            (                                         ),
//    .core0_pad_retire1_iid                        (                                         ),
    .core0_pad_retire1_pc                         (                                         ),
    .core0_pad_retire2                            (                                         ),
//    .core0_pad_retire2_iid                        (                                         ),
    .core0_pad_retire2_pc                         (                                         ),
//    .core0_pad_wb0_data                           (                                         ),
//    .core0_pad_wb0_edata                          (                                         ),
//    .core0_pad_wb0_ereg                           (                                         ),
//    .core0_pad_wb0_ereg_vld                       (                                         ),
//    .core0_pad_wb0_fdata                          (                                         ),
//    .core0_pad_wb0_freg                           (                                         ),
//    .core0_pad_wb0_freg_vld                       (                                         ),
//    .core0_pad_wb0_preg                           (                                         ),
//    .core0_pad_wb0_vdata                          (                                         ),
//    .core0_pad_wb0_vld                            (                                         ),
//    .core0_pad_wb0_vreg                           (                                         ),
//    .core0_pad_wb0_vreg_vld                       (                                         ),
//    .core0_pad_wb1_data                           (                                         ),
//    .core0_pad_wb1_edata                          (                                         ),
//    .core0_pad_wb1_ereg                           (                                         ),
//    .core0_pad_wb1_ereg_vld                       (                                         ),
//    .core0_pad_wb1_fdata                          (                                         ),
//    .core0_pad_wb1_freg                           (                                         ),
//    .core0_pad_wb1_freg_vld                       (                                         ),
//    .core0_pad_wb1_preg                           (                                         ),
//    .core0_pad_wb1_vdata                          (                                         ),
//    .core0_pad_wb1_vld                            (                                         ),
//    .core0_pad_wb1_vreg                           (                                         ),
//    .core0_pad_wb1_vreg_vld                       (                                         ),
//    .core0_pad_wb2_data                           (                                         ),
//    .core0_pad_wb2_fdata                          (                                         ),
//    .core0_pad_wb2_freg                           (                                         ),
//    .core0_pad_wb2_freg_vld                       (                                         ),
//    .core0_pad_wb2_preg                           (                                         ),
//    .core0_pad_wb2_vdata                          (                                         ),
//    .core0_pad_wb2_vld                            (                                         ),
//    .core0_pad_wb2_vreg                           (                                         ),
//    .core0_pad_wb2_vreg_vld                       (                                         ),

.cpu_debug_port                              (                                        ),


     //----- Core 1 -----
    .pad_core1_dbg_mask                           (1'b0                                     ),
    .pad_core1_dbgrq_b                            (1'b1                                     ),
    .pad_core1_rst_b                              (1'b0                                     ),
    .pad_core1_hartid                             (3'h1                                     ),
    .pad_core1_rvba                               (40'h0                                    ),
    .core1_pad_jdb_pm                             (                                         ),
    .core1_pad_lpmd_b                             (                                         ),
    .core1_pad_mstatus                            (                                         ),
    .core1_pad_retire0                            (                                         ),
    .core1_pad_retire0_pc                         (                                         ),
    .core1_pad_retire1                            (                                         ),
    .core1_pad_retire1_pc                         (                                         ),
    .core1_pad_retire2                            (                                         ),
    .core1_pad_retire2_pc                         (                                         ),




    .cpu_pad_l2cache_flush_done                   (                                         ),
    .cpu_pad_no_op                                (                                         ),
    .had_pad_jtg_tdo                              (had_pad_jtg_tdo                          ),
    .had_pad_jtg_tdo_en                           (had_pad_jtg_tdo_en                       )
  );


assign pad_had_jtg_tms     = i_pad_jtg_tms;
assign biu_pad_lpmd_b[1:0] = core0_pad_lpmd_b;

// system timer simple model
always@(posedge pll_cpu_clk or negedge pad_cpu_rst_b)
begin
  if (!pad_cpu_rst_b)
    pad_cpu_sys_cnt <= 64'b0;
  else
    pad_cpu_sys_cnt <= pad_cpu_sys_cnt + 1'b1;
end

// External Interrupts
// assign xx_intc_int[63:0] = {24'b0,xx_intc_vld[39:0]};
// assign pad_plic_int_vld  = {{ 144 - 40{1'b0}}, xx_intc_vld[39:0]};
assign pad_plic_int_vld[ 39 : 0] = xx_intc_vld[ 39 : 0];

assign pad_plic_int_vld[144 - 1 : 32] = 'h0;

assign pad_plic_int_cfg  = 'b0;


// for fiting AXI3 system bus 
wire [7  :0]  tmp_biu_pad_awid     ;            
wire          tmp_biu_pad_awvalid  ;
wire          tmp_biu_pad_wvalid   ;
wire          tmp_biu_pad_wlast    ; 
wire          tmp_pad_biu_awready  ;
wire          tmp_pad_biu_wready   ;

assign # 0.1  tmp_biu_pad_awid    = biu_pad_awid; 
assign # 0.1  tmp_biu_pad_awvalid = biu_pad_awvalid;
assign # 0.1  tmp_biu_pad_wvalid  = biu_pad_wvalid;
assign # 0.1  tmp_biu_pad_wlast   = biu_pad_wlast;
assign # 0.1  tmp_pad_biu_awready = pad_biu_awready;
assign # 0.1  tmp_pad_biu_wready  = pad_biu_wready;

wid_for_axi4 wid_for_axi4 (
  .biu_pad_awid         (tmp_biu_pad_awid),
  .biu_pad_awvalid      (tmp_biu_pad_awvalid), 
  .biu_pad_wvalid       (tmp_biu_pad_wvalid),
  .biu_pad_wlast        (tmp_biu_pad_wlast),
  .pad_biu_awready      (tmp_pad_biu_awready),
  .pad_biu_wready       (tmp_pad_biu_wready),
  .pad_cpu_rst_b        (pad_cpu_rst_b),
  .biu_pad_wid          (biu_pad_wid),
  .per_clk              (per_clk)
);

endmodule

