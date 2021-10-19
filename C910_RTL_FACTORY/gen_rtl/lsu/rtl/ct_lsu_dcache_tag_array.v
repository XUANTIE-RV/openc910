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

// &Depend("ct_spsram_256x52.vp"); @26
// &Depend("ct_spsram_512x52.vp"); @27

module ct_lsu_dcache_tag_array(
  forever_cpuclk,
  pad_yy_icg_scan_en,
  tag_din,
  tag_dout,
  tag_gateclk_en,
  tag_gwen_b,
  tag_idx,
  tag_sel_b,
  tag_wen_b,
  cp0_lsu_icg_en
);
input           forever_cpuclk;      
input           pad_yy_icg_scan_en; 
input   [51:0]  tag_din;             
input           tag_gateclk_en;      
input           tag_gwen_b;          
input   [8 :0]  tag_idx;             
input           tag_sel_b;           
input   [1 :0]  tag_wen_b;
input           cp0_lsu_icg_en;           
output  [51:0]  tag_dout;            

wire            forever_cpuclk;      
wire            pad_yy_icg_scan_en; 
wire            tag_clk;             
wire            tag_clk_en;          
wire    [51:0]  tag_din;             
wire    [51:0]  tag_dout;            
wire            tag_gateclk_en;      
wire            tag_gwen_b;          
wire    [8 :0]  tag_idx;             
wire            tag_sel_b;           
wire    [1 :0]  tag_wen_b;           
wire    [51:0]  tag_wen_b_all; 
wire            cp0_lsu_icg_en;       

//==========================================================
//                 Instance of Gated Cell
//==========================================================
assign tag_clk_en = tag_gateclk_en;
// &Instance("gated_clk_cell", "x_dcache_tag_gated_clk"); @79
gated_clk_cell  x_dcache_tag_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (tag_clk           ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (tag_clk_en        ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @80
//          .external_en   (1'b0               ), @81
//          .global_en     (1'b1               ), @82
//          .module_en     (cp0_lsu_icg_en     ), @83
//          .local_en      (tag_clk_en         ), @84
//          .clk_out       (tag_clk            )); @85

//==========================================================
//              Instance dcache array
//==========================================================

// &Force("bus","tag_idx","8","0"); @91
assign tag_wen_b_all[51:0]  = {{26{tag_wen_b[1]}},
                              {26{tag_wen_b[0]}}};


//csky vperl_off
`ifdef DCACHE_32K
ct_spsram_256x52  x_ct_spsram_256x52 (
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in  ),
  `endif
  .A             (tag_idx[7:0] ),
  .CEN           (tag_sel_b    ),
  .CLK           (tag_clk      ),
  .D             (tag_din      ),
  .GWEN          (tag_gwen_b   ),
  .Q             (tag_dout     ),
  .WEN           (tag_wen_b_all)
);
`endif//DCACHE_32K

`ifdef DCACHE_64K
ct_spsram_512x52  x_ct_spsram_512x52 (
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in  ),
  `endif
  .A             (tag_idx[8:0] ),
  .CEN           (tag_sel_b    ),
  .CLK           (tag_clk      ),
  .D             (tag_din      ),
  .GWEN          (tag_gwen_b   ),
  .Q             (tag_dout     ),
  .WEN           (tag_wen_b_all)
);
`endif//DCACHE_64K
//csky vperl_on

// &ModuleEnd; @128
endmodule


