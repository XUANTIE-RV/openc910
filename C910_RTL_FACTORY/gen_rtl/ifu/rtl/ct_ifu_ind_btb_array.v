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
module ct_ifu_ind_btb_array(
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  forever_cpuclk,
  ind_btb_cen_b,
  ind_btb_clk_en,
  ind_btb_data_in,
  ind_btb_dout,
  ind_btb_index,
  ind_btb_wen_b,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           cp0_ifu_icg_en;    
input           cp0_yy_clk_en;     
input           forever_cpuclk;    
input           ind_btb_cen_b;     
input           ind_btb_clk_en;    
input   [22:0]  ind_btb_data_in;   
input   [7 :0]  ind_btb_index;     
input           ind_btb_wen_b;     
input           pad_yy_icg_scan_en; 
output  [22:0]  ind_btb_dout;      

// &Regs; @24

// &Wires; @25
wire            cp0_ifu_icg_en;    
wire            cp0_yy_clk_en;     
wire            forever_cpuclk;    
wire    [22:0]  ind_btb_bwen;      
wire            ind_btb_cen_b;     
wire            ind_btb_clk;       
wire            ind_btb_clk_en;    
wire    [22:0]  ind_btb_data_in;   
wire    [22:0]  ind_btb_dout;      
wire    [7 :0]  ind_btb_index;     
wire            ind_btb_local_en;  
wire            ind_btb_wen_b;     
wire            pad_yy_icg_scan_en; 


//Gate Clk
// &Instance("gated_clk_cell", "x_ind_btb_clk"); @28
gated_clk_cell  x_ind_btb_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (ind_btb_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (ind_btb_local_en  ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in(forever_cpuclk), @29
//          .external_en(1'b0), @30
//          .global_en(cp0_yy_clk_en), @31
//          .module_en(cp0_ifu_icg_en), @32
//          .local_en(ind_btb_local_en), @33
//          .clk_out(ind_btb_clk) @34
//         ); @35

assign ind_btb_local_en   = ind_btb_clk_en;
assign ind_btb_bwen[22:0] = {23{ind_btb_wen_b}};
//Instance Logic
// &Instance("ct_spsram_256x23", "x_ct_spsram_256x23"); @40
ct_spsram_256x23  x_ct_spsram_256x23 (
  .A               (ind_btb_index  ),
  .CEN             (ind_btb_cen_b  ),
  .CLK             (ind_btb_clk    ),
  .D               (ind_btb_data_in),
  .GWEN            (ind_btb_wen_b  ),
  .Q               (ind_btb_dout   ),
  .WEN             (ind_btb_bwen   )
);

// &Connect( @41
//          .CLK    (ind_btb_clk    ), @42
//          .Q      (ind_btb_dout   ), @43
//          .CEN    (ind_btb_cen_b  ), @44
//          .WEN    (ind_btb_bwen   ), @45
//          .D      (ind_btb_data_in), @46
//          .A      (ind_btb_index  ), @47
//          .GWEN   (ind_btb_wen_b  ) @48
//        ); @49

// &ModuleEnd; @51
endmodule


