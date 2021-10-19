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

module ct_lsu_dcache_data_array(
  data_din,
  data_dout,
  data_gateclk_en,
  data_gwen_b,
  data_idx,
  data_sel_b,
  data_wen_b,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  cp0_lsu_icg_en
);
input   [31:0]  data_din;
input           data_gateclk_en;     
input           data_gwen_b;         
input   [10:0]  data_idx;            
input           data_sel_b;          
input   [3 :0]  data_wen_b;          
input           forever_cpuclk;      
input           pad_yy_icg_scan_en; 
input           cp0_lsu_icg_en;
output  [31:0]  data_dout;

wire            data_clk;            
wire            data_clk_en;
wire    [31:0]  data_din;            
wire    [31:0]  data_dout;
wire            data_gateclk_en;     
wire            data_gwen_b;         
wire    [10:0]  data_idx;            
wire            data_sel_b;          
wire    [3 :0]  data_wen_b;
wire    [31:0]  data_wen_b_all;
wire            forever_cpuclk;      
wire            pad_yy_icg_scan_en; 
wire            cp0_lsu_icg_en; 

//==========================================================
//                 Instance of Gated Cell
//==========================================================
assign data_clk_en = data_gateclk_en;
// &Instance("gated_clk_cell", "x_dcache_data_gated_clk"); @100
gated_clk_cell  x_dcache_data_gated_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (data_clk          ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (data_clk_en       ),
  .module_en          (cp0_lsu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in        (forever_cpuclk     ), @101
//          .external_en   (1'b0               ), @102
//          .global_en     (1'b1               ), @103
//          .module_en     (cp0_lsu_icg_en     ), @104
//          .local_en      (data_clk_en         ), @105
//          .clk_out       (data_clk            )); @106

//==========================================================
//              Instance dcache array
//==========================================================

// &Force("bus","data_idx","10","0"); @112
assign data_wen_b_all[31:0] = {{8{data_wen_b[3]}},
                              {8{data_wen_b[2]}},
                              {8{data_wen_b[1]}},
                              {8{data_wen_b[0]}}};

//csky vperl_off
`ifdef DCACHE_32K
ct_spsram_1024x32  x_ct_spsram_1024x32 (
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in    ),
  `endif
  .A              (data_idx[9:0] ),
  .CEN            (data_sel_b    ),
  .CLK            (data_clk      ),
  .D              (data_din      ),
  .GWEN           (data_gwen_b   ),
  .Q              (data_dout     ),
  .WEN            (data_wen_b_all)
);
`endif//DCACHE_32K

`ifdef DCACHE_64K
ct_spsram_2048x32  x_ct_spsram_2048x32 (
  `ifdef MEM_CFG_IN
  .mem_cfg_in     (mem_cfg_in    ),
  `endif
  .A              (data_idx[10:0]),
  .CEN            (data_sel_b    ),
  .CLK            (data_clk      ),
  .D              (data_din      ),
  .GWEN           (data_gwen_b   ),
  .Q              (data_dout     ),
  .WEN            (data_wen_b_all)
);
`endif//DCACHE_64K
//csky vperl_on

// &ModuleEnd; @192
endmodule


