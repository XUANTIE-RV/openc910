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

// &ModuleBeg; @23
module ct_mmu_jtlb_data_array(
  cp0_mmu_icg_en,
  forever_cpuclk,
  jtlb_data_cen0,
  jtlb_data_cen1,
  jtlb_data_din,
  jtlb_data_dout0,
  jtlb_data_dout1,
  jtlb_data_idx,
  jtlb_data_wen,
  pad_yy_icg_scan_en
);

// &Ports; @24
input           cp0_mmu_icg_en;    
input           forever_cpuclk;    
input           jtlb_data_cen0;    
input           jtlb_data_cen1;    
input   [83:0]  jtlb_data_din;     
input   [7 :0]  jtlb_data_idx;     
input   [3 :0]  jtlb_data_wen;     
input           pad_yy_icg_scan_en; 
output  [83:0]  jtlb_data_dout0;   
output  [83:0]  jtlb_data_dout1;   

// &Regs; @25

// &Wires; @26
wire            cp0_mmu_icg_en;    
wire            forever_cpuclk;    
wire    [83:0]  jtlb_data_bwen0;   
wire    [83:0]  jtlb_data_bwen0_b; 
wire    [83:0]  jtlb_data_bwen1;   
wire    [83:0]  jtlb_data_bwen1_b; 
wire            jtlb_data_cen0;    
wire            jtlb_data_cen0_b;  
wire            jtlb_data_cen1;    
wire            jtlb_data_cen1_b;  
wire            jtlb_data_clk;     
wire            jtlb_data_clk_en;  
wire    [83:0]  jtlb_data_din;     
wire    [83:0]  jtlb_data_dout0;   
wire    [83:0]  jtlb_data_dout1;   
wire            jtlb_data_gwen0;   
wire            jtlb_data_gwen0_b; 
wire            jtlb_data_gwen1;   
wire            jtlb_data_gwen1_b; 
wire    [7 :0]  jtlb_data_idx;     
wire    [3 :0]  jtlb_data_wen;     
wire            pad_yy_icg_scan_en; 



//==========================================================
//                  Gate Cell
//==========================================================
assign jtlb_data_clk_en = jtlb_data_cen1 || jtlb_data_cen0; 
// &Instance("gated_clk_cell", "x_jtlb_data_gateclk"); @33
gated_clk_cell  x_jtlb_data_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (jtlb_data_clk     ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (jtlb_data_clk_en  ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk  ), @34
//           .external_en(1'b0            ), @35
//           .global_en  (1'b1            ), @36
//           .module_en  (cp0_mmu_icg_en  ), @37
//           .local_en   (jtlb_data_clk_en), @38
//           .clk_out    (jtlb_data_clk   ) @39
//          ); @40


assign jtlb_data_gwen1        = |jtlb_data_wen[3:2];
assign jtlb_data_bwen1[83:0] = {
                                 {42{jtlb_data_wen[3]}},
                                 {42{jtlb_data_wen[2]}}
                                };


assign jtlb_data_gwen0        = |jtlb_data_wen[1:0];
assign jtlb_data_bwen0[83:0] = {
                                 {42{jtlb_data_wen[1]}},
                                 {42{jtlb_data_wen[0]}}
                                };

assign jtlb_data_cen1_b = !jtlb_data_cen1;
assign jtlb_data_cen0_b = !jtlb_data_cen0;

assign jtlb_data_gwen1_b = !jtlb_data_gwen1;
assign jtlb_data_gwen0_b = !jtlb_data_gwen0;

assign jtlb_data_bwen1_b[83:0] = ~jtlb_data_bwen1[83:0];
assign jtlb_data_bwen0_b[83:0] = ~jtlb_data_bwen0[83:0];

// &Instance("ct_spsram_256x88","x_ct_spsram_256x88_bank1"); @80
// &Connect( @81
//          .CLK    (jtlb_data_clk     ), @82
//          .CEN    (jtlb_data_cen1_b  ), @83
//          .GWEN   (jtlb_data_gwen1_b ), @84
//          .WEN    (jtlb_data_bwen1_b ), @85
//          .A      (jtlb_data_idx[7:0]), @86
//          .D      (jtlb_data_din     ), @87
//          .Q      (jtlb_data_dout1   ) @88
//        ); @89
// &Instance("ct_spsram_256x88","x_ct_spsram_256x88_bank0"); @91
// &Connect( @92
//          .CLK    (jtlb_data_clk     ), @93
//          .CEN    (jtlb_data_cen0_b  ), @94
//          .GWEN   (jtlb_data_gwen0_b ), @95
//          .WEN    (jtlb_data_bwen0_b ), @96
//          .A      (jtlb_data_idx[7:0]), @97
//          .D      (jtlb_data_din     ), @98
//          .Q      (jtlb_data_dout0   ) @99
//        ); @100
// &Instance("ct_spsram_512x88","x_ct_spsram_512x88_bank1"); @105
// &Connect( @106
//          .CLK    (jtlb_data_clk     ), @107
//          .CEN    (jtlb_data_cen1_b  ), @108
//          .GWEN   (jtlb_data_gwen1_b ), @109
//          .WEN    (jtlb_data_bwen1_b ), @110
//          .A      (jtlb_data_idx[8:0]), @111
//          .D      (jtlb_data_din     ), @112
//          .Q      (jtlb_data_dout1   ) @113
//        ); @114
// &Instance("ct_spsram_512x88","x_ct_spsram_512x88_bank0"); @116
// &Connect( @117
//          .CLK    (jtlb_data_clk     ), @118
//          .CEN    (jtlb_data_cen0_b  ), @119
//          .GWEN   (jtlb_data_gwen0_b ), @120
//          .WEN    (jtlb_data_bwen0_b ), @121
//          .A      (jtlb_data_idx[8:0]), @122
//          .D      (jtlb_data_din     ), @123
//          .Q      (jtlb_data_dout0   ) @124
//        ); @125

// &Instance("ct_spsram_256x84","x_ct_spsram_256x84_bank1"); @131
ct_spsram_256x84  x_ct_spsram_256x84_bank1 (
  .A                  (jtlb_data_idx[7:0]),
  .CEN                (jtlb_data_cen1_b  ),
  .CLK                (jtlb_data_clk     ),
  .D                  (jtlb_data_din     ),
  .GWEN               (jtlb_data_gwen1_b ),
  .Q                  (jtlb_data_dout1   ),
  .WEN                (jtlb_data_bwen1_b )
);

// &Connect( @132
//          .CLK    (jtlb_data_clk     ), @133
//          .CEN    (jtlb_data_cen1_b  ), @134
//          .GWEN   (jtlb_data_gwen1_b ), @135
//          .WEN    (jtlb_data_bwen1_b ), @136
//          .A      (jtlb_data_idx[7:0]), @137
//          .D      (jtlb_data_din     ), @138
//          .Q      (jtlb_data_dout1   ) @139
//        ); @140

// &Instance("ct_spsram_256x84","x_ct_spsram_256x84_bank0"); @142
ct_spsram_256x84  x_ct_spsram_256x84_bank0 (
  .A                  (jtlb_data_idx[7:0]),
  .CEN                (jtlb_data_cen0_b  ),
  .CLK                (jtlb_data_clk     ),
  .D                  (jtlb_data_din     ),
  .GWEN               (jtlb_data_gwen0_b ),
  .Q                  (jtlb_data_dout0   ),
  .WEN                (jtlb_data_bwen0_b )
);

// &Connect( @143
//          .CLK    (jtlb_data_clk     ), @144
//          .CEN    (jtlb_data_cen0_b  ), @145
//          .GWEN   (jtlb_data_gwen0_b ), @146
//          .WEN    (jtlb_data_bwen0_b ), @147
//          .A      (jtlb_data_idx[7:0]), @148
//          .D      (jtlb_data_din     ), @149
//          .Q      (jtlb_data_dout0   ) @150
//        ); @151

// &Instance("ct_spsram_512x84","x_ct_spsram_512x84_bank1"); @155
// &Connect( @156
//          .CLK    (jtlb_data_clk     ), @157
//          .CEN    (jtlb_data_cen1_b  ), @158
//          .GWEN   (jtlb_data_gwen1_b ), @159
//          .WEN    (jtlb_data_bwen1_b ), @160
//          .A      (jtlb_data_idx[8:0]), @161
//          .D      (jtlb_data_din     ), @162
//          .Q      (jtlb_data_dout1   ) @163
//        ); @164
// &Instance("ct_spsram_512x84","x_ct_spsram_512x84_bank0"); @166
// &Connect( @167
//          .CLK    (jtlb_data_clk     ), @168
//          .CEN    (jtlb_data_cen0_b  ), @169
//          .GWEN   (jtlb_data_gwen0_b ), @170
//          .WEN    (jtlb_data_bwen0_b ), @171
//          .A      (jtlb_data_idx[8:0]), @172
//          .D      (jtlb_data_din     ), @173
//          .Q      (jtlb_data_dout0   ) @174
//        ); @175


// &ModuleEnd; @180
endmodule


