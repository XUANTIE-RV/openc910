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
module ct_ifu_bht_pre_array(
  bht_pre_array_clk_en,
  bht_pre_data_out,
  bht_pred_array_cen_b,
  bht_pred_array_din,
  bht_pred_array_gwen,
  bht_pred_array_index,
  bht_pred_bwen,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           bht_pre_array_clk_en; 
input           bht_pred_array_cen_b; 
input   [63:0]  bht_pred_array_din;  
input           bht_pred_array_gwen; 
input   [9 :0]  bht_pred_array_index; 
input   [63:0]  bht_pred_bwen;       
input           cp0_ifu_icg_en;      
input           cp0_yy_clk_en;       
input           forever_cpuclk;      
input           pad_yy_icg_scan_en;  
output  [63:0]  bht_pre_data_out;    

// &Regs; @24

// &Wires; @25
wire            bht_pre_array_clk_en; 
wire            bht_pre_clk;         
wire    [63:0]  bht_pre_data_out;    
wire            bht_pre_en;          
wire            bht_pred_array_cen_b; 
wire    [63:0]  bht_pred_array_din;  
wire            bht_pred_array_gwen; 
wire    [9 :0]  bht_pred_array_index; 
wire    [63:0]  bht_pred_bwen;       
wire            cp0_ifu_icg_en;      
wire            cp0_yy_clk_en;       
wire            forever_cpuclk;      
wire            pad_yy_icg_scan_en;  


//Gate Clk
// &Instance("gated_clk_cell", "x_bht_pre_clk"); @28
gated_clk_cell  x_bht_pre_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (bht_pre_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (bht_pre_en        ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in(forever_cpuclk), @29
//          .external_en(1'b0), @30
//          .global_en(cp0_yy_clk_en), @31
//          .module_en(cp0_ifu_icg_en), @32
//          .local_en(bht_pre_en), @33
//          .clk_out(bht_pre_clk) @34
//         ); @35

assign bht_pre_en = bht_pre_array_clk_en;

//Instance Logic
// &Instance("ct_spsram_1024x64", "x_ct_spsram_1024x64"); @40
ct_spsram_1024x64  x_ct_spsram_1024x64 (
  .A                    (bht_pred_array_index),
  .CEN                  (bht_pred_array_cen_b),
  .CLK                  (bht_pre_clk         ),
  .D                    (bht_pred_array_din  ),
  .GWEN                 (bht_pred_array_gwen ),
  .Q                    (bht_pre_data_out    ),
  .WEN                  (bht_pred_bwen       )
);

// &Connect( @41
//          .CLK    (bht_pre_clk         ), @42
//          .Q      (bht_pre_data_out    ), @43
//          .CEN    (bht_pred_array_cen_b), @44
//          .WEN    (bht_pred_bwen       ), @45
//          .D      (bht_pred_array_din  ), @46
//          .A      (bht_pred_array_index), @47
//          .GWEN   (bht_pred_array_gwen ) @48
//        ); @49

// &ModuleEnd; @51
endmodule


