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
module ct_mmu_jtlb_tag_array(
  cp0_mmu_icg_en,
  forever_cpuclk,
  jtlb_tag_cen,
  jtlb_tag_din,
  jtlb_tag_dout,
  jtlb_tag_idx,
  jtlb_tag_wen,
  pad_yy_icg_scan_en
);

// &Ports; @24
input            cp0_mmu_icg_en;    
input            forever_cpuclk;    
input            jtlb_tag_cen;      
input   [195:0]  jtlb_tag_din;      
input   [7  :0]  jtlb_tag_idx;      
input   [4  :0]  jtlb_tag_wen;      
input            pad_yy_icg_scan_en; 
output  [195:0]  jtlb_tag_dout;     

// &Regs; @25

// &Wires; @26
wire             cp0_mmu_icg_en;    
wire             forever_cpuclk;    
wire    [195:0]  jtlb_tag_bwen;     
wire    [195:0]  jtlb_tag_bwen_b;   
wire             jtlb_tag_cen;      
wire             jtlb_tag_cen_b;    
wire             jtlb_tag_clk;      
wire             jtlb_tag_clk_en;   
wire    [195:0]  jtlb_tag_din;      
wire    [195:0]  jtlb_tag_dout;     
wire             jtlb_tag_gwen;     
wire             jtlb_tag_gwen_b;   
wire    [7  :0]  jtlb_tag_idx;      
wire    [4  :0]  jtlb_tag_wen;      
wire             pad_yy_icg_scan_en; 



//==========================================================
//                  Gate Cell
//==========================================================
assign jtlb_tag_clk_en = jtlb_tag_cen;
// &Instance("gated_clk_cell", "x_jtlb_tag_gateclk"); @33
gated_clk_cell  x_jtlb_tag_gateclk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (jtlb_tag_clk      ),
  .external_en        (1'b0              ),
  .global_en          (1'b1              ),
  .local_en           (jtlb_tag_clk_en   ),
  .module_en          (cp0_mmu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect( .clk_in     (forever_cpuclk  ), @34
//           .external_en(1'b0            ), @35
//           .global_en  (1'b1            ), @36
//           .module_en  (cp0_mmu_icg_en  ), @37
//           .local_en   (jtlb_tag_clk_en ), @38
//           .clk_out    (jtlb_tag_clk    ) @39
//          ); @40


assign jtlb_tag_gwen = |jtlb_tag_wen[4:0];
assign jtlb_tag_bwen[195:0] = {
                               {4 {jtlb_tag_wen[4]}},  //fifo
                               {48{jtlb_tag_wen[3]}},  //way3
                               {48{jtlb_tag_wen[2]}},  //way2
                               {48{jtlb_tag_wen[1]}},  //way1
                               {48{jtlb_tag_wen[0]}}   //way0
                              };
assign jtlb_tag_cen_b  = !jtlb_tag_cen;
assign jtlb_tag_gwen_b = !jtlb_tag_gwen;
assign jtlb_tag_bwen_b[195:0] = ~jtlb_tag_bwen[195:0];

// &Instance("ct_spsram_256x204","x_ct_spsram_256x204"); @66
// &Connect( @67
//          .CLK    (jtlb_tag_clk     ), @68
//          .CEN    (jtlb_tag_cen_b   ), @69
//          .GWEN   (jtlb_tag_gwen_b  ), @70
//          .WEN    (jtlb_tag_bwen_b  ), @71
//          .A      (jtlb_tag_idx[7:0]), @72
//          .D      (jtlb_tag_din     ), @73
//          .Q      (jtlb_tag_dout    ) @74
//        ); @75
// &Instance("ct_spsram_512x204","x_ct_spsram_512x204"); @79
// &Connect( @80
//          .CLK    (jtlb_tag_clk     ), @81
//          .CEN    (jtlb_tag_cen_b   ), @82
//          .GWEN   (jtlb_tag_gwen_b  ), @83
//          .WEN    (jtlb_tag_bwen_b  ), @84
//          .A      (jtlb_tag_idx[8:0]), @85
//          .D      (jtlb_tag_din     ), @86
//          .Q      (jtlb_tag_dout    ) @87
//        ); @88

// &Instance("ct_spsram_256x196","x_ct_spsram_256x196"); @94
ct_spsram_256x196  x_ct_spsram_256x196 (
  .A                 (jtlb_tag_idx[7:0]),
  .CEN               (jtlb_tag_cen_b   ),
  .CLK               (jtlb_tag_clk     ),
  .D                 (jtlb_tag_din     ),
  .GWEN              (jtlb_tag_gwen_b  ),
  .Q                 (jtlb_tag_dout    ),
  .WEN               (jtlb_tag_bwen_b  )
);

// &Connect( @95
//          .CLK    (jtlb_tag_clk     ), @96
//          .CEN    (jtlb_tag_cen_b   ), @97
//          .GWEN   (jtlb_tag_gwen_b  ), @98
//          .WEN    (jtlb_tag_bwen_b  ), @99
//          .A      (jtlb_tag_idx[7:0]), @100
//          .D      (jtlb_tag_din     ), @101
//          .Q      (jtlb_tag_dout    ) @102
//        ); @103

// &Instance("ct_spsram_512x196","x_ct_spsram_512x196"); @107
// &Connect( @108
//          .CLK    (jtlb_tag_clk     ), @109
//          .CEN    (jtlb_tag_cen_b   ), @110
//          .GWEN   (jtlb_tag_gwen_b  ), @111
//          .WEN    (jtlb_tag_bwen_b  ), @112
//          .A      (jtlb_tag_idx[8:0]), @113
//          .D      (jtlb_tag_din     ), @114
//          .Q      (jtlb_tag_dout    ) @115
//        ); @116


// &ModuleEnd; @121
endmodule



