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

// &Depend("ct_spsram_128x104.vp"); @23
// &Depend("ct_spsram_256x100.vp"); @24
// &Depend("ct_spsram_512x96.vp"); @25
// &Depend("ct_spsram_64x108.vp"); @26
// &Depend("ct_spsram_1024x92.vp"); @27
// &Depend("ct_spsram_2048x88.vp"); @28
// &Depend("ct_spsram_4096x84.vp"); @29

module ct_l2cache_tag_array_16way(
  tag_cen,
  tag_clk,
  tag_din,
  tag_dout,
  tag_gwen,
  tag_idx,
  tag_wen
);

parameter TAG_DATA_WIDTH_16WAY = 16*`L2C_TAG_DATA_WIDTH;
parameter TAG_DATA_WIDTH_12WAY = 12*`L2C_TAG_DATA_WIDTH;
parameter TAG_DATA_WIDTH_8WAY  = 8*`L2C_TAG_DATA_WIDTH;
parameter TAG_DATA_WIDTH_4WAY  = 4*`L2C_TAG_DATA_WIDTH;
parameter TAG_INDEX_WIDTH      = `L2C_TAG_INDEX_WIDTH;

input                               tag_cen;             
input                               tag_clk;          
input                               tag_gwen;            
input   [TAG_INDEX_WIDTH-1     :0]  tag_idx;             
input   [TAG_DATA_WIDTH_16WAY-1:0]  tag_din;             
input   [TAG_DATA_WIDTH_16WAY-1:0]  tag_wen;             
output  [TAG_DATA_WIDTH_16WAY-1:0]  tag_dout;            

wire                                tag_cen;             
wire                                tag_clk;          
wire                                tag_gwen;            
wire    [TAG_DATA_WIDTH_16WAY-1:0]  tag_din;             
wire    [TAG_DATA_WIDTH_16WAY-1:0]  tag_dout;            
wire    [TAG_DATA_WIDTH_16WAY-1:0]  tag_wen;             
wire    [TAG_INDEX_WIDTH-1     :0]  tag_idx;             


//csky vperl_off
//==========================================================
//              Instance dcache array
//==========================================================
`ifdef L2_CACHE_128K
ct_spsram_64x108  x_ct_spsram_64x108_0 (
`endif
`ifdef L2_CACHE_256K
ct_spsram_128x104  x_ct_spsram_128x104_0 (
`endif
`ifdef L2_CACHE_512K
ct_spsram_256x100  x_ct_spsram_256x100_0 (
`endif
`ifdef L2_CACHE_1M
ct_spsram_512x96  x_ct_spsram_512x96_0 (
`endif
`ifdef L2_CACHE_2M
ct_spsram_1024x92  x_ct_spsram_1024x92_0 (
`endif
`ifdef L2_CACHE_4M
ct_spsram_2048x88  x_ct_spsram_2048x88_0 (
`endif
`ifdef L2_CACHE_8M
ct_spsram_4096x84  x_ct_spsram_4096x84_0 (
`endif
`ifdef MEM_CFG_IN
  .mem_cfg_in (mem_cfg_in),
`endif
  .A              (tag_idx                          ),
  .CEN            (tag_cen                          ),
  .CLK            (tag_clk                          ),
  .GWEN           (tag_gwen                         ),
  .D              (tag_din[TAG_DATA_WIDTH_4WAY-1:0] ),
  .Q              (tag_dout[TAG_DATA_WIDTH_4WAY-1:0]),
  .WEN            (tag_wen[TAG_DATA_WIDTH_4WAY-1:0] )
);

`ifdef L2_CACHE_128K
ct_spsram_64x108  x_ct_spsram_64x108_1 (
`endif
`ifdef L2_CACHE_256K
ct_spsram_128x104  x_ct_spsram_128x104_1 (
`endif
`ifdef L2_CACHE_512K
ct_spsram_256x100  x_ct_spsram_256x100_1 (
`endif
`ifdef L2_CACHE_1M
ct_spsram_512x96  x_ct_spsram_512x96_1 (
`endif
`ifdef L2_CACHE_2M
ct_spsram_1024x92  x_ct_spsram_1024x92_1 (
`endif
`ifdef L2_CACHE_4M
ct_spsram_2048x88  x_ct_spsram_2048x88_1 (
`endif
`ifdef L2_CACHE_8M
ct_spsram_4096x84  x_ct_spsram_4096x84_1 (
`endif
`ifdef MEM_CFG_IN
  .mem_cfg_in (mem_cfg_in),
`endif
  .A              (tag_idx                                            ),
  .CEN            (tag_cen                                            ),
  .CLK            (tag_clk                                            ),
  .GWEN           (tag_gwen                                           ),
  .D              (tag_din[TAG_DATA_WIDTH_8WAY-1:TAG_DATA_WIDTH_4WAY] ),
  .Q              (tag_dout[TAG_DATA_WIDTH_8WAY-1:TAG_DATA_WIDTH_4WAY]),
  .WEN            (tag_wen[TAG_DATA_WIDTH_8WAY-1:TAG_DATA_WIDTH_4WAY] )
);

`ifdef L2_CACHE_128K
ct_spsram_64x108  x_ct_spsram_64x108_2 (
`endif
`ifdef L2_CACHE_256K
ct_spsram_128x104  x_ct_spsram_128x104_2 (
`endif
`ifdef L2_CACHE_512K
ct_spsram_256x100  x_ct_spsram_256x100_2 (
`endif
`ifdef L2_CACHE_1M
ct_spsram_512x96  x_ct_spsram_512x96_2 (
`endif
`ifdef L2_CACHE_2M
ct_spsram_1024x92  x_ct_spsram_1024x92_2 (
`endif
`ifdef L2_CACHE_4M
ct_spsram_2048x88  x_ct_spsram_2048x88_2 (
`endif
`ifdef L2_CACHE_8M
ct_spsram_4096x84  x_ct_spsram_4096x84_2 (
`endif
`ifdef MEM_CFG_IN
  .mem_cfg_in (mem_cfg_in),
`endif
  .A              (tag_idx                                             ),
  .CEN            (tag_cen                                             ),
  .CLK            (tag_clk                                             ),
  .GWEN           (tag_gwen                                            ),
  .D              (tag_din[TAG_DATA_WIDTH_12WAY-1:TAG_DATA_WIDTH_8WAY] ),
  .Q              (tag_dout[TAG_DATA_WIDTH_12WAY-1:TAG_DATA_WIDTH_8WAY]),
  .WEN            (tag_wen[TAG_DATA_WIDTH_12WAY-1:TAG_DATA_WIDTH_8WAY] )
);

`ifdef L2_CACHE_128K
ct_spsram_64x108  x_ct_spsram_64x108_3 ( 
`endif
`ifdef L2_CACHE_256K
ct_spsram_128x104  x_ct_spsram_128x104_3 (
`endif
`ifdef L2_CACHE_512K
ct_spsram_256x100  x_ct_spsram_256x100_3 (
`endif
`ifdef L2_CACHE_1M
ct_spsram_512x96  x_ct_spsram_512x96_3 ( 
`endif
`ifdef L2_CACHE_2M
ct_spsram_1024x92  x_ct_spsram_1024x92_3 (
`endif
`ifdef L2_CACHE_4M
ct_spsram_2048x88  x_ct_spsram_2048x88_3 (
`endif
`ifdef L2_CACHE_8M
ct_spsram_4096x84  x_ct_spsram_4096x84_3 (
`endif
`ifdef MEM_CFG_IN
  .mem_cfg_in (mem_cfg_in),
`endif
  .A              (tag_idx                                              ),
  .CEN            (tag_cen                                              ),
  .CLK            (tag_clk                                              ),
  .GWEN           (tag_gwen                                             ),
  .D              (tag_din[TAG_DATA_WIDTH_16WAY-1:TAG_DATA_WIDTH_12WAY] ),
  .Q              (tag_dout[TAG_DATA_WIDTH_16WAY-1:TAG_DATA_WIDTH_12WAY]),
  .WEN            (tag_wen[TAG_DATA_WIDTH_16WAY-1:TAG_DATA_WIDTH_12WAY] )
);
//csky vperl_on
endmodule


