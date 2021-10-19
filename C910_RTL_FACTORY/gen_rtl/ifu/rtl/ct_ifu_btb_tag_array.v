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
module ct_ifu_btb_tag_array(
  btb_index,
  btb_tag_cen_b,
  btb_tag_clk_en,
  btb_tag_din,
  btb_tag_dout,
  btb_tag_wen,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @23
input   [9 :0]  btb_index;         
input           btb_tag_cen_b;     
input           btb_tag_clk_en;    
input   [21:0]  btb_tag_din;       
input   [3 :0]  btb_tag_wen;       
input           cp0_ifu_icg_en;    
input           cp0_yy_clk_en;     
input           forever_cpuclk;    
input           pad_yy_icg_scan_en; 
output  [43:0]  btb_tag_dout;      

// &Regs; @24

// &Wires; @25
wire    [9 :0]  btb_index;         
wire    [21:0]  btb_tag_bwen_bank0; 
wire    [21:0]  btb_tag_bwen_bank1; 
wire            btb_tag_cen_b;     
wire            btb_tag_clk;       
wire            btb_tag_clk_en;    
wire    [21:0]  btb_tag_din;       
wire    [43:0]  btb_tag_dout;      
wire            btb_tag_en;        
wire            btb_tag_gwen_bank0; 
wire            btb_tag_gwen_bank1; 
wire    [3 :0]  btb_tag_wen;       
wire            cp0_ifu_icg_en;    
wire            cp0_yy_clk_en;     
wire            forever_cpuclk;    
wire            pad_yy_icg_scan_en; 


//Gate Clk
// &Instance("gated_clk_cell", "x_btb_tag_clk"); @28
gated_clk_cell  x_btb_tag_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (btb_tag_clk       ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (btb_tag_en        ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in(forever_cpuclk), @29
//          .external_en(1'b0), @30
//          .global_en(cp0_yy_clk_en), @31
//          .module_en(cp0_ifu_icg_en), @32
//          .local_en(btb_tag_en), @33
//          .clk_out(btb_tag_clk) @34
//         ); @35

assign btb_tag_en = btb_tag_clk_en;

//Instance Logic
// &Force("bus","btb_index",9,0); @40
//Support Bit Write
assign btb_tag_bwen_bank0[21:0] = {{11{btb_tag_wen[1]}}, {11{btb_tag_wen[0]}}};
assign btb_tag_bwen_bank1[21:0] = {{11{btb_tag_wen[3]}}, {11{btb_tag_wen[2]}}};
assign btb_tag_gwen_bank0 = btb_tag_wen[1] && btb_tag_wen[0];
assign btb_tag_gwen_bank1 = btb_tag_wen[3] && btb_tag_wen[2];


//Icache Size define
// &Instance("ct_spsram_1024x22", "x_ct_spsram_1024x22_bank0"); @50
// &Connect( @51
//          .CLK    (btb_tag_clk        ), @52
//          .Q      (btb_tag_dout[21:0] ), @53
//          .CEN    (btb_tag_cen_b      ), @54
//          .WEN    (btb_tag_bwen_bank0 ), @55
//          .D      (btb_tag_din        ), @56
//          .A      (btb_index[9:0]     ), @57
//          .GWEN   (btb_tag_gwen_bank0 ) @58
//        ); @59
// &Instance("ct_spsram_1024x22", "x_ct_spsram_1024x22_bank1"); @61
// &Connect( @62
//          .CLK    (btb_tag_clk        ), @63
//          .Q      (btb_tag_dout[43:22] ), @64
//          .CEN    (btb_tag_cen_b      ), @65
//          .WEN    (btb_tag_bwen_bank1 ), @66
//          .D      (btb_tag_din        ), @67
//          .A      (btb_index[9:0]     ), @68
//          .GWEN   (btb_tag_gwen_bank1 ) @69
//        ); @70

// &Instance("ct_spsram_512x22", "x_ct_spsram_512x22_bank0"); @75
ct_spsram_512x22  x_ct_spsram_512x22_bank0 (
  .A                  (btb_index[8:0]    ),
  .CEN                (btb_tag_cen_b     ),
  .CLK                (btb_tag_clk       ),
  .D                  (btb_tag_din       ),
  .GWEN               (btb_tag_gwen_bank0),
  .Q                  (btb_tag_dout[21:0]),
  .WEN                (btb_tag_bwen_bank0)
);

// &Connect( @76
//          .CLK    (btb_tag_clk        ), @77
//          .Q      (btb_tag_dout[21:0] ), @78
//          .CEN    (btb_tag_cen_b      ), @79
//          .WEN    (btb_tag_bwen_bank0 ), @80
//          .D      (btb_tag_din        ), @81
//          .A      (btb_index[8:0]     ), @82
//          .GWEN   (btb_tag_gwen_bank0 ) @83
//        ); @84

// &Instance("ct_spsram_512x22", "x_ct_spsram_512x22_bank1"); @86
ct_spsram_512x22  x_ct_spsram_512x22_bank1 (
  .A                   (btb_index[8:0]     ),
  .CEN                 (btb_tag_cen_b      ),
  .CLK                 (btb_tag_clk        ),
  .D                   (btb_tag_din        ),
  .GWEN                (btb_tag_gwen_bank1 ),
  .Q                   (btb_tag_dout[43:22]),
  .WEN                 (btb_tag_bwen_bank1 )
);

// &Connect( @87
//          .CLK    (btb_tag_clk        ), @88
//          .Q      (btb_tag_dout[43:22] ), @89
//          .CEN    (btb_tag_cen_b      ), @90
//          .WEN    (btb_tag_bwen_bank1 ), @91
//          .D      (btb_tag_din        ), @92
//          .A      (btb_index[8:0]     ), @93
//          .GWEN   (btb_tag_gwen_bank1 ) @94
//        ); @95




// &ModuleEnd; @101
endmodule


