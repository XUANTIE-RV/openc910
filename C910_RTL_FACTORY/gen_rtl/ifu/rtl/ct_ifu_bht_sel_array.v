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

// &ModuleBeg; @22
module ct_ifu_bht_sel_array(
  bht_sel_array_cen_b,
  bht_sel_array_clk_en,
  bht_sel_array_din,
  bht_sel_array_gwen,
  bht_sel_array_index,
  bht_sel_bwen,
  bht_sel_data_out,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           bht_sel_array_cen_b; 
input           bht_sel_array_clk_en; 
input   [15:0]  bht_sel_array_din;   
input           bht_sel_array_gwen;  
input   [6 :0]  bht_sel_array_index; 
input   [15:0]  bht_sel_bwen;        
input           cp0_ifu_icg_en;      
input           cp0_yy_clk_en;       
input           forever_cpuclk;      
input           pad_yy_icg_scan_en;  
output  [15:0]  bht_sel_data_out;    

// &Regs; @24

// &Wires; @25
wire            bht_sel_array_cen_b; 
wire            bht_sel_array_clk_en; 
wire    [15:0]  bht_sel_array_din;   
wire            bht_sel_array_gwen;  
wire    [6 :0]  bht_sel_array_index; 
wire    [15:0]  bht_sel_bwen;        
wire            bht_sel_clk;         
wire    [15:0]  bht_sel_data_out;    
wire            bht_sel_en;          
wire            cp0_ifu_icg_en;      
wire            cp0_yy_clk_en;       
wire            forever_cpuclk;      
wire            pad_yy_icg_scan_en;  


//Gate Clk
// &Instance("gated_clk_cell", "x_bht_sel_clk"); @28
gated_clk_cell  x_bht_sel_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bht_sel_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bht_sel_en        ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in(forever_cpuclk), @29
//          .external_en(1'b0), @30
//          .global_en(cp0_yy_clk_en), @31
//          .module_en(cp0_ifu_icg_en), @32
//          .local_en(bht_sel_en), @33
//          .clk_out(bht_sel_clk) @34
//         ); @35

assign bht_sel_en = bht_sel_array_clk_en;

//Instance Logic
// &Instance("ct_spsram_128x16", "x_ct_spsram_128x16"); @40
ct_spsram_128x16  x_ct_spsram_128x16 (
  .A                   (bht_sel_array_index),
  .CEN                 (bht_sel_array_cen_b),
  .CLK                 (bht_sel_clk        ),
  .D                   (bht_sel_array_din  ),
  .GWEN                (bht_sel_array_gwen ),
  .Q                   (bht_sel_data_out   ),
  .WEN                 (bht_sel_bwen       )
);

// &Connect( @41
//          .CLK    (bht_sel_clk        ), @42
//          .Q      (bht_sel_data_out   ), @43
//          .CEN    (bht_sel_array_cen_b), @44
//          .WEN    (bht_sel_bwen       ), @45
//          .D      (bht_sel_array_din  ), @46
//          .A      (bht_sel_array_index), @47
//          .GWEN   (bht_sel_array_gwen ) @48
//        ); @49

// &ModuleEnd; @51
endmodule


