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

// &ModuleBeg; @25
module ct_l2cache_top(
  l2c_data_clk_x,
  l2c_data_din,
  l2c_data_dout,
  l2c_data_index0,
  l2c_data_index1,
  l2c_data_index2,
  l2c_data_index3,
  l2c_data_ram_cen,
  l2c_data_wen,
  l2c_dirty_din,
  l2c_dirty_dout,
  l2c_dirty_gwen,
  l2c_dirty_ram_cen,
  l2c_dirty_wen,
  l2c_tag_clk_x,
  l2c_tag_din,
  l2c_tag_dout,
  l2c_tag_gwen,
  l2c_tag_index,
  l2c_tag_ram_cen,
  l2c_tag_wen,
  pad_yy_icg_scan_en
);

// &Ports; @26
input            l2c_data_clk_x;    
input   [511:0]  l2c_data_din;      
input   [12 :0]  l2c_data_index0;   
input   [12 :0]  l2c_data_index1;   
input   [12 :0]  l2c_data_index2;   
input   [12 :0]  l2c_data_index3;   
input   [3  :0]  l2c_data_ram_cen;  
input   [3  :0]  l2c_data_wen;      
input   [143:0]  l2c_dirty_din;     
input            l2c_dirty_gwen;    
input            l2c_dirty_ram_cen; 
input   [143:0]  l2c_dirty_wen;     
input            l2c_tag_clk_x;     
input   [383:0]  l2c_tag_din;       
input            l2c_tag_gwen;      
input   [8  :0]  l2c_tag_index;     
input            l2c_tag_ram_cen;   
input   [383:0]  l2c_tag_wen;       
input            pad_yy_icg_scan_en; 
output  [511:0]  l2c_data_dout;     
output  [143:0]  l2c_dirty_dout;    
output  [383:0]  l2c_tag_dout;      

// &Regs; @27

// &Wires; @28
wire             l2c_data_clk;      
wire             l2c_data_clk_x;    
wire    [511:0]  l2c_data_din;      
wire    [511:0]  l2c_data_dout;     
wire    [3  :0]  l2c_data_gwen;     
wire    [12 :0]  l2c_data_index0;   
wire    [12 :0]  l2c_data_index1;   
wire    [12 :0]  l2c_data_index2;   
wire    [12 :0]  l2c_data_index3;   
wire    [3  :0]  l2c_data_ram_cen;  
wire    [3  :0]  l2c_data_wen;      
wire    [127:0]  l2c_data_wen0;     
wire    [127:0]  l2c_data_wen1;     
wire    [127:0]  l2c_data_wen2;     
wire    [127:0]  l2c_data_wen3;     
wire    [143:0]  l2c_dirty_din;     
wire    [143:0]  l2c_dirty_dout;    
wire             l2c_dirty_gwen;    
wire             l2c_dirty_ram_cen; 
wire    [143:0]  l2c_dirty_wen;     
wire             l2c_tag_clk;       
wire             l2c_tag_clk_x;     
wire    [383:0]  l2c_tag_din;       
wire    [383:0]  l2c_tag_dout;      
wire             l2c_tag_gwen;      
wire    [8  :0]  l2c_tag_index;     
wire             l2c_tag_ram_cen;   
wire    [383:0]  l2c_tag_wen;       
wire             pad_yy_icg_scan_en; 


assign l2c_tag_clk  = l2c_tag_clk_x;
assign l2c_data_clk = l2c_data_clk_x;

//==========================================================
//                Instance l2c cache array
//==========================================================
//---------------------tag and dirty------------------------
// &Instance("ct_l2cache_tag_array_8way", "x_ct_l2cache_tag_array"); @38
// &Instance("ct_l2cache_tag_array_16way", "x_ct_l2cache_tag_array"); @41
ct_l2cache_tag_array_16way  x_ct_l2cache_tag_array (
  .tag_cen         (l2c_tag_ram_cen),
  .tag_clk         (l2c_tag_clk    ),
  .tag_din         (l2c_tag_din    ),
  .tag_dout        (l2c_tag_dout   ),
  .tag_gwen        (l2c_tag_gwen   ),
  .tag_idx         (l2c_tag_index  ),
  .tag_wen         (l2c_tag_wen    )
);

// &Connect( @43
//          .tag_clk                (l2c_tag_clk          ), @44
//          .tag_cen                (l2c_tag_ram_cen      ), @45
//          .tag_wen                (l2c_tag_wen          ), @46
//          .tag_din                (l2c_tag_din          ), @47
//          .tag_idx                (l2c_tag_index        ), @48
//          .tag_gwen               (l2c_tag_gwen         ), @49
//          .tag_dout               (l2c_tag_dout         )); @50

// &Instance("ct_l2cache_dirty_array_8way", "x_ct_l2cache_dirty_array"); @53
// &Instance("ct_l2cache_dirty_array_16way", "x_ct_l2cache_dirty_array"); @56
ct_l2cache_dirty_array_16way  x_ct_l2cache_dirty_array (
  .dirty_cen         (l2c_dirty_ram_cen),
  .dirty_clk         (l2c_tag_clk      ),
  .dirty_din         (l2c_dirty_din    ),
  .dirty_dout        (l2c_dirty_dout   ),
  .dirty_gwen        (l2c_dirty_gwen   ),
  .dirty_idx         (l2c_tag_index    ),
  .dirty_wen         (l2c_dirty_wen    )
);

// &Connect( @58
//          .dirty_clk              (l2c_tag_clk            ), @59
//          .dirty_cen              (l2c_dirty_ram_cen      ), @60
//          .dirty_idx              (l2c_tag_index          ), @61
//          .dirty_wen              (l2c_dirty_wen          ), @62
//          .dirty_din              (l2c_dirty_din          ), @63
//          .dirty_gwen             (l2c_dirty_gwen         ), @64
//          .dirty_dout             (l2c_dirty_dout         )); @65

//-------------------------data-----------------------------
assign l2c_data_gwen[3:0]   = l2c_data_wen[3:0];
assign l2c_data_wen0[127:0] = {128{l2c_data_wen[0]}};
assign l2c_data_wen1[127:0] = {128{l2c_data_wen[1]}};
assign l2c_data_wen2[127:0] = {128{l2c_data_wen[2]}};
assign l2c_data_wen3[127:0] = {128{l2c_data_wen[3]}};

// &Instance("ct_l2cache_data_array", "x_ct_l2cache_data_array_bank0"); @74
ct_l2cache_data_array  x_ct_l2cache_data_array_bank0 (
  .data_cen             (l2c_data_ram_cen[0] ),
  .data_clk             (l2c_data_clk        ),
  .data_din             (l2c_data_din[127:0] ),
  .data_dout            (l2c_data_dout[127:0]),
  .data_gwen            (l2c_data_gwen[0]    ),
  .data_idx             (l2c_data_index0     ),
  .data_wen             (l2c_data_wen0       ),
  .pad_yy_icg_scan_en   (pad_yy_icg_scan_en  )
);

// &Connect( @75
//          .data_clk               (l2c_data_clk           ), @76
//          .data_cen               (l2c_data_ram_cen[0]    ), @77
//          .data_wen               (l2c_data_wen0          ), @78
//          .data_din               (l2c_data_din[127:0]    ), @79
//          .data_idx               (l2c_data_index0        ), @80
//          .data_gwen              (l2c_data_gwen[0]       ), @81
//          .data_dout              (l2c_data_dout[127:0]   )); @82


// &Instance("ct_l2cache_data_array", "x_ct_l2cache_data_array_bank1"); @85
ct_l2cache_data_array  x_ct_l2cache_data_array_bank1 (
  .data_cen               (l2c_data_ram_cen[1]   ),
  .data_clk               (l2c_data_clk          ),
  .data_din               (l2c_data_din[255:128] ),
  .data_dout              (l2c_data_dout[255:128]),
  .data_gwen              (l2c_data_gwen[1]      ),
  .data_idx               (l2c_data_index1       ),
  .data_wen               (l2c_data_wen1         ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( @86
//          .data_clk               (l2c_data_clk           ), @87
//          .data_cen               (l2c_data_ram_cen[1]    ), @88
//          .data_wen               (l2c_data_wen1          ), @89
//          .data_din               (l2c_data_din[255:128]  ), @90
//          .data_idx               (l2c_data_index1        ), @91
//          .data_gwen              (l2c_data_gwen[1]       ), @92
//          .data_dout              (l2c_data_dout[255:128] )); @93

// &Instance("ct_l2cache_data_array", "x_ct_l2cache_data_array_bank2"); @95
ct_l2cache_data_array  x_ct_l2cache_data_array_bank2 (
  .data_cen               (l2c_data_ram_cen[2]   ),
  .data_clk               (l2c_data_clk          ),
  .data_din               (l2c_data_din[383:256] ),
  .data_dout              (l2c_data_dout[383:256]),
  .data_gwen              (l2c_data_gwen[2]      ),
  .data_idx               (l2c_data_index2       ),
  .data_wen               (l2c_data_wen2         ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( @96
//          .data_clk               (l2c_data_clk           ), @97
//          .data_cen               (l2c_data_ram_cen[2]    ), @98
//          .data_wen               (l2c_data_wen2          ), @99
//          .data_din               (l2c_data_din[383:256]  ), @100
//          .data_idx               (l2c_data_index2        ), @101
//          .data_gwen              (l2c_data_gwen[2]       ), @102
//          .data_dout              (l2c_data_dout[383:256] )); @103

// &Instance("ct_l2cache_data_array", "x_ct_l2cache_data_array_bank3"); @105
ct_l2cache_data_array  x_ct_l2cache_data_array_bank3 (
  .data_cen               (l2c_data_ram_cen[3]   ),
  .data_clk               (l2c_data_clk          ),
  .data_din               (l2c_data_din[511:384] ),
  .data_dout              (l2c_data_dout[511:384]),
  .data_gwen              (l2c_data_gwen[3]      ),
  .data_idx               (l2c_data_index3       ),
  .data_wen               (l2c_data_wen3         ),
  .pad_yy_icg_scan_en     (pad_yy_icg_scan_en    )
);

// &Connect( @106
//          .data_clk               (l2c_data_clk           ), @107
//          .data_cen               (l2c_data_ram_cen[3]    ), @108
//          .data_wen               (l2c_data_wen3          ), @109
//          .data_din               (l2c_data_din[511:384]  ), @110
//          .data_idx               (l2c_data_index3        ), @111
//          .data_gwen              (l2c_data_gwen[3]       ), @112
//          .data_dout              (l2c_data_dout[511:384] )); @113

// &Instance("ct_l2cache_tag_ecc_array_8way", "x_ct_l2cache_tag_ecc_array"); @117
// &Instance("ct_l2cache_tag_ecc_array_16way", "x_ct_l2cache_tag_ecc_array"); @120
// &Connect( @122
//          .ecc_clk               (l2c_tag_clk           ), @123
//          .ecc_cen               (l2c_tag_ram_cen       ), @124
//          .ecc_gwen              (l2c_tag_gwen          ), @125
//          .ecc_idx               (l2c_tag_index         ), @126
//          .ecc_wen               (l2c_tag_ecc_wen       ), @127
//          .ecc_din               (l2c_tag_ecc_din       ), @128
//          .ecc_dout              (l2c_tag_ecc_dout      )); @129
// &Instance("ct_l2cache_dirty_ecc_array_8way", "x_ct_l2cache_dirty_ecc_array"); @132
// &Instance("ct_l2cache_dirty_ecc_array_16way", "x_ct_l2cache_dirty_ecc_array"); @135
// &Connect( @137
//          .ecc_clk               (l2c_tag_clk           ), @138
//          .ecc_cen               (l2c_dirty_ram_cen     ), @139
//          .ecc_idx               (l2c_tag_index         ), @140
//          .ecc_gwen              (l2c_dirty_gwen        ), @141
//          .ecc_wen               (l2c_dirty_ecc_wen     ), @142
//          .ecc_din               (l2c_dirty_ecc_din     ), @143
//          .ecc_dout              (l2c_dirty_ecc_dout    )); @144
// &Instance("ct_l2cache_data_ecc_array", "x_ct_l2cache_data_ecc_array"); @149
// &Connect( @150
//          .ecc_clk               (l2c_data_clk          ), @151
//          .ecc_cen               (l2c_ecc_ram_cen       ), @152
//          .ecc_wen               (l2c_ecc_wen_extend    ), @153
//          .ecc_din               (l2c_ecc_din           ), @154
//          .ecc_idx               (l2c_ecc_index         ), @155
//          .ecc_gwen              (l2c_ecc_gwen          ), @156
//          .ecc_dout              (l2c_ecc_dout          )); @157

// &Force("nonport","l2c_tag_setup_violation"); @176
// &Force("nonport","l2c_tag_latency_violation"); @190
// &Force("nonport","l2c_dirty_setup_violation"); @222
// &Force("nonport","l2c_dirty_latency_violation"); @236
// &Force("nonport","l2c_data0_setup_violation"); @268
// &Force("nonport","l2c_data0_latency_violation"); @282
// &Force("nonport","l2c_data1_setup_violation"); @314
// &Force("nonport","l2c_data1_latency_violation"); @328
// &Force("nonport","l2c_data2_setup_violation"); @360
// &Force("nonport","l2c_data2_latency_violation"); @374
// &Force("nonport","l2c_data3_setup_violation"); @406
// &Force("nonport","l2c_data3_latency_violation"); @420

// &ModuleEnd; @440
endmodule




