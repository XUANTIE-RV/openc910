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

module ct_lsu_dcache_dirty_array(
  dirty_din,
  dirty_dout,
  dirty_gateclk_en,
  dirty_gwen_b,
  dirty_idx,
  dirty_sel_b,
  dirty_wen_b,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  cp0_lsu_icg_en
);
input   [6:0]  dirty_din;
input          dirty_gateclk_en;    
input          dirty_gwen_b;        
input   [8:0]  dirty_idx;           
input          dirty_sel_b;
input   [6:0]  dirty_wen_b;
input          forever_cpuclk;      
input          pad_yy_icg_scan_en;
input          cp0_lsu_icg_en;
output  [6:0]  dirty_dout;

wire           dirty_clk;           
wire           dirty_clk_en;
wire    [6:0]  dirty_din;           
wire    [6:0]  dirty_dout;
wire           dirty_gateclk_en;    
wire           dirty_gwen_b;        
wire    [8:0]  dirty_idx;           
wire           dirty_sel_b;
wire    [6:0]  dirty_wen_b;
wire           forever_cpuclk;      
wire           pad_yy_icg_scan_en; 
wire           cp0_lsu_icg_en;  

//==========================================================
//                 Instance of Gated Cell
//==========================================================
assign dirty_clk_en = dirty_gateclk_en;
// &Instance("gated_clk_cell", "x_dcache_dirty_gated_clk"); @103
gated_clk_cell  x_dcache_dirty_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (dirty_clk         ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (dirty_clk_en      ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @104
//          .external_en   (1'b0               ), @105
//          .global_en     (1'b1               ), @106
//          .module_en     (cp0_lsu_icg_en     ), @107
//          .local_en      (dirty_clk_en         ), @108
//          .clk_out       (dirty_clk            )); @109

//==========================================================
//              Instance dcache array
//==========================================================

// &Force("bus","dirty_idx","8","0"); @115

//csky vperl_off
`ifdef DCACHE_32K
ct_spsram_256x7  x_ct_spsram_256x7 (
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in    ),
  `endif
  .A              (dirty_idx[7:0]),
  .CEN            (dirty_sel_b   ),
  .CLK            (dirty_clk     ),
  .D              (dirty_din     ),
  .GWEN           (dirty_gwen_b  ),
  .Q              (dirty_dout    ),
  .WEN            (dirty_wen_b   )
);
`endif//DCACHE_32K

`ifdef DCACHE_64K
ct_spsram_512x7  x_ct_spsram_512x7 (
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in    ),
  `endif
  .A              (dirty_idx[8:0]),
  .CEN            (dirty_sel_b   ),
  .CLK            (dirty_clk     ),
  .D              (dirty_din     ),
  .GWEN           (dirty_gwen_b  ),
  .Q              (dirty_dout    ),
  .WEN            (dirty_wen_b   )
);
`endif//DCACHE_64K
//csky vperl_on

// &ModuleEnd; @183
endmodule


