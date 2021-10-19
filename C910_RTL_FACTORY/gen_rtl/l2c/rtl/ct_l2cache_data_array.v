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

// &Depend("ct_spsram_1024x128.vp"); @23
// &Depend("ct_spsram_2048x128.vp"); @24
// &Depend("ct_spsram_4096x128.vp"); @25
// &Depend("ct_spsram_8192x128.vp"); @26
// &Depend("ct_spsram_16384x128.vp"); @27
// &Depend("ct_spsram_32768x128.vp"); @28
// &Depend("ct_spsram_65536x128.vp"); @29

module ct_l2cache_data_array(
  data_cen,
  data_clk,
  data_din,
  data_dout,
  data_gwen,
  data_idx,
  data_wen,
  pad_yy_icg_scan_en
);

parameter DATA_INDEX_WIDTH = `L2C_DATA_INDEX_WIDTH;

input            data_cen;            
input            data_clk;         
input   [127:0]  data_din;            
input            data_gwen;           
input   [DATA_INDEX_WIDTH-1:0]  data_idx;            
input   [127:0]  data_wen;            
input            pad_yy_icg_scan_en;
output  [127:0]  data_dout;           

wire             data_cen;            
wire             data_clk;         
wire    [127:0]  data_din;            
wire    [127:0]  data_dout;           
wire             data_gwen;           
wire    [DATA_INDEX_WIDTH-1:0]  data_idx;            
wire    [127:0]  data_wen;            
wire             pad_yy_icg_scan_en;


//csky vperl_off
//==========================================================
//              Instance dcache array
//==========================================================
`ifdef L2_CACHE_128K
ct_spsram_1024x128  x_ct_spsram_1024x128 (
`endif
`ifdef L2_CACHE_256K
ct_spsram_2048x128  x_ct_spsram_2048x128(
`endif
`ifdef L2_CACHE_512K
ct_spsram_4096x128  x_ct_spsram_4096x128(
`endif
`ifdef L2_CACHE_1M
ct_spsram_8192x128  x_ct_spsram_8192x128(
`endif
`ifdef L2_CACHE_2M
ct_spsram_16384x128  x_ct_spsram_16384x128(
  `ifndef FPGA
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  `endif
`endif
`ifdef L2_CACHE_4M
ct_spsram_32768x128  x_ct_spsram_32768x128(
  `ifndef FPGA
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  `endif
`endif
`ifdef L2_CACHE_8M
ct_spsram_65536x128  x_ct_spsram_65536x128(
  `ifndef FPGA
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en),
  `endif
`endif
`ifdef MEM_CFG_IN
  .mem_cfg_in (mem_cfg_in),
`endif
  .A         (data_idx ),
  .CEN       (data_cen ),
  .CLK       (data_clk ),
  .D         (data_din ),
  .GWEN      (data_gwen),
  .Q         (data_dout),
  .WEN       (data_wen )
);
//csky vperl_on
endmodule




