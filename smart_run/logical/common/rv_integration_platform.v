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

module rv_integration_platform
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
  pad_biu_csysreq                          ,
  pad_biu_rdata                            ,
  pad_biu_rid                              ,
  pad_biu_rlast                            ,
  pad_biu_rresp                            ,
  pad_biu_rvalid                           ,
  pad_biu_wready                           ,
  pad_core0_dbg_mask                       ,
  pad_core0_dbgrq_b                        ,
  pad_core0_rst_b                          ,
  pad_core0_hartid                         ,
  pad_cpu_apb_base                         ,
  pad_cpu_l2cache_flush_req                ,
  pad_cpu_rst_b                            ,
  pad_core0_rvba                           ,
  pad_cpu_sys_cnt                          ,
  pad_had_jtg_tclk                         ,
  pad_had_jtg_tdi                          ,
  pad_had_jtg_tms                          ,
  pad_had_jtg_trst_b                       ,
  pad_l2c_data_mbist_clk_ratio             ,
  pad_l2c_tag_mbist_clk_ratio              ,
  pad_plic_int_cfg                         ,
  pad_plic_int_vld                         ,
  pad_yy_dft_clk_rst_b                     ,
  pad_yy_icg_scan_en                       ,
  pad_yy_mbist_mode                        ,
  pad_yy_scan_enable                       ,
  pad_yy_scan_mode                         ,
  pad_yy_scan_rst_b                        ,
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
  biu_pad_cactive                          ,
  biu_pad_csysack                          ,
  biu_pad_rready                           ,
  biu_pad_wdata                            ,
  biu_pad_wlast                            ,
  biu_pad_wstrb                            ,
  biu_pad_wvalid                           ,
  core0_pad_jdb_pm                         ,
  core0_pad_lpmd_b                         ,
  core0_pad_mstatus                        ,
  core0_pad_retire0                        ,
  core0_pad_retire0_pc                     ,
  core0_pad_retire1                        ,
  core0_pad_retire1_pc                     ,
  core0_pad_retire2                        ,
  core0_pad_retire2_pc                     ,

  cpu_debug_port                           ,



  //----- Core 1 -----
  pad_core1_dbg_mask                       ,
  pad_core1_dbgrq_b                        ,
  pad_core1_rst_b                          ,
  pad_core1_hartid                         ,
  pad_core1_rvba                           ,
  core1_pad_jdb_pm                         ,
  core1_pad_lpmd_b                         ,
  core1_pad_mstatus                        ,
  core1_pad_retire0                        ,
  core1_pad_retire0_pc                     ,
  core1_pad_retire1                        ,
  core1_pad_retire1_pc                     ,
  core1_pad_retire2                        ,
  core1_pad_retire2_pc                     ,




  cpu_pad_l2cache_flush_done               ,
  cpu_pad_no_op                            ,
  had_pad_jtg_tdo                          ,
  had_pad_jtg_tdo_en
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
input                  pad_biu_csysreq                          ;
input      [127 : 0]   pad_biu_rdata                            ;
input      [7 : 0]     pad_biu_rid                              ;
input                  pad_biu_rlast                            ;
input      [3 : 0]     pad_biu_rresp                            ;
input                  pad_biu_rvalid                           ;
input                  pad_biu_wready                           ;
input                  pad_core0_dbg_mask                       ;
input                  pad_core0_dbgrq_b                        ;
input                  pad_core0_rst_b                          ;
input      [2 : 0]     pad_core0_hartid                         ;
input      [39 : 0]    pad_cpu_apb_base                         ;
input                  pad_cpu_l2cache_flush_req                ;
input                  pad_cpu_rst_b                            ;
input      [39 : 0]    pad_core0_rvba                           ;
input      [63 : 0]    pad_cpu_sys_cnt                          ;
input                  pad_had_jtg_tclk                         ;
input                  pad_had_jtg_tdi                          ;
input                  pad_had_jtg_tms                          ;
input                  pad_had_jtg_trst_b                       ;
input      [2 : 0]     pad_l2c_data_mbist_clk_ratio             ;
input      [2 : 0]     pad_l2c_tag_mbist_clk_ratio              ;
input      [144 - 1 : 0] pad_plic_int_cfg ;
input      [144 - 1 : 0] pad_plic_int_vld ;
input                  pad_yy_dft_clk_rst_b                     ;
input                  pad_yy_icg_scan_en                       ;
input                  pad_yy_mbist_mode                        ;
input                  pad_yy_scan_enable                       ;
input                  pad_yy_scan_mode                         ;
input                  pad_yy_scan_rst_b                        ;
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
output                 biu_pad_cactive                          ;
output                 biu_pad_csysack                          ;
output                 biu_pad_rready                           ;
output     [127 : 0]   biu_pad_wdata                            ;
output                 biu_pad_wlast                            ;
output     [15 : 0]    biu_pad_wstrb                            ;
output                 biu_pad_wvalid                           ;
output     [1 : 0]     core0_pad_jdb_pm                         ;
output     [1 : 0]     core0_pad_lpmd_b                         ;
output     [63 : 0]    core0_pad_mstatus                        ;
output                 core0_pad_retire0                        ;
output     [39 : 0]    core0_pad_retire0_pc                     ;
output                 core0_pad_retire1                        ;
output     [39 : 0]    core0_pad_retire1_pc                     ;
output                 core0_pad_retire2                        ;
output     [39 : 0]    core0_pad_retire2_pc                     ;
output                 cpu_pad_l2cache_flush_done               ;
output                 cpu_pad_no_op                            ;
output                 had_pad_jtg_tdo                          ;
output                 had_pad_jtg_tdo_en                       ;

output                 cpu_debug_port                           ;



//----- Core 1 -----
input                  pad_core1_dbg_mask                       ;
input                  pad_core1_dbgrq_b                        ;
input                  pad_core1_rst_b                          ;
input      [2 : 0]     pad_core1_hartid                         ;
input      [39 : 0]    pad_core1_rvba                           ;
output     [1 : 0]     core1_pad_jdb_pm                         ;
output     [1 : 0]     core1_pad_lpmd_b                         ;
output     [63 : 0]    core1_pad_mstatus                        ;
output                 core1_pad_retire0                        ;
output     [39 : 0]    core1_pad_retire0_pc                     ;
output                 core1_pad_retire1                        ;
output     [39 : 0]    core1_pad_retire1_pc                     ;
output                 core1_pad_retire2                        ;
output     [39 : 0]    core1_pad_retire2_pc                     ;




///////////////////////////////////////////////////
// Wire Declarations 
///////////////////////////////////////////////////
wire                   axim_clk_en                              ;
wire                   pad_biu_arready                          ;
wire                   pad_biu_awready                          ;
wire       [7 : 0]     pad_biu_bid                              ;
wire       [1 : 0]     pad_biu_bresp                            ;
wire                   pad_biu_bvalid                           ;
wire                   pad_biu_csysreq                          ;
wire       [127 : 0]   pad_biu_rdata                            ;
wire       [7 : 0]     pad_biu_rid                              ;
wire                   pad_biu_rlast                            ;
wire       [3 : 0]     pad_biu_rresp                            ;
wire                   pad_biu_rvalid                           ;
wire                   pad_biu_wready                           ;
wire                   pad_core0_dbg_mask                       ;
wire                   pad_core0_dbgrq_b                        ;
wire                   pad_core0_rst_b                          ;
wire       [2 : 0]     pad_core0_hartid                         ;
wire       [39 : 0]    pad_cpu_apb_base                         ;
wire                   pad_cpu_l2cache_flush_req                ;
wire                   pad_cpu_rst_b                            ;
wire       [39 : 0]    pad_core0_rvba                           ;
wire       [63 : 0]    pad_cpu_sys_cnt                          ;
wire                   pad_had_jtg_tclk                         ;
wire                   pad_had_jtg_tdi                          ;
wire                   pad_had_jtg_tms                          ;
wire                   pad_had_jtg_trst_b                       ;
wire       [2 : 0]     pad_l2c_data_mbist_clk_ratio             ;
wire       [2 : 0]     pad_l2c_tag_mbist_clk_ratio              ;
wire       [144 - 1 : 0] pad_plic_int_cfg ;
wire       [144 - 1 : 0] pad_plic_int_vld ;
wire                   pad_yy_dft_clk_rst_b                     ;
wire                   pad_yy_icg_scan_en                       ;
wire                   pad_yy_mbist_mode                        ;
wire                   pad_yy_scan_enable                       ;
wire                   pad_yy_scan_mode                         ;
wire                   pad_yy_scan_rst_b                        ;
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
wire                   biu_pad_cactive                          ;
wire                   biu_pad_csysack                          ;
wire                   biu_pad_rready                           ;
wire       [127 : 0]   biu_pad_wdata                            ;
wire                   biu_pad_wlast                            ;
wire       [15 : 0]    biu_pad_wstrb                            ;
wire                   biu_pad_wvalid                           ;
wire       [1 : 0]     core0_pad_jdb_pm                         ;
wire       [1 : 0]     core0_pad_lpmd_b                         ;
wire       [63 : 0]    core0_pad_mstatus                        ;
wire                   core0_pad_retire0                        ;
wire       [39 : 0]    core0_pad_retire0_pc                     ;
wire                   core0_pad_retire1                        ;
wire       [39 : 0]    core0_pad_retire1_pc                     ;
wire                   core0_pad_retire2                        ;
wire       [39 : 0]    core0_pad_retire2_pc                     ;
wire                   cpu_pad_l2cache_flush_done               ;
wire                   cpu_pad_no_op                            ;
wire                   had_pad_jtg_tdo                          ;
wire                   had_pad_jtg_tdo_en                       ;

wire                   cpu_debug_port                           ;



//----- Core 1 -----
wire                   pad_core1_dbg_mask                       ;
wire                   pad_core1_dbgrq_b                        ;
wire                   pad_core1_rst_b                          ;
wire       [2 : 0]     pad_core1_hartid                         ;
wire       [39 : 0]    pad_core1_rvba                           ;
wire       [1 : 0]     core1_pad_jdb_pm                         ;
wire       [1 : 0]     core1_pad_lpmd_b                         ;
wire       [63 : 0]    core1_pad_mstatus                        ;
wire                   core1_pad_retire0                        ;
wire       [39 : 0]    core1_pad_retire0_pc                     ;
wire                   core1_pad_retire1                        ;
wire       [39 : 0]    core1_pad_retire1_pc                     ;
wire                   core1_pad_retire2                        ;
wire       [39 : 0]    core1_pad_retire2_pc                     ;




///////////////////////////////////////////////////
// Module Instantiation 
///////////////////////////////////////////////////
openC910 x_cpu_top(
    .axim_clk_en                                  (axim_clk_en                              ),
    .pad_biu_arready                              (pad_biu_arready                          ),
    .pad_biu_awready                              (pad_biu_awready                          ),
    .pad_biu_bid                                  (pad_biu_bid                              ),
    .pad_biu_bresp                                (pad_biu_bresp                            ),
    .pad_biu_bvalid                               (pad_biu_bvalid                           ),
    .pad_biu_csysreq                              (pad_biu_csysreq                          ),
    .pad_biu_rdata                                (pad_biu_rdata                            ),
    .pad_biu_rid                                  (pad_biu_rid                              ),
    .pad_biu_rlast                                (pad_biu_rlast                            ),
    .pad_biu_rresp                                (pad_biu_rresp[1:0]                       ),
    .pad_biu_rvalid                               (pad_biu_rvalid                           ),
    .pad_biu_wready                               (pad_biu_wready                           ),
    .pad_core0_dbg_mask                           (pad_core0_dbg_mask                       ),
    .pad_core0_dbgrq_b                            (pad_core0_dbgrq_b                        ),
    .pad_core0_rst_b                              (pad_core0_rst_b                          ),
    .pad_core0_hartid                             (pad_core0_hartid                         ),
    .pad_cpu_apb_base                             (pad_cpu_apb_base                         ),
    .pad_cpu_l2cache_flush_req                    (pad_cpu_l2cache_flush_req                ),
    .pad_cpu_rst_b                                (pad_cpu_rst_b                            ),
    .pad_core0_rvba                               (pad_core0_rvba                           ),
    .pad_cpu_sys_cnt                              (pad_cpu_sys_cnt                          ),
    .pad_had_jtg_tclk                             (pad_had_jtg_tclk                         ),
    .pad_had_jtg_tdi                              (pad_had_jtg_tdi                          ),
    .pad_had_jtg_tms                              (pad_had_jtg_tms                          ),
    .pad_had_jtg_trst_b                           (pad_had_jtg_trst_b                       ),
    .pad_l2c_data_mbist_clk_ratio                 (pad_l2c_data_mbist_clk_ratio             ),
    .pad_l2c_tag_mbist_clk_ratio                  (pad_l2c_tag_mbist_clk_ratio              ),
    .pad_plic_int_cfg                             (pad_plic_int_cfg                         ),
    .pad_plic_int_vld                             (pad_plic_int_vld                         ),
    .pad_yy_dft_clk_rst_b                         (pad_yy_dft_clk_rst_b                     ),
    .pad_yy_icg_scan_en                           (pad_yy_icg_scan_en                       ),
    .pad_yy_mbist_mode                            (pad_yy_mbist_mode                        ),
    .pad_yy_scan_enable                           (pad_yy_scan_enable                       ),
    .pad_yy_scan_mode                             (pad_yy_scan_mode                         ),
    .pad_yy_scan_rst_b                            (pad_yy_scan_rst_b                        ),
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
    .biu_pad_cactive                              (biu_pad_cactive                          ),
    .biu_pad_csysack                              (biu_pad_csysack                          ),
    .biu_pad_rready                               (biu_pad_rready                           ),
    .biu_pad_wdata                                (biu_pad_wdata                            ),
    .biu_pad_wlast                                (biu_pad_wlast                            ),
    .biu_pad_wstrb                                (biu_pad_wstrb                            ),
    .biu_pad_wvalid                               (biu_pad_wvalid                           ),
    .core0_pad_jdb_pm                             (core0_pad_jdb_pm                         ),
    .core0_pad_lpmd_b                             (core0_pad_lpmd_b                         ),
    .core0_pad_mstatus                            (core0_pad_mstatus                        ),
    .core0_pad_retire0                            (core0_pad_retire0                        ),
    .core0_pad_retire0_pc                         (core0_pad_retire0_pc                     ),
    .core0_pad_retire1                            (core0_pad_retire1                        ),
    .core0_pad_retire1_pc                         (core0_pad_retire1_pc                     ),
    .core0_pad_retire2                            (core0_pad_retire2                        ),
    .core0_pad_retire2_pc                         (core0_pad_retire2_pc                     ),

.cpu_debug_port                               (cpu_debug_port                           ),



     //----- Core 1 -----
    .pad_core1_dbg_mask                           (pad_core1_dbg_mask                       ),
    .pad_core1_dbgrq_b                            (pad_core1_dbgrq_b                        ),
    .pad_core1_rst_b                              (pad_core1_rst_b                          ),
    .pad_core1_hartid                             (pad_core1_hartid                         ),
    .pad_core1_rvba                               (pad_core1_rvba                           ),
    .core1_pad_jdb_pm                             (core1_pad_jdb_pm                         ),
    .core1_pad_lpmd_b                             (core1_pad_lpmd_b                         ),
    .core1_pad_mstatus                            (core1_pad_mstatus                        ),
    .core1_pad_retire0                            (core1_pad_retire0                        ),
    .core1_pad_retire0_pc                         (core1_pad_retire0_pc                     ),
    .core1_pad_retire1                            (core1_pad_retire1                        ),
    .core1_pad_retire1_pc                         (core1_pad_retire1_pc                     ),
    .core1_pad_retire2                            (core1_pad_retire2                        ),
    .core1_pad_retire2_pc                         (core1_pad_retire2_pc                     ),




    .cpu_pad_l2cache_flush_done                   (cpu_pad_l2cache_flush_done               ),
    .cpu_pad_no_op                                (cpu_pad_no_op                            ),
    .had_pad_jtg_tdo                              (had_pad_jtg_tdo                          ),
    .had_pad_jtg_tdo_en                           (had_pad_jtg_tdo_en                       )
  );

endmodule
