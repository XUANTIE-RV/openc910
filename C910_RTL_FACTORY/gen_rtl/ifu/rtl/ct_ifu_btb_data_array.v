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
module ct_ifu_btb_data_array(
  btb_data_cen_b,
  btb_data_clk_en,
  btb_data_din,
  btb_data_dout,
  btb_data_wen,
  btb_index,
  cp0_ifu_icg_en,
  cp0_yy_clk_en,
  forever_cpuclk,
  pad_yy_icg_scan_en
);

// &Ports; @23
input           btb_data_cen_b;     
input           btb_data_clk_en;    
input   [43:0]  btb_data_din;       
input   [3 :0]  btb_data_wen;       
input   [9 :0]  btb_index;          
input           cp0_ifu_icg_en;     
input           cp0_yy_clk_en;      
input           forever_cpuclk;     
input           pad_yy_icg_scan_en; 
output  [87:0]  btb_data_dout;      

// &Regs; @24

// &Wires; @25
wire    [43:0]  btb_data_bwen_bank0; 
wire    [43:0]  btb_data_bwen_bank1; 
wire            btb_data_cen_b;     
wire            btb_data_clk;       
wire            btb_data_clk_en;    
wire    [43:0]  btb_data_din;       
wire    [87:0]  btb_data_dout;      
wire            btb_data_en;        
wire            btb_data_gwen_bank0; 
wire            btb_data_gwen_bank1; 
wire    [3 :0]  btb_data_wen;       
wire    [9 :0]  btb_index;          
wire            cp0_ifu_icg_en;     
wire            cp0_yy_clk_en;      
wire            forever_cpuclk;     
wire            pad_yy_icg_scan_en; 


//Gate Clk
// &Instance("gated_clk_cell", "x_btb_data_clk"); @28
gated_clk_cell  x_btb_data_clk (
  .clk_in             (forever_cpuclk    ),
  .clk_out            (btb_data_clk      ),
  .external_en        (1'b0              ),
  .global_en          (cp0_yy_clk_en     ),
  .local_en           (btb_data_en       ),
  .module_en          (cp0_ifu_icg_en    ),
  .pad_yy_icg_scan_en (pad_yy_icg_scan_en)
);

// &Connect(.clk_in(forever_cpuclk), @29
//          .external_en(1'b0), @30
//          .global_en(cp0_yy_clk_en), @31
//          .module_en(cp0_ifu_icg_en), @32
//          .local_en(btb_data_en), @33
//          .clk_out(btb_data_clk) @34
//         ); @35

assign btb_data_en = btb_data_clk_en;

//Instance Logic
// &Force("bus","btb_index",9,0); @40
//Support Bit Write
assign btb_data_bwen_bank0[43:0] = {{22{btb_data_wen[1]}}, {22{btb_data_wen[0]}}};
assign btb_data_gwen_bank0       = btb_data_wen[1] && btb_data_wen[0];
assign btb_data_bwen_bank1[43:0] = {{22{btb_data_wen[3]}}, {22{btb_data_wen[2]}}};
assign btb_data_gwen_bank1       = btb_data_wen[3] && btb_data_wen[2];

//Icache Size define
// &Instance("ct_spsram_1024x44", "x_ct_spsram_1024x44_bank0"); @49
// &Connect( @50
//          .CLK    (btb_data_clk        ), @51
//          .Q      (btb_data_dout[43:0] ), @52
//          .CEN    (btb_data_cen_b      ), @53
//          .WEN    (btb_data_bwen_bank0 ), @54
//          .D      (btb_data_din        ), @55
//          .A      (btb_index[9:0]      ), @56
//          .GWEN   (btb_data_gwen_bank0 ) @57
//        ); @58
// &Instance("ct_spsram_1024x44", "x_ct_spsram_1024x44_bank1"); @60
// &Connect( @61
//          .CLK    (btb_data_clk        ), @62
//          .Q      (btb_data_dout[87:44] ), @63
//          .CEN    (btb_data_cen_b      ), @64
//          .WEN    (btb_data_bwen_bank1 ), @65
//          .D      (btb_data_din        ), @66
//          .A      (btb_index[9:0]      ), @67
//          .GWEN   (btb_data_gwen_bank1 ) @68
//        ); @69

// &Instance("ct_spsram_512x44", "x_ct_spsram_512x44_bank0"); @74
ct_spsram_512x44  x_ct_spsram_512x44_bank0 (
  .A                   (btb_index[8:0]     ),
  .CEN                 (btb_data_cen_b     ),
  .CLK                 (btb_data_clk       ),
  .D                   (btb_data_din       ),
  .GWEN                (btb_data_gwen_bank0),
  .Q                   (btb_data_dout[43:0]),
  .WEN                 (btb_data_bwen_bank0)
);

// &Connect( @75
//          .CLK    (btb_data_clk        ), @76
//          .Q      (btb_data_dout[43:0] ), @77
//          .CEN    (btb_data_cen_b      ), @78
//          .WEN    (btb_data_bwen_bank0 ), @79
//          .D      (btb_data_din        ), @80
//          .A      (btb_index[8:0]      ), @81
//          .GWEN   (btb_data_gwen_bank0 ) @82
//        ); @83

// &Instance("ct_spsram_512x44", "x_ct_spsram_512x44_bank1"); @85
ct_spsram_512x44  x_ct_spsram_512x44_bank1 (
  .A                    (btb_index[8:0]      ),
  .CEN                  (btb_data_cen_b      ),
  .CLK                  (btb_data_clk        ),
  .D                    (btb_data_din        ),
  .GWEN                 (btb_data_gwen_bank1 ),
  .Q                    (btb_data_dout[87:44]),
  .WEN                  (btb_data_bwen_bank1 )
);

// &Connect( @86
//          .CLK    (btb_data_clk        ), @87
//          .Q      (btb_data_dout[87:44] ), @88
//          .CEN    (btb_data_cen_b      ), @89
//          .WEN    (btb_data_bwen_bank1 ), @90
//          .D      (btb_data_din        ), @91
//          .A      (btb_index[8:0]      ), @92
//          .GWEN   (btb_data_gwen_bank1 ) @93
//        ); @94



// &ModuleEnd; @99
endmodule


